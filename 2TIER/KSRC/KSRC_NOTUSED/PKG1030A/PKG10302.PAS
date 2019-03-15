unit pkg10302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    Qp1: TQuery;
    Panel2: TPanel;
    BBsrch: TBitBtn;
    BitBtn3: TBitBtn;
    BBexit: TBitBtn;
    DBGrid1: TDBGrid;
    Qp1EMPNO: TStringField;
    Qp1KORNAME: TStringField;
    Qp1ORGNUM: TStringField;
    Qp1DEPTCODE: TStringField;
    Qp1Deptnm: TStringField;
    QueryB: TQuery;
    QueryBDEPTNAME: TStringField;
    procedure Qp1CalcFields(DataSet: TDataSet);
    procedure BBexitClick(Sender: TObject);
    procedure BBsrchClick(Sender: TObject);
  private
    Procedure Qp1_LoadData;
    Function DeptA(Orgnum, DeptCode : String) : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

{}
Procedure TForm2.Qp1_LoadData;
begin
     Qp1.Close;
     Qp1.SQL.Clear;
     Qp1.SQL.ADD(' SELECT DISTINCT(PKMPMAS.EMPNO), PKMPMAS.KORNAME,   ');
     Qp1.SQL.ADD('        PKMPMAS.ORGNUM, PKMPMAS.DEPTCODE            ');
     Qp1.SQL.ADD('   FROM DPER.PKMPMAS ,DPER.PKMFMAPP ,DPER.PIMFAMI        ');
     Qp1.SQL.ADD('  WHERE ( PKMPMAS.EMPNO NOT IN PKMFMAPP.EMPNO ) AND ');
     Qp1.SQL.ADD('        ( PKMPMAS.EMPNO IN PIMFAMI.EMPNO )          ');
     Qp1.Open;

end;

{}
procedure TForm2.Qp1CalcFields(DataSet: TDataSet);
begin
     Qp1.FieldByName('Deptnm').AsString := DeptA(Qp1.FieldByName('orgnum').AsString,
                                                 Qp1.FieldByName('deptcode').AsString);
end;

{부서를 불러오는 함수..........................................................}
Function TForm2.DeptA(Orgnum, DeptCode : String) : String;
begin
     DeptA := '';
     QueryB.Close;
     QueryB.SQL.Clear;
     QueryB.SQL.ADD(' SELECT DEPTNAME             ');
     QueryB.SQL.ADD('   FROM DPER.PYCDEPT         ');
     QueryB.SQL.ADD('  WHERE ORGNUM = :orgnum AND ');
     QueryB.SQL.ADD('        DEPTCODE = :deptcode ');
     QueryB.ParamByName('orgnum').AsString   := Orgnum;
     QueryB.ParamByName('deptcode').AsString := DeptCode;
     QueryB.Open;

     if QueryB.Recordcount > 0 then  DeptA := QueryBDEPTNAME.AsString
                               else  DeptA := '코드에러';
    { DeptA := QueryB.FieldByName('deptname').AsString;}
end;

{}
procedure TForm2.BBexitClick(Sender: TObject);
begin
  Close;
end;

{}
procedure TForm2.BBsrchClick(Sender: TObject);
begin
     Qp1_LoadData;
end;

end.



