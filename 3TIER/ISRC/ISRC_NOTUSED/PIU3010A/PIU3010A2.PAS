unit piu3010a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnEditMemo, OnScheme;

type
  TFm_moveform = class(TForm)
    Panel2: TPanel;
    bt_no: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    bt_yes: TOnFocusButton;
    Memo1: TMemo;
    BT_Exit: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure bt_noClick(Sender: TObject);
    procedure bt_yesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ExitClick(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    GsEmpno, GsKorname, GsPayraname, GsDeptname, Gsbigo: String;
    GsHopesayu: WideString;
  end;

var
  Fm_moveform : TFm_moveform;

implementation
uses PIU3010A1;
{$R *.DFM}

procedure TFm_moveform.FormCreate(Sender: TObject);
begin
//    close;
end;

procedure TFm_moveform.bt_noClick(Sender: TObject);
begin
    with FM_Main.TMaxDataSet do
    begin
         ServiceName := 'PEA1060A_dml';
         Close;
         Sql.Clear ;

         Sql.Add ('UPDATE pmovemas                                        ');
         Sql.Add ('   SET MOVEYN =''N''                                   ');
         Sql.Add ('WHERE  RABASYY   = '''+ FM_Main.CB_Year.text +'''      ');
         Sql.Add ('  AND  EMPNO     = '''+ FM_Main.Pempno + '''           ');

         if Execute then
         begin
             MessageDlg('금년도 이동 대상자에서 제외되었습니다.', mtInformation, [mbOK], 0);
         end
         else
         begin
             MessageDlg('금년도 이동 대상자 제외 등록에 실패하였습니다..', mtError, [mbOK], 0);
         end;
    end;
    close;
end;

procedure TFm_moveform.bt_yesClick(Sender: TObject);
begin
    with FM_Main.TMaxDataSet do
    begin
         ServiceName := 'PEA1060A_dml';
         Close;
         Sql.Clear ;

         Sql.Add ('UPDATE pmovemas                                        ');
         Sql.Add ('   SET MOVEYN =''Y''                                   ');
         Sql.Add ('WHERE  RABASYY   = '''+ FM_Main.CB_Year.text +'''      ');
         Sql.Add ('  AND  EMPNO     = '''+ FM_Main.Pempno + '''           ');

         if Execute then
         begin
             MessageDlg('금년도 이동 대상자로 등록되었습니다.', mtInformation, [mbOK], 0);
         end
         else
         begin
             MessageDlg('금년도 이동 대상자 등록에 실패하였습니다..', mtError, [mbOK], 0);
         end;
    end;
    close;
end;

procedure TFm_moveform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFm_moveform.BT_ExitClick(Sender: TObject);
begin
    close;
end;

end.
