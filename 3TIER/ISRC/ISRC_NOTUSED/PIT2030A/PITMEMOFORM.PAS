unit pitMemoForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo,
  ExtCtrls;

type
  TFm_MemoForm1 = class(TForm)
    Panel1: TPanel;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_Motive: TOnMemo;
    M_Etcdesc: TOnMemo;
    Panel2: TPanel;
    Bt_Save: TOnFocusButton;
    Bt_close: TOnFocusButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_MemoForm1: TFm_MemoForm1;

implementation

{$R *.DFM}

end.
