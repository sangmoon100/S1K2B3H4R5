{-------------------------------------------------------------------------------
  PROGRAM-NAME   : psc3050a(상환특이자관리)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 복리후생/우리사주
  Programmer     : 김영대
  Version        : 1.0.0
  Date           : 1997.10.31
  Update Contents
    Version  date(yyyy.mm.dd) programmer  description       relevant doc.no
    1.00     2015.09.30    이희용         신규개발          노사협력팀 요청

-------------------------------------------------------------------------------}

unit psc30501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, Pass, Func, Menus, Comobj,
  ComCtrls, jpeg, ExtCtrls, OnFocusButton, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPersonEdit, OnPopupEdit, OnShapeLabel, OnEditMdate, Mask,
  Grids, DBGrids, OnGrDBGrid, OnTmaxPersonEdit, OnEditCombo, OnEditNumCtl;

type
  TMainForm = class(TForm)
    SB_exspdate: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TS1: TTabSheet;
    TS2: TTabSheet;
    Pankorname: TOnEdit;
    OnFocusButton1: TOnFocusButton;
    S_divseqnum: TOnNumberEdit;
    S_corpname: TOnComboEdit;
    S_stclass: TOnComboEdit;
    DBG_body: TOnGrDbGrid;
    DS_Grid: TDataSource;
    OraQuery2: TOraQuery;
    OraQuery1: TOraQuery;
    OraQuery3: TOraQuery;
    ED_empno: TOnWinPopupEdit;
    Lsysdate: TLabel;
    Lempno: TLabel;
    SB_Help: TStatusBar;
    BB_close: TOnFocusButton;
    GroupBox3: TGroupBox;
    P_stlorgNAME: TOnEdit;
    NE_divseqnum: TOnNumberEdit;
    Pankorname_ADD: TOnEdit;
    NE_exsprate2: TOnNumberEdit;
    NE_exsprate1: TOnNumberEdit;
    ME_exspdate: TOnDateEdit;
    BB_delete: TOnFocusButton;
    BB_save: TOnFocusButton;
    BB_insert: TOnFocusButton;
    ED_empno_ADD: TOnWinPopupEdit;
    SF_Main: TOnSchemeForm;
    BB_cancel: TOnFocusButton;
    CB_stclass: TOnEdit;
    CB_corpname: TOnEdit;
    S_stlorgNAME: TOnComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Search;
    procedure DS_GridDataChange(Sender: TObject; Field: TField);
    procedure BB_insertClick(Sender: TObject);
    procedure ED_empno_ADDCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ComponentClear;
    procedure ED_empno_ADDInitPopup(Sender: TObject);
    procedure ED_empno_ADDKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);

  private
    { Private declarations }
    pempno, pkorname, password: string;
    GSsysdate: String;

  public
    { Public declarations }
    Job_mode: Integer;  {0.조회, 1.추가, 2.삭제, 3.수정}

    procedure SetNow;
    function Data_Check : boolean;
    procedure SetCombo(pCombo: TOnComboEdit);
  end;

var
  MainForm : TMainForm;

implementation
{$R *.DFM}

uses psc30503, psc30504;

{-------------------------------- MAIN ----------------------------------------}
procedure TMainForm.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text :=' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;
  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SetNow;
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := '';
  ME_exspdate.Text := '';
end;


procedure TMainForm.SetNow;
begin
  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
    Sql.Add('   FROM DUAL                                    ');
    Open;
    GSsysdate := FieldByName('D').AsString;
  end;
end;

procedure TMainForm.Search;
begin
  with OraQuery3 do
  begin
    if PageControl1.ActivePage.PageIndex = 0 then
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT EMPNO, KORNAME, CORPNAME, DIVSEQNUM, STCLASS,                  ');
      Sql.Add('        DECODE(STCLASS,''1'',''1:사주우선'',''2'',''2:사주실권'',      ');
      Sql.Add('                       ''3'',''3:주주우선'',''4'',''4:주주우선(예탁)'',');
      Sql.Add('                       ''5'',''5:주주우선(비예탁)'','''') STCLASSNAME, ');
      Sql.Add('        STLORG||'':''||                                                ');
      Sql.Add('        (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''K910'' AND CODENO=A.STLORG) STLORGNAME,    ');
      Sql.Add('        SUBSTR(EXSPDATE,1,4)||''-''|| SUBSTR(EXSPDATE,5,2)||''-''|| SUBSTR(EXSPDATE,7,2) EXSPDATE,');
      Sql.Add('        EXSPRATE1, EXSPRATE2 ');
      Sql.Add(' FROM  PSEXSPM A');
      Sql.Add(' WHERE EMPNO = ''' + Copy(ED_empno.Text,1,4) + ''' ');
      Sql.Add(' ORDER BY EMPNO ');
      Open;
    End Else
    Begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT EMPNO, KORNAME, CORPNAME, DIVSEQNUM, STCLASS,                  ');
      Sql.Add('        DECODE(STCLASS,''1'',''1:사주우선'',''2'',''2:사주실권'',      ');
      Sql.Add('                       ''3'',''3:주주우선'',''4'',''4:주주우선(예탁)'',');
      Sql.Add('                       ''5'',''5:주주우선(비예탁)'','''') STCLASSNAME, ');
      Sql.Add('        STLORG||'':''||                                                ');
      Sql.Add('        (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''K910'' AND CODENO=A.STLORG) STLORGNAME,    ');
      Sql.Add('        SUBSTR(EXSPDATE,1,4)||''-''|| SUBSTR(EXSPDATE,5,2)||''-''|| SUBSTR(EXSPDATE,7,2) EXSPDATE,');
      Sql.Add('        EXSPRATE1, EXSPRATE2 ');
      Sql.Add(' FROM  PSEXSPM A');
      Sql.Add(' WHERE CORPNAME  = ''' +S_corpname.Text+ ''' ');
      Sql.Add('   AND STLORG    = ''' +Copy(S_stlorgNAME.Text,1,3)+ ''' ');
      Sql.Add('   AND DIVSEQNUM = ''' +FloatToStr(S_divseqnum.Value)+ ''' ');
      Sql.Add('   AND STCLASS   = ''' +Copy(S_stclass.Text,1,1)+ ''' ');
      Sql.Add(' ORDER BY EMPNO ');
      Open;
    End;

    If RecordCount = 0 Then
    Begin
      OraQuery3.Close;
      SB_Help.Panels[1].Text := '';
    End
    Else
      SB_Help.Panels[1].Text := ' ' +IntToStr(RecordCount) + '건이 조회 되었습니다.';
  End;
end;


procedure TMainForm.DS_GridDataChange(Sender: TObject; Field: TField);
begin
  if PageControl1.ActivePage.PageIndex = 0 then
  begin
    with OraQuery3 do
    begin
      ED_empno_ADD.Text   := FieldByName('EMPNO').AsString;
      Pankorname_ADD.Text := FieldByName('KORNAME').AsString;
      CB_corpname.Text    := FieldByName('CORPNAME').AsString;
      NE_divseqnum.Text   := FieldByName('DIVSEQNUM').AsString;
      CB_stclass.Text     := FieldByName('STCLASSNAME').AsString;
      P_stlorgNAME.Text   := FieldByName('STLORGNAME').AsString;
      ME_exspdate.Text    := FieldByName('EXSPDATE').AsString;
      NE_exsprate1.Text   := FieldByName('EXSPRATE1').AsString;
      NE_exsprate2.Text   := FieldByName('EXSPRATE2').AsString;
    end;
  End
  Else
  Begin
    with OraQuery3 do
    begin
      ME_exspdate.Text    := FieldByName('EXSPDATE').AsString;
      NE_exsprate1.Text   := FieldByName('EXSPRATE1').AsString;
      NE_exsprate2.Text   := FieldByName('EXSPRATE2').AsString;
    end;

    ED_empno_ADD.Text   := '';
    Pankorname_ADD.Text := '';
    CB_corpname.Text    := '';
    NE_divseqnum.Text   := '';
    CB_stclass.Text     := '';
    P_stlorgNAME.Text   := '';
  End;
end;

procedure TMainForm.BB_insertClick(Sender: TObject);
begin
  if (Sender as TOnFocusButton).Tag = 0 then //조회
  Begin
    Job_mode := 0;
    Search;
  End
  Else if (Sender as TOnFocusButton).Tag = 1 then //추가, 등록
  Begin
    Job_mode := 1;

    if (Sender as TOnFocusButton).Caption = '추가' Then
    Begin
      if MessageDlg('신규 특이자를 추가 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrNO then Exit;
      ComponentClear;

      ED_empno_ADD.Enabled := True;
      BB_save.Enabled      := False;
      BB_delete.Enabled    := False;
      ED_empno_ADD.SetFocus;
      SB_Help.Panels[1].Text :=' 신규 특이자를 등록 하세요. ';
      (Sender as TOnFocusButton).Caption := '등록';
    End
    Else  //등록
    Begin
      If not (Data_Check) Then Exit;

      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT (COUNT(EMPNO)) CNT FROM PSEXSPM ');
        Sql.Add(' WHERE EMPNO     = ''' +Copy(ED_empno_ADD.Text,1,4)+ ''' ');
        Sql.Add('   AND CORPNAME  = ''' +CB_corpname.Text+ ''' ');
        Sql.Add('   AND DIVSEQNUM = ''' +FloatToStr(NE_divseqnum.Value)+ ''' ');
        Sql.Add('   AND STCLASS   = ''' +Copy(CB_stclass.Text,1,1)+ ''' ');
        Sql.Add('   AND STLORG    = ''' +Copy(P_stlorgNAME.Text,1,3)+ ''' ');
        Open;

        if OraQuery1.FieldByName('CNT').AsFloat > 0 then
        begin
          Close;
          Application.MessageBox('등록된 자료가 존재 합니다.',
                                 '작업종료', mb_OK);
          System.Exit;
        end;

        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO PSEXSPM ');
        Sql.Add('            (EMPNO, KORNAME, CORPNAME, DIVSEQNUM, STCLASS, STLORG, ');
        Sql.Add('             EXSPDATE, EXSPRATE1, EXSPRATE2, WRITETIME, WRITEMAN)  ');
        Sql.Add('     VALUES ( ');
        Sql.Add('      '''+ED_empno_ADD.Text+''', ');
        Sql.Add('      '''+Pankorname_ADD.Text+''', ');
        Sql.Add('      '''+CB_corpname.Text+''', ');
        Sql.Add('      '  +FloatToStr(NE_divseqnum.Value)+', ');
        Sql.Add('      '''+Copy(CB_stclass.Text,1,1)+''', ');
        Sql.Add('      '''+Copy(P_stlorgNAME.Text,1,3)+''', ');
        Sql.Add('      '''+Trim(RemoveChar(ME_exspdate.Text,'-'))+''', ');
        Sql.Add('      '  +FloatToStr(NE_exsprate1.Value)+', ');
        Sql.Add('      '  +FloatToStr(NE_exsprate2.Value)+', ');
        Sql.Add('      TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), ');
        Sql.Add('      '''+Pempno+''') ');

        ExecSQL;
        MessageDlg((Sender as TOnFocusButton).Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
        ED_empno.Text := ED_empno_ADD.Text;
      End;
      (Sender as TOnFocusButton).Caption := '추가';
      BB_save.Enabled      := True;
      BB_delete.Enabled    := True;
      Search;
    End;
  End
  Else if (Sender as TOnFocusButton).Tag = 2 then //삭제
  Begin
    Job_mode := 2;
    If not (Data_Check) Then Exit;
    if MessageDlg((Sender As TOnFocusButton).Caption +'작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

    with OraQuery1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' DELETE FROM PSEXSPM ');
      Sql.Add(' WHERE EMPNO     = ''' +Copy(ED_empno_ADD.Text,1,4)+ ''' ');
      Sql.Add('   AND CORPNAME  = ''' +CB_corpname.Text+ ''' ');
      Sql.Add('   AND DIVSEQNUM = ''' +FloatToStr(NE_divseqnum.Value)+ ''' ');
      Sql.Add('   AND STCLASS   = ''' +Copy(CB_stclass.Text,1,1)+ ''' ');
      Sql.Add('   AND STLORG    = ''' +Copy(P_stlorgNAME.Text,1,3)+ ''' ');
      ExecSQL;
      MessageDlg((Sender as TOnFocusButton).Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
      Search;
    End;
  End
  Else if (Sender as TOnFocusButton).Tag = 3 then //저장
  Begin
    Job_mode := 3;
    If not (Data_Check) Then Exit;
    if PageControl1.ActivePage.PageIndex = 0 then
    Begin
      if MessageDlg((Sender As TOnFocusButton).Caption +'작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' UPDATE PSEXSPM SET ');
        Sql.Add('   EXSPDATE  = '''+Trim(RemoveChar(ME_exspdate.Text,'-'))+''', ');
        Sql.Add('   EXSPRATE1 = '  +FloatToStr(NE_exsprate1.Value)+',  ');
        Sql.Add('   EXSPRATE2 = '  +FloatToStr(NE_exsprate2.Value)+',  ');
        Sql.Add('   WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), ');
        Sql.Add('   WRITEMAN  = '''+Pempno+''' ');
        Sql.Add(' WHERE EMPNO     = ''' +Copy(ED_empno_ADD.Text,1,4)+ ''' ');
        Sql.Add('   AND CORPNAME  = ''' +CB_corpname.Text+ ''' ');
        Sql.Add('   AND DIVSEQNUM = ''' +FloatToStr(NE_divseqnum.Value)+ ''' ');
        Sql.Add('   AND STCLASS   = ''' +Copy(CB_stclass.Text,1,1)+ ''' ');
        Sql.Add('   AND STLORG    = ''' +Copy(P_stlorgNAME.Text,1,3)+ ''' ');

        ExecSQL;
        MessageDlg((Sender as TOnFocusButton).Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
        Search;
      End;
    End
    Else   // 일괄수정.. 2015.10.05 HeeYong          '+ #13#10+#13+#10+
    Begin
      if MessageDlg('특 이 일 자   :  ' + ME_exspdate.Text              +#13+#10+
                    '특이이자율1 :  ' + FloatToStr(NE_exsprate1.Value) +#13+#10+
                    '특이이자율2 :  ' + FloatToStr(NE_exsprate2.Value) +#13+#10+#13+#10+#13+#10+
                    IntToStr(OraQuery3.Recordcount)+'건을 일괄수정 하시겠습니까?            ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' UPDATE PSEXSPM SET ');
        Sql.Add('   EXSPDATE  = '''+Trim(RemoveChar(ME_exspdate.Text,'-'))+''', ');
        Sql.Add('   EXSPRATE1 = '  +FloatToStr(NE_exsprate1.Value)+',  ');
        Sql.Add('   EXSPRATE2 = '  +FloatToStr(NE_exsprate2.Value)+',  ');
        Sql.Add('   WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), ');
        Sql.Add('   WRITEMAN  = '''+Pempno+''' ');
        Sql.Add(' WHERE CORPNAME  = ''' +S_corpname.Text+ ''' ');
        Sql.Add('   AND DIVSEQNUM = ''' +FloatToStr(S_divseqnum.Value)+ ''' ');
        Sql.Add('   AND STCLASS   = ''' +Copy(S_stclass.Text,1,1)+ ''' ');
        Sql.Add('   AND STLORG    = ''' +Copy(S_stlorgNAME.Text,1,3)+ ''' ');

        ExecSQL;
        MessageDlg(IntToStr(OraQuery3.Recordcount)+'건의 '+(Sender as TOnFocusButton).Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
        Search;
      End;
    End;
  End
  Else if (Sender as TOnFocusButton).Tag = 4 then //취소
  Begin
    ComponentClear;
    ED_empno.Enabled    := True;
    Pankorname.Enabled  := True;
    ED_empno_ADD.Enabled   := False;
    Pankorname_ADD.Enabled := False;
    CB_corpname.Enabled    := False;
    NE_divseqnum.Enabled   := False;
    CB_stclass.Enabled     := False;
    P_stlorgNAME.Enabled   := False;

    BB_insert.Enabled := True;
    BB_save.Enabled   := True;
    BB_delete.Enabled := True;
    BB_insert.Caption := '추가';
    SB_Help.Panels[1].Text := ''
  End
  Else if (Sender as TOnFocusButton).Tag = 5 then  //종료
  Begin
    Close;
  End;
end;

function TMainForm.Data_Check: boolean;
Begin
  Result := False;
  if ((Job_mode = 1) or (Job_mode = 3)) then //등록, 수정
  Begin
    if PageControl1.ActivePage.PageIndex = 0 then
    Begin
      if Trim(ED_empno_ADD.Text) = '' Then Begin MessageDlg('사번을 입력하시기 바랍니다.' ,mtError, [mbOK], 0); Exit; End;
    End Else
    Begin
      if OraQuery3.Recordcount = 0 Then Begin MessageDlg('조회된 자료가 존재하지 않습니다.'     ,mtError, [mbOK], 0);  S_corpname.SetFocus; Exit; End;
      if S_divseqnum.Value     = 0 Then Begin MessageDlg('배정차수 항목을 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  S_divseqnum.SetFocus; Exit; End;
    End;

    if Trim(RemoveChar(ME_exspdate.Text,'-')) = '' Then Begin MessageDlg('특이일자 항목을 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  ME_exspdate.SetFocus ; Exit; End;
    if NE_exsprate1.Value  = 0  Then Begin MessageDlg('특이이자율1 항목을 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  NE_exsprate1.SetFocus; Exit; End;
    if NE_exsprate2.Value  = 0  Then Begin MessageDlg('특이이자율2 항목을 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  NE_exsprate2.SetFocus; Exit; End;
  End
  Else
  Begin  //삭제
    if OraQuery3.Recordcount = 0 then Begin MessageDlg('조회된 자료가 존재하지 않습니다.' ,mtError, [mbOK], 0);  ED_empno.SetFocus; Exit; End
    Else
      if ED_empno_ADD.Text = '' Then Begin MessageDlg('삭제 할 사번을 선택 바랍니다.'     ,mtError, [mbOK], 0);  ED_empno_ADD.SetFocus; Exit; End;
  End;
  Result := True;
End;

procedure TMainForm.ED_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  If (EmpForm.Empno <> '') Then
  Begin
    ED_empno.Text   := EmpForm.Empno;
    Pankorname.Text := EmpForm.Korname;
    Search;
  End;
end;

procedure TMainForm.ED_empnoInitPopup(Sender: TObject);
begin
  EmpForm.Edit := TOnWinPopupEdit(Sender);
  EmpForm.E_Search.Text := TOnWinPopupEdit(Sender).Text;
  TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TMainForm.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ED_empnoInitPopup(Sender);
    ED_empno.Perform(WM_KEYDOWN, VK_F2, 0);
    key := #0;
  end;
end;

procedure TMainForm.ComponentClear;
Begin
  if PageControl1.ActivePage.PageIndex = 0 then
  Begin
    ED_empno.Enabled    := False;
    Pankorname.Enabled  := False;
    ED_empno.Text       := '';
    Pankorname.Text     := '';
  End
  Else
  Begin
    S_corpname.Text    := '';
    S_stlorgNAME.Text  := '';
    S_stclass.Text     := '';
    S_divseqnum.Value  := 0;

    S_corpname.ItemIndex:= 0;
    S_stclass.ItemIndex := 0;
  End;

  OraQuery3.SQL.Clear;
  ED_empno_ADD.Text   := '';
  Pankorname_ADD.Text := '';
  CB_corpname.Text    := '';
  NE_divseqnum.Value   := 0;
  CB_stclass.Text     := '';
  P_stlorgNAME.Text   := '';
  ME_exspdate.Text    := '';
  NE_exsprate1.Text   := '';
  NE_exsprate2.Text   := '';
  SB_Help.Panels[1].Text := '';  
End;

procedure TMainForm.ED_empno_ADDCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  If (EmpForm_ADD.GSempnoS <> '') Then
  Begin
    ED_empno_ADD.Text   := EmpForm_ADD.GSempnoS;
    Pankorname_ADD.Text := EmpForm_ADD.GSkornameS;
    CB_corpname.Text    := EmpForm_ADD.GScorpname;
    NE_divseqnum.Value  := EmpForm_ADD.GSdivseqnumI;
    CB_stclass.Text     := EmpForm_ADD.GSstclassS;
    P_stlorgNAME.Text   := EmpForm_ADD.GSstlorg;
  End;
end;

procedure TMainForm.ED_empno_ADDInitPopup(Sender: TObject);
begin
  EmpForm_ADD.Edit := TOnWinPopupEdit(Sender);
  EmpForm_ADD.E_Search.Text := TOnWinPopupEdit(Sender).Text;
  TOnWinPopupEdit(Sender).PopupControl := EmpForm_ADD ;
end;

procedure TMainForm.ED_empno_ADDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    ED_empno_ADDInitPopup(Sender);
    EmpForm_ADD.Perform(WM_KEYDOWN, VK_F2, 0);
    key := #0;
  end;
end;

procedure TMainForm.SetCombo(pCombo: TOnComboEdit);
begin
  pCombo.Items.Clear;
  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT CODENO|| '' : '' ||CODENAME FROM PYCCODE ');
    Sql.Add(' WHERE CODEID = ''K910'' ');
    Sql.Add('   AND EXISTS (SELECT * FROM PSEXSPM WHERE STLORG = CODENO) ');
    Sql.Add('   ORDER BY CODENO ');
    Open;

    While Not Eof do
    begin
      pCombo.Items.Add(Trim(Fields[0].AsString));
      Next;
    end
  end;
  pCombo.ItemIndex := 0;
end;

procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  ComponentClear;
  if PageControl1.ActivePage.PageIndex = 0 then
  Begin
    ED_empno.Enabled       := True;
    Pankorname.Enabled     := True;
    ED_empno_ADD.Enabled   := False;
    Pankorname_ADD.Enabled := False;
    CB_corpname.Enabled    := False;
    NE_divseqnum.Enabled   := False;
    CB_stclass.Enabled     := False;
    P_stlorgNAME.Enabled   := False;

    BB_insert.Enabled := True;
    BB_save.Enabled   := True;
    BB_delete.Enabled := True;
    BB_cancel.Enabled := True;
    BB_insert.Caption := '추가';
  End
  Else
  Begin
    BB_insert.Enabled := False;
    BB_cancel.Enabled := False;
    BB_delete.Enabled := False;

    SetCombo(S_stlorgNAME);
  End;
end;

end.
