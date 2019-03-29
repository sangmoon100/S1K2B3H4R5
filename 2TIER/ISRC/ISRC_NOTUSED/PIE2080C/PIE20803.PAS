unit Pie20803;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Qrctrls, QuickRpt;

type
  TFpie20803 = class(TForm)
    Query3: TQuery;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRShape4: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape53: TQRShape;
    QRLabel7: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRLuniname: TQRLabel;
    QRL3: TQRLabel;
    QRL5: TQRLabel;
    QRL6: TQRLabel;
    QRL7: TQRLabel;
    QRL8: TQRLabel;
    QRL2: TQRLabel;
    QuickReport1: TQuickRep;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    Query4: TQuery;
    QRBand4: TQRBand;
    QRL1: TQRLabel;
    QRLs: TQRLabel;
    QRShape1: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs3: TQRLabel;
    QRLs5: TQRLabel;
    QRLs6: TQRLabel;
    QRLs7: TQRLabel;
    QRLs8: TQRLabel;
    QRLsr: TQRLabel;
    QRLstt: TQRLabel;
    QRLabel1: TQRLabel;
    QRL4: TQRLabel;
    QRLs4: TQRLabel;
    QRLtt: TQRLabel;
    QRLst: TQRLabel;
    QRLr: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLyear: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape10: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape21: TQRShape;
    QRShape56: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRShape52: TQRShape;
    QRShape57: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
//    procedure QRBand3BeforePrint(var PrintBand: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
//    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
//    procedure QRBand3AfterPrint(BandPrinted: Boolean);
//    procedure QRBand4BeforePrint(var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
  private
    { Private declarations }
    SQLCommand : string;
    RecCount : integer;   {전체자료건수}
    PrtCount : integer;   {출력건수}
  public
    { Public declarations }
  end;

var
  Fpie20803: TFpie20803;
  data1,data2,data4,uniname,lpaycl,Mto,Mfr : String;
  idata1,idata2,idata3,idata4,idata5,idata6,idata7,idata8: Integer;
  tsum1,tsum2,tsum3,tsum4,tsum5,tsum6,tsum7,tsum8,tsumr: Integer;
  data3,idata,sum1,sum2,ttsum1,ttsum2,Tinwon,datacnt,Ci,Li: Integer;
  jdata1,jdata2,jdata3,jdata4,jdatas: Integer;{특정직을 위한 comment}
  rate1,trate : Real;
  tyear,binwon: Integer;{년도 변환용..}
  ydata,tyymm: String; {키로 사용할 년월}

implementation

{$R *.DFM}

Uses e2080c, peprnView;

//procedure TFpie20803.QRBand3BeforePrint(var PrintBand: Boolean);
//begin
//end;

//procedure TFpie20803.QRBand2BeforePrint(var PrintBand: Boolean);
//end;

//procedure TFpie20803.QuickReport1BeforePrint(var PrintReport: Boolean);
//begin
//end;

//procedure TFpie20803.QRBand3AfterPrint(BandPrinted: Boolean);
//begin
//end;

//procedure TFpie20803.QRBand4BeforePrint(var PrintBand: Boolean);
//begin
//end;

procedure TFpie20803.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     idata1 := 0;  idata2 := 0;  idata3 := 0;  idata4 := 0;  idata5 := 0;
     idata6 := 0;  idata7 := 0;  idata8 := 0;  sum1 := 0;
     begin
          Inc(PrtCount);
          Fpie2080c.gauge1.Progress := (PrtCount * 100) div RecCount;
          if (PrtCount >= RecCount) then
             Fpie2080c.gauge1.Progress := 100;
          data1  := Query1.Fields[0].AsString;{년월....}
          {data3  := Query1.Fields[1].AsInteger;{퇴직인원}
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.ADD(' SELECT SUM(RTINWON), PAYCL         ');
          Query2.SQL.ADD('   FROM PIHTONG                     ');
          Query2.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND ');
          Query2.SQL.ADD('         (TONGYM <='''+Mto+''') AND ');
//        Query2.SQL.ADD('         (PAYCL <= ''99'') AND      ');
//        Query2.SQL.ADD('         (PAYCL > ''00'') AND       ');
          Query2.SQL.ADD('         (PAYCL <= ''W3'') AND      ');
          Query2.SQL.ADD('         (PAYCL > ''N0'') AND       ');
          Query2.SQL.ADD('         (TONGYM = '''+data1+''')) ');
          Query2.SQL.ADD(' GROUP BY PAYCL                    ');
          Query2.Open;
          {1.직급별 인원을 계산한다................................}
          while not Query2.EOF do
                 begin
                     data2 := Query2.Fields[1].AsString;
                     if (data2 = 'O0') then begin  //기존(10)
                        idata1 := idata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'P0') then begin  //기존(20)
                        idata2 := idata2 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'Q0') then begin  //기존(30)
                        idata3 := idata3 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'R0') then begin  //기존(40)
                        idata4 := idata4 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'S0') then begin  //기존(50)
                        idata5 := idata5 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'T0') then begin  //기존(60)
                        idata6 := idata6 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'U0') then begin  //기존(70)
                        idata7 := idata7 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'O5') then begin  //기존(15)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'P5') then begin  //기존(25)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'Q5') then begin  //기존(35)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'R5') then begin  //기존(45)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'S5') then begin  //기존(55)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'T5') then begin  //기존(65)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'U5') then begin  //기존(75)
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata1 := jdata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'W1') then begin    {특정기술직(91)}
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata3 := jdata3 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'W2') then begin    {특수직(92)}
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata2 := jdata2 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = 'W3') then begin    {특정행정직(93)}
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        jdata4 := jdata4 + Query2.Fields[0].AsInteger;
                        end;
                     Query2.next;
                     end;
          {1.의 끝.................................................}
          {2.계와 총원을 구한다....................................}
          begin
          sum1 := idata1+idata2+idata3+idata4+idata5+idata6+idata7+idata8;
          end;
          {2.의 끝.................................................}
          {전년도말인원을 구한다...............}
          begin
               ydata := Copy(data1,1,6);
               tyear := StrToInt(Copy(ydata,1,4));
               if Copy(ydata,5,2) = '01' then begin
                  tyymm := IntToStr(tyear-1)+'12';
                  end
               else begin
                  tyymm := IntToStr(StrToInt(ydata)-1);
                  end;
               Query3.Close;
               Query3.SQL.Clear;
               Query3.SQL.ADD(' SELECT SUM(INWON) ');
               Query3.SQL.ADD('   FROM PIHTONG ');
               Query3.SQL.ADD('  WHERE ((TONGYM = '''+tyymm+''') AND ');
//               Query3.SQL.ADD('         (PAYCL > ''00'') AND (PAYCL <= ''99'')) ');
               Query3.SQL.ADD('         (PAYCL > ''N0'') AND (PAYCL <= ''W3'')) ');
               Query3.Open;
               binwon := Query3.Fields[0].AsInteger;
          end;
          Query3.Close;
          {퇴직율을 계산한다.}
          if (sum1 <> 0) and (binwon <> 0) then begin
             rate1:= (sum1/binwon)*100;
             end
          else begin
             rate1:= 0;
             end;
          {퇴직율을 보여준다.}
{          if rate1 > 0 then begin}
             QRLr.Caption := '(' + FormatFloat('##0.0', rate1) + '%)';
{             end
          else begin
             QRLr.Caption := '(0.0)';
             end;}

          {100.각 자료를 해당 칸에 입력한다........................}
          begin
               uniname := data1;
          end;
          {3.끝....................................................}
          begin
               QRLuniname.caption := Copy(uniname,1,4)+'년'+Copy(uniname,5,2)+'월';
               QRL1.Caption := FormatFloat('#,###', idata1);
               QRL2.Caption := FormatFloat('#,###', idata2);
               QRL3.Caption := FormatFloat('#,###', idata3);
               QRL4.Caption := FormatFloat('#,###', idata4);
               QRL5.Caption := FormatFloat('#,###', idata5);
               QRL6.Caption := FormatFloat('#,###', idata6);
               QRL7.Caption := FormatFloat('#,###', idata7);
               QRL8.Caption := FormatFloat('#,###', idata8);
               QRLs.Caption := FormatFloat('#,###', sum1);
               QRLtt.Caption:= '[' + FormatFloat('#,###', binwon) + ']';
          end;
          {100.의 끝...............................................}
     end;

end;

procedure TFpie20803.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     ymd : String;
begin
     ymd := Fpie2080c.L_CurDate.Caption;
     QRLabel12.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
     QRLabel13.Caption := '[작업년월] : '+Copy(Mfr,1,4)+'년 '+Copy(Mfr,5,2)+'월'
                          +' ~ '+Copy(Mto,1,4)+'년 '+Copy(Mto,5,2)+'월'; 
     QRLyear.Caption   := Copy(Mto,1,4);

end;

procedure TFpie20803.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     ttsum1 := tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8;
     trate  := tsumr/Li;
     if (ttsum1 <> 0) and (trate <> 0) then begin {ttsum1:퇴직계,trate:평균인원}
         rate1:= (ttsum1/trate)*100;
         end
     else begin
         rate1:= 0;
         end;
     QRLs1.Caption := FormatFloat('#,###', tsum1);
     QRLs2.Caption := FormatFloat('#,###', tsum2);
     QRLs3.Caption := FormatFloat('#,###', tsum3);
     QRLs4.Caption := FormatFloat('#,###', tsum4);
     QRLs5.Caption := FormatFloat('#,###', tsum5);
     QRLs6.Caption := FormatFloat('#,###', tsum6);
     QRLs7.Caption := FormatFloat('#,###', tsum7);
     QRLs8.Caption := FormatFloat('#,###', tsum8);
     QRLst.Caption := FormatFloat('#,###', ttsum1);
     QRLstt.Caption:= '[' + FormatFloat('#,###', trate) + ']';
     QRLsr.Caption := '(' + FormatFloat('##0.0', rate1) + '%)';
     jdatas := jdata1+jdata2+jdata3+jdata4;

end;

procedure TFpie20803.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     datacnt:= 0; Ci := 0;
     Li := 0;
     Fpie2080c.P_help.Caption := '자료를 추출 중입니다!';
     Application.Processmessages;

     tsum1 := 0;  tsum2 := 0;  tsum3 := 0;  tsum4 := 0;   tsum5 := 0;
     tsum6 := 0;  tsum7 := 0;  tsum8 := 0;  jdata1 := 0;  jdata2 := 0;  tsumr := 0;
     jdata3 := 0; jdata4 := 0; jdatas := 0;
     {년도를 읽어 온다.......................................................}
//     Query1.SQL.ADD('         (PAYCL > ''00'') AND  ');
//     Query1.SQL.ADD('         (PAYCL <= ''99'')) ');

     begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT DISTINCT(TONGYM)             ');
     Query1.SQL.ADD('   FROM PIHTONG                      ');
     Query1.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND  ');
     Query1.SQL.ADD('         (TONGYM <='''+Mto+''') AND  ');
     Query1.SQL.ADD('         (PAYCL > ''N0'') AND        ');
     Query1.SQL.ADD('         (PAYCL <= ''W3''))          ');

     Query1.SQL.ADD('  ORDER BY TONGYM                    ');
     Query1.Open;
     RecCount := Query1.RecordCount;
     end;

end;

procedure TFpie20803.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     tsum1 := tsum1+idata1;
     tsum2 := tsum2+idata2;
     tsum3 := tsum3+idata3;
     tsum4 := tsum4+idata4;
     tsum5 := tsum5+idata5;
     tsum6 := tsum6+idata6;
     tsum7 := tsum7+idata7;
     tsum8 := tsum8+idata8;
     tsumr := tsumr+binwon;
     Li    := Li+1;
end;

procedure TFpie20803.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

end.

