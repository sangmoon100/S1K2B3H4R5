{===================== Program Header ==========================================
 PROGRAM-NAME      : PIU3050A(이동희망부서 등록현황 조회(팀장용))
 SYSTEM-NAME       : 인사
 SUBSYSTEM-NAME    : 사내교류
 Programmer        : hjku
 Version           : 1.0
 Date              : 2014.10.14

Update Contents
 Version  date(yy.mm.dd)  programmer  description                relevant doc.no
 1.0      2014.10.14      hjku        신규추가

================================================================================}
unit PIU30501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, StdCtrls, OnShapeLabel, OnEditMemo,
  OnEditCombo, ComCtrls, OnFocusButton, Tmax_session, OnInsaCommon,
  Db,  Mask, Buttons, Calen1, TmaxFunc, OnPopupEdit,
  OnLineLabel, Tmax_DataSetText, Grids, DBGrids, OnGrDBGrid, OnDBGrid;

type
  TMainForm = class(TForm)
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    Shape5: TShape;
    Label5: TLabel;
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    L_paycl: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    Panel2: TPanel;
    Bt_close: TOnFocusButton;
    CB_Year: TOnComboEdit;
    L_korname: TOnShapeLabel;
    Ed_empno: TOnWinPopupEdit;
    TMaxDataSet_HInsa: TTMaxDataSet;
    Shape1: TShape;
    OnGrDbGrid3: TOnGrDbGrid;
    Shape2: TShape;
    L1_title: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    OnGrDbGrid1: TOnGrDbGrid;
    TDS2: TTMaxDataSet;
    DataSource1: TDataSource;
    Bt_Confirm: TOnFocusButton;
    BT_Confirm_Cancel: TOnFocusButton;
    Bt_return: TOnFocusButton;
    QR_com: TTMaxDataSet;
    DataSource2: TDataSource;
    cb_jobdept: TOnComboEdit;
    Shape3: TShape;
    OnSectionLabel2: TOnSectionLabel;
    OnGrDbGrid2: TOnGrDbGrid;
    DataSource3: TDataSource;
    TDS3: TTMaxDataSet;
    Bt_Search: TOnFocusButton;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_cancelClick(Sender: TObject);
    procedure ED_empReadEnded(Sender: TObject);
    procedure ED_empKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_AppClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);    
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure OnGrDbGrid3DblClick(Sender: TObject);
    procedure BT_Confirm_CancelClick(Sender: TObject);
    procedure Bt_returnClick(Sender: TObject);
    procedure Ed_empnoChange(Sender: TObject);
    procedure cb_jobdeptChange(Sender: TObject);
    procedure Bt_SearchClick(Sender: TObject);
  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
    procedure Csel_Open;

  public
    { Public declarations }
    GSEmpno     : String;
    AEmpno      : String;
    GSKorname   : String;
    GSGrade     : String;
    GSSectCode  : String;
    GSDeptCode  : String;
    GSJobDept   : String;
    GSJobDeptName: String;
    SqlStr      : String;
    PayraChdate : String;

    GSsayu1     : String;
    GSsayu2     : String;
    GSsayu3     : String;
    GSsayu4     : String;
    GSsayu5     : String;
    GSspedesc1  : String;
    GSspedesc2  : String;
    GSspedesc3  : String;
    GSspedesc4  : String;
    GSspedesc5  : String;

    gs_Year     : String;
    vOrgnum     : String;

    Csel_SQL   : String;
    Csel_ret   : Boolean;

    workemp1, workemp2, workemp3, workemp4, workemp5 : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure CompInit;
    procedure Retrieve;
    function check_manager : boolean;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  end;

var
  MainForm: TMainForm;


implementation

uses PIU30502, PIU30503, PIU30504;


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
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.UserName    := Hinsa_Param(cmdline,5);
  TMaxSession.PassWord    := Hinsa_Param(cmdline,6);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

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
  with QR_com do
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
      gs_Year      := FieldByName('field1').AsString;
  end;

  ParamVariant  := 'SELECT nvl(  korname  ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       nvl(  paycl    ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) || '';'' ||     '+ #13#10 +
                   '       nvl(  payra    ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) || '';'' ||     '+ #13#10 +
                   '       nvl(  orgnum   ,'' '') || '';'' ||                                                          '+ #13#10 +
                   //2015.12.07.hjku.. 결재는 근무부서 기준이므로 변경..
                   //'       nvl(  deptcode ,'' '') || '';'' ||                                                          '+ #13#10 +
                   //'       (select trim(deptname)  from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) || '';'' ||'+ #13#10 +
                   '       nvl(  jobdept ,'' '') || '';'' ||                                                          '+ #13#10 +
                   '       (select trim(deptname)  from pycdept where orgnum = a.orgnum and deptcode = a.jobdept) || '';'' ||'+ #13#10 +
                   '       (select deptgubun from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) || '';'' ||'+ #13#10 +
                   '       (select codename from pyccode where codeid =''I804'' and codeno =                            '+ #13#10 +
                   '               (select deptgubun from pycdept where orgnum = a.orgnum and deptcode = a.deptcode))|| '';'' ||'+ #13#10 +
                   '       (select jobduty from pmpathdet where empno = a.empno and nowpath =1) || '';'' ||            '+ #13#10 +
	           '       (select jobdutyname from pmjobduty where useyn = ''Y'' and jobduty =                        '+ #13#10 +
                   '               (select jobduty from pmpathdet where empno = a.empno and nowpath =1)) || '';'' ||   '+ #13#10 +
                   '       (select sectcode from pycdept where orgnum = a.orgnum and deptcode = a.deptcode)            '+ #13#10 +
                   '  FROM pimpmas a                                                                                   '+ #13#10 +
                   format(' WHERE empno = ''%s''   ' , [GSEmpno]);

  Csel_SQL      := ParamVariant;
  Csel_Open;


  L_dept.Hint                := Csel_gfd(7);
  L_dept.ValueCaption        := Csel_gfd(8);
  GsJobDept := L_dept.Hint;
  GsJobDeptName := L_dept.ValueCaption;

  ED_empno.Text      := GSEmpno;
  L_korname.ValueCaption     := Csel_gfd(1);  

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
  end
  else
  begin
    ED_empno.ButtonWidth := 0;
    ED_empno.Enabled     := False;
    
    if not check_manager then
    begin
         MessageDlg('팀장 결재 화면입니다.' +#13#10+
                    '사용권한이 없습니다.', mtInformation, [mbYes], 0 );
         Application.Terminate;
         Exit;
    end;
  end;
  Retrieve;
end;

//근태 결재자 정보 참고로 개발함
function TMainForm.check_manager : boolean;
begin
     result := false;

     {//2014.03.14.hjku. 부문장 권한 추가
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
          SQL.Add('SELECT SECTCODE,    ');
          SQL.Add('       ''field2'',  ');
          SQL.Add('       ''field3'',  ');
          SQL.Add('       ''field4'',  ');
          SQL.Add('       ''field5''   ');
          SQL.Add('  FROM PICHARE      ');
          Sql.Add ('where e1empno   = '''+ GSempno +'''  ');

          Open;

          if (QR_com.RecordCount > 0) then
          begin
              result := true;
              GSdeptcode := FieldByName('field1').AsString;
          end;
     end;
     }
     //팀장권한 체크
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
          Sql.Add ('Select Eempno , ''field2'', ''field3'', ''field4'', ''field5'' ');
          Sql.Add ('  from pimeemp            ');
          Sql.Add (' where Eempno   = '''+ GSempno +'''  ');

          Open;

          if (QR_com.RecordCount > 0) then
                result           := True;
     end;

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
  MainForm.Close;
end;

procedure TMainForm.Retrieve;
var  ParamVariant : String;
begin
  CompInit;

  //해당팀 전입신청 현황
  with  TDS1  do
  begin
       ServiceName := 'HINSA_select12';
       Close;
       ClearFieldInfo;
       AddField('EMPNO'      , ftString, 2000);
       AddField('KORNAME'    , ftString, 2000);
       AddField('DEPTCODE'   , ftString, 2000);
       AddField('DEPTNAME'   , ftString, 2000);
       AddField('PAYCLNAME'  , ftString, 2000);
       AddField('PAYRANAME'  , ftString, 2000);
       AddField('HOPESAYU'   , ftString, 2000);
       AddField('BIGO'       , ftString, 2000);
       AddField('FIELD9'     , ftString, 2000);
       AddField('FIELD10'    , ftString, 2000);
       Sql.Clear;
       Sql.Add('SELECT  A.EMPNO ');
       Sql.Add('     , A.KORNAME ');
       Sql.Add('     , B.DEPTCODE ');
       Sql.Add('     , B.DEPTNAME ');
       Sql.Add('     , C.CODENAME PAYCLNAME ');
       Sql.Add('     , E.CODENAME PAYRANAME ');
       Sql.Add('     , CASE WHEN HOPEDEPT1='''+GsJobDept+''' THEN HOPESAYU1 ');
       Sql.Add('            WHEN HOPEDEPT2='''+GsJobDept+''' THEN HOPESAYU2 ');
       Sql.Add('            WHEN HOPEDEPT3='''+GsJobDept+''' THEN HOPESAYU3 ');
       Sql.Add('            ELSE '''' END HOPESAYU ');
       {//2014.12.04.hjku.. 전입 1지망만 보여도록 수정.. 이명노M 요청
       Sql.Add('     , CASE WHEN HOPEDEPT1='''+GsJobDept+''' THEN ''1지망'' ');
       Sql.Add('            WHEN HOPEDEPT2='''+GsJobDept+''' THEN ''2지망'' ');
       Sql.Add('            WHEN HOPEDEPT3='''+GsJobDept+''' THEN ''3지망'' ');
       Sql.Add('            ELSE '''' END BIGO           ');
       }
       Sql.Add('     , CASE WHEN HOPEDEPT1='''+GsJobDept+''' THEN '' '' ');
       Sql.Add('            WHEN HOPEDEPT2='''+GsJobDept+''' THEN '' '' ');
       Sql.Add('            WHEN HOPEDEPT3='''+GsJobDept+''' THEN '' '' ');
       Sql.Add('            ELSE '''' END BIGO           ');
       Sql.Add('     ,''FIELD9'' FIELD9,''FIELD10'' FIELD10          ');
       Sql.Add(' FROM PMOVEMAS A, PYCDEPT B, PYCCODE C, PYCCODE E                                 ');
       Sql.Add('WHERE A.ORGNUM = B.ORGNUM(+) ');
       Sql.Add('  AND A.DEPTCODE = B.DEPTCODE(+)                                                  ');
       Sql.Add('  AND A.RABASYY  = '''+CB_Year.text +'''                                          ');
       Sql.Add('  and a.status =''2''                                                             ');
       //2014.12.04.hjku.. 전입 1지망만 보여도록 수정.. 이명노M 요청
       Sql.Add('  and a.HOPEDEPT1 ='''+GsJobDept+'''                                              ');
       Sql.Add('  and nvl(a.CONYN,''N'') <>''N''                                                  ');
       Sql.Add('  AND A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                         ');
       Sql.Add('  AND A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                         ');
       Sql.Add('  AND (  HOPEDEPT1='''+GsJobDept+''' OR HOPEDEPT2='''+GsJobDept+''' OR HOPEDEPT3 ='''+GsJobDept+''')      ');
       Sql.Add('  and exists(select 1  from pimeemp where eempno ='''+Ed_empno.text+''' and ejobdept='''+GsJobDept+''')                                  ');
       Sql.Add('ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO  ');

       //memo1.text := Sql.Text;
       Open;
  end;

 //타팀 전출 신청 현황(결재완료)
  with  TDS2  do
  begin
       ServiceName := 'HINSA_select10';
       Close;
       ClearFieldInfo;
       AddField('EMPNO'           , ftString, 100);
       AddField('KORNAME'         , ftString, 100);
       AddField('HOPEDEPTname1'   , ftString, 100);
       AddField('HOPEDEPTname2'   , ftString, 100);
       AddField('HOPEDEPTname3'   , ftString, 100);
       AddField('WORKYYCNT'       , ftString, 100);
       AddField('moveGUBUN'       , ftString, 100);
       AddField('CONYN'           , ftString, 100);
       AddField('CONYNNAME'       , ftString, 100);
       AddField('field10'         , ftString, 100);
       Sql.Clear;

       Sql.Add('SELECT  A.EMPNO   ');
       Sql.Add('      , A.KORNAME ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT1) HOPEDEPTname1 ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT2) HOPEDEPTname2 ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT3) HOPEDEPTname3 ');
       Sql.Add('      ,    WORKYYCNT   ');
       Sql.Add('      , case when TRANSLATE(WORKYYCNT,''0123456789''||WORKYYCNT,''0123456789'')>=6 then ''필수대상'' else ''이동희망'' end moveGUBUN ');
       Sql.Add('      , nvl(CONYN,''N'')');
       Sql.Add('      , decode(nvl(CONYN,''N''),''A'',''자동승인'',''Y'',''승인'',''R'',''반려'','''') CONYNNAME, '''' field10 ');
       Sql.Add(' FROM PMOVEMAS A, PYCDEPT B, PYCCODE C, PYCCODE E                                  ');
       Sql.Add('WHERE A.ORGNUM = B.ORGNUM(+)  ');
       Sql.Add('  AND A.DEPTCODE = B.DEPTCODE(+)                                                   ');
       Sql.Add('  AND A.RABASYY  = '''+CB_Year.text +'''            ');
       //Sql.Add('--  and a.deptcode =''SKIC0'' ');
       Sql.Add('  and a.status =''2'' ');
       Sql.Add('  and nvl(a.CONYN,''N'') <>''N'' ');
       //2015.12.04.hjku.. 'A0005','A0007','A0009'는 결재하지 않음. 김현순M 요청.
       //Sql.Add('  and exists(select 1  from pimeemp where a.empno = empno and eempno ='''+Ed_empno.text+''' and ejobdept='''+GsJobDept+''')                                  ');
       Sql.Add('  and exists(select 1  from pimeemp where a.empno = empno and jobdept not in (''A0005'',''A0007'',''A0009'') and eempno ='''+Ed_empno.text+''' and ejobdept='''+GsJobDept+''')                                  ');
       Sql.Add('  AND A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                          ');
       Sql.Add('  AND A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                          ');
       Sql.Add('ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO ');

       //memo2.text := Sql.Text;
       Open;
  end;

 //타팀 전출 신청 현황(결재중)
  with  TDS3  do
  begin
       ServiceName := 'HINSA_select10';
       Close;
       ClearFieldInfo;
       AddField('EMPNO'           , ftString, 100);
       AddField('KORNAME'         , ftString, 100);
       AddField('HOPEDEPTname1'   , ftString, 100);
       AddField('HOPEDEPTname2'   , ftString, 100);
       AddField('HOPEDEPTname3'   , ftString, 100);
       AddField('WORKYYCNT'       , ftString, 100);
       AddField('moveGUBUN'       , ftString, 100);
       AddField('CONYN'           , ftString, 100);
       AddField('CONYNNAME'       , ftString, 100);
       AddField('field10'         , ftString, 100);
       Sql.Clear;

       Sql.Add('SELECT  A.EMPNO   ');
       Sql.Add('      , A.KORNAME ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT1) HOPEDEPTname1 ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT2) HOPEDEPTname2 ');
       Sql.Add('      , (select trim(deptname) from pycdept where orgnum = a.orgnum and deptcode = HOPEDEPT3) HOPEDEPTname3 ');
       Sql.Add('      ,    WORKYYCNT   ');
       Sql.Add('      , case when TRANSLATE(WORKYYCNT,''0123456789''||WORKYYCNT,''0123456789'')>=6 then ''필수대상'' else ''이동희망'' end moveGUBUN ');
       Sql.Add('      , nvl(CONYN,''N'')');
       Sql.Add('      , decode(nvl(CONYN,''N''),''A'',''자동승인'',''Y'',''승인'',''R'',''반려'','''') CONYNNAME, '''' field10 ');
       Sql.Add(' FROM PMOVEMAS A, PYCDEPT B, PYCCODE C, PYCCODE E                                  ');
       Sql.Add('WHERE A.ORGNUM = B.ORGNUM(+)  ');
       Sql.Add('  AND A.DEPTCODE = B.DEPTCODE(+)                                                   ');
       Sql.Add('  AND A.RABASYY  = '''+CB_Year.text +'''            ');
       //Sql.Add('--  and a.deptcode =''SKIC0'' ');
       Sql.Add('  and a.status =''2'' ');
       Sql.Add('  and nvl(a.CONYN,''N'') = ''N'' ');
       //2015.12.04.hjku.. 'A0005','A0007','A0009'는 결재하지 않음. 김현순M 요청.
       //Sql.Add('  and exists(select 1  from pimeemp where a.empno = empno and eempno ='''+Ed_empno.text+''' and ejobdept='''+GsJobDept+''')                                  ');
       Sql.Add('  and exists(select 1  from pimeemp where a.empno = empno and jobdept not in (''A0005'',''A0007'',''A0009'') and eempno ='''+Ed_empno.text+''' and ejobdept='''+GsJobDept+''')                                  ');
       Sql.Add('  AND A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                          ');
       Sql.Add('  AND A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                          ');
       Sql.Add('ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO ');

       //memo3.text := Sql.Text;
       Open;

       {GSMEpayra  := FieldByName('PAYRA').AsString;
       MEpayra.ValueCaption := Get_CodeName('I113',FieldByName('payra').AsString);    //직위
       VDeptname  := FieldByName('DEPTNAME').AsString;
       VJuminid   := FieldByName('JUMINID').AsString;
       VStdate    := FieldByName('ORGEMPDATE').AsString;
       VEDdate    := FieldByName('RETDATE').AsString;
       VDuYY      := FieldByName('HANADUYY').AsString;
       VDuMM      := FieldByName('HANADUMM').AsString;
       VKORNAME   := FieldByName('KORNAME').AsString;
       VPresName  := FieldByName('PRESNAME').AsString;
       VCompNAME  := FieldByName('COMPNAME').AsString;

       Close;   }
  end;

end;

procedure TMainForm.CompInit;
begin
  Bt_Confirm.Enabled        := True;
  BT_Confirm_Cancel.Enabled := False;
  Bt_return.Enabled         := True;

  L1_title.caption := '= ' + GsJobDeptName + ' 전입 신청 현황 =';
  Bt_Close.SetFocus;
end;

procedure TMainForm.Bt_cancelClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.ED_empReadEnded(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.ED_empKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then ED_emp.PL_get_singledata ;
end;

procedure TMainForm.Bt_AppClick(Sender: TObject);
begin
  SQLStr := 'UPDATE pmovemas                                         '+
            '   SET STATUS    = ''2'',                               '+
            '       APPDATE   = TO_CHAR(SYSDATE,''YYYYMMDD''),       '+
            '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), '+
            '       WRITEMAN  =  ''' + GSEmpno + '''                 '+
            ' WHERE EMPNO     =  ''' + ED_empno.Text + '''           '+
            '   AND Rabasyy   =  ''' + gs_Year+'''                   ';

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
        end;
    end;

  MessageDlg('등록되었습니다.', mtInformation, [mbOk],0);
  Retrieve;
end;

procedure TMainForm.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := Ed_empno.Text;
     if(GSEmpno<>Ed_empno.Text) then
        Fm_EmpForm.E_cond.text := Ed_empno.Text;
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
          L_dept.Hint             := Fm_EmpForm.deptcode;
          L_dept.ValueCaption     := Fm_EmpForm.deptname;

          Retrieve;
     end;
end;

procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Ed_empnoInitPopup(Sender);
          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

          Retrieve;
          Key := #0;
     end;
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

procedure TMainForm.Bt_ConfirmClick(Sender: TObject);
var
    p_empno, p_korname, p_conyn, p_eempno :string ;
begin
    p_empno   := TDS3.FieldByName('EMPNO').AsString;
    p_korname := TDS3.FieldByName('KORNAME').AsString;
    p_conyn   := TDS3.FieldByName('CONYN').AsString;
    p_eempno  := Ed_empno.text;

    if(p_empno='') then
    begin
        MessageDlg('결재할 자료가 없습니다.',mtInformation, [mbOk], 0);
        exit;
    end;

    if p_conyn='' then p_conyn := 'N';

    if p_conyn='N' then
    begin
        p_conyn := 'Y';

        with TDS_dml do
        begin
             ServiceName := 'PIT1030A_DML';
             Close;
             Sql.Clear ;

             Sql.Add ('UPDATE pmovemas                                             ');
             Sql.Add ('   SET CONYN ='''+ p_conyn + ''',                           ');
             Sql.Add ('       CONEMPNO  = '''+ p_eempno + ''',                     ');
             Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')    ');
             Sql.Add ('WHERE  RABASYY   = '''+ CB_Year.text +'''                   ');
             Sql.Add ('  AND  EMPNO     = '''+ p_empno + '''                       ');

             if Execute then
             begin
                 SendProgID  := 'PIU3050A';
                 SendEmpno   := p_eempno;
                 RcveEmpno   := p_empno;
                 MailSubject := '이동 신청 승인';
                 MailBody    := p_korname + '님의 이동 신청이 승인되었습니다.';

                 if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                    MessageDlg(p_empno+'사번 이동 승인이 성공 하였습니다...',mtInformation, [mbOk], 0)
                 else
                    MessageDlg(p_empno+'사번 이동 승인시 오류가 발생하였습니다.',mtInformation, [mbOk], 0);
             end
             else
             begin
                  MessageDlg(p_empno+'사번 이동 승인시 오류가 발생하였습니다.',mtInformation, [mbOk], 0);
             end;
        end;
    end
    else
    begin
        MessageDlg('이미 결재처리된 자료입니다.',mtInformation, [mbOk], 0);
    end;
    
    retrieve;
end;


procedure TMainForm.OnGrDbGrid3DblClick(Sender: TObject);
begin
  Fm_sayuview := TFm_sayuview.Create(Self);

  with TDS1 do
  begin
      Fm_sayuview.GsEmpno    :=  FieldByName('EMPNO').AsString;
      Fm_sayuview.GsKorname  :=  FieldByName('KORNAME').AsString;
      Fm_sayuview.GsPayraname:=  FieldByName('PAYRANAME').AsString;
      Fm_sayuview.GsDeptname :=  FieldByName('DEPTCODE').AsString + '-' +
                                 FieldByName('DEPTNAME').AsString;
      Fm_sayuview.Gsbigo     :=  FieldByName('BIGO').AsString;
      Fm_sayuview.GsHopesayu :=  FieldByName('HOPESAYU').AsString;
  end;

  Fm_sayuview.ShowModal;
end;

procedure TMainForm.BT_Confirm_CancelClick(Sender: TObject);
var
    p_empno, p_korname, p_conyn, p_eempno :string ;
begin
    p_empno   := TDS2.FieldByName('EMPNO').AsString;
    p_korname := TDS2.FieldByName('KORNAME').AsString;
    p_conyn   := TDS2.FieldByName('CONYN').AsString;
    p_eempno  := Ed_empno.text;

    if p_conyn<>'' then
    begin
        p_conyn := 'N';

        with TDS_dml do
        begin
             ServiceName := 'PIT1030A_DML';
             Close;
             Sql.Clear ;

             Sql.Add ('UPDATE pmovemas                                             ');
             Sql.Add ('   SET CONYN =''' + p_conyn + ''',                          ');
             Sql.Add ('       CONEMPNO  = '''+ p_eempno + ''',                     ');
             Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')    ');
             Sql.Add ('WHERE  RABASYY   = '''+ CB_Year.text +'''                   ');
             Sql.Add ('  AND  EMPNO     = '''+ p_empno + '''                       ');

             if Execute then
             begin
                 SendProgID  := 'PIU3050A';
                 SendEmpno   := p_eempno;
                 RcveEmpno   := p_empno;
                 MailSubject := '이동 신청 승인 취소';
                 MailBody    := p_korname + '님의 이동 신청 승인이 취소되었습니다.';

                 if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                    MessageDlg('이동 신청 승인 취소가 성공 하였습니다...',mtInformation, [mbOk], 0)
                 else
                    MessageDlg('이동 신청 승인 취소가 실패 하였습니다...',mtError, [mbOk], 0);
             end
             else
             begin
                  Application.MessageBox('결재처리에 실패했습니다.','작업실패',MB_OK);
                  Exit;
             end;
        end;
    end
    else
    begin
        MessageDlg('결재처리되지 않은 자료입니다.',mtInformation, [mbOk], 0);
    end;
    retrieve;
end;


procedure TMainForm.Bt_returnClick(Sender: TObject);
var
    p_empno, p_korname, p_conyn, p_eempno :string ;
begin
    p_empno   := TDS3.FieldByName('EMPNO').AsString;
    p_korname := TDS3.FieldByName('KORNAME').AsString;
    p_conyn   := TDS3.FieldByName('CONYN').AsString;
    p_eempno  := Ed_empno.text;

    if(p_empno='') then
    begin
        MessageDlg('결재할 자료가 없습니다.',mtInformation, [mbOk], 0);
        exit;
    end;

    if p_conyn='' then p_conyn := 'N';

    if p_conyn='N' then
    begin
        p_conyn := 'R';

        with TDS_dml do
        begin
             ServiceName := 'PIT1030A_DML';
             Close;
             Sql.Clear ;

             Sql.Add ('UPDATE pmovemas                                             ');
             Sql.Add ('   SET CONYN =''' + p_conyn + ''',                          ');
             Sql.Add ('       CONEMPNO  = '''+ p_eempno + ''',                     ');
             Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')    ');
             Sql.Add ('WHERE  RABASYY   = '''+ CB_Year.text +'''                   ');
             Sql.Add ('  AND  EMPNO     = '''+ p_empno + '''                       ');

             if Execute then
             begin
                 SendProgID  := 'PIU3050A';
                 SendEmpno   := p_eempno;
                 RcveEmpno   := p_empno;
                 MailSubject := '이동 신청 반려';
                 MailBody    := p_korname + '님의 이동 신청이 반려되었습니다.';

                 if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                    MessageDlg('이동 신청 반려가 성공 하였습니다...',mtInformation, [mbOk], 0)
                 else
                    MessageDlg('이동 신청 반려가 실패 하였습니다...',mtError, [mbOk], 0);

             end
             else
             begin
                  Application.MessageBox('결재처리에 실패했습니다.','작업실패',MB_OK);
                  Exit;
             end;
        end;
    end
    else
    begin
        MessageDlg('이미 결재처리된 자료입니다.',mtInformation, [mbOk], 0);
    end;

    retrieve;
end;

procedure TMainForm.Ed_empnoChange(Sender: TObject);
var
   i : integer;
begin

     with QR_com do
     begin
          //////////////////////////////////////////////////////////////////////
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('field1'  , ftString, 100);
          AddField('field2'  , ftString, 100);
          AddField('field3'  , ftString, 100);
          AddField('field4'  , ftString, 100);
          AddField('field5'  , ftString, 100);
          Sql.Clear;
          SQL.Text := ' SELECT DISTINCT A.EJOBDEPT, B.DEPTNAME EJOBDEPTNAME, RPAD(EJOBDEPT,5,'' '')||''-''||B.DEPTNAME EJOBDEPTFULLNAME  ' + #13#10 +
                      '        ,  '''' Field4,  '''' Field5' + #13#10 +
                      '   FROM PIMEEMP  A, PYCDEPT B   ' + #13#10 +
                      '  WHERE A.EORGNUM = B.ORGNUM  ' + #13#10 +
                      '    AND A.EJOBDEPT = B.DEPTCODE   ' + #13#10 +
                      //2015.12.04.hjku.. 'A0005','A0007','A0009' 소속은 결재하지 않음.
                      '    AND A.EJOBDEPT not in (''A0005'',''A0007'',''A0009'')   ' + #13#10 +
               format('    AND A.EEMPNO =''%s'' ', [Ed_empno.text]) + #13#10 +
                      '  ORDER BY A.EJOBDEPT ' ;
          Open;
          First;
          cb_jobdept.Items.Clear;

          for i := 1 to RecordCount do
          begin
               cb_jobdept.Items.Add(FieldByName('Field3').AsString);
               Next;
          end;

          cb_jobdept.ItemIndex := 0;
     end;

end;

procedure TMainForm.cb_jobdeptChange(Sender: TObject);
begin
    GsJobDept := RemoveChar(copy(cb_jobdept.text,1,5),' ');
    GsJobDeptname := RemoveChar(copy(cb_jobdept.text,7,length(cb_jobdept.text)-6),' ');

    Retrieve;
end;

procedure TMainForm.Bt_SearchClick(Sender: TObject);
begin
    retrieve;
end;

end.
