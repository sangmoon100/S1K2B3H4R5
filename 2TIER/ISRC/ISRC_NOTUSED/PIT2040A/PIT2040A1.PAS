{===================== Program Header ==========================================
 PROGRAM-NAME      :
 SYSTEM-NAME       :
 SUBSYSTEM-NAME    :
 Programmer        :
 Version           :
 Date              :

Update Contents
 Version  date(yy.mm.dd)  programmer  description            relevant doc.n
 1.00
================================================================================}

unit PIT2040A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, peoutlookbtn, ComCtrls, pedate, pedbutil,
  StdCtrls, pedbdate;

type
  TMainForm = class(TForm)
    St_Help: TStatusBar;
    subpanel: TPeJeonGrdPanel;
    Pa_Work: TPeJeonGrdPanel;
    pa_title: TPeJeonGrdPanel;
    s_form1: TPeJeonOutLookBtn;
    s_Form2: TPeJeonOutLookBtn;
    Bt_exit: TPeJeonOutLookBtn;
    s_form3: TPeJeonOutLookBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_ExitClick(Sender: TObject);
    procedure SubFormCreate(Sender : TObject);
    procedure s_form1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

var
    pEmpno: String;    // 로그인 사번
    pKorname: String;  // 로그인 성명
    pClass: String;    // 로그인 등급
    SelForm: TForm;

implementation

uses pit2040a2, pit2040a3, pit2040a4, pit2040a5;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  try
    pEmpno   := peParam(CmdLine,1);
    pKorname := peParam(CmdLine,2);
    pClass   := peParam(CmdLine,4);

    if not PeDBConnect(CmdLine, DM.DataBase1, St_Help) then
    begin
      Postmessage(Self.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;

    SubFormCreate(S_Form1);

  except on E:Exception do
    begin
      MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                  Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
  end;
  St_Help.Panels[0].Text := '';
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.SubFormCreate(Sender : TObject);
begin
  try
    if (SelForm <> nil) or Assigned(SelForm) then
    begin
      SelForm.Free;
      SelForm := nil;
    end;
    case TComponent(Sender).Tag of
      1 : begin
          s_Form1.Font.Color := clPurple;
          s_Form2.Font.Color := clBlack;
          s_Form3.Font.Color := clBlack;
          Application.Processmessages;
          SelForm := TFm_SubForm1.Create(nil);
        end;
      2 : begin
          s_Form1.Font.Color := clBlack;
          s_Form2.Font.Color := clPurple;
          s_Form3.Font.Color := clBlack;
          Application.Processmessages;
          SelForm := TFm_SubForm2.Create(nil);
        end;
      3 : begin
          s_Form1.Font.Color := clBlack;
          s_Form2.Font.Color := clBlack;
          s_Form3.Font.Color := clPurple;
          Application.Processmessages;
          SelForm := TFm_SubForm3.Create(nil);
        end;
    end;
    SelForm.Parent      := Pa_Work;
    SelForm.WindowState := wsMaximized;
    SelForm.Show;
  except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  end;
end;

procedure TMainForm.s_form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
