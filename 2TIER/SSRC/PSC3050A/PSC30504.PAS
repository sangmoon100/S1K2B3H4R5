unit psc30504;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnPopupEdit, OnGrDBGrid,
  OnFocusButton, MemDS, DBAccess, Ora, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl;

type
  TEmpForm_ADD = class(TForm)
    DataSource1: TDataSource;
    codeGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Select: TOnFocusButton;
    BT_Close: TOnFocusButton;
    OraQuery1: TOraQuery;
    Panel2: TPanel;
    E_Search: TOnButtonEdit;
    GroupBox1: TGroupBox;
    RB2: TRadioButton;
    RB1: TRadioButton;
    procedure BT_CloseClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_SearchButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Edit        : TOnWinPopupEdit;
    GIcloseS: Integer;
    GSempnoS: String;
    GSkornameS: String;
    GScorpname: String;
    GSdivseqnumI: Real;
    GSstclassS: String;
    GSstlorg  : string;

    Procedure Open_Grid;
  end;

var
  EmpForm_ADD: TEmpForm_ADD;
implementation

uses psc30501;

{$R *.DFM}

Procedure TEmpForm_ADD.Open_Grid;
begin
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT EMPNO, KORNAME, CORPNAME, DIVSEQNUM,          ');
    Sql.Add('        DECODE(STCLASS, ''1'', ''1:荤林快急'',        ');
    Sql.Add('                        ''2'', ''2:荤林角鼻'',        ');
    Sql.Add('                        ''3'', ''3:林林快急'',        ');
    Sql.Add('                        ''4'', ''4:林林快急(抗殴)'',  ');
    Sql.Add('                        ''5'', ''5:林林快急(厚抗殴)'',');
    Sql.Add('                        '''') STCLASS,  CODENAME,     ');
    Sql.Add('        STLORG||'':''||                               ');
    Sql.Add('        (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''K910'' AND CODENO=A.STLORG) STLORGNAME ');
    Sql.Add(' FROM PSLMAS A, PYCCODE B                                 ');
    Sql.Add(' WHERE (B.CODEID = ''K910'' AND A.STLORG = B.CODENO(+))   ');
    Sql.Add(Format('AND ((empno   like ''%s'') or ',['%'+E_Search.Text+'%'])   );
    Sql.Add(Format('     (korname like ''%s''))   ',['%'+E_Search.Text+'%'])   );

    If RB1.Checked then
      SQL.ADD('ORDER BY EMPNO, KORNAME, CORPNAME DESC, DIVSEQNUM DESC ')
    else
      SQL.ADD('ORDER BY KORNAME, EMPNO, CORPNAME DESC, DIVSEQNUM DESC ');
    Open;
  end;
end;

procedure TEmpForm_ADD.BT_CloseClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TEmpForm_ADD.codeGridDblClick(Sender: TObject);
begin
  if not OraQuery1.Eof then
  begin
    GSempnoS     := OraQuery1.FieldByName('EMPNO').AsString;
    GSkornameS   := OraQuery1.FieldByName('KORNAME').AsString;
    GScorpname   := OraQuery1.FieldByName('CORPNAME').AsString;
    GSdivseqnumI := OraQuery1.FieldByName('DIVSEQNUM').AsFloat;
    GSstclassS   := OraQuery1.FieldByName('STCLASS').AsString;
    GSstlorg     := OraQuery1.FieldByName('STLORGNAME').AsString;
  end
  else
  begin
    GSempnoS     := '';
    GSkornameS   := '';
    GScorpname   := '';
    GSdivseqnumI := 0;
    GSstclassS   := '';
    GSstlorg     := '';
  end;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TEmpForm_ADD.FormShow(Sender: TObject);
begin
  Open_Grid;
end;

procedure TEmpForm_ADD.E_SearchButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Open_Grid;
end;

procedure TEmpForm_ADD.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Open_Grid;
end;

procedure TEmpForm_ADD.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then codeGridDblClick(Sender);
end;

end.


