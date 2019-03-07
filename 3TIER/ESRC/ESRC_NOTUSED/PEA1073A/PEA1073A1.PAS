{=============================== Program Header ================================
 PROGRAM-NAME   : 구성원평가결과 FeedBack - PEA1073A1
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 평가결과 조회
 Programmer     :
 Version        : ver 1.0
 Date           : 2013.11.20
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.11.20    이희용       신규개발                HR팀 요청
================================================================================}
unit PEA1073A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, printers, OnPopupEdit, 
  TmaxFunc, Pass, OnInsaCommon, OnSkinBtn, OnScheme;

type
  TFM_Main = class(TForm)
    TMaxDataSet: TTMaxDataSet;
    L_Deptname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    L_korname: TOnShapeLabel;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_3: TOnSkinButton;
    P_OpinionO: TPanel;
    E_Opinion2: TOnMemo;
    E_Opinion4: TOnMemo;
    E_Opinion3: TOnMemo;
    E_Opinion1: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo7: TOnMemo;
    BT_Exit: TOnFocusButton;
    BT_ScrPrint: TOnFocusButton;
    E_Empno: TOnWinPopupEdit;
    E_LoginEmp: TOnEdit;
    Panel3: TPanel;
    L_NowBand: TOnShapeLabel;
    L_NextBand: TOnShapeLabel;
    FINALGRADE: TOnShapeLabel;
    VN_PAYRA: TOnShapeLabel;
    VN_DEPTNAME: TOnShapeLabel;
    RESULTSCRGRADE: TOnShapeLabel;
    Memo_E2: TOnMemo;
    Panel6: TPanel;
    lable12: TLabel;
    lable23: TLabel;
    Memo_E1: TOnMemo;
    Panel4: TPanel;
    lable22: TLabel;
    lable11: TLabel;
    P_OpinionN: TPanel;
    MERIT_JVN: TOnMemo;
    MERIT_JCN: TOnMemo;
    MERIT_JRN: TOnMemo;
    MERIT_JAN: TOnMemo;
    Memo_E0: TOnMemo;
    MERIT_JAY: TOnMemo;
    MERIT_JRY: TOnMemo;
    MERIT_JCY: TOnMemo;
    MERIT_JVY: TOnMemo;
    OnMemo6: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo2: TOnMemo;
    SF_Main: TOnSchemeForm;
    TMaxSession: TTMaxSession;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_ScrPrintClick(Sender: TObject);
    procedure E_EmpnoInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OpinionViewO(v_Year : String);  //Old
    procedure OpinionViewN(v_Year : String);  //New
    procedure OpinionViewF(v_Year : String);  //공통
    procedure FormCHG(v_Year : String);       //2013년 기준으로 화면 분류
    procedure E_EmpnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure E_EmpnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vParamSQL  : String;
    procedure EmpnoFind(vEmp : String);
  public
    { Public declarations }
    vRabasdate : String;
    Workemp1   : String;
    Workemp2   : String;
    Workemp3   : String;
    Workemp4   : String;
    Workemp5   : String;
    v_YEAR1    : String;
    v_YEAR2    : String;
    v_YEAR3    : String;
    v_empno    : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
//  SB_Help.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';
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

  //2013.11. Add
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then Application.Terminate;

  E_empno.Text :=  Passemp(cmdline,1);
//  SB_Help.Panels[1].Text := ' ';

  E_LoginEmp.Visible  := False;
  BT_ScrPrint.Visible := False;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var vSysdate, vPAYRAYN : String;
begin
  with TMaxDataSet do
  begin
  //평가기준일 불러오기
    vParamSQL := 'SELECT Value1, TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), ''3'', ''4'', ''5'' '+
                '  FROM pehrebas                           '+
                ' WHERE rabasdate = ''00000000''           '+
                '   AND gubun     = ''00''                 '+
                '   AND sgubun    = ''0001''               ';
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('Field1' , ftString, 100);
    AddField('Field2' , ftString, 100);
    AddField('Field3' , ftString, 100);
    AddField('Field4' , ftString, 100);
    AddField('Field5' , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;
    vRabasdate := Fields[0].AsString; // 현평가기준일

    //평가결과완료 및 평가연도(3년)
    vParamSQL := 'SELECT Value1, Value2, Value3, Value4, Value5 '+
                '  FROM pehrebas                            '+
                ' WHERE rabasdate = '''+ vRabasdate +'''    '+
                '   AND gubun     = ''11''                  '+
                '   AND sgubun    = ''0008''                ';

    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('Field1' , ftString, 100);
    AddField('Field2' , ftString, 100);
    AddField('Field3' , ftString, 100);
    AddField('Field4' , ftString, 100);
    AddField('Field5' , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

(*
    If (Fields[0].AsString = 'N') Then
    Begin
      ShowMessage('평가결과 준비중입니다.'+#13#13+'프로그램을 종료합니다');
      Application.Terminate;
      Exit;
    End;
*)
    v_YEAR1 := Fields[1].AsString;
    v_YEAR2 := Fields[2].AsString;
    v_YEAR3 := Fields[3].AsString;

    SB_1.Caption := v_YEAR1 + '평가';
    SB_2.Caption := v_YEAR2 + '평가';
    SB_3.Caption := v_YEAR3 + '평가';

    //팀장 여부 확인
    vParamSQL := 'SELECT NVL(jobpayrayn, ''N'') PAYRAYN,    ' +
                 '       '''' F2, '''' F3, '''' F4, '''' F5 ' +
                 '  FROM PIMPMAS   '+
                 ' WHERE EMPNO = '''+ Passemp(cmdline,1) +''' ' +
                 '   and pstate < ''80'' ';

    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('PAYRAYN' , ftString, 100);
    AddField('F2' , ftString, 100);
    AddField('F3' , ftString, 100);
    AddField('F4' , ftString, 100);
    AddField('F5' , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    vPAYRAYN := Fields[0].AsString;
    If vPAYRAYN = 'Y' Then
    Begin
      E_empno.Enabled  := True;
      E_Empno.ReadOnly := False;
      E_empno.Perform(WM_KEYDOWN, VK_F2, 0);
    End
    Else
    Begin
      E_empno.Enabled  := False;
      E_Empno.ReadOnly := True;
    End;

    //평가담당자
    vParamSQL := 'SELECT Value1, Value2, Value3, Value4,     '+
                '       TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+
                '  FROM pehrebas                            '+
                ' WHERE rabasdate = '''+ vRabasdate +'''    '+
                '   AND gubun     = ''11''                  '+
                '   AND sgubun    = ''0005''                ';

    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('Field1' , ftString, 100);
    AddField('Field2' , ftString, 100);
    AddField('Field3' , ftString, 100);
    AddField('Field4' , ftString, 100);
    AddField('Field5' , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    Workemp1 := Fields[0].AsString;
    Workemp2 := Fields[1].AsString;
    Workemp3 := Fields[2].AsString;
    Workemp4 := Fields[3].AsString;
    vSysdate := Fields[4].AsString; // 현 시간.

    if (Passemp(cmdline,1) = Workemp1) or (Passemp(cmdline,1) = Workemp2) or  //관리자
       (Passemp(cmdline,1) = Workemp3) or (Passemp(cmdline,1) = Workemp4) or (Copy(Passemp(cmdline,1),1,1) = 'D') then
    begin
      E_Empno.Enabled     := True;
      E_Empno.ReadOnly    := False;
      E_LoginEmp.Visible  := True;
      BT_ScrPrint.Visible := True;
      v_empno             := Passemp(cmdline,1);
    end
    Else
    Begin
      //2014.12.29 김현순M 요청으로 31일까지는 팀장만 조회
      //2015년 부터 구성원 조회 가능 하도록 임시 사용
      (*
      If (vPAYRAYN = 'N') Then
      Begin
        ShowMessage('평가결과 준비중입니다.'+#13#13+'프로그램을 종료합니다');
        Application.Terminate;
        Exit;
      End;
      *)
      v_empno := (Passemp(cmdline,1));
    End;

    EmpnoFind(v_empno);

    FormCHG(v_YEAR1);

    SB_1.BtnDown  := True;
    SB_2.BtnDown  := False;
    SB_3.BtnDown  := False;
  end;
end;

procedure TFM_Main.FormCHG(v_Year : String);
Begin
  If (v_Year >= '2013') Then  //2013년이후 평가 장단점 입력.
  Begin
    P_OpinionN.Visible := True;
    P_OpinionO.Visible := False;
    OpinionViewN(Copy(v_Year,1,4)+'1130');
  End
  Else
  Begin
    P_OpinionO.Visible := True;
    P_OpinionN.Visible := False;
    OpinionViewO(Copy(v_Year,1,4)+'1130');
  End;
  OpinionViewF(v_Year+'1130');
End;

procedure TFM_Main.OpinionViewO(v_Year : String);
begin
  //평가의견 Read... 2012년 이전
  with TMaxDataSet do
  begin
    vParamSQL := 'SELECT Opinion1, Opinion2, Opinion3, Opinion4, ''5'' '+
                 '  FROM PEHREMAS                                      '+
                 ' WHERE rabasdate = '''+ v_Year       +'''            '+
                 '   AND empno     = '''+ E_empno.Text +'''            ';

    ServiceName := 'HINSA_select3';
    ClearFieldInfo;
    AddField('Field1' , ftString, 2000);
    AddField('Field2' , ftString, 2000);
    AddField('Field3' , ftString, 2000);
    AddField('Field4' , ftString, 2000);
    AddField('Field5' , ftString, 2000);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    E_Opinion1.Text := Fields[0].AsString;
    E_Opinion2.Text := Fields[1].AsString;
    E_Opinion3.Text := Fields[2].AsString;
    E_Opinion4.Text := Fields[3].AsString;
  end;
end;

procedure TFM_Main.OpinionViewN(v_Year : String);
begin
  //평가의견 Read...2013년 이후
  with TMaxDataSet do
  begin
    ServiceName := 'HINSA_select12';

    vParamSQL := ' SELECT MERIT_JVY, MERIT_JVN, MERIT_JCY, MERIT_JCN, '+
                 '        MERIT_JRY, MERIT_JRN, MERIT_JAY, MERIT_JAN, E1PERVIEW, ''F10'' '+
                 '  FROM PEHREMER A '+
                 ' where rabasdate  = ''' + v_Year       +''' ' +
                 '   AND empno      = ''' + E_empno.Text +''' ' ;
    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('MERIT_JCY' ,ftString, 2000);
    AddField('MERIT_JCN' ,ftString, 2000);
    AddField('MERIT_JRY' ,ftString, 2000);
    AddField('MERIT_JRN' ,ftString, 2000);
    AddField('MERIT_JAY' ,ftString, 2000);
    AddField('MERIT_JAN' ,ftString, 2000);
    AddField('E1PERVIEW' ,ftString, 2000);
    AddField('F10'       ,ftString, 2000);
    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    MERIT_JVY.Text := Fields[0].AsString;
    MERIT_JVN.Text := Fields[1].AsString;
    MERIT_JCY.Text := Fields[2].AsString;
    MERIT_JCN.Text := Fields[3].AsString;
    MERIT_JRY.Text := Fields[4].AsString;
    MERIT_JRN.Text := Fields[5].AsString;
    MERIT_JAY.Text := Fields[6].AsString;
    MERIT_JAN.Text := Fields[7].AsString;
    Memo_E0.Text   := Fields[8].AsString;  //업적의견
  end;
end;

procedure TFM_Main.OpinionViewF(v_Year : String);
begin
  with TMaxDataSet do
  begin
    //종합의견/팀장이면 PETREMAS에서 가져옴(2014.12.01)
    vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                  '+
                 '       '''' Field3, '''' Field4, ''''  Field5 '+
                 '  FROM PETREMAS                               '+
                 ' WHERE rabasdate = '''+ v_Year       +'''     '+
                 '   AND empno     = '''+ E_empno.Text +'''     ';
    Close;
    ServiceName := 'HINSA_select3';
    ClearFieldInfo;
    AddField('E1VALVIEW', ftString, 2000);
    AddField('E2VALVIEW', ftString, 2000);
    AddField('Field1'   , ftString, 2000);
    AddField('Field2'   , ftString, 2000);
    AddField('Field3'   , ftString, 2000);
    Close;
    ClearParamInfo;
    SQL.Text := vParamSQL;
    Open;

    if RecordCount = 0 then
    begin
      vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                  '+
                   '       '''' Field3, '''' Field4, ''''  Field5 '+
                   '  FROM PEHREMAS                               '+
                   ' WHERE rabasdate = '''+ v_Year       +'''     '+
                   '   AND empno     = '''+ E_empno.Text +'''     ';
      Close;
      ServiceName := 'HINSA_select3';
      ClearFieldInfo;
      AddField('E1VALVIEW', ftString, 2000);
      AddField('E2VALVIEW', ftString, 2000);
      AddField('Field1'   , ftString, 2000);
      AddField('Field2'   , ftString, 2000);
      AddField('Field3'   , ftString, 2000);
      Close;
      ClearParamInfo;
      SQL.Text := vParamSQL;
      Open;
    End;

    Memo_E1.text := FieldByName('E1VALVIEW').AsString;
    Memo_E2.text := FieldByName('E2VALVIEW').AsString;

    (* 등급 *)
    vParamSQL := 'SELECT Substr(RESULTSCRGRADE,1,1), Substr(FINALGRADE,1,1),        '+  //G+ G-를 G등급으로 통일.
                 '       (Select codename from pyccode                              '+
                 '         where codeid = ''I112'' and codeno = a.paycl)  NOWBAND,  '+
                 '       (Select codename from pyccode                              '+
                 '         where codeid = ''I112'' and codeno = a.npaycl) NEXTBAND, '+
                 '       To_Char(To_Number(rabasyear)+1)                  NEXTYEAR, '+
                 '       (select codename from pyccode where codeid = ''I113'' and codeno=A.payra) PAYRA , '+
                 '       (select deptname from pycdept where orgnum = A.orgnum and deptcode=A.deptcode) DEPTNAME, '+
                 '       '''' F8, '''' F9, '''' F10            '+
                 '  FROM pehevhis a                            '+
                 ' WHERE rabasyear = '''+ copy(v_Year,1,4) +''''+
                 '   AND empno     = '''+ E_empno.Text     +'''';

    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('RESULTSCRGRADE' , ftString, 100);
    AddField('FINALGRADE'     , ftString, 100);
    AddField('NOWBAND'        , ftString, 100);
    AddField('NEXTBAND'       , ftString, 100);
    AddField('NEXTYEAR'       , ftString, 100);
    AddField('PAYRA'          , ftString, 100);
    AddField('DEPTNAME'       , ftString, 100);
    AddField('F8'             , ftString, 100);
    AddField('F9'             , ftString, 100);
    AddField('F10'            , ftString, 100);

    Close;
    ClearParamInfo;
    SQL.Text := vParamSQL;
    Open;

    RESULTSCRGRADE.ValueCaption := FieldByName('RESULTSCRGRADE').AsString;
    FINALGRADE.ValueCaption     := FieldByName('FINALGRADE').AsString;

    if FieldByName('FINALGRADE').AsString = 'Y' then RESULTSCRGRADE.ValueCaption := '평가제외자';
    if FieldByName('FINALGRADE').AsString = 'Y' then FINALGRADE.ValueCaption     := '평가제외자';
    if FieldByName('FINALGRADE').AsString = 'Z' then RESULTSCRGRADE.ValueCaption := '평가보류자';
    if FieldByName('FINALGRADE').AsString = 'Z' then FINALGRADE.ValueCaption     := '평가보류자';

    L_NowBand.ValueCaption      := FieldByName('NOWBAND').AsString;
    L_NowBand.LabelCaption      := copy(v_Year,1,4) +'년 BAND';
    L_NextBand.LabelCaption     := FieldByName('NEXTYEAR').AsString+'년 BAND';

    VN_DEPTNAME.LabelCaption    := copy(v_Year,1,4) +'년 부서';
    VN_PAYRA.LabelCaption       := copy(v_Year,1,4) +'년 직책';

    VN_DEPTNAME.ValueCaption    := FieldByName('DEPTNAME').AsString;
    VN_PAYRA.ValueCaption       := FieldByName('PAYRA').AsString;

    if   FieldByName('NEXTBAND').AsString = '' then
        L_NextBand.ValueCaption := FieldByName('NOWBAND').AsString
    else L_NextBand.ValueCaption := FieldByName('NEXTBAND').AsString;
  end;
end;

procedure TFM_Main.E_EmpnoInitPopup(Sender: TObject);
begin
  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno       := E_empno.Text;
  Fm_EmpForm.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
var vYYear : String;
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  vYYear := (Sender as TOnSkinButton).Caption;
  FormCHG(Copy(vYYear,1,4));
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Length(E_Empno.Text) >= 4) and (key = #13) then
  begin
    EmpnoFind(E_Empno.Text);
    FormCHG(Copy(SB_1.Caption,1,4));
    SB_1.BtnDown  := True;
    SB_2.BtnDown  := False;
    SB_3.BtnDown  := False;
  end;
end;

procedure TFM_Main.E_EmpnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  E_Empno.Text <> '' then
  begin
    FormCHG(Copy(SB_1.Caption,1,4));
  end;
end;

procedure TFM_Main.E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    v_Empno             := '';
    v_Empno             := E_LoginEmp.Text;
    E_Empno.Enabled     := True;
    E_Empno.ReadOnly    := False;
    E_empno.Perform(WM_KEYDOWN, VK_F2, 0);
  end;
end;

procedure TFM_Main.EmpnoFind(vEmp : String);
begin
  with TMaxDataSet do
  begin
    vParamSQL := 'SELECT empno, korname,                                                               '+
                 '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)     , '+
                 '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)     , '+
                 '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)  '+
                 '  FROM Pimpmas A                                                                     '+
                 '  WHERE (empno like '''+ vEmp +'''||''%''   OR  korname like '''+ vEmp +'''||''%'')   ';

    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('Field1' , ftString, 100);
    AddField('Field2' , ftString, 100);
    AddField('Field3' , ftString, 100);
    AddField('Field4' , ftString, 100);
    AddField('Field5' , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;             //Memo1.Text := Sql.Text;
    Open;
    if RecordCount > 0 then
    begin
      v_Empno                  := Fields[0].AsString;
      E_Empno.Text             := Fields[0].AsString;
      L_korname.ValueCaption   := Fields[1].AsString;
      L_payraname.ValueCaption := Fields[3].AsString;
      L_Deptname.ValueCaption  := Fields[4].AsString;
    end
    else ShowMessage('평가 내역이 없습니다');
  end;
end;

procedure TFM_Main.BT_ScrPrintClick(Sender: TObject);
begin
  if MessageDlg('현재 화면 그대로 프린터로 출력이 됩니다. '+#13+#13 +
                '진행하시겠습니까? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       BT_ScrPrint.SetFocus;
       Printer.Orientation := poLandscape;
       FM_Main.PrintScale  := poPrintToFit;
       FM_Main.Print;
  end;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
