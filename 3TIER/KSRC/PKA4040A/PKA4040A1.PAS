{-------------------------------------------------------------------------------
  o 프로그램명 : 휴가계획등록 프로그램
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 급여(인사)
  o 작성자     : 홍길동 [링크웨어, 대리, 011-318-9876]
  o 버전       : 10.36
  o 작성일자   : 1997.10.10
  o 변경 이력사항
        버전 일자       작성자   변경내용                   처리명세서 반영여부
   (예) 1.1  1999.10.10 홍길동   경조금 코드 변경에 따른    반영
                                 수정 (직급필드 추가)
-------------------------------------------------------------------------------}
unit pka4040a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnTmaxPersonEdit, ImgList, OnShapeLabel,
  OnSkinBtn, OnPopupEdit, OnInsaCommon, OnCalendarUtil,
  OnStringUtils, OnTmaxCodeEdit, Db, Tmax_DataSetText, OnListbox, Pass, func,
  OnTmaxDeptEdit, OnEditMemo, Tmax_DmlSet, OnRegistry, TmaxFunc, PDownLoad, Kylib1, UDutycode;

type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    ImageList1: TImageList;
    QR_com: TTMaxDataSet;
    QR_sel1: TTMaxDataSet;
    QR_dml: TTMaxDML;
    SF_Main: TOnSchemeForm;
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
    Label9: TLabel;
    SB_All: TOnSkinButton;
    Shape5: TShape;
    PA_Buttons: TPanel;
    BT_app: TOnFocusButton;
    BT_canapp: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    SB_Help: TStatusBar;
    ED_year: TOnComboEdit;
    ED_empno: TTMaxPersonPopupEdit;
    ED_dept: TOnWinPopupEdit;
    ED_code: TTMaxCodePopupEdit;
    ED_Holi: TOnListBox;
    ED_hotkey: TTMaxCodePopupEdit;
    BT_ConAll: TOnFocusButton;
    ED_bldcode: TTMaxCodePopupEdit;
    OnFocusButton1: TOnFocusButton;
    Shape3: TShape;
    ED_empdate: TOnShapeLabel;
    ED_Type: TOnComboEdit;
    SB_normal: TOnFocusButton;
    inform_Panel: TPanel;
    Y_close: TOnFocusButton;
    Y_move: TOnFocusButton;
    Label54: TLabel;
    year_text: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    OnSectionLabel3: TOnSectionLabel;
    Label13: TLabel;
    Label12: TLabel;
    bt_move: TOnFocusButton;
    Bt_Menual: TOnFocusButton;
    P_2016: TPanel;
    e_korname: TOnEdit;
    OnEdit1: TOnEdit;
    OnEdit2: TOnEdit;
    OnEdit3: TOnEdit;
    OnEdit4: TOnEdit;
    year1: TOnEdit;
    year2: TOnEdit;
    year3: TOnEdit;
    special1: TOnEdit;
    special3: TOnEdit;
    special2: TOnEdit;
    OnEdit11: TOnEdit;
    P_2017: TPanel;
    OnEdit5: TOnEdit;
    OnEdit6: TOnEdit;
    OnEdit7: TOnEdit;
    OnEdit8: TOnEdit;
    OnEdit9: TOnEdit;
    year2017_1: TOnEdit;
    year2017_2: TOnEdit;
    year2017_3: TOnEdit;
    special2007_1: TOnEdit;
    special2007_3: TOnEdit;
    special2007_2: TOnEdit;
    OnEdit17: TOnEdit;
    OnEdit18: TOnEdit;
    year2017_4: TOnEdit;
    special2007_4: TOnEdit;
    OnEdit21: TOnEdit;
    year2017_5: TOnEdit;
    special2007_5: TOnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
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
    procedure SB_AllClick(Sender: TObject);
    procedure ED_yearChange(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_normalClick(Sender: TObject);
    procedure BT_appClick(Sender: TObject);
    procedure BT_canappClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ConAllClick(Sender: TObject);

//    procedure Send_Mail(sSendToemp : String; sSendToName : String);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ED_TypeChange(Sender: TObject);
    procedure Y_moveClick(Sender: TObject);
    procedure Y_closeClick(Sender: TObject);
    procedure bt_moveClick(Sender: TObject);
    procedure Bt_MenualClick(Sender: TObject); //메일발송

  private
    { Private declarations }
    FL_Start : Boolean;
//    nMail    : ILotusNotes_Hana;

    procedure PL_InitJob;
    procedure PL_Holiday_Check(P_month : String);

    procedure PL_Com_Contructor;

    Function  Pkmexlist_Chk(yyyymm : String) : String;  //dsa2000 2005.07  : 교대근무자인지 체크.
    function  PL_make_Sql1(P_empno, P_fryear, P_toyear : String) : String;
    //2016.09.23.hjku.. 입력정보와 동일한 휴가 입력시 오류 수정.. 이명노M 요청
    //function  PL_Get_Allow_Enroll(P_yy, P_empno, P_code : String) : Boolean;
    function  PL_Get_Allow_Enroll(P_yy, P_empno, P_code, p_day : String) : Boolean;
    function  PL_code_Exists(P_code : String) : Boolean;
    function  PL_pkhduty_Exists(P_yymm, P_empno : String) : Boolean;
    function  PL_ExchHoli_Exists(P_yymm, P_empno : String) : Boolean; //dsa2000 추가.
    function  PL_Input_Check(P_code : String) : Boolean;
    function  PL_Retire_Check(P_empno : String): Boolean;
    function  PL_Get_Code(acodeid, acodeno : String) : String;
    function  Chk_noinput(duyymm, empno :string): Boolean;
    function  ConYN_Chk(duyymm, empno :string): Boolean;
    function  Bldcode_Chk(P_bldcode : String) : Boolean; //dsa2000  2005.11 근무지코드 유효성 체크
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
    function  PL_Chk_Pkyearlt_Completed(P_yy, P_empno : String) : Boolean;
    function  PL_Select_pkyearlt(workyy, empno : string;
                   out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String): Boolean;

  public
    { Public declarations }
    FG_yy       : String;
    FG_Month    : String;
    FG_Date     : String;
    FG_empno    : String;
    FG_korname  : String;
    FG_empdate  : String;
    FG_retdate  : String;
    FG_grade    : String;
    FG_orgnum   : String;
    FG_jobdept  : String;
    FG_SelComp  : TOnShapeLabel;
    FG_YearFln  : TStringList;
    FG_MinDate  : String;
    FG_Exists   : Boolean;
    FG_Mendyn   : Boolean;
    FG_right    : Integer;
    FG_SelectSql: String;
    FG_pass     : String;     //dsa2000  2005.03.
    FG_ExchangeYN : String;   //dsa2000  2005.07.
    FG_Exchange_Min : String; //dsa2000  2005.08.
    FG_ExchHoli_Max : Integer;//dsa2000  2005.08.
    FG_bldcodeYN : Boolean;
    FG_NewEmpno : Boolean;  //신규입사자
    FG_PstateYN : String;   //hjku 2014.03.19
    GS_YYYYMM    : String;   //2015.06.17.hjku.. 연차사용촉진 월 제어하기 위해 추가..
    GS_Error_YN : Boolean;

    GS_yearly_cnt, GS_yearlyplan_cnt, GS_used_yearly_cnt, GS_cur_used_yearly_cnt, GS_except_yearly_cnt, GS_cur_yearly_cnt : real;
    GS_tot_yearly_cnt, GS_pre_used_cnt : real;
    GS_special_cnt, GS_used_special_cnt, GS_cur_used_special_cnt, GS_except_special_cnt, GS_cur_special_cnt : real;
    GS_Knteyymm : String;
    OldHint, OldCaption, OldDay  : String;

    function  PL_Month_endyn(P_yymm, P_empno : String) : Boolean;
    procedure PL_Month_Contructor;
    procedure PL_Select_pkhduty;
    procedure PL_Set_empformSql(P_deptcode, p_eempno, p_orgnum, p_jobtodate : String);
    function  PL_Get_Right(P_empno, P_orgnum : String) : Integer;
    procedure get_dayoff_list(duyymm, empno : string);
    function  PL_Chk_Yearly_Cnt(p_code : String) : Boolean;
    function  PL_code_check(p_oldcode : String) : Boolean;
  end;
type
  CodeRec = record
           codeno   : string[50];
           codename : string[50];
end;

var
  FM_Main: TFM_Main;

  //2015.02.27.hjku.. 연차 프로그램 메시지 출력용 추가..  
  //연차등록 prog.
  FL_Progid     : String = 'PKA4058A'; //연차등록 프로그램 ID
  FL_Tier       : String = '3';        //연차등록 프로그램 ID Tier
  //FL_ProgName   : String;              //연차등록 프로그램명
  codefile : array[1..100] of CodeRec;
  codeidx : integer;


{2016.10.11.hjku.. unit Dutycode 로 옮김(subform도 공통으로 사용하기 위해)
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
  SPECIAL   = '51'; // 특휴 2016.09.23.hjku.. 추가
  LONGWORK  = '52'; // 장휴
}

implementation

uses pka4040a2, pka4040a3, popup, PKA4040A4;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
    ///////////////////////////////////////////////////////////////////////
    //TMaxSession.EnvFileName := 'd:\src\newhana.env';
    TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
    TMaxSession.LabelName   := 'HANAROHPER';
    TMaxSession.Connect  := False;

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

    //2016.06.13.hjku.. fm_download 변수 추가..
    VarLoading;

    //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
    FM_Tmax := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
      Application.Terminate;
    ///////////////////////////////////////////////////////////////////////


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
end;

procedure TFM_Main.FormActivate(Sender: TObject);
var
  yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String; //2015.06.18.hjku.. 연차사용촉진 관련 변수 추가.
begin
  if FL_Start then
  begin
    FL_Start := False;
    SF_Main.Refresh;
    Application.ProcessMessages;

    PA_MainPanel.SetFocus;
    SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
    SB_Help.Perform(WM_PAINT,0,0);


    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    FG_Date           := FM_Tmax.GetData('sysdate' ,'','');

    FG_empno   := Hinsa_Param(CmdLine,1);
    FG_korname := Hinsa_Param(CmdLine,2);
    FG_pass    := Hinsa_Param(cmdLine,3);
    FG_grade   := Hinsa_Param(CmdLine,4);

    //2015.06.17.hjku.. 연차사용촉진 제어하기 위해 추가.. 이명노M요청
    GS_YYYYMM   := Copy(FG_Date,1,6);

    //2016.09.23.hjku.. 사용자/관리자 휴가 등록 코드 분리 조회. 이명노M 요청
    if (Copy(FG_grade,3,1) <= 'C') or (copy(FG_empno,1,1)='D') then
    begin
      ED_hotkey.codeid := 'Y210';
      ED_code.codeid := 'Y210';

      //2017.03.03.hjku.. 관리자 일괄 등록 오픈... 김진호M 요청
      SB_All.Visible := true;
    end
    else
    begin
      ED_hotkey.codeid := 'Y110';
      ED_code.codeid := 'Y110';

      //2017.03.03.hjku.. 관리자 일괄 등록 오픈... 김진호M 요청
      SB_All.Visible := false;
    end;

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
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

       if(FL_ProgName='') then FL_ProgName := '[연차휴가 사용신청 및 변경]';
  end;
}  

    PL_InitJob;
  end;

  //2017.06.29.hjku.. 공지 추가.. 안효상 M 요청
  if (copy(GS_YYYYMM,5,2)='07') or (copy(GS_YYYYMM,5,2)='08') then
  begin
      PL_Select_Pkyearlt(copy(GS_YYYYMM,1,4),ED_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);

      if ((notice_yn='N') or (Copy(FG_empno,1,1) = 'D') or (FG_empno = '0577') or (FG_empno = '1884')) then
      begin
          if not((strtofloat(yearly_cnt) <= 0)or(ED_empno.empno[1] in ['Y','P','Q'])) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
              FM_popup.SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
              FM_popup.SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
              FM_popup.SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));
              FM_popup.p_yearly_notice.visible  := true;
              FM_popup.p_yearly_notice2.visible := false;
              FM_popup.p_yearly_notice3.visible := false;
              FM_popup.p_yearly_notice.align    := alClient;
              FM_popup.width  := 710;
              FM_popup.height := 348;
              FM_popup.caption := '[공지사항]';
              FM_popup.ShowModal;
              PL_Month_Contructor;
          end;
      end
  end;

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

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(FG_YearFln) then
    begin
      FG_YearFln.Clear;
      FG_YearFln.Free;
    end;

  Application.ProcessMessages;
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
    Close;
end;

procedure TFM_Main.PL_InitJob;
var
  FL_Date : String;
  FL_Sql  : String;
  FL_IDate: Integer;
begin
  FG_right   := 9;
  FG_jobdept := '';
  FG_orgnum  := '';
  FL_Date    := Copy(FG_Date,1,4);
  FG_Month   := Copy(FG_Date,5,2);
  GS_Error_YN := false;

  //2016.09.26.hjku.. 등록가능 코드 초기화
  for codeidx := 1 to 100 do
  begin
     codefile[codeidx].codeno   := '';
     codefile[codeidx].codename := '';
  end;

  with QR_com do
  begin
    PL_Com_Contructor;

    Sql.Add('SELECT codeno, codename,'' '', '' '','' '' ');
    Sql.Add('  FROM pyccode                             ');
    Sql.Add(' WHERE codeid='''+ED_code.codeid+'''       ');
    Sql.Add('   and useyn = ''Y''                       ');      
    Open;

    codeidx := 0;
    while not eof do
    begin
       codeidx := codeidx + 1;
       codefile[codeidx].codeno   := FieldByName('field1').AsString;
       codefile[codeidx].codename := FieldByName('field2').AsString;
       next;
    end;

    close;
  end;

  if not IsNumber(FL_Date) then
    System.Exit;

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

  //2016.09.26.hjku.. 등록코드 초기값 설정
  //ED_hotkey.Text := '00';
  ED_hotkey.Text := '63';
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

        // 휴가계획등록 최소 월값을 가져온다...
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

//유효성 추가 start for 소속부서명 대신 근무부서명을 읽어오기 위해
  ED_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,       '+
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
//유효성 추가 end

  if FG_empno <> '' then
    begin
      ED_empno.OnReadEnded := nil;
      ED_empno.Text := FG_empno;
      ED_empno.PL_get_singledata;
      FG_empdate    := ED_empno.empdate;
      ED_dept.Text  := ED_empno.deptname;
      ED_dept.Hint  := ED_empno.jobdept;
      //요청서2007 - 6160호에 의거 입사일자 출력을 위해 추가.
      //작업자 : 유재승  | 작업일 : 2007.03.14
      ED_empdate.ValueCaption := Copy(FG_empdate,1,4)+'-'+Copy(FG_empdate,5,2)+'-'+Copy(FG_empdate,7,2);
      FG_orgnum     := ED_empno.orgnum;
      FG_jobdept    := ED_empno.jobdept;
      ED_empno.OnReadEnded := ED_empnoReadEnded;
    end;

  // 권한 설정...
  FG_right := PL_Get_Right(ED_empno.empno, ED_empno.orgnum);

  if FG_right < 9 then
    begin
      ED_dept.ButtonWidth := 24;
      ED_dept.Enabled     := True;
    end
  else
    begin
      ED_dept.ButtonWidth := 0;
      ED_dept.Enabled     := False;
      ED_empno.Enabled    := False;
    end;

  PL_Set_empformSql(FG_jobdept, FG_empno, FG_orgnum, Copy(FG_date,1,8));

  PL_Month_Contructor;
  //ShowMessage(ED_empno.Sql);

  //dsa2000  2005.11.09.   기 저장된 근무지코드 읽어오기...
  with QR_com do
  begin
    PL_Com_Contructor;
    FL_Sql := Format('SELECT JOBPLACE||'' - ''||codename, '+
                     //2014.03.19.hjku. 현원여부 추가... 홍원영M요청
                     //'       JOBPLACE  ,   ''field3'',             '+
                     '       JOBPLACE  ,   nvl(pstateyn,''N''),      '+
                     '       ''field4'',   ''field5''     '+
                     '  FROM pimpmas a, pyccode b         '+
                     ' where b.codeid = ''I160''          '+
                     '   and b.codeno = JOBPLACE          '+
                     '   and b.useyn  = ''Y''             '+
                     '   and empno = ''%s''               ',[ED_empno.Empno]);
    Sql.Text := FL_Sql;
    Open;
    ED_bldcode.Text   := FieldByName('field1').AsString;
    ED_bldcode.Codeno := FieldByName('field2').AsString;
    FG_PstateYN       := FieldByName('field3').AsString;
    Close;
  end;

  //2014.03.27.hjku.. 현원이 아닌 경우 휴가 등록 막음...홍원영M 요청
  if(FG_PstateYN ='N') then
  begin
      showmessage('현원이 아닌 경우 휴가계획등록 권한이 없습니다.' + #13 + #13 +
                  '자세한 사항은 담당자에게 문의 하시기 바랍니다.');
      Application.Terminate;
      Exit;
  end;

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  //Kth  2012.03.05근무타입 설정  시작
  with QR_com do
  begin
    PL_Com_Contructor;
    FL_Sql := Format('SELECT DUYYMM,EMPNO,KORNAME,WORKTYPE , ''field5''        ' +
                     '  FROM PKHDUTY                                           ' +
                     '  WHERE DUYYMM =''%s''                                   ' +
                     '    AND EMPNO = ''%s''    ',[FG_yy+FG_Month, ED_empno.empno] );
    Sql.Text := FL_Sql;
    Open;

    //안효상 2012.08.06. A B C 타입 리스트에 안보이게 하고 08:00시부터 나오도록 순서 변경 요청.
    if      FieldByName('field4').AsString = 'A' then  ED_Type.ItemIndex := 1 //09:00~
    else if FieldByName('field4').AsString = 'B' then  ED_Type.ItemIndex := 0 //08:00~
    else if FieldByName('field4').AsString = 'C' then  ED_Type.ItemIndex := 2 //10:00~
    //2015.10.21.hjku.. 근무시간 추가 요청.. 홍원영M(SR-1510-0773)
    else if FieldByName('field4').AsString = 'D' then  ED_Type.ItemIndex := 3 //11:00~
    else if FieldByName('field4').AsString = 'E' then  ED_Type.ItemIndex := 4 //13:00~
    else if FieldByName('field4').AsString = 'F' then  ED_Type.ItemIndex := 5 //Flexible Time
    else                                               ED_Type.ItemIndex := -1 ;
    Close;
  end;
  //Kth  2012.03.05근무타입 설정 끝
}                                                     
end;


procedure TFM_Main.PL_Set_empformSql(P_deptcode, p_eempno, p_orgnum, p_jobtodate : String);
begin
  //dsa2000 관리자는 타부서 사원도 조회 가능토록 추가.  2004.08.06.
  if (Copy(FG_grade,3,1) <= 'C') and (FG_grade <> '') and (FG_empno <> '2507') then
    ED_empno.Sql := ''
  else
  //dsa2000  end....

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
                  //결제자의 해당사원열람시 일반직.은 일시제외. (일반직 급여확정시 해제.
                  //'    AND substr(A.empno,1,1) <> ''Y''   '+
                  '    AND D.codeid(+) = ''I113''         '+
                  '    AND A.payra     = D.codeno(+)      '+
                  '    AND C.codeid(+) = ''I112''         '+
                  '    AND A.paycl     = C.codeno(+)      '+
                  '    AND A.orgnum    = B.orgnum(+)      '+
                  '    AND A.jobdept   = B.deptcode(+)    '+  //유효성 근무부서 부서명을 읽어오게 수정  AND A.deptcode  = B.deptcode(+)
                  '    AND (A.empno LIKE ''%s'' OR A.korname LIKE ''%s'')       '+
                  '  ORDER BY A.empno, A.korname          ';
end;

procedure TFM_Main.PL_Month_Contructor;
begin
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
      ED_Holi.Items.Clear;

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
           ED_Holi.Items.Add(Copy(Trim(FieldByName('field1').AsString),7,2)+'-'+FieldByName('field2').AsString);
           Next;
         end;
      Close;
    end;
end;

function TFM_Main.PL_Get_Allow_Enroll(P_yy , P_empno, P_code, P_day : String) : Boolean;
var
  FL_Sql     : String;
  FL_fldnm   : String;
  FL_kind    : String;
  FL_Str     : String;
  FL_max1    : Double;
  FL_max2    : Double;
  FL_plan    : Double;
  FL_i       : Integer;
  FL_cnt     : Double;
  FL_Comp    : TOnShapeLabel;
  FL_Ccode   : String;
  FL_fryear  : String;
  FL_toyear  : String;
  FL_duname  : String;
  FL_rcalcnt : Double;
  FL_Longwork: Integer; //장휴 15일 체크 휴알
  FL_yearly  : String;
begin
  Result  := False;

  //2016.09.23.hjku.. 연차등록갯수, 목표 체크 기능 추가
  if not PL_Chk_Yearly_Cnt(P_code) then system.exit;

  if (P_code = NORMAL) then // or (P_code = HOLISATUR)
  begin
    Result := True;
    System.Exit;
  end;

  FL_fryear := P_yy+'01';
  FL_toyear := P_yy+'12';

  FL_Ccode := P_Code;

{2016.09.29.hjku.. 미사용으로 삭제
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
}  

  // 휴가 코드별 휴가계획등록 일자 제한기준 읽기...
  try
    with QR_com do
      begin
        PL_Com_Contructor;
        FL_Sql := Format('SELECT dufldnm,          '+  // 휴가계획등록에서 사용되는 필드명
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

  //2016.10.21.hjku.. 특휴특이자 반영. 이명노M 요청.
{
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
}
  if FL_Ccode = '51' then //특휴
  begin
    FL_max1 := GS_special_cnt;
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
      if (FL_Comp <> nil) and (FL_Comp.LabelCaption <> p_day) then
        begin
//2013.09.16.hjku.. 반연차 카운트 오류 수정
          if (FL_Ccode = HOLIHALF) or (FL_Ccode = HOLIMOHTH) or
             (FL_Ccode = YEARHALF) or (FL_Ccode = HOLIYEAR) then
          begin
              if     (FL_comp.Hint = HOLIHALF)  or
                     (FL_comp.Hint = YEARHALF)  then FL_rcalcnt := FL_rcalcnt + 0.5
              else if(FL_comp.Hint = HOLIMOHTH) or
                     (FL_comp.Hint = HOLIYEAR)  then FL_rcalcnt := FL_rcalcnt + 1
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
            //2017.02.15.hjku.. 장휴갯수체크 기준년도 변경.. 김진호M 요청
            //Sql.Text := Format(FL_Sql,[ED_empno.empno, '200801', FL_toyear]);
            Sql.Text := Format(FL_Sql,[ED_empno.empno, '201101', FL_toyear]);
          end
        else
        if FL_kind = 'Y' then
          begin
            FL_Sql   := FL_Sql + ' AND (duyymm BETWEEN ''%s'' AND ''%s'') ';
            Sql.Text := Format(FL_Sql,[ED_empno.empno, FL_fryear, FL_toyear]);
          end
        else
          begin
            FL_Sql := FL_Sql + ' AND duyymm = ''%s'' ';
            Sql.Text := Format(FL_Sql,[ED_empno.empno, P_yy+FG_Month]);
          end;

        Open;
        while not Eof do
          begin
            if Trim(FieldByName('duyymm').AsString) = (FG_yy + FG_Month) then
              begin
                Next;
                Continue;
              end;

            for FL_i := 1 to 31 do //db상의 데이타로 판단하기 때문에 31로...
              begin
  //2013.09.16.hjku.. 반연차 카운트 오류 수정
                if (FL_Ccode = HOLIHALF) or (FL_Ccode = HOLIMOHTH) or
                   (FL_Ccode = YEARHALF) or (FL_Ccode = HOLIYEAR)  then
                  begin
                    if (FieldByName('dd'+IntToStr(FL_i)).AsString = HOLIHALF) or
                       (FieldByName('dd'+IntToStr(FL_i)).AsString = YEARHALF) then
                      FL_rcalcnt := FL_rcalcnt + 0.5
                    else if (FieldByName('dd'+IntToStr(FL_i)).AsString = HOLIMOHTH) or
                            (FieldByName('dd'+IntToStr(FL_i)).AsString = HOLIYEAR)  then
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
{      if FL_Ccode = '52' then
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
//      end;
    end ;
{2016.09.26.hjku.. 연차사용갯수 체크는 PL_Chk_yearly_cnt 해서 삭제함.
  else if (FL_Ccode = HOLIYEAR) or (FL_Ccode = YEARHALF)  then // 휴가코드가 연차 일 경우
    begin
      try  // 연차에 포함하는 휴가에 관련된 사항을 읽어옴.
        with QR_com do
          begin
            PL_Com_Contructor;

            Sql.Text := PL_make_Sql1(ED_empno.empno, FL_fryear, FL_toyear); //OnMemo1.Lines.Text := Sql.Text;

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

            //2014.01.23. hjku. 오류로 인하여 변경...
            Sql.Add('Select sum(nvl(yearly_cnt,0)) field1, sum(nvl(yearlyplan_cnt,0)) field2,');
            Sql.Add('       '' '' field3, '' '' field4, '' '' field5');
            Sql.Add('  From PKYEARLT                                 ');
            Sql.Add(' Where yearly_yy = '''+P_yy+'''                 ');
            Sql.Add('   and Empno     = '''+ED_empno.empno+'''       ');

            //FL_Sql := Format('Select sum(nvl(yearly_cnt,0)) field1, sum(nvl(yearlyplan_cnt,0)) field2,'+
            //                 '       '' '' field3, '' '' field4, '' '' field5'+
            //                 '  From PKYEARLT                           '+
            //                 ' Where yearly_yy = ''%s''                 '+
            //                 '   And Empno     = ''%s''' , [P_yy, ED_empno.empno]);
            //Sql.Text := FL_Sql;    Edit1.Text := SQL.Text;
            Open;
            //FL_yearly := FieldByName('field1').AsString;
            FL_max1  := StrTofloat(Trim(FieldByName('field1').AsString));
            //FL_max1  := FieldByName('field1').asfloat;
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

    //입사일 구분 없이 PKYEARLT 테이블에 등록된 갯수만큼 연차사용가능토록 위해 루틴 삭제 .(20061030 신영섭 요청)
     // 입사일이 금년 1월 1일 이전인 경우 -> 연차 100%발생 ..
    //  if FG_empdate < P_yy+'0101' then
     //   begin
     //     if FL_max1 < FL_cnt then
     //       begin
     //         MessageDlg(FL_duname+'는 '+GetIntToStr(FL_max1)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
     //         System.Exit;
     //       end
     //   end // 입사일이 금년 1월 2일 ~ 2월 15일 인 경우 -> 연차 80%발생 ..
     // else if (FG_empdate >= P_yy+'0102') and (FG_empdate <= P_yy+'0215') then
     //   begin
     //     if FL_max2 < FL_cnt then
     //       begin
     //          MessageDlg(FL_duname+'는 '+GetIntToStr(FL_max2)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
    //         System.Exit;
    //        end
    //    end // 입사일이 금년 1월 1일 도, 금년 1월 2일 ~ 2월 15일 도 아닌 경우 -> 연차발생 안함..
    //  else
    //    begin
    //      MessageDlg('사용할수 있는 '+FL_duname+'가 없습니다..', mtInformation, [mbOK], 0);
    //      System.Exit;
    //    end;  

    end;
}
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
function TFM_Main.PL_Month_endyn(P_yymm, P_empno : String) : Boolean;
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
        FL_Sql := 'SELECT case when substr('''+P_empno+''',1,1)=''Y'' then Y_KNTEYYMM else knteyymm end field1, '+ #13#10 +
                  //'       TO_CHAR(ADD_MONTHS(to_date('''+P_yymm+''',''YYYYMM''),1),''YYYYMM'')||''10'',  '+   //2016.09.22.hjku..자동종료일 추가
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

procedure TFM_Main.PL_Select_pkhduty;
var
  FL_i       : Integer;
  FL_k       : Integer;
  FL_LastDay : Integer;
  FL_Comp    : TOnShapeLabel;
  FL_korname : String;
  FL_Sql     : String;
begin
{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  //Kth  2012.03.05근무타입 설정  시작
  with QR_com do
  begin
    PL_Com_Contructor;
    FL_Sql := Format('SELECT DUYYMM,EMPNO,KORNAME,WORKTYPE , ''field5''        ' +
                     '  FROM PKHDUTY                                           ' +
                     '  WHERE DUYYMM =''%s''                                   ' +
                     '    AND EMPNO = ''%s''    ',[FG_yy+FG_Month, ED_empno.empno] );
    Sql.Text := FL_Sql;
    Open;

    //안효상 2012.08.06. A B C 타입 리스트에 안보이게 하고 08:00시부터 나오도록 순서 변경 요청.    
    if      FieldByName('field4').AsString = 'A' then  ED_Type.ItemIndex := 1
    else if FieldByName('field4').AsString = 'B' then  ED_Type.ItemIndex := 0
    else if FieldByName('field4').AsString = 'C' then  ED_Type.ItemIndex := 2
    //2015.10.21.hjku.. 근무시간 추가 요청.. 홍원영M(SR-1510-0773)
    else if FieldByName('field4').AsString = 'D' then  ED_Type.ItemIndex := 3 //11:00~
    else if FieldByName('field4').AsString = 'E' then  ED_Type.ItemIndex := 4 //13:00~
    else if FieldByName('field4').AsString = 'F' then  ED_Type.ItemIndex := 5 //Flexible Time       
    else                                               ED_Type.ItemIndex := -1 ;
    Close;
  end;      
}

  with QR_Sel1 do
    begin
      Close;
      Sql.Text := Format(FG_SelectSql+
                         ' WHERE duyymm = ''%s'' AND empno = ''%s'' ',[FG_yy+FG_Month, ED_empno.empno]);
       try
         //memo1.text := sql.text;
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
                             //2016.09.23.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                             FL_Comp.Hint            := NORMAL;
                             FL_Comp.ValueFont.Color := clWhite;
                             FL_Comp.ValueCaption := '정상';
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
                             //FL_Comp.ValueCaption := '미입';

                             //2016.09.23.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                             FL_Comp.Hint            := NORMAL;
                             FL_Comp.ValueFont.Color := clWhite;
                             FL_Comp.ValueCaption := '정상';
                           end
                         else if FL_Comp.Hint = '' then  //2013.11.20.hjku.연차연동으로 null로 입력된 자료 미입처리 위해 (insert시와 동일처리 위해)
                           begin
                             //FL_Comp.Hint            := UNDECIDED; //미입
                             //FL_Comp.ValueFont.Color := clLime;
                             //FL_Comp.ValueCaption := '';

                             //2016.09.23.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                             FL_Comp.Hint            := NORMAL;
                             FL_Comp.ValueFont.Color := clWhite;
                             FL_Comp.ValueCaption := '정상';
                           end
                         else
                           begin
                             FL_Comp.ValueFont.Color := clRed;  //유효성 추가 for color
                             FL_Comp.ValueCaption := PL_Get_Code(ED_code.codeid,FL_Comp.Hint);
                           end;
                         Inc(FL_k);
                       end;
                   end;
               end;

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
             if Trim(FieldByName('conyn').AsString) = 'Y' then
             begin
                  PA_conyn.ValueCaption   := '결재';
                  PA_contime.ValueCaption := FieldByName('conman').AsString + '   ' +
                                             FL_korname +'   '+
                                             Hinsa_DisplayDate(FieldByName('contime').AsString,'/')+'일  '+
                                                          Copy(FieldByName('contime').AsString,9,2)+'시'+
                                                          Copy(FieldByName('contime').AsString,11,2)+'분';

                  if (FG_right < 9) and (not FG_Mendyn) then BT_canapp.Enabled := True;
                  BT_Save.Enabled   := False;
                  BT_Cancel.Enabled := False;
                  BT_app.Enabled    := False;
             end
             else
             begin
                  BT_canapp.Enabled := False;
                  BT_app.Enabled    := False;
                  BT_ConAll.Enabled := False; //dsa2000 2005.07.

                  if (FG_right < 9) and (not FG_Mendyn) then //유효성 if절 추가  for bug 수정
                  begin
                       BT_canapp.Enabled := False;
                       BT_app.Enabled    := True;
                       BT_ConAll.Enabled := True; //dsa2000 2005.07
                  end;
             end;
}             
           end;
         Close;
       except
         Close;
       end;
    end;
    
    //2016.09.23.hjku.. 휴가등록현황 조회 추가.. 이명노M 요청
    get_dayoff_list(FG_yy+FG_Month, ED_empno.empno);
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
    {2016.06.28.hjku.. 휴일에 교대/비번 등록후 복구시 휴일에 휴일등록가능하도록 구현하기 위하여 move됨
  if P_code = HOLIDAY then
    begin
      MessageDlg('휴일은 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
    }
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

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  //2013.06.28.hjku. 연차사용촉진제도 추가로 기등록된 연차휴가 수정 불가능.. 이명노M 요청
  if(Copy(FG_empno,1,1) <> 'Y')and(copy(FG_Date,1,6) > '201307') and((P_code = HOLIYEAR)or(P_code = YEARHALF)) then //dsa2000 추가  2005.07.
    begin
      //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
      //MessageDlg('연차는 연차휴가 사용/변경 메뉴를 통해 등록신청 가능합니다...', mtInformation, [mbOK], 0);
      //2015.03.02.hjku.. 연차 등록 메뉴로 이동으로 변경.. 이명노M 요청
      //MessageDlg('연차는 ' + FL_ProgName + ' 메뉴를 통해 등록신청 가능합니다...', mtInformation, [mbOK], 0);
      year_text.caption := '연차/반연차 휴가는 ' + FL_ProgName + ' 메뉴를 통해 신청하시면 휴가계획 등록 화면에 자동으로 반영됩니다.';
      inform_Panel.visible := true;
      System.Exit;
    end;
}    

  Result := True;
end;

function TFM_Main.PL_Get_Right(P_empno, P_orgnum : String) : Integer;
var
  FL_Sql : String;
begin
  if (Copy(FG_grade,3,1) <= 'C') and (FG_grade <> '') then
    Result := 1   // 결재가능
  else
    Result := 9;  // 결재 불가능

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
        Sql.Text := Format(FL_Sql,[P_empno, FG_empno, Copy(FG_Date,1,8), P_orgnum, FG_empno]);
        Open;
        if Trim(FieldByName('field1').AsString) <> '' then
          Result := 2;  // 결재가능
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
  if Trim(ED_empno.empno) = '' then
    begin
      MessageDlg('존재하지 않는 사원이거나 타부서의 사원입니다. ', mtInformation, [mbOK], 0);
      ED_empno.SetFocus;
      System.Exit;
    end;

  if FG_yy+FG_Month < FG_MinDate then
    begin
      MessageDlg('휴가계획등록 자료가 존재하지 않습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := '해당월의 휴가계획 정보를 읽는 중입니다... 잠시만 기다리세요...';
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
//2003.7.30 유효성 수정 start : 주5일근무제에 따른수정
//          if (FL_i mod 7) = 0 then
//            FL_Comp.LabelFont.Color := clBlue
//          else if (FL_i mod 7) = 1 then
//            FL_Comp.LabelFont.Color := clRed
//          else
//            FL_Comp.LabelFont.Color := clBlack;

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
                  //FL_Comp.ValueCaption    := '';
                  //FL_Comp.Hint            := UNDECIDED;

                  //2016.09.23.hjku.. 기본값을 정상으로, 안보이게. 이명노M 요청
                  FL_Comp.Hint            := NORMAL;
                  FL_Comp.ValueFont.Color := clWhite;
                  FL_Comp.ValueCaption := '정상';

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

  //2014.10.15.hjku. 정규직과 파견직 휴가 마감 구분하기 위해 추가..
  FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month,ED_empno.empno);
  
  if not FG_Mendyn then
    begin
      if FG_right < 9 then
        begin
          BT_app.Enabled    := True;
          BT_canapp.Enabled := True;
          BT_ConAll.Enabled := True; //dsa2000 2005.07
        end;
      BT_Save.Enabled   := True;
      BT_cancel.Enabled := True;
      bt_move.Enabled   := True;
    end
  else
    begin
      BT_Save.Enabled   := False;
      BT_cancel.Enabled := False;
      bt_move.Enabled   := False;
      BT_app.Enabled    := False;
      BT_canapp.Enabled := False;
      BT_ConAll.Enabled := False; //dsa2000 2005.07
    end;


  FG_Exists := PL_pkhduty_Exists(FG_yy+FG_Month, ED_empno.empno);

//2005.07. 막음.  자신의 휴가 등록은 안해도 결재는 가능하도록..  
{  if (not FG_Exists) and (not FG_Mendyn) then
    begin
      BT_app.Enabled    := False;
      BT_canapp.Enabled := False;
      BT_ConAll.Enabled := False; //dsa2000 2005.07
      SB_Help.Panels[1].Text := '해당월의 휴가계획 정보를 등록하지 않았습니다. 휴가계획등록을 하세요...';
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
  i        : integer;
begin
  SB_Help.Panels[1].Text := '';
  FG_SelComp := nil;
  FG_SelComp := TOnShapeLabel(Sender);

  //2013.11.29.hjku. 변경전 휴가내역.
  OldCaption := TOnShapeLabel(Sender).ValueCaption;
  OldHint    := TOnShapeLabel(Sender).Hint;
  //2016.09.23.hjku.. 추가
  OldDay     := TOnShapeLabel(Sender).LabelCaption;

  if Copy(ED_empno.Text,1,1) = 'M' then  //dsa2000   2004.10.
    begin
      MessageDlg('임원은 휴가계획등록이 필요하지 않습니다.', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  //2016.09.23.hjku.. 휴가계획등록마감자료 확인 추가
  //FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month,ED_empno.empno);

  if FG_Mendyn then
    begin
      MessageDlg('휴가계획등록이 마감된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
    
{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  if PA_conyn.ValueCaption = '결재' then //유효성 추가
    begin
      MessageDlg('결재가 완료된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
}    

  // 강륜종(dsa2000) 2004.04.29. 휴가 선등록 할수 없도록 막음. 박경철 대리 요청
  //2013.08.29.hjku.. 휴가계획등록은 당월까지 등록가능하도록 수정.. 이명노M 요청
  //2013.06.28.hjku.. 연차사용촉진제도 추가로 전월만 휴가계획등록 가능하도록 수정.. 이명노M 요청
  //2013.07.04.hjku.. 파견직은 당월까지 가능하고 정규직은 전월만... 이명노M 요청
  //2016.09.23.hjku.. 일반사용자는 1년단위로 휴가계획등록가능하도록 수정.. 이명노M
{
    if(Copy(FG_grade,3,1) > 'C') and (FG_yy+FG_Month > Copy(FG_Date,1,6)) then
    begin
      MessageDlg('휴가계획등록은 현재월까지만 등록 할 수 있습니다.. '+#13+
                 '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
    end;
}
    if(Copy(FG_grade,3,1) > 'C') and (FG_yy > Copy(FG_Date,1,4)) then
    begin
      MessageDlg('휴가계획등록은 현재년도까지만 등록 할 수 있습니다.. '+#13+
                 '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

  //2013.06.28.hjku. 연차사용촉진제도 추가로 기등록된 연차휴가 수정 불가능.. 이명노M 요청
{  if (Copy(FG_empno,1,1) <> 'Y') and (copy(FG_Date,1,6) > '201307') and (Copy(FG_grade,3,1) > 'C') and ((OldHint = HOLIYEAR)or(OldHint = YEARHALF)) then
  begin
     MessageDlg('기등록된 연차는 수정할 수 없습니다.'+#13+
                //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
                //'연차휴가 사용/변경 메뉴 를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
                FL_ProgName + '메뉴를 통해 수정하시기 바랍니다.', mtInformation, [mbOK], 0);
     System.Exit;
  end;
}

  //교휴 사용여부 체크 . dsa2000  2005.08.
  PL_ExchHoli_Exists(FG_yy+FG_Month, ED_empno.empno);

  ED_code.Perform(CM_EXIT,0,0);
  ED_code.Visible := False;

  if ED_code.DroppedDown then
    System.Exit;

  if Trim(TOnShapeLabel(Sender).LabelCaption) = '' then
    System.Exit;  

  //////////////////////////////////////////////////////////////////////////////
  if Button = mbLeft then
    begin
      PA_MainPanel.SetFocus;
      if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then  //dsa2000 일반사용자만 입력체크.(관리자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
      begin
        if not PL_Input_Check(ED_hotkey.codeno) then    System.Exit;

        //2016.06.28.hjku.. 휴일 복구 가능하도록 추가..
        if(TOnShapeLabel(Sender).LabelFont.Color <> clRed)and (ED_hotkey.codeno =HOLIDAY) then
        begin
          MessageDlg('휴일은 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
          System.Exit;
        end;
      end;

      //2016.09.23.hjku.. 입력정보와 동일한 휴가 입력시 오류 수정.. 이명노M 요청
      //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno) then
      if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno ,OldDay) then
        System.Exit;

      //관리자 권한 사용자의 휴일휴가계획등록을 위한 로직 변경.
      //요청서 : 2007-23703, 요청자 : 김경호
      //수정일 : 2007-10-09, 수정자 : 유재승
      //관리자도 교대/비번 입력시 토글되도록 수정
      //if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then
      //begin
           if (FG_yy+FG_Month+IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) - 1) <> '20080923') then               // 9월 23일 창립기념일 근무 날짜  kth
             begin
                  //2016.06.27.hjku.. 휴일 교대/비번 반영 오류 수정.. 전지영M 요청
                  if (ED_hotkey.codeno=EXCHANGE) and (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then
                  //if (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
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
                  //2016.06.27.hjku.. 휴일에 교대/비번 외의 휴가계획등록 차단.. 전지영M 요청
                  else if (TOnShapeLabel(Sender).LabelFont.Color = clRed) then
                  begin
                      MessageDlg('휴일에는 교대/비번 외의 휴가를 등록할 수 없습니다.', mtInformation, [mbOK], 0);
                      System.Exit;
                  end
                  else
                    begin
                      //2016.09.26.hjku.. 사용자/관리자 입력가능한 값만 체크하도록 수정
                      if not(PL_code_check(OldHint)) then
                      begin
                        MessageDlg('해당 코드는 관리자가 등록한 코드로 수정이 불가능합니다..', mtInformation, [mbOK], 0);
                        system.exit;
                      end;

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
                      //2016.09.26.hjku.. 사용자/관리자 입력가능한 값만 체크하도록 수정
                      if not(PL_code_check(OldHint)) then
                      begin
                        MessageDlg('해당 코드는 관리자가 등록한 코드로 수정이 불가능합니다..', mtInformation, [mbOK], 0);
                        system.exit;
                      end;

                      TOnShapeLabel(Sender).ValueCaption := ED_hotkey.codename;
                      TOnShapeLabel(Sender).Hint         := ED_hotkey.codeno;
                    end;
           // 9월 23일 창립기념일 근무 끝 kth
             end;
      //end
      //else
      //begin
      //     TOnShapeLabel(Sender).ValueCaption := ED_hotkey.codename;
      //     TOnShapeLabel(Sender).Hint         := ED_hotkey.codeno;
      //end;
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
      //2013.11.29.hjku. 교대근무로 인한 연차 변경 제어.. 이명노M 요청
      NextComp := IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) + 1);
      FL_Comp  := TOnShapeLabel(Self.FindComponent('ED_d'+NextComp));

      if((TOnShapeLabel(FL_Comp).Hint <> HOLIYEAR) and (TOnShapeLabel(FL_Comp).Hint <> YEARHALF)) then
      begin
          if (TOnShapeLabel(Sender).Hint = EXCHANGE) and (FG_ExchangeYN = 'Y') then
            begin
              //2016.09.26.hjku.. 교대는 다음일이 관리자 등록코드 체크하도록 수정
              if    (TOnShapeLabel(FL_Comp).LabelFont.Color <> clRed) and
                (not(PL_code_check(TOnShapeLabel(FL_Comp).Hint))) then
              begin
                MessageDlg('교대는 다음일이 관리자 등록코드인 경우 등록할 수 없습니다.', mtInformation, [mbOK], 0);

                TOnShapeLabel(Sender).ValueCaption := OldCaption;
                TOnShapeLabel(Sender).Hint         := OldHint;

                //2016.06.27.hjku. 휴일 교대/비번 반영 오류 수정.. 전지영M
                if(TOnShapeLabel(Sender).LabelFont.Color = clRed) then
                  TOnShapeLabel(Sender).ValueFont.Color := clRed ;

                 TOnShapeLabel(Sender).Repaint;
                 system.exit;
              end;

              TOnShapeLabel(FL_Comp).ValueCaption := '비번';
              TOnShapeLabel(FL_Comp).Hint         := EXCHHOLI;
              TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
              TOnShapeLabel(FL_Comp).Repaint;
              TOnShapeLabel(FL_Comp).OnMouseDown     := nil;
            end
          else if (TOnShapeLabel(Sender).Hint <> EXCHANGE) and (OldHint = EXCHANGE)  and
                  (FG_ExchangeYN = 'Y') then
            begin
              //2016.06.27.hjku.. 휴일에 등록한 교대비번 복구시 휴일 등록 오류 수정.. 전지영M
              if(TOnShapeLabel(FL_Comp).LabelFont.Color = clRed) then
              begin
                TOnShapeLabel(FL_Comp).ValueCaption := '휴일';
                TOnShapeLabel(FL_Comp).Hint         := HOLIDAY;
                TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
                TOnShapeLabel(FL_Comp).Repaint;
                TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;    
              end
              else
              begin
                //2016.09.23.hjku.. 기본값을 정상으로. 이명노M 요청
                //TOnShapeLabel(FL_Comp).ValueCaption := '미입';
                //TOnShapeLabel(FL_Comp).Hint         := UNDECIDED;
                //TOnShapeLabel(FL_Comp).ValueFont.Color := clLime;
                
                TOnShapeLabel(FL_Comp).ValueCaption := '정상';
                TOnShapeLabel(FL_Comp).Hint         := NORMAL;
                TOnShapeLabel(FL_Comp).ValueFont.Color := clPurple;
                TOnShapeLabel(FL_Comp).Repaint;
                TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;
              end;
            end;
      end
      else
      begin
           if (TOnShapeLabel(Sender).Hint = EXCHANGE) then
           begin
               MessageDlg('교대는 다음일이 연차(반연차)인 경우 등록할 수 없습니다.'+#13#10
                          //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
                          //+'연차휴가사용/변경을 통해 연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
                          //2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
                          //+FL_ProgName+' 메뉴를 통해 연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
                          +'연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);

               TOnShapeLabel(Sender).ValueCaption := OldCaption;
               TOnShapeLabel(Sender).Hint         := OldHint;

               //2016.06.27.hjku. 휴일 교대/비번 반영 오류 수정.. 전지영M
               if(TOnShapeLabel(Sender).LabelFont.Color = clRed) then
                 TOnShapeLabel(Sender).ValueFont.Color := clRed ;

           end;
      end;

      TOnShapeLabel(Sender).Repaint;
    end
  //////////////////////////////////////////////////////////////////////////
  else if Button = mbRight then
    begin
      GS_Error_YN := false;

      ED_code.Perform(CM_EXIT,0,0);
      ED_code.Visible := False;

      ED_code.Width   := 0;
      ED_code.Left    := TOnShapeLabel(Sender).Left;
      ED_code.Top     := TOnShapeLabel(Sender).Top;
      ED_code.Visible := True;
      ED_code.codename:= '';
      ED_code.codeno  := '';
      ED_code.Text    := '';
      ED_code.Perform(WM_KEYDOWN,VK_F2,0);

      if ED_code.DroppedDown then
        System.Exit;

      if GS_Error_YN then system.exit;

      //2016.09.26.hjku.. 사용자/관리자 입력가능한 값만 체크하도록 수정
      if not((OldHint=HOLIDAY)and(ED_code.codeno=EXCHANGE)) then
      begin
        if not(PL_code_check(OldHint)) then
        begin
          MessageDlg('해당 코드는 관리자가 등록한 코드로 수정이 불가능합니다..', mtInformation, [mbOK], 0);
          system.exit;
        end;
      end; 

      //2016.06.27.hjku. 휴일에 교대/비번 외의 휴가계획등록 차단.. 전지영M
      if (ED_code.codeno=EXCHANGE) and (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
      //if (TOnShapeLabel(Sender).Hint = HOLIDAY) and (FG_ExchangeYN = 'Y') then  //dsa2000 추가  2005.07.
        begin
          TOnShapeLabel(Sender).ValueCaption := '교대';
          TOnShapeLabel(Sender).Hint         := EXCHANGE;
        end
      else if (TOnShapeLabel(Sender).Hint = EXCHANGE)  and
              (TOnShapeLabel(Sender).LabelFont.Color = clRed) then              //dsa2000 추가  2005.07.
        begin
          //TOnShapeLabel(Sender).ValueCaption := '휴일';
          //TOnShapeLabel(Sender).Hint         := HOLIDAY;
        end;

        if (Copy(FG_grade,3,1) > 'C') or (FG_grade < ' ') then  //dsa2000 일반사용자만 입력체크.(관지자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
        begin
           if not PL_Input_Check(ED_code.codeno) then
             begin
               //2016.09.23.hjku.. 기본값을 정상으로. 이명노M 요청
               //TOnShapeLabel(Sender).ValueFont.Color := clLime;
               //TOnShapeLabel(Sender).ValueCaption := '미입';
               //TOnShapeLabel(Sender).Hint := UNDECIDED;

               TOnShapeLabel(Sender).ValueFont.Color := clPurple;
               TOnShapeLabel(Sender).ValueCaption := '정상';
               TOnShapeLabel(Sender).Hint := NORMAL;
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
      //2013.11.29.hjku. 교대근무로 인한 연차 변경 제어 aaaaa
      NextComp := IntToStr(StrToInt(Trim(Copy(TOnShapeLabel(Sender).Name,5,2))) + 1);
      FL_Comp  := TOnShapeLabel(Self.FindComponent('ED_d'+NextComp));

      if((TOnShapeLabel(FL_Comp).Hint <> HOLIYEAR) and (TOnShapeLabel(FL_Comp).Hint <> YEARHALF)) then
      begin
          if (TOnShapeLabel(Sender).Hint = EXCHANGE) and (FG_ExchangeYN = 'Y') then
            begin
              //2016.09.26.hjku.. 교대는 다음일이 관리자 등록코드 체크하도록 수정
              if    (TOnShapeLabel(FL_Comp).LabelFont.Color <> clRed) and
                (not(PL_code_check(TOnShapeLabel(FL_Comp).Hint))) then
              begin
                MessageDlg('교대는 다음일이 관리자 등록코드인 경우 등록할 수 없습니다.', mtInformation, [mbOK], 0);

                TOnShapeLabel(Sender).ValueCaption := OldCaption;
                TOnShapeLabel(Sender).Hint         := OldHint;

                //2016.06.27.hjku. 휴일 교대/비번 반영 오류 수정.. 전지영M
                if(TOnShapeLabel(Sender).LabelFont.Color = clRed) then
                  TOnShapeLabel(Sender).ValueFont.Color := clRed ;

                TOnShapeLabel(Sender).Repaint;

                 system.exit;
              end;

              TOnShapeLabel(FL_Comp).ValueCaption := '비번';
              TOnShapeLabel(FL_Comp).Hint         := EXCHHOLI;
              TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
              TOnShapeLabel(FL_Comp).Repaint;
              TOnShapeLabel(FL_Comp).OnMouseDown     := nil;
            end
          else if (TOnShapeLabel(Sender).Hint <> EXCHANGE) and (OldHint = EXCHANGE)  and
                  (FG_ExchangeYN = 'Y') then
            begin
              //2016.06.27.hjku.. 휴일에 등록한 교대비번 복구시 휴일 등록 오류 수정..전지영M 요청
              if(TOnShapeLabel(FL_Comp).LabelFont.Color = clRed) then
              begin
                TOnShapeLabel(FL_Comp).ValueCaption := '휴일';
                TOnShapeLabel(FL_Comp).Hint         := HOLIDAY;
                TOnShapeLabel(FL_Comp).ValueFont.Color := clRed;
                TOnShapeLabel(FL_Comp).Repaint;
                TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;    
              end
              else
              begin
                //2016.09.23.hjku.. 기본값을 정상으로. 이명노M 요청
                //TOnShapeLabel(FL_Comp).ValueCaption := '미입';
                //TOnShapeLabel(FL_Comp).Hint         := UNDECIDED;
                //TOnShapeLabel(FL_Comp).ValueFont.Color := clLime;

                TOnShapeLabel(FL_Comp).ValueCaption := '정상';
                TOnShapeLabel(FL_Comp).Hint         := NORMAL;
                TOnShapeLabel(FL_Comp).ValueFont.Color := clPurple;
                TOnShapeLabel(FL_Comp).Repaint;
                TOnShapeLabel(FL_Comp).OnMouseDown  := ED_DayMouseDown;
              end;
            end;
      end
      else
      begin
           if (TOnShapeLabel(Sender).Hint = EXCHANGE) then
           begin
               MessageDlg('교대는 다음일이 연차(반연차)인 경우 등록할 수 없습니다.'+#13#10
                          //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인해 수정.. 이명노M요청
                          //+'연차휴가사용/변경을 통해 연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
                          //2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
                          //+FL_ProgName+' 메뉴를 통해 연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
                          +'연차일을 변경하신후 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
               TOnShapeLabel(Sender).ValueCaption := OldCaption;
               TOnShapeLabel(Sender).Hint         := OldHint;

               //2016.06.27.hjku. 휴일 교대/비번 반영 오류 수정.. 전지영M
               if(TOnShapeLabel(Sender).LabelFont.Color = clRed) then
                 TOnShapeLabel(Sender).ValueFont.Color := clRed ;
           end;
      end;

      TOnShapeLabel(Sender).Repaint;
    end;

  //교휴 사용가능여부 체크 . dsa2000  2005.08.
  if (not PL_ExchHoli_Exists(FG_yy+FG_Month, ED_empno.empno)) and
     (TOnShapeLabel(Sender).Hint = SPEOFF) then
  begin
      MessageDlg('교휴는 전월 '+ FG_Exchange_Min +'일 이상 교대근무자만 사용가능합니다.', mtInformation, [mbOK], 0);
      //2016.09.23.hjku.. 기본값을 정상으로. 이명노M 요청
      //TOnShapeLabel(Sender).ValueFont.Color := clLime;
      //TOnShapeLabel(Sender).ValueCaption := '미입';
      //TOnShapeLabel(Sender).Hint := UNDECIDED;

      TOnShapeLabel(Sender).ValueFont.Color := clPurple;
      TOnShapeLabel(Sender).ValueCaption := '정상';
      TOnShapeLabel(Sender).Hint := NORMAL;
  end;

  OldCaption := '';
  OldHint    := '';
  OldDay     := '';

  //2016.09.23.hjku.. 휴가등록현황 조회 추가.. 이명노M 요청
  get_dayoff_list(FG_yy+FG_Month, ED_empno.empno);
end;

procedure TFM_Main.ED_deptInitPopup(Sender: TObject);
begin
  FM_Dept.QR_Com.Session := TMaxSession;
  FM_Dept.QR_Cod.Session := TMaxSession;
  FM_Dept.FG_empno       := Self.FG_empno;
  FM_Dept.FG_deptcode    := Self.FG_jobdept;
  FM_Dept.FG_date        := Copy(Self.FG_date,1,8);
  FM_Dept.FG_Right       := Self.FG_right;
  FM_Dept.FG_Grade       := Self.FG_Grade;

  TOnWinPopupEdit(Sender).PopupControl := FM_Dept;
  FM_Dept.Edit           := TOnWinPopupEdit(Sender);
  FM_Dept.PG_Get_Dept;
end;

procedure TFM_Main.ED_deptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_Dept.QR_cod.FieldByName('deptname').AsString + ' ' +
                                      FM_Dept.QR_cod.FieldByName('deptna3').AsString;
      TOnWinPopupEdit(Sender).Hint := FM_Dept.QR_cod.FieldByName('deptcode').AsString;
      
      PL_Set_empformSql(TOnWinPopupEdit(Sender).Hint, FG_empno, FG_orgnum, Copy(FG_date,1,8));
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  ED_empno.text := '';   //dsa2000
end;

procedure TFM_Main.BT_cancelClick(Sender: TObject);
begin
  PL_Month_Contructor;
end;

procedure TFM_Main.ED_codeCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
  if FG_SelComp <> nil then
    begin
      if ED_code.codename <> '' then
        begin
          {2015.02.27.hjku.. 메시지 중복오류로 인해 삭제..

          if (Copy(FG_grade,3,1) > 'C') then  //dsa2000 일반사용자만 입력체크.(관지자는 휴직등을 입력 가능케 하기 위해)  2004.09.20.
          begin
            if not PL_Input_Check(ED_code.codeno) then   System.Exit;
          end;
          }
          //2016.09.23.hjku.. 입력정보와 동일한 휴가 입력시 오류 수정.. 이명노M 요청
          //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_code.codeno) then
          if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_code.codeno, FG_SelComp.labelcaption) then
          begin
            GS_Error_YN := true;
            System.Exit;
          end;

          if (Copy(FG_grade,3,1) > 'C') then
          begin
            //2016.06.28.hjku.. 휴일 복구 가능하도록 추가..
            if(FG_SelComp.LabelFont.Color <> clRed)and (ED_code.codeno =HOLIDAY) then
            begin
              MessageDlg('휴일은 사용자가 직접 등록 할 수 없습니다...', mtInformation, [mbOK], 0);
              GS_Error_YN := true;
              System.Exit;
            end;

            //2016.06.27.hjku.. 휴일에 교대/비번 외의 휴가계획등록 차단.. 전지영M
            if (ED_code.codeno<>EXCHANGE) and (FG_SelComp.LabelFont.Color = clRed) then
            begin
              MessageDlg('휴일에는 교대/비번 외의 휴가를 등록할 수 없습니다.', mtInformation, [mbOK], 0);
              GS_Error_YN := true;              
              System.Exit;
            end;
          end;

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

procedure TFM_Main.SB_AllClick(Sender: TObject);
var
  FL_i   : Integer;
  FL_Comp: TOnShapeLabel;
begin
  // 강륜종(dsa2000) 2004.04.29. 휴가 선등록 할수 없도록 막음. 박경철 대리 요청
  {if (Copy(FG_grade,3,1) > 'C') and (FG_yy+FG_Month > Copy(FG_Date,1,6)) then
  begin
       MessageDlg('휴가계획등록은 현재월까지만 등록 할 수 있습니다.. '+#13+
                  '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다', mtInformation,[mbOk], 0);
       System.Exit;
  end;}

  // 강륜종(dsa2000) 2004.04.29. 휴가 선등록 할수 없도록 막음. 박경철 대리 요청
  //2013.07.04.hjku.. 파견직은 당월까지 가능하고 정규직은 전월만... 이명노M 요청
  //2013.08.29.hjku.. 휴가계획등록은 당월까지 등록가능하도록 수정.. 이명노M 요청
  //2016.09.23.hjku.. 일반사용자는 1년단위로 휴가계획등록가능하도록 수정.. 이명노M
{
  if(Copy(FG_grade,3,1) > 'C') and (FG_yy+FG_Month > Copy(FG_Date,1,6)) then
  begin
      MessageDlg('휴가계획등록은 현재월까지만 등록 할 수 있습니다.. '+#13+
                 '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
  end;
}
  if(Copy(FG_grade,3,1) > 'C') and (FG_yy > Copy(FG_Date,1,4)) then
  begin
    MessageDlg('휴가계획등록은 현재년도까지만 등록 할 수 있습니다.. '+#13+
               '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다.', mtInformation,[mbOk], 0);
    System.Exit;
  end;       

  //2016.6.29.hjku..  일괄 등록시에도 교대/비번 등록 막음.. 김진호M 요청
  //
  if((ED_hotkey.codeno =EXCHANGE) or (ED_hotkey.codeno=EXCHHOLI)) then
  begin
      MessageDlg('교대/비번은 일괄등록에서 등록하실 수 없습니다.', mtInformation,[mbOk], 0);

      System.Exit;
  end;

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  //2016.04.12.hjku..  일괄 등록시에도 연차 등록 막음.. 김진호M 요청
  //
  if(Copy(FG_grade,3,1) > 'C') and ((ED_hotkey.codeno =HOLIYEAR) or (ED_hotkey.codeno=YEARHALF)) then
  begin
      //MessageDlg('연차/ 반연차는 휴가계획등록에서 등록하실 수 없습니다.', mtInformation,[mbOk], 0);
      MessageDlg('연차/반연차 휴가는 ' + FL_ProgName + ' 메뉴를 통해 신청하시면 휴가계획 등록 화면에 자동으로 반영됩니다.', mtInformation,[mbOk], 0);

      System.Exit;
  end;
}

  for FL_i := 1 to 42 do
  begin
    FL_Comp := nil;
    FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
    if FL_Comp <> nil then
    begin
      if not FL_Comp.Visible then Continue;

      //2017.03.13.hjku.. BEAR:산휴('55'),BABYCARE:육아('83'),  PUBVAR:공가('53'),PUBSICK:공병('54') 일괄 등록시 (반)연차도 반영.. 김진호M 요청
      if((ED_hotkey.codeno =BEAR) or (ED_hotkey.codeno=BABYCARE)  or (ED_hotkey.codeno=PUBVAR) or (ED_hotkey.codeno=PUBSICK)) then
      begin
        if ((FL_Comp.Hint = '') or (FL_Comp.Hint = UNDECIDED) or (FL_Comp.Hint = NORMAL) or (FL_Comp.Hint = YEARHALF) or (FL_Comp.Hint = HOLIYEAR)) then
        begin
          //2016.09.23.hjku.. 입력정보와 동일한 휴가 입력시 오류 수정.. 이명노M 요청
          //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno) then System.Exit;
          if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno, FL_Comp.labelcaption) then System.Exit;

          FL_Comp.ValueCaption    := ED_hotkey.codename;
          FL_Comp.Hint            := ED_hotkey.codeno;
          FL_Comp.ValueFont.Color := clPurple;
          FL_Comp.Repaint;
        end;
      end
      else
      begin
        //2017.03.03.hjku.. 관리자 휴가 일괄 등록 가능하도록 수정.. 김진호M 요청
        //if ((FL_Comp.ValueCaption = '') or (FL_Comp.ValueCaption = '미입')) then
        if ((FL_Comp.Hint = '') or (FL_Comp.Hint = UNDECIDED) or (FL_Comp.Hint = NORMAL)) then
        begin
          //2016.09.23.hjku.. 입력정보와 동일한 휴가 입력시 오류 수정.. 이명노M 요청
          //if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno) then System.Exit;
          if not PL_Get_Allow_Enroll(FG_yy, ED_empno.empno, ED_hotkey.codeno, FL_Comp.labelcaption) then System.Exit;

          FL_Comp.ValueCaption    := ED_hotkey.codename;
          FL_Comp.Hint            := ED_hotkey.codeno;
          FL_Comp.ValueFont.Color := clPurple;
          FL_Comp.Repaint;
        end;
      end;
    end;
  end;
end;

procedure TFM_Main.ED_yearChange(Sender: TObject);
begin
  FG_yy := ED_year.KeyItems[ED_year.ItemIndex];

  P_2016.Left := 96;
  P_2016.Top  := 428;

  P_2017.Left := 96;
  P_2017.Top  := 428;

  //2017.01.13.hjku.. 2017년 연차표기 변경.. 김진호M 요청
  if(FG_yy='2017') then
  begin
    P_2016.Visible := false;
    P_2017.Visible := true;
  end
  else
  begin
    P_2016.Visible := true;
    P_2017.Visible := false;
  end;

//유효성 추가
  if Trim(ED_empno.empno) <> '' then
    PL_Month_Contructor;
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

  yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String; //2015.06.18.hjku.. 연차사용촉진 관련 변수 추가.
begin
  //2016.09.23.hjku.. 휴가계획등록마감자료 확인 추가
  FG_Mendyn := PL_Month_endyn(FG_yy+FG_Month,ED_empno.empno);

  if FG_Mendyn then
    begin
      MessageDlg('휴가계획등록이 마감된 자료입니다... 등록할 수 없습니다...', mtInformation, [mbOK], 0);
      PL_Month_Contructor;      
      System.Exit;
    end;

//  if (Copy(ED_empno.Text,1,1) = 'M') or (Copy(ED_empno.Text,1,1) = 'Y') then
  if (Copy(ED_empno.Text,1,1) = 'M') then
  begin
    MessageDlg('휴가계획등록을 실행할 수 없는 사원입니다. ', mtInformation,[mbOk], 0);
    ED_empno.SetFocus;
    System.Exit;
  end;

  //dsa2000  2005.11.09.근무지 확인 체크, 전산처리요청.
  if (not Bldcode_Chk(ED_bldcode.Codeno)) or (ED_bldcode.Text = '') then
  begin
    MessageDlg('잘못된 근무지입니다. 확인하여 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    ED_bldcode.SetFocus;
    System.Exit;
  end;

  //2016.09.29.hjku.. 연차등록갯수, 목표 체크 기능 추가
  OldCaption := '';
  OldHint    := '';
  OldDay     := '';
  if not PL_Chk_Yearly_Cnt('') then system.exit;

    //2013.12.5.hjku 휴가계획등록 체크 전으로 옮김.
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
          FL_Comp.ValueFont.Color := clRed;
          FL_Comp.ValueCaption := '불입';
          FL_Comp.Hint         := BEFORE;
        end;
      end;
    end;  

  //2013.11.20.hjku.추가. 퇴직자 퇴직일 이후 불입처리..홍원영M요청
    if PL_Retire_Check(ED_empno.empno) then
    begin
      tmpDay := Copy(FG_retdate,7,2);

      for FL_i := 1 to 42 do
      begin
        FL_Comp := nil;
        FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
        if (Trim(FL_Comp.LabelCaption) <> '') and (FL_Comp.LabelFont.Color <> clRed) and
           (StrToInt(Trim(FL_Comp.LabelCaption)) > StrToInt(tmpDay)) then
        begin
          FL_Comp.ValueFont.Color := clRed;
          FL_Comp.ValueCaption := '불입';
          FL_Comp.Hint         := BEFORE;
        end;
      end;
    end;

  //2013.12.17.hjku 이명노M 요청으로..
  //2016.02.03.hjku.. 김진호M 추가 요청..
  //if (Copy(FG_empno,1,1) <> 'D') and (FG_empno <> '1884') then
{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  if (Copy(FG_empno,1,1) <> 'D') and (FG_empno <> '2684') and (FG_empno <> '1884') then
  begin
      //2013.11.20.hjku.추가. 저장전 입력값이 없는 날짜가 있으면 저장 취소..홍원영M요청
      for FL_i := 1 to 42 do
      begin
        FL_Comp := nil;
        FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
        if (Trim(FL_Comp.LabelCaption) <> '') and (FL_Comp.LabelFont.Color <> clRed) then
        begin
             if(FL_Comp.Hint= '') or (FL_Comp.Hint=UNDECIDED) then
             begin
                MessageDlg(FL_Comp.LabelCaption+'일 휴가가 입력되지 않았습니다.'+#13
                           +'입사일이전이나 퇴직일 이후에는 불입으로 입력하시기 바랍니다.', mtInformation,[mbOk], 0);
                System.Exit;
             end;
        end;
      end;
  end;
}
  //2016.09.27.hjku.. 미입력된 자료가 있을 경우 정상으로 변환후 저장
  for FL_i := 1 to 42 do
  begin
    FL_Comp := nil;
    FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
    if (Trim(FL_Comp.LabelCaption) <> '') and (FL_Comp.LabelFont.Color <> clRed) then
    begin
         if(FL_Comp.Hint= '') or (FL_Comp.Hint=UNDECIDED) then
         begin
            FL_Comp.Hint            := NORMAL;
            FL_Comp.ValueFont.Color := clWhite;
            FL_Comp.ValueCaption := '정상';
         end;
    end;
  end;
  
{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  //2013.11.20.hjku.추가. 결재된 자료는 수정불가(관리자와 사용자 동시 화면에서 오류발생 제어하기 위해)..홍원영M요청
  if (ConYN_Chk(FG_yy+FG_Month, ED_empno.empno)) then
  begin
    MessageDlg('이미 결재완료된 자료입니다.'+#13#10+
               '다시 조회해 보시기 바랍니다.', mtInformation,[mbOk], 0);
    ED_bldcode.SetFocus;
    System.Exit;
  end;
}  

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  if (not FG_bldcodeYN) then
  begin
    MessageDlg('휴가계획등록 전에 근무지를 확인해 주시기 바랍니다! '+#13#13+
               '본인의 실제 근무지를 선택 후 "근무지확인" 버튼을 눌러야만 '+#13#13+
               '당월 휴가계획등록이 가능합니다.', mtInformation,[mbOk], 0);
    ED_bldcode.SetFocus;
    System.Exit;
  end
  else   //인사마스터와 급여마스터 근무지코드 칼럼에 저장.
  begin
    with QR_com do
    begin
      Close;
      ServiceName := 'PKA4040A_dml';
      Sql.Clear;
      FL_Sql := Format('UPDATE PIMPMAS '+
                       '   SET JOBPLACE  = ''%s''  '+
                       ' WHERE EMPNO = ''%s''', [ED_bldcode.Codeno, ED_empno.empno ] );
      Sql.Add(FL_Sql); //showmessage(FL_Sql);
      if not QR_com.Execute then
      begin
        Application.MessageBox('인사마스터의 근무지 저장에 실패했습니다.','작업실패',MB_OK);
        Exit;
      end;

      Sql.Clear;
      FL_Sql := Format('UPDATE PKMPMAS '+
                       '   SET BLDCODE   = ''%s''  '+
                       ' WHERE EMPNO = ''%s''', [ED_bldcode.Codeno, ED_empno.empno ] );
      Sql.Add(FL_Sql);
      if not QR_com.Execute then
      begin
        Application.MessageBox('급여마스터의 근무지 저장에 실패했습니다.','작업실패',MB_OK);
        Exit;
      end;
    end;
  end;
  //dsa2000  2005.11.09.  End////////////////////////////////////////////////////
}
  {2015.08.21.hjku.. 근무시간 입력 체크 오류 수정.. 홍원영M 요청..
  //2012.03.02 kth 근무 타입 저장 시작
  with QR_com do
  begin
       PL_Com_Contructor;
       FL_Sql := Format('SELECT DUYYMM,EMPNO,KORNAME,WORKTYPE,''field5'' '+
                        '  FROM PKHDUTY                                  '+
                        ' WHERE DUYYMM = ''%s''                          '+
                        '   AND EMPNO =  ''%s''                          ',[FG_yy+FG_Month, ED_empno.empno] );
       Sql.Text := FL_Sql;
       Open;

       if  QR_com.Eof then
       begin
            if ED_Type.ItemIndex  < 0 then
            begin
                 MessageDlg('휴가계획등록 전에 근무(시간)타입를 확인해 주시기 바랍니다! '+#13#13+
                            '본인의 실제 근무(시간)타입를 선택 후 휴가계획등록 버튼을 눌러 주세요. '+#13#13+
                            '타입 선택후 당월 휴가계획등록이 가능합니다.', mtInformation,[mbOk], 0);
                 ED_Type.SetFocus;
                 System.Exit;
            end;
       end;

       Close;
  end;
//2012.03.02 kth 근무 타입 저장 종료
  }

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  if ED_Type.ItemIndex  < 0 then
  begin
       MessageDlg('휴가계획등록 전에 근무(시간)타입를 확인해 주시기 바랍니다! '+#13#13+
                  '본인의 실제 근무(시간)타입를 선택 후 휴가계획등록 버튼을 눌러 주세요. '+#13#13+
                  '타입 선택후 당월 휴가계획등록이 가능합니다.', mtInformation,[mbOk], 0);
       ED_Type.SetFocus;
       System.Exit;
  end;
}  

  with QR_com do
  begin
    Close;
    ServiceName := 'PKA4040A_dml';
    Sql.Clear;
    FL_Sql := Format('UPDATE PIMPMAS '+
                     '   SET JOBPLACE  = ''%s''  '+
                     ' WHERE EMPNO = ''%s''', [ED_bldcode.Codeno, ED_empno.empno ] );
    Sql.Add(FL_Sql); //showmessage(FL_Sql);
    if not QR_com.Execute then
    begin
      Application.MessageBox('인사마스터의 근무지 저장에 실패했습니다.','작업실패',MB_OK);
      Exit;
    end;

    Sql.Clear;
    FL_Sql := Format('UPDATE PKMPMAS '+
                     '   SET BLDCODE   = ''%s''  '+
                     ' WHERE EMPNO = ''%s''', [ED_bldcode.Codeno, ED_empno.empno ] );
    Sql.Add(FL_Sql);
    if not QR_com.Execute then
    begin
      Application.MessageBox('급여마스터의 근무지 저장에 실패했습니다.','작업실패',MB_OK);
      Exit;
    end;
{2014.09.02.hjku. 방문자예약 업데이트 삭제 ...강륜종 팀장 요청
    //kth  근무지 저장
    Sql.Clear;
    FL_Sql := Format('UPDATE PVPIMPMAS '+
                     '   SET JOBPLACE   = ''%s''  '+
                     ' WHERE EMPNO = ''%s''', [ED_bldcode.Codeno, ED_empno.empno ] );
    Sql.Add(FL_Sql);
    if not QR_com.Execute then
    begin
      Application.MessageBox('급여마스터의 근무지 저장에 실패했습니다.','작업실패',MB_OK);
      Exit;
    end;
//kth  근무지 저장 완료.
}
  end;

  //DSA2000  2005.08.26.  전월말일 휴가가 교대근무인지 체크.
  with QR_com do
    begin
      PL_Com_Contructor;
      FL_Sql := Format('SELECT DECODE(TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1)),''DD''),28,DD28,29,DD29,30,DD30,31,DD31), '+
                       '       empno, ''field3'', ''field4'', ''field5'' '+
                       '  FROM PKHDUTY '+
                       ' WHERE duyymm = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'') '+
                       '   AND empno  = ''%s''   ', [FG_yy+FG_Month, FG_yy+FG_Month, FG_empno] );
      Sql.Text := FL_Sql;
      Open;
      FL_dutycode := Trim(FieldByName('field1').AsString);
      Close;
    end;//DSA2000  2005.08.26.  End...////////////////////////////////////////////


    //2016.10.13.hjku.. 1일 비번 반영전 연차(반연차) 여부 체크 기능 추가.. 이명노M
    FL_k := 1;
    for FL_i := 1 to 42 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
      begin
        if FL_Comp.Visible then
        begin
          if (FL_k = 1) and (FL_dutycode = EXCHANGE) then
          begin
            if((FL_Comp.Hint = HOLIYEAR)or(FL_Comp.Hint = YEARHALF)) then
            begin
              MessageDlg('전월 말일 휴가계획 등록 내역이 교대근무인 경우 1일은 비번으로 자동처리되나,'+ #13#10 +
                         '1일에 연차(반연차)가 등록되어 비번으로 반영할 수 없습니다. '+ #13#10 +
                         '1일에 등록한 연차(반연차)일을 변경하신후 다시 저장해 주시기 바랍니다.', mtInformation,[mbOk], 0);
              System.Exit;
            end
            else if ((FL_Comp.Hint <> HOLIDAY) and
                     (not PL_code_check(TOnShapeLabel(FL_Comp).Hint))) then
            begin
              MessageDlg('전월 말일 휴가계획 등록 내역이 교대근무인 경우 1일은 비번으로 자동처리되나,'+ #13#10 +
                         '1일에 관리자 등록코드가 등록되어 비번으로 반영할 수 없습니다. '+ #13#10 +
                         'HR팀에 문의하시기 바랍니다.', mtInformation,[mbOk], 0);
              System.Exit;
            end;

          end
          else if(FL_k > 1) then break ;

          Inc(FL_k);
        end;
      end;
    end;


  // 강륜종(dsa2000) 2004.04.29. 휴가 선등록 할수 없도록 막음. 박경철 대리 요청
  //2013.07.04.hjku.. 파견직은 당월까지 가능하고 정규직은 전월만... 이명노M 요청
  //2013.08.29.hjku.. 휴가계획등록은 당월까지 등록가능하도록 수정.. 이명노M 요청
  //2016.09.23.hjku.. 일반사용자는 1년단위로 휴가계획등록가능하도록 수정.. 이명노M
{
    if(Copy(FG_grade,3,1) > 'C') and (FG_yy+FG_Month > Copy(FG_Date,1,6)) then
    begin
      MessageDlg('휴가계획등록은 현재월까지만 등록 할 수 있습니다.. '+#13+
                 '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;
}
    if(Copy(FG_grade,3,1) > 'C') and (FG_yy > Copy(FG_Date,1,4)) then
    begin
      MessageDlg('휴가계획등록은 현재년도까지만 등록 할 수 있습니다.. '+#13+
                 '휴가 선(先)등록은 HR팀에 요청하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

// 강륜종(dsa2000) 2005.07. 휴일쪽에는 휴일, 교대, 비번외에는 등록 불가능토록.
  FL_k := 1;
  for FL_i := 1 to 42 do
    begin
      FL_Comp := nil;
      FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
      if FL_Comp <> nil then
        begin
          if (FL_Comp.Visible) and (FL_Comp.LabelFont.Color = clRed) then
            begin         //ShowMessage(FL_Comp.Hint);
              if (FL_Comp.Hint <> HOLIDAY2) and (FL_Comp.Hint <> HOLIDAY) and (FL_Comp.Hint <> EXCHANGE) and (FL_Comp.Hint <> EXCHHOLI) then
                 begin
                   MessageDlg('휴일 휴가계획등록이 잘못되었습니다. 체크 바랍니다.', mtInformation, [mbOk], 0);
                   System.Exit;
                 end;
            end;
          Inc(FL_k);
        end;
    end;


/////////////////////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '해당월의 휴가계획 정보 저장 중입니다... 잠시만 기다리세요...';
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
          AddField('empno'       ,ED_empno.empno    ,ftString, False, True, True, '=');
        end
      else
        begin
          AddField('duyymm'      ,FG_yy+FG_Month    ,ftString, True, False, False, '');
          AddField('empno'       ,ED_empno.empno    ,ftString, True, False, False, '');
          AddField('korname'     ,ED_empno.korname  ,ftString, True, False, False, '');
          //2016.09.26.hjku.. 저장시 반영되도록 아래로 내림.
          //AddField('orgnum'      ,ED_empno.orgnum   ,ftString, True, False, False, '');
          //AddField('deptcode'    ,ED_empno.jobdept  ,ftString, True, False, False, '');

        end;

      AddField('orgnum'      ,ED_empno.orgnum   ,ftString, True, False, False, '');
      AddField('deptcode'    ,ED_empno.jobdept  ,ftString, True, False, False, '');
                  
      FL_k := 1;
      for FL_i := 1 to 42 do
        begin
          FL_Comp := nil;
          FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
          if FL_Comp <> nil then
            begin
              if FL_Comp.Visible then
                begin
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

{2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
     //안효상 2012.08.06. A B C 타입 리스트에 안보이게 하고 08:00시부터 나오도록 순서 변경 요청.
      if      ED_Type.ItemIndex = 0 then
              AddField('WORKTYPE'    ,'B'    ,ftString, True, False, False, '') //08:00~
      else if ED_Type.ItemIndex = 1 then
              AddField('WORKTYPE'    ,'A'    ,ftString, True, False, False, '') //09:00~
      else if ED_Type.ItemIndex = 2 then
              AddField('WORKTYPE'    ,'C'    ,ftString, True, False, False, '')//10:00~
      //2015.10.21.hjku.. 근무시간 추가 요청.. 홍원영M(SR-1510-0773)
      else if ED_Type.ItemIndex = 3 then
              AddField('WORKTYPE'    ,'D'    ,ftString, True, False, False, '') //11:00~
      else if ED_Type.ItemIndex = 4 then
              AddField('WORKTYPE'    ,'E'    ,ftString, True, False, False, '') //13:00~
      else if ED_Type.ItemIndex = 5 then
              AddField('WORKTYPE'    ,'F'    ,ftString, True, False, False, '');//Flexible Time
}
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
    MessageDlg('휴가계획등록이 완료 되었습니다...'+#13 +
               '전월 말일 휴가계획등록 내역이 교대근무이므로 1일은 비번으로 자동 등록되었습니다.', mtInformation, [mbOK], 0)
  else
    MessageDlg('휴가계획등록이 완료 되었습니다...', mtInformation, [mbOK], 0);

  //2014.09.22.hjku. 연차사용촉진 등록 확인 메시지 출력.. 이명노M 요청.
  //2015.01.09.hjku. 7월 이후로 수정 일단 막음... 이명노M 요청..
  {   if(not PL_Chk_Pkyearlt_Completed(FG_yy, ED_empno.empno)) then
      begin
        MessageDlg('하반기 연차휴가 사용계획이 등록되지 않았습니다.'+#13 +
                   '[연차휴가 사용촉진] 메뉴에서 사용계획을 등록바랍니다.', mtInformation, [mbOK], 0)
      end;
  }
  
  //2015.06.17.hjku.. 7월만 팝업 허용.. 이명노M 요청.
  //2015.06.30.hjku.. 이명노M만 항상 실행되도록.. 이명노M 요청.
{  if (copy(GS_YYYYMM,5,2)='07') or
     (Copy(FG_empno,1,1) = 'D') or
     (FG_empno = '2684') then
  begin
      if(not PL_Select_Pkyearlt(copy(GS_YYYYMM,1,4),ED_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn)) then
      begin
          if not((strtofloat(yearly_cnt) <= 0)or(ED_empno.empno[1] in ['Y','P','Q'])) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
              FM_popup.SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
              FM_popup.SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
              FM_popup.SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));
              FM_popup.ShowModal;
          end;
      end;
  end;

  }

  //2016.06.13.hjku.. 공지 오픈 요청.. 김진호M
  //2015.08.25.hjku.. 휴가 등록 관련 시스템 개발의 건.. 이명노M.
  //2015.07.14.hjku.. 8월 공지 변경.. 이명노M 요청..
{//2016.09.23.hjku.. 휴가계획등록시스템개선에 따라 삭제.. 이명노M 요청
  if (copy(GS_YYYYMM,5,2)='07') or (copy(GS_YYYYMM,5,2)='08') then
  begin
      PL_Select_Pkyearlt(copy(GS_YYYYMM,1,4),ED_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);

      if (copy(GS_YYYYMM,5,2)='07') and((notice_yn='N') or (Copy(FG_empno,1,1) = 'D') or (FG_empno = '0577') or (FG_empno = '1884')) then
      begin
          if not((strtofloat(yearly_cnt) <= 0)or(ED_empno.empno[1] in ['Y','P','Q'])) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
              FM_popup.SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
              FM_popup.SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
              FM_popup.SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));
              FM_popup.p_yearly_notice.visible  := true;
              FM_popup.p_yearly_notice2.visible := false;
              FM_popup.p_yearly_notice3.visible := false;
              FM_popup.p_yearly_notice.align    := alClient;
              FM_popup.width  := 710;
              FM_popup.height := 348;
              FM_popup.caption := '[공지사항]';
              FM_popup.ShowModal;
              PL_Month_Contructor;
          end;
      end
      //2016.06.29.hjku.. 8월 공지 변경.. 김진호M
      else if (copy(GS_YYYYMM,5,2)='08') and((assign_yn='N') or (Copy(FG_empno,1,1) = 'D') or (FG_empno = '2684') or (FG_empno = '1884')) then
      begin
          if not((strtofloat(yearly_cnt) <= 0)or(ED_empno.empno[1] in ['Y','P','Q'])) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.p_yearly_notice.visible  := false;
              FM_popup.p_yearly_notice2.visible := true;
              FM_popup.p_yearly_notice3.visible := false;
              FM_popup.p_yearly_notice2.align   := alClient;
              FM_popup.width  := 445;
              FM_popup.height := 148;
              FM_popup.caption := '[알림]';
              FM_popup.ShowModal;
              PL_Month_Contructor;
          end;
      end;

      else if (copy(GS_YYYYMM,5,2)='08') and((assign_yn='N') or (Copy(FG_empno,1,1) = 'D') or (FG_empno = '2684') or (FG_empno = '1884')) then
      begin
          if not((strtofloat(yearly_cnt) <= 0)or(ED_empno.empno[1] in ['Y','P','Q'])) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
              FM_popup.SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
              FM_popup.SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
              FM_popup.SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));
              FM_popup.p_yearly_notice.visible  := false;
              FM_popup.p_yearly_notice2.visible := false;
              FM_popup.p_yearly_notice3.visible := true;
              FM_popup.p_yearly_notice3.align   := alClient;
              FM_popup.width  := 538;
              FM_popup.height := 262;
              FM_popup.caption := '[공지사항]';
              FM_popup.ShowModal;
              PL_Month_Contructor;
          end;
      end;

  end;
}  

  {
  //2015.12.29.hjku.. 연차사용촉진 독려 공지 차단 요청.. 이명노M
  if (copy(GS_YYYYMM,5,2)='06') or (copy(GS_YYYYMM,5,2)='08') then
  begin
      PL_Select_Pkyearlt(copy(GS_YYYYMM,1,4),ED_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);

      if (assign_yn='N')and(strtofloat(yearly_cnt) > 0) then
      begin
          if  (FG_Empno = ED_empno.empno)or ((Copy(FG_empno,1,1) = 'D') or (FG_empno = '2684')) then
          begin
              FM_popup := TFM_popup.Create(Self);
              FM_popup.SL_Yearly_Cnt.LabelCaption        := yearly_cnt       ;
              FM_popup.SL_Yearlyplan_Cnt.LabelCaption    := yearlyplan_cnt   ;
              FM_popup.SL_Used_Yearly_Cnt.LabelCaption   := used_yearly_cnt  ;
              FM_popup.SL_Unused_Yearly_Cnt.LabelCaption := floattostr(strtofloat(yearlyplan_cnt)-strtofloat(used_yearly_cnt));
              FM_popup.p_yearly_notice.visible  := false;
              FM_popup.p_yearly_notice2.visible := false;
              FM_popup.p_yearly_notice3.visible := true;
              FM_popup.p_yearly_notice3.align   := alClient;
              FM_popup.width  := 538;
              FM_popup.height := 262;
              FM_popup.caption := '[공지사항]';
              FM_popup.ShowModal;
              PL_Month_Contructor;
          end;
      end;

  end;
  }
  
end;

procedure TFM_Main.ED_empnoReadEnded(Sender: TObject);
 var  FL_Sql : String;
begin
  FG_empdate   := ED_empno.empdate;
  ED_empdate.ValueCaption := Copy(FG_empdate,1,4)+'-'+Copy(FG_empdate,5,2)+'-'+Copy(FG_empdate,7,2);
  if ED_dept.Enabled then
    begin
      ED_dept.Text := ED_empno.deptname;
      ED_dept.Hint := ED_empno.jobdept;
    end;

  PL_Month_Contructor;

  //dsa2000  2005.11.09.   기 저장된 근무지코드 읽어오기...
  with QR_com do
  begin
    PL_Com_Contructor;
    FL_Sql := Format('SELECT JOBPLACE||'' - ''||codename, '+
                     '       JOBPLACE  ,   ''field3'',    '+
                     '       ''field4'',   ''field5''     '+
                     '  FROM pimpmas a, pyccode b         '+
                     ' where b.codeid = ''I160''          '+
                     '   and b.codeno = JOBPLACE          '+
                     '   and b.useyn  = ''Y''             '+
                     '   and empno = ''%s''               ',[ED_empno.Empno]);
    Sql.Text := FL_Sql;
    Open;
    ED_bldcode.Text   := FieldByName('field1').AsString;
    ED_bldcode.Codeno := FieldByName('field2').AsString;
    Close;
  end;  
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      ED_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,       '+
                      '    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,  '+
                      '    A.empdate, A.orgempdate, A.juminid, A.jobdept                                  '+
                      '  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                  '+
                      ' WHERE D.codeid(+) = ''I113''                                                      '+
                      '   AND A.payra     = D.codeno(+)                                                   '+
                      '   AND C.codeid(+) = ''I112''                                                      '+
                      '   AND A.paycl     = C.codeno(+)                                                   '+
                      '   AND A.orgnum    = B.orgnum(+)                                                   '+
                      '   AND A.jobdept   = B.deptcode(+)                                                 '+
//2014.07.09.hjku. 동명이인 조회오류 수정.
//                      '   AND (A.empno    = ''%s'' OR A.korname = ''%s'')                                 ';
                      '   AND (A.empno    like ''%s'' OR A.korname like ''%s'')                                 ';

      ED_empno.PL_get_singledata;
      Key := #0;
    end;
end;

procedure TFM_Main.SB_normalClick(Sender: TObject);
begin
  ED_hotkey.Text := NORMAL;
  ED_hotkey.PL_get_singledata;
end;

procedure TFM_Main.BT_appClick(Sender: TObject);
var
  FL_Date : String;
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
  if not FG_Exists then
    begin
      MessageDlg('휴가계획등록을 완료 하지 않은 자료입니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if FG_Mendyn then
    begin
      MessageDlg('휴가계획등록이 마감된 자료입니다... 결재 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  {
  //미입체크..     //관리자는 결재 체크 추가.  2005.09.02. 신영섭 요청
  if (Copy(FG_grade,3,1) < 'C') and
     (Chk_noinput(FG_yy+FG_Month, ED_empno.empno) = True) and
     (Application.MessageBox('해당사원의 휴가계획등록 입력이 완료되지 않았습니다...'+#13#13#10+
        '그래도 결재 하시겠습니까?','[알림]',MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK) then
    begin
      System.Exit; //결재루틴은 무조건 못타도록..
    end;
  }
  //2013.11.19.hjku... 이명노M 요청으로 미입시 결재하지 못하도록 수정..
    if (Copy(FG_grade,3,1) < 'C') and
     (Chk_noinput(FG_yy+FG_Month, ED_empno.empno) = True) then
    begin
       MessageDlg('해당사원의 휴가계획등록이 완료되지 않았습니다...'+#13#13#10+
                  '휴가계획등록 완료 후, 결재하시기 바랍니다.', mtInformation, [mbOK], 0);
      System.Exit; //결재루틴은 무조건 못타도록..
    end;
    
  //미입체크..    //관리자는 결재 가능토록 FG_grade 추가.  2005.09.02. 신영섭 요청
  if (Copy(FG_grade,3,1) >= 'C') and
     (Chk_noinput(FG_yy+FG_Month, ED_empno.empno) = True) then
    begin
      //미입력 있을시 메일발송 , 결재 안되도록 추가.   전산처리요청  dsa2000  2005.07.
      if Application.MessageBox('해당사원의 휴가계획등록이 완료되지 않아 결재 할 수 없습니다...'+#13#13#10+
                                '해당사원에게 휴가계획등록 권고메일을 발송하시겠습니까?','[알림]',
          MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
        begin
          //Send_Mail(sSendToemp, sSendToName); //메일발송
          //////////////////////////////////////////////////////////////////////////////
          //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
          SendProgID  := 'PKA4040A';
          SendEmpno   := FG_empno;
          RcveEmpno   := ED_empno.empno;
          MailSubject := '[휴가계획등록 권고메일]';
          MailBody    := FG_yy+'년 '+FG_Month+'월 휴가계획등록 미입건이 있어'+#13+#13+
                        '결재를 못하고 있으므로 빠른 등록을 바람.'; //메일내용
          ReceiveYN   := 'N';
          //if ChkReceive.Checked then ReceiveYN := 'Y';

          if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
               MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
          else
          begin
               MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
               exit;
          end;
          //////////////////////////////////////////////////////////////////////////////
        end;

      System.Exit; //결재루틴은 무조건 못타도록..
    end;

  if FG_NewEmpno then  //신입사원여부 체크 추가. dsa2000  2007.02.
  begin
    if Application.MessageBox('해당사원은 신규입사자입니다. 결재 완료시 휴가계획 수정이 불가능합니다,'+#13#13#10+
                              '휴가계획 결재를 진행 하시겠습니까?','[알림]',
        MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    begin
       System.Exit; //결재루틴은 무조건 못타도록..
    end;
  end;

////////////////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '휴가계획등록 자료 결재작업 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FL_Date           := FM_Tmax.GetData('sysdate' ,'','');

  with QR_dml do
    begin
      QR_dml.ClearFieldInfo;
      AddField('duyymm'      ,FG_yy+FG_Month    ,ftString, False, True, False,'=');
      AddField('empno'       ,ED_empno.empno    ,ftString, False, True, True, '=');
      AddField('conyn'       ,'Y'               ,ftString, True, False, False, '');
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

  BT_canapp.Enabled := True;
  SB_Help.Panels[1].Text := '';
  PL_Month_Contructor;
  MessageDlg('휴가계획등록 자료 결재작업이 완료 되었습니다...', mtInformation, [mbOK], 0);
end;

function TFM_Main.PL_Retire_Check(P_empno : String):Boolean;
var
  FL_Sql  : String;
  tmpDay : String;
begin
  result := false;
  with QR_Com do
    begin
      PL_Com_Contructor;
      FL_Sql := 'SELECT retdate      field1,             '+ #13#10 +
                '       ''field2'', ''field3'',           '+ #13#10 +
                '       ''field4'', ''field5''            '+ #13#10 +
                '  FROM pimpmas A                         '+ #13#10 +
                ' WHERE A.empno  = ''%s''                 ';

      Sql.Text := Format(FL_Sql,[P_empno]);
      Open;
      FG_retdate := FieldByName('field1').AsString;
    end;

    if(FG_retdate<>'')and(length(FG_retdate)=8) then
         result := true
    else result := false;

    if Copy(FG_retdate,1,6) = (FG_yy+FG_Month) then
         result := true
    else result := false;
end;


function TFM_Main.ConYN_Chk(duyymm, empno :string): Boolean;
var
  FL_Sql  : String;
  FL_Chk  : Integer;
begin
    result := false;

  with QR_Com do
    begin
      PL_Com_Contructor;
      FL_Sql := 'SELECT count(*)      field1,             '+ #13#10 +
                '       ''field2'', ''field3'',           '+ #13#10 +
                '       ''field4'', ''field5''            '+ #13#10 +
                '  FROM PKHDUTY A                         '+ #13#10 +
                ' WHERE A.duyymm = ''%s''                 '+ #13#10 +
                '   AND A.empno  = ''%s''                 '+ #13#10 +
                '   AND NVL(conyn,''N'')  = ''Y''         ';

      Sql.Text := Format(FL_Sql,[duyymm, empno]);
      Open;
      FL_Chk := FieldByName('field1').AsInteger;
    end;

  if FL_Chk > 0 then
      result := True
  else
      result := False;
end;

function TFM_Main.Chk_noinput(duyymm, empno :string): Boolean;
var
  i,j     : integer;
  FL_Sql  : String;
  FL_Chk  : Integer;
  day_qry : String;
begin
     //2013.09.13.hjku. 미등록 대상자 추출 오류 해결하기 위해 추가...
     j := DaysOfMonth(StrToInt(copy(duyymm,1,4)),StrToInt(copy(duyymm,5,2))); //그달의 총일수

     for i := 1 to j do
     begin
          if i=1 then day_qry := 'nvl(DD'+inttostr(i)+' ,''99'')=''99'' '
                 else day_qry := day_qry + 'OR nvl(DD'+inttostr(i)+' ,''99'')=''99'' ';
     end;

  //계속 근무자
  with QR_Com do
    begin
      PL_Com_Contructor;
      FL_Sql := 'SELECT count(*)      field1,             '+ #13#10 +
                '       ''field2'', ''field3'',           '+ #13#10 +
                '       ''field4'', ''field5''            '+ #13#10 +
                '  FROM PKHDUTY A, PIMPMAS B              '+ #13#10 +
                ' WHERE A.EMPNO = B.EMPNO                 '+ #13#10 +
                '   AND A.DUYYMM <> SUBSTR(B.EMPDATE,1,6) '+ #13#10 +
                '   AND A.duyymm = ''%s''                 '+ #13#10 +
//                '  FROM PKHDUTY A        '+
//                ' WHERE A.duyymm = ''%s'''+
                '   AND A.empno  = ''%s''                 '+ #13#10 +
                '   AND (' + day_qry + ')';

                {'   AND (A.dd1 =''99'' or'+
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
                '        A.dd31=''99'' )  '; }

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


procedure TFM_Main.BT_canappClick(Sender: TObject);
var
  FL_Date : String;
begin
  if not FG_Exists then
    begin
      MessageDlg('휴가계획등록을 완료 하지 않은 자료입니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if FG_Mendyn then
    begin
      MessageDlg('휴가계획등록이 마감된 자료입니다... 결재 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := '휴가계획등록 자료 결재작업 취소 중입니다... 잠시만 기다리세요...';
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
  MessageDlg('휴가계획등록 자료 결재 취소작업이 완료 되었습니다...', mtInformation, [mbOK], 0);
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//일괄결재     dsa2000  2005.07.
procedure TFM_Main.BT_ConAllClick(Sender: TObject);
begin
  FM_ConAll := TFM_ConAll.Create(Self);
  FM_Conall.ShowModal;
end;

//노츠연동 메일 전송  dsa2000  2005.07.
{procedure TFM_Main.Send_Mail(sSendToemp : String; sSendToName : String);
begin
  Application.ProcessMessages;
  if not Assigned(nMail) then
  begin
    try
      nMail := CoLotusNotes_Hana.Create;  //라이브러리
    except
      begin
        nMail := nil;
        System.Exit;
      end;
    end;
    try
      while not nMail.GetInstance do
    except
      begin
        if Assigned(nMail) then
           nMail := nil;
        Close;
        System.Exit;
     end;
    end;
  end;
  try
    nMail.SendFrom   := FG_empno + ' ' + FG_korname;  //보내는사람
    nMail.SendTo     := sSendToemp;                   //받는사람 사번
    nMail.SendToName := sSendToName;                  //받는사람 성명
    nMail.CorName    := 'HANARO';
    nMail.Subject    := '[휴가계획등록 권고메일]';                 //메일제목
    nMail.Body       := FG_yy+'년 '+FG_Month+'월 휴가계획등록 미입건이 있어'+#13+#13+
                        '결재를 못하고 있으므로 빠른 등록을 바람.'; //메일내용
    nMail.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
    Halt;
  end;

  MessageDlg('메일이 전달되었습니다 !!.',mtInformation,[mbOK],0);
end; }

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

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);    //dsa2000  2005.11.09.
begin
  FG_bldcodeYN := True;
end;

function TFM_Main.Bldcode_Chk(P_bldcode : String) : Boolean; //dsa2000  2005.11.09.   근무지코드 체크...
var FL_Sql : String;
begin
  with QR_com do
  begin
    PL_Com_Contructor;
    FL_Sql := Format('SELECT count(*)  ,             '+
                     '       ''field2'', ''field3'', '+
                     '       ''field4'', ''field5''  '+
                     '  FROM pyccode                 '+
                     ' where codeid = ''I160''       '+
                     '   and codeno = ''%s''         '+
                     '   and useyn  = ''Y''          ',[ED_bldcode.Codeno]);
    Sql.Text := FL_Sql;
    Open;
    if FieldByName('field1').AsInteger < 1 then
    begin
      Close;
      result := False;
      System.Exit;
    end;
    Close;
    result := True;
  end;
end;

procedure TFM_Main.ED_TypeChange(Sender: TObject);
begin
  BT_Exit.SetFocus;
end;

//2014.09.22.hjku. 연차사용촉진 등록 확인 메시지 출력.. 이명노M 요청.
{
안녕하세요? HR팀 이명노입니다.
연차휴가 사용촉진에 의한 사용계획 등록 관련하여 아래와 같이 팝업창 생성 바랍니다.
기간은 10월말까지만 진행할 예정이며,
팀장 이하 구성원이 본인의 휴가계획등록 저장을 누르면
하반기 연차휴가 사용계획이 등록되지 않았습니다.
‘연차휴가 사용촉진’ 메뉴에서 사용계획을 등록바랍니다.
[확인]
라고 팝업을 띄워주시면 감사드리겠습니다.
감사합니다.

이명노 드림
}
function TFM_Main.PL_Chk_Pkyearlt_Completed(P_yy, P_empno : String) : Boolean;
var
  FL_Sql : String;
begin
  Result := true;
  try
    with QR_Com do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT COUNT(empno),   '+
                  '       ''field2'',     '+
                  '       ''field3'',     '+
                  '       ''field4'',     '+
                  '       ''field5''      '+
                  '  FROM pkyearlt a      '+
                  ' WHERE YEARLY_YY = ''%s'' '+
                  '   AND empno  = ''%s'' ' +
                  '   AND substr(empno,1,1) not in (''P'',''Q'',''Y'') ' +
                  '   AND nvl(ASSIGN_YN,''N'')<>''Y''  ' +
                  '   AND  YEARLYPLAN_CNT > 0 '+
                  '   AND  exists(select 1 from pimpmas b where a.empno = b.empno and b.payra >=''C11'') ';
                  
        Sql.Text := Format(FL_Sql,[P_yy, p_empno]);
        Open;
        if GetStrToInt(Trim(FieldByName('field1').AsString)) > 0 then
          Result := false;
        Close;
      end;
  except
    System.Exit;
  end;
end;

function TFM_Main.PL_Select_pkyearlt(workyy, empno : string;
                   out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String): Boolean;
begin
  result := false;

  with QR_com do
    begin
      PL_Com_Contructor;

      SQL.Add('select * from (                                                                                         ');
      SQL.Add('SELECT YEARLY_CNT,                                                                                      ');
      SQL.Add('       YEARLYPLAN_CNT,                                                                                  ');
      SQL.Add('       PAYUTIL.GET_DUTY_CNT(EMPNO,YEARLY_YY||''0101'',YEARLY_YY||''1231'',''1'') USED_YEARLY_CNT,       ');
      SQL.Add('       NVL(NOTICE_YN,''N'') NOTICE_YN,                                                                  ');
      SQL.Add('       NVL(ASSIGN_YN,''N'') ASSIGN_YN                                                                   ');
      SQL.Add('  FROM PKYEARLT   a                                                                                     ');
      SQL.Add(' WHERE yearly_yy = '''+workyy+''' AND empno = '''+empno+'''                                             ');
      SQL.Add('  and exists(select 1 from pimpmas where pstate <''80'' and a.empno = empno)                            ');
      SQL.Add('  and not exists(select 1 from pimpmas where pstate <''80'' and a.empno = empno and deptcode=''YKKK0'') ');
      SQL.Add(') where USED_YEARLY_CNT<YEARLYPLAN_CNT                                                                  ');
      //memo1.text := sql.text;
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

    if(assign_yn='Y') then result := true;
end;


//2015.03.02.hjku.. 연차등록 메뉴로 이동 추가... 이명노M 요청
procedure TFM_Main.Y_moveClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, FL_Progid);  //Call하는 단위 프로그램의 버젼을 체크..
  if  (not FM_DownLoad.FL_VersionCHK ) or
   (not FileExists(GetHomeDir+'\Bin\3tier\'+FL_Progid+'.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Kbin',FL_Progid+'.EXE',FL_Progid,FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
    FM_DownLoad.PL_ProgramCall(GetHomeDir+'\Bin\3Tier\'+FL_Progid+'.EXE');
    if FM_DownLoad.FL_Ret < 32 then
       MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;

  inform_Panel.visible := false;

end;

procedure TFM_Main.Y_closeClick(Sender: TObject);
begin
    inform_Panel.visible := false;
end;

procedure TFM_Main.get_dayoff_list(duyymm, empno : string);
var
  FL_i       : Integer;
  FL_k       : Integer;
  FL_Comp    : TOnShapeLabel;
  v_startdate, v_enddate, v_curdate : string;
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  v_curdate           := FM_Tmax.GetData('sysdate' ,'','');

{현재일까지 계산 방식 : 삭제함(해당월로 변경)
  if(copy(duyymm,1,4)< copy(v_curdate,1,4)) then
  begin
    v_startdate := copy(duyymm,1,4)+'0101';
    v_enddate   := copy(duyymm,1,4)+'1231';
  end
  else if(copy(duyymm,1,4) = copy(v_curdate,1,4)) then
  begin
    v_startdate := copy(duyymm,1,4)+'0101';
    v_enddate   := copy(v_curdate,1,8);
  end
  else
  begin
    v_startdate := '';
    v_enddate   := '';
  end;
}
  v_startdate := copy(duyymm,1,4)+'0101';
  v_enddate   := duyymm +'31';

  //연차갯수
  with QR_com do
  begin
    Close;
(*2017.01.13.hjku..2017년 연차갯수 표기 변경.. 김진호M 요청
    ServiceName := 'HINSA_select4';
    ClearFieldInfo;
    AddField('field1' , ftString, 100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);

    Sql.Clear;

    SQL.Add('SELECT nvl(YEARLY_CNT,0),                                                                                    ');
    SQL.Add('       nvl(YEARLYPLAN_CNT,0),                                                                                ');
    SQL.Add('       hper.DUTYUTIL.GET_DUTY_CNT(EMPNO,YEARLY_YY||''0101'',YEARLY_YY||''1231'',''1'','''') USED_YEARLY_CNT, ');
    SQL.Add('       hper.DUTYUTIL.GET_DUTY_CNT_EXCEPT_MONTH(EMPNO,'''+duyymm+''' ,''1'') except_YEARLY_CNT,               ');
    SQL.Add('       case when '''+v_startdate+''' ='''' then 0                                                            ');
    SQL.Add('            else hper.DUTYUTIL.GET_DUTY_CNT(EMPNO,'''+v_startdate+''','''+v_enddate+''',''1'','''')          ');
    SQL.Add('           end cur_USED_YEARLY_CNT                                                                           ');
    SQL.Add('  FROM PKYEARLT                                                                                              ');
    SQL.Add(' WHERE yearly_yy = '''+copy(duyymm,1,4)+''' AND empno = '''+empno+'''                                        ');
*)
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('field1' , ftString, 100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);
    AddField('field6' , ftString, 100);
    AddField('field7' , ftString, 100);
    AddField('field8' , ftString, 100);
    AddField('field9' , ftString, 100);
    AddField('field10', ftString, 100);

    Sql.Clear;

    SQL.Add('SELECT nvl(YEARLY_CNT,0),                                                                                    ');
    SQL.Add('       nvl(YEARLYPLAN_CNT,0),                                                                                ');
    SQL.Add('       hper.DUTYUTIL.GET_DUTY_CNT(EMPNO,YEARLY_YY||''0101'',YEARLY_YY||''1231'',''1'','''') USED_YEARLY_CNT, ');
    SQL.Add('       hper.DUTYUTIL.GET_DUTY_CNT_EXCEPT_MONTH(EMPNO,'''+duyymm+''' ,''1'') except_YEARLY_CNT,               ');
    SQL.Add('       case when '''+v_startdate+''' ='''' then 0                                                            ');
    SQL.Add('            else hper.DUTYUTIL.GET_DUTY_CNT(EMPNO,'''+v_startdate+''','''+v_enddate+''',''1'','''')          ');
    SQL.Add('           end cur_USED_YEARLY_CNT,                                                                          ');
    SQL.Add('       nvl(TOT_YEARLY_CNT,0),                                                                                ');
    SQL.Add('       nvl(PRE_USED_CNT,0),                                                                                  ');
    SQL.Add('       0,0,0                                                                                                 ');
    SQL.Add('  FROM PKYEARLT                                                                                              ');
    SQL.Add(' WHERE yearly_yy = '''+copy(duyymm,1,4)+''' AND empno = '''+empno+'''                                        ');
    //memo1.text := sql.text;

    Open;

    if(QR_com.RecordCount > 0) then
    begin
      GS_yearly_cnt            := FieldByName('field1').AsFloat;
      GS_yearlyplan_cnt        := FieldByName('field2').AsFloat;
      GS_used_yearly_cnt       := FieldByName('field3').AsFloat;
      GS_except_yearly_cnt     := FieldByName('field4').AsFloat;
      GS_cur_used_yearly_cnt   := FieldByName('field5').AsFloat;
      GS_tot_yearly_cnt        := FieldByName('field6').AsFloat;
      GS_pre_used_cnt          := FieldByName('field7').AsFloat;
    end
    else
    begin
      GS_yearly_cnt            := 0;
      GS_yearlyplan_cnt        := 0;
      GS_used_yearly_cnt       := 0;
      GS_except_yearly_cnt     := 0;
      GS_cur_used_yearly_cnt   := 0;
      GS_tot_yearly_cnt        := 0;
      GS_pre_used_cnt          := 0;
    end;

  end;

  //특휴갯수
  with QR_com do
  begin
    Close;
    ServiceName := 'HINSA_select4';
    ClearFieldInfo;
    AddField('field1' , ftString, 100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);

    Sql.Clear;

    //2016.10.21.hjku.. 특휴특이자 반영. 이명노M 요청.
{
    sql.add('select case when exists(select 1 from PIMPMAS                                                            ');
    sql.add('                         WHERE JUMINID IN (SELECT JUMINID                                                ');
    sql.add('                                             from PIMPMAS                                                ');
    sql.add('                                            where PSTATE <> ''80''                                       ');
    sql.add('                                            GROUP BY JUMINID                                             ');
    sql.add('                                           having COUNT(*) >1)                                           ');
    sql.add('                           and PSTATE  < ''80''                                                          ');
    sql.add('                           AND EMPDATE > substr('''+duyymm+''',1,4)||''0101''                            ');
    sql.add('                           and SUBSTR(EMPNO,1,1) = ''P''                                                 ');
    sql.add('                           and EMPNO   = a.EMPNO)                                                        ');
    sql.add('                 then 6                                                                                  ');
    sql.add('            when substr(empdate,1,6) <=substr('''+duyymm+''',1,4)||''03'' then 6                         ');
    sql.add('            when SUBSTR(EMPDATE,1,6) <=substr('''+duyymm+''',1,4)||''06'' then 4                         ');
    sql.add('            when SUBSTR(EMPDATE,1,6) <=substr('''+duyymm+''',1,4)||''09'' then 3                         ');
    sql.add('            else 0 end special_cnt,                                                                      ');
    sql.add('       hper.DUTYUTIL.GET_DUTY_CNT_EXCEPT_MONTH('''+empno+''' ,'''+duyymm+''' ,''2'') except_special_CNT, ');
    SQL.Add('       case when '''+v_startdate+''' ='''' then 0 ');
    SQL.Add('            else hper.DUTYUTIL.GET_DUTY_CNT(EMPNO,'''+v_startdate+''','''+v_enddate+''',''4'','''+SPECIAL+''')');
    SQL.Add('           end cur_USED_YEARLY_CNT,                                                                           ');
    sql.add('       0,0,0                                                                                             ');
    sql.add('from PIMPMAS a                                                                                           ');
    sql.add('where empno = '''+empno+'''                                                                              ');
}
    sql.add('select case when b.SPECIAL_CNT is not null then b.SPECIAL_CNT                                            ');
    sql.add('            when exists(select 1 from PIMPMAS                                                            ');
    sql.add('                         WHERE JUMINID IN (SELECT JUMINID                                                ');
    sql.add('                                             from PIMPMAS                                                ');
    sql.add('                                            where PSTATE <> ''80''                                       ');
    sql.add('                                            GROUP BY JUMINID                                             ');
    sql.add('                                           having COUNT(*) >1)                                           ');
    sql.add('                           and PSTATE  < ''80''                                                          ');
    sql.add('                           AND EMPDATE > substr('''+duyymm+''',1,4)||''0101''                            ');
    sql.add('                           and SUBSTR(EMPNO,1,1) = ''P''                                                 ');
    sql.add('                           and EMPNO   = a.EMPNO)                                                        ');
    sql.add('                 then 6                                                                                  ');
    sql.add('            when substr(empdate,1,6) <=substr('''+duyymm+''',1,4)||''03'' then 6                         ');
    sql.add('            when SUBSTR(EMPDATE,1,6) <=substr('''+duyymm+''',1,4)||''06'' then 4                         ');
    sql.add('            when SUBSTR(EMPDATE,1,6) <=substr('''+duyymm+''',1,4)||''09'' then 3                         ');
    sql.add('            else 0 end special_cnt,                                                                      ');
    sql.add('       hper.DUTYUTIL.GET_DUTY_CNT_EXCEPT_MONTH(a.EMPNO ,'''+duyymm+''' ,''2'') except_special_CNT, ');
    SQL.Add('       case when '''+v_startdate+''' ='''' then 0 ');
    SQL.Add('            else hper.DUTYUTIL.GET_DUTY_CNT(a.EMPNO,'''+v_startdate+''','''+v_enddate+''',''4'','''+SPECIAL+''')');
    SQL.Add('           end cur_USED_YEARLY_CNT,                                                                           ');
    sql.add('       0,0,0                                                                                             ');
    sql.add('from PIMPMAS A,  PKHDUSPECIAL B                                                                          ');
    sql.add('where substr('''+duyymm+''',1,4) = B.YEARLY_YY(+)                                                        ');
    sql.add('  and '''+SPECIAL+''' = B.DUKIND(+)                                                                      ');
    sql.add('  and A.EMPNO = B.EMPNO(+)                                                                               ');
    sql.add('  and a.empno = '''+empno+'''                                                                            ');

    //memo1.text := sql.text;

    Open;

    if(RecordCount > 0) then
    begin
      GS_special_cnt          := FieldByName('field1').AsFloat;
      GS_except_special_cnt   := FieldByName('field2').AsFloat;
      GS_cur_used_special_cnt := FieldByName('field3').AsFloat;
    end
    else
    begin
      GS_special_cnt          := 0;
      GS_except_special_cnt   := 0;
      GS_cur_used_special_cnt := 0;
    end;

  end;

  FL_k            := 1;
  GS_cur_yearly_cnt  := 0;
  GS_cur_special_cnt := 0;

  for FL_i := 1 to 42 do
  begin
    FL_Comp := nil;
    FL_Comp := TOnShapeLabel(Self.FindComponent('ED_d'+IntToStr(FL_i)));
    if FL_Comp <> nil then
    begin
      if FL_Comp.Visible then
      begin
        if FL_Comp.Hint = HOLIYEAR then
        begin
          GS_cur_yearly_cnt := GS_cur_yearly_cnt + 1;
        end
        else if FL_Comp.Hint = YEARHALF then
        begin
          GS_cur_yearly_cnt := GS_cur_yearly_cnt + 0.5;
        end
        else if FL_Comp.Hint = SPECIAL then
        begin
          GS_cur_special_cnt := GS_cur_special_cnt + 1;
        end;
      end;
    end;
  end;

  //2017.03.13.hjku.. 해당년도 사용연차가 없을 경우 '0'으로 표기.. 김진호M 요청
  if(GS_yearly_cnt < 0) then
  begin
       year1.text :=  '0';
       GS_yearly_cnt := 0;
  end
  else year1.text :=  FloatToStr(GS_yearly_cnt);

  year2.text :=  FloatToStr(GS_yearlyplan_cnt);
  //year3.text :=  FloatToStr(GS_except_yearly_cnt  + GS_cur_yearly_cnt);     //1년단위 등록갯수총합(화면포함)
  year3.text :=  FloatToStr(GS_cur_used_yearly_cnt); //현재일까지 저장된 갯수


  special1.text :=  FloatToStr(GS_special_cnt);
  //special3.text :=  FloatToStr(GS_except_special_cnt + GS_cur_special_cnt); //1년단위 등록갯수총합(화면포함)
  special3.text :=  FloatToStr(GS_cur_used_special_cnt); //현재일까지 저장된 갯수

  //2017.01.13.hjku.. 2017년 연차 표현방식 변경... 김진호M요청

  //2017.03.13.hjku.. 해당년도 사용연차가 없을 경우 '0'으로 표기.. 김진호M 요청
  //year2017_1.text :=  FloatToStr(GS_yearly_cnt);
  if(GS_yearly_cnt < 0) then
       year2017_1.text :=  '0'
  else year2017_1.text :=  FloatToStr(GS_yearly_cnt);

  year2017_2.text :=  FloatToStr(GS_yearlyplan_cnt);
  year2017_3.text :=  FloatToStr(GS_cur_used_yearly_cnt); //현재일까지 저장된 갯수

  year2017_4.text :=  FloatToStr(GS_tot_yearly_cnt); //당해년도 발생연차
  year2017_5.text :=  FloatToStr(GS_pre_used_cnt);   //전년도 사용연차

  special2007_1.text :=  FloatToStr(GS_special_cnt);
  special2007_3.text :=  FloatToStr(GS_cur_used_special_cnt); //현재일까지 저장된 갯수

end;


function TFM_Main.PL_Chk_yearly_cnt(p_code : String) : Boolean;
var
  temp_year_cnt : Double;
begin
  Result := true;

  //2016.09.23.hjku.. 기등록한 연차 삭제시 사용목표 등 체크하여 제어
  temp_year_cnt := 0.0;

  if not(((OldHint = HOLIYEAR)or(OldHint = YEARHALF)) or ((p_code = HOLIYEAR)or(p_code = YEARHALF)) or (p_code=''))
  then system.exit;

  if(OldHint = HOLIYEAR) then
  begin
          if(p_code = HOLIYEAR) then temp_year_cnt := 0
     else if(p_code = YEARHALF) then temp_year_cnt := -0.5
     else                            temp_year_cnt := -1;
  end
  else if(OldHint = YEARHALF) then
  begin
          if(p_code = HOLIYEAR) then temp_year_cnt := 0.5
     else if(p_code = YEARHALF) then temp_year_cnt := 0
     else                            temp_year_cnt := -0.5;
  end
  else
  begin
          if(p_code = HOLIYEAR) then temp_year_cnt := 1
     else if(p_code = YEARHALF) then temp_year_cnt := 0.5
     else                            temp_year_cnt := 0;
  end;

  get_dayoff_list(FG_yy+FG_Month, ED_empno.empno);

  temp_year_cnt := GS_except_yearly_cnt + GS_cur_yearly_cnt + temp_year_cnt;

  {//2016.09.29.hjku.. 특정 관리자는 한도 체크하지 않음
  if (Copy(FG_empno,1,1) = 'D') or (FG_empno = '2684') or (FG_empno = '1884') then
  begin
    system.exit;
  end;
  }
  if(GS_yearly_cnt <= 0)and(temp_year_cnt>0) then //연차갯수 초과 등록한 경우
  begin
    //2017.03.03.hjku.. 메시지 문구 수정.. 김진호M 요청
    //MessageDlg('연차 총 사용가능 개수 등록이 안되어 있습니다. 담당자에게 문의 하시기 바랍니다.', mtInformation, [mbOK], 0);
    MessageDlg('올해 사용 가능한 연차가 없습니다. 담당자에게 문의하시기 바랍니다.', mtInformation, [mbOK], 0);
    Result := false;
    System.Exit;
  end;

  if(GS_yearly_cnt < temp_year_cnt) then //연차갯수 초과 등록한 경우
  begin
    MessageDlg('연차(반연차)는 총 사용가능 개수 '+floatToStr(GS_yearly_cnt)+'일을 초과 할수 없습니다...', mtInformation, [mbOK], 0);
    Result := false;
    System.Exit;
  end;

  if not((Copy(FG_grade,3,1) <= 'C') or (copy(FG_empno,1,1)='D')) then
  begin
    if (Copy(ED_empno.empno,1,1) <> 'Y') and ((OldHint = HOLIYEAR)or(OldHint = YEARHALF)) then
    begin

      if(GS_used_yearly_cnt >= GS_yearlyplan_cnt) then //연차목표이상 등록한 경우
      begin
        if GS_yearlyplan_cnt > temp_year_cnt then
        begin
          MessageDlg('연차(반연차)는 연간 사용목표 '+floatToStr(GS_yearlyplan_cnt)+'일보다 많아야 합니다...', mtInformation, [mbOK], 0);
          Result := false;
          System.Exit;
        end;
      end
      else
      begin
        if GS_used_yearly_cnt > temp_year_cnt then   //연차사용촉진 미등록한 경우
        begin
          MessageDlg('연차(반연차)는 기등록연차 '+floatToStr(GS_used_yearly_cnt)+'일보다 많아야 합니다...', mtInformation, [mbOK], 0);
          Result := false;
          System.Exit;
        end;
      end;
    end;
  end;
end;

function TFM_Main.PL_code_check(p_oldcode : String) : Boolean;
var
  i : integer;
begin
  Result := true;

  if(p_oldcode='') then system.exit;

  //2016.09.26.hjku.. 사용자/관리자 입력가능한 값만 체크하도록 수정
  for i := 1 to codeidx do
    if(codefile[i].codeno = p_oldcode) then break;

  if(i>codeidx) then
  begin
    Result := false;
  end;
end;


procedure TFM_Main.bt_moveClick(Sender: TObject);
begin
  Try
    FM_yearly_move := TFM_yearly_move.Create(Self);
    FM_yearly_move.ShowModal;
  Finally
    FM_yearly_move.Free;
  End;
end;

procedure TFM_Main.Bt_MenualClick(Sender: TObject);
var ObjName, FL_Prog : String;
begin
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;
  FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','휴가계획 등록시스템 매뉴얼_V1.0.PDF','휴가계획등록',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
end;

initialization
  begin
    CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'PKA4057A.exe');
    
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('다른 [연차휴가사용촉진],[휴가계획 등록]을 종료하신후 하나의 프로그램만 실행해 주시기 바랍니다.');
      halt;
    end;
  end;
end.

