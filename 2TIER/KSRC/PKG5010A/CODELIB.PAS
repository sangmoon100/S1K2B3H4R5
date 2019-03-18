unit Codelib;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, MemDS, DBAccess, Ora;

type
  TcodeForm = class(TForm)
    exit: TBitBtn;
    DataSource1: TDataSource;
    OKBtn: TBitBtn;
    QueryBcode: TOraQuery;
    QueryBcodeCODENO: TStringField;
    QueryBcodeCODENAME: TStringField;
    codeGrid: TDBGrid;
    procedure codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure CodenoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodenoClick(Sender: TObject);
  private
    { Private declarations }
  public
    DataVal1 : String;
    DataVal2 : String;
    DataVal3 : String;
    FormData : String;
    Code     : String;  {코드}
    CodeName : String;  {코드명}
    gu       : integer;
    
    function QcodeDisp(s1,s2 : string; codeGu : integer) : String;
  end;

var
  codeForm: TcodeForm;
implementation

uses pkg5010a1;

procedure CodeSetup; forward;

{$R *.DFM}

procedure CodeSetup; {찾고자하는 코드값을 설정하여 데이타베이스에서 찾아온다..}
var
  ErrorHelp : array[0..255] of char;
  sOrderBy: String;
begin
  Try
    begin
      CodeForm.codeGrid.Visible := True;
      with codeForm.QueryBcode do
      begin
        Close;
        Sql.Clear;
        Sql.Add( ' select codeno,codename,codefname  '+
                 ' from pyccode                      '+
                 ' where codeid = :p_codeid          '+
//                 '   and codeno = :p_codeno          '+
                 '   and useyn  = ''Y''              '+
                 ' order by codeno, codename         ');
        ParamByName('p_codeid').AsString  := codeForm.DataVal1;
//        ParamByName('p_codeno').AsString  := codeForm.DataVal2;
        Open;

        codeForm.codeGrid.SetFocus;
      end;
    end;
  EXCEPT ON E : EDataBaseError DO
    MessageBox(codeForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
  END;
end;

function TcodeForm.QCodeDisp(s1,s2 : String; codeGu :integer) : String;
{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
var
  ErrorHelp : array[0..255] of char;
begin
 Try
   with QueryBcode do
     begin
       Close;
       ParamByName('Lcode').AsString  := s1;
       ParamByName('Lno').AsString    := s2;
       Open;
     end;
  case codegu of
    1 :  QCodeDisp := QueryBcodeCODENAME.AsString;
//    2 :  QCodeDisp := QueryBcodeCODEFNAME.AsString;
  end;

 EXCEPT ON E : EDataBaseError DO
  MessageBox(codeForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
 END;
end;

procedure TcodeForm.codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
{리스트된 데이타를 꾸민다..}
begin
    Code     := QueryBcodeCODENO.AsString;
    CodeName := QueryBcodeCODENAME.AsString;
end;

procedure TcodeForm.FormActivate(Sender: TObject);
{폼이 생성될때}
begin
 gu := 2;
 CodeSetup;
 CodeForm.Caption := FormData+'[코드ID : '+Dataval1+']';
end;

procedure TcodeForm.exitClick(Sender: TObject);
begin
  code := '';
  codename := '';
  ModalResult := mrCancel;

  QueryBcode.Close;
  close;
end;

procedure TcodeForm.codeGridDblClick(Sender: TObject);
{코드값을 넘겨준다..}
begin
  begin
    Code     := QueryBcodeCODENO.AsString;
    CodeName := QueryBcodeCODENAME.AsString;
    ModalResult := mrOK;

    QueryBcode.Close;
  end;
  close;
end;
procedure TcodeForm.CodenoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_TAB then gu := TmaskEdit(Sender).Tag;
end;

procedure TcodeForm.CodenoClick(Sender: TObject);
begin
 gu := TmaskEdit(Sender).Tag;
end;

end.

{
procedure TcodeForm.codeGridKeyPress(Sender: TObject; var Key: Char); {Enter 키소리제거
begin
  if Key = chr(27) then
  begin
    Key := chr(0);
    exitClick(sender);
  end
  else if key = chr(13) then
  begin
    Key := chr(0);
    codeGridDblClick(codeGrid);
  end;
end;                                                                                    }
