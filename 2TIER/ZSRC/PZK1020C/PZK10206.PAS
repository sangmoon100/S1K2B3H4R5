unit PZK10206;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,  
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep5 = class(TQuickRep)
    QRBand2: TQRBand;
    QRL_level1: TQRLabel;
    QRShape34: TQRShape;
    QRLabel33: TQRLabel;
    QRShape35: TQRShape;
    QRLabel35: TQRLabel;
    QRShape38: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRL_recom_name: TQRLabel;
    QRL_manager_yn: TQRLabel;
    QRL_senior_yn: TQRLabel;
    QRL_jonior_yn: TQRLabel;
    Ora_Recom: TOraQuery;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRL_d1: TQRLabel;
    QR_Page1: TQRLabel;
    QR_Page2: TQRSysData;
    procedure QuickRep5BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickRep5: TQuickRep5;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep5.QuickRep5BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if MainForm.GSWorkLevel = 1 then
    begin
      QRL_level1.Caption := 'Manager급 추천가능 직무';
    end
  else if MainForm.GSWorkLevel = 2 then
    begin
      QRL_level1.Caption := 'Senior급 추천가능 직무';
    end
  else if MainForm.GSWorkLevel = 3 then
    begin
      QRL_level1.Caption := 'Junior급 추천가능 직무';
    end;

  with Ora_Recom do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.duty_name              ');
      Sql.Add('  from a1recommend a, a1duty b       ');
      Sql.Add('where a.recom_duty_id= b.duty_id     ');
      Sql.Add('  and a.duty_id      = :duty_id      ');
      Sql.Add('  and a.worker_level = :worker_level ');
      Sql.Add('order by a.recom_sno       ');
      ParamByName('duty_id').AsString      := MainForm.GSdutyId;

      if MainForm.GSWorkLevel = 1 then
        ParamByName('worker_level').AsString := 'M'
      else if MainForm.GSWorkLevel = 2 then
        ParamByName('worker_level').AsString := 'S'
      else if MainForm.GSWorkLevel = 3 then
        ParamByName('worker_level').AsString := 'J';

      Open;
    end;

end;

procedure TQuickRep5.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_manager_yn.Caption := '';
  QRL_senior_yn.Caption  := '';
  QRL_jonior_yn.Caption  := '';

  with Ora_Recom do
    begin
      QRL_recom_name.Caption := FieldByName('duty_name').AsString ;

      if FieldByName('manager_yn').AsString ='Y' then
        QRL_manager_yn.Caption := '○';

      if FieldByName('senior_yn').AsString ='Y' then
        QRL_senior_yn.Caption := '○';

      if FieldByName('jonior_yn').AsString ='Y' then
        QRL_jonior_yn.Caption := '○';
    end;
end;

procedure TQuickRep5.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d1.Caption := MainForm.GsDutyName;
end;

end.
 