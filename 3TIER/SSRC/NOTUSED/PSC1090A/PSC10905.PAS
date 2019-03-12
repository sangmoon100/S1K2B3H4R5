unit PSC10905;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, MemDS, DBAccess, Ora, Jpeg, Func, Peprnview;

type
  TFM_Print = class(TForm)
    QuickRep1: TQuickRep;
    OraQuery1: TOraQuery;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Print: TFM_Print;

implementation

uses psc10901, PSC10904;

{$R *.DFM}

procedure TFM_Print.FormCreate(Sender: TObject);
begin
     OraQuery1.Session := Ora_Session;
     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select photo               ');
          SQL.Add('  from Pstock_image        ');
          SQL.Add(' where empno    = :empno   ');
          SQL.Add('   and seq      = :seq     ');
          SQL.Add('   and gubun    = :gubun   ');

          ParamByName('empno'   ).AsString  := FM_Main.TMaxDataSet1.FieldByName('empno'   ).AsString;
          ParamByName('seq'     ).AsInteger := FM_Main.TMaxDataSet1.FieldByName('seq'     ).AsInteger;
          ParamByName('gubun'   ).AsString  := FloatToStr(FmPSC10904.PageControl1.ActivePage.PageIndex);
          Open;
     end;

     QRImage1.Stretch := True;
end;

procedure TFM_Print.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
     stream : TMemoryStream;
     JPEGImage : TJPEGImage;
begin
     with OraQuery1 do
     begin
          QRImage1.picture.Graphic := nil;
          if RecordCount > 0 then
          begin
               try
                    stream    := TMemoryStream.Create;
                    JPEGImage := TJPEGImage.Create;
                    TblobField(OraQuery1.FieldByName('photo')).SaveToStream(stream);
                    stream.Position := 0;
                    JPEGImage.LoadFromStream(stream);

                    SetStretchBltMode (QRImage1.Canvas.Handle, STRETCH_HALFTONE);
                    if stream.Size <> 0 then  QRImage1.picture.Assign(JPEGImage);
               finally
                    stream.free;
                    JPEGImage.Free;
               end;
          end;
     end;
end;

procedure TFM_Print.QuickRep1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
   Fm_PreviewForm.Show;
end;

end.
