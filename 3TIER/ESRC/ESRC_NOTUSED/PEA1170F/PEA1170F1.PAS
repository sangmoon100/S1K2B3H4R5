{=============================== Program Header ================================
 PROGRAM-NAME   : 팀별 담당직무 등록[PEA1170F]
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 팀별 담당직무 등록
 Programmer     : ver 1.0
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.03.20     이희용   신규개발                   HR팀 요청
================================================================================}

unit PEA1170F1;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  ExtCtrls, ComCtrls,Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel, pass,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme,
   OnPopupEdit, PeJeonLabel, OnEditMemo, kpaylib, Comobj, PDownLoad, OnRegistry,
   ShellApi, OnInternetFTP ;

  type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TDS_Com: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TDml: TTMaxDataSet;
    OnSchemeForm1: TOnSchemeForm;
    Shape1: TShape;
    Shape2: TShape;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Shape5: TShape;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    ED_Ekind5: TOnEdit;
    ED_Ekind3: TOnEdit;
    ED_Ekind2: TOnEdit;
    ED_Ekind1: TOnEdit;
    ED_team: TOnWinPopupEdit;
    ED_eemp: TOnEdit;
    ED_Ekind4: TOnEdit;
    OE_JM5: TOnMemo;
    OM_JM5: TOnMemo;
    OnEdit1: TOnEdit;
    OF_JM1: TOnFocusButton;
    OnEdit2: TOnEdit;
    OnEdit4: TOnEdit;
    OnEdit16: TOnEdit;
    OF_JM2: TOnFocusButton;
    OF_JM3: TOnFocusButton;
    OF_JM4: TOnFocusButton;
    OM_JM1: TOnMemo;
    OM_JM2: TOnMemo;
    OM_JM3: TOnMemo;
    OM_JM4: TOnMemo;
    Panel10: TPanel;
    BBclose: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    BBupdate: TOnFocusButton;
    ON_JM1: TOnEdit;
    ON_JM2: TOnEdit;
    ON_JM3: TOnEdit;
    ON_JM4: TOnEdit;
    ON_JM5: TOnEdit;
    BT_Excel1: TOnFocusButton;
    ms1: TLabel;
    Shape3: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OE_JM1: TOnMemo;
    OE_JM2: TOnMemo;
    OE_JM3: TOnMemo;
    OE_JM4: TOnMemo;
    THintMail: TTMaxDataSet;
    Panel1: TPanel;
    SB_Help: TStatusBar;
    BT_3080B: TOnFocusButton;
    procedure BBcloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure OF_JM1Click(Sender: TObject);
    procedure OM_JM5Click(Sender: TObject);
    procedure OM_JM5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBupdateClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure BT_Excel1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_3080BClick(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
    function CheckOfMember(Parameter: String): Boolean;
    function CheckOfDept(Parameter: String): Boolean;
  public
    { Public declarations }
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, GSpEMP, FG_Date, SqlText : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfGrid : Boolean;
    sRabasdate, sOrgnum : String;
    Workemp1, Workemp2, Workemp3, Workemp4 : String;
    procedure SetNow;
    function Data_Check : boolean;
    procedure Select_BaseData;
    procedure ComponentClear;
    procedure SendMail;
    Function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  end;
var
  FM_Main: TFM_Main;
  Hwnd  : Word;
implementation

uses KeyEmpno, PEA1170F2, PEA1170F3;
{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//TMaxSession.EnvFileName := 'd:\source\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  Try
    TMaxSession.Connect := True;
    TMaxSession.TMax_Begin(5000);
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
  VarLoading;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);

  Lempno.Caption    := GSkorname + '(' + GSempno +')';
  Lsysdate.Caption  := Copy(FG_Date,1,4)+'/'+Copy(FG_Date,5,2)+'/'+Copy(FG_Date,7,2);
  Pgrade            := copy(GSgrade,3,1);

  SetNow;

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, Value2 Field2,             ' +
                '         '''' Field3,   '''' Field4, '''' Field5 ' +
                '  from peIDPbas                                  ' +
                ' where base_yy = ''0000''                        ' +
                '   and gubun = ''00'' and sgubun = ''0000''      ';

    ClearFieldInfo;
    AddField('Field1', ftString, 100);
    AddField('Field2', ftString, 100);
    AddField('Field3', ftString, 100);
    AddField('Field4', ftString, 100);
    AddField('Field5', ftString, 100);
    Open;

    sRabasdate := FieldByName('Field1').AsString+'1130';
    sOrgnum    := FieldByName('Field2').AsString;

    sRabasdate := '20171130';
    sOrgnum    := 'H21';

    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, Value2 Field2,              ' +
                '       Value3 Field3, Value4 Field4,  '''' Field5 ' +
                '  from peIDPbas                                   ' +
                ' where base_yy||''1130''   = '''+sRabasdate+'''   ' +
                '   and gubun     = ''01''  and   sgubun = ''0001''';
    Open;
    workemp1 := FieldByName('Field1').AsString;
    workemp2 := FieldByName('Field2').AsString;
    workemp3 := FieldByName('Field3').AsString;
    workemp4 := FieldByName('Field4').AsString;
  end;

  //평가담당자는 전사원 조회
  if  (GSempno = workemp1) or (GSempno = workemp2) or (GSempno = workemp3) or (GSempno = workemp4) or (copy(GSempno,1,1) = 'D') then
  Begin
    ED_team.Enabled := True;
    CheckOfMember(GSempno);
  End
  else
  Begin
    ED_team.Enabled := False;

    if not CheckOfMember(GSempno) then
    begin
      MessageDlg('평가대상자가 아닙니다.', mtWarning, [mbOK], 0);
      Close;
    end;
  End;

  CheckOfDept(GSdeptcode);

end;

function TFM_Main.CheckOfMember(Parameter: String): Boolean;
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT  A.EMPNO, A.KORNAME, A.payrayn, A.deptcode,  '+
                '   (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME '+
                '  FROM PIMPMAS A '+
                ' WHERE A.PSTATE < ''80'' '+
                '   AND A.EMPNO  = '''+ Parameter +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 100);
    AddField('KORNAME' , ftString, 100);
    AddField('payrayn' , ftString, 100);
    AddField('deptcode', ftString, 100);
    AddField('DEPTNAME', ftString, 100);
    SQL.Text := SqlText;
    Open;

    if TDS1.RecordCount < 1 then CheckOfMember := False
    else
    Begin
      ED_eemp.Text := Fields[0].AsString +' - ' +Fields[1].AsString;
      GSdeptcode   := Fields[3].AsString;
      ED_team.Text := Fields[4].AsString;

      if (Fields[2].AsString = 'N') Then
      Begin  // H20 IKKK3 제외 사항 2016.02.19 HeeYong.
        If (Parameter = '2850') Then CheckOfMember := True
        Else                         CheckOfMember := False;
      End
      Else                           CheckOfMember := True;
    End;
  end;
end;

function TFM_Main.CheckOfDept(Parameter: String): Boolean;
var bRabasdate : String;
begin
  bRabasdate := IntToStr(StrToInt(Copy(sRabasdate,1,4)) - 1);
  bRabasdate := bRabasdate+'1130';

  with TDS1 do
  begin
    ServiceName := 'HINSA_select12';
    Close;
    Sql.Clear;

(*  최초 자료 없을때 자료등록 후 기존자료 조회함. 2016.2.15 HeeYong
    SqlText :=  'SELECT  A.EKIND1, A.EKIND2, A.EKIND3, A.EKIND4, A.EKIND5, A.ITEMDESC5, '+
                '      ''F7'', ''F8'', ''F9'', ''F10'' FROM PEDUCDT A '+
                ' where rabasdate  = '''+bRabasdate+'''             ' +
                '   AND A.DEPTCODE = '''+ Parameter  +''' ' ;
*)

    SqlText :=  'SELECT NVL(SUBSTR(ITEMNAME1,1, DECODE(ITEMNO1, ''99'', 12, INSTR(ITEMNAME1,''('')-3)) ,'' '') ITEMNAME1, ' +
                '       NVL(SUBSTR(ITEMNAME2,1, DECODE(ITEMNO2, ''99'', 12, INSTR(ITEMNAME2,''('')-3)) ,'' '') ITEMNAME2, ' +
                '       NVL(SUBSTR(ITEMNAME3,1, DECODE(ITEMNO3, ''99'', 12, INSTR(ITEMNAME3,''('')-3)) ,'' '') ITEMNAME3, ' +
                '       NVL(SUBSTR(ITEMNAME4,1, DECODE(ITEMNO4, ''99'', 12, INSTR(ITEMNAME4,''('')-3)) ,'' '') ITEMNAME4, ' +
                '       NVL(SUBSTR(ITEMNAME5,1, DECODE(ITEMNO5, ''99'', 12, INSTR(ITEMNAME5,''('')-3)) ,'' '') ITEMNAME5, ' +
                '       ITEMDESC5, ''F7'', ''F8'', ''F9'', ''F10'' FROM PEDUCDEPT A'+
                ' where rabasdate = '''+ bRabasdate +''' ' +
                '   AND DEPTCODE  = (SELECT BDEPTCODE1 FROM PYCDEPT WHERE ORGNUM = '''+sOrgnum+''' AND DEPTCODE = '''+Parameter+''') ' ;
    ClearFieldInfo;
    AddField('ITEMNAME1', ftString, 2000);
    AddField('ITEMNAME2', ftString, 2000);
    AddField('ITEMNAME3', ftString, 2000);
    AddField('ITEMNAME4', ftString, 2000);
    AddField('ITEMNAME5', ftString, 2000);
    AddField('ITEMDESC5', ftString, 2000);
    AddField('F7'       , ftString, 2000);
    AddField('F8'       , ftString, 2000);
    AddField('F9'       , ftString, 2000);
    AddField('F10'      , ftString, 2000);
    SQL.Text := SqlText;
    Open;

    if TDS1.RecordCount < 1 then CheckOfDept := False
    else
    Begin
      ED_Ekind1.Text  := Fields[0].AsString;
      ED_Ekind2.Text  := Fields[1].AsString;
      ED_Ekind3.Text  := Fields[2].AsString;
      ED_Ekind4.Text  := Fields[3].AsString;
      ED_Ekind5.Text  := Fields[4].AsString;
      OM_JM5.Text     := Fields[5].AsString;
      CheckOfDept := True;
    End;
  end;

  Select_BaseData;
end;

procedure TFM_Main.SetNow;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text :=' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D, '+
               ' ''F2'', ''F3'', ''F4'', ''F5'' ' +
               ' FROM DUAL ' ;

    ClearFieldInfo;
    AddField('D' , ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    GSsysdate := FieldByName('D').AsString;
  End;
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.OF_JM1Click(Sender: TObject);
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT CONYN,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEDUCDEPT  '+
                ' where rabasdate  = '''+sRabasdate+'''             ' +
                '   AND DEPTCODE   = '''+ GSdeptcode  +''' ' ;

    ClearFieldInfo;
    AddField('CONYN'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if (fieldbyname('CONYN').AsString = 'Y') then
    Begin
      ms1.Visible := False;
      Exit;
    End;
  end;

  Try
    JikmuForm := TJikmuForm.Create(Self);
    JikmuForm.ShowModal;

    if (((OE_JM1.Text = JikmuForm.GSITEMNAME) or (OE_JM2.Text = JikmuForm.GSITEMNAME) or
         (OE_JM3.Text = JikmuForm.GSITEMNAME) or (OE_JM4.Text = JikmuForm.GSITEMNAME)) and
         (JikmuForm.GSITEMNAME <> '')) Then
    Begin
      MessageBox(handle,'중복된 직무역량 자료가 존재 합니다.','작업확인',MB_ICONWARNING);
      TOnFocusButton(Self.FindComponent('OF_JM'+IntToStr(TOnFocusButton(Sender).tag))).SetFocus;
      System.Exit;
    End
    Else
    Begin
      TOnEdit(Self.FindComponent('ON_JM'+IntToStr(TOnFocusButton(Sender).tag))).Text := JikmuForm.GSITEMNO;
      TOnEdit(Self.FindComponent('OE_JM'+IntToStr(TOnFocusButton(Sender).tag))).Text := JikmuForm.GSITEMNAME;
      TOnMemo(Self.FindComponent('OM_JM'+IntToStr(TOnFocusButton(Sender).tag))).Text := JikmuForm.GSITEMDESC;
    End;
  Finally
    JikmuForm.Free;
  end;
end;

procedure TFM_Main.OM_JM5Click(Sender: TObject);
begin
  if (Pos('(Max 400Byte)',OM_JM5.Text) > 0) then OM_JM5.Text := '';
end;

procedure TFM_Main.OM_JM5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : integer;
    Opinion1 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        Opinion1 := copy(OM_JM5.text, 1, Length(OM_JM5.text)-1);
        OM_JM5.Clear;
        OM_JM5.Lines.Append(Opinion1);
   end;
end;

function TFM_Main.Data_Check: boolean;
Begin
  Result := False;

  if trim(ED_team.Text ) = '' Then Begin MessageDlg('소속부서를 선택하시기 바랍니다..' ,mtError, [mbOK], 0); exit; End;

  if trim(OE_JM1.Text) = '' Then Begin MessageDlg('직무역량(항목1)을 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OF_JM1.SetFocus; exit; End;
  if trim(OE_JM2.Text) = '' Then Begin MessageDlg('직무역량(항목2)을 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OF_JM2.SetFocus; exit; End;
  if trim(OE_JM3.Text) = '' Then Begin MessageDlg('직무역량(항목3)을 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OF_JM3.SetFocus; exit; End;
  if trim(OE_JM4.Text) = '' Then Begin MessageDlg('직무역량(항목4)을 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OF_JM4.SetFocus; exit; End;
  if ((trim(OM_JM5.Text) = '') or (Pos('(Max 400Byte)',OM_JM5.Text) > 0)) Then Begin MessageDlg('직무역량(항목5)을 입력하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;

  Result := True;
End;

procedure TFM_Main.BBupdateClick(Sender: TObject);
var Checkinx, JobMode: String;
    i: Integer;
begin
  If Not (Data_Check) Then Exit;
  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT DEPTCODE,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEDUCDEPT  '+
                ' where rabasdate  = '''+sRabasdate+'''             ' +
                '   AND DEPTCODE   = '''+ GSdeptcode  +''' ' ;

    ClearFieldInfo;
    AddField('DEPTCODE' ,ftString, 100);
    AddField('field2'   ,ftString, 100);
    AddField('field3'   ,ftString, 100);
    AddField('field4'   ,ftString, 100);
    AddField('field5'   ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  ( TDS1.RecordCount < 1 )  then JobMode :='I'
    else                               JobMode :='U';
  end;


  if JobMode = 'I' then
  begin
      SQLText:= 'INSERT INTO PEDUCDEPT                 '+#13+
                '   (RABASDATE, DEPTCODE,  ORGNUM,     '+#13+
                '    ITEMNO1,   ITEMNAME1, ITEMDESC1,  '+#13+
                '    ITEMNO2,   ITEMNAME2, ITEMDESC2,  '+#13+
                '    ITEMNO3,   ITEMNAME3, ITEMDESC3,  '+#13+
                '    ITEMNO4,   ITEMNAME4, ITEMDESC4,  '+#13+
                '    ITEMNO5,   ITEMNAME5, ITEMDESC5,  '+#13+
                '    CONYN,     WRITEMAN,  WRITETIME)  '+#13+
                '  VALUES                              '+#13+
                '   ('''+ sRabasdate     +''',         '+#13+
                '    '''+ GSdeptcode     +''',         '+#13+
                '    '''+ sOrgnum        +''',         '+#13+
                '    '''+ ON_JM1.Text    +''',         '+#13+
                '    '''+ OE_JM1.Text    +''',         '+#13+
                '    '''+ OM_JM1.Text    +''',         '+#13+
                '    '''+ ON_JM2.Text    +''',         '+#13+
                '    '''+ OE_JM2.Text    +''',         '+#13+
                '    '''+ OM_JM2.Text    +''',         '+#13+
                '    '''+ ON_JM3.Text    +''',         '+#13+
                '    '''+ OE_JM3.Text    +''',         '+#13+
                '    '''+ OM_JM3.Text    +''',         '+#13+
                '    '''+ ON_JM4.Text    +''',         '+#13+
                '    '''+ OE_JM4.Text    +''',         '+#13+
                '    '''+ OM_JM4.Text    +''',         '+#13+
                '    '''+ '99'           +''',         '+#13+
                '    '''+ '전문지식개발' +''',         '+#13+
                '    '''+ OM_JM5.Text    +''',         '+#13+
                '    '''+ 'N'            +''',         '+#13+
                '    '''+ GSempno        +''',         '+#13+
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
                '   ) ';
  end
  Else
  Begin
      SQLText := Format(
                'UPDATE PEDUCDEPT  SET ' +#13+
                '       ITEMNO1      = '''+ON_JM1.Text+''', ' +#13+
                '       ITEMNAME1    = '''+OE_JM1.Text+''', ' +#13+
                '       ITEMDESC1    = '''+OM_JM1.Text+''', ' +#13+
                '       ITEMNO2      = '''+ON_JM2.Text+''', ' +#13+
                '       ITEMNAME2    = '''+OE_JM2.Text+''', ' +#13+
                '       ITEMDESC2    = '''+OM_JM2.Text+''', ' +#13+
                '       ITEMNO3      = '''+ON_JM3.Text+''', ' +#13+
                '       ITEMNAME3    = '''+OE_JM3.Text+''', ' +#13+
                '       ITEMDESC3    = '''+OM_JM3.Text+''', ' +#13+
                '       ITEMNO4      = '''+ON_JM4.Text+''', ' +#13+
                '       ITEMNAME4    = '''+OE_JM4.Text+''', ' +#13+
                '       ITEMDESC4    = '''+OM_JM4.Text+''', ' +#13+
                '       ITEMNO5      = '''+ON_JM5.Text+''', ' +#13+
                '       ITEMNAME5    = '''+OE_JM5.Text+''', ' +#13+
                '       ITEMDESC5    = '''+OM_JM5.Text+''', ' +#13+
                '       WRITEMAN     = '''+GSempno+''',     ' +#13+
                '       WRITETIME    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
                ' WHERE RABASDATE    = ''%s'' '  +#13+
                '  AND  DEPTCODE     = ''%s'' ' ,
                [sRabasdate, GSdeptcode]);
  End;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End;

  MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
  Select_BaseData;
end;

procedure TFM_Main.Select_BaseData;
VAR sCONYN: String;
begin
  SQLText :=  ' SELECT A.ITEMNO1, A.ITEMNAME1, A.ITEMDESC1, ' +
              '        A.ITEMNO2, A.ITEMNAME2, A.ITEMDESC2, ' +
              '        A.ITEMNO3, A.ITEMNAME3, A.ITEMDESC3, ' +
              '        A.ITEMNO4, A.ITEMNAME4, A.ITEMDESC4, ' +
              '        A.ITEMNO5, A.ITEMNAME5, A.ITEMDESC5, ' +
              '        A.CONYN , ''Field17'', ''Field18''   '+
           ' FROM PEDUCDEPT A '+
           ' WHERE RABASDATE = '''+ sRabasdate +''' '+
           '   AND DEPTCODE  = '''+ GSdeptcode +''' ';

  with TDS_Com do
  begin
    Close;
    ServiceName := 'PEH2030A_sel1';
    ClearFieldInfo;
    AddField('ITEMNO1'  , ftString, 400);
    AddField('ITEMNAME1', ftString, 400);
    AddField('ITEMDESC1', ftString, 400);

    AddField('ITEMNO2'  , ftString, 400);
    AddField('ITEMNAME2', ftString, 400);
    AddField('ITEMDESC2', ftString, 400);

    AddField('ITEMNO3'  , ftString, 400);
    AddField('ITEMNAME3', ftString, 400);
    AddField('ITEMDESC3', ftString, 400);

    AddField('ITEMNO4'  , ftString, 400);
    AddField('ITEMNAME4', ftString, 400);
    AddField('ITEMDESC4', ftString, 400);

    AddField('ITEMNO5'  , ftString, 400);
    AddField('ITEMNAME5', ftString, 400);
    AddField('ITEMDESC6', ftString, 400);

    AddField('CONYN'    , ftString, 400);
    AddField('Field17'  , ftString, 400);
    AddField('Field18'  , ftString, 400);
    SQL.Text := SQLText;
    Open;

    sCONYN := fieldbyname('CONYN').AsString;

    if (recordcount < 1) Then ComponentClear
    Else
    Begin
      ON_JM1.Text := Fields[0].AsString;
      OE_JM1.Text := Fields[1].AsString;
      OM_JM1.Text := Fields[2].AsString;
      ON_JM2.Text := Fields[3].AsString;
      OE_JM2.Text := Fields[4].AsString;
      OM_JM2.Text := Fields[5].AsString;
      ON_JM3.Text := Fields[6].AsString;
      OE_JM3.Text := Fields[7].AsString;
      OM_JM3.Text := Fields[8].AsString;
      ON_JM4.Text := Fields[9].AsString;
      OE_JM4.Text := Fields[10].AsString;
      OM_JM4.Text := Fields[11].AsString;
      ON_JM5.Text := Fields[12].AsString;
      OE_JM5.Text := Fields[13].AsString;
      If (Fields[14].AsString <> '') Then OM_JM5.Text := Fields[14].AsString;

      if (sCONYN = 'Y') Then
      Begin
        OF_JM1.Enabled     := False;
        OF_JM2.Enabled     := False;
        OF_JM3.Enabled     := False;
        OF_JM4.Enabled     := False;
        BBupdate.Enabled   := False;
        Bt_Confirm.Enabled := False;
        ms1.Visible        := True;
      End Else
      Begin
        OF_JM1.Enabled     := True;
        OF_JM2.Enabled     := True;
        OF_JM3.Enabled     := True;
        OF_JM4.Enabled     := True;
        BBupdate.Enabled   := True;
        Bt_Confirm.Enabled := True;
        ms1.Visible        := False;
      End;
    End;
  End;
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SQLTEXT  : String;
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT DEPTCODE , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEDUCDEPT                                                 '+
                ' WHERE RABASDATE = '''+ sRabasdate +''' '+
                '   AND DEPTCODE  = '''+ GSdeptcode +''' ';
    ClearFieldInfo;
    AddField('DEPTCODE' , ftString,  100);
    AddField('field2'   , ftString,  100);
    AddField('field3'   , ftString,  100);
    AddField('field4'   , ftString,  100);
    AddField('field5'   , ftString,  100);
    Open;

    if  (RecordCount < 1 )  then
    Begin
      MessageDlg('임시저장 후 최종완료 하시기 바랍니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  If Not (Data_Check) Then Exit;

  if Application.MessageBox('최종완료된 자료는 수정할 수 없습니다. 최종완료 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  SQLText := Format(
            'UPDATE PEDUCDEPT  SET ' +#13+
            '       ITEMNO1      = '''+ON_JM1.Text+''', ' +#13+
            '       ITEMNAME1    = '''+OE_JM1.Text+''', ' +#13+
            '       ITEMDESC1    = '''+OM_JM1.Text+''', ' +#13+
            '       ITEMNO2      = '''+ON_JM2.Text+''', ' +#13+
            '       ITEMNAME2    = '''+OE_JM2.Text+''', ' +#13+
            '       ITEMDESC2    = '''+OM_JM2.Text+''', ' +#13+
            '       ITEMNO3      = '''+ON_JM3.Text+''', ' +#13+
            '       ITEMNAME3    = '''+OE_JM3.Text+''', ' +#13+
            '       ITEMDESC3    = '''+OM_JM3.Text+''', ' +#13+
            '       ITEMNO4      = '''+ON_JM4.Text+''', ' +#13+
            '       ITEMNAME4    = '''+OE_JM4.Text+''', ' +#13+
            '       ITEMDESC4    = '''+OM_JM4.Text+''', ' +#13+
            '       ITEMNO5      = '''+ON_JM5.Text+''', ' +#13+
            '       ITEMNAME5    = '''+OE_JM5.Text+''', ' +#13+
            '       ITEMDESC5    = '''+OM_JM5.Text+''', ' +#13+
            '       CONYN        = ''Y'',               ' +#13+
            '       WRITEMAN     = '''+GSempno+''',     ' +#13+
            '       WRITETIME    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
            ' WHERE RABASDATE    = ''%s'' '  +#13+
            '  AND  DEPTCODE     = ''%s'' ' ,
            [sRabasdate, GSdeptcode]);

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
    MessageDlg('최종완료 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
//    SendMail;
    Select_BaseData;
    BT_3080BClick(Nil);
  end;
end;

procedure TFM_Main.ComponentClear;
begin
  OE_JM1.Text := '';
  OE_JM2.Text := '';
  OE_JM3.Text := '';
  OE_JM4.Text := '';

  OM_JM1.Text := '';
  OM_JM2.Text := '';
  OM_JM3.Text := '';
  OM_JM4.Text := '';

  OE_JM5.Lines.Clear;
  OE_JM5.Lines.Add (#13#10);
  OE_JM5.Lines.Add(' 전문지식개발 ');
  OE_JM5.Lines.Add('  (직접입력)');

  If (OM_JM5.Text = '') Then
    OM_JM5.Text := '한글 기준 200자까지 등록 가능합니다. (Max 400Byte)';

  BBupdate.Enabled   := True;
  Bt_Confirm.Enabled := True;
  ms1.Visible        := False;
end;

procedure TFM_Main.BT_Excel1Click(Sender: TObject);
var ObjName, FL_Prog : String;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','역량 사전_VER 0.9_20130322.XLSX','역량사전',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
end;

procedure TFM_Main.ED_teamInitPopup(Sender: TObject);
begin
  TeamForm.Edit         := TOnWinPopupEdit(Sender);
  TeamForm.PG_Get_Dept;
  TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TFM_Main.ED_teamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if TeamForm.GSdeptcode <> '' then
  begin
      GSdeptcode   := TeamForm.GSdeptcode;
      ED_team.Text := TeamForm.GSdeptname;
      ED_eemp.Text := TeamForm.GSeempno +' - '+TeamForm.GSeempkor;
  end;

  Select_BaseData;
  CheckOfDept(GSdeptcode);
end;

procedure TFM_Main.SendMail;
var
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
  i : Integer;
begin
(*
  with THintMail do
  begin
    SqlText   := Format(' SELECT EMPNO       field1 '+
                        '      , KORNAME     field2 '+
                        '      , ''field3''  field3 '+
                        '      , ''field4''  field4 '+
                        '      , ''field5''  field5 '+
                        '   FROM PIMEEMP            '+
                        '  WHERE SUBSTR(EMPNO,1,1) NOT IN (''J'', ''P'', ''Q'', ''Y'') '+
                        '    AND PAYRAYN  = ''N''   '+
                        '    AND orgnum   = ''%s''  '+
                        '    AND deptcode = ''%s''  '+
                        '  ORDER BY EMPNO ',[sOrgnum, GSdeptcode]);

    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlText;

    ClearFieldInfo;
    AddField('field1', ftString,  100);
    AddField('field2', ftString,  100);
    AddField('field3', ftString,  100);
    AddField('field4', ftString,  100);
    AddField('field5', ftString,  100);
    Open;

    for i := 1 to RecordCount do
    begin
       SendProgID  := 'PEA1170F'; //프로그램 ID
       SendEmpno   := GSempno;    //발송자(로그인 사번)
       RcveEmpno   := FieldByName('field1').AsString;
  //  RcveEmpno   := 'Z113';
       MailSubject := '[ 직무역량의 우선 개발 순위 등록 ] ';
       MailBody    :=  '******************************************************************************' + CHR(13) + CHR(10) + CHR(13) + CHR(10) +
                       ED_team.Text +'의 직무역량 등록이 완료되었습니다.   '+ CHR(13) + CHR(10) + CHR(13) + CHR(10) +
                       FieldByName('field1').AsString+'('+FieldByName('field2').AsString+')팀원은 '+ CHR(13) + CHR(10) +
                       '[종합인사시스템]▶[평가]▶[구성원 성과관리]▶[직무역량/업무목표/IDP 등록결재]에서 '+ CHR(13) + CHR(10) + CHR(13) + CHR(10) +
                       '해당 직무역량의 우선순위를 선택하여 주시기 바랍니다.' + CHR(13) + CHR(10) + CHR(13) + CHR(10) +
                       '******************************************************************************'  + CHR(13) + CHR(10);

       ReceiveYN   := 'N';

       Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
       Next;
    end;
  End;
*)
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
(*
  with TDml do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into PZHMAIL                             ');
    SQL.Add('values (to_char(sysdate,''yyyymmddhh24miss'' ), ');  //SENDTIME   메일발송 작업시간
    SQL.Add('        '''+ SendProgID   +''',                 ');  //SENDPROG   발송프로그램 ID
    SQL.Add('        '''+ SendEmpno    +''',                 ');  //SEND_PER   발신자 사번
    SQL.Add('        '''+ RcveEmpno    +''',                 ');  //RCVR_PER,  수신자 사번
    SQL.Add('        ''''                  ,                 ');  //REFR_PER   불필요(종합인사)
    SQL.Add('        '''+ MailSubject  +''',                 ');  //SUBJECT    메일제목
    SQL.Add('        ''''                  ,                 ');  //HEADER1    불필요(종합인사)
    SQL.Add('        '''+ MailBody     +''',                 ');  //BODY1      메일내용
    SQL.Add('        ''''                  ,                 ');  //TAIL1      불필요(종합인사)
    SQL.Add('        '''+ ReceiveYN    +''',                 ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
    SQL.Add('        ''N''                 ,                 ');  //EAI_FLAG
    SQL.Add('        ''''                  )                 ');  //EAI_DATE

    try
      Execute;
    except
      Result := false;
      exit;
    end;
    Result := True;
  end;
*)
end;

procedure TFM_Main.FormActivate(Sender: TObject);
begin
  Hwnd := FindWindow('Tpia1031aForm','종합인사정보시스템 (인사시스템)');
  ShowWindow(Hwnd,sw_Hide);
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ShowWindow(Hwnd,sw_ShowNormal);
end;


procedure TFM_Main.BT_3080BClick(Sender: TObject);
var LSfilename :  string;
    LAarg : array[0..200] of char;
begin
  If GSempno = '' Then
  begin
    MessageDlg('선택된 자료가 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

   //Learnign Point 이력자료 조회
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;
  FM_DownLoad.PL_VersionCHK3(3, 'PTA3080B');
  FM_DownLoad.FL_UserID := GSempno;
  if (not FM_DownLoad.FL_VersionCHK ) or
     (not FileExists(GetHomeDir+'\Bin\3tier\PTA3080B.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Tbin','PTA3080B.EXE','PTA3080B',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';

    LSfilename := GetHomeDir+'\Bin\3Tier\PTA3080B.EXE ,'
                 +GSempno                +','+Passemp(cmdline,2)    +','+'@@@@@'+','
                 +Hinsa_Param(cmdline,4) +','+Hinsa_Param(cmdline,5)+','+Hinsa_Param(cmdline,6)+','
                 +Hinsa_Param(cmdline,7) +','+Hinsa_Param(cmdline,8)+','+Hinsa_Param(cmdline,9)+','
                 +Hinsa_Param(cmdline,10)+','+Hinsa_Param(cmdline,11)+','+Hinsa_Param(cmdline,12)+','
                 +Hinsa_Param(cmdline,13)+','+Hinsa_Param(cmdline,14)+','+Hinsa_Param(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;
  end;
end;

end.


