unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit;

type
  TFm_DestValue = class(TForm)
    ds1: TDataSource;
    Query1: TTMaxDataSet;
    Panel2: TPanel;
    BB_close: TOnFocusButton;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    procedure SqlOpen;
  end;

var
  Fm_DestValue : TFm_DestValue;

implementation
uses UMainForm;
{$R *.DFM}

procedure TFm_DestValue.FormCreate(Sender: TObject);
begin
  FCloseYn      := False;
  
end;

procedure TFm_DestValue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Query1.Close;
//  Action := caFree;
end;

procedure TFm_DestValue.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
     begin
       Releasecapture;
       Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_DestValue.Sb_CloseClick(Sender: TObject);
begin
  Fempno   := '';
  Fkorname := '';
  FCloseYn := True;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_DestValue.Sb_OkClick(Sender: TObject);
begin
  Fempno   := Query1.FieldByName('empno').AsString;
  Fkorname := Query1.FieldByName('korname').AsString;
  FCloseYn := False;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_DestValue.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText,FOrgDept1,FOrgDept2 : string;
begin
    FOrgDept1 := copy(FOrgDept,3,3);
    FOrgDept2 := copy(FOrgDept,9,4) + '%';

    //2006.11.27 하은영

{    SqlText := Format(
      'SELECT  '+
      ' nvl(        empno      ,'' '') empno     , '+
      ' nvl(        korname    ,'' '') korname   , '+
      ' nvl(        orgnum     ,'' '') orgnum    , '+
      ' nvl(        deptcode   ,'' '') deptcode  , '+
      ' nvl(        deptname   ,'' '') deptname  , '+
      ' nvl(        paycl      ,'' '') paycl     , '+
      ' nvl(        payclname  ,'' '') payclname , '+
      ' nvl(        payra      ,'' '') payra     , '+
      ' nvl(        payraname  ,'' '') payraname , '+
      ' nvl(        jobgun     ,'' '') jobgun    , '+
      ' nvl(        jobgunname ,'' '') jobgunname, '+
      ' nvl(        conyn      ,'' '') conyn     , '+
      ' nvl(        finyn      ,'' '') finyn     , '+
      ' nvl(        prog       ,'' '') prog        '+
      ' FROM ( '+
           ' SELECT a.empno, a.korname, a.orgnum, a.deptcode, d.deptname,    '+
           '        a.paycl, cl.codename payclname,    '+
           '        a.payra, ra.codename payraname,    '+
           '        a.jobgun,jg.codename jobgunname,   '+
           '        r.conyn, r.finyn,                  '+
//==============================================================================//
// 03.14    2002.04.08      손종운      결재자에게 보이는 상태 수정
//==============================================================================//
//           '        decode(r.conyn,''N'',''반려'',  '+
//           '                       ''Y'',''결재완료'',                    '+
//           '                       decode(r.finyn,''Y'',''결재상신중'',   '+
//           '                                            ''등록중'')) prog '+
           '        decode(r.LastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4), decode(r.conyn,''N'',''반려'',  '+
// 은아          '        decode(r.LastYear, ''2003'', decode(r.conyn,''N'',''반려'',  '+ 날짜
           '                                                    ''Y'',''결재완료'', '+
           '                       decode(r.finyn,''Y'',''결재상신중'',   '+
           '                                            ''등록중'')), ''등록중'') prog '+
//==============================================================================//
           ' FROM  (select codeno, codename from pyccode where codeid = ''I112'') cl, '+
           '       (select codeno, codename from pyccode where codeid = ''I113'') ra, '+
           '       (select codeno, codename from pyccode where codeid = ''I115'') jg, '+
//==============================================================================//
// 03.14    2002.04.08      손종운      결재자에게 보이는 상태 수정
//==============================================================================//
//           '       (select empno, max(conyn) conyn, max(finyn) finyn from pishrmas    '+ //
//           '          group by empno) r, '+
//2004.12.22 유효성 수정
//           '       (select empno, max(conyn) conyn, max(finyn) finyn, '+
           '       (select empno, max(nvl(conyn,''Z'')) conyn, max(nvl(finyn,''Z'')) finyn, '+
//유효성 임시
//           '               max(substr(writetime, 1, 4)) LastYear  from pishrmas    '+ //
           '               decode(max(substr(writetime, 1, 4)),''2004'',''2005'', max(substr(writetime, 1, 4))) LastYear  from pishrmas '+
           '          group by empno) r, '+
//==============================================================================//
           '       pycdept d,            '+
           '       (select empno, korname, i.orgnum orgnum, i.deptcode deptcode, paycl, payra, jobgun, pstate '+
           '          from pycdept a, pycdept b, pimpmas i                  '+
//           '          where payrayn = ''Y''                                 '+
//           '            and i.orgnum = a.orgnum and i.deptcode = a.deptcode '+
           '          where i.orgnum = a.orgnum and i.deptcode = a.deptcode '+
//유효성 임시  --> 팀장은 실장한테 안보이게..
            '           and a.orgnum = b.orgnum and decode(i.payra,''2C'',a.deptcode, a.extcode) = b.deptcode   '+
//           '            and a.orgnum = b.orgnum and a.extcode = b.deptcode  '+
//           '            and (b.orgnum, b.deptcode) IN (%s) '+
           '            and ((b.orgnum, b.deptcode) IN (%s) '+
//           '             or  i.empno in ('+MainForm.pMilitary+')) '+
           '             and  i.empno in ('+MainForm.pMilitary+')) '+
           '        union '+
           '        select empno, korname, orgnum, deptcode, paycl, payra, jobgun, pstate '+
           '          from pimpmas '+
           //하은영
           //           '          where (orgnum, deptcode) IN (%s) ) a,          '+
           '          where orgnum = ''%s''' +
           '            and  substr(deptcode,1,4) like ''%s'' ) a,       '+
           '       pishrvari v                                       '+
           '  WHERE a.empno  = r.empno (+)                           '+
           '    AND a.paycl  = cl.codeno                             '+
           '    AND a.payra  = ra.codeno                             '+
           '    AND a.jobgun = jg.codeno                             '+
           '    AND a.orgnum = d.orgnum AND a.deptcode  = d.deptcode '+
           '    and v.gubun = ''00'' and v.sgubun = ''0003''         '+
           '    and a.paycl between v.value1 and v.value2            '+
           '    AND a.pstate < ''80'' )                              '+
      ' ORDER BY  deptcode, paycl, empno                             ',[FOrgDept, FOrgDept1, FOrgDept2]);

    with Query1 do
    begin
      Close;
      ClearFieldInFo;
      AddField('EMPNO'        , ftString,  4  );
      AddField('KORNAME'      , ftString,  12 );
      AddField('ORGNUM'       , ftString,  3  );
      AddField('DEPTCODE'     , ftString,  6  );
      AddField('DEPTNAME'     , ftString,  60 );
      AddField('PAYCL'        , ftString,  2  );
      AddField('PAYCLNAME'    , ftString,  20 );
      AddField('PAYRA'        , ftString,  3  );
      AddField('PAYRANAME'    , ftString,  20 );
      AddField('JOBGUN'       , ftString,  2  );
      AddField('JOBGUNNAME'   , ftString,  20 );
      AddField('CONYN'        , ftString,  1  );
      AddField('FINYN'        , ftString,  1  );
      AddField('PROG'         , ftString,  11 );
      Sql.Clear;
      Sql.Text := SqlText;
      edit1.Text := SqlText;
      memo1.text := SqlText;
      ServiceName := 'PIT1030A_SEL9';
      Open;}


{  SqlText := Format(
    ' SELECT  A.EMPNO, A.KORNAME, B.DEPTCODE,B.DEPTNAME,C.CODENAME,            '+
    '         decode(D.conyn,''N'',''반려'',''Y'',''결재완료'',                '+
    '         decode(D.finyn,''Y'',''결재상신중'', ''등록중'')) prog           '+
    '   FROM  PIMEEMP A, PYCDEPT B, PYCCODE C,                                 '+
    '        (select empno, max(nvl(conyn,''Z'')) conyn, max(nvl(finyn,''Z'')) finyn,  '+
    '                decode(max(substr(writetime, 1, 4)),''2004'',''2005'',    '+
    '                       max(substr(writetime, 1, 4))) LastYear             '+
    '                   from pishrmas                                          '+
    '         group by empno) D                                                '+
    '  WHERE  A.PSTATE   < ''80''                                              '+
    '    AND  A.DEPTCODE = B.DEPTCODE                                          '+
    '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN = ''00'' AND SGUBUN = ''0001'') '+
    '    AND  A.PAYCL    = C.CODENO AND C.CODEID = ''I112''                    '+
    '    AND  A.EMPNO    = D.EMPNO                                             '+
    '    AND  A.EEMPNO   = ''%s''                                              '+
    ' ORDER BY B.DEPTCODE   ',[FEMPNO]);  }
  {  for i := 0 to Query1.FieldCount - 1 do
      begin
        Field := Query1.Fields[i];
        Field.Visible := False;
        case Field.Index of
          0 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 8;
                Field.DisplayLabel := '사 번';
              end;
          1 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '성 명';
              end;
          6 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 10;
                Field.DisplayLabel := '직 급';
              end;
          4 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 32;
                Field.DisplayLabel := '부 서 명';
              end;
          13: begin
                Field.Visible      := True;
                Field.DisplayWidth := 16;
                Field.DisplayLabel := '진행상황';
              end;
        end;
      end;
     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,98) + 36;}



//기존 sql을 pimeemp(상위자 테이블) 이용으로 변경 2007.03.14 서혜미 시작
//서비스 고치지 않고 서비스 필드와 맞추기 위해..
{  SqlText := Format(
    ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                                  '+
    '         A.PAYCL,C.CODENAME,A.PAYRA,A.PAYRA,A.PAYRA,A.PAYRA,D.CONYN,D.FINYN,                  '+
    '         decode(D.LastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4),                          '+
    '         decode(D.conyn,''N'',''반려'',''Y'',''결재완료'',                                    '+
    '         decode(D.finyn,''Y'',''결재상신중'', ''등록중'')), ''등록중'') prog                  '+
    '   FROM  PIMEEMP A, PYCDEPT B, PYCCODE C,                                                     '+
    '        (select empno, max(nvl(conyn,''Z'')) conyn, max(nvl(finyn,''Z'')) finyn,              '+
    '                decode(max(substr(writetime, 1, 4)),''2004'',''2005'',                        '+
    '                       max(substr(writetime, 1, 4))) LastYear                                 '+
    '                   from pishrmas                                                              '+
    '         group by empno) D                                                                    '+
    '  WHERE  A.PSTATE   < ''80''                                                                  '+
    '    AND  A.DEPTCODE = B.DEPTCODE                                                              '+
    '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN = ''00'' AND SGUBUN = ''0001'') '+
    '    AND  A.PAYCL    = C.CODENO AND C.CODEID = ''I112''                                        '+
    '    AND  A.EMPNO    = D.EMPNO                                                                 '+
    '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'')                           '+
    '    AND  A.EEMPNO   = ''%s''                                                                  '+
    ' ORDER BY B.DEPTCODE ,A.PAYCL  ',[MAINFORM.AEmpno]);                                }
  SqlText := Format(
    ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                      '+
    '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+
    '         A.PAYRAYN JOBGUN, A.JOBPAYRAYN JOBGUNNAME,                               '+
    '         D.CONYN,D.FINYN,                                                         '+
    '         decode(D.LastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4),              '+
    '         decode(D.conyn,''N'',''반려'',''Y'',''결재완료'',                        '+
    '         decode(D.finyn,''Y'',''결재상신중'', ''등록중'')), ''등록중'') prog      '+
    '   FROM  PIMEEMP A, PYCDEPT B, PYCCODE C, PYCCODE E,                              '+
    '        (select empno, max(nvl(conyn,''Z'')) conyn, max(nvl(finyn,''Z'')) finyn,  '+
    '                decode(max(substr(writetime, 1, 4)),''2004'',''2005'',            '+
    '                       max(substr(writetime, 1, 4))) LastYear                     '+
    '           from pishrmas                                                          '+
    '          where findate >= ''%s''                                                 '+
    '         group by empno) D                                                        '+
    '  WHERE  A.PSTATE   < ''80''                                                      '+
    '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+
    '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI                                 '+
    '                        WHERE GUBUN = ''00'' AND SGUBUN = ''0001'')               '+
    '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+
    '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+
    '    AND  A.EMPNO    = D.EMPNO(+)                                                  '+
    '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'')               '+
    '    AND  A.EEMPNO   = ''%s''                                                      '+
    ' ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO ',[MainForm.PfrBasedate, MAINFORM.AEmpno]);

    with Query1 do
    begin
      Close;
      ClearFieldInFo;
      ClearFieldInFo;
      AddField('EMPNO'        , ftString,  4  );
      AddField('KORNAME'      , ftString,  12 );
      AddField('ORGNUM'       , ftString,  3  );
      AddField('DEPTCODE'     , ftString,  6  );
      AddField('DEPTNAME'     , ftString,  60 );
      AddField('PAYCL'        , ftString,  3  );
      AddField('PAYCLNAME'    , ftString,  20 );
      AddField('PAYRA'        , ftString,  3  );
      AddField('PAYRANAME'    , ftString,  20 );
      AddField('JOBGUN'       , ftString,  2  );
      AddField('JOBGUNNAME'   , ftString,  20 );
      AddField('CONYN'        , ftString,  1  );
      AddField('FINYN'        , ftString,  1  );
      AddField('PROG'         , ftString,  11 );
      Sql.Clear;
      Sql.Text    := SqlText;
      memo1.text  := SqlText;
      ServiceName := 'PIT1030A_SEL9';
      Open;
      ///sql.savetofile('c:\test.sql');
    end;

    for i := 0 to Query1.FieldCount - 1 do
      begin
        Field := Query1.Fields[i];
        Field.Visible := False;
        case Field.Index of
          0 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 8;
                Field.DisplayLabel := '사 번';
              end;
          1 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '성 명';
              end;
          8 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 10;
                Field.DisplayLabel := '직 책';
              end;
          4 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 32;
                Field.DisplayLabel := '부 서 명';
              end;
          13: begin
                Field.Visible      := True;
                Field.DisplayWidth := 17;
                Field.DisplayLabel := '진행상황';
              end;
        end;
      end;

     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,90) - 1; //+36
//기존 sql을 pimeemp(상위자 테이블) 이용으로 변경 2007.03.14 서혜미 끝

end;

procedure TFm_DestValue.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       Sb_OkClick(Sender);
    end;
end;
procedure TFm_DestValue.FormShow(Sender: TObject);
begin
    //ShowMessage(FOrgDept);
end;

end.
