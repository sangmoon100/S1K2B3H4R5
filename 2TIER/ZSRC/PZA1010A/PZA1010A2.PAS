unit PZA1010A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnGrDBGrid, Db, MemDS, DBAccess, Ora, OnEditStdCtrl,
  OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, StdCtrls, OnFocusButton,
  OnPopupEdit, Func;

type
  TFM_Menu = class(TForm)
    Grid1: TOnGrDbGrid;
    Ora_Qry1: TOraQuery;
    DataSource1: TDataSource;
    EDS_gubun: TOnComboEdit;
    BT_Find: TOnFocusButton;
    EDS_progname: TOnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure EDS_gubunGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure EDS_prognameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FL_Start : Boolean;
  public
    { Public declarations }
    Edit : TOnWinPopupEdit; 
  end;

implementation

{$R *.DFM}

uses PZA1010A1;

procedure TFM_Menu.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Menu.FormPaint(Sender: TObject);
begin
  if FL_Start then
    begin
      FL_Start := False;
      Application.ProcessMessages;
      EDS_gubun.ItemIndex := 0;
    end;
end;

procedure TFM_Menu.BT_FindClick(Sender: TObject);
var
  FL_Sql : String;
begin
  if EDS_gubun.ItemIndex = -1 then
    System.Exit;

  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      SqlRefresh.Clear;
      FL_Sql := 'SELECT A.menu_level, A.tier,                       '+
                '       DECODE(A.tier,''1'',''공통'',               '+
                '                     ''2'',''2Tier'',              '+
                '                     ''3'',''3Tier'') tiername,    '+
                '       DECODE(A.gubun,''0'',''종합인사정보시스템'','+
                '                      ''1'',''인사'',              '+
                '                      ''2'',''급여'',              '+
                '                      ''3'',''평가'',              '+
                '                      ''4'',''복리후생/우리사주'', '+
                '                      ''5'',''기타'',              '+
                '                      ''6'',''방문예약'',          '+
                '                      ''7'',''교육'') gubunname,   '+
                '       A.progid, A.progname, A.upper_progid        '+
                '  FROM '+
                '  (    '+
                '    SELECT LEVEL - 1 menu_level, SUBSTR(RPAD('' '', (LEVEL-1)*4) || progname,1,50) progname, '+
                '           tier,  gubun, progid, upper_progid  '+
                '      FROM pymenulist            '+
                '     START WITH tier = ''1'' AND gubun = ''0'' AND progid = ''%s''  '+
                '     CONNECT BY upper_progid = PRIOR progid '+
                '  ) A   '+
                ' WHERE A.progname LIKE ''%s'' ';
      if EDS_gubun.ItemIndex > 0 then
        begin
          FL_Sql := FL_Sql + ' AND A.gubun = ''%s''  ';
          FL_Sql := Format(FL_Sql,['P0000000','%'+EDS_progname.Text+'%', EDS_gubun.KeyItems[EDS_gubun.ItemIndex]]);
        end
      else
        begin
          FL_Sql := Format(FL_Sql,['P0000000','%'+EDS_progname.Text+'%']);
        end;
      Sql.Text := FL_Sql;
      Open;
    end;
end;

procedure TFM_Menu.Grid1DblClick(Sender: TObject);
begin
  if Ora_Qry1.Active then
    Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_Menu.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Grid1DblClick(Sender);
      Key := #0;
    end;
end;

procedure TFM_Menu.EDS_gubunGetImageIndex(Sender: TObject;
  const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_Menu.EDS_prognameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      BT_FindClick(Sender);
      Key := #0;
    end;
end;

end.
