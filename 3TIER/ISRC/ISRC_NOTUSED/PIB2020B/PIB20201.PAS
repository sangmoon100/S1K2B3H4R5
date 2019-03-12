{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIB2020B(조직도열람)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : ?
Version         : 30.00
Date            : ?
Update contents
  버전     수정일     수정자   관련근거            수정내용
--------------------------------------------------------------------------------
  30.01   2002.06.17  서혜미   박경철대리(자체)    권한CHECK,▶ 계속->▼,▼더블클릭시 메세지,공석더블클릭시 메세지 등등
  31.07   2004.06.29  이민용   박경철대리(자체)     CI변경으로 폼에서 회사명 문구 뺌
--------------------------------------------------------------------------------}

unit PIB20201;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, DB, DBTables,
  //hjku TXSession,
  Tmax_session, Tmax_DataSetText, OnFocusButton,
  OnInsaCommon, PDownLoad, OnRegistry, TmaxFunc,func;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    orginput: TMenuItem;
    orgclose: TMenuItem;
    Window1: TMenuItem;
    N1: TMenuItem;
    programExit: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    SpeedPanel: TPanel;
    StatusBar: TStatusBar;
    empsrh: TMenuItem;
    BT_Close: TOnFocusButton;
    BcloseSel: TOnFocusButton;
    Bempno: TOnFocusButton;
    BdeptSel: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure UpdateMenuItems(Sender: TObject);
    procedure orgcloseClick(Sender: TObject);
    procedure programExitClick(Sender: TObject);
    procedure WindowMinimizeItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WindowCascadeItemClick(Sender: TObject);
    procedure orginputClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BempnoClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    FreeCheck : Boolean;
    FClientInstance,
    FPrevClientProc : TFarProc;
    PreviligePayra,Previligedeptcode : string;
    //procedure ClientWndProc(VAR Message: TMessage);
    procedure ShowHint(Sender: TObject);
  public
    { Public declarations }
    SelDept  : string[6];
    SelName  : string[60];
    Selym    : string[6];
    mainOrgym: string[6];
    P_empno  : string;
    pkorname : string;
    password : string;
    pclass   : string;
    addept   : string;
    orgdate  : string;
    Start    : integer;
    function empnocheck(var str : string) : Boolean;
    procedure CreateMDIChild(const Name: string);
  end;

  type A = record
    empno     : string;
    paycl     : string;
    payra     : string;
    payrayn   : string;
    deptcode  : string;
    orgnum    : string;
    deptlevel : string;
    extcode   : string;
    boncode   : string;
    fieldcode : string;
    sectcode  : string;
  end;

var
  MainForm: TMainForm;
  cBuf      : array[0..99] of char;
  nBuf      : array[0..99] of char;
  workMan,inputMan : A;

implementation

{$R *.DFM}

uses PIB20202, PIB20203, PIB20204, PIB20205;

// 사원을 체크하여 개인인사열람을 할수 있는 대상인지 체크한다.
function TMainForm.empnocheck(var str : string) : Boolean;
var
  remp,rdep : variant;
  sql, LSfilename : string;
  LAarg : array[0..200] of char;  

  procedure exePerson;
  var
     FTPpath, ObjName : String;
  begin
    statusBar.panels[0].Text := ' ☞ 개인별 인사자료 요약열람을 실행하고 있는 중입니다 !!..';
    SendMessage(MainForm.statusBar.handle,WM_PAINT,0,0);

    ObjName     := UpperCase('PIA1070B.EXE');
    FM_DownLoad := TFM_DownLoad.Create(Application);
    FM_DownLoad.Show;
    FM_DownLoad.PL_ReadEnv;                            //환경변수값(파라미터) 읽어온다.
    FM_DownLoad.PL_VersionCHK3(3, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

    if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(GetHomeDir+'\Bin\3tier\'+ObjName)) then //버젼 & 파일유무 Check
    begin
         FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
    end
    else
    begin
         FM_DownLoad.PL_ProgramCall(GetHomeDir+'\Bin\3tier\'+ObjName);

         if FM_DownLoad.FL_Ret < 32 then
            MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

         FM_DownLoad.Close;      // 다운로드 폼 닫기.
    end;
  end;
  
begin
  inputman.empno    := CData.Passtring(str,',',1);
  inputman.deptcode := CData.Passtring(str,',',5);
  inputman.boncode  := CData.Passtring(str,',',3);
  inputman.extcode  := CData.Passtring(str,',',4);
  inputman.deptlevel:= CData.Passtring(str,',',6);
  inputman.orgnum   := CData.Passtring(str,',',7);
  rdep := CData.Get_BonCode(inputman.deptcode,inputman.orgnum);
  InputMan.fieldcode := rdep[5];
  InputMan.sectcode  := rdep[11];

  remp := CData.Get_EmpCode(p_empno);
  workMan.deptcode := remp[5];
  workMan.orgnum   := remp[4];
  workMan.paycl    := remp[3];
  workMan.payra    := remp[6];
  workMan.payrayn  := remp[10];

  rdep := CData.Get_BonCode(workman.deptcode,workman.orgnum);
  workMan.deptlevel := rdep[10];
  workMan.fieldcode := rdep[5];
  workMan.sectcode  := rdep[11];
  Result := False;

 {====================================================================
 30.01     2000.6.26  겸직자일경우 겸직한 부서의 사원 열람
 =====================================================================}
  if (copy(pclass,2,1) > 'C') and (workman.deptlevel >= 'A0') then
    begin
      with CData.Caddept do
        begin
          ServiceName :='PIB2020B_common';
          Close;
          Sql.Clear;
          Sql.Add(Format('select deptcode from pihorga             '+
                         'where orgym= ''%s''   and empno = ''%s'' '+
                         'and adpayrayn = ''Y'' and gubun = ''0''  ' , [orgdate, p_empno] ));

          ClearFieldInfo;
          AddField('deptcode', ftString, 2000);
          Open;

          if (CData.Caddept.RecordCount > 0) then
            begin
              addept   := CData.Caddept.Fieldbyname('deptcode').Asstring;
            end
          else
            begin
              addept   := '';
            end;
        end;
    end;

  // 개발자,운영자,부시스템운영자,임원,작업자사번과 입력사번이 같으면 통과
  if (copy(pclass,2,1) <= 'C') or (p_empno = inputman.empno) then
    begin
      exeperson; Result := True; system.exit;
    end;

  if (workMan.paycl = '00') then
    begin
      if (WorkMan.payra <= PreviligePayra) or
        (WorkMan.deptcode = PreviligeDeptcode) then
        begin
          exeperson; Result := True; system.exit;
        end;
     if WorkMan.fieldcode = InputMan.fieldcode then
       begin
         exeperson; Result := True; system.exit;
       end;
    end;

  if workMan.payrayn <> 'Y' then
    system.exit;

  if (copy(workman.deptlevel,1,1) = 'A') then  // 부문
     if (workMan.orgnum = inputMan.orgnum) and
        (workman.sectcode = inputman.sectcode) then
       begin
         exeperson;  Result := True; system.exit;
       end;

  if (copy(workman.deptlevel,1,1) = 'B') then  // 실단
     if (workMan.orgnum = inputMan.orgnum) and
        (workman.fieldcode = inputman.fieldcode) then
       begin
         exeperson;  Result := True; system.exit;
       end;

  if (copy(workman.deptlevel,1,1) = 'C') then  // 본부
     if (workMan.orgnum = inputMan.orgnum) and
        (workman.boncode = inputman.boncode) then
       begin
         exeperson;  Result := True; system.exit;
       end;

  if (copy(workman.deptlevel,1,1) = 'D') then
    begin  // 부
      if ((workman.deptcode = inputman.deptcode) and (workMan.orgnum = inputMan.orgnum)) or
         ((workman.deptcode = inputman.extcode) and (workMan.orgnum = inputMan.orgnum))  then
        begin
          exeperson;  Result := True; system.exit;
        end;
    end;

  if (workman.deptcode = inputman.deptcode) and
     (workMan.orgnum = inputMan.orgnum) then
    begin
      exeperson; Result := True; system.exit;
    end;

{  if (addept = inputMan.deptcode) or (addept = inputMan.extcode)
     or (addept = inputMan.boncode) then begin
       Result := True; system.exit;
  end; 30.01 2002.06.17 shm }

  if (addept = inputMan.extcode)
     or (addept = inputMan.boncode) then
    begin
      Result := True; system.exit;
    end;
end;

// 백그라운드화면을 유지하기 위해 설정한다......................................
//procedure TMainForm.ClientWndProc(VAR Message: TMessage);
//var
//  MyDC : hDC;
//  Ro, Co : Word;
//begin
 { with Message do
    case Msg of
      WM_ERASEBKGND:  begin
             MyDC := TWMEraseBkGnd(Message).DC;
              StretchBlt(MyDC,0,0,MainForm.width,MainForm.Height,
                         BackImage.Canvas.Handle,0,0,
                         BackImage.Picture.Width,BackImage.Picture.Height,SRCCOPY);
          Result := 1;
        end;
    else
      Result := CallWindowProc(FPrevClientProc, ClientHandle, Msg, wParam, lParam);
    end;}
//end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Start                     := 0;
  Application.OnHint        := ShowHint;
  Screen.OnActiveFormChange := UpdateMenuItems;

    
  // 바탕 배경색 유지를 위해 필요합니다..
  //if FileExists(pChar(HomeDir+'\pic\조직바탕.bmp')) = True then
  //   BackImage.Picture.LoadFromFile(HomeDir+'\pic\조직바탕.bmp');
  //FClientInstance := MakeObjectInstance(ClientWndProc);
  //FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  //SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  p_empno  := HInsa_Param(cmdline,1);
  pkorname := HInsa_Param(cmdline,2);
  password := HInsa_Param(cmdline,3);
  pclass   := HInsa_Param(cmdline,4);
  SelDept  := '';
  SelName  := '데이타 없슴';
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
   rvar : variant;
begin
  if start = 0 then
    begin
      start := 1;

      CData.TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
      CData.TMaxSession.LabelName   := 'HANAROHPER';
      CData.TMaxSession.Connect  := False;

      try
        CData.TMaxSession.Connect := True;
      except
        Application.MessageBox(PChar('APP서버 접속 실패1'),'에러',mb_ok);
        Application.Terminate;
        Exit;
      end;


  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;

      //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
      FM_Tmax := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := CData.TMaxSession;
      if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
        Application.Terminate;

      if trim(password) = '' then halt(0);
      StatusBar.Panels[0].Text := ' ☞ 조직도 열람 서버와 접속중입니다 !!.';
      Application.ProcessMessages;

      // 변수화일에서 열람부서,열람직위를 읽어온다..
      rvar := CData.Get_Pimvari('00','0003');
      PreviligePayra    := rvar[0];
      Previligedeptcode := rvar[1];
      StatusBar.Panels[0].Text := ' ☞ 열람하고자하는 부서를 선택하시오.';
      orginputClick(Sender);
    end;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusBar.Panels[0].Text := Application.Hint;
end;

{자식 윈도우를 생성한다.....................................................}
procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child : TMDIChild;
      i : integer;
begin
  for i := MDIChildCount-1 downto 0 do
    begin
      if MDIChildren[i].Caption = Name then
        begin
          MDIChildren[i].SetFocus;
          if MDIChildren[i].WindowState = wsMinimized then
            MDIChildren[i].Windowstate := wsMaximized;
          system.exit;
        end
      else
        continue;
    end;

  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
end;

{자식윈도우를  닫는다........................................................}
procedure TMainForm.orgcloseClick(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    ActiveMDIChild.Close;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
end;

function GettopMostWindows(Handle : HWND; Info : pointer) : BOOL; stdcall;
var
  wnd : HWnd;
  StartTime : TDateTime;
begin
  Result := True;
  GetClassName(Handle,@nBuf,100);
  GetWindowText(Handle,@cBuf,100);
  if (trim(strpas(nBuf)) = 'TApplication') then
    begin
      if (uppercase(trim(strpas(cBuf))) = '개인별 인사자료 요약열람') then
        begin
          StartTime := Time;
          wnd := FindWindow(nBuf,cBuf); PostMessage(wnd,WM_QUIT,0,0);
          repeat
            Application.ProcessMessages;
          until (Time-StartTime) > 0.00005;
        end;
    end;
end;

procedure TMainForm.programExitClick(Sender: TObject);
begin
  if MessageBox(handle,'조직도를 종료하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
    begin
      Close;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  pib1070b_hwnd : THandle;
  Topwindow : HWND;
begin
  TopWindow := handle;
  EnumWindows(@GetTopMostWindows,LongInt(@TopWindow));
  if FileExists('c:\jojick1.tmp') = True then DeleteFile(PChar('c:\jojick1.tmp'));
  if FileExists('c:\jojick2.tmp') = True then DeleteFile(PChar('c:\jojick2.tmp'));
  halt(0);
end;

procedure TMainForm.WindowCascadeItemClick(Sender: TObject);
begin
  case TMenuItem(sender).Tag of
    1 : Cascade;
    2 : Tile;
  end;
end;

procedure TMainForm.WindowMinimizeItemClick(Sender: TObject);
var
  i : Integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.UpdateMenuItems(Sender: TObject);
begin
  BcloseSel.enabled          := MDIChildCount > 0;
  orgClose.Enabled           := MDIChildCount > 0;
  WindowCascadeItem.Enabled  := MDIChildCount > 0;
  WindowTileItem.Enabled     := MDIChildCount > 0;
  WindowMinimizeItem.Enabled := MDIChildCount > 0;
end;

{조직차수,부서코드 선택을 누를경우...........................................}
{조직도를 실행한다...........................................................}
procedure TMainForm.orginputClick(Sender: TObject);
var
  tSelym : string;
  i      : integer;
begin
  tSelym := Selym;
  deptSelForm := TdeptSelForm.Create(self);
  Try
    deptSelForm.ShowModal;
    SelDept  := deptSelForm.SelDept;
    SelName  := deptSelForm.SelName;
    Selym    := deptSelForm.Selym;
    mainOrgym:= deptSelForm.pOrgym;
   Finally
    deptSelForm.Free;
  end;
  // 기준년월이 다르면 현조직에서 실행된 모든조직을 닫는다..
  if Selym <> tSelym then begin
     for i := 0 to MDIChildCount-1 do MDIChildren[i].close;
  end;
  if trim(SelDept) <> '' then CreateMDIChild('◎ ' + SelName);
end;

procedure TMainForm.BempnoClick(Sender: TObject);
begin
  empsForm := TempsForm.Create(self);
  Try
    empsForm.ShowModal;
   Finally
    empsForm.Free;
  end;
end;

end.
