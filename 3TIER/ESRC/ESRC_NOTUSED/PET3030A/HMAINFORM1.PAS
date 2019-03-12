{=============================== Program Header ================================
 PROGRAM-NAME   : 자기/상사 평가 - PET3030A
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 팀장 자기평가
 Programmer     :
 Version        : ver 1.0
 Date           : :2013.09.16
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.09.16    이희용       신규개발                HR팀 요청
================================================================================}
unit HMainForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnInsaCommon,kpaylib,
  Tmax_DataSetText, OnPopupEdit, OnRadioBtn, OnEditMemo,
  Db,  OnDBGrid, Tmax_DmlSet, NotesHana_TLB, func,  TmaxFunc;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    TMaxSession: TTMaxSession;
    L_Deptname: TOnShapeLabel;
    ED_empno: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    L_e1emp: TOnShapeLabel;
    L_e2emp: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TDS: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TDS_Works: TTMaxDataSet;
    L_Payclname: TOnShapeLabel;
    TMaxDML_HInsa: TTMaxDataSet;
    BT_Save1: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    L_Total2: TLabel;
    L_Yes2: TLabel;
    CB_ShowClass2: TCheckBox;
    SG_Image2: TStringGrid;
    Panel4: TPanel;
    SG_Score2: TStringGrid;
    P_ControlButton2: TPanel;
    SB_S2: TSpeedButton;
    SB_A2: TSpeedButton;
    SB_B2: TSpeedButton;
    SB_C2: TSpeedButton;
    SB_D2: TSpeedButton;
    SG_HiddenData2: TStringGrid;
    SG_Image1: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    L_Total1: TLabel;
    L_Yes1: TLabel;
    Panel7: TPanel;
    SG_Score1: TStringGrid;
    P_ControlButton1: TPanel;
    SB_S1: TSpeedButton;
    SB_A1: TSpeedButton;
    SB_B1: TSpeedButton;
    SB_C1: TSpeedButton;
    SB_D1: TSpeedButton;
    CB_ShowClass1: TCheckBox;
    SG_HiddenData1: TStringGrid;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    OnShapeLabel66: TOnShapeLabel;
    Label19: TLabel;
    OnShapeLabel67: TOnShapeLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    E_MoveCause: TEdit;
    Panel15: TPanel;
    Label11: TLabel;
    Label21: TLabel;
    E_MoveDept: TOnWinPopupEdit;
    Panel16: TPanel;
    Label15: TLabel;
    Label22: TLabel;
    Label18: TLabel;
    E_Propose: TOnMemo;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    ED_Korname: TOnShapeLabel;
    Panel9: TPanel;
    Panel21: TPanel;
    Label6: TLabel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    pnl_1: TPanel;
    SW_S1: TOnSkinButton;
    SW_A1: TOnSkinButton;
    SW_B1: TOnSkinButton;
    SW_C1: TOnSkinButton;
    SW_D1: TOnSkinButton;
    L_DetailTask1: TOnShapeLabel;
    L_detailweight1: TOnShapeLabel;
    L_validx1: TOnShapeLabel;
    L_bresultclass1: TOnShapeLabel;
    SelfScore1: TOnShapeLabel;
    SelfClass1: TOnShapeLabel;
    L_valfunction1: TOnShapeLabel;
    pnl_no1: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    E_Aim1: TOnMemo;
    pnl_2: TPanel;
    SW_S2: TOnSkinButton;
    SW_A2: TOnSkinButton;
    SW_B2: TOnSkinButton;
    SW_C2: TOnSkinButton;
    SW_D2: TOnSkinButton;
    L_bresultclass2: TOnShapeLabel;
    L_validx2: TOnShapeLabel;
    L_detailweight2: TOnShapeLabel;
    L_DetailTask2: TOnShapeLabel;
    SelfScore2: TOnShapeLabel;
    Shape4: TShape;
    SelfClass2: TOnShapeLabel;
    L_valfunction2: TOnShapeLabel;
    pnl_no2: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    E_Aim2: TOnMemo;
    pnl_3: TPanel;
    SW_S3: TOnSkinButton;
    SW_A3: TOnSkinButton;
    SW_B3: TOnSkinButton;
    SW_C3: TOnSkinButton;
    SW_D3: TOnSkinButton;
    L_bresultclass3: TOnShapeLabel;
    L_validx3: TOnShapeLabel;
    L_detailweight3: TOnShapeLabel;
    L_DetailTask3: TOnShapeLabel;
    SelfScore3: TOnShapeLabel;
    Shape3: TShape;
    SelfClass3: TOnShapeLabel;
    L_valfunction3: TOnShapeLabel;
    pnl_no3: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    E_Aim3: TOnMemo;
    pnl_4: TPanel;
    SW_S4: TOnSkinButton;
    SW_A4: TOnSkinButton;
    SW_B4: TOnSkinButton;
    SW_C4: TOnSkinButton;
    SW_D4: TOnSkinButton;
    L_bresultclass4: TOnShapeLabel;
    L_validx4: TOnShapeLabel;
    L_detailweight4: TOnShapeLabel;
    L_DetailTask4: TOnShapeLabel;
    SelfScore4: TOnShapeLabel;
    Shape2: TShape;
    SelfClass4: TOnShapeLabel;
    L_valfunction4: TOnShapeLabel;
    pnl_no4: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    E_Aim4: TOnMemo;
    pnl_5: TPanel;
    SW_S5: TOnSkinButton;
    SW_A5: TOnSkinButton;
    SW_B5: TOnSkinButton;
    SW_C5: TOnSkinButton;
    SW_D5: TOnSkinButton;
    Shape13: TShape;
    L_bresultclass5: TOnShapeLabel;
    L_validx5: TOnShapeLabel;
    L_detailweight5: TOnShapeLabel;
    L_DetailTask5: TOnShapeLabel;
    SelfScore5: TOnShapeLabel;
    SelfClass5: TOnShapeLabel;
    L_valfunction5: TOnShapeLabel;
    pnl_no5: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    E_Aim5: TOnMemo;
    DBG_user: TOnGrDbGrid;
    Panel53: TPanel;
    Label16: TLabel;
    DBcommon: TTMaxDataSet;
    DataSource1: TDataSource;
    BT_Cancel1: TOnFocusButton;
    Label7: TLabel;
    Edit1: TEdit;
    Shape6: TShape;
    M_image15: TOnMemo;
    M_image14: TOnMemo;
    M_image13: TOnMemo;
    M_image12: TOnMemo;
    M_image11: TOnMemo;
    Shape7: TShape;
    M_image21: TOnMemo;
    M_image22: TOnMemo;
    M_image23: TOnMemo;
    M_image24: TOnMemo;
    M_image25: TOnMemo;
    Shape11: TShape;
    Shape12: TShape;
    Shape14: TShape;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Label2: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    L_rscore: TOnNumberEdit;
    Panel54: TPanel;
    Label28: TLabel;
    RB_MoveEra3: TOnRadioButton;
    RB_MoveEra2: TOnRadioButton;
    RB_MoveEra1: TOnRadioButton;
    RB_MoveCause5: TOnRadioButton;
    RB_MoveCause4: TOnRadioButton;
    RB_MoveCause3: TOnRadioButton;
    RB_MoveCause2: TOnRadioButton;
    RB_MoveCause1: TOnRadioButton;
    pnl_6: TPanel;
    SW_S6: TOnSkinButton;
    SW_A6: TOnSkinButton;
    SW_B6: TOnSkinButton;
    SW_C6: TOnSkinButton;
    SW_D6: TOnSkinButton;
    E_TaskAdd1: TOnShapeLabel;
    Label31: TLabel;
    SelfScore6: TOnShapeLabel;
    E_TaskAdd2: TOnEdit;
    SelfClass6: TOnShapeLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label4: TLabel;
    Label23: TLabel;
    SG_Image01: TStringGrid;
    CB_ShowClass01: TCheckBox;
    SG_HiddenData01: TStringGrid;
    Label32: TLabel;
    Panel55: TPanel;
    Label5: TLabel;
    L_Total01: TLabel;
    L_Yes01: TLabel;
    Shape20: TShape;
    M_image011: TOnMemo;
    M_image012: TOnMemo;
    M_image013: TOnMemo;
    M_image014: TOnMemo;
    M_image015: TOnMemo;
    Panel8: TPanel;
    SG_Score01: TStringGrid;
    P_ControlButton01: TPanel;
    SB_S01: TSpeedButton;
    SB_A01: TSpeedButton;
    SB_B01: TSpeedButton;
    SB_C01: TSpeedButton;
    SB_D01: TSpeedButton;
    SG_ItemImage01: TStringGrid;
    Shape1: TShape;
    Label20: TLabel;
    OM_Merit_V2: TOnMemo;
    OM_Merit_V1: TOnMemo;
    M_Opnion1: TOnMemo;
    OnMemo5: TOnMemo;
    OM_Merit_C2: TOnMemo;
    OnMemo2: TOnMemo;
    OnMemo6: TOnMemo;
    OM_Merit_C1: TOnMemo;
    OM_Merit_R2: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo8: TOnMemo;
    OM_Merit_R1: TOnMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1Enter(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BT_Save1Click(Sender: TObject);
    procedure SB_S1Click(Sender: TObject);
    procedure Bt_Add1Click(Sender: TObject);
    procedure Bt_OConfirm1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SB_S2Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure SG_Score2Enter(Sender: TObject);
    procedure SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CB_ShowClass2Click(Sender: TObject);
    procedure CB_ShowClass1Click(Sender: TObject);
    procedure SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01Enter(Sender: TObject);
    procedure SB_S01Click(Sender: TObject);
    procedure E_MoveDeptInitPopup(Sender: TObject);
    procedure E_MoveDeptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure RB_MoveEra1Click(Sender: TObject);
    procedure E_ProposeClick(Sender: TObject);
    procedure CB_ShowClass01Click(Sender: TObject);
    procedure BT_Cancel1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SG_Image1Click(Sender: TObject);
    procedure SG_Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SW_S1Click(Sender: TObject);
    procedure RB_MoveEra3Click(Sender: TObject);
    procedure RB_MoveCause5Click(Sender: TObject);
    procedure E_MeritKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_DemeritKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ProposeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_Image01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_Image01Click(Sender: TObject);
    procedure SG_ItemImage01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);


  private
    { Private declarations }
    FL_Start   : Boolean;
    Start      : Boolean;
    procedure Values_data1;
    procedure ShowImage01;
    procedure ShowSum01;
    procedure Common_data;
    procedure ShowImage1;
    procedure ShowSum1;
    procedure Leadership_data;
    procedure ShowImage2;
    procedure ShowSum2;
    procedure Works_data;
    procedure opinion_data;
    function Csel_gfd(p_loc: Integer): String;
    function Csel_gfd2(p_loc: Integer): String;
    function IsDataModified01: Boolean;
    function IsDataModified1: Boolean;
    function IsDataModified2: Boolean;
    procedure Cupd_Exec;
    procedure Csel_Open;
    procedure Rscore;
    procedure ResetAllButton;
    function  IsDataModified3: Boolean;
  public
    { Public declarations }
    GSempno   : String;     //Login사번
    GSkorname : String;    //Login성명
    GSgrade   : String;    //등급
    Lrabasdate: string;
    Ppaycl    : string;
    Pempno    : string;
    Pkorname  : string;
    Cupd_SQL  : string;
    Cupd_ret  : Boolean;
    Csel_SQL  : String;
    Csel_ret  : Boolean;

    LSeqno    : real;
    L_S_Seqno : string;
    v_restiyn,
    Le1empno,
    Le1korname,
    Le2empno,
    Le2korname,
    Lrvalconyn,
    Le1valconyn,
    Le1valcondate,
    Lpayclname,
    Ldeptname,
    Lpayraname,
    Lsyn,
    Levcno,
    Ljobkind,
    v_e1valobjyn,
    Lrvalobjyn,
    v_pgroupratio : string;
    Gdutykindname : String;
    Gjobgunname   : String;

    vOrgnum,  vOldEmpDept: String;
    var_Ekind     : String;

    g_rscore,    g_escore    : string;
    g_prorscore, g_proescore : string;
    g_prorclass, g_proeclass : string;

    sAim1       : string;
    sAim2       : String;
    sAim3       : String;
    sAim4       : string;
    sAim5       : String;

    vMoveCause : String;
    vMoveera, vWorkload, vjobhard,  vjobsatisfy : integer;

    Workemp1, Workemp2,  Workemp3, Workemp4, Workemp5 : string;

    SaveTask : TBookMark ;
    function  FL_CheckNullEval:Boolean;     //평가하지 않은 항목이 있는지 여부 체크
    procedure InUpMerit(Parameter: String);
    procedure SelectMerit;
    function  FL_CheckNullMERIT:Boolean;    //장단점 미입력 항목이 있는지 여부 체크
  end;

const
  // SG_HiddenData 의 index
  dITEMNO_IDX   = 0; // 평가항목번호
  dITEMNAME_IDX = 1; // 평가항목명
  dIMAGENO_IDX  = 2; // 평가이미지번호
  dITEMDESC_IDX = 3; // 평가이미지내용
  dSCORE_IDX    = 4; // 평가점수
  dMODIFIED_IDX = 5; // 자료변동여부
  dISNEW_IDX    = 6; // 테이블에 없는 레코드 여부(Y,N)

  // SG_Image 의 index
  mITEMNAME_IDX  = 0;
  mITEMDESC_IDX  = 1; // 평가이미지내용

  WIDTH_SGIMAGE_COL1 = 160;

  // SG_Item 의 index
  iITEMNAME_IDX = 0; // 항목명
  iITEMDESC_IDX = 1; // 항목내용
  iITEMNO_IDX   = 2; // 항목번호

  dS_IDX  = 0;
  dA_IDX  = 1;
  dB_IDX  = 2;
  dC_IDX  = 3;
  dD_IDX  = 4;

  Sscore  = '100';
  Ascore  = '90';
  Bscore  = '80';
  Cscore  = '70';
  Dscore  = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;
  Inter    : ILotusNotes_Hana;
  var_ScrS, var_ScrA, var_ScrB, var_ScrC, var_ScrD : String;

implementation

uses PET3030A_dept;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  if MessageBox(handle,PChar('평가작업을 종료하시겠습니까?'), '확 인',
                MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
       Close;
  end;
end;

procedure TFM_Main.ResetAllButton;
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1  do
  begin
       if (Components[i] is TOnSkinButton) then
       begin
            if (Components[i].Name <> 'SW_S6') and (Components[i].Name <> 'SW_A6') and (Components[i].Name <> 'SW_B6') and
               (Components[i].Name <> 'SW_C6') and (Components[i].Name <> 'SW_D6') then
            begin
                 (Components[i] As TOnSkinButton).BtnDown    := False;
                 (Components[i] As TOnSkinButton).Font.Color := clBlack;
            end;
       end;
  end;
end;

procedure TFM_Main.SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_Image1.Canvas.Brush.Color := $00FFE8D0;
       SG_Image1.Canvas.Font.Color  := clBlack;
  end;

  SG_Image1.Canvas.FillRect(Rect);

  SG_Image1.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL1;

  if SG_Image1.VisibleRowCount < SG_Image1.RowCount then
       SG_Image1.ColWidths[mITEMDESC_IDX] := SG_Image1.Width -  SG_Image1.ColWidths[mITEMNAME_IDX] - 16
  else
       SG_Image1.ColWidths[mITEMDESC_IDX] := SG_Image1.Width -  SG_Image1.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image1.RowCount > (SG_Image1.VisibleRowCount+SG_Image1.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image1.Cells[ACol, ARow];
  DrawText(SG_Image1.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  //if SG_HiddenData1.Tag = -1 then
  //  System.Exit;
  //if not SG_Image1.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
  //  System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image1.Row < SG_Image1.TopRow then // 현재 row 가 화면위에 있다
       SG_Image1.Row := SG_Image1.TopRow
  else if SG_Image1.Row > (SG_Image1.TopRow + SG_Image1.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_Image1.Row := SG_Image1.TopRow + SG_Image1.VisibleRowCount-1;

  SG_Score1.TopRow := SG_Image1.TopRow;
  SG_Score1.Row    := SG_Image1.Row;

{  // 버튼의 top 위치를 계산
  P_ControlButton1.Top := (SG_Image1.Row - SG_Image1.TopRow) *
                         (SG_Image1.DefaultRowHeight + SG_Image1.GridLineWidth) + 2;
}
  // 점수를 버튼에 반영
  SB_S1.Down   := False;
  SB_A1.Down   := False;
  SB_B1.Down   := False;
  SB_C1.Down   := False;
  SB_D1.Down   := False;


  //버튼상태반영
       if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrS  then  SB_S1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrA  then  SB_A1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrB  then  SB_B1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrC  then  SB_C1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrD  then  SB_D1.Down  := True;

  P_ControlButton1.Visible := True;

  SG_Image1Click(Sender);
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  SqlText: String;
  i : integer;
begin
  //하은영
  //MessageDlg('현재는 평가 시스템 테스트 기간입니다. 공지사항에 안내된 평가시기에 평가하시기 바랍니다.'#13#13+
  //          '지금 입력하시는 자료는 자동 삭제됩니다.',mtInformation,[mbOK],0);

  GSempno       := Hinsa_Param(cmdLine,1);
  GSkorname     := Hinsa_Param(cmdLine,2);
  GSgrade       := Hinsa_Param(cmdLine,4);

  v_restiyn     := '';
  Le1empno      := '';
  Le1korname    := '';
  Le2empno      := '';
  Le2korname    := '';
  Lrvalconyn    := '';
  Le1valconyn   := '';
  Le1valcondate := '';
  Lpayclname    := '';
  Ldeptname     := '';
  Lpayraname    := '';
  Lsyn          := '';
  Levcno        := '';
  Ljobkind      := '';
  v_e1valobjyn  := '';
  Lrvalobjyn    := '';
  v_pgroupratio := '';

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
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  //평가기준일 불러오기
  SqlText := 'SELECT  Value1, Value2, Value3, Value4, Value5  ' +
             '  FROM pehrebas                                 ' +
             ' WHERE rabasdate = ''00000000''                 ' +
             '   AND gubun     = ''00''                       ' +
             '   AND sgubun    = ''0001''                     ';

  with TDS do                   //TMaxDataSet_HInsa
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('VALUE1'       , ftString    ,  100  );
       AddField('VALUE2'       , ftString    ,  100  );
       AddField('VALUE3'       , ftString    ,  100  );
       AddField('VALUE4'       , ftString    ,  100  );
       AddField('VALUE5'       , ftString    ,  100  );
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  Lrabasdate := TDS.FieldByName('Value1').AsString;     //TMaxDataSet_HInsa
  vOrgnum    := TDS.FieldByName('Value3').AsString;

//  Lrabasdate := '20121130';

  //평가담당자 불러오기
  SqlText := 'SELECT  Value1, Value2, Value3, Value4, Value5  ' +
             '  FROM pehrebas                                 ' +
             ' WHERE rabasdate = '''+Lrabasdate+'''           ' +
             '   AND gubun     = ''11''                       ' +
             '   AND sgubun    = ''0005''                     ';

  with TDS do                   //TMaxDataSet_HInsa
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('VALUE1'       , ftString    ,  100  );
       AddField('VALUE2'       , ftString    ,  100  );
       AddField('VALUE3'       , ftString    ,  100  );
       AddField('VALUE4'       , ftString    ,  100  );
       AddField('VALUE5'       , ftString    ,  100  );
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;
  Workemp1 := TDS.FieldByName('Value1').AsString;
  Workemp2 := TDS.FieldByName('Value2').AsString;
  Workemp3 := TDS.FieldByName('Value3').AsString;
  Workemp4 := TDS.FieldByName('Value4').AsString;
  Workemp5 := TDS.FieldByName('Value5').AsString;

  edit2.Text := Gsempno;
  if (Gsempno=Workemp1) or (Gsempno=Workemp2) or (Gsempno=Workemp3) or
     (Gsempno=Workemp4) or (Gsempno=Workemp5) or (copy(Gsempno,1,1)='D') then
  begin
       edit2.Visible   := true;
       button1.Visible := true;
       edit2.Text      := '2545';
  end
  else
  begin
       edit2.Visible   := false;
       button1.Visible := false;
  end;
  Button1Click(Sender);
  SelectMerit;
end;

procedure TFM_Main.opinion_data;
var
  i : integer;
begin
  // 기 저장된 내역 Read ///////////////////////////////////////////////////////
  with TMaxDataSet_HInsa do
  begin
       ServiceName := 'PEZ2010A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,                                                     '+#13+
                   '       0,  0,   0,  0,   0,  0,  0,   0,   0,                     '+#13+
                   '       nvl(MERIT,''''),   nvl(DEMERIT,''''),    nvl(WORKLOAD,0) , '+#13+
                   '       nvl(JOBHARD,0),    nvl(JOBSATISFY,0),    nvl(MOVEERA,0) ,  '+#13+
                   '	   nvl(MOVECAUSE,''''), nvl(MOVEDEPT,''''), nvl(PROPOSE,'''') '+#13+
                   '  from petremas                                                   '+#13+
                   ' where rabasdate = '''+ Lrabasdate +'''                           '+#13+
                   '   and empno     = '''+ Pempno  +'''                              ';
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
       AddField('MERIT'      , ftString , 1000);
       AddField('DEMERIT'    , ftString , 1000);
       AddField('WORKLOAD'   , ftInteger, 1);
       AddField('JOBHARD'    , ftInteger, 1);
       AddField('JOBSATISFY' , ftInteger, 1);
       AddField('MOVEERA'    , ftInteger, 1);
       AddField('MOVECAUSE'  , ftString , 100);
       AddField('MOVEDEPT'   , ftString , 8);
       AddField('PROPOSE'    , ftString , 1000);
       Open;         // ShowMessage(inttostr(TMaxDataSet.RecordCount));

       for i := 1 to 5 do
       begin
            if FieldByName('WORKLOAD').AsInteger    = i then TOnRadioButton(Self.FindComponent('RB_WORKLOAD'+IntToStr(i))).Checked := True;
            if FieldByName('JOBHARD').AsInteger     = i then TOnRadioButton(Self.FindComponent('RB_JOBHARD'+IntToStr(i))).Checked := True;
            if FieldByName('JOBSATISFY').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_JOBSATISFY'+IntToStr(i))).Checked := True;
       end;

       if      FieldByName('MOVEERA').AsInteger = 3 then RB_MOVEERA3.Checked := True
       else if FieldByName('MOVEERA').AsInteger = 2 then RB_MOVEERA2.Checked := True
       else
       begin
            RB_MOVEERA1.Checked := True;
            RB_MOVEERA1Click(nil);
       end;


       if      FieldByName('MOVECAUSE').AsString = '다양한 직무를 경험하고 싶다.'                           then RB_MOVECAUSE5.Checked := True
       else if FieldByName('MOVECAUSE').AsString = '다른 직무에서 보다 능력을 발휘할 수 있으리라 생각한다.' then RB_MOVECAUSE4.Checked := True
       else if FieldByName('MOVECAUSE').AsString = '부서의 인간관계 / 분위기의 변화를 찾고 싶다.'           then RB_MOVECAUSE3.Checked := True
       else if FieldByName('MOVECAUSE').AsString = '가족관계 / 연고지를 고려하여 근무지를 옮기고 싶다.'     then RB_MOVECAUSE2.Checked := True
       else if FieldByName('MOVECAUSE').AsString <> ''                                                      then
       begin
            RB_MOVECAUSE1.Checked := True;
            E_MOVECAUSE.Text := FieldByName('MOVECAUSE').AsString;
       end;

       vOldEmpDept := Trim(FieldByName('MOVEDEPT').AsString);
       if   vOldEmpDept <> '' then
       begin
            E_MoveDept.Hint :=  Trim(FieldByName('MOVEDEPT').AsString);

            FM_Tmax           := TFM_Tmax.Create(Self);
            FM_Tmax.T_Session := TMaxSession;
            E_MOVEDEPT.Text   := FM_Tmax.GetData('deptname', vOrgnum, vOldEmpDept);
       end;
       E_PROPOSE.Text := FieldByName('PROPOSE').AsString;
       Close;
  end;

  E_PROPOSE.Font.Color := clBlack;
  if Trim(E_PROPOSE.Text) = '' then E_PROPOSE.Text := '한글 기준 500자까지 등록 가능합니다. (Max 1000Byte)';
  if Pos('(Max 1000Byte)',E_PROPOSE.Text) > 0 then E_PROPOSE.Font.Color := clGray;

//  PageControl1.ActivePage := TabSheet1;
//  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.Works_data;
var
  SqlText : string;
begin
  with TDS_Works do
  begin
       SqlText := Format('SELECT B.RABASDATE,B.EMPNO,B.EMPDATE,B.PAYCLDATE,B.TRDATE,                   '+
                         '       B.JOBGUN,B.PAYCL,B.PAYRA,B.ORGNUM,                                    '+
                         '       B.DEPTCODE,H.DEPTNAME ||'' ''||H.DEPTNA3 DEPTNAME,                    '+
                         '       C.DUTYKINDNAME,                                                       '+
                         '       A.OBJYN,E.CODENAME JOBGUNNAME,                                        '+
                         '       F.CODENAME PAYCLNAME, G.CODENAME PAYRANAME,                           '+
                         '       SEQNO,PROPELTASK,MAINWEIGHT,                                          '+
                         '       DETAILTASK1,DETAILTASK2,DETAILTASK3,DETAILTASK4,DETAILTASK5,          '+
                         '       DETAILWEIGHT1,DETAILWEIGHT2,DETAILWEIGHT3,DETAILWEIGHT4,DETAILWEIGHT5,'+
                         '       VALIDX1,VALIDX2,VALIDX3,VALIDX4,VALIDX5,                              '+
                         '       VALFUNCTION1,VALFUNCTION2,VALFUNCTION3,VALFUNCTION4,VALFUNCTION5,     '+
                         '       SRESULTCLASS1,ARESULTCLASS1,BRESULTCLASS1,CRESULTCLASS1,DRESULTCLASS1,'+
                         '       SRESULTCLASS2,ARESULTCLASS2,BRESULTCLASS2,CRESULTCLASS2,DRESULTCLASS2,'+
                         '       SRESULTCLASS3,ARESULTCLASS3,BRESULTCLASS3,CRESULTCLASS3,DRESULTCLASS3,'+
                         '       SRESULTCLASS4,ARESULTCLASS4,BRESULTCLASS4,CRESULTCLASS4,DRESULTCLASS4,'+
                         '       SRESULTCLASS5,ARESULTCLASS5,BRESULTCLASS5,CRESULTCLASS5,DRESULTCLASS5,'+
                         '       E1PRJOPINON,RESULT1,RESULT2,RESULT3,RESULT4,RESULT5,NVL(A.RSCORE,0),  '+
                         '       NVL(DETAILRSCORE1,0),DETAILRCLASS1,NVL(DETAILRSCORE2,0),DETAILRCLASS2,'+
                         '       NVL(DETAILRSCORE3,0),DETAILRCLASS3,NVL(DETAILRSCORE4,0),DETAILRCLASS4,'+
                         '       NVL(DETAILRSCORE5,0),DETAILRCLASS5,NVL(DETAILESCORE1,0),DETAILECLASS1,'+
                         '       NVL(DETAILESCORE2,0),DETAILECLASS2,NVL(DETAILESCORE3,0),DETAILECLASS3,'+
                         '       NVL(DETAILESCORE4,0),DETAILECLASS4,NVL(DETAILESCORE5,0),DETAILECLASS5,'+
                         '       NVL(A.ESCORE,0)                                                       '+
                         '  FROM PEHREAIM_DET A, PEHREMAS B,  PYCCODE E,    PISHRDUKIND C, PISHRDUTY D,'+
                         '       PYCCODE F, PYCCODE G, PYCDEPT H                                       '+
                         ' WHERE B.RABASDATE = ''%s''                                                  '+
                         '   AND B.EMPNO = ''%s''                                                      '+
                         '   AND B.RABASDATE = A.RABASDATE(+)                                          '+
                         '   AND B.EMPNO = A.EMPNO(+)                                                  '+
                         '   AND B.JOBKIND = C.DUTYKIND(+)                                             '+
                         '   AND B.JOBDUTY = D.DUTY(+)                                                 '+
                         '   AND B.JOBGUN = E.CODENO(+) AND E.CODEID(+)=''I115''                       '+
                         '   AND B.PAYCL = F.CODENO(+) AND F.CODEID(+)=''I112''                        '+
                         '   AND B.PAYRA =G.CODENO(+) AND G.CODEID(+)=''I113''                         '+
                         '   AND B.ORGNUM = H.ORGNUM AND B.DEPTCODE = H.DEPTCODE ',[Lrabasdate,Pempno]);


       ServiceName := 'PED1010A_sel1';  //SVRNAME = htmax_pe13
       ClearFieldInfo;
       AddField('RABASDATE'    , ftString, 8);
       AddField('EMPNO'        , ftString, 4);
       AddField('EMPDATE'      , ftString, 8);
       AddField('PAYCLDATE'    , ftString, 8);
       AddField('TRDATE'       , ftString, 8);
       AddField('JOBGUN'       , ftString, 2);
       AddField('PAYCL'        , ftString, 3);
       AddField('PAYRA'        , ftString, 3);
       AddField('ORGNUM'       , ftString, 3);
       AddField('DEPTCODE'     , ftString, 6);
       AddField('DEPTNAME'     , ftString, 60);
       AddField('DUTYKINDNAME' , ftString, 30);
       AddField('OBJYN'        , ftString, 30);
       AddField('JOBGUNNAME'   , ftString, 20);
       AddField('PAYCLNAME'    , ftString, 20);
       AddField('PAYRANAME'    , ftString, 20);
       AddField('SEQNO'        , ftInteger, 2);
       AddField('PROPELTASK'   , ftString, 100);
       AddField('MAINWEIGHT'   , ftInteger, 3);
       AddField('DETAILTASK1'  , ftString, 100);
       AddField('DETAILTASK2'  , ftString, 100);
       AddField('DETAILTASK3'  , ftString, 100);
       AddField('DETAILTASK4'  , ftString, 100);
       AddField('DETAILTASK5'  , ftString, 100);
       AddField('DETAILWEIGHT1', ftInteger, 3);
       AddField('DETAILWEIGHT2', ftInteger, 3);
       AddField('DETAILWEIGHT3', ftInteger, 3);
       AddField('DETAILWEIGHT4', ftInteger, 3);
       AddField('DETAILWEIGHT5', ftInteger, 3);
       AddField('VALIDX1'      , ftString, 100);
       AddField('VALIDX2'      , ftString, 100);
       AddField('VALIDX3'      , ftString, 100);
       AddField('VALIDX4'      , ftString, 100);
       AddField('VALIDX5'      , ftString, 100);
       AddField('VALFUNCTION1' , ftString, 100);
       AddField('VALFUNCTION2' , ftString, 100);
       AddField('VALFUNCTION3' , ftString, 100);
       AddField('VALFUNCTION4' , ftString, 100);
       AddField('VALFUNCTION5' , ftString, 100);
       AddField('SRESULTCLASS1', ftString, 100);
       AddField('ARESULTCLASS1', ftString, 100);
       AddField('BRESULTCLASS1', ftString, 100);
       AddField('CRESULTCLASS1', ftString, 100);
       AddField('DRESULTCLASS1', ftString, 100);
       AddField('SRESULTCLASS2', ftString, 100);
       AddField('ARESULTCLASS2', ftString, 100);
       AddField('BRESULTCLASS2', ftString, 100);
       AddField('CRESULTCLASS2', ftString, 100);
       AddField('DRESULTCLASS2', ftString, 100);
       AddField('SRESULTCLASS3', ftString, 100);
       AddField('ARESULTCLASS3', ftString, 100);
       AddField('BRESULTCLASS3', ftString, 100);
       AddField('CRESULTCLASS3', ftString, 100);
       AddField('DRESULTCLASS3', ftString, 100);
       AddField('SRESULTCLASS4', ftString, 100);
       AddField('ARESULTCLASS4', ftString, 100);
       AddField('BRESULTCLASS4', ftString, 100);
       AddField('CRESULTCLASS4', ftString, 100);
       AddField('DRESULTCLASS4', ftString, 100);
       AddField('SRESULTCLASS5', ftString, 100);
       AddField('ARESULTCLASS5', ftString, 100);
       AddField('BRESULTCLASS5', ftString, 100);
       AddField('CRESULTCLASS5', ftString, 100);
       AddField('DRESULTCLASS5', ftString, 100);
       AddField('E1PRJOPINON'  , ftString, 200);
       AddField('RESULT1'      , ftString, 100);
       AddField('RESULT2'      , ftString, 100);
       AddField('RESULT3'      , ftString, 100);
       AddField('RESULT4'      , ftString, 100);
       AddField('RESULT5'      , ftString, 100);
       AddField('RSCORE'       , ftFloat,    7);
       AddField('DETAILRSCORE1', ftFloat,    7);
       AddField('DETAILRCLASS1', ftString,   1);
       AddField('DETAILRSCORE2', ftFloat,    7);
       AddField('DETAILRCLASS2', ftString,   1);
       AddField('DETAILRSCORE3', ftFloat,    7);
       AddField('DETAILRCLASS3', ftString,   1);
       AddField('DETAILRSCORE4', ftFloat,    7);
       AddField('DETAILRCLASS4', ftString,   1);
       AddField('DETAILRSCORE5', ftFloat,    7);
       AddField('DETAILRCLASS5', ftString,   1);
       AddField('DETAILESCORE1', ftFloat,    7);
       AddField('DETAILECLASS1', ftString,   1);
       AddField('DETAILESCORE2', ftFloat,    7);
       AddField('DETAILECLASS2', ftString,   1);
       AddField('DETAILESCORE3', ftFloat,    7);
       AddField('DETAILECLASS3', ftString,   1);
       AddField('DETAILESCORE4', ftFloat,    7);
       AddField('DETAILECLASS4', ftString,   1);
       AddField('DETAILESCORE5', ftFloat,    7);
       AddField('DETAILECLASS5', ftString,   1);
       AddField('ESCORE'       , ftFloat,    7);

       Close;
       SQl.Clear;
       SQL.Text := Sqltext;
       Open;

       TDS_Works.fieldbyname('OBJYN').Alignment := taCenter;
       L_e1emp.ValueCaption     := Le1empno +' - '+ Le1korname;
       if Le2empno <> '' then
            L_e2emp.ValueCaption   := Le2empno +' - '+ Le2korname
       else
            L_e2emp.ValueCaption := '없음';
  end;
  RScore;
end;

procedure TFM_Main.Values_data1;
var
  SqlText: String;
  i, j : Integer;
begin
  Application.ProcessMessages;
  SqlText :=   'SELECT nvl(abconyn ,'' ''),            '+
                     ' nvl(beconyn   ,'' ''),          '+
                     ' nvl(duconyn   ,'' ''),          '+
                     ' nvl(valconyn   ,'' ''),         '+
                     ' ''FIELD5'' FIELD5               '+
                ' FROM pesms                           '+ // 능력태도자기종합
               ' WHERE rabasdate = '''+Lrabasdate+'''  '+
                 ' AND empno     = '''+Pempno+'''      '; // 평가자(접속자사번)

  with TDS do
  begin
       Close;
       ServiceName := 'HINSA_select';
       Sql.Text := SqlText;

       ClearFieldInfo;
       AddField('ABCONYN'      , ftString    ,  100  );
       AddField('BECONYN'      , ftString    ,  100  );
       AddField('DUCONYN'      , ftString    ,  100  );
       AddField('VALCONYN'     , ftString    ,  100  );
       AddField('FIELD5'       , ftString    ,  100  );
       Open;
  end;

  if (TDS.FieldByName('VALCONYN').AsString = 'Y') then
  begin
     //OnlyVisible;
  end;

  //SG_ItemImage01의 값을 지운다..
  for i := 0 to SG_ItemImage01.ColCount - 1 do
    for j := 0 to SG_ItemImage01.RowCount -1 do
      SG_ItemImage01.Cells[i, j] := '';

  i := 0; j := 0;

  SqlText := 'SELECT                                               '+
             '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
             '       nvl(        a.imagename   ,'' '') || '';'' || '+
             '       nvl(        a.imageno,     ''0'') || '';'' || '+
             '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
             '       nvl(        a.imagebigo   ,'' '')             '+
             '  FROM petacd a                                      '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
             ' WHERE a.rabasdate = '''+Lrabasdate+'''              '+
             '   AND a.evcno     = 1                               '+ // 평가표번호
             '   AND a.ekind     = ''Values''                      '+ // 평가구분
             '   ORDER BY a.itemno, a.imageno                      ';

  //항목을 가져와서 SG_ItemImage01.에 넣고..
  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 5000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  while not TMaxDataSet_HInsa.Eof do
  begin
      inc(i);
      SG_ItemImage01.Cells[0, i-1] := Csel_gfd(2);
      SG_ItemImage01.Cells[1, i-1] := Csel_gfd(4);
//      SG_ItemImage01.Cells[2, i-1] := Csel_gfd(5);

      TMaxDataSet_HInsa.Next;
  end;

  //SG_HiddenData01에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  SG_HiddenData01.RowCount := 1;
  for i := 0 to SG_HiddenData01.ColCount - 1 do
    for j := 0 to SG_HiddenData01.RowCount -1 do
      SG_HiddenData01.Cells[i, j] := '';

  for i := 0 to SG_HiddenData01.ColCount - 1 do
       for j := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount -1 do
            SG_HiddenData01.Cells[i, j] := '';
  SG_HiddenData01.RowCount := SG_HiddenData01.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||  '+#13+
              '       nvl(a.itemname,'' '')||'';''||         '+#13+
              '       nvl('''',''0'')||'';''|| '+#13+         //to_char(a.imageno)
              '       nvl(a.itemdesc,'' '')||'';''||         '+#13+ //imagedesc
              '       nvl(to_char(b.score),''0'')||'';''||   '+#13+
              '       nvl(b.empno,'' '')                     '+#13+
              '  FROM  petac a, petds b            '+#13+ //           , petacd c'+#13+ //  능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+Lrabasdate+'''       '+#13+
              '   AND a.evcno     = 1                        '+#13+ // 평가표번호
              '   AND a.ekind     = ''Values''               '+#13+ // 평가구분
              //'   AND a.rabasdate = c.rabasdate              '+#13+
              //'   AND a.evcno     = c.evcno                  '+#13+ // 평가표번호
              //'   AND a.ekind     = c.ekind                  '+#13+
              //'   AND a.itemno    = c.itemno                 '+#13+
              '   AND a.rabasdate = b.rabasdate(+)           '+#13+
              '   AND a.ekind     = b.ekind(+)               '+#13+
              '   AND b.empno(+)  = '''+Pempno+'''           '+#13+ // 피평가자사번
              '   AND a.itemno    = b.itemno(+)              '+#13+
              //'   AND a.imageno   = b.imageno(+)             '+#13+
              //'   AND a.itemno    = 1                        '+#13+
              ' ORDER BY a.itemno                            ';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  while not TMaxDataSet_HInsa.EOF do
  begin
       if SG_HiddenData01.Cells[dITEMNO_IDX, SG_HiddenData01.RowCount-1] <> '' then
         SG_HiddenData01.RowCount := SG_HiddenData01.RowCount + 1;

       SG_HiddenData01.Cells[dITEMNO_IDX, SG_HiddenData01.RowCount-1]  := Csel_gfd(1); // 평가항목번호
       SG_HiddenData01.Cells[dITEMNAME_IDX, SG_HiddenData01.RowCount-1]:= Csel_gfd(2); // 평가항목명
       SG_HiddenData01.Cells[dIMAGENO_IDX, SG_HiddenData01.RowCount-1] := Csel_gfd(3); // 평가이미지번호
       SG_HiddenData01.Cells[dITEMDESC_IDX, SG_HiddenData01.RowCount-1]:= Csel_gfd(4); // 평가이미지내용
       SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.RowCount-1] := Csel_gfd(5); // 평가점수

       if Trim(Csel_gfd(6)) = '' then
         SG_HiddenData01.Cells[dISNEW_IDX, SG_HiddenData01.RowCount-1] := 'Y' // 테이블에 없는 레코드
       else
         SG_HiddenData01.Cells[dISNEW_IDX, SG_HiddenData01.RowCount-1] := 'N';

       SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.RowCount-1] := 'N'; // 자료 변동 여부

       TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum01;
  ShowImage01;
end;

procedure TFM_Main.Common_data;
var
  SqlText: String;
  i, j : Integer;
begin
  Application.ProcessMessages;
  SqlText :=   'SELECT nvl(abconyn ,'' ''),'+
                     ' nvl(beconyn   ,'' ''),'+
                     ' nvl(duconyn   ,'' ''),'+
                     ' nvl(valconyn   ,'' ''),'+
                     ' ''FIELD5'' FIELD5'+
                ' FROM pesms' + // 능력태도자기종합
               ' WHERE rabasdate = '''+Lrabasdate+'''' +
                 ' AND empno = '''+Pempno+''' '; // 평가자(접속자사번)

  with TDS do
  begin
       Close;
       ServiceName := 'HINSA_select';
       Sql.Text := SqlText;

       ClearFieldInfo;
       AddField('ABCONYN'      , ftString    ,  100  );
       AddField('BECONYN'      , ftString    ,  100  );
       AddField('DUCONYN'      , ftString    ,  100  );
       AddField('VALCONYN'     , ftString    ,  100  );
       AddField('FIELD5'       , ftString    ,  100  );
       Open;
  end;

  if (TDS.FieldByName('ABCONYN').AsString = 'Y') then
  begin
     //OnlyVisible;
  end;

  for i := 0 to SG_HiddenData1.ColCount - 1 do
       for j := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
            SG_HiddenData1.Cells[i, j] := '';
  SG_HiddenData1.RowCount := SG_HiddenData1.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(a.itemname,'' '')||'';''||'+
                    ' nvl('''',''0'')||'';''||'+  // to_char(a.imageno)
                    ' nvl(a.itemdesc,'' '')||'';''||'+  //a.imagedesc
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petac a, petds b'+  //, petacd C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+Lrabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
           //     ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''공통역량''' + // 평가구분
           //     ' AND a.rabasdate = c.rabasdate' +
           //     ' AND a.evcno     = c.evcno' + // 평가표번호
           //     ' AND a.paycl     = c.paycl' + // BAND
           //     ' AND a.ekind     = c.ekind' +
           //     ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+Pempno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
           //     ' AND a.imageno   = b.imageno(+)' +
              ' ORDER BY a.itemno'; //, a.imageno';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  while not TMaxDataSet_HInsa.EOF do
  begin
       if SG_HiddenData1.Cells[dITEMNO_IDX, SG_HiddenData1.RowCount-1] <> '' then
            SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;

       SG_HiddenData1.Cells[dITEMNO_IDX, SG_HiddenData1.RowCount-1]  := Csel_gfd(1); // 평가항목번호
       SG_HiddenData1.Cells[dITEMNAME_IDX, SG_HiddenData1.RowCount-1]:= Csel_gfd(2); // 평가항목명
       SG_HiddenData1.Cells[dIMAGENO_IDX, SG_HiddenData1.RowCount-1] := Csel_gfd(3); // 평가이미지번호
       SG_HiddenData1.Cells[dITEMDESC_IDX, SG_HiddenData1.RowCount-1]:= Csel_gfd(4); // 평가이미지내용
       SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.RowCount-1] := Csel_gfd(5); // 평가점수

       if Trim(Csel_gfd(6)) = '' then
            SG_HiddenData1.Cells[dISNEW_IDX, SG_HiddenData1.RowCount-1] := 'Y' // 테이블에 없는 레코드
       else
            SG_HiddenData1.Cells[dISNEW_IDX, SG_HiddenData1.RowCount-1] := 'N';

       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.RowCount-1] := 'N'; // 자료 변동 여부

       TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum1;
  ShowImage1;
end;

procedure TFM_Main.ShowSum1;
var
  i, j, k, l: Integer;
begin
  j := 0; k := 0; l := 0;
  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
       if SG_HiddenData1.Cells[dSCORE_IDX, i] <> '0' then
       begin
            inc(j);
            k := k + StrToIntDef(SG_HiddenData1.Cells[dSCORE_IDX, i],0);
       end
       else
            inc(l);
  end;
  L_Total1.Caption := IntToStr(SG_HiddenData1.RowCount - SG_HiddenData1.FixedRows);//+'개';
  L_Yes1.Caption   := IntToStr(j);

end;

procedure TFM_Main.ShowImage1;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image1.ColCount - 1 do
       for j := 0 to SG_Image1.RowCount -1 do
            SG_Image1.Cells[i, j] := '';
  SG_Image1.RowCount := SG_Image1.FixedRows+1;

  for i := 0 to SG_Score1.ColCount - 1 do
       for j := 0 to SG_Score1.RowCount -1 do
            SG_Score1.Cells[i, j] := '';
  SG_Score1.RowCount := SG_Score1.FixedRows+1;

  SG_HiddenData1.Tag := -1;

  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
       if SG_HiddenData1.Tag = -1 then
            SG_HiddenData1.Tag := i;

       if SG_Image1.Cells[SG_Image1.FixedCols, SG_Image1.RowCount-1] <> '' then
       begin
            SG_Image1.RowCount := SG_Image1.RowCount + 1;
            SG_Score1.RowCount := SG_Score1.RowCount + 1;
       end;

       SG_Image1.Cells[mITEMDESC_IDX, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[dITEMDESC_IDX, i];
       SG_Image1.Cells[mITEMNAME_IDX, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[dITEMNAME_IDX, i];  //SG_HiddenData1.Cells[dITEMNO_IDX, i] +'. ' +

       SG_Score1.Cells[dS_IDX , SG_Score1.RowCount-1] := '';
       SG_Score1.Cells[dA_IDX , SG_Score1.RowCount-1] := '';
       SG_Score1.Cells[dB_IDX , SG_Score1.RowCount-1] := '';
       SG_Score1.Cells[dC_IDX , SG_Score1.RowCount-1] := '';
       SG_Score1.Cells[dD_IDX , SG_Score1.RowCount-1] := '';

       //버튼상태반영
            if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrS  then SG_Score1.Cells[dS_IDX , SG_Score1.RowCount-1] := var_GrdS
       else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrA  then SG_Score1.Cells[dA_IDX , SG_Score1.RowCount-1] := var_GrdA
       else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrB  then SG_Score1.Cells[dB_IDX,  SG_Score1.RowCount-1] := var_GrdB
       else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrC  then SG_Score1.Cells[dC_IDX , SG_Score1.RowCount-1] := var_GrdC
       else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrD  then SG_Score1.Cells[dD_IDX,  SG_Score1.RowCount-1] := var_GrdD;
  end;

//  if PageControl1.ActivePage = TabSheet2 then
//     SG_Image1.SetFocus;
end;

procedure TFM_Main.ShowSum01;
var
  i, j, k, l: Integer;
begin
  j := 0; k := 0; l := 0;
  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
  begin
       if SG_HiddenData01.Cells[dSCORE_IDX, i] <> '0' then
       begin
            inc(j);
            k := k + StrToIntDef(SG_HiddenData01.Cells[dSCORE_IDX, i],0);
       end
       else
            inc(l);
  end;
  L_Total01.Caption := IntToStr(SG_HiddenData01.RowCount - SG_HiddenData01.FixedRows);//+'개';
  L_Yes01.Caption   := IntToStr(j);

end;

procedure TFM_Main.ShowImage01;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image01.ColCount - 1 do
       for j := 0 to SG_Image01.RowCount -1 do
            SG_Image01.Cells[i, j] := '';
  SG_Image01.RowCount := SG_Image01.FixedRows+1;

  for i := 0 to SG_Score01.ColCount - 1 do
       for j := 0 to SG_Score01.RowCount -1 do
            SG_Score01.Cells[i, j] := '';
  SG_Score01.RowCount := SG_Score01.FixedRows+1;

  SG_HiddenData01.Tag := -1;

  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
  begin
       if SG_HiddenData01.Tag = -1 then
            SG_HiddenData01.Tag := i;

       if SG_Image01.Cells[SG_Image01.FixedCols, SG_Image01.RowCount-1] <> '' then
       begin
            SG_Image01.RowCount := SG_Image01.RowCount + 1;
            SG_Score01.RowCount := SG_Score01.RowCount + 1;
       end;

       SG_Image01.Cells[mITEMNAME_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMDESC_IDX, i];
       SG_Image01.Cells[mITEMDESC_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMNAME_IDX, i];

       SG_Score01.Cells[dS_IDX , SG_Score01.RowCount-1] := '';
       SG_Score01.Cells[dA_IDX , SG_Score01.RowCount-1] := '';
       SG_Score01.Cells[dB_IDX , SG_Score01.RowCount-1] := '';
       SG_Score01.Cells[dC_IDX , SG_Score01.RowCount-1] := '';
       SG_Score01.Cells[dD_IDX , SG_Score01.RowCount-1] := '';

       //버튼상태반영
            if SG_HiddenData01.Cells[dSCORE_IDX, i] = var_ScrS  then SG_Score01.Cells[dS_IDX , SG_Score01.RowCount-1] := var_GrdS
       else if SG_HiddenData01.Cells[dSCORE_IDX, i] = var_ScrA  then SG_Score01.Cells[dA_IDX , SG_Score01.RowCount-1] := var_GrdA
       else if SG_HiddenData01.Cells[dSCORE_IDX, i] = var_ScrB  then SG_Score01.Cells[dB_IDX,  SG_Score01.RowCount-1] := var_GrdB
       else if SG_HiddenData01.Cells[dSCORE_IDX, i] = var_ScrC  then SG_Score01.Cells[dC_IDX , SG_Score01.RowCount-1] := var_GrdC
       else if SG_HiddenData01.Cells[dSCORE_IDX, i] = var_ScrD  then SG_Score01.Cells[dD_IDX,  SG_Score01.RowCount-1] := var_GrdD;
  end;

  SG_Image01.SetFocus;
end;

function TFM_Main.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
  v_cnt  := 1;
  while v_cnt < p_loc do
  begin
       v_tmp := Pos(';',v_data);
       if not(v_tmp > 0) then Exit;
       v_cnt := v_cnt + 1;
       Delete(v_data, 1, v_tmp);
  end;
  v_tmp  := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Main.SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  liLeft   : Integer;
  liTop    : Integer;
  lsBuffer : String;
  i        : integer;
  bColor   : Boolean;
begin
  bColor := False;
  for i := 0 to SG_Score1.ColCount -1 do
       if SG_Score1.Cells[i, ARow] <> '' then
       begin
            bColor := True;
            break;
       end;
  if bColor then
       SG_Score1.Canvas.Brush.Color := $00FFF9EC //SG_Score.Font.Color;
  else
       SG_Score1.Canvas.Brush.Color := SG_Image1.Color; ///$00F0FFFF;

  if CB_ShowClass1.Checked then // 등급을 보이게...
       SG_Score1.Canvas.Font.Color := SG_Image1.Font.Color
  else
       SG_Score1.Canvas.Font.Color := SG_Score1.Font.Color;

  SG_Score1.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score1.Cells[ACol, ARow];
  liLeft   := (((Rect.Right - Rect.Left)
            - SG_Score1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop    := (((Rect.Bottom - Rect.Top)
            - SG_Score1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score1.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Main.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TFM_Main.Leadership_data;
var
  SqlText: String;
  i, j : Integer;
begin
  Application.ProcessMessages;

  for i := 0 to SG_HiddenData2.ColCount - 1 do
       for j := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount -1 do
            SG_HiddenData2.Cells[i, j] := '';
  SG_HiddenData2.RowCount := SG_HiddenData2.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(a.itemname,'' '')||'';''||'+
                    ' nvl('''',''0'')||'';''||'+//to_char(a.imageno)
                    ' nvl(a.itemdesc,'' '')||'';''||'+     //a.imagedesc
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petac a, petds b' + //, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+Lrabasdate+''''+
                ' AND a.evcno     = 1' + // 평가표번호
            //    ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
            //    ' AND a.rabasdate = c.rabasdate' +
            //    ' AND a.evcno     = c.evcno' + // 평가표번호
            //    ' AND a.paycl     = c.paycl' + // BAND
            //    ' AND a.ekind     = c.ekind' +
            //    ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)'+
                ' AND a.ekind     = b.ekind(+)'+
                ' AND b.empno(+)  = '''+Pempno+''''+ // 피평가자사번
                ' AND a.itemno    = b.itemno(+)'+
            //    ' AND a.imageno   = b.imageno(+)'+
              ' ORDER BY a.itemno';//, a.imageno';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;

  while not TMaxDataSet_HInsa.EOF do
  begin
       if SG_HiddenData2.Cells[dITEMNO_IDX, SG_HiddenData2.RowCount-1] <> '' then
         SG_HiddenData2.RowCount := SG_HiddenData2.RowCount + 1;

       SG_HiddenData2.Cells[dITEMNO_IDX, SG_HiddenData2.RowCount-1]  := Csel_gfd(1); // 평가항목번호
       SG_HiddenData2.Cells[dITEMNAME_IDX, SG_HiddenData2.RowCount-1]:= Csel_gfd(2); // 평가항목명
       SG_HiddenData2.Cells[dIMAGENO_IDX, SG_HiddenData2.RowCount-1] := Csel_gfd(3); // 평가이미지번호
       SG_HiddenData2.Cells[dITEMDESC_IDX, SG_HiddenData2.RowCount-1]:= Csel_gfd(4); // 평가이미지내용
       SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.RowCount-1] := Csel_gfd(5); // 평가점수

       if Trim(Csel_gfd(6)) = '' then
         SG_HiddenData2.Cells[dISNEW_IDX, SG_HiddenData2.RowCount-1] := 'Y' // 테이블에 없는 레코드
       else
         SG_HiddenData2.Cells[dISNEW_IDX, SG_HiddenData2.RowCount-1] := 'N';

       SG_HiddenData2.Cells[dMODIFIED_IDX, SG_HiddenData2.RowCount-1] := 'N'; // 자료 변동 여부

       TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum2;

  ShowImage2;
end;

procedure TFM_Main.ShowSum2;
var
  i, j, k, l: Integer;
begin
  j := 0; k := 0; l := 0;
  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
  begin
       if SG_HiddenData2.Cells[dSCORE_IDX, i] <> '0' then
       begin
            inc(j);
            k := k + StrToIntDef(SG_HiddenData2.Cells[dSCORE_IDX, i],0);
       end
       else
            inc(l);
  end;
  L_Total2.Caption := IntToStr(SG_HiddenData2.RowCount - SG_HiddenData2.FixedRows);//+'개';
  L_Yes2.Caption   := IntToStr(j);
end;

procedure TFM_Main.ShowImage2;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image2.ColCount - 1 do
       for j := 0 to SG_Image2.RowCount -1 do
            SG_Image2.Cells[i, j] := '';
  SG_Image2.RowCount := SG_Image2.FixedRows+1;

  for i := 0 to SG_Score2.ColCount - 1 do
       for j := 0 to SG_Score2.RowCount -1 do
            SG_Score2.Cells[i, j] := '';
  SG_Score2.RowCount := SG_Score2.FixedRows+1;

  SG_HiddenData2.Tag := -1;

  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
  begin
       if SG_HiddenData2.Tag = -1 then
            SG_HiddenData2.Tag := i;

       if SG_Image2.Cells[SG_Image2.FixedCols, SG_Image2.RowCount-1] <> '' then
       begin
            SG_Image2.RowCount := SG_Image2.RowCount + 1;
            SG_Score2.RowCount := SG_Score2.RowCount + 1;
       end;

       SG_Image2.Cells[mITEMDESC_IDX, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[dITEMDESC_IDX, i];
       SG_Image2.Cells[mITEMNAME_IDX, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[dITEMNAME_IDX, i];  //SG_HiddenData2.Cells[dITEMNO_IDX, i] +'. ' +

       SG_Score2.Cells[dS_IDX , SG_Score2.RowCount-1] := '';
       SG_Score2.Cells[dA_IDX , SG_Score2.RowCount-1] := '';
       SG_Score2.Cells[dB_IDX , SG_Score2.RowCount-1] := '';
       SG_Score2.Cells[dC_IDX , SG_Score2.RowCount-1] := '';
       SG_Score2.Cells[dD_IDX , SG_Score2.RowCount-1] := '';

       //버튼상태반영
            if SG_HiddenData2.Cells[dSCORE_IDX, i] = var_ScrS  then SG_Score2.Cells[dS_IDX , SG_Score2.RowCount-1] := var_GrdS
       else if SG_HiddenData2.Cells[dSCORE_IDX, i] = var_ScrA  then SG_Score2.Cells[dA_IDX , SG_Score2.RowCount-1] := var_GrdA
       else if SG_HiddenData2.Cells[dSCORE_IDX, i] = var_ScrB  then SG_Score2.Cells[dB_IDX,  SG_Score2.RowCount-1] := var_GrdB
       else if SG_HiddenData2.Cells[dSCORE_IDX, i] = var_ScrC  then SG_Score2.Cells[dC_IDX , SG_Score2.RowCount-1] := var_GrdC
       else if SG_HiddenData2.Cells[dSCORE_IDX, i] = var_ScrD  then SG_Score2.Cells[dD_IDX,  SG_Score2.RowCount-1] := var_GrdD;
  end;

  if PageControl1.ActivePage = TabSheet3 then
       SG_Image2.SetFocus;
end;

function TFM_Main.Csel_gfd2(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBcommon.FieldByName('SEL_DATA').AsString;
  v_cnt  := 1;
  while v_cnt < p_loc do
  begin
       v_tmp := Pos(';',v_data);
       if not(v_tmp > 0) then Exit;
       v_cnt := v_cnt + 1;
       Delete(v_data, 1, v_tmp);
  end;
  v_tmp  := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  if var_Ekind <> '' then
  begin
       if (Bt_Save1.Visible) and (IsDataModified01 or IsDataModified1 or IsDataModified2 or IsDataModified3) then
       begin
            If       var_Ekind = 'Values' then
                 PageControl1.ActivePage := TabSheet1
            else if  var_Ekind = '공통역량' then
                 PageControl1.ActivePage := TabSheet2
            else if  var_Ekind = '리더십역량' then
                 PageControl1.ActivePage := TabSheet3
            else if  var_Ekind = '업적' then
                 PageControl1.ActivePage := TabSheet4
            else if  var_Ekind = '종합의견ⓐ' then
                 PageControl1.ActivePage := TabSheet6;

            MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
                       '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
  end;

  if Lrvalconyn = 'Y' then
  begin
       RB_MoveEra1.Enabled  := false;
       RB_MoveEra2.Enabled  := false;
       RB_MoveEra3.Enabled  := false;
       RB_MoveCause1.Enabled  := false;
       RB_MoveCause2.Enabled  := false;
       RB_MoveCause3.Enabled  := false;
       RB_MoveCause4.Enabled  := false;
       RB_MoveCause5.Enabled  := false;
       E_MoveCause.ReadOnly   := true;
       E_MoveDept.Enabled     := false;
       E_Propose.ReadOnly     := true;
  end;

  if PageControl1.ActivePage = TabSheet1 then
  begin
       var_Ekind          := 'Values';
       BT_Save1.Caption   := 'Values 자기평가 저장';
       BT_Cancel1.Caption := 'Values 자기평가 취소';
       SG_Image01.SetFocus;
  end
  else

  if PageControl1.ActivePage = TabSheet2 then
  begin
       var_Ekind          := '공통역량';
       BT_Save1.Caption   := '공통역량 자기평가 저장';
       BT_Cancel1.Caption := '공통역량 자기평가 취소';
       SG_Image1.SetFocus;
  end
  else
  if PageControl1.ActivePage = TabSheet3 then
  begin
       var_Ekind          := '리더십역량';
       BT_Save1.Caption   := '리더십역량 자기평가 저장';
       BT_Cancel1.Caption := '리더십역량 자기평가 취소';
       SG_Image2.SetFocus;
  end
  else
  if PageControl1.ActivePage = TabSheet4 then
  begin
       var_Ekind          := '업적';
       BT_Save1.Caption   := '업적 자기평가 저장';
       BT_Cancel1.Caption := '업적 자기평가 취소';
       DBG_user.SetFocus;
  end
  else
  if PageControl1.ActivePage = TabSheet6 then
  begin
       var_Ekind          := '종합의견ⓐ';
       BT_Save1.Caption   := '종합의견 저장';
       BT_Cancel1.Caption := '종합의견 취소';
       if not (RB_MoveEra2.Checked or RB_MoveEra3.Checked) and (Lrvalconyn <> 'Y') then
            RB_MoveEra1.SetFocus;
  end;

  SelectMerit;
end;

procedure TFM_Main.SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_Image2.Canvas.Brush.Color := $00FFE8D0;
       SG_Image2.Canvas.Font.Color  := clBlack;
  end;

  SG_Image2.Canvas.FillRect(Rect);

  SG_Image2.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL1;

  if SG_Image2.VisibleRowCount < SG_Image2.RowCount then
       SG_Image2.ColWidths[mITEMDESC_IDX] := SG_Image2.Width -  SG_Image2.ColWidths[mITEMNAME_IDX] - 16
  else
       SG_Image2.ColWidths[mITEMDESC_IDX] := SG_Image2.Width -  SG_Image2.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image2.RowCount > (SG_Image2.VisibleRowCount+SG_Image2.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image2.Cells[ACol, ARow];
  DrawText(SG_Image2.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  //if SG_HiddenData2.Tag = -1 then
  //  System.Exit;
  //if not SG_Image2.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
  //  System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image2.Row < SG_Image2.TopRow then // 현재 row 가 화면위에 있다
       SG_Image2.Row := SG_Image2.TopRow
  else if SG_Image2.Row > (SG_Image2.TopRow + SG_Image2.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_Image2.Row := SG_Image2.TopRow + SG_Image2.VisibleRowCount-1;

  SG_Score2.TopRow := SG_Image2.TopRow;
  SG_Score2.Row    := SG_Image2.Row;

{  // 버튼의 top 위치를 계산
  P_ControlButton2.Top:= (SG_Image2.Row - SG_Image2.TopRow) *
                         (SG_Image2.DefaultRowHeight + SG_Image2.GridLineWidth) + 2;
}
  // 점수를 버튼에 반영
  SB_S2.Down   := False;
  SB_A2.Down   := False;
  SB_B2.Down   := False;
  SB_C2.Down   := False;
  SB_D2.Down   := False;

  //버튼상태반영
       if SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row] = var_ScrS  then  SB_S2.Down  := True
  else if SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row] = var_ScrA  then  SB_A2.Down  := True
  else if SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row] = var_ScrB  then  SB_B2.Down  := True
  else if SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row] = var_ScrC  then  SB_C2.Down  := True
  else if SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row] = var_ScrD  then  SB_D2.Down  := True;

  P_ControlButton2.Visible := True;

  SG_Image2Click(Sender);
end;

procedure TFM_Main.Csel_Open;
begin
  Csel_ret := False;
  with DBcommon do
  begin
       Close;
       ServiceName := 'PEA1060A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 300);
       ClearParamInfo;
       SQL.Text := Csel_SQL;
       Open;
       if RecordCount > 0 then Csel_ret := True;
  end;
end;

procedure TFM_Main.Rscore;
var
  SqlText       : string;
begin
  //자기평가점수 합계
  SqlText := Format('select nvl(sum(rscore),0)|| '';'' || '+
                    '       nvl(sum(escore),0) '+
                    '  from pehreaim_DET                                     '+
                    ' where empno=''%s'' and rabasdate=''%s''                ',[Pempno, Lrabasdate]);
  Csel_SQL := SqlText;
  Csel_Open;
  g_rscore       := Csel_gfd2(1);
  g_escore       := Csel_gfd2(2);

  SqlText := Format('select nvl(decode(prorscore,'''',0,prorscore), 0) '+
                    '       ||'';''||nvl(decode(proescore,'''',0,proescore), 0) '+
                    '       ||'';''||prorclass ||'';''|| proeclass '+
                    '  from pehremas   '+
                    ' where empno=''%s'' and rabasdate=''%s'' ',[Pempno, Lrabasdate]);
  Csel_SQL := SqlText;
  Csel_Open;
  g_prorscore   := Csel_gfd2(1);
  g_proescore   := Csel_gfd2(2);
  g_prorclass   := Csel_gfd2(3);
  g_proeclass   := Csel_gfd2(4);

  TOnSkinButton(Self.FindComponent('SW_S6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_A6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_B6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_C6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_D6')).BtnDown := False;

  TOnSkinButton(Self.FindComponent('SW_S6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_A6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_B6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_C6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_D6')).Font.Color  := clBlack;

  if g_prorscore <> '0' then SelfScore6.ValueCaption := g_prorscore
  else                       SelfScore6.ValueCaption := '';

  if      g_prorclass = 'S' then SelfClass6.ValueCaption := var_GrdS
  else if g_prorclass = 'A' then SelfClass6.ValueCaption := var_GrdA
  else if g_prorclass = 'B' then SelfClass6.ValueCaption := var_GrdB
  else if g_prorclass = 'C' then SelfClass6.ValueCaption := var_GrdC
  else if g_prorclass = 'D' then SelfClass6.ValueCaption := var_GrdD
  else                           SelfClass6.ValueCaption := g_prorclass;

  if  (g_prorclass <> '') then
  begin
       TOnSkinButton(Self.FindComponent('SW_'+g_prorclass+'6')).BtnDown    := True;
       TOnSkinButton(Self.FindComponent('SW_'+g_prorclass+'6')).Font.Color := clWhite;
  end;

  L_rscore.Value := StrToFloat(g_rscore)*0.9 + StrToFloat(g_prorscore)*0.1;
//  OnNumberEdit2.Value := StrToFloat(g_escore);
end;

procedure TFM_Main.BT_Save1Click(Sender: TObject);
var
  i, j      : Integer;
  SqlText   : String;
  ChkFlag   : Boolean;
  Param     : OleVariant;
  v_rscore  : real;
  v_s_rscore: string;
  FL_Comp   : TOnRadioButton;
  vClass1, vClass2, vClass3, vClass4, vClass5 : String;
begin
  Application.ProcessMessages;
  ChkFlag := false;

  if PageControl1.ActivePage = TabSheet1 then
  begin
(*
       //Values 평가 내역을 저장처리 한다.
       if not IsDataModified01 then
       begin
            MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
*)
       if ((OM_Merit_V1.Text = '') or (OM_Merit_V2.Text = '')) then
       begin
            MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;

       for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
       begin
            if SG_HiddenData01.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
                 Continue;

            if SG_HiddenData01.Cells[dSCORE_IDX, i] = '' then // 평가점수가 null
            begin
                 SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                            ' WHERE rabasdate = '''+Lrabasdate+'''' +
                            '   AND empno = '''+Pempno+'''' + // 피평가자
                            '   AND ekind = ''Values''' +
                            '   AND itemno = '+SG_HiddenData01.Cells[dITEMNO_IDX,  i]+'' +
                            '   AND imageno = '+SG_HiddenData01.Cells[dIMAGENO_IDX, i]+'';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData01.Cells[dISNEW_IDX, i] := 'Y'; // 신규로 설정
            end
            else
            if SG_HiddenData01.Cells[dISNEW_IDX, i] = 'Y' then // 신규이면...
            begin
                 SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                            '       (rabasdate, empno, ekind, itemno, imageno, score) ' +
                            'VALUES ('''+Lrabasdate+''','+
                            '        '''+Pempno+''','+ // 자기평가자(접속자사번)
                            '        ''Values'',' +
                            '        '+SG_HiddenData01.Cells[dITEMNO_IDX,  i]+','+
                            '        '+SG_HiddenData01.Cells[dIMAGENO_IDX, i]+','+
                            '        '+SG_HiddenData01.Cells[dSCORE_IDX, i]+') ';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData01.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end
            else
            begin
                 SqlText := 'UPDATE petds ' + // 능력태도자기평가
                              ' SET score = '+SG_HiddenData01.Cells[dSCORE_IDX, i]+' ' +
                            ' WHERE rabasdate = '''+Lrabasdate+'''' +
                              ' AND empno = '''+Pempno+'''' + // 평가자
                              ' AND ekind = ''Values''' +
                              ' AND itemno = '+SG_HiddenData01.Cells[dITEMNO_IDX,  i]+'' +
                              ' AND imageno = '+SG_HiddenData01.Cells[dIMAGENO_IDX, i]+'';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData01.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end;
       end;
       for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
            SG_HiddenData01.Cells[dMODIFIED_IDX, i] := 'N';
       MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);

       InUpMerit(Pempno);
       Values_data1;
  end
  else
  if PageControl1.ActivePage = TabSheet2 then
  begin
(*
       //공통역량평가 내역을 저장처리 한다.
       if not IsDataModified1 then
       begin
            MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
*)
       if ((OM_Merit_C1.Text = '') or (OM_Merit_C2.Text = '')) then
       begin
            MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;

       if L_total1.Caption <> L_Yes1.Caption then
       begin
            if IDYES <> MessageBox(handle,pChar('공통역량 중 평가하지 않은 항목이 있습니다.'+#13+#13+
                                    '그래도 저장하시겠습니까?'),'알림',MB_YESNO + MB_DEFBUTTON2) then
                 System.Exit;
       end;

       for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
       begin
            if SG_HiddenData1.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
                  Continue;

            if SG_HiddenData1.Cells[dSCORE_IDX, i] = '' then // 평가점수가 null
            begin
                 SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                            ' WHERE rabasdate = '''+Lrabasdate+'''' +
                              ' AND empno = '''+Pempno+'''' + // 피평가자
                              ' AND ekind = ''공통역량''' +
                              ' AND itemno = '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+'' +
                              ' AND imageno = '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+'';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'Y'; // 신규로 설정
            end
            else if SG_HiddenData1.Cells[dISNEW_IDX, i] = 'Y' then // 신규이면...
            begin
                 SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                                  ' (rabasdate, empno, ekind, itemno, imageno, score) ' +
                            'VALUES ('''+Lrabasdate+''','+
                                   ' '''+Pempno+''','+ // 자기평가자(접속자사번)
                                   ' ''공통역량'',' +
                                   ' '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+','+
                                   ' '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+','+
                                   ' '+SG_HiddenData1.Cells[dSCORE_IDX, i]+') ';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end
            else
            begin
                 SqlText := 'UPDATE petds ' + // 능력태도자기평가
                              ' SET score = '+SG_HiddenData1.Cells[dSCORE_IDX, i]+' ' +
                            ' WHERE rabasdate = '''+Lrabasdate+'''' +
                              ' AND empno = '''+Pempno+'''' + // 평가자
                              ' AND ekind = ''공통역량''' +
                              ' AND itemno = '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+'' +
                              ' AND imageno = '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+'';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end;
       end;
       for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
            SG_HiddenData1.Cells[dMODIFIED_IDX, i] := 'N';
       MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);

       InUpMerit(Pempno);
       Common_data;
  end
  else  //리더십역량평가 내용을 저장처리 한다.
  if PageControl1.ActivePage = TabSheet3 then
  begin
(*
       if not IsDataModified2 then
       begin
            MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
*)
       if ((OM_Merit_R1.Text = '') or (OM_Merit_R2.Text = '')) then
       begin
            MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;

       if L_total2.Caption <> L_Yes2.Caption then
       begin
            if IDYES <> MessageBox(handle,pChar('리더십역량 중 평가하지 않은 항목이 있습니다.'+#13+#13+
                                    '그래도 저장하시겠습니까?'),'알림',MB_YESNO + MB_DEFBUTTON2) then
                 System.Exit;
       end;

       for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
       begin
            if SG_HiddenData2.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
                 Continue;

            if SG_HiddenData2.Cells[dSCORE_IDX, i] = '' then // 평가점수가 null
            begin
                 SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                            ' WHERE rabasdate = '''+Lrabasdate+'''' +
                            '   AND empno = '''+Pempno+'''' + // 피평가자
                            '   AND ekind = ''리더십역량''' +
                            '   AND itemno = '+SG_HiddenData2.Cells[dITEMNO_IDX,  i]+'' +
                            '   AND imageno = '+SG_HiddenData2.Cells[dIMAGENO_IDX, i]+'';

                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData2.Cells[dISNEW_IDX, i] := 'Y'; // 신규로 설정
            end
            else if SG_HiddenData2.Cells[dISNEW_IDX, i] = 'Y' then // 신규이면...
            begin
                 SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                            '       (rabasdate, empno, ekind, itemno, imageno, score) ' +
                            'VALUES ('''+Lrabasdate+''','+
                            '        '''+Pempno+''','+ // 자기평가자(접속자사번)
                            '        ''리더십역량'',' +
                            '        '+SG_HiddenData2.Cells[dITEMNO_IDX,  i]+','+
                            '        '+SG_HiddenData2.Cells[dIMAGENO_IDX, i]+','+
                            '        '+SG_HiddenData2.Cells[dSCORE_IDX, i]+') ';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData2.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end
            else
            begin
                 SqlText := 'UPDATE petds '+ // 능력태도자기평가
                              ' SET score = '+SG_HiddenData2.Cells[dSCORE_IDX, i]+' '+
                            ' WHERE rabasdate = '''+Lrabasdate+''''+
                              ' AND empno = '''+Pempno+''''+ // 평가자
                              ' AND ekind = ''리더십역량'''+
                              ' AND itemno = '+SG_HiddenData2.Cells[dITEMNO_IDX,  i]+''+
                              ' AND imageno = '+SG_HiddenData2.Cells[dIMAGENO_IDX, i]+'';
                 Cupd_SQL := SqlText;
                 Cupd_Exec;
                 SG_HiddenData2.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end;
       end;

       for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
            SG_HiddenData2.Cells[dMODIFIED_IDX, i] := 'N';
       MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);

       InUpMerit(Pempno);
       Leadership_data;
  end
  else  //업적평가 내용을 저장처리 한다.
  if PageControl1.ActivePage = TabSheet4 then
  begin
       if trim(TDS_Works.FieldByName('PROPELTASK').AsString) = '' then
       begin
            MessageDlg('업무를 등록하지 않았습니다. 업무등록 작업을 먼저하세요!',mtError, [mbOk], 0);
            Exit;
       end;
{
       if not IsDataModified3 then
       begin
            MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.',
                              '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
}
       L_S_Seqno := FloatToStr(LSeqno);
       //자기평가 점수 계산
       v_rscore  := ROUND(((StrToIntDef(SelfScore1.ValueCaption,0) * TDS_Works.FieldByName('DETAILWEIGHT1').AsInteger/100)+
                           (StrToIntDef(SelfScore2.ValueCaption,0) * TDS_Works.FieldByName('DETAILWEIGHT2').AsInteger/100)+
                           (StrToIntDef(SelfScore3.ValueCaption,0) * TDS_Works.FieldByName('DETAILWEIGHT3').AsInteger/100)+
                           (StrToIntDef(SelfScore4.ValueCaption,0) * TDS_Works.FieldByName('DETAILWEIGHT4').AsInteger/100)+
                           (StrToIntDef(SelfScore5.ValueCaption,0) * TDS_Works.FieldByName('DETAILWEIGHT5').AsInteger/100))*10000)/10000;

            if SelfClass1.ValueCaption = var_GrdS then vClass1 := 'S'
       else if SelfClass1.ValueCaption = var_GrdA then vClass1 := 'A'
       else if SelfClass1.ValueCaption = var_GrdB then vClass1 := 'B'
       else if SelfClass1.ValueCaption = var_GrdC then vClass1 := 'C'
       else if SelfClass1.ValueCaption = var_GrdD then vClass1 := 'D'
       else                                            vClass1 := '';

            if SelfClass2.ValueCaption = var_GrdS then vClass2 := 'S'
       else if SelfClass2.ValueCaption = var_GrdA then vClass2 := 'A'
       else if SelfClass2.ValueCaption = var_GrdB then vClass2 := 'B'
       else if SelfClass2.ValueCaption = var_GrdC then vClass2 := 'C'
       else if SelfClass2.ValueCaption = var_GrdD then vClass2 := 'D'
       else                                            vClass2 := '';

            if SelfClass3.ValueCaption = var_GrdS then vClass3 := 'S'
       else if SelfClass3.ValueCaption = var_GrdA then vClass3 := 'A'
       else if SelfClass3.ValueCaption = var_GrdB then vClass3 := 'B'
       else if SelfClass3.ValueCaption = var_GrdC then vClass3 := 'C'
       else if SelfClass3.ValueCaption = var_GrdD then vClass3 := 'D'
       else                                            vClass3 := '';

            if SelfClass4.ValueCaption = var_GrdS then vClass4 := 'S'
       else if SelfClass4.ValueCaption = var_GrdA then vClass4 := 'A'
       else if SelfClass4.ValueCaption = var_GrdB then vClass4 := 'B'
       else if SelfClass4.ValueCaption = var_GrdC then vClass4 := 'C'
       else if SelfClass4.ValueCaption = var_GrdD then vClass4 := 'D'
       else                                            vClass4 := '';

            if SelfClass5.ValueCaption = var_GrdS then vClass5 := 'S'
       else if SelfClass5.ValueCaption = var_GrdA then vClass5 := 'A'
       else if SelfClass5.ValueCaption = var_GrdB then vClass5 := 'B'
       else if SelfClass5.ValueCaption = var_GrdC then vClass5 := 'C'
       else if SelfClass5.ValueCaption = var_GrdD then vClass5 := 'D'
       else                                            vClass5 := '';

       v_s_rscore := FloatToStr(v_rscore);

       Param := VarArrayOf([replace(E_Aim1.Text,'''','`'),
                            replace(E_Aim2.Text,'''','`'),
                            replace(E_Aim3.Text,'''','`'),
                            replace(E_Aim4.Text,'''','`'),
                            replace(E_Aim5.Text,'''','`'),
                            replace(vClass1,'''','`'),
                            replace(vClass2,'''','`'),
                            replace(vClass3,'''','`'),
                            replace(vClass4,'''','`'),
                            replace(vClass5,'''','`'),
                            replace(SelfScore1.ValueCaption,'''','`'),
                            replace(SelfScore2.ValueCaption,'''','`'),
                            replace(SelfScore3.ValueCaption,'''','`'),
                            replace(SelfScore4.ValueCaption,'''','`'),
                            replace(SelfScore5.ValueCaption,'''','`'),
                            copy(replace(ED_empno.ValueCaption,'''','`'),1,4),
                            Lrabasdate,
                            copy(replace(ED_empno.ValueCaption,'''','`'),1,4),
                            replace(L_S_Seqno,'''','`')
                           ]);

       Cupd_SQL := Format('UPDATE pehreaim_DET SET     '+
                          '  result1       = ''%s'',   '+
                          '  result2       = ''%s'',   '+
                          '  result3       = ''%s'',   '+
                          '  result4       = ''%s'',   '+
                          '  result5       = ''%s'',   '+
                          '  detailrclass1 = ''%s'',   '+
                          '  detailrclass2 = ''%s'',   '+
                          '  detailrclass3 = ''%s'',   '+
                          '  detailrclass4 = ''%s'',   '+
                          '  detailrclass5 = ''%s'',   '+
                          '  detailrscore1 = ''%s'',   '+
                          '  detailrscore2 = ''%s'',   '+
                          '  detailrscore3 = ''%s'',   '+
                          '  detailrscore4 = ''%s'',   '+
                          '  detailrscore5 = ''%s'',   '+
                          '  writeemp      = ''%s'',   '+
                          '  writetime     = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),   '+
                          '  rscore        = ''%s''    '+
                          ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%s'' ',
                   [Param[0], Param[1], Param[2], Param[3], Param[4],  Param[5],
                    Param[6], Param[7], Param[8], Param[9], Param[10],
                    Param[11],Param[12],Param[13],Param[14],Param[15], v_s_rscore,
                    // 키부분
                    Param[16],Param[17],Param[18] ]);

       Cupd_Exec;
       TDS_Works.DisableControls;

       Works_Data;

       TDS_Works.Locate('SEQNO',VarArrayof([L_S_Seqno]),[loPartialKey]);
       TDS_Works.EnableControls;

       //자기평가 점수 합계
       Rscore;
       MessageDlg('중점추진업무 ['+trim(TDS_Works.FieldByName('PROPELTASK').AsString)+'] 을 저장하였습니다.',mtinformation,[mbOK],0);
  end
  else  //종합의견 내용을 저장처리 한다.
  begin
       for i := 1 to 5 do
       begin
            FL_Comp := nil;
            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Workload'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vWorkload   := i;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Jobhard'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vjobhard    := i;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Jobsatisfy'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vjobsatisfy := i;
       end;

       if (not RB_MoveEra1.Checked) and (E_Movedept.Text = '') then
       begin
            MessageDlg('이동희망시기를 선택하셨습니다. '+#13+
                       '이동희망사유와 이동희망부서를 선택하시기 바랍니다.', mtInformation, [mbOK], 0);
            Exit;
       end;

       if (RB_MoveCause1.Checked) and (Trim(E_MoveCause.Text) = '') then
       begin
            MessageDlg('이동희망사유를 등록하시기 바랍니다.', mtInformation, [mbOK], 0);
            Exit;
       end;

       if RB_MoveEra3.Checked then vMoveera := 3;
       if RB_MoveEra2.Checked then vMoveera := 2;
       if RB_MoveEra1.Checked then vMoveera := 1;

       if   not RB_MoveEra1.Checked then
       begin
            if RB_MoveCause1.Checked then vMoveCause := E_MoveCause.Text;
            if RB_MoveCause2.Checked then vMoveCause := '가족관계 / 연고지를 고려하여 근무지를 옮기고 싶다.';
            if RB_MoveCause3.Checked then vMoveCause := '부서의 인간관계 / 분위기의 변화를 찾고 싶다.';
            if RB_MoveCause4.Checked then vMoveCause := '다른 직무에서 보다 능력을 발휘할 수 있으리라 생각한다.';
            if RB_MoveCause5.Checked then vMoveCause := '다양한 직무를 경험하고 싶다.';
       end;

       if Pos('(Max 1000Byte)',E_propose.Text) > 0 then E_propose.Text := '';


       SqlText := 'UPDATE petremas '+ //   팀장역량평가MASTER
                  '   SET workload   =  '''+ IntToStr(vWorkload)     +''' ,  '+
                  '       jobhard    =  '''+ IntToStr(vjobhard)      +''' ,  '+
                  '       jobsatisfy =  '''+ IntToStr(vjobsatisfy)   +''' ,  '+
                  '       moveera    =  '''+ IntToStr(vMoveera)      +''' ,  '+
                  '       movecause  =  '''+ vMovecause              +''' ,  '+
                  '	  movedept   =  '''+ E_MoveDept.Hint         +''' ,  '+
                  '       propose    =  '''+ E_propose.Text          +'''    '+
                  ' WHERE rabasdate  =  '''+ Lrabasdate              +'''    '+
                  '   AND empno      =  '''+ Pempno                  +'''    '; // 평가자
       Cupd_SQL := SqlText;
       Cupd_Exec;
       MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
  end;

  //저장끝~!!!
end;

function TFM_Main.IsDataModified01: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount -1 do
       if SG_HiddenData01.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
       begin
            Result := True;
            Break;
       end;
end;

function TFM_Main.IsDataModified1: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
       if SG_HiddenData1.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
       begin
            Result := True;
            Break;
       end;
end;

function TFM_Main.IsDataModified2: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount -1 do
       if SG_HiddenData2.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
       begin
            Result := True;
            Break;
       end;
end;

procedure TFM_Main.SB_S1Click(Sender: TObject);
var
  lsScore: String;
begin
  if Lrvalconyn = 'Y' then
  begin
       MessageBox(handle,'이미 평가가 완료된 자료는 '+
                       '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       Exit;
  end;
  // SG_HiddenData.Tag 에 현재 평가항목의 시작 index가 저장되어 있다
  if SG_HiddenData1.Tag = -1 then
       Exit;

  if not BT_Save1.Visible then
  begin
       MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       System.Exit;
  end;

  //평가점수 계산
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD
  else lsScore := '0';

  if TSpeedButton(Sender).Down = True then
  begin
       SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := lsScore;
       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';

       SG_Score1.Cells[dS_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dA_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dB_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dC_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dD_IDX , SG_Image1.Row] := '';

            if SB_S1.Down then SG_Score1.Cells[dS_IDX , SG_Image1.Row] := var_GrdS
       else if SB_A1.Down then SG_Score1.Cells[dA_IDX , SG_Image1.Row] := var_GrdA
       else if SB_B1.Down then SG_Score1.Cells[dB_IDX,  SG_Image1.Row] := var_GrdB
       else if SB_C1.Down then SG_Score1.Cells[dC_IDX , SG_Image1.Row] := var_GrdC
       else if SB_D1.Down then SG_Score1.Cells[dD_IDX,  SG_Image1.Row] := var_GrdD ;

  end
  else
  begin
       SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := '0';
       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';

       SG_Score1.Cells[dS_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dA_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dB_IDX,  SG_Image1.Row] := '';
       SG_Score1.Cells[dC_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dD_IDX,  SG_Image1.Row] := '';
  end;

  // 점수등록현황
  ShowSum1;
end;

procedure TFM_Main.Cupd_Exec;
var
  sql :string;
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

procedure TFM_Main.Bt_Add1Click(Sender: TObject);
begin
  //이의신청등록
end;

procedure TFM_Main.Bt_OConfirm1Click(Sender: TObject);
begin
   //이의신청완료
end;

procedure TFM_Main.BitBtn1Click(Sender: TObject);
begin
   //업적평가표출력
end;

procedure TFM_Main.SB_S2Click(Sender: TObject);
var
  lsScore: String;
begin
  if Lrvalconyn = 'Y' then
  begin
       MessageBox(handle,'이미 평가가 완료된 자료는 '+
                         '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       Exit;
  end;

  if SG_HiddenData2.Tag = -1 then
       Exit;

  if not BT_Save1.Visible then
  begin
       MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       System.Exit;
  end;

  //평가점수 계산
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD
  else lsScore := '0';

  if TSpeedButton(Sender).Down = True then
  begin
       SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := lsScore;
       SG_HiddenData2.Cells[dMODIFIED_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := 'Y';

       SG_Score2.Cells[dS_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dA_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dB_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dC_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dD_IDX , SG_Image2.Row] := '';

            if SB_S2.Down then SG_Score2.Cells[dS_IDX , SG_Image2.Row] := var_GrdS
       else if SB_A2.Down then SG_Score2.Cells[dA_IDX , SG_Image2.Row] := var_GrdA
       else if SB_B2.Down then SG_Score2.Cells[dB_IDX,  SG_Image2.Row] := var_GrdB
       else if SB_C2.Down then SG_Score2.Cells[dC_IDX , SG_Image2.Row] := var_GrdC
       else if SB_D2.Down then SG_Score2.Cells[dD_IDX,  SG_Image2.Row] := var_GrdD;
  end
  else
  begin
       SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := '0';
       SG_HiddenData2.Cells[dMODIFIED_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := 'Y';

       SG_Score2.Cells[dS_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dA_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dB_IDX,  SG_Image2.Row] := '';
       SG_Score2.Cells[dC_IDX , SG_Image2.Row] := '';
       SG_Score2.Cells[dD_IDX,  SG_Image2.Row] := '';
  end;
  // 점수등록현황
  ShowSum2;
end;

function TFM_Main.FL_CheckNullEval:Boolean; // 하나라도 평가안한 항목이 있는지를 체크
begin
  with DBcommon do
  begin
       SQL.Clear;
       SQL.Text := format('select count(*) cnt from pehreaim_Det                      '+
                          ' where((detailtask1 is not null and detailrclass1 is null) '+
                          '    or (detailtask2 is not null and detailrclass2 is null) '+
                          '    or (detailtask3 is not null and detailrclass3 is null) '+
                          '    or (detailtask4 is not null and detailrclass4 is null) '+
                          '    or (detailtask5 is not null and detailrclass5 is null))'+
                          '   and empno =''%s''                                       '+
                          '   and rabasdate =''%s''                                   ',
                          [Pempno, Lrabasdate]);
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 100);
       Open;
       if FieldByName('SEL_DATA').AsInteger >  0 then
            Result := False
       else
            Result := True;
  end;
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SqlText : string;
  isum_val,isum_com: Double;
begin
  if (Bt_Save1.Visible) and (IsDataModified01 or IsDataModified1 or IsDataModified2 or IsDataModified3 ) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
                  '작업순서오류',MB_ICONWARNING);
       if  var_Ekind = 'Values' then
           PageControl1.ActivePage := TabSheet1
       else if  var_Ekind = '공통역량' then
           PageControl1.ActivePage := TabSheet2
       else if  var_Ekind = '리더십역량' then
           PageControl1.ActivePage := TabSheet3
       else if  var_Ekind = '업적' then
           PageControl1.ActivePage := TabSheet4
       else if  var_Ekind = '종합의견ⓐ' then
           PageControl1.ActivePage := TabSheet6;

       System.Exit;
  end;

  SqlText := 'SELECT count(0) cnt                                          '+
             '  FROM petac a, petds b ' +//, petac c                            '+
             ' WHERE a.rabasdate = '''+Lrabasdate+'''                      '+
             '   AND a.evcno     = 1                                       '+
             '   AND a.ekind    in (''Values'')                            '+
             //'   AND a.rabasdate = c.rabasdate                             '+
             //'   AND a.evcno     = c.evcno                                 '+
             //'   AND a.ekind     = c.ekind                                 '+
             //'   AND a.itemno    = c.itemno                                '+
             '   AND a.rabasdate = b.rabasdate(+)                          '+
             '   AND a.ekind     = b.ekind(+)                              '+
             '   AND b.empno(+)  = '''+Pempno+'''                          '+
  	      '   and nvl(b.score,0) = 0                                    '+
             '   AND a.itemno    = b.itemno(+)                             '+
             //'   AND a.imageno   = b.imageno(+)                            '+
             ' ORDER BY a.itemno '; //, a.imageno                                ';
  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
       if RecordCount > 0 then
       begin
            if trim(FieldByName('SEL_DATA').AsString) > '0' then
            begin
                 showmessage('팀장 자기평가 최종완료를 할 수 없습니다.'+#13+ #13+
                             'Values 평가에 대한 평가가 저장처리 되었는지 확인하시기 바랍니다.');
                 close;
                 PageControl1.ActivePage := TabSheet1;
                 exit;
            end;
       end
       else
       begin
            showmessage('Values 평가 등록여부 체크중 오류가 발생했습니다.');
            exit;
       end;
  end;

  if not FL_CheckNullEval then
  begin
       MessageDlg('업적평가에 평가하지 않은 항목이 있습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       PageControl1.ActivePage := TabSheet4;
       System.Exit;
  end;

  if (trim(SelfClass6.ValueCaption) = '') or (trim(SelfClass6.ValueCaption) = '0') then
  begin
       MessageDlg('과정지표를 평가하지 않았습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       PageControl1.ActivePage := TabSheet4;
       System.Exit;
  end;


  SqlText := 'SELECT count(0) cnt                                '+
             '  FROM petac a, petds b                            '+
             ' WHERE a.rabasdate = '''+Lrabasdate+'''            '+
             '   AND a.evcno     = 1                             '+
             '   AND a.ekind    in (''공통역량'')                '+
             '   AND a.rabasdate = b.rabasdate(+)                '+
             '   AND a.ekind     = b.ekind(+)                    '+
             '   AND b.empno(+)  = '''+Pempno+'''                '+
  	      '   and nvl(b.score,0) = 0                          '+
             '   AND a.itemno    = b.itemno(+)                   '+
             ' ORDER BY a.itemno                                 ';
  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
       if RecordCount > 0 then
       begin
            if trim(FieldByName('SEL_DATA').AsString) > '0' then
            begin
                 showmessage('팀장 자기평가 최종완료를 할 수 없습니다.'+#13+ #13+
                             '공통역량에 대한 평가가 저장처리 되었는지 확인하시기 바랍니다.');
                 close;
                 PageControl1.ActivePage := TabSheet2;
                 exit;
            end;
       end
       else
       begin
            showmessage('공통역량 등록여부 체크중 오류가 발생했습니다.');
            exit;
       end;
  end;


  SqlText := 'SELECT count(0) cnt                                '+
             '  FROM petac a, petds b                            '+
             ' WHERE a.rabasdate = '''+Lrabasdate+'''            '+
             '   AND a.evcno     = 1                             '+
             '   AND a.ekind    in (''리더십역량'')              '+
             '   AND a.rabasdate = b.rabasdate(+)                '+
             '   AND a.ekind     = b.ekind(+)                    '+
             '   AND b.empno(+)  = '''+Pempno+'''                '+
  	      '   and nvl(b.score,0) = 0                          '+
             '   AND a.itemno    = b.itemno(+)                   '+
             ' ORDER BY a.itemno                                 ';
  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
       if RecordCount > 0 then
       begin
            if trim(FieldByName('SEL_DATA').AsString) > '0' then
            begin
                 showmessage('팀장 자기평가 최종완료를 할 수 없습니다.'+#13+ #13+
                             '리더십역량에 대한 평가가 저장처리 되었는지 확인하시기 바랍니다.');
                 close;
                 PageControl1.ActivePage := TabSheet3;
                 exit;
            end;
       end
       else
       begin
            showmessage('리더십역량 등록여부 체크중 오류가 발생했습니다.');
            exit;
       end;
  end;

  //점수계산한다.
  //계산된 점수는 자기평가점수로 환산처리한다.
  //RVSCORE Values 자기평가점수
//  isum_val := StrToFloat(L_score01.Caption);
  //isum_val := isum_val + StrToFloat(L_score02.Caption);
  //isum_val := (Round(isum_val/2*10000)/10000);
  //RESCORE 역량 자기평가점수
//  isum_com := StrToFloat(L_score1.Caption);
//  isum_com := isum_com + StrToFloat(L_score2.Caption);
//  iSum_com := (Round(isum_com/2*10000)/10000);

  if Not (FL_CheckNullMERIT) then  Exit;

  if MessageBox(handle,PChar('[최종완료]를 하시면 등록하신 점수에 대해 수정하실 수 없습니다.'+#13+#13+
                             '[최종완료]를 하시겠습니까?'), '확 인',
                MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       System.exit;
  end;

   //피평가자 평가완료 여부 'Y'로 update
   SqlText := 'update  pehremas                                                         '+
              '   set  rvalconyn   = ''Y''                                              '+
              '       ,RVALCONDATE = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8) '+
              '       ,e1valobjyn  = ''N''                                              '+
              '       ,e2valobjyn  = ''N''                                              '+
              ' WHERE  rabasdate   = '''+Lrabasdate+'''                                 '+
              '   AND  empno       = '''+Pempno+'''                                     ';

  with TMaxDML_HInsa do
  begin
       //ServiceName := 'PED1010A_dml';
       ServiceName := 'PEA1060A_dml';
       Close;
       Sql.Clear;
       SQL.Text := SqlText;
       if not Execute then
       begin
            MessageDlg('[자기평가 최종완료]처리중 오류가 발생했습니다.'+#13+#13+
                       'HR팀으로 문의하시기 바랍니다.1', mtInformation, [mbOK], 0);
            exit;
       end;
  end;

   //피평가자 평가완료 여부 'Y'로 update
   SqlText := 'update  petremas                                                         '+
              '   set  rvalconyn   =''Y''                                               '+
              '       ,RESCORE     = '+ FloatToStr(isum_com)                             +
              '       ,RVSCORE     = '+ FloatToStr(isum_val)                             +
              '       ,RVALCONDATE = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8) '+
              '       ,e1valobjyn  = ''N''                                              '+
              '       ,e2valobjyn  = ''N''                                              '+
              ' WHERE  rabasdate   = '''+Lrabasdate+'''                                 '+
              '   AND  empno       = '''+Pempno+'''                                     ';

  with TMaxDML_HInsa do
  begin
       //ServiceName := 'PED1010A_dml';
       ServiceName := 'PEA1060A_dml';
       Close;
       Sql.Clear;
       SQL.Text := SqlText;
       if Execute then
       begin
            Bt_Confirm.Visible := false;
            BT_Save1.Visible   := false;
            BT_Cancel1.Visible := false;
            MessageDlg('[자기평가 최종완료]처리 되었습니다.', mtInformation, [mbOK], 0);
       end
       else
       begin
            MessageDlg('[자기평가 최종완료]처리중 오류가 발생했습니다.'+#13+#13+
                       'HR팀으로 문의하시기 바랍니다.2', mtInformation, [mbOK], 0);
            exit;
       end;
  end;
end;

procedure TFM_Main.SG_Score2Enter(Sender: TObject);
begin
  SG_Image2.SetFocus;
end;

procedure TFM_Main.SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  liLeft   : Integer;
  liTop    : Integer;
  lsBuffer : String;
  i        : integer;
  bColor   : Boolean;
begin
  bColor := False;
  for i := 0 to SG_Score2.ColCount -1 do
       if SG_Score2.Cells[i, ARow] <> '' then
       begin
            bColor := True;
            break;
       end;
  if bColor then
       SG_Score2.Canvas.Brush.Color := $00FFF9EC //SG_Score.Font.Color;
  else
       SG_Score2.Canvas.Brush.Color := SG_Image2.Color; ///$00F0FFFF;

  if CB_ShowClass2.Checked then // 등급을 보이게...
       SG_Score2.Canvas.Font.Color := SG_Image2.Font.Color
  else
       SG_Score2.Canvas.Font.Color := SG_Score2.Font.Color;

  SG_Score2.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score2.Cells[ACol, ARow];
  liLeft   := (((Rect.Right - Rect.Left)
            - SG_Score2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop    := (((Rect.Bottom - Rect.Top)
            - SG_Score2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score2.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Main.CB_ShowClass2Click(Sender: TObject);
begin
  SG_Score2.Refresh;
end;

procedure TFM_Main.CB_ShowClass1Click(Sender: TObject);
begin
  SG_Score1.Refresh;
end;

procedure TFM_Main.SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_Image01.Canvas.Brush.Color := $00FFE8D0;
       SG_Image01.Canvas.Font.Color  := clBlack;
  end;

  SG_Image01.Canvas.FillRect(Rect);

  SG_Image01.ColWidths[mITEMNAME_IDX]  := 90;

  if SG_Image01.VisibleRowCount < SG_Image01.RowCount then
       SG_Image01.ColWidths[mITEMDESC_IDX] := SG_Image01.Width -  SG_Image01.ColWidths[mITEMNAME_IDX] - 16
  else
       SG_Image01.ColWidths[mITEMDESC_IDX] := SG_Image01.Width -  SG_Image01.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top   + 22;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image01.RowCount > (SG_Image01.VisibleRowCount+SG_Image01.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image01.Cells[ACol, ARow];
  DrawText(SG_Image01.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_CENTER or DT_WORDBREAK );
  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData01.Tag = -1 then
       System.Exit;
  if not SG_Image01.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
       System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image01.Row < SG_Image01.TopRow then // 현재 row 가 화면위에 있다
       SG_Image01.Row := SG_Image01.TopRow
  else
  if SG_Image01.Row > (SG_Image01.TopRow + SG_Image01.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_Image01.Row := SG_Image01.TopRow + SG_Image01.VisibleRowCount-1;

  SG_Score01.TopRow := SG_Image01.TopRow;
  SG_Score01.Row    := SG_Image01.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton01.Top := (SG_Image01.Row - SG_Image01.TopRow) *
                           (SG_Image01.DefaultRowHeight + SG_Image01.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S01.Down   := False;
  SB_A01.Down   := False;
  SB_B01.Down   := False;
  SB_C01.Down   := False;
  SB_D01.Down   := False;


  //버튼상태반영
       if SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrS  then  SB_S01.Down  := True
  else if SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrA  then  SB_A01.Down  := True
  else if SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrB  then  SB_B01.Down  := True
  else if SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrC  then  SB_C01.Down  := True
  else if SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrD  then  SB_D01.Down  := True;

  P_ControlButton01.Visible := True;

  SG_Image01Click(Sender);
end;

procedure TFM_Main.SG_Score01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  liLeft   : Integer;
  liTop    : Integer;
  lsBuffer : String;
  i        : integer;
  bColor   : Boolean;
begin
  bColor := False;
  for i := 0 to SG_Score01.ColCount -1 do
       if SG_Score01.Cells[i, ARow] <> '' then
       begin
            bColor := True;
            break;
       end;
  if bColor then
       SG_Score01.Canvas.Brush.Color := $00FFE8D0//$00FFF9EC //SG_Score.Font.Color;
  else
       SG_Score01.Canvas.Brush.Color := SG_Image01.Color; ///$00F0FFFF;

  if CB_ShowClass01.Checked then // 등급을 보이게...
       SG_Score01.Canvas.Font.Color := SG_Image01.Font.Color
  else
       SG_Score01.Canvas.Font.Color := SG_Score01.Font.Color;

  SG_Score01.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score01.Cells[ACol, ARow];
  liLeft   := (((Rect.Right - Rect.Left)
            - SG_Score01.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop    := (((Rect.Bottom - Rect.Top)
            - SG_Score01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score01.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Main.SG_Score01Enter(Sender: TObject);
begin
  SG_Image01.SetFocus;
end;

procedure TFM_Main.SB_S01Click(Sender: TObject);
var
  lsScore: String;
begin
  // SG_HiddenData.Tag 에 현재 평가항목의 시작 index가 저장되어 있다
  if SG_HiddenData01.Tag = -1 then
       Exit;

  if not BT_Save1.Visible then
  begin
       MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       System.Exit;
  end;

  //평가점수 계산
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD
  else lsScore := '0';

  if TSpeedButton(Sender).Down = True then
  begin
       SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := lsScore;
       SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';

       SG_Score01.Cells[dS_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dA_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dB_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dC_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dD_IDX , SG_Image01.Row] := '';

            if SB_S01.Down then SG_Score01.Cells[dS_IDX , SG_Image01.Row] := var_GrdS
       else if SB_A01.Down then SG_Score01.Cells[dA_IDX , SG_Image01.Row] := var_GrdA
       else if SB_B01.Down then SG_Score01.Cells[dB_IDX , SG_Image01.Row] := var_GrdB
       else if SB_C01.Down then SG_Score01.Cells[dC_IDX , SG_Image01.Row] := var_GrdC
       else if SB_D01.Down then SG_Score01.Cells[dD_IDX , SG_Image01.Row] := var_GrdD ;

  end
  else
  begin
       SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := '0';
       SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';

       SG_Score01.Cells[dS_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dA_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dB_IDX,  SG_Image01.Row] := '';
       SG_Score01.Cells[dC_IDX , SG_Image01.Row] := '';
       SG_Score01.Cells[dD_IDX,  SG_Image01.Row] := '';
  end;

  // 점수등록현황
  ShowSum01;
end;

procedure TFM_Main.E_MoveDeptInitPopup(Sender: TObject);
begin
  DeptForm.TDS.Session  := TMaxSession;
  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_Find.Text  := E_MoveDept.Text;
  DeptForm.E_FindButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.E_MoveDeptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
       E_MoveDept.Text := DeptForm.GSdeptname;
       E_MoveDept.Hint := DeptForm.GSdeptcode;
  end;
end;

procedure TFM_Main.RB_MoveEra1Click(Sender: TObject);
begin
  E_MoveCause.Text      := '';
  E_MoveDept.Text       := '';
  E_MoveCause.Enabled   := False;
  E_MoveDept.Enabled    := False;
  RB_MoveCause1.Enabled := False;
  RB_MoveCause2.Enabled := False;
  RB_MoveCause3.Enabled := False;
  RB_MoveCause4.Enabled := False;
  RB_MoveCause5.Enabled := False;
  RB_MoveCause1.Checked := False;
  RB_MoveCause2.Checked := False;
  RB_MoveCause3.Checked := False;
  RB_MoveCause4.Checked := False;
  RB_MoveCause5.Checked := False;
end;

procedure TFM_Main.E_ProposeClick(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',E_Propose.Text) > 0 then E_Propose.Text := '';
  E_Propose.Font.Color := clBlack;
end;

function TFM_Main.IsDataModified3: Boolean;
var
  i: Integer;
begin
  Result := False;

  if (E_Aim1.Text <> sAim1) or
     (E_Aim2.Text <> sAim2) or
     (E_Aim3.Text <> sAim3) or
     (E_Aim4.Text <> sAim4) or
     (E_Aim5.Text <> sAim5) then
       Result := True;
end;

procedure TFM_Main.CB_ShowClass01Click(Sender: TObject);
begin
  SG_Score01.Refresh;
end;

procedure TFM_Main.BT_Cancel1Click(Sender: TObject);
begin

  if PageControl1.ActivePage = tabsheet1 then
       values_data1
  else
  if PageControl1.ActivePage = tabsheet2 then
       common_data
  else
  if PageControl1.ActivePage = tabsheet3 then
       Leadership_data
  else
  if PageControl1.ActivePage = tabsheet4 then
  begin
       works_data;
       E_Aim1.Text := sAim1;
       E_Aim2.Text := sAim2;
       E_Aim3.Text := sAim3;
       E_Aim4.Text := sAim4;
       E_Aim5.Text := sAim5;
  end
  else
  begin
       Opinion_data;
  end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  with TDS_Works do
  begin
       ResetAllButton;

       SelfClass1.ValueCaption := '';
       SelfClass2.ValueCaption := '';
       SelfClass3.ValueCaption := '';
       SelfClass4.ValueCaption := '';
       SelfClass5.ValueCaption := '';

       SelfScore1.ValueCaption := '';
       SelfScore2.ValueCaption := '';
       SelfScore3.ValueCaption := '';
       SelfScore4.ValueCaption := '';
       SelfScore5.ValueCaption := '';

       LSeqno := FieldByName('seqno').AsFloat;

       SaveTask := GetBookmark;

       sAim1       := FieldByName('RESULT1').AsString;
       sAim2       := FieldByName('RESULT2').AsString;
       sAim3       := FieldByName('RESULT3').AsString;
       sAim4       := FieldByName('RESULT4').AsString;
       sAim5       := FieldByName('RESULT5').AsString;

       // 달성 실적
       E_Aim1.Text := FieldByName('RESULT1').AsString;
       E_Aim2.Text := FieldByName('RESULT2').AsString;
       E_Aim3.Text := FieldByName('RESULT3').AsString;
       E_Aim4.Text := FieldByName('RESULT4').AsString;
       E_Aim5.Text := FieldByName('RESULT5').AsString;

       // 자기 세부 점수
       if FieldByName('DETAILRSCORE1').AsString <> '0' then SelfScore1.ValueCaption := FieldByName('DETAILRSCORE1').AsString;
       if FieldByName('DETAILRSCORE2').AsString <> '0' then SelfScore2.ValueCaption := FieldByName('DETAILRSCORE2').AsString;
       if FieldByName('DETAILRSCORE3').AsString <> '0' then SelfScore3.ValueCaption := FieldByName('DETAILRSCORE3').AsString;
       if FieldByName('DETAILRSCORE4').AsString <> '0' then SelfScore4.ValueCaption := FieldByName('DETAILRSCORE4').AsString;
       if FieldByName('DETAILRSCORE5').AsString <> '0' then SelfScore5.ValueCaption := FieldByName('DETAILRSCORE5').AsString;

       // 자기 세부 등급
{
       SelfClass1.ValueCaption := FieldByName('DETAILRCLASS1').AsString;
       SelfClass2.ValueCaption := FieldByName('DETAILRCLASS2').AsString;
       SelfClass3.ValueCaption := FieldByName('DETAILRCLASS3').AsString;
       SelfClass4.ValueCaption := FieldByName('DETAILRCLASS4').AsString;
       SelfClass5.ValueCaption := FieldByName('DETAILRCLASS5').AsString;
}
            if   FieldByName('DETAILRCLASS1').AsString =  'S' then   SelfClass1.ValueCaption := var_GrdS
       else if   FieldByName('DETAILRCLASS1').AsString =  'A' then   SelfClass1.ValueCaption := var_GrdA
       else if   FieldByName('DETAILRCLASS1').AsString =  'B' then   SelfClass1.ValueCaption := var_GrdB
       else if   FieldByName('DETAILRCLASS1').AsString =  'C' then   SelfClass1.ValueCaption := var_GrdC
       else if   FieldByName('DETAILRCLASS1').AsString =  'D' then   SelfClass1.ValueCaption := var_GrdD
       else                                                          SelfClass1.ValueCaption := '';

            if   FieldByName('DETAILRCLASS2').AsString =  'S' then   SelfClass2.ValueCaption := var_GrdS
       else if   FieldByName('DETAILRCLASS2').AsString =  'A' then   SelfClass2.ValueCaption := var_GrdA
       else if   FieldByName('DETAILRCLASS2').AsString =  'B' then   SelfClass2.ValueCaption := var_GrdB
       else if   FieldByName('DETAILRCLASS2').AsString =  'C' then   SelfClass2.ValueCaption := var_GrdC
       else if   FieldByName('DETAILRCLASS2').AsString =  'D' then   SelfClass2.ValueCaption := var_GrdD
       else                                                          SelfClass2.ValueCaption := '';

            if   FieldByName('DETAILRCLASS3').AsString =  'S' then   SelfClass3.ValueCaption := var_GrdS
       else if   FieldByName('DETAILRCLASS3').AsString =  'A' then   SelfClass3.ValueCaption := var_GrdA
       else if   FieldByName('DETAILRCLASS3').AsString =  'B' then   SelfClass3.ValueCaption := var_GrdB
       else if   FieldByName('DETAILRCLASS3').AsString =  'C' then   SelfClass3.ValueCaption := var_GrdC
       else if   FieldByName('DETAILRCLASS3').AsString =  'D' then   SelfClass3.ValueCaption := var_GrdD
       else                                                          SelfClass3.ValueCaption := '';

            if   FieldByName('DETAILRCLASS4').AsString =  'S' then   SelfClass4.ValueCaption := var_GrdS
       else if   FieldByName('DETAILRCLASS4').AsString =  'A' then   SelfClass4.ValueCaption := var_GrdA
       else if   FieldByName('DETAILRCLASS4').AsString =  'B' then   SelfClass4.ValueCaption := var_GrdB
       else if   FieldByName('DETAILRCLASS4').AsString =  'C' then   SelfClass4.ValueCaption := var_GrdC
       else if   FieldByName('DETAILRCLASS4').AsString =  'D' then   SelfClass4.ValueCaption := var_GrdD
       else                                                          SelfClass4.ValueCaption := '';

            if   FieldByName('DETAILRCLASS5').AsString =  'S' then   SelfClass5.ValueCaption := var_GrdS
       else if   FieldByName('DETAILRCLASS5').AsString =  'A' then   SelfClass5.ValueCaption := var_GrdA
       else if   FieldByName('DETAILRCLASS5').AsString =  'B' then   SelfClass5.ValueCaption := var_GrdB
       else if   FieldByName('DETAILRCLASS5').AsString =  'C' then   SelfClass5.ValueCaption := var_GrdC
       else if   FieldByName('DETAILRCLASS5').AsString =  'D' then   SelfClass5.ValueCaption := var_GrdD
       else                                                          SelfClass5.ValueCaption := '';

{       // 하향 세부 점수
       if FieldByName('DETAILESCORE1').AsString <> '0' then DownScore1.ValueCaption := FieldByName('DETAILESCORE1').AsString;
       if FieldByName('DETAILESCORE2').AsString <> '0' then DownScore2.ValueCaption := FieldByName('DETAILESCORE2').AsString;
       if FieldByName('DETAILESCORE3').AsString <> '0' then DownScore3.ValueCaption := FieldByName('DETAILESCORE3').AsString;
       if FieldByName('DETAILESCORE4').AsString <> '0' then DownScore4.ValueCaption := FieldByName('DETAILESCORE4').AsString;
       if FieldByName('DETAILESCORE5').AsString <> '0' then DownScore5.ValueCaption := FieldByName('DETAILESCORE5').AsString;}

       //하향 세부 등급 : 평가 최종 완료시까지 개인사원들에게 보이면 절대 안됨. dsa2000
       //DownClass1.Caption := FieldByName('DETAILECLASS1').AsString;
       //DownClass2.Caption := FieldByName('DETAILECLASS2').AsString;
       //DownClass3.Caption := FieldByName('DETAILECLASS3').AsString;
       //DownClass4.Caption := FieldByName('DETAILECLASS4').AsString;
       //DownClass5.Caption := FieldByName('DETAILECLASS5').AsString;

       if  FieldByName('DETAILRCLASS1').AsString <> '' then
       begin
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS1').AsString+'1')).BtnDown    := True;
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS1').AsString+'1')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILRCLASS2').AsString <> '' then
       begin
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS2').AsString+'2')).BtnDown := True;
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS2').AsString+'2')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILRCLASS3').AsString <> '' then
       begin
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS3').AsString+'3')).BtnDown := True;
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS3').AsString+'3')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILRCLASS4').AsString <> '' then
       begin
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS4').AsString+'4')).BtnDown := True;
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS4').AsString+'4')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILRCLASS5').AsString <> '' then
       begin
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS5').AsString+'5')).BtnDown := True;
            TOnSkinButton(Self.FindComponent('SW_'+FieldByName('DETAILRCLASS5').AsString+'5')).Font.Color := clWhite;
       end;

       L_DetailTask1.ValueCaption := FieldByName('detailtask1').AsString;
       L_DetailTask2.ValueCaption := FieldByName('detailtask2').AsString;
       L_DetailTask3.ValueCaption := FieldByName('detailtask3').AsString;
       L_DetailTask4.ValueCaption := FieldByName('detailtask4').AsString;
       L_DetailTask5.ValueCaption := FieldByName('detailtask5').AsString;

       L_detailweight1.ValueCaption := FieldByName('detailweight1').AsString+'%';
       L_detailweight2.ValueCaption := FieldByName('detailweight2').AsString+'%';
       L_detailweight3.ValueCaption := FieldByName('detailweight3').AsString+'%';
       L_detailweight4.ValueCaption := FieldByName('detailweight4').AsString+'%';
       L_detailweight5.ValueCaption := FieldByName('detailweight5').AsString+'%';

       L_validx1.ValueCaption := FieldByName('validx1').AsString;
       L_validx2.ValueCaption := FieldByName('validx2').AsString;
       L_validx3.ValueCaption := FieldByName('validx3').AsString;
       L_validx4.ValueCaption := FieldByName('validx4').AsString;
       L_validx5.ValueCaption := FieldByName('validx5').AsString;

       L_bresultclass1.ValueCaption := FieldByName('bresultclass1').AsString;
       L_bresultclass2.ValueCaption := FieldByName('bresultclass2').AsString;
       L_bresultclass3.ValueCaption := FieldByName('bresultclass3').AsString;
       L_bresultclass4.ValueCaption := FieldByName('bresultclass4').AsString;
       L_bresultclass5.ValueCaption := FieldByName('bresultclass5').AsString;

       L_valfunction1.ValueCaption := FieldByName('valfunction1').AsString;
       L_valfunction2.ValueCaption := FieldByName('valfunction2').AsString;
       L_valfunction3.ValueCaption := FieldByName('valfunction3').AsString;
       L_valfunction4.ValueCaption := FieldByName('valfunction4').AsString;
       L_valfunction5.ValueCaption := FieldByName('valfunction5').AsString;


       L_DetailTask1.Hint := FieldByName('detailtask1').AsString;
       L_DetailTask2.Hint := FieldByName('detailtask2').AsString;
       L_DetailTask3.Hint := FieldByName('detailtask3').AsString;
       L_DetailTask4.Hint := FieldByName('detailtask4').AsString;
       L_DetailTask5.Hint := FieldByName('detailtask5').AsString;

       L_validx1.Hint := FieldByName('validx1').AsString;
       L_validx2.Hint := FieldByName('validx2').AsString;
       L_validx3.Hint := FieldByName('validx3').AsString;
       L_validx4.Hint := FieldByName('validx4').AsString;
       L_validx5.Hint := FieldByName('validx5').AsString;

       L_bresultclass1.Hint := FieldByName('bresultclass1').AsString;
       L_bresultclass2.Hint := FieldByName('bresultclass2').AsString;
       L_bresultclass3.Hint := FieldByName('bresultclass3').AsString;
       L_bresultclass4.Hint := FieldByName('bresultclass4').AsString;
       L_bresultclass5.Hint := FieldByName('bresultclass5').AsString;

       L_valfunction1.Hint := FieldByName('valfunction1').AsString;
       L_valfunction2.Hint := FieldByName('valfunction2').AsString;
       L_valfunction3.Hint := FieldByName('valfunction3').AsString;
       L_valfunction4.Hint := FieldByName('valfunction4').AsString;
       L_valfunction5.Hint := FieldByName('valfunction5').AsString;

       SW_S1.Caption := Copy(FieldByName('sresultclass1').AsString,1,20);
       SW_A1.Caption := Copy(FieldByName('aresultclass1').AsString,1,20);
       SW_B1.Caption := Copy(FieldByName('bresultclass1').AsString,1,20);
       SW_C1.Caption := Copy(FieldByName('cresultclass1').AsString,1,20);
       SW_D1.Caption := Copy(FieldByName('dresultclass1').AsString,1,20);
       SW_S2.Caption := Copy(FieldByName('sresultclass2').AsString,1,20);
       SW_A2.Caption := Copy(FieldByName('aresultclass2').AsString,1,20);
       SW_B2.Caption := Copy(FieldByName('bresultclass2').AsString,1,20);
       SW_C2.Caption := Copy(FieldByName('cresultclass2').AsString,1,20);
       SW_D2.Caption := Copy(FieldByName('dresultclass2').AsString,1,20);
       SW_S3.Caption := Copy(FieldByName('sresultclass3').AsString,1,20);
       SW_A3.Caption := Copy(FieldByName('aresultclass3').AsString,1,20);
       SW_B3.Caption := Copy(FieldByName('bresultclass3').AsString,1,20);
       SW_C3.Caption := Copy(FieldByName('cresultclass3').AsString,1,20);
       SW_D3.Caption := Copy(FieldByName('dresultclass3').AsString,1,20);
       SW_S4.Caption := Copy(FieldByName('sresultclass4').AsString,1,20);
       SW_A4.Caption := Copy(FieldByName('aresultclass4').AsString,1,20);
       SW_B4.Caption := Copy(FieldByName('bresultclass4').AsString,1,20);
       SW_C4.Caption := Copy(FieldByName('cresultclass4').AsString,1,20);
       SW_D4.Caption := Copy(FieldByName('dresultclass4').AsString,1,20);
       SW_S5.Caption := Copy(FieldByName('sresultclass5').AsString,1,20);
       SW_A5.Caption := Copy(FieldByName('aresultclass5').AsString,1,20);
       SW_B5.Caption := Copy(FieldByName('bresultclass5').AsString,1,20);
       SW_C5.Caption := Copy(FieldByName('cresultclass5').AsString,1,20);
       SW_D5.Caption := Copy(FieldByName('dresultclass5').AsString,1,20);

       SW_S1.Hint := FieldByName('sresultclass1').AsString;
       SW_A1.Hint := FieldByName('aresultclass1').AsString;
       SW_B1.Hint := FieldByName('bresultclass1').AsString;
       SW_C1.Hint := FieldByName('cresultclass1').AsString;
       SW_D1.Hint := FieldByName('dresultclass1').AsString;
       SW_S2.Hint := FieldByName('sresultclass2').AsString;
       SW_A2.Hint := FieldByName('aresultclass2').AsString;
       SW_B2.Hint := FieldByName('bresultclass2').AsString;
       SW_C2.Hint := FieldByName('cresultclass2').AsString;
       SW_D2.Hint := FieldByName('dresultclass2').AsString;
       SW_S3.Hint := FieldByName('sresultclass3').AsString;
       SW_A3.Hint := FieldByName('aresultclass3').AsString;
       SW_B3.Hint := FieldByName('bresultclass3').AsString;
       SW_C3.Hint := FieldByName('cresultclass3').AsString;
       SW_D3.Hint := FieldByName('dresultclass3').AsString;
       SW_S4.Hint := FieldByName('sresultclass4').AsString;
       SW_A4.Hint := FieldByName('aresultclass4').AsString;
       SW_B4.Hint := FieldByName('bresultclass4').AsString;
       SW_C4.Hint := FieldByName('cresultclass4').AsString;
       SW_D4.Hint := FieldByName('dresultclass4').AsString;
       SW_S5.Hint := FieldByName('sresultclass5').AsString;
       SW_A5.Hint := FieldByName('aresultclass5').AsString;
       SW_B5.Hint := FieldByName('bresultclass5').AsString;
       SW_C5.Hint := FieldByName('cresultclass5').AsString;
       SW_D5.Hint := FieldByName('dresultclass5').AsString;

       if FieldByName('detailtask1').AsString = '' then
       begin
            pnl_1.Visible := False;
       end
       else
       begin
            pnl_1.Visible := True;
            DetailCnt     := 1;
       end;
       if FieldByName('detailtask2').AsString = '' then
       begin
            pnl_2.Visible := False;
       end
       else
       begin
            pnl_2.Visible := True;
            DetailCnt     := 2;
       end;
       if FieldByName('detailtask3').AsString = '' then
       begin
            pnl_3.Visible := False;
       end
       else
       begin
            pnl_3.Visible := True;
            DetailCnt     := 3;
       end;
       if FieldByName('detailtask4').AsString = '' then
       begin
            pnl_4.Visible := False;
       end
       else
       begin
            pnl_4.Visible := True;
            DetailCnt     := 4;
       end;
       if FieldByName('detailtask5').AsString = '' then
       begin
            pnl_5.Visible := False;
       end
       else
       begin
            pnl_5.Visible := True;
            DetailCnt     := 5;
       end;
  end;
end;

procedure TFM_Main.SG_Image1Click(Sender: TObject);
var
  sqltext : string;
  i : integer;
begin
   SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petds b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+Lrabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
           //     ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''공통역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData1.Cells[0, SG_Image1.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
           //     ' AND a.paycl     = c.paycl' + // BAND
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+Pempno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;
  i := 1;
  while not TMaxDataSet_HInsa.EOF do
  begin
       TOnMemo(Self.FindComponent('M_image1'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

       i := i + 1;
       TMaxDataSet_HInsa.Next;
  end;
  TMaxDataSet_HInsa.Close;
end;

procedure TFM_Main.SG_Image2Click(Sender: TObject);
var
  sqltext : string;
  i : integer;
begin
  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petds b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+Lrabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
           //     ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData2.Cells[0, SG_Image2.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
           //     ' AND a.paycl     = c.paycl' + // BAND
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+Pempno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;
  i := 1;
  while not TMaxDataSet_HInsa.EOF do
  begin
       TOnMemo(Self.FindComponent('M_image2'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

       i := i + 1;
       TMaxDataSet_HInsa.Next;
  end;
  TMaxDataSet_HInsa.Close;
end;

procedure TFM_Main.Button1Click(Sender: TObject);
var
  SqlText: String;
  i : integer;
begin
  //자기평가 여부, 시스템 시간, 1차 평가자사번, 1차 평가자 이름, 평가표 번호, 직종 불러오기
   SqlText := Format('select a.e1empno   || '';'' || a.e1korname || '';'' || a.e2empno    || '';'' || a.e2korname ||'';''||'+
                     '       a.rvalconyn || '';'' || e1valconyn  || '';'' || e1valcondate || '';'' || c.codename  ||'';''||'+
                     '       e.DEPTNAME  || '';'' || d.codename  || '';'' || nvl(f.syn,''N'') || '';'' || f.evcno ||'';''||'+
                     '       f.jobkind   || '';'' || a.e1valobjyn|| '';'' || a.rvalobjyn  || '';'' || a.EMPDATE   ||'';''||'+
                     '       a.PAYCLDATE || '';'' || g.codename  || '';'' || h.codename   || '';'' || i.DEPTNAME  ||'';''||'+
                     '       a.paycl     || '';'' || a.empno     || '';'' || a.korname                                     '+
                     '  from peTremas a, pyccode c, pyccode d, pycdept e, pehamas f, pyccode g, pyccode h, PYCDEPT i       '+
                     ' where a.empno    =''%s''                                                                            '+
                     '   and a.rabasdate=''%s''                                                                            '+
                     '   and a.e1PAYCL  = c.codeno(+) AND c.codeid(+)  =''I112''                                           '+
                     '   and a.e1PAYRA  = d.codeno(+) AND d.codeid(+)  =''I113''                                           '+
                     '   and a.e1ORGNUM = e.ORGNUM AND a.e1DEPTCODE    = e.DEPTCODE                                        '+
                     '   and a.rabasdate= f.rabasdate(+)                                                                   '+
                     '   and a.empno    = f.empno(+)                                                                       '+
                     '   and a.paycl    = h.codeno(+) and h.codeid(+)  =''I112''                                           '+
     	              '   and a.payra    = g.codeno(+) and g.codeid(+)  =''I113''                                           '+
  	              '   and a.orgnum   = i.orgnum and a.deptcode = i.deptcode                                             '+
                     ' group by a.e1empno, a.e1korname, a.e2empno, a.e2korname,a.rvalconyn, a.e1valconyn, a.e1valcondate,  '+
                     '          c.codename,e.DEPTNAME, d.codename, f.syn, f.evcno, f.jobkind, a.e1valobjyn, a.rvalobjyn,   '+
                     '          a.EMPDATE, a.PAYCLDATE, g.codename, h.codename, i.DEPTNAME,a.paycl,a.empno,a.korname       ',
                     [edit2.text, Lrabasdate]);
  with TMaxDataSet_HInsa do                //
  begin
     Close;
     ServiceName := 'PTA1010B_common';
     ClearFieldInfo;
     AddField('SEL_DATA', ftString, 2000);
     ClearParamInfo;
     SQL.Text := SqlText;
     edit1.text := SqlText;

     Open;
     if RecordCount > 0 then
     begin
        v_restiyn     := '';
        Le1empno      := Csel_gfd(1);
        Le1korname    := Csel_gfd(2);
        Le2empno      := Csel_gfd(3);
        Le2korname    := Csel_gfd(4);
        Lrvalconyn    := Csel_gfd(5);
        Le1valconyn   := Csel_gfd(6);
        Le1valcondate := Csel_gfd(7);
        Lpayclname    := Csel_gfd(8);
        Ldeptname     := Csel_gfd(9);
        Lpayraname    := Csel_gfd(10);
        Lsyn          := Csel_gfd(11);
        Levcno        := Csel_gfd(12);
        Ljobkind      := Csel_gfd(13);
        v_e1valobjyn  := Csel_gfd(14);
        Lrvalobjyn    := Csel_gfd(15);
        L_Payclname.ValueCaption := Csel_gfd(19);
        L_Deptname.ValueCaption  := Csel_gfd(20);
        L_payraname.ValueCaption := Csel_gfd(18);
        L_empdate.Text           := Csel_gfd(16);
        L_paycldate.Text         := Csel_gfd(17);

        Ppaycl        := Csel_gfd(21);
//        Ppaycl        := 'C11'; //jissi Test
        Pempno        := Csel_gfd(22);
        Pkorname      := Csel_gfd(23);
        close;
     end
     else
     begin
        if ((Gsempno=Workemp1) or (Gsempno=Workemp2) or (Gsempno=Workemp3) or
            (Gsempno=Workemp4) or (Gsempno=Workemp5) or (copy(Gsempno,1,1)='D'))  then
        Begin
//          Edit1.Visible    := True;
          Edit2.Visible    := True;
        End
        Else
        Begin
          showmessage('팀장자기평가 대상자가 아닙니다.' +#13+#13+
                      '프로그램 자동종료 됩니다.');
          application.Terminate;
          Exit;
        End;
     end;
  end;

  //접속자에 대한 인사정보를 설정한다.
  ED_empno.ValueCaption  := Pempno;
  ED_Korname.ValueCaption:= PKorname;
  L_e1emp.ValueCaption := Le1korname;   //1차평가자명
  L_e2emp.ValueCaption := Le2korname;   //2차평가자명

    //1차평가자 업적평가 결재여부
  SqlText := 'SELECT E1PRJCONYN, '''', '''', '''', ''''     '+
             '  FROM pehremas                               '+
             ' WHERE rabasdate = '''+Lrabasdate+'''         '+
             '   AND empno     = '''+edit2.text+'''         ';
  with TDS do
  begin
     Close;
     ServiceName := 'HINSA_select';
     Sql.Text := SqlText;

     ClearFieldInfo;
     AddField('E1PRJCONYN'   , ftString    ,  100  );
     AddField('VALUE2'       , ftString    ,  100  );
     AddField('VALUE3'       , ftString    ,  100  );
     AddField('VALUE4'       , ftString    ,  100  );
     AddField('VALUE5'       , ftString    ,  100  );
     Open;
{jissi 11.10.14 잠시 막았으나 오픈전엔 풀어야 마땅함
    if TDS.FieldByName('E1PRJCONYN').AsString <> 'Y' then
     begin
        MessageDlg('1차 평가자께서 목표설정에 대한 결재를 하지 않으셨습니다. '+#13+#13+
                    '확인 바랍니다.  프로그램을 종료합니다.', mtInformation, [mbOk], 0);
        if not ((Gsempno=Workemp1) or (Gsempno=Workemp2) or (Gsempno=Workemp3) or
                (Gsempno=Workemp4) or (Gsempno=Workemp5) or (copy(Gsempno,1,1)='D'))  then    application.Terminate;
     end;
}
  end;

  //자기평가 최종완료여부를 체크한다.
  if Lrvalconyn = 'Y' then
  begin
     Bt_Confirm.Visible :=  false;
     BT_Save1.Visible   :=  false;
     BT_Cancel1.Visible :=  false;
  end
  else
  begin
     Bt_Confirm.Visible :=  true;
     BT_Save1.Visible   :=  true;
     BT_Cancel1.Visible :=  true;
  end;
  {
  //1차평가자 평가완료여부를 체크한다.
  if Le1valconyn = 'Y' then
  begin
     Bt_Confirm.Visible :=  false;
     BT_Save1.Visible :=  false;
  end;
  }
  var_Ekind               := 'Values';
  PageControl1.ActivePage := TabSheet1;

  //S, E, G, N, U 점수읽기
  SqlText := 'SELECT Value1, Value2, Value3, Value4, Value5 '+
             '  FROM pehabas                                '+
             ' WHERE rabasdate = '''+Lrabasdate+'''         '+
             '   AND gubun     = ''11''                     '+
             '   AND sgubun    = ''0006''                   ';
  with TDS do
  begin
     Close;
     ServiceName := 'HINSA_select';
     Sql.Text := SqlText;

     ClearFieldInfo;
     AddField('VALUE1'       , ftString    ,  100  );
     AddField('VALUE2'       , ftString    ,  100  );
     AddField('VALUE3'       , ftString    ,  100  );
     AddField('VALUE4'       , ftString    ,  100  );
     AddField('VALUE5'       , ftString    ,  100  );
     Open;
     var_ScrS  := FieldByName('VALUE1').AsString;
     var_ScrA  := FieldByName('VALUE2').AsString;
     var_ScrB  := FieldByName('VALUE3').AsString;
     var_ScrC  := FieldByName('VALUE4').AsString;
     var_ScrD  := FieldByName('VALUE5').AsString;
  end;

 //Values, 공통역량, 리더십역량,업적을 조회한다.
  Values_data1;
  Common_data;
  Leadership_data;
  Works_data;
  opinion_data;
  SelectMerit;

  if not((Gsempno=Workemp1) or (Gsempno=Workemp2) or (Gsempno=Workemp3) or
         (Gsempno=Workemp4) or (Gsempno=Workemp5) or (copy(Gsempno,1,1)='D')) then
  begin
       if TDS_Works.fieldbyname('PROPELTASK').AsString = '' then
       begin
            showmessage('팀장님의 업무목표등록 자료가 없으므로 평가를 수행할 수 없습니다.' +#13+ #13+
                        '업무목표등록을 먼저 수행하십시오.' +#13+ #13+
                        '프로그램 자동종료 됩니다.');
            application.Terminate;
       end;
  end;
  PageControl1.ActivePage := tabsheet1;
end;

procedure TFM_Main.SW_S1Click(Sender: TObject);
var  Param      : OleVariant;
     SqlText    : string;
     sSelfClass6: string;
begin
  if Lrvalconyn = 'Y' then
  begin
       MessageBox(handle,'이미 평가가 완료된 자료는 '+
                       '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
       Exit;
  end;
  if  TOnSkinButton(Sender).tag <> 6 then
  begin
       TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Setfocus;
       if TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Text ='' then
       begin
            MessageDlg('달성실적을 먼저 입력하세요!', mtWarning, [mbOK], 0);
            System.Exit;
       end;
  end;

  TOnSkinButton(Self.FindComponent('SW_S'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_A'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_B'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_C'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SW_D'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;

  TOnSkinButton(Self.FindComponent('SW_S'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_A'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_B'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_C'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SW_D'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;

  TOnSkinButton(Sender).BtnDown := True;
  TOnSkinButton(Sender).Font.Color := clWhite;

  //달성등급
  //TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := Copy(TOnSkinButton(Sender).Name,4,1);
  if      Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then      TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdS
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then      TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdA
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then      TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdB
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then      TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdC
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then      TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdD;


  if      Copy(TOnSkinButton(Sender).Name,4,1) ='S' then
  begin
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := SScore;
       TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdS;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='A' then
  begin
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := AScore;
       TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdA;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='B' then
  begin
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := BScore;
       TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdB;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='C' then
  begin
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := CScore;
       TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdC;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='D' then
  begin
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := DScore;
       TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdD;
  end
  else TOnShapeLabel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '';

  if TOnSkinButton(Sender).tag = 6 then
  begin
       if      SelfClass6.ValueCaption = var_GrdS then        sSelfClass6 := 'S'
       else if SelfClass6.ValueCaption = var_GrdA then        sSelfClass6 := 'A'
       else if SelfClass6.ValueCaption = var_GrdB then        sSelfClass6 := 'B'
       else if SelfClass6.ValueCaption = var_GrdC then        sSelfClass6 := 'C'
       else if SelfClass6.ValueCaption = var_GrdD then        sSelfClass6 := 'D';

       Param := VarArrayOf([replace(sSelfClass6,'''','`'),
                            replace(SelfScore6.ValueCaption,'''','`'),
                            Pempno,
                            Lrabasdate,
                            Pempno
                           ]);

       SqlText := Format('UPDATE pehremas SET                                         '+
                         '  prorclass      = ''%s'',                                  '+
                         '  prorscore      = ''%s'',                                  '+
                         '  writeemp       = ''%s'',                                  '+
                         '  writetime      = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')   '+
                         ' WHERE rabasdate = ''%s'' AND empno = ''%s''                ',
                         [Param[0],Param[1],Param[2], Param[3],Param[4]]);

       Cupd_SQL := Sqltext;
       Cupd_Exec;
  end;
  Rscore;
end;

procedure TFM_Main.RB_MoveEra3Click(Sender: TObject);
begin
  E_MoveCause.Enabled   := True;
  E_MoveDept.Enabled    := True;
  RB_MoveCause1.Enabled := True;
  RB_MoveCause2.Enabled := True;
  RB_MoveCause3.Enabled := True;
  RB_MoveCause4.Enabled := True;
  RB_MoveCause5.Enabled := True;

  RB_MoveCause5.Checked := True;
end;

procedure TFM_Main.RB_MoveCause5Click(Sender: TObject);
begin
  E_MoveCause.Text := '';
end;

procedure TFM_Main.E_MeritKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  Merit : string;
begin
  i := 222;
  if key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
  end;
end;

procedure TFM_Main.E_DemeritKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  DeMerit : string;
begin
  i := 222;
  if key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
  end;
end;

procedure TFM_Main.E_ProposeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  Propose : string;
begin
  i := 222;
  if key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
       Propose := copy(E_Propose.text, 1, Length(E_Propose.text)-1);
       E_Propose.Clear;
       E_Propose.Lines.Append(Propose);
  end;
end;

procedure TFM_Main.SG_Image01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image01.Row = 0) then
  begin
       // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
       ShowImage01;
       SG_Image01.Row := SG_Image01.RowCount-1;
       Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image01.Row = SG_Image01.RowCount-1) then
  begin
       // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
       ShowImage01;
       SG_Image01.Row := 0;
       Key := VK_ESCAPE;
  end;
end;

procedure TFM_Main.SG_Image01Click(Sender: TObject);
var
  sqltext : string;
  i, j : integer;
begin
{
  for i := 0 to SG_Score01.ColCount-1 do
       for j := 0 to SG_Score01.RowCount-1 do
            SG_Score01.Cells[i, j] := '';

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')    '+
              '  FROM petacd a, petds b, petac c' +
              ' WHERE a.rabasdate = '''+LRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
                ' AND a.ekind     = ''Values''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData01.Cells[0, SG_Image01.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+Pempno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              //  ' AND a.imageno   = b.imageno(+)' +
                ' ORDER BY a.itemno, a.imageno';
  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
  end;
  i:= 1;
  while not TMaxDataSet_HInsa.EOF do
  begin
       TOnMemo(Self.FindComponent('M_image01'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

       //자기평가
            if Csel_gfd(5) = '100' then        SG_Score01.Cells[0, 0] := var_GrdS
       else if Csel_gfd(5) >= '90' then        SG_Score01.Cells[0, 1] := var_GrdA
       else if Csel_gfd(5) >= '80' then        SG_Score01.Cells[0, 2] := var_GrdB
       else if Csel_gfd(5) >= '70' then        SG_Score01.Cells[0, 3] := var_GrdC
       else if Csel_gfd(5) >= '60' then        SG_Score01.Cells[0, 4] := var_GrdD;

       i := i + 1;
       TMaxDataSet_HInsa.Next;
  end;
  TMaxDataSet_HInsa.Close;
}
end;

procedure TFM_Main.SG_ItemImage01DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_ItemImage01.Canvas.Brush.Color := clWhite; //$00FFE8D0;
       SG_ItemImage01.Canvas.Font.Color  := clBlack;
  end;

  SG_ItemImage01.Canvas.FillRect(Rect);

  SG_ItemImage01.ColWidths[mITEMNAME_IDX]  := 90;

  if SG_ItemImage01.VisibleRowCount < SG_ItemImage01.RowCount then
       SG_ItemImage01.ColWidths[mITEMDESC_IDX] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[mITEMNAME_IDX] - 16
  else
       SG_ItemImage01.ColWidths[mITEMDESC_IDX] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top   + 2;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 2;
  if SG_ItemImage01.RowCount > (SG_ItemImage01.VisibleRowCount+SG_Image01.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_ItemImage01.Cells[ACol, ARow];
  DrawText(SG_ItemImage01.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK );
end;

procedure TFM_Main.InUpMerit(Parameter: String);
var SqlText, JobMode : String;
begin
//  평가 장점/단점 서술형 입력 테이블 생성할것.
  with TDS do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT empno,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEHREMER  '+
                ' where rabasdate  = ''' + Lrabasdate +''' ' +
                '   AND empno      = ''' + Parameter  +''' ' ;

    ClearFieldInfo;
    AddField('empno'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  (TDS.RecordCount < 1 )  then JobMode :='I'
    else                             JobMode :='U';
  end;

  if JobMode = 'I' then
  begin
    if      (var_Ekind = 'Values')  Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_EVY,  ' +
                '    MERIT_EVN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ Lrabasdate       +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_V1.Text +''',       ' +
                '    '''+ OM_Merit_V2.Text +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End
    Else if (var_Ekind = '공통역량') Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_ECY,  ' +
                '    MERIT_ECN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ Lrabasdate       +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_C1.Text +''',       ' +
                '    '''+ OM_Merit_C2.Text +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_ERY,  ' +
                '    MERIT_ERN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ Lrabasdate       +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_R1.Text +''',       ' +
                '    '''+ OM_Merit_R2.Text +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End;
  end
  Else
  Begin
    if      (var_Ekind = 'Values')  Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_EVY = '''+ OM_Merit_V1.Text +''', '+
                '       MERIT_EVN = '''+ OM_Merit_V2.Text +''', '+
                '       WRITEEMP  = '''+ Parameter        +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [Lrabasdate, Parameter]);
    End
    Else if (var_Ekind = '공통역량')  Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_ECY = '''+OM_Merit_C1.Text +''', '+
                '       MERIT_ECN = '''+OM_Merit_C2.Text +''', '+
                '       WRITEEMP  = '''+Parameter        +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [Lrabasdate, Parameter]);
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_ERY = '''+OM_Merit_R1.Text +''', '+
                '       MERIT_ERN = '''+OM_Merit_R2.Text +''', '+
                '       WRITEEMP  = '''+Parameter        +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [Lrabasdate, Parameter]);
    End;
  End;

  TDS.Close;
  TDS.Sql.Clear;
  TDS.Sql.Text := SQLText;
  TDS.ServiceName := 'PIT1030A_DML';

  if NOT TDS.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End;
end;

function TFM_Main.FL_CheckNullMERIT:Boolean; // 장단점 미입력 항목이 있는지 여부 체크
var Msg : String;
begin
  Result := False;
  with DBcommon do
  Begin
    SQL.Clear;
    SQL.Text := format(' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values평가(장점)'', '+
                       '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values평가(단점)'', '+
                       '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',   '+
                       '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',   '+
                       '        (DECODE(REPLACE(MERIT_ERY, '' ''), NULL, ''리더십역량(장점)'', '+
                       '        (DECODE(REPLACE(MERIT_ERN, '' ''), NULL, ''리더십역량(단점)'', ''0''))))))))))) SEL_DATA '+
                       ' from PEHREMER '+
                       ' WHERE  empno    =''%s'' '+
                       '   and rabasdate =''%s'' ',[Pempno, Lrabasdate]);
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 100);

    Open;
    Msg := FieldByName('SEL_DATA').AsString;

    if Msg =  '0' then Result := True
    Else
    Begin
      MessageDlg(Msg + '을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);

      If (Copy(Msg,1,6) = 'Values')         Then PageControl1.ActivePage := TabSheet1
      Else If  Copy(Msg,1,8) = '공통역량'   Then PageControl1.ActivePage := TabSheet3
      Else                                       PageControl1.ActivePage := TabSheet4;
      Result := False;
    End;
  End;
end;

procedure TFM_Main.SelectMerit;
var SqlText : String;
Begin
with TDS do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    if      (var_Ekind = 'Values')  Then
    Begin
      SqlText := ' SELECT MERIT_EVY field1, MERIT_EVN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End
    Else if (var_Ekind = '공통역량')  Then
    Begin
      SqlText := ' SELECT MERIT_ECY field1, MERIT_ECN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      SqlText := ' SELECT MERIT_ERY field1, MERIT_ERN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End;

    SqlText := SqlText + ' where rabasdate  = ''' + Lrabasdate +''' ' +
                         '   AND empno      = ''' + Pempno     +''' ' ;

    ClearFieldInfo;
    AddField('field1' ,ftString, 2000);
    AddField('field2' ,ftString, 2000);
    AddField('field3' ,ftString, 2000);
    AddField('field4' ,ftString, 2000);
    AddField('field5' ,ftString, 2000);
    SQL.Text := SqlText;
    Open;

    if      (var_Ekind = 'Values')  Then
    Begin
      OM_Merit_V1.Text := Fields[0].AsString;
      OM_Merit_V2.Text := Fields[1].AsString;
    End
    Else if (var_Ekind = '공통역량')  Then
    Begin
      OM_Merit_C1.Text := Fields[0].AsString;
      OM_Merit_C2.Text := Fields[1].AsString;
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      OM_Merit_R1.Text := Fields[0].AsString;
      OM_Merit_R2.Text := Fields[1].AsString;
    End;
  end;
End;

end.
