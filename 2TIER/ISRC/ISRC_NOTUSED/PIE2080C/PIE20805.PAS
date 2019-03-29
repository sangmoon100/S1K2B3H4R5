unit Pie20805;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Qrctrls, QuickRpt;

type
  TFpie20805 = class(TForm)
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
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRLuniname: TQRLabel;
    QRL3: TQRLabel;
    QRL4: TQRLabel;
    QRL5: TQRLabel;
    QRL6: TQRLabel;
    QRL7: TQRLabel;
    QRL8: TQRLabel;
    QRLs: TQRLabel;
    QRL2: TQRLabel;
    QuickReport1: TQuickRep;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    Query4: TQuery;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand4: TQRBand;
    QRLabel20: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs3: TQRLabel;
    QRLs4: TQRLabel;
    QRLs5: TQRLabel;
    QRLs6: TQRLabel;
    QRLs7: TQRLabel;
    QRLs8: TQRLabel;
    QRLss: TQRLabel;
    QRL1: TQRLabel;
    QRLr: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape54: TQRShape;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape37: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
//    procedure QRBand3BeforePrint(var PrintBand: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
  private
    { Private declarations }
    SQLCommand : string;
    RecCount   : integer;   {전체자료건수}
    PrtCount   : integer;   {출력건수}
  public
    { Public declarations }
  end;

var
  Fpie20805: TFpie20805;
  data1,data2,data3,data4,uniname,lpaycl,Mto,Mfr : String;
  idata,idata1,idata2,idata3,idata4,idata5,idata6,idata7,idata8: Integer;
  sdata,sdata1,sdata2,sdata3,sdata4,sdata5,sdata6,sdata7,sdata8: Integer;
  sum1, sum2, Tinwon,datacnt,Ci: Integer;
  rate1, rate2 : Real;

implementation

{$R *.DFM}

Uses e2080c, peprnView;

//procedure TFpie20805.QRBand3BeforePrint(var PrintBand: Boolean);
//begin
//end;

//procedure TFpie20805.QRBand2BeforePrint(var PrintBand: Boolean);
//end;

procedure TFpie20805.QuickReport1BeforePrint(var PrintReport: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     datacnt:= 0; Ci := 0;
     Fpie2080c.P_help.Caption := '자료를 추출 중입니다!';
     Application.Processmessages;

     {학교명을 읽어 온다.......................................................}
     begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT DISTINCT(GUBUN3) ');
     Query1.SQL.ADD('   FROM PIHSTON ');
     Query1.SQL.ADD('  WHERE (TONGYM >='''+Mfr+''') AND  ');
     Query1.SQL.ADD('        (TONGYM <='''+Mto+''')  AND  ');
//     Query1.SQL.ADD('        (PAYCL > ''00'') AND (PAYCL <= ''99'') AND ');
     Query1.SQL.ADD('        (PAYCL > ''N0'') AND (PAYCL <= ''W3'') AND ');
     Query1.SQL.ADD('        (GUBUN1 =''45'')  ');
     Query1.SQL.ADD('  ORDER BY GUBUN3 ');
     Query1.Open;
     RecCount:= Query1.RecordCount;
     end;

end;



procedure TFpie20805.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Mfr := Fpie2080c.Mfrym.Text;
     Mto := Fpie2080c.Mtoym.Text;
     idata  := 0;  idata1 := 0;  idata2 := 0;  idata3 := 0;  idata4 := 0;
     idata5 := 0;  idata6 := 0;  idata7 := 0;  idata8 := 0;  sum1 := 0;
     begin
          Inc(PrtCount);
          Fpie2080c.gauge1.Progress := (PrtCount * 100) div RecCount;
          if (PrtCount >= RecCount) then
             Fpie2080c.gauge1.Progress := 100;
          data1  := Query1.Fields[0].AsString;{발령구분 코드....}
{          data3  := Query1.Fields[1].AsString; 발령구분명 명......}
          If data1 = '' then begin
             SQLCommand := '  (GUBUN3 IS NULL)) ';
             end
          else begin
             SQLCommand := '  (GUBUN3 = '''+data1+''')) ';
             end;
          Query2.Close;
          Query2.SQL.Clear;
          Query2.SQL.ADD(' SELECT SUM(INWON),PAYCL ');
          Query2.SQL.ADD('   FROM PIHSTON ');
          Query2.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND ');
          Query2.SQL.ADD('         (TONGYM <='''+Mto+''') AND ');
//          Query2.SQL.ADD('         (PAYCL > ''00'') AND (PAYCL <= ''99'') AND ');
          Query2.SQL.ADD('         (PAYCL > ''N0'') AND (PAYCL <= ''W3'') AND ');
          Query2.SQL.ADD('         (GUBUN1 = ''45'') AND ');
          Query2.SQL.ADD(SQLCommand);
          Query2.SQL.ADD(' GROUP BY PAYCL');
          Query2.Open;
          {1.직급별 인원을 계산한다................................}
          while not Query2.EOF do
                 begin
                     data2 := Query2.Fields[1].AsString;
                     if (data2 = '10') then begin
                        idata1 := idata1 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '20') then begin
                        idata2 := idata2 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '30') then begin
                        idata3 := idata3 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '40') then begin
                        idata4 := idata4 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '50') then begin
                        idata5 := idata5 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '60') then begin
                        idata6 := idata6 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '70') then begin
                        idata7 := idata7 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '15') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '25') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '35') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '45') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '55') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '65') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '75') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '91') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '92') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end
                     else
                     if (data2 = '93') then begin
                        idata8 := idata8 + Query2.Fields[0].AsInteger;
                        end;
                     Query2.next;
                     end;
          {1.의 끝.................................................}
          {2.계와 총원을 구한다....................................}
          begin
          sum1 := idata1+idata2+idata3+idata4+idata5+idata6+idata7+idata8;
          end;
          {2.의 끝.................................................}
          {100.각 자료를 해당 칸에 입력한다........................}
          Query4.Close;
          Query4.SQL.Clear;
          Query4.SQL.ADD(' SELECT CODENAME ');
          Query4.SQL.ADD('   FROM PYCCODE ');
          Query4.SQL.ADD('  WHERE (CODEID = ''I142'') AND  ');
          Query4.SQL.ADD('        (CODENO = '''+data1+''') ');
          Query4.Open;
          data3 := Query4.Fields[0].AsString;
          if data3 <> '' then begin
             uniname := data3;{발령구분명...}
             end
          else begin
             uniname := data1;
             end;
          {3.끝....................................................}
          begin
               QRLuniname.caption := uniname;
               QRL1.Caption := FormatFloat('#,###', idata1);
               QRL2.Caption := FormatFloat('#,###', idata2);
               QRL3.Caption := FormatFloat('#,###', idata3);
               QRL4.Caption := FormatFloat('#,###', idata4);
               QRL5.Caption := FormatFloat('#,###', idata5);
               QRL6.Caption := FormatFloat('#,###', idata6);
               QRL7.Caption := FormatFloat('#,###', idata7);
               QRL8.Caption := FormatFloat('#,###', idata8);
               QRLs.Caption := FormatFloat('#,###', sum1);
               if (sum1 > 0) and (Tinwon > 0) then begin
                  rate1 := (sum1/Tinwon)*100;
                  end
               else begin
                  rate1 := 0;
                  end;
               if rate1 > 0 then
                  QRLr.Caption := FormatFloat('##0.0', rate1)
               else
                  QRLr.Caption := '';
          end;
          {100.의 끝...............................................}
     end;

end;

procedure TFpie20805.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     ymd : String;
begin
     ymd := Fpie2080c.L_CurDate.Caption;
     QRLabel3.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
     QRLabel1.Caption := '[작업년월] : '+Copy(Mfr,1,4)+'년 '+Copy(Mfr,5,2)+'월'
                          +' ~ '+Copy(Mto,1,4)+'년 '+Copy(Mto,5,2)+'월';

     sdata1 := 0;     sdata2 := 0;     sdata3 := 0;     sdata4 := 0;
     sdata5 := 0;     sdata6 := 0;     sdata7 := 0;     sdata8 := 0;
     sum2   := 0;
     {0.총인원을 구한다........................................................}
     begin
     Query4.Close;
     Query4.SQL.Clear;
     Query4.SQL.ADD(' SELECT SUM(INWON),PAYCL ');
     Query4.SQL.ADD('   FROM PIHSTON ');
     Query4.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND ');
     Query4.SQL.ADD('         (TONGYM <='''+Mto+''') AND ');
//     Query4.SQL.ADD('         (PAYCL > ''00'') AND  (PAYCL <= ''99'') AND ');
     Query4.SQL.ADD('         (PAYCL > ''N0'') AND  (PAYCL <= ''W3'') AND ');
     Query4.SQL.ADD('         (GUBUN1 = ''45''))');
     Query4.SQL.ADD('  GROUP BY PAYCL ');
     Query4.Open;
     while not Query4.EOF do
                begin
                     data4 := Query4.Fields[1].AsString;{직급}
                     if (data4 = '10') then begin
                        sdata1 := sdata1+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '20') then begin
                        sdata2 := sdata2+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '30') then begin
                        sdata3 := sdata3+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '40') then begin
                        sdata4 := sdata4+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '50') then begin
                        sdata5 := sdata5+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '60') then begin
                        sdata6 := sdata6+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '70') then begin
                        sdata7 := sdata7+Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '15') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '25') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '35') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '45') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '55') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '65') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '75') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '91') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '92') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end
                     else
                     if (data4 = '93') then begin
                        sdata8 := sdata8 + Query4.Fields[0].AsInteger;
                        end;
                     Query4.next;
                end;
          {1.의 끝.................................................}
          {2.계와 총원을 구한다....................................}
          begin
          sum2 := sdata1+sdata2+sdata3+sdata4+sdata5+sdata6+sdata7+sdata8;
          tinwon := sum2;
          end;
          {총계란에 값을 넣는다.............}
          QRLs1.Caption := FormatFloat('#,###', sdata1);
          QRLs2.Caption := FormatFloat('#,###', sdata2);
          QRLs3.Caption := FormatFloat('#,###', sdata3);
          QRLs4.Caption := FormatFloat('#,###', sdata4);
          QRLs5.Caption := FormatFloat('#,###', sdata5);
          QRLs6.Caption := FormatFloat('#,###', sdata6);
          QRLs7.Caption := FormatFloat('#,###', sdata7);
          QRLs8.Caption := FormatFloat('#,###', sdata8);
          QRLss.Caption := FormatFloat('#,###', sum2);
     end;

     {0.의 끝..................................................................}

end;

procedure TFpie20805.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

end.

