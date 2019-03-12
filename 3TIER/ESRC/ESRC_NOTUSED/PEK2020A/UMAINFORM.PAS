{-------------------------------------------------------------------------------
  PROGRAM-NAME   : PEK2020A(idp 등록 )
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 인사(IDP)
  PROGRAMMER     : 이희용
  VERSION        : 1.00
  DATE           : 2011.07.11
  UPDATE  CONTENTS
   1.00   2011.07.11     이희용        신규프로그램개발          IDP등록
   1.68   2012.03.12     이희용        프로그램 수정             상세내역
-------------------------------------------------------------------------------}
unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, OnSkinBtn, OnDBGrid,
  OnTmaxCodeEdit, OnTmaxDeptEdit, On_pmTrack, On_pmLevel, //OnSchemem,
  On_DeptEdit, OnEditMdate, kpaylib, OnScheme, PDownLoad, registry,
  QuickRpt, Qrctrls, OnInsaCommon, Func;

type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    Q_Grid: TTMaxDataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    E_Notice: TOnMemo;
    E_aftplan: TOnMemo;
    BT_Save: TOnFocusButton;
    BT_Confirm: TOnFocusButton;
    BT_Print: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    PL_Help: TPanel;
    QRL_SpecTitle: TQRLabel;
    OnFocusButton1: TOnFocusButton;
    ED_dutytarget: TOnShapeLabel;
    EdEmp: TEdit;
    BtEmp: TButton;
    L_payclname: TOnShapeLabel;
    L_paycldate: TOnShapeLabel;
    E_bumoon: TOnShapeLabel;
    E_jmlevel: TOnWinPopupEdit;
    Panel3: TPanel;
    L_Deptname: TOnShapeLabel;
    L_Korname: TOnShapeLabel;
    E_jmtrack: TOnWinPopupEdit;
    Ed_empno: TOnWinPopupEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid2: TOnDBGrid;
    TabSheet2: TTabSheet;
    OnDBGrid1: TOnDBGrid;
    E_worktask: TOnMemo;
    B_save: TOnFocusButton;
    E_edutobe: TOnMemo;
    On_LCnow: TOnMemo;
    On_OSnow: TOnMemo;
    Label7: TLabel;
    BT_idphis: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    GroupBox2: TGroupBox;
    B_insert1: TOnFocusButton;
    B_delete1: TOnFocusButton;
    BT_lpoint: TOnFocusButton;
    E_LPOINT: TOnShapeLabel;
    L_Title: TLabel;
    E_GETLP: TOnShapeLabel;
    OnShapeLabel12: TOnShapeLabel;
    On_SGnext: TOnMemo;
    L_Base_yy: TOnShapeLabel;
    Cb_Base_yy: TOnComboEdit;
    Panel1: TPanel;
    On_SGnow: TOnMemo;
    On_OSnext: TOnMemo;
    On_LCnext: TOnMemo;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    BT_HList: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    BT_Excel1: TOnFocusButton;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure B_saveClick(Sender: TObject);
    procedure B_insertClick(Sender: TObject);
    procedure B_deleteClick(Sender: TObject);
    procedure E_jmtrackInitPopup(Sender: TObject);
    procedure E_jmtrackCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Grid2CellClick(Sender: TObject; const ACell: TOnJCell);
    procedure Select_BaseData;
    procedure BT_lpointClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure Edit_MemoClick(Sender: TObject);
    procedure Edit_MemoExit(Sender: TObject);
    procedure Edit_MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtEmpClick(Sender: TObject);

    procedure InitBase;
    procedure Cb_Base_yyChange(Sender: TObject);
    procedure BT_idphisClick(Sender: TObject);
    procedure E_edutobeClick(Sender: TObject);
    procedure E_edutobeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure On_LCnowClick(Sender: TObject);
    procedure BT_HListClick(Sender: TObject);
    procedure BT_Excel1Click(Sender: TObject);

  private
    { Private declarations }
    GSHomeDir  : string;
    FM_TRACK   : TFM_pmTrack;
    FM_LEVEL   : TFM_pmLevel;
    FM_DUTYDEPT: TFM_DeptEdit;
    vParamSQL  : String;
    vDeleteKEY : String;
    Count, i   : integer;
    BTTab      : Boolean;  //idp이력조회버튼 클릭이면 True(팀장조회)
    procedure PempnoSetup;
    procedure Read_Data;
    procedure Path_data;
    function  FL_CheckNullAnswer:Boolean;

    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
     SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN, ParamVariant : String;

     vEmpno     : String;
     PEmpno     : String;
     AEmpno     : String;
     Ppaycl     : string;
     Ppaycldate : string;
     Ppayra     : String;
     Porgnum    : String;
     Pdeptcode  : String;
     PRvalconyn : String;
     PE1valconyn: String;
     Lgubun     : Integer;
     Pempcnt    : Integer;
     sbase_yy   : String;
     Csel_SQL   : String;
     Csel_ret   : Boolean;

     Workemp1   : String;
     Workemp2   : String;
     Workemp3   : String;
     Workemp4   : String;
     Workemp5   : String;
     Workemp6   : String;
     Workemp7   : String;
     IDPstdate  : String;
     IDPeddate  : String;
     vRabasdate : String;
     Vsysdate   : String;
     Vdutyyy    : String;
     Vdutymm    : String;
     Leempno    : string; //상사 사번

     vUnionyn   : String;
     vjmtrack, vjmlevel : String;
     payrafr   : String;
     payrato   : String;
     pstate    : String;
     objdept1, objdept2, objdept3, objdept4, objdept5   : String;
     objdept6, objdept7, objdept8, objdept9, objdept10  : String;
     objemp1,  objemp2,  objemp3,  objemp4,  objemp5    : String;
     objemp6,  objemp7,  objemp8,  objemp9,  objemp10   : String;

     CountYN : Integer;
     iHapLP, iE_LP : Integer;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm, UEduForm, UPrintForm, UPrintForm1, UHelp;

{$R *.DFM}


procedure TFM_Main.FormShow(Sender: TObject);
const
     ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var
  FL_IDate: Integer;
  reg     : TRegistry;
begin
(*
  reg            := TRegistry.Create;
  reg.RootKey    := HKEY_LOCAL_MACHINE;
  if  reg.OpenKey(ObjName,False) then
      GSHomeDir := reg.ReadString('NewHomeDir');
  reg.CloseKey;
  reg.Free;

*)
  GSHomeDir := GetHomeDir;

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;

  Ed_empno.ButtonWidth := 0;
  Ed_empno.Enabled     := False;
  if (Lgubun = 2) then
  begin
    Ed_empno.ButtonWidth := 24;
    Ed_empno.Enabled     := True;
  end;

  BTTab := True;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
var
  i : integer;
  Bungi : String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//  TMaxSession.EnvFileName := 'd:\source\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  VarLoading;    

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  // 기준연도 읽어온다
  ParamVariant := '';
  ParamVariant := 'select Value1|| '';'' ||Value2|| '';'' ||    '+
                 '       to_char(sysdate,''YYYYMMDD'')          '+
                 '  FROM peIDPbas                               '+
                 ' where base_yy   = ''0000''                   '+
                 '   and gubun     = ''00''                     '+
                 '   and sgubun    = ''0000''                   ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  sbase_yy     := Copy(Csel_gfd(1),1,4);
  VSysdate     := Csel_gfd(3);

  // 담당자를 읽어온다
  ParamVariant  := 'select Value1|| '';'' ||Value2|| '';'' ||Value3|| '';'' ||'+
                  '        Value4|| '';'' ||Value5|| '';'' ||Value6|| '';'' ||'+
                  '        Value7|| '';'' ||Value8|| '';'' ||Value9 '+
                  '  FROM peIDPbas                                  '+
                  ' where base_yy  = '''+sbase_yy+'''               '+
                  '   and gubun     = ''01''                        '+
                  '   and sgubun    = ''0001''                      ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  Workemp1      := Csel_gfd(1);
  Workemp2      := Csel_gfd(2);
  Workemp3      := Csel_gfd(3);
  Workemp4      := Csel_gfd(4);
  Workemp5      := Csel_gfd(5);
  Workemp6      := Csel_gfd(6);
  Workemp7      := Csel_gfd(7);

  // 공지사항를 읽어온다
  ParamVariant  := 'select            Value1|| '';'' ||Value2 '+
                   '       || '';'' ||Value3|| '';'' ||Value4 '+
                   '       || '';'' ||Value5|| '';'' ||Value6 '+
                   '       || '';'' ||Value7|| '';'' ||Value8 '+
                   '       || '';'' ||Value9|| '';'' ||Value10'+
                   '  FROM peIDPbas                           '+
                   ' where base_yy  = '''+sbase_yy+'''        '+
                   '   and gubun     = ''01''                 '+
                   '   and sgubun    = ''0002''               ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  E_Notice.Lines.Clear;

  for i := 1 to 10 do
  begin
    E_Notice.Lines.Add(Csel_gfd(i));
  end;

  // 등록 및 결재 기간, 업무목표 기준일을 읽어온다
  ParamVariant  := 'select            Value1|| '';'' ||Value2 '+
                   '       || '';'' ||Value3|| '';'' ||Value4 '+
                   '       || '';'' ||Value5|| '';'' ||Value6 '+
                   '       || '';'' ||Value7|| '';'' ||Value8 '+
                   '       || '';'' ||Value9|| '';'' ||Value10'+
                   '  FROM peIDPbas                           '+
                   ' where base_yy  = '''+sbase_yy+'''        '+
                   '   and gubun     = ''01''                 '+
                   '   and sgubun    = ''0003''               ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  IDPstdate      := Csel_gfd(1);
  IDPeddate      := Csel_gfd(2);
  vRabasdate     := Csel_gfd(3);

  // IDP등록제외부서코드를 읽어온다
  ParamVariant  := 'select Value1|| '';'' ||Value2|| '';'' ||Value3      '+
                   '  from peidpbas a                                    '+
                   ' WHERE a.base_yy like '''+sbase_yy+'''||''%''        '+
                   '   AND a.gubun  = ''02''                             '+
                   '   AND a.sgubun = ''0001''                           ';
  Csel_SQL      := ParamVariant;
  Csel_Open;

  payrafr   := Csel_gfd(1);
  payrato   := Csel_gfd(2);
  pstate    := Csel_gfd(3);

  // IDP등록제외부서코드를 읽어온다
  ParamVariant  := 'select NVL(Value1,''ZZZZZ'')|| '';'' ||NVL(Value2,''ZZZZZ'')|| '';'' || '+
                   '       NVL(Value3,''ZZZZZ'')|| '';'' ||NVL(Value4,''ZZZZZ'')|| '';'' || '+
                   '       NVL(Value5,''ZZZZZ'')|| '';'' ||NVL(Value6,''ZZZZZ'')|| '';'' || '+
                   '       NVL(Value7,''ZZZZZ'')|| '';'' ||NVL(Value8,''ZZZZZ'')|| '';'' || '+
                   '       NVL(Value9,''ZZZZZ'')|| '';'' ||NVL(Value10,''ZZZZZ'')           '+
                   '  from peidpbas a                                                       '+
                   ' WHERE a.base_yy like '''+sbase_yy+'''||''%''                           '+
                   '   AND a.gubun  = ''02''                                                '+
                   '   AND a.sgubun = ''0002''                                              ';
  Csel_SQL      := ParamVariant;
  Csel_Open;

  objdept1  := Csel_gfd(1);
  objdept2  := Csel_gfd(2);
  objdept3  := Csel_gfd(3);
  objdept4  := Csel_gfd(4);
  objdept5  := Csel_gfd(5);
  objdept6  := Csel_gfd(6);
  objdept7  := Csel_gfd(7);
  objdept8  := Csel_gfd(8);
  objdept9  := Csel_gfd(9);
  objdept10 := Csel_gfd(10);

  // IDP등록제외사번을 읽어온다
  ParamVariant  := 'select NVL(Value1,''ZZZZ'')|| '';'' ||NVL(Value2,''ZZZZ'')|| '';'' || '+
                   '       NVL(Value3,''ZZZZ'')|| '';'' ||NVL(Value4,''ZZZZ'')|| '';'' || '+
                   '       NVL(Value5,''ZZZZ'')|| '';'' ||NVL(Value6,''ZZZZ'')|| '';'' || '+
                   '       NVL(Value7,''ZZZZ'')|| '';'' ||NVL(Value8,''ZZZZ'')|| '';'' || '+
                   '       NVL(Value9,''ZZZZ'')|| '';'' ||NVL(Value10,''ZZZZ'')           '+
                   '  from peidpbas a                                                     '+
                   ' WHERE a.base_yy like '''+sbase_yy+'''||''%''                         '+
                   '   AND a.gubun  = ''02''                                              '+
                   '   AND a.sgubun = ''0003''                                            ';

  Csel_SQL      := ParamVariant;
  Csel_Open;
  objemp1   := Csel_gfd(1);
  objemp2   := Csel_gfd(2);
  objemp3   := Csel_gfd(3);
  objemp4   := Csel_gfd(4);
  objemp5   := Csel_gfd(5);
  objemp6   := Csel_gfd(6);
  objemp7   := Csel_gfd(7);
  objemp8   := Csel_gfd(8);
  objemp9   := Csel_gfd(9);
  objemp10  := Csel_gfd(10);

  Pempno        := Passemp(cmdline,1);
  Ed_empno.Text := Pempno;
  EdEmp.Text    := Pempno;
  Aempno        := Pempno;
  if (Aempno = WorkEmp1) or (Aempno = WorkEmp2) or (Aempno = WorkEmp3) or
     (Aempno = WorkEmp4) or (Aempno = WorkEmp5) or (Aempno = WorkEmp6) or
     (Aempno = WorkEmp7) or (copy(Aempno,1,1) = 'D') then
  begin
    EdEmp.Visible      := True;
    BtEmp.Visible      := True;
  end
  else
  begin
    EdEmp.Visible      := false;
    BtEmp.Visible      := false;
  end;

  //IDP 기준등록에 연도를 가져온다.
  ParamVariant  :=  ' SELECT Value1 FROM peidpbas '+
                    ' WHERE base_yy = ''0000'' ';

  Csel_SQL     := ParamVariant;
  Csel_Open;
  Cb_Base_yy.Items.Clear;

  with TMaxDataSet_HInsa do
  begin
    While Not Eof do
    begin
      Cb_Base_yy.Items.Add(Csel_gfd(1));
      Next;
    end
  end;
  //관리자
  if Copy(Passemp(cmdline,1),1,1) = 'D' Then Cb_Base_yy.Text := sbase_yy;
  Cb_Base_yy.ItemIndex := 0; //Cb_Base_yyChange Event발생되어 InitBase로 이동.
end;

procedure TFM_Main.PempnoSetup;
begin
  // Pempno
  ParamVariant := 'SELECT count(empno)      '+
                  '  FROM peidpmas          '+
           format(' WHERE base_yy = ''%s''  '+
                  '   and empno  <> ''%s''  '+
                  '   and e1empno = ''%s''  ', [sbase_yy, Pempno, Pempno]);

  Csel_SQL     := ParamVariant;
  Csel_Open;
  Pempcnt      := strtoint(Csel_gfd(1));

  // 부서및 겸직부서조회
  if  (Pempcnt > 0) then
  Begin
       Lgubun := 2; // 부서장
       BT_Save.Caption    := '반려';
       BT_Confirm.Caption := '결재';
       Ed_empno.Enabled    := True;
       Ed_Empno.ReadOnly   := True;
       if BTTab = false Then
       begin
         Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
         exit;
       end;
  End
  Else
  Begin
    if (Aempno = WorkEmp1) or (Aempno = WorkEmp2) or (Aempno = WorkEmp3) or
       (Aempno = WorkEmp4) or (Aempno = WorkEmp5) or (Aempno = WorkEmp6) or
       (Aempno = WorkEmp7) or (copy(Aempno,1,1) = 'D') then
    begin
//      Ed_empno.Text := WorkEmp1;
      Ed_empno.ButtonWidth := 24;
      Ed_empno.Enabled     := True
    end
    else Ed_empno.Enabled   := False;
    Lgubun             := 0;
    BT_Save.Caption    := '저장';
    BT_Confirm.Caption := '결재상신';
  End;
  Select_BaseData;
end;

procedure TFM_Main.Select_BaseData;
var
  vEkind : String;
begin
  //2016년 원래 Jobdept에서 deptcode으로 변경함.
  //tf 팀이 많아서 변경 2017년 작업 시 확인할것. HeeYong 2016.2.24
  ParamVariant := 'SELECT A.empno||'';''||A.korname||'';''||A.paycl||'';''||A.payra||'';''||A.paycldate||'';''||          '+#13+
                  '       A.orgnum||'';''||A.deptcode||'';''||                                                            '+#13+
                  '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''||                '+#13+
                  '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''||                '+#13+
                  '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''||            '+#13+
                  '       NVL(b.rvalconyn,''N'')||'';''||NVL(b.E1valconyn,''N'')||'';''||                                 '+#13+
                  '       B.E1EMPNO||'';''||NVL(e.Unionyn,''N'')                                                          '+#13+
                  '  FROM PIMPMAS A, peidpmas B, pehreaim_combas e                                                        '+#13+
                  ' WHERE a.pstate <= '''+pstate +'''                                                                     '+#13+
                  '   AND a.payra  >= '''+payrafr+'''   AND a.payra     <= '''+payrato+'''                                '+#13+
                  '   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',  '''+objemp3+''',                         '+#13+
                  '                          '''+objemp4+''',  '''+objemp5+''',  '''+objemp6+''',                         '+#13+
                  '                          '''+objemp7+''',  '''+objemp8+''',  '''+objemp9+''',                         '+#13+
                  '                          '''+objemp10+'''                                     )                       '+#13+
                  '   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''', '''+objdept3+''',                        '+#13+
                  '                          '''+objdept4+''', '''+objdept5+''', '''+objdept6+''',                        '+#13+
                  '                          '''+objdept7+''', '''+objdept8+''', '''+objdept9+''',                        '+#13+
                  '                          '''+objdept10+'''                                    )                       '+#13+
                  '   AND (a.empno like '''+ Ed_empno.Text +'''||''%'' OR A.korname like '''+ Ed_empno.Text +'''||''%'')  '+#13+
                  '   AND a.empno = b.empno(+)                                                                            '+#13+
                  '   AND a.empno = e.empno(+)                                                                            '+#13+
                  '   AND e.rabasdate(+) = '''+ vRabasdate + '''                                                          '+#13+
                  '   AND b.base_yy(+) = '''+ sbase_yy + '''                                                              ';
                  //'   AND SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'')                                      '+#13+
                  //'   AND A.PAYRA < ''D50''                                                                               '+#13+
                  //'   AND A.PAYCL > ''C00''                                                                               ';

  Csel_SQL := ParamVariant;
  Csel_Open;

  if (Lgubun = 0) and (TMaxDataSet_HInsa.RecordCount <= 0) AND (copy(Aempno,1,1) <> 'D') then
  begin
       ShowMessage('My Plan 등록 대상자가 아닙니다.'+#13+#13+
                   '프로그램은 자동 종료됩니다.  ');
       Application.Terminate;
       exit;
  end
  else if (Lgubun = 2) and (Ed_empno.Text = Pempno) then
  begin
       exit;
  end;

  vEmpno                   := Csel_gfd(1);
  Ed_Empno.Text            := Csel_gfd(1);
  L_korname.ValueCaption   := Csel_gfd(2);
  Ppaycl                   := Csel_gfd(3);
  Ppayra                   := Csel_gfd(4);
  Ppaycldate               := Csel_gfd(5);
  L_paycldate.ValueCaption := copy(Csel_gfd(5),1,4)+'-'+ copy(Csel_gfd(5),5,2)+'-'+ copy(Csel_gfd(5),7,2);
  Porgnum                  := Csel_gfd(6);
  Pdeptcode                := Csel_gfd(7);
  L_payclname.ValueCaption := Csel_gfd(8);
  L_Deptname.ValueCaption  := Csel_gfd(10);
  PRvalconyn               := Csel_gfd(11);
  PE1valconyn              := Csel_gfd(12);
  Leempno                  := Csel_gfd(13);
  vUnionyn                 := Csel_gfd(14);

  with TMaxDataSet do
  begin
    CountYN := 0;

    SQL.Clear;
    SQL.Text := 'SELECT COUNT(*) SEL_DATA FROM PEIDPMAS   '+
                ' WHERE BASE_YY = '''+ sbase_yy +'''      '+
                '   AND EMPNO   = '''+ Ed_empno.Text +''' '+
                '   AND JMTRACK IS NOT NULL               ';
//                '   AND JMLEVEL IS NOT NULL               ';

    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;

    CountYN := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

    //PEIDPMAS 자료존재 여부 >> 모든자료를 입력후 처리하므로 직무트랙/직무수준을 첵크하여
    //                          둘중 데이타가 없으면 자료가 없는것으로 판단함.(2011.08.12)
    If CountYN = 0 THEN
    Begin
      Edit_Enabled(0, False);
      MessageDlg('직무분야 저장 후 My Plan 등록하시기 바랍니다.', mtWarning, [mbOK], 0);
    End
    Else
    Begin
      //Learning Point
      Path_data;
      //교육과정
      Read_Data;
      //팀장login
      If (Lgubun = 2) Then
      Begin
        if (PRvalconyn  = 'Y') then Edit_Enabled(4, False); //결재상신
        If (PE1valconyn = 'Y') Then Edit_Enabled(3, False); //결재완료
        If (PE1valconyn = 'R') Then Edit_Enabled(3, False); //반려
      End
      //팀원login
      Else
      Begin
        If (PRvalconyn = 'Y') Then     //결재상신
        Begin
          if ( PE1valconyn = 'Y') then //결재완료
            Edit_Enabled(3, False)
          Else
            Edit_Enabled(2, False);
        End
        Else
          Edit_Enabled(1, True);       //저장상태
      End;
    End;
  end;
end;

procedure TFM_Main.Edit_Enabled(Ttag : integer; TFlag : Boolean);
begin
  case Ttag of
  0 : begin //PEIDPMAS 자료 미존재
        If (Lgubun = 2) Then
        Begin
          E_jmtrack.Enabled  := TFlag;
          E_jmlevel.Enabled  := TFlag;
          PL_Help.Caption    := ' ◎ My Plan 자료등록은 팀원만 가능합니다.'
        End Else
        Begin
          E_jmtrack.Enabled  := Not TFlag;
          E_jmlevel.Enabled  := Not TFlag;
          PL_Help.Caption    := ' ◎ My Plan 자료를 등록하시기 바랍니다.';
        End;
        B_save.Enabled     := true;
        B_insert1.Enabled  := false;
        B_delete1.Enabled  := TFlag;
        BT_Save.Enabled    := TFlag;
        BT_Confirm.Enabled := TFlag;
//        BT_Print.Enabled   := TFlag;
        E_worktask.ReadOnly:= Not TFlag;
        E_aftplan.ReadOnly := Not TFlag;
        E_jmtrack.Clear;
        E_jmlevel.Clear;
        E_worktask.Clear;
        E_aftplan.Clear;
        ED_dutytarget.ValueCaption := '';
        Q_Grid.Close;

        PL_Help.Font.Color := clWindowText;
      end;
  1 : begin //PEIDPMAS 자료 존재
        If   (E_jmtrack.text = ''       ) or (E_jmlevel.text = ''       ) or
             (E_jmtrack.text <> vjmtrack) or (E_jmlevel.text <> vjmlevel) Then
             B_save.Enabled := True
        Else
             B_save.Enabled := False;
        E_jmtrack.Enabled  := TFlag;
        E_jmlevel.Enabled  := TFlag;
        BT_Save.Enabled    := TFlag;
        B_insert1.Enabled  := TFlag;
        Grid2.ReadOnly     := Not TFlag;
        E_worktask.ReadOnly:= Not TFlag;
        E_aftplan.ReadOnly := Not TFlag;
        E_worktask.Enabled := TFlag;
        E_aftplan.Enabled  := TFlag;

        BT_Save.Visible    := TFlag;
        BT_Confirm.Visible := TFlag;
        BT_Save.Enabled    := TFlag;
        BT_Confirm.Enabled := TFlag;
//        BT_Print.Enabled   := TFlag;
        If (PE1valconyn = 'R') Then //반려
        Begin
          PL_Help.Caption := ' ◎ 반려된 자료입니다. 자료수정 후 결재상신 하시기 바랍니다.';
          PL_Help.Font.Color := clPurple;
        End Else
        Begin
          PL_Help.Caption    := ' ◎ 결재상신 하시기 바랍니다.';
          PL_Help.Font.Color := clBlue;
        End;
      End;
  2 : begin //팀원(결재상신)
        E_jmtrack.Enabled  := TFlag;
        E_jmlevel.Enabled  := TFlag;
        B_delete1.Enabled  := TFlag;
        B_insert1.Enabled  := TFlag;
        B_save.Enabled     := TFlag;
        Grid2.ReadOnly     := Not TFlag;
        E_worktask.ReadOnly:= Not TFlag;
        E_aftplan.ReadOnly := Not TFlag;

        BT_Save.Visible    := TFlag;
        BT_Confirm.Visible := TFlag;
        PL_Help.Caption    := ' ◎ 결재상신된 자료입니다.';
        PL_Help.Font.Color := clBlue;
      end;
  3 : begin //팀장결재완료
        E_jmtrack.Enabled  := TFlag;
        E_jmlevel.Enabled  := TFlag;
        B_save.Enabled     := TFlag;
        B_insert1.Enabled  := TFlag;
        B_delete1.Enabled  := TFlag;

//        BT_Print.Enabled   := Not TFlag;
        Grid2.ReadOnly     := Not TFlag;
        E_worktask.ReadOnly:= Not TFlag;
        E_aftplan.ReadOnly := Not TFlag;
        BT_Save.Visible    := TFlag;
        BT_Confirm.Visible := TFlag;
        If (PE1valconyn = 'R') Then //반려
          PL_Help.Caption    := ' ◎ 반려된 자료입니다.'
        Else
          PL_Help.Caption    := ' ◎ 결재완료된 자료입니다.';
        PL_Help.Font.Color := clRed;
      end;
  4 : begin //팀장(결재상신)
        E_jmtrack.Enabled  := TFlag;
        E_jmlevel.Enabled  := TFlag;
        B_save.Enabled     := TFlag;
        B_insert1.Enabled  := TFlag;
        B_delete1.Enabled  := TFlag;
        Grid2.ReadOnly     := Not TFlag;
        E_worktask.ReadOnly:= Not TFlag;
        E_aftplan.ReadOnly := Not TFlag;
        BT_Save.Visible    := Not TFlag;
        BT_Confirm.Visible := Not TFlag;
        BT_Save.Enabled    := Not TFlag;
        BT_Confirm.Enabled := Not TFlag;
//        BT_Print.Enabled   := Not TFlag;
        PL_Help.Caption    := '  ◎ 결재상신된 자료입니다.';
        PL_Help.Font.Color := clRed;
      end;
  end;
end;

procedure TFM_Main.Read_Data;
var
  i : integer;
  vEkind : String;
begin
  with TMaxDataSet do
  Begin
    ParamVariant := Format(' SELECT ' +
                           ' (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.BUMOON AND CLASSNO  = ''3'' and base_yy = '''+FM_Main.sbase_yy+''') CN_BUMOON, ' +
                           ' (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.JMTRACK AND CLASSNO = ''4'' and base_yy = '''+FM_Main.sbase_yy+''') CN_JMTRACK, ' +
                           ' (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.JMLEVEL AND CLASSNO = ''5'' and base_yy = '''+FM_Main.sbase_yy+''') CN_JMLEVEL, ' +
                           ' JMTRACK, JMLEVEL, NULL ' +
                           ' From PEIDPMAS A ' +
                           ' WHERE A.BASE_YY  = ''%s'' '+
                           '   AND A.EMPNO    = ''%s'' ',
                             [sbase_yy, Ed_empno.Text]);
    Close;

    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('CN_BUMOON' , ftString, 400);
    AddField('CN_JMTRACK', ftString, 400);
    AddField('CN_JMLEVEL', ftString, 400);
    AddField('JMTRACK'   , ftString, 400);
    AddField('JMLEVEL'   , ftString, 400);

    ClearParamInfo;
    SQL.Text := ParamVariant;
    Open;

    E_bumoon.ValueCaption := fields[0].AsString;
    vjmtrack       := fields[1].AsString;
    vJmlevel       := fields[2].AsString;
    E_jmtrack.Text := fields[1].AsString;
    E_jmlevel.Text := fields[2].AsString;
    E_jmtrack.Hint := fields[3].AsString;
    E_jmlevel.Hint := fields[4].AsString;
  End;

  with TMaxDataSet_HInsa do
  Begin
    ParamVariant := 'SELECT EDUTOBE, SGNOW, SGNEXT, LCNOW, LCNEXT, '+
                    '       OSNOW,  OSNEXT,  ''5'', ''5'', ''5''   '+
                    '  FROM PEIDPMAS                               '+
                    ' WHERE BASE_YY = '''+ sbase_yy      +'''      '+
                    '   AND empno   = '''+ Ed_empno.Text +'''      ';

    ServiceName := 'HINSA_select12';
    ClearFieldInfo;
    AddField('Field1' , ftString, 2000);
    AddField('Field2' , ftString, 2000);
    AddField('Field3' , ftString, 2000);
    AddField('Field4' , ftString, 2000);
    AddField('Field5' , ftString, 2000);
    AddField('Field6' , ftString, 2000);
    AddField('Field7' , ftString, 2000);
    AddField('Field8' , ftString, 2000);
    AddField('Field9' , ftString, 2000);
    AddField('Field10', ftString, 2000);

    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    E_edutobe.text := Fields[0].AsString;
    On_OSnow.Text  := Fields[1].AsString;
    On_LCnow.Text  := Fields[2].AsString;
    On_OSnext.Text := Fields[3].AsString;
    On_SGnow.Text  := Fields[4].AsString;

  End;

  //Activity : 성장형 Biz 관련 역량 제고 방안
  if E_edutobe.Text ='' then
  begin

    E_edutobe.Font.Color := clGray;
    E_edutobe.Lines.Add('● 리더 등록 항목입니다.');
  end;
  //Activity : 기타 자기개발 방안
  if On_OSnow.Text = '' then
  begin
    On_OSnow.Font.Color := clGray;
    On_OSnow.Lines.Add('● 리더 등록 항목입니다.');
  end;
  //Activity : 변화/혁신 실천과제
  if On_LCnow.Text = '' then
  begin
    On_LCnow.Font.Color := clGray;
    On_LCnow.Lines.Add('● 리더의 육성 의견을 참고하여 풀뿌리 Study, 사외교육, 전문 자격증 취득,');
    On_LCnow.Lines.Add('   독서 등 자기주도 학습을 통한 No.1 실력 확보 계획 기술 (Max 1,000Byte)');
  end;

  //목표 : 기타 자기개발 방안
  if On_OSnext.Text ='' then
  begin
    On_OSnext.Font.Color := clGray;
    On_OSnext.Lines.Add('● 리더의 육성 의견을 참고하여 자기 주도 학습을 통한 실력 향상 목표 작성 (Max 1,000Byte) ');
  end;
(*
  //목표 : 변화/혁신 실천과제
  if On_SGnow.Text ='' then
  begin
    On_SGnow.Font.Color := clGray;
    On_SGnow.Lines.Add(' ● 리더의 육성 의견을 참고하여 자기 주도 학습을 통한 실력 향상 목표 작성 (Max 1,000Byte) ');
  end;
*)
end;

//입력된 교육과정 조회
procedure TFM_Main.Path_data;
var
  sE1VALCONYN : String;
begin
  with TMaxDataSet do
  begin
    Count := 0;
    sE1VALCONYN := '';

    ServiceName := 'HINSA_select';  //목표 L/P

    Close;
    SQL.Clear;

    Sql.Add(' SELECT E1VALCONYN, E1VALCONDATE,  ');
    Sql.Add('        NULL, NULL, NULL           ');
    Sql.Add(' FROM PEIDPMAS                     ');
    Sql.Add(' WHERE BASE_YY = '''+ sbase_yy +'''');
    Sql.Add('   AND EMPNO   = '''+ Ed_empno.Text +''' ');

    ClearFieldInfo;
    AddField('E1VALCONYN'   ,ftString, 100);
    AddField('E1VALCONDATE' ,ftString, 100);
    AddField('Field3' ,ftString, 100);
    AddField('Field4' ,ftString, 100);
    AddField('Field5' ,ftString, 100);
    Open;

    sE1VALCONYN := Fields[0].AsString;

    SQL.Clear;
    if (sbase_yy <= '2011') Then
    Begin
      SQL.Text := ' SELECT COUNT(*) SEL_DATA FROM PEIDPHIS  '+
                  ' WHERE BASE_YY = '''+ sbase_yy +'''      '+
                  '   AND EMPNO   = '''+ Ed_empno.Text +''' ';
    End Else
    Begin
      SQL.Text := ' SELECT SUM(SEL_DATA) SEL_DATA FROM (    '+
                  ' SELECT COUNT(*) SEL_DATA FROM PEIDPHIS  '+
                  ' WHERE BASE_YY = '''+ sbase_yy +'''      '+
                  '   AND EMPNO   = '''+ Ed_empno.Text +''' '+
                  ' UNION ALL '+
                  ' SELECT COUNT(*) SEL_DATA FROM PEDU2ITEM '+
                  ' WHERE BASE_YY = '''+ sbase_yy +'''      '+
                  '   AND EMPNO   = '''+ Ed_empno.Text +''' '+
                  ' ) ';
    End;

    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;

    Count := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;
    If Count > 0 THEN
    Begin
      with Q_Grid do
      begin
        if (sbase_yy <= '2011') Then // 2011 이전까지는 Learning Point자료를 IDP에 자료이관함.
        Begin                        // 교육시간 : 이수교육시간이 있으면 이수교육시간으로 없으면 교육과정의 교육시간으로 (2012.03.13 HeeYong)
          ParamVariant := ' SELECT A.EDUCODE, ' +
                          '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,2) and base_yy = '''+sbase_yy+''') CN_EKIND, ' +
                          '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) and base_yy = '''+sbase_yy+''') CN_BUMOON,' +
                          '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) and base_yy = '''+sbase_yy+''') CN_TRACK, ' +
                          '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) and base_yy = '''+sbase_yy+''') CN_LEVEL, ' +
                          '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+ sbase_yy +''' AND CODENO = B.EDUFORM) EDUFORMNM, ' +
                          '   B.EDUNAME, to_number(A.EDUMM) EDUMM, NVL(DECODE(A.EDUTIME_GET, NULL, B.EDUTIME, A.EDUTIME_GET), 0) EDUTIME, ' +
                          '   NVL(B.LPOINT,0) LPOINT, NVL(A.EDUSCORE,0) EDUSCORE, NVL(A.GET_LP,0) GET_LP, DECODE(A.ENDYN, ''Y'', ''Y'', ''N'') ENDYN, ''''ITEMNAME ' +
                          ' FROM PEIDPHIS A, PEIDPCRS B ' +
                          ' WHERE A.BASE_YY = B.BASE_YY ' +
                          '   AND A.EDUCODE = B.EDUCODE ' +
                   Format('   AND A.BASE_YY = ''%s'' ' +
                          '   AND A.EMPNO   = ''%s'' ' +
                          ' ORDER BY A.EDUMM ' ,[sbase_yy, Ed_empno.Text]);
        End Else
        Begin                        // 2012 이후는 Learning Point와 IDP를 BASE_YY, EMPNO, EDUCODE 로 연결함.
          if (sbase_yy <= '2013') Then
          Begin
            ParamVariant := ' SELECT EDUCODE, CN_EKIND, CN_BUMOON, CN_TRACK, CN_LEVEL, EDUFORMNM, EDUNAME, EDUMM, NVL(EDUTIME, 0) EDUTIME, NVL(LPOINT, 0) LPOINT, '+
                            ' NVL(EDUSCORE, 0) EDUSCORE, NVL(GET_LP, 0) GET_LP, DECODE(ENDYN, ''Y'', ''Y'', ''N'') ENDYN, ITEMNAME ' +
                            ' FROM ( ' +
                            ' SELECT A.EDUCODE, A.EMPNO, ' +  // LEARNING POINT 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,2) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, TO_NUMBER(SUBSTR(A.EDU_DATE_FROM, 5,2)) EDUMM, A.EDU_TIME EDUTIME, B.LPOINT, ' +
                            '   NVL(A.SCORE, 0) EDUSCORE, NVL(A.EDU_SCORE, 0) GET_LP, A.EDU_PASS_YN ENDYN, '''' ITEMNAME ' +
                            ' FROM PEDU2ITEM A, PEIDPCRS B ' +
                            ' WHERE A.BASE_YY = B.BASE_YY  ' +
                            '   AND A.EDUCODE = B.EDUCODE    ' +
                            '   AND NOT EXISTS (SELECT * FROM PEIDPHIS     ' +
                            '                   WHERE BASE_YY = A.BASE_YY  ' +
                            '                     AND EMPNO   = A.EMPNO    ' +
                            '                     AND EDUCODE = A.EDUCODE) ' +
                            '  AND A.BASE_YY = '''+sbase_yy+'''      ' +
                            '  AND A.EMPNO   = '''+Ed_empno.Text+''' ' +
                            ' UNION ALL ' +
                            '  SELECT A.EDUCODE, A.EMPNO, ' + // IDP 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,2) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, TO_NUMBER(A.EDUMM) EDUMM, B.EDUTIME, B.LPOINT, ' +
                            '   TO_NUMBER(NVL(A.EDUSCORE, 0)) SCORE, TO_NUMBER(NVL(A.GET_LP, 0)), A.ENDYN, ' +
                            '   (SELECT SUBSTR(ITEMNAME,1,INSTR(ITEMNAME,CHR(13))-1) FROM PEDUC WHERE SUBSTR(RABASDATE, 1, 4) = '''+sbase_yy+''' AND ITEMNO = B.ITEMNO) ITEMNAME' +
                            ' FROM PEIDPHIS A, PEIDPCRS B ' +
                            ' WHERE A.BASE_YY = B.BASE_YY ' +
                            '   AND A.EDUCODE = B.EDUCODE ' +
                            '   AND NOT EXISTS (SELECT * FROM PEDU2ITEM    ' +
                            '                   WHERE BASE_YY = A.BASE_YY  ' +
                            '                     AND EMPNO   = A.EMPNO    ' +
                            '       		AND EDUCODE = A.EDUCODE) ' +
                            '  AND A.BASE_YY = '''+sbase_yy+'''      ' +
                            '  AND A.EMPNO   = '''+Ed_empno.Text+''' ' +
                            ' UNION ALL ' +
                            ' SELECT A.EDUCODE, A.EMPNO, ' + // 같이 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,2) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, TO_NUMBER(SUBSTR(C.EDU_DATE_FROM, 5,2)) EDUMM, DECODE(C.EDU_TIME, NULL, B.EDUTIME, C.EDU_TIME) EDU_TIME, ' +
                            '   B.LPOINT, C.SCORE EDUSCORE, C.EDU_SCORE GET_LP, C.EDU_PASS_YN ENDYN, ' +
                            '   (SELECT SUBSTR(ITEMNAME,1,INSTR(ITEMNAME,CHR(13))-1) FROM PEDUC WHERE SUBSTR(RABASDATE, 1, 4) = '''+sbase_yy+''' AND ITEMNO = B.ITEMNO) ITEMNAME' +
                            ' FROM PEIDPHIS A, PEIDPCRS B, PEDU2ITEM C ' +
                            ' WHERE A.BASE_YY = B.BASE_YY              ' +
                            '   AND A.EDUCODE = B.EDUCODE              ' +
                            '   AND A.BASE_YY = C.BASE_YY              ' +
                            '   AND A.EMPNO   = C.EMPNO                ' +
                            '   AND A.EDUCODE = C.EDUCODE              ' +
                            '   AND A.BASE_YY = '''+sbase_yy+'''       ' +
                            '   AND A.EMPNO   = '''+Ed_empno.Text+'''  ' +
                            ' ) ORDER BY EDUMM ' ;
          End
          Else   // 2014년 이후
          Begin
            ParamVariant := ' SELECT EDUCODE, CN_EKIND, CN_BUMOON, CN_TRACK, CN_LEVEL, EDUFORMNM, EDUNAME, EDUMM, NVL(EDUTIME, 0) EDUTIME, NVL(LPOINT, 0) LPOINT, '+
                            ' NVL(EDUSCORE, 0) EDUSCORE, EDUYY GET_LP, DECODE(ENDYN, ''Y'', ''Y'', ''N'') ENDYN, CN_sujun ITEMNAME ' +
                            ' FROM ( ' +
                            ' SELECT A.EDUCODE, A.EMPNO, ' +  // LEARNING POINT 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,1) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 2,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''5'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_sujun,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, SUBSTR('''+sbase_yy+''', 1,2)||SUBSTR(A.EDUCODE, 8,2) EDUYY, TO_NUMBER(SUBSTR(A.EDU_DATE_FROM, 5,2))||''월'' EDUMM, A.EDU_TIME EDUTIME, B.LPOINT, ' +
                            '   NVL(A.SCORE, 0) EDUSCORE, NVL(A.EDU_SCORE, 0) GET_LP, A.EDU_PASS_YN ENDYN ' +// '''' ITEMNAME ' +
                            ' FROM PEDU2ITEM A, PEIDPCRS B ' +
                            ' WHERE A.BASE_YY = B.BASE_YY  ' +
                            '   AND A.EDUCODE = B.EDUCODE    ' +
                            '   AND NOT EXISTS (SELECT * FROM PEIDPHIS     ' +
                            '                   WHERE BASE_YY = A.BASE_YY  ' +
                            '                     AND EMPNO   = A.EMPNO    ' +
                            '                     AND EDUCODE = A.EDUCODE) ' +
                            '  AND A.BASE_YY = '''+sbase_yy+'''      ' +
                            '  AND A.EMPNO   = '''+Ed_empno.Text+''' ' +
                            '  AND A.EDU_PASS_YN   = ''Y'' ' +
                            ' UNION ALL ' +
                            '  SELECT A.EDUCODE, A.EMPNO, ' + // IDP 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,1) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 2,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''5'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_sujun,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, SUBSTR('''+sbase_yy+''', 1,2)||SUBSTR(A.EDUCODE, 8,2) EDUYY, A.EDUMM||''월''  EDUMM, ' +
                            '   TO_NUMBER(B.EDUTIME), B.LPOINT, TO_NUMBER(NVL(A.EDUSCORE, 0)) SCORE, TO_NUMBER(NVL(A.GET_LP, 0)), A.ENDYN ' +
                            ' FROM PEIDPHIS A, PEIDPCRS B ' +
                            ' WHERE A.BASE_YY = B.BASE_YY ' +
                            '   AND A.EDUCODE = B.EDUCODE ' +
                            '   AND NOT EXISTS (SELECT * FROM PEDU2ITEM    ' +
                            '                   WHERE BASE_YY = A.BASE_YY  ' +
                            '                     AND EMPNO   = A.EMPNO    ' +
                            '       		AND EDUCODE = A.EDUCODE) ' +
                            '  AND A.BASE_YY = '''+sbase_yy+'''      ' +
                            '  AND A.EMPNO   = '''+Ed_empno.Text+''' ' +
                            '  AND B.USEYN   = ''Y'' ' +
                            ' UNION ALL ' +
                            ' SELECT A.EDUCODE, A.EMPNO, ' + // 같이 존재
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''1'' AND CODENO = SUBSTR(A.EDUCODE, 1,1) AND BASE_YY = '''+sbase_yy+''') CN_EKIND,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''2'' AND CODENO = SUBSTR(A.EDUCODE, 2,1) AND BASE_YY = '''+sbase_yy+''') CN_BUMOON, ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''3'' AND CODENO = SUBSTR(A.EDUCODE, 3,1) AND BASE_YY = '''+sbase_yy+''') CN_TRACK,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''4'' AND CODENO = SUBSTR(A.EDUCODE, 4,2) AND BASE_YY = '''+sbase_yy+''') CN_LEVEL,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''5'' AND CODENO = SUBSTR(A.EDUCODE, 6,2) AND BASE_YY = '''+sbase_yy+''') CN_sujun,  ' +
                            '   (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = ''A'' AND BASE_YY = '''+sbase_yy+''' AND CODENO = B.EDUFORM) EDUFORMNM,              ' +
                            '   B.EDUNAME, SUBSTR('''+sbase_yy+''', 1,2)||SUBSTR(A.EDUCODE, 8,2) EDUYY, TO_NUMBER(SUBSTR(C.EDU_DATE_FROM, 5,2))||''월'' EDUMM,    ' +
                            '   DECODE(C.EDU_TIME, NULL, B.EDUTIME, C.EDU_TIME) EDU_TIME, ' +
                            '   B.LPOINT, C.SCORE EDUSCORE, C.EDU_SCORE GET_LP, C.EDU_PASS_YN ENDYN ' +
                            ' FROM PEIDPHIS A, PEIDPCRS B, PEDU2ITEM C ' +
                            ' WHERE A.BASE_YY = B.BASE_YY              ' +
                            '   AND A.EDUCODE = B.EDUCODE              ' +
                            '   AND A.BASE_YY = C.BASE_YY              ' +
                            '   AND A.EMPNO   = C.EMPNO                ' +
                            '   AND A.EDUCODE = C.EDUCODE              ' +
                            '   AND A.BASE_YY = '''+sbase_yy+'''       ' +
                            '   AND A.EMPNO   = '''+Ed_empno.Text+'''  ' +
                            ' ) ORDER BY EDUYY, EDUMM ' ;
          End;
        End;
        Close;

        ServiceName := 'PEK2020A_sel2';
        ClearFieldInfo;                       //2014년 기준(매년 수정해서 기존 스 그냥 씀.
        AddField('EDUCODE'  , ftString, 12);  //교육코드 : 삭제 시 필요해서 가져옴.
        AddField('CN_EKIND' , ftString, 50);  //필수여부
        AddField('CN_BUMOON', ftString, 50);  //과정구분
        AddField('CN_TRACK' , ftString, 50);  //부문
        AddField('CN_LEVEL' , ftString, 50);  //관련역량
        AddField('EDUFORMNM', ftString, 50);  //교육형태
        AddField('EDUNAME'  , ftString, 100); //교육명
        AddField('EDUMM'    , ftString, 10);  //교육월
        AddField('EDUTIME'  , ftFloat , 10);  //교육시간
        AddField('LPOINT'   , ftString, 10);  //lp목표
        AddField('EDUSCORE' , ftString, 10);  //점수
        AddField('GET_LP'   , ftString, 10);  //교육년
        AddField('ENDYN'    , ftString, 1);   //완료여부
        AddField('ITEMNAME' , ftString, 200); //수준

        ClearParamInfo;
        SQL.Text := ParamVariant;
        Open;

        TFloatField(FieldByName('EDUTIME')).DisplayFormat := '0.#';
      end;

      B_delete1.Enabled := True;

      E_LPOINT.ValueCaption := '0';
      E_GETLP.ValueCaption  := '0';
      iE_LP := 0;
(*
      with TMaxDataSet do
      begin
        if (sE1VALCONYN = 'Y') Then
        Begin
          ServiceName := 'HINSA_select';  //목표 L/P
          Close;
          SQL.Clear;

          Sql.Add(' SELECT SUM(LPOINT) LPOINT,          ');
          Sql.Add('        NULL, NULL, NULL, NULL FROM  ');
          Sql.Add(' (   ');
          Sql.Add('   SELECT NVL(B.LPOINT, 0) LPOINT,   ');
          Sql.Add('          NULL, NULL, NULL, NULL     ');
          Sql.Add('   FROM PEDU2ITEM A, PEIDPCRS B, PEIDPMAS C  ');
          Sql.Add('   WHERE A.BASE_YY   = B.BASE_YY     ');
          Sql.Add('     AND A.EDUCODE   = B.EDUCODE     ');
          Sql.Add('     AND A.BASE_YY   = C.BASE_YY     ');
          Sql.Add('     AND A.EMPNO     = C.EMPNO       ');
          Sql.Add('     AND ((E1VALCONYN = ''Y'') AND (E1VALCONDATE >= SUBSTRB(A.WRITETIME,1,8))) ');
          Sql.Add('     and a.BASE_YY   = '''+ sbase_yy +'''      ');
          Sql.Add('     AND a.EMPNO     = '''+ Ed_empno.Text +''' ');
          Sql.Add(' UNION ALL ');
          Sql.Add('   SELECT NVL(B.LPOINT, 0)  LPOINT,  ');
          Sql.Add('          NULL, NULL, NULL, NULL     ');
          Sql.Add('   FROM PEIDPHIS A, PEIDPCRS B, PEIDPMAS C  ');
          Sql.Add('   WHERE A.BASE_YY   = B.BASE_YY     ');
          Sql.Add('     AND A.EDUCODE   = B.EDUCODE     ');
          Sql.Add('     AND A.BASE_YY   = C.BASE_YY     ');
          Sql.Add('     AND A.EMPNO     = C.EMPNO       ');
          Sql.Add('     AND ((E1VALCONYN = ''Y'') AND (E1VALCONDATE >= SUBSTRB(A.WRITETIME,1,8))) ');
          Sql.Add('     and a.BASE_YY   = '''+ sbase_yy +'''      ');
          Sql.Add('     AND a.EMPNO     = '''+ Ed_empno.Text +''' ');
          Sql.Add(' ) ');

          ClearFieldInfo;
          AddField('LPOINT' ,ftString, 100);
          AddField('Field2' ,ftString, 100);
          AddField('Field3' ,ftString, 100);
          AddField('Field4' ,ftString, 100);
          AddField('Field5' ,ftString, 100);
        End Else
        Begin
          ServiceName := 'HINSA_select';  //목표 L/P
          Close;
          SQL.Clear;

          Sql.Add(' SELECT SUM(LPOINT) LPOINT,         ');
          Sql.Add('        NULL, NULL, NULL, NULL FROM ');
          Sql.Add(' ( ');
          Sql.Add('   SELECT NVL(B.LPOINT, 0) LPOINT, ');
          Sql.Add('          NULL, NULL, NULL, NULL   ');
          Sql.Add('   FROM PEDU2ITEM A, PEIDPCRS B    ');
          Sql.Add('   WHERE A.BASE_YY   = B.BASE_YY   ');
          Sql.Add('     AND A.EDUCODE   = B.EDUCODE   ');
          Sql.Add('     and a.BASE_YY   = '''+ sbase_yy +'''      ');
          Sql.Add('     AND a.EMPNO     = '''+ Ed_empno.Text +''' ');
          Sql.Add(' UNION ALL ');
          Sql.Add('   SELECT NVL(B.LPOINT, 0)  LPOINT,');
          Sql.Add('          NULL, NULL, NULL, NULL   ');
          Sql.Add('   FROM PEIDPHIS A, PEIDPCRS B     ');
          Sql.Add('   WHERE A.BASE_YY   = B.BASE_YY   ');
          Sql.Add('     AND A.EDUCODE   = B.EDUCODE   ');
          Sql.Add('     and a.BASE_YY   = '''+ sbase_yy +'''      ');
          Sql.Add('     AND a.EMPNO     = '''+ Ed_empno.Text +''' ');
          Sql.Add('     AND SUBSTR(B.EDUCODE,1,1) = ''M'' ');  //필수.
          Sql.Add(' UNION ALL ');
          Sql.Add(' SELECT CASE WHEN SUM(LPOINT) > 50 THEN 50 ');
          Sql.Add('        ELSE  SUM(LPOINT) END LPOINT, ');
          Sql.Add('          NULL, NULL, NULL, NULL   ');
          Sql.Add('   FROM PEIDPHIS A, PEIDPCRS B     ');
          Sql.Add('   WHERE A.BASE_YY   = B.BASE_YY   ');
          Sql.Add('     AND A.EDUCODE   = B.EDUCODE   ');
          Sql.Add('     and a.BASE_YY   = '''+ sbase_yy +'''      ');
          Sql.Add('     AND a.EMPNO     = '''+ Ed_empno.Text +''' ');
          Sql.Add('     AND SUBSTR(B.EDUCODE,1,1) = ''S'' ');  //선택.
          Sql.Add(' ) ');

          ClearFieldInfo;
          AddField('LPOINT' ,ftString, 100);
          AddField('Field2' ,ftString, 100);
          AddField('Field3' ,ftString, 100);
          AddField('Field4' ,ftString, 100);
          AddField('Field5' ,ftString, 100);
        End;
      End;
      Open;
      iE_LP := StrToDec(Fields[0].AsString);
*)
      ServiceName := 'HINSA_select';   //EDUTIME
      Close;
      SQL.Clear;

      Sql.Add(' SELECT ' );
      Sql.Add(' SUM(NVL(EDUTIME, 0)) EDUTIME, ');
      Sql.Add(' NULL, NULL, NULL, NULL        ');
      Sql.Add(' FROM PEIDPHIS A, PEIDPCRS B   ');
      Sql.Add(' WHERE A.BASE_YY = B.BASE_YY   ');
      Sql.Add('   AND A.EDUCODE = B.EDUCODE   ');
      Sql.Add('   AND A.BASE_YY = '''+ sbase_yy +'''      ');
      Sql.Add('   AND A.EMPNO   = '''+ Ed_empno.Text +''' ');


      ClearFieldInfo;
      AddField('EDUTIME' ,ftString, 100);
      AddField('Field2' ,ftString, 100);
      AddField('Field3' ,ftString, 100);
      AddField('Field4' ,ftString, 100);
      AddField('Field5' ,ftString, 100);
      Open;

      E_LPOINT.ValueCaption := Fields[0].AsString;
    end Else
    Begin
      Q_Grid.Close;
      TMaxDataSet.Close;
      B_delete1.Enabled := False;
    End;
  end;
end;

//교육과정(SubForm)
procedure TFM_Main.B_insertClick(Sender: TObject);
begin
  FEduForm := TFEduForm.Create(nil);
  FEduForm.ShowModal;
  Path_data;
end;

procedure TFM_Main.Grid2CellClick(Sender: TObject; const ACell: TOnJCell);
begin
  If Q_Grid.RecordCount > 0 Then
    vDeleteKEY := Q_Grid.Fieldbyname('EDUCODE').AsString
  Else Exit;
end;

procedure TFM_Main.B_deleteClick(Sender: TObject);
begin
  If (vDeleteKEY = '') Then
  begin
    MessageDlg('삭제할 자료를 선택하시기 바랍니다.', mtWarning, [mbOK], 0);
    vDeleteKEY := '';
    System.Exit;
  end;

  If ((vDeleteKEY = 'MVA27B015001') or (vDeleteKEY = 'MVA26B015001')  or
      (vDeleteKEY = 'MVA26B015002') or (vDeleteKEY = 'MVA26B015003')  or
      (vDeleteKEY = 'MVA26B015004') or (vDeleteKEY = 'MGA22B015001')) Then
  begin
    MessageDlg('필수과정(법정필수) 항목은 삭제할 수 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  If (Q_Grid.FieldByName('ENDYN').AsString = 'Y') Then
  begin
    MessageDlg('교육수료 자료는 삭제할 수 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  if MessageDlg('"'+Q_Grid.FieldByName('EDUNAME').AsString+'"' + ' 과정을 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  with TMaxDataSet do
  begin
    SQL.Clear;
    SQL.Text := 'DELETE FROM PEIDPHIS                    '+
                'WHERE BASE_YY = '''+ sbase_yy +'''      '+
                '  AND EMPNO   = '''+ Ed_empno.Text +''' '+
                '  AND EDUCODE = '''+ vDeleteKEY +''' ';

    ServiceName := 'PEA1060A_dml';
    Execute;
  end;

  Path_data;
end;

//--------------------------------------------------------------------------
//Popup  Start
//--------------------------------------------------------------------------

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
  Cb_Base_yy.Text := Copy(Vsysdate, 1, 4);
  Fm_EmpForm.Edit  := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno := Ed_empno.Text;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
  Fm_EmpForm.SqlOpen;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  Fm_EmpForm.Korname <> '' then
  begin
    Ed_empno.Text          := Fm_EmpForm.empno;
    L_korname.ValueCaption := Fm_EmpForm.Korname;
    PRvalconyn             := Fm_EmpForm.Conyn;
    PE1valconyn            := Fm_EmpForm.Finyn;
    Select_BaseData;
  end;
end;

procedure TFM_Main.E_jmtrackInitPopup(Sender: TObject);
begin
  If      (TOnWinPopupEdit(Sender).Tag = 0) Then //직무Track
  Begin
    FM_TRACK               := TFM_pmTrack.Create(Self);
    FM_TRACK.Insa_Session  := TmaxSession;
    TOnWinPopupEdit(Sender).PopupControl := FM_TRACK;
    FM_TRACK.Edit          := TOnWinPopupEdit(Sender);
    FM_TRACK.PL_Init;
  End
  Else If (TOnWinPopupEdit(Sender).Tag = 1) Then //직무수준
  Begin
    FM_LEVEL               := TFM_pmLevel.Create(Self);
    FM_LEVEL.Insa_Session  := TmaxSession;
    TOnWinPopupEdit(Sender).PopupControl := FM_LEVEL;
    FM_LEVEL.Edit          := TOnWinPopupEdit(Sender);
    FM_LEVEL.PL_Init;
    FM_LEVEL.Value         := '1';
  End Else;
end;

procedure TFM_Main.E_jmtrackCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;

  If      (TOnWinPopupEdit(Sender).Tag = 0) Then //직무Track
  Begin
    if  Accept then
    begin
      E_bumoon.ValueCaption        := FM_TRACK.FG_BUMOONNAME;
      E_bumoon.Hint                := FM_TRACK.FG_BUMOON;
      TOnWinPopupEdit(Sender).Text := FM_TRACK.FG_TRACKNAME;
      TOnWinPopupEdit(Sender).Hint := FM_TRACK.FG_TRACK;
      E_jmtrack.Hint               := FM_TRACK.FG_TRACK;
      Accept := False;
    end;
  End
  Else If (TOnWinPopupEdit(Sender).Tag = 1) Then //직무수준
  Begin
    if  Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_LEVEL.FG_LEVELNAME;
      TOnWinPopupEdit(Sender).Hint := FM_LEVEL.FG_LEVEL;
      E_jmlevel.Hint               := FM_LEVEL.FG_LEVEL;
      Accept := False;
    end;
  End;

  If   (E_jmtrack.text = ''       ) or (E_jmlevel.text = ''       ) or
       (E_jmtrack.text <> vjmtrack) or (E_jmlevel.text <> vjmlevel) Then
       B_save.Enabled := True
  Else
       B_save.Enabled := False;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FM_TRACK.free;
  FM_LEVEL.free;
  FM_DUTYDEPT.free;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var vWorkTask, vaftplan : String;
begin
  if  (VSysdate < IDPstdate) or (VSysdate > IDPeddate) then
  begin
    ShowMessage('My Plan 등록 및 결재 기간이 만료 되었습니다. ');
    Exit;
  end;

  if  Bt_save.Caption = '저장' then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      SQL.Text := 'Update PEIDPMAS                                        '+
                  '   Set SGNEXT    = '''+ On_LCnow.Text  +''',           '+
                  '       LCNOW     = '''+ On_OSnext.Text +''',           '+
                  '       LCNEXT    = '''+ On_SGnow.Text  +''',           '+
                  '       WRITEEMP  = '''+ Aempno         +''',           '+
                  '       WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                  ' WHERE BASE_YY   = '''+ sBase_yy +'''                  '+
                  '   AND EMPNO     = '''+ Ed_empno.Text +'''             ';

      if Execute then
      begin
        if TOnFocusButton(Sender).Name = 'BT_Save' then
        MessageDlg(BT_Save.Caption+' 작업을 완료했습니다.', mtInformation, [mbOK], 0);
      end
      else
      begin
        if TOnFocusButton(Sender).Name = 'BT_Save' then
          MessageDlg(BT_Save.Caption+' 작업을 실패했습니다. 관리자에게 문의 바랍니다.', mtInformation, [mbOK], 0);
      end;
    end;
  end
  else
  if  Bt_save.Caption = '반려' then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      SQL.Text := 'Update PEIDPMAS                                           '+
//                  '   Set E1empno      = '''+ Leempno         +''',          '+
                  '   Set RVALCONYN    = ''N'',                              '+
                  '       RVALCONDATE  = to_char(sysdate,''YYYYMMDD''),      '+
                  '       E1VALCONYN   = ''R'',                              '+
                  '       E1VALCONDATE = to_char(sysdate,''YYYYMMDD''),      '+
                  '       WRITEEMP     = '''+ Aempno          +''',          '+
                  '       WRITETIME    = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                  ' WHERE BASE_YY      = '''+ sBase_yy        +'''           '+
                  '   AND EMPNO        = '''+ Ed_empno.Text   +'''           ';

      if Execute then
      begin
        PE1valconyn := 'N';
        if TOnFocusButton(Sender).Name = 'BT_Save' then
          MessageDlg(BT_Save.Caption+' 작업을 완료했습니다.', mtInformation, [mbOK], 0);
      end else
      begin
        if TOnFocusButton(Sender).Name = 'BT_Save' then
          MessageDlg(BT_Save.Caption+' 작업을 실패했습니다. 관리자에게 문의 바랍니다.', mtWarning, [mbOK], 0);
      end;
    end;
  end;
  Select_BaseData;
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  if  ed_empno.Text = '' then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtInformation, [mbOK], 0);
    System.Exit;
  end;

  if Q_Grid.RecordCount = 0 then
  begin
    MessageDlg('등록된 교육과정이 없습니다.', mtInformation, [mbOK], 0);
    System.Exit;
  end;

  try
    PrintForm1 := TPrintForm1.Create(Application);
    PrintForm1.QuickRep1.Preview;
  finally
    PrintForm1.free;
  end;
end;

procedure TFM_Main.B_saveClick(Sender: TObject);
var  Flag : integer;
     E1empno : String;
begin
  if trim(E_jmtrack.text) = '' then
  begin
    MessageDlg('직무분야을 선택하지 않았습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
    E_jmtrack.SetFocus;
    Exit;
  end;

  with TMaxDataSet_HInsa do
  Begin
    ServiceName := 'HINSA_select';  //팀장조회
    Close;
    SQL.Clear;

    Sql.Add(' SELECT EMPNO, NULL, NULL, NULL, NULL  ');
    Sql.Add(' FROM pimpmas                          ');
    Sql.Add(' WHERE jobdept    = '''+ pdeptcode+''' ');
    Sql.Add('   AND jobpayrayn = ''Y'' ');

    ClearFieldInfo;
    AddField('EMPNO'  ,ftString, 100);
    AddField('Field2' ,ftString, 100);
    AddField('Field3' ,ftString, 100);
    AddField('Field4' ,ftString, 100);
    AddField('Field5' ,ftString, 100);
    Open;

    E1empno := Fields[0].AsString;
  End;

  with TMaxDataSet do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT COUNT(*) SEL_DATA FROM PEIDPMAS     '+
                ' WHERE BASE_YY   ='''+ sbase_yy      +'''  '+
                '   AND EMPNO     ='''+ ED_empno.text +'''  ';
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;

    Flag := TMaxDataSet.FieldByName('SEL_DATA').AsInteger;
  end;

  with TMaxDataSet do
  begin
    if  Flag = 0 then
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      sql.text  := 'INSERT INTO PEIDPMAS                                       '+
                   '       (BASE_YY,  EMPNO,                                   '+
                   '        ORGNUM,   DEPTCODE,   PAYCL,   PAYCLDATE,          '+
                   '        BUMOON,   JMTRACK,  JMLEVEL,   E1empno,            '+
                   '        WRITEEMP, WRITETIME                              ) '+
                   'VALUES ('''+ sbase_yy       +''', '''+ ed_empno.text +''', '+
                   '        '''+ porgnum        +''', '''+ pdeptcode     +''', '+
                   '        '''+ ppaycl         +''', '''+ ppaycldate    +''', '+
                   '        '''+ E_bumoon.Hint  +''', '''+ E_jmtrack.Hint+''', '+
                   '        '''+ E_jmlevel.Hint +''', '''+ E1empno       +''', '+
                   '        '''+ Aempno         +''',                          '+
                   '        TO_CHAR(SYSDATE,''YYYYMMDDHHMISS'')) ';
    end
    else
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      SQL.Text  := 'UPDATE PEIDPMAS                                       '+
                  '   SET BUMOON    = '''+ E_bumoon.Hint+''',             '+
                  '       JMTRACK   = '''+ E_jmtrack.Hint+''',            '+
                  '       JMLEVEL   = '''+ E_jmlevel.Hint+''',            '+
                  '       E1empno   = '''+ E1empno       +''',            '+
                  '       WRITEEMP  = '''+ Aempno        +''',            '+
                  '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHHMISS'') '+
                  ' WHERE BASE_YY   = '''+ sBase_yy      +'''             '+
                  '   AND EMPNO     = '''+ Ed_empno.Text +'''             ';
    end;

    if Execute then
    begin
      MessageDlg('성공적으로 저장했습니다.', mtInformation, [mbOK], 0);
    end
    else
    begin
      MessageDlg('저장작업을 실패했습니다.관리자에게 문의 바랍니다.', mtInformation, [mbOK], 0);
    end;
  end;
  Select_BaseData;
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
begin
  if  (VSysdate < IDPstdate) or (VSysdate > IDPeddate) then
  begin
    ShowMessage('My Plan 등록 및 결재 기간이 만료 되었습니다. ');
    Exit;
  end;

  if  BT_Confirm.Caption = '결재상신' then
  begin
    if (FL_CheckNullAnswer = False) Then Exit;
    BT_SaveClick(Sender);

    if MessageBox(handle,PChar('결재상신을 하시면 등록하신 내용을 수정하실 수 없습니다.'+#13+#13+
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
      SQL.Text  := 'Update PEIDPMAS                                          '+
                  '   Set RVALCONYN     = ''Y'',                             '+
                  '       RVALCONDATE   = to_char(sysdate,''YYYYMMDD''),     '+
                  '       E1VALCONYN    = ''N'',                             '+
                  '       E1VALCONDATE  = '''',                              '+
                  '       WRITEEMP  = '''+ Aempno          +''',             '+
                  '       WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'')    '+
                  ' WHERE BASE_YY   = '''+ sBase_yy +'''                     '+
                  '   AND EMPNO     = '''+ Ed_empno.Text +'''                ';
      Execute;
      PRvalconyn := 'Y';
    end;

    //==============================================================================//
    SendProgID  := 'PEK2020A';  //프로그램 ID
    SendEmpno   := Ed_empno.Text;     //발송자(로그인 사번)
    ReceiveYN   := 'N';
    MailSubject := '['+Ed_empno.Text+'-'+ L_korname.ValueCaption +' 매니저의 My Plan 결재 요청]';
    MailBody    := '['+Ed_empno.Text+'-'+ L_korname.ValueCaption +']매니저님이 My Plan 등록을 완료하였습니다. '+#13#13+
                   'My Plan에 대하여 결재해 주시기 바랍니다. '+#13#13+
                   '[종합인사정보시스템] ▶ [교육] ▶ [My Plan] ▶ My Plan 등록' +#13#13+
                   ' => 결재상신한 사원 선택후 등록 내용을 확인하시고 결재버튼 클릭 ';
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
                '상사께 [My Plan 결재 요청] 메시지를 '+#13+
                '직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
      System.Exit;
    end;
  end
  else
  if  BT_Confirm.Caption = '결재' then
  begin
    if MessageBox(handle,PChar('등록 내용에 대해 모두 확인을 마치셨으면 결재하시기 바랍니다.'+#13+#13+
                         '결재하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
    begin
      system.Exit;
    end;

    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      SQL.Text  := 'Update PEIDPMAS                                           '+
//                  '   Set E1empno      = '''+ Leempno        +''',            '+
                  '   Set E1VALCONYN   = ''Y'',                              '+
                  '       E1VALCONDATE = to_char(sysdate,''YYYYMMDD''),      '+
                  '       WRITEEMP     = '''+ Aempno        +''',            '+
                  '       WRITETIME    = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                  ' WHERE BASE_YY      = '''+ sBase_yy      +'''             '+
                  '   AND EMPNO        = '''+ Ed_empno.Text +'''             ';

      Execute;
      PE1valconyn := 'Y';
    end;
  end;
  MessageDlg(BT_Confirm.Caption+' 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
  Select_BaseData;
end;


function TFM_Main.FL_CheckNullAnswer:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  Result := False;

  if trim(E_jmtrack.text) = '' then
  begin
    MessageDlg('직무분야을 선택하지 않았습니다.' +#13 + '확인 후 다시입력하십시오.',mtWarning,[mbOK],0);
    E_jmtrack.SetFocus;
    Exit;
  end;

  if (Pos('(Max 1000Byte)' ,On_LCnow.Text)  > 0) Then On_LCnow.Text  := '';
  if (Pos('(Max 1000Byte)' ,On_OSnext.Text) > 0) Then On_OSnext.Text := '';
  if (Pos('(Max 1000Byte)' ,On_SGnow.Text)  > 0) Then On_SGnow.Text  := '';

  Result := True;
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

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;


procedure TFM_Main.BT_lpointClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  if  length(Ed_empno.Text) < 4  then
  begin
    MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
    System.Exit;
  end;

  //자기진단서 및 경력계획서 조회
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, 'PTA3020B');  //Call하는 단위 프로그램의 버젼을 체크..
  if  (not FM_DownLoad.FL_VersionCHK ) or
   (not FileExists(GSHomeDir+'\Bin\3tier\PTA3020B.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Tbin','PTA3020B.EXE','PTA3020B',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
    LSfilename := GSHomeDir          +'\Bin\3Tier\PTA3020B.EXE ,'
                + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@' +','
                + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;
end;

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  if  length(Ed_empno.Text) < 4  then
  begin
    MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
    System.Exit;
  end;

  //자기진단서 및 경력계획서 조회
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, 'PIU3010A');  //Call하는 단위 프로그램의 버젼을 체크..
  if  (not FM_DownLoad.FL_VersionCHK ) or
   (not FileExists(GSHomeDir+'\Bin\3tier\PIU3010A.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ibin','PIU3010A.EXE','PIU3010A',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
    LSfilename := GSHomeDir          +'\Bin\3Tier\PIU3010A.EXE ,'
                + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@' +','
                + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;
end;

procedure TFM_Main.OnFocusButton2Click(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  if  length(Ed_empno.Text) < 4  then
  begin
       MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
       System.Exit;
  end;

  //개인별 업무목표등록 조회
  if vUnionyn = 'Y' then
  begin
       FM_DownLoad := TFM_DownLoad.Create(Application);
       FM_DownLoad.Show;
       FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
       FM_DownLoad.PL_VersionCHK3(3, 'PEA1060D');  //Call하는 단위 프로그램의 버젼을 체크..
       if  (not FM_DownLoad.FL_VersionCHK ) or
        (not FileExists(GSHomeDir+'\Bin\3tier\PEA1060D.EXE')) then
       begin
            FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060D.EXE','PEA1060A',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
       end
       else
       begin
            FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
            LSfilename := GSHomeDir          +'\Bin\3Tier\PEA1060D.EXE ,'
                        + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@' +','
                        + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                        + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                        + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                        + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

            strpcopy( LAarg, LSfilename );
            winexec(LAarg, SW_SHOWNORMAL);

            FM_DownLoad.Close;      // 다운로드 폼 닫기.
       end;
  end
  else
  begin
       FM_DownLoad := TFM_DownLoad.Create(Application);
       FM_DownLoad.Show;
       FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
       FM_DownLoad.PL_VersionCHK3(3, 'PEA1060A');  //Call하는 단위 프로그램의 버젼을 체크..
       if  (not FM_DownLoad.FL_VersionCHK ) or
        (not FileExists(GSHomeDir+'\Bin\3tier\PEA1060A.EXE')) then
       begin
            FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060A.EXE','PEA1060A',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
       end
       else
       begin
            FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
            LSfilename := GSHomeDir          +'\Bin\3Tier\PEA1060A.EXE ,'
                        + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@' +','
                        + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                        + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                        + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                        + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

            strpcopy( LAarg, LSfilename );
            winexec(LAarg, SW_SHOWNORMAL);

            FM_DownLoad.Close;      // 다운로드 폼 닫기.
       end;
  end;
end;

procedure TFM_Main.Edit_MemoClick(Sender: TObject);
begin
  if TOnMemo(Sender).Font.Color = clGray then TOnMemo(Sender).Text := '';
  TOnMemo(Sender).Font.Color := clBlack;
end;

procedure TFM_Main.Edit_MemoExit(Sender: TObject);
begin
  if  trim(TOnMemo(Sender).Text) = '' then
  begin
       case TOnMemo(Sender).tag of
            1 : begin
                  TOnMemo(Sender).Lines.Clear;
                  TOnMemo(Sender).Lines.Add('교육과정 수강 이외에,');
                  TOnMemo(Sender).Lines.Add(' ');
                  TOnMemo(Sender).Lines.Add('당해년도 업무목표 달성 및 전문성 개발을 위한 Action Plans 을 작성해 주세요.');
                  TOnMemo(Sender).Lines.Add(' ');
                  TOnMemo(Sender).Lines.Add('ex) 업무관련 Self - Study (도서명, OJT 등) / 팀내 학습조직 및 세미나 계획 / KMS 활용계획 등');
                  TOnMemo(Sender).Font.Color := clGray;
                end;
            2 : begin
                  TOnMemo(Sender).Lines.Clear;
                  TOnMemo(Sender).Lines.Add('중장기 경력목표 및 개발을 위한 Action Plans 를 작성해 주세요.');
                  TOnMemo(Sender).Lines.Add(' ');
                  TOnMemo(Sender).Lines.Add('ex) 팀내외 새로운 업무경험 계획 / 관련 학위 or 자격증 취득 계획 등');
                  TOnMemo(Sender).Font.Color := clGray;
                end;
       end;
  end;
end;

procedure TFM_Main.Edit_MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    MemoText : string;
begin
  i := 222;
  if key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
       MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
       TOnMemo(Sender).Clear;
       TOnMemo(Sender).Lines.Append(MemoText);
  end;
end;

procedure TFM_Main.BtEmpClick(Sender: TObject);
begin
  Ed_Empno.Text := EdEmp.Text;
  pEmpno        := EdEmp.Text;
  if (Aempno = WorkEmp1) or (Aempno = WorkEmp2) or (Aempno = WorkEmp3) or
     (Aempno = WorkEmp4) or (Aempno = WorkEmp5) or (Aempno = WorkEmp6) or
     (Aempno = WorkEmp7) or (copy(Aempno,1,1) = 'D') then
  begin
    Ed_empno.ButtonWidth := 24;
    Ed_empno.Enabled     := True;
  end;
  PempnoSetup;
end;

procedure TFM_Main.Cb_Base_yyChange(Sender: TObject);
begin
  sbase_yy := Cb_Base_yy.Text;
  E_LPOINT.ValueCaption := '0';
  E_GETLP.ValueCaption  := '0';
  InitBase;

  if (Copy(Vsysdate, 1, 4) = sbase_yy) Then
    BT_idphis.Caption := '전년도 My Plan 이력 조회'
  Else BT_idphis.Caption := '현재 My Plan 이력 조회';

  If (sbase_yy <= '2014') Then PageControl1.ActivePage := TabSheet1
  Else                         PageControl1.ActivePage := TabSheet2;
end;

procedure TFM_Main.InitBase;
begin
  L_Title.Caption := '[ ' + sbase_yy + '년 My Plan 등록 ]';
  PempnoSetup;
end;

procedure TFM_Main.BT_idphisClick(Sender: TObject);
begin
  BTTab := True;
  if (BT_idphis.Caption = '현재 My Plan 이력 조회') Then
    Cb_Base_yy.Text := Copy(Vsysdate, 1, 4)
  Else Cb_Base_yy.Text := IntToStr(StrToInt(Copy(Vsysdate, 1, 4)) - 1);
  BTTab := False;
end;

procedure TFM_Main.E_edutobeClick(Sender: TObject);
begin
  if (Pos('(Max 500Byte)',E_edutobe.Text) > 0) then E_edutobe.Text := '';
  E_edutobe.Font.Color  := clBlack;
end;

procedure TFM_Main.E_edutobeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : integer;
    MemoText : string;
begin
   i := 222;
   if key = i then
   begin
     Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
     MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
     TOnMemo(Sender).Clear;
     TOnMemo(Sender).Lines.Append(MemoText);
   end;
end;

procedure TFM_Main.On_LCnowClick(Sender: TObject);
begin
  case (sender As TOnMemo).tag of
    0: begin
//         if (Pos('(Max 1000Byte)',E_edutobe.Text)  > 0) then E_edutobe.Text  := '';
//         E_edutobe.Font.Color  := clBlack;
      end;
    1: begin
//         if (Pos('(Max 1000Byte)',On_OSnow.Text)  > 0) then On_OSnow.Text  := '';
//         On_OSnow.Font.Color  := clBlack;
      end;
    2: begin
         if (Pos('(Max 1,000Byte)',On_LCnow.Text)  > 0) then On_LCnow.Text  := '';
         On_LCnow.Font.Color  := clBlack;
      end;
    3: begin
         if (Pos('(Max 1,000Byte)',On_OSnext.Text)  > 0) then On_OSnext.Text  := '';
         On_OSnext.Font.Color  := clBlack;
      end;
    4: begin
         if (Pos('(Max 1,000Byte)',On_SGnow.Text)  > 0) then On_SGnow.Text  := '';
         On_SGnow.Font.Color  := clBlack;
      end;
  end;
end;

procedure TFM_Main.BT_HListClick(Sender: TObject);
begin
  //직무별 RoadMap
  FHelp := TFHelp.Create(nil);
  FHelp.Show;
end;

procedure TFM_Main.BT_Excel1Click(Sender: TObject);
var ObjName, FL_Prog : String;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','2017년 자격증 LIST.XLSX','자격증',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
end;

end.

