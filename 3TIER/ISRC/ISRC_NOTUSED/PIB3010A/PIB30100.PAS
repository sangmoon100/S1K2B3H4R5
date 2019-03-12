{--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIB3012A(제증명 발급신청)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      :
Version         : 30.00
Date            :
Update contents
  버전     수정일     수정자   관련근거            수정내용
--------------------------------------------------------------------------------
  10.34   2004.06.29  이민용   박경철대리(자체)     CI변경으로 폼에서 회사명 문구 뺌
  10.40   2010.07.    지순미   구성원이 직접 제증명 출력 가능하도록 
--------------------------------------------------------------------------------}

unit PIB30100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, numedit,
  Mask, Grids, DBGrids, OnFocusButton, OnScheme, OnEditNumCtl,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, OnGrDBGrid,
  OnShapeLabel, OnInsaCommon, Tmax_session, TmaxFunc, OnPopupEdit, Calen1,
  OnSkinBtn, peoutlookbtn, OnEditMemo, OnRadioBtn, math;

const CodeErr='에러';
type                                                               
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    Panel1: TPanel;
    TDBSet2: TTMaxDataSet;
    TDml: TTMaxDataSet;
    T_LOAD1: TTMaxDataSet;
    TPrint: TTMaxDataSet;
    DataSource1: TDataSource;
    Qr_sysdate: TTMaxDataSet;
    SB_Help: TStatusBar;
    TMaxSession: TTMaxSession;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    Notebook1: TNotebook;
    MEpayra: TOnShapeLabel;
    Shape8: TShape;
    Label2: TLabel;
    Shape10: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Label1: TLabel;
    Shape11: TShape;
    ED_empno: TOnWinPopupEdit;
    DbGrid1: TOnGrDbGrid;
    CBcertkind: TOnComboEdit;
    Ecertused: TOnComboEdit;
    ME_engaddr: TOnEdit;
    CBcertterm: TOnComboEdit;
    NEcertcnt: TOnNumberEdit;
    R1_Order1: TRadioButton;
    R1_Order2: TRadioButton;
    MEtel: TOnEdit;
    BBexit: TOnFocusButton;
    BBinsert: TPeJeonOutLookBtn;
    BBdel: TPeJeonOutLookBtn;
    BBsave: TPeJeonOutLookBtn;
    BBcancel: TPeJeonOutLookBtn;
    BBPrint: TPeJeonOutLookBtn;
    DbGrid2: TOnGrDbGrid;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    R2_Order1: TRadioButton;
    R2_Order2: TRadioButton;
    R2_Order3: TRadioButton;
    R2_Order4: TRadioButton;
    BBConfirm: TPeJeonOutLookBtn;
    BT_Help: TOnFocusButton;
    P_Help: TPanel;
    E_Help: TOnMemo;
    BT_HelpClose: TOnFocusButton;
    DataSource2: TDataSource;
    T_LOAD2: TTMaxDataSet;
    Shape1: TShape;
    Label5: TLabel;
    ME_CertFrDate: TOnMaskEdit;
    ME_CertToDate: TOnMaskEdit;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    OnShapeLabel1: TOnShapeLabel;
    R_ConN: TOnRadioButton;
    R_ConY: TOnRadioButton;
    T_Dml11: TTMaxDataSet;
    OnShapeLabel2: TOnShapeLabel;
    Panel3: TPanel;
    RBcertprgb0: TRadioButton;
    RBcertprgb1: TRadioButton;
    T_Dml1: TTMaxDataSet;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBdelClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure R1_Order1Click(Sender: TObject);
//    procedure RBcertkindClick(Sender: TObject);
    procedure CBcertkindChange(Sender: TObject);
    procedure CBcerttermChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ME_engaddrKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoClick(Sender: TObject);
    procedure BBPrintClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure BT_HelpCloseClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure R2_Order1Click(Sender: TObject);
    procedure R_ConNClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME_CertFrDateChange(Sender: TObject);
    procedure ME_CertToDateChange(Sender: TObject);
    procedure BBConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    procedure DataClear1;
    Procedure InsHintTable;
    Procedure ConHintTable;
    Procedure DataIns;
    Procedure DataUpdate;
    procedure DataDel;
    procedure EmpnoFind;


  public
    { Public declarations }
    GSsysdate : String[15];    //Host Date
    GSempno   : String[4];     //Login 사번
    GSkorname : String[12];    //Login 성명
    GSgrade   : String;        //등급
    SqlText   : String;
    GSMEpayra : String;
    GSMEoffitel:String;
    chk       : Boolean;
    ZMANAGER  : boolean;       //임원관리자
    FG_date   : String;
    prtempno  : String;
    prtchmyy  : String;
    SelfCheck : String;
    vEmpno    : String;
    gsZMANAGER1, gsZMANAGER2, gsZMANAGER3, gsZMANAGER4, gsZMANAGER5 : String;

    Vcertkind, Vcertdate, VcertYear, Vcertmm, vCertnum  : String;
    Vadminyn : String; //2015.04.06.hjku.. 추가
    VDeptname, VJuminid, VStdate, VEDdate, VDuyy, VDumm, VKorname, VPresName, VCompname: String;
    VCertconyn, VCertpryn, VCertprgb : String;

    manageremp1, manageremp2, manageremp3, manageremp4, manageremp5 : String;
    Function  Get_CodeName(Acodeid, Acodeno  : String ) : String;
    procedure LoadData1;
    procedure LoadData2;
  end;

var
  FM_Main: TFM_Main;
  Scertdate, Scertkind, Vcertprdate  : String;
  SaveBy : Integer;

implementation

uses PIB3010A_emp, PIB30101, Pib30102, Pib30103, PIB30104, Inform;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  SF_Main.Refresh;
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := '인사시스템에 접속 중입니다...';


  //2016.06.09 jissi OS계정 보안강화 개선
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  //개발접속 Test
  //TMaxSession.EnvFileName := 'C:\InsaDev\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  //2014.05.15 하은영 근로소득 영수증 출력시 1년분일때는 양식 전체가 나오도록 수정
  //TMaxSession.EnvFileName := 'D:\SK_WORK\1. src\newhana.env'; //for test by 하은영
  ///////////////////////////////////////////////////////////////////////
  //TMaxSession.EnvFileName := 'D:\src\newhana.env';

  try
       TMaxSession.Connect := True;
  except
       Application.MessageBox(PChar('종합인사 APP서버 접속 실패'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
       Application.Terminate;
  FG_Date           := FM_Tmax.GetData('sysdate','','');


  ///////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;

  GSempno   := Hinsa_Param(CmdLine, 1);
  GSkorname := Hinsa_Param(CmdLine, 2);
  GSgrade   := Hinsa_Param(CmdLine, 4);
(*
  if (copy(GSempno,1,1)='Y') and (not (GSGrade[2] in (['A','B','C']))) then
  begin
       Application.MessageBox('파견직사원은 제증명 발급신청 대상자가 아닙니다.' + #13 + #13 +
                              '프로그램을 종료합니다.','[작업안내]',mb_ok);
       Application.Terminate;
  end;
*)
  with  Qr_sysdate  do
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('sysdate1'  , ftString, 100);
       AddField('sysdate7'  , ftString, 100);
       AddField('field1'    , ftString, 100);
       AddField('field2'    , ftString, 100);
       AddField('field3'    , ftString, 100);
       Sql.Clear;
       Sql.Add(' select To_Char(sysdate,   ''YYYYMMDD'') Sysdate1, ');
       Sql.Add('        To_Char(sysdate-7, ''YYYYMMDD'') Sysdate7, ');
       Sql.Add('        '''' field1,'''' field2, '''' field3       ');
       Sql.Add('   from Dual                                       ');
       Open;
       ME_CertFrDate.Text := Qr_sysdate.FieldByName('sysdate7').AsString;
       ME_CertToDate.Text := Qr_sysdate.FieldByName('sysdate1').AsString;

       GSsysdate := FieldByName('sysdate1').AsString;;
  end;

  with  TDBSet2  do
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('ZMANAGER1'  , ftString, 100);
       AddField('ZMANAGER2'  , ftString, 100);
       AddField('ZMANAGER3'  , ftString, 100);
       AddField('ZMANAGER4'  , ftString, 100);
       AddField('ZMANAGER5'  , ftString, 100);
       Sql.Clear;
       Sql.Add(' select nvl(ZMANAGER1,''ZZZZ''), ');
       Sql.Add('        nvl(ZMANAGER2,''ZZZZ''), ');
       Sql.Add('        nvl(ZMANAGER3,''ZZZZ''), ');
       Sql.Add('        nvl(ZMANAGER4,''ZZZZ''), ');
       Sql.Add('        nvl(ZMANAGER5,''ZZZZ'')  ');
       Sql.Add('   from pkzcpbas                 ');
       Open;
       gsZMANAGER1 := TDBSet2.Fields[0].AsString;
       gsZMANAGER2 := TDBSet2.Fields[1].AsString;
       gsZMANAGER3 := TDBSet2.Fields[2].AsString;
       gsZMANAGER4 := TDBSet2.Fields[3].AsString;
       gsZMANAGER5 := TDBSet2.Fields[4].AsString;

       Zmanager := false;  //임원급여 담당자
       if  ((trim(gsZMANAGER1) = GSempno) or
            (trim(gsZMANAGER2) = GSempno) or
            (trim(gsZMANAGER3) = GSempno) or
            (trim(gsZMANAGER4) = GSempno) or
            (trim(gsZMANAGER5) = GSempno))  then
            Zmanager := true;

       /////////////////////////////////////////////////////////////////////////
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('VALUE1'  , ftString, 100);
       AddField('VALUE2'  , ftString, 100);
       AddField('VALUE3'  , ftString, 100);
       AddField('VALUE4'  , ftString, 100);
       AddField('VALUE5'  , ftString, 100);
       Sql.Clear;
       Sql.Add(' select VALUE1, VALUE2, VALUE3, VALUE4, VALUE5 ');
       Sql.Add('   from pimvari                                ');
       Sql.Add('  where gubun = ''20'' and Sgubun =''0001''    ');
       Open;

       manageremp1 := TDBSet2.Fields[0].AsString;
       manageremp2 := TDBSet2.Fields[1].AsString;
       manageremp3 := TDBSet2.Fields[2].AsString;
       manageremp4 := TDBSet2.Fields[3].AsString;
       manageremp5 := TDBSet2.Fields[4].AsString;

       SB_2.Visible := False;
       if (manageremp1 = GSempno) or (manageremp2 = GSempno) or (manageremp3 = GSempno)  or
          (manageremp4 = GSempno) or (manageremp5 = GSempno) or (copy(GSempno,1,1) = 'D')  then
            SB_2.Visible := True
       Else if Zmanager  then
            SB_2.Visible := false
       Else if (copy(GSempno,1,1)='Y') then
       begin
            Application.MessageBox('파견직사원은 제증명 발급신청 대상자가 아닙니다.' + #13 + #13 +
                                   '프로그램을 종료합니다.','[작업안내]',mb_ok);
            Application.Terminate;
       end;

       Close;
  end;

  vEmpno        := GSempno;
  ED_Empno.Hint := GSempno;
  ED_EmpNo.Text := GSempno+' - '+GSkorname;

  if  (ZManager) or ((manageremp1 = GSempno) or (manageremp2 = GSempno) or (manageremp3 = GSempno)  or
                     (manageremp4 = GSempno) or (manageremp5 = GSempno) or (copy(GSempno,1,1) = 'D'))  then
  begin
       ED_Empno.ButtonWidth := 24;
       ED_Empno.Enabled     := True;

       CBcertkind.Items.Clear;
       CBcertkind.Items.Add('재직 증명서');
       CBcertkind.Items.Add('경력 증명서              : 제증명 관리자 신청/발급');
       CBcertkind.Items.Add('근로소득원천징수영수증');
       CBcertkind.Items.Add('갑근세납세필증명서(국문) : 제증명 관리자 신청/발급');
       CBcertkind.Items.Add('갑근세납세필증명서(영문) : 제증명 관리자 신청/발급');

       CBcertkind.KeyItems.Clear;
       CBcertkind.KeyItems.Add('1');
       CBcertkind.KeyItems.Add('2');
       CBcertkind.KeyItems.Add('5');
       CBcertkind.KeyItems.Add('6');
       CBcertkind.KeyItems.Add('7');
  end
  else
  begin
       ED_Empno.ButtonWidth := 0;
       ED_Empno.Enabled     := False;
       CBcertkind.Items.Clear;
       CBcertkind.Items.Add('재직 증명서');
       CBcertkind.Items.Add('근로소득원천징수영수증');

       CBcertkind.KeyItems.Clear;
       CBcertkind.KeyItems.Add('1');
       CBcertkind.KeyItems.Add('5');
  end;
  EmpnoFind;
  SB_1Click(SB_1);
end;

{작업후 등 프로그램 관리 화면을 지운다.........................................}
procedure TFM_Main.DataClear1;
begin
  chk             := True;
  CBcertkind.Text := '';
  Ecertused.text  := '';
  NEcertcnt.value := 0;
  CBcertterm.text := '';
  Vcertdate       := '';
  VcertYear       := '';
  Vcertmm         := '';
  ME_engaddr.Text := '';
  MEtel.Text      := '';
end;

procedure TFM_Main.LoadData1;
begin
  SqlText := 'SELECT NVL(CERTKIND,'' '') CERTKIND,                                          '+ #13#10 +
             '       decode(CERTKIND, ''1'', ''재직 증명서'',                               '+ #13#10 +
             '                        ''2'', ''경력 증명서'',                               '+ #13#10 +
             '                        ''5'', ''근로소득원천징수영수증'',                    '+ #13#10 +
             '                        ''6'', ''갑근세납세필증명서(국문)'',                  '+ #13#10 +
             '                        ''7'', ''갑근세납세필증명서(영문)'', ''X'') NCERTKIND,'+ #13#10 +
             '       NVL(EMPNO,'' '') EMPNO, NVL(KORNAME,'' '') KORNAME,                    '+ #13#10 +
             '       NVL(CERTDATE,'' '')         CERTDATE,   NVL(CERTUSED,'' '')  CERTUSED, '+ #13#10 +
             '       NVL(TO_CHAR(CERTCNT),''0'') CERTCNT,    NVL(CERTTERM,'' '')  CERTTERM, '+ #13#10 +
             '       NVL(CERTCONYN,''N'')        CERTCONYN,  NVL(CERTPRYN,''N'')  CERTPRYN, '+ #13#10 +
             '       NVL(CERTPRDATE,'' '')       CERTPRDATE, NVL(CERTPRNO,'' '')  CERTPRNO, '+ #13#10 +
             '       NVL(TELNO,'' '')            TELNO,      NVL(CERTPRGB,''0'')  CERTPRGB, '+ #13#10 +
             //2015.04.06.hjku.. 관리자등록여부 추가.. 이지연씨 요청..
             '       NVL(ADMINYN,''N'')          ADMINYN                                    '+ #13#10 +             
             '  FROM PIHCERT                                                                '+ #13#10 +
      //2015.04.06.hjku..admin 출력 증명은 제외.. 이지연씨 요청..
      //format(' WHERE EMPNO = ''%s'' ',[Ed_empno.hint])                                       ;
      format(' WHERE EMPNO = ''%s'' ',[Ed_empno.hint]) +  #13#10 +
             '   AND NVL(ADMINYN,''N'')<>''Y''';

  if   R1_Order1.checked = True then
       SqlText := SqlText + 'ORDER BY CERTDATE DESC  '
  else if R1_Order2.checked = True then
       SqlText := SqlText + 'ORDER BY CERTKIND, CERTDATE DESC  ';

  with T_LOAD1 do
  begin
       Close;
       ClearFieldInfo;
       AddField('CERTKIND'     , ftString,  1 );
       AddField('NCERTKIND'    , ftString,  30);
       AddField('EMPNO'        , ftString,  4 );
       AddField('KORNAME'      , ftString,  12);
       AddField('CERTDATE'     , ftString,  8 );
       AddField('CERTUSED'     , ftString,  50);
       AddField('CERTCNT'      , ftFloat ,  2 );
       AddField('CERTTERM'     , ftString,  20 );  //2017.03.13 eyha 자리수 6 -> 20
       AddField('CERTCONYN'    , ftString,  1 );
       AddField('CERTPRYN'     , ftString,  1 );
       AddField('CERTPRDATE'   , ftString,  8 );
       AddField('CERTPRNO'     , ftString,  14);
       AddField('TELNO'        , ftString,  15);
       AddField('CERTPRGB'     , ftString,  1 );
       //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
       AddField('ADMINYN'      , ftString,  1 );
       Sql.Clear;
       ServiceName := 'PIB3010A_sel1';
       Sql.Text    := SqlText;
       Open;
       FieldByName('CERTDATE').EditMask   := '!9999-99-99;0;_';
       FieldByName('CERTPRDATE').EditMask := '!9999-99-99;0;_';
  end;
  if T_LOAD1.RecordCount < 1 then SaveBy := 1;

  T_LOAD1.Fields[0].Alignment := taCenter;
  T_LOAD1.Fields[4].Alignment := taCenter;
  T_LOAD1.Fields[7].Alignment := taCenter;
  T_LOAD1.Fields[8].Alignment := taCenter;
  T_LOAD1.Fields[9].Alignment := taCenter;
end;

procedure TFM_Main.LoadData2;
begin
  SqlText := 'SELECT NVL(CERTKIND,'' '') CERTKIND,                                          '+ #13#10 +
             '       decode(CERTKIND, ''1'', ''재직 증명서'',                               '+ #13#10 +
             '                        ''2'', ''경력 증명서'',                               '+ #13#10 +
             '                        ''5'', ''근로소득원천징수영수증'',                    '+ #13#10 +
             '                        ''6'', ''갑근세납세필증명서(국문)'',                  '+ #13#10 +
             '                        ''7'', ''갑근세납세필증명서(영문)'', ''X'') NCERTKIND,'+ #13#10 +
             '       NVL(EMPNO,'' '') EMPNO, NVL(KORNAME,'' '') KORNAME,                    '+ #13#10 +
             '       NVL(CERTDATE,'' '')         CERTDATE,   NVL(CERTUSED,'' '')  CERTUSED, '+ #13#10 +
             '       NVL(TO_CHAR(CERTCNT),''0'') CERTCNT,    NVL(CERTTERM,'' '')  CERTTERM, '+ #13#10 +
             '       NVL(CERTCONYN,''N'')        CERTCONYN,  NVL(CERTPRYN,''N'')  CERTPRYN, '+ #13#10 +
             '       NVL(CERTPRDATE,'' '')       CERTPRDATE, NVL(CERTPRNO,'' '')  CERTPRNO, '+ #13#10 +
             '       NVL(TELNO,'' '')            TELNO,      NVL(CERTPRGB,''0'')  CERTPRGB, '+ #13#10 +
             //2015.04.06.hjku.. 관리자등록여부 추가.. 이지연씨 요청..
             '       NVL(ADMINYN,''N'')          ADMINYN                                    '+ #13#10 +
             '  FROM PIHCERT A                                                              ';

  if   R_ConN.Checked then
       SqlText := SqlText + ' Where CERTCONYN = ''N'' '
  else SqlText := SqlText + ' Where CERTCONYN = ''Y'' ';

      //2015.04.06.hjku..admin 출력 증명은 제외.. 이지연씨 요청..
      SqlText := SqlText + '   AND NVL(ADMINYN,''N'')<>''Y''';

  if (Length(ME_CertFrDate.Text) = 8) And (Length(ME_CertToDate.Text) = 8) then
      SqlText := SqlText + '   And (CERTDATE >= '''+ME_CertFrDate.Text+'''  '+
                           '   And  CERTDATE <= '''+ME_CertToDate.Text+''') ';

  if   R2_Order1.checked = True then
       SqlText := SqlText + ' ORDER BY CERTDATE DESC  '
  else if R2_Order2.checked = True then
       SqlText := SqlText + ' ORDER BY CERTKIND, CERTDATE DESC  '
  else if R2_Order3.checked = True then
       SqlText := SqlText + ' ORDER BY EMPNO, CERTKIND, CERTDATE DESC  '
  else if R2_Order4.checked = True then
       SqlText := SqlText + ' ORDER BY KORNAME, CERTKIND, CERTDATE DESC  ';
                           
  with T_LOAD2 do
  begin
       Close;
       ClearFieldInfo;
       AddField('CERTKIND'     , ftString,  1 );
       AddField('NCERTKIND'    , ftString,  30);
       AddField('EMPNO'        , ftString,  4 );
       AddField('KORNAME'      , ftString,  12);
       AddField('CERTDATE'     , ftString,  8 );
       AddField('CERTUSED'     , ftString,  50);
       AddField('CERTCNT'      , ftFloat ,  2 );
       AddField('CERTTERM'     , ftString,  20 );  //2017.03.13 eyha 자리수 6 -> 20
       AddField('CERTCONYN'    , ftString,  1 );
       AddField('CERTPRYN'     , ftString,  1 );
       AddField('CERTPRDATE'   , ftString,  8 );
       AddField('CERTPRNO'     , ftString,  14);
       AddField('TELNO'        , ftString,  15);
       AddField('CERTPRGB'     , ftString,  1 );
       //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
       AddField('ADMINYN'      , ftString,  1 );       
       Sql.Clear;
       ServiceName := 'PIB3010A_sel1';
       Sql.Text := SqlText;

       Open;
       FieldByName('CERTDATE').EditMask   := '!9999-99-99;0;_';
       FieldByName('CERTPRDATE').EditMask := '!9999-99-99;0;_';
  end;
  
  T_LOAD2.Fields[0].Alignment := taCenter;
  T_LOAD2.Fields[2].Alignment := taCenter;
  T_LOAD2.Fields[3].Alignment := taCenter;
  T_LOAD2.Fields[4].Alignment := taCenter;
  T_LOAD2.Fields[7].Alignment := taCenter;
  T_LOAD2.Fields[8].Alignment := taCenter;
  T_LOAD2.Fields[9].Alignment := taCenter;
end;

{종료 버튼을 눌렀을때..........................................................}
procedure TFM_Main.BBexitClick(Sender: TObject);
begin
  Close;
end;

{취소 버튼을 눌렀다............................................................}
procedure TFM_Main.BBcancelClick(Sender: TObject);
begin
  SB_Help.Panels[1].text := '';
  DataClear1;
  Loaddata1;
end;

Procedure TFM_Main.InsHintTable;
begin
  //////////////////////////////////////////////////////////////////////////////
  //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
  SendProgID  := 'PIB3010A';
  SendEmpno   := ED_empno.Hint;
  RcveEmpno   := Manageremp1;
  MailSubject := '[승인요청] 구성원('+ED_empno.Text+')의 제증명 발급 신청';
  MailBody    := '구성원('+ED_empno.Text+')이 '+CBcertkind.Text+' '+NEcertcnt.Text+'매를 발급 신청하였습니다.'+#13+#13+
                 '승인 바랍니다.'+#13+#13+
                 '[승인화면위치 안내] : 종합인사시스템 - 인사/인력개발 - 제증명 - 제증명 발급 신청 및 출력';
  ReceiveYN   := 'N';

  if Application.MessageBox('제증명 신청메일을 관리자에게 전송하시겠습니까?', '작업안내',
     MB_OKCANCEL + MB_DefButton1) <> IDOK then Exit;

  if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
  begin
       MessageDlg('신청 승인요청 메일은 전송되지 않았으나 신청내용은 저장되었습니다.'+#13+
                  '저장된 신청내용을 수정하시거나 삭제하시면 됩니다.',mtError, [mbOk], 0);
       exit;
  end
  else MessageDlg('신청 승인요청 메일전송을 성공 하였습니다...',mtInformation, [mbOk], 0);
  //////////////////////////////////////////////////////////////////////////////
end;

Procedure TFM_Main.ConHintTable;
begin
  //////////////////////////////////////////////////////////////////////////////
  //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
  SendProgID  := 'PIB3010A';
  SendEmpno   :=  GSempno;
  RcveEmpno   :=  DbGrid2.Fields[1].AsString;
  MailSubject := '[ 제증명 발급 승인 ]';
  MailBody    := '요청하신 제증명 신청을 승인하였습니다.'+#13+#13+
                 DbGrid2.Fields[4].AsString+'를 출력하시기 바랍니다.'+#13+#13+
                 '[출력화면위치 안내] : 종합인사시스템 - 인사/인력개발 - 제증명 - 제증명 발급 신청 및 출력';
  ReceiveYN   := 'N';
  if (DbGrid2.Fields[3].AsString = '1') or (DbGrid2.Fields[3].AsString = '5')  then
  begin
       if MessageDlg('제증명 승인 메일을 ' +DbGrid2.Fields[2].AsString +'님에게 전송하시겠습니까?',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

       if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       begin
            MessageDlg('승인 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
       end
       else MessageDlg('승인 메일전송을 성공 하였습니다...',mtInformation, [mbOk], 0);
  end;
  //////////////////////////////////////////////////////////////////////////////
end;

{ 해당 자료를 Insert 하는 내용.................................................. }
Procedure TFM_Main.DataIns;
var
  Tem, RBcertprgb : String;
begin
  Tem := 'SELECT EMPNO, CERTKIND, CERTDATE, '' '', '' ''  '+
         '  FROM PIHCERT                                  '+
         ' WHERE EMPNO    = '''+Ed_empno.Hint+'''         '+
         '   AND CERTKIND = '''+CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] +''' '+
         '   AND CERTDAte = '''+Copy(GSsysdate,1,8)+'''   '+
         
         //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
         '   AND NVL(ADMINYN,''N'')=''N'' ';
         
  with TDBSet2 do
  begin
       Close;
       ClearFieldInfo;
       AddField('EMPNO'     , ftString,  100);
       AddField('CERTKIND'  , ftString,  100);
       AddField('CERTDATE'  , ftString,  100);
       AddField('Field1'    , ftString,  100);
       AddField('Field2'    , ftString,  100);
       Sql.Clear;
       Sql.Text := tem;
       ServiceName := 'HINSA_select';
       open;
  end;
  
  if TDBSet2.RecordCount > 0 then
  begin
       MessageBox(handle,'기존 자료가 이미 있습니다.','작업안내',MB_ICONWARNING);
       TDBSet2.Close;
       System.Exit;
  end;

  if CBcertkind.text = '' then
  begin
     MessageBox(handle,'증명 구분을 선택하세요 .','작업안내',MB_ICONWARNING);
     CBcertkind.SetFocus;
     exit;
  end;

  if Ecertused.text = '' then
  begin
     MessageBox(handle,'용도를 선택하세요.','작업안내',MB_ICONWARNING);
     Ecertused.SetFocus;
     exit;
  end;

  if NEcertcnt.Value > 10 then
  begin
     MessageBox(handle,'10매 이상을 출력할 수 없습니다.','작업안내',MB_ICONWARNING);
     NEcertcnt.SetFocus;
     exit;
  end;

  //CBcertkind.KeyItems.st
  if CBcertterm.text = '' then
     if (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '5') or
        (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '6') or
        (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '7') then
     begin
          MessageBox(handle,'대상기간(급여)을 선택하세요 ..','작업안내',MB_ICONWARNING);
          CBcertterm.SetFocus;
          exit;
     end;

  if       RBcertprgb0.Checked then
       RBcertprgb := '0'
  else if  RBcertprgb1.Checked then
       RBcertprgb := '1';

  Tem := format('INSERT INTO PIHCERT                                       '+
                '       (CERTKIND, EMPNO,    KORNAME,   CERTDATE, CERTUSED,'+
                '        CERTCONYN, CERTPRYN, CERTCNT,   CERTTERM, PAYRA,  '+
                '        TELNO,    WRITETIME, WRITEEMP, ENGADDR, CERTPRGB) '+
                'VALUES (''%s'', ''%s'', ''%s'', ''%s'', ''%s'',           '+
                '        ''N'',  ''N'',  ''%s'', ''%s'', ''%s'',           '+
                '        ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')           ',
         [CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex], copy(ED_empno.text,1,4),
          copy(ED_empno.text,8,Length(ED_empno.Text)),       Copy(GSsysdate,1,8),
          Ecertused.text,                                    FloatToStr(NEcertcnt.value),
          CBcertterm.text,                                   GSMEpayra,
          MEtel.text,                                        GSsysdate,
          GSempno,                                           me_engaddr.text, RBcertprgb] );
  with TDml do
  begin
       Close;
       Sql.clear;
       Sql.text := Tem;
       ServiceName := 'PIB3012A_dml';
       if not Execute then
       begin
            Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
       end
       else
       begin
            MessageBox(handle,'저장되었습니다..','작업안내',MB_ICONINFORMATION);
            //재직증명서는 승인없이 출력가능(2012.05.10 HeeYong)
            //InsHintTable;
       end;
  end;
  //승인없이 출력가능(2012.05.10 HeeYong)
  BBConfirmClick(Self);
end;

{ 해당 자료를 Update 하는 내용.................................................}
Procedure TFM_Main.DataUpdate;
var
  Tem, RBcertprgb : String;
begin
  Vcertdate := T_LOAD1.FieldByName('CERTDATE').AsString;
  
  //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
  Vadminyn  := T_LOAD1.FieldByName('ADMINYN').AsString;

  if Ecertused.text = '' then
  begin
       MessageBox(handle,'용도를 선택하세요.','작업안내',MB_ICONWARNING);
       Ecertused.SetFocus;
       exit;
  end;

  if NEcertcnt.Value > 99 then
  begin
       MessageBox(handle,'발행매수가 백매를 넘을 수 없습니다.','작업안내',MB_ICONWARNING);
       NEcertcnt.SetFocus;
       exit;
  end;


  if CBcertterm.text = '' then
     if (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] = '5') or
        (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] = '6') or
        (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] = '7') then
     begin
          MessageBox(handle,'대상기간(급여)을 선택하세요 ..','작업안내',MB_ICONWARNING);
          CBcertterm.SetFocus;
          exit;
     end;

  if       RBcertprgb0.Checked then
       RBcertprgb := '0'
  else if  RBcertprgb1.Checked then
       RBcertprgb := '1';

  Tem := 'UPDATE PIHCERT SET                                      '+ #13#10 +
         '       CERTUSED  ='''+Ecertused.text+''',               '+ #13#10 +
         '       CERTCNT   ='''+FloatToStr(NEcertcnt.value)+''',  '+ #13#10 +
         '       CERTTERM  ='''+CBcertterm.text+''',              '+ #13#10 +
         '       PAYRA     ='''+GSMEpayra+''',                    '+ #13#10 +
         '       TELNO     ='''+MEtel.text+''',                   '+ #13#10 +
         '       WRITETIME ='''+GSsysdate+''',                    '+ #13#10 +
         '       WRITEEMP  ='''+GSempno+''',                      '+ #13#10 +
         '       ENGADDR   ='''+ME_Engaddr.text+''',              '+ #13#10 +
         '       CERTPRGB  ='''+RBcertprgb+'''                    '+ #13#10 +
         'WHERE (EMPNO     ='''+Ed_empno.Hint+''')                '+ #13#10 +
         '  AND (CERTKIND  ='''+CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] +''')    '+ #13#10 +
         '  AND (CERTDATE  ='''+Vcertdate+''')                     '+ #13#10 +
         '  AND (ADMINYN   ='''+Vadminyn +''')                     ';

  with TDml do
  begin
       Close;
       Sql.Clear;
       Sql.text := Tem;
       ServiceName := 'PIB3012A_dml';
       if not Execute then
       begin
           Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
       end
       else
       begin
           MessageBox(handle,'저장되었습니다..','작업안내',MB_ICONINFORMATION);
           //승인없이 출력가능(2012.05.10 HeeYong)
           //InsHintTable;
       end
  end;
  //승인없이 출력가능(2012.05.10 HeeYong)
  BBConfirmClick(Self);
end;

{ 해당 자료를 Update 하는 내용.................................................}
procedure TFM_Main.DataDel;
var
  Tem : String;
begin
  Vcertdate := T_LOAD1.FieldByName('CERTDATE').AsString;

  //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
  Vadminyn  := T_LOAD1.FieldByName('ADMINYN').AsString;

  Tem := 'DELETE FROM PIHCERT                                   '+
         ' WHERE (EMPNO ='''+ED_empno.Hint+''')                   '+
         '   AND (CERTKIND ='''+CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] +''')    '+
         '   AND (CERTDATE ='''+Vcertdate+''')                    '+
         //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
         '   AND (ADMINYN ='''+Vadminyn+''')                    ';

  with TDml do
  begin
       Close;
       Sql.Clear;
       Sql.text := Tem;
       ServiceName := 'PIB3012A_dml';
       if not Execute then
          Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
  end;
end;

procedure TFM_Main.BBsaveClick(Sender: TObject);
begin
  Scertkind := CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] ;

  if Trim(Ecertused.Text) = ''  then
  begin
       MessageBox(handle,'용도를 입력하세요 ..','작업안내',MB_ICONWARNING);
       Ecertused.SetFocus;
       exit;
  end;

  if NEcertcnt.Value = 0 then
  begin
       MessageBox(handle,'발행매수를 입력하세요 ..','작업안내',MB_ICONWARNING);
       NEcertcnt.SetFocus;
       exit;
  end;

  if Trim(MEtel.Text) = '' then
  begin
       MessageBox(handle,'전화번호를 입력하세요 ..','작업안내',MB_ICONWARNING);
       MEtel.SetFocus;
       exit;
  end;

  if (CBcertterm.text = '') and
     (( CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '5' )  or
      ( CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '6' )  or
      ( CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '7' )) then
  begin
     MessageBox(handle,'대상 기간을 정확히 입력하십시오..','입력오류',MB_ICONWARNING);
     CBcertterm.text := '';
     CBcertterm.SetFocus;
     Exit;
  end;

  if (Trim(ME_engaddr.Text) = '') and (CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '7') then
  begin
       MessageBox(handle,'[갑근세납세필증명서(영문)]일 경우에는 영문주소를 필수 입력해야 합니다.','경고',MB_ICONWARNING);
       Exit;
  end;

  If CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '5' then //원천징수영수증.
  begin
       //2015.03.17 jissi 2015년 정규직에서 임원으로 사번변경자 출력되도록 수정
       prtempno  :=  FM_Main.Ed_empno.Hint;
       prtchmyy  :=  '';
       with TDBSet2 do
       begin
            Close;
            ServiceName := 'HINSA_select';
            ClearFieldInfo;
            AddField('EMPNO'    , ftString, 100);
            AddField('CHMYY'    , ftString, 100);
            AddField('VALUE3'   , ftString, 100);
            AddField('VALUE4'   , ftString, 100);
            AddField('VALUE5'   , ftString, 100);
            Sql.Clear;
            Sql.Add('Select EMPNO, substr(startdate,1,4) ,'''','''','''' from pznewempno                  ');
            Sql.Add(' WHERE newempno  = '''+FM_Main.Ed_empno.Hint+'''                                     ');
            Sql.Add('   and startdate > ''2015''                                                          ');
            Sql.Add('   and newempno  like   ''M%''                                                       '); //2017.03.06 jissi 임원만으로 한정 제한하도록 변경
            Sql.Add('   and newempno  not in (select distinct empno from pkzyshis where workyy > ''2015'' ');
            Sql.Add('                            and to_char(sysdate,''YYYYMMDD'') >                      ');
            Sql.Add('                                to_char(to_number(workyy)+1)||''0310'')              '); //사번변경자는 2014,2015년귀속분은 1년분만 가능
            Open;

            if TDBSet2.RecordCount > 0 then
            begin
                 prtempno  := FieldByName('EMPNO').AsString;
                 prtchmyy  := FieldByName('CHMYY').AsString;
            end;
       end;

       //2017.03.13 eyha 대상기간을 : 1년분 -> 1년분(2015년), 2년분 -> 2년분(2014년~2015년), 3년분 -> 3년분(2013년~2015년)
       //if (CBcertterm.text <> '1년분') and (prtempno <> FM_Main.Ed_empno.Hint)  then
       if (TrimRight(CBcertterm.text) <> '1년분(2015년)') and (prtempno <> FM_Main.Ed_empno.Hint)  then
       begin
            MessageDlg(prtchmyy+'년도 임원 승진으로 인한 사번 변경자는 대상기간(급여) 1년분만 출력 가능합니다.',mtInformation, [mbOk], 0);
            Exit;
       end;
  end;

  if SaveBy = 0 then
  begin
      Scertdate := T_LOAD1.FieldByName('CERTDATE').AsString;
      DataUpdate;
  end
  else
  begin
      Scertdate := Copy(GSsysdate,1,8);
      DataIns;
      SaveBy := 0;
  end;

  Loaddata1;

  CBcertkind.Enabled  := False;
  RBcertprgb0.Enabled := False;
  RBcertprgb1.Enabled := False;
end;

procedure TFM_Main.BBdelClick(Sender: TObject);
begin
  SB_Help.panels[1].text := '';

  if Application.MessageBox('삭제하시겠습니까?', '작업안내', MB_OKCANCEL + MB_DefButton1) = IDOK then
  begin
       DataDel;
       Loaddata1;
  end;
end;

procedure TFM_Main.R1_Order1Click(Sender: TObject);
begin
  LoadData1;
end;

procedure TFM_Main.BBinsertClick(Sender: TObject);
begin
  if (copy(ED_empno.Hint,1,1)='Y') then
  begin
       Application.MessageBox('파견직사원은 제증명 발급신청 대상자가 아닙니다.' + #13 + #13 +
                              '프로그램을 종료합니다.','[작업안내]',mb_ok);
       Application.Terminate;
  end;
  SB_Help.Panels[1].text := '';
  CBcertkind.Enabled  := True;
  RBcertprgb0.Enabled := True;
  RBcertprgb1.Enabled := True;
  SaveBy := 1;
  BBDel.Enabled   := True;
  BBSave.Enabled  := True;
  BBCancel.Enabled:= True;
  BBPrint.Visible := False;
  DataClear1;
end;

procedure TFM_Main.CBcerttermChange(Sender: TObject);
begin
  //2017.03.13 eyha 방식 변경
  if TrimLeft(TrimRight(CBcertterm.text)) = '1' then CBcertterm.text := '1년분(2015년)';         //2017.03.13 eyha  변경전:'1년분'
  if TrimLeft(TrimRight(CBcertterm.text)) = '2' then CBcertterm.text := '2년분(2014년~2015년)';  //2017.03.13 eyha  변경전:'2년분'
  if TrimLeft(TrimRight(CBcertterm.text)) = '3' then CBcertterm.text := '3년분(2013년~2015년)';  //2017.03.13 eyha  변경전:'3년분'
end;

procedure TFM_Main.CBcertkindChange(Sender: TObject);
begin
   CBcertterm.Enabled := true;
   Ecertused.Items.Clear;
   Ecertused.Items.Add('은행 제출용');
   Ecertused.Items.Add('비자 발급용');
   Ecertused.Items.Add('회사 제출용');
   Ecertused.Items.Add('학교 제출용');
   Ecertused.Items.Add('기타(25자 내로 직접 입력하세요!)');
   //---------------------------------------------

   CBcertkind.Width    := 847;
   RBcertprgb0.checked := true;

   if CBcertkind.ItemIndex  = -1 then
      Exit;

  if CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '1' then
  begin
      CBcertkind.text := '재직 증명서';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
      CBcertterm.Enabled  := false ;
  end;

  if CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '2' then
  begin
      CBcertkind.Width    := 424;
      CBcertkind.text := '경력 증명서              : 제증명 관리자 신청/발급';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
      CBcertterm.Enabled  := false ;
  end;

  if CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '5' then
  begin
      CBcertkind.text := '근로소득원천징수영수증';
      me_engaddr.Enabled  := false ;
      me_engaddr.Visible  := false ;
  end;

  if CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex]  = '6' then
  begin
      CBcertkind.text := '갑근세납세필증명서(국문) : 제증명 관리자 신청/발급';
      ME_engaddr.Enabled  := false;
      me_engaddr.Visible  := false ;
  end;

  if CBcertkind.KeyItems.Strings[CBcertkind.ItemIndex] = '7' then
  begin
      CBcertkind.text := '갑근세납세필증명서(영문) : 제증명 관리자 신청/발급';
      ME_engaddr.enabled  := true;
      me_engaddr.Visible  := true ;
      Ecertused.Items.Add('USA VISA                           America embassy');
  end;

  if  (CBcertkind.text <> '재직 증명서')              and
      (CBcertkind.text <> '경력 증명서              : 제증명 관리자 신청/발급') and
      (CBcertkind.text <> '근로소득원천징수영수증')   and
      (CBcertkind.text <> '갑근세납세필증명서(국문) : 제증명 관리자 신청/발급') and
      (CBcertkind.text <> '갑근세납세필증명서(영문) : 제증명 관리자 신청/발급') and
      (chk <> true)                                   then
  begin
       MessageBox(handle,'증명구분을 정확히 입력하십시오..','입력오류',MB_ICONWARNING);
       CBcertkind.text := '';
       CBcertkind.SetFocus;
  end;
  chk := False;
end;

Function  TFM_Main.Get_CodeName( Acodeid,Acodeno  : String ) : String;
var Tem :String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Vcertkind       := T_LOAD1.FieldByName('CERTKIND').AsString;
  Ecertused.text  := T_LOAD1.FieldByName('CERTUSED').AsString;
  NEcertcnt.value := T_LOAD1.FieldByName('CERTCNT').AsInteger;
  CBcertterm.text := T_LOAD1.FieldByName('CERTTERM').AsString;
  Vcertdate       := T_LOAD1.FieldByName('CERTDATE').AsString;
  VcertconYN      := T_LOAD1.FieldByName('CERTCONYN').AsString;
  VcertprYN       := T_LOAD1.FieldByName('CERTPRYN').AsString;
  VcertprGB       := T_LOAD1.FieldByName('CERTPRGB').AsString;
  MEtel.Text      := T_LOAD1.FieldByName('TELNO').AsString;

  //2015.04.06.hjku.. adminyn 추가..이지연씨 요청.
  Vadminyn        := T_LOAD1.FieldByName('ADMINYN').AsString;

  if Vcertkind = '1' then CBcertkind.text := '재직 증명서';
  if Vcertkind = '2' then CBcertkind.text := '경력 증명서              : 제증명 관리자 신청/발급';
  if Vcertkind = '5' then CBcertkind.text := '근로소득원천징수영수증';
  if Vcertkind = '6' then CBcertkind.text := '갑근세납세필증명서(국문) : 제증명 관리자 신청/발급';
  if Vcertkind = '7' then CBcertkind.text := '갑근세납세필증명서(영문) : 제증명 관리자 신청/발급';

  if VcertprGB = '0' then RBcertprgb0.Checked := True;
  if VcertprGB = '1' then RBcertprgb1.Checked := True;
  if  (VcertconYN='N') And (VcertprYN='N') Then
  begin
       BBDel.Enabled   := True;
       BBSave.Enabled  := True;
       BBCancel.Enabled:= True;
       BBPrint.Visible := False;
  end
  else
  if  (VcertconYN='Y') Then
  begin
       BBDel.Enabled   := False;
       BBSave.Enabled  := False;
       BBCancel.Enabled:= False;
       BBPrint.Visible := True;
  end;

  SaveBy := 0;
  CBcertkind.Enabled  := False;
  RBcertprgb0.Enabled := False;
  RBcertprgb1.Enabled := False;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       ServiceName := 'PIB3012A_dml';
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

procedure TFM_Main.EmpnoFind;
var
  Tem :String;
begin
  if ED_empno.Hint = '' then
  begin
      BBinsert.Enabled := False;
      BBdel.Enabled    := False;
      BBsave.Enabled   := False;
      BBcancel.Enabled := False;
      BBPrint.Visible  := False;
  end
  else
  begin
      BBinsert.Enabled := True;
      BBdel.Enabled    := True;
      BBsave.Enabled   := True;
      BBcancel.Enabled := True;
      BBPrint.Visible  := False;
  end;

  Tem := 'SELECT NVL(PAYRA,'' '') ,  NVL(b.DEPTNAME,'' ''),                        '+
         '       NVL(SUBSTR(JUMINID,1,6) || + '' - *******'','' '') JUMINID,       '+
         '       NVL(ORGEMPDATE,'' ''),                                            '+
         '       Decode(Trim(RETDATE),'''',to_char(sysdate,''YYYYMMDD''),RETDATE), '+
         '       to_char(NVL(HANADUYY,0),''00''), to_char(NVL(HANADUMM,0),''00''),  '+
         '       NVL(KORNAME,'' '') , c.PRESNAME, replace(c.CORPNAME,''(주)'',''주식회사'') '+
         '  FROM PIMPMAS a,  pycdept b,  pkcpbas c      '+
         ' WHERE (A.EMPNO = '''+Ed_empno.Hint+''')      '+
         '   AND (A.ORGNUM = B.ORGNUM)                  '+
         '   AND (A.DEPTCODE = B.DEPTCODE)              ';

  with  TDBSet2  do
  begin
       Close;
       ClearFieldInfo;
       AddField('PAYRA'     , ftString, 100);
       AddField('DEPTNAME'  , ftString, 100);
       AddField('JUMINID'   , ftString, 100);
       AddField('ORGEMPDATE', ftString, 100);
       AddField('RETDATE'   , ftString, 100);
       AddField('HANADUYY'  , ftString, 100);
       AddField('HANADUMM'  , ftString, 100);
       AddField('KORNAME'   , ftString, 100);
       AddField('PRESNAME'  , ftString, 100);
       AddField('COMPNAME'  , ftString, 100);
       Sql.Clear;
       Sql.Text := Tem;
       ServiceName := 'HINSA_select10';
       Open;

       GSMEpayra  := FieldByName('PAYRA').AsString;
       MEpayra.ValueCaption := Get_CodeName('I113',FieldByName('payra').AsString);    //직위
       VDeptname  := FieldByName('DEPTNAME').AsString;
       VJuminid   := FieldByName('JUMINID').AsString;
       VStdate    := FieldByName('ORGEMPDATE').AsString;
       VEDdate    := FieldByName('RETDATE').AsString;
       VDuYY      := FieldByName('HANADUYY').AsString;
       VDuMM      := FieldByName('HANADUMM').AsString;
       VKORNAME   := FieldByName('KORNAME').AsString;
       VPresName  := FieldByName('PRESNAME').AsString;
       VCompNAME  := FieldByName('COMPNAME').AsString;
       Close;
  end;

  DataClear1;
  Loaddata1;
end;

procedure TFM_Main.ME_engaddrKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#1..#127]) then  key := #0; //영문만 입력 받아 지도록
end;


procedure TFM_Main.ED_empnoCloseUp(Sender: TObject; var Text: String;
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

procedure TFM_Main.ED_empnoInitPopup(Sender: TObject);
begin

  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.BE_Key.text  := '';
  FM_empno.search_empno;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFM_Main.ED_empnoClick(Sender: TObject);
begin
  ED_empno.SelectAll;
end;

procedure TFM_Main.BBPrintClick(Sender: TObject);
var tem2 :String;
var Tem1 : String;
begin
  if VcertPrYN = 'Y' then
  begin
       Application.Messagebox('이미 발행한 자료로 인쇄하실 수 없습니다.','작업안내',MB_ICONWARNING);
       Exit;
  end;

  prtempno := Ed_empno.hint;

  SqlText := 'SELECT NVL(CERTKIND,'' '') CERTKIND,                                          '+ #13#10 +
             '       decode(CERTKIND, ''1'', ''재직 증명서'',                               '+ #13#10 +
             '                        ''2'', ''경력 증명서'',                               '+ #13#10 +
             '                        ''5'', ''근로소득원천징수영수증'',                    '+ #13#10 +
             '                        ''6'', ''갑근세납세필증명서(국문)'',                  '+ #13#10 +
             '                        ''7'', ''갑근세납세필증명서(영문)'', ''X'') NCERTKIND,'+ #13#10 +
             '       NVL(EMPNO,'' '') EMPNO, NVL(KORNAME,'' '') KORNAME,                    '+ #13#10 +
             '       NVL(CERTDATE,'' '')         CERTDATE,   NVL(CERTUSED,'' '')  CERTUSED, '+ #13#10 +
             '       NVL(TO_CHAR(CERTCNT),''0'') CERTCNT,    NVL(CERTTERM,'' '')  CERTTERM, '+ #13#10 +
             '       NVL(CERTCONYN,''N'')        CERTCONYN,  NVL(CERTPRYN,''N'')  CERTPRYN, '+ #13#10 +
             '       NVL(CERTPRDATE,'' '')       CERTPRDATE,                                '+ #13#10 +
             '       A.CertPrNo||Trim(To_char(b.Rcnt,''00'')) CERTPRNO,                     '+ #13#10 +
             '       NVL(TELNO,'' '')            TELNO,      NVL(CERTPRGB,''0'')  CERTPRGB, '+ #13#10 +
             //2015.04.06.hjku.. 관리자등록여부 추가.. 이지연씨 요청..
             '       NVL(ADMINYN,''N'')          ADMINYN                                    '+ #13#10 +
             '  FROM PIHCERT A, (select Rownum Rcnt, orgempdate from pimpmas) b             '+ #13#10 +
      format(' WHERE (( (a.CERTCNT* Nvl(SubStr(CERTTERM,1,1),1) >= b.Rcnt )))               '+ #13#10 +
//           '                           AND (a.CERTCNT* Nvl(CERTPRCNT,0)          ) < b.Rcnt ))                 '+
//           '   or    ((Certpryn = ''Y'') and (a.CERTCNT* Nvl(CERTPRCNT,0) *Nvl(SubStr(CERTTERM,1,1),1) >= b.Rcnt '+
//           '                           AND (a.CERTCNT* Nvl(CERTPRCNT,0)-a.CERTCNT) < b.Rcnt ))   )               '+
             '  AND (EMPNO    = ''%s'')                                                     '+ #13#10 +
             '  AND (CERTKIND = ''%s'')                                                     '+ #13#10 +
             //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
             //'  AND (CERTDATE = ''%s'') ' ,[Ed_empno.hint,Vcertkind,Vcertdate]);
             '  AND (CERTDATE = ''%s'')                                                     '+ #13#10 +  
             '  AND (ADMINYN = ''%s'') ' ,[Ed_empno.hint,Vcertkind,Vcertdate,Vadminyn]);

  with TPrint do
  begin
       Close;
       ClearFieldInfo;
       AddField('CERTKIND'     , ftString,  1 );
       AddField('NCERTKIND'    , ftString,  30);
       AddField('EMPNO'        , ftString,  4 );
       AddField('KORNAME '     , ftString,  12);
       AddField('CERTDATE'     , ftString,  8 );
       AddField('CERTUSED'     , ftString,  50);
       AddField('CERTCNT'      , ftFloat ,  2 );
       AddField('CERTTERM'     , ftString,  20); //2017.03.13 eyha 자리수 6 -> 20
       AddField('CERTCONYN'    , ftString,  1 );
       AddField('CERTPRYN'     , ftString,  1 );
       AddField('CERTPRDATE'   , ftString,  8 );
       AddField('CERTPRNO'     , ftString,  14);
       AddField('TELNO'        , ftString,  15);
       AddField('CERTPRGB'     , ftString,  1 );
       //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
       AddField('ADMINYN'      , ftString,  1 );
       Sql.Clear;
       ServiceName := 'PIB3010A_sel1';
       Sql.Text := SqlText;
       Open;
  end;

  If   Vcertkind = '1' then      //재직증명서
  begin
       Fm_Pib30101 := TFm_Pib30101.Create(Self);
       Fm_Pib30101.inReport.Preview;
  end
  else If Vcertkind = '2' then //경력증명서
  begin
       //if TPrint.FieldByName('CERTPRGB').AsString = '0' then
          MessageBox(handle,'경력증명서는 노사협력팀 담당자에게 출력을 의뢰하시기 바랍니다.','출력오류',MB_ICONWARNING)
       //else
       //begin
       //   Fm_Pib30103 := TFm_Pib30103.Create(Self);
       //   Fm_Pib30103.inReport.Preview;
       //end;
  end
  else If Vcertkind = '5' then //원천징수영수증.
  begin
       //2015.03.26 jissi 손필영M 요청 : 임원 본인 확인 로직추가
       if (copy(Ed_empno.hint,1,1) = 'M') then
       begin

            LoginForm  := TLoginForm.Create(Self);
            LoginForm.E_empno.Text := Ed_empno.hint;
            LoginForm.ShowModal;
       end
       else
            SelfCheck := '1';

       if   SelfCheck <> '1' then     Exit;

       //2015.03.17 jissi 2015년 정규직에서 임원으로 사번변경자 출력되도록 수정
       with TDBSet2 do
       begin
            Close;
            ServiceName := 'HINSA_select';
            ClearFieldInfo;
            AddField('EMPNO'   , ftString, 100);
            AddField('VALUE2'  , ftString, 100);
            AddField('VALUE3'  , ftString, 100);
            AddField('VALUE4'  , ftString, 100);
            AddField('VALUE5'  , ftString, 100);
            Sql.Clear;
            Sql.Add('Select EMPNO, '''','''','''','''' from pznewempno                                     ');
            Sql.Add(' WHERE newempno  = '''+FM_Main.Ed_empno.Hint+'''                                      ');
            Sql.Add('   and startdate > ''2015''                                                           ');
            Sql.Add('   and newempno  like ''M%''                                                          ');  //2017.03.06 jissi 임원만으로 한정 제한하도록 변경
            Sql.Add('   and newempno  not in (select distinct empno from pkzyshis where workyy >=''2015''  ');
            Sql.Add('                            and to_char(sysdate,''YYYYMMDD'') >                       ');
            Sql.Add('                                to_char(to_number(workyy)+1)||''0310'')               ');  //2015.03.26 jissi 3/10지급명세서 제출이후 최후정산년도 출력가능토록 루틴 추가
            Open;

            if TDBSet2.RecordCount > 0 then
                 prtempno  := FieldByName('EMPNO').AsString;
       end;

       //2014.05.15 하은영 1년분을 선택하면 해당년도 전체양식으로 출력되고 나머지는 영수증 앞장 첫번째 페이지만 출력되도록 수정
       //Fm_Pib30102 := TFm_Pib30102.Create(Self);
       //Fm_Pib30102.QuickRep1.Preview;
       if (TrimRight(CBcertterm.text) = '1년분(2015년)') then //2015.05.26 jissi 임원들도 1년분은 전체장수 출력되도록 수정  and (copy(prtempno,1,1) <> 'M')         //2017.03.13 eyha 변경전:'1년분'
       begin
         //추가
         Fm_Pib30104 := TFm_Pib30104.Create(Self);
         //2015.01.30 하은영 인쇄 매수 처리되도록 수정
         Fm_Pib30104.QRCompositeReport1.PrinterSettings.Copies := strtoint(Floattostr(NEcertcnt.value));
         Fm_Pib30104.QRCompositeReport1.Preview;
         Fm_Pib30104.Free;

         Tem1 := 'UPDATE PIHCERT SET                            '+#13+
                 '       CERTPRDATE='''+FM_Main.GSsysdate+''',  '+#13+
                 '       CERTPRYN  =''Y'',                      '+#13+
                 '       CERTPRCNT = (CERTPRCNT + 1)            '+#13+
                 ' WHERE EMPNO    ='''+FM_Main.Ed_empno.Hint+''''+#13+
                 '   AND CERTKIND ='''+FM_Main.Vcertkind+'''    '+#13+
                 '   AND CERTDATE ='''+FM_Main.Vcertdate+'''    '+#13+
                 //2015.04.06.hjku.. 추가
                 '   AND ADMINYN ='''+FM_Main.Vadminyn  +'''    ';

         with T_Dml1 do
         begin
              Close;
              Sql.Clear;
              Sql.Text := Tem1;
              ServiceName := 'PIB3012A_dml';

              if not Execute then
              begin
                   Application.Messagebox('발행 내역 저장에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
                   system.exit;
              end
              else //MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
         end;

         LoadData1;
       end
       else
       begin
         Fm_Pib30102 := TFm_Pib30102.Create(Self);
         Fm_Pib30102.QuickRep1.Preview;
       end;
   end
   else If ( Vcertkind = '6') or ( Vcertkind = '7') then //갑근세납세필증명서
   begin
        MessageBox(handle,'갑근세납세필증명서는 노사협력팀 담당자에게 출력을 의뢰하시기 바랍니다.','출력오류',MB_ICONWARNING);
   end;
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  LoadData1;
  LoadData2;
  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TFM_Main.BT_HelpCloseClick(Sender: TObject);
begin
  P_Help.Visible := False;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  P_Help.Top := 104;
  P_Help.Left:= 75;
  P_Help.Visible := True;
end;

procedure TFM_Main.R2_Order1Click(Sender: TObject);
begin
  LoadData2;
end;

procedure TFM_Main.R_ConNClick(Sender: TObject);
begin
  if  R_ConY.Checked then BBConfirm.Caption := '재출력 승인'
  else                    BBConfirm.Caption := '승인 처리';
  
  LoadData2;
end;

procedure TFM_Main.SpeedButton2Click(Sender: TObject);
begin
  calendar := TCalendar.Create(Self);
  Try
       calendar.Caption := '조회 시작일';
       calendar.ShowModal;
       If calendar.DayCaption = '' then exit;
       ME_CertFrDate.Text := calendar.DayCaption;
  Finally
       calendar.Free;
  end;
end;

procedure TFM_Main.SpeedButton1Click(Sender: TObject);
begin
  calendar := TCalendar.Create(Self);
  Try
       calendar.Caption := '조회 종료일';
       calendar.ShowModal;
       If calendar.DayCaption = '' then exit;
       ME_CertToDate.Text := calendar.DayCaption;
  Finally
       calendar.Free;
  end;
end;

procedure TFM_Main.ME_CertFrDateChange(Sender: TObject);
begin
  if length(ME_CertFrDate.Text) = 8 then LoadData2;
end;

procedure TFM_Main.ME_CertToDateChange(Sender: TObject);
begin
  if length(ME_CertToDate.Text) = 8 then LoadData2;
end;

procedure TFM_Main.BBConfirmClick(Sender: TObject);
var
   RowCnt : integer;
   Tem, VCertprno : String;
begin
(*
  if  T_LOAD2.RecordCount <= 0 then
  begin
       MessageBox(handle,'처리할 자료가 없습니다.','처리오류',MB_ICONWARNING);
       System.Exit;
  end;
*)

  if BBConfirm.Caption = '승인 처리' then
  begin
       Loaddata2;
       RowCnt := 0;
       with DbGrid2.DataSource.DataSet do
       begin
            if DbGrid2.SelectedRows.Count = 0 then
            begin
                 Tem := 'SELECT Lpad(To_char(to_number(substr(Max(Certprno),7,4))+1),4,''0''),      '+
                        '        '' '', '' '',  '' '', '' ''                                        '+
                        '  FROM PIHCERT                                                             '+
                        ' WHERE (CERTKIND = '''+DbGrid2.Fields[3].AsString+''')                     '+
                        '   AND (CERTDATE like '''+copy(DbGrid2.Fields[0].AsString,1,6)+'''||''%'') ';
                 with TDBSet2 do
                 begin
                      Close;
                      ClearFieldInfo;
                      AddField('Field1'    , ftString,  100);
                      AddField('Field2'    , ftString,  100);
                      AddField('Field3'    , ftString,  100);
                      AddField('Field4'    , ftString,  100);
                      AddField('Field5'    , ftString,  100);
                      Sql.Clear;
                      Sql.Text := tem;
                      ServiceName := 'HINSA_select';
                      open;

                      if  TDBSet2.Fields[0].AsString = '' then
                           vCertprno := copy(DbGrid2.Fields[0].AsString,1,6) + '0001'
                      else
                           vCertprno := copy(DbGrid2.Fields[0].AsString,1,6) +  TDBSet2.Fields[0].AsString;
                 end;

                 with TDml do
                 begin
                      ServiceName := 'PIB3012A_dml';
                      Close;
                      SQL.Clear;
                      Sql.Add('update PIHCERT                                            ');
                      Sql.Add('   set CERTCONYN = ''Y'',                                 ');
                      Sql.Add('       CERTPRNO  = '''+vCertprno+''',                     ');
                      Sql.Add('	WRITETIME = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                      Sql.Add('       WRITEEMP  = '''+GSempno+'''                        ');
                      Sql.Add(' where CERTDATE  = '''+DbGrid2.Fields[0].AsString+'''     ');
                      Sql.Add('   and EMPNO     = '''+DbGrid2.Fields[1].AsString+'''     ');
                      Sql.Add('   and CERTKIND  = '''+DbGrid2.Fields[3].AsString+'''     ');
                      Sql.Add('   and CERTCONYN = ''N''                                  ');
                      //2015.04.06.hjku.. adminyn 추가..이지연씨 요청.
                      Sql.Add('   and ADMINYN   = '''+DbGrid2.Fields[11].AsString+'''    ');


                      if not Execute then
                      begin
                           Application.MessageBox('승인 처리 작업을 실패했습니다.2','작업실패',MB_OK);
                           Exit;
                      end
                      else
                      begin
                           //승인없이 출력가능(2012.05.10 HeeYong)
                           //ConHintTable;
                      end;
                 end;
            end
            else
            while DbGrid2.SelectedRows.Count > RowCnt do
            begin
                 GotoBookmark(pointer(DbGrid2.SelectedRows.Items[RowCnt]));
                 Tem := 'SELECT Lpad(To_char(to_number(substr(Max(Certprno),7,4))+1),4,''0''),      '+
                        '        '' '', '' '',  '' '', '' ''                                        '+
                        '  FROM PIHCERT                                                             '+
                        ' WHERE (CERTKIND = '''+DbGrid2.Fields[3].AsString+''')                     '+
                        '   AND (CERTDATE like '''+copy(DbGrid2.Fields[0].AsString,1,6)+'''||''%'') ';
                 with TDBSet2 do
                 begin
                      Close;
                      ClearFieldInfo;
                      AddField('Field1'    , ftString,  100);
                      AddField('Field2'    , ftString,  100);
                      AddField('Field3'    , ftString,  100);
                      AddField('Field4'    , ftString,  100);
                      AddField('Field5'    , ftString,  100);
                      Sql.Clear;
                      Sql.Text := tem;
                      ServiceName := 'HINSA_select';
                      open;

                      if  TDBSet2.Fields[0].AsString = '' then
                           vCertprno := copy(DbGrid2.Fields[0].AsString,1,6) + '0001'
                      else
                           vCertprno := copy(DbGrid2.Fields[0].AsString,1,6) +  TDBSet2.Fields[0].AsString;
                 end;

                 with TDml do
                 begin
                      ServiceName := 'PIB3012A_dml';
                      Close;
                      SQL.Clear;
                      Sql.Add('update PIHCERT                                            ');
                      Sql.Add('   set CERTCONYN = ''Y'',                                 ');
                      Sql.Add('       CERTPRNO  = '''+vCertprno+''',                     ');
                      Sql.Add('	WRITETIME = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                      Sql.Add('       WRITEEMP  = '''+GSempno+'''                        ');
                      Sql.Add(' where CERTDATE  = '''+DbGrid2.Fields[0].AsString+'''     ');
                      Sql.Add('   and EMPNO     = '''+DbGrid2.Fields[1].AsString+'''     ');
                      Sql.Add('   and CERTKIND  = '''+DbGrid2.Fields[3].AsString+'''     ');
                      Sql.Add('   and CERTCONYN = ''N''                                  ');
                      //2015.04.06.hjku.. adminyn 추가..이지연씨 요청.
                      Sql.Add('   and ADMINYN   = '''+DbGrid2.Fields[11].AsString+'''    ');

                      if not Execute then
                      begin
                           Application.MessageBox('승인 처리 작업을 실패했습니다.1','작업실패',MB_OK);
                           Exit;
                      end
                      else
                      begin
                           //승인없이 출력가능(2012.05.10 HeeYong)
                           //ConHintTable;
                      end;
                 end;
                 Inc(RowCnt);
            end;
       end;
  end
  else
  if Application.MessageBox('재출력을 승인하시겠습니까 ?', '작업안내', MB_OKCANCEL + MB_DefButton1) = IDOK then
  begin
       RowCnt := 0;
       with DbGrid2.DataSource.DataSet do
       begin
            if DbGrid2.SelectedRows.Count = 0 then
            begin
                if DbGrid2.Fields[9].AsString = 'N' then
                begin
                     MessageBox(handle,'해당 자료는 이미 출력 가능한 상태의 자료입니다.','재출력 승인 오류',MB_ICONWARNING);
                     Exit;
                end;
                with TDml do
                begin
                     ServiceName := 'PIB3012A_dml';
                     Close;
                     SQL.Clear;
                     Sql.Add('update PIHCERT                                            ');
                     Sql.Add('   set CERTPRYN = ''N'',                                  ');
                     Sql.Add('	WRITETIME = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                     Sql.Add('       WRITEEMP  = '''+GSempno+'''                        ');
                     Sql.Add(' where CERTDATE  = '''+DbGrid2.Fields[0].AsString+'''     ');
                     Sql.Add('   and EMPNO     = '''+DbGrid2.Fields[1].AsString+'''     ');
                     Sql.Add('   and CERTKIND  = '''+DbGrid2.Fields[3].AsString+'''     ');
                     Sql.Add('   and CERTPRYN = ''Y''                                  ');

                     //2015.04.06.hjku.. adminyn 추가..이지연씨 요청.
                     Sql.Add('   and ADMINYN   = '''+DbGrid2.Fields[11].AsString+'''    ');


                     if not Execute then
                     begin
                          Application.MessageBox('재출력 승인 처리 작업을 실패했습니다.2','작업실패',MB_OK);
                          Exit;
                     end;
                end;
            end
            else
            while DbGrid2.SelectedRows.Count > RowCnt do
            begin
                GotoBookmark(pointer(DbGrid2.SelectedRows.Items[RowCnt]));
                with TDml do
                begin
                     ServiceName := 'PIB3012A_dml';
                     Close;
                     SQL.Clear;
                     Sql.Add('update PIHCERT                                            ');
                     Sql.Add('   set CERTPRYN  = ''N'',                                 ');
                     Sql.Add('	WRITETIME = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                     Sql.Add('       WRITEEMP  = '''+GSempno+'''                        ');
                     Sql.Add(' where CERTDATE  = '''+DbGrid2.Fields[0].AsString+'''     ');
                     Sql.Add('   and EMPNO     = '''+DbGrid2.Fields[1].AsString+'''     ');
                     Sql.Add('   and CERTKIND  = '''+DbGrid2.Fields[3].AsString+'''     ');
                     Sql.Add('   and CERTPRYN  = ''Y''                                  ');

                      //2015.04.06.hjku.. adminyn 추가..이지연씨 요청.
                      Sql.Add('   and ADMINYN   = '''+DbGrid2.Fields[11].AsString+'''    ');                     

                     if not Execute then
                     begin
                          Application.MessageBox('재출력 승인 처리 작업을 실패했습니다.1','작업실패',MB_OK);
                          Exit;
                     end;
                end;
                Inc(RowCnt);
            end;
       end;
  end;
  LoadData2;
end;


end.
