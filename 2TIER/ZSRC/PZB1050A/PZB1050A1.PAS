{-------------------------------------------------------------------------------
  o 프로그램명 : 종합인사 설치 프로그램 Download
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 기타
-------------------------------------------------------------------------------}
unit PZB1050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, Db, MemDS, ComCtrls, StdCtrls, OnFocusButton,
  Func, OnInsaCommon, PDownLoad, ShellApi, OnRegistry;

type
  TFM_Main = class(TForm)
    BT_Exit: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    BT_Down: TOnFocusButton;
    SB_Help: TStatusBar;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_DownClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

const
  SUBKEY : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
  DevKEY : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템\DOWNLOAD_Dev';

implementation

{$R *.DFM}

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  VarLoading;

  if Pgrade = 'EEEEEEEEEE' then
  begin
       ShowMessage('귀하는 접근 권한이 부족합니다. 프로그램을 종료합니다.');
       Application.Terminate;
  end;  
end;

procedure TFM_Main.BT_DownClick(Sender: TObject);
var vDownPath, vDownFile1, vDownFile2 : String;
begin
  vDownPath  := '/hper/insa/hperson/conbin/zInsaAdmin';
  //2017.08.18 jissi 종합인사시스템 관리자모드 셋업파일 생성으로 설치파일 변경
  //vDownFile1 := 'INSA_ADMIN_SETUP.ZIP';
  vDownFile1 := 'INSASETUP_MANAGER.EXE';
  vDownFile2 := 'INSADEV.EXE';

  //메뉴버전 Registry 초기화. Add  2017.03.02.
  SetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'MenuClientVer','0.00');
  SetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'MenuDnVer','0.00');
  SetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'MenuHostVer','0.00');

  SetKeyValue(HKEY_LOCAL_MACHINE,DevKEY,'HInsaLogin.dll','0.00');
  SetKeyValue(HKEY_LOCAL_MACHINE,DevKEY,'hnewmenu.exe','0.00');
  SetKeyValue(HKEY_LOCAL_MACHINE,DevKEY,'hinsadndn.exe','0.00');
  //////////////////////////////////////////////////////////////////////////////

  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;

  if TComponent(Sender).Tag = 1 then
  begin
       FM_DownLoad.PL_DownLoad(9, vDownPath, vDownFile1 ,vDownFile1, FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
       SB_Help.Panels[1].Text := vDownFile1 +' - '+ GetHomeDir +'경로에 Download ...';
  end
  else if TComponent(Sender).Tag = 2 then
  begin
       FM_DownLoad.PL_DownLoad(9, vDownPath, vDownFile2, vDownFile2, FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
       SB_Help.Panels[1].Text := vDownFile2 +' - '+ GetHomeDir +'경로에 Download ...';
  end;
end;


procedure TFM_Main.OnFocusButton2Click(Sender: TObject);
begin
  ShellExecute(handle,'explore', PChar(GetHomeDir), '', '',SW_SHOWNORMAL);
end;

end.
