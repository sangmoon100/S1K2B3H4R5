unit PZK10209;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep6 = class(TQuickRep)
    QRBand1: TQRBand;
    Ora_Org: TOraQuery;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRL_org_name: TQRLabel;
    QRL_org_level: TQRLabel;
    QRL_person_cnt: TQRLabel;
    QRL_up_org_name: TQRLabel;
    QRL_up_org_level: TQRLabel;
    QRL_task: TQRLabel;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRL_d1: TQRLabel;
    QR_Page1: TQRLabel;
    QR_Page2: TQRSysData;
    procedure QuickRep6BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickRep6: TQuickRep6;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep6.QuickRep6BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with Ora_Org do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,     M.DUTY_NAME,  ');
      Sql.Add('       a.org_name ,   decode(a.org_level, ''1'',''Manager'',''2'', ''Senior'', ''3'',''Junior'',''4'',''비정규직'') org_level, ');
      Sql.Add('       a.person_cnt , decode(a.org_level, ''1'', null, b.org_name) up_org_name,                                                ');
      Sql.Add('       decode(b.org_level, ''1'',''Manager'',''2'', ''Senior'', ''3'',''Junior'',''4'',''비정규직'') up_org_level              ');
      Sql.Add('  from a1duty m,  a1org a, a1org b                                                                 ');
      Sql.Add(' where m.duty_id      = a.duty_id                                                                  ');
      Sql.Add('   and a.up_org_id    = b.ORG_ID(+)                                                                ');
      Sql.Add('   and a.duty_id      = :duty_id                                                                   ');
      Sql.Add(' order by a.duty_id, a.org_level                                                                   ');
      ParamByName('duty_id').AsString := MainForm.GSdutyId;
      Open;
    end;

end;

procedure TQuickRep6.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_org_name.Caption     := Ora_Org.FieldByName('org_name').AsString;
  QRL_org_level.Caption    := Ora_Org.FieldByName('org_level').AsString;
  QRL_person_cnt.Caption   := Ora_Org.FieldByName('person_cnt').AsString;
  QRL_up_org_name.Caption  := Ora_Org.FieldByName('up_org_name').AsString;
  QRL_up_org_level.Caption := Ora_Org.FieldByName('up_org_level').AsString;
end;

procedure TQuickRep6.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  NewPage;
end;

procedure TQuickRep6.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d1.Caption := MainForm.GsDutyName;
end;

end.
