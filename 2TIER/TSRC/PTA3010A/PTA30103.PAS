unit PTA30103;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnPopupEdit, OnGrDBGrid,
  OnFocusButton, MemDS, DBAccess, Ora, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl;

type
  TCEduForm = class(TForm)
    DataSource1: TDataSource;
    codeGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Select: TOnFocusButton;
    BT_Close: TOnFocusButton;
    OraQuery1: TOraQuery;
    Panel2: TPanel;
    E_Search: TOnButtonEdit;
    procedure BT_CloseClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_SearchButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Edit      : TOnWinPopupEdit;
    DutyID    : String;
    FromWhere : String;
    Code      : String; {코드}
    CodeName  : String; {코드명}
    Ekind     : String; {역량코드}
    Bumoon    : String; {부문}
    Track     : String; {직무Track}
    Level     : String; {수준}

    Procedure Open_Grid;
  end;

var
  CEduForm: TCEduForm;
implementation

uses PTA30101;

{$R *.DFM}

Procedure TCEduForm.Open_Grid;
var
  sbase_yy : String;
begin
  sbase_yy := MainForm.CB_base_yyF.KeyItems[MainForm.CB_base_yyF.ItemIndex];

  with OraQuery1 do
  begin
    Close;
    Sql.Clear;

    Sql.Add(' SELECT A.EDUCODE,    A.EDUNAME,  ' );
    Sql.Add(' SUBSTR(A.EDUCODE, 1,2) CN_EKIND, ' );
    Sql.Add(' SUBSTR(A.EDUCODE, 3,1) CN_BUMOON,' );
    Sql.Add(' SUBSTR(A.EDUCODE, 4,2) CN_TRACK, ' );
    Sql.Add(' SUBSTR(A.EDUCODE, 6,2) CN_LEVEL  ' );
    Sql.Add(' FROM PEIDPCRS A ');
    Sql.Add(' WHERE A.BASE_YY  = '''+sbase_yy+''' ');
    Sql.Add(Format('AND EDUNAME like ''%s''',['%'+E_Search.Text+'%']));
    Sql.Add(' ORDER BY 1 ');

    Open;
  end;
end;

procedure TCEduForm.BT_CloseClick(Sender: TObject);
begin
  Code     := '';
  CodeName := '';
  Ekind    := '';
  Bumoon   := '';
  Track    := '';
  Level    := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TCEduForm.codeGridDblClick(Sender: TObject);
begin
  Code     := OraQuery1.FieldByName('EDUCODE').AsString ;
  CodeName := OraQuery1.FieldByName('EDUNAME').AsString ;
  Ekind    := OraQuery1.FieldByName('CN_EKIND').AsString ;
  Bumoon   := OraQuery1.FieldByName('CN_BUMOON').AsString ;
  Track    := OraQuery1.FieldByName('CN_TRACK').AsString ;
  Level    := OraQuery1.FieldByName('CN_LEVEL').AsString ;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TCEduForm.FormShow(Sender: TObject);
begin
  E_Search.Text := '';
  Open_Grid;
end;

procedure TCEduForm.E_SearchButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Open_Grid;
end;

procedure TCEduForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Open_Grid;
end;

end.
