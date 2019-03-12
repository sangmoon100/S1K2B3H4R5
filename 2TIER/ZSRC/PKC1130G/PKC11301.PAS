{============================= Program Header ========================================
PROGRAM-NAME    :  PKC1130G(급여세금계산관리)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 급여
Programmer      : 하은영
Version         : 1.00
Date            : 2015.06.25
Update contents
  1.00    2015.06.26   하은영   신규프로그램개발                        처리명세서
======================================================================================}

unit pkc11301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, pass, Ora, Func;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    maintitle: TPanel;
    Panel2: TPanel;
    Bt_Exit: TPeJeonOutLookBtn;
    Sb_Form1: TPeJeonOutLookBtn;
    Panel4: TPanel;
    Sb_form3: TPeJeonOutLookBtn;
    Sb_form2: TPeJeonOutLookBtn;
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sb_Form1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sb_form2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      GSsysdate : String;  
      SelForm : TForm;
      procedure SubFormCreate(Sender : TObject);
      
  end;

var
  MainForm: TMainForm;


implementation

uses pkc11303, pkc11304, pkc11302, pkc11305;

{$R *.DFM}

procedure TMainForm.SubFormCreate(Sender : TObject);
begin
  Try
    if (SelForm <> nil) or Assigned(SelForm) then
      begin
        SelForm.Free;
        SelForm := nil;
      end;

    case TComponent(Sender).Tag of
      1 : begin
            sb_form1.Font.Color := clBlue;
            sb_form3.Font.Color := clBlack;
            sb_form2.Font.Color := clBlack;
            SelForm := TFpkc11304.Create(nil);
          end;
      2 : begin
            sb_form1.Font.Color := clBlack;
            sb_form3.Font.Color := clBlue;
            sb_form2.Font.Color := clBlack;
            SelForm := TFpkc11302.Create(nil);
          end;
      3 : begin
            sb_form1.Font.Color := clBlack;
            sb_form3.Font.Color := clBlack;
            sb_form2.Font.Color := clBlue;
            SelForm := TFpkc11305.Create(nil);
          end;
    end;
    SelForm.Parent      := Panel4;
    SelForm.WindowState := wsMaximized;
    SelForm.Show;
  Except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  End;
end;


procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  if (Copy(Pgrade,3,1) > 'C') then
  begin
       MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
       Close;
  end;

  Lempno.Caption := Pkorname+'('+Pempno+')';

  DM.Query1.Close;
  DM.Query1.SQL.Clear;
  DM.Query1.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') a FROM DUAL');
  DM.Query1.Open;
  GSsysdate := DM.Query1.FieldByName('a').AsString;
  Lsysdate.caption := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
  DM.Query1.Close;

  Fpkc11304.MEPaydate.text := copy(GSsysdate,1,6);
end;

procedure TMainForm.Sb_Form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OraConnect;
  SubFormCreate(sb_form1);
end;

procedure TMainForm.Sb_form2Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  qq : TOraQuery;
  CUseYN : string;
begin
  //2014.11.27 하은영 일시적으로 오픈중 매니저님 테스트로만 사용하고 나머지는 사원들이 무조건 종료되도록 수정
  {if (Pempno <> '2563') and (Pempno[1] <> 'D') then
  begin
     Application.MessageBox('관리자 권한 외에는 열람할 수 없습니다. ' + #13 + #13 +
                            '프로그램을 종료합니다.','[작업안내]',mb_ok);
     Application.Terminate;
     Exit;
  end;}

  //2017.02.01 eyha 구성원 권한 시스템 관리 - 근거:SR-1701-1022
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  Try
    with qq do
    begin
      Close;
      SQL.clear;
      SQL.ADD('Select payutil.GET_PRGUSER_YN(''2'',''PKC1130A'','''+Pempno+''') USEYN From Dual');
      Open;
      CUseYN := FieldByName('USEYN').AsString;
    end;
  Finally
      qq.Free;
  end;

  if (Copy(Pempno,1,1) <> 'D') and (CUseYN <> 'Y') then
  begin
     Application.MessageBox('관리자 권한 외에는 열람할 수 없습니다. ' +#13+#13+ '프로그램을 종료합니다.','[작업안내]',mb_ok);
     Application.Terminate;
     Exit;
  end;
end;

end.
