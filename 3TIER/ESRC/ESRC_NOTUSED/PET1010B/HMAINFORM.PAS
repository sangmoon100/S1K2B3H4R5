unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, NotesHana_TLB, TmaxFunc;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    Insa_Session : TTMaxSession;
    L_Deptname: TOnShapeLabel;
    DBcommon: TTMaxDataSet;
    BT_Save: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Panel4: TPanel;
    Panel13: TPanel;
    Panel12: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Panel9: TPanel;
    ScrollBox1: TScrollBox;
    pnl_1: TPanel;
    SB_S1: TOnSkinButton;
    SB_A1: TOnSkinButton;
    SB_B1: TOnSkinButton;
    SB_C1: TOnSkinButton;
    SB_D1: TOnSkinButton;
    DownScore1: TOnShapeLabel;
    L_DetailTask1: TOnShapeLabel;
    L_validx1: TOnShapeLabel;
    L_bresultclass1: TOnShapeLabel;
    L_valfunction1: TOnShapeLabel;
    Panel14: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    E_Aim1: TOnEdit;
    pnl_2: TPanel;
    SB_S2: TOnSkinButton;
    SB_A2: TOnSkinButton;
    SB_B2: TOnSkinButton;
    SB_C2: TOnSkinButton;
    SB_D2: TOnSkinButton;
    DownScore2: TOnShapeLabel;
    L_DetailTask2: TOnShapeLabel;
    L_validx2: TOnShapeLabel;
    L_bresultclass2: TOnShapeLabel;
    L_valfunction2: TOnShapeLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    E_Aim2: TOnEdit;
    DownClass2: TPanel;
    pnl_3: TPanel;
    SB_S3: TOnSkinButton;
    SB_A3: TOnSkinButton;
    SB_B3: TOnSkinButton;
    SB_C3: TOnSkinButton;
    SB_D3: TOnSkinButton;
    DownScore3: TOnShapeLabel;
    L_DetailTask3: TOnShapeLabel;
    L_validx3: TOnShapeLabel;
    L_bresultclass3: TOnShapeLabel;
    L_valfunction3: TOnShapeLabel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    E_Aim3: TOnEdit;
    DownClass3: TPanel;
    pnl_4: TPanel;
    SB_S4: TOnSkinButton;
    SB_A4: TOnSkinButton;
    SB_B4: TOnSkinButton;
    SB_C4: TOnSkinButton;
    SB_D4: TOnSkinButton;
    DownScore4: TOnShapeLabel;
    L_DetailTask4: TOnShapeLabel;
    L_validx4: TOnShapeLabel;
    L_bresultclass4: TOnShapeLabel;
    L_valfunction4: TOnShapeLabel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    E_Aim4: TOnEdit;
    DownClass4: TPanel;
    pnl_5: TPanel;
    SB_S5: TOnSkinButton;
    SB_A5: TOnSkinButton;
    SB_B5: TOnSkinButton;
    SB_C5: TOnSkinButton;
    SB_D5: TOnSkinButton;
    SelfScore5: TOnShapeLabel;
    L_DetailTask5: TOnShapeLabel;
    L_validx5: TOnShapeLabel;
    L_bresultclass5: TOnShapeLabel;
    L_valfunction5: TOnShapeLabel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    E_Aim5: TOnEdit;
    SelfClass5: TPanel;
    pnl_6: TPanel;
    SB_S6: TOnSkinButton;
    SB_A6: TOnSkinButton;
    SB_B6: TOnSkinButton;
    SB_C6: TOnSkinButton;
    SB_D6: TOnSkinButton;
    DownScore6: TOnShapeLabel;
    L_DetailTask6: TOnShapeLabel;
    L_validx6: TOnShapeLabel;
    L_bresultclass6: TOnShapeLabel;
    L_valfunction6: TOnShapeLabel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    E_Aim6: TOnEdit;
    DownClass6: TPanel;
    pnl_7: TPanel;
    SB_S7: TOnSkinButton;
    SB_A7: TOnSkinButton;
    SB_B7: TOnSkinButton;
    SB_C7: TOnSkinButton;
    SB_D7: TOnSkinButton;
    DownScore7: TOnShapeLabel;
    L_DetailTask7: TOnShapeLabel;
    L_validx7: TOnShapeLabel;
    L_bresultclass7: TOnShapeLabel;
    L_valfunction7: TOnShapeLabel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    E_Aim7: TOnEdit;
    DownClass7: TPanel;
    pnl_8: TPanel;
    SB_S8: TOnSkinButton;
    SB_A8: TOnSkinButton;
    SB_B8: TOnSkinButton;
    SB_C8: TOnSkinButton;
    SB_D8: TOnSkinButton;
    DownScore8: TOnShapeLabel;
    L_DetailTask8: TOnShapeLabel;
    L_validx8: TOnShapeLabel;
    L_bresultclass8: TOnShapeLabel;
    L_valfunction8: TOnShapeLabel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    E_Aim8: TOnEdit;
    DownClass8: TPanel;
    pnl_9: TPanel;
    SB_S9: TOnSkinButton;
    SB_A9: TOnSkinButton;
    SB_B9: TOnSkinButton;
    SB_C9: TOnSkinButton;
    SB_D9: TOnSkinButton;
    DownScore9: TOnShapeLabel;
    L_DetailTask9: TOnShapeLabel;
    L_validx9: TOnShapeLabel;
    L_bresultclass9: TOnShapeLabel;
    L_valfunction9: TOnShapeLabel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    E_Aim9: TOnEdit;
    DownClass9: TPanel;
    pnl_10: TPanel;
    SB_S10: TOnSkinButton;
    SB_A10: TOnSkinButton;
    SB_B10: TOnSkinButton;
    SB_C10: TOnSkinButton;
    SB_D10: TOnSkinButton;
    DownScore10: TOnShapeLabel;
    L_DetailTask10: TOnShapeLabel;
    L_validx10: TOnShapeLabel;
    L_bresultclass10: TOnShapeLabel;
    L_valfunction10: TOnShapeLabel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    E_Aim10: TOnEdit;
    DownClass10: TPanel;
    sGrid1: TStringGrid;
    DownClass1: TPanel;
    OnNumberEdit1: TOnNumberEdit;
    Bt_Confirm: TOnFocusButton;
    Panel1: TPanel;
    Label2: TLabel;
    L_detailweight1: TOnShapeLabel;
    L_detailweight2: TOnShapeLabel;
    L_detailweight3: TOnShapeLabel;
    L_detailweight4: TOnShapeLabel;
    L_detailweight5: TOnShapeLabel;
    L_detailweight6: TOnShapeLabel;
    L_detailweight7: TOnShapeLabel;
    L_detailweight8: TOnShapeLabel;
    L_detailweight9: TOnShapeLabel;
    L_detailweight10: TOnShapeLabel;
    Panel15: TPanel;
    SelfClass1: TPanel;
    SelfScore1: TOnShapeLabel;
    SelfClass2: TPanel;
    SelfScore2: TOnShapeLabel;
    SelfClass3: TPanel;
    SelfScore3: TOnShapeLabel;
    SelfClass4: TPanel;
    SelfScore4: TOnShapeLabel;
    DownClass5: TPanel;
    DownScore5: TOnShapeLabel;
    SelfClass6: TPanel;
    SelfScore6: TOnShapeLabel;
    SelfClass7: TPanel;
    SelfScore7: TOnShapeLabel;
    SelfClass8: TPanel;
    SelfScore8: TOnShapeLabel;
    SelfClass9: TPanel;
    SelfScore9: TOnShapeLabel;
    SelfClass10: TPanel;
    SelfScore10: TOnShapeLabel;
    LName: TOnShapeLabel;
    Lpaycl: TOnShapeLabel;
    TMaxDML_HInsa: TTMaxDataSet;
    Edit1: TEdit;
    pnl_11: TPanel;
    SB_S11: TOnSkinButton;
    SB_A11: TOnSkinButton;
    SB_B11: TOnSkinButton;
    SB_C11: TOnSkinButton;
    SB_D11: TOnSkinButton;
    DownScore11: TOnShapeLabel;
    L_DetailTask11: TOnShapeLabel;
    L_validx11: TOnShapeLabel;
    L_bresultclass11: TOnShapeLabel;
    L_valfunction11: TOnShapeLabel;
    L_detailweight11: TOnShapeLabel;
    SelfScore11: TOnShapeLabel;
    Panel17: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel45: TPanel;
    E_Aim11: TOnEdit;
    DownClass11: TPanel;
    SelfClass11: TPanel;
    pnl_12: TPanel;
    SB_S12: TOnSkinButton;
    SB_A12: TOnSkinButton;
    SB_B12: TOnSkinButton;
    SB_C12: TOnSkinButton;
    SB_D12: TOnSkinButton;
    DownScore12: TOnShapeLabel;
    L_DetailTask12: TOnShapeLabel;
    L_validx12: TOnShapeLabel;
    L_bresultclass12: TOnShapeLabel;
    L_valfunction12: TOnShapeLabel;
    L_detailweight12: TOnShapeLabel;
    SelfScore12: TOnShapeLabel;
    Panel46: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel69: TPanel;
    E_Aim12: TOnEdit;
    DownClass12: TPanel;
    SelfClass12: TPanel;
    pnl_13: TPanel;
    SB_S13: TOnSkinButton;
    SB_A13: TOnSkinButton;
    SB_B13: TOnSkinButton;
    SB_C13: TOnSkinButton;
    SB_D13: TOnSkinButton;
    DownScore13: TOnShapeLabel;
    L_DetailTask13: TOnShapeLabel;
    L_validx13: TOnShapeLabel;
    L_bresultclass13: TOnShapeLabel;
    L_valfunction13: TOnShapeLabel;
    L_detailweight13: TOnShapeLabel;
    SelfScore13: TOnShapeLabel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    E_Aim13: TOnEdit;
    DownClass13: TPanel;
    SelfClass13: TPanel;
    pnl_14: TPanel;
    SB_S14: TOnSkinButton;
    SB_A14: TOnSkinButton;
    SB_B14: TOnSkinButton;
    SB_C14: TOnSkinButton;
    SB_D14: TOnSkinButton;
    DownScore14: TOnShapeLabel;
    L_DetailTask14: TOnShapeLabel;
    L_validx14: TOnShapeLabel;
    L_bresultclass14: TOnShapeLabel;
    L_valfunction14: TOnShapeLabel;
    L_detailweight14: TOnShapeLabel;
    SelfScore14: TOnShapeLabel;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    E_Aim14: TOnEdit;
    DownClass14: TPanel;
    SelfClass14: TPanel;
    pnl_15: TPanel;
    SB_S15: TOnSkinButton;
    SB_A15: TOnSkinButton;
    SB_B15: TOnSkinButton;
    SB_C15: TOnSkinButton;
    SB_D15: TOnSkinButton;
    DownScore15: TOnShapeLabel;
    L_DetailTask15: TOnShapeLabel;
    L_validx15: TOnShapeLabel;
    L_bresultclass15: TOnShapeLabel;
    L_valfunction15: TOnShapeLabel;
    L_detailweight15: TOnShapeLabel;
    SelfScore15: TOnShapeLabel;
    Panel77: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    E_Aim15: TOnEdit;
    DownClass15: TPanel;
    SelfClass15: TPanel;
    Button1: TButton;
    pnl_16: TPanel;
    SB_S16: TOnSkinButton;
    SB_A16: TOnSkinButton;
    SB_B16: TOnSkinButton;
    SB_C16: TOnSkinButton;
    SB_D16: TOnSkinButton;
    DownScore16: TOnShapeLabel;
    L_DetailTask16: TOnShapeLabel;
    L_validx16: TOnShapeLabel;
    L_bresultclass16: TOnShapeLabel;
    L_valfunction16: TOnShapeLabel;
    L_detailweight16: TOnShapeLabel;
    SelfScore16: TOnShapeLabel;
    Panel70: TPanel;
    Panel78: TPanel;
    Panel93: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel105: TPanel;
    E_Aim16: TOnEdit;
    DownClass16: TPanel;
    SelfClass16: TPanel;
    pnl_17: TPanel;
    SB_S17: TOnSkinButton;
    SB_A17: TOnSkinButton;
    SB_B17: TOnSkinButton;
    SB_C17: TOnSkinButton;
    SB_D17: TOnSkinButton;
    DownScore17: TOnShapeLabel;
    L_DetailTask17: TOnShapeLabel;
    L_validx17: TOnShapeLabel;
    L_bresultclass17: TOnShapeLabel;
    L_valfunction17: TOnShapeLabel;
    L_detailweight17: TOnShapeLabel;
    SelfScore17: TOnShapeLabel;
    Panel109: TPanel;
    Panel110: TPanel;
    Panel111: TPanel;
    Panel112: TPanel;
    Panel113: TPanel;
    Panel114: TPanel;
    E_Aim17: TOnEdit;
    DownClass17: TPanel;
    SelfClass17: TPanel;
    pnl_18: TPanel;
    SB_S18: TOnSkinButton;
    SB_A18: TOnSkinButton;
    SB_B18: TOnSkinButton;
    SB_C18: TOnSkinButton;
    SB_D18: TOnSkinButton;
    DownScore18: TOnShapeLabel;
    L_DetailTask18: TOnShapeLabel;
    L_validx18: TOnShapeLabel;
    L_bresultclass18: TOnShapeLabel;
    L_valfunction18: TOnShapeLabel;
    L_detailweight18: TOnShapeLabel;
    SelfScore18: TOnShapeLabel;
    Panel118: TPanel;
    Panel119: TPanel;
    Panel120: TPanel;
    Panel121: TPanel;
    Panel122: TPanel;
    Panel123: TPanel;
    E_Aim18: TOnEdit;
    DownClass18: TPanel;
    SelfClass18: TPanel;
    pnl_21: TPanel;
    SB_S21: TOnSkinButton;
    SB_A21: TOnSkinButton;
    SB_B21: TOnSkinButton;
    SB_C21: TOnSkinButton;
    SB_D21: TOnSkinButton;
    DownScore21: TOnShapeLabel;
    L_DetailTask21: TOnShapeLabel;
    L_validx21: TOnShapeLabel;
    L_bresultclass21: TOnShapeLabel;
    L_valfunction21: TOnShapeLabel;
    L_detailweight21: TOnShapeLabel;
    SelfScore21: TOnShapeLabel;
    Panel134: TPanel;
    Panel136: TPanel;
    Panel137: TPanel;
    Panel138: TPanel;
    Panel139: TPanel;
    Panel140: TPanel;
    E_Aim21: TOnEdit;
    DownClass21: TPanel;
    SelfClass21: TPanel;
    pnl_22: TPanel;
    SB_S22: TOnSkinButton;
    SB_A22: TOnSkinButton;
    SB_B22: TOnSkinButton;
    SB_C22: TOnSkinButton;
    SB_D22: TOnSkinButton;
    DownScore22: TOnShapeLabel;
    L_DetailTask22: TOnShapeLabel;
    L_validx22: TOnShapeLabel;
    L_bresultclass22: TOnShapeLabel;
    L_valfunction22: TOnShapeLabel;
    L_detailweight22: TOnShapeLabel;
    SelfScore22: TOnShapeLabel;
    Panel144: TPanel;
    Panel145: TPanel;
    Panel146: TPanel;
    Panel147: TPanel;
    Panel148: TPanel;
    Panel149: TPanel;
    E_Aim22: TOnEdit;
    DownClass22: TPanel;
    SelfClass22: TPanel;
    pnl_23: TPanel;
    SB_D23: TOnSkinButton;
    SB_S23: TOnSkinButton;
    SB_A23: TOnSkinButton;
    SB_B23: TOnSkinButton;
    SB_C23: TOnSkinButton;
    DownScore23: TOnShapeLabel;
    L_DetailTask23: TOnShapeLabel;
    L_validx23: TOnShapeLabel;
    L_bresultclass23: TOnShapeLabel;
    L_valfunction23: TOnShapeLabel;
    L_detailweight23: TOnShapeLabel;
    SelfScore23: TOnShapeLabel;
    Panel153: TPanel;
    Panel154: TPanel;
    Panel155: TPanel;
    Panel156: TPanel;
    Panel157: TPanel;
    Panel158: TPanel;
    E_Aim23: TOnEdit;
    DownClass23: TPanel;
    SelfClass23: TPanel;
    pnl_19: TPanel;
    SB_S19: TOnSkinButton;
    SB_A19: TOnSkinButton;
    SB_B19: TOnSkinButton;
    SB_C19: TOnSkinButton;
    SB_D19: TOnSkinButton;
    DownScore19: TOnShapeLabel;
    L_DetailTask19: TOnShapeLabel;
    L_validx19: TOnShapeLabel;
    L_bresultclass19: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    L_detailweight19: TOnShapeLabel;
    SelfScore19: TOnShapeLabel;
    Panel106: TPanel;
    Panel108: TPanel;
    Panel115: TPanel;
    Panel117: TPanel;
    Panel124: TPanel;
    Panel127: TPanel;
    E_Aim19: TOnEdit;
    DownClass19: TPanel;
    SelfClass19: TPanel;
    pnl_20: TPanel;
    SB_S20: TOnSkinButton;
    SB_A20: TOnSkinButton;
    SB_B20: TOnSkinButton;
    SB_C20: TOnSkinButton;
    SB_D20: TOnSkinButton;
    DownScore20: TOnShapeLabel;
    L_DetailTask20: TOnShapeLabel;
    L_validx20: TOnShapeLabel;
    L_bresultclass20: TOnShapeLabel;
    OnShapeLabel15: TOnShapeLabel;
    L_detailweight20: TOnShapeLabel;
    SelfScore20: TOnShapeLabel;
    Panel131: TPanel;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel135: TPanel;
    Panel141: TPanel;
    Panel150: TPanel;
    E_Aim20: TOnEdit;
    DownClass20: TPanel;
    SelfClass20: TPanel;
    pnl_24: TPanel;
    SB_D24: TOnSkinButton;
    SB_S24: TOnSkinButton;
    SB_A24: TOnSkinButton;
    SB_B24: TOnSkinButton;
    SB_C24: TOnSkinButton;
    DownScore24: TOnShapeLabel;
    L_DetailTask24: TOnShapeLabel;
    L_validx24: TOnShapeLabel;
    L_bresultclass24: TOnShapeLabel;
    L_valfunction24: TOnShapeLabel;
    L_detailweight24: TOnShapeLabel;
    SelfScore24: TOnShapeLabel;
    Panel159: TPanel;
    Panel161: TPanel;
    Panel162: TPanel;
    Panel163: TPanel;
    Panel164: TPanel;
    Panel165: TPanel;
    E_Aim24: TOnEdit;
    DownClass24: TPanel;
    SelfClass24: TPanel;
    pnl_25: TPanel;
    SB_D25: TOnSkinButton;
    SB_S25: TOnSkinButton;
    SB_A25: TOnSkinButton;
    SB_B25: TOnSkinButton;
    SB_C25: TOnSkinButton;
    DownScore25: TOnShapeLabel;
    L_DetailTask25: TOnShapeLabel;
    L_validx25: TOnShapeLabel;
    L_bresultclass25: TOnShapeLabel;
    L_valfunction25: TOnShapeLabel;
    L_detailweight25: TOnShapeLabel;
    SelfScore25: TOnShapeLabel;
    Panel126: TPanel;
    Panel128: TPanel;
    Panel130: TPanel;
    Panel143: TPanel;
    Panel152: TPanel;
    Panel169: TPanel;
    E_Aim25: TOnEdit;
    DownClass25: TPanel;
    SelfClass25: TPanel;
    pnl_27: TPanel;
    SB_D27: TOnSkinButton;
    SB_S27: TOnSkinButton;
    SB_A27: TOnSkinButton;
    SB_B27: TOnSkinButton;
    SB_C27: TOnSkinButton;
    DownScore27: TOnShapeLabel;
    L_DetailTask27: TOnShapeLabel;
    L_validx27: TOnShapeLabel;
    L_bresultclass27: TOnShapeLabel;
    L_valfunction27: TOnShapeLabel;
    L_detailweight27: TOnShapeLabel;
    SelfScore27: TOnShapeLabel;
    Panel173: TPanel;
    Panel174: TPanel;
    Panel175: TPanel;
    Panel176: TPanel;
    Panel177: TPanel;
    Panel178: TPanel;
    E_Aim27: TOnEdit;
    DownClass27: TPanel;
    SelfClass27: TPanel;
    pnl_26: TPanel;
    SB_D26: TOnSkinButton;
    SB_S26: TOnSkinButton;
    SB_A26: TOnSkinButton;
    SB_B26: TOnSkinButton;
    SB_C26: TOnSkinButton;
    DownScore26: TOnShapeLabel;
    L_DetailTask26: TOnShapeLabel;
    L_validx26: TOnShapeLabel;
    L_bresultclass26: TOnShapeLabel;
    L_valfunction26: TOnShapeLabel;
    L_detailweight26: TOnShapeLabel;
    SelfScore26: TOnShapeLabel;
    Panel182: TPanel;
    Panel183: TPanel;
    Panel184: TPanel;
    Panel185: TPanel;
    Panel186: TPanel;
    Panel187: TPanel;
    E_Aim26: TOnEdit;
    DownClass26: TPanel;
    SelfClass26: TPanel;
    pnl_28: TPanel;
    SB_D28: TOnSkinButton;
    SB_S28: TOnSkinButton;
    SB_A28: TOnSkinButton;
    SB_B28: TOnSkinButton;
    SB_C28: TOnSkinButton;
    DownScore28: TOnShapeLabel;
    L_DetailTask28: TOnShapeLabel;
    L_validx28: TOnShapeLabel;
    L_bresultclass28: TOnShapeLabel;
    L_valfunction28: TOnShapeLabel;
    L_detailweight28: TOnShapeLabel;
    SelfScore28: TOnShapeLabel;
    Panel170: TPanel;
    Panel179: TPanel;
    Panel188: TPanel;
    Panel190: TPanel;
    Panel191: TPanel;
    Panel192: TPanel;
    E_Aim28: TOnEdit;
    DownClass28: TPanel;
    SelfClass28: TPanel;
    pnl_29: TPanel;
    SB_D29: TOnSkinButton;
    SB_S29: TOnSkinButton;
    SB_A29: TOnSkinButton;
    SB_B29: TOnSkinButton;
    SB_C29: TOnSkinButton;
    DownScore29: TOnShapeLabel;
    L_DetailTask29: TOnShapeLabel;
    L_validx29: TOnShapeLabel;
    L_bresultclass29: TOnShapeLabel;
    L_valfunction29: TOnShapeLabel;
    L_detailweight29: TOnShapeLabel;
    SelfScore29: TOnShapeLabel;
    Panel196: TPanel;
    Panel197: TPanel;
    Panel198: TPanel;
    Panel199: TPanel;
    Panel200: TPanel;
    Panel201: TPanel;
    E_Aim29: TOnEdit;
    DownClass29: TPanel;
    SelfClass29: TPanel;
    pnl_30: TPanel;
    SB_D30: TOnSkinButton;
    SB_S30: TOnSkinButton;
    SB_A30: TOnSkinButton;
    SB_B30: TOnSkinButton;
    SB_C30: TOnSkinButton;
    DownScore30: TOnShapeLabel;
    L_DetailTask30: TOnShapeLabel;
    L_validx30: TOnShapeLabel;
    L_bresultclass30: TOnShapeLabel;
    L_valfunction30: TOnShapeLabel;
    L_detailweight30: TOnShapeLabel;
    SelfScore30: TOnShapeLabel;
    Panel205: TPanel;
    Panel206: TPanel;
    Panel207: TPanel;
    Panel208: TPanel;
    Panel209: TPanel;
    Panel210: TPanel;
    E_Aim30: TOnEdit;
    DownClass30: TPanel;
    SelfClass30: TPanel;
    pnl_32: TPanel;
    SB_D32: TOnSkinButton;
    SB_S32: TOnSkinButton;
    SB_A32: TOnSkinButton;
    SB_B32: TOnSkinButton;
    SB_C32: TOnSkinButton;
    DownScore32: TOnShapeLabel;
    L_DetailTask32: TOnShapeLabel;
    L_validx32: TOnShapeLabel;
    L_bresultclass32: TOnShapeLabel;
    L_valfunction32: TOnShapeLabel;
    L_detailweight32: TOnShapeLabel;
    SelfScore32: TOnShapeLabel;
    Panel214: TPanel;
    Panel215: TPanel;
    Panel216: TPanel;
    Panel217: TPanel;
    Panel218: TPanel;
    Panel219: TPanel;
    E_Aim32: TOnEdit;
    DownClass32: TPanel;
    SelfClass32: TPanel;
    pnl_31: TPanel;
    SB_D31: TOnSkinButton;
    SB_S31: TOnSkinButton;
    SB_A31: TOnSkinButton;
    SB_B31: TOnSkinButton;
    SB_C31: TOnSkinButton;
    DownScore31: TOnShapeLabel;
    L_DetailTask31: TOnShapeLabel;
    L_validx31: TOnShapeLabel;
    L_bresultclass31: TOnShapeLabel;
    L_valfunction31: TOnShapeLabel;
    L_detailweight31: TOnShapeLabel;
    SelfScore31: TOnShapeLabel;
    Panel223: TPanel;
    Panel224: TPanel;
    Panel225: TPanel;
    Panel226: TPanel;
    Panel227: TPanel;
    Panel228: TPanel;
    E_Aim31: TOnEdit;
    DownClass31: TPanel;
    SelfClass31: TPanel;
    pnl_33: TPanel;
    SB_D33: TOnSkinButton;
    SB_S33: TOnSkinButton;
    SB_A33: TOnSkinButton;
    SB_B33: TOnSkinButton;
    SB_C33: TOnSkinButton;
    DownScore33: TOnShapeLabel;
    L_DetailTask33: TOnShapeLabel;
    L_validx33: TOnShapeLabel;
    L_bresultclass33: TOnShapeLabel;
    L_valfunction33: TOnShapeLabel;
    L_detailweight33: TOnShapeLabel;
    SelfScore33: TOnShapeLabel;
    Panel166: TPanel;
    Panel172: TPanel;
    Panel181: TPanel;
    Panel195: TPanel;
    Panel204: TPanel;
    Panel213: TPanel;
    E_Aim33: TOnEdit;
    DownClass33: TPanel;
    SelfClass33: TPanel;
    pnl_34: TPanel;
    SB_D34: TOnSkinButton;
    SB_S34: TOnSkinButton;
    SB_A34: TOnSkinButton;
    SB_B34: TOnSkinButton;
    SB_C34: TOnSkinButton;
    DownScore34: TOnShapeLabel;
    L_DetailTask34: TOnShapeLabel;
    L_validx34: TOnShapeLabel;
    L_bresultclass34: TOnShapeLabel;
    L_valfunction34: TOnShapeLabel;
    L_detailweight34: TOnShapeLabel;
    SelfScore34: TOnShapeLabel;
    Panel233: TPanel;
    Panel234: TPanel;
    Panel235: TPanel;
    Panel236: TPanel;
    Panel237: TPanel;
    Panel238: TPanel;
    E_Aim34: TOnEdit;
    DownClass34: TPanel;
    SelfClass34: TPanel;
    pnl_35: TPanel;
    SB_D35: TOnSkinButton;
    SB_S35: TOnSkinButton;
    SB_A35: TOnSkinButton;
    SB_B35: TOnSkinButton;
    SB_C35: TOnSkinButton;
    DownScore35: TOnShapeLabel;
    L_DetailTask35: TOnShapeLabel;
    L_validx35: TOnShapeLabel;
    L_bresultclass35: TOnShapeLabel;
    L_valfunction35: TOnShapeLabel;
    L_detailweight35: TOnShapeLabel;
    SelfScore35: TOnShapeLabel;
    Panel242: TPanel;
    Panel243: TPanel;
    Panel244: TPanel;
    Panel245: TPanel;
    Panel246: TPanel;
    Panel247: TPanel;
    E_Aim35: TOnEdit;
    DownClass35: TPanel;
    SelfClass35: TPanel;
    pnl_36: TPanel;
    SB_D36: TOnSkinButton;
    SB_S36: TOnSkinButton;
    SB_A36: TOnSkinButton;
    SB_B36: TOnSkinButton;
    SB_C36: TOnSkinButton;
    DownScore36: TOnShapeLabel;
    L_DetailTask36: TOnShapeLabel;
    L_validx36: TOnShapeLabel;
    L_bresultclass36: TOnShapeLabel;
    L_valfunction36: TOnShapeLabel;
    L_detailweight36: TOnShapeLabel;
    SelfScore36: TOnShapeLabel;
    Panel251: TPanel;
    Panel252: TPanel;
    Panel253: TPanel;
    Panel254: TPanel;
    Panel255: TPanel;
    Panel256: TPanel;
    E_Aim36: TOnEdit;
    DownClass36: TPanel;
    SelfClass36: TPanel;
    pnl_37: TPanel;
    SB_D37: TOnSkinButton;
    SB_S37: TOnSkinButton;
    SB_A37: TOnSkinButton;
    SB_B37: TOnSkinButton;
    SB_C37: TOnSkinButton;
    DownScore37: TOnShapeLabel;
    L_DetailTask37: TOnShapeLabel;
    L_validx37: TOnShapeLabel;
    L_bresultclass37: TOnShapeLabel;
    L_valfunction37: TOnShapeLabel;
    L_detailweight37: TOnShapeLabel;
    SelfScore37: TOnShapeLabel;
    Panel260: TPanel;
    Panel261: TPanel;
    Panel262: TPanel;
    Panel263: TPanel;
    Panel264: TPanel;
    Panel265: TPanel;
    E_Aim37: TOnEdit;
    DownClass37: TPanel;
    SelfClass37: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure Eda_plan1Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SB_S1Click(Sender: TObject);
    procedure pnl_1Enter(Sender: TObject);
    procedure pnl_1Exit(Sender: TObject);
    procedure E_Aim1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_SaveClick(Sender: TObject);
    procedure sGrid1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    Start      : Boolean;
    GSempno    : String;     //Login사번
    WSempno    : String;     //Login사번

    Workemp1   : String;
    Workemp2   : String;
    Workemp3   : String;
    Workemp4   : String;
    Workemp5   : String;

    GSkorname  : String;    //Login성명
    GSgrade    : String[10];    //등급
    Csel_SQL   : String;
    Cupd_SQL   : String;
    Cupd_ret   : Boolean;
    Lrabasdate : string;

    Csel_ret   : Boolean;

    g_rscore, g_escore : string;

    g_payra_gubun, g_deptcode  : String;

    gTaskCode  : string;

    procedure Read_pehaimhis_com(rowid : integer);
    procedure ResetAllButton;
    procedure SearchEmp;
    procedure Send_Mail(stitle,Destempno, DestKorname, Body, gubun : string);

  public
    { Public declarations }

    procedure Cupd_Exec;
    procedure Csel_Open;
    function Csel_gfd(p_loc: Integer): String;
  end;

const
  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;
  Inter    : ILotusNotes_Hana;
  ConfirmYN : String;

implementation

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
   FL_Start := True;
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
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
    if RecordCount > 0 then Csel_ret := True;
   // close;
  end;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Eda_plan1Enter(Sender: TObject);
begin
  pnl_1.Color := clwhite;
end;


procedure TFM_Main.SpeedButton1Click(Sender: TObject);
begin
  //SpeedButton1.Down := True;
end;

procedure TFM_Main.SB_S1Click(Sender: TObject);
begin
  if ConfirmYN = 'Y' then
  begin
    MessageDlg('최종완료된 자료는 수정할 수 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Setfocus;
  if TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Text ='' then
  begin
    MessageDlg('달성실적을 먼저 입력하세요!', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;

  TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;

  TOnSkinButton(Sender).BtnDown := True;
  TOnSkinButton(Sender).Font.Color := clWhite;

  if g_payra_gubun = 'Y' then      //팀장이면
  begin
     //달성 등급
     //TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);
     if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;

     //달성 점수
     if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '100'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '90'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '80'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '70'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
       TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '60';
  end
  else if g_payra_gubun ='N' then
  begin
     //달성 등급
     //TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);
     if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
       TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
       TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
       TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
       TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
       TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;


     //달성 점수
     if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '100'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '90'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '80'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '70'
     else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
       TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '60';

  end;
  {
  //달성 등급
  //TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);
  if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
    TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
    TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
    TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
    TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
    TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;


  //달성 점수
  if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
    TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '100'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
    TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '90'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
    TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '80'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
    TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '70'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
    TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '60';
 }
end;

procedure TFM_Main.pnl_1Enter(Sender: TObject);
var
  i : integer;
  FColor : TColor;
begin
  FColor := $00F2E8E6;
  for i := 0 to (Sender As TPanel).ControlCount-1 do
  begin
     if ((Sender As TPanel).Controls[i] is TOnEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.FocusColor := $00FAF7F5;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.KillColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditLabel.Color := $00D3B3AF;
     end;
     if ((Sender As TPanel).Controls[i] is TPanel) then
     begin
       ((Sender As TPanel).Controls[i] As TPanel).Color := FColor;
     end;

     if ((Sender As TPanel).Controls[i] is TOnShapeLabel) then
     begin
       ((Sender As TPanel).Controls[i] As TOnShapeLabel).Brush.Color := FColor;
     end;

     if ((Sender As TPanel).Controls[i] is TOnNumberEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.FocusColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.KillColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditLabel.Color := FColor;
     end;
  end;

//  (Sender As TOnEdit).Repaint;
end;

procedure TFM_Main.pnl_1Exit(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to (Sender As TPanel).ControlCount-1 do
  begin
     if ((Sender As TPanel).Controls[i] is TOnEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.FocusColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.KillColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditLabel.Color := $00E7E7E7;
     end;
     if ((Sender As TPanel).Controls[i] is TPanel) then
     begin
       ((Sender As TPanel).Controls[i] As TPanel).Color := clwhite;
     end;
     if ((Sender As TPanel).Controls[i] is TOnShapeLabel) then
     begin
       ((Sender As TPanel).Controls[i] As TOnShapeLabel).Brush.Color := $00E7E7E7;
     end;
     if ((Sender As TPanel).Controls[i] is TOnNumberEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.FocusColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.KillColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditLabel.Color := $00E7E7E7;
     end;
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
      if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') then
      begin
       (Components[i] As TOnSkinButton).BtnDown    := False;
       (Components[i] As TOnSkinButton).Font.Color := clBlack;
      end;
    end;
  end;
end;

procedure TFM_Main.E_Aim1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
begin
  if Key = VK_DOWN then
  begin
    i := StrToInt(Copy(TOnEdit(Sender).Name,6,1))+1;
    if i > DetailCnt then
       E_Aim1.SetFocus
    else  if TPanel(Self.FindComponent('pnl_'+IntToStr(i))).visible then
     TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i))).SetFocus;
  end;
  if Key = VK_UP then
  begin
    i := StrToInt(Copy(TOnEdit(Sender).Name,6,1))-1;
    if i < 1 then
       TOnEdit(Self.FindComponent('E_Aim'+IntToStr(DetailCnt))).SetFocus
    else if TPanel(Self.FindComponent('pnl_'+IntToStr(i))).visible then
     TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i))).SetFocus;
  end;
end;

//저장버튼 클릭시
procedure TFM_Main.BT_SaveClick(Sender: TObject);
var i: integer;//, iSum, icnt: integer;
    dsum :Double;
    TPan: TPanel;
    TPan1:TPanel;
    TOnSLabel:TOnShapeLabel;
    TOnEdt: TOnEdit;
    sSeqNo : string;
    SqlText : string;
    sDownClass, sDownScore, sResult, sL_detailweight : String;
    sSelfClass, sSelfScore : String;
begin
   //공동목표 평가내용을 저장처리 한다.
   //저장처리 할때 매체에 대한 세부추진활동이 하나라도 누락되었으면 저장하지 못하도록 함.
   //
   //팀장이면 팀장평가를 피평가자이면 담당평가를 한다.
   if g_payra_gubun = 'Y' then      //팀장 평가 처리
   begin
      //먼저 담당평가가 완료되었는지 여부를 체크한다.
      //2005년도 평가에서 담당자 평가 안함.  20060120 JSH
     { for i := 1 to 10 do
      begin
         TPan := nil;
         TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
         if TPan <> nil then
         begin
            if TPan.Visible = true then
            begin
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(i)));
               if TOnSLabel <> nil then
               begin
                  if trim(TOnSLabel.ValueCaption) = '' then
                  begin
                     showmessage('담당자 평가에 대한 세부추진활동 평가점수가 누락되었습니다.'+#13+
                                 '담당자 평가 완료 후 팀장평가 하시기 바랍니다.');
                     TOnSLabel := nil;
                     exit;
                  end;
               end;
               TOnSLabel := nil;
            end
            else
               break;
         end;
      end;
     }
      //담당평가 체크 끝

      //팀장평가 체크 시작
      for i := 1 to 37 do
      begin
         TPan := nil;
         TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
         if TPan <> nil then
         begin
            if TPan.Visible = true then
            begin
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(i)));
               if TOnSLabel <> nil then
               begin
                  if trim(TOnSLabel.ValueCaption) = '' then
                  begin
                     showmessage('세부추진활동 평가점수가 누락되었습니다.'+#13+
                                 '확인 하시기 바랍니다1.');
                     TOnSLabel := nil;
                     exit;
                  end;
               end;
               TOnSLabel := nil;

               TOnEdt := nil;
               TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
               if TOnEdt <> nil then
               begin
                  if trim(TOnEdt.Text) = '' then
                  begin
                     showmessage('달성실적이 누락되었습니다.'+#13+
                                 '확인 하시기 바랍니다.');
                     TOnEdt := nil;
                     exit;
                  end;
               end;
               TOnEdt := nil;
            end
            else
               break;
         end;
      end;
      //기본사항 체크 끝

      //저장시작한다.
      dsum := 0;

      for i := 1 to 37 do
      begin
         TPan := nil;
         TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
         if TPan <> nil then
         begin
            if TPan.Visible = true then
            begin
               sSeqNo :='';
               sDownScore := '';
               sDownClass := '';
               sResult := '';
               sL_detailweight := '';

               //SEQNO값 지정
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_DetailTask'+IntToStr(i)));
               if TOnSLabel <> nil then
                  sSeqNo := inttostr(TOnSLabel.tag);

               //DETAILRSCORE값 지정
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(i)));
               if TOnSLabel <> nil then
                  sDownScore := trim(TOnSLabel.ValueCaption);
               TOnSLabel := nil;

              // inc(icnt);
               if sDownScore <> '' then
               begin
                  TOnSLabel := nil;
                  TOnSLabel := TOnShapeLabel(Self.FindComponent('L_detailweight'+IntToStr(i)));
                  if TOnSLabel <> nil then
                     sL_detailweight := trim(TOnSLabel.ValueCaption);
                  TOnSLabel := nil;

                  dsum := dsum +  (strtoint(sDownScore) * strtoint(sL_detailweight) * 0.01);
               end;

               //DETAILRCLASS값 지정
               TPan1:= nil;
               TPan1:= TPanel(Self.FindComponent('DownClass'+IntToStr(i)));
               if TPan1 <> nil then
               begin
                       if trim(TPan1.Caption) = var_GrdS  then  sDownClass := 'S'
                  else if trim(TPan1.Caption) = var_GrdA  then  sDownClass := 'A'
                  else if trim(TPan1.Caption) = var_GrdB  then  sDownClass := 'B'
                  else if trim(TPan1.Caption) = var_GrdC  then  sDownClass := 'C'
                  else if trim(TPan1.Caption) = var_GrdD  then  sDownClass := 'D';
               end;
               TPan1:= nil;

               //RESULT값 지정
               TOnEdt := nil;
               TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
               if TOnEdt <> nil then
                  sResult := trim(TOnEdt.Text);
               TOnEdt := nil;

               SqlText := 'UPDATE pehaimhis_com                         '+
                          '   SET DETAILRCLASS = ''' + sDownClass + ''' '+
                          '      ,DETAILRSCORE = '   + sDownScore +
                          '      ,RESULT       = ''' + sResult    + ''' '+
                          ' WHERE RABASDATE    = ''' + Lrabasdate + ''' '+
                          '   and deptcode     = ''' + g_deptcode + ''' '+
                          '   AND TASKCODE     = '   + gTaskCode  +
                          '   AND SEQNO        = '   + sSeqNo     ;

               Cupd_SQL := Sqltext;
               Cupd_Exec;
               if Cupd_ret = false then
               begin
                  showmessage('자료 저장중 오류가 발생했습니다.');
                  exit;
               end;

               sGrid1.Cells[3,sGrid1.Row] := FloatToStr(dsum);

            end
            else
            begin
               break;
            end;
         end;
      end;  //End for i := 1 to 10 do

      Bt_Confirm.Enabled := true;
      for i := 1 to sGrid1.RowCount -1 do
      begin
         if trim(sGrid1.Cells[3,i]) = '0'  then
         begin
            Bt_Confirm.Enabled := false;
            break;
         end;
      end;

   end  //End if g_payra_gubun = 'Y' then      //팀장 평가 처리

   //담당자 평가 처리
   else
   begin
      for i := 1 to 37 do
      begin
         TPan := nil;
         TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
         if TPan <> nil then
         begin
            if TPan.Visible = true then
            begin
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(i)));
               if TOnSLabel <> nil then
               begin
                  if trim(TOnSLabel.ValueCaption) = '' then
                  begin
                     showmessage('세부추진활동 평가점수가 누락되었습니다.'+#13+
                                 '확인 하시기 바랍니다2.');
                     TOnSLabel := nil;
                     exit;
                  end;
               end;
               TOnSLabel := nil;

               TOnEdt := nil;
               TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
               if TOnEdt <> nil then
               begin
                  if trim(TOnEdt.Text) = '' then
                  begin
                     showmessage('달성실적이 누락되었습니다.'+#13+
                                 '확인 하시기 바랍니다.');
                     TOnEdt := nil;
                     exit;
                  end;
               end;
               TOnEdt := nil;

            end
            else
               break;
         end;
      end;
      //기본사항 체크 끝

      //저장시작한다.
      dsum := 0;
      for i := 1 to 37 do
      begin
         TPan := nil;
         TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
         if TPan <> nil then
         begin
            if TPan.Visible = true then
            begin
               sSeqNo :='';
               sSelfScore := '';
               sSelfClass := '';
               sResult := '';
               sL_detailweight := '';

               //SEQNO값 지정
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_DetailTask'+IntToStr(i)));
               if TOnSLabel <> nil then
                  sSeqNo := inttostr(TOnSLabel.tag);

               //DETAILRSCORE값 지정
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(i)));
               if TOnSLabel <> nil then
                  sSelfScore := trim(TOnSLabel.ValueCaption);
               TOnSLabel := nil;

               if sSelfScore <> '' then
               begin
                  TOnSLabel := nil;
                  TOnSLabel := TOnShapeLabel(Self.FindComponent('L_detailweight'+IntToStr(i)));
                  if TOnSLabel <> nil then
                     sL_detailweight := trim(TOnSLabel.ValueCaption);
                  TOnSLabel := nil;

                  dsum := dsum +  (strtoint(sSelfScore) * strtoint(sL_detailweight) * 0.01);
               end;


               //DETAILRCLASS값 지정
               TPan1:= nil;
               TPan1:= TPanel(Self.FindComponent('SelfClass'+IntToStr(i)));
               if TPan1 <> nil then
               begin
                       if trim(TPan1.Caption) = var_GrdS  then  sSelfClass := 'S'
                  else if trim(TPan1.Caption) = var_GrdA  then  sSelfClass := 'A'
                  else if trim(TPan1.Caption) = var_GrdB  then  sSelfClass := 'B'
                  else if trim(TPan1.Caption) = var_GrdC  then  sSelfClass := 'C'
                  else if trim(TPan1.Caption) = var_GrdD  then  sSelfClass := 'D';
               end;
               TPan1:= nil;

               //RESULT값 지정
               TOnEdt := nil;
               TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
               if TOnEdt <> nil then
                  sResult := trim(TOnEdt.Text);
               TOnEdt := nil;

               SqlText := 'UPDATE pehaimhis_com                         '+
                          '   SET DETAILECLASS = ''' + sSelfClass + ''' '+
                          '      ,DETAILESCORE = '   + sSelfScore +
                          '      ,RESULT       = ''' +  sResult   + ''' '+
                          ' WHERE RABASDATE    = ''' + Lrabasdate + ''' '+
           		  '   and deptcode     = ''' + g_deptcode + ''' '+
                          '   AND TASKCODE     = '   + gTaskCode  +
                          '   AND SEQNO        =    '+ sSeqNo           ;

               Cupd_SQL := Sqltext;
               Cupd_Exec;
               if Cupd_ret = false then
               begin
                  showmessage('자료 저장중 오류가 발생했습니다.');
                  exit;
               end
               else
                  sGrid1.Cells[2,sGrid1.Row] := FloatToStr(dsum);
            end
            else
            begin
               break;
            end;
         end;
      end;

      Bt_Confirm.Enabled := true;
      for i := 1 to sGrid1.RowCount -1 do
      begin
         if trim(sGrid1.Cells[2,i]) = '0'  then
         begin
            Bt_Confirm.Enabled := false;
            break;
         end;
      end;

   end;

   {
   for i := 1 to 10 do
   begin
      TPan := nil;
      TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
      if TPan <> nil then
      begin
         if TPan.Visible = true then
         begin
            TOnSLabel := nil;
            TOnSLabel := TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(i)));
            if TOnSLabel <> nil then
            begin
               if trim(TOnSLabel.ValueCaption) = '' then
               begin
                  showmessage('세부추진활동 평가점수가 누락되었습니다.'+#13+
                              '확인 하시기 바랍니다.');
                  TOnSLabel := nil;
                  exit;
               end;
            end;
            TOnSLabel := nil;

            TOnEdt := nil;
            TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
            if TOnEdt <> nil then
            begin
               if trim(TOnEdt.Text) = '' then
               begin
                  showmessage('달성실적이 누락되었습니다.'+#13+
                              '확인 하시기 바랍니다.');
                  TOnEdt := nil;
                  exit;
               end;
            end;
            TOnEdt := nil;

         end
         else
            break;
      end;
   end;
   //기본사항 체크 끝

   iSum := 0;
   icnt := 0;
   //저장시작한다.
   for i := 1 to 10 do
   begin
      TPan := nil;
      TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
      if TPan <> nil then
      begin
         if TPan.Visible = true then
         begin
            sSeqNo :='';
            sDownScore := '';
            sDownClass := '';
            sResult := '';

            //SEQNO값 지정
            TOnSLabel := nil;
            TOnSLabel := TOnShapeLabel(Self.FindComponent('L_DetailTask'+IntToStr(i)));
            if TOnSLabel <> nil then
               sSeqNo := inttostr(TOnSLabel.tag);

            //DETAILRSCORE값 지정
            TOnSLabel := nil;
            TOnSLabel := TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(i)));
            if TOnSLabel <> nil then
               sDownScore := trim(TOnSLabel.ValueCaption);
            TOnSLabel := nil;

            inc(icnt);

            if sDownScore <> '' then
               iSum := iSum + strtoint(sDownScore);


            //DETAILRCLASS값 지정
            TPan1:= nil;
            TPan1:= TPanel(Self.FindComponent('DownClass'+IntToStr(i)));
            if TPan1 <> nil then
            begin
                    if trim(TPan1.Caption) = var_GrdS  then    sDownClass := 'S'
               else if trim(TPan1.Caption) = var_GrdA  then    sDownClass := 'A'
               else if trim(TPan1.Caption) = var_GrdB  then    sDownClass := 'B'
               else if trim(TPan1.Caption) = var_GrdC  then    sDownClass := 'C'
               else if trim(TPan1.Caption) = var_GrdD  then    sDownClass := 'D';
            end;
            TPan1:= nil;

            //RESULT값 지정
            TOnEdt := nil;
            TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i)));
            if TOnEdt <> nil then
               sResult := trim(TOnEdt.Text);
            TOnEdt := nil;

            SqlText := 'UPDATE pehaimhis_com SET'+
                             ' DETAILRCLASS = '''+  sDownClass +''''+
                            ' ,DETAILRSCORE = '+ sDownScore +
                            ' ,RESULT = '''+  sResult + ''''+
                       ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+
                         ' AND TASKCODE  = ' + gTaskCode +
                         ' AND SEQNO = '+ sSeqNo;
            Cupd_SQL := Sqltext;
            Cupd_Exec;
            if Cupd_ret = false then
            begin
               showmessage('자료 저장중 오류가 발생했습니다.');
               exit;
            end;
         end
         else
         begin
            break;
         end;
      end;
   end;
   }
   showmessage('저장처리 되었습니다.');

end;

procedure TFM_Main.Cupd_Exec;
var
 sql :string;
begin
  Cupd_ret := False;
  with TMaxDML_HInsa do
  begin
    //ServiceName := 'PED1010A_dml';
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    SQL.Text := Cupd_SQL;
    if Execute then Cupd_ret := True;
  end;
end;

procedure TFM_Main.Send_Mail(sTitle,Destempno,DestKorname, Body, gubun: string);           //메일 보네기
var
  SqlText : string;
  Ltime   : string;
begin
  try
   if not Assigned(Inter) then
    begin
      try
        Inter := CoLotusNotes_Hana.Create;
      except
        begin
          Inter := nil;
          System.Exit;
        end;
      end;
      try
      while not Inter.GetInstance do
      except
        begin
          if Assigned(Inter) then
             Inter := nil;
          Close;
          System.Exit;
       end;
      end;
    end;
    Inter.SendFrom   := GSkorname+' '+GSempno;
// 민용메일
    Inter.SendTo     := DestEmpno;
    Inter.SendToName := DestKorname;
//    Inter.SendTo     := 'Z286';
//    Inter.SendToName := '이민용';
    Inter.CorName    := 'HANARO';
    Inter.Subject    := sTitle;
    Inter.Body       := Body;
    Inter.SendMail;
  except
    MessageDlg(' 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
  end;
  Application.ProcessMessages;
end;

procedure TFM_Main.Read_pehaimhis_com(rowid : integer);
var SqlText: string;
    i, icnt: integer;
    TPan   : TPanel;
    TPan1  : TPanel;
    TOnSBtn:TOnSkinButton;
    TOnSLabel:TOnShapeLabel;
    TOnEdt : TOnEdit;
begin
   for i := 1 to 37 do
   begin
      TPan := nil;
      TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(i)));
      if TPan <> nil then
      begin
         TPan.Visible := false;
      end;

      TOnSBtn := nil;
      TOnSBtn := TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(i)));
      TOnSBtn.BtnDown := false;
      TOnSBtn.Font.Color:= clBlack;

      TOnSBtn := nil;
      TOnSBtn := TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(i)));
      TOnSBtn.BtnDown := false;
      TOnSBtn.Font.Color:= clBlack;

      TOnSBtn := nil;
      TOnSBtn := TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(i)));
      TOnSBtn.BtnDown := false;
      TOnSBtn.Font.Color:= clBlack;

      TOnSBtn := nil;
      TOnSBtn := TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(i)));
      TOnSBtn.BtnDown := false;
      TOnSBtn.Font.Color:= clBlack;

      TOnSBtn := nil;
      TOnSBtn := TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(i)));
      TOnSBtn.BtnDown := false;                        
      TOnSBtn.Font.Color:= clBlack;                    
      TOnSBtn := nil;                                  
   end;                                                

   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
   SqlText := 'SELECT NVL(TO_CHAR(A.SEQNO),''0'')||'';''||                                                                      '+ //1
              '       NVL(A.DETAILTASK,'''')||'';''||NVL(TO_CHAR(A.DETAILWEIGHT),''0'')||'';''||                                '+ //2,3
              '       NVL(A.VALIDX,'''')||'';''||NVL(A.VALFUNCTION,'''')||'';''||                                               '+ //4,5
              '       NVL(A.SRESULTCLASS,'''')||'';''||NVL(A.ARESULTCLASS,'''')||'';''||                                        '+ //6,7
              '       NVL(A.BRESULTCLASS,'''')||'';''||NVL(A.CRESULTCLASS,'''')||'';''||                                        '+ //8,9
              '       NVL(A.DRESULTCLASS,'''')||'';''||                                                                         '+ //10
              '       DECODE(A.DETAILECLASS,''S'','''+var_GrdS+''',''A'','''+var_GrdA+''',                                      '+
              '                             ''B'','''+var_GrdB+''',''C'','''+var_GrdC+''',                                      '+
              '                             ''D'','''+var_GrdD+''',A.DETAILECLASS)||'';''||                                     '+ //11
              '       NVL(A.DETAILESCORE,'''')||'';''||                                                                         '+ //12
              '       DECODE(A.DETAILRCLASS,''S'','''+var_GrdS+''',''A'','''+var_GrdA+''',                                      '+
              '                             ''B'','''+var_GrdB+''',''C'','''+var_GrdC+''',                                      '+
              '                             ''D'','''+var_GrdD+''',A.DETAILRCLASS)||'';''||                                     '+ //13
              '       NVL(A.DETAILRSCORE,'''')||'';''||NVL(A.RESULT,'''')                                                       '+ //14,15
              '  FROM pehaimhis_com A, pehreaim_bas B, pehremas C                                                               '+
              ' WHERE C.EMPNO                 = '''+GSempno + '''                                                               '+
              '   AND substr(A.DEPTCODE,1,4)  = substr(C.DEPTCODE,1,4)                                                          '+
              '   AND c.RABASDATE             = ''' + Lrabasdate + '''                                                          '+
              '   AND A.RABASDATE             = ''' + Lrabasdate + '''                                                          '+
              '   AND A.TASKCODE              = ' + trim(sGrid1.Cells[4,rowid])                                                  +
              '   AND NVL(A.EOBJYN,''N'')    <> ''Y''                                                                           '+
              '   AND NVL(A.ECONYN,''N'')     = ''Y''                                                                           '+
              '   AND A.RABASDATE             = B.RABASDATE                                                                     '+
              '   AND substr(A.DEPTCODE,1,4)  = substr(B.DEPTCODE,1,4)                                                          '+
              '   AND A.TASKCODE              = B.TASKCODE                                                                      '+
              ' ORDER BY B.TASKCODE, A.SEQNO                                                                                    ';

   with DBcommon do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      if DBcommon.RecordCount > 0 then
      begin
         icnt := 0;
         for i := 1 to RecordCount do
         begin
            inc(icnt);
            TPan := nil;
            TPan := TPanel(Self.FindComponent('pnl_'+IntToStr(icnt)));
            if TPan <> nil then
            begin
               TPan.Visible := true;
               //세부추진활동
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_DetailTask'+IntToStr(icnt)));
               if TOnSLabel <> nil then
               begin
                  TOnSLabel.ValueCaption := Csel_gfd(2);
                  TOnSLabel.tag:= strtoint(Csel_gfd(1));
               end;

               //상세비중
               //L_detailweight1
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_detailweight'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(3);

               //평가지표
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_validx'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(4);

               //평가기준목표
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_bresultclass'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(8);

               //평가산식
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('L_valfunction'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(5);

               //S
               TOnSBtn := nil;
               TOnSBtn := TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(icnt)));
               if TOnSBtn <> nil then
                 TOnSBtn.Caption := Csel_gfd(6);

               //E
               TOnSBtn := nil;
               TOnSBtn := TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(icnt)));
               if TOnSBtn <> nil then
                 TOnSBtn.Caption := Csel_gfd(7);

               //G
               TOnSBtn := nil;
               TOnSBtn := TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(icnt)));
               if TOnSBtn <> nil then
                 TOnSBtn.Caption := Csel_gfd(8);

               //N
               TOnSBtn := nil;
               TOnSBtn := TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(icnt)));
               if TOnSBtn <> nil then
                 TOnSBtn.Caption := Csel_gfd(9);

               //U
               TOnSBtn := nil;
               TOnSBtn := TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(icnt)));
               if TOnSBtn <> nil then
                 TOnSBtn.Caption := Csel_gfd(10);
               TOnSBtn := nil;

               //담당자평가_세부추진등급(DETAILRCLASS)
               TPan1 := nil;
               TPan1 := TPanel(Self.FindComponent('SelfClass'+IntToStr(icnt)));
               if TPan1 <> nil then
               begin
                 TPan1.Caption := trim(Csel_gfd(11));

                 //담당자인 경우 .. 팀장 평가점수가 없으면 담당평가추진등급을 활성화 시킨다.
                 if (g_payra_gubun = 'N') and (trim(sGrid1.Cells[3,sGrid1.Row]) = '0') then
                 begin
                    TOnSBtn := nil;
                         if TPan1.Caption = var_GrdS  then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdA  then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdB  then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdC  then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdD  then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(icnt)));
                    if TOnSBtn <> nil then
                    begin
                       TOnSBtn.BtnDown := True;
                       TOnSBtn.Font.Color := clWhite;
                    end;
                    TOnSBtn := nil;
                 end;
                 //
               end;
               TPan1 := nil;

               //담당자평가_세부추진점수(DETAILRSCORE) SelfScore1
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(12);
               TOnSLabel := nil;

               //팀장평가_세부추진등급(DETAILRCLASS)
               TPan1 := nil;
               TPan1 := TPanel(Self.FindComponent('DownClass'+IntToStr(icnt)));
               if TPan1 <> nil then
               begin
                 TPan1.Caption := trim(Csel_gfd(13));

                 //if (g_payra_gubun = 'Y') and () then
                 //만일 팀장평가점수가 존재하면 팀장평가점수에 대한 평가지표를 활성화 처리 시킨다.
                 if (trim(sGrid1.Cells[3,sGrid1.Row]) <> '0') then
                 begin
                    TOnSBtn := nil;
                         if TPan1.Caption = var_GrdS then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdA then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdB then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdC then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(icnt)))
                    else if TPan1.Caption = var_GrdD then    TOnSBtn := TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(icnt)));
                    if TOnSBtn <> nil then
                    begin
                       TOnSBtn.BtnDown := True;
                       TOnSBtn.Font.Color := clWhite;
                    end;
                    TOnSBtn := nil;
                 end;

               end;
               TPan1 := nil;

               //팀장평가_세부추진점수(DETAILRSCORE) DownScore1
               TOnSLabel := nil;
               TOnSLabel := TOnShapeLabel(Self.FindComponent('DownScore'+IntToStr(icnt)));
               if TOnSLabel <> nil then
                 TOnSLabel.ValueCaption := Csel_gfd(14);
               TOnSLabel := nil;

               //달성실적 (RESULT)
               TOnEdt := nil;
               TOnEdt := TOnEdit(Self.FindComponent('E_Aim'+IntToStr(icnt)));
               if TOnEdt <> nil then
                 TOnEdt.Text := Csel_gfd(15);

               TOnEdt := nil;
            end;
            next;
         end;
      end;
      close;
   end;
end;

procedure TFM_Main.sGrid1Click(Sender: TObject);
begin
   if sGrid1.Row > 0 then
   begin
     gTaskCode := trim(sGrid1.Cells[4,sGrid1.Row]);
     Read_pehaimhis_com(sGrid1.Row);
   end;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  SqlText       : string;
  v_pgroupratio : string;
  v_restiyn,v_e1valobjyn   : string;
  i           : integer;
  f_con_avg   : Double;
begin
   if FL_Start then
   begin
      FL_Start := False;
      SF_Main.Refresh;

      Application.ProcessMessages;

      GSempno       := Hinsa_Param(cmdLine,1);
      WSempno       := Hinsa_Param(cmdLine,1);

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
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := Insa_Session;
      if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
        Application.Terminate;

      //BT_Save.Caption := '업적평가 저장';

      //평가기준일 불러오기
      SqlText := 'SELECT  Value1                  '+
                 '  FROM pehrebas                 '+
                 ' WHERE rabasdate = ''00000000'' '+
                 '   AND gubun     = ''00''       '+
                 '   AND sgubun    = ''0001''     ';

      Csel_SQL := SqlText;
      Csel_Open;
      Lrabasdate := DBcommon.FieldByName('SEL_DATA').AsString;

      //평가담당자 불러오기
      SqlText := 'SELECT  Value1||'';''||Value2||'';''||  '+
                 '        Value3||'';''||Value4||'';''||  '+
                 '        Value5                          '+
                 '  FROM pehrebas                         '+
                 ' WHERE rabasdate = '''+Lrabasdate+'''   '+
                 '   AND gubun     = ''11''               '+
                 '   AND sgubun    = ''0005''             ';

      Csel_SQL := SqlText;
      Csel_Open;
      Workemp1 := Csel_gfd(1);
      Workemp2 := Csel_gfd(2);
      Workemp3 := Csel_gfd(3);
      Workemp4 := Csel_gfd(4);
      Workemp5 := Csel_gfd(5);

      if  (WSempno = Workemp1)  or  (WSempno = Workemp2)  or (WSempno = Workemp3)      or
          (WSempno = Workemp4)  or  (WSempno = Workemp5)  or (Copy(WSempno,1,1) = 'D') then
      begin
           Gsempno         := Edit1.Text;
           Edit1.Visible   := True;
           Button1.Visible := True;
      end;
      SearchEmp;
  end;
end;

procedure TFM_Main.SearchEmp;
var
  SqlText       : string;
  v_pgroupratio : string;
  v_restiyn,v_e1valobjyn   : string;
  i           : integer;
  f_con_avg   : Double;
begin
      //부서명을 조회한다.
      SqlText := 'select b.deptname||'';''|| a.deptcode||'';''||                '+
                 '       decode(a.payra,''2C'',''Y'',''C11'',''Y'',''N'') payra '+
                 '  from pehremas a, pycdept b, pehreaim_combas c               '+
                 ' where a.empno    = '''+GSempno + '''                         '+
                 '   and a.pstate   < ''80''                                    '+
                 '   and a.orgnum   = b.orgnum                                  '+
                 '   and a.deptcode = b.deptcode                                '+
		 '   and a.empno    = c.empno                                   '+
                 '   and a.rabasdate= c.rabasdate                               '+
          	 '   and a.rabasdate= '''+Lrabasdate + '''                      '+
		 '   and c.senioryn = ''Y''                                     '+
                 '   and (c.payra = ''2C'' or c.payra = ''C11'')                ';   

      with DBcommon do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            L_Deptname.ValueCaption:= Csel_gfd(1);
            g_payra_gubun := Csel_gfd(3);
            g_deptcode    := Csel_gfd(2);
            //if g_payra_gubun = 'Y' then Bt_Confirm.Caption := '결재'
            //else if g_payra_gubun = 'N' then Bt_Confirm.Caption := '결재상신';

            close;
         end
         else
         begin
            close;
            showmessage('[기술]직군-(NW운용)직종 팀장님만 등록 가능합니다.'+#13+#13+'프로그램을 강제 종료 합니다.');
            Application.Terminate;
            Exit;
         end;
      end;

      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      //만일 최종완료여부가 Y가 아닐 경우
      //매체에 대한 평가점수가 모두 0보다 크면 최종완료 버튼을 활성화 시킨다.
      SqlText := 'select distinct nvl(a.rconyn,''N'')                    '+
	         '  from pehaimhis_com a, pehreaim_combas c              '+
	         ' where c.empno                ='''+GSempno + '''       '+
		 '   and substr(a.deptcode,1,4) = substr(c.deptcode,1,4) '+
           	 '   and a.rabasdate            =''' + Lrabasdate + '''  '+
                 '   and nvl(a.eobjyn,''N'')   <> ''Y''                  '+
                 '   and nvl(a.econyn,''N'')    = ''Y''                  ';

      with DBcommon do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            ConfirmYN := trim(DBcommon.FieldByName('SEL_DATA').AsString);
            //if trim(DBcommon.FieldByName('SEL_DATA').AsString) = 'Y' then
            //평가자이면서 평가완료된 자료는 결재처리 할수 없다.
            if (g_payra_gubun = 'Y') and (ConfirmYN = 'Y') then
            begin
               Bt_Confirm.Enabled := false;
               BT_Save.Enabled := false;
            end;
            //등록자이면서 결재상신 했거나 결재완료한경우 결재상신할 수 없도록 한다.
            if (g_payra_gubun = 'N') and (ConfirmYN <> 'N') then
            begin
               Bt_Confirm.Enabled := false;
               BT_Save.Enabled := false;
            end;
         //우선 강제로 막음. 맨 위에 것과 매치가 안됨. 무조건 이 메시지 때문에 중단됨.
         //평가자이면서 피평가자가 평가완료처리를 하지 않은 경우 강제종료처리 시킨다.
           { if (g_payra_gubun = 'Y') and (trim(DBcommon.FieldByName('SEL_DATA').AsString) = 'N') then
            begin
               showmessage('공동목표등록자가 미완료 상태입니다. '+ #13+ #13+
                           '등록자 평가완료 후 평가를 하실수 있습니다.'+ #13+ #13+
                           '프로그램 자동종료 됩니다.');
               application.Terminate;
               exit;
            end;
         }

         end;
         close;
      end;

      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      //매체명, 평가점수를 조회한다.
      SqlText := 'SELECT NVL(B.TASKNAME,'''')||'';''||B.TASKCODE||'';''||                 '+
                 '       NVL(round(SUM((A.DETAILRSCORE *DETAILWEIGHT)/100),2),0)||'';''|| '+
                 '       NVL(round(SUM((A.DETAILESCORE *DETAILWEIGHT)/100),2),0) SEL_DATA '+
                 '  FROM pehaimhis_com A, pehreaim_bas B, pehremas C                      '+
                 ' WHERE C.EMPNO                = '''+GSempno + '''                       '+
                 '   AND substr(A.DEPTCODE,1,4) = substr(C.DEPTCODE,1,4)                  '+
                 '   AND A.RABASDATE            = ''' + Lrabasdate + '''                  '+
                 '   AND NVL(A.EOBJYN,''N'')   <> ''Y''                                   '+
                 '   AND NVL(A.ECONYN,''N'')    = ''Y''                                   '+
                 '   AND A.RABASDATE            = B.RABASDATE                             '+
                 '   AND A.RABASDATE            = c.RABASDATE                             '+
                 '   AND substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE,1,4)                  '+
                 '   AND A.TASKCODE             = B.TASKCODE                              '+
	         ' GROUP BY NVL(B.TASKNAME,''''), B.TASKCODE                              ';


      with DBcommon do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            sGrid1.RowCount := RecordCount + 1;
            f_con_avg := 0;

            for i := 1 to RecordCount do
            begin
               sGrid1.Cells[1,i] :=  Csel_gfd(1);
               sGrid1.Cells[2,i] :=  ''; //Csel_gfd(4);//dsa2000  //등록자평가점수: 세부추진하향점수. 좀 이상함. 밑에것과 바뀐건 아닌지? JSH
               sGrid1.Cells[3,i] :=  Csel_gfd(3);  //팀장평가점수  : 세부추진자기점수
               sGrid1.Cells[4,i] :=  Csel_gfd(2);  //TASKCODE 값 임시 보관 안보임...

               f_con_avg := f_con_avg + strtofloat(Csel_gfd(3));
               next;  // 꼭 적어줘야 함. 아니면 맨 처음 조회한것만 나옴.
            end;

            OnNumberEdit1.Value := f_con_avg/RecordCount;
         end;
         close;
      end;

      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      //등록자명, 등록자 직급을 조회한다.
      SqlText := 'select b.empno||'';''||b.korname||'';''||c.codename                    '+
                 '  from pehremas A, pehreaim_combas B,                                  '+
                 '      (select codeno, codename from pyccode where codeid = ''I112'') C '+
                 ' where a.rabasdate = b.rabasdate                                       '+
                 '   and a.rabasdate  = '''+Lrabasdate + '''                             '+
                 '   and a.empno    = '''+GSempno + '''                                  '+
                 '   and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)                 '+
                 '   and b.senioryn = ''Y''                                              '+
                 '   and b.paycl    = c.codeno                                           ';



      with DBcommon do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            LName.ValueCaption := Csel_gfd(2);
            Lpaycl.ValueCaption := Csel_gfd(3);
         end;
         close;
      end;


      //결재상신/결재버튼 컨트롤 한다.
      if Bt_Confirm.Enabled = true then
      begin
         if g_payra_gubun = 'Y' then
         begin
            for i := 1 to sGrid1.RowCount -1 do
            begin
               if trim(sGrid1.Cells[3,i]) = '0' then
               begin
                  Bt_Confirm.Enabled :=  false;
                  break;
               end;
            end;
         end
         else if g_payra_gubun = 'N' then
         begin
            for i := 1 to sGrid1.RowCount -1 do
            begin
               if trim(sGrid1.Cells[2,i]) = '0' then
               begin
                  Bt_Confirm.Enabled :=  false;
                  break;
               end;
            end;
         end;
      end;

      if trim(sGrid1.Cells[1,1]) <> '' then
      begin
         gTaskCode := trim(sGrid1.Cells[4,1]);
         Read_pehaimhis_com(1); //세부추진활동, 평가지표.... 등을 보여준다.
      end;


   with sGrid1 do
   begin
     Cells[1,0] := '매체명';
    // Cells[2,0] := '등록자자평가점수';
     Cells[3,0] := '팀장평가점수';
   end;
end;

procedure TFM_Main.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Left : integer;
    ileft:integer;
begin
   ileft := Rect.Right - Rect.Left - sGrid1.Canvas.TextWidth(sGrid1.Cells[ACol,ARow]);
   Left := Rect.Left + (ileft div 2);
   if ARow = 0 then
   begin
      sGrid1.Canvas.Font.Style := [fsBold];
      sGrid1.Canvas.FillRect(Rect);
   end;
   sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var SqlText, SRconyn : string;
    i : integer;
begin
   //만일 등록자(피평가자)이면 평가완료여부를 'R'로 처리하고
   //평가자이면 평가완료여부를 'Y'로 처리한다.
   if g_payra_gubun = 'N' then        //담당자이면
   begin
      SRconyn := 'R';
      for i := 1 to sGrid1.RowCount -1 do
      begin
         if trim(sGrid1.Cells[2,i]) = '0' then
         begin
            showmessage('등록자 평가점수가 누락되었습니다.' +#13+
                        '매체별 평가점수를 확인하시기 바랍니다.');
            exit;;
         end;
      end;
   end
   else if g_payra_gubun = 'Y' then   //팀장이면
   begin
      SRconyn := 'Y';
      for i := 1 to sGrid1.RowCount -1 do
      begin
         if trim(sGrid1.Cells[3,i]) = '0' then
         begin
            showmessage('평가자 평가점수가 누락되었습니다.' +#13+
                        '매체별 평가점수를 확인하시기 바랍니다.');
            exit;;
         end;

         if trim(sGrid1.Cells[3,i]) = '' then
         begin
            showmessage('매체가 없습니다.' +#13+
                        '매체가 먼저 등록되어야 합니다.');
            exit;;
         end;
      end;
   end;

   if MessageBox(handle,PChar('['+ trim(Bt_Confirm.Caption)+'] 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                                 '['+ trim(Bt_Confirm.Caption)+'] 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
   begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
   end;

   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
   //팀에 대한 매체별 공동목표 평가가 완료되었는지 확인한 후
   //공동목표평가가 완료되었으면 팀원중에서 공동목표대상자들에게 평가완료 메일을 보낸다.
   SqlText := 'update pehaimhis_com set                           '+
              '       rconyn    = ''' + SRconyn + '''             '+
              ' where rabasdate = ''' + Lrabasdate + '''          '+
              '   and nvl(eobjyn,''N'')    <> ''Y''               '+
              '   and nvl(econyn,''N'')    =  ''Y''               '+
              '   and substr(deptcode,1,4) =                      '+
              '       (select substr(deptcode,1,4)                '+
              '          from pehremas                            '+
              '         where rabasdate = ''' + Lrabasdate + '''  '+
              '           and empno     = ''' + GSempno    + ''') ';


    Cupd_SQL := Sqltext;
    Cupd_Exec;
    if Cupd_ret = false then
    begin
       showmessage('자료 저장중 오류가 발생했습니다.');
       exit;
    end
    else
    begin
       Bt_Confirm.Enabled := false;
       BT_Save.Enabled := false;
       showmessage(trim(Bt_Confirm.Caption) + '처리 되었습니다.');

      //결재상신인 경우 결재자에게 메일을 보낸다.

      // 결재인 경우 등록자에게 결재완료 메일을 보낸다.
    end;
end;

procedure TFM_Main.Button1Click(Sender: TObject);
begin
     GSempno := Edit1.Text;
     SearchEmp;
end;

end.
