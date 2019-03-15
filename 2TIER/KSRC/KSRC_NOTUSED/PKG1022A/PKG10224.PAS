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
unit pkg10224;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls, MemDS, DBAccess, Ora, Func;

type
  TMateForm = class(TForm)
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    RB1: TRadioButton;
    RB2: TRadioButton;
    Query1: TOraQuery;
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
  MateForm: TMateForm;

implementation

{$R *.DFM}

procedure TMateForm.Retrieve;
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT EMPNO, KORNAME, ORGNUM, DEPTCODE ');
          SQL.ADD('   FROM PKMPMAS ');
          SQL.ADD(' WHERE (MATEEMPNO IS NOT NULL) ');

          if Eempno.Text <> '' then
          begin
               SQL.ADD(' and (EMPNO LIKE :empno ');
               SQL.ADD('      OR KORNAME LIKE :empno) ');
               ParamByName('empno').AsString := Eempno.Text + '%';
          end;
          if RB1.Checked then
               SQL.ADD('  ORDER BY EMPNO, KORNAME ')
          else
               SQL.ADD('  ORDER BY KORNAME, EMPNO ');

          Open;
     end;
end;

procedure TMateForm.FormActivate(Sender: TObject);
begin
     Retrieve;
end;

procedure TMateForm.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TMateForm.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TMateForm.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        Retrieve;
     end;

end;

procedure TMateForm.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS := Query1.FieldByName('empno').AsString;
     GSkornameS := Query1.FieldByName('korname').AsString;
     GSorgnumS := Query1.FieldByName('orgnum').AsString;
     GSdeptcodeS := Query1.FieldByName('deptcode').AsString;
     GIcloseS := 0;
     Close;
end;

procedure TMateForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(Sender);
     end;
end;

procedure TMateForm.RB1Click(Sender: TObject);
begin
     Retrieve;
     Eempno.SetFocus;
end;

end.
