unit Pia1056c;

interface

uses
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;


{$I pia1050c.inc}

type
    insa5Report: TQuickRep;
    QRBand2: TQRBand;
    procedure insa5ReportAfterPrint(Sender: TObject);
    procedure insa5ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure insa5ReportPreview(Sender: TObject);

  private

  public
    { Public declarations }
  end;


var
  F        : file of DataSource_insa5;
  P        : DataSource_insa5;
  nPos     : LongInt;


implementation
uses pia1051c, Pia1057c;

{$R *.DFM}


     System.close(F);
end;




procedure Tpia1056cForm.insa5ReportNeedData(Sender: TObject;
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

procedure Tpia1056cForm.insa5ReportBeforePrint(Sender: TCustomQuickRep;
begin
     AssignFile(F,HomeDir+'\list\pia1054c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1056cForm.QRBand2BeforePrint(Sender: TQRCustomBand;
begin
     nPos := FilePos(F);
     Read(F,p);
     Seek(F,nPos);
     empno.Caption   := p.empno;
     korname.caption := p.korname;
end;

procedure Tpia1056cForm.insa5ReportPreview(Sender: TObject);
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa5Report;
               //insaReport�� pia1057cForm�� ����� Public ����
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.