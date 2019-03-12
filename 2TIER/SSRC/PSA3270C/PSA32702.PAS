unit Psa32702;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, ExtCtrls, quickrpt, qrprntr,
  Qrctrls, DBClient, MemDS, DBAccess, Ora, Func, pePrnview;

type
  TFpsa32702 = class(TForm)
    QRTitle: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRdetail: TQRBand;
    QuickReport1: TQuickRep;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRempno: TQRLabel;
    QR3: TQRLabel;
    QRrepfrdate: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRfrom: TQRLabel;
    QRLabel18: TQRLabel;
    QR1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRkorname: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRloandate: TQRLabel;
    QRdate: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRtotalperson: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel23: TQRLabel;
    QRselect: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QR5: TQRLabel;
    QRrepcnt: TQRLabel;
    QRrepmaxmm: TQRLabel;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    QRloanamt: TQRLabel;
    QR2: TQRLabel;
    QR4: TQRLabel;
    QRloanamtsum: TQRLabel;
    QR1sum: TQRLabel;
    QR2sum: TQRLabel;
    QR3sum: TQRLabel;
    QR4sum: TQRLabel;
    QR5sum: TQRLabel;
    OraQuery1: TOraQuery;
    QRSysData2: TQRSysData;
    QRLabel19: TQRLabel;
    procedure QRTitleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRdetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRdetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    GDTotal : Double;
    GDsum : Array[0..6] of Double;
    GDsum0, GDsum1,GDsum2,GDsum3,GDsum4,GDsum5,GDsum6 :Double;
  end;

var
  Fpsa32702: TFpsa32702;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000

implementation

uses Psa32701;
{$R *.DFM}


procedure TFpsa32702.QuickReport1Preview(Sender: TObject);
begin
//  FPsa30704.QRPreview1.QRPrinter := TQRPrinter(Sender);
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

procedure TFpsa32702.QRTitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRfrom.Caption := Copy(FPsa32701.MEfrom.Text, 1, 4) + '.' + Copy(FPsa32701.MEfrom.Text, 5, 2);
  QRdate.Caption := Copy(FPsa32701.GSsysdate, 1, 4) + '.' +
                    Copy(FPsa32701.GSsysdate, 5, 2) + '.' +
                    Copy(FPsa32701.GSsysdate, 7, 2);

  if   FPsa32701.RB1.Checked then QRselect.Caption := '사번/대출일순'
  else                            QRselect.Caption := '대출일/사번순';
end;


procedure TFpsa32702.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i : integer;
begin
  for i := 0 to 6 do
    GDsum[i] := 0;

  //2011.10.07 Hard Coding 0665 만료시 삭제 처리 할것. HeeYong~
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME, A.LOANDATE F_LOANDATE, A.REPFRDATE, MAX(A.LOANAMT) LOANAMT, ');
    Sql.Add('       MAX(C.REPCNT) REPCNT, MAX(A.REPMAXMM) REPMAXMM, SUM(C.REPAMT) REPAMT, SUM(C.REPINT) REPINT, ');
    Sql.Add('       MAX(A.APPDATE) APPDATE, MAX(DECODE(A.EMPNO,''0665'', C.REPAMT, TRUNC(A.LOANAMT / A.REPMAXMM))),  ');
    Sql.Add('       MIN(DECODE(A.EMPNO,''0665'',DECODE(C.REPCNT, 1, A.LOANAMT - C.REPAMT, A.LOANAMT - (150000 + C.REPAMT * (C.REPCNT - 1))), ');
    Sql.Add('             (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT))   ');
    Sql.Add('  FROM PSNLOAN A, PSCMAN B, PSNREPAY C                                                      ');
    Sql.Add(' WHERE C.REPLDATE = '''+FPsa32701.MEfrom.Text+'''                                           ');
    Sql.Add('   AND A.EMPNO    = C.EMPNO                                                                 ');
    Sql.Add('   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                         ');
    Sql.Add(' GROUP BY A.EMPNO, B.KORNAME, A.LOANDATE, A.REPFRDATE                                       ');
    Sql.Add('UNION                                                                                       ');
    Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME, A.LOANDATE F_LOANDATE, A.REPFRDATE, A.LOANAMT,           ');
    Sql.Add('       C.REPCNT, A.REPMAXMM, C.REPAMT, C.REPINT, A.APPDATE, TRUNC(A.LOANAMT / A.REPMAXMM),  ');
    Sql.Add('       (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT           ');
    Sql.Add('  FROM PSELOAN A, PSCMAN B, PSOREPAY C                                                      ');
    Sql.Add(' WHERE C.REPLDATE = '''+FPsa32701.MEfrom.Text+'''                                           ');
    Sql.Add('   AND A.EMPNO    = C.EMPNO                                                                 ');
    Sql.Add('   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                         ');
    if FPsa32701.RB1.Checked then
         Sql.Add('  ORDER BY F_EMPNO ASC, F_LOANDATE ASC                                                 ')
    else
         Sql.Add('  ORDER BY F_LOANDATE ASC, F_EMPNO ASC                                                 ');
    Open;
  end;

  Application.ProcessMessages;
  if OraQuery1.RecordCount <= 0 then
  begin
    FPsa32701.Phelpmsg.Caption := '  해당자료가 없습니다.';
    SendMessage(FPsa32701.Phelpmsg.Handle, WM_Paint , 0, 0);
    Close;
  end;

  with QuickReport1 do
  begin
    PrinterSettings.Copies    := FPsa32701.PrintDialog1.Copies;
    PrinterSettings.FirstPage := FPsa32701.PrintDialog1.FromPage;
    PrinterSettings.LastPage  := FPsa32701.PrintDialog1.ToPage;
  end;
end;

procedure TFpsa32702.QRdetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  QuickReport1.QRPrinter.Progress := 50;
  QRempno.Caption     := OraQuery1.Fields[0].AsString;
  QRkorname.Caption   := OraQuery1.Fields[1].AsString;
  QRloandate.Caption  := Copy(OraQuery1.Fields[2].AsString, 1, 4) + '.' +
                         Copy(OraQuery1.Fields[2].AsString, 5, 2) + '.' +
                         Copy(OraQuery1.Fields[2].AsString, 7, 2);
  QRrepfrdate.Caption := Copy(OraQuery1.Fields[3].AsString, 1, 4) + '.' +
                         Copy(OraQuery1.Fields[3].AsString, 5, 2);
  QRloanamt.Caption   := Format('%11.0n', [OraQuery1.Fields[4].AsFloat]);
  QR1.Caption         := Format('%11.0n', [OraQuery1.Fields[10].AsFloat]);
  QR2.Caption         := Format('%11.0n', [OraQuery1.Fields[7].AsFloat]);
  QR3.Caption         := Format('%11.0n', [OraQuery1.Fields[8].AsFloat]);
  QR4.Caption         := Format('%11.0n', [OraQuery1.Fields[7].AsFloat + OraQuery1.Fields[8].AsFloat]);
  QRrepcnt.Caption    := IntToStr(OraQuery1.Fields[5].AsInteger);
  QRrepmaxmm.Caption  := IntToStr(OraQuery1.Fields[6].AsInteger);
  QR5.Caption         := Format('%11.0n', [OraQuery1.Fields[11].AsFloat]);
end;

procedure TFpsa32702.QRdetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  GDsum[0] := GDsum[0] + 1;
  GDsum[1] := GDsum[1] + OraQuery1.Fields[4].AsFloat;
  GDsum[2] := GDsum[2] + OraQuery1.Fields[10].AsFloat;
  GDsum[3] := GDsum[3] + OraQuery1.Fields[7].AsFloat;
  GDsum[4] := GDsum[4] + OraQuery1.Fields[8].AsFloat;
  GDsum[5] := GDsum[5] + OraQuery1.Fields[7].AsFloat + OraQuery1.Fields[8].AsFloat;
  GDsum[6] := GDsum[6] + OraQuery1.Fields[11].AsFloat;
end;

procedure TFpsa32702.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRtotalperson.Caption := Format( '%5.0n', [GDsum[0]]);
  QRloanamtsum.Caption  := Format('%11.0n', [GDsum[1]]);
  QR1sum.Caption        := Format('%11.0n', [GDsum[2]]);
  QR2sum.Caption        := Format('%11.0n', [GDsum[3]]);
  QR3sum.Caption        := Format('%11.0n', [GDsum[4]]);
  QR4sum.Caption        := Format('%11.0n', [GDsum[5]]);
  QR5sum.Caption        := Format('%11.0n', [GDsum[6]]);
end;

end.
