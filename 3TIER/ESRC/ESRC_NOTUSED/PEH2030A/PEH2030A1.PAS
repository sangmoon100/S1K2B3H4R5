unit PEH2030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, DBTables, OnScheme,
  OnInsaCommon;

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
    Shape6: TShape;
    Shape7: TShape;
    Label3: TLabel;
    OnSectionLabel5: TOnSectionLabel;
    Shape10: TShape;
    Label9: TLabel;
    Label1: TLabel;
    P_Taskcode: TLabel;
    DBG_works1: TOnGrDbGrid;
    OM_RValue41: TOnMemo;
    OM_RValue11: TOnMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    OM_RValue13: TOnMemo;
    OM_RValue21: TOnMemo;
    OM_RValue23: TOnMemo;
    OM_RValue51: TOnMemo;
    OM_RValue53: TOnMemo;
    OM_RValue31: TOnMemo;
    OM_RValue33: TOnMemo;
    BT_Insert: TOnFocusButton;
    P_mainweight: TPanel;
    P_propeltask: TPanel;
    P_gubun: TPanel;
    DBG_works: TOnGrDbGrid;
    BT_Exit: TOnFocusButton;
    BT_Print: TOnFocusButton;
    E_SEQNO: TOnComboEdit;
    BT_Confirm: TOnFocusButton;
    BT_Save: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_ConFirm: TOnSectionLabel;
    Shape1: TShape;
    Label2: TLabel;
    Shape9: TShape;
    Label8: TLabel;
    R_MIDPERVIEW: TOnMemo;
    L_SEQNO: TOnSectionLabel;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
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
     PEmpno     : String;   //접속자사번
     sRabasdate : String;   //평가기준일
     sSEQNO     : String;   //작성회차
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Workemp1   : String;   //인사팀 평가 담당자1
     Workemp2   : String;   //인사팀 평가 담당자2
     LE1empno   : String;    //1차 평가자
     LE2empno   : String;    //2차 평가자
     SqlText    : String;
     ParamVariant : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm, UPrint;

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
  ParamVariant := 'select Value1|| '';'' ||Value3           '+
                  '  FROM pehrebas                          '+
                  ' where rabasdate = '''+sRabasdate+'''    '+
                  '   and gubun     = ''11''                '+
                  '   and sgubun    = ''0005''              ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  Workemp1     := Csel_gfd(1);
  Workemp2     := Csel_gfd(2);

  Pempno       :=  Passemp(cmdline,1);
  Ed_empno.Text:=  Passemp(cmdline,1);
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  DBG_works.Top     := 420;
  DBG_works.Height  := 215;

  MidperView_Clear;

  Ed_empnoInitPopup(Self);
  Select_BaseData;
  OpinionView;

  if  (Pempno = Workemp1) or (Pempno = Workemp2) or (copy(Pempno,1,1) = 'D') then
  begin
    Ed_empno.ReadOnly    := False;
    Ed_empno.ButtonWidth := 24;
  end
  else
  begin
    Ed_empno.ReadOnly   := True;
    Ed_empno.ButtonWidth := 0;
    if  Fm_EmpForm.Query1.RecordCount < 1 then
    begin
      MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
      Close;
    end;
{ 팀장의견은 피평가자 최종완료 후 처리하므로 삭제 함.
    if  Fm_EmpForm.Query1.FieldbyName('Finyn').AsString <> 'Y' then
    begin
      MessageDlg('팀장님께서 아직 성과 Review 의견등록을 완료하지 않으셨거나'+#13+#13+
                 '성과 Review 대상자가 아닙니다.',mtError,[mbOK],0);
      BT_ExitClick(Sender);
    end;
}
  end;
end;

//사원기본정보
procedure TFM_Main.Select_BaseData;
begin
  ParamVariant := 'SELECT empno||'';''||korname||'';''||                                                  '+#13+
                 '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''|| '+#13+
                 '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''|| '+#13+
                 '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)     '+#13+
                 '       ||'';''||e1empno||'';''||e2empno                                                 '+#13+
                 '  FROM pehremas A                                                                       '+#13+
                 ' WHERE rabasdate = '''+ sRabasDate +'''                                                 '+#13+
                 '   AND (empno like '''+ Ed_empno.Text +'''||''%''   OR  korname like '''+ Ed_empno.Text +'''||''%'') ';

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
    L_payraname.ValueCaption := Csel_gfd(4);
    L_Deptname.ValueCaption  := Csel_gfd(5);
    LE1empno                 := Csel_gfd(6);
    LE2empno                 := Csel_gfd(7);

    Works_data;
    ProcessVisible;
  End;
end;

//Values,역량 자료조회
procedure TFM_Main.OpinionView;
begin
  with TMaxDataSet do
  begin
    SqlText := Format(' SELECT '+
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
    OM_RValue13.Lines.Add(Fields[2].AsString);
    OM_RValue21.Lines.Add(Fields[4].AsString);
    OM_RValue23.Lines.Add(Fields[6].AsString);
    OM_RValue31.Lines.Add(Fields[8].AsString);
    OM_RValue33.Lines.Add(Fields[10].AsString);
    OM_RValue41.Lines.Add(Fields[12].AsString);
    OM_RValue51.Lines.Add(Fields[14].AsString);
    OM_RValue53.Lines.Add(Fields[16].AsString);
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
                      ' EMPNO, TASKCODE                               '+
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
    AddField('EMPNO'       , ftString, 400);
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
                      ' EMPNO, SEQNO                                  '+
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
    AddField('EMPNO'       , ftString, 400);
    AddField('SEQNO'       , ftString, 400);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
    if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount > 0) then
    begin
      DBG_works.Top     := 530;
      DBG_works.Height  := 110;
      DBG_works.DefaultRowHeight  := 32;
      DBG_works1.DefaultRowHeight := 32;
    end
    else
    if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount <= 0) then
    begin
      DBG_works1.Top    := 420;
      DBG_works1.Height := 110;
      DBG_works.Top     := 500;
      DBG_works.Height  := 0;
    end
    else
    if  (TDS_Works1.recordCount <= 0) then
    begin
      DBG_works.Top     := 420;
      DBG_works.Height  := 215;
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

procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Select_BaseData;
    OpinionView;
    Key := #0;
  end;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
begin
  if  Fm_EmpForm.Korname <> '' then
  begin
    Ed_empno.Text          := Fm_EmpForm.empno;
    L_korname.ValueCaption := Fm_EmpForm.Korname;
    Select_BaseData;
    OpinionView;
    ProcessVisible;
  end;
end;

//작성회차변경
procedure TFM_Main.E_SEQNOChange(Sender: TObject);
begin
  Works_data;
  OpinionView;
  ProcessVisible;
end;

//최종확인(피평가자)여부 첵크 후 진행방지 처리
procedure TFM_Main.ProcessVisible;
begin
  ParamVariant := ' SELECT RMIDCONYN FROM PEHREMAS            '+#13+
                  ' WHERE RABASDATE = '''+ sRabasDate +'''    '+#13+
                  '   AND EMPNO     = '''+ Ed_empno.Text +''' ';
  Csel_SQL := ParamVariant;
  Csel_Open;

  (*피평가자확인*)
  if (Csel_gfd(1) = 'Y') then
  begin
    OM_RValue11.ReadOnly  := True;
    OM_RValue13.ReadOnly  := True;
    OM_RValue21.ReadOnly  := True;
    OM_RValue23.ReadOnly  := True;
    OM_RValue31.ReadOnly  := True;
    OM_RValue33.ReadOnly  := True;
    OM_RValue41.ReadOnly  := True;
    OM_RValue51.ReadOnly  := True;
    OM_RValue53.ReadOnly  := True;
    R_MIDPERVIEW.ReadOnly := True;
    BT_Save.Visible       := False;
    BT_Confirm.Visible    := False;
    L_ConFirm.Visible     := True;
    BT_Insert.Enabled     := False
  End Else
  Begin
    OM_RValue11.ReadOnly  := False;
    OM_RValue13.ReadOnly  := False;
    OM_RValue21.ReadOnly  := False;
    OM_RValue23.ReadOnly  := False;
    OM_RValue31.ReadOnly  := False;
    OM_RValue33.ReadOnly  := False;
    OM_RValue41.ReadOnly  := False;
    OM_RValue51.ReadOnly  := False;
    OM_RValue53.ReadOnly  := False;
    R_MIDPERVIEW.ReadOnly := False;
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

procedure TFM_Main.DBG_worksCellClick(Column: TColumn);
begin
  P_Gubun.Caption      := '개별';
  P_Taskcode.Caption   := TDS_Works.Fieldbyname('SEQNO').AsString;
  P_propeltask.Caption := TDS_Works.Fieldbyname('PROPELTASK').AsString;
  P_mainweight.Caption := TDS_Works.Fieldbyname('MAINWEIGHT').AsString;
  R_MIDPERVIEW.Lines.Clear;
  R_MIDPERVIEW.Lines.Add(TDS_Works.Fieldbyname('RMIDPERVIEW').AsString);
  R_MIDPERVIEW.Refresh;
end;

procedure TFM_Main.DBG_works1CellClick(Column: TColumn);
begin
  P_Gubun.Caption      := '공동';
  P_Taskcode.Caption   := TDS_Works1.Fieldbyname('TASKCODE').AsString;
  P_propeltask.Caption := TDS_Works1.Fieldbyname('TASKNAME').AsString;
  P_mainweight.Caption := TDS_Works1.Fieldbyname('MAINWEIGHT').AsString;
  R_MIDPERVIEW.Lines.Clear;
  R_MIDPERVIEW.Lines.Add(TDS_Works1.Fieldbyname('RMIDPERVIEW').AsString);
  R_MIDPERVIEW.Refresh;
end;

// 업적자료 입력
procedure TFM_Main.BT_InsertClick(Sender: TObject);
begin
  if (DataErrChk = False) Then Exit;

  if (P_Gubun.Caption = '') then
  begin
    MessageDlg('먼저 중점추진업무를 선택하세요.',mtInformation,[mbOK],0);
    exit;
  end;

  if (R_MIDPERVIEW.Text = '') then
  begin
    MessageDlg('달성실적을 입력하세요.',mtInformation,[mbOK],0);
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
       SQL.Text  := 'Update PEHREAIM_DET                                                           '+
                    '   Set RMIDPERVIEW1 = '''+ R_MIDPERVIEW.text +'''                             '+
                    ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                    '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                    '   And SEQNO        = '  + TDS_Works.Fieldbyname('SEQNO').AsString+'          '+
                    '   And MAINWEIGHT   = '''+ TDS_Works.Fieldbyname('MAINWEIGHT').AsString+'''   ';
      End Else
      Begin
       SQL.Text  := 'Update PEHREAIM_DET                                                           '+
                    '   Set RMIDPERVIEW2 = '''+ R_MIDPERVIEW.text +'''                             '+
                    ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                    '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                    '   And SEQNO        = '  + TDS_Works.Fieldbyname('SEQNO').AsString+'          '+
                    '   And MAINWEIGHT   = '''+ TDS_Works.Fieldbyname('MAINWEIGHT').AsString+'''   ';
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
                      '   Set RMIDPERVIEW1 = '''+ R_MIDPERVIEW.text +'''                             '+
                      ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                      '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                      '   And TASKCODE     = '  + TDS_Works1.Fieldbyname('TASKCODE').AsString  +'    '+
                      '   And MAINWEIGHT   = '''+ TDS_Works1.Fieldbyname('MAINWEIGHT').AsString+'''  ';
        End Else
        Begin
         SQL.Text  := 'Update PEHREAIM_BASDET                                                        '+
                      '   Set RMIDPERVIEW2 = '''+ R_MIDPERVIEW.text +'''                             '+
                      ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                      '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                      '   And TASKCODE     = '  + TDS_Works1.Fieldbyname('TASKCODE').AsString  +'    '+
                      '   And MAINWEIGHT   = '''+ TDS_Works1.Fieldbyname('MAINWEIGHT').AsString+'''  ';
        End;
        Execute;
      end;
    End;
  end;

  Works_data;
  OpinionView;
end;

// 저장
procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
  if (DataErrChk = False) Then Exit;

  ParamVariant := ' SELECT COUNT(empno) CNT FROM PEHRESULT    '+#13+
                  ' WHERE RABASDATE = '''+ sRabasDate +'''    '+#13+
                  '   AND EMPNO     = '''+ Ed_empno.Text +''' '+#13+
                  '   AND SEQNO     = '''+ sSEQNO +''' ' ;

  Csel_SQL := ParamVariant;
  Csel_Open;

  with TMaxDataSet do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    if (Csel_gfd(1) = '0') then
    Begin
      SQL.Text := 'INSERT INTO PEHRESULT           '+
                  '(                               '+
                  '  RABASDATE, SEQNO, EMPNO,      '+
                  '  RVALUE11, RVALUE13, RVALUE21, '+
                  '  RVALUE23, RVALUE31, RVALUE33, '+
                  '  RVALUE41, RVALUE51, RVALUE53, '+
                  '  WRITEEMP, WRITETIME           '+
                  ')                               '+
                  'VALUES                          '+
                  '( '''+ sRabasdate       +''' ,  '+
                  '  '''+ sSEQNO           +''' ,  '+
                  '  '''+ Ed_empno.Text    +''' ,  '+
                  '  '''+ OM_RValue11.Text +''' ,  '+
                  '  '''+ OM_RValue13.Text +''' ,  '+
                  '  '''+ OM_RValue21.Text +''' ,  '+
                  '  '''+ OM_RValue23.Text +''' ,  '+
                  '  '''+ OM_RValue31.Text +''' ,  '+
                  '  '''+ OM_RValue33.Text +''' ,  '+
                  '  '''+ OM_RValue41.Text +''' ,  '+
                  '  '''+ OM_RValue51.Text +''' ,  '+
                  '  '''+ OM_RValue53.Text +''' ,  '+
                  '  '''+ Pempno           +''' ,  '+
                  '  to_char(sysdate,''YYYYMMDDHHMISS'')  '+
                  ') ';
      Execute;
    End Else
    Begin
      SQL.Text := ' Update PEHRESULT '+
                  ' SET RVALUE11  = '''+ OM_RValue11.Text +''' , '+
                  '     RVALUE13  = '''+ OM_RValue13.Text +''' , '+
                  '     RVALUE21  = '''+ OM_RValue21.Text +''' , '+
                  '     RVALUE23  = '''+ OM_RValue23.Text +''' , '+
                  '     RVALUE31  = '''+ OM_RValue31.Text +''' , '+
                  '     RVALUE33  = '''+ OM_RValue33.Text +''' , '+
                  '     RVALUE41  = '''+ OM_RValue41.Text +''' , '+
                  '     RVALUE51  = '''+ OM_RValue51.Text +''' , '+
                  '     RVALUE53  = '''+ OM_RValue53.Text +''' , '+
                  '     WRITEEMP  = '''+ Pempno           +''' , '+
                  '     WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                  ' WHERE RABASDATE = '''+ sRabasdate +'''              '+
                  '   AND EMPNO     = '''+ Ed_empno.Text +'''           '+
                  '   AND SEQNO     = '''+ sSEQNO +''' ' ;
      Execute;
    End;
  end;

  if TOnFocusButton(Sender).Name = 'BT_Save' then
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
end;

// 최종완료
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
                 '   Set RMIDCONYN     = ''Y'',                          '+
                 '       RMIDCONDATE  = to_char(sysdate,''YYYYMMDD''),   '+
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
                   '        DECODE('''+sSEQNO+''', ''1'', RMIDPERVIEW1, RMIDPERVIEW2),   '+
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
                   '        DECODE('''+sSEQNO+''', ''1'', RMIDPERVIEW1, RMIDPERVIEW2),  '+
                   '        '''+ Pempno +''', to_char(sysdate,''YYYYMMDDHHMISS'')       '+
                   ' from pehreaim_basdet                                               '+
                   ' WHERE rabasdate = '''+ sRabasdate +'''                             '+
                   '   AND empno     = '''+ Ed_empno.Text +''' ';

      Execute;
    end;
  end;

  MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);

  ProcessVisible;
  if trim(LE1empno) <> '' then
  begin
    //EAI 연동을 통한 Web BroadNet으로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
    SendProgID  := 'PEH1020A';
    SendEmpno   := Ed_empno.text;
    RcveEmpno   := LE1empno;
    MailSubject := '[확인요청] 성과 Review';
    MailBody    := '[사번]'+Ed_empno.text+'  [성명]'+L_Korname.ValueCaption+'  [부서]'+L_Deptname.ValueCaption+#13+#13+
                   '위 구성원의 성과 Review(피평가자 달성실적)를 완료하였습니다.'+#13+#13+
                   '확인해 주시기 바랍니다.'+#13+#13+
                   '[확인화면위치 안내] : 종합인사시스템 - 평가 - 육성일지/성과 Review - 성과 Review 달성실적 입력(피평가자)';
    ReceiveYN   := 'N';

    if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
    begin
         MessageDlg(' 1차평가자 확인요청 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
         exit;
    end
    else MessageDlg(' 1차평가자께 성과 Review 확인요청 메일을 전송하였습니다...',mtInformation, [mbOk], 0);
  end;
end;


//오류사항Check(오류시 진행종료)
Function TFM_Main.DataErrChk:Boolean;
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
  If (Trim(OM_RValue11.Text) = '') Then Begin OM_RValue11.SetFocus; MessageDlg('◎ Values(Mind-set : Passion) 항목을 확인하시기 바랍니다.'         , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue13.Text) = '') Then Begin OM_RValue13.SetFocus; MessageDlg('◎ Values(Mind-set : Love) 항목을 확인하시기 바랍니다.'            , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue21.Text) = '') Then Begin OM_RValue21.SetFocus; MessageDlg('◎ Values(Action : Challenge) 항목을 확인하시기 바랍니다.'         , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue23.Text) = '') Then Begin OM_RValue23.SetFocus; MessageDlg('◎ Values(Action : Innovation) 항목을 확인하시기 바랍니다.'        , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue31.Text) = '') Then Begin OM_RValue31.SetFocus; MessageDlg('◎ Values(Constraint : Integrity) 항목을 확인하시기 바랍니다.'     , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue33.Text) = '') Then Begin OM_RValue33.SetFocus; MessageDlg('◎ Values(Constraint : Accountability) 항목을 확인하시기 바랍니다.', mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue41.Text) = '') Then Begin OM_RValue41.SetFocus; MessageDlg('◎ Competency(Leadership) 항목을 확인하시기 바랍니다.'             , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue51.Text) = '') Then Begin OM_RValue51.SetFocus; MessageDlg('◎ Competency(Business : 공통역량) 항목을 확인하시기 바랍니다.'    , mtWarning, [mbOK], 0); Result := False; Exit; End;
  If (Trim(OM_RValue53.Text) = '') Then Begin OM_RValue53.SetFocus; MessageDlg('◎ Competency(Business : 직무역량) 항목을 확인하시기 바랍니다.'    , mtWarning, [mbOK], 0); Result := False; Exit; End;

  Pdataview := '';
  ParamVariant := ' SELECT DECODE(RVALUE11, ''RVALUE11'', ''RVALUE11'',                       '+#13+
                  '        DECODE(RVALUE13, ''RVALUE13'', ''RVALUE13'',	                      '+#13+
                  '        DECODE(RVALUE21, ''RVALUE21'', ''RVALUE21'',                       '+#13+
                  '        DECODE(RVALUE23, ''RVALUE23'', ''RVALUE23'',                       '+#13+
                  '        DECODE(RVALUE31, ''RVALUE31'', ''RVALUE31'',                       '+#13+
                  '        DECODE(RVALUE33, ''RVALUE33'', ''RVALUE33'',                       '+#13+
                  '        DECODE(RVALUE41, ''RVALUE41'', ''RVALUE41'',                       '+#13+
                  '        DECODE(RVALUE51, ''RVALUE51'', ''RVALUE51'',                       '+#13+
                  '        DECODE(RVALUE53, ''RVALUE53'', ''RVALUE53'',                       '+#13+
                  '        NULL))))))))) SEL_DATA                                             '+#13+
                  '    FROM(                                                                  '+#13+
                  ' select                                                                    '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE11,0)) < 15 THEN ''RVALUE11'' END RVALUE11, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE13,0)) < 15 THEN ''RVALUE13'' END RVALUE13, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE21,0)) < 15 THEN ''RVALUE21'' END RVALUE21, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE23,0)) < 15 THEN ''RVALUE23'' END RVALUE23, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE31,0)) < 15 THEN ''RVALUE31'' END RVALUE31, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE33,0)) < 15 THEN ''RVALUE33'' END RVALUE33, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE41,0)) < 15 THEN ''RVALUE41'' END RVALUE41, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE51,0)) < 15 THEN ''RVALUE51'' END RVALUE51, '+#13+
                  '    CASE WHEN LENGTH(NVL(RVALUE53,0)) < 15 THEN ''RVALUE53'' END RVALUE53  '+#13+
                  ' FROM PEHRESULT A                                                          '+#13+
                  ' WHERE A.RABASDATE = '''+ sRabasDate +'''                                  '+#13+
                  '   AND A.EMPNO     = '''+ Ed_empno.Text +'''                               '+#13+
                  '   AND A.SEQNO     = '''+ sSEQNO +'''                                      '+#13+
                  ' ) ' ;

  Csel_SQL := ParamVariant;
  Csel_Open;

  If      (Csel_gfd(1) = 'RVALUE11') Then Pdataview := '◎ Values(Mind-set : Passion)'
  Else If (Csel_gfd(1) = 'RVALUE13') Then Pdataview := '◎ Values(Mind-set : Love)'
  Else If (Csel_gfd(1) = 'RVALUE21') Then Pdataview := '◎ Values(Action : Challenge)'
  Else If (Csel_gfd(1) = 'RVALUE23') Then Pdataview := '◎ Values(Action : Innovation)'
  Else If (Csel_gfd(1) = 'RVALUE31') Then Pdataview := '◎ Values(Constraint : Integrity)'
  Else If (Csel_gfd(1) = 'RVALUE33') Then Pdataview := '◎ Values(Constraint : Accountability)'
  Else If (Csel_gfd(1) = 'RVALUE41') Then Pdataview := '◎ Competency(Leadership)'
  Else If (Csel_gfd(1) = 'RVALUE51') Then Pdataview := '◎ Competency(Business : 공통역량)'
  Else If (Csel_gfd(1) = 'RVALUE53') Then Pdataview := '◎ Competency(Business : 직무역량)'
  Else;

  if (Csel_gfd(1) <> '') then
  Begin
    MessageDlg(Pdataview+'에 의견을 최소 15자 이상 기술하시고 [저장]하신 후 '+#13+#13+
               '    [최종완료]하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
    TOnMemo(FindComponent('OM_RValue'+Copy(Csel_gfd(1), 7,2))).SetFocus;
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

 // 종합인사메일발송이력 >> EAI를 통해 Hint로 발송
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
  P_Gubun.Caption      := '';
  P_Taskcode.Caption   := '';
  P_propeltask.Caption := '아래의 중점추진업무를 선택하세요';
  P_mainweight.Caption := '';
  R_MIDPERVIEW.Lines.Clear;
  R_MIDPERVIEW.Lines.add('피평가자의 달성실적을 입력하세요.');
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
    if RecordCount > 0 then Csel_ret := True;
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
    if  not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if  v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

// 미리보기
procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  if  ed_empno.Text = '' then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  BT_Print.Visible     := False;
  BT_Exit.Visible      := False;

  QuickReport1.Preview;

  BT_Print.Visible     := True;
  BT_Exit.Visible      := True;
end;

// 종료
procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
