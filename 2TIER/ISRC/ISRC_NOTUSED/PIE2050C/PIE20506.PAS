unit PIE20506;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, Db, DBTables, peprnview;

type
  TNewPrintForm2 = class(TForm)
    InReport: TQuickRep;
    QRBand_Header: TQRBand;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape46: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape43: TQRShape;
    QRLabel1: TQRLabel;
    QRShape44: TQRShape;
    QRShape34: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
   QRShape27: TQRShape;
    QRShape15: TQRShape;
    QRShape52: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape55: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel36: TQRLabel;
    QRBand_Detail: TQRBand;
    QRL_deptname: TQRLabel;
    QRShape31: TQRShape;
    QRL_ttotal: TQRLabel;
    QRShape17: TQRShape;
    QRL_ptotal: TQRLabel;
    QRShape12: TQRShape;
    QRL_pdirsum: TQRLabel;
    QRShape14: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRL_10: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRL_20: TQRLabel;
    QRL_22: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRL_pspe: TQRLabel;
    QRL_pemp: TQRLabel;
    QRShape35: TQRShape;
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    QRL_ptempsum: TQRLabel;
    QRShape45: TQRShape;
    QRShape20: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRL_32: TQRLabel;
    QRL_4X: TQRLabel;
    QRShape13: TQRShape;
    QRL_psconsum: TQRLabel;
    QRL_pcontsum: TQRLabel;
    QRL_pimsisum: TQRLabel;
    QRBand_Deli: TQRChildBand;
    QRShape3: TQRShape;
    Label1: TLabel;
    qry_Mas: TQuery;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InReportPreview(Sender: TObject);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPrintForm2: TNewPrintForm2;
  Fm_PreviewForm: TFm_PreviewForm;

implementation

uses pie20501;

{$R *.DFM}

procedure TNewPrintForm2.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qry_Mas do
  begin
    Close;
    SQL.Clear;
// 30.07   조직차수 변동시 아래 쿼리 재사용 예정
{    SQL.Add('select A.orgnum,A.deptcode,DECODE(B.DEPTLEVEL,''40'',''◎ ''||B.deptname,                   '+
            '                                         ''A0'',''◎ ''||B.deptname,                        '+
            '                                         ''B0'',''  ◎ ''||B.deptname,                      '+
            '										 	''C0'',''    ◎ ''||B.deptname,                  '+
            '										 	''E0'',''        · ''||B.deptna3) deptname,     '+
            '       NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                           '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                               '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                 '+
            '       SUM(A.pdirsum) 임원,                                                                 '+
            '       SUM(A.P10) 부장,                                                                     '+
            '       SUM(A.P20) 차장,                                                                     '+
            '       SUM(A.P22) 과장,                                                                     '+
            '       SUM(A.P32) 대리,                                                                     '+
            '       SUM(A.P40 + A.P42 + A.P44)  사원,                                                    '+
            '       SUM(A.PSPESUM) 특정,                                                                 '+
            '       SUM(A.PEMPTOT) 정규직계,                                                             '+
            '       SUM(TCONTSUM) 계획,                                                                  '+
            '       SUM(PSCONSUM) 전계,                                                                  '+
            '       SUM(A.PCONTSUM) 계약,                                                                '+
            '       SUM(PIMSITOT) 일반,                                                                  '+
            '       SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                             '+
            '       SUM(PTOTAL) 총계                                                                     '+
            ' from  pihtopo A, pycdept B                                                                 '+
            'where A.orgnum = B.orgnum                                                                   '+
            '  and A.deptcode = B.deptcode                                                               '+
            '  and A.tpgubun =''10''                                                                   '+
            '  and substr(A.deptcode,1,1) <> ''Z''                                                      '+
            '  and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                        '+
            '  and b.closedate is null                                                                   '+
            'Group by A.orgnum,A.deptcode,B.deptname,B.deptna3,B.deptlevel                               '+
            'UNION                                                                                       '+
            '    select A.ORGNUM,substr(B.deptcode,1,3)||''99'' DEPTCODE, ''         [팀  계]'' deptname,'+
            '       NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                           '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                               '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                 '+
            '       SUM(A.pdirsum) 임원 ,                                                                '+
            '       SUM(A.P10) 부장 ,                                                                    '+
            '       SUM(A.P20) 차장 ,                                                                    '+
            '       SUM(A.P22) 과장,                                                                     '+
            '       SUM(A.P32) 대리 ,                                                                    '+
            '       SUM(A.P40 + A.P42 + A.P44)  사원,                                                    '+
            '       SUM(A.PSPESUM) 특정,                                                                 '+
            '       SUM(A.PEMPTOT) 정규직계,                                                             '+
            '       SUM(TCONTSUM) 계획,                                                                  '+
            '       SUM(PSCONSUM) 전계,                                                                  '+
            '       SUM(A.PCONTSUM) 계약,                                                                '+
            '       SUM(PIMSITOT) 일반,                                                                  '+
            '       SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                             '+
            '       SUM(PTOTAL) 총계                                                                     '+
            ' from  pihtopo A, pycdept B                                                                 '+
            '  where A.orgnum = B.orgnum                                                                 '+
            '    and A.deptcode = B.deptcode                                                             '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                      '+
            '    and A.tpgubun =''10''                                                                   '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                        '+
            '    and b.closedate is null                                                                   '+
            '  Group by A.ORGNUM,substr(B.deptcode,1,3)                                                  '+
            'HAVING COUNT(A.deptcode) > 1                                                                '+
            '  union                                                                                     '+
            '  select A.ORGNUM,substr(A.deptcode,1,1) DEPTCODE,''★ ''||B.deptname deptname,             '+
            '         NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                         '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                             '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,               '+
            '         SUM(A.pdirsum) 임원 ,                                                              '+
            '         SUM(A.P10) 부장 ,                                                                  '+
            '         SUM(A.P20) 차장 ,                                                                  '+
            '         SUM(A.P22) 과장,                                                                   '+
            '         SUM(A.P32) 대리 ,                                                                  '+
            '         SUM(A.P40 + A.P42 + A.P44)  사원,                                                  '+
            '         SUM(A.PSPESUM) 특정,                                                               '+
            '         SUM(A.PEMPTOT) 정규직계,                                                           '+
            '         SUM(TCONTSUM) 계획,                                                                '+
            '         SUM(PSCONSUM) 전계,                                                                '+
            '         SUM(A.PCONTSUM) 계약,                                                              '+
            '         SUM(PIMSITOT) 일반,                                                                '+
            '         SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                           '+
            '         SUM(PTOTAL) 총계                                                                   '+
            '   from  pihtopo A, pycdept B                                                               '+
            '  where A.orgnum = B.orgnum                                                                 '+
            '    and RPAD(SUBSTR(A.deptcode,1,1),5,''0'') = B.deptcode                                   '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                        '+
            '    and A.tpgubun =''10''                                                                   '+
            '		and substr(A.deptcode,1,1) <> ''Z''                                                  '+
            '        and b.closedate is null                                                                   '+
            '  Group by A.ORGNUM,substr(A.deptcode,1,1),B.deptname                                       '+
            '  union                                                                                     '+
            '  select A.ORGNUM,substr(A.deptcode,1,2) DEPTCODE,''  ■ ''||B.deptname deptname,           '+
            '         NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                         '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                             '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,               '+
            '         SUM(A.pdirsum) 임원 ,                                                              '+
            '         SUM(A.P10) 부장 ,                                                                  '+
            '         SUM(A.P20) 차장 ,                                                                  '+
            '         SUM(A.P22) 과장,                                                                   '+
            '         SUM(A.P32) 대리 ,                                                                  '+
            '         SUM(A.P40 + A.P42 + A.P44)  사원,                                                  '+
            '         SUM(A.PSPESUM) 특정,                                                               '+
            '         SUM(A.PEMPTOT) 정규직계,                                                           '+
            '         SUM(TCONTSUM) 계획,                                                                '+
            '         SUM(PSCONSUM) 전계,                                                                '+
            '         SUM(A.PCONTSUM) 계약,                                                              '+
            '         SUM(PIMSITOT) 일반,                                                                '+
            '         SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                           '+
            '         SUM(PTOTAL) 총계                                                                   '+
            '   from  pihtopo A, pycdept B                                                               '+
            '  where A.orgnum = B.orgnum                                                                 '+
            '    and RPAD(SUBSTR(A.deptcode,1,2),5,''0'') = B.deptcode                                   '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                        '+
            '    and A.tpgubun =''10''                                                                   '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                     '+
            '	and B.deptlevel =''B0''                                                                  '+
            '   and b.closedate is null                                                                   '+
            '  Group by A.ORGNUM,substr(A.deptcode,1,2),B.deptname                                       '+
            'order by deptcode                                                                           ');}
// 총괄부서코드 추가에 따라 하드코딩
//-----------------------------------
// 2005.10.07 팀 추가 수정자 : CH.K.J.
//-----------------------------------
    SQL.Add('select DECODE(B.DEPTLEVEL,''40'',''◎ ''||B.deptname,                                                     '+
            '                          ''60'',''◎''||B.deptname,                                                      '+
            '                          ''A0'',''◎ ''||B.deptname,                                                     '+
            '                          ''B0'','' ☞''||B.deptname,                                                     '+
            '			                       ''C0'',''  ♧''||B.deptname,                                                    '+
            '			                       ''D0'',''   ▷''||B.deptname,                                                   '+
            '			                       ''E0'',''    ·''||B.deptna3) deptname,                                       '+
            '       A.ORGNUM, DECODE(SUBSTR(A.DEPTCODE,1,1),''D'',''BZ''||SUBSTR(A.DEPTCODE,1,5),A.DEPTCODE) DEPTCODE, '+
            '       NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                                         '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                                             '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                               '+
            '       SUM(A.pdirsum) 임원,                                                                               '+
            '       SUM(A.P10) 부장,                                                                                   '+
            '       SUM(A.P20) 차장,                                                                                   '+
            '       SUM(A.P22) 과장,                                                                                   '+
            '       SUM(A.P32) 대리,                                                                                   '+
            '       SUM(A.P40 + A.P42 + A.P44)  사원,                                                                  '+
            '       SUM(A.PSPESUM) 특정,                                                                               '+
            '       SUM(A.PEMPTOT) 정규직계,                                                                           '+
            '       SUM(TCONTSUM) 계획,                                                                                '+
            '       SUM(PSCONSUM) 전계,                                                                                '+
            '       SUM(A.PCONTSUM) 계약,                                                                              '+
            '       SUM(PIMSITOT) 일반,                                                                                '+
            '       SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                                           '+
            '       SUM(PTOTAL) 총계                                                                                   '+
            ' from  pihtopo A, pycdept B                                                                               '+
            'where A.orgnum = B.orgnum                                                                                 '+
            '    and A.deptcode = B.deptcode                                                                           '+
            '    and A.tpgubun =''10''                                                                                 '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                                    '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                                      '+
            '    and b.closedate is null                                                                               '+
            'Group by A.orgnum,A.deptcode,B.deptname,B.deptna3,B.deptlevel                                             '+
{            'UNION                                                                                                     '+
            '    select ''         [팀  계]'' deptname,A.ORGNUM,substr(B.deptcode,1,3)||''99'' DEPTCODE,               '+
            '       NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                                         '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                                             '+
            '       NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                               '+
            '       SUM(A.pdirsum) 임원 ,                                                                              '+
            '       SUM(A.P10) 부장 ,                                                                                  '+
            '       SUM(A.P20) 차장 ,                                                                                  '+
            '       SUM(A.P22) 과장,                                                                                   '+
            '       SUM(A.P32) 대리 ,                                                                                  '+
            '       SUM(A.P40 + A.P42 + A.P44)  사원,                                                                  '+
            '       SUM(A.PSPESUM) 특정,                                                                               '+
            '       SUM(A.PEMPTOT) 정규직계,                                                                           '+
            '       SUM(TCONTSUM) 계획,                                                                                '+
            '       SUM(PSCONSUM) 전계,                                                                                '+
            '       SUM(A.PCONTSUM) 계약,                                                                              '+
            '       SUM(PIMSITOT) 일반,                                                                                '+
            '       SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                                           '+
            '       SUM(PTOTAL) 총계                                                                                   '+
            ' from  pihtopo A, pycdept B                                                                               '+
            '  where A.orgnum = B.orgnum                                                                               '+
            '    and A.deptcode = B.deptcode                                                                           '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                                    '+
            '    and A.tpgubun =''10''                                                                                 '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                                      '+
            '    and b.closedate is null                                                                               '+
            '  Group by A.ORGNUM,substr(B.deptcode,1,3)                                                                '+
            '  HAVING COUNT(A.deptcode) > 1                                                                            '+
}            
            'union                                                                                                     '+
            '  select  ''◈ ''||DEPTNAME, X.* from                                                                     '+
            '  (select A.ORGNUM, CASE WHEN SUBSTR(A.DEPTCODE,1,1) < ''K'' THEN ''BZ'' ELSE ''K''  END DEPTCODE,        '+
            '         NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                                       '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                                           '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                             '+
            '         SUM(A.pdirsum) 임원 ,                                                                            '+
            '         SUM(A.P10) 부장 ,                                                                                '+
            '         SUM(A.P20) 차장 ,                                                                                '+
            '         SUM(A.P22) 과장,                                                                                 '+
            '         SUM(A.P32) 대리 ,                                                                                '+
            '         SUM(A.P40 + A.P42 + A.P44)  사원,                                                                '+
            '         SUM(A.PSPESUM) 특정,                                                                             '+
            '         SUM(A.PEMPTOT) 정규직계,                                                                         '+
            '         SUM(TCONTSUM) 계획,                                                                              '+
            '         SUM(PSCONSUM) 전계,                                                                              '+
            '         SUM(A.PCONTSUM) 계약,                                                                            '+
            '         SUM(PIMSITOT) 일반,                                                                              '+
            '         SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                                         '+
            '         SUM(PTOTAL) 총계                                                                                 '+
            '   from  pihtopo A                                                                                        '+
            '  where A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                                      '+
            '    and A.tpgubun =''10''                                                                                 '+
            '    and A.DEPTCODE>=''C0000''                                                                             '+
            '    and A.DEPTCODE NOT LIKE ''Y%''                                                                        '+
            '    and substr(A.deptcode,1,1) <> ''Z''                                                                   '+
            '  Group by A.ORGNUM,CASE WHEN SUBSTR(A.DEPTCODE,1,1) < ''K'' THEN ''BZ'' ELSE ''K'' END  ) X, PYCDEPT B   '+
            '  where DECODE(X.DEPTCODE,''BZ'',''D0000'',RPAD(X.DEPTCODE,5,''0''))=B.DEPTCODE                           '+
            '        AND X.ORGNUM=B.ORGNUM                                                                             '+
            '        and b.closedate is null                                                                           '+
            'union                                                                                                     '+
            '  select ''★ ''||B.deptname deptname,A.ORGNUM,substr(A.deptcode,1,1) DEPTCODE,                           '+
            '         NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                                       '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                                           '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                             '+
            '         SUM(A.pdirsum) 임원 ,                                                                            '+
            '         SUM(A.P10) 부장 ,                                                                                '+
            '         SUM(A.P20) 차장 ,                                                                                '+
            '         SUM(A.P22) 과장,                                                                                 '+
            '         SUM(A.P32) 대리 ,                                                                                '+
            '         SUM(A.P40 + A.P42 + A.P44)  사원,                                                                '+
            '         SUM(A.PSPESUM) 특정,                                                                             '+
            '         SUM(A.PEMPTOT) 정규직계,                                                                         '+
            '         SUM(TCONTSUM) 계획,                                                                              '+
            '         SUM(PSCONSUM) 전계,                                                                              '+
            '         SUM(A.PCONTSUM) 계약,                                                                            '+
            '         SUM(PIMSITOT) 일반,                                                                              '+
            '         SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                                         '+
            '         SUM(PTOTAL) 총계                                                                                 '+
            '   from  pihtopo A, pycdept B                                                                             '+
            '  where A.orgnum = B.orgnum                                                                               '+
            '    and RPAD(SUBSTR(A.deptcode,1,1),5,''0'') = B.deptcode                                                 '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                                      '+
            '    and A.tpgubun =''10''                                                                                 '+
            '    and B.deptlevel <> ''60''                                                                             '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                                    '+
            '    and b.closedate is null                                                                               '+
            '  Group by A.ORGNUM,substr(A.deptcode,1,1),B.deptname                                                     '+
            'union                                                                                                     '+
            '  select ''  ■ ''||B.deptname deptname,A.ORGNUM,                                                         '+
            '                    decode(substr(A.deptcode,1,2),''DD'',''BZDD'',substr(A.deptcode,1,2)) DEPTCODE,       '+
            '         NVL(SUM(A.TEMPTOT + A.TCONTSUM),0) 총계획,                                                       '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT),0) 현원,                                                           '+
            '         NVL(SUM(A.pdir71 + A.PEMPTOT)-SUM(A.TEMPTOT + A.TCONTSUM),0) 과부족,                             '+
            '         SUM(A.pdirsum) 임원 ,                                                                            '+
            '         SUM(A.P10) 부장 ,                                                                                '+
            '         SUM(A.P20) 차장 ,                                                                                '+
            '         SUM(A.P22) 과장,                                                                                 '+
            '         SUM(A.P32) 대리 ,                                                                                '+
            '         SUM(A.P40 + A.P42 + A.P44)  사원,                                                                '+
            '         SUM(A.PSPESUM) 특정,                                                                             '+
            '         SUM(A.PEMPTOT) 정규직계,                                                                         '+
            '         SUM(TCONTSUM) 계획,                                                                              '+
            '         SUM(PSCONSUM) 전계,                                                                              '+
            '         SUM(A.PCONTSUM) 계약,                                                                            '+
            '         SUM(PIMSITOT) 일반,                                                                              '+
            '         SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,                                         '+
            '         SUM(PTOTAL) 총계                                                                                 '+
            '   from  pihtopo A, pycdept B                                                                             '+
            '  where A.orgnum = B.orgnum                                                                               '+
            '    and RPAD(SUBSTR(A.deptcode,1,2),5,''0'') = B.deptcode                                                 '+
            '    and A.topoym = '''+MainForm.ME_WorkDate.Text+'''                                                      '+
            '    and A.tpgubun =''10''                                                                                 '+
            '	 and substr(A.deptcode,1,1) <> ''Z''                                                                    '+
            '	 and B.deptlevel =''B0''                                                                                '+
            '    and b.closedate is null                                                                               '+
            '  Group by A.ORGNUM,decode(substr(A.deptcode,1,2),''DD'',''BZDD'',substr(A.deptcode,1,2)),B.deptname      '+
            'order by deptcode                                                                                         ');
    Open;
  end;
  QRL_curdate.Caption  := MainForm.L_Date.Caption;
  QRL_WorkDate.Caption := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                          Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
end;

procedure TNewPrintForm2.QRBand_DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qry_Mas do
  begin
    QRL_deptname.Caption := FieldByName('deptname').AsString;
    QRL_ttotal.Caption   := FieldByName('총계획').AsString;
    QRL_ptotal.Caption   := FieldByName('현원').AsString;
    QRL_ptempsum.Caption := FieldByName('과부족').AsString;
    QRL_pdirsum.Caption  := FieldByName('임원').AsString;
    QRL_10.Caption       := FieldByName('부장').AsString;
    QRL_20.Caption       := FieldByName('차장').AsString;
    QRL_22.Caption       := FieldByName('과장').AsString;
    QRL_32.Caption       := FieldByName('대리').AsString;
    QRL_4X.Caption       := FieldByName('사원').AsString;
    QRL_pspe.Caption     := FieldByName('특정').AsString;
    QRL_pemp.Caption     := FieldByName('정규직계').AsString;
    QRL_psconsum.Caption := FieldByName('전계').AsString;
    QRL_pcontsum.Caption := FieldByName('계약').AsString;
    QRL_pextrsum.Caption := FieldByName('일반').AsString;
    QRL_pimsisum.Caption := FieldByName('계약계').AsString;
    QRL_psum.Caption     := FieldByName('총계').AsString;
  end;
end;

procedure TNewPrintForm2.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TNewPrintForm2.QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if Trim(MainForm.ME_WorkDate.Text) < MainForm.payrachym then
     begin
          QRLabel11.Caption := '부서/직급별 인원 상세 현황';
          QRLabel11.Caption := '부장';
          QRLabel14.Caption := '차장';
          QRLabel15.Caption := '과장';
          QRLabel17.Caption := '대리';
          QRLabel39.Caption := '사원';
          QRLabel18.Caption := '특정';
     end
     else
     begin
          QRLabel11.Caption := '부서/BAND별 인원 상세 현황';
          QRLabel11.Caption := 'L2';
          QRLabel14.Caption := 'L1';
          QRLabel15.Caption := 'G4';
          QRLabel17.Caption := 'G3';
          QRLabel39.Caption := 'G2';
          QRLabel18.Caption := 'P' ;
     end;
end;

end.
