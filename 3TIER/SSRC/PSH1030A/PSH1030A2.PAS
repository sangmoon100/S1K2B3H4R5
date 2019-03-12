unit PSH1030A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnEditBaseCtrl, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  OnFocusButton, OnShapeLabel, OnEditNumCtl, OnEditMdate, OnScheme,
  OnRadioBtn, OnCheckBox, Mask, pebtnedit, PeJeonBtnDateEdit,
  Tmax_DataSetText, Func, ComCtrls, Comobj, OnEditMemo;

type
  TFM_Hospital = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel5: TPanel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    TDS_Detail: TTMaxDataSet;
    TDS_Fami2: TTMaxDataSet;
    TDS_Com: TTMaxDataSet;
    Panel8: TPanel;
    E_Seq: TOnEdit;
    L_AppEmpno: TOnShapeLabel;
    L_Appdate: TOnComboEdit;
    Panel10: TPanel;
    HelpMemo1: TOnMemo;
    DB_Hoslist: TOnGrDbGrid;
    E_appamtyn: TOnEdit;
    Panel52: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    E_cashcnt: TOnNumberEdit;
    E_cardcnt: TOnNumberEdit;
    E_cardamt: TOnNumberEdit;
    Panel9: TPanel;
    Check_AppamtY: TRadioButton;
    Check_AppamtN: TRadioButton;
    Panel11: TPanel;
    Panel12: TPanel;
    BT_Exit: TOnFocusButton;
    BT_ExcelSave: TOnFocusButton;
    BB_FamiSave: TOnFocusButton;
    BB_Help: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_Append: TOnFocusButton;
    Panel13: TPanel;
    SB_Help: TStatusBar;
    Panel14: TPanel;
    E_cashamt: TOnNumberEdit;
    Panel7: TPanel;
    Panel2: TPanel;
    E_medcomm: TOnEdit;
    E_medidate: TOnMaskEdit;
    Panel1: TPanel;
    Panel53: TPanel;
    E_corpname: TOnEdit;
    BB_Hossearch: TOnFocusButton;
    E_corpno: TOnEdit;
    Panel16: TPanel;
    Panel6: TPanel;
    E_Fami: TOnComboEdit;
    Shape1: TShape;
    Label10: TLabel;
    E_Gubun: TOnComboEdit;
    Panel15: TPanel;
    GR_AMT: TGroupBox;
    E_contot: TOnNumberEdit;
    E_totamt: TOnNumberEdit;
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_FamiSaveClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Set_Field2(arg1, arg2 : Boolean);
    procedure Read_HosRecords(Appdate, EmpNO: String);
    procedure Read_HosMonthSum(Appdate, EmpNO: String);
    procedure Read_FamRecords(WorkYY, Empno, Faminame: String);
    procedure MaxSeq;
    function  Check_Input : Boolean;
    Function  Check_Jumin(No:String) : Boolean;
    procedure E_FamiChange(Sender: TObject);
    procedure L_AppdateChange(Sender: TObject);
    procedure BB_HossearchClick(Sender: TObject);
    procedure E_medidateChange(Sender: TObject);
    procedure E_medcommChange(Sender: TObject);
    procedure E_cashamtChange(Sender: TObject);
    procedure E_corpnoChange(Sender: TObject);
    procedure E_corpnameChange(Sender: TObject);
    procedure BT_ExcelSaveClick(Sender: TObject);
    procedure E_GubunChange(Sender: TObject);
    procedure E_FamiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    FL_AppYY, FL_Appdate, FL_AppEmp  : String;
    FL_Famirel, FL_Faminame, FL_Famijumin : String;
    SQLStr   : String;
    ErrFocus : Integer;
    JobMode  : Char;
    FL_CONYN : String;
    FL_Appamt: Double;
    CHGMode  : Char;
        
    procedure PL_Com_Contructor;

  public
    { Public declarations }
    procedure Initialize;
    procedure setEditMask;
  end;

var
  FM_Hospital: TFM_Hospital;

implementation

uses PSH1030A1, PFamily,PHosSearch;

{$R *.DFM}

procedure TFM_Hospital.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FL_AppYY   := Trim(FM_Mainform.FG_AppYY);
  FL_Appdate := Trim(FM_Mainform.FG_Appdate);
  FL_AppEmp  := Copy(FM_Mainform.PE_empno.Text,1,4);
  L_Appdate.Text := Copy(FM_Mainform.FG_Appdate,1,4)+'-'+Copy(FM_Mainform.FG_Appdate,5,2);

  L_Appdate.Items.Clear;
  for i := 0 downto -15 do
  begin
    L_Appdate.Items.Add(Copy(AddMonthStr(L_Appdate.Text+'-01',i),1,7));
  end;
end;

procedure TFM_Hospital.FormShow(Sender: TObject);

begin
  initialize;

  //복리후생 관리자는 변경후 사원의 데이터 수정/등록 가능토록,,,
  if FM_Mainform.vAdmin = True then
  begin
    L_AppEmpno.Visible := True;
    L_Appdate.Enabled := True;
    E_Seq.Visible := True;
  end
  else
  begin
    L_AppEmpno.Visible := False;
    //L_Appdate.Enabled := False;
    E_Seq.Visible := False;
  end;

  //2013.01.25 hjku 송석제M 요청.. 등록년도 제어
  setEditMask;

  L_AppEmpno.ValueCaption := FM_Mainform.PE_empno.Text;
end;

procedure TFM_Hospital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Hospital.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  Set_Field(True, True);
  L_Appdate.Text    := Copy(FM_Mainform.FG_Appdate,1,4)+'-'+Copy(FM_Mainform.FG_Appdate,5,2);
  L_Appdate.Enabled := False;
  BB_Modify.Enabled := False;
  BB_Delete.Enabled := False;
  BB_Save.Enabled   := True;
  MaxSeq;
  E_Gubun.ItemIndex := 0;
end;

procedure TFM_Hospital.BB_ModifyClick(Sender: TObject);
begin
  JobMode := 'U';
  Set_Field(True, False);
  BB_Append.Enabled := False;
  BB_Delete.Enabled := False;
  BB_Save.Enabled   := True;
end;

procedure TFM_Hospital.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);
  Read_HosRecords(FL_Appdate, FL_AppEmp);
  SB_Help.Panels[1].Text := '취소 되었습니다.';
  BB_Append.Enabled := True;
  BB_Modify.Enabled := True;
  BB_Delete.Enabled := True;
  BB_Save.Enabled   := False;
  L_Appdate.Enabled := True;
end;

procedure TFM_Hospital.BB_SaveClick(Sender: TObject);
var
  vMedidate, vMeGubun : String;
  tmp_JobMode : Char;
  V : Variant;
begin
  FL_Famirel   := '';
  FL_Faminame  := '';
  FL_Famijumin := '';

  tmp_JobMode := JobMode;
  V := VarArrayCreate([0,1], varInteger);

  vMedidate := Copy(E_medidate.Text,1,4)+Copy(E_medidate.Text,6,2)+Copy(E_medidate.Text,9,2);
  vMedidate := Trim(vMedidate);
  FL_AppEmp := Trim(FL_AppEmp);

  //2012.05.29 kth 입사일 체크  입사전 입력 안되게 처리 시작
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(' SELECT EMPDATE, ''F3'', ''F3'', ''F4'', ''F5'' ');
    Sql.Add(' FROM PIMPMAS                                   ');
    Sql.Add(' WHERE EMPNO  = '''+ FL_AppEmp +'''             ');

    ClearFieldInfo;
    AddField('EMPDATE', ftString, 100);
    AddField('F2'     , ftString, 100);
    AddField('F3'     , ftString, 100);
    AddField('F4'     , ftString, 100);
    AddField('F5'     , ftString, 100);
    Open;

    if  TDS_Com.FieldByName('EMPDATE').AsString > vMedidate  then
    begin
      //2014.01.20  BM 중도 입사자는 의료비 지원 기간을 BM 합병에 따라 2013년 1월 1일부터 가능해야 함 (이명노M)
      if (((FL_AppEmp >= '2601') and (FL_AppEmp <= '2720')) and (vMedidate >='20130101')) or
          ((FL_AppEmp =  '2721') and (vMedidate >= '20130314')) or
          ((FL_AppEmp =  '2722') and (vMedidate >= '20130101')) or
          ((FL_AppEmp =  'J078') and (vMedidate >= '20130101')) then
      else
      begin
        MessageDlg(' 입사전 의료비는 등록 할 수 없습니다. 확인 후 입력 해주세요. ',mtInformation, [mbOk],0);
        System.Exit;
      end;
    end;
  end;
  //2012.05.29 kth 입사일 체크  입사전 입력 안되게 처리 끝

  //휴직기간 의료비 미지원 : dsa2000  2013.01.24  오종석M 요청사항.
  //예외 사항1 : 공상(71)시 본인 및 가족 지원.
  //예외 사항2 : 병상(72)시 본인만 지원.
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('Select Korname, Excode,                                                               ');
    Sql.Add('       To_Char(To_Date(A.Exfrdate,''YYYYMMDD''),''YYYY-MM-DD'') Exfrdate,             ');
    Sql.Add('       To_Char(To_Date(A.Extodate,''YYYYMMDD''),''YYYY-MM-DD'') Extodate,             ');
    Sql.Add('      (Select Codename From Pyccode Where Codeid=''I310'' And Codeno=A.Excode) Exname ');
    Sql.Add('  From Pihexdu A                                                                      ');
    Sql.Add(' Where EMPNO  = '''+ FL_AppEmp +'''                                                   ');
    Sql.Add('   And '''+ vMedidate +''' between Exfrdate and Extodate                              ');
    Sql.Add('   And  not ((excode = ''71'')                                                        ');
    Sql.Add('         Or  (excode = ''72'' and Korname = '''+ Trim(E_Fami.Text) +'''))             ');
    Open;
    ClearFieldInfo;
    AddField('Korname' , ftString, 100);
    AddField('Excode'  , ftString, 100);
    AddField('Exfrdate', ftString, 100);
    AddField('Extodate', ftString, 100);
    AddField('Exname'  , ftString, 100);
    Open;

    if  TDS_Com.Recordcount > 0 then
    begin
      MessageDlg(' 휴직기간중 의료비는 등록할 수 없습니다. 확인 후 입력 해주세요. ',mtInformation, [mbOk],0);
      System.Exit;
    end;
  end;

  if JobMode = 'I' then
  begin
    MaxSeq;
    if Trim(E_Seq.Text) = '' then MaxSeq;
  End;

  if JobMode <> 'U' then
  begin
    with TDS_Com do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add('SELECT ''field1'',''field2'', ''field3'',''field4'', ''field5'' FROM PSHAPHOS ');
      Sql.Add(' WHERE MEDIDATE        = '''+ vMedidate           +''' ');
      Sql.Add('   AND EMPNO           = '''+ FL_AppEmp           +''' ');
      Sql.Add('   AND FAMINAME        = '''+ Trim(E_Fami.Text)   +''' ');
      Sql.Add('   AND CORPNO          = '''+ Trim(E_corpno.Text) +''' ');
      Sql.Add('   AND CASHAMT+CARDAMT = '''+ Trim(FloatToStr(E_cashamt.Value + E_cardamt.Value )) +''' ');
      Open;
      ClearFieldInfo;
      AddField('Korname' , ftString, 100);
      AddField('Excode'  , ftString, 100);
      AddField('Exfrdate', ftString, 100);
      AddField('Extodate', ftString, 100);
      AddField('Exname'  , ftString, 100);
      Open;

      if  TDS_Com.Recordcount > 0 then
      begin
        MessageDlg(' 기존에 등록 된 데이터가 있습니다. 확인 후 입력 해주세요 ',mtInformation, [mbOk],0);
        System.Exit;
      end;
    end;
  end;

  if not Check_Input then Exit;

  Read_FamRecords(FL_AppYY, FL_AppEmp, E_Fami.Text);

  if not TDS_Fami2.Active then TDS_Fami2.Active := True;

  with TDS_Fami2 do
  begin
    FL_Famirel   := FieldByName('FAMIREL').AsString;
    FL_Faminame  := FieldByName('FAMINAME').AsString;
    FL_Famijumin := FieldByName('JUMINID').AsString;
    Close;
  end;    

  if (FL_Famirel = '') or (FL_Faminame = '') or (FL_Famijumin = '') then
  begin
    MessageDlg('신청가족 선택이 잘못 되었습니다. 마우스로 선택하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  if not Check_Jumin( Copy(FL_Famijumin,1,6) + Copy(FL_Famijumin,8,7)  ) then
  begin
       ShowMessage( E_Fami.Text +': 잘못된 주민등록번호입니다. 가족 등록에서 수정후 저장 바랍니다.' );
     //ChkJuminFlag  := False;
       Exit;
  end;  

  // 의료비 등록시 날짜 체크  kth
  if ((Copy(FL_Appdate,5,2) = '01') or (Copy(FL_Appdate,5,2) = '02'))  then    // or (Copy(FL_Appdate,5,2) = '02') 1월,2월일 경우 작년 1월 부터 올해 12월까지 의료일자 기즌으로 등록 할 수 있게 함.
  begin
       if Copy(vMedidate,1,6) = inttostr(strtoint(Copy(FL_Appdate,1,4))-2)+'12'  then
       begin
           //
       end
       else
       if Copy(vMedidate,1,4) <> inttostr(strtoint(Copy(FL_Appdate,1,4))-1)  then
       begin
            MessageDlg(inttostr(strtoint(Copy(FL_Appdate,1,4))-1) + '년 의료비만 등록 할 수 있습니다.'+#13#10+
                        Copy(FL_Appdate,1,4)+'년 3월 부터 등록 해주시기 바랍니다. ',mtError, [mbOk],0);
            System.Exit;
       end;
  end
  else
  begin
       if Copy(vMedidate,1,6) = inttostr(strtoint(Copy(FL_Appdate,1,4)))+'01'  then
       begin
            //
       end
       else
       if (Copy(vMedidate,1,4) <> Copy(FL_Appdate,1,4)) then
       begin
            MessageDlg(Copy(FL_Appdate,1,4) +'년 의료비만 등록 할 수 있습니다. ' ,mtError, [mbOk],0);
            System.Exit;
       end;
  end;
  // 의료비 등록시 날짜 체크  마지막  kth        

  If (E_Gubun.Text = '중증') Then vMeGubun := '1'
  Else                            vMeGubun := '0';

  if JobMode = 'I' then
  begin
      SQLStr := 'INSERT INTO PSHAPHOS                                         '+
                '      (APPDATE, MEGUBUN, EMPNO, KORNAME, PAYCL, SEQ,         '+
                '       JOBPLACE, FAMINAME, FAMIJUMIN, FAMIREL, MEDIDATE,     '+
                '       CORPNO, CORPNAME, CASHCNT, CASHAMT, CARDCNT, CARDAMT, '+
                '       APPAMT, MEDCOMM, WRITETIME, WRITEMAN  )               '+
                '  VALUES                                    '+
                '   ('''+ FL_Appdate                   +''', '+
                '    '''+ vMeGubun                     +''', '+
                '    '''+ FL_AppEmp                    +''', '+
                '    '''+ FM_Mainform.PE_empno.Korname +''', '+
                '    '''+ FM_Mainform.FG_Paycl         +''', '+
                '    '''+ E_Seq.Text                   +''', '+
                '    '''+ FM_Mainform.FG_Place         +''', '+
                '    '''+ E_Fami.Text                  +''', '+
                '    '''+ FL_Famijumin                 +''', '+
                '    '''+ FL_Famirel                   +''', '+
                '    '''+ vMedidate                    +''', '+
                '    '''+ E_corpno.Text                +''', '+
                '    '''+ E_corpname.Text              +''', '+
                '    '''+ FloatToStr(E_cashcnt.Value)  +''', '+
                '    '''+ FloatToStr(E_cashamt.Value)  +''', '+
                '    '''+ FloatToStr(E_cardcnt.Value)  +''', '+
                '    '''+ FloatToStr(E_cardamt.Value)  +''', '+
                '    '''+ FloatToStr(FL_Appamt)        +''', '+
                '    '''+ E_MedComm.Text               +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),    '+
                '    '''+ FM_Mainform.FG_Empno         +''' )';
  end
  else if (JobMode = 'U') and (FM_Mainform.vAdmin = True) then  //관리자는 업데이트 가능.
  begin
       SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
                 '       MEGUBUN   = '''+ vMeGubun                    +''', '+
                 '       FAMINAME  = '''+ FL_Faminame                 +''', '+
                 '       FAMIJUMIN = '''+ FL_Famijumin                +''', '+
                 '       FAMIREL   = '''+ FL_Famirel                  +''', '+
                 '       MEDIDATE  = '''+ vMedidate                   +''', '+
                 '       CORPNO    = '''+ E_corpno.Text               +''', '+
                 '       CORPNAME  = '''+ E_corpname.Text             +''', '+
                 '       CASHCNT   = '''+ FloatToStr(E_cashcnt.Value) +''', '+
                 '       CASHAMT   = '''+ FloatToStr(E_cashamt.Value) +''', '+
                 '       CARDCNT   = '''+ FloatToStr(E_cardcnt.Value) +''', '+
                 '       CARDAMT   = '''+ FloatToStr(E_cardamt.Value) +''', '+
                 '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
                 '       MEDCOMM   = '''+ E_MedComm.Text              +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
                 '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
                 ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
                 '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
                 '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
  end
  else if (JobMode = 'U') and (FL_CONYN = '') then  //결재전에만 Update 가능토록 FL_CONYN 추가 .
  begin
       SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
                 '       MEGUBUN   = '''+ vMeGubun                    +''', '+
                 '       FAMINAME  = '''+ FL_Faminame                 +''', '+
                 '       FAMIJUMIN = '''+ FL_Famijumin                +''', '+
                 '       FAMIREL   = '''+ FL_Famirel                  +''', '+
                 '       MEDIDATE  = '''+ vMedidate                   +''', '+
                 '       CORPNO    = '''+ E_corpno.Text               +''', '+
                 '       CORPNAME  = '''+ E_corpname.Text             +''', '+
                 '       CASHCNT   = '''+ FloatToStr(E_cashcnt.Value) +''', '+
                 '       CASHAMT   = '''+ FloatToStr(E_cashamt.Value) +''', '+
                 '       CARDCNT   = '''+ FloatToStr(E_cardcnt.Value) +''', '+
                 '       CARDAMT   = '''+ FloatToStr(E_cardamt.Value) +''', '+
                 '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
                 '       MEDCOMM   = '''+ E_MedComm.Text              +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
                 '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
                 ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
                 '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
                 '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
  end
  else if (JobMode = 'C') then  //연말정산시 소득공제 여부 수정 가능토록 추가...2006.12.
  begin
       SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
                 '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
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
  else System.Exit;

  with TDS_Com do
  begin
    ServiceName := 'PSC1040C_dml';
    Close;
    Sql.Clear;
    Sql.Add(SQLStr);
    if not TDS_Com.Execute then
    begin
      MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
      System.Exit;
    end;
  end;

  ///최종 저장하는 시점의 근무지로 해당월의 모든 데이터 업데이트
  SQLStr := 'UPDATE PSHAPHOS SET                               '+
            '       JOBPLACE = '''+ FM_Mainform.FG_Place +'''  '+
            ' WHERE APPDATE  = '''+ FL_Appdate           +'''  '+
            '   AND EMPNO    = '''+ FL_AppEmp            +'''  ';
  with TDS_Com do
  begin
    ServiceName := 'PSC1040C_dml';
    Close;
    Sql.Clear;
    Sql.Add(SQLStr);

    if not TDS_Com.Execute then
    begin
      MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
      System.Exit;
    end;
  end;
  ////////////////////////////////////////////////////////////////

  Read_HosRecords(FL_Appdate, FL_AppEmp);

  Read_HosMonthSum(FL_Appdate, FL_AppEmp);


  if (tmp_JobMode = 'I') then
  begin
    TDS_Detail.Last;
    JobMode := 'I';
    Set_Field2(True, True);
  end
  else if (tmp_JobMode = 'U') then
  begin
    JobMode := 'F';
    Set_Field(False, False);
  end;
  SB_Help.Panels[1].Text := '저장 되었습니다.';
  BB_Append.Enabled := True;
  BB_Modify.Enabled := True;
  BB_Delete.Enabled := True;
//  BB_Save.Enabled   := False;
end;

procedure TFM_Hospital.BB_DeleteClick(Sender: TObject);
var
  V : Variant;
  del_seqno : String;
begin
  if E_Fami.Text = '' then
  begin
    MessageDlg('삭제할 데이터를 선택후 작업하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;
  if JobMode ='I' then
  begin
    MessageDlg('지금은 입력 모드 입니다. 취소 버튼을 누른후에 삭제 해주세요.',mtError, [mbOk],0);
    System.Exit;
  end;


  if MessageDlg('신청인원사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  del_seqno := E_Seq.Text;

  if FL_CONYN = '' then      //결재전에만 삭제 가능토록.
  begin
    SQLStr  := 'DELETE PSHAPHOS  '+
               ' WHERE APPDATE = '''+ FL_Appdate +''' '+
               '   AND EMPNO   = '''+ FL_AppEmp  +''' '+
               '   AND SEQ     = '''+ del_seqno  +''' ';

    with TDS_Com do
      begin
        ServiceName := 'PSC1040C_dml';
        Close;
        Sql.Clear;
        Sql.Add(SQLStr);

        if not TDS_Com.Execute then
          begin
            MessageDlg('신청인원사항 삭제에 실패했습니다.',mtError, [mbOk],0);
            System.Exit;
          end;
      end;

    Read_HosRecords(FL_Appdate, FL_AppEmp);

    JobMode := 'F';
    Set_Field(False, True);

  end
  else
  begin
    MessageDlg('결재완료후에는 삭제가 불가능합니다',mtError, [mbOk],0);
  end;

  SB_Help.Panels[1].Text := '삭제 되었습니다.';
end;

procedure TFM_Hospital.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_Hospital.BB_FamiSaveClick(Sender: TObject);
begin
  FM_Family := TFM_Family.Create(Self);
  FM_Family.ShowModal;

  E_Fami.Clear;
  E_Gubun.ItemIndex := 0;
end;

procedure TFM_Hospital.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  If (JobMode = 'I') Then Exit;
  with TDS_Detail do
  begin
    JobMode         := 'F';
    E_Gubun.Text    := FieldByName('MEGUBUN').AsString;
    E_Seq.Text      := FieldByName('SEQ').AsString;
    E_Fami.Text     := FieldByName('FAMINAME').AsString;
    E_medidate.Text := FieldByName('MEDIDATE').AsString;
    E_medcomm.Text  := FieldByName('MEDCOMM').AsString;
    E_corpname.Text := FieldByName('CORPNAME').AsString;
    E_corpno.Text   := FieldByName('CORPNO').AsString;
    E_cashcnt.Value := FieldByName('CASHCNT').AsFloat;
    E_cashamt.Value := FieldByName('CASHAMT').AsFloat;
    E_cardcnt.Value := FieldByName('CARDCNT').AsFloat;
    E_cardamt.Value := FieldByName('CARDAMT').AsFloat;
    FL_CONYN        := FieldByName('CONYN').AsString;
  end;
end;

procedure TFM_Hospital.setEditMask;
var
   EditMaskDate : String;
begin
  EditMaskDate := Copy(L_Appdate.text,6,2);

  if (Copy(L_Appdate.text,6,2)='01') or (Copy(L_Appdate.text,6,2)='02') then
  begin
    EditMaskDate := inttostr(strtoint(Copy(L_Appdate.text,1,4))-1) ;
  end
  else
    EditMaskDate := Copy(L_Appdate.text,1,4);

  E_medidate.EditMask := '\' + EditMaskDate[1] + '\' + EditMaskDate[2] + '\' + EditMaskDate[3] + '\' + EditMaskDate[4] + '-##-##';
end;

procedure TFM_Hospital.initialize;
var
  i : Integer;
begin
  Read_FamRecords(FL_AppYY, FL_AppEmp, '%');

  with TDS_Fami2 do
  begin
    E_Fami.Items.Clear;
    E_Fami.DropDownRows := RecordCount;
    First;
    for i := 1 to RecordCount do
    begin
      E_Fami.Items.Add(FieldByName('FAMINAME').AsString);
      next;
    end;
  end;

  Read_HosRecords(FL_Appdate, FL_AppEmp);
end;

procedure TFM_Hospital.E_FamiChange(Sender: TObject);
var age : Integer;
begin
  age := 0;
  if E_Fami.Enabled then
  begin
    Read_FamRecords(FL_AppYY, FL_AppEmp, E_Fami.Text);
    FL_Famijumin := TDS_Fami2.FieldByName('JUMINID').AsString;
    TDS_Fami2.Close;

    if (Copy(FL_Famijumin,8,1) = '1') or (Copy(FL_Famijumin,8,1) = '2') then
      age := StrToInt(FL_AppYY) - StrToInt('19'+Copy(FL_Famijumin,1,2))
    else if (Copy(FL_Famijumin,8,1) = '3') or (Copy(FL_Famijumin,8,1) = '4') then
      age := StrToInt(FL_AppYY) - StrToInt('20'+Copy(FL_Famijumin,1,2))
    else if (Copy(FL_Famijumin,8,1) = '5') or (Copy(FL_Famijumin,8,1) = '6') then
      age := StrToInt(FL_AppYY) - StrToInt('19'+Copy(FL_Famijumin,1,2));
  end;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_GubunChange(Sender: TObject);
var
  i : Integer;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('SELECT FAMINAME , ');
    Sql.Add('     ''F2'', ''F3'',''F4'', ''F5''  ');
    SQL.Add('  FROM PKMYSFAM                     ');
    SQL.Add(' WHERE WORKYY  = '''+FL_AppYY  +''' ');
    SQL.Add('   AND EMPNO   = '''+FL_AppEmp +''' ');
    If (E_Gubun.Itemindex = 0) Then
      SQL.Add('   AND FAMIREL IN (''00'',''01'',''02'',''03'',''04'',''05'',''06'') ')
    Else
      SQL.Add('   AND FAMIREL IN (''00'') ');
    SQL.Add(' ORDER BY FAMIREL' );
    ClearFieldInfo;
    AddField('FAMINAME', ftString, 100);
    AddField('F2'     , ftString, 100);
    AddField('F3'     , ftString, 100);
    AddField('F4'     , ftString, 100);
    AddField('F5'     , ftString, 100);
    Open;

    E_Fami.Clear;
    E_Fami.Items.Clear;
    E_Fami.DropDownRows := RecordCount;
    First;
    for i := 1 to RecordCount do
    begin
      E_Fami.Items.Add(FieldByName('FAMINAME').AsString);
      next;
    end;
  end;
end;

procedure TFM_Hospital.L_AppdateChange(Sender: TObject);
begin
  FL_Appdate := Copy(L_Appdate.Text,1,4)+Copy(L_Appdate.Text,6,2);
  Read_HosRecords(FL_Appdate, FL_AppEmp);
  Read_HosMonthSum(FL_Appdate, FL_AppEmp);
  setEditMask;
end;

procedure TFM_Hospital.BB_HossearchClick(Sender: TObject);
begin
  if E_corpno.Enabled then
  begin
    FM_HosSearch := TFM_HosSearch.Create(Self);
    FM_HosSearch.ShowModal;
    E_corpno.Text   :=  FM_HosSearch.CORPNO;
    E_corpname.Text :=  FM_HosSearch.CORPNAME;
    E_medidate.SetFocus;
  end else
  begin
    MessageDlg('입력이나 수정 모드를 선택 해주세요.',mtError, [mbOk],0);
    System.Exit;
  end;
end;

procedure TFM_Hospital.E_medidateChange(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_medcommChange(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_cashamtChange(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_corpnoChange(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_corpnameChange(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.BT_ExcelSaveClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
    sAppYear,sAppMonth : string;
begin
  sAppYear  := Copy(FL_Appdate,1,4) ;
  sAppMonth := Copy(FL_Appdate,5,2);

  if(sAppMonth = '01') or (sAppMonth='02' ) then sAppYear := inttostr(strtoint(sAppYear) -1);

  with TDS_Com do
  begin
    ServiceName := 'PSH1030A_sel5';
    Close;
    Sql.Clear;
    Sql.Add('SELECT                                                                                     ');
    Sql.Add('  APPDATE, CORPNO, CORPNAME, FAMINAME,MEDIDATE,                                            ');
    Sql.Add('  SUM(NVL(CASHAMT,0) + NVL(CARDAMT,0)) APPAMT,                                             ');
    Sql.Add('  SUM(DECODE(NVL(CONYN,''N''),''Y'',(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0)) CONAMT,          ');
    Sql.Add('  SUM(NVL(EXCEPTAMT,0)) EXAMT                                                              ');
    Sql.Add('FROM PSHAPHOS                                                                              ');
    Sql.Add('WHERE EMPNO =''' + FL_AppEmp + '''                                                         ');
    Sql.Add('  AND APPDATE BETWEEN ''' + sAppYear   + '''||''03''                                       ');
    Sql.Add('                  AND ''' + FL_Appdate + '''                                               ');
    Sql.Add('GROUP BY APPDATE, CORPNO, CORPNAME, FAMINAME,MEDIDATE                                      ');
    Sql.Add('ORDER BY APPDATE,CORPNO,FAMINAME                                                           ');

    ClearFieldInfo;
    AddField('APPDATE' , ftString, 6);
    AddField('CORPNO'  , ftString, 13);
    AddField('CORPNAME', ftString, 30);
    AddField('FAMINAME', ftString, 12);
    AddField('MEDIDATE', ftString, 8);
    AddField('APPAMT'  , ftInteger, 10);
    AddField('CONAMT'  , ftInteger, 10);
    AddField('EXAMT'   , ftInteger, 10);
    Open;

    TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,###';
    TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,###';
    TFloatField(FieldByName('EXAMT')).DisplayFormat  := '#,###';

    if RecordCount < 1 then
    begin
         showmessage('엑셀 변환할 자료가 없습니다.');
         exit;
    end
    else if RecordCount > 5000 then
    begin
         showmessage('의료비 내역 추출은 5000건 까지 가능합니다. 개발자에게 문의 하세요.');
         exit;
    end;

    SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 8], VarVariant);
    try
       XL := CreateOLEObject('Excel.Application');  //Comobj
    except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_Help.SimpleText := '';
       Exit;
    end;

    SB_Help.SimpleText := '자료를 변환하고 있습니다.';
    XL.WorkBooks.Add;         //새로운 페이지 생성
    XL.Visible := false;
    XL.WorkSheets[1].Name := '기지급내역';
    XL.Range['A1:H2'].Merge;                         //셀 병합

    //TITLE NAME 설정
    XL.Range['A1'].value := '연간의료비 신청/지급 내역';
    XL.Range['A1'].font.Size := 16;

    //컬럼명 지정_서브타이블 지정
    XArr[1]  := '신청일';
    XArr[2]  := '사업자번호';
    XArr[3]  := '사업자명';
    XArr[4]  := '가족명';
    XArr[5]  := '진료일자';
    XArr[6]  := '신청금액';
    XArr[7]  := '승인금액';
    XArr[8]  := '제외금액';

    XL.Range['A3' , 'H3'].Value := XArr;

    k := 3;
    for i := 1 to 8 do
    begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
    end;

    //검색된 자료를 excel에 export처리 시킨다.
    SavePlace := GetBookmark;
    DisableControls;
    First;

    for i := 1 to  RecordCount do
    begin
       XArr[1]  := FieldbyName('APPDATE').AsString;
       XArr[2]  := FieldbyName('CORPNO').AsString;
       XArr[3]  := FieldbyName('CORPNAME').AsString;
       XArr[4]  := FieldbyName('FAMINAME').AsString;
       XArr[5]  := FieldByName('MEDIDATE').AsString;
       XArr[6]  := FieldByName('APPAMT').AsFloat;
       XArr[7]  := FieldByName('CONAMT').AsFloat;
       XArr[8]  := FieldByName('EXAMT').AsFloat;
       XL.Range['A' + IntToStr(k+1), 'H' + IntToStr(k+1)].Value := XArr;
       inc(k);
       Next;
    end;
    XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
    XL.Range['A1', 'H' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
    XL.Range['A1', 'H' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
    XL.Range['A1', 'H' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
    XL.Range['A1', 'H' + IntToStr(k)].font.name := '굴림체';
    XL.Range['A3', 'H' + IntToStr(k)].font.Size := 9;
    XL.Range['A1', 'H' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
    XL.Selection.Columns.AutoFit;                                //자동정렬
    XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
    XL.Visible := true;                                          //엑셀자료 보여줌
    Screen.Cursor := crDefault;

    GotoBookmark(SavePlace);
    FreeBookmark(SavePlace);
    EnableControls;
    SB_Help.SimpleText := '';
  end;
end;

Function TFM_Hospital.Check_Jumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of Integer =
         ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
Begin
  if (Copy(No,7,1) <> '5') and (Copy(No,7,1) <> '6') and
     (Copy(No,7,1) <> '7') and (Copy(No,7,1) <> '8') then    //외국인은 루틴 안타도록..
  begin
    If Length(No) <> 13 then
      Result:= False
    Else
      Try
        Sum:= 0;
        For Loop:= 1 to  12 do
          Sum:= Sum + StrToInt(No[Loop])*Weight[Loop];
        Rest:= 11-(Sum Mod 11);
        If Rest = 11 then Rest:= 1;
        If Rest = 10 then Rest:= 0;
        Result:= Char(Rest+48) = No[13];
      Except
        Result:= False;
      End;
  end
  else
    Result:= True;
End;

procedure TFM_Hospital.PL_Com_Contructor;
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

function TFM_Hospital.Check_Input : Boolean;
var
   Temp : Real;
   C_chknum : String;
   C_sumnum : Integer;
   C_divide : Integer;
   C_tmpval : Integer;
   C_chkval : Integer;
   i        : Integer;
begin
// 사업자 번호 변수초기화 kth 2009.03

  C_chknum  := '137137135';
  C_sumnum  := 0;
  C_divide  := 10;
  C_tmpval  := 0;
  C_chkval  := 0;
// 사업자 번호 변수초기화 kth 2009.03끝

  result := True;

  if Pos('-',E_corpno.Text) > 0 then
  begin
       MessageDlg('사업자 등록번호는 숫자만 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
  if (E_corpno.Text < '       ') or ( Length(E_corpno.Text) < 10 ) then
  begin
       MessageDlg('사업자 등록번호를 정확히 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
  if E_corpname.Text < '       ' then
  begin
       MessageDlg('사업자 명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
//사업자 번호 오류 체크 kth 2009.03

  for i := 1 to 9 do
  begin
       C_tmpval := StrtoInt( Copy(E_corpno.Text,i,1) ) * StrtoInt( Copy(C_chknum,i,1) );   // 사업자 번호와 '137137135' 각 자리 수를 곱한다.
       if i = 9  THEN
          C_sumnum :=  C_sumnum  + trunc(C_tmpval / 10) + (C_tmpval mod 10)
       else
          C_sumnum  := C_sumnum  + C_tmpval;
       Next;
  end;


  C_chkval  :=  C_divide - (C_sumnum mod C_divide);                      // 10 - (계산값 mod 10)
  if   StrtoInt(Copy(E_corpno.Text,10,1)) = (C_chkval mod 10)  THEN     // 사업자 번호 마지막과 비교
  else
  begin
       MessageDlg('정확한 사업자 번호를 넣어 주시기 바랍니다.'+#13#10+
                  '영수증에 있는 사업자 번호를 입력 시에도 오류가 발생하면 해당 의료기관에 '+#13#10+
                  '사업자번호 문의 해 주시기 바랍니다. ' ,mtInformation,[mbOK],0);
       result := false;
  end;
//사업자 번호 오류 체크 kth 2009.03 끝

{  if (E_cardcnt.Value = 0) and (E_cashcnt.Value = 0) then
  begin
    MessageDlg('현금 또는 카드 지급건수를 반드시 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;}
  if (E_cardamt.Value = 0) and (E_cashamt.Value = 0) then
  begin
    MessageDlg('현금 또는 카드지급액을 반드시 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_Fami.Text     < '            ' then
  begin
    MessageDlg('공제가족을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
{  if E_hosgubun.Text < '      ' then
  begin
    MessageDlg('의료비구분을 선택하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;}

  if Length(Trim(E_medidate.Text)) <> 10 then
  begin
    MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
    E_medidate.SetFocus;
    result := false;
  end;

  Try
    Temp := StrToDate(E_medidate.Text);
  Except on EConvertError do
    begin
      MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
      E_medidate.SetFocus;
      Result  := False;
    end;
  end;
end;

Procedure TFM_Hospital.Read_FamRecords(WorkYY, EmpNo, Faminame : String);
begin
  with TDS_Fami2 do
  begin
    ServiceName := 'PSH1030A_sel3';
    Close;
    Sql.Clear;
    SQL.Add('SELECT EMPNO,  FAMINAME, FAMIREL,');
    SQL.Add('	  (SELECT CODENAME FROM PKMYSCOD WHERE FAMIREL = CODENO) relname,');
    SQL.Add('       JUMINID, AGE, OBSYN       ');
    SQL.Add('  FROM PKMYSFAM                  ');
    SQL.Add(' WHERE WORKYY  = '''+WorkYY+'''  ');
    SQL.Add('   AND EMPNO   = '''+Empno +'''  ');
    SQL.Add('   AND FAMINAME Like '''+ Faminame +''' ');
    SQL.Add('   AND FAMIREL IN (''00'',''01'',''02'',''03'',''04'',''05'',''06'') '); //2011.08.26 KTH 가족관계 관련관계만  등록 가능하게 처리

    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 4);
    AddField('FAMINAME', ftString, 12);
    AddField('FAMIREL' , ftString, 2);
    AddField('RELNAME' , ftString, 20);
    AddField('JUMINID' , ftString, 14);
    AddField('AGE'     , ftInteger,3);
    AddField('OBSYN'   , ftString, 1);

    Open;
  end;
end;

Procedure TFM_Hospital.Read_HosRecords(Appdate, EmpNo : String);
begin
  with TDS_Detail do
  begin
    ServiceName := 'HINSA_select20';
    Close;
    Sql.Clear;
    Sql.Add('SELECT EMPNO, DECODE(MEGUBUN, 1, ''중증'', ''일반'') MEGUBUN,        ');
    Sql.Add('       SEQ, FAMINAME, FAMIJUMIN, FAMIREL,                            ');
    Sql.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE FAMIREL = CODENO) RELNAME,');
    Sql.Add('       SUBSTR(MEDIDATE,1,4)||''-''||SUBSTR(MEDIDATE,5,2)||''-''||    ');
    Sql.Add('       SUBSTR(MEDIDATE,7,2) MEDIDATE,                                ');
    Sql.Add('       MEDCOMM, CORPNAME, CORPNO, CASHCNT, CASHAMT,                  ');
    Sql.Add('       CARDCNT, CARDAMT, APPAMT, CONYN, CONYNSAYU, GUBUN, ''F20''    ');
    Sql.Add('  FROM PSHAPHOS                                                      ');
    Sql.Add(' WHERE APPDATE = '''+ Appdate +'''                                   ');
    Sql.Add('   AND EMPNO   = '''+ Empno  +'''                                    ');
    Sql.Add(' ORDER BY SEQ                                                        ');
    ClearFieldInfo;
    AddField('EMPNO'    , ftString, 100);
    AddField('MEGUBUN'  , ftString, 100);
    AddField('SEQ'      , ftInteger,100);
    AddField('FAMINAME' , ftString, 100);
    AddField('FAMIJUMIN', ftString, 100);
    AddField('FAMIREL'  , ftString, 100);
    AddField('RELNAME'  , ftString, 100);
    AddField('MEDIDATE' , ftString, 100);
    AddField('MEDCOMM'  , ftString, 100);
    AddField('CORPNAME' , ftString, 100);
    AddField('CORPNO'   , ftString, 100);
    AddField('CASHCNT'  , ftInteger,100);
    AddField('CASHAMT'  , ftInteger,100);
    AddField('CARDCNT'  , ftInteger,100);
    AddField('CARDAMT'  , ftInteger,100);
    AddField('APPAMT'   , ftInteger,100);
    AddField('CONYN'    , ftString, 100);
    AddField('CONYNSAYU', ftString, 100);
    AddField('GUBUN'    , ftString, 100);
    AddField('F20'      , ftString, 100);
    Open;

    TFloatField(FieldByName('CASHAMT')).DisplayFormat := '#,###';
    TFloatField(FieldByName('CARDAMT')).DisplayFormat := '#,###';
    TFloatField(FieldByName('APPAMT')).DisplayFormat  := '#,###';
  end;
end;

Procedure TFM_Hospital.Read_HosMonthSum(Appdate, EmpNo : String);
begin
  GR_AMT.Caption :=  ' '+ Copy(FL_Appdate,5,2)+'월 신청/승인 금액 ';

  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Add('SELECT nvl(Sum(CASHAMT+CARDAMT),0) field1,           ');
    Sql.Add('      ''field2'', ''field3'', ''field4'', ''field5'' ');
    Sql.Add('  FROM PSHAPHOS                                      ');
    Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +'''                ');
    Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +'''                ');
    Open;
    if TDS_Com.RecordCount > 0  then
      E_totamt.Value := FieldByName('field1').AsFloat;  //신청총액

    PL_Com_Contructor;
    Close;
    Sql.Add('SELECT nvl(Sum(CASHAMT+CARDAMT),0) field1,           ');
    Sql.Add('      ''field2'', ''field3'', ''field4'', ''field5'' ');
    Sql.Add('  FROM PSHAPHOS                                      ');
    Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +'''                ');
    Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +'''                ');
    Sql.Add('   AND CONYN   = ''Y''                               ');
    Open;
    if TDS_Com.RecordCount > 0  then
      E_contot.Value := FieldByName('field1').AsFloat;  //승인총액
  end;
end;

procedure TFM_Hospital.Set_Field(arg1, arg2 : Boolean );
begin
  DB_Hoslist.Enabled  := not arg1;

  E_Gubun.Enabled    := arg1;
  E_Fami.Enabled     := arg1;
  E_medidate.Enabled := arg1;
  E_medcomm.Enabled  := arg1;
  E_corpname.Enabled := arg1;
  E_corpno.Enabled   := arg1;
  E_cashcnt.Enabled  := arg1;
  E_cashamt.Enabled  := arg1;
  E_cardcnt.Enabled  := arg1;
  E_cardamt.Enabled  := arg1;

  if arg2 then
  begin
    E_Gubun.Text    := '';
    E_Fami.Text     := '';
    E_medidate.Text := '';
    E_medcomm.Text  := '';
    E_corpname.Text := '';
    E_corpno.Text   := '';
    E_cashcnt.Value := 0;
    E_cashamt.Value := 0;
    E_cardcnt.Value := 0;
    E_cardamt.Value := 0;
  end;
  SB_Help.Panels[1].Text := '';
end;


procedure TFM_Hospital.Set_Field2(arg1, arg2 : Boolean );
begin
  DB_Hoslist.Enabled  := not arg1;

  E_Gubun.Enabled    := arg1;
  E_Fami.Enabled     := arg1;
  E_medidate.Enabled := arg1;
  E_medcomm.Enabled  := arg1;
  E_corpname.Enabled := arg1;
  E_corpno.Enabled   := arg1;
  E_cashcnt.Enabled  := arg1;
  E_cashamt.Enabled  := arg1;
  E_cardcnt.Enabled  := arg1;
  E_cardamt.Enabled  := arg1;

  if arg2 then
  begin
    E_medidate.Text := '';
    E_medcomm.Text  := '';
    E_cashcnt.Value := 0;
    E_cashamt.Value := 0;
    E_cardcnt.Value := 0;
    E_cardamt.Value := 0;
  end;
end;

procedure TFM_Hospital.MaxSeq;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1) F1,');
    Sql.Add('      ''F2'', ''F3'',''F4'', ''F5''  ');
    Sql.Add('  FROM PSHAPHOS                      ');
    Sql.Add(' WHERE EMPNO   ='''+ FL_AppEmp  +''' ');
    Sql.Add('   AND SUBSTRB(APPDATE,1,4) = '''+ Copy(L_Appdate.Text,1,4) +''' ');
    ClearFieldInfo;
    AddField('F1' , ftString, 100);
    AddField('F2' , ftString, 100);
    AddField('F3' , ftString, 100);
    AddField('F4' , ftString, 100);
    AddField('F5' , ftString, 100);
    Open;
  end;

  E_Seq.Text := TDS_Com.FieldByName('F1').AsString
end;

procedure TFM_Hospital.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Hospital.E_FamiClick(Sender: TObject);
begin
//  E_GubunChange(Sender);
end;

procedure TFM_Hospital.FormActivate(Sender: TObject);
begin
  MessageDlg(' ※ 의료비 신청 시 주의사항 안내'+#10#13+#10#13+
             ' * 치료내역 상세히 기재! (상세 치료내역 확인 불가 시 비승인)'+#10#13+
             ' - 승인 예 : 감기(O), 두통(O), 위염(O), 당뇨(O)' +#10#13+
             ' - 비승인 예 : 피부과진료(X), 진료비(X), 외과진료(X), 수술 및 입원(X)' , mtInformation, [mbOk], 0);
end;

end.

