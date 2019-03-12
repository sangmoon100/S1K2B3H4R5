unit Uprint2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickRep2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QR_empno: TQRLabel;
    QR_korname: TQRLabel;
    QR_deptname: TQRLabel;
    QR_payraname: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel15: TQRLabel;
    QRShape25: TQRShape;
    QRLabel16: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel22: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel23: TQRLabel;
    QRShape45: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QR_H1jobkind1: TQRLabel;
    QR_H1jobduty1: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QR_H1jobkind2: TQRLabel;
    QR_H1jobduty2: TQRLabel;
    QR_H2jobkind1: TQRLabel;
    QR_H2jobduty1: TQRLabel;
    QRShape48: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QR_H1jobkind3: TQRLabel;
    QR_H1jobduty3: TQRLabel;
    QR_H3jobkind1: TQRLabel;
    QR_H3jobduty1: TQRLabel;
    QR_E1opinion: TQRMemo;
    QR_dutytarget: TQRMemo;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel26: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QR_H2jobkind2: TQRLabel;
    QR_H2jobduty2: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QR_H2jobkind3: TQRLabel;
    QR_H2jobduty3: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QR_H3jobkind2: TQRLabel;
    QR_H3jobduty2: TQRLabel;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QR_H3jobkind3: TQRLabel;
    QR_H3jobduty3: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape49: TQRShape;
    QRShape71: TQRShape;
    QR_H1jobkind4: TQRLabel;
    QR_H1jobduty4: TQRLabel;
    QR_H1jobkind5: TQRLabel;
    QRShape73: TQRShape;
    QR_H1jobduty5: TQRLabel;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QR_H2jobkind4: TQRLabel;
    QR_H2jobduty4: TQRLabel;
    QR_H2jobkind5: TQRLabel;
    QRShape79: TQRShape;
    QR_H2jobduty5: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QR_H3jobkind4: TQRLabel;
    QR_H3jobduty4: TQRLabel;
    QR_H3jobkind5: TQRLabel;
    QRShape88: TQRShape;
    QR_H3jobduty5: TQRLabel;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QR_H1Nowpath1: TQRLabel;
    QR_H1Nowpath2: TQRLabel;
    QR_H1Nowpath3: TQRLabel;
    QR_H1Nowpath4: TQRLabel;
    QR_H1Nowpath5: TQRLabel;
    QR_H2Nowpath5: TQRLabel;
    QR_H2Nowpath4: TQRLabel;
    QR_H2Nowpath3: TQRLabel;
    QR_H2Nowpath2: TQRLabel;
    QR_H2Nowpath1: TQRLabel;
    QR_H3Nowpath5: TQRLabel;
    QR_H3Nowpath4: TQRLabel;
    QR_H3Nowpath3: TQRLabel;
    QR_H3Nowpath2: TQRLabel;
    QR_H3Nowpath1: TQRLabel;
    QRShape72: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QR_H1jobkind6: TQRLabel;
    QR_H1jobduty6: TQRLabel;
    QR_H1jobkind7: TQRLabel;
    QR_H1jobduty7: TQRLabel;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QR_H2jobkind6: TQRLabel;
    QR_H2jobduty6: TQRLabel;
    QR_H2jobkind7: TQRLabel;
    QR_H2jobduty7: TQRLabel;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QR_H3jobkind6: TQRLabel;
    QR_H3jobduty6: TQRLabel;
    QR_H3jobkind7: TQRLabel;
    QR_H3jobduty7: TQRLabel;
    QRShape109: TQRShape;
    QR_H1Nowpath6: TQRLabel;
    QR_H1Nowpath7: TQRLabel;
    QR_H2Nowpath7: TQRLabel;
    QR_H2Nowpath6: TQRLabel;
    QR_H3Nowpath7: TQRLabel;
    QR_H3Nowpath6: TQRLabel;
    QRShape110: TQRShape;
    QRShape26: TQRShape;
    Q_dutytodate: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickRep2: TQuickRep2;

implementation

uses PIU3010A1;

{$R *.DFM}

procedure TQuickRep2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_deptname.Caption  := FM_Main.L_deptname.ValueCaption;
     QR_empno.Caption     := FM_Main.ED_empno.Text;
     QR_korname.Caption   := FM_Main.L_korname.ValueCaption;
     QR_payraname.Caption := FM_Main.L_payraname.ValueCaption;
end;

procedure TQuickRep2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var   i, j :integer;
begin
     QR_dutytarget.Lines.Clear;
     QR_dutytarget.Lines.Add(FM_Main.ED_dutytarget.Text);

     i := 1;
     FM_Main.Q_Path1.First;
     while not FM_Main.Q_Path1.Eof do
     begin
          TQRLabel(FindComponent('QR_H1Jobkind'+inttostr(i))).Caption := FM_Main.Q_Path1.FieldByName('Jobkindname').AsString;
          TQRLabel(FindComponent('QR_H1Jobduty'+inttostr(i))).Caption := FM_Main.Q_Path1.FieldByName('Jobdutyname').AsString;
          TQRLabel(FindComponent('QR_H1nowpath'+inttostr(i))).Caption := FM_Main.Q_Path1.FieldByName('nowpathname').AsString;
          FM_Main.Q_Path1.Next;
          i := i + 1;
     end;
     For j := i to 7 do
     begin
          TQRLabel(FindComponent('QR_H1Jobkind'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H1Jobduty'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H1nowpath'+inttostr(j))).Caption := '';
     end;
     FM_Main.Q_Path1.First;

     i := 1;
     FM_Main.Q_Path2.First;
     while not FM_Main.Q_Path2.Eof do
     begin
          TQRLabel(FindComponent('QR_H2Jobkind'+inttostr(i))).Caption := FM_Main.Q_Path2.FieldByName('Jobkindname').AsString;
          TQRLabel(FindComponent('QR_H2Jobduty'+inttostr(i))).Caption := FM_Main.Q_Path2.FieldByName('Jobdutyname').AsString;
          TQRLabel(FindComponent('QR_H2nowpath'+inttostr(i))).Caption := FM_Main.Q_Path2.FieldByName('nowpathname').AsString;
          FM_Main.Q_Path2.Next;
          i := i + 1;
     end;
     For j := i to 7 do
     begin
          TQRLabel(FindComponent('QR_H2Jobkind'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H2Jobduty'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H2nowpath'+inttostr(j))).Caption := '';
     end;
     FM_Main.Q_Path2.First;

     i := 1;
     FM_Main.Q_Path3.First;
     while not FM_Main.Q_Path3.Eof do
     begin
          TQRLabel(FindComponent('QR_H3Jobkind'+inttostr(i))).Caption := FM_Main.Q_Path3.FieldByName('Jobkindname').AsString;
          TQRLabel(FindComponent('QR_H3Jobduty'+inttostr(i))).Caption := FM_Main.Q_Path3.FieldByName('Jobdutyname').AsString;
          TQRLabel(FindComponent('QR_H3nowpath'+inttostr(i))).Caption := FM_Main.Q_Path3.FieldByName('nowpathname').AsString;
          FM_Main.Q_Path3.Next;
          i := i + 1;
     end;
     For j := i to 7 do
     begin
          TQRLabel(FindComponent('QR_H3Jobkind'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H3Jobduty'+inttostr(j))).Caption := '';
          TQRLabel(FindComponent('QR_H3nowpath'+inttostr(j))).Caption := '';
     end;
     FM_Main.Q_Path3.First;

     QR_E1opinion.Lines.Clear;
     QR_E1opinion.Lines.Add(FM_Main.ED_E1opinion.Text);
end;

procedure TQuickRep2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if  FM_Main.Q_Grid.FieldByName('dutytodate').AsString = '현재' then
     begin
          Q_dutytodate.Caption :=  FM_Main.Q_Grid.FieldByName('dutytodate').AsString;
          QRLabel24.Caption := '현 직무군 근무기간'
     end
     else
     begin
          Q_dutytodate.Caption := copy(FM_Main.Q_Grid.FieldByName('dutytodate').AsString,1,4)+'년'+
                                  copy(FM_Main.Q_Grid.FieldByName('dutytodate').AsString,5,2)+'월'+
                                  copy(FM_Main.Q_Grid.FieldByName('dutytodate').AsString,7,2)+'일';
          QRLabel24.Caption := '근 무 기 간'
     end
end;

end.
