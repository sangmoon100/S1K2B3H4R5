unit pka4057a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnTmaxPersonEdit, ImgList, OnShapeLabel,
  OnSkinBtn, OnPopupEdit, OnInsaCommon, OnCalendarUtil,
  OnStringUtils, OnTmaxCodeEdit, Db, Tmax_DataSetText, OnListbox,
  OnTmaxDeptEdit, OnEditMemo, Tmax_DmlSet, OnRegistry, TmaxFunc,
  OnEditNumCtl, Mask, PeJeonMemo,Kylib1;

type
  TFM_Main = class(TForm)
    ImageList1: TImageList;
    QR_com: TTMaxDataSet;
    QR_sel1: TTMaxDataSet;
    QR_dml: TTMaxDML;
    PA_MainPanel: TPanel;
    OnShapeLabel10: TOnShapeLabel;
    Shape6: TShape;
    Shape4: TShape;
    Shape2: TShape;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    PA_conyn: TOnShapeLabel;
    PA_contime: TOnShapeLabel;
    OnSectionLabel3: TOnSectionLabel;
    OnShapeLabel4: TOnShapeLabel;
    SB_m1: TOnSkinButton;
    SB_m2: TOnSkinButton;
    SB_m3: TOnSkinButton;
    SB_m4: TOnSkinButton;
    SB_m5: TOnSkinButton;
    SB_m6: TOnSkinButton;
    SB_m7: TOnSkinButton;
    SB_m8: TOnSkinButton;
    SB_m9: TOnSkinButton;
    SB_m10: TOnSkinButton;
    SB_m11: TOnSkinButton;
    SB_m12: TOnSkinButton;
    ED_d1: TOnShapeLabel;
    ED_d2: TOnShapeLabel;
    ED_d3: TOnShapeLabel;
    ED_d4: TOnShapeLabel;
    ED_d5: TOnShapeLabel;
    ED_d6: TOnShapeLabel;
    ED_d7: TOnShapeLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ED_d8: TOnShapeLabel;
    ED_d9: TOnShapeLabel;
    ED_d10: TOnShapeLabel;
    ED_d11: TOnShapeLabel;
    ED_d12: TOnShapeLabel;
    ED_d13: TOnShapeLabel;
    ED_d14: TOnShapeLabel;
    ED_d15: TOnShapeLabel;
    ED_d16: TOnShapeLabel;
    ED_d17: TOnShapeLabel;
    ED_d18: TOnShapeLabel;
    ED_d19: TOnShapeLabel;
    ED_d20: TOnShapeLabel;
    ED_d21: TOnShapeLabel;
    ED_d22: TOnShapeLabel;
    ED_d23: TOnShapeLabel;
    ED_d24: TOnShapeLabel;
    ED_d25: TOnShapeLabel;
    ED_d26: TOnShapeLabel;
    ED_d27: TOnShapeLabel;
    ED_d28: TOnShapeLabel;
    ED_d29: TOnShapeLabel;
    ED_d30: TOnShapeLabel;
    ED_d31: TOnShapeLabel;
    ED_d32: TOnShapeLabel;
    ED_d33: TOnShapeLabel;
    ED_d34: TOnShapeLabel;
    ED_d35: TOnShapeLabel;
    ED_d36: TOnShapeLabel;
    ED_d37: TOnShapeLabel;
    ED_d38: TOnShapeLabel;
    ED_d39: TOnShapeLabel;
    ED_d40: TOnShapeLabel;
    ED_d41: TOnShapeLabel;
    ED_d42: TOnShapeLabel;
    PA_Buttons: TPanel;
    BT_Yearly_Complete: TOnFocusButton;
    BT_Yearly_Modify: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    sub_BT_Exit: TOnFocusButton;
    SB_Help: TStatusBar;
    ED_year: TOnComboEdit;
    ED_code: TTMaxCodePopupEdit;
    ED_hotkey: TTMaxCodePopupEdit;
    ED_empdate: TOnShapeLabel;
    SB_normal: TOnFocusButton;
    SF_SubMain: TOnSchemeForm;
    Shape101: TShape;
    SL_Yearly_Cnt: TOnShapeLabel;
    Label64: TLabel;
    Shape8: TShape;
    SL_Yearlyplan_Cnt: TOnShapeLabel;
    Label8: TLabel;
    Shape9: TShape;
    SL_Used_Yearly_Cnt: TOnShapeLabel;
    Label9: TLabel;
    Shape10: TShape;
    SL_Unused_Yearly_Cnt: TOnShapeLabel;
    Label10: TLabel;
    Shape11: TShape;
    SL_Notice_Yn: TOnShapeLabel;
    Label11: TLabel;
    Shape12: TShape;
    SL_Assign_Yn: TOnShapeLabel;
    Label12: TLabel;
    OnSectionLabel4: TOnSectionLabel;
    help_memo1: TMemo;
    Shape3: TShape;
    OnSectionLabel5: TOnSectionLabel;
    help_memo: TOnMemo;
    TMaxSession: TTMaxSession;
    SB_Assign_y: TOnSkinButton;
    SB_Assign_n: TOnSkinButton;
    ED_dept: TOnWinPopupEdit;
    ED_empno: TOnWinPopupEdit;
    procedure FormCreate(Sender: TObject);
    procedure sub_BT_ExitClick(Sender: TObject);
    procedure ED_yearGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure SB_MonthClick(Sender: TObject);
    procedure ED_DayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ED_deptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_deptInitPopup(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure ED_codeCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    //procedure SB_AllClick(Sender: TObject);
    procedure ED_yearChange(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure SB_normalClick(Sender: TObject);
    procedure BT_Yearly_CompleteClick(Sender: TObject);
    procedure BT_Yearly_ModifyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure ED_TypeChange(Sender: TObject);
    procedure SB_Assign_nClick(Sender: TObject);
    procedure SB_Assign_yClick(Sender: TObject);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char); //메일발송

  private
    { Private declarations }
    FL_Start : Boolean;
//    nMail    : ILotusNotes_Hana;

    procedure PL_InitJob;
    procedure PL_Holiday_Check(P_month : String);
    procedure PL_Com_Contructor;

    Function  Pkmexlist_Chk(yyyymm : String) : String;  //dsa2000 2005.07  : 교대근무자인지 체크.
    function  PL_make_Sql1(P_empno, P_fryear, P_toyear : String) : String;
    function  PL_Get_Allow_Enroll(P_yy, P_empno, P_code : String) : Boolean;
    function  PL_code_Exists(P_code : String) : Boolean;
    function  PL_pkhduty_Exists(P_yymm, P_empno : String) : Boolean;
    function  PL_ExchHoli_Exists(P_yymm, P_empno : String) : Boolean; //dsa2000 추가.
    function  PL_Month_endyn(P_yymm : String) : Boolean;
    function  PL_Input_Check(P_code : String) : Boolean;
    function  PL_Get_Code(acodeid, acodeno : String) : String;
    function  Chk_noinput(duyymm, empno :string): Boolean;
    function  PL_Get_Duty_Confirm(stdate : string) : Boolean;

  public
    { Public declarations }
    FG_yy       : String;
    FG_Month    : String;
    FG_PrevMonth: String;    
    FG_Date     : String;
    FG_empno    : String;
    FG_korname  : String;    
    FG_grade    : String;
    FG_pass     : String;
    FG_eempno   : String; //결재자
    FG_sndtel   : String;
    FG_rcvtel   : String;
    FG_empdate  : String;
    FG_orgnum   : String;
    FG_jobdept  : String;
    FG_SelComp  : TOnShapeLabel;
    FG_YearFln  : TStringList;
    FG_MinDate  : String;
    FG_Exists   : Boolean;
    FG_Mendyn   : Boolean;
    FG_right    : Integer;
    FG_SelectSql: String;
    FG_ExchangeYN : String;   //dsa2000  2005.07.
    FG_Exchange_Min : String; //dsa2000  2005.08.
    FG_ExchHoli_Max : Integer;//dsa2000  2005.08.
    FG_bldcodeYN : Boolean;
    FG_NewEmpno : Boolean;  //신규입사자
    FG_used_Cnt  : real;
    FG_Unused_Cnt  : real;
    FG_Modyn   : Boolean;

    GS_Knteyymm : String;

    //2015.10.26. 선택한 사용자 전역변수 추가.
    gv_empno    : string;
    gv_korname  : string;
    gv_empdate  : string;    
    gv_orgnum   : string;
    gv_deptcode : string;
    gv_deptname : string;
    gv_jobdept  : string;

    procedure PL_Month_Contructor;
    procedure PL_Select_pkhduty;

    procedure PL_Set_empformSql(P_deptcode, p_eempno, p_orgnum, p_jobtodate : String);
    procedure PL_Get_Eempno(P_empno: String);
    procedure PL_Get_pkyearlt(workyy,empno : string);
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
    function  PL_Get_Right(P_empno, P_orgnum : String) : Integer;
    procedure PL_Select_pkyearlt(workyy, empno : string;
                                 out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String);
    procedure Show_Yearly_Notice;
    procedure PL_Get_empform(v_empno : string);
  end;

var
  FM_Main: TFM_Main;

  //2015.02.27.hjku.. 연차 프로그램 메시지 출력용 추가..  
  //연차등록 prog.
  FL_Progid     : String = 'PKA4040A'; //연차등록 프로그램 ID
  FL_Tier       : String = '3';        //연차등록 프로그램 ID Tier
  FL_ProgName   : String;              //연차등록 프로그램명    
const
  NORMAL    = '00'; // 정상
  HOLIDAY   = '49'; // 휴일
  HOLIDAY2  = '50'; // 휴근
  HOLISATUR = '05'; // 토요휴무
  HOLIHALF  = '61'; // 반차
  HOLIMOHTH = '62'; // 월차
  HOLIYEAR  = '63'; // 연차
  YEARHALF  = '64'; // 반연차 2010.06.28
  HOLISICK  = '71'; // 병가
  ABSENCE   = '72'; // 결근
  ILLNESS   = '82'; // 병상
  BABYCARE  = '83'; // 육아
  MILITARY  = '84'; // 병역
  INDICTMEN = '85'; // 기소
  ABROAD    = '86'; // 유학
  POPULAR   = '87'; // 일반
  OTHERS    = '89'; // 기타
  UNDECIDED = '99'; // 미입력
  PUBREST   = '81'; // 공상
  BEAR      = '55'; // 산휴
  EXCHANGE  = '06'; // 교대근무         DSA2000 2005.07.
  EXCHHOLI  = '07'; // 교대근무자 비번  DSA2000 2005.07.
  SPEOFF    = '04'; // 교휴             DSA2000 2005.07.
  WORKSTOP  = '91'; // 정직
  BEFORE    = '97'; // 불입
  TEMPORARY = '98'; // 임시
  LONGWORK  = '52'; // 장휴


implementation

uses pka4057a2, PKA4057A3, PKA4057A4;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
    FL_Start     := True;
    FG_Exists    := False;
    FG_empdate   := '';
    FG_SelComp   := nil;
    FG_SelectSql := 'SELECT duyymm, empno, orgnum, deptcode,                                 '+
                    '       dd1,  dd2,  dd3,  dd4,  dd5,  dd6,  dd7,  dd8,  dd9,  dd10,      '+
                    '       dd11, dd12, dd13, dd14, dd15, dd16, dd17, dd18, dd19, dd20,      '+
                    '       dd21, dd22, dd23, dd24, dd25, dd26, dd27, dd28, dd29, dd30, dd31,'+
                    '       conyn, endyn, conman, contime                                    '+
                    '  FROM pkhduty ';

    FG_bldcodeYN := False;
    FG_NewEmpno  := False;


    //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
    //help_memo.Clear;
    help_memo.Text := '1) 등록하고자 하는 월(月) 선택(Click)' + #13#10 +
                      '2) 연차 단축키 설정에서 연차 또는 반연차 선택 후, 계획한 날을 Click!' + #13#10 +
                      '3) 해당월 등록 완료 후, 하단에 ''월별저장'' Click!' + #13#10 +
                      '4) 메뉴 상단 미 사용일수가 ''0''이 되면 메뉴 하단에 ''연차휴가 사용계획 등록완료'' Click!' + #13#10 +
                      '5) 등록완료 연차휴가 사용일은 ' + FL_ProgName + ' 메뉴에서 변경 가능';

    if FL_Start then
    begin
      FL_Start := False;
      //SF_Main.Refresh;
      Application.ProcessMessages;

      //PA_MainPanel.SetFocus;
      SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
      SB_Help.Perform(WM_PAINT,0,0);

      ///////////////////////////////////////////////////////////////////////
      //TMaxSession.EnvFileName := 'd:\src\newhana.env';
      TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
      TMaxSession.LabelName   := 'HANAROHPER';
      TMaxSession.Connect  := False;
      TMaxSession.Host     := Hinsa_Param(cmdline,10);
      TMaxSession.Port     := '9999';

      try
        TMaxSession.Connect := True;
      except
        //Application.MessageBox(PChar(TMaxSession.HeaderPacket),'에러',mb_ok);
        showmessage('Error Code : ' + TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                    'Error Msg  : ' + TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                    '관리자에게 문의하십시오.');
        Application.Terminate;
        Exit;
      end;

      //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
      FM_Tmax := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
        Application.Terminate;
      ///////////////////////////////////////////////////////////////////////

      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      FG_Date           := FM_Tmax.GetData('sysdate' ,'','');

      FG_empno   := Hinsa_Param(CmdLine,1);
      FG_korname := Hinsa_Param(CmdLine,2);
      FG_pass    := Hinsa_Param(cmdLine,3);
      FG_grade   := Hinsa_Param(CmdLine,4);

    //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인한 추가..이명노M 요청  
    with QR_com do
    begin
         PL_Com_Contructor;
         Sql.Add ('select ''[''||progname||'']'' , ''field2'', ''field3'', ''field4'', ''field5'' ');
         Sql.Add ('  from pymenulist            ');
         Sql.Add (' where tier   = ''' + FL_Tier   + '''            ');
         Sql.Add ('   and progid = ''' + FL_Progid + '''            ');

         Open;

         FL_ProgName := QR_com.FieldByName('field1').AsString ;

         //if(FL_ProgName='') then FL_ProgName := '[연차휴가 사용신청 및 변경]';
         if(FL_ProgName='') then FL_ProgName := '[휴가계획 등록]';
    end;    

      PL_InitJob;
    end;

    //2014.06.24.hjku. 이명노M 요청
    {temp_message := inttostr(strtoint(FG_PrevMonth))+'월 휴가계획등록을 완료하셨습니까?';
    if(Application.MessageBox(pchar(temp_message),'[알림]',
                      MB_YESNO ) <> IDYES	)
    then
    begin
        showmessage(inttostr(strtoint(FG_PrevMonth))+'월 휴가계획등록을 완료하시고 확인바랍니다.');
        Application.Terminate;
        Exit;
    end
    else
    begin
      if(Chk_noinput(FG_yy+FG_PrevMonth, ED_empno.empno) = True) then
      begin
        showmessage(//'6월 휴가계획자료 입력이 완료되지 않았습니다.' + #13 + #13 +
                    inttostr(strtoint(FG_PrevMonth))+'월 휴가계획등록을 완료하시고 확인바랍니다.');
        Application.Terminate;
        Exit;
      end;
    end;
    }
    //debugging by hjku
    //FG_PrevMonth := '06';
    //SL_Notice_Yn.LabelCaption :='N';
      //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      //if(Chk_noinput(FG_yy+FG_PrevMonth, ED_empno.empno) = True) then
      if(Chk_noinput(FG_yy+FG_PrevMonth, GV_empno) = True) then
      begin
        showmessage(inttostr(strtoint(FG_PrevMonth))+'월 휴가계획등록을 완료하시고 확인바랍니다.');
        Application.Terminate;
        Exit;
      end;

      if FG_right > 2 then
      begin
          if(SL_Yearlyplan_Cnt.LabelCaption='0') then
          begin
              showmessage('연차사용촉진 대상자가 아닙니다.');
              Application.Terminate;
              Exit;
          end;
      end;

      Show_Yearly_Notice;
end;

procedure TFM_Main.PL_Get_pkyearlt(workyy, empno : String);
var
  yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String;
begin
  PL_Select_Pkyearlt(workyy,empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);

  SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
  SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
  SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
  SL_Notice_Yn.LabelCaption         := notice_yn        ;
  SL_Assign_Yn.LabelCaption         := assign_yn        ;
  SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));

  FG_used_Cnt := strtofloat(used_yearly_cnt);

  if(trim(SL_Assign_Yn.LabelCaption)='Y') then
  begin
      BT_Yearly_Complete.Enabled := false;
//      BT_Yearly_Modify.Enabled   := true;
  end
  else
  begin
      BT_Yearly_Complete.Enabled := true;
//      BT_Yearly_Modify.Enabled   := false;
  end;

  {//2014.06.09.hjku. 해당 대상자에 대해 처리하도록...
  //연차변경 요청건 결재할 수 있도록... 팀장이상만 오픈..
  if FG_right <=1 then
  begin
      BT_Yearly_Complete.Enabled := true;
//      BT_Yearly_Modify.Enabled   := true;
  end;
 }
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     with QR_com do
     begin
          ServiceName := 'PKA4040A_dml';
          Close;
          SQL.Clear;
          SQL.Add('insert into PZHMAIL                         ');
          SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
          SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
          SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
          SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
          SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
          SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
          SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
          SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
          SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
          SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
          SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
          SQL.Add('        ''''                  )             ');  //EAI_DATE

          try
               Execute
          except
               Result := false;
               exit;
          end;
          Result := True;
     end;
end;

procedure TFM_Main.sub_BT_ExitClick(Sender: TObject);
begin
     //2013.09.13.hjku. 등록완료 확인 추가.
     //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
     //if (FG_empno = ED_empno.empno) and
     if (FG_empno = GV_empno) and
        (SL_Assign_Yn.LabelCaption='N')     and
        (strtofloat(SL_Unused_Yearly_Cnt.LabelCaption) <= 0) then
     begin
          if MessageBox(HANDLE,'연차휴가 사용시기 지정이 완료 되었습니다.'+#13#13#10+
                                       '등록완료하시겠습니까?','저장확인',MB_YESNO) = IDYES then
          begin
               BT_Yearly_CompleteClick(nil);
          end;
     end;

    Close;
end;


procedure TFM_Main.PL_InitJob;
var
  FL_Date : String;
  FL_Sql  : String;
  FL_IDate: Integer;
  i       : Integer;
  FL_month : TOnSkinButton;
begin
  FG_Modyn   := false;
  FG_right   := 9;
  FG_jobdept := '';
  FG_orgnum  := '';
  FL_Date    := Copy(FG_Date,1,4);
  FG_Month   := Copy(FG_Date,5,2);

  if not IsNumber(FL_Date) then
    System.Exit;

  FG_PrevMonth := Copy(BeforeNextMonth(Copy(FG_Date,1,6),1),5,2);    

  FL_IDate := GetStrToint(FL_Date);
  ED_year.Items.Clear;
  ED_year.KeyItems.Clear;
  ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
  ED_year.Items.Add(FL_Date+' 년');
  ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');
  ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
  ED_year.KeyItems.Add(FL_Date);
  ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
  ED_year.ItemIndex := 1;

  ED_year.Enabled := false;//해당년도만 수정함.

  FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month);

  //현재월 이전월은 false
  for i := 1 to 12 do
    begin
      FL_month := TOnSkinButton(Self.FindComponent('SB_m'+IntToStr(i)));

      //if(FL_month.Tag < (strtoint(FG_Month))) then FL_month.Enabled := false
      //else FL_month.Enabled := true;
      if(FG_yy< copy(GS_Knteyymm,1,4)) then FL_month.Enabled := false
      else if(FG_yy= copy(GS_Knteyymm,1,4))and(FL_month.Tag <= (strtoint(copy(GS_Knteyymm,5,2)))) then FL_month.Enabled := false
      else FL_month.Enabled := true;
    end;

  ED_hotkey.Text := HOLIYEAR;
  ED_hotkey.PL_get_singledata;
  ED_code.Width  := 0;
  ED_code.Visible:= True;

  try
    FG_YearFln := TStringList.Create;
    with QR_com do
      begin
        PL_Com_Contructor;
        FL_Sql := Format('SELECT dukind ||'';''||dufldnm, '+
                         '       ''field2'',  '+
                         '       ''field3'',  '+
                         '       ''field4'',  '+
                         '       ''field5''   '+
                         '  FROM pkcducod     '+
                         '  WHERE yemonyn = ''Y''  '+
                         '    AND dukind <> ''%s'' ', [UNDECIDED]);
        Sql.Text := FL_Sql;
        Open;
        FG_YearFln.Clear;
        while not Eof do
          begin
            FG_YearFln.Add(Trim(FieldByName('field1').AsString));
            Next;
          end;
        Close;

        // 연차등록 최소 월값을 가져온다...
        PL_Com_Contructor;
        FL_Sql := 'SELECT MIN(duyymm), '+
                  '       ''field2'',  '+
                  '       ''field3'',  '+
                  '       ''field4'',  '+
                  '       ''field5''   '+
                  '  FROM pkhduty      ';
        Sql.Text := FL_Sql;
        Open;
        FG_MinDate := Trim(FieldByName('field1').AsString);
        Close;
      end;
  except
    System.Exit;
  end;

  ED_yearChange(Self);


  {ED_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,       '+
                  '    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,  '+
                  '    A.empdate, A.orgempdate, A.juminid, A.jobdept                                  '+
                  '  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                  '+
                  ' WHERE D.codeid(+) = ''I113''                                                      '+
                  '   AND A.payra     = D.codeno(+)                                                   '+
                  '   AND C.codeid(+) = ''I112''                                                      '+
                  '   AND A.paycl     = C.codeno(+)                                                   '+
                  '   AND A.orgnum    = B.orgnum(+)                                                   '+
                  '   AND A.jobdept   = B.deptcode(+)                                                 '+
                  '   AND (A.empno    = ''%s'' OR A.korname = ''%s'')                                 ';
}

  if FG_empno <> '' then
    begin
{2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      ED_empno.OnReadEnded := nil;
      ED_empno.Text := FG_empno;
      ED_empno.PL_get_singledata;
      FG_empdate    := ED_empno.empdate;
      ED_dept.Text  := ED_empno.deptname;
      ED_dept.Hint  := ED_empno.jobdept;

      //2014.06.09. hjku. 해당 부서인원만 조회되도록 추가.
      ED_empno.Param_deptcode := ED_dept.hint;

      ED_empdate.ValueCaption := Copy(FG_empdate,1,4)+'-'+Copy(FG_empdate,5,2)+'-'+Copy(FG_empdate,7,2);
      FG_orgnum     := ED_empno.orgnum;
      FG_jobdept    := ED_empno.jobdept;
      ED_empno.OnReadEnded := ED_empnoReadEnded;
}
      FG_orgnum     := FM_Tmax.GetData('orgnum','','');

      PL_Get_empform(FG_empno);

      ED_empno.Text := Gv_empno + ' - ' + Gv_korname;
      FG_empdate    := Gv_empdate;
      ED_dept.Text  := Gv_deptname;
      ED_dept.Hint  := Gv_jobdept;
      FG_jobdept    := Gv_jobdept;

      //2014.06.09. hjku. 해당 부서인원만 조회되도록 추가.
      //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      //ED_empno.Param_deptcode := ED_dept.hint;

      ED_empdate.ValueCaption := Copy(FG_empdate,1,4)+'-'+Copy(FG_empdate,5,2)+'-'+Copy(FG_empdate,7,2); 

    end;

  // 권한 설정...
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //FG_right := PL_Get_Right(ED_empno.empno, ED_empno.orgnum);
  //PL_Get_pkyearlt(FG_yy, ED_Empno.empno);

  FG_right := PL_Get_Right(GV_empno, GV_orgnum);
  PL_Get_pkyearlt(FG_yy, GV_empno);

  //관리자 설정...
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //PL_Get_Eempno(ED_empno.empno);
  PL_Get_Eempno(Gv_empno);

  if FG_right <=2 then
    begin
      ED_dept.ButtonWidth := 24;
      //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      //ED_dept.Enabled     := True;
      ED_dept.Enabled     := False;
      SB_Assign_n.Visible := True;
      SB_Assign_y.Visible := True;
    end
  else
    begin
      ED_dept.ButtonWidth := 0;
      ED_dept.Enabled     := False;
      //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      //ED_empno.Enabled    := False;
      ED_empno.Enabled    := False;
      SB_Assign_n.Visible := False;
      SB_Assign_y.Visible := False;      
      BT_Yearly_Modify.Enabled := true;      
    end;

  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //PL_Set_empformSql(FG_jobdept, FG_empno, FG_orgnum, Copy(FG_Date,1,8));

  PL_Month_Contructor;
  //ShowMessage(ED_empno.Sql);

end;

procedure TFM_Main.PL_Set_empformSql(P_deptcode, p_eempno, p_orgnum, p_jobtodate : String);
begin
//2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
(*
  if (Copy(FG_grade,3,1) <= 'C') and (FG_grade <> '') //and (FG_empno <> '2507')
  then
    ED_empno.Sql := ''
  else
  // 사원열람 쿼리 변경
  ED_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,'+
                  '       D.codename payraname, C.codename payclname, B.deptname, B.deptna3,   '+
                  '       B.extcode,A.empdate, A.orgempdate, A.juminid, A.jobdept              '+
                  '  FROM pycdept B, pyccode C, pyccode D, pimpmas A,      '+
                  '       ( SELECT empno                                   '+
                  '           FROM pimeemp                                 '+
                  Format('   WHERE eempno  = ''%s''                        ', [p_eempno])  +
                  Format('     AND jobdept = ''%s''                        ', [p_deptcode])+
                  '          UNION                                         '+
                  '         SELECT A.empno                                 '+
                  '           FROM pkcotman A, pimpmas B                   '+
                  '          WHERE A.jobkind    = ''1''                    '+
                  Format('     AND A.deptcode   = ''%s''                   ', [P_deptcode])+
                  '            AND A.empno      = B.empno                  '+
                  '            AND A.orgnum     = B.orgnum                 '+
                  '            AND A.deptcode   = B.jobdept                '+
                  Format('     AND A.orgnum     = ''%s''                   ', [P_orgnum])+
                  Format('     AND A.empno      = ''%s''                   ', [P_eempno])+
                  Format('     AND NVL(A.jobtodate,''99999999'') >= ''%s'' ', [P_jobtodate])+
                  '            AND SUBSTR(A.empno,1,1) <> ''Y'') E  '+
                  '  WHERE A.empno     = E.empno          '+
                  '    AND D.codeid(+) = ''I113''         '+
                  '    AND A.payra     = D.codeno(+)      '+
                  '    AND C.codeid(+) = ''I112''         '+
                  '    AND A.paycl     = C.codeno(+)      '+
                  '    AND A.orgnum    = B.orgnum(+)      '+
                  '    AND A.jobdept   = B.deptcode(+)    '+  //유효성 근무부서 부서명을 읽어오게 수정  AND A.deptcode  = B.deptcode(+)
                  '    AND (A.empno LIKE ''%s'' OR A.korname LIKE ''%s'')       '+
                  '  ORDER BY A.empno, A.korname          ';
*)                  
end;

procedure TFM_Main.PL_Get_empform(v_empno : string);
begin
  with QR_com do
    begin
      ServiceName := 'HINSA_select10';
      Close;
      Sql.Clear;

      Sql.Add('SELECT A.empno, A.korname, A.pstate, a.empdate, A.deptcode, B.deptname                 ');
      Sql.Add('      ,a.jobdept, a.orgnum, ''value9'', ''value10''                                    ');
      Sql.Add('  FROM pimpmas A, pycdept B                                                            ');
      Sql.Add(' WHERE A.orgnum    = B.orgnum(+)                                                       ');
      Sql.Add('   AND A.jobdept  = B.deptcode(+)                                                      ');
      Sql.Add('   AND A.empno    = '''+v_empno+'''                                                    ');
      Sql.Add(' ORDER BY pstate,EMPNO                                                                 ');

      ClearFieldInfo;
      AddField('EMPNO'             , ftString  ,  100 );
      AddField('KORNAME'           , ftString  ,  100 );
      AddField('pstate'            , ftString  ,  100 );
      AddField('empdate'           , ftString  ,  100 );
      AddField('DEPTCODE'          , ftString  ,  100 );
      AddField('DEPTNAME'          , ftString  ,  100 );
      AddField('jobdept'           , ftString  ,  100 );
      AddField('orgnum'            , ftString  ,  100 );
      AddField('VALUE9'            , ftString  ,  100 );
      AddField('VALUE10'           , ftString  ,  100 );

      Open;

      if(RecordCount > 0) then
      begin
          Gv_empno    := FieldByName('empno').AsString;
          Gv_korname  := FieldByName('korname').AsString;
          Gv_empdate  := FieldByName('empdate').AsString;
          Gv_deptcode := FieldByName('deptcode').AsString;
          Gv_deptname := FieldByName('deptname').AsString;
          Gv_jobdept  := FieldByName('jobdept').AsString;
          Gv_orgnum   := FieldByName('orgnum').AsString;
      end
      else
      begin
          Gv_empno    := '';
          Gv_korname  := '';
          Gv_empdate  := '';
          Gv_deptcode := '';
          Gv_deptname := '';
          Gv_jobdept  := '';
          Gv_orgnum   := '';
      end;
    end;
end;


procedure TFM_Main.PL_Month_Contructor;
begin
  FG_Modyn := false;

  case GetStrToint(FG_Month) of
    1 : SB_MonthClick(SB_m1);
    2 : SB_MonthClick(SB_m2);
    3 : SB_MonthClick(SB_m3);
    4 : SB_MonthClick(SB_m4);
    5 : SB_MonthClick(SB_m5);
    6 : SB_MonthClick(SB_m6);
    7 : SB_MonthClick(SB_m7);
    8 : SB_MonthClick(SB_m8);
    9 : SB_MonthClick(SB_m9);
    10: SB_MonthClick(SB_m10);
    11: SB_MonthClick(SB_m11);
    12: SB_MonthClick(SB_m12);
  end;
end;

procedure TFM_Main.PL_Com_Contructor;
begin
  with QR_com do
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

procedure TFM_Main.PL_Holiday_Check(P_month : String);
var
  FL_Sql : String;
  FL_i   : Integer;
  FL_lv  : Integer;
  FL_rv  : Integer;
  FL_Comp: TOnShapeLabel;
begin
  with QR_com do
    begin
      PL_Com_Contructor;
      FL_Sql := Format('SELECT holidate, holidesc,''field3'',''field4'',''field5'' '+
                       '  FROM pkcholi                       '+
                       ' WHERE SUBSTR(holidate,1,6) = ''%s'' '+
                       ' ORDER BY HOLIDATE                   ',
                       [ED_year.KeyItems[ED_year.ItemIndex]+P_month]);
      Sql.Text := FL_Sql;
      Open;
//      ED_Holi.Items.Clear;

      while not Eof do
        begin
          for FL_i := 1 to 42 do
            begin
              FL_Comp := nil;
              FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
              if FL_Comp <> nil then
                begin
                  FL_lv := GetStrToInt(FL_Comp.LabelCaption);
                  FL_rv := GetStrToInt(Copy(Trim(FieldByName('field1').AsString),7,2));
                  if FL_lv = FL_rv then
                    begin
                      FL_Comp.LabelFont.Color := clRed;
                      FL_Comp.ValueFont.Color := clRed;
                      FL_Comp.ValueCaption    := '휴일';
                      FL_Comp.Hint            := HOLIDAY;

                      if FG_ExchangeYN = 'Y' then                 //dsa2000 추가 2005.07.
                        FL_Comp.OnMouseDown   := ED_DayMouseDown  //dsa2000 추가 2005.07.
                      else
                        FL_Comp.OnMouseDown   := nil;

                      FL_Comp.Repaint;
                      Break;
                    end;
                end;
            end;
           Next;
         end;
      Close;
    end;
end;

function TFM_Main.PL_Get_Allow_Enroll(P_yy , P_empno, P_code : String) : Boolean;
var
  FL_Sql     : String;
  FL_fldnm   : String;
  FL_kind    : String;
  FL_Str     : String;
  FL_max1    : Double;
  FL_max2    : Double;
  FL_i       : Integer;
  FL_cnt     : Double;
  FL_Comp    : TOnShapeLabel;
  FL_Ccode   : String;
  FL_fryear  : String;
  FL_toyear  : String;
  FL_duname  : String;
  FL_rcalcnt : Double;
  FL_Longwork: Integer; //장휴 15일 체크 휴알
begin
  Result  := False;

  if FG_Mendyn then
    begin
      MessageDlg('휴가계획등록이 마감된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if (P_code = NORMAL) then // or (P_code = HOLISATUR)
    begin
      Result := True;
      System.Exit;
    end;
  FL_fryear := P_yy+'01';
  FL_toyear := P_yy+'12';

  FL_Ccode := P_Code;

  // 2009.06.04 휴가 코드 52 : 장휴는 15일 이상 등록 못하게 처리함. (등록여부 확인)

  try
    with QR_com do
      begin
        PL_Com_Contructor;
        FL_Sql := format(' select nvl(sum(longwork),0),    '+
                         '       ''field2'',               '+
                         '       ''field3'',               '+
                         '       ''field4'',               '+
                         '       ''field5''                '+
                         '   from pkhdusum                 '+
                         '  where empno = ''%s''  ',[FG_empno]);
        Sql.Text := FL_Sql;
        Open;
        FL_Longwork := FieldByname('field1').AsInteger;
        Close;
      end;
  except
    System.Exit;
  end;
  // 2009.06.04 휴가 코드 52 : 장휴는 15일 이상 등록 못하게 처리함. (등록여부 확인) 끝

  // 휴가 코드별 연차등록 일자 제한기준 읽기...
  try
    with QR_com do
      begin
        PL_Com_Contructor;
        FL_Sql := Format('SELECT dufldnm,          '+  // 연차등록에서 사용되는 필드명
                         '       maxkind,          '+  // 년,월 구분
                         '       TO_CHAR(maxcnt1), '+  // 제한횟수1
                         '       TO_CHAR(maxcnt2), '+  // 제한횟수2
                         '       duname                     '+
                         '  FROM pkcducod  '+
                         ' WHERE dukind = ''%s'' ',[FL_Ccode]);
        Sql.Text := FL_Sql;
        Open;
        FL_fldnm := Trim(FieldByname('field1').AsString);
        FL_kind  := Trim(FieldByname('field2').AsString);
        FL_max1  := StrTofloat(Trim(FieldByname('field3').AsString));
        FL_max2  := StrTofloat(Trim(FieldByname('field4').AsString));
        FL_duname:= Trim(FieldByname('field5').AsString);
        Close;
      end;
  except
    System.Exit;
  end;

/////유효성 추가 start: 입사일자별 특휴갯수 제한 추가
  if FL_Ccode = '51' then //특휴
    begin
      if copy(FG_empdate,1,6) <= ED_year.KeyItems[ED_year.ItemIndex] + '03'  then
        FL_max1 := 6
      else if copy(FG_empdate,1,6) <= ED_year.KeyItems[ED_year.ItemIndex] + '06' then
        FL_max1 := 4
      else if copy(FG_empdate,1,6) <= ED_year.KeyItems[ED_year.ItemIndex] + '09' then
        FL_max1 := 3
      else
        FL_max1 := 0;
    end;
///////유효성 추가 end

  // Y => P로 사번변경자가 특휴 사용하는경우 6개 사용가능토록.  추가  ....2005.07. dsa2000
  if FL_Ccode = '51' then //특휴
    begin
      try
        with QR_com do
          begin
            PL_Com_Contructor;
            FL_Sql := Format('SELECT empno,      '+
                             '       ''field2'', '+
                             '       ''field3'', '+
                             '       ''field4'', '+
                             '       ''field5''  '+
                             '  FROM PIMPMAS     '+
                             ' WHERE JUMINID IN (SELECT JUMINID         '+
                             '                     FROM PIMPMAS         '+
                             '                    WHERE PSTATE <> ''80'''+
                             '                    GROUP BY JUMINID      '+
                             '                   HAVING COUNT(*) >1)    '+
                             '   AND PSTATE  < ''80''                   '+
                             '   AND EMPDATE > ''%s''||''0101''         '+
                             '   AND SUBSTR(EMPNO,1,1) = ''P''          '+
                             '   AND EMPNO   = ''%s''  ',[P_yy, FG_empno]);
            Sql.Text := FL_Sql;
            Open;
          end;
      except
        System.Exit;
      end;

      if QR_com.FieldByname('field1').AsString = FG_empno then //사번변경자는 6개 사용가능.    dsa2000 추가 200507
        FL_max1 := 6;
      QR_com.close;        
    end;
////////////////////////////////////////////////////////////////////////////////

  if         FL_Ccode = HOLIHALF then FL_cnt := 0.5
  else  if   FL_Ccode = YEARHALF then FL_cnt := 0.5
  else                           FL_cnt := 1;




  FL_rcalcnt := 0.0;
  for FL_i := 1 to 42 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        begin
          if (FL_Ccode = HOLIHALF) or (FL_Ccode = YEARHALF) or (FL_Ccode = HOLIMOHTH) then
          begin
              if      FL_comp.Hint = HOLIHALF  then FL_rcalcnt := FL_rcalcnt + 0.5
              //2013.04.01.hjku. 반연차 반영 루틴 추가
              else if FL_comp.Hint = YEARHALF  then FL_rcalcnt := FL_rcalcnt + 0.5
              else if FL_comp.Hint = HOLIMOHTH then FL_rcalcnt := FL_rcalcnt + 1
          end
          else if FL_comp.Hint = FL_Ccode then      FL_rcalcnt := FL_rcalcnt + 1;
        end;
    end;
  FL_cnt := FL_cnt + FL_rcalcnt; //ShowMessage('첫번째 : '+FloatToStr(FL_cnt));

  FL_rcalcnt := 0.0;
  try
    with QR_Sel1 do
      begin
        Close;
        FL_Sql := FG_SelectSql + ' WHERE empno = ''%s'' ';

        if FL_Ccode = '52' then  //20090604 52 장휴 체크 전체 15일 체크
          begin
            FL_Sql   := FL_Sql + ' AND (duyymm BETWEEN ''%s'' AND ''%s'') ';
            //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
            //Sql.Text := Format(FL_Sql,[ED_empno.empno, '200801', FL_toyear]);
            Sql.Text := Format(FL_Sql,[GV_empno, '200801', FL_toyear]);
          end
        else
        if FL_kind = 'Y' then
          begin
            FL_Sql   := FL_Sql + ' AND (duyymm BETWEEN ''%s'' AND ''%s'') ';
            //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
            //Sql.Text := Format(FL_Sql,[ED_empno.empno, FL_fryear, FL_toyear]);
            Sql.Text := Format(FL_Sql,[GV_empno, FL_fryear, FL_toyear]);
          end
        else
          begin
            FL_Sql := FL_Sql + ' AND duyymm = ''%s'' ';
            //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
            //Sql.Text := Format(FL_Sql,[ED_empno.empno, P_yy+FG_Month]);
            Sql.Text := Format(FL_Sql,[GV_empno, P_yy+FG_Month]);
          end;
//        memo1.text := sql.text;
        Open;
        while not Eof do
          begin
            if Trim(FieldByName('duyymm').AsString) = (FG_yy + FG_Month) then
              begin
                Next;
                Continue;
              end;

            for FL_i := 1 to 31 do
              begin
                if (FL_Ccode = HOLIHALF) or (FL_Ccode = YEARHALF) or (FL_Ccode = HOLIMOHTH) then
                  begin
                    if FieldByName('dd'+IntToStr(FL_i)).AsString = HOLIHALF then
                      FL_rcalcnt := FL_rcalcnt + 0.5
                      //2013.04.01.hjku. 반연차 반영 루틴 추가
                    else if FieldByName('dd'+IntToStr(FL_i)).AsString = YEARHALF then
                      FL_rcalcnt := FL_rcalcnt + 0.5
                    else if FieldByName('dd'+IntToStr(FL_i)).AsString = HOLIMOHTH then
                      FL_rcalcnt := FL_rcalcnt + 1;
                  end
                else
                  begin
                    if FieldByName('dd'+IntToStr(FL_i)).AsString = FL_Ccode then
                      FL_rcalcnt := FL_rcalcnt + 1;
                  end;
              end;
            Next;
          end;
        Close;
        FL_cnt := Fl_cnt + FL_rcalcnt;
      end;
  except
    System.Exit;
  end;

  //dsa2000  2005.08.31.  교휴 1일까지만 사용가능한 사원 체크하여 제한두기/
  if (P_code = SPEOFF) and (FG_ExchHoli_Max = 1) and (FL_cnt = 2) then
    begin
      MessageDlg('전월 교대 기준으로 1일까지만 교휴 사용가능합니다.', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  //////////////////////////////////////////////////////////////////////////////

  // 제한기준이 월일경우
  if FL_kind = 'M' then
    begin
      if FL_max1 < FL_cnt then
        begin
          MessageDlg(FL_duname+'는 '+floatToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
          System.Exit;
        end;
    end
  else if FL_kind = 'Y' then
    begin
      if (FL_Ccode <> HOLIYEAR ) and (FL_Ccode <> YEARHALF) then    // 휴가코드가 연차 가 아닐경우
        begin
          //2009.06.04 52.:장휴일 때 15일을 초과 못하게 처리(입사일 부터 지급까지 체크) 김현순 메니져 요청으로 주석처리..
{          if FL_Ccode = '52' then
          begin
              if FL_Longwork > 0 then
              begin
                  MessageDlg(FL_duname+' 등록내역이 있습니다. 담당자에게 문의 하시기 바랍니다. ', mtInformation, [mbOK], 0);
                  System.Exit;
              end;
              if FL_max1 < FL_cnt  then
                begin
                  MessageDlg(FL_duname+'는 '+floatToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
                  System.Exit;
                end

          end else
          begin}
              if FL_max1 < FL_cnt then
                begin
                  MessageDlg(FL_duname+'는 '+floatToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
                  System.Exit;
                end
//          end;
        end
      else if (FL_Ccode = HOLIYEAR) or (FL_Ccode = YEARHALF)  then // 휴가코드가 연차 일 경우
        begin
          try  // 연차에 포함하는 휴가에 관련된 사항을 읽어옴.
            with QR_com do
              begin
                PL_Com_Contructor;
                //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                //Sql.Text := PL_make_Sql1(ED_empno.empno, FL_fryear, FL_toyear); //OnMemo1.Lines.Text := Sql.Text;
                Sql.Text := PL_make_Sql1(GV_empno, FL_fryear, FL_toyear); //OnMemo1.Lines.Text := Sql.Text;
                //memo1.text := sql.text;
                Open;
                FL_rcalcnt := GetStrToInt(Trim(FieldByName('field1').AsString));
                Close;
              end;
          except
            System.Exit;
          end;

          //입사일 구분 없이 PKYEARLT 테이블에 등록된 갯수만큼 연차사용 가능토록 FL_max1 지정.(20061030 신영섭 요청)
          try
            with QR_com do
              begin
                PL_Com_Contructor;
                FL_Sql := Format('Select nvl(sum(yearly_cnt),0), ''field2'','+
                                 '       ''field3'', ''field4'', ''field5'' '+
                                 '  From PKYEARLT                           '+
                                 ' Where yearly_yy = ''%s''                 '+
                                 //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                                 //'   And Empno     = ''%s''' , [P_yy, ED_empno.empno]);
                                 '   And Empno     = ''%s''' , [P_yy, GV_empno]);
                Sql.Text := FL_Sql;    /////Edit1.Text := SQL.Text;
                Open;
                FL_max1  := StrTofloat(Trim(FieldByName('field1').AsString));
                Close;
              end;
          except
            System.Exit;
          end;

          if FL_max1 <= 0 then
            begin
              MessageDlg('연차 사용갯수 등록이 안되어 있습니다. 담당자에게 문의 하시기 바랍니다.', mtInformation, [mbOK], 0);
              System.Exit;
            end;
          if FL_max1 < FL_cnt then
            begin
              MessageDlg(FL_duname+'는 '+floatToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
              System.Exit;
            end;
          //20061030 Add End.....................................................

        {입사일 구분 없이 PKYEARLT 테이블에 등록된 갯수만큼 연차사용가능토록 위해 루틴 삭제 .(20061030 신영섭 요청)
         // 입사일이 금년 1월 1일 이전인 경우 -> 연차 100%발생 ..
          if FG_empdate < P_yy+'0101' then
            begin
              if FL_max1 < FL_cnt then
                begin
                  MessageDlg(FL_duname+'는 '+GetIntToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
                  System.Exit;
                end
            end // 입사일이 금년 1월 2일 ~ 2월 15일 인 경우 -> 연차 80%발생 ..
          else if (FG_empdate >= P_yy+'0102') and (FG_empdate <= P_yy+'0215') then
            begin
              if FL_max2 < FL_cnt then
                begin
                  MessageDlg(FL_duname+'는 '+GetIntToStr(FL_max2)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
                  System.Exit;
                end
            end // 입사일이 금년 1월 1일 도, 금년 1월 2일 ~ 2월 15일 도 아닌 경우 -> 연차발생 안함..
          else
            begin
              MessageDlg('사용할수 있는 '+FL_duname+'가 없습니다..', mtInformation, [mbOK], 0);
              System.Exit;
            end;  }

        end;
    end;

  Result := True;
end;

function TFM_Main.PL_make_Sql1(P_empno, P_fryear, P_toyear : String) : String;
var
  FL_i : Integer;
begin
  Result := '';
  if FG_YearFln.Count > 0 then
    begin
      Result := 'SELECT ';
      for FL_i := 0 to FG_YearFln.Count - 1 do
        begin
          if FL_i < (FG_YearFln.Count - 1) then
            Result := Result + 'SUM('+ParseString(FG_YearFln[FL_i],';',2)+') + '
          else
            Result := Result + 'SUM('+ParseString(FG_YearFln[FL_i],';',2)+'),'
        end;
      Result := Result + ' ''field2'',''field3'',''field4'',''field5'' '#13;
      Result := Result + '  FROM pkhduhis '#13;
      Result := Result + Format(' WHERE empno = ''%s'' AND (duyymm BETWEEN ''%s'' AND ''%s'') ',
                                [P_empno, P_fryear, P_toyear]);
    end;
end;

function TFM_Main.PL_code_Exists(P_code : String) : Boolean;
var
  FL_i : Integer;
begin
  Result := False;
  if FG_YearFln.Count > 0 then
    begin
      for FL_i := 0 to FG_YearFln.Count - 1 do
        begin
          if ParseString(FG_YearFln[FL_i],';',1) = P_code then
            begin
              Result := True;
              Break;
            end;
        end;
    end;
end;

function TFM_Main.PL_pkhduty_Exists(P_yymm, P_empno : String) : Boolean;
var
  FL_Sql : String;
begin
  Result := False;
  try
    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT COUNT(empno),   '+
                  '       ''field2'',     '+
                  '       ''field3'',     '+
                  '       ''field4'',     '+
                  '       ''field5''      '+
                  '  FROM pkhduty         '+
                  ' WHERE duyymm = ''%s'' '+
                  '   AND empno  = ''%s'' ';
        Sql.Text := Format(FL_Sql,[P_yymm, p_empno]);
//        ShowMessage(Sql.Text);
        Open;
        if GetStrToInt(Trim(FieldByName('field1').AsString)) > 0 then
          Result := True;
        Close;
      end;
  except
    System.Exit;
  end;
end;

//true : 마감, false : 미마감
function TFM_Main.PL_Month_endyn(P_yymm : String) : Boolean;
var
  FL_Sql : String;
  knteyymm, auto_knteyymm : string;
begin
  Result := False;

  knteyymm      := '';
  auto_knteyymm := '';

  try
    with QR_Com do
      begin
        PL_Com_Contructor;

        //2014.10.15.hjku. 정규직과 파견직 휴가 마감 구분하기 위해 추가..
        FL_Sql := 'SELECT knteyymm field1, '+ #13#10 +
                  '       CASE WHEN TO_CHAR(SYSDATE,''dd'')> 10 THEN TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYYMM'')  '+ #13#10 +
                  '       ELSE TO_CHAR(ADD_MONTHS(SYSDATE,-2),''YYYYMM'') END FIELD2,  '+ #13#10 +
                  '       ''field3'',  '+ #13#10 +
                  '       ''field4'',  '+ #13#10 +
                  '       ''field5''   '+ #13#10 +
                  '  FROM pkcpbas      ';
        sql.text := FL_Sql;
        //memo1.text := sql.text;
        Open;
        
        knteyymm      := Trim(FieldByName('field1').AsString);
        auto_knteyymm := Trim(FieldByName('field2').AsString);

        //2016.10.19.hjku.. 관리자는 휴가마감년월로만 마감 체크. 이명노M 요청
        if (Copy(FG_grade,3,1) <= 'C') or (copy(FG_empno,1,1)='D') then
        begin
          GS_Knteyymm := knteyymm;
        end
        else
        begin
          if(auto_knteyymm> knteyymm) then GS_Knteyymm := auto_knteyymm
          else GS_Knteyymm := knteyymm;
        end;

        //if knteyymm >= P_yymm then
        if GS_Knteyymm >= P_yymm then
          Result := True;
        Close;
      end;
  except
  end;

  {//2016.09.23.hjku.. 휴가마감전이라도 10일이후에는 전월 휴가 마감처리 함.. 이명노M 요청
  if auto_knteyymm >= P_yymm then
  begin
    Result := True;
  end;
  }
end;

{function TFM_Main.PL_Month_endyn(P_yymm : String) : Boolean;
var
  FL_Sql : String;
  knteyymm, auto_knteyymm : string;
begin
  Result := False;
  try
    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT knteyymm,    '+
                  '       ''field2'',  '+
                  '       ''field3'',  '+
                  '       ''field4'',  '+
                  '       ''field5''   '+
                  '  FROM pkcpbas      ';
        Sql.Text := FL_Sql;
        Open;
        if Trim(FieldByName('field1').AsString) >= P_yymm then
          Result := True;
        Close;
      end;
  except
  end;
end;
}
procedure TFM_Main.PL_Select_pkhduty;
var
  FL_i       : Integer;
  FL_k       : Integer;
  FL_LastDay : Integer;
  FL_Comp    : TOnShapeLabel;
  FL_korname : String;
  FL_Sql     : String;
begin
  with QR_Sel1 do
    begin
      Close;
      Sql.Text := Format(FG_SelectSql+
                         //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                         //' WHERE duyymm = ''%s'' AND empno = ''%s'' ',[FG_yy+FG_Month, ED_empno.empno]);
                         ' WHERE duyymm = ''%s'' AND empno = ''%s'' ',[FG_yy+FG_Month, gv_empno]);
       try
         Open;
         if RecordCount > 0 then
           begin
             FL_k := 1;
             for FL_i := 1 to 42 do
               begin
                 FL_Comp := nil;
                 FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
                 if FL_Comp <> nil then
                   begin
                     if FL_Comp.Visible then
                       begin
                         FL_Comp.Hint := FieldByName('dd'+IntToStr(FL_k)).AsString;
                         if FL_Comp.Hint = NORMAL then
                         begin
                           //2017.05.22.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                           FL_Comp.Hint            := NORMAL;
                           FL_Comp.ValueFont.Color := clWhite;
                           FL_Comp.ValueCaption := '정상'
                         end
                         else if FL_Comp.Hint = HOLISATUR then
                           begin
                             FL_Comp.ValueFont.Color := clRed;  //유효성 추가 for color
                             FL_Comp.ValueCaption := '토휴'
                           end
                         else if FL_Comp.Hint = HOLIDAY then
                           begin
                             FL_Comp.ValueFont.Color := clRed;  //유효성 추가 for color
                             FL_Comp.ValueCaption := '휴일';

                             if FG_ExchangeYN ='N' then         //dsa2000 추가  2005.07.   교대근무자는 휴일에도 등록가능케.
                               FL_Comp.OnMouseDown     := nil;
                           end
                         else if FL_Comp.Hint = HOLIDAY2 then
                           begin
                             FL_Comp.ValueFont.Color := clRed;  //유효성 추가 for color
                             FL_Comp.ValueCaption := '휴근';

                             if FG_ExchangeYN ='N' then         //dsa2000 추가  2005.07.   교대근무자는 휴일에도 등록가능케.
                               FL_Comp.OnMouseDown     := nil;
                           end
                         else if FL_Comp.Hint = EXCHANGE then   //dsa2000 추가  2005.07.
                           begin
                             FL_Comp.ValueFont.Color := clPurple;
                             FL_Comp.ValueCaption := '교대';
                           end
                         else if FL_Comp.Hint = EXCHHOLI then   //dsa2000 추가  2005.07.
                           begin
                             FL_Comp.ValueFont.Color := clRed;
                             FL_Comp.ValueCaption := '비번';
                             FL_Comp.OnMouseDown     := nil;
                           end
                         else if FL_Comp.Hint = UNDECIDED then
                         begin
                           //FL_Comp.ValueFont.Color := clLime; //유효성 추가 for color
                           //FL_Comp.ValueCaption := '미입'

                           //2017.05.22.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                           FL_Comp.Hint            := NORMAL;
                           FL_Comp.ValueFont.Color := clWhite;
                           FL_Comp.ValueCaption := '정상'
                         end
                         else if FL_Comp.Hint = '' then  //2017.5.22.hjku.연차연동으로 null로 입력된 자료 미입처리 위해 (insert시와 동일처리 위해)
                           begin
                             //FL_Comp.Hint            := UNDECIDED; //미입
                             //FL_Comp.ValueFont.Color := clLime;
                             //FL_Comp.ValueCaption := '';

                             //2017.05.22.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                             FL_Comp.Hint            := NORMAL;
                             FL_Comp.ValueFont.Color := clWhite;
                             FL_Comp.ValueCaption := '정상';
                           end
                         else
                           begin
                             FL_Comp.ValueFont.Color := clRed;  //유효성 추가 for color
                             //기등록 휴가 보이도록..
                             //FL_Comp.ValueCaption := PL_Get_Code(ED_code.codeid,FL_Comp.Hint);
                             FL_Comp.ValueCaption := PL_Get_Code('Y110',FL_Comp.Hint);                             
                           end;
                         Inc(FL_k);
                       end;
                   end;
               end;

             if Trim(FieldByName('conyn').AsString) = 'Y' then
             begin
                  PA_conyn.ValueCaption   := '결재';
                  PA_contime.ValueCaption := FieldByName('conman').AsString + '   ' +
                                             FL_korname +'   '+
                                             Hinsa_DisplayDate(FieldByName('contime').AsString,'/')+'일  '+
                                                          Copy(FieldByName('contime').AsString,9,2)+'시'+
                                                          Copy(FieldByName('contime').AsString,11,2)+'분';

                  //hjku
                  //if (FG_right < 9) and (not FG_Mendyn) then BT_Yearly_Modify.Enabled := True;
                  BT_Yearly_Modify.Enabled := false;                  
                  BT_Save.Enabled   := False;
                  BT_Cancel.Enabled := False;
                  //BT_Yearly_Complete.Enabled  := False;
                  BT_Yearly_Modify.Enabled    := False;
                  //BT_ConAll.Enabled           := False;
             end
             else
             begin
                  if(trim(SL_Assign_Yn.LabelCaption)='Y') then
                  begin
                      BT_Yearly_Complete.Enabled := false;
                      BT_Yearly_Modify.Enabled := true;
                  end
                  else
                  begin
                      BT_Yearly_Complete.Enabled := true;
                      BT_Yearly_Modify.Enabled := false;
                  end;

                  {if (FG_right < 9) and (not FG_Mendyn) then //유효성 if절 추가  for bug 수정
                  begin
                       //hjku
                  //BT_Yearly_Modify.Enabled := False;
                       //hjku
                  //BT_app.Enabled    := True;
                       BT_ConAll.Enabled := True; //dsa2000 2005.07
                  end;}
             end;
           end;
         Close;
       except
         Close;
       end;
    end;
    //2017.06.29.hjku.. 다른 월 선택시 초기화 추가.. 안효상 M 요청
    PL_Get_pkyearlt(FG_yy,GV_empno);
end;

function TFM_Main.PL_Input_Check(P_code : String) : Boolean;
begin
  Result := False;
  if P_code = HOLISATUR then
    begin
      if FG_SelComp = nil then
        System.Exit;
      if FG_SelComp.LabelFont.Color <> clBlue then
        begin
          MessageDlg('토휴휴무는 토요일만 가능합니다...', mtInformation, [mbOK], 0);
          System.Exit;
        end;
    end;

  if P_code = BEAR then
    begin
//    if GetStrToInt(Copy(ED_empno.juminid,8,1)) in [1,5] then
//      begin
//        MessageDlg('남자직원일 경우 자녀출산(산휴) 휴가는 경휴로 입력하세요...', mtInformation, [mbOK], 0);
          MessageDlg('산휴는 사용자가 휴가로 등록 할 수 없습니다....', mtInformation, [mbOK], 0);
          System.Exit;
//     end;
    end;

  if P_code = HOLISICK  then
    begin
      MessageDlg('병가은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if P_code = ABROAD then
    begin
      MessageDlg('유학은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = INDICTMEN then
    begin
      MessageDlg('기소는 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = POPULAR then
    begin
      MessageDlg('일반은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = BABYCARE then
    begin
      MessageDlg('육아는 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = ILLNESS then
    begin
      MessageDlg('병상은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = MILITARY then
    begin
      MessageDlg('병역은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = PUBREST then
    begin
      MessageDlg('공상은 휴가로 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if P_code = HOLIDAY then
    begin
      MessageDlg('휴일은 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
  if (P_code = EXCHANGE) and (FG_ExchangeYN = 'N') then //dsa2000 추가  2005.07.
   begin
     MessageDlg('교대근무자가 아닙니다...', mtInformation, [mbOK], 0);
     System.Exit;
    end;
  //2007 - 6160호에 의거 추가 by 유재승 2007.03.14
  if (P_code = TEMPORARY) and (Copy(FG_grade,3,1) > 'B') then
   begin
     MessageDlg('임시는 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
     System.Exit;
    end;
  if P_code = EXCHHOLI then //dsa2000 추가  2005.07.
    begin
      MessageDlg('비번은 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
    
  Result := True;
end;

procedure TFM_Main.PL_Get_Eempno(P_empno : String);
var
  FL_Sql : String;
begin
  try
    FG_eempno  := '';
    FG_sndtel := '';
    FG_rcvtel := '';

    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT eempno,                '+
                  '       (select retcont from pimpmas where a.empno  = empno) sndtel,            '+
                  '       (select retcont from pimpmas where a.eempno = empno) rcvtel,            '+
                  '       ''field4'',            '+
                  '       ''field5''             '+
                  '  FROM pimeemp  a               '+
                  ' WHERE empno  = ''%s''        ';
        Sql.Text := Format(FL_Sql,[P_empno]);
        Open;
        FG_eempno := Trim(FieldByName('field1').AsString);
        FG_sndtel := RemoveChar(Trim(FieldByName('field2').AsString),'-');
        FG_rcvtel := RemoveChar(Trim(FieldByName('field3').AsString),'-');
        Close;
      end;
  except
  end;
end;


function TFM_Main.PL_Get_Code(acodeid, acodeno : String) : String;
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('codename',acodeid,acodeno);
end;

procedure TFM_Main.ED_yearGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_Main.SB_MonthClick(Sender: TObject);
var
  FL_i   : Integer;
  FL_j   : Integer;
  FL_k   : Integer;
  FL_d   : Integer;
  FL_Sep,AA : String;
  CDay   : TDateTime;
  FL_Comp: TOnShapeLabel;
begin
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if Trim(ED_empno.empno) = '' then
  if Trim(GV_empno) = '' then
    begin
      MessageDlg('존재하지 않는 사원이거나 타부서의 사원입니다. ', mtInformation, [mbOK], 0);
      //ED_empno.SetFocus;
      System.Exit;
    end;

  if FG_yy+FG_Month < FG_MinDate then
    begin
      MessageDlg('휴가등록 자료가 존재하지 않는 데이타입니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := '해당월의 휴가정보를 읽는 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  SB_m1.BtnDown  := False;
  SB_m2.BtnDown  := False;
  SB_m3.BtnDown  := False;
  SB_m4.BtnDown  := False;
  SB_m5.BtnDown  := False;
  SB_m6.BtnDown  := False;
  SB_m7.BtnDown  := False;
  SB_m8.BtnDown  := False;
  SB_m9.BtnDown  := False;
  SB_m10.BtnDown := False;
  SB_m11.BtnDown := False;
  SB_m12.BtnDown := False;

  TOnSkinButton(Sender).BtnDown := True;
  Hinsa_InitComponent(Self, 22);
  PA_conyn.ValueCaption := '미결재';

  if TComponent(Sender).Tag < 10 then
    FL_Sep := '0'+IntToStr(TComponent(Sender).Tag)
  else
    FL_Sep := IntToStr(TComponent(Sender).Tag);

  FG_Month := FL_Sep;

  Pkmexlist_Chk(FG_yy+FG_Month);  //dsa2000 추가 2005.07. : 교대근무자 여부 체크.

  for FL_i := 1 to 42 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        begin
          if FG_yy+FG_Month <= '200406' then
            begin
              if (FL_i mod 7) = 0 then
                FL_Comp.LabelFont.Color := clBlue
              else if (FL_i mod 7) = 1 then
                FL_Comp.LabelFont.Color := clRed
              else
                FL_Comp.LabelFont.Color := clBlack;
            end
          else
            begin
              if (FL_i mod 7) = 0 then
                FL_Comp.LabelFont.Color := clRed
              else if (FL_i mod 7) = 1 then
                FL_Comp.LabelFont.Color := clRed
              else
                FL_Comp.LabelFont.Color := clBlack;
            end;
//유효성 수정 end

          FL_Comp.LabelCaption := ' ';
          FL_Comp.Hint         := '';
          FL_Comp.OnMouseDown  := nil;
        end;
    end;

  FL_Sep := DateSeparator;
  FL_k   := 0;
  CDay   := StrToDate(ED_year.KeyItems[ED_year.ItemIndex] + FL_Sep +
                      IntToStr(TComponent(Sender).Tag)    + FL_Sep + '1');
  case DayOfWeek(CDay) of
    1 : FL_k := 1;
    2 : FL_k := 2;
    3 : FL_k := 3;
    4 : FL_k := 4;
    5 : FL_k := 5;
    6 : FL_k := 6;
    7 : FL_k := 7;
  end;

  FL_j := DaysPerMonth(StrToInt(ED_year.KeyItems[ED_year.ItemIndex]),TComponent(Sender).Tag);
  FL_d := 1;
  for FL_i := 1 to FL_k do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        FL_Comp.Visible := False;
    end;

  for FL_i := (FL_j + FL_k) to 42 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        FL_Comp.Visible := False;
    end;

  //debug for hjku  
  for FL_i := FL_k to (FL_j + FL_k) - 1 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        begin
          if not FL_Comp.Visible then
            FL_Comp.Visible := True;
//2003.7.30 유효성 수정 start : 주5일근무제에 따른수정
{
          if (FL_i mod 7) = 0 then
            begin
              FL_Comp.ValueFont.Color := clPurple;
              FL_Comp.LabelColor      := clBtnFace;
              FL_Comp.Brush.Color     := clBtnFace;
              //FL_Comp.ValueCaption    := '토휴';
              //FL_Comp.Hint            := HOLISATUR;
              FL_Comp.Hint            := UNDECIDED;
              FL_Comp.OnMouseDown     := ED_DayMouseDown;
            end
          else if (FL_i mod 7) = 1 then
            begin
              FL_Comp.LabelColor      := clBtnFace;
              FL_Comp.Brush.Color     := clBtnFace;
              FL_Comp.ValueCaption    := '휴일';
              FL_Comp.ValueFont.Color := clRed;
              FL_Comp.Hint            := HOLIDAY;
              FL_Comp.OnMouseDown     := nil;
            end
          else
            begin
              FL_Comp.LabelColor      := clWindow;
              FL_Comp.ValueFont.Color := clPurple;
              FL_Comp.Brush.Color     := clWindow;
              FL_Comp.ValueCaption    := '';
              FL_Comp.Hint            := UNDECIDED;
              FL_Comp.OnMouseDown     := ED_DayMouseDown;
            end;
}

          if FG_yy+FG_Month <= '200406' then
            begin
              if (FL_i  mod 7) = 0 then
                begin
                  FL_Comp.ValueFont.Color := clPurple;
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  //FL_Comp.ValueCaption    := '토휴';
                  //FL_Comp.Hint            := HOLISATUR;
                  FL_Comp.Hint            := UNDECIDED;
                  FL_Comp.OnMouseDown     := ED_DayMouseDown;
                end
              else if (FL_i mod 7) = 1 then
                begin
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  FL_Comp.ValueCaption    := '휴일';
                  FL_Comp.ValueFont.Color := clRed;
                  FL_Comp.Hint            := HOLIDAY;
                  FL_Comp.OnMouseDown     := nil;
                end
              else
                begin
                  FL_Comp.LabelColor      := clWindow;
                  FL_Comp.ValueFont.Color := clPurple;
                  FL_Comp.Brush.Color     := clWindow;
                  FL_Comp.ValueCaption    := '';
                  FL_Comp.Hint            := UNDECIDED;
                  FL_Comp.OnMouseDown     := ED_DayMouseDown;
                end;
            end
          else
            begin
              if (FL_i mod 7) = 0 then
                begin
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  FL_Comp.ValueCaption    := '휴일';
                  FL_Comp.ValueFont.Color := clRed;
                  FL_Comp.Hint            := HOLIDAY;
                  FL_Comp.OnMouseDown     := nil;
                end
              else if (FL_i mod 7) = 1 then
                begin
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  FL_Comp.ValueCaption    := '휴일';
                  FL_Comp.ValueFont.Color := clRed;
                  FL_Comp.Hint            := HOLIDAY;
                  FL_Comp.OnMouseDown     := nil;
                end
              else
                begin
                  FL_Comp.LabelColor      := clWindow;
                  FL_Comp.ValueFont.Color := clPurple;
                  FL_Comp.Brush.Color     := clWindow;
                  FL_Comp.ValueCaption    := '';
//hjku
//                  FL_Comp.Hint            := UNDECIDED;
                  FL_Comp.Hint            := '';
                  FL_Comp.OnMouseDown     := ED_DayMouseDown;
                end;

              if ( ((FL_i mod 7) = 0) or ((FL_i mod 7) = 1) ) and  (FG_ExchangeYN = 'Y') then //dsa2000 추가 2005.07
                begin
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  FL_Comp.ValueCaption    := '휴일';
                  FL_Comp.ValueFont.Color := clRed;
                  FL_Comp.Hint            := HOLIDAY;
                  FL_Comp.OnMouseDown     := ED_DayMouseDown;
                end;

{/ 20080916  KTH 창립기념일  초과등록

              if  (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) = '20080923')  and
                  (FG_ExchangeYN = 'Y') then //dsa2000 추가 2005.07
                begin
                  FL_Comp.LabelColor      := clBtnFace;
                  FL_Comp.Brush.Color     := clBtnFace;
                  FL_Comp.ValueCaption    := '휴근';
                  FL_Comp.ValueFont.Color := clRed;
                  FL_Comp.Hint            := HOLIDAY2;
                  FL_Comp.OnMouseDown     := ED_DayMouseDown;
                end;

// 20080916 KTH 창립기념일  초과등록}


            end;
//유효성 수정 end

          FL_Comp.LabelCaption := IntToStr(FL_d);
        end;
      Inc(FL_d);
    end;

  PL_Holiday_Check(FG_Month);

FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month);
(*//2013.08.01.hjku. HR팀 전체권한으로 변경.. 이명노M 요청
//if ((FG_empno = '0577')or(FG_empno = '2684')) then
if (FG_right=1) then
  FG_Mendyn := false
else
  FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month);
*)
  if not FG_Mendyn then
    begin
      {if FG_right < 9 then
        begin
          //hjku
                  //BT_app.Enabled    := True;
          //hjku
                  //BT_Yearly_Modify.Enabled := True;
          BT_ConAll.Enabled := True; //dsa2000 2005.07
        end;}
      BT_Save.Enabled   := True;
      BT_cancel.Enabled := True;
    end
  else
    begin
      BT_Save.Enabled   := False;
      BT_cancel.Enabled := False;
      //hjku
                  //BT_app.Enabled    := False;
      //hjku
                  //BT_Yearly_Modify.Enabled := False;
      //BT_ConAll.Enabled := False; //dsa2000 2005.07
    end;


  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //FG_Exists := PL_pkhduty_Exists(FG_yy+FG_Month, ED_empno.empno);
  FG_Exists := PL_pkhduty_Exists(FG_yy+FG_Month, GV_empno);

//2005.07. 막음.  자신의 휴가 등록은 안해도 결재는 가능하도록..
{  if (not FG_Exists) and (not FG_Mendyn) then
    begin
      BT_app.Enabled    := False;
      BT_Yearly_Modify.Enabled := False;
      BT_ConAll.Enabled := False; //dsa2000 2005.07
      SB_Help.Panels[1].Text := '해당월의 휴가등록 정보를 등록하지 않았습니다. 연차등록을 하세요...';
      System.Exit;
    end;  }

  PL_Select_pkhduty;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.ED_DayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  HintEX   : String;
  NextComp : String;
  FL_Comp  : TOnShapeLabel;
  OldHint  : String;
begin
  SB_Help.Panels[1].Text := '';
  FG_SelComp := nil;
  FG_SelComp := TOnShapeLabel(Sender);

  OldHint := TOnShapeLabel(Sender).Hint; //변경전 휴가등록 내역.

  if SL_Assign_Yn.LabelCaption = 'Y' then //유효성 추가
    begin
      //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
      //MessageDlg('연차휴가 사용계획이 등록 완료된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      MessageDlg('연차휴가 사용시기지정완료된 자료는 수정할 수 없습니다.'+#13+
                 //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
                 //'연차휴가 사용/변경 메뉴 를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
                 FL_ProgName + ' 메뉴를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  //2017.05.22.HJKU.. 연차(반연차)코드만 등록 가능하도록 제어..  
  if not((OldHint = HOLIYEAR)or(OldHint = YEARHALF)or(OldHint = NORMAL)or(OldHint = UNDECIDED)or(OldHint = '')) then
    begin
      MessageDlg('연차(반연차) 이외의 휴가코드는 수정할 수 없습니다.'+#13+'', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if(OldHint = '49') then
    begin
      MessageDlg('휴일에는 연차를 등록할 수 없습니다.', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if Copy(ED_empno.Text,1,1) = 'M' then  //dsa2000   2004.10.
  if Copy(GV_empno,1,1) = 'M' then  //dsa2000   2004.10.
    begin
      MessageDlg('임원은 연차등록이 필요하지 않습니다.', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if FG_Mendyn then
    begin
      MessageDlg('휴가등록이 마감된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if PA_conyn.ValueCaption = '결재' then //유효성 추가
    begin
      MessageDlg('결재가 완료된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if(FG_right <> 1) then // 개발자와 관리자가 아닌경우
  begin
      if(SL_Assign_Yn.LabelCaption<>'Y') then
      begin
          if not((OldHint = '') or (OldHint = NORMAL) or (OldHint = UNDECIDED)or(OldHint = HOLIYEAR) or (OldHint = YEARHALF)) then
          begin
              MessageDlg('기등록된 휴가가 존재하여 연차를 등록할 수 없습니다.', mtInformation, [mbOK], 0);
              System.Exit;
          end;
      end
      else
      begin
          if((OldHint = HOLIYEAR)or(OldHint = YEARHALF)) then
          begin
             MessageDlg('연차휴가 사용시기지정완료된 자료는 수정할 수 없습니다.'+#13+
                        //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
                        //'연차휴가 사용/변경 메뉴 를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
                        FL_ProgName + ' 메뉴를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
             System.Exit;
          end;
      end;
  end;

  ED_code.Perform(CM_EXIT,0,0);
  ED_code.Visible := False;

  if ED_code.DroppedDown then
    System.Exit;

  if Trim(TOnShapeLabel(Sender).LabelCaption) = '' then
    System.Exit;

  //2014.06.09.hjku. 수정여부 체크 추가.
  FG_Modyn := true;

  //////////////////////////////////////////////////////////////////////////////
  if Button = mbLeft then
    begin
      PA_MainPanel.SetFocus;
      if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then  //dsa2000 일반사용자만 입력체크.(관리자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
      begin
        if not PL_Input_Check(ED_hotkey.codeno) then    System.Exit;
      end;

      //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
      //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno) then
      if not PL_Get_Allow_Enroll(FG_yy, GV_empno, ED_hotkey.codeno) then
        System.Exit;

      //관리자 권한 사용자의 휴일연차등록을 위한 로직 변경.
      //요청서 : 2007-23703, 요청자 : 김경호
      //수정일 : 2007-10-09, 수정자 : 유재승
      if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then
      begin
           if (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) <> '20080923') then               // 9월 23일 창립기념일 근무 날짜  kth
             begin
                  if (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
                    begin
                      TOnShapeLabel(Sender).ValueCaption := '교대';
                      TOnShapeLabel(Sender).Hint         := EXCHANGE;
                    end
                  else if (TOnShapeLabel(Sender).Hint = EXCHANGE)  and
                          (TOnShapeLabel(Sender).LabelFont.Color = clRed) then              //dsa2000 추가  2005.07.
                    begin
                      TOnShapeLabel(Sender).ValueCaption := '휴일';
                      TOnShapeLabel(Sender).Hint         := HOLIDAY;
                    end
                  else
                    begin
                      TOnShapeLabel(Sender).ValueCaption := ED_hotkey.codename;
                      TOnShapeLabel(Sender).Hint         := ED_hotkey.codeno;
                  end;
             end
             else begin
             // 9월 23일 창립기념일 근무 시작  kth
                  if (TOnShapeLabel(Sender).Hint = HOLIDAY2) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
                    begin
                      TOnShapeLabel(Sender).ValueCaption := '교대';
                      TOnShapeLabel(Sender).Hint         := EXCHANGE;
                    end
                  else if (TOnShapeLabel(Sender).Hint = EXCHANGE)  and
                          (TOnShapeLabel(Sender).LabelFont.Color = clRed) then              //dsa2000 추가  2005.07.
                    begin
                      TOnShapeLabel(Sender).ValueCaption := '휴일';
                      TOnShapeLabel(Sender).Hint         := HOLIDAY;
                    end
                  else if (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) = '20080923') and
                     (TOnShapeLabel(Sender).Hint = HOLIDAY) then
                    begin
                      TOnShapeLabel(Sender).ValueCaption := '휴근';
                      TOnShapeLabel(Sender).Hint         := HOLIDAY2;
                    end
                  else
                    begin
                      TOnShapeLabel(Sender).ValueCaption := ED_hotkey.codename;
                      TOnShapeLabel(Sender).Hint         := ED_hotkey.codeno;
                    end;
           // 9월 23일 창립기념일 근무 끝 kth
             end;

      end
      else
      begin
           TOnShapeLabel(Sender).ValueCaption := ED_hotkey.codename;
           TOnShapeLabel(Sender).Hint         := ED_hotkey.codeno;
      end;
      //////////////////////////////////////////////////////////////////////////////

      //유효성 추가 for color
      if TOnShapeLabel(Sender).Hint = NORMAL then
        TOnShapeLabel(Sender).ValueFont.Color := clPurple
      else if TOnShapeLabel(Sender).Hint = HOLISATUR then
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = HOLIDAY then
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = HOLIDAY2 then   //20080916 kth 9월 23일 창립기념일 출근 작업
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = EXCHANGE  then  //dsa2000 추가  2005.07.
        TOnShapeLabel(Sender).ValueFont.Color := clPurple
      else if TOnShapeLabel(Sender).Hint = UNDECIDED then
        TOnShapeLabel(Sender).ValueFont.Color := clLime
      else
        TOnShapeLabel(Sender).ValueFont.Color := clRed;

      //dsa2000 추가  2005.07.   교대근무 다음날은 비번으로 자동등록.
      NextComp := IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) + 1);
      FL_Comp  := TOnShapeLabel(Self.FindComponent('ED_d'+NextComp));

      if (TOnShapeLabel(Sender).Hint = EXCHANGE) and (FG_ExchangeYN = 'Y') then
        begin
          TOnShapeLabel(FL_Comp).ValueCaption := '비번';
          TOnShapeLabel(FL_Comp).Hint         := EXCHHOLI;
          TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
          TOnShapeLabel(FL_Comp).Repaint;
          TOnShapeLabel(FL_Comp).OnMouseDown     := nil;
        end
      else if (TOnShapeLabel(Sender).Hint <> EXCHANGE) and (OldHint = EXCHANGE)  and
              (FG_ExchangeYN = 'Y') then
        begin
          TOnShapeLabel(FL_Comp).ValueCaption := '미입';
          TOnShapeLabel(FL_Comp).Hint         := UNDECIDED;
          TOnShapeLabel(FL_Comp).ValueFont.Color := clLime;
          TOnShapeLabel(FL_Comp).Repaint;
          TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;
        end;

      TOnShapeLabel(Sender).Repaint;
    end
  //////////////////////////////////////////////////////////////////////////
  else if Button = mbRight then
    begin
      if ED_code.DroppedDown then
        System.Exit;


           //관리자 권한 사용자의 휴일연차등록을 위한 로직 변경.
           //요청서 : 2007-23703, 요청자 : 김경호
           //수정일 : 2007-10-09, 수정자 : 유재승
           if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then
           begin
                if (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) <> '20080923') then               // 9월 23일 창립기념일 근무 날짜  kth
                   begin
                      if (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
                        begin
                          TOnShapeLabel(Sender).ValueCaption := '교대';
                          TOnShapeLabel(Sender).Hint         := EXCHANGE;
                        end
                      else if (TOnShapeLabel(Sender).Hint = EXCHANGE)  and
                              (TOnShapeLabel(Sender).LabelFont.Color = clRed) then              //dsa2000 추가  2005.07.
                        begin
                          TOnShapeLabel(Sender).ValueCaption := '휴일';
                          TOnShapeLabel(Sender).Hint         := HOLIDAY;
                        end
                      else
                        begin
                          ED_code.Width   := 0;
                          ED_code.Left    := TOnShapeLabel(Sender).Left;
                          ED_code.Top     := TOnShapeLabel(Sender).Top;
                          ED_code.Visible := True;
                          ED_code.codename:= '';
                          ED_code.codeno  := '';
                          ED_code.Text    := '';
                          ED_code.Perform(WM_KEYDOWN,VK_F2,0);
                        end;
                   end
                   else begin
                      // 9월 23일 창립기념일 근무 시작  kth
                      if (TOnShapeLabel(Sender).Hint = HOLIDAY2) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
                        begin
                          TOnShapeLabel(Sender).ValueCaption := '교대';
                          TOnShapeLabel(Sender).Hint         := EXCHANGE;
                        end
                      else if (TOnShapeLabel(Sender).Hint = EXCHANGE)  and
                              (TOnShapeLabel(Sender).LabelFont.Color = clRed) then              //dsa2000 추가  2005.07.
                        begin
                          TOnShapeLabel(Sender).ValueCaption := '휴일';
                          TOnShapeLabel(Sender).Hint         := HOLIDAY;
                        end
                      else if (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) = '20080923') and
                         (TOnShapeLabel(Sender).Hint = HOLIDAY) then
                         begin
                           TOnShapeLabel(Sender).ValueCaption := '휴근';
                           TOnShapeLabel(Sender).Hint         := HOLIDAY2;
                         end
                      else
                        begin
                          ED_code.Width   := 0;
                          ED_code.Left    := TOnShapeLabel(Sender).Left;
                          ED_code.Top     := TOnShapeLabel(Sender).Top;
                          ED_code.Visible := True;
                          ED_code.codename:= '';
                          ED_code.codeno  := '';
                          ED_code.Text    := '';
                          ED_code.Perform(WM_KEYDOWN,VK_F2,0);
                        end;
                   // 9월 23일 창립기념일 근무 끝 kth
                   end;
           end
           else
           begin
                ED_code.Width   := 0;
                ED_code.Left    := TOnShapeLabel(Sender).Left;
                ED_code.Top     := TOnShapeLabel(Sender).Top;
                ED_code.Visible := True;
                ED_code.codename:= '';
                ED_code.codeno  := '';
                ED_code.Text    := '';
                ED_code.Perform(WM_KEYDOWN,VK_F2,0);
           end;

      if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then  //dsa2000 일반사용자만 입력체크.(관지자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
        begin
           if not PL_Input_Check(ED_code.codeno) then
             begin
               TOnShapeLabel(Sender).ValueFont.Color := clLime;
               TOnShapeLabel(Sender).ValueCaption := '미입';
               TOnShapeLabel(Sender).Hint := UNDECIDED;
             end;
        end;

      //////////////////////////////////////////////////////////////////////////////

      //유효성 추가 for color
      if TOnShapeLabel(Sender).Hint = NORMAL then
        TOnShapeLabel(Sender).ValueFont.Color := clPurple
      else if TOnShapeLabel(Sender).Hint = HOLISATUR then
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = HOLIDAY then
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = HOLIDAY2 then   //20080916 kth 9월 23일 창립기념일 출근 작업
        TOnShapeLabel(Sender).ValueFont.Color := clRed
      else if TOnShapeLabel(Sender).Hint = EXCHANGE  then  //dsa2000 추가  2005.07.
        TOnShapeLabel(Sender).ValueFont.Color := clPurple
      else if TOnShapeLabel(Sender).Hint = UNDECIDED then
        TOnShapeLabel(Sender).ValueFont.Color := clLime
      else
        TOnShapeLabel(Sender).ValueFont.Color := clRed;

      //dsa2000 추가  2005.07.   교대근무 다음날은 비번으로 자동등록.
      NextComp := IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) + 1);
      FL_Comp  := TOnShapeLabel(Self.FindComponent('ED_d'+NextComp));

      if (TOnShapeLabel(Sender).Hint = EXCHANGE) and (FG_ExchangeYN = 'Y') then
        begin
          TOnShapeLabel(FL_Comp).ValueCaption := '비번';
          TOnShapeLabel(FL_Comp).Hint         := EXCHHOLI;
          TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
          TOnShapeLabel(FL_Comp).Repaint;
          TOnShapeLabel(FL_Comp).OnMouseDown     := nil;
        end
      else if (TOnShapeLabel(Sender).Hint <> EXCHANGE) and (OldHint = EXCHANGE)  and
              (FG_ExchangeYN = 'Y') then
        begin
          TOnShapeLabel(FL_Comp).ValueCaption := '미입';
          TOnShapeLabel(FL_Comp).Hint         := UNDECIDED;
          TOnShapeLabel(FL_Comp).ValueFont.Color := clLime;
          TOnShapeLabel(FL_Comp).Repaint;
          TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;
        end;

      TOnShapeLabel(Sender).Repaint;
    end;

  //교휴 사용가능여부 체크 . dsa2000  2005.08.
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if (not PL_ExchHoli_Exists(FG_yy+FG_Month, ED_empno.empno)) and
  if (not PL_ExchHoli_Exists(FG_yy+FG_Month, GV_empno)) and
     (TOnShapeLabel(Sender).Hint = SPEOFF) then
    begin
      MessageDlg('교휴는 전월 '+ FG_Exchange_Min +'일 이상 교대근무자만 사용가능합니다.', mtInformation, [mbOK], 0);
      TOnShapeLabel(Sender).ValueFont.Color := clLime;
      TOnShapeLabel(Sender).ValueCaption := '미입';
      TOnShapeLabel(Sender).Hint := UNDECIDED;
    end;

    //2014.06.03.hjku. 연차 등록시마다 연차일수 계산... 이명노M 요청

    if(OldHint = HOLIYEAR) then
       FG_used_Cnt := FG_used_Cnt - 1
    else if(OldHint = YEARHALF) then
       FG_used_Cnt := FG_used_Cnt - 0.5;

    if(TOnShapeLabel(Sender).Hint = HOLIYEAR) then
       FG_used_Cnt := FG_used_Cnt + 1
    else if(TOnShapeLabel(Sender).Hint = YEARHALF) then
       FG_used_Cnt := FG_used_Cnt + 0.5;

    SL_Used_Yearly_Cnt.LabelCaption   := floattostr(FG_used_Cnt);
    SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(SL_Yearlyplan_Cnt.LabelCaption) - FG_used_Cnt);

     if(strtofloat(SL_Unused_Yearly_Cnt.LabelCaption) <= 0) then
     begin
        MessageDlg('연차휴가 사용계획을 모두 등록하셨습니다. '+ #13#10+
                   '월별 저장을 Click 하신 후,'+#13#10+
                   '아래 연차휴가 사용계획 등록완료 버튼을 클릭하시기 바랍니다.', mtInformation, [mbOK], 0);
     end;
end;

procedure TFM_Main.ED_deptInitPopup(Sender: TObject);
begin
  FM_Dept.QR_Com.Session := TMaxSession;
  FM_Dept.QR_Cod.Session := TMaxSession;
  FM_Dept.FG_empno       := FG_empno;
  FM_Dept.FG_deptcode    := Self.FG_jobdept;
  FM_Dept.FG_date        := Copy(FG_Date,1,8);
  FM_Dept.FG_Right       := Self.FG_right;
  FM_Dept.FG_grade       := FG_grade;

  TOnWinPopupEdit(Sender).PopupControl := FM_Dept;
  FM_Dept.Edit           := TOnWinPopupEdit(Sender);
  FM_Dept.PG_Get_Dept;
end;

procedure TFM_Main.ED_deptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
begin
{2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_Dept.QR_cod.FieldByName('deptname').AsString + ' ' +
                                      FM_Dept.QR_cod.FieldByName('deptna3').AsString;
      TOnWinPopupEdit(Sender).Hint := FM_Dept.QR_cod.FieldByName('deptcode').AsString;

      PL_Set_empformSql(TOnWinPopupEdit(Sender).Hint, FG_empno, FG_orgnum, Copy(FG_Date,1,8));
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  ED_empno.text := '';

  ED_empno.Param_deptcode := TOnWinPopupEdit(Sender).hint;
}
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      ED_dept.Text := FM_Dept.QR_cod.FieldByName('deptname').AsString + ' ' +
                      FM_Dept.QR_cod.FieldByName('deptna3').AsString;
      ED_dept.Hint := FM_Dept.QR_cod.FieldByName('deptcode').AsString;

      PL_Set_empformSql(ED_dept.Hint, FG_empno, FG_orgnum, Copy(FG_Date,1,8));
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //ED_empno.text := '';
  //ED_empno.Param_deptcode := TOnWinPopupEdit(Sender).hint;
  
end;

procedure TFM_Main.BT_cancelClick(Sender: TObject);
begin
  PL_Month_Contructor;
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //PL_Get_pkyearlt(FG_yy,ED_empno.empno);
  PL_Get_pkyearlt(FG_yy,GV_empno);
end;

procedure TFM_Main.ED_codeCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
  if FG_SelComp <> nil then
    begin
      if ED_code.codename <> '' then
        begin
          if (Copy(FG_grade,3,1) > 'C') then  //dsa2000 일반사용자만 입력체크.(관지자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
          begin
            if not PL_Input_Check(ED_code.codeno) then   System.Exit;
          end;

          //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
          //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_code.codeno) then
          if not PL_Get_Allow_Enroll(FG_yy,GV_empno, ED_code.codeno) then
            System.Exit;
          FG_SelComp.ValueCaption := ED_code.codename;
          FG_SelComp.Hint         := ED_code.codeno;

          //유효성 추가 for color
          if FG_SelComp.Hint = NORMAL then
            FG_SelComp.ValueFont.Color := clPurple
          else if FG_SelComp.Hint = HOLISATUR then
            FG_SelComp.ValueFont.Color := clRed
//          else if FG_SelComp.Hint = HOLIDAY then
          else if (FG_SelComp.Hint = HOLIDAY) and (FG_ExchangeYN = 'N') then  //dsa2000 추가  2005.07.
            FG_SelComp.ValueFont.Color := clRed
          else if FG_SelComp.Hint = UNDECIDED then
            FG_SelComp.ValueFont.Color := clLime
          else
            FG_SelComp.ValueFont.Color := clRed;
          FG_SelComp.Repaint;
        end;
    end;
end;



procedure TFM_Main.ED_yearChange(Sender: TObject);
begin
  FG_yy := ED_year.KeyItems[ED_year.ItemIndex];
//유효성 추가
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if Trim(ED_empno.empno) <> '' then
  if Trim(GV_empno) <> '' then
    PL_Month_Contructor;
end;

function TFM_Main.PL_Get_Duty_Confirm(stdate : string) : Boolean;
begin
     result := false;

     with QR_com do
     begin
          PL_Com_Contructor;

          Sql.Add ('SELECT conyn, ''field2'', ''field3'', ''field4'', ''field5'' FROM PKHDUTY          ' );
          Sql.Add ('WHERE DUYYMM           = '''+ copy(stdate,1,6) +'''                                ' );
          Sql.Add ('  AND EMPNO            = '''+ FG_empno +'''                                ' );
          Sql.Add ('  AND NVL(conyn,''N'') = ''Y''                                                     ' );

          Open;

          if QR_com.RecordCount >= 1 then
          begin
               result := true;
          end;
     end;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
  FL_Date: String;
  FL_i   : Integer;
  FL_k   : Integer;
  FL_Comp: TOnShapeLabel;
  FL_Sql : String;
  FL_dutycode : String;
  tmpDay : String;  //입사일의 일자를 저장하기위한 임시변수 by JS 07.03.14
begin
  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if (FG_empno<> ED_empno.empno) and
  if (FG_empno<> GV_empno) and
     (FG_right<>1)        Then
//2013.08.01.hjku. HR팀 전체권한으로 변경.. 이명노M 요청
//     (Copy(ED_empno.Text,1,1) <> 'D')    and
//     (FG_empno <> '2684')        Then
  begin
      MessageDlg('본인자료만 등록 처리할 수 있습니다.', mtInformation, [mbOK], 0);
      System.Exit;
  end;

  if(SL_Assign_Yn.LabelCaption='Y') Then
  begin
     MessageDlg('이미 연차휴가 사용시기 지정이 완료되었습니다.', mtInformation, [mbOK], 0);
     System.Exit;
  end;

  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //if (Copy(ED_empno.Text,1,1) = 'M') then
  if (Copy(GV_empno,1,1) = 'M') then
  begin
    MessageDlg('연차등록을 실행할 수 없는 사원입니다. ', mtInformation,[mbOk], 0);
    //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
    //ED_empno.SetFocus;
    ED_empno.SetFocus;
    System.Exit;
  end;

  if (Copy(FG_grade,3,1) > 'C') and (FG_yy > Copy(FG_Date,1,4)) then
    begin
      MessageDlg('연차등록은 현재년도까지만 등록 할 수 있습니다.. ', mtInformation,[mbOk], 0);
      System.Exit;
    end;

//2013.09.13.hjku. 결재 완료 여부 저장하기 전 한번더 체크...    
  if (PL_Get_Duty_Confirm(FG_yy+FG_Month)) then
  begin
    MessageDlg('결재완료된 자료는 변경할 수 없습니다.', mtInformation,[mbOk], 0);
    System.Exit;
  end;

//2013.03.29.hjku. 안효상M 요청으로 BM 임시 등록하기 위해 수정
//2016.02.03.hjku. 김진호M 추가 요청.
//if not((FG_empno = '0577')or(FG_empno = '2684')) then
if not((FG_empno = '0577')or(FG_empno = '2684')or(FG_empno = '1884')) then
begin
    //요청서 2007 - 6160호에 의거 휴가코드 추가에 따른 불입처리 구현. by JS 07.03.14
    if Copy(FG_empdate,1,6) = (FG_yy+FG_Month) then
    begin
      tmpDay := Copy(FG_empdate,7,2);
      for FL_i := 1 to 42 do
      begin
        FL_Comp := nil;
        FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
        if (Trim(FL_Comp.LabelCaption) <> '') and (FL_Comp.LabelFont.Color <> clRed) and
           (StrToInt(Trim(FL_Comp.LabelCaption)) < StrToInt(tmpDay)) then
        begin
          FL_Comp.ValueCaption := '불입';
          FL_Comp.Hint         := '97';
        end;
      end;
    end;
end;
/////////////////////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '해당월의 휴가등록정보 저장 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FL_Date           := FM_Tmax.GetData('sysdate' ,'','');

  with QR_dml do
    begin
      QR_dml.ClearFieldInfo;
      if FG_Exists then
        begin
          AddField('duyymm'      ,FG_yy+FG_Month    ,ftString, False, True, False,'=');
          //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
          //AddField('empno'       ,ED_empno.empno    ,ftString, False, True, True, '=');
          AddField('empno'       ,GV_empno          ,ftString, False, True, True, '=');
        end
      else
        begin
          AddField('duyymm'      ,FG_yy+FG_Month    ,ftString, True, False, False, '');
          //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
          //AddField('empno'       ,ED_empno.empno    ,ftString, True, False, False, '');
          //AddField('korname'     ,ED_empno.korname  ,ftString, True, False, False, '');
          //AddField('orgnum'      ,ED_empno.orgnum   ,ftString, True, False, False, '');
          //AddField('deptcode'    ,ED_empno.jobdept  ,ftString, True, False, False, '');

          AddField('empno'       ,GV_empno          ,ftString, True, False, False, '');
          AddField('korname'     ,GV_korname        ,ftString, True, False, False, '');

        end;

        AddField('orgnum'      ,GV_orgnum         ,ftString, True, False, False, '');
        AddField('deptcode'    ,GV_jobdept        ,ftString, True, False, False, '');
                  
      FL_k := 1;
      for FL_i := 1 to 42 do
        begin
          FL_Comp := nil;
          FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
          if FL_Comp <> nil then
            begin
              if FL_Comp.Visible then
                begin
                  //2017.05.22.휴가계획 등록 변경에 의해 default 는 정상('00')으로 처리.. 김진호M 요청
                  //연차등록에선 미등록이 아닌 null 로 처리.
                  //if(FL_Comp.Hint = UNDECIDED) then FL_Comp.Hint := '';
                  if(FL_Comp.Hint = UNDECIDED)or(FL_Comp.Hint = '') then FL_Comp.Hint := NORMAL;
                  
//                AddField('dd'+IntToStr(FL_k),FL_Comp.Hint ,ftString, True, False, False, '');
                  if (FL_k = 1) and (FL_dutycode = EXCHANGE)  then  //dsa2000 2005.08. 전월말일 휴가코드가 교대일때 1일은 비번(07)으로.
                    AddField('dd'+IntToStr(FL_k),EXCHHOLI ,ftString, True, False, False, '')
                  else
                    AddField('dd'+IntToStr(FL_k),FL_Comp.Hint ,ftString, True, False, False, '');
                  Inc(FL_k);
                end;
            end;
        end;
      AddField('writetime'   ,FL_Date        ,ftString, True, False, False, '');
      AddField('writeman'    ,FG_empno       ,ftString, True, False, False, '');

      if FG_Exists then
      begin
          QR_dml.Update;
          //ShowMessage(QR_dml.SqlUpdate);
      end
      else
      begin
          QR_dml.Insert;
          //Memo1.Lines.Add(QR_dml.SqlInsert);
      end;

      try
        Execute;
        //FG_Exists      := True;
        //BT_app.Enabled := True;
      except
        SB_Help.Panels[1].Text := '';
      end;
      PL_Month_Contructor;
    end;
  SB_Help.Panels[1].Text := '';

  if FL_dutycode = EXCHANGE then
    MessageDlg('연차등록이 완료 되었습니다...'+#13 +
               '전월 말일 휴가코드 내역이 교대근무이므로 1일은 비번으로 자동 등록되었습니다.', mtInformation, [mbOK], 0)
  else
    MessageDlg('연차등록이 완료 되었습니다...', mtInformation, [mbOK], 0);

  //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
  //PL_Get_pkyearlt(FG_yy, ED_Empno.empno);
  PL_Get_pkyearlt(FG_yy, GV_empno);
end;

procedure TFM_Main.SB_normalClick(Sender: TObject);
begin
  ED_hotkey.Text := UNDECIDED;
  ED_hotkey.PL_get_singledata;
end;

procedure TFM_Main.BT_Yearly_CompleteClick(Sender: TObject);
var
  FL_Date,JobName : String;
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
  CmdStr,vProgId, vRundate,vMessage : String;
begin
     //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
     //if (FG_empno<> ED_empno.empno) and
     if (FG_empno<>GV_empno) and
        (FG_right <> 1)        Then
//2013.08.01.hjku. HR팀 전체권한으로 변경.. 이명노M 요청
//        (Copy(ED_empno.Text,1,1) <> 'D')    and
//        (FG_empno <> '2684')        Then
//     if(FG_empno<> ED_empno.empno) Then
     begin
        MessageDlg('본인자료만 등록 완료 처리할 수 있습니다.', mtInformation, [mbOK], 0);
        System.Exit;
     end;

     if(FG_Modyn) Then
     begin
        MessageDlg('수정한 내역을 저장하시고 완료해 주시기 바랍니다.', mtInformation, [mbOK], 0);
        System.Exit;
     end;

     if(SL_Assign_Yn.LabelCaption='Y') Then
     begin
        MessageDlg('이미 연차휴가 사용시기 지정이 완료되었습니다.', mtInformation, [mbOK], 0);
        System.Exit;
     end;

     if(strtofloat(SL_Unused_Yearly_Cnt.LabelCaption) > 0) then
     begin
        MessageDlg('연차휴가 사용시기 지정이 완료 되지 않았습니다.'+#13#13#10+
                   '등록을 완료한 후 완료처리해 주시기 바랍니다.', mtInformation, [mbOK], 0);
        System.Exit;
     end;

     //2013.07.05.hjku. 사원별 칭호 구분... 이명노M 요청
     //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
     //if(Ed_empno.empno[1] in ['P','Q','Y']) then
     if(GV_empno[1] in ['P','Q','Y']) then
        JobName := '사원'
     else JobName := 'M';

     if(trim(SL_Assign_Yn.LabelCaption)<>'Y') then
     begin
        with QR_com do
        begin
             ServiceName := 'PKA4040A_dml';
             Close;
             SQL.Clear;
             SQL.Add('UPDATE PKYEARLT                                           ');
             SQL.Add('SET ASSIGN_YN   =''Y'',                                   ');
             SQL.Add('    ASSIGNEMPNO = ''' + FG_empno + ''',           ');
             SQL.Add('    ASSIGNTIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   ');
             //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
             //SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+ED_empno.empno+'''                           ');
             SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+GV_empno+'''                           ');

             try
                  Execute
             except
                  Exit;
             end;
         end;
         SL_Assign_Yn.LabelCaption := 'Y';
     end;

     //2015.07.02.hjku..팀장님은 메일 가지 않도록 수정 요청..이명노M 요청
     //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
     //if(ED_empno.empno<>FG_eempno) then
     if(GV_empno<>FG_eempno) then
     begin

         //등록완료 메일 전송
{//2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
         SendProgID  := 'PKA4057A';
         SendEmpno   := ED_empno.empno;
         RcveEmpno   := FG_Eempno;
         MailSubject := '[연차휴가 사용계획 등록 완료] '+ED_empno.korname+JobName+'의 연차휴가 사용계획이 등록되었습니다.';
         MailBody    :=  ED_empno.korname + JobName + '의 '+copy(FG_Date,1,4) +'년도 연차휴가 사용계획이 시스템에 등록 완료되었습니다.'+#13#10+
                        '사용계획은 종합인사시스템>인사>휴가/초과근무>근태개인별 이력조회 및 출력 메뉴에서 '+#13#10+
                        '확인하실 수 있습니다.'+#13#10+
                        '즐거운 하루 되십시오.';
}
         SendProgID  := 'PKA4057A';
         SendEmpno   := GV_empno;
         RcveEmpno   := FG_Eempno;
         MailSubject := '[연차휴가 사용계획 등록 완료] '+GV_korname+JobName+'의 연차휴가 사용계획이 등록되었습니다.';
         MailBody    :=  GV_korname + JobName + '의 '+copy(FG_Date,1,4) +'년도 연차휴가 사용계획이 시스템에 등록 완료되었습니다.'+#13#10+
                        '사용계획은 종합인사시스템>인사>휴가/초과근무>근태개인별 이력조회 및 출력 메뉴에서 '+#13#10+
                        '확인하실 수 있습니다.'+#13#10+
                        '즐거운 하루 되십시오.';
         //메일내용
         ReceiveYN   := 'N';

         if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
         begin
              {//이명노M 요청으로 문자전송 삭제
              if(FG_rcvtel<>'') then
              begin
                  //등록완료 문자전송
                  vProgId           := 'pksendsms';

                  FM_Tmax           := TFM_Tmax.Create(Self);
                  FM_Tmax.T_Session := TMaxSession;

                  vRundate          := FM_Tmax.GetData('sysdate' ,'','');
                  vMessage          := '"'+ED_empno.korname+'('+ED_empno.empno+')"';

                  CmdStr := '/hper/insa/HINSA/proc/bin/Kbin/pksendsms'+' '
                            +ED_empno.empno+' '+vProgId+' '+vRundate+' '+FG_rcvtel+' '+FG_sndtel+' '+vMessage+' '+'1';

                  with QR_com do
                  begin
                       Close;
                       ServiceName := 'HINSA_batch';
                       ClearFieldInfo;
                       ClearParamInfo;
                       AddParam('cmdstr', 300, CmdStr);
                       Execute;    //실제 SMS 전송실행.

                       Close;
                       ServiceName := 'SHR0SSEL';
                       ClearFieldInfo;
                       ClearParamInfo;
                       AddField('RESULT', ftString, 5000);
                       Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                                          ' WHERE RUNDATE = ''%s''     '+
                                          '   AND PROGID  = ''%s''     '+
                                          ' ORDER BY to_number(SEQNO)  ',[vRundate, vProgId]);
                       Open;

                       Memo1.Clear;
                       while not Eof do
                       begin
                            Memo1.Lines.Add(FieldByName('RESULT').AsString);
                            Next;
                       end;

                  end; //with TDS_batch do ////////////////////////////////////////////////
                  MessageDlg('연차휴가 사용계획 등록완료 메일/문자 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
              end
              else
              begin
                  MessageDlg('연차휴가 사용계획 등록완료 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
              end;
              }
             MessageDlg('연차휴가 사용계획 등록 완료 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
         end
         else
         begin
              MessageDlg('연차휴가 사용계획 등록 완료 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
              exit;
         end;
     end;
          //////////////////////////////////////////////////////////////////////////////

     MessageDlg('연차휴가 사용계획 등록 완료 처리되었습니다.',mtInformation, [mbOk], 0);
     SB_Help.Panels[1].Text := '연차휴가 사용계획 등록 완료 처리되었습니다.';

     //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
     //PL_Get_pkyearlt(FG_yy, ED_Empno.empno);
     PL_Get_pkyearlt(FG_yy, GV_empno);
end;

function TFM_Main.Chk_noinput(duyymm, empno :string): Boolean;
var
  FL_Sql : String;
  FL_Chk : Integer;
begin
  //계속 근무자
  with QR_Com do
    begin
      PL_Com_Contructor;
      FL_Sql := 'SELECT count(*)      field1,             '+
                '       ''field2'', ''field3'',           '+
                '       ''field4'', ''field5''            '+
                '  FROM PKHDUTY A, PIMPMAS B              '+
                ' WHERE A.EMPNO = B.EMPNO                 '+
                '   AND A.DUYYMM <> SUBSTR(B.EMPDATE,1,6) '+
                '   AND A.duyymm = ''%s'''+                
//                '  FROM PKHDUTY A        '+
//                ' WHERE A.duyymm = ''%s'''+
                '   AND A.empno  = ''%s'''+
                '   AND (A.dd1 =''99'' or'+
                '        A.dd2 =''99'' or'+
                '        A.dd3 =''99'' or'+
                '        A.dd4 =''99'' or'+
                '        A.dd5 =''99'' or'+
                '        A.dd6 =''99'' or'+
                '        A.dd7 =''99'' or'+
                '        A.dd8 =''99'' or'+
                '        A.dd9 =''99'' or'+
                '        A.dd10=''99'' or'+
                '        A.dd11=''99'' or'+
                '        A.dd12=''99'' or'+
                '        A.dd13=''99'' or'+
                '        A.dd14=''99'' or'+
                '        A.dd15=''99'' or'+
                '        A.dd16=''99'' or'+
                '        A.dd17=''99'' or'+
                '        A.dd18=''99'' or'+
                '        A.dd19=''99'' or'+
                '        A.dd20=''99'' or'+
                '        A.dd21=''99'' or'+
                '        A.dd22=''99'' or'+
                '        A.dd23=''99'' or'+
                '        A.dd24=''99'' or'+
                '        A.dd25=''99'' or'+
                '        A.dd26=''99'' or'+
                '        A.dd27=''99'' or'+
                '        A.dd28=''99'' or'+
                '        A.dd29=''99'' or'+
                '        A.dd30=''99'' or'+
                '        A.dd31=''99'' )  ';

      Sql.Text := Format(FL_Sql,[duyymm, empno]);
      Open;
      FL_Chk := FieldByName('field1').AsInteger;
    end;

  if FL_Chk > 0 then
      Chk_noinput := True
  else
      Chk_noinput := False;


  //신규입사자   dsa2000  2007.02. Add
  FG_NewEmpno := False;
  with QR_Com do
    begin
      PL_Com_Contructor;
      FL_Sql := 'SELECT count(*)      field1,            '+
                '       ''field2'', ''field3'',          '+
                '       ''field4'', ''field5''           '+
                '  FROM PKHDUTY A, PIMPMAS B             '+
                ' WHERE A.EMPNO = B.EMPNO                '+
                '   AND A.DUYYMM = SUBSTR(B.EMPDATE,1,6) '+
                '   AND A.duyymm = ''%s''                '+
                '   AND A.empno  = ''%s''                ';

      Sql.Text := Format(FL_Sql,[duyymm, empno]);
      Open;

      if FieldByName('field1').AsInteger > 0 then
        FG_NewEmpno := True;
    end;      
end;


procedure TFM_Main.BT_Yearly_ModifyClick(Sender: TObject);
var
  FL_Date : String;
begin
{    if (trim(SL_Assign_Yn.LabelCaption) <>'Y')and (FG_right >2) then
    begin
      MessageDlg('연차휴가 사용계획을 등록 완료 하지 않은 자료입니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

     if(FG_empno <>'D029')and (FG_empno <>'2684')  then
     begin
        MessageDlg('7월 중순이후 개발예정입니다.', mtInformation, [mbOK], 0);
        System.Exit;
     end;

  FM_Modify := TFM_Modify.Create(Self);
  FM_Modify.ShowModal;
}
{  if not FG_Exists then
    begin
      MessageDlg('연차등록을 완료 하지 않은 자료입니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if FG_Mendyn then
    begin
      MessageDlg('연차등록이 마감된 자료입니다... 결재 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := '휴가계획 등록 자료 결재작업 취소 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FL_Date           := FM_Tmax.GetData('sysdate' ,'','');

  with QR_dml do
    begin
      QR_dml.ClearFieldInfo;
      AddField('duyymm'      ,FG_yy+FG_Month    ,ftString, False, True, False,'=');
      AddField('empno'       ,ED_empno.empno    ,ftString, False, True, True, '=');
      AddField('conyn'       ,'N'               ,ftString, True, False, False, '');
      AddField('contime'     ,FL_Date           ,ftString, True, False, False, '');
      AddField('conman'      ,FG_empno          ,ftString, True, False, False, '');
      AddField('writetime'   ,FL_Date           ,ftString, True, False, False, '');
      AddField('writeman'    ,FG_empno          ,ftString, True, False, False, '');
      Update;
      try
        Execute;
      except
      end;
    end;
  PL_Month_Contructor;
  SB_Help.Panels[1].Text := '';
  MessageDlg('휴가계획 등록 자료 결재 취소작업이 완료 되었습니다...', mtInformation, [mbOK], 0);
  }
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

//교대근무자 여부 체크...dsa2000   2005.07.
Function TFM_Main.Pkmexlist_Chk(yyyymm : String) : String;
var
  FL_Sql : String;
begin
  with QR_com do
    begin
      PL_Com_Contructor;
      FL_Sql := Format('SELECT Decode(count(*),0,''N'',''Y''), '+
                       '       ''field2'',       '+
                       '       ''field3'',       '+
                       '       ''field4'',       '+
                       '       ''field5''        '+
                       '  FROM pkmexlist         '+
                       ' WHERE duyymm = ''%s''   '+
                       '   AND empno  = ''%s''   '+
                       '   AND ExchangeYN =''Y'' ', [yyyymm, FG_empno]);
      Sql.Text := FL_Sql;
      Open;

      FG_ExchangeYN := FieldByName('field1').AsString;
      FG_ExchangeYN := 'Y'; ///dsa2000 임시.  showMessage('Function FG_ExchangeYN : '+ FG_ExchangeYN);
      Close;
    end;
end;

//dsa2000  2005.08.  전월 교대근무 휴가체크하여 교휴 사용여부 체크.
function TFM_Main.PL_ExchHoli_Exists(P_yymm, P_empno : String) : Boolean;
var
  FL_Sql : String;
begin
  Result := False;
  try
    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT KIJUN21, ''field2'', ''field3'', ''field4'', ''field5''  '+
                  '  FROM PKCEXBAS   '+
                  ' WHERE DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'') ';
        Sql.Text := Format(FL_Sql, [P_yymm]);
        Open;
        FG_Exchange_Min := FieldByName('field1').AsString; //교휴 사용가능한 최소 교대근무 기준일수.

        //7일이상 교대근무자 체크...
        PL_Com_Contructor;
        FL_Sql := 'SELECT COUNT(EMPNO), NVL(SUM(EXCHANGE),0) , '+
                  '       DECODE(SIGN(NVL(SUM(EXCHANGE)+1,0)-MAX(KIJUN11)),1, MAX(KIJUN12), MAX(KIJUN22)) A,'+
                  '       ''field4'',  ''field5''              '+
                  '  FROM PKHDUTY A, PKCEXBAS B                '+
                  ' WHERE A.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')          '+
                  '   AND B.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')          '+
                  '   AND A.EMPNO  = ''%s''                    '+
                  '   AND A.EXCHANGE >= ''%s''                 ';
        Sql.Text := Format(FL_Sql,[P_yymm, P_yymm, P_empno, FG_Exchange_Min]);
        Open;

        FG_ExchHoli_Max := 0;
        if GetStrToInt(Trim(FieldByName('field1').AsString)) > 0 then
        begin
          FG_ExchHoli_Max := GetStrToInt(Trim(FieldByName('field3').AsString));
          Result := True;
        end;

        Close;
      end;
  except
    System.Exit;
  end;
end;

//deleted by hjku. 2014.06.09.
{procedure TFM_subMain.OnFocusButton1Click(Sender: TObject);    //dsa2000  2005.11.09.
begin
  FG_bldcodeYN := True;
end;

procedure TFM_subMain.ED_TypeChange(Sender: TObject);
begin
  sub_BT_Exit.SetFocus;
end;
}
procedure TFM_Main.SB_Assign_nClick(Sender: TObject);
begin
  if Application.MessageBox('해당사원의 연차 사용시기 지정 완료여부를 해제하시겠습니까?','[알림]',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
  begin
       if(SL_Assign_Yn.LabelCaption='Y') then                                                                            
       begin
           with QR_com do                                                                                                 
           begin
                ServiceName := 'PKA4040A_dml';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PKYEARLT                                           ');
                SQL.Add('SET ASSIGN_YN   =''N'',                                   ');
                SQL.Add('    ASSIGNEMPNO = ''' + FG_empno + ''',   ');
                SQL.Add('    ASSIGNTIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   ');
                //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                //SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+ED_empno.empno+'''                           ');

                SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+GV_empno+'''                           ');

                try                                                                                                       
                     Execute                                                                                              
                except
                     Exit;                                                                                                
                end;
            end;
       end;
  end;
    //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
    //PL_Get_pkyearlt(FG_yy, ED_Empno.empno);
    PL_Get_pkyearlt(FG_yy, GV_empno);
end;


procedure TFM_Main.SB_Assign_yClick(Sender: TObject);
begin
    if(SL_Assign_Yn.LabelCaption='Y') then
    begin
        MessageDlg('등록완료된 자료입니다.', mtInformation, [mbOK], 0);
        System.Exit;
    end;
    
  if Application.MessageBox('해당사원의 연차 사용시기 지정 완료여부를 설정하시겠습니까?','[알림]',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
  begin
       if(SL_Assign_Yn.LabelCaption<>'Y') then
       begin
           with QR_com do                                                                                                 
           begin
                ServiceName := 'PKA4040A_dml';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PKYEARLT                                           ');
                SQL.Add('SET ASSIGN_YN   =''Y'',                                   ');
                SQL.Add('    ASSIGNEMPNO = ''' + FG_empno + ''',   ');
                SQL.Add('    ASSIGNTIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   ');

                //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
                //SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+ED_empno.empno+'''                           ');
                SQL.Add(' WHERE yearly_yy = '''+FG_yy+''' AND empno = '''+GV_empno+'''                           ');

                try
                     Execute                                                                                              
                except
                     Exit;                                                                                                
                end;
            end;
       end;
  end;
    //2015.10.26.hjku.. ed_empno 컴포넌트 교체로 인해 수정..
    //PL_Get_pkyearlt(FG_yy, ED_Empno.empno);
    PL_Get_pkyearlt(FG_yy, GV_empno);
end;

procedure TFM_Main.PL_Select_pkyearlt(workyy, empno : string;
                   out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String);
var
  FL_i       : Integer;
  FL_k       : Integer;
  FL_LastDay : Integer;
  FL_Comp    : TOnShapeLabel;
  FL_korname : String;
  FL_Sql     : String;
begin

  with QR_com do
    begin
      PL_Com_Contructor;
      
      SQL.Add('SELECT YEARLY_CNT,                                                                            ');
      SQL.Add('       YEARLYPLAN_CNT,                                                                        ');
      SQL.Add('       PAYUTIL.GET_DUTY_CNT(EMPNO,YEARLY_YY||''0101'',YEARLY_YY||''1231'',''1'') USED_YEARLY_CNT, ');
      SQL.Add('       NVL(NOTICE_YN,''N'') NOTICE_YN,                                                        ');
      SQL.Add('       NVL(ASSIGN_YN,''N'') ASSIGN_YN                                                         ');
      SQL.Add('  FROM PKYEARLT                                                                               ');
      SQL.Add(' WHERE yearly_yy = '''+workyy+''' AND empno = '''+empno+'''                           ');
      Open;

      if(RecordCount > 0) then
      begin
          yearly_cnt        := FieldByName('field1').AsString;
          yearlyplan_cnt    := FieldByName('field2').AsString;
          used_yearly_cnt   := FieldByName('field3').AsString;
          notice_yn         := FieldByName('field4').AsString;
          assign_yn         := FieldByName('field5').AsString;
      end
      else
      begin
          yearly_cnt        := '0';
          yearlyplan_cnt    := '0';
          used_yearly_cnt   := '0';
          notice_yn         := '0';
          assign_yn         := '0';
      end;
    end;
end;

function TFM_Main.PL_Get_Right(P_empno, P_orgnum : String) : Integer;
var
  FL_Sql : String;
begin
  if (Copy(FG_grade,3,1) <= 'C') and (FG_grade <> '') then
//      and ((FG_empno = '2684')   or  (copy(FG_empno,1,1) = 'D')) then
    Result := 1   // 전체조회
  else
    Result := 9;  // 본인조회
 //deleted by hjku 2014.06.09. 불필요 코드 삭제
 {
  try
    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT empno,                 '+
                  '       ''field2'',            '+
                  '       ''field3'',            '+
                  '       ''field4'',            '+
                  '       ''field5''             '+
                  '  FROM pimeemp                '+
                  ' WHERE empno  = ''%s''        '+
                  '   AND eempno = ''%s''        '+
                  'UNION                         '+
                  'SELECT A.empno,               '+
                  '       ''field2'',            '+
                  '       ''field3'',            '+
                  '       ''field4'',            '+
                  '       ''field5''             '+
                  ' FROM pkcotman A, pimpmas B   '+
                  'WHERE A.empno     = B.empno   '+
                  '  AND A.deptcode  = B.jobdept '+
                  '  AND B.pstate    < ''80''    '+
                  '  AND A.jobkind   = ''1''     '+
                  '  AND NVL(A.jobtodate,''99999999'') >=''%s'' '+
                  '  AND A.orgnum    = ''%s''    '+
                  '  AND A.empno     = ''%s''    ';
        Sql.Text := Format(FL_Sql,[P_empno, FM_Main.FG_empno, Copy(FG_Date,1,8), P_orgnum, FM_Main.FG_empno]);
        Open;
        if Trim(FieldByName('field1').AsString) <> '' then
          Result := 2;  // 결재가능
        Close;
      end;
  except
  end;
 }
end;

procedure TFM_Main.Show_Yearly_Notice;
begin
    if(SL_Notice_Yn.LabelCaption='N') then
    begin
       //2013.12.4.hjku 이명노 M 요청으로 로그인시 바로 보이도록..
       FM_subMain := TFM_subMain.Create(Self);

       FM_subMain.SL_Yearly_Cnt.LabelCaption        := SL_Yearly_Cnt.LabelCaption        ;
       FM_subMain.SL_Yearlyplan_Cnt.LabelCaption    := SL_Yearlyplan_Cnt.LabelCaption    ;
       FM_subMain.SL_Used_Yearly_Cnt.LabelCaption   := SL_Used_Yearly_Cnt.LabelCaption   ;
       FM_subMain.SL_Unused_Yearly_Cnt.LabelCaption := SL_Unused_Yearly_Cnt.LabelCaption ;

       FM_subMain.ShowModal;
    end;
end;


procedure TFM_Main.ED_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
      GV_empno     := EmpForm.GSempnoS    ;
      GV_korname   := EmpForm.GSkornameS  ;
      GV_empdate   := EmpForm.GSempdateS  ;
      GV_orgnum    := EmpForm.GSorgnumS   ;
      GV_deptcode  := EmpForm.GSdeptcodeS ;
      GV_deptname  := EmpForm.GSdeptnameS ;
      GV_jobdept   := EmpForm.GSjobdeptS  ;

      ED_empno.Text:= GV_empno +' - ' + GV_korname;

      ED_dept.text := GV_deptname;
      ED_dept.hint := GV_jobdept;

       PL_Get_Eempno(GV_empno) ;
       PL_Month_Contructor;
       PL_Get_pkyearlt(FG_yy,GV_empno);
       Show_Yearly_Notice;
  end;
end;

procedure TFM_Main.ED_empnoInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSempdateS  := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;

    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       ED_empnoInitPopup(Self);
  end;
end;

initialization
 begin
   CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'PKA4057A.exe');//XXXX.exe:실행파일명
   if GetLastError = ERROR_ALREADY_EXISTS then
   begin
     ShowMessage('다른 [연차휴가사용촉진],[휴가계획 등록]을 종료하신후 하나의 프로그램만 실행해 주시기 바랍니다.');
     halt;
   end;
 end;
end.
