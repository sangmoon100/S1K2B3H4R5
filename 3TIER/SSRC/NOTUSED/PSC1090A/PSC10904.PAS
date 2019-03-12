unit PSC10904;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, OraSmart, ExtCtrls, Mask, Func, JPEG,
  ComCtrls, OnEditStdCtrl, OnEditBaseCtrl, OnFocusButton, QuickRpt, Qrctrls,
  DBCtrls, OnRegistry, OnEditBtnCtrl, OnEditCombo;

type
  TFmPSC10904 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    EdEmpno: TOnEdit;
    EdKorname: TOnEdit;
    EdStocknum: TOnEdit;
    EdSeq: TOnEdit;
    EdAppdate: TOnMaskEdit;
    BB_Close: TOnFocusButton;
    Panel2: TPanel;
    Image1: TImage;
    BT_Print: TOnFocusButton;
    TabSheet7: TTabSheet;
    Memo1: TMemo;
    E_GBPage: TOnComboEdit;
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_PrintClick(Sender: TObject);
    procedure E_GBPageChange(Sender: TObject);

  private
    { Private declarations }
    vMessage  : String;
  public
    { Public declarations }
  end;

var
  FmPSC10904: TFmPSC10904;

const
  SUBKEY    : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';

implementation

uses PSC10901, PSC10905;

{$R *.DFM}


procedure TFmPSC10904.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPSC10904.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_Session.Disconnect;
  Action := caFree;
end;

procedure TFmPSC10904.FormActivate(Sender: TObject);
begin
  EdEmpno.Text    := FM_Main.TMaxDataSet1.FieldByName('empno'  ).AsString;
  EdKorname.Text  := FM_Main.TMaxDataSet1.FieldByName('korname').AsString;
  EdStocknum.Text := FM_Main.TMaxDataSet1.FieldByName('stocknum').AsString;
  EdSeq.Text      := IntToStr(FM_Main.TMaxDataSet1.FieldByName('seq').AsInteger);
  EdAppdate.Text  := FM_Main.TMaxDataSet1.FieldByName('appdate').AsString;

  OraConnect;

  PageControl1.SetFocus;
  PageControl1.ActivePage := TabSheet1;
  PageControl1Change(nil);
end;

procedure TFmPSC10904.PageControl1Change(Sender: TObject);
var
  stream     : TMemoryStream;
  JPEGImage  : TJPEGImage;
  qq         : TOraQuery;
  vFileName  : String;
  vEmpno     : String;
  vSeq       : Integer;
begin
  vEmpno := FM_Main.TMaxDataSet1.FieldByName('empno').AsString;
  vSeq   := FM_Main.TMaxDataSet1.FieldByName('seq').AsInteger;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select photo                ');
            SQL.Add('  from Pstock_image         ');
            SQL.Add(' where empno    = :empno    ');
            SQL.Add('   and seq      = :seq      ');
            SQL.Add('   and gubun    = :gubun    ');
            SQL.Add('   and gbpage   = :gbpage  ');

            ParamByName('empno'   ).AsString  := vEmpno;
            ParamByName('seq'     ).AsInteger := vSeq;
            ParamByName('gubun'   ).AsString  := IntToStr(PageControl1.ActivePage.PageIndex);
            ParamByName('gbpage'  ).AsInteger := StrToInt(E_GBPage.Text);
            Open;

            vMessage := '';
            if      PageControl1.ActivePage.PageIndex = 0 then vMessage := '주민등록증'
            else if PageControl1.ActivePage.PageIndex = 1 then vMessage := '스톡옵션행사신청서'
            else if PageControl1.ActivePage.PageIndex = 2 then vMessage := '스톡옵션부여계약서'
            else if PageControl1.ActivePage.PageIndex = 3 then vMessage := '재직증명서'
            else if PageControl1.ActivePage.PageIndex = 4 then vMessage := '경력증명서'
            else if PageControl1.ActivePage.PageIndex = 5 then vMessage := '질권설정계약서'
            else if PageControl1.ActivePage.PageIndex = 6 then vMessage := '급여차감지급의뢰서';

            Image1.picture.Graphic := nil;
            if RecordCount > 0 then
            begin
                 try
                      stream    := TMemoryStream.Create;
                      //JPEGImage := TJPEGImage.Create;
                      TblobField(qq.FieldByName('photo')).SaveToStream(stream);
                      stream.Position := 0;
                      //JPEGImage.LoadFromStream(stream);

                      //그림파일 저장
                      vFileName := GetKeyValue(HKEY_LOCAL_MACHINE, SUBKEY, 'NewHomeDir') +'\';
                      vFileName := vFileName + vEmpno +'-'+ IntToStr(vSeq) +'회-'+ vMessage +'-'+ E_GBPage.Text +'page.pdf';
                      TBlobField(FieldByName('photo')).SaveToFile(vFileName);

                      //SetStretchBltMode (Image1.Canvas.Handle, STRETCH_HALFTONE);
                      //if stream.Size <> 0 then  Image1.picture.Assign(JPEGImage);
                 finally
                      stream.free;
                      //JPEGImage.Free;
                 end;
            end;
       end;
  finally
       qq.Free;
  end;
end;

procedure TFmPSC10904.BT_PrintClick(Sender: TObject);
begin
  FM_Print := TFM_Print.Create(Application);
  FM_Print.PrintScale := poPrintToFit;
  FM_Print.QuickRep1.Preview; //Print;
end;

procedure TFmPSC10904.E_GBPageChange(Sender: TObject);
begin
  PageControl1Change(Sender);
end;

end.
