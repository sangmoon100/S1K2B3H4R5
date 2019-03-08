unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnGrDBGrid, OnScheme;

type
  TSF_Sub = class(TForm)
    SF_Main: TOnSchemeForm;
    OnGrDbGrid1: TOnGrDbGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SF_Sub: TSF_Sub;

implementation

{$R *.DFM}

end.
