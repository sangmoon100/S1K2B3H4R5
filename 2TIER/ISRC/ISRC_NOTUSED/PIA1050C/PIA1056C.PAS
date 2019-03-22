unit Pia1056c;

interface

uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;


{$I pia1050c.inc}

type  Tpia1056cForm = class(TForm)
    insa5Report: TQuickRep;
    QRBand2: TQRBand;    QRShape4: TQRShape;    QRShape12: TQRShape;    QRBand1: TQRBand;    QRShape22: TQRShape;    QRBand3: TQRBand;    QRLabel168: TQRLabel;    QRShape31: TQRShape;    QRShape1: TQRShape;    empno: TQRLabel;    korname: TQRLabel;    QRShape2: TQRShape;    QRShape3: TQRShape;    QRLabel11: TQRLabel;    QRShape5: TQRShape;    QRLabel8: TQRLabel;    QRLabel12: TQRLabel;    QRLabel13: TQRLabel;    QRLabel14: TQRLabel;    QRLabel15: TQRLabel;    QRLabel16: TQRLabel;    QRLabel17: TQRLabel;    JOBFIELDNAME: TQRLabel;    DUTYKINDNAME: TQRLabel;    DUTYNAME: TQRLabel;    PAYCLNAME: TQRLabel;    DUTYDATE: TQRLabel;    DUTYTEXT: TQRLabel;    DUTY: TQRLabel;    QRShape7: TQRShape;    QRShape8: TQRShape;    QRShape9: TQRShape;    QRShape10: TQRShape;    QRShape11: TQRShape;    QRShape13: TQRShape;    QRShape14: TQRShape;    QRShape15: TQRShape;    QRShape16: TQRShape;    QRShape17: TQRShape;    QRShape18: TQRShape;    QRShape19: TQRShape;    QRShape20: TQRShape;    QRShape21: TQRShape;    QRShape6: TQRShape;    QRLabel1: TQRLabel;    YY: TQRLabel;    QRShape23: TQRShape;    QRShape24: TQRShape;    MM: TQRLabel;
    procedure insa5ReportAfterPrint(Sender: TObject);    procedure insa5ReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure insa5ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure insa5ReportPreview(Sender: TObject);

  private    { Private declarations }

  public
    { Public declarations }
  end;


var  pia1056cForm: Tpia1056cForm;
  F        : file of DataSource_insa5;
  P        : DataSource_insa5;
  nPos     : LongInt;


implementation
uses pia1051c, Pia1057c;

{$R *.DFM}

procedure Tpia1056cForm.insa5ReportAfterPrint(Sender: TObject);begin
     System.close(F);
end;




procedure Tpia1056cForm.insa5ReportNeedData(Sender: TObject;  var MoreData: Boolean);
begin
     if not Eof(F) then
     begin
          Read(F,P);
          JOBFIELDNAME.caption   := p.JOBFIELDNAME;
          DUTYKINDNAME.caption   := p.DUTYKINDNAME;
          DUTYNAME.caption       := p.DUTYNAME;
          PAYCLNAME.caption      := p.PAYCLNAME;
          DUTYDATE.caption       := p.DUTYDATE;
          YY.caption             := p.YY;
          MM.caption             := p.MM;
          DUTYTEXT.caption       := p.DUTYTEXT;
          DUTY.caption           := p.DUTY;
          QRBand1.Enabled  := True;
          QRBand3.Enabled  := True;
          MoreData := True;

          if p.gubun = 'L' then
          begin
             QRBand1.Enabled := False;
             QRBand3.Enabled := True;
             system.Exit;
          end;

          if p.gubun = 'P' then
          begin
             QRBand1.Enabled := False;
             QRBand3.Enabled := False;
             if (EOF(F) = False) then insa5Report.NewPage;
             system.Exit;
          end;
     end
     else MoreData := False;
end;

procedure Tpia1056cForm.insa5ReportBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
     AssignFile(F,HomeDir+'\list\pia1054c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1056cForm.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     nPos := FilePos(F);
     Read(F,p);
     Seek(F,nPos);
     empno.Caption   := p.empno;
     korname.caption := p.korname;
end;

procedure Tpia1056cForm.insa5ReportPreview(Sender: TObject);begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa5Report;
               //insaReport는 pia1057cForm에 선언된 Public 변수
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.
