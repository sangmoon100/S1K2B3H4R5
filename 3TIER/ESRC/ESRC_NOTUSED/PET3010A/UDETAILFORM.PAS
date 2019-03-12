unit UDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel, OnSkinBtn,
  StdCtrls, OnFocusButton, OnScheme;

type
  TFDetailForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
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
    DownClass1: TPanel;
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
    DownScore5: TOnShapeLabel;
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
    DownClass5: TPanel;
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
    OnFocusButton1: TOnFocusButton;
    procedure OnFocusButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetailForm: TFDetailForm;

implementation

{$R *.DFM}

procedure TFDetailForm.OnFocusButton1Click(Sender: TObject);
begin
   close;
end;

end.
