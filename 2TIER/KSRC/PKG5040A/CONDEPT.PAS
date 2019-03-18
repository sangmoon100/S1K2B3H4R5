unit ConDept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnShapeLabel, Grids, DBGrids, peoutlookbtn, Db, DBTables,
  StdCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,FormMon1,
  OnFocusButton, MemDS, DBAccess, Ora;    //Calen2 ==> FormMon1   교체..

type
  TFConDept = class(TForm)
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    BE_Date1: TOnButtonEdit;
    BT_Search: TOnFocusButton;
    Bt_Exit: TOnFocusButton;
    E_orgnum: TEdit;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    procedure Bt_ExitClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BT_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BE_Date1ButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    procedure GridSelect1;
    procedure GridSelect2;
    { Public declarations }
  end;

var
  FConDept: TFConDept;

implementation

uses PKG5040A1;

{$R *.DFM}

procedure TFConDept.Bt_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFConDept.DBGrid1CellClick(Column: TColumn);
begin
    GridSelect2;
end;

procedure TFConDept.GridSelect1;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with DBGrid1, OraQuery1 do
  begin
    Close;
    Sql.Clear;

    sSql :=
     'select 					   		                '+#13+
     '      distinct substr(A.DEPTCODE,1,4) deptcode,                           '+#13+
     '      (select deptname from pycdept where deptcode = A.deptcode) 부서명,  '+#13+
     '      (select korname from pimpmas                                        '+#13+
//infra 팀장     '       where ORGNUM = '''+E_orgnum.Text+''' and PAYRA = ''2C''            '+#13+
     '       where ORGNUM = '''+E_orgnum.Text+''' and PAYRA = ''C11''           '+#13+
     '	     and substr(DEPTCODE,1,4) = substr(A.DEPTCODE,1,4)) 팀장            '+#13+
     'FROM PKHDUTY A                                                            '+#13+
     'WHERE A.ORGNUM = '''+E_orgnum.Text+'''     and                            '+#13+
     '  DECODE(A.DD1,''06'',1,0)+DECODE(A.DD2,''06'',1,0)+DECODE(A.DD3,''06'',1,0)+DECODE(A.DD4,''06'',1,0)+DECODE(A.DD5,''06'',1,0)+'+#13+
     '  DECODE(A.DD6,''06'',1,0)+DECODE(A.DD7,''06'',1,0)+DECODE(A.DD8,''06'',1,0)+DECODE(A.DD9,''06'',1,0)+DECODE(A.DD10,''06'',1,0)+'+#13+
     '  DECODE(A.DD11,''06'',1,0)+DECODE(A.DD12,''06'',1,0)+DECODE(A.DD13,''06'',1,0)+DECODE(A.DD14,''06'',1,0)+DECODE(A.DD15,''06'',1,0)+'+#13+
     '  DECODE(A.DD16,''06'',1,0)+DECODE(A.DD17,''06'',1,0)+DECODE(A.DD18,''06'',1,0)+DECODE(A.DD19,''06'',1,0)+DECODE(A.DD20,''06'',1,0)+'+#13+
     '  DECODE(A.DD21,''06'',1,0)+DECODE(A.DD22,''06'',1,0)+DECODE(A.DD23,''06'',1,0)+DECODE(A.DD24,''06'',1,0)+DECODE(A.DD25,''06'',1,0)+'+#13+
     '  DECODE(A.DD26,''06'',1,0)+DECODE(A.DD27,''06'',1,0)+DECODE(A.DD28,''06'',1,0)+DECODE(A.DD29,''06'',1,0)+DECODE(A.DD30,''06'',1,0)+'+#13+
     '  DECODE(A.DD31,''06'',1,0) > 0                                                                                                           '+#13+
     '  AND A.DUYYMM = '''+ sYYMM +'''                                                                                                                   '+#13+
     '  AND NVL(A.CONYN,''N'') = ''N''                                                                                                          '+#13+
     'ORDER BY  substr(A.DEPTCODE,1,4)                                        ';
    SQL.Add(sSql);
    Open;
  end;
  DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TFConDept.GridSelect2;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with DBGrid2, OraQuery2 do
  begin
    Close;
    Sql.Clear;

    sSql :=
     'select DECODE(NVL(a.conyn,''N''),''Y'',''결재완료'',''미결재'') 결재상태, '+#13+
     '       empno    사번,				                        '+#13+
     '	     korname  이름,                                                     '+#13+
     '	     deptcode 부서                                                      '+#13+
     'FROM PKHDUTY A                                                            '+#13+
     'WHERE A.ORGNUM = '''+ E_orgnum.text +''' and                                              '+#13+
     '  DECODE(A.DD1,''06'',1,0)+DECODE(A.DD2,''06'',1,0)+DECODE(A.DD3,''06'',1,0)+DECODE(A.DD4,''06'',1,0)+DECODE(A.DD5,''06'',1,0)+'+#13+
     '  DECODE(A.DD6,''06'',1,0)+DECODE(A.DD7,''06'',1,0)+DECODE(A.DD8,''06'',1,0)+DECODE(A.DD9,''06'',1,0)+DECODE(A.DD10,''06'',1,0)+'+#13+
     '  DECODE(A.DD11,''06'',1,0)+DECODE(A.DD12,''06'',1,0)+DECODE(A.DD13,''06'',1,0)+DECODE(A.DD14,''06'',1,0)+DECODE(A.DD15,''06'',1,0)+'+#13+
     '  DECODE(A.DD16,''06'',1,0)+DECODE(A.DD17,''06'',1,0)+DECODE(A.DD18,''06'',1,0)+DECODE(A.DD19,''06'',1,0)+DECODE(A.DD20,''06'',1,0)+'+#13+
     '  DECODE(A.DD21,''06'',1,0)+DECODE(A.DD22,''06'',1,0)+DECODE(A.DD23,''06'',1,0)+DECODE(A.DD24,''06'',1,0)+DECODE(A.DD25,''06'',1,0)+'+#13+
     '  DECODE(A.DD26,''06'',1,0)+DECODE(A.DD27,''06'',1,0)+DECODE(A.DD28,''06'',1,0)+DECODE(A.DD29,''06'',1,0)+DECODE(A.DD30,''06'',1,0)+'+#13+
     '  DECODE(A.DD31,''06'',1,0) > 0                                                                                                     '+#13+
     '  AND A.DUYYMM = '''+sYYMM+'''                                                                                                      '+#13+
     '  AND NVL(A.CONYN,''N'') = ''N''                                                                                                    '+#13+
     '  AND substr(A.DEPTCODE,1,4) = '''+ OraQuery1.fieldbyname('deptcode').asstring+'''                                                      ';
    SQL.Add(sSql);
    Open;
  end;
end;

procedure TFConDept.BT_SearchClick(Sender: TObject);
begin
   GridSelect1;
end;

procedure TFConDept.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   OraQuery1.close;
   OraQuery2.close;
end;

procedure TFConDept.BE_Date1ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try 
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
        BE_Date1.Text := Copy(MonthForm.DayCaption,1,4)+' - '+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;

{    Try
        Calendar2 := TCalendar2.Create(Self);
        Calendar2.ShowModal;
        BE_Date1.Text := Copy(Calendar2.Gsym,1,4)+' - '+Copy(Calendar2.Gsym,5,2);
    Finally
        Calendar2.Free;
    End;               }
end;

end.
