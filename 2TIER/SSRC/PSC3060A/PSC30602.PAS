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
unit psc30602;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls;

type
  TFkyempno = class(TForm)
    Query1: TQuery;
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    RB1: TRadioButton;
    RB2: TRadioButton;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
    procedure BBchkoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Send
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSpayclS : String;
    GSdeptcodeS : String;
    GSdeptnameS : String;
  end;

var
  Fkyempno: TFkyempno;

implementation
{$R *.DFM}

procedure TFkyempno.Retrieve;
begin
// 일시수정(업무순서때문: 예탁인출 후 대부상환이 이루어져야 하나 반대로 실시)
{  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT a.EMPNO, a.KORNAME, b.PAYCL, b.DEPTCODE, c.DEPTNAME ');
  Query1.SQL.Add('FROM PSSTMAS a, PKMPMAS b, PYCDEPT c ');
  if Eempno.Text <> '' then
  begin
    Query1.SQL.ADD('WHERE (a.EMPNO LIKE :empno OR a.KORNAME LIKE :empno) and ');
    Query1.ParamByName('empno').AsString := Eempno.Text + '%';
  end
  else
  begin
    Query1.SQL.ADD('WHERE ');
  end;
  Query1.SQL.Add('      (a.EMPNO = b.EMPNO) and ');
  Query1.SQL.Add('      (b.ORGNUM   = c.ORGNUM(+)) and ');
  Query1.SQL.Add('      (b.DEPTCODE = c.DEPTCODE(+)) ');

  if RB1.Checked then
    Query1.SQL.ADD('  ORDER BY a.EMPNO, a.KORNAME ')
  else
    Query1.SQL.ADD('  ORDER BY a.KORNAME, a.EMPNO ');
  Query1.Open;     }
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT b.EMPNO, b.KORNAME, b.PAYCL, b.DEPTCODE, c.DEPTNAME ');
  Query1.SQL.Add('FROM PIMPMAS b, PYCDEPT c ');
  if Eempno.Text <> '' then
  begin
    Query1.SQL.ADD('WHERE (b.EMPNO LIKE :empno OR b.KORNAME LIKE :empno) and ');
    Query1.ParamByName('empno').AsString := Eempno.Text + '%';
  end
  else
  begin
    Query1.SQL.ADD('WHERE ');
  end;
  Query1.SQL.Add('      (b.ORGNUM   = c.ORGNUM(+)) and ');
  Query1.SQL.Add('      (b.DEPTCODE = c.DEPTCODE(+)) ');

  if RB1.Checked then
    Query1.SQL.ADD('  ORDER BY b.EMPNO, b.KORNAME ')
  else
    Query1.SQL.ADD('  ORDER BY b.KORNAME, b.EMPNO ');
  Query1.Open;
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
  GSempnoS    := Query1.FieldByName('empno').AsString;
  GSkornameS  := Query1.FieldByName('korname').AsString;
  GSpayclS    := Query1.FieldByName('paycl').AsString;
  GSdeptcodeS := Query1.FieldByName('deptcode').AsString;
  GSdeptnameS := Query1.FieldByName('deptname').AsString;
  GIcloseS := 0;
  Close;
end;

procedure TFkyempno.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(Fkyempno);
     end;
end;

procedure TFkyempno.RB1Click(Sender: TObject);
begin
     Eempno.SetFocus;
end;

procedure TFkyempno.BBchkoutClick(Sender: TObject);
begin
  DBGrid1DblClick(Sender);
end;

end.
