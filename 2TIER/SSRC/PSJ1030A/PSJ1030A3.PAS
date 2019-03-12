unit PSJ1030A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, OnFocusButton, ExtCtrls, OnShapeLabel, TeEngine,
  Series, TeeProcs, Chart, DBChart, Db, MemDS, DBAccess, Ora;

type
  TChartForm = class(TForm)
    SF_Main: TOnSchemeForm;
    L_dept: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    L_empno: TOnShapeLabel;
    DBChart1: TDBChart;
    Series2: TLineSeries;
    OraMed1: TOraQuery;
    OraMed1VALUE006: TIntegerField;
    OraMed1VALUE007: TIntegerField;
    DBChart3: TDBChart;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    OraHis1: TOraQuery;
    OraMed1MEDIYEAR: TStringField;
    DBChart2: TDBChart;
    LineSeries1: TLineSeries;
    DBChart4: TDBChart;
    LineSeries4: TLineSeries;
    OraHis2: TOraQuery;
    OraHis1CAREDATE: TStringField;
    OraHis1BLOODMAX: TIntegerField;
    OraHis1BLOODMIN: TIntegerField;
    OraHis2CAREDATE: TStringField;
    OraHis2BLOODSUGAR: TIntegerField;
    Series1: TLineSeries;
    OraMed2: TOraQuery;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartForm: TChartForm;

implementation

uses PSJ1030A1;

{$R *.DFM}

procedure TChartForm.FormShow(Sender: TObject);
begin
  with OraMed1 do
  begin //Á¾ÇÕ°ËÁø-Ç÷¾Ð
       Close;
       Sql.Clear;
       Sql.Add ('select MEDIYEAR, VALUE006, VALUE007                          ');
       Sql.Add ('  from Psmedhis                                              ');
       Sql.Add (' where empno = '''+ FM_Main.E_empno.empno + '''              ');
       Sql.Add ('   and NVL(VALUE006,0) <> 0                                  ');
       Sql.Add (' order by MEDIYEAR                                           ');
       Open;
  end;

  with OraMed2 do
  begin //Á¾ÇÕ°ËÁø-Ç÷´ç
       Close;
       Sql.Clear;
       Sql.Add ('select MEDIYEAR,  VALUE019                                   ');
       Sql.Add ('  from Psmedhis                                              ');
       Sql.Add (' where empno = '''+ FM_Main.E_empno.empno + '''              ');
       Sql.Add ('   and NVL(VALUE019,0) <> 0                                  ');
       Sql.Add (' order by MEDIYEAR                                           ');
       Open;
  end;

  with OraHis1 do
  begin //»ó´ã-Ç÷¾Ð
       Close;
       Sql.Clear;
       Sql.Add ('select substr(CAREDATE,3,8) CAREDATE, BLOODMAX, BLOODMIN     ');
       Sql.Add ('  from PsHtreat                                              ');
       Sql.Add (' where empno = '''+ FM_Main.E_empno.empno + '''              ');
       Sql.Add ('   and NVL(bloodmax,0) <> 0                                  ');
       Sql.Add (' order by CAREDATE                                           ');
       Open;
  end;

  with OraHis2 do
  begin //»ó´ã-Ç÷´ç
       Close;
       Sql.Clear;
       Sql.Add ('select substr(CAREDATE,3,8) CAREDATE, BLOODSUGAR             ');
       Sql.Add ('  from PsHtreat                                              ');
       Sql.Add (' where empno = '''+ FM_Main.E_empno.empno + '''              ');
       Sql.Add ('   and NVL(bloodsugar,0) <> 0                                ');
       Sql.Add (' order by CAREDATE                                           ');
       Open;
  end;
end;

procedure TChartForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
