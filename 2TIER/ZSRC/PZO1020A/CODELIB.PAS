unit CODELIB;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, MemDS, DBAccess, Ora, Func, OnScheme,
  OnFocusButton;

type
  TcodeForm = class(TForm)
    DataSource1: TDataSource;
    codeGrid: TDBGrid;
    Panel2: TPanel;
    Codeno: TMaskEdit;
    Panel3: TPanel;
    CodeN: TMaskEdit;
    QueryBcode: TOraQuery;
    //Q_pay: TOraQuery;
    QueryBcodeCODENO: TStringField;
    QueryBcodeCODENAME: TStringField;
    QueryBcodeCODEFNAME: TStringField;
    //Q_paypaygr: TStringField;
    //Q_paybasicamt: TStringField;
    QueryBcodeGROUPCODE: TStringField;
    QueryBcodeGROUPCODENAME: TStringField;
    QueryBcodeGROUPCODE2: TStringField;
    QueryBcodeGROUPCODENAME2: TStringField;
    QueryBcodeNATIONCD: TStringField;
    QueryBcodeNATIONCDNAME: TStringField;
    SF_code: TOnSchemeForm;
    Brun: TOnFocusButton;
    OKBtn: TOnFocusButton;
    exit: TOnFocusButton;
    procedure codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure BrunClick(Sender: TObject);
    procedure CodenoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodenoClick(Sender: TObject);
  private
    { Private declarations }
  public
    DataVal1       : String;
    DataVal2       : String;
    DataVal3       : String;
    vgroupcode     : String;
    vgroupcode2    : String;
    vnationcd      : String;
    FormData       : String;
    Code           : String;  {코드}
    CodeName       : String;  {코드명}
    groupcode      : String;
    groupcodename  : String;
    groupcode2     : String;
    groupcodename2 : String;
    nationcd       : String;
    nationcdname   : String;

    gu         : integer;
    function QcodeDisp(s1,s2 : string; codeGu : integer) : String;
  end;

var
  codeForm: TcodeForm;
implementation

//uses Pia1012a;

procedure CodeSetup; forward;

{$R *.DFM}

procedure CodeSetup;
{찾고자하는 코드값을 설정하여 데이타베이스에서 찾아온다..}
var
  //ErrorHelp : array[0..255] of char;
  sOrderBy: String;
begin
    CodeForm.codeGrid.Visible := True;

    codeForm.QueryBcode.Session := Ora_Session;
    with codeForm.QueryBcode do
    begin
      CodeForm.DataVal2 := codeForm.codeno.Text;
      CodeForm.DataVal3 := codeForm.coden.Text;
      if CodeForm.DataVal3 <> '' then
          sOrderBy := ' order by codename, codeno '
      else
          sOrderBy := ' order by codeno, codename ';
      Close;
      Sql.Clear;
      Sql.Add( ' select codeid,codeno,codename,codefname         '+
               '       ,groupcode,  groupcodename                '+
               '       ,groupcode2, groupcodename2               '+
               '       ,nationcd                                 '+
               '       ,(select codename from pyccode            '+
               '          where codeid =''SK03''                 '+
               '            and codeno = a.nationcd) nationcdname'+
               ' from pyccode a                                  '+
               ' where codeid = :p_code                          '+
               '   and useyn  = ''Y''                            '+
               '   and codeno     like :p_no                     '+
               '   and codename   like :p_name                   '+
               '   and NVL(groupcode, '' '')  like :p_groupcode  '+
               '   and NVL(groupcode2, '' '') like :p_groupcode2 '+
               '   and NVL(nationcd, '' '')   like :p_nationcd   ');

      if codeForm.DataVal1 ='I120' then // 31.79  노조 여부가 'Y' 이면 직책코드를 'N' 이면 제외사유코드를 코드창에 보여줌  정규용
      begin
      //  if pia1110aForm.nojoYN.Text = 'Y' then  //노조원이면 직책코드를
      //     Sql.Add('  and (codeno > = ''30'' and codeno <= ''5A'')')
      //  else                                   //비노조원이면 제외사유코드를
      //     Sql.Add('  and (codeno > = ''9A'' and codeno <= ''9G'')');
      end;

      if codeForm.DataVal1 ='I115' then //2007.04.11 서혜미 (정정명씨 ->, 헷갈린다고 빼달라고 요청)
      begin
           Sql.Add('  and  codeno not in (''10'',''20'',''30'',''40'')             ');
      end;

      Sql.Add(sOrderBy);
      ParamByName('p_code').AsString       := codeForm.DataVal1;
      ParamByName('p_no').AsString         := codeForm.DataVal2+'%';
      ParamByName('p_name').AsString       := codeForm.DataVal3+'%';
      ParamByName('p_groupcode').AsString  := codeForm.vgroupcode+'%';
      ParamByName('p_groupcode2').AsString := codeForm.vgroupcode2+'%';
      ParamByName('p_nationcd').AsString   := codeForm.vnationcd+'%';
      Open;        // codeForm.Edit1.text := sql.text;
      codeForm.codeGrid.SetFocus;
    end;
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
   2 :  QCodeDisp := QueryBcodeCODEFNAME.AsString;
 end;

EXCEPT ON E : EDataBaseError DO
  MessageBox(codeForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
END;
end;

procedure TcodeForm.codeGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
{리스트된 데이타를 꾸민다..}
begin

  if gdSelected in state then
  begin
      Code           := QueryBcodeCODENO.AsString;
      CodeName       := QueryBcodeCODENAME.AsString;
      groupcode      := QueryBcodeGROUPCODE.AsString;
      groupcodeName  := QueryBcodeGROUPCODENAME.AsString;
      groupcode2     := QueryBcodeGROUPCODE2.AsString;
      groupcodeName2 := QueryBcodeGROUPCODENAME2.AsString;
      nationcd       := QueryBcodeNATIONCD.AsString;
      nationcdName   := QueryBcodeNATIONCDNAME.AsString;
  end;
end;

procedure TcodeForm.FormActivate(Sender: TObject);
{폼이 생성될때}
begin
 gu := 2;
 CodeSetup;
 CodeForm.SF_code.Caption.Text := FormData+'[코드ID : '+Dataval1+']';
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
    Code           := QueryBcodeCODENO.AsString;
    CodeName       := QueryBcodeCODENAME.AsString;
    groupcode      := QueryBcodeGROUPCODE.AsString;
    groupcodeName  := QueryBcodeGROUPCODENAME.AsString;
    groupcode2     := QueryBcodeGROUPCODE2.AsString;
    groupcodeName2 := QueryBcodeGROUPCODENAME2.AsString;
    nationcd       := QueryBcodeNATIONCD.AsString;
    nationcdName   := QueryBcodeNATIONCDNAME.AsString;
    ModalResult := mrOK;

    QueryBcode.Close;
    close;
end;

procedure TcodeForm.codeGridKeyPress(Sender: TObject; var Key: Char);
{Enter 키소리제거 }
begin
  if Key = chr(27) then
  begin
    //QueryBcode.Close;
    //close;
    Key := chr(0);
    exitClick(sender);
  end
  else if key = chr(13) then
  begin
    Key := chr(0);
    if TMaskEdit(Sender).Tag = 2 then
         codeGrid.DataSource.DataSet.Locate('codeno', codeno.Text, [loPartialKey])
    else
         codeGrid.DataSource.DataSet.Locate('codename', codeN.Text, [loPartialKey]);
    codeGridDblClick(codeGrid);
  end;
end;

procedure TcodeForm.BrunClick(Sender: TObject);
{실행버턴을 누를경우}
begin
  DataVal2 := codeno.Text;
  CodeSetUp;
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
