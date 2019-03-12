unit empno;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TEmpForm = class(TForm)
    DBGrid1: TDBGrid;
    Qry1: TQuery;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Evalue: TEdit;
    BBrun: TBitBtn;
    BBSelect: TBitBtn;
    BB_Cancel: TBitBtn;
    Qry1EMPNO: TStringField;
    Qry1KORNAME: TStringField;
    Qry1CODENAME: TStringField;
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBSelectClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure EvalueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    InValue    : String;
    OUTEmpNO   : String[04];
    OutKorName : String;
    Procedure  OpenGrid (InValue : String);
  end;

var
  EmpForm: TEmpForm;

implementation

{$R *.DFM}

Procedure TEmpForm.OpenGrid (InValue : String);
begin
     Application.ProcessMessages;
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EMPNO, KORNAME, CODENAME                        ' );
     Qry1.Sql.Add( ' FROM   PIMPMAS, PYCCODE                                ' );
     Qry1.Sql.Add( ' WHERE  (EMPNO LIKE :invalue OR KORNAME LIKE :invalue)  ' );
     Qry1.Sql.Add( '        AND (PSTATE(+) = CODENO AND CODEID = ''I114'')  ' );
     Qry1.Sql.Add( ' ORDER  BY EMPNO, KORNAME                               ' );
     Qry1.ParamByName('invalue').AsString := InValue + '%';
     Qry1.Open;

     if Qry1.Eof then begin
        OutEmpNO   := '';
        OutKorName := '';
        Qry1.Close;
     end;
end;

procedure TEmpForm.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
     if gdSelected in state then
        begin
             OutEmpNo   := Qry1.FieldByName('EmpNo').AsString;
             OutKorName := Qry1.FieldByName('KorName').AsString;
        end;
end;

procedure TEmpForm.FormActivate(Sender: TObject);
begin
     Screen.Cursor := CrHourGlass;
     OpenGrid(InValue);
     Screen.Cursor := CrDefault;
end;

procedure TEmpForm.DBGrid1DblClick(Sender: TObject);
begin
     Close;
end;

procedure TEmpForm.BBSelectClick(Sender: TObject);
begin
    Close;
end;

procedure TEmpForm.BBrunClick(Sender: TObject);
begin
     Screen.Cursor := CrHourGlass;
     OpenGrid(EValue.Text);
     Screen.Cursor := CrDefault;
     DBGrid1.SetFocus;
end;

procedure TEmpForm.BB_CancelClick(Sender: TObject);
begin
     OutEmpNo   := '';
     OutKorName := '';
     Close;
end;

procedure TEmpForm.EvalueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        OpenGrid(EValue.Text);
end;

procedure TEmpForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        Close;
end;

end.
