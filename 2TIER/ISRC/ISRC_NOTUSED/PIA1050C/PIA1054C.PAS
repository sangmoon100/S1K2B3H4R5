unit Pia1054c;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;

{$I pia1050c.inc}
type
  Tpia1054cForm = class(TForm)    insa3Report: TQuickRep;    QRBand1: TQRBand;    QRBand2: TQRBand;    QRShape1: TQRShape;    empno: TQRLabel;    korname: TQRLabel;    QRShape2: TQRShape;    QRLabel17: TQRLabel;    QRShape3: TQRShape;    QRLabel8: TQRLabel;    QRShape4: TQRShape;    QRLabel1: TQRLabel;    QRLabel2: TQRLabel;    QRLabel3: TQRLabel;    QRLabel4: TQRLabel;    QRLabel5: TQRLabel;    QRShape5: TQRShape;    QRShape6: TQRShape;    QRLabel7: TQRLabel;    QRLabel9: TQRLabel;    QRLabel10: TQRLabel;    QRLabel11: TQRLabel;    QRLabel13: TQRLabel;    QRLabel14: TQRLabel;    QRLabel12: TQRLabel;    QRShape7: TQRShape;    ancode: TQRLabel;    andate: TQRLabel;    paycl: TQRLabel;    paygr: TQRLabel;    andata: TQRLabel;    annono: TQRLabel;    QRShape8: TQRShape;    totrank: TQRLabel;    payclrank: TQRLabel;    adjscore: TQRLabel;    adjclass: TQRLabel;    paycl2: TQRLabel;    intodate: TQRLabel;    QRShape9: TQRShape;    QRShape10: TQRShape;    QRShape11: TQRShape;    QRShape12: TQRShape;    QRShape13: TQRShape;    QRShape14: TQRShape;    QRShape15: TQRShape;    QRShape16: TQRShape;    QRShape18: TQRShape;    QRShape19: TQRShape;    QRShape20: TQRShape;    QRShape21: TQRShape;    QRShape22: TQRShape;    QRShape23: TQRShape;    QRShape24: TQRShape;    QRShape25: TQRShape;    QRShape26: TQRShape;    QRShape27: TQRShape;    QRShape28: TQRShape;    QRShape29: TQRShape;    QRShape30: TQRShape;    QRShape31: TQRShape;    QRShape32: TQRShape;    QRShape33: TQRShape;    QRBand3: TQRBand;    QRLabel168: TQRLabel;
    procedure insa3ReportAfterPrint(Sender: TObject);    procedure insa3ReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure insa3ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure insa3ReportPreview(Sender: TObject);

  private    { Private declarations }

  public
    { Public declarations }
  end;


var  pia1054cForm: Tpia1054cForm;
  //detail_cnt  : integer;
  F        : file of DataSource_insa3;
  P        : DataSource_insa3;
  nPos     : LongInt;

implementation

{$R *.DFM}
uses pia1051c, Pia1057c;


procedure Tpia1054cForm.insa3ReportAfterPrint(Sender: TObject);begin
     System.close(F);
end;



procedure Tpia1054cForm.insa3ReportNeedData(Sender: TObject;  var MoreData: Boolean);
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
          annono.caption   := p.annono;

          intodate.caption := p.intodate;
          adjclass.caption := p.adjclass;
          payclrank.caption:= p.payclrank;
          paycl2.caption   := p.paycl2;
          adjscore.caption := p.adjscore;
          totrank.caption  := p.totrank;

          QRBand2.Enabled  := True;
          QRBand3.Enabled  := True;
          MoreData := True;

          if p.gubun = 'L' then
          begin
             QRBand2.Enabled := False;
             QRBand3.Enabled := True;
             system.Exit;
          end;

          if p.gubun = 'P' then
          begin
             QRBand2.Enabled := False;
             QRBand3.Enabled := False;
             if (EOF(F) = False) then insa3Report.NewPage;
             system.Exit;
          end;
     end
     else MoreData := False;
end;

procedure Tpia1054cForm.insa3ReportBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
     //detail_cnt := 1;
     AssignFile(F,HomeDir+'\list\pia1052c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1054cForm.QRBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     nPos := FilePos(F);
     Read(F,p);
     Seek(F,nPos);
     empno.Caption   := p.empno;
     korname.caption := p.korname;
end;

procedure Tpia1054cForm.insa3ReportPreview(Sender: TObject);begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa3Report;
               //insaReport는 pia1057cForm에 선언된 Public 변수
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.
