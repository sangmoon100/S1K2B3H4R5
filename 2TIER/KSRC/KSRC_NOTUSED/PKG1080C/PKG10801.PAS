unit pkg10801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DB, DBTables, Qrprntr,
  TimeFtp, kylib1, Pass, DateLib, Calen2, Gauges,FormMon2, Func, Ora,
  MemDS, DBAccess ;

type
  TMainForm = class(TForm)
    Shape1: TShape;
    Image1: TImage;
    Panel1: TPanel;
    Phelpmsg: TPanel;
    Label1: TLabel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    MEfr: TMaskEdit;
    MEto: TMaskEdit;
    SBfr: TSpeedButton;
    SBto: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    RB_empnoOrder: TRadioButton;
    RB_famifrdateOrder: TRadioButton;
    GroupBox1: TGroupBox;
    RBmonitor: TRadioButton;
    RBprinter: TRadioButton;
    RBfile: TRadioButton;
    BBrun: TBitBtn;
    BBsetup: TBitBtn;
    BBhelp: TBitBtn;
    BBexit: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel2: TPanel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    QueryF: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure MEfrChange(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBtoClick(Sender: TObject);

  private
    { Private declarations }
    Procedure ShowPreView;
    Function  AddSpace ( data : String; Size : Integer ) : String;
    Procedure LoadData;

  public
    { Public declarations }
    Start : Integer;
    procedure GetYYMM(argyymm :TmaskEdit);
  end;

Type
  TFam01 = Record   {  Local 자료화일의 Record 선언 }
      empno      : Array[0..4]  of Char;       { 사번       }
      korname    : Array[0..10] of Char;       { 성명       }
      firstyn    : Array[0..8]  of Char;       { 장남여부   }
      faminame   : Array[0..8]  of Char;       { 가족명     }
      famikind   : Array[0..9]  of Char;       { 가족구분   }
      famirel    : Array[0..9]  of Char;       { 가족관계   }
      famibdate  : Array[0..10] of Char;       { 생년월일   }
      appdate    : Array[0..10] of Char;       { 신청일     }
      famifrdate : Array[0..10] of Char;       { 지급개시월 }
      famitodate : Array[0..10] of Char;       { 해지월     }
      lineskip   : Array[0..1]  of char;       { 다음줄로   }
  end;

var
  MainForm: TMainForm;
  Fam01  : TFam01;  { Local 자료화일의 Record 명 선언 }
  Running: Boolean;

implementation
{$R *.DFM}

uses
    pkg10802, pkg10803;

procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;
     Running := True;

     OraConnect;
     L_UserName.Caption := Pkorname + '(' +pempno+ ')';
     Application.ProcessMessages;

     L_Curdate.Caption := fn_GetDateStr;

     MEfr.Text := Copy(RemoveChar(L_Curdate.Caption,'/'),1,6);
     MEto.Text := Copy(RemoveChar(L_Curdate.Caption,'/'),1,6);

     Phelpmsg.Caption := '  초기자료를 읽고 있습니다.';
     Application.ProcessMessages;

     Phelpmsg.Caption := '';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
end;

Procedure TMainForm.ShowPreView;
begin

end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TMainForm.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure TMainForm.BBrunClick(Sender: TObject);
var
     FilePointer : File of TFam01;  { Local 자료화일 Record의 화일 Type 선언 }
     Inwon: Integer;
begin
     Phelpmsg.Caption := '';
     Gauge1.Progress  := 0;
     if fn_IsDate(MEfr.Text+'01') = False then
     begin
          MessageBox(Handle, '지급월from을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEfr.SetFocus;
          exit;
     end;
     if fn_IsDate(MEto.Text+'01') = False then
     begin
          MessageBox(Handle, '지급월from을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEto.SetFocus;
          exit;
     end;
     if MEfr.Text > MEto.Text then
     begin
          MessageBox(Handle, '지급월범위(from~to)를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEto.SetFocus;
          exit;
     end;

     Phelpmsg.Caption := '  해당하는 자료를 추출중입니다.';
     Application.ProcessMessages;

     LoadData;

     if QueryF.RecordCount = 0 then
     begin
          QueryF.Close;
          MessageBox(Handle, '해당하는 자료가 하나도 없습니다.', '처리오류', MB_ICONWARNING);
          System.Exit;
     end;


     if RBmonitor.Checked = True then
     begin
          printform := TPrintform.Create(application);
          PrintForm.QuickReport1.PreView;
     end
     else if RBprinter.Checked = True then
     begin
          printform := TPrintform.Create(application);
          printform.user_preview := false;
          PrintForm.QuickReport1.Print;
          QRprinter.CleanUp;
          printform.free;
          previewform.free;
     end
     else
     begin
          if SaveDialog1.Execute then
          begin
               Assignfile(FilePointer, SaveDialog1.FileName);
               System.Rewrite(FilePointer);
          end
          else
          begin
               QueryF.Close;
               System.Exit;
          end;

          Inwon := 0;
          FillChar(Fam01, SizeOf(Fam01), ' ');
          StrPcopy(Fam01.empno,copy(MEfr.text,1,4)+'.'+copy(MEfr.text,5,2)+' ~ '+
                               copy(MEto.text,1,4)+'.'+copy(MEto.text,5,2));
          StrPcopy(Fam01.famikind,'   가족수당 관리대장');
          StrPcopy(Fam01.lineskip,#13#10);
          System.Write(FilePointer, Fam01);
          FillChar(Fam01, SizeOf(Fam01), ' ');

          StrPcopy(Fam01.empno,AddSpace('사번',5));
          StrPcopy(Fam01.korname,AddSpace('성명',11));
          StrPcopy(Fam01.firstyn,AddSpace('장남여부',9));
          StrPcopy(Fam01.faminame,AddSpace('가족성명',9));
          StrPcopy(Fam01.famikind,AddSpace('가족관계',10));
          StrPcopy(Fam01.famirel,AddSpace('가족구분',10));
          StrPcopy(Fam01.famibdate,AddSpace('생년월일',11));
          StrPcopy(Fam01.appdate,AddSpace('신청일',11));
          StrPcopy(Fam01.famifrdate,AddSpace('지급개시월',11));
          StrPcopy(Fam01.famitodate,AddSpace('해지월',11));
          StrPcopy(Fam01.lineskip,#13#10);
          System.Write(FilePointer, Fam01);
          FillChar(Fam01, SizeOf(Fam01), ' ');

          while not QueryF.Eof do
          begin
               Inc(Inwon);
               Gauge1.Progress := (Inwon * 100) div QueryF.RecordCount;
               Application.ProcessMessages;

               StrPcopy(Fam01.empno,AddSpace(QueryF.FieldByName('empno').AsString,5));
               StrPcopy(Fam01.korname,AddSpace(QueryF.FieldByName('korname').AsString,11));
               StrPcopy(Fam01.firstyn,AddSpace(QueryF.FieldByName('firstyn').AsString,9));
               StrPcopy(Fam01.faminame,AddSpace(QueryF.FieldByName('faminame').AsString,9));
               StrPcopy(Fam01.famikind,AddSpace(QueryF.FieldByName('famikind').AsString,10));
               StrPcopy(Fam01.famirel,AddSpace(QueryF.FieldByName('famirel').AsString,10));

               StrPcopy(Fam01.famibdate,AddSpace(Copy(QueryF.FieldByName('famibdate').AsString,1,4)+'.'+
                                                 Copy(QueryF.FieldByName('famibdate').AsString,5,2)+'.'+
                                                 Copy(QueryF.FieldByName('famibdate').AsString,7,2),11));

               StrPcopy(Fam01.appdate,AddSpace(Copy(QueryF.FieldByName('appdate').AsString,1,4)+'.'+
                                               Copy(QueryF.FieldByName('appdate').AsString,5,2)+'.'+
                                               Copy(QueryF.FieldByName('appdate').AsString,7,2),11));

               StrPcopy(Fam01.famifrdate,AddSpace(Copy(QueryF.FieldByName('famifrdate').AsString,1,4)+'.'+
                                                  Copy(QueryF.FieldByName('famifrdate').AsString,5,2),11));

               StrPcopy(Fam01.famitodate,AddSpace(Copy(QueryF.FieldByName('famitodate').AsString,1,4)+'.'+
                                                  Copy(QueryF.FieldByName('famitodate').AsString,5,2),11));
               StrPcopy(Fam01.lineskip,#13#10);
               System.Write(FilePointer,Fam01);
               FillChar(Fam01, SizeOf(Fam01), ' ');
               QueryF.Next;
          end;
          System.Close(FilePointer);
     end;
     QueryF.Close;

     Phelpmsg.Caption := '  출력을 완료하였습니다.';
     Gauge1.Progress := 0;
     Application.ProcessMessages;
end;

{자료화일을 선택했을때 자료를 부르는 쿼리........................................}
Procedure TMainForm.LoadData;
begin
  QueryF.Close;
  QueryF.SQL.Clear;
  QueryF.SQL.ADD(' select a.empno,      a.korname,                                       ');
  QueryF.SQL.ADD('        b.firstyn,    a.faminame,                                      ');
  //QueryF.SQL.ADD('        a.famikind,                                                    ');
  QueryF.SQL.ADD('        (select codename from pyccode                                  ');
  QueryF.SQL.ADD('          where codeid = ''K410''                                      ');
  QueryF.SQL.ADD('            and codeno = a.famikind) famikind,                         ');
  QueryF.SQL.ADD('        (select codename from pyccode                                  ');
  QueryF.SQL.ADD('          where codeid = ''I211''                                      ');
  QueryF.SQL.ADD('            and codeno = a.famirel) famirel,                           ');
  QueryF.SQL.ADD('        a.famikind,   a.famirel,                                       ');
  QueryF.SQL.ADD('        a.famibdate,  a.appdate,                                       ');
  QueryF.SQL.ADD('        a.famifrdate, a.famitodate                                     ');
  QueryF.SQL.ADD('   from pkmfmmas a, pkmpmas b                                          ');
  QueryF.SQL.ADD('  where (a.empno = b.empno ) and                                       ');
  QueryF.SQL.ADD('        ((substr(a.famifrdate,1,6) between :frdate and :todate) or     ');
  QueryF.SQL.ADD('         (substr(a.famitodate,1,6) between :addfrdate and :addtodate)) ');

  if RB_empnoOrder.Checked then
    QueryF.SQL.ADD('   order by a.empno, a.famifrdate ')
  else
    QueryF.SQL.ADD('   order by a.famifrdate, a.appdate, a.empno ');

  QueryF.ParamByName('frdate').AsString := MEfr.Text;
  QueryF.ParamByName('todate').AsString := MEto.Text;
  QueryF.ParamByName('ADDfrdate').AsString := CalcMonth(MEfr.Text,1);
  QueryF.ParamByName('ADDtodate').AsString := CalcMonth(MEto.Text,1);
  QueryF.Open;
end;

procedure TMainForm.MEfrChange(Sender: TObject);
begin
  if TMaskEdit(Sender).Name = 'MEfr' then
  begin
       if Length(MEfr.Text) = 6 then
       begin
            if fn_IsDate(MEfr.Text+'01') = False then
            begin
                 Phelpmsg.Caption := '  지급월을 정확히 입력하세요.';
                 MEfr.SetFocus;
                 exit;
            end;
       end;
  end;
  if TMaskEdit(Sender).Name = 'MEto' then
  begin
       if Length(MEto.Text) = 6 then
       begin
            if fn_IsDAte(MEto.Text+'01') = False then
            begin
                 Phelpmsg.Caption := '  지급월을 정확히 입력하세요.';
                 MEto.SetFocus;
                 exit;
            end;
       end;
  end;
end;

procedure TMainForm.SBfrClick(Sender: TObject);
begin
     GetYYMM(MEfr);
end;

procedure TMainForm.GetYYMM(argyymm :TmaskEdit);
var
     Month2Form : TMonth2Form;
begin
     Try
          Month2Form := TMonth2Form.Create(nil);
          Month2Form.Pyyyymm := argyymm.Text ;
          Month2Form.ShowModal;
          argyymm.Text   := Month2Form.Daycaption;
     Finally
          Month2Form.Free;
     End;
end;

Function TMainForm.AddSpace ( data : String; Size : Integer ) : String;
var
     i : Integer;
     s : String;
begin
     s := '';
     if (size - Length(data)) = 0 then
     begin
          AddSpace := ''+data;
     end
     else
     begin
          for i := 1 to size - Length(data) do
          begin
               s := s+ ' ';
          end;
     end;
     AddSpace := s + data;
end;

procedure TMainForm.SBtoClick(Sender: TObject);
begin
     GetYYMM(MEto);
end;

end.
