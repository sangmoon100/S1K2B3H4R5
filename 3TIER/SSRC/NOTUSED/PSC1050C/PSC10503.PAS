unit PSC10503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_session, Tmax_DataSetText, Grids, DBGrids, OnGrDBGrid, ComCtrls,
  ExtCtrls, OnShapeLabel, OnScheme, StdCtrls, OnFocusButton;

type
    TSepForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel_Body: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    DbGrid1: TOnGrDbGrid;
    TDS_dml1: TTMaxDataSet;
    DataSource1: TDataSource;
    BB_Close: TOnFocusButton;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SepForm: TSepForm;

implementation

uses PSC10501;

{$R *.DFM}

procedure TSepForm.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSepForm.FormShow(Sender: TObject);
var
  ParamVariant1 : String;
begin
  Self.OnPaint := Nil;
  SF_Main.Refresh;

  ParamVariant1 := 'SELECT  STOCKNUM          ,'+
                   '        SUBNUM            ,'+
                   '        GIVEDATE          ,'+
                   '        SAVEAMT           ,'+
                   '        SAVEDATE          ,'+
                   '        SAVEMARK          ,'+
                   '        SAVETERM           '+
                   '  FROM  pstockmas          '+
                   ' ORDER BY STOCKNUM, SUBNUM ';

  with FM_Main.TMaxDataSet1 do
  begin
       ServiceName :='PSC1040C_sel4';
       Close;
       Sql.Clear;
       Sql.Add(ParamVariant1);
       ClearFieldInfo;
       AddField('STOCKNUM', ftString,   2);
       AddField('SUBNUM'  , ftString,   2);
       AddField('GIVEDATE', ftString,  10);
       AddField('SAVEAMT' , ftFloat,   15);
       AddField('SAVEDATE', ftString,  25);
       AddField('SAVEMARK', ftString,  50);
       AddField('SAVETERM', ftString, 100);
       Open;

       FieldByName('STOCKNUM').Alignment := taCenter;
       FieldByName('SUBNUM').Alignment   := taCenter;
       FieldByName('GIVEDATE').Alignment := taCenter;
       FieldByName('SAVEDATE').Alignment := taCenter;
       TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';
  end;
end;

end.
