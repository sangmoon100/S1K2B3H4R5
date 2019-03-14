unit pkc20704;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrep, StdCtrls, ExtCtrls, DB, DBTables, Pkc20701;

type
  TS3_KC2070C = class(TForm)
    Detail: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_Year: TQRLabel;
    QRL_Month: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape30: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape34: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    Qdeptnm: TQRLabel;
    Qempno: TQRLabel;
    Qkorname: TQRLabel;
    QRL_PayRa: TQRLabel;
    QRLabel75: TQRLabel;
    Image1: TImage;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    Qpaycl: TQRLabel;
    Qpaygr: TQRLabel;
    QRLabel4: TQRLabel;
    Qpaybank: TQRLabel;
    QRLabel13: TQRLabel;
    Qpayacnt: TQRLabel;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    Qbasicamt: TQRLabel;
    QRLabel6: TQRLabel;
    Qinfoamt: TQRLabel;
    QRLabel19: TQRLabel;
    Qdutyamt: TQRLabel;
    QRLabel33: TQRLabel;
    Qbonusamt: TQRLabel;
    QRLabel20: TQRLabel;
    Qpromamt: TQRLabel;
    QRLabel21: TQRLabel;
    Qmcaramt: TQRLabel;
    QRLabel22: TQRLabel;
    Qmpcamt: TQRLabel;
    QRShape13: TQRShape;
    QRLabel24: TQRLabel;
    Qliceamt: TQRLabel;
    QRLabel25: TQRLabel;
    Qovtmamt: TQRLabel;
    QRLabel26: TQRLabel;
    Qsptmamt: TQRLabel;
    QRLabel23: TQRLabel;
    Qbokjisupamt: TQRLabel;
    QRLabel27: TQRLabel;
    Qodamt: TQRLabel;
    QRLabel38: TQRLabel;
    Qmbonamt: TQRLabel;
    QRLabel28: TQRLabel;
    Qdrvliceamt: TQRLabel;
    QReport: TQuickReport;
    DataSource1: TDataSource;
    Qry1: TQuery;
    QRShape14: TQRShape;
    QRLabel29: TQRLabel;
    Qlectsupamt: TQRLabel;
    QRLabel30: TQRLabel;
    Qedusupamt: TQRLabel;
    QRLabel31: TQRLabel;
    Qyueduamt: TQRLabel;
    QRLabel32: TQRLabel;
    Qselfeduamt: TQRLabel;
    QRLabel34: TQRLabel;
    Qincentamt: TQRLabel;
    QRLabel35: TQRLabel;
    Qtrainamt: TQRLabel;
    QRLabel36: TQRLabel;
    Qwinteramt: TQRLabel;
    QRShape15: TQRShape;
    QRLabel37: TQRLabel;
    Qsbonamt: TQRLabel;
    QRLabel39: TQRLabel;
    Qybonamt: TQRLabel;
    Qhomesupamt: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel41: TQRLabel;
    Qlongsupamt: TQRLabel;
    QRLabel42: TQRLabel;
    Qpaybon: TQRLabel;
    QRLabel43: TQRLabel;
    Qnotaxpay: TQRLabel;
    QRLabel44: TQRLabel;
    Qaidamt1: TQRLabel;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel45: TQRLabel;
    Qaidamt2: TQRLabel;
    QRLabel46: TQRLabel;
    Qaidamt3: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel14: TQRLabel;
    Qpaysum: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape25: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape26: TQRShape;
    QRLabel104: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel118: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel126: TQRLabel;
    Qintax: TQRLabel;
    Qjutax: TQRLabel;
    Qmedamt: TQRLabel;
    Qanuamt: TQRLabel;
    Qemplamt: TQRLabel;
    Qsauamt: TQRLabel;
    Qnojoamt: TQRLabel;
    Qsaveamt3: TQRLabel;
    Qigamt: TQRLabel;
    Qsangamt: TQRLabel;
    Qsobiamt: TQRLabel;
    Qhsamt: TQRLabel;
    Qfbamt: TQRLabel;
    Qnbamt: TQRLabel;
    Qparkamt: TQRLabel;
    Qedudedamt: TQRLabel;
    Qsacorpamt: TQRLabel;
    Qsabankamt: TQRLabel;
    Qsaveamt1: TQRLabel;
    Qsaveamt2: TQRLabel;
    Qchollamt: TQRLabel;
    Qticketamt: TQRLabel;
    Qbondedamt: TQRLabel;
    Qdedamt1: TQRLabel;
    Qdedamt2: TQRLabel;
    Qdedamt3: TQRLabel;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRLabel48: TQRLabel;
    Qdedsum: TQRLabel;
    QRShape38: TQRShape;
    QRL_PaySum: TQRLabel;
    QRLabel51: TQRLabel;
    QRL_DedSum: TQRLabel;
    Qrealpay: TQRLabel;
    QRShape40: TQRShape;
    QRLabel53: TQRLabel;
    QRShape41: TQRShape;
    QRLabel52: TQRLabel;
    QRShape17: TQRShape;
    QRShape36: TQRShape;
    QRL_Info1: TQRLabel;
    QRL_Info4: TQRLabel;
    QRL_Info5: TQRLabel;
    QRL_Info2: TQRLabel;
    QRL_Info3: TQRLabel;
    QRL_Info6: TQRLabel;
    QRLabel49: TQRLabel;
    QPayHoldAmt: TQRLabel;
    procedure QReportBeforePrint(var PrintReport: Boolean);
    procedure DetailBeforePrint(var PrintBand: Boolean);
  private
    { Private declarations }
    MaxValue : Integer;
    Count    : Integer;
  public
    { Public declarations }
    Procedure MoveTo_Label;
    Procedure Get_Records;
  end;

var
  S3_KC2070C: TS3_KC2070C;

implementation

{$R *.DFM}

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{==============================================================================
          조건에 만족하는 자료를 가져오는 Procedure.
 ==============================================================================}
Procedure TS3_KC2070C.Get_Records;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EMPNO, KORNAME, PAYCL, PAYGR, DEPTNAME,               ' );
     Qry1.Sql.Add( '        PAYBANK, PAYACNT, BASICAMT+BBASICAMT BASICAMT,        ' );
     Qry1.Sql.Add( '        INFOAMT+BINFOAMT INFOAMT, DUTYAMT+BDUTYAMT DUTYAMT,   ' );
     Qry1.Sql.Add( '        PROMAMT, MCARAMT, MATEAMT, PARTAMT, CHILDAMT,         ' );
     Qry1.Sql.Add( '        BOKJISUPAMT, LICEAMT, OVTMAMT, SPTMAMT, ODAMT,        ' );
     Qry1.Sql.Add( '        DRVLICEAMT, LECTSUPAMT, EDUSUPAMT, YUEDUAMT,          ' );
     Qry1.Sql.Add( '        SELFEDUAMT, BONUSAMT, INCENTAMT, TRAINAMT,            ' );
     Qry1.Sql.Add( '        WINTERAMT, SBONAMT, A.MBONAMT, YBONAMT,               ' );
     Qry1.Sql.Add( '        HOMESUPAMT, LONGSUPAMT, SOPAYSUM, SOBONSUM, NOTAXPAY, ' );
     Qry1.Sql.Add( '        AIDAMT1, AIDAMT2, AIDAMT3, PAYSUM, INTAX,             ' );
     Qry1.Sql.Add( '        JUTAX, MEDDAMT, ANUDAMT, EMPLDAMT, SAUAMT,            ' );
     Qry1.Sql.Add( '        NOJOAMT, SAVEAMT3, IGAMT, SANGAMT, SOBIAMT,           ' );
     Qry1.Sql.Add( '        HSAMT, FBAMT, NBAMT, PARKAMT, EDUDEDAMT,              ' );
     Qry1.Sql.Add( '        SACORPAMT, SABANKAMT, SAVEAMT1, SAVEAMT2,             ' );
     Qry1.Sql.Add( '        CHOLLAMT, TICKETAMT, BONDEDAMT, DEDAMT1, PAYHOLDAMT,  ' );
     Qry1.Sql.Add( '        DEDAMT2, DEDAMT3, DEDSUM, REALPAY, PAYRA, A.PAYDATE,  ' );
     Qry1.Sql.Add( '        INFO1, INFO2, INFO3, INFO4, INFO5, INFO6              ' );
     Qry1.Sql.Add( ' FROM   PKMPCALC A, PKHPINFO B, PYCDEPT C                     ' );
     Qry1.Sql.Add( ' WHERE (EMPNO  >= :frempno AND EMPNO <= :toempno) AND         ' );
     Qry1.Sql.Add( '       (A.PAYDATE = :paydate AND A.PAYDATE = B.PAYDATE(+)) AND  ' );
     Qry1.Sql.Add( '       (A.ORGNUM >= :frorgnum AND A.ORGNUM <= :toorgnum ) AND     ' );
     Qry1.Sql.Add( '       (A.DEPTCODE >= :frdeptcode AND                           ' );
     Qry1.Sql.Add( '        A.DEPTCODE <= :todeptcode ) AND                         ' );
     Qry1.Sql.Add( '       (A.ORGNUM = C.ORGNUM(+) AND A.DEPTCODE = C.DEPTCODE(+))  ' );
     if M_KC2070c.RB_Order1.Checked then
        Qry1.Sql.Add( ' ORDER BY A.ORGNUM, A.DEPTCODE, PAYCL, PAYRA, EMPNO ' )
     else
        Qry1.Sql.Add( ' ORDER BY EMPNO ' );
     Qry1.ParamByName('frempno').AsString    := M_KC2070C.E_FrEmpNo.Text;
     Qry1.ParamByName('toempno').AsString    := M_KC2070C.E_ToEmpNo.Text;
     Qry1.ParamByName('paydate').AsString    := M_KC2070C.PayMM;
     Qry1.ParamByName('frorgnum').AsString   := M_KC2070C.ME_FrOrgNum.Text;
     Qry1.ParamByName('toorgnum').AsString   := M_KC2070C.ME_ToOrgNum.Text;
     Qry1.ParamByName('frdeptcode').AsString := M_KC2070C.ME_FrDeptCode.Text;
     Qry1.ParamByName('todeptcode').AsString := M_KC2070C.ME_ToDeptCode.Text;
     Qry1.Open;
end;

{==============================================================================
         Data를 Label로 옮겨주는 Procedure.
 ==============================================================================}
Procedure TS3_KC2070C.MoveTo_Label;
begin
     QRL_Year.Caption    := Copy(Qry1.FieldByName('PayDate').AsString,1,4);
     QRL_Month.Caption   := Copy(Qry1.FieldByName('PayDate').AsString,5,2);

     Qempno.Caption    := Qry1.FieldByName('Empno').AsString;
     Qkorname.Caption  := Qry1.FieldByName('Korname').AsString;
     Qdeptnm.Caption   := Qry1.FieldByName('DeptName').AsString;
     QRL_PayRa.Caption := M_KC2070C.Get_CodeName(M_KC2070C.CI113,Qry1.FieldByName('PayRa').AsString);
     Qpaycl.Caption    := M_KC2070C.Get_CodeName(M_KC2070C.CI112,Qry1.FieldByName('Paycl').AsString);
     Qpaygr.Caption    := Qry1.FieldByName('Paygr').AsString;
     Qpaybank.Caption  := M_KC2070C.Get_CodeName(M_KC2070C.CK910,Qry1.FieldByName('PayBank').AsString);
     Qpayacnt.Caption  := Qry1.FieldByName('Payacnt').AsString;
     Qbasicamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('basicamt').AsFloat);
     Qinfoamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('infoamt').AsFloat);
     Qdutyamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('dutyamt').AsFloat);
     Qpromamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('promamt').AsFloat);
     Qmcaramt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('mcaramt').AsFloat);
     Qmpcamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('mateamt').AsFloat +
                                               Qry1.FieldByName('partamt').AsFloat +
                                               Qry1.FieldByName('childamt').AsFloat);
     Qbokjisupamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('bokjisupamt').AsFloat);
     Qliceamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('liceamt').AsFloat);
     Qovtmamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('ovtmamt').AsFloat);
     Qsptmamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('sptmamt').AsFloat);
     Qodamt.Caption       := FormatFloat('#,##0', Qry1.FieldByName('odamt').AsFloat);
     Qdrvliceamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('drvliceamt').AsFloat);
     Qlectsupamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('lectsupamt').AsFloat);
     Qedusupamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('edusupamt').AsFloat);
     Qyueduamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('yueduamt').AsFloat);
     Qselfeduamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('selfeduamt').AsFloat);
     Qbonusamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('bonusamt').AsFloat);
     Qincentamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('incentamt').AsFloat);
     Qtrainamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('trainamt').AsFloat);
     Qwinteramt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('winteramt').AsFloat);
     Qsbonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('sbonamt').AsFloat);
     Qmbonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('mbonamt').AsFloat);
     Qybonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('ybonamt').AsFloat);
     Qhomesupamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('homesupamt').AsFloat);
     Qlongsupamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('longsupamt').AsFloat);
     Qpaybon.Caption      := FormatFloat('#,##0', Qry1.FieldByName('sopaysum').AsFloat +
                                                  Qry1.FieldByName('sobonsum').AsFloat);
     Qnotaxpay.Caption    := FormatFloat('#,##0', Qry1.FieldByName('notaxpay').AsFloat);
     Qaidamt1.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt1').AsFloat);
     Qaidamt2.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt2').AsFloat);
     Qaidamt3.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt3').AsFloat);
     Qpaysum.Caption      := FormatFloat('#,##0', Qry1.FieldByName('paysum').AsFloat);

     //.....지 급 내 역......상단....//

     Qintax.Caption     := FormatFloat('#,##0', Qry1.FieldByName('intax').AsFloat);
     Qjutax.Caption     := FormatFloat('#,##0', Qry1.FieldByName('jutax').AsFloat);
     Qmedamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('meddamt').AsFloat);
     Qanuamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('anudamt').AsFloat);
     Qemplamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('empldamt').AsFloat);
     Qsauamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('sauamt').AsFloat);
     Qnojoamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('nojoamt').AsFloat);
     Qsaveamt3.Caption  := FormatFloat('#,##0', Qry1.FieldByName('saveamt3').AsFloat);
     Qigamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('igamt').AsFloat);
     QSangamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('Sangamt').AsFloat);
     Qsobiamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('sobiamt').AsFloat);
     Qhsamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('hsamt').AsFloat);
     Qfbamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('fbamt').AsFloat);
     Qnbamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('nbamt').AsFloat);
     Qparkamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('parkamt').AsFloat);
     Qedudedamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('edudedamt').AsFloat);
     Qsacorpamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('sacorpamt').AsFloat);
     Qsabankamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('sabankamt').AsFloat);
     Qsaveamt1.Caption  := FormatFloat('#,##0', Qry1.FieldByName('saveamt1').AsFloat);
     Qsaveamt2.Caption  := FormatFloat('#,##0', Qry1.FieldByName('saveamt2').AsFloat);
     Qchollamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('chollamt').AsFloat);
     Qticketamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('ticketamt').AsFloat);
     Qbondedamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('bondedamt').AsFloat);
     Qdedamt1.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt1').AsFloat);
     Qdedamt2.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt2').AsFloat);
     Qdedamt3.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt3').AsFloat);
     QPayHoldAmt.Caption:= FormatFloat('#,##0', Qry1.FieldByName('PayHoldAmt').AsFloat);
     Qdedsum.Caption    := FormatFloat('#,##0', Qry1.FieldByName('dedsum').AsFloat);
     Qrealpay.Caption   := FormatFloat('#,##0', Qry1.FieldByName('Realpay').AsFloat);
     QRL_PaySum.Caption := FormatFloat('#,##0', Qry1.FieldByName('PaySum').AsFloat);
     QRL_DedSum.Caption := FormatFloat('#,##0', Qry1.FieldByName('DedSum').AsFloat);

     QRL_Info1.Caption := Qry1.FieldByName('Info1').AsString;
     QRL_Info2.Caption := Qry1.FieldByName('Info2').AsString;
     QRL_Info3.Caption := Qry1.FieldByName('Info3').AsString;
     QRL_Info4.Caption := Qry1.FieldByName('Info4').AsString;
     QRL_Info5.Caption := Qry1.FieldByName('Info5').AsString;
     QRL_Info6.Caption := Qry1.FieldByName('Info6').AsString;

     Count              := Count + 1;
end;

{ ==============================================================================
  ===================       Event Handlers      ================================
  ============================================================================== }

procedure TS3_KC2070C.QReportBeforePrint(var PrintReport: Boolean);
begin
     Get_Records;
     MaxValue := Qry1.RecordCount;
     Count    := 0;
end;

procedure TS3_KC2070C.DetailBeforePrint(var PrintBand: Boolean);
begin
     MoveTo_Label;
     M_KC2070C.P_Help.Caption := '   ' + IntToStr(Count) + ' / ' + IntToStr(MaxValue) +
                                 ' 건에 대해 출력준비 중...';
     Application.ProcessMessages;
end;


end.




