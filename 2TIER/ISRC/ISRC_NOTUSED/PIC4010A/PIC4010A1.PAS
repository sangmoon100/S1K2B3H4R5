unit PIC4010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, peoutlookbtn, ExtCtrls, pegradpanl, pedate,pedbutil, pedbdate, petxtwzd,
  peempnoform;

type
  TFm_PIC4010A1 = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    Panel1: TPanel;
    Bt_exit: TPeJeonOutLookBtn;
    s_Form2: TPeJeonOutLookBtn;
    s_Form1: TPeJeonOutLookBtn;
    St_Help: TStatusBar;
    Pa_Work: TPeJeonGrdPanel;
    pe_Date: TPeDbDate;
    s_Form3: TPeJeonOutLookBtn;
// 임의 생성  procedure
    procedure SubFormCreate(Sender : TObject);
//
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_exitClick(Sender: TObject);
    procedure s_Form1Click(Sender: TObject);
    procedure s_Form2Click(Sender: TObject);
    procedure s_form3Click(Sender: TObject);
    procedure s_form4Click(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    SelForm: TForm;

  public
//    Report: TQuickRep;

    pEmpno: String;     // 로그인 사번
    pKorname: String;   // 로그인 성명
    pClass: String;     // 로그인 등급
    isfirst : boolean;
    { Public declarations }
  end;

var
  Fm_PIC4010A1: TFm_PIC4010A1;

implementation

uses Fm_DM, PIC4010A2, PIC4010A3, PIC4010A4;

{$R *.DFM}


procedure TFm_PIC4010A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_PIC4010A1.SubFormCreate(Sender : TObject);
begin
  try
    if (SelForm <> nil) or Assigned(SelForm) then
      begin
        SelForm.Free;
        SelForm := nil;
      end;
    St_Help.Panels[0].Text := '';
    case TComponent(Sender).Tag of
      1 : begin
            s_Form1.Font.Color :=  clBlue;
            s_Form2.Font.Color :=  clSilver;
            s_Form3.Font.Color :=  clBlack;
            SelForm := TFm_PIC4010A2.Create(nil);
          end;
      2 : begin
            s_Form1.Font.Color :=  clBlack;
            s_Form2.Font.Color :=  clSilver;
            s_Form3.Font.Color :=  clBlack;
            SelForm := TFm_PIC4010A3.Create(nil);
          end;
      3 : begin
            s_Form1.Font.Color :=  clBlack;
            s_Form2.Font.Color :=  clSilver;
            s_Form3.Font.Color :=  clBlue;
            SelForm := TFm_PIC4010A4.Create(nil);
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

procedure TFm_PIC4010A1.Bt_exitClick(Sender: TObject);
begin
  Fm_PIC4010A1.St_Help.Panels[0].Text := '';
  Close;
end;

procedure TFm_PIC4010A1.s_Form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFm_PIC4010A1.s_Form2Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFm_PIC4010A1.s_form3Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFm_PIC4010A1.s_form4Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TFm_PIC4010A1.PeJeonOutLookBtn1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;


procedure TFm_PIC4010A1.FormShow(Sender: TObject);
begin
  try
       pEmpno   := peParam(CmdLine,1);
       pKorname := peParam(CmdLine,2);
       pClass   := peParam(CmdLine,4);

       Self.Show;
       Self.Update;
       Application.ProcessMessages;

       DM.DataBase1.Connected := false;

       if not PeDBConnect(CmdLine, DM.DataBase1, St_Help) then
       begin
         Postmessage(Self.Handle, WM_CLOSE, 0, 0);
         Exit;
       end;
       
       pEmpno := pEmpno;
       pe_Date.GetDate;
       St_Help.Panels[1].Text := ' ' + pe_Date. DateFrm;
       UpDateWindow(St_Help.Handle);

       SubFormCreate(S_Form1);
       Application.ProcessMessages;
  except
       on E:Exception do
       begin
         MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                    Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
         PostMessage(Self.Handle, WM_CLOSE, 0, 0);
       end;
  end;
  
  St_Help.Panels[0].Text := '';
  Application.ProcessMessages;
  isfirst := false;

  if (Copy(pClass,2,1) > 'B') or (pClass = '') then
  begin
       Application.MessageBox(PChar('사용권한이 부족합니다.! 자동종료 됩니다.'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;
end;

end.
