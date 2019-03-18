unit PKA1050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Db, Grids, DBGrids, DBAccess, Ora, MemDS,
  OnEditBaseCtrl, OnEditStdCtrl, OnScheme, ComCtrls, Func, Pass;

type
  TFM_Main = class(TForm)
    Q_Grid: TOraQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    E_Mark1: TOnEdit;
    E_Value1: TOnEdit;
    E_Mark2: TOnEdit;
    E_Value2: TOnEdit;
    E_Mark3: TOnEdit;
    E_Value3: TOnEdit;
    E_Mark4: TOnEdit;
    E_Value4: TOnEdit;
    E_Mark5: TOnEdit;
    E_Value5: TOnEdit;
    BT_Save: TOnFocusButton;
    BT_Close: TOnFocusButton;
    SB_Help: TStatusBar;
    SF_Main: TOnSchemeForm;
    OraQuery1: TOraQuery;
    E_Gubun: TOnEdit;
    Q_GridGUBUN: TStringField;
    Q_GridMARK1: TStringField;
    Q_GridVALUE1: TStringField;
    Q_GridMARK2: TStringField;
    Q_GridVALUE2: TStringField;
    Q_GridMARK3: TStringField;
    Q_GridVALUE3: TStringField;
    Q_GridMARK4: TStringField;
    Q_GridVALUE4: TStringField;
    Q_GridMARK5: TStringField;
    Q_GridVALUE5: TStringField;
    BT_Delete: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_DeleteClick(Sender: TObject);
    procedure E_GubunExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;

  Q_Grid.Session    := Ora_Session;
  OraQuery1.Session := Ora_Session;

  SB_Help.Panels[1].Text := '  종합인사시스템에 접속 완료.';
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  {if Copy(Pempno,1,1) <> 'D' then
  begin
       ShowMessage('귀하는 접근 권한이 부족합니다. 프로그램을 종료합니다.');
       FM_Main.Close;
  end;}

  with Q_Grid do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select gubun, mark1, value1, mark2, value2,        ');
       Sql.Add ('       mark3, value3, mark4, value4, mark5, value5 ');
       Sql.Add ('  From PKCVARI                                     ');
       Sql.Add (' Order by gubun                                    ');
       Open;
       Q_Grid.Fields[0].Alignment := taCenter;
  end;
  SB_Help.Panels[1].Text := ' 조회 완료';
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_Gubun.Text  := '';
  E_Mark1.Text  := '';
  E_Value1.Text := '';
  E_Mark2.Text  := '';
  E_Value2.Text := '';
  E_Mark3.Text  := '';
  E_Value3.Text := '';
  E_Mark4.Text  := '';
  E_Value4.Text := '';
  E_Mark5.Text  := '';
  E_Value5.Text := '';

  E_Gubun.Text  := Q_Grid.Fields[0].AsString;
  E_Mark1.Text  := Q_Grid.Fields[1].AsString;
  E_Value1.Text := Q_Grid.Fields[2].AsString;
  E_Mark2.Text  := Q_Grid.Fields[3].AsString;
  E_Value2.Text := Q_Grid.Fields[4].AsString;
  E_Mark3.Text  := Q_Grid.Fields[5].AsString;
  E_Value3.Text := Q_Grid.Fields[6].AsString;
  E_Mark4.Text  := Q_Grid.Fields[7].AsString;
  E_Value4.Text := Q_Grid.Fields[8].AsString;
  E_Mark5.Text  := Q_Grid.Fields[9].AsString;
  E_Value5.Text := Q_Grid.Fields[10].AsString;
end;

procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
  With OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select 1 from PKCVARI                 ');
       Sql.Add(' Where Gubun = '''+ E_Gubun.Text +''' ');
       Open;

       if OraQuery1.RecordCount = 0 then
       begin
            Close;
            Sql.Clear;
            Sql.Add('Insert into PKCVARI            ');
            Sql.Add(' Values                        ');
            Sql.Add('('''+ E_Gubun.Text  +''',      ');
            Sql.Add(' '''+ E_Mark1.Text  +''',      ');
            Sql.Add(' '''+ E_Value1.Text +''',      ');
            Sql.Add(' '''+ E_Mark2.Text  +''',      ');
            Sql.Add(' '''+ E_Value2.Text +''',      ');
            Sql.Add(' '''+ E_Mark3.Text  +''',      ');
            Sql.Add(' '''+ E_Value3.Text +''',      ');
            Sql.Add(' '''+ E_Mark4.Text  +''',      ');
            Sql.Add(' '''+ E_Value4.Text +''',      ');
            Sql.Add(' '''+ E_Mark5.Text  +''',      ');
            Sql.Add(' '''+ E_Value5.Text +''',      ');
            Sql.Add(' To_Char(Sysdate,''yyyymmdd''),');
            Sql.Add(' '''+ Pempno        +'''     ) ');
            ExecSql;
       end
       else
       begin
            Close;
            Sql.Clear;
            Sql.Add('Update PKCVARI                                    ');
            Sql.Add('   Set mark1     = '''+ E_Mark1.Text  +''',       ');
            Sql.Add('       value1    = '''+ E_Value1.Text +''',       ');
            Sql.Add('       mark2     = '''+ E_Mark2.Text  +''',       ');
            Sql.Add('       value2    = '''+ E_Value2.Text +''',       ');
            Sql.Add('       mark3     = '''+ E_Mark3.Text  +''',       ');
            Sql.Add('       value3    = '''+ E_Value3.Text +''',       ');
            Sql.Add('       mark4     = '''+ E_Mark4.Text  +''',       ');
            Sql.Add('       value4    = '''+ E_Value4.Text +''',       ');
            Sql.Add('       mark5     = '''+ E_Mark5.Text  +''',       ');
            Sql.Add('       value5    = '''+ E_Value5.Text +''',       ');
            Sql.Add('       writetime = To_Char(Sysdate,''yyyymmdd''), ');
            Sql.Add('       writeman  = '''+ Pempno        +'''        ');
            Sql.Add(' Where Gubun     = '''+ E_Gubun.Text  +'''        ');
            ExecSql;
       end;
  end;

  Q_Grid.Close;
  Q_Grid.Open;
  SB_Help.Panels[1].Text := ' 저장 완료';
end;

procedure TFM_Main.BT_DeleteClick(Sender: TObject);
begin
  With OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Delete PKCVARI                        ');
       Sql.Add(' Where Gubun = '''+ E_Gubun.Text +''' ');
       ExecSql;
  end;

  Q_Grid.Close;
  Q_Grid.Open;  
  SB_Help.Panels[1].Text := ' 삭제 완료';
end;

procedure TFM_Main.E_GubunExit(Sender: TObject);
begin
  With OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select 1 from PKCVARI                 ');
       Sql.Add(' Where Gubun = '''+ E_Gubun.Text +''' ');
       Open;
  end;

  if OraQuery1.RecordCount <> 0 then Exit;
  
  E_Mark1.Text  := '';
  E_Value1.Text := '';
  E_Mark2.Text  := '';
  E_Value2.Text := '';
  E_Mark3.Text  := '';
  E_Value3.Text := '';
  E_Mark4.Text  := '';
  E_Value4.Text := '';
  E_Mark5.Text  := '';
  E_Value5.Text := '';
end;

end.
