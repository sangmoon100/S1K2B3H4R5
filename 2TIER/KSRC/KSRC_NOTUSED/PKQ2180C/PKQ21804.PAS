{-------------------------------------------------------------------------------
 PROGRAM NAME : LIBRARY Kyempno (Kyempno.Pas)
 AUTHOR       : 허  철  행
 DATE         : 1996. 0. 0
 HISTORY      : 1996. 0. 0 / 허철행 /
 COMMENT      : 급여마스터화일의 사번,성명,조직차수,부서코드 조회
 USER LIBRARY :
-------------------------------------------------------------------------------
EXAMPLE :
procedure TFsample.Button1Click(Sender: TObject);
begin
     Fkyempno := TFkyempno.Create(Self);
     Try
       Fkyempno.ShowModal;
       If Fkyempno.GIcloseS = 0 then begin
         Eempno.Text := Fkyempno.GSempnoS;
         Pkorname.Caption := ' '+Fkyempno.GSkornameS;
       end;
     Finally
       Fkyempno.Free;
     end;
end;
-------------------------------------------------------------------------------}
unit pkq21804;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls, MemDS, DBAccess, Ora;

type
  TFkyempno = class(TForm)
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    RB1: TRadioButton;
    RB2: TRadioButton;
    OraQuery1: TOraQuery;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Send
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSorgnumS : String;
    GSdeptcodeS : String;
  end;

var
  Fkyempno: TFkyempno;

implementation

uses pkq21801;

{$R *.DFM}

procedure TFkyempno.Retrieve;
begin

     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select empno, korname        ');
          SQL.Add('  from pkmpmas               ');
          if Eempno.Text <> '' then
          begin
               SQL.Add(' where ((empno like :p_empno) or (korname like :p_empno)) ');
               ParamByName('p_empno').AsString := Eempno.Text+'%';
          end;

          if RB1.Checked then SQL.Add(' order by empno, korname     ')
          else                SQL.Add(' order by korname, empno     ');

          Open;
     end;

end;

procedure TFkyempno.FormActivate(Sender: TObject);
begin
     Retrieve;
end;

procedure TFkyempno.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFkyempno.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFkyempno.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          Retrieve;
     end;
end;

procedure TFkyempno.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS := OraQuery1.FieldByName('empno').AsString;
     GSkornameS := OraQuery1.FieldByName('korname').AsString;
     GIcloseS := 0;
     Close;
end;

procedure TFkyempno.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          key := #0;
          DBGrid1DblClick(Fkyempno);
     end;
end;

procedure TFkyempno.RB1Click(Sender: TObject);
begin
     Eempno.SetFocus;
end;

end.
