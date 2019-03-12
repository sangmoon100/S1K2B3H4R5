unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, func,
  OnPopupEdit, OnTmaxPersonEdit;

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
    E_Search: TTMaxPersonPopupEdit;
    Sb_search: TOnFocusButton;
    L_Sum: TLabel;
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure Sb_searchClick(Sender: TObject);
    procedure RG_SortClick(Sender: TObject);
  private
    { Private declarations }
    FOrgDept  : string;
    Fempno    : string;
    Fkorname  : string;
    SqlText   : string;
    v_Dept    : String;
    v_Payra   : String;
    v_PayraYN : String;
    v_OrgNum : String;
  public
    Edit      : TOnWinPopupEdit;

    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses   PET2050A1;
{$R *.DFM}

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
  Fempno   := '';
  Fkorname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
  FM_MAIN.E_empno.Text             := Query1.FieldByName('empno').AsString;
  FM_MAIN.L_korname.ValueCaption   := Query1.FieldByName('korname').AsString;
  FM_MAIN.L_Deptname.ValueCaption  := Query1.FieldByName('DEPTNAME').AsString;
  FM_MAIN.L_payraname.ValueCaption := Query1.FieldByName('PAYRA').AsString;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
begin
  with Query1 do
  begin
    SqlText := ' SELECT DEPTCODE,  SUBSTRB(A.PAYRA,1,1) PAYRA, ' +
               '        A.PAYRAYN, ORGNUM, '''' F5 ' +
               ' from PIMPMAS A where A.EMPNO = '''+FM_MAIN.v_empno+''' ' ;

    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('DEPTCODE', ftString, 100);
    AddField('PAYRA'   , ftString, 100);
    AddField('PAYRAYN' , ftString, 100);
    AddField('ORGNUM'  , ftString, 100);
    AddField('F5'      , ftString, 100);

    Close;
    SQL.Clear;
    SQL.Text := SqlText;
    Open;

    if RecordCount > 0 then
    begin
      v_Dept    := Fields[0].AsString;
      v_Payra   := Fields[1].AsString;
      v_PayraYN := Fields[2].AsString;
      v_OrgNum  := Fields[3].AsString;
    End
    Else
    Begin

    End;
  end;

  SqlText := ' SELECT EMPNO , KORNAME,                                                                    ' +
             '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I114'' AND CODENO = A.PSTATE) PSTATE, ' +
             '        B.DEPTNAME,                                                                         ' +
             '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = A.PAYRA ) PAYRA,  ' +
             '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO = A.PAYCL ) BAND,   ' +
             '        '''' F7, '''' F8, '''' F9, '''' F10   ' +
             ' FROM  PIMPMAS A, PYCDEPT B    ' +
             ' WHERE A.ORGNUM   = B.ORGNUM   ' +
             '   AND A.DEPTCODE = B.DEPTCODE ' +
             '   AND A.PAYCL    = ''H10''    ' +
             '   AND A.PSTATE < ''80''  ';

  if (v_PayraYN = 'Y') Then  //보임여부
  Begin
    SqlText := SqlText + ' AND (A.DEPTCODE LIKE REPLACE('''+ v_Dept +''' ,''0'','''') || ''%'') ';
  End
  Else
  Begin
    SqlText := SqlText + ' AND EMPNO = '''+FM_MAIN.v_empno+''' ' ;
  End;

  If Trim(E_Search.Text) <> '' Then
    SqlText := SqlText + 'AND ((A.EMPNO LIKE '''+E_Search.Text + '%'+''')  OR ( A.KORNAME LIKE  '''+E_Search.Text + '%'+''' )) ';
  SqlText := SqlText + 'ORDER  BY A.DEPTCODE ASC, A.PAYRA, A.EMPNO ' ;

  with Query1 do
  begin
    Close;
    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 100);
    AddField('KORNAME' , ftString, 100);
    AddField('PSTATE  ', ftString, 100);
    AddField('DEPTNAME', ftString, 100);
    AddField('PAYRA'   , ftString, 100);
    AddField('BAND'    , ftString, 100);
    AddField('F7'      , ftString, 100);
    AddField('F8'      , ftString, 100);
    AddField('F9'      , ftString, 100);
    AddField('F10'     , ftString, 100);
    Sql.Clear;
    Sql.Text := SqlText;
    memo1.text :=  SqlText;
    ServiceName := 'HINSA_select10';
    Open;

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
        2 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 10;
              Field.DisplayLabel := '인사상태';
            end;
        3 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 25;
              Field.DisplayLabel := '평가부서명';
            end;
        4:  begin
              Field.Visible      := True;
              Field.DisplayWidth := 10;
              Field.DisplayLabel := '직 책';
            end;
        5:  begin
              Field.Visible      := True;
              Field.DisplayWidth := 14;
              Field.DisplayLabel := 'BAND';
            end;
      end;
    End;
    L_Sum.Caption := '조회결과 : '+IntToStr(RecordCount)+' 건';
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
procedure TFm_EmpForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(13) then
  begin
    Key := #0;
    Sb_searchClick(Sender);
  end;
end;

procedure TFm_EmpForm.Sb_searchClick(Sender: TObject);
begin
  SqlOpen;
  Grid1.SetFocus;
end;

procedure TFm_EmpForm.RG_SortClick(Sender: TObject);
begin
  SqlOpen;
end;

end.
