unit PEF8030A1;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  ExtCtrls, ComCtrls,Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme,
  OnPopupEdit, PeJeonLabel, OnEditMemo, kpaylib, Comobj, PDownLoad, OnRegistry,
  ShellApi, OnInternetFTP, OnEditCombo, OnEditNumCtl, peoutlookbtn,
  PeJeonMemo, pebtnedit, pegradpanl ;

type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    TDml: TTMaxDataSet;
    TDS_Com: TTMaxDataSet;
    Qmas: TTMaxDataSet;
    DBSet1: TTMaxDataSet;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_update: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    Bt_eempcon: TOnFocusButton;
    Bt_eempcan: TOnFocusButton;
    OnSchemeForm1: TOnSchemeForm;
    Lsysdate: TLabel;
    Lsempno: TLabel;
    Panel3: TPanel;
    Ed_empno: TOnWinPopupEdit;
    ED_team: TOnWinPopupEdit;
    Panel5: TPanel;
    Label4: TLabel;
    Label11: TLabel;
    Eda_plan5: TOnEdit;
    Eda_plan4: TOnEdit;
    GroupBox1: TPanel;
    Panel2: TPanel;
    Eda_Sresult1: TOnEdit;
    Eda_Aresult1: TOnEdit;
    Eda_B_result1: TOnEdit;
    Eda_Cresult1: TOnEdit;
    Eda_Dresult1: TOnEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    Eda_propeltask: TOnEdit;
    Eda_plan1: TOnEdit;
    Eda_validx: TOnEdit;
    Eda_Bresult1: TOnEdit;
    Eda_foraim1: TOnEdit;
    GroupBox2: TPanel;
    Panel4: TPanel;
    Eda_Sresult2: TOnEdit;
    Eda_Aresult2: TOnEdit;
    Eda_B_result2: TOnEdit;
    Eda_Cresult2: TOnEdit;
    Eda_Dresult2: TOnEdit;
    Eda_plan2: TOnEdit;
    Eda_validx2: TOnEdit;
    Eda_Bresult2: TOnEdit;
    Eda_foraim2: TOnEdit;
    GroupBox3: TPanel;
    Eda_Sresult3: TOnEdit;
    Panel6: TPanel;
    Eda_Aresult3: TOnEdit;
    Eda_B_result3: TOnEdit;
    Eda_Cresult3: TOnEdit;
    Eda_Dresult3: TOnEdit;
    Eda_plan3: TOnEdit;
    Eda_validx3: TOnEdit;
    Eda_Bresult3: TOnEdit;
    Eda_foraim3: TOnEdit;
    GroupBox4: TPanel;
    Eda_Sresult4: TOnEdit;
    Panel8: TPanel;
    Eda_B_result4: TOnEdit;
    Eda_Cresult4: TOnEdit;
    Eda_Dresult4: TOnEdit;
    Eda_Aresult4: TOnEdit;
    Eda_validx4: TOnEdit;
    Eda_Bresult4: TOnEdit;
    Eda_foraim4: TOnEdit;
    GroupBox5: TPanel;
    Panel16: TPanel;
    Eda_Sresult5: TOnEdit;
    Eda_Aresult5: TOnEdit;
    Eda_B_result5: TOnEdit;
    Eda_Cresult5: TOnEdit;
    Eda_Dresult5: TOnEdit;
    Eda_validx5: TOnEdit;
    Eda_Bresult5: TOnEdit;
    Eda_foraim5: TOnEdit;
    Eda_detweight1: TOnNumberEdit;
    Eda_detweight2: TOnNumberEdit;
    Eda_detweight3: TOnNumberEdit;
    Eda_forweight: TOnNumberEdit;
    Eda_detweight4: TOnNumberEdit;
    Eda_detweight5: TOnNumberEdit;
    PeJeonLabel18: TPeJeonLabel;
    PeJeonLabel19: TPeJeonLabel;
    PeJeonLabel20: TPeJeonLabel;
    PeJeonLabel21: TPeJeonLabel;
    PeJeonLabel22: TPeJeonLabel;
    PeJeonLabel28: TPeJeonLabel;
    PeJeonLabel24: TPeJeonLabel;
    PeJeonLabel26: TPeJeonLabel;
    Label16: TLabel;
    PeJeonLabel23: TPeJeonLabel;
    Label18: TLabel;
    PeJeonLabel30: TPeJeonLabel;
    Label20: TLabel;
    PeJeonLabel31: TPeJeonLabel;
    Label23: TLabel;
    PeJeonLabel32: TPeJeonLabel;
    Label24: TLabel;
    PeJeonLabel35: TPeJeonLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    PeJeonLabel34: TPeJeonLabel;
    Label29: TLabel;
    Label30: TLabel;
    PeJeonLabel33: TPeJeonLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    PeJeonLabel29: TPeJeonLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    PeJeonLabel27: TPeJeonLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    PeJeonLabel25: TPeJeonLabel;
    ms1: TLabel;
    Bt_Exit: TOnFocusButton;
    btn_Print: TOnFocusButton;
    THintMail: TTMaxDataSet;
    Bt_Search: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Bt_ExitClick(Sender: TObject);
    procedure Eda_eprjviewKeyPress(Sender: TObject; var Key: Char);
    procedure Eda_eprjviewChange(Sender: TObject);
    procedure Edb_propeltaskExit(Sender: TObject);
    procedure Eda_eprjviewExit(Sender: TObject);
    procedure EditChangedKEditChangedKeyPresseyPress(Sender: TObject; var Key: Char);
    procedure Eda_Bresult1Click(Sender: TObject);
    procedure Eda_Bresult1Change(Sender: TObject);
    procedure Eda_Bresult2Click(Sender: TObject);
    procedure Eda_Bresult2Change(Sender: TObject);
    procedure Eda_Bresult3Click(Sender: TObject);
    procedure Eda_Bresult3Change(Sender: TObject);
    procedure Eda_Bresult4Click(Sender: TObject);
    procedure Eda_Bresult4Change(Sender: TObject);
    procedure Eda_Bresult5Click(Sender: TObject);
    procedure Eda_Bresult5Change(Sender: TObject);
    procedure Eda_detweight1Exit(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_updateClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Bt_eempconClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure Bt_SearchClick(Sender: TObject);
  private
    { Private declarations }
    Start       : Boolean;
    detailweight: real;
    procedure Data_Display;
    function CheckOfMember(Parameter: String): Boolean;
    procedure Read_PEJNOEMP_det;

  public
    { Public declarations }
    DbSet      : TDataSet;
    Pwork      : string;
    Pgubun     : integer;     // 1: 입력 , 2: 수정
    Pework     : string;
    Lrabasdate : string;
    Brabasdate : string;
    Lfordate   : string;
    Lwriteemp  : string;
    LSeqno     : real;
    UpDateOk   : Boolean;
    gsLastConEv: String; //업무목표최종결재자 (1차 or 2차)

    gbChanged  : Boolean; // 데이터변경유무
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, GSpEMP, FG_Date, SqlText, GSpPAYCL : String;
    Workemp1, Workemp2, Workemp3, Workemp4 : String;
    sOrgnum, GSdeptcode : String;

    Le1empno     : string;  // 1차 평가자

    procedure SetNow;
    procedure Fsvr_UpdateSql(pwork, pgubun: Integer; Param: OleVariant); safecall;
    procedure Save_PEJNOEMP_A(Param : OleVariant; Pgubun : integer);
    function  GetSeqno : real;
    function  Data_Check : boolean;
    function  Get_Code(Acodeid, Acodeno : String) : String;  // 코드명 가져오기
    function  Get_Dept(Acodeid, Acodeno : String) : String;  // 부서명 가져오기
    procedure SendMail;
    Function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UDeptForm, UEmpForm, Hinsa_TmaxDM, pef8030a2, PEF8030A3;


{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

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

end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  Hgubun : string;
begin
  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);

  Lsempno.Caption   := GSkorname + '(' + GSempno +')';
  Ed_empno.Text     := GSempno;

  Lsysdate.Caption  := Copy(FG_Date,1,4)+'/'+Copy(FG_Date,5,2)+'/'+Copy(FG_Date,7,2);
  Pgrade            := copy(GSgrade,3,1);

  GSpPAYCL := FM_Tmax.GetData('paycl', GSempno, '');
  SetNow;

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, ' +
                '       Value2 Field2, ' +
                '       Value3 Field3, ' +
                '         '''' Field4, ' +
                '         '''' Field5  ' +
                '  from PEJNOBAS       ' +
                ' where rabasdate = ''00000000'' ';

    ClearFieldInfo;
    AddField('Field1', ftString, 100);
    AddField('Field2', ftString, 100);
    AddField('Field3', ftString, 100);
    AddField('Field4', ftString, 100);
    AddField('Field5', ftString, 100);
    Open;

    Lrabasdate := FieldByName('Field1').AsString;
    sOrgnum    := FieldByName('Field2').AsString;
    Brabasdate := FieldByName('Field3').AsString;

    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, Value2 Field2,              ' +
                '       Value3 Field3, Value4 Field4,  '''' Field5 ' +
                '  from PEJNOBAS                                   ' +
                ' where rabasdate = '''+Lrabasdate+''' ' ;
    Open;
    workemp1 := FieldByName('Field3').AsString;
    workemp2 := FieldByName('Field4').AsString;
  end;

  Application.ProcessMessages;
  Data_Display;

  if Eda_Bresult1.Text <> '' then
    GroupBox1.Visible := true
  else
    GroupBox1.Visible := false;

  if Eda_Bresult2.Text <> '' then
    GroupBox2.Visible := true
  else
    GroupBox2.Visible := false;

  if Eda_Bresult3.Text <> '' then
    GroupBox3.Visible := true
  else
    GroupBox3.Visible := false;

  if Eda_Bresult4.Text <> '' then
    GroupBox4.Visible := true
  else
    GroupBox4.Visible := false;

  if Eda_Bresult5.Text <> '' then
    GroupBox5.Visible := true
  else
    GroupBox5.Visible := false;

  Eda_B_result1.Enabled:=false;
  Eda_B_result2.Enabled:=false;
  Eda_B_result3.Enabled:=false;
  Eda_B_result4.Enabled:=false;
  Eda_B_result5.Enabled:=false;

  //비중
  Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;

  //평가담당자는 전사원 조회
  if  (GSempno = workemp1) or (GSempno = workemp2) or (copy(GSempno,1,1) = 'D') then
  Begin
    ED_team.Enabled  := True;
    Ed_empno.Enabled := True;
  End
  else
  Begin
    if CheckOfMember(GSempno) = False Then
    Begin
       ShowMessage('프로그램 사용권한이 없거나 평가 대상자가 아닙니다'+#13#13+'프로그램을 종료합니다');
       Application.Terminate;
    End Else Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

  End;
end;

function TFM_Main.CheckOfMember(Parameter: String): Boolean;
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT  A.EMPNO, A.KORNAME, A.payrayn, A.deptcode,  '+
                '   (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME '+
                '  FROM PIMPMAS A '+
                ' WHERE A.PSTATE < ''80'' '+
                '   AND A.EMPNO IN (SELECT DECODE(A.PAYRAYN, ''Y'', A.EMPNO, B.EMPNO) FROM PEJNOMAS B ' +
                '                   WHERE B.RABASDATE = '''+Lrabasdate+''' AND B.RESTIYN = ''Y'') ' +
                '   AND A.EMPNO  = '''+ Parameter +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 100);
    AddField('KORNAME' , ftString, 100);
    AddField('payrayn' , ftString, 100);
    AddField('deptcode', ftString, 100);
    AddField('DEPTNAME', ftString, 100);
    SQL.Text := SqlText;
    Open;

    if TDS1.RecordCount < 1 then CheckOfMember := False
    else
    Begin
      ED_EMPNO.Text := Fields[0].AsString +' - ' +Fields[1].AsString;
      GSdeptcode    := Fields[3].AsString;
      ED_team.Text  := Fields[4].AsString;

      if (Fields[2].AsString = 'N') Then
      Begin
        If GSpPAYCL = 'H10' Then
        Begin
          ED_team.Enabled    := false;
          Ed_empno.Enabled   := false;
          CheckOfMember      := True;

          Bt_update.Visible  := True;
          Bt_Confirm.Visible := True;
          Bt_eempcon.Visible := False;
          Bt_eempcan.Visible := False;
          Result := True;
        End
        Else
        Begin
          CheckOfMember := False;
          Exit;
        End;
      End
      Else
      Begin
        ED_team.Enabled    := false;
        Ed_empno.Enabled   := True;
        CheckOfMember      := True;

        Bt_update.Visible  := False;
        Bt_Confirm.Visible := False;
        Bt_eempcon.Visible := True;
        Bt_eempcan.Visible := True;
      End;
    End;
  end;
end;

procedure TFM_Main.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssleft in shift then
  begin
    Releasecapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TFM_Main.Bt_ExitClick(Sender: TObject);
var
  iRet: Integer;
begin
  UpDateOk := False;

  if Bt_update.Enabled = False then
    Close
  else
  begin
    if gbChanged then
    begin

      iRet := MessageDlg('저장하지 않은 자료가 있습니다. '#13#13+
                         '그래도 종료하시겠습니까?     ',
                         mtConfirmation,[mbYes,mbNo],0);

      if iRet = IDYES then
        Close;
    end
    else
      Close;
  end;
end;

//저장
procedure TFM_Main.Bt_updateClick(Sender: TObject);
var
  Param : OleVariant;
  Msg   : string;
  OleData : OleVariant;
begin
  If Not (Data_Check) Then Exit;
  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT EMPNO,''field2'', ''field3'', ''field4'',''field5'' '+
                '  FROM PEJNOEMP_DET  '+
                ' where rabasdate = '''+ Lrabasdate +''' ' +
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  ( TDS1.RecordCount < 1 )  then Pgubun := 1
    else                               Pgubun := 2;
  end;

  if Pgubun = 1 then     //입력
  begin
    Param := VarArrayOf([Lrabasdate,                               //  0
                         Copy(Ed_empno.Text,1,4),                  //  1
                         replace(Eda_propeltask.Text,'''','`'),    //  2
                         replace(Eda_plan1.Text,'''','`'),         //  3
                         replace(Eda_plan2.Text,'''','`'),         //  4
                         replace(Eda_plan3.Text,'''','`'),         //  5
                         replace(Eda_plan4.Text,'''','`'),         //  6
                         replace(Eda_plan5.Text,'''','`'),         //  7
                         Eda_detweight1.value,                     //  8
                         Eda_detweight2.value,                     //  9
                         Eda_detweight3.value,                     // 10
                         Eda_detweight4.value,                     // 11
                         Eda_detweight5.value,                     // 12
                         replace(Eda_validx.Text,'''','`'),        // 13
                         replace(Eda_validx2.Text,'''','`'),       // 14
                         replace(Eda_validx3.Text,'''','`'),       // 15
                         replace(Eda_validx4.Text,'''','`'),       // 16
                         replace(Eda_validx5.Text,'''','`'),       // 17
                         replace(Eda_foraim1.Text,'''','`'),       // 18
                         replace(Eda_foraim2.Text,'''','`'),       // 19
                         replace(Eda_foraim3.Text,'''','`'),       // 20
                         replace(Eda_foraim4.Text,'''','`'),       // 21
                         replace(Eda_foraim5.Text,'''','`'),       // 22
                         replace(Eda_Sresult1.Text,'''','`'),      // 23
                         replace(Eda_Aresult1.Text,'''','`'),      // 24
                         replace(Eda_Bresult1.Text,'''','`'),      // 25
                         replace(Eda_Cresult1.Text,'''','`'),      // 26
                         replace(Eda_dresult1.Text,'''','`'),      // 27
                         replace(Eda_Sresult2.Text,'''','`'),      // 28
                         replace(Eda_Aresult2.Text,'''','`'),      // 29
                         replace(Eda_Bresult2.Text,'''','`'),      // 30
                         replace(Eda_Cresult2.Text,'''','`'),      // 31
                         replace(Eda_dresult2.Text,'''','`'),      // 32
                         replace(Eda_Sresult3.Text,'''','`'),      // 33
                         replace(Eda_Aresult3.Text,'''','`'),      // 34
                         replace(Eda_Bresult3.Text,'''','`'),      // 35
                         replace(Eda_Cresult3.Text,'''','`'),      // 36
                         replace(Eda_dresult3.Text,'''','`'),      // 37
                         replace(Eda_Sresult4.Text,'''','`'),      // 38
                         replace(Eda_Aresult4.Text,'''','`'),      // 39
                         replace(Eda_Bresult4.Text,'''','`'),      // 40
                         replace(Eda_Cresult4.Text,'''','`'),      // 41
                         replace(Eda_dresult4.Text,'''','`'),      // 42
                         replace(Eda_Sresult5.Text,'''','`'),      // 43
                         replace(Eda_Aresult5.Text,'''','`'),      // 44
                         replace(Eda_Bresult5.Text,'''','`'),      // 45
                         replace(Eda_Cresult5.Text,'''','`'),      // 46
                         replace(Eda_dresult5.Text,'''','`'),      // 47
                         Lwriteemp                                 // 48
                        ]);

  end
  else
  begin
    Param := VarArrayOf([replace(Eda_propeltask.Text,'''','`'),    //  1
                         replace(Eda_plan1.Text,'''','`'),         //  2
                         replace(Eda_plan2.Text,'''','`'),         //  3
                         replace(Eda_plan3.Text,'''','`'),         //  4
                         replace(Eda_plan4.Text,'''','`'),         //  5
                         replace(Eda_plan5.Text,'''','`'),         //  6
                         Eda_detweight1.value,                     //  7
                         Eda_detweight2.value,                     //  8
                         Eda_detweight3.value,                     //  9
                         Eda_detweight4.value,                     // 10
                         Eda_detweight5.value,                     // 11
                         replace(Eda_validx.Text,'''','`'),        // 12
                         replace(Eda_validx2.Text,'''','`'),       // 13
                         replace(Eda_validx3.Text,'''','`'),       // 14
                         replace(Eda_validx4.Text,'''','`'),       // 15
                         replace(Eda_validx5.Text,'''','`'),       // 16
                         replace(Eda_foraim1.Text,'''','`'),       // 17
                         replace(Eda_foraim2.Text,'''','`'),       // 18
                         replace(Eda_foraim3.Text,'''','`'),       // 19
                         replace(Eda_foraim4.Text,'''','`'),       // 20
                         replace(Eda_foraim5.Text,'''','`'),       // 21
                         replace(Eda_Sresult1.Text,'''','`'),      // 22
                         replace(Eda_Aresult1.Text,'''','`'),      // 23
                         replace(Eda_Bresult1.Text,'''','`'),      // 24
                         replace(Eda_Cresult1.Text,'''','`'),      // 25
                         replace(Eda_dresult1.Text,'''','`'),      // 26
                         replace(Eda_Sresult2.Text,'''','`'),      // 27
                         replace(Eda_Aresult2.Text,'''','`'),      // 28
                         replace(Eda_Bresult2.Text,'''','`'),      // 29
                         replace(Eda_Cresult2.Text,'''','`'),      // 30
                         replace(Eda_dresult2.Text,'''','`'),      // 31
                         replace(Eda_Sresult3.Text,'''','`'),      // 32
                         replace(Eda_Aresult3.Text,'''','`'),      // 33
                         replace(Eda_Bresult3.Text,'''','`'),      // 34
                         replace(Eda_Cresult3.Text,'''','`'),      // 35
                         replace(Eda_dresult3.Text,'''','`'),      // 36
                         replace(Eda_Sresult4.Text,'''','`'),      // 37
                         replace(Eda_Aresult4.Text,'''','`'),      // 38
                         replace(Eda_Bresult4.Text,'''','`'),      // 39
                         replace(Eda_Cresult4.Text,'''','`'),      // 40
                         replace(Eda_dresult4.Text,'''','`'),      // 41
                         replace(Eda_Sresult5.Text,'''','`'),      // 42
                         replace(Eda_Aresult5.Text,'''','`'),      // 43
                         replace(Eda_Bresult5.Text,'''','`'),      // 44
                         replace(Eda_Cresult5.Text,'''','`'),      // 45
                         replace(Eda_dresult5.Text,'''','`'),      // 46
                         Lwriteemp,                                // 47
                         Lrabasdate,                               // 48
                         Copy(Ed_empno.Text,1,4)                   // 49
//                         FloatToStr(LSeqno)                        // 50
                        ]);
  end;

  Save_PEJNOEMP_A(Param, Pgubun);
end;

procedure TFM_Main.Fsvr_UpdateSql(pwork, pgubun: Integer; Param: OleVariant);
begin
//  if pwork = 1 then  Save_PEJNOEMP_A(Param,Pgubun);
end;

procedure TFM_Main.Save_PEJNOEMP_A(Param : OleVariant; Pgubun : integer);
var
  SqlText : string;
  MainWeight : real;
  Ltime   : string;
  Hgubun  : string;
begin
  SqlText := '';
  LSeqno  := 0;
  Ltime   := GSsysdate;


  if Pgubun = 1 then  // 입력
  begin
    lSeqno := GetSeqno;
    Mainweight := Param[8]+Param[9]+Param[10]+Param[11]+Param[12];

    SqlText := Format('INSERT INTO PEJNOEMP_DET         '+
                      ' (rabasdate    , empno      ,    '+
                      '  seqno        , propeltask ,    '+
                      '  mainweight   , detailtask1,    '+
                      '  detailtask2  , detailtask3,    '+
                      '  detailtask4  , detailtask5,    '+
                      '  detailweight1, detailweight2,  '+
                      '  detailweight3, detailweight4,  '+
                      '  detailweight5, validx1,        '+
                      '  validx2      , validx3,        '+
                      '  validx4      , validx5  ,      '+
                      '  valfunction1 , valfunction2,   '+
                      '  valfunction3 , valfunction4,   '+
                      '  valfunction5 , sresultclass1,  '+
                      '  aresultclass1,bresultclass1,   '+
                      '  cresultclass1,dresultclass1,   '+
                      '  sresultclass2,                 '+
                      '  aresultclass2,bresultclass2,   '+
                      '  cresultclass2,dresultclass2,   '+
                      '  sresultclass3,                 '+
                      '  aresultclass3,bresultclass3,   '+
                      '  cresultclass3,dresultclass3,   '+
                      '  sresultclass4,                 '+
                      '  aresultclass4,bresultclass4,   '+
                      '  cresultclass4,dresultclass4,   '+
                      '  sresultclass5,                 '+
                      '  aresultclass5,bresultclass5,   '+
                      '  cresultclass5,dresultclass5,   '+
                      '  writeemp , writetime)          '+
                      'VALUES  '+
                      ' (''%s'' , ''%s'' , '+
                      '    %f   , ''%s'' , '+
                      '    %f   , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '    %f   ,   %f ,   '+
                      '    %f   ,   %f ,   '+
                      '    %f   , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' , '+
                      '  ''%s'' , ''%s'' ) ',
                [Param[0], Param[1],
                lSeqno,    Param[2],
                Mainweight,Param[3],
                Param[4],  Param[5],
                Param[6],  Param[7],
                StrToFloat(Param[8]),  StrToFloat(Param[9]),
                StrToFloat(Param[10]), StrToFloat(Param[11]),
                StrToFloat(Param[12]), Param[13],
                Param[14], Param[15],
                Param[16], Param[17],
                Param[18], Param[19],
                Param[20], Param[21],
                Param[22], Param[23],
                Param[24], Param[25],
                Param[26], Param[27],
                Param[28], Param[29],
                Param[30], Param[31],
                Param[32], Param[33],
                Param[34], Param[35],
                Param[36], Param[37],
                Param[38], Param[39],
                Param[40], Param[41],
                Param[42], Param[43],
                Param[44], Param[45],
                Param[46], Param[47],
                Param[48], Ltime ]);
  end
  else
  begin
    SqlText := Format('UPDATE PEJNOEMP_DET SET '+
                    '  propeltask    = ''%s'', '+              //  0
                    '  mainweight    = ''%f'', '+              //
                    '  detailtask1   = ''%s'', '+              //  1
                    '  detailtask2   = ''%s'', '+              //  2  
                    '  detailtask3   = ''%s'', '+              //  3  
                    '  detailtask4   = ''%s'', '+              //  4
                    '  detailtask5   = ''%s'', '+              //  5
                    '  detailweight1 = ''%f'', '+              //  6
                    '  detailweight2 = ''%f'', '+              //  7  
                    '  detailweight3 = ''%f'', '+              //  8  
                    '  detailweight4 = ''%f'', '+              //  9  
                    '  detailweight5 = ''%f'', '+              // 10  
                    '  validx1       = ''%s'', '+              // 11  
                    '  validx2       = ''%s'', '+              // 12  
                    '  validx3       = ''%s'', '+              // 13  
                    '  validx4       = ''%s'', '+              // 14  
                    '  validx5       = ''%s'', '+              // 15  
                    '  valfunction1  = ''%s'', '+              // 16  
                    '  valfunction2  = ''%s'', '+              // 17  
                    '  valfunction3  = ''%s'', '+              // 18
                    '  valfunction4  = ''%s'', '+              // 19
                    '  valfunction5  = ''%s'', '+              // 20  
                    '  sresultclass1  = ''%s'', '+             // 21  
                    '  aresultclass1  = ''%s'', '+             // 22  
                    '  bresultclass1  = ''%s'', '+             // 23
                    '  cresultclass1  = ''%s'', '+             // 24  
                    '  dresultclass1  = ''%s'', '+             // 25  
                    '  sresultclass2  = ''%s'', '+             // 26  
                    '  aresultclass2  = ''%s'', '+             // 27
                    '  bresultclass2  = ''%s'', '+             // 28  
                    '  cresultclass2  = ''%s'', '+             // 29
                    '  dresultclass2  = ''%s'', '+             // 30
                    '  sresultclass3  = ''%s'', '+             // 31  
                    '  aresultclass3  = ''%s'', '+             // 32  
                    '  bresultclass3  = ''%s'', '+             // 33  
                    '  cresultclass3  = ''%s'', '+             // 34
                    '  dresultclass3  = ''%s'', '+             // 35
                    '  sresultclass4  = ''%s'', '+             // 36  
                    '  aresultclass4  = ''%s'', '+             // 37
                    '  bresultclass4  = ''%s'', '+             // 38
                    '  cresultclass4  = ''%s'', '+             // 39  
                    '  dresultclass4  = ''%s'', '+             // 40  
                    '  sresultclass5  = ''%s'', '+             // 41  
                    '  aresultclass5  = ''%s'', '+             // 42  
                    '  bresultclass5  = ''%s'', '+             // 43
                    '  cresultclass5  = ''%s'', '+             // 44
                    '  dresultclass5  = ''%s'', '+             // 45  
                    '  writeemp       = ''%s'', '+             // 46
                    '  writetime      = ''%s''  '+ // 0..20    // 47
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ', // AND seqno = ''%f'' ',
             [Param[0], (StrToFloat(Param[6])+StrToFloat(Param[7])+StrToFloat(Param[8])+StrToFloat(Param[9])+StrToFloat(Param[10])),
              Param[1]  ,Param[2],  Param[3],  Param[4],  Param[5],
              StrToFloat(Param[6]),StrToFloat(Param[7]),StrToFloat(Param[8]),StrToFloat(Param[9]),StrToFloat(Param[10]),
              Param[11], Param[12], Param[13], Param[14], Param[15],
              Param[16], Param[17], Param[18], Param[19], Param[20],
              Param[21], Param[22], Param[23], Param[24], Param[25],
              Param[26], Param[27], Param[28], Param[29], Param[30],
              Param[31], Param[32], Param[33], Param[34], Param[35],
              Param[36], Param[37], Param[38], Param[39], Param[40],
              Param[41], Param[42], Param[43], Param[44], Param[45],
              Param[46], Ltime,
              // 키부분
              Param[47], Param[48] ]);
//              StrToFloat(Param[49]) ]);
  end;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := Sqltext;

  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
  Begin
    MessageDlg('결재(반려) 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End Else
  Begin
    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Data_Display;
  End;
end;

function TFM_Main.GetSeqno;
var
  Sqltext   : string;
begin
  Result := 0;
(*
  Sqltext := Format('SELECT to_char(NVL(MAX(seqno),0)+1)  '+
                    ' FROM '+tablename+
                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND Seqno <> 99 ',
             [rabasdate,empno] );

  DataModule_Tmax.Csel_SQL := Sqltext1;
  DataModule_Tmax.Csel_Open4;
  Result := StrToFloat(DataModule_Tmax.Csel_gfd4(1));
*)

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT to_char(NVL(MAX(seqno),0)+1) field1,''field2'', ''field3'', ''field4'',''field5'' '+
                '  FROM PEJNOEMP_DET  '+
                ' where rabasdate = '''+ Lrabasdate +''' ' +
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('field1'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    Result := StrToFloat(Fields[0].AsString);
  end;
end;

procedure TFM_Main.Eda_eprjviewKeyPress(Sender: TObject; var Key: Char);
var
  LinePos : DWord;
begin
  if Key = #13 then
  begin
    LinePos := TMemo(Sender).Perform(EM_LINEFROMCHAR,TMemo(Sender).SelStart,0);
    if (LinePos >= 3 ) or (TMemo(Sender).Lines.Count >= 4) then
      Key := #0;
  end;
end;

procedure TFM_Main.Eda_eprjviewChange(Sender: TObject);
var
   i : integer;
begin
   if TMemo(sender).Lines.Count > 4 then
   begin
     for i := TMemo(Sender).Lines.Count - 1 downto 4 do
       TMemo(Sender).Lines.Delete(i);
     TMemo(Sender).SelStart := TMemo(Sender).Perform(EM_LINEINDEX,1,0);
   end;

end;

procedure TFM_Main.Edb_propeltaskExit(Sender: TObject);
var
  i : integer;
  s : string;
begin
  s := TPePanelEdit(Sender).Text;
  for i := 1 to Length(s) do
  begin
    if Ord(s[i]) = 39 then
    begin
      s[i] := Chr(96);  // `문자
    end;
  end;
  TPePanelEdit(Sender).Text := s;
end;

procedure TFM_Main.Eda_eprjviewExit(Sender: TObject);
var
  i : integer;
  s : string;
begin
  s := TpejeonMemo(Sender).Text;
  for i := 1 to Length(s) do
  begin
    if Ord(s[i]) = 39 then
    begin
      s[i] := Chr(96);  // `문자
    end;
  end;
  TpejeonMemo(Sender).Text := s;

end;

procedure TFM_Main.Data_Display;
begin
  Read_PEJNOEMP_det;
  DbSet := DBSet1;

  If (DbSet.RecordCount > 0) Then
  Begin
    if Pgubun = 0 then
    begin
      Eda_propeltask.Text := DbSet.FieldByName('propeltask').AsString;
      Eda_plan1.Text      := DbSet.FieldByName('detailtask1').AsString;
      Eda_plan2.Text      := DbSet.FieldByName('detailtask2').AsString;
      Eda_plan3.Text      := DbSet.FieldByName('detailtask3').AsString;
      Eda_plan4.Text      := DbSet.FieldByName('detailtask4').AsString;
      Eda_plan5.Text      := DbSet.FieldByName('detailtask5').AsString;
      Eda_detweight1.Text := DbSet.FieldByName('detailweight1').AsString;
      Eda_detweight2.Text := DbSet.FieldByName('detailweight2').AsString;
      Eda_detweight3.Text := DbSet.FieldByName('detailweight3').AsString;
      Eda_detweight4.Text := DbSet.FieldByName('detailweight4').AsString;
      Eda_detweight5.Text := DbSet.FieldByName('detailweight5').AsString;
      Eda_validx.Text     := DbSet.FieldByName('validx1').AsString;
      Eda_validx2.Text    := DbSet.FieldByName('validx2').AsString;
      Eda_validx3.Text    := DbSet.FieldByName('validx3').AsString;
      Eda_validx4.Text    := DbSet.FieldByName('validx4').AsString;
      Eda_validx5.Text    := DbSet.FieldByName('validx5').AsString;
      Eda_foraim1.Text    := DbSet.FieldByName('valfunction1').AsString;
      Eda_foraim2.Text    := DbSet.FieldByName('valfunction2').AsString;
      Eda_foraim3.Text    := DbSet.FieldByName('valfunction3').AsString;
      Eda_foraim4.Text    := DbSet.FieldByName('valfunction4').AsString;
      Eda_foraim5.Text    := DbSet.FieldByName('valfunction5').AsString;
      Eda_Sresult1.Text   := DbSet.FieldByName('sresultclass1').AsString;
      Eda_Aresult1.Text   := DbSet.FieldByName('aresultclass1').AsString;
      Eda_Bresult1.Text   := DbSet.FieldByName('bresultclass1').AsString;
      Eda_Cresult1.Text   := DbSet.FieldByName('cresultclass1').AsString;
      Eda_Dresult1.Text   := DbSet.FieldByName('dresultclass1').AsString;
      Eda_Sresult2.Text   := DbSet.FieldByName('sresultclass2').AsString;
      Eda_Aresult2.Text   := DbSet.FieldByName('aresultclass2').AsString;
      Eda_Bresult2.Text   := DbSet.FieldByName('bresultclass2').AsString;
      Eda_Cresult2.Text   := DbSet.FieldByName('cresultclass2').AsString;
      Eda_Dresult2.Text   := DbSet.FieldByName('dresultclass2').AsString;
      Eda_Sresult3.Text   := DbSet.FieldByName('sresultclass3').AsString;
      Eda_Aresult3.Text   := DbSet.FieldByName('aresultclass3').AsString;
      Eda_Bresult3.Text   := DbSet.FieldByName('bresultclass3').AsString;
      Eda_Cresult3.Text   := DbSet.FieldByName('cresultclass3').AsString;
      Eda_Dresult3.Text   := DbSet.FieldByName('dresultclass3').AsString;
      Eda_Sresult4.Text   := DbSet.FieldByName('sresultclass4').AsString;
      Eda_Aresult4.Text   := DbSet.FieldByName('aresultclass4').AsString;
      Eda_Bresult4.Text   := DbSet.FieldByName('bresultclass4').AsString;
      Eda_Cresult4.Text   := DbSet.FieldByName('cresultclass4').AsString;
      Eda_Dresult4.Text   := DbSet.FieldByName('dresultclass4').AsString;
      Eda_Sresult5.Text   := DbSet.FieldByName('sresultclass5').AsString;
      Eda_Aresult5.Text   := DbSet.FieldByName('aresultclass5').AsString;
      Eda_Bresult5.Text   := DbSet.FieldByName('bresultclass5').AsString;
      Eda_Cresult5.Text   := DbSet.FieldByName('cresultclass5').AsString;
      Eda_Dresult5.Text   := DbSet.FieldByName('dresultclass5').AsString;
      LSeqno              := StrToFloat(DbSet.FieldByName('seqno').AsString);
    end;
  End;

  If GSpPAYCL = 'H10' Then
  Begin
    with TDS_Com do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := 'SELECT RPRJCONYN, RPRJE1CONYN, ''field3'', ''field4'',''field5'' '+
                  '  FROM PEJNOMAS                                         '+
                  ' WHERE RABASDATE = '''+ LRABASDATE +''' '+
                  '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

      ClearFieldInfo;
      AddField('RPRJCONYN'   ,ftString, 100);
      AddField('RPRJE1CONYN' ,ftString, 100);
      AddField('field3'      ,ftString, 100);
      AddField('field4'      ,ftString, 100);
      AddField('field5'      ,ftString, 100);
      Open;

      If (FieldByName('RPRJCONYN').AsString = 'Y') Then
      Begin
        Bt_update.Enabled  := False;
        Bt_Confirm.Enabled := False;
        ms1.Caption := '최종완료된 자료입니다. 조회만 가능합니다.';
      End Else
      Begin
        Bt_update.Enabled  := True;
        Bt_Confirm.Enabled := True;
      End;
    end;
  End;

  Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;
end;
//====================================================================================//

procedure TFM_Main.EditChangedKEditChangedKeyPresseyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #13 then gbChanged := True;
end;

procedure TFM_Main.Eda_Bresult1Click(Sender: TObject);
begin
  GroupBox1.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult1Change(Sender: TObject);
begin
  Eda_B_result1.text:=Eda_Bresult1.text;
  GroupBox1.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult2Click(Sender: TObject);
begin
 GroupBox2.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult2Change(Sender: TObject);
begin
  Eda_B_result2.text:=Eda_Bresult2.text;
  GroupBox2.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult3Click(Sender: TObject);
begin
  GroupBox3.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult3Change(Sender: TObject);
begin
  Eda_B_result3.text:=Eda_Bresult3.text;
  GroupBox3.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult4Click(Sender: TObject);
begin
  GroupBox4.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult4Change(Sender: TObject);
begin
  Eda_B_result4.text:=Eda_Bresult4.text;
  GroupBox4.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult5Click(Sender: TObject);
begin
  GroupBox5.Visible:=true;
end;

procedure TFM_Main.Eda_Bresult5Change(Sender: TObject);
begin
  Eda_B_result5.text:=Eda_Bresult5.text;
  GroupBox5.Visible:=true;
end;

procedure TFM_Main.Eda_detweight1Exit(Sender: TObject);
var
 v_mainweight,sql   : string;
begin
  if Pgubun = 1 then    // 수정
    begin
      Sql := 'select sum(mainweight) from PEJNOEMP_DET'+
      format(' WHERE rabasdate=''%s'' and empno = ''%s'' and seqno <> ''%s'' ',[Lrabasdate, Copy(Ed_empno.Text, 1, 4), FloatToStr(LSeqno)]);

      DataModule_Tmax.Csel_SQL := Sql;
      DataModule_Tmax.Csel_Open3;
      v_mainweight := DataModule_Tmax.Csel_gfd4(1);

      if v_mainweight <> '' then
        v_mainweight := DataModule_Tmax.Csel_gfd4(1)
      else
        v_mainweight := '0';

      Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;
      if Eda_forweight.value > 100 then
       begin
         MessageDlg('비중이 100을 초과하였습니다.',mtError, [mbOk], 0);
         case (sender As TOnNumberEdit).tag of
           0: begin
                Eda_detweight1.Clear;
                Eda_detweight1.SetFocus;
              end;
           1: begin
                Eda_detweight2.Clear;
                Eda_detweight2.SetFocus;
              end;
           2: begin
                Eda_detweight3.Clear;
                Eda_detweight3.SetFocus;
              end;
           3: begin
                Eda_detweight4.Clear;
                Eda_detweight4.SetFocus;
              end;
           4: begin
                Eda_detweight5.Clear;
                Eda_detweight5.SetFocus;
              end;
         end;

       end;
    end
  else
  begin
    Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;
    if Eda_forweight.value > 100 then
     begin
       MessageDlg('비중이 100을 초과하였습니다.',mtError, [mbOk], 0);
         case (sender As TOnNumberEdit).tag of
           0: begin
                Eda_detweight1.Clear;
                Eda_detweight1.SetFocus;
              end;
           1: begin
                Eda_detweight2.Clear;
                Eda_detweight2.SetFocus;
              end;
           2: begin
                Eda_detweight3.Clear;
                Eda_detweight3.SetFocus;
              end;
           3: begin
                Eda_detweight4.Clear;
                Eda_detweight4.SetFocus;
              end;
           4: begin
                Eda_detweight5.Clear;
                Eda_detweight5.SetFocus;
              end;
         end;

     end;
  end;

  if (sender As TOnNumberEdit).Value > 60 then
    begin
      MessageDlg('상세비중이 60을 초과하였습니다.',mtError, [mbOk], 0);
         case (sender As TOnNumberEdit).tag of
           0: begin
                Eda_detweight1.Clear;
                Eda_detweight1.SetFocus;
              end;
           1: begin
                Eda_detweight2.Clear;
                Eda_detweight2.SetFocus;
              end;
           2: begin
                Eda_detweight3.Clear;
                Eda_detweight3.SetFocus;
              end;
           3: begin
                Eda_detweight4.Clear;
                Eda_detweight4.SetFocus;
              end;
           4: begin
                Eda_detweight5.Clear;
                Eda_detweight5.SetFocus;
              end;
         end;
    end;
end;

procedure TFM_Main.SetNow;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text :=' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D, '+
               ' ''F2'', ''F3'', ''F4'', ''F5'' ' +
               ' FROM DUAL ' ;

    ClearFieldInfo;
    AddField('D' , ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    GSsysdate := FieldByName('D').AsString;
  End;
end;

procedure TFM_Main.ED_teamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if TeamForm.GSdeptcode <> '' then
  begin
      GSdeptcode   := TeamForm.GSdeptcode;
      ED_team.Text := TeamForm.GSdeptname;
  end;
  Data_Display;
  Ed_empno.Text := '';
end;

procedure TFM_Main.ED_teamInitPopup(Sender: TObject);
begin
  TeamForm.Edit         := TOnWinPopupEdit(Sender);
  TeamForm.PG_Get_Dept;
  TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  Fm_EmpForm.empno <> '' Then
  Begin
    If (Fm_EmpForm.Query1.RecordCount = 0) Then
    Begin
      Bt_eempcon.Visible := False;
      Bt_eempcan.Visible := False;

      ms1.Caption := '평가 할 무기계약직 자료가 존재하지 않습니다.';
    End
    Else If (Fm_EmpForm.Query1.FieldByName('proc').AsString = '결재완료') Then
    Begin
      Bt_eempcon.Enabled := False;
      Bt_eempcan.Enabled := False;

      ms1.Caption := '결재완료된 자료입니다.';
      Data_Display;
    End
    Else If (Fm_EmpForm.Query1.FieldByName('proc').AsString = '반려') Then
    Begin
      Bt_eempcon.Enabled := False;
      Bt_eempcan.Enabled := False;
      ms1.Caption := '반려된 자료입니다.';
      Data_Display;
    End
    Else If (Fm_EmpForm.Query1.FieldByName('proc').AsString = '결재대기') Then
    Begin
      Bt_eempcon.Enabled := True;
      Bt_eempcan.Enabled := True;
      ms1.Caption := '결재대기중 자료입니다.';
      Data_Display;
    End
    Else
    Begin
      Bt_eempcon.Enabled := False;
      Bt_eempcan.Enabled := False;
      ms1.Caption := '미등록 자료입니다.';
      Data_Display;
    End;
  End;
end;


procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
  if (ED_team.Text = '') then
  Begin
    MessageDlg('부서를 선택하시기 바랍니다.' ,mtError,[mbOK],0);
    ED_team.SetFocus;
    System.Exit;
  End;

  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno       := Ed_empno.Text;
  Fm_EmpForm.SqlOpen;

  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
    If (Fm_EmpForm.Query1.RecordCount = 0) Then
    Begin
      MessageDlg('평가 할 무기계약직 자료가 존재하지 않습니다.' ,mtError,[mbOK],0);
      System.Exit;
    End
end;


procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Ed_empnoInitPopup(Sender);
    Data_Display;

    Key := #0;
  end;
end;

procedure TFM_Main.Read_PEJNOEMP_det;
var
  SqlText,sql : string;
begin
   with DBSet1 do
   begin
      SqlText := 'SELECT NVL(TO_CHAR(SEQNO),''0''), NVL(PROPELTASK,''''), NVL(TO_CHAR(MAINWEIGHT),''0''),             '+
                 '       NVL(DETAILTASK1,''''), NVL(DETAILTASK2,''''), NVL(DETAILTASK3,''''),                         '+
                 '       NVL(DETAILTASK4,''''), NVL(DETAILTASK5,''''), NVL(TO_CHAR(DETAILWEIGHT1  ),''0''),           '+
                 '       NVL(TO_CHAR(DETAILWEIGHT2  ),''0''), NVL(TO_CHAR(DETAILWEIGHT3  ),''0''),                    '+
                 '       NVL(TO_CHAR(DETAILWEIGHT4  ),''0''), NVL(TO_CHAR(DETAILWEIGHT5  ),''0''),                    '+
                 '       NVL(VALIDX1,''''), NVL(VALIDX2,''''), NVL(VALIDX3,''''), NVL(VALIDX4,''''),                  '+
                 '       NVL(VALIDX5,''''), NVL(VALFUNCTION1,''''), NVL(VALFUNCTION2,''''), NVL(VALFUNCTION3,''''),   '+
                 '       NVL(VALFUNCTION4,''''), NVL(VALFUNCTION5,''''), NVL(SRESULTCLASS1,''''),                     '+
                 '       NVL(ARESULTCLASS1,''''), NVL(BRESULTCLASS1,''''), NVL(CRESULTCLASS1,''''),                   '+
                 '       NVL(DRESULTCLASS1,''''), NVL(SRESULTCLASS2,''''), NVL(ARESULTCLASS2,''''),                   '+
                 '       NVL(BRESULTCLASS2,''''), NVL(CRESULTCLASS2,''''), NVL(DRESULTCLASS2,''''),                   '+
                 '       NVL(SRESULTCLASS3,''''), NVL(ARESULTCLASS3,''''), NVL(BRESULTCLASS3,''''),                   '+
                 '       NVL(CRESULTCLASS3,''''), NVL(DRESULTCLASS3,''''), NVL(SRESULTCLASS4,''''),                   '+
                 '       NVL(ARESULTCLASS4,''''), NVL(BRESULTCLASS4,''''), NVL(CRESULTCLASS4,''''),                   '+
                 '       NVL(DRESULTCLASS4,''''), NVL(SRESULTCLASS5,''''), NVL(ARESULTCLASS5,''''),                   '+
                 '       NVL(BRESULTCLASS5,''''), NVL(CRESULTCLASS5,''''), NVL(DRESULTCLASS5,''''),                   '+
                 '       NVL(E1PRJOPINON  ,''''), NVL(KORNAME,''''), NVL(EMPNO,''''), NVL(RPRJCONYN,''''),            '+
                 '       NVL(RPRJCONDATE,''''), NVL(E1EMPNO,''''), NVL(E1PRJCONYN,''''), NVL(E1PRJCONDATE,''''),      '+
                 '       NVL(E1PRJVIEW,''''), NVL(E1PRJOBJYN,''''), NVL(EBREMPNO,''''), NVL(EBRPRJCONYN,''''),        '+
                 '       NVL(EBRPRJCONDATE,''''), NVL(EBRPRJVIEW,''''), NVL(EBRVALOBJYN,''''), NVL(E2EMPNO,''''),     '+
                 '       NVL(E2PRJCONYN,''''), NVL(E2PRJCONDATE,''''), NVL(E2PRJVIEW,''''), NVL(E2VALOBJYN,'''')      '+
                 '  FROM (                                                                                            '+
                 '        SELECT B.SEQNO,B.PROPELTASK, B.MAINWEIGHT,                                                  '+
                 '               B.DETAILTASK1, B.DETAILTASK2, B.DETAILTASK3, B.DETAILTASK4, B.DETAILTASK5,           '+
                 '               B.DETAILWEIGHT1, B.DETAILWEIGHT2, B.DETAILWEIGHT3, B.DETAILWEIGHT4, B.DETAILWEIGHT5, '+
                 '               B.VALIDX1, B.VALIDX2, B.VALIDX3, B.VALIDX4, B.VALIDX5,                               '+
                 '               B.VALFUNCTION1, B.VALFUNCTION2, B.VALFUNCTION3, B.VALFUNCTION4, B.VALFUNCTION5,      '+
                 '               B.SRESULTCLASS1, B.ARESULTCLASS1, B.BRESULTCLASS1, B.CRESULTCLASS1, B.DRESULTCLASS1, '+
                 '               B.SRESULTCLASS2, B.ARESULTCLASS2, B.BRESULTCLASS2, B.CRESULTCLASS2, B.DRESULTCLASS2, '+
                 '               B.SRESULTCLASS3, B.ARESULTCLASS3, B.BRESULTCLASS3, B.CRESULTCLASS3, B.DRESULTCLASS3, '+
                 '               B.SRESULTCLASS4, B.ARESULTCLASS4, B.BRESULTCLASS4, B.CRESULTCLASS4, B.DRESULTCLASS4, '+
                 '               B.SRESULTCLASS5, B.ARESULTCLASS5, B.BRESULTCLASS5, B.CRESULTCLASS5, B.DRESULTCLASS5, '+
                 '               B.E1PRJOPINON,  A.KORNAME, A.EMPNO,  '''' RPRJCONYN, '''' RPRJCONDATE,               '+
                 '               A.E1EMPNO,     '''' E1PRJCONYN, '''' E1PRJCONDATE, '''' E1PRJVIEW, '''' E1PRJOBJYN,  '+
                 '               '''' EBREMPNO, '''' EBRPRJCONYN,'''' EBRPRJCONDATE,'''' EBRPRJVIEW,'''' EBRVALOBJYN, '+
                 '               '''' E2EMPNO,  '''' E2PRJCONYN, '''' E2PRJCONDATE, '''' E2PRJVIEW, '''' E2VALOBJYN   '+
                 '          FROM PEJNOMAS A, PEJNOEMP_DET B                                                           '+
                 '         WHERE A.RABASDATE = ''' + LRABASDATE + '''                                                 '+
                 '           AND A.EMPNO     = ''' + Copy(Ed_empno.Text,1,4) + '''                                    '+
                 '           AND A.RABASDATE = B.RABASDATE                                                            '+
                 '           AND A.EMPNO     = B.EMPNO                                                                '+
                 '         )                                                                                          '+
                 ' ORDER BY SEQNO                                                                                     ';

      Close;
      ServiceName := 'PEA1060A_sel2';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('SEQNO'              , ftString, 2  );
      AddField('PROPELTASK'         , ftString, 100 );
      AddField('MAINWEIGHT'         , ftString, 3 );
      AddField('DETAILTASK1'        , ftString, 100);
      AddField('DETAILTASK2'        , ftString, 100 );
      AddField('DETAILTASK3'        , ftString, 100 );
      AddField('DETAILTASK4'        , ftString, 100 );
      AddField('DETAILTASK5'        , ftString, 100 );
      AddField('DETAILWEIGHT1'      , ftString, 3 );
      AddField('DETAILWEIGHT2'      , ftString, 3 );
      AddField('DETAILWEIGHT3'      , ftString, 3 );
      AddField('DETAILWEIGHT4'      , ftString, 3 );
      AddField('DETAILWEIGHT5'      , ftString, 3 );
      AddField('VALIDX1'            , ftString, 100 );
      AddField('VALIDX2'            , ftString, 100 );
      AddField('VALIDX3'            , ftString, 100 );
      AddField('VALIDX4'            , ftString, 100 );
      AddField('VALIDX5'            , ftString, 100 );
      AddField('VALFUNCTION1'       , ftString, 100 );
      AddField('VALFUNCTION2'       , ftString, 100 );
      AddField('VALFUNCTION3'       , ftString, 100 );
      AddField('VALFUNCTION4'       , ftString, 100 );
      AddField('VALFUNCTION5'       , ftString, 100 );
      AddField('SRESULTCLASS1'      , ftString, 100 );
      AddField('ARESULTCLASS1'      , ftString, 100 );
      AddField('BRESULTCLASS1'      , ftString, 100 );
      AddField('CRESULTCLASS1'      , ftString, 100 );
      AddField('DRESULTCLASS1'      , ftString, 100 );
      AddField('SRESULTCLASS2'      , ftString, 100 );
      AddField('ARESULTCLASS2'      , ftString, 100 );
      AddField('BRESULTCLASS2'      , ftString, 100 );
      AddField('CRESULTCLASS2'      , ftString, 100 );
      AddField('DRESULTCLASS2'      , ftString, 100 );
      AddField('SRESULTCLASS3'      , ftString, 100 );
      AddField('ARESULTCLASS3'      , ftString, 100 );
      AddField('BRESULTCLASS3'      , ftString, 100 );
      AddField('CRESULTCLASS3'      , ftString, 100 );
      AddField('DRESULTCLASS3'      , ftString, 100 );
      AddField('SRESULTCLASS4'      , ftString, 100 );
      AddField('ARESULTCLASS4'      , ftString, 100 );
      AddField('BRESULTCLASS4'      , ftString, 100 );
      AddField('CRESULTCLASS4'      , ftString, 100 );
      AddField('DRESULTCLASS4'      , ftString, 100 );
      AddField('SRESULTCLASS5'      , ftString, 100 );
      AddField('ARESULTCLASS5'      , ftString, 100 );
      AddField('BRESULTCLASS5'      , ftString, 100 );
      AddField('CRESULTCLASS5'      , ftString, 100 );
      AddField('DRESULTCLASS5'      , ftString, 100 );
      AddField('E1PRJOPINON'        , ftString, 200 );
      AddField('KORNAME'            , ftString, 12 );
      AddField('EMPNO'              , ftString, 4  );
      AddField('RPRJCONYN'          , ftString, 1  );
      AddField('RPRJCONDATE'        , ftString, 8  );
      AddField('E1EMPNO'            , ftString, 4  );
      AddField('E1PRJCONYN'         , ftString, 1  );
      AddField('E1PRJCONDATE'       , ftString, 8  );
      AddField('E1PRJVIEW'          , ftString, 200);
      AddField('E1VALOBJYN'         , ftString, 1  );
      AddField('EBREMPNO'           , ftString, 4  );
      AddField('EBRPRJCONYN'        , ftString, 1  );
      AddField('EBRPRJCONDATE'      , ftString, 8  );
      AddField('EBRPRJVIEW'         , ftString, 200);
      AddField('EBRVALOBJYN'        , ftString, 1  );
      AddField('E2EMPNO'            , ftString, 4  );
      AddField('E2PRJCONYN'         , ftString, 1  );
      AddField('E2PRJCONDATE'       , ftString, 8  );
      AddField('E2PRJVIEW'          , ftString, 200);
      AddField('E2VALOBJYN'         , ftString, 1  );
      SQL.Text := SqlText;

      Open;
   end;
end;


procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SQLTEXT : String;
  i : Integer;
begin
  If Not (Data_Check) Then Exit;

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT EMPNO, ''field2'', ''field3'', ''field4'',''field5'' '+
                '  FROM PEJNOEMP_DET                                         '+
                ' WHERE RABASDATE = '''+ LRABASDATE +''' '+
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'  , ftString, 100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);
    Open;

    if  (RecordCount < 1 )  then
    Begin
      MessageDlg('임시저장 후 최종완료 하시기 바랍니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  if Application.MessageBox('임시저장 후 최종완료 하시기 바랍니다.' +#13+#13 +
                            '최종완료된 자료는 수정할 수 없습니다. 최종완료 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  SQLText := Format(
            'UPDATE PEJNOMAS  SET ' +#13+
            '       RPRJCONYN   = ''Y'',  ' +#13+
            '       RPRJE1CONYN = '''',   ' +#13+
            '       WRITEEMP    = '''+ GSempno+''', ' +#13+
            '       WRITETIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
            ' WHERE RABASDATE   = ''%s'' '  +#13+
            '  AND  EMPNO       = ''%s'' '  ,
            [LRABASDATE, Copy(Ed_empno.Text,1,4)]);
  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;

  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End;

  if NOT TDml.Execute then
    MessageDlg('최종완료 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);

    SendMail;
    Data_Display;
  end;

end;

function TFM_Main.Data_Check: boolean;
var
  FL_i   : Integer;
  FL_Plan: TOnEdit;
  FL_Validx: TOnEdit;
  FL_Bresult: TOnEdit;
  FL_Foraim: TOnEdit;
  FL_Sresult: TOnEdit;
  FL_Aresult: TOnEdit;
  FL_B_result: TOnEdit;
  FL_Cresult: TOnEdit;
  FL_Dresult: TOnEdit;
  FL_Number: TOnNumberEdit;
Begin
  Result := False;

  if trim(Eda_propeltask.Text) = '' then
  begin
    MessageDlg('직무는 필수 입력항목입니다.' + #13#13#10 +
               '저장할 수 없습니다.',mtinformation,[mbOK],0);
    Exit;
  end;

  if Eda_forweight.Value = 0 then
  begin
    MessageDlg('직무 '+Eda_propeltask.Text+' 비중이 0입니다.' + #13#13#10 +
               '저장할 수 없습니다.',mtinformation,[mbOK],0);
    Exit;
  end;

  for FL_i := 1 to 5 do
  begin
    FL_Number  := nil;
    FL_Number  := TOnNumberEdit(Self.FindComponent('Eda_detweight'+IntToStr(FL_i)));
    FL_plan    := TOnEdit(Self.FindComponent('Eda_plan'    +IntToStr(FL_i)));
    FL_validx  := TOnEdit(Self.FindComponent('Eda_validx'  +IntToStr(FL_i)));
    FL_Bresult := TOnEdit(Self.FindComponent('Eda_Bresult' +IntToStr(FL_i)));
    FL_foraim  := TOnEdit(Self.FindComponent('Eda_foraim'  +IntToStr(FL_i)));
    FL_Sresult := TOnEdit(Self.FindComponent('Eda_Sresult' +IntToStr(FL_i)));
    FL_Aresult := TOnEdit(Self.FindComponent('Eda_Aresult' +IntToStr(FL_i)));
    FL_B_result:= TOnEdit(Self.FindComponent('Eda_B_result'+IntToStr(FL_i)));
    FL_Cresult := TOnEdit(Self.FindComponent('Eda_Cresult' +IntToStr(FL_i)));
    FL_Dresult := TOnEdit(Self.FindComponent('Eda_Dresult' +IntToStr(FL_i)));

    if (FL_Number <> nil) and (FL_Number.Value = 0) then
    begin
      if (FL_plan.Text     <> '') or (FL_validx.Text  <> '') or (FL_Bresult.Text <> '') or
         (FL_foraim.Text   <> '') or (FL_Sresult.Text <> '') or (FL_Aresult.Text <> '') or
         (FL_B_result.Text <> '') or (FL_Cresult.Text <> '') or (FL_Dresult.Text <> '') then
      begin
        MessageDlg('상세비중이 0일때 항목이 입력되어있습니다.' + #13#13#10 +
                   '상세비중을 재조정하거나 항목을 수정 하십시요.',mtinformation,[mbOK],0);
        Exit;
      end;
    end;
  end;
  Result := True;
End;

procedure TFM_Main.Bt_eempconClick(Sender: TObject);
var
  SQLTEXT, sECONYN : String;
  i : Integer;
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
  case TComponent(Sender).Tag of
    0: sECONYN := 'Y';
    1: sECONYN := 'N';
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;                                              
    Sql.Clear;
    Sql.Text := 'SELECT EMPNO , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEJNOMAS                                                '+
                ' WHERE RABASDATE = '''+ LRABASDATE +''' '+
                '   AND RPRJCONYN = ''Y''                '+
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'  ,ftString,  100);
    AddField('field2' ,ftString,  100);
    AddField('field3' ,ftString,  100);
    AddField('field4' ,ftString,  100);
    AddField('field5' ,ftString,  100);
    Open;

    if  (RecordCount < 1 )  then
    Begin
      MessageDlg('해당 팀원이 최종완료 하지 않았습니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  If Not (Data_Check) Then Exit;

  If (sECONYN = 'Y') Then
  Begin
    if Application.MessageBox('결재처리 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End Else
  Begin
    if Application.MessageBox('반려처리 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End;

  SQLText := Format(
            'UPDATE PEJNOMAS  SET ' +#13+
            '       RPRJCONYN  = DECODE('''+ sECONYN+''', ''N'', '''', RPRJCONYN), ' +#13+
            '       RPRJE1CONYN= '''+ sECONYN+''',  ' +#13+
            '       WRITEEMP   = '''+ GSempno+''',  ' +#13+
            '       WRITETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
            ' WHERE RABASDATE  = ''%s'' '   +#13+
            '  AND  EMPNO      = ''%s'' ',
            [LRABASDATE, Copy(Ed_empno.Text,1,4)]);
  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;

  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
    MessageDlg('결재(반려) 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);

  // ----------SEND MAIL-------------
  // 반려 시
    If (sECONYN = 'N') Then
    Begin
      SendProgID  := 'PEF8030A'; //프로그램 ID
      SendEmpno   := GSempno;    //발송자(로그인 사번)
      RcveEmpno   := Copy(Ed_empno.Text,1,4);
//      RcveEmpno   := 'Z113';
      MailSubject := '[ 직무달성도 등록/결재 ] ';
      MailBody    :=  '******************************************************************************' + chr(13) + chr(10) + chr(13) + chr(10) +
                       '(' + Ed_empno.Text +')팀원의 직무달성도 등록이 반려 되었습니다.   '+ chr(13) + chr(10) + chr(13) + chr(10) +
                       '[종합인사시스템]▶[평가]▶[무기 계약직 평가]▶[직무달성도 등록/결재]에 접속하셔서 '+ chr(13) + chr(10) + chr(13) + chr(10) +
                       ' 직무달성도를 확인하여 주시기 바랍니다.' + chr(13) + chr(10) + chr(13) + chr(10) +
                       '******************************************************************************'  + chr(13) + chr(10);

      ReceiveYN   := 'N';
      Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
    End;
  // ----------SEND MAIL-------------

    Data_Display;
    Bt_eempcon.Enabled := False;
    Bt_eempcan.Enabled := False;

    If sECONYN = 'Y' Then ms1.Caption := '결재완료된 자료입니다.'
    Else                  ms1.Caption := '반려된 자료입니다.';
    Data_Display;
  end;
end;

function TFM_Main.Get_Code(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

function TFM_Main.Get_Dept(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('deptname' ,Acodeid,Acodeno);
end;


procedure TFM_Main.btn_PrintClick(Sender: TObject);
begin
  if ((DBSET1.Eof) and (DBSET1.Bof)) then
  begin
   MessageDlg('출력할 데이터가 없습니다.'+#13+#10+''+#13+#10+'출력 작업은 취소 되었습니다.', mtError, [mbOK], 0);
   System.Exit;
  end;

  PrintForm1.rabasdate := copy(Lrabasdate,1,4);
  PrintForm1.PeQuickRepPrn1.Preview;

(*
  if GetBaseYear(5) <= GetBaseYear(3) then      //직위체계변경일<=시스템날짜 band/직책
  begin
       PrintForm1.rabasdate := copy(Lrabasdate,1,4);
       PrintForm1.PeQuickRepPrn1.Preview;
  end
  else
  begin
       PrintForm.rabasdate := copy(Lrabasdate,1,4);
       PrintForm.PeQuickRepPrn1.Preview;
  end;
*)
end;

procedure TFM_Main.SendMail;
var
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
  i : Integer;
begin
  with THintMail do
  begin
    SqlText   := Format(' SELECT EMPNO       field1 '+
                        '      , KORNAME     field2 '+
                        '      , ''field3''  field3 '+
                        '      , ''field4''  field4 '+
                        '      , ''field5''  field5 '+
                        '   FROM PIMEEMP            '+
                        '  WHERE PAYRAYN  = ''Y''   '+
                        '    AND orgnum   = ''%s''  '+
                        '    AND deptcode = ''%s''  '+
                        '  ORDER BY EMPNO ',[sOrgnum, GSdeptcode]);

    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlText;

    ClearFieldInfo;
    AddField('field1', ftString,  100);
    AddField('field2', ftString,  100);
    AddField('field3', ftString,  100);
    AddField('field4', ftString,  100);
    AddField('field5', ftString,  100);
    Open;

    SendProgID  := 'PEF8030A'; //프로그램 ID
    SendEmpno   := GSempno;    //발송자(로그인 사번)
    RcveEmpno   := FieldByName('field1').AsString;
//      RcveEmpno   := 'Z113';
    MailSubject := '[ 직무달성도 등록/결재 ] ';
    MailBody    :=  '******************************************************************************' + chr(13) + chr(10) + chr(13) + chr(10) +
                     '(' + Ed_empno.Text +')팀원의 직무달성도 등록이 완료되었습니다.   '+ chr(13) + chr(10) + chr(13) + chr(10) +
                     ' 팀장께서는 '+ chr(13) + chr(10) +
                     '[종합인사시스템]▶[평가]▶[무기 계약직 평가]▶[직무달성도 등록/결재]에 접속하셔서 '+ chr(13) + chr(10) + chr(13) + chr(10) +
                     '팀원의 직무달성도를 확인하여 주시기 바랍니다.' + chr(13) + chr(10) + chr(13) + chr(10) +
                     '******************************************************************************'  + chr(13) + chr(10);

    ReceiveYN   := 'N';
    Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
  End;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into PZHMAIL                             ');
    SQL.Add('values (to_char(sysdate,''yyyymmddhh24miss'' ), ');  //SENDTIME   메일발송 작업시간
    SQL.Add('        '''+ SendProgID   +''',                 ');  //SENDPROG   발송프로그램 ID
    SQL.Add('        '''+ SendEmpno    +''',                 ');  //SEND_PER   발신자 사번
    SQL.Add('        '''+ RcveEmpno    +''',                 ');  //RCVR_PER,  수신자 사번
    SQL.Add('        ''''                  ,                 ');  //REFR_PER   불필요(종합인사)
    SQL.Add('        '''+ MailSubject  +''',                 ');  //SUBJECT    메일제목
    SQL.Add('        ''''                  ,                 ');  //HEADER1    불필요(종합인사)
    SQL.Add('        '''+ MailBody     +''',                 ');  //BODY1      메일내용
    SQL.Add('        ''''                  ,                 ');  //TAIL1      불필요(종합인사)
    SQL.Add('        '''+ ReceiveYN    +''',                 ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
    SQL.Add('        ''N''                 ,                 ');  //EAI_FLAG
    SQL.Add('        ''''                  )                 ');  //EAI_DATE

    try
      Execute;
    except
      Result := false;
      exit;
    end;
    Result := True;
  end;
end;

procedure TFM_Main.Bt_SearchClick(Sender: TObject);
begin
  FM_Sub := TFM_Sub.Create(nil); // 도움말

  If FM_Sub.Chk = '0' Then FM_Sub.Show
  Else                     FM_Sub.Close;
end;

end.


