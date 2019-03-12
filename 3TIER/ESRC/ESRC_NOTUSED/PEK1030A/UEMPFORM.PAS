unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit;

type
  TFm_EmpForm = class(TForm)
    ds1: TDataSource;
    Query1: TTMaxDataSet;
    Panel2: TPanel;
    BB_close: TOnFocusButton;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    Fdeptname     : string;
    Fpayclname    : string;
    Fpayraname    : string;
    Fe1empno      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property deptname     : string        read Fdeptname     write Fdeptname;
    property payclname    : string        read Fpayclname    write Fpayclname;
    property payraname    : string        read Fpayraname    write Fpayraname;
    property e1empno      : string        read Fe1empno      write Fe1empno;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses HMainForm;
{$R *.DFM}

procedure TFm_EmpForm.FormCreate(Sender: TObject);
begin
     FCloseYn      := False;
end;

procedure TFm_EmpForm.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     if  ssleft in shift then
     begin
          Releasecapture;
          Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_EmpForm.Sb_CloseClick(Sender: TObject);
begin
     Fempno     := '';
     Fkorname   := '';
     Fdeptname  := '';
     Fpayclname := '';
     Fpayraname := '';
     Fe1empno   := '';
     FCloseYn   := True;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
     if  (FM_MAIN.E_ChangeEmp.Text <> Query1.FieldByName('empno').AsString) And (Query1.FieldByName('Conyn').AsString = 'Y') then
     begin
          if  Query1.FieldByName('Finyn').AsString = 'Y' then
               MessageDlg('이미 [팀장 Action Contract 결재]을 완료 하였습니다.' + #13+#13+
                          '[팀장 Action Contract 결재] 내용 확인만 할수 있습니다.', mtInformation, [mbOK],0);
          Fempno     := Query1.FieldByName('empno').AsString;
          Fkorname   := Query1.FieldByName('korname').AsString;
          Fdeptname  := Query1.FieldByName('deptname').AsString;
          Fpayclname := Query1.FieldByName('payclname').AsString;
          Fpayraname := Query1.FieldByName('payraname').AsString;
          FE1empno   := Query1.FieldByName('e1empno').AsString;
          FConyn     := Query1.FieldByName('conyn').AsString;
          FFinyn     := Query1.FieldByName('finyn').AsString;
          FCloseYn   := False;
          Edit.PopupForm.ClosePopup(False);
     end
     else
     begin
          MessageDlg('해당 팀장이 아직 등록 작업을 마치지 않았습니다.'+#13 ,mtError,[mbOK],0);
     end;
end;

procedure TFm_EmpForm.SqlOpen;
var
     i       : integer;
     Field   : TField;
     SqlText : string;
begin
     SqlText := ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                     ' +
                '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,           ' +
                '         (select JOBPAYRAYN from pimpmas where empno = a.empno) JOBPAYRAYN,      ' +
                '	  A.E1empno, F.RVALCONYN CONYN, F.E1VALCONYN FINYN,                       ' +
                '         decode(F.E1VALCONYN,''R'',''반려'',''Y'',''결재완료'',                  ' +
                '         decode(F.RVALCONYN,''Y'',''결재상신중'', ''등록중'')) prog              ' +
                '   FROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE E, PEACTFILE F                ' +
                '  WHERE  A.rabasdate  like '''+ FM_MAIN.LRabasyy +'''||''%''                     ' +
                '    AND  F.rabasym(+)  = '''+ FM_MAIN.LRabasYM +'''                              ' +
                '    And  A.reconyn  = ''Y''                                                      ' +
                '    AND  A.DEPTCODE = B.DEPTCODE                                                 ' +
                '    AND  A.ORGNUM   = B.ORGNUM                                                   ' +
                '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                     ' +
                '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                     ' +
                '    AND  SubStr(A.RabasDate,1,4) = SubStr(F.rabasym(+),1,4)                      ' +
                '    And  A.EMPNO    = F.EMPNO(+)                                                 ' +
                '    AND (((a.payra >= '''+FM_MAIN.payrafrom+''') And                             ' +
                '          (a.payra <= '''+FM_MAIN.payrato  +''')    ) or                         ' +
                '         ( a.empno =  '''+FM_MAIN.objemp1  +''')      or                         ' +
                '         ( a.empno =  '''+FM_MAIN.objemp2  +''')        )                        ' +
                '    AND (A.empno not in ('''+FM_MAIN.excemp1+''','''+FM_MAIN.excemp2+''',        ' +
                '                         '''+FM_MAIN.excemp3+''','''+FM_MAIN.excemp4+''',        ' +
                '                         '''+FM_MAIN.excemp5+''','''+FM_MAIN.excemp6+'''))       ' +
                '    AND  A.EMPNO   <> A.E1EMPNO                                                  ' +
                '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''Q'',''P'',''Y'',''J'')                    ' +
                '    AND  A.E1EMPNO  = '''+ FM_MAIN.E_ChangeEmp.Text +'''                         ' +
                '  ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO                                          ' ;

     with Query1 do
     begin
          Close;
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
          AddField('JOBPAYRAYN'   , ftString,  2  );
          AddField('E1EMPNO'      , ftString,  20 );
          AddField('CONYN'        , ftString,  1  );
          AddField('FINYN'        , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
          Open;
          Locate('EMPNO',vararrayof([FM_Main.Ed_empno.Text]),[loCaseInsensitive]);
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
                        Field.DisplayWidth := 16;
                        Field.DisplayLabel := '진행상황';
                   end;
          end;
     end;
     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,87) + 36;
end;

procedure TFm_EmpForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
     if  Key = Chr(13) then
     begin
          Key := #0;
          Sb_OkClick(Sender);
     end;
end;
end.
