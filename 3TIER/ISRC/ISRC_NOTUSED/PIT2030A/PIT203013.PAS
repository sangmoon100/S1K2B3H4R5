unit Pit203013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnFocusButton, OnEditCombo, pegradpanl, OnEditMemo;

type
  TFm_SubForm12 = class(TForm)
    Panel1: TPanel;
    E_ConOppinion: TOnMemo;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Bt_Save: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Shape1: TShape;
    Label2: TLabel;
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Start : Boolean;
    gsConOppinion : String;
    gbEnabled: Boolean;
  end;

var
  Fm_SubForm12: TFm_SubForm12;

implementation

uses
  pit203011, kpaylib;

{$R *.DFM}

procedure TFm_SubForm12.Bt_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFm_SubForm12.Bt_SaveClick(Sender: TObject);
var
  Msg : string;
begin
  Msg := '['+Bt_Save.Caption+'] 하시겠습니까 ?';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
     gsConOppinion := kpaylib.replace(E_ConOppinion.Text,'''','`');

  CLOSE;
end;

procedure TFm_SubForm12.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TFm_SubForm12.FormActivate(Sender: TObject);
begin
  if Start then
  begin
    Start := not Start;

    E_ConOppinion.Text  := gsConOppinion;

    if gbEnabled then
      self.Caption := '검토의견작성'
    else
      self.Caption := '검토의견열람';

    Bt_Save.Enabled        := gbEnabled;
    E_ConOppinion.ReadOnly := not gbEnabled;

    Application.ProcessMessages;
  end;
end;

end.
