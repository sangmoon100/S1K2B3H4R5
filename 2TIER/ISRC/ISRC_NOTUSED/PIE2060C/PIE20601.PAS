unit Pie20601;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, ExtCtrls, DB, DBTables, Qrctrls;


type
  TFpie20601 = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    QuickReport1: TQuickRep;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLdate: TQRLabel;
    QRLaaak7: TQRShape;
    QRShape3: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLa1: TQRLabel;
    QRLwe: TQRLabel;
    QRLws: TQRLabel;
    QRLwtr: TQRLabel;
    QRLa2: TQRLabel;
    QRLa3: TQRLabel;
    QRLa4: TQRLabel;
    QRLa5: TQRLabel;
    QRLa6: TQRLabel;
    QRLa7: TQRLabel;
    QRLas: TQRLabel;
    QRLar: TQRLabel;
    QRLatr: TQRLabel;
    QRLc1r: TQRLabel;
    QRLc2r: TQRLabel;
    QRLc3r: TQRLabel;
    QRLc4r: TQRLabel;
    QRLc5r: TQRLabel;
    QRLc6r: TQRLabel;
    QRLc7r: TQRLabel;
    QRLcrs: TQRLabel;
    QRLc1: TQRLabel;
    QRLc2: TQRLabel;
    QRLc3: TQRLabel;
    QRLc4: TQRLabel;
    QRLc5: TQRLabel;
    QRLc6: TQRLabel;
    QRLc7: TQRLabel;
    QRLcs: TQRLabel;
    QRLcr: TQRLabel;
    QRLctr: TQRLabel;
    QRLb1r: TQRLabel;
    QRLb2r: TQRLabel;
    QRLb3r: TQRLabel;
    QRLb4r: TQRLabel;
    QRLb5r: TQRLabel;
    QRLb6r: TQRLabel;
    QRLb7r: TQRLabel;
    QRLbrs: TQRLabel;
    QRLb1: TQRLabel;
    QRLb2: TQRLabel;
    QRLb3: TQRLabel;
    QRLb4: TQRLabel;
    QRLb5: TQRLabel;
    QRLb6: TQRLabel;
    QRLb7: TQRLabel;
    QRLbs: TQRLabel;
    QRLbr: TQRLabel;
    QRLbtr: TQRLabel;
    QRLa1r: TQRLabel;
    QRLa2r: TQRLabel;
    QRLa3r: TQRLabel;
    QRLa4r: TQRLabel;
    QRLa5r: TQRLabel;
    QRLa6r: TQRLabel;
    QRLa7r: TQRLabel;
    QRLars: TQRLabel;
    QRLd1: TQRLabel;
    QRLd2: TQRLabel;
    QRLd3: TQRLabel;
    QRLd4: TQRLabel;
    QRLd5: TQRLabel;
    QRLd6: TQRLabel;
    QRLd7: TQRLabel;
    QRLds: TQRLabel;
    QRLdr: TQRLabel;
    QRLdtr: TQRLabel;
    QRLd1r: TQRLabel;
    QRLd2r: TQRLabel;
    QRLd3r: TQRLabel;
    QRLd4r: TQRLabel;
    QRLd5r: TQRLabel;
    QRLd6r: TQRLabel;
    QRLd7r: TQRLabel;
    QRLdrs: TQRLabel;
    QRLe1: TQRLabel;
    QRLe2: TQRLabel;
    QRLe3: TQRLabel;
    QRLe4: TQRLabel;
    QRLe5: TQRLabel;
    QRLe6: TQRLabel;
    QRLe7: TQRLabel;
    QRLes: TQRLabel;
    QRLer: TQRLabel;
    QRLetr: TQRLabel;
    QRLe1r: TQRLabel;
    QRLe2r: TQRLabel;
    QRLe3r: TQRLabel;
    QRLe4r: TQRLabel;
    QRLe5r: TQRLabel;
    QRLe6r: TQRLabel;
    QRLe7r: TQRLabel;
    QRLers: TQRLabel;
    QRLsts: TQRLabel;
    QRLst1: TQRLabel;
    QRLst2: TQRLabel;
    QRLst3: TQRLabel;
    QRLst4: TQRLabel;
    QRLst5: TQRLabel;
    QRLst6: TQRLabel;
    QRLst7: TQRLabel;
    QRLsr1: TQRLabel;
    QRLsr3: TQRLabel;
    QRLsr2: TQRLabel;
    QRLsr5: TQRLabel;
    QRLsr4: TQRLabel;
    QRLsr6: TQRLabel;
    QRLsr10: TQRLabel;
    QRLsr7: TQRLabel;
    QRLsrs: TQRLabel;
    QRLhs: TQRLabel;
    QRLstr: TQRLabel;
    QRLsttr: TQRLabel;
    QRLhtr: TQRLabel;
    QRLtt10: TQRLabel;
    QRLhe: TQRLabel;
    QRLtt: TQRLabel;
    QRLtts: TQRLabel;
    QRLrrs: TQRLabel;
    QRLst10: TQRLabel;
    QRLtt7: TQRLabel;
    QRLtt6: TQRLabel;
    QRLrr10: TQRLabel;
    QRLtt2: TQRLabel;
    QRLtt3: TQRLabel;
    QRLtt1: TQRLabel;
    QRLrr1: TQRLabel;
    QRLrr2: TQRLabel;
    QRLrr3: TQRLabel;
    QRLrr4: TQRLabel;
    QRLrr5: TQRLabel;
    QRLrr6: TQRLabel;
    QRLrr7: TQRLabel;
    QRLtt5: TQRLabel;
    QRLtt4: TQRLabel;
    QRLabel58: TQRLabel;
    QRLjobym: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape14: TQRShape;
    QRShape40: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape43: TQRShape;
    QRShape2: TQRShape;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRLabel21: TQRLabel;
    QRShape22: TQRShape;
    QRLa8: TQRLabel;
    QRLa9: TQRLabel;
    QRLa8r: TQRLabel;
    QRLb8: TQRLabel;
    QRLb8r: TQRLabel;
    QRLc8: TQRLabel;
    QRLc8r: TQRLabel;
    QRLd8: TQRLabel;
    QRLd8r: TQRLabel;
    QRLe8: TQRLabel;
    QRLe8r: TQRLabel;
    QRLst8: TQRLabel;
    QRLsr8: TQRLabel;
    QRLa9r: TQRLabel;
    QRLb9: TQRLabel;
    QRLb9r: TQRLabel;
    QRLc9: TQRLabel;
    QRLc9r: TQRLabel;
    QRLd9: TQRLabel;
    QRLd9r: TQRLabel;
    QRLe9: TQRLabel;
    QRLe9r: TQRLabel;
    QRLst9: TQRLabel;
    QRLsr9: TQRLabel;
    QRLtt8: TQRLabel;
    QRLrr8: TQRLabel;
    QRLtt9: TQRLabel;
    QRLrr9: TQRLabel;
    QRLe10: TQRLabel;
    QRLe10r: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape23: TQRShape;
    QRShape26: TQRShape;
    QRLabel24: TQRLabel;
    QRLtte: TQRLabel;
    QRLrre: TQRLabel;
    QRLtt0: TQRLabel;
    QRLrr0: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    QRLcon: TQRLabel;
    QRLcontr: TQRLabel;
    QRLcon1: TQRLabel;
    QRLcte: TQRLabel;
    QRLconrr: TQRLabel;
    QRLa10: TQRLabel;
    QRLa10r: TQRLabel;
    QRLb10: TQRLabel;
    QRLb10r: TQRLabel;
    QRLc10: TQRLabel;
    QRLc10r: TQRLabel;
    QRLd10: TQRLabel;
    QRLd10r: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape7: TQRShape;
    QRShape18: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape35: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLsre: TQRLabel;
    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
    procedure QRBand2BeforePrint(var PrintBand: Boolean);
  private
    { Private declarations }
    Areport : TQuickRep;
    SortBy : string;     {X : 작성구분}
    ImWonCount : integer;
    procedure ScreenClear;
    procedure DataClear;
    procedure SdataClear;
    procedure Whiledata1;
    procedure Whiledata2;
    procedure HaveData;
  public
    { Public declarations }
  end;

var
  Fpie20601: TFpie20601;
  Tempcl,Ltongym,ljobline : String;

  Tinwon,Rinwon,Tempin:Integer;
  data0, data1, data2, data3, data4, data5, data6, data7, data8, data9 :Integer;
  sdata1, sdata2, sdata3, sdata4, sdata5, sdata6, sdata7, sdata8, sdata9 :Integer;
  tdata1, tdata2, tdata3, tdata4, tdata5, tdata6, tdata7, tdata8, tdata9 :Integer;
  rdat1, rdat2, rdat3, rdat4, rdat5, rdat6, rdat7, rdat8, rdat9, rdat10: Real;
implementation
{$R *.DFM}

Uses e2060c, Pie20602;

procedure TFpie20601.ScreenClear;
begin
     QRLwe.Caption  := '';   QRLws.Caption  := '';   QRLwtr.Caption := '';

     QRLa1.Caption  := '';   QRLa2.Caption  := '';   QRLa3.Caption  := '';
     QRLa4.Caption  := '';   QRLa5.Caption  := '';   QRLa6.Caption  := '';
     QRLa7.Caption  := '';   QRLas.Caption  := '';   QRLar.Caption  := '';
     QRLatr.Caption := '';

     QRLb1.Caption  := '';   QRLb2.Caption  := '';   QRLb3.Caption  := '';
     QRLb4.Caption  := '';   QRLb5.Caption  := '';   QRLb6.Caption  := '';
     QRLb7.Caption  := '';   QRLbs.Caption  := '';   QRLbr.Caption  := '';
     QRLbtr.Caption := '';

     QRLc1.Caption  := '';   QRLc2.Caption  := '';   QRLc3.Caption  := '';
     QRLc4.Caption  := '';   QRLc5.Caption  := '';   QRLc6.Caption  := '';
     QRLc7.Caption  := '';   QRLcs.Caption  := '';   QRLcr.Caption  := '';
     QRLctr.Caption := '';

     QRLd1.Caption  := '';   QRLd2.Caption  := '';   QRLd3.Caption  := '';
     QRLd4.Caption  := '';   QRLd5.Caption  := '';   QRLd6.Caption  := '';
     QRLd7.Caption  := '';   QRLds.Caption  := '';   QRLdr.Caption  := '';
     QRLdtr.Caption := '';

     QRL1s1.Caption  := '';  QRL1s2.Caption  := '';  QRL1s3.Caption  := '';
     QRL1s4.Caption  := '';  QRL1s5.Caption  := '';  QRL1s6.Caption  := '';
     QRL1s7.Caption  := '';  QRL1ss.Caption  := '';  QRL1sr.Caption  := '';
     QRL1str.Caption := '';

     QRL1r1.Caption  := '';  QRL1r2.Caption  := '';  QRL1r3.Caption  := '';
     QRL1r4.Caption  := '';  QRL1r5.Caption  := '';  QRL1r6.Caption  := '';
     QRL1r7.Caption  := '';  QRL1rs.Caption  := '';

     QRle1.Caption  := '';   QRle2.Caption  := '';   QRle3.Caption  := '';
     QRle4.Caption  := '';   QRle5.Caption  := '';   QRle6.Caption  := '';
     QRle7.Caption  := '';   QRles.Caption  := '';   QRler.Caption  := '';
     QRletr.Caption := '';

     QRLf1.Caption  := '';   QRLf2.Caption  := '';   QRLf3.Caption  := '';
     QRLf4.Caption  := '';   QRLf5.Caption  := '';   QRLf6.Caption  := '';
     QRLf7.Caption  := '';   QRLfs.Caption  := '';   QRLfr.Caption  := '';
     QRLftr.Caption := '';

     QRLg1.Caption  := '';   QRLg2.Caption  := '';   QRLg3.Caption  := '';
     QRLg4.Caption  := '';   QRLg5.Caption  := '';   QRLg6.Caption  := '';
     QRLg7.Caption  := '';   QRLgs.Caption  := '';   QRLgr.Caption  := '';
     QRLgtr.Caption := '';

     QRL2s1.Caption  := '';  QRL2s2.Caption  := '';  QRL2s3.Caption  := '';
     QRL2s4.Caption  := '';  QRL2s5.Caption  := '';  QRL2s6.Caption  := '';
     QRL2s7.Caption  := '';  QRL2ss.Caption  := '';  QRL2sr.Caption  := '';
     QRL2str.Caption := '';

     QRL2r1.Caption  := '';  QRL2r2.Caption  := '';  QRL2r3.Caption  := '';
     QRL2r4.Caption  := '';  QRL2r5.Caption  := '';  QRL2r6.Caption  := '';
     QRL2r7.Caption  := '';  QRL2rs.Caption  := '';

     {
     QRLh1.Caption  := '';   QRLh2.Caption  := '';   QRLh3.Caption  := '';
     QRLh4.Caption  := '';   QRLh5.Caption  := '';   QRLh6.Caption  := '';
     QRLh7.Caption  := '';   QRLhe.Caption  := '';   QRLhs.Caption  := '';
     QRLhr.Caption  := '';   QRLhtr.Caption := '';

     QRLi1.Caption  := '';   QRLi2.Caption  := '';   QRLi3.Caption  := '';
     QRLi4.Caption  := '';   QRLi5.Caption  := '';   QRLi6.Caption  := '';
     QRLi7.Caption  := '';   QRLie.Caption  := '';   QRLis.Caption  := '';
     QRLir.Caption  := '';   QRLitr.Caption := '';
     }
     QRLj1.Caption  := '';   QRLj2.Caption  := '';   QRLj3.Caption  := '';
     QRLj4.Caption  := '';   QRLj5.Caption  := '';   QRLj6.Caption  := '';
     QRLj7.Caption  := '';   QRLje.Caption  := '';   QRLjs.Caption  := '';
     QRLjr.Caption  := '';   QRLjtr.Caption := '';

     QRLk1.Caption  := '';   QRLk2.Caption  := '';   QRLk3.Caption  := '';
     QRLk4.Caption  := '';   QRLk5.Caption  := '';   QRLk6.Caption  := '';
     QRLk7.Caption  := '';   QRLje.Caption  := '';   QRLks.Caption  := '';
     QRLkr.Caption  := '';   QRLktr.Caption := '';

     QRL3s1.Caption  := '';  QRL3s2.Caption  := '';  QRL3s3.Caption  := '';
     QRL3s4.Caption  := '';  QRL3s5.Caption  := '';  QRL3s6.Caption  := '';
     QRL3s7.Caption  := '';  QRL3se.Caption  := '';  QRL3ss.Caption  := '';
     QRL3sr.Caption  := '';  QRL3str.Caption := '';

     QRL3r1.Caption  := '';  QRL3r2.Caption  := '';  QRL3r3.Caption  := '';
     QRL3r4.Caption  := '';  QRL3r5.Caption  := '';  QRL3r6.Caption  := '';
     QRL3r7.Caption  := '';  QRL3re.Caption  := '';  QRL3rs.Caption  := '';

     QRLst1.Caption  := '';  QRLst2.Caption  := '';  QRLst3.Caption  := '';
     QRLst4.Caption  := '';  QRLst5.Caption  := '';  QRLst6.Caption  := '';
     QRLst7.Caption  := '';  QRLste.Caption  := '';  QRLsts.Caption  := '';
     QRLstr.Caption  := '';  QRLsttr.Caption := '';

     QRLsr1.Caption  := '';  QRLsr2.Caption  := '';  QRLsr3.Caption  := '';
     QRLsr4.Caption  := '';  QRLsr5.Caption  := '';  QRLsr6.Caption  := '';
     QRLsr7.Caption  := '';  QRLsre.Caption  := '';  QRLsrs.Caption  := '';

     QRLle.Caption   := '';  QRLls.Caption   := '';  QRLltr.Caption  := '';
     QRLme.Caption   := '';  QRLms.Caption   := '';  QRLmtr.Caption  := '';
     QRLne.Caption   := '';  QRLns.Caption   := '';  QRLntr.Caption  := '';
{     QRLoe.Caption   := '';  QRLos.Caption   := '';  QRLotr.Caption  := '';}
     QRL4se.Caption  := '';  QRL4ss.Caption  := '';  QRL4str.Caption := '';

     QRLtt1.Caption  := '';  QRLtt2.Caption  := '';  QRLtt3.Caption  := '';
     QRLtt4.Caption  := '';  QRLtt5.Caption  := '';  QRLtt6.Caption  := '';
     QRLtt7.Caption  := '';  QRLtt8.Caption  := '';  QRLtt9.Caption  := '';
     QRLtt0.Caption := '';

     QRLrr1.Caption  := '';  QRLrr2.Caption  := '';  QRLrr3.Caption  := '';
     QRLrr4.Caption  := '';  QRLrr5.Caption  := '';  QRLrr6.Caption  := '';
     QRLrr7.Caption  := '';  QRLrr8.Caption  := '';  QRLrr9.Caption  := '';
end;

procedure TFpie20601.QuickReport1BeforePrint(var PrintReport: Boolean);
var
   Cdate : string;
begin
     Tinwon := 0;  Rinwon := 0; data1 := 0;  data2 := 0;
     Cdate := Fpie2060c.L_CurDate.Caption;
     QRLdate.Caption := Copy(Cdate,1,4)+'/'+Copy(CDate,6,2)+'/'+Copy(CDate,9,2);
     Ltongym := Fpie2060c.Mrunyymm.text;
     QRLjobym.Caption := Copy(Ltongym, 1, 4) + '년 ' + Copy(Ltongym, 5, 2) + '월';
     ScreenClear;

     Fpie2060c.P_help.Caption := '전체인원수를 계산중입니다.';
     Application.Processmessages;
     begin{전체인원을 구한다.}
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE (TONGYM = '''+ltongym+''')');
     Query1.Open;
     while not Query1.EOF do
           begin
                data1 := Query1.Fields[0].AsInteger;{인원 총계}
//                jjh   := Query1.Fields[0].AsString;
                Tinwon := Tinwon + data1;
                Query1.next
           end;
     end;
     Fpie2060c.P_help.Caption := '정규직 인원수를 계산중입니다.';
     Application.Processmessages;
     begin{정규직인원을 구한다.}
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND ');
     Query1.SQL.ADD('       (JOBLINE > ''N0'') AND (JOBLINE <= ''S1'')) ');
     Query1.Open;
     while not Query1.EOF do
           begin
                data2 := Query1.Fields[0].AsInteger;{인원 총계}
//                jjh   := Query1.Fields[0].AsString;
                Rinwon := Rinwon + data2;
                Query1.next
           end;
     end;
     Query1.Close;
     Fpie2060c.Gauge1.Progress := 5;
end;


procedure TFpie20601.QRBand2BeforePrint(var PrintBand: Boolean);
begin
      tdata1 := 0;   tdata2 := 0;   tdata3 := 0;  tdata4 := 0;    tdata5 := 0;
      tdata6 := 0;   tdata7 := 0;   tdata8 := 0;  tdata9 := 0;    ImWonCount := 0;
     {1.임원 해당 데이타를 가져온다......}
     Fpie2060c.P_help.Caption := '직렬별 인원수를 계산중입니다.';
     Application.Processmessages;
     begin
     dataclear;
     ljobline := 'N0';
     HaveData;
     Tempcl := Query1.Fields[0].AsString;{직급}
     Tempin := Query1.Fields[1].AsInteger;{직급별인원}
           while not Query1.EOF do
                 begin
                      data1 := data1 + tempin;
                      Query1.next;
                 end;
                 QRLwe.Caption := FormatFloat('#,##', data1);
                 QRLws.Caption := FormatFloat('##,##', data1);
                 if data1 > 0 then begin
                  rdat1 := (data1/Tinwon)*100;
                  end
                 else begin
                  rdat1 := 0;
                  end;
                 if rdat1 <> 0 then
                    QRLwtr.Caption := FormatFloat('##0.0', rdat1);
     end;
     ImWonCount := data1;       {임원수를 일단 저장}
     Fpie2060c.Gauge1.Progress := 9;
     {2.관리영업 해당 데이타를 가져온다......}
     begin
     SdataClear;
     dataclear;
     ljobline := 'O1';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLa1.Caption := FormatFloat('#,##', data1);
                      QRLa2.Caption := FormatFloat('#,##', data2);
                      QRLa3.Caption := FormatFloat('#,##', data3);
                      QRLa4.Caption := FormatFloat('#,##', data4);
                      QRLa5.Caption := FormatFloat('#,##', data5);
                      QRLa6.Caption := FormatFloat('#,##', data6);
                      QRLa7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLas.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;  Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;  Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;  Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLar.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLatr.Caption := FormatFloat('##0.0', rdat2);
                 end;
     Fpie2060c.Gauge1.Progress := 12;
     {3.통신영업 해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'O2';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLb1.Caption := FormatFloat('#,##', data1);
                      QRLb2.Caption := FormatFloat('#,##', data2);
                      QRLb3.Caption := FormatFloat('#,##', data3);
                      QRLb4.Caption := FormatFloat('#,##', data4);
                      QRLb5.Caption := FormatFloat('#,##', data5);
                      QRLb6.Caption := FormatFloat('#,##', data6);
                      QRLb7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLbs.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;  Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;  Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;  Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLbr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLbtr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 16;
     {4.전산기술 해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'O3';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLc1.Caption := FormatFloat('#,##', data1);
                      QRLc2.Caption := FormatFloat('#,##', data2);
                      QRLc3.Caption := FormatFloat('#,##', data3);
                      QRLc4.Caption := FormatFloat('#,##', data4);
                      QRLc5.Caption := FormatFloat('#,##', data5);
                      QRLc6.Caption := FormatFloat('#,##', data6);
                      QRLc7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLcs.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLcr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLctr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 19;
     {5.시설기술 해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'O4';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLd1.Caption := FormatFloat('#,##', data1);
                      QRLd2.Caption := FormatFloat('#,##', data2);
                      QRLd3.Caption := FormatFloat('#,##', data3);
                      QRLd4.Caption := FormatFloat('#,##', data4);
                      QRLd5.Caption := FormatFloat('#,##', data5);
                      QRLd6.Caption := FormatFloat('#,##', data6);
                      QRLd7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLds.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;  Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;  Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;  Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLdr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLdtr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 23;
     {일반계를 보여준다..............}
     QRL1s1.Caption := FormatFloat('#,##', sdata1);  QRL1s2.Caption := FormatFloat('#,##', sdata2);
     QRL1s3.Caption := FormatFloat('#,##', sdata3);  QRL1s4.Caption := FormatFloat('#,##', sdata4);
     QRL1s5.Caption := FormatFloat('#,##', sdata5);  QRL1s6.Caption := FormatFloat('#,##', sdata6);
     QRL1s7.Caption := FormatFloat('#,##', sdata7);
     sdata8 := sdata1+sdata2+sdata3+sdata4+sdata5+sdata6+sdata7;
     QRL1ss.Caption := FormatFloat('##,##', sdata8);
     if sdata8 > 0 then begin
        rdat1 := (sdata8/Rinwon)*100;
        rdat2 := (sdata8/Tinwon)*100;
        end
     else begin
        rdat1 := 0;
        rdat2 := 0;
        end;
     if rdat1 <> 0 then
        QRL1sr.Caption  := FormatFloat('##0.0', rdat1);
     if rdat2 <> 0 then
        QRL1str.Caption := FormatFloat('##0.0', rdat2);
     tdata1 := tdata1+sdata1;  tdata2 := tdata2+sdata2;
     tdata3 := tdata3+sdata3;  tdata4 := tdata4+sdata4;
     tdata5 := tdata5+sdata5;  tdata6 := tdata6+sdata6;
     tdata7 := tdata7+sdata7;
     Fpie2060c.Gauge1.Progress := 27;

     {일반계의 비율을 구한다.}
     if sdata1 > 0 then begin
        rdat1 := (sdata1/Rinwon)*100;
        end
     else begin
        rdat1 := 0;
        end;
     if rdat1 <> 0 then
        QRL1r1.Caption  := FormatFloat('#0.0', rdat1);

     if sdata2 > 0 then begin
        rdat2 := (sdata2/Rinwon)*100;
        end
     else begin
        rdat2 := 0;
        end;
     if rdat2 <> 0 then
        QRL1r2.Caption  := FormatFloat('#0.0', rdat2);

     if sdata3 > 0 then begin
        rdat3 := (sdata3/Rinwon)*100;
        end
     else begin
        rdat3 := 0;
        end;
     if rdat3 <> 0 then
        QRL1r3.Caption  := FormatFloat('#0.0', rdat3);

     if sdata4 > 0 then begin
        rdat4 := (sdata4/Rinwon)*100;
        end
     else begin
        rdat4 := 0;
        end;
     if rdat4 <> 0 then
        QRL1r4.Caption  := FormatFloat('#0.0', rdat4);

     if sdata5 > 0 then begin
        rdat5 := (sdata5/Rinwon)*100;
        end
     else begin
        rdat5 := 0;
        end;
     if rdat5 <> 0 then
        QRL1r5.Caption  := FormatFloat('#0.0', rdat5);

     if sdata6 > 0 then begin
        rdat6 := (sdata6/Rinwon)*100;
        end
     else begin
        rdat6 := 0;
        end;
     if rdat6 <> 0 then
        QRL1r6.Caption  := FormatFloat('#0.0', rdat6);

     if sdata7 > 0 then begin
        rdat7 := (sdata7/Rinwon)*100;
        end
     else begin
        rdat7 := 0;
        end;
     if rdat7 <> 0 then
        QRL1r7.Caption  := FormatFloat('#0.0', rdat7);

     if sdata8 > 0 then begin
        rdat8 := (sdata8/Rinwon)*100;
        end
     else begin
        rdat8 := 0;
        end;
     if rdat8 <> 0 then
        QRL1rs.Caption  := FormatFloat('#0.0', rdat8);

     Fpie2060c.Gauge1.Progress := 30;
     {6.사회연구 해당 데이타를 가져온다......}
     begin
     Sdataclear;
     dataclear;
     ljobline := 'P1';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLe1.Caption := FormatFloat('#,##', data1);
                      QRLe2.Caption := FormatFloat('#,##', data2);
                      QRLe3.Caption := FormatFloat('#,##', data3);
                      QRLe4.Caption := FormatFloat('#,##', data4);
                      QRLe5.Caption := FormatFloat('#,##', data5);
                      QRLe6.Caption := FormatFloat('#,##', data6);
                      QRLe7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLes.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;    Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;    Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;    Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLer.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLetr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 34;
     {7.통신연구 해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'P2';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLf1.Caption := FormatFloat('#,##', data1);
                      QRLf2.Caption := FormatFloat('#,##', data2);
                      QRLf3.Caption := FormatFloat('#,##', data3);
                      QRLf4.Caption := FormatFloat('#,##', data4);
                      QRLf5.Caption := FormatFloat('#,##', data5);
                      QRLf6.Caption := FormatFloat('#,##', data6);
                      QRLf7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLfs.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLfr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLftr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 39;
     {8.정보연구 해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'P3';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLg1.Caption := FormatFloat('#,##', data1);
                      QRLg2.Caption := FormatFloat('#,##', data2);
                      QRLg3.Caption := FormatFloat('#,##', data3);
                      QRLg4.Caption := FormatFloat('#,##', data4);
                      QRLg5.Caption := FormatFloat('#,##', data5);
                      QRLg6.Caption := FormatFloat('#,##', data6);
                      QRLg7.Caption := FormatFloat('#,##', data7);
                      data8 := data1+data2+data3+data4+data5+data6+data7;
                      QRLgs.Caption := FormatFloat('##,##', data8);
                      Sdata1 := Sdata1+data1;  Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;  Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;  Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;
                      if data8 > 0 then begin
                         rdat1 := (data8/Rinwon)*100;
                         rdat2 := (data8/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLgr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLgtr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 43;
     {연구계를 보여준다..............}
     QRL2s1.Caption := FormatFloat('#,##', sdata1);   QRL2s2.Caption := FormatFloat('#,##', sdata2);
     QRL2s3.Caption := FormatFloat('#,##', sdata3);   QRL2s4.Caption := FormatFloat('#,##', sdata4);
     QRL2s5.Caption := FormatFloat('#,##', sdata5);   QRL2s6.Caption := FormatFloat('#,##', sdata6);
     QRL2s7.Caption := FormatFloat('#,##', sdata7);
     sdata8 := sdata1+sdata2+sdata3+sdata4+sdata5+sdata6+sdata7;
     QRL2ss.Caption := FormatFloat('##,##', sdata8);
     if sdata8 > 0 then begin
        rdat1 := (sdata8/Rinwon)*100;
        rdat2 := (sdata8/Tinwon)*100;
        end
     else begin
        rdat1 := 0;
        rdat2 := 0;
        end;
     if rdat1 <> 0 then
        QRL2sr.Caption  := FormatFloat('##0.0', rdat1);
     if rdat2 <> 0 then
        QRL2str.Caption := FormatFloat('##0.0', rdat2);
     tdata1 := tdata1+sdata1;   tdata2 := tdata2+sdata2;
     tdata3 := tdata3+sdata3;   tdata4 := tdata4+sdata4;
     tdata5 := tdata5+sdata5;   tdata6 := tdata6+sdata6;
     tdata7 := tdata7+sdata7;
     Fpie2060c.Gauge1.Progress := 47;

     {연구계의 비율을 구한다.}
     if sdata1 > 0 then begin
        rdat1 := (sdata1/Rinwon)*100;
        end
     else begin
        rdat1 := 0;
        end;
     if rdat1 <> 0 then
        QRL2r1.Caption  := FormatFloat('#0.0', rdat1);

     if sdata2 > 0 then begin
        rdat2 := (sdata2/Rinwon)*100;
        end
     else begin
        rdat2 := 0;
        end;
     if rdat2 <> 0 then
        QRL2r2.Caption  := FormatFloat('#0.0', rdat2);

     if sdata3 > 0 then begin
        rdat3 := (sdata3/Rinwon)*100;
        end
     else begin
        rdat3 := 0;
        end;
     if rdat3 <> 0 then
        QRL2r3.Caption  := FormatFloat('#0.0', rdat3);

     if sdata4 > 0 then begin
        rdat4 := (sdata4/Rinwon)*100;
        end
     else begin
        rdat4 := 0;
        end;
     if rdat4 <> 0 then
        QRL2r4.Caption  := FormatFloat('#0.0', rdat4);

     if sdata5 > 0 then begin
        rdat5 := (sdata5/Rinwon)*100;
        end
     else begin
        rdat5 := 0;
        end;
     if rdat5 <> 0 then
        QRL2r5.Caption  := FormatFloat('#0.0', rdat5);

     if sdata6 > 0 then begin
        rdat6 := (sdata6/Rinwon)*100;
        end
     else begin
        rdat6 := 0;
        end;
     if rdat6 <> 0 then
        QRL2r6.Caption  := FormatFloat('#0.0', rdat6);

     if sdata7 > 0 then begin
        rdat7 := (sdata7/Rinwon)*100;
        end
     else begin
        rdat7 := 0;
        end;
     if rdat7 <> 0 then
        QRL2r7.Caption  := FormatFloat('#0.0', rdat7);

     if sdata8 > 0 then begin
        rdat8 := (sdata8/Rinwon)*100;
        end
     else begin
        rdat8 := 0;
        end;
     if rdat8 <> 0 then
        QRL2rs.Caption  := FormatFloat('#0.0', rdat8);
     Fpie2060c.Gauge1.Progress := 51;
     {9.전임행정 해당 데이타를 가져온다......}
     {
     begin
     Sdataclear;
     dataclear;
     ljobline := '32';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLh1.Caption := FormatFloat('#,##', data1);
                      QRLh2.Caption := FormatFloat('#,##', data2);
                      QRLh3.Caption := FormatFloat('#,##', data3);
                      QRLh4.Caption := FormatFloat('#,##', data4);
                      QRLh5.Caption := FormatFloat('#,##', data5);
                      QRLh6.Caption := FormatFloat('#,##', data6);
                      QRLh7.Caption := FormatFloat('#,##', data7);
                      QRLhe.Caption := FormatFloat('#,##', data8);
                      data9 := data1+data2+data3+data4+data5+data6+data7+data8;
                      QRLhs.Caption := FormatFloat('##,##', data9);

                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;   Sdata8 := Sdata8+data8;
                      if data9 > 0 then begin
                         rdat1 := (data9/Rinwon)*100;
                         rdat2 := (data9/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLhr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLhtr.Caption := FormatFloat('##0.0', rdat2);
     end;
     }
     Fpie2060c.Gauge1.Progress := 56;

     {10.특수직  해당 데이타를 가져온다......}
    {
     begin
     dataclear;
     ljobline := '51';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLi1.Caption := FormatFloat('#,##', data1);
                      QRLi2.Caption := FormatFloat('#,##', data2);
                      QRLi3.Caption := FormatFloat('#,##', data3);
                      QRLi4.Caption := FormatFloat('#,##', data4);
                      QRLi5.Caption := FormatFloat('#,##', data5);
                      QRLi6.Caption := FormatFloat('#,##', data6);
                      QRLi7.Caption := FormatFloat('#,##', data7);
                      QRLie.Caption := FormatFloat('#,##', data8);
                      data9 := data1+data2+data3+data4+data5+data6+data7+data8;
                      QRLis.Caption := FormatFloat('##,##', data9);
                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;   Sdata8 := Sdata8+data8;
                      if data9 > 0 then begin
                         rdat1 := (data9/Rinwon)*100;
                         rdat2 := (data9/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLir.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLitr.Caption := FormatFloat('##0.0', rdat2);
     end;
     }
     Fpie2060c.Gauge1.Progress := 62;
     {11.특정기술해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'R1';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLj1.Caption := FormatFloat('#,##', data1);
                      QRLj2.Caption := FormatFloat('#,##', data2);
                      QRLj3.Caption := FormatFloat('#,##', data3);
                      QRLj4.Caption := FormatFloat('#,##', data4);
                      QRLj5.Caption := FormatFloat('#,##', data5);
                      QRLj6.Caption := FormatFloat('#,##', data6);
                      QRLj7.Caption := FormatFloat('#,##', data7);
                      QRLje.Caption := FormatFloat('#,##', data8);
                      data9 := data1+data2+data3+data4+data5+data6+data7+data8;
                      QRLjs.Caption := FormatFloat('##,##', data9);
                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;   Sdata8 := Sdata8+data8;
                      if data9 > 0 then begin
                         rdat1 := (data9/Rinwon)*100;
                         rdat2 := (data9/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLjr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLjtr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 68;

     {12.특정행정해당 데이타를 가져온다......}
     begin
     dataclear;
     ljobline := 'R2';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata1;
                      Query1.next;
                 end;
                      QRLk1.Caption := FormatFloat('#,##', data1);
                      QRLk2.Caption := FormatFloat('#,##', data2);
                      QRLk3.Caption := FormatFloat('#,##', data3);
                      QRLk4.Caption := FormatFloat('#,##', data4);
                      QRLk5.Caption := FormatFloat('#,##', data5);
                      QRLk6.Caption := FormatFloat('#,##', data6);
                      QRLk7.Caption := FormatFloat('#,##', data7);
                      QRLke.Caption := FormatFloat('#,##', data8);
                      data9 := data1+data2+data3+data4+data5+data6+data7+data8;
                      QRLks.Caption := FormatFloat('##,##', data9);
                      Sdata1 := Sdata1+data1;   Sdata2 := Sdata2+data2;
                      Sdata3 := Sdata3+data3;   Sdata4 := Sdata4+data4;
                      Sdata5 := Sdata5+data5;   Sdata6 := Sdata6+data6;
                      Sdata7 := Sdata7+data7;   Sdata8 := Sdata8+data8;
                      if data9 > 0 then begin
                         rdat1 := (data9/Rinwon)*100;
                         rdat2 := (data9/Tinwon)*100;
                         end
                      else begin
                         rdat1 := 0;
                         rdat2 := 0;
                         end;
                      if rdat1 <> 0 then
                         QRLkr.Caption  := FormatFloat('##0.0', rdat1);
                      if rdat2 <> 0 then
                         QRLktr.Caption := FormatFloat('##0.0', rdat2);
     end;
     Fpie2060c.Gauge1.Progress := 72;
     {기타계를 보여준다..............}
     QRL3s1.Caption := FormatFloat('#,##', sdata1);    QRL3s2.Caption := FormatFloat('#,##', sdata2);
     QRL3s3.Caption := FormatFloat('#,##', sdata3);    QRL3s4.Caption := FormatFloat('#,##', sdata4);
     QRL3s5.Caption := FormatFloat('#,##', sdata5);    QRL3s6.Caption := FormatFloat('#,##', sdata6);
     QRL3s7.Caption := FormatFloat('#,##', sdata7);    QRL3se.Caption := FormatFloat('#,##', sdata8);
     sdata9 := sdata1+sdata2+sdata3+sdata4+sdata5+sdata6+sdata7+sdata8;
     QRL3ss.Caption := FormatFloat('##,##', sdata9);
     if sdata9 > 0 then begin
        rdat1 := (sdata8/Rinwon)*100;
        rdat2 := (sdata8/Tinwon)*100;
        end
     else begin
        rdat1 := 0;
        rdat2 := 0;
        end;
     if rdat1 <> 0 then
        QRL3sr.Caption  := FormatFloat('##0.0', rdat1);
     if rdat2 <> 0 then
        QRL3str.Caption := FormatFloat('##0.0', rdat2);
     tdata1 := tdata1+sdata1;   tdata2 := tdata2+sdata2;
     tdata3 := tdata3+sdata3;   tdata4 := tdata4+sdata4;
     tdata5 := tdata5+sdata5;   tdata6 := tdata6+sdata6;
     tdata7 := tdata7+sdata7;   tdata8 := tdata8+sdata8;

     Fpie2060c.Gauge1.Progress := 77;
     {기타계의 비율을 구한다.}
     if sdata1 > 0 then begin
        rdat1 := (sdata1/Rinwon)*100;
        end
     else begin
        rdat1 := 0;
        end;
     if rdat1 <> 0 then
        QRL3r1.Caption  := FormatFloat('#0.0', rdat1);

     if sdata2 > 0 then begin
        rdat2 := (sdata2/Rinwon)*100;
        end
     else begin
        rdat2 := 0;
        end;
     if rdat2 <> 0 then
        QRL3r2.Caption  := FormatFloat('#0.0', rdat2);

     if sdata3 > 0 then begin
        rdat3 := (sdata3/Rinwon)*100;
        end
     else begin
        rdat3 := 0;
        end;
     if rdat3 <> 0 then
        QRL3r3.Caption  := FormatFloat('#0.0', rdat3);

     if sdata4 > 0 then begin
        rdat4 := (sdata4/Rinwon)*100;
        end
     else begin
        rdat4 := 0;
        end;
     if rdat4 <> 0 then
        QRL3r4.Caption  := FormatFloat('#0.0', rdat4);

     if sdata5 > 0 then begin
        rdat5 := (sdata5/Rinwon)*100;
        end
     else begin
        rdat5 := 0;
        end;
     if rdat5 <> 0 then
        QRL3r5.Caption  := FormatFloat('#0.0', rdat5);

     if sdata6 > 0 then begin
        rdat6 := (sdata6/Rinwon)*100;
        end
     else begin
        rdat6 := 0;
        end;
     if rdat6 <> 0 then
        QRL3r6.Caption  := FormatFloat('#0.0', rdat6);

     if sdata7 > 0 then begin
        rdat7 := (sdata7/Rinwon)*100;
        end
     else begin
        rdat7 := 0;
        end;
     if rdat7 <> 0 then
        QRL3r7.Caption  := FormatFloat('#0.0', rdat7);

     if sdata8 > 0 then begin
        rdat8 := (sdata8/Rinwon)*100;
        end
     else begin
        rdat8 := 0;
        end;
     if rdat8 <> 0 then
        QRL3re.Caption  := FormatFloat('#0.0', rdat8);

     if sdata9 > 0 then begin
        rdat9 := (sdata9/Rinwon)*100;
        end
     else begin
        rdat9 := 0;
        end;
     if rdat9 <> 0 then
        QRL3rs.Caption  := FormatFloat('##0.0', rdat9);

     Fpie2060c.Gauge1.Progress := 82;
     {정규직 계와 비율을 구한다..............}
     QRLst1.Caption := FormatFloat('#,##', tdata1);
     QRLst2.Caption := FormatFloat('#,##', tdata2);
     QRLst3.Caption := FormatFloat('#,##', tdata3);
     QRLst4.Caption := FormatFloat('#,##', tdata4);
     QRLst5.Caption := FormatFloat('#,##', tdata5);
     QRLst6.Caption := FormatFloat('#,##', tdata6);
     QRLst7.Caption := FormatFloat('#,##', tdata7);
     QRLste.Caption := FormatFloat('#,##', tdata8);
     tdata9 := tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8;
     QRLsts.Caption := FormatFloat('##,##', tdata9);

     if tdata9 > 0 then begin
        rdat9 := (tdata9/Rinwon)*100;
        rdat8 := (tdata9/Tinwon)*100;
        end
     else begin
        rdat9 := 0;
        rdat8 := 0;
        end;
     if rdat9 <> 0 then
     begin
          QRLsrs.Caption  := FormatFloat('##0.0', rdat9);
          QRLstr.Caption  := FormatFloat('##0.0', rdat9);
     end;
     if rdat8 <> 0 then
        QRLsttr.Caption := FormatFloat('##0.0', rdat8);

     if tdata1 > 0 then begin
        rdat1 := (tdata1/Rinwon)*100;
        end
     else begin
        rdat1 := 0;
        end;
     if rdat1 <> 0 then
        QRLsr1.Caption  := FormatFloat('#0.0', rdat1);

     if tdata2 > 0 then begin
        rdat2 := (tdata2/Rinwon)*100;
        end
     else begin
        rdat2 := 0;
        end;
     if rdat2 <> 0 then
        QRLsr2.Caption  := FormatFloat('#0.0', rdat2);

     if tdata3 > 0 then begin
        rdat3 := (tdata3/Rinwon)*100;
        end
     else begin
        rdat3 := 0;
        end;
     if rdat3 <> 0 then
        QRLsr3.Caption  := FormatFloat('#0.0', rdat3);

     if tdata4 > 0 then begin
        rdat4 := (tdata4/Rinwon)*100;
        end
     else begin
        rdat4 := 0;
        end;
     if rdat4 <> 0 then
        QRLsr4.Caption  := FormatFloat('#0.0', rdat4);

     if tdata5 > 0 then begin
        rdat5 := (tdata5/Rinwon)*100;
        end
     else begin
        rdat5 := 0;
        end;
     if rdat5 <> 0 then
        QRLsr5.Caption  := FormatFloat('#0.0', rdat5);

     if tdata6 > 0 then begin
        rdat6 := (tdata6/Rinwon)*100;
        end
     else begin
        rdat6 := 0;
        end;
     if rdat6 <> 0 then
        QRLsr6.Caption  := FormatFloat('#0.0', rdat6);

     if tdata7 > 0 then begin
        rdat7 := (tdata7/Rinwon)*100;
        end
     else begin
        rdat7 := 0;
        end;
     if rdat7 <> 0 then
        QRLsr7.Caption  := FormatFloat('#0.0', rdat7);

     if tdata8 > 0 then begin
        rdat8 := (tdata8/Rinwon)*100;
        end
     else begin
        rdat8 := 0;
        end;
     if rdat8 <> 0 then
        QRLsre.Caption  := FormatFloat('#0.0', rdat8);

{     if tdata9 > 0 then begin         위에서 처리 했으니까.....
        rdat9 := (tdata9/Rinwon)*100;
        end
     else begin
        rdat9 := 0;
        end;
     QRLsrs.Caption  := Format('%-4.2f', [rdat9]);;}
     Fpie2060c.Gauge1.Progress := 87;

     {14.임시직  해당 데이타를 가져온다......}
     begin
     Sdataclear;
     dataclear;
     ljobline := 'Z0';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata2;
                      Query1.next;
                 end;
                 QRLle.Caption := FormatFloat('#,##', data1);
                 QRLme.Caption := FormatFloat('#,##', data2);
                 QRLne.Caption := FormatFloat('#,##', data3);
                 QRLhe.Caption := FormatFloat('#,##', data4);
{                 QRLoe.Caption := IntToStr(data4);}
                 QRLls.Caption := FormatFloat('##,##', data1);
                 QRLms.Caption := FormatFloat('##,##', data2);
                 QRLns.Caption := FormatFloat('##,##', data3);
                 QRLhs.Caption := FormatFloat('##,##', data4);
{                 QRLos.Caption := IntToStr(data4);}
                 data5 := data1+data2+data3+data4;
                 QRL4se.Caption:= FormatFloat('#,##', data5);
                 QRL4ss.Caption:= FormatFloat('##,##', data5);
     end;
     tdata8 := tdata8+data5;
     Fpie2060c.Gauge1.Progress := 91;
  {임시직 비율을 구한다....}
     if data1 > 0 then begin
        rdat1 := (data1/Tinwon)*100;
        end
     else begin
        rdat1 := 0;
        end;
     if rdat1 <> 0 then
        QRLltr.Caption  := FormatFloat('##0.0', rdat1);
     if data2 > 0 then begin
        rdat2 := (data2/Tinwon)*100;
        end
     else begin
        rdat2 := 0;
        end;
     if rdat2 <> 0 then
        QRLmtr.Caption  := FormatFloat('##0.0', rdat2);
     if data3 > 0 then begin
        rdat3 := (data3/Tinwon)*100;
        end
     else begin
        rdat3 := 0;
        end;
     if rdat3 <> 0 then
        QRLntr.Caption  := FormatFloat('##0.0', rdat3);
     if data4 > 0 then begin
        rdat4 := (data4/Tinwon)*100;
        end
     else begin
        rdat4 := 0;
        end;
     if rdat4 <> 0 then
     QRLhtr.Caption  := FormatFloat('##0.0', rdat4);

     if data5 > 0 then begin
        rdat5 := (data5/Tinwon)*100;
        end
     else begin
        rdat5 := 0;
        end;
     if rdat5 <> 0 then
        QRL4str.Caption  := FormatFloat('##0.0', rdat5);
     Fpie2060c.Gauge1.Progress := 95;
{총계와 전체 비율을 구한다...........................}
    begin
         QRLtt1.Caption := FormatFloat('#,##', tdata1);
         QRLtt2.Caption := FormatFloat('#,##', tdata2);
         QRLtt3.Caption := FormatFloat('#,##', tdata3);
         QRLtt4.Caption := FormatFloat('#,##', tdata4);
         QRLtt5.Caption := FormatFloat('#,##', tdata5);
         QRLtt6.Caption := FormatFloat('#,##', tdata6);
         QRLtt7.Caption := FormatFloat('#,##', tdata7);
         QRLtt8.Caption := FormatFloat('#,##', (tdata8 + ImWonCount));
         tdata9 := tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8+ImWonCount;
         QRLtt9.Caption := FormatFloat('##,##', tdata9);

         if tdata1 > 0 then begin
            rdat1 := (tdata1/Tinwon)*100;
            end
         else begin
            rdat1 := 0;
            end;
         if rdat1 <> 0 then
            QRLrr1.Caption  := FormatFloat('#0.0', rdat1);

         if tdata2 > 0 then begin
            rdat2 := (tdata2/Tinwon)*100;
            end
         else begin
            rdat2 := 0;
            end;
         if rdat2 <> 0 then
            QRLrr2.Caption  := FormatFloat('#0.0', rdat2);

         if tdata3 > 0 then begin
            rdat3 := (tdata3/Tinwon)*100;
            end
         else begin
            rdat3 := 0;
            end;
         if rdat3 <> 0 then
            QRLrr3.Caption  := FormatFloat('#0.0', rdat3);

         if tdata4 > 0 then begin
            rdat4 := (tdata4/Tinwon)*100;
            end
         else begin
            rdat4 := 0;
            end;
         if rdat4 <> 0 then
            QRLrr4.Caption  := FormatFloat('#0.0', rdat4);

         if tdata5 > 0 then begin
            rdat5 := (tdata5/Tinwon)*100;
            end
         else begin
            rdat5 := 0;
            end;
         if rdat5 <> 0 then
            QRLrr5.Caption  := FormatFloat('#0.0', rdat5);

         if tdata6 > 0 then begin
            rdat6 := (tdata6/Tinwon)*100;
            end
         else begin
            rdat6 := 0;
            end;
         if rdat6 <> 0 then
            QRLrr6.Caption  := FormatFloat('#0.0', rdat6);

         if tdata7 > 0 then begin
            rdat7 := (tdata7/Tinwon)*100;
            end
         else begin
            rdat7 := 0;
            end;
         if rdat7 <> 0 then
            QRLrr7.Caption  := FormatFloat('#0.0', rdat7);

         if tdata8 > 0 then begin
            rdat8 := (tdata8/Tinwon)*100;
            end
         else begin
            rdat8 := 0;
            end;
         if rdat8 <> 0 then
            QRLrr8.Caption  := FormatFloat('#0.0', rdat8);

         if tdata9 > 0 then begin
            rdat9 := (tdata9/Tinwon)*100;
            end
         else begin
            rdat9 := 0;
            end;
         if rdat9 <> 0 then
         begin
            QRLrr9.Caption := FormatFloat('##0.0', rdat9);
            QRLtt0.Caption := FormatFloat('##0.0', rdat9);
         end;

    end;

    Fpie2060c.Gauge1.Progress := 100;
    Fpie2060c.Gauge1.Progress := 0;
end;

procedure TFpie20601.HaveData;
begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT PAYCL, SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND (JOBLINE = '''+ljobline+''')) ');
     Query1.SQL.ADD(' GROUP BY PAYCL ');
     Query1.Open;
end;

procedure TFpie20601.Whiledata1;
begin
     Tempcl := Query1.Fields[0].AsString;{직급}
     Tempin := Query1.Fields[1].AsInteger;{직급별인원}
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.0   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
                      if Copy(tempcl,1,1) = 'O' then begin  //기존(1)
                         data1 := data1 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'P' then begin  //기존(2)
                         data2 := data2 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'Q' then begin //기존(3)
                         data3 := data3 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'R' then begin //기존(4)
                         data4 := data4 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'S' then begin //기존(5)
                         data5 := data5 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'T' then begin //기존(6)
                         data6 := data6 + tempin;
                         end
                      else
                      if Copy(tempcl,1,1) = 'U' then begin //기존(7)
                         data7 := data7 + tempin;
                         end
                      else begin
                         data8 := data8 + tempin;
                         end;
end;

procedure TFpie20601.Whiledata2;
begin
     Tempcl := Query1.Fields[0].AsString;{직급}
     Tempin := Query1.Fields[1].AsInteger;{직급별인원}
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.0   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
                      if tempcl = 'X1' then begin    //고문(기존 A1)
                         data1 := data1 + tempin;
                         end
                      else
                      if tempcl = 'X2' then begin    //촉탁(기존 A2)
                         data2 := data2 + tempin;
                         end
                      else
                      if tempcl = 'Z1' then begin    //협력(기존 Y1)
                         data4 := data4 + tempin;
                         end
                      else begin  {A3}               //용무(기존A3 )
                         data3 := data3 + tempin;
                         end;
end;


procedure TFpie20601.DataClear;
begin
     data1 := 0;
     data2 := 0;
     data3 := 0;
     data4 := 0;
     data5 := 0;
     data6 := 0;
     data7 := 0;
     data8 := 0;
end;

procedure TFpie20601.SdataClear;
begin
     sdata1 := 0;
     sdata2 := 0;
     sdata3 := 0;
     sdata4 := 0;
     sdata5 := 0;
     sdata6 := 0;
     sdata7 := 0;
     sdata8 := 0;
     sdata9 := 0;
end;

end.
