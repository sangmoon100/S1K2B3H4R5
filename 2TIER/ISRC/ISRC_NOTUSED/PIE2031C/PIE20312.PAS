unit pie20312;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, Db, DBTables, peprnview;

type
  TFpie20312 = class(TForm)
    Inreport: TQuickRep;
    QRBand_Header: TQRBand;
    QRShape84: TQRShape;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel19: TQRLabel;
    QRShape66: TQRShape;
    QRLabel48: TQRLabel;
    QRShape67: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRShape2: TQRShape;
    QRShape12: TQRShape;
    QRLabel138: TQRLabel;
    QRShape49: TQRShape;
    QRBand1: TQRBand;
    QRShape43: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel15: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape42: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape65: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape41: TQRShape;
    QRShape44: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape52: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape22: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel130: TQRLabel;
    QRShape82: TQRShape;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRShape78: TQRShape;
    QRShape45: TQRShape;
    QRLabel99: TQRLabel;
    QRShape30: TQRShape;
    Label1: TLabel;
    QRBand_Detail: TQRBand;
    QRL_technique: TQRLabel;
    QRShape31: TQRShape;
    QRL_10: TQRLabel;
    QRShape_1: TQRShape;
    QRL_20: TQRLabel;
    QRL_22: TQRLabel;
    QRL_32: TQRLabel;
    QRL_4X: TQRLabel;
    QRL_93: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRL_ptemp: TQRLabel;
    QRShape28: TQRShape;
    QRShape33: TQRShape;
    QRL_pcont: TQRLabel;
    QRShape21: TQRShape;
    QRShape26: TQRShape;
    QRShape77: TQRShape;
    QRL_pscon: TQRLabel;
    C: TQRShape;
    QRL_Ssum: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRL_ptotcnt: TQRLabel;
    QRL_ptotratio: TQRLabel;
    QRLabel14: TQRLabel;
    LineCheck1: TQRShape;
    LineCheck2: TQRShape;
    Qry_Mas: TQuery;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape7: TQRShape;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    procedure InreportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InreportPreview(Sender: TObject);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpie20312: TFpie20312;
  Fm_PreviewForm: TFm_PreviewForm;

implementation

uses E2031C;

{$R *.DFM}

procedure TFpie20312.InreportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with Qry_Mas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT B.TECHNIQUE,''  [''||C.CODENAME||'']'' GUBUN,                                                   '+
            '       SUM(P10) P10, SUM(P20) P20, SUM(P22) P22, SUM(P32) P32, SUM(P40+P42+P44) P4X,                   '+
            '	    SUM(PSPESUM) PSPESUM, SUM(PEMPTOT) SSUM,                                                        '+
            '       SUM(PSCONSUM) PSCONSUM, SUM(PCONTSUM) PCONTSUM, SUM(PTEMPSUM) PTEMPSUM,                         '+
            '       SUM(PSCONSUM + PCONTSUM + PTEMPSUM) SSUM2,                                                      '+
            '       SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM) TSUM,                                             '+
            '	    ROUND(RATIO_TO_REPORT(SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM)) OVER (),3)*100 AS TRATIO   '+
            '  FROM PIHTOPO A, PYCDEPT B, PYCCODE C                                                                 '+
            ' WHERE A.TOPOYM ='''+Fpie2031c.Mrunyymm.Text+'''                                                       '+
            '   AND A.ORGNUM = B.ORGNUM                                                                             '+
            '   AND A.DEPTCODE = B.DEPTCODE                                                                         '+
            '   AND B.TECHNIQUE <> ''0''                                                                            '+
            '   AND (C.CODEID =''I801'' AND C.CODENO = B.TECHNIQUE)                                                 '+
            ' GROUP BY B.TECHNIQUE,C.CODENAME                                                                       '+
            ' UNION ALL                                                                                             '+
            'SELECT B.TECHNIQUE,''      ''||C.CODENAME GUBUN,                                                       '+
            '       SUM(P10) P10, SUM(P20) P20, SUM(P22) P22, SUM(P32) P32, SUM(P40+P42+P44) P4X,                   '+
            '       SUM(PSPESUM) PSPESUM, SUM(PEMPTOT) SSUM,                                                        '+
            '       SUM(PSCONSUM) PSCONSUM, SUM(PCONTSUM) PCONTSUM, SUM(PTEMPSUM) PTEMPSUM,                         '+
            '       SUM(PSCONSUM + PCONTSUM + PTEMPSUM) SSUM2,                                                      '+
            '       SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM) TSUM,                                             '+
            '       ROUND(RATIO_TO_REPORT(SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM)) OVER (),3)*100 AS TRATIO   '+
            '  FROM PIHTOPO A, PYCDEPT B, PYCCODE C                                                                 '+
            ' WHERE A.TOPOYM ='''+Fpie2031c.Mrunyymm.Text+'''                                                       '+
            '   AND A.ORGNUM = B.ORGNUM                                                                             '+
            '   AND A.DEPTCODE = B.DEPTCODE                                                                         '+
            '   AND B.TECHNIQUE <> ''0''                                                                            '+
            '   AND (C.CODEID =''I803'' AND C.CODENO = B.DETAILSTECH)                                               '+
            ' GROUP BY B.TECHNIQUE,B.DETAILSTECH,C.CODENAME                                                         '+
            ' UNION ALL                                                                                             '+
            'SELECT 1000,''         [총    계]'' GUBUN,                                                             '+
            '       SUM(P10) P10, SUM(P20) P20, SUM(P22) P22, SUM(P32) P32, SUM(P40+P42+P44) P4X,                   '+
            '       SUM(PSPESUM) PSPESUM, SUM(PEMPTOT) SSUM,                                                        '+
            '       SUM(PSCONSUM) PSCONSUM, SUM(PCONTSUM) PCONTSUM,SUM(PTEMPSUM) PTEMPSUM,                          '+
            '       SUM(PSCONSUM + PCONTSUM + PTEMPSUM) SSUM2,                                                      '+
            '       SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM) TSUM,                                             '+
            '       ROUND(RATIO_TO_REPORT(SUM(PEMPTOT + PSCONSUM + PCONTSUM + PTEMPSUM)) OVER (),3)*100 AS TRATIO   '+
            '  FROM PIHTOPO A, PYCDEPT B                                                                            '+
            ' WHERE A.TOPOYM ='''+Fpie2031c.Mrunyymm.Text+'''                                                       '+
            '   AND A.ORGNUM = B.ORGNUM                                                                             '+
            '   AND A.DEPTCODE = B.DEPTCODE                                                                         '+
            '   AND B.TECHNIQUE <> ''0''                                                                            '+
            ' ORDER BY TECHNIQUE                                                                                    ');
    Open;
  end;
  QRL_WorkDate.Caption  := Copy(Fpie2031c.Mrunyymm.Text, 1 , 4) + '년 ' +
                           Copy(Fpie2031c.Mrunyymm.Text, 5 , 2) + '월';
  QRL_curdate.Caption   := Fpie2031c.L_CurDate.Caption;
end;

procedure TFpie20312.QRBand_DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   with qry_Mas do
   begin
     if FieldByName('GUBUN').AsString <> '0' then
        QRL_technique.Caption := FieldByName('GUBUN').AsString
     else
        QRL_technique.Caption := '';

     if FieldByName('P10').AsString <> '0' then                     // 부장
        QRL_10.Caption        := FieldByName('P10').AsString
     else
        QRL_10.Caption := '';

     if FieldByName('P20').AsString <> '0' then                     // 차장
        QRL_20.Caption        := FieldByName('P20').AsString
     else
        QRL_20.Caption := '';

     if FieldByName('P22').AsString <> '0' then                     // 과장
        QRL_22.Caption        := FieldByName('P22').AsString
     else
        QRL_22.Caption := '';

     if FieldByName('P32').AsString <> '0' then                     // 대리
        QRL_32.Caption        := FieldByName('P32').AsString
     else
        QRL_32.Caption := '';

     if  FieldByName('P4X').AsString <> '0' then                    // 사원
         QRL_4X.Caption        := FieldByName('P4X').AsString
     else
         QRL_4X.Caption := '';

     if  FieldByName('PSPESUM').AsString <> '0' then                // 특정
         QRL_93.Caption        := FieldByName('PSPESUM').AsString
     else
         QRL_93.Caption := '';

     if FieldByName('SSUM').AsString <> '0' then                    // 소계
        QRL_Ssum.Caption      := FieldByName('SSUM').AsString
     else
        QRL_Ssum.Caption := '';

     if FieldByName('PSCONSUM').AsString <> '0' then                // 비정규직 - 전문계약
        QRL_pscon.Caption     := FieldByName('PSCONSUM').AsString
     else
        QRL_pscon.Caption := '';

     if FieldByName('PCONTSUM').AsString <> '0' then                // 비정규직 - 계약
        QRL_pcont.Caption     := FieldByName('PCONTSUM').AsString
     else
        QRL_pcont.Caption := '';

     if FieldByName('PTEMPSUM').AsString <> '0' then                // 비정규직 - 일반
       QRL_ptemp.Caption     := FieldByName('PTEMPSUM').AsString
     else
       QRL_ptemp.Caption := '';

     if FieldByName('SSUM2').AsString <> '0' then                   // 비정규직 - 소계
        QRLabel9.Caption   := FieldByName('SSUM2').AsString
     else
        QRLabel9.Caption := '';

     if FieldByName('TSUM').AsString <> '0' then                    // 총계
        QRL_ptotcnt.Caption   := FieldByName('TSUM').AsString
     else
        QRL_ptotcnt.Caption := '';

     if  FieldByName('TRATIO').AsFloat > 0 then                     // 비율
     begin
        QRL_ptotratio.Caption := FormatFloat('###.##',FieldByName('TRATIO').AsFloat);
        QRLabel14.Caption := '';
     end
     else begin
        QRL_ptotratio.Caption := '';
        QRLabel14.Caption := '';
     end;
   end;
end;

procedure TFpie20312.InreportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Inreport);
  Fm_PreviewForm.Show;
end;

procedure TFpie20312.QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if trim(Fpie2031c.Mrunyymm.Text) < Fpie2031c.payrachym then
   begin
       QRLabel33.Caption := '부장';
       QRLabel34.Caption := '차장';
       QRLabel35.Caption := '과장';
       QRLabel36.Caption := '대리';
       QRLabel44.Caption := '사원';
       QRLabel6.Caption  := '특정';
   end
   else
   begin
       QRLabel33.Caption := 'L2';
       QRLabel34.Caption := 'L1';
       QRLabel35.Caption := 'G4';
       QRLabel36.Caption := 'G3';
       QRLabel44.Caption := 'G2';
       QRLabel6.Caption  := 'P' ;
   end;
end;

end.
