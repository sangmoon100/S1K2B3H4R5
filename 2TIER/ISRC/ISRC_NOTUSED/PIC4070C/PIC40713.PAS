//현부서별(부문별) : L1 밴드..보임자그룹/ 비보임자그룹 2009.12.생성.
unit pic40713;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, MemDS, JPEG,  Db, DBTables, DBAccess, StdCtrls;

type
  TFmPic40713 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    L_No: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape33: TQRShape;
    QRLabel41: TQRLabel;
    QRShape8: TQRShape;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape26: TQRShape;
    dBand1: TQRBand;
    QRShape35: TQRShape;
    QRLabel73: TQRLabel;
    Line: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    DB_PAYCLSCR: TQRDBText;
    DB_TOTPAYSCR: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape49: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRLabel23: TQRLabel;
    QRImage1: TQRImage;
    QRShape25: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    DB_PAYRA: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    L_RabasYY: TQRLabel;
    QRShape17: TQRShape;
    QRShape44: TQRShape;
    QRLabel39: TQRLabel;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRShape24: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    L_Group: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape50: TQRShape;
    QRLabel34: TQRLabel;
    QRShape51: TQRShape;
    DB_RRATE: TQRDBText;
    L_Choice: TQRLabel;
    DB_CHOICE: TQRDBText;
    DB_UNICODENAME: TQRDBText;
    DB_Sno: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    DB_BUMUNRATE: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    L_Gubun: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel37: TQRLabel;
    QRL_Coment: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel9: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    CNO : Integer;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FmPic40713: TFmPic40713;

implementation
uses  pic40701, pic40702;

{$R *.DFM}

procedure TFmPic40713.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Action := CaFree;     
end;

procedure TFmPic40713.dBand1BeforePrint(Sender: TQRCustomBand;
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
  with MainForm.Ora_Picture do
  begin
       Close;
       SQL.Clear;
       SQL.Add('select empno,photo from cimphot where empno = :empno ');
       ParamByName('empno').AsString := MainForm.Query_BCK.FieldByName('empno').AsString;
       Open;

       if Fieldbyname('empno').AsString <> '' then
       begin
            stream    := TMemoryStream.Create;
            QRImage1.picture.Graphic := nil;
            TblobField(MainForm.Ora_Picture.FieldByName('photo')).SaveToStream(stream);
            stream.Position := 0;

            if stream.Size <> 0 then
              JPEGLoadFromDB(TblobField(MainForm.Ora_Picture.FieldByName('photo')), QRImage1);
            {
            Bitmap := TBitmap.Create;
            JPEGImage := TJPEGImage.Create;
            try
                 TBlobField(FieldByName('photo')).SaveToFile('c:\insa\list\pic4070c_'+Fieldbyname('empno').AsString+'.jpg');
                 JPEGImage.LoadFromFile('c:\insa\list\pic4070c_'+Fieldbyname('empno').AsString+'.jpg');
            finally
                 Bitmap.Free;
                 JPEGImage.Free;
            end;}
       end
       else QRImage1.picture.Bitmap := nil;
  end;
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  QRL_Coment.Caption := '';
  DB_BUMUNRATE.Font.Color := clWhite;
  DB_RRATE.Font.Color     := clWhite;

  with MainForm.Query_BCK do
  begin
       if Length(FieldByName('UNICODENAME').AsString) > 14 then  DB_UNICODENAME.Font.Size := 7;
       if Length(FieldByName('UNICODENAME').AsString) < 15 then  DB_UNICODENAME.Font.Size := 8;

       if MainForm.Chk_BoimNo.Checked then //2009.12. 보임자 출력시에는 표시 않음.
       begin
            //if (FieldByName('CRATE').AsFloat < FieldByName('RANK').AsInteger) AND (FieldByName('SHIFTYN').AsString = 'Y') then
            //    QRL_Coment.Caption := '하위  50%';
            if (FieldByName('CRATE').AsFloat > FieldByName('RANK').AsInteger) AND (FieldByName('SHIFTYN').AsString = 'Y') then
                QRL_Coment.Caption := '상위  45%';
       end;

       if FieldByName('PAYCL').AsString   =  'C21' then DB_PAYCLSCR.Font.Color := clWhite;
       if FieldByName('CHOICE').AsInteger <> 9999  then DB_CHOICE.Font.Color := clBlack; //dsa2000  2008.11
       if FieldByName('CHOICE').AsInteger =  9999  then DB_CHOICE.Font.Color := clWhite; //dsa2000  2008.11
       //if FieldByName('Empno').AsString   = '0035' then QRL_Coment.Caption := '교육포인트 '+#13+ '미달로'+#13+ '미대상자';
       //if FieldByName('Empno').AsString   = '0339' then QRL_Coment.Caption := '감사인 '+#13+ '처우기준'+#13+ '적용대상';
  end;
end;

procedure TFmPic40713.FormCreate(Sender: TObject);
begin
  QRLabel37.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4) ;
  QRLabel39.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2) ;
  QRLabel18.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text)) ;

  L_RabasYY.Caption := Copy(MainForm.PPE_rabasyear.Text,3,2)+'년 평가결과';

  QRLabel37.Font.Color  := clWhite;   //L1밴드는 4개년치만 나오도록. 2009.12.
  QRDBText18.Font.Color := clWhite;
end;

procedure TFmPic40713.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if (MainForm.Chk_Choice.Checked) or (MainForm.Chk_ChoiceAll.Checked) then  //dsa2000  2008.11
  begin
       DB_CHOICE.Top        := 32;
       DB_Sno.Font.Color    := clWhite;
       DB_CHOICE.Font.Color := clBlack;
  end
  else
  begin
       DB_Sno.Top           := 32;
       DB_Sno.Font.Color    := clBlack;
       DB_CHOICE.Font.Color := clWhite;
  end;

  QRGroup1.Height := 0; //그룹 안나오도록.  
end;

procedure TFmPic40713.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//  CNO := 0;
end;

procedure TFmPic40713.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  L_Choice.Enabled := False;   //dsa2000  2008.11
  L_No.Enabled     := False;
  if  (MainForm.Chk_Choice.Checked) or (MainForm.Chk_ChoiceAll.Checked) then L_Choice.Enabled := True
  else                                                                       L_No.Enabled     := True;

  with MainForm.Query_BCK do
  begin
       QRLabel15.Caption := '현 BAND 근무기간';
       if MainForm.Chk_Boim.Checked   then L_Group.Caption := 'L2 Bandup 후보자 (보임자 그룹)';
       if MainForm.Chk_BoimNo.Checked then L_Group.Caption := 'L2 Bandup 후보자 (비보임자 그룹)';

       if MainForm.Chk_Boim.Checked   then L_Gubun.Caption := '보임자';
       if MainForm.Chk_BoimNo.Checked then L_Gubun.Caption := '비보임자';
  end;
end;

end.
