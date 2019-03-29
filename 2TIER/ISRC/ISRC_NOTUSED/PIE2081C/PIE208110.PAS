{--------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE20811(년도별 BAND별 입직현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사통계
Programmer      : 이희용
Version         : 1.00
Date            : 2011.03.23
Update contents
  1.00   2011.03.23   이희용  신규프로그램 개발
-------------------------------------------------------------------------------}

unit pie208110;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, peprnview;

type
  TFpie208110 = class(TForm)
    QuickReport1: TQuickRep;
    QRBand2: TQRBand;
    QRShape58: TQRShape;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape50: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRShape53: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape54: TQRShape;
    QRShape60: TQRShape;
    QRShape55: TQRShape;
    QRShape5: TQRShape;
    QRShape15: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape35: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRL_YEAR: TQRLabel;
    QRL_22_M: TQRLabel;
    QRL_32_M: TQRLabel;
    QRL_SSUM_M: TQRLabel;
    QRL_20_M: TQRLabel;
    QRL_10_M: TQRLabel;
    QRL_TSUM: TQRLabel;
    QRL_IMWON_M: TQRLabel;
    QRL_93_M: TQRLabel;
    QRL_Ratio: TQRLabel;
    QRShape10: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape31: TQRShape;
    QRShape21: TQRShape;
    QRL_4X_M: TQRLabel;
    QRShape61: TQRShape;
    QRShape18: TQRShape;
    QRShape41: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRL_YAVG: TQRLabel;
    QRShape49: TQRShape;
    QRLabel33: TQRLabel;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLsi: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs4: TQRLabel;
    QRLs6: TQRLabel;
    QRLs5: TQRLabel;
    QRLsr: TQRLabel;
    QRLabel1: TQRLabel;
    QRLs3: TQRLabel;
    QRLst: TQRLabel;
    QRShape28: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape47: TQRShape;
    QRShape52: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLs7: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape25: TQRShape;
    QRShape34: TQRShape;
    QRShape6: TQRShape;
    QRLInwonT: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape33: TQRShape;
    QRLabel29: TQRLabel;
    Query1: TQuery;
    Query2: TQuery;
    QRLyear: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRL_IMWON_F: TQRLabel;
    QRL_10_F: TQRLabel;
    QRL_20_F: TQRLabel;
    QRL_22_F: TQRLabel;
    QRL_32_F: TQRLabel;
    QRL_4X_F: TQRLabel;
    QRL_93_F: TQRLabel;
    QRL_SSUM_F: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpie208110: TFpie208110;
  Fm_PreviewForm: TFm_PreviewForm;
  s_0X,s_10,s_20,s_22,s_32,s_4x,s_93,s_ssum,s_tsum,s_yavg,s_ratio : Integer;
  ymd : String;
  PrtCount : integer;
implementation

uses E2081c;

{$R *.DFM}

procedure TFpie208110.QuickReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
  Fm_PreviewForm.Show;
end;

procedure TFpie208110.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  s_0X    := 0;
  s_10    := 0;
  s_20    := 0;
  s_22    := 0;
  s_32    := 0;
  s_4x    := 0;
  s_93    := 0;
  s_ssum  := 0;
  s_tsum  := 0;
  s_yavg  := 0;
  s_ratio := 0;

  PrtCount:=0;

  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select substr(a.anfrdate,1,4) year,                                                                    '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (SUBSTR (a.paycl, 1, 1), ''0'', 1, ''A'', 1), 1, 0)) 임원_M, '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (SUBSTR (a.paycl, 1, 1), ''0'', 1, ''A'', 1), 1, 0)) 임원_F, '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''10'', 1, ''C11'', 1), 1, 0)) 부장_M,             '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''10'', 1, ''C11'', 1), 1, 0)) 부장_F,             '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''20'', 1, ''C21'', 1), 1, 0)) 차장_M,             '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''20'', 1, ''C21'', 1), 1, 0)) 차장_F,             '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''22'', 1, ''D11'', 1), 1, 0)) 과장_M,             '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''22'', 1, ''D11'', 1), 1, 0)) 과장_F,             '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''32'', 1, ''D21'', 1), 1, 0)) 대리_M,             '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''32'', 1, ''D21'', 1), 1, 0)) 대리_F,             '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (SUBSTR (a.paycl, 1, 1), ''4'', 1, DECODE (SUBSTR (a.paycl, 1, 2), ''D3'', 1)), 1, 0))  사원_M, '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (SUBSTR (a.paycl, 1, 1), ''4'', 1, DECODE (SUBSTR (a.paycl, 1, 2), ''D3'', 1)), 1, 0))  사원_F, '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''93'', 1, ''D41'', 1), 1, 0))  특정_M,            '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''93'', 1, ''D41'', 1), 1, 0))  특정_F,            '+
            '      COUNT (DECODE (b.sex, ''M'', DECODE (SUBSTR (a.paycl, 1, 1), ''0'', 1, ''A'', 1), 1, 0))         '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''10'', 1, ''C11'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''20'', 1, ''C21'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''22'', 1, ''D11'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''32'', 1, ''D21'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (SUBSTR (a.paycl, 1, 1), ''4'', 1, DECODE (SUBSTR (a.paycl, 1, 2), ''D3'', 1)), 1, 0)) '+
            '    + COUNT (DECODE (b.sex, ''M'', DECODE (a.paycl, ''93'', 1, ''D41'', 1), 1, 0)) 소계_M,             '+
            '      COUNT (DECODE (b.sex, ''F'', DECODE (SUBSTR (a.paycl, 1, 1), ''0'', 1, ''A'', 1), 1, 0))         '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''10'', 1, ''C11'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''20'', 1, ''C21'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''22'', 1, ''D11'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''32'', 1, ''D21'', 1), 1, 0))                     '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (SUBSTR (a.paycl, 1, 1), ''4'', 1, DECODE (SUBSTR (a.paycl, 1, 2), ''D3'', 1)), 1, 0))  '+
            '    + COUNT (DECODE (b.sex, ''F'', DECODE (a.paycl, ''93'', 1, ''D41'', 1), 1, 0)) 소계_F              '+
            'from pihanno a, pimpmas b                                                                              '+
            'where ancode in (''111'',''121'',''131'')                                                              '+
            '  and substr(a.anfrdate,1,6) between '''+Fpie2081c.Mfrym.Text+''' and '''+Fpie2081c.Mtoym.Text+'''     '+
            '  and a.empno = b.empno                                                                                '+
            'group by substr(a.anfrdate,1,4)');
    Open;
  end;

  ymd := Fpie2081c.L_CurDate.Caption;
  QRLabel10.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
  QRLabel13.Caption := '[작업년월] : '+Copy(Fpie2081c.Mfrym.Text,1,4)+'년 '+Copy(Fpie2081c.Mfrym.Text,6,2)+'월'
                          +' ~ '+Copy(Fpie2081c.Mtoym.Text,1,4)+'년 '+Copy(Fpie2081c.Mtoym.Text,6,2)+'월';
end;

procedure TFpie208110.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  fyymm,tyymm : String;
begin
  with Query1 do
  begin
    QRL_YEAR.Caption  := FieldByName('year').AsString;
    QRL_IMWON_M.Caption := FieldByName('임원_M').AsString;
    QRL_IMWON_F.Caption := FieldByName('임원_F').AsString;
    QRL_10_M.Caption    := FieldByName('부장_M').AsString;
    QRL_10_F.Caption    := FieldByName('부장_F').AsString;
    QRL_20_M.Caption    := FieldByName('차장_M').AsString;
    QRL_20_F.Caption    := FieldByName('차장_F').AsString;
    QRL_22_M.Caption    := FieldByName('과장_M').AsString;
    QRL_22_F.Caption    := FieldByName('과장_F').AsString;
    QRL_32_M.Caption    := FieldByName('대리_M').AsString;
    QRL_32_F.Caption    := FieldByName('대리_F').AsString;
    QRL_4X_M.Caption    := FieldByName('사원_M').AsString;
    QRL_4X_F.Caption    := FieldByName('사원_F').AsString;
    QRL_93_M.Caption    := FieldByName('특정_M').AsString;
    QRL_93_F.Caption    := FieldByName('특정_F').AsString;
    QRL_SSUM_M.Caption  := FieldByName('소계_M').AsString;
    QRL_SSUM_F.Caption  := FieldByName('소계_F').AsString;

    QRL_TSUM.Caption  := IntToStr(FieldByName('임원_M').AsInteger + FieldByName('소계_M').AsInteger
                                + FieldByName('임원_F').AsInteger + FieldByName('소계_F').AsInteger);

    s_0X    := s_0X + FieldByName('임원_M').AsInteger + FieldByName('임원_F').AsInteger;
    s_10    := s_10 + FieldByName('부장_M').AsInteger + FieldByName('부장_F').AsInteger;
    s_20    := s_20 + FieldByName('차장_M').AsInteger + FieldByName('차장_F').AsInteger;
    s_22    := s_22 + FieldByName('과장_M').AsInteger + FieldByName('과장_F').AsInteger;
    s_32    := s_32 + FieldByName('대리_M').AsInteger + FieldByName('대리_F').AsInteger;
    s_4x    := s_4x + FieldByName('사원_M').AsInteger + FieldByName('사원_F').AsInteger;
    s_93    := s_93 + FieldByName('특정_M').AsInteger + FieldByName('특정_F').AsInteger;
    s_ssum  := s_ssum + FieldByName('소계_M').AsInteger + FieldByName('소계_F').AsInteger;
    s_tsum  := s_tsum + StrToInt(QRL_TSUM.Caption);
  end;
  with Query2 do
  begin
    Close;
    fyymm := Query1.FieldByName('year').AsString + '01';
    tyymm := Query1.FieldByName('year').AsString + '12';

    SQL.Clear;
    if Copy(ymd,1,4) <> Query1.FieldByName('year').AsString then
    begin
      SQL.ADD(' SELECT round(SUM(INWON)/12) sinwon                            ');
      SQL.ADD('   FROM PIHTONG a                                              ');
      SQL.ADD('  WHERE (TONGYM between '''+fyymm+''' AND '''+tyymm+''' )      ');
      SQL.ADD('    AND ((PAYCL >= ''01'' and PAYCL <= ''93'')                 ');
      SQL.ADD('         or (PAYCL >= ''A11'' and PAYCL <= ''D41''))           ');
    end
    else begin
      SQL.ADD(' SELECT round(SUM(INWON)/'+copy(ymd,6,2)+') sinwon             ');
      SQL.ADD('   FROM PIHTONG a                                              ');
      SQL.ADD('  WHERE (TONGYM between '''+fyymm+''' AND '''+tyymm+''' )      ');
      SQL.ADD('    AND ((PAYCL >= ''01'' and PAYCL <= ''93'')                 ');
      SQL.ADD('         or (PAYCL >= ''A11'' and PAYCL <= ''D41''))           ');
    end;
    Open;
    QRL_YAVG.Caption := FieldByName('sinwon').AsString;
    QRL_Ratio.Caption:= FloatToStr((Round(StrToInt(QRL_TSUM.Caption)/FieldByName('sinwon').AsInteger*1000)/1000)*100);
    s_yavg := s_yavg +  FieldByName('sinwon').AsInteger;

    Inc(PrtCount);
    Fpie2081c.gauge1.Progress := (PrtCount * 100) div Query1.RecordCount;
    if (PrtCount >= Query1.RecordCount) then
       Fpie2081c.gauge1.Progress := 100;

  end;
end;

procedure TFpie208110.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLsi.Caption := IntToStr(s_0X);
  QRLs1.Caption := IntToStr(s_10);
  QRLs2.Caption := IntToStr(s_20);
  QRLs3.Caption := IntToStr(s_22);
  QRLs4.Caption := IntToStr(s_32);
  QRLs5.Caption := IntToStr(s_4x);
  QRLs6.Caption := IntToStr(s_93);
  QRLs7.Caption := IntToStr(s_ssum);
  QRLst.Caption := IntToStr(s_tsum);
  QRLInwonT.Caption := IntToStr(s_yavg);
  QRLsr.Caption := FloatToStr((round(s_tsum/s_yavg*1000)/1000)*100);
end;

procedure TFpie208110.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if trim(Fpie2081c.Mtoym.Text) < Fpie2081c.payrachym then
  begin
       QRLabel4.Caption  := '년도별 직급별 입직현황';
       QRLabel24.Caption := '부장';
       QRLabel25.Caption := '차장';
       QRLabel26.Caption := '과장';
       QRLabel27.Caption := '대리';
       QRLabel5.Caption  := '사원';
       QRLabel29.Caption := '특정';
  end
  else
  begin
       QRLabel4.Caption  := '년도별 BAND별 입직현황';
       QRLabel24.Caption := 'L2';
       QRLabel25.Caption := 'L1';
       QRLabel26.Caption := 'G4';
       QRLabel27.Caption := 'G3';
       QRLabel5.Caption  := 'G2';
       QRLabel29.Caption := 'P' ;
  end;
end;

end.

