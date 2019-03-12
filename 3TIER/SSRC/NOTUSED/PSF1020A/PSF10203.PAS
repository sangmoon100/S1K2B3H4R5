unit PSF10203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TFamiForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    Famirel   : String;
    FaName    : String;
  end;

var
   FamiForm : TFamiForm;

implementation

uses PSF10201;


{$R *.DFM}

procedure TFamiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TFamiForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    Famirel   := TDS1.FieldByName('FAMIREL').AsString;
    FaName    := TDS1.FieldByName('FANAME').AsString;
  end
  else
  begin
    Famirel   := '';
    FaName    := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TFamiForm.BT_cancelClick(Sender: TObject);
begin
  Famirel   := '';
  FaName    := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TFamiForm.FormShow(Sender: TObject);
var
  SqlStr : String;
begin
  SqlStr := Format('select ''∫ª¿Œ'' famirel, ''%s'' faname '+    
                   '  from dual                            '+
                   'union                                  '+
                   'select b.codename famirel, a.faname '+
                   '  from pimfami a, pyccode b         '+
                   ' where b.codeid =''I211''           '+
                   '   and a.facode = b.codeno          '+
                   '   and a.empno  = ''%s'' ',[MainForm.ED_empno.korname, MainForm.ED_empno.empno]);

{  SqlStr := Format('select b.codename famirel, a.faminame,b.codeno   '+
                   '  from pkmysfam a, pkmyscod b                    '+
                   ' where a.famirel = b.codeno                      '+
                   '   and a.empno  = ''%s''                         '+
                   '   and a.workyy =  '''+ Copy(MainForm.GSyearnum,1,4) +''' '+
                   ' order by codeno  ' ,[MainForm.ED_empno.empno]);}

  with TDS1 do
    begin
      ServiceName := 'PSF1020A_sel3';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr ;

      ClearFieldInfo;
      AddField('FAMIREL'       , ftString,  20  );
      AddField('FANAME'        , ftString,  12  );
      Open;
    end;

end;

end.
