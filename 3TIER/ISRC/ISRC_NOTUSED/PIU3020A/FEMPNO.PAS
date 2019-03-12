unit Fempno;
interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,SysUtils,
  StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs, Mask, ExtCtrls,datelib,
  codeText,pass, MemDS, DBAccess, Ora;

type
  TempForm = class(TForm)
    exit: TBitBtn;
    codeGrid: TDBGrid;
    OKBtn: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    empno: TMaskEdit;
    Brun: TBitBtn;
    Panel2: TPanel;
    korname: TMaskEdit;
    QueryBcode: TOraQuery;
    Qdept: TOraQuery;
    Qcode: TOraQuery;
    QueryBcodeempno: TStringField;
    QueryBcodekorname: TStringField;
    QueryBcodenDeptname: TStringField;
    QueryBcodenCodename2: TStringField;
    QueryBcodeJUMINID: TStringField;
    QueryBcodenpstate: TStringField;
    QueryBcodePAYCL: TStringField;
    QueryBcodeORGNUM: TStringField;
    QueryBcodedeptcode: TStringField;
    QueryBcodepayra: TStringField;
    QueryBcodePSTATE: TStringField;
    procedure codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure BrunClick(Sender: TObject);
    procedure kornameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure kornameClick(Sender: TObject);
    procedure QueryBcodeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    gu      : integer;
    check   : Boolean;
    HomeDir : String;
    function QDeptDisp(s1,s2 : String) : String;
    function QCodeDisp(s1,s2 : String) : String;
    procedure MakeTextFile;
  public
    DataVal1  : String[4];   {사원번호}
    DataVal2  : String[12];  {사원명}
    FormData  : String;
    Code      : String;  {코드}
    CodeName  : String;  {코드명}
    { Public declarations }
  end;

var
  empForm: TempForm;
  ErrorHelp: array[0..255] of char;
implementation

uses PIA1010P;

procedure CodeSetup; forward;

{$R *.DFM}
procedure CodeSetup;
begin
  Try
   with empForm.QueryBcode do begin
      Close;
      sql.clear;
      sql.Add('select empno,korname,pstate,orgnum,deptcode,paycl,payra,juminid ');
      sql.Add('  from pimpmas         ');

      if (trim(empForm.DataVal1) <> '') and (trim(empForm.DataVal2) <> '') then
      begin
           sql.Add(' where empno like :lempno and korname like :lkorname ');
           ParamByName('lempno').AsString    := empForm.DataVal1+'%';
           ParamByName('lkorname').AsString  := empForm.DataVal2+'%';
      end;

      if (trim(empForm.DataVal1) <> '') and (trim(empForm.DataVal2) = '') then
      begin
           sql.Add(' where empno like :lempno ');
           ParamByName('lempno').AsString    := empForm.DataVal1+'%';
      end;

      if (trim(empForm.DataVal1) = '') and (trim(empForm.DataVal2) <> '') then
      begin
           sql.Add(' where korname like :lkorname ');
           sql.Add(' order by korname');
           ParamByName('lkorname').AsString  := empForm.DataVal2+'%';
      end
      else sql.Add(' order by empno, korname  ');

      Open;
   end;
  EXCEPT ON E : EDataBaseError DO
    MessageBox(empForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
  END;
end;

function TempForm.QDeptDisp(s1,s2 : String) : String;
{입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..}
begin
  QDeptDisp := '';
  QDept.Close;
  QDept.ParamByName('Ldeptcode').AsString := s1;
  QDept.ParamByName('Lorgnum').AsString  := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then  QDeptDisp := trim(QDept.FieldByName('deptname').AsString)
                           else  QDeptDisp := '부서에러';
  QDept.Close;
end;

{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
function TempForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  QcodeDisp := '';
  if check = False then begin
     QCode.Close;
     QCode.ParamByName('lcodeid').AsString  := s1;
     QCode.ParamByName('lcodeno').AsString  := s2;
     QCode.Open;
     if QCode.Recordcount > 0 then  QCodeDisp := QCode.FieldByName('codename').AsString
                              else  QCodeDisp := '코드에러';
     QCode.Close;
  end else begin
     str := TextCodeDisp(s1,s2,HomeDir+'\fempno.dat');
     if trim(str) = '' then QCodeDisp := '코드에러'
                       else QCodeDisp := str;
  end;
end;


procedure TempForm.codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlue;
     Brush.Color := clYellow;
     Pen.Color   := clBlue;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       2 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       3 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       4 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       5 : TextOut(Rect.Left,Rect.Top+1,
                   copy(Field.AsString,1,2)+'/'+
                   copy(Field.AsString,3,2)+'/'+
                   copy(Field.AsString,5,2));
       6 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
     end;
   end
else
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlack;
     Brush.Color := $00D2D2D2;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       1 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       2 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       3 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       4 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
       5 : TextOut(Rect.Left,Rect.Top+1,
                   copy(Field.AsString,1,2)+'/'+
                   copy(Field.AsString,3,2)+'/'+
                   copy(Field.AsString,5,2));
       6 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
     end;
   end;
end;

procedure TempForm.FormActivate(Sender: TObject);
begin
 Gu := 1;
 HomeDir := HomeDirOpen;
 if DiskSpaceCheck = True then
 begin
    check := True;
    MakeTextFile;
 end
 else check := False;
 
 CodeSetup;
 CodeGrid.SetFocus;    
end;

procedure TempForm.exitClick(Sender: TObject);
begin
  codeToText(HomeDir+'\fempno.dat','',3);
  QueryBcode.Close;
  Code     := '';
  CodeName := '';
  close;
end;

procedure TempForm.codeGridDblClick(Sender: TObject);
begin
  codeToText(HomeDir+'\fempno.dat','',3);
  Code     := QueryBcode.FieldByName('empno').AsString;
  CodeName := QueryBcode.FieldByName('korname').AsString;
  ModalResult := mrOK;
end;

procedure TempForm.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then begin
     QueryBcode.Close;
     Code     := '';
     CodeName := '';
     close;
  end;
  if Key = chr(vk_return) then begin
    Key := chr(0);
    codeGridDblClick(codeGrid);
  end;
end;

procedure TempForm.BrunClick(Sender: TObject);
begin
  DataVal1 := empno.Text;
  DataVal2 := korname.Text;
  CodeSetUp;
  codeGrid.SetFocus;
end;

procedure TempForm.kornameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then gu := TmaskEdit(Sender).Tag;
end;

procedure TempForm.kornameClick(Sender: TObject);
begin
  gu := TmaskEdit(Sender).Tag;
end;

procedure TempForm.QueryBcodeCalcFields(DataSet: TDataSet);
begin
  QueryBcode.FieldByName('nDeptname').AsString :=
  QdeptDisp(QueryBcode.FieldByName('Deptcode').AsString,
            QueryBcode.FieldByName('orgnum').AsString);
//  QueryBcode.FieldByName('nCodeName1').AsString :=
//  QcodeDisp('I112',QueryBcode.FieldByName('paycl').AsString);
  QueryBcode.FieldByName('nCodeName2').AsString :=
  QcodeDisp('I113',QueryBcode.FieldByName('payra').AsString);
  QueryBcode.FieldByName('nPstate').AsString :=
  QcodeDisp('I114',QueryBcode.FieldByName('pstate').AsString);
end;

procedure TempForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\fempno.dat','',0);
 with pia1010aForm.OraQuery1 do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where (codeid = ''I112'' or codeid = ''I113'' or codeid = ''I114'') ');
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
         codeToText('',str,1);
         next;
      end;
      pia1010aForm.OraQuery1.close;
 end;
 codeToText('','',2);
end;

end.
