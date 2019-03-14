unit Pkc30405;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, ExtCtrls, DB, DBTables, Qrctrls, qrprntr, Qrextra, peprnview,
  Menus, Func ;

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
    QRLabel_d6: TQRLabel;
    QRLabel_d7: TQRLabel;
    QRLabel_d8: TQRLabel;
    Qselfeduamt: TQRLabel;
    Qyueduamt: TQRLabel;
    Qedusupamt: TQRLabel;
    Qlectsupamt: TQRLabel;
    QRShape14: TQRShape;
    QRLabel37: TQRLabel;
    QRShape11: TQRShape;
    Qsbonamt: TQRLabel;
    Qybonamt: TQRLabel;
    Qlongsupamt: TQRLabel;
    Qpaybon: TQRLabel;
    Qaidamt1: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel_d9: TQRLabel;
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
    QRLabel_n4: TQRLabel;
    QRLabel_d4: TQRLabel;
    QRLabel_d3: TQRLabel;
    QRLabel_d2: TQRLabel;
    QRLabel_d1: TQRLabel;
    Qbasicamt: TQRLabel;
    Qinfoamt: TQRLabel;
    Qdutyamt: TQRLabel;
    Qpromamt: TQRLabel;
    Qbonusamt: TQRLabel;
    Qincentamt: TQRLabel;
    Qtrainamt: TQRLabel;
    Qwinteramt: TQRLabel;
    Qhomesupamt: TQRLabel;
    Qfixpay: TQRLabel;
    Qquaterpay: TQRLabel;
    Qholipay: TQRLabel;
    Qroleamt: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRL_payclnm: TQRLabel;
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
    QRL_payranm: TQRLabel;
    QRL_PayRa: TQRLabel;
    QRLabel11: TQRLabel;
    Qkorname: TQRLabel;
    QRLabel47: TQRLabel;
    Qempno: TQRLabel;
    QRL_Year: TQRLabel;
    QRLabel1: TQRLabel;
    QRL_Month: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
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
    QRL_PaySum: TQRLabel;
    QRShape17: TQRShape;
    QRL_DedSum: TQRLabel;
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
    QRLabel_n1: TQRLabel;
    QRLabel_n2: TQRLabel;
    QRLabel_n3: TQRLabel;
    QRLabel_d5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    Qdedamt5: TQRLabel;
    Qdedamt3: TQRLabel;
    QRLabel4: TQRLabel;
    QMEDPAYDEDAMT: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    Qdedamt4: TQRLabel;
    QRLabel33: TQRLabel;
    Qitamt: TQRLabel;
    QRLabel34: TQRLabel;
    Qnbamt: TQRLabel;
    MainMenu1: TMainMenu;
    QRLabel8: TQRLabel;
    Qsabankcp: TQRLabel;
    QRLabel35: TQRLabel;
    Qsacorpcp: TQRLabel;
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
 
    procedure QReportPreview(Sender: TObject);
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
    procedure fzDisplayOldNew(iWhatType: Integer);

  end;

var
  SReportF2: TSReportF2;
  Fm_PreviewForm: TFm_PreviewForm; //변수선언  dsa2000

implementation

{$R *.DFM}

uses
   pkc30401, pkc30402;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{==============================================================================
          조건에 만족하는 자료를 가져오는 Procedure.
 ==============================================================================}
Procedure TSReportF2.Get_Records;
begin
     with DM1.QRY1 do
     begin
          Close;
          Sql.Clear;
          SQL.Add('select empno,                                       ');
          SQL.Add('       korname,                                     ');
          SQL.Add('       paycl,                                       ');
          SQL.Add('       paygr,                                       ');
          SQL.Add('       payacnt,                                     ');
          SQL.Add('       a.paydate,                                   ');
          SQL.Add('       (select deptname from pycdept                ');
          SQL.Add('         where orgnum   = a.orgnum                  ');
          SQL.Add('           and deptcode = a.deptcode) deptname,     ');
          SQL.Add('       paybank,                                     ');
          SQL.Add('       (basicamt+bbasicamt) basicamt,               ');
          SQL.Add('       (infoamt+binfoamt) infoamt,                  ');
          SQL.Add('       (dutyamt+bdutyamt) dutyamt,                  ');
          SQL.Add('       promamt,                                     ');
          SQL.Add('       mcaramt,                                     ');
          SQL.Add('       mateamt,                                     ');
          SQL.Add('       partamt,                                     ');
          SQL.Add('       childamt,                                    ');
          SQL.Add('       bokjisupamt,                                 ');
          SQL.Add('       liceamt,                                     ');
          SQL.Add('       ovtmamt,                                     ');
          SQL.Add('       sptmamt,                                     ');
          SQL.Add('       odamt,                                       ');
          SQL.Add('       drvliceamt,                                  ');
          SQL.Add('       lectsupamt,                                  ');
          SQL.Add('       edusupamt,                                   ');
          SQL.Add('       yueduamt,                                    ');
          SQL.Add('       selfeduamt,                                  ');
          SQL.Add('       bonusamt,                                    ');
          SQL.Add('       incentamt,                                   ');
          SQL.Add('       trainamt,                                    ');
          SQL.Add('       winteramt,                                   ');
          SQL.Add('       sbonamt,                                     ');
          SQL.Add('       mbonamt,                                     ');
          SQL.Add('       ybonamt,                                     ');
          SQL.Add('       homesupamt,                                  ');
          SQL.Add('       longsupamt,                                  ');
          SQL.Add('       sopaysum,                                    ');
          SQL.Add('       sobonsum,                                    ');
          SQL.Add('       medsupamt,                                   ');
          SQL.Add('       aidamt1,                                     ');
          SQL.Add('       aidamt2,                                     ');
          SQL.Add('       aidamt3,                                     ');
          SQL.Add('       paysum,                                      ');
          SQL.Add('       intax,                                       ');
          SQL.Add('       jutax,                                       ');
          SQL.Add('       meddamt,                                     ');
          SQL.Add('       anudamt,                                     ');
          SQL.Add('       empldamt,                                    ');
          SQL.Add('       sauamt,                                      ');
          SQL.Add('       nojoamt,                                     ');
          SQL.Add('       saveamt3,                                    ');
          SQL.Add('       igamt,                                       ');
          SQL.Add('       sangamt,                                     ');
          SQL.Add('       sobiamt,                                     ');
          SQL.Add('       hsamt,                                       ');
          SQL.Add('       fbamt,                                       ');
          SQL.Add('       nbamt,                                       ');
          SQL.Add('       parkamt,                                     ');
          SQL.Add('       edudedamt,                                   ');
          SQL.Add('       sacorpcp,                                    '); //2011.09.22 우리사주 원금 상환 추가
          SQL.Add('       sacorpamt,                                   ');
          SQL.Add('       sabankcp,                                    '); //2011.09.22 우리사주 원금 상환 추가
          SQL.Add('       sabankamt,                                   ');
          SQL.Add('       saveamt1,                                    ');
          SQL.Add('       saveamt2,                                    ');
          SQL.Add('       chollamt,                                    ');
          SQL.Add('       ticketamt,                                   ');
          SQL.Add('       bondedamt,                                   ');
          SQL.Add('       savetaxded,                                  ');
          SQL.Add('       dedamt1,                                     ');
          SQL.Add('       dedamt2,                                     ');
          SQL.Add('       dedamt3,                                     ');
          SQL.Add('       dedamt4,                                     ');
          SQL.Add('       dedamt5,                                     ');
          SQL.Add('       dedsum,                                      ');
          SQL.Add('       realpay,                                     ');
          SQL.Add('       payra,                                       ');
          SQL.Add('       payholdamt,                                  ');
          SQL.Add('       info1,                                       ');
          SQL.Add('       info2,                                       ');
          SQL.Add('       info3,                                       ');
          SQL.Add('       fixpay,                                      ');
          SQL.Add('       bfixpay,                                     ');
          SQL.Add('       holipay,                                     ');
          SQL.Add('       quaterpay,                                   ');
          SQL.Add('       roleamt,                                     ');
          SQL.Add('       taxpay,                                      ');
          SQL.Add('       notaxpay,                                    ');
          SQL.Add('       childeduamt,                                 ');
          SQL.Add('       ovmcamt,                                     ');
          SQL.Add('       trainsupamt,                                 ');
          SQL.Add('       ovmcded,                                     ');
          SQL.Add('       medpaydedamt,                                ');
          SQL.Add('       meddedamt,                                   ');
          SQL.Add('       itamt                                        ');
          SQL.Add('  from pkhphis a, pkhpinfo c                        ');
          SQL.Add(' where (empno between :frempno and :toempno)        ');
          SQL.Add('   and (a.paydate between :frpaydate and :topaydate ');
          SQL.Add('        and a.paydate = c.paydate(+))               ');
          ParamByName('frempno').AsString   := M_KC3040C.E_FrEmpNo.Text;
          ParamByName('toempno').AsString   := M_KC3040C.E_ToEmpNo.Text;
          ParamByName('frpaydate').AsString := M_KC3040C.ME_FrPayMM.Text;
          ParamByName('topaydate').AsString := M_KC3040C.ME_ToPayMM.Text;
          Open;
     end;
end;


{==============================================================================
         Data를 Label로 옮겨주는 Procedure.
 ==============================================================================}
Procedure TSReportF2.MoveTo_Label;
var
  sTempDept : String ;
begin
     with {DataM.CDSPkhphis} DM1.QRY1 do
     begin
          // 연봉전이면 QRBand1 & False
          // 연봉후, 임원(이사대우제외)면 QRBand2
          // 연봉후, 임원이 아니면        QRBand1 & True
          if (DM1.QRY1.FieldByName('PayDate').AsString < M_KC3040C.gsStartYear) then // 0
               fzDisplayOldNew(0)
          else if (DM1.QRY1.FieldByName('PayCl').AsString < M_KC3040C.gsStartPaycl) and // 1
                  (DM1.QRY1.FieldByName('Paydate').AsString <= '200101') then // 1
               fzDisplayOldNew(1)
          else  // 2
               fzDisplayOldNew(2);

          if DM1.QRY1.FieldByName('Paydate').AsString <= '201112' then
             QRLabel27.Caption := '자가운전지원금'
          else
             QRLabel27.Caption := '직책자교통비';


        QRL_Year.Caption  := Copy(FieldByName('PayDate').AsString,1,4);
        QRL_Month.Caption := Copy(FieldByName('PayDate').AsString,5,2);
        Qempno.Caption    := FieldByName('Empno').AsString;
        Qkorname.Caption  := FieldByName('Korname').AsString;
        Qdeptnm.Caption := FieldbyName('DEPTNAME').AsString;

//infra        if (copy(FieldByName('Paycl').AsString,1,1) = '0') or
//           (copy(FieldByName('Paycl').AsString,1,1) = 'N') then  {임원인 경우 급호를 표기하지 않는다...}
//infra 수정 시작
        if(FieldByName('PayDate').AsString>=M_KC3040C.gsChangeDatePaycl) then
        begin
             QRL_payclnm.Caption := 'B A N D';   //infra
             QRL_payranm.Caption := '직    책';  //infra
            if (copy(FieldByName('Paycl').AsString,1,1) ='A') then  {임원인 경우 급호를 표기하지 않는다...}
            begin
                 Qpaycl.Caption    := '';
            end

            else
            begin
                 Qpaycl.Caption    := GetCodeName('I112',FieldByName('Paycl').AsString);
            end;
        end
        else begin
             QRL_payclnm.Caption := '직    급';    //infra 이전
             QRL_payranm.Caption := '직    위';    //infra 이전

            if (copy(FieldByName('Paycl').AsString,1,1) ='0')
               or (copy(FieldByName('Paycl').AsString,1,1) ='N') then  {임원인 경우 급호를 표기하지 않는다...}
            begin
                 Qpaycl.Caption    := '';
            end

            else
            begin
                 Qpaycl.Caption    := GetCodeName('I112',FieldByName('Paycl').AsString);
            end;
        end;
//infra 수정 끝

        QRL_PayRa.Caption := GetCodeName('I113',FieldByName('PayRa').AsString);
        Qpaybank.Caption  := GetCodeName('K910',FieldByName('PayBank').AsString);
        Qpayacnt.Caption  := FieldByName('Payacnt').AsString;
        Qbasicamt.Caption := FormatFloat('#,##0',FieldByName('basicamt').AsFloat );
        Qinfoamt.Caption  := FormatFloat('#,##0',FieldByName('infoamt').AsFloat);
        Qdutyamt.Caption  := FormatFloat('#,##0',FieldByName('dutyamt').AsFloat);
        Qpromamt.Caption  := FormatFloat('#,##0', FieldByName('promamt').AsFloat);
        Qfixpay.Caption   := FormatFloat('#,##0',FieldByName('fixpay').AsFloat+FieldByName('bfixpay').AsFloat );
        Qquaterpay.Caption:= FormatFloat('#,##0',FieldByName('quaterpay').AsFloat);
        Qholipay.Caption  := FormatFloat('#,##0',FieldByName('holipay').AsFloat);
        Qroleamt.Caption  := FormatFloat('#,##0', FieldByName('roleamt').AsFloat);
        Qmcaramt.Caption  := FormatFloat('#,##0', FieldByName('mcaramt').AsFloat);
        Qmpcamt.Caption   := FormatFloat('#,##0', FieldByName('mateamt').AsFloat +
                                                  FieldByName('partamt').AsFloat +
                                                  FieldByName('childamt').AsFloat);

        Qbokjisupamt.Caption := FormatFloat('#,##0', FieldByName('bokjisupamt').AsFloat);
        Qliceamt.Caption     := FormatFloat('#,##0', FieldByName('liceamt').AsFloat);
        Qovtmamt.Caption     := FormatFloat('#,##0', FieldByName('ovtmamt').AsFloat);
        Qsptmamt.Caption     := FormatFloat('#,##0', FieldByName('sptmamt').AsFloat);
        Qodamt.Caption       := FormatFloat('#,##0', FieldByName('odamt').AsFloat);
        Qdrvliceamt.Caption  := FormatFloat('#,##0', FieldByName('drvliceamt').AsFloat);
        Qlectsupamt.Caption  := FormatFloat('#,##0', FieldByName('lectsupamt').AsFloat);
        Qedusupamt.Caption   := FormatFloat('#,##0', FieldByName('edusupamt').AsFloat);
        Qyueduamt.Caption    := FormatFloat('#,##0', FieldByName('yueduamt').AsFloat);
        Qselfeduamt.Caption  := FormatFloat('#,##0', FieldByName('selfeduamt').AsFloat);
        Qbonusamt.Caption    := FormatFloat('#,##0', FieldByName('bonusamt').AsFloat);
        Qincentamt.Caption   := FormatFloat('#,##0', FieldByName('incentamt').AsFloat);
        Qtrainamt.Caption    := FormatFloat('#,##0', FieldByName('trainamt').AsFloat);
        Qsbonamt.Caption     := FormatFloat('#,##0', FieldByName('sbonamt').AsFloat);
        Qmbonamt.Caption     := FormatFloat('#,##0', FieldByName('mbonamt').AsFloat);
        Qybonamt.Caption     := FormatFloat('#,##0', FieldByName('ybonamt').AsFloat);
        Qwinteramt.Caption   := FormatFloat('#,##0', FieldByName('winteramt').AsFloat);
        Qhomesupamt.Caption  := FormatFloat('#,##0', FieldByName('homesupamt').AsFloat);
        Qlongsupamt.Caption  := FormatFloat('#,##0', FieldByName('longsupamt').AsFloat);
        Qpaybon.Caption      := FormatFloat('#,##0', FieldByName('sopaysum').AsFloat +
                                                     FieldByName('sobonsum').AsFloat);
        Qnotaxpay.Caption    := FormatFloat('#,##0', FieldByName('notaxpay').AsFloat);
        Qtaxpay.Caption      := FormatFloat('#,##0', FieldByName('taxpay').AsFloat);
        QMedSupAmt.Caption   := FormatFloat('#,##0', FieldByName('MedSupAmt').AsFloat);
        Qaidamt1.Caption     := FormatFloat('#,##0', FieldByName('aidamt1').AsFloat);
        Qaidamt2.Caption     := FormatFloat('#,##0', FieldByName('aidamt2').AsFloat);
        Qaidamt3.Caption     := FormatFloat('#,##0', FieldByName('aidamt3').AsFloat);

        QITamt.Caption       := FormatFloat('#,##0', FieldByName('ITamt').AsFloat); //dsa2000  2005.01.

        //.....지 급 내 역......상단....//
        Qintax.Caption     := FormatFloat('#,##0', FieldByName('intax').AsFloat);
        Qjutax.Caption     := FormatFloat('#,##0', FieldByName('jutax').AsFloat);
        Qmedamt.Caption    := FormatFloat('#,##0', FieldByName('meddamt').AsFloat);
        Qanuamt.Caption    := FormatFloat('#,##0', FieldByName('anudamt').AsFloat);
        Qemplamt.Caption   := FormatFloat('#,##0', FieldByName('empldamt').AsFloat);
        Qsauamt.Caption    := FormatFloat('#,##0', FieldByName('sauamt').AsFloat);
        Qsaveamt3.Caption  := FormatFloat('#,##0', FieldByName('saveamt3').AsFloat);
        Qigamt.Caption     := FormatFloat('#,##0', FieldByName('igamt').AsFloat);
        QSangamt.Caption   := FormatFloat('#,##0', FieldByName('Sangamt').AsFloat);
        Qhsamt.Caption     := FormatFloat('#,##0', FieldByName('hsamt').AsFloat);
        Qfbamt.Caption     := FormatFloat('#,##0', FieldByName('fbamt').AsFloat);
        Qnbamt.Caption     := FormatFloat('#,##0', FieldByName('nbamt').AsFloat);
        Qparkamt.Caption   := FormatFloat('#,##0', FieldByName('parkamt').AsFloat);
        Qedudedamt.Caption := FormatFloat('#,##0', FieldByName('edudedamt').AsFloat);

        Qsacorpcp.Caption  := FormatFloat('#,##0', FieldByName('sacorpcp').AsFloat); //2011.09.22 우리사주 원금 상환 추가
        Qsacorpamt.Caption := FormatFloat('#,##0', FieldByName('sacorpamt').AsFloat);
        Qsabankcp.Caption  := FormatFloat('#,##0', FieldByName('sabankcp').AsFloat); //2011.09.22 우리사주 원금 상환 추가
        Qsabankamt.Caption := FormatFloat('#,##0', FieldByName('sabankamt').AsFloat);


        Qchollamt.Caption  := FormatFloat('#,##0', FieldByName('chollamt').AsFloat);
        Qticketamt.Caption := FormatFloat('#,##0', FieldByName('ticketamt').AsFloat);
        Qbondedamt.Caption := FormatFloat('#,##0', FieldByName('bondedamt').AsFloat);
        Qdedamt1.Caption   := FormatFloat('#,##0', FieldByName('dedamt1').AsFloat);
        Qdedamt2.Caption   := FormatFloat('#,##0', FieldByName('dedamt2').AsFloat);
        Qdedamt3.Caption   := FormatFloat('#,##0', FieldByName('dedamt3').AsFloat);

        Qdedamt4.Caption   := FormatFloat('#,##0', FieldByName('dedamt4').AsFloat);

        if (QRL_Year.Caption  + QRL_Month.Caption) >= '199901' then
        begin
             QRLabel20.Caption := '기금조성공제';
             Qdedamt5.Caption   := FormatFloat('#,##0', FieldByName('dedamt5').AsFloat);
        end
        else
        begin
             Qdedamt5.Caption  := '';
             QRLabel20.Caption  := '';
        end;

        //운전면허지원금은 2000년 1월까지만 존재..
        if (QRL_Year.Caption  + QRL_Month.Caption) > '200001' then
        begin
             QRLabel28.Enabled    := False ;
             Qdrvliceamt.Enabled  := False ;
        end
        else
        begin
             QRLabel28.Enabled    := True ;
             Qdrvliceamt.Enabled  := True ;
        end;

        //동작식대는 2000년 12월까지만 존재..
        if (QRL_Year.Caption  + QRL_Month.Caption) > '200012' then
        begin
             QRLabel58.Enabled  := False ;
             Qovmcded.Enabled   := False ;
        end
        else
        begin
             QRLabel58.Enabled  := True ;
             Qovmcded.Enabled   := True ;
        end;

        //외환복지 대출금 1998년 08월까지만 존재..
        if (QRL_Year.Caption  + QRL_Month.Caption) > '199808' then
        begin
             QRLabel98.Enabled := False ;
             Qfbamt.Enabled   := False ;
        end
        else
        begin
             QRLabel98.Enabled := True ;
             Qfbamt.Enabled   := True ;
        end;

{===============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   31.01      2001.05.25.        유효성          2001.05월급여는 기금조성공제를 기타공제5로 수정
================================================================================}
        if (QRL_Year.Caption  + QRL_Month.Caption) = '200105' then
             QRLabel20.Caption := '기타공제5'
        else
             QRLabel20.Caption := '기금조성공제' ;

        QPayHoldAmt.Caption  := FormatFloat('#,##0', FieldByName('PayHoldAmt').AsFloat);
        Qrealpay.Caption     := FormatFloat('#,##0', FieldByName('Realpay').AsFloat);
        QRL_PaySum.Caption   := FormatFloat('#,##0', FieldByName('PaySum').AsFloat);
        QRL_DedSum.Caption   := FormatFloat('#,##0', FieldByName('DedSum').AsFloat);
        Qchildeduamt.Caption := FormatFloat('#,##0', FieldByName('childeduamt').AsFloat);
        Qovmcamt.Caption     := FormatFloat('#,##0', FieldByName('ovmcamt').AsFloat);
        QTrainSupAmt.Caption := FormatFloat('#,##0', FieldByName('TrainSupAmt').AsFloat);
        QovmcDed.Caption     := FormatFloat('#,##0', FieldByName('ovmcDed').AsFloat);

        // 공지사항
        QMEDPAYDEDAMT.Caption     := FormatFloat('#,##0', FieldByName('MEDdedAMT').AsFloat);

        QRL_Info1.Caption := FieldByName('Info1').AsString;
        QRL_Info2.Caption := FieldByName('Info2').AsString;
        QRL_Info3.Caption := FieldByName('Info3').AsString;

        Count := Count + 1;
    end;


end;

 { ==============================================================================
  ===================       Event Handlers      ================================
  ============================================================================== }


procedure TSReportF2.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if Count < Maxvalue then
     Begin
          MoveTo_Label;
          Application.ProcessMessages;
          Fm_PreviewForm.show;
     end;
end;

procedure TSReportF2.QReportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
     Fm_PreviewForm.Show;
end;

{===============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   30.00      1998.12.31         윤형식          계산로직변경    하나로인사재개발
================================================================================}
// 추가
procedure TSReportF2.fzDisplayOldNew(iWhatType: Integer);
begin
     // New
     QRLabel_n1.Enabled := False;
     QRLabel_n2.Enabled := False;
     QRLabel_n3.Enabled := False;
     QRLabel_n4.Enabled := False;

     Qfixpay.Enabled    := False;
     Qquaterpay.Enabled := False;
     Qholipay.Enabled   := False;
     Qroleamt.Enabled   := False;

     // Old
     QRLabel_d1.Enabled := False;
     QRLabel_d2.Enabled := False;
     QRLabel_d3.Enabled := False;
     QRLabel_d4.Enabled := False;
     QRLabel_d5.Enabled := False;
     QRLabel_d6.Enabled := False;
     QRLabel_d7.Enabled := False;
     QRLabel_d9.Enabled := False;

     Qbasicamt.Enabled  := False;
     Qinfoamt.Enabled   := False;
     Qdutyamt.Enabled   := False;
     Qpromamt.Enabled   := False;
     Qbonusamt.Enabled  := False;
     Qincentamt.Enabled := False;
     Qtrainamt.Enabled  := False;
     Qhomesupamt.Enabled:= False;

     if iWhatType = 0 then
     begin
          // Old
          QRLabel_d1.Enabled := True;
          QRLabel_d2.Enabled := True;
          QRLabel_d3.Enabled := True;
          QRLabel_d4.Enabled := True;
          QRLabel_d5.Enabled := True;
          QRLabel_d6.Enabled := True;
          QRLabel_d7.Enabled := True;
          QRLabel_d9.Enabled := True;

          QRLabel_d3.Left    := QRLabel_n3.Left;

          Qbasicamt.Enabled  := True;
          Qinfoamt.Enabled   := True;
          Qdutyamt.Enabled   := True;
          Qpromamt.Enabled   := True;
          Qbonusamt.Enabled  := True;
          Qincentamt.Enabled := True;
          Qtrainamt.Enabled  := True;
          Qhomesupamt.Enabled:= True;

          Qdutyamt.Left      := Qholipay.Left;
     end
     else if iWhatType = 1 then
     begin
          // Old
          QRLabel_d1.Enabled := True;
          QRLabel_d3.Enabled := True;
          QRLabel_d5.Enabled := True;
          QRLabel_d6.Enabled := True;
          QRLabel_d7.Enabled := True;
          QRLabel_d3.Left    := QRLabel_n2.Left;

          Qbasicamt.Enabled  := True;
          Qdutyamt.Enabled   := True;
          Qbonusamt.Enabled  := True;
          Qincentamt.Enabled := True;
          Qtrainamt.Enabled  := True;
          Qdutyamt.Left      := Qquaterpay.Left;
     end
     else // 2
     begin
          // Title New
          QRLabel_n1.Enabled := True;
          QRLabel_n2.Enabled := True;
          QRLabel_n3.Enabled := True;
          QRLabel_n4.Enabled := True;

          Qfixpay.Enabled    := True;
          Qquaterpay.Enabled := True;
          Qholipay.Enabled   := True;
          Qroleamt.Enabled   := True;
     end;
end;

procedure TSReportF2.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     MaxValue := DM1.QRY1.RecordCount ;
     Count    := 0;

     QRLabel_d1.Top := QRLabel_n1.Top;
     QRLabel_d2.Top := QRLabel_n2.Top;
     QRLabel_d3.Top := QRLabel_n3.Top;
     QRLabel_d4.Top := QRLabel_n4.Top;

     Qbasicamt.Top := Qfixpay.Top;
     Qinfoamt.Top  := Qquaterpay.Top;
     Qdutyamt.Top  := Qholipay.Top;
     Qpromamt.Top  := Qroleamt.Top;
end;

end.

