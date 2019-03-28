unit Pia1054c;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;

{$I pia1050c.inc}
type
  Tpia1054cForm = class(TForm)
    procedure insa3ReportAfterPrint(Sender: TObject);
    procedure insa3ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure insa3ReportPreview(Sender: TObject);

  private

  public
    { Public declarations }
  end;


var
  //detail_cnt  : integer;
  F        : file of DataSource_insa3;
  P        : DataSource_insa3;
  nPos     : LongInt;

implementation

{$R *.DFM}
uses pia1051c, Pia1057c;


procedure Tpia1054cForm.insa3ReportAfterPrint(Sender: TObject);
     System.close(F);
end;



procedure Tpia1054cForm.insa3ReportNeedData(Sender: TObject;
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

procedure Tpia1054cForm.insa3ReportBeforePrint(Sender: TCustomQuickRep;
begin
     //detail_cnt := 1;
     AssignFile(F,HomeDir+'\list\pia1052c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1054cForm.QRBand1BeforePrint(Sender: TQRCustomBand;
begin
     nPos := FilePos(F);
     Read(F,p);
     Seek(F,nPos);
     empno.Caption   := p.empno;
     korname.caption := p.korname;
end;

procedure Tpia1054cForm.insa3ReportPreview(Sender: TObject);
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa3Report;
               //insaReport�� pia1057cForm�� ����� Public ����
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.