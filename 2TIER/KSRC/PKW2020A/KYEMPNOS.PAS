{-------------------------------------------------------------------------------
 PROGRAM NAME : LIBRARY KyempnoS (KyempnoS.Pas)
 AUTHOR       : 허  철  행
 DATE         : 1996. 0. 0
 HISTORY      : 1996. 0. 0 / 허철행 /
 COMMENT      : XX화일의 사번,성명,조직차수,부서코드 조회
 USER LIBRARY :
-------------------------------------------------------------------------------
EXAMPLE :
procedure TFsample.Button1Click(Sender: TObject);
begin
     FkyempnoS := TFkyempnoS.Create(Self);
     Try
       FkyempnoS.GSfromR := 'pimpmas';
       FkyempnoS.Eempno.Text := Eempno.Text;
       FkyempnoS.ShowModal;
       If FkyempnoS.GIcloseS = 0 then begin
         Eempno.Text := FkyempnoS.GSempnoS;
         Pkorname.Caption := ' '+FkyempnoS.GSkornameS;
       end;
     Finally
       FkyempnoS.Free;
     end;
end;
-------------------------------------------------------------------------------}
unit kyempnoS;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls;

type
  TFkyempnoS = class(TForm)
    Query1: TQuery;
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    Query1EMPNO: TStringField;
    Query1KORNAME: TStringField;
    RB1: TRadioButton;
    RB2: TRadioButton;
    Query1ORGNUM: TStringField;
    Query1DEPTCODE: TStringField;
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
    GSorgnum : String;
    GSdeptcode : String;
    GSfromR : String;
  end;

var
  FkyempnoS: TFkyempnoS;

implementation

{$R *.DFM}

procedure TFkyempnoS.Retrieve;
var
   LSfrom : string;
begin
     LSfrom := 'FROM '+GSfromR;
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT EMPNO, KORNAME,ORGNUM ,DEPTCODE  ');
     If GSfromR = '' then
      Query1.SQL.ADD('   FROM PKMPMAS ')
     else
      Query1.SQL.ADD(LSfrom);
     If Eempno.Text <> '' then begin
        Query1.SQL.ADD(' WHERE EMPNO LIKE :empno ');
        Query1.SQL.ADD('    OR KORNAME LIKE :empno ');
        Query1.ParamByName('empno').AsString := Eempno.Text + '%';
     end;
     If RB1.Checked then
       Query1.SQL.ADD('  ORDER BY EMPNO, KORNAME ')
     else
       Query1.SQL.ADD('  ORDER BY KORNAME, EMPNO ');
     Query1.Open;
end;

procedure TFkyempnoS.FormActivate(Sender: TObject);
begin
     Retrieve;
end;

procedure TFkyempnoS.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFkyempnoS.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFkyempnoS.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        Retrieve;
     end;

end;

procedure TFkyempnoS.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS := Query1.FieldByName('empno').AsString;
     GSkornameS := Query1.FieldByName('korname').AsString;
     GSorgnum := Query1.FieldByName('orgnum').AsString;
     GSdeptcode := Query1.FieldByName('deptcode').AsString;
     GIcloseS := 0;
     Close;
end;

procedure TFkyempnoS.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(FkyempnoS);
     end;
end;

procedure TFkyempnoS.RB1Click(Sender: TObject);
begin
     Retrieve;
     Eempno.SetFocus;
end;

end.
