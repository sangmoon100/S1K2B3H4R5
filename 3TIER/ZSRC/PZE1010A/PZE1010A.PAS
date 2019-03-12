unit PZE1010A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, Tmax_session, StdCtrls, OnFocusButton, ExtCtrls,
  jpeg, OnEditBaseCtrl, OnEditStdCtrl, OnLineLabel, OnScheme;

type
  TForm1 = class(TForm)
    SF_Skin: TOnSchemeForm;
    NB_Page: TNotebook;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel5: TOnSectionLabel;
    OnSectionLabel6: TOnSectionLabel;
    ED_pass: TOnEdit;
    ED_npass1: TOnEdit;
    ED_npass2: TOnEdit;
    Image2: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    SB_Close: TOnFocusButton;
    SB_Ok: TOnFocusButton;
    Insa_Session: TTMaxSession;
    Qr_his: TTMaxDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
