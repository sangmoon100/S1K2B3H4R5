{-------------------------------------------------------------------------------
  o 프로그램명
    프로그램명을 작성한다.
    프로그램명 : 팀장 KPI Contract 등록 - PIU5010A
  o 시스템명
    시스템명을 작성한다.
    시스템명 : 종합인사정보시스템
  o 부시스템명
    부시스템명을 작성한다.  부시스템명 : 인사/인력개발
  o 작성자
    최초 개발자 작성자의 정보를 작성한다.
    작성자 : jissi []
  o 버전
    프로그램 현재 버전을 작성한다. 버전 : 1.0
  o 작성일자
    최초 작성일자를 작성한다.      작성일자 :2010.03.19
  o 변경 이력사항
        버전   일자       작성자   변경 내용                   처리명세서 반영여부
   (예) 1.00   2010.03.19 jissi    신규 팀장 KPI Contract 등록            반영
-------------------------------------------------------------------------------}
unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, hanapass, 
  pass, registry, PDownLoad, TmaxFunc, OnEditMemo, OnEditCombo, OnInsaCommon,
  OnPopupEdit;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    Insa_Session : TTMaxSession;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Notebook1: TNotebook;
    Bt_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    OnNumberEdit2: TOnNumberEdit;
    SB_4: TOnSkinButton;
    SB_3: TOnSkinButton;
    TMaxDML: TTMaxDataSet;
    DBcommon: TTMaxDataSet;
    BT_ConYes: TOnFocusButton;
    BT_ConNO: TOnFocusButton;
    SB_Help: TStatusBar;
    E_ChangeEmp: TEdit;
    BT_Change: TButton;
    Bt_NoSayu: TOnFocusButton;
    Bt_Save: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    Bt_Print: TOnFocusButton;
    Q_Subject: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TMaxDataSet: TTMaxDataSet;
    BT_Help: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_empno1KeyPress(Sender: TObject; var Key: Char);
    procedure SB_0Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ChangeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ConYesClick(Sender: TObject);
    procedure ED_empno1Change(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure E_ChangeEmpChange(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Bt_NoSayuClick(Sender: TObject);
    procedure Bt_PrintClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  public
    { Public declarations }
    Pempno, GSempno, GSkorname : String;  //Login성명
    GSgrade   : String[10];       //등급
    GSHomeDir: string;

    Csel_SQL, Cupd_SQL  : String;
    Csel_ret, Cupd_ret  : Boolean;
    vSqlText, vExceptMan  : String;

    LGubun  : Integer;
    vRabasdate, vRabasYY, vRabasYM : String;
    vGubun, vTaskcode, vTaskname  : String;
    vE1empno,  vE1Korname         : String;
    vRvalconYN, vE1valconYN : String;
    vRcomment, vRbigo, vE1objComment, vE1Comment : String;
    vDeptname,  vPayraname  : String;

    payrafrom, payrato   : String;
    objemp1,  objemp2,  objemp3,  objemp4   : String;
    objemp5,  objemp6,  objemp7,  objemp8   : String;
    excemp1,  excemp2,  excemp3,  excemp4,  excemp5,  excemp6   : String;

    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    Workemp6, Workemp7, Workemp8, Workemp9, Workemp0 : String;

    procedure Cupd_Exec;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure InitSetup;
    procedure EnableProcess(vEnable : Boolean);
    Function  DEVDataExist : Boolean;
    Function  IDPDataExist : Boolean;
  end;

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;
  
implementation

uses PEK1040A3, PEK1040A2, UObjComm, UEmpForm, HPrintForm, UHelp;


{$R *.DFM}


function TFM_Main.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBcommon.FieldByName('SEL_DATA').AsString;
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

procedure TFM_Main.Csel_Open;
begin
  Csel_ret := False;
  with DBcommon do
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

procedure TFM_Main.Cupd_Exec;
begin
  Cupd_ret := False;
  with TMaxDML do
  begin
       ServiceName := 'PEA1060A_dml';
       Close;
       Sql.Clear;
       SQL.Text := Cupd_SQL;
       if Execute then Cupd_ret := True;
  end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
const
 ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var  reg : TRegistry;
begin
  Insa_Session.EnvFileName := GetHomeDir+'\newhana.env';
  Insa_Session.LabelName   := 'HANAROHPER';
  Insa_Session.Connect     := False;
  Insa_Session.Host        := Hinsa_Param(cmdline,10);
  Insa_Session.Port        := '9999';

  try
    Insa_Session.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  Pempno    := Hinsa_Param(cmdLine,1);
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSgrade   := Hinsa_Param(cmdLine,4);
  E_ChangeEmp.Text    := GSempno;
  E_ChangeEmp.Visible := False;
  BT_Change.Visible   := False;

  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if reg.OpenKey(ObjName,False) then
     GSHomeDir := reg.ReadString('NewHomeDir');
  reg.CloseKey;
  reg.Free;

  SB_Help.Panels[1].Text := '  종합인사시스템에 접속 완료.';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  ///프로그램 임시 종료시에 사용.  /////////////////////////////////////////
  {ShowMessage('" 팀원 Action Contract" 등록 기간이 종료되었습니다.'+#13+#13+
              '담당자에게 문의 하시기 바랍니다.    '+
  FM_Main.Close;
  Exit;  }
  //////////////////////////////////////////////////////////////////////////

  //업적평가 기준일 불러오기
  vSqlText := 'SELECT Value1                   ' +
              '  FROM pehrebas                 ' +
              ' WHERE rabasdate = ''00000000'' ' +
              '   AND gubun     = ''00''       ' +
              '   AND sgubun    = ''0001''     ';

  Csel_SQL := vSqlText;
  Csel_Open;
  vRabasdate := DBcommon.FieldByName('SEL_DATA').AsString;

  //Action contract 기준연도,월 불러오기
  vSqlText := 'SELECT Value1 ||'';''|| Value2  ' +
              '  FROM PeActbas                 ' +
              ' WHERE rabasyy   = ''0000''     ' +
              '   AND gubun     = ''00''       ' +
              '   AND sgubun    = ''0000''     ';

  Csel_SQL := vSqlText;
  Csel_Open;
  vRabasYY := Csel_gfd(1);    //vRabasYM := Csel_gfd(1)+Csel_gfd(2+
  vRabasYM := vRabasYY + '01'; //계획단계의 첨부파일을 1월에 저장한다.

  //팀원 Action contract 기준자료 불러오기
  vSqlText := 'select Value1||'';''||Value2||'';''||NVL(Value3,''ZZZZ'')||'';''||  '+
              '       NVL(Value4, ''ZZZZ'') ||'';''||NVL(Value5,''ZZZZ'')||'';''|| '+
              '       NVL(Value6, ''ZZZZ'') ||'';''||NVL(Value7,''ZZZZ'')||'';''|| '+
              '       NVL(Value8, ''ZZZZ'') ||'';''||NVL(Value9,''ZZZZ'')||'';''|| '+
              '       NVL(Value10,''ZZZZ'')                                        '+
              '  from peactbas a                                                   '+
              ' WHERE a.rabasyy  = '''+vRabasYY+'''                                '+
              '   AND a.gubun    = ''01''                                          '+
              '   AND a.sgubun   = ''0002''                                        ';
  Csel_SQL := vSqlText;
  Csel_Open;
  payrafrom := Csel_gfd(1);
  payrato   := Csel_gfd(2);
  objemp1   := Csel_gfd(3);
  objemp2   := Csel_gfd(4);
  objemp3   := Csel_gfd(5);
  objemp4   := Csel_gfd(6);
  objemp5   := Csel_gfd(7);
  objemp6   := Csel_gfd(8);
  objemp7   := Csel_gfd(9);
  objemp8   := Csel_gfd(10);

  //팀장 Action contract 기준자료 불러오기
  vSqlText := 'select NVL(Value5,''ZZZZ'')||'';''|| NVL(Value6, ''ZZZZ'') ||'';''||'+
              '       NVL(Value7,''ZZZZ'')||'';''|| NVL(Value8, ''ZZZZ'') ||'';''||'+
              '       NVL(Value9,''ZZZZ'')||'';''|| NVL(Value10,''ZZZZ'')          '+
              '  from peactbas a                                                   '+
              ' WHERE a.rabasyy  = '''+vRabasYY+'''                                '+
              '   AND a.gubun    = ''01''                                          '+
              '   AND a.sgubun   = ''0001''                                        ';
  Csel_SQL := vSqlText;
  Csel_Open;
  excemp1   := Csel_gfd(1);
  excemp2   := Csel_gfd(2);
  excemp3   := Csel_gfd(3);
  excemp4   := Csel_gfd(4);
  excemp5   := Csel_gfd(5);
  excemp6   := Csel_gfd(6);


  //Action contract 담당자 불러오기
  vSqlText := 'SELECT Value1||'';''||Value2||'';''||Value3||'';''||        ' +
              '       Value4||'';''||Value5||'';''||Value6||'';''||        ' +
              '       Value7||'';''||Value8||'';''||Value9||'';''||Value10 ' +
              '  FROM PeActbas                                             ' +
              ' WHERE rabasyy   = '''+vRabasYY+'''                         ' +
              '   AND gubun     = ''01''                                   ' +
              '   AND sgubun    = ''0003''                                 ' ;

  Csel_SQL := vSqlText;
  Csel_Open;
  Workemp1 := Csel_gfd(1);
  Workemp2 := Csel_gfd(2);
  Workemp3 := Csel_gfd(3);
  Workemp4 := Csel_gfd(4);
  Workemp5 := Csel_gfd(5);
{// SKMS팀 담당자는 이 프로그램 권한 안주려구요....
  Workemp6 := Csel_gfd(6);
  Workemp7 := Csel_gfd(7);
  Workemp8 := Csel_gfd(8);
  Workemp9 := Csel_gfd(9);
  Workemp0 := Csel_gfd(10);
}
  if copy(Gsempno,1,1) = 'D' then
  begin
       Gsempno          := Workemp1;
       E_ChangeEmp.Text := Workemp1;
  end;

  if (GSempno = Workemp1) or (GSempno = Workemp2) or (GSempno = Workemp3) or
     (GSempno = Workemp4) or (GSempno = Workemp5) or (GSempno = Workemp6) or
     (GSempno = Workemp7) or (GSempno = Workemp8) or (GSempno = Workemp9) or
     (GSempno = Workemp0) or (copy(GSempno,1,1) = 'D') then
  begin
      E_ChangeEmp.Visible := true;
      BT_Change.Visible   := true;
  end
  else
  begin
      E_ChangeEmp.Visible := false;
      BT_Change.Visible   := false;
      E_ChangeEmp.Text    := Gsempno;
  end;

//  LoginEmpChange;
  //대상자인지 결재자인지...
  vSqlText := 'SELECT empno                                                        '+
              '  FROM pehremas                                                     '+
              ' WHERE Rabasdate like '''+vrabasyy+'''||''%''                       '+
              '   AND ((e1empno = '''+E_ChangeEmp.Text+''') or                     '+
              '        (empno   = '''+E_ChangeEmp.Text+'''))                       '+
              '   AND  E1payra < '''+payrafrom+'''                                 '+
              '   AND ((payra >= '''+payrafrom+''') And (payra <= '''+payrato+'''))'+
              '   AND  (empno not in ('''+objemp1+''','''+objemp2+''',             '+
              '                       '''+objemp3+''','''+objemp4+''',             '+
              '                       '''+objemp5+''','''+objemp6+''',             '+
              '                       '''+objemp7+''','''+objemp8+''' ))           '+
              '   AND reConyn   = ''Y''                                            ';
  Csel_SQL := vSqlText;
  Csel_Open;
  if  ((DBcommon.RecordCount > 1) or  ((DBcommon.RecordCount = 1) And
       (DBcommon.FieldByName('SEL_DATA').AsString <> E_ChangeEmp.Text))) then
       LGubun := 2
  else
  if (DBcommon.RecordCount = 1) then
       LGubun := 1
  else
  if (DBcommon.RecordCount < 1) then
       LGubun := 0;

  if LGubun = 1 then InitSetup;

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.BT_ChangeClick(Sender: TObject);
begin
//  LoginEmpChange;

  if LGubun = 1 then   InitSetup;
end;

procedure TFM_Main.InitSetup;
var
  i : integer;
begin
     //대상자인지 결재자인지...
     vSqlText := 'SELECT empno                                                        '+
                 '  FROM pehremas                                                     '+
                 ' WHERE Rabasdate like '''+vrabasyy+'''||''%''                       '+
                 '   AND ((e1empno = '''+E_ChangeEmp.Text+''') or                     '+
                 '        (empno   = '''+E_ChangeEmp.Text+'''))                       '+
                 '   AND  E1payra < '''+payrafrom+'''                                 '+
                 '   AND ((payra >= '''+payrafrom+''') And (payra <= '''+payrato+'''))'+
                 '   AND  (empno not in ('''+objemp1+''','''+objemp2+''',             '+
                 '                       '''+objemp3+''','''+objemp4+''',             '+
                 '                       '''+objemp5+''','''+objemp6+''',             '+
                 '                       '''+objemp7+''','''+objemp8+''' ))           '+
                 '   AND reConyn   = ''Y''                                            ';
     Csel_SQL := vSqlText;
     Csel_Open;
     if  ((DBcommon.RecordCount > 1) or  ((DBcommon.RecordCount = 1) And
          (DBcommon.FieldByName('SEL_DATA').AsString <> E_ChangeEmp.Text))) then
          LGubun := 2
     else
     if (DBcommon.RecordCount = 1) then
          LGubun := 1
     else
     if (DBcommon.RecordCount < 1) then
          LGubun := 0;


     if   (Lgubun = 2)  then
     begin
          Ed_empno.ButtonWidth := 24;
//          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
          Ed_empno.Text := Fm_EmpForm.empno;
     end
     else
     begin
          Ed_empno.ButtonWidth := 0;
          Ed_empno.Text := E_ChangeEmp.Text;
     end;

     vSqlText := 'select a.empno                 ||'';''|| a.korname      ||'';''||  ' +
                 '       a.e1empno               ||'';''|| a.e1korname    ||'';''||  ' +
                 '       nvl(b.rvalconyn, ''N'') ||'';''|| b.rvalcondate  ||'';''||  ' +
                 '       nvl(b.e1valconyn,''N'') ||'';''|| b.e1valcondate ||'';''||  ' +
                 '       b.RComment              ||'';''|| b.RBigo        ||'';''||  ' +
                 '       b.e1objComment          ||'';''|| b.e1Comment    ||'';''||  ' +
                 '       c.codename              ||'';''|| e.DEPTNAME     ||'';''||  ' +
                 '       d.codename              ||'';''|| a.payra        A          ' +
                 '  from pehremas a, peActfile b, pyccode c, pyccode d, pycdept e    ' +
                 ' where a.empno       = b.empno(+)                                  ' +
                 '   AND a.Reconyn     = ''Y''                                       ' +
                 '   and a.empno       = '''+ Ed_empno.Text +'''                     ' +
                 '   and a.rabasdate   = '''+vRabasDate+'''                          ' +
                 '   and b.rabasym(+)  = '''+vRabasym+'''                            ' +
                 '   and a.PAYCL = c.codeno(+) AND c.codeid(+)=''I112''              ' +
                 '   and a.PAYRA = d.codeno(+) AND d.codeid(+)=''I113''              ' +
                 '   and a.ORGNUM= e.ORGNUM AND a.DEPTCODE = e.DEPTCODE              ' ;

     Csel_SQL   := vSqlText;
     Csel_Open;

     ed_empno.Text              := Csel_gfd(1);
     L_korname.ValueCaption     := Csel_gfd(2);
     vE1empno                   := Csel_gfd(3);
     vE1korname                 := Csel_gfd(4);
     vRvalconyn                 := Csel_gfd(5);
     //vRvalcondate               := Csel_gfd(6);
     vE1valconyn                := Csel_gfd(7);
     //vEe1valcondate             := Csel_gfd(8);
     vRComment                  := Csel_gfd(9);
     vRBigo                     := Csel_gfd(10);
     vE1objComment              := Csel_gfd(11);
     vE1Comment                 := Csel_gfd(12);
     L_payclname.ValueCaption   := Csel_gfd(13);
     L_deptname.ValueCaption    := Csel_gfd(14);
     vdeptname                  := Csel_gfd(14);
     L_payraname.ValueCaption   := Csel_gfd(15);

     // 대상자가 아닌인 경우.....
     if  (Lgubun = 0) then
     begin
          MessageDlg('팀원 Action Contract 등록 대상자가 아닙니다. ' + #13+#13+
                     '프로그램을 종료합니다.', mtError, [mbOK],0);
          BT_ExitClick(Bt_Exit);
     end;

      // 반려인 경우.....
     if (vE1valconyn = 'R') then
     begin
        MessageDlg('팀장님께서 [팀원 Action Contract 등록]을 반려하였습니다. ' + #13+#13+
                   '다시 [팀원 Action Contract 등록]을 하십시요.', mtInformation, [mbOK],0);
        Bt_NoSayuClick(Bt_NoSayu);
        Bt_NoSayu.Visible := True;
     end
     else
        Bt_NoSayu.Visible := false;

     // 결재상신 안했을 경우
     if (ed_empno.Text = E_ChangeEmp.Text ) then
     begin
          if (vRvalconyn <> 'Y') then
          begin
               Bt_Confirm.Enabled := true;
               Bt_Save.Enabled    := true;
               BT_ConYes.Visible  := false;
               BT_ConNo.Visible   := false;
          end
          /////////////////////////////////////////////////////////////////////////////////
          else
          begin
               MessageDlg('[팀원 Action Contract 등록]을 완료하셨습니다.' + #13+#13+
                          '내용만 확인하실 수 있습니다.', mtInformation, [mbOK],0);
               Bt_Confirm.Enabled := false;
               Bt_Save.Enabled    := false;
               BT_ConYes.Visible  := false;
               BT_ConNo.Visible   := false;
          end;
     end
     else
     begin
          if (vE1valconyn <> 'Y') then
          begin
               Bt_Confirm.Enabled := false;
               Bt_Save.Enabled    := false;
               BT_ConYes.Visible  := true;
               BT_ConNo.Visible   := true;
          end
          /////////////////////////////////////////////////////////////////////////////////
          else
          begin
               Bt_Confirm.Enabled := false;
               Bt_Save.Enabled    := false;
               BT_ConYes.Visible  := false;
               BT_ConNo.Visible   := false;
          end;
     end;

  //UTF 대상자 생산성향상과제는 미등록 하도록.
  vSqlText := 'SELECT Count(*)                                                             '+
              '  FROM pehremas                                                             '+
              ' WHERE Rabasdate like '''+vrabasyy+'''||''%''                               '+
              '   AND empno =  '''+ Ed_empno.text +'''                                     '+
              '   AND ((empno   in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',       '+
              '                     '''+excemp4+''','''+excemp5+''','''+excemp6+''' )) or  '+
              '        (e1empno in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',       '+
              '                     '''+excemp4+''','''+excemp5+''','''+excemp6+''' ))  )  ';

  Csel_SQL := vSqlText;
  Csel_Open;

  NoteBook1.ActivePage := 'P1';
  SB_3.Enabled         := True;
  vExceptMan := 'N';
  if   DBcommon.FieldByName('SEL_DATA').AsInteger >= 1 then
  begin
       vExceptMan := 'Y';
       SB_3.Enabled := false;
       SB_0Click(SB_4);
  end
  else SB_0Click(SB_3);
end;

procedure TFM_Main.ED_empno1KeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(13) then
  begin
       ED_empno.Text := UpperCase(ED_empno.Text);
       Key := #0;
  end;
end;

procedure TFM_Main.ED_empno1Change(Sender: TObject);
begin
  if (ED_empno.Enabled) and (Trim(Ed_empno.Text ) <> '') then
  begin
       InitSetup;
  end;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.EnableProcess(vEnable : Boolean);
begin
  BT_Confirm.Enabled  := vEnable;
//  if SubForm1 <> nil then SubForm1.Bt_FileApp.Enabled  := vEnable;
  if SubForm1 <> nil then SubForm1.BT_Save.Enabled     := vEnable;
  if SubForm2 <> nil then SubForm2.B_Save1.Enabled     := vEnable;
  if SubForm2 <> nil then SubForm2.B_Add1.Enabled      := vEnable;
  if SubForm2 <> nil then SubForm2.B_del1.Enabled      := vEnable;
end;

procedure TFM_Main.SB_0Click(Sender: TObject);
begin
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;

  if TOnSkinButton(Sender).Name = 'SB_4' then
  begin
       if (vExceptMan <>'Y') and (SubForm1.BT_Save.Enabled) and (SubForm1.IsDataModified) then
       begin
            MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
            SB_3.BtnDown  := True;
            System.Exit;
       end;
  end;

  if ((LGubun = 1) and (vRvalconyn <> 'Y')) then
      Bt_Save.Visible  := true
  else
      Bt_Save.Visible  := False;

  if TOnSkinButton(Sender).Name = 'SB_3' then
      Bt_Save.Caption  := '생산성향상과제 저장'
  else
      Bt_Save.Caption  := 'IDP 저장' ;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

  if (vRvalconYN = 'Y') then EnableProcess(False);
end;

procedure TFM_Main.Notebook1PageChanged(Sender: TObject);
begin
  if NoteBook1.ActivePage = 'P3' then
  begin
     try
       SubForm1 := TSubForm1.Create(nil); // 생산성 향상 과제
       SubForm1.Parent      := Notebook1;
       SubForm1.WindowState := wsMaximized;
       SubForm1.Show;
     except
       begin
           if (SubForm1 <> nil) or Assigned(SubForm1) then
           begin
                SubForm1.Free;
                SubForm1 := nil;
           end;
       end;
     end;
  end
  else
  if NoteBook1.ActivePage = 'P4' then
  begin
     try
       SubForm2 := TSubForm2.Create(nil); // 솔선수범 & L/H/C
       SubForm2.Parent      := Notebook1;
       SubForm2.WindowState := wsMaximized;
       SubForm2.IDP_ReadData;
       if SubForm2.Q_IDP.RecordCount = 0 then
       begin
           if LGubun = 1 then
           MessageBox(handle,'본인의 업무목표 등록자료가 결재되지 않았습니다.'+#13#13+
                             '결재완료 후에 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING)
           else if LGubun = 2 then
           MessageBox(handle,'해당 팀원의 업무목표 등록자료가 결재되지 않았습니다.'+#13#13+
                             '업무목표를 먼저 결재완료 후에 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
           SB_0Click(SB_3);
           System.Exit;
       end;
       SubForm2.Show;
     except
       begin
           if (SubForm2 <> nil) or Assigned(SubForm2) then
           begin
                SubForm2.Free;
                SubForm2 := nil;
           end;
       end;
     end;
  end;
end;

Function TFM_Main.DEVDataExist : Boolean;
begin
  Result := True;
  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       ClearFieldInfo;
       AddField('CNT'     , ftString, 100);
       AddField('Field2'  , ftString, 100);
       AddField('Field3'  , ftString, 100);
       AddField('Field4'  , ftString, 100);
       AddField('Field5'  , ftString, 100);

       Sql.Clear;
       Sql.Add('select Count(empno) Cnt, ''2'', ''3'', ''4'', ''5''               ');
       Sql.Add('  from peAct1mas                                                  ');
       Sql.Add(' Where rabasyy = '''+ FM_Main.vRabasYY      +'''                  ');
       Sql.Add('   And empno   = '''+ FM_Main.Ed_empno.Text +'''                  ');
       Open;    //   Edit1.Text := sql.text;

       if Fields[0].AsInteger = 0 then
       begin
            Result := False;
       end
       else
       begin
            Result := true;
       end;
  end;
end;

Function TFM_Main.IDPDataExist : Boolean;
begin
  Result := True;
  with TMaxDataSet do
  begin
{
       AddField('GUBUN'     , ftString, 100);
       AddField('Taskcode'  , ftString, 100);
       AddField('Taskname'  , ftString, 100);
       AddField('CNT'       , ftString, 100);
       AddField('Field5'    , ftString, 100);

       Sql.Clear;
       Sql.Add('select a.gubun, a.Taskcode, a.Taskname, Count(b.empno) Cnt, ''5'' '+
       Sql.Add(' from (Select ''공동'' GUBUN, Taskcode, Taskname                  '+
       Sql.Add('         From pehreaim_basdet b                                   '+
       Sql.Add('        Where rabasdate = '''+FM_Main.vRabasdate   +'''           '+
       Sql.Add('          And empno     = '''+FM_Main.Ed_empno.Text+'''           '+
       Sql.Add('          and (select E1PRJCONYN from pehremas                    '+
       Sql.Add('                where rabasdate = b.rabasdate                     '+
       Sql.Add('                  and empno     = b.empno)     = ''Y''            '+
       Sql.Add('        Union                                                     '+
       Sql.Add('       Select ''개별'' GUBUN, SEQNO, PROPELTASK                   '+
       Sql.Add('         From pehreaim_det a                                      '+
       Sql.Add('        Where rabasdate = '''+FM_Main.vRabasdate +'''             '+
       Sql.Add('          And empno     = '''+FM_Main.Ed_empno.Text+'''           '+
       Sql.Add('          And seqno    <> ''99''                                  '+
       Sql.Add('          and (select E1PRJCONYN from pehremas                    '+
       Sql.Add('                where rabasdate = a.rabasdate                     '+
       Sql.Add('                  and empno     = a.empno)     = ''Y''   )        '+
       Sql.Add('      ) a, peact1idp b                                             '+
       Sql.Add(' where a.gubun    = b.gubun(+)                                    '+
       Sql.Add('   and a.Taskcode = b.Taskcode(+)                                 '+
       Sql.Add(' Group  by a.gubun, a.Taskcode, a.Taskname                        '+
       Open;
}
       ServiceName := 'HINSA_select';
       Close;
       ClearFieldInfo;
       AddField('CNT'     , ftString, 100);
       AddField('Field2'  , ftString, 100);
       AddField('Field3'  , ftString, 100);
       AddField('Field4'  , ftString, 100);
       AddField('Field5'  , ftString, 100);

       Sql.Clear;
       Sql.Add('select Count(empno) Cnt, ''2'', ''3'', ''4'', ''5''               ');
       Sql.Add('  from peact1idp                                                   ');
       Sql.Add(' Where rabasyy = '''+ FM_Main.vRabasYY      +'''                  ');
       Sql.Add('   And empno   = '''+ FM_Main.Ed_empno.Text +'''                  ');
       Open;    //   Edit1.Text := sql.text;

       if Fields[0].AsInteger = 0 then
       begin
            Result := False;
       end
       else
       begin
            Result := true;
       end;
  end;
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
begin
  if (vExceptMan <> 'Y') then
  begin
       if (not DEVDataExist)  then
       begin
            MessageDlg('생산성 향상 과제에 등록된 내용이 없습니다.'+#13#13+
                       '최소 하나 이상의 Action Plan을 입력하십시오.',mtError,[mbOK],0);
            SB_0Click(SB_3);
            System.Exit;;
       end
       else
            SubForm1.Bt_SaveClick(Sender);
  end;
  
  if not IDPDataExist then
  begin
       MessageBox(handle,'IDP는 하나 이상의 역량개발자료가 등록되어야 합니다.'+#13#13+
                         '확인 후에 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       System.Exit;
  end;

  if  Trim(vRComment) = '' then
  begin
       MessageBox(handle,'"중기(3년내) 경력개발 계획"에 입력된 내용이 없습니다. '+#13#13+
                         '확인 후에 "IDP 저장"버튼을 눌러 내용을 저장하신 후 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       System.Exit;
  end;

  if MessageDlg('결재상신을 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                '결재상신을 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  ////////////테이블에 Filename 1월에 저장.
  vSqlText := 'SELECT 1                                  '+
              '  FROM peactfile                          '+
              ' WHERE RabasYM = '''+ vRabasYM       +''' '+
              '   And Empno   = '''+ Ed_empno.Text  +''' ';
  Csel_SQL := vSqlText;
  Csel_Open;

  //팀원 결재상신여부 저장.
  if DBcommon.RecordCount = 0 then
  begin
       vSqlText := 'Insert into peactfile (RabasYM, Empno,                     '+
                   '          rvalconyn, rvalcondate, E1valconyn               '+
                   '          rComment,  RBigo,                                '+
                   '          writeemp, writetime                   )          '+
                   ' Values (                                                  '+
                   '          '''+  vRabasYM         +''' ,                    '+
                   '          '''+  Ed_empno.Text    +''' ,                    '+
                   '          ''Y''                       ,                    '+
                   '          TO_CHAR(SYSDATE,''YYYYMMDD''),                   '+
                   '          ''N''                       ,                    '+
                   '          '''+  vRComment        +''' ,                    '+
                   '          '''+  vRBigo           +''' ,                    '+
                   '          '''+  GSempno          +''' ,                    '+
                   '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')    )       ';

  end
  else
  begin
       vSqlText := 'update peactfile                                           '+
                   '   set rvalconyn   = ''Y'',                                '+
                   '       rvalcondate = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                   '       e1valconyn  = ''N'',                                '+
                   '       rComment    = '''+  vRComment    +''' ,             '+
                   '       RBigo       = '''+  vRBigo       +''' ,             '+
                   '       writeemp    = '''+  GSempno      +''' ,             '+
                   '       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                   ' WHERE RABASYM     = '''+vRabasYM       +'''               '+ //01월로 지정하여
                   '   AND empno       = '''+Ed_empno.Text  +'''               ';
  end;
  Cupd_SQL := vSqltext;   // edit1.text := vSqltext;
  Cupd_Exec;

  if Cupd_ret then
  begin
       vRvalconyn := 'Y';
       Bt_Confirm.Enabled := false;
       Bt_NoSayu.Visible  := false;
       Bt_Save.Visible    := false;
       MessageDlg('결재상신 작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);
       //////////////////////////////////////////////////////////////////////////////
       //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
       SendProgID  := 'PEK1040A';
       SendEmpno   := Ed_empno.Text;
       RcveEmpno   := vE1empno;
       MailSubject := '[결재요청] Action Contract 작성을 완료하였습니다.';
       MailBody    := 'Action Contract 작성을 완료하였습니다.'+#13+#13+
                      '결재 바랍니다.'+#13+#13+
                      '[결재화면위치 안내] : 종합인사시스템 - 평가 - Action Contract - 팀원Action Contract 등록/결재';
       ReceiveYN   := 'N';

       if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       begin
            MessageDlg(' 결재상신 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
       end
       else MessageDlg(' 결재상신 메일전송을 성공 하였습니다...',mtInformation, [mbOk], 0);
       //////////////////////////////////////////////////////////////////////////////
  end
  else Exit;

  BT_Exit.SetFocus;
end;

procedure TFM_Main.BT_ConYesClick(Sender: TObject);
var vConStr, vConYN : String;
begin
  if MessageDlg('해당 팀원의 등록내역에 대해 '+ TOnFocusButton(Sender).Caption + ' 하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;


  if      TOnFocusButton(Sender).Caption = '결재' then
  begin
       if  Trim(vE1Comment) = '' then
       begin
           MessageBox(handle,'"팀장 의견 및 지원사항"에 입력된 내용이 없습니다. '+#13#13+
                             '확인 후에 결재하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
           SB_0Click(SB_4);
           System.Exit;
       end;
       //결재여부
       vSqlText := 'update peactfile                                            '+
                   '   set E1valconyn   = ''Y'',                                '+
                   '       E1valcondate = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                   '       E1ObjComment = '''+ vE1ObjComment +''',              '+
                   '       E1Comment    = '''+ vE1Comment    +''',              '+
                   '       E1Empno      = '''+ vE1empno      +''',              '+
                   '       Writeemp     = '''+ GSempno       +''',              '+
                   '       Writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                   ' WHERE RABASYM      = '''+ vRabasYM      +'''               '+ //01월로 지정하여
                   '   AND empno        = '''+ ED_empno.Text +'''               ';
       Cupd_SQL := vSqltext;
       Cupd_Exec;

       if Cupd_ret then
       begin
            MessageDlg('작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);
            vE1valconyn := 'Y';
       end
       else MessageDlg('작업을 실패 하였습니다.', mtInformation, [mbOK], 0);
  end
  else if TOnFocusButton(Sender).Caption = '반려' then
  begin
       try
            ObjCommForm := TObjCommForm.Create(nil); // 반려사유 등록
            ObjCommForm.Show;
       except
            begin
                 if (ObjCommForm <> nil) or Assigned(ObjCommForm) then
                 begin
                      ObjCommForm.Free;
                      ObjCommForm := nil;
                 end;
            end;
       end;
  end
  else Exit;

  BT_ConYes.Enabled := False;
  BT_ConNO.Enabled  := False;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TMaxDML do
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
            Result := False;
            exit;
       end;
       Result := True;
  end;
end;

procedure TFM_Main.Bt_SaveClick(Sender: TObject);
begin
     if Notebook1.ActivePage = 'P3' then
     begin
          SubForm1.Bt_SaveClick(SubForm1.Bt_Save);
     end
     else
     if Notebook1.ActivePage = 'P4' then
     begin
          SubForm2.Bt_SaveClick(SubForm2.Bt_Save);
     end;
end;

procedure TFM_Main.E_ChangeEmpChange(Sender: TObject);
begin
     Ed_empno.Text            := '';
     L_korname.ValueCaption   := '';
     L_Deptname.ValueCaption  := '';
     L_payclname.ValueCaption := '';
     L_payraname.ValueCaption := '';
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          Ed_empno.Text             := Fm_EmpForm.empno;
          L_korname.ValueCaption    := Fm_EmpForm.Korname;
          L_deptname.ValueCaption   := Fm_EmpForm.deptname;
          L_payclname.ValueCaption  := Fm_EmpForm.payclname;
          L_payraname.ValueCaption  := Fm_EmpForm.payraname;
          vE1empno                  := Fm_EmpForm.e1empno;
          vRvalConyn                := Fm_EmpForm.Conyn;
          vE1valConyn               := Fm_EmpForm.Finyn;
          InitSetup;
     end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm;
end;

procedure TFM_Main.Bt_NoSayuClick(Sender: TObject);
begin
     try
         ObjCommForm := TObjCommForm.Create(nil);
         ObjCommForm.E_e1ObjComment.Text     :=  vE1objComment;
         ObjCommForm.E_e1ObjComment.ReadOnly := True;
         ObjCommForm.SF_Main.Caption.Text    := '반려 사유';
         ObjCommForm.Pa_Title.Caption        := '반 려  사 유';
         ObjCommForm.B_Save.Caption          := ' 반려사유 닫기 ';

         ObjCommForm.Show;
     except
          begin
               if (ObjCommForm <> nil) or Assigned(ObjCommForm) then
               begin
                    ObjCommForm.Free;
                    ObjCommForm := nil;
               end;
          end;
     end;
end;

procedure TFM_Main.Bt_PrintClick(Sender: TObject);
begin
  vSqlText := 'SELECT empno                                   '+
              '  FROM pehremas                                '+
              ' WHERE Rabasdate like '''+vRabasyy+'''||''%''  '+
              '   AND empno        = '''+Ed_empno.Text+'''    ';

  Csel_SQL := vSqlText;
  Csel_Open;

  with FM_Main.TMaxDataSet do
  begin
       ServiceName := 'PEK1040A_sel1';
       Close;
       ClearFieldInfo;
       AddField('RABASYY'  , ftString,   4);
       AddField('EMPNO'    , ftString,   4);
       AddField('GUBUN'    , ftString,   4);
       AddField('TASKCODE' , ftInteger, 10);
       AddField('TASKNAME' , ftString, 100);
       AddField('ABLENO'   , ftInteger, 10);
       AddField('ABLENAME' , ftString,  20);
       AddField('ABLESUM'  , ftString, 100);
       AddField('PREVIOUS' , ftString,   2);
       AddField('DEVMETHOD', ftString,  20);
       AddField('DEVPLAN'  , ftString, 200);
       AddField('BIGO'     , ftString, 100);
       ClearParamInfo;

       Sql.Clear;
       Sql.Add('Select rabasyy, empno, gubun, taskcode, taskname,                    ');
       Sql.Add('       ableno, ablename, ablesum, previous, devmethod, devplan, bigo ');
       Sql.Add('  From peact1idp                                                      ');
       Sql.Add(' Where rabasyy = '''+ FM_Main.vRabasYY      +'''                     ');
       Sql.Add('   And empno   = '''+ FM_Main.Ed_empno.Text +'''                     ');
       Sql.Add(' order by Gubun desc, taskcode, ableno                               ');
       Open;

       SQL.Text := vSqlText;
       Open;
  end;

  PrintForm := TPrintForm.Create(Self);
  PrintForm.QuickRepPrn1.Preview;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

end.
