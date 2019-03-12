unit UDepForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, StdCtrls, Mask, pebtnedit, Grids,
  DBGrids, pedbgrid, Db, DBTables, pegraphic, DBClient, MIDAScon,
  TXClientDS, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnGrDBGrid,
  OnFocusButton, OnPopupEdit;

type
  TFm_DestValue_dept = class(TForm)
    Panel1      : TPanel;
    DataSource1 : TDataSource;
    Panel2: TPanel;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Sb_run: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Edit_see: TOnEdit;
    Edit_see_orgnum: TOnEdit;
    Query1: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_seeKeyPress(Sender: TObject; var Key: Char);
    procedure Sb_runClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FStart        : Boolean;
    FOrgDeptList: String;
    FOrgnum     : String;
    FDeptcode   : String;
    Fdeptname   : String;

    procedure SqlOpen;
  public
    //  Tuxedo Component BeforeCall Event 처리변수
    Query1_Pmax : String;
    Query1_Prfd : String;
    Query1_Psfd : array of String;

    FCloseYn    : Boolean;

    Edit      : TOnWinPopupEdit;

    property OrgDeptList  : string        read FOrgDeptList  write FOrgDeptList;
    property orgnum       : string        read FOrgnum       write FOrgnum;
    property deptcode     : string        read Fdeptcode     write Fdeptcode;
    property deptname     : string        read Fdeptname     write Fdeptname;
  end;

var
  Fm_DestValue_dept : TFm_DestValue_dept;

implementation
uses  PIT203000;
{$R *.DFM}

procedure TFm_DestValue_dept.FormCreate(Sender: TObject);
begin
  FStart        := True;
  FCloseYn      := False;
end;

procedure TFm_DestValue_dept.FormShow(Sender: TObject);
begin
  if FStart then
  begin
    FStart := not FStart;
    Edit_see_orgnum.Text := Orgnum;
    FOrgdeptList         := OrgdeptList;
    SqlOpen;
  end;
end;
//---------------------------------------------------------------------------------
procedure TFm_DestValue_dept.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;

  Action := caFree;
end;
//---------------------------------------------------------------------------------
procedure TFm_DestValue_dept.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
  begin
    Releasecapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;
//---------------------------------------------------------------------------------
procedure TFm_DestValue_dept.Sb_CloseClick(Sender: TObject);
begin
  FCloseYn := True;
  Fdeptcode := '';
  Fdeptname := '';
  Edit.PopupForm.ClosePopup(False);
end;
//---------------------------------------------------------------------------------
procedure TFm_DestValue_dept.Sb_OkClick(Sender: TObject);
begin
  FOrgnum    := Query1.FieldByName('orgnum').AsString;
  Fdeptcode  := Query1.FieldByName('deptcode').AsString;
  Fdeptname  := Query1.FieldByName('deptname').AsString;
  FCloseYn   := False;
  Edit.PopupForm.ClosePopup(False);
end;
//---------------------------------------------------------------------------------
procedure TFm_DestValue_dept.SqlOpen;
var
  i       : integer;
  Field   : TField;
  sDeptcode, sDeptname, SqlText : string;
begin
  if trim(Edit_see.text) = '' then
  begin
    sDeptcode := Edit_see.text+'%';
    sDeptname := Edit_see.text+'%';
  end
  else
  begin
    sDeptcode := Edit_see.text+'%';
    sDeptname := '%'+Edit_see.text+'%';
  end;

//  if FOrgDeptList = '' then
    SqlText :=
     Format('SELECT                                                           '+
            ' nvl(       a.orgnum      ,'' '') orgnum    ,                    '+
            ' nvl(       a.deptcode    ,'' '') deptcode  ,                    '+
            ' nvl(       b.deptname    ,'' '') deptname                       '+
            'FROM   pischndept a, pycdept b                                   '+
            'where  a.deptcode = b.deptcode                                   '+
            '  and  a.orgnum   = b.orgnum                                     '+
            '  and (a.deptcode like ''%s'' or  upper(b.deptname) like ''%s'') '+
            '  and  nvl(a.conyn,''N'')  = ''Y''                               '+
            '  and  nvl(a.closeyn,''N'')  = ''N''                             '+
            '  and  a.monum  = ''%s''                                         '+
            'ORDER BY  deptcode                                               ',
            [sDeptcode, sDeptname, MainForm.gsMonum])   ;

//      edit1.Text := SqlText;

{     Format('SELECT  '+
            ' nvl(       d.orgnum      ,'' '') orgnum     , '+
            ' nvl(       d.deptcode    ,'' '') deptcode   , '+
            ' nvl(       d.deptname    ,'' '') deptname     '+
            'FROM  pycdept d, pimvari v                     '+
            'WHERE d.existon = ''1'' and d.chanmode < ''3'' '+
            '  and v.gubun = ''00'' and v.sgubun = ''0001'' '+
            '  and d.orgnum = nvl(''%s'',value1)            '+
            '  and (d.deptcode like ''%s'' or  upper(deptname) like ''%s'') '+
            'ORDER BY  deptcode                             ',
            [Edit_see_orgnum.text, sDeptcode, sDeptname])
}
//  else
//    SqlText :=
{     Format('SELECT  '+
            ' nvl(       d.orgnum      ,'' '') orgnum     , '+
            ' nvl(       d.deptcode    ,'' '') deptcode   , '+
            ' nvl(       d.deptname    ,'' '') deptname     '+
            'FROM  pycdept d                                '+
            'WHERE d.existon = ''1'' and d.chanmode < ''3'' '+
            '  and (orgnum, deptcode) IN (%s)               '+
            'ORDER BY  deptcode                             ',
            [FOrgDeptList]);
 }

  with Query1 do
  begin
    Close;
    ClearFieldInfo;
    AddField('ORGNUM'       , ftString,  3 );
    AddField('DEPTCODE'     , ftString,  6 );
    AddField('DEPTNAME'     , ftString,  60);
    Sql.clear;
    //ServiceName := 'SPIT2030S1';
    Sql.Text := Sqltext;
    ServiceName := 'PIT2030A_SEL1';
    Open;
  end;

  for i := 0 to Query1.FieldCount - 1 do
  begin
    Field := Query1.Fields[i];
    Field.Visible := False;
    case Field.Index of
      1 : begin
            Field.Alignment    := taCenter;
            Field.Visible      := True;
            Field.DisplayWidth := 14;
            Field.DisplayLabel := '부서코드';
          end;
      2 : begin
            Field.Visible      := True;
            Field.DisplayWidth := 42;
            Field.DisplayLabel := '부 서 명';
          end;
    end;
  end;
//  Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,98) + 36;
  Grid1.SetFocus;
end;

procedure TFm_DestValue_dept.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Key := #0;
    Sb_OkClick(Sender);
  end;
end;

procedure TFm_DestValue_dept.Edit_seeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SqlOpen ;
  end;

end;

procedure TFm_DestValue_dept.Sb_runClick(Sender: TObject);
begin
  SqlOpen ;
end;

procedure TFm_DestValue_dept.Grid1DblClick(Sender: TObject);
begin
  Sb_OkClick(Sender);
end;

end.
