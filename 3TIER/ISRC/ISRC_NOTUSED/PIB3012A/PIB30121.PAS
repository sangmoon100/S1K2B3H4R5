{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIB3012A(제증명 발급신청)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      :
Version         : 30.00
Date            :
Update contents
  버전     수정일     수정자   관련근거            수정내용
--------------------------------------------------------------------------------
  32.34   2004.06.29  이민용   박경철대리(자체)     CI변경으로 폼에서 회사명 문구 뺌
--------------------------------------------------------------------------------}

unit PIB30121;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, numedit,
  Mask, Grids, DBGrids, OnFocusButton, OnScheme, OnEditNumCtl,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, OnGrDBGrid,
  OnShapeLabel, OnInsaCommon, Tmax_session, TmaxFunc, OnPopupEdit;

const CodeErr='에러';
type
  TFpib3012a = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BBinsert: TOnFocusButton;
    BBexit: TOnFocusButton;
    Shape6: TShape;
    BBdel: TOnFocusButton;
    BBsave: TOnFocusButton;
    BBcancel: TOnFocusButton;
    TDBSet2: TTMaxDataSet;
    TDml: TTMaxDataSet;
    TCDS_LOAD: TTMaxDataSet;
    TCodeEisp: TTMaxDataSet;
    DataSource1: TDataSource;
    Qr_sysdate: TTMaxDataSet;
    DbGrid1: TOnGrDbGrid;
    MEpayra: TOnShapeLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    CBcertkind: TOnComboEdit;
    Ecertused: TOnComboEdit;
    ME_engaddr: TOnEdit;
    CBcertterm: TOnComboEdit;
    NEcertcnt: TOnNumberEdit;
    Label2: TLabel;
    SB_Help: TStatusBar;
    TMaxSession: TTMaxSession;
    Label1: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    RBcertdate: TRadioButton;
    RBcertkind: TRadioButton;
    Pan_Alram: TPanel;
    Shape1: TShape;
    bt_popupexit: TOnFocusButton;
    MEtel: TOnEdit;
    ED_empno: TOnWinPopupEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBdelClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure RBcertdateClick(Sender: TObject);
//    procedure RBcertkindClick(Sender: TObject);
    procedure CBcertkindChange(Sender: TObject);
    procedure CBcerttermChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure bt_popupexitClick(Sender: TObject);
    procedure ME_engaddrKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoClick(Sender: TObject);

  private
    { Private declarations }
    procedure DataClear1;
    Procedure DataIns;
    Procedure DataUpdate;
    procedure DataDel;
    procedure LoadData1;
    procedure EmpnoFind;

  public
    { Public declarations }
    GSsysdate : String[15];    //Host Date
    GSempno   : String[4];     //Login 사번
    GSkorname : String[12];    //Login 성명
    GSpass    : String;        //비밀번호
    GSgrade   : String;        //등급
    Act_flag  : Boolean;
    SqlText   : String;
    GSMEpayra : String;
    GSMEoffitel:String;
    chk       : Boolean;
    ZMANAGER  : boolean;        //임원관리자

    Function  Get_CodeName(Acodeid, Acodeno  : String ) : String;

  end;

var
  Fpib3012a: TFpib3012a;
  Vcertdate, PrgOrder, Scertdate, Scertkind, Vcertkind,Vcertprdate  : String;
  SaveBy : Integer;

implementation

uses PIB3012A_emp;

{$R *.DFM}

procedure TFpib3012a.FormCreate(Sender: TObject);
begin
  Act_flag  := True;
  FM_empno  := TFM_empno.Create(Self);  
//  Pan_Alram.Visible := True;  //년초에 연말정산 결과전에만 보여줌
end;

{작업후 등 프로그램 관리 화면을 지운다.........................................}
procedure TFpib3012a.DataClear1;
begin
  chk             := True;
  CBcertkind.Text := '';
  Ecertused.text  := '';
  NEcertcnt.value := 0;
  CBcertterm.text := '';
  Vcertdate       := '';
  ME_engaddr.Text := '';
  MEtel.Text      := '';
end;

procedure TFpib3012a.LoadData1;
begin
  if RBcertdate.checked = True then
      PrgOrder := 'ORDER BY CERTDATE DESC '
  else
      PrgOrder := 'ORDER BY CERTKIND, CERTDATE DESC ';

  SqlText := 'SELECT NVL(CERTDATE,'' '') CERTDATE,                                       ' +
             'NVL(CERTKIND,'' '') CERTKIND,                                              ' +
             'decode(CERTKIND, ''1'', ''재직 증명서'',                                   ' +
             '                 ''2'', ''경력 증명서'',                                   ' +
             '                 ''5'', ''근로소득원천징수영수증'',                        ' +
             '                 ''6'', ''갑근세납세필증명서(국문)'',                      ' +
             '                 ''7'', ''갑근세납세필증명서(영문)'', ''X'') as NCERTKIND, ' +
             'NVL(CERTUSED,'' '') CERTUSED, NVL(TO_CHAR(CERTCNT),''0'') CERTCNT,         ' +
             'NVL(CERTTERM,'' '') CERTTERM, NVL(CERTPRDATE,'' '') CERTPRDATE,            ' +
             'NVL(TELNO,'' '') TELNO                                                     ' +
             'FROM PIHCERT                                                               ' +
             format('WHERE (EMPNO = ''%s'') ',[Ed_empno.hint])                             +
             PrgOrder;

  with TCDS_LOAD do
    begin
      Close;
      ClearFieldInfo;
      AddField('CERTDATE'     , ftString,  8 );
      AddField('CERTKIND'     , ftString,  1 );
      AddField('NCERTKIND'    , ftString,  30);
      AddField('CERTUSED'     , ftString,  50);
      AddField('CERTCNT'      , ftFloat ,  2 );
      AddField('CERTTERM'     , ftString,  6 );
      AddField('CERTPRDATE'   , ftString,  8 );
      AddField('TELNO'        , ftString,  15);
      Sql.Clear;
      ServiceName := 'PIB3012A_sel1';
      Sql.Text := SqlText;
      Open;
      FieldByName('CERTDATE').EditMask   := '!9999-99-99;0;_';
      FieldByName('CERTPRDATE').EditMask := '!9999-99-99;0;_';
    end;
  if TCDS_LOAD.RecordCount < 1 then SaveBy := 1;
end;
{
procedure TFpib3012a.CDS_LOADBeforeCall(DataSet: TDataSet;
  var Buffer: PChar);
begin
  with CDS_LOAD do begin
    PrepareQuery;
    ReflectFields := IntToStr(Length(SqlText)+100);
    InitService(1, tpSTRING, False, 30);
    SetHeader('SPIB3012S1', '0', '0050', '', RecordCount, shBUFFSIZE);
    SetFieldValues(0, [SqlText]);
  end;
end;
}
{종료 버튼을 눌렀을때..........................................................}
procedure TFpib3012a.BBexitClick(Sender: TObject);
begin
  Close;
end;

{취소 버튼을 눌렀다............................................................}
procedure TFpib3012a.BBcancelClick(Sender: TObject);
begin
  SB_Help.Panels[1].text := '';
  DataClear1;
end;

{ 해당 자료를 Insert 하는 내용.................................................. }
Procedure TFpib3012a.DataIns;
var
  Tem : String;
begin
  Tem := 'SELECT CERTDATE, CERTKIND, CERTUSED, CERTCNT,           '+
         '       CERTTERM, CERTPRDATE, TELNO                      '+
         'FROM PIHCERT                                            '+
         'WHERE (EMPNO = '''+ED_empno.Hint+''')                   '+
         '  AND (CERTKIND = '''+Copy(CBcertkind.text,1,1)+''')    '+
         '  AND (CERTDATE = '''+Copy(GSsysdate,1,8)+''')          ';
  TDBSet2.Close;
  TDBSet2.ClearFieldInfo;
  TDBSet2.AddField('CERTDATE'  , ftString, 8);
  TDBSet2.AddField('CERTKIND'  , ftString, 1);
  TDBSet2.AddField('CERTUSED'  , ftString, 50);
  TDBSet2.AddField('CERTCNT'   , ftInteger, 2);
  TDBSet2.AddField('CERTTERM'  , ftString, 6);
  TDBSet2.AddField('CERTPRDATE', ftString, 8);
  TDBSet2.Sql.Clear;
  TDBSet2.Sql.Text := tem;
  TDBSet2.ServiceName := 'PIB3012A_sel2';
  TDBSet2.open;
  if TDBSet2.RecordCount > 0 then
  begin
     MessageBox(handle,'기존 자료가 이미 있습니다..','작업안내',MB_ICONWARNING);
     TDBSet2.Close;
     System.Exit;
  end;
  TDBSet2.Close;

  if CBcertkind.text = '' then
  begin
     MessageBox(handle,'증명 구분을 선택하세요 ..','작업안내',MB_ICONWARNING);
     CBcertkind.SetFocus;
     exit;
  end;
  if Ecertused.text = '' then
  begin
     MessageBox(handle,'용도를 선택하세요 ..','작업안내',MB_ICONWARNING);
     Ecertused.SetFocus;
     exit;
  end;


  if CBcertterm.text = '' then
     if (copy(CBcertkind.text,1,1) = '5') or (copy(CBcertkind.text,1,1) = '6') or (copy(CBcertkind.text,1,1) = '7') then
     begin
        MessageBox(handle,'대상기간(급여)을 선택하세요 ..','작업안내',MB_ICONWARNING);
        CBcertterm.SetFocus;
        exit;
     end;


{  Tem := 'INSERT INTO PIHCERT                            ' +
         '(EMPNO, KORNAME, CERTKIND, CERTDATE, CERTUSED, ' +
         'CERTPRYN, CERTCNT, CERTTERM, PAYRA, TELNO,     ' +
         'WRITETIME, WRITEEMP, engaddr)                  ' +
         'VALUES('''+GSempno+''',                        ' +
         '        '''+GSkorname+''',                     ' +
         '        '''+ Copy(CBcertkind.text,1,1) +''',   ' +
         '        '''+Copy(GSsysdate,1,8)+''',           ' +
         '        '''+Ecertused.text+''',                ' +
         '        ''N'',                                 ' +
         '        '''+FloatToStr(NEcertcnt.value)+''',   ' +
         '        '''+CBcertterm.text+''',               ' +
         '        '''+GSMEpayra+''',                     ' +
         '        '''+GSMEoffitel+''',                   ' +
         '        '''+GSsysdate+''','''+GSempno+''', '''+me_engaddr.text+''')     ';
}
  Tem := format('INSERT INTO PIHCERT                              '+
                '(EMPNO, KORNAME, CERTKIND, CERTDATE, CERTUSED,   '+
                'CERTPRYN, CERTCNT, CERTTERM, PAYRA, TELNO,       '+
                'WRITETIME, WRITEEMP, engaddr)                    '+
                'VALUES(''%s'', ''%s'', ''%s'', ''%s'', ''%s'',   '+
                '        ''N'', ''%s'', ''%s'', ''%s'', ''%s'',   '+
                '        ''%s'',''%s'', ''%s'') ',
         [copy(ED_empno.text,1,4), copy(ED_empno.text,8,Length(ED_empno.Text)),
          Copy(CBcertkind.text,1,1), Copy(GSsysdate,1,8),
          Ecertused.text, FloatToStr(NEcertcnt.value), CBcertterm.text, GSMEpayra,
          MEtel.text, GSsysdate, GSempno, me_engaddr.text]);
  with TDml do
  begin
       Close;
       Sql.clear;
       Sql.text := Tem;
       ServiceName := 'PIB3012A_dml';
       if not Execute then
       begin
            Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
       end;
  end;

end;

{ 해당 자료를 Update 하는 내용.................................................}
Procedure TFpib3012a.DataUpdate;
var
  Tem : String;
begin
  Vcertdate := TCDS_LOAD.FieldByName('CERTDATE').AsString;
  Tem := 'UPDATE PIHCERT SET                                      '+
         '       CERTUSED  ='''+Ecertused.text+''',               '+
         '       CERTCNT   ='''+FloatToStr(NEcertcnt.value)+''',  '+
         '       CERTTERM  ='''+CBcertterm.text+''',              '+
         '       PAYRA     ='''+GSMEpayra+''',                    '+
         '       TELNO     ='''+MEtel.text+''',                   '+
         '       WRITETIME ='''+GSsysdate+''',                    '+
         '       WRITEEMP  ='''+GSempno+''',                      '+
         '       engaddr   ='''+ME_engaddr.text+'''               '+
         'WHERE (EMPNO     ='''+Ed_empno.Hint+''')                '+
         '  AND (CERTKIND  ='''+Copy(CBcertkind.text,1,1)+''')    '+
         '  AND (CERTDATE  ='''+Vcertdate+''')                    ';
  with TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      ServiceName := 'PIB3012A_dml';
      if not Execute then
        begin
          Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
        end;
    end;
end;

{ 해당 자료를 Update 하는 내용.................................................}
procedure TFpib3012a.DataDel;
var
  Tem : String;
begin
  Vcertdate := TCDS_LOAD.FieldByName('CERTDATE').AsString;
  Tem := 'DELETE FROM PIHCERT                                     '+
         ' WHERE (EMPNO ='''+ED_empno.Hint+''')                   '+
         '   AND (CERTKIND ='''+Copy(CBcertkind.text,1,1)+''')    '+
         '   AND (CERTDATE ='''+Vcertdate+''')                    ';

  with TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      ServiceName := 'PIB3012A_dml';
      if not Execute then
        begin
          Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
        end;
    end;
end;

procedure TFpib3012a.BBsaveClick(Sender: TObject);
begin
  Scertkind := Copy(CBcertkind.text,1,1);

  if (CBcertterm.text = '') and
     (( copy(CBcertkind.Text,1,1) = '5' ) or ( copy(CBcertkind.Text,1,1) = '6' ) or ( copy(CBcertkind.Text,1,1) = '7' )) then
  begin
     MessageBox(handle,'대상 기간을 정확히 입력하십시오..','입력오류',MB_ICONWARNING);
     CBcertterm.text := '';
     CBcertterm.SetFocus;
     Exit;
  end;

  if CBcertkind.ItemIndex = 4 then
  begin
     if ME_engaddr.Text = '' then
     begin
        MessageBox(handle,'[갑근세납세필증명서(영문)]일 경우에는 영문주소를 필수 입력해야 합니다.','경고',MB_ICONWARNING);
        Exit;
     end;
  end;

  if Trim(MEtel.Text) = '' then
  begin
     MessageBox(handle,'전화번호를 입력하세요 ..','작업안내',MB_ICONWARNING);
     MEtel.SetFocus;
     exit;
  end;

  if SaveBy = 0 then
    begin
      Scertdate := TCDS_LOAD.FieldByName('CERTDATE').AsString;
      DataUpdate;
    end
  else
    begin
      Scertdate := Copy(GSsysdate,1,8);
      DataIns;
      SaveBy := 0;
    end;

  MessageBox(handle,'저장되었습니다..','작업안내',MB_ICONINFORMATION);
  Loaddata1;
  CBcertkind.Enabled := False;
end;

procedure TFpib3012a.BBdelClick(Sender: TObject);
begin
  SB_Help.panels[1].text := '';

  if Application.MessageBox('삭제하시겠습니까 ?', '작업안내', MB_OKCANCEL + MB_DefButton1) = IDOK then
    begin
      DataDel;
      Loaddata1;
    end;
end;

procedure TFpib3012a.RBcertdateClick(Sender: TObject);
begin
  LoadData1;
end;

procedure TFpib3012a.BBinsertClick(Sender: TObject);
begin
  SB_Help.Panels[1].text := '';
  CBcertkind.Enabled := True;
  SaveBy := 1;
  DataClear1;
end;

procedure TFpib3012a.CBcerttermChange(Sender: TObject);
begin
  if TrimLeft(TrimRight(CBcertterm.text)) = '1' then CBcertterm.text := '1년분';
  if TrimLeft(TrimRight(CBcertterm.text)) = '2' then CBcertterm.text := '2년분';
  if TrimLeft(TrimRight(CBcertterm.text)) = '3' then CBcertterm.text := '3년분';
end;

procedure TFpib3012a.CBcertkindChange(Sender: TObject);
begin
   CBcertterm.Enabled := true;
   //---------------------------------------------
   //2006.02.16 ch.k.j 추가
   Ecertused.Text := '';
   Ecertused.Items.Clear;
   Ecertused.Items.Add('은행 제출용');
   Ecertused.Items.Add('비자발급용');
   Ecertused.Items.Add('회사 제출용');
   Ecertused.Items.Add('학교 제출용');
   Ecertused.Items.Add('기타(25자 내로 직접 입력하세요!)');
   //---------------------------------------------
  if copy(CBcertkind.text,1,1) = '1' then
    begin
      CBcertkind.text := '1 : 재직 증명서';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
      CBcertterm.Enabled  := false ;
    end;

  if copy(CBcertkind.text,1,1) = '2' then
    begin
      CBcertkind.text := '2 : 경력 증명서';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
      CBcertterm.Enabled  := false ;
    end;

  if copy(CBcertkind.text,1,1) = '5' then
    begin
      CBcertkind.text := '5 : 근로소득원천징수영수증';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
    end;

  if copy(CBcertkind.text,1,1) = '6' then
    begin
      CBcertkind.text := '6 : 갑근세납세필증명서(국문)';
      ME_engaddr.Enabled  := false;
      me_engaddr.Visible  := false ;
    end;

  if copy(CBcertkind.text,1,1) = '7' then
    begin
      CBcertkind.text := '7 : 갑근세납세필증명서(영문)';
      ME_engaddr.enabled  := true;
      me_engaddr.Visible  := true ;
      //---------------------------------------------
      Ecertused.Items.Add('USA VISA                           America embassy');
      //---------------------------------------------      
    end;

  if  (CBcertkind.text <> '1 : 재직 증명서')              and
      (CBcertkind.text <> '2 : 경력 증명서')              and
      (CBcertkind.text <> '5 : 근로소득원천징수영수증')   and
      (CBcertkind.text <> '6 : 갑근세납세필증명서(국문)') and
      (CBcertkind.text <> '7 : 갑근세납세필증명서(영문)') and
      (chk <> true)                                       then
    begin
      MessageBox(handle,'증명구분을 정확히 입력하십시오..','입력오류',MB_ICONWARNING);
      CBcertkind.text := '';
      CBcertkind.SetFocus;
    end;
  chk := False;
end;

Function  TFpib3012a.Get_CodeName( Acodeid,Acodeno  : String ) : String;
var Tem :String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

procedure TFpib3012a.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Vcertkind       := TCDS_LOAD.FieldByName('CERTKIND').AsString;
  Ecertused.text  := TCDS_LOAD.FieldByName('CERTUSED').AsString;
  NEcertcnt.value := TCDS_LOAD.FieldByName('CERTCNT').AsInteger;
  CBcertterm.text := TCDS_LOAD.FieldByName('CERTTERM').AsString;
  Vcertdate       := TCDS_LOAD.FieldByName('CERTDATE').AsString;
  MEtel.Text      := TCDS_LOAD.FieldByName('TELNO').AsString;

  if Vcertkind = '1' then CBcertkind.text := '1 : 재직 증명서';
  if Vcertkind = '2' then CBcertkind.text := '2 : 경력 증명서';
  if Vcertkind = '5' then CBcertkind.text := '5 : 근로소득원천징수영수증';
  if Vcertkind = '6' then CBcertkind.text := '6 : 갑근세납세필증명서(국문)';
  if Vcertkind = '7' then CBcertkind.text := '7 : 갑근세납세필증명서(영문)';

  SaveBy := 0;
  Fpib3012a.CBcertkind.Enabled := False;
end;

//FormActivate 있던 내용 옮김. 2000.12.27 yhs
procedure TFpib3012a.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  SF_Main.Refresh;
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := '인사시스템에 접속 중입니다...';

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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '';

  if Act_flag = False then
    exit;
  Act_flag  := False;
  Application.ProcessMessages;

  GSempno   := Hinsa_Param(CmdLine, 1);
  GSkorname := Hinsa_Param(CmdLine, 2);
  GSpass    := Hinsa_Param(CmdLine, 3);
  GSgrade   := Hinsa_Param(CmdLine, 4);

  Qr_sysdate.Open;
  GSsysdate := Copy(Qr_sysdate.FieldByName('sysdate').AsString,1,8);
  Qr_sysdate.Close;


  if (copy(GSempno,1,1)='Y') and (not (GSGrade[3] in (['A','B','C']))) then
  begin
    Application.MessageBox('파견직사원은 제증명 발급신청 대상자가 아닙니다.' + #13 + #13 +
                          '프로그램을 종료합니다.','[작업안내]',mb_ok);
    application.Terminate;
  end;

  with TDBSet2  do
  begin
    Close;
    ClearFieldInfo;
    AddField('payra'    , ftString, 3 );
    AddField('offitel'  , ftString, 15);
    Sql.Clear;
    Sql.Add(' select '''',ZMANAGER  from pkzcpbas ');

    ServiceName := 'PIB3012A_sel3';
    Open;

    Zmanager := false;
    if (trim(Fields[1].AsString)=GSempno) then
    begin
      Zmanager := true;
    end;
    Close;
  end;

  ED_Empno.Hint := GSempno;
  ED_EmpNo.Text := GSempno+' - '+GSkorname;

  if (copy(GSgrade,2,1) <= 'B')  then
  begin
    ED_Empno.ButtonWidth := 24;
    ED_Empno.Enabled     := True;
  end
  else
  begin
    ED_Empno.ButtonWidth := 0;
    ED_Empno.Enabled     := False;
  end;
  EmpnoFind;
end;

procedure TFpib3012a.EmpnoFind;
var
  Tem :String;
begin
     if ED_empno.Hint = '' then
     begin
         BBinsert.Enabled := False;
         BBdel.Enabled    := False;
         BBsave.Enabled   := False;
         BBcancel.Enabled := False;
     end
     else
     begin
         BBinsert.Enabled := True;
         BBdel.Enabled    := True;
         BBsave.Enabled   := True;
         BBcancel.Enabled := True;
     end;

     Tem := 'SELECT NVL(PAYRA,'' '') , NVL(OFFITEL,'' '')  '+
            '  FROM PKMPMAS                                '+
            ' WHERE (EMPNO = '''+Ed_empno.Hint+''')        ';

     with  TDBSet2  do
     begin
          Close;
          ClearFieldInfo;
          AddField('payra'    , ftString, 3 );
          AddField('offitel'  , ftString, 15);
          Sql.Clear;
          Sql.Text := Tem;
          ServiceName := 'PIB3012A_sel3';
          Open;

          GSMEpayra := FieldByName('payra').AsString;
          MEpayra.ValueCaption := Get_CodeName('I113',FieldByName('payra').AsString);    //직위
       // MEtel.Text           := FieldByName('offitel').AsString;
          Close;
     end;

     DataClear1;
     Loaddata1;
end;

procedure TFpib3012a.bt_popupexitClick(Sender: TObject);
begin
   Pan_Alram.Visible := False;
end;

procedure TFpib3012a.ME_engaddrKeyPress(Sender: TObject; var Key: Char);
begin
   //영문만 입력 받아 지도록
   if not (key in [#1..#127]) then  key := #0;
end;


procedure TFpib3012a.ED_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
  tmp_key : char;
begin
  tmp_key := #13;
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_empno.QR_pimpmas.FieldByName('empno').AsString;
      ED_empnoKeyPress(Sender, tmp_key);
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
  EmpnoFind;
end;

procedure TFpib3012a.ED_empnoInitPopup(Sender: TObject);
begin

  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.BE_Key.text  := '';
  FM_empno.search_empno;
end;

procedure TFpib3012a.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
      Key := #0;
      FM_empno.BE_Key.text  := ED_empno.text;
      FM_empno.search_empno;
      FM_empno.DataMove;
      EmpnoFind;
  end;
end;

procedure TFpib3012a.ED_empnoClick(Sender: TObject);
begin
     ED_empno.SelectAll;
end;

end.
