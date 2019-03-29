unit pit1040c9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, peempnobtnedit, Db, DBTables, Grids, Mask, StdCtrls,
  peextcombo, PeJeonLabel, pebtnedit, pecodebtnedit, pedeptbtnedit, PeJeonBtnDateEdit,
  peNumedit, peoutlookbtn, pegradpanl,  Pass, PeDBUtil, ComCtrls ;

type
  TMainForm2 = class(TForm)
    Panel10: TPanel;
    P_payclnamefr: TPeJeonLabel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    E_payclfr: TPePanelEdit;
    P_payclnameto: TPeJeonLabel;
    E_payclto: TPePanelEdit;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    P_Deptnamefr: TPeJeonLabel;
    P_Deptnameto: TPeJeonLabel;
    E_Empnofr: TPePanelEdit;
    P_Kornamefr: TPeJeonLabel;
    E_Empnoto: TPePanelEdit;
    P_Kornameto: TPeJeonLabel;
    E_Deptcodefr: TPePanelEdit;
    E_Deptcodeto: TPePanelEdit;
    OpenDialog1: TOpenDialog;
    BB_PreView: TPeJeonOutLookBtn;
    B_Clear: TPeJeonOutLookBtn;
    Qmas: TQuery;
    Panel3: TPanel;
    G_22: TPanel;
    im4: TImage;
    Panel14: TPanel;
    Filenm: TPePanelEdit;
    filesel: TSpeedButton;
    G_21: TPanel;
    im3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SB_eqipprogliceClick(Sender: TObject);
    procedure BB_PreViewClick(Sender: TObject);
    procedure E_EditExit(Sender: TObject);
    procedure E_EditDblClick(Sender: TObject);
    procedure E_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_EditlKeyPress(Sender: TObject; var Key: Char);
    procedure B_ClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fileselClick(Sender: TObject);
    procedure G_22Click(Sender: TObject);
  private
    { Private declarations }
    Q_empnostr  : string;
    eFile       : TextFile;       //2001.09.28 shm
    function MyPasString(const S, Delimiters : string; Num : integer) : string;
  public
    Start: Boolean;
    giCall: Integer;
    gu1,gu3,gu4 : integer;
    pageCnt : integer; {출력장수}
    sss : String;
//    empnostr  : array[1..50] of string[4];
    function  fnGetData: Integer;
    function  fnGetRowSG(AGrid: TStringGrid; AGubun: Integer): String;
    procedure fzCallCodeForm(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzGetCode(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzGetDataSql(mGubun: Integer);
    procedure fzOpenDataSets;
    procedure fzOpenDataSets_Det(mGubun: Integer; mEmpnoList: String);
    { Public declarations }
  end;

type sText = record        //2001.09.28 shm
     empno : string[4];    //2001.09.28 shm

  end;

var
  MainForm2: TMainForm2;
  HomeDir     : string;     //2001.09.28 shm
  empText     : sText;      //2001.09.28 shm
  i, k : integer;           //2001.09.28 shm
implementation

{$R *.DFM}

uses
  umain, PIT1040C0, PIT1040C3, PIT1040C4, PIT1040C6, PIT1040C7,
  UpitLib, PIT1040C5, PIT1040C2, pit1040c10;//, Calen1, codeText,datelib;

////////////////////////////////////////////////////////////////////////////////
// Event
////////////////////////////////////////////////////////////////////////////////
procedure TMainForm2.FormCreate(Sender: TObject);
begin
    HomeDir  := HomeDirOpen;  //2001.09.28 shm
    Start := True;
end;

procedure TMainForm2.FormShow(Sender: TObject);
begin
    if Start = false then Exit;
    Start := False;

  try
    Application.ProcessMessages;

  except
    on E:Exception do
    begin
        MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                   Chr(13)+Chr(10)+E.Message, mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
  end;
  E_Empnofr.SetFocus;
end;

procedure TMainForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Close;
end;

////////////////////////////////////////////////////////////////////////////////
// UserDefine
////////////////////////////////////////////////////////////////////////////////
function TMainForm2.fnGetRowSG(AGrid: TStringGrid; AGubun: Integer): String;
var
  i, j: Integer;
  sTemp: String;
begin
    sTemp := '';
    j := 0;

    case AGubun of
      1:
      begin
          with AGrid do
          begin
              for i:= FixedRows to RowCount-1 do
                  if Cells[FixedCols,i] <> '' then
                      sTemp := sTemp + Format('(''%s'',''%s'',''%s''),',[Cells[0,i],Cells[2,i],Cells[4,i]]);
          end;
      end;
      2,3:
      begin
          with AGrid do
          begin
              for i:= FixedRows to RowCount-1 do
                  if Cells[FixedCols,i] <> '' then
                       sTemp := sTemp + Format('''%s'',',[Cells[4,i]]);
          end;
      end;
      4,6:
      begin
          with AGrid do
          begin
              for i:= FixedRows to RowCount-1 do
                  if Cells[FixedCols,i] <> '' then
                       sTemp := sTemp + Format('''%s'',',[Cells[2,i]]);
          end;
      end;
      5:
      begin
          with AGrid do
          begin
              for i:= FixedRows to RowCount-1 do
                  if Cells[g_CHECK,i] = '▣' then
                      sTemp := sTemp + Format('''%s'',',[Cells[g_EMPNO,i]]);
          end;
      end;
      7:
      begin
          with AGrid do
          begin
              for i:= FixedRows to RowCount-1 do
                  if Cells[g_CHECK,i] = '▣' then
                      Inc(j);
              sTemp := IntToStr(j);
          end;
      end;
    end;

    // 마지막 ","제거
    if (length(sTemp) > 0) and (sTemp[length(sTemp)] = ',') then
        sTemp[length(sTemp)] := ' ';
    Result := sTemp;
end;

// setting grobal var -- SQL
procedure TMainForm2.fzGetDataSql(mGubun: Integer);
var
  sSelect, sOrderBy: String;
  sSqlMain, sSqlDuty, sSqlEqip, sSqlProg, sSqlLice: String;
  sTemp : String;
begin
    sSqlMain := '';
    sSqlDuty := '';
    sSqlProg := '';
    sSqlEqip := '';
    sSqlLice := '';
    sOrderBy := '';

    sTemp    := '';

//2001.10.08 shm 추가
    if (Gu1 = 3) or (Gu1 = 4) then begin
          sSqlMain := sSqlMain +
                     '  AND i.empno  in ('''+Q_empnostr+''') ';
    end;


    // 사번
    if (trim(E_empnofr.Text) <> '') or (trim(E_empnoto.Text) <> '') then
        sSqlMain := sSqlMain +
                  '  AND i.empno BETWEEN NVL('''+E_empnofr.Text+''',''0'') AND NVL('''+E_empnoto.Text+''',''zz'') ';
    // 부서
    if (trim(E_Deptcodefr.Text) <> '') or (trim(E_Deptcodeto.Text) <> '') then
        sSqlMain := sSqlMain +
                  '  AND i.deptcode BETWEEN NVL('''+E_Deptcodefr.Text+''',''0'') AND NVL('''+E_Deptcodeto.Text+''',''zz'') ';
    // 최종직급 역순으로 입력됨
    if (trim(E_payclfr.Text) <> '') or (trim(E_payclto.Text) <> '') then
        sSqlMain := sSqlMain +
                  '  AND i.paycl BETWEEN NVL('''+E_payclto.Text+''',''0'') AND NVL('''+E_payclfr.Text+''',''zz'') ';

    sSqlDuty := ' ';
    //////////////////////////////// Duty
    // 직군별 직무
    //sSqlDuty := sSqlDuty +
    //              '  AND (a.jobfield, a.dutykind, a.duty) IN ('+fnGetRowSG(SG_Duty,1)+') ';
    //sTemp    := sTemp    +
    //              ' WHERE (jobfield, dutykind, duty) IN ('+fnGetRowSG(SG_Duty,1)+') ';

    //////////////////////////////// Eqip
    // 쥐급장비
    sSqlEqip := ' FROM pishreqip, '+
                '      (select codeno, codename from pishrcode where codeid = ''I711'') '+
                ' WHERE eqipcode = codeno ';
    //if (trim(SG_Eqip.Cells[0,1]) <> '') then
    //    sSqlEqip := sSqlEqip + ' AND eqipcode IN ('+fnGetRowSG(SG_Eqip,2)+') ';
    //if (E_EUseYY.Text <> '') or (E_EUseMM.Text <> '') then
    //    sSqlEqip := sSqlEqip + ' AND Useyy >= '+inttostr(StrtointDef(E_EUseYY.Text,0))+
    //                ' AND Useyy <= '+inttostr(StrtointDef(E_EUseMM.Text,0))+'  ';

    //////////////////////////////// Prog
    // 취급프로그램
    sSqlProg := ' FROM pishrprog, '+
                '      (select codeno, codename from pishrcode where codeid = ''I713'') '+
                ' WHERE progcode = codeno ';
    //if (trim(SG_Prog.Cells[0,1]) <> '') then
    //    sSqlProg := sSqlProg + ' AND progcode IN ('+fnGetRowSG(SG_Prog,3)+') ';
    //if (E_PUseYY.Text <> '') or (E_PUseMM.Text <> '') then
    //    sSqlProg := sSqlProg + ' AND Useyy >= '+inttostr(StrtointDef(E_PUseYY.Text,0))+
    //                ' AND Useyy <= '+inttostr(StrtointDef(E_PUseMM.Text,0))+'  ';

    //////////////////////////////// Lice
    // 보유자격증
    sSqlLice := ' FROM pimlice, '+
                '      (select codeno, codename from pyccode where codeid = ''I231'') '+
                ' WHERE lickind = codeno ';
    //sSqlLice := sSqlLice + ' AND lickind IN ('+fnGetRowSG(SG_Lice,4)+') ';

//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//------------------------------------------------------------------------------
    case mGubun of
      1 : begin
            //sSqlMain
            sSelect :=
              'SELECT nvl(        i.empno           ,'' '') EMPNO     ,         '+
              '       nvl(        i.korname         ,'' '') KORNAME   ,         '+
              '       nvl(        i.orgnum          ,'' '') ORGNUM    ,         '+
              '       nvl(        i.deptcode        ,'' '') DEPTCODE  ,         '+
              '       nvl(        d.deptname        ,'' '') DEPTNAME  ,         '+
              '       nvl(        i.paycl           ,'' '') IMASPAYCL     ,     '+
              '       nvl((select codename from pyccode where codeid = ''I112'' AND codeno = i.paycl),'' '') IMASPAYCLNAME ,  '+
              '       nvl(        i.payra           ,'' '') PAYRA     ,         '+
              '       nvl((select codename from pyccode where codeid = ''I113'' AND codeno = i.PAYRA),'' '')  PAYRANAME , ' +
              '       nvl(        i.jobgun          ,'' '') JOBGUN    ,         '+
              '       nvl((select codename from pyccode where codeid = ''I115'' AND codeno = i.jobgun),'' '') JOBGUNNAME, ' +
              '       nvl(        i.lschgr          ,'' '') LSCHGR    ,         '+
              '       nvl((select codename from pyccode where codeid = ''I221'' AND codeno = i.LSCHGR),'' '') SCHOOLNAME, ' +
              '       nvl(        i.lschcode        ,'' '') LSCHCODE  ,         '+
              '       nvl(        i.lschnm          ,'' '') LSCHNM    ,         '+
              '       nvl(        i.lmajorcode      ,'' '') LMAJORCODE,         '+
              '       nvl((select codename from pyccode where codeid = ''I225'' AND codeno = i.LMAJORCODE),'' '') MAJORNAME , '+
              '       nvl(        i.empdate         ,'' '') EMPDATE   ,         '+
              '       nvl(        i.sex             ,'' '') SEX       ,         '+
              '       nvl(to_char(i.toeicscore     ),''0'') TOEICSCORE          '+
              'FROM pycdept d,  pimpmas i                                       '+
              'WHERE d.orgnum = i.orgnum and d.deptcode = i.deptcode '+
              '  AND i.empno like ''%''                              '+
              '  AND i.pstate < ''80'' AND i.paycl < ''H11''          ';

            if sSqlDuty <> '' then
                sSqlDuty := ' AND empno IN ( SELECT empno     '+
                            '     FROM (SELECT empno g_empno, jobfield g_jobfield, dutykind g_dutykind, duty g_duty,     '+ // 직무별 기간sum
                            '                  FLOOR(SUM((MONTHS_BETWEEN(TO_DATE(NVL(todutydate,TO_CHAR(sysdate,''YYYYMM'')),''YYYYMM''), '+
                            '                             TO_DATE(frdutydate,''YYYYMM''))+1)*dutytermrate/100)) dutyyymm '+
                            '             FROM pishrmas       '+
                             sTemp +
                            '             GROUP BY EMPNO, JOBFIELD, DUTYKIND, DUTY) g,  '+
                            '          pishrmas a             '+
                            '     WHERE a.empno = g.g_empno   '+
                            '   AND a.jobfield = g.g_jobfield AND a.dutykind = g.g_dutykind AND a.duty = g.g_duty '+
                             sSqlDuty + ' )';
            if sSqlEqip <> '' then
                sSqlEqip := '  AND empno IN (SELECT empno '+ sSqlEqip + ' )';
            if sSqlProg <> '' then
                sSqlProg := '  AND empno IN (SELECT empno '+ sSqlProg + ' )';
            if sSqlLice <> '' then
                sSqlLice := '  AND empno IN (SELECT empno '+ sSqlLice + ' )';

            // Subform의 Envent와 연관있슴 수정시 주의 요함.
            if gsOrderBy <> '' then
                sOrderBy := ' ORDER BY '+gsOrderBy
            else
                sOrderBy := ' ORDER BY deptcode, imaspaycl, empno';

            // 전체 구성
            //gsSqlMain := sSelect + sSqlMain + sSqlDuty + sSqlEqip + sSqlProg + sSqlLice + sOrderBy;
            gsSqlMain := sSelect + sSqlMain + sOrderBy;
            gsSqlDuty := '';
            gsSqlEqip := '';
            gsSqlProg := '';
            gsSqlLice := '';
          end;
      2 : begin
            //sSqlMain
            if sSqlDuty <> '' then
                sSqlDuty := 'SELECT  '+
                            '    nvl(        a.empno         ,'' '') EMPNO        , '+
                            '    nvl(        a.korname       ,'' '') KORNAME      , '+
                            '    nvl(to_char(a.dutyno       ),''0'') DUTYNO       , '+
                            '    nvl(        a.JobField      ,'' '') JOBFIELD     , '+
                            '    nvl(        c.jobfieldname  ,'' '') JOBFIELDNAME , '+
                            '    nvl(        a.dutykind      ,'' '') DUTYKIND     , '+
                            '    nvl(        d.dutykindname  ,'' '') DUTYKINDNAME , '+
                            '    nvl(        a.duty          ,'' '') DUTY         , '+
                            '    nvl(        e.dutyname      ,'' '') DUTYNAME     , '+
                            '    nvl(        a.paycl         ,'' '') PAYCL        , '+
                            '    nvl(        b.payclname     ,'' '') PAYCLNAME    , '+
                            '    nvl(        g.gubun         ,'' '') GUBUN        , '+
                            '    nvl(        a.dutytext      ,'' '') DUTYTEXT     , '+
                            '    nvl(        a.frdutydate    ,'' '') FRDUTYDATE   , '+
                            '    nvl(        a.todutydate    ,'' '') TODUTYDATE   , '+
                            '    nvl(to_char(a.dutyyy       ),''0'') DUTYYY       , '+
                            '    nvl(to_char(a.dutymm       ),''0'') DUTYMM       , '+
                            '    nvl(to_char(a.dutytermrate ),''0'') DUTYTERMRATE , '+
                            '    nvl(to_char(g.dutyyymm     ),''0'') DUTYYYMM     , '+
                            '    nvl(        a.dutylevel     ,'' '') DUTYLEVEL    , '+
                            '    nvl(        f.dutylevelname ,'' '') DUTYLEVELNAME  '+
                            ' FROM                        '+
                            '      (select codeno, codename payclname    from pyccode where codeid = ''I112'') b, '+ // 직급
                            '      (select codeno, codename jobfieldname from pyccode where codeid = ''I116'') c, '+ // 업무분야
                            '      pishrdukind d,         '+
                            '      pishrduty e,           '+
                            '      pishrlevel f,          '+
                            '      (SELECT empno g_empno, ''1'' gubun, jobfield g_jobfield, dutykind g_dutykind, duty g_duty,     '+ // 직무별 기간sum
                            '              FLOOR(SUM((MONTHS_BETWEEN(TO_DATE(NVL(todutydate,TO_CHAR(sysdate,''YYYYMM'')),''YYYYMM''), '+
                            '                         TO_DATE(frdutydate,''YYYYMM''))+1)*dutytermrate/100)) dutyyymm '+
                            '         FROM pishrmas  '+
                             sTemp +
                            '         GROUP BY EMPNO, JOBFIELD, DUTYKIND, DUTY) g,  '+
                            '      pishrmas a             '+
                            ' WHERE a.empno = g.g_empno   '+
                            '   AND a.jobfield = g.g_jobfield AND a.dutykind = g.g_dutykind AND a.duty = g.g_duty '+
                            '   AND a.paycl = b.codeno    '+
                            '   AND a.JobField = c.codeno '+
                            '   AND a.JobField = d.JobField AND a.dutykind = d.dutykind '+
                            '   AND a.JobField = e.JobField AND a.dutykind = e.dutykind AND a.duty = e.duty '+
                            '   AND a.dutylevel = f.dutylevel '+
                             sSqlDuty +
                            ' ORDER BY a.empno, a.frdutydate, a.dutytermrate desc, a.duty ';
            if sSqlEqip <> '' then
                sSqlEqip := 'SELECT  '+
                            ' nvl(        empno           ,'' '') EMPNO        , '+
                            ' nvl(        eqipcode        ,'' '') EQIPCODE     , '+
                            ' nvl(        codename        ,'' '') EQIPNAME       '+
                             sSqlEqip +
                            ' ORDER BY empno, useyy desc, usemm desc, eqipcode ';
            if sSqlProg <> '' then
                sSqlProg := 'SELECT  '+
                            ' nvl(        empno           ,'' '') EMPNO        , '+
                            ' nvl(        progcode        ,'' '') PROGCODE     , '+
                            ' nvl(        codename        ,'' '') PROGNAME       '+
                             sSqlProg +
                            ' ORDER BY empno, useyy desc, usemm desc, progcode ';
            if sSqlLice <> '' then
                sSqlLice := 'SELECT  '+
                            ' nvl(        empno           ,'' '') EMPNO        , '+
                            ' nvl(        lickind         ,'' '') LICKIND      , '+
                            ' nvl(        codename        ,'' '') LICENAME     , '+
                            ' NVL(to_char(licrank        ),'' '') LICRANK      , '+
                            ' NVL(        licgetdate      ,'' '') LICGETDATE   , '+
                            ' NVL(        licalfield      ,'' '') LICALFIELD     '+
                             sSqlLice +
                            ' ORDER BY empno, lickind  ';

            // 전체 구성
            gsSqlMain := '';
            gsSqlDuty := sSqlDuty;
            gsSqlEqip := sSqlEqip;
            gsSqlProg := sSqlProg;
            gsSqlLice := sSqlLice;
          end;
    end; // case end;
end;

function TMainForm2.fnGetData: Integer;
begin
    Result := 0;

    fzGetDataSql(1); // setting grobal var

    with DM.qryMain do
    begin
         CLOSE;
         SQL.Clear;
         SQL.Text := gsSqlMain;
         Open;
         if Bof AND Eof then
         begin
           System.Exit;
         end;
         Result := RecordCount;
    end;
end;

procedure TMainForm2.fzOpenDataSets;
begin
    fzGetDataSql(2); // setting grobal var

    if gsSqlDuty <> '' then
       with DM.qryDuty do
       begin
            CLOSE;
            SQL.Clear;
            SQL.Text := gsSqlDuty;
            sss := SQL.Text;
            Open;
            if Bof AND Eof then
            begin
              System.Exit;
            end;
       end;

    if gsSqlEqip <> '' then
       with DM.qryEqip do
       begin
            CLOSE;
            SQL.Clear;
            SQL.Text := gsSqlEqip;
            Open;
            if Bof AND Eof then
            begin
              System.Exit;
            end;
       end;

    if gsSqlProg <> '' then
       with DM.qryProg do
       begin
            CLOSE;
            SQL.Clear;
            SQL.Text := gsSqlProg;
            Open;
            if Bof AND Eof then
            begin
              System.Exit;
            end;
       end;

    if gsSqlLice <> '' then
       with DM.qryLice do
       begin
            CLOSE;
            SQL.Clear;
            SQL.Text := gsSqlLice;
            Open;
            if Bof AND Eof then
            begin
              System.Exit;
            end;
       end;
end;

procedure TMainForm2.fzOpenDataSets_Det(mGubun: Integer; mEmpnoList: String);
begin
    case mGubun of
      1 : begin

//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//-------------------------------------------------------------------------------
             with DM.qryMain do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('SELECT '+
                        '  nvl(  i.empno      ,'' '') EMPNO     ,    '+ #13+
                        '  nvl(  i.korname    ,'' '') KORNAME   ,    '+ #13+
                        '  nvl(  i.orgnum     ,'' '') ORGNUM    ,    '+ #13+
                        '  nvl(  i.deptcode   ,'' '') DEPTCODE  ,    '+ #13+
                        '  nvl(  d.deptname   ,'' '') DEPTNAME  ,    '+ #13+
                        '  nvl(  i.paycl      ,'' '') IMASPAYCL     ,'+ #13+
                        '  nvl(  cl.codename  ,'' '') IMASPAYCLNAME ,'+ #13+
                        '  nvl(  i.payra      ,'' '') PAYRA     ,    '+ #13+
                        '  nvl(  ra.codename  ,'' '') PAYRANAME ,    '+ #13+
                        '  nvl(  i.jobgun     ,'' '') JOBGUN    ,    '+ #13+
                        '  nvl(  jg.codename  ,'' '') JOBGUNNAME,    '+ #13+
                        '  nvl(  i.lschgr     ,'' '') LSCHGR    ,    '+ #13+
                        '  nvl(  sc.codename  ,'' '') SCHOOLNAME,    '+ #13+
                        '  nvl(  i.lschcode   ,'' '') LSCHCODE  ,    '+ #13+
                        '  nvl(  i.lschnm     ,'' '') LSCHNM    ,    '+ #13+
                        '  nvl(  i.lmajorcode ,'' '') LMAJORCODE,    '+ #13+
                        '  nvl(  mj.codename  ,'' '') MAJORNAME ,    '+ #13+
                        '  nvl(  i.empdate    ,'' '') EMPDATE   ,    '+ #13+
                        '  nvl(  i.sex        ,'' '') SEX       ,    '+ #13+
                        '  nvl(to_char(i.toeicscore     ),''0'') TOEICSCORE          '+
                        'FROM pyccode cl, pyccode ra, pyccode jg, pyccode sc, pyccode mj, '+
                        '     pycdept d,  pimpmas i                                       '+
                        'WHERE cl.codeid = ''I112'' AND cl.codeno = i.paycl    '+
                        '  AND ra.codeid = ''I113'' AND ra.codeno = i.payra    '+
                        '  AND jg.codeid = ''I115'' AND jg.codeno = i.jobgun   '+
                        '  AND sc.codeid (+)= ''I221'' AND sc.codeno (+)= i.lschgr     '+
                        '  AND mj.codeid (+)= ''I225'' AND mj.codeno (+)= i.lmajorcode '+
                        '  AND d.orgnum = i.orgnum and d.deptcode = i.deptcode '+ #13+
                        '  AND i.empno IN ('+mEmpnoList+')         '+
                        'ORDER BY deptname, paycl, empno ');
                Open;
                if Bof AND Eof then
                begin
                  Exit;
                end;
             end;
          end;

      2 : begin
             with DM.qryDuty do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('SELECT  '+
                        '    nvl(        a.empno         ,'' '') EMPNO        , '+
                        '    nvl(        a.korname       ,'' '') KORNAME      , '+
                        '    nvl(to_char(a.dutyno       ),''0'') DUTYNO       , '+
                        '    nvl(        a.JobField      ,'' '') JOBFIELD     , '+
                        '    nvl(        c.jobfieldname  ,'' '') JOBFIELDNAME , '+
                        '    nvl(        a.dutykind      ,'' '') DUTYKIND     , '+
                        '    nvl(        d.dutykindname  ,'' '') DUTYKINDNAME , '+
                        '    nvl(        a.duty          ,'' '') DUTY         , '+
                        '    nvl(        e.dutyname      ,'' '') DUTYNAME     , '+
                        '    nvl(        a.paycl         ,'' '') PAYCL        , '+
                        '    nvl(        b.payclname     ,'' '') PAYCLNAME    , '+
                        '    nvl(        g.gubun         ,'' '') GUBUN        , '+
                        '    nvl(        g.dutytext      ,'' '') DUTYTEXT     , '+
                        '    nvl(        a.frdutydate    ,'' '') FRDUTYDATE   , '+
                        '    nvl(        a.todutydate    ,'' '') TODUTYDATE   , '+
                        '    nvl(to_char(a.dutyyy       ),''0'') DUTYYY       , '+
                        '    nvl(to_char(a.dutymm       ),''0'') DUTYMM       , '+
                        '    nvl(to_char(a.dutytermrate ),''0'') DUTYTERMRATE , '+
                        '    FLOOR((MONTHS_BETWEEN(TO_DATE(NVL(todutydate,TO_CHAR(sysdate,''YYYYMM'')),''YYYYMM''),     '+
                        '                         TO_DATE(frdutydate,''YYYYMM''))+1) * nvl(a.dutytermrate/100,0)) dutyyymm, '+
                        '    nvl(        a.dutylevel     ,'' '') dutylevel    , '+
                        '    nvl(        f.dutylevelname ,'' '') dutylevelname  '+
                        ' FROM                        '+
                        '      (SELECT codeno, codename payclname    FROM pyccode WHERE codeid = ''I112'') b, '+ // 직급
                        '      (SELECT codeno, codename jobfieldname FROM pyccode WHERE codeid = ''I116'') c, '+ // 업무분야
                        '      pishrdukind d,             '+
                        '      pishrduty e,               '+
                        '      pishrlevel f,              '+
                        '      (SELECT empno, dutyno, ''1'' gubun, dutytext    dutytext FROM pishrmas '+
                        '       WHERE  empno IN ('+mEmpnoList+')      '+
                        '       UNION ALL                 '+
                        '       SELECT empno, dutyno, ''2'' gubun, subdutytext dutytext FROM pishrsub '+
                        '       WHERE  empno IN ('+mEmpnoList+') ) g, '+
                        '      pishrmas a                 '+
                        ' WHERE a.empno = g.empno AND a.dutyno = g.dutyno '+
                        '   AND a.paycl = b.codeno        '+
                        '   AND a.JobField = c.codeno     '+
                        '   AND a.JobField = d.JobField AND a.dutykind = d.dutykind '+
                        '   AND a.JobField = e.JobField AND a.dutykind = e.dutykind AND a.duty = e.duty '+
                        '   AND a.dutylevel = f.dutylevel '+
                        '   AND a.empno IN ('+mEmpnoList+')           '+
                        ' ORDER BY a.empno, a.frdutydate, a.dutytermrate desc, a.duty ');

                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;

          end;

      3 : begin
             with DM.qryEqip do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('SELECT  '+
                        '    nvl(        empno           ,'' '') EMPNO        , '+
                        '    nvl(        d.codeno        ,'' '') SUBID        , '+
                        '    nvl(        d.codename      ,'' '') SUBNAME      , '+
                        '    nvl(        eqipcode        ,'' '') EQIPCODE     , '+
                        '    nvl(        c.codename      ,'' '') EQIPNAME     , '+
                        '    nvl(to_char(skillrate      ),'' '') SKILLRATE    , '+
                        '    nvl(to_char(useyy          ),'' '') USEYY        , '+
                        '    nvl(to_char(usemm          ),'' '') USEMM          '+
                        ' FROM           '+
                        '      (select codeno, codename from pishrcode          '+
                        '       where codeid = ''I711'' and codesuper = ''1'' and codemainon = ''1'') c, '+
                        '      (select codeno, codename from pishrcode          '+
                        '       where codeid = ''I711'' and codesuper = ''0'' and codemainon = ''1'') d, '+
                        '      pishreqip '+
                        ' WHERE eqipcode = c.codeno                             '+
                        '   AND d.codeno = substr(c.codeno,1,length(d.codeno))  '+
                        '   AND empno IN ('+mEmpnoList+')                       '+
                        ' ORDER BY empno, useyy desc, usemm desc, eqipcode ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;

          end;

      4 : begin
             with DM.qryProg do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('SELECT  '+
                        '    nvl(        empno           ,'' '') EMPNO        , '+
                        '    nvl(        d.codeno        ,'' '') SUBID        , '+
                        '    nvl(        d.codename      ,'' '') SUBNAME      , '+
                        '    nvl(        progcode        ,'' '') PROGCODE     , '+
                        '    nvl(        c.codename      ,'' '') PROGNAME     , '+
                        '    nvl(to_char(skillrate      ),'' '') SKILLRATE    , '+
                        '    nvl(to_char(useyy          ),'' '') USEYY        , '+
                        '    nvl(to_char(usemm          ),'' '') USEMM          '+
                        ' FROM            '+
                        '      (select codeno, codename from pishrcode          '+
                        '       where codeid = ''I713'' and codesuper = ''1'' and codemainon = ''1'') c, '+
                        '      (select codeno, codename from pishrcode          '+
                        '       where codeid = ''I713'' and codesuper = ''0'' and codemainon = ''1'') d, '+
                        '      pishrprog  '+
                        ' WHERE progcode = c.codeno                             '+
                        '   AND d.codeno = substr(c.codeno,1,length(d.codeno))  '+
                        '   AND empno IN ('+mEmpnoList+')                               '+
                        ' ORDER BY empno, useyy desc, usemm desc, progcode ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;

      5 : begin  // 자격사항
             with DM.qryLice do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('select                                               '+
                        ' nvl(        empno           ,'' '') EMPNO        , '+
                        ' nvl(        lickind         ,'' '') LICKIND      , '+
                        ' nvl(        codename        ,'' '') LICENAME     , '+
                        ' NVL(to_char(licrank        ),'' '') LICRANK      , '+
                        ' NVL(        licgetdate      ,'' '') LICGETDATE   , '+
                        ' NVL(        licalfield      ,'' '') LICALFIELD     '+
                        'from pyccode c, pimlice L                          '+
                        'where c.codeid = ''I231'' and c.codeno = L.lickind '+
                        '   AND empno IN ('+mEmpnoList+')                   '+
                        ' ORDER BY empno, lickind  ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;

      6 : begin // 교육사항
             with DM.qryEDU do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('select NVL(e.empno     , '' '') EMPNO     ,     '+
                        '       NVL(e.currcode  , '' '') CURRCODE  ,     '+
                        '       NVL(c.currname  , '' '') CURRNAME  ,     '+
                        '       NVL(e.pointcode , '' '') POINTCODE ,     '+
                        '       NVL(p.pointname , '' '') POINTNAME ,     '+
                        '       NVL(e.edufrdate , '' '') EDUFRDATE ,     '+
                        '       NVL(e.edutodate , '' '') EDUTODATE       '+
                        'from peduhis e, peducurr c, pedupoint p, pishrvari v   '+
                        'where v.gubun = ''10'' and v.sgubun = ''0001''         '+
                        '  and e.currcode = c.currcode                          '+
                        '  and e.pointcode = p.pointcode                        '+
                        '  and (e.currcode between NVL(v.value1,''0'') and NVL(v.value2, ''0'')      '+
                        '       or e.currcode between NVL(v.value3,''0'') and NVL(v.value4, ''0'')   '+
                        '       or e.currcode between NVL(v.value5,''0'') and NVL(v.value6, ''0'')   '+
                        '       or e.currcode between NVL(v.value7,''0'') and NVL(v.value8, ''0'')   '+
                        '       or e.currcode between NVL(v.value9,''0'') and NVL(v.value10,''0''))  '+
                        '   AND e.empno IN ('+mEmpnoList+')                             '+
                        ' ORDER BY e.empno, e.edufrdate desc, e.currcode        ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;

      7 : begin // 학력사항
             with DM.qrySCH do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('select NVL(empno         , '' '') EMPNO     ,   '+
                        '       NVL(schgr         , '' '') SCHGR     ,   '+
                        '       NVL(ch.codename   , '' '') SCHGRNAME ,   '+
                        '       NVL(schcode       , '' '') SCHCODE   ,   '+
                        '       NVL(schnm         , '' '') SCHNM     ,   '+
                        '       NVL(majorcode     , '' '') MAJORCODE ,   '+
                        '       NVL(mj.codename   , '' '') MAJORNAME ,   '+
                        '       NVL(schfrym       , '' '') SCHFRYM   ,   '+
                        '       NVL(schtoym       , '' '') SCHTOYM       '+
                        'from pyccode ch, pyccode mj, pimscho c          '+
                        'where ch.codeid (+) = ''I221'' and ch.codeno (+) = schgr     '+
                        '  and mj.codeid (+) = ''I225'' and mj.codeno (+) = majorcode '+
                        '   AND empno IN ('+mEmpnoList+')                             '+
                        ' ORDER BY empno, schfrym desc, schgr desc       ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;

      8 : begin // 경력사항
             with DM.qryCARR do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('select NVL(empno         , '' '') EMPNO     ,   '+
                        '       NVL(carplace      , '' '') CARPLACE  ,  '+
                        '       NVL(carjobnm      , '' '') CARJOBNM  ,  '+
                        '       NVL(to_char(carduyy), '' '') CARDUYY   ,  '+
                        '       NVL(to_char(cardumm), '' '') CARDUMM   ,  '+
                        '       NVL(to_char(cardudd), '' '') CARDUDD   ,  '+
                        '       NVL(carfrdate     , '' '') CARFRDATE ,  '+
                        '       NVL(cartodate     , '' '') CARTODATE    '+
                        'from pimcarr                                   '+
                        'WHERE empno IN ('+mEmpnoList+')                '+
                        'ORDER BY empno, carfrdate desc                 ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;
      9 : begin
             with DM.qryETC do
             begin
                CLOSE;
                SQL.Clear;
                SQL.Add('select NVL(empno         , '' '') EMPNO     ,   '+
                        '       NVL(spectext      , '' '') SPECTEXT      '+
                        'from pishrspec                                  '+
                        'WHERE empno IN ('+mEmpnoList+')                 '+
                        'ORDER BY empno                                  ');
                Open;
                if Bof AND Eof then
                begin
                  System.Exit;
                end;
             end;
          end;
    end;

end;

procedure TMainForm2.BB_PreViewClick(Sender: TObject);
var
//  i, k : integer;           //2001.09.28 shm
  str, helpstr : string;      //2001.09.28 shm
  iRecordCount: Integer;
begin
  {입력사번순일경우}          //2001.09.28 shm
  if Gu1 = 4 then begin
     PageCnt := 0; k := 0;
     for i := 1 to 50 do
         if pit1040c10Form.empnostr[i] <> '' then  inc(PageCnt);

     for i := 1 to pageCnt do begin
      if  i = 1 then
           Q_empnostr :=  pit1040c10Form.empnostr[i]
        else
           Q_empnostr :=  Q_empnostr +'''' + ',' + '''' +pit1040c10Form.empnostr[i];
//           Q_empnostr := pit1040c10Form.empnostr[i] +'''' + ',' + '''' + Q_empnostr;
      end;
      iRecordCount := fnGetData;
  end;

  {화일사번순일 경우}         //2001.10.08 shm
  if Gu1 = 3 then begin
     if FileExists(Filenm.Text) = False then   begin
        MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
        Filenm.SetFocus; System.Exit;
     end;
     AssignFile(eFile,Filenm.Text); System.ReSet(eFile);
     pagecnt := 0;
     while not EOF(efile) do begin
       Readln(eFile,str); inc(pagecnt);
       if pagecnt = 1 then
           Q_empnostr :=  str
       else
           Q_empnostr :=  Q_empnostr +'''' + ',' + '''' +str;

     end; // 총읽은갯수를 파악한다..
     system.Close(efile);
  end;

     Main.St_Help.Panels[0].Text := '작업중입니다....';
  if (Gu1 <> 3) or (gu1 <> 4) then begin
      iRecordCount := fnGetData;
  end;
      Main.St_Help.Panels[0].Text := '';

    if iRecordCount < 1 then
    begin
        Messagedlg('검색결과 요청한 조건에 맞는 자료가 없습니다.',mtInformation,[mbOK],0);
        System.Exit;
    end
    else
    begin
        if MessageDlg(' 검색결과 요청한 조건에 맞는 사원수가 ['+inttostr(iRecordCount)+']명 입니다. '+ #13#13+
                      ' 계속 진행하시겠습니까?? ',
                      mtInformation,[mbYes, mbNo],0) = mrNo then begin
                      gu1 := 0;       //2001.10.08 shm
                      System.Exit;      end;
    end;

  TRY

    //Application.CreateForm(TSubForm, SubForm);
    SubForm := TSubForm.Create(self);
    SubForm.giRecordCount := iRecordCount;
    SubForm.giWhereFrom   := 2;
    SubForm.ShowModal;

  FINALLY
    SubForm.Free;
  END;

    Main.St_Help.Panels[0].Text := '작업이 완료되었습니다 !!';
//2001.10.08 shm
    gu1 := 0;
    E_Empnofr.Text            := '';     E_Empnoto.Text            := '';
    P_Kornamefr.TextCaption   := '';     P_Kornameto.TextCaption   := '';
    E_Deptcodefr.Text         := '';     E_Deptcodeto.Text         := '';
    P_Deptnamefr.TextCaption  := '';     P_Deptnameto.TextCaption  := '';
    E_payclfr.Text            := '';     E_payclto.Text            := '';
    P_payclnamefr.TextCaption := '';     P_payclnameto.TextCaption := '';
//    E_Empnofr.SetFocus;
end;

procedure TMainForm2.SB_eqipprogliceClick(Sender: TObject);
begin
{
  TRY
    DutyForm := TDutyForm.Create(Self);
    if TComponent(Sender).Tag = 2 then
    begin
       DutyForm.gsCodeid := 'I711';
       DutyForm.SG_InOut := SG_Eqip;
    end
    else if TComponent(Sender).Tag = 3 then
    begin
       DutyForm.gsCodeid := 'I713';
       DutyForm.SG_InOut := SG_Prog;
    end
    else if TComponent(Sender).Tag = 4 then
    begin
       DutyForm.gsCodeid := 'I231';
       DutyForm.SG_InOut := SG_lice;
    end
    else if TComponent(Sender).Tag = 6 then
    begin
       DutyForm.gsCodeid := 'I225';
       DutyForm.SG_InOut := SG_Major;
    end;
    DutyForm.ShowModal;

  FINALLY
    DutyForm.Free;
  END;
}
end;

procedure TMainForm2.E_EditlKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
    begin
        case TPePanelEdit(Sender).Tag of
          1 : P_Kornamefr.TextCaption   := '';
          2 : P_Kornameto.TextCaption   := '';
          3 : P_DeptNamefr.TextCaption  := '';
          4 : P_DeptNameto.TextCaption  := '';
          5 : P_Payclnamefr.TextCaption := '';
          6 : P_Payclnameto.TextCaption := '';
        end;
    end;
end;

procedure TMainForm2.E_EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    giCall := 0;
    if (Key = VK_RETURN) then
        giCall := 1
    else if (Key = VK_F1) then
        giCall := 2;
{
        case TPePanelEdit(Sender).Tag of
          1 : E_EditExit(E_Empnofr);
          2 : E_EditExit(E_Empnoto);
          3 : E_EditExit(E_Deptcodefr);
          4 : E_EditExit(E_Deptcodeto);
          5 : E_EditExit(E_payclfr);
          6 : E_EditExit(E_payclto);
        end;
}
    if giCall > 0 then
    begin
        case TPePanelEdit(Sender).Tag of
          1 : fzGetCode('EMP',  '[사원열람]', E_Empnofr, P_Kornamefr);
          2 : fzGetCode('EMP',  '[사원열람]', E_Empnoto, P_Kornameto);
          3 : fzGetCode('DEPT', '[부서열람]', E_Deptcodefr, P_Deptnamefr);
          4 : fzGetCode('DEPT', '[부서열람]', E_Deptcodeto, P_Deptnameto);
          5 : fzGetCode('I112', '[BAND열람]', E_payclfr, P_Payclnamefr);
          6 : fzGetCode('I112', '[BAND열람]', E_payclto, P_Payclnameto);
        end;
    end;
end;

procedure TMainForm2.E_EditDblClick(Sender: TObject);
var
  iKey: Word;
  tShift: TShiftState;
begin
    iKey := VK_F1;
    tShift := [];
    E_EditKeyDown(Sender, iKey, tShift);
end;

procedure TMainForm2.E_EditExit(Sender: TObject);
begin
{
    case TPePanelEdit(Sender).Tag of
      1 :   fzGetCode('EMP',  '[사원열람]', E_Empnofr, P_Kornamefr);
      2 :   fzGetCode('EMP',  '[사원열람]', E_Empnoto, P_Kornameto);
      3 :   fzGetCode('DEPT', '[부서열람]', E_Deptcodefr, P_Deptnamefr);
      4 :   fzGetCode('DEPT', '[부서열람]', E_Deptcodeto, P_Deptnameto);
      5 :   fzGetCode('I112', '[BAND열람]', E_payclfr, P_Payclnamefr);
      6 :   fzGetCode('I112', '[BAND열람]', E_payclto, P_Payclnameto);
    end;
}
end;

procedure TMainForm2.fzGetCode(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
var
  sCodeno, SCodename: String;
  i: Integer;
begin
    if AEdit.Text = '' then
    begin
        sCodeno   := '%';
        SCodename := '%';
    end
    else
    begin
        sCodeno   := '%'+AEdit.Text+'%';
        SCodename := '%'+AEdit.Text+'%';
    end;

    with DM.qryCODE do
    begin
      CLOSE;
      SQL.Clear;
      if ACodeid = 'EMP' then
        SQL.Add('SELECT  empno codeno, korname codename FROM  pimpmas     '+
                'WHERE pstate < ''80''                                    '+
                '  AND (UPPER(empno)  LIKE UPPER('''+sCodeno+''')          '+
                '   OR UPPER(korname) LIKE UPPER('''+sCodename+'''))   ')
      else if ACodeid = 'DEPT' then
        SQL.Add('SELECT  deptcode codeno, deptname codename FROM  pycdept '+
                'WHERE orgnum = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'') '+
                '  AND existon = ''1'' AND chanmode <> ''3''              '+
                '  AND (UPPER(deptcode) LIKE UPPER('''+sCodeno+''')       '+
                '   OR  UPPER(deptname) LIKE UPPER('''+sCodename+'''))  ')
      else //if ACodeid = 'I112' then
        SQL.Add('SELECT  codeno, codename FROM  pyccode                   '+
                'WHERE codeid = '''+ACodeid+''' AND codeno < ''H11''       '+
                '  AND (UPPER(codename) LIKE UPPER('''+sCodename+''')     '+
                '   OR  UPPER(codeno)   LIKE UPPER('''+sCodeno+'''))      ');
      Open;
      //if Bof AND Eof then
      //  System.Exit;

      i := 0;
      sCodeno   := '';
      SCodename := '';
      while (not EOF) and (i < 2) do
      begin
          sCodeno   := DM.qryCODE.FieldByName('CODENO').AsString;
          SCodename := DM.qryCODE.FieldByName('CODENAME').AsString;
          Next;
          Inc(i);
      end;
      Close;

      if (giCall = 1) and (i = 1) then
      begin
          AEdit.Text         := sCodeno;
          ALabel.TextCaption := SCodename ;
      end
      else //if (giCall = 2) then
          fzCallCodeForm(ACodeid, ACodeIdname, AEdit, ALabel);

      if sCodeno = '' then
        AEdit.SetFocus;
    end;
    giCall := 0;
end;

procedure TMainForm2.fzCallCodeForm(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
begin
  TRY
    PayClForm := TPayClForm.Create(self);
    PayClForm.Caption  := ACodeIdname;
    PayClForm.gsCodeID := ACodeid;
    PayClForm.E_PayCl.Text := AEdit.Text;
    PayClForm.ShowModal;

    if PayClForm.gbSelected then
    begin
        ALabel.TextCaption := PayClForm.CodeName;
        AEdit.Text         := PayClForm.Codeno;
    end
    else
        AEdit.Setfocus;

  FINALLY
    PayClForm.Free;
  END;
end;

procedure TMainForm2.B_ClearClick(Sender: TObject);
var
  i: Integer;
begin
    Main.St_Help.Panels[0].Text := '검색조건 Clear중...';
    Application.ProcessMessages;
    for i := 0 to ComponentCount -1 do
    begin
        if TControl(Components[i]).Tag > 0 then
        begin
            if Components[i] is TPePanelEdit then
                TPePanelEdit(Components[i]).Text := '';
            if Components[i] is TPeJeonLabel then
                TPeJeonLabel(Components[i]).TextCaption := '';
            if Components[i] is TPeJeonPanelComboBox then
                TPeJeonPanelComboBox(Components[i]).ItemIndex := 0;
            if Components[i] is TStringGrid then
                fzSGInitialRow(TStringGrid(Components[i]));
        end;
    end;
    Main.St_Help.Panels[0].Text := '';
    Application.ProcessMessages;
end;

procedure TMainForm2.fileselClick(Sender: TObject); //2001.10.08 shm
begin
  OpenDialog1.Execute;
  Filenm.Text := OpenDialog1.FileName;
  Filenm.SetFocus;
end;

procedure TMainForm2.G_22Click(Sender: TObject);     //2001.10.08 shm
var
  i : integer;
begin
  im3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');

  case TPanel(Sender).HelpContext of
   3 : im3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   4 : begin
       im4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
       Try
         for i := 1 to 50 do pit1040c10Form.empnostr[i] := '';
         pit1040c10Form := Tpit1040c10Form.Create(Self);
         pit1040c10Form.ShowModal;
       Finally
         pit1040c10Form.Free;
       End;
       end;
  end;

  gu1 := TPanel(Sender).HelpContext;

end;

//2001.10.08 shm
function TMainForm2.MyPasString(const S, Delimiters : string; Num : integer) : string;
var
  I, Len, Count : Integer;
begin
  Count := 0;
  Len := Length(S);
  I := 1;

  Result := '';

  while I <= Len do
  begin
    Result := Result + S[I];
    if Pos(Delimiters, Copy(s, i, 50000)) = 1 then
    begin
      Inc(Count);
      if Count = Num then
      begin
        Result := Copy(Result, 1, Length(Result) - 1);
        Break;
      end
      else
      begin
        Result := '';
        I := I + Length(Delimiters) - 1;
      end;
    end;
    I := I + 1;
  end;

  if (Num < 1) or (Num > Count + 1) then
    Result := '';

  Result := Trim(Result);
end;


end.

