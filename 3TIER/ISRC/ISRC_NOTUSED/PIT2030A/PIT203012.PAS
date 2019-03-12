unit Pit203012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnFocusButton, OnEditCombo, pegradpanl, OnEditMemo, Tmax_DataSetText;

type
  TFm_SubForm11 = class(TForm)
    Panel1: TPanel;
    E_Motive: TOnMemo;
    M_Etcdesc: TOnMemo;
    Panel2: TPanel;
    Bt_Save: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Start: Boolean;
  public
    gsMotive1        : String;
    gsMotive2        : String;
    gsMotive3        : String;
    gsEtcDesc1       : String;
    gsEtcDesc2       : String;
    gsEtcDesc3       : String;
    gbEnabled        : Boolean;
  end;

var
  Fm_SubForm11: TFm_SubForm11;

implementation

uses
  pit203011, kpaylib, pit203000;
{$R *.DFM}

procedure TFm_SubForm11.Bt_closeClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TFm_SubForm11.Bt_SaveClick(Sender: TObject);
var
  Msg : string;
begin
  Msg := '['+Bt_Save.Caption+'] 하시겠습니까 ?';

  // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  if E_Motive.Lines.Count >= 99 then
  begin
    Messagedlg(' 줄 이하로 작성하여 주십시오.',mtError,[mbOK],0);
    System.Exit;
  end;

  if MainForm.gsMemoGubn = '1' then
  begin
     gsMotive1 := E_Motive.Text;
     gsEtcDesc1 := M_Etcdesc.Text;
  end else
  if MainForm.gsMemoGubn = '2' then
  begin
     gsMotive2 := E_Motive.Text;
     gsEtcDesc2 := M_Etcdesc.Text;
  end else
  if MainForm.gsMemoGubn = '3' then
  begin
     gsMotive3 := E_Motive.Text;
     gsEtcDesc3 := M_Etcdesc.Text;
  end ;


{  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    gsMotive  := kpaylib.replace(E_Motive.Text,'''','`');
    gsEtcDesc := kpaylib.replace(M_Etcdesc.Text,'''','`');
  end;
}
  CLOSE;
end;


procedure TFm_SubForm11.FormShow(Sender: TObject);
begin
  if MainForm.class_gu = '2' then Bt_Save.Enabled := False
  else                            Bt_Save.Enabled := True;
  if MainForm.gsMemoGubn = '1' then
  begin
     E_Motive.Text := gsMotive1;
     M_Etcdesc.Text := gsEtcDesc1 ;
  end else
  if MainForm.gsMemoGubn = '2' then
  begin
     E_Motive.Text := gsMotive2;
     M_Etcdesc.Text := gsEtcDesc2 ;

  end else
  if MainForm.gsMemoGubn = '3' then
  begin
     E_Motive.Text := gsMotive3;
     M_Etcdesc.Text := gsEtcDesc3 ;
  end ;
end;

procedure TFm_SubForm11.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
//  Edit.PopupForm.ClosePopup(False);
end;

end.
