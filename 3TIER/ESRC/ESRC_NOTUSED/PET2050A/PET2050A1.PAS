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
unit PET2050A1;

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
    TMaxSession: TTMaxSession;
    SF_Main: TOnSchemeForm;
    L_Deptname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    L_korname: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    BT_ScrPrint: TOnFocusButton;
    E_Empno: TOnWinPopupEdit;
    E_LoginEmp: TOnEdit;
    P_OpinionN: TPanel;
    MERIT_JVN: TOnMemo;
    MERIT_JAN: TOnMemo;
    MERIT_JAY: TOnMemo;
    MERIT_JVY: TOnMemo;
    OnMemo6: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo2: TOnMemo;
    Panel3: TPanel;
    RESULTSCRGRADE: TOnShapeLabel;
    FINALGRADE: TOnShapeLabel;
    Memo_E1: TOnMemo;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_ScrPrintClick(Sender: TObject);
    procedure E_EmpnoInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OpinionView(v_Year : String);
    procedure E_EmpnoCloseUp(Sender: TObject; var Text: String;var Accept: Boolean);
    procedure E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
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
    v_empno    : String;
    v_PayraYN  : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
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

end;

procedure TFM_Main.FormShow(Sender: TObject);
var v_JOBDEPT : String;
begin
  with TMaxDataSet do
  begin
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('field1', ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);

    Close;
    Sql.Clear;
    SQL.Text := ' select Value1 Field1, ''2'', ''3'', ''4'', ''5'' ' +
                '  from PEJNOBAS                            ' +
                ' WHERE rabasdate = ''00000000'' ' ;

    Open;
    vRabasdate := FieldByName('Field1').AsString;

    Close;
    SQl.Clear;
    SQL.Text := 'select Value3 Field1, Value4 Field2,     ' +
                '       ''3'', ''4'', ''5'' ' +
                '  from PEJNOBAS            ' +
                ' WHERE rabasdate = '''+vRabasdate+''' ';

    Open;
    Workemp1 := Fields[0].AsString;
    Workemp2 := Fields[1].AsString;
  end;

  if (Passemp(cmdline,1) = Workemp1) or (Passemp(cmdline,1) = Workemp2) or
     (copy(Passemp(cmdline,1),1,1) = 'D') then
  begin
    E_LoginEmp.Visible := true;
  end
  else
  begin
    E_LoginEmp.Visible := false;
    v_empno            := Passemp(cmdline,1);
    EmpnoFind(v_empno);
  end;
end;

procedure TFM_Main.EmpnoFind(vEmp : String);
var vCNT : Integer;
begin
  with TMaxDataSet do
  begin
    vParamSQL := 'SELECT A.empno, A.korname,                                                                       '+
                 '      (SELECT codename FROM pyccode WHERE codeid = ''I113'' AND codeno   = A.payra) payra,       '+
                 '      (SELECT deptname FROM pycdept WHERE orgnum = A.orgnum AND deptcode = A.deptcode) deptname, '+
                 '      payrayn,                                                                                   '+
                 '      (SELECT COUNT(*) FROM PIMPMAS WHERE deptcode = A.DEPTCODE AND PAYCL = ''H10'') CNT,      '+
                 '      '''' F7, '''' F8, '''' F9, '''' F10          '+
                 ' FROM PIMPMAS A                                    '+
                 'WHERE deptcode in (SELECT deptcode FROM PIMPMAS    '+
                 '                    WHERE  empno = '''+ vEmp +''') '+
                 '  AND ((PAYCL = ''H10'') OR (payrayn = ''Y''))   '+
                 '  AND A.empno = '''+ vEmp +''' ';

    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('empno'   , ftString, 100);
    AddField('korname' , ftString, 100);
    AddField('payra'   , ftString, 100);
    AddField('deptname', ftString, 100);
    AddField('payrayn' , ftString, 100);
    AddField('CNT'     , ftString, 100);
    AddField('F7'      , ftString, 100);
    AddField('F8'      , ftString, 100);
    AddField('F9'      , ftString, 100);
    AddField('F10'     , ftString, 100);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    If    Fields[5].AsString = '' Then  vCNT := 0
    Else  vCNT := StrToInt(Fields[5].AsString);

    if ((RecordCount > 0) and (vCNT > 0)) then
    begin
      E_Empno.Text             := Fields[0].AsString;
      L_korname.ValueCaption   := Fields[1].AsString;
      L_payraname.ValueCaption := Fields[2].AsString;
      L_Deptname.ValueCaption  := Fields[3].AsString;
      v_PayraYN                := Fields[4].AsString;
    end
    Else
    Begin
      if ((Passemp(cmdline,1) = Workemp1) or (Passemp(cmdline,1) = Workemp2) or (copy(Passemp(cmdline,1),1,1) = 'D')) then
      Begin
      End
      Else
      Begin
        MessageDlg('무기계약직 자기평가 대상자가 아니거나 해당팀의 팀장이 아닙니다.' + #13+#13+
                   '확인 후 다시 검색하시기 바랍니다.', mtConfirmation, [mbOK],0);
        Application.Terminate;
        Exit;
      End;
    End;

    If (v_PayraYN = 'N') Then E_Empno.Enabled := False
    Else
    Begin
      E_Empno.Enabled := True;
      E_empno.Perform(WM_KEYDOWN, VK_F2, 0);
    End;

    OpinionView(vRabasdate);
  end;
end;

procedure TFM_Main.OpinionView(v_Year : String);
begin
  with TMaxDataSet do
  begin
    ServiceName := 'HINSA_select12';

    vParamSQL := ' SELECT A.MERIT_JVY, A.MERIT_JVN, A.MERIT_JAY, A.MERIT_JAN, '+
                 '        A.E1PERVIEW, B.RESULTSCRGRADE, B.FINALGRADE,      '+
                 '        ''F8'',''F9'',''F10''                       '+
                 '  FROM PEHRUMER A, PEJNOMAS B '+
                 ' WHERE A.RABASDATE = B.RABASDATE ' +
                 '   AND A.EMPNO     = B.EMPNO ' +
                 '   AND A.RABASDATE = ''' + v_Year +''' ' +
                 '   AND A.EMPNO     = ''' + E_Empno.Text  +''' ' ;
    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('MERIT_JAY' ,ftString, 2000);
    AddField('MERIT_JAN' ,ftString, 2000);
    AddField('E1PERVIEW' ,ftString, 2000);
    AddField('RESULTSCRGRADE' ,ftString, 2000);
    AddField('FINALGRADE',ftString, 2000);
    AddField('F8'        ,ftString, 2000);
    AddField('F9'        ,ftString, 2000);
    AddField('F10'       ,ftString, 2000);
    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;
    Open;

    MERIT_JVY.Text := Fields[0].AsString;
    MERIT_JVN.Text := Fields[1].AsString;
    MERIT_JAY.Text := Fields[2].AsString;
    MERIT_JAN.Text := Fields[3].AsString;
    Memo_E1.Text   := Fields[4].AsString;
    RESULTSCRGRADE.ValueCaption := Fields[5].AsString;
    FINALGRADE.ValueCaption     := Fields[6].AsString;
  End;
end;

procedure TFM_Main.E_EmpnoInitPopup(Sender: TObject);
begin
  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno       := v_empno;
  Fm_EmpForm.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
(*
  if (Length(E_Empno.Text) >= 4) and (key = #13) then
  begin
    EmpnoFind(v_empno);
  end;
*)
end;

procedure TFM_Main.E_EmpnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  E_Empno.Text <> '' then
  begin
    EmpnoFind(E_Empno.Text);
  end;
end;

procedure TFM_Main.E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);

      Close;
      Sql.Clear;
      SQL.Text := 'select payrayn Field1, '''' Field2,            '+
                  '       '''' Field3,  '''' Field4,  '''' Field5 '+
                  '  from PIMPMAS                                 '+
                  ' where empno = '''+ E_LoginEmp.Text +'''       ';
      Open;
      v_PayraYN := FieldByName('Field1').AsString;
    end;

    v_Empno             := '';
    v_Empno             := E_LoginEmp.Text;
    E_Empno.Enabled     := True;
    E_Empno.ReadOnly    := False;
    EmpnoFind(v_empno);
    E_empno.Perform(WM_KEYDOWN, VK_F2, 0);
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
