unit PHosSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TFM_HosSearch = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Exit: TOnFocusButton;
    BT_ok: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    CORPNO    : String;
    CORPNAME  : String;
  end;

var
   FM_HosSearch : TFM_HosSearch;

implementation

uses Psh1070a1,Psh1070a2;
{$R *.DFM}

procedure TFM_HosSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
  Close;
end;

procedure TFM_HosSearch.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    CORPNO    := TDS1.FieldByName('CORPNO').AsString;
    CORPNAME  := TDS1.FieldByName('CORPNAME').AsString;
  end
  else
  begin
    CORPNO   := '';
    CORPNAME  := '';
  end;

  Close;
end;

procedure TFM_HosSearch.BT_ExitClick(Sender: TObject);
begin
  CORPNO   := '';
  CORPNAME  := '';
  Close;
//  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_HosSearch.FormShow(Sender: TObject);
begin
     with TDS1 do
     begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Add('SELECT * FROM (                                                  ');
          Sql.Add('        SELECT CORPNO , MIN(CORPNAME)  CORPNAME ,                ');
          Sql.Add(                '''Field3'',''Field4'',''Field5''                 ');
          Sql.Add('          FROM PSHAPHOS                                          ');
          Sql.Add('         WHERE APPDATE BETWEEN to_char(add_months(sysdate,-24),''yyyymm'')   ');
          Sql.Add('                           AND '''+ FM_Mainform.FG_Appdate +'''  ');
          Sql.Add('           AND EMPNO ='''+ Copy(FM_Hospital.L_AppEmpno.ValueCaption,1,4)  +'''            ');
          Sql.Add('           AND CORPNO NOT LIKE ''0000000%''                                           ');
          Sql.Add('        GROUP BY CORPNO                                          ');
          Sql.Add('        ORDER BY  CORPNAME )                                      ');
          Sql.Add(' UNION ALL                                                         ');
          Sql.Add(' SELECT '''' CORPNO , ''''  CORPNAME ,                                ');
          Sql.Add('        ''Field3'',''Field4'',''Field5''                          ');
          Sql.Add('  FROM DUAL                                                       ');

          ClearFieldInfo;
          AddField('CORPNO'   , ftString, 100);
          AddField('CORPNAME' , ftString, 100);
          AddField('Field3'   , ftString, 100);
          AddField('Field4'   , ftString, 100);
          AddField('Field5'   , ftString, 100);
          Open;
     end;

end;

end.
