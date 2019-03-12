{-------------------------------------------------------------------------------
  o 프로그램명 : 개인별 건강검진 내역 열람
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 복리후생/우리사주 - 건강관리
  o 작성자     : 지순미
  o 버전       : 1.00
  o 작성일자   : 2013.03.14
  o 변경 이력사항
    버전   일자        작성자  변경내용                              처리명세서 반영여부
    1.15   2012.12.20  지순미  신규개발                              SR-1303-0426
-------------------------------------------------------------------------------}
unit PSJ1050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, StdCtrls, OnFocusButton, Db,
  MemDS, DBAccess, jpeg,  Grids, DBGrids, OnInsaCommon, TmaxFunc,
  OnGraphicLib, OnEditNumCtl, OnEditMemo, Tmax_session, Tmax_DataSetText, OnPopupEdit,
  OnGrDBGrid, Buttons;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    L_Paydunm: TOnShapeLabel;
    L_Pstate: TOnShapeLabel;
    L_empdate: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    L_jobdept: TOnShapeLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    OnShapeLabel1: TOnShapeLabel;
    SB_Help: TStatusBar;
    BT_Exit: TOnFocusButton;
    BT_Search: TOnFocusButton;
    Panel2: TPanel;
    PersonPic: TImage;
    L_juminid: TOnShapeLabel;
    L_retcont: TOnShapeLabel;
    E_Value001: TOnNumberEdit;
    E_Value002: TOnNumberEdit;
    E_Value004: TOnNumberEdit;
    E_Value005: TOnNumberEdit;
    E_Value003: TOnEdit;
    E_Value006: TOnNumberEdit;
    E_Value007: TOnNumberEdit;
    E_Value008: TOnEdit;
    E_Value009: TOnEdit;
    E_Value010: TOnEdit;
    E_Value011: TOnEdit;
    E_Value012: TOnEdit;
    E_Value013: TOnEdit;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    E_Value014: TOnNumberEdit;
    E_Value015: TOnNumberEdit;
    E_Value017: TOnNumberEdit;
    E_Value018: TOnNumberEdit;
    E_Value016: TOnNumberEdit;
    OnShapeLabel7: TOnShapeLabel;
    E_Value019: TOnNumberEdit;
    E_Value020: TOnNumberEdit;
    OnShapeLabel8: TOnShapeLabel;
    E_Value021: TOnNumberEdit;
    E_Value022: TOnNumberEdit;
    E_Value023: TOnNumberEdit;
    E_Value026: TOnNumberEdit;
    E_Value025: TOnNumberEdit;
    E_Value024: TOnNumberEdit;
    OnShapeLabel9: TOnShapeLabel;
    E_Value027: TOnNumberEdit;
    E_Value028: TOnNumberEdit;
    E_Value029: TOnNumberEdit;
    OnShapeLabel10: TOnShapeLabel;
    E_Value030: TOnNumberEdit;
    E_Value031: TOnNumberEdit;
    OnShapeLabel11: TOnShapeLabel;
    E_Value032: TOnNumberEdit;
    E_Value033: TOnNumberEdit;
    E_Value034: TOnNumberEdit;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    E_Value035: TOnNumberEdit;
    OnShapeLabel14: TOnShapeLabel;
    E_Value036: TOnEdit;
    E_Value037: TOnEdit;
    E_Value038: TOnEdit;
    E_Value039: TOnEdit;
    E_Value040: TOnEdit;
    OnShapeLabel15: TOnShapeLabel;
    E_Value041: TOnNumberEdit;
    E_Value042: TOnNumberEdit;
    E_Value043: TOnNumberEdit;
    E_Value044: TOnNumberEdit;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel17: TOnShapeLabel;
    E_Value048: TOnNumberEdit;
    E_Value049: TOnEdit;
    E_Value050: TOnEdit;
    E_Value051: TOnEdit;
    E_Value052: TOnEdit;
    E_Value053: TOnEdit;
    E_Value054: TOnEdit;
    OnShapeLabel21: TOnShapeLabel;
    E_Value058: TOnEdit;
    E_Value059: TOnEdit;
    E_Value060: TOnEdit;
    E_Value061: TOnEdit;
    E_Value062: TOnEdit;
    E_Value063: TOnEdit;
    E_Value064: TOnEdit;
    OnShapeLabel22: TOnShapeLabel;
    E_Value065: TOnEdit;
    E_Value066: TOnEdit;
    E_Value067: TOnEdit;
    OnShapeLabel23: TOnShapeLabel;
    E_Value068: TOnEdit;
    E_Value069: TOnEdit;
    OnShapeLabel24: TOnShapeLabel;
    E_Value070: TOnEdit;
    E_Value071: TOnEdit;
    E_Value072: TOnEdit;
    OnShapeLabel25: TOnShapeLabel;
    E_Value073: TOnEdit;
    E_Value074: TOnEdit;
    OnShapeLabel26: TOnShapeLabel;
    E_Value075: TOnMemo;
    OnShapeLabel19: TOnShapeLabel;
    OnShapeLabel20: TOnShapeLabel;
    E_Value057: TOnEdit;
    E_Value056: TOnEdit;
    OnShapeLabel27: TOnShapeLabel;
    OnShapeLabel28: TOnShapeLabel;
    OnShapeLabel29: TOnShapeLabel;
    OnShapeLabel30: TOnShapeLabel;
    Label1: TLabel;
    DataSource1: TDataSource;
    OnShapeLabel31: TOnShapeLabel;
    OnShapeLabel18: TOnShapeLabel;
    E_Value055: TOnEdit;
    E_Value048A: TOnEdit;
    E_Value055A: TOnEdit;
    OnShapeLabel32: TOnShapeLabel;
    OnShapeLabel33: TOnShapeLabel;
    E_Value067A: TOnEdit;
    E_Value067Z: TOnEdit;
    E_Value068A: TOnEdit;
    E_Value045: TOnEdit;
    E_Value046: TOnEdit;
    E_Value047: TOnEdit;
    QR_Image: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    L_korname: TOnShapeLabel;
    QR_Mas: TTMaxDataSet;
    QR_Com: TTMaxDataSet;
    E_empno: TOnWinPopupEdit;
    OnGrDbGrid1: TOnGrDbGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_empnoClick(Sender: TObject);
    procedure E_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_empnoInitPopup(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    FL_Start        : Boolean;
    FL_Loading      : Boolean;
    startYN         : Boolean;
    function  PL_Get_Image : Boolean;
    procedure Comp_Clear;
    procedure MasterRead;

  public
    { Public declarations }
    FG_pempno    : String;  // 작업자 사번.
    FG_Grade     : String;
    FG_CurEmpno  : String;
    FG_Group     : String;
    FG_jobdept   : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses PSJ1050A2;

{$R *.DFM}

function TFM_Main.PL_Get_Image : Boolean;
var
  FL_Image   : TStream;
  GifHeader  : TOnGifHeader;
  JpegHeader : TOnJpegHeader;
  FL_Sql     : String;
begin
  Result := False;
  PersonPic.Picture := nil;
  QR_Image.Close;
  with QR_Image do
  begin
       ParamInfo[0].Value := E_empno.Text;
       Open;
       if QR_Image.RecordCount = 0 then
       begin
           Close;
           System.Exit;
       end;

       //인적사항
       with QR_Com do
       begin
            Close;
            ServiceName := 'HINSA_select10';
            ClearFieldInfo;
            AddField('field1'  , ftString, 100);
            AddField('field2'  , ftString, 100);
            AddField('field3'  , ftString, 100);
            AddField('field4'  , ftString, 100);
            AddField('field5'  , ftString, 100);
            AddField('field6'  , ftString, 100);
            AddField('field7'  , ftString, 100);
            AddField('field8'  , ftString, 100);
            AddField('field9'  , ftString, 100);
            AddField('field10' , ftString, 100);

            Sql.Clear;
            SQL.Add(' SELECT empno, korname, juminid, empdate, retdate, retcont,                                    ');
            SQL.Add('       (select codename from pyccode where codeid=''I113'' and codeno=A.payra )     payraname, ');
            SQL.Add('       (select codename from pyccode where codeid=''I114'' and codeno=A.pstate)     statename, ');
            SQL.Add('       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode) deptname,  ');
            SQL.Add('       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.jobdept)  jobdname   ');
            SQL.Add('   FROM pimpmas A                                                                              ');
            SQL.Add('  WHERE empno   = '''+E_empno.Text+'''                                                         ');
            Open;
            L_korname.ValueCaption := Fields[1].AsString;
            L_Paydunm.ValueCaption := Fields[6].AsString;
            L_Pstate.ValueCaption  := Fields[7].AsString;
            L_dept.ValueCaption    := Fields[8].AsString;
            L_jobdept.ValueCaption := Fields[9].AsString;
            L_juminid.ValueCaption := Fields[2].AsString;
            L_retcont.ValueCaption := Fields[5].AsString;;
            L_empdate.ValueCaption := Hinsa_DisplayDate(Fields[3].AsString,'-');
            Close;
       end;
       //사진이 없어도 사원정보를 보여 준다.
       if FieldByName('photo').AsString = '' then
       begin
            QR_Image.Close;
            Result := True;
            System.exit;
       end;

       try
            FL_Image := nil;
            FL_Image := TDataSet(QR_Image).CreateBlobStream(TBlobField(FieldByName('photo')),bmRead);
            FL_Image.Seek(0,soFromBeginning);
            ReadPicCheck(FL_Image, GifHeader, Sizeof(GifHeader));
            if (UpperCase(GifHeader.Signature) = 'GIF') then
                 ReadGifBlob(FL_Image, PersonPic)
            else
            begin
                 FL_Image.Seek(0,soFromBeginning);
                 ReadPicCheck(FL_Image, JpegHeader, Sizeof(JpegHeader));
                 if (JpegHeader.StartImage <> $d8ff) and (JpegHeader.Reserved <> $e0ff) then
                      PersonPic.Picture.Assign(TBlobField(FieldByName('photo')))
                 else
                      ReadJpegBlob(FL_Image, PersonPic);
            end;
       finally
       end;
  end;
  QR_Image.Close;
  Result := True;
end;


procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  startYN  := True;

  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;


  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패2'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  if FL_Start then
  begin
       FL_Start := False;
       SF_Main.Refresh;
       Application.ProcessMessages;

       if Hinsa_Param(CmdLine,1) = '' then  BT_ExitClick(Sender);
       FG_pempno := Hinsa_Param(CmdLine,1);
       FG_Grade  := Hinsa_Param(CmdLine,4);

       with QR_Com do
       begin
            Close;
            ServiceName := 'SHR0SSEL';
            ClearFieldInfo;
            AddField('SEL_DATA',ftString,5000);
            sql.Clear;
            sql.Add(Format('select Groupid from pymenuuser '+
                           ' Where empno =  ''%s''         '
                           ,[FG_pempno]));
            Open;

            FG_Group := FieldByName('SEL_DATA').AsString;
       end;

       if (FG_Group <> 'G053') And (Copy(FG_pempno,1,1) <> 'D') then
       begin
            E_empno.ButtonWidth := 0;
            E_empno.Enabled     := false;
       end;

       E_empno.Text  := FG_pempno;

       BT_SearchClick(Sender);

       SB_Help.Panels[1].Text := '';
  end;
end;

procedure TFM_Main.BT_SearchClick(Sender: TObject);
begin
  if E_empno.Text = '' then
  begin
       MessageDlg('사원번호를 입력하세요...', mtInformation, [mbOK], 0);
       E_empno.SetFocus;
       System.Exit;
  end;

  if FL_Loading then System.Exit;

  SB_Help.Panels[1].Text := '데이타 조회중입니다... 잠시만기다리세요...';

  if (startYN = true) then
  begin
       if not PL_Get_Image then
       begin
            if Copy(FG_pempno,1,1) <> 'D' then MessageDlg('존재하지 않는 사원입니다...1', mtInformation, [mbOK], 0);
            FL_Loading := False;
            System.Exit;
       end;
  end
  else if ((startYN = false) and (E_empno.Hint <> E_empno.Text)) then
  begin
       if not PL_Get_Image then
       begin
            MessageDlg('존재하지 않는 사원입니다...2', mtInformation, [mbOK], 0);
            FL_Loading := False;
            System.Exit;
       end;
  end;

  startYN :=False;

  MasterRead;
end;

procedure TFM_Main.E_empnoClick(Sender: TObject);
begin
  //인적사항  Clear ...............................
  L_Paydunm.ValueCaption := '';
  L_Pstate.ValueCaption  := '';
  L_dept.ValueCaption    := '';
  L_jobdept.ValueCaption := '';
  L_juminid.ValueCaption := '';
  L_empdate.ValueCaption := '';
  L_retcont.ValueCaption := '';

  Comp_Clear;

  QR_Mas.Close;
end;


procedure TFM_Main.Comp_Clear;
begin
  //검진내역  Clear ...............................
  E_Value001.Value := 0;
  E_Value002.Value := 0;
  E_Value003.Text  := '';
  E_Value004.Value := 0;
  E_Value005.Value := 0;
  E_Value006.Value := 0;
  E_Value007.Value := 0;
  E_Value008.Text  := '';
  E_Value009.Text  := '';
  E_Value010.Text  := '';
  E_Value011.Text  := '';
  E_Value012.Text  := '';
  E_Value013.Text  := '';
  E_Value014.Value := 0;
  E_Value015.Value := 0;
  E_Value016.Value := 0;
  E_Value017.Value := 0;
  E_Value018.Value := 0;
  E_Value019.Value := 0;
  E_Value020.Value := 0;
  E_Value021.Value := 0;
  E_Value022.Value := 0;
  E_Value023.Value := 0;
  E_Value024.Value := 0;
  E_Value025.Value := 0;
  E_Value026.Value := 0;
  E_Value027.Value := 0;
  E_Value028.Value := 0;
  E_Value029.Value := 0;
  E_Value030.Value := 0;
  E_Value031.Value := 0;
  E_Value032.Value := 0;
  E_Value033.Value := 0;
  E_Value034.Value := 0;
  E_Value035.Value := 0;
  E_Value036.Text  := '';
  E_Value037.Text  := '';
  E_Value038.Text  := '';
  E_Value039.Text  := '';
  E_Value040.Text  := '';
  E_Value041.Value := 0;
  E_Value042.Value := 0;
  E_Value043.Value := 0;
  E_Value044.Value := 0;
  E_Value045.Text  := '';
  E_Value046.Text  := '';
  E_Value047.Text  := '';
  E_Value048.Value := 0;
  E_Value048A.Text := '';
  E_Value049.Text  := '';
  E_Value050.Text  := '';
  E_Value051.Text  := '';
  E_Value052.Text  := '';
  E_Value053.Text  := '';
  E_Value054.Text  := '';
  E_Value055.Text  := '';
  E_Value055A.Text := '';
  E_Value056.Text  := '';
  E_Value057.Text  := '';
  E_Value058.Text  := '';
  E_Value059.Text  := '';
  E_Value060.Text  := '';
  E_Value061.Text  := '';
  E_Value062.Text  := '';
  E_Value063.Text  := '';
  E_Value064.Text  := '';
  E_Value065.Text  := '';
  E_Value066.Text  := '';
  E_Value067.Text  := '';
  E_Value067A.Text := '';
  E_Value067Z.Text := '';
  E_Value068.Text  := '';
  E_Value068A.Text := '';
  E_Value069.Text  := '';
  E_Value070.Text  := '';
  E_Value071.Text  := '';
  E_Value072.Text  := '';
  E_Value073.Text  := '';
  E_Value074.Text  := '';
  E_Value075.Text  := '';
end;

//마스터 Read...
procedure TFM_Main.MasterRead;
begin

  //건강검진내역
  with QR_Mas do    //Master Read...
  begin
       Close;
       ServiceName := 'PSJ1050A_sel1';
       ClearFieldInfo;
       AddField('MEDIYEAR', ftString,     4);
       AddField('EMPNO'   , ftString,     4);
       AddField('KORNAME' , ftString,    20);
       AddField('MEDIDATE', ftString,    10);
       AddField('HOSPITAL', ftString,    30);
       AddField('V01'     , ftFloat,     10);
       AddField('V02'     , ftFloat,     10);
       AddField('V03'     , ftString,    50);
       AddField('V04'     , ftFloat,     10);
       AddField('V05'     , ftFloat,     10);
       AddField('V06'     , ftFloat,     10);
       AddField('V07'     , ftFloat,     10);
       AddField('V08'     , ftString,   250);
       AddField('V09'     , ftString,   700);
       AddField('V10'     , ftString,   400);
       AddField('V11'     , ftString,   300);
       AddField('V12'     , ftString,   300); //200);
       AddField('V13'     , ftString,   900); //550);
       AddField('V14'     , ftFloat,     10);
       AddField('V15'     , ftFloat,     10);
       AddField('V16'     , ftFloat,     10);
       AddField('V17'     , ftFloat,     10);
       AddField('V18'     , ftFloat,     10);
       AddField('V19'     , ftFloat,     10);
       AddField('V20'     , ftFloat,     10);
       AddField('V21'     , ftFloat,     10);
       AddField('V22'     , ftFloat,     10);
       AddField('V23'     , ftFloat,     10);
       AddField('V24'     , ftFloat,     10);
       AddField('V25'     , ftFloat,     10);
       AddField('V26'     , ftFloat,     10);
       AddField('V27'     , ftFloat,     10);
       AddField('V28'     , ftFloat,     10);
       AddField('V29'     , ftFloat,     10);
       AddField('V30'     , ftFloat,     10);
       AddField('V31'     , ftFloat,     10);
       AddField('V32'     , ftFloat,     12);
       AddField('V33'     , ftFloat,     10);
       AddField('V34'     , ftFloat,     10);
       AddField('V35'     , ftFloat,     10);
       AddField('V36'     , ftString,    20);
       AddField('V37'     , ftString,    20);
       AddField('V38'     , ftString,    30);
       AddField('V39'     , ftString,    30);
       AddField('V40'     , ftString,    30);
       AddField('V41'     , ftFloat,     10);
       AddField('V42'     , ftFloat,     10);
       AddField('V43'     , ftFloat,     10);
       AddField('V44'     , ftFloat,     10);
       AddField('V45'     , ftString,    10);
       AddField('V46'     , ftString,    10);
       AddField('V47'     , ftString,    10);
       AddField('V48'     , ftFloat,     10);
       AddField('V48A'    , ftString,    10);
       AddField('V49'     , ftString,    10);
       AddField('V50'     , ftString,    10);
       AddField('V51'     , ftString,    10);
       AddField('V52'     , ftString,    10);
       AddField('V53'     , ftString,    10);
       AddField('V54'     , ftString,    10);
       AddField('V55'     , ftString,    20);
       AddField('V55A'    , ftString,    50);
       AddField('V56'     , ftString,   700); //400);
       AddField('V57'     , ftString,   400);
       AddField('V58'     , ftString,   560);
       AddField('V59'     , ftString,  1000); //650);
       AddField('V60'     , ftString,   800);
       AddField('V61'     , ftString,   350);
       AddField('V62'     , ftString,   200);
       AddField('V63'     , ftString,  1400); //650);
       AddField('V64'     , ftString,    30); //10);
       AddField('V65'     , ftString,   750);
       AddField('V66'     , ftString,   800); //700);
       AddField('V67'     , ftString,   200);
       AddField('V67A'    , ftString,    20);
       AddField('V67Z'    , ftString,    20);
       AddField('V68'     , ftString,   400); //300);
       AddField('V68A'    , ftString,    65);
       AddField('V69'     , ftString,   500); //350);
       AddField('V70'     , ftString,   700); //450);
       AddField('V71'     , ftString,   400);
       AddField('V72'     , ftString,   400);
       AddField('V73'     , ftString,   990);
       AddField('V74'     , ftString,   500);
       AddField('V75'     , ftString,  4000);

       Sql.Clear;
       Sql.Add ('Select mediyear, empno, korname, medidate, hospital,                                                                    ');
       Sql.Add ('       nvl(value001,0) v01,   nvl(value002,0) v02,       value003    v03,   nvl(value004,0) v04,   nvl(value005,0) v05, ');
       Sql.Add ('       nvl(value006,0) v06,   nvl(value007,0) v07,       value008    v08,       value009    v09,       value010    v10, ');
       Sql.Add ('           value011    v11,       value012    v12,       value013    v13,   nvl(value014,0) v14,   nvl(value015,0) v15, ');
       Sql.Add ('       nvl(value016,0) v16,   nvl(value017,0) v17,   nvl(value018,0) v18,   nvl(value019,0) v19,   nvl(value020,0) v20, ');
       Sql.Add ('       nvl(value021,0) v21,   nvl(value022,0) v22,   nvl(value023,0) v23,   nvl(value024,0) v24,   nvl(value025,0) v25, ');
       Sql.Add ('       nvl(value026,0) v26,   nvl(value027,0) v27,   nvl(value028,0) v28,   nvl(value029,0) v29,   nvl(value030,0) v30, ');
       Sql.Add ('       nvl(value031,0) v31,   nvl(value032,0) v32,   nvl(value033,0) v33,   nvl(value034,0) v34,   nvl(value035,0) v35, ');
       Sql.Add ('           value036    v36,       value037    v37,       value038    v38,       value039    v39,       value040    v40, ');
       Sql.Add ('       nvl(value041,0) v41,   nvl(value042,0) v42,   nvl(value043,0) v43,   nvl(value044,0) v44,       value045    v45, ');
       Sql.Add ('           value046    v46,       value047    v47,   nvl(value048,0) v48,       value048A   v48A,  nvl(value049,0) v49, ');
       Sql.Add ('       nvl(value050,0) v50,       value051    v51,       value052    v52,       value053    v53,       value054    v54, ');
       Sql.Add ('           value055    v55,       value055A   v55A,      value056    v56,       value057    v57,       value058    v58, ');
       Sql.Add ('           value059    v59,       value060    v60,       value061    v61,       value062    v62,       value063    v63, ');
       Sql.Add ('           value064    v64,       value065    v65,       value066    v66,       value067    v67,       value067A   v67A,');
       Sql.Add ('           value067Z   v67Z,      value068    v68,       value068A   v68A,      value069    v69,       value070    v70, ');
       Sql.Add ('           value071    v71,       value072    v72,       value073    v73,       value074    v74,       value075    v75  ');
       Sql.Add ('  From Psmedhis                         ');
       Sql.Add (' Where Empno    = '''+E_empno.Text+'''  ');
       Sql.Add (' order By Mediyear Desc                 ');
       Open;

       if QR_Mas.RecordCount <= 0 then
       begin
            MessageDlg('건강검진내역이 존재하지 않습니다.', mtInformation, [mbOK], 0);
            BT_ExitClick(BT_Exit);
            Exit;
       end;
  end;

end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //건강검진내역
  with QR_mas do
  begin
       E_Value001.Value := FieldByName('V01').AsFloat;
       E_Value002.Value := FieldByName('V02').AsFloat;
       E_Value003.Text  := FieldByName('V03').AsString;
       E_Value004.Value := FieldByName('V04').AsFloat;
       E_Value005.Value := FieldByName('V05').AsFloat;
       E_Value006.Value := FieldByName('V06').AsFloat;
       E_Value007.Value := FieldByName('V07').AsFloat;
       E_Value008.Text  := FieldByName('V08').AsString;
       E_Value009.Text  := FieldByName('V09').AsString;
       E_Value010.Text  := FieldByName('V10').AsString;
       E_Value011.Text  := FieldByName('V11').AsString;
       E_Value012.Text  := FieldByName('V12').AsString;
       E_Value013.Text  := FieldByName('V13').AsString;
       E_Value014.Value := FieldByName('V14').AsFloat;
       E_Value015.Value := FieldByName('V15').AsFloat;
       E_Value016.Value := FieldByName('V16').AsFloat;
       E_Value017.Value := FieldByName('V17').AsFloat;
       E_Value018.Value := FieldByName('V18').AsFloat;
       E_Value019.Value := FieldByName('V19').AsFloat;
       E_Value020.Value := FieldByName('V20').AsFloat;
       E_Value021.Value := FieldByName('V21').AsFloat;
       E_Value022.Value := FieldByName('V22').AsFloat;
       E_Value023.Value := FieldByName('V23').AsFloat;
       E_Value024.Value := FieldByName('V24').AsFloat;
       E_Value025.Value := FieldByName('V25').AsFloat;
       E_Value026.Value := FieldByName('V26').AsFloat;
       E_Value027.Value := FieldByName('V27').AsFloat;
       E_Value028.Value := FieldByName('V28').AsFloat;
       E_Value029.Value := FieldByName('V29').AsFloat;
       E_Value030.Value := FieldByName('V30').AsFloat;
       E_Value031.Value := FieldByName('V31').AsFloat;
       E_Value032.Value := FieldByName('V32').AsFloat;
       E_Value033.Value := FieldByName('V33').AsFloat;
       E_Value034.Value := FieldByName('V34').AsFloat;
       E_Value035.Value := FieldByName('V35').AsFloat;
       E_Value036.Text  := FieldByName('V36').AsString;
       E_Value037.Text  := FieldByName('V37').AsString;
       E_Value038.Text  := FieldByName('V38').AsString;
       E_Value039.Text  := FieldByName('V39').AsString;
       E_Value040.Text  := FieldByName('V40').AsString;
       E_Value041.Value := FieldByName('V41').AsFloat;
       E_Value042.Value := FieldByName('V42').AsFloat;
       E_Value043.Value := FieldByName('V43').AsFloat;
       E_Value044.Value := FieldByName('V44').AsFloat;
       E_Value045.Text  := FieldByName('V45').AsString;
       E_Value046.Text  := FieldByName('V46').AsString;
       E_Value047.Text  := FieldByName('V47').AsString;
       E_Value048.Value := FieldByName('V48').AsFloat;
       E_Value048A.Text := FieldByName('V48A').AsString;
       E_Value049.Text  := FieldByName('V49').AsString;
       E_Value050.Text  := FieldByName('V50').AsString;
       E_Value051.Text  := FieldByName('V51').AsString;
       E_Value052.Text  := FieldByName('V52').AsString;
       E_Value053.Text  := FieldByName('V53').AsString;
       E_Value054.Text  := FieldByName('V54').AsString;
       E_Value055.Text  := FieldByName('V55').AsString;
       E_Value055A.Text := FieldByName('V55A').AsString;
       E_Value056.Text  := FieldByName('V56').AsString;
       E_Value057.Text  := FieldByName('V57').AsString;
       E_Value058.Text  := FieldByName('V58').AsString;
       E_Value059.Text  := FieldByName('V59').AsString;
       E_Value060.Text  := FieldByName('V60').AsString;
       E_Value061.Text  := FieldByName('V61').AsString;
       E_Value062.Text  := FieldByName('V62').AsString;
       E_Value063.Text  := FieldByName('V63').AsString;
       E_Value064.Text  := FieldByName('V64').AsString;
       E_Value065.Text  := FieldByName('V65').AsString;
       E_Value066.Text  := FieldByName('V66').AsString;
       E_Value067.Text  := FieldByName('V67').AsString;
       E_Value067A.Text := FieldByName('V67A').AsString;
       E_Value067Z.Text := FieldByName('V67Z').AsString;
       E_Value068.Text  := FieldByName('V68').AsString;
       E_Value068A.Text := FieldByName('V68A').AsString;
       E_Value069.Text  := FieldByName('V69').AsString;
       E_Value070.Text  := FieldByName('V70').AsString;
       E_Value071.Text  := FieldByName('V71').AsString;
       E_Value072.Text  := FieldByName('V72').AsString;
       E_Value073.Text  := FieldByName('V73').AsString;
       E_Value074.Text  := FieldByName('V74').AsString;
       E_Value075.Text  := FieldByName('V75').AsString;
  end;

  SB_Help.Panels[1].Text := ' 조회 완료.';
end;

procedure TFM_Main.E_empnoCloseUp(Sender: TObject; var Text: String;
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
      E_empnoKeyPress(Sender, tmp_key);
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.E_empnoInitPopup(Sender: TObject);
begin
  FM_empno.Insa_Session := TMaxSession;
  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.BE_Key.text  := '';
  FM_empno.Part_search;
end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Key := #0;
       BT_SearchClick(sender);
  end;
end;

end.
