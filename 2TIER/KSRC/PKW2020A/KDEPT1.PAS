unit KDept1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TDeptCode1 = class(TForm)
    Qry1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel4: TPanel;
    E_DeptCode: TEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    BB_Run: TBitBtn;
    BB_Select: TBitBtn;
    Qry1DEPTCODE: TStringField;
    Qry1DEPTNAME: TStringField;
    Qry1ORGNUM: TStringField;
    P_OrgNum: TPanel;
    BB_Cancel: TBitBtn;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BB_SelectClick(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure E_DeptCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    OrgNum   : String[03];
    DeptCode : String[06];
    DeptName : String[100];
    Procedure Get_Records(InOrgNum,InDeptCode : String);
  end;

var
  DeptCode1: TDeptCode1;

implementation

{$R *.DFM}

Procedure TDeptCode1.Get_Records(InOrgNum,InDeptCode : String);
var
   Index : Integer;
begin
     Application.ProcessMessages;
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT  DEPTCODE , DEPTNAME||'' ''||DEPTNA3 DEPTNAME , ORGNUM           ' );
     Qry1.Sql.Add( ' FROM    PYCDEPT                                ' );
     Qry1.Sql.Add( ' WHERE   NVL(ORGNUM,'' '') LIKE :orgnum  AND    ' );
     Qry1.Sql.Add( '        (NVL(DEPTCODE,'' '') LIKE :dept  OR     ' );
     Qry1.Sql.Add( '         NVL(DEPTNAME,'' '') LIKE :dept)        ' );
     Qry1.Sql.Add( ' ORDER BY ORGNUM DESC, DEPTCODE                 ' );
     Qry1.ParamByName('orgnum').AsString   := '%' + InOrgNum   + '%';
     Qry1.ParamByName('dept').AsString     := '%' + InDeptCode + '%';
     Qry1.Open;

     if Qry1.Eof then
        Qry1.Close;
end;


procedure TDeptCode1.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
if gdSelected in state then begin
     case Field.Index of
       0 :
             DeptCode := Field.AsString;
       1 :
             DeptName := Field.AsString;
     end;
end;
end;

procedure TDeptCode1.DBGrid1DblClick(Sender: TObject);
begin
     OrgNum        :=P_OrgNum.Caption;
     Close;
end;

procedure TDeptCode1.BB_SelectClick(Sender: TObject);
begin
     OrgNum        :=P_OrgNum.Caption;
     Close;
end;

procedure TDeptCode1.BB_RunClick(Sender: TObject);
begin
     Get_Records(P_OrgNum.Caption,E_DeptCode.Text);
     DBGrid1.SetFocus;
end;

procedure TDeptCode1.BB_CancelClick(Sender: TObject);
begin
     DeptName      := '';
     OrgNum        := '';
     Close;
end;

procedure TDeptCode1.E_DeptCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        begin
             Get_Records(P_OrgNum.Caption,E_DeptCode.Text);
             DBGrid1.SetFocus;
        end;
end;

procedure TDeptCode1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        Close;
end;

end.
