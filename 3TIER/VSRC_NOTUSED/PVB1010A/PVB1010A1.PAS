{-------------------------------------------------------------------------------
  o 프로그램명  : 방문결과 조회 및 방문정보 관리(PVB1010A)
  o 시스템명    : 종합인사정보시스템
  o 부시스템명  : 방문자 예약시스템
  o 작성자      :
  o 버전        : 1.79
  o 작성일자    :
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부
    1.79 2013.04.09 지순미   주민번호 삭제 요청         SR-1304-0356
-------------------------------------------------------------------------------}
unit pvb1010a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, ComCtrls, OnSkinBtn,
  OnOneInstance, Tmax_session, OnInsaCommon, Tmax_DataSetText, TmaxFunc,
  tmax_common, DB;

type
  TFM_PVB1010A = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    SB_Help: TStatusBar;
    PA_Buttons: TPanel;
    BT_Exit: TOnFocusButton;
    PA_MenuSelect: TPanel;
    SB_Tab1: TOnSkinButton;
    SB_Tab2: TOnSkinButton;
    PA_Client: TPanel;
    ONE_App: TOnOnceInstance;
    TmaxSession: TTMaxSession;
    BT_find: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    BT_new: TOnFocusButton;
    QR_com: TTMaxDataSet;
    BT_Copy: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_Tab1Click(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure BT_newClick(Sender: TObject);
    procedure BT_CopyClick(Sender: TObject);
  private
    { Private declarations }
    FL_Start    : Boolean;
    FG_CurTag   : Integer;
    FG_Loading  : Boolean;
    FG_Form2Init: Boolean;
    FG_Mailempno: String;
    FG_MailKorname : String;

    procedure PL_Get_MailTO_id;
    procedure PL_Get_Sysdate;
  public
    { Public declarations }
    FG_pempno   : String;
    FG_pkorname : String;
    FG_grade    : String;
    FG_Sysdate     : String;

    procedure PL_Com_Contructor(var AQR_com : TTMaxDataSet);
    procedure PL_ShowPanel(APanel: TPanel);
  end;

var
  FM_PVB1010A: TFM_PVB1010A;

implementation

uses pvb1010a2, pvb1010a3, pvb1010a4;

{$R *.DFM}

procedure TFM_PVB1010A.PL_ShowPanel(APanel: TPanel);
var
  FL_I     : Integer;
  AControl : TControl;
begin
  APanel.Parent  := PA_Client;
  APanel.Left    := 0;
  APanel.Top     := 0;
  APanel.Visible := True;
  APanel.Perform(WM_PAINT,0,0);

  for FL_I := 0 to PA_Client.ControlCount - 1 do
    begin
      AControl := PA_Client.Controls[FL_I];
      if (AControl is TPanel) and (AControl <> APanel) then
        AControl.Visible := False;
    end;
end;

procedure TFM_PVB1010A.PL_Get_MailTO_id;
begin
  PL_Com_Contructor(QR_com);
  with QR_com do
  begin
       Sql.Text := 'SELECT value1, value2, ''3'',''4'',''5'' FROM pimvari '+
                   ' WHERE gubun = ''ZZ'' AND sgubun = ''0000'' ';
       Open;
       if Active then
       begin
            FG_Mailempno   := Trim(FieldByName('field1').AsString);
            FG_Mailkorname := Trim(FieldByName('field2').AsString);
       end;
       Close;
  end;
end;

procedure TFM_PVB1010A.PL_Get_Sysdate;
begin
  PL_Com_Contructor(QR_com);
  with QR_com do
  begin
       Sql.Text := 'SELECT to_char(sysdate, ''YYYYMMDD''), ''2'', ''3'',''4'',''5'' FROM dual ';
       Open;
       if Active then
       begin
            FG_Sysdate     := Trim(FieldByName('field1').AsString);
       end;
       Close;
  end;
end;

procedure TFM_PVB1010A.PL_Com_Contructor(var AQR_com : TTMaxDataSet);
begin
  with AQR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
    end;
end;

procedure TFM_PVB1010A.FormCreate(Sender: TObject);
begin
  FM_SubForm1 := nil;
  FM_SubForm2 := nil;
  FL_Start    := True;
  FG_Loading  := False;
  FG_Form2Init:= True;
end;

procedure TFM_PVB1010A.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
  begin
       FG_Loading := True;
       FL_Start := not FL_Start;
       SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
       Self.SetBounds(FL_Rect.Top + 10, FL_Rect.Left + 20, Self.Width, Self.Height);
       SF_Main.Refresh;
       Application.ProcessMessages;

       ///////////////////////////////////////////////////////////////////////
       TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
       TMaxSession.LabelName   := 'HANAROHPER';
       TMaxSession.Connect     := False;
       TMaxSession.Host        := Hinsa_Param(cmdline,10);
       TMaxSession.Port        := '9999';

       try
            TMaxSession.Connect := True;
       except
            Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
            Application.Terminate;
            Exit;
       end;
       ///////////////////////////////////////////////////////////////////////

       // 이부분서부터 업무관련 초기화 부분 코딩 처리...
       FG_pempno   := Hinsa_Param(CmdLine,1);
       FG_pkorname := Hinsa_Param(CmdLine,2);
       FG_Grade    := Hinsa_Param(CmdLine,4);

       PL_Get_MailTO_id;
       PL_Get_Sysdate;
       FG_Loading  := False;
       SB_Tab1Click(SB_Tab1);
  end;
end;

procedure TFM_PVB1010A.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FM_SubForm1 <> nil then
     if not FM_SubForm1.PL_Detail_Exists then
     begin
          MessageDlg('방문 부서정보/방문자 정보를 입력하세요...', mtInformation, [mbOK], 0);
          CanClose := False;
          System.Exit;
     end;
  CanClose := True;
end;

procedure TFM_PVB1010A.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_PVB1010A.SB_Tab1Click(Sender: TObject);
begin
  if FG_Loading then System.Exit;

  if FM_SubForm1 <> nil then
  begin
    if not FM_SubForm1.PL_Detail_Exists then
       begin
         MessageDlg('방문 부서정보/방문자 정보를 입력하세요...', mtInformation, [mbOK], 0);
         System.Exit;
       end;
  end;

  FG_Loading      := True;
  SB_Tab1.BtnDown := False;
  SB_Tab2.BtnDown := False;

  FG_CurTag := TComponent(Sender).Tag;
  case TComponent(Sender).Tag of
   1 : begin
         if FM_SubForm1 = nil then Application.CreateForm(TFM_SubForm1, FM_SubForm1);
         FM_SubForm1.Insa_Session := TmaxSession;
         FM_SubForm1.FG_empno     := FG_pempno;
         FM_SubForm1.FG_korname   := FG_pkorname;         
         FM_SubForm1.FG_ins       := True;
         FM_SubForm1.FG_count     := 0;

         FM_SubForm1.FG_Mailempno   := FG_Mailempno;
         FM_SubForm1.FG_MailKorname := FG_MailKorname;

         PL_ShowPanel(FM_SubForm1.PA_Work);
         Application.ProcessMessages;

         BT_find.Enabled   := False;
         BT_copy.Enabled   := False;
         BT_new.Enabled    := True;
         BT_Save.Enabled   := True;
         BT_Cancel.Enabled := True;

         FM_SubForm1.PL_InitForm;
       end;
   2 : begin
         if FM_SubForm2 = nil then
           Application.CreateForm(TFM_SubForm2, FM_SubForm2);
         FM_SubForm2.Insa_Session := TmaxSession;
         FM_SubForm2.FG_empno     := FG_pempno;
         PL_ShowPanel(FM_SubForm2.PA_Work);
         Application.ProcessMessages;

         BT_find.Enabled   := True;
         BT_copy.Enabled   := False;
         BT_new.Enabled    := False;
         BT_Save.Enabled   := False;
         BT_Cancel.Enabled := False;
         FM_SubForm2.PL_InitForm(FG_Form2Init);
         FG_Form2Init      := False;
       end;
  end;

  TOnSkinButton(Sender).BtnDown := True;
  FG_Loading := False;
end;

procedure TFM_PVB1010A.BT_findClick(Sender: TObject);
begin
  if Assigned(FM_SubForm2) then
    begin
      FM_SubForm2.BT_findClick(Sender);
    end;
end;

procedure TFM_PVB1010A.BT_SaveClick(Sender: TObject);
begin
{//저장루틴 주석처리 jissi. 2014.06.30
발신자 : 전지영(JEON JI YOUNG)/IT기획팀/SKB <kcjane@sk.com>
수신자 : 강륜종 Z113/브로드밴드SM/브로드밴드SM(02-6400-6618)
수신일 : 2014-06-30 11:28:30
제 목: RE: 방문자예약 등록내역.

관련해서 우선 기존 등록건에 대한 자료는 그대로 두시구요~
신규 입력만 불가토록(가능하면 입력시 “브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다.” Message Popup 부탁드립니다. ) ~
기존건에 대한 조회는 가능토록 해주세요~
}
  if FG_Sysdate > '20140630' then
  begin
       MessageDlg('브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다..', mtWarning, [mbOK], 0);
       System.Exit;
  end;
  FM_SubForm1.PL_VisitSave('추가');    //저장루틴 주석처리
end;

procedure TFM_PVB1010A.BT_CancelClick(Sender: TObject);
begin
  FM_SubForm1.PL_VisitDelete;
end;

procedure TFM_PVB1010A.BT_newClick(Sender: TObject);
begin
{//저장루틴 주석처리 jissi. 2014.06.30
발신자 : 전지영(JEON JI YOUNG)/IT기획팀/SKB <kcjane@sk.com>
수신자 : 강륜종 Z113/브로드밴드SM/브로드밴드SM(02-6400-6618)
수신일 : 2014-06-30 11:28:30
제 목: RE: 방문자예약 등록내역.

관련해서 우선 기존 등록건에 대한 자료는 그대로 두시구요~
신규 입력만 불가토록(가능하면 입력시 “브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다.” Message Popup 부탁드립니다. ) ~
기존건에 대한 조회는 가능토록 해주세요~
}
  if FG_Sysdate > '20140630' then
  begin
       MessageDlg('브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다..', mtWarning, [mbOK], 0);
       System.Exit;
  end;

  FM_SubForm1.PL_VisitInsert;
end;

procedure TFM_PVB1010A.BT_CopyClick(Sender: TObject);
begin
  if Assigned(FM_SubForm2) then
    begin
      if (FM_SubForm2.QR_book.Eof) and (FM_SubForm2.QR_book.Bof) then
        System.Exit;

      CopyForm.ShowModal;
      if CopyForm.SaveYN then
        FM_SubForm2.BT_findClick(Sender);
    end;     
end;

end.
