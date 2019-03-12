unit PZK10205;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep4 = class(TQuickRep)
    QRBand2: TQRBand;
    QRL_level1: TQRLabel;
    QRShape34: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape35: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRBand5: TQRBand;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRL_comp: TQRLabel;
    Ora_AbilB: TOraQuery;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRL_L: TQRLabel;
    QRL_M: TQRLabel;
    QRL_H: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRL_d1: TQRLabel;
    QR_Page1: TQRLabel;
    QR_Page2: TQRSysData;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep4BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickRep4: TQuickRep4;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep4.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  req : String;
begin
  req              := Ora_AbilB.FieldByName('req_kind').AsString;
  QRL_comp.Caption := Ora_AbilB.FieldByName('ability_name').Asstring;

  QRL_L.Caption := '';
  QRL_M.Caption := '';
  QRL_H.Caption := '';

  if req = '초급' then
    QRL_L.Caption := '○'
  else if req = '중급' then
    QRL_M.Caption := '○'
  else if req = '고급' then
    QRL_H.Caption := '○';

end;

procedure TQuickRep4.QuickRep4BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if MainForm.GSWorkLevel = 1 then
    begin
      QRL_level1.Caption := 'Manager급 필요역량';
    end
  else if MainForm.GSWorkLevel = 2 then
    begin
      QRL_level1.Caption := 'Senior급 필요역량';
    end
  else if MainForm.GSWorkLevel = 3 then
    begin
      QRL_level1.Caption := 'Junior급 필요역량';
    end;

  with Ora_AbilB do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.ability_name           ');
      Sql.Add('  from a1ability a, a1dic_abil b     ');
      Sql.Add('where a.item_name    = b.ability_cd  ');
      Sql.Add('  and a.duty_id      = :duty_id      ');
      Sql.Add('  and a.worker_level = :worker_level ');
      Sql.Add('  and a.ability_kind = ''B'' ');
      Sql.Add('order by a.ability_sno       ');
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

procedure TQuickRep4.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d1.Caption := MainForm.GsDutyName;
end;

end.
