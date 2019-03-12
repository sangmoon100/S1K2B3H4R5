unit PZO20104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid, OnTmaxPersonEdit, OnScheme, ComCtrls, OnSkinBtn, OnEditCombo;

type
  TComForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    Panel7: TPanel;
    FB_Select: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    RunGrid: TOnDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure FB_cancel2Click(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure FB_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GScomcodeS  : String;
    GScomcode   : String;
    GScomname   : String;
  end;

var
   ComForm : TComForm;

implementation

uses PZO20101;

{$R *.DFM}

procedure TComForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TComForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant : String;
begin
  ParamVariant  := ' SELECT CODENO, CODENAME         '+ #13#10 +
                   '   FROM DRMCODE B                '+ #13#10 +
                   '  WHERE CODEID = ''C001''        '+ #13#10 ;


  if E_cond.Text <> '' then
       ParamVariant := ParamVariant + Format(' AND (B.CODENO LIKE ''%s'' OR B.CODENAME LIKE  ''%s'' ) ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

    ParamVariant := ParamVariant + ' ORDER BY CODENAME ';

  with TDS1 do
    begin
      ServiceName := 'PKA4100C_sel1';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('CODENO'            , ftString  ,  6   );
      AddField('CODENAME'          , ftString  ,  60  );
      Open;
      FieldByName('CODENO').Alignment   := taCenter;
    end;
end;

procedure TComForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GScomcode   := TDS1.FieldByName('CODENO').AsString;
    GScomname   := TDS1.FieldByName('CODENAME').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GScomcode   := '';
    GScomname   := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TComForm.FB_cancel2Click(Sender: TObject);
begin
  GScomcode   := '';
  GScomname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TComForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TComForm.FB_cancelClick(Sender: TObject);
begin
  GScomcode   := '';
  GScomname := '';
  Edit.PopupForm.ClosePopup(False);
end;

end.
