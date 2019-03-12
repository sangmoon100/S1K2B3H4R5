unit PZM1010A1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls,  IdBaseComponent, IdComponent,AcroPDFLib_TLB,
  IdTCPConnection, IdTCPClient, IdFTP, Buttons, ExtCtrls, OnRegistry;

type
  TFmPZM1010A1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtFirst: TBitBtn;
    BtNext: TBitBtn;
    BtPrevious: TBitBtn;
    BtGoPage: TBitBtn;
    EdNum2: TEdit;
    AcroPDF1: TAcroPDF;
    BtLast: TBitBtn;
    BT_Exit: TBitBtn;
    IdFTP1: TIdFTP;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtFirstClick(Sender: TObject);
    procedure BtNextClick(Sender: TObject);
    procedure BtPreviousClick(Sender: TObject);
    procedure BtLastClick(Sender: TObject);
    procedure BtGoPageClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure EdNum2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    n : integer;
    FL_HomeDir : String;
  end;

var
  FmPZM1010A1: TFmPZM1010A1;

const
  SUBKEY : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';

  ////////////////////////////////////////////////////////////////////////////
  function PasString(const s,delimiters : string ; num : integer) : string;
  function PasCount(const s,delimiters : string) : integer;
  function PassEmp(var cmd : Pchar; gu : integer) : string;
  ////////////////////////////////////////////////////////////////////////////

implementation

//  /hper/insa/hperson/인사제도메뉴얼.PDF 파일은 암호해제후 업로드해야함.
const max_value = 64;  //표지포함 : pdf페이지 수가 변경되면 수정해야함.

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////
function PasCount(const s,delimiters : string) : integer;
var
  delimiter : Boolean;
  count,i   : integer;
begin
  count := 0;
  delimiter := True;
  if Length(s) > 0 then
  begin
       i := 1;
       while (Pos(delimiters,s[i]) <> 0) and (i <= Length(s)) do inc(i);
       for i := i to length(s) do
           if Pos(delimiters,s[i]) <> 0 then delimiter := True
           else
           begin
                if delimiter = True then inc(Count);
                delimiter := False;
           end;
  end;
  PasCount := Count;
end;

function PasString(const s,delimiters : string ; num : integer) : string;
var
   i,j,sLength,sStart,sEnd : integer;
begin
 if PasCount(s,delimiters) >= num then
 begin
      sStart := 1;
      while (Pos(delimiters,s[sStart]) <> 0) and (sStart <= Length(s)) do inc(sStart);

      for j := 1 to num - 1 do
      begin
           while Pos(delimiters,s[sStart]) =  0 do inc(sStart);
           while Pos(delimiters,s[sStart]) <> 0 do inc(sStart);
      end;

      sEnd := sStart;
      for i := sStart to Length(s) do
      begin
           if s[i] =  delimiters then break;
           if s[i] <> delimiters then inc(sEnd);
      end;
      sLength   := sEnd - sStart;
      pasString := trim(copy(s,sStart,sLength));
  end
  else pasString := '';
end;

function PassEmp(var cmd : Pchar; gu : integer) : string;
var
  str     : string;
begin
  PassEmp := '';  str := '';
  str := strpas(cmd);
  case gu of
       1 : PassEmp := pasString(str,',',2);
       2 : PassEmp := pasString(str,',',3);
       3 : PassEmp := pasString(str,',',4);
       4 : PassEmp := pasString(str,',',5);
       5 : PassEmp := pasString(str,',',6);
       6 : PassEmp := pasString(str,',',7);
       7 : PassEmp := pasString(str,',',8);
       8 : PassEmp := pasString(str,',',9);
       9 : PassEmp := pasString(str,',',10);
       10: PassEmp := pasString(str,',',11);
       11: PassEmp := pasString(str,',',12);
       12: PassEmp := pasString(str,',',13);
       13: PassEmp := pasString(str,',',14);
       14: PassEmp := pasString(str,',',15);
       15: PassEmp := pasString(str,',',16);
  end;
end;
////////////////////////////////////////////////////////////////////////////

procedure TFmPZM1010A1.FormCreate(Sender: TObject);
begin
  IdFTP1.Host := PassEmp(cmdline,10);
  IdFTP1.User := PassEmp(cmdline,5);
  IdFTP1.Password := PassEmp(cmdline,14);

  if PassEmp(cmdline,14) = '' then IdFTP1.Password := 'qjsro12';
  
  FL_HomeDir := GetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'NewHomeDir');
end;

procedure TFmPZM1010A1.FormShow(Sender: TObject);
begin
  if (copy(PassEmp(cmdline,1),1,1) = 'J') or //(copy(PassEmp(cmdline,1),1,1) = 'M') or
     (copy(PassEmp(cmdline,1),1,1) = 'P') or (copy(PassEmp(cmdline,1),1,1) = 'Q') or
     (copy(PassEmp(cmdline,1),1,1) = 'Y') or (copy(PassEmp(cmdline,1),1,1) = 'U') then
  begin
       ShowMessage('해당 메뉴얼을 보실수 있는 권한이 부족합니다.');
       Close;
  end
  else
  begin
       IdFTP1.Connect;
       IdFTP1.Get('인사제도메뉴얼.PDF',FL_HomeDir+'\Bin\a.pdf',True);

       if FileExists(FL_HomeDir+'\Bin\a.pdf') then
       begin
            AcroPDF1.LoadFile(FL_HomeDir+'\Bin\a.pdf');
            AcroPDF1.setZoom(90);
            AcroPDF1.setShowToolbar(False);
            AcroPDF1.setShowScrollbars(False);
            AcroPDF1.setCurrentPage(1);
            n := 1;
            EdNum2.Text := '0';
       end;
  end;
end;

procedure TFmPZM1010A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists(FL_HomeDir+'\Bin\a.pdf') then deletefile(FL_HomeDir+'\Bin\a.pdf');
  if FileExists(FL_HomeDir+'\Bin\a - 복사본.pdf') then deletefile(FL_HomeDir+'\Bin\a - 복사본.pdf');  
end;

procedure TFmPZM1010A1.BtFirstClick(Sender: TObject);
begin
  AcroPDF1.gotoFirstPage;
  n := 1;
  EdNum2.Text := '0';
end;

procedure TFmPZM1010A1.BtNextClick(Sender: TObject);
begin
  AcroPDF1.gotoNextPage;
  n := n + 1;

  EdNum2.Text := IntToStr(n - 1);
  if StrToInt(EdNum2.Text) >= max_value then
  begin
       EdNum2.Text := IntToStr(max_value - 1);
       n           := max_value;
  end;
end;

procedure TFmPZM1010A1.BtPreviousClick(Sender: TObject);
begin
  AcroPDF1.gotoPreviousPage;
  n := n - 1;

  EdNum2.Text := IntToStr(n -1);
  if StrToInt(EdNum2.Text) < 1 then
  begin
       EdNum2.Text := '0';
       n           := 1;
  end;
end;

procedure TFmPZM1010A1.BtLastClick(Sender: TObject);
begin
  AcroPDF1.gotoLastPage;
  n := max_value;
  EdNum2.Text := IntToStr(max_value - 1);
end;

procedure TFmPZM1010A1.BtGoPageClick(Sender: TObject);
begin
  AcroPDF1.setCurrentPage(StrToInt(EdNum2.Text) +1);
  n := StrToInt(EdNum2.Text) + 1;
end;

procedure TFmPZM1010A1.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPZM1010A1.EdNum2Exit(Sender: TObject);
begin
  if EdNum2.Text < '1' then EdNum2.Text := '0';
  if StrToInt(EdNum2.Text)-1 >= max_value then EdNum2.Text := IntToStr(max_value-1);
end;


end.
