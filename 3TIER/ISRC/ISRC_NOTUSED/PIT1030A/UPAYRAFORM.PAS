unit UPayRaForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit;

type
  TFDuty = class(TForm)
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    OnSchemeForm1: TOnSchemeForm;
    StatusBar1: TStatusBar;
    ds1: TDataSource;
    TMaxDataSet1: TTMaxDataSet;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    SG_Main: TStringGrid;
    OnEdit1: TOnEdit;
    procedure FormPaint(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDuty: TFDuty;

implementation

uses
  Hinsa_TmaxDM;

{$R *.DFM}


//=============================================================================//
// Button 관련 Event...
//=============================================================================//
procedure TFDuty.BB_closeClick(Sender: TObject);
begin
  Close;
end;

//=============================================================================//
// Form 관련 Event...
//=============================================================================//
procedure TFDuty.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;

end;

procedure TFDuty.FormActivate(Sender: TObject);
begin
end;

//=============================================================================//
// procedure & function
//=============================================================================//


//=============================================================================//

end.
