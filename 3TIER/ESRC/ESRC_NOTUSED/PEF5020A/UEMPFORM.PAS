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
    Fempno        : string;
    Fkorname      : string;
    FOrgnum       : string;
    FDeptcode     : string;
    FDeptname     : string;
    Fe1empno      : string;
    Fe1korname    : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;
    EmpCount  : integer;

    FCloseYn : Boolean;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property orgnum       : string        read FOrgnum       write FOrgnum;
    property deptcode     : string        read FdeptCode     write Fdeptcode;
    property deptname     : string        read Fdeptname     write Fdeptname;
    property e1empno      : string        read Fe1empno      write Fe1empno;
    property e1korname    : string        read Fe1korname    write Fe1korname;

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
  Fe1empno  := '';
  Fe1korname:= '';
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
  Fe1empno  := Query1.FieldByName('e1empno').AsString;
  Fe1korname:= Query1.FieldByName('e1korname').AsString;
  FCloseYn  := False;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_Emp.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
begin

  SqlText := Format(
    ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,A.DEPTCODE,                                                                            '+ #13 +
    '         (select deptname from pycdept where orgnum=A.ORGNUM and deptcode=A.deptcode) deptname,                                       '+ #13 +
    '         '''',                                                                                                                    '+ #13 +
    '         E1EMPNO,                                             '+ #13 +
    '         '''',                                                                                                                    '+ #13 +
    '         E1KORNAME,                                           '+ #13 +
    '         '''','''','''','''',''''                                                                                                    '+ #13 +
    '   FROM                                                                                                                              '+ #13 +
    '         peintmas A       '+ #13 +
    '  WHERE  A.E2EMPNO   = ''%s''                                                                                                         '+ #13 +
    ' ORDER BY A.DEPTCODE, A.EMPNO  ',[DiaryForm.wEmpno]);

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
      AddField('E1EMPNO'      , ftString,  20 );
      AddField('PAYRA'        , ftString,  3  );
      AddField('E1KORNAME'    , ftString,  20 );
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
          6 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 10;
                Field.DisplayLabel := '멘토사번';
              end;
          8 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '멘토성명';
              end;
          4 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 20;
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
