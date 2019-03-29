unit pie20806;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Qrctrls, QuickRpt;

type
  TFpie20806 = class(TForm)
    Query3: TQuery;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRLuniname: TQRLabel;
    QRL3: TQRLabel;
    QRL5: TQRLabel;
    QRL6: TQRLabel;
    QRL7: TQRLabel;
    QRL8: TQRLabel;
    QRL9: TQRLabel;
    QRLs: TQRLabel;
    QRL2: TQRLabel;
    QuickReport1: TQuickRep;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    Query4: TQuery;
    QRBand4: TQRBand;
    QRL1: TQRLabel;
    QRLt: TQRLabel;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLsi: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs3: TQRLabel;
    QRLs5: TQRLabel;
    QRLs6: TQRLabel;
    QRLs7: TQRLabel;
    QRLs8: TQRLabel;
    QRLs9: TQRLabel;
    QRLss: TQRLabel;
    QRLi: TQRLabel;
    QRLsr: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape48: TQRShape;
    QRLabel3: TQRLabel;
    QRL4: TQRLabel;
    QRLs4: TQRLabel;
    QRLr: TQRLabel;
    QRLabel11: TQRLabel;
    QRLst: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape58: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape10: TQRShape;
    QRShape28: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape21: TQRShape;
    QRShape56: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape52: TQRShape;
    QRShape57: TQRShape;
    QRShape54: TQRShape;
    QRShape59: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape60: TQRShape;
    QRLabel30: TQRLabel;
    QRShape55: TQRShape;
    QRL10: TQRLabel;
    QRShape61: TQRShape;
    QRLs10: TQRLabel;
    QRShape62: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRShape25: TQRShape;
    QRShape34: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape6: TQRShape;
    QRShape35: TQRShape;
    QRShape37: TQRShape;
    QRShape41: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLInwon: TQRLabel;
    QRLInwonT: TQRLabel;
    QRShape49: TQRShape;
    lblMsg: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
//    procedure QRBand3BeforePrint(var PrintBand: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
//    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
//    procedure QRBand3AfterPrint(BandPrinted: Boolean);
//    procedure QRBand4BeforePrint(var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    SQLCommand : string;
    RecCount   : integer;   {전체자료건수}
    PrtCount   : integer;   {출력건수}
  public
    { Public declarations }
  end;

var
  Fpie20806: TFpie20806;
  data1,data2,data4,uniname,lpaycl,Mto,Mfr : String;
  idatai,idata1,idata2,idata3,idata4,idata5,idata6,idata7,idata8,idata9,idata10: Integer;
  tsumi,tsum1,tsum2,tsum3,tsum4,tsum5,tsum6,tsum7,tsum8,tsum9,tsum10,tsumr: Integer;
  data3,idata,sum1,sum2,ttsum1,ttsum2,Tinwon,datacnt,Ci: Integer;
  jdata1,jdata2,jdata3,jdata4,jdatas: Integer;{특정직을 위한 comment}
  rate1 : Real;
  fyear,tyear,binwon: Integer;{년도 변환용..}
  fyymm,tyymm,NowYYMM, NowMM: String; {키로 사용할 년월}



implementation

{$R *.DFM}

Uses e2080c, peprnView;

//procedure TFpie20806.QRBand3BeforePrint(var PrintBand: Boolean);
//begin
//end;

//procedure TFpie20806.QRBand2BeforePrint(var PrintBand: Boolean);
//end;

//procedure TFpie20806.QuickReport1BeforePrint(var PrintReport: Boolean);
//begin
//end;

//procedure TFpie20806.QRBand3AfterPrint(BandPrinted: Boolean);
//begin
//end;

//procedure TFpie20806.QRBand4BeforePrint(var PrintBand: Boolean);
//end;

procedure TFpie20806.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     idatai := 0;  idata1 := 0;  idata2 := 0;  idata3 := 0;  idata4 := 0;
     idata5 := 0;  idata6 := 0;  idata7 := 0;  idata8 := 0;  idata9 := 0;idata10 := 0;
     sum1 := 0; sum2 := 0;
     begin
          Inc(PrtCount);
          Fpie2080c.gauge1.Progress := (PrtCount * 100) div RecCount;
          if (PrtCount >= RecCount) then
             Fpie2080c.gauge1.Progress := 100;

          data1  := Query1.Fields[0].AsString;{년도....}
//khj 1998.12.26  구직급코드변경.

//   정규용  주석처리
//          Query2.SQL.ADD(' SELECT SUM(RTINWON),PAYCL ');
//          Query2.SQL.ADD('   FROM PIHTONG  a');
////        Query2.SQL.ADD(' (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )b '); //2001.08.08 shm 추가
//          Query2.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND ');
//          Query2.SQL.ADD('         (TONGYM <='''+Mto+''') AND ');
//          Query2.SQL.ADD('         (PAYCL <= ''93'') AND ');   //기존(99)
//          Query2.SQL.ADD('         (SUBSTR(TONGYM,1,4) = '''+data1+''')) ');
////          Query2.SQL.ADD('    and   a.orgnum = b.value1    ');                 //2001.08.08 shm 추가
//          Query2.SQL.ADD(' GROUP BY PAYCL');
          with Query2 do
          begin
            Close;
            SQL.Clear;
            if Fpie2080c.RGdangYN.ItemIndex = 0 then
              SQL.Add(' select count(empno),paycl                                      '+
                      '  from pihanno                                                  '+
                      ' where substr(anfrdate,1,6) >='''+Mfr+'''                       '+
                      '   and substr(anfrdate,1,6) <='''+Mto+'''                       '+
                      '   and substr(anfrdate,1,4) = '''+data1+'''                     '+
              	      '   and ancode in (''819'',''829'',''839'',''849'')              '+
                      'group by paycl                                                  ')
            else
              SQL.Add('select count(empno),paycl                                       '+
                      '  from pihanno                                                  '+
                      ' where substr(anfrdate,1,6) >='''+Mfr+'''                       '+
                      '   and substr(anfrdate,1,6) <='''+Mto+'''                       '+
                      '   and substr(anfrdate,1,4)  ='''+data1+'''                     '+
              	      '   and ancode in (''819'',''829'',''839'',''849'')              '+
                      '   and (ancode <> ''819'' or (NVL(andetcode,''ZZ'') <> ''92'')) '+
                      'group by paycl                                                  ');
          end;
          Query2.Open;
          {1.직급별 인원을 계산한다................................}
          while not Query2.EOF do
                 begin
                     data2 := Query2.Fields[1].AsString;
                     if (Copy(data2,1,1) = '0') then begin  
                        idatai := idatai + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '11') then begin  //기존 임원(10)
                        idata1 := idata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '13') then begin  //기존 임원(20)
                        idata2 := idata2 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '21') then begin  //기존 임원(30)
                        idata3 := idata3 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '23') then begin  //기존 임원(40)
                        idata4 := idata4 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '31') then begin  //기존 임원(50)
                        idata5 := idata5 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '33') then begin  //기존 임원(60)
                        idata6 := idata6 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '41') then begin  //기존 임원(70)
                        idata7 := idata7 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '43') then begin  //기존 임원(80)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '45') then begin  //기존 임원(15)
                        idata9 := idata9 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '93') then begin       {특정직}
                        idata10 := idata10 + Query2.Fields[0].AsInteger;
                        jdata3 := jdata3 + Query2.Fields[0].AsInteger;
                     end;
                     Query2.next;
                     end;
          {1.의 끝.................................................}
          {2.계와 총원을 구한다....................................}
          begin
          sum1 := idata1+idata2+idata3+idata4+idata5+idata6+idata7+
                  idata8+idata9+idata10;
//          sum2 := idatai+idata1+idata2+idata3+idata4+idata5+idata6+
//                  idata7+idata8+idata9;//+10;  왜 +10일까??  shm 2001.07.09

          sum2 := idatai+idata1+idata2+idata3+idata4+idata5+idata6+
                  idata7+idata8+idata9+idata10; //shm 2001.07.09

          end;
          {2.의 끝.................................................}
          {전년도말인원을 구한다...............}
          {30.10  2003.09.18   이민용  최상용과장님 요청   연평균인원구하는 식변경 및 리포트에 추가
            기존에는 연평균 인원이 전년도말 인원이였는데, 1월부터 12월말의 인원을 12로 나누어서 구함}
         if formatDateTime('YYYY',NOW) <>  data1 then  // 현재 년도가 아닐때 12로 나눈다.
          begin
               fyear := StrToInt(data1);
               fyymm := IntToStr(fyear)+'01';
               tyear := StrToInt(data1);
               tyymm := IntToStr(tyear)+'12';
               Query3.Close;
               Query3.SQL.Clear;
               Query3.SQL.ADD(' SELECT round(SUM(INWON)/12) ');
               Query3.SQL.ADD('   FROM PIHTONG a ');
//             Query3.SQL.ADD(' (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )b '); //2001.08.08 shm 추가
               Query3.SQL.ADD('  WHERE ((TONGYM between '''+fyymm+''' AND '''+tyymm+''' ) AND ');
               Query3.SQL.ADD('          (PAYCL <= ''93'')) ');  //99
//             Query3.SQL.ADD('    and   a.orgnum = b.value1    ');                                           //2001.08.08 shm 추가
               Query3.Open;
               binwon := Query3.Fields[0].AsInteger;
          end
         else   //현재 년도일때는  나누는 달수를 1월부터 현재달까지로 한다.
          begin
               NowYYMM:=formatDateTime('YYYYMM',NOW);
               NowMM:=Copy(NowYYMM,5,6);
               fyear := StrToInt(data1);
               fyymm := IntToStr(fyear)+'01';
               tyear := StrToInt(data1);
               tyymm := IntToStr(tyear)+'12';
               Query3.Close;
               Query3.SQL.Clear;
               Query3.SQL.ADD(' SELECT round(SUM(INWON)/'+NowMM+') ');
               Query3.SQL.ADD('   FROM PIHTONG a ');
//               Query3.SQL.ADD(' (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )b '); //2001.08.08 shm 추가
               Query3.SQL.ADD('  WHERE ((TONGYM between '''+fyymm+''' AND '''+tyymm+''' ) AND ');
               Query3.SQL.ADD('          (PAYCL <= ''93'')) ');  //99
//               Query3.SQL.ADD('    and   a.orgnum = b.value1    ');                                           //2001.08.08 shm 추가
               Query3.Open;
               binwon := Query3.Fields[0].AsInteger;
          end;
          {퇴직율을 계산한다.}
          if (sum2 <> 0) and (binwon <> 0) then begin
             rate1:= (sum2/binwon)*100;
             end
          else begin
             rate1:= 0;
             end;
          {100.각 자료를 해당 칸에 입력한다........................}
          begin
               uniname := data1;
          end;
          {3.끝....................................................}
          begin
               QRLuniname.caption := uniname;
               QRLi.Caption := FormatFloat('#,###', idatai);
               QRL1.Caption := FormatFloat('#,###', idata1);
               QRL2.Caption := FormatFloat('#,###', idata2);
               QRL3.Caption := FormatFloat('#,###', idata3);
               QRL4.Caption := FormatFloat('#,###', idata4);
               QRL5.Caption := FormatFloat('#,###', idata5);
               QRL6.Caption := FormatFloat('#,###', idata6);
               QRL7.Caption := FormatFloat('#,###', idata7);
               QRL8.Caption := FormatFloat('#,###', idata8);
               QRL9.Caption := FormatFloat('#,###', idata9);
               QRL10.Caption := FormatFloat('#,###', idata10);
               QRLs.Caption := FormatFloat('#,###', sum1);
               QRLt.Caption := FormatFloat('#,###', sum2);
               QRLInwon.Caption:= FormatFloat('#,###', binwon);
               if rate1 > 0 then
                  QRLr.Caption := FormatFloat('##0.0', rate1)
               else
                  QRLr.Caption := '';
          end;
          {100.의 끝...............................................}
     end;

end;

procedure TFpie20806.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     ymd : String;
begin            
     ymd := Fpie2080c.L_CurDate.Caption;
     QRLabel10.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
     QRLabel13.Caption := '[작업년월] : '+Copy(Mfr,1,4)+'년 '+Copy(Mfr,6,2)+'월'
                          +' ~ '+Copy(Mto,1,4)+'년 '+Copy(Mto,6,2)+'월';

end;

procedure TFpie20806.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     datacnt:= 0; Ci := 0;
     Fpie2080c.P_help.Caption := '자료를 추출 중입니다!';
     Application.Processmessages;

     tsumi := 0;  tsum1 := 0;  tsum2 := 0;  tsum3 := 0;  tsum4 := 0;
     tsum5 := 0;  tsum6 := 0;  tsum7 := 0;  tsum8 := 0;  tsum9 := 0;  tsumr := 0;
     jdata1 := 0; jdata2 := 0; jdata3 := 0; jdata4 := 0; jdatas := 0;
     tsum10 := 0; ttsum1 := 0; ttsum2 := 0;  //2002.07.12 shm 추가 
     {년도를 읽어 온다.......................................................}
     begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT DISTINCT(SUBSTR(TONGYM,1,4)) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND  ');
     Query1.SQL.ADD('         (TONGYM <='''+Mto+''') AND  ');
     Query1.SQL.ADD('         (PAYCL <= ''93'')) ');  //99
     Query1.SQL.ADD('  ORDER BY SUBSTR(TONGYM,1,4) ');
     Query1.Open;       //2001
     RecCount := Query1.RecordCount;
     end;

end;

procedure TFpie20806.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     tsumi := tsumi+idatai;
     tsum1 := tsum1+idata1;
     tsum2 := tsum2+idata2;
     tsum3 := tsum3+idata3;
     tsum4 := tsum4+idata4;
     tsum5 := tsum5+idata5;
     tsum6 := tsum6+idata6;
     tsum7 := tsum7+idata7;
     tsum8 := tsum8+idata8;
     tsum9 := tsum9+idata9;
     tsum10 := tsum10+idata10;
     tsumr := tsumr+binwon;

end;

procedure TFpie20806.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   trate : real;
begin
     ttsum1 := tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8+tsum9+tsum10;
     ttsum2 := tsumi+tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8+tsum9+tsum10;
     trate  := (tsumr / RecCount);      {년평균인원}
     if (ttsum2 <> 0) and (trate <> 0) then begin
         rate1:= (ttsum2/trate)*100;
         end
     else begin
         rate1:= 0;
         end;
     QRLsi.Caption := FormatFloat('#,###', tsumi);
     QRLs1.Caption := FormatFloat('#,###', tsum1);
     QRLs2.Caption := FormatFloat('#,###', tsum2);
     QRLs3.Caption := FormatFloat('#,###', tsum3);
     QRLs4.Caption := FormatFloat('#,###', tsum4);
     QRLs5.Caption := FormatFloat('#,###', tsum5);
     QRLs6.Caption := FormatFloat('#,###', tsum6);
     QRLs7.Caption := FormatFloat('#,###', tsum7);
     QRLs8.Caption := FormatFloat('#,###', tsum8);
     QRLs9.Caption := FormatFloat('#,###', tsum9);
     QRLs10.Caption := FormatFloat('#,###', tsum10);
     QRLss.Caption := FormatFloat('#,###', ttsum1);
     QRLst.Caption := FormatFloat('#,###', ttsum2);
     QRLInwonT.Caption := FormatFloat('#,###', trate);

     if rate1 > 0 then begin
        QRLsr.Caption := FormatFloat('##0.0', rate1);
        end
     else begin
        QRLsr.Caption := '';
        end;
     jdatas := jdata1+jdata2+jdata3+jdata4;
     QRLabel1.Caption := '☞ 특정직('+IntToStr(jdata3)+'명) : 특정직 '+IntToStr(jdata3);
   if Fpie2080c.RGdangYN.ItemIndex = 0 then
      lblMsg.Caption := '☞ (당연면직 포함)'
   else
      lblMsg.Caption := '☞ (당연면직 제외)';

end;

procedure TFpie20806.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
end;

procedure TFpie20806.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Fm_PreviewForm.Show;
end;

end.

