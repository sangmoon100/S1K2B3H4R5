{===================== Program Header ==========================================
 PROGRAM-NAME      : PIU3020A(이동희망부서 등록)
 SYSTEM-NAME       : 인사
 SUBSYSTEM-NAME    : 사내교류
 Programmer        : 이희용
 Version           : 1.0
 Date              : 2012.12.13

Update Contents
 Version  date(yy.mm.dd)  programmer  description                relevant doc.no
 1.0      2012.12.13      이희용      권역별 희망지역으로 변경

================================================================================}
unit PIU30201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, StdCtrls, OnShapeLabel, On_DeptEdit, OnEditMemo,
  OnEditCombo, ComCtrls, OnFocusButton, Tmax_session, OnInsaCommon,On_pmjobduty,
  Db,  Mask, Buttons, Calen1, TmaxFunc, OnPopupEdit,
  OnLineLabel, Tmax_DataSetText,PDownLoad, func;

type
  TMainForm = class(TForm)
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    Shape5: TShape;
    Label5: TLabel;
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Shape4: TShape;
    Shape1: TShape;
    Shape3: TShape;
    L_paycl: TOnShapeLabel;
    L_payra: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    L_status: TOnShapeLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Bt_save: TOnFocusButton;
    Bt_Del: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Bt_cancel: TOnFocusButton;
    Bt_App: TOnFocusButton;
    Bt_print: TOnFocusButton;
    CB_Year: TOnComboEdit;
    M_Hopesayu1: TOnMemo;
    MEcertprdate1: TOnMaskEdit;
    M_Hopesayu3: TOnMemo;
    M_Hopesayu2: TOnMemo;
    MEcertprdate2: TOnMaskEdit;
    MEcertprdate3: TOnMaskEdit;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    Ed_movegubun1: TOnComboEdit;
    Ed_movegubun2: TOnComboEdit;
    Ed_movegubun3: TOnComboEdit;
    E_deptgubun: TOnComboEdit;
    E_jobduty: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    Ed_empno: TOnWinPopupEdit;
    L_orgnum: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel5: TOnSectionLabel;
    pe_dept1: TOnWinPopupEdit;
    pe_dept2: TOnWinPopupEdit;
    pe_dept3: TOnWinPopupEdit;
    L_WORKYYCNT: TOnShapeLabel;
    Bt_search_RR: TOnFocusButton;
    L_Conyn: TOnShapeLabel;
    QR_com: TTMaxDataSet;
    pe_JOBPLACE1: TOnWinPopupEdit;
    pe_JOBPLACE2: TOnWinPopupEdit;
    pe_JOBPLACE3: TOnWinPopupEdit;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_cancelClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure Bt_saveClick(Sender: TObject);
    procedure ED_empReadEnded(Sender: TObject);
    procedure Bt_AppClick(Sender: TObject);
    procedure Bt_printClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M_Hopesayu1Exit(Sender: TObject);
    procedure ED_dept1InitPopup(Sender: TObject);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_HopedeptGb2Exit(Sender: TObject);
    procedure Ed_HopedeptGb1Exit(Sender: TObject);
    procedure Ed_HopedeptGb3Exit(Sender: TObject);
    procedure E_deptgubunExit(Sender: TObject);
    procedure ED_Hopeduty1InitPopup(Sender: TObject);
    procedure ED_Hopeduty1CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_dept1Change(Sender: TObject);
    procedure pe_dept1InitPopup(Sender: TObject);
    procedure pe_dept1CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Bt_search_RRClick(Sender: TObject);
    procedure pe_JOBPLACE1InitPopup(Sender: TObject);
    procedure pe_JOBPLACE1CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
    procedure Csel_Open;

  public
    { Public declarations }
    GSEmpno     : String;
    GSEempno    : String;    
    AEmpno      : String;
    GSKorname   : String;
    GSGrade     : String;
    GSSectCode  : String;
    GSDeptCode  : String;
    GSMGubun    : String;
    GSAllYN     : String;
    SqlStr      : String;

    GSsayu1     : String;
    GSsayu2     : String;
    GSsayu3     : String;
    GSsayu4     : String;
    GSsayu5     : String;
{deleted by hjku
    GSspedesc1  : String;
    GSspedesc2  : String;
    GSspedesc3  : String;
    GSspedesc4  : String;
    GSspedesc5  : String;
}
    gs_Year     : String;
    vOrgnum     : String;

    Csel_SQL   : String;
    Csel_ret   : Boolean;
    All_Flag   : Boolean;

    GSJobDept  : String;

    workemp1, workemp2, workemp3, workemp4, workemp5 : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure CompInit;
    procedure Retrieve;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    function  RemoveSpecialChar(sSrc: string): string;
  end;

var
  MainForm: TMainForm;


implementation

uses  PIU30203, PIU30205, PIU30206, UEmpForm, UHelp, PIU30207, PIU30208;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

  if Trim(Hinsa_Param(cmdLine,1)) = '' then
  begin
    MessageDlg('종합인사 메뉴 프로그램을 실행하세요.', mtError , [mbOk],0);
    Bt_closeClick(Self);
    Exit;
  end;
  //for test by hjku...
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;    

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vOrgnum           := FM_Tmax.GetData('orgnum','','');

  AEmpno           := HInsa_Param(cmdline,1);
  GSEmpno          := HInsa_Param(cmdline,1);
  GSKorname        := HInsa_Param(cmdline,2);
  GSGrade          := HInsa_Param(cmdline,4);
end;


procedure TMainForm.FormShow(Sender: TObject);
var
  ParamVariant: String;
begin
  ED_empno.Text      := GSEmpno;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('select distinct RABASYY   field1 ,          ');
    Sql.Add('       to_char(sysdate,''YYYY'') field2  ,  ');
    Sql.Add('       ''field3'', ''field4'', ''field5''   ');
    Sql.Add('  from PMOVEMAS                             ');
    Sql.Add(' order by 1  desc                           ');

    ClearFieldInfo;
    AddField('field1'    , ftString,  100);
    AddField('field2'    , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    CB_Year.Text := FieldByName('field1').AsString;
    gs_Year      := CB_Year.Text;
  end;

  // 평가 담당자를 불러온다.
  ParamVariant  := 'select Value1|| '';'' ||Value2|| '';'' ||     '+
                   '       Value3|| '';'' ||Value4|| '';'' ||     '+
                   '       Value5                                 '+
                   '  FROM pishrvari                              '+
                   ' where gubun     = ''00''                     '+
                   '   and sgubun    = ''0001''                   ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  workemp1   := Csel_gfd(1);
  workemp2   := Csel_gfd(2);
  workemp3   := Csel_gfd(3);
  workemp4   := Csel_gfd(4);
  workemp5   := Csel_gfd(5);

  if (GsEmpno = Workemp1) or (GsEmpno = Workemp2) or (GsEmpno = Workemp3) or
     (GsEmpno = Workemp4) or (GsEmpno = Workemp5) or (copy(GsEmpno,1,1) = 'D') then
  begin
    ED_empno.ButtonWidth := 24;
    ED_empno.Enabled     := True;
    All_Flag             := true;
  end
  else
  begin
    ED_empno.ButtonWidth := 0;
    ED_empno.Enabled     := False;
    All_Flag             := false;
  end;

  if(copy(GsEmpno,1,1) <> 'D') then Retrieve;
end;

procedure TMainForm.Csel_Open;
begin
  Csel_ret := False;
  
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'SHR0SSEL';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 5000);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
    if  RecordCount > 0 then     Csel_ret := True;
  end;
end;

function TMainForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if  not(v_tmp > 0) then     Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if  v_tmp < 0 then     v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TMainForm.Bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Retrieve;
var  ParamVariant : String;
begin
  CompInit;
  ParamVariant  := format('SELECT nvl(  a.korname  ,'' '') || '';'' ||                                                   '+ #13#10 +
                   '       nvl(  a.paycl    ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) || '';'' ||       '+ #13#10 +
                   '       nvl(  a.payra    ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) || '';'' ||       '+ #13#10 +
                   '       nvl(  a.orgnum   ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       nvl(  a.deptcode ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select deptname  from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) || '';'' || '+ #13#10 +
                   '       (select deptgubun from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) || '';'' || '+ #13#10 +
                   '       (select codename from pyccode where codeid =''I804'' and codeno =                             '+ #13#10 +
                   '               (select deptgubun from pycdept where orgnum = a.orgnum and deptcode = a.deptcode))|| '';'' ||'+ #13#10 +
                   '       (select jobduty from pmpathdet where empno = a.empno and nowpath =1) || '';'' ||              '+ #13#10 +
	           '       (select jobdutyname from pmjobduty where useyn = ''Y'' and jobduty =                          '+ #13#10 +
                   '               (select jobduty from pmpathdet where empno = a.empno and nowpath =1)) || '';'' ||     '+ #13#10 +
                   '       (select sectcode from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) || '';'' ||  '+ #13#10 +
                   '       WORKYYCNT      || '';'' ||                                                                    '+ #13#10 +
                   '       NVL( TRANSLATE(Workyycnt,''0123456789''||Workyycnt,''0123456789'') ,0)  || '';'' ||           '+ #13#10 +
                   '	   decode(upper(b.CONYN),''A'',''자동승인'',''Y'',''승인'',''R'',''반려'',''N'','' '','' '')  || '';'' ||   ' + #13#10 +
                   '	   (select eempno from pimeemp where a.empno = empno)  || '';'' ||                               '+ #13#10 +
                   //2016.11.07.hjku.. 이동제도 개편에 따른 수정.. 이명노M 요청
                   //'	  nvl(decode(mgubun,''C'',decode(moveyn,''Y'',''C'',''N'',''G'',''Z''),mgubun),''Z'')  || '';'' ||                               '+ #13#10 +
                   '	  nvl(allyn,''N'')  || '';'' ||                               '+ #13#10 +
                   //2015.12.08.hjku.. 'A0005','A0007','A0009' 소속은 메일 발송 하지 않음. 김현순M 요청
                   '	  a.jobdept   SEL_DATA                ' + #13#10 +
                   '  FROM pimpmas a , pmovemas b ' + #13#10 +
                   ' WHERE a.empno = b.empno ' + #13#10 +
                   '     and b.RABASYY = ''%s'' ' + #13#10 +
                   '     and NVL(b.ALLYN,''N'') = ''Y'' ' + #13#10 +                   
                   '     and a.empno = ''%s'' ' ,[gs_Year,ED_empno.Text]);

  Csel_SQL      := ParamVariant;
  //memo1.text := ParamVariant;
  Csel_Open;

  //2014.10,23.hjku. 등록되어 있지 않은 대상자 프로그램 종료 추가.. 이명노M 요청..
  if not Csel_ret then
  begin
    if not(All_Flag) then   
    begin
      MessageDlg((Ed_empno.Text) +'님은 '+
                 CB_Year.Text+ '년도 전사이동 희망부서 등록 대상자가 아닙니다.'+#13+#13+
                 '프로그램을 종료합니다.', MtWarning, [mbok], 0);
      Application.Terminate;
      exit;
    end
    else
    begin
      MessageDlg((Ed_empno.Text) +'님은 '+
                 CB_Year.Text+ '년도 전사이동 희망부서 등록 대상자가 아닙니다.', MtWarning, [mbok], 0);
      exit;
    end;
  end;  

  L_korname.ValueCaption     := Csel_gfd(1);
  L_paycl.Hint               := Csel_gfd(2);
  L_paycl.ValueCaption       := Csel_gfd(3);
  L_payra.Hint               := Csel_gfd(4);
  L_payra.ValueCaption       := Csel_gfd(5);
  //2016.11.16.hjku.. pmovemas에서 읽어온 값으로 할당하도록 삭제.. 아래 있음
  //L_Orgnum.Hint              := Csel_gfd(6);
  //L_dept.Hint                := Csel_gfd(7);
  //L_dept.ValueCaption        := Csel_gfd(8);
  //2014.10.13.hjku. 이동년차 추가... 이명노M 요청
  L_WORKYYCNT.ValueCaption       := Csel_gfd(14);

  if(Csel_gfd(14)<>'')and(strtoint(Csel_gfd(15))=0) then
       L_WORKYYCNT.ValueCaption := Csel_gfd(14)
  else L_WORKYYCNT.ValueCaption := Csel_gfd(15)+'년';

  L_Conyn.ValueCaption := Csel_gfd(16);
  GSeempno := Csel_gfd(17);
  //GSMGubun  := Csel_gfd(18);
  GSAllYN  := Csel_gfd(18);

  //2015.12.08.hjku..  'A0005','A0007','A0009'는 결재 메일 발송하지 않음.   김현순M
  GSJobDept := Csel_gfd(19);

  if (Csel_gfd(9) <> '') And (Csel_gfd(9) <> '0') then
  begin
     E_deptgubun.Enabled     := false;
     E_deptgubun.Hint        := Csel_gfd(9);
     E_deptgubun.Text        := Csel_gfd(10);
  end
  else
  begin
     E_deptgubun.Enabled     := true;
  end;

  E_jobduty.Text        := Csel_gfd(11);

  if (Csel_gfd(11) <> '')  then
  begin
     E_jobduty.Hint        := Csel_gfd(11);
     E_jobduty.Text        := Csel_gfd(12);
//     E_jobduty.ButtonWidth := 0;
//     E_jobduty.ReadOnly    := True;
  end
  else
  begin
//     E_jobduty.ButtonWidth := 20;
//     E_jobduty.ReadOnly    := False;
  end;

  GSSectCode := Csel_gfd(13);
  GSDeptCode := Csel_gfd(7);

  {//2014.10.13.hjku. 이동신청 대상자가 아닌 경우 프로그램 종료 추가... 이명노M 요청
  if (not(GSMGubun[1] in ['A','C','D','F']))and(not All_Flag) then
  begin
      MessageDlg('이동희망부서 등록 대상이 아닙니다.'+#13#10+
                 '프로그램을 종료합니다.',mtInformation, [mbOk],0);
      Application.Terminate;
      exit;
  end;
  }

  SqlStr := 'SELECT EMPNO   , KORNAME  , PAYCL   , PAYRA   , ORGNUM  , DEPTCODE ,                             ' +
            '	   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) deptname, ' +
            '	   JOBDUTY,                                                                                   ' +
            '	   Case When (select count(*) from pmjobduty where jobduty    = a.jobduty and useyn = ''Y'') = 0  Then ' +
            '	             (select JOBDUTYname from pmjobduty where jobduty = a.jobduty and useyn = ''N'')  ' +
            '	   Else      (select JOBDUTYname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'') end jobdutyname, ' +
//          '	   (select JOBDUTYname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'') jobdutyname, ' +
            '	   deptgubun,                                                                                 ' +
            '	   (select codename from pyccode where codeid = ''I804'' and codeno = a.deptgubun) deptgb,    ' +
            '	   STATUS  , TRIM(GUBUN) GUBUN,  LONGDESC,                                                    ' +
            '      HopeDEPT1, HOPEDEPTGB1,                                                                    ' +
            '	   (select DEPTNAME from PMOVEDEPT where a.rabasyy= rabasyy and gubun=''A'' and a.orgnum = orgnum and deptcode = a.HopeDEPT1) dept1,   ' +
            '	   (select codename from pyccode where codeid = ''I804'' and codeno = a.Hopedeptgb1) deptgb1, ' +
            //'	   MOVEGUBUN1, HOPEYYMM1, HopeSAYU1, SPEDESC1, hopejobplace1,                                     ' +
            //'      (Select MAX(JOBNAME) from PHPCODEB where JOBCODE = a.hopejobplace1) hopejobplacename1, ' +
            '	   MOVEGUBUN1, HOPEYYMM1, HopeSAYU1, SPEDESC1, HOPEJOBPLACE1,                                     ' +
            '	   (select codename from pyccode where codeid = ''I160'' and codeno = a.HOPEJOBPLACE1) JOBPLACEname1, ' +
            '      HopeDEPT2, HOPEDEPTGB2,                                                                    ' +
            '	   (select DEPTNAME from PMOVEDEPT where a.rabasyy= rabasyy and gubun=''A'' and a.orgnum = orgnum and deptcode = a.HopeDEPT2) dept2,   ' +
            '	   (select codename from pyccode where codeid = ''I804'' and codeno = a.Hopedeptgb2) deptgb2, ' +
            //'	   MOVEGUBUN2, HOPEYYMM2, HopeSAYU2, SPEDESC2, hopejobplace2,                                     ' +
            //'      (Select MAX(JOBNAME) from PHPCODEB where JOBCODE = a.hopejobplace2) hopejobplacename2, ' +
            '	   MOVEGUBUN2, HOPEYYMM2, HopeSAYU2, SPEDESC2, HOPEJOBPLACE2,                                     ' +
            '	   (select codename from pyccode where codeid = ''I160'' and codeno = a.HOPEJOBPLACE2) JOBPLACEname2, ' +
            '      HopeDEPT3, HOPEDEPTGB3,                                                                    ' +
            '	   (select DEPTNAME from PMOVEDEPT where a.rabasyy= rabasyy and gubun=''A'' and a.orgnum = orgnum and deptcode = a.HopeDEPT3) dept3,   ' +
            '	   (select codename from pyccode where codeid = ''I804'' and codeno = a.Hopedeptgb3) deptgb3, ' +
            //'	   MOVEGUBUN3, HOPEYYMM3, HopeSAYU3, SPEDESC3, hopejobplace3,                                     ' +
            //'      (Select MAX(JOBNAME) from PHPCODEB where JOBCODE = a.hopejobplace3) hopejobplacename3 ' +
            '	   MOVEGUBUN3, HOPEYYMM3, HopeSAYU3, SPEDESC3, HOPEJOBPLACE3,                                     ' +
            '	   (select codename from pyccode where codeid = ''I160'' and codeno = a.HOPEJOBPLACE3) JOBPLACEname3 ' +
            '  FROM pmovemas  a                                                                               ' +
            ' WHERE rabasyy = '''+gs_Year+'''                                                                 ' +
            '   and nvl(allyn,''N'') = ''Y''                                                                 ' +            
            '   AND EMPNO   = '''+ED_empno.Text+'''                                                           ' ;

  with TDS1 do
  begin
    ServiceName := 'PZK1030A_sel8';
    Close;
    Sql.Clear;
    Sql.Add(SqlStr);

    ClearFieldInfo;
    AddField('EMPNO'      , ftString,    4);
    AddField('KORNAME'    , ftString,   12);
    AddField('PAYCL'      , ftString,    3);
    AddField('PAYRA'      , ftString,    3);
    AddField('ORGNUM'     , ftString,    3);
    AddField('DEPTCODE'   , ftString,    5);
    AddField('DEPTNAME'   , ftString,   60);
    AddField('JOBDUTY'    , ftString,    8);
    AddField('JOBDUTYNAME', ftString,   20);
    AddField('DEPTGUBUN'  , ftString,    1);
    AddField('DEPTGB'     , ftString,   20);
    AddField('STATUS'     , ftString,    1);
    AddField('GUBUN'      , ftString,   30);
    AddField('LONGDESC'   , ftString,  600);
    AddField('HOPEDEPT1'  , ftString,    8);
    AddField('HOPEDEPTGB1', ftString,    1);
    AddField('DEPT1'      , ftString,   30);
    AddField('DEPTGB1'    , ftString,   20);
    AddField('MOVEGUBUN1' , ftString,   20);
    AddField('HOPEYYMM1'  , ftString,   20);
    AddField('HOPESAYU1'  , ftString, 1000);
    AddField('SPEDESC1'   , ftString, 1000);
    AddField('HOPEJOBPLACE1'  , ftString,    8);
    AddField('HOPEJOBPLACEname1'      , ftString,   30);
    AddField('HOPEDEPT2'  , ftString,    8);
    AddField('HOPEDEPTGB2', ftString,    1);
    AddField('DEPT2'      , ftString,   30);
    AddField('DEPTGB2'    , ftString,   20);
    AddField('MOVEGUBUN2' , ftString,   20);
    AddField('HOPEYYMM2'  , ftString,   20);
    AddField('HOPESAYU2'  , ftString, 1000);
    AddField('SPEDESC2'   , ftString, 1000);
    AddField('HOPEJOBPLACE2'  , ftString,    8);
    AddField('HOPEJOBPLACEname2'      , ftString,   30);
    AddField('HOPEDEPT3'  , ftString,    8);
    AddField('HOPEDEPTGB3', ftString,    1);
    AddField('DEPT3'      , ftString,   30);
    AddField('DEPTGB3'    , ftString,   20);
    AddField('MOVEGUBUN3' , ftString,   20);
    AddField('HOPEYYMM3'  , ftString,   20);
    AddField('HOPESAYU3'  , ftString, 1000);
    AddField('SPEDESC3'   , ftString, 1000);
    AddField('HOPEJOBPLACE3'  , ftString,    8);
    AddField('HOPEJOBPLACEname3'      , ftString,   30);

    Open;

    if (copy(GsEmpno,1,1) <> 'D') and (RecordCount < 1) then
    begin
        MessageDlg('전사이동 희망부서 등록 권한이 없습니다.',mtError, [mbOk],0);
        MainForm.Close;
    end;

   // showmessage(inttostr(recordcount));

    //신청상태
    if FieldByName('STATUS').AsString = '2' then
    begin
      PE_dept1.Enabled     := false;
      PE_dept2.Enabled     := false;
      PE_dept3.Enabled     := false;

      pe_JOBPLACE1.Enabled := false;
      pe_JOBPLACE2.Enabled := false;
      pe_JOBPLACE3.Enabled := false;

      MEcertprdate1.Enabled:= false;
      MEcertprdate2.Enabled:= false;
      MEcertprdate3.Enabled:= false;

      {SpeedButton1.Enabled := false;
      SpeedButton2.Enabled := false;
      SpeedButton3.Enabled := false;
       }
      M_Hopesayu1.ReadOnly := true;
      M_Hopesayu2.ReadOnly := true;
      M_Hopesayu3.ReadOnly := true;

      Bt_save.Enabled      := False;
      //Bt_App.Enabled       := False;
      Bt_Del.Enabled       := False;
      Bt_cancel.Enabled    := False;

      Ed_movegubun1.ButtonWidth := 0;
      Ed_movegubun1.ReadOnly    := true;
      Ed_movegubun2.ButtonWidth := 0;
      Ed_movegubun2.ReadOnly    := true;
      Ed_movegubun3.ButtonWidth := 0;
      Ed_movegubun3.ReadOnly    := true;
    end
    else //임시저장상태
    begin
      PE_dept1.Enabled     := True;
      PE_dept2.Enabled     := True;
      PE_dept3.Enabled     := True;

      pe_JOBPLACE1.Enabled := True;
      pe_JOBPLACE2.Enabled := True;
      pe_JOBPLACE3.Enabled := True;


      MEcertprdate1.Enabled:= True;
      MEcertprdate2.Enabled:= True;
      MEcertprdate3.Enabled:= True;

//      SpeedButton1.Enabled := True;
//      SpeedButton2.Enabled := True;
//      SpeedButton3.Enabled := True;

      M_Hopesayu1.ReadOnly := False;
      M_Hopesayu2.ReadOnly := False;
      M_Hopesayu3.ReadOnly := False;

      Bt_save.Enabled      := True;
      //Bt_App.Enabled       := True;
      Bt_Del.Enabled       := True;
      Bt_cancel.Enabled    := True;
      Ed_movegubun1.ButtonWidth := 16;
      Ed_movegubun1.ReadOnly    := False;
      Ed_movegubun2.ButtonWidth := 16;
      Ed_movegubun2.ReadOnly    := False;
      Ed_movegubun3.ButtonWidth := 16;
      Ed_movegubun3.ReadOnly    := False;
    end;

    if TDS1.Eof then
    begin
      CompInit;
      Exit;
    end;

    L_Orgnum.Hint       := TDS1.FieldByName('ORGNUM').AsString;
    L_dept.Hint         := TDS1.FieldByName('DEPTCODE').AsString;
    L_dept.ValueCaption := L_dept.Hint + '-' + TDS1.FieldByName('DEPTNAME').AsString;

    if      TDS1.FieldByName('STATUS').AsString = '1' then L_status.ValueCaption := '저장'
    else if TDS1.FieldByName('STATUS').AsString = '2' then L_status.ValueCaption := '등록'
    else                                              L_status.ValueCaption := '';

    L_korname.ValueCaption :=  TDS1.FieldByName('korname').AsString;
    if (TDS1.FieldByName('deptgubun').AsString <> '') And (TDS1.FieldByName('deptgubun').AsString <> '0') then
    begin
      E_deptgubun.Enabled     := false;
      E_deptgubun.Hint        := TDS1.FieldByName('deptgubun').AsString;
      E_deptgubun.Text        := TDS1.FieldByName('deptgb').AsString;
    end
    else
    begin
      E_deptgubun.Enabled     := true;
      E_deptgubun.Hint        := '';
      E_deptgubun.Text        := '';
    end;

    if (TDS1.FieldByName('JOBDUTY').AsString <> '')  then
    begin
//      E_jobduty.Hint        := TDS1.FieldByName('JOBDUTY').AsString;
//      E_jobduty.Text        := TDS1.FieldByName('JOBDUTYNAME').AsString;
      E_jobduty.ButtonWidth := 0;
      E_jobduty.ReadOnly    := True;
    end
    else
    begin
      E_jobduty.Hint        := '';
      E_jobduty.Text        := '';
      E_jobduty.ButtonWidth := 20;
      E_jobduty.ReadOnly    := False;
    end;

//      M_long.Text := FieldByName('LONGDESC').AsString;;
//      GUBUN 종류******************
//      5년 이상 장기근무
//      3년∼5년 근무자
//      3년 미만(승격자격 취득희망)
//      무연고 지역 2년 이상 근무
//      기타 사유자
//      본사/수도권 ↔ 지방 (2007년부터 적용)
{
    if      FieldByName('GUBUN').AsString ='5년 이상 장기근무'           then RB_5.Checked := True
    else if FieldByName('GUBUN').AsString ='3년∼5년 근무자'             then RB_3.Checked := True
    else if FieldByName('GUBUN').AsString ='3년 미만(승격자격 취득희망)' then RB_2.Checked := True
    else if FieldByName('GUBUN').AsString ='무연고 지역 2년 이상 근무'   then RB_A.Checked := True
    else if FieldByName('GUBUN').AsString ='기타 사유자'                 then RB_E.Checked := True
    else if FieldByName('GUBUN').AsString ='본사/수도권 ↔ 지방'         then RB_T.Checked := True;
}
    PE_dept1.hint       := TDS1.FieldByName('HopeDEPT1').AsString;
    PE_dept1.text       := TDS1.FieldByName('DEPT1').AsString;
{    if FieldByName('HOPEDEPTGB1').AsString <> '' then
    begin
      If (TDS1.FieldByName('HOPEDEPTGB1').AsString = '1') Then
        Ed_HopedeptGb1.Text := '1.Staff 부서'
      Else Ed_HopedeptGb1.Text := '2.Line 부서';
      Ed_HopedeptGb1.Enabled   := false;
    end;
}
    MEcertprdate1.Text  := TDS1.FieldByName('HOPEYYMM1').AsString;
    pe_JOBPLACE1.hint   := TDS1.FieldByName('hopejobplace1').AsString;
    pe_JOBPLACE1.Text   := TDS1.FieldByName('hopejobplacename1').AsString;
    ED_movegubun1.Text  := TDS1.FieldByName('MOVEGUBUN1').AsString;

    PE_dept2.hint       := TDS1.FieldByName('HopeDEPT2').AsString;
    PE_dept2.text       := TDS1.FieldByName('DEPT2').AsString;
{
    if FieldByName('HOPEDEPTGB2').AsString <> '' then
    begin
      If (TDS1.FieldByName('HOPEDEPTGB2').AsString = '1') Then
        Ed_HopedeptGb2.Text := '1.Staff 부서'
      Else Ed_HopedeptGb2.Text := '2.Line 부서';
      Ed_HopedeptGb2.Enabled   := false;
    end;
}
    MEcertprdate2.Text  := TDS1.FieldByName('HOPEYYMM2').AsString;
    pe_JOBPLACE2.hint   := TDS1.FieldByName('hopejobplace2').AsString;
    pe_JOBPLACE2.Text   := TDS1.FieldByName('hopejobplacename2').AsString;
    ED_movegubun2.Text  := TDS1.FieldByName('MOVEGUBUN2').AsString;

    PE_dept3.hint       := TDS1.FieldByName('HopeDEPT3').AsString;
    PE_dept3.text       := TDS1.FieldByName('DEPT3').AsString;
{
    if TDS1.FieldByName('HOPEDEPTGB3').AsString <> '' then
    begin
      If (TDS1.FieldByName('HOPEDEPTGB3').AsString = '1') Then
        Ed_HopedeptGb3.Text := '1.Staff 부서'
      Else Ed_HopedeptGb3.Text := '2.Line 부서';
      Ed_HopedeptGb3.Enabled   := false;
    end;
}    
    MEcertprdate3.Text  := TDS1.FieldByName('HOPEYYMM3').AsString;
    pe_JOBPLACE3.hint   := TDS1.FieldByName('hopejobplace3').AsString;
    pe_JOBPLACE3.Text   := TDS1.FieldByName('hopejobplacename3').AsString;
    ED_movegubun3.Text  := TDS1.FieldByName('MOVEGUBUN3').AsString;

    GSsayu1     := TDS1.FieldByName('HopeSAYU1').AsString;
    GSsayu2     := TDS1.FieldByName('HopeSAYU2').AsString;
    GSsayu3     := TDS1.FieldByName('HopeSAYU3').AsString;

    M_Hopesayu1.Text := TDS1.FieldByName('HopeSAYU1').AsString;
    M_Hopesayu2.Text := TDS1.FieldByName('HopeSAYU2').AsString;
    M_Hopesayu3.Text := TDS1.FieldByName('HopeSAYU3').AsString;

  end;


end;

procedure TMainForm.CompInit;
begin
  L_status.ValueCaption    := '';
  L_WORKYYCNT.ValueCaption := '';
  L_Conyn.ValueCaption     := '';

  pe_JOBPLACE1.Text   := '';
  pe_JOBPLACE2.Text   := '';
  pe_JOBPLACE3.Text   := '';

  pe_JOBPLACE1.hint   := '';
  pe_JOBPLACE2.hint   := '';
  pe_JOBPLACE3.hint   := '';

  PE_dept1.hint   := '';
  PE_dept2.hint   := '';
  PE_dept3.hint   := '';

  PE_dept1.Text   := '';
  PE_dept2.Text   := '';
  PE_dept3.Text   := '';

//  Ed_HopedeptGb1.Text := '';
//  Ed_HopedeptGb2.Text := '';
//  Ed_HopedeptGb3.Text := '';

//  Ed_HopedeptGb1.hint := '';
//  Ed_HopedeptGb2.hint := '';
//  Ed_HopedeptGb3.hint := '';

  Ed_movegubun1.Text := '';
  Ed_movegubun2.Text := '';
  Ed_movegubun3.Text := '';

  GSDeptCode     := '';
  GSMGubun       := '';
  GSJobDept      := '';

  GSsayu1        := '';
  GSsayu2        := '';
  GSsayu3        := '';

  M_Hopesayu1.Lines.Clear;
  M_Hopesayu2.Lines.Clear;
  M_Hopesayu3.Lines.Clear;

  MEcertprdate1.Text := '';
  MEcertprdate2.Text := '';
  MEcertprdate3.Text := '';

  GSAllYN := 'N';

  Bt_save.Enabled   := True;
  //Bt_App.Enabled    := False;
  Bt_Del.Enabled    := False;
  //Bt_cancel.Enabled := True;
  Bt_Close.SetFocus;
end;

procedure TMainForm.Bt_cancelClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.Bt_DelClick(Sender: TObject);
begin
  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;
      SqlStr  := 'update pmovemas                 ' + #13#10 +
                 '   SET STATUS          = '''',  ' + #13#10 +
                 '       HopeDEPT1       = '''',  ' + #13#10 +
                 '       hopejobplace1   = '''',  ' + #13#10 +
                 '       HopeSAYU1       = '''',  ' + #13#10 +
                 '       HopeDEPT2       = '''',  ' + #13#10 +
                 '       hopejobplace2   = '''',  ' + #13#10 +
                 '       HopeSAYU2       = '''',  ' + #13#10 +
                 '       HopeDEPT3       = '''',  ' + #13#10 +
                 '       hopejobplace3   = '''',  ' + #13#10 +
                 '       HopeSAYU3       = '''',  ' + #13#10 +
                 '       WRITETIME       = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), ' + #13#10 +
                 '       WRITEMAN        = ''' + GSEmpno + '''         '+ #13#10 +
                 ' WHERE rabasyy         = ''' + gs_Year + '''         '+ #13#10 +
                 '   AND EMPNO           = ''' + ED_empno.Text + '''   ';

  with TDS_dml do
  begin
      ServiceName := 'PIT1030A_DML';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      //memo1.text := sql.text;

      if not TDS_dml.Execute then
      begin
          MessageDlg('삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
      end;
  end;

  MessageDlg('삭제되었습니다.',mtInformation, [mbOk],0);
  CompInit;
  Retrieve;
end;

procedure TMainForm.Bt_saveClick(Sender: TObject);
var
  JobMode, gubun : String;
begin
  if trim(ED_empno.Text) = '' then  System.Exit;

  GSsayu1    := RemoveSpecialChar(trim(M_Hopesayu1.Text));
  GSsayu2    := RemoveSpecialChar(trim(M_Hopesayu2.Text));
  GSsayu3    := RemoveSpecialChar(trim(M_Hopesayu3.Text));

  if (GSAllYN[1] <>'Y') then
  begin
    MessageDlg('전사이동 희망부서 등록 대상이 아닙니다.',mtInformation, [mbOk],0);
    exit;
  end;

  if (PE_dept1.Text = '') then
  begin
    MessageDlg('1지망 희망부서를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept2.Text = '') then
  begin
    MessageDlg('2지망 희망부서를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept3.Text = '') then
  begin
    MessageDlg('3지망 희망부서를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (Trim(GSsayu1) = '') then
  begin
    MessageDlg('1지망 지원 동기를 입력해 주세요', mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept2.Text <> '') and (Trim(GSsayu2) = '') then
  begin
    MessageDlg('2지망 지원 동기를 입력해 주세요.',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept3.Text <> '') and (Trim(GSsayu3) = '') then
  begin
    MessageDlg('3지망 지원 동기를 입력해 주세요.',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (Trim(GSsayu1) <> '') and (PE_dept1.Text = '') then
  begin
    MessageDlg('1지망 지원 동기가 있는데 희망부서가 없습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (Trim(GSsayu2) <> '') and (PE_dept2.Text = '') then
  begin
    MessageDlg('2지망 지원 동기가 있는데 희망부서가 없습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (Trim(GSsayu3) <> '') and (PE_dept3.Text = '') then
  begin
    MessageDlg('3지망 지원 동기가 있는데 희망부서가 없습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept1.hint = PE_dept2.hint) then
  begin
    MessageDlg('1지망 희망부서와 2지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept1.hint = PE_dept3.hint) then
  begin
    MessageDlg('1지망 희망부서와 3지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (PE_dept2.hint = PE_dept3.hint) then
  begin
    MessageDlg('2지망 희망부서와 3지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (L_dept.Hint = PE_dept1.hint) then
  begin
    MessageDlg('소속부서와 1지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (L_dept.hint = PE_dept2.hint) then
  begin
    MessageDlg('소속부서와 2지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (L_dept.hint = PE_dept3.hint) then
  begin
    MessageDlg('소속부서와 3지망 희망부서를 다르게 입력해 주세요',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (pe_dept1.Text <> '') and (pe_JOBPLACE1.Text = '') then
  begin
    MessageDlg('1지망 희망 근무지를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (pe_dept2.Text <> '') and (pe_JOBPLACE2.Text = '') then
  begin
    MessageDlg('2지망 희망 근무지를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (pe_dept3.Text <> '') and (pe_JOBPLACE3.Text = '') then
  begin
    MessageDlg('3지망 희망 근무지를 입력해 주세요..',mtInformation,[mbOk],0);
    System.Exit;
  end;

  if (copy(L_dept.Hint,1,1) = copy(PE_dept1.hint,1,1)) then
  begin
      MessageDlg('1지망 희망부서를 타 부문 소속부서로 입력해 주세요',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (copy(L_dept.Hint,1,1) = copy(PE_dept2.hint,1,1)) then
  begin
      MessageDlg('2지망 희망부서를 타 부문 소속부서로 입력해 주세요',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (copy(L_dept.Hint,1,1) = copy(PE_dept3.hint,1,1)) then
  begin
      MessageDlg('3지망 희망부서를 타 부문 소속부서로 입력해 주세요',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if MessageDlg('저장 하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then  System.Exit;

  with TDS_dml do
  begin
    ServiceName := 'PIT1030A_DML';
    Close;
    Sql.Clear;
    Sql.Add('UPDATE pmovemas                                                                     ');
    Sql.Add('   SET STATUS          = ''1'',                                                     ');
    Sql.Add('       HopeDEPT1       = ''' + PE_dept1.hint + ''',                                 ');
    Sql.Add('       hopejobplace1   = ''' + pe_JOBPLACE1.hint + ''',                             ');
    Sql.Add('       HopeSAYU1       = ''' + StringReplace(GSsayu1,'''','`',[rfReplaceAll]) + ''',');
    Sql.Add('       HopeDEPT2       = ''' + PE_dept2.hint + ''',                                 ');
    Sql.Add('       hopejobplace2   = ''' + pe_JOBPLACE2.hint + ''',                             ');
    Sql.Add('       HopeSAYU2       = ''' + StringReplace(GSsayu2,'''','`',[rfReplaceAll]) + ''',');
    Sql.Add('       HopeDEPT3       = ''' + PE_dept3.hint + ''',                                 ');
    Sql.Add('       hopejobplace3   = ''' + pe_JOBPLACE3.hint + ''',                             ');
    Sql.Add('       HopeSAYU3       = ''' + StringReplace(GSsayu3,'''','`',[rfReplaceAll]) + ''',');
    Sql.Add('       WRITETIME       = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),                     ');
    Sql.Add('       WRITEMAN        = ''' + GSEmpno + '''                                        ');
    Sql.Add(' WHERE EMPNO           = ''' + ED_empno.Text + '''                                  ');
    Sql.Add('   AND Rabasyy         = ''' + gs_Year + '''                                        ');

    if not TDS_dml.Execute then
    begin
      MessageDlg('저장에 실패했습니다.',mtError, [mbOk],0);
      System.Exit;
    end;
  end;

  MessageDlg('저장 되었습니다.',mtInformation, [mbOk],0);
  Retrieve;
end;

procedure TMainForm.ED_empReadEnded(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.Bt_AppClick(Sender: TObject);
begin
{
  //2014.10.13.hjku. 이동신청 대상자가 아닌 경우 프로그램 종료 추가... 이명노M 요청
  if not(GSMGubun[1] in ['A','C','D','F']) then
  begin
      MessageDlg('이동희망부서 등록 대상이 아닙니다.',mtInformation, [mbOk],0);
      exit;
  end;
  
  if Trim(L_status.ValueCaption) = '' then
  begin
      Messagedlg('이동희망부서 내역을 입력하고 "저장" 해 주세요.',mtError,[mbOK],0);
      System.Exit;
  end;

  if MessageDlg('"Yes"를 누르시면 등록이 완료됩니다.(수정/취소 불가)', mtConfirmation, [mbYes,mbNo],0)<> mrYes then
    System.Exit ;

    //2013.10.23.hjku. 이동구분이  필수이동 대상자(A),희망 시 이동 신청 가능자(C) 인경우 자동승인
    //2014.12.04.hjku.. 비연고지근무자('F')도 자동 승인 추가.. 이명노M 요청
  if GSMGubun[1] in ['A','C','F'] then
  begin
      SQLStr := 'UPDATE pmovemas                                          '+
                '   SET STATUS    = ''2'',                                '+
                '       APPDATE   = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),'+
                '       WRITEMAN  =  ''' + GSEmpno + ''',                 '+
                '       CONYN =''A'',                                     '+
                '       CONEMPNO  = '''+ GSEmpno + ''',                   '+
                '       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE Rabasyy   =  ''' + gs_Year + '''                  '+
                '   AND EMPNO     =  ''' + ED_empno.Text + '''            ';
  end
  else
  begin
      SQLStr := 'UPDATE pmovemas                                          '+
                '   SET STATUS    = ''2'',                                '+
                '       APPDATE   = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),'+
                '       WRITEMAN  =  ''' + GSEmpno + '''                  '+
                ' WHERE Rabasyy   =  ''' + gs_Year + '''                  '+
                '   AND EMPNO     =  ''' + ED_empno.Text + '''            ';
  end;

  with TDS_dml do
    begin
      ServiceName := 'PIT1030A_DML';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('등록작업에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end
        else
        begin
            //2015.12.08.hjku.. 'A0005','A0007','A0009' 부서는 메일 발송하지 않음. 김현순M 요청
            if not ((trim(GsJobDept) ='A0005') or (trim(GsJobDept) ='A0007') or (trim(GsJobDept) ='A0009')) then
            begin
                //2014.10.23.hjku. 자동결재 이외의 등록은 팀장님께 결재 메일 발송... 이명노M 요청
                if not (GSMGubun[1] in ['A','C','F']) then
                begin
                    SendProgID  := 'PIU3020A';
                    SendEmpno   := Ed_empno.text;
                    RcveEmpno   := GSeempno;
                    MailSubject := '이동 희망 부서 등록';
                    MailBody    := L_korname.ValueCaption + '님이 이동 희망 부서를 등록하였습니다.' + #13#18 +
                                   '종합인사정보시스템>인사>이동>이동희망부서 등록현황 조회(팀장용)에서 확인하시기 바랍니다.';

                    if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                       MessageDlg('이동 신청 등록이 성공 하였습니다...',mtInformation, [mbOk], 0)
                    else
                       MessageDlg('이동 신청 등록이 실패 하였습니다...',mtError, [mbOk], 0);
                end
                else
                begin
                    MessageDlg('등록되었습니다.', mtInformation, [mbOk],0);
                end;
            end;
        end;
    end;
    
    Retrieve;
}    
end;

procedure TMainForm.Bt_printClick(Sender: TObject);
begin
  PrintForm.QuickRep1.Preview;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  calendar := TCalendar.Create(Self);
  Try
    calendar.ShowModal;
    If calendar.DayCaption = '' then exit;
    MEcertprdate1.Text := calendar.DayCaption;
  Finally
    calendar.Free;
  end;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  calendar := TCalendar.Create(Self);
  Try
    calendar.ShowModal;
    If calendar.DayCaption = '' then exit;
    MEcertprdate2.Text := calendar.DayCaption;
  Finally
    calendar.Free;
  end;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  calendar := TCalendar.Create(Self);
  Try
    calendar.ShowModal;
    If calendar.DayCaption = '' then exit;
    MEcertprdate3.Text := calendar.DayCaption;
  Finally
    calendar.Free;
  end;
end;

procedure TMainForm.M_Hopesayu1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 12  then
  begin
    MessageDlg(intTostr(TOnMemo(Sender).Tag)+'지망 '+TOnMemo(Sender).EditLabel.Caption+' 내용은 12줄까지만 작성가능합니다.',mtError, [mbOk],0);
    TOnMemo(Sender).SetFocus;
  end;
end;

procedure TMainForm.ED_dept1InitPopup(Sender: TObject);
begin
  DeptForm.CodeSql := 'SELECT CAREAB, CNAREAB, CAREAA, CNAREAA, ''F5'' FROM PHPCODEA ';

  CodeFormA.Edit         := TOnWinPopupEdit(Sender);
  CodeFormA.CodeKind.Caption       := '[희망권역 조회]';
  TOnWinPopupEdit(Sender).PopupControl := CodeFormA;
end;

procedure TMainForm.ED_Hopeduty1InitPopup(Sender: TObject);
begin
{
  CodeFormB.CodeSql := ' SELECT JOBCODE, JOBNAME, DECODE(DEPTGUBUN, ''1'', ''1.staff 부서'', ''2.line 부서'') DEPTGUBUN, ' +
                       '        DECODE(AREACODE, ''1'', ''서울권역'', ''서울권역 외'') AREACODE, ''F5'' ' +
                       '        FROM PHPCODEB ';

  case TOnWinPopupEdit(Sender).Tag of
    1:Begin
        If ED_dept1.Hint = '11000010' Then CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''1'' '
        Else                               CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''2'' ';
      End;
    2:Begin
        If ED_dept2.Hint = '11000010' Then CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''1'' '
        Else                               CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''2'' ';
      End;
    3:Begin
        If ED_dept3.Hint = '11000010' Then CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''1'' '
        Else                               CodeFormB.CodeSql := CodeFormB.CodeSql + 'WHERE AREACODE = ''2'' ';
      End;
  End;

  CodeFormB.Edit                       := TOnWinPopupEdit(Sender);
  CodeFormB.CodeKind.Caption           := '[권역별직무 조회]';
  TOnWinPopupEdit(Sender).PopupControl := CodeFormB;
}  
end;

procedure TMainForm.ED_Hopeduty1CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
{  if CodeFormB.CodeNo <> '' then
  Begin
    case TOnWinPopupEdit(Sender).Tag of
      1:Begin
          pe_JOBPLACE1.Hint   := CodeFormB.CodeNo;
          pe_JOBPLACE1.Text   := CodeFormB.CodeName;
          //Ed_HopedeptGb1.Text := CodeFormB.BuSeoName;
        End;
      2:Begin
          pe_JOBPLACE2.Hint   := CodeFormB.CodeNo;
          pe_JOBPLACE2.Text   := CodeFormB.CodeName;
          //Ed_HopedeptGb2.Text := CodeFormB.BuSeoName;
       End;
      3:Begin
          pe_JOBPLACE3.Hint   := CodeFormB.CodeNo;
          pe_JOBPLACE3.Text   := CodeFormB.CodeName;
          //Ed_HopedeptGb3.Text := CodeFormB.BuSeoName;
        End;
    End;
  End;
  TOnWinPopupEdit(Sender).PopupControl := nil;
}
end;

procedure TMainForm.ED_dept1Change(Sender: TObject);
begin
{  case TOnWinPopupEdit(Sender).Tag of
    1:Begin
        pe_JOBPLACE1.Hint   := '';
        pe_JOBPLACE1.Text   := '';
        //Ed_HopedeptGb1.Text := '';
        Ed_movegubun1.Text  := '';
        //if ((ED_dept1.Text <> '') and (TDS1.FieldByName('STATUS').AsString <> '2')) then pe_JOBPLACE1.Enabled := True;
      End;
    2:Begin
        pe_JOBPLACE2.Hint   := '';
        pe_JOBPLACE2.Text   := '';
        //Ed_HopedeptGb2.Text := '';
        Ed_movegubun2.Text  := '';
        //if ((ED_dept2.Text <> '') and (TDS1.FieldByName('STATUS').AsString <> '2')) then pe_JOBPLACE2.Enabled := True;
      End;
    3:Begin
        pe_JOBPLACE3.Hint   := '';
        pe_JOBPLACE3.Text   := '';
        ///Ed_HopedeptGb3.Text := '';
        Ed_movegubun3.Text  := '';
        //if ((ED_dept3.Text <> '') and (TDS1.FieldByName('STATUS').AsString <> '2')) then pe_JOBPLACE3.Enabled := True;
      End;
  End;
}  
end;

procedure TMainForm.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := Ed_empno.Text;
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TMainForm.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          Ed_empno.Text           := Fm_EmpForm.empno;
          L_korname.ValueCaption  := Fm_EmpForm.Korname;
          Retrieve;
     end;
end;

procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Ed_empnoInitPopup(Sender);
//          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

          Retrieve;
          Key := #0;
     end;
end;

procedure TMainForm.Ed_HopedeptGb2Exit(Sender: TObject);
begin
//  if Ed_HopedeptGb2.itemindex <> -1 then
//     Ed_HopedeptGb2.Hint := Ed_HopedeptGb2.KeyItems.Strings[Ed_HopedeptGb2.itemindex];
end;

procedure TMainForm.Ed_HopedeptGb1Exit(Sender: TObject);
begin
//  if Ed_HopedeptGb1.itemindex <> -1 then
//     Ed_HopedeptGb1.Hint := Ed_HopedeptGb1.KeyItems.Strings[Ed_HopedeptGb1.itemindex];
end;

procedure TMainForm.Ed_HopedeptGb3Exit(Sender: TObject);
begin
//  if Ed_HopedeptGb3.itemindex <> -1 then
//     Ed_HopedeptGb3.Hint := Ed_HopedeptGb3.KeyItems.Strings[Ed_HopedeptGb3.itemindex];
end;

procedure TMainForm.E_deptgubunExit(Sender: TObject);
begin
  if E_deptGubun.itemindex <> -1 then
     E_deptGubun.Hint := E_deptGubun.KeyItems.Strings[E_deptGubun.itemindex];
end;

procedure TMainForm.pe_dept1InitPopup(Sender: TObject);
begin
  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.ExceptDept   := L_dept.Hint;

  TOnWinPopupEdit(Sender).PopupControl := DeptForm;
end;

procedure TMainForm.pe_dept1CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.Deptcode <> '' then
  Begin
    case TOnWinPopupEdit(Sender).Tag of
      1:Begin
          PE_dept1.Hint := DeptForm.Deptcode;
          PE_dept1.Text := DeptForm.Deptname;
        End;
      2:Begin
          PE_dept2.Hint := DeptForm.Deptcode;
          PE_dept2.Text := DeptForm.Deptname;
        End;
      3:Begin
          PE_dept3.Hint := DeptForm.Deptcode;
          PE_dept3.Text := DeptForm.Deptname;
        End;
    End;
  End;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TMainForm.Bt_search_RRClick(Sender: TObject);
begin
{   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_VersionCHK3(3, '부서별 R&&R 조회');
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','2015 조직별 R&R(팀단위).XLSX','부서별 R&&R 조회',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
}
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     result := true;

     with QR_com do
     begin
          ServiceName := 'PIT1030A_DML';
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

procedure TMainForm.pe_JOBPLACE1InitPopup(Sender: TObject);
begin
  JobplaceForm.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := JobplaceForm;
end;

procedure TMainForm.pe_JOBPLACE1CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if JobplaceForm.CodeNo <> '' then
  Begin
    case TOnWinPopupEdit(Sender).Tag of
      1:Begin
          PE_Jobplace1.Hint := JobplaceForm.CodeNo;
          PE_Jobplace1.Text := JobplaceForm.CodeName;
        End;
      2:Begin
          PE_Jobplace2.Hint := JobplaceForm.CodeNo;
          PE_Jobplace2.Text := JobplaceForm.CodeName;
        End;
      3:Begin
          PE_Jobplace3.Hint := JobplaceForm.CodeNo;
          PE_Jobplace3.Text := JobplaceForm.CodeName;
        End;
    End;
  End;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

function TMainForm.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result := '';
  
  for I:=1 to Length(sSrc) do
    //if (sSrc[I] in ['(',')','[',']',' ','A'..'Z', 'a'..'z', '0'..'9','{','}']) or (ByteType(sSrc, I)<>mbSingleByte) then
        if not(sSrc[I] in ['''','$','#']) then
      result := result + sSrc[I];
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
