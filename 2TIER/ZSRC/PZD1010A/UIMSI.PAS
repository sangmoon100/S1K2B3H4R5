unit UImsi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OnEditBaseCtrl, OnEditStdCtrl, Func, OnFocusButton,
  OnInsaCommon;

type
  TFrmImsi = class(TForm)
    OnMaskEdit_Buho: TOnMaskEdit;
    BT_OK: TOnFocusButton;
    BT_Close: TOnFocusButton;
    procedure OnMaskEdit_BuhoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BT_OKClick(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImsi: TFrmImsi;

implementation

uses UMain, UPrintF;

{$R *.DFM}

procedure TFrmImsi.OnMaskEdit_BuhoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;

  FrmMain.La_ImsiNo.caption := OnMaskEdit_Buho.Text;

  if FrmMain.FG_Gubun = 'imsi'  then  FrmMain.Image1.Picture.LoadFromFile(GetHomeDir+'\Pic\imsicard.jpg');
  if FrmMain.FG_Gubun = 'visit' then  FrmMain.Image1.Picture.LoadFromFile(GetHomeDir+'\Pic\visitcard.jpg');

  FrmMain.Image2.Picture := nil;
  FrmMain.Image2.Picture.LoadFromFile(GetHomeDir+'\Pic\imsicardT.jpg');
  FrmMain.Image3.Picture := nil;     //증명사진 초기화

  if FrmMain.FG_Gubun = 'imsi'  then  FrmMain.Flag := 'I';
  if FrmMain.FG_Gubun = 'visit' then  FrmMain.Flag := 'V';

  Close;
end;

procedure TFrmImsi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImsi.FormShow(Sender: TObject);
begin
  OnMaskEdit_Buho.Text:='';
  OnMaskEdit_Buho.SetFocus;

  if FrmMain.FG_Gubun = 'imsi'  then  FrmImsi.Caption := '임시출입증';
  if FrmMain.FG_Gubun = 'imsi'  then  OnMaskEdit_Buho.EditLabel.Caption := '출입증번호';
  if FrmMain.FG_Gubun = 'visit' then  FrmImsi.Caption := '방 문 증';
  if FrmMain.FG_Gubun = 'visit' then  OnMaskEdit_Buho.EditLabel.Caption := '방문증번호';
end;

procedure TFrmImsi.BT_OKClick(Sender: TObject);
begin
  FrmMain.La_ImsiNo.caption := OnMaskEdit_Buho.Text;

  if FrmMain.FG_Gubun = 'imsi'  then  FrmMain.Image1.Picture.LoadFromFile(GetHomeDir+'\Pic\imsicard.jpg');  //사진앞면
  if FrmMain.FG_Gubun = 'visit' then  FrmMain.Image1.Picture.LoadFromFile(GetHomeDir+'\Pic\visitcard.jpg');

  FrmMain.Image2.Picture := nil;
  FrmMain.Image2.Picture.LoadFromFile(GetHomeDir+'\Pic\imsicardT.jpg');   //사진 뒷면
  FrmMain.Image3.Picture := nil;     //증명사진 초기화

  if FrmMain.FG_Gubun = 'imsi'  then  FrmMain.Flag := 'I';
  if FrmMain.FG_Gubun = 'visit' then  FrmMain.Flag := 'V';             //임시출입증 버튼클릭

  Close;
end;

procedure TFrmImsi.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
