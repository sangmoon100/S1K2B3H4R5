unit DeptForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  DBTables, peoutlookbtn, MemDS, DBAccess, Ora, OnScheme, OnDBGrid;

type
  TFDeptForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    BT_Search: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Qry_dept: TOraQuery;
    E_DeptCode: TOnEdit;
    E_deptname: TOnEdit;
    SF_Main: TOnSchemeForm;
    OnDBGrid1: TOnDBGrid;
    procedure FB_cancelClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_deptnameKeyPress(Sender: TObject; var Key: Char);
    procedure E_DeptCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure OnDBGrid1DrawCell(Sender: TObject; const ACell: TOnJCell;
      var BgColor, FontColor: TColor; var FStyle: TFontStyles);
    procedure OnDBGrid1CellClick(Sender: TObject; const ACell: TOnJCell);
    procedure OnDBGrid1DblClick(Sender: TObject);
    procedure OnDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSdeptcodeS  : String;
    GSdeptcode   : String;
    GSdeptname   : String;
  end;

var
   FDeptForm : TFDeptForm;

implementation

uses SubPmas;

{$R *.DFM}

procedure TFDeptForm.FB_cancelClick(Sender: TObject);
begin
  GSdeptcode := '';
  GSdeptname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFDeptForm.Bt_ExitClick(Sender: TObject);
begin
  close;
end;

procedure TFDeptForm.BT_SearchClick(Sender: TObject);
var
  ParamVariant : String;
begin
  //2015.10.28.hjku.. 부서조회 변경...이지연씨요청(SR-1510-1101)
  //Qry_dept.Locate('DEPTCODE', E_DeptCode.Text, [loPartialKey]);
  //DBGrid1CellClick(DBGrid1.columns[0]);
//  DBGrid1DblClick(Sender);


  ParamVariant  := ' SELECT ORGNUM, DEPTCODE, DEPTNAME, DEPTNA3, CHANMODE                                        '+ #13#10 +
                   '   FROM PYCDEPT B                                                                            '+ #13#10 +
                   '  WHERE B.ORGNUM  = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')  '+ #13#10 +
            Format('    AND (B.DEPTCODE LIKE ''%s'' AND B.DEPTNAME LIKE  ''%s'')', ['%'+E_DeptCode.Text+'%','%'+E_deptname.Text+'%']);

    ParamVariant := ParamVariant + ' ORDER BY CHANMODE, DEPTCODE ';


  with Qry_dept do
  begin
       Close;
       SQL.Clear;
       Sql.Add(ParamVariant);
//       memo1.text := sql.text;
       open;
  end;
end;

procedure TFDeptForm.DBGrid1DblClick(Sender: TObject);
begin
  if FM_PMas.FG_Gubn = '1' then
  begin
       //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
       //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
       //FM_PMas.FL_DeptCode      := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
       FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
  end
  else
  begin
       //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
       //FM_PMas.FL_Orgnum         := Qry_dept.FieldByName('Orgnum').AsString;
       //FM_PMas.FL_DeptFind       := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.Ed_Orgnum.Text     := Qry_dept.FieldByName('ORGNUM').AsString;
       FM_PMas.Ed_Deptcode.Text   := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.Ed_Deptname.Text   := Qry_dept.FieldByName('DEPTNAME').AsString;
  end;
  Close;
end;

procedure TFDeptForm.DBGrid1CellClick(Column: TColumn);
begin
  if not Qry_dept.Eof then
  begin
       E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
       E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;

       if FM_PMas.FG_Gubn = '1' then
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum       := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptCode     := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Deptname.Text := Qry_dept.FieldByName('DEPTNAME').AsString;
       end else
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptFind      := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.Ed_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString
       end;
  end;
end;

procedure TFDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFDeptForm.E_deptnameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then System.Exit;
  Key := #0;
  //2015.10.28.hjku.. 부서조회 변경...이지연씨요청(SR-1510-1101)
  //Qry_dept.Locate('DEPTNAME', E_DeptName.Text, [loPartialKey]);
  //DBGrid1CellClick(DBGrid1.columns[0]);
  //DBGrid1.SetFocus;
  BT_SearchClick(nil);
end;

procedure TFDeptForm.E_DeptCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then System.Exit;

  Key := #0;
  //2015.10.28.hjku.. 부서조회 변경...이지연씨요청(SR-1510-1101)
  //Qry_dept.Locate('DEPTCODE', E_DeptCode.Text, [loPartialKey]);
  //DBGrid1CellClick(DBGrid1.columns[0]);
  BT_SearchClick(nil);
end;

procedure TFDeptForm.FormCreate(Sender: TObject);
begin
(*    //2015.10.28.hjku.. 부서조회 변경...이지연씨요청(SR-1510-1101)
  with Qry_dept do
  begin
       Close;
       SQL.Clear;
       Sql.Add(' Select Orgnum, DEPTCODE, DEPTNAME, DEPTNA3, CHANMODE ');
       Sql.Add('   From PYCDEPT A, PIMVARI B                ');
       Sql.Add('  Where A.ORGNUM = B.VALUE1                 ');
       Sql.Add('    And B.GUBUN  = ''00''                   ');
       Sql.Add('    And B.SGUBUN = ''0001''                 ');
       Sql.Add('  ORDER BY CHANMODE, DEPTCODE               ');
       open;
       Locate('DEPTCODE', E_DeptCode.Text, [loPartialKey]);
//        if FM_PMas.FG_Gubn = '2' then FM_PMas.FG_deptcode2 :=  Qry_dept.FieldByName('DEPTCODE').AsString;
  end;
*)
    BT_SearchClick(nil);
end;

procedure TFDeptForm.FormShow(Sender: TObject);
begin
  if FM_PMas.FG_Gubn = '1' then
  begin
       FDeptForm.Left := FM_PMas.Left + 410;
       FDeptForm.Top  := FM_PMas.Top  + 200;
  end else
  begin
       FDeptForm.Left := FM_PMas.Left + 5;
       FDeptForm.Top  := FM_PMas.Top  + 145;
  end;

  E_deptname.SetFocus;
  //2015.10.28.hjku.. 부서조회변경.
  //Qry_dept.Locate('DEPTNAME', E_DeptName.Text, [loPartialKey]);
end;

procedure TFDeptForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then Exit;

  if not Qry_dept.Eof then
  begin
       if FM_PMas.FG_Gubn = '1' then
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptCode      := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
       end
       else
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptFind      := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.Ed_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
       end;
  end;
  Close;
end;

procedure TFDeptForm.OnDBGrid1DrawCell(Sender: TObject;
  const ACell: TOnJCell; var BgColor, FontColor: TColor;
  var FStyle: TFontStyles);
begin
  if Qry_dept.FieldByName('CHANMODE').AsString ='3' then
    begin
      FStyle    := [fsStrikeOut];
      FontColor := clBlue;
    end
  else
    begin
      FStyle    := [];
      FontColor := clBlack;
    end;

end;

procedure TFDeptForm.OnDBGrid1CellClick(Sender: TObject;
  const ACell: TOnJCell);
begin
  if not Qry_dept.Eof then
  begin
       E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
       E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;

       if FM_PMas.FG_Gubn = '1' then
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum       := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptCode     := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Deptname.Text := Qry_dept.FieldByName('DEPTNAME').AsString;
       end else
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum       := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptFind     := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.Ed_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Deptname.Text := Qry_dept.FieldByName('DEPTNAME').AsString
       end;
  end;
end;

procedure TFDeptForm.OnDBGrid1DblClick(Sender: TObject);
begin
  if FM_PMas.FG_Gubn = '1' then
  begin
       //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
       //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
       //FM_PMas.FL_DeptCode      := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
       FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
  end
  else
  begin
       //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
       //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
       //FM_PMas.FL_DeptFind      := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.Ed_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
       FM_PMas.Ed_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
       FM_PMas.Ed_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
  end;
  Close;
end;

procedure TFDeptForm.OnDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then Exit;

  if not Qry_dept.Eof then
  begin
       if FM_PMas.FG_Gubn = '1' then
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum        := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptCode      := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.E_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.E_Deptname.Text  := Qry_dept.FieldByName('DEPTNAME').AsString;
       end
       else
       begin
            //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
            //FM_PMas.FL_Orgnum       := Qry_dept.FieldByName('Orgnum').AsString;
            //FM_PMas.FL_DeptFind     := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Orgnum.Text    := Qry_dept.FieldByName('ORGNUM').AsString;
            FM_PMas.Ed_Deptcode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
            FM_PMas.Ed_Deptname.Text := Qry_dept.FieldByName('DEPTNAME').AsString;
       end;
  end;
  Close;
end;

end.
 
