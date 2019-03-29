unit PIU20203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl,  OnShapeLabel, OnFocusButton, OnEditMemo, Func;

type
  TFm_SubForm11 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bt_close: TOnFocusButton;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    M_appsayu: TMemo;
    M_Spedesc: TMemo;
    procedure Bt_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Start: Boolean;
  public
    { Public declarations }
    GSFlag   : Integer;
    gbEnabled: Boolean;
  end;

var
  Fm_SubForm11: TFm_SubForm11;

implementation

uses PIU20202;


{$R *.DFM}

procedure TFm_SubForm11.Bt_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFm_SubForm11.FormActivate(Sender: TObject);
begin
  Self.Caption := InttoStr(GSflag)+'지망 지원 동기 열람';
end;

end.
