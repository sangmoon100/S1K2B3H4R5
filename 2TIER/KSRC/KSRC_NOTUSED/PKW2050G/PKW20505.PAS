unit pkw20505;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TReportForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
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
    QRL_title: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel22: TQRLabel;
    QRdate: TQRLabel;
    QRBand2: TQRBand;
    Cntc: TQRLabel;
    CntNum: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportForm: TReportForm;

implementation

uses pkw20503, pkw20504;

{$R *.DFM}

procedure TReportForm.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRempno.caption   := DM.Query1.FieldbyName('사번').asstring ;
     QRkorname.caption := DM.Query1.FieldbyName('성명').asstring ;
     QRempdate.caption := DM.Query1.FieldbyName('입사일').asstring ;
     QRretdate.caption := DM.Query1.FieldbyName('퇴사일').asstring ;
     QRdeptname.caption := DM.Query1.FieldbyName('부서').asstring ;
     QRpaycl.caption := DM.Query1.FieldbyName('직급').asstring ;
     QRjobduty.caption := DM.Query1.FieldbyName('담당직무').asstring ;
     QRpstate.caption := DM.Query1.FieldbyName('인사상태').asstring ;
     QRconyn.caption := DM.Query1.FieldbyName('미등록미결재').asstring ;
    end;


end.
