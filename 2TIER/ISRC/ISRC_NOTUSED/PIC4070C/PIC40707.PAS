//평가부서별(직군별) : G4 L1 밴드..(과장 차장) -- 미사용 2009.12
unit pic40707;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, MemDS, JPEG, Db, DBTables, DBAccess, StdCtrls;

type
  TFmPic40707 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    dBand1: TQRBand;
    QRShape35: TQRShape;
    Line: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel34: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape26: TQRShape;
    QRShape49: TQRShape;
    QRLabel73: TQRLabel;
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
    QRDBText22: TQRDBText;
    DB_TOTPAYSCR: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRImage1: TQRImage;
    QRShape25: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    DB_PAYRA: TQRDBText;
    QRShape24: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape51: TQRShape;
    QRDBText5: TQRDBText;
    DB_CHOICE: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRShape23: TQRShape;
    QRLabel23: TQRLabel;
    QRShape50: TQRShape;
    QRLabel1: TQRLabel;
    L_Group: TQRLabel;
    L_No: TQRLabel;
    L_Choice: TQRLabel;
    DB_Sno: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape14: TQRShape;
    QRShape33: TQRShape;
    QRLabel41: TQRLabel;
    QRShape8: TQRShape;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape21: TQRShape;
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
    QRLabel17: TQRLabel;
    QRShape17: TQRShape;
    QRShape44: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRL_Coment: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FmPic40707: TFmPic40707;

implementation
uses  pic40701, pic40702;

{$R *.DFM}

procedure TFmPic40707.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Action := CaFree;     
end;

procedure TFmPic40707.dBand1BeforePrint(Sender: TQRCustomBand;
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
         begin
              TBlobField(FieldByName('photo')).SaveToFile('c:\insa\list\pic4070c_'+Fieldbyname('empno').AsString+'.jpg');
              JPEGLoadFromDB(TblobField(MainForm.Ora_Picture.FieldByName('photo')), QRImage1);
         end;
       end
       else QRImage1.picture.Bitmap := nil;
  end;

  QRL_Coment.Caption := '';
  if (MainForm.Query_BCK.FieldByName('CRATE').AsInteger < MainForm.Query_BCK.FieldByName('RANK').AsInteger)
      AND (MainForm.Query_BCK.FieldByName('SHIFTYN').AsString = 'Y')  then
    QRL_Coment.Caption := '하위  30%';

    //dsa2000  2008.11  Add
  with MainForm.Query_BCK do
  begin
       if (FieldByName('CRATE').AsInteger < FieldByName('RANK').AsInteger) AND (FieldByName('SHIFTYN').AsString = 'Y') then
           QRL_Coment.Caption := '하위  30%';

       if FieldByName('CHOICE').AsInteger <> 9999 then DB_CHOICE.Font.Color := clBlack;
       if FieldByName('CHOICE').AsInteger =  9999 then DB_CHOICE.Font.Color := clWhite;
       //if FieldByName('Empno').AsString  = '0035' then QRL_Coment.Caption := '교육포인트 '+#13+ '미달로'+#13+ '승진 미대상자';
       //if FieldByName('Empno').AsString  = '0339' then QRL_Coment.Caption := '감사인 '+#13+ '처우기준'+#13+ '적용대상';
  end;

  //DB_BUMUNRATE.Font.Color := clWhite;
  //DB_RRATE.Font.Color     := clWhite;
end;

procedure TFmPic40707.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if (MainForm.Chk_Choice.Checked) or (MainForm.Chk_ChoiceAll.Checked) then  //dsa2000  2008.11
  begin
       DB_CHOICE.Top        := 31;
       DB_Sno.Font.Color    := clWhite;
       DB_CHOICE.Font.Color := clBlack;
  end
  else
  begin
       DB_Sno.Top           := 31;
       DB_Sno.Font.Color    := clBlack;
       DB_CHOICE.Font.Color := clWhite;
  end;
end;

procedure TFmPic40707.FormCreate(Sender: TObject);
begin
  QRLabel37.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4) ;
  QRLabel39.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2) ;
  QRLabel18.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text)) ;
end;

procedure TFmPic40707.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  L_Choice.Enabled := False;    //dsa2000  2008.11
  //L_No.Enabled     := False;
  //if  (MainForm.Chk_Choice.Checked) or (MainForm.Chk_ChoiceAll.Checked) then L_Choice.Enabled := True
  //else                                                                       L_No.Enabled     := True;

  with MainForm.Query_BCK do
  begin
{     if  MainForm.E_rabasdate.Text <= MainForm.Payrachdate  then
     begin
       QRLabel15.Caption := '현 직급 근무기간';
       if      FieldByName('PAYCLNAME').AsString ='차장' then L_Group.Caption := '부장 Bandup 후보자'
       else if FieldByName('PAYCLNAME').AsString ='과장' then L_Group.Caption := '차장 Bandup 후보자';
     end
     else
}
     begin
       QRLabel15.Caption := '현 BAND 근무기간';
       if      (FieldByName('PAYCLNAME').AsString ='차장') or (FieldByName('PAYCLNAME').AsString ='L1') then L_Group.Caption := 'L2 Bandup 후보자'
       else if (FieldByName('PAYCLNAME').AsString ='과장') or (FieldByName('PAYCLNAME').AsString ='G4') then L_Group.Caption := 'L1 Bandup 후보자';
     end;
  end; 
end;


end.
