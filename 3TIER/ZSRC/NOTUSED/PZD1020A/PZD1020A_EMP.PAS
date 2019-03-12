unit PZD1020A_emp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnDBGrid, ExtCtrls, StdCtrls, OnFocusButton, Db, Tmax_DataSetText, Tmax_session,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Grids,
  DBGrids, OnGrDBGrid;

type
  TFM_empno = class(TForm)
    QR_pimpmas: TTMaxDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Panel3: TPanel;
    BE_Key: TOnButtonEdit;
    Edit1: TEdit;
    GR_pimpmas: TOnGrDbGrid;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid1DblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GR_pimpmasApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;
    FL_Start     : Boolean;
    procedure Part_search;
    procedure All_search;
    procedure DataMove;
  end;

var
  FM_empno: TFM_empno;

implementation
uses PZD10201;
{$R *.DFM}

procedure TFM_empno.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_empno.FormPaint(Sender: TObject);
begin
  if FL_Start then
    begin
      FL_Start := not FL_Start;
      Application.ProcessMessages;
      Part_search;
    end;
end;

procedure TFM_empno.Part_search;
begin
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
      begin
        Close;
        Sql.Clear;
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,              ');
        SQL.ADD('    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,         ');
        SQL.ADD('    case when a.pstate < ''80'' then ''ÀçÁ÷'' else ''Åð»ç'' end empdate,'' '','' '','' '' ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                         ');
        SQL.ADD(' WHERE D.codeid(+) = ''I113''                                                             ');
        SQL.ADD('   AND A.payra     = D.codeno(+)                                                          ');
        SQL.ADD('   AND C.codeid(+) = ''I112''                                                             ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)                                                          ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)                                                          ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)                                                        ');
        SQL.ADD('   AND (    (A.empno     LIKE '''+BE_key.Text + '%'+'''  )                                ');
        SQL.ADD('        OR  ( A.korname  LIKE '''+BE_key.Text + '%'+'''  )    )                           ');
        SQL.ADD('   AND not ((A.empno = ''Q017'') or (A.empno like ''M%''))                                ');
        SQL.ADD(' ORDER BY empdate,empno                                                                   ');
        edit1.text := Sql.Text;
        Open;
      end;
  except
    QR_pimpmas.Close;
  end;
end;

procedure TFM_empno.BT_ExitClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_empno.DataMove;
begin
     MainForm.ED_empno.Text           := QR_pimpmas.FieldbyName('Empno').AsString + ' - ' +
                                         QR_pimpmas.FieldbyName('Korname').AsString;
     MainForm.ED_empno.Hint           := QR_pimpmas.FieldbyName('Empno').AsString;
     MainForm.EPayclname.ValueCaption := QR_pimpmas.FieldbyName('PayclName').AsString;
     MainForm.EPayclname.Hint         := QR_pimpmas.FieldbyName('Paycl').AsString;
     MainForm.EPayraname.ValueCaption := QR_pimpmas.FieldbyName('PayraName').AsString;
     MainForm.EPayraname.Hint         := QR_pimpmas.FieldbyName('Payra').AsString;
     MainForm.EDeptname.ValueCaption  := QR_pimpmas.FieldbyName('DeptName').AsString;
end;

procedure TFM_empno.BT_ConfirmClick(Sender: TObject);
begin
     datamove;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_empno.BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  if MainForm.ZMANAGER = MainForm.GSempno then
     All_Search
  else
     part_Search;
end;

procedure TFM_empno.BE_KeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
    if Sender is TOnDBGrid then
      Grid1DblClick(Sender)
    else
      BE_keyButtonClick(Sender,0);
end;

procedure TFM_empno.Grid1DblClick(Sender: TObject);
begin
  BT_ConfirmClick(Sender);
end;

procedure TFM_empno.GR_pimpmasApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if QR_pimpmas.FieldByName('pstate').AsString < '80' then
    begin
      Canvas.Font.Style := [];
      Canvas.Font.Color := clBlack;
    end
  else
    begin
      Canvas.Font.Style := [fsStrikeOut];
      Canvas.Font.Color := clBlue;
    end;
end;

procedure TFM_empno.All_Search;
begin
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
      begin
        Close;
        Sql.Clear;
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,              ');
        SQL.ADD('    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,         ');
        SQL.ADD('    case when a.pstate < ''80'' then ''ÀçÁ÷'' else ''Åð»ç'' end empdate,'' '','' '','' '' ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                         ');
        SQL.ADD(' WHERE D.codeid(+) = ''I113''                                                             ');
        SQL.ADD('   AND A.payra     = D.codeno(+)                                                          ');
        SQL.ADD('   AND C.codeid(+) = ''I112''                                                             ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)                                                          ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)                                                          ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)                                                        ');
        SQL.ADD('   AND (    (A.empno     LIKE '''+BE_key.Text + '%'+'''  )                                ');
        SQL.ADD('        OR  ( A.korname  LIKE '''+BE_key.Text + '%'+'''  )    )                           ');
        SQL.ADD(' ORDER BY empdate,empno                                                                   ');

        Open;
      end;
  except
    QR_pimpmas.Close;
  end;
end;

end.
