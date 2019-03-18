unit Kempno;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,
  MemDS, DBAccess, Ora;

type
  TFempno = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel4: TPanel;
    E_Value: TEdit;
    BB_Run: TBitBtn;
    BB_Select: TBitBtn;
    BB_Cancel: TBitBtn;
    Qry1: TOraQuery;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BB_SelectClick(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure E_ValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    empno, paydate : string;
    pempno   : string;
    pkorname : string;
    Procedure  OpenGrid(empno : String);
  end;

var
  Fempno: TFempno;

implementation

{$R *.DFM}

Procedure TFempno.OpenGrid(empno : String);
begin
     Application.ProcessMessages;
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EMPNO, KORNAME      ' );
     Qry1.Sql.Add( ' FROM   PKMIGPAY        ' );
     Qry1.Sql.Add( ' WHERE  (EMPNO LIKE :invalue OR KORNAME LIKE :invalue)  ' );
     Qry1.Sql.Add( ' AND    paydate = ''' + paydate + ''' AND substr(empno,1,1)=''Y'' ');
     Qry1.Sql.Add( ' ORDER  BY EMPNO, KORNAME                               ' );
     Qry1.ParamByName('invalue').AsString := empno + '%';
     Qry1.Open;

     if Qry1.Eof then begin
        pempno  := '';
        pkorname:= '';
        Qry1.Close;
     end;
end;

procedure TFempno.FormActivate(Sender: TObject);
begin
     Screen.Cursor := CrHourGlass;
     OpenGrid(empno);
     Screen.Cursor := CrDefault;
end;

procedure TFempno.DBGrid1DblClick(Sender: TObject);
begin
     Close;
end;

procedure TFempno.BB_SelectClick(Sender: TObject);
begin
    Close;
end;

procedure TFempno.BB_RunClick(Sender: TObject);
begin
     Screen.Cursor := CrHourGlass;
     OpenGrid(E_Value.Text);
     Screen.Cursor := CrDefault;
     DBGrid1.SetFocus;
end;

procedure TFempno.BB_CancelClick(Sender: TObject);
begin
     pempno   := '';
     pkorname := '';
     Close;
end;

procedure TFempno.E_ValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        OpenGrid(E_Value.Text);
end;

procedure TFempno.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        Close;
end;

procedure TFempno.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     pempno   := Qry1.FieldByName('EmpNo').AsString;
     pkorname := Qry1.FieldByName('KorName').AsString;
end;

end.
