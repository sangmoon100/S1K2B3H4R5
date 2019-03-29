unit PIR20901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Func;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtDelA: TBitBtn;
    OraQuery2: TOraQuery;
    DataSource2: TDataSource;
    BtSave: TBitBtn;
    EdEmp: TOnEdit;
    SF_Main: TOnSchemeForm;
    OraQuery1: TOraQuery;
    CbGrp: TOnComboEdit;
    CbSep: TOnComboEdit;
    BtSearch: TBitBtn;
    EdName: TOnEdit;
    BtClose: TBitBtn;
    procedure BtSaveClick(Sender: TObject);
    procedure Query_View;
    procedure EdEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtDelAClick(Sender: TObject);
    procedure CbSepChange(Sender: TObject);
    procedure EdNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtSearchClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormPaint(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const rabasdate='20080501';

var
  MainForm: TMainForm;

implementation

uses PIR20902;

{$R *.DFM}

procedure TMainForm.Query_View;
begin
     With OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT a.sepno, a.grpmain,                                 ');
          SQL.ADD('        b.codename, a.empno,                                ');
          SQL.ADD('        (SELECT korname FROM pimpmas                        ');
          SQL.ADD('          WHERE empno = a.empno) korname                    ');
          SQL.ADD('   FROM prectins a,                                         ');
          SQL.ADD('        (SELECT payra, empno,                               ');
          SQL.ADD('               (SELECT codename FROM pyccode                ');
          SQL.ADD('                   WHERE codeid = ''I113''                  ');
          SQL.ADD('                     AND codeno = b.payra) codename         ');
          SQL.ADD('           FROM pimpmas b) b                                ');
          SQL.ADD('  WHERE a.rabasdate = :v_rabasdate                          ');

          if CbSep.Text <> 'ALL' then
          begin
               SQL.ADD('    AND a.sepno = :v_sepno                             ');
               ParamByName('v_sepno').AsString := CbSep.Text;
          end;

          if CbGrp.Text <> 'ALL' then
          begin
               SQL.ADD('    AND a.grpmain = :v_grpmain                         ');
               ParamByName('v_grpmain').AsString := Cbgrp.Text;
          end;

          SQL.ADD('    AND a.empno = b.empno                                   ');
          SQL.ADD('  ORDER BY a.sepno,a.grpmain,b.payra                        ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          Open;
     end;
end;

procedure TMainForm.BtSaveClick(Sender: TObject);
begin
     if CbSep.Text = 'ALL' then
     begin
        MessageBox(self.Handle,'차수를 선택해 주세요.','종합인사',MB_OK+MB_ICONINFORMATION);
        exit;
     end;

     if CbGrp.Text = 'ALL' then
     begin
        MessageBox(self.Handle,'그룹을 선택해 주세요.','종합인사',MB_OK+MB_ICONINFORMATION);
        exit;
     end;

     if EdEmp.Text = '' then
     begin
        MessageBox(self.Handle,'사번을 입력해 주세요.','종합인사',MB_OK+MB_ICONINFORMATION);
        exit;
     end;
     
     With OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT * FROM pimpmas                                     ');
          SQL.ADD('  WHERE orgnum = (SELECT value1 FROM pimvari               ');
          SQL.ADD('                   WHERE gubun=''00'' and sgubun=''0001'') ');
          SQL.ADD('    AND empno  = :v_empno                                  ');

          ParamByName('v_empno').AsString := EdEmp.Text;
          Open;

          if RecordCount = 0 then
          begin
               ShowMessage('등록된 사번이 아닙니다.');
               Exit;
          end;

          Close;
          SQL.Clear;
          SQL.ADD(' SELECT 1 FROM prectins          ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate ');
          SQL.ADD('    AND sepno     = :v_sepno     ');
          SQL.ADD('    AND grpmain   = :v_grpmain   ');
          SQL.ADD('    AND empno     = :v_empno     ');
          
          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_sepno'    ).AsString := CbSep.Text;
          ParamByName('v_grpmain'  ).AsString  := CbGrp.Text ;
          ParamByName('v_empno'    ).AsString := EdEmp.Text;
          Open;

          if RecordCount = 0 then
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' INSERT INTO prectins(rabasdate,grpmain,sepno,empno)        ');
               SQL.ADD('      VALUES (:v_rabasdate, :v_grpmain, :v_sepno, :v_empno) ');
          end
          else begin
               Close;
               SQL.Clear;
               SQL.ADD(' UPDATE prectins                                  ');
               SQL.ADD('    SET sepno   = :v_sepno,                       ');
               SQL.ADD('        grpmain = :v_grpmain,                     ');
               SQL.ADD('        empno   = :v_empno                        ');
               SQL.ADD('  WHERE rabasdate = :v_rabasdate                  ');
               SQL.ADD('    AND sepno     = :v_sepno                      ');
               SQL.ADD('    AND grpmain   = :v_grpmain                    ');
               SQL.ADD('    AND empno     = :v_empno                      ');
          end;

          ParamByName('v_rabasdate').AsString  := rabasdate;
          ParamByName('v_grpmain'  ).AsString  := CbGrp.Text ;
          ParamByName('v_sepno'    ).AsInteger := StrToInt(CbSep.Text);
          ParamByName('v_empno'    ).AsString  := EdEmp.Text;
          ExecSql;

          Query_View;
          OraQuery2.Locate('empno',EdEmp.Text,[loPartialKey]);

          EdEmp.Text  := '';
          EdName.Text := '';

     end;
end;

procedure TMainForm.EdEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = 13) and (EdEmp.Text <> '') then BtSaveClick(Self);
end;

procedure TMainForm.BtDelAClick(Sender: TObject);
var
     locateval : String;
begin
     With OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' DELETE FROM prectins                ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate     ');
          SQL.ADD('    AND sepno     = :v_sepno         ');
          SQL.ADD('    AND grpmain   = :v_grpmain       ');
          SQL.ADD('    AND empno     = :v_empno         ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_sepno'    ).AsString := OraQuery2.FieldByName('sepno'  ).AsString;
          ParamByName('v_grpmain'  ).AsString := OraQuery2.FieldByName('grpmain').AsString;
          ParamByName('v_empno'    ).AsString := OraQuery2.FieldByName('empno'  ).AsString;
          ExecSQL;
     end;

     OraQuery2.Next;
     locateval := OraQuery2.FieldByName('empno').AsString;
     OraQuery2.Refresh;
     OraQuery2.Locate('empno',locateval,[loPartialKey]);

     EdEmp.Text  := '';
     EdName.Text := '';
end;

procedure TMainForm.CbSepChange(Sender: TObject);
begin
     Query_View;
end;

procedure TMainForm.EdNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 13 then
     begin
          SearchForm := TSearchForm.Create(nil);
          SearchForm.EdName.Text := EdName.Text;
          SearchForm.Show;
     end;
end;

procedure TMainForm.BtSearchClick(Sender: TObject);
begin
     Query_View;
end;

procedure TMainForm.DBGrid1CellClick(Column: TColumn);
begin
     CbSep.Text  := OraQuery2.FieldByName('sepno'  ).AsString;
     CbGrp.Text  := OraQuery2.FieldByName('grpmain').AsString;
     EdEmp.Text  := OraQuery2.FieldByName('empno'  ).AsString;
     EdName.Text := OraQuery2.FieldByName('korname').AsString;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
     OraConnect;
     
     if (Copy(Pgrade,2,1) = 'A') or (Copy(Pgrade,2,1) = 'B') then
     begin
          CbGrp.ItemIndex := 0;
          CbSep.ItemIndex := 0;
          Query_View;
     end
     else begin
          MessageBox(Self.Handle,'사용 권한이 없습니다.','종합인사',MB_OK+MB_ICONINFORMATION);
          Close;
     end;
end;

procedure TMainForm.BtCloseClick(Sender: TObject);
begin
     Close;
end;

end.
