unit PZM1030A1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls,  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, Buttons, ExtCtrls,
  IdExplicitTLSClientServerBase, AcroPDFLib_TLB, FuncXE;

type
  TFmPZM1010A1 = class(TForm)
    Panel2: TPanel;
    BtFirst: TBitBtn;
    BtNext: TBitBtn;
    BtPrevious: TBitBtn;
    BtGoPage: TBitBtn;
    E_Page: TEdit;
    BtLast: TBitBtn;
    BT_Exit: TBitBtn;
    IdFTP1: TIdFTP;
    Panel1: TPanel;
    AcroPDF1: TAcroPDF;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtFirstClick(Sender: TObject);
    procedure BtNextClick(Sender: TObject);
    procedure BtPreviousClick(Sender: TObject);
    procedure BtLastClick(Sender: TObject);
    procedure BtGoPageClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure E_PageExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    n : integer;
  end;

var
  FmPZM1010A1: TFmPZM1010A1;

implementation

const max_value = 20;  //pdf페이지 수가 변경되면 수정해야함.

{$R *.dfm}

procedure TFmPZM1010A1.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPZM1010A1.FormCreate(Sender: TObject);
begin
  VarLoading;     //2016.06.

  IdFTP1.Host     := FL_UnixIP;  //PassEmp(CmdLine,10);
  IdFTP1.Username := FL_FtpUser; //PassEmp(CmdLine,5);
  IdFTP1.Password := FL_FtpPass; //PassEmp(CmdLine,14);
end;

procedure TFmPZM1010A1.FormShow(Sender: TObject);
var vFtpFileName : String;
begin
  //기간제 계약직 
  if   (Pempno = 'P617') Or (Pempno = 'P625') Or (Pempno = 'P603') Or (Pempno = 'P636') Or
       (Pempno = 'P640') Or (Pempno = 'P601') Or (Pempno = 'P628') Or (Pempno = 'P631') Or
       (Pempno = 'P639') Or (Pempno = 'P646') Or (Pempno = 'P649') Or (Pempno = 'P591') Or
       (Pempno = 'P618') Or (Pempno = 'P619') Or (Pempno = 'P621') Or (Pempno = 'P623') Or
       (Pempno = 'P626') Or (Pempno = 'P627') Or (Pempno = 'P629') Or (Pempno = 'P632') Or
       (Pempno = 'P634') Or (Pempno = 'P635') Or (Pempno = 'P637') Or (Pempno = 'P638') Or
       (Pempno = 'P641') Or (Pempno = 'P642') Or (Pempno = 'P644') Or (Pempno = 'P647') Or
       (Pempno = 'P648') Or (Pempno = 'P650') Or (Pempno = 'P651') Or (Pempno = 'P652') Or
       (Pempno = 'P653') Or (Pempno = 'P655') Or (Pempno = 'P656') Or (Pempno = 'P602') Or
       (Pempno = 'P645') Or (Pempno = 'P654') Or (Pempno = 'P624') Or
       (Pempno = '2684') Or (Pempno = '1884') Or (Copy(Pempno,1,1) = 'D') Then   //관리자 & 개발자
  begin
     //IdFTP1.Get('취업규정_기간제계약직_201301.PDF','C:\Windows\pdf2.pdf',True);//Delphi 6
     //IdFTP1.Get('EMPLOYMENT_P_201301.PDF',  'C:\Windows\pdf2.pdf',True);       //Delphi XE 2016.05.
       vFtpFileName := 'EMPLOYMENT_P_201301.PDF';                                //2016.06. 변수로 통합
  end
  Else If   //무기계약직
       (Pempno = 'J001') Or (Pempno = 'J002') Or (Pempno = 'J003') Or (Pempno = 'J004') Or
       (Pempno = 'J005') Or (Pempno = 'J006') Or (Pempno = 'J007') Or (Pempno = 'J008') Or
       (Pempno = 'J009') Or (Pempno = 'J010') Or (Pempno = 'J011') Or (Pempno = 'J012') Or
       (Pempno = 'J013') Or (Pempno = 'J014') Or (Pempno = 'J015') Or (Pempno = 'J016') Or
       (Pempno = 'J017') Or (Pempno = 'J018') Or (Pempno = 'J019') Or (Pempno = 'J020') Or
       (Pempno = 'J021') Or (Pempno = 'J022') Or (Pempno = 'J023') Or (Pempno = 'J051') Or
       (Pempno = 'J056') Or (Pempno = 'P419') Or (Pempno = 'P455') Or (Pempno = 'P483') Or
       (Pempno = 'P485') Or (Pempno = 'P488') Or (Pempno = 'P490') Or (Pempno = 'P495') Or
       (Pempno = 'P496') Or (Pempno = 'P498') Or (Pempno = 'P504') Or (Pempno = 'P530') Or
       (Pempno = 'P552') Or (Pempno = 'P553') Or (Pempno = 'P560') Or (Pempno = 'P565') Or
       (Pempno = 'P567') Or (Pempno = 'Q008') Or (Pempno = 'Q010') Then
  begin
     //IdFTP1.Get('취업규정_무기계약직_201301.PDF','C:\Windows\pdf2.pdf',True); //Delphi 6
     //IdFTP1.Get('EMPLOYMENT_J_201301.PDF', 'C:\Windows\pdf2.pdf',True);       //Delphi XE 2016.05.
       vFtpFileName := 'EMPLOYMENT_J_201301.PDF';                               //2016.06. 변수로 통합
  end
  else
  begin
       ShowMessage('해당 프로그램을 볼 수 있는 권한이 부족합니다.'+#13+#13+
                   ' 프로그램을 종료합니다.');
       Close;
       Exit;
  end;

  IdFTP1.Connect;
  IdFTP1.Get(vFtpFileName, 'C:\Windows\pdf2.pdf',True);

  ShowMessage('취업규정 File을 다운로드합니다.'+#13+#13+ 'OK 버튼을 클릭하세요.');

  if FileExists('C:\Windows\pdf2.pdf') then
  begin
       AcroPDF1.LoadFile('C:\Windows\pdf2.pdf');               //AcroPDF1.setZoom(87);
       AcroPDF1.setShowToolbar(False);
       AcroPDF1.setShowScrollbars(False);
       AcroPDF1.setCurrentPage(1);
       n := 1;
       E_Page.Text := '1';
  end;
end;

procedure TFmPZM1010A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists('C:\Windows\pdf2.pdf') then deletefile('C:\Windows\pdf2.pdf');
end;

procedure TFmPZM1010A1.BtFirstClick(Sender: TObject);
begin
  AcroPDF1.gotoFirstPage;
  n := 1;
  E_Page.Text := '1';
end;

procedure TFmPZM1010A1.BtNextClick(Sender: TObject);
begin
  AcroPDF1.gotoNextPage;
  n := n + 1;

  E_Page.Text := IntToStr(n);
  if StrToInt(E_Page.Text) >= max_value then
  begin
       E_Page.Text := IntToStr(max_value);
       n           := max_value;
  end;
end;

procedure TFmPZM1010A1.BtPreviousClick(Sender: TObject);
begin
  AcroPDF1.gotoPreviousPage;
  n := n - 1;

  E_Page.Text := IntToStr(n);
  if StrToInt(E_Page.Text) < 1 then
  begin
       E_Page.Text := '1';
       n           := 1;
  end;
end;

procedure TFmPZM1010A1.BtLastClick(Sender: TObject);
begin
  AcroPDF1.gotoLastPage;
  n := max_value;
  E_Page.Text := IntToStr(max_value);
end;

////////////////////////////////////////////////////////////////////////////////
procedure TFmPZM1010A1.E_PageExit(Sender: TObject);
begin
  if E_Page.Text <  '1' then E_Page.Text := '1';
  if StrToInt(E_Page.Text) >= max_value then E_Page.Text := IntToStr(max_value);
end;

procedure TFmPZM1010A1.BtGoPageClick(Sender: TObject);
begin
  AcroPDF1.setCurrentPage(StrToInt(E_Page.Text));
  n := StrToInt(E_Page.Text);
end;
////////////////////////////////////////////////////////////////////////////////

end.
