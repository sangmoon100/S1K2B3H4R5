unit PZB10402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, MemDS, DBAccess, Ora;

type
  TFm_Emp = class(TForm)
    ds1: TDataSource;
    Panel2: TPanel;
    BB_close: TOnFocusButton;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Query1: TOraQuery;
    E_Search: TOnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Fempno        : string;
    Fkorname      : string;
    FOrgnum       : string;
    FDeptcode     : string;
    FDeptname     : string;
    FRetcont      : string;
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
    property Retcont      : string        read FRetcont       write FRetcont;

    procedure SqlOpen;
    procedure Data_Clear;
    procedure Data_Select;

  end;

var
  Fm_Emp : TFm_Emp;

implementation

uses PZB10401;
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

procedure TFm_Emp.Data_Clear;
begin
  Fempno    := '';
  Fkorname  := '';
  Forgnum   := '';
  FDeptcode := '';
  FDeptname := '';
  FRetcont  := '';
end;

procedure TFm_Emp.Sb_CloseClick(Sender: TObject);
begin
  Fempno    := '';
  Fkorname  := '';
  Forgnum   := '';
  FDeptcode := '';
  FDeptname := '';
  FRetcont  := '';
  FCloseYn  := True;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_Emp.Data_Select;
begin
  Fempno    := Query1.FieldByName('empno').AsString;
  Fkorname  := Query1.FieldByName('korname').AsString;
  Forgnum   := Query1.FieldByName('orgnum').AsString;
  FDeptcode := Query1.FieldByName('deptcode').AsString;
  FDeptname := Query1.FieldByName('deptname').AsString;
  FRetcont  := Query1.FieldByName('retcont').AsString;
end;

procedure TFm_Emp.Sb_OkClick(Sender: TObject);
begin
  Data_Select;
  FCloseYn  := False;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_Emp.SqlOpen;
var
  i       : integer;
  Field   : TField;
  SqlText : string;
begin

  SqlText := 'SELECT A.EMPNO, KORNAME, orgnum, deptcode,                         '+#13+
             '       (select deptname from pycdept                               '+#13+
             '         where orgnum=a.orgnum and deptcode=a.deptcode ) deptname, '+#13+
             '       replace(RETCONT,''-'','''') RETCONT                         '+#13+
             '  FROM PIMPMAS A                                                   '+#13+
             ' WHERE A.pstate   < ''80''                                         '+#13+
             '   AND ((A.EMPNO   =    '''+E_Search.Text+'''       ) or           '+#13+
             '        (A.KORNAME LIKE '''+E_Search.Text+'''||''%''))             '+#13+
             ' ORDER BY  A.EMPNO                                                 ';

    with Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Text    := SqlText;
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
          2 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '조직차수';
              end;
          3 : begin
                Field.Visible      := True;
                Field.DisplayWidth := 12;
                Field.DisplayLabel := '부서코드';
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

procedure TFm_Emp.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       SqlOpen;
    end;
end;

end.
