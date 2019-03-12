{=============================== Program Header ================================
 PROGRAM-NAME   : PSA3210A(사내근로복지기금 대출 신청)
 SYSTEM-NAME    : 복리후생
 SUBSYSTEM-NAME : 사내근로복지기금 대출
 Programmer     : 사내근로복지기금 대출 신청
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.5.23     이희용   신규개발                    노사협력팀 요청
================================================================================}
unit PSA32101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, OnFocusButton, OnPopupEdit, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnScheme, OnEditCombo,
  OnEditNumCtl, Db, Tmax_DataSetText, Tmax_session, ComCtrls, OnRadioBtn,
  OnInsaCommon, KeycodeTmax, TmaxFunc, Comobj, DBGrids, OnGrDBGrid, Grids,
  OnLineLabel, Func, OnTmaxPersonEdit;

type
  TPSA3210 = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel2: TPanel;
    Shape4: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    Pankorname: TOnEdit;
    Ppaycl: TOnEdit;
    Pempdate: TOnEdit;
    P_mrfrdate: TOnEdit;
    P_mrterm: TOnEdit;
    E_appsayu: TOnEdit;
    Panel3: TPanel;
    BB_app: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_close: TOnFocusButton;
    StatusBar1: TStatusBar;
    CB_stclass: TComboBox;
    CBrepmm: TComboBox;
    Cbstdamt: TComboBox;
    Pperiod: TOnEdit;
    Ebankacnt: TOnEdit;
    OnEdit3: TOnEdit;
    SGsimm: TStringGrid;
    OnSectionLabel4: TOnSectionLabel;
    Shape3: TShape;
    OnSectionLabel5: TOnSectionLabel;
    E_Pappdate: TOnEdit;
    E_bankcode: TOnWinPopupEdit;
    DS: TDataSource;
    TDS_Grid: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    P_bankcode: TOnEdit;
    DS1: TDataSource;
    TDS_Grid1: TTMaxDataSet;
    DbGrid1: TOnGrDbGrid;
    OnFocusButton1: TOnFocusButton;
    TMaxDataSet: TTMaxDataSet;
    TDml: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Shape2: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Label1: TLabel;
    Etelno: TOnEdit;
    ED_empno: TTMaxPersonPopupEdit;
    OnFocusButton2: TOnFocusButton;
    TMaxDataSet1: TTMaxDataSet;
    TMaxDataSet2: TTMaxDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_bankcodeChange(Sender: TObject);
    procedure E_bankcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_bankcodeInitPopup(Sender: TObject);
    procedure BB_appClick(Sender: TObject);
    procedure DbGrid1CellClick(Column: TColumn);
    procedure SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure EempnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure InitOfStringGrid;      //StringGrid 초기화
    function CaclOfMonth(Param1, Param2 : String): Integer;
    function Get_codenm(arg_code:string):string;
    function CheckOfMember(Parameter: String): Boolean;
    function CheckOfPSMLOAN(Parameter: String): Boolean;
    function CheckOfPSNLOAN(Parameter: String): Boolean;

  public
    { Public declarations }
    function Get_Field(TDS : TTMaxDataSet ; p_loc: Integer): String;

    procedure Open_Grid1;
    procedure DBgridOfCalc(ValueOfstdamt: Real; ValueOfrepmm: String);
    Procedure TitleOfStringGrid;
    procedure Selete_Data;

  end;

var
  PSA3210: TPSA3210;
  GSempno    : String;
  GSkorname  : String;
  GSpass     : String;
  GSgrade    : String;
  GSsysdate  : String;
  GSDEPTNAME : String;
  GSmrtodate : String;
  GSovtmyn   : String;
  GSpaycl    : String;
  GSdbuser   : String;
  SqlText    : String;
  GSmonth    : Integer;
  GRtotalamt, GSamount, GSintrate, GSremain, GSlimitamt, CompOf1, CompOf2 : Real;

  f_APPFLAG, f_APPDATE   : String;
  f_PSNLOAN, f_CBSTDAMT : Integer;
  vAdmin  : Boolean;

implementation

uses PSA32102;

{$R *.DFM}

procedure TPSA3210.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
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
  ///////////////////////////////////////////////////////////////////////

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////
  //관리자
  vAdmin := False;
  StatusBar1.Panels[1].Text := '';
end;

procedure TPSA3210.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  GSempno   := HInsa_Param(cmdline,1);
  GSkorname := HInsa_Param(cmdline,2);
  GSpass    := HInsa_Param(cmdline,3);
  GSgrade   := HInsa_Param(cmdline,4);
  GSdbuser  := HInsa_Param(cmdline,5);  //신메뉴에서 적용됨.

  Application.ProcessMessages;

  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := ' Select Groupid, ''F2'', ''F3'', ''F4'', ''F5'' '+
                '  from pymenuuser                               '+
                ' where empno = '''+ GSempno +''' ';

    ClearFieldInfo;
    AddField('Groupid', ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    if ((FieldByName('Groupid').AsString = 'G001') or (FieldByName('Groupid').AsString = 'G052')) Then
      vAdmin := True;
    Close;
  end;

  if vAdmin then ED_empno.Enabled := True;
  ED_empno.Text := GSempno;

  Selete_Data;
end;

// 재직한 개월수 추출한다
function TPSA3210.CaclOfMonth(Param1, Param2 : String): Integer;
begin
  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT MONTHS_BETWEEN(TO_DATE('''+Param1+''', ''YYYYMMDD''), TO_DATE('''+Param2+''', ''YYYYMMDD'')) DAY, ' +
                '    ''field2'', ''field3'', ''field4'',''field5'' '+
                '  FROM DUAL  ';

    ClearFieldInfo;
    AddField('DAY'   , ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;
    CaclOfMonth := Trunc(FieldByName('DAY').AsFloat);
    Close;
  end;
end;

procedure TPSA3210.E_bankcodeChange(Sender: TObject);
begin
  if length(E_bankcode.Text) = 2 then
    P_bankcode.Text := ' '+Get_codenm(E_bankcode.Text)
  else
    P_bankcode.Text := '';
end;

function TPSA3210.Get_codenm(arg_code:string):string;
begin
  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format('SELECT BANAME,  ''field2'', ''field3'', ''field4'',''field5'' '+
                       'FROM   PKMBANK ' +
                       'WHERE  BACODE = ''%s'' ORDER BY BANAME ',[arg_code]);

    ClearFieldInfo;
    AddField('BANAME', ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;
  end;
  Result := TMaxDataSet2.FieldByName('BANAME').AsString ;
end;

procedure TPSA3210.E_bankcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CodeForm.CodeNo <> '' then
    E_BankCode.Text    := CodeForm.CodeNo;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TPSA3210.E_bankcodeInitPopup(Sender: TObject);
begin
  CodeForm.CodeSql := 'SELECT CODENO, CODENAME '+
                      '  FROM PYCCODE          '+
                      ' WHERE CODEID =''K910'' '+
                      '   AND USEYN  =''Y''    '+
                      'order by CODENO         ';

  CodeForm.Edit         := TOnWinPopupEdit(Sender);
  CodeForm.CodeKind.Caption       := '[은행코드조회]';
  TOnWinPopupEdit(Sender).PopupControl := CodeForm ;
end;

procedure TPSA3210.BB_appClick(Sender: TObject);
begin
  InitOfStringGrid;

  if ((TOnFocusButton(Sender).Tag = 0) or (TOnFocusButton(Sender).Tag = 1)) then
  Begin
    if not CheckOfMember(Trim(Copy(ED_empno.Text,1,4))) then
    begin
      MessageDlg('사내복지기금 대출대상이 아닙니다.', mtWarning, [mbOK], 0);
      Exit;
    end;

    if not CheckOfPSMLOAN(Trim(Copy(ED_empno.Text,1,4))) then
    begin
      MessageDlg('사우회 대출잔액이 존재합니다.', mtWarning, [mbOK], 0);
      Close;
    end;
  End;

  if      TOnFocusButton(Sender).Tag = 0 then //상환계획
  Begin
    DBgridOfCalc(StrToInt(Copy(Cbstdamt.Text,1,2)) * 100000, Trim(Copy(CBrepmm.Text, 1,2)));
    Exit;
  End
  Else if TOnFocusButton(Sender).Tag = 1 then //대출신청
  Begin
    if BB_app.Caption = '신청' then
    Begin
      if not CheckOfPSNLOAN(Trim(Copy(ED_empno.Text,1,4))) then
      begin
        MessageDlg('사내복지기금(대출/신청) 자료가 존재합니다.', mtWarning, [mbOK], 0);
        Close;
      end;
    End;

    if (E_bankcode.Text = '') or (Ebankacnt.Text = '') then
    begin
      MessageDlg('은행명과 계좌번호을 정확히 입력하세요.', mtWarning, [mbOK], 0);
      Ebankacnt.SetFocus;
      Exit;
    end;

    if Etelno.Text = '' then
    begin
      MessageDlg('사내전화번호를 정확히 입력하세요.', mtWarning, [mbOK], 0);
      Etelno.SetFocus;
      Exit;
    end;

    f_CBSTDAMT:= StrToInt(Copy(Cbstdamt.Text,1,2)) * 100000;

    with TDml do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;
      if f_PSNLOAN = 0 Then            //대출신청(입력)
      Begin
        SQL.Text := 'INSERT INTO PSNLOAN ' +
                    '(            ' +
                    ' EMPNO     , ' + //사번
                    ' APPDATE   , ' + //신청일
                    ' APPTIME   , ' + //신청시간
                    ' PAYCL     , ' + //직급
                    ' STDAMT    , ' + //기준신청금액
                    ' REPMM1    , ' + //상환기간1
                    ' MAXAMT    , ' + //최대신청금액
                    ' REPMM2    , ' + //상환기간2
                    ' BANK      , ' + //입금은행
                    ' BANKACT   , ' + //입금계좌
                    ' APPFLAG   , ' + //대출구분(0 : 대출자, 1 : 신청자, 2 : 대기자, 3 : 기각자)
                    ' TELNO     , ' + //사내전화번호
                    ' APPSARYU  , ' + //신청사유
                    ' ENDYN     , ' + //대출만료여부
                    ' WRITEMAN  , ' + //최종수정일자
                    ' WRITETIME   ' + //최종입력자
                    ')            ' +
                    'VALUES       ' +
                    '( '''+ Copy(ED_empno.Text,1,4) +''' ,  '+
                    '  SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHHMISS''),1,8), '+
                    '  SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHHMISS''),9,6), '+
                    '  '''+ GSpaycl    +''' ,'+
                    '    '+ FloatToStr(f_CBSTDAMT) +' ,'+
                    '  '''+ Trim(Copy(CBrepmm.Text, 1,2)) +''' ,  '+
                    '  5000000 ,  '+
                    '  20 ,  '+
                    '  '''+ E_bankcode.Text +''' ,  '+
                    '  '''+ Ebankacnt.Text +''' ,  '+
                    '  ''1'' ,  '+
                    '  '''+ Etelno.Text +''' ,  '+
                    '  '''+ Trim(Copy(CB_stclass.Text, 1,2)) +''' ,  '+
                    '  ''N'' ,  '+
                    '  '''+ GsEmpno           +''' ,  '+
                    '  TO_CHAR(SYSDATE,''YYYYMMDDHHMISS'')  '+
                    ') ';
      End
      Else                  //대출신청(수정)
      Begin
        SQL.Text := 'UPDATE PSNLOAN SET ' +
                    ' APPDATE   = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHHMISS''),1,8), ' + //신청일
                    ' APPTIME   = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHHMISS''),9,6), ' + //신청시간
                    ' STDAMT    = '  + FloatToStr(f_CBSTDAMT) + ', ' +                 //기준신청금액
                    ' REPMM1    = '''+ Trim(Copy(CBrepmm.Text, 1,2)) +''' ,  '+        //상환기간1
                    ' BANK      = '''+ E_bankcode.Text +''' ,  '+                      //입금은행
                    ' BANKACT   = '''+ Ebankacnt.Text  +''' ,  '+                      //입금계좌
                    ' TELNO     = '''+ Etelno.Text     +''' ,  '+                      //사내전화번호
                    ' APPSARYU  = '''+ Trim(Copy(CB_stclass.Text, 1,2)) +''' ,  '+     //신청사유
                    ' WRITEMAN  = '''+ GsEmpno +''' , '+                               //최종입력자
                    ' WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHHMISS'') '+               //최종수정일자
                    ' WHERE EMPNO   = '''+ Copy(ED_empno.Text,1,4) +''' ' +
                    '   AND APPDATE = '''+ f_APPDATE +''' ' +
                    '   AND APPFLAG = ''1'' ';
      End;

      if not Execute then
      begin
        MessageDlg('저장에 실패했습니다.', mtWarning, [mbOK], 0);
        Exit;
      end Else
      Begin
        if f_PSNLOAN = 0 Then
          MessageDlg('대출신청 하였습니다.', mtInformation, [mbOK], 0)
        Else
          MessageDlg('대출신청자료를 수정 하였습니다.', mtInformation, [mbOK], 0);
      End;
    End;
  End
  Else if TOnFocusButton(Sender).Tag = 2 then //대출신청취소
  Begin
    with TDml do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      SQL.Text := 'DELETE FROM PSNLOAN ' +
                  ' WHERE EMPNO   = '''+ Copy(ED_empno.Text,1,4) +''' ' +
                  '   AND APPDATE = '''+ f_APPDATE +''' ' +
                  '   AND APPFLAG = ''1'' ';

      if not Execute then
      begin
        MessageDlg('삭제에 실패했습니다.', mtWarning, [mbOK], 0);
        Exit;
      end Else
      Begin
        MessageDlg('대출신청을 취소 하였습니다.', mtWarning, [mbOK], 0);
        InitOfStringGrid;
      End;
    End;
  End
  Else  //닫기
  Begin
    Close;
  End;

  Open_Grid1;
end;

procedure TPSA3210.Open_Grid1;
begin
  DbGrid1.Refresh;

  with TDS_Grid1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format('SELECT APPDATE, STDAMT, '+
                       '       DECODE(APPFLAG, ''0'', ''대출'', '+
                       '                       ''1'', ''신청'', '+
                       '                       ''2'', ''대기'', '+
                       '                       ''3'', ''기각'', '''') APPFLAG, '+
                       '       LOANAMT, REPMM1 '+
                       'FROM   PSNLOAN ' +
                       'WHERE  ENDYN <> ''Y'' AND EMPNO = ''%s'' ORDER BY APPDATE DESC',[Copy(ED_empno.Text,1,4)]);

    ClearFieldInfo;
    AddField('APPDATE', ftString, 100);
    AddField('STDAMT' , ftFloat,  100);
    AddField('APPFLAG', ftString, 100);
    AddField('LOANAMT', ftString, 100);
    AddField('REPMM1' , ftString, 100);

    Open;

    FieldByName('APPDATE').EditMask := '!9999-99-99;0;_';
    TFloatField(FieldByName('STDAMT')).DisplayFormat := '#,##0';
  end;
  TDS_Grid1.Fields[0].Alignment := taCenter;
  TDS_Grid1.Fields[1].Alignment := taRightJustify;
  TDS_Grid1.Fields[2].Alignment := taCenter;

//  기각일 경우 신청버튼 비활성화로 수정 (2012.7.10)
  DbGrid1CellClick(nil);
end;

procedure TPSA3210.Selete_Data;
Begin
  if Not(vAdmin) Then
  Begin
    if not CheckOfMember(Trim(Copy(ED_empno.Text,1,4))) then
    begin
      MessageDlg('사내복지기금 대출대상이 아닙니다.', mtWarning, [mbOK], 0);
      Close;
    end;

    if not CheckOfPSMLOAN(Trim(Copy(ED_empno.Text,1,4))) then
    begin
      MessageDlg('사우회 대출잔액이 존재합니다.', mtWarning, [mbOK], 0);
      Close;
    end;
  End;

  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    SQL.Clear;
    Sql.Text := ' SELECT A.EMPNO   , A.KORNAME  , A.PAYCL ,   '+
                '        A.ORGNUM  , A.DEPTCODE , A.EMPDATE , '+
                '        A.PAYBANK , A.PAYACNT  , A.BONCODE , '+
                '        TO_CHAR(SYSDATE, ''YYYYMMDD'') TODAY '+
                ' FROM PKMPMAS A ';
    Sql.Text := Sql.Text + Format(' WHERE A.EMPNO = ''%s'' ', [Copy(ED_empno.Text,1,4)]);

    ClearFieldInfo;
    AddField('EMPNO'    ,ftString, 100);
    AddField('KORNAME'  ,ftString, 100);
    AddField('PAYCL'    ,ftString, 100);
    AddField('ORGNUM'   ,ftString, 100);
    AddField('DEPTCODE' ,ftString, 100);
    AddField('EMPDATE'  ,ftString, 100);
    AddField('PAYBANK'  ,ftString, 100);
    AddField('PAYACNT'  ,ftString, 100);
    AddField('BONCODE'  ,ftString, 100);
    AddField('TODAY'    ,ftString, 100);
    Open;

    ED_empno.text   := FieldByName('EMPNO').AsString;
    Pankorname.text := FieldByName('KORNAME').AsString;
    Ppaycl.text     := FieldByName('PAYCL').AsString;
    Pempdate.text   := InMask(FieldByName('EMPDATE').AsString,'@@@@-@@-@@');
    E_Pappdate.text := InMask(FieldByName('TODAY').AsString,'@@@@-@@-@@');
    E_bankcode.Text := FieldByName('PAYBANK').AsString;
    Ebankacnt.Text  := FieldByName('PAYACNT').AsString;
    GSpaycl         := FieldByName('PAYCL').AsString;
//    GSmonth         := CaclOfMonth( Copy(FieldByName('TODAY').AsString, 1, 8),
//                                    Copy(FieldByName('EMPDATE').AsString, 1, 8));
    if GSmonth <= 0 then  Pperiod.Text := ''
    else                  Pperiod.Text := IntToStr(GSmonth div 12) + '년' + IntToStr(GSmonth mod 12) + '개월';
  end;

  with TMaxDataSet2 do //이자율 조회
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := ' SELECT INTRATE, ''field2'', ''field3'', ''field4'',''field5'' '+
                ' FROM PSNLOANS  ';

    ClearFieldInfo;
    AddField('INTRATE', ftFloat,  100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);
    Open;
    GSintrate := FieldByName('INTRATE').AsFloat;
    Close;
  end;

  Open_Grid1;
End;

procedure TPSA3210.DbGrid1CellClick(Column: TColumn);
begin
  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    Sql.Text := Format(' SELECT DECODE(APPFLAG, ''0'', ''대출'', '+
                       '                        ''1'', ''신청'', '+
                       '                        ''2'', ''대기'', '+
                       '                        ''3'', ''기각'') APPFLAG, '+
                       '        APPDATE, STDAMT, REPMM1, BANK, '+
                       '        BANKACT, TELNO, APPSARYU, '+
                       '        ''field9'', ''field10'' '+
                       ' FROM PSNLOAN '+
                       ' WHERE ENDYN <> ''Y'' AND EMPNO = ''%s'' AND APPDATE = ''%s'' ', [Copy(ED_empno.Text,1,4), TDS_Grid1.FieldByName('APPDATE').AsString]);

    ClearFieldInfo;
    AddField('APPFLAG' , ftString, 100);
    AddField('APPDATE' , ftString, 100);
    AddField('STDAMT'  , ftString, 100);
    AddField('REPMM1'  , ftString, 100);
    AddField('BANK'    , ftString, 100);
    AddField('BANKACT' , ftString, 100);
    AddField('TELNO'   , ftString, 100);
    AddField('APPSARYU', ftString, 100);
    AddField('field9'  , ftString, 100);
    AddField('field10' , ftString, 100);

    Open;

    f_PSNLOAN := RecordCount;
    f_APPDATE := FieldByName('APPDATE').AsString;
    f_APPFLAG := FieldByName('APPFLAG').AsString;

    if (f_PSNLOAN = 0) Then
    Begin
      CB_stclass.ItemIndex := 0;
      Cbstdamt.ItemIndex   := 0;
      CBrepmm.ItemIndex    := 0;
      BB_app.Caption := '신청';
      BB_cancel.Visible := False;
      OnEdit3.Text := '';
//      Etelno.Text  := '';
      InitOfStringGrid;
      Exit;
    End Else
    Begin
      OnEdit3.Text    :=  FieldByName('APPFLAG').AsString;
      E_Pappdate.Text :=  FieldByName('APPDATE').AsString;
      Cbstdamt.ItemIndex := StrToInt(Copy(FieldByName('STDAMT').AsString,1,1)) -1;
      CBrepmm.ItemIndex  := StrToInt(Copy(FieldByName('REPMM1').AsString,1,2)) -10;
      E_bankcode.Text :=  FieldByName('BANK').AsString;
      Ebankacnt.Text  :=  FieldByName('BANKACT').AsString;
      Etelno.Text     :=  FieldByName('TELNO').AsString;
      CB_stclass.ItemIndex := StrToInt(FieldByName('APPSARYU').AsString) -1;

      if (FieldByName('APPFLAG').AsString) = '신청' Then
      Begin
        BB_app.Visible := True;
        BB_app.Caption := '수정';
        BB_cancel.Visible := True;
      End Else
      Begin
        BB_app.Visible := False;
        BB_cancel.Visible := False;
      End;

      StatusBar1.Panels[1].Text  := ' 신규자료 입력 시 초기화버튼을 클릭하시기 바랍니다.';
    End;
  end;

  DBgridOfCalc(StrToInt(TDS_Grid1.FieldByName('STDAMT').AsString), TDS_Grid1.FieldByName('REPMM1').AsString);
end;

// 사우회원인지 여부 체크 리턴값은 TRUE or FALSE
function TPSA3210.CheckOfMember(Parameter: String): Boolean;
begin
  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format('SELECT EMPNO,  ''field2'', ''field3'', ''field4'',''field5'' '+
                       'FROM   PSCMAN ' +
                       'WHERE  EMPNO = ''%s'' AND RETDATE IS NULL  ',[Parameter]);

    ClearFieldInfo;
    AddField('EMPNO',  ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;

    if RecordCount <= 0 then CheckOfMember := False
    else                     CheckOfMember := True;
  end;
end;

// 사우회 대출잔액 존재 여부 리턴값은 TRUE or FALSE
function TPSA3210.CheckOfPSMLOAN(Parameter: String): Boolean;
begin
  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format('SELECT EMPNO,  ''field2'', ''field3'', ''field4'',''field5'' '+
                       'FROM   PSMLOAN ' +
                       'WHERE  EMPNO = ''%s'' AND JANAMT > 0 ',[Parameter]);

    ClearFieldInfo;
    AddField('EMPNO ', ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;

    if RecordCount >= 1 then CheckOfPSMLOAN := False
    else                     CheckOfPSMLOAN := True;
  end;
end;

// 사내근로복지 기금(대출, 신청) 존재 여부 리턴값은 TRUE or FALSE
function TPSA3210.CheckOfPSNLOAN(Parameter: String): Boolean;
begin
  with TMaxDataSet2 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format(' SELECT EMPNO,  ''field2'', ''field3'', ''field4'',''field5'' '+
                       ' FROM   PSNLOAN ' +
                       ' WHERE  EMPNO = ''%s'' ' +
                       '   AND (APPFLAG = ''1'' OR (APPFLAG = ''0'' AND ENDYN = ''N'')) ',[Parameter]);

    ClearFieldInfo;
    AddField('EMPNO ', ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;

    if RecordCount >= 1 then CheckOfPSNLOAN := False
    else
    Begin
      CheckOfPSNLOAN := True;
      f_PSNLOAN      := RecordCount;
    End;
  end;
end;

procedure TPSA3210.DBgridOfCalc(ValueOfstdamt: Real; ValueOfrepmm: String);
var i, j : Integer;
  CellOfOne, CellOfTwo, CellOfThree, CellOfFour: Real;
  Sum1, Sum2, Sum3 : Real;
begin
  for i := 1 to StrToInt(Trim(ValueOfrepmm)) + 1 do
  begin
       for j := 0 to 4 do
            SGsimm.Cells[i, j] := '';
  end;

  Sum1 := 0;
  Sum2 := 0;
  Sum3 := 0;
  SGsimm.ColCount := StrToInt(Trim(ValueOfrepmm)) + 2;
  TitleOfStringGrid;
  CellOfOne := Trunc(ValueOfstdamt / StrToInt(Trim(ValueOfrepmm)));
  CellOfFour:= ValueOfstdamt;
  for i := 1 to SGsimm.ColCount - 2 do
  begin
       SGsimm.Cells[i,1] := FormatFloat('#,##0', CellOfOne);
       CellOfTwo         := Trunc(CellOfFour * GSintrate * ( 30 / 365 ));
       SGsimm.cells[i,2] := FormatFloat('#,##0', CellOfTwo);
       CellOfThree       := CellOfOne + CellOfTwo;
       CellOfFour        := CellOfFour - CellOfOne;
       SGsimm.Cells[i,3] := FormatFloat('#,##0', CellOfThree);
       SGsimm.Cells[i,4] := FormatFloat('#,##0', CellOfFour);
       Sum1              := Sum1 + CellOfOne;
       Sum2              := Sum2 + CellOfTwo;
       Sum3              := Sum3 + CellOfThree;
  end;
  SGsimm.Cells[SGsimm.ColCount - 1,1] := FormatFloat('#,##0', Sum1);
  SGsimm.Cells[SGsimm.ColCount - 1,2] := FormatFloat('#,##0', Sum2);
  SGsimm.Cells[SGsimm.ColCount - 1,3] := FormatFloat('#,##0', Sum3);
  SGsimm.Cells[SGsimm.ColCount - 1,4] := '';
end;

Procedure TPSA3210.TitleOfStringGrid;
var i : Integer;
Begin
  For i := 1 to SGsimm.ColCount-2 Do
       SGsimm.Cells[i, 0] := '+'+InttoStr(i)+'       ';

  SGsimm.Cells[SGsimm.ColCount-1, 0] := '계       ';
  SGsimm.Cells[0,0] := '상환횟수   ';
  SGsimm.Cells[0,1] := '상환원금   ';
  SGsimm.cells[0,2] := '상환이자   ';
  SGsimm.Cells[0,3] := '상환금 계  ';
  SGsimm.Cells[0,4] := '상환금잔액 ';
End;

procedure TPSA3210.SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var Oldalign : Integer;
begin
  if ((row = 2) or (row = 4)) and (col >= 1) then
       with (Sender as TStringGrid).Canvas do
       Begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;

  if (col = SGsimm.ColCount-1) and (row > 0) then
       with (Sender as TStringGrid).Canvas do
       begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;

  if (row = 0) or (col < 1) then
       SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style + [fsbold];

  if (col >= 0) then
  begin
       Oldalign := SetTextAlign(SGsimm.Canvas.Handle,ta_right);
       SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);
       SetTextAlign(SGsimm.Canvas.Handle,Oldalign);
  end
  else SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);

  SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style - [fsbold];
end;

Procedure TPSA3210.InitOfStringGrid;
var i, j : Integer;
Begin
  For i := 0 to SGsimm.ColCount-1 Do
       for j := 0 to 4 do
            SGsimm.Cells[i, j] := '';
End;

function TPSA3210.Get_Field(TDS : TTMaxDataSet ; p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TDS.FieldByName('sel_data').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TPSA3210.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPSA3210.EempnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Selete_Data;
  end;
end;

procedure TPSA3210.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    ED_empno.PL_get_singledata;
    ED_empno.Text :=Copy(ED_empno.empno,1,4);
    Selete_Data;
    Key := #0;
  end;
end;

procedure TPSA3210.ED_empnoReadEnded(Sender: TObject);
begin
  ED_empno.PL_get_singledata;
  ED_empno.Text := Copy(ED_empno.empno,1,4);
  Pankorname.Text := ED_empno.korname;
  Pempdate.Text := ED_empno.empdate;

  Selete_Data;
end;

//초기화 : 대출, 신청자료가 존재하면 신청불가능(기각자료일때만 신청가능함.)
procedure TPSA3210.OnFocusButton2Click(Sender: TObject);
begin
  Selete_Data;
  InitOfStringGrid;
  BB_app.Visible := True;
  BB_app.Caption := '신청';
end;

end.

