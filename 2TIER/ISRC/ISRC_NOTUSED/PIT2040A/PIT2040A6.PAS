unit PIT2040A6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, Mask, pebtnedit, PeJeonBtnDateEdit, peextcombo,
  ComCtrls, ExtCtrls;

type
  TGAddDlg = class(TForm)
    Bt_Cancel: TPeJeonOutLookBtn;
    SB_message: TStatusBar;
    Bt_Save: TPeJeonOutLookBtn;
    MmOpinion: TMemo;
    procedure Bt_CancelClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    SModalResult : string;
  end;

var
  GAddDlg: TGAddDlg;

implementation

{$R *.DFM}

procedure TGAddDlg.Bt_CancelClick(Sender: TObject);
begin
  SModalResult := 'mrCancel';
  Close;
end;

procedure TGAddDlg.Bt_SaveClick(Sender: TObject);
begin
  SModalResult := 'mrOK';
  Close;
end;

procedure TGAddDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

end.
