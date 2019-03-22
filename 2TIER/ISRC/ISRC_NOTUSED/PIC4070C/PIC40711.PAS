//평가부서별(직군별) : G2 G3 밴드..(사원 대리) ---- 미사용 2009.12
unit pic40711;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, MemDS, JPEG, Db, DBTables, DBAccess, Ora,
  StdCtrls;

type
  TFmPic40711 = class(TForm)
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
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape24: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape51: TQRShape;
    QRDBText5: TQRDBText;
    DB_Sno: TQRDBText;
    QRDBText12: TQRDBText;
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
    QRLabel7: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
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
    QRShape50: TQRShape;
    QRLabel6: TQRLabel;
    L_Group: TQRLabel;
    QRL_Coment: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FmPic40711: TFmPic40711;

implementation
uses  pic40701;

{$R *.DFM}

procedure TFmPic40711.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Action := CaFree;
end;

procedure TFmPic40711.FormCreate(Sender: TObject);
begin
  QRLabel37.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4) ;
  QRLabel39.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2) ;
  QRLabel18.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text)) ;
end;

   //dsa2000  2008.11
procedure TFmPic40711.dBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_Coment.Caption := '';
  with MainForm.Query_BCK do
  begin
       if FieldByName('TOTPAYSCR').AsInteger = 0 then DB_TOTPAYSCR.Font.Color := clWhite;   
       if FieldByName('TOTPAYSCR').AsInteger <>0 then DB_TOTPAYSCR.Font.Color := clBlack;

       DB_finalgrade.Font.Color     := clBlack;
       DB_resultscrgrade.Font.Color := clBlack;
       if FieldByName('Empno').AsString = '2295' then DB_finalgrade.Font.Color     := clWhite;
       if FieldByName('Empno').AsString = '2295' then DB_resultscrgrade.Font.Color := clWhite;
       if FieldByName('Empno').AsString = '2299' then DB_finalgrade.Font.Color     := clWhite;
       if FieldByName('Empno').AsString = '2299' then DB_resultscrgrade.Font.Color := clWhite;
       if FieldByName('Empno').AsString = '1509' then DB_finalgrade.Font.Color     := clWhite;
       if FieldByName('Empno').AsString = '1509' then DB_resultscrgrade.Font.Color := clWhite;

       if FieldByName('Empno').AsString = '1509' then QRL_Coment.Caption := '육아휴직중'+#13+ '(08.7~09.6)';
       if FieldByName('Empno').AsString = '1669' then QRL_Coment.Caption := '노동조합'+#13+ '사무처장';
  end;
end;

procedure TFmPic40711.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Query_BCK do
  begin
{     if  MainForm.E_rabasdate.Text <= MainForm.Payrachdate  then
     begin
       QRLabel15.Caption := '현 직급 근무기간';
       if      FieldByName('PAYCLNAME').AsString           = '대리' then L_Group.Caption := '과장 Bandup 후보자'
       else if Copy(FieldByName('PAYCLNAME').AsString,1,4) = '사원' then L_Group.Caption := '대리 Bandup 후보자';
     end
     else
}     begin
       QRLabel15.Caption := '현 BAND 근무기간';
       if      (FieldByName('PAYCLNAME').AsString           = '대리') or  (FieldByName('PAYCLNAME').AsString           = 'G3') then L_Group.Caption := 'G4 Bandup 후보자'
       else if (Copy(FieldByName('PAYCLNAME').AsString,1,4) = '사원') or  (Copy(FieldByName('PAYCLNAME').AsString,1,2) = 'G2') then L_Group.Caption := 'G3 Bandup 후보자';
     end;

  end;

//  if MainForm.ChkDaeri.Checked then L_Paycl.Font.Color  := clWhite;
//  if MainForm.ChkDaeri.Checked then DB_Paycl.Font.Color := clWhite;
//  if MainForm.ChkSawon.Checked then L_Paycl.Font.Color  := clBlack;
//  if MainForm.ChkSawon.Checked then DB_Paycl.Font.Color := clBlack;
end;

end.
