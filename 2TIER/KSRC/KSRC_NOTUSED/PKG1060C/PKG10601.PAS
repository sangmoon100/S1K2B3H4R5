unit pkg10601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables,
  Kylib1, FormMon1, Datelib, Gauges, Ora, Func, MemDS, DBAccess; //Pass,TimeFtp, Calen2 ==> FormMon1   교체..

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Phelpmsg: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    BBrun: TBitBtn;
    BBsetup: TBitBtn;
    BBexit: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RB_cancellation: TRadioButton;
    RB_provide: TRadioButton;
    MEyear: TMaskEdit;
    GB_PrintCondition: TGroupBox;
    RBmonitor: TRadioButton;
    RBprinter: TRadioButton;
    RBfile: TRadioButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    Panel2: TPanel;
    Gauge1: TGauge;
    RB_all: TRadioButton;
    P_PrintOrder: TPanel;
    RB_OrderAppkind: TRadioButton;
    RB_OrderEmpno: TRadioButton;
    QueryF: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure MEyearChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB_allClick(Sender: TObject);

  private
    { Private declarations }
    Procedure ShowPreView;
    Function  AddSpace ( data : String; Size : Integer ) : String;

  public
    { Public declarations }
    Start : Integer;
  end;

Type
    TFam01 = Record                    {  Local 자료화일의 Record 선언 }
          empno      : Array[0..4] of Char;             { 사번        }
          korname    : Array[0..10] of Char;            { 성명        }
          firstyn    : Array[0..8] of Char;             { 장남여부    }
          faminame   : Array[0..8] of Char;             { 가족명      }
          famikind   : Array[0..9] of Char;             { 가족구분    }
          famirel    : Array[0..9] of Char;             { 가족관계    }
          famibdate  : Array[0..10] of Char;            { 생년월일    }
          regdate    : Array[0..10] of Char;            { 사유발생일  }
          famifrdate : Array[0..10] of Char;            { 지급개시월  }
          famitodate : Array[0..10] of Char;            { 해지월      }
          appdesc    : Array[0..39] of Char;            { 신청사유    }
          lineskip   : Array[0..1] of char;             { 다음줄로    }
end;

var
  MainForm: TMainForm;
  Fam01  : TFam01;  { Local 자료화일의 Record 명 선언 }
  Running: Boolean;

implementation

{$R *.DFM}

uses  pkg10602, pkg10603;

{폼 활성화.....................................................................}
procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;
     Running := True;

     Application.ProcessMessages;

     OraConnect;

     L_UserName.Caption := Pkorname + '(' +Pempno+ ')';

     L_Curdate.Caption := fn_GetDateStr;

     MEyear.Text := Copy(RemoveChar(L_Curdate.Caption,'/'),1,6);

     Phelpmsg.Caption := '  초기자료를 읽고있습니다.';
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
     PreviewForm.ShowModal;
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?',
                               '작업안내', mb_YesNo) = IDYES
     then
     begin
          Action := caFree;
     end
     else
          Action := caNone;
end;

procedure TMainForm.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

{실행 실행.....................................................................}
procedure TMainForm.BBrunClick(Sender: TObject);
var
     FilePointer : File of TFam01;
     Inwon: Integer;
begin
     Phelpmsg.Caption := '';
     if fn_IsDate(MEyear.Text+'01') = False then
     begin
          MessageBox(Handle, '기준년월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEyear.SetFocus;
          exit;
     end;

     Phelpmsg.Caption := '  해당하는 자료를 추출중입니다.';
     Application.ProcessMessages;


     with QueryF do
     begin
          Close;
          SQL.Clear;
          SQL.ADD (' select a.empno, a.korname, a.appkind,         ');
          SQL.ADD ('        b.firstyn, a.faminame,                 ');
          SQL.ADD ('        (Select codename from pyccode          ');
          SQL.ADD ('          where codeid = ''K410''              ');
          SQL.ADD ('            and codeno = a.famikind) famikind, ');
          SQL.ADD ('        (Select codename from pyccode          ');
          SQL.ADD ('          where codeid = ''I211''              ');
          SQL.ADD ('            and codeno = a.famirel) famirel,   ');          
          SQL.ADD ('        a.famibdate, a.regdate,                ');
          SQL.ADD ('        a.famifrdate, a.famitodate,            ');
          SQL.ADD ('        a.appdesc                              ');
          SQL.ADD ('   from pkmfmmas a, pkmpmas b                  ');
          SQL.ADD ('  where (a.empno = b.empno)                    ');
          SQL.ADD ('    and (a.appdate like :p_appdate)            ');
          ParamByName('p_appdate').AsString := MEyear.Text+'%';

          if RB_all.Checked then           {전체}
            SQL.ADD('    and (a.appkind like ''%2'') ')
          else if RB_provide.Checked then  {지급대상자}
            SQL.ADD('    and (a.appkind = ''A2'')    ')
          else                             {해지대상자}
            SQL.ADD('    and (a.appkind = ''B2'')    ');

          if RB_OrderAppkind.Checked then
               SQL.Add('order by a.appkind, a.empno, a.famibdate ')
          else
               SQL.Add('order by a.empno, a.appkind, a.famibdate ');

          Open;

          if RecordCount = 0 then
          begin
               Close;
               MessageBox(Handle, '해당하는 자료가 하나도 없습니다.', '처리오류', MB_ICONWARNING);
               System.Exit;
          end;

          if RBmonitor.Checked = True then
          begin
               printform := TPrintform.create(application);
               PrintForm.QuickReport1.PreView;
          end
          else if RBprinter.Checked = True then
          begin
               printform := TPrintform.create(application);
               printform.user_preview := false;
               PrintForm.QuickReport1.Print;
               printform.free;
          end
          else
          begin   {자료화일}
               if SaveDialog1.Execute then
               begin
                    Assignfile(FilePointer, SaveDialog1.FileName);
                    System.Rewrite(FilePointer);
               end
               else
               begin
                    Close;
                    System.Exit;
               end;

               Inwon := 0;
               FillChar(Fam01, SizeOf(Fam01), ' ');
               StrPcopy(Fam01.korname,copy(MEyear.text,1,4)+'.'+copy(MEyear.text,5,2));
               StrPcopy(Fam01.famibdate,'자동추출대상자');
               StrPcopy(Fam01.lineskip,#13#10);
               System.Write(FilePointer, Fam01);   {Title Record Write}
               FillChar(Fam01, SizeOf(Fam01), ' ');

               StrPcopy(Fam01.empno,AddSpace('사번',5));
               StrPcopy(Fam01.korname,AddSpace('성명',11));
               StrPcopy(Fam01.firstyn,AddSpace('장남여부',9));
               StrPcopy(Fam01.faminame,AddSpace('가족성명',9));
               StrPcopy(Fam01.famikind,AddSpace('가족관계',10));
               StrPcopy(Fam01.famirel,AddSpace('가족구분',10));
               StrPcopy(Fam01.famibdate,AddSpace('생년월일',11));
               StrPcopy(Fam01.regdate,AddSpace('사유발생일',11));
               StrPcopy(Fam01.famifrdate,AddSpace('지급개시월',11));
               StrPcopy(Fam01.famitodate,AddSpace('해지월',11));
               StrPcopy(Fam01.appdesc,'신청사유');
               StrPcopy(Fam01.lineskip,#13#10);
               System.Write(FilePointer, Fam01);   {Header Record Write}
               FillChar(Fam01, SizeOf(Fam01), ' ');

               while not Eof do
               begin
                    Inc(Inwon);
                    Gauge1.Progress := (Inwon * 100) div RecordCount;
                    Application.ProcessMessages;

                    StrPcopy(Fam01.empno,AddSpace(FieldByName('empno').AsString,5));
                    StrPcopy(Fam01.korname,AddSpace(FieldByName('korname').AsString,11));
                    StrPcopy(Fam01.firstyn,AddSpace(FieldByName('firstyn').AsString,9));
                    StrPcopy(Fam01.faminame,AddSpace(FieldByName('faminame').AsString,9));
                    StrPcopy(Fam01.famikind,AddSpace(FieldByName('famikind').AsString,10));
                    StrPcopy(Fam01.famirel,AddSpace(FieldByName('famirel').AsString,10));
                    StrPcopy(Fam01.famibdate,AddSpace(FieldByName('famibdate').AsString,11));
                    StrPcopy(Fam01.regdate,AddSpace(FieldByName('regdate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('famifrdate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('famitodate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('appdesc').AsString,40));
                    StrPcopy(Fam01.lineskip,#13#10);

                    Next;

                    System.Write(FilePointer,Fam01);    {Detail Record Write}
                    FillChar(Fam01, SizeOf(Fam01), ' ');
               end;
               System.Close(FilePointer);
          end;
     end;

     QueryF.Close;
     Phelpmsg.Caption := '  출력을 완료하였습니다.';
     Gauge1.Progress := 0;
     Application.ProcessMessages;
end;

procedure TMainForm.MEyearChange(Sender: TObject);
begin
     if Length(MEyear.Text) = 6 then
     begin
          if fn_IsDate(MEyear.Text+'01') = False then
          begin
               MessageBox(Handle, '기준년월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
               MEyear.SetFocus;
               exit;
          end;
     end;
end;

{달력을 호출한다...............................................................}
procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           MEyear.Text := Copy(MonthForm.DayCaption,1,6);
    Finally 
        MonthForm.Free; 
    End;
end;

{Record 의 공란을 Space 로....................................................}
Function TMainForm.AddSpace ( data : String; Size : Integer ) : String;
var
     i : Integer;
     s : String;
begin
     s := '';
     if (size - Length(data)) = 0 then begin
        AddSpace := ''+data;
     end else begin
        for i := 1 to size - Length(data) do begin
            s := s+ ' ';
        end;
     end;
     AddSpace := s + data;
end;

procedure TMainForm.RB_allClick(Sender: TObject);
begin
     RB_OrderAppkind.Enabled := True;
     RB_OrderEmpno.Enabled   := True;
     if TRadioButton(Sender).Name = 'RB_all' then {작성구분이 전체이면}
     begin
          RB_OrderEmpno.Enabled   := False;
          RB_OrderAppkind.Checked := True;
     end;
end;

end.
