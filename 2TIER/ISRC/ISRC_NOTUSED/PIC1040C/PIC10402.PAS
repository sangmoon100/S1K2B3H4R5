unit pic10402;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, pic10401, DB, DBTables;

type
  TPrintForm = class(TForm)
    QRBand_Header: TQRBand;
    InReport: TQuickRep;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand_Detail: TQRBand;
    QRShape28: TQRShape;
    QRL_ancode_name: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_bdeptname: TQRLabel;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape35: TQRShape;
    QRL_bpayra_name: TQRLabel;
    QRL_payra_name: TQRLabel;
    QRLabel13: TQRLabel;
    QRL_annono: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRL_BEFORE: TQRLabel;
    QRL_AFTER: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRL_bpaycl: TQRLabel;
    QRL_paycl: TQRLabel;
    QRShape18: TQRShape;
    QRL_deptname: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRL_anfrdate: TQRLabel;
    QRL_antodate: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRL_mark: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    procedure InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;
  DataIn   : pic10401.TDataIn;
  Fin      : file of pic10401.TDataIn;

implementation
{$R *.DFM}
var
  PageStart: Boolean;

procedure TPrintForm.InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  AssignFile(Fin, HomeDir+'/list/pic1040c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  PageStart := False;
end;

procedure TPrintForm.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
end;

procedure TPrintForm.InReportNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if (DataIn.Flag = 'E') then
  begin
    if not Eof(Fin) then
    begin
      InReport.NewPage;
    end;
    DataIn.Flag := '';
  end;

  if not Eof(Fin) then
  begin
    with DataIn do
    begin
      QRL_ancode_name.Caption := '';
      QRL_korname.Caption     := '';
      QRL_empno.Caption       := '';
      QRL_mark.Caption        := '';
      QRL_bpaycl.Caption      := '';
      QRL_bdeptname.Caption   := '';
      QRL_bpayra_name.Caption := '';
      QRL_anfrdate.Caption    := '';
      QRL_paycl.Caption       := '';
      QRL_deptname.Caption    := '';
      QRL_payra_name.Caption  := '';
      QRL_antodate.Caption    := '';

      if PageStart = False then
        Read(Fin, DataIn);
      PageStart := False;
{
      if flag = 'C' then
        QRL_annono.Caption := annono;
}
      QRL_ancode_name.Caption := ancode_name;
      QRL_korname.Caption     := korname;
      QRL_empno.Caption       := empno;
      QRL_mark.Caption        := mark;
      QRL_bpaycl.Caption      := bpaycl;
      QRL_bpayra_name.Caption := bpayra_name;
      QRL_bdeptname.Caption   := bdeptname;
      QRL_anfrdate.Caption    := anfrdate;
      QRL_antodate.Caption    := antodate;
      if paycl = bpaycl then
        QRL_paycl.Caption := ''
      else
        QRL_paycl.Caption := paycl;
      if payra_name = bpayra_name then
        QRL_payra_name.Caption := ''
      else
        QRL_payra_name.Caption  := payra_name;
      if deptname = bdeptname then
        QRL_deptname.Caption := ''
      else
        QRL_deptname.Caption    := deptname;

      if (empno = '') and (ancode_name = '') and (deptname <> '') then begin
        QRL_deptname.Font.Size := 12;   {DACOM : 12, DST : 10}
        QRL_deptname.Font.Name := '±Ã¼­Ã¼';
        QRL_deptname.Height := 20;
      end else begin
        QRL_deptname.Font.Size := 9;
        QRL_deptname.Font.Name := '±¼¸²Ã¼';
        QRL_deptname.Height := 12;
{        QRL_mark.Top := 41;
        QRL_mark.Height := 12;}
      end;
      MoreData := True;
    end;
  end
  else
  begin
    MoreData := False;
  end;
end;

procedure TPrintForm.QRBand_DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if DataIn.empno = '' then
  begin
    QRL_BEFORE.Caption := '';
    QRL_AFTER.Caption  := '';
  end
  else
  begin
    QRL_BEFORE.Caption := 'Àü';
    QRL_AFTER.Caption  := 'ÈÄ';
  end;
end;

procedure TPrintForm.QRBand_HeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if not Eof(Fin) then
  begin
    PageStart := True;
    Read(Fin, DataIn);
    QRL_annono.Caption  := DataIn.annono;
  end;
end;

end.

