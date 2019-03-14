unit pkc20707;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, ExtCtrls, DB, DBTables, Qrctrls, qrprntr, Qrextra, peprnview;

type
  TSReportF2 = class(TForm)
    QReport: TQuickRep;
    QRBand1: TQRBand;
    Qdrvliceamt: TQRLabel;
    Qodamt: TQRLabel;
    Qbokjisupamt: TQRLabel;
    Qsptmamt: TQRLabel;
    Qovtmamt: TQRLabel;
    Qliceamt: TQRLabel;
    Qmpcamt: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    Qselfeduamt: TQRLabel;
    Qyueduamt: TQRLabel;
    Qedusupamt: TQRLabel;
    Qlectsupamt: TQRLabel;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    Qybonamt: TQRLabel;
    Qlongsupamt: TQRLabel;
    Qpaybon: TQRLabel;
    Qaidamt1: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape16: TQRShape;
    Qaidamt3: TQRLabel;
    Qaidamt2: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape41: TQRShape;
    QRLabel15: TQRLabel;
    Qintax: TQRLabel;
    Qjutax: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    Qmedamt: TQRLabel;
    Qanuamt: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel84: TQRLabel;
    Qemplamt: TQRLabel;
    Qsauamt: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRLabel88: TQRLabel;
    Qsaveamt3: TQRLabel;
    Qigamt: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    Qsangamt: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel96: TQRLabel;
    Qhsamt: TQRLabel;
    Qfbamt: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel116: TQRLabel;
    Qchollamt: TQRLabel;
    Qsabankamt: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel108: TQRLabel;
    Qsacorpamt: TQRLabel;
    Qedudedamt: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel104: TQRLabel;
    Qparkamt: TQRLabel;
    QRShape23: TQRShape;
    QRLabel118: TQRLabel;
    Qticketamt: TQRLabel;
    QRShape27: TQRShape;
    QRLabel120: TQRLabel;
    Qbondedamt: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel124: TQRLabel;
    Qdedamt2: TQRLabel;
    Qdedamt1: TQRLabel;
    Qrealpay: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape38: TQRShape;
    QRLabel53: TQRLabel;
    QRL_Info1: TQRLabel;
    QRL_Info2: TQRLabel;
    QRL_Info3: TQRLabel;
{===============================================================================
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
   30.02      1999.01.21         송두호        인사재개발       컴포넌트삭제
================================================================================}
//삭제
{    QRL_Info6: TQRLabel;
    QRL_Info5: TQRLabel;
    QRL_Info4: TQRLabel;
}
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape40: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    Qmbonamt: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel21: TQRLabel;
    Qmcaramt: TQRLabel;
    QRLroleamt: TQRLabel;
    Qroleamt: TQRLabel;
    Qholipay: TQRLabel;
    QRLholipay: TQRLabel;
    QRLquaterpay: TQRLabel;
    QRLfixpay: TQRLabel;
    Qfixpay: TQRLabel;
    Qquaterpay: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    Qpaycl: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    Qpaybank: TQRLabel;
    QRLabel52: TQRLabel;
    Qpayacnt: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRLabel75: TQRLabel;
    Qdeptnm: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    QRLabel9: TQRLabel;
    QRL_PayRa: TQRLabel;
    QRLabel11: TQRLabel;
    Qkorname: TQRLabel;
    QRLabel47: TQRLabel;
    Qempno: TQRLabel;
    QRL_Year: TQRLabel;
    QRLabel1: TQRLabel;
    QRL_Month: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRShape25: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel43: TQRLabel;
    Qnotaxpay: TQRLabel;
    QRShape20: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape19: TQRShape;
    QRShape35: TQRShape;
    Qpaysum: TQRLabel;
    QRShape17: TQRShape;
    Qdedsum: TQRLabel;
    QRShape32: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel40: TQRLabel;
    Qchildeduamt: TQRLabel;
    qovmcamt: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    qmedsupamt: TQRLabel;
    Qpayholdamt: TQRLabel;
    QRLabel54: TQRLabel;
    Qtrainsupamt: TQRLabel;
    QRLabel58: TQRLabel;
    QovmcDed: TQRLabel;
    QRLabel57: TQRLabel;
    Qtaxpay: TQRLabel;
    QRLabel37: TQRLabel;
    Qsbonamt: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Qdedamt3: TQRLabel;
    QRLabel35: TQRLabel;
    Qdedamt5: TQRLabel;
    QRLabel10: TQRLabel;
    QMEDPAYDEDAMT: TQRLabel;
    QRLbonusamt: TQRLabel;
    QRLincentamt: TQRLabel;
    QRLtrainamt: TQRLabel;
    QRLwinteramt: TQRLabel;
    QRLhomesupamt: TQRLabel;
    Qbonusamt: TQRLabel;
    Qincentamt: TQRLabel;
    Qtrainamt: TQRLabel;
    Qwinteramt: TQRLabel;
    Qhomesupamt: TQRLabel;
    Qry1: TQuery;
    QRLabel6: TQRLabel;
    Qdedamt4: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    Qnojoamt: TQRLabel;
    QRLabel36: TQRLabel;
    Qitamt: TQRLabel;
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QReportPreview(Sender: TObject);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
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
  SReportF2: TSReportF2;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000

implementation

{$R *.DFM}

uses
   pkc20703, pkc20701 ;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{==============================================================================
          조건에 만족하는 자료를 가져오는 Procedure.
 ==============================================================================}
Procedure TSReportF2.Get_Records;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EMPNO, KORNAME, PAYCL, PAYGR, A.PAYRA, A.ORGNUM, A.DEPTCODE,' );
     Qry1.Sql.Add( '        DEPTNAME,   ' );
     Qry1.Sql.Add( '        PAYBANK, PAYACNT, BASICAMT+BBASICAMT BASICAMT,        ' );
     Qry1.Sql.Add( '        INFOAMT+BINFOAMT INFOAMT, DUTYAMT+BDUTYAMT DUTYAMT,   ' );
     Qry1.Sql.Add( '        PROMAMT, MCARAMT, MATEAMT, PARTAMT, CHILDAMT,         ' );
     Qry1.Sql.Add( '        BOKJISUPAMT, LICEAMT, OVTMAMT, SPTMAMT, ODAMT,        ' );
     Qry1.Sql.Add( '        DRVLICEAMT, LECTSUPAMT, EDUSUPAMT, YUEDUAMT,          ' );
     Qry1.Sql.Add( '        SELFEDUAMT, BONUSAMT, INCENTAMT, TRAINAMT,            ' );
     Qry1.Sql.Add( '        WINTERAMT, SBONAMT, A.MBONAMT, YBONAMT,               ' );
     Qry1.Sql.Add( '        HOMESUPAMT, LONGSUPAMT, SOPAYSUM, SOBONSUM, NOTAXPAY, ' );
     Qry1.Sql.Add( '        TAXPAY,AIDAMT1, AIDAMT2, AIDAMT3, PAYSUM, INTAX,             ' );
     Qry1.Sql.Add( '        JUTAX, MEDDAMT, ANUDAMT, EMPLDAMT, SAUAMT,            ' );
     Qry1.Sql.Add( '        NOJOAMT, SAVEAMT3, IGAMT, SANGAMT, SOBIAMT,           ' );
     Qry1.Sql.Add( '        HSAMT, FBAMT, NBAMT, PARKAMT, EDUDEDAMT,              ' );
     Qry1.Sql.Add( '        SACORPAMT, SABANKAMT, SAVEAMT1, SAVEAMT2,             ' );
     Qry1.Sql.Add( '        CHOLLAMT, TICKETAMT, BONDEDAMT, DEDAMT1, PAYHOLDAMT,  ' );
     Qry1.Sql.Add( '        DEDAMT2, DEDAMT3, dedamt4, dedamt5, DEDSUM, REALPAY, PAYRA, A.PAYDATE,  ' );
     // leerk 9801 add item  자녀학자금, 야근식대, 의료비가불금, 의료비가불공제금
     Qry1.Sql.Add( '        CHILDEDUAMT, OVMCAMT, medsupamt,MEDPAYAMT,MEDDEDAMT,MEDPAYDEDAMT,  ' );
     // leerk 980903 add item  체육활동지원금,석식대공제금
          Qry1.Sql.Add( '        TRAINSUPAMT, OVMCDED, A.NOJOAMT,  ' );   //parksh 20030619 NOJOAMT(노조회비)추가
     Qry1.Sql.Add( '        FIXPAY, QUATERPAY, HOLIPAY, ROLEAMT,        ' );
     Qry1.Sql.Add( '        INFO1, INFO2, INFO3, INFO4, INFO5, INFO6, ITAMT       ' ); //정보통신수당ITAMT 추가 DSA2000 2005.01.
     Qry1.Sql.Add( ' FROM   PYCDEPT C, PKMPCALC A, PKHPINFO B                     ' );
     Qry1.Sql.Add( ' WHERE (EMPNO  >= :frempno AND EMPNO <= :toempno) AND         ' );
     Qry1.Sql.Add( '       (A.PAYDATE = :paydate AND A.PAYDATE = B.PAYDATE(+) ) AND  ' );
     Qry1.Sql.Add( '       (A.ORGNUM >= :frorgnum AND A.ORGNUM <= :toorgnum ) AND     ' );
     Qry1.Sql.Add( '       (A.DEPTCODE >= :frdeptcode AND                           ' );
     Qry1.Sql.Add( '        A.DEPTCODE <= :todeptcode )                             ' );
     Qry1.Sql.Add( '        AND A.ORGNUM = C.ORGNUM                            ' );
     Qry1.Sql.Add( '        AND A.DEPTCODE = C.DEPTCODE                          ' );          
     if M_KC2070c.RB_Order1.Checked then
        Qry1.Sql.Add( ' ORDER BY ORGNUM, DEPTCODE, PAYCL, A.PAYRA, EMPNO ' )
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
Procedure TSReportF2.MoveTo_Label;
var
  sTempDept : String ;
begin
     QRL_Year.Caption    := Copy(Qry1.FieldByName('PayDate').AsString,1,4);
     QRL_Month.Caption   := Copy(Qry1.FieldByName('PayDate').AsString,5,2);

     Qempno.Caption    := Qry1.FieldByName('Empno').AsString;
     Qkorname.Caption  := Qry1.FieldByName('Korname').AsString;
     Qdeptnm.Caption   := Qry1.FieldByName('deptname').AsString;


//     QRL_PayRa.CapTion := M_KC2070C.Get_CodeName(M_KC2070C.CI113,Qry1.FieldByName('PayRa').AsString);
     QRL_PayRa.CapTion := M_KC2070C.Get_CodeName('I113',Qry1.FieldByName('PayRa').AsString);
     Qpaycl.Caption    :='';
     //Qpaygr.Caption    :='';
     //*임원은 급호를 안 보여줌*/
     if Qry1.FieldByName('Paycl').AsString <> '000' then
     begin
          Qpaycl.Caption    :=
//              M_KC2070C.Get_CodeName(M_KC2070C.CI112,Qry1.FieldByName('Paycl').AsString);
              M_KC2070C.Get_CodeName('I112',Qry1.FieldByName('Paycl').AsString);
     end;
     Qpaybank.Caption  := M_KC2070C.Get_CodeName('K910',Qry1.FieldByName('PayBank').AsString);
//     Qpaybank.Caption  := M_KC2070C.Get_CodeName(M_KC2070C.CK910,Qry1.FieldByName('PayBank').AsString);
     Qpayacnt.Caption  := Qry1.FieldByName('Payacnt').AsString;
     Qdeptnm.Caption   := Qry1.FieldByName('deptname').AsString;

{===============================================================================
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
    35.00       2001.02.20        유효성          임원 연봉제 실시에 따른 출력물 변경
================================================================================}
//     if (Qry1.FieldByName('paycl').AsString < '09') or (Qry1.FieldByName('payra').AsString = '2B') then  //임원이거나 'P064'
//        begin
//        Qdeptnm.Caption       := '하나로통신(주)';
//        QRLfixpay.Caption     := '기본급';
//        Qfixpay.Caption       := FormatFloat('#,##0',Qry1.FieldByName('basicamt').AsFloat);
//        QRLquaterpay.caption  := '정보통신수당';
//        Qquaterpay.Caption    := FormatFloat('#,##0',Qry1.FieldByName('infoamt').AsFloat);
//        QRLholipay.caption    := '직무수당';
//        Qholipay.Caption      := FormatFloat('#,##0',Qry1.FieldByName('dutyamt').AsFloat);
//        QRLroleamt.caption    := '업무추진비';
//        Qroleamt.Caption      := FormatFloat('#,##0',Qry1.FieldByName('promamt').AsFloat);
//        QRLbonusamt.Visible   := True;
//        Qbonusamt.visible     := True;
//        Qbonusamt.caption     := FormatFloat('#,##0',Qry1.FieldByName('bonusamt').AsFloat);
//        QRLincentamt.Visible  := True;
//        Qincentamt.visible    := True;
//        Qincentamt.caption    := FormatFloat('#,##0',Qry1.FieldByName('incentamt').AsFloat);
//        QRLtrainamt.Visible   := True;
//        Qtrainamt.visible     := True;
//        Qtrainamt.caption     := FormatFloat('#,##0',Qry1.FieldByName('trainamt').AsFloat);
//        QRLhomesupamt.Visible := True;
//        Qhomesupamt.visible   := True;
//        Qhomesupamt.caption   := FormatFloat('#,##0',Qry1.FieldByName('homesupamt').AsFloat);
//        end
//     else
//        begin
        QRLfixpay.Caption     := '월정연봉';
        Qfixpay.Caption       := FormatFloat('#,##0',Qry1.FieldByName('fixpay').AsFloat);
        QRLquaterpay.caption  := '분기연봉';
        Qquaterpay.Caption    := FormatFloat('#,##0',Qry1.FieldByName('quaterpay').AsFloat);
        QRLholipay.caption    := '명절연봉';
        Qholipay.Caption      := FormatFloat('#,##0',Qry1.FieldByName('holipay').AsFloat);
        QRLroleamt.caption    := '직책수당';
        Qroleamt.Caption      := FormatFloat('#,##0',Qry1.FieldByName('roleamt').AsFloat);
        QRLbonusamt.Enabled   := False;
        Qbonusamt.Enabled     := False;
        Qbonusamt.caption     := FormatFloat('#,##0',Qry1.FieldByName('bonusamt').AsFloat);
        QRLincentamt.Enabled  := False;
        Qincentamt.Enabled    := False;
        Qincentamt.caption    := FormatFloat('#,##0',Qry1.FieldByName('incentamt').AsFloat);
        QRLtrainamt.Enabled   := False;
        Qtrainamt.Enabled     := False;
        Qtrainamt.caption     := FormatFloat('#,##0',Qry1.FieldByName('trainamt').AsFloat);
        QRLhomesupamt.Enabled := False;
        Qhomesupamt.Enabled   := False;
        Qhomesupamt.caption   := FormatFloat('#,##0',Qry1.FieldByName('homesupamt').AsFloat);
//        end;

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

     Qsbonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('sbonamt').AsFloat);
     Qmbonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('mbonamt').AsFloat);
     Qybonamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('ybonamt').AsFloat);

     Qlongsupamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('longsupamt').AsFloat);
     Qpaybon.Caption      := FormatFloat('#,##0', Qry1.FieldByName('sopaysum').AsFloat +
                                                  Qry1.FieldByName('sobonsum').AsFloat);
     Qnotaxpay.Caption    := FormatFloat('#,##0', Qry1.FieldByName('notaxpay').AsFloat);
     Qtaxpay.Caption    := FormatFloat('#,##0', Qry1.FieldByName('taxpay').AsFloat);
     Qaidamt1.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt1').AsFloat);
     Qaidamt2.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt2').AsFloat);
     Qaidamt3.Caption     := FormatFloat('#,##0', Qry1.FieldByName('aidamt3').AsFloat);
     Qpaysum.Caption      := FormatFloat('#,##0', Qry1.FieldByName('paysum').AsFloat);

     Qwinteramt.caption    := FormatFloat('#,##0',Qry1.FieldByName('winteramt').AsFloat);
     //.....지 급 내 역......상단....//

     Qintax.Caption     := FormatFloat('#,##0', Qry1.FieldByName('intax').AsFloat);
     Qjutax.Caption     := FormatFloat('#,##0', Qry1.FieldByName('jutax').AsFloat);
     Qmedamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('meddamt').AsFloat);
     Qanuamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('anudamt').AsFloat);
     Qemplamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('empldamt').AsFloat);
     Qsauamt.Caption    := FormatFloat('#,##0', Qry1.FieldByName('sauamt').AsFloat);
     Qsaveamt3.Caption  := FormatFloat('#,##0', Qry1.FieldByName('saveamt3').AsFloat);
     Qigamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('igamt').AsFloat);
     QSangamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('Sangamt').AsFloat);
     Qhsamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('hsamt').AsFloat);
//2001.2.20. 외환복지대출금 삭제 -->인사팀 요청
//     Qfbamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('fbamt').AsFloat);
     Qparkamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('parkamt').AsFloat);
     Qedudedamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('edudedamt').AsFloat);
     Qsacorpamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('sacorpamt').AsFloat);
     Qsabankamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('sabankamt').AsFloat);
     Qchollamt.Caption  := FormatFloat('#,##0', Qry1.FieldByName('chollamt').AsFloat);
     Qticketamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('ticketamt').AsFloat);
     Qbondedamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('bondedamt').AsFloat);
     Qdedamt1.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt1').AsFloat);
     Qdedamt2.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt2').AsFloat);
     Qdedamt3.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt3').AsFloat);
     //2000.1.23. 기타공제4 추가
     Qdedamt4.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt4').AsFloat);
     Qdedamt5.Caption   := FormatFloat('#,##0', Qry1.FieldByName('dedamt5').AsFloat);

     QPayHoldAmt.Caption:= FormatFloat('#,##0', Qry1.FieldByName('PayHoldAmt').AsFloat);
     Qdedsum.Caption    := FormatFloat('#,##0', Qry1.FieldByName('dedsum').AsFloat);
     Qrealpay.Caption   := FormatFloat('#,##0', Qry1.FieldByName('Realpay').AsFloat);

     //parksh 20030619 NOJOAMT(노조회비)추가
     Qnojoamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('nojoamt').AsFloat);
     // leerk 9801     add item
      //지급
     Qchildeduamt.Caption := FormatFloat('#,##0', Qry1.FieldByName('childeduamt').AsFloat);
     Qovmcamt.Caption     := FormatFloat('#,##0', Qry1.FieldByName('ovmcamt').AsFloat);
     Qmedsupamt.Caption   := FormatFloat('#,##0', Qry1.FieldByName('medsupamt').AsFloat);
      //공제
     // leerk 980903     add item
     QTrainSupAmt.Caption := FormatFloat('#,##0', Qry1.FieldByName('TrainSupAmt').AsFloat);
// 2001.2.20. 동작식대 삭제 -->인사팀 요청     
//     QOvmcDed.Caption     := FormatFloat('#,##0', Qry1.FieldByName('OvmcDed').AsFloat);
     QMEDPAYDEDAMT.Caption := FormatFloat('#,##0', Qry1.FieldByName('MEDDEDAMT').AsFloat);
     // end of add item


     //공지사항
     QRL_Info1.Caption := Qry1.FieldByName('Info1').AsString;
     QRL_Info2.Caption := Qry1.FieldByName('Info2').AsString;
     QRL_Info3.Caption := Qry1.FieldByName('Info3').AsString;

     QITAmt.Caption:= FormatFloat('#,##0', Qry1.FieldByName('ITAmt').AsFloat); //dsa2000  2005.01.11.정보통신수당 신설,

     Count              := Count + 1;
end;

 {==============================================================================
  ===================       Event Handlers      ================================
  ============================================================================== }


procedure TSReportF2.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{    if Count < Maxvalue then Begin
       MoveTo_Label;
       Application.ProcessMessages;
       PreviewForm.show;
     End;
     }
   if Count < Maxvalue then Begin
       MoveTo_Label;
       Application.ProcessMessages;
       //PreviewForm.show;
     End;

end;

procedure TSReportF2.QReportPreview(Sender: TObject);
begin
//     PreviewForm.QRPreview.Qrprinter := TQRPrinter(sender);
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
   Fm_PreviewForm.Show;
end;

procedure TSReportF2.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   if Count = Maxvalue then Begin
      Fm_PreviewForm.Show;  // PreviewForm.show;
     End;
end;

procedure TSReportF2.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     Get_Records;
     MaxValue := Qry1.RecordCount ;
     Count    := 0;

end;

end.


comment on column pkmpmas.ovmcded is '동작식대';
comment on column pkmpmas.lectsupamt1 is '사내강사료1';
comment on column pkmpmas.lectsupamt2 is '사내강사료2';

comment on column pkmpcalc.ovmcded is '동작식대';
comment on column pkmpcalc.lectsupamt1 is '사내강사료1';
comment on column pkmpcalc.lectsupamt2 is '사내강사료2';

comment on column pkmpcald.ovmcded is '동작식대';
comment on column pkmpcald.lectsupamt1 is '사내강사료1';
comment on column pkmpcald.lectsupamt2 is '사내강사료2';

comment on column pkhphis.ovmcded is '동작식대';
comment on column pkhphis.lectsupamt1 is '사내강사료1';
comment on column pkhphis.lectsupamt2 is '사내강사료2';





