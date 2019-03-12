unit PZK10202;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRL_entry_name: TQRLabel;
    QRL_duty_name: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRL_goal_1: TQRLabel;
    QRL_goal_2: TQRLabel;
    QRL_goal_3: TQRLabel;
    QRL_goal_4: TQRLabel;
    QRL_goal_5: TQRLabel;
    QRL_goal_6: TQRLabel;
    QRL_entry_date: TQRLabel;
    QRL_decide1_name: TQRLabel;
    QRL_group_major: TQRLabel;
    QRL_group_minor: TQRLabel;
    QRL_main_team: TQRLabel;
    QRL_etc_team1: TQRLabel;
    QRL_etc_team2: TQRLabel;
    QRL_etc_team3: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape23: TQRShape;
    QRShape18: TQRShape;
    QRShape27: TQRShape;
    QRShape30: TQRShape;
    QRShape17: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel5: TQRLabel;
    QRL_decide2_name: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickRep1: TQuickRep1;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep1.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Ora_duty do
    begin
      QRL_duty_name.Caption       := FieldByName('duty_name').AsString;
      QRL_entry_date.Caption      := Copy(FieldByName('entry_date').AsString,1,4)+'-'+Copy(FieldByName('entry_date').AsString,5,2)+'-'+Copy(FieldByName('entry_date').AsString,7,2);
      QRL_entry_name.Caption      := FieldByName('entry_name').AsString;
      QRL_decide1_name.Caption    := FieldByName('decide1_name').AsString;
      QRL_decide2_name.Caption    := FieldByName('decide2_name').AsString;
      QRL_group_major.Caption     := FieldByName('group_major').AsString;
      QRL_group_minor.Caption     := FieldByName('group_minor').AsString;
      QRL_main_team.Caption       := FieldByName('main_team').AsString;
      QRL_etc_team1.Caption       := FieldByName('etc_team1').AsString;
      QRL_etc_team2.Caption       := FieldByName('etc_team2').AsString;
      QRL_etc_team3.Caption       := FieldByName('etc_team3').AsString;
      QRL_goal_1.Caption          := FieldByName('goal_1').AsString;
      QRL_goal_2.Caption          := FieldByName('goal_2').AsString;
      QRL_goal_3.Caption          := FieldByName('goal_3').AsString;
      QRL_goal_4.Caption          := FieldByName('goal_4').AsString;
      QRL_goal_5.Caption          := FieldByName('goal_5').AsString;
      QRL_goal_6.Caption          := FieldByName('goal_6').AsString;
    end;
end;

procedure TQuickRep1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    MainForm.GSWorkLevel  := 0;
end;

end.
 