unit PKA40303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid, OnTmaxPersonEdit, OnScheme, ComCtrls, OnSkinBtn, OnEditCombo,
  MemDS, DBAccess, Ora;

type
  TDukindForm = class(TForm)
    DataSource1: TDataSource;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    Panel7: TPanel;
    FB_Select: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    RunGrid: TOnDBGrid;
    OraQuery: TOraQuery;
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
    GSdukind   : String;
    GSduname   : String;
  end;

var
   DukindForm : TDukindForm;

implementation

uses PZO20101;

{$R *.DFM}

procedure TDukindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TDukindForm.E_condButtonClick(Sender: TObject;
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

procedure TDukindForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSdukind   := TDS1.FieldByName('CODENO').AsString;
    GSduname   := TDS1.FieldByName('CODENAME').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSdukind   := '';
    GSduname   := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDukindForm.FB_cancel2Click(Sender: TObject);
begin
  GSdukind   := '';
  GSduname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TDukindForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TDukindForm.FB_cancelClick(Sender: TObject);
begin
  GSdukind   := '';
  GSduname := '';
  Edit.PopupForm.ClosePopup(False);
end;

end.
