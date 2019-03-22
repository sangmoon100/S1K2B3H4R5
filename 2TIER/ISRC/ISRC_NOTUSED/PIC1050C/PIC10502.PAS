unit pic10502;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, Pic10501, DB, DBTables;

type
  TPrintForm_1 = class(TForm)
    QRBand_Header: TQRBand;
    QRShape2: TQRShape;
    InReport: TQuickRep;
    QRLabel2: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
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
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRL_BEFORE: TQRLabel;
    QRL_AFTER: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_bpaycl: TQRLabel;
    QRL_paycl: TQRLabel;
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
    QRShape12: TQRShape;
    QRL_annono: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRL_dispatch: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_DocNum: TQRLabel;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRLabel16: TQRLabel;
    QRShape22: TQRShape;
    QRLabel18: TQRLabel;
    QRShape23: TQRShape;
    QRBand1: TQRBand;
    QRShape24: TQRShape;
    QRLabel22: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel29: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRL_mark: TQRLabel;
    QRShape38: TQRShape;
    QRShape34: TQRShape;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRShape39: TQRShape;
    QRShape16: TQRShape;
    procedure InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
//    procedure QRBand_HeaderBeforePrint(Sender: TCustomQuickRep;var PrintBand: Boolean);
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm_1: TPrintForm_1;
  DataIn   : Pic10501.TDataIn;
  Fin      : file of Pic10501.TDataIn;
  RecCount : Integer;

implementation
{$R *.DFM}
var
  PageStart: Boolean;

procedure TPrintForm_1.InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  AssignFile(Fin, HomeDir+'\list\pic1050c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  PageStart := False;  
end;

procedure TPrintForm_1.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
end;

procedure TPrintForm_1.InReportNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if not Eof(Fin) then begin
    with DataIn do begin
      QRL_ancode_name.Caption := '';
      QRL_korname.Caption     := '';
      QRL_empno.Caption       := '';
      QRL_bpaycl.Caption      := '';
      QRL_bdeptname.Caption   := '';
      QRL_bpayra_name.Caption := '';
      QRL_anfrdate.Caption    := '';
      QRL_paycl.Caption       := '';
      QRL_deptname.Caption    := '';
      QRL_payra_name.Caption  := '';
      QRL_antodate.Caption    := '';
      QRL_mark.Caption        := '';
      if PageStart = False then Read(Fin, DataIn);
      PageStart := False;
      QRBand_Detail.Enabled := True;
      MoreData := True;
      
      // Flag에 맞는 데이타를 찍는다.
      if (DataIn.Flag = 'F') then begin
        QRL_deptname.Font.Size := 14;
        QRL_deptname.Font.Name := '궁서체';
        QRL_deptname.Height := 20;
        QRL_Mark.Caption := '';
        QRband1.Enabled := True;
      end else begin
        QRL_deptname.Font.Size := 9;
        QRL_deptname.Font.Name := '굴림체';
        QRL_deptname.Height := 12;
        if (DataIn.Flag <> 'N') and (DataIn.Flag <> 'E') then
           QRband1.Enabled := False;
      end;
      if (DataIn.Flag = 'E') then begin
        if not Eof(Fin) then begin
           QRBand_Detail.Enabled := False;
           InReport.NewPage;
           system.exit;
        end;
      end;
      QRL_ancode_name.Caption := ancode_name;
      QRL_korname.Caption     := korname;
      QRL_empno.Caption       := empno;

      QRL_bpaycl.Caption      := bpaycl;
      QRL_bdeptname.Caption   := bdeptname;
      QRL_bpayra_name.Caption := bpayra_name;
      QRL_anfrdate.Caption    := anfrdate;

      QRL_paycl.Caption       := paycl;
      QRL_deptname.Caption    := deptname;
      QRL_payra_name.Caption  := payra_name;
      QRL_antodate.Caption    := antodate;
      QRL_mark.Caption        := mark;
    end;
  end else begin
    MoreData := False;
  end;
end;

procedure TPrintForm_1.QRBand_DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if DataIn.empno = '' then begin
    QRL_BEFORE.Caption := '';
    QRL_AFTER.Caption  := '';
  end else begin
    QRL_BEFORE.Caption := '전';
    QRL_AFTER.Caption  := '후';
  end;
end;

procedure TPrintForm_1.QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not Eof(Fin) then begin
    PageStart := True;
    Read(Fin, DataIn);
    //발령번호
    QRL_annono.Caption  := DataIn.annono;
    //통보일자
    QRL_dispatch.Caption := Copy(MainForm.ME_dispatch.Text,1,4)+'.'+
                            Copy(MainForm.ME_dispatch.Text,5,2)+'.'+
                            Copy(MainForm.ME_dispatch.Text,7,2);

// ----------------------------------------------------------------------------
//    버전   수정일      수정자  관련근거        수정내용
//    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
// ---------------------------------------------------------------------------
//    QRL_DocNum.Caption   := MainForm.sDoc + ' 제 '+ Copy(MainForm.ME_DocNum.Text,1,2) + '-'
//                                          + Copy(MainForm.ME_DocNum.Text,3,4)+' 호';
    QRL_DocNum.Caption   := MainForm.sDoc + ' 제 '+ Copy(MainForm.ME_DocNum.Text,1,4) + '-'
                                          + Copy(MainForm.ME_DocNum.Text,5,4)+' 호';
  end;
end;

end.

