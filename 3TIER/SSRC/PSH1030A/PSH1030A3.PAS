unit PSH1030A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, Grids,
  DBGrids, OnGrDBGrid, StdCtrls, OnFocusButton, OnShapeLabel, Func,
  OnEditBtnCtrl, OnEditMdate, OnEditNumCtl, OnScheme, ComCtrls, Menus,   ShellApi,
  OnEditMemo, OnEditCombo;

type
  TFM_Sports = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel6: TPanel;
    DataSource1: TDataSource;
    TDS_Detail: TTMaxDataSet;
    TDS_Com: TTMaxDataSet;
    TDS_DML: TTMaxDataSet;
    Panel8: TPanel;
    L_AppEmpno: TOnShapeLabel;
    E_Seq: TOnEdit;
    L_Appdate: TOnComboEdit;
    Panel9: TPanel;
    E_Playdate: TOnMaskEdit;
    Panel1: TPanel;
    Panel10: TPanel;
    DB_PalyList: TOnGrDbGrid;
    HelpMemo1: TOnMemo;
    Panel11: TPanel;
    Shape1: TShape;
    Label10: TLabel;
    Panel53: TPanel;
    Panel52: TPanel;
    Panel7: TPanel;
    E_corpname: TOnEdit;
    E_playitem: TOnEdit;
    Panel2: TPanel;
    E_corptel: TOnEdit;
    Panel3: TPanel;
    E_comments: TOnEdit;
    Panel4: TPanel;
    E_playamt: TOnNumberEdit;
    E_division: TOnNumberEdit;
    Panel5: TPanel;
    E_Photo: TOnNumberEdit;
    Panel12: TPanel;
    B_Act1: TOnFocusButton;
    B_Act: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_Append: TOnFocusButton;
    SB_Help: TStatusBar;
    TMaxDataSet1: TTMaxDataSet;
    Panel13: TPanel;
    BT_Exit: TOnFocusButton;
    BB_Help: TOnFocusButton;
    BB_Print: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);

    procedure MaxSeq;
    procedure Next_Month(sAppdate : String);
    function  Check_Input : Boolean;
    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Read_PlayRecords(Appdate, EmpNO: String);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_ExitClick(Sender: TObject);
    procedure E_divisionExit(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_PrintClick(Sender: TObject);
    procedure B_ActClick(Sender: TObject);
    procedure Photo_Sel;
    procedure B_Act1Click(Sender: TObject);
    procedure ComponentClear;
    procedure L_AppdateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    FL_CONYN : String;

    procedure PL_Com_Contructor;

  public
    { Public declarations }
    JobMode       : Char;   // I:신규등록, U:수정, F:취소, D:삭제
    sMsg          : String;
    SQLStr        : String;
    AmtChk,AmtChk2,iEXCEPTAMT : Double;
    FL_Appdate, FL_AppEmp, FL_DevYYMM, FL_MaxApp  : String;
    procedure setEditMask;
  end;

var
  FM_Sports: TFM_Sports;

implementation

uses PSH1030A1, PSH1030A4, PSH1030A6, PSH1030A7;

{$R *.DFM}

procedure TFM_Sports.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  FL_Appdate := FM_Mainform.FG_Appdate;
  FL_AppEmp  := Copy(FM_Mainform.PE_empno.Text,1,4);
  L_Appdate.Text := Copy(FL_Appdate,1,4)+'-'+Copy(FL_Appdate,5,2);
  L_Appdate.Items.Clear;

  for i := 0 downto -15 do
  begin
    L_Appdate.Items.Add(Copy(AddMonthStr(L_Appdate.Text+'-01',i),1,7));
  end;
end;

procedure TFM_Sports.FormShow(Sender: TObject);
begin
  //복리후생 관리자는 사번 보이도록...
  if FM_Mainform.vAdmin = True then
  begin
    L_AppEmpno.Visible := True;
    E_Seq.Visible := True;
  end
  else
  begin
    L_AppEmpno.Visible := False;
    E_Seq.Visible := False;
  end;

  Read_PlayRecords(FL_Appdate, FL_Appemp);
  L_AppEmpno.ValueCaption := FM_Mainform.PE_empno.Text;
  setEditMask;
end;

procedure TFM_Sports.ComponentClear;
begin
  E_playamt.Text  := '';
  E_playitem.Text := '';
  E_corpname.Text := '';
  E_corptel.Text  := '';
  E_comments.Text := '';
  E_Photo.Text    := '0';
end;

procedure TFM_Sports.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  E_division.Text := '1';
  MaxSeq;
  BB_Modify.Enabled := False;
  BB_Delete.Enabled := False;
  BB_Save.Enabled   := True;
  B_Act.Enabled     := True;
  B_Act1.Enabled    := False;
  L_Appdate.Text    := Copy(FM_Mainform.FG_Appdate,1,4)+'-'+Copy(FM_Mainform.FG_Appdate,5,2);
  L_Appdate.Enabled := False;
  Photo_Sel;
  Set_Field(True, True);
end;

procedure TFM_Sports.BB_ModifyClick(Sender: TObject);
begin
  JobMode := 'U';
  if not Check_Input then Exit;
  BB_Append.Enabled := False;
  BB_Delete.Enabled := False;
  BB_Save.Enabled   := True;
  B_Act.Enabled     := True;
  B_Act1.Enabled    := False;
  Set_Field(True, False);

  If E_Photo.value = 0 Then
  Begin
    MessageDlg('증빙서류를 등록하시기 바랍니다.', mtInformation, [mbOk], 0);
    Exit;
  End;
end;

procedure TFM_Sports.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);
  Read_PlayRecords(FL_Appdate, FL_AppEmp);
  BB_Append.Enabled := True;
  BB_Modify.Enabled := True;
  BB_Delete.Enabled := True;
  BB_Save.Enabled   := False;
  B_Act.Enabled     := False;
  L_Appdate.Enabled := True;
end;

procedure TFM_Sports.Set_Field(arg1, arg2 : Boolean );
begin
  DB_PalyList.Enabled  := not arg1;

  E_playamt.Enabled  := arg1;
  E_playitem.Enabled := arg1;
  E_corpname.Enabled := arg1;
  E_corptel.Enabled  := arg1;
  E_comments.Enabled := arg1;

  if arg2 then
  begin
    E_playamt.Text  := '';
    E_playitem.Text := '';
    E_corpname.Text := '';
    E_corptel.Text  := '';
    E_comments.Text := '';
    E_Photo.Text    := '0';
  end;
end;

procedure TFM_Sports.PL_Com_Contructor;
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

function TFM_Sports.Check_Input : Boolean;
var
   Temp : Real;
   CNT  : Integer;
begin
  result := True;
  if JobMode <> 'I' then
  Begin
    if FL_CONYN = 'Y' Then
    Begin
      MessageDlg('승인된 자료 입니다.',mtInformation,[mbOK],0);
      result := false;
      Exit;
    End;
  End;

  if JobMode <> 'D' then
  Begin
    with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT EMPNO,    ');
      Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
      Sql.Add('  FROM PSHPHOT                        ');
      Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +''' ');
      Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +''' ');
      Sql.Add('   AND SEQ     = '''+ E_Seq.Text +''' ');
      Open;

      If RecordCount = 0 Then
      Begin
        MessageDlg('첨부파일을 등록하시기 바랍니다.', mtInformation, [mbOk], 0);
        B_Act.Enabled   := True;
        result := false;
        Exit;
      End;
    End;
  End;

  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    Sql.Add(' SELECT nvl(FINDSPEC(MAX(SUBSTR(APPDATE,1,4)), MAX(EMPNO)), 0), ');
    Sql.Add('        nvl(MAX(SUPSUM), 0),                                    ');
    Sql.Add('        ''field3'', ''field4'', ''field5''                      ');
    Sql.Add('  FROM PSHAPSUM                                                 ');
    Sql.Add(' WHERE APPDATE >= '''+ FM_Mainform.FL_MaxApp +'''               ');
    Sql.Add('   AND PART   = ''B''                                           ');
    Sql.Add('   AND EMPNO   = '''+ Copy(FM_Mainform.PE_empno.Text,1,4) +'''  ');
    ClearFieldInfo;
    AddField('Field1', ftString, 100);
    AddField('Field2', ftString, 100);
    AddField('Field3', ftString, 100);
    AddField('Field4', ftString, 100);
    AddField('Field5', ftString, 100);

    Open;

    //84만원보다 크면.
    If (FieldByName('field2').AsFloat >= FieldByName('field1').AsFloat) Then
    Begin
      MessageDlg('년지원금을 초과하였습니다. 조회만 가능합니다.', mtInformation, [mbOk], 0);
      result := false;
    End;
    Close;
  end;

  if E_playamt.Text   < '0' then
  begin
    MessageDlg('지급액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
    Exit;
  end;
  if E_playitem.Text < '       ' then
  begin
    MessageDlg('운동종목을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
    Exit;
  end;
  if E_corpname.Text < '       ' then
  begin
    MessageDlg('사업자명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
    Exit;
  end;
  if E_corptel.Text  < '0' then
  begin
    MessageDlg('운동시설의 전화번호를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
    Exit;
  end;
end;

procedure TFM_Sports.MaxSeq;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1),    ');
    Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
    Sql.Add('  FROM PSHAPLAY                       ');
    Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +''' ');
    Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +''' ');
    Open;
    E_Seq.Text := FieldByName('field1').AsString;

    Close;
  end;
end;

procedure TFM_Sports.Next_Month(sAppdate : String);
begin
  with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+ sAppdate +''',''YYYYMM''), 1),''YYYYMM''),');
      Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
      Sql.Add('  FROM Dual                      ');
      Open;        //  edit1.text := sql.text;
      FL_DevYYMM := FieldByName('field1').AsString;
      Close;
    end;
end;

Procedure TFM_Sports.Read_PlayRecords(Appdate, EmpNo : String);
begin
  with TDS_Detail do
  begin
    ServiceName := 'HINSA_select20';
    Close;
    Sql.Clear;

    Sql.Text := ' SELECT EMPNO, SEQ, CORPNAME, CORPTEL, PLAYDATE, PLAYITEM, '+
                '        PLAYAMT, DIVISION, CONYN, CONYNSAYU, COMMENTS,     '+
                '        (SELECT COUNT(*) FROM PSHPHOT                      '+
                '         WHERE APPDATE = A.APPDATE                         '+
                '           AND EMPNO   = A.EMPNO                           '+
                '           AND SEQ     = A.SEQ) SSEQ,                      '+
                '       ''F13'',''F14'', ''F15'', ''F16'',                  '+
                '       ''F17'',''F18'', ''F19'', ''F20''                   '+
                '   FROM PSHAPLAY A                                         '+
                '  WHERE APPDATE = '''+ Appdate +'''                        '+
                '    AND EMPNO   = '''+ Empno  +'''                         '+
                '  ORDER BY SEQ                                             ';

    ClearFieldInfo;
    AddField('EMPNO'    , ftString,  100);
    AddField('SEQ'      , ftInteger, 100);
    AddField('CORPNAME' , ftString,  100);
    AddField('CORPTEL'  , ftString,  100);
    AddField('PLAYDATE' , ftString,  100);
    AddField('PLAYITEM' , ftString,  100);
    AddField('PLAYAMT'  , ftInteger, 100);
    AddField('DIVISION' , ftInteger, 100);
    AddField('CONYN'    , ftString,  100);
    AddField('CONYNSAYU', ftString,  100);
    AddField('COMMENTS' , ftString,  100);
    AddField('SSEQ'     , ftInteger, 100);
    AddField('F13'      , ftString,  100);
    AddField('F14'      , ftString,  100);
    AddField('F15'      , ftString,  100);
    AddField('F16'      , ftString,  100);
    AddField('F17'      , ftString,  100);
    AddField('F18'      , ftString,  100);
    AddField('F19'      , ftString,  100);
    AddField('F20'      , ftString,  100);

    Open;
    TFloatField(FieldByName('PLAYAMT')).DisplayFormat := '#,###';
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TFM_Sports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //증명서류 저장후 PSHAPLAY에 저장하지 않을 경우 증명서류 삭제.
  SQLStr  := ' DELETE FROM PSHPHOT A '+
             ' WHERE NOT EXISTS(SELECT * FROM PSHAPLAY    '+
             '                  WHERE APPDATE = A.APPDATE '+
             '                    AND EMPNO   = A.EMPNO   '+
             '                    AND SEQ     = A.SEQ)    ';

  TDS_DML.Sql.Clear;
  TDS_DML.Sql.Add(SQLStr);
  TDS_DML.Execute;

  Action := caFree;
end;

procedure TFM_Sports.BB_DeleteClick(Sender: TObject);
var Playdate : string;
begin
  JobMode := 'D';
  if not Check_Input then Exit;

  if E_corpname.Text = '' then
  begin
    MessageDlg('삭제할 데이터를 선택후 작업하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  SQLStr  := 'DELETE FROM PSHAPLAY  '+
             ' WHERE APPDATE = '''+ FL_Appdate +''' '+
             '   AND EMPNO   = '''+ FL_AppEmp  +''' '+
             '   AND SEQ     = '''+ E_Seq.Text +''' ';

  TDS_DML.Sql.Clear;  // ServiceName := 'PSC1040C_dml';
  TDS_DML.Sql.Add(SQLStr);

  if not TDS_DML.Execute then
  begin
    MessageDlg('등록내역 삭제에 실패했습니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  SQLStr  := 'DELETE FROM PSHPHOT  '+
             ' WHERE APPDATE = '''+ FL_Appdate +''' '+
             '   AND EMPNO   = '''+ FL_AppEmp  +''' '+
             '   AND SEQ     = '''+ E_Seq.Text +''' ';

  TDS_DML.Sql.Clear;
  TDS_DML.Sql.Add(SQLStr);

  if not TDS_DML.Execute then
  begin
    MessageDlg('첨부파일 삭제에 실패했습니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  Read_PlayRecords(FL_Appdate, FL_Appemp);
  JobMode := 'F';
  Set_Field(False, True);
end;

procedure TFM_Sports.BB_SaveClick(Sender: TObject);
var
  Playdate, DevYYMM, EndYYMM : string;
  i : integer;
  AmtFirst, AmtLast, iGIVEMAX3 : Double;
  iPlaySum : Double;
  tmp_JobMode : Char;
  V : Variant; //데이터 수정 후 해당 레코드 Locate 하기위한 Seq 저장변수
begin
  if not Check_Input then Exit;

  with TDS_Com do
  begin
    PL_Com_Contructor;
    (* 매년 1월 특이자 경우 전년도 중도입사금액으로 계산함. 207.01.03 HeeYong *)
    SQLStr := 'SELECT to_char(add_months(to_date('+ FM_Mainform.FL_MaxApp +',''yyyymm''),'+ FloatToStr(E_division.Value) +'-1),''yyyymm''), '+
              '       FINDSPEC(SUBSTR('''+ FM_Mainform.FL_MaxApp +''',1,4 ),'''+ FL_AppEmp +''') , ''field3'', ''field4'', ''field5''  '+
              ' FROM PSCAPBAS ';

    Sql.Clear;
    Sql.Add(SQLStr);
    Open;

    EndYYMM   := FieldByName('field1').AsString;   //분할개월 마지막월
    iGIVEMAX3 := FieldByName('field2').AsFloat;    //월 한도액
    Close;
  end;

  Playdate := '';
  tmp_JobMode := JobMode;

  with TDS_Com do
  begin
    PL_Com_Contructor;
    SQLStr := 'SELECT NVL(SUM(PLAYAMT - EXCEPTAMT),0),           '+
              '       ''f2'', ''f3'', ''f4'', ''f5''             '+
              ' FROM PSHAPLAY                                    '+
              ' WHERE APPDATE >= '''+ FM_Mainform.FL_MaxApp +''' '+
              '  AND NVL(CONYN,''N'') <> ''X''                   '+
              '  AND EMPNO = '''+ FL_AppEmp+'''                  ';
    Sql.Clear;
    Sql.Add(SQLStr);
    Open;

    iPlaySum := FieldByName('field1').AsFloat;
    Close;
  end;

  if (JobMode = 'I') and (E_division.Value <= 1) then
  begin
    SQLStr := 'INSERT INTO PSHAPLAY                                  '+
              '      (APPDATE, EMPNO, KORNAME, PAYCL, SEQ, JOBPLACE, '+
              '       CORPNAME, CORPTEL, PLAYDATE, PLAYITEM, PLAYAMT,'+
              '       EXCEPTAMT, DIVISION, STARTYYMM, ENDYYMM,       '+
              '       COMMENTS, WRITETIME, WRITEMAN )                '+
              '  VALUES                                 '+
              '   ('''+ FL_Appdate                +''', '+
              '    '''+ FL_AppEmp                 +''', '+
              '    '''+ FM_Mainform.PE_empno.Korname +''', '+
              '    '''+ FM_Mainform.FG_Paycl      +''', '+
              '    '''+ E_Seq.Text                +''', '+
              '    '''+ FM_Mainform.FG_Place      +''', '+
              '    '''+ E_corpname.Text           +''', '+
              '    '''+ E_corptel.Text            +''', '+
              '    '''+ Playdate                  +''', '+
              '    '''+ E_playitem.Text           +''', '+
              '    '''+ FloatToStr(E_playamt.Value) +''', ';

           if (iPlaySum + E_playamt.Value - iGIVEMAX3 > 0) then
              SQLStr := SQLStr + ' '''+ FloatToStr(iPlaySum + E_playamt.Value - iGIVEMAX3) +''', '
           else
              SQLStr := SQLStr + ' '''+ FloatToStr(0) +''', ';

     SQLStr := SQLStr +
              '    '''+ FloatToStr(E_division.Value)+''', '+
              '    '''+ FL_Appdate                +''', '+  //STARTYYMM
              '    '''+ EndYYMM                   +''', '+  //ENDYYMM
              '    '''+ E_comments.Text           +''', '+
              '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
              '    '''+ FM_Mainform.FG_Empno      +''') ';
  end
  else if (JobMode = 'U') and (FL_CONYN = '') then  //결재전에만 Update 가능토록 FL_CONYN 추가 .
  begin
    SQLStr := 'UPDATE PSHAPLAY  SET                          '+
              '       CORPNAME  = '''+ E_corpname.Text +''', '+
              '       CORPTEL   = '''+ E_corptel.Text  +''', '+
              '       PLAYDATE  = '''+ Playdate        +''', '+
              '       PLAYITEM  = '''+ E_playitem.Text +''', '+
              '       PLAYAMT   = '''+ FloatToStr(E_playamt.Value) +''', ';

           if (iPlaySum + E_playamt.Value - iGIVEMAX3 > 0) then
              SQLStr := SQLStr + '       EXCEPTAMT = '''+ FloatToStr(iPlaySum + E_playamt.Value - iGIVEMAX3) +''', '
           else
              SQLStr := SQLStr + '       EXCEPTAMT = '''+ FloatToStr(0) +''', ';

    SQLStr := SQLStr +
              '       DIVISION  = '''+ FloatToStr(E_division.Value)+''', '+
              '       STARTYYMM = '''+ FL_Appdate                  +''', '+
              '       ENDYYMM   = '''+ EndYYMM                     +''', '+
              '       COMMENTS  = '''+ E_comments.Text             +''', '+
              '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
              '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
              ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
              '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
              '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
  end
  else if (JobMode = 'U') and (FL_CONYN <> '') then
  begin
    MessageDlg('결재완료후에는 변경이 불가능합니다',mtError, [mbOk],0);
    System.Exit;
  end
  else
    System.Exit;

  TDS_DML.Sql.Clear;        // ServiceName := 'PSC1040C_dml';
  TDS_DML.Sql.Add(SQLStr);  // edit1.text := SQLStr;

  if not TDS_DML.Execute then
  begin
    MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  ///최종 저장하는 시점의 근무지로 해당월의 모든 데이터 업데이트
  SQLStr := 'UPDATE PSHAPLAY  SET                          '+
            '       JOBPLACE  = '''+ FM_Mainform.FG_Place +'''  '+
            ' WHERE APPDATE   = '''+ FL_Appdate           +'''  '+
            '   AND EMPNO     = '''+ FL_AppEmp            +'''  ';
  TDS_DML.Sql.Clear;  // ServiceName := 'PSC1040C_dml';
  TDS_DML.Sql.Add(SQLStr);

  if not TDS_DML.Execute then
  begin
    MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  V := VarArrayCreate([0,0],varInteger);
  V[0] := StrToInt(E_Seq.Text);

  Read_PlayRecords(FL_Appdate, FL_AppEmp);

  if (tmp_JobMode = 'I') then
  begin
    TDS_Detail.Last;
  end
  else if (tmp_JobMode = 'U') then
  begin
    TDS_Detail.Locate('seq',V,[]);
  end;

  JobMode := 'F';
  Set_Field(False, False);
  BB_Append.Enabled := True;
  BB_Modify.Enabled := True;
  BB_Delete.Enabled := True;
  BB_Save.Enabled   := False;
  B_Act.Enabled     := False;
end;

procedure TFM_Sports.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  If (JobMode = 'I') Then Exit;
  If ((JobMode <> 'I') or (JobMode <> 'U')) Then
  Begin
    with TDS_Detail do
    begin
      JobMode         := 'F';
      E_Seq.Text      := FieldByName('SEQ').AsString;
      E_corpname.Text := FieldByName('CORPNAME').AsString;
      E_corptel.Text  := FieldByName('CORPTEL').AsString;
      E_playamt.Text  := FieldByName('PLAYAMT').AsString;
      E_playitem.Text := FieldByName('PLAYITEM').AsString;
      E_division.Text := FieldByName('DIVISION').AsString;
      E_comments.Text := FieldByName('COMMENTS').AsString;
      E_Photo.Value   := FieldByName('SSEQ').AsInteger;
      FL_CONYN        := FieldByName('CONYN').AsString;
    end;

    If (E_Photo.Value > 0) Then
         B_Act1.Enabled := True
    Else B_Act1.Enabled := False;
  End;
end;

procedure TFM_Sports.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sports.E_divisionExit(Sender: TObject);
var  frdate, todate, sDivi : String;
begin
  sDivi := FloatToStr(E_division.Value - 1);
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Sql.Add('SELECT SUBSTR(CONTODATE,1,6) field1,');
    Sql.Add('       TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(CONTODATE,1,6),''YYYYMM''), '''+ sDivi +'''),''YYYYMM''), ');
    Sql.Add('       ''field3'', ''field4'', ''field5''  ');
    Sql.Add('  FROM PSCAPBAS                      ');
    Open;       //   edit1.text := sql.text;
    frdate := FieldByName('field1').AsString;
    todate := FieldByName('field2').AsString;
    Close;
    end;

  if frdate <> todate then
    E_comments.Text := frdate+' ~ '+todate
  else
    E_comments.Text := frdate;
end;

procedure TFM_Sports.BB_HelpClick(Sender: TObject);
begin
  if   HelpMemo1.Visible then HelpMemo1.Visible := False
  else HelpMemo1.Visible := True;
end;

procedure TFM_Sports.BB_PrintClick(Sender: TObject);
begin
  ///////////////////////////////////////////////////////////////////////
//  FM_Tmax           := TFM_Tmax.Create(Self);
//  FM_Tmax.T_Session := TMaxSession;
//  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  FM_Print := TFM_Print.Create(Application);
  FM_Print.QRCompositeReport1.Preview;
end;

procedure TFM_Sports.B_ActClick(Sender: TObject);
begin
  FM_Photo := TFM_Photo.Create(Self);
  try
    FM_Photo.ShowModal;
  finally
    Ora_Session.Connected := False;
    FM_Photo.Free;
  end;

  Photo_Sel;
//  Read_PlayRecords(FL_Appdate, FL_Appemp);
end;

procedure TFM_Sports.Photo_Sel;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Sql.Add(' SELECT TO_CHAR(NVL(COUNT(*),0)) field1,');
    Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
    Sql.Add('  FROM PSHPHOT                        ');
    Sql.Add(' WHERE APPDATE = ''' +FL_Appdate+ ''' ');
    Sql.Add('   AND EMPNO   = ''' +FL_AppEmp+  ''' ');
    Sql.Add('   AND SEQ     = ''' +E_Seq.Text+ ''' ');
    Open;
    E_Photo.text := FieldByName('field1').AsString;

    Close;
  end;
end;

procedure TFM_Sports.B_Act1Click(Sender: TObject);
begin
  FM_Viewer32 := TFM_Viewer32.Create(Self);
  try
    FM_Viewer32.ShowModal;
  finally
    FM_Viewer32.Free;
  end;
end;

procedure TFM_Sports.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sports.setEditMask;
var
   EditMaskDate : String;
begin
  EditMaskDate := Copy(L_Appdate.text,6,2);

  if (Copy(L_Appdate.text,6,2)='01') or (Copy(L_Appdate.text,6,2)='02') then
    EditMaskDate := inttostr(strtoint(Copy(L_Appdate.text,1,4))-1)
  else
    EditMaskDate := Copy(L_Appdate.text,1,4);
end;

procedure TFM_Sports.L_AppdateChange(Sender: TObject);
begin
  FL_Appdate := Copy(L_Appdate.Text,1,4)+Copy(L_Appdate.Text,6,2);
  Read_PlayRecords(FL_Appdate, FL_Appemp);
  setEditMask;
end;

procedure TFM_Sports.FormActivate(Sender: TObject);
begin
  MessageDlg(' ※ 증빙서류'+#10#13+#10#13+
             ' - 신용카드 영수증 또는 현금영수증 1부' +#10#13+
             ' - 회원명, 운동기간이 기재된 회원증 또는 입회신청서 1부' +#10#13+
             ' * 매월 10일 기준 1개월 이전 영수증까지 유효' , mtInformation, [mbOk], 0);

(*
  MessageDlg(' ※ 2016년 체육활동지원금 잔여 한도 사용 안내'+#10#13+#10#13+
             ' - 대      상 : 2016.12월 영수증(운동기간 상관없이 영수일자 기준)' +#10#13+
             ' - 신청기간 : 2016.12.25 ~ 2017.01.10(종합인사 등록)' +#10#13+
             ' - 한      도 : 2016년 잔여한도 적용' +#10#13+
             ' - 지 급 일  : 2017년 1월 25일(급여 포함 지급)'+#10#13+#10#13+
             ' ※ 2017년 한도 사용 예정이신분은 17년에 등록한 영수증으로 17년 1/25일부터 신청 가능하며(2월 급여지급),' +#10#13+
             '    1월은 전년도(2016년) 잔여한도 신청 기간이므로, 가급적 2월에 운동기관에서 등록/결제 후 신청 부탁 드립니다.' , mtInformation, [mbOk], 0);
*)
end;

end.


