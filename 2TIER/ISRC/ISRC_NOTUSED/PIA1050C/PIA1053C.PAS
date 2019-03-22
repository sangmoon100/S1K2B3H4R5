unit Pia1053c;
interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,  Forms, Dialogs, ExtCtrls, QuickRpt, StdCtrls, Qrctrls, QRPrntr;

{$I pia1050c.inc}

type  Tpia1053cForm = class(TForm)    insa2Report: TQuickRep;    QRBand2: TQRBand;    QRShape1: TQRShape;    QRShape2: TQRShape;    QRShape12: TQRShape;    QRLabel8: TQRLabel;    empno: TQRLabel;    korname: TQRLabel;    QRBand1: TQRBand;    ancode: TQRLabel;    andate: TQRLabel;    paycl: TQRLabel;    paygr: TQRLabel;    andata: TQRLabel;    payra: TQRLabel;    tjobduty: TQRLabel;    annono: TQRLabel;    QRShape3: TQRShape;    QRShape4: TQRShape;    QRLabel9: TQRLabel;    QRLabel10: TQRLabel;    QRLabel11: TQRLabel;    QRLabel12: TQRLabel;    QRLabel13: TQRLabel;    QRLabel14: TQRLabel;    QRLabel15: TQRLabel;    QRShape5: TQRShape;    QRShape6: TQRShape;    QRShape7: TQRShape;    QRShape8: TQRShape;    QRShape9: TQRShape;    QRShape10: TQRShape;    QRShape11: TQRShape;    QRShape13: TQRShape;    QRShape14: TQRShape;    QRShape15: TQRShape;    QRShape17: TQRShape;    QRShape18: TQRShape;    QRShape16: TQRShape;    QRShape19: TQRShape;    QRShape20: TQRShape;    QRBand3: TQRBand;    QRLabel48: TQRLabel;    QRShape169: TQRShape;    QRShape21: TQRShape;    QRShape22: TQRShape;    QRShape23: TQRShape;    QRLabel1: TQRLabel;    payra2: TQRLabel;    procedure insa2ReportAfterPrint(Sender: TObject);    procedure insa2ReportNeedData(Sender: TObject; var MoreData: Boolean);    procedure insa2ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);    procedure insa2ReportPreview(Sender: TObject);  private
     { Private declarations }  public    { Public declarations }  end;


var  pia1053cForm: Tpia1053cForm;  F        : file of DataSource_insa2;  P        : DataSource_insa2;  nPos     : LongInt;implementation
uses pia1051c, Pia1057c;
{$R *.DFM}
procedure Tpia1053cForm.insa2ReportAfterPrint(Sender: TObject);begin     System.close(F);end;
procedure Tpia1053cForm.insa2ReportNeedData(Sender: TObject;  var MoreData: Boolean);
begin
     if not Eof(F) then
     begin
          Read(F,P);
          empno.caption    := p.empno;
          korname.caption  := p.korname;
          ancode.caption   := p.ancode;
          andate.caption   := p.andate;
          paycl.caption    := p.paycl;
          paygr.caption    := p.paygr;
          andata.caption   := p.andata;
          payra.caption    := p.payra;
          payra2.caption   := p.payra2;
          tjobduty.caption := p.tjobduty;
          annono.caption   := p.annono;
          QRBand1.Enabled  := True;
          QRBand3.Enabled  := True;
          MoreData := True;

          if p.gubun = 'L' then
          begin
               QRBand1.Enabled := False;
               QRBand3.Enabled := True;
               system.Exit;
          end;

          if (p.gubun = 'P')  then
          begin
               QRBand1.Enabled := False;
               QRBand3.Enabled := False;
               if (EOF(F) = False) then insa2Report.NewPage;
               system.Exit;
          end;
     end
     else MoreData := False;
end;

procedure Tpia1053cForm.insa2ReportBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
     AssignFile(F,HomeDir+'\list\pia1051c.tmp');
     System.Reset(F);     System.Seek(F,0);
end;

procedure Tpia1053cForm.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     nPos := FilePos(F);
     Read(F,p);     Seek(F,nPos);     empno.Caption   := p.empno;     korname.caption := p.korname;
end;

procedure Tpia1053cForm.insa2ReportPreview(Sender: TObject);begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa2Report;
               //insaReport는 pia1057cForm에 선언된 Public 변수
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.
