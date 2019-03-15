
unit pkg10701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DB, DBTables,
  TimeFtp, kylib1, Calen2, Pass, Datelib, Gauges, FormMon2, MemDS,
  DBAccess, Ora, Func;

type
  TMainForm = class(TForm)
    Shape1: TShape;
    Image1: TImage;
    Label1: TLabel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    Panel1: TPanel;
    Phelpmsg: TPanel;
    BBrun: TBitBtn;
    BBsetup: TBitBtn;
    BBhelp: TBitBtn;
    BBexit: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    MEyear: TMaskEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    RBmonitor: TRadioButton;
    RBprinter: TRadioButton;
    RBfile: TRadioButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SBfr: TSpeedButton;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    Gauge1: TGauge;
    QueryF: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure MEyearChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    Procedure ShowPreView;
    Procedure LoadData;
    Function  AddSpace( data : String; size : Integer ) : String;

  public
    { Public declarations }
    Start : Integer;
    F_mateamt, F_childamt, F_parentamt: Real;

  end;

Type
  TFam01 = Record
      empno      : Array[0..4]  of Char;  { 사번        }
      korname    : Array[0..10] of Char;  { 성명        }
      firstyn    : Array[0..8]  of Char;  { 장남여부    }
      faminame   : Array[0..8]  of Char;  { 가족명      }
      famikind   : Array[0..9]  of Char;  { 가족구분    }
      famirel    : Array[0..9]  of Char;  { 가족관계    }
      famibdate  : Array[0..10] of Char;  { 생년월일    }
      appdate    : Array[0..10] of Char;  { 신청일      }
      famifrdate : Array[0..10] of Char;  { 지급개시월  }
      mcpamt     : Array[0..11] of Char;  { 지급금액    }
      lineskip   : Array[0..1]  of char;  { 다음줄로    }
  end;

var
  MainForm: TMainForm;
  Fam01  : TFam01;  { Local 자료화일의 Record 명 선언 }
  Running: Boolean;

implementation
{$R *.DFM}

uses
  pkg10702, pkg10703;

procedure TMainForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Running then System.Exit;
     Running := True;

     OraConnect;
     L_UserName.Caption := Pkorname + '(' +pempno+ ')';

     Application.ProcessMessages;

     L_Curdate.Caption := fn_GetDateStr;

     MEyear.Text := Copy(RemoveChar(L_Curdate.Caption,'/'),1,6);

     Phelpmsg.Caption := '  초기자료를 읽고 있습니다.';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select mateamt, childamt, parentamt   ');
               SQL.Add('  from pkcfmbas                       ');
               Open;

               if RecordCount > 0 then
               begin
                    F_mateamt   := FieldByName('MATEAMT').AsFloat;
                    F_childamt  := FieldByName('CHILDAMT').AsFloat;
                    F_parentamt := FieldByName('PARENTAMT').AsFloat;
               end
               else
               begin
                    F_mateamt   := 0;
                    F_childamt  := 0;
                    F_parentamt := 0;
               end;
          end;
     Finally
          qq.Free;
     end;

     Application.ProcessMessages;
     Phelpmsg.Caption := '';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
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

{실행..........................................................................}
procedure TMainForm.BBrunClick(Sender: TObject);
var
     FilePointer : File of TFam01;
     Inwon: Integer;
begin
  Phelpmsg.Caption := '';
  Gauge1.Progress := 0;
  if fn_IsDate(MEyear.Text+'01') = False then
  begin
       MessageBox(Handle, '기준년월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
       MEyear.SetFocus;
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
       printform := Tprintform.Create(Application);
       PrintForm.QuickReport1.PreView;
  end
  else if RBprinter.Checked = True then
  begin
       printform := Tprintform.Create(Application);
       printform.user_preview := false;
       PrintForm.QuickReport1.Print;
       printform.free;
       previewform.free;
  end
  else
  begin
       if SaveDialog1.Execute then
       begin
            AssignFile(FilePointer, SaveDialog1.FileName);
            System.ReWrite(FilePointer);
       end
       else
       begin
            QueryF.Close;
            System.Exit;
       end;

       Inwon := 0;
       FillChar(Fam01, SizeOf(Fam01), ' ');
       StrPcopy(Fam01.korname, copy(MEyear.text,1,4)+'.'+copy(MEyear.text,5,2));
       StrPcopy(Fam01.famikind,'  지급내역서');
       StrPcopy(Fam01.lineskip,#13#10);
       System.Write(FilePointer, Fam01);
       FillChar(Fam01, SizeOf(Fam01), ' ');

       StrPcopy(Fam01.empno,AddSpace('사번',5));
       StrPcopy(Fam01.korname,AddSpace('성명',11));
       StrPcopy(Fam01.firstyn,AddSpace('장남여부',9));
       StrPcopy(Fam01.faminame,AddSpace('가족성명',9));
       StrPcopy(Fam01.famikind,AddSpace('가족구분',10));
       StrPcopy(Fam01.famirel,AddSpace('가족관계',10));
       StrPcopy(Fam01.famibdate,AddSpace('생년월일',11));
       StrPcopy(Fam01.appdate,AddSpace('신청일',11));
       StrPcopy(Fam01.famifrdate,AddSpace('지급개시월',11));
       StrPcopy(Fam01.mcpamt,AddSpace('지급금액',12));
       StrPcopy(Fam01.lineskip,#13#10);
       System.Write(FilePointer, Fam01);
       FillChar(Fam01, SizeOf(Fam01), ' ');

       while not QueryF.Eof do
       begin
            with QueryF do
            begin
                 Inc(Inwon);
                 Gauge1.Progress := (Inwon * 100) div RecordCount;
                 Application.ProcessMessages;

                 StrPcopy(Fam01.empno,AddSpace(FieldByName('empno').AsString,5));
                 StrPcopy(Fam01.korname,AddSpace(FieldByName('korname').AsString,11));
                 StrPcopy(Fam01.firstyn,AddSpace(FieldByName('firstyn').AsString,9));
                 StrPcopy(Fam01.faminame,AddSpace(FieldByName('faminame').AsString,9));
                 StrPcopy(Fam01.famikind,AddSpace(FieldByName('famikind_n').AsString,10));
                 StrPcopy(Fam01.famirel,AddSpace(FieldByName('famirel').AsString,10));
                 StrPcopy(Fam01.famibdate,AddSpace(Copy(FieldByName('famibdate').AsString,1,4)+'.'+
                                                   Copy(FieldByName('famibdate').AsString,5,2)+'.'+
                                                   Copy(FieldByName('famibdate').AsString,7,2),11));

                 StrPcopy(Fam01.appdate,AddSpace(Copy(FieldByName('appdate').AsString,1,4)+'.'+
                                                 Copy(FieldByName('appdate').AsString,5,2)+'.'+
                                                 Copy(FieldByName('appdate').AsString,7,2),11));

                 StrPcopy(Fam01.famifrdate,AddSpace(Copy(FieldByName('famifrdate').AsString,1,4)+'.'+
                                                    Copy(FieldByName('famifrdate').AsString,5,2),11));

                 if FieldByName('famikind').AsString = 'A' then        {배우자}
                      StrPcopy(Fam01.mcpamt,format('%12.0n',[F_mateamt]))
                 else if FieldByName('famikind').AsString = 'B' then   {직계 존속}
                      StrPcopy(Fam01.mcpamt,format('%12.0n',[F_parentamt]))
                 else if FieldByName('famikind').AsString = 'C' then   {직계 비속}
                      StrPcopy(Fam01.mcpamt,format('%12.0n',[F_childamt]))
                 else
                      StrPcopy(Fam01.mcpamt,format('%12.0n',[0]));

                 StrPcopy(Fam01.lineskip,#13#10);
                 System.Write(FilePointer,Fam01);
                 FillChar(Fam01, SizeOf(Fam01), ' ');
                 Next;
            end;
       end;
       System.Close(FilePointer);
  end;
  QueryF.Close;

  Phelpmsg.Caption := '  출력을 완료하였습니다.';
  Gauge1.Progress := 0;
  Application.ProcessMessages;
end;

Procedure TMainForm.LoadData;
begin
     with QueryF do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.empno      , a.korname,                ');
          SQL.Add('       b.firstyn    , a.faminame,               ');
          SQL.Add('       a.famikind   ,                           ');
          SQL.Add('       (select codename from pyccode            ');
          SQL.Add('         where codeid = ''K410''                ');
          SQL.Add('           and codeno = a.famikind) famikind_n, ');
          SQL.Add('       (select codename from pyccode            ');
          SQL.Add('         where codeid = ''I211''                ');
          SQL.Add('           and codeno = a.famirel) famirel,     ');
          SQL.Add('       a.famibdate  , a.appdate,                ');
          SQL.Add('       a.famifrdate , a.famiyn                  ');
          SQL.Add(' from pkmfmmas a, pkmpmas b                     ');
          SQL.Add(' where (a.empno = b.empno)                      ');
          SQL.Add('   and (a.famiyn = ''Y'')                       ');
          SQL.Add('   and (a.famifrdate like :p_famifrdate)        ');
          SQL.Add('   and (a.famitodate is null)                   ');
          SQL.Add(' order by a.empno, a.famibdate                  ');
          ParamByName('p_famifrdate').AsString := MEyear.Text+'%';
          Open;
     end;
end;

Procedure TMainForm.ShowPreView;
begin
     PreviewForm.ShowModal;
end;

procedure TMainForm.SBfrClick(Sender: TObject);
var
     Month2Form : TMonth2Form;
begin
     Try
          Month2Form := TMonth2Form.Create(nil);
          Month2Form.Pyyyymm := MEyear.text ;
          Month2Form.ShowModal;
          MEyear.text    := Month2Form.Daycaption;
     Finally
          Month2Form.Free;
     End;
end;

procedure TMainForm.MEyearChange(Sender: TObject);
begin
     if Length(MEyear.Text) = 6 then
     begin
          if fn_IsDate(MEyear.Text+'01') = False then
          begin
               Phelpmsg.Caption := '  지급년월을 정확히 입력하세요.';
               MEyear.SetFocus;
               exit;
          end;
     end;
end;

{Record 의 공백을 Space 로......................................................}
Function TMainForm.AddSpace( data : String; size : Integer ) : String;
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
               s := s + ' ';
          end;
     end;
     AddSpace := s + data;
end;


end.
