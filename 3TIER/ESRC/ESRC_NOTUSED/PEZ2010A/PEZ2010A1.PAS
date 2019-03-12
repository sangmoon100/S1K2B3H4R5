{-------------------------------------------------------------------------------
  o 프로그램명 : 임원 자기평가 프로그램
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 급여
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2008.03.
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부

-------------------------------------------------------------------------------}
unit pez2010a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton,
  OnOneInstance, Db, DBAccess, Ora, Func, OnEditNumCtl, OnEditMdate,
  Grids, DBGrids, OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnShapeLabel, MemDS, OnLineLabel, OnGifimage, jpeg,
  OnEditMemo, OnRadioBtn, Pass, TmaxFunc, Tmax_session, OnInsaCommon,
  OnPopupEdit, Tmax_DataSetText;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    BT_Next: TOnFocusButton;
    BT_Prior: TOnFocusButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    L_Korname: TOnSectionLabel;
    Shape1: TShape;
    L_Birth: TOnSectionLabel;
    L_Empdate: TOnSectionLabel;
    L_Payra: TOnSectionLabel;
    L_PayclDate: TOnSectionLabel;
    L_PayraDate: TOnSectionLabel;
    L_Rabasdate: TOnSectionLabel;
    L_Paycl: TOnSectionLabel;
    Shape2: TShape;
    Image1: TImage;
    Label1: TLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnMemo1: TOnMemo;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnMemo4: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo6: TOnMemo;
    OnMemo7: TOnMemo;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    OnShapeLabel19: TOnShapeLabel;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel21: TOnShapeLabel;
    OnShapeLabel34: TOnShapeLabel;
    OnShapeLabel35: TOnShapeLabel;
    Shape5: TShape;
    OnShapeLabel36: TOnShapeLabel;
    Panel3: TPanel;
    OnShapeLabel37: TOnShapeLabel;
    OnShapeLabel38: TOnShapeLabel;
    OnShapeLabel39: TOnShapeLabel;
    OnShapeLabel40: TOnShapeLabel;
    OnShapeLabel41: TOnShapeLabel;
    RB5_5: TOnRadioButton;
    RB5_4: TOnRadioButton;
    RB5_3: TOnRadioButton;
    RB5_2: TOnRadioButton;
    RB5_1: TOnRadioButton;
    Panel4: TPanel;
    OnShapeLabel42: TOnShapeLabel;
    OnShapeLabel43: TOnShapeLabel;
    OnShapeLabel44: TOnShapeLabel;
    OnShapeLabel45: TOnShapeLabel;
    OnShapeLabel46: TOnShapeLabel;
    RB6_5: TOnRadioButton;
    RB6_4: TOnRadioButton;
    RB6_3: TOnRadioButton;
    RB6_2: TOnRadioButton;
    RB6_1: TOnRadioButton;
    TabSheet7: TTabSheet;
    BT_Save: TOnFocusButton;
    BT_Send: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    TabSheet8: TTabSheet;
    Label15: TLabel;
    OnShapeLabel66: TOnShapeLabel;
    Label22: TLabel;
    Label19: TLabel;
    OnShapeLabel67: TOnShapeLabel;
    E_Opinion9: TOnMemo;
    Panel9: TPanel;
    Label16: TLabel;
    RB_Opinion63: TRadioButton;
    RB_Opinion62: TRadioButton;
    RB_Opinion61: TRadioButton;
    Panel10: TPanel;
    RB_Opinion75: TRadioButton;
    RB_Opinion74: TRadioButton;
    RB_Opinion73: TRadioButton;
    RB_Opinion72: TRadioButton;
    RB_Opinion71: TRadioButton;
    E_Opinion7: TEdit;
    Panel11: TPanel;
    Label7: TLabel;
    OnShapeLabel57: TOnShapeLabel;
    OnShapeLabel58: TOnShapeLabel;
    Shape7: TShape;
    Label8: TLabel;
    OnShapeLabel65: TOnShapeLabel;
    Label9: TLabel;
    OnShapeLabel61: TOnShapeLabel;
    Label12: TLabel;
    Label13: TLabel;
    OnShapeLabel59: TOnShapeLabel;
    Label14: TLabel;
    OnShapeLabel62: TOnShapeLabel;
    OnShapeLabel63: TOnShapeLabel;
    E_Opinion1: TOnMemo;
    E_Opinion2: TOnMemo;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    OnShapeLabel49: TOnShapeLabel;
    Label6: TLabel;
    OnShapeLabel70: TOnShapeLabel;
    OnShapeLabel71: TOnShapeLabel;
    Label20: TLabel;
    TMaxSession: TTMaxSession;
    E_Sql: TEdit;
    RB_Opinion35: TOnRadioButton;
    RB_Opinion34: TOnRadioButton;
    RB_Opinion33: TOnRadioButton;
    RB_Opinion32: TOnRadioButton;
    RB_Opinion31: TOnRadioButton;
    RB_Opinion45: TOnRadioButton;
    RB_Opinion44: TOnRadioButton;
    RB_Opinion43: TOnRadioButton;
    RB_Opinion42: TOnRadioButton;
    RB_Opinion41: TOnRadioButton;
    RB_Opinion55: TOnRadioButton;
    RB_Opinion54: TOnRadioButton;
    RB_Opinion53: TOnRadioButton;
    RB_Opinion52: TOnRadioButton;
    RB_Opinion51: TOnRadioButton;
    Label11: TLabel;
    Label21: TLabel;
    OnMemo2: TOnMemo;
    OnMemo3: TOnMemo;
    OnMemo10: TOnMemo;
    Label2: TLabel;
    OnShapeLabel18: TOnShapeLabel;
    OnMemo11: TOnMemo;
    OnMemo12: TOnMemo;
    OnMemo13: TOnMemo;
    OnMemo14: TOnMemo;
    OnMemo15: TOnMemo;
    OnMemo16: TOnMemo;
    OnMemo17: TOnMemo;
    Label17: TLabel;
    OnMemo18: TOnMemo;
    OnMemo19: TOnMemo;
    OnMemo20: TOnMemo;
    Label3: TLabel;
    OnShapeLabel33: TOnShapeLabel;
    OnMemo21: TOnMemo;
    OnMemo22: TOnMemo;
    OnMemo23: TOnMemo;
    OnMemo24: TOnMemo;
    OnMemo25: TOnMemo;
    OnMemo26: TOnMemo;
    OnMemo27: TOnMemo;
    OnMemo28: TOnMemo;
    OnMemo29: TOnMemo;
    OnMemo30: TOnMemo;
    Shape3: TShape;
    OnShapeLabel68: TOnShapeLabel;
    Label18: TLabel;
    OnShapeLabel72: TOnShapeLabel;
    Panel12: TPanel;
    OnShapeLabel73: TOnShapeLabel;
    OnShapeLabel74: TOnShapeLabel;
    OnShapeLabel75: TOnShapeLabel;
    OnShapeLabel76: TOnShapeLabel;
    OnShapeLabel77: TOnShapeLabel;
    RB7_5: TOnRadioButton;
    RB7_4: TOnRadioButton;
    RB7_3: TOnRadioButton;
    RB7_2: TOnRadioButton;
    RB7_1: TOnRadioButton;
    Panel13: TPanel;
    OnShapeLabel78: TOnShapeLabel;
    OnShapeLabel79: TOnShapeLabel;
    OnShapeLabel80: TOnShapeLabel;
    OnShapeLabel81: TOnShapeLabel;
    OnShapeLabel82: TOnShapeLabel;
    RB8_5: TOnRadioButton;
    RB8_4: TOnRadioButton;
    RB8_3: TOnRadioButton;
    RB8_2: TOnRadioButton;
    RB8_1: TOnRadioButton;
    OnMemo36: TOnMemo;
    OnMemo37: TOnMemo;
    OnMemo38: TOnMemo;
    OnMemo39: TOnMemo;
    OnMemo40: TOnMemo;
    OnMemo41: TOnMemo;
    OnMemo42: TOnMemo;
    OnMemo43: TOnMemo;
    OnMemo44: TOnMemo;
    OnMemo45: TOnMemo;
    OnShapeLabel47: TOnShapeLabel;
    Label5: TLabel;
    OnShapeLabel50: TOnShapeLabel;
    Panel5: TPanel;
    OnShapeLabel51: TOnShapeLabel;
    OnShapeLabel52: TOnShapeLabel;
    OnShapeLabel53: TOnShapeLabel;
    OnShapeLabel54: TOnShapeLabel;
    OnShapeLabel55: TOnShapeLabel;
    RB9_5: TOnRadioButton;
    RB9_4: TOnRadioButton;
    RB9_3: TOnRadioButton;
    RB9_2: TOnRadioButton;
    RB9_1: TOnRadioButton;
    OnMemo32: TOnMemo;
    OnMemo34: TOnMemo;
    OnMemo35: TOnMemo;
    OnMemo31: TOnMemo;
    OnMemo33: TOnMemo;
    E_Opinion8: TOnWinPopupEdit;
    TMaxDataSet: TTMaxDataSet;
    BT_Help: TOnFocusButton;
    Pan_Help: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Panel15: TPanel;
    BT_HelpExit: TOnFocusButton;
    E_LoginEmp: TOnEdit;
    OnShapeLabel8: TOnShapeLabel;
    OnShapeLabel9: TOnShapeLabel;
    OnShapeLabel10: TOnShapeLabel;
    OnShapeLabel11: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    RB1_5: TOnRadioButton;
    RB1_4: TOnRadioButton;
    RB1_3: TOnRadioButton;
    RB1_2: TOnRadioButton;
    RB1_1: TOnRadioButton;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    OnShapeLabel14: TOnShapeLabel;
    OnShapeLabel15: TOnShapeLabel;
    OnShapeLabel16: TOnShapeLabel;
    RB2_5: TOnRadioButton;
    RB2_4: TOnRadioButton;
    RB2_3: TOnRadioButton;
    RB2_2: TOnRadioButton;
    RB2_1: TOnRadioButton;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel23: TOnShapeLabel;
    OnShapeLabel24: TOnShapeLabel;
    OnShapeLabel25: TOnShapeLabel;
    OnShapeLabel26: TOnShapeLabel;
    RB3_5: TOnRadioButton;
    RB3_4: TOnRadioButton;
    RB3_3: TOnRadioButton;
    RB3_2: TOnRadioButton;
    RB3_1: TOnRadioButton;
    OnShapeLabel27: TOnShapeLabel;
    OnShapeLabel28: TOnShapeLabel;
    OnShapeLabel29: TOnShapeLabel;
    OnShapeLabel30: TOnShapeLabel;
    OnShapeLabel31: TOnShapeLabel;
    RB4_5: TOnRadioButton;
    RB4_4: TOnRadioButton;
    RB4_3: TOnRadioButton;
    RB4_2: TOnRadioButton;
    RB4_1: TOnRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel14: TPanel;
    L_EmpList1: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label27: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BT_NextClick(Sender: TObject);
    procedure BT_PriorClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure RB_Opinion75Click(Sender: TObject);
    procedure RB_Opinion61Click(Sender: TObject);
    procedure RB_Opinion63Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E_Opinion8CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_Opinion8InitPopup(Sender: TObject);
    procedure BT_SendClick(Sender: TObject);
    procedure BT_HelpExitClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure E_LoginEmpChange(Sender: TObject);
    procedure E_Opinion1Click(Sender: TObject);
    procedure E_Opinion9Click(Sender: TObject);

  private
    { Private declarations }
    procedure Read_SaveData;
    Function  NoInputCheck : Boolean;

  public
    { Public declarations }
     vRabasdate, vOrgnum,    vLoginEmp,  vSysDate,   vOldEmpDept: String;
     vSelfYN,    vSelfConYN, vSendYN   : String;
     vCapacity1, vCapacity2, vCapacity3, vCapacity4, vCapacity5 : Integer;
     vCapacity6, vCapacity7, vCapacity8, vCapacity9             : Integer;
     vOpinion1,  vOpinion2,  vOpinion7,  vOpinion8,  vOpinion9  : String;
     vOpinion3,  vOpinion4,  vOpinion5,  vOpinion6              : Integer;
     vPosition : Boolean;
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}
 uses pez2010a_dept;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_Help.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10); //'12.4.13.90'; //
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  // 정상실행여부체크
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  BT_HelpClick(Sender);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vSysDate          := FM_Tmax.GetSysTime;   //ShowMessage(vSysDate);

  //FM_Main.Position := poDefault;
  vPosition := True;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  vLoginEmp := Passemp(cmdline,1);

  if (Passemp(cmdline,1) <> '2245') and (Copy(Passemp(cmdline,1),1,1) <> 'D') then E_LoginEmp.Visible := False;
  if Length(E_LoginEmp.Text) = 4 then vLoginEmp := UpperCase(E_LoginEmp.Text);

  SB_Help.Panels[1].Text := '저장된 자료를 읽고 있습니다. 잠시만 기다려 주십시요..';

  vSelfYN    := '';
  vSelfConYN := '';

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT rabasdate, orgnum, ''field3'', ''field4'',''field5'' '+
                   '  FROM PEZCPBAS                                             ';

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;
       vRabasdate := Fields[0].AsString;
       vOrgnum    := Fields[1].AsString;    //Showmessage(vRabasdate);

       //////////////
       Close;
       Sql.Clear;
       Sql.Text := 'select nvl(selfyn,''N''), nvl(selfconyn,''N''),  '+#13+
                   '       ''field3'', ''field4'',''field5''         '+#13+
                   '  from pezcamas                                  '+#13+
                   ' where rabasdate = '''+ vRabasdate +'''          '+#13+
                   '   and empno     = '''+ vLoginEmp  +'''          ';
       Open;
       vSelfYN    := Fields[0].AsString;   //Showmessage(vSelfConYN);
       vSelfConYN := Fields[1].AsString;   //Showmessage(vSelfConYN);

       //권한체크.
       if   (vLoginEmp <> '2245') and (Copy(vLoginEmp,1,1) <> 'D') then
       begin
            if   (TMaxDataSet.RecordCount = 0) or (vSelfYN = 'N') then
            begin
                 MessageDlg(' 귀하는 자기평가 대상자가 아닙니다.'+#13+#13+
                            ' 프로그램을 종료합니다.', mtConfirmation, [mbOk], 0);
                 FM_Main.Close;
                 Exit;
            end;

            if   vSelfConYN = 'Y' then
            begin
                 BT_Save.Enabled := False;
                 BT_Send.Enabled := False;
                 MessageDlg(' 귀하는 자기평가를 완료하여 열람만 가능합니다. ', mtConfirmation, [mbOk], 0);
            end;
       end;
  end;

  //////////////////////////////////////////////////////////////////////////////

  //인적사항 Read...
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas2';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno, korname, juminid, empdate, paydunm, orgnum,                                     '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.deptcode) deptname, '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.jobdept ) jobdeptnm,'+
                   '      (select codename from pyccode where codeid= ''I112'' and codeno  =a.paycl   ) payclnm,  '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.payra   ) payranm,  '+
                   '       cpaycldate,   cpayradate,   selfyn,    selfconyn,    selfcondate,                      '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe1payra) e1payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe2payra) e2payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe3payra) e3payra, '+
                   '       dwe1empno, dwe1korname, dwe1conyn, dwe1condate, dwe1objyn, dwe1objdate,                '+
                   '       dwe2empno, dwe2korname, dwe2conyn, dwe2condate, dwe2objyn, dwe2objdate,                '+
                   '       dwe3empno, dwe3korname, dwe3conyn, dwe3condate                                         '+
                   '  from PEZCAMAS A                                                                             '+
                   ' where rabasdate = '''+ vRabasdate                  +'''                                      '+
                   '   and empno     = '''+ vLoginEmp                   +'''                                      ';

       ClearFieldInfo;
       AddField('EMPNO'       , ftString, 4);
       AddField('KORNAME'     , ftString, 20);
       AddField('JUMINID'     , ftString, 14);
       AddField('EMPDATE'     , ftString, 8);
       AddField('PAYDUNM'     , ftString, 30);
       AddField('ORGNUM'      , ftString, 3);
       AddField('DEPTNAME'    , ftString, 60);
       AddField('JOBDEPTNM'   , ftString, 60);
       AddField('PAYCLNM'     , ftString, 20);
       AddField('PAYRANM'     , ftString, 20);
       AddField('CPAYCLDATE'  , ftString, 18);
       AddField('CPAYRADATE'  , ftString, 18);
       AddField('SELFYN'      , ftString, 1);
       AddField('SELFCONYN'   , ftString, 1);
       AddField('SELFCONDATE' , ftString, 14);
       AddField('E1PAYRA'     , ftString, 20);
       AddField('E2PAYRA'     , ftString, 20);
       AddField('E3PAYRA'     , ftString, 20);
       AddField('E1EMPNO'     , ftString, 4);
       AddField('E1KORNAME'   , ftString, 20);
       AddField('E1CONYN'     , ftString, 1);
       AddField('E1CONDATE'   , ftString, 8);
       AddField('E1OBJYN'     , ftString, 1);
       AddField('E1OBJDATE'   , ftString, 8);
       AddField('E2EMPNO'     , ftString, 4);
       AddField('E2KORNAME'   , ftString, 20);
       AddField('E2CONYN'     , ftString, 1);
       AddField('E2CONDATE'   , ftString, 8);
       AddField('E2OBJYN'     , ftString, 1);
       AddField('E2OBJDATE'   , ftString, 8);
       AddField('E3EMPNO'     , ftString, 4);
       AddField('E3KORNAME'   , ftString, 20);
       AddField('E3CONYN'     , ftString, 1);
       AddField('E3CONDATE'   , ftString, 8);       //E_Sql.Text := sql.text;
       Open;

       L_Korname.Caption   := '성          명 : '   + FieldByName('KORNAME').AsString;
       L_Payra.Caption     := '직          책 : '   + FieldByName('PAYRANM').AsString;
       //L_PayclDate.Caption   := '현BAND 승진일 :   ' + Hinsa_DisplayDate(FieldByName('CPAYCLDATE').AsString,'-');
       L_Paycl.Caption       := '직    무    명 :   ' + FieldByName('PAYDUNM').AsString;

       //L_Birth.Caption       := '생  년  월  일   : ' + Hinsa_DisplayDate('19'+FieldByName('JUMINID').AsString,'-');
       //L_Empdate.Caption     := '입  사  일  자   : ' + Hinsa_DisplayDate(FieldByName('EMPDATE').AsString,'-');
       //L_PayraDate.Caption := '현직책/직무보임일: ' + FieldByName('CPAYRADATE').AsString;
       L_Rabasdate.Caption := '평  가  일  자  : ' + Hinsa_DisplayDate(vSysDate,'-');
  end;

  Read_SaveData;
end;

procedure TFM_Main.Read_SaveData;
var i      : Integer;
begin
  // 기 저장된 내역 Read ///////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2010A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,                                                     '+#13+
                   '       nvl(Capacity1,0),   nvl(Capacity2,0),   nvl(Capacity3,0),  '+#13+
                   '       nvl(Capacity4,0),   nvl(Capacity5,0),   nvl(Capacity6,0),  '+#13+
                   '	   nvl(Capacity7,0),   nvl(Capacity8,0),   nvl(Capacity9,0),  '+#13+
                   '       nvl(Opinion1,''''), nvl(Opinion2,''''), nvl(Opinion3,0) ,  '+#13+
                   '       nvl(Opinion4,0),    nvl(Opinion5,0),    nvl(Opinion6,0) ,  '+#13+
                   '	   nvl(Opinion7,''''), nvl(Opinion8,''''), nvl(Opinion9,'''') '+#13+
                   '  from pezsemas                                                   '+#13+
                   ' where rabasdate = '''+ vRabasdate +'''                           '+#13+
                   '   and empno     = '''+ vLoginEmp  +'''                           ';
       ClearFieldInfo;
       AddField('EMPNO'      , ftString , 4);
       AddField('Capacity1'  , ftInteger, 1);
       AddField('Capacity2'  , ftInteger, 1);
       AddField('Capacity3'  , ftInteger, 1);
       AddField('Capacity4'  , ftInteger, 1);
       AddField('Capacity5'  , ftInteger, 1);
       AddField('Capacity6'  , ftInteger, 1);
       AddField('Capacity7'  , ftInteger, 1);
       AddField('Capacity8'  , ftInteger, 1);
       AddField('Capacity9'  , ftInteger, 1);
       AddField('Opinion1'   , ftString , 1000);
       AddField('Opinion2'   , ftString , 1000);
       AddField('Opinion3'   , ftInteger, 1);
       AddField('Opinion4'   , ftInteger, 1);
       AddField('Opinion5'   , ftInteger, 1);
       AddField('Opinion6'   , ftInteger, 1);
       AddField('Opinion7'   , ftString , 100);
       AddField('Opinion8'   , ftString , 8);
       AddField('Opinion9'   , ftString , 1000);     E_Sql.Text := Sql.Text;
       Open;         // ShowMessage(inttostr(TMaxDataSet.RecordCount));
       
       for i := 1 to 5 do
       begin
            if FieldByName('Capacity1').AsInteger = i then TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity2').AsInteger = i then TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity3').AsInteger = i then TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity4').AsInteger = i then TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity5').AsInteger = i then TOnRadioButton(Self.FindComponent('RB5_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity6').AsInteger = i then TOnRadioButton(Self.FindComponent('RB6_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity7').AsInteger = i then TOnRadioButton(Self.FindComponent('RB7_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity8').AsInteger = i then TOnRadioButton(Self.FindComponent('RB8_'+IntToStr(i))).Checked := True;
            if FieldByName('Capacity9').AsInteger = i then TOnRadioButton(Self.FindComponent('RB9_'+IntToStr(i))).Checked := True;
            ////////////////////////////////////////////////////////////////////
            if FieldByName('Opinion3').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion3'+IntToStr(i))).Checked := True;
            if FieldByName('Opinion4').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion4'+IntToStr(i))).Checked := True;
            if FieldByName('Opinion5').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion5'+IntToStr(i))).Checked := True;
       end; 

       if      FieldByName('Opinion6').AsInteger = 3 then RB_Opinion63.Checked := True
       else if FieldByName('Opinion6').AsInteger = 2 then RB_Opinion62.Checked := True
       else
       begin
            RB_Opinion61.Checked := True;
            RB_Opinion61Click(nil);
       end;

       E_Opinion1.Text := FieldByName('Opinion1').AsString;
       E_Opinion2.Text := FieldByName('Opinion2').AsString;

       if      FieldByName('Opinion7').AsString = '다양한 직무를 경험하고 싶다.'                           then RB_Opinion75.Checked := True
       else if FieldByName('Opinion7').AsString = '다른 직무에서 보다 능력을 발휘할 수 있으리라 생각한다.' then RB_Opinion74.Checked := True
       else if FieldByName('Opinion7').AsString = '부서의 인간관계 / 분위기의 변화를 찾고 싶다.'           then RB_Opinion73.Checked := True
       else if FieldByName('Opinion7').AsString = '가족관계 / 연고지를 고려하여 근무지를 옮기고 싶다.'     then RB_Opinion72.Checked := True
       else if FieldByName('Opinion7').AsString <> ''                                                      then
       begin
            RB_Opinion71.Checked := True;
            E_Opinion7.Text := FieldByName('Opinion7').AsString;
       end;

       vOldEmpDept := Trim(FieldByName('Opinion8').AsString);
       if   vOldEmpDept <> '' then
       begin
            FM_Tmax           := TFM_Tmax.Create(Self);
            FM_Tmax.T_Session := TMaxSession;
            E_Opinion8.Text   := FM_Tmax.GetData('deptname', vOrgnum, vOldEmpDept);
       end;

       E_Opinion9.Text := FieldByName('Opinion9').AsString;
       Close;
  end;

  E_Opinion1.Font.Color := clBlack;
  E_Opinion2.Font.Color := clBlack;
  E_Opinion9.Font.Color := clBlack;
  if Trim(E_Opinion1.Text) = '' then E_Opinion1.Text := '한글 기준 500자까지 등록 가능합니다. (Max 1000Byte)';
  if Trim(E_Opinion2.Text) = '' then E_Opinion2.Text := '한글 기준 500자까지 등록 가능합니다. (Max 1000Byte)';
  if Trim(E_Opinion9.Text) = '' then E_Opinion9.Text := '한글 기준 500자까지 등록 가능합니다. (Max 1000Byte)';
  if Pos('(Max 1000Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Font.Color := clGray;
  if Pos('(Max 1000Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Font.Color := clGray;
  if Pos('(Max 1000Byte)',E_Opinion9.Text) > 0 then E_Opinion9.Font.Color := clGray;
  
  PageControl1.ActivePage := TabSheet1;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.E_Opinion8CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
       E_Opinion8.Text := DeptForm.GSdeptname; //  vOpinion8      := DeptForm.GSdeptcode;
  end;
end;

procedure TFM_Main.E_Opinion8InitPopup(Sender: TObject);
begin
 // DeptForm := TDeptForm.Create(Self);
  DeptForm.TDS1.Session := TMaxSession;
  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_Find.Text  := E_Opinion8.Text;
  DeptForm.E_FindButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.BT_NextClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet1  then PageControl1.ActivePage := TabSheet2
  else if PageControl1.ActivePage = TabSheet2  then PageControl1.ActivePage := TabSheet3
  else if PageControl1.ActivePage = TabSheet3  then PageControl1.ActivePage := TabSheet4
  else if PageControl1.ActivePage = TabSheet4  then PageControl1.ActivePage := TabSheet5
  else if PageControl1.ActivePage = TabSheet5  then PageControl1.ActivePage := TabSheet6
  else if PageControl1.ActivePage = TabSheet6  then PageControl1.ActivePage := TabSheet7
  else if PageControl1.ActivePage = TabSheet7  then PageControl1.ActivePage := TabSheet8;

  PageControl1Change(Sender);
end;

procedure TFM_Main.BT_PriorClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet8  then PageControl1.ActivePage := TabSheet7
  else if PageControl1.ActivePage = TabSheet7  then PageControl1.ActivePage := TabSheet6
  else if PageControl1.ActivePage = TabSheet6  then PageControl1.ActivePage := TabSheet5
  else if PageControl1.ActivePage = TabSheet5  then PageControl1.ActivePage := TabSheet4
  else if PageControl1.ActivePage = TabSheet4  then PageControl1.ActivePage := TabSheet3
  else if PageControl1.ActivePage = TabSheet3  then PageControl1.ActivePage := TabSheet2
  else if PageControl1.ActivePage = TabSheet2  then PageControl1.ActivePage := TabSheet1;

  PageControl1Change(Sender);
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  if      PageControl1.ActivePage =  TabSheet1 then BT_Prior.Enabled := False;
  if      PageControl1.ActivePage =  TabSheet8 then BT_Next.Enabled  := False;
  if      PageControl1.ActivePage <> TabSheet1 then BT_Prior.Enabled := True;
  if      PageControl1.ActivePage <> TabSheet8 then BT_Next.Enabled  := True;

  if vPosition = True then FM_Main.Top := FM_Main.Top - 5;
  if vPosition = True then vPosition := False;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
    Close;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
    i, vCnt  : Integer;
    ParamSQL : String;
    FL_Comp  : TOnRadioButton;
begin
  if Pos('(Max 1000Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Text := '';
  if Pos('(Max 1000Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Text := '';
  if Pos('(Max 1000Byte)',E_Opinion9.Text) > 0 then E_Opinion9.Text := '';

  if (not RB_Opinion61.Checked) and (E_Opinion8.Text = '') then
  begin
       MessageDlg('이동희망시기를 선택하셨습니다. '+#13+
                  '이동희망사유와 이동희망부서를 선택하시기 바랍니다.', mtInformation, [mbOK], 0);
       Exit;
  end;

  if (RB_Opinion71.Checked) and (Trim(E_Opinion7.Text) = '') then
  begin
       MessageDlg('이동희망사유를 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
       Exit;
  end;
  
  //if MessageDlg('평가내역을 저장하시겠습니까?    '+#13+#13+
  //              '평가완료전에는 추가 수정 가능합니다.'+#13+
  //              '평가완료 버튼을 클릭하여야 상사에게 전달에 됩니다.', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  //////////////////////////////////////////////////////////////////////////////
  for i := 1 to 5 do
  begin
       FL_Comp := nil;
       FL_Comp := TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity1 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity2 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity3 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity4 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB5_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity5 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB6_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity6 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB7_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity7 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB8_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity8 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB9_'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity9 := FL_Comp.Tag;

       ////////////////////////////////////////////////////////////////////////
       FL_Comp := TOnRadioButton(Self.FindComponent('RB_Opinion3'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vOpinion3 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB_Opinion4'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vOpinion4 := FL_Comp.Tag;

       FL_Comp := TOnRadioButton(Self.FindComponent('RB_Opinion5'+IntToStr(i)));
       if (FL_Comp <> nil) and (FL_Comp.Checked) then vOpinion5 := FL_Comp.Tag;
  end;

  if RB_Opinion63.Checked then vOpinion6 := 3;
  if RB_Opinion62.Checked then vOpinion6 := 2;
  if RB_Opinion61.Checked then vOpinion6 := 1; //ShowMessage(IntToStr(vOpinion6));

  vOpinion1 := E_Opinion1.Text;
  vOpinion2 := E_Opinion2.Text;
  vOpinion7 := '';
  vOpinion8 := '';
  vOpinion9 := E_Opinion9.Text;
  if   not RB_Opinion61.Checked then
  begin
       if RB_Opinion71.Checked then vOpinion7 := E_Opinion7.Text;
       if RB_Opinion72.Checked then vOpinion7 := '가족관계 / 연고지를 고려하여 근무지를 옮기고 싶다.';
       if RB_Opinion73.Checked then vOpinion7 := '부서의 인간관계 / 분위기의 변화를 찾고 싶다.';
       if RB_Opinion74.Checked then vOpinion7 := '다른 직무에서 보다 능력을 발휘할 수 있으리라 생각한다.';
       if RB_Opinion75.Checked then vOpinion7 := '다양한 직무를 경험하고 싶다.';

       FM_Tmax           := TFM_Tmax.Create(Self);
       FM_Tmax.T_Session := TMaxSession;
       if   E_Opinion8.Text = FM_Tmax.GetData('deptname', vOrgnum, vOldEmpDept) then vOpinion8 := vOldEmpDept
       else                                                                          vOpinion8 := DeptForm.GSdeptcode;
  end;
  //////////////////////////////////////////////////////////////////////////////

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT count(*), ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM PEZSEMAS                                                '+
                   ' WHERE rabasdate = '''+ vRabasdate +'''                        '+
                   '   AND empno     = '''+ vLoginEmp  +'''                        ';

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;
       if   Fields[0].AsString = '' then vCnt := 0
       else                              vCnt := Fields[0].AsInteger;
       Close;
  end;

  if   vCnt = 0 then
  begin
       ParamSQL := 'Insert into PEZSEMAS                   '+#13+
                   '  values                               '+#13+
                   '( '''+ vRabasdate           +''',      '+#13+
                   '  '''+ vLoginEmp            +''',      '+#13+
                   '  '''+ IntToStr(vCapacity1) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity2) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity3) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity4) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity5) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity6) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity7) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity8) +''',      '+#13+
                   '  '''+ IntToStr(vCapacity9) +''',      '+#13+
                   '  '''+ vOpinion1            +''',      '+#13+
                   '  '''+ vOpinion2            +''',      '+#13+
                   '  '''+ IntToStr(vOpinion3)  +''',      '+#13+
                   '  '''+ IntToStr(vOpinion4)  +''',      '+#13+
                   '  '''+ IntToStr(vOpinion5)  +''',      '+#13+
                   '  '''+ IntToStr(vOpinion6)  +''',      '+#13+
                   '  '''+ vOpinion7            +''',      '+#13+
                   '  '''+ vOpinion8            +''',      '+#13+
                   '  '''+ vOpinion9            +''',      '+#13+
                   '  '''+ vLoginEmp            +''',      '+#13+
                   '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') )';
  end
  else
  begin
       ParamSQL := 'Update PEZSEMAS                                               '+#13+
                   '   Set Capacity1   = '''+ IntToStr(vCapacity1)          +''', '+#13+
                   '       Capacity2   = '''+ IntToStr(vCapacity2)          +''', '+#13+
                   '       Capacity3   = '''+ IntToStr(vCapacity3)          +''', '+#13+
                   '       Capacity4   = '''+ IntToStr(vCapacity4)          +''', '+#13+
                   '       Capacity5   = '''+ IntToStr(vCapacity5)          +''', '+#13+
                   '       Capacity6   = '''+ IntToStr(vCapacity6)          +''', '+#13+
                   '       Capacity7   = '''+ IntToStr(vCapacity7)          +''', '+#13+
                   '       Capacity8   = '''+ IntToStr(vCapacity8)          +''', '+#13+
                   '       Capacity9   = '''+ IntToStr(vCapacity9)          +''', '+#13+
                   '       Opinion1    = '''+ vOpinion1                     +''', '+#13+
                   '       Opinion2    = '''+ vOpinion2                     +''', '+#13+
                   '       Opinion3    = '''+ IntToStr(vOpinion3)           +''', '+#13+
                   '       Opinion4    = '''+ IntToStr(vOpinion4)           +''', '+#13+
                   '       Opinion5    = '''+ IntToStr(vOpinion5)           +''', '+#13+
                   '       Opinion6    = '''+ IntToStr(vOpinion6)           +''', '+#13+
                   '       Opinion7    = '''+ vOpinion7                     +''', '+#13+
                   '       Opinion8    = '''+ vOpinion8                     +''', '+#13+
                   '       Opinion9    = '''+ vOpinion9                     +''', '+#13+
                   '       writeman    = '''+ vLoginEmp                     +''', '+#13+
                   '       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')      '+#13+
                   ' Where Rabasdate   = '''+ vRabasdate                    +'''  '+#13+
                   '   And Empno       = '''+ vLoginEmp                     +'''  ';
  end;
  TMaxDataSet.Close;

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);        E_SQL.Text := SQl.text;

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  if vSendYN <> 'Y' then
     MessageDlg('저장이 완료되었습니다.    '+#13+#13+
                '평가완료 전에는 수정 가능합니다.'+#13+#13+
                '평가완료 버튼을 클릭하여야 상사에게 전달에 됩니다.', mtConfirmation, [mbOk], 0);

  SB_Help.Panels[1].Text := ' 저장 완료';
  Application.ProcessMessages;
  vSendYN := 'N';
end;

procedure TFM_Main.RB_Opinion75Click(Sender: TObject);
begin
  E_Opinion7.Text := '';
end;

procedure TFM_Main.RB_Opinion61Click(Sender: TObject);
begin
  E_Opinion7.Text      := '';
  E_Opinion8.Text      := '';
  E_Opinion7.Enabled   := False;
  E_Opinion8.Enabled   := False;
  RB_Opinion71.Enabled := False;
  RB_Opinion72.Enabled := False;
  RB_Opinion73.Enabled := False;
  RB_Opinion74.Enabled := False;
  RB_Opinion75.Enabled := False;
  RB_Opinion71.Checked := False;
  RB_Opinion72.Checked := False;
  RB_Opinion73.Checked := False;
  RB_Opinion74.Checked := False;
  RB_Opinion75.Checked := False;
end;

procedure TFM_Main.RB_Opinion63Click(Sender: TObject);
begin
  E_Opinion7.Enabled   := True;
  E_Opinion8.Enabled   := True;
  RB_Opinion71.Enabled := True;
  RB_Opinion72.Enabled := True;
  RB_Opinion73.Enabled := True;
  RB_Opinion74.Enabled := True;
  RB_Opinion75.Enabled := True;
  
  RB_Opinion75.Checked := True;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_SendClick(Sender: TObject);
var
    ParamSQL : String;
begin
  if MessageDlg('평가내역을 상사에게 평가완료하시겠습니까? '+#13+#13+
                '평가완료후에는 수정이 불가능합니다.       ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  vSendYN := 'Y';
  BT_SaveClick(nil);             //최종 내역 자동 저장

  if not NoInputCheck then Exit; //입력 체크.
    
  ParamSQL := 'Update pezcamas                                               '+#13+
              '   Set selfconyn   = ''Y''                                  , '+#13+
              '       selfcondate = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')    , '+#13+
              '       writeman    = '''+ vLoginEmp                     +''', '+#13+
              '       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')      '+#13+
              ' Where Rabasdate   = '''+ vRabasdate                    +'''  '+#13+
              '   And Empno       = '''+ vLoginEmp                     +'''  ';

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);        E_SQL.Text := SQl.text;

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  vSelfConYN      := 'Y';
  BT_Save.Enabled := False;
  BT_Send.Enabled := False;

  MessageDlg(' 평가완료 되었습니다. ', mtConfirmation, [mbOk], 0);
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 귀하는 자기평가를 완료하여 열람만 가능합니다. ';
end;

procedure TFM_Main.BT_HelpExitClick(Sender: TObject);
begin
  Pan_Help.Visible := False;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  Pan_Help.Top     := 170;
  Pan_Help.Left    := 155;
  Pan_Help.Visible := True;
end;

procedure TFM_Main.E_LoginEmpChange(Sender: TObject);
begin
  if Length(E_LoginEmp.Text) = 4 then FormShow(nil);
end;

Function TFM_Main.NoInputCheck : Boolean;
var iCnt : Integer;
begin
  Read_SaveData;

  iCnt := 0;
  Result := False;

  TMaxDataSet.Open;
  with TMaxDataSet do
  begin
       if FieldByName('Capacity1').AsInteger < 1 then
       begin
            ShowMessage('기업관 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet2;   Exit;
       end;
       if FieldByName('Capacity2').AsInteger < 1 then
       begin
            ShowMessage('전략적 사고 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet2;   Exit;
       end;
       if FieldByName('Capacity3').AsInteger < 1 then
       begin
            ShowMessage('Globalization 추구 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet3;   Exit;
       end;
       if FieldByName('Capacity4').AsInteger < 1 then
       begin
            ShowMessage('인력활용 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet3;   Exit;
       end;
       if FieldByName('Capacity5').AsInteger < 1 then
       begin
            ShowMessage('인재육성 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet4;   Exit;
       end;
       if FieldByName('Capacity6').AsInteger < 1 then
       begin
            ShowMessage('SUPEX 추구 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet4;   Exit;
       end;
       if FieldByName('Capacity7').AsInteger < 1 then
       begin
            ShowMessage('경영지식 및 경험 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet5;   Exit;
       end;
       if FieldByName('Capacity8').AsInteger < 1 then
       begin
            ShowMessage('변화선도 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet5;   Exit;
       end;
       if FieldByName('Capacity9').AsInteger < 1 then
       begin
            ShowMessage('패기 및 건강관리 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet6;   Exit;
       end;

       if FieldByName('Opinion1').AsString = '' then
       begin
            ShowMessage('종합의견(강점) 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;
       if FieldByName('Opinion2').AsString = '' then
       begin
            ShowMessage('종합의견(단점) 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;
       if FieldByName('Opinion3').AsInteger < 1 then
       begin
            ShowMessage('담당 업무의 양 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;
       if FieldByName('Opinion4').AsInteger < 1 then
       begin
            ShowMessage('업무의 난이도 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;
       if FieldByName('Opinion5').AsInteger < 1 then
       begin
            ShowMessage('업무적성/난이도 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;
       if (FieldByName('Opinion6').AsInteger <> 1) and (FieldByName('Opinion7').AsString = '') then
       begin
            ShowMessage('이동희망사유 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet8;   Exit;
       end;
       if (FieldByName('Opinion6').AsInteger <> 1) and (FieldByName('Opinion8').AsString = '') then
       begin
            ShowMessage('이동희망부서 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet8;   Exit;
       end;
       if FieldByName('Opinion9').AsString = '' then
       begin
            ShowMessage('담당 업무 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet8;   Exit;
       end;
  end;
  Result := True;//if iCnt > 0 then  ShowMessage(IntToStr(iCnt)+'건의 평가가 누락되어 있습니다. 확인후 완료하시기 바랍니다.');
end;

procedure TFM_Main.E_Opinion1Click(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Text := '';
  if Pos('(Max 1000Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Text := '';
  E_Opinion1.Font.Color := clBlack;
  E_Opinion2.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion9Click(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',E_Opinion9.Text) > 0 then E_Opinion9.Text := '';
  E_Opinion9.Font.Color := clBlack;
end;

end.
