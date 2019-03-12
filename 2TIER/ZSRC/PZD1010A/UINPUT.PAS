unit UInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, ExtCtrls, StdCtrls, OnEditBtnCtrl, OnEditCombo,
  OnEditStdCtrl, OnEditBaseCtrl, Buttons, ExtDlgs, jpeg, OnFocusButton;

type
  TFrmInput = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    OnEd_Sabun: TOnEdit;
    OnEd_Name: TOnEdit;
    OnEd_Payra: TOnEdit;
    OnMaskEdit_Jumin: TOnMaskEdit;
    OnMaskEdit_OrgEmpDate: TOnMaskEdit;
    OnComboEdit_Gubun: TOnComboEdit;
    OpenDialog: TOpenPictureDialog;
    OnEd_EngName: TOnEdit;
    BT_OK: TOnFocusButton;
    BT_Close: TOnFocusButton;
    BT_Picture: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_OKClick(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_PictureClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInput: TFrmInput;

implementation

uses UMain, UPrintF;


{$R *.DFM}

// 확인 버튼 클릭시
procedure TFrmInput.BT_OKClick(Sender: TObject);
begin
  FrmMain.Image3.Picture.LoadFromFile(OpenDialog.FileName);
  FrmMain.La_Name.Caption       := OnEd_Name.Text;
  FrmMain.La_EngName.Caption    := OnEd_EngName.Text;
  FrmMain.La_payra.Caption      := OnEd_Payra.Text;
  FrmMain.La_Sabun.Caption      := OnEd_Sabun.Text;
  FrmMain.La_Name1.Caption      := OnEd_Name.Text;
  FrmMain.La_Jumin.Caption      := copy(OnMaskEdit_Jumin.Text,1,8)+'******';
  FrmMain.La_OrgEmpDate.Caption := copy(OnMaskEdit_OrgEmpDate.Text,1,4)+'.'+
                                   copy(OnMaskEdit_OrgEmpDate.Text,5,2)+'.'+
                                   copy(OnMaskEdit_OrgEmpDate.Text,7,2);
  FrmMain.E_Search.Text         := OnEd_Sabun.Text;
  FrmMain.Flag                  := 'D'; //직접입력

  FrmPrintF.QRImage1.Picture.LoadFromFile(OpenDialog.FileName); //앞면인쇄에 사진 전송.

  Close;
end;

procedure TFrmInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmInput.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInput.BT_PictureClick(Sender: TObject);
begin
  if OpenDialog.Execute then Image1.Picture.LoadFromFile(OpenDialog.FileName);
end;

end.
