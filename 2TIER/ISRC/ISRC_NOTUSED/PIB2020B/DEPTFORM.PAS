unit deptForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, jgrid, ExtCtrls, Tabs, StdCtrls, Buttons,
  Mask, Menus, calen1,timeFtp, jshape, MemDS, DBAccess, Ora ;

type
  TdeptSelForm = class(TForm)
    Jdbgrid1: Jdbgrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    orgym: TMaskEdit;
    Borgym: TBitBtn;
    BcloseSel: TBitBtn;
    serchword: TMaskEdit;
    Bserch: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    G_31: JeonShape;
    G_32: JeonShape;
    G_33: JeonShape;
    G_34: JeonShape;
    G_35: JeonShape;
    Sdept: TOraQuery;
    Qvari: TOraQuery;
    SdeptDEPTCODE: TStringField;
    SdeptDEPTNAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Jdbgrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Jdbgrid1DblClick(Sender: TObject);
    procedure BorgymClick(Sender: TObject);
    procedure BcloseSelClick(Sender: TObject);
    procedure DeptSelect(Sender: TObject);
    procedure BserchClick(Sender: TObject);
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
{$R *.DFM}

procedure TdeptSelForm.FormActivate(Sender: TObject);
begin
  Qvari.close;
  Qvari.Open;
  orgym.Text := Qvari.FieldByName('value1').AsString;
  pOrgym     := Qvari.FieldByName('value1').AsString;
  Qvari.close;
  Jdbgrid1.visible := False;
  orgym.SetFocus;
  DeptSelect(G_31);
end;

procedure TdeptSelForm.Jdbgrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlue;
     Brush.Color := $00CBBDF0;
     Pen.Color   := clBlack;
     FillRect(Rect);
     //Rectangle(Rect.Left+1,Rect.Top+1,Rect.Right,Rect.Bottom-1);
     case Field.Index of
       0 : TextOut(Rect.Left+2,Rect.Top+8,' ☞ '+Field.AsString);
       1 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
     end;
end else
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlack;
     Brush.Color := $00E7E7E7;
     Pen.Color   := clBlack;
     FillRect(Rect);
     //Rectangle(Rect.Left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
     case Field.Index of
       0 : TextOut(Rect.Left+2,Rect.Top+8,'    '+Field.AsString);
       1 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
     end;
   end;
end;

// 그리드에서 더블클릭할경우----------------------------------------------------
procedure TdeptSelForm.Jdbgrid1DblClick(Sender: TObject);
begin
  SelDept := sDept.FieldByName('deptcode').AsString;
  SelName := sDept.FieldByName('deptname').AsString;
  Selym   := orgym.Text;
  sDept.Close;
  Close;
end;

// 켈린더를 호출한다..----------------------------------------------------------
procedure TdeptSelForm.BorgymClick(Sender: TObject);
var
  temp : string;
begin
 Calendar := TCalendar.Create(Self);
 Try
   temp := orgym.Text;
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then
      orgym.Text := copy(Calendar.DayCaption,1,6);
 Finally
   Calendar.Free;
   orgym.SetFocus;
 End;
 // 기준년월이 바뀌었다. 어떻게 하것인가?.
 if orgym.text <> temp then DeptSelect(G_31);
end;

procedure TdeptSelForm.BcloseSelClick(Sender: TObject);
begin
  SelDept := '';
  SelName := '';
  Selym   := orgym.Text;
  sDept.Close;  close;
end;

// 찾고자하는 부서를 검색한다...................................................
procedure TdeptSelForm.DeptSelect(Sender: TObject);
begin
  Jdbgrid1.visible := True;
  sDept.sql.clear; sDept.close;
  sDept.sql.add('select deptcode,deptname||''  ''||deptabbr deptname,deptlevel from pihorga ');
  case TComponent(Sender).tag of
    1 : sDept.sql.add('where orgym = :lorgym and gubun = ''0''');  //전사.
    2 : sDept.sql.add('where orgym = :lorgym and  substr(deptlevel,1,1)  = ''A'' and gubun = ''0''');  //부문,
    3 : sDept.sql.add('where orgym = :lorgym and  substr(deptlevel,1,1)  = ''B'' and gubun = ''0''');  //실단
    4 : sDept.sql.add('where orgym = :lorgym and  substr(deptlevel,1,1)  = ''C'' and gubun = ''0''');  //본부
    5 : sDept.sql.add('where orgym = :lorgym and  substr(deptlevel,1,1)  = ''D'' and gubun = ''0''');  //부.
    6 : sDept.sql.add(Format('where (orgym = :lorgym and gubun = ''0'') and deptname like ''%s'' ',    //부서 검색.
                      ['%'+serchword.Text+'%']));
  end;
  sDept.sql.add(' order by deptcode ');
  sDept.ParamByName('lorgym').AsString := orgym.Text;
  sDept.Open;
  if sDept.RecordCount = 0 then Jdbgrid1.visible := False
  else begin
     Jdbgrid1.visible := True;
     Jdbgrid1.SetFocus;
  end;
end;

// 찾고자하는 부서를 검색한다...................................................
procedure TdeptSelForm.BserchClick(Sender: TObject);
begin
  DeptSelect(Sender);
end;

end.
