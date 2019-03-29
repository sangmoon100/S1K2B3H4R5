unit PIT1040C1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, peempnobtnedit, Db, DBTables, Grids, Mask, StdCtrls,
  peextcombo, PeJeonLabel, pebtnedit, pecodebtnedit, pedeptbtnedit, PeJeonBtnDateEdit,
  peNumedit, peoutlookbtn, pegradpanl,  Pass, PeDBUtil, ComCtrls ;

type
  TMainForm = class(TForm)
    Panel10: TPanel;
    Panel15: TPanel;
    Panel12: TPanel;
    Panel17: TPanel;
    Panel20: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel29: TPanel;
    Panel32: TPanel;
    Panel35: TPanel;
    Panel38: TPanel;
    SG_Duty: TStringGrid;
    Panel5: TPanel;
    P_payclnamefr: TPeJeonLabel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Cb_sex: TPeJeonPanelComboBox;
    E_payclfr: TPePanelEdit;
    P_payclnameto: TPeJeonLabel;
    E_payclto: TPePanelEdit;
    P_dutylevelfr: TPeJeonLabel;
    E_dutylevelfr: TPePanelEdit;
    P_dutylevelto: TPeJeonLabel;
    E_dutylevelto: TPePanelEdit;
    E_dutyyyfr: TPePanelEdit;
    E_dutyyyto: TPePanelEdit;
    P_lschgrnamefr: TPeJeonLabel;
    E_lschgrfr: TPePanelEdit;
    P_lschgrnameto: TPeJeonLabel;
    E_lschgrto: TPePanelEdit;
    E_toeicfr: TPePanelEdit;
    E_toeicto: TPePanelEdit;
    P_jobplacenamefr: TPeJeonLabel;
    E_jobplacefr: TPePanelEdit;
    P_jobplacenameto: TPeJeonLabel;
    E_jobplaceto: TPePanelEdit;
    SB_eqip: TSpeedButton;
    SB_Prog: TSpeedButton;
    SB_Lice: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    BB_PreView: TPeJeonOutLookBtn;
    SG_Eqip: TStringGrid;
    SG_Prog: TStringGrid;
    SG_Lice: TStringGrid;
    E_EUseYY: TPePanelEdit;
    E_PUseYY: TPePanelEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    B_Clear: TPeJeonOutLookBtn;
    Label14: TLabel;
    E_EUseMM: TPePanelEdit;
    Label15: TLabel;
    E_PUseMM: TPePanelEdit;
    Label16: TLabel;
    Label17: TLabel;
    SG_Major: TStringGrid;
    SB_Major: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SB_eqipprogliceClick(Sender: TObject);
    procedure SG_DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_DutyDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BB_PreViewClick(Sender: TObject);
    procedure E_EditExit(Sender: TObject);
    procedure E_EditDblClick(Sender: TObject);
    procedure E_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_dutylevelExit(Sender: TObject);
    procedure E_dutylevelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_EditlKeyPress(Sender: TObject; var Key: Char);
    procedure E_dutylevelKeyPress(Sender: TObject; var Key: Char);
    procedure SG_DutyDblClick(Sender: TObject);
    procedure SG_EqipProgLiceDblClick(Sender: TObject);
    procedure SG_EqipProgLiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_DutyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_EqipEnter(Sender: TObject);
    procedure SG_EqipExit(Sender: TObject);
    procedure E_dutylevelDblClick(Sender: TObject);
    procedure B_ClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Start: Boolean;
    giCall: Integer;

    procedure fzAutoSizeGrid(Grid: TstringGrid);
    procedure fzInitialForm;
    function  fnGetData: Integer;
    function  fnGetRowSG(AGrid: TStringGrid; AGubun: Integer): String;
    procedure fzCallCodeForm(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzGetCode(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzGetDutyLevel(AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzCalldutyevel(AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
    procedure fzGetDataSql(mGubun: Integer);
    procedure fzOpenDataSets;
    procedure fzCallDutyForm;
    procedure fzOpenDataSets_Det(mGubun: Integer; mEmpnoList: String);
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  umain, PIT1040C0, PIT1040C3, PIT1040C4, PIT1040C6, PIT1040C7,
  UpitLib, PIT1040C5, PIT1040C2;

////////////////////////////////////////////////////////////////////////////////
// UserDefine
////////////////////////////////////////////////////////////////////////////////
procedure TMainForm.fzAutoSizeGrid(Grid: TstringGrid);
var
  i, j, iTemp, iMax: Integer;
begin
    iMax := 0;
    for j := 0 to (Grid.ColCount-1) do
    begin
        for i := 0 to (Grid.RowCount-1) do
        begin
            iTemp := Grid.Canvas.TextWidth(Grid.Cells[j,i]);
            if iTemp > iMax then iMax := iTemp;
        end;

        if iMax < Grid.DefaultColWidth then
          Grid.Colwidths[j] := Grid.DefaultColWidth;
    end;
end;                 

////////////////////////////////////////////////////////////////////////////////
// Event
////////////////////////////////////////////////////////////////////////////////
procedure TMainForm.FormCreate(Sender: TObject);
begin
    Start := True;
end;

procedure TMainForm.fzInitialForm;
begin
    with SG_Duty do
    begin
        RowCount := 2;
        ColCount := 6;
        Cols[0].Text := '직군코드'; ColWidths[0] := -1;
        Cols[1].Text := '직군명';
        Cols[2].Text := '직종코드'; ColWidths[2] := -1;
        Cols[3].Text := '직종명';
        Cols[4].Text := '직무코드'; ColWidths[4] := -1;
        Cols[5].Text := '직무명';
    end;

    with SG_Eqip do
    begin
        RowCount := 2;
        ColCount := 6;
        Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
        Cols[1].Text := '대분류(기  능)';
        Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
        Cols[3].Text := '중분류(장비명)';
        Cols[4].Text := '세분류코드';       ColWidths[4] := -1;
        Cols[5].Text := '세분류(제품명)';
    end;

    with SG_Prog do
    begin
        RowCount := 2;
        ColCount := 6;
        Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
        Cols[1].Text := '프로그램(대분류)';
        Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
        Cols[3].Text := '프로그램(중분류)';
        Cols[4].Text := '세분류코드';       ColWidths[4] := -1;
        Cols[5].Text := '프로그램(세분류)';
    end;

    with SG_Lice do
    begin
        RowCount := 2;
        ColCount := 4;
        Cols[0].Text := '자격증 대분류코드';       ColWidths[0] := -1;
        Cols[1].Text := '자격증(대분류)';
        Cols[2].Text := '자격증 중분류코드';       ColWidths[2] := -1;
        Cols[3].Text := '자격증(세분류)';
    end;

    with SG_Major do
    begin
        RowCount := 2;
        ColCount := 4;
        Cols[0].Text := '전 공 대분류코드';       ColWidths[0] := -1;
        Cols[1].Text := '전 공(대분류)';
        Cols[2].Text := '전 공 중분류코드';       ColWidths[2] := -1;
        Cols[3].Text := '전 공(세분류)';
    end;
end;

procedure TMainForm.SG_DutyDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
       if (Sender as TStringGrid).DefaultDrawing = True then
       begin
           if (ARow = 0) then
           begin
               Brush.Color := $00C1EBEF;
               Font.Color  := clBlack;
           end
           else
           begin
               Brush.Color := clNavy;
               Font.Color  := clWhite;
           end;
       end
       else
       begin
           if (ARow = 0) then
            //if gdSelected in State then
           begin
               Brush.Color := $00C1EBEF;
               Font.Color  := clBlack;
           end
           else
           begin
               Brush.Color := clWhite;
               Font.Color  := clBlack;
           end;
       end;

       if (ARow = 0) then
       begin
           Loc := DT_CENTER or DT_WORDBREAK;
           Font.Style := [fsBold];
       end
       else
       begin
           Loc := DT_LEFT or DT_WORDBREAK;
           Font.Style := [];
       end;

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TMainForm.SG_DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if gdSelected in State then
        begin
            //Brush.Color := $00C4E1E1;
            if (ACol mod 2) = 0 then
                Brush.Color := $00D1D1D1
            else
                Brush.Color := $00E1E1E1;

            Font.Color  := clBlack;
        end;

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;
        Loc := DT_LEFT or DT_WORDBREAK;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TMainForm.fzCallDutyForm;
begin
  TRY
    DutyForm := TDutyForm.Create(Self);
    DutyForm.gsCodeid := 'I116';
    DutyForm.SG_InOut := SG_Duty;
    DutyForm.ShowModal;

  FINALLY
    DutyForm.Free;
  END;
end;

function TMainForm.fnGetRowSG(AGrid: TStringGrid; AGubun: Integer): String;
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
procedure TMainForm.fzGetDataSql(mGubun: Integer);
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

    // 최종직급
    if (trim(E_payclfr.Text) <> '') or (trim(E_payclto.Text) <> '') then
    begin
        sSqlMain := sSqlMain +
                  '  AND i.paycl BETWEEN NVL('''+E_payclto.Text+''',''0'') AND NVL('''+E_payclfr.Text+''',''zz'') ';
    end;

    // 최종학력
    if (trim(E_lschgrfr.Text) <> '') or (trim(E_lschgrto.Text) <> '') then
    begin
        sSqlMain := sSqlMain +
                    '  AND i.lschgr BETWEEN NVL('''+E_lschgrfr.Text+''',''0'') AND NVL('''+E_lschgrto.Text+''',''zz'')';
    end;

    // 최종전공
    if (trim(SG_Major.Cells[0,1]) <> '') then
    begin
        sSqlMain := sSqlMain +
                   '  AND i.lmajorcode IN ('+fnGetRowSG(SG_Major,6)+') ';
    end;

    // 외국어
    if (trim(E_toeicfr.Text) <> '') or (trim(E_toeicto.Text) <> '') then
    begin
        sSqlMain := sSqlMain +
                    '  AND i.toeicscore BETWEEN '+inttostr(StrToIntDef(E_toeicfr.Text,0))+
                    '  AND '+inttostr(StrToIntDef(E_toeicto.Text,1000))+'  ';
    end;

    // 성별
    if Cb_sex.ItemIndex > 0 then // 0:전체,1:남,2:여
    begin
        sSqlMain := sSqlMain +
                    '  AND i.sex LIKE DECODE('''+inttostr(Cb_sex.ItemIndex)+''',''1'',''M'',''2'',''F'') ';
    end;

    // 근무지
    // if (trim(E_jobplacefr.Text) = '') or (trim(E_jobplaceto.Text) = '') then
    // begin
    //     sSqlMain := sSqlMain +
    //               Format('  AND i.jobplace BETWEEN NVL(''%s'',''0'') AND NVL(''%s'',''zz'')',
    //                      [E_jobplacefr.Text,E_jobplacto.Text]);
    // end;

    //////////////////////////////// Duty
    // 직군별 직무
    if (trim(SG_Duty.Cells[0,1]) <> '') then
    begin
        sSqlDuty := sSqlDuty +
                      '  AND (a.jobfield, a.dutykind, a.duty) IN ('+fnGetRowSG(SG_Duty,1)+') ';

        sTemp    := sTemp    +
                      ' WHERE (jobfield, dutykind, duty) IN ('+fnGetRowSG(SG_Duty,1)+') ';
    end;

    // 직무수준
    if (trim(E_dutylevelfr.Text) <> '') or (trim(E_dutylevelto.Text) <> '') then
    begin
        sSqlDuty := sSqlDuty +
                      '  AND a.dutylevel BETWEEN NVL('''+E_dutylevelfr.Text+''',''0'') ' +
                      '  AND NVL('''+E_dutylevelto.Text+''',''zz'') ';
    end;

    // 직무종사년수
    if (trim(E_dutyyyfr.Text) <> '') or (trim(E_dutyyyto.Text) <> '') then
    begin
        sSqlDuty := sSqlDuty +
                      '  AND dutyyymm BETWEEN '+inttostr(StrToIntDef(E_dutyyyfr.Text,0)*12) +
                      '  AND '+inttostr(StrToIntDef(E_dutyyyto.Text,100)*12)+ '  ';
    end;


    //////////////////////////////// Eqip
    // 쥐급장비
    if (trim(SG_Eqip.Cells[0,1]) <> '') or (E_EUseYY.Text <> '') or (E_EUseMM.Text <> '') then
    begin
        sSqlEqip := ' FROM pishreqip, '+
                    '      (select codeno, codename from pishrcode where codeid = ''I711'') '+
                    ' WHERE eqipcode = codeno ';
        if (trim(SG_Eqip.Cells[0,1]) <> '') then
            sSqlEqip := sSqlEqip + ' AND eqipcode IN ('+fnGetRowSG(SG_Eqip,2)+') ';
        if (E_EUseYY.Text <> '') or (E_EUseMM.Text <> '') then
            sSqlEqip := sSqlEqip + ' AND Useyy >= '+inttostr(StrtointDef(E_EUseYY.Text,0))+
                        ' AND Useyy <= '+inttostr(StrtointDef(E_EUseMM.Text,0))+'  ';
    end;

    //////////////////////////////// Prog
    // 취급프로그램
    if (trim(SG_Prog.Cells[0,1]) <> '') or (E_PUseYY.Text <> '') or (E_PUseMM.Text <> '') then
    begin

        sSqlProg := ' FROM pishrprog, '+
                    '      (select codeno, codename from pishrcode where codeid = ''I713'') '+
                    ' WHERE progcode = codeno ';
        if (trim(SG_Prog.Cells[0,1]) <> '') then
            sSqlProg := sSqlProg + ' AND progcode IN ('+fnGetRowSG(SG_Prog,3)+') ';
        if (E_PUseYY.Text <> '') or (E_PUseMM.Text <> '') then
            sSqlProg := sSqlProg + ' AND Useyy >= '+inttostr(StrtointDef(E_PUseYY.Text,0))+
                        ' AND Useyy <= '+inttostr(StrtointDef(E_PUseMM.Text,0))+'  ';
    end;

    //////////////////////////////// Lice
    // 보유자격증
    if (trim(SG_Lice.Cells[0,1]) <> '') then
    begin
        sSqlLice := ' FROM pimlice, '+
                    '      (select codeno, codename from pyccode where codeid = ''I231'') '+
                    ' WHERE lickind = codeno AND lickind IN ('+fnGetRowSG(SG_Lice,4)+') ';
    end;

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
              '       nvl(        cl.codename       ,'' '') IMASPAYCLNAME ,     '+
              '       nvl(        i.payra           ,'' '') PAYRA     ,         '+
              '       nvl(        ra.codename       ,'' '') PAYRANAME ,         '+
              '       nvl(        i.jobgun          ,'' '') JOBGUN    ,         '+
              '       nvl(        jg.codename       ,'' '') JOBGUNNAME,         '+
              '       nvl(        i.lschgr          ,'' '') LSCHGR    ,         '+
              '       nvl(        sc.codename       ,'' '') SCHOOLNAME,         '+
              '       nvl(        i.lschcode        ,'' '') LSCHCODE  ,         '+
              '       nvl(        i.lschnm          ,'' '') LSCHNM    ,         '+
              '       nvl(        i.lmajorcode      ,'' '') LMAJORCODE,         '+
              '       nvl(        mj.codename       ,'' '') MAJORNAME ,         '+
              '       nvl(        i.empdate         ,'' '') EMPDATE   ,         '+
              '       nvl(        i.sex             ,'' '') SEX       ,         '+
              '       nvl(to_char(i.toeicscore     ),''0'') TOEICSCORE          '+
              'FROM pyccode cl, pyccode ra, pyccode jg, pyccode sc, pyccode mj, '+
              '     pycdept d,  pimpmas i                                       '+
              'WHERE cl.codeid = ''I112'' AND cl.codeno = i.paycl    '+
              '  AND ra.codeid = ''I113'' AND ra.codeno = i.payra    '+
              '  AND jg.codeid = ''I115'' AND jg.codeno = i.jobgun   '+
              '  AND sc.codeid (+)= ''I221'' AND sc.codeno (+)= i.lschgr     '+
              '  AND mj.codeid (+)= ''I225'' AND mj.codeno (+)= i.lmajorcode '+
              '  AND d.orgnum = i.orgnum and d.deptcode = i.deptcode '+
              '  AND i.empno like ''%''                              '+
              '  AND i.pstate < ''80'' AND i.paycl < ''H11'' AND i.payra > '''+Main.Ppayra+'''  ';

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
                sOrderBy := ' ORDER BY deptname, imaspaycl, empno';


            // 전체 구성
            gsSqlMain := sSelect + sSqlMain + sSqlDuty + sSqlEqip + sSqlProg + sSqlLice + sOrderBy;
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

function TMainForm.fnGetData: Integer;
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

procedure TMainForm.fzOpenDataSets;
begin
    fzGetDataSql(2); // setting grobal var

    if gsSqlDuty <> '' then
       with DM.qryDuty do
       begin
            CLOSE;
            SQL.Clear;
            SQL.Text := gsSqlDuty;
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

procedure TMainForm.fzOpenDataSets_Det(mGubun: Integer; mEmpnoList: String);
begin
    case mGubun of
      1 : begin

//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//------------------------------------------------------------------------------
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

procedure TMainForm.BB_PreViewClick(Sender: TObject);
var
  iRecordCount: Integer;
begin
    // 체크
    //if fnCheckCondition = False then
    //    System.Exit;
    if SG_Duty.RowCount - SG_Duty.FixedRows > 254 then
    begin
        MessageDlg(' [직군별직무] 선택항목이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
        System.Exit;
    end;
    if SG_Eqip.RowCount - SG_Eqip.FixedRows > 254 then
    begin
        MessageDlg(' [취급장비] 선택항목이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
        System.Exit;
    end;
    if SG_Prog.RowCount - SG_Prog.FixedRows > 254 then
    begin
        MessageDlg(' [취급프로그램] 선택항목이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
        System.Exit;
    end;
    if SG_Lice.RowCount - SG_Lice.FixedRows > 254 then
    begin
        MessageDlg(' [보유자격증] 선택항목이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
        System.Exit;
    end;
    if SG_Major.RowCount - SG_Major.FixedRows > 254 then
    begin
        MessageDlg(' [최종전공] 선택항목이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
        System.Exit;
    end;


    Main.St_Help.Panels[0].Text := '작업중입니다....';
    iRecordCount := fnGetData;
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
                      mtInformation,[mbYes, mbNo],0) = mrNo then
            System.Exit;
    end;

  TRY

    //Application.CreateForm(TSubForm, SubForm);
    SubForm := TSubForm.Create(self);
    SubForm.giRecordCount := iRecordCount;
    SubForm.ShowModal;

  FINALLY
    SubForm.Free;
  END;

    Main.St_Help.Panels[0].Text := '작업이 완료되었습니다 !!';
end;

procedure TMainForm.SB_eqipprogliceClick(Sender: TObject);
begin
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
end;

procedure TMainForm.E_EditlKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
    begin
        case TPePanelEdit(Sender).Tag of
          1 : P_Payclnamefr.TextCaption := '';
          2 : P_Payclnameto.TextCaption := '';
          7 : P_lschgrnamefr.TextCaption := '';
          8 : P_lschgrnameto.TextCaption := '';
          //9 : P_lmajornamefr.TextCaption := '';
          //10: P_lmajornameto.TextCaption := '';
          13: P_jobplacenamefr.TextCaption := '';
          14: P_jobplacenameto.TextCaption := '';
        end;
    end;
end;

procedure TMainForm.E_EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        giCall := 1
    else if (Key = VK_F1) then
    begin
        giCall := 2;
        case TPePanelEdit(Sender).Tag of
          1 : E_EditExit(E_payclfr);
          2 : E_EditExit(E_payclto);
          7 : E_EditExit(E_lschgrfr);
          8 : E_EditExit(E_lschgrto);
          //9 : E_EditExit(E_lmajorfr);
          //10: E_EditExit(E_lmajorto);
          13: E_EditExit(E_jobplacefr);
          14: E_EditExit(E_jobplaceto);
        end;
    end;
end;

procedure TMainForm.E_EditDblClick(Sender: TObject);
var
  iKey: Word;
  tShift: TShiftState;
begin
    iKey := VK_F1;
    tShift := [];
    E_EditKeyDown(Sender, iKey, tShift);
end;

procedure TMainForm.E_EditExit(Sender: TObject);
begin
    case TPePanelEdit(Sender).Tag of
      1 :   fzGetCode('I112', '[BAND열람]', E_payclfr, P_Payclnamefr );
      2 :   fzGetCode('I112', '[BAND열람]', E_payclto, P_Payclnameto );
      7 :   fzGetCode('I221', '[학력열람]', E_lschgrfr, P_lschgrnamefr );
      8 :   fzGetCode('I221', '[학력열람]', E_lschgrto, P_lschgrnameto );
      //9 :   fzGetCode('I225', '[전공열람]', E_lmajorfr, P_lmajornamefr );
      //10:   fzGetCode('I225', '[전공열람]', E_lmajorto, P_lmajornameto );
      13:   fzGetCode('I160', '[근무지열람]', E_jobplacefr, P_jobplacenamefr );
      14:   fzGetCode('I160', '[근무지열람]', E_jobplaceto, P_jobplacenameto );
    end;
end;

procedure TMainForm.fzGetCode(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
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
      SQL.Add('SELECT  '+
              '  nvl( codeno   ,'' '') codeno,     '+
              '  nvl( codename ,'' '') codename    '+
              'FROM  pyccode                       '+
              'WHERE codeid = '''+ACodeid+'''             '+
              '  AND (UPPER(codename) LIKE UPPER('''+sCodeno+''')    '+
              '       OR UPPER(codeno) LIKE   UPPER('''+sCodename+'''))'+
              ' ORDER BY codeno                   ');
      Open;
      if Bof AND Eof then
      begin
        System.Exit;
      end;

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

        if (giCall < 2) and (i = 1) then
        begin
            AEdit.Text         := sCodeno;
            ALabel.TextCaption := SCodename ;
        end
        else if (giCall = 2) then
            fzCallCodeForm(ACodeid, ACodeIdname, AEdit, ALabel)
        else
        begin
            AEdit.Text         := '';
            ALabel.TextCaption := '';
        end
    end;
    giCall := 0;
end;

procedure TMainForm.fzCallCodeForm(ACodeid, ACodeIdname: String; AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
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

procedure TMainForm.E_dutylevelKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
    begin
        case TPePanelEdit(Sender).Tag of
          3 : P_dutylevelfr.TextCaption := '';
          4 : P_dutylevelto.TextCaption := '';
        end;
    end;
end;

procedure TMainForm.E_dutylevelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        giCall := 1
    else if (Key = VK_F1) then
    begin
        giCall := 2;
        case TPePanelEdit(Sender).Tag of
          3 : E_dutylevelExit(E_dutylevelfr);
          4 : E_dutylevelExit(E_dutylevelto);
        end;
    end;
end;

procedure TMainForm.E_dutylevelExit(Sender: TObject);
begin
    case TPePanelEdit(Sender).Tag of
      3 : fzGetDutyLevel(E_dutylevelfr, P_dutylevelfr );
      4 : fzGetDutyLevel(E_dutylevelto, P_dutylevelto );
    end;
end;

procedure TMainForm.E_dutylevelDblClick(Sender: TObject);
var
  iKey: Word;
  tShift: TShiftState;
begin
    iKey := VK_F1;
    tShift := [];
    E_dutylevelKeyDown(Sender, iKey, tShift);
end;

procedure TMainForm.fzGetDutyLevel(AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
var
  sCodeno, SCodename: String;
  i: Integer;
begin
//       Perform(WM_NEXTDLGCTL,0,0);
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
      SQL.Add('SELECT  '+
              ' nvl( dutylevel     ,'' '') CODENO,  '+
              ' nvl( dutylevelname ,'' '') CODENAME '+
              'FROM  pishrlevel                      '+
              'WHERE useyn = ''Y''                   '+
              '  AND (UPPER(dutylevel) LIKE UPPER('''+sCodeno+''')          '+
              '       OR UPPER(dutylevelname) LIKE   UPPER('''+sCodename+'''))'+
              ' ORDER BY codeno                   ');
      Open;
      if Bof AND Eof then
      begin
        System.Exit;
      end;

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

      if (giCall < 2) and (i = 1) then
      begin
          AEdit.Text         := sCodeno;
          ALabel.TextCaption := SCodename ;
      end
      else if (giCall = 2) then
          fzCalldutyevel(AEdit, ALabel)
      else
      begin
          AEdit.Text         := '';
          ALabel.TextCaption := '';
      end
    end;
    giCall := 0;
end;

procedure TMainForm.fzCalldutyevel(AEdit: TPePanelEdit; ALabel: TPeJeonLabel);
begin
  TRY
    LevelForm := TLevelForm.Create(self);
    LevelForm.ShowModal;

    if LevelForm.SELECT_YN then
    begin
        AEdit.Text         := LevelForm.DutyLevel.Hint;
        ALabel.TextCaption := LevelForm.DutyLevel.Text;
    end;

  FINALLY
    LevelForm.Free;
  END;
end;

procedure TMainForm.SG_DutyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
        fzCallDutyForm
    else if Key = VK_RETURN then
        Perform(WM_NEXTDLGCTL,0,0)
end;

procedure TMainForm.SG_DutyDblClick(Sender: TObject);
begin
    fzCallDutyForm;
end;

procedure TMainForm.SG_EqipProgLiceDblClick(Sender: TObject);
begin
    case TStringGrid(Sender).Tag of
      2 : SB_eqipprogliceClick(SB_Eqip);
      3 : SB_eqipprogliceClick(SB_Prog);
      4 : SB_eqipprogliceClick(SB_Lice);
      6 : SB_eqipprogliceClick(SB_Major);
    end;
end;

procedure TMainForm.SG_EqipProgLiceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
        SG_EqipProgLiceDblClick(Sender);
end;

procedure TMainForm.SG_EqipEnter(Sender: TObject);
begin
    TStringGrid(Sender).DefaultDrawing := True;
end;

procedure TMainForm.SG_EqipExit(Sender: TObject);
begin
    TStringGrid(Sender).DefaultDrawing := False;
end;

procedure TMainForm.B_ClearClick(Sender: TObject);
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

procedure TMainForm.FormShow(Sender: TObject);
begin
    if Start = false then Exit;
    Start := False;

    Cb_sex.ItemIndex := 0;
  try

    Application.ProcessMessages;

    fzSGInitialRow(SG_Duty);
    fzSGInitialRow(SG_Eqip);
    fzSGInitialRow(SG_Prog);
    fzSGInitialRow(SG_Lice);
    fzInitialForm;
  except
    on E:Exception do
    begin
      MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                 Chr(13)+Chr(10)+E.Message, mtError, [mbOK], 0);
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
  end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    fzSGAllClear(SG_Duty);
    fzSGAllClear(SG_Eqip);
    fzSGAllClear(SG_Prog);
    fzSGAllClear(SG_Lice);
    Close;
end;

end.

