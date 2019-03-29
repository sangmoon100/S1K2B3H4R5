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

unit pie208111;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, peprnview;

type
  TFpie208111 = class(TForm)
    QuickReport1: TQuickRep;
    QRBand2: TQRBand;
    QRShape54: TQRShape;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape53: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLyear: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRShape37: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRShape41: TQRShape;
    QRLabel30: TQRLabel;
    QRShape47: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape26: TQRShape;
    QRShape61: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRLuniname: TQRLabel;
    QRL3_M: TQRLabel;
    QRL5_M: TQRLabel;
    QRL2_M: TQRLabel;
    QRL1_M: TQRLabel;
    QRLs: TQRLabel;
    QRL4_M: TQRLabel;
    QRLtt: TQRLabel;
    QRLr: TQRLabel;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape21: TQRShape;
    QRShape28: TQRShape;
    QRL6_M: TQRLabel;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape18: TQRShape;
    QRL7_M: TQRLabel;
    QRShape35: TQRShape;
    QRL0_M: TQRLabel;
    QRShapeS15: TQRShape;
    QRShapeS0: TQRShape;
    QRShape55: TQRShape;
    QRShapeS14: TQRShape;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel17: TQRLabel;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLs0: TQRLabel;
    QRLs1: TQRLabel;
    QRLs3: TQRLabel;
    QRLs4: TQRLabel;
    QRLs5: TQRLabel;
    QRLsr: TQRLabel;
    QRLstt: TQRLabel;
    QRLs2: TQRLabel;
    QRLst: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape44: TQRShape;
    QRLs6: TQRLabel;
    QRShape6: TQRShape;
    QRShape25: TQRShape;
    QRLs7: TQRLabel;
    QRShape48: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    Query1: TQuery;
    Query2: TQuery;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape23: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel19: TQRLabel;
    QRL0_F: TQRLabel;
    QRL1_F: TQRLabel;
    QRL7_F: TQRLabel;
    QRL6_F: TQRLabel;
    QRL5_F: TQRLabel;
    QRL4_F: TQRLabel;
    QRL3_F: TQRLabel;
    QRL2_F: TQRLabel;
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
  Fpie208111: TFpie208111;
  Fm_PreviewForm: TFm_PreviewForm;
  s_0X,s_10,s_20,s_22,s_32,s_4x,s_93,s_ssum,s_tsum,s_yavg,s_ratio : Integer;
  ymd : String;
  iRecCount : integer;
  PrtCount : integer;
implementation

uses E2081C;

{$R *.DFM}

procedure TFpie208111.QuickReport1BeforePrint(Sender: TCustomQuickRep;
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
  iRecCount := 0;
  PrtCount:=0;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select substr(a.anfrdate,1,6) year,                                                         '+
            '    count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) 임원_M,   '+
            '    count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) 임원_F,   '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''10'',1,''C11'',1), 1, 0))  부장_M,           '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''10'',1,''C11'',1), 1, 0))  부장_F,           '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''20'',1,''C21'',1), 1, 0))  차장_M,           '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''20'',1,''C21'',1), 1, 0))  차장_F,           '+
            '	 count(decode(b.sex, ''M'',decode(a.paycl,''22'',1,''D11'',1), 1, 0))  과장_M,           '+
            '	 count(decode(b.sex, ''F'',decode(a.paycl,''22'',1,''D11'',1), 1, 0))  과장_F,           '+
            '	 count(decode(b.sex, ''M'',decode(a.paycl,''32'',1,''D21'',1), 1, 0))  대리_M,           '+
            '	 count(decode(b.sex, ''F'',decode(a.paycl,''32'',1,''D21'',1), 1, 0))  대리_F,           '+
            '	 count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) 사원_M, '+
            '	 count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) 사원_F, '+
            '	 count(decode(b.sex, ''M'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 특정_M,            '+
            '	 count(decode(b.sex, ''F'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 특정_F,            '+
            '	 count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) +         '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) +                  '+
            '	 count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) + '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 소계_M,            '+
            '	 count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) +         '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) +                  '+
            '	 count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) + '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 소계_F                               '+
            'from pihanno a, pimpmas b                                                                 '+
            'where ancode in (''111'',''121'',''131'')                                                 '+
            '  and a.empno = b.empno                                                                   '+
            '  and substr(a.anfrdate,1,6) between '''+Fpie2081c.Mfrym.Text+
                                          ''' and '''+Fpie2081c.Mtoym.Text+'''                ');
    SQL.Add('group by substr(a.anfrdate,1,6)                                                  ');
    SQL.Add('union all                                                                        '+
            'select substr(a.anfrdate,1,4)||''ZZ'' year,                                      '+
            '    count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) 임원_M,   '+
            '    count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) 임원_F,   '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) 부장_M,            '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) 부장_F,            '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) 차장_M,            '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) 차장_F,            '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) 과장_M,            '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) 과장_F,            '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) 대리_M,            '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) 대리_F,            '+
            '    count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) 사원_M, '+
            '    count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) 사원_F, '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 특정_M,            '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 특정_F,            '+
            '    count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) +         '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''M'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) +  '+
            '    count(decode(b.sex, ''M'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 소계_M,            '+
            '    count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''0'',1,''A'',1), 1, 0)) +         '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''10'',1,''C11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''20'',1,''C21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''22'',1,''D11'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''32'',1,''D21'',1), 1, 0)) +                  '+
            '    count(decode(b.sex, ''F'',decode(substr(a.paycl,1,1),''4'',1,decode(substr(a.paycl,1,2),''D3'',1)), 1, 0)) +  '+
            '    count(decode(b.sex, ''F'',decode(a.paycl,''93'',1,''D41'',1), 1, 0)) 소계_F                              '+
            'from pihanno a, pimpmas b                                                                 '+
            'where ancode in (''111'',''121'',''131'')                                                 '+
            '  and a.empno = b.empno                                                                   '+
            '  and substr(a.anfrdate,1,6) between '''+Fpie2081c.Mfrym.Text+
                                          ''' and '''+Fpie2081c.Mtoym.Text+'''                ');
    SQL.Add('group by substr(a.anfrdate,1,4)                                                  '+
            'order by year                                                                    ');
    Open;
  end;

  ymd := Fpie2081c.L_CurDate.Caption;
  QRLabel12.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
  QRLabel13.Caption := '[작업년월] : '+Copy(Fpie2081c.Mfrym.Text,1,4)+'년 '+Copy(Fpie2081c.Mfrym.Text,6,2)+'월'
                          +' ~ '+Copy(Fpie2081c.Mtoym.Text,1,4)+'년 '+Copy(Fpie2081c.Mtoym.Text,6,2)+'월';
end;

procedure TFpie208111.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Query1 do
  begin
    if Copy(FieldByName('Year').AsString,5,2) = 'ZZ' then
    begin
      QRLuniname.Caption := '소   계';
      s_0X   := s_0X   + FieldByName('임원_M').AsInteger + FieldByName('임원_F').AsInteger;
      s_10   := s_10   + FieldByName('부장_M').AsInteger + FieldByName('부장_F').AsInteger;
      s_20   := s_20   + FieldByName('차장_M').AsInteger + FieldByName('차장_F').AsInteger;
      s_22   := s_22   + FieldByName('과장_M').AsInteger + FieldByName('과장_F').AsInteger;
      s_32   := s_32   + FieldByName('대리_M').AsInteger + FieldByName('대리_F').AsInteger;
      s_4x   := s_4x   + FieldByName('사원_M').AsInteger + FieldByName('사원_F').AsInteger;
      s_93   := s_93   + FieldByName('특정_M').AsInteger + FieldByName('특정_F').AsInteger;
      s_ssum := s_ssum + FieldByName('소계_M').AsInteger + FieldByName('소계_F').AsInteger;
      QRLs.Enabled  := False;
      QRLtt.Enabled := False;
      QRLr.Enabled  := False;
      QRShape74.Enabled := False;
      QRShape75.Enabled := False;
      QRLabel17.Enabled := False;
    end
    else begin
      QRLuniname.Caption := Copy(FieldByName('Year').AsString,1,4) +'년'+ Copy(FieldByName('Year').AsString,5,2) + '월';
      with Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.ADD(' SELECT SUM(INWON) BEINWON                                                         ');
        SQL.ADD('   FROM PIHTONG a                                                                  ');
        SQL.ADD('  WHERE TONGYM = TO_CHAR(ADD_MONTHS(TO_DATE('''+Query1.FieldByName('Year').AsString+''',''YYYYMM''),-1),''YYYYMM'') ');
        SQL.ADD('    AND ((PAYCL >= ''01'' and PAYCL <= ''93'')       ');
        SQL.ADD('         or (PAYCL >= ''A11'' and PAYCL <= ''D41'')) ');
        Open;
        QRLtt.Caption :=  FieldByNAME('BEINWON').AsString;
        QRLs.Enabled  := True;
        QRLtt.Enabled := True;
        QRLr.Enabled  := True;
        QRShape74.Enabled := True;
        QRShape75.Enabled := True;
        QRLabel17.Enabled := True;
        QRLs.Caption := IntToStr(Query1.FieldByName('임원_M').AsInteger + Query1.FieldByName('소계_M').AsInteger
                               + Query1.FieldByName('임원_F').AsInteger + Query1.FieldByName('소계_F').AsInteger);
        QRLr.Caption := FloatToStr((Round(StrToInt(QRLs.Caption)/Query2.FieldByName('BEINWON').AsInteger*1000)/1000)*100);
        s_tsum  := s_tsum +  StrToInt(QRLs.Caption);
        s_yavg  := s_yavg + FieldByName('BEINWON').AsInteger;
      end;
      Inc(iRecCount);
    end;
    QRL0_M.Caption := FieldByName('임원_M').AsString;
    QRL1_M.Caption := FieldByName('부장_M').AsString;
    QRL2_M.Caption := FieldByName('차장_M').AsString;
    QRL3_M.Caption := FieldByName('과장_M').AsString;
    QRL4_M.Caption := FieldByName('대리_M').AsString;
    QRL5_M.Caption := FieldByName('사원_M').AsString;
    QRL6_M.Caption := FieldByName('특정_M').AsString;
    QRL7_M.Caption := FieldByName('소계_M').AsString;
    
    QRL0_F.Caption := FieldByName('임원_F').AsString;
    QRL1_F.Caption := FieldByName('부장_F').AsString;
    QRL2_F.Caption := FieldByName('차장_F').AsString;
    QRL3_F.Caption := FieldByName('과장_F').AsString;
    QRL4_F.Caption := FieldByName('대리_F').AsString;
    QRL5_F.Caption := FieldByName('사원_F').AsString;
    QRL6_F.Caption := FieldByName('특정_F').AsString;
    QRL7_F.Caption := FieldByName('소계_F').AsString;

    Inc(PrtCount);
    Fpie2081c.gauge1.Progress := (PrtCount * 100) div Query1.RecordCount;
    if (PrtCount >= Query1.RecordCount) then
       Fpie2081c.gauge1.Progress := 100;

  end;
end;

procedure TFpie208111.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLs0.Caption := IntToStr(s_0X);
  QRLs1.Caption := IntToStr(s_10);
  QRLs2.Caption := IntToStr(s_20);
  QRLs3.Caption := IntToStr(s_22);
  QRLs4.Caption := IntToStr(s_32);
  QRLs5.Caption := IntToStr(s_4x);
  QRLs6.Caption := IntToStr(s_93);
  QRLs7.Caption := IntToStr(s_ssum);
  QRLst.Caption := IntToStr(s_tsum);
  QRLstt.Caption:= IntToStr(Round(s_yavg/iRecCount));
  QRLsr.Caption := FloatToStr((Round(StrToInt(QRLst.Caption)/StrToInt(QRLstt.Caption)*1000)/1000)*100);
end;

procedure TFpie208111.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if trim(Fpie2081c.Mtoym.Text) < Fpie2081c.payrachym then
  begin
    QRLabel10.Caption := '월별 직급별 입직현황';
    QRLabel24.Caption := '부장';
    QRLabel25.Caption := '차장';
    QRLabel26.Caption := '과장';
    QRLabel27.Caption := '대리';
    QRLabel5.Caption  := '사원';
    QRLabel4.Caption  := '특정';
  end
  else
  begin
    QRLabel10.Caption := '월별 BAND별 입직현황';
    QRLabel24.Caption := 'L2';
    QRLabel25.Caption := 'L1';
    QRLabel26.Caption := 'G4';
    QRLabel27.Caption := 'G3';
    QRLabel5.Caption  := 'G2';
    QRLabel4.Caption  := 'P' ;
  end;
end;       

procedure TFpie208111.QuickReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
  Fm_PreviewForm.Show;
end;

end.
