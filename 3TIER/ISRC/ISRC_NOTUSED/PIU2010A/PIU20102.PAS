unit PIU20102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnShapeLabel, OnFocusButton, OnEditMemo, Tmax_DataSetText;

type
  TFm_SubForm11 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bt_Save: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    M_appsayu: TMemo;
    M_spedesc: TMemo;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

uses PIU20101;


{$R *.DFM}

procedure TFm_SubForm11.Bt_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFm_SubForm11.Bt_SaveClick(Sender: TObject);
var
  Msg : string;
begin
  Msg := '['+Bt_Save.Caption+'] 하시겠습니까 ?';

  if Length(M_appsayu.Text) >= 1000 then
    begin
      Messagedlg('지원동기를 500자 이내로 작성하여 주십시오.',mtError,[mbOK],0);
      System.Exit;
    end;

  if Length(M_Spedesc.Text) >= 1000 then
    begin
      Messagedlg('특기사항을 500자 이내로 작성하여 주십시오.',mtError,[mbOK],0);
      System.Exit;
    end;

  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      if GSflag = 1 then
        begin
          MainForm.GSsayu1    := M_appsayu.Text;
          MainForm.GSspedesc1 := M_Spedesc.Text;
        end
      else if GSflag = 2 then
        begin
          MainForm.GSsayu2    := M_appsayu.Text;
          MainForm.GSspedesc2 := M_Spedesc.Text;
        end
      else if GSflag = 3 then
        begin
          MainForm.GSsayu3    := M_appsayu.Text;
          MainForm.GSspedesc3 := M_Spedesc.Text;
        end;
    end;

//  PIU20101.MainForm.Bt_saveClick(Sender);

  close;
end;

procedure TFm_SubForm11.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TFm_SubForm11.FormActivate(Sender: TObject);
begin
  if Start then
  begin
    Start := not Start;

    if gbEnabled then
      self.Caption := InttoStr(GSflag)+'지망 지원 동기 작성'
    else
      self.Caption := InttoStr(GSflag)+'지망 지원 동기 열람';

    Bt_Save.Enabled    := gbEnabled;
    M_appsayu.ReadOnly := not gbEnabled;
    M_Spedesc.ReadOnly := not gbEnabled;

    Application.ProcessMessages;
  end;
end;

end.
