unit Kycode1;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls, MemDS, DBAccess, Ora;

type
  TFkycode1 = class(TForm)
    BBclose: TBitBtn;
    DataSource1: TDataSource;
    codeGrid: TDBGrid;
    BBrun: TBitBtn;
    Codeno: TMaskEdit;
    BBchkout: TBitBtn;
    RBcode: TRadioButton;
    RBname: TRadioButton;
    QueryBcode: TOraQuery;
    QueryBcodeCODENO: TStringField;
    QueryBcodeCODENAME: TStringField;
    QueryBcodeCODEFNAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure BBchkoutClick(Sender: TObject);
    procedure CodenoKeyPress(Sender: TObject; var Key: Char);
    procedure RBcodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    CloseChk : Integer; {Return Code -> 0 : 정상종료, -1 : 비정상종료}
    DataVal1 : String[4];
    DataVal2 : String[10];
    FormData : String;
    Code     : String;  {코드}
    CodeName : String;  {코드명}
    function QcodeDisp(s1,s2 : string; codeGu : integer) : String;
  end;

var
  Fkycode1: TFkycode1;
implementation

procedure CodeSetup; forward;

{$R *.DFM}

procedure CodeSetup;
{찾고자하는 코드값을 설정하여 데이타베이스에서 찾아온다..}
var
  ErrorHelp : array[0..255] of char;
begin
Try
 with Fkycode1.QueryBcode do
 begin
    Close;
    Sql.Clear;
    begin
      if Fkycode1.DataVal1 = 'IPAY' Then
      begin
        Sql.Add('SELECT to_char(paygr,''999999990'') codeno,'+
                '       to_char(basicamt,''9999999999999999990'') codename, '+
                '       to_char(basicamt,''99999999999999999999999999990'') codefname '+                
                'FROM pkcigtbl where paynum =    '+
                ' (SELECT cpaynum from pkcigbas) ');
      end
      else
      begin
        Sql.Add('select codeid,codeno,codename,codefname from pyccode ');
        Sql.Add('where (codeid = :lcode ');
        Sql.Add('  and (codeno like :lno');
        Sql.Add('   or  codename like :lno))');
        ParamByName('lcode').AsString  := Fkycode1.DataVal1;
        ParamByName('lno').AsString    := '%'+Fkycode1.DataVal2+'%';
        If Fkycode1.RBname.Checked then begin
           Sql.Add('order by codename');
        end else begin
           Sql.Add('order by codeno');
        end;
      end;
      Open;
    end;
    end;
    EXCEPT ON E : EDataBaseError DO
      MessageBox(Fkycode1.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
    end;
end;

function TFkycode1.QCodeDisp(s1,s2 : String; codeGu :integer) : String;
{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
var
  ErrorHelp : array[0..255] of char;
begin
 Try
 with QueryBcode do
 begin
  Close;
  ParamByName('Lcodeid').AsString  := s1;
  ParamByName('Lcodesub').AsString := s2;
  Open;
 end;
 case codegu of
   1 :  QCodeDisp := QueryBcodeCODENAME.AsString;
   2 :  QCodeDisp := QueryBcodeCODEFNAME.AsString;
 end;

EXCEPT ON E : EDataBaseError DO
  MessageBox(Fkycode1.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
END;
end;

procedure TFkycode1.FormActivate(Sender: TObject);
{폼이 생성될때}
begin
 Codeno.Text := DataVal2;
 CodeSetup;
 Fkycode1.Caption := FormData +' [' + DataVal1 + ']';
end;

procedure TFkycode1.BBcloseClick(Sender: TObject);
begin
  CloseChk := -1;
  QueryBcode.Close;
  close;
end;

procedure TFkycode1.codeGridDblClick(Sender: TObject);
{코드값을 넘겨준다..}
begin
  CloseChk := 1;
  Code     := QueryBcodeCODENO.AsString;
  CodeName := QueryBcodeCODENAME.AsString;
  ModalResult := mrOK;
end;

procedure TFkycode1.codeGridKeyPress(Sender: TObject; var Key: Char);
{Enter 키소리제거 }
begin
if key = chr(13) then
begin
  Key := chr(0);
  codeGridDblClick(codeGrid);
end;

end;

procedure TFkycode1.BBchkoutClick(Sender: TObject);
{실행버턴을 누를경우}
begin
  DataVal2 := codeno.Text;
  CodeSetUp;
end;

procedure TFkycode1.CodenoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DataVal2 := codeno.Text;
        CodeSetUp;
     end;
end;

procedure TFkycode1.RBcodeClick(Sender: TObject);
begin
     CodeSetup;
     Codeno.Setfocus;
end;

end.
