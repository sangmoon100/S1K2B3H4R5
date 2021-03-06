unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit;

type
  TFm_Emp = class(TForm)
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
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FOrgnum       : string;
    FDeptcode     : string;
    FDeptname     : string;
    FPayraname    : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;
    EmpCount  : integer;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property orgnum       : string        read FOrgnum       write FOrgnum;
    property deptcode     : string        read FdeptCode     write Fdeptcode;
    property deptname     : string        read Fdeptname     write Fdeptname;
    property Payraname    : string        read FPayraname    write Fpayraname;
    procedure SqlOpen;
  end;

var
  Fm_Emp : TFm_Emp;

implementation

uses UDiaryForm;
{$R *.DFM}

procedure TFm_Emp.FormCreate(Sender: TObject);
begin
  FCloseYn      := False;
  
end;

procedure TFm_Emp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Query1.Close;
//  Action := caFree;
end;

procedure TFm_Emp.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
     begin
       Releasecapture;
       Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_Emp.Sb_CloseClick(Sender: TObject);
begin
  Fempno    := '';
  Fkorname  := '';
  Forgnum   := '';
  FDeptcode := '';
  FDeptname := '';
  Fpayraname:= '';
  FCloseYn  := True;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_Emp.Sb_OkClick(Sender: TObject);
begin
  Fempno    := Query1.FieldByName('empno').AsString;
  Fkorname  := Query1.FieldByName('korname').AsString;
  Forgnum   := Query1.FieldByName('orgnum').AsString;
  FDeptcode := Query1.FieldByName('deptcode').AsString;
  FDeptname := Query1.FieldByName('deptname').AsString;
  FPayraname:= Query1.FieldByName('payraname').AsString;
  FCloseYn  := False;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_Emp.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText,FOrgDept1,FOrgDept2 : string;
begin
    FOrgDept1 := copy(FOrgDept,3,3);
    FOrgDept2 := copy(FOrgDept,9,4) + '%';

{
 SqlText := Format(
    ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,A.JobDEPT DEPTCODE,                                                                            '+ #13 +
    '         (select deptname from pycdept where orgnum=A.ORGNUM and deptcode=A.jobDEPT) deptname,                                       '+ #13 +
    '         A.PAYCL,                                                                                                                    '+ #13 +
    '         (select codename from pyccode where codeid=''I112''and codeno=A.PAYCL) payclname,                                           '+ #13 +
    '         A.PAYRA,                                                                                                                    '+ #13 +
    '         (select codename from pyccode where codeid=''I113''and codeno=A.PAYRA) payraname,                                           '+ #13 +
    '         '''','''','''','''',''''                                                                                                    '+ #13 +
    '   FROM                                                                                                                              '+ #13 +
    '         pime1emp A       '+ #13 +
{//  브로드밴드미디어 육성일지 대상자 지정   2009.02.12
    '        (select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN,                      '+ #13 +
    '                EEMPNO, EKORNAME, EPAYCL, EPAYRA, EPAYRAYN, EORGNUM, EDEPTCODE, EJOBDEPT, EJOBPAYRA, EJOBPAYRAYN                     '+ #13 +
    '           from pimeemp                                                                                                              '+ #13 +
    '          where empno not in (''0695'',''1746'') And pstate not in (''24'',''25'')                                                   '+ #13 +
    '         union all                                                                                                                   '+ #13 +
    '         select a.EMPNO, a.KORNAME, a.PAYCL, a.PAYRA, a.PAYRAYN, a.PSTATE, a.ORGNUM, a.DEPTCODE, a.JOBDEPT, a.JOBPAYRA, a.JOBPAYRAYN,'+ #13 +
    '                b.EMPNO EEMPNO, b.KORNAME EKORNAME, b.PAYCL EPAYCL, b.PAYRA EPAYRA, b.PAYRAYN EPAYRAYN,                              '+ #13 +
    '         	     b.ORGNUM EORGNUM, b.DEPTCODE EDEPTCODE, b.JOBDEPT EJOBDEPT, b.JOBPAYRA EJOBPAYRA, b.JOBPAYRAYN EJOBPAYRAYN           '+ #13 +
    '           from pimeemp a,                                                                                                           '+ #13 +
    '                (select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN               '+ #13 +
    '         	      from pimeemp where empno = ''0695'') b                                                                              '+ #13 +
    '          where a.empno in (''2346'',''2348'',''0363'',''0788'',''1091'',''1118'',''1404'',''2281'',                                 '+ #13 +
    '                            ''1650'',''1570'',''2347'',''2182'',''2153'',''2142'',''0086'') -- ''0695''                              '+ #13 +
    '            and a.pstate = ''24''                                                                                                    '+ #13 +
    '         union all                                                                                                                   '+ #13 +
    '         select a.EMPNO, a.KORNAME, a.PAYCL, a.PAYRA, a.PAYRAYN, a.PSTATE, a.ORGNUM, a.DEPTCODE, a.JOBDEPT, a.JOBPAYRA, a.JOBPAYRAYN,'+ #13 +
    '                b.EMPNO EEMPNO, b.KORNAME EKORNAME, b.PAYCL EPAYCL, b.PAYRA EPAYRA, b.PAYRAYN EPAYRAYN,                              '+ #13 +
    '         	     b.ORGNUM EORGNUM, b.DEPTCODE EDEPTCODE, b.JOBDEPT EJOBDEPT, b.JOBPAYRA EJOBPAYRA, b.JOBPAYRAYN EJOBPAYRAYN           '+ #13 +
    '           from pimeemp a,                                                                                                           '+ #13 +
    '                (select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN               '+ #13 +
    '         	      from pimeemp where empno = ''1746'') b                                                                              '+ #13 +
    '          where a.empno in (''2247'',''0382'',''0993'',''1085'',''1352'',''0346'',''1634'',''1467'',                                 '+ #13 +
    '                            ''0771'',''0422'',''2285'',''0085'') --''1746''                                                          '+ #13 +
    '            and a.pstate = ''24''                                                                                                    '+ #13 +
    '         union all                                                                                                                   '+ #13 +
    '         select a.EMPNO, a.KORNAME, a.PAYCL, a.PAYRA, a.PAYRAYN, a.PSTATE, a.ORGNUM, a.DEPTCODE, a.JOBDEPT, a.JOBPAYRA, a.JOBPAYRAYN,'+ #13 +
    '                b.EMPNO EEMPNO, b.KORNAME EKORNAME, b.PAYCL EPAYCL, b.PAYRA EPAYRA, b.PAYRAYN EPAYRAYN,                              '+ #13 +
    '         	     b.ORGNUM EORGNUM, b.DEPTCODE EDEPTCODE, b.JOBDEPT EJOBDEPT, b.JOBPAYRA EJOBPAYRA, b.JOBPAYRAYN EJOBPAYRAYN           '+ #13 +
    '           from pimeemp a,                                                                                                           '+ #13 +
    '                (select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN               '+ #13 +
    '         	      from pimeemp where empno = ''M131'') b                                                                              '+ #13 +
    '          where a.empno in (''2349'',''2121'',''2216'',''1471'',''1396'',''1647'',''2227'',''2226'',                                 '+ #13 +
    '                            ''1815'',''1813'',''1844'',''2106'',''2133'',''2154'') --''M131''                                        '+ #13 +
    '            and a.pstate = ''24''                                                                                                    '+ #13 +
    '         union all                                                                                                                   '+ #13 +
    '         select a.EMPNO, a.KORNAME, a.PAYCL, a.PAYRA, a.PAYRAYN, a.PSTATE, a.ORGNUM, a.DEPTCODE, a.JOBDEPT, a.JOBPAYRA, a.JOBPAYRAYN,'+ #13 +
    '                b.EMPNO EEMPNO, b.KORNAME EKORNAME, b.PAYCL EPAYCL, b.PAYRA EPAYRA, b.PAYRAYN EPAYRAYN,                              '+ #13 +
    '         	     b.ORGNUM EORGNUM, b.DEPTCODE EDEPTCODE, b.JOBDEPT EJOBDEPT, b.JOBPAYRA EJOBPAYRA, b.JOBPAYRAYN EJOBPAYRAYN           '+ #13 +
    '           from pimeemp a,                                                                                                           '+ #13 +
    '                (select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN               '+ #13 +
    '         	      from pimeemp where empno = ''M128'') b                                                                              '+ #13 +
    '          where a.empno in (''0695'',''1746'') --''M128''                                                                            '+ #13 +
    '         union all                                                                                                                   '+ #13 +
    '         select EMPNO, KORNAME, PAYCL, PAYRA, PAYRAYN, PSTATE, ORGNUM, DEPTCODE, JOBDEPT, JOBPAYRA, JOBPAYRAYN,                      '+ #13 +
    '                EMPNO EEMPNO, KORNAME EKORNAME, PAYCL EPAYCL, PAYRA EPAYRA, PAYRAYN EPAYRAYN, ORGNUM EORGNUM, DEPTCODE EDEPTCODE,    '+ #13 +
    '         	   JOBDEPT EJOBDEPT, JOBPAYRA EJOBPAYRA, JOBPAYRAYN EJOBPAYRAYN                                                           '+ #13 +
    '           from pimeemp                                                                                                              '+ #13 +
    '          where empno  in (''2215'',''0197'',''0150'') )  A     --''1568'', ''1145'',                                                '+ #13 +
    '  WHERE  A.PSTATE   < ''80''  and  A.PSTATE <> ''25'' /*교육파견자 육성일지 제외*/                                                   '+ #13 +
    '    AND  A.EEMPNO   = ''%s''                                                                                                         '+ #13 +
    '    AND  A.EMPNO   not in    ( ''%s'' )                                                                                              '+ #13 +
    '    AND  substr(A.EMPNO,1,1) not in (''M'',''J'',''P'',''Q'',''Y'')                                                                  '+ #13 +
    ' ORDER BY A.JobDEPT, A.PAYRA, A.JOBPAYRA, A.PAYCL, A.EMPNO  ',[DiaryForm.AEmpno,DiaryForm.AEmpno]);
}

  SqlText := Format(
    ' SELECT A.EMPNO, A.KORNAME, A.ORGNUM,A.DEPTCODE DEPTCODE,                                       '+ #13 +
    '        (SELECT deptname FROM pycdept WHERE orgnum=A.ORGNUM AND deptcode=A.DEPTCODE) deptname,  '+ #13 +
    '        A.PAYCL,                                                                                '+ #13 +
    '        (SELECT codename FROM pyccode WHERE codeid=''I112''AND codeno=A.PAYCL) payclname,       '+ #13 +
    '        A.PAYRA,                                                                                '+ #13 +
    '        (SELECT codename FROM pyccode WHERE codeid=''I113''AND codeno=A.PAYRA) payraname,       '+ #13 +
    '        '''','''','''','''',''''                                                                '+ #13 +
    ' FROM pehremas a                                                                                '+ #13 +
    ' WHERE orgnum = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'')         '+ #13 +
    '   AND e1empno  = ''%s''                                                                        '+ #13 +
    '   AND A.EMPNO   NOT IN       ( ''%s'' )                                                        '+ #13 +
    '   AND  substr(A.EMPNO,1,1) not in (''M'',''J'',''P'',''Q'',''Y'')                              '+ #13 +
    '   AND RECONYN = ''Y''                                                                          '+ #13 +
    ' ORDER BY A.DEPTCODE, A.PAYRA, A.PAYCL, A.EMPNO  ',[DiaryForm.AEmpno,DiaryForm.AEmpno]);
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

      EmpCount :=  Fm_emp.Query1.RecordCount;

    end;

    for i := 0 to Query1.FieldCount - 1 do
      begin
        Field := Query1.Fields[i];
        Field.Visible := False;
        case Field.Index of
          0 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 10;
                Field.DisplayLabel := '사 번';
              end;
          1 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '성 명';
              end;
          8 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 14;
                Field.DisplayLabel := '직 책';
              end;
          4 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 29;
                Field.DisplayLabel := '부 서 명';
              end;
        end;
      end;

     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,75);

end;

procedure TFm_Emp.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       Sb_OkClick(Sender);
    end;
end;

end.
