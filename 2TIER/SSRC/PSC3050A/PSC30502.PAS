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
unit psc30502;

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
    Query1EMPNO: TStringField;
    Query1KORNAME: TStringField;
    Query1DIVSEQNUM: TFloatField;
    Query1STCLASS: TStringField;
    Query1stclassNAME: TStringField;
    Query1CORPNAME: TStringField;
    Query1CODENAME: TStringField;
    Query1STLORG: TStringField;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
    procedure BBchkoutClick(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    //Send
    GIcloseS: Integer;
    GSempnoS: String;
    GSkornameS: String;
    GScorpname: String;
    GSdivseqnumI: Real;
    GSstclassS: String;
    GSstlorg  : string;
  end;

var
  Fkyempno: TFkyempno;

implementation
{$R *.DFM}

uses
  psc30501;

procedure TFkyempno.Retrieve;
var
  First_where: Boolean;
begin
(*
  Application.ProcessMessages;   
  First_where := True;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD('SELECT EMPNO, KORNAME, CORPNAME, DIVSEQNUM, STCLASS, CODENAME, STLORG ');
  Query1.SQL.ADD('FROM PSLMAS, PYCCODE ');
  Query1.SQL.ADD('WHERE (CODEID = ''K910'' AND STLORG = CODENO(+)) ');
  if Eempno.Text <> '' then
  begin
    Query1.SQL.ADD('and (EMPNO LIKE :empno OR KORNAME LIKE :empno) ') ;
    Query1.ParamByName('empno').AsString := Eempno.Text + '%';
    First_where := False;
  end;
  if MainForm.NE_divseqnum.Value > 0 then
  begin
    if First_where = True then
      Query1.SQL.ADD('')
    else
      Query1.SQL.ADD('  and ');
    Query1.SQL.ADD('(DIVSEQNUM = '+FloatToStr(MainForm.NE_divseqnum.Value)+') ') ;
    First_where := False;
  end;
  if MainForm.CB_stclass.Text <> '' then
  begin
    if First_where = True then
      Query1.SQL.ADD('')
    else
      Query1.SQL.ADD('  and ');
    Query1.SQL.ADD('(STCLASS = '''+Copy(MainForm.CB_stclass.Text,1,1)+''') ') ;
  end;

  If RB1.Checked then
    Query1.SQL.ADD('ORDER BY EMPNO, KORNAME, CORPNAME DESC, DIVSEQNUM DESC ')
  else
    Query1.SQL.ADD('ORDER BY KORNAME, EMPNO, CORPNAME DESC, DIVSEQNUM DESC ');
  Query1.Open;
*)  
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
  GSempnoS     := Query1EMPNO.AsString;
  GSkornameS   := Query1KORNAME.AsString;
  GScorpname   := Query1CorpName.AsString;
  GSdivseqnumI := Query1DIVSEQNUM.AsFloat;
  GSstclassS   := Query1STCLASS.AsString;
  GSstlorg     := Query1STLORG.AsString;
  GIcloseS := 0;
  Close;
end;

procedure TFkyempno.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
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

procedure TFkyempno.Query1CalcFields(DataSet: TDataSet);
begin
  // 주식구분
  if Query1STCLASS.AsString = '1' then
    Query1stclassNAME.AsString := '사주우선'
  else if Query1STCLASS.AsString = '2' then
    Query1stclassNAME.AsString := '사주실권'
  else if Query1STCLASS.AsString = '3' then
    Query1stclassNAME.AsString := '주주우선'
  else if Query1STCLASS.AsString = '4' then
    Query1stclassNAME.AsString := '주주우선(예탁)'
  else if Query1STCLASS.AsString = '5' then
    Query1stclassNAME.AsString := '주주우선(비예탁)'
  else
    Query1stclassNAME.AsString := '';
end;

end.
