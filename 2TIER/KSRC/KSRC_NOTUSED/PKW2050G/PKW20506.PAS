unit pkw20506;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel22: TQRLabel;
    QRdate: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRpstate: TQRLabel;
    QRempno: TQRLabel;
    QRKorname: TQRLabel;
    QRempdate: TQRLabel;
    QRretdate: TQRLabel;
    QRdeptname: TQRLabel;
    QRpaycl: TQRLabel;
    QRjobduty: TQRLabel;
    QRconyn: TQRLabel;
    QRBand2: TQRBand;
    Cntc: TQRLabel;
    CntNum: TQRLabel;
    QRL_title: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses pkw20503 ;

{$R *.DFM}


procedure TQuickReport1.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
 { var
  Fempdate : string;
  Nempdate : string; }
begin
{     QRempno.caption   := DM.Query1.FieldbyName('���').asstring ;
     QRkorname.caption := DM.Query1.FieldbyName('����').asstring ;
     QRempdate.caption := DM.Query1.FieldbyName('�Ի���').asstring ;
     QRretdate.caption := DM.Query1.FieldbyName('�����').asstring ;
     QRdeptname.caption := DM.Query1.FieldbyName('�μ�').asstring ;
     QRpaycl.caption := DM.Query1.FieldbyName('����').asstring ;
     QRjobduty.caption := DM.Query1.FieldbyName('�������').asstring ;
     QRpstate.caption := DM.Query1.FieldbyName('�λ����').asstring ;
     QRconyn.caption := DM.Query1.FieldbyName('�̵�Ϲ̰���').asstring ; }

{     Fempdate   := DM.Query1.Fields[2].asstring;
     Nempdate   := Copy(Fempdate,1,4)+'/'+
                       Copy(Fempdate,5,2)+'/'+Copy(Fempdate,7,2);}

     QRempno.caption   := DM.Query1.Fields[0].asstring ;
     QRkorname.caption := DM.Query1.Fields[1].asstring ;
     QRempdate.caption := DM.Query1.Fields[2].asstring ;
   //  QRempdate.caption := Nempdate ;
     QRretdate.caption := DM.Query1.Fields[3].asstring ;
     QRdeptname.caption := DM.Query1.Fields[4].asstring ;
     QRpaycl.caption := DM.Query1.Fields[5].asstring ;
     QRjobduty.caption := DM.Query1.Fields[6].asstring ;
     QRpstate.caption := DM.Query1.Fields[7].asstring ;
     QRconyn.caption := DM.Query1.Fields[8].asstring ;

end;

end.