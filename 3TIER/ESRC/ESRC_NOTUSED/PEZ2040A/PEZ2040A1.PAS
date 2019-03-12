{-------------------------------------------------------------------------------
  o 프로그램명 : 임원 상사/CEO 평가 프로그램
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 평가
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2008.07.
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부

-------------------------------------------------------------------------------}
unit pez2040a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton,
  OnOneInstance, Db, DBAccess, OnEditNumCtl, OnEditBaseCtrl, OnEditStdCtrl,
  Grids, DBGrids, MemDS, jpeg, OnRadioBtn, Pass, TmaxFunc, Tmax_session,
  OnInsaCommon, OnPopupEdit, Tmax_DataSetText, Mask, OnLineLabel,
  OnEditMemo;

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
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    BT_Save: TOnFocusButton;
    BT_Send: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    TabSheet8: TTabSheet;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    BT_Help: TOnFocusButton;
    Pan_Help: TPanel;
    Label25: TLabel;
    Panel15: TPanel;
    BT_HelpExit: TOnFocusButton;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    L_E1Korname: TOnSectionLabel;
    L_E1Paycl: TOnSectionLabel;
    L_E2Korname: TOnSectionLabel;
    L_E2Paycl: TOnSectionLabel;
    L_E3Korname: TOnSectionLabel;
    TabSheet9: TTabSheet;
    Label1: TLabel;
    OnMemo1: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo6: TOnMemo;
    OnMemo7: TOnMemo;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    RB11_5: TOnRadioButton;
    RB11_4: TOnRadioButton;
    RB11_3: TOnRadioButton;
    RB11_2: TOnRadioButton;
    RB11_1: TOnRadioButton;
    RB12_5: TOnRadioButton;
    RB12_4: TOnRadioButton;
    RB12_3: TOnRadioButton;
    RB12_2: TOnRadioButton;
    RB12_1: TOnRadioButton;
    Label4: TLabel;
    E_KPI13: TOnMemo;
    RB_KPI12_5: TOnRadioButton;
    RB_KPI12_4: TOnRadioButton;
    RB_KPI12_3: TOnRadioButton;
    RB_KPI12_2: TOnRadioButton;
    RB_KPI12_1: TOnRadioButton;
    Label10: TLabel;
    E_KPI23: TOnMemo;
    RB_KPI22_5: TOnRadioButton;
    RB_KPI22_4: TOnRadioButton;
    RB_KPI22_3: TOnRadioButton;
    RB_KPI22_2: TOnRadioButton;
    RB_KPI22_1: TOnRadioButton;
    E_KPI33: TOnMemo;
    RB_KPI32_5: TOnRadioButton;
    RB_KPI32_4: TOnRadioButton;
    RB_KPI32_3: TOnRadioButton;
    RB_KPI32_2: TOnRadioButton;
    RB_KPI32_1: TOnRadioButton;
    Label27: TLabel;
    E_KPI11: TOnNumberEdit;
    E_KPI21: TOnNumberEdit;
    E_KPI31: TOnNumberEdit;
    RB21_5: TOnRadioButton;
    RB21_4: TOnRadioButton;
    RB21_3: TOnRadioButton;
    RB21_2: TOnRadioButton;
    RB21_1: TOnRadioButton;
    RB22_5: TOnRadioButton;
    RB22_4: TOnRadioButton;
    RB22_3: TOnRadioButton;
    RB22_2: TOnRadioButton;
    RB22_1: TOnRadioButton;
    RB31_5: TOnRadioButton;
    RB31_4: TOnRadioButton;
    RB31_3: TOnRadioButton;
    RB31_2: TOnRadioButton;
    RB31_1: TOnRadioButton;
    RB32_5: TOnRadioButton;
    RB32_4: TOnRadioButton;
    RB32_3: TOnRadioButton;
    RB32_2: TOnRadioButton;
    RB32_1: TOnRadioButton;
    E_Opinion1: TOnMemo;
    E_Opinion2: TOnMemo;
    OnMemo2: TOnMemo;
    OnMemo3: TOnMemo;
    OnMemo10: TOnMemo;
    Label3: TLabel;
    OnMemo11: TOnMemo;
    OnMemo12: TOnMemo;
    OnMemo13: TOnMemo;
    OnMemo14: TOnMemo;
    OnMemo15: TOnMemo;
    OnMemo16: TOnMemo;
    OnMemo17: TOnMemo;
    RB13_5: TOnRadioButton;
    RB13_4: TOnRadioButton;
    RB13_3: TOnRadioButton;
    RB13_2: TOnRadioButton;
    RB13_1: TOnRadioButton;
    RB14_5: TOnRadioButton;
    RB14_4: TOnRadioButton;
    RB14_3: TOnRadioButton;
    RB14_2: TOnRadioButton;
    RB14_1: TOnRadioButton;
    RB23_4: TOnRadioButton;
    RB23_3: TOnRadioButton;
    RB23_2: TOnRadioButton;
    RB23_1: TOnRadioButton;
    RB24_5: TOnRadioButton;
    RB24_4: TOnRadioButton;
    RB24_3: TOnRadioButton;
    RB24_2: TOnRadioButton;
    RB24_1: TOnRadioButton;
    RB33_5: TOnRadioButton;
    RB33_4: TOnRadioButton;
    RB33_3: TOnRadioButton;
    RB33_2: TOnRadioButton;
    RB33_1: TOnRadioButton;
    RB34_5: TOnRadioButton;
    RB34_4: TOnRadioButton;
    RB34_3: TOnRadioButton;
    RB34_2: TOnRadioButton;
    RB34_1: TOnRadioButton;
    E_Opinion3: TOnMemo;
    E_Opinion4: TOnMemo;
    OnMemo20: TOnMemo;
    OnMemo21: TOnMemo;
    OnMemo22: TOnMemo;
    Label29: TLabel;
    OnMemo23: TOnMemo;
    OnMemo24: TOnMemo;
    OnMemo25: TOnMemo;
    OnMemo26: TOnMemo;
    OnMemo27: TOnMemo;
    OnMemo28: TOnMemo;
    OnMemo29: TOnMemo;
    RB15_5: TOnRadioButton;
    RB15_4: TOnRadioButton;
    RB15_3: TOnRadioButton;
    RB15_2: TOnRadioButton;
    RB15_1: TOnRadioButton;
    RB16_5: TOnRadioButton;
    RB16_4: TOnRadioButton;
    RB16_3: TOnRadioButton;
    RB16_2: TOnRadioButton;
    RB16_1: TOnRadioButton;
    RB25_5: TOnRadioButton;
    RB25_4: TOnRadioButton;
    RB25_3: TOnRadioButton;
    RB25_2: TOnRadioButton;
    RB25_1: TOnRadioButton;
    RB26_5: TOnRadioButton;
    RB26_4: TOnRadioButton;
    RB26_3: TOnRadioButton;
    RB26_2: TOnRadioButton;
    RB26_1: TOnRadioButton;
    RB35_5: TOnRadioButton;
    RB35_4: TOnRadioButton;
    RB35_3: TOnRadioButton;
    RB35_2: TOnRadioButton;
    RB35_1: TOnRadioButton;
    RB36_5: TOnRadioButton;
    RB36_4: TOnRadioButton;
    RB36_3: TOnRadioButton;
    RB36_2: TOnRadioButton;
    RB36_1: TOnRadioButton;
    E_Opinion5: TOnMemo;
    E_Opinion6: TOnMemo;
    OnMemo37: TOnMemo;
    OnMemo38: TOnMemo;
    OnMemo39: TOnMemo;
    BT_Opinion: TOnFocusButton;
    Pan_Opinion: TPanel;
    Panel2: TPanel;
    BT_Opinion2: TOnFocusButton;
    E_OpinionR1: TOnMemo;
    E_OpinionR3: TOnMemo;
    E_OpinionR2: TOnMemo;
    E_OpinionR4: TOnMemo;
    Label2: TLabel;
    OnMemo18: TOnMemo;
    OnMemo19: TOnMemo;
    OnMemo30: TOnMemo;
    OnMemo36: TOnMemo;
    OnMemo40: TOnMemo;
    OnMemo41: TOnMemo;
    OnMemo42: TOnMemo;
    RB17_5: TOnRadioButton;
    RB17_4: TOnRadioButton;
    RB17_3: TOnRadioButton;
    RB17_2: TOnRadioButton;
    RB17_1: TOnRadioButton;
    RB18_5: TOnRadioButton;
    RB18_4: TOnRadioButton;
    RB18_3: TOnRadioButton;
    RB18_2: TOnRadioButton;
    RB18_1: TOnRadioButton;
    RB27_5: TOnRadioButton;
    RB27_4: TOnRadioButton;
    RB27_3: TOnRadioButton;
    RB27_2: TOnRadioButton;
    RB27_1: TOnRadioButton;
    RB28_5: TOnRadioButton;
    RB28_4: TOnRadioButton;
    RB28_3: TOnRadioButton;
    RB28_2: TOnRadioButton;
    RB28_1: TOnRadioButton;
    RB37_5: TOnRadioButton;
    RB37_4: TOnRadioButton;
    RB37_3: TOnRadioButton;
    RB37_2: TOnRadioButton;
    RB37_1: TOnRadioButton;
    RB38_5: TOnRadioButton;
    RB38_4: TOnRadioButton;
    RB38_3: TOnRadioButton;
    RB38_2: TOnRadioButton;
    RB38_1: TOnRadioButton;
    E_Opinion7: TOnMemo;
    E_Opinion8: TOnMemo;
    OnMemo45: TOnMemo;
    OnMemo46: TOnMemo;
    OnMemo47: TOnMemo;
    Label5: TLabel;
    OnMemo31: TOnMemo;
    OnMemo32: TOnMemo;
    RB19_5: TOnRadioButton;
    RB19_4: TOnRadioButton;
    RB19_3: TOnRadioButton;
    RB19_2: TOnRadioButton;
    RB19_1: TOnRadioButton;
    RB29_5: TOnRadioButton;
    RB29_4: TOnRadioButton;
    RB29_3: TOnRadioButton;
    RB29_2: TOnRadioButton;
    RB29_1: TOnRadioButton;
    RB39_5: TOnRadioButton;
    RB39_4: TOnRadioButton;
    RB39_3: TOnRadioButton;
    RB39_2: TOnRadioButton;
    RB39_1: TOnRadioButton;
    E_Opinion9: TOnMemo;
    OnMemo50: TOnMemo;
    OnMemo51: TOnMemo;
    OnMemo33: TOnMemo;
    Label7: TLabel;
    Label14: TLabel;
    E_EMD11: TOnMemo;
    E_EMD13: TOnMemo;
    Label11: TLabel;
    E_Opinion110: TOnMemo;
    RB110_5: TOnRadioButton;
    RB110_4: TOnRadioButton;
    RB110_3: TOnRadioButton;
    RB110_2: TOnRadioButton;
    RB110_1: TOnRadioButton;
    E_Opinion210: TOnMemo;
    RB210_5: TOnRadioButton;
    RB210_4: TOnRadioButton;
    RB210_3: TOnRadioButton;
    RB210_2: TOnRadioButton;
    RB210_1: TOnRadioButton;
    E_Opinion310: TOnMemo;
    RB310_5: TOnRadioButton;
    RB310_4: TOnRadioButton;
    RB310_3: TOnRadioButton;
    RB310_2: TOnRadioButton;
    RB310_1: TOnRadioButton;
    TabSheet10: TTabSheet;
    E_EMD21: TOnMemo;
    E_EMD23: TOnMemo;
    E_EMD31: TOnMemo;
    E_EMD33: TOnMemo;
    E_EMD12: TOnMemo;
    E_EMD22: TOnMemo;
    E_EMD32: TOnMemo;
    Label19: TLabel;
    E_Emd15: TOnMemo;
    RB_Emd14_4: TOnRadioButton;
    RB_Emd14_3: TOnRadioButton;
    RB_Emd14_2: TOnRadioButton;
    RB_Emd14_1: TOnRadioButton;
    E_Emd17: TOnMemo;
    RB_Emd16_5: TOnRadioButton;
    RB_Emd16_3: TOnRadioButton;
    RB_Emd16_2: TOnRadioButton;
    RB_Emd16_1: TOnRadioButton;
    E_Emd25: TOnMemo;
    RB_Emd24_4: TOnRadioButton;
    RB_Emd24_3: TOnRadioButton;
    RB_Emd24_2: TOnRadioButton;
    RB_Emd24_1: TOnRadioButton;
    E_Emd27: TOnMemo;
    E_Emd35: TOnMemo;
    RB_Emd34_4: TOnRadioButton;
    RB_Emd34_3: TOnRadioButton;
    RB_Emd34_2: TOnRadioButton;
    RB_Emd34_1: TOnRadioButton;
    E_Emd37: TOnMemo;
    RB_Emd16_4: TOnRadioButton;
    RB_Emd26_5: TOnRadioButton;
    RB_Emd26_4: TOnRadioButton;
    RB_Emd26_3: TOnRadioButton;
    RB_Emd26_2: TOnRadioButton;
    RB_Emd26_1: TOnRadioButton;
    RB_Emd36_5: TOnRadioButton;
    RB_Emd36_4: TOnRadioButton;
    RB_Emd36_3: TOnRadioButton;
    RB_Emd36_2: TOnRadioButton;
    RB_Emd36_1: TOnRadioButton;
    Label32: TLabel;
    Label34: TLabel;
    E_CEO32: TOnMemo;
    E_CEO34: TOnMemo;
    Label36: TLabel;
    Label37: TLabel;
    E_CEO37: TOnMemo;
    RB_CEO36_4: TOnRadioButton;
    RB_CEO36_3: TOnRadioButton;
    RB_CEO36_2: TOnRadioButton;
    RB_CEO36_1: TOnRadioButton;
    RB_CEO31_4: TOnRadioButton;
    RB_CEO31_3: TOnRadioButton;
    RB_CEO31_2: TOnRadioButton;
    RB_CEO31_1: TOnRadioButton;
    RB_CEO33_4: TOnRadioButton;
    RB_CEO33_3: TOnRadioButton;
    RB_CEO33_2: TOnRadioButton;
    RB_CEO33_1: TOnRadioButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    TMaxEmp: TTMaxDataSet;
    OnSectionLabel3: TOnSectionLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    L_EmpList1: TPanel;
    L_EmpList2: TPanel;
    L_EmpList3: TPanel;
    L_EmpList4: TPanel;
    L_EmpList5: TPanel;
    L_EmpList6: TPanel;
    L_EmpList7: TPanel;
    L_EmpList8: TPanel;
    L_EmpList9: TPanel;
    BT_OBJ: TOnFocusButton;
    L_DwDate: TLabel;
    Label26: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    BT_Result1: TOnFocusButton;
    BT_Result2: TOnFocusButton;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label8: TLabel;
    Panel10: TPanel;
    Label9: TLabel;
    Label15: TLabel;
    Panel11: TPanel;
    Label23: TLabel;
    Label43: TLabel;
    Panel12: TPanel;
    Label12: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label31: TLabel;
    Panel19: TPanel;
    Label13: TLabel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    P_CEO35_1: TOnRadioButton;
    P_CEO35_2: TOnRadioButton;
    Panel26: TPanel;
    Panel27: TPanel;
    Label35: TLabel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel39: TPanel;
    Panel38: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Label39: TLabel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel70: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Label16: TLabel;
    Label20: TLabel;
    Label18: TLabel;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel93: TPanel;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    RB23_5: TOnRadioButton;
    Panel104: TPanel;
    Panel105: TPanel;
    Panel106: TPanel;
    Panel107: TPanel;
    Panel108: TPanel;
    Panel109: TPanel;
    Panel110: TPanel;
    Panel111: TPanel;
    Panel112: TPanel;
    Panel113: TPanel;
    Panel114: TPanel;
    Panel115: TPanel;
    Panel116: TPanel;
    Panel117: TPanel;
    Panel118: TPanel;
    Panel119: TPanel;
    Panel120: TPanel;
    Panel121: TPanel;
    Panel122: TPanel;
    Panel123: TPanel;
    Panel124: TPanel;
    Panel125: TPanel;
    Panel126: TPanel;
    Panel127: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    Panel130: TPanel;
    Panel131: TPanel;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel134: TPanel;
    Panel135: TPanel;
    Panel136: TPanel;
    Panel137: TPanel;
    Panel138: TPanel;
    Panel139: TPanel;
    Panel140: TPanel;
    Panel141: TPanel;
    Panel142: TPanel;
    Panel143: TPanel;
    Panel144: TPanel;
    Panel145: TPanel;
    Panel146: TPanel;
    Panel147: TPanel;
    Panel148: TPanel;
    Panel149: TPanel;
    Panel150: TPanel;
    Panel151: TPanel;
    Panel152: TPanel;
    Panel153: TPanel;
    Panel154: TPanel;
    Panel155: TPanel;
    Panel156: TPanel;
    Panel157: TPanel;
    Panel158: TPanel;
    Panel159: TPanel;
    Panel160: TPanel;
    Panel161: TPanel;
    Panel162: TPanel;
    Panel163: TPanel;
    Panel164: TPanel;
    Panel165: TPanel;
    Panel166: TPanel;
    Panel167: TPanel;
    Panel168: TPanel;
    Panel169: TPanel;
    Panel170: TPanel;
    Panel171: TPanel;
    Panel172: TPanel;
    Panel173: TPanel;
    Panel174: TPanel;
    Panel175: TPanel;
    Panel176: TPanel;
    Panel177: TPanel;
    Panel178: TPanel;
    Panel179: TPanel;
    Panel180: TPanel;
    Panel181: TPanel;
    Panel182: TPanel;
    Panel183: TPanel;
    Panel184: TPanel;
    Panel185: TPanel;
    Panel186: TPanel;
    Panel187: TPanel;
    Panel188: TPanel;
    Panel189: TPanel;
    Panel190: TPanel;
    Panel191: TPanel;
    Panel192: TPanel;
    Panel193: TPanel;
    Panel209: TPanel;
    Panel210: TPanel;
    Panel211: TPanel;
    Panel212: TPanel;
    Panel213: TPanel;
    Panel214: TPanel;
    Panel215: TPanel;
    Panel216: TPanel;
    Panel217: TPanel;
    Panel218: TPanel;
    Panel219: TPanel;
    Panel220: TPanel;
    Panel221: TPanel;
    Panel222: TPanel;
    Panel223: TPanel;
    Panel194: TPanel;
    Panel195: TPanel;
    Label22: TLabel;
    Panel196: TPanel;
    Panel197: TPanel;
    Label28: TLabel;
    Panel198: TPanel;
    Label30: TLabel;
    L_Title1: TPanel;
    Panel200: TPanel;
    Panel201: TPanel;
    L_Title2: TPanel;
    Panel203: TPanel;
    Panel204: TPanel;
    Panel199: TPanel;
    Panel202: TPanel;
    Panel205: TPanel;
    Panel206: TPanel;
    Panel207: TPanel;
    Panel208: TPanel;
    Panel224: TPanel;
    Panel225: TPanel;
    Panel226: TPanel;
    Panel227: TPanel;
    Label6: TLabel;
    E_LoginEmp: TMemo;

    procedure FormCreate(Sender: TObject);
    procedure BT_NextClick(Sender: TObject);
    procedure BT_PriorClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_HelpExitClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure BT_OpinionClick(Sender: TObject);
    procedure BT_Opinion2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_SendClick(Sender: TObject);
    procedure BT_OBJClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure E_KPI13Click(Sender: TObject);
    procedure E_Opinion1Click(Sender: TObject);
    procedure E_Opinion3Click(Sender: TObject);
    procedure E_Opinion5Click(Sender: TObject);
    procedure E_Opinion7Click(Sender: TObject);
    procedure E_Opinion9Click(Sender: TObject);
    procedure E_Opinion110Click(Sender: TObject);
    procedure E_EMD11Click(Sender: TObject);
    procedure E_CEO32Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_LoginEmpChange(Sender: TObject);
    procedure BT_Result1Click(Sender: TObject);
    procedure BT_Result2Click(Sender: TObject);

  private
    { Private declarations }

    procedure Read_SaveData;
    procedure MOUSEWHEELMessage(var Msg: TMsg; var Handled: Boolean);
    Function  NoInputCheck : Boolean;
  public
    { Public declarations }
     ParamSQL,   vCompName,  vLoginEmp,  vEvalNum,   vSendYN    : String;
     vRabasdate, vOrgnum,    vSysDate,   vEmpDept,   vPayduName, vPayraName : String;
     vE1ConYN,   vE2ConYN  , vE3ConYN    : String;
     vCapacity1, vCapacity2, vCapacity3, vCapacity4, vCapacity5 : Integer;
     vCapacity6, vCapacity7, vCapacity8, vCapacity9, vCapacity10: Integer;
     vKPI2,      vEmd4,      vEmd6       : Integer;
     vCEO1,      vCEO3,      vCEO6       : Integer;
     vCEO5    : String;
     vEvalEmp : Array[0..40] of String[5];
     vPosition : Boolean;
     vPresEmp,   vDW1frdate, vDW1todate, vDW2frdate, vDW2todate : String;

  end;

var
  FM_Main: TFM_Main;

implementation

uses pez2040a2, pez2040a3;

{$R *.DFM}

//디비그리드에서 마우스 휠작동을 위한 Application Message 구현.
procedure TFM_Main.MOUSEWHEELMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = WM_MOUSEWHEEL then
  begin
       if   ActiveControl = TControl(DBGrid1) then
       Begin
            if Msg.wParam > 0 then
            begin
                keybd_event(VK_UP, VK_UP, 0, 0);
                keybd_event(VK_UP, VK_UP, KEYEVENTF_KEYUP, 0);
            end
            else if Msg.wParam < 0 then begin
                keybd_event(VK_DOWN, VK_DOWN, 0, 0);
                keybd_event(VK_DOWN, VK_DOWN, KEYEVENTF_KEYUP, 0);
            end;
            ActiveControl.Invalidate;
       end;
  end;
end;

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


  Pan_Opinion.Visible := False;
  BT_Opinion.Visible  := False;

  Application.OnMessage := MOUSEWHEELMessage; //디비그리드에서 마우스 휠작동을 위한 Application Message 설정.

  //FM_Main.Position := poDefault;
  vPosition := True;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '기초 자료를 읽고 있습니다. 잠시만 기다려 주십시요..';

  vLoginEmp := Passemp(cmdline,1);

  E_LoginEmp.Visible := False;
  if (Passemp(cmdline,1) = '2245') or (Copy(Passemp(cmdline,1),1,1) = 'D') then
  begin
      E_LoginEmp.Visible := True;
      //if Trim(E_LoginEmp.Text)         = '' then E_LoginEmp.Text := 'M127';
      if Length(Trim(E_LoginEmp.Text)) = 4  then E_LoginEmp.Text := UpperCase(E_LoginEmp.Text);
      if Length(Trim(E_LoginEmp.Text)) = 4  then vLoginEmp       := UpperCase(E_LoginEmp.Text);
  end;

  //////////////////////////////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT rabasdate, orgnum, presempno, ''field4'',''field5'' '+
                   '  FROM PEZCPBAS                                            ';

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;
       vRabasdate := Fields[0].AsString;
       vOrgnum    := Fields[1].AsString;
       vPresEmp   := Fields[2].AsString;

       Close;
       Sql.Clear;
       Sql.Text := 'SELECT dw1frdate, dw1todate, dw2frdate, dw2todate, '+
                   '       To_Char(Sysdate, ''YYYYMMDD'')              '+
                   '  FROM PEZCPBAS                                    ';
       Open;
       vDW1frdate := Copy(Hinsa_DisplayDate(Fields[0].AsString,'/'),6,5);
       vDW1todate := Copy(Hinsa_DisplayDate(Fields[1].AsString,'/'),6,5);
       vDW2frdate := Copy(Hinsa_DisplayDate(Fields[2].AsString,'/'),6,5);
       vDW2todate := Copy(Hinsa_DisplayDate(Fields[3].AsString,'/'),6,5);
       vSysDate   := Fields[4].AsString;

       //CEO만 보이도록...
       if   (vLoginEmp = vPresEmp) or (vLoginEmp = '2245') or (Copy(vLoginEmp,1,1) = 'D') then
            TabSheet10.TabVisible := True
       else TabSheet10.TabVisible := False;
  end;
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  with TMaxEmp do
  begin
       ServiceName := 'PEZ2000A_mas1';
       Close;
       Sql.Clear;
       Sql.Text := 'select ''1차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe1conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe1empno = '''+ vLoginEmp  +'''                           '+#13+
                 //'   and to_char(sysdate,''yyyymmdd'') between dw1frdate and dw1todate'+#13+
                   ' Union                                                              '+#13+
                   'select ''2차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe2conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe2empno = '''+ vLoginEmp  +'''                           '+#13+
                 //'   and to_char(sysdate,''yyyymmdd'') between dw2frdate and dw2todate'+#13+
                   ' Union                                                              '+#13+
                   'select ''3차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe3conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe3empno = '''+ vLoginEmp  +'''                           '+#13+
                   ' Order by 7, 1, 4                                                   ';

       ClearFieldInfo;
       AddField('ENUM'    , ftString, 3);
       AddField('EMPNO'   , ftString, 4);
       AddField('KORNAME' , ftString, 20);
       AddField('PAYRA'   , ftString, 3);
       AddField('PAYCL'   , ftString, 3);
       AddField('PAYDUNM' , ftString, 30);
       AddField('CONYN'   , ftString, 6); 
       Open;


       //권한체크.
       if   (vLoginEmp <> '2245') and (Copy(vLoginEmp,1,1) <> 'D') then
       begin
            if TMaxEmp.RecordCount = 0 then
            begin
                 ShowMessage('귀하께서 평가하실 대상자가 존재하지 않습니다.'+#13+#13+
                             '프로그램을 종료합니다.');
                 FM_Main.Close;
                 Exit;
            end;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  BT_HelpClick(Sender);   //도움말 보이기.
    
  vCEO5 := '';
  PageControl1.ActivePage := TabSheet1;
  SB_Help.Panels[1].Text  := '';
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
var i      : Integer;
    vE1Empno, vE2Empno : String;
begin                    //ShowMessage(TMaxGrid.Fields[1].AsString);
  SB_Help.Panels[1].Text := '';

  if TMaxEmp.Fields[1].AsString = '' then Exit;

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas1';
       Close;
       Sql.Clear;
       Sql.Text := 'select ''1차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe1conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe1empno = '''+ vLoginEmp  +'''                           '+#13+
                   '   and a.empno     = '''+ TMaxEmp.Fields[1].AsString +'''           '+#13+
                   //'   and to_char(sysdate,''yyyymmdd'') between dw1frdate and dw1todate'+#13+
                   ' Union                                                              '+#13+
                   'select ''2차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe2conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe2empno = '''+ vLoginEmp  +'''                           '+#13+
                   '   and a.empno     = '''+ TMaxEmp.Fields[1].AsString +'''           '+#13+
                   //'   and to_char(sysdate,''yyyymmdd'') between dw2frdate and dw2todate'+#13+
                   ' Union                                                              '+#13+
                   'select ''3차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe3conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe3empno = '''+ vLoginEmp  +'''                           '+#13+
                   '   and a.empno     = '''+ TMaxEmp.Fields[1].AsString +'''           '+#13+
                   ' Order by 7, 1, 4                                                ';

       ClearFieldInfo;
       AddField('ENUM'    , ftString, 3);
       AddField('EMPNO'   , ftString, 4);
       AddField('KORNAME' , ftString, 20);
       AddField('PAYRA'   , ftString, 3);
       AddField('PAYCL'   , ftString, 3);
       AddField('PAYDUNM' , ftString, 30);
       AddField('CONYN'   , ftString, 6); 
       Open;

       if RecordCount <= 1 then
       begin
            vEvalNum := Fields[0].AsString;

            if   (vEvalNum = '1차') or (vEvalNum = '') then BT_OBJ.Visible := False
            else                                            BT_OBJ.Visible := True;
            if   (vEvalNum = '1차') or (vEvalNum = '') then BT_Result2.Visible := False
            else                                            BT_Result2.Visible := True;
            
            //if (Passemp(cmdline,1) = '2292') or (Copy(Passemp(cmdline,1),1,1) <> 'D') then BT_Result2.Visible := True;

            BT_Save.Enabled := True;
            BT_Send.Enabled := True;
            if   Fields[6].AsString = '완료' then
            begin
                 BT_Save.Enabled := False;
                 BT_Send.Enabled := False;
                 //MessageDlg(' 해당 임원에 대한 평가를 완료하여 열람만 가능합니다.', mtConfirmation, [mbOk], 0);
                 SB_Help.Panels[1].Text := '해당 임원에 대한 평가를 완료하여 열람만 가능합니다.';
            end;
       end
       else ShowMessage(IntToStr(RecordCount)+'건. 담당자에게 문의 바랍니다');
  end;
  //////////////////////////////////////////////////////////////////////////////

  //임원평가 마스터 Read..
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
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString  +'''                                      ';

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
       AddField('E3CONDATE'   , ftString, 8);  
       Open;

       L_Korname.Caption   := '성          명 : '   + FieldByName('KORNAME').AsString;
       L_Payra.Caption     := '직          책 : '   + FieldByName('PAYRANM').AsString;
       //L_PayclDate.Caption   := '현BAND 승진일 :   ' + Hinsa_DisplayDate(FieldByName('CPAYCLDATE').AsString,'-');
       L_Paycl.Caption     := '직    무    명 : '   + FieldByName('PAYDUNM').AsString;

       //L_Birth.Caption     := '생  년  월  일   : ' + Hinsa_DisplayDate('19'+FieldByName('JUMINID').AsString,'-');
       //L_Empdate.Caption   := '입  사  일  자   : ' + Hinsa_DisplayDate(FieldByName('EMPDATE').AsString,'-');
       //L_Payradate.Caption := '현직책/직무보임일: ' + Hinsa_DisplayDate(FieldByName('CPAYRADATE').AsString,'-');
       L_Rabasdate.Caption := '평  가  일  자   : ' + Hinsa_DisplayDate(vSysDate,'-');

       vPayraName          := FieldByName('PAYRANM').AsString;
       vPayduName          := FieldByName('KORNAME').AsString + ' - ' +
                              FieldByName('PAYCLNM').AsString + ' - ' +
                              FieldByName('PAYDUNM').AsString;

       vE1Empno            := FieldByName('E1EMPNO').AsString;
       vE2Empno            := FieldByName('E2EMPNO').AsString;
       L_E1Korname.Caption := '성          명 : ' + FieldByName('E1KORNAME').AsString;
       L_E2Korname.Caption := '성          명 : ' + FieldByName('E2KORNAME').AsString;
       L_E3Korname.Caption := '성          명 : ' + FieldByName('E3KORNAME').AsString;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
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
                   ' where rabasdate = '''+ vRabasdate  +'''                                      '+
                   '   and empno     = '''+ vE1Empno    +'''                                      ';
       Open;
       L_E1Paycl.Caption   := '직책  / 직무명 : ' + FieldByName('PAYDUNM').AsString;

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
                   ' where rabasdate = '''+ vRabasdate  +'''                                      '+
                   '   and empno     = '''+ vE2Empno    +'''                                      ';
       Open;       
       L_E2Paycl.Caption   := '직책  / 직무명 : ' + FieldByName('PAYDUNM').AsString;
  end;

  Read_SaveData; //기 저장내역 Read...
end;

procedure TFM_Main.Read_SaveData;
var i       : Integer;
    FL_Comp : TOnRadioButton;
begin
  if vEvalNum = '' then Exit;

  // 기 저장된 내역 Read ///////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2040A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,    Kpi11, Kpi12, Kpi13,                                                                  '+#13+
                   '       nvl(Capacity11,0), nvl(Capacity12,0), nvl(Capacity13,0), nvl(Capacity14,0), nvl(Capacity15,0),  '+#13+
                   '       nvl(Capacity16,0), nvl(Capacity17,0), nvl(Capacity18,0), nvl(Capacity19,0), nvl(Capacity110,0), '+#13+
                   '       Opinion11,         Opinion12,         Opinion13,         Opinion14,         Opinion15,          '+#13+
                   '       Opinion16,         Opinion17,         Opinion18,         Opinion19,         Opinion110,         '+#13+
                   '       Emd11, Emd12, Emd13, nvl(Emd14,0), Emd15, nvl(Emd16,0), Emd17,                                  '+#13+
                   '       Kpi21, Kpi22, Kpi23,                                                                            '+#13+
                   '       nvl(Capacity21,0), nvl(Capacity22,0), nvl(Capacity23,0), nvl(Capacity24,0), nvl(Capacity25,0),  '+#13+
                   '       nvl(Capacity26,0), nvl(Capacity27,0), nvl(Capacity28,0), nvl(Capacity29,0), nvl(Capacity210,0), '+#13+
                   '       Opinion21,         Opinion22,         Opinion23,         Opinion24,         Opinion25,          '+#13+
                   '       Opinion26,         Opinion27,         Opinion28,         Opinion29,         Opinion210,         '+#13+
                   '       Emd21, Emd22, Emd23, nvl(Emd24,0), Emd25, nvl(Emd26,0), Emd27,                                  '+#13+
                   '       Kpi31, Kpi32, Kpi33,                                                                            '+#13+
                   '       nvl(Capacity31,0), nvl(Capacity32,0), nvl(Capacity33,0), nvl(Capacity34,0), nvl(Capacity35,0),  '+#13+
                   '       nvl(Capacity36,0), nvl(Capacity37,0), nvl(Capacity38,0), nvl(Capacity39,0), nvl(Capacity310,0), '+#13+
                   '       Opinion31,         Opinion32,         Opinion33,         Opinion34,         Opinion35,          '+#13+
                   '       Opinion36,         Opinion37,         Opinion38,         Opinion39,         Opinion310,         '+#13+
                   '       Emd31, Emd32, Emd33, nvl(Emd34,0), Emd35, nvl(Emd36,0), Emd37,                                  '+#13+
                   '       nvl(Ceo31,0), Ceo32, nvl(Ceo33,0), Ceo34, Ceo35, nvl(Ceo36,0), Ceo37                            '+#13+
                   '  from pezdwmas                                                                                        '+#13+
                   ' where rabasdate = '''+ vRabasdate +'''                                                                '+#13+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString  +'''                                               ';

       ClearFieldInfo;
       AddField('EMPNO'      , ftString , 4);
       AddField('KPI11'      , ftInteger, 3);
       AddField('KPI12'      , ftInteger, 3);
       AddField('KPI13'      , ftString , 400);
       AddField('CAPACITY11' , ftInteger, 3);
       AddField('CAPACITY12' , ftInteger, 3);
       AddField('CAPACITY13' , ftInteger, 3);
       AddField('CAPACITY14' , ftInteger, 3);
       AddField('CAPACITY15' , ftInteger, 3);
       AddField('CAPACITY16' , ftInteger, 3);
       AddField('CAPACITY17' , ftInteger, 3);
       AddField('CAPACITY18' , ftInteger, 3);
       AddField('CAPACITY19' , ftInteger, 3);
       AddField('CAPACITY110', ftInteger, 3);
       AddField('OPINION11'  , ftString , 400);
       AddField('OPINION12'  , ftString , 400);
       AddField('OPINION13'  , ftString , 400);
       AddField('OPINION14'  , ftString , 400);
       AddField('OPINION15'  , ftString , 400);
       AddField('OPINION16'  , ftString , 400);
       AddField('OPINION17'  , ftString , 400);
       AddField('OPINION18'  , ftString , 400);
       AddField('OPINION19'  , ftString , 400);
       AddField('OPINION110' , ftString , 400);
       AddField('EMD11'      , ftString , 400);
       AddField('EMD12'      , ftString , 400);
       AddField('EMD13'      , ftString , 400);
       AddField('EMD14'      , ftInteger, 3);
       AddField('EMD15'      , ftString , 400);
       AddField('EMD16'      , ftInteger, 3);
       AddField('EMD17'      , ftString , 400);
       AddField('KPI21'      , ftInteger, 3);
       AddField('KPI22'      , ftInteger, 3);
       AddField('KPI23'      , ftString , 400);
       AddField('CAPACITY21' , ftInteger, 3);
       AddField('CAPACITY22' , ftInteger, 3);
       AddField('CAPACITY23' , ftInteger, 3);
       AddField('CAPACITY24' , ftInteger, 3);
       AddField('CAPACITY25' , ftInteger, 3);
       AddField('CAPACITY26' , ftInteger, 3);
       AddField('CAPACITY27' , ftInteger, 3);
       AddField('CAPACITY28' , ftInteger, 3);
       AddField('CAPACITY29' , ftInteger, 3);
       AddField('CAPACITY210', ftInteger, 3);
       AddField('OPINION21'  , ftString , 400);
       AddField('OPINION22'  , ftString , 400);
       AddField('OPINION23'  , ftString , 400);
       AddField('OPINION24'  , ftString , 400);
       AddField('OPINION25'  , ftString , 400);
       AddField('OPINION26'  , ftString , 400);
       AddField('OPINION27'  , ftString , 400);
       AddField('OPINION28'  , ftString , 400);
       AddField('OPINION29'  , ftString , 400);
       AddField('OPINION210' , ftString , 400);
       AddField('EMD21'      , ftString , 400);
       AddField('EMD22'      , ftString , 400);
       AddField('EMD23'      , ftString , 400);
       AddField('EMD24'      , ftInteger, 3);
       AddField('EMD25'      , ftString , 400);
       AddField('EMD26'      , ftInteger, 3);
       AddField('EMD27'      , ftString , 400);
       AddField('KPI31'      , ftInteger, 3);
       AddField('KPI32'      , ftInteger, 3);
       AddField('KPI33'      , ftString , 400);
       AddField('CAPACITY31' , ftInteger, 3);
       AddField('CAPACITY32' , ftInteger, 3);
       AddField('CAPACITY33' , ftInteger, 3);
       AddField('CAPACITY34' , ftInteger, 3);
       AddField('CAPACITY35' , ftInteger, 3);
       AddField('CAPACITY36' , ftInteger, 3);
       AddField('CAPACITY37' , ftInteger, 3);
       AddField('CAPACITY38' , ftInteger, 3);
       AddField('CAPACITY39' , ftInteger, 3);
       AddField('CAPACITY310', ftInteger, 3);
       AddField('OPINION31'  , ftString , 400);
       AddField('OPINION32'  , ftString , 400);
       AddField('OPINION33'  , ftString , 400);
       AddField('OPINION34'  , ftString , 400);
       AddField('OPINION35'  , ftString , 400);
       AddField('OPINION36'  , ftString , 400);
       AddField('OPINION37'  , ftString , 400);
       AddField('OPINION38'  , ftString , 400);
       AddField('OPINION39'  , ftString , 400);
       AddField('OPINION310' , ftString , 400);
       AddField('EMD31'      , ftString , 400);
       AddField('EMD32'      , ftString , 400);
       AddField('EMD33'      , ftString , 400);
       AddField('EMD34'      , ftInteger, 3);
       AddField('EMD35'      , ftString , 400);
       AddField('EMD36'      , ftInteger, 3);
       AddField('EMD37'      , ftString , 400);
       AddField('CEO31'      , ftInteger, 1);
       AddField('CEO32'      , ftString , 400);
       AddField('CEO33'      , ftInteger, 1);
       AddField('CEO34'      , ftString , 400);
       AddField('CEO35'      , ftString , 1);
       AddField('CEO36'      , ftInteger, 3);
       AddField('CEO37'      , ftString , 400); 
       Open;
       
       FL_Comp := nil;
       for i := 1 to 5 do
       begin
            if      vEvalNum = '1차' then
            begin
                 if FieldByName('KPI12').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity11').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity12').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity13').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity15').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity16').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity17').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity18').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity19').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity110').AsInteger = i then TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := False;
                      if FieldByName('EMD14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := True;
                 end;
                 if FieldByName('EMD16').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i))).Checked := True;

                 /////////////////////////////////////////////////////////////////////////
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI32_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i)));
                 FL_Comp.Enabled := True;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB31_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB32_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB33_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB34_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB35_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB36_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB37_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB38_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB39_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp.Enabled := False;
                 if i <> 5 then
                 begin
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i)));
                      FL_Comp.Enabled := True;
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                 end;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD36_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
            end

            else if vEvalNum = '2차' then
            begin
                 if FieldByName('KPI12').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI22').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity11').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity12').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity13').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity15').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity16').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity17').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity18').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity19').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity110').AsInteger = i then TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity21').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity22').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity23').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity25').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity26').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity27').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity28').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity29').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity210').AsInteger = i then TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := False;
                      TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := False;
                      if FieldByName('EMD14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := True;
                 end;
                 if FieldByName('EMD16').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD26').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i))).Checked := True;

                  /////////////////////////////////////////////////////////////////////////
                 FL_Comp := nil;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI32_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i)));
                 FL_Comp.Enabled := True;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB31_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB32_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB33_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB34_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB35_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB36_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB37_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB38_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB39_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 if i <> 5 then
                 begin
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                 end;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD36_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
            end
            
            else if vEvalNum = '3차' then
            begin
                 if FieldByName('KPI12').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI22').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI32').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI32_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity11').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity12').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity13').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity15').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity16').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity17').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity18').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity19').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity110').AsInteger = i then TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity21').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity22').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity23').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity25').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity26').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity27').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity28').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity29').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity210').AsInteger = i then TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity31').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB31_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity32').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB32_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity33').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB33_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity34').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB34_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity35').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB35_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity36').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB36_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity37').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB37_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity38').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB38_'+IntToStr(i))).Checked := True;
                 //if FieldByName('Capacity39').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB39_'+IntToStr(i))).Checked := True;
                 //if FieldByName('Capacity310').AsInteger = i then TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := False;
                      TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := False;
                      TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i))).Checked := False;
                      if FieldByName('EMD14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD34').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i))).Checked := True;
                 end;
                 if FieldByName('EMD16').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD26').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD36').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD36_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      TOnRadioButton(Self.FindComponent('RB_CEO31_'+IntToStr(i))).Checked := False;
                      TOnRadioButton(Self.FindComponent('RB_CEO33_'+IntToStr(i))).Checked := False;
                      TOnRadioButton(Self.FindComponent('RB_CEO36_'+IntToStr(i))).Checked := False;
                      if FieldByName('CEO31').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_CEO31_'+IntToStr(i))).Checked := True;
                      if FieldByName('CEO33').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_CEO33_'+IntToStr(i))).Checked := True;
                      if FieldByName('CEO36').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_CEO36_'+IntToStr(i))).Checked := True;
                 end;

                  /////////////////////////////////////////////////////////////////////////
                 FL_Comp := nil;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i)));
                 FL_Comp.Enabled := False;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i)));
                 FL_Comp.Enabled := False;


                 FL_Comp := TOnRadioButton(Self.FindComponent('RB31_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB32_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB33_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB34_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB35_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB36_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB37_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB38_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB39_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i)));
                 FL_Comp.Enabled := True;

                 if i <> 5 then
                 begin
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i)));
                      FL_Comp.Enabled := False;
                      FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i)));
                      FL_Comp.Enabled := True;
                 end;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i)));
                 FL_Comp.Enabled := False;
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_EMD36_'+IntToStr(i)));
                 FL_Comp.Enabled := True;
            end;
       end; //  showmessage(inttostr(vCapacity1));


       if      vEvalNum = '1차' then
       begin
            E_KPI11.Value := FieldByName('KPI11').AsInteger;
            E_KPI13.Text  := FieldByName('KPI13').AsString;
            E_KPI21.Value := 0;
            E_KPI23.Text  := '';
            E_KPI31.Value := 0;
            E_KPI33.Text  := '';
            E_KPI11.Enabled := True;
            E_KPI13.Enabled := True;
            E_KPI21.Enabled := False;
            E_KPI23.Enabled := False;
            E_KPI31.Enabled := False;
            E_KPI33.Enabled := False;

            E_Opinion1.Text  := FieldByName('Opinion11').AsString;
            E_Opinion2.Text  := FieldByName('Opinion12').AsString;
            E_Opinion3.Text  := FieldByName('Opinion13').AsString;
            E_Opinion4.Text  := FieldByName('Opinion14').AsString;
            E_Opinion5.Text  := FieldByName('Opinion15').AsString;
            E_Opinion6.Text  := FieldByName('Opinion16').AsString;
            E_Opinion7.Text  := FieldByName('Opinion17').AsString;
            E_Opinion8.Text  := FieldByName('Opinion18').AsString;
            E_Opinion9.Text  := FieldByName('Opinion19').AsString;
            E_Opinion110.Text:= FieldByName('Opinion110').AsString;
            E_Opinion210.Text:= '';
            E_Opinion310.Text:= '';
            E_Opinion110.Enabled := True;
            E_Opinion210.Enabled := False;
            E_Opinion310.Enabled := False;

            E_EMD11.Text  := FieldByName('EMD11').AsString;
            E_EMD12.Text  := FieldByName('EMD12').AsString;
            E_EMD13.Text  := FieldByName('EMD13').AsString;
            E_EMD15.Text  := FieldByName('EMD15').AsString;
            E_EMD17.Text  := FieldByName('EMD17').AsString;
            E_EMD21.Text  := '';
            E_EMD22.Text  := '';
            E_EMD23.Text  := '';
            E_EMD25.Text  := '';
            E_EMD27.Text  := '';
            E_EMD31.Text  := '';
            E_EMD32.Text  := '';
            E_EMD33.Text  := '';
            E_EMD35.Text  := '';
            E_EMD37.Text  := '';
            E_EMD11.Enabled := True;
            E_EMD12.Enabled := True;
            E_EMD13.Enabled := True;
            E_EMD15.Enabled := True;
            E_EMD17.Enabled := True;
            E_EMD21.Enabled := False;
            E_EMD22.Enabled := False;
            E_EMD23.Enabled := False;
            E_EMD25.Enabled := False;
            E_EMD27.Enabled := False;
            E_EMD31.Enabled := False;
            E_EMD32.Enabled := False;
            E_EMD33.Enabled := False;
            E_EMD35.Enabled := False;
            E_EMD37.Enabled := False;
       end
       else if vEvalNum = '2차' then
       begin
            E_KPI11.Value := FieldByName('KPI11').AsInteger;
            E_KPI13.Text  := FieldByName('KPI13').AsString;
            E_KPI21.Value := FieldByName('KPI21').AsInteger;
            E_KPI23.Text  := FieldByName('KPI23').AsString;
            E_KPI31.Value := 0;
            E_KPI33.Text  := '';
            E_KPI11.Enabled := False;
            E_KPI13.Enabled := False;
            E_KPI21.Enabled := True;
            E_KPI23.Enabled := True;
            E_KPI31.Enabled := False;
            E_KPI33.Enabled := False;

            E_Opinion1.Text  := FieldByName('Opinion21').AsString;
            E_Opinion2.Text  := FieldByName('Opinion22').AsString;
            E_Opinion3.Text  := FieldByName('Opinion23').AsString;
            E_Opinion4.Text  := FieldByName('Opinion24').AsString;
            E_Opinion5.Text  := FieldByName('Opinion25').AsString;
            E_Opinion6.Text  := FieldByName('Opinion26').AsString;
            E_Opinion7.Text  := FieldByName('Opinion27').AsString;
            E_Opinion8.Text  := FieldByName('Opinion28').AsString;
            E_Opinion9.Text  := FieldByName('Opinion29').AsString;
            E_Opinion110.Text:= FieldByName('Opinion110').AsString;
            E_Opinion210.Text:= FieldByName('Opinion210').AsString;
            E_Opinion310.Text:= '';
            E_Opinion110.Enabled := False;
            E_Opinion210.Enabled := True;
            E_Opinion310.Enabled := False;

            E_EMD11.Text  := FieldByName('EMD11').AsString;
            E_EMD12.Text  := FieldByName('EMD12').AsString;
            E_EMD13.Text  := FieldByName('EMD13').AsString;
            E_EMD15.Text  := FieldByName('EMD15').AsString;
            E_EMD17.Text  := FieldByName('EMD17').AsString;
            E_EMD21.Text  := FieldByName('EMD21').AsString;
            E_EMD22.Text  := FieldByName('EMD22').AsString;
            E_EMD23.Text  := FieldByName('EMD23').AsString;
            E_EMD25.Text  := FieldByName('EMD25').AsString;
            E_EMD27.Text  := FieldByName('EMD27').AsString;
            E_EMD31.Text  := '';
            E_EMD32.Text  := '';
            E_EMD33.Text  := '';
            E_EMD35.Text  := '';
            E_EMD37.Text  := '';
            E_EMD11.Enabled := False;
            E_EMD12.Enabled := False;
            E_EMD13.Enabled := False;
            E_EMD15.Enabled := False;
            E_EMD17.Enabled := False;
            E_EMD21.Enabled := True;
            E_EMD22.Enabled := True;
            E_EMD23.Enabled := True;
            E_EMD25.Enabled := True;
            E_EMD27.Enabled := True;
            E_EMD31.Enabled := False;
            E_EMD32.Enabled := False;
            E_EMD33.Enabled := False;
            E_EMD35.Enabled := False;
            E_EMD37.Enabled := False;
       end
       else if vEvalNum = '3차' then
       begin
            E_KPI11.Value := FieldByName('KPI11').AsInteger;
            E_KPI13.Text  := FieldByName('KPI13').AsString;
            E_KPI21.Value := FieldByName('KPI21').AsInteger;
            E_KPI23.Text  := FieldByName('KPI23').AsString;
            E_KPI31.Value := FieldByName('KPI31').AsInteger;
            E_KPI33.Text  := FieldByName('KPI33').AsString;
            E_KPI11.Enabled := False;
            E_KPI13.Enabled := False;
            E_KPI21.Enabled := False;
            E_KPI23.Enabled := False;
            E_KPI31.Enabled := True;
            E_KPI33.Enabled := True;

            E_Opinion1.Text  := FieldByName('Opinion31').AsString;
            E_Opinion2.Text  := FieldByName('Opinion32').AsString;
            E_Opinion3.Text  := FieldByName('Opinion33').AsString;
            E_Opinion4.Text  := FieldByName('Opinion34').AsString;
            E_Opinion5.Text  := FieldByName('Opinion35').AsString;
            E_Opinion6.Text  := FieldByName('Opinion36').AsString;
            E_Opinion7.Text  := FieldByName('Opinion37').AsString;
            E_Opinion8.Text  := FieldByName('Opinion38').AsString;
            E_Opinion9.Text  := FieldByName('Opinion39').AsString;
            E_Opinion110.Text:= FieldByName('Opinion110').AsString;
            E_Opinion210.Text:= FieldByName('Opinion210').AsString;
            E_Opinion310.Text:= FieldByName('Opinion310').AsString;
            E_Opinion110.Enabled := False;
            E_Opinion210.Enabled := False;
            E_Opinion310.Enabled := True;

            E_EMD11.Text  := FieldByName('EMD11').AsString;
            E_EMD12.Text  := FieldByName('EMD12').AsString;
            E_EMD13.Text  := FieldByName('EMD13').AsString;
            E_EMD15.Text  := FieldByName('EMD15').AsString;
            E_EMD17.Text  := FieldByName('EMD17').AsString;
            E_EMD21.Text  := FieldByName('EMD21').AsString;
            E_EMD22.Text  := FieldByName('EMD22').AsString;
            E_EMD23.Text  := FieldByName('EMD23').AsString;
            E_EMD25.Text  := FieldByName('EMD25').AsString;
            E_EMD27.Text  := FieldByName('EMD27').AsString;
            E_EMD31.Text  := FieldByName('EMD31').AsString;
            E_EMD32.Text  := FieldByName('EMD32').AsString;
            E_EMD33.Text  := FieldByName('EMD33').AsString;
            E_EMD35.Text  := FieldByName('EMD35').AsString;
            E_EMD37.Text  := FieldByName('EMD37').AsString;
            E_EMD11.Enabled := False;
            E_EMD12.Enabled := False;
            E_EMD13.Enabled := False;
            E_EMD15.Enabled := False;
            E_EMD17.Enabled := False;
            E_EMD21.Enabled := False;
            E_EMD22.Enabled := False;
            E_EMD23.Enabled := False;
            E_EMD25.Enabled := False;
            E_EMD27.Enabled := False;
            E_EMD31.Enabled := True;
            E_EMD32.Enabled := True;
            E_EMD33.Enabled := True;
            E_EMD35.Enabled := True;
            E_EMD37.Enabled := True;

            E_CEO32.Text  := FieldByName('CEO32').AsString;
            E_CEO34.Text  := FieldByName('CEO34').AsString;
            
            vCEO5 := '';
            if FieldByName('CEO35').AsString = 'Y' then vCEO5 := 'Y';
            if FieldByName('CEO35').AsString = 'N' then vCEO5 := 'N';
            E_CEO37.Text  := FieldByName('CEO37').AsString;
       end;
  end;


  E_KPI13.Font.Color     := clBlack;
  E_KPI23.Font.Color     := clBlack;
  E_KPI33.Font.Color     := clBlack;
  E_Opinion1.Font.Color  := clBlack;
  E_Opinion2.Font.Color  := clBlack;
  E_Opinion3.Font.Color  := clBlack;
  E_Opinion4.Font.Color  := clBlack;
  E_Opinion5.Font.Color  := clBlack;
  E_Opinion6.Font.Color  := clBlack;
  E_Opinion7.Font.Color  := clBlack;
  E_Opinion8.Font.Color  := clBlack;
  E_Opinion9.Font.Color  := clBlack;
  E_Opinion110.Font.Color:= clBlack;
  E_Opinion210.Font.Color:= clBlack;
  E_Opinion310.Font.Color:= clBlack;
  E_EMD11.Font.Color     := clBlack;
  E_EMD12.Font.Color     := clBlack;
  E_EMD13.Font.Color     := clBlack;
  E_EMD15.Font.Color     := clBlack;
  E_EMD17.Font.Color     := clBlack;
  E_EMD21.Font.Color     := clBlack;
  E_EMD22.Font.Color     := clBlack;
  E_EMD23.Font.Color     := clBlack;
  E_EMD25.Font.Color     := clBlack;
  E_EMD27.Font.Color     := clBlack;
  E_EMD31.Font.Color     := clBlack;
  E_EMD32.Font.Color     := clBlack;
  E_EMD33.Font.Color     := clBlack;
  E_EMD35.Font.Color     := clBlack;
  E_EMD37.Font.Color     := clBlack;
  
  if Trim(E_KPI13.Text)     = '' then E_KPI13.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_KPI23.Text)     = '' then E_KPI23.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_KPI33.Text)     = '' then E_KPI33.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion1.Text)  = '' then E_Opinion1.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion2.Text)  = '' then E_Opinion2.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion3.Text)  = '' then E_Opinion3.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion4.Text)  = '' then E_Opinion4.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion5.Text)  = '' then E_Opinion5.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion6.Text)  = '' then E_Opinion6.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion7.Text)  = '' then E_Opinion7.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion8.Text)  = '' then E_Opinion8.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion9.Text)  = '' then E_Opinion9.Text  := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion110.Text)= '' then E_Opinion110.Text:= '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion210.Text)= '' then E_Opinion210.Text:= '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion310.Text)= '' then E_Opinion310.Text:= '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD11.Text)     = '' then E_EMD11.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD12.Text)     = '' then E_EMD12.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD13.Text)     = '' then E_EMD13.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD15.Text)     = '' then E_EMD15.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD17.Text)     = '' then E_EMD17.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD21.Text)     = '' then E_EMD21.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD22.Text)     = '' then E_EMD22.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD23.Text)     = '' then E_EMD23.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD25.Text)     = '' then E_EMD25.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD27.Text)     = '' then E_EMD27.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD31.Text)     = '' then E_EMD31.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD32.Text)     = '' then E_EMD32.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD33.Text)     = '' then E_EMD33.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD35.Text)     = '' then E_EMD35.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';
  if Trim(E_EMD37.Text)     = '' then E_EMD37.Text     := '한글 기준 200자까지 등록 가능합니다 (Max 400Byte)';

  if Pos('(Max 400Byte)',E_KPI13.Text)     > 0 then E_KPI13.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_KPI23.Text)     > 0 then E_KPI23.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_KPI33.Text)     > 0 then E_KPI33.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_Opinion1.Text)  > 0 then E_Opinion1.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion2.Text)  > 0 then E_Opinion2.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion3.Text)  > 0 then E_Opinion3.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion4.Text)  > 0 then E_Opinion4.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion5.Text)  > 0 then E_Opinion5.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion6.Text)  > 0 then E_Opinion6.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion7.Text)  > 0 then E_Opinion7.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion8.Text)  > 0 then E_Opinion8.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion9.Text)  > 0 then E_Opinion9.Font.Color  := clGray;
  if Pos('(Max 400Byte)',E_Opinion110.Text)> 0 then E_Opinion110.Font.Color:= clGray;
  if Pos('(Max 400Byte)',E_Opinion210.Text)> 0 then E_Opinion210.Font.Color:= clGray;
  if Pos('(Max 400Byte)',E_Opinion310.Text)> 0 then E_Opinion310.Font.Color:= clGray;
  if Pos('(Max 400Byte)',E_EMD11.Text)     > 0 then E_EMD11.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD12.Text)     > 0 then E_EMD12.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD13.Text)     > 0 then E_EMD13.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD15.Text)     > 0 then E_EMD15.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD17.Text)     > 0 then E_EMD17.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD21.Text)     > 0 then E_EMD21.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD22.Text)     > 0 then E_EMD22.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD23.Text)     > 0 then E_EMD23.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD25.Text)     > 0 then E_EMD25.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD27.Text)     > 0 then E_EMD27.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD31.Text)     > 0 then E_EMD31.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD32.Text)     > 0 then E_EMD32.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD33.Text)     > 0 then E_EMD33.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD35.Text)     > 0 then E_EMD35.Font.Color     := clGray;
  if Pos('(Max 400Byte)',E_EMD37.Text)     > 0 then E_EMD37.Font.Color     := clGray;
end;

procedure TFM_Main.BT_NextClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet1 then PageControl1.ActivePage := TabSheet2
  else if PageControl1.ActivePage = TabSheet2 then PageControl1.ActivePage := TabSheet3
  else if PageControl1.ActivePage = TabSheet3 then PageControl1.ActivePage := TabSheet4
  else if PageControl1.ActivePage = TabSheet4 then PageControl1.ActivePage := TabSheet5
  else if PageControl1.ActivePage = TabSheet5 then PageControl1.ActivePage := TabSheet6
  else if PageControl1.ActivePage = TabSheet6 then PageControl1.ActivePage := TabSheet7
  else if PageControl1.ActivePage = TabSheet7 then PageControl1.ActivePage := TabSheet8
  else if PageControl1.ActivePage = TabSheet8 then PageControl1.ActivePage := TabSheet9
  else if PageControl1.ActivePage = TabSheet9 then PageControl1.ActivePage := TabSheet10;

  PageControl1Change(Sender);
end;

procedure TFM_Main.BT_PriorClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet10 then PageControl1.ActivePage := TabSheet9
  else if PageControl1.ActivePage = TabSheet9  then PageControl1.ActivePage := TabSheet8
  else if PageControl1.ActivePage = TabSheet8  then PageControl1.ActivePage := TabSheet7
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
  if   PageControl1.ActivePage =  TabSheet1 then BT_Prior.Enabled := False;
  if   PageControl1.ActivePage =  TabSheet9 then BT_Next.Enabled  := False;
  if   PageControl1.ActivePage <> TabSheet1 then BT_Prior.Enabled := True;
  if   PageControl1.ActivePage <> TabSheet9 then BT_Next.Enabled  := True;

  if (vLoginEmp = vPresEmp) then
  begin
       if PageControl1.ActivePage = TabSheet9 then BT_Next.Enabled := True;
  end;

  if vPosition = True then FM_Main.Top := FM_Main.Top - 5;
  if vPosition = True then vPosition := False;

  if  (PageControl1.ActivePage.TabIndex in [2..6]) and
      (vEvalNum <> '1차') and (vEvalNum <> '')     then BT_Opinion.Visible := True
  else                                                  BT_Opinion.Visible := False;

  L_EmpList1.Caption := ' 1. 업적평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList2.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList3.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList4.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList5.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList6.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList7.Caption := ' 2. 능력평가  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList8.Caption := ' 3. EMD 능력개발계획  -  [ 피평가자 인적사항 ] ' + vPayduName;
  L_EmpList9.Caption := ' 4. 평가종합(CEO 작성) -  [ 피평가자 인적사항 ] ' + vPayduName;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
 BT_OpinionClick(Sender);
 
 Try
     Close;
 Except

 end;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
    i, vCnt  : Integer;
    ParamSQL, SQLinsert : String;
    FL_Comp  : TOnRadioButton;
begin
//if MessageDlg('평가내역을 저장하시겠습니까?    '+#13+#13+
//              '(평가완료 버튼 클릭전에는 수정 가능합니다.)', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  if Pos('(Max 400Byte)',E_KPI13.Text)      > 0 then E_KPI13.Text      := '';
  if Pos('(Max 400Byte)',E_KPI23.Text)      > 0 then E_KPI23.Text      := '';
  if Pos('(Max 400Byte)',E_KPI33.Text)      > 0 then E_KPI33.Text      := '';
  if Pos('(Max 400Byte)',E_Opinion1.Text)   > 0 then E_Opinion1.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion2.Text)   > 0 then E_Opinion2.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion3.Text)   > 0 then E_Opinion3.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion4.Text)   > 0 then E_Opinion4.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion5.Text)   > 0 then E_Opinion5.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion6.Text)   > 0 then E_Opinion6.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion7.Text)   > 0 then E_Opinion7.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion8.Text)   > 0 then E_Opinion8.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion9.Text)   > 0 then E_Opinion9.Text   := '';
  if Pos('(Max 400Byte)',E_Opinion110.Text) > 0 then E_Opinion110.Text := '';
  if Pos('(Max 400Byte)',E_Opinion210.Text) > 0 then E_Opinion210.Text := '';
  if Pos('(Max 400Byte)',E_Opinion310.Text) > 0 then E_Opinion310.Text := '';
  if Pos('(Max 400Byte)',E_EMD11.Text)      > 0 then E_EMD11.Text      := '';
  if Pos('(Max 400Byte)',E_EMD12.Text)      > 0 then E_EMD12.Text      := '';
  if Pos('(Max 400Byte)',E_EMD13.Text)      > 0 then E_EMD13.Text      := '';
  if Pos('(Max 400Byte)',E_EMD15.Text)      > 0 then E_EMD15.Text      := '';
  if Pos('(Max 400Byte)',E_EMD17.Text)      > 0 then E_EMD17.Text      := '';
  if Pos('(Max 400Byte)',E_EMD21.Text)      > 0 then E_EMD21.Text      := '';
  if Pos('(Max 400Byte)',E_EMD22.Text)      > 0 then E_EMD22.Text      := '';
  if Pos('(Max 400Byte)',E_EMD23.Text)      > 0 then E_EMD23.Text      := '';
  if Pos('(Max 400Byte)',E_EMD25.Text)      > 0 then E_EMD25.Text      := '';
  if Pos('(Max 400Byte)',E_EMD27.Text)      > 0 then E_EMD27.Text      := '';
  if Pos('(Max 400Byte)',E_EMD31.Text)      > 0 then E_EMD31.Text      := '';
  if Pos('(Max 400Byte)',E_EMD32.Text)      > 0 then E_EMD32.Text      := '';
  if Pos('(Max 400Byte)',E_EMD33.Text)      > 0 then E_EMD33.Text      := '';
  if Pos('(Max 400Byte)',E_EMD35.Text)      > 0 then E_EMD35.Text      := '';
  if Pos('(Max 400Byte)',E_EMD37.Text)      > 0 then E_EMD37.Text      := '';
  if Pos('(Max 400Byte)',E_CEO32.Text)      > 0 then E_CEO32.Text      := '';
  if Pos('(Max 400Byte)',E_CEO34.Text)      > 0 then E_CEO34.Text      := '';
  if Pos('(Max 400Byte)',E_CEO37.Text)      > 0 then E_CEO37.Text      := '';
  //////////////////////////////////////////////////////////////////////////////
  for i := 1 to 5 do
  begin
       if vEvalNum = '1차' then
       begin
            FL_Comp := nil;
            FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i)));   //1차
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vKPI2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB11_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity1 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB12_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB13_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity3 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB14_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity4 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB15_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity5 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB16_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity6 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB17_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity7 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB18_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity8 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB19_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity9 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity10:= FL_Comp.Tag;

            ////////////////////////////////////////////////////////////////////////
            if (i <> 5) then
            begin
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd14_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd4 := FL_Comp.Tag;
            end;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd16_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd6 := FL_Comp.Tag;
       end

       else if vEvalNum = '2차' then
       begin
            FL_Comp := nil;
            FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i)));   //2차
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vKPI2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB21_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity1 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB22_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB23_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity3 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB24_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity4 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB25_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity5 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB26_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity6 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB27_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity7 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB28_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity8 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB29_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity9 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity10:= FL_Comp.Tag;

            ////////////////////////////////////////////////////////////////////////
            if (i <> 5) then
            begin
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd24_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd4 := FL_Comp.Tag;
            end;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd26_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd6 := FL_Comp.Tag;
       end

       else if vEvalNum = '3차' then
       begin
            if P_CEO35_1.Checked = True then vCEO5 := 'Y';
            if P_CEO35_2.Checked = True then vCEO5 := 'N';

            FL_Comp := nil;
            FL_Comp := TOnRadioButton(Self.FindComponent('RB_KPI32_'+IntToStr(i)));   //3차
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vKPI2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB31_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity1 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB32_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity2 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB33_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity3 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB34_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity4 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB35_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity5 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB36_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity6 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB37_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity7 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB38_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity8 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB39_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity9 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vCapacity10:= FL_Comp.Tag;

            ////////////////////////////////////////////////////////////////////////
            if (i <> 5) then
            begin
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd34_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd4 := FL_Comp.Tag;
            end;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB_Emd36_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vEmd6 := FL_Comp.Tag;

            if (i <> 5) then
            begin
                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_CEO31_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vCEO1 := FL_Comp.Tag;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_CEO33_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vCEO3 := FL_Comp.Tag;

                 FL_Comp := TOnRadioButton(Self.FindComponent('RB_CEO36_'+IntToStr(i)));
                 if (FL_Comp <> nil) and (FL_Comp.Checked) then vCEO6 := FL_Comp.Tag;
            end;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  if vEvalNum = '1차' then
  begin
       ParamSQL := 'Update PEZDWMAS                                                '+#13+
                   '   Set KPI11        = '''+ FloatToStr(E_KPI11.Value)     +''', '+#13+
                   '       KPI12        = '''+ IntToStr(vKPI2)               +''', '+#13+
                   '       KPI13        = '''+ E_KPI13.Text                  +''', '+#13+
                   '       Capacity11   = '''+ IntToStr(vCapacity1)          +''', '+#13+
                   '       Capacity12   = '''+ IntToStr(vCapacity2)          +''', '+#13+
                   '       Capacity13   = '''+ IntToStr(vCapacity3)          +''', '+#13+
                   '       Capacity14   = '''+ IntToStr(vCapacity4)          +''', '+#13+
                   '       Capacity15   = '''+ IntToStr(vCapacity5)          +''', '+#13+
                   '       Capacity16   = '''+ IntToStr(vCapacity6)          +''', '+#13+
                   '       Capacity17   = '''+ IntToStr(vCapacity7)          +''', '+#13+
                   '       Capacity18   = '''+ IntToStr(vCapacity8)          +''', '+#13+
                   '       Capacity19   = '''+ IntToStr(vCapacity9)          +''', '+#13+
                   '       Capacity110  = '''+ IntToStr(vCapacity10)         +''', '+#13+
                   '       Opinion11    = '''+ E_Opinion1.Text               +''', '+#13+
                   '       Opinion12    = '''+ E_Opinion2.Text               +''', '+#13+
                   '       Opinion13    = '''+ E_Opinion3.Text               +''', '+#13+
                   '       Opinion14    = '''+ E_Opinion4.Text               +''', '+#13+
                   '       Opinion15    = '''+ E_Opinion5.Text               +''', '+#13+
                   '       Opinion16    = '''+ E_Opinion6.Text               +''', '+#13+
                   '       Opinion17    = '''+ E_Opinion7.Text               +''', '+#13+
                   '       Opinion18    = '''+ E_Opinion8.Text               +''', '+#13+
                   '       Opinion19    = '''+ E_Opinion9.Text               +''', '+#13+
                   '       Opinion110   = '''+ E_Opinion110.Text             +''', '+#13+
                   '       EMD11        = '''+ E_EMD11.Text                  +''', '+#13+
                   '       EMD12        = '''+ E_EMD12.Text                  +''', '+#13+
                   '       EMD13        = '''+ E_EMD13.Text                  +''', '+#13+
                   '       EMD14        = '''+ IntToStr(vEmd4)               +''', '+#13+
                   '       EMD15        = '''+ E_EMD15.Text                  +''', '+#13+
                   '       EMD16        = '''+ IntToStr(vEmd6)               +''', '+#13+
                   '       EMD17        = '''+ E_EMD17.Text                  +''', '+#13+
                   '       writeman     = '''+ vLoginEmp                     +''', '+#13+
                   '       writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')      '+#13+
                   ' Where Rabasdate    = '''+ vRabasdate                    +'''  '+#13+
                   '   And Empno        = '''+ TMaxEmp.Fields[1].AsString    +'''  ';
  end

  else if vEvalNum = '2차' then
  begin
       ParamSQL := 'Update PEZDWMAS                                                '+#13+
                   '   Set KPI21        = '''+ FloatToStr(E_KPI21.Value)     +''', '+#13+
                   '       KPI22        = '''+ IntToStr(vKPI2)               +''', '+#13+
                   '       KPI23        = '''+ E_KPI23.Text                  +''', '+#13+
                   '       Capacity21   = '''+ IntToStr(vCapacity1)          +''', '+#13+
                   '       Capacity22   = '''+ IntToStr(vCapacity2)          +''', '+#13+
                   '       Capacity23   = '''+ IntToStr(vCapacity3)          +''', '+#13+
                   '       Capacity24   = '''+ IntToStr(vCapacity4)          +''', '+#13+
                   '       Capacity25   = '''+ IntToStr(vCapacity5)          +''', '+#13+
                   '       Capacity26   = '''+ IntToStr(vCapacity6)          +''', '+#13+
                   '       Capacity27   = '''+ IntToStr(vCapacity7)          +''', '+#13+
                   '       Capacity28   = '''+ IntToStr(vCapacity8)          +''', '+#13+
                   '       Capacity29   = '''+ IntToStr(vCapacity9)          +''', '+#13+
                   '       Capacity210  = '''+ IntToStr(vCapacity10)         +''', '+#13+
                   '       Opinion21    = '''+ E_Opinion1.Text               +''', '+#13+
                   '       Opinion22    = '''+ E_Opinion2.Text               +''', '+#13+
                   '       Opinion23    = '''+ E_Opinion3.Text               +''', '+#13+
                   '       Opinion24    = '''+ E_Opinion4.Text               +''', '+#13+
                   '       Opinion25    = '''+ E_Opinion5.Text               +''', '+#13+
                   '       Opinion26    = '''+ E_Opinion6.Text               +''', '+#13+
                   '       Opinion27    = '''+ E_Opinion7.Text               +''', '+#13+
                   '       Opinion28    = '''+ E_Opinion8.Text               +''', '+#13+
                   '       Opinion29    = '''+ E_Opinion9.Text               +''', '+#13+
                   '       Opinion210   = '''+ E_Opinion210.Text             +''', '+#13+
                   '       EMD21        = '''+ E_EMD21.Text                  +''', '+#13+
                   '       EMD22        = '''+ E_EMD22.Text                  +''', '+#13+
                   '       EMD23        = '''+ E_EMD23.Text                  +''', '+#13+
                   '       EMD24        = '''+ IntToStr(vEmd4)               +''', '+#13+
                   '       EMD25        = '''+ E_EMD25.Text                  +''', '+#13+
                   '       EMD26        = '''+ IntToStr(vEmd6)               +''', '+#13+
                   '       EMD27        = '''+ E_EMD27.Text                  +''', '+#13+
                   '       writeman     = '''+ vLoginEmp                     +''', '+#13+
                   '       writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')      '+#13+
                   ' Where Rabasdate    = '''+ vRabasdate                    +'''  '+#13+
                   '   And Empno        = '''+ TMaxEmp.Fields[1].AsString    +'''  ';
  end

  else if vEvalNum = '3차' then
  begin
       ParamSQL := 'Update PEZDWMAS                                                '+#13+
                   '   Set KPI31        = '''+ FloatToStr(E_KPI31.Value)     +''', '+#13+
                   '       KPI32        = '''+ IntToStr(vKPI2)               +''', '+#13+
                   '       KPI33        = '''+ E_KPI33.Text                  +''', '+#13+
                   '       Capacity31   = '''+ IntToStr(vCapacity1)          +''', '+#13+
                   '       Capacity32   = '''+ IntToStr(vCapacity2)          +''', '+#13+
                   '       Capacity33   = '''+ IntToStr(vCapacity3)          +''', '+#13+
                   '       Capacity34   = '''+ IntToStr(vCapacity4)          +''', '+#13+
                   '       Capacity35   = '''+ IntToStr(vCapacity5)          +''', '+#13+
                   '       Capacity36   = '''+ IntToStr(vCapacity6)          +''', '+#13+
                   '       Capacity37   = '''+ IntToStr(vCapacity7)          +''', '+#13+
                   '       Capacity38   = '''+ IntToStr(vCapacity8)          +''', '+#13+
                   '       Capacity39   = '''+ IntToStr(vCapacity9)          +''', '+#13+
                   '       Capacity310  = '''+ IntToStr(vCapacity10)         +''', '+#13+

                   '       Opinion31    = '''+ E_Opinion1.Text               +''', '+#13+
                   '       Opinion32    = '''+ E_Opinion2.Text               +''', '+#13+
                   '       Opinion33    = '''+ E_Opinion3.Text               +''', '+#13+
                   '       Opinion34    = '''+ E_Opinion4.Text               +''', '+#13+
                   '       Opinion35    = '''+ E_Opinion5.Text               +''', '+#13+
                   '       Opinion36    = '''+ E_Opinion6.Text               +''', '+#13+
                   '       Opinion37    = '''+ E_Opinion7.Text               +''', '+#13+
                   '       Opinion38    = '''+ E_Opinion8.Text               +''', '+#13+
                   '       Opinion39    = '''+ E_Opinion9.Text               +''', '+#13+
                   '       Opinion310   = '''+ E_Opinion310.Text             +''', '+#13+

                   '       EMD31        = '''+ E_EMD31.Text                  +''', '+#13+
                   '       EMD32        = '''+ E_EMD32.Text                  +''', '+#13+
                   '       EMD33        = '''+ E_EMD33.Text                  +''', '+#13+
                   '       EMD34        = '''+ IntToStr(vEmd4)               +''', '+#13+
                   '       EMD35        = '''+ E_EMD35.Text                  +''', '+#13+
                   '       EMD36        = '''+ IntToStr(vEmd6)               +''', '+#13+
                   '       EMD37        = '''+ E_EMD37.Text                  +''', '+#13+

                   '       CEO31        = '''+ IntToStr(vCEO1)               +''', '+#13+
                   '       CEO32        = '''+ E_CEO32.Text                  +''', '+#13+
                   '       CEO33        = '''+ IntToStr(vCEO3)               +''', '+#13+
                   '       CEO34        = '''+ E_CEO34.Text                  +''', '+#13+
                   '       CEO35        = '''+ vCEO5                         +''', '+#13+
                   '       CEO36        = '''+ IntToStr(vCEO6)               +''', '+#13+
                   '       CEO37        = '''+ E_CEO37.Text                  +''', '+#13+

                   '       writeman     = '''+ vLoginEmp                     +''', '+#13+
                   '       writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')      '+#13+
                   ' Where Rabasdate    = '''+ vRabasdate                    +'''  '+#13+
                   '   And Empno        = '''+ TMaxEmp.Fields[1].AsString    +'''  ';
  end;
  //////////////////////////////////////////////////////////////////////////////

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT 1, ''field2'', ''field3'', ''field4'',''field5''  '+
                   '  FROM PEZDWMAS                                          '+
                   ' WHERE rabasdate = '''+ vRabasdate                  +''' '+
                   '   AND empno     = '''+ TMaxEmp.Fields[1].AsString  +''' ';

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;

       if   TMaxDataSet.RecordCount = 0 then
       begin
            ServiceName := 'PEZ2000A_dml';
            Close;
            Sql.Clear;
            Sql.Text := 'Insert into PEZDWMAS                     '+#13+
                        '     ( Rabasdate, Empno )                '+#13+
                        '  values                                 '+#13+
                        ' ( '''+ vRabasdate                 +''', '+#13+
                        '   '''+ TMaxEmp.Fields[1].AsString +''' ) '; 

            if not TMaxDataSet.Execute then
            begin
                 ShowMessage(' 저장중 에러가 발생했습니다.');
                 System.Exit;
            end;
       end;
  end;

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  if vSendYN <> 'Y' then MessageDlg(' 저장이 완료되었습니다. ', mtConfirmation, [mbOk], 0);
  SB_Help.Panels[1].Text := ' 저장 완료';
  Application.ProcessMessages;
  vSendYN := 'N';
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  if (Copy(Hinsa_DisplayDate(vSysdate,'/'),6,5) >= vDW1frdate) and
     (Copy(Hinsa_DisplayDate(vSysdate,'/'),6,5) <= vDW1todate) then
      L_DwDate.Caption := '◆ 상사/CEO 평가 1차 평가기간은 '+ vDW1frdate +'일 ~ '+ vDW1todate +'일 입니다.';

  if (Copy(Hinsa_DisplayDate(vSysdate,'/'),6,5) >= vDW2frdate) and
     (Copy(Hinsa_DisplayDate(vSysdate,'/'),6,5) <= vDW2todate) then
      L_DwDate.Caption := '◆ 상사/CEO 평가 2차 평가기간은 '+ vDW2frdate +'일 ~ '+ vDW2todate +'일 입니다.';

  Pan_Help.Top     := 170;
  Pan_Help.Left    := 155;
  Pan_Help.Visible := True;
end;

procedure TFM_Main.BT_HelpExitClick(Sender: TObject);
begin
  Pan_Help.Visible := False;
end;

procedure TFM_Main.BT_SendClick(Sender: TObject);
var
   SavePlace: TBookmark;
begin
  if MessageDlg(TMaxEmp.Fields[2].AsString +
                ' 임원에 대한 의견조사를 완료하시겠습니까? '+#13+#13+
                '평가 완료후에는 수정이 불가능합니다.      ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    
  //SavePlace := TMaxEmp.GetBookmark;
  vSendYN := 'Y';
  BT_SaveClick(nil);             //최종 내역 자동 저장

  if not NoInputCheck then Exit; //입력 체크.


  ParamSQL := 'Update pezcamas ';

  if      vEvalNum = '1차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set dwe1conyn   = ''Y''                            ,  '+#13+
              '       dwe1condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end
  else if vEvalNum = '2차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set dwe2conyn   = ''Y''                            ,  '+#13+
              '       dwe2condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end
  else if vEvalNum = '3차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set dwe3conyn   = ''Y''                            ,  '+#13+
              '       dwe3condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end;

       ParamSQL := ParamSQL +#13+
              '       writeman    = '''+ vLoginEmp                 +''','+#13+
              '       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
              ' Where Rabasdate   = '''+ vRabasdate                +''' '+#13+
              '   And Empno       = '''+ TMaxEmp.Fields[1].AsString+''' ';


  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL); 

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  BT_Save.Enabled := False;
  BT_Send.Enabled := False;
    
  MessageDlg(TMaxEmp.Fields[2].AsString + ' ('+ vPayraName +')'+' 임원에 대한 평가가 완료되었습니다. ', mtConfirmation, [mbOk], 0);
  //////////////////////////////////////////////////////////////////////////////

  TMaxEmp.Close;
  TMaxEmp.Open;
  //TMaxEmp.GotoBookmark(SavePlace);
  //TMaxEmp.FreeBookmark(SavePlace);

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas1';
       Close;
       Sql.Clear;
       Sql.Text := 'select ''1차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe1conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe1empno = '''+ vLoginEmp  +'''                           '+#13+
                   //'   and to_char(sysdate,''yyyymmdd'') between dw1frdate and dw1todate'+#13+
                   '   and nvl(dwe1conyn,''N'') <> ''Y''                                '+#13+
                   ' Union                                                              '+#13+
                   'select ''2차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe2conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe2empno = '''+ vLoginEmp  +'''                           '+#13+
                   //'   and to_char(sysdate,''yyyymmdd'') between dw2frdate and dw2todate'+#13+
                   '   and nvl(dwe2conyn,''N'') <> ''Y''                                '+#13+
                   ' Union                                                              '+#13+
                   'select ''3차'' enum, empno, korname, payra, paycl, paydunm,         '+#13+
                   '       decode(dwe3conyn,''Y'',''완료'',''미완료'')                  '+#13+
                   '  from pezcamas a, pezcpbas b                                       '+#13+
                   ' where a.rabasdate = b.rabasdate                                    '+#13+
                   '   and a.dwe3empno = '''+ vLoginEmp  +'''                           '+#13+
                   '   and nvl(dwe3conyn,''N'') <> ''Y''                                '+#13+
                   ' Order by 7, 1, 4                                                ';

       ClearFieldInfo;
       AddField('ENUM'    , ftString, 3);
       AddField('EMPNO'   , ftString, 4);
       AddField('KORNAME' , ftString, 20);
       AddField('PAYRA'   , ftString, 3);
       AddField('PAYCL'   , ftString, 3);
       AddField('PAYDUNM' , ftString, 30);
       AddField('CONYN'   , ftString, 6);
       Open;
  end;

  PageControl1.ActivePage := TabSheet1;

  if TMaxDataSet.RecordCount > 0 then
     MessageDlg('나머지 '+ IntToStr(TMaxDataSet.RecordCount) + '명의 임원에 대한 평가를 계속하여 주시기 바랍니다. ', mtConfirmation, [mbOk], 0);

  SB_Help.Panels[1].Text := ' 평가 완료';
  Application.ProcessMessages;
end;

procedure TFM_Main.BT_Opinion2Click(Sender: TObject);
begin
  Pan_Opinion.Visible := False;
  TMaxDataSet.Close;
end;

procedure TFM_Main.BT_OpinionClick(Sender: TObject);
begin
  Pan_Opinion.Top     := 170;
  Pan_Opinion.Left    := 155;
  Pan_Opinion.Visible := True;

  if      PageControl1.ActivePage = TabSheet3 then L_Title1.Caption := '기업관';
  if      PageControl1.ActivePage = TabSheet3 then L_Title2.Caption := '전략적사고';
  if      PageControl1.ActivePage = TabSheet4 then L_Title1.Caption := 'Globalization 추구';
  if      PageControl1.ActivePage = TabSheet4 then L_Title2.Caption := '인력활용 극대화';
  if      PageControl1.ActivePage = TabSheet5 then L_Title1.Caption := '인재육성';
  if      PageControl1.ActivePage = TabSheet5 then L_Title2.Caption := 'SUPEX 추구';
  if      PageControl1.ActivePage = TabSheet6 then L_Title1.Caption := '경영지식 및 경험';
  if      PageControl1.ActivePage = TabSheet6 then L_Title2.Caption := '변화선도';
  if      PageControl1.ActivePage = TabSheet7 then L_Title1.Caption := '패기 및 건강관리';
  if      PageControl1.ActivePage = TabSheet7 then L_Title2.Caption := '';

  if      PageControl1.ActivePage = TabSheet3 then ParamSQL := 'SELECT Opinion11, Opinion12, Opinion21, Opinion22,''5'''
  else if PageControl1.ActivePage = TabSheet4 then ParamSQL := 'SELECT Opinion13, Opinion14, Opinion23, Opinion24,''5'''
  else if PageControl1.ActivePage = TabSheet5 then ParamSQL := 'SELECT Opinion15, Opinion16, Opinion25, Opinion26,''5'''
  else if PageControl1.ActivePage = TabSheet6 then ParamSQL := 'SELECT Opinion17, Opinion18, Opinion27, Opinion28,''5'''
  else if PageControl1.ActivePage = TabSheet7 then ParamSQL := 'SELECT Opinion19,''field2'', Opinion29,''field4'',''5'''
  else    Exit;

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select2';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);
       ParamSQL := '  FROM PEZDWMAS                                              '+#13+
                   ' WHERE rabasdate = '''+ vRabasdate                      +''' '+#13+
                   '   AND empno     = '''+ TMaxEmp.Fields[1].AsString      +''' ';
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('field1', ftString,  400);
       AddField('field2', ftString,  400);
       AddField('field3', ftString,  400);
       AddField('field4', ftString,  400);
       AddField('field5', ftString,  400);
       Open;

       E_OpinionR1.Text := Fields[0].AsString;
       E_OpinionR2.Text := Fields[1].AsString;
       E_OpinionR3.Text := Fields[2].AsString;
       E_OpinionR4.Text := Fields[3].AsString;
  end;
end;

procedure TFM_Main.BT_OBJClick(Sender: TObject);
var
   SavePlace: TBookmark;
begin
  if MessageDlg('해당 임원에 대한 평가를 반려하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  SavePlace := TMaxEmp.GetBookmark;

  ParamSQL := 'Update pezcamas ';

  if   vEvalNum = '2차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set dwe1conyn   = ''N''                            ,  '+#13+
              '       dwe1objyn   = ''Y''                            ,  '+#13+
              '       dwe1objdate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end
  else if vEvalNum = '3차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set dwe2conyn   = ''N''                            ,  '+#13+
              '       dwe2objyn   = ''Y''                            ,  '+#13+
              '       dwe2objdate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end;

       ParamSQL := ParamSQL +#13+
              '       writeman    = '''+ vLoginEmp                 +''','+#13+
              '       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
              ' Where Rabasdate   = '''+ vRabasdate                +''' '+#13+
              '   And Empno       = '''+ TMaxEmp.Fields[1].AsString+''' ';


  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  TMaxEmp.Close;
  TMaxEmp.Open;
  TMaxEmp.GotoBookmark(SavePlace);
  TMaxEmp.FreeBookmark(SavePlace);

  MessageDlg(' 반려되었습니다. ', mtConfirmation, [mbOk], 0);
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 반려 완료';
end;

Function TFM_Main.NoInputCheck : Boolean;
var iCnt : Integer;
begin
  if E_KPI11.Value = 0 then ShowMessage('KPI 종합점수를 입력하시기 바랍니다.');

  Read_SaveData;

  iCnt := 0;
  Result := False;

  TMaxDataSet.Open;
  with TMaxDataSet do
  begin
       if   ((vEvalNum = '1차') and (FieldByName('KPI11').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('KPI21').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('KPI31').AsInteger < 1)) then
       begin
            ShowMessage('KPI 종합점수 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet2;   Exit;
       end;
       if   ((vEvalNum = '1차') and (FieldByName('KPI12').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('KPI22').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('KPI32').AsInteger < 1)) then
       begin
            ShowMessage('업적종합등급 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet2;   Exit;
       end;
       if   ((vEvalNum = '1차') and (Trim(FieldByName('KPI13').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('KPI23').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('KPI33').AsString) = '')) then
       begin
            ShowMessage('업적평가 사유/의견 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet2;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity11').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity21').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity31').AsInteger < 1)) or
            ((vEvalNum = '1차') and (FieldByName('Capacity12').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity22').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity32').AsInteger < 1)) then
       begin
            ShowMessage('기업관 또는 전략적사고 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet3;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity13').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity23').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity33').AsInteger < 1)) or
            ((vEvalNum = '1차') and (FieldByName('Capacity14').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity24').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity34').AsInteger < 1)) then
       begin
            ShowMessage('Globalization 추구 또는 인력활용 극대화 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet4;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity15').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity25').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity35').AsInteger < 1)) or
            ((vEvalNum = '1차') and (FieldByName('Capacity16').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity26').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity36').AsInteger < 1)) then
       begin
            ShowMessage('인재육성 또는 Supex추구 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet5;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity17').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity27').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity37').AsInteger < 1)) or
            ((vEvalNum = '1차') and (FieldByName('Capacity18').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity28').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity38').AsInteger < 1)) then
       begin
            ShowMessage('경영지식및경험 또는 변화선도 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet6;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity19').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity29').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity39').AsInteger < 1)) then
       begin
            ShowMessage('패기 및 건강관리 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;

       if   ((vEvalNum = '1차') and (FieldByName('Capacity110').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Capacity210').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Capacity310').AsInteger < 1)) then
       begin
            ShowMessage('능력종합등급 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet8;   Exit;
       end;

       if   ((vEvalNum = '1차') and (Trim(FieldByName('Opinion110').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('Opinion210').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('Opinion310').AsString) = '')) then
       begin
            ShowMessage('능력종합등급에 따른 사유/의견 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet8;   Exit;
       end;

              
       if   ((vEvalNum = '1차') and (Trim(FieldByName('EMD11').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('EMD21').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('EMD31').AsString) = '')) or
            ((vEvalNum = '1차') and (Trim(FieldByName('EMD12').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('EMD22').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('EMD32').AsString) = '')) or
            ((vEvalNum = '1차') and (Trim(FieldByName('EMD13').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('EMD23').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('EMD33').AsString) = '')) then
       begin
            ShowMessage('대상자의 EMD 개발목표 및 강약점 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet9;   Exit;
       end;
           
       if   ((vEvalNum = '1차') and (     FieldByName('EMD14').AsInteger < 1 )) or
            ((vEvalNum = '2차') and (     FieldByName('EMD24').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (     FieldByName('EMD34').AsInteger < 1 )) or
            ((vEvalNum = '1차') and (Trim(FieldByName('EMD15').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('EMD25').AsString) = '')) or
            ((vEvalNum = '1차') and (     FieldByName('EMD16').AsInteger < 1 )) or
            ((vEvalNum = '2차') and (     FieldByName('EMD26').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (     FieldByName('EMD36').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (Trim(FieldByName('EMD35').AsString) = '')) or
            ((vEvalNum = '1차') and (Trim(FieldByName('EMD17').AsString) = '')) or
            ((vEvalNum = '2차') and (Trim(FieldByName('EMD27').AsString) = '')) or
            ((vEvalNum = '3차') and (Trim(FieldByName('EMD37').AsString) = '')) then
       begin
            ShowMessage('향후 개발에 관한 계획 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet9;   Exit;
       end;

       if   ((vEvalNum = '3차') and (     FieldByName('CEO31').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (Trim(FieldByName('CEO32').AsString) = '')) or
            ((vEvalNum = '3차') and (     FieldByName('CEO33').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (Trim(FieldByName('CEO34').AsString) = '')) then
       begin
            ShowMessage('CEO 등급평가 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet10;   Exit;
       end;

       if   ((vEvalNum = '3차') and (     FieldByName('CEO36').AsInteger < 1 )) or
            ((vEvalNum = '3차') and (Trim(FieldByName('CEO37').AsString) = '')) then
       begin
            ShowMessage('CEO 인사평가 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet10;   Exit;
       end;
  end;
  Result := True;//if iCnt > 0 then  ShowMessage(IntToStr(iCnt)+'건의 평가가 누락되어 있습니다. 확인후 완료하시기 바랍니다.');
end;

procedure TFM_Main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDbGrid(Sender) do
  begin    //if State = [gdSelected] then Canvas.Font.Color := clRed;
       if   DbGrid1.Fields[4].AsString = '완료' then Canvas.Font.Color := clBlue;
       DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFM_Main.E_KPI13Click(Sender: TObject);
begin
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_KPI13.Text) > 0)) then E_KPI13.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_KPI23.Text) > 0)) then E_KPI23.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_KPI33.Text) > 0)) then E_KPI33.Text := '';
  if  (vEvalNum = '1차') then E_KPI13.Font.Color := clBlack;
  if  (vEvalNum = '2차') then E_KPI23.Font.Color := clBlack;
  if  (vEvalNum = '3차') then E_KPI33.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion1Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Text := '';
  if Pos('(Max 400Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Text := '';
  E_Opinion1.Font.Color := clBlack;
  E_Opinion2.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion3Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion3.Text) > 0 then E_Opinion3.Text := '';
  if Pos('(Max 400Byte)',E_Opinion4.Text) > 0 then E_Opinion4.Text := '';
  E_Opinion3.Font.Color := clBlack;
  E_Opinion4.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion5Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion5.Text) > 0 then E_Opinion5.Text := '';
  if Pos('(Max 400Byte)',E_Opinion6.Text) > 0 then E_Opinion6.Text := '';
  E_Opinion5.Font.Color := clBlack;
  E_Opinion6.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion7Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion7.Text) > 0 then E_Opinion7.Text := '';
  if Pos('(Max 400Byte)',E_Opinion8.Text) > 0 then E_Opinion8.Text := '';
  E_Opinion7.Font.Color := clBlack;
  E_Opinion8.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion9Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion9.Text) > 0 then E_Opinion9.Text := '';
  E_Opinion9.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion110Click(Sender: TObject);
begin
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_Opinion110.Text) > 0)) then E_Opinion110.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_Opinion210.Text) > 0)) then E_Opinion210.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_Opinion310.Text) > 0)) then E_Opinion310.Text := '';
  if  (vEvalNum = '1차') then E_Opinion110.Font.Color := clBlack;
  if  (vEvalNum = '2차') then E_Opinion210.Font.Color := clBlack;
  if  (vEvalNum = '3차') then E_Opinion310.Font.Color := clBlack;
end;

procedure TFM_Main.E_EMD11Click(Sender: TObject);
begin
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_EMD11.Text) > 0)) then E_EMD11.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_EMD21.Text) > 0)) then E_EMD21.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_EMD31.Text) > 0)) then E_EMD31.Text := '';
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_EMD12.Text) > 0)) then E_EMD12.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_EMD22.Text) > 0)) then E_EMD22.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_EMD32.Text) > 0)) then E_EMD32.Text := '';
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_EMD13.Text) > 0)) then E_EMD13.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_EMD23.Text) > 0)) then E_EMD23.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_EMD33.Text) > 0)) then E_EMD33.Text := '';
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_EMD15.Text) > 0)) then E_EMD15.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_EMD25.Text) > 0)) then E_EMD25.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_EMD35.Text) > 0)) then E_EMD35.Text := '';
  if ((vEvalNum = '1차') and (Pos('(Max 400Byte)',E_EMD17.Text) > 0)) then E_EMD17.Text := '';
  if ((vEvalNum = '2차') and (Pos('(Max 400Byte)',E_EMD27.Text) > 0)) then E_EMD27.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_EMD37.Text) > 0)) then E_EMD37.Text := '';

  if (vEvalNum = '1차') then E_EMD11.Font.Color := clBlack;
  if (vEvalNum = '2차') then E_EMD21.Font.Color := clBlack;
  if (vEvalNum = '3차') then E_EMD31.Font.Color := clBlack;
  if (vEvalNum = '1차') then E_EMD12.Font.Color := clBlack;
  if (vEvalNum = '2차') then E_EMD22.Font.Color := clBlack;
  if (vEvalNum = '3차') then E_EMD32.Font.Color := clBlack;
  if (vEvalNum = '1차') then E_EMD13.Font.Color := clBlack;
  if (vEvalNum = '2차') then E_EMD23.Font.Color := clBlack;
  if (vEvalNum = '3차') then E_EMD33.Font.Color := clBlack;
  if (vEvalNum = '1차') then E_EMD15.Font.Color := clBlack;
  if (vEvalNum = '2차') then E_EMD25.Font.Color := clBlack;
  if (vEvalNum = '3차') then E_EMD35.Font.Color := clBlack;
  if (vEvalNum = '1차') then E_EMD17.Font.Color := clBlack;
  if (vEvalNum = '2차') then E_EMD27.Font.Color := clBlack;
  if (vEvalNum = '3차') then E_EMD37.Font.Color := clBlack;
end;

procedure TFM_Main.E_CEO32Click(Sender: TObject);
begin
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_CEO32.Text) > 0)) then E_CEO32.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_CEO34.Text) > 0)) then E_CEO34.Text := '';
  if ((vEvalNum = '3차') and (Pos('(Max 400Byte)',E_CEO37.Text) > 0)) then E_CEO37.Text := '';
  if  (vEvalNum = '3차') then E_CEO32.Font.Color := clBlack;
  if  (vEvalNum = '3차') then E_CEO34.Font.Color := clBlack;
  if  (vEvalNum = '3차') then E_CEO37.Font.Color := clBlack;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TMaxSession.Connect := False;
  TMaxDataSet.Destroy;
  TMaxEmp.Destroy;
  Action := caFree;
end;

procedure TFM_Main.E_LoginEmpChange(Sender: TObject);
begin
  if Length(Trim(E_LoginEmp.Text)) = 4 then  FormShow(Sender);
end;

procedure TFM_Main.BT_Result1Click(Sender: TObject);
begin
  FM_Result1.Show;
end;

procedure TFM_Main.BT_Result2Click(Sender: TObject);
begin
  FM_Result2.Show;
end;

end.
