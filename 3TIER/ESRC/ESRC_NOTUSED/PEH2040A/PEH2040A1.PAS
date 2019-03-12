unit PEH2040A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, DBTables, OnScheme,
  OnDBGrid, OnInsaCommon;

type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TDS_Works: TTMaxDataSet;
    DS_Works: TDataSource;
    TDS_Works1: TTMaxDataSet;
    DS_Works1: TDataSource;
    TDS: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    L_payraname: TOnShapeLabel;
    L_Deptname: TOnShapeLabel;
    L_Rabasdate: TOnShapeLabel;
    L_Korname: TOnShapeLabel;
    P_Opinion: TPanel;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel8: TOnSectionLabel;
    Shape7: TShape;
    OnSectionLabel5: TOnSectionLabel;
    Shape9: TShape;
    Shape10: TShape;
    Label8: TLabel;
    Label9: TLabel;
    P_Taskcode: TLabel;
    DBG_works1: TOnGrDbGrid;
    Panel2: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    BT_Insert: TOnFocusButton;
    E_MIDPERVIEW: TOnMemo;
    P_mainweight: TPanel;
    P_gubun: TPanel;
    DBG_works: TOnGrDbGrid;
    BT_Exit: TOnFocusButton;
    BT_Help: TOnFocusButton;
    E_SEQNO: TOnComboEdit;
    BT_Confirm: TOnFocusButton;
    BT_Save: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_ConFirm: TOnSectionLabel;
    E_Empno: TTMaxPersonPopupEdit;
    Bt_Eempno: TOnFocusButton;
    R_MIDPERVIEW: TOnMemo;
    Shape1: TShape;
    Label2: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    OM_RValue11: TOnMemo;
    OM_RValue13: TOnMemo;
    OM_RValue21: TOnMemo;
    OM_RValue23: TOnMemo;
    OM_RValue31: TOnMemo;
    OM_RValue33: TOnMemo;
    OM_RValue41: TOnMemo;
    OM_RValue51: TOnMemo;
    OM_RValue53: TOnMemo;
    OM_EValue34: TOnMemo;
    OM_EValue32: TOnMemo;
    OM_EValue24: TOnMemo;
    OM_EValue22: TOnMemo;
    OM_EValue14: TOnMemo;
    OM_EValue12: TOnMemo;
    OM_EValue42: TOnMemo;
    OM_EValue52: TOnMemo;
    OM_EValue54: TOnMemo;
    P_propeltask: TOnMemo;
    Bt_Search: TOnFocusButton;
    DQ_Diary: TDataSource;
    Q_Diary: TTMaxDataSet;
    BT_Print: TOnFocusButton;
    BT_DiaryPrint: TOnFocusButton;
    L_SEQNO: TOnSectionLabel;
    DBG_Diary: TOnDBGrid;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_InsertClick(Sender: TObject);
    procedure DBG_worksCellClick(Column: TColumn);
    procedure DBG_works1CellClick(Column: TColumn);
    procedure E_SEQNOChange(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure E_EmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_EmpnoEnter(Sender: TObject);
    procedure Bt_SearchClick(Sender: TObject);
    procedure Diary_data;
    procedure BT_DiaryPrintClick(Sender: TObject);
    procedure Bt_EempnoClick(Sender: TObject);
  private
    { Private declarations }
    vParamSQL  : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    //사원기본정보
    procedure Select_BaseData;
    //업적평가 조회(PEHREAIM_BASDET :공동목표 개인별 등록, PEHREAIM_DET:업적평가세부사항-목표등록)
    procedure Works_data;
    //Values,역량 자료조회
    procedure OpinionView;
    //주요실과, 달성실적 초기화
    procedure MidperView_Clear;
    //오류사항 자료점검(오류시 진행종료)
    function DataErrChk:Boolean;
    //최종완료 전 자료점검(Values, 역량 : 15자리이상, Not Null, 업적 : Not Null)
    function  InsertDataView:Boolean;
    //최종확인(피평가자)여부 첵크 후 진행방지 처리
    procedure ProcessVisible;
    //2차평가자 확인요청 메일전송
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
     PEmpno     : String;
     Ppaycl     : string;
     Ppayra     : String;
     Pjobkind   : String;
     Porgnum    : String;
     Pdeptcode  : String;
     PFinyn     : String;
     sRabasdate : String;   //평가기준일
     sSEQNO     : String;   //작성회차
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Workemp1   : String;
     Workemp2   : String;
     Workemp3   : String;
     Workemp4   : String;
     Workemp5   : String;
     SqlText    : String;
     ParamVariant : String;
     LE1empno   : String;    //1차 평가자
     LE2empno   : String;    //2차 평가자
     Check      : Integer;   //Performance Diary 열람(0 : 열람, 1 : 열람취소)
  end;

var
  FM_Main: TFM_Main;

implementation

uses UHelp, UEmpForm, UPrint, UPrintForm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  // 평가기준일을 읽어온다
  ParamVariant  := 'select Value1||'';''||Value2||'';''||Value5 '+
                   '  FROM pehrebas                             '+
                   ' where rabasdate = ''00000000''             '+
                   '   and gubun     = ''00''                   '+
                   '   and sgubun    = ''0001''                 ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  sRabasdate    := Csel_gfd(1);
  L_Rabasdate.ValueCaption  := copy(sRabasdate,1,4)+'-'+copy(sRabasdate,5,2)+'-'+copy(sRabasdate,7,2);

  //성과Review 작성회차
  sSEQNO            := Csel_gfd(3);
  E_SEQNO.ItemIndex := StrToInt(sSEQNO)-1 ;
  If (sSEQNO = '1') Then E_SEQNO.Enabled := False;

  // 평가담당자를 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2||'';''||  '+
                  '       Value3|| '';'' ||Value4||'';''||  '+
                  '       Value5                            '+
                  '  FROM pehrebas                          '+
                  ' where rabasdate = '''+sRabasdate+'''    '+
                  '   and gubun     = ''11''                '+
                  '   and sgubun    = ''0005''              ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  Workemp1     := Csel_gfd(1);
  Workemp2     := Csel_gfd(2);
  Workemp3     := Csel_gfd(3);
  Workemp4     := Csel_gfd(4);
  Workemp5     := Csel_gfd(5);

  Pempno       :=  Passemp(cmdline,1);
  E_empno.Text :=  Passemp(cmdline,1);
  Check        := 0;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  DBG_works.Top     := 430;
  DBG_works.Height  := 210;

  MidperView_Clear;

  Ed_empnoInitPopup(Self);
  Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

  if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
      (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D')
//      or (Pempno = '2424') or (Pempno = '1113')
  then
  begin
    E_empno.Visible   := True;
    BT_eempno.Visible := True;
  end else
  begin
    Ed_empno.ReadOnly   := True;
    if  Fm_EmpForm.Query1.RecordCount < 1 then
    begin
      MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
      Close;
    end;
  end;
end;

//사원기본정보
procedure TFM_Main.Select_BaseData;
var
  i : integer;
  vEkind : String;
begin
  ParamVariant := 'SELECT empno||'';''||korname||'';''||paycl||'';''||payra||'';''||jobkind||'';''||      '+#13+
                 '       orgnum||'';''||deptcode||'';''||                                                 '+#13+
                 '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''|| '+#13+
                 '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''|| '+#13+
                 '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)     '+#13+
                 '       ||'';''||e1empno||'';''||e2empno                                                 '+#13+
                 '  FROM pehremas A                                                                       '+#13+
                 ' WHERE rabasdate = '''+ sRabasDate +'''                                                 '+#13+
                 '   AND (empno like '''+ Ed_empno.Text +'''||''%''   OR  korname like '''+ Ed_empno.Text +'''||''%'')      ';

  Csel_SQL := ParamVariant;
  Csel_Open;

  If (Csel_gfd(1) = '') Then
  Begin
    MessageDlg('사번을 확인하시기 바랍니다.', mtWarning, [mbOK], 0);
    MidperView_Clear;
    Ed_empno.SetFocus;
    Exit;
  End Else
  Begin
    L_korname.ValueCaption   := Csel_gfd(2);
    Ppaycl                   := Csel_gfd(3);
    Ppayra                   := Csel_gfd(4);
    Pjobkind                 := Csel_gfd(5);
    Porgnum                  := Csel_gfd(6);
    Pdeptcode                := Csel_gfd(7);
    L_payraname.ValueCaption := Csel_gfd(9);
    L_Deptname.ValueCaption  := Csel_gfd(10);
    LE1empno                 := Csel_gfd(11);
    LE2empno                 := Csel_gfd(12);

    Works_data;
    ProcessVisible;
  End;
end;

//Values,역량 자료조회
procedure TFM_Main.OpinionView;
begin
  with TMaxDataSet do
  begin
    SqlText := Format(' SELECT                                                        '+
                        '   RVALUE11, EVALUE12, RVALUE13, EVALUE14, RVALUE21, EVALUE22, '+
                        '   RVALUE23, EVALUE24, RVALUE31, EVALUE32, RVALUE33, EVALUE34, '+ 
                        '   RVALUE41, EVALUE42, RVALUE51, EVALUE52, RVALUE53, EVALUE54  '+
                        ' FROM PEHRESULT             '+
                        ' WHERE RABASDATE = ''%s''   '+
                        '   AND EMPNO     = ''%s''   '+
                        '   AND SEQNO     = ''%s''   ',
                        [sRabasdate,Ed_empno.Text,Copy(E_SEQNO.Text,1,1)]);

    Close;
    ServiceName := 'PEH2030A_sel1';
    ClearFieldInfo;
    AddField('RVALUE11' , ftString, 400);
    AddField('EVALUE12' , ftString, 400);
    AddField('RVALUE13' , ftString, 400);
    AddField('EVALUE14' , ftString, 400);
    AddField('RVALUE21' , ftString, 400);
    AddField('EVALUE22' , ftString, 400);
    AddField('RVALUE23' , ftString, 400);
    AddField('EVALUE24' , ftString, 400);
    AddField('RVALUE31' , ftString, 400);
    AddField('EVALUE32' , ftString, 400);
    AddField('RVALUE33' , ftString, 400);
    AddField('EVALUE34' , ftString, 400);
    AddField('RVALUE41' , ftString, 400);
    AddField('EVALUE42' , ftString, 400);
    AddField('RVALUE51' , ftString, 400);
    AddField('EVALUE52' , ftString, 400);
    AddField('RVALUE53' , ftString, 400);
    AddField('EVALUE54' , ftString, 400);

    ClearParamInfo;
    SQL.Text := SqlText;
    Open;

    OM_RValue11.Lines.Add(Fields[0].AsString);
    OM_EValue12.Lines.Add(Fields[1].AsString);
    OM_RValue13.Lines.Add(Fields[2].AsString);
    OM_EValue14.Lines.Add(Fields[3].AsString);
    OM_RValue21.Lines.Add(Fields[4].AsString);
    OM_EValue22.Lines.Add(Fields[5].AsString);
    OM_RValue23.Lines.Add(Fields[6].AsString);
    OM_EValue24.Lines.Add(Fields[7].AsString);
    OM_RValue31.Lines.Add(Fields[8].AsString);
    OM_EValue32.Lines.Add(Fields[9].AsString);
    OM_RValue33.Lines.Add(Fields[10].AsString);
    OM_EValue34.Lines.Add(Fields[11].AsString);
    OM_RValue41.Lines.Add(Fields[12].AsString);
    OM_EValue42.Lines.Add(Fields[13].AsString);
    OM_RValue51.Lines.Add(Fields[14].AsString);
    OM_EValue52.Lines.Add(Fields[15].AsString);
    OM_RValue53.Lines.Add(Fields[16].AsString);
    OM_EValue54.Lines.Add(Fields[17].AsString);
   end;
end;

//업적평가 조회(PEHREAIM_BASDET :공동목표 개인별 등록, PEHREAIM_DET:업적평가세부사항-목표등록)
procedure TFM_Main.Works_data;
begin
  MidperView_Clear;
  with TDS_Works1 do
  begin
    SqlText := Format('SELECT TASKNAME, MAINWEIGHT,                   '+
                      ' DECODE('''+Copy(E_SEQNO.Text,1,1)+''', ''1'', '+
                      ' RMIDPERVIEW1, RMIDPERVIEW2) RMIDPERVIEW,      '+
                      ' DECODE('''+Copy(E_SEQNO.Text,1,1)+''', ''1'', '+
                      ' E1MIDPERVIEW1, E1MIDPERVIEW2) E1MIDPERVIEW,   '+
                      ' TASKCODE                                      '+
                      '  FROM PEHREAIM_BASDET A                       '+
                      ' WHERE A.RABASDATE = ''%s''                    '+
                      '   AND A.EMPNO     = ''%s''                    ',
                      [sRabasdate,Ed_empno.Text]);
    Close;
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('TASKNAME'    , ftString, 400);
    AddField('MAINWEIGHT'  , ftString, 400);
    AddField('RMIDPERVIEW' , ftString, 400);
    AddField('E1MIDPERVIEW', ftString, 400);
    AddField('TASKCODE'    , ftString, 400);

    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  with TDS_Works do
  begin
    SqlText := Format('SELECT PROPELTASK, MAINWEIGHT,                 '+
                      ' DECODE('''+Copy(E_SEQNO.Text,1,1)+''', ''1'', '+
                      ' RMIDPERVIEW1, RMIDPERVIEW2) RMIDPERVIEW,      '+
                      ' DECODE('''+Copy(E_SEQNO.Text,1,1)+''', ''1'', '+
                      ' E1MIDPERVIEW1, E1MIDPERVIEW2) E1MIDPERVIEW,   '+
                      ' SEQNO                                         '+
                      '  FROM PEHREAIM_DET A                          '+
                      ' WHERE A.RABASDATE = ''%s''                    '+
                      '   AND A.EMPNO     = ''%s''                    ',
                      [sRabasdate,Ed_empno.Text]);

    Close;
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('PROPELTASK'  , ftString, 400);
    AddField('MAINWEIGHT'  , ftString, 400);
    AddField('RMIDPERVIEW' , ftString, 400);
    AddField('E1MIDPERVIEW', ftString, 400);
    AddField('SEQNO'       , ftString, 400);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
    if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount > 0) then
    begin
      DBG_works.Top     := 535;
      DBG_works.Height  := 105;
      DBG_works.DefaultRowHeight  := 32;
      DBG_works1.DefaultRowHeight := 32;
    end
    else
    if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount <= 0) then
    begin
      DBG_works1.Top    := 430;
      DBG_works1.Height := 105;
      DBG_works.Top     := 535;
      DBG_works.Height  := 0;
    end
    else
    if  (TDS_Works1.recordCount <= 0) then
    begin
      DBG_works.Top     := 430;
      DBG_works.Height  := 210;
    end;
  end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno       := Ed_empno.Text;
  Fm_EmpForm.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  Fm_EmpForm.Korname <> '' then
  begin
    Ed_empno.Text          := Fm_EmpForm.empno;
    L_korname.ValueCaption := Fm_EmpForm.Korname;
    PFinyn                 := Fm_EmpForm.Finyn;
    Select_BaseData;
    OpinionView;
    ProcessVisible;

    (*피평가자 최종확인여부*)
    ParamVariant := ' SELECT RMIDCONYN FROM PEHREMAS            '+#13+
                    ' WHERE RABASDATE = '''+ sRabasDate +'''    '+#13+
                    '   AND EMPNO     = '''+ Ed_empno.Text +''' ';
    Csel_SQL      := ParamVariant;
    Csel_Open;

    if (Csel_gfd(1) <> 'Y') then
    begin
      MessageDlg('피평가자가 [최종완료] 처리를 하지않았습니다. '+#13+#13+
                 '피평가자를 통하여 성과 Review 달성실적의 [최종완료] 처리 후 진행하시기 바랍니다.', mtWarning, [mbOK], 0);
      Exit;
    end;

    ParamVariant := 'SELECT COUNT(EMPNO) CNT                  '+
                    '  FROM PEPDIARY                          '+
                    ' WHERE empno    = '''+ed_empno.Text +''' '+
                    '   and orgnum   = '''+Porgnum       +''' '+
                    '   and jobdept  = '''+Pdeptcode     +''' ';

    Csel_SQL      := ParamVariant;
    Csel_Open;

    if (Csel_gfd(1) = '0') then Bt_Search.Visible := False
    Else                        Bt_Search.Visible := True;
  end;
end;

//작성회차변경
procedure TFM_Main.E_SEQNOChange(Sender: TObject);
begin
  Works_data;
  OpinionView;
  ProcessVisible;
end;

procedure TFM_Main.DBG_worksCellClick(Column: TColumn);
begin
  P_Gubun.Caption      := '개별';
  P_Taskcode.Caption   := TDS_Works.Fieldbyname('SEQNO').AsString;
  P_mainweight.Caption := TDS_Works.Fieldbyname('MAINWEIGHT').AsString;
  P_propeltask.Lines.Clear;
  R_MIDPERVIEW.Lines.Clear;
  E_MIDPERVIEW.Lines.Clear;
  P_propeltask.Lines.Add(TDS_Works.Fieldbyname('PROPELTASK').AsString);
  R_MIDPERVIEW.Lines.Add(TDS_Works.Fieldbyname('RMIDPERVIEW').AsString);
  E_MIDPERVIEW.Lines.Add(TDS_Works.Fieldbyname('E1MIDPERVIEW').AsString);
  E_MIDPERVIEW.Refresh;
end;

procedure TFM_Main.DBG_works1CellClick(Column: TColumn);
begin
  P_Gubun.Caption      := '공동';
  P_Taskcode.Caption   := TDS_Works1.Fieldbyname('TASKCODE').AsString;
  P_mainweight.Caption := TDS_Works1.Fieldbyname('MAINWEIGHT').AsString;
  P_propeltask.Lines.Clear;
  R_MIDPERVIEW.Lines.Clear;
  E_MIDPERVIEW.Lines.Clear;
  P_propeltask.Lines.Add(TDS_Works1.Fieldbyname('TASKNAME').AsString);
  R_MIDPERVIEW.Lines.Add(TDS_Works1.Fieldbyname('RMIDPERVIEW').AsString);
  E_MIDPERVIEW.Lines.Add(TDS_Works1.Fieldbyname('E1MIDPERVIEW').AsString);
  E_MIDPERVIEW.Refresh;
end;

procedure TFM_Main.BT_InsertClick(Sender: TObject);
begin
  if (DataErrChk = False) Then Exit;

  if (P_Gubun.Caption = '') then
  begin
    MessageDlg('먼저 중점추진업무를 선택하세요.',mtInformation,[mbOK],0);
    exit;
  end;

  if (E_MIDPERVIEW.Text = '') then
  begin
    MessageDlg('Review 의견을 입력하세요.',mtInformation,[mbOK],0);
    exit;
  end;

  if (P_Gubun.Caption = '개별') then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      IF (sSEQNO = '1') Then
      Begin
       SQL.Text  := 'Update PEHREAIM_DET                                                          '+
                    '   Set E1MIDPERVIEW1 = '''+ E_MIDPERVIEW.text +'''                           '+
                    ' Where RABASDATE     = '''+ sRabasdate      +'''                             '+
                    '   And EMPNO         = '''+ Ed_empno.Text   +'''                             '+
                    '   And SEQNO         = '  + TDS_Works.Fieldbyname('SEQNO').AsString+'        '+
                    '   And MAINWEIGHT    = '''+ TDS_Works.Fieldbyname('MAINWEIGHT').AsString+''' ';
      End Else
      Begin
       SQL.Text  := 'Update PEHREAIM_DET                                                          '+
                    '   Set E1MIDPERVIEW2 = '''+ E_MIDPERVIEW.text +'''                           '+
                    ' Where RABASDATE     = '''+ sRabasdate      +'''                             '+
                    '   And EMPNO         = '''+ Ed_empno.Text   +'''                             '+
                    '   And SEQNO         = '  + TDS_Works.Fieldbyname('SEQNO').AsString+'        '+
                    '   And MAINWEIGHT    = '''+ TDS_Works.Fieldbyname('MAINWEIGHT').AsString+''' ';
      End;
      Execute;
    end;
  end else
  Begin
    if  P_Gubun.Caption = '공동' then
    begin
      with TMaxDataSet do
      begin
        ServiceName := 'PEA1060A_dml';
        Close;
        Sql.Clear;
        IF (sSEQNO = '1') Then
        Begin
         SQL.Text  := 'Update PEHREAIM_BASDET                                                        '+
                      '   Set E1MIDPERVIEW1 = '''+ E_MIDPERVIEW.text +'''                            '+
                      ' Where RABASDATE     = '''+ sRabasdate      +'''                              '+
                      '   And EMPNO         = '''+ Ed_empno.Text   +'''                              '+
                      '   And TASKCODE      = '  + TDS_Works1.Fieldbyname('TASKCODE').AsString  +'   '+
                      '   And MAINWEIGHT    = '''+ TDS_Works1.Fieldbyname('MAINWEIGHT').AsString+''' ';
        End Else
        Begin
         SQL.Text  := 'Update PEHREAIM_BASDET                                                        '+
                      '   Set E1MIDPERVIEW2 = '''+ E_MIDPERVIEW.text +'''                            '+
                      ' Where RABASDATE     = '''+ sRabasdate      +'''                              '+
                      '   And EMPNO         = '''+ Ed_empno.Text   +'''                              '+
                      '   And TASKCODE      = '  + TDS_Works1.Fieldbyname('TASKCODE').AsString  +'   '+
                      '   And MAINWEIGHT    = '''+ TDS_Works1.Fieldbyname('MAINWEIGHT').AsString+''' ';
        End;
        Execute;
      end;
    End;
  end;

  Works_data;
  OpinionView;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
  if (DataErrChk = False) Then Exit;

  with TMaxDataSet do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;

    SQL.Text := ' Update PEHRESULT '+
                ' SET EVALUE12  = '''+ OM_EValue12.Text +''' , '+
                '     EVALUE14  = '''+ OM_EValue14.Text +''' , '+
                '     EVALUE22  = '''+ OM_EValue22.Text +''' , '+
                '     EVALUE24  = '''+ OM_EValue24.Text +''' , '+
                '     EVALUE32  = '''+ OM_EValue32.Text +''' , '+
                '     EVALUE34  = '''+ OM_EValue34.Text +''' , '+
                '     EVALUE42  = '''+ OM_EValue42.Text +''' , '+
                '     EVALUE52  = '''+ OM_EValue52.Text +''' , '+
                '     EVALUE54  = '''+ OM_EValue54.Text +''' , '+
                '     WRITEEMP  = '''+ Pempno           +''' , '+
                '     WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                ' WHERE RABASDATE = '''+ sRabasdate +'''              '+
                '   AND EMPNO     = '''+ Ed_empno.Text +'''           '+
                '   AND SEQNO     = '''+ sSEQNO +''' ' ;
    Execute;
  end;

  if TOnFocusButton(Sender).Name = 'BT_Save' then
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
begin
  BT_SaveClick(BT_Confirm);
  if (DataErrChk = False) Then Exit;
  if not(InsertDataView) then Exit;

  if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                             '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                             '최종완료를 하시겠습니까?'), '최종확인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
    system.Exit;
  end;

  with TMaxDataSet do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    SQL.Text  := 'Update pehremas                                        '+
                 '   Set E1MIDCONYN    = ''Y'',                          '+
                 '       E1MIDCONDATE  = to_char(sysdate,''YYYYMMDD''),  '+
                 '       Writeemp      = '''+ Pempno +''',               '+
                 '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                 ' WHERE rabasdate = '''+ sRabasdate +'''                '+
                 '   AND empno     = '''+ Ed_empno.Text +'''             ';

    Execute;
  end;

  if  TDS_works.RecordCount > 0 then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      SQL.Text  := ' insert into  pehcoach                                               '+
                   ' Select RABASDATE, EMPNO,  ''개별'',  SEQNO, PROPELTASK, MAINWEIGHT, '+
                   '        DECODE('''+sSEQNO+''', ''1'', E1MIDPERVIEW1, E1MIDPERVIEW2), '+
                   '        '''+ Pempno +''', to_char(sysdate,''YYYYMMDDHHMISS'')        '+
                   ' from pehreaim_det                                                   '+
                   ' WHERE rabasdate = '''+ sRabasdate +'''                              '+
                   '   AND empno     = '''+ Ed_empno.Text +''' ';

      Execute;
    end;
  end;

  if  TDS_works1.RecordCount > 0 then
  begin
    with TMaxDataSet do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      SQL.Text  := ' insert into  pehcoach                                              '+
                   ' Select RABASDATE, EMPNO, ''공동'', TASKCODE, TASKNAME, MAINWEIGHT, '+
                   '        DECODE('''+sSEQNO+''', ''1'', E1MIDPERVIEW1, E1MIDPERVIEW2),'+
                   '        '''+ Pempno +''', to_char(sysdate,''YYYYMMDDHHMISS'')       '+
                   ' from pehreaim_basdet                                               '+
                   ' WHERE rabasdate = '''+ sRabasdate +'''                             '+
                   '   AND empno     = '''+ Ed_empno.Text +''' ';

      Execute;
    end;
  end;

  MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
//  PFinyn := 'Y';

  ProcessVisible;
  if trim(LE2empno) <> '' then
  begin
    //EAI 연동을 통한 Web BroadNet으로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
    SendProgID  := 'PEH1020A';
    SendEmpno   := LE1empno;
    RcveEmpno   := LE2empno;
    MailSubject := '[확인요청] 성과 Review';
    MailBody    := '[사번]'+Ed_empno.text+'  [성명]'+L_Korname.ValueCaption+'  [부서]'+L_Deptname.ValueCaption+#13+#13+
                   '위 구성원의 성과 Review(피평가자 달성실적)를 완료하였습니다.'+#13+#13+
                   '확인해 주시기 바랍니다.'+#13+#13+
                   '[확인화면위치 안내] : 종합인사시스템 - 평가 - 육성일지/성과 Review - 성과 Review 달성실적 입력(피평가자)';
    ReceiveYN   := 'N';

    if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
    begin
         MessageDlg(' 2차평가자 확인요청 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
         exit;
    end
    else MessageDlg(' 2차평가자께 성과 Review 확인요청 메일을 전송하였습니다...',mtInformation, [mbOk], 0);
  end;
end;


//오류사항Check(오류시 진행종료)
Function TFM_Main.DataErrChk:Boolean;
var
  PdataMsg : String;
begin
 if (ed_empno.Text = '') then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    MidperView_Clear;
    Result := False;
    Exit;
  end;

  if (L_Rabasdate.ValueCaption = '') then
  begin
    MessageDlg('평가기준일을 확인하시기 바랍니다.', mtWarning, [mbOK], 0);
    MidperView_Clear;
    Result := False;
    Exit;
  end;

  if (sSEQNO <> Copy(E_SEQNO.Text,1,1)) Then
  Begin
    MessageDlg('성과Review의 작성회차를 확인하시기 바랍니다. '+#13+#13+
               '현재 작성회차 : ' + sSEQNO + '차'+#13+
               '입력 작성회차 : ' + Copy(E_SEQNO.Text,1,1) + '차', mtWarning, [mbOK], 0);
    Result := False;
    Exit;
  End;

  Result := True;
end;

//최종완료 전 자료점검(Values, 역량 : 15자리이상, Not Null, 업적 : Not Null)
function TFM_Main.InsertDataView:Boolean;
var
  Pdataview : String;
  TotPerCnt : String;
  HapPerCnt : String;
begin
  ParamVariant := ' SELECT RMIDCONYN FROM PEHREMAS            '+#13+
                  ' WHERE RABASDATE = '''+ sRabasDate +'''    '+#13+
                  '   AND EMPNO     = '''+ Ed_empno.Text +''' ';
  Csel_SQL      := ParamVariant;
  Csel_Open;

  (*피평가자 확인*)
  if (Csel_gfd(1) <> 'Y') then
  Begin
    MessageDlg('피평가자가 [최종완료] 처리를 하지않았습니다. '+#13+#13+
               '피평가자를 통하여 성과 Review 달성실적의 [최종완료] 처리 후 진행하시기 바랍니다.', mtWarning, [mbOK], 0);
    Result := False;
    exit;
  End;

  If (Trim(OM_EValue12.Text) = '') Then Begin OM_EValue12.SetFocus; MessageDlg('◎ Values(Mind-set : Passion) 항목을 확인하시기 바랍니다.'         , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue14.Text) = '') Then Begin OM_EValue14.SetFocus; MessageDlg('◎ Values(Mind-set : Love) 항목을 확인하시기 바랍니다.'            , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue22.Text) = '') Then Begin OM_EValue22.SetFocus; MessageDlg('◎ Values(Action : Challenge) 항목을 확인하시기 바랍니다.'         , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue24.Text) = '') Then Begin OM_EValue24.SetFocus; MessageDlg('◎ Values(Action : Innovation) 항목을 확인하시기 바랍니다.'        , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue32.Text) = '') Then Begin OM_EValue32.SetFocus; MessageDlg('◎ Values(Constraint : Integrity) 항목을 확인하시기 바랍니다.'     , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue34.Text) = '') Then Begin OM_EValue34.SetFocus; MessageDlg('◎ Values(Constraint : Accountability) 항목을 확인하시기 바랍니다.', mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue42.Text) = '') Then Begin OM_EValue42.SetFocus; MessageDlg('◎ Competency(Leadership) 항목을 확인하시기 바랍니다.'             , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue52.Text) = '') Then Begin OM_EValue52.SetFocus; MessageDlg('◎ Competency(Business : 공통역량) 항목을 확인하시기 바랍니다.'    , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_EValue54.Text) = '') Then Begin OM_EValue54.SetFocus; MessageDlg('◎ Competency(Business : 직무역량) 항목을 확인하시기 바랍니다.'    , mtWarning, [mbOK], 0); Result := False; Exit; End;

  Pdataview := '';
  ParamVariant := ' SELECT DECODE(EVALUE12, ''EVALUE12'', ''EVALUE12'',                       '+#13+
                  '        DECODE(EVALUE14, ''EVALUE14'', ''EVALUE14'',	                      '+#13+
                  '        DECODE(EVALUE22, ''EVALUE22'', ''EVALUE22'',                       '+#13+
                  '        DECODE(EVALUE24, ''EVALUE24'', ''EVALUE24'',                       '+#13+
                  '        DECODE(EVALUE32, ''EVALUE32'', ''EVALUE32'',                       '+#13+
                  '        DECODE(EVALUE34, ''EVALUE34'', ''EVALUE34'',                       '+#13+
                  '        DECODE(EVALUE42, ''EVALUE42'', ''EVALUE42'',                       '+#13+
                  '        DECODE(EVALUE52, ''EVALUE52'', ''EVALUE52'',                       '+#13+
                  '        DECODE(EVALUE54, ''EVALUE54'', ''EVALUE54'',                       '+#13+
                  '        NULL))))))))) SEL_DATA                                             '+#13+
                  '    FROM(                                                                  '+#13+
                  ' select                                                                    '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE12,0)) < 15 THEN ''EVALUE12'' END EVALUE12, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE14,0)) < 15 THEN ''EVALUE14'' END EVALUE14, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE22,0)) < 15 THEN ''EVALUE22'' END EVALUE22, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE24,0)) < 15 THEN ''EVALUE24'' END EVALUE24, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE32,0)) < 15 THEN ''EVALUE32'' END EVALUE32, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE34,0)) < 15 THEN ''EVALUE34'' END EVALUE34, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE42,0)) < 15 THEN ''EVALUE42'' END EVALUE42, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE52,0)) < 15 THEN ''EVALUE52'' END EVALUE52, '+#13+
                  '    CASE WHEN LENGTH(NVL(EVALUE54,0)) < 15 THEN ''EVALUE54'' END EVALUE54  '+#13+
                  ' FROM PEHRESULT A                                                          '+#13+
                  ' WHERE A.RABASDATE = '''+ sRabasDate +'''                                  '+#13+
                  '   AND A.EMPNO     = '''+ Ed_empno.Text +'''                               '+#13+
                  '   AND A.SEQNO     = '''+ sSEQNO +'''                                      '+#13+
                  ' ) ' ;

  Csel_SQL := ParamVariant;
  Csel_Open;

  If      (Csel_gfd(1) = 'EVALUE12') Then Pdataview := '◎ Values(Mind-set : Passion)'
  Else If (Csel_gfd(1) = 'EVALUE14') Then Pdataview := '◎ Values(Mind-set : Love)'
  Else If (Csel_gfd(1) = 'EVALUE22') Then Pdataview := '◎ Values(Action : Challenge)'
  Else If (Csel_gfd(1) = 'EVALUE24') Then Pdataview := '◎ Values(Action : Innovation)'
  Else If (Csel_gfd(1) = 'EVALUE32') Then Pdataview := '◎ Values(Constraint : Integrity)'
  Else If (Csel_gfd(1) = 'EVALUE34') Then Pdataview := '◎ Values(Constraint : Accountability)'
  Else If (Csel_gfd(1) = 'EVALUE42') Then Pdataview := '◎ Competency(Leadership)'
  Else If (Csel_gfd(1) = 'EVALUE52') Then Pdataview := '◎ Competency(Business : 공통역량)'
  Else If (Csel_gfd(1) = 'EVALUE54') Then Pdataview := '◎ Competency(Business : 직무역량)'
  Else;

  if (Csel_gfd(1) <> '') then
  Begin
    MessageDlg(Pdataview+'에 의견을 최소 15자 이상 기술하시고 [저장]하신 후 '+#13+#13+
               '    [최종완료]하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
    TOnMemo(FindComponent('OM_EValue'+Copy(Csel_gfd(1), 7,2))).SetFocus;
    Result := False;
    exit;
  End else  Result := True;

  ParamVariant := ' SELECT SUM(AAA) SEL_DATA FROM(                 '+#13+
                  ' SELECT count(*) AAA                            '+#13+
                  '   FROM PEHREAIM_BASDET A                       '+#13+
                  '  WHERE A.RABASDATE = '''+ sRabasDate +'''      '+#13+
                  '    AND A.EMPNO     = '''+ Ed_empno.Text +'''   '+#13+
                  ' UNION ALL                                      '+#13+
                  ' SELECT count(*) AAA                            '+#13+
                  '   FROM PEHREAIM_Det  A                         '+#13+
                  '  WHERE A.RABASDATE = '''+ sRabasDate +'''      '+#13+
                  '    AND A.EMPNO     = '''+ Ed_empno.Text +'''   '+#13+
                  ' )';

  Csel_SQL := ParamVariant;
  Csel_Open;
  TotPerCnt := Csel_gfd(1);

  ParamVariant := ' SELECT SUM(AAA) SEL_DATA FROM(                 '+#13+
                  ' SELECT count(*) AAA                            '+#13+
                  '   FROM PEHREAIM_BASDET A                       '+#13+
                  '  WHERE A.RABASDATE = '''+ sRabasDate +'''      '+#13+
                  '    AND A.EMPNO     = '''+ Ed_empno.Text +'''   '+#13+
                  '    AND DECODE('''+ sSEQNO + ''', ''1'',        '+#13+
                  '        RMIDPERVIEW1, RMIDPERVIEW2) IS NOT NULL '+#13+
                  ' UNION ALL                                      '+#13+
                  ' SELECT count(*) AAA                            '+#13+
                  '   FROM PEHREAIM_Det  A                         '+#13+
                  '  WHERE A.RABASDATE = '''+ sRabasDate +'''      '+#13+
                  '    AND A.EMPNO     = '''+ Ed_empno.Text +'''   '+#13+
                  '    AND DECODE('''+ sSEQNO + ''', ''1'',        '+#13+
                  '        RMIDPERVIEW1, RMIDPERVIEW2) IS NOT NULL '+#13+
                  ' )';

  Csel_SQL := ParamVariant;
  Csel_Open;
  HapPerCnt := Csel_gfd(1);

  if ((TotPerCnt = '0') or (HapPerCnt <> TotPerCnt)) then
  Begin
    MessageDlg('◎ Performance(업적)에 의견 등록하지 않은 항목이 있습니다.'+#13+#13+
               '    달성 실적 입력 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
    Result := False;
    exit;
  End;
  Result := True;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     with TMaxDataSet do
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
               Execute;
          except
               Result := false;
               exit;
          end;
          Result := True;
     end;
end;

//주요실과, 달성실적 초기화
procedure TFM_Main.MidperView_Clear;
begin
  OM_RValue11.Clear;
  OM_RValue13.Clear;
  OM_RValue21.Clear;
  OM_RValue23.Clear;
  OM_RValue31.Clear;
  OM_RValue33.Clear;
  OM_RValue41.Clear;
  OM_RValue51.Clear;
  OM_RValue53.Clear;
  OM_EValue12.Clear;
  OM_EValue14.Clear;
  OM_EValue22.Clear;
  OM_EValue24.Clear;
  OM_EValue32.Clear;
  OM_EValue34.Clear;
  OM_EValue42.Clear;
  OM_EValue52.Clear;
  OM_EValue54.Clear;
  P_Gubun.Caption      := '';
  P_Taskcode.Caption   := '';
  P_mainweight.Caption := '';
  P_propeltask.Lines.Clear;
  R_MIDPERVIEW.Lines.Clear;
  E_MIDPERVIEW.Lines.Clear;
  P_propeltask.Lines.add('아래의 중점추진업무를 선택하세요.');
  E_MIDPERVIEW.Lines.add('평가자의 Review 의견을 입력하세요.');
end;

//최종확인(피평가자)여부 첵크 후 진행방지 처리
procedure TFM_Main.ProcessVisible;
begin
  ParamVariant := ' SELECT E1MIDCONYN FROM PEHREMAS            '+#13+
                  ' WHERE RABASDATE = '''+ sRabasDate +'''    '+#13+
                  '   AND EMPNO     = '''+ Ed_empno.Text +''' ';
  Csel_SQL      := ParamVariant;
  Csel_Open;

  (*평가자 최종완료 확인*)
  if (Csel_gfd(1) = 'Y') then
  begin
    OM_EValue12.ReadOnly  := True;
    OM_EValue14.ReadOnly  := True;
    OM_EValue22.ReadOnly  := True;
    OM_EValue24.ReadOnly  := True;
    OM_EValue32.ReadOnly  := True;
    OM_EValue34.ReadOnly  := True;
    OM_EValue42.ReadOnly  := True;
    OM_EValue52.ReadOnly  := True;
    OM_EValue54.ReadOnly  := True;
    E_MIDPERVIEW.ReadOnly := True;
    BT_Save.Visible       := False;
    BT_Confirm.Visible    := False;
    L_ConFirm.Visible     := True;
    BT_Insert.Enabled     := False
  End Else
  Begin
    OM_EValue12.ReadOnly  := False;
    OM_EValue14.ReadOnly  := False;
    OM_EValue22.ReadOnly  := False;
    OM_EValue24.ReadOnly  := False;
    OM_EValue32.ReadOnly  := False;
    OM_EValue34.ReadOnly  := False;
    OM_EValue42.ReadOnly  := False;
    OM_EValue52.ReadOnly  := False;
    OM_EValue54.ReadOnly  := False;
    E_MIDPERVIEW.ReadOnly := False;
    BT_Save.Visible       := True;
    BT_Confirm.Visible    := True;
    L_ConFirm.Visible     := False;
    BT_Insert.Enabled     := true;
  End;

  if (sSEQNO <> Copy(E_SEQNO.Text,1,1)) Then
  Begin
    L_SEQNO.Caption := ' ◎ 현재 작성회차는 ' + sSEQNO + '차 입니다.';
    L_SEQNO.Visible := True;
  End Else
    L_SEQNO.Visible := False;
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

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  FHelp := TFHelp.Create(nil); // 도움말
  FHelp.Show;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  if  ed_empno.Text = '' then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  BT_Help.Visible      := False;
  BT_Print.Visible     := False;
  BT_Exit.Visible      := False;

  QuickReport1.Preview;

  BT_Help.Visible      := True;
  BT_Print.Visible     := True;
  BT_Exit.Visible      := True;
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(13) then
  begin
    Ed_empnoInitPopup(Sender);
    Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
    Key := #0;
  end;
end;

procedure TFM_Main.Bt_EempnoClick(Sender: TObject);
begin
  Ed_empnoInitPopup(Sender);
  Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
end;

procedure TFM_Main.E_EmpnoEnter(Sender: TObject);
begin
     Ed_Empno.Text             := '';
     L_korname.ValueCaption    := '';
     L_Payraname.ValueCaption  := '';
     L_deptname.ValueCaption   := '';
{
     On_Value.Clear;
     On_Comp.Clear;
     TDS_Works.Close;
     TDS_Works1.Close;
     E_MIDVALVIEW.Clear;
     E_MIDCOMVIEW.Clear;
     E_MIDTOTVIEW.Clear;

     MidperView_Clear;

     Bt_Search.Visible  := False;
     BT_Help.Visible    := False;
     BT_Save.Visible    := False;
     BT_Confirm.Visible := False;
     BT_Print.Visible   := False;
}
end;

procedure TFM_Main.Bt_SearchClick(Sender: TObject);
var
  sSQL : String;
  i    : integer;
begin
  if  ed_empno.Text = '' then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  if  Check = 0 then
  begin
    DBG_Diary.Height := 618;
    Diary_data;

    Ed_empno.Enabled        :=False;
    Bt_Save.Visible         :=False;
    BT_Confirm.Visible      :=False;
    DBG_Diary.Visible       :=True;
    OnSectionLabel5.Visible :=False;
    BT_Help.Visible         :=False;

    BT_Print.Visible        :=False;
    BT_DiaryPrint.Visible   :=True;
    Bt_Search.Caption       := 'Performance Diary 열람취소';

    E_empno.Visible         :=False;
    BT_eempno.Visible       :=False;
    check := 1;
  end else
  begin
    DBG_Diary.Height        := 0;
    Ed_empno.Enabled        :=True;
    DBG_Diary.Visible       :=false;
    OnSectionLabel5.Visible :=True;
    BT_Help.Visible         :=True;
    BT_Print.Visible        :=True;
    BT_DiaryPrint.Visible   :=false;
    Bt_Search.Caption       := 'Performance Diary 열람';
    check := 0;
    ProcessVisible;

    if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
        (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D')
    then
    begin
      E_empno.Visible   := True;
      BT_eempno.Visible := True;
    end;
  end;
end;

procedure TFM_Main.Diary_data;
begin
  vParamSQL :=  ' SELECT MEMODATE,  SEQNO,     RATEITEM,     ' +
                '        WELLPOINT, NEEDSITEM ,BIGOTEXT      ' +
                '   FROM PEPDIARY                            ' +
                '  WHERE empno    = '''+ ed_empno.Text  +''' ' +
                '    and orgnum   = '''+ Porgnum        +''' ' +
                '    and jobdept  = '''+ Pdeptcode      +''' ' +
                '  Order by MEMODATE DESC, SEQNO DESC        ';
  with Q_Diary do
  begin
    Close;
    ServiceName := 'PEH2020A_sel1';
    ClearFieldInfo;
    AddField('MEMODATE'   , ftString,   8);
    AddField('SEQNO'      , ftString,  10);
    AddField('RATEITEM'   , ftString, 300);
    AddField('WELLPOINT'  , ftString, 500);
    AddField('NEEDSITEM'  , ftString, 500);
    AddField('BIGOTEXT'   , ftString, 100);
    ClearParamInfo;
    SQL.Text := vParamSQL;
    Open;
    TStringField(FieldByName('MEMODATE' )).EditMask := '9999-99-99;0;';
  end;
end;

procedure TFM_Main.BT_DiaryPrintClick(Sender: TObject);
begin
  if L_korname.ValueCaption = '' then
  begin
    MessageDlg('인쇄할 팀원을 먼저 선택하세요.',mtError,[mbOK],0);
    exit;
  end;

  if Q_Diary.recordcount < 1 then
  begin
    MessageDlg('작성하신 내용이 없습니다.',mtError,[mbOK],0);
    exit;
  end;

  PrintForm.QuickRep1.Preview;
end;

end.
