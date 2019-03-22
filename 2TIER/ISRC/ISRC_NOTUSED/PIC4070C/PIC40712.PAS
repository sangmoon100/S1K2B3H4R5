//현부서별(부문별) : G2 G3 밴드..(사원 대리)   : D21 D31 D33 D35
unit pic40712;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, MemDS, JPEG,  Db, DBTables, DBAccess, Ora,
  StdCtrls;

type
  TFmPic40712 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
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
    QRShape29: TQRShape;
    QRShape32: TQRShape;
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
    DB_finalgrade: TQRDBText;
    DB_resultscrgrade: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape49: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
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
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRShape24: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape50: TQRShape;
    QRLabel34: TQRLabel;
    QRShape51: TQRShape;
    QRDBText7: TQRDBText;
    DB_Sno: TQRDBText;
    DB_UNICODENAME: TQRDBText;
    L_Group: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRL_Coment: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRDBText5: TQRDBText;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRDBText8: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    CNO : Integer;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FmPic40712: TFmPic40712;

implementation
uses  pic40701;

{$R *.DFM}

procedure TFmPic40712.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Action := CaFree;
end;

procedure TFmPic40712.FormCreate(Sender: TObject);
begin
  QRLabel37.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4) ;
  QRLabel39.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2) ;
  QRLabel18.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text)) ;

  L_RabasYY.Caption := Copy(MainForm.PPE_rabasyear.Text,3,2)+'년 평가결과';

  QRLabel37.Font.Color  := clWhite;   //G2, G3밴드는 3개년치만 나오도록. 2009.12.
  QRLabel39.Font.Color  := clWhite;
  QRDBText18.Font.Color := clWhite;
  QRDBText29.Font.Color := clWhite;  
end;

procedure TFmPic40712.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  CNO := 0;
  QRGroup1.Height := 0; //그룹 안나오도록.
end;

procedure TFmPic40712.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//  CNO := 0;
end;

procedure TFmPic40712.dBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Query_BCK do
  begin
       if Length(FieldByName('UNICODENAME').AsString) > 12 then  DB_UNICODENAME.Font.Size := 7;
       if Length(FieldByName('UNICODENAME').AsString) < 13 then  DB_UNICODENAME.Font.Size := 8; //2009.12.
       
       if FieldByName('TOTPAYSCR').AsInteger = 0 then DB_TOTPAYSCR.Font.Color := clWhite;   //dsa2000  2008.11
       if FieldByName('TOTPAYSCR').AsInteger <>0 then DB_TOTPAYSCR.Font.Color := clBlack;

       DB_finalgrade.Font.Color     := clBlack;
       DB_resultscrgrade.Font.Color := clBlack;

       QRL_Coment.Caption := '';

       //2009년도 미평가자들 등급 안보이도록,..//해마다 바뀜.
       QRDBText32.Font.Color := clBlack;
       if FieldByName('empno').AsString = '1902' then QRDBText32.Font.Color := clWhite;
  end;
end;

procedure TFmPic40712.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Query_BCK do
  begin
       QRLabel15.Caption := '현 BAND 근무기간';
       if      (FieldByName('PAYCLNAME').AsString           = 'G3') then L_Group.Caption := 'G4 Bandup 후보자'
       else if (Copy(FieldByName('PAYCLNAME').AsString,1,2) = 'G2') then L_Group.Caption := 'G3 Bandup 후보자';
  end;
end;

end.
