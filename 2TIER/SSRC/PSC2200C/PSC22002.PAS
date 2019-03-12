unit PSC22002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Quickrpt, QRPrntr, QR3const, ComCtrls,
  peQuickRepPrn, peprnpgr, peoutlookbtn, Comobj, Menus;

type
  TFm_PreviewForm = class(TForm)
    Qr_Preview: TQRPreview;
    PrnDlg: TPrintDialog;
    PrnSet: TPrinterSetupDialog;
    pGr: TProgressBar;
    Panel1: TPanel;
    Im_Page: TImage;
    CurPage: TPanel;
    Sb_ZoomMax: TPeJeonOutLookBtn;
    Sb_ZoomMin: TPeJeonOutLookBtn;
    Sb_Zoom100: TPeJeonOutLookBtn;
    Sb_PageUp: TPeJeonOutLookBtn;
    Sb_PageDown: TPeJeonOutLookBtn;
    Sb_PrnSetup: TPeJeonOutLookBtn;
    Sb_Print: TPeJeonOutLookBtn;
    Sb_Exit: TPeJeonOutLookBtn;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sb_ZoomMaxClick(Sender: TObject);
    procedure Sb_ZoomMinClick(Sender: TObject);
    procedure Sb_Zoom100Click(Sender: TObject);
    procedure Sb_PageDownClick(Sender: TObject);
    procedure Sb_PageUpClick(Sender: TObject);
    procedure Sb_PrnSetupClick(Sender: TObject);
    procedure Sb_PrintClick(Sender: TObject);
    procedure Qr_PreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure Sb_ExitClick(Sender: TObject);
    procedure Qr_PreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    FQr_QuickRep : TCustomQuickRep;
    FMaxCount    : integer;
    FPosition    : integer;

    function PrintExecute(aRpt : TCustomQuickRep; aPageCnt : integer) : Boolean;
    procedure HomePage(Sender: TObject);
    procedure EndPage(Sender: TObject);
    procedure SetMaxCount(Value : integer);
    procedure SetPosition(Value : integer);
  public
    { Public declarations }
    gbGubun : Boolean;
    constructor CreatePreview(AOwner : TComponent; aQuickRep : TCustomQuickRep); virtual;
    procedure Show;

    property Qr_Report   : TCustomQuickRep read FQr_QuickRep write FQr_QuickRep;
    property MaxCount    : Integer   read FMaxCount    write SetMaxCount;
    property Position    : Integer   read FPosition    write SetPosition;
  end;

var
     Fm_PreviewForm: TFm_PreviewForm;

implementation

uses psc22003;

{$R *.DFM}

constructor TFm_PreviewForm.CreatePreview(AOwner : TComponent; aQuickRep : TCustomQuickRep);
begin
     inherited Create(AOwner);
     FMaxCount            := 0;
     FPosition            := 0;
     QR_Report            := aQuickRep;
     WindowState          := wsMaximized;
     QR_Preview.QRPrinter := aQuickRep.QRPrinter;

     if  QR_Report <> nil then
          Caption := '출력 미리보기 화면';
end;

procedure TFm_PreviewForm.SetMaxCount(Value : integer);
begin
     if  FMaxCount <> Value then
     begin
          FMaxCount := Value;
          Pgr.Max := Value;
     end;
end;

procedure TFm_PreviewForm.SetPosition(Value : integer);
begin
     if  FPosition <> Value then
     begin
          FPosition    := Value;
          Pgr.Position := Value;
     end;
end;

function TFm_PreviewForm.PrintExecute(aRpt : TCustomQuickRep; aPageCnt : integer) : Boolean;
begin
     Result          := False;
     prndlg.frompage := 1;
     prndlg.topage   := aPageCnt;
     prndlg.copies   := 1;
     if  prndlg.Execute = True then
     begin
          Qr_Report.PrinterSettings.firstpage := prndlg.frompage;
          Qr_Report.PrinterSettings.lastpage  := prndlg.topage;
          Qr_Report.PrinterSettings.copies    := prndlg.copies;
          Result := True;
     end;
end;

procedure TFm_PreviewForm.FormResize(Sender: TObject);
begin
     Qr_Preview.UpdateZoom;
end;

procedure TFm_PreviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Qr_Preview.QRPrinter := nil;
     Action               := caFree;
end;

procedure TFm_PreviewForm.Show;
begin
     inherited Show;
end;

procedure TFm_PreviewForm.Sb_ZoomMaxClick(Sender: TObject);
begin
     Qr_Preview.Zoom := Qr_Preview.Zoom + 20;
end;

procedure TFm_PreviewForm.Sb_ZoomMinClick(Sender: TObject);
begin
     Qr_Preview.Zoom := Qr_Preview.Zoom - 20;
end;

procedure TFm_PreviewForm.Sb_Zoom100Click(Sender: TObject);
begin
     Qr_Preview.Zoom := 100;
end;

procedure TFm_PreviewForm.Sb_PageDownClick(Sender: TObject);
begin
     Qr_Preview.PageNumber := Qr_Preview.PageNumber - 1;
     CurPage.Caption       := IntToStr(Qr_Preview.PageNumber)+'/'+
                              IntToStr(Qr_Preview.QRPrinter.PageCount);
end;

procedure TFm_PreviewForm.Sb_PageUpClick(Sender: TObject);
begin
     Qr_Preview.PageNumber := Qr_Preview.PageNumber + 1;
     CurPage.Caption       := IntToStr(Qr_Preview.PageNumber)+'/'+
                              IntToStr(Qr_Preview.QRPrinter.PageCount);
end;

procedure TFm_PreviewForm.HomePage(Sender: TObject);
begin
     QR_Preview.PageNumber := 1;
     CurPage.Caption       := IntToStr(Qr_Preview.PageNumber)+'/'+
                              IntToStr(Qr_Preview.QRPrinter.PageCount);
end;

procedure TFm_PreviewForm.EndPage(Sender: TObject);
begin
     QR_Preview.PageNumber := Qr_Preview.QRPrinter.PageCount;
     CurPage.Caption       := IntToStr(Qr_Preview.PageNumber)+'/'+
                              IntToStr(Qr_Preview.QRPrinter.PageCount);
end;

procedure TFm_PreviewForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Next  : if  Shift = [ssCtrl] then
                          EndPage(Self)
                     else
                          Sb_PageUpClick(Self);
          VK_Prior : if  Shift = [ssCtrl] then
                          HomePage(Self)
                     else
                          Sb_PageDownClick(Self);
          VK_Home  : HomePage(Self);
          VK_End   : EndPage(Self);
     end;
end;

procedure TFm_PreviewForm.Sb_PrnSetupClick(Sender: TObject);
begin
     PrnSet.Execute;
end;

procedure TFm_PreviewForm.Sb_PrintClick(Sender: TObject);
begin
     gbGubun := True;

     if  PrintExecute(Qr_Report,Qr_Preview.QRPrinter.PageCount) = True then
          TPeQuickRepPrn(QR_Report).ProgBarPrint;
end;

procedure TFm_PreviewForm.Qr_PreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
     CurPage.Caption := IntToStr(Qr_Preview.PageNumber)+'/'+
                        IntToStr(Qr_Preview.QRPrinter.PageCount);
     UpDateWindow(CurPage.Handle);
end;

procedure TFm_PreviewForm.Qr_PreviewProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
     if  FMaxCount > 0 then     System.Exit;
     Pgr.Position := Progress;
     Pgr.Visible  := (Pgr.Position > 0) and (Pgr.Position < 100);
end;

procedure TFm_PreviewForm.Sb_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFm_PreviewForm.FormPaint(Sender: TObject);
begin
     gbGubun := False;
end;

end.
