{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB2020b(조직도 열람)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1996.08.03
Update    contents
  1.00   1997.08.03    전철호     신규프로그램개발                                처리명세서
 30.00   2000.09.29    강기우     조직변경(H05)으로 Deptlevel을 자동 쿼리저장함.  하병수대리 요청.-->색깔조정.
-----------------------------------------------------}

unit orgmain;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, DB, DBTables,
  Grids, DBGrids, jgrid,pass,datelib, codetext, csReg, PDownload, Func, OnRegistry,
  MemDS, DBAccess, Ora;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    orginput: TMenuItem;
    orgclose: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    programExit: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    SpeedPanel: TPanel;
    BdeptSel: TSpeedButton;
    BcloseSel: TSpeedButton;
    BhelpSel: TSpeedButton;
    SpeedButton6: TSpeedButton;
    BackImage: TImage;
    StatusBar: TStatusBar;
    Bempno: TSpeedButton;
    empsrh: TMenuItem;
    Qtext: TOraQuery;
    OraQuery1: TOraQuery;
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
    procedure BhelpSelClick(Sender: TObject);
    procedure BempnoClick(Sender: TObject);
  private
    { Private declarations }
    FreeCheck : Boolean;
    FClientInstance,
    FPrevClientProc : TFarProc;
    PreviligePayra,Previligedeptcode : string;
    procedure ClientWndProc(VAR Message: TMessage);
    procedure ShowHint(Sender: TObject);
    procedure MakeTextFile;
  public
    { Public declarations }
    SelDept  : string[6];
    SelName  : string[60];
    Selym    : string[6];
    mainOrgym: string[6];
    Start    : integer;
    Sel_Empno : String;
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
  end;

var
  MainForm: TMainForm;
  cBuf      : array[0..99] of char;
  nBuf      : array[0..99] of char;
  HomeDir   : String;
  workMan,inputMan : A;
const
  crHand1 = 1;
  crHand2 = 2;

  varisql = 'select value1,value2 from pimvari where gubun =''00'' and sgubun = ''0003'' ';
implementation

{$R *.DFM}

uses orgChild,deptForm,empForm;

procedure TMainForm.MakeTextFile;
var
  str : string;
begin
 codeToText('c:\insacode.dat','',0);
 with QText do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where substr(codeid,1,1) = ''I'' ');
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
         codeToText('',str,1);
         next;
      end;
      QText.close;
 end;
 codeToText('','',2);
end;

// 사원을 체크하여 개인인사열람을 할수 있는 대상인지 체크한다.
function TMainForm.empnocheck(var str : string) : Boolean;
var
  i : integer;
const
  sqlPre = 'select deptcode,deptlevel,fieldcode from pycdept '+
           ' where (orgnum = ''%s'' and deptcode = ''%s'')   ';
  sqlMas = 'select orgnum,deptcode,paycl,payra,payrayn from pimpmas '+
           ' where (empno = ''%s'') ';

  procedure exePerson;
  var
     FTPpath, ObjName : String;
  begin
       //PDownload 라이브러리 추가하여 수정....dsa2000   2007.05.
       FTPpath     := '/hper/insa/hperson/conbin/Ibin';
       ObjName     := 'PIA1070B.EXE';
       FM_DownLoad := TFM_DownLoad.Create(Application);
       FM_DownLoad.Show;
       FM_DownLoad.PL_ReadEnv;                            //환경변수값(파라미터) 읽어온다.
       FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

       if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2Tier\'+ObjName)) then
       begin
            FM_DownLoad.PL_DownLoad(2, FTPpath, ObjName, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer); //단위 프로그램 다운받기.
            SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY,   Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer); //Down후 레지스트리에 버젼 저장.
       end
       else
       begin
            FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
{            FL_Ret := RunProgram(HomeDirOpen+'\bin\2Tier\'+ObjName+' ,'+
                                 p_empno            +','+pkorname           +','+
                                 password           +','+pclass             +','+
                                 PassEmp(cmdline,5) +','+PassEmp(cmdline,6) +','+
                                 PassEmp(cmdline,7) +','+PassEmp(cmdline,8) +','+
                                 PassEmp(cmdline,9) +','+PassEmp(cmdline,10)+','+
                                 passemp(cmdline,11)+','+passemp(cmdline,12)+','+passemp(cmdline,13)+',');
 }
            if FM_DownLoad.FL_Ret < 32 then
               MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

            FM_DownLoad.Close;      // 다운로드 폼 닫기.
       end;
  end;
begin
  inputman.empno    := Passtring(str,',',1);
  inputman.deptcode := Passtring(str,',',5);
  inputman.boncode  := Passtring(str,',',3);
  inputman.extcode  := Passtring(str,',',4);
  inputman.deptlevel:= Passtring(str,',',6);
  inputman.orgnum   := Passtring(str,',',7);

  OraQuery1.close;
  OraQuery1.sql.clear;
  OraQuery1.sql.add(Format(sqlPre,[inputman.orgnum,inputman.deptcode] ));
  OraQuery1.Open;
  InputMan.fieldcode := OraQuery1.FieldByName('fieldcode').AsString;
  OraQuery1.close;

  OraQuery1.close; OraQuery1.sql.clear;
  OraQuery1.sql.add(Format(sqlMas,[Pempno] ));
  OraQuery1.Open;
  workMan.deptcode := OraQuery1.FieldByName('deptcode').AsString;
  workMan.orgnum   := OraQuery1.FieldByName('orgnum').AsString;
  workMan.paycl    := OraQuery1.FieldByName('paycl').AsString;
  workMan.payra    := OraQuery1.FieldByName('payra').AsString;
  workMan.payrayn  := OraQuery1.FieldByName('payrayn').AsString;

  OraQuery1.close; OraQuery1.sql.clear;
  OraQuery1.sql.add(Format(sqlPre,[workman.orgnum,workman.deptcode] ));
  OraQuery1.Open;
  workMan.deptlevel := OraQuery1.FieldByName('deptlevel').AsString;
  workMan.fieldcode := OraQuery1.FieldByName('fieldcode').AsString;
  OraQuery1.close;
  Result := False;

  // 개발자,운영자,부시스템운영자,임원,작업자사번과 입력사번이 같으면 통과
  if (copy(Pgrade,2,1) <= 'C') or (Pempno = inputman.empno) then
  begin
     exeperson; Result := True; system.exit;
  end;
  if (Copy(workMan.paycl,1,1) = 'A') then begin     //임원급
     if (WorkMan.payra <= PreviligePayra) or
        (WorkMan.deptcode = PreviligeDeptcode) then begin
         exeperson; Result := True; system.exit;
     end;
     if (Copy(workMan.deptlevel,1,1) = 'A') and     // 작업자부서등급 : 부문
        (Copy(WorkMan.fieldcode,1,1) = Copy(InputMan.fieldcode,1,1)) then begin
        exeperson; Result := True; system.exit;
     end;
     if WorkMan.fieldcode = InputMan.fieldcode then begin
        exeperson; Result := True; system.exit;
     end;
  end;

  if workMan.payrayn <> 'Y' then system.exit;
  if (copy(workman.deptlevel,1,1) = 'C') then  // 본부
     if (workMan.orgnum = inputMan.orgnum) and
        (workman.deptcode = inputman.boncode) then begin
        exeperson;  Result := True; system.exit;
     end;

  if (copy(workman.deptlevel,1,1) = 'D') then begin  // 부
     if ((workman.deptcode = inputman.deptcode) and (workMan.orgnum = inputMan.orgnum)) or
        ((workman.deptcode = inputman.extcode) and (workMan.orgnum = inputMan.orgnum))  then begin
         exeperson;  Result := True; system.exit;
     end;
  end;

  if (workman.deptcode = inputman.deptcode) and
     (workMan.orgnum = inputMan.orgnum) then begin
     exeperson; Result := True; system.exit;
  end;
end;

// 백그라운드화면을 유지하기 위해 설정한다......................................
procedure TMainForm.ClientWndProc(VAR Message: TMessage);
var
  MyDC : hDC;
  Ro, Co : Word;
begin
  with Message do
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
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 tCur1,tCur2 : TCursor;
begin
  Start                     := 0;
  HomeDir                   := HomeDirOpen;
  Application.OnHint        := ShowHint;
  Screen.OnActiveFormChange := UpdateMenuItems;
  tCur1 := LoadCursorFromFile(PChar(HomeDir+'\pic\H_arrow2.cur')); {선택항목 아이콘}
  tCur2 := LoadCursorFromFile(PChar(HomeDir+'\pic\s_busy.ani'));   {실행 아이콘}
  Screen.Cursors[crHand1]   := tCur1;
  Screen.Cursors[crHand2]   := tCur2;
  // 바탕 배경색 유지를 위해 필요합니다..
  if FileExists(pChar(HomeDir+'\pic\조직바탕.bmp')) = True then
     BackImage.Picture.LoadFromFile(HomeDir+'\pic\조직바탕.bmp');
  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FClientInstance));
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  SelDept  := '';
  SelName  := '데이타 없슴';
  if start = 0 then
  begin
     start := 1;
     StatusBar.Panels[0].Text := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
     Application.ProcessMessages;

     OraConnect;
      
     if copy(Pgrade,2,1) > 'C' then
     begin
          MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
          Application.Terminate;
     end;
     //------------------------------------------------------------------------
     // 변수화일에서 열람부서,열람직책를 읽어온다..
     Qtext.close; Qtext.sql.clear;
     Qtext.sql.Add(variSql);
     Qtext.Open;
     PreviligePayra    := QText.FieldByName('value1').AsString;
     Previligedeptcode := QText.FieldByName('value2').AsString;
     Qtext.close;
     StatusBar.Panels[0].Text := ' ☞ 인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
     SendMessage(StatusBar.Handle,WM_PAINT,0,0);
     FreeCheck := DiskSpaceCheck;
     if (FreeCheck = True) and
        (FileExists('c:\insacode.dat') = False) then MakeTextFile;
     if FileExists('c:\insacode.dat') = True then FreeCheck := True;

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
  for i := MDIChildCount-1 downto 0 do begin
      if MDIChildren[i].Caption = Name then begin
         MDIChildren[i].SetFocus;
         if MDIChildren[i].WindowState = wsMinimized then
            MDIChildren[i].Windowstate := wsMaximized;
         system.exit;
      end else continue;
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
  if (trim(strpas(nBuf)) = 'TApplication') then begin
      if (uppercase(trim(strpas(cBuf))) = '개인별 인사자료 요약열람') then begin
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
  Close;
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

procedure TMainForm.BhelpSelClick(Sender: TObject);
begin
//  HelpForm := THelpForm.Create(Self);
//  Try
//     HelpForm.ProgramId := 'PIB2020B';
//     HelpForm.ShowModal;
//  Finally
//     HelpForm.Free;
//  End;
  // MessageBox(handle,'공사중입니다 !!.','알 림',MB_OK or $0030);
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
