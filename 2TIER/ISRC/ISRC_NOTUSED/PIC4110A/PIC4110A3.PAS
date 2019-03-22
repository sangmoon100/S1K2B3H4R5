////현부서로...
unit PIC4110A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, MemDS, JPEG,  Db, DBTables, DBAccess, Ora,
  StdCtrls;

type
  TFM_Print2 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape26: TQRShape;
    dBand1: TQRBand;
    QRShape35: TQRShape;
    Line: TQRShape;
    QRShape49: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel40: TQRLabel;
    QRDBText34: TQRDBText;
    OraQuery2: TOraQuery;
    QRShape45: TQRShape;
    QRDBText5: TQRDBText;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    DB_TOTPAYSCR: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape18: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape7: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape15: TQRShape;
    QRShape33: TQRShape;
    QRShape9: TQRShape;
    QRShape13: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    L_Year: TQRLabel;
    L_Group: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRDBText20: TQRDBText;
    QRImage1: TQRImage;
    QRShape25: TQRShape;
    DB_PAYRA: TQRDBText;
    DB_UNICODENAME: TQRDBText;
    DB_Sno: TQRDBText;
    QRShape4: TQRShape;
    L_No: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape41: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    CNO : Integer;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FM_Print2: TFM_Print2;

implementation

uses PIC4110A1;

{$R *.DFM}

procedure TFM_Print2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Close;
     Action := CaFree;     
end;

procedure TFM_Print2.dBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
procedure JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
var
   jpg: TJPEGImage;
   mem: TMemoryStream;
begin
  jpg := TJPEGImage.Create;
  mem := TMemoryStream.Create;
  try
       if BlobField.IsNull then
         Image.Picture := nil
       else begin
         BlobField.SaveToStream(mem);
         mem.Position := 0;
         jpg.LoadFromStream(mem);
         Image.Picture.Graphic := jpg;
       end;
  finally
       mem.Free;
       jpg.Free;
  end;
end;

var
  Bitmap : TBitmap;
  JPEGimage : TJPEGimage;
  i,j : Integer;
  stream    : TMemoryStream;
begin
  with OraQuery2 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('select empno,photo from cimphot where empno = :empno ');
       ParamByName('empno').AsString := MainForm.Q_Master.FieldByName('empno').AsString;
       Open;

       if Fieldbyname('empno').AsString <> '' then
       begin
            stream    := TMemoryStream.Create;
            QRImage1.picture.Graphic := nil;
            TblobField(OraQuery2.FieldByName('photo')).SaveToStream(stream);
            stream.Position := 0;

            if stream.Size <> 0 then
              JPEGLoadFromDB(TblobField(OraQuery2.FieldByName('photo')), QRImage1);
       end
       else QRImage1.picture.Bitmap := nil;
  end;

  if Length(MainForm.Q_Master.FieldByName('UNICODENAME').AsString) > 12 then DB_UNICODENAME.Font.Size := 7;
  if Length(MainForm.Q_Master.FieldByName('UNICODENAME').AsString) < 13 then DB_UNICODENAME.Font.Size := 8;  
end;

procedure TFM_Print2.FormCreate(Sender: TObject);
begin
  //QRLabel37.Caption := inttostr(strtoint(MainForm.E_RabasYear.Text) - 4) ;
  //QRLabel39.Caption := inttostr(strtoint(MainForm.E_RabasYear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.E_RabasYear.Text) - 2) ;
  QRLabel18.Caption := inttostr(strtoint(MainForm.E_RabasYear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.E_RabasYear.Text)) ;

  L_Year.Caption    := Copy(MainForm.E_RabasYear.Text,3,2) + '년 평가결과';
  QRLabel25.Font.Color := clWhite;
  DB_TOTPAYSCR.Font.Color := clWhite;
end;

procedure TFM_Print2.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if   MainForm.RB_Leader1.Checked then L_Group.Caption := '<< Leader Pool 대상자 >>'
  else                                  L_Group.Caption := '<< Leader Pool 예비후보자 >>';
end;

procedure TFM_Print2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRGroup1.Height := 0; //그룹 안나오도록.
end;

end.
