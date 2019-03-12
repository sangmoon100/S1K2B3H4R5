unit PIU3010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, OnSkinBtn, OnDBGrid,
  OnTmaxCodeEdit, OnTmaxDeptEdit, On_pmjobgun, On_pmjobkind, On_pmjobduty,
  On_DeptEdit, OnEditMdate, kpaylib, OnInsaCommon;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_payraname: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    BT_Save: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    L_Deptname: TOnShapeLabel;
    L_Rabasdate: TOnShapeLabel;
    BT_Help: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_Korname: TOnShapeLabel;
    BT_Print: TOnFocusButton;
    BT_Confirm: TOnFocusButton;
    Notebook1: TNotebook;
    P_Opinion: TPanel;
    Shape9: TShape;
    Shape10: TShape;
    Label8: TLabel;
    Label9: TLabel;
    ED_Answer2: TOnMemo;
    ED_Answer1: TOnMemo;
    ED_Answer3: TOnMemo;
    ED_Answer4: TOnMemo;
    ED_Answer5: TOnMemo;
    ED_Answer6: TOnMemo;
    ED_Answer8: TOnMemo;
    ED_Answer7: TOnMemo;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    Panel2: TPanel;
    ED_E1opinion: TOnMemo;
    ED_dutytarget: TOnMemo;
    Panel4: TPanel;
    Shape5: TShape;
    Label5: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label3: TLabel;
    Label6: TLabel;
    Grid1: TOnDBGrid;
    ED_jobplace: TTMaxCodePopupEdit;
    Ed_jobgun: TOnWinPopupEdit;
    Ed_jobkind: TOnWinPopupEdit;
    ED_jobduty: TOnWinPopupEdit;
    ED_jobkind1: TOnWinPopupEdit;
    ED_jobduty1: TOnWinPopupEdit;
    ED_jobduty2: TOnWinPopupEdit;
    ED_jobkind3: TOnWinPopupEdit;
    ED_jobduty3: TOnWinPopupEdit;
    Ed_deptgubun: TOnComboEdit;
    Ed_movegubun: TOnComboEdit;
    ED_seqno: TOnEdit;
    P_dutyym: TOnShapeLabel;
    ED_jobkind2: TOnWinPopupEdit;
    B_save: TOnFocusButton;
    B_delete: TOnFocusButton;
    B_cancel: TOnFocusButton;
    B_insert: TOnFocusButton;
    P_dutyyy: TOnShapeLabel;
    P_dutymm: TOnShapeLabel;
    ED_dutyfrdate: TOnMaskEdit;
    ED_dutytodate: TOnMaskEdit;
    BT_anno: TOnFocusButton;
    Ed_dutydept: TOnWinPopupEdit;
    P_orgnum: TOnShapeLabel;
    Q_Grid: TTMaxDataSet;
    DataSource: TDataSource;
    Shape4: TShape;
    Label2: TLabel;
    Shape6: TShape;
    Label4: TLabel;
    Ed_nowpath1: TOnComboEdit;
    B_insert1: TOnFocusButton;
    B_save1: TOnFocusButton;
    B_delete1: TOnFocusButton;
    B_cancel1: TOnFocusButton;
    B_insert2: TOnFocusButton;
    B_save2: TOnFocusButton;
    B_delete2: TOnFocusButton;
    B_cancel2: TOnFocusButton;
    B_insert3: TOnFocusButton;
    B_save3: TOnFocusButton;
    B_delete3: TOnFocusButton;
    B_cancel3: TOnFocusButton;
    Ed_nowpath2: TOnComboEdit;
    Ed_nowpath3: TOnComboEdit;
    OnDBGrid1: TOnDBGrid;
    E_seqno: TOnEdit;
    Q_path1: TTMaxDataSet;
    DataSource1: TDataSource;
    Q_path2: TTMaxDataSet;
    DataSource2: TDataSource;
    Q_path3: TTMaxDataSet;
    DataSource3: TDataSource;
    OnDBGrid2: TOnDBGrid;
    OnDBGrid3: TOnDBGrid;
    Label1: TLabel;
    OnSectionLabel2: TOnSectionLabel;
    Shape1: TShape;
    Label7: TLabel;
    Shape7: TShape;
    Label10: TLabel;
    CB_Year: TOnComboEdit;
    QR_com: TTMaxDataSet;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_EmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_EmpnoEnter(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure ED_Answer1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_Answer8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB_1Click(Sender: TObject);
    procedure Ed_jobgunCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_jobgunInitPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Ed_jobkindCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_jobkindInitPopup(Sender: TObject);
    procedure Ed_jobkindEnter(Sender: TObject);
    procedure Ed_jobgunChange(Sender: TObject);
    procedure ED_jobdutyCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_jobdutyInitPopup(Sender: TObject);
    procedure Ed_jobkindChange(Sender: TObject);
    procedure ED_jobdutyEnter(Sender: TObject);
    procedure ED_jobkind1InitPopup(Sender: TObject);
    procedure ED_jobduty1InitPopup(Sender: TObject);
    procedure ED_jobduty1Enter(Sender: TObject);
    procedure ED_jobkind1Change(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure ED_dutyfrdateExit(Sender: TObject);
    procedure ED_dutytodateExit(Sender: TObject);
    procedure B_insertClick(Sender: TObject);
    procedure BT_annoClick(Sender: TObject);
    procedure Ed_dutydeptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_dutydeptInitPopup(Sender: TObject);
    procedure Ed_jobgunClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure B_deleteClick(Sender: TObject);
    procedure ED_dutytargetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_E1opinionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnDBGrid1DblClick(Sender: TObject);
    procedure OnDBGrid2DblClick(Sender: TObject);
    procedure OnDBGrid3DblClick(Sender: TObject);
    procedure Ed_dutydeptKeyPress(Sender: TObject; var Key: Char);
    procedure ED_jobplaceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FM_JOBGUN  : TFM_pmjobgun;
    FM_JOBKIND : TFM_pmjobkind;
    FM_JOBDUTY : TFM_pmjobduty;
    FM_DUTYDEPT: TFM_DeptEdit;
    vParamSQL  : String;
    procedure ConFirm_BtnVisible;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Select_BaseData;
    procedure Read_Data;
    procedure Grid_Data;
    procedure Path_data;
    function  FL_CheckNullAnswer:Boolean;
    function  FL_CheckNulldutytarget:Boolean;     //등록하지 않은 항목이 있는지 여부 체크
    function  FL_CheckNullH1dutypath:Boolean;
    function  FL_CheckNullH2dutypath:Boolean;
    function  FL_CheckNullH3dutypath:Boolean;
    function  FL_CheckMoveGubun:Boolean;          //경력입사 등록한 항목이 있는지를 체크
    function  FL_CheckNowpath:Boolean;
    function  FL_CheckNextpath:Boolean;
    function  Months_Between(mFrdate, mTodate: String): Integer;
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000

  public
    { Public declarations }
     SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

     vEmpno     : String;
     PEmpno     : String;
     AEmpno     : String;
     Ppaycl     : string;
     Ppayra     : String;
     Pjobkind   : String;
     Porgnum    : String;
     Pdeptcode  : String;
     Pjobdept   : String;   //2015.12.03.hjku 추가.
     PConyn     : String;
     PFinyn     : String;
     Lgubun     : Integer;
     Pjobpayra  : String;
     Ppayrayn   : String;
     Pjobpayrayn: String;
     sRabasdate : String;
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Check      : Integer;

     Workemp1   : String;
     Workemp2   : String;
     Workemp3   : String;
     Workemp4   : String;
     Workemp5   : String;
     Vsysdate   : String;
     Vdutyyy    : String;
     Vdutymm    : String;
     payrachdate: String;
     Leempno    : string; //상사 사번
     LWorkCnt   : Integer; //2014.11.11.hjku. 근무년수 추가
     LMoveYN    : string;
  end;

var
     FM_Main: TFM_Main;

implementation

uses UHelp, UEmpForm, UAnnoForm, Uprint1, Uprint2, piu3010a2;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
var
  ParamVariant: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10);
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

  Pempno        := Passemp(cmdline,1);
  Ed_empno.Text := Pempno;
  Aempno        := Pempno;

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
  end;
  
  // Pempno
  ParamVariant  := 'SELECT nvl(  korname  ,'' '') || '';'' || '+
                   '       nvl(  jobpayra ,'' '') || '';'' || '+
                   '       nvl(  jobgun   ,'' '') || '';'' || '+
                   '       nvl(  orgnum   ,'' '') || '';'' || '+
                   '       nvl(  deptcode ,'' '') || '';'' || '+
                   '       nvl(  payrayn  ,'' '') || '';'' || '+
                   '       nvl(  paycl    ,'' '') || '';'' || '+
                   '       nvl(jobpayrayn ,'' '') || '';'' || '+
                   '       nvl(jobdept ,'' '')             '+
                   '  FROM pimpmas                            '+
                   format(' WHERE empno = ''%s''   ' , [Pempno]);

  Csel_SQL      := ParamVariant;
  Csel_Open;

  Pjobpayra     := Csel_gfd(2);
  Ppayrayn      := Csel_gfd(6);
  Pjobpayrayn   := Csel_gfd(8);
  Pjobdept   := Csel_gfd(9);

  // 직위체계변경일일을 읽어온다
  ParamVariant  := 'select Value3|| '';'' ||Value4                '+
                   '  FROM pimvari                                '+
                   ' where gubun     = ''00''                     '+
                   '   and sgubun    = ''0001''                   ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  payrachdate   := Csel_gfd(1);

  // 평가기준일을 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2|| '';'' ||     '+
                  '       to_char(sysdate,''YYYYMMDD'')          '+
                  '  FROM pehrebas                               '+
                  ' where rabasdate = ''00000000''               '+
                  '   and gubun     = ''00''                     '+
                  '   and sgubun    = ''0001''                   ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  sRabasdate   := Csel_gfd(1);
  VSysdate     := Csel_gfd(3);
//  sRabasdate   := '20081130';
  L_Rabasdate.ValueCaption  := copy(sRabasdate,1,4)+'-'+copy(sRabasdate,5,2)+'-'+copy(sRabasdate,7,2);

  {2014.11.27.hjku.. 이동 관련 관리자 통일.. 이명노M 요청
  // 평가담당자를 읽어온다
  ParamVariant  := 'select Value1|| '';'' ||Value2|| '';'' ||Value3 '+
                   '       || '';'' ||Value4|| '';'' ||Value5       '+
                   '  FROM pehrebas                                 '+
                   ' where rabasdate = '''+sRabasdate+'''           '+
                   '   and gubun     = ''11''                       '+
                   '   and sgubun    = ''0005''                     ';
  }
  ParamVariant  := 'select Value1|| '';'' ||Value2|| '';'' ||     '+
                   '       Value3|| '';'' ||Value4|| '';'' ||     '+
                   '       Value5                                 '+
                   '  FROM pishrvari                              '+
                   ' where gubun     = ''00''                     '+
                   '   and sgubun    = ''0001''                   ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  Workemp1      := Csel_gfd(1);
  Workemp2      := Csel_gfd(2);
  Workemp3      := Csel_gfd(3);
  Workemp4      := Csel_gfd(4);
  Workemp5      := Csel_gfd(5);

  //2015.12.03.hjku.. 'A0005','A0007','A0009' 소속인 경우 결재 하지 않음..
  // 부서및 겸직부서조회
  Lgubun := -1;

  if (trim(pjobdept)= 'A0005') or
     (trim(pjobdept)= 'A0007') or
     (trim(pjobdept)= 'A0009') then
      Lgubun := 1
  else
  if (trim(Pjobpayra) = 'C51') or
     (trim(Ppayrayn)  = 'Y'  ) or
     (trim(Pjobpayrayn) = 'Y') then
       Lgubun := 2 // 부서장
  else
  if (Pempno = WorkEmp1) or (Pempno = WorkEmp2) or (Pempno = WorkEmp3)  or
     (Pempno = WorkEmp4) or (Pempno = WorkEmp5) or (copy(Pempno,1,1) = 'D')  then
  begin
    Ed_empno.ReadOnly := false;
    Lgubun            := 0;
  end;

  if Lgubun = 2 then
  begin
    Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
    Select_BaseData;
  end
  else
    Select_BaseData;

  SB_1Click(SB_1);
end;

procedure TFM_Main.Select_BaseData;
var
     ParamVariant: String;
     i : integer;
     vEkind : String;
     vTempWorkCnt : String;
begin
{2014.11.12.hjku. 결재자 정보 테이블 변경... 이명노M 요청
     ParamVariant := 'SELECT A.empno||'';''||A.korname||'';''||A.paycl||'';''||A.payra||'';''||A.jobkind||'';''||            '+#13+
                     '       A.orgnum||'';''||A.deptcode||'';''||                                                            '+#13+
                     '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''||                '+#13+
                     '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''||                '+#13+
                     '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''||           '+#13+
//                     '       b.conyn||'';''||b.E1conyn||'';''||decode(a.jobpayra,''C51'',d.eempno,c.eempno)                  '+#13+
                     '       b.conyn||'';''||b.E1conyn||'';''||decode(a.jobpayra,''C51'',d.eempno,D.eempno)                  '+#13+
                     '  FROM PIMPMAS A  , pmpathmas B, pimeemp c, pime1emp d                                                 '+#13+
                     ' WHERE (A.empno like '''+ Ed_empno.Text +'''||''%'' OR A.korname like '''+ Ed_empno.Text +'''||''%'')  '+#13+
                     '   and a.empno = b.empno(+)                                                                            '+#13+
                     '   and a.empno = c.empno(+)                                                                            '+#13+
                     '   and a.empno = d.empno(+)                                                                            '+#13+
                     '   AND SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'')                                      '+#13+
                     '   AND A.PAYRA    < ''D50''                                                                            '+#13+
                     '   AND A.PAYCL    > ''C00''                                                                            ';
}
     ParamVariant := 'SELECT A.empno||'';''||A.korname||'';''||A.paycl||'';''||A.payra||'';''||A.jobkind||'';''||            '+#13#10+
                     '       A.orgnum||'';''||A.deptcode||'';''||                                                            '+#13#10+
                     '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''||                '+#13#10+
                     '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''||                '+#13#10+
                     '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''||           '+#13#10+
                     '       b.conyn||'';''||b.E1conyn||'';''||c.eempno||'';''||                                             '+#13#10+
                     '       nvl((select NVL(TRANSLATE(Workyycnt,''0123456789''||Workyycnt,''0123456789''),0) from pmovemas where RABASYY='''+ CB_Year.Text +''' and EMPNO=a.empno),0)||'';''||  '+#13#10 +
                     '       (select moveyn from pmovemas where RABASYY='''+ CB_Year.Text +''' and EMPNO=a.empno)'+#13#10 +
                     '  FROM PIMPMAS A  , pmpathmas B, pimeemp c                                                             '+#13#10+
                     ' WHERE (A.empno like '''+ Ed_empno.Text +'''||''%'' OR A.korname like '''+ Ed_empno.Text +'''||''%'')  '+#13#10+
                     '   and a.empno = b.empno(+)                                                                            '+#13#10+
                     '   and a.empno = c.empno(+)                                                                            '+#13#10+
(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
                     '   AND SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'')                                      '+#13#10+
*)                     
                     '   AND FINDHIRE(A.EMPNO) NOT IN (''M'',''Q'',''P'',''Y'',''J'')                                      '+#13#10+
                     '   AND A.PAYRA    < ''D50''                                                                            '+#13#10+
                     '   AND A.PAYCL    > ''C00''                                                                            ';


     Csel_SQL := ParamVariant;  //memo1.Text :=  ParamVariant;
     Csel_Open;

     vEmpno                   := Csel_gfd(1);
     Ed_Empno.Text            := Csel_gfd(1);
     L_korname.ValueCaption   := Csel_gfd(2);
     Ppaycl                   := Csel_gfd(3);
     Ppayra                   := Csel_gfd(4);
     Pjobkind                 := Csel_gfd(5);
     Porgnum                  := Csel_gfd(6);
     Pdeptcode                := Csel_gfd(7);
     L_payraname.ValueCaption := Csel_gfd(9);
     L_Deptname.ValueCaption  := Csel_gfd(10);
     Pconyn                   := Csel_gfd(11);
     Pfinyn                   := Csel_gfd(12);
     Leempno                  := Csel_gfd(13);
     vTempWorkCnt             := Csel_gfd(14);

     if(vTempWorkCnt='') then vTempWorkCnt :='0';

     LWorkCnt                 := strtoint(vTempWorkCnt);
     LMoveYN                  := Csel_gfd(15);          

     Read_Data;
     Edit_Enabled(0,False);
     Edit_Enabled(1,False);
     Edit_Enabled(2,False);
     Edit_Enabled(3,False);
     ConFirm_BtnVisible;
end;

procedure TFM_Main.Read_Data;
var
     ParamVariant: String;
     i : integer;
     vEkind : String;
begin
     with TMaxDataSet_HInsa do
     begin
          ParamVariant := Format('SELECT Answer1, Answer2, Answer3, Answer4, Answer5         '+
                                 '  FROM pmpathmas A                                         '+
                                 ' WHERE A.EMPNO     = ''%s''                                 ',[Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Answer1'       , ftString, 400);
          AddField('Answer2'       , ftString, 400);
          AddField('Answer3'       , ftString, 400);
          AddField('Answer4'       , ftString, 400);
          AddField('Answer5'       , ftString, 400);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          ED_Answer1.Text        := Fields[0].AsString;
          ED_Answer2.Text        := Fields[1].AsString;
          ED_Answer3.Text        := Fields[2].AsString;
          ED_Answer4.Text        := Fields[3].AsString;
          ED_Answer5.Text        := Fields[4].AsString;

          ParamVariant := Format('SELECT Answer6, Answer7, Answer8, dutytarget, E1opinion     '+
                                 '  FROM pmpathmas A                                          '+
                                 ' WHERE A.EMPNO     = ''%s''                                 ',[Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Answer6'       , ftString, 400);
          AddField('Answer7'       , ftString, 400);
          AddField('Answer8'       , ftString, 400);
          AddField('dutytarget'    , ftString, 400);
          AddField('E1opinion'     , ftString, 400);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          ED_Answer6.Text        := Fields[0].AsString;
          ED_Answer7.Text        := Fields[1].AsString;
          ED_Answer8.Text        := Fields[2].AsString;
          ED_dutytarget.Text     := Fields[3].AsString;
          ED_E1opinion.Text      := Fields[4].AsString;

          if  recordCount > 0 then     check := 1
          else                         check := 0;
     end;

     Grid_Data;
end;

procedure TFM_Main.Grid_Data;
var
     ParamVariant: String;
begin
     with  Q_GRID  do
     begin
          ParamVariant := 'select EMPNO, SEQNO, DUTYFRDATE, decode(trim(DUTYTODATE),null,''현재'',DUTYTODATE) DUTYTODATE, DUTYYY, DUTYMM,                 ' + #13#10 +
                          '       case when dutyyy = 0 And dutymm = 0 And (To_Number(to_char(sysdate,''DD'')) >= To_Number(substr(dutyfrdate,7,2)))       ' + #13#10 +
                          '	         And (To_Number(to_char(sysdate,''DD'')) - To_Number(substr(dutyfrdate,7,2))) >= 16 then                          ' + #13#10 +
                          '	   to_char(TRUNC((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2)) + 1))/12),''90'')||''년 ''|| ' + #13#10 +
                          '	   to_char(  MOD((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2)) + 1)),12),''90'')||''개월''  ' + #13#10 +
                          '	   else case when dutyyy = 0 And dutymm = 0 And (To_Number(to_char(sysdate,''DD'')) >= To_Number(substr(dutyfrdate,7,2))) ' + #13#10 +
                          '	         And (To_Number(to_char(sysdate,''DD'')) - To_Number(substr(dutyfrdate,7,2))) < 16 then                           ' + #13#10 +
                          '	   to_char(TRUNC((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2))    ))/12),''90'')||''년 ''|| ' + #13#10 +
                          '	   to_char(  MOD((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2))    )),12),''90'')||''개월''  ' + #13#10 +
                          '	   else case when dutyyy = 0 And dutymm = 0 And (To_Number(to_char(sysdate,''DD'')) < To_Number(substr(dutyfrdate,7,2)))  ' + #13#10 +
                          '	         And (To_Number(to_char(sysdate,''DD'')) + 30 - To_Number(substr(dutyfrdate,7,2))) >= 16 then                     ' + #13#10 +
                          '	   to_char(TRUNC((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2))    ))/12),''90'')||''년 ''|| ' + #13#10 +
                          '	   to_char(  MOD((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2))    )),12),''90'')||''개월''  ' + #13#10 +
                          '	   else case when dutyyy = 0 And dutymm = 0 And (To_Number(to_char(sysdate,''DD'')) < To_Number(substr(dutyfrdate,7,2)))  ' + #13#10 +
                          '	         And (To_Number(to_char(sysdate,''DD'')) + 30 - To_Number(substr(dutyfrdate,7,2))) < 16 then                      ' + #13#10 +
                          '	   to_char(TRUNC((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2)) - 1))/12),''90'')||''년 ''|| ' + #13#10 +
                          '	   to_char(  MOD((((to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4))) *12) +                      ' + #13#10 +
                          '	                   (to_number(To_char(sysdate,''MM''  )) - to_number(substr(dutyfrdate,5,2)) - 1)),12),''90'')||''개월''  ' + #13#10 +
                          '	   else	to_char(DUTYYY,''99'')||''년 ''||to_char(DUTYMM, ''99'')||''개월''  end end end end DUTYYM,                       ' + #13#10 +
                          '	  JOBGUN,  (select jobgunname from pmjobgun where jobgun = a.JOBgun) jobgunname,                                          ' + #13#10 +
                          '       JOBKIND, Case When dutyfrdate < ''20120101'' Then (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''N'' ) ' + #13#10 +
                          '       Else                                              (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'' ) ' + #13#10 +
                          '       End jobkindname,                                                                                                        ' + #13#10 +
                          '       JOBDUTY, Case When dutyfrdate < ''20120101'' Then (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''N'' ) ' + #13#10 +
                          '       Else                                              (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'' ) ' + #13#10 +
                          '       End jobdutyname,                                                                                                        ' + #13#10 +
//                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind) jobkindname,                                     ' + #13#10 +
//                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty) jobdutyname,                                     ' + #13#10 +
                          '	  MOVEGUBUN,decode(MOVEGUBUN,''1'',''직군변경'',''2'',''직종변경'', ''3'',''직무군 변경'',''4'',''팀 변경'',              ' + #13#10 +
                          '                                  ''5'',''원격지 근무/복귀'',''6'',''신규입사'',''7'',''경력입사'',''8'',''단순변경'','''') movegbname,           ' + #13#10 +
                          '	  ORGNUM, DUTYDEPT, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.dutydept) dutydeptname,        ' + #13#10 +
                          '	  DEPTGUBUN,decode(DEPTGUBUN,''1'',''Staff'', ''2'',''Line'','''') deptgbname,	                                          ' + #13#10 +
                          '	  JOBPLACE, (select codename from pyccode where codeid = ''I160'' and codeno = a.JOBPLACE) jobplacename                   ' + #13#10 +
                          '  from pmpathhis a  ' + #13#10 +
                           Format('WHERE A.EMPNO     = ''%s'' ',[Ed_empno.Text]) + #13#10 +
                          ' order by dutyfrdate, seqno       ';

{          ParamVariant := 'select EMPNO, SEQNO, DUTYFRDATE, decode(trim(DUTYTODATE),null,''현재'',DUTYTODATE) DUTYTODATE, DUTYYY, DUTYMM,                  ' +#13+
                          '       case when dutyyy = 0 And dutymm = 0 And (To_Number(to_char(sysdate,''MM''))+1) >= To_Number(substr(dutyfrdate,5,2)) then ' +#13+
                          '	  to_char(to_number(To_char(sysdate,''YYYY'')) - to_number(substr(dutyfrdate,1,4)),''99'')||''년 ''||                      ' +#13+
                          '	  to_char(  MOD((to_number(To_char(sysdate,''MM'')) - to_number(substr(dutyfrdate,5,2)) + 1),12),''99'')||''개월''         ' +#13+
                          '	  else case when dutyyy = 0 And dutymm = 0 And To_char(sysdate,''MM'') < substr(dutyfrdate,4,2)  then                      ' +#13+
                          '	  to_char((to_number(To_char(sysdate,''YYYY'')) - 1 - to_number(substr(dutyfrdate,1,4))),''99'')||''년 ''||                ' +#13+
                          '	  to_char(  MOD((to_number(To_char(sysdate,''MM'')) + 13 - to_number(substr(dutyfrdate,5,2))),12),''99'')||''개월''        ' +#13+
                          '	  else  to_char(DUTYYY,''99'')||''년 ''||to_char(DUTYMM, ''99'')||''개월'' end end dutyym,                                 ' +#13+
                          '	  JOBGUN,  (select jobgunname from pmjobgun where jobgun = a.JOBgun) jobgunname,                                           ' +#13+
                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind) jobkindname,                                      ' +#13+
                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty) jobdutyname,                                      ' +#13+
                          '	  MOVEGUBUN,decode(MOVEGUBUN,''1'',''직군변경'',''2'',''직종변경'', ''3'',''직무군 변경'',''4'',''팀 변경'',               ' +#13+
                          '                                  ''5'',''원격지 근무/복귀'',''6'',''신규입사'',''7'',''경력입사'','''') movegbname,                 ' +#13+
                          '	  ORGNUM, DUTYDEPT, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.dutydept) dutydeptname,         ' +#13+
                          '	  DEPTGUBUN,decode(DEPTGUBUN,''1'',''Staff'', ''2'',''Line'','''') deptgbname,                                             ' +#13+
                          '	  JOBPLACE, (select codename from pyccode where codeid = ''I160'' and codeno = a.JOBPLACE) jobplacename                    ' +#13+
                          '  from pmpathhis a                                                                                                              ' +#13+
                          Format('WHERE A.EMPNO     = ''%s'' ',[Ed_empno.Text]) +
                          ' order by dutyfrdate, seqno       ';

}
         Close;
          ServiceName := 'PIU3010A_sel1';
          ClearFieldInfo;
          AddField('EMPNO'       , ftString,   4);
          AddField('SEQNO'       , ftInteger,  7);
          AddField('DUTYFRDATE'  , ftString,   8);
          AddField('DUTYTODATE'  , ftString,   8);
          AddField('DUTYYY'      , ftString,   3);
          AddField('DUTYMM'      , ftString,   3);
          AddField('DUTYYM'      , ftString,  18);
          AddField('JOBGUN'      , ftString,   2);
          AddField('JOBGUNNAME'  , ftString,  20);
          AddField('JOBKIND'     , ftString,   5);
          AddField('JOBKINDNAME' , ftString,  20);
          AddField('JOBDUTY'     , ftString,   8);
          AddField('JOBDUTYNAME' , ftString,  20);
          AddField('MOVEGUBUN'   , ftString,   1);
          AddField('MOVEGBNAME'  , ftString,  20);
          AddField('ORGNUM'      , ftString,   3);
          AddField('DUTYDEPT'    , ftString,   6);
          AddField('DUTYDEPTNAME', ftString,  60);
          AddField('DEPTGUBUN'   , ftString,   1);
          AddField('DEPTGBNAME'  , ftString,  10);
          AddField('JOBPLACE'    , ftString,   4);
          AddField('JOBPLACENAME', ftString,  20);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          //memo1.text :=  ParamVariant;
          Open;
          TStringField(FieldByName('DUTYFRDATE' )).EditMask := '9999년99월99일;0;';
          TStringField(FieldByName('DUTYTODATE' )).EditMask := '9999년99월99일;0;';
     end;

     Path_data;
end;

procedure TFM_Main.Path_data;
var
     ParamVariant: String;
begin
     with  Q_path1  do
     begin
          ParamVariant := 'select EMPNO,   Gubun,   SEQNO,                                                            ' +
                          '       JOBKIND, Case When writetime < ''20120101'' Then (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''N'' ) ' +
                          '       Else                                             (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'' ) ' +
                          '       End jobkindname,                                                                                                        ' +
                          '       JOBDUTY, Case When writetime < ''20120101'' Then (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''N'' ) ' +
                          '       Else                                             (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'' ) ' +
                          '       End jobdutyname,                                                                                                        ' +
//                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'') jobkindname, ' +
//                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'') jobdutyname, ' +
                          '	  nowpath, decode(nowpath,''0'',''과거'',''1'',''현재'',                              ' +
                          '                               ''2'',''차기'',''3'',''향후'','''') nowpathname             ' +
                          '  from pmpathdet a                                                                         ' +
                   Format(' WHERE A.EMPNO   = ''%s''  and gubun = 1                                  ',[Ed_empno.Text]) +
                          ' order by Gubun, nowpath, seqno                                           ';
          Close;
          ServiceName := 'PIU3010A_sel2';
          ClearFieldInfo;
          AddField('EMPNO'       , ftString,   4);
          AddField('GUBUN'       , ftInteger,  3);
          AddField('SEQNO'       , ftInteger,  7);
          AddField('JOBKIND'     , ftString,   5);
          AddField('JOBKINDNAME' , ftString,  20);
          AddField('JOBDUTY'     , ftString,   8);
          AddField('JOBDUTYNAME' , ftString,  20);
          AddField('NOWPATH'     , ftInteger,  3);
          AddField('NOWPATHNAME' , ftString,  20);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
     end;

     with  Q_path2  do
     begin
          ParamVariant := 'select EMPNO,   Gubun,   SEQNO,                                                            ' +
                          '       JOBKIND, Case When writetime < ''20120101'' Then (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''N'' ) ' +
                          '       Else                                             (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'' ) ' +
                          '       End jobkindname,                                                                                                        ' +
                          '       JOBDUTY, Case When writetime < ''20120101'' Then (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''N'' ) ' +
                          '       Else                                             (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'' ) ' +
                          '       End jobdutyname,                                                                                                        ' +
//                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'') jobkindname, ' +
//                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'') jobdutyname, ' +
                          '	  nowpath, decode(nowpath,''0'',''과거'',''1'',''현재'',                              ' +
                          '                               ''2'',''차기'',''3'',''향후'','''') nowpathname             ' +
                          '  from pmpathdet a                                                                         ' +
                   Format(' WHERE A.EMPNO   = ''%s''  and gubun = 2                                  ',[Ed_empno.Text]) +
                          ' order by Gubun, nowpath, seqno                                           ';

          Close;
          ServiceName := 'PIU3010A_sel2';
          ClearFieldInfo;
          AddField('EMPNO'       , ftString,   4);
          AddField('GUBUN'       , ftInteger,  3);
          AddField('SEQNO'       , ftInteger,  7);
          AddField('JOBKIND'     , ftString,   5);
          AddField('JOBKINDNAME' , ftString,  20);
          AddField('JOBDUTY'     , ftString,   8);
          AddField('JOBDUTYNAME' , ftString,  20);
          AddField('NOWPATH'     , ftInteger,  3);
          AddField('NOWPATHNAME' , ftString,  20);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
     end;

     with  Q_path3  do
     begin
          ParamVariant := 'select EMPNO,   Gubun,   SEQNO, ' +
                          '       JOBKIND, Case When writetime < ''20120101'' Then (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''N'' ) ' +
                          '       Else                                             (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'' ) ' +
                          '       End jobkindname,                                                                                                        ' +
                          '       JOBDUTY, Case When writetime < ''20120101'' Then (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''N'' ) ' +
                          '       Else                                             (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'' ) ' +
                          '       End jobdutyname,                                                                                                        ' +
//                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind) jobkindname, ' +
//                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty) jobdutyname, ' +
//                          '	  JOBKIND, (select jobkindname from pmjobkind where jobkind = a.jobkind and useyn = ''Y'') jobkindname, ' +
//                          '	  JOBDUTY, (select jobdutyname from pmjobduty where jobduty = a.jobduty and useyn = ''Y'') jobdutyname, ' +
                          '	  nowpath, decode(nowpath,''0'',''과거'',''1'',''현재'',                              ' +
                          '                               ''2'',''차기'',''3'',''향후'','''') nowpathname             ' +
                          '  from pmpathdet a                                                                         ' +
                   Format(' WHERE A.EMPNO   = ''%s''  and gubun = 3                                  ',[Ed_empno.Text]) +
                          ' order by Gubun, nowpath, seqno                                           ';

          Close;
          ServiceName := 'PIU3010A_sel2';
          ClearFieldInfo;
          AddField('EMPNO'       , ftString,   4);
          AddField('GUBUN'       , ftInteger,  3);
          AddField('SEQNO'       , ftInteger,  7);
          AddField('JOBKIND'     , ftString,   5);
          AddField('JOBKINDNAME' , ftString,  20);
          AddField('JOBDUTY'     , ftString,   8);
          AddField('JOBDUTYNAME' , ftString,  20);
          AddField('NOWPATH'     , ftInteger,  3);
          AddField('NOWPATHNAME' , ftString,  20);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
     end;

end;

procedure TFM_Main.Csel_Open;
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

function TFM_Main.Csel_gfd(p_loc: Integer): String;
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

procedure TFM_Main.FormShow(Sender: TObject);
var
     FL_IDate: Integer;
begin
     FM_Tmax                 := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session       := TMaxSession;

     Ed_empnoInitPopup(Self);

     Ed_empno.ButtonWidth  := 0;
     Ed_empno.Enabled      := False;
     //2014.11.27.hjku.. 이동 관리자는 모두 보이도록 수정.. 이명노M 요청
     if (Lgubun = 2) or
        (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
        (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
     begin
          Ed_empno.ButtonWidth  := 24;
          Ed_empno.Enabled      := True;
     end
     else
{
     if  Fm_EmpForm.Query1.RecordCount < 1 then
     begin
          MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
          Close;
     end;
}

     {2014.11.27.hjku.. 팝업창 내림.. 이명노M 요청
     //2014.11.13.hjku.. 5년차인 대상자에 대해 이동여부 입력받음... 이명노M 요청
     if (LMoveYN='')and(Lgubun <> 2)and(LWorkCnt=5) then
     begin
        Fm_moveform := TFm_moveform.Create(Self);
        Fm_moveform.ShowModal;
     end;
     }
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject;
     var Key: Char);
begin
     if  Key = Chr(13) then
     begin
          Ed_empnoInitPopup(Sender);
          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
          Key := #0;
     end;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
     if  Bt_save.Caption = '저장' then
     begin
          if  check = 0 then
          begin
               with TMaxDataSet do
               begin
                    ServiceName := 'PEA1060A_dml';
                    Close;
                    Sql.Clear;
                    SQL.Text  := 'insert into PMPATHMAS                                                '+
                                 '       (empno,   Answer1, Answer2, Answer3 ,Answer4,                 '+
                                 '                 Answer5, Answer6, Answer7, Answer8,                 '+
                                 '        dutytarget,                                                  '+
                                 '        Writeemp,Writetime)                                          '+
                                 'Values ('''+ Ed_empno.Text     +''','''+ Ed_Answer1.Text    +''',    '+
                                 '        '''+ Ed_Answer2.Text   +''','''+ Ed_Answer3.Text    +''',    '+
                                 '        '''+ Ed_Answer4.Text   +''','''+ Ed_Answer5.Text    +''',    '+
                                 '        '''+ Ed_Answer6.Text   +''','''+ Ed_Answer7.Text    +''',    '+
                                 '        '''+ Ed_Answer8.Text   +''','''+ ED_dutytarget.Text +''',    '+
                                 '        '''+ Pempno +''',   to_char(sysdate,''YYYYMMDDHHMISS''))';

                    Execute;
               end;
          end
          else
          begin
               with TMaxDataSet do
               begin
                    ServiceName := 'PEA1060A_dml';
                    Close;
                    Sql.Clear;
                    SQL.Text  := 'Update PMPATHMAS                                         '+
                                 '   Set Answer1   = '''+ Ed_Answer1.Text    +''',         '+
                                 '       Answer2   = '''+ Ed_Answer2.Text    +''',         '+
                                 '       Answer3   = '''+ Ed_Answer3.Text    +''',         '+
                                 '       Answer4   = '''+ Ed_Answer4.Text    +''',         '+
                                 '       Answer5   = '''+ Ed_Answer5.Text    +''',         '+
                                 '       Answer6   = '''+ Ed_Answer6.Text    +''',         '+
                                 '       Answer7   = '''+ Ed_Answer7.Text    +''',         '+
                                 '       Answer8   = '''+ Ed_Answer8.Text    +''',         '+
                                 '       dutytarget= '''+ ED_dutytarget.Text +''',         '+
                                 '       Writeemp  = '''+ Pempno          +''',            '+
                                 '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')   '+
                                 ' WHERE empno     = '''+ Ed_empno.Text +'''               ';

                    Execute;
               end;
          end;
          if  ED_seqno.Text <> '' then
               B_saveClick(Sender)
          else
               MessageDlg(BT_Save.Caption+' 작업을 완료하였습니다.', mtInformation, [mbOK], 0);
          B_cancelClick(Sender);     
     end
     else
     begin
          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'Update PMPATHMAS                                       '+
                            '   Set E1empno   = '''+ Aempno            +''',        '+
                            '       E1opinion = '''+ ED_E1opinion.Text +''',        '+
                            '       CONYN     = ''N'',                              '+
                            '       CONDATE   = to_char(sysdate,''YYYYMMDD''),      '+
                            '       E1CONYN   = ''R'',                              '+
                            '       E1CONDATE = to_char(sysdate,''YYYYMMDD''),      '+
                            '       Writeemp  = '''+ Pempno          +''',          '+
                            '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                            ' WHERE empno     = '''+ Ed_empno.Text +'''             ';

               Execute;
          end;
          BT_Save.Visible := false;
          BT_Confirm.Visible := false;
          MessageDlg(BT_Save.Caption+' 작업을 완료하였습니다.', mtInformation, [mbOK], 0);
     end;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          Ed_empno.Text           := Fm_EmpForm.empno;
          L_korname.ValueCaption  := Fm_EmpForm.Korname;
          PConyn                  := Fm_EmpForm.Conyn;
          PFinyn                  := Fm_EmpForm.Finyn;
          Select_BaseData;
     end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := Ed_empno.Text;
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Ed_empnoInitPopup(Sender);
//          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

          //2015.12.04.hjku.. 오류로 수정함.
          //Select_BaseData;
         if (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
            (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
         begin
              Select_BaseData;
         end  ;

         Key := #0;
     end;
end;

procedure TFM_Main.ConFirm_BtnVisible;
begin
     if   (PConyn = 'Y') then
     begin
          Label1.Visible            := False;
          BT_Help.Visible           := True;
          BT_Save.Visible           := False;
          BT_Confirm.Visible        := False;
          BT_Print.Visible          := True;
          BT_Exit.Visible           := True;
          B_insert.Enabled          := False;
          B_save.Enabled            := False;
          B_delete.Enabled          := False;
          B_cancel.Enabled          := False;
          ED_Answer1.ReadOnly       := True;
          ED_Answer2.ReadOnly       := True;
          ED_Answer3.ReadOnly       := True;
          ED_Answer4.ReadOnly       := True;
          ED_Answer5.ReadOnly       := True;
          ED_Answer6.ReadOnly       := True;
          ED_Answer7.ReadOnly       := True;
          ED_Answer8.ReadOnly       := True;
          ED_dutytarget.ReadOnly    := True;
          ED_E1opinion.ReadOnly     := True;

          B_insert1.Enabled         := False;
          B_save1.Enabled           := False;
          B_delete1.Enabled         := False;
          B_cancel1.Enabled         := False;
          B_insert2.Enabled         := False;
          B_save2.Enabled           := False;
          B_delete2.Enabled         := False;
          B_cancel2.Enabled         := False;
          B_insert3.Enabled         := False;
          B_save3.Enabled           := False;
          B_delete3.Enabled         := False;
          B_cancel3.Enabled         := False;

     end
     else
     begin
          Label1.Visible            := True;
          BT_Help.Visible           := True;
          BT_Save.Visible           := True;
          BT_Confirm.Visible        := True;
          BT_Print.Visible          := True;
          BT_Exit.Visible           := True;
          B_insert.Enabled          := True;
          B_save.Enabled            := False;
          B_delete.Enabled          := False;
          B_cancel.Enabled          := True;
          ED_Answer1.ReadOnly       := False;
          ED_Answer2.ReadOnly       := False;
          ED_Answer3.ReadOnly       := False;
          ED_Answer4.ReadOnly       := False;
          ED_Answer5.ReadOnly       := False;
          ED_Answer6.ReadOnly       := False;
          ED_Answer7.ReadOnly       := False;
          ED_Answer8.ReadOnly       := False;
          ED_dutytarget.ReadOnly    := False;
          ED_E1opinion.ReadOnly     := True;

          B_insert1.Enabled         := True;
          B_save1.Enabled           := False;
          B_delete1.Enabled         := False;
          B_cancel1.Enabled         := True;
          B_insert2.Enabled         := True;
          B_save2.Enabled           := False;
          B_delete2.Enabled         := False;
          B_cancel2.Enabled         := True;
          B_insert3.Enabled         := True;
          B_save3.Enabled           := False;
          B_delete3.Enabled         := False;
          B_cancel3.Enabled         := True;
     end;
     if (PFinyn = 'Y') then
     begin
          Label1.Visible            := False;
          BT_Help.Visible           := True;
          BT_Save.Visible           := False;
          BT_Confirm.Visible        := False;
          BT_Print.Visible          := True;
          BT_Exit.Visible           := True;
          B_Insert.Enabled          := False;
          B_cancel.Enabled          := False;
          ED_dutytarget.ReadOnly    := False;
          ED_E1opinion.ReadOnly     := True;
          B_Insert1.Enabled         := False;
          B_cancel1.Enabled         := False;
          B_Insert2.Enabled         := False;
          B_cancel2.Enabled         := False;
          B_Insert3.Enabled         := False;
          B_cancel3.Enabled         := False;
     end;

     BT_Save.Caption           := '저장';
     BT_Confirm.Caption        := '결재상신';

     if (LGubun = 2) and (PConyn = 'Y') and (PFinyn <> 'Y') and (Pempno <> Ed_empno.Text) then
     begin
          Label1.Visible            := False;
          BT_Help.Visible           := True;
          BT_Save.Caption           := '반려';
          BT_Save.Visible           := True;
          BT_Confirm.Caption        := '결재';
          BT_Confirm.Visible        := True;
          BT_Print.Visible          := True;
          BT_Exit.Visible           := True;
          B_Insert.Enabled          := False;
          B_cancel.Enabled          := False;
          ED_dutytarget.ReadOnly    := True;
          ED_E1opinion.ReadOnly     := False;
          B_Insert1.Enabled         := False;
          B_cancel1.Enabled         := False;
          B_Insert2.Enabled         := False;
          B_cancel2.Enabled         := False;
          B_Insert3.Enabled         := False;
          B_cancel3.Enabled         := False;
     end;
end;

procedure TFM_Main.E_EmpnoEnter(Sender: TObject);
begin
     Ed_Empno.Text             := '';
     L_korname.ValueCaption    := '';
     L_Payraname.ValueCaption  := '';
     L_deptname.ValueCaption   := '';

     BT_Help.Visible           := False;
     BT_Save.Visible           := False;
     BT_Confirm.Visible        := False;
     BT_Print.Visible          := False;
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
     if  ed_empno.Text = '' then
     begin
          MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;
{
     Label1.Visible       := False;
     BT_Help.Visible      := False;
     BT_Save.Visible      := False;
     BT_Confirm.Visible   := False;
     BT_Print.Visible     := False;
     BT_Exit.Visible      := False;

     Printer.Orientation := poLandscape;
     FM_Main.PrintScale  := poPrintToFit;
     FM_Main.Print;
     if  check = 1 then
     begin
          ConFirm_BtnVisible;
          BT_Save.Visible      := False;
          BT_Confirm.Visible   := False;
     end
     else
     begin
          ConFirm_BtnVisible;
     end;
}
     if  SB_1.BtnDown then
     begin
          with TMaxDataSet do
          begin
               SQL.Clear;
               SQL.Text := format('select count(*) SEL_DATA from pmpathmas               '+
                                  ' where empno     =''%s''                              ',[ED_empno.text])+
                                  '   And (Answer1 is not null or Answer2 is not null or '+
                                  '        Answer3 is not null or Answer4 is not null or '+
                                  '        Answer5 is not null or Answer6 is not null or '+
                                  '        Answer7 is not null                        )  ';   //or Answer8 is not null
               Close;
               ServiceName := 'PED0000A_common';
               ClearFieldInfo;
               AddField('SEL_DATA', ftInteger, 100);
               Open;
               if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger =  0 then
               begin
                    MessageDlg('자기진단서를 인쇄할 내용이 없습니다.', mtWarning, [mbOK], 0);
                    System.Exit;
               end;
               QuickRep1.Preview;
          end;
     end
     else
     if  SB_2.BtnDown then
     begin
          with TMaxDataSet do
          begin
               SQL.Clear;
               SQL.Text := format('select count(*) SEL_DATA from pmpathhis               '+
                                  ' where empno     =''%s''                              ',[ED_empno.text]);
               Close;
               ServiceName := 'PED0000A_common';
               ClearFieldInfo;
               AddField('SEL_DATA', ftInteger, 100);
               Open;
               if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger =  0 then
               begin
                    MessageDlg('직무경험을 입력하시기 바랍니다. 경력계획서에 인쇄할 내용이 없습니다.', mtWarning, [mbOK], 0);
                    System.Exit;
               end;
               QuickRep2.Preview;
          end;
     end;

end;

function TFM_Main.FL_CheckNullAnswer:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathmas                        '+
                             ' where empno     =''%s''                                       '+
                             '   and (((trim(Answer1) is null) or (LENGTH(Answer1) <2)) or   '+
                             '        ((trim(Answer2) is null) or (LENGTH(Answer2) <2)) or   '+
                             '        ((trim(Answer3) is null) or (LENGTH(Answer3) <2)) or   '+
                             '        ((trim(Answer4) is null) or (LENGTH(Answer4) <2)) or   '+
                             '        ((trim(Answer5) is null) or (LENGTH(Answer5) <2)) or   '+
                             '        ((trim(Answer6) is null) or (LENGTH(Answer6) <2)) or   '+
                             '        ((trim(Answer7) is null) or (LENGTH(Answer7) <2)))     ', { or   '+
                             '        ((trim(Answer8) is null) or (LENGTH(Answer8) <1)))     ', }
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNulldutytarget:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathmas                        '+
                             ' where ((DUTYTARGET is null) or (LENGTH(DUTYTARGET) <2))       '+
                             '   and empno     =''%s''                                       ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNullH1dutypath:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathdet                        '+
                             ' where gubun     = 1                                           '+
                             '   and empno     =''%s''                                       ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <  1 then
               Result := False
          else
               Result := True;
     end;
end;


function TFM_Main.FL_CheckNullH2dutypath:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathdet                        '+
                             ' where gubun     = 2                                           '+
                             '   and empno     =''%s''                                       ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <  1 then
               Result := False
          else
               Result := True;
     end;
end;


function TFM_Main.FL_CheckNullH3dutypath:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathdet                        '+
                             ' where gubun     = 3                                           '+
                             '   and empno     =''%s''                                       ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <  1 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckMoveGubun:Boolean; // 경력입사 등록한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pmpathhis                        '+
                             ' where Movegubun  = 7                                          '+
                             '   and empno      =''%s''                                      ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <  1 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNowpath:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(Decode(nowpath,1,1)) SEL_DATA  '+
                             '  from pmpathdet                            '+
                             ' where empno     =''%s''                    ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          //edit2.text := TMaxDataSet.FieldByName('SEL_DATA').asstring;
          
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <>  1 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNextpath:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(Decode(nowpath,2,1)) SEL_DATA  '+
                             '  from pmpathdet                            '+
                             ' where empno     =''%s''                    ',
                             [ED_empno.text]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;

          //edit3.text := TMaxDataSet.FieldByName('SEL_DATA').asstring;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger <>  1 then
               Result := False
          else
               Result := True;
     end;
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
begin
     if  BT_Confirm.Caption = '결재상신' then
     begin
          if  not FL_CheckNullAnswer then
          begin
               MessageDlg('자기진단서를 작성하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
               SB_1Click(SB_1);
               System.Exit;
          end;

          if  not FL_CheckNulldutytarget then
          begin
               MessageDlg('경력목표를 작성하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
               SB_1Click(SB_2);
               ED_dutytarget.SetFocus;
               System.Exit;
          end;

          if   FL_CheckMoveGubun   then
          begin
               if  not FL_CheckNullH3dutypath then
               begin
                    if  not FL_CheckNullH2dutypath then
                    begin
                         if  not FL_CheckNullH1dutypath then
                         begin
                              MessageDlg('탐색기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                              SB_1Click(SB_2);
                              System.Exit;
                         end
                         else
                         begin
                              MessageDlg('심화기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                              SB_1Click(SB_2);
                              System.Exit;
                         end;
                    end
                    else
                    begin
                         MessageDlg('활용기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                         SB_1Click(SB_2);
                         System.Exit;
                    end;
               end;
          end
          else
          begin
               if  not FL_CheckNullH1dutypath then
               begin
                    MessageDlg('탐색기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                    SB_1Click(SB_2);
                    System.Exit;
               end;

               if  not FL_CheckNullH2dutypath then
               begin
                    MessageDlg('심화기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                    SB_1Click(SB_2);
                    System.Exit;
               end;

               if  not FL_CheckNullH3dutypath then
               begin
                    MessageDlg('활용기의 경력경로를 선택하신 후 저장하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                    SB_1Click(SB_2);
                    System.Exit;
               end;
          end;

          if  ((not FL_CheckNowpath) or (not FL_CheckNextpath)) then
          begin
               MessageDlg('수행시기 중 현재와 차기는 IDP 작성의 기초자료로 활용되어 반드시 선택하셔야 합니다.'+#13+#13+

                          '전체 경력경로를 통틀어 현재와 차기는 각각 하나만 선택하여 저장해 주시기 바랍니다.', mtWarning, [mbOK], 0);
               SB_1Click(SB_2);
               System.Exit;
          end;

          if MessageBox(handle,PChar('결재상신을 하시면 자기진단서와 경력계획서의 등록하신 내용을 수정하실 수 없습니다.'+#13+#13+

                                     '수행시기 중 현재와 차기는 IDP 작성의 기초자료로 활용되어 반드시 확인하시고 선택 저장하셔야 합니다.'+#13+#13+

                                     '등록하신 내용에 대해 모두 확인을 마치셨으면 결재상신을 하시기 바랍니다.'+#13+#13+

                                     '결재상신을 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
          begin
               system.Exit;
          end;

          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'Update PMPATHMAS                                       '+
                            '   Set CONYN     = ''Y'',                              '+
                            '       CONDATE   = to_char(sysdate,''YYYYMMDD''),      '+
                            '       E1CONYN   = ''N'',                              '+
                            '       E1CONDATE = '''',                               '+
                            '       Writeemp  = '''+ Pempno          +''',          '+
                            '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                            ' WHERE empno     = '''+ Ed_empno.Text +'''             ';

               Execute;
               PConyn := 'Y';
          end;

//2015.12.03.hjku.. 결재 정보 막음..
if(Lgubun <> 1) then
begin

          //메일 보내기 시작
          Messagedlg('상사에게 메일을 발송합니다.',mtinformation,[mbOK],0);

          //메세지.

          //==============================================================================//
          SendProgID  := 'PIU3010A';  //프로그램 ID
          SendEmpno   := Ed_empno.Text;     //발송자(로그인 사번)
          ReceiveYN   := 'N';
          MailSubject := '['+Ed_empno.Text+'-'+ L_korname.ValueCaption +' 사원의 자기진단서 및 경력계획서 결재 요청]';
          MailBody    := '['+Ed_empno.Text+'-'+ L_korname.ValueCaption +']사원이 자기진단서 및 경력계획서 등록을 완료하였습니다. '+#13#13+
                         '자기진단서 및 경력계획서에 대하여 결재해 주시기 바랍니다. '+#13#13+
                         '[종합인사정보시스템] ▶ [인사/인력개발] ▶ [이동] ▶ 자기진단서 및 경력계획서 등록' +#13#13+
                         ' => 결재상신한 사원 선택후 경력계획서Tab의 팀장의견등록 후 결재버튼 클릭 ';
          //Test
          //RcveEmpno   := 'Z983';      //개발자.
          //Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);

          //==============================================================================//
          ////1차 평가자 메일을 보낸다.
          RcveEmpno   := Leempno;    //'Z113';
          if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
               MessageDlg('상사에게 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
          else
          begin
               MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                          '작업은 처리되었으므로    '+#13+
                          '상사께 [자기진단서 및 경력계획서 결재 요청] 메시지를 '+#13+
                          '직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
               System.Exit;
          end;
end;          

     end
     else
     if  BT_Confirm.Caption = '결재' then
     begin
          if  (trim(Ed_E1opinion.text) = '')  then
          begin
               MessageDlg('팀장의견를 작성하신 후 결재하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
               SB_1Click(SB_2);
               Ed_E1opinion.SetFocus;
               System.Exit;
          end;
          if MessageBox(handle,PChar('결재을 하시면 팀장의견 등록하신 내용을 수정하실 수 없습니다.'+#13+#13+

                                     '등록하신 내용에 대해 모두 확인을 마치셨으면 결재하시기 바랍니다.'+#13+#13+

                                     '결재하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
          begin
               system.Exit;
          end;

          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'Update PMPATHMAS                                       '+
                            '   Set E1empno   = '''+ Aempno            +''',        '+
                            '       E1opinion = '''+ ED_E1opinion.Text +''',        '+
                            '       E1CONYN   = ''Y'',                              '+
                            '       E1CONDATE = to_char(sysdate,''YYYYMMDD''),      '+
                            '       Writeemp  = '''+ Pempno            +''',        '+
                            '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                            ' WHERE empno     = '''+ Ed_empno.Text +'''             ';

               Execute;
               PFinyn := 'Y';
          end;

     end;
     MessageDlg(BT_Confirm.Caption+' 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
     ConFirm_BtnVisible;
end;

procedure TFM_Main.ED_Answer1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer1.text, 1, Length(Ed_Answer1.text)-1);
          Ed_Answer1.Clear;
          Ed_Answer1.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer2.text, 1, Length(Ed_Answer2.text)-1);
          Ed_Answer2.Clear;
          Ed_Answer2.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer3.text, 1, Length(Ed_Answer3.text)-1);
          Ed_Answer3.Clear;
          Ed_Answer3.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer4.text, 1, Length(Ed_Answer4.text)-1);
          Ed_Answer4.Clear;
          Ed_Answer4.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer5.text, 1, Length(Ed_Answer5.text)-1);
          Ed_Answer5.Clear;
          Ed_Answer5.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer6.text, 1, Length(Ed_Answer6.text)-1);
          Ed_Answer6.Clear;
          Ed_Answer6.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer7.text, 1, Length(Ed_Answer7.text)-1);
          Ed_Answer7.Clear;
          Ed_Answer7.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_Answer8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(Ed_Answer8.text, 1, Length(Ed_Answer8.text)-1);
          Ed_Answer8.Clear;
          Ed_Answer8.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.ED_dutytargetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(ED_dutytarget.text, 1, Length(ED_dutytarget.text)-1);
          ED_dutytarget.Clear;
          ED_dutytarget.Lines.Append(ViewText);
     end;
end;


procedure TFM_Main.ED_E1opinionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(ED_E1opinion.text, 1, Length(ED_E1opinion.text)-1);
          ED_E1opinion.Clear;
          ED_E1opinion.Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
     SB_1.BtnDown  := False;
     SB_2.BtnDown  := False;
     SB_1.Font.Color := clWhite;
     SB_2.Font.Color := clWhite;

     TOnSkinButton(Sender).BtnDown := True;
//     TOnSkinButton(Sender).Font.Color := clBlack;
     if TOnSkinButton(Sender).Name = 'SB_1' then
     begin

     end
     else if TOnSkinButton(Sender).Name = 'SB_2' then
     begin

     end;
     NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TFM_Main.Ed_jobgunCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
var
     FL_Text : String;
begin
     FL_Text := TOnWinPopupEdit(Sender).Text;
     if  Accept then
     begin
          TOnWinPopupEdit(Sender).Text := FM_JOBGUN.FG_JOBGUNNAME;
          TOnWinPopupEdit(Sender).Hint := FM_JOBGUN.FG_JOBGUN;
          Accept := False;
     end;
     TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.Ed_jobgunInitPopup(Sender: TObject);
begin
     FM_JOBGUN               := TFM_pmJOBGUN.Create(Self);
     FM_JOBGUN.Insa_Session  := TmaxSession;
     FM_JOBGUN.BE_key.Text   := Ed_jobgun.text;;
     TOnWinPopupEdit(Sender).PopupControl := FM_JOBGUN;
     FM_JOBGUN.Edit          := TOnWinPopupEdit(Sender);
     FM_JOBGUN.PL_Init;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     FM_JOBGUN.free;
     FM_JOBKIND.free;
     FM_JOBDUTY.free;
     FM_DUTYDEPT.free;
end;

procedure TFM_Main.Ed_jobkindCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
     FL_Text : String;
begin
     FL_Text := TOnWinPopupEdit(Sender).Text;
     if  Accept then
     begin
          TOnWinPopupEdit(Sender).Text := FM_JOBKIND.FG_JOBKINDNAME;
          TOnWinPopupEdit(Sender).Hint := FM_JOBKIND.FG_JOBKIND;
          Accept := False;
     end;
     TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.Ed_jobkindInitPopup(Sender: TObject);
begin
     FM_JOBKIND               := TFM_pmJOBKIND.Create(Self);
     FM_JOBKIND.Insa_Session  := TmaxSession;
     FM_JOBKIND.FG_JOBGUN     := Ed_jobgun.Hint;
     FM_JOBKIND.BE_key.Text   := Ed_jobKIND.text;
     FM_JOBKIND.FG_JOBKINDYY  := copy(Ed_DutyfrDate.Text,1,4);
     TOnWinPopupEdit(Sender).PopupControl := FM_JOBKIND;
     FM_JOBKIND.Edit          := TOnWinPopupEdit(Sender);
     FM_JOBKIND.PL_Init;
end;

procedure TFM_Main.Ed_jobkindEnter(Sender: TObject);
begin
     if Ed_jobgun.Hint = '' then
     begin
          Messagedlg('직군을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
          ed_jobgun.setfocus;
          system.exit;
     end;
end;

procedure TFM_Main.Ed_jobgunChange(Sender: TObject);
begin
     Ed_jobKIND.text := '';
     Ed_jobKIND.hint := '';
     Ed_jobDUTY.text := '';
     Ed_jobDUTY.hint := '';
end;

procedure TFM_Main.ED_jobdutyCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
     FL_Text : String;
begin
     FL_Text := TOnWinPopupEdit(Sender).Text;
     if  Accept then
     begin
          TOnWinPopupEdit(Sender).Text := FM_JOBDUTY.FG_JOBDUTYNAME;
          TOnWinPopupEdit(Sender).Hint := FM_JOBDUTY.FG_JOBDUTY;
          Accept := False;
     end;
     TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.ED_jobdutyInitPopup(Sender: TObject);
begin
     FM_JOBDUTY               := TFM_pmJOBDUTY.Create(Self);
     FM_JOBDUTY.Insa_Session  := TmaxSession;
     FM_JOBDUTY.FG_JOBGUN     := Ed_jobgun.Hint;
     FM_JOBDUTY.FG_JOBKIND    := Ed_jobkind.Hint;
     FM_JOBDUTY.BE_key.Text   := Ed_jobduty.text;
     FM_JOBDUTY.FG_JOBKINDYY  := copy(Ed_DutyfrDate.Text,1,4);
     TOnWinPopupEdit(Sender).PopupControl := FM_JOBDUTY;
     FM_JOBDUTY.Edit          := TOnWinPopupEdit(Sender);
     FM_JOBDUTY.PL_Init;
end;

procedure TFM_Main.Ed_jobkindChange(Sender: TObject);
begin
     Ed_jobDUTY.text := '';
     Ed_jobDUTY.hint := '';
end;

procedure TFM_Main.ED_jobdutyEnter(Sender: TObject);
begin
     if Ed_jobgun.Hint = '' then
     begin
          Messagedlg('직군을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
          ed_jobgun.setfocus;
          system.exit;
     end;
     if Ed_jobkind.Hint = '' then
     begin
          Messagedlg('직종을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
          ed_jobkind.setfocus;
          system.exit;
     end;
end;

procedure TFM_Main.ED_jobkind1InitPopup(Sender: TObject);
begin
     FM_JOBKIND               := TFM_pmJOBKIND.Create(Self);
     FM_JOBKIND.Insa_Session  := TmaxSession;
     case TComponent(Sender).Tag of
          1: FM_JOBKIND.BE_key.Text   := Ed_jobKIND1.text;
          2: FM_JOBKIND.BE_key.Text   := Ed_jobKIND2.text;
          3: FM_JOBKIND.BE_key.Text   := Ed_jobKIND3.text;
     end;
     TOnWinPopupEdit(Sender).PopupControl := FM_JOBKIND;
     FM_JOBKIND.Edit          := TOnWinPopupEdit(Sender);
     FM_JOBKIND.PL_Init;
end;

procedure TFM_Main.ED_jobduty1InitPopup(Sender: TObject);
begin
     FM_JOBDUTY               := TFM_pmJOBDUTY.Create(Self);
     FM_JOBDUTY.Insa_Session  := TmaxSession;
     case TComponent(Sender).Tag of
          1: begin
                  FM_JOBDUTY.FG_JOBKIND    := Ed_jobkind1.Hint;
                  FM_JOBDUTY.BE_key.Text   := Ed_jobduty1.text;
             end;
          2: begin
                  FM_JOBDUTY.FG_JOBKIND    := Ed_jobkind2.Hint;
                  FM_JOBDUTY.BE_key.Text   := Ed_jobduty2.text;
             end;
          3: begin
                  FM_JOBDUTY.FG_JOBKIND    := Ed_jobkind3.Hint;
                  FM_JOBDUTY.BE_key.Text   := Ed_jobduty3.text;
             end;
     end;
     TOnWinPopupEdit(Sender).PopupControl := FM_JOBDUTY;
     FM_JOBDUTY.Edit          := TOnWinPopupEdit(Sender);
     FM_JOBDUTY.PL_Init;
end;

procedure TFM_Main.ED_jobduty1Enter(Sender: TObject);
begin
     case TComponent(Sender).Tag of
          1: begin
                  if Ed_jobkind1.Hint = '' then
                  begin
                       Messagedlg('탐색기의 경험/희망하는 직종을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
                       Ed_jobkind1.setfocus;
                       system.exit;
                  end;
             end;
          2: begin
                  if Ed_jobkind2.Hint = '' then
                  begin
                       Messagedlg('심화기의 경험/희망하는 직종을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
                       Ed_jobkind2.setfocus;
                       system.exit;
                  end;
             end;
          3: begin
                  if Ed_jobkind3.Hint = '' then
                  begin
                       Messagedlg('활용기의 경험/희망하는 직종을 먼저 선택하셔야 합니다.',mtError,[mbOK],0);
                       Ed_jobkind3.setfocus;
                       system.exit;
                  end;
             end;
     end;
end;

procedure TFM_Main.ED_jobkind1Change(Sender: TObject);
begin
     case TComponent(Sender).Tag of
          1:begin
                 Ed_jobDUTY1.text := '';
                 Ed_jobDUTY1.hint := '';
            end;
          2:begin
                 Ed_jobDUTY2.text := '';
                 Ed_jobDUTY2.hint := '';
            end;
          3:begin
                 Ed_jobDUTY3.text := '';
                 Ed_jobDUTY3.hint := '';
            end;
     end;
end;

procedure TFM_Main.B_cancelClick(Sender: TObject);
begin
//     case TComponent(Sender).Tag of
//          0 : begin
                   ED_seqno.Text          := '';
                   ED_dutyfrdate.Text     := '';
                   ED_dutytodate.Text     := '';
                   Ed_jobgun.Text         := '';
                   Ed_jobgun.Hint         := '';
                   Ed_jobkind.Text        := '';
                   Ed_jobkind.Hint        := '';
                   Ed_jobduty.Text        := '';
                   Ed_jobduty.Hint        := '';
                   Ed_movegubun.ItemIndex := -1;
                   P_dutyym.ValueCaption  := '';
                   P_orgnum.ValueCaption  := '';
                   Ed_dutydept.text       := '';
                   Ed_dutydept.Hint       := '';
                   Ed_deptgubun.ItemIndex := -1;
                   ED_jobplace.Text       := '';
                   ED_jobplace.Codeno     := '';
                   Edit_Enabled(0,False);
//              end;
//          1,2,3 :
//              begin
                   E_seqno.Text           := '';
                   Ed_jobkind1.Text       := '';
                   Ed_jobkind1.Hint       := '';
                   Ed_jobduty1.Text       := '';
                   Ed_jobduty1.Hint       := '';
                   Ed_Nowpath1.itemindex  := -1;
                   Edit_Enabled(1,False);

                   Ed_jobkind2.Text       := '';
                   Ed_jobkind2.Hint       := '';
                   Ed_jobduty2.Text       := '';
                   Ed_jobduty2.Hint       := '';
                   Ed_Nowpath2.itemindex  := -1;
                   Edit_Enabled(2,False);

                   Ed_jobkind3.Text       := '';
                   Ed_jobkind3.Hint       := '';
                   Ed_jobduty3.Text       := '';
                   Ed_jobduty3.Hint       := '';
                   Ed_Nowpath3.itemindex  := -1;
                   Edit_Enabled(3,False);
//              end;
//     end;
     Ed_DutyTarget.Lines.Clear;
     Ed_E1opinion.Lines.Clear;
     Read_data;
end;

procedure TFM_Main.B_saveClick(Sender: TObject);
var  Flag, Chk : integer;
begin
     case TComponent(Sender).Tag of
          0 : begin
                   if  trim(Ed_seqno.text) = '' then
                   begin
                        MessageDlg('순번이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_DutyfrDate.SetFocus;
                        Exit;
                   end;

                   if  trim(ED_dutyfrdate.text) = '' then
                   begin
                        MessageDlg('근무시작일이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_DutyfrDate.SetFocus;
                        Exit;
                   end;

                   if  trim(Ed_movegubun.text) = '' then
                   begin
                        MessageDlg('이동구분이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_movegubun.SetFocus;
                        Exit;
                   end;

                   if  trim(Ed_deptgubun.text) = '' then
                   begin
                        MessageDlg('부서구분이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_deptgubun.SetFocus;
                        Exit;
                   end;

                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := 'select count(*) SEL_DATA from pmpathhis                        '+
                                    ' where empno     ='''+ ED_empno.text +'''                      '+
                                    '   and seqno     ='  + Ed_seqno.text +  '                      ';
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftInteger, 100);
                        Open;
                        Flag        := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;
                   end;

                   if  Flag = 0 then
                   begin
                        with TMaxDataSet do
                        begin
                             ServiceName := 'PEA1060A_dml';
                             Close;
                             Sql.Clear;
                             SQL.Text  := 'insert into pmpathhis                                                   '+
                                          '       (empno,    seqno,     dutyfrdate, dutytodate, dutyyy,            '+
                                          '        dutymm,   jobgun,    jobkind,    jobduty,    movegubun,         '+
                                          '        orgnum,   dutydept,  deptgubun,  jobplace,                      '+
                                          '        Writeemp, Writetime                                           ) '+
                                          'Values ('''+ Ed_empno.Text     +''',  '+ Ed_seqno.Text           +  ',  '+
                                          '        '''+ ED_dutyfrdate.Text+''','''+ Ed_dutytodate.Text      +''',  '+
                                          '        '+ P_dutyyy.ValueCaption +',  '+ P_dutymm.ValueCaption   +  ',  '+
                                          '        '''+ Ed_jobgun.hint    +''','''+ Ed_jobkind.hint         +''',  '+
                                          '        '''+ Ed_jobduty.hint   +''',                                    '+
                                          '        '''+ ED_movegubun.Keyitems[ED_movegubun.itemindex]       +''',  '+
                                          '        '''+ P_orgnum.ValueCaption  +''','''+ Ed_dutydept.hint   +''',  '+
                                          '        '''+ ED_deptgubun.Keyitems[ED_deptgubun.itemindex]       +''',  '+
                                          '        '''+ Ed_jobplace.codeno  +''',                                  '+
                                          '        '''+ Pempno +''',   to_char(sysdate,''YYYYMMDDHHMISS'')       ) ';

                             Execute;
                        end;
                   end
                   else
                   begin
                        with TMaxDataSet do
                        begin
                             ServiceName := 'PEA1060A_dml';
                             Close;
                             Sql.Clear;
                             SQL.Text  := 'Update pmpathhis                                                            '+
                                          '   Set dutyfrdate= '''+ ED_dutyfrdate.Text    +''',                         '+
                                          '       dutytodate= '''+ Ed_dutytodate.Text    +''',                         '+
                                          '       dutyyy    = '+ P_dutyyy.ValueCaption   +'  ,                         '+
                                          '       dutymm    = '+ P_dutymm.ValueCaption   +'  ,                         '+
                                          '       jobgun    = '''+ Ed_jobgun.hint        +''',                         '+
                                          '       jobkind   = '''+ Ed_jobkind.hint       +''',                         '+
                                          '       jobduty   = '''+ Ed_jobduty.hint       +''',                         '+
                                          '       movegubun = '''+ ED_movegubun.Keyitems[ED_movegubun.itemindex]+''',  '+
                                          '       orgnum    = '''+ P_orgnum.ValueCaption +''',                         '+
                                          '       dutydept  = '''+ Ed_dutydept.hint      +''',                         '+
                                          '       deptgubun = '''+ ED_deptgubun.Keyitems[ED_deptgubun.itemindex]+''',  '+
                                          '       jobplace  = '''+ Ed_jobplace.codeno    +''',                         '+
                                          '       Writeemp  = '''+ Pempno                +''',                         '+
                                          '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')                      '+
                                          ' WHERE empno     = '''+ Ed_empno.Text         +'''                          '+
                                          '   AND seqno     = '  + Ed_seqno.Text         +  '                          ';
                             Execute;
                        end;
                   end;
                   MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
                   Grid_data;
                   Q_Grid.Locate('empno,seqno',vararrayof([Ed_empno.Text,strtoint(Ed_seqno.Text)]),[]);
                   B_cancelClick(Sender);
              end;
          1,2,3 :
              begin
                   if  trim(E_seqno.text) = '' then
                   begin
                        MessageDlg('순번이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if  ((TComponent(Sender).Tag = 1) And (trim(ED_jobkind1.text) = '')) or
                       ((TComponent(Sender).Tag = 2) And (trim(ED_jobkind2.text) = '')) or
                       ((TComponent(Sender).Tag = 3) And (trim(ED_jobkind3.text) = '')) then
                   begin
                        MessageDlg('경험/희망하는 직종이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if  ((TComponent(Sender).Tag = 1) And (trim(ED_jobduty1.text) = '')) or
                       ((TComponent(Sender).Tag = 2) And (trim(ED_jobduty2.text) = '')) or
                       ((TComponent(Sender).Tag = 3) And (trim(ED_jobduty3.text) = '')) then
                   begin
                        MessageDlg('경험/희망하는 직무군이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select count(*) SEL_DATA from pmpathdet                        '+
                                           ' where empno     =''%s''                                       '+
                                           '   and gubun     =''%d''                                       '+
                                           '   and seqno     ='+ E_seqno.text +'                           ',
                                           [ED_empno.text, TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftInteger, 100);
                        Open;
                        Flag        := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

                        SQL.Clear;
                        SQL.Text := format('select count(*) SEL_DATA from pmpathdet '+
                                           ' where empno     =''%s''                '+
                                           '   and nowpath   =''1''                 ',
                                           [ED_empno.text]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftInteger, 100);
                        Open;

                        Chk := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

                        if (Chk > 1) then
                        begin
                           MessageDlg('등록된 수행시기(현재)가 존재합니다. ' +#13 + '수행시기(현재)는 한건만 입력이 가능합니다.',mtError,[mbOK],0);
                           Exit;
                        end;
                   end;

                   if  Flag = 0 then
                   begin
                        with TMaxDataSet do
                        begin
                             ServiceName := 'PEA1060A_dml';
                             Close;
                             Sql.Clear;
                             SQL.Add('insert into pmpathdet                                                   ');
                             SQL.Add('       (empno,    seqno,     gubun,     jobkind,    jobduty,    nowpath,');
                             SQL.Add('        Writeemp, Writetime                                           ) ');
                             SQL.Add('Values ('''+ Ed_empno.Text     +''',  '  + E_seqno.Text          +  ',  ');
                             SQL.Add('        '''+ inttoStr(TComponent(Sender).Tag)+''',                      ');
                             if TComponent(Sender).Tag = 1 then
                             begin
                                  SQL.Add('   '''+ Ed_jobkind1.hint  +''',  '''+ Ed_jobduty1.hint      +''',  ');
                                  SQL.Add('   '''+ ED_nowpath1.Keyitems[ED_nowpath1.itemindex]         +''',  ');
                             end
                             else
                             if TComponent(Sender).Tag = 2 then
                             begin
                                  SQL.Add('   '''+ Ed_jobkind2.hint  +''',  '''+ Ed_jobduty2.hint      +''',  ');
                                  SQL.Add('   '''+ ED_nowpath2.Keyitems[ED_nowpath2.itemindex]         +''',  ');
                             end
                             else
                             if TComponent(Sender).Tag = 3 then
                             begin
                                  SQL.Add('   '''+ Ed_jobkind3.hint  +''',  '''+ Ed_jobduty3.hint      +''',  ');
                                  SQL.Add('   '''+ ED_nowpath3.Keyitems[ED_nowpath3.itemindex]         +''',  ');
                             end;
                             SQL.Add('        '''+ Pempno +''',   to_char(sysdate,''YYYYMMDDHHMISS'')       ) ');

                             Execute;
                        end;
                   end
                   else
                   begin
                        with TMaxDataSet do
                        begin
                             ServiceName := 'PEA1060A_dml';
                             Close;
                             Sql.Clear;
                             SQL.Add('    Update pmpathdet                                                          ');
                             if TComponent(Sender).Tag = 1 then
                             begin
                                  SQL.Add('  Set jobkind   = '''+ Ed_jobkind1.hint      +''',                       ');
                                  SQL.Add('      jobduty   = '''+ Ed_jobduty1.hint      +''',                       ');
                                  SQL.Add('      nowpath   = '''+ ED_nowpath1.Keyitems[ED_nowpath1.itemindex]+''',  ');
                             end
                             else
                             if TComponent(Sender).Tag = 2 then
                             begin
                                  SQL.Add('  Set jobkind   = '''+ Ed_jobkind2.hint      +''',                       ');
                                  SQL.Add('      jobduty   = '''+ Ed_jobduty2.hint      +''',                       ');
                                  SQL.Add('      nowpath   = '''+ ED_nowpath2.Keyitems[ED_nowpath2.itemindex]+''',  ');
                             end
                             else
                             if TComponent(Sender).Tag = 3 then
                             begin
                                  SQL.Add('  Set jobkind   = '''+ Ed_jobkind3.hint      +''',                       ');
                                  SQL.Add('      jobduty   = '''+ Ed_jobduty3.hint      +''',                       ');
                                  SQL.Add('      nowpath   = '''+ ED_nowpath3.Keyitems[ED_nowpath3.itemindex]+''',  ');
                             end;
                             SQL.Add('           Writeemp  = '''+ Pempno                +''',                       ');
                             SQL.Add('           Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')                    ');
                             SQL.Add('     WHERE empno     = '''+ Ed_empno.Text         +'''                        ');
                             SQL.Add('       AND gubun     = '''+ inttoStr(TComponent(Sender).Tag)+'''              ');
                             SQL.Add('       AND seqno     = '  + E_seqno.Text          +  '                        ');
                             Execute;
                        end;
                   end;
                   MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
                   Path_data;
                   B_cancelClick(Sender);
              end;
     end;
end;

procedure TFM_Main.ED_dutyfrdateExit(Sender: TObject);
var
     frDate,  toDate: Double;
     iTempYYMM: Integer;
begin
     if  Trim(Ed_DutyfrDate.Text) <> '' then
     begin
          if  Length(Trim(Ed_DutyfrDate.Text)) < 8 then
          begin
               MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
               Ed_DutyfrDate.SetFocus;
               Exit;
          end;

          if  copy(vSysdate,1,8) <  Trim(Ed_DutyfrDate.Text) then
          begin
               MessageDlg('시작일이 현재보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
               Ed_DutyfrDate.SetFocus;
               Exit;
          end;

          TRY
               frDate := kpaylib.to_date(Ed_DutyfrDate.Text,'YYYYMMDD');
          EXCEPT
               MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
               Ed_DutyfrDate.SetFocus;
               Exit;
          END;
          if  Trim(Ed_DutytoDate.Text) = '' then
          begin
               iTempYYMM := Months_Between(copy(Ed_DutyfrDate.Text,1,8), Copy(vSysDate,1,8));  // datelib

               P_dutyym.ValueCaption  := IntToStr(iTempYYMM div 12) +'년 ' + IntToStr(iTempYYMM mod 12) + '개월';
               P_DutyYY.ValueCaption  := '0';
               P_DutyMM.ValueCaption  := '0';
          end
          else
          begin
               if  Length(Trim(Ed_DutytoDate.Text)) < 8 then
               begin
                    MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                    Ed_DutytoDate.SetFocus;
                    Exit;
               end;

               if  (Ed_DutyfrDate.Text > Ed_DutytoDate.Text) then
               begin
                    MessageDlg('시작일이 종료일보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
                    Ed_DutyfrDate.SetFocus;
                    Exit;
               end;

               TRY
                    frDate := kpaylib.to_date(Ed_DutyfrDate.Text,'YYYYMMDD');
                    toDate := kpaylib.to_date(Ed_DutytoDate.Text,'YYYYMMDD');
               EXCEPT
                    MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                    Ed_DutytoDate.SetFocus;
                    Exit;
               END;

               iTempYYMM := Months_Between(copy(Ed_DutyfrDate.Text,1,8),  Copy(Ed_DutytoDate.Text,1,8));  // datelib

               P_dutyym.ValueCaption  := format('%3s',[IntToStr(iTempYYMM div 12)]) +'년 ' +  format('%3s',[IntToStr(iTempYYMM mod 12)])+ '개월';
               P_DutyYY.ValueCaption  := IntToStr(iTempYYMM div 12);
               P_DutyMM.ValueCaption  := IntToStr(iTempYYMM mod 12);

          end;
     end;
end;

procedure TFM_Main.ED_dutytodateExit(Sender: TObject);
var
     frDate, toDate: Double;
     iTempYYMM: Integer;
begin
     if  copy(vSysdate,1,8) <  Trim(Ed_DutytoDate.Text) then
     begin
          MessageDlg('종료일이 현재보다 큽니다. 다시 입력하십시오'+#13#13+
                     '현재 근무종료일자는 입력하지 마십시오. 자동계산됩니다.',mtError,[mbOK],0);
          Ed_DutytoDate.SetFocus;
          Exit;
     end;

     if  copy(vSysdate,1,8) = Trim(Ed_DutytoDate.Text) then
     begin
          MessageDlg('현재 근무종료일자는 입력하지 마십시오. 자동계산됩니다.',mtInformation,[mbOK],0);
          Ed_DutytoDate.text := '';
     end;

     if  Trim(Ed_DutytoDate.Text) = '' then
     begin
          iTempYYMM := Months_Between(copy(Ed_DutyfrDate.Text,1,8), Copy(vSysDate,1,8));  // datelib

          P_dutyym.ValueCaption  := IntToStr(iTempYYMM div 12) +'년 ' + IntToStr(iTempYYMM mod 12) + '개월';
          P_DutyYY.ValueCaption  := '0';
          P_DutyMM.ValueCaption  := '0';
     end
     else
     begin
          if  Length(Trim(Ed_DutytoDate.Text)) < 8 then
          begin
               MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
               Ed_DutytoDate.SetFocus;
               Exit;
          end;

          if  (Ed_DutyfrDate.Text > Ed_DutytoDate.Text) then
          begin
               MessageDlg('시작일이 종료일보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
               Ed_DutyfrDate.SetFocus;
               Exit;
          end;

          TRY
               frDate := kpaylib.to_date(Ed_DutyfrDate.Text,'YYYYMMDD');
               toDate := kpaylib.to_date(Ed_DutytoDate.Text,'YYYYMMDD');
          EXCEPT
               MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
               Ed_DutytoDate.SetFocus;
               Exit;
          END;

          iTempYYMM := Months_Between(copy(Ed_DutyfrDate.Text,1,8),  Copy(Ed_DutytoDate.Text,1,8));  // datelib

          P_dutyym.ValueCaption  := format('%3s',[IntToStr(iTempYYMM div 12)]) +'년 ' +  format('%3s',[IntToStr(iTempYYMM mod 12)])+ '개월';
          P_DutyYY.ValueCaption  := IntToStr(iTempYYMM div 12);
          P_DutyMM.ValueCaption  := IntToStr(iTempYYMM mod 12);

     end;
end;

function TFM_Main.Months_Between(mFrdate, mTodate: String): Integer;
var
     iFyy, iFmm, iFdd, iTyy, iTmm, iTdd: Integer;
begin
     iTyy := StrToIntDef(copy(mTodate,1,4),0);
     iTmm := StrToIntDef(copy(mTodate,5,2),0);
     iTdd := StrToIntDef(copy(mTodate,7,2),0);
     iFyy := StrToIntDef(copy(mFrdate,1,4),0);
     iFmm := StrToIntDef(copy(mFrdate,5,2),0);
     iFdd := StrToIntDef(copy(mFrdate,7,2),0);

     if  iTdd >= iFdd then
     begin
         if (iTdd - iFdd) >= 16 then
             Result := (iTyy - iFyy) * 12 + (iTmm - iFmm) + 1
         else
             Result := (iTyy - iFyy) * 12 + (iTmm - iFmm) ;
     end
     else
     begin
         if (iTdd + 30 - iFdd) >= 16 then
             Result := (iTyy - iFyy) * 12 + (iTmm - iFmm)
         else
             Result := (iTyy - iFyy) * 12 + (iTmm - iFmm) - 1;
     end;
end;

procedure TFM_Main.B_insertClick(Sender: TObject);
begin
     B_cancelClick(Sender);
     case TComponent(Sender).Tag of
          0 : begin
                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select nvl(max(seqno),0)+1 SEL_DATA from pmpathhis '+
                                           ' where empno =''%s''             ', [ED_empno.text]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftString, 100);
                        Open;
                        Ed_seqno.text := TMaxDataSet.FieldByName('SEL_DATA').AsString;
                   end;
                   Edit_Enabled(0,True);
                   ED_dutyfrdate.SetFocus;
              end;
          1,2,3 :
              begin
                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select Count(seqno) SEL_DATA from pmpathdet '+
                                           ' where empno =''%s''             '+
                                           '   and gubun =''%d''             ', [ED_empno.text,TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftString, 100);
                        Open;
                        if  TMaxDataSet.FieldByName('SEL_DATA').AsString = '7' then
                        begin
                             case TComponent(Sender).Tag of
                                  1: MessageDlg('탐색기의 경력경로는 7개까지만 등록이 가능합니다.', mtWarning, [mbOK], 0);
                                  2: MessageDlg('심화기의 경력경로는 7개까지만 등록이 가능합니다.', mtWarning, [mbOK], 0);
                                  3: MessageDlg('활용기의 경력경로는 7개까지만 등록이 가능합니다.', mtWarning, [mbOK], 0);
                             end;
                             System.Exit;
                        end;
                   end;

                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select nvl(max(seqno),0)+1 SEL_DATA from pmpathdet '+
                                           ' where empno =''%s''             '+
                                           '   and gubun =''%d''             ', [ED_empno.text,TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftString, 100);
                        Open;
                        E_seqno.text := TMaxDataSet.FieldByName('SEL_DATA').AsString;
                   end;
                   Edit_Enabled(TComponent(Sender).Tag,True);
                   case TComponent(Sender).Tag of
                        1: ED_jobkind1.SetFocus;
                        2: ED_jobkind2.SetFocus;
                        3: ED_jobkind3.SetFocus;
                   end;
              end;
     end;
end;

procedure TFM_Main.Edit_Enabled(Ttag : integer; TFlag : Boolean);
begin
     case Ttag of
          0 : begin
                   ED_seqno.Enabled      := TFlag;
                   ED_dutyfrdate.Enabled := TFlag;
                   ED_dutytodate.Enabled := TFlag;
                   Ed_jobgun.Enabled     := TFlag;
                   Ed_jobkind.Enabled    := TFlag;
                   Ed_jobduty.Enabled    := TFlag;
                   Ed_movegubun.Enabled  := TFlag;
                   Ed_dutydept.Enabled   := TFlag;
                   Ed_deptgubun.Enabled  := TFlag;
                   ED_jobplace.Enabled   := TFlag;
                   B_save.Enabled        := TFlag;
                   B_delete.Enabled      := TFlag;
                   if ((PConyn = 'Y')  and  (TFlag = False)) then
                   B_insert.Enabled      := False
                   else
                   B_insert.Enabled      := not TFlag;

              end;
          1 : begin
                   E_seqno.Enabled       := TFlag;
                   ED_jobkind1.Enabled   := TFlag;
                   ED_jobduty1.Enabled   := TFlag;
                   ED_nowpath1.Enabled   := TFlag;
                   B_save1.Enabled       := TFlag;
                   B_delete1.Enabled     := TFlag;
                   if ((PConyn = 'Y')  and  (TFlag = False)) then
                   B_insert1.Enabled     := False
                   else
                   B_insert1.Enabled     := not TFlag;
              end;
          2 : begin
                   E_seqno.Enabled       := TFlag;
                   ED_jobkind2.Enabled   := TFlag;
                   ED_jobduty2.Enabled   := TFlag;
                   ED_nowpath2.Enabled   := TFlag;
                   B_save2.Enabled       := TFlag;
                   B_delete2.Enabled     := TFlag;
                   if ((PConyn = 'Y')  and  (TFlag = False)) then
                   B_insert2.Enabled     := False
                   else
                   B_insert2.Enabled     := not TFlag;
              end;
          3 : begin
                   E_seqno.Enabled       := TFlag;
                   ED_jobkind3.Enabled   := TFlag;
                   ED_jobduty3.Enabled   := TFlag;
                   ED_nowpath3.Enabled   := TFlag;
                   B_save3.Enabled       := TFlag;
                   B_delete3.Enabled     := TFlag;
                   if ((PConyn = 'Y')  and  (TFlag = False)) then
                   B_insert3.Enabled     := False
                   else
                   B_insert3.Enabled     := not TFlag;
              end;
     end;
end;

procedure TFM_Main.BT_annoClick(Sender: TObject);
var   FG_Date : String;
begin
     if  length(Ed_empno.Text) < 4  then
     begin
          MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
          System.Exit;
     end;

     Try
          AnnoForm  := TAnnoForm.Create(Self);
          AnnoForm.L_emp.ValueCaption     := ED_empno.Text +' - '+L_korname.ValueCaption;

          FM_Tmax           := TFM_Tmax.Create(Self);
          FM_Tmax.T_Session := TMaxSession;
          FG_Date           := FM_Tmax.GetData('empdate',ED_empno.Text,'');
          AnnoForm.ED_Date1.NoFormatDate  := FG_Date;

          FM_Tmax           := TFM_Tmax.Create(Self);
          FM_Tmax.T_Session := TMaxSession;
          FG_Date           := FM_Tmax.GetData('sysdate','','');
          AnnoForm.ED_Date2.NoFormatDate  := FG_Date;

          AnnoForm.ShowModal;
     Finally
          AnnoForm.Free;
     End;
end;

procedure TFM_Main.Ed_dutydeptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
     FL_Text : String;
begin
     FL_Text := TOnWinPopupEdit(Sender).Text;
     if Accept then
     begin
          Ed_dutydept.Text      := FM_DUTYDEPT.FG_DEPTNAME;
          Ed_dutydept.Hint      := FM_DUTYDEPT.FG_DEPTCODE;
          P_orgnum.ValueCaption := FM_DUTYDEPT.FG_ORGNUM;
          Accept := False;
     end;
     TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.Ed_dutydeptInitPopup(Sender: TObject);
begin
     FM_DUTYDEPT               := TFM_DeptEdit.Create(Self);
     FM_DUTYDEPT.Insa_Session  := TmaxSession;
     FM_DUTYDEPT.BE_org.Text   := P_orgnum.ValueCaption;
     FM_DUTYDEPT.BE_key.Text   := Ed_Dutydept.Text;
     TOnWinPopupEdit(Sender).PopupControl := FM_DUTYDEPT;
     FM_DUTYDEPT.Edit          := TOnWinPopupEdit(Sender);
     FM_DUTYDEPT.PL_Init;
end;

procedure TFM_Main.Ed_jobgunClick(Sender: TObject);
begin
     Ed_jobgunInitPopup(Sender);
     Ed_jobgun.Perform(WM_KEYDOWN, VK_F2, 0);
end;

procedure TFM_Main.Grid1DblClick(Sender: TObject);
begin
//     B_cancelClick(Sender);
     if  (not Q_Grid.Eof) And  (PConyn <> 'Y') And (Pempno = Ed_empno.Text) then
     begin
          ED_seqno.Text            := Q_Grid.fieldbyname('seqno').AsString;
          ED_dutyfrdate.Text       := Q_Grid.fieldbyname('dutyfrdate').AsString;
          if Q_Grid.fieldbyname('dutytodate').AsString = '현재'  then
                ED_dutytodate.Text := ''
          else
                ED_dutytodate.Text := Q_Grid.fieldbyname('dutytodate').AsString;
          Ed_jobgun.Text           := Q_Grid.fieldbyname('jobgunname').AsString;
          Ed_jobgun.Hint           := Q_Grid.fieldbyname('jobgun').AsString;
          Ed_jobkind.Text          := Q_Grid.fieldbyname('jobkindname').AsString;
          Ed_jobkind.Hint          := Q_Grid.fieldbyname('jobkind').AsString;
          Ed_jobduty.Text          := Q_Grid.fieldbyname('jobdutyname').AsString;
          Ed_jobduty.Hint          := Q_Grid.fieldbyname('jobduty').AsString;
          Ed_movegubun.Text        := Q_Grid.fieldbyname('movegbname').AsString;
          Ed_movegubun.Items.IndexOf(Q_Grid.fieldbyname('movegubun').AsString);
          P_dutyym.ValueCaption    := Q_Grid.fieldbyname('dutyym').AsString;
          P_dutyyy.ValueCaption    := Q_Grid.fieldbyname('dutyyy').AsString;
          P_dutymm.ValueCaption    := Q_Grid.fieldbyname('dutymm').AsString;
          P_orgnum.ValueCaption    := Q_Grid.fieldbyname('orgnum').AsString;
          Ed_dutydept.text         := Q_Grid.fieldbyname('dutydeptname').AsString;
          Ed_dutydept.Hint         := Q_Grid.fieldbyname('dutydept').AsString;
          Ed_deptgubun.Text        := Q_Grid.fieldbyname('deptgbname').AsString;
          Ed_deptgubun.Items.IndexOf(Q_Grid.fieldbyname('deptgubun').AsString);
          ED_jobplace.Text         := Q_Grid.fieldbyname('jobplacename').AsString;
          ED_jobplace.Codeno       := Q_Grid.fieldbyname('jobplace').AsString;
          Edit_Enabled(0,True);
     end;
end;

procedure TFM_Main.B_deleteClick(Sender: TObject);
begin
     case TComponent(Sender).Tag of
          0 : begin
                   if  trim(Ed_seqno.text) = '' then
                   begin
                        MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_DutyfrDate.SetFocus;
                        Exit;
                   end;

                   if  trim(ED_dutyfrdate.text) = '' then
                   begin
                        MessageDlg('근무시작일이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Ed_DutyfrDate.SetFocus;
                        Exit;
                   end;

                   if MessageBox(handle,PChar('해당 직무경험을 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
                   begin
                        system.Exit;
                   end;

                   with TMaxDataSet do
                   begin
                        SQL.Clear;
                        SQL.Text := 'delete from pmpathhis                     '+
                                    ' where empno     ='''+ED_empno.text+'''   '+
                                    '   and seqno     ='  +Ed_seqno.text+  '   ';
                        Close;
                        ServiceName := 'PEA1060A_dml';
                        Execute;
                   end;
                   MessageDlg('해당 직무경험을 삭제하였습니다.', mtInformation, [mbOK], 0);
             end;
         1,2,3 :
             begin
                   if  trim(E_seqno.text) = '' then
                   begin
                        MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if MessageBox(handle,PChar('해당 경력경로를 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
                   begin
                        system.Exit;
                   end;

                   with TMaxDataSet do
                   begin
                        SQL.Clear;

                        SQL.Text := format('delete from pmpathdet                        '+
                                           ' where empno     =''%s''                     '+
                                           '   and gubun     =''%d''                     '+
                                           '   and seqno     = '+E_seqno.text+'          ',
                                           [ED_empno.text, TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PEA1060A_dml';
                        Execute;
                   end;
                   MessageDlg('해당 경력경로를 삭제하였습니다.', mtInformation, [mbOK], 0);
             end;
     end;
     B_cancelClick(Sender);
end;


procedure TFM_Main.OnDBGrid1DblClick(Sender: TObject);
begin
//     B_cancelClick(Sender);
     if  (not Q_Path1.Eof) And  (PConyn <> 'Y') And (Pempno = Ed_empno.Text) then
     begin
          E_seqno.Text             := Q_Path1.fieldbyname('seqno').AsString;
          Ed_jobkind1.Text         := Q_Path1.fieldbyname('jobkindname').AsString;
          Ed_jobkind1.Hint         := Q_Path1.fieldbyname('jobkind').AsString;
          Ed_jobduty1.Text         := Q_Path1.fieldbyname('jobdutyname').AsString;
          Ed_jobduty1.Hint         := Q_Path1.fieldbyname('jobduty').AsString;
          Ed_nowpath1.Text         := Q_Path1.fieldbyname('nowpathname').AsString;
          Ed_nowpath1.Items.IndexOf(Q_Path1.fieldbyname('nowpath').AsString);

          Edit_Enabled(1,True);
     end;
end;

procedure TFM_Main.OnDBGrid2DblClick(Sender: TObject);
begin
//     B_cancelClick(Sender);
     if  (not Q_Path2.Eof) And  (PConyn <> 'Y') And (Pempno = Ed_empno.Text) then
     begin
          E_seqno.Text             := Q_Path2.fieldbyname('seqno').AsString;
          Ed_jobkind2.Text         := Q_Path2.fieldbyname('jobkindname').AsString;
          Ed_jobkind2.Hint         := Q_Path2.fieldbyname('jobkind').AsString;
          Ed_jobduty2.Text         := Q_Path2.fieldbyname('jobdutyname').AsString;
          Ed_jobduty2.Hint         := Q_Path2.fieldbyname('jobduty').AsString;
          Ed_nowpath2.Text         := Q_Path2.fieldbyname('nowpathname').AsString;
          Ed_nowpath2.Items.IndexOf(Q_Path2.fieldbyname('nowpath').AsString);
          Edit_Enabled(2,True);
     end;
end;

procedure TFM_Main.OnDBGrid3DblClick(Sender: TObject);
begin
//     B_cancelClick(Sender);
     if  (not Q_Path3.Eof) And  (PConyn <> 'Y') And (Pempno = Ed_empno.Text) then
     begin
          E_seqno.Text             := Q_Path3.fieldbyname('seqno').AsString;
          Ed_jobkind3.Text         := Q_Path3.fieldbyname('jobkindname').AsString;
          Ed_jobkind3.Hint         := Q_Path3.fieldbyname('jobkind').AsString;
          Ed_jobduty3.Text         := Q_Path3.fieldbyname('jobdutyname').AsString;
          Ed_jobduty3.Hint         := Q_Path3.fieldbyname('jobduty').AsString;
          Ed_nowpath3.Text         := Q_Path3.fieldbyname('nowpathname').AsString;
          Ed_nowpath3.Items.IndexOf(Q_Path3.fieldbyname('nowpath').AsString);
          Edit_Enabled(3,True);
     end;
end;

procedure TFM_Main.Ed_dutydeptKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Ed_dutydeptInitPopup(Sender);
          Ed_dutydept.Perform(WM_KEYDOWN, VK_F2, 0);

          Key := #0;
     end;
end;

procedure TFM_Main.ED_jobplaceKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
//          ED_jobplaceInitPopup(Sender);
          ED_jobplace.Perform(WM_KEYDOWN, VK_F2, 0);

          Key := #0;
     end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TMaxDataSet do
  begin
       ServiceName := 'PEA1060A_dml';
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
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

end.
