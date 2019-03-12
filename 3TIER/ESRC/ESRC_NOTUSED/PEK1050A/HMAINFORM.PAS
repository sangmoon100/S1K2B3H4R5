{-------------------------------------------------------------------------------
  o 프로그램명
    프로그램명을 작성한다.
    프로그램명 : 팀장 Action Contract 등록 - PEK1030A
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
   (예) 1.00   2010.03.19 jissi    신규 팀장 Action Contract 등록            반영
-------------------------------------------------------------------------------}
unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, hanapass, Func,
  pass, registry, PDownLoad, TmaxFunc, OnEditMemo, OnEditCombo, QuickRpt,
  Qrctrls, Psock, NMFtp, OnPopupEdit;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    Insa_Session : TTMaxSession;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Notebook1: TNotebook;
    DBcommon: TTMaxDataSet;
    TMaxDML_HInsa: TTMaxDataSet;
    Bt_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    L_korname: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    SB_3: TOnSkinButton;
    SB_4: TOnSkinButton;
    SB_5: TOnSkinButton;
    SB_6: TOnSkinButton;
    Q_Subject: TTMaxDataSet;
    TMaxDataSet: TTMaxDataSet;
    BT_ConYes: TOnFocusButton;
    BT_ConNO: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    Bt_Save: TOnFocusButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    E_ChangeEmp: TEdit;
    BT_Change: TButton;
    Edit1: TEdit;
    BT_Delete: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;

    procedure FormCreate(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_0Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ChangeClick(Sender: TObject);
    procedure BT_ConYesClick(Sender: TObject);
    procedure ED_empnoCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure E_ChangeEmpChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_DeleteClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
  private
    { Private declarations }
    GSHomeDir  : string;
    LSfilename : string;
    LAarg : array[0..200] of char;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  public
    { Public declarations }
    GSempno   : String;     //Login사번
    GSkorname : String;     //Login성명
    GSgrade   : String[10]; //등급
    Pempno    : String;     //Login사번
    PHost, PUserID, PPassword      : String;
    ConCount  : String;

    Csel_SQL  : String;
    Csel_ret  : Boolean;
    Cupd_SQL  : String;
    Cupd_ret  : Boolean;

    LRabasYY   : string;
    LRabasYM   : String;
    LRabasMM   : String;
    LGubun     : Integer;

    Le1empno      : string; //1차평가자 사번
    Le1korname    : string; //1차평가자 이름
    Lrvalconyn    : string;
    Le1valconyn   : String;
    LRcomment     : String;
    LRbigo        : String;
    Le1objComment : String;
    LE1Comment    : String;
    Lpayra        : String;

    vServerFileName, vFullPath, vFilename  : String;
    vFTPsuccess : Boolean;
    payrafrom, payrato   : String;
    StRabasmm, EdRabasmm : Integer;
    Rabasname :String;
    objemp1,  objemp2   : String;
    excemp1,  excemp2,  excemp3,  excemp4,  excemp5,  excemp6   : String;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    Workemp6, Workemp7, Workemp8, Workemp9, Workemp0 : String;
    mdeptname : String;                 //인사팀 부서명

    procedure Cupd_Exec;
    procedure Csel_Open;
    procedure InitSetup;
    function  Csel_gfd(p_loc: Integer): String;

  end;

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;
  gS_final_comp : string;

implementation

uses USubForm1, USubForm2, UEmpForm, USubForm3, UObjComm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Edit1.Visible := False;
  if Copy(Hinsa_Param(cmdLine,4),1,1) = 'A' then Edit1.Visible := True;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var  i      : integer;
     TSheet : TTabSheet;
begin
  gS_final_comp := 'T';

  Application.ProcessMessages;

  GSempno       := Hinsa_Param(cmdLine,1);
  GSkorname     := Hinsa_Param(cmdLine,2);
  GSgrade       := Hinsa_Param(cmdLine,4);
  Pempno        := Hinsa_Param(cmdLine,1);

  Insa_Session.EnvFileName := GetHomeDir+'\newhana.env';
  Insa_Session.LabelName   := 'HANAROHPER';
  Insa_Session.Connect     := False;
  Insa_Session.Host        := Hinsa_Param(cmdline,10);
  Insa_Session.Port        := '9999';

  PHost     := passEmp(cmdline,10);
  PUserID   := PassEmp(cmdline,11);
  PPassword := PassEmp(cmdline,12);

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

  //기준연도, 기준연월 불러오기
  Csel_SQL := 'SELECT Value1||'';''|| Value2 ' +
              '  FROM peActbas               ' +
              ' WHERE rabasyy   = ''0000''   ' +
              '   AND gubun     = ''00''     ' +
              '   AND sgubun    = ''0000''   ';
  Csel_Open;
  LRabasYY := Csel_gfd(1);
  LRabasYM := Csel_gfd(1)+Csel_gfd(2);
  LRabasMM := Csel_gfd(2);

  //점검시작월/분기, 종료월/분기 불러오기
  Csel_SQL := 'SELECT Value1||'';''|| Value2||'';''||Value3 ' +
              '  FROM peActbas               ' +
              ' WHERE rabasyy   = '''+Lrabasyy+'''   ' +
              '   AND gubun     = ''01''     ' +
              '   AND sgubun    = ''0004''   ';
  Csel_Open;
  StRabasmm := StrtoInt(Csel_gfd(1));
  EdRabasmm := StrtoInt(Csel_gfd(2));
  Rabasname := Csel_gfd(3);

  for i := 1 to Strabasmm-1 do
  begin
       TSheet := FindComponent('TabSheet'+inttoStr(i)) as TTabSheet;
       TSheet.Caption := '['+inttoStr(i)+ Rabasname+']';
       TSheet.TabVisible := false;
  end;

  for i := Strabasmm to Edrabasmm do
  begin
       TSheet := FindComponent('TabSheet'+inttoStr(i)) as TTabSheet;
       TSheet.Caption := '['+inttoStr(i)+ Rabasname+']';
       TSheet.TabVisible := true;
  end;

  if Edrabasmm < 12 then
  begin
       for i := Edrabasmm+1 to 12 do
       begin
            TSheet := FindComponent('TabSheet'+inttoStr(i)) as TTabSheet;
            TSheet.Caption := '['+inttoStr(i)+ Rabasname+']';
            TSheet.TabVisible := false;
       end;
  end;

  //팀장작성대상자 기준 불러오기
  Csel_SQL := 'select Value1||'';''||Value2||'';''||Value3||'';''||Value4||'';''||'+
              '       Nvl(Value5,''ZZZZ'')||'';''||Nvl(Value6, ''ZZZZ'')||'';''|| '+
              '       Nvl(Value7,''ZZZZ'')||'';''||Nvl(Value8, ''ZZZZ'')||'';''|| '+
              '       Nvl(Value9,''ZZZZ'')||'';''||Nvl(Value10,''ZZZZ'')          '+
              '  from peactbas a                                                  '+
              ' WHERE a.rabasyy = '''+Lrabasyy+'''                                '+
              '   AND a.gubun   = ''01''                                          '+
              '   AND a.sgubun  = ''0001''                                        ';
  Csel_Open;
  payrafrom := Csel_gfd(1);
  payrato   := Csel_gfd(2);
  objemp1   := Csel_gfd(3);
  objemp2   := Csel_gfd(4);
  excemp1   := Csel_gfd(5);
  excemp2   := Csel_gfd(6);
  excemp3   := Csel_gfd(7);
  excemp4   := Csel_gfd(8);
  excemp5   := Csel_gfd(9);
  excemp6   := Csel_gfd(10);

  //Action Contract 담당자 불러오기
  Csel_SQL := 'SELECT Value1||'';''||Value2||'';''||Value3       ' +
              '       ||'';''||Value4||'';''||Value5||'';''||    ' +
              '       Value6||'';''||Value7||'';''||Value8       ' +
              '       ||'';''||Value9||'';''||Value10            ' +
              '  FROM peActbas                                   ' +
              ' WHERE rabasyy   = '''+LRabasYY+'''               ' +
              '   AND gubun     = ''01''                         ' +
              '   AND sgubun    = ''0003''                       ' ;
  Csel_Open;
  Workemp1 := Csel_gfd(1);
  Workemp2 := Csel_gfd(2);
  Workemp3 := Csel_gfd(3);
  Workemp4 := Csel_gfd(4);
  Workemp5 := Csel_gfd(5);
  Workemp6 := Csel_gfd(6);
  Workemp7 := Csel_gfd(7);
  Workemp8 := Csel_gfd(8);
  Workemp9 := Csel_gfd(9);
  Workemp0 := Csel_gfd(10);

  //최초 등록완료자 불러오기
  Csel_SQL := 'select empno from peactfile a                    ' +
              ' where rabasym  = '''+Lrabasyy+'''||''01''       ' +
              '   and E1VALCONYN =''Y''                         ' +
              '   and rownum = 1                                ' ;

  Csel_Open;
  E_ChangeEmp.Text := DBcommon.FieldByName('SEL_DATA').AsString;

  //인사팀 부서명 불러오기
  Csel_SQL := 'SELECT Value2                   ' +
              '  FROM pimvari                  ' +
              ' WHERE gubun     = ''R0''       ' +
              '   AND sgubun    = ''0001''     ';
  Csel_Open;
  Mdeptname := DBcommon.FieldByName('SEL_DATA').AsString;

  if (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
     (Pempno = Workemp4) or (Pempno = Workemp5) or (Pempno = Workemp6) or
     (Pempno = Workemp7) or (Pempno = Workemp8) or (Pempno = Workemp9) or
     (Pempno = Workemp0) or (copy(Pempno,1,1) = 'D') then
  begin
      E_ChangeEmp.Visible := true;
      BT_Change.Visible   := true;
      Gsempno             := E_ChangeEmp.Text;
  end
  else
  begin
      E_ChangeEmp.Visible := false;
      BT_Change.Visible   := false;
      E_ChangeEmp.Text    := Gsempno;
  end;

  ///프로그램 임시 종료시에 사용.  /////////////////////////////////////////
  {ShowMessage('"팀장 Action Contract 등록 및 결재" 기간이 종료되었습니다.'+#13+#13+
               '담당자에게 문의 하시기 바랍니다.    ');
  FM_Main.Close;
  Exit;  }
  //////////////////////////////////////////////////////////////////////////
  PageControl1.ActivePage.PageIndex := strtoint(LRabasMM)-1;

    //결재할 팀장의 수...
  Csel_SQL := 'SELECT E1empno||'';''||Count(empno)                                      ' +
             '  FROM pehremas                                                          ' +
             ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
             '   And reconyn   = ''Y''                                                 ' +
             '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
             '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
             '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
             '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' +
             '   AND E1empno   = '''+E_ChangeEmp.Text+'''                              ' +
             ' group by E1empno                                                        ' ;
  Csel_Open;
  ConCount   := Csel_gfd(2);

    //대상자인지 결재자인지...
  Csel_SQL := 'SELECT Count(*)                                                          ' +
              '  FROM pehremas                                                          ' +
              ' WHERE Rabasdate like '''+LRabasYY+'''||''%''                            ' +
              '   AND Reconyn  = ''Y''                                                  ' +
              '   AND ((e1empno='''+E_ChangeEmp.Text+''') or                            ' +
              '        (empno  ='''+E_ChangeEmp.Text+'''))                              ' +
              '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
              '        (empno = '''+objemp1+''') or (empno = '''+objemp2+'''))          ' +
              '   AND  (empno not in ('''+excemp1+''','''+excemp2+''',                  ' +
              '                       '''+excemp3+''','''+excemp4+''',                  ' +
              '                       '''+excemp5+''','''+excemp6+'''))                 ' ;
  Csel_Open;
  if   DBcommon.FieldByName('SEL_DATA').AsInteger > 1 then
  begin
       LGubun := 2;
       Ed_empno.ButtonWidth := 24;
       Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
  end
  else
  if   ConCount = '1' then
  begin
       LGubun := 2;
       Ed_empno.ButtonWidth := 24;
       Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
  end
  else
  begin
       LGubun := DBcommon.FieldByName('SEL_DATA').AsInteger;
       Ed_empno.ButtonWidth := 0;
       Ed_empno.Text := E_ChangeEmp.Text;
  end;

  if  LGubun = 1 then    InitSetup;

  // 대상자가 아닌인 경우.....
  if  (Lgubun = 0) then
  begin
       MessageDlg('팀장 Action Contract 등록 대상자가 아닙니다. ' + #13+#13+
                  '프로그램을 종료합니다.', mtError, [mbOK],0);
       BT_ExitClick(Bt_Exit);
  end;
end;

procedure TFM_Main.InitSetup;
const
  ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
begin
  //결재할 팀장의 수...
  Csel_SQL := 'SELECT E1empno||'';''||Count(empno)                                      ' +
             '  FROM pehremas                                                          ' +
             ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
             '   And reconyn   = ''Y''                                                 ' +
             '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
             '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
             '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
             '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' +
             '   AND E1empno   = '''+E_ChangeEmp.Text+'''                              ' +
             ' group by E1empno                                                        ' ;
  Csel_Open;
  ConCount   := Csel_gfd(2);

  //대상자인지 결재자인지...
  Csel_SQL := 'SELECT Count(*)                                                          ' +
              '  FROM pehremas                                                          ' +
              ' WHERE Rabasdate like '''+LRabasYY+'''||''%''                            ' +
              '   AND Reconyn  = ''Y''                                                  ' +
              '   AND ((e1empno='''+E_ChangeEmp.Text+''') or                            ' +
              '        (empno  ='''+E_ChangeEmp.Text+'''))                              ' +
              '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
              '        (empno = '''+objemp1+''') or (empno = '''+objemp2+'''))          ' +
              '   AND  (empno not in ('''+excemp1+''','''+excemp2+''',                  ' +
              '                       '''+excemp3+''','''+excemp4+''',                  ' +
              '                       '''+excemp5+''','''+excemp6+'''))                 ' ;
  Csel_Open;
  if   DBcommon.FieldByName('SEL_DATA').AsInteger > 1 then
  begin
       LGubun := 2;
       Ed_empno.ButtonWidth := 24;
       Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
  end
  else
  if   ConCount = '1' then
  begin
       LGubun := 2;
       Ed_empno.ButtonWidth := 24;
       Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
  end
  else
  begin
       LGubun := DBcommon.FieldByName('SEL_DATA').AsInteger;
       Ed_empno.ButtonWidth := 0;
       Ed_empno.Text := E_ChangeEmp.Text;
  end;

  Csel_SQL := 'select a.empno                 ||'';''|| a.korname      ||'';''||  ' +
              '       a.e1empno               ||'';''|| a.e1korname    ||'';''||  ' +
              '       nvl(b.rvalconyn, ''N'') ||'';''|| b.rvalcondate  ||'';''||  ' +
              '       nvl(b.e1valconyn,''N'') ||'';''|| b.e1valcondate ||'';''||  ' +
              '       b.RComment              ||'';''|| b.RBigo        ||'';''||  ' +
              '       b.e1objComment          ||'';''|| b.e1Comment    ||'';''||  ' +
              '       c.codename              ||'';''|| e.DEPTNAME     ||'';''||  ' +
              '       d.codename              ||'';''|| a.payra        A          ' +
              '  from pehremas a, peActfile b, pyccode c, pyccode d, pycdept e    ' +
              ' where a.empno        = b.empno(+)                                 ' +
              '   and a.empno        = '''+ Ed_empno.Text +'''                    ' +
              '   and a.rabasdate like '''+LRabasYY+'''||''%''                    ' +
              '   and b.rabasym(+)   = '''+LRabasym+'''                           ' +
              '   AND a.Reconyn  = ''Y''                                          ' +
              '   and a.PAYCL = c.codeno(+) AND c.codeid(+)=''I112''              ' +
              '   and a.PAYRA = d.codeno(+) AND d.codeid(+)=''I113''              ' +
              '   and a.ORGNUM= e.ORGNUM AND a.DEPTCODE = e.DEPTCODE              ' ;
  Csel_Open;

  ed_empno.Text              := Csel_gfd(1);
  L_korname.ValueCaption     := Csel_gfd(2);
  Le1empno                   := Csel_gfd(3);
  Le1korname                 := Csel_gfd(4);
  Lrvalconyn                 := Csel_gfd(5);
  //Lrvalcondate               := Csel_gfd(6);
  Le1valconyn                := Csel_gfd(7);
  //Le1valcondate              := Csel_gfd(8);
  LRComment                  := Csel_gfd(9);
  LRBigo                     := Csel_gfd(10);
  Le1objComment              := Csel_gfd(11);
  LE1Comment                 := Csel_gfd(12);
  L_payclname.ValueCaption   := Csel_gfd(13);
  L_deptname.ValueCaption    := Csel_gfd(14);
  L_payraname.ValueCaption   := Csel_gfd(15);

  // 팀장이 아닌인 경우.....
  if  (Lgubun = 0) then
  begin
       MessageDlg('팀장 Action Contract 대상자가 아닙니다. ' + #13+#13+
                  '프로그램을 종료합니다.', mtError, [mbOK],0);
       BT_ExitClick(Bt_Exit);
  end;

  // 결재상신 안했을 경우
  if (ed_empno.Text = E_ChangeEmp.Text) then
  begin
       if (Lrvalconyn <> 'Y') then
       begin
            Bt_Confirm.Enabled := true;
            Bt_Save.Enabled    := true;
            BT_Delete.Enabled  := true;
            BT_Cancel.Enabled  := true;
            BT_ConYes.Visible  := false;
            BT_ConNo.Visible   := false;
       end
       else
       begin
            MessageDlg('이미 '+LRabasYY+'년 '+LRabasMM+Rabasname+'의 [팀장Action Contract Reflection]을 결재상신 하셨습니다.' + #13+#13+
                       LRabasYY+'년 '+LRabasMM+Rabasname+'의 [팀장 Action Contract Reflection] 내용확인만 하실 수 있습니다.', mtInformation, [mbOK],0);
            Bt_Confirm.Enabled := false;
            Bt_Save.Enabled    := false;
            BT_Delete.Enabled  := false;
            BT_Cancel.Enabled  := false;
            BT_ConYes.Visible  := false;
            BT_ConNo.Visible   := false;
       end;
  end
  else
  begin
       if (Le1valconyn <> 'Y') then
       begin
            Bt_Confirm.Enabled := false;
            Bt_Save.Enabled    := True;
            BT_Delete.Enabled  := false;
            BT_Cancel.Enabled  := false;
            BT_ConYes.Visible  := true;
            BT_ConNo.Visible   := true;
       end
       /////////////////////////////////////////////////////////////////////////////////
       else
       begin
            Bt_Confirm.Enabled := false;
            Bt_Save.Enabled    := false;
            BT_Delete.Enabled  := false;
            BT_Cancel.Enabled  := false;
            BT_ConYes.Visible  := false;
            BT_ConNo.Visible   := false;
       end;
  end;

  NoteBook1.ActivePage := 'P1';
  SB_0Click(SB_3);
end;

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
  with TMaxDML_HInsa do
  begin
       ServiceName := 'PEA1060A_dml';
       Close;
       Sql.Clear;
       SQL.Text := Cupd_SQL;
       if Execute then Cupd_ret := True;
  end;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Ed_empnoInitPopup(Sender);
       Key := #0;
  end;
end;

procedure TFM_Main.SB_0Click(Sender: TObject);
begin
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;
  SB_5.BtnDown  := False;
  SB_6.BtnDown  := False;
  FM_Main.SB_Help.Panels[1].Text := '';

  gS_final_comp := 'F';
  if (TOnSkinButton(Sender).Name = 'SB_4') or (TOnSkinButton(Sender).Name = 'SB_5') or (TOnSkinButton(Sender).Name = 'SB_6') then
  begin
       if (SubForm1.B_Save1.Enabled) and (SubForm1.IsDataModified) then
       begin
            MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
            SB_3.BtnDown := True;
            SB_4.BtnDown := False;
            SB_5.BtnDown := False;
            SB_6.BtnDown := False;            
            System.Exit;
       end;
  end;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

  //if   TOnSkinButton(Sender).Name = 'SB_3' then Bt_Save.Visible := true
  //else                                          Bt_Save.Visible := False;
  BT_Delete.Visible := False;
  BT_Cancel.Visible := False;
  if (TOnSkinButton(Sender).Name = 'SB_3') then
  begin
       BT_Save.Caption   := '생산성향상과제 저장';
  end
  else
  if (TOnSkinButton(Sender).Name = 'SB_4') then
  begin
       BT_Save.Caption   := '솔선수범 저장';
       BT_Delete.Visible := True;
       BT_Cancel.Visible := True;
  end
  else
  if (TOnSkinButton(Sender).Name = 'SB_5') then
  begin
       BT_Save.Caption   := '구성원L/H/C 저장';
       BT_Delete.Visible := True;
       BT_Cancel.Visible := True;
  end
  else
  if (TOnSkinButton(Sender).Name = 'SB_6') then
  begin
       BT_Save.Caption   := '의견등록 저장';
  end;

  if (LGubun = 1) and (Lrvalconyn = 'Y') or (LGubun = 2) and (LE1valconyn = 'Y') then
  begin
       Bt_Save.Enabled    := false;
       BT_Delete.Enabled  := false;
       BT_Cancel.Enabled  := false;
       Bt_Confirm.Enabled := false;
  end;
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
begin
  if (SubForm1.B_Save1.Enabled) and (SubForm1.IsDataModified) then
  begin
       MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end;

  Csel_SQL := 'Select a.RABASYY ||'';''||a.EMPNO    ||'';''||a.ITEMNO ||'';''|| ' +
              '       a.ITEMNAME||'';''||b.SELFCHECK||'';''||b.E1CHECK          ' +
              '  from peact1mas a,peact1his b                                   ' +
              ' where a.rabasyy    = '''+ LRabasYY       +'''                   ' +
              '   and a.empno      = '''+ ED_empno.Text  +'''                   ' +
              '   and b.rabasym(+) = '''+ LRabasYM       +'''                   ' +
              '   and a.empno      = b.empno(+)                                 ' +
              '   and a.ITEMNO     = b.ITEMNO(+)                                ' +
              ' order by a.RABASYY, a.EMPNO, a.ITEMNO                           ' ;

  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       MessageBox(handle,'생산성 향상과제에 등록된 자료가 없습니다.'+#13#13+'확인후 입력하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end;
  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'생산성 향상과제에 등록된 자료가 없습니다.'+#13#13+
                         '확인후 입력하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'생산성 향상과제에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_3);
                 SB_3.BtnDown  := True;
                 SB_4.BtnDown  := False;
                 SB_5.BtnDown  := False;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  Csel_SQL := 'SELECT a.rabasyy||'';''||a.empno||'';''||a.gubun||'';''||   '+
              '       a.actno  ||'';''||b.SELFCHECK||'';''||b.E1CHECK      '+
              '  FROM peact2mas a, peact2his b                             '+
              ' where a.rabasyy    = '''+ LRabasYY       +'''              '+
              '   and a.empno      = '''+ ED_empno.Text  +'''              '+
              '   and a.gubun      = ''1''                                 '+
              '   and b.rabasym(+) = '''+ LRabasYM       +'''              '+
              '   and a.empno      = b.empno(+)                            '+
              '   and a.gubun      = b.gubun(+)                            '+
              '   and a.Actno       = b.Actno(+)                           '+
              ' order by a.rabasyy, a.empno, a.gubun, a.actno              ';
  Csel_Open;

  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'솔선수범 항목에 등록된 자료가 없습니다.'+#13#13+
                         '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := True;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'솔선수범 항목에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_4);
                 SB_3.BtnDown  := False;
                 SB_4.BtnDown  := True;
                 SB_5.BtnDown  := False;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;

  //////////////////////////////////////////////////////////////////////////////

  Csel_SQL := 'SELECT a.rabasyy||'';''||a.empno||'';''||a.gubun||'';''||   '+
              '       a.actno  ||'';''||b.SELFCHECK||'';''||b.E1CHECK      '+
              '  FROM peact2mas a, peact2his b                             '+
              ' where a.rabasyy    = '''+ LRabasYY       +'''              '+
              '   and a.empno      = '''+ ED_empno.Text  +'''              '+
              '   and a.gubun      = ''2''                                 '+
              '   and b.rabasym(+) = '''+ LRabasYM       +'''              '+
              '   and a.empno      = b.empno(+)                            '+
              '   and a.gubun      = b.gubun(+)                            '+
              '   and a.Actno       = b.Actno(+)                           '+
              ' order by a.rabasyy, a.empno, a.gubun, a.actno              ';
  Csel_Open;

  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'구성원 L/H/C 항목에 등록된 자료가 없습니다.'+#13#13+
                         '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_5);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := True;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'구성원 L/H/C 항목에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_5);
                 SB_3.BtnDown  := False;
                 SB_4.BtnDown  := False;
                 SB_5.BtnDown  := True;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////
  Csel_SQL := 'SELECT Trim(Rcomment)||'';''||Trim(E1Comment) '+
              '  FROM peactfile                              '+
              ' WHERE RabasYM = '''+ LRabasYM       +'''     '+
              '   And Empno   = '''+ ED_empno.Text  +'''     ';
  Csel_Open;
  if (DBcommon.RecordCount <= 0) or (((LGubun = 1) and (Csel_gfd(1) = '')) or
                                     ((LGubun = 2) and (Csel_gfd(2) = ''))) then
  begin
       MessageBox(handle,'의견등록에 등록된 자료가 없습니다.'+#13#13+'반드시 등록하셔야 합니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_6);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := True;
       System.Exit;
  end;
  //////////////////////////////////////////////////////////////////////////////

  if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.                '+#13+#13+
                             LRabasYY+'년'+LRabasMM+Rabasname+' 등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                             '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
       system.Exit;
  end;

  ////////////해당월/분기에 저장.                                              ㅣ
  Csel_SQL := 'SELECT 1 FROM peactfile                  '+
              ' WHERE RabasYM = '''+ LRabasYM      +''' '+
              '   And Empno   = '''+ ED_empno.Text +''' ';
  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       Cupd_SQL := 'Insert into peactfile                                '+#13+
                   '        (RabasYM,   Empno,                           '+#13+
                   '         rvalconyn, rvalcondate, e1valconyn,         '+#13+
                   '         Writeemp,  Writetime  )                     '+#13+
                   ' Values (                                            '+#13+
                   '          '''+  LRabasYM         +''' ,              '+#13+
                   '          '''+  ED_empno.Text    +''' ,              '+#13+
                   '          ''Y'',TO_CHAR(SYSDATE,''YYYYMMDD''),''N'', '+#13+
                   '          '''+  Pempno           +''' ,              '+#13+
                   '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')    )   ';

  end
  else
  begin
       Cupd_SQL := 'update peactfile                                       '+#13+
                   '   set rvalconyn  = ''Y'',                             '+#13+
                   '       rvalcondate= TO_CHAR(SYSDATE,''YYYYMMDD''),     '+#13+
                   '       e1valconyn = ''N'',                             '+#13+
                   '       Writeemp   = '''+  pempno       +''' ,          '+#13+
                   '       Writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')'+#13+
                   ' WHERE rabasym  = '''+ LRabasYM        +'''            '+#13+
                   '   AND empno    = '''+ ED_empno.Text   +'''            ';
  end;

  Cupd_Exec;

  if Cupd_ret then
  begin
       Lrvalconyn := 'Y';
       Bt_Save.Enabled    := false;
       Bt_Confirm.Enabled := false;
       MessageDlg('작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);

       //////////////////////////////////////////////////////////////////////////////
       //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
       SendProgID  := 'PEK1050A';
       SendEmpno   := ED_empno.Text;
       RcveEmpno   := LE1empno;
       MailSubject := '[결재요청] 팀장 Action Contract Reflection';
       MailBody    := copy(LRabasYM,1,4)+'년 '+copy(LRabasYM,5,2)+Rabasname+' Action Contract Reflection 작성을 완료하였습니다.'+#13+#13+
                      '결재 바랍니다.'+#13+#13+
                      '[결재화면위치 안내] : 종합인사시스템 - 평가 - Action Contract - 팀장Action Contract Reflection';
       ReceiveYN   := 'N';

       if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       begin
            MessageDlg(' 결재상신 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
       end
       else MessageDlg(' 결재상신 메일전송을 성공 하였습니다...',mtError, [mbOk], 0);
       //////////////////////////////////////////////////////////////////////////////

       SB_0Click(SB_6);
       SB_0Click(SB_3);
  end
  else
  begin  
       MessageDlg('작업이 실패하였습니다.', mtInformation, [mbOK], 0);
       Exit;
  end;

  BT_Exit.SetFocus;
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
  else if (NoteBook1.ActivePage = 'P4') or (NoteBook1.ActivePage = 'P5') then
  begin
     try
       SubForm2 := TSubForm2.Create(nil); // 솔선수범 & 구성원 L/H/C
       SubForm2.Parent      := Notebook1;
       SubForm2.WindowState := wsMaximized;
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
  end
  else if (NoteBook1.ActivePage = 'P6') then
  begin
     try
       SubForm3 := TSubForm3.Create(nil); // 의견등록
       SubForm3.Parent      := Notebook1;
       SubForm3.WindowState := wsMaximized;
       SubForm3.Show;
     except
       begin
           if (SubForm3 <> nil) or Assigned(SubForm3) then
           begin
             SubForm3.Free;
             SubForm3 := nil;
           end;
       end;
     end;
  end;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TMaxDML_HInsa do
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

procedure TFM_Main.BT_ChangeClick(Sender: TObject);
begin
     InitSetup;
end;

procedure TFM_Main.ED_empnoCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
  if  Fm_EmpForm.Korname <> '' then
  begin
       Ed_empno.Text             := Fm_EmpForm.empno;
       L_korname.ValueCaption    := Fm_EmpForm.Korname;
       L_deptname.ValueCaption   := Fm_EmpForm.deptname;
       L_payclname.ValueCaption  := Fm_EmpForm.payclname;
       L_payraname.ValueCaption  := Fm_EmpForm.payraname;
       LE1empno                  := Fm_EmpForm.e1empno;
       LRvalConyn                := Fm_EmpForm.Conyn;
       LE1valConyn               := Fm_EmpForm.Finyn;
       InitSetup;
  end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm;
end;

procedure TFM_Main.Bt_SaveClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'P3' then
  begin
       if  MessageBox(handle,PChar(LRabasYY+'년 '+LRabasMM+Rabasname+' 생산성 향상 과제의 점검내용을 저장하시려는 것이 맞습니까?'), '확 인',  MB_YESNO ) <> IDYES then
            system.Exit;
       SubForm1.B_Save1Click(SubForm1.B_Save1);
  end;
  if Notebook1.ActivePage = 'P4' then
  begin
       if  MessageBox(handle,PChar(LRabasYY+'년 '+LRabasMM+Rabasname+' 솔선수범의 점검내용을 저장하시려는 것이 맞습니까?'), '확 인',  MB_YESNO ) <> IDYES then
            system.Exit;
       SubForm2.B_Save1Click(SubForm2.B_Save1);
  end;
  if Notebook1.ActivePage = 'P5' then
  begin
       if  MessageBox(handle,PChar(LRabasYY+'년 '+LRabasMM+Rabasname+' 구성원L/H/C의 점검내용을 저장하시려는 것이 맞습니까?'), '확 인',  MB_YESNO ) <> IDYES then
            system.Exit;
       SubForm2.B_Save1Click(SubForm2.B_Save1);
  end;
  if Notebook1.ActivePage = 'P6' then
  begin
       if  MessageBox(handle,PChar(LRabasYY+'년 '+LRabasMM+Rabasname+' 의견등록내용을 저장하시려는 것이 맞습니까?'), '확 인',  MB_YESNO ) <> IDYES then
            system.Exit;
       SubForm3.B_Save1Click(SubForm3.B_Save1);
  end;
end;

procedure TFM_Main.BT_DeleteClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'P4' then SubForm2.B_del1Click(SubForm2.B_del1);
  if Notebook1.ActivePage = 'P5' then SubForm2.B_del1Click(SubForm2.B_del1);
end;

procedure TFM_Main.BT_CancelClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'P4' then SubForm2.B_Cancel1Click(SubForm2.B_Cancel1);
  if Notebook1.ActivePage = 'P5' then SubForm2.B_Cancel1Click(SubForm2.B_Cancel1);
end;

procedure TFM_Main.E_ChangeEmpChange(Sender: TObject);
begin
  Ed_empno.Text            := '';
  L_korname.ValueCaption   := '';
  L_Deptname.ValueCaption  := '';
  L_payclname.ValueCaption := '';
  L_payraname.ValueCaption := '';
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  if   PageControl1.ActivePage.PageIndex + 1 < 10 then
  begin
       LRabasYM := LRabasYY + '0' + IntToStr(PageControl1.ActivePage.PageIndex+1);
       LRabasMM := '0' + IntToStr(PageControl1.ActivePage.PageIndex+1);
  end
  else
  begin
       LRabasYM := LRabasYY +       IntToStr(PageControl1.ActivePage.PageIndex+1); //Showmessage(LRabasYM);
       LRabasMM := IntToStr(PageControl1.ActivePage.PageIndex+1);
  end;
  E_ChangeEmpChange(Sender);
  Notebook1.ActivePage := 'P1';
  if  LGubun = 1 then    InitSetup;
{
  if SB_3.BtnDown then SubForm1.FormShow(Sender);
  if SB_4.BtnDown then SubForm2.FormShow(Sender);
  if SB_5.BtnDown then SubForm2.FormShow(Sender);
  if SB_6.BtnDown then SubForm3.FormShow(Sender);
}
end;

procedure TFM_Main.BT_ConYesClick(Sender: TObject);
var vConStr, vConYN : String;
begin
  if (SubForm1.B_Save1.Enabled) and (SubForm1.IsDataModified) then
  begin
       MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end;

  Csel_SQL := 'Select a.RABASYY ||'';''||a.EMPNO    ||'';''||a.ITEMNO ||'';''|| ' +
              '       a.ITEMNAME||'';''||b.SELFCHECK||'';''||b.E1CHECK          ' +
              '  from peact1mas a,peact1his b                                   ' +
              ' where a.rabasyy    = '''+ LRabasYY       +'''                   ' +
              '   and a.empno      = '''+ ED_empno.Text  +'''                   ' +
              '   and b.rabasym(+) = '''+ LRabasYM       +'''                   ' +
              '   and a.empno      = b.empno(+)                                 ' +
              '   and a.ITEMNO     = b.ITEMNO(+)                                ' +
              ' order by a.RABASYY, a.EMPNO, a.ITEMNO                           ' ;

  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       MessageBox(handle,'생산성 향상과제에 등록된 자료가 없습니다.'+#13#13+'확인후 입력하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end;
  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'생산성 향상과제에 등록된 자료가 없습니다.'+#13#13+
                         '확인후 입력하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'생산성 향상과제에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_3);
                 SB_3.BtnDown  := True;
                 SB_4.BtnDown  := False;
                 SB_5.BtnDown  := False;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  Csel_SQL := 'SELECT a.rabasyy||'';''||a.empno||'';''||a.gubun||'';''||   '+
              '       a.actno  ||'';''||b.SELFCHECK||'';''||b.E1CHECK      '+
              '  FROM peact2mas a, peact2his b                             '+
              ' where a.rabasyy    = '''+ LRabasYY       +'''              '+
              '   and a.empno      = '''+ ED_empno.Text  +'''              '+
              '   and a.gubun      = ''1''                                 '+
              '   and b.rabasym(+) = '''+ LRabasYM       +'''              '+
              '   and a.empno      = b.empno(+)                            '+
              '   and a.gubun      = b.gubun(+)                            '+
              '   and a.Actno       = b.Actno(+)                           '+
              ' order by a.rabasyy, a.empno, a.gubun, a.actno              ';
  Csel_Open;

  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'솔선수범 항목에 등록된 자료가 없습니다.'+#13#13+
                         '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := True;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'솔선수범 항목에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_4);
                 SB_3.BtnDown  := False;
                 SB_4.BtnDown  := True;
                 SB_5.BtnDown  := False;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;

  //////////////////////////////////////////////////////////////////////////////

  Csel_SQL := 'SELECT a.rabasyy||'';''||a.empno||'';''||a.gubun||'';''||   '+
              '       a.actno  ||'';''||b.SELFCHECK||'';''||b.E1CHECK      '+
              '  FROM peact2mas a, peact2his b                             '+
              ' where a.rabasyy    = '''+ LRabasYY       +'''              '+
              '   and a.empno      = '''+ ED_empno.Text  +'''              '+
              '   and a.gubun      = ''2''                                 '+
              '   and b.rabasym(+) = '''+ LRabasYM       +'''              '+
              '   and a.empno      = b.empno(+)                            '+
              '   and a.gubun      = b.gubun(+)                            '+
              '   and a.Actno       = b.Actno(+)                           '+
              ' order by a.rabasyy, a.empno, a.gubun, a.actno              ';
  Csel_Open;

  if DBcommon.RecordCount <= 0 then
  begin
       MessageBox(handle,'구성원 L/H/C 항목에 등록된 자료가 없습니다.'+#13#13+
                         '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_5);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := True;
       SB_6.BtnDown  := False;
       System.Exit;
  end
  else
  begin
       DBcommon.First;
       while not DBcommon.eof do
       begin
            if ((LGubun = 1) and ((Csel_gfd(5) = '0') or (Csel_gfd(5) = ''))) or
               ((LGubun = 2) and ((Csel_gfd(6) = '0') or (Csel_gfd(6) = ''))) then
            begin
                 MessageBox(handle,'구성원 L/H/C 항목에 점검이 안된 자료가 있습니다.'+#13#13+
                                   '확인 후에 등록하시고 작업하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
                 SB_0Click(SB_5);
                 SB_3.BtnDown  := False;
                 SB_4.BtnDown  := False;
                 SB_5.BtnDown  := True;
                 SB_6.BtnDown  := False;
                 System.Exit;
            end;
            DBcommon.Next;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  Csel_SQL := 'SELECT Trim(Rcomment)||'';''||Trim(E1Comment) '+
              '  FROM peactfile                              '+
              ' WHERE RabasYM = '''+ LRabasYM       +'''     '+
              '   And Empno   = '''+ ED_empno.Text  +'''     ';
  Csel_Open;

  if (DBcommon.RecordCount <= 0) or (((LGubun = 1) and (Csel_gfd(1) = '')) or
                                     ((LGubun = 2) and (Csel_gfd(2) = ''))) then
  begin
       MessageBox(handle,'의견등록에 등록된 자료가 없습니다.'+#13#13+'반드시 등록하셔야 합니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_6);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := False;
       SB_5.BtnDown  := False;
       SB_6.BtnDown  := True;
       System.Exit;
  end;
  //////////////////////////////////////////////////////////////////////////////
  if MessageDlg('해당 팀장의 '+LRabasYY+'년'+LRabasMM+Rabasname+' 등록내역에 대해 '+ TOnFocusButton(Sender).Caption + ' 하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  if      TOnFocusButton(Sender).Caption = '결재' then
  begin
       if  Trim(LE1Comment) = '' then
       begin
           MessageBox(handle,'"상사 Comment"에 입력된 내용이 없습니다. '+#13#13+
                             '확인 후에 결재하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
           SB_0Click(SB_6);
           System.Exit;
       end;
       //결재여부
       Cupd_SQL := 'update peactfile                                            '+#13+
                   '   set E1valconyn   = ''Y'',                                '+#13+
                   '       E1valcondate = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+#13+
                   '       E1ObjComment = '''+ Le1ObjComment +''',              '+#13+
                   '       E1Empno      = '''+ Le1empno      +''',              '+#13+
                   '       Writeemp     = '''+ pempno        +''',              '+#13+
                   '       Writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+#13+
                   ' WHERE RABASYM      = '''+ LRabasYM      +'''               '+#13+
                   '   AND empno        = '''+ ED_empno.Text +'''               ';
       Cupd_Exec;

       if Cupd_ret then
       begin
            Le1valconyn       := 'Y';
            MessageDlg('작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);
            SB_0Click(SB_6);
            SB_0Click(SB_3);
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
  Bt_Save.Enabled   := false;
  BT_ConYes.Enabled := False;
  BT_ConNO.Enabled  := False;
end;




end.
