unit PIU20101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, StdCtrls, OnShapeLabel, OnTmaxDeptEdit, OnEditMemo,
  OnEditCombo, ComCtrls, OnFocusButton, Tmax_session, OnInsaCommon,
  Db, Tmax_DataSetText, Mask, Buttons, Calen1, TmaxFunc;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    L_paycl: TOnShapeLabel;
    L_payra: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    Shape3: TShape;
    Label2: TLabel;
    ED_emp: TTMaxPersonPopupEdit;
    P_timekind: TPanel;
    OnShapeLabel2: TOnShapeLabel;
    ED_dept1: TTMaxDeptPopupEdit;
    Shape6: TShape;
    Label3: TLabel;
    CB_move1: TOnComboEdit;
    Panel2: TPanel;
    Bt_save: TOnFocusButton;
    Bt_Del: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Bt_cancel: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    SB_Help: TStatusBar;
    M_long: TOnMemo;
    Bt_desc1: TOnFocusButton;
    Shape1: TShape;
    Label4: TLabel;
    ED_dept2: TTMaxDeptPopupEdit;
    CB_move2: TOnComboEdit;
    Bt_desc2: TOnFocusButton;
    Shape5: TShape;
    Label5: TLabel;
    Shape7: TShape;
    Label6: TLabel;
    Bt_app: TOnFocusButton;
    L_status: TOnShapeLabel;
    Bt_print: TOnFocusButton;
    ED_dept3: TTMaxDeptPopupEdit;
    Bt_desc3: TOnFocusButton;
    CB_move3: TOnComboEdit;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    Shape4: TShape;
    SpeedButton1: TSpeedButton;
    MEcertprdate1: TMaskEdit;
    Panel8: TPanel;
    Panel3: TPanel;
    MEcertprdate2: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MEcertprdate3: TMaskEdit;
    OnFocusButton1: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    CB_Year: TOnComboEdit;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    RB_5: TRadioButton;
    RB_3: TRadioButton;
    RB_2: TRadioButton;
    RB_A: TRadioButton;
    RB_E: TRadioButton;
    RB_T: TRadioButton;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_cancelClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure Bt_saveClick(Sender: TObject);
    procedure ED_empReadEnded(Sender: TObject);
    procedure ED_empKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_desc1Click(Sender: TObject);
    procedure Bt_appClick(Sender: TObject);
    procedure ED_dept1CloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure Bt_printClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    GSEmpno     : String;
    GSKorname   : String;
    GSGrade     : String;
    SqlStr      : String;
    PayraChdate : String;

    GSsayu1     : String;
    GSsayu2     : String;
    GSsayu3     : String;
    GSspedesc1     : String;
    GSspedesc2     : String;
    GSspedesc3     : String;

    gs_Year     : String;
    
    procedure CompInit;
    procedure Retrieve;
  end;

var
  MainForm: TMainForm;

implementation

uses PIU20102, PIU20103, PIU20104;

{$R *.DFM}

procedure TMainForm.Bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Retrieve;
begin
  L_paycl.ValueCaption := ED_emp.payclname;
  L_payra.ValueCaption := ED_emp.payraname;
  L_dept.ValueCaption  := Ed_emp.deptname;

  SqlStr := 'SELECT EMPNO      ,   KORNAME    ,    PAYCL      ,     PAYRA      ,      '+
            '       ORGNUM     ,   DEPTCODE   ,    STATUS     ,     TRIM(GUBUN) GUBUN,'+
            '       LONGDESC   ,   APPDEPT1   ,    MOVEYYMM1  ,     APPSAYU1   ,      '+
            '       SPEDESC1   ,   APPDEPT2   ,    MOVEYYMM2  ,     APPSAYU2   ,      '+
            '       SPEDESC2   ,   APPDEPT3   ,    MOVEYYMM3  ,     APPSAYU3   ,      '+
            '       SPEDESC3                                                          '+
            '  FROM PIDCHAPP                                                          '+
//            ' WHERE ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
            ' WHERE Appdate like '''+gs_Year+'''||''%''                          '+ //dsa2000  2008.01. Add
            '   AND EMPNO  = '''+ED_emp.empno+'''    ';

  with TDS1 do
    begin
      ServiceName := 'PZK1030A_sel7';
      Close;
      Sql.Clear;
      Sql.Add(SqlStr);

      ClearFieldInfo;
      AddField('EMPNO'    , ftString, 4);
      AddField('KORNAME'  , ftString, 12);
      AddField('PAYCL'    , ftString, 2);
      AddField('PAYRA'    , ftString, 2);
      AddField('ORGNUM'   , ftString, 3);
      AddField('DEPTCODE' , ftString, 5);
      AddField('STATUS'   , ftString, 1);
      AddField('GUBUN'    , ftString, 30);
      AddField('LONGDESC' , ftString, 600);
      AddField('APPDEPT1' , ftString, 5);
      AddField('MOVEYYMM1', ftString, 20);
      AddField('APPSAYU1' , ftString, 1000);
      AddField('SPEDESC1' , ftString, 1000);
      AddField('APPDEPT2' , ftString, 5);
      AddField('MOVEYYMM2', ftString, 20);
      AddField('APPSAYU2' , ftString, 1000);
      AddField('SPEDESC2' , ftString, 1000);
      AddField('APPDEPT3' , ftString, 5);
      AddField('MOVEYYMM3', ftString, 20);
      AddField('APPSAYU3' , ftString, 1000);
      AddField('SPEDESC3' , ftString, 1000);
      Open;

     // showmessage(inttostr(recordcount));

      if TDS1.Eof then
        begin
          CompInit;
          Exit;
        end;

      if      FieldByName('STATUS').AsString = '1' then L_status.ValueCaption := '임시저장'
      else if FieldByName('STATUS').AsString = '2' then L_status.ValueCaption := '신청'
      else                                              L_status.ValueCaption := '';

      M_long.Text := FieldByName('LONGDESC').AsString;;
//      GUBUN 종류******************
//      5년 이상 장기근무
//      3년∼5년 근무자
//      3년 미만(승격자격 취득희망)
//      무연고 지역 2년 이상 근무
//      기타 사유자
//      본사/수도권 ↔ 지방 (2007년부터 적용)
      if      FieldByName('GUBUN').AsString ='5년 이상 장기근무'           then RB_5.Checked := True
      else if FieldByName('GUBUN').AsString ='3년∼5년 근무자'             then RB_3.Checked := True
      else if FieldByName('GUBUN').AsString ='3년 미만(승격자격 취득희망)' then RB_2.Checked := True
      else if FieldByName('GUBUN').AsString ='무연고 지역 2년 이상 근무'   then RB_A.Checked := True
      else if FieldByName('GUBUN').AsString ='기타 사유자'                 then RB_E.Checked := True
      else if FieldByName('GUBUN').AsString ='본사/수도권 ↔ 지방'         then RB_T.Checked := True;

      ED_dept1.Text     := FieldByName('APPDEPT1').AsString;
      ED_dept1.PL_get_singledata;
      ED_dept1.Refresh;
      MEcertprdate1.Text:= FieldByName('MOVEYYMM1').AsString;

      ED_dept2.Text     := FieldByName('APPDEPT2').AsString;
      ED_dept2.PL_get_singledata;
      ED_dept2.Refresh;
      MEcertprdate2.Text:= FieldByName('MOVEYYMM2').AsString;

      ED_dept3.Text     := FieldByName('APPDEPT3').AsString;
      ED_dept3.PL_get_singledata;
      ED_dept3.Refresh;
      MEcertprdate3.Text:= FieldByName('MOVEYYMM3').AsString;

      GSsayu1     := FieldByName('APPSAYU1').AsString;
      GSsayu2     := FieldByName('APPSAYU2').AsString;
      GSsayu3     := FieldByName('APPSAYU3').AsString;
      GSspedesc1  := FieldByName('SPEDESC1').AsString;
      GSspedesc2  := FieldByName('SPEDESC2').AsString;
      GSspedesc3  := FieldByName('SPEDESC3').AsString;

      if FieldByName('STATUS').AsString = '2' then
      begin
          Bt_save.Enabled   := False;
          Bt_app.Enabled    := False;
          Bt_Del.Enabled    := False;
          Bt_cancel.Enabled := False;
      end
      else
      begin
          Bt_save.Enabled   := True;
          Bt_app.Enabled    := True;
          Bt_Del.Enabled    := True;
          Bt_cancel.Enabled := True;
      end;
    end;
end;

procedure TMainForm.CompInit;
begin
  L_status.ValueCaption := '';
  M_long.Text     := '';
  RB_5.Checked    := False;
  RB_3.Checked    := False;
  RB_2.Checked    := False;
  RB_A.Checked    := False;
  RB_E.Checked    := False;
  RB_T.Checked    := False;


  ED_dept1.Text   := '';
  CB_move1.ItemIndex   := -1;
  ED_dept2.Text   := '';
  CB_move2.ItemIndex   := -1;
  ED_dept3.Text   := '';
  CB_move3.ItemIndex   := -1;

  GSsayu1     := '';
  GSsayu2     := '';
  GSsayu3     := '';
  GSspedesc1  := '';
  GSspedesc2  := '';
  GSspedesc3  := '';

  MEcertprdate1.Text := '';
  MEcertprdate2.Text := '';
  MEcertprdate3.Text := '';

  Bt_save.Enabled   := True;
  Bt_app.Enabled    := False;
  Bt_Del.Enabled    := False;
  Bt_cancel.Enabled := True;
end;

procedure TMainForm.Bt_cancelClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.Bt_DelClick(Sender: TObject);
begin
  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SqlStr  := 'DELETE PIDCHAPP ' +
//             'WHERE ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
             ' WHERE Appdate like '''+gs_Year+'''||''%'' '+ //dsa2000  2008.01. Add
             '   AND EMPNO  = ''' + ED_emp.empno + '''   ';

  with TDS_dml do
  begin
      ServiceName := 'PZK1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
      begin
          MessageDlg('삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
      end;
  end;

  MessageDlg('삭제되었습니다.',mtInformation, [mbOk],0);
  CompInit;
end;

procedure TMainForm.Bt_saveClick(Sender: TObject);
var
  JobMode, gubun : String;
begin
  if ED_emp.empno = '' then  System.Exit;

  if Length(M_long.Text) >= 600 then
  begin
      Messagedlg('장기근무 내역을 300자 이내로 작성하여 주십시오.',mtError,[mbOK],0);
      System.Exit;
  end;

  if Trim(M_long.Text) = '' then
  begin
      Messagedlg('장기근무 내역을 입력해 주세요.',mtError,[mbOK],0);
      System.Exit;
  end;

  if not (RB_5.Checked or RB_3.Checked or RB_2.Checked or
          RB_A.Checked or RB_E.Checked or RB_T.Checked) then
  begin
      MessageDlg('배치 전환 구분을 선택해주세요..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept1.Text = '') or (ED_dept1.deptcode = '') then
  begin
      MessageDlg('1지망 지원부서를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept1.Text <> '') and (ED_dept1.deptcode <> '') and (MEcertprdate1.Text = '')then
  begin
      MessageDlg('1지망 이동희망(가능)일자를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept2.Text = '') or (ED_dept2.deptcode = '') then
    begin
      MessageDlg('2지망 지원부서를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
    end;

  if (ED_dept2.Text <> '') and (ED_dept2.deptcode <> '') and (MEcertprdate2.Text = '')then
  begin
      MessageDlg('2지망 이동희망(가능)일자를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept2.Text = '') and (MEcertprdate2.Text <> '')then
  begin
      MessageDlg('2지망 이동희망(가능)일자는 있는데 지원부서가 없습니다..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept3.Text = '') or (ED_dept3.deptcode = '') then
   begin
      MessageDlg('3지망 지원부서를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
    end;

  if (ED_dept3.Text <> '') and (ED_dept3.deptcode <> '') and (MEcertprdate3.Text = '')then
  begin
      MessageDlg('3지망 이동희망(가능)일자를 입력해 주세요..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept3.Text = '') and (MEcertprdate3.Text <> '')then
  begin
      MessageDlg('3지망 이동희망(가능)일자는 있는데 지원부서가 없습니다..',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (Trim(GSsayu1) = '') then
  begin
      MessageDlg('1지망 지원동기를 입력해 주세요', mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept2.deptcode <> '') and (Trim(GSsayu2) = '') then
  begin
      MessageDlg('2지망 지원동기를 입력해 주세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept3.deptcode <> '') and (Trim(GSsayu3) = '') then
  begin
      MessageDlg('3지망 지원동기를 입력해 주세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (Trim(GSsayu2) <> '') and (ED_dept2.deptcode = '') then
  begin
      MessageDlg('2지망 지원동기가 있는데 지원 부서가 없습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (Trim(GSsayu3) <> '') and (ED_dept3.deptcode = '') then
  begin
      MessageDlg('3지망 지원동기가 있는데 지원 부서가 없습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept1.deptcode = ED_dept2.deptcode) then
  begin
      MessageDlg('1지망 지원 부서와 2지망 지원 부서가 같습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept1.deptcode = ED_dept3.deptcode) then
  begin
      MessageDlg('1지망 지원 부서와 3지망 지원 부서가 같습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;

  if (ED_dept2.deptcode = ED_dept3.deptcode) then
  begin
      MessageDlg('2지망 지원 부서와 3지망 지원 부서가 같습니다.'+#13+#13+'확인하고 다시입력하세요.',mtInformation,[mbOk],0);
      System.Exit;
  end;
  if MessageDlg('임시저장 하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then  System.Exit;

  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := 'SELECT empno , ''field2'', ''field3'', ''field4'',''field5''   '+
                  '  FROM pidchapp                                                '+
//                  'WHERE orgnum = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                  ' WHERE Appdate like '''+gs_Year+'''||''%''                     '+ //dsa2000  2008.01. Add
                  '   AND empno = '''+ED_emp.empno+'''    ';

      ClearFieldInfo;
      AddField('EMPNO'     , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

      TDS1.First;
      if  (TDS1.Eof) and (TDS1.Bof) then JobMode :='I'
      else                               JobMode :='U';
    end;

//      5년 이상 장기근무
//      3년∼5년 근무자
//      3년 미만(승격자격 취득희망)
//      무연고 지역 2년 이상 근무
//      기타 사유자
//      본사/수도권 ↔ 지방 (2007년부터 적용)

  if      RB_5.Checked then   gubun := '5년 이상 장기근무'
  else if RB_3.Checked then   gubun := '3년∼5년 근무자'
  else if RB_2.Checked then   gubun := '3년 미만(승격자격 취득희망)'
  else if RB_A.Checked then   gubun := '무연고 지역 2년 이상 근무'
  else if RB_E.Checked then   gubun := '기타 사유자'
  else if RB_T.Checked then   gubun := '본사/수도권 ↔ 지방';

  if JobMode = 'I' then
  begin
      SQLStr := 'INSERT INTO PIDCHAPP ' +
                '   (EMPNO,     KORNAME,   PAYCL,     PAYRA,     ORGNUM,     '+
		'    DEPTCODE,  STATUS,    GUBUN,     LONGDESC,              '+
                '    APPDEPT1,  MOVEYYMM1, APPSAYU1,  SPEDESC1,              '+
                '    APPDATE,   WRITETIME, WRITEMAN)                         '+
                '  VALUES                         '+
                '   (''' + ED_emp.empno    + ''', '+
                '    ''' + ED_emp.korname  + ''', '+
                '    ''' + ED_emp.paycl    + ''', '+
                '    ''' + ED_emp.payra    + ''', '+
                '    ''' + ED_emp.orgnum   + ''', '+
                '    ''' + ED_emp.deptcode + ''', '+
                '    ''1''                      , '+
                '    ''' + gubun           + ''', '+
                '    ''' + StringReplace(M_long.Text,'''','`',[rfReplaceAll]) + ''', '+
                '    ''' + ED_dept1.deptcode                                  + ''', '+
                '    ''' + MEcertprdate1.Text                                 + ''', '+
                '    ''' + StringReplace(GSsayu1,'''','`',[rfReplaceAll])     + ''', '+
                '    ''' + StringReplace(GSspedesc1,'''','`',[rfReplaceAll])  + ''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')                           , '+    //APPDATE
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')                           , '+    //WRITETIME
                '    ''' + GSempno +'''                                              '+
                '   ) ';

      with TDS_dml do
        begin
          ServiceName := 'PZK1030A_dml';
          Close;
          Sql.Clear;
          Sql.Add(SQLStr);   //edit1.text := sql.text;

          if not TDS_dml.Execute then
            begin
              MessageDlg('임시저장에 실패했습니다.',mtError, [mbOk],0);
              System.Exit;
            end;
        end;
    end
  else if JobMode = 'U' then
  begin
      SQLStr := 'UPDATE PIDCHAPP ' +
                '   SET PAYCL    = ''' + ED_emp.paycl + ''', ' +
                '       PAYRA    = ''' + ED_emp.payra + ''', ' +
                '       ORGNUM   = ''' + ED_emp.orgnum + ''', ' +
                '       DEPTCODE = ''' + ED_emp.deptcode + ''', ' +
                '       STATUS   = ''1'', ' +
                '       GUBUN    = ''' + gubun  + ''', ' +
                '       LONGDESC = ''' + StringReplace(M_long.Text,'''','`',[rfReplaceAll]) + ''', ' +
                '       APPDEPT1 = ''' + ED_dept1.deptcode + ''', ' +
                '       MOVEYYMM1= ''' + MEcertprdate1.Text + ''', ' +
                '       APPSAYU1 = ''' + StringReplace(GSsayu1,'''','`',[rfReplaceAll]) + ''', ' +
                '       SPEDESC1 = ''' + StringReplace(GSspedesc1,'''','`',[rfReplaceAll]) + ''', ' +
                '       WRITETIME= TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), ' +
                '       WRITEMAN = ''' + GSEmpno + ''' ' +
                ' WHERE EMPNO    = ''' + ED_emp.empno + ''' ' +
                '   AND Appdate like '''+gs_Year+'''||''%'' ' ; //dsa2000  2008.01. Add
//                '   AND ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ';

      with TDS_dml do
      begin
          ServiceName := 'PZK1030A_dml';
          Close;
          Sql.Clear;
          Sql.Add(SQLStr);

          if not TDS_dml.Execute then
          begin
              MessageDlg('임시저장에 실패했습니다.',mtError, [mbOk],0);
              System.Exit;
          end;
      end;
  end;

  SQLStr := 'UPDATE PIDCHAPP ' +
            '   SET APPDEPT2 = ''' + ED_dept2.deptcode + ''', ' +
            '       MOVEYYMM2= ''' + MEcertprdate2.Text + ''', ' +
            '       APPSAYU2 = ''' + StringReplace(GSsayu2,'''','`',[rfReplaceAll]) + ''', ' +
            '       SPEDESC2 = ''' + StringReplace(GSspedesc2,'''','`',[rfReplaceAll]) + ''' ' +
            ' WHERE EMPNO    = ''' + ED_emp.empno + ''' ' +
            '   AND Appdate like '''+gs_Year+'''||''%'' ' ; //dsa2000  2008.01. Add
//            '   AND ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ';

  with TDS_dml do
    begin
      ServiceName := 'PZK1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('임시저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  SQLStr := 'UPDATE PIDCHAPP ' +
            '   SET APPDEPT3 = ''' + ED_dept3.deptcode + ''', ' +
            '       MOVEYYMM3= ''' + MEcertprdate3.Text + ''', ' +
            '       APPSAYU3 = ''' + StringReplace(GSsayu3,'''','`',[rfReplaceAll]) + ''', ' +
            '       SPEDESC3 = ''' + StringReplace(GSspedesc3,'''','`',[rfReplaceAll]) + ''' ' +
            ' WHERE EMPNO    = ''' + ED_emp.empno + ''' ' +
            '   AND Appdate like '''+gs_Year+'''||''%'' ' ; //dsa2000  2008.01. Add
//            '   AND ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ';

  with TDS_dml do
    begin
      ServiceName := 'PZK1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('임시저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  MessageDlg('임시저장 되었습니다.',mtInformation, [mbOk],0);
  Retrieve;
end;

procedure TMainForm.ED_empReadEnded(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.ED_empKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ED_emp.PL_get_singledata ;
end;

procedure TMainForm.Bt_desc1Click(Sender: TObject);
begin
  try
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    if TOnFocusButton(Sender).Tag = 1 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu1;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc1;
        Fm_SubForm11.GSflag          := 1;
      end
    else if TOnFocusButton(Sender).Tag = 2 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu2;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc2;
        Fm_SubForm11.GSflag          := 2;
      end
    else if TOnFocusButton(Sender).Tag = 3 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu3;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc3;
        Fm_SubForm11.GSflag          := 3;
      end;

    Fm_SubForm11.gbEnabled := Bt_save.Enabled;
    Fm_SubForm11.Showmodal;

  finally
    Fm_SubForm11.Free;
  end;

end;

procedure TMainForm.Bt_appClick(Sender: TObject);
begin
  if Trim(M_long.Text) = '' then
    begin
      Messagedlg('장기근무 내역을 입력하고 "임시저장"을 하신후 "신청"해 주세요.',mtError,[mbOK],0);
      System.Exit;
    end;

  if Trim(L_status.ValueCaption) = '' then System.Exit;

  if MessageDlg('"Yes"를 누르시면 신청이 완료됩니다.(수정/취소 불가)', mtConfirmation, [mbYes,mbNo],0)<> mrYes then
    System.Exit ;

  SQLStr := 'UPDATE PIDCHAPP        ' +
          '   SET STATUS    = ''2'', ' +
          '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), ' +
          '       WRITEMAN  = ''' + GSEmpno + '''                  ' +
          ' WHERE EMPNO     = ''' + ED_emp.empno + '''             ' +
          '   AND Appdate like '''+gs_Year+'''||''%''              ' ; //dsa2000  2008.01. Add
//          '   AND ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ';

  with TDS_dml do
    begin
      ServiceName := 'PZK1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('신청작업에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  MessageDlg('신청되었습니다.', mtInformation, [mbOk],0);
  Retrieve;
end;

procedure TMainForm.ED_dept1CloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin {
  MessageDlg('○ 이동규모 '+#13+#13+
             '-동일부서 전출가능 : 팀급 조직 현원의 최대 15%까지 가능'     +#13+#13+
             '-동일부서 전입가능 : 전입부서 소속 실(지사) T/O의 105% 범위 '+#13+#13+
             '  ※세부문의 : HR팀(담당자 : 박준민, 이석희)'+#13+#13+
             '     반드시 힌트메일로 문의 바랍니다.', mtInformation, [mbOk],0); }
end;

procedure TMainForm.Bt_printClick(Sender: TObject);
begin
  PrintForm.QuickRep1.Preview;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;
        MEcertprdate1.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;
        MEcertprdate2.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;
        MEcertprdate3.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure TMainForm.OnFocusButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFM_Pihanno, FM_Pihanno);
  FM_Pihanno.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  if Trim(Hinsa_Param(cmdLine,1)) = '' then
  begin
    MessageDlg('종합인사 메뉴 프로그램을 실행하세요.', mtError , [mbOk],0);
    Bt_closeClick(Self);
    Exit;
  end;

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  //dsa2000  2008.01. Add..............................
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  ED_dept1.Orgnum   := FM_Tmax.GetData('orgnum','','');
  ED_dept2.Orgnum   := FM_Tmax.GetData('orgnum','','');
  ED_dept3.Orgnum   := FM_Tmax.GetData('orgnum','','');
  /////////////////////////////////////////////////////

  SB_help.Panels[1].Text := '';
  GSEmpno          := HInsa_Param(cmdline,1);
  GSKorname        := HInsa_Param(cmdline,2);
  GSGrade          := HInsa_Param(cmdline,4);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add('select distinct substr(appdate,1,4) appdate,');
      Sql.Add('       to_char(sysdate,''YYYY'')    sYear  ,');
      Sql.Add('       ''field3'', ''field4'', ''field5''   ');
      Sql.Add('  from pidchapp                             ');
      Sql.Add(' order by 1  desc                           ');

      ClearFieldInfo;
      AddField('field1'    , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

  {    TDS1.First;
      CB_Year.Clear;
      while not TDS1.Eof do
      begin
           CB_Year.Items.Add (FieldByName('field1').AsString);
           Next;
      end; }
      CB_Year.Text := FieldByName('field2').AsString;
      gs_Year      := FieldByName('field2').AsString;
  end;

  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add('select value3 field1, value4 field2,        ');
      Sql.Add('       ''field3'', ''field4'', ''field5''   ');
      Sql.Add('  from pimvari                              ');
      Sql.Add(' where gubun = ''00'' and sgubun = ''0001'' ');

      ClearFieldInfo;
      AddField('field1'    , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

  {    TDS1.First;
      CB_Year.Clear;
      while not TDS1.Eof do
      begin
           CB_Year.Items.Add (FieldByName('field1').AsString);
           Next;
      end; }
      payrachdate     := FieldByName('field1').AsString;
  end;

  ED_emp.Text      := GSEmpno;
  ED_emp.PL_get_singledata;
  L_paycl.ValueCaption := ED_emp.payclname;
  L_payra.ValueCaption := ED_emp.payraname;
  L_dept.ValueCaption  := Ed_emp.deptname;

  if (GSGrade[2] in (['A','B'])) then
    begin
      ED_emp.ButtonWidth := 24;
      ED_emp.Enabled     := True;
    end
  else
    begin
      ED_emp.ButtonWidth := 0;
      ED_emp.Enabled     := False;
    end;
end;

end.
