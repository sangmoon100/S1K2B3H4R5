unit pia10805;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, jeonPan, jshape, DB,
  DBTables, HanEdit, MemDS, DBAccess, Ora;

type
  TUpDeptForm = class(TForm)
    JeonPanel1: TJeonPanel;
    Panel1: TPanel;
    dept: TMaskEdit;
    Panel3: TPanel;
    JeonPanel2: TJeonPanel;
    JeonPanel3: TJeonPanel;
    codeGrid: TDBGrid;
    Brun: JeonShape;
    Bsel: JeonShape;
    Bexit: JeonShape;
    DataSource1: TDataSource;
    deptnm: THanEdit;
    QDept: TOraQuery;
    QDeptDEPTCODE: TStringField;
    QDeptDEPTNAME: TStringField;
    QDeptCHANMODE: TStringField;
    QDeptORGNUM: TStringField;
    procedure codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BexitClick(Sender: TObject);
    procedure BrunClick(Sender: TObject);
    procedure BselClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    start : integer;
    tempCheck : string;
    procedure CodeSetup;
  public
    { Public declarations }
    deptcode,deptname,orgnum,boncode,bongubun,bonyn : string;
  end;

var
  UpDeptForm: TUpDeptForm;

implementation

{$R *.DFM}
procedure TUpDeptForm.CodeSetup;
begin
 deptcode := dept.Text;
 deptname := deptnm.Text;
 with QDept do
 begin
      Close;
      Sql.Clear;
      if  (trim(deptcode) <> '') and (trim(deptname) <> '') then
      begin
         Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
         if (bongubun = 'Yes') then
         begin
            Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                    '  and (deptname like :ldeptnm   and length(deptcode) >= 5) '+
                    '  and (boncode = :lbon)');
            ParamByName('lbon').AsString  := boncode;
         end
         else
            Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                    '  and (deptname like :ldeptnm   and length(deptcode) >= 5) ');
         Sql.add('order by deptcode');
         ParamByName('ldeptcode').AsString    := deptcode+'%';
         ParamByName('lorg').AsString         := orgnum;
         ParamByName('ldeptnm').AsString      := '%'+deptname+'%';
      end;

      if  (trim(deptcode) = '') and (trim(deptname) = '') then
      begin
         Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
         if (bongubun = 'Yes') then
         begin
            Sql.Add('where (orgnum = :lorg and length(deptcode) >= 5) '+
                    '  and (boncode = :lbon)');
            ParamByName('lbon').AsString  := boncode;
         end
         else
            Sql.Add('where (orgnum = :lorg and length(deptcode) >= 5) ');
         Sql.Add('order by deptcode');
         ParamByName('lorg').AsString := orgnum;
      end;

      if  (trim(deptcode) <> '')  and (trim(deptname) = '') then
      begin
         Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
         if (bongubun = 'Yes') then
         begin
            Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                    '  and (length(deptcode) >= 5 and boncode = :lbon)');
            ParamByName('lbon').AsString  := boncode;
         end
         else
            Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                    '  and (length(deptcode) >= 5) ');
         Sql.add('order by deptcode');
         ParamByName('ldeptcode').AsString    := deptcode+'%';
         ParamByName('lorg').AsString         := orgnum;
      end;

      if  (trim(deptcode) = '') and (trim(deptname) <> '') then
      begin
         Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
         if (bongubun = 'Yes') then
         begin
            Sql.Add('where (orgnum = :lorg  and deptname like :ldeptnm ) '+
                    '  and (length(deptcode) >= 5 and boncode = :lbon)');
            ParamByName('lbon').AsString  := boncode;
         end
         else
            Sql.Add('where (orgnum = :lorg  and deptname like :ldeptnm ) '+
                    '  and (length(deptcode) >= 5) ');
         Sql.add('order by deptname');
         ParamByName('lorg').AsString    := orgnum;
         ParamByName('ldeptnm').AsString := '%'+deptname+'%';
      end; //edit1.Text := sql.text;
      Open;
 end;
end;

procedure TUpDeptForm.codeGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlue;
     Brush.Color := $008CF2DB;
     Pen.Color   := clBlue;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,'¢Ñ  '+Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
       2 : begin
           if Field.AsString = '0' then TextOut(Rect.Left,Rect.Top+1,' Á¶Á÷');
           if Field.AsString = '1' then TextOut(Rect.Left,Rect.Top+1,' ½Å¼³');
           if Field.AsString = '2' then TextOut(Rect.Left,Rect.Top+1,' º¯µ¿');
           if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+1,' Æó¼â');
           end;
     end;
   end
else
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlack;
     Brush.Color := $00E2E2E2;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,'    '+Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,' '+Field.AsString);
       2 : begin
           if Field.AsString = '0' then TextOut(Rect.Left,Rect.Top+1,' Á¶Á÷');
           if Field.AsString = '1' then TextOut(Rect.Left,Rect.Top+1,' ½Å¼³');
           if Field.AsString = '2' then TextOut(Rect.Left,Rect.Top+1,' º¯µ¿');
           if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+1,' Æó¼â');
           end;
     end;
   end;
end;

procedure TUpDeptForm.BexitClick(Sender: TObject);
begin
   deptcode := '';
   orgnum   := '';
   boncode  := '';
   Qdept.Close;
   close;
end;

procedure TUpDeptForm.BrunClick(Sender: TObject);
begin
   CodeSetUp;
   CodeGrid.SetFocus;
end;

procedure TUpDeptForm.BselClick(Sender: TObject);
begin
  deptcode := QDept.FieldByName('deptcode').AsString;
  deptname := QDept.FieldByName('deptname').AsString;
  Qdept.close;
  close;
end;

procedure TUpDeptForm.codeGridDblClick(Sender: TObject);
begin
  BselClick(Sender);
end;

procedure TUpDeptForm.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then
  begin
      Qdept.Close;
      close;
  end;

  if Key = chr(vk_return) then
  begin
    if dept.text<> '' then
       Qdept.Locate('deptcode',UpperCase(dept.Text),[loPartialKey])
    else
       Qdept.Locate('deptname',deptnm.Text,[loPartialKey]);
    codeGridDblClick(codeGrid);
    Key := chr(0);
  end;
end;

procedure TUpDeptForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TUpDeptForm.FormPaint(Sender: TObject);
begin
  if start = 0 then
  begin
     start := 1;
     Application.ProcessMessages;
     tempCheck := bongubun;
     if bonyn = 'Yes' then bongubun := 'Yes';
     CodeSetUp;
     bongubun := tempCheck;
  end;
end;

end.
