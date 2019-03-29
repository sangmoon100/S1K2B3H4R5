unit Pie20604;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, peprnview, Db, DBTables;

type
  TFpie20604 = class(TForm)
    InReport: TQuickRep;
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
    L1_imwon: TQRLabel;
    L1_Sum: TQRLabel;
    L1_TRatio: TQRLabel;
    L2_10: TQRLabel;
    L2_20: TQRLabel;
    L2_22: TQRLabel;
    L2_Sum: TQRLabel;
    L2_SRatio: TQRLabel;
    L2_TRatio: TQRLabel;
    L7_imwon: TQRLabel;
    L7_10: TQRLabel;
    L7_20: TQRLabel;
    L7_22: TQRLabel;
    L7_Sum: TQRLabel;
    L6_imwon: TQRLabel;
    L6_10: TQRLabel;
    L6_20: TQRLabel;
    L6_22: TQRLabel;
    L6_Sum: TQRLabel;
    L6_SRatio: TQRLabel;
    L6_TRatio: TQRLabel;
    L5_imwon: TQRLabel;
    L5_10: TQRLabel;
    L5_20: TQRLabel;
    L5_22: TQRLabel;
    L5_Sum: TQRLabel;
    L4_imwon: TQRLabel;
    L4_10: TQRLabel;
    L4_20: TQRLabel;
    L4_22: TQRLabel;
    L4_Sum: TQRLabel;
    L4_SRatio: TQRLabel;
    L4_TRatio: TQRLabel;
    L3_imwon: TQRLabel;
    L3_10: TQRLabel;
    L3_20: TQRLabel;
    L3_22: TQRLabel;
    L3_Sum: TQRLabel;
    L8_imwon: TQRLabel;
    L8_10: TQRLabel;
    L8_20: TQRLabel;
    L8_22: TQRLabel;
    L8_Sum: TQRLabel;
    L8_SRatio: TQRLabel;
    L8_TRatio: TQRLabel;
    L9_imwon: TQRLabel;
    L9_10: TQRLabel;
    L9_20: TQRLabel;
    L9_22: TQRLabel;
    L9_Sum: TQRLabel;
    L10_imwon: TQRLabel;
    L10_10: TQRLabel;
    L10_20: TQRLabel;
    L10_22: TQRLabel;
    L10_Sum: TQRLabel;
    L10_SRatio: TQRLabel;
    L10_TRatio: TQRLabel;
    L11_imwon: TQRLabel;
    L11_10: TQRLabel;
    L11_20: TQRLabel;
    L11_22: TQRLabel;
    L11_Sum: TQRLabel;
    L12_Sum: TQRLabel;
    L12_imwon: TQRLabel;
    L12_10: TQRLabel;
    L12_20: TQRLabel;
    L12_22: TQRLabel;
    L13_10: TQRLabel;
    L13_imwon: TQRLabel;
    L13_20: TQRLabel;
    L13_93: TQRLabel;
    L13_22: TQRLabel;
    L13_Sum: TQRLabel;
    L16_Sum: TQRLabel;
    L12_SRatio: TQRLabel;
    L12_TRatio: TQRLabel;
    L16_TRatio: TQRLabel;
    L17_SCont: TQRLabel;
    L16_Gen: TQRLabel;
    L17_TRatio: TQRLabel;
    L17_Sum: TQRLabel;
    L18_Sum: TQRLabel;
    L12_93: TQRLabel;
    L17_32: TQRLabel;
    L17_22: TQRLabel;
    L18_SCont: TQRLabel;
    L18_10: TQRLabel;
    L18_20: TQRLabel;
    L18_22: TQRLabel;
    L18_32: TQRLabel;
    L17_20: TQRLabel;
    L17_10: TQRLabel;
    QRLabel58: TQRLabel;
    QRLjobym: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape43: TQRShape;
    QRShape6: TQRShape;
    QRShape22: TQRShape;
    L2_32: TQRLabel;
    L2_4X: TQRLabel;
    L3_32: TQRLabel;
    L4_32: TQRLabel;
    L5_32: TQRLabel;
    L6_32: TQRLabel;
    L7_32: TQRLabel;
    L8_32: TQRLabel;
    L9_32: TQRLabel;
    L10_32: TQRLabel;
    L11_32: TQRLabel;
    L12_32: TQRLabel;
    L13_32: TQRLabel;
    L3_4X: TQRLabel;
    L4_4X: TQRLabel;
    L5_4X: TQRLabel;
    L6_4X: TQRLabel;
    L7_4X: TQRLabel;
    L8_4X: TQRLabel;
    L9_4X: TQRLabel;
    L10_4X: TQRLabel;
    L11_4X: TQRLabel;
    L12_4X: TQRLabel;
    L13_4X: TQRLabel;
    L17_4X: TQRLabel;
    L18_4X: TQRLabel;
    L17_93: TQRLabel;
    L18_93: TQRLabel;
    L10_93: TQRLabel;
    L11_93: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape26: TQRShape;
    QRLabel24: TQRLabel;
    L17_imwon: TQRLabel;
    L18_imwon: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    L15_Sum: TQRLabel;
    L15_TRatio: TQRLabel;
    L15_Cont: TQRLabel;
    L17_Gen: TQRLabel;
    L18_Gen: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
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
    L13_SRatio: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel38: TQRLabel;
    L14_SCont: TQRLabel;
    L17_Cont: TQRLabel;
    L18_Cont: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel39: TQRLabel;
    L14_Sum: TQRLabel;
    L14_TRatio: TQRLabel;
    QRShape51: TQRShape;
    Label1: TLabel;
    Qry_Mas: TQuery;
    L2_imwon: TQRLabel;
    procedure InReportPreview(Sender: TObject);
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpie20604: TFpie20604;
  Fm_PreviewForm: TFm_PreviewForm;

implementation

uses E2060c;

{$R *.DFM}

procedure TFpie20604.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TFpie20604.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  strTotal, J_Tot, T_Tot : String;
  i        : integer ;
begin
  with Qry_Mas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT NVL(SUM(INWON), 0) TOTAL FROM PIHTONG WHERE TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''');
    Open;
    strTotal := FieldByName('Total').AsString;


    // 정규직 총계
    Close;
    SQL.Clear;
    Sql.Add('SELECT COUNT(*) TOTAL FROM PIMPMAS WHERE ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'') AND PAYCL BETWEEN ''10'' AND ''93'' ');
    Open;
    J_Tot := FieldByName('TOTAL').AsString;

    // 전체 총계
    Close;
    SQL.Clear;
    Sql.Add('SELECT COUNT(*) TOTAL FROM PIMPMAS WHERE ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'') ');
    Open;
    T_Tot := FieldByName('TOTAL').AsString;


    Close;
    SQL.Clear;
    if Fpie2060c.Mrunyymm.Text < '200501' then
    begin
       // 200501월 이전 데이타
       SQL.Add('SELECT DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') JOBGUN, B.CODENAME,        '+
               '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON)) "임원", SUM(DECODE(A.PAYCL,''10'',A.INWON)) "부장",                '+
               '       SUM(DECODE(A.PAYCL,''20'',A.INWON)) "차장"           , SUM(DECODE(A.PAYCL,''22'',A.INWON)) "과장",                '+
               '       SUM(DECODE(A.PAYCL,''32'',A.INWON)) "대리"           , SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON)) "사원",     '+
               '       SUM(DECODE(A.PAYCL,''93'',A.INWON)) "특정"           , SUM(DECODE(A.PAYCL,''C1'',A.INWON)) "전문",                '+
               '       SUM(DECODE(A.PAYCL,''E1'',A.INWON)) "계약", SUM(DECODE(A.PAYCL,''H1'',A.INWON)) "일반", SUM(A.INWON) "직군별총계",'+
               '       ROUND((RATIO_TO_REPORT((SUM(DECODE(A.PAYCL,''10'',A.INWON,0)) + SUM(DECODE(A.PAYCL,''20'',A.INWON,0)) +           '+
               '       SUM(DECODE(A.PAYCL,''22'',A.INWON,0)) + SUM(DECODE(A.PAYCL,''32'',A.INWON,0)) +                                   '+
               '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,0)) +                                                                '+
               '       SUM(DECODE(A.PAYCL,''93'',A.INWON,0)))) OVER()*100),1) AS "정규비율",                                             '+
               '       ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"                                                 '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               ' GROUP BY DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44''),B.CODENAME              '+
               ' UNION ALL                                                                                                               '+
               'SELECT ''TOTAL'' JOBGUN,''직급별 총계'' CODENAME,                                                                        '+
               '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON)) "임원", SUM(DECODE(A.PAYCL,''10'',A.INWON)) "부장",                '+
               '       SUM(DECODE(A.PAYCL,''20'',A.INWON)) "차장",            SUM(DECODE(A.PAYCL,''22'',A.INWON)) "과장",                '+
               '       SUM(DECODE(A.PAYCL,''32'',A.INWON)) "대리",            SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON)) "사원",     '+
               '       SUM(DECODE(A.PAYCL,''93'',A.INWON)) "특정",            SUM(DECODE(A.PAYCL,''C1'',A.INWON)) "전문",                '+
               '       SUM(DECODE(A.PAYCL,''E1'',A.INWON)) "계약",            SUM(DECODE(A.PAYCL,''H1'',A.INWON)) "일반",                '+
               '       SUM(A.INWON) "직군별총계", 0 AS "정규비율", ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"     '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               ' UNION  ALL                                                                                                              '+
               'SELECT ''60'' JOBGUN,''정규계 총계'' CODENAME,                                                                           '+
               '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON)) "임원", SUM(DECODE(A.PAYCL,''10'',A.INWON)) "부장",                '+
               '       SUM(DECODE(A.PAYCL,''20'',A.INWON)) "차장",            SUM(DECODE(A.PAYCL,''22'',A.INWON)) "과장",                '+
               '       SUM(DECODE(A.PAYCL,''32'',A.INWON)) "대리",            SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON)) "사원",     '+
               '       SUM(DECODE(A.PAYCL,''93'',A.INWON)) "특정",            SUM(DECODE(A.PAYCL,''C1'',A.INWON)) "전문",                '+
               '       SUM(DECODE(A.PAYCL,''E1'',A.INWON)) "계약",            SUM(DECODE(A.PAYCL,''H1'',A.INWON)) "일반",                '+
               '       SUM(A.INWON) "직군별총계",                                                                                        '+
               '       ROUND((RATIO_TO_REPORT((SUM(DECODE(A.PAYCL,''10'',A.INWON,0)) +                                                   '+
               '       SUM(DECODE(A.PAYCL,''20'',A.INWON,0)) +                                                                           '+
               '       SUM(DECODE(A.PAYCL,''22'',A.INWON,0)) +                                                                           '+
               '       SUM(DECODE(A.PAYCL,''32'',A.INWON,0)) +                                                                           '+
               '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,0)) +                                                                '+
               '       SUM(DECODE(A.PAYCL,''93'',A.INWON,0)))) OVER()*100),1) AS "정규비율",                                             '+
               '       ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"                                                 '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               '   AND A.PAYCL BETWEEN ''10'' AND ''93''                                                                                 '+
               ' UNION ALL                                                                                                               '+
               'SELECT ''65'' JOBGUN,''정규비율'' CODENAME,                                                                              '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON))/SUM(A.INWON)*100,1) "임원",                                  '+
               '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON))/SUM(A.INWON)*100,1) "부장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON))/SUM(A.INWON)*100,1) "차장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON))/SUM(A.INWON)*100,1) "과장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON))/SUM(A.INWON)*100,1) "대리",                                             '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON))/SUM(A.INWON)*100,1) "사원",                                  '+
               '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON))/SUM(A.INWON)*100,1) "특정",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''C1'',A.INWON))/SUM(A.INWON)*100,1) "전문",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''E1'',A.INWON))/SUM(A.INWON)*100,1) "계약",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''H1'',A.INWON))/SUM(A.INWON)*100,1) "일반",                                             '+
               '       ROUND(SUM(A.INWON)/SUM(A.INWON)*100,1) "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                             '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               '   AND A.PAYCL BETWEEN ''10'' AND ''93''                                                                                 '+
               ' UNION ALL                                                                                                               '+
               'SELECT ''ZZ'' JOBGUN,''전체비율'' CODENAME,                                                                              '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON))/SUM(A.INWON)*100,1) "임원",                                  '+
               '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON))/SUM(A.INWON)*100,1) "부장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON))/SUM(A.INWON)*100,1) "차장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON))/SUM(A.INWON)*100,1) "과장",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON))/SUM(A.INWON)*100,1) "대리",                                             '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON))/SUM(A.INWON)*100,1) "사원",                                  '+
               '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON))/SUM(A.INWON)*100,1) "특정",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''C1'',A.INWON))/SUM(A.INWON)*100,1) "전문",                                             '+
               '       ROUND(SUM(DECODE(A.PAYCL,''E1'',A.INWON))/SUM(A.INWON)*100,1)  "계약",                                            '+
               '       ROUND(SUM(DECODE(A.PAYCL,''H1'',A.INWON))/SUM(A.INWON)*100,1) "일반",                                             '+
               '       ROUND(SUM(A.INWON)/SUM(A.INWON)*100,1) "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                             '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               ' UNION ALL                                                                                                               '+
               'SELECT SUBSTR(DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44''),1,1)||''X'' JOBGUN, '+
               '       B.CODENAME||'' 비율'',                                                                                            '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON))/'''+strTotal+'''*100,1) "임원",                              '+
               '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON))/'''+strTotal+'''*100,1) "부장",                                         '+
               '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON))/'''+strTotal+'''*100,1) "차장",                                         '+
               '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON))/'''+strTotal+'''*100,1) "과장",                                         '+
               '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON))/'''+strTotal+'''*100,1) "대리",                                         '+
               '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON))/'''+strTotal+'''*100,1) "사원",                              '+
               '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON))/'''+strTotal+'''*100,1) "특정",                                         '+
               '       0 "전문", 0 "계약", 0 "일반", 0 "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                                    '+
               '  FROM PIHTONG A,                                                                                                        '+
               '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                                '+
               ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                         '+
               '   AND DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44'') = B.CODENO                 '+
               '   AND A.PAYCL BETWEEN ''10'' AND ''93''                                                                                 '+
               ' GROUP BY DECODE(A.JOBGUN,''00'',''00'',''10'',''11'',''20'',''22'',''30'',''33'',''40'',''44''),B.CODENAME              '+
               ' ORDER BY JOBGUN,CODENAME                                                                                                ');
    end
    else
    begin
       if StrToInt(strTotal) <= 0 then
       begin
          SQL.Add('SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '      ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '      ,SUM(T.직군별총계) "직군별총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                         '+
                  '  FROM                                                                                                                '+
                  '      (SELECT A.JOBGUN, B.CODENAME,                                                                                   '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) "임원",                                         '+
                  '              SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) "부장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) "차장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) "과장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) "대리",                                                  '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) "사원",            '+
                  '              SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) "특정",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''C1'',1,''D91'',1),0)) "전문",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''E1'',1,''H11'',1),0)) "계약",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''H1'',1,''K11'',1),0)) "일반",                                                  '+
                  '              NVL(COUNT(A.PAYCL),0) "직군별총계",                                                                     '+
                  '              ROUND((RATIO_TO_REPORT((SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0))+   '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)))) OVER()*100),1) AS "정규비율",   '+
                  '              ROUND((RATIO_TO_REPORT(COUNT(A.PAYCL)) OVER()*100),1) AS "전체비율"                                     '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM   = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                    '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '        GROUP BY A.JOBGUN, B.CODENAME, SUBSTR(A.PAYCL,1,1), A.PAYCL                                                   '+
                  '       ) T                                                                                                            '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '      ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '	 ,SUM(T.직군별총계) "직군총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                           '+
                  '  FROM                                                                                                                '+
                  '      (SELECT ''TOTAL'' JOBGUN,''BAND별총계'' CODENAME,                                                               '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) "임원",                                         '+
                  '              SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) "부장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) "차장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) "과장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) "대리",                                                  '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) "사원",            '+
                  '              SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) "특정",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''C1'',1,''D91'',1),0)) "전문",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''E1'',1,''H11'',1),0)) "계약",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''H1'',1,''K11'',1),0)) "일반",                                                  '+
                  '              NVL(COUNT(A.PAYCL),0) "직군별총계",                                                                     '+
                  '              0 AS "정규비율", ROUND((RATIO_TO_REPORT(COUNT(A.PAYCL)) OVER()*100),1) AS "전체비율"                    '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                      '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '        GROUP BY SUBSTR(A.PAYCL,1,1), A.PAYCL                                                                         '+
                  '      ) T                                                                                                             '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '	 ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '	 ,SUM(T.직군별총계) "직군총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                           '+
                  '  FROM                                                                                                                '+
                  '      (SELECT ''60'' JOBGUN,''정규계총계'' CODENAME,                                                                  '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) "임원",                                         '+
                  '              SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) "부장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) "차장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) "과장",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) "대리",                                                  '+
                  '              SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) "사원",            '+
                  '              SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) "특정",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''C1'',1,''D91'',1),0)) "전문",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''E1'',1,''H11'',1),0)) "계약",                                                  '+
                  '              SUM(NVL(DECODE(A.PAYCL,''H1'',1,''K11'',1),0)) "일반",                                                  '+
                  '              NVL(COUNT(A.PAYCL),0) "직군별총계",                                                                     '+
                  '              ROUND((RATIO_TO_REPORT((SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0))  +                               '+
                  '                                      SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) +         '+
                  '                                      SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)))) OVER()*100),1) AS "정규비율",   '+
                  '              ROUND((RATIO_TO_REPORT(COUNT(A.PAYCL)) OVER()*100),1) AS "전체비율"                                     '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                      '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '          AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                          '+
                  '        GROUP BY SUBSTR(A.PAYCL,1,1), A.PAYCL                                                                         '+
                  '      ) T                                                                                                             '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '	 ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '	 ,SUM(T.직군별총계) "직군총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                           '+
                  '  FROM                                                                                                                '+
                  '      (SELECT ''65'' JOBGUN, ''정규비율'' CODENAME,                                                                   '+
                  '              0 AS "임원",                                                                                            '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) / '''+T_Tot+''' * 100, 1) "부장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) / '''+T_Tot+''' * 100, 1) "차장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) / '''+T_Tot+''' * 100, 1) "과장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) / '''+T_Tot+''' * 100, 1) "대리",                  '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) /'''+T_Tot+''' *100,1) "사원", '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) / '''+T_Tot+''' * 100 ,1) "특정",                  '+
                  '              0 AS "전문", 0 AS "계약", 0 AS "일반",                                                                  '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) / '''+T_Tot+''' * 100, 1) +               '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) /'''+T_Tot+''' * 100, 1) +    '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) / '''+T_Tot+''' * 100, 1) "직군별총계",            '+
                  '              0 AS "정규비율", 0 AS "전체비율"                                                                        '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                      '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '          AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                                                                        '+
                  '        GROUP BY SUBSTR(A.PAYCL,1,1), A.PAYCL                                                                         '+
                  '      ) T                                                                                                             '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '	 ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '	 ,SUM(T.직군별총계) "직군총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                           '+
                  '  FROM                                                                                                                '+
                  '      (SELECT ''ZZ'' JOBGUN,''전체비율'' CODENAME,                                                                    '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) /'''+T_Tot+'''*100,1) "임원",             '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) / '''+T_Tot+''' * 100, 1) "부장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) / '''+T_Tot+''' * 100, 1) "차장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) / '''+T_Tot+''' * 100, 1) "과장",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) / '''+T_Tot+''' * 100, 1) "대리",                  '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) /'''+T_Tot+''' *100,1) "사원", '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) / '''+T_Tot+''' * 100 ,1) "특정",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''C1'',1,''D91'',1),0)) / '''+T_Tot+''' * 100, 1) "전문",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''E1'',1,''H11'',1),0)) / '''+T_Tot+''' * 100, 1) "계약",                  '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''H1'',1,''K11'',1),0)) / '''+T_Tot+''' * 100, 1) "일반",                  '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''0'',1,''A'',1),0)) / '''+T_Tot+''' * 100, 1) +               '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0)) /'''+T_Tot+''' * 100, 1) +    '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''C1'',1,''D91'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''E1'',1,''H11'',1),0)) / '''+T_Tot+''' * 100, 1) +                        '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''H1'',1,''K11'',1),0)) / '''+T_Tot+''' * 100, 1) "직군별총계",            '+
                  '              0 AS "정규비율", 0 AS "전체비율"                                                                        '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                      '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '        GROUP BY SUBSTR(A.PAYCL,1,1), A.PAYCL                                                                         '+
                  '      ) T                                                                                                             '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' UNION ALL                                                                                                            '+
                  // 정규 : 직군비율                                                                                                    '+
                  'SELECT T.JOBGUN, T.CODENAME                                                                                           '+
                  '      ,SUM(T.임원) "임원" ,SUM(T.부장) "부장" ,SUM(T.차장) "차장" ,SUM(T.과장) "과장" ,SUM(T.대리) "대리"             '+
                  '	 ,SUM(T.사원) "사원" ,SUM(T.특정) "특정" ,SUM(T.전문) "전문" ,SUM(T.계약) "계약" ,SUM(T.일반) "일반"             '+
                  '	 ,SUM(T.직군별총계) "직군총계" ,SUM(T.정규비율) "정규비율" ,SUM(T.전체비율) "전체비율"                           '+
                  '  FROM                                                                                                                '+
                  '      (SELECT SUBSTR(A.JOBGUN,1,1)||''X'' JOBGUN,B.CODENAME||'' 비율'' CODENAME,                                      '+
                  '              0 AS "임원",                                                                                            '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''10'',1,''C11'',1),0)) / '''+T_Tot+''' * 100, 1) "부장",                    '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''20'',1,''C21'',1),0)) / '''+T_Tot+''' * 100, 1) "차장",                    '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''22'',1,''D11'',1),0)) / '''+T_Tot+''' * 100, 1) "과장",                    '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''32'',1,''D21'',1),0)) / '''+T_Tot+''' * 100, 1) "대리",                    '+
                  '              ROUND(SUM(NVL(DECODE(SUBSTR(A.PAYCL,1,1),''4'',1,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',1)),0))/'''+T_Tot+''' *100,1) "사원", '+
                  '              ROUND(SUM(NVL(DECODE(A.PAYCL,''93'',1,''D41'',1),0)) / '''+T_Tot+''' * 100 ,1) "특정",                    '+
                  '              0 "전문", 0 "계약", 0 "일반", 0 "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                          '+
                  '         FROM PIMPMAS A,                                                                                              '+
                  '              (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                      '+
                  '        WHERE A.ORGNUM = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')                      '+
                  '          AND A.PSTATEYN = ''Y''                                                                                      '+
                  '          AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                          '+
                  '          AND A.JOBGUN = B.CODENO                                                                                     '+
                  '        GROUP BY SUBSTR(A.PAYCL,1,1), A.PAYCL, SUBSTR(A.JOBGUN,1,1),B.CODENAME                                        '+
                  '      ) T                                                                                                             '+
                  ' GROUP BY T.JOBGUN, T.CODENAME                                                                                        '+
                  ' ORDER BY JOBGUN, CODENAME                                                                                            ');
       end
       else
       begin
          // 200501월 이후 데이타
          SQL.Add('SELECT DECODE(A.JOBGUN,''12'',''30'',''80'',''70'', A.JOBGUN) JOBGUN, '''' CODENAME,                                                     '+
                  '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON)) "임원",   SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON)) "부장",             '+
                  '       SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON)) "차장",            SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON)) "과장",             '+
                  '       SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON)) "대리",            SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON))) "사원",  '+
                  '       SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON)) "특정",            ' +
                  '       SUM(DECODE(A.PAYCL,''H10'',A.INWON,0)) "전문",            ' +
                  '       SUM(DECODE(A.PAYCL,''H11'',A.INWON,0)) "계약",            ' +
                  '       SUM(DECODE(A.PAYCL,''H1'',A.INWON,''K11'',A.INWON)) "일반",            ' +
                  '       SUM(A.INWON) "직군별총계",                                             ' +
                  '       ROUND((RATIO_TO_REPORT((SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON,0)) +  ' +
                  '       SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON,0)) +                          ' +
                  '       SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON,0)) +                          ' +
                  '       SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON,0)) +                          ' +
                  '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON,0))) +                  '+
                  '       SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON,0)))) OVER()*100),1) AS "정규비율",                          '+
                  '       ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"                                              '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO                                                                                            '+
                  ' GROUP BY DECODE(A.JOBGUN,''12'',''30'',''80'',''70'',A.JOBGUN),''''                                       '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT ''TOTAL'' JOBGUN,''BAND(직급)별총계'' CODENAME,                                                                '+
                  '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON)) "임원", SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON)) "부장",             '+
                  '       SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON)) "차장",          SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON)) "과장",             '+
                  '       SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON)) "대리",          SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON))) "사원",  '+
                  '       SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON)) "특정",          ' +
                  '       SUM(DECODE(A.PAYCL,''H10'',A.INWON,0)) "전문",          ' +
                  '       SUM(DECODE(A.PAYCL,''H11'',A.INWON,0)) "계약",          ' +
                  '       SUM(DECODE(A.PAYCL,''H1'',A.INWON,''K11'',A.INWON)) "일반",          ' +
                  '       SUM(A.INWON) "직군별총계", 0 AS "정규비율", ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"  '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO                                                                                            '+
                  ' UNION  ALL                                                                                                           '+
                  'SELECT ''60'' JOBGUN,''정규계총계'' CODENAME,                                                                         '+
                  '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON)) "임원",   SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON)) "부장",             '+
                  '       SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON)) "차장",            SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON)) "과장",             '+
                  '       SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON)) "대리",            SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON))) "사원",  '+
                  '       SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON)) "특정",            ' +
                  '       SUM(DECODE(A.PAYCL,''H10'',A.INWON,0)) "전문",          ' +
                  '       SUM(DECODE(A.PAYCL,''H11'',A.INWON,0)) "계약",          ' +
                  '       SUM(DECODE(A.PAYCL,''H1'',A.INWON,''K11'',A.INWON)) "일반",             '+
                  '       SUM(A.INWON) "직군별총계",                                                                                     '+
                  '       ROUND((RATIO_TO_REPORT((SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON,0)) +                                                '+
                  '       SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON,0)) +                                                                        '+
                  '       SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON,0)) +                                                                        '+
                  '       SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON,0)) +                                                                        '+
                  '       SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON,0))) +                                                             '+
                  '       SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON,0)))) OVER()*100),1) AS "정규비율",                                          '+
                  '       ROUND((RATIO_TO_REPORT(SUM(A.INWON)) OVER()*100),1) AS "전체비율"                                              '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO                                                                                            '+
                  '   AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                                 '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT ''65'' JOBGUN,''정규비율'' CODENAME,                                                                           '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON))/SUM(A.INWON)*100,1) "임원",                               '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON))/SUM(A.INWON)*100,1) "부장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON))/SUM(A.INWON)*100,1) "차장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON))/SUM(A.INWON)*100,1) "과장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON))/SUM(A.INWON)*100,1) "대리",                                          '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON)))/SUM(A.INWON)*100,1) "사원",    '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON))/SUM(A.INWON)*100,1) "특정",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''C1'',A.INWON,''D91'',A.INWON))/SUM(A.INWON)*100,1) "전문",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''E1'',A.INWON,''H11'',A.INWON))/SUM(A.INWON)*100,1) "계약",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''H1'',A.INWON,''K11'',A.INWON))/SUM(A.INWON)*100,1) "일반",                                          '+
                  '       ROUND(SUM(A.INWON)/SUM(A.INWON)*100,1) "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                          '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO                                                                                            '+
                  '   AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                                 '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT ''ZZ'' JOBGUN,''전체비율'' CODENAME,                                                                           '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON))/SUM(A.INWON)*100,1) "임원",                               '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON))/SUM(A.INWON)*100,1) "부장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON))/SUM(A.INWON)*100,1) "차장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON))/SUM(A.INWON)*100,1) "과장",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON))/SUM(A.INWON)*100,1) "대리",                                          '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON)))/SUM(A.INWON)*100,1) "사원",    '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON))/SUM(A.INWON)*100,1) "특정",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''C1'',A.INWON,''H10'',A.INWON))/SUM(A.INWON)*100,1) "전문",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''E1'',A.INWON,''H11'',A.INWON))/SUM(A.INWON)*100,1) "계약",                                          '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''H1'',A.INWON,''K11'',A.INWON))/SUM(A.INWON)*100,1) "일반",                                          '+
                  '       ROUND(SUM(A.INWON)/SUM(A.INWON)*100,1) "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                          '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO                                                                                            '+
                  ' UNION ALL                                                                                                            '+
                  'SELECT SUBSTR(DECODE(A.JOBGUN,''12'',''30'',A.JOBGUN),1,1)||''X'' JOBGUN,B.CODENAME||'' 비율'',                       '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''0'',A.INWON,''A'',A.INWON))/'''+strTotal+'''*100,1) "임원",                           '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''10'',A.INWON,''C11'',A.INWON))/'''+strTotal+'''*100,1) "부장",                                      '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''20'',A.INWON,''C21'',A.INWON))/'''+strTotal+'''*100,1) "차장",                                      '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''22'',A.INWON,''D11'',A.INWON))/'''+strTotal+'''*100,1) "과장",                                      '+
                  '       ROUND(SUM(DECODE(A.PAYCL,''32'',A.INWON,''D21'',A.INWON))/'''+strTotal+'''*100,1) "대리",                                      '+
                  '       ROUND(SUM(DECODE(SUBSTR(A.PAYCL,1,1),''4'',A.INWON,DECODE(SUBSTR(A.PAYCL,1,2),''D3'',A.INWON)))/'''+strTotal+'''*100,1) "사원",'+
                  '       ROUND(SUM(DECODE(A.PAYCL,''93'',A.INWON,''D41'',A.INWON))/'''+strTotal+'''*100,1) "특정",                                      '+
                  '       0 "전문", 0 "계약", 0 "일반", 0 "직군별총계", 0 AS "정규비율", 0 AS "전체비율"                                 '+
                  '  FROM PIHTONG A,                                                                                                     '+
                  '       (SELECT CODENO, CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND USEYN = ''Y'') B                             '+
                  ' WHERE A.TONGYM ='''+Fpie2060c.Mrunyymm.Text+'''                                                                      '+
                  '   AND A.JOBGUN = B.CODENO   AND SUBSTR(A.PAYCL,1,1) <> ''A''                                                         '+
                  '   AND ((A.PAYCL BETWEEN ''10'' AND ''93'') or (A.PAYCL BETWEEN ''A11'' AND ''D41''))                                 '+
                  ' GROUP BY DECODE(A.JOBGUN,''12'',''30'',A.JOBGUN),B.CODENAME                                                          '+
                  ' ORDER BY JOBGUN                                                                             ');
//                  showmessage(strTotal);
       end;
    end;

    Open;
    i:= 1;
    While not EOF do
    begin
      if self.Findcomponent('L'+IntToStr(i)+'_imwon') <> Nil then
      begin
        if FieldByName('임원').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_imwon')).Caption := FieldByName('임원').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_imwon')).Caption :='';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_10') <> Nil then
      begin
        if FieldByName('부장').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_10')).Caption    := FieldByName('부장').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_10')).Caption  := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_20') <> Nil then
      begin
        if FieldByName('차장').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_20')).Caption    := FieldByName('차장').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_20')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_22') <> Nil then
      begin
        if FieldByName('과장').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_22')).Caption    := FieldByName('과장').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_22')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_32') <> Nil then
      begin
        if FieldByName('대리').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_32')).Caption    := FieldByName('대리').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_32')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_4X') <> Nil then
      begin
        if FieldByName('사원').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_4X')).Caption    := FieldByName('사원').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_4X')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_93') <> Nil then
      begin
        if FieldByName('특정').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_93')).Caption    := FieldByName('특정').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_93')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_SCont') <> Nil then
      begin
        if FieldByName('전문').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_SCont')).Caption := FieldByName('전문').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_SCont')).Caption := '';
      end;
      if self.Findcomponent('L'+IntToStr(i)+'_Cont') <> Nil then
      begin
        if FieldByName('계약').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Cont')).Caption  := FieldByName('계약').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Cont')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_Gen') <> Nil then
      begin
        if FieldByName('일반').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Gen')).Caption   := FieldByName('일반').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Gen')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_Sum') <> Nil then
      begin
        if FieldByName('직군별총계').AsString <> '0' then
           TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Sum')).Caption   := FieldByName('직군별총계').AsString
        else
           TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_Sum')).Caption := '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_SRatio') <> Nil then
      begin
        if FieldByName('정규비율').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_SRatio')).Caption:= FieldByName('정규비율').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_SRatio')).Caption:= '';
      end;

      if self.Findcomponent('L'+IntToStr(i)+'_TRatio') <> Nil then
      begin
        if FieldByName('전체비율').AsString <> '0' then
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_TRatio')).Caption := FieldByName('전체비율').AsString
        else
          TQRLabel(self.Findcomponent('L'+IntToStr(i)+'_TRatio')).Caption := '';
      end;
      i := i+1;
      Next;
    end;
  end;
  QRLdate.Caption := Copy(Fpie2060c.L_CurDate.Caption,1,4)+'/'+Copy(Fpie2060c.L_CurDate.Caption,6,2)+'/'+Copy(Fpie2060c.L_CurDate.Caption,9,2);
  QRLjobym.Caption := Copy(Fpie2060c.Mrunyymm.text, 1, 4) + '년 ' + Copy(Fpie2060c.Mrunyymm.text, 5, 2) + '월';
end;

procedure TFpie20604.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if trim(Fpie2060c.Mrunyymm.Text) < Fpie2060c.payrachym then 
     begin
          QRLabel1.Caption  := '직급/직군별 인원 현황';
          QRLabel3.Caption  := '직급';
          QRLabel23.Caption := '부장';
          QRLabel4.Caption  := '차장';
          QRLabel5.Caption  := '과장';
          QRLabel6.Caption  := '대리';
          QRLabel7.Caption  := '사원';
          QRLabel10.Caption := '특정';
          QRLabel35.Caption := '직급별 총계';
     end
     else
     begin
          QRLabel1.Caption  := 'BAND/직군별 인원 현황';
          QRLabel3.Caption  := 'BAND';
          QRLabel23.Caption := 'L2';
          QRLabel4.Caption  := 'L1';
          QRLabel5.Caption  := 'G4';
          QRLabel6.Caption  := 'G3';
          QRLabel7.Caption  := 'G2';
          QRLabel10.Caption := 'P' ;
          QRLabel35.Caption := 'BAND별 총계';
     end;
end;

end.
