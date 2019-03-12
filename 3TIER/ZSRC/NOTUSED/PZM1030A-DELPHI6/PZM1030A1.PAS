unit PZM1030A1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls,  IdBaseComponent, IdComponent,AcroPDFLib_TLB,
  IdTCPConnection, IdTCPClient, IdFTP, Buttons, ExtCtrls;

type
  TFmPZM1010A1 = class(TForm)
    Panel2: TPanel;
    BtFirst: TBitBtn;
    BtNext: TBitBtn;
    BtPrevious: TBitBtn;
    BtGoPage: TBitBtn;
    EdNum2: TEdit;
    BtLast: TBitBtn;
    BT_Exit: TBitBtn;
    IdFTP1: TIdFTP;
    Panel1: TPanel;
    Pdf1: TAcroPDF;
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
  end;

var
  FmPZM1010A1: TFmPZM1010A1;

////////////////////////////////////////////////////////////////////////////
function PasString(const s,delimiters : string ; num : integer) : string;
function PasCount(const s,delimiters : string) : integer;
function PassEmp(var cmd : Pchar; gu : integer) : string;
////////////////////////////////////////////////////////////////////////////

implementation

const max_value = 60;  //pdf페이지 수가 변경되면 수정해야함.

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
end;

procedure TFmPZM1010A1.FormShow(Sender: TObject);
begin
  //기간제 계약직 
  if   (PassEmp(cmdline,1) = 'P617') Or (PassEmp(cmdline,1) = 'P625') Or (PassEmp(cmdline,1) = 'P603') Or
       (PassEmp(cmdline,1) = 'P636') Or (PassEmp(cmdline,1) = 'P640') Or (PassEmp(cmdline,1) = 'P601') Or
       (PassEmp(cmdline,1) = 'P628') Or (PassEmp(cmdline,1) = 'P631') Or (PassEmp(cmdline,1) = 'P639') Or
       (PassEmp(cmdline,1) = 'P646') Or (PassEmp(cmdline,1) = 'P649') Or (PassEmp(cmdline,1) = 'P591') Or
       (PassEmp(cmdline,1) = 'P618') Or (PassEmp(cmdline,1) = 'P619') Or (PassEmp(cmdline,1) = 'P621') Or
       (PassEmp(cmdline,1) = 'P623') Or (PassEmp(cmdline,1) = 'P626') Or (PassEmp(cmdline,1) = 'P627') Or
       (PassEmp(cmdline,1) = 'P629') Or (PassEmp(cmdline,1) = 'P632') Or (PassEmp(cmdline,1) = 'P634') Or
       (PassEmp(cmdline,1) = 'P635') Or (PassEmp(cmdline,1) = 'P637') Or (PassEmp(cmdline,1) = 'P638') Or
       (PassEmp(cmdline,1) = 'P641') Or (PassEmp(cmdline,1) = 'P642') Or (PassEmp(cmdline,1) = 'P644') Or
       (PassEmp(cmdline,1) = 'P647') Or (PassEmp(cmdline,1) = 'P648') Or (PassEmp(cmdline,1) = 'P650') Or
       (PassEmp(cmdline,1) = 'P651') Or (PassEmp(cmdline,1) = 'P652') Or (PassEmp(cmdline,1) = 'P653') Or
       (PassEmp(cmdline,1) = 'P655') Or (PassEmp(cmdline,1) = 'P656') Or (PassEmp(cmdline,1) = 'P602') Or
       (PassEmp(cmdline,1) = 'P645') Or (PassEmp(cmdline,1) = 'P654') Or (PassEmp(cmdline,1) = 'P624') Or
       (PassEmp(cmdline,1) = '2096') Or          //관리자 Sample
       (Copy(PassEmp(cmdline,1),1,1) = 'D') Then //개발자 Sample 
  begin
       ShowMessage('File을 다운로드하는데 약간의 시간이 걸립니다.'+#13+#13+
                   'OK 누르고 잠시 기다려 주세요');
       IdFTP1.Connect;
       IdFTP1.Get('취업규정_기간제계약직_201301.PDF','C:\Windows\dsa1.pdf',True);

       if FileExists('C:\Windows\dsa1.pdf') then
       begin
            Pdf1.LoadFile('C:\Windows\dsa1.pdf');
            Pdf1.setZoom(87);
            Pdf1.setShowToolbar(False);
            Pdf1.setShowScrollbars(False);
            Pdf1.setCurrentPage(1);
            n := 1;
            EdNum2.Text := '1';
       end;
  end
  Else If   //무기계약직 
       (PassEmp(cmdline,1) = 'J001') Or (PassEmp(cmdline,1) = 'J002') Or (PassEmp(cmdline,1) = 'J003') Or
       (PassEmp(cmdline,1) = 'J004') Or (PassEmp(cmdline,1) = 'J005') Or (PassEmp(cmdline,1) = 'J006') Or
       (PassEmp(cmdline,1) = 'J007') Or (PassEmp(cmdline,1) = 'J008') Or (PassEmp(cmdline,1) = 'J009') Or
       (PassEmp(cmdline,1) = 'J010') Or (PassEmp(cmdline,1) = 'J011') Or (PassEmp(cmdline,1) = 'J012') Or
       (PassEmp(cmdline,1) = 'J013') Or (PassEmp(cmdline,1) = 'J014') Or (PassEmp(cmdline,1) = 'J015') Or
       (PassEmp(cmdline,1) = 'J016') Or (PassEmp(cmdline,1) = 'J017') Or (PassEmp(cmdline,1) = 'J018') Or
       (PassEmp(cmdline,1) = 'J019') Or (PassEmp(cmdline,1) = 'J020') Or (PassEmp(cmdline,1) = 'J021') Or
       (PassEmp(cmdline,1) = 'J022') Or (PassEmp(cmdline,1) = 'J023') Or (PassEmp(cmdline,1) = 'J051') Or
       (PassEmp(cmdline,1) = 'J056') Or (PassEmp(cmdline,1) = 'P419') Or (PassEmp(cmdline,1) = 'P455') Or
       (PassEmp(cmdline,1) = 'P483') Or (PassEmp(cmdline,1) = 'P485') Or (PassEmp(cmdline,1) = 'P488') Or
       (PassEmp(cmdline,1) = 'P490') Or (PassEmp(cmdline,1) = 'P495') Or (PassEmp(cmdline,1) = 'P496') Or
       (PassEmp(cmdline,1) = 'P498') Or (PassEmp(cmdline,1) = 'P504') Or (PassEmp(cmdline,1) = 'P530') Or
       (PassEmp(cmdline,1) = 'P552') Or (PassEmp(cmdline,1) = 'P553') Or (PassEmp(cmdline,1) = 'P560') Or
       (PassEmp(cmdline,1) = 'P565') Or (PassEmp(cmdline,1) = 'P567') Or (PassEmp(cmdline,1) = 'Q008') Or
       (PassEmp(cmdline,1) = 'Q010') Then
  begin
       ShowMessage('File을 다운로드하는데 약간의 시간이 걸립니다.'+#13+#13+
                   'OK 누르고 잠시 기다려 주세요');
                     
       IdFTP1.Connect;
       IdFTP1.Get('취업규정_무기계약직_201301.PDF','C:\Windows\dsa1.pdf',True);

       if FileExists('C:\Windows\dsa1.pdf') then
       begin
            Pdf1.LoadFile('C:\Windows\dsa1.pdf');
            Pdf1.setZoom(87);
            Pdf1.setShowToolbar(False);
            Pdf1.setShowScrollbars(False);
            Pdf1.setCurrentPage(1);
            n := 1;
            EdNum2.Text := '1';
       end;
  end
  else
  begin
       ShowMessage('해당 프로그램을 볼 수 있는 권한이 부족합니다.'+#13+#13+
                   ' 프로그램을 종료합니다.');
       Close;
  end;
end;

procedure TFmPZM1010A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists('C:\Windows\dsa1.pdf') then deletefile('C:\Windows\dsa1.pdf');
end;

procedure TFmPZM1010A1.BtFirstClick(Sender: TObject);
begin
  Pdf1.gotoFirstPage;
  n := 1;
  EdNum2.Text := '1';
end;

procedure TFmPZM1010A1.BtNextClick(Sender: TObject);
begin
  Pdf1.gotoNextPage;
  n := n + 1;

  EdNum2.Text := IntToStr(n);
  if StrToInt(EdNum2.Text) >= max_value then
  begin
       EdNum2.Text := IntToStr(max_value);
       n           := max_value;
  end;
end;

procedure TFmPZM1010A1.BtPreviousClick(Sender: TObject);
begin
  Pdf1.gotoPreviousPage;
  n := n - 1;

  EdNum2.Text := IntToStr(n);
  if StrToInt(EdNum2.Text) < 1 then
  begin
       EdNum2.Text := '1';
       n           := 1;
  end;
end;

procedure TFmPZM1010A1.BtLastClick(Sender: TObject);
begin
  Pdf1.gotoLastPage;
  n := max_value;
  EdNum2.Text := IntToStr(max_value);
end;

procedure TFmPZM1010A1.BtGoPageClick(Sender: TObject);
begin
  Pdf1.setCurrentPage(StrToInt(EdNum2.Text));
  n := StrToInt(EdNum2.Text);
end;

procedure TFmPZM1010A1.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPZM1010A1.EdNum2Exit(Sender: TObject);
begin
  if EdNum2.Text <  '1' then EdNum2.Text := '1';
  if StrToInt(EdNum2.Text) >= max_value then EdNum2.Text := IntToStr(max_value);
end;

end.
