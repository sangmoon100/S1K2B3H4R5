unit PrintView;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr, Db,
  Tmax_DataSetText;

type
  TViewForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SE_Zoom: TSpinEdit;
    Bprint: TBitBtn;
    SE_CurPage: TSpinEdit;
    QRPreview: TQRPreview;
    P_TotalPage: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    T_Dml1: TTMaxDataSet;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SE_ZoomChange(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SE_CurPageChange(Sender: TObject);
    procedure SE_CurPageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FQr_QuickRep : TCustomQuickRep;
    FMaxCount    : integer;
    FPosition    : integer;

    procedure SetMaxCount(Value : integer);
    procedure SetPosition(Value : integer);
    { Private declarations }
  public
    constructor CreatePreview(AOwner : TComponent; aQuickRep : TCustomQuickRep); virtual;
    property Qr_Report   : TCustomQuickRep read FQr_QuickRep write FQr_QuickRep;
    property MaxCount    : Integer   read FMaxCount    write SetMaxCount;
    property Position    : Integer   read FPosition    write SetPosition;
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation
{$R *.DFM}
uses Pib30101, PIB30100;

constructor TViewForm.CreatePreview(AOwner : TComponent; aQuickRep : TCustomQuickRep);
begin
  inherited Create(AOwner);
  FMaxCount            := 0;
  FPosition            := 0;
  QR_Report            := aQuickRep;
//  WindowState          := wsMaximized;
  QRPreview.QRPrinter := aQuickRep.QRPrinter;

  if QR_Report <> nil then Caption := '출력 미리보기 화면';
end;

procedure TViewForm.SetMaxCount(Value : integer);
begin
  if FMaxCount <> Value then
  begin
       FMaxCount := Value;
//     Pgr.Max := Value;
  end;
end;

procedure TViewForm.SetPosition(Value : integer);
begin
  if FPosition <> Value then
  begin
       FPosition    := Value;
//     Pgr.Position := Value;
  end;
end;

procedure TViewForm.FormActivate(Sender: TObject);
begin
  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(FM_Main.TPrint.RecordCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;

  if  FM_Main.Vcertpryn = 'Y' then    Bprint.Enabled := False
  else                                Bprint.Enabled := True;
  SE_CurPage.SetFocus;
end;

procedure TViewForm.BprintClick(Sender: TObject);
var Tem1 : String;
begin
  Qrpreview.QRPrinter.Print;

  Tem1 := 'UPDATE PIHCERT SET                            '+#13+
          '       CERTPRDATE='''+FM_Main.GSsysdate+''',  '+#13+
          '       CERTPRYN  =''Y'',                      '+#13+
          '       CERTPRCNT = (CERTPRCNT + 1)            '+#13+
          ' WHERE EMPNO    ='''+FM_Main.Ed_empno.Hint+''''+#13+
          '   AND CERTKIND ='''+FM_Main.Vcertkind+'''    '+#13+
          '   AND CERTDATE ='''+FM_Main.Vcertdate+'''    '+#13+
          //2015.04.06.hjku..admin 추가.. 이지연씨 요청..
          '   AND ADMINYN ='''+FM_Main.Vadminyn  +'''    ';

  with T_Dml1 do
  begin
       Close;
       Sql.Clear;
       Sql.Text := Tem1;
       ServiceName := 'PIB3012A_dml';

       //sql.savetofile('c:\test.sql');
       if not Execute then
       begin
            Application.Messagebox('발행 내역 저장에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
            system.exit;
       end
       else MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
       Close;
  end;
//  Fm_Pib30101.InReport.Print;

  Bprint.Enabled := False;
  SE_CurPage.SetFocus;
end;

procedure TViewForm.BexitClick(Sender: TObject);
begin
  FM_Main.LoadData1;
  Close;
end;

procedure TViewForm.SE_ZoomChange(Sender: TObject);
begin
  QRPreview.Zoom := SE_Zoom.Value;
end;

procedure TViewForm.SE_CurPageChange(Sender: TObject);
begin
  if SE_CurPage.Value <=0 then System.Exit;

  if  SE_CurPage.Value > StrToIntDef(P_TotalPage.Caption,0) then
      SE_CurPage.Value := StrToIntDef(P_TotalPage.Caption,0);

  QRPreview.PageNumber := SE_CurPage.Value;
end;

procedure TViewForm.SE_CurPageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key  of
       VK_NEXT   : SE_CurPage.Value := SE_CurPage.Value +1;
       VK_PRIOR  : SE_CurPage.Value := SE_CurPage.Value -1;
  end;
end;

end.
