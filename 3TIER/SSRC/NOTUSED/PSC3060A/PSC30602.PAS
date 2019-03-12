unit PSC30602;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnGrDBGrid, OnFocusButton;

type
  TFpsc30602 = class(TForm)
    DataSource1: TDataSource;
    TDS_Grid: TTMaxDataSet;
    DBGrid1: TOnGrDbGrid;
    Panel1: TPanel;
    BB_close: TOnFocusButton;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    empno : String ;
  end;

var
  Fpsc30602: TFpsc30602;
implementation
uses
  psc30601;

{$R *.DFM}


procedure TFpsc30602.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsc30602.FormActivate(Sender: TObject);
var
  ParamVariant : String;
begin

  ParamVariant :=  'select  nvl(        exdate          ,'' '') exdate,                                                '+
                   '        nvl( sum(decode(upper(cpdedyn),''Y'',exdedamt,0)) , 0) dedamt ,                            '+
                   '        nvl( sum(decode(stlorg,''ZZ'',decode(upper(cpdedyn),''Y'',exdedamt,0),0)) , 0) corpdedamt, '+
                   '        nvl( sum(decode(stlorg,''ZZ'',0,decode(upper(cpdedyn),''Y'',exdedamt,0))) , 0) bankdedamt  '+
                   ' from   psemhis                      '+
                   ' where  empno       = '''+empno+ ''' '+
                   ' and    upper(exyn) = ''Y''          '+
                   ' group by exdate                     '+
                   ' order by exdate desc' ;

  with TDS_Grid do
    begin
      ServiceName := 'PSC3060A_sel4';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('EXDATE'       , ftString  ,  8   );
      AddField('DEDAMT'       , ftFloat   ,  12  );
      AddField('CORPDEDAMT'   , ftFloat   ,  12  );
      AddField('BANKDEDAMT'   , ftFloat   ,  12  );

      Open;
      FieldByName('EXDATE').Alignment := taCenter;
      FieldByName('EXDATE').EditMask  := '!9999/99;0;_';
      TFloatField(FieldByName('DEDAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('CORPDEDAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('BANKDEDAMT')).DisplayFormat := '#,##0';
    end;

end;

end.
 