{ Sampleprocedure Tpia1010aForm.empnoDblClick(Sender: TObject);begin
   OraEmpForm := TOraEmpForm.Create(self);
   Try
   if TMaskEdit(Sender).Tag = 1 then OraEmpForm.DataVal1 := empno.Text
   else                              OraEmpForm.DataVal2 := korname.Text;

   OraEmpForm.ShowModal;

   if OraEmpForm.code <> '' then
   begin
      empno.Text   := OraEmpForm.Code;
      korname.Text := OraEmpForm.CodeName;
      P_empno      := empno.Text;
      P_korname    := korname.Text;
   end else
   begin
      empno.Text   := '';
      korname.Text := '';
      empno.setfocus;
   end;

   Finally
      OraEmpForm.Free;
   end;
end;}unit OraFempno;
interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,SysUtils,
  StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs, Mask, ExtCtrls,datelib,
  codeText,pass, MemDS, DBAccess, Ora, Func;

type
  TOraEmpForm = class(TForm)
    exit: TBitBtn;
    codeGrid: TDBGrid;
    OKBtn: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    empno: TMaskEdit;
    Brun: TBitBtn;
    Panel2: TPanel;
    korname: TMaskEdit;
    OraQuery1: TOraQuery;
    QueryBcode: TOraQuery;
    QueryBcodeempno: TStringField;
    QueryBcodekorname: TStringField;
    QueryBcodenDeptname: TStringField;
    QueryBcodenCodename2: TStringField;
    QueryBcodeJUMINID: TStringField;
    QueryBcodenpstate: TStringField;
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
  OraEmpForm: TOraEmpForm;
  ErrorHelp: array[0..255] of char;
implementation

procedure CodeSetup; forward;

{$R *.DFM}
procedure CodeSetup;
begin
  Try
     OraEmpForm.QueryBcode.Session := Ora_Session;
     with OraEmpForm.QueryBcode do
     begin
          Close;
          sql.clear;
          if (trim(OraEmpForm.DataVal1) = '') and (trim(OraEmpForm.DataVal2) = '') then
          begin
              sql.Add('select empno,korname,pstate,paycl,orgnum,deptcode,payra,juminid ');
              sql.Add('  from pimpmas                                                  ');
              sql.Add(' order by empno,korname                                         ');
          end;

          if (trim(OraEmpForm.DataVal1) <> '') and (trim(OraEmpForm.DataVal2) <> '') then
          begin
               sql.Add('select empno,korname,pstate,paycl,orgnum,deptcode,payra,juminid ');
               sql.Add('  from pimpmas                                                  ');
               sql.Add(' where empno like :lempno and korname like :lkorname            ');
               sql.Add(' order by empno,korname                                         ');
               ParamByName('lempno').AsString    := OraEmpForm.DataVal1+'%';
               ParamByName('lkorname').AsString  := OraEmpForm.DataVal2+'%';
          end;

          if (trim(OraEmpForm.DataVal1) = '') and (trim(OraEmpForm.DataVal2) <> '') then
          begin
               sql.Add('select empno,korname,pstate,paycl,orgnum,deptcode,payra,juminid ');
               sql.Add('  from pimpmas                                                  ');
               sql.Add(' where korname like :lkorname                                   ');
               sql.Add(' order by korname, Empno                                        ');
               ParamByName('lkorname').AsString  := OraEmpForm.DataVal2+'%';
           end;

          if (trim(OraEmpForm.DataVal1) <> '') and (trim(OraEmpForm.DataVal2) = '') then
          begin
               sql.Add('select empno,korname,pstate,paycl,orgnum,deptcode,payra,juminid ');
               sql.Add('  from pimpmas                                                  ');
               sql.Add(' where empno like :lempno                                       ');
               sql.Add(' order by Empno, korname                                        ');
               ParamByName('lempno').AsString    := OraEmpForm.DataVal1+'%';
           end;
          Open;
     end;
  EXCEPT ON E : EDataBaseError DO
    MessageBox(OraEmpForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
  END;
end;

function TOraEmpForm.QDeptDisp(s1,s2 : String) : String;
{입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..}
begin
  QDeptDisp := '';
  OraEmpForm.OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select deptname from pycdept ');
       Sql.Add(' where deptcode = :ldeptcode ');
       Sql.Add('   and orgnum   = :lorgnum   ');
       ParamByName('Ldeptcode').AsString := s1;
       ParamByName('Lorgnum').AsString  := s2;
       Open;
       if  Recordcount > 0 then  QDeptDisp := trim(FieldByName('deptname').AsString)
       else                      QDeptDisp := '부서에러';
       Close;
  end;
end;

{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
function TOraEmpForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  QcodeDisp := '';
  OraEmpForm.OraQuery1.Session := Ora_Session;
  if check = False then
  begin
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Select codename from pyccode ');
            Sql.Add (' where codeid = :lcodeid     ');
            Sql.Add ('   and codeno = :lcodeno     ');
            ParamByName('lcodeid').AsString  := s1;
            ParamByName('lcodeno').AsString  := s2;
            Open;
            if  Recordcount > 0 then  QCodeDisp := FieldByName('codename').AsString
            else                      QCodeDisp := '코드에러';
            Close;
       end;
  end
  else
  begin
       str := TextCodeDisp(s1,s2,HomeDir+'\fempno.dat');
       if trim(str) = '' then QCodeDisp := '코드에러'
                         else QCodeDisp := str;
  end;
end;


procedure TOraEmpForm.codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
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
            4 : TextOut(Rect.Left,Rect.Top+1,
                        copy(Field.AsString,1,2)+'/'+
                        copy(Field.AsString,3,2)+'/'+
                        copy(Field.AsString,5,2));
            5 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
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
            4 : TextOut(Rect.Left,Rect.Top+1,
                        copy(Field.AsString,1,2)+'/'+
                        copy(Field.AsString,3,2)+'/'+
                        copy(Field.AsString,5,2));
            5 : TextOut(Rect.Left,Rect.Top+1,Field.AsString);
          end;
     end;
end;

procedure TOraEmpForm.FormActivate(Sender: TObject);
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

procedure TOraEmpForm.exitClick(Sender: TObject);
begin
  codeToText(HomeDir+'\fempno.dat','',3);
  QueryBcode.Close;
  Code     := '';
  CodeName := '';
  close;
end;

procedure TOraEmpForm.codeGridDblClick(Sender: TObject);
begin
  codeToText(HomeDir+'\fempno.dat','',3);
  Code     := QueryBcode.FieldByName('empno').AsString;
  CodeName := QueryBcode.FieldByName('korname').AsString;
  ModalResult := mrOK;
end;

procedure TOraEmpForm.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then
  begin
     QueryBcode.Close;
     Code     := '';
     CodeName := '';
     close;
  end;

  if Key = chr(vk_return) then
  begin
       Key := chr(0);
       codeGridDblClick(codeGrid);
  end;
end;

procedure TOraEmpForm.BrunClick(Sender: TObject);
begin
  DataVal1 := empno.Text;
  DataVal2 := korname.Text;
  CodeSetUp;
  codeGrid.SetFocus;
end;

procedure TOraEmpForm.kornameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then gu := TmaskEdit(Sender).Tag;
end;

procedure TOraEmpForm.kornameClick(Sender: TObject);
begin
  gu := TmaskEdit(Sender).Tag;
end;

procedure TOraEmpForm.QueryBcodeCalcFields(DataSet: TDataSet);
begin
  with QueryBcode do
  begin
       FieldByName('nDeptname').AsString  := QdeptDisp(FieldByName('Deptcode').AsString,
                                                       FieldByName('orgnum').AsString);
       ///FieldByName('nCodeName1').AsString := QcodeDisp('I112',FieldByName('paycl').AsString);
       FieldByName('nCodeName2').AsString := QcodeDisp('I113',FieldByName('payra').AsString);
       FieldByName('nPstate').AsString    := QcodeDisp('I114',FieldByName('pstate').AsString);
  end;
end;

procedure TOraEmpForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\fempno.dat','',0);
 OraEmpForm.OraQuery1.Session := Ora_Session;
 with OraQuery1 do
 begin
      close;
      sql.clear;
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
      OraQuery1.close;
 end;
 codeToText('','',2);
end;

end.
