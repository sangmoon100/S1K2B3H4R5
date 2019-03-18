{============================= Program Header ========================================
PROGRAM-NAME    :  PKG3150G(초과근무 관리/ 조회)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 급여
Programmer      : 유효성
Version         : 1.00
Date            : 2001.09.10
Update contents
  1.00    2001.09.10   유효성   신규프로그램개발                        처리명세서
======================================================================================}

unit pkg31501;

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
    Sb_form2: TPeJeonOutLookBtn;
    Panel4: TPanel;
    Sb_form3: TPeJeonOutLookBtn;
    procedure Bt_ExitClick(Sender: TObject);
    procedure Sb_Form1Click(Sender: TObject);
    procedure Sb_form2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sb_form3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

uses pkg31503, pkg31504, pkg31505, pkg31507;

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
                     sb_form2.Font.Color := clBlack;
                     sb_form3.Font.Color := clBlack;
                     SelForm := TForm1.Create(nil);
                end;
            2 : begin
                     sb_form1.Font.Color := clBlack;
                     sb_form2.Font.Color := clBlue;
                     sb_form3.Font.Color := clBlack;
                     SelForm := TForm2.Create(nil);
                end;
            3 : begin
                     sb_form1.Font.Color := clBlack;
                     sb_form2.Font.Color := clBlack;
                     sb_form3.Font.Color := clBlue;
                     SelForm := TForm3.Create(nil);
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

procedure TMainForm.Sb_Form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.Sb_form2Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OraConnect;
end;

procedure TMainForm.Sb_form3Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
{//2017.02.17 jissi 파견직 프로그램 분리로 분기구문 삭제
  //fn_YmanagerCheck -> Func.pas Library에 정의.
  if fn_YmanagerCheck then
  begin
       maintitle.Color := clTeal;
       maintitle.Caption := '초과근무 일괄 등록/결재[파견직]';
  end
  else
  begin
       maintitle.Color := clNavy;
       maintitle.Caption := '초과근무 일괄 등록/결재';
  end;
}

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
  DM.Query1.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') a ');
  DM.Query1.SQL.ADD('   FROM DUAL ');
  DM.Query1.Open;
  GSsysdate := DM.Query1.FieldByName('a').AsString;
  Lsysdate.caption := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
  DM.Query1.Close;

  SubFormCreate(sb_form1);
end;

end.
