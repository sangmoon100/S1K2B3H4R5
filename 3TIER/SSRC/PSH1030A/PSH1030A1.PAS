unit PSH1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit, TmaxFunc, FUNC, OnEditMdate,
  Mask;

type
  TFM_Mainform = class(TForm)
    Panel2: TPanel;
    SB_Help: TStatusBar;
    TDS_Com: TTMaxDataSet;
    TmaxSession: TTMaxSession;
    TDS_Grid: TTMaxDataSet;
    DataSource1: TDataSource;
    SF_Main: TOnSchemeForm;
    TDS_Com1: TTMaxDataSet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    PE_empno: TTMaxPersonPopupEdit;
    SL_job: TOnShapeLabel;
    Panel5: TPanel;
    DataGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Hospital: TOnFocusButton;
    BT_Sports: TOnFocusButton;
    BT_Search: TOnFocusButton;
    B_Act: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    OnShapeLabel2: TOnShapeLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    BT_SchDD: TOnFocusButton;
    ME_ToDate: TOnDateEdit;
    ME_FromDate: TOnDateEdit;
    L_Appdate: TOnShapeLabel;
    procedure BT_HospitalClick(Sender: TObject);
    procedure BT_SportsClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SearchClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure RB2Click(Sender: TObject);
    procedure RB3Click(Sender: TObject);
    procedure B_ActClick(Sender: TObject);
    procedure F_AppDate;
    procedure PageControl2Change(Sender: TObject);

  private
    { Private declarations }
    procedure PL_Com_Contructor;
    procedure PE_empnoSerach;
    Procedure Read_SumRecords(AppYY, Part, Empno : String);
    Procedure Read_SchRecords(Part, Empno : String);

  public
    { Public declarations }

    FG_Empno, FG_korname, FG_grade, FG_Date, FG_Sql : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_Sysdate, FG_Systime : String;
    frdate, todate,todate2, CloseTime : String;
    frdateSP, todateSP : String;
    FL_Giveamt : Double;
    vAdmin  : Boolean;
    FL_MaxApp  : String;
    Function Check_All : Boolean;
    Function Check_Date( InDate : String ) : Boolean;
    Function MonthLastDay(Ymd : String) : Integer;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PSH1030A2, PFamily, PSH1030A3, PSH1030A4, PSH1030A5;     

{$R *.DFM}

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//  TMaxSession.EnvFileName := 'd:\source\newhana.env';
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

  OraConnect;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  // 이부분서부터 업무관련 초기화 부분 코딩 처리...(로그인 사용자)
  FG_empno   := Hinsa_Param(CmdLine,1);
  FG_korname := Hinsa_Param(CmdLine,2);
  FG_grade   := Hinsa_Param(CmdLine,4);

  //의료비 지원내역 Grid.
  DataGrid.Columns[4].Visible  := False;
  DataGrid.Columns[5].Visible  := False;
  DataGrid.Columns[10].Visible := False;
  DataGrid.Columns[11].Visible := False;
  DataGrid.Columns[0].Width    := 90;
  DataGrid.Columns[1].Width    := 90;
  DataGrid.Columns[2].Width    := 90;
  DataGrid.Columns[3].Width    := 90;
  DataGrid.Columns[6].Width    := 90;
  DataGrid.Columns[7].Width    := 90;
  DataGrid.Columns[8].Width    := 90;
  DataGrid.Columns[9].Width    := 90;
  DataGrid.Columns[12].Width   := 90;

  BT_Search.Visible := False;
  vAdmin := False;
  PageControl2.ActivePage := TabSheet1;
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
begin
  if FG_empno <> '' then
  begin
    PE_empno.OnReadEnded := nil;
    PE_empno.Text := FG_empno;
    PE_empno.PL_get_singledata;
  end;

  with TDS_Com do
  begin
    PL_Com_Contructor;
    FG_Sql := 'SELECT SUBSTR(CONTODATE,1,6) field1, '+
              '       SUBSTR(CONTODATE,1,4) field2, '+
              '	      to_char(sysdate,''YYYYMMDDHH24MISS'') field3,'+
              '	      APPFRDATE field4, APPTODATE field5 '+
              '  FROM PSCAPBAS                      ';
    Sql.Text := FG_Sql;
    Open;

    FG_Appdate := FieldByName('field1').AsString;
    FG_AppYY   := FieldByName('field2').AsString;
    L_Appdate.ValueCaption := Copy(FieldByName('field1').AsString,1,4) +' - '+
                              Copy(FieldByName('field1').AsString,5,2);
    FG_Sysdate := copy(FieldByName('field3').AsString,1,8);
    FG_Systime := FieldByName('field3').AsString;
    frdate     := FieldByName('field4').AsString;
    todate     := FieldByName('field5').AsString;
    Close;
  end;

  with TDS_Com do
  begin
    PL_Com_Contructor;

    Sql.Add('SELECT CONTODATE, CLOSETIME,            ');
    Sql.Add('       APPFRDTSP, APPTODTSP, GIVEMAX3  ');
    Sql.Add('  FROM PSCAPBAS                         ');

    Open;

    todate2   := FieldByName('field1').AsString;
    //2014.01.29.  jissi 양혜림, 이승철M 요청
    //체육활동지원금 신청은 신청기간마지막 날까지이며, 의료비는 마감일시까지 프로그램 중단 요청
    CloseTime := FieldByName('field2').AsString;
    frdateSP  := FieldByName('field3').AsString;
    todateSP  := FieldByName('field4').AsString;
    FL_Giveamt:= FieldByName('field5').AsFloat;  //체육활동 지원금(2015년이후 : 1년에 84,000)
    Close;
  end;

  PE_empnoSerach;

(* 권한에서 그룹으로 변경. 2015.10.29  HeeYong
  //복리후생 담당, 관리자는 변경가능
*)
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Clear;

    FG_Sql := ' Select Groupid, ''F2'', ''F3'', ''F4'', ''F5'' '+#13+
              ' from pymenuuser  '                              +#13+
              ' where empno = '''+ Hinsa_Param(cmdline,1) +''' ';
    Sql.Add(FG_Sql);
    Open;
        //관리자                         //복리후생담당자2                 //알바그룹
    if (Fields[0].AsString = 'G001') or (Fields[0].AsString = 'G042') or (Fields[0].AsString = 'G997') then vAdmin := True;

    Close;
  end;

  if vAdmin = True then
  Begin
    PE_Empno.Enabled := True;
    B_Act.visible    := True;
  End
  else
  Begin
    PE_Empno.Enabled := False;
    B_Act.visible    := False;
  End;

  SB_Help.Panels[1].Text :=' ';
  ME_FromDate.Text  := Copy(FG_Date,1,4) + '-' + Copy(FG_Date,5,2) + '-' + '01';
  ME_ToDate.Text    := Copy(FG_Date,1,4) + '-' + Copy(FG_Date,5,2) + '-' + IntToStr(MonthLastDay(FG_Date));

  //연간금액계산용 년월 계산(체육활동비)
  F_AppDate;
  //시작할때 의료비지원내역 기본 출력.
  RB1Click(Self);
end;

procedure TFM_Mainform.PL_Com_Contructor;
begin
  with TDS_com do
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

Procedure TFM_Mainform.Read_SchRecords(Part, Empno : String);
begin
  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select20';
    Close;
    Sql.Clear;

    Sql.Add('SELECT APPDATE, DECODE(PART, ''A'', ''일반질병'', ''중증질병'') PART, ');
    Sql.Add('       EMPNO,   APPAMT, APPSUM, EXTAMT, EXTSUM,        ');
    Sql.Add('       CONAMT,  CONSUM, SETAMT, SETSUM,                ');
    Sql.Add('       NVL((SELECT ((FINDSPEC(SUBSTR(APPDATE,1,4), EMPNO)) - SUPSUM) FROM PSHAPSUM');
    Sql.Add('        WHERE APPDATE = A.APPDATE                      ');
    Sql.Add('          AND PART    = A.PART                         ');
    Sql.Add('          AND EMPNO   = A.EMPNO                        ');
    Sql.Add('          AND APPDATE > ''2015''), 0) PREAMT,          ');
    Sql.Add('       PRESUM, SUPAMT, SUPSUM, ''F16'',                ');
    Sql.Add('       ''F17'',''F18'', ''F19'', ''F20''               ');
    Sql.Add('  FROM PSHAPSUM A                                      ');
    Sql.Add(' WHERE APPDATE >= '''+ Copy(RemoveChar(ME_FromDate.Text,'-'),1,6) +''' ');
    Sql.Add('   AND APPDATE <= '''+ Copy(RemoveChar(ME_ToDate.Text,'-'),1,6)   +''' ');
    If Part = 'A' Then
      Sql.Add('   AND PART   IN (''A'', ''D'')                      ')
    Else
      Sql.Add('   AND PART   = '''+ Part      +'''                  ');
    Sql.Add('   AND EMPNO    = '''+ Empno     +'''                  ');
    Sql.Add(' ORDER BY APPDATE DESC                                 ');
    ClearFieldInfo;

    AddField('APPDATE',ftString, 100); //0  신청일
    AddField('PART'   ,ftString, 100); //1  구분 : a:의료,b:체육,c:선택
    AddField('EMPNO'  ,ftString, 100); //2  사번
    AddField('APPAMT' ,ftFloat , 100); //3  신청금액
    AddField('APPSUM' ,ftFloat , 100); //4  신청금액 누적분
    AddField('EXTAMT' ,ftFloat , 100); //5  제외금액
    AddField('EXTSUM' ,ftFloat , 100); //6  제외금액 누적분
    AddField('CONAMT' ,ftFloat , 100); //7  승인금액
    AddField('CONSUM' ,ftFloat , 100); //8  승인누계
    AddField('SETAMT' ,ftFloat , 100); //9  조정금액
    AddField('SETSUM' ,ftFloat , 100); //10 조정누계
    AddField('PREAMT' ,ftFloat , 100); //11 이월금액
    AddField('PRESUM' ,ftFloat , 100); //12 이월누계
    AddField('SUPAMT' ,ftFloat , 100); //13 지원금액
    AddField('SUPSUM' ,ftFloat , 100); //14 지원금액 누적분
    AddField('F16'    ,ftString, 100);
    AddField('F17'    ,ftString, 100);
    AddField('F18'    ,ftString, 100);
    AddField('F19'    ,ftString, 100);
    AddField('F20'    ,ftString, 100);
    Open;

    TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SETAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SETSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('PREAMT')).DisplayFormat := '#,##0'; //잔여누계로 사용함.(서비스 내리기 싫어서...)
    TFloatField(FieldByName('PRESUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,##0';
  end;
end;

Procedure TFM_Mainform.Read_SumRecords(AppYY, Part, Empno : String);
begin
  //특이자 처리 : PSCASPEC 생성 2015.6.4 HeeYong
  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select20';
    Close;
    Sql.Clear;

    Sql.Add('SELECT APPDATE, DECODE(PART, ''A'', ''일반질병'', ''중증질병'') PART, ');
    Sql.Add('       EMPNO, NVL(APPAMT, 0), NVL(APPSUM, 0), NVL(EXTAMT, 0), NVL(EXTSUM, 0), ');
    Sql.Add('       NVL(CONAMT, 0), NVL(CONSUM, 0), NVL(SETAMT, 0), NVL(SETSUM, 0),        ');
    Sql.Add('       (SELECT ((FINDSPEC(SUBSTR(APPDATE,1,4), EMPNO)) - NVL(SUPSUM, 0)) FROM PSHAPSUM');
    Sql.Add('        WHERE APPDATE = A.APPDATE                      ');
    Sql.Add('          AND PART    = A.PART                         ');
    Sql.Add('          AND EMPNO   = A.EMPNO                        ');
    Sql.Add('          AND APPDATE > ''2015'') PREAMT,              ');
    Sql.Add('       PRESUM, SUPAMT, SUPSUM, ''F16'',                ');
    Sql.Add('       ''F17'',''F18'', ''F19'', ''F20''               ');
    Sql.Add('  FROM PSHAPSUM A                                      ');
    Sql.Add(' WHERE APPDATE >= '''+ FL_MaxApp +'''                  ');
    If Part = 'A' Then
      Sql.Add('   AND PART   IN (''A'', ''D'')                      ')
    Else
      Sql.Add('   AND PART   = '''+ Part      +'''                  ');
    Sql.Add('   AND EMPNO    = '''+ Empno     +'''                  ');
    Sql.Add(' ORDER BY APPDATE DESC                                 ');

    ClearFieldInfo;

    AddField('APPDATE',ftString, 100); //0  신청일
    AddField('PART'   ,ftString, 100); //1  구분 : a:의료,b:체육,c:선택
    AddField('EMPNO'  ,ftString, 100); //2  사번
    AddField('APPAMT' ,ftFloat , 100); //3  신청금액
    AddField('APPSUM' ,ftFloat , 100); //4  신청금액 누적분
    AddField('EXTAMT' ,ftFloat , 100); //5  제외금액
    AddField('EXTSUM' ,ftFloat , 100); //6  제외금액 누적분
    AddField('CONAMT' ,ftFloat , 100); //7  승인금액
    AddField('CONSUM' ,ftFloat , 100); //8  승인누계
    AddField('SETAMT' ,ftFloat , 100); //9  조정금액
    AddField('SETSUM' ,ftFloat , 100); //10 조정누계
    AddField('PREAMT' ,ftFloat , 100); //11 이월금액
    AddField('PRESUM' ,ftFloat , 100); //12 이월누계
    AddField('SUPAMT' ,ftFloat , 100); //13 지원금액
    AddField('SUPSUM' ,ftFloat , 100); //14 지원금액 누적분
    AddField('F16'    ,ftString, 100);
    AddField('F17'    ,ftString, 100);
    AddField('F18'    ,ftString, 100);
    AddField('F19'    ,ftString, 100);
    AddField('F20'    ,ftString, 100);
    Open;

    TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SETAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SETSUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('PREAMT')).DisplayFormat := '#,##0'; //잔여누계로 사용함.(서비스 내리기 싫어서...)
    TFloatField(FieldByName('PRESUM')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,##0';
  end;
end;

procedure TFM_Mainform.BT_SearchClick(Sender: TObject);
begin
  if RB1.Checked then       //의료비
  begin
    DataGrid.Columns[4].Visible  := False;
    DataGrid.Columns[5].Visible  := False;
    DataGrid.Columns[10].Visible := False;
    DataGrid.Columns[11].Visible := False;
    DataGrid.Columns[13].Visible := True;
    DataGrid.Columns[0].Width    := 78;
    DataGrid.Columns[1].Width    := 100;
    DataGrid.Columns[2].Width    := 100;
    DataGrid.Columns[3].Width    := 100;
    DataGrid.Columns[6].Width    := 100;
    DataGrid.Columns[7].Width    := 100;
    DataGrid.Columns[8].Width    := 105;
    DataGrid.Columns[9].Width    := 105;
    DataGrid.Columns[12].Width   := 105;
    DataGrid.Columns[13].Width   := 60;

    if PageControl2.ActivePage = TabSheet1 then Read_SumRecords(FG_AppYY, 'A', PE_empno.Empno)
    Else
    Begin
      if Check_All then Read_SchRecords('A', PE_empno.Empno);
    End;
  end
  else if RB2.Checked then  //체육활동
  begin
    DataGrid.Columns[4].Visible  := True;
    DataGrid.Columns[5].Visible  := False;
    DataGrid.Columns[10].Visible := True;
    DataGrid.Columns[11].Visible := True;
    DataGrid.Columns[13].Visible := False;
    DataGrid.Columns[0].Width    := 78;
    DataGrid.Columns[1].Width    := 78;
    DataGrid.Columns[2].Width    := 78;
    DataGrid.Columns[3].Width    := 78;
    DataGrid.Columns[6].Width    := 78;
    DataGrid.Columns[7].Width    := 78;
    DataGrid.Columns[8].Width    := 78;
    DataGrid.Columns[9].Width    := 85;
    DataGrid.Columns[11].Width   := 80;
    DataGrid.Columns[12].Width   := 85;

    If PageControl2.ActivePage = TabSheet1 then Read_SumRecords(FG_AppYY, 'B', PE_empno.Empno)
    Else
    Begin
      DataGrid.Columns[10].Visible := False;
      DataGrid.Columns[13].Visible := False;
      DataGrid.Columns[7].Width    := 90;
      DataGrid.Columns[8].Width    := 90;
      DataGrid.Columns[9].Width    := 100;
      DataGrid.Columns[11].Width   := 95;
      DataGrid.Columns[12].Width   := 100;
      if Check_All then Read_SchRecords('B', PE_empno.Empno);
    End;
  end
  else if RB3.Checked then  //선택적복리후생
    Read_SumRecords(FG_AppYY, 'C', PE_empno.Empno)
  else
    MessageDlg('조회할 항목을 선택하세요.', mtInformation, [mbOk], 0);

  DataGrid.Fields[0].Alignment := taCenter;
end;

procedure TFM_Mainform.BT_HospitalClick(Sender: TObject);
begin
  If (PE_empno.Text = '') Then
  begin
    MessageDlg('사원번호을 선택하시기 바랍니다.' , mtInformation, [mbOk], 0);
    System.Exit;
  end;

  // if FG_grade[4] in (['A','B']) then PE_Empno.Enabled := True
  // 사용등급에서 권한그룹으로 변경 2016.06.02 HeeYong
  If (vAdmin = True) Then PE_Empno.Enabled := True
  else
  Begin
    if (FG_Sysdate < frdate) or ( FG_Sysdate > todate) then   //의료비
    begin
      MessageDlg('의료비 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                  copy(frdate,1,4)+'-'+copy(frdate,5,2)+'-'+copy(frdate,7,2)+ '부터 ' +
                  copy(todate,1,4)+'-'+copy(todate,5,2)+'-'+copy(todate,7,2)+
                 '까지 신청가능합니다.' , mtInformation, [mbOk], 0);
      System.Exit;
    end;
  End;

  try
    FM_Hospital := TFM_Hospital.Create(Self);
    FM_Hospital.ShowModal;
  finally
    FM_Hospital.free;
  end;
end;

procedure TFM_Mainform.BT_SportsClick(Sender: TObject);
begin
  If (PE_empno.Text = '') Then
  begin
    MessageDlg('사원번호을 선택하시기 바랍니다.' , mtInformation, [mbOk], 0);
    System.Exit;
  end;

  If (vAdmin = True) Then PE_Empno.Enabled := True
  else
  Begin
    if (FG_Sysdate < frdateSP) or ( FG_Sysdate > todateSP) then   //체육활동비
    begin
      MessageDlg('체육활동비 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                  copy(frdateSP,1,4)+'-'+copy(frdateSP,5,2)+'-'+copy(frdateSP,7,2)+ '부터 ' +
                  copy(todateSP,1,4)+'-'+copy(todateSP,5,2)+'-'+copy(todateSP,7,2)+
                 '까지 신청가능합니다.' , mtInformation, [mbOk], 0);
      System.Exit;
    end;
  End;

  try
    FM_Sports := TFM_Sports.Create(Self);
    FM_Sports.ShowModal;
  finally
    FM_Sports.free;
  end;
end;

procedure TFM_Mainform.PE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    PE_empno.PL_get_singledata;
    PE_empnoSerach;
    BT_SearchClick(Sender);
    Key := #0;
  end;
end;

procedure TFM_Mainform.PE_EmpnoSerach;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    FG_Sql := Format('SELECT JOBPLACE, PAYCL, ''field3'',  '+
                     '      (SELECT CODENAME FROM PYCCODE  '+
                     '        WHERE CODEID = ''I160''      '+
                     '          AND CODENO = JOBPLACE) JNM,'+
                     '      (SELECT CODENAME FROM PYCCODE  '+
                     '        WHERE CODEID = ''I112''      '+
                     '          AND CODENO = PAYCL) PNM    '+
                     '  FROM PIMPMAS                       '+
                     ' WHERE EMPNO     = ''%s''            ',[Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql;  //edit1.text := Sql.Text;
    Open;

    FG_Place  := FieldByName('field1').AsString;
    FG_Paycl  := FieldByName('field2').AsString;
    SL_job.ValueCaption   := FieldByName('field4').AsString+' (' +
                             FieldByName('field1').AsString+') ';
    Close;
  end;
end;

procedure TFM_Mainform.RB1Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.RB2Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.RB3Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Mainform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Mainform.B_ActClick(Sender: TObject);
begin
  FM_Batch := TFM_Batch.Create(Self);
  try
    FM_Batch.ShowModal;
  finally
    FM_Batch.Free;
  end;
end;

procedure TFM_Mainform.F_AppDate;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Sql.Add('SELECT CASE WHEN '''+FG_Appdate+''' <= ''201601'' THEN ''201501'' ');
    Sql.Add('       WHEN '''+FG_Appdate+''' > ''2016'' AND SUBSTR('''+FG_Appdate+''',5,2)=''01'' THEN TO_NUMBER(SUBSTR('''+FG_Appdate+''',1,4)-1)||''02'' ');
    Sql.Add('       ELSE SUBSTR('''+FG_Appdate+''',1,4)||''02''  END field1, ');
    Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
    Sql.Add('   FROM DUAL                          ');
    Open;
    FL_MaxApp := FieldByName('field1').AsString;
    Close;
  end;
end;

Function TFM_Mainform.Check_All : Boolean;
begin
  if not Check_Date(ReMoveChar(ME_FromDate.Text, '-')) then
  begin
    ME_FromDate.SetFocus;
    Result := False;
    System.Exit;
  end;

  if not Check_Date(ReMoveChar(ME_ToDate.Text, '-')) then
  begin
    ME_ToDate.SetFocus;
    Result := False;
    System.Exit;
  end;

  Result := True;
end;

Function TFM_Mainform.Check_Date( InDate : String ) : Boolean;
var
  Temp : Real;
begin
  if Length(InDate) <> 8 then
  begin
    MessageDlg('올바른 날짜를 입력하십시요.' , mtInformation, [mbOk], 0);
    Result := False;
    System.Exit;
  end;

  InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + Copy(InDate,7,2);
  Try
  Temp   := StrToDate(InDate);
  Except on EConvertError do
    begin
      MessageDlg('존재하지 않는 날짜입니다. 확인하시고 다시 입력하세요.' , mtInformation, [mbOk], 0);
      Result          := False;
      System.Exit;
    end;
  end;
  Result := True;
end;

procedure TFM_Mainform.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage = TabSheet1 then
  begin
    BT_SearchClick(Sender);
  end
  else
  begin
//
  end
end;

Function TFM_Mainform.MonthLastDay(Ymd : String) : Integer;
const
  DaysPerMonth : array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
var
  ResultDay : Word;
  nYear, nMonth : Integer;
begin
  nYear := StrToInt(Copy(Ymd,1,4));
  nMonth := StrToInt(Copy(Ymd,5,2));

  ResultDay := DaysPerMonth[nMonth];
  if nMonth = 2 then
  begin
    if (nYear mod 4 = 0) and ((nYear mod 100 <> 0) or (nYear mod 400 = 0)) then Inc(ResultDay);
  end;
  Result := ResultDay;
end;

end.
