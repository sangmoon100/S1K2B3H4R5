unit PIR20704;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ExtCtrls, OnShapeLabel, OnScheme;

type
  TTestPopup = class(TForm)
    SF_Main: TOnSchemeForm;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel21: TOnShapeLabel;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel23: TOnShapeLabel;
    OnShapeLabel24: TOnShapeLabel;
    OnShapeLabel25: TOnShapeLabel;
    OnShapeLabel26: TOnShapeLabel;
    OnShapeLabel29: TOnShapeLabel;
    OnShapeLabel28: TOnShapeLabel;
    BtClose: TOnFocusButton;
    OnShapeLabel27: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    OnShapeLabel10: TOnShapeLabel;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel14: TOnShapeLabel;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel17: TOnShapeLabel;
    OnShapeLabel19: TOnShapeLabel;
    OnShapeLabel30: TOnShapeLabel;
    OnShapeLabel31: TOnShapeLabel;
    OnShapeLabel32: TOnShapeLabel;
    OnShapeLabel33: TOnShapeLabel;
    OnShapeLabel34: TOnShapeLabel;
    OnShapeLabel35: TOnShapeLabel;
    OnShapeLabel36: TOnShapeLabel;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    procedure BtCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestPopup: TTestPopup;

implementation

{$R *.DFM}

procedure TTestPopup.BtCloseClick(Sender: TObject);
begin
     Close;
end;

end.
