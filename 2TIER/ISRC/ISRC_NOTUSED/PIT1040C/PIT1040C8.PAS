{===================== Program Header ==========================================
PROGRAM-NAME    : PIT1040C(인적자원정보검색;2Tier)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 윤형식
Version         : 30.00
Date            : 2001.04.18
library         :

Update Contents
 Version date(yy.mm.dd) programmer  relevant doc.no    description
  1.00   2001.04.06     손종운                         3Tier => 2Tier 변환
 30.00   2001.04.18     윤형식      by 정세영(인사팀)  일괄정보검색 가능(사번범위, 부서범위등)
-------------------------------------------------------------------------------}

unit pit1040c8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, peoutlookbtn, ComCtrls, pedate, pedbutil,
  StdCtrls, pedbdate;

type
  TMain = class(TForm)
    St_Help: TStatusBar;
    subpanel: TPeJeonGrdPanel;
    Pa_Work: TPeJeonGrdPanel;
    pe_Date: TPeDbDate;
    pa_title: TPeJeonGrdPanel;
    s_form1: TPeJeonOutLookBtn;
    s_Form2: TPeJeonOutLookBtn;
    Bt_exit: TPeJeonOutLookBtn;
    L_Inform: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure SubFormCreate(Sender : TObject);
    procedure s_form1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Start : Boolean;
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission, Ppaycl, Ppayra, PSysdate: String;
    pTmpFrdate, pTmpTodate: String;
  end;

var
  Main: TMain;
  SelForm: TForm;

implementation

uses
  pit1040c0, pit1040c1; //, pit1040c9;


{$R *.DFM}

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMain.FormPaint(Sender: TObject);
begin
  if start then
  begin
    start := False;
    try
      pEmpno   := peParam(CmdLine,1);
      pKorname := peParam(CmdLine,2);
      Password := peParam(CmdLine,3);
      Ppermission := copy(peParam(CmdLine,4),2,1);

      L_Inform.Caption := '';

      Self.Show;
      Self.Update;
      Application.ProcessMessages;

      if not PeDBConnect(CmdLine, DM.DataBase1, St_Help) then
      begin
        Postmessage(Self.Handle, WM_CLOSE, 0, 0);
        Exit;
      end;

      pe_Date.GetDate;
//    St_Help.Panels[1].Text := ' ' + pe_Date.DateFrm;
      UpDateWindow(St_Help.Handle);

      with DM.qryTemp do
      begin
        CLOSE;
        SQL.Clear;
        SQL.Add('SELECT               '+
                '  i.paycl    ,       '+
                '  i.payra    ,       '+
                '  I.payrayn  ,       '+
                '  to_char(sysdate,''YYYYMMDD'') sys_date, '+
                '  v.value1   ,       '+
                '  v.value2           '+
                'FROM pimpmas i, pishrvari v                 '+
                'WHERE empno = '''+Main.Pempno+'''                '+
                '  AND gubun = ''00'' and sgubun = ''0004''  ');
        Open;

        if Bof AND Eof then
          Exit;

        Ppaycl   := FieldByName('paycl').AsString;
        Ppayra   := FieldByName('payra').AsString;
        PSysdate := FieldByName('sys_date').AsString;
        pTmpFrdate := FieldByName('value1').AsString;
        pTmpTodate := FieldByName('value2').AsString;
        Close;
      end;

      if UpperCase(Ppermission) <= 'B'  then
          Ppayra := '00';

      if (UpperCase(Ppermission) >= 'C') and (Ppayra > '6') then
      begin
          MessageDlg(' 사용권한이 없습니다.  팀장이상만 사용가능합니다.', mtInformation,[mbYes],0);
          Close;
      end
      else if (Main.PSysdate >= Main.pTmpFrdate) and (Main.PSysdate <= Main.pTmpTodate) then
      begin
          MessageDlg(' 직무경력 등록 기간중입니다. 결재완료되지 않은 자료는 부정확할 수 있습니다.', mtInformation,[mbYes],0);
          L_Inform.Caption := '직무경력 등록 기간중';
      end;

      SubFormCreate(S_Form1);
      Application.ProcessMessages;
    except on E:Exception do
      begin
        MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                  Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;
    St_Help.Panels[0].Text := '';
    Application.ProcessMessages;
  end;
end;

procedure TMain.SubFormCreate(Sender : TObject);
begin
  try
    if (SelForm <> nil) or Assigned(SelForm) then
      begin
        SelForm.Free;
        SelForm := nil;
      end;
    case TComponent(Sender).Tag of
      1 : begin
          Pa_Title.Caption := '';
          s_Form1.Font.Color := clPurple;
          s_Form2.Font.Color := clBlack;
          Application.Processmessages;
          SelForm := TMainform2.Create(nil);
        end;
      2 : begin
          Pa_Title.Caption := '';
          s_Form1.Font.Color := clBlack;
          s_Form2.Font.Color := clPurple;
          Application.Processmessages;
          SelForm := TMainform.Create(nil);
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

procedure TMain.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMain.s_form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
   Start := True;
end;

end.
