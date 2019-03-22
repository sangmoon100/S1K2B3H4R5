unit pic70303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, jgrid, jshape, HanEdit, StdCtrls, Mask, ExtCtrls, jeonPan, DB;

type
  TBonForm = class(TForm)
    JeonPanel3: TJeonPanel;
    JeonPanel1: TJeonPanel;
    Panel1: TPanel;
    dept: TMaskEdit;
    Panel3: TPanel;
    deptnm: THanEdit;
    JeonPanel2: TJeonPanel;
    CodeGrid: Jdbgrid;
    Brun: TButton;
    Bsel: TButton;
    Bexit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure CodeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BrunClick(Sender: TObject);
    procedure BselClick(Sender: TObject);
    procedure CodeGridDblClick(Sender: TObject);
    procedure CodeGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Start : Boolean;
    procedure CodeSetup;
  public
    { Public declarations }
     deptcode,deptname,orgnum,boncode,bongubun : string;
  end;

var
  BonForm: TBonForm;

implementation

uses pic70302;

{$R *.DFM}

procedure TBonForm.CodeSetup;
begin
   deptcode := trim(dept.Text);
   deptname := trim(deptnm.Text);
   with CData.Qscr do begin
        Close; Sql.Clear;
        if  (deptcode <> '') and (deptname <> '') then begin
           Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
           if (bongubun = 'Yes') then begin
              Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                      '  and (deptname like :ldeptnm   and length(deptcode) >= 5) '+
                      '  and (boncode = :lbon)');
              ParamByName('lbon').AsString  := boncode;
           end else
              Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                      '  and (deptname like :ldeptnm   and length(deptcode) >= 5) ');
           Sql.add('order by deptcode');
           ParamByName('ldeptcode').AsString    := deptcode+'%';
           ParamByName('lorg').AsString         := orgnum;
           ParamByName('ldeptnm').AsString      := '%'+deptname+'%';
        end;
        if  (deptcode = '') and (deptname = '') then begin
           Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
           if (bongubun = 'Yes') then begin
              Sql.Add('where (orgnum = :lorg and length(deptcode) >= 5) '+
                      '  and (boncode = :lbon)');
              ParamByName('lbon').AsString  := boncode;
           end else
              Sql.Add('where (orgnum = :lorg and length(deptcode) >= 5) ');
           Sql.Add('order by deptcode');
           ParamByName('lorg').AsString := orgnum;
        end;
        if  (deptcode <> '')  and (deptname = '') then begin
           Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
           if (bongubun = 'Yes') then begin
              Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                      '  and (length(deptcode) >= 5 and boncode = :lbon)');
              ParamByName('lbon').AsString  := boncode;
           end else
              Sql.Add('where (deptcode like :ldeptcode and orgnum = :lorg) '+
                      '  and (length(deptcode) >= 5) ');
           Sql.add('order by deptcode');
           ParamByName('ldeptcode').AsString    := deptcode+'%';
           ParamByName('lorg').AsString         := orgnum;
        end;
        if  (deptcode = '') and (deptname <> '') then begin
           Sql.Add('select orgnum,deptcode,deptname,chanmode from pycdept ');
           if (bongubun = 'Yes') then begin
              Sql.Add('where (orgnum = :lorg  and deptname like :ldeptnm ) '+
                      '  and (length(deptcode) >= 5 and boncode = :lbon)');
              ParamByName('lbon').AsString  := boncode;
           end else
              Sql.Add('where (orgnum = :lorg  and deptname like :ldeptnm ) '+
                      '  and (length(deptcode) >= 5) ');
           Sql.add('order by deptname');
           ParamByName('lorg').AsString    := orgnum;
           ParamByName('ldeptnm').AsString := '%'+deptname+'%';
        end;
        open;
   end;
end;

// 폼에관련된 사항들................................................................................
procedure TBonForm.FormCreate(Sender: TObject);
begin
   Start := True;
end;

procedure TBonForm.FormPaint(Sender: TObject);
begin
  if Start = True then begin
     Start := False;
     Application.ProcessMessages;
     CodeSetUp;
  end;
end;

procedure TBonForm.BexitClick(Sender: TObject);
begin
   deptcode := '';
   orgnum   := '';
   boncode  := '';
   CData.Qscr.close;
   close;
end;

// 그리드를 다시금 그린다...........................................................................
procedure TBonForm.CodeGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if gdSelected in state then begin
     with (Sender as TDBGrid).Canvas do begin
       Font.Color  := clBlue;
       Brush.Color := $008CF2DB;
       Pen.Color   := clBlue;
       FillRect(Rect);
       case Field.Index of
         0 : TextOut(Rect.Left,Rect.Top+3,'☞  '+Field.AsString);
         1 : TextOut(Rect.Left,Rect.Top+3,' '+Field.AsString);
         2 : begin
               if Field.AsString = '0' then TextOut(Rect.Left,Rect.Top+3,' 조직');
               if Field.AsString = '1' then TextOut(Rect.Left,Rect.Top+3,' 신설');
               if Field.AsString = '2' then TextOut(Rect.Left,Rect.Top+3,' 변동');
               if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+3,' 폐쇄');
             end;
       end;
     end;
   end else begin
     with (Sender as TDBGrid).Canvas do begin
       Font.Color  := clBlack;
       Brush.Color := $00E2E2E2;
       FillRect(Rect);
       case Field.Index of
         0 : TextOut(Rect.Left,Rect.Top+3,'    '+Field.AsString);
         1 : TextOut(Rect.Left,Rect.Top+3,' '+Field.AsString);
         2 : begin
               if Field.AsString = '0' then TextOut(Rect.Left,Rect.Top+3,' 조직');
               if Field.AsString = '1' then TextOut(Rect.Left,Rect.Top+3,' 신설');
               if Field.AsString = '2' then TextOut(Rect.Left,Rect.Top+3,' 변동');
               if Field.AsString = '3' then TextOut(Rect.Left,Rect.Top+3,' 폐쇄');
             end;
       end;
     end;
   end;
end;

// 실행버턴을 누를경우..............................................................................
procedure TBonForm.BrunClick(Sender: TObject);
begin
   CodeSetUp;
   CodeGrid.SetFocus;
end;

// 선택버턴을 누를경우..............................................................................
procedure TBonForm.BselClick(Sender: TObject);
begin
    deptcode := CData.Qscr.FieldByName('deptcode').AsString;
    deptname := CData.Qscr.FieldByName('deptname').AsString;
    CData.Qscr.close;
    close;
end;

procedure TBonForm.CodeGridDblClick(Sender: TObject);
begin
    BselClick(Sender);
end;

procedure TBonForm.CodeGridKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = chr(27) then begin
      CData.Qscr.Close;
      close;
   end;
   
   if Key = chr(vk_return) then begin
      codeGridDblClick(codeGrid);
      Key := chr(0);
   end;
end;

end.
