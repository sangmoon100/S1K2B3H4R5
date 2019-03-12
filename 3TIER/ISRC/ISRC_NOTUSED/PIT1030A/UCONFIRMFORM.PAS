unit UConfirmForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnShapeLabel, ExtCtrls;

type
  TConForm = class(TForm)
    Shape8: TShape;
    Label3: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    L_111: TOnShapeLabel;
    L_dutykind: TOnShapeLabel;
    L_duty: TOnShapeLabel;
    Shape2: TShape;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    L_korname: TLabel;
    L_jobfield: TLabel;
    procedure BT_CancelClick(Sender: TObject);
    procedure BT_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConYN : Boolean;
  end;

var
  ConForm: TConForm;

implementation

{$R *.DFM}

procedure TConForm.BT_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TConForm.BT_OkClick(Sender: TObject);
begin
  ConYN := True;
  Close;
end;

end.
