unit psc22004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, Db, DBTables,ComObj,
  OnSkinBtn;

type
  TF_psc22004 = class(TForm)
    GB_apply: TGroupBox;
    Panel6: TPanel;
    Panel4: TPanel;
    CB_cha: TComboBox;
    work_date: TMaskEdit;
    RG1: TRadioGroup;
    pBar1: TProgressBar;
    dsTemp: TDataSource;
    GroupBox1: TGroupBox;
    RG2: TRadioGroup;
    Panel2: TPanel;
    cbBungi: TComboBox;
    OnSkinButton1: TOnSkinButton;
    OnSkinButton2: TOnSkinButton;
    OnSkinButton3: TOnSkinButton;
    DBGrid1: TDBGrid;
    qryTemp: TQuery;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RG2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure work_dateExit(Sender: TObject);
    procedure OnSkinButton2Click(Sender: TObject);
    procedure OnSkinButton1Click(Sender: TObject);
    procedure RG1Click(Sender: TObject);
    procedure OnSkinButton3Click(Sender: TObject);
  private
    function ConvertExcelFile(sqlTemp : String): Boolean;
    function IntToCell(input : integer) : String;
    procedure DataPreview(strQry : String);
    procedure OptionCheck;
    procedure BungiCheck;
    { Private declarations }
  public
    { Public declarations }
  end;

var
     F_psc22004: TF_psc22004;
     strSQL    : TStringList;
     FExcel, FWorkBook, FWorkSheet : Variant;

const
     xlLeft       = -4131;
     xlRight      = -4152;
     xlTop        = -4160;
     xlBottom     = -4107;
     xlNone       = 0;
     xlCenter     = -4108;
     xlContinuous = 1;
     xlThin       = 2;
     xlAutomatic  = -4105;
     xlLandscape  = 2;
     xlColorGray  = 15;
     xlColorBlue  = 5;
     xlFirstRow   = 1;
     xlFirstCol   = 0;

implementation

uses psc22001;

{$R *.DFM}

procedure TF_psc22004.FormShow(Sender: TObject);
begin
     work_date.Text   := F_psc22001.work_date.Text;
     BungiCheck;
     CB_cha.ItemIndex := 9;  // 차수  디폴트-전체
     strSQL           := TStringList.Create;
     OptionCheck;
end;

procedure TF_psc22004.FormCreate(Sender: TObject);
begin
     qryTemp.DatabaseName := F_psc22001.DB1.DatabaseName;
end;

procedure TF_psc22004.RG2Click(Sender: TObject);
begin
     if  RG2.ItemIndex = 0 then
     begin
          cbBungi.Visible := False;
          Panel2.Visible  := False;
     end
     else
     begin
         // cbBungi.Visible := True;
         // Panel2.Visible  := True;
     end;
end;

function TF_psc22004.ConvertExcelFile(sqlTemp : String): Boolean;
var
     i, j, cntField,cntRecord : integer;
begin
     try
          FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
     except on E: EOleSysError do
          begin
              try
                   FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
              except
                   MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
                   Exit;
              end;
          end;
     end;
     TRY
          //FExcel.Visible := True;
          FWorkBook  := FExcel.WorkBooks.Add;
          FWorkSheet := FWorkBook.WorkSheets.Add;
          if  RG1.ItemIndex = 0 then
          begin
               if  RG2.ItemIndex = 0 then
                    FWorkSheet.Name := '기준일별대부현황(' + CB_cha.Items[CB_cha.ItemIndex] +')'
               else
                    //FWorkSheet.Name := '분기별대부현황'
          end
          else
          begin
               if  RG2.ItemIndex = 0 then
                    FWorkSheet.Name := '기준일별주식현황(' + CB_cha.Items[CB_cha.ItemIndex] + ')'
               else
                    //FWorkSheet.Name := '분기별주식현황'
          end;
          FExcel.Columns.AutoFit;
          with qryTemp do
          begin
               if  Active = False then
               begin
                    showmessage('조회먼저하세요!');
                    system.Exit;
               end;
               DisableControls;
               pBar1.Max := RecordCount;
               for  i := 1 to FieldCount  do
               begin
                    FWorkSheet.Cells[1 , i] :=  Fields[i - 1].FieldName;
                    Next;
               end;
               First;
               for  i := xlFirstRow + 1 to RecordCount + 1 do
               begin
                    for  j := 1 to FieldCount do
                    begin
                         if  Fields[j - 1].DataType = ftFloat then
                              FWorkSheet.Cells[i, j] := FieldByName(Fields[j - 1].FieldName).AsFloat
                         else
                              FWorkSheet.Cells[i, j] := FieldByName(Fields[j - 1].FieldName).AsString;
                    end;
                    Next;
                    pBar1.Position := i - 1 ;
               end;
               EnableControls;
               FExcel.Range['A1:'+'A'+intToStr(i)].Select;
               FExcel.Selection.NumberFormatLocal   := '0000';
               FExcel.Selection.HorizontalAlignment := xlRight;
   //            FExcel.Range['A1:'+IntToCell(FieldCount)+intToStr(RecordCount)].Select;
   //            FExcel.Selection.Borders.LineStyle := xlContinuous;
          end;
   //----------------------------------------------------------------------------------------------------
   //       FWorkSheet.Cells[i, 2] := '총 계';
   //       FWorkSheet.Cells[i, 4] := '=SUM(D'+IntToStr(xlFirstRow+1)+':D'+IntToStr(i-1)+')';
   //       FWorkSheet.Cells[i, 6] := '=SUM(F'+IntToStr(xlFirstRow+1)+':F'+IntToStr(i-1)+')';
   //       FWorkSheet.Cells[i, 7] := '=SUM(G'+IntToStr(xlFirstRow+1)+':G'+IntToStr(i-1)+')';
          FExcel.Range['A1'].Select;
   //-----------------------------------------------------------------------------------------------------

          FExcel.Visible       := True;
          FExcel.DisplayAlerts := False;
          Close;
          //if SaveDialog1.Execute then
          //  FExcel.ActiveWorkBook.SaveAs(SaveDialog1.Filename);

          // FExcel.Quit;

     EXCEPT
          //FExcel.DisplayAlerts := False;
         { if not VarIsEmpty(FExcel) then
          begin
            FExcel.DisplayAlerts := False;
            FExcel.Quit;
            FExcel := UnAssigned;
          end; }
     END;
end;

procedure TF_psc22004.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TF_psc22004.BitBtn2Click(Sender: TObject);
begin
     ConvertExcelFile(strSQL.Text);
end;

procedure TF_psc22004.OptionCheck;
begin
     if  RG1.ItemIndex = 0 then
     begin
          if  RG2.ItemIndex = 0 then
          begin
               strSQL.Clear;
               strSQL.Add('SELECT                                                                                        '+
                          '       C.empno 사번, C.korname 성명, C.divseqnum 차수, C.stclass 구분,                        '+
                          '       decode(C.stclass,''1'',''사주우선'',                                                   '+
                          '                        ''2'',''사주실권'',                                                   '+
                          '                        ''3'',''주주우선'',                                                   '+
                          '                        ''4'',''주주우선(예탁)'',                                             '+
                          '                        ''5'',''주주우선(비예탁)'') 대부구분,                                 '+
                          '       (select codename from pyccode where codeid=''K910'' and codeno=C.stlorg) 대부기관,     '+
                          '       C.stldate 대부일, DECODE(D.rno,NULL, 0, C.stlamt) 대부금액,                            '+
                          '       C.exdate 상환월, C.exmdate 상환일, nvl(C.excpamt,0) 상환금액,                          '+
                          '       DECODE(D.rno, NULL, 0, C.stiramt) 상환잔액                                             '+
                          '  FROM                                                                                        '+
                          '      (SELECT                                                                                 '+
                          '              rownum rno, A.corpname, A.empno, A.korname, A.divseqnum,                        '+
                          '              A.stclass, A.stlorg, A.stldate, A.stlamt, B.exdate,                             '+
                          '              B.exmdate, B.excpamt, A.stiramt                                                 '+
                          '         FROM pslmas A, psemhis B                                                             '+
                          '        WHERE A.CORPNAME <> ''데이콤''                                                        '+
                          '          AND A.corpname = B.corpname(+)                                                      '+
                          '          AND A.divseqnum= B.divseqnum(+)                                                     '+
                          '          AND A.empno    = B.empno(+)                                                         '+
                          '          AND A.stclass  = B.stclass(+)                                                       '+
                          '          AND A.stlorg   = B.stlorg(+)                                                        '+
                          '          AND NVL(B.exmdate(+),'' '') <= '''+ work_date.Text +  '''                           '+
                          '          AND NVL(B.excpamt(+),0) > 0                                                         '+
                          '      ) C,                                                                                    '+
                          '      (SELECT empno, korname, stlorg, divseqnum, stclass,                                     '+
                          '              stldate, stlamt, min(rno) rno                                                   '+
                          '         FROM                                                                                 '+
                          '             (SELECT                                                                          '+
                          '                     rownum rno,A.corpname, A.empno, A.korname, A.divseqnum,                  '+
                          '                     A.stclass, A.stlorg, A.stldate, A.stlamt, B.exdate,                      '+
                          '                     B.exmdate, B.excpamt, A.stiramt                                          '+
                          '                FROM pslmas A, psemhis B                                                      '+
                          '               WHERE A.CORPNAME <> ''데이콤''                                                 '+
                          '                 AND A.corpname = B.corpname(+)                                               '+
                          '                 AND A.divseqnum= B.divseqnum(+)                                              '+
                          '                 AND A.empno    = B.empno(+)                                                  '+
                          '                 AND A.stclass  = B.stclass(+)                                                '+
                          '                 AND A.stlorg   = B.stlorg(+)                                                 '+
                          '                 AND NVL(B.exmdate(+), '' '') <= '''+ work_date.Text + '''                    '+
                          '                 AND NVL(B.excpamt(+), 0) > 0                                                 '+
                          '             )                                                                                '+
                          '        GROUP BY  divseqnum, stclass, stlorg, empno, korname, stldate, stlamt                 '+
                          '      ) D                                                                                     '+
                          ' WHERE  C.rno = D.rno(+)                                                                      ');
               Case CB_cha.ItemIndex of
                    0 :  strSQL.Add(' and C.stlorg = ''ZZ'' and C.divseqnum =  1                                         ');
                    1 :  strSQL.Add(' and C.stlorg = ''ZZ'' and C.divseqnum =  2                                         ');
                    2 :  strSQL.Add(' and C.stlorg = ''05'' and C.divseqnum =  2                                         ');
                    3 :  strSQL.Add(' and C.stlorg = ''ZZ'' and C.divseqnum =  3                                         ');
                    4 :  strSQL.Add(' and C.stlorg = ''81'' and C.divseqnum =  3                                         ');
                    5 :  strSQL.Add(' and C.stlorg = ''81'' and C.divseqnum =  4                                         ');
                    6 :  strSQL.Add(' and C.stlorg = ''23'' and C.divseqnum =  4                                         ');
                    7 :  strSQL.Add(' and C.stlorg = ''11'' and C.divseqnum =  5                                         ');
                    8 :  strSQL.Add(' and C.stlorg = ''10'' and C.divseqnum =  5                                         ');
               end;
               strSQL.Add(' order by 차수, 대부기관, 사번, 대부구분, 대부일, 상환월, 상환일                              ');

//memo1.text := strSQL.Text;
exit;
          end
          else
          begin
               strSQL.Clear;
               strSQL.Add(' select a.empno 사번, a.korname 성명, a.stldate 대부일자, a.대부금액, a.상환금액,                  '+
                          '        a.상환잔액 상환잔액_bef, b.상환금액, a.상환잔액 - b.상환금액 상환잔액_aft,                 '+
                          '        a.corpname 회사명, a.divseqnum 배정차수, a.stlorg 대부기관,                                '+
                          '        (select codename from pyccode where codeid=''K910'' and codeno = a.stlorg) 대부기관명,     '+
                          '        decode(a.stclass,''1'',''사주우선'', ''2'',''사주실권'', ''3'',''주주우선'',               '+
                          '                         ''4'',''주주우선(예탁)'', ''5'',''주주우선(비예탁)'') 주식구분,           '+
                          '        (select stledate from PSHLBAS where DIVSEQNUM= a.divseqnum                                 '+
                          '                                        and STCLASS  = a.stclass  and STLORG = a.stlorg) 만기상환일'+
                          '   from                                                                                            '+
                          '       (select l.divseqnum, l.corpname, l.empno, l.korname,                                        '+
                          '               l.stldate, l.stlamt 대부금액, nvl(sum(h.excpamt),0) 상환금액,                       '+
                          '               nvl(l.stlamt,0) - nvl(sum(h.excpamt),0) 상환잔액,                                   '+
                          '               l.stclass, l.stlorg                                                                 '+
                          '          from pslmas l, psemhis h                                                                 '+
                          '         where l.empno     = h.empno (+)                                                           '+
                          '           and l.divseqnum = h.divseqnum (+)                                                       '+
                          '           and l.stclass   = h.stclass (+)                                                         '+
                          '           and l.stlorg    = h.stlorg  (+)                                                         '+
                          '           and l.corpname  = h.corpname (+)                                                        '+
                          '           and l.CORPNAME  <> ''데이콤''                                                           '+
                          '           and h.exdate(+) <= to_char(Last_day(Add_Months(to_date('''+work_date.text+'''),-3)))    '+
                          '         group by l.divseqnum, l.corpname, l.empno, l.korname,                                     '+
                          '                  l.stldate, l.stlamt, l.stclass, l.stlorg ) a,                                    '+
                          '       (select l.divseqnum, l.corpname, l.empno, l.korname,                                        '+
                          '               l.stldate, l.stlamt 대부금액, nvl(sum(h.excpamt),0) 상환금액,                       '+
                          '               nvl(l.stlamt,0) - nvl(sum(h.excpamt),0) 상환잔액,                                   '+
                          '               l.stclass, l.stlorg                                                                 '+
                          '         from pslmas l, psemhis h                                                                  '+
                          '        where l.empno     = h.empno (+)                                                            '+
                          '          and l.divseqnum = h.divseqnum (+)                                                        '+
                          '          and l.stclass   = h.stclass (+)                                                          '+
                          '          and l.stlorg    = h.stlorg  (+)                                                          '+
                          '          and l.corpname  = h.corpname (+)                                                         '+
                          '          and l.CORPNAME  <> ''데이콤''                                                            '+
                          '          and h.exdate(+) between                                                                  '+
                          '                    to_char(Add_Months(to_date('''+work_date.text+'''),-2),''YYYYMM'')||''01''     '+
                          '                          and '''+work_date.text+'''                                               '+
                          '        group by l.divseqnum, l.corpname, l.empno, l.korname,                                      '+
                          '               l.stldate, l.stlamt, l.stclass, l.stlorg ) b                                        '+
                          '  where a.divseqnum= b.divseqnum                                                                   '+
                          '    and a.corpname = b.corpname                                                                    '+
                          '    and a.empno    = b.empno                                                                       '+
                          '    and a.stldate  = b.stldate                                                                     '+
                          '    and a.stclass  = b.stclass                                                                     '+
                          '    and a.stlorg   = b.stlorg                                                                      ');
               Case CB_cha.ItemIndex of
                    0 :  strSQL.Add(' and a.stlorg   = ''ZZ''    and  a.divseqnum =  1                                        ');
                    1 :  strSQL.Add(' and a.stlorg   = ''ZZ''    and  a.divseqnum =  2                                        ');
                    2 :  strSQL.Add(' and a.stlorg   = ''05''    and  a.divseqnum =  2                                        ');
                    3 :  strSQL.Add(' and a.stlorg   = ''ZZ''    and  a.divseqnum =  3                                        ');
                    4 :  strSQL.Add(' and a.stlorg   = ''81''    and  a.divseqnum =  3                                        ');
                    5 :  strSQL.Add(' and a.stlorg   = ''81''    and  a.divseqnum =  4                                        ');
                    6 :  strSQL.Add(' and a.stlorg   = ''23''    and  a.divseqnum =  4                                        ');
                    7 :  strSQL.Add(' and a.stlorg   = ''11''    and  a.divseqnum =  5                                        ');
                    8 :  strSQL.Add(' and a.stlorg   = ''10''    and  a.divseqnum =  5                                        ');
               end;
               strSQL.Add(' order by a.empno, a.stldate, a.corpname, a.divseqnum, a.stlorg, a.stclass                         ');
          end;
     end
     else
     begin
          strSQL.Clear;
          strSQL.Add(' select a.empno 사번, a.korname 성명,max(a.divseqnum) 차수,                     '+
                     '        sum(nvl(a.dpstcnt,0)) 예탁주식,                                         '+
                     '        sum(nvl(a.wrcnt,0)) 인출주식, sum(nvl(a.remcnt,0)) 보유주식             '+
                     ' from psdphis a, psstmas b                                                      '+
                     ' where a.empno = b.empno                                                        ');


          Case CB_cha.ItemIndex of
               0 :  strSQL.Add(' and  a.divseqnum =  1                                                ');
               1 :  strSQL.Add(' and  a.divseqnum =  2                                                ');
               2 :  strSQL.Add(' and  a.divseqnum =  3                                                ');
               3 :  strSQL.Add(' and  a.divseqnum =  4                                                ');
               4 :  strSQL.Add(' and  a.divseqnum =  5                                                ');
               5 :  strSQL.Add(' and  a.divseqnum =  6                                                ');
          end;

          if  CB_cha.ItemIndex >= 4 then    //2007.06.25 서혜미 한명당 모든 차수 데이타 가로로 출력되게.오종석 과장 요청
          begin
               strSQL.Clear;
               strSQL.Add('select a.empno 사번, a.korname 성명,                                                                                   ');
               strSQL.Add('       nvl(x.div,1)  일차, nvl(x.예탁주식1,0) 예탁주식1, nvl(x.인출주식1,0) 인출주식1, nvl(x.보유주식1,0) 보유주식1,   ');
               strSQL.Add('       nvl(y.div,2)  이차, nvl(y.예탁주식2,0) 예탁주식2, nvl(y.인출주식2,0) 인출주식2, nvl(y.보유주식2,0) 보유주식2,   ');
               strSQL.Add('       nvl(m.div,3)  삼차, nvl(m.예탁주식3,0) 예탁주식3, nvl(m.인출주식3,0) 인출주식3, nvl(m.보유주식3,0) 보유주식3,   ');
               strSQL.Add('       nvl(g.div,4)  사차, nvl(g.예탁주식4,0) 예탁주식4, nvl(g.인출주식4,0) 인출주식4, nvl(g.보유주식4,0) 보유주식4,   ');
               strSQL.Add('       nvl(w.div,5)  오차, nvl(w.예탁주식5,0) 예탁주식5, nvl(w.인출주식5,0) 인출주식5, nvl(w.보유주식5,0) 보유주식5,   ');
               strSQL.Add('       nvl(j.div,6)  육차, nvl(j.예탁주식6,0) 예탁주식6, nvl(j.인출주식6,0) 인출주식6, nvl(j.보유주식6,0) 보유주식6,   ');
               strSQL.Add('       nvl(x.보유주식1,0)+nvl(y.보유주식2,0)+nvl(m.보유주식3,0)+nvl(g.보유주식4,0)+nvl(w.보유주식5,0)+nvl(j.보유주식6,0) tot');
               strSQL.Add('  from psstmas a,                                                                                                      ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식1, aa.inchul - nvl(bb.wdstcnt,0) 인출주식1, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식1                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 1                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) x,                                                                                                            ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식2, aa.inchul - nvl(bb.wdstcnt,0) 인출주식2, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식2                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 2                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) y,                                                                                                            ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식3, aa.inchul - nvl(bb.wdstcnt,0) 인출주식3, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식3                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 3                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) m,                                                                                                            ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식4, aa.inchul - nvl(bb.wdstcnt,0) 인출주식4, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식4                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 4                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) g,                                                                                                            ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식5, aa.inchul - nvl(bb.wdstcnt,0) 인출주식5, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식5                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 5                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) w,                                                                                                            ');
               strSQL.Add('       (select aa.empno, aa.korname 성명,AA.divseqnum div, aa.dpst 예탁주식6, aa.inchul - nvl(bb.wdstcnt,0) 인출주식6, ');
               strSQL.Add('               aa.dpst - aa.inchul + nvl(bb.wdstcnt,0)  보유주식6                                                      ');
               strSQL.Add('          from (SELECT DIVSEQNUM, empno, korname, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                               ');
               strSQL.Add('                  FROM psdphis a                                                                                       ');
               strSQL.Add('                 GROUP BY DIVSEQNUM, empno, korname ) AA,                                                              ');
               strSQL.Add('               (select DIVSEQNUM, EMPNO, korname, sum(wdstcnt) wdstcnt                                                 ');
               strSQL.Add('                  from PSowHIS                                                                                         ');
               strSQL.Add('                 where subdate >  ''' + work_date.Text + '''                                                           ');
               strSQL.Add('                 GROUP BY DIVSEQNUM,empno, korname ) BB                                                                ');
               strSQL.Add('         WHERE AA.DIVSEQNUM = 6                                                                                        ');
               strSQL.Add('           AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                                                          ');
               strSQL.Add('           AND AA.EMPNO     = BB.EMPNO(+)                                                                              ');
               strSQL.Add('       ) j                                                                                                             ');
               strSQL.Add('  where  a.empno = x.empno(+)                                                                                          ');
               strSQL.Add('    and  a.empno = y.empno(+)                                                                                          ');
               strSQL.Add('    and  a.empno = m.empno(+)                                                                                          ');
               strSQL.Add('    and  a.empno = g.empno(+)                                                                                          ');
               strSQL.Add('    and  a.empno = w.empno(+)                                                                                          ');
               strSQL.Add('    and  a.empno = j.empno(+)                                                                                          ');
               strSQL.Add('  order by a.empno                                                                                                     ');
          end
          else
          begin
               strSQL.Add(' group by a.empno, a.korname, a.divseqnum                                                                              ');
               strSQL.Add(' order by a.divseqnum, a.empno                                                                                         ');
          end;

     end;
end;

procedure TF_psc22004.BungiCheck;
var
     iBungi : Integer;
begin
     iBungi := StrToIntDef(Copy(work_date.Text,5,2),0);

     if      (iBungi >= 1)  and (iBungi < 4)  then      cbBungi.ItemIndex := 0
     else if (iBungi >= 4)  and (iBungi < 7)  then      cbBungi.ItemIndex := 1
     else if (iBungi >= 6)  and (iBungi < 10) then      cbBungi.ItemIndex := 2
     else if (iBungi >= 10) and (iBungi < 13) then      cbBungi.ItemIndex := 3
     else
     begin
          if  Length(work_date.Text) <> 8 then
               showmessage('잘못된 날짜값입니다!');
     end;
end;

procedure TF_psc22004.work_dateExit(Sender: TObject);
begin
     BungiCheck;
end;

procedure TF_psc22004.DataPreview(strQry : String);
begin
     if FileExists('c:\jissi.sql') then    DeleteFile('c:\jissi.sql');
     with qryTemp do
     begin
          Close;
          SQL.Clear;
          SQL.Text := strQry;
          Open;
     end;
end;


function TF_psc22004.IntToCell(input : integer) : String;
begin
     case input of
          1: Result := 'A' ;
          2: Result := 'B' ;
          3: Result := 'C' ;
          4: Result := 'D' ;
          5: Result := 'E' ;
          6: Result := 'F' ;
          7: Result := 'G' ;
          8: Result := 'H' ;
          9: Result := 'I' ;
     end;
end;

procedure TF_psc22004.OnSkinButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TF_psc22004.OnSkinButton1Click(Sender: TObject);
begin
     OptionCheck;
     DataPreview(strSQL.Text);
     DBGrid1.Columns[0].Width := 35;       //RxDBGrid1 -> DBGrid1 로 변경 2007.06.26 서혜미
     DBGrid1.Columns[1].Width := 50;
end;

procedure TF_psc22004.RG1Click(Sender: TObject);
begin
     if  RG1.ItemIndex = 0 then
     begin
          CB_cha.Items.Clear;
          CB_cha.Items.Add('1차회사');
          CB_cha.Items.Add('2차회사');
          CB_cha.Items.Add('2차외환');
          CB_cha.Items.Add('3차회사');
          CB_cha.Items.Add('3차하나');
          CB_cha.Items.Add('4차하나');
          CB_cha.Items.Add('4차제일');
          CB_cha.Items.Add('5차농협1');
          CB_cha.Items.Add('5차농협2');
          CB_cha.Items.Add('전체');
          CB_cha.ItemIndex := 9;
     end
     else
     begin
          CB_cha.Items.Clear;
          CB_cha.Items.Add('1차');
          CB_cha.Items.Add('2차');
          CB_cha.Items.Add('3차');
          CB_cha.Items.Add('4차');
          CB_cha.Items.Add('5차');
          CB_cha.Items.Add('전체');
          CB_cha.ItemIndex := 5;
     end;
end;

procedure TF_psc22004.OnSkinButton3Click(Sender: TObject);
begin
     ConvertExcelFile(strSQL.Text);
end;

end.
