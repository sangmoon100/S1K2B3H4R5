unit PKA4057A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid;

type
  TEmpForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    Panel1: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    RunGrid: TOnDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure RunGridDrawCell(Sender: TObject; const ACell: TOnJCell;
      var BgColor, FontColor: TColor; var FStyle: TFontStyles);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSempnoS    : String;
    GSkornameS  : String;
    GSpstateS   : String;
    GSempdateS  : String;
    GSorgnumS   : String;
    GSdeptcodeS : String;
    GSdeptnameS : String;
    GSjobdeptS  : String;    
  end;

var
   EmpForm : TEmpForm;

implementation

uses pka4057a1;

{$R *.DFM}

procedure TEmpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TEmpForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  with TDS1 do
    begin
      ServiceName := 'HINSA_select10';
      Close;
      Sql.Clear;

      Sql.Add('SELECT A.empno, A.korname, A.pstate, a.empdate, a.orgnum, A.deptcode, B.deptname       ');
      Sql.Add('      ,a.jobdept,''value9'',''value10''                                                ');
      Sql.Add('  FROM pimpmas A, pycdept B, PKYEARLT C                                                ');
      Sql.Add(' WHERE c.yearly_yy = '''+FM_Main.FG_yy+'''                                             ');
      Sql.Add('   AND a.empno     = c.empno                                                           ');
      Sql.Add('   AND A.orgnum    = B.orgnum                                                          ');
      Sql.Add('   AND A.deptcode  = B.deptcode                                                        ');
      Sql.Add('   and nvl(c.YEARLYPLAN_CNT,0) > 0                                                     ');
      Sql.Add('   AND (A.empno    like '''+E_cond.Text+'%'' OR A.korname like '''+E_cond.Text+'%'')   ');
      Sql.Add(' ORDER BY pstate,EMPNO                                                                 ');

      ClearFieldInfo;
      AddField('EMPNO'             , ftString  ,  100 );
      AddField('KORNAME'           , ftString  ,  100 );
      AddField('pstate'            , ftString  ,  100 );
      AddField('empdate'           , ftString  ,  100 );
      AddField('ORGNUM'            , ftString  ,  100 );
      AddField('DEPTCODE'          , ftString  ,  100 );
      AddField('DEPTNAME'          , ftString  ,  100 );
      AddField('jobdept'           , ftString  ,  100 );
      AddField('VALUE9'            , ftString  ,  100 );
      AddField('VALUE10'           , ftString  ,  100 );
      Open;
      FieldByName('EMPNO').Alignment   := taCenter;
      FieldByName('KORNAME').Alignment := taCenter;
    end;
end;

procedure TEmpForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSempnoS    := TDS1.FieldByName('empno').AsString;
    GSkornameS  := TDS1.FieldByName('korname').AsString;
    GSpstateS   := TDS1.FieldByName('pstate').AsString;
    GSempdateS  := TDS1.FieldByName('empdate').AsString;
    GSorgnumS   := TDS1.FieldByName('orgnum').AsString;
    GSdeptcodeS := TDS1.FieldByName('deptcode').AsString;
    GSdeptnameS := TDS1.FieldByName('deptname').AsString;
    GSjobdeptS  := TDS1.FieldByName('jobdept').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSempnoS    := '';
    GSkornameS  := '';
    GSpstateS   := '';
    GSempdateS  := '';
    GSorgnumS   := '';
    GSdeptcodeS := '';
    GSdeptnameS := '';
    GSjobdeptS  := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.BT_CancelClick(Sender: TObject);
begin
    GSempnoS    := '';
    GSkornameS  := '';
    GSpstateS   := '';
    GSempdateS  := '';
    GSorgnumS   := '';
    GSdeptcodeS := '';
    GSdeptnameS := '';
    GSjobdeptS  := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TEmpForm.RunGridDrawCell(Sender: TObject; const ACell: TOnJCell;
  var BgColor, FontColor: TColor; var FStyle: TFontStyles);
begin
  if TDS1.FieldByName('pstate').AsString < '80' then
    begin
      FStyle    := [];
      FontColor := clBlack;
    end
  else
    begin
      FStyle    := [fsStrikeOut];
      FontColor := clBlue;
    end;
end;

end.
