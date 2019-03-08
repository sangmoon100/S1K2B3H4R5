unit HMainForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnInsaCommon,
  Db, Tmax_DataSetText, OnDBGrid, peoutlookbtn, OnEditMemo,NotesHana_TLB,
  OnEditCombo, OnRadioBtn, OnPopupEdit, TmaxFunc;

type
  TFM_Main1 = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    L_jobgun: TOnShapeLabel;
    L_jobkind: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    DBSet1: TTMaxDataSet;
    DataSource1: TDataSource;
    DBSet_dml: TTMaxDataSet;
    BT_Exit: TOnFocusButton;
    TDS1: TTMaxDataSet;
    L_eempno: TLabel;
    CB_empno: TLabel;
    Label14: TLabel;
    Bt_Confirm: TOnFocusButton;
    BT_Save1: TOnFocusButton;
    TMaxDataSet_HInsa: TTMaxDataSet;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    Notebook1: TNotebook;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    Label24: TLabel;
    L_Total0: TLabel;
    L_Yes0: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Panel12: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    SG_Image0: TStringGrid;
    Panel15: TPanel;
    L_Self0: TPanel;
    L_First20: TPanel;
    Panel18: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    L_First10: TPanel;
    L_Up0: TPanel;
    Panel23: TPanel;
    SG_HiddenData0: TStringGrid;
    CB_ShowClass0: TCheckBox;
    TabSheet2: TTabSheet;
    Shape2: TShape;
    Label18: TLabel;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total1: TLabel;
    L_Yes1: TLabel;
    L_duname: TLabel;
    Label20: TLabel;
    LT_Self: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    SG_Image1: TStringGrid;
    Panel7: TPanel;
    SG_Score1: TStringGrid;
    P_ControlButton1: TPanel;
    SB_S1: TSpeedButton;
    SB_A1: TSpeedButton;
    SB_B1: TSpeedButton;
    SB_C1: TSpeedButton;
    SB_D1: TSpeedButton;
    L_Title: TPanel;
    L_Self1: TPanel;
    L_First21: TPanel;
    CB_ShowClass1: TCheckBox;
    Panel6: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    L_First11: TPanel;
    L_Up1: TPanel;
    Panel14: TPanel;
    M_image11: TOnMemo;
    M_image12: TOnMemo;
    M_image13: TOnMemo;
    M_image14: TOnMemo;
    M_image15: TOnMemo;
    SG_HiddenData1: TStringGrid;
    TabSheet3: TTabSheet;
    Shape3: TShape;
    Panel3: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    CB_ShowClass2: TCheckBox;
    Label5: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    L_Total2: TLabel;
    L_Yes2: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    SG_Image2: TStringGrid;
    SG_HiddenData2: TStringGrid;
    Panel4: TPanel;
    SG_Score2: TStringGrid;
    P_ControlButton2: TPanel;
    Panel5: TPanel;
    L_Self2: TPanel;
    L_First22: TPanel;
    L_First12: TPanel;
    L_Up2: TPanel;
    Panel16: TPanel;
    Panel8: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Panel11: TPanel;
    Label19: TLabel;
    Label22: TLabel;
    M_image21: TOnMemo;
    M_image22: TOnMemo;
    M_image23: TOnMemo;
    M_image24: TOnMemo;
    M_image25: TOnMemo;
    TabSheet4: TTabSheet;
    Panel17: TPanel;
    Panel35: TPanel;
    Label56: TLabel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
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
    DownScore1: TOnShapeLabel;
    DownClass1: TOnShapeLabel;
    L_valfunction1: TOnShapeLabel;
    pnl_no1: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
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
    DownScore2: TOnShapeLabel;
    Shape28: TShape;
    DownClass2: TOnShapeLabel;
    L_valfunction2: TOnShapeLabel;
    pnl_no2: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
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
    DownScore3: TOnShapeLabel;
    Shape29: TShape;
    DownClass3: TOnShapeLabel;
    L_valfunction3: TOnShapeLabel;
    pnl_no3: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
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
    DownScore4: TOnShapeLabel;
    Shape30: TShape;
    DownClass4: TOnShapeLabel;
    L_valfunction4: TOnShapeLabel;
    pnl_no4: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    E_Aim4: TOnMemo;
    pnl_5: TPanel;
    SW_S5: TOnSkinButton;
    SW_A5: TOnSkinButton;
    SW_B5: TOnSkinButton;
    SW_C5: TOnSkinButton;
    SW_D5: TOnSkinButton;
    Shape31: TShape;
    L_bresultclass5: TOnShapeLabel;
    L_validx5: TOnShapeLabel;
    L_detailweight5: TOnShapeLabel;
    L_DetailTask5: TOnShapeLabel;
    DownScore5: TOnShapeLabel;
    DownClass5: TOnShapeLabel;
    L_valfunction5: TOnShapeLabel;
    pnl_no5: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    E_Aim5: TOnMemo;
    DBG_user: TOnGrDbGrid;
    Panel64: TPanel;
    Panel65: TPanel;
    L_escore: TOnNumberEdit;
    TabSheet5: TTabSheet;
    Memo_E2: TOnMemo;
    Panel19: TPanel;
    Panel73: TPanel;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    Panel70: TPanel;
    TabSheet8: TTabSheet;
    OnShapeLabel2: TOnShapeLabel;
    Label63: TLabel;
    OnShapeLabel67: TOnShapeLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Panel71: TPanel;
    Label67: TLabel;
    RB_MoveEra3: TOnRadioButton;
    RB_MoveEra2: TOnRadioButton;
    RB_MoveEra1: TOnRadioButton;
    Panel72: TPanel;
    RB_MoveCause1: TOnRadioButton;
    E_MoveCause: TEdit;
    RB_MoveCause5: TOnRadioButton;
    RB_MoveCause4: TOnRadioButton;
    RB_MoveCause3: TOnRadioButton;
    RB_MoveCause2: TOnRadioButton;
    Panel74: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    E_MoveDept: TOnWinPopupEdit;
    Panel75: TPanel;
    E_Propose: TOnMemo;
    TDS_Works: TTMaxDataSet;
    DataSource2: TDataSource;
    E_TaskAdd1: TOnEdit;
    E_TaskAdd2: TOnEdit;
    E_TaskAdd3: TOnEdit;
    E_TaskAdd4: TOnComboEdit;
    BT_Cancel1: TOnFocusButton;
    Label71: TLabel;
    Shape32: TShape;
    Label72: TLabel;
    Label73: TLabel;
    Shape33: TShape;
    Panel66: TPanel;
    Label74: TLabel;
    Panel76: TPanel;
    Label75: TLabel;
    SelfClass1: TOnShapeLabel;
    SelfScore1: TOnShapeLabel;
    SelfClass2: TOnShapeLabel;
    SelfScore2: TOnShapeLabel;
    SelfClass3: TOnShapeLabel;
    SelfScore3: TOnShapeLabel;
    SelfClass4: TOnShapeLabel;
    SelfScore4: TOnShapeLabel;
    SelfClass5: TOnShapeLabel;
    SelfScore5: TOnShapeLabel;
    L_rscore: TOnNumberEdit;
    Shape19: TShape;
    Shape14: TShape;
    Shape9: TShape;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Label45: TLabel;
    Shape13: TShape;
    Label46: TLabel;
    Label47: TLabel;
    Shape23: TShape;
    Shape20: TShape;
    Shape24: TShape;
    Label48: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    E_Study1: TOnMemo;
    E_MoveText1: TOnMemo;
    Panel25: TPanel;
    Shape12: TShape;
    Shape15: TShape;
    RB_BandUp11: TOnRadioButton;
    RB_BandUp21: TOnRadioButton;
    RB_BandUp31: TOnRadioButton;
    RB_BandUp41: TOnRadioButton;
    RB_BandUp51: TOnRadioButton;
    Panel27: TPanel;
    RB_MoveDept11: TOnRadioButton;
    RB_MoveDept21: TOnRadioButton;
    RB_MoveDept31: TOnRadioButton;
    Panel28: TPanel;
    RB_Study11: TOnRadioButton;
    RB_Study21: TOnRadioButton;
    RB_Study31: TOnRadioButton;
    RB_Study41: TOnRadioButton;
    Memo_E3: TOnMemo;
    pnl_6: TPanel;
    SW_S6: TOnSkinButton;
    SW_A6: TOnSkinButton;
    SW_B6: TOnSkinButton;
    SW_C6: TOnSkinButton;
    SW_D6: TOnSkinButton;
    OnShapeLabel1: TOnShapeLabel;
    Label25: TLabel;
    SelfScore6: TOnShapeLabel;
    SelfClass6: TOnShapeLabel;
    DownClass6: TOnShapeLabel;
    DownScore6: TOnShapeLabel;
    OnEdit1: TOnEdit;
    Shape1: TShape;
    M_image01: TOnMemo;
    M_image02: TOnMemo;
    M_image03: TOnMemo;
    M_image04: TOnMemo;
    M_image05: TOnMemo;
    Bt_Add: TOnFocusButton;
    Bt_OConfirm: TOnFocusButton;
    BT_Help: TOnFocusButton;
    Edit1: TEdit;
    SG_ItemImage0: TStringGrid;
    Label23: TLabel;
    Label54: TLabel;
    OnMemo4: TOnMemo;
    OnMemo5: TOnMemo;
    OM_Merit_C1: TOnMemo;
    OM_Merit_C2: TOnMemo;
    OM_Merit_R2: TOnMemo;
    OM_Merit_R1: TOnMemo;
    OnMemo11: TOnMemo;
    OnMemo10: TOnMemo;
    OnMemo2: TOnMemo;
    OnMemo1: TOnMemo;
    OM_Merit_V1: TOnMemo;
    OM_Merit_V2: TOnMemo;
    OnMemo7: TOnMemo;
    On_MERIT_EVN: TOnMemo;
    On_MERIT_EVY: TOnMemo;
    OnMemo3: TOnMemo;
    OnMemo6: TOnMemo;
    On_MERIT_ECY: TOnMemo;
    On_MERIT_ERN: TOnMemo;
    On_MERIT_ERY: TOnMemo;
    On_MERIT_ECN: TOnMemo;
    BT_Print: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    OnMemo12: TOnMemo;
    On_MERIT_JVY: TOnMemo;
    On_MERIT_JVN: TOnMemo;
    On_MERIT_JCN: TOnMemo;
    On_MERIT_JCY: TOnMemo;
    On_MERIT_JRY: TOnMemo;
    On_MERIT_JRN: TOnMemo;
    Print: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SB_S1Click(Sender: TObject);
    procedure BT_Save1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1Enter(Sender: TObject);
    procedure CB_ShowClass1Click(Sender: TObject);
    procedure SB_S2Click(Sender: TObject);
    procedure SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score2Enter(Sender: TObject);
    procedure CB_ShowClass2Click(Sender: TObject);
    procedure SG_Image0DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score0DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score0Enter(Sender: TObject);
    procedure SB_S0Click(Sender: TObject);
    procedure SG_Image1Click(Sender: TObject);
    procedure SG_Image2Click(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BT_Cancel1Click(Sender: TObject);
    procedure E_MoveText1Click(Sender: TObject);
    procedure E_Opinion11Click(Sender: TObject);
    procedure SW_S1Click(Sender: TObject);
    procedure Memo_E2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_AddClick(Sender: TObject);
    procedure SG_Image1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SG_Image2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_OConfirmClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure SG_ItemImage0DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SelectMerit;
    procedure PageControl2Change(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure PrintClick(Sender: TObject);

  private
    { Private declarations }
    FL_Start   : Boolean;
    FL_E1opinionyn : Boolean;
    procedure Value_data;
    procedure Common_data;
    procedure Leadership_data;
    procedure Works_data;
    procedure opinion_data;
    procedure Read_WorkScore;
    procedure ShowSum0;
    procedure ShowSum1;
    procedure ShowSum2;
    procedure ResetAllButton;
    function Csel_gfd(p_loc: Integer): String;
    function IsDataModified0: Boolean;
    function IsDataModified1: Boolean;
    function IsDataModified2: Boolean;

  public
    { Public declarations }
    Pjobkind : String;
    Inter    : ILotusNotes_Hana;
    Pempno, Pkorname, Password, Ppermission: string;
    var_empno   : String; //피평가자 사번
    var_korname : String; //피평가자 성명
    var_no      : String; //피평가자 차수 (기술팀장이 두명으로 인해 구분 --e2, e3
    vOrgnum,  vOldEmpDept: String;
    var_Ekind     : String;
    var_Able1   : String;
    var_Able2   : String;
    var_Objyn   : String;

    g_rscore,    g_escore    : string;
    g_prorscore, g_proescore : string;
    g_prorclass, g_proeclass : string;

    vImageno    : String;
    vItemno     : String;
    vItemname   : String;
    vOBJYN      : String;
    vOBJSAYU    : String;
    vOBJOpinion : String;
    vOBJOpinion2: String;
    vSelectdRow : Integer;

    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  end;

var
  FM_Main1: TFM_Main1;
  DetailCnt : Integer;
  Csel_SQL  : String;
  E1ValconYN,E2ValconYN : String;
  Le1korname,Le1empno : String;
  LSeqno    : real;
  SaveTask  : TBookMark ;
  v_e1opinionyn : string;
  v_e2opinionyn : string;

const
  var_ScrS = '100';
  var_ScrA = '90';
  var_ScrB = '80';
  var_ScrC = '70';
  var_ScrD = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

    // SG_HiddenData 의 index
  dMODIFIED_IDX = 23; // 자료변동여부

implementation

uses HSubForm,Hinsa_TmaxDM, UOpinon, UPrintForm, UPrintForm1;

{$R *.DFM}

procedure TFM_Main1.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Main1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := True;
   FM_Sub.BT_SelClick(nil);
end;

procedure TFM_Main1.FormShow(Sender: TObject);
var SqlText :string;
begin
  BT_Help.Visible    := False;
  
  SqlText := 'select e1empno|| '';'' ||e1korname from petremas '+
             ' where rabasdate ='''+sRabasDate+'''             '+
             '   and empno     ='''+var_empno+'''              ';
  with DataModule_Tmax.TMaxDataSet_HInsa do
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
       Le1empno   := DataModule_Tmax.Csel_gfd(1);
       Le1korname := DataModule_Tmax.Csel_gfd(2);
    end;
    close;
  end;
  L_eempno.Caption := GSkorname+' 님이 평가하실 피평가자는';
  CB_empno.Caption := var_korname;

  FL_E1opinionyn := false;

  
  SqlText := 'select e1opinionyn||'';''|| pgroupratio||'';''|| e2opinionyn '+
             ' from pehremas                           '+
             'where rabasdate = '''+sRabasDate+'''     '+
             '  and empno     = '''+var_empno +'''     ';
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;
  v_e1opinionyn   := DataModule_Tmax.Csel_gfd(1);
  v_e2opinionyn   := DataModule_Tmax.Csel_gfd(3);

  //최종완료 여부를 체크 한후 버튼 설정을 한다.
  if var_no = 'e2' then  //하은영
    SqlText := 'select nvl(e2valconyn,''N'')||'';''||nvl(e2valobjyn,''N'')||'';''||nvl(e1valconyn,''N'') '+
               'from petremas '+
               'where rabasdate = '''+sRabasdate+'''' +
               'and empno = '''+var_empno+''''
  else
    SqlText := 'select nvl(e3valconyn,''N'')||'';''||nvl(e3valobjyn,''N'')||'';''||nvl(e1valconyn,''N'') '+
               'from petremas '+
               'where rabasdate = '''+sRabasdate+'''' +
               'and empno = '''+var_empno+'''';


  with DataModule_Tmax.TMaxDataSet_HInsa do
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
       var_Able1 := Csel_gfd(3);
       var_Able2 := Csel_gfd(1);
       var_Objyn := Csel_gfd(2);

       if Csel_gfd(1) = 'N' then
       begin
(*
          messagedlg('2차평가자는'+#13 +#13 +
                     '[업적평가]에 대한 조정, 승인자로서 점수 입력이 없으며,'+#13 +#13 +
                     '먼저 [업적평가]에 대해 승인/반려 하시고 진행하시면 됩니다.', mtinformation, [mbOK], 0);
*)
          Bt_Confirm.Enabled := true;
          BT_Save1.Enabled   := true;
          BT_Cancel1.Enabled := true;
       end
       else
       begin
          MessageDlg('이미 [최종완료] 하신 팀장입니다.'+#13+#10+''+#13+#10+'<점수확인>만 가능하십니다.  '+#13+#10+'', mtinformation, [mbOK], 0);
          BT_Save1.Visible    := false;
          Bt_Confirm.Visible  := false;
          BT_Cancel1.Visible  := false;

          if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청') then
          begin
               BT_Help.Visible    := True;
               if (v_e2opinionyn ='Y') then
               begin
                  MessageDlg('평가소견등록을 완료한 자료입니다.',mtInformation,[mbOK],0);
                  Bt_Add.Enabled := true;
                  Bt_OConfirm.Enabled:= false;
                  BT_Save1.Enabled   := false;
                  BT_Cancel1.Enabled := false;
                  FL_E1opinionyn     := true;
               end
               else
               begin
                  MessageDlg('피평가자가 평가 Petition을 하였습니다.'+#13+#10+''+#13+#10+'평가 Petition한 평가항목별로 평가근거를 등록하세요. ', mtWarning, [mbOK], 0);
                  Bt_Add.Enabled := true;
                  Bt_OConfirm.Enabled := true;
                  BT_Save1.Enabled   := true;
                  BT_Cancel1.Enabled := true;
                  FL_E1opinionyn     := false;
               end;
          end;
       end;
    end;
    close;
  end;
  NoteBook1.PageIndex     := 0;
  var_Ekind               := 'Values';
  PageControl1.ActivePage := TabSheet1;
  Value_data;       //Value를 조회한다.
  Common_data;      //공동역량를 조회한다.
  Leadership_data;  //리더십역량를 조회한다.
  Works_data;
  opinion_data;
  SelectMerit;
  if var_no = 'e2' then
  begin
     Memo_E2.Enabled       := true;
     Memo_E3.Enabled       := false;
  end
  else
  begin
     Memo_E2.Enabled       := false;
     Memo_E3.Enabled      := true;
  end;
end;

procedure TFM_Main1.Read_WorkScore;
var
  SqlText : string;
begin
  //업적평가점수 합계
  SqlText := Format('select nvl(sum(rscore),0)|| '';'' || nvl(sum(escore),0) '+
                    '  from pehreaim_DET                                     '+
                    ' where empno     = ''%s''                               '+
                    '   and rabasdate = ''%s'' ',[var_empno, sRabasDate]);
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;
  g_rscore       := DataModule_Tmax.Csel_gfd(1);
  g_escore       := DataModule_Tmax.Csel_gfd(2);

  SqlText := Format('select decode(prorscore,'''',0,prorscore) ||'';''|| decode(proescore,'''',0,proescore) '+
                    '       ||'';''||prorclass ||'';''|| proeclass '+
                    '  from pehremas   '+
                    ' where empno=''%s'' and rabasdate=''%s'' ',[var_empno, sRabasdate]);
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;
  g_prorscore   := DataModule_Tmax.Csel_gfd(1);
  g_proescore   := DataModule_Tmax.Csel_gfd(2);
  g_prorclass   := DataModule_Tmax.Csel_gfd(3);
  g_proeclass   := DataModule_Tmax.Csel_gfd(4);

  if g_prorscore <> '0' then SelfScore6.ValueCaption := g_prorscore;
  if g_proescore <> '0' then DownScore6.ValueCaption := g_proescore;

  if      g_prorclass = 'S' then SelfClass6.ValueCaption := var_GrdS
  else if g_prorclass = 'A' then SelfClass6.ValueCaption := var_GrdA
  else if g_prorclass = 'B' then SelfClass6.ValueCaption := var_GrdB
  else if g_prorclass = 'C' then SelfClass6.ValueCaption := var_GrdC
  else if g_prorclass = 'D' then SelfClass6.ValueCaption := var_GrdD
  else                           SelfClass6.ValueCaption := g_prorclass;

  if      g_proeclass = 'S' then DownClass6.ValueCaption := var_GrdS
  else if g_proeclass = 'A' then DownClass6.ValueCaption := var_GrdA
  else if g_proeclass = 'B' then DownClass6.ValueCaption := var_GrdB
  else if g_proeclass = 'C' then DownClass6.ValueCaption := var_GrdC
  else if g_proeclass = 'D' then DownClass6.ValueCaption := var_GrdD
  else                           DownClass6.ValueCaption := g_proeclass;

  if  (g_proeclass <> '') then
  begin
    TOnSkinButton(Self.FindComponent('SW_'+g_proeclass+'6')).BtnDown    := True;
    TOnSkinButton(Self.FindComponent('SW_'+g_proeclass+'6')).Font.Color := clWhite;
  end;

  L_rscore.Value := StrToFloat(g_rscore)*0.9 + StrToFloat(g_prorscore)*0.1;
  L_escore.Value := StrToFloat(g_escore)*0.9 + StrToFloat(g_proescore)*0.1;
  //L_rscore.Value := StrToFloat(DataModule_Tmax.Csel_gfd(1));
  //L_escore.Value := StrToFloat(DataModule_Tmax.Csel_gfd(2));
end;

procedure TFM_Main1.Value_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  //만일 1차 평가자 완료처리 된 자료는 저장처리및 변경처리 못하도록 막는다.
  //
  //SG_ItemImage0의 값을 지운다..
  for i := 0 to SG_ItemImage0.ColCount - 1 do
    for j := 0 to SG_ItemImage0.RowCount -1 do
      SG_ItemImage0.Cells[i, j] := '';

  i := 0; j := 0;

  SqlText := 'SELECT                                               '+
             '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
             '       nvl(        a.imagename   ,'' '') || '';'' || '+
             '       nvl(        a.imageno,     ''0'') || '';'' || '+
             '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
             '       nvl(        a.imagebigo   ,'' '')             '+
             '  FROM petacd a                                      '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
             ' WHERE a.rabasdate = '''+sRabasdate+'''              '+
             '   AND a.evcno     = 1                               '+ // 평가표번호
             '   AND a.ekind     = ''Values''                      '+ // 평가구분
             '   ORDER BY a.itemno, a.imageno                      ';

  //항목을 가져와서 SG_ItemImage0.에 넣고..
  DataModule_Tmax.Csel_SQL :=  SqlText;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
      inc(i);
      SG_ItemImage0.Cells[0, i-1] := DataModule_Tmax.Csel_gfd(2);
      SG_ItemImage0.Cells[1, i-1] := DataModule_Tmax.Csel_gfd(4);
//      SG_ItemImage0.Cells[2, i-1] := DataModule_Tmax.Csel_gfd(5);

      DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  for i := 0 to SG_HiddenData0.ColCount - 1 do
    for j := SG_HiddenData0.FixedRows to SG_HiddenData0.RowCount -1 do
      SG_HiddenData0.Cells[i, j] := '';
  SG_HiddenData0.RowCount := SG_HiddenData0.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(a.itemname,'' '')||'';''||'+
                    ' nvl('''',''0'')||'';''||'+ //to_char(a.imageno)
                    ' nvl(a.itemdesc,'' '')||'';''||'+  //a.imagedesc
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' '' ''||'';''||'+ //' nvl(to_char(d.score),''0'')||'';''||'+    //상향평가점수
                    ' nvl(b.empno,'' '')||'';''||'+
                    ' nvl(to_char(b.e3score),''0'')'+
              '  FROM petac a, petds b, '+//petacd c,' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              '       (select rabasdate, pempno, ekind, imageno, itemno, round(sum(score)/count(0),2) score' +
              '        from petdl A' +
              '        where pempno  = '''+var_empno+'''' +
              '        and rabasdate = '''+sRabasdate+'''' +
              '        AND EMPNO IN (SELECT EMPNO FROM PESREMAS WHERE RABASDATE=A.RABASDATE AND PEMPNO=A.PEMPNO AND RVALCONYN = ''Y'') '+
              '        group by rabasdate, pempno, ekind, imageno, itemno ) d' +
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
            //    ' AND a.paycl     = ''' + Ppaycl +''' '+ //BAND
                ' AND a.ekind     = ''Values''' + // 평가구분
            //    ' AND a.rabasdate = c.rabasdate' +
            //    ' AND a.evcno     = c.evcno' + // 평가표번호
            //    ' AND a.paycl     = c.paycl' + // BAND
            //    ' AND a.ekind     = c.ekind' +
            //    ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
            //    ' AND a.imageno   = b.imageno(+)' +
                ' AND a.rabasdate = d.rabasdate(+)' +
                ' AND a.ekind     = d.ekind(+)' +
            //    ' AND a.imageno   = d.imageno(+)' +
                ' AND a.itemno    = d.itemno(+)' +
              ' ORDER BY a.itemno';//, a.imageno';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData0.Cells[0, SG_HiddenData0.RowCount-1] <> '' then
      SG_HiddenData0.RowCount := SG_HiddenData0.RowCount + 1;

    SG_HiddenData0.Cells[0, SG_HiddenData0.RowCount-1] := Csel_gfd(1); // 평가항목번호
    SG_HiddenData0.Cells[1, SG_HiddenData0.RowCount-1] := Csel_gfd(2); // 평가항목명
    SG_HiddenData0.Cells[2, SG_HiddenData0.RowCount-1] := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData0.Cells[3, SG_HiddenData0.RowCount-1] := Csel_gfd(4); // 평가이미지내용
    SG_HiddenData0.Cells[6, SG_HiddenData0.RowCount-1] := Csel_gfd(6); // 1차평가점수

    if var_no = 'e2' then  //하은영
      SG_HiddenData0.Cells[7, SG_HiddenData0.RowCount-1] := Csel_gfd(7) // 2차평가점수
    else
      SG_HiddenData0.Cells[7, SG_HiddenData0.RowCount-1] := Csel_gfd(10); // 2차평가점수

    SG_HiddenData0.Cells[20, SG_HiddenData0.RowCount-1] := Csel_gfd(5);  //자기평가점수

    //SG_HiddenData0.Cells[21, SG_HiddenData0.RowCount-1] := Csel_gfd(8);  //상향평가점수

    if Trim(Csel_gfd(9)) = '' then
      SG_HiddenData0.Cells[22, SG_HiddenData0.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData0.Cells[22, SG_HiddenData0.RowCount-1] := 'N';

    SG_HiddenData0.Cells[23, SG_HiddenData0.RowCount-1] := 'N'; // 자료 변동 여부

    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum0;


  for i := 0 to SG_Image0.ColCount - 1 do
    for j := 0 to SG_Image0.RowCount -1 do
      SG_Image0.Cells[i, j] := '';
  SG_Image0.RowCount := SG_Image0.FixedRows+1;

(*
  for i := 0 to SG_Score0.ColCount - 1 do
    for j := 0 to SG_Score0.RowCount -1 do
      SG_Score0.Cells[i, j] := '';
//  SG_Score0.RowCount := SG_Score0.FixedRows+1;

  SG_HiddenData0.Tag := -1;
*)
  for i := SG_HiddenData0.FixedRows to SG_HiddenData0.RowCount-1 do
  begin
     if SG_HiddenData0.Tag = -1 then
        SG_HiddenData0.Tag := i;

     if SG_Image0.Cells[SG_Image0.FixedCols, SG_Image0.RowCount-1] <> '' then
     begin
        SG_Image0.RowCount := SG_Image0.RowCount + 1;
//        SG_Score0.RowCount := SG_Score0.RowCount + 1;
     end;

     SG_Image0.Cells[1, SG_Image0.RowCount-1] := SG_HiddenData0.Cells[1, i];
     SG_Image0.Cells[0, SG_Image0.RowCount-1] := SG_HiddenData0.Cells[3, i];

     //자기평가
          if trim(SG_HiddenData0.Cells[20, i]) = '100' then        SG_Image0.Cells[2, SG_Image0.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData0.Cells[20, i]) >= '90' then        SG_Image0.Cells[2, SG_Image0.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData0.Cells[20, i]) >= '80' then        SG_Image0.Cells[2, SG_Image0.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData0.Cells[20, i]) >= '70' then        SG_Image0.Cells[2, SG_Image0.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData0.Cells[20, i]) >= '60' then        SG_Image0.Cells[2, SG_Image0.RowCount-1] := var_GrdD;

     {
     //상향평가점수
          if trim(SG_HiddenData0.Cells[21, i]) = '100' then        SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData0.Cells[21, i]) >= '90' then        SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData0.Cells[21, i]) >= '80' then        SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData0.Cells[21, i]) >= '70' then        SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData0.Cells[21, i]) >= '60' then        SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdD
     else
         SG_Image0.Cells[3, SG_Image0.RowCount-1] := trim(SG_HiddenData0.Cells[21, i]);
     }
     //1차상사평가
          if trim(SG_HiddenData0.Cells[6, i]) = '100' then         SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData0.Cells[6, i]) >= '90' then         SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData0.Cells[6, i]) >= '80' then         SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData0.Cells[6, i]) >= '70' then         SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData0.Cells[6, i]) >= '60' then         SG_Image0.Cells[3, SG_Image0.RowCount-1] := var_GrdD;

(*
     SG_Score0.Cells[0, SG_Score0.RowCount-1] := '';
     SG_Score0.Cells[1, SG_Score0.RowCount-1] := '';
     SG_Score0.Cells[2, SG_Score0.RowCount-1] := '';
     SG_Score0.Cells[3, SG_Score0.RowCount-1] := '';
     SG_Score0.Cells[4, SG_Score0.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData0.Cells[7, i]) = var_ScrS  then     SG_Score0.Cells[0 , SG_Image0.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData0.Cells[7, i]) = var_ScrA  then     SG_Score0.Cells[1 , SG_Image0.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData0.Cells[7, i]) = var_ScrB  then     SG_Score0.Cells[2,  SG_Image0.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData0.Cells[7, i]) = var_ScrC  then     SG_Score0.Cells[3 , SG_Image0.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData0.Cells[7, i]) = var_ScrD  then     SG_Score0.Cells[4,  SG_Image0.RowCount-1] := var_GrdD;
*)

  end;

  if PageControl1.ActivePage = TabSheet1 then SG_Image0.SetFocus;


  /////////////////////////////////////////////////////////////////
  
end;

procedure TFM_Main1.Common_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  //만일 1차 평가자 완료처리 된 자료는 저장처리및 변경처리 못하도록 막는다.


  for i := 0 to SG_HiddenData1.ColCount - 1 do
    for j := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
      SG_HiddenData1.Cells[i, j] := '';
  SG_HiddenData1.RowCount := SG_HiddenData1.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(a.itemname,'' '')||'';''||'+
                    ' nvl('''',''0'')||'';''||'+//to_char(a.imageno)
                    ' nvl(a.itemdesc,'' '')||'';''||'+   //a.imagedesc
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' '' ''||'';''|| '+//' nvl(to_char(d.score),''0'')||'';''||'+    //상향평가점수
                    ' nvl(b.empno,'' '')||'';''||'+
                    ' nvl(to_char(b.e3score),''0'')||'';''||           '+
                    ' nvl(b.OBJYN,''N'')||'';''||           '+
                    ' nvl(b.OBJSAYU,'''')||'';''||          '+
                    ' nvl(b.objopinion, '''')||'';''||      '+
                    ' nvl(b.objopinion2,'''')               '+
              '  FROM petac a, petds b,'+//, petac c,' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              '       (select rabasdate, pempno, ekind, imageno, itemno, round(sum(score)/count(0),2) score' +
              '        from petdl A' +
              '        where pempno  = '''+var_empno+'''' +
              '        and rabasdate = '''+sRabasdate+'''' +
              '        AND EMPNO IN (SELECT EMPNO FROM PESREMAS WHERE RABASDATE=A.RABASDATE AND PEMPNO=A.PEMPNO AND RVALCONYN = ''Y'') '+
              '        group by rabasdate, pempno, ekind, imageno, itemno ) d' +
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
              //  ' AND a.paycl     = ''' +Ppaycl+''''+ // BAND
                ' AND a.ekind     = ''공통역량''' + // 평가구분
              //  ' AND a.rabasdate = c.rabasdate' +
              //  ' AND a.evcno     = c.evcno' + // 평가표번호
              //  ' AND a.paycl     = c.paycl' + // BAND
              //  ' AND a.ekind     = c.ekind' +
              //  ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              //  ' AND a.imageno   = b.imageno(+)' +
                ' AND a.rabasdate = d.rabasdate(+)' +
                ' AND a.ekind     = d.ekind(+)' +
              //  ' AND a.imageno   = d.imageno(+)' +
                ' AND a.itemno    = d.itemno(+)' +
              ' ORDER BY a.itemno';//, a.imageno';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;            edit1.text := sql.text;
    Open;
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1] <> '' then
      SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;

    SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData1.Cells[1, SG_HiddenData1.RowCount-1]:= Csel_gfd(2); // 평가항목명
    SG_HiddenData1.Cells[2, SG_HiddenData1.RowCount-1] := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData1.Cells[3, SG_HiddenData1.RowCount-1]:= Csel_gfd(4); // 평가이미지내용
    SG_HiddenData1.Cells[6, SG_HiddenData1.RowCount-1] := Csel_gfd(6); // 1차평가점수

    if var_no = 'e2' then  //하은영
      SG_HiddenData1.Cells[7, SG_HiddenData1.RowCount-1] := Csel_gfd(7) // 2차평가점수
    else
      SG_HiddenData1.Cells[7, SG_HiddenData1.RowCount-1] := Csel_gfd(10); // 2차평가점수

    SG_HiddenData1.Cells[20, SG_HiddenData1.RowCount-1] := Csel_gfd(5);  //자기평가점수

    //SG_HiddenData1.Cells[21, SG_HiddenData1.RowCount-1] := Csel_gfd(8);  //상향평가점수

    SG_HiddenData1.Cells[11, SG_HiddenData1.RowCount-1] := Csel_gfd(11); // 평가 Petition여부
    SG_HiddenData1.Cells[12, SG_HiddenData1.RowCount-1] := Csel_gfd(12); // 평가 Petition사유
    SG_HiddenData1.Cells[13, SG_HiddenData1.RowCount-1] := Csel_gfd(13); // 평가소견
    SG_HiddenData1.Cells[14, SG_HiddenData1.RowCount-1] := Csel_gfd(14); // 평가소견

    if Trim(Csel_gfd(9)) = '' then
      SG_HiddenData1.Cells[22, SG_HiddenData1.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData1.Cells[22, SG_HiddenData1.RowCount-1] := 'N';

    SG_HiddenData1.Cells[23, SG_HiddenData1.RowCount-1] := 'N'; // 자료 변동 여부

    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum1;


  for i := 0 to SG_Image1.ColCount - 1 do
    for j := 0 to SG_Image1.RowCount -1 do
      SG_Image1.Cells[i, j] := '';
  SG_Image1.RowCount := SG_Image1.FixedRows+1;

  for i := 0 to SG_Score1.ColCount - 1 do
    for j := 0 to SG_Score1.RowCount -1 do
      SG_Score1.Cells[i, j] := '';
//  SG_Score1.RowCount := SG_Score1.FixedRows+1;

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

     //SG_Image1.Cells[1, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[3, i];
     SG_Image1.Cells[1, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[11, i];
     SG_Image1.Cells[0, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[1, i];

     //자기평가
          if trim(SG_HiddenData1.Cells[20, i]) = '100' then        SG_Image1.Cells[2, SG_Image1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[20, i]) >= '90' then        SG_Image1.Cells[2, SG_Image1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[20, i]) >= '80' then        SG_Image1.Cells[2, SG_Image1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[20, i]) >= '70' then        SG_Image1.Cells[2, SG_Image1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[20, i]) >= '60' then        SG_Image1.Cells[2, SG_Image1.RowCount-1] := var_GrdD
     else
         SG_Image1.Cells[2, SG_Image1.RowCount-1] := trim(SG_HiddenData1.Cells[20, i]);

     //상향평가점수
          if trim(SG_HiddenData1.Cells[21, i]) = '100' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[21, i]) >= '90' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[21, i]) >= '80' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[21, i]) >= '70' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[21, i]) >= '60' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdD
     else
         SG_Image1.Cells[3, SG_Image1.RowCount-1] := trim(SG_HiddenData1.Cells[21, i]);

     //1차상사평가
          if trim(SG_HiddenData1.Cells[6, i]) = '100' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[6, i]) >= '90' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[6, i]) >= '80' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[6, i]) >= '70' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[6, i]) >= '60' then        SG_Image1.Cells[3, SG_Image1.RowCount-1] := var_GrdD
     else
         SG_Image1.Cells[3, SG_Image1.RowCount-1] := trim(SG_HiddenData1.Cells[6, i]);
{
     SG_Score1.Cells[0, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[1, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[2, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[3, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[4, SG_Score1.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData1.Cells[7, i]) = var_ScrS  then SG_Score1.Cells[0 , SG_Score1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrE  then SG_Score1.Cells[1 , SG_Score1.RowCount-1] := var_GrdE
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrG  then SG_Score1.Cells[2,  SG_Score1.RowCount-1] := var_GrdG
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrN  then SG_Score1.Cells[3 , SG_Score1.RowCount-1] := var_GrdN
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrU  then SG_Score1.Cells[4,  SG_Score1.RowCount-1] := var_GrdU;
}
  end;

  if PageControl1.ActivePage = TabSheet2 then
     SG_Image1.SetFocus;
end;

procedure TFM_Main1.Leadership_data;
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
                    ' nvl('''',''0'')||'';''||'+ //to_char(a.imageno)
                    ' nvl(a.itemdesc,'' '')||'';''||'+ //a.imagedesc
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' nvl(to_char(d.score),''0'')||'';''||'+ //상향평가점수 계산해야 한다. 현재 어케 할지 모르겠음
                    ' nvl(b.empno,'' '')||'';''||'+
                    ' nvl(to_char(b.e3score),''0'')||'';''||           '+
                    ' nvl(b.OBJYN,''N'')||'';''||           '+
                    ' nvl(b.OBJSAYU,'''')||'';''||          '+
                    ' nvl(b.objopinion, '''')||'';''||      '+
                    ' nvl(b.objopinion2,'''')               '+
              '  FROM petac a, petds b, '+//petacd c,' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              '       (select rabasdate, pempno, ekind, imageno, itemno, round(sum(score)/count(0),2) score' +
              '        from petdl A' +
              '        where pempno  = '''+var_empno+'''' +
              '        and rabasdate = '''+sRabasdate+'''' +
              '        AND EMPNO IN (SELECT EMPNO FROM PESREMAS WHERE RABASDATE=A.RABASDATE AND PEMPNO=A.PEMPNO AND RVALCONYN = ''Y'') '+
              '        group by rabasdate, pempno, ekind, imageno, itemno ) d' +
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
              //  ' AND a.paycl     = ''' + Ppaycl + '''' +// BAND
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
              //  ' AND a.rabasdate = c.rabasdate' +
              //  ' AND a.evcno     = c.evcno' + // 평가표번호
              //  ' AND a.paycl     = c.paycl' + // BAND
              //  ' AND a.ekind     = c.ekind' +
              //  ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              //  ' AND a.imageno   = b.imageno(+)' +
                ' AND a.rabasdate = d.rabasdate(+)' +
                ' AND a.ekind     = d.ekind(+)' +
              //  ' AND a.imageno   = d.imageno(+)' +
                ' AND a.itemno    = d.itemno(+)' +
              ' ORDER BY a.itemno';//, a.imageno';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData2.Cells[0, SG_HiddenData2.RowCount-1] <> '' then
      SG_HiddenData2.RowCount := SG_HiddenData2.RowCount + 1;

    SG_HiddenData2.Cells[0, SG_HiddenData2.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData2.Cells[1, SG_HiddenData2.RowCount-1]:=   Csel_gfd(2); // 평가항목명
    SG_HiddenData2.Cells[2, SG_HiddenData2.RowCount-1] :=  Csel_gfd(3); // 평가이미지번호
    SG_HiddenData2.Cells[3, SG_HiddenData2.RowCount-1]:=   Csel_gfd(4); // 평가이미지내용
    SG_HiddenData2.Cells[6, SG_HiddenData2.RowCount-1] :=  Csel_gfd(6); // 1차평가점수

    if var_no = 'e2' then  //하은영
      SG_HiddenData2.Cells[7, SG_HiddenData2.RowCount-1] :=  Csel_gfd(7) // 2차평가점수
    else
      SG_HiddenData2.Cells[7, SG_HiddenData2.RowCount-1] :=  Csel_gfd(10); // 2차평가점수


    SG_HiddenData2.Cells[20, SG_HiddenData2.RowCount-1] := Csel_gfd(5);  //자기평가점수

    SG_HiddenData2.Cells[21, SG_HiddenData2.RowCount-1] := Csel_gfd(8);  //상향평가점수

    SG_HiddenData2.Cells[11, SG_HiddenData2.RowCount-1] := Csel_gfd(11); // 평가 Petition여부
    SG_HiddenData2.Cells[12, SG_HiddenData2.RowCount-1] := Csel_gfd(12); // 평가 Petition사유
    SG_HiddenData2.Cells[13, SG_HiddenData2.RowCount-1] := Csel_gfd(13); // 평가소견1
    SG_HiddenData2.Cells[14, SG_HiddenData2.RowCount-1] := Csel_gfd(14); // 평가소견2

    if Trim(Csel_gfd(9)) = '' then
      SG_HiddenData2.Cells[22, SG_HiddenData2.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData2.Cells[22, SG_HiddenData2.RowCount-1] := 'N';

    SG_HiddenData2.Cells[23, SG_HiddenData2.RowCount-1] := 'N'; // 자료 변동 여부

    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum2;

  for i := 0 to SG_Image2.ColCount - 1 do
    for j := 0 to SG_Image2.RowCount -1 do
      SG_Image2.Cells[i, j] := '';
  SG_Image2.RowCount := SG_Image2.FixedRows+1;

  for i := 0 to SG_Score2.ColCount - 1 do
    for j := 0 to SG_Score2.RowCount -1 do
      SG_Score2.Cells[i, j] := '';
//  SG_Score2.RowCount := SG_Score2.FixedRows+1;

  SG_HiddenData2.Tag := -1;

  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
  begin
     if SG_HiddenData2.Tag = -1 then
        SG_HiddenData2.Tag := i;

     if SG_Image2.Cells[SG_Image1.FixedCols, SG_Image2.RowCount-1] <> '' then
     begin
        SG_Image2.RowCount := SG_Image2.RowCount + 1;
        SG_Score2.RowCount := SG_Score2.RowCount + 1;
     end;

     //SG_Image2.Cells[1, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[3, i];
     SG_Image2.Cells[1, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[11, i];
     SG_Image2.Cells[0, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[1, i];
     SG_Image2.Cells[2, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[20,i];
     SG_Image2.Cells[3, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[21,i];
     SG_Image2.Cells[4, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[6, i];

     //자기평가
          if trim(SG_HiddenData2.Cells[20, i]) = '100' then        SG_Image2.Cells[2, SG_Image2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[20, i]) >= '90' then        SG_Image2.Cells[2, SG_Image2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[20, i]) >= '80' then        SG_Image2.Cells[2, SG_Image2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[20, i]) >= '70' then        SG_Image2.Cells[2, SG_Image2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[20, i]) >= '60' then        SG_Image2.Cells[2, SG_Image2.RowCount-1] := var_GrdD
     else
         SG_Image2.Cells[2, SG_Image2.RowCount-1] := trim(SG_HiddenData2.Cells[20, i]);

     //상향평가점수
          if trim(SG_HiddenData2.Cells[21, i]) = '100' then        SG_Image2.Cells[3, SG_Image2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[21, i]) >= '90' then        SG_Image2.Cells[3, SG_Image2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[21, i]) >= '80' then        SG_Image2.Cells[3, SG_Image2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[21, i]) >= '70' then        SG_Image2.Cells[3, SG_Image2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[21, i]) >= '60' then        SG_Image2.Cells[3, SG_Image2.RowCount-1] := var_GrdD
     else
         SG_Image2.Cells[3, SG_Image2.RowCount-1] := trim(SG_HiddenData2.Cells[21, i]);

     //1차상사평가
          if trim(SG_HiddenData2.Cells[6, i]) = '100' then        SG_Image2.Cells[4, SG_Image2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[6, i]) >= '90' then        SG_Image2.Cells[4, SG_Image2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[6, i]) >= '80' then        SG_Image2.Cells[4, SG_Image2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[6, i]) >= '70' then        SG_Image2.Cells[4, SG_Image2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[6, i]) >= '60' then        SG_Image2.Cells[4, SG_Image2.RowCount-1] := var_GrdD
     else
         SG_Image2.Cells[4, SG_Image2.RowCount-1] := trim(SG_HiddenData2.Cells[6, i]);
  end;

  if PageControl1.ActivePage = TabSheet3 then
     SG_Image2.SetFocus;

end;

function TFM_Main1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DataModule_Tmax.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
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

procedure TFM_Main1.BT_ExitClick(Sender: TObject);
begin
   if MessageBox(handle,PChar(ED_empno.Text +' '+L_payraname.ValueCaption+'의 평가작업을 종료하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) = IDYES then
   begin
       close;
   end;
end;

procedure TFM_Main1.SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image1.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image1.Canvas.Font.Color  := clBlack;
    SG_Image1.Canvas.Font.Style  := [fsBold];
    SG_Image1.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image1.Cells[ACol, ARow];
  SG_Image1.Canvas.FillRect(Rect);

  if (ACol = 0) or(ACol = 1) then
  begin
      SG_Image1.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image1.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    //liLeft := (((Rect.Right - Rect.Left)
    //           - SG_Image1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
   // liTop := (((Rect.Bottom - Rect.Top)
   //            - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    liLeft := Rect.Left +3;
    liTop := Rect.Top + 30;
    SG_Image1.ColWidths[ACol]   := 45;
    SG_Image1.Canvas.Font.Style := [fsBold];
    SG_Image1.Canvas.Font.Size  := 10;
    SG_Image1.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    SG_Image1.ColWidths[ACol]   := 500;
    DrawText(SG_Image1.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

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
       if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrS  then  SB_S1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrA  then  SB_A1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrB  then  SB_B1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrC  then  SB_C1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrD  then  SB_D1.Down  := True;

   P_ControlButton1.Visible := True;

  SG_Image1Click(Sender);
end;

procedure TFM_Main1.SB_S1Click(Sender: TObject);
var
  lsScore : String;
begin
  if ((var_Ekind = '공통역량')   and (var_Able2 = 'Y')) then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 '+
                       '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    Exit;
  end;
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData1.Cells[7, SG_HiddenData1.Tag+SG_Image1.Row] := lsScore;
    SG_HiddenData1.Cells[23, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';
{
    SG_Score1.Cells[0, SG_Image1.Row]:= '';
    SG_Score1.Cells[1, SG_Image1.Row]:= '';
    SG_Score1.Cells[2, SG_Image1.Row]:= '';
    SG_Score1.Cells[3, SG_Image1.Row]:= '';
    SG_Score1.Cells[4, SG_Image1.Row]:= '';

         if SB_S1.Down  then SG_Score1.Cells[0, SG_Image1.Row]:= var_GrdS
    else if SB_A1.Down  then SG_Score1.Cells[1, SG_Image1.Row]:= var_GrdA
    else if SB_B1.Down  then SG_Score1.Cells[2, SG_Image1.Row]:= var_GrdB
    else if SB_C1.Down  then SG_Score1.Cells[3, SG_Image1.Row]:= var_GrdC
    else                     SG_Score1.Cells[4, SG_Image1.Row]:= var_GrdD ;
}
  end else
  begin
    SG_HiddenData1.Cells[7, SG_HiddenData1.Tag+SG_Image1.Row] := '0';
    SG_HiddenData1.Cells[23, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';
{
    SG_Score1.Cells[0 , SG_Image1.Row] := '';
    SG_Score1.Cells[1 , SG_Image1.Row] := '';
    SG_Score1.Cells[2 , SG_Image1.Row] := '';
    SG_Score1.Cells[3 , SG_Image1.Row] := '';
    SG_Score1.Cells[4 , SG_Image1.Row] := '';
}
  end;
  ShowSum1;
end;

procedure TFM_Main1.BT_Save1Click(Sender: TObject);
var
  i, j : Integer;
  isum : Double;
  SqlText: String;
  vBandUp, vBandText, vMoveDept, vStudy : String;
begin
   if PageControl1.ActivePage = TabSheet1 then
   begin
      //VALUE평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData0.RowCount -1 do
      begin
         if (trim(SG_HiddenData0.Cells[7, i]) = '0') or ((trim(SG_HiddenData0.Cells[7, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      if ((OM_Merit_V1.Text = '') or (OM_Merit_V2.Text = '')) then
      begin
          MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                            '작업순서오류',MB_ICONWARNING);
          System.Exit;
      end;

      for i := SG_HiddenData0.FixedRows to SG_HiddenData0.RowCount-1 do
      begin
         if SG_HiddenData0.Cells[23, i] <> 'Y' then // 자료변동 여부
          Continue;

         if SG_HiddenData0.Cells[7, i] = '' then // 2차 평가점수가 null
         begin
           SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                      ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // 피평가자
                      ' AND ekind = ''Values''' +
                      ' AND itemno = '+SG_HiddenData0.Cells[0, i]+'' +
                      ' AND imageno = '+SG_HiddenData0.Cells[2, i]+'';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData0.Cells[22, i] := 'Y'; // 신규로 설정
         end
         else if SG_HiddenData0.Cells[22, i] = 'Y' then // 신규이면...
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                               ' (rabasdate, empno, ekind, itemno, imageno, e2score) ' +
                               'VALUES ('''+srabasdate+''','+
                               ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                               ' ''Values'',' +
                               ' '+SG_HiddenData0.Cells[0, i]+','+
                               ' '+SG_HiddenData0.Cells[2, i]+','+
                               ' '+SG_HiddenData0.Cells[7, i]+') '  //2차 평가점수
           else
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                               ' (rabasdate, empno, ekind, itemno, imageno, e3score) ' +
                               'VALUES ('''+srabasdate+''','+
                               ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                               ' ''Values'',' +
                               ' '+SG_HiddenData0.Cells[0, i]+','+
                               ' '+SG_HiddenData0.Cells[2, i]+','+
                               ' '+SG_HiddenData0.Cells[7, i]+') ';  //2차 평가점수

           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData0.Cells[22, i] := 'N'; // 신규 아님
         end
         else
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'UPDATE petds ' + // 능력태도자기평가
                          ' SET e2score = '+SG_HiddenData0.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                          ' AND empno   = '''+var_empno+'''' + // 평가자
                          ' AND ekind   = ''Values''' +
                          ' AND itemno  = '+SG_HiddenData0.Cells[0, i]+'' +
                          ' AND imageno = '+SG_HiddenData0.Cells[2, i]+''
           else
             SqlText := 'UPDATE petds ' + // 능력태도자기평가
                          ' SET e3score = '+SG_HiddenData0.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                          ' AND empno   = '''+var_empno+'''' + // 평가자
                          ' AND ekind   = ''Values''' +
                          ' AND itemno  = '+SG_HiddenData0.Cells[0, i]+'' +
                          ' AND imageno = '+SG_HiddenData0.Cells[2, i]+'';

           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData0.Cells[22, i] := 'N'; // 신규 아님
         end;

         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;

      if var_no = 'e2' then  //하은영
         SqlText := 'update petremas '+
                    '   set V2SCORE = '+ L_First20.Caption +
                    ' WHERE rabasdate = '''+srabasdate+''''+
                    '   AND empno  = '''+var_empno+''''
      else
         SqlText := 'update petremas '+
                    '   set V3SCORE = '+ L_First20.Caption +
                    ' WHERE rabasdate = '''+srabasdate+''''+
                    ' AND empno  = '''+var_empno+'''';
      with DBSet_dml do
      begin
         Close;
         ServiceName := 'PET1010A_dml';
         ClearFieldInfo;
         SQL.Text := SqlText;
         Execute;
      end;

      for i := SG_HiddenData0.FixedRows to SG_HiddenData0.RowCount-1 do
         SG_HiddenData0.Cells[23, i] := 'N';

      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Value_data;
   end
   else
   if PageControl1.ActivePage = TabSheet2 then
   begin
      //공통역량평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData1.RowCount -1 do
      begin
         if (trim(SG_HiddenData1.Cells[7, i]) = '0') or ((trim(SG_HiddenData1.Cells[7, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      if ((OM_Merit_C1.Text = '') or (OM_Merit_C2.Text = '')) then
      begin
          MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                            '작업순서오류',MB_ICONWARNING);
          System.Exit;
      end;

      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
      begin
         if SG_HiddenData1.Cells[23, i] <> 'Y' then // 자료변동 여부
          Continue;

         if SG_HiddenData1.Cells[7, i] = '' then // 2차 평가점수가 null
         begin
           SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                      ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // 피평가자
                      ' AND ekind = ''공통역량''' +
                      ' AND itemno = '+SG_HiddenData1.Cells[0, i]+'' +
                      ' AND imageno = '+SG_HiddenData1.Cells[2, i]+'';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData1.Cells[22, i] := 'Y'; // 신규로 설정
         end
         else if SG_HiddenData1.Cells[22, i] = 'Y' then // 신규이면...
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                               ' (rabasdate, empno, ekind, itemno, imageno, e2score) ' +
                               'VALUES ('''+srabasdate+''','+
                               ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                               ' ''공통역량'',' +
                               ' '+SG_HiddenData1.Cells[0, i]+','+
                               ' '+SG_HiddenData1.Cells[2, i]+','+
                               ' '+SG_HiddenData1.Cells[7, i]+') '  //2차 평가점수
           else
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                               ' (rabasdate, empno, ekind, itemno, imageno, e3score) ' +
                               'VALUES ('''+srabasdate+''','+
                               ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                               ' ''공통역량'',' +
                               ' '+SG_HiddenData1.Cells[0, i]+','+
                               ' '+SG_HiddenData1.Cells[2, i]+','+
                               ' '+SG_HiddenData1.Cells[7, i]+') ';  //2차 평가점수

           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData1.Cells[22, i] := 'N'; // 신규 아님
         end
         else
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'UPDATE petds ' + // 능력태도자기평가
                          ' SET e2score = '+SG_HiddenData1.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                          ' AND empno = '''+var_empno+'''' + // 평가자
                          ' AND ekind = ''공통역량''' +
                          ' AND itemno = '+SG_HiddenData1.Cells[0, i]+'' +
                          ' AND imageno = '+SG_HiddenData1.Cells[2, i]+''
           else
             SqlText := 'UPDATE petds ' + // 능력태도자기평가
                          ' SET e3score = '+SG_HiddenData1.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                          ' AND empno = '''+var_empno+'''' + // 평가자
                          ' AND ekind = ''공통역량''' +
                          ' AND itemno = '+SG_HiddenData1.Cells[0, i]+'' +
                          ' AND imageno = '+SG_HiddenData1.Cells[2, i]+'';

           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData1.Cells[22, i] := 'N'; // 신규 아님
         end;

         //2차역량평가점수를 계산한다.
         isum := StrToFloat(L_First21.Caption);
         isum := isum + StrToFloat(L_First22.Caption);
         iSum := (Round(iSum/2*10000)/10000);

         if var_no = 'e2' then  //하은영
            SqlText := 'update petremas '+
                       '   set E2SCORE = '+ FloatToStr(isum) +
                       ' WHERE rabasdate = '''+srabasdate+''''+
                       '   AND empno  = '''+var_empno+''''
         else
            SqlText := 'update petremas '+
                       '   set E3SCORE = '+ FloatToStr(isum) +
                       ' WHERE rabasdate = '''+srabasdate+''''+
                       ' AND empno  = '''+var_empno+'''';
         with DBSet_dml do
         begin
            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            SQL.Text := SqlText;
            Execute;
         end;

         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;

      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
         SG_HiddenData1.Cells[23, i] := 'N';

      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Common_data;

   end
   else  if PageControl1.ActivePage = TabSheet3 then
   begin
      for i := 0 to SG_HiddenData2.RowCount -1 do
      begin
         //if trim(SG_HiddenData2.Cells[7, i]) = '' then 하은영
         if (trim(SG_HiddenData2.Cells[7, i]) = '0') or ((trim(SG_HiddenData2.Cells[7, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      if ((OM_Merit_R1.Text = '') or (OM_Merit_R2.Text = '')) then
      begin
          MessageBox(handle,'장단점을 등록하시기 바랍니다.',
                            '작업순서오류',MB_ICONWARNING);
          System.Exit;
      end;

      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
      begin
         if SG_HiddenData2.Cells[23, i] <> 'Y' then // 자료변동 여부
          Continue;

         if SG_HiddenData2.Cells[7, i] = '' then // 2차 평가점수가 null
         begin
           SqlText := 'DELETE FROM petds' + // 능력태도자기평가
                      ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // 피평가자
                      ' AND ekind = ''리더십역량''' +
                      ' AND itemno = '+SG_HiddenData2.Cells[0, i]+'' +
                      ' AND imageno = '+SG_HiddenData2.Cells[2, i]+'';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData2.Cells[22, i] := 'Y'; // 신규로 설정
         end
         else if SG_HiddenData2.Cells[22, i] = 'Y' then // 신규이면...
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                             ' (rabasdate, empno, ekind, itemno, imageno, e2score) ' +
                             'VALUES ('''+srabasdate+''','+
                             ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                             ' ''리더십역량'',' +
                             ' '+SG_HiddenData2.Cells[0, i]+','+
                             ' '+SG_HiddenData2.Cells[2, i]+','+
                             ' '+SG_HiddenData2.Cells[7, i]+') '  //2차 평가점수
           else
             SqlText := 'INSERT INTO petds ' + // 능력태도상향평가
                             ' (rabasdate, empno, ekind, itemno, imageno, e3score) ' +
                             'VALUES ('''+srabasdate+''','+
                             ' '''+var_empno+''','+ // 자기평가자(접속자사번)
                             ' ''리더십역량'',' +
                             ' '+SG_HiddenData2.Cells[0, i]+','+
                             ' '+SG_HiddenData2.Cells[2, i]+','+
                             ' '+SG_HiddenData2.Cells[7, i]+') ';  //2차 평가점수

           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData2.Cells[22, i] := 'N'; // 신규 아님
         end
         else
         begin
           if var_no = 'e2' then  //하은영
             SqlText := 'UPDATE petds ' +
                        ' SET e2score = '+SG_HiddenData2.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                        ' AND empno = '''+var_empno+'''' + // 평가자
                        ' AND ekind = ''리더십역량''' +
                        ' AND itemno = '+SG_HiddenData2.Cells[0,  i]+'' +
                        ' AND imageno = '+SG_HiddenData2.Cells[2, i]+''
           else
             SqlText := 'UPDATE petds ' +
                        ' SET e3score = '+SG_HiddenData2.Cells[7, i]+' ' +
                        ' WHERE rabasdate = '''+srabasdate+'''' +
                        ' AND empno = '''+var_empno+'''' + // 평가자
                        ' AND ekind = ''리더십역량''' +
                        ' AND itemno = '+SG_HiddenData2.Cells[0,  i]+'' +
                        ' AND imageno = '+SG_HiddenData2.Cells[2, i]+'';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
           SG_HiddenData2.Cells[22, i] := 'N'; // 신규 아님
         end;

         //2차역량평가점수를 계산한다.
         isum := StrToFloat(L_First21.Caption);
         isum := isum + StrToFloat(L_First22.Caption);
         iSum := (Round(iSum/2*10000)/10000);

         if var_no = 'e2' then  //하은영
            SqlText := 'update petremas '+
                       '   set E2SCORE = '+ FloatToStr(isum) +
                       ' WHERE rabasdate = '''+srabasdate+''''+
                       '   AND empno  = '''+var_empno+''''
         else
            SqlText := 'update petremas '+
                       '   set E3SCORE = '+ FloatToStr(isum) +
                       ' WHERE rabasdate = '''+srabasdate+''''+
                       ' AND empno  = '''+var_empno+'''';
         with DBSet_dml do
         begin
            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            SQL.Text := SqlText;
            Execute;
         end;

         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;

      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
         SG_HiddenData2.Cells[23, i] := 'N';

      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Leadership_data;
   end
   else  if PageControl1.ActivePage = TabSheet4 then
   begin
        if MessageBox(handle,PChar('[업적평가 승인]를 하시겠습니까?'), '확 인',MB_YESNO or MB_DEFBUTTON2) <> IDYES then System.exit;

        with DBSet_dml do
        begin
             Close;
             SQL.Clear;
             SQL.Text := Format('UPDATE pehremas                                                          '+
                                '   SET e2valconyn   = ''Y'',                                             '+
                                '       e2valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8) '+
                                ' WHERE rabasdate    = ''%s'' AND empno = ''%s'' ',  [sRabasDate,var_empno]);
             Close;
             ServiceName := 'PET1010A_dml';
             ClearFieldInfo;
             Execute;

             MessageDlg('[업적평가] 승인완료 되었습니다.', mtInformation, [mbOK], 0);
        end;
   end
   else  if PageControl1.ActivePage = TabSheet5 then
   begin
      if var_no = 'e2' then
      begin
           if pos('Max 1000Byte', Memo_E2.Text) > 0 then  Memo_E2.Text := '';
           if Length(Memo_E2.Text) < 30 then
           begin
                MessageDlg('2차 평가자 종합의견을 성의껏 등록하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                System.Exit;
           end;

           SQLText := 'UPDATE petremas                                '+      //dsa2000  2008.09. Modify
                      '   SET E2valview   = '''+ Memo_E2.Text     +'''  '+
                      ' WHERE rabasdate   = '''+ sRabasDate       +'''  '+
                      '   AND empno       = '''+ var_empno        +'''  ';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
      end
      else
      begin
           if pos('Max 1000Byte', Memo_E3.Text) > 0 then  Memo_E3.Text := '';
           if Length(Memo_E3.Text) < 30 then
           begin
                MessageDlg('3차 평가자 종합의견을 성의껏 등록하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
                System.Exit;
           end;

           SQLText := 'UPDATE petremas                                '+      //dsa2000  2008.09. Modify
                      '   SET E3valview   = '''+ Memo_E3.Text     +'''  '+
                      ' WHERE rabasdate   = '''+ sRabasDate       +'''  '+
                      '   AND empno       = '''+ var_empno        +'''  ';
           DataModule_Tmax.Cupd_SQL := SqlText;
           DataModule_Tmax.Cupd_Exec;
      end;
      MessageDlg('종합의견이 저장되었습니다.', mtWarning, [mbOK], 0);
   end;
end;

function TFM_Main1.IsDataModified0: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData0.FixedRows to SG_HiddenData0.RowCount -1 do
    if SG_HiddenData0.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
end;

function TFM_Main1.IsDataModified1: Boolean;
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

function TFM_Main1.IsDataModified2: Boolean;
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

procedure TFM_Main1.PageControl1Change(Sender: TObject);
begin
  if var_Ekind <> '' then
  begin
    if (Bt_Save1.Visible) and (IsDataModified0 or IsDataModified1 or IsDataModified2 ) then
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
                 '작업순서오류',MB_ICONWARNING);

      If       var_Ekind = 'Values' then
          PageControl1.ActivePage := TabSheet1
      else if  var_Ekind = '공통역량' then
          PageControl1.ActivePage := TabSheet2
      else if  var_Ekind = '리더십역량' then
          PageControl1.ActivePage := TabSheet3
      else if  var_Ekind = '업적' then
          PageControl1.ActivePage := TabSheet4
      else if  var_Ekind = '종합의견' then
          PageControl1.ActivePage := TabSheet5;

      System.Exit;
    end;
  end;

  if (var_Able2 = 'Y') then
  begin
    E_MoveText1.readonly   := true;
    E_Study1.readonly      := true;
    RB_BandUp11.enabled    := False;
    RB_BandUp21.enabled    := False;
    RB_BandUp31.enabled    := False;
    RB_BandUp41.enabled    := False;
    RB_BandUp51.enabled    := False;
    RB_MoveDept11.enabled  := False;
    RB_MoveDept21.enabled  := False;
    RB_MoveDept31.enabled  := False;
  end;


  if PageControl1.ActivePage = TabSheet1 then
  begin
     SG_Image0.SetFocus;
     var_Ekind          := 'Values';
     BT_Save1.Visible   := False;
     BT_Cancel1.Visible := False;
     BT_Print.Visible   := False;
  end
  else
  if PageControl1.ActivePage = TabSheet2 then
  begin
     SG_Image1.SetFocus;
     var_Ekind          := '공통역량';
     BT_Save1.Visible   := False;
     BT_Cancel1.Visible := False;
     BT_Print.Visible   := False;
  end
  else
  if PageControl1.ActivePage = TabSheet3 then
  begin
     SG_Image2.SetFocus;
     var_Ekind          := '리더십역량';
     BT_Save1.Visible   := False;
     BT_Cancel1.Visible := False;
     BT_Print.Visible   := False;
  end
  else
  if PageControl1.ActivePage = TabSheet4 then
  begin
     DBG_user.SetFocus;
     var_Ekind          := '업적';
     BT_Save1.Visible   := False;
     BT_Cancel1.Visible := False;
     BT_Save1.Caption   := '업적 평가 승인';
     BT_Cancel1.Caption := '업적 평가 반려';
     BT_Print.Visible   := False;
  end
  else
  if PageControl1.ActivePage = TabSheet5 then
  begin
     BT_Exit.SetFocus;
     var_Ekind          := '종합의견';
     BT_Save1.Visible   := True;
     BT_Cancel1.Visible := True;
     BT_Save1.Caption   := '종합의견 저장';
     BT_Cancel1.Caption := '종합의견 취소';
     BT_Print.Visible   := False;
  end;
  if (PageControl1.ActivePage = TabSheet3) then Print.Visible := True
  Else                                          Print.Visible := False;

  SelectMerit;
end;

procedure TFM_Main1.SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image2.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image2.Canvas.Font.Color  := clBlack;
    SG_Image2.Canvas.Font.Style  := [fsBold];
    SG_Image2.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image2.Cells[ACol, ARow];
  SG_Image2.Canvas.FillRect(Rect);

  if (ACol = 0) or(ACol = 1) then
  begin
      SG_Image2.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image2.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    //liLeft := (((Rect.Right - Rect.Left)
    //           - SG_Image2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    //liTop := (((Rect.Bottom - Rect.Top)
    //           - SG_Image2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    liLeft := Rect.Left +3;
    liTop :=  Rect.Top +30;
    SG_Image2.ColWidths[ACol]   := 45;
    SG_Image2.Canvas.Font.Style := [fsBold];
    SG_Image2.Canvas.Font.Size  := 10;
    SG_Image2.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    SG_Image2.ColWidths[ACol]   := 500;
    DrawText(SG_Image2.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image2.Row < SG_Image2.TopRow then // 현재 row 가 화면위에 있다
    SG_Image2.Row := SG_Image2.TopRow
  else if SG_Image2.Row > (SG_Image2.TopRow + SG_Image2.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image2.Row := SG_Image2.TopRow + SG_Image2.VisibleRowCount-1;

  SG_Score2.TopRow := SG_Image2.TopRow;
  SG_Score2.Row    := SG_Image2.Row;

{  // 버튼의 top 위치를 계산
  P_ControlButton2.Top := (SG_Image2.Row - SG_Image2.TopRow) *
                         (SG_Image2.DefaultRowHeight + SG_Image2.GridLineWidth) + 2;
  // 점수를 버튼에 반영
  SB_S2.Down   := False;
  SB_A2.Down   := False;
  SB_B2.Down   := False;
  SB_C2.Down   := False;
  SB_D2.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrS  then  SB_S2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrA  then  SB_A2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrB  then  SB_B2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrC  then  SB_C2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrD  then  SB_D2.Down  := True;
}

   P_ControlButton2.Visible := True;
   SG_Image2Click(Sender);
end;

procedure TFM_Main1.Bt_ConfirmClick(Sender: TObject);
var SqlText : string;
    isum : Double;
begin
   SqlText      := 'SELECT                                           '+
                   ' nvl(        E2valconyn      ,'' '') || '';'' || '+ //종합의견2차
                   ' nvl(        E3valconyn      ,'' '')             '+ //종합의견3차
                   ' FROM pehremas                                    '+
                   'WHERE rabasdate = '''+srabasdate+'''             '+
                   '  AND empno     = '''+var_empno+'''              '; // 평가자

   with DataModule_Tmax.TMaxDataSet_HInsa do
   begin
      Close;
      ServiceName := 'PTA1010B_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 2000);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      if Csel_gfd(1) <> 'Y' then
      begin
          MessageDlg('[업적 평가 승인]을 먼저 하신 후 [2차 상사평가 최종완료]를 하십시오.', mtWarning, [mbOK], 0);
          PageControl1.ActivePage := TabSheet4;
          System.Exit;
      end;
   end;

   SqlText      := 'SELECT                                           '+
                   ' nvl(        E2valview       ,'' '') || '';'' || '+ //종합의견2차
                   ' nvl(        E3valview       ,'' '')             '+ //종합의견3차
                   ' FROM petremas                                    '+
                   'WHERE rabasdate = '''+srabasdate+'''             '+
                   '  AND empno     = '''+var_empno+'''              '; // 평가자

   with DataModule_Tmax.TMaxDataSet_HInsa do
   begin
      Close;
      ServiceName := 'PTA1010B_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 2000);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      if (Csel_gfd(1) <> Memo_E2.Text) then
      begin
          MessageDlg('[종합의견 저장]을 먼저 하신 후 [2차 상사평가 최종완료]를 하십시오.', mtWarning, [mbOK], 0);
          System.Exit;
      end;
   end;

   if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                              '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                              '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
   begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
   end;

   //1차최종평가점수를 계산한다.
   isum := StrToFloat(L_First21.Caption);
   isum := isum + StrToFloat(L_First22.Caption);
   iSum := (Round(iSum/2*10000)/10000);

   //피평가자 평가완료 여부 'Y'로 update
  if var_no = 'e2' then  //하은영
     SqlText := 'update petremas '+
                ' set E2VALCONYN =''Y'''+
                ' ,E2SCORE = '+ FloatToStr(isum) +
                ' ,V2SCORE = '+ L_First20.Caption +
                ' ,e2valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
                ' e2valobjyn= ''N'''+
                ' WHERE rabasdate = '''+srabasdate+''''+
                ' AND empno  = '''+var_empno+''''
   else
     SqlText := 'update petremas '+
                ' set E3VALCONYN =''Y'''+
                ' ,E3SCORE = '+ FloatToStr(isum) +
                ' ,V3SCORE = '+ L_First20.Caption +
                ' ,e3valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
                ' e3valobjyn= ''N'''+
                ' WHERE rabasdate = '''+srabasdate+''''+
                ' AND empno  = '''+var_empno+'''';


   with DBSet_dml do
   begin
      Close;
      ServiceName := 'PET1010A_dml';
      ClearFieldInfo;
      SQL.Text := SqlText;
      Execute;
      BT_Save1.Visible    := false;
      Bt_Confirm.Visible  := false;
      BT_Cancel1.Visible  := false;
      MessageDlg('[ 2차 상사평가 최종완료 ]처리 되었습니다.', mtInformation, [mbOK], 0);
   end;
end;

procedure TFM_Main1.OnFocusButton2Click(Sender: TObject);
begin
  BT_Save1.Visible    := false;
  Bt_Confirm.Visible  := false;
  BT_Cancel1.Visible  := false;
  Notebook1.Pageindex := 1;
  Print.Visible := False;
end;

procedure TFM_Main1.SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
{  SG_Score1.Canvas.Brush.Color := SG_Image1.Color; ///$00F0FFFF;
  for i := 0 to SG_Score1.ColCount -1 do
    if SG_Score1.Cells[i, ARow] <> '' then
    begin
      SG_Score1.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;
}
  if CB_ShowClass1.Checked then // 등급을 보이게...
    SG_Score1.Canvas.Font.Color := SG_Image1.Font.Color
  else
    SG_Score1.Canvas.Font.Color := SG_Score1.Font.Color;

  SG_Score1.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score1.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score1.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Main1.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TFM_Main1.CB_ShowClass1Click(Sender: TObject);
begin
  SG_Score1.Refresh;
end;

procedure TFM_Main1.ShowSum0;
var
  // i : 갯수
  // j : 평가
  // k : 미실시
  // l : 점수 합
  // m : 자기평가합
  // n : 1차평가합
  // p : 상향평가합
  i, j, k, l :integer;
  m, n, p: Real;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0;
  n := 0; p := 0;
  for i := 0 to SG_HiddenData0.RowCount -1 do
  begin
    if (SG_HiddenData0.Cells[7, i] = '0') or
       (SG_HiddenData0.Cells[7, i] = '') then
      inc(k)                                                      //2차 미실시
    else
    begin
      inc(j);                                                     //2차 평가
      l := l + StrToInt(SG_HiddenData0.Cells[7, i]);   //2차 점수
    end;
    m := M + StrTofloat(SG_HiddenData0.Cells[20, i]);//자기평가합
    //p := p + StrTofloat(SG_HiddenData0.Cells[21, i]);//상향평가합
    n := n + StrTofloat(SG_HiddenData0.Cells[ 6, i]);   //1차 점수
  end;

  if (SG_HiddenData0.RowCount = 1) and (SG_HiddenData0.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total0.Caption := IntToStr(j+k);//+'개';
  L_Yes0.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First20.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      점수합 / 총갯수

  if j+k > 0 then
    L_Self0.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       자기평가점수합 / 총갯수
{
  if j+k > 0 then
    L_Up0.Caption  :=
    Formatfloat('#,##0.00', p/(j+k)) ;  //       상향평가점수합 / 총갯수
}
  if j+k > 0 then
    L_First10.Caption  :=
    Formatfloat('#,##0.00', n/(j+k)) ;  //       상사1차평가점수합 / 총갯수

end;

procedure TFM_Main1.ShowSum1;
var
  // i : 갯수
  // j : 평가
  // k : 미실시
  // l : 점수 합
  // m : 자기평가합
  // n : 1차평가합
  // p : 상향평가합
  i, j, k, l:integer;
  m, n, p: Real;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0;
  n := 0; p := 0;
  for i := 0 to SG_HiddenData1.RowCount -1 do
  begin
    if (SG_HiddenData1.Cells[7, i] = '0') or
       (SG_HiddenData1.Cells[7, i] = '') then
      inc(k)                                                      //2차 미실시
    else
    begin
      inc(j);                                                     //2차 평가
      l := l + StrToInt(SG_HiddenData1.Cells[7, i]);   //2차 점수
    end;
    m := M + StrToFloat(SG_HiddenData1.Cells[20, i]);//자기평가합
    //p := p + StrToFloat(SG_HiddenData1.Cells[21, i]);//상향평가합
    n := n + StrToFloat(SG_HiddenData1.Cells[ 6, i]);   //1차 점수
  end;

  if (SG_HiddenData1.RowCount = 1) and (SG_HiddenData1.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total1.Caption := IntToStr(j+k);//+'개';
  L_Yes1.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First21.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      점수합 / 총갯수

  if j+k > 0 then
    L_Self1.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       자기평가점수합 / 총갯수
{
  if j+k > 0 then
    L_Up1.Caption  :=
    Formatfloat('#,##0.00', p/(j+k)) ;  //       상향평가점수합 / 총갯수
}
  if j+k > 0 then
    L_First11.Caption  :=
    Formatfloat('#,##0.00', n/(j+k)) ;  //       상사1차평가점수합 / 총갯수

end;

procedure TFM_Main1.ShowSum2;
var
  // i : 갯수
  // j : 평가
  // k : 미실시
  // l : 점수 합
  // m : 자기평가합
  // p : 상향평가합
  i, j, k, l :integer;
  m, n, p: Real;
begin

  i := 0; j := 0; k := 0; l := 0; m := 0;
  n := 0; p := 0;
  for i := 0 to SG_HiddenData2.RowCount -1 do
  begin
    if (SG_HiddenData2.Cells[7, i] = '0') or
       (SG_HiddenData2.Cells[7, i] = '') then
      inc(k)                                                      //1차 미실시
    else
    begin
      inc(j);                                                     //1차 평가
      l := l + StrToInt(SG_HiddenData2.Cells[7, i]);   //2차 점수
    end;
    m := M + StrTofloat(SG_HiddenData2.Cells[20, i]);//자기평가합
    p := p + StrTofloat(SG_HiddenData2.Cells[21, i]);//상향평가합
    n := n + StrTofloat(SG_HiddenData2.Cells[ 6, i]);        //1차 점수
  end;

  if (SG_HiddenData2.RowCount = 1) and (SG_HiddenData2.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total2.Caption := IntToStr(j+k);//+'개';
  L_Yes2.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First22.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      점수합 / 총갯수

  if j+k > 0 then
    L_Self2.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       자기평가점수합 / 총갯수

  if j+k > 0 then
  Begin
    If (FM_Sub.pESCORE = '') Then FM_Sub.pESCORE := '0';
    L_Up2.Caption := Formatfloat('#,##0.00', StrToFloat(FM_Sub.pESCORE)) ;
  End;

(*
  if j+k > 0 then
  L_Up2.Caption  :=
    Formatfloat('#,##0.00', p/(j+k)) ;  //       상향평가점수합 / 총갯수
*)
  if j+k > 0 then
    L_First12.Caption :=
    Formatfloat('#,##0.00', n/(j+k)) ;  //      1차평가점수

end;


procedure TFM_Main1.SB_S2Click(Sender: TObject);
var
  lsScore : String;
begin
  if ((var_Ekind = '리더십역량')   and  (var_Able2 = 'Y')) then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 '+
                      '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    Exit;
  end;

       if trim(TSpeedButton(Sender).Caption) = var_GrdS  then  lsScore :=  var_ScrS
  else if trim(TSpeedButton(Sender).Caption) = var_GrdA  then  lsScore :=  var_ScrA
  else if trim(TSpeedButton(Sender).Caption) = var_GrdB  then  lsScore :=  var_ScrB
  else if trim(TSpeedButton(Sender).Caption) = var_GrdC  then  lsScore :=  var_ScrC
  else if trim(TSpeedButton(Sender).Caption) = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData2.Cells[7, SG_HiddenData2.Tag+SG_Image2.Row] := lsScore;
    SG_HiddenData2.Cells[23, SG_HiddenData2.Tag+SG_Image2.Row] := 'Y';

{    SG_Score2.Cells[0, SG_Image2.Row]:= '';
    SG_Score2.Cells[1, SG_Image2.Row]:= '';
    SG_Score2.Cells[2, SG_Image2.Row]:= '';
    SG_Score2.Cells[3, SG_Image2.Row]:= '';
    SG_Score2.Cells[4, SG_Image2.Row]:= '';

         if SB_S2.Down  then SG_Score2.Cells[0, SG_Image2.Row]:= var_GrdS
    else if SB_A2.Down  then SG_Score2.Cells[1, SG_Image2.Row]:= var_GrdA
    else if SB_B2.Down  then SG_Score2.Cells[2, SG_Image2.Row]:= var_GrdB
    else if SB_C2.Down  then SG_Score2.Cells[3, SG_Image2.Row]:= var_GrdC
    else if SB_D2.Down  then SG_Score2.Cells[4, SG_Image2.Row]:= var_GrdD ;
}
  end else
  begin
    SG_HiddenData2.Cells[7, SG_HiddenData2.Tag+SG_Image2.Row] := '';
    SG_HiddenData2.Cells[23, SG_HiddenData2.Tag+SG_Image1.Row] := 'Y';
{
    SG_Score2.Cells[0 , SG_Image2.Row] := '';
    SG_Score2.Cells[1 , SG_Image2.Row] := '';
    SG_Score2.Cells[2 , SG_Image2.Row] := '';
    SG_Score2.Cells[3 , SG_Image2.Row] := '';
    SG_Score2.Cells[4 , SG_Image2.Row] := '';
}
  end;
  ShowSum2;
end;

procedure TFM_Main1.SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
{
  SG_Score2.Canvas.Brush.Color := SG_Image2.Color; ///$00F0FFFF;
  for i := 0 to SG_Score2.ColCount -1 do
    if SG_Score2.Cells[i, ARow] <> '' then
    begin
      SG_Score2.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;
}
  if CB_ShowClass2.Checked then // 등급을 보이게...
    SG_Score2.Canvas.Font.Color := SG_Image2.Font.Color
  else
    SG_Score2.Canvas.Font.Color := SG_Score2.Font.Color;

  SG_Score2.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score2.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score2.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;


procedure TFM_Main1.SG_Score2Enter(Sender: TObject);
begin
   SG_Image2.SetFocus;
end;

procedure TFM_Main1.CB_ShowClass2Click(Sender: TObject);
begin
  SG_Score2.Refresh;
end;

procedure TFM_Main1.SG_Image0DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin

  if gdSelected in State then
  begin
    SG_Image0.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image0.Canvas.Font.Color  := clBlack;
    SG_Image0.Canvas.Font.Style  := [fsBold];
    SG_Image0.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image0.Cells[ACol, ARow];
  SG_Image0.Canvas.FillRect(Rect);

  if ACol = 0 then
  begin
      SG_Image0.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image0.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image0.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or (ACol = 3) or (ACol = 4) or (ACol = 5) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_Image1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop  := (((Rect.Bottom - Rect.Top)
               - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
//    liLeft := Rect.Left +3;
//    liTop := Rect.Top + 30;
    SG_Image0.ColWidths[ACol]   := 41;
    SG_Image0.Canvas.Font.Style := [fsBold];
    SG_Image0.Canvas.Font.Size  := 10;
    SG_Image0.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top   + 22; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left  +  2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image0.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image0.Row < SG_Image0.TopRow then // 현재 row 가 화면위에 있다
    SG_Image0.Row := SG_Image0.TopRow
  else if SG_Image0.Row > (SG_Image0.TopRow + SG_Image0.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image0.Row := SG_Image0.TopRow + SG_Image0.VisibleRowCount-1;
(*
  SG_Score0.TopRow := SG_Image0.TopRow;
  SG_Score0.Row    := SG_Image0.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton0.Top := (SG_Image0.Row - SG_Image0.TopRow) *
                          (SG_Image0.DefaultRowHeight + SG_Image0.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S0.Down   := False;
  SB_A0.Down   := False;
  SB_B0.Down   := False;
  SB_C0.Down   := False;
  SB_D0.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData0.Cells[7, SG_HiddenData0.Tag + SG_Image0.Row]) = var_ScrS  then  SB_S0.Down  := True
  else if trim(SG_HiddenData0.Cells[7, SG_HiddenData0.Tag + SG_Image0.Row]) = var_ScrA  then  SB_A0.Down  := True
  else if trim(SG_HiddenData0.Cells[7, SG_HiddenData0.Tag + SG_Image0.Row]) = var_ScrB  then  SB_B0.Down  := True
  else if trim(SG_HiddenData0.Cells[7, SG_HiddenData0.Tag + SG_Image0.Row]) = var_ScrC  then  SB_C0.Down  := True
  else if trim(SG_HiddenData0.Cells[7, SG_HiddenData0.Tag + SG_Image0.Row]) = var_ScrD  then  SB_D0.Down  := True;
   P_ControlButton0.Visible := True;
*)

end;

procedure TFM_Main1.SG_Score0DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
{  SG_Score0.Canvas.Brush.Color := SG_Image0.Color; ///$00F0FFFF;
  for i := 0 to SG_Score0.ColCount -1 do
    if SG_Score0.Cells[i, ARow] <> '' then
    begin
      SG_Score0.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;
  if CB_ShowClass0.Checked then // 등급을 보이게...
    SG_Score0.Canvas.Font.Color := SG_Image0.Font.Color
  else
    SG_Score0.Canvas.Font.Color := SG_Score0.Font.Color;

  SG_Score0.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score0.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score0.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score0.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score0.Canvas.TextOut(liLeft, liTop, lsBuffer);
}
end;

procedure TFM_Main1.SG_Score0Enter(Sender: TObject);
begin
 SG_Image0.SetFocus;
end;

procedure TFM_Main1.SB_S0Click(Sender: TObject);
var
  lsScore : String;
begin
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
       SG_HiddenData0.Cells[7, SG_HiddenData0.Tag+SG_Image0.Row]  := lsScore;
       SG_HiddenData0.Cells[23, SG_HiddenData0.Tag+SG_Image0.Row] := 'Y';
(*
       SG_Score0.Cells[0, SG_Image0.Row]:= '';
       SG_Score0.Cells[1, SG_Image0.Row]:= '';
       SG_Score0.Cells[2, SG_Image0.Row]:= '';
       SG_Score0.Cells[3, SG_Image0.Row]:= '';
       SG_Score0.Cells[4, SG_Image0.Row]:= '';

            if SB_S0.Down  then SG_Score0.Cells[0, SG_Image0.Row]:= var_GrdS
       else if SB_A0.Down  then SG_Score0.Cells[1, SG_Image0.Row]:= var_GrdA
       else if SB_B0.Down  then SG_Score0.Cells[2, SG_Image0.Row]:= var_GrdB
       else if SB_C0.Down  then SG_Score0.Cells[3, SG_Image0.Row]:= var_GrdC
       else if SB_D0.Down  then SG_Score0.Cells[4, SG_Image0.Row]:= var_GrdD ;
*)
  end
  else
  begin
       SG_HiddenData0.Cells[7,  SG_HiddenData0.Tag+SG_Image0.Row] := '0';
       SG_HiddenData0.Cells[23, SG_HiddenData0.Tag+SG_Image0.Row] := 'Y';
(*
       SG_Score0.Cells[0 , SG_Image0.Row] := '';
       SG_Score0.Cells[1 , SG_Image0.Row] := '';
       SG_Score0.Cells[2 , SG_Image0.Row] := '';
       SG_Score0.Cells[3 , SG_Image0.Row] := '';
       SG_Score0.Cells[4 , SG_Image0.Row] := '';
*)
  end;
  ShowSum0;
end;

procedure TFM_Main1.SG_Image1Click(Sender: TObject);
var
  sqltext : string;
  i, j : integer;
begin
  for i := 0 to SG_Score1.ColCount-1 do
    for j := 0 to SG_Score1.RowCount-1 do
       SG_Score1.Cells[i, j] := '';

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' '' ''||'';''|| '+ //' nvl(to_char(d.score),''0'')||'';''||'+    //상향평가점수 계산해야 한다.
                    ' nvl(b.empno,'' '')||'';''||'+
                    ' nvl(to_char(b.e3score),''0'')'+
              '  FROM petacd a, petds b, petac c,' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              '       (select rabasdate, pempno, ekind, imageno, itemno, round(sum(score)/count(0),2) score' +
              '        from petdl' +
              '        where pempno  = '''+var_empno+'''' +
              '        and rabasdate = '''+sRabasdate+'''' +
              '        group by rabasdate, pempno, ekind, imageno, itemno ) d' +
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
                ' AND a.ekind     = ''공통역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData1.Cells[0, SG_Image1.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
               // ' AND a.imageno   = b.imageno(+)' +
                ' AND a.rabasdate = d.rabasdate(+)' +
                ' AND a.ekind     = d.ekind(+)' +
               // ' AND a.imageno   = d.imageno(+)' +
                ' AND a.itemno    = d.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';
  with DataModule_Tmax.TMaxDataSet_HInsa do
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
  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    TOnMemo(Self.FindComponent('M_image1'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

     //자기평가
          if Csel_gfd(5) = '100' then        SG_Score1.Cells[0, 0] := var_GrdS
     else if Csel_gfd(5) >= '90' then        SG_Score1.Cells[0, 1] := var_GrdA
     else if Csel_gfd(5) >= '80' then        SG_Score1.Cells[0, 2] := var_GrdB
     else if Csel_gfd(5) >= '70' then        SG_Score1.Cells[0, 3] := var_GrdC
     else if Csel_gfd(5) >= '60' then        SG_Score1.Cells[0, 4] := var_GrdD;
{
     //상향평가점수
          if Csel_gfd(8) = '100' then        SG_Score1.Cells[1, 0] := var_GrdS
     else if Csel_gfd(8) >= '90' then        SG_Score1.Cells[1, 1] := var_GrdA
     else if Csel_gfd(8) >= '80' then        SG_Score1.Cells[1, 2] := var_GrdB
     else if Csel_gfd(8) >= '70' then        SG_Score1.Cells[1, 3] := var_GrdC
     else if Csel_gfd(8) >= '60' then        SG_Score1.Cells[1, 4] := var_GrdD;
}
     //1차상사평가
          if Csel_gfd(6) = '100' then        SG_Score1.Cells[1, 0] := var_GrdS
     else if Csel_gfd(6) >= '90' then        SG_Score1.Cells[1, 1] := var_GrdA
     else if Csel_gfd(6) >= '80' then        SG_Score1.Cells[1, 2] := var_GrdB
     else if Csel_gfd(6) >= '70' then        SG_Score1.Cells[1, 3] := var_GrdC
     else if Csel_gfd(6) >= '60' then        SG_Score1.Cells[1, 4] := var_GrdD;


    i := i + 1;
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
end;

procedure TFM_Main1.SG_Image2Click(Sender: TObject);
var
  sqltext : string;
  i, j : integer;
begin
  for i := 0 to SG_Score2.ColCount-1 do
    for j := 0 to SG_Score2.RowCount-1 do
       SG_Score2.Cells[i, j] := '';

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' nvl(to_char(d.score),''0'')||'';''||'+    //상향평가점수 계산해야 한다. 현재 어케 할지 모르겠음
                    ' nvl(b.empno,'' '')||'';''||'+
                    ' nvl(to_char(b.e3score),''0'')'+
              '  FROM petacd a, petds b, petac c,' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              '       (select rabasdate, pempno, ekind, imageno, itemno, round(sum(score)/count(0),2) score' +
              '        from petdl' +
              '        where pempno  = '''+var_empno+'''' +
              '        and rabasdate = '''+sRabasdate+'''' +
              '        group by rabasdate, pempno, ekind, imageno, itemno ) d' +
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData2.Cells[0, SG_Image2.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
//                ' AND a.imageno   = b.imageno(+)' +
                ' AND a.rabasdate = d.rabasdate(+)' +
                ' AND a.ekind     = d.ekind(+)' +
//                ' AND a.imageno   = d.imageno(+)' +
                ' AND a.itemno    = d.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';
  with DataModule_Tmax.TMaxDataSet_HInsa do
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
  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    TOnMemo(Self.FindComponent('M_image2'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

     //자기평가
          if Csel_gfd(5) = '100' then        SG_Score2.Cells[0, 0] := var_GrdS
     else if Csel_gfd(5) >= '90' then        SG_Score2.Cells[0, 1] := var_GrdA
     else if Csel_gfd(5) >= '80' then        SG_Score2.Cells[0, 2] := var_GrdB
     else if Csel_gfd(5) >= '70' then        SG_Score2.Cells[0, 3] := var_GrdC
     else if Csel_gfd(5) >= '60' then        SG_Score2.Cells[0, 4] := var_GrdD;

     //상향평가점수
          if Csel_gfd(8) = '100' then        SG_Score2.Cells[1, 0] := var_GrdS
     else if Csel_gfd(8) >= '90' then        SG_Score2.Cells[1, 1] := var_GrdA
     else if Csel_gfd(8) >= '80' then        SG_Score2.Cells[1, 2] := var_GrdB
     else if Csel_gfd(8) >= '70' then        SG_Score2.Cells[1, 3] := var_GrdC
     else if Csel_gfd(8) >= '60' then        SG_Score2.Cells[1, 4] := var_GrdD;

     //1차상사평가
          if Csel_gfd(6) = '100' then        SG_Score2.Cells[2, 0] := var_GrdS
     else if Csel_gfd(6) >= '90' then        SG_Score2.Cells[2, 1] := var_GrdA
     else if Csel_gfd(6) >= '80' then        SG_Score2.Cells[2, 2] := var_GrdB
     else if Csel_gfd(6) >= '70' then        SG_Score2.Cells[2, 3] := var_GrdC
     else if Csel_gfd(6) >= '60' then        SG_Score2.Cells[2, 4] := var_GrdD;


    i := i + 1;
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
end;

procedure TFM_Main1.Works_data;
var
  SqlText : string;
  i       : Integer;
begin
  with TMaxDataSet_HInsa do            //dsa2000  2008.09. Add
  begin
       SqlText := Format('SELECT TaskAdd1, TaskAdd2, TaskAdd3, TaskAdd4, ''5''  '+
                         '  FROM PETREMAS                                       '+
                         ' WHERE RABASDATE = ''%s''                             '+
                         '   AND EMPNO     = ''%s''                             ',[sRabasdate,var_empno]);
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('Field1' , ftString, 100);
       AddField('Field2' , ftString, 100);
       AddField('Field3' , ftString, 100);
       AddField('Field4' , ftString, 100);
       AddField('Field5' , ftString, 100);

       Close;
       SQl.Clear;
       SQL.Text := Sqltext;
       Open;

       if Fields[0].Text <> '' then
       begin
            E_TaskAdd1.Font.Color := clBlack;
            E_TaskAdd3.Font.Color := clBlack;
            E_TaskAdd1.Text := Fields[0].AsString;
            E_TaskAdd2.Text := Fields[1].AsString+'%';
            E_TaskAdd3.Text := Fields[2].AsString;
            if      Fields[3].AsString = 'S' then E_TaskAdd4.ItemIndex := 0
            else if Fields[3].AsString = 'A' then E_TaskAdd4.ItemIndex := 1
            else if Fields[3].AsString = 'B' then E_TaskAdd4.ItemIndex := 2
            else if Fields[3].AsString = 'C' then E_TaskAdd4.ItemIndex := 3
            else if Fields[3].AsString = 'D' then E_TaskAdd4.ItemIndex := 4;
       end;
 end;

 with TDS_Works do
 begin
      SqlText := Format('SELECT B.RABASDATE,B.EMPNO,B.EMPDATE,B.PAYCLDATE,B.TRDATE,                   '+
                        '       B.JOBGUN,B.PAYCL,B.PAYRA,B.ORGNUM,                                    '+
                        '       B.DEPTCODE,H.DEPTNAME ||'' ''||H.DEPTNA3 DEPTNAME,                    '+
                        '       C.DUTYKINDNAME,                                                     '+
                        '       A.OBJYN,E.CODENAME JOBGUNNAME,                        '+
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
                        '   AND B.ORGNUM = H.ORGNUM AND B.DEPTCODE = H.DEPTCODE ',[srabasdate,var_empno]);


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

      vOrgnum := Fieldbyname('Orgnum').AsString;

      if (FieldByName('OBJYN').AsString = 'Y')  then
      begin
           Bt_Add.Visible      := True;
           Bt_OConfirm.Visible := True;

           if (Lwork = '2차') and (v_e2opinionyn = 'Y') then
           begin
                Bt_Add.Caption  := '평가소견 열람';
                Bt_OConfirm.Enabled := False;
           end;
      end
      else
      begin
           Bt_Add.Visible      := False;
           Bt_OConfirm.Visible := False;
      end;
  end;

  Read_WorkScore;

  //dsa2000  2008.09. 초기화.///////////////////////////////////////////////////
  for i := 1 to 1 do
  begin
//       TOnMemo(Self.FindComponent('E_Opinion1'+inttostr(i))).Clear;
//       TOnMemo(Self.FindComponent('E_Opinion2'+inttostr(i))).Clear;
//       TOnMemo(Self.FindComponent('E_Opinion3'+inttostr(i))).Clear;
//       TOnMemo(Self.FindComponent('Memo_E'    +inttostr(i))).Clear;
//       TOnMemo(Self.FindComponent('E_MoveText'+inttostr(i))).Clear;
//       TOnMemo(Self.FindComponent('E_Study'   +inttostr(i))).Clear;
       TOnRadioButton(Self.FindComponent('RB_BandUp1'  +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_BandUp2'  +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_BandUp3'  +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_BandUp4'  +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_BandUp5'  +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_MoveDept1'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_MoveDept2'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_MoveDept3'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_Study1'   +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_Study2'   +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_Study3'   +IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB_Study4'   +IntToStr(i))).Checked := False;
  end;

  //dsa2000  2008.09.///////////////////////////////////////////////////////////
  with TMaxDataSet_HInsa do
  begin
       ServiceName := 'HINSA_select3';
       Close;
       Sql.Clear;
       Sql.Text := 'select E1Opinion1, E1Opinion2, E1Opinion3, E1valview, E1BANDUP '+#13+
                   '  from petremas                                                '+#13+
                   ' where rabasdate = '''+ sRabasDate +'''                        '+#13+
                   '   and empno     = '''+ var_empno  +'''                        ';
       ClearFieldInfo;
       AddField('field1', ftString, 2000);
       AddField('field2', ftString, 2000);
       AddField('field3', ftString, 2000);
       AddField('field4', ftString, 2000);
       AddField('field5', ftString, 2000);

       Open;

       if (fields[0].AsString <> '' ) or (fields[1].AsString <> '' ) or (fields[2].AsString <> '' ) or
          (fields[3].AsString <> '' ) or (fields[4].AsString <> '' ) then
       begin
           if Fields[4].AsString = '1' then RB_BandUp11.Checked := True;
           if Fields[4].AsString = '2' then RB_BandUp21.Checked := True;
           if Fields[4].AsString = '3' then RB_BandUp31.Checked := True;
           if Fields[4].AsString = '4' then RB_BandUp41.Checked := True;
           if Fields[4].AsString = '5' then RB_BandUp51.Checked := True;
       end;
       ///////////////
       Close;
       Sql.Clear;
       Sql.Text := 'select E2Opinion1, E2Opinion2, E2Opinion3, E2valview, E2BANDUP '+#13+
                   '  from petremas                                                '+#13+
                   ' where rabasdate = '''+ sRabasDate +'''                        '+#13+
                   '   and empno     = '''+ var_empno  +'''                        ';
       Open;
       if (fields[0].AsString <> '' ) or (fields[1].AsString <> '' ) or (fields[2].AsString <> '' ) or
          (fields[3].AsString <> '' ) or (fields[4].AsString <> '' ) then
       begin
           Memo_E2.Text     := Fields[3].AsString;
       end;
       if  Memo_E2.Text = ''    then Memo_E2.Text     := '피평가자에게 Feedback 되는 내용입니다.'+#13+
                                                         '항목에 대한 의견을 구체적으로 성의껏 작성 바랍니다.'+#13+
                                                         '한글 기준 500자 등록 가능합니다.(Max 1000Byte)';
       if var_no <> 'e2' then
       begin
            Close;
            Sql.Clear;
            Sql.Text := 'select E3Opinion1, E3Opinion2, E3Opinion3, E3valview, E3BANDUP '+#13+
                        '  from petremas                                                '+#13+
                        ' where rabasdate = '''+ sRabasDate +'''                        '+#13+
                        '   and empno     = '''+ var_empno  +'''                        ';
            Open;
            if (fields[0].AsString <> '' ) or (fields[1].AsString <> '' ) or (fields[2].AsString <> '' ) or
               (fields[3].AsString <> '' ) or (fields[4].AsString <> '' ) then
            begin
                Memo_E3.Text     := Fields[3].AsString;
            end;
       end;

       /////////////
       Close;
       Sql.Clear;
       Sql.Text := 'select E1MOVEDEPT, E1MOVETEXT, E1STUDY, E1STUDYTEXT, ''5'' '+#13+
                   '  from petremas                                            '+#13+
                   ' where rabasdate = '''+ sRabasDate +'''                    '+#13+
                   '   and empno     = '''+ var_empno  +'''                    ';
       Open;
       if (fields[0].AsString <> '' ) or (fields[1].AsString <> '' ) or
          (fields[2].AsString <> '' ) or (fields[3].AsString <> '' ) then
       begin
           if Fields[0].AsString = '1' then RB_MoveDept11.Checked := True;
           if Fields[0].AsString = '2' then RB_MoveDept21.Checked := True;
           if Fields[0].AsString = '3' then RB_MoveDept31.Checked := True;
           if Fields[2].AsString = '1' then RB_Study11.Checked := True;
           if Fields[2].AsString = '2' then RB_Study21.Checked := True;
           if Fields[2].AsString = '3' then RB_Study31.Checked := True;
           if Fields[2].AsString = '4' then RB_Study41.Checked := True;
           E_MoveText1.Text  := Fields[1].AsString;
           E_Study1.Text     := Fields[3].AsString;
       end;
       /////////////
  end;
end;

procedure TFM_Main1.OnFocusButton1Click(Sender: TObject);
begin
  if var_Able2 <> 'Y' then
  begin
     BT_Save1.Visible    := true;
     BT_Cancel1.Visible  := true;
     if var_Objyn = 'N' then
        Bt_Confirm.Visible  := true
     else
        Bt_Confirm.Visible  := false;
  end;
  Notebook1.Pageindex := 0;
end;

procedure TFM_Main1.opinion_data;
var
   i : integer;
   ParamVariant : String;
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
                   ' where rabasdate = '''+ srabasdate +'''                           '+#13+
                   '   and empno     = '''+ var_empno  +'''                           ';
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
           // RB_MOVEERA1Click(nil);
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
            FM_Tmax           := TFM_Tmax.Create(Self);
            FM_Tmax.T_Session := FM_Sub.TMaxSession;
            E_MOVEDEPT.Text   := FM_Tmax.GetData('deptname', vOrgnum, vOldEmpDept);
       end;
       E_PROPOSE.Text := FieldByName('PROPOSE').AsString;
       Close;
  end;

  E_PROPOSE.Font.Color := clBlack;

  with TMaxDataSet_HInsa do
  begin
    ServiceName := 'HINSA_select12';

    ParamVariant := ' SELECT MERIT_EVY, MERIT_EVN, MERIT_ECY, MERIT_ECN, '+
                    '        MERIT_ERY, MERIT_ERN, MERIT_EAY, MERIT_EAN, ''F9'', ''F10'' '+
                    '  FROM PEHREMER A '+
                    ' where rabasdate  = ''' + srabasdate +''' ' +
                    '   AND empno      = ''' + var_empno  +''' ' ;
    ClearFieldInfo;
    AddField('MERIT_EVY' ,ftString, 2000);
    AddField('MERIT_EVN' ,ftString, 2000);
    AddField('MERIT_ECY' ,ftString, 2000);
    AddField('MERIT_ECN' ,ftString, 2000);
    AddField('MERIT_ERY' ,ftString, 2000);
    AddField('MERIT_ERN' ,ftString, 2000);
    AddField('MERIT_EAY' ,ftString, 2000);
    AddField('MERIT_EAN' ,ftString, 2000);
    AddField('F9'        ,ftString, 2000);
    AddField('F10'       ,ftString, 2000);
    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    On_MERIT_EVY.Text := Fields[0].AsString;
    On_MERIT_EVN.Text := Fields[1].AsString;
    On_MERIT_ECY.Text := Fields[2].AsString;
    On_MERIT_ECN.Text := Fields[3].AsString;
    On_MERIT_ERY.Text := Fields[4].AsString;
    On_MERIT_ERN.Text := Fields[5].AsString;
  End;
end;

procedure TFM_Main1.ResetAllButton;
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1  do
  begin
    if (Components[i] is TOnSkinButton) then
    begin
//      if (Components[i].Name <> 'SW_1') and (Components[i].Name <> 'SB_2') and (Components[i].Name <> 'SB_9') then
      begin
       (Components[i] As TOnSkinButton).BtnDown    := False;
       (Components[i] As TOnSkinButton).Font.Color := clBlack;
      end;
    end;
  end;
end;

procedure TFM_Main1.DataSource2DataChange(Sender: TObject; Field: TField);
var
   Class1, Class2, Class3, Class4, Class5 : String;
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

    DownClass1.ValueCaption := '';
    DownClass2.ValueCaption := '';
    DownClass3.ValueCaption := '';
    DownClass4.ValueCaption := '';
    DownClass5.ValueCaption := '';

    DownScore1.ValueCaption := '';
    DownScore2.ValueCaption := '';
    DownScore3.ValueCaption := '';
    DownScore4.ValueCaption := '';
    DownScore5.ValueCaption := '';


    //2006.11.22 하은영
    if (FieldByName('OBJYN').AsString = 'Y')  then
    begin
      Bt_Add.Visible      := True;
      Bt_Add.Caption      := '평가소견 열람';
    end
    else
    begin
      Bt_Add.Visible      := False;
    end;

    LSeqno := FieldByName('seqno').AsFloat;

    SaveTask := GetBookmark;

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
{
    // 자기 세부 등급
    SelfClass1.ValueCaption := FieldByName('DETAILRCLASS1').AsString;
    SelfClass2.ValueCaption := FieldByName('DETAILRCLASS2').AsString;
    SelfClass3.ValueCaption := FieldByName('DETAILRCLASS3').AsString;
    SelfClass4.ValueCaption := FieldByName('DETAILRCLASS4').AsString;
    SelfClass5.ValueCaption := FieldByName('DETAILRCLASS5').AsString;
}
    // 상사 세부 점수
    if FieldByName('DETAILESCORE1').AsString <> '0' then DownScore1.ValueCaption := FieldByName('DETAILESCORE1').AsString;
    if FieldByName('DETAILESCORE2').AsString <> '0' then DownScore2.ValueCaption := FieldByName('DETAILESCORE2').AsString;
    if FieldByName('DETAILESCORE3').AsString <> '0' then DownScore3.ValueCaption := FieldByName('DETAILESCORE3').AsString;
    if FieldByName('DETAILESCORE4').AsString <> '0' then DownScore4.ValueCaption := FieldByName('DETAILESCORE4').AsString;
    if FieldByName('DETAILESCORE5').AsString <> '0' then DownScore5.ValueCaption := FieldByName('DETAILESCORE5').AsString;

    //상사 세부 등급 : 평가 최종 완료시까지 개인사원들에게 보이면 절대 안됨. dsa2000
    Class1:= FieldByName('DETAILECLASS1').AsString;
    Class2:= FieldByName('DETAILECLASS2').AsString;
    Class3:= FieldByName('DETAILECLASS3').AsString;
    Class4:= FieldByName('DETAILECLASS4').AsString;
    Class5:= FieldByName('DETAILECLASS5').AsString;
{
    if      Class1 = 'A' then   Class1 := 'E'
    else if Class1 = 'B' then   Class1 := 'G'
    else if Class1 = 'C' then   Class1 := 'N'
    else if Class1 = 'D' then   Class1 := 'U'
    else if Class1 = ''  then   Class1 := '';
    if      Class2 = 'A' then   Class2 := 'E'
    else if Class2 = 'B' then   Class2 := 'G'
    else if Class2 = 'C' then   Class2 := 'N'
    else if Class2 = 'D' then   Class2 := 'U'
    else if Class2 = ''  then   Class2 := '';
    if      Class3 = 'A' then   Class3 := 'E'
    else if Class3 = 'B' then   Class3 := 'G'
    else if Class3 = 'C' then   Class3 := 'N'
    else if Class3 = 'D' then   Class3 := 'U'
    else if Class3 = ''  then   Class3 := '';
    if      Class4 = 'A' then   Class4 := 'E'
    else if Class4 = 'B' then   Class4 := 'G'
    else if Class4 = 'C' then   Class4 := 'N'
    else if Class4 = 'D' then   Class4 := 'U'
    else if Class4 = ''  then   Class4 := '';
    if      Class5 = 'A' then   Class5 := 'E'
    else if Class5 = 'B' then   Class5 := 'G'
    else if Class5 = 'C' then   Class5 := 'N'
    else if Class5 = 'D' then   Class5 := 'U'
    else if Class5 = ''  then   Class5 := '';
}
    if      FieldByName('DETAILRCLASS1').AsString = 'S' then SelfClass1.ValueCaption := var_GrdS
    else if FieldByName('DETAILRCLASS1').AsString = 'A' then SelfClass1.ValueCaption := var_GrdA
    else if FieldByName('DETAILRCLASS1').AsString = 'B' then SelfClass1.ValueCaption := var_GrdB
    else if FieldByName('DETAILRCLASS1').AsString = 'C' then SelfClass1.ValueCaption := var_GrdC
    else if FieldByName('DETAILRCLASS1').AsString = 'D' then SelfClass1.ValueCaption := var_GrdD
    else                                                     SelfClass1.ValueCaption :=  FieldByName('DETAILRCLASS1').AsString;

    if      FieldByName('DETAILRCLASS2').AsString = 'S' then SelfClass2.ValueCaption := var_GrdS
    else if FieldByName('DETAILRCLASS2').AsString = 'A' then SelfClass2.ValueCaption := var_GrdA
    else if FieldByName('DETAILRCLASS2').AsString = 'B' then SelfClass2.ValueCaption := var_GrdB
    else if FieldByName('DETAILRCLASS2').AsString = 'C' then SelfClass2.ValueCaption := var_GrdC
    else if FieldByName('DETAILRCLASS2').AsString = 'D' then SelfClass2.ValueCaption := var_GrdD
    else                                                     SelfClass2.ValueCaption :=  FieldByName('DETAILRCLASS2').AsString;

    if      FieldByName('DETAILRCLASS3').AsString = 'S' then SelfClass3.ValueCaption := var_GrdS
    else if FieldByName('DETAILRCLASS3').AsString = 'A' then SelfClass3.ValueCaption := var_GrdA
    else if FieldByName('DETAILRCLASS3').AsString = 'B' then SelfClass3.ValueCaption := var_GrdB
    else if FieldByName('DETAILRCLASS3').AsString = 'C' then SelfClass3.ValueCaption := var_GrdC
    else if FieldByName('DETAILRCLASS3').AsString = 'D' then SelfClass3.ValueCaption := var_GrdD
    else                                                     SelfClass3.ValueCaption :=  FieldByName('DETAILRCLASS3').AsString;

    if      FieldByName('DETAILRCLASS4').AsString = 'S' then SelfClass4.ValueCaption := var_GrdS
    else if FieldByName('DETAILRCLASS4').AsString = 'A' then SelfClass4.ValueCaption := var_GrdA
    else if FieldByName('DETAILRCLASS4').AsString = 'B' then SelfClass4.ValueCaption := var_GrdB
    else if FieldByName('DETAILRCLASS4').AsString = 'C' then SelfClass4.ValueCaption := var_GrdC
    else if FieldByName('DETAILRCLASS4').AsString = 'D' then SelfClass4.ValueCaption := var_GrdD
    else                                                     SelfClass4.ValueCaption :=  FieldByName('DETAILRCLASS4').AsString;

    if      FieldByName('DETAILRCLASS5').AsString = 'S' then SelfClass5.ValueCaption := var_GrdS
    else if FieldByName('DETAILRCLASS5').AsString = 'A' then SelfClass5.ValueCaption := var_GrdA
    else if FieldByName('DETAILRCLASS5').AsString = 'B' then SelfClass5.ValueCaption := var_GrdB
    else if FieldByName('DETAILRCLASS5').AsString = 'C' then SelfClass5.ValueCaption := var_GrdC
    else if FieldByName('DETAILRCLASS5').AsString = 'D' then SelfClass5.ValueCaption := var_GrdD
    else                                                     SelfClass5.ValueCaption :=  FieldByName('DETAILRCLASS5').AsString;

    if      FieldByName('DETAILECLASS1').AsString = 'S' then DownClass1.ValueCaption := var_GrdS
    else if FieldByName('DETAILECLASS1').AsString = 'A' then DownClass1.ValueCaption := var_GrdA
    else if FieldByName('DETAILECLASS1').AsString = 'B' then DownClass1.ValueCaption := var_GrdB
    else if FieldByName('DETAILECLASS1').AsString = 'C' then DownClass1.ValueCaption := var_GrdC
    else if FieldByName('DETAILECLASS1').AsString = 'D' then DownClass1.ValueCaption := var_GrdD
    else                                                     DownClass1.ValueCaption :=  FieldByName('DETAILECLASS1').AsString;

    if      FieldByName('DETAILECLASS2').AsString = 'S' then DownClass2.ValueCaption := var_GrdS
    else if FieldByName('DETAILECLASS2').AsString = 'A' then DownClass2.ValueCaption := var_GrdA
    else if FieldByName('DETAILECLASS2').AsString = 'B' then DownClass2.ValueCaption := var_GrdB
    else if FieldByName('DETAILECLASS2').AsString = 'C' then DownClass2.ValueCaption := var_GrdC
    else if FieldByName('DETAILECLASS2').AsString = 'D' then DownClass2.ValueCaption := var_GrdD
    else                                                     DownClass2.ValueCaption :=  FieldByName('DETAILECLASS2').AsString;

    if      FieldByName('DETAILECLASS3').AsString = 'S' then DownClass3.ValueCaption := var_GrdS
    else if FieldByName('DETAILECLASS3').AsString = 'A' then DownClass3.ValueCaption := var_GrdA
    else if FieldByName('DETAILECLASS3').AsString = 'B' then DownClass3.ValueCaption := var_GrdB
    else if FieldByName('DETAILECLASS3').AsString = 'C' then DownClass3.ValueCaption := var_GrdC
    else if FieldByName('DETAILECLASS3').AsString = 'D' then DownClass3.ValueCaption := var_GrdD
    else                                                     DownClass3.ValueCaption :=  FieldByName('DETAILECLASS3').AsString;

    if      FieldByName('DETAILECLASS4').AsString = 'S' then DownClass4.ValueCaption := var_GrdS
    else if FieldByName('DETAILECLASS4').AsString = 'A' then DownClass4.ValueCaption := var_GrdA
    else if FieldByName('DETAILECLASS4').AsString = 'B' then DownClass4.ValueCaption := var_GrdB
    else if FieldByName('DETAILECLASS4').AsString = 'C' then DownClass4.ValueCaption := var_GrdC
    else if FieldByName('DETAILECLASS4').AsString = 'D' then DownClass4.ValueCaption := var_GrdD
    else                                                     DownClass4.ValueCaption :=  FieldByName('DETAILECLASS4').AsString;

    if      FieldByName('DETAILECLASS5').AsString = 'S' then DownClass5.ValueCaption := var_GrdS
    else if FieldByName('DETAILECLASS5').AsString = 'A' then DownClass5.ValueCaption := var_GrdA
    else if FieldByName('DETAILECLASS5').AsString = 'B' then DownClass5.ValueCaption := var_GrdB
    else if FieldByName('DETAILECLASS5').AsString = 'C' then DownClass5.ValueCaption := var_GrdC
    else if FieldByName('DETAILECLASS5').AsString = 'D' then DownClass5.ValueCaption := var_GrdD
    else                                                     DownClass5.ValueCaption :=  FieldByName('DETAILECLASS5').AsString;

    if  FieldByName('DETAILECLASS1').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SW_'+CLASS1+'1')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SW_'+CLASS1+'1')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS2').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SW_'+CLASS2+'2')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SW_'+CLASS2+'2')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS3').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SW_'+CLASS3+'3')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SW_'+CLASS3+'3')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS4').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SW_'+CLASS4+'4')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SW_'+CLASS4+'4')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS5').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SW_'+CLASS5+'5')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SW_'+CLASS5+'5')).Font.Color := clWhite;
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
    else begin
       pnl_1.Visible := True;
       DetailCnt     := 1;
    end;
    if FieldByName('detailtask2').AsString = '' then
    begin
       pnl_2.Visible := False;
    end
    else begin
       pnl_2.Visible := True;
       DetailCnt     := 2;
    end;
    if FieldByName('detailtask3').AsString = '' then
    begin
       pnl_3.Visible := False;
    end
    else begin
       pnl_3.Visible := True;
       DetailCnt     := 3;
    end;
    if FieldByName('detailtask4').AsString = '' then
    begin
       pnl_4.Visible := False;
    end
    else begin
       pnl_4.Visible := True;
       DetailCnt     := 4;
    end;
    if FieldByName('detailtask5').AsString = '' then
    begin
       pnl_5.Visible := False;
    end
    else begin
       pnl_5.Visible := True;
       DetailCnt     := 5;
    end;
  end;
end;

procedure TFM_Main1.BT_Cancel1Click(Sender: TObject);
var
  Param : OleVariant;
  Msg   : string;
  ToMail: string;
begin
  if PageControl1.ActivePage = tabsheet1 then
     value_data
  else
  if PageControl1.ActivePage = tabsheet2 then
     common_data
  else
  if PageControl1.ActivePage = tabsheet3 then
     Leadership_data
  else
  if PageControl1.ActivePage = tabsheet4 then
  begin
       Msg := '[반려] 작업을 하시겠습니까 ?.';
       if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then System.Exit;

       SB_Help.Panels[1].Text := ' 반려 작업 처리중입니다.';
       SB_Help.Perform(WM_PAINT,0,0);

       Messagedlg('1차평가자에게 평가반려 메일을 발송합니다.',mtInformation,[MBOK],0);
       ToMail := '1차메일';
       with DBSet_dml do
       begin
            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            SQL.Clear;
            SQL.Text := 'UPDATE petremas                         '+
                        '   SET e1valconyn   = ''N'',            '+
                        '       e1valcondate = '''' ,            '+
                        '       e2valobjyn   = ''Y''             '+
                        ' WHERE rabasdate    = '''+sRabasDate+''''+
                        '   AND empno        = '''+var_empno+''' ';
            Execute;
            var_Objyn := 'Y';
       end;

       // 메일을 보낸다.
       SendProgID  := 'PED1020C'; //프로그램 ID
       SendEmpno   := Gsempno;    //발송자(로그인 사번)
       RcveEmpno   := Le1empno;   //'Z113';
       MailSubject := '[ 업적평가의 [1차평가/'+Ed_empno.Text+']에 대한 반려메일 ]';
       MailBody    := '2차평가자가 ['+Ed_empno.Text+']님의 업적평가를 반려 했습니다..'+#13#13+
                      '재평가를 부탁드리며,'+#13#13+
                      '평가 최종완료전에 해당 피평가자에게 재평가 결과를 공유해 주시기 바랍니다.';
       ReceiveYN   := 'N';
       //if ChkReceive.Checked then ReceiveYN := 'Y';

       if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
       else
       begin
            MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                       '평가반려작업은 처리되었으므로    '+#13+
                       '1차평가자('+Le1empno+'-'+Le1korname+')께 업적평가의 [1차평가/'+Ed_empno.Text+']에 대한 '+#13+
                       '반려 메시지를 [BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
            System.Exit;
       end;

       Bt_Confirm.Visible := false;
  end
  else
  begin
     Works_data;
     Opinion_data;
  end;
end;

procedure TFM_Main1.E_MoveText1Click(Sender: TObject);
begin
  if (Pos('(Max 400Byte)',E_MoveText1.Text)  > 0) then E_MoveText1.Text  := '';
  if (Pos('(Max 400Byte)',E_Study1.Text)     > 0) then E_Study1.Text     := '';
end;

procedure TFM_Main1.E_Opinion11Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',Memo_E2.Text)     > 0) then Memo_E2.Text      := '';
  if (Pos('(Max 1000Byte)',Memo_E3.Text)     > 0) then Memo_E3.Text      := '';
end;

procedure TFM_Main1.SW_S1Click(Sender: TObject);
begin
  if ((var_Ekind = '업적')  and (var_Able1 = 'Y')) then
  begin
    MessageBox(handle,'이미 1차평가가 완료된 자료는 '+
                      '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    Exit;
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
  TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := Copy(TOnSkinButton(Sender).Name,4,1);

  if      Copy(TOnSkinButton(Sender).Name,4,1) ='S' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_ScrS;
       TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdS;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='A' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_ScrA;
       TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdA;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='B' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_ScrB;
       TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdB;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='C' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_ScrC;
       TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdC;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='D' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_ScrD;
       TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := var_GrdD;
  end
  else TOnShapeLabel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '';


end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_Main1.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with DBSet_dml do
  begin
       ServiceName := 'PET1010A_dml';
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

procedure TFM_Main1.Memo_E2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    vMemo_E2 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        vMemo_E2 := copy(Memo_E2.text, 1, Length(Memo_E2.text)-1);
        Memo_E2.Clear;
        Memo_E2.Lines.Append(vMemo_E2);
   end;
end;

procedure TFM_Main1.Bt_AddClick(Sender: TObject);
begin
  try
    Form1 := TForm1.Create(nil); // 역량평가
    //Form1.WindowState := wsMaximized;
    Form1.Lwork :=  Lwork;
    Form1.Le1opinionyn := v_e1opinionyn;
    Form1.Le2opinionyn := v_e2opinionyn;
    Form1.OpenForm := 1;
    if PageControl1.ActivePage = TabSheet4 then
       Form1.WorkTab := 0
    else
    if PageControl1.ActivePage = TabSheet2 then
       Form1.WorkTab := 1
    else
    if PageControl1.ActivePage = TabSheet3 then
       Form1.WorkTab := 1;

    Form1.ShowModal;

    if PageControl1.ActivePage = TabSheet4 then
       works_data
    else
    if PageControl1.ActivePage = TabSheet2 then
       common_data
    else
    if PageControl1.ActivePage = TabSheet3 then
       Leadership_data;
  except
    begin
      if (Form1 <> nil) or Assigned(Form1) then
        begin
          Form1.Free;
          Form1 := nil;
        end;
    end;
   end;
end;

procedure TFM_Main1.SG_Image1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
     if SG_Image1.Cells[1, ARow] = 'Y' then
     begin
       Bt_Add.Visible      := True;
       Bt_OConfirm.Visible := True;
       vImageno        := SG_HiddenData1.Cells[ 2,  ARow];
       vItemno         := SG_HiddenData1.Cells[ 0,  ARow];
       vItemname       := SG_HiddenData1.Cells[ 1,  ARow];
       vOBJYN          := SG_HiddenData1.Cells[11,  ARow];
       vOBJsayu        := SG_HiddenData1.Cells[12,  ARow];
       vOBJopinion     := SG_HiddenData1.Cells[13,  ARow];
       vOBJopinion2    := SG_HiddenData1.Cells[14,  ARow];
       vSelectdRow     := ARow;

       if v_e2opinionyn = 'Y' then
       begin
         Bt_Add.Caption      := '평가소견 열람';
         Bt_OConfirm.Enabled := False;
       end;

     end
     else
     if SG_Image1.Cells[1, ARow] = 'N' then
     begin
       Bt_Add.Visible      := False;
       Bt_OConfirm.Visible := False;
     end;
end;

procedure TFM_Main1.SG_Image2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
     if SG_Image2.Cells[1, ARow] = 'Y' then
     begin
       Bt_Add.Visible      := True;
       Bt_OConfirm.Visible := True;
       vImageno        := SG_HiddenData2.Cells[ 2,  ARow];
       vItemno         := SG_HiddenData2.Cells[ 0,  ARow];
       vItemname       := SG_HiddenData2.Cells[ 1,  ARow];
       vOBJYN          := SG_HiddenData2.Cells[11,  ARow];
       vOBJsayu        := SG_HiddenData2.Cells[12,  ARow];
       vOBJopinion     := SG_HiddenData2.Cells[13,  ARow];
       vOBJopinion2    := SG_HiddenData2.Cells[14,  ARow];
       vSelectdRow     := ARow;

       if v_e2opinionyn = 'Y' then
       begin
         Bt_Add.Caption  := '평가소견 열람';
         Bt_OConfirm.Enabled := False;
       end;
       
     end
     else
     if SG_Image2.Cells[1, ARow] = 'N' then
     begin
       Bt_Add.Visible      := False;
       Bt_OConfirm.Visible := False;
     end;
end;

procedure TFM_Main1.Bt_OConfirmClick(Sender: TObject);
var
  v_cnt : string;
  sWhereSql, snotobj, sUpdateSql,SqlText : string;

  function IsNullField(sw:integer):Boolean;
  var
    SqlStr1 : string;
  begin
    Result := False;

    if sw = 1 then
    begin
         SqlStr1 := format('select count(seqno) cnt from pehreaim_det '+
                           ' where %s ', [sWhereSql]);
    end
    else
    if sw = 11 then
    begin
         SqlStr1 := format('select count(itemno) cnt from petds '+
                           ' where %s ', [sWhereSql]);
    end;

    with FM_Sub.DBSet2 do
    begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlStr1;
         Open;

         if Bof and Eof then exit;
         v_cnt     := FieldByName('SEL_DATA').AsString;
         if v_cnt = '0' then Result := False
         else                Result := True;
    end;
  end;

begin
  if ID_NO = Messagebox(handle,'완료하시면 해당 사원에 대해 평가소견을 등록하실 수 없습니다.'+#13+#13+
                               '계속하시겠습니까?','확인',MB_YESNO or $0030) then   system.exit;

            sWhereSql := format('     rabasdate = ''%s'' '+
                                ' and empno     = ''%s'' '+
                                ' and objyn     = ''Y''  '+
                                ' and objopinion2 is null ', [sRabasDate, var_empno]);
{
  if IsNullField(1) then
  begin
       Messagedlg('업적평가의 평가 Petition한 모든 업무에 대해 평가근거 및 사유를 등록하십시오', mtError,[mbOK],0);
       exit;
  end;
}
  if IsNullField(11) then
  begin
       Messagedlg('역량평가의 평가 Petition한 모든 항목에 대해 평가근거 및 사유를 등록하십시오', mtError,[mbOK],0);
       exit;
  end;

  with DBSet_dml do
  begin
       SQL.Text := format('update pehremas             '+
                          '   set e2opinionyn = ''Y''  '+
                          ' where rabasdate   = ''%s'' '+
                          '   and empno       = ''%s'' ',[sRabasDate, var_empno]);

       Close;
       ServiceName := 'PET1010A_dml';
       ClearFieldInfo;
       Execute;
       Bt_Add.Enabled      := True;               //2006.11.22 하은영
       Bt_Add.Caption      := '평가소견 열람';
       Bt_OConfirm.Enabled := false;
       v_e2opinionyn       := 'Y';
       MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
  end;

  //메일 보내기 시작
  Messagedlg('평가소견등록 완료 메일을 발송합니다.',mtinformation,[mbOK],0);

  //피평가자에게 메일보내기
  //==============================================================================//
  SendProgID  := 'PED1020C';     //프로그램 ID
  SendEmpno   := GSempno;        //발송자(로그인 사번)
  RcveEmpno   := Ed_empno.empno; //'Z113';
  MailSubject := '[ 평가소견 등록 ]';
  MailBody    := '2차평가자인 ['+GSempno+'-'+ Gskorname+']님이 피평가자['+ ED_empno.Text +']님의 '+#13#13+
                 '평가 Petition자료에 대해 평가근거를 등록했습니다.   '+#13#13+
                 '확인 바랍니다.';
  ReceiveYN   := 'N';
  //if ChkReceive.Checked then ReceiveYN := 'Y';

  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else
  begin
       MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                  '평가소견등록작업은 처리되었으므로    '+#13#13+
                  '피평가자['+ ED_empno.Text +']님께 [평가소견 등록] 메시지를 '+#13#13+
                  '[BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
       System.Exit;
  end;
  //==============================================================================//
end;

procedure TFM_Main1.BT_HelpClick(Sender: TObject);
begin
  MessageDlg('[평가 Petition 처리안내]'+#13+#13+
             ' 1. 평가 Petition여부가 Y 인 중점추진업무 또는 평가항목 클릭 '+#13+#13+
             ' 2. 평가소견등록 버튼 클릭후 평가사유등록 및 저장 (평가 Petition이 Y 인 모든 항목별로 전부)'+#13+#13+
             ' 3. 평가소견완료 버튼 클릭'
             , mtInformation, [mbOk], 0);
end;

procedure TFM_Main1.SG_ItemImage0DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin

  if gdSelected in State then
  begin
    SG_ItemImage0.Canvas.Brush.Color := clWhite; // $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_ItemImage0.Canvas.Font.Color  := clBlack;
    SG_ItemImage0.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_ItemImage0.Cells[ACol, ARow];
  SG_ItemImage0.Canvas.FillRect(Rect);

  if ACol = 0 then
  begin
      SG_ItemImage0.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_ItemImage0.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_ItemImage0.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_CENTER or DT_WORDBREAK);
  end
  else if (ACol = 2) or (ACol = 3) or (ACol = 4) or (ACol = 5) then
  begin
    //liLeft := (((Rect.Right - Rect.Left)
    //           - SG_Image1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    //liTop  := (((Rect.Bottom - Rect.Top)
    //           - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    liLeft := Rect.Left +3;
    liTop := Rect.Top + 10;
    SG_ItemImage0.ColWidths[ACol]   := 41;
    SG_ItemImage0.Canvas.Font.Style := [fsBold];
    SG_ItemImage0.Canvas.Font.Size  := 10;
    SG_ItemImage0.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top   + 10; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left  +  2;
    Rect.Right := Rect.Right -  2;
    DrawText(SG_ItemImage0.Canvas.Handle, PChar(lsBuffer),StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;
end;

procedure TFM_Main1.SelectMerit;
Begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    if      (var_Ekind = 'Values')  Then
    Begin
      SqlText := ' SELECT MERIT_JVY field1, MERIT_JVN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End
    Else if (var_Ekind = '공통역량')  Then
    Begin
      SqlText := ' SELECT MERIT_JCY field1, MERIT_JCN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      SqlText := ' SELECT MERIT_JRY field1, MERIT_JRN field2, ''field3'', ''field4'',''field5''  '+
                 '  FROM PEHREMER  ';
    End;

    SqlText := SqlText + ' where rabasdate  = ''' + sRabasDate +''' ' +
                         '   AND empno      = ''' + var_empno  +''' ' ;

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

  with TDS1 do
  begin
    ServiceName := 'HINSA_select12';

    SqlText := ' SELECT MERIT_JVY, MERIT_JVN, MERIT_JCY, MERIT_JCN, '+
               '        MERIT_JRY, MERIT_JRN, MERIT_JAY, MERIT_JAN, ''F9'', ''F10'' '+
               '  FROM PEHREMER A '+
               ' where rabasdate  = ''' + sRabasDate +''' ' +
               '   AND empno      = ''' + var_empno  +''' ' ;
    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('MERIT_JCY' ,ftString, 2000);
    AddField('MERIT_JCN' ,ftString, 2000);
    AddField('MERIT_JRY' ,ftString, 2000);
    AddField('MERIT_JRN' ,ftString, 2000);
    AddField('MERIT_JAY' ,ftString, 2000);
    AddField('MERIT_JAN' ,ftString, 2000);
    AddField('F9'        ,ftString, 2000);
    AddField('F10'       ,ftString, 2000);
    Close;
    SQl.Clear;
    SQL.Text := SqlText;
    Open;

    On_MERIT_JVY.Text := Fields[0].AsString;
    On_MERIT_JVN.Text := Fields[1].AsString;
    On_MERIT_JCY.Text := Fields[2].AsString;
    On_MERIT_JCN.Text := Fields[3].AsString;
    On_MERIT_JRY.Text := Fields[4].AsString;
    On_MERIT_JRN.Text := Fields[5].AsString;
  End;
End;

procedure TFM_Main1.PageControl2Change(Sender: TObject);
begin
  BT_Print.Visible := False;
  opinion_data;
end;

procedure TFM_Main1.BT_PrintClick(Sender: TObject);
begin
  PrintForm := TPrintForm.Create(self);
  PrintForm.QuickRep1.Preview;
end;

procedure TFM_Main1.OnFocusButton3Click(Sender: TObject);
begin
  Notebook1.Pageindex := 2;
  Print.Visible := False;
end;

procedure TFM_Main1.PrintClick(Sender: TObject);
begin
  try
    PrintForm1 := TPrintForm1.Create(Application);
    PrintForm1.var_empno     := var_empno;
    PrintForm1.var_Rabasdate := sRabasdate;
    PrintForm1.QuickRep1.Preview;
  finally
    PrintForm1.free;
  end;
end;

end.
