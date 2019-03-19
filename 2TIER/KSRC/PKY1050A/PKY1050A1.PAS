{============================= Program Header ========================================
PROGRAM-NAME    : PKY1050A(초과근무 관리/ 조회)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 급여
Programmer      : 지순미
Version         : 1.00
Date            : 2017.01.20
Update contents
  1.00    2017.01.20    지순미    PKG3150G 정규직 소스에서 파견직 분리
======================================================================================}

unit PKY1050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, pass, Ora, Func;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    maintitle: TPanel;
    Panel2: TPanel;
    Bt_Exit: TPeJeonOutLookBtn;
    Sb_Form1: TPeJeonOutLookBtn;
    Sb_form2: TPeJeonOutLookBtn;
    Panel4: TPanel;
    Sb_form3: TPeJeonOutLookBtn;
    procedure Bt_ExitClick(Sender: TObject);
    procedure Sb_Form1Click(Sender: TObject);
    procedure Sb_form2Click(Sender: TObject);
    procedure Sb_form3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      GSsysdate : String;
      SelForm : TForm;
      YmanagerYN : Boolean;
      procedure SubFormCreate(Sender : TObject);

  end;

var
  FM_Main: TFM_Main;


implementation

uses PKY1050A0, PKY1050A2, PKY1050A3, PKY1050A4;

{$R *.DFM}

procedure TFM_Main.SubFormCreate(Sender : TObject);
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
                     sb_form2.Font.Color := clBlack;
                     sb_form3.Font.Color := clBlack;
                     SelForm := TFM_Sub1.Create(nil);
                end;
            2 : begin
                     sb_form1.Font.Color := clBlack;
                     sb_form2.Font.Color := clBlue;
                     sb_form3.Font.Color := clBlack;
                     SelForm := TFM_Sub2.Create(nil);
                end;
            3 : begin
                     sb_form1.Font.Color := clBlack;
                     sb_form2.Font.Color := clBlack;
                     sb_form3.Font.Color := clBlue;
                     SelForm := TFM_Sub3.Create(nil);
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


procedure TFM_Main.Bt_ExitClick(Sender: TObject);
begin
  close;
end;

procedure TFM_Main.Sb_Form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFM_Main.Sb_form2Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFM_Main.Sb_form3Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  OraConnect;

  YmanagerYN        := false;

  if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and fn_YmanagerCheck) then   //fn_YmanagerCheck -> Func.pas Library에 정의.
  begin
       maintitle.Color   := clTeal;
       maintitle.Caption := '초과근무 일괄 등록/결재[파견직]';
       YmanagerYN        := True;
  end
  else
  begin
       MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
       Close;
  end;


  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  Lempno.Caption := Pkorname+'('+Pempno+')';

  DM.Query1.Close;
  DM.Query1.SQL.Clear;
  DM.Query1.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') a ');
  DM.Query1.SQL.ADD('   FROM DUAL ');
  DM.Query1.Open;
  GSsysdate := DM.Query1.FieldByName('a').AsString;
  Lsysdate.caption := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
  DM.Query1.Close;

  SubFormCreate(sb_form1);
end;

end.
