{===================== Program Header ==========================================
 PROGRAM-NAME   : PKQ1030A(소득공제 신고서)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 연말정산
 Programmer     : 강륜종
 Version        : 1.0
 Date           : 2005.12.

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
     1.00       2005.12.15         강륜종          최초개발본
================================================================================}

unit PSF10204;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, Tmax_DataSetText, StdCtrls;

type
  TFM_Print = class(TForm)
    QRCompositeReport1: TQRCompositeReport;
    TDS2: TTMaxDataSet;
    QuickRep1: TQuickRep;
    band: TQRBand;
    QRLabel156: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QR_Deptcode: TQRLabel;
    QR_Empno: TQRLabel;
    QR_Korname: TQRLabel;
    QR_phonenum: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape78: TQRShape;
    QRShape94: TQRShape;
    QRLabel170: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape117: TQRShape;
    QRShape122: TQRShape;
    QRLabel207: TQRLabel;
    QRShape123: TQRShape;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    QRLabel210: TQRLabel;
    QRLabel211: TQRLabel;
    QRLabel212: TQRLabel;
    QRShape199: TQRShape;
    QRLabel214: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel266: TQRLabel;
    QRLabel268: TQRLabel;
    QRLabel269: TQRLabel;
    QRLabel270: TQRLabel;
    QRLabel271: TQRLabel;
    QRLabel272: TQRLabel;
    QRShape200: TQRShape;
    QRLabel280: TQRLabel;
    QRLabel287: TQRLabel;
    QRShape201: TQRShape;
    QRLabel293: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QR_academy: TQRLabel;
    QR_Book: TQRLabel;
    QR_IG: TQRLabel;
    QR_HR: TQRLabel;
    QR_EDU: TQRLabel;
    QR_CHI: TQRLabel;
    QR_INS: TQRLabel;
    QR_MED: TQRLabel;
    QR_HEX: TQRLabel;
    QR_PHY: TQRLabel;
    QR_HOB: TQRLabel;
    QR_GIF: TQRLabel;
    QR_SPA: TQRLabel;
    QR_CON: TQRLabel;
    QR_TRA: TQRLabel;
    QR_acAttachtxt: TQRLabel;
    QR_boAttachtxt: TQRLabel;
    QR_IGAttachtxt: TQRLabel;
    QR_HRAttachtxt: TQRLabel;
    QR_EDUAttachtxt: TQRLabel;
    QR_accnt: TQRLabel;
    QR_bocnt: TQRLabel;
    QR_IGcnt: TQRLabel;
    QR_HRcnt: TQRLabel;
    QR_EDUcnt: TQRLabel;
    QR_acContamt: TQRLabel;
    QR_boContamt: TQRLabel;
    QR_IGContamt: TQRLabel;
    QR_HRContamt: TQRLabel;
    QR_CHIAttachtxt: TQRLabel;
    QR_INSAttachtxt: TQRLabel;
    QR_MEDAttachtxt: TQRLabel;
    QR_HEXAttachtxt: TQRLabel;
    QR_PHYAttachtxt: TQRLabel;
    QR_HOBAttachtxt: TQRLabel;
    QR_GIFAttachtxt: TQRLabel;
    QR_SPAAttachtxt: TQRLabel;
    QR_CONAttachtxt: TQRLabel;
    QR_TRAAttachtxt: TQRLabel;
    QR_CHIcnt: TQRLabel;
    QR_INScnt: TQRLabel;
    QR_MEDcnt: TQRLabel;
    QR_HEXcnt: TQRLabel;
    QR_PHYcnt: TQRLabel;
    QR_HOBcnt: TQRLabel;
    QR_GIFcnt: TQRLabel;
    QR_SPAcnt: TQRLabel;
    QR_CONcnt: TQRLabel;
    QR_TRAcnt: TQRLabel;
    QR_CHIContamt: TQRLabel;
    QR_INSContamt: TQRLabel;
    QR_MEDContamt: TQRLabel;
    QR_HEXContamt: TQRLabel;
    QR_PHYContamt: TQRLabel;
    QR_HOBContamt: TQRLabel;
    QR_GIFContamt: TQRLabel;
    QR_SPAContamt: TQRLabel;
    QR_CONContamt: TQRLabel;
    QR_TRAContamt: TQRLabel;
    QR_Yearnum: TQRLabel;
    QRLabel83: TQRLabel;
    QR_Yearnum2: TQRLabel;
    QRShape4: TQRShape;
    QR_Total: TQRLabel;
    QR_NONDEVAMT: TQRLabel;
    QR_DEVAMT: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape17: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRShape31: TQRShape;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    QRShape40: TQRShape;
    QRShape43: TQRShape;
    QRShape5: TQRShape;
    QRLabel19: TQRLabel;
    QR_EDUContamt: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel294: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel16: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep2Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_AnuAmt, FG_MedAmt, FG_HireAmt  : Double;
  end;

var
  FM_Print: TFM_Print;

implementation

uses PSF10201, peprnview;

{$R *.DFM}

procedure TFM_Print.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFM_Print.QRCompositeReport1AddReports(Sender: TObject);
begin

  QRCompositeReport1.Reports.Add(QuickRep1);
//  QRCompositeReport1.Reports.Add(QuickRep2);
end;

procedure TFM_Print.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

procedure TFM_Print.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//     QRLabel1.cAPTION :='1';
     

end;

procedure TFM_Print.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var  SqlStr2 : String;
begin
     QR_Yearnum.Caption  := Copy(MainForm.GSyearnum,1,4);

     if Copy(MainForm.GSyearnum,5,2)= '01' then
        QR_Yearnum2.Caption := '전반기'
     else if Copy(MainForm.GSyearnum,5,2)= '02' then
        QR_Yearnum2.Caption := '하반기' ;



     QR_empno.Caption    := MainForm.ED_empno.empno;
     QR_korname.Caption  := MainForm.ED_empno.korname;
     QR_Deptcode.Caption  :=MainForm.ED_empno.Deptname; // MainForm.ED_empno.Deptcode+'/'+

//마스터 읽어오기
  SqlStr2 := 'select yearnum, empno, korname, nvl(devlimit,0), nvl(nondevlimit,0), '+
            '       nvl(devamt,0), nvl(nondevamt,0), nvl(conyn,''N'')             '+
            '  from psmssmas          '+
     Format(' where yearnum = ''%s''  '+
            '   and empno   = ''%s''', [MainForm.GSyearnum , MainForm.ED_empno.empno]) ;

  with TDS2 do
    begin
      ServiceName := 'PSF1020A_sel1';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr2;

      ClearFieldInfo;
      AddField('YEARNUM'    , ftString,  6);
      AddField('EMPNO'      , ftString,  4);
      AddField('KORNAME'    , ftString,  12);
      AddField('DEVLIMIT'   , ftFloat,   9);
      AddField('NONDEVLIMIT', ftFloat,   9);
      AddField('DEVAMT'     , ftFloat,   9);
      AddField('NONDEVAMT'  , ftFloat,   9);
      AddField('CONYN'      , ftString,  1);
      Open;

      if TDS2.eof then
      begin
           MessageDlg('해당하는 데이터가 존재하지 않습니다.', mtInformation , [mbOk],0);
           Exit;
      end;


      QR_DEVAMT.Caption     := FormatFloat('#,##0', FieldByName('DEVAMT').AsFloat ) ;
      QR_NONDEVAMT.Caption  := FormatFloat('#,##0', FieldByName('NONDEVAMT').AsFloat ) ;
      QR_Total.Caption      := FormatFloat('#,##0', FieldByName('DEVAMT').AsFloat + FieldByName('NONDEVAMT').AsFloat);



{      NE_dev.Value         := FieldByName('DEVLIMIT').AsFloat ;
      NE_ndev.Value        := FieldByName('NONDEVLIMIT').AsFloat ;
      NE_rem.Value         := (FieldByName('DEVLIMIT').AsFloat + FieldByName('NONDEVLIMIT').AsFloat)
                             -(FieldByName('DEVAMT').AsFloat   + FieldByName('NONDEVAMT').AsFloat) ;
      NE_dev_tot.Value     := FieldByName('DEVAMT').AsFloat;
      NE_ndev_tot.Value    := FieldByName('NONDEVAMT').AsFloat;}
    end;




{  SqlStr2 := 'select sscode, nvl(itemamt,0), ''field3'', ''field4'', ''field5'' '+
            '  from psmssitem '+
     Format(' where yearnum = ''%s'''+
            '   and empno   = ''%s''', [MainForm.GSyearnum, MainForm.ED_empno.empno]) ;}

//컨퍼넌트 쿨리어
    QR_academy.Caption      :=  '';
    QR_acContamt.Caption    :=  '';
    QR_accnt.Caption        :=  '';
    QR_acATTACHTXT.Caption  :=  '';


    QR_Book.Caption         :=  '';
    QR_boContamt.Caption    :=  '';
    QR_bocnt.Caption        :=  '';
    QR_boATTACHTXT.Caption  :=  '';


    QR_IG.Caption           :=  '';
    QR_IGContamt.Caption    :=  '';
    QR_IGcnt.Caption        :=  '';
    QR_IGATTACHTXT.Caption  :=  '';

    QR_HR.Caption           :=  '';
    QR_HRContamt.Caption    :=  '';
    QR_HRcnt.Caption        :=  '';
    QR_HRATTACHTXT.Caption  :=  '';

    QR_EDU.Caption           :=  '';
    QR_EDUContamt.Caption    :=  '';
    QR_EDUcnt.Caption        :=  '';
    QR_EDUATTACHTXT.Caption  :=  '';

    QR_CHI.Caption           :=  '';
    QR_CHIContamt.Caption    :=  '';
    QR_CHIcnt.Caption        :=  '';
    QR_CHIATTACHTXT.Caption  :=  '';

    QR_INS.Caption           :=  '';
    QR_INSContamt.Caption    :=  '';
    QR_INScnt.Caption        :=  '';
    QR_INSATTACHTXT.Caption  :=  '';

    QR_MED.Caption           :=  '';
    QR_MEDContamt.Caption    :=  '';
    QR_MEDcnt.Caption        :=  '';
    QR_MEDATTACHTXT.Caption  :=  '';


    QR_HEX.Caption           :=  '';
    QR_HEXContamt.Caption    :=  '';
    QR_HEXcnt.Caption        :=  '';
    QR_HEXATTACHTXT.Caption  :=  '';


    QR_PHY.Caption           :=  '';
    QR_PHYContamt.Caption    :=  '';
    QR_PHYcnt.Caption        :=  '';
    QR_PHYATTACHTXT.Caption  :=  '';

    QR_HOB.Caption           :=  '';
    QR_HOBContamt.Caption    :=  '';
    QR_HOBcnt.Caption        :=  '';
    QR_HOBATTACHTXT.Caption  :=  '';

    QR_GIF.Caption           :=  '';
    QR_GIFContamt.Caption    :=  '';
    QR_GIFcnt.Caption        :=  '';
    QR_GIFATTACHTXT.Caption  :=  '';

    QR_SPA.Caption           :=  '';
    QR_SPAContamt.Caption    :=  '';
    QR_SPAcnt.Caption        :=  '';
    QR_SPAATTACHTXT.Caption  :=  '';

    QR_CON.Caption           :=  '';
    QR_CONContamt.Caption    :=  '';
    QR_CONcnt.Caption        :=  '';
    QR_CONATTACHTXT.Caption  :=  '';

    QR_TRA.Caption           :=  '';
    QR_TRAContamt.Caption    :=  '';
    QR_TRAcnt.Caption        :=  '';
    QR_TRAATTACHTXT.Caption  :=  '';


    SqlStr2 := 'SELECT EMPNO, RETCONT,''feild3'',''feild4'',''feild5''      '+
               '  FROM PIMPMAS             '+
       Format (' WHERE EMPNO =''%s'' ',[MainForm.ED_empno.empno]);

     with TDS2 do
     begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := SqlStr2;

          ClearFieldInfo;
          AddField('EMPNO'   , ftString,   100);
          AddField('RETCONT' , ftString,   100);
          AddField('feild3'  , ftString,   100);
          AddField('feild4'  , ftString,   100);
          AddField('feild5'  , ftString,   100);
          Open;
          QR_phonenum.Caption := FieldByName('RETCONT').AsString  ;
     end;

    if  Copy(MainForm.GSyearnum,5,2) = '01' then
        QRLabel287.Caption := '전반기 전체 신청금액'
    else
        QRLabel287.Caption := '하반기 전체 신청금액';




//아이템 읽어오기

 SqlStr2 := 'select SSCODE,count(SSCODE) SSCODENUM, min(CONTENTS) CONTENTS,  '+  //cnt MAX(SSCODENUM)
            '       SUM(CONTAMT) CONTAMT, MIN(ATTACHTXT) ATTACHTXT             '+
            '  from psmsslst                                                   '+
    Format( ' where yearnum  = ''%s''                                          '+
            '   and empno    = ''%s''                                          '+
            ' group by SSCODE                                                  '+
            ' order by sscodenum  ' , [MainForm.GSyearnum, MainForm.ED_empno.empno]);

  with TDS2 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr2;

      ClearFieldInfo;
      AddField('SSCODE'     , ftString,   100);
      AddField('SSCODENUM'  , ftString,   100);
      AddField('CONTENTS'   , ftString,   100);
      AddField('CONTAMT'    , ftString,   100);
      AddField('ATTACHTXT'  , ftString,   100);
      Open;

      while not TDS2.Eof do
      begin
           if FieldByName('SSCODE').AsString      = 'AA01' then  //ACADEMY
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_academy.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_academy.Caption :=  FieldByName('CONTENTS').AsString+FieldByName('SSCODENUM').AsString +'건' ;
                QR_acAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_acContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'AA02' then //BOOK
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_book.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_book.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_book.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_boAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_boContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'AA03' then //IG
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_IG.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_IG.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_IG.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_IGAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_IGContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'AA04' then //HREDU
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_HR.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_HR.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
                QR_HRAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_HRContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'AA05' then //SELFEDU
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_EDU.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_EDU.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_EDU.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_EDUAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_EDUContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BA01' then  //CHILD
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_CHI.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_CHI.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//              QR_CHI.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_CHIAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_CHIContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BB01' then  //INSUR
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_INS.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_INS.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_INS.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_INSAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_INSContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BC01' then //MEDI
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_MED.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_MED.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_MED.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_MEDAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_MEDContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BC02' then //HEXAM
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_HEX.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_HEX.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_HEX.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_HEXAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_HEXContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BD01' then //PHYSICAL
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_PHY.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_PHY.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_PHY.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_PHYAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_PHYContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BD02' then //HOBBY
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_HOB.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_HOB.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_HOB.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_HOBAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_HOBContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BD03' then //GIFT
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_GIF.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_GIF.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;

//                QR_GIF.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_GIFAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_GIFContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           //dsa2000  2005.05.
           else if FieldByName('SSCODE').AsString = 'BE01' then     //spare
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_SPA.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_SPA.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_SPA.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_SPAAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_SPAContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BE02' then   //condo
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_CON.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_CON.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_CON.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_CONAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_CONContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end
           else if FieldByName('SSCODE').AsString = 'BE03' then  //travel
           begin
                if FieldByName('SSCODENUM').AsFloat <= 1 then
                   QR_TRA.Caption :=  FieldByName('CONTENTS').AsString
                else
                   QR_TRA.Caption :=  FieldByName('CONTENTS').AsString+' 외'+FloattoStr(FieldByName('SSCODENUM').AsFloat-1)  +'건' ;
//                QR_TRA.Caption :=  FieldByName('CONTENTS').AsString  ;
                QR_TRAAttachtxt.Caption :=  FieldByName('ATTACHTXT').AsString  ;
                QR_TRAContamt.Caption  := FormatFloat('#,##0',FieldByName('CONTAMT').AsFloat ) ;
           end;

          TDS2.Next;
        end;
    end;
end;

procedure TFM_Print.QuickRep2Preview(Sender: TObject);
begin
    QuickRep2.NewPage;
end;

end.
