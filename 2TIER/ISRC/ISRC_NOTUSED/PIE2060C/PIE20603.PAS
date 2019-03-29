unit Pie20603;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, ExtCtrls, DB, DBTables, Qrctrls;


type
  TFpie20603 = class(TForm)
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    DataSource1: TDataSource;
    Query1: TQuery;
    QuickReport1: TQuickRep;
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
    QRLabel37: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel38: TQRLabel;
    QRLjcon1: TQRLabel;
    QRLjcte: TQRLabel;
    QRLjconrr: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel39: TQRLabel;
    QRLjcon: TQRLabel;
    QRLjcontr: TQRLabel;
//    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
  private
    { Private declarations }
    Areport : TQuickRep;
    SortBy : string;     {X : 작성구분}
    ImWonCount : integer;
    procedure ScreenClear;
    procedure DataClear;
    procedure Whiledata1;
    procedure Whiledata2;
    procedure HaveData;
  public
    { Public declarations }
  end;

var
  Fpie20603: TFpie20603;
  Tempcl,Ltongym,ljobgun : String;

  Tinwon,Rinwon,Tempin:Integer;
  data0, data1, data2, data3,data3_1, data4, data5, data6, data7, data8, data9, data10, data11, data12, datas :Integer;
  sdata1, sdata2, sdata3, sdata4, sdata5, sdata6, sdata7, sdata8, sdata9, sdata10, sdata11, sdata12, sdatas :Integer;
  tdata1, tdata2, tdata3, tdata4, tdata5, tdata6, tdata7, tdata8, tdata9, tdata10, tdata11, tdata12, tdata13_1,tdata13,tdatas :Integer;
  trdat1, trdat2, rdat1, rdat2, rdat3, rdat4, rdat5, rdat6, rdat7, rdat8, rdat9, rdat10, rdat11,rdat13_1,rdat13, rdat12, rdats : Real;
implementation
{$R *.DFM}

Uses e2060c,peprnView;//, Pie20602;

procedure TFpie20603.ScreenClear;
begin
     QRLwe.Caption  := '';   QRLws.Caption  := '';   QRLwtr.Caption := ''; // 임원

     QRLa1.Caption  := '';   QRLa2.Caption  := '';   QRLa3.Caption  := ''; // 관리직
     QRLa4.Caption  := '';   QRLa5.Caption  := '';   QRLa6.Caption  := '';
     QRLa7.Caption  := '';   QRLa8.Caption  := '';   QRLa9.Caption  := '';
     QRLas.Caption  := '';   QRLar.Caption  := '';   QRLatr.Caption := '';

     QRLa1r.Caption  := '';   QRLa2r.Caption  := '';   QRLa3r.Caption  := ''; // 관리직
     QRLa4r.Caption  := '';   QRLa5r.Caption  := '';   QRLa6r.Caption  := '';
     QRLa7r.Caption  := '';   QRLa8r.Caption  := '';   QRLa9r.Caption  := '';
     QRLars.Caption  := '';

     QRLb1.Caption  := '';   QRLb2.Caption  := '';   QRLb3.Caption  := ''; // 기술직
     QRLb4.Caption  := '';   QRLb5.Caption  := '';   QRLb6.Caption  := '';
     QRLb7.Caption  := '';   QRLb8.Caption  := '';   QRLb9.Caption  := '';
     QRLbs.Caption  := '';   QRLbr.Caption  := '';   QRLbtr.Caption := '';

     QRLb1r.Caption  := '';   QRLb2r.Caption  := '';   QRLb3r.Caption  := ''; // 기술직
     QRLb4r.Caption  := '';   QRLb5r.Caption  := '';   QRLb6r.Caption  := '';
     QRLb7r.Caption  := '';   QRLb8r.Caption  := '';   QRLb9r.Caption  := '';
     QRLbrs.Caption  := '';

     QRLc1.Caption  := '';   QRLc2.Caption  := '';   QRLc3.Caption  := ''; // 연구직
     QRLc4.Caption  := '';   QRLc5.Caption  := '';   QRLc6.Caption  := '';
     QRLc7.Caption  := '';   QRLc8.Caption  := '';   QRLc9.Caption  := '';
     QRLcs.Caption  := '';   QRLcr.Caption  := '';   QRLctr.Caption := '';

     QRLc1r.Caption  := '';   QRLc2r.Caption  := '';   QRLc3r.Caption  := ''; // 연구직
     QRLc4r.Caption  := '';   QRLc5r.Caption  := '';   QRLc6r.Caption  := '';
     QRLc7r.Caption  := '';   QRLc8r.Caption  := '';   QRLc9r.Caption  := '';
     QRLcrs.Caption  := '';

     QRLd1.Caption  := '';   QRLd2.Caption  := '';   QRLd3.Caption  := ''; // 영업직
     QRLd4.Caption  := '';   QRLd5.Caption  := '';   QRLd6.Caption  := '';
     QRLd7.Caption  := '';   QRLd8.Caption  := '';   QRLd9.Caption  := '';
     QRLds.Caption  := '';   QRLdr.Caption  := '';   QRLdtr.Caption := '';

     QRLd1r.Caption  := '';   QRLd2r.Caption  := '';   QRLd3r.Caption  := ''; // 영업직
     QRLd4r.Caption  := '';   QRLd5r.Caption  := '';   QRLd6r.Caption  := '';
     QRLd7r.Caption  := '';   QRLd8r.Caption  := '';   QRLd9r.Caption  := '';
     QRLdrs.Caption  := '';

     QRle1.Caption  := '';   QRle2.Caption  := '';   QRle3.Caption  := '';  // 특정직
     QRle4.Caption  := '';   QRle5.Caption  := '';   QRle6.Caption  := '';
     QRle7.Caption  := '';   QRle8.Caption  := '';   QRle9.Caption  := '';
     QRles.Caption  := '';   QRler.Caption  := '';   QRletr.Caption := '';

     QRle1r.Caption  := '';   QRle2r.Caption  := '';   QRle3r.Caption  := '';  // 특정직
     QRle4r.Caption  := '';   QRle5r.Caption  := '';   QRle6r.Caption  := '';
     QRle7r.Caption  := '';   QRle8r.Caption  := '';   QRle9r.Caption  := '';
     QRlers.Caption  := '';

     QRLe10.Caption  := '';   QRLe10r.Caption := '';                         // 특정직

     QRLst1.Caption  := '';  QRLst2.Caption  := '';  QRLst3.Caption  := '';  // 정규계
     QRLst4.Caption  := '';  QRLst5.Caption  := '';  QRLst6.Caption  := '';
     QRLst7.Caption  := '';  QRLst8.Caption  := '';  QRLst9.Caption  := '';
     QRLst10.Caption := '';  QRLsts.Caption  := '';
     QRLstr.Caption  := '';  QRLsttr.Caption := '';

     QRLsr1.Caption  := '';  QRLsr2.Caption  := '';  QRLsr3.Caption  := '';  // 정규비율
     QRLsr4.Caption  := '';  QRLsr5.Caption  := '';  QRLsr6.Caption  := '';
     QRLsr7.Caption  := '';  QRLsr8.Caption  := '';  QRLsr9.Caption  := '';
     QRLsre.Caption  := '';  QRLsrs.Caption  := '';
     QRLhe.Caption   := '';  QRLhs.Caption   := '';  QRLhtr.Caption  := '';  // 협력

     QRLcon1.Caption   := '';  QRLcon.Caption   := '';  QRLcte.Caption  := '';  // 협력
     QRLconrr.Caption  := '';  QRLcontr.Caption  := '';

     QRLjcon1.Caption   := '';  QRLjcon.Caption   := '';  QRLjcte.Caption  := '';  //전문계약직 추가 2002.08.27 shm
     QRLjconrr.Caption  := ''; QRLjcontr.Caption  := '';


     QRLtt1.Caption  := '';  QRLtt2.Caption  := '';  QRLtt3.Caption  := '';  // 총계
     QRLtt4.Caption  := '';  QRLtt5.Caption  := '';  QRLtt6.Caption  := '';
     QRLtt7.Caption  := '';  QRLtt8.Caption  := '';  QRLtt9.Caption  := '';
     QRLtt10.Caption := '';  QRLtte.Caption  := '';  QRLtt0.Caption  := '';
     QRLtts.Caption  := '';  QRLtt.Caption   := '';

     QRLrr1.Caption  := '';  QRLrr2.Caption  := '';  QRLrr3.Caption  := '';  // 전체비율
     QRLrr4.Caption  := '';  QRLrr5.Caption  := '';  QRLrr6.Caption  := '';
     QRLrr7.Caption  := '';  QRLrr8.Caption  := '';  QRLrr9.Caption  := '';
     QRLrr10.Caption := '';  QRLrre.Caption  := '';  QRLrr0.Caption  := '';
     QRLrrs.Caption  := '';
end;

{procedure TFpie20603.QuickReport1BeforePrint(var PrintReport: Boolean);
var
   Cdate : string;
begin
     Tinwon := 0;  Rinwon := 0; data1 := 0;  data2 := 0;data3 := 0;
     Cdate := Fpie2060c.L_CurDate.Caption;
     QRLdate.Caption := Copy(Cdate,1,4)+'/'+Copy(CDate,6,2)+'/'+Copy(CDate,9,2);
     Ltongym := Fpie2060c.Mrunyymm.text;
     QRLjobym.Caption := Copy(Ltongym, 1, 4) + '년 ' + Copy(Ltongym, 5, 2) + '월';
     ScreenClear;

     Fpie2060c.P_help.Caption := '전체인원수를 계산중입니다.';
     Application.Processmessages;
     begin //전체인원을 구한다.
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG  ');
//     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE (TONGYM = '''+ltongym+''')');
     Query1.Open;
     while not Query1.EOF do
           begin
                data1 := Query1.Fields[0].AsInteger;//인원 총계
                Tinwon := Tinwon + data1;
                Query1.next
           end;
     end;
     Fpie2060c.P_help.Caption := '정규직 인원수를 계산중입니다.';
     Application.Processmessages;
     begin//정규직인원을 구한다.
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND ');
     Query1.SQL.ADD('       (JOBGUN >= ''10'') AND (JOBGUN <= ''50'')) ');
     Query1.Open;
     while not Query1.EOF do
           begin
                data2 := Query1.Fields[0].AsInteger;//인원 총계
                Rinwon := Rinwon + data2;
                Query1.next
           end;
     end;
     Query1.Close;
     Fpie2060c.Gauge1.Progress := 10;
end;}


{procedure TFpie20603.QRBand2BeforePrint(var PrintBand: Boolean);
begin
      tdata1 := 0;   tdata2 := 0;   tdata3 := 0;  tdata4 := 0;    tdata5 := 0;
      tdata6 := 0;   tdata7 := 0;   tdata8 := 0;  tdata9 := 0;    tdata10:= 0;
      tdata11:= 0;   tdata12:= 0;   ImWonCount := 0;
      tdata13:= 0;

     //1.임원 해당 데이타를 가져온다......
     Fpie2060c.P_help.Caption := '직군별 인원수를 계산중입니다.';
     Application.Processmessages;
     begin
     dataclear;
     ljobgun := '00';      // 임원
     HaveData;
           while not Query1.EOF do
                 begin
                      Tempcl := Query1.Fields[0].AsString;//직급
                      Tempin := Query1.Fields[1].AsInteger;//직급별인원
                      data1  := data1 + tempin;
                      Query1.next;
                 end;
                 QRLwe.Caption := FormatFloat('#,##', data1);
                 QRLws.Caption := FormatFloat('##,##', data1);
                 if data1 > 0 then begin
                  trdat1 := (data1/Tinwon)*100;
                  end
                 else begin
                  trdat1 := 0;
                  end;
                 if trdat1 <> 0 then
                    QRLwtr.Caption := FormatFloat('##0.0', trdat1);
     end;
     ImWonCount := data1;       //임원수를 일단 저장
     Fpie2060c.Gauge1.Progress := 20;

     //2.관리직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '10';    // 관리직
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
                      QRLa8.Caption := FormatFloat('#,##', data8);
                      QRLa9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLas.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLar.Caption  := FormatFloat('##0.0', trdat1);  // 정규 비율
                      if trdat2 <> 0 then
                         QRLatr.Caption := FormatFloat('##0.0', trdat2);  // 전체 비율
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLa1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLa2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLa3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLa4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLa5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLa6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLa7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLa8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLa9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLars.Caption  := FormatFloat('#0.0', rdats);

          Fpie2060c.Gauge1.Progress := 30;

     //3.기술직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '20';
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
                      QRLb8.Caption := FormatFloat('#,##', data8);
                      QRLb9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLbs.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLbr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLbtr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLb1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLb2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLb3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLb4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLb5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLb6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLb7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLb8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLb9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLbrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 40;

     //4.연구직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '30';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLc1.Caption := FormatFloat('#,##', data1);
                      QRLc2.Caption := FormatFloat('#,##', data2);
                      QRLc3.Caption := FormatFloat('#,##', data3);
                      QRLc4.Caption := FormatFloat('#,##', data4);
                      QRLc5.Caption := FormatFloat('#,##', data5);
                      QRLc6.Caption := FormatFloat('#,##', data6);
                      QRLc7.Caption := FormatFloat('#,##', data7);
                      QRLc8.Caption := FormatFloat('#,##', data8);
                      QRLc9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLcs.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLcr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLctr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLc1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLc2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLc3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLc4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLc5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLc6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLc7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLc8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLc9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLcrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 50;

     //5.영업직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '40';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLd1.Caption := FormatFloat('#,##', data1);
                      QRLd2.Caption := FormatFloat('#,##', data2);
                      QRLd3.Caption := FormatFloat('#,##', data3);
                      QRLd4.Caption := FormatFloat('#,##', data4);
                      QRLd5.Caption := FormatFloat('#,##', data5);
                      QRLd6.Caption := FormatFloat('#,##', data6);
                      QRLd7.Caption := FormatFloat('#,##', data7);
                      QRLd8.Caption := FormatFloat('#,##', data8);
                      QRLd9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLds.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLdr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLdtr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLd1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLd2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLd3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLd4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLd5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLd6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLd7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLd8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLd9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLdrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 60;

     //6.특정직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '50';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata2;  // 특정직 처리
                      Query1.next;
                 end;
                      QRLe10.Caption := FormatFloat('#,##', data1);
                      datas := data1;
                      QRLes.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLer.Caption  := FormatFloat('##0.0', trdat1);
                      if rdat2 <> 0 then
                         QRLetr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata10:= tdata10+datas;   //  정규직의 특정직 합을 위하여

        //  비율을 구한다

                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLe10r.Caption  := FormatFloat('#0.0', rdat1);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLers.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 70;

     //정규직 계와 비율을 구한다..............
     QRLst1.Caption := FormatFloat('#,##', tdata1);
     QRLst2.Caption := FormatFloat('#,##', tdata2);
     QRLst3.Caption := FormatFloat('#,##', tdata3);
     QRLst4.Caption := FormatFloat('#,##', tdata4);
     QRLst5.Caption := FormatFloat('#,##', tdata5);
     QRLst6.Caption := FormatFloat('#,##', tdata6);
     QRLst7.Caption := FormatFloat('#,##', tdata7);
     QRLst8.Caption := FormatFloat('#,##', tdata8);
     QRLst9.Caption := FormatFloat('#,##', tdata9);
     QRLst10.Caption:= FormatFloat('#,##', tdata10);
     tdatas := tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8+tdata9+tdata10;
     QRLsts.Caption := FormatFloat('##,##', tdatas);

     if tdatas > 0 then begin
        trdat1 := (tdatas/Rinwon)*100;
        trdat2 := (tdatas/Tinwon)*100;
        end
     else begin
        trdat1 := 0;
        trdat2 := 0;
        end;
     if trdat1 <> 0 then
     begin
          QRLsrs.Caption  := FormatFloat('##0.0', trdat1);
          QRLstr.Caption  := FormatFloat('##0.0', trdat1);
     end;
     if trdat2 <> 0 then
        QRLsttr.Caption := FormatFloat('##0.0', trdat2);

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
        QRLsr8.Caption  := FormatFloat('#0.0', rdat8);

     if tdata9 > 0 then begin
        rdat9 := (tdata9/Rinwon)*100;
        end
     else begin
        rdat9 := 0;
        end;
     if rdat9 <> 0 then
        QRLsr9.Caption  := FormatFloat('#0.0', rdat9);

     if tdata10 > 0 then begin
        rdat10 := (tdata10/Rinwon)*100;
        end
     else begin
        rdat10 := 0;
        end;
     if rdat10 <> 0 then
        QRLsre.Caption  := FormatFloat('#0.0', rdat10);

     Fpie2060c.Gauge1.Progress := 80;

     //7.협력직  해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := 'H1';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata2;
                      Query1.next;
                 end;
                 QRLhe.Caption := FormatFloat('##,##', data2);
                 datas := data2;
                 QRLhs.Caption := FormatFloat('#,##', datas);
                 QRLtte.Caption:= FormatFloat('##,##', datas);
     end;
     tdata11 := tdata11+datas;
     Fpie2060c.Gauge1.Progress := 90;
  // 비율을 구한다
     if datas > 0 then begin
        trdat1 := (datas/Tinwon)*100;
        end
     else begin
        trdat1 := 0;
        end;
     if trdat1 <> 0 then
        QRLhtr.Caption  := FormatFloat('##0.0', trdat1);

     Fpie2060c.Gauge1.Progress := 95;


     //8.계약직  해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '90';
     HaveData;
//           while not Query1.EOF do
//                 begin
//                      whiledata2;
//                      Query1.next;
//                 end;
     Tempin := Query1.Fields[1].AsInteger;//직급별인원

                 QRLcon1.Caption := FormatFloat('##,##', Tempin);
                 datas  := Tempin;
                 QRLcon.Caption := FormatFloat('#,##', datas);
                 QRLcte.Caption:= FormatFloat('##,##', datas);
     end;

     tdata13 := datas;
     Fpie2060c.Gauge1.Progress := 90;
  // 비율을 구한다
     if datas > 0 then begin
//        trdat1 := (datas/Tinwon)*100;
        QRLcontr.Caption  := FormatFloat('##0.0', (datas/Tinwon)*100);
        end;


     Fpie2060c.Gauge1.Progress := 95;


//총계와 전체 비율을 구한다...........................
    begin
         QRLtt0.Caption := FormatFloat('#,##', ImwonCount);
         QRLtt1.Caption := FormatFloat('#,##', tdata1);
         QRLtt2.Caption := FormatFloat('#,##', tdata2);
         QRLtt3.Caption := FormatFloat('#,##', tdata3);
         QRLtt4.Caption := FormatFloat('#,##', tdata4);
         QRLtt5.Caption := FormatFloat('#,##', tdata5);
         QRLtt6.Caption := FormatFloat('#,##', tdata6);
         QRLtt7.Caption := FormatFloat('#,##', tdata7);
         QRLtt8.Caption := FormatFloat('#,##', tdata8);
         QRLtt9.Caption := FormatFloat('#,##', tdata9);
         QRLtt10.Caption:= FormatFloat('#,##', tdata10);
         QRLtte.Caption := FormatFloat('#,##', tdata11);
         QRLcte.Caption := FormatFloat('#,##', tdata13);
         tdatas := ImWonCount+tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8+tdata9+tdata10+tdata11
                 +tdata13;
         QRLtts.Caption := FormatFloat('##,##', tdatas);

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
            QRLrr9.Caption  := FormatFloat('#0.0', rdat9);

         if tdata10 > 0 then begin
            rdat10 := (tdata10/Tinwon)*100;
            end
         else begin
            rdat10 := 0;
            end;
         if rdat10 <> 0 then
            QRLrr10.Caption  := FormatFloat('#0.0', rdat10);

         if tdata11 > 0 then begin
            rdat11 := (tdata11/Tinwon)*100;
            end
         else begin
            rdat11 := 0;
            end;
         if rdat11 <> 0 then
            QRLrre.Caption  := FormatFloat('#0.0', rdat11);

         if tdata13 > 0 then begin
            rdat13 := (tdata13/Tinwon)*100;
            end
         else begin
            rdat13 := 0;
            end;
         if rdat13 <> 0 then
            QRLconrr.Caption  := FormatFloat('#0.0', rdat13);


         if tdatas > 0 then begin
            trdat1 := (tdatas/Tinwon)*100;
            end
         else begin
            trdat1 := 0;
            end;
         if trdat1 <> 0 then
         begin
            QRLrrs.Caption := FormatFloat('##0.0', trdat1);
            QRLtt.Caption  := FormatFloat('##0.0', trdat1);
         end;

         if ImwonCount > 0 then begin
            trdat2 := (ImwonCount/Tinwon)*100;
            end
         else begin
            trdat2 := 0;
            end;
         if trdat2 <> 0 then
         begin
            QRLrr0.Caption  := FormatFloat('##0.0', trdat2);
         end;

    end;

    Fpie2060c.Gauge1.Progress := 100;
    Fpie2060c.Gauge1.Progress := 0;
end;}

procedure TFpie20603.HaveData;
begin
     Query1.Close;
     Query1.SQL.Clear;
     if  ljobgun = '90' then  //E0(고문) 추가로 인한 수정 2001.11.01 shm 
     begin
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND (JOBGUN = '''+ljobgun+''')) ');
     end else
     if  ljobgun = '70' then  //전문계약직 추가로 인한 수정 2002.08.27 shm
     begin
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND (JOBGUN = '''+ljobgun+''')) ');
     end else
     begin
     Query1.SQL.ADD(' SELECT PAYCL, SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND (JOBGUN = '''+ljobgun+''')) ');
     Query1.SQL.ADD(' GROUP BY PAYCL ');
     end;
     Query1.Open;
end;

procedure TFpie20603.Whiledata1;            // 정규직 인원을 계산한다 (특정 제외)
begin
     Tempcl := Query1.Fields[0].AsString;{직급}
     Tempin := Query1.Fields[1].AsInteger;{직급별인원}

                      if tempcl = '11' then begin            // SM2급
                         data1 := data1 + tempin;
                         end
                      else
                      if tempcl = '13' then begin            // SM1급
                         data2 := data2 + tempin;
                         end
                      else
                      if tempcl = '21' then begin            // M2급
                         data3 := data3 + tempin;
                         end
                      else
                      if tempcl = '23' then begin            // M1급
                         data4 := data4 + tempin;
                         end
                      else
                      if tempcl = '31' then begin            // S2급
                         data5 := data5 + tempin;
                         end
                      else
                      if tempcl = '33' then begin            // S1급
                         data6 := data6 + tempin;
                         end
                      else
                      if tempcl = '41' then begin            // J3급
                         data7 := data7 + tempin;
                         end
                      else
                      if tempcl = '43' then begin            // J2급
                         data8 := data8 + tempin;
                         end
                      else
                      if tempcl = '45' then begin            // J1급
                         data9 := data9 + tempin;
                      end;
end;

procedure TFpie20603.Whiledata2;        // 특정, 협력직 인원을 계산한다
begin
     Tempcl := Query1.Fields[0].AsString;{직급}
     Tempin := Query1.Fields[1].AsInteger;{직급별인원}

                      if tempcl = '93' then begin
                         data1 := data1 + tempin;
                         end
                      else
                      if tempcl = 'H1' then begin
                         data2 := data2 + tempin;
                      end
                      else
                      if tempcl = 'C1' then begin  //전문계약직급 추가 2002.8.27 shm
                         data3_1 := data3_1 + tempin;
                      end
                      else
                      if (tempcl = 'E1') or (tempcl = 'E0')then begin //2001.11.01 E0(고문) 도 계약에 포함
                         data3 := data3 + tempin;
                      end;

end;


procedure TFpie20603.DataClear;
begin
     data1 := 0;
     data2 := 0;
     data3 := 0;
     data4 := 0;
     data5 := 0;
     data6 := 0;
     data7 := 0;
     data8 := 0;
     data9 := 0;
     data10:= 0;
     data11:= 0;
     data12:= 0;
     datas := 0;
end;

procedure TFpie20603.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   Cdate : string;
begin
     Tinwon := 0;  Rinwon := 0; data1 := 0;  data2 := 0;data3 := 0;
     Cdate := Fpie2060c.L_CurDate.Caption;
     QRLdate.Caption := Copy(Cdate,1,4)+'/'+Copy(CDate,6,2)+'/'+Copy(CDate,9,2);
     Ltongym := Fpie2060c.Mrunyymm.text;
     QRLjobym.Caption := Copy(Ltongym, 1, 4) + '년 ' + Copy(Ltongym, 5, 2) + '월';
     ScreenClear;

     Fpie2060c.P_help.Caption := '전체인원수를 계산중입니다.';
     Application.Processmessages;
     begin //전체인원을 구한다.
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG  ');
//     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE (TONGYM = '''+ltongym+''')');
     Query1.Open;
     while not Query1.EOF do
           begin
                data1 := Query1.Fields[0].AsInteger;//인원 총계
                Tinwon := Tinwon + data1;
                Query1.next
           end;
     end;
     Fpie2060c.P_help.Caption := '정규직 인원수를 계산중입니다.';
     Application.Processmessages;
     begin//정규직인원을 구한다.
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SUM(INWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE ((TONGYM = '''+ltongym+''') AND ');
     Query1.SQL.ADD('       (JOBGUN >= ''10'') AND (JOBGUN <= ''50'')) ');
     Query1.Open;
     while not Query1.EOF do
           begin
                data2 := Query1.Fields[0].AsInteger;//인원 총계
                Rinwon := Rinwon + data2;
                Query1.next
           end;
     end;
     Query1.Close;
     Fpie2060c.Gauge1.Progress := 10;
end;

procedure TFpie20603.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      tdata1 := 0;   tdata2 := 0;   tdata3 := 0;  tdata4 := 0;    tdata5 := 0;
      tdata6 := 0;   tdata7 := 0;   tdata8 := 0;  tdata9 := 0;    tdata10:= 0;
      tdata11:= 0;   tdata12:= 0;   ImWonCount := 0;
      tdata13:= 0;
      tdata13_1:= 0; //전문계약직 추가 2002.08.27 shm 

     //1.임원 해당 데이타를 가져온다......
     Fpie2060c.P_help.Caption := '직군별 인원수를 계산중입니다.';
     Application.Processmessages;
     begin
     dataclear;
     ljobgun := '00';      // 임원
     HaveData;
           while not Query1.EOF do
                 begin
                      Tempcl := Query1.Fields[0].AsString;//직급
                      Tempin := Query1.Fields[1].AsInteger;//직급별인원
                      data1  := data1 + tempin;
                      Query1.next;
                 end;
                 QRLwe.Caption := FormatFloat('#,##', data1);
                 QRLws.Caption := FormatFloat('##,##', data1);
                 if data1 > 0 then begin
                  trdat1 := (data1/Tinwon)*100;
                  end
                 else begin
                  trdat1 := 0;
                  end;
                 if trdat1 <> 0 then
                    QRLwtr.Caption := FormatFloat('##0.0', trdat1);
     end;
     ImWonCount := data1;       //임원수를 일단 저장
     Fpie2060c.Gauge1.Progress := 20;

     //2.관리직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '10';    // 관리직
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
                      QRLa8.Caption := FormatFloat('#,##', data8);
                      QRLa9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLas.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLar.Caption  := FormatFloat('##0.0', trdat1);  // 정규 비율
                      if trdat2 <> 0 then
                         QRLatr.Caption := FormatFloat('##0.0', trdat2);  // 전체 비율
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLa1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLa2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLa3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLa4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLa5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLa6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLa7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLa8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLa9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLars.Caption  := FormatFloat('#0.0', rdats);

          Fpie2060c.Gauge1.Progress := 30;

     //3.기술직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '20';
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
                      QRLb8.Caption := FormatFloat('#,##', data8);
                      QRLb9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLbs.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLbr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLbtr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLb1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLb2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLb3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLb4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLb5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLb6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLb7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLb8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLb9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLbrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 40;

     //4.연구직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '30';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLc1.Caption := FormatFloat('#,##', data1);
                      QRLc2.Caption := FormatFloat('#,##', data2);
                      QRLc3.Caption := FormatFloat('#,##', data3);
                      QRLc4.Caption := FormatFloat('#,##', data4);
                      QRLc5.Caption := FormatFloat('#,##', data5);
                      QRLc6.Caption := FormatFloat('#,##', data6);
                      QRLc7.Caption := FormatFloat('#,##', data7);
                      QRLc8.Caption := FormatFloat('#,##', data8);
                      QRLc9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLcs.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLcr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLctr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLc1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLc2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLc3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLc4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLc5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLc6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLc7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLc8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLc9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLcrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 50;

     //5.영업직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '40';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata1;
                      Query1.next;
                 end;
                      QRLd1.Caption := FormatFloat('#,##', data1);
                      QRLd2.Caption := FormatFloat('#,##', data2);
                      QRLd3.Caption := FormatFloat('#,##', data3);
                      QRLd4.Caption := FormatFloat('#,##', data4);
                      QRLd5.Caption := FormatFloat('#,##', data5);
                      QRLd6.Caption := FormatFloat('#,##', data6);
                      QRLd7.Caption := FormatFloat('#,##', data7);
                      QRLd8.Caption := FormatFloat('#,##', data8);
                      QRLd9.Caption := FormatFloat('#,##', data9);
                      datas := data1+data2+data3+data4+data5+data6+data7+data8+data9;
                      QRLds.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLdr.Caption  := FormatFloat('##0.0', trdat1);
                      if trdat2 <> 0 then
                         QRLdtr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata1 := tdata1+data1;  tdata2 := tdata2+data2;
                 tdata3 := tdata3+data3;  tdata4 := tdata4+data4;
                 tdata5 := tdata5+data5;  tdata6 := tdata6+data6;
                 tdata7 := tdata7+data7;  tdata8 := tdata8+data8;
                 tdata9 := tdata9+data9;  tdatas := tdatas+datas;

        //  비율을 구한다
                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLd1r.Caption  := FormatFloat('#0.0', rdat1);

                 if data2 > 0 then begin
                    rdat2 := (data2/Rinwon)*100;
                    end
                 else begin
                    rdat2 := 0;
                    end;
                 if rdat2 <> 0 then
                    QRLd2r.Caption  := FormatFloat('#0.0', rdat2);

                 if data3 > 0 then begin
                    rdat3 := (data3/Rinwon)*100;
                    end
                 else begin
                    rdat3 := 0;
                    end;
                 if rdat3 <> 0 then
                    QRLd3r.Caption  := FormatFloat('#0.0', rdat3);

                 if data4 > 0 then begin
                    rdat4 := (data4/Rinwon)*100;
                    end
                 else begin
                    rdat4 := 0;
                    end;
                 if rdat4 <> 0 then
                    QRLd4r.Caption  := FormatFloat('#0.0', rdat4);

                 if data5 > 0 then begin
                    rdat5 := (data5/Rinwon)*100;
                    end
                 else begin
                    rdat5 := 0;
                    end;
                 if rdat5 <> 0 then
                    QRLd5r.Caption  := FormatFloat('#0.0', rdat5);

                 if data6 > 0 then begin
                    rdat6 := (data6/Rinwon)*100;
                    end
                 else begin
                    rdat6 := 0;
                    end;
                 if rdat6 <> 0 then
                    QRLd6r.Caption  := FormatFloat('#0.0', rdat6);

                 if data7 > 0 then begin
                    rdat7 := (data7/Rinwon)*100;
                    end
                 else begin
                    rdat7 := 0;
                    end;
                 if rdat7 <> 0 then
                    QRLd7r.Caption  := FormatFloat('#0.0', rdat7);

                 if data8 > 0 then begin
                    rdat8 := (data8/Rinwon)*100;
                    end
                 else begin
                    rdat8 := 0;
                    end;
                 if rdat8 <> 0 then
                    QRLd8r.Caption  := FormatFloat('#0.0', rdat8);

                 if data9 > 0 then begin
                    rdat9 := (data9/Rinwon)*100;
                    end
                 else begin
                   rdat9 := 0;
                    end;
                 if rdat9 <> 0 then
                    QRLd9r.Caption  := FormatFloat('#0.0', rdat9);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLdrs.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 60;

     //6.특정직 해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '50';
     HaveData;
           while not Query1.EOF do
                 begin
                      Whiledata2;  // 특정직 처리
                      Query1.next;
                 end;
                      QRLe10.Caption := FormatFloat('#,##', data1);
                      datas := data1;
                      QRLes.Caption := FormatFloat('##,##', datas);

                      if datas > 0 then begin
                         trdat1 := (datas/Rinwon)*100;
                         trdat2 := (datas/Tinwon)*100;
                         end
                      else begin
                         trdat1 := 0;
                         trdat2 := 0;
                         end;
                      if trdat1 <> 0 then
                         QRLer.Caption  := FormatFloat('##0.0', trdat1);
                      if rdat2 <> 0 then
                         QRLetr.Caption := FormatFloat('##0.0', trdat2);
                 end;

                 tdata10:= tdata10+datas;   //  정규직의 특정직 합을 위하여

        //  비율을 구한다

                 if data1 > 0 then begin
                    rdat1 := (data1/Rinwon)*100;
                    end
                 else begin
                    rdat1 := 0;
                    end;
                 if rdat1 <> 0 then
                    QRLe10r.Caption  := FormatFloat('#0.0', rdat1);

                 if datas > 0 then begin
                    rdats := (data10/Rinwon)*100;
                    end
                 else begin
                    rdats := 0;
                    end;
                 if rdats <> 0 then
                    QRLers.Caption  := FormatFloat('#0.0', rdats);

     Fpie2060c.Gauge1.Progress := 70;

     //정규직 계와 비율을 구한다..............
     QRLst1.Caption := FormatFloat('#,##', tdata1);
     QRLst2.Caption := FormatFloat('#,##', tdata2);
     QRLst3.Caption := FormatFloat('#,##', tdata3);
     QRLst4.Caption := FormatFloat('#,##', tdata4);
     QRLst5.Caption := FormatFloat('#,##', tdata5);
     QRLst6.Caption := FormatFloat('#,##', tdata6);
     QRLst7.Caption := FormatFloat('#,##', tdata7);
     QRLst8.Caption := FormatFloat('#,##', tdata8);
     QRLst9.Caption := FormatFloat('#,##', tdata9);
     QRLst10.Caption:= FormatFloat('#,##', tdata10);
     tdatas := tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8+tdata9+tdata10;
     QRLsts.Caption := FormatFloat('##,##', tdatas);

     if tdatas > 0 then begin
        trdat1 := (tdatas/Rinwon)*100;
        trdat2 := (tdatas/Tinwon)*100;
        end
     else begin
        trdat1 := 0;
        trdat2 := 0;
        end;
     if trdat1 <> 0 then
     begin
          QRLsrs.Caption  := FormatFloat('##0.0', trdat1);
          QRLstr.Caption  := FormatFloat('##0.0', trdat1);
     end;
     if trdat2 <> 0 then
        QRLsttr.Caption := FormatFloat('##0.0', trdat2);

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
        QRLsr8.Caption  := FormatFloat('#0.0', rdat8);

     if tdata9 > 0 then begin
        rdat9 := (tdata9/Rinwon)*100;
        end
     else begin
        rdat9 := 0;
        end;
     if rdat9 <> 0 then
        QRLsr9.Caption  := FormatFloat('#0.0', rdat9);

     if tdata10 > 0 then begin
        rdat10 := (tdata10/Rinwon)*100;
        end
     else begin
        rdat10 := 0;
        end;
     if rdat10 <> 0 then
        QRLsre.Caption  := FormatFloat('#0.0', rdat10);

     Fpie2060c.Gauge1.Progress := 80;

     //7.협력직  해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := 'H1';
     HaveData;
           while not Query1.EOF do
                 begin
                      whiledata2;
                      Query1.next;
                 end;
                 QRLhe.Caption := FormatFloat('##,##', data2);
                 datas := data2;
                 QRLhs.Caption := FormatFloat('#,##', datas);
                 QRLtte.Caption:= FormatFloat('##,##', datas);
     end;
     tdata11 := tdata11+datas;
     Fpie2060c.Gauge1.Progress := 90;
  // 비율을 구한다
     if datas > 0 then begin
        trdat1 := (datas/Tinwon)*100;
        end
     else begin
        trdat1 := 0;
        end;
     if trdat1 <> 0 then
        QRLhtr.Caption  := FormatFloat('##0.0', trdat1);

     Fpie2060c.Gauge1.Progress := 95;

     //8-1.전문계약직  해당 데이타를 가져온다...... 2002.08.27 shm 추가
     begin
     dataclear;
     ljobgun := '70';
     HaveData;
     Tempin := Query1.Fields[0].AsInteger;//직급별인원

                 QRLjcon1.Caption := FormatFloat('##,##', Tempin);
                 datas  := Tempin;
                 QRLjcon.Caption := FormatFloat('#,##', datas);
                 QRLjcte.Caption:= FormatFloat('##,##', datas);
     end;

     tdata13_1 := datas;
     Fpie2060c.Gauge1.Progress := 87;
  // 비율을 구한다
     if datas > 0 then begin
        QRLjcontr.Caption  := FormatFloat('##0.0', (datas/Tinwon)*100);
        end;


     Fpie2060c.Gauge1.Progress := 90;

     //8-2.계약직  해당 데이타를 가져온다......
     begin
     dataclear;
     ljobgun := '90';
     HaveData;
//           while not Query1.EOF do
//                 begin
//                      whiledata2;
//                      Query1.next;
//                 end;
     Tempin := Query1.Fields[0].AsInteger;//직급별인원

                 QRLcon1.Caption := FormatFloat('##,##', Tempin);
                 datas  := Tempin;
                 QRLcon.Caption := FormatFloat('#,##', datas);
                 QRLcte.Caption:= FormatFloat('##,##', datas);
     end;

     tdata13 := datas;
     Fpie2060c.Gauge1.Progress := 90;
  // 비율을 구한다
     if datas > 0 then begin
//        trdat1 := (datas/Tinwon)*100;
        QRLcontr.Caption  := FormatFloat('##0.0', (datas/Tinwon)*100);
        end;


     Fpie2060c.Gauge1.Progress := 95;


//총계와 전체 비율을 구한다...........................
    begin
         QRLtt0.Caption := FormatFloat('#,##', ImwonCount);
         QRLtt1.Caption := FormatFloat('#,##', tdata1);
         QRLtt2.Caption := FormatFloat('#,##', tdata2);
         QRLtt3.Caption := FormatFloat('#,##', tdata3);
         QRLtt4.Caption := FormatFloat('#,##', tdata4);
         QRLtt5.Caption := FormatFloat('#,##', tdata5);
         QRLtt6.Caption := FormatFloat('#,##', tdata6);
         QRLtt7.Caption := FormatFloat('#,##', tdata7);
         QRLtt8.Caption := FormatFloat('#,##', tdata8);
         QRLtt9.Caption := FormatFloat('#,##', tdata9);
         QRLtt10.Caption:= FormatFloat('#,##', tdata10);
         QRLtte.Caption := FormatFloat('#,##', tdata11);
         QRLcte.Caption := FormatFloat('#,##', tdata13);
         QRLjcte.Caption := FormatFloat('#,##', tdata13_1); //전문계약직 추가 2002.08.27 shm
         tdatas := ImWonCount+tdata1+tdata2+tdata3+tdata4+tdata5+tdata6+tdata7+tdata8+tdata9+tdata10+tdata11
                 +tdata13+tdata13_1;
         QRLtts.Caption := FormatFloat('##,##', tdatas);

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
            QRLrr9.Caption  := FormatFloat('#0.0', rdat9);

         if tdata10 > 0 then begin
            rdat10 := (tdata10/Tinwon)*100;
            end
         else begin
            rdat10 := 0;
            end;
         if rdat10 <> 0 then
            QRLrr10.Caption  := FormatFloat('#0.0', rdat10);

         if tdata11 > 0 then begin
            rdat11 := (tdata11/Tinwon)*100;
            end
         else begin
            rdat11 := 0;
            end;
         if rdat11 <> 0 then
            QRLrre.Caption  := FormatFloat('#0.0', rdat11);

         if tdata13 > 0 then begin
            rdat13 := (tdata13/Tinwon)*100;
            end
         else begin
            rdat13 := 0;
            end;
         if rdat13 <> 0 then
            QRLconrr.Caption  := FormatFloat('#0.0', rdat13);
//전문계약직 추가 2002.08.27 shm
         if tdata13_1 > 0 then begin
            rdat13_1 := (tdata13_1/Tinwon)*100;
            end
         else begin
            rdat13_1 := 0;
            end;
         if rdat13_1 <> 0 then
            QRLjconrr.Caption  := FormatFloat('#0.0', rdat13_1);



         if tdatas > 0 then begin
            trdat1 := (tdatas/Tinwon)*100;
            end
         else begin
            trdat1 := 0;
            end;
         if trdat1 <> 0 then
         begin
            QRLrrs.Caption := FormatFloat('##0.0', trdat1);
            QRLtt.Caption  := FormatFloat('##0.0', trdat1);
         end;

         if ImwonCount > 0 then begin
            trdat2 := (ImwonCount/Tinwon)*100;
            end
         else begin
            trdat2 := 0;
            end;
         if trdat2 <> 0 then
         begin
            QRLrr0.Caption  := FormatFloat('##0.0', trdat2);
         end;

    end;

    Fpie2060c.Gauge1.Progress := 100;
    Fpie2060c.Gauge1.Progress := 0;

end;

procedure TFpie20603.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

end.
