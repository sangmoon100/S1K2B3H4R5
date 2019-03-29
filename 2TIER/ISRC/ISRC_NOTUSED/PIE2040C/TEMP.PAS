unit temp;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, Math;

type
  TFpie20703 = class(TForm)
    QRBand1: TQRBand;
    QRDetail: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    QRLdate: TQRLabel;
    QRLaaak7: TQRShape;
    QRShape3: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape48: TQRShape;
    A1: TQRLabel;
    A2: TQRLabel;
    A3: TQRLabel;
    A4: TQRLabel;
    A5: TQRLabel;
    A6: TQRLabel;
    A7: TQRLabel;
    A8: TQRLabel;
    A9: TQRLabel;
    A10: TQRLabel;
    A11: TQRLabel;
    A13: TQRLabel;
    A14: TQRLabel;
    QReport: TQuickRep;
    QRLabel2: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    B1: TQRLabel;
    B2: TQRLabel;
    B3: TQRLabel;
    B4: TQRLabel;
    B5: TQRLabel;
    B6: TQRLabel;
    B7: TQRLabel;
    B8: TQRLabel;
    B9: TQRLabel;
    B10: TQRLabel;
    B11: TQRLabel;
    B13: TQRLabel;
    B14: TQRLabel;
    C1: TQRLabel;
    C2: TQRLabel;
    C3: TQRLabel;
    C4: TQRLabel;
    C5: TQRLabel;
    C6: TQRLabel;
    C7: TQRLabel;
    C8: TQRLabel;
    C9: TQRLabel;
    C10: TQRLabel;
    C11: TQRLabel;
    C13: TQRLabel;
    C14: TQRLabel;
    D1: TQRLabel;
    D2: TQRLabel;
    D3: TQRLabel;
    D4: TQRLabel;
    D5: TQRLabel;
    D6: TQRLabel;
    D7: TQRLabel;
    D8: TQRLabel;
    D9: TQRLabel;
    D10: TQRLabel;
    D11: TQRLabel;
    D13: TQRLabel;
    D14: TQRLabel;
    E1: TQRLabel;
    E2: TQRLabel;
    E3: TQRLabel;
    E4: TQRLabel;
    E5: TQRLabel;
    E6: TQRLabel;
    E7: TQRLabel;
    E8: TQRLabel;
    E9: TQRLabel;
    E10: TQRLabel;
    E11: TQRLabel;
    E13: TQRLabel;
    E14: TQRLabel;
    F1: TQRLabel;
    F2: TQRLabel;
    F3: TQRLabel;
    F4: TQRLabel;
    F5: TQRLabel;
    F6: TQRLabel;
    F7: TQRLabel;
    F8: TQRLabel;
    F9: TQRLabel;
    F10: TQRLabel;
    F11: TQRLabel;
    F13: TQRLabel;
    F14: TQRLabel;
    G1: TQRLabel;
    G2: TQRLabel;
    G3: TQRLabel;
    G4: TQRLabel;
    G5: TQRLabel;
    G6: TQRLabel;
    G7: TQRLabel;
    G8: TQRLabel;
    G9: TQRLabel;
    G10: TQRLabel;
    G11: TQRLabel;
    G13: TQRLabel;
    G14: TQRLabel;
    H1: TQRLabel;
    H2: TQRLabel;
    H3: TQRLabel;
    H4: TQRLabel;
    H5: TQRLabel;
    H6: TQRLabel;
    H7: TQRLabel;
    H8: TQRLabel;
    H9: TQRLabel;
    H10: TQRLabel;
    H11: TQRLabel;
    H13: TQRLabel;
    H14: TQRLabel;
    I1: TQRLabel;
    I2: TQRLabel;
    I3: TQRLabel;
    I4: TQRLabel;
    I5: TQRLabel;
    I6: TQRLabel;
    I7: TQRLabel;
    I8: TQRLabel;
    I9: TQRLabel;
    I10: TQRLabel;
    I11: TQRLabel;
    I13: TQRLabel;
    I14: TQRLabel;
    J1: TQRLabel;
    J2: TQRLabel;
    J3: TQRLabel;
    J4: TQRLabel;
    J5: TQRLabel;
    J6: TQRLabel;
    J7: TQRLabel;
    J8: TQRLabel;
    J9: TQRLabel;
    J10: TQRLabel;
    J11: TQRLabel;
    J13: TQRLabel;
    J14: TQRLabel;
    K1: TQRLabel;
    K2: TQRLabel;
    K3: TQRLabel;
    K4: TQRLabel;
    K5: TQRLabel;
    K6: TQRLabel;
    K7: TQRLabel;
    K8: TQRLabel;
    K9: TQRLabel;
    K10: TQRLabel;
    K11: TQRLabel;
    K13: TQRLabel;
    K14: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    L3: TQRLabel;
    L4: TQRLabel;
    L5: TQRLabel;
    L6: TQRLabel;
    L7: TQRLabel;
    L8: TQRLabel;
    L9: TQRLabel;
    L10: TQRLabel;
    L11: TQRLabel;
    L13: TQRLabel;
    L14: TQRLabel;
    M1: TQRLabel;
    M2: TQRLabel;
    M3: TQRLabel;
    M4: TQRLabel;
    M5: TQRLabel;
    M6: TQRLabel;
    M7: TQRLabel;
    M8: TQRLabel;
    M9: TQRLabel;
    M10: TQRLabel;
    M11: TQRLabel;
    M13: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLjobym: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape6: TQRShape;
    QRLremark: TQRLabel;
    QRShape16: TQRShape;
    QRLabel35: TQRLabel;
    M14: TQRLabel;
    A15: TQRLabel;
    B15: TQRLabel;
    C15: TQRLabel;
    D15: TQRLabel;
    E15: TQRLabel;
    F15: TQRLabel;
    G15: TQRLabel;
    H15: TQRLabel;
    I15: TQRLabel;
    J15: TQRLabel;
    K15: TQRLabel;
    L15: TQRLabel;
    QRShape22: TQRShape;
    QRLabel36: TQRLabel;
    A12: TQRLabel;
    B12: TQRLabel;
    C12: TQRLabel;
    D12: TQRLabel;
    E12: TQRLabel;
    F12: TQRLabel;
    G12: TQRLabel;
    H12: TQRLabel;
    I12: TQRLabel;
    J12: TQRLabel;
    K12: TQRLabel;
    L12: TQRLabel;
    M12: TQRLabel;
    M15: TQRLabel;
    procedure QRDetailBeforePrint(var PrintBand: Boolean);
    procedure QReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    { Private declarations }
    SortBy : string;     {X : 작성구분}
    procedure ScreenClear;
  public
    { Public declarations }
    Gj : integer;    {Row Count}
    Areport : TQuickRep;
  end;

var
  Fpie20703: TFpie20703;
  Tempcl,Ltongym,ljobline,jjh: String;
  lsdept1,lsdept2,lsdept3,lsdept4,lsdept5,lsdept6,lsdept7,lsdept8:String[5];
  lkdept1,lkdept2,lkdept3,lkdept4,lkdept5,lkdept6,lkdept7,lkdept8:String[5];
  Ci : Integer;
  sqlstr : ansistring;
implementation
{$R *.DFM}

Uses e2070c, Pie20702;

procedure TFpie20703.ScreenClear;
begin
     A1.caption := '';
     A2.caption := '';
     A3.caption := '';
     A4.caption := '';
     A5.caption := '';
     A6.caption := '';
     A7.caption := '';
     A8.caption := '';
     A9.caption := '';
     A10.caption := '';
     A11.caption := '';
     A12.caption := '';
     A13.caption := '';
     A14.caption := '';
     A15.caption := '';

     B1.caption := '';
     B2.caption := '';
     B3.caption := '';
     B4.caption := '';
     B5.caption := '';
     B6.caption := '';
     B7.caption := '';
     B8.caption := '';
     B9.caption := '';
     B10.caption := '';
     B11.caption := '';
     B12.caption := '';
     B13.caption := '';
     B14.caption := '';
     B15.caption := '';

     C1.caption := '';
     C2.caption := '';
     C3.caption := '';
     C4.caption := '';
     C5.caption := '';
     C6.caption := '';
     C7.caption := '';
     C8.caption := '';
     C9.caption := '';
     C10.caption := '';
     C11.caption := '';
     C12.caption := '';
     C13.caption := '';
     C14.caption := '';
     C15.caption := '';

     D1.caption := '';
     D2.caption := '';
     D3.caption := '';
     D4.caption := '';
     D5.caption := '';
     D6.caption := '';
     D7.caption := '';
     D8.caption := '';
     D9.caption := '';
     D10.caption := '';
     D11.caption := '';
     D12.caption := '';
     D13.caption := '';
     D14.caption := '';
     D15.caption := '';

     E1.caption := '';
     E2.caption := '';
     E3.caption := '';
     E4.caption := '';
     E5.caption := '';
     E6.caption := '';
     E7.caption := '';
     E8.caption := '';
     E9.caption := '';
     E10.caption := '';
     E11.caption := '';
     E12.caption := '';
     E13.caption := '';
     E14.caption := '';
     E15.caption := '';

     F1.caption := '';
     F2.caption := '';
     F3.caption := '';
     F4.caption := '';
     F5.caption := '';
     F6.caption := '';
     F7.caption := '';
     F8.caption := '';
     F9.caption := '';
     F10.caption := '';
     F11.caption := '';
     F12.caption := '';
     F13.caption := '';
     F14.caption := '';
     F15.caption := '';

     G1.caption := '';
     G2.caption := '';
     G3.caption := '';
     G4.caption := '';
     G5.caption := '';
     G6.caption := '';
     G7.caption := '';
     G8.caption := '';
     G9.caption := '';
     G10.caption := '';
     G11.caption := '';
     G12.caption := '';
     G13.caption := '';
     G14.caption := '';
     G15.caption := '';

     H1.caption := '';
     H2.caption := '';
     H3.caption := '';
     H4.caption := '';
     H5.caption := '';
     H6.caption := '';
     H7.caption := '';
     H8.caption := '';
     H9.caption := '';
     H10.caption := '';
     H11.caption := '';
     H12.caption := '';
     H13.caption := '';
     H14.caption := '';
     H15.caption := '';

     I1.caption := '';
     I2.caption := '';
     I3.caption := '';
     I4.caption := '';
     I5.caption := '';
     I6.caption := '';
     I7.caption := '';
     I8.caption := '';
     I9.caption := '';
     I10.caption := '';
     I11.caption := '';
     I12.caption := '';
     I13.caption := '';
     I14.caption := '';
     I15.caption := '';

     J1.caption := '';
     J2.caption := '';
     J3.caption := '';
     J4.caption := '';
     J5.caption := '';
     J6.caption := '';
     J7.caption := '';
     J8.caption := '';
     J9.caption := '';
     J10.caption := '';
     J11.caption := '';
     J12.caption := '';
     J13.caption := '';
     J14.caption := '';
     J15.caption := '';

     K1.caption := '';
     K2.caption := '';
     K3.caption := '';
     K4.caption := '';
     K5.caption := '';
     K6.caption := '';
     K7.caption := '';
     K8.caption := '';
     K9.caption := '';
     K10.caption := '';
     K11.caption := '';
     K12.caption := '';
     K13.caption := '';
     K14.caption := '';
     K15.caption := '';

     L1.caption := '';
     L2.caption := '';
     L3.caption := '';
     L4.caption := '';
     L5.caption := '';
     L6.caption := '';
     L7.caption := '';
     L8.caption := '';
     L9.caption := '';
     L10.caption := '';
     L11.caption := '';
     L12.caption := '';
     L13.caption := '';
     L14.caption := '';
     L15.caption := '';

     M1.caption := '';
     M2.caption := '';
     M3.caption := '';
     M4.caption := '';
     M5.caption := '';
     M6.caption := '';
     M7.caption := '';
     M8.caption := '';
     M9.caption := '';
     M10.caption := '';
     M11.caption := '';
     M12.caption := '';
     M13.caption := '';
     M14.caption := '';
     M15.caption := '';
end;

procedure TFpie20703.QRDetailBeforePrint(var PrintBand: Boolean);
var
   Cdate, paycl : String;
   ARow : Array[1..15] of Real;
   BRow : Array[1..15] of Real;
   CRow : Array[1..15] of Real;
   DRow : Array[1..15] of Real;
   ERow : Array[1..15] of Real;
   FRow : Array[1..15] of Real;
   GRow : Array[1..15] of Real;
   HRow : Array[1..15] of Real;
   IRow : Array[1..15] of Real;
   JRow : Array[1..15] of Real;
   KRow : Array[1..15] of Real;
   LRow : Array[1..15] of Real;
   MRow : Array[1..15] of Real;

   i,j  : integer;
   tmp  : real;
begin
     {날짜를 가져와 보여준다........................................................}
     Cdate := Fpie2070c.L_CurDate.Caption;
     QRLdate.Caption := Copy(Cdate,1,4)+'/'+Copy(CDate,6,2)+'/'+Copy(CDate,9,2);
     Ltongym := Fpie2070c.Mrunyymm.text;
     QRLjobym.Caption := Copy(Ltongym,1,4) + '년 '+ Copy(Ltongym,5,2) + '월';

     for i := 1 to 15 do
     begin
     Arow[i] := 0;
     Brow[i] := 0;
     Crow[i] := 0;
     Drow[i] := 0;
     Erow[i] := 0;
     Frow[i] := 0;
     Grow[i] := 0;
     Hrow[i] := 0;
     Irow[i] := 0;
     Jrow[i] := 0;
     Krow[i] := 0;
     Lrow[i] := 0;
     Mrow[i] := 0;
     end;


     // =================================================
     // 계약직 항목추가
     // =================================================
     sqlstr := 'select paycl, sum(drinwon) cnt1, sum(srinwon) cnt2, sum(bainwon) cnt3,' + #13 +
               '       sum(coinwon) cnt4, sum(hiinwon) cnt5, sum(miinwon) cnt6        ' + #13 +
               'from   pihtong' + #13 +
        format('where  tongym = ''%s'' ',[ltongym]) + #13 +
               'and    substr(paycl,1,1) <> ''0'' ' + #13 +
        format('and    paycl < ''%s'' ',[fpie2070c.jipaycl]) + #13 +
        format('and  ((deptcode >= ''%s'' and deptcode <= ''%s'') ',[lsdept1,lsdept2]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s'') ',[lsdept3,lsdept4]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s'') ',[lsdept5,lsdept6]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s''))',[lsdept7,lsdept8]) + #13 +
               'group by paycl';

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(sqlstr);
     Query1.Open;
     {
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT PAYCL,SUM(DRINWON),SUM(SRINWON),SUM(BAINWON), ');
     Query1.SQL.ADD('        SUM(COINWON),SUM(HIINWON),SUM(MIINWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE  ((TONGYM = '''+ltongym+''') AND ');
     Query1.SQL.ADD('        (SUBSTR(PAYCL,1,1) <> ''0'') AND ');
     Query1.SQL.ADD('        (PAYCL <  '''+Fpie2070c.Jipaycl+''') AND ');
     Query1.SQL.ADD('       (((DEPTCODE >= '''+lsdept1+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept2+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept3+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept4+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept5+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept6+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept7+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept8+''')))) ');
     Query1.SQL.ADD(' GROUP BY PAYCL ');
     Query1.Open;
     }

     Fpie2070c.P_Help.Caption := '연구인력을 계산중입니다.';
     Application.Processmessages;

     Fpie2070c.Gauge1.Progress := 0;
     Fpie2070c.Gauge1.MaxValue := Query1.RecordCount;
     Ci := 1;

     while not Query1.eof do
     begin
           Fpie2070c.Gauge1.Progress := Ci;
           Application.ProcessMessages;

           paycl  := Query1.FieldByName('paycl').AsString;

           if paycl = '11' then begin   //SM2급
              ARow[1] := Query1.FieldByName('cnt1').AsFloat;
              BRow[1] := Query1.FieldByName('cnt2').AsFloat;
              CRow[1] := Query1.FieldByName('cnt3').AsFloat;
              DRow[1] := Query1.FieldByName('cnt4').AsFloat;
              ERow[1] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '13' then begin   //SM1급
              ARow[2] := Query1.FieldByName('cnt1').AsFloat;
              BRow[2] := Query1.FieldByName('cnt2').AsFloat;
              CRow[2] := Query1.FieldByName('cnt3').AsFloat;
              DRow[2] := Query1.FieldByName('cnt4').AsFloat;
              ERow[2] := Query1.FieldByName('cnt5').AsFloat;
              end;


           if paycl = '21' then begin   //기존(M2 직급)
              ARow[3] := Query1.FieldByName('cnt1').AsFloat;
              BRow[3] := Query1.FieldByName('cnt2').AsFloat;
              CRow[3] := Query1.FieldByName('cnt3').AsFloat;
              DRow[3] := Query1.FieldByName('cnt4').AsFloat;
              ERow[3] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '23' then begin   //기존(M1 직급)
              ARow[4] := Query1.FieldByName('cnt1').AsFloat;
              BRow[4] := Query1.FieldByName('cnt2').AsFloat;
              CRow[4] := Query1.FieldByName('cnt3').AsFloat;
              DRow[4] := Query1.FieldByName('cnt4').AsFloat;
              ERow[4] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '31' then begin   //기존(S2 직급)
              ARow[5] := Query1.FieldByName('cnt1').AsFloat;
              BRow[5] := Query1.FieldByName('cnt2').AsFloat;
              CRow[5] := Query1.FieldByName('cnt3').AsFloat;
              DRow[5] := Query1.FieldByName('cnt4').AsFloat;
              ERow[5] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '33' then begin   //기존(S1 직급)
              ARow[6] := Query1.FieldByName('cnt1').AsFloat;
              BRow[6] := Query1.FieldByName('cnt2').AsFloat;
              CRow[6] := Query1.FieldByName('cnt3').AsFloat;
              DRow[6] := Query1.FieldByName('cnt4').AsFloat;
              ERow[6] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '41' then begin   //기존(J3 직급)
              ARow[7] := Query1.FieldByName('cnt1').AsFloat;
              BRow[7] := Query1.FieldByName('cnt2').AsFloat;
              CRow[7] := Query1.FieldByName('cnt3').AsFloat;
              DRow[7] := Query1.FieldByName('cnt4').AsFloat;
              ERow[7] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '43' then begin    //기존(J2 직급)
              ARow[8] := Query1.FieldByName('cnt1').AsFloat;
              BRow[8] := Query1.FieldByName('cnt2').AsFloat;
              CRow[8] := Query1.FieldByName('cnt3').AsFloat;
              DRow[8] := Query1.FieldByName('cnt4').AsFloat;
              ERow[8] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '45' then begin   //기존(J1 직급)
              ARow[9] := Query1.FieldByName('cnt1').AsFloat;
              BRow[9] := Query1.FieldByName('cnt2').AsFloat;
              CRow[9] := Query1.FieldByName('cnt3').AsFloat;
              DRow[9] := Query1.FieldByName('cnt4').AsFloat;
              ERow[9] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '93' then begin   //기존(특정직)
              ARow[10] := Query1.FieldByName('cnt1').AsFloat;
              BRow[10] := Query1.FieldByName('cnt2').AsFloat;
              CRow[10] := Query1.FieldByName('cnt3').AsFloat;
              DRow[10] := Query1.FieldByName('cnt4').AsFloat;
              ERow[10] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = 'E1' then begin   //계약
              ARow[12] := Query1.FieldByName('cnt1').AsFloat;
              BRow[12] := Query1.FieldByName('cnt2').AsFloat;
              CRow[12] := Query1.FieldByName('cnt3').AsFloat;
              DRow[12] := Query1.FieldByName('cnt4').AsFloat;
              ERow[12] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = 'H1' then begin   //협력
              ARow[13] := Query1.FieldByName('cnt1').AsFloat;
              BRow[13] := Query1.FieldByName('cnt2').AsFloat;
              CRow[13] := Query1.FieldByName('cnt3').AsFloat;
              DRow[13] := Query1.FieldByName('cnt4').AsFloat;
              ERow[13] := Query1.FieldByName('cnt5').AsFloat;
              end;

           Query1.next;
           inc(ci);
     end;

     // 연구인력 계 (가로방향)
     for i := 1 to 13 do
     begin
     Arow[14] := Arow[i] + Arow[14];
     Brow[14] := Brow[i] + Brow[14];
     Crow[14] := Crow[i] + Crow[14];
     Drow[14] := Drow[i] + Drow[14];
     Erow[14] := Erow[i] + Erow[14];
     end;

     // 연구인력 정규직 소계 (가로방향)
     for i := 1 to 10 do
     begin
     Arow[11] := Arow[i] + Arow[11];
     Brow[11] := Brow[i] + Brow[11];
     Crow[11] := Crow[i] + Crow[11];
     Drow[11] := Drow[i] + Drow[11];
     Erow[11] := Erow[i] + Erow[11];
     end;

     // 연구인력 비율
     tmp := Arow[14] + Brow[14] + Crow[14] + Drow[14] + Erow[14];

     Arow[15] := floor((Arow[14]/tmp*100)*10)/10;
     Brow[15] := floor((Brow[14]/tmp*100)*10)/10;
     Crow[15] := floor((Crow[14]/tmp*100)*10)/10;
     Drow[15] := floor((Drow[14]/tmp*100)*10)/10;
     Erow[15] := floor((Erow[14]/tmp*100)*10)/10;

     // 연구인력 소계 (세로방향)
     for i := 1 to 15 do
         Frow[i] := Arow[i] + Brow[i] + CRow[i] + Drow[i] + Erow[i];

{--------------------------------지원인력 현황---------------------------------}
    {   Fpie2070c.Gauge1.Progress := 0;}

     {연구부서중 지원인원을 구한다.}
     Fpie2070c.P_Help.Caption  := '연구인력중 지원인력을 계산중입니다.';
     Fpie2070c.Gauge1.Progress := 0;
     Application.Processmessages;

     // =================================================
     // 계약직 항목추가
     // =================================================
     sqlstr := 'select paycl, sum(drinwon) cnt1, sum(srinwon) cnt2, sum(bainwon) cnt3,' + #13 +
               '       sum(coinwon) cnt4, sum(hiinwon) cnt5, sum(miinwon) cnt6        ' + #13 +
               'from   pihtong' + #13 +
        format('where  tongym = ''%s'' ',[ltongym]) + #13 +
        format('and    paycl >= ''%s'' ',[fpie2070c.jipaycl]) + #13 +
        format('and  ((deptcode >= ''%s'' and deptcode <= ''%s'') ',[lkdept1,lkdept2]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s'') ',[lkdept3,lkdept4]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s'') ',[lkdept5,lkdept6]) + #13 +
        format('or    (deptcode >= ''%s'' and deptcode <= ''%s''))',[lkdept7,lkdept8]) + #13 +
               'group by paycl';

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(sqlstr);
     Query1.Open;

     {
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT PAYCL,SUM(DRINWON),SUM(SRINWON),SUM(BAINWON), ');
     Query1.SQL.ADD('        SUM(COINWON),SUM(HIINWON),SUM(MIINWON) ');
     Query1.SQL.ADD('   FROM PIHTONG ');
     Query1.SQL.ADD('WHERE  ((TONGYM = '''+ltongym+''') AND ');
     Query1.SQL.ADD('        (PAYCL >= '''+Fpie2070c.Jipaycl+''') AND ');
     Query1.SQL.ADD('       (((DEPTCODE >= '''+lsdept1+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept2+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept3+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept4+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept5+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept6+''')) OR ');
     Query1.SQL.ADD('        ((DEPTCODE >= '''+lsdept7+''') AND ');
     Query1.SQL.ADD('         (DEPTCODE <= '''+lsdept8+''')))) ');
     Query1.SQL.ADD(' GROUP BY PAYCL ');
     Query1.Open;
     }

     //DataCount;
     Fpie2070c.Gauge1.MaxValue := Query1.RecordCount;
     ci := 1;

     {학력별 해당데이타를 출력한다.}
     while not Query1.eof do
     begin
           Fpie2070c.Gauge1.Progress := Ci;
           Application.ProcessMessages;

           paycl  := Query1.FieldByName('paycl').AsString;

           if paycl = '11' then begin   //SM2급
              GRow[1] := Query1.FieldByName('cnt2').AsFloat;
              HRow[1] := Query1.FieldByName('cnt3').AsFloat;
              IRow[1] := Query1.FieldByName('cnt4').AsFloat;
              JRow[1] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '13' then begin   //SM1급
              GRow[2] := Query1.FieldByName('cnt2').AsFloat;
              HRow[2] := Query1.FieldByName('cnt3').AsFloat;
              IRow[2] := Query1.FieldByName('cnt4').AsFloat;
              JRow[2] := Query1.FieldByName('cnt5').AsFloat;
              end;


           if paycl = '21' then begin   //기존(M2 직급)
              GRow[3] := Query1.FieldByName('cnt2').AsFloat;
              HRow[3] := Query1.FieldByName('cnt3').AsFloat;
              IRow[3] := Query1.FieldByName('cnt4').AsFloat;
              JRow[3] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '23' then begin   //기존(M1 직급)
              GRow[4] := Query1.FieldByName('cnt2').AsFloat;
              HRow[4] := Query1.FieldByName('cnt3').AsFloat;
              IRow[4] := Query1.FieldByName('cnt4').AsFloat;
              JRow[4] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '31' then begin   //기존(S2 직급)
              GRow[5] := Query1.FieldByName('cnt2').AsFloat;
              HRow[5] := Query1.FieldByName('cnt3').AsFloat;
              IRow[5] := Query1.FieldByName('cnt4').AsFloat;
              JRow[5] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '33' then begin   //기존(S1 직급)
              GRow[6] := Query1.FieldByName('cnt2').AsFloat;
              HRow[6] := Query1.FieldByName('cnt3').AsFloat;
              IRow[6] := Query1.FieldByName('cnt4').AsFloat;
              JRow[6] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '41' then begin   //기존(J3 직급)
              GRow[7] := Query1.FieldByName('cnt2').AsFloat;
              HRow[7] := Query1.FieldByName('cnt3').AsFloat;
              IRow[7] := Query1.FieldByName('cnt4').AsFloat;
              JRow[7] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '43' then begin    //기존(J2 직급)
              GRow[8] := Query1.FieldByName('cnt2').AsFloat;
              HRow[8] := Query1.FieldByName('cnt3').AsFloat;
              IRow[8] := Query1.FieldByName('cnt4').AsFloat;
              JRow[8] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '45' then begin   //기존(J1 직급)
              GRow[9] := Query1.FieldByName('cnt2').AsFloat;
              HRow[9] := Query1.FieldByName('cnt3').AsFloat;
              IRow[9] := Query1.FieldByName('cnt4').AsFloat;
              JRow[9] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = '93' then begin   //기존(특정직)
              GRow[10] := Query1.FieldByName('cnt2').AsFloat;
              HRow[10] := Query1.FieldByName('cnt3').AsFloat;
              IRow[10] := Query1.FieldByName('cnt4').AsFloat;
              JRow[10] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = 'E1' then begin   //계약
              GRow[11] := Query1.FieldByName('cnt2').AsFloat;
              HRow[11] := Query1.FieldByName('cnt3').AsFloat;
              IRow[11] := Query1.FieldByName('cnt4').AsFloat;
              JRow[11] := Query1.FieldByName('cnt5').AsFloat;
              end;

           if paycl = 'H1' then begin   //협력
              GRow[13] := Query1.FieldByName('cnt2').AsFloat;
              HRow[13] := Query1.FieldByName('cnt3').AsFloat;
              IRow[13] := Query1.FieldByName('cnt4').AsFloat;
              JRow[13] := Query1.FieldByName('cnt5').AsFloat;
              end;

           Query1.next;
           inc(ci);
     end;
     Query1.close;

     // 연구인력 계 (가로방향)
     for i := 1 to 13 do
     begin
     Grow[14] := Grow[i] + Grow[14];
     Hrow[14] := Hrow[i] + Hrow[14];
     Irow[14] := Irow[i] + Irow[14];
     Jrow[14] := Jrow[i] + Jrow[14];
     end;

     // 연구인력 정규직 소계 (가로방향)
     for i := 1 to 10 do
     begin
     Grow[11] := Grow[i] + Grow[11];
     Hrow[11] := Hrow[i] + Hrow[11];
     Irow[11] := Irow[i] + Irow[11];
     Jrow[11] := Jrow[i] + Jrow[11];
     end;

     // 연구인력 비율
     tmp := Grow[14] + Hrow[14] + Irow[14] + Jrow[14];

     if tmp <> 0 then
        begin
        Grow[15] := floor((Grow[14]/tmp*100)*10)/10;
        Hrow[15] := floor((Hrow[14]/tmp*100)*10)/10;
        Irow[15] := floor((Irow[14]/tmp*100)*10)/10;
        Jrow[15] := floor((Jrow[14]/tmp*100)*10)/10;
        end;

     // 연구인력 소계 (세로방향)
     for i := 1 to 15 do
         Krow[i] := Grow[i] + HRow[i] + Irow[i] + Jrow[i];

{--------------------------------지원인력 현황---------------------------------}

     // summary
     for i := 1 to 14 do
         Lrow[i] := Frow[i] + Krow[i];
     Lrow[15] := 100;

     tmp := Lrow[14];
     for i := 1 to 14 do
         Mrow[i] := floor((Lrow[i]/tmp*100)*10)/10;

     // 결과를 출력물에 표시
     for i := 1 to 15 do
     begin
          if Arow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('A'+inttostr(i))).caption := FormatFloat('#,##0.#',Arow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Brow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('B'+inttostr(i))).caption := FormatFloat('#,##0.#',Brow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Crow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('C'+inttostr(i))).caption := FormatFloat('#,##0.#',Crow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Drow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('D'+inttostr(i))).caption := FormatFloat('#,##0.#',Drow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Erow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('E'+inttostr(i))).caption := FormatFloat('#,##0.#',Erow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Frow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('F'+inttostr(i))).caption := FormatFloat('#,##0.#',Frow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Grow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('G'+inttostr(i))).caption := FormatFloat('#,##0.#',Grow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Hrow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('H'+inttostr(i))).caption := FormatFloat('#,##0.#',Hrow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Irow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('I'+inttostr(i))).caption := FormatFloat('#,##0.#',Irow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Jrow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('J'+inttostr(i))).caption := FormatFloat('#,##0.#',Jrow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Krow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('K'+inttostr(i))).caption := FormatFloat('#,##0.#',Krow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Lrow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('L'+inttostr(i))).caption := FormatFloat('#,##0.#',Lrow[i]);
     end;

     for i := 1 to 15 do
     begin
          if Mrow[i] <> 0 then
             TQRLabel(Fpie20703.FindComponent('M'+inttostr(i))).caption := FormatFloat('#,##0.#',Mrow[i]);
     end;
end;

procedure TFpie20703.QReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
     Ltongym := Fpie2070c.Mrunyymm.text;
     Lsdept1 := Fpie2070c.MEdit1.text;    Lsdept2 := Fpie2070c.MEdit2.text;
     Lsdept3 := Fpie2070c.MEdit3.text;    Lsdept4 := Fpie2070c.MEdit4.text;
     Lsdept5 := Fpie2070c.MEdit5.text;    Lsdept6 := Fpie2070c.MEdit6.text;
     Lsdept7 := Fpie2070c.MEdit7.text;    Lsdept8 := Fpie2070c.MEdit8.text;
     Lkdept1 := Fpie2070c.MEdit9.text;    Lkdept2 := Fpie2070c.MEdit10.text;
     Lkdept3 := Fpie2070c.MEdit11.text;   Lkdept4 := Fpie2070c.MEdit12.text;
     Lkdept5 := Fpie2070c.MEdit13.text;   Lkdept6 := Fpie2070c.MEdit14.text;
     Lkdept7 := Fpie2070c.MEdit15.text;   Lkdept8 := Fpie2070c.MEdit16.text;
     ScreenClear; 
end;

end.
