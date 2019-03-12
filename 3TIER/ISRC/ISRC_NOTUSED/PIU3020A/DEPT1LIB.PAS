unit Dept1lib;


interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, Mask,
  ExtCtrls,datelib, MemDS, DBAccess, Ora;

type
  TDeptForm = class(TForm)
    codeGrid: TDBGrid;
    OKBtn: TBitBtn;
    exit: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    dept: TMaskEdit;
    org: TMaskEdit;
    Run: TBitBtn;
    Panel3: TPanel;
    deptnm: TMaskEdit;
    QDept: TOraQuery;
    QDeptORGNUM: TStringField;
    QDeptDEPTCODE: TStringField;
    QDeptDEPTNM: TStringField;
    QDeptFIELDCODE: TStringField;
    QDeptDEPTNA1: TStringField;
    QDeptDEPTNA2: TStringField;
    QDeptDEPTNA3: TStringField;
    QDeptCHANMODE: TStringField;
    procedure codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure codeGridDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure exitClick(Sender: TObject);
    procedure RunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataVal1 : String[6];
    DataVal2 : String[3];
    Code1    : String[6];
    CodeName : String[60];
    Code2    : String[2];
    Code3    : String[3];
    function QDeptDisp(s1,s2 : String; deptGu : integer) : String;
  end;

var
  DeptForm: TDeptForm;
  ErrorHelp: array[0..255] of char;
implementation

uses PIA1010P;

{$R *.DFM}

procedure CodeSetup; forward;

procedure CodeSetup;
begin
if alltrim(DeptForm.DataVal2) = '' then
begin
   with pia1010aForm.OraQuery1 do
   begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT GUBUN,SGUBUN,VALUE1 ');
        Sql.Add('  FROM PIMVARI             ');
        Sql.Add(' WHERE GUBUN  = ''00''     ');
        Sql.Add('   AND SGUBUN = ''0001''   ');
        Open;
        DeptForm.DataVal2 := FieldByName('Value1').AsString;
        Close;
        DeptForm.org.Text := DeptForm.DataVal2;
   end;
end;

Try
 with DeptForm.QDept do begin
      Close;
      Sql.Clear;
      if  (trim(DeptForm.DataVal1) <> '')
      and (trim(DeptForm.Deptnm.Text) <> '') then begin
         Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
         Sql.Add('fieldcode,deptna1,deptna2,deptna3,chanmode ');
         Sql.Add('from pycdept ');
         Sql.Add('where (deptcode like :ldeptcode) and (orgnum = :lorg  and deptname like :ldeptnm ) ');
         Sql.Add('  and (existon = ''1'') ');
         Sql.add('order by deptcode');
         ParamByName('ldeptcode').AsString    := '%'+DeptForm.DataVal1+'%';
         ParamByName('lorg').AsString         := DeptForm.DataVal2;
         ParamByName('ldeptnm').AsString      := '%'+DeptForm.Deptnm.Text+'%';
      end;
      if  (trim(DeptForm.DataVal1) = '')
      and (trim(DeptForm.Deptnm.Text) = '') then begin
         Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
         Sql.Add('fieldcode,deptna1,deptna2,deptna3,chanmode ');
         Sql.Add('from pycdept ');
         Sql.Add('where (orgnum = :lorg and existon = ''1'') order by deptcode');
         ParamByName('lorg').AsString         := DeptForm.DataVal2;
      end;
      if  (trim(DeptForm.DataVal1) <> '')
      and (trim(DeptForm.Deptnm.Text) = '') then begin
         Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
         Sql.Add('fieldcode,deptna1,deptna2,deptna3,chanmode ');
         Sql.Add('from pycdept ');
         Sql.Add('where (deptcode like :ldeptcode) and (orgnum = :lorg) ');
         Sql.Add('  and (existon = ''1'') ');
         Sql.add('order by deptcode');
         ParamByName('ldeptcode').AsString    := '%'+DeptForm.DataVal1+'%';
         ParamByName('lorg').AsString         := DeptForm.DataVal2;
      end;
      if  (trim(DeptForm.DataVal1) = '')
      and (trim(DeptForm.Deptnm.Text) <> '') then begin
         Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
         Sql.Add('fieldcode,deptna1,deptna2,deptna3,chanmode ');
         Sql.Add('from pycdept ');
         Sql.Add('where (orgnum = :lorg  and deptname like :ldeptnm ) ');
         Sql.Add('  and (existon = ''1'') ');
         Sql.add('order by deptname');
         ParamByName('lorg').AsString         := DeptForm.DataVal2;
         ParamByName('ldeptnm').AsString      := '%'+DeptForm.Deptnm.Text+'%';
      end;
      Open;
 end;
EXCEPT ON E : EDataBaseError DO
  MessageBox(deptForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
END;
end;

{입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..}
function TdeptForm.QDeptDisp(s1,s2 : String; deptGu : integer) : String;
begin
Try
  QDept.Close;
  QDept.Sql.Clear;
  QDept.Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
  QDept.Sql.Add('fieldcode,deptna1,deptna2,chanmode ');
  QDept.Sql.Add('from pycdept ');
  QDept.Sql.Add('where (deptcode =:ldeptcode and orgnum = :lorg) ');
  Qdept.Sql.Add('  and (existon = ''1'') ');
  QDept.ParamByName('Ldeptcode').AsString  := s1;
  Qdept.ParamByName('lorg').AsString       := s2;
  QDept.Open;
  case deptGu of
   1 :  QdeptDisp := QDept.FieldByName('DEPTNAME').AsString;
   2 :  QdeptDisp := QDept.FieldByName('DEPTNA1').AsString;  {본부명}
   3 :  QdeptDisp := QDept.FieldByName('DEPTNA2').AsString;  {부명}
   4 :  QdeptDisp := QDept.FieldByName('DEPTNA3').AsString;  {과명}
  end;
EXCEPT ON E : EDataBaseError DO
  MessageBox(deptForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
END;

end;

procedure TDeptForm.codeGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlue;
     Brush.Color := clYellow;
     Pen.Color   := clBlue;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,'☞  '+Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
       2 : begin
           if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+1,' 폐쇄');
           end;
     end;
   end
else
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlack;
     Brush.Color := clWhite;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,'    '+Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
       2 : begin
           if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+1,' 폐쇄');
           end;
     end;
   end;
end;

procedure TDeptForm.codeGridDblClick(Sender: TObject);
begin
  Code1    := QDept.FieldByName('DEPTCODE').AsString;
  CodeName := QDept.FieldByName('DEPTNM').AsString;
  Code2    := QDept.FieldByName('FIELDCODE').AsString;
  Code3    := QDept.FieldByName('ORGNUM').AsString;
  ModalResult := mrOK;
end;

procedure TDeptForm.FormActivate(Sender: TObject);
begin
 CodeSetup;
// CodeGrid.SetFocus;
 Deptnm.SetFocus;
end;

procedure TDeptForm.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
if Key = chr(27) then begin Qdept.Close; close; end;
  if Key = chr(vk_return) then
  begin
     if Sender = deptnm then
        begin
           RunClick(Sender);
        end
     else
        begin
          codeGridDblClick(codeGrid);
          Key := chr(0);
        end;
  end;
end;

procedure TDeptForm.exitClick(Sender: TObject);
begin
  QDept.Close;
  close;
end;

procedure TDeptForm.RunClick(Sender: TObject);
begin
 DataVal1 := dept.Text;
 DataVal2 := org.Text;
 CodeSetup;
 CodeGrid.SetFocus;
end;

end.


