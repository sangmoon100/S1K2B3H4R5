unit pic10504;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, ExtCtrls, Pic10501, Qrctrls;

type
  TPrintForm_2 = class(TForm)
    QRBand_Header: TQRBand;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
    QRLabel13: TQRLabel;
    QRL_annono: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand_Detail: TQRBand;
    QRShape28: TQRShape;
    QRL_ancode_name: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRL_payra_name: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRL_deptname: TQRLabel;
    QRL_anfrdate: TQRLabel;
    QRL_antodate: TQRLabel;
    InReport: TQuickRep;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel5: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRL_paycl: TQRLabel;
    QRL_tcontamt: TQRLabel;
    QRShape17: TQRShape;
    QRLabel7: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRL_tcontr: TQRLabel;
    QRShape20: TQRShape;
    QRL_ttype: TQRLabel;
    QRL_mark: TQRLabel;
    QRShape21: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape22: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRL_tjobduty: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    procedure InReportBeforePrint(var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(var MoreData: Boolean);
    procedure QRBand_HeaderBeforePrint(var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm_2: TPrintForm_2;
  DataIn   : Pic10501.TDataIn;
  Fin      : file of Pic10501.TDataIn;

implementation
{$R *.DFM}
var
  PageStart: Boolean;

procedure TPrintForm_2.InReportBeforePrint(var PrintReport: Boolean);
begin
  AssignFile(Fin, HomeDir+'\list\pic1050c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  PageStart := False;  
end;

procedure TPrintForm_2.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
end;

procedure TPrintForm_2.InReportNeedData(var MoreData: Boolean);
begin
  if not Eof(Fin) then begin
    with DataIn do begin
      QRL_ancode_name.Caption := '';
      QRL_anfrdate.Caption    := '';
      QRL_antodate.Caption    := '';
      QRL_korname.Caption     := '';
      QRL_empno.Caption       := '';
      QRL_payra_name.Caption  := '';
      QRL_paycl.Caption       := '';
      QRL_tcontamt.Caption    := '';
      QRL_tcontr.Caption      := '';
      QRL_ttype.Caption       := '';
      QRL_mark.Caption        := '';
      QRL_deptname.Caption    := '';
      
      if PageStart = False then  Read(Fin, DataIn);
      PageStart := False;
      QRBand_Detail.Enabled := True;
      MoreData := True;

      // Flag에 맞는 데이타를 찍는다.
      if (DataIn.Flag = 'F') then begin
        QRL_deptname.Font.Size := 12;
        QRL_deptname.Font.Name := '궁서체';
        QRL_Mark.Caption := '';
        QRL_deptname.Height := 15;
        deptname := '              ' + deptname;
        mark := '          ' + anfrdate;
        anfrdate := '';
      end else begin
        QRL_deptname.Font.Size := 9;
        QRL_deptname.Font.Name := '굴림체';
        QRL_deptname.Height := 12;
      end;
      if (DataIn.Flag = 'E') then begin
         if not Eof(Fin) then begin
            QRBand_Detail.Enabled := False;
            InReport.NewPage;
            system.exit;
         end;
      end;
      QRL_ancode_name.Caption := ancode_name;
      QRL_anfrdate.Caption    := anfrdate;
      QRL_antodate.Caption    := antodate;
      QRL_korname.Caption     := korname;
      QRL_empno.Caption       := empno;
      QRL_payra_name.Caption  := payra_name;
      QRL_paycl.Caption       := paycl;
      QRL_tcontamt.Caption    := tcontramt;
      QRL_tcontr.Caption      := tcontr_name;
      QRL_ttype.Caption       := ttype;
      QRL_tjobduty.Caption    := tjobduty;
      QRL_deptname.Caption    := deptname;
      QRL_mark.Caption        := mark;
    end;
  end else begin
    MoreData := False;
  end;
end;

procedure TPrintForm_2.QRBand_HeaderBeforePrint(var PrintBand: Boolean);
begin
  if not Eof(Fin) then begin
     PageStart := True;
     Read(Fin, DataIn);
     QRL_annono.Caption  := DataIn.annono;
  end;
end;

end.
