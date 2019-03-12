unit PIB20203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, ExtCtrls, Tabs, StdCtrls, Buttons,
  Mask, Menus, jshape, jgrid, OnGrDBGrid, OnFocusButton, OnSkinBtn,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl;

type
  TdeptSelForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Jdbgrid1: TOnGrDbGrid;
    G_31: TOnSkinButton;
    G_32: TOnSkinButton;
    G_33: TOnSkinButton;
    G_34: TOnSkinButton;
    G_35: TOnSkinButton;
    serchword: TOnButtonEdit;
    Panel2: TPanel;
    BcloseCon: TOnFocusButton;
    BcloseSel: TOnFocusButton;
    orgym: TOnMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure Jdbgrid1DblClick(Sender: TObject);
    procedure BcloseSelClick(Sender: TObject);
    procedure DeptSelect(Sender: TObject);
    procedure BserchClick(Sender: TObject);
    procedure serchwordKeyPress(Sender: TObject; var Key: Char);
    procedure serchwordButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    SelDept : string[6];
    SelName : string[60];
    Selym   : string[6];
    pOrgym  : string[6];
  end;

var
  deptSelForm: TdeptSelForm;

implementation

uses PIB20205;
{$R *.DFM}

procedure TdeptSelForm.FormActivate(Sender: TObject);
var
  rstr : variant;
begin
  rstr := CData.Get_Pimvari('B2','0000');
  orgym.Text := rstr[0];
  pOrgym     := rstr[0];
  Jdbgrid1.visible := False;
//  orgym.SetFocus;
  DeptSelect(G_31);
  serchword.SetFocus;  //30.01 2002.06.18 shm
end;

// 그리드에서 더블클릭할경우----------------------------------------------------
procedure TdeptSelForm.Jdbgrid1DblClick(Sender: TObject);
begin
  SelDept := CData.Csdept.FieldByName('deptcode').AsString;
  SelName := CData.Csdept.FieldByName('deptname').AsString;
  Selym   := orgym.Text;
  CData.Csdept.Close;
  Close;
end;

// 켈린더를 호출한다..----------------------------------------------------------
procedure TdeptSelForm.BcloseSelClick(Sender: TObject);
begin
  SelDept := '';
  SelName := '';
  Selym   := orgym.Text;
  CData.Csdept.close;
  close;
end;

// 찾고자하는 부서를 검색한다...................................................
procedure TdeptSelForm.DeptSelect(Sender: TObject);
begin
  Jdbgrid1.visible := True;
  CData.Csdept.close;
  case TComponent(Sender).tag of
    1 : CData.RunSdeptSql(1,VarArrayof([orgym.Text]));
    2 : CData.RunSdeptSql(2,VarArrayof([orgym.Text]));
    3 : CData.RunSdeptSql(3,VarArrayof([orgym.Text]));
    4 : CData.RunSdeptSql(4,VarArrayof([orgym.Text]));
    5 : CData.RunSdeptSql(5,VarArrayof([orgym.Text]));
    6 : CData.RunSdeptSql(6,VarArrayof([orgym.Text,'%'+serchword.Text+'%']));
  end;

  if CData.Csdept.RecordCount = 0 then Jdbgrid1.visible := False
  else begin
     Jdbgrid1.visible := True;
     Jdbgrid1.SetFocus;
  end;

  G_31.BtnDown  := False;
  G_32.BtnDown  := False;
  G_33.BtnDown  := False;
  G_34.BtnDown  := False;
  G_35.BtnDown  := False;

  if Sender is TOnSkinButton then
    begin
      TOnSkinButton(Sender).BtnDown := True;
      serchword.Text := '';
    end;
end;

// 찾고자하는 부서를 검색한다...................................................
procedure TdeptSelForm.BserchClick(Sender: TObject);
begin
  DeptSelect(Sender);
end;

//30.01 enter 시 부서검색 자동으로...2002.06.18 shm 추가
procedure TdeptSelForm.serchwordKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      TComponent(Sender).tag  := 6;
      DeptSelect(Sender);
   end;
end;

procedure TdeptSelForm.serchwordButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  DeptSelect(Sender);
end;

end.
