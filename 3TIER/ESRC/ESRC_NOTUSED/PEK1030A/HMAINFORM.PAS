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
    Edit1: TEdit;
    E_ChangeEmp: TEdit;
    BT_Change: TButton;
    SB_4: TOnSkinButton;
    L_korname: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    SB_3: TOnSkinButton;
    Bt_Print: TOnFocusButton;
    Q_Subject: TTMaxDataSet;
    TMaxDataSet: TTMaxDataSet;
    BT_ConYes: TOnFocusButton;
    BT_ConNO: TOnFocusButton;
    Bt_NoSayu: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    Bt_Save: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_0Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ChangeClick(Sender: TObject);
    procedure Bt_PrintClick(Sender: TObject);
    procedure BT_ConYesClick(Sender: TObject);
    procedure Bt_NoSayuClick(Sender: TObject);
    procedure ED_empnoCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure E_ChangeEmpChange(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    Start      : Boolean;
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

    SqlText   : String;
    Csel_SQL  : String;
    Csel_ret  : Boolean;
    Cupd_SQL  : String;
    Cupd_ret  : Boolean;

    LRabasYY   : string;
    LRabasYM   : String;
    LGubun     : Integer;

    Le1empno      : string; //1차평가자 사번
    Le1korname    : string; //1차평가자 이름
    Lrvalconyn    : string;
    Lrvalcondate  : String;
    Le1valconyn   : String;
    Le1valcondate : String;
    Le1objComment : String;
    Lpayra        : String;

    vServerFileName, vFullPath, vFilename  : String;
    vFTPsuccess : Boolean;
    payrafrom, payrato   : String;
    objemp1,  objemp2    : String;
    excemp1,  excemp2,  excemp3,  excemp4,  excemp5,  excemp6  : String;
    sptemp1,  sptemp2,  sptemp3,  sptemp4,  sptemp5 : String;
    sptemp6,  sptemp7,  sptemp8,  sptemp9,  sptemp0 : String;
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

uses USubForm1, USubForm2, HPrintForm, UObjComm, UEmpForm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  Edit1.Visible := False;
  if Copy(Hinsa_Param(cmdLine,4),1,1) = 'A' then Edit1.Visible := True;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
begin
  if FL_Start then
  begin
    FL_Start := False;
    SF_Main.Refresh;

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
    SqlText := 'SELECT  Value1||'';''|| Value2  ' +
               '  FROM peActbas                 ' +
               ' WHERE rabasyy   = ''0000''     ' +
               '   AND gubun     = ''00''       ' +
               '   AND sgubun    = ''0000''     ';

    Csel_SQL := SqlText;
    Csel_Open;
    LRabasYY := Csel_gfd(1);      //LRabasYM := Csel_gfd(1)+Csel_gfd(2);
    LRabasYM := LRabasYY + '01';  //계획단계의 첨부파일을 1월에 저장한다.

    //팀장작성대상자 기준 불러오기
    SqlText := 'select Value1||'';''||Value2||'';''||Value3||'';''||Value4||'';''|| '+
               '       NVL(Value5,''ZZZZ'')||'';''||NVL(Value6, ''ZZZZ'')||'';''||  '+
               '       NVL(Value7,''ZZZZ'')||'';''||NVL(Value8, ''ZZZZ'')||'';''||  '+
               '       NVL(Value9,''ZZZZ'')||'';''||NVL(Value10,''ZZZZ'')           '+
               '  from peactbas a                                                   '+
               ' WHERE a.rabasyy = '''+Lrabasyy+'''                                 '+
               '   AND a.gubun   = ''01''                                           '+
               '   AND a.sgubun  = ''0001''                                         ';
    Csel_SQL := SqlText;
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

    //목표등록 안하면서 Action Contract 등록하는 팀장 불러오기
    SqlText := 'select NVL(Value1,''ZZZZ'')||'';''||NVL(Value2, ''ZZZZ'')||'';''||  '+
               '       NVL(Value3,''ZZZZ'')||'';''||NVL(Value4, ''ZZZZ'')||'';''||  '+
               '       NVL(Value5,''ZZZZ'')||'';''||NVL(Value6, ''ZZZZ'')||'';''||  '+
               '       NVL(Value7,''ZZZZ'')||'';''||NVL(Value8, ''ZZZZ'')||'';''||  '+
               '       NVL(Value9,''ZZZZ'')||'';''||NVL(Value10,''ZZZZ'')           '+
               '  from peactbas a                                                   '+
               ' WHERE a.rabasyy = '''+Lrabasyy+'''                                 '+
               '   AND a.gubun   = ''01''                                           '+
               '   AND a.sgubun  = ''0005''                                         ';
    Csel_SQL := SqlText;
    Csel_Open;
    sptemp1   := Csel_gfd(1);
    sptemp2   := Csel_gfd(2);
    sptemp3   := Csel_gfd(3);
    sptemp4   := Csel_gfd(4);
    sptemp5   := Csel_gfd(5);
    sptemp6   := Csel_gfd(6);
    sptemp7   := Csel_gfd(7);
    sptemp8   := Csel_gfd(8);
    sptemp9   := Csel_gfd(9);
    sptemp0   := Csel_gfd(10);


    //Action Contract 담당자 불러오기
    SqlText := 'SELECT Value1||'';''||Value2||'';''||Value3   ' +
               '       ||'';''||Value4||'';''||Value5||'';''||' +
               '       Value6||'';''||Value7||'';''||Value8   ' +
               '       ||'';''||Value9||'';''||Value10        ' +
               '  FROM peActbas                               ' +
               ' WHERE rabasyy   = '''+Lrabasyy+'''           ' +
               '   AND gubun     = ''01''                     ' +
               '   AND sgubun    = ''0003''                   ' ;

    Csel_SQL := SqlText;
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
      //최초 등록완료자 불러오기
    SqlText := 'select empno from pehremas a                                            ' +
               ' where rabasdate  like '''+Lrabasyy+''' ||''%''                         ' +
               '   and ((empno in ('''+FM_Main.sptemp1+''','''+FM_Main.sptemp2+''',     ' +
               '                   '''+FM_Main.sptemp3+''','''+FM_Main.sptemp4+''',     ' +
               '                   '''+FM_Main.sptemp5+''','''+FM_Main.sptemp6+''',     ' +
               '                   '''+FM_Main.sptemp7+''','''+FM_Main.sptemp8+''',     ' +
               '                   '''+FM_Main.sptemp9+''','''+FM_Main.sptemp0+''')) or ' +
               '        (E1PRJCONYN =''Y''))                                            ' +
               '   and empno in (select empno from pehreaim_det                         ' +
               '                  where rabasdate = a.rabasdate                         ' +
               '                    and seqno     = 99         )                        ' +
               '   and rownum = 1                                                       ' ;

    Csel_SQL := SqlText;
    Csel_Open;
    E_ChangeEmp.Text := DBcommon.FieldByName('SEL_DATA').AsString;

    //인사팀 부서명 불러오기
    SqlText := 'SELECT Value2                   ' +
               '  FROM pimvari                  ' +
               ' WHERE gubun     = ''R0''       ' +
               '   AND sgubun    = ''0001''     ' ;

    Csel_SQL := SqlText;
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
         //결재할 팀장의 수...
    SqlText := 'SELECT E1empno||'';''||Count(empno)                                      ' +
               '  FROM pehremas                                                          ' +
               ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
               '   And reconyn   = ''Y''                                                 ' +
               '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
               '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
               '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
               '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' +
               '   AND E1empno   = '''+E_ChangeEmp.Text+'''                              ' +
               ' group by E1empno                                                        ' ;
    Csel_SQL := SqlText;
    Csel_Open;
    ConCount   := Csel_gfd(2);

         //대상자인지 결재자인지...
    SqlText := 'SELECT Count(*)                                                          ' +
               '  FROM pehremas                                                          ' +
               ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
               '   And reconyn   = ''Y''                                                 ' +
               '   AND ((e1empno = '''+E_ChangeEmp.Text+''') or                          ' +
               '        (empno   = '''+E_ChangeEmp.Text+'''))                            ' +
               '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
               '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
               '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
               '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' ;
    Csel_SQL := SqlText;
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

    if LGubun = 1 then    InitSetup;

         // 대상자가 아닌인 경우.....
    if (Lgubun = 0) then
    begin
      MessageDlg('팀장 Action Contract 등록 대상자가 아닙니다. ' + #13+#13+
                 '프로그램을 종료합니다.', mtError, [mbOK],0);
      BT_ExitClick(Bt_Exit);
    end;
  end;
end;

procedure TFM_Main.InitSetup;
const
  ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
begin
      //결재할 팀장의 수...
      SqlText := 'SELECT E1empno||'';''||Count(empno)                                      ' +
                 '  FROM pehremas                                                          ' +
                 ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
                 '   And reconyn   = ''Y''                                                 ' +
                 '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
                 '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
                 '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
                 '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' +
                 '   AND E1empno   = '''+E_ChangeEmp.Text+'''                              ' +
                 ' group by E1empno                                                        ' ;
      Csel_SQL := SqlText;
      Csel_Open;
      ConCount   := Csel_gfd(2);
     //대상자인지 결재자인지...
     SqlText := 'SELECT Count(*)                                                          ' +
                '  FROM pehremas                                                          ' +
                ' WHERE Rabasdate like '''+Lrabasyy+'''||''%''                            ' +
                '   And reconyn   = ''Y''                                                 ' +
                '   AND ((e1empno = '''+E_ChangeEmp.Text+''') or                          ' +
                '        (empno   = '''+E_ChangeEmp.Text+'''))                            ' +
                '   AND (((payra >= '''+payrafrom+''') And (payra <= '''+payrato+''')) or ' +
                '        (empno = '''+objemp1+''') or (empno = '''+objemp2+''') )         ' +
                '   AND (empno not in ('''+excemp1+''','''+excemp2+''','''+excemp3+''',   ' +
                '                      '''+excemp4+''','''+excemp5+''','''+excemp6+'''))  ' ;
     Csel_SQL := SqlText;
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

     SqlText := 'select a.empno                 ||'';''|| a.korname      ||'';''||  ' +
                '       a.e1empno               ||'';''|| a.e1korname    ||'';''||  ' +
                '       nvl(b.rvalconyn, ''N'') ||'';''|| b.rvalcondate  ||'';''||  ' +
                '       nvl(b.e1valconyn,''N'') ||'';''|| b.e1valcondate ||'';''||  ' +
                '       b.e1objComment          ||'';''|| c.codename     ||'';''||  ' +
                '       e.DEPTNAME              ||'';''|| d.codename     ||'';''||  ' +
                '       a.payra        A                                            ' +
                '  from pehremas a, peActfile b, pyccode c, pyccode d, pycdept e    ' +
                ' where a.empno     = b.empno(+)                                    ' +
                '   and substr(a.rabasdate,1,4) = substr(b.rabasYM(+),1,4)          ' +
                '   and a.empno   = '''+ Ed_empno.Text +'''                         ' +
                '   and a.rabasdate like '''+Lrabasyy+'''||''%''                    ' +
                '   and b.rabasym(+) = '''+LrabasyM+'''                             ' +
                '   and a.PAYCL = c.codeno(+) AND c.codeid(+)=''I112''              ' +
                '   and a.PAYRA = d.codeno(+) AND d.codeid(+)=''I113''              ' +
                '   and a.ORGNUM= e.ORGNUM AND a.DEPTCODE = e.DEPTCODE              ' ;

     Edit1.Text := SqlText;     //Exit;
     Csel_SQL   := SqlText;
     Csel_Open;

     ed_empno.Text              := Csel_gfd(1);
     L_korname.ValueCaption     := Csel_gfd(2);
     Le1empno                   := Csel_gfd(3);
     Le1korname                 := Csel_gfd(4);
     Lrvalconyn                 := Csel_gfd(5);
     Lrvalcondate               := Csel_gfd(6);
     Le1valconyn                := Csel_gfd(7);
     Le1valcondate              := Csel_gfd(8);
     Le1objComment              := Csel_gfd(9);
     L_payclname.ValueCaption   := Csel_gfd(10);
     L_deptname.ValueCaption    := Csel_gfd(11);
     L_payraname.ValueCaption   := Csel_gfd(12);
     Lpayra                     := Csel_gfd(13);


     // 팀장이 아닌인 경우.....
     if  (Lgubun = 0) then
     begin
          MessageDlg('팀장 Action Contract 등록 대상자가 아닙니다. ' + #13+#13+
                     '프로그램을 종료합니다.', mtError, [mbOK],0);
          BT_ExitClick(Bt_Exit);
     end;

     // 반려인 경우.....
     if (Le1valconyn = 'R') then
     begin
        MessageDlg('상위결재자께서 [팀장 Action Contract 등록]을 반려하였습니다. ' + #13+#13+
                   '다시 [팀장 Action Contract 등록]을 하십시요.', mtInformation, [mbOK],0);
        Bt_NoSayuClick(Bt_NoSayu);
        Bt_NoSayu.Visible := True;
     end
     else
        Bt_NoSayu.Visible := False;


     // 결재상신 안했을 경우
     if (ed_empno.Text = E_ChangeEmp.Text ) then
     begin
          if (Lrvalconyn <> 'Y') then
          begin
               Bt_Confirm.Enabled := true;
//               Bt_Save.Enabled    := true;
               BT_ConYes.Visible  := false;
               BT_ConNo.Visible   := false;
          end
          /////////////////////////////////////////////////////////////////////////////////
          else
          begin
               MessageDlg('이미 [팀장 Action Contract 등록]을 결재상신 하셨습니다.' + #13+#13+
                          '[팀장 Action Contract 등록] 내용확인만 하실 수 있습니다.', mtInformation, [mbOK],0);
               Bt_Confirm.Enabled := false;
//               Bt_Save.Enabled    := false;
               BT_ConYes.Visible  := false;
               BT_ConNo.Visible   := false;
          end;
     end
     else
     begin
          if (Le1valconyn <> 'Y') then
          begin
               Bt_Confirm.Enabled := false;
//               Bt_Save.Enabled    := false;
               BT_ConYes.Visible  := true;
               BT_ConNo.Visible   := true;
          end
          /////////////////////////////////////////////////////////////////////////////////
          else
          begin
               Bt_Confirm.Enabled := false;
//               Bt_Save.Enabled    := false;
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

  gS_final_comp := 'F';
  if TOnSkinButton(Sender).Name = 'SB_4' then
  begin
       if (SubForm1.B_Save1.Enabled) and (SubForm1.IsDataModified) then
       begin
            MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
            SB_3.BtnDown  := True;
            SB_4.BtnDown  := False;
            System.Exit;
       end;
  end;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
{
  if TOnSkinButton(Sender).Name = 'SB_3' then
      Bt_Save.Visible  := true
  else
      Bt_Save.Visible  := False;
}
  if (Lrvalconyn = 'Y') then
  begin
//      Bt_Save.Enabled    := false;
      Bt_Confirm.Enabled := false;
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

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
begin
  if (SubForm1.B_Save1.Enabled) and (SubForm1.IsDataModified) then
  begin
       MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       System.Exit;
  end;

  SqlText  := 'SELECT 1                                  '+
              '  FROM peact1mas                          '+
              ' WHERE RabasYY = '''+ LRabasYY       +''' '+
              '   And Empno   = '''+ ED_empno.Text  +''' ';

  Csel_SQL := SqlText;
  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       MessageBox(handle,'생산성 향상과제에 등록된 자료가 없습니다.'+#13#13+'확인후 입력하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_3);
       SB_3.BtnDown  := True;
       SB_4.BtnDown  := False;
       System.Exit;
  end;

  SqlText  := 'SELECT 1                                  '+
              '  FROM peact2mas                          '+
              ' WHERE RabasYY = '''+ LRabasYY       +''' '+
              '   And Empno   = '''+ ED_empno.Text  +''' '+
              '   And Gubun   = ''1''                    ';

  Csel_SQL := SqlText;
  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       MessageBox(handle,'솔선수범 항목에 등록된 자료가 없습니다.'+#13#13+'반드시 1가지 이상 등록하셔야 합니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := True;
       System.Exit;
  end;

  SqlText  := 'SELECT 1                                  '+
              '  FROM peact2mas                          '+
              ' WHERE RabasYY = '''+ LRabasYY       +''' '+
              '   And Empno   = '''+ ED_empno.Text  +''' '+
              '   And Gubun   = ''2''                    ';

  Csel_SQL := SqlText;
  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       MessageBox(handle,'구성원 L/H/C 항목에 등록된 자료가 없습니다.'+#13#13+'반드시 1가지 이상 등록하셔야 합니다.','작업순서오류',MB_ICONWARNING);
       SB_0Click(SB_4);
       SB_3.BtnDown  := False;
       SB_4.BtnDown  := True;
       System.Exit;
  end;

  if MessageBox(handle,PChar('결재상신을 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                             '등록하신 내역에 대해 모두 확인을 마치셨으면 결재상신를 하시기 바랍니다.'+#13+#13+

                             '결재상신을 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
       system.Exit;
  end;

  ////////////테이블에 Filename 1월에 저장.
  SqlText  := 'SELECT 1                                  '+
              '  FROM peactfile                          '+
              ' WHERE RabasYM = '''+ LRabasYM       +''' '+
              '   And Empno   = '''+ ED_empno.Text  +''' ';

  Csel_SQL := SqlText;
  Csel_Open;

  if DBcommon.RecordCount = 0 then
  begin
       SqlText  := 'Insert into peactfile                                     '+
                   '        (RabasYM,   Empno,                                '+
                   '         rvalconyn, rvalcondate, e1valconyn,              '+
                   '         Writeemp,  Writetime  )                          '+
                   ' Values (                                                 '+
                   '          '''+  LRabasYM         +''' ,                   '+
                   '          '''+  ED_empno.Text    +''' ,                   '+
                   '          ''Y'',TO_CHAR(SYSDATE,''YYYYMMDD''),''N'',      '+
                   '          '''+  Pempno           +''' ,                   '+
                   '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')    )      ';

  end
  else
  begin
       SqlText  := 'update peactfile                                          '+
                   '   set rvalconyn  = ''Y'',                                '+
                   '       rvalcondate= TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                   '       e1valconyn = ''N'',                                '+
                   '       Writeemp   = '''+  pempno       +''' ,             '+
                   '       Writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                   ' WHERE rabasym  = '''+ LRabasYM        +'''               '+
                   '   AND empno    = '''+ ED_empno.Text   +'''               ';
  end;

  Cupd_SQL := Sqltext;
  Cupd_Exec;

  if Cupd_ret then
  begin
       Lrvalconyn := 'Y';
       Bt_Confirm.Enabled := false;
       Bt_NoSayu.Visible  := false;
       Bt_Save.Enabled    := false;
       MessageDlg('결재상신 작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);

       //////////////////////////////////////////////////////////////////////////////
       //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
       SendProgID  := 'PEK1030A';
       SendEmpno   := ED_empno.Text;
       RcveEmpno   := LE1empno;
       MailSubject := '[결재요청] Action Contract 작성을 완료하였습니다.';
       MailBody    := 'Action Contract 작성을 완료하였습니다.'+#13+#13+
                      '결재 바랍니다.'+#13+#13+
                      '[결재화면위치 안내] : 종합인사시스템 - 평가 - Action Contract - 팀장Action Contract 등록/결재';
       ReceiveYN   := 'N';

       if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       begin
            MessageDlg(' 결재상신 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
       end
       else MessageDlg(' 결재상신 메일전송을 성공 하였습니다...',mtError, [mbOk], 0);
       //////////////////////////////////////////////////////////////////////////////
  end
  else Exit;

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
  else
  if NoteBook1.ActivePage = 'P4' then
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

procedure TFM_Main.Bt_PrintClick(Sender: TObject);
begin
  SqlText := 'SELECT empno                                   '+
             '  FROM pehremas                                '+
             ' WHERE Rabasdate like '''+LRabasyy+'''||''%''  '+
             '   AND empno        = '''+Ed_empno.Text+'''    ';

  Csel_SQL := SqlText;
  Csel_Open;

  with FM_Main.TMaxDataSet do
  begin
       SqlText := 'select Gubun, ROW_NUMBER() OVER (PARTITION BY Gubun ORDER BY ACTNO) RNO, ActPlan, Detplan, TgPoint  ' +
                  '  from peAct2mas a                              ' +
           Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''  ' ,[FM_Main.LRabasyy,FM_Main.Ed_empno.Text]) +
                  ' order by Gubun, ACTNO                          ';
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('GUBUN'      , ftString    ,  2000  );
       AddField('RNO'        , ftString    ,  2000  );
       AddField('ACTPLAN'    , ftString    ,  2000  );
       AddField('DETPLAN'    , ftString    ,  2000  );
       AddField('TGPOINT'    , ftString    ,  2000  );
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  PrintForm := TPrintForm.Create(Self);
  PrintForm.QuickRepPrn1.Preview;
end;

procedure TFM_Main.BT_ConYesClick(Sender: TObject);
var vConStr, vConYN : String;
begin
  if MessageDlg('해당 팀장의 등록내역에 대해 '+ TOnFocusButton(Sender).Caption + ' 하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  if      TOnFocusButton(Sender).Caption = '결재' then
  begin
       //결재여부
       SqlText  := 'update peactfile                                            '+
                   '   set E1valconyn   = ''Y'',                                '+
                   '       E1valcondate = TO_CHAR(SYSDATE,''YYYYMMDD''),        '+
                   '       E1ObjComment = '''+ Le1ObjComment +''',              '+
                   '       E1Empno      = '''+ Le1empno      +''',              '+
                   '       Writeemp     = '''+ pempno        +''',              '+
                   '       Writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                   ' WHERE RABASYM      = '''+ LRabasYM      +'''               '+ //01월로 지정하여
                   '   AND empno        = '''+ ED_empno.Text +'''               ';
       Cupd_SQL := Sqltext;
       Cupd_Exec;

       if Cupd_ret then
       begin
            MessageDlg('작업을 성공적으로 완료하였습니다.', mtInformation, [mbOK], 0);
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

procedure TFM_Main.Bt_NoSayuClick(Sender: TObject);
begin
     try
         ObjCommForm := TObjCommForm.Create(nil);
         ObjCommForm.E_e1ObjComment.Text     :=  Le1objComment;
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
          SubForm1.B_Save1Click(SubForm1.B_Save1);
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

end.
