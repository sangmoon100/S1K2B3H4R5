unit PIB3010A_emp;

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
    procedure FormCreate(Sender: TObject);
    procedure GR_pimpmasApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;
    FL_Start     : Boolean;
    procedure search_empno;
    procedure DataMove;
  end;

var
  FM_empno: TFM_empno;

implementation
uses pib30100;
{$R *.DFM}

procedure TFM_empno.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_empno.FormShow(Sender: TObject);
begin
  Search_empno;
end;

procedure TFM_empno.search_empno;
begin
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
      begin
        Close;
        Sql.Clear;
  {     SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,              ');
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
        edit1.text := Sql.Text;    }

        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,                 ');
        SQL.ADD('      (select codename from pyccode where codeid = ''I113'' and a.payra=codeno) payraname,   ');
        SQL.ADD('      (select codename from pyccode where codeid = ''I112'' and a.paycl=codeno) payclname,   ');
        SQL.ADD('       B.deptname, B.deptna3, B.extcode,                                                     ');
        SQL.ADD('       case when a.pstate < ''80'' then ''ÀçÁ÷'' else ''Åð»ç'' end empdate,'' '','' '','' '' ');
        SQL.ADD('  FROM pycdept B, pimpmas A                                                                  ');
        SQL.ADD(' WHERE ( A.empno     LIKE '''+BE_key.Text + '%'+'''                                          ');
        SQL.ADD('        OR  A.korname  LIKE '''+BE_key.Text + '%'+'''  )                                     ');

        if (not FM_Main.ZMANAGER) and (copy(FM_Main.GSempno,1,1)<>'D') then
           SQL.ADD('   AND not ((A.empno = ''Q017'') or (A.empno like ''M%''))                             ');
           
        SQL.ADD('   AND A.empno NOT LIKE ''Y%''                                                            ');        
        SQL.ADD('   AND A.orgnum    = B.orgnum                                                             ');
        SQL.ADD('   AND A.deptcode  = B.deptcode                                                           ');
        SQL.ADD(' ORDER BY empdate,empno                                                                   ');
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
  FM_Main.ED_empno.Text := QR_pimpmas.FieldbyName('Empno').AsString + ' - ' +
                           QR_pimpmas.FieldbyName('Korname').AsString;
  FM_Main.ED_empno.Hint := QR_pimpmas.FieldbyName('Empno').AsString;
end;

procedure TFM_empno.BT_ConfirmClick(Sender: TObject);
begin
  datamove;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_empno.BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  Search_empno;
end;

procedure TFM_empno.BE_KeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
    if   Sender is TOnDBGrid then Grid1DblClick(Sender)
    else                          BE_keyButtonClick(Sender,0);
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


end.
