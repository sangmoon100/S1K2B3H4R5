unit PZM1010A1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls,  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, Buttons, ExtCtrls,
  IdExplicitTLSClientServerBase, AcroPDFLib_TLB, FuncXE;

type
  TFmPZM1010A1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtFirst: TBitBtn;
    BtNext: TBitBtn;
    BtPrevious: TBitBtn;
    BtGoPage: TBitBtn;
    E_Page: TEdit;
    BtLast: TBitBtn;
    BT_Exit: TBitBtn;
    IdFTP1: TIdFTP;
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
    FL_HomeDir : String;
  end;

var
  FmPZM1010A1: TFmPZM1010A1;

implementation

//  /hper/insa/hperson/인사제도메뉴얼.PDF 파일은 암호해제후 업로드해야함.
const max_value = 64;  //표지포함 : pdf페이지 수가 변경되면 수정해야함.

{$R *.dfm}

procedure TFmPZM1010A1.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFmPZM1010A1.FormCreate(Sender: TObject);
begin
  VarLoading;   //2016.06.

  IdFTP1.Host     := FL_UnixIP;  //PassEmp(CmdLine,10);
  IdFTP1.Username := FL_FtpUser; //PassEmp(CmdLine,5);
  IdFTP1.Password := FL_FtpPass; //PassEmp(CmdLine,14);
end;

procedure TFmPZM1010A1.FormShow(Sender: TObject);
begin
  //dsa2000 2017.01. J사번변경에 따른 수정작업
//If (copy(Pempno,1,1) = 'J') or (copy(Pempno,1,1)='P') or (copy(Pempno,1,1)='Q') or (copy(Pempno,1,1)='Y') or (copy(Pempno,1,1)='U') then
  If (copy(Pempno,1,1)='P') or (copy(Pempno,1,1)='Q') or (copy(Pempno,1,1)='Y') or (copy(Pempno,1,1)='U') then
  begin
       ShowMessage('해당 메뉴얼 열람 권한이 부족합니다.');
       Close;
  end
  else
  begin
       IdFTP1.Connect;
       //IdFTP1.Get('인사제도메뉴얼.PDF',C:\Windows\pdf1.pdf',True);            //Delphi 6
       IdFTP1.Get('PERSONNEL_MANAGEMENT_2015.PDF', 'C:\Windows\pdf1.pdf',True); //Delphi XE 2016.04.

       if FileExists('C:\Windows\pdf1.pdf') then
       begin
            AcroPDF1.LoadFile('C:\Windows\pdf1.pdf');
            //AcroPDF1.setZoom(77);
            AcroPDF1.setShowToolbar(False);
            AcroPDF1.setShowScrollbars(False);
            AcroPDF1.setCurrentPage(1);
            n := 1;
            E_Page.Text := '0';
       end;
  end;
end;

procedure TFmPZM1010A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists('C:\Windows\pdf1.pdf') then deletefile('C:\Windows\pdf1.pdf');
end;

procedure TFmPZM1010A1.BtFirstClick(Sender: TObject);
begin
  AcroPDF1.gotoFirstPage;
  n := 1;
  E_Page.Text := '0';
end;

procedure TFmPZM1010A1.BtNextClick(Sender: TObject);
begin
  AcroPDF1.gotoNextPage;
  n := n + 1;

  E_Page.Text := IntToStr(n - 1);
  if StrToInt(E_Page.Text) >= max_value then
  begin
       E_Page.Text := IntToStr(max_value - 1);
       n           := max_value;
  end;
end;

procedure TFmPZM1010A1.BtPreviousClick(Sender: TObject);
begin
  AcroPDF1.gotoPreviousPage;
  n := n - 1;

  E_Page.Text := IntToStr(n -1);
  if StrToInt(E_Page.Text) < 1 then
  begin
       E_Page.Text := '0';
       n           := 1;
  end;
end;

procedure TFmPZM1010A1.BtLastClick(Sender: TObject);
begin
  AcroPDF1.gotoLastPage;
  n := max_value;
  E_Page.Text := IntToStr(max_value - 1);
end;

procedure TFmPZM1010A1.BtGoPageClick(Sender: TObject);
begin
  AcroPDF1.setCurrentPage(StrToInt(E_Page.Text) +1);
  n := StrToInt(E_Page.Text) + 1;
end;

procedure TFmPZM1010A1.E_PageExit(Sender: TObject);
begin
  if E_Page.Text < '1' then E_Page.Text := '0';
  if StrToInt(E_Page.Text)-1 >= max_value then E_Page.Text := IntToStr(max_value-1);
end;


end.
