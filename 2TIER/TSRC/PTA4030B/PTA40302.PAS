unit PTA40302;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport1 = class(TQuickRep)
    QRBand2: TQRBand;
    QRShape57: TQRShape;
    QRShape20: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRShape25: TQRShape;
    QRShape49: TQRShape;
    QRShape45: TQRShape;
    QRShape41: TQRShape;
    QRShape37: TQRShape;
    QRShape33: TQRShape;
    QRShape29: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape73: TQRShape;
    QRShape67: TQRShape;
    QRShape64: TQRShape;
    QRShape61: TQRShape;
    QRShape54: TQRShape;
    QRShape50: TQRShape;
    QRShape46: TQRShape;
    QRShape42: TQRShape;
    QRShape38: TQRShape;
    QRShape34: TQRShape;
    QRShape27: TQRShape;
    QRShape17: TQRShape;
    QRLabel1: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    L_EduDate1: TQRLabel;
    L_EduDate2: TQRLabel;
    L_EduDate3: TQRLabel;
    L_EduDate4: TQRLabel;
    L_EduDate5: TQRLabel;
    L_EduDate6: TQRLabel;
    L_EduDate7: TQRLabel;
    L_EduDate8: TQRLabel;
    L_EduDate9: TQRLabel;
    L_EduDate10: TQRLabel;
    L_EduTitle1: TQRLabel;
    L_EduTitle2: TQRLabel;
    L_EduTitle3: TQRLabel;
    L_EduTitle4: TQRLabel;
    L_EduTitle5: TQRLabel;
    L_EduTitle6: TQRLabel;
    L_EduTitle7: TQRLabel;
    L_EduTitle8: TQRLabel;
    L_EduTitle9: TQRLabel;
    L_EduTitle10: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape13: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    L_Korname: TQRLabel;
    L_Juminid: TQRLabel;
    L_Curaddr: TQRLabel;
    L_Retcont: TQRLabel;
    L_Telno: TQRLabel;
    L_Email: TQRLabel;
    L_Paycl: TQRLabel;
    L_Pstate: TQRLabel;
    L_Lschgr: TQRLabel;
    L_Lmajor: TQRLabel;
    L_SysDate: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses PTA40301;

{$R *.DFM}

procedure TQuickReport1.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   while (frmMain.Q_Text.FieldByName('empno').AsString = frmMain.Q_Grid1.FieldByName('empno').AsString) And
         (not frmMain.Q_Text.eof ) do
   begin
       L_Korname.Caption := frmMain.Q_Text.Fields[ 1].AsString;
       L_Juminid.Caption := frmMain.Q_Text.Fields[ 2].AsString;
       L_Curaddr.Caption := frmMain.Q_Text.Fields[ 3].AsString;
       L_Retcont.Caption := frmMain.Q_Text.Fields[ 4].AsString;
       L_Telno.Caption   := frmMain.Q_Text.Fields[ 5].AsString;
       L_Email.Caption   := frmMain.Q_Text.Fields[ 6].AsString;
       L_paycl.Caption   := frmMain.Q_Text.Fields[ 7].AsString;
       L_Lschgr.Caption  := frmMain.Q_Text.Fields[ 8].AsString;
       L_Lmajor.Caption  := frmMain.Q_Text.Fields[ 9].AsString;
       L_Pstate.Caption  := frmMain.Q_Text.Fields[10].AsString;
       QRLabel23.Caption := frmMain.Q_Text.Fields[11].AsString;
       QRLabel25.Caption := frmMain.Q_Text.Fields[11].AsString;
       frmMain.Q_Text.Next;
   end;
end;

procedure TQuickReport1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   i          : integer;
   L_Edudate  : TQRLabel;
   L_EduTitle : TQRLabel;
begin
   i := 1;
   frmMain.Q_Grid2.First;

   L_SysDate.Caption := copy(frmMain.FG_sysdate,1,4) + '.  '+
                        copy(frmMain.FG_sysdate,5,2) + '.  '+
                        copy(frmMain.FG_sysdate,7,2) + '.';
   while i <= 10 do
   begin
       L_EduDate  := Self.FindComponent('L_EduDate' +IntToStr(i)) As TQRLabel;
       L_EduTitle := Self.FindComponent('L_EduTitle'+IntToStr(i)) As TQRLabel;

       L_EduDate.Caption  := frmMain.Q_Grid2.Fields[ 1].AsString;
       L_EduTitle.Caption := frmMain.Q_Grid2.Fields[ 2].AsString;

       Inc(i);
       frmMain.Q_Grid2.Next;
   end;
end;

end.
