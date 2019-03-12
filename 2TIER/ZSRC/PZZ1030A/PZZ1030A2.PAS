unit PZZ1030A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls;

type
  TSubForm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubForm: TSubForm;

implementation

uses PDM, PZZ1030A1;

{$R *.DFM}

procedure TSubForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TSubForm.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TSubForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
       Close;
  end
  else
  begin
       DM.OraQuery3.Close;
       Close;
  end;
end;

procedure TSubForm.Button1Click(Sender: TObject);
begin
  DM.OraQuery2.Close;
  DM.OraQuery3.Close;
  Close;
end;

end.
