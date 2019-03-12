{* ======================= Program Header ======================================
 PROGRAM-NAME   : PZN2000A(도급인력관리)
 SYSTEM-NAME    : 기타
 SUBSYSTEM-NAME : 도급인력관리
 Programmer     :
 Version        :
 Date           :
Update Contents
   Version    date(yy.mm.dd)     programmer      description               relevant doc.no
   1.00       2014.02.28         강륜종          도급인력시스템 개발
============================================================================= *}
unit PZN2000A1;

interface

uses
  Windows, WinProcs, Wintypes, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, OnScheme, ExtCtrls, ComCtrls, OnListview, OnOutlook, OnVertScroller,
  ToolWin, Menus, OnPopupMenu, StdCtrls, OnFocusButton, ImgList, OnEditUtils,
  OnStringUtils, Db, OnMemDataset, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnRichEdit, OleCtrls,  OnTrayicon, OnSkinBtn, OnRegistry, Func,
  OnInternetFtp, jpeg, DBAccess, Ora, MemDS, pass,
  OnEditMemo;


type
  TOnGDIRes   = function : Word; stdcall;

  TFM_MainMenu = class(TForm)
    SB_Help: TStatusBar;
    Ora_Qry1: TOraQuery;
    BT_1: TOnFocusButton;
    BT_2: TOnFocusButton;
    BT_4: TOnFocusButton;
    HelpMemo: TOnMemo;
    SF_Main: TOnSchemeForm;
    BT_Title: TOnFocusButton;
    procedure ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_1Click(Sender: TObject);
    procedure BT_2Click(Sender: TObject);
    procedure BT_4Click(Sender: TObject);

  private
    { Private declarations }
  public
    FG_Orgnum   : String;
    FG_Empno    : String;
    FG_UserName : String;
    P_Empno     : String;
    { Public declarations }
 end;

var
  FM_MainMenu: TFM_MainMenu;

implementation

uses SubPmas, SubCode;

{$R *.DFM}


///////////////////////////////////////////////////////////////////////////////
procedure TFM_MainMenu.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_MainMenu.FormCreate(Sender: TObject);
begin
  OraConnect;

  Ora_Session.AutoCommit := True;  //반드시...
  Ora_Session.Connected  := False;
  Ora_Session.Connected  := True;  //AutoCommit 설정을 위하여 DB 재접속 

  FG_empno    := Pempno;
  FG_UserName := Pkorname;
end;

procedure TFM_MainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFM_MainMenu.BT_1Click(Sender: TObject);
begin
  FM_code := TFM_code.Create(Self);
  try
       FM_code.ShowModal;
  finally
       FM_code.Free;
  end;
end;

procedure TFM_MainMenu.BT_2Click(Sender: TObject);
begin
  FM_PMas := TFM_PMas.Create(Self);
  try
       FM_PMas.ShowModal;
  finally
       FM_PMas.Free;
  end;
end;

procedure TFM_MainMenu.BT_4Click(Sender: TObject);
begin
  Close;
end;

procedure TFM_MainMenu.FormShow(Sender: TObject);
var FG_SysDate : String;
begin
  if Copy(Pgrade,2,1) > 'C' then
  begin
       MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
       close;
       Exit;
  end;

  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       SQL.ADD('Select Value1 From Pimvari Where gubun=''00'' And sgubun=''0001'' ');
       Open;
       FG_Orgnum := FieldByName('Value1').Asstring ;
  end;

  FG_SysDate := Fn_GetDateTimeStr;
  SB_Help.Panels[1].Text := ' [ ' + FG_Empno + ' ] ' + FG_UserName;
  SB_Help.Panels[3].Text := Copy(FG_SysDate, 1,4)    + '.' +
                            Copy(FG_SysDate, 5,2)    + '.' +
                            Copy(FG_SysDate, 7,2)    + ' ' +
                            Copy(FG_SysDate, 9,2)    + ':' +
                            Copy(FG_SysDate,11,2);
end;

end.
