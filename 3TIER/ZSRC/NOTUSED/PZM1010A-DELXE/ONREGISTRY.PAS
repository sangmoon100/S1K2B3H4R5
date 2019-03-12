{********************************************************}
{                                                        }
{         Onnuri Visual Component Library                }
{                                                        }
{         Copyright (c) 1999-2002 Onnuri Infotek Inc.    }
{         All rights reserved                            }
{                                                        }
{  화일의 모든 내용은 온누리 인포텍에 권한이 있습니다.   }
{  그리고 한국, 국제적 저작권 법률에 의해 저작권을       }
{  보호 받고 있습니다.                                   }
{  이 화일을 라이센스 없이 다른 곳에 복사 할 수 없으며   }
{  사용할 수 도 없습니다.                                }
{                                                        }
{********************************************************}
unit OnRegistry;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Graphics, Controls,
  Variants, Registry, ShellAPI, TLHelp32, Dialogs;

type
  TOnExecState = (esNormal, esMinimized, esMaximized, esHidden);
  TOSType      = (ostUnknown, ostWin95, ostWinNT);

 function  GetKeyValue(ARootKey : HKEY; SubKey,GetValue : string; Opt : Boolean = True) : variant;
 function  SetKeyValue(ARootKey : HKEY; SubKey,SetValue : string; SetData : variant) : Boolean;
 function  CreateKeyValue(ARootKey : HKEY; SubKey,SetValue : string; SetData : variant) : Boolean;
 function  DeleteKeyValue(ARootKey : HKEY; SubKey : string) : Boolean;

 procedure EnCode(const instring : string; var outstring : string; key : char);
 procedure DeCode(const instring : string; var outstring : string; key : char);
 function  RunProgram(ExeFile : string) : DWORD;
 function  FileExecute(const FileName, Params, StartDir: string; InitialState: TOnExecState): THandle;

 procedure Process_Kill(AStr : String);
 function  Get_Process(AStr : String) : Boolean;    
 function  Win98EnumMsgWindowsProc(Wnd: HWND; lParam: TForm): BOOL; stdcall;

var
  Win98AppCaption : String;
  Win98AppHandle  : THandle;
  
implementation

// 사용법 :   ARoot   := HKEY_LOCAL_MACHINE;
//            ASubKey := 'SOFTWARE\ORACLE'
//            GetKeyValue(ARoot,ASubKey,'COMPANY_NAME')
function  GetKeyValue(ARootKey : HKEY; SubKey,GetValue : string; Opt : Boolean = True) : variant;
var
  Registry  : TRegistry;
  AValueData: Variant;
begin
  Result   := '';
  Registry := TRegistry.Create;
  try
    Registry.RootKey := ARootKey;
    if Registry.OpenKey(SubKey,Opt) then
      begin
        case Registry.GetDataType(GetValue) of
         rdString :
           begin
             try
               AValueData := Registry.ReadString(GetValue);
             except
               AValueData := '';
             end;
           end;
         rdInteger :
           begin
             try
               AValueData := Registry.ReadInteger(GetValue);
             except
               AValueData := 0;
             end;
           end;
        end;
        Result := AValueData;
      end;
  finally
    Registry.Free;
  end;
end;

// 사용법 :   ARoot   := HKEY_LOCAL_MACHINE;
//            ASubKey := 'SOFTWARE\ORACLE'
//            SetKeyValue(ARoot,ASubKey,'COMPANY_NAME',Value)
function SetKeyValue(ARootKey : HKEY; SubKey,SetValue : string; SetData : variant) : Boolean;
var
  Registry  : TRegistry;
begin
  Result   := False;
  Registry := TRegistry.Create;
  try
    Registry.RootKey := ARootKey;
    if Registry.OpenKey(SubKey,True) then
      begin
        case VarType(SetData) of
          varString  : Registry.WriteString(SetValue,SetData);
          varInteger : Registry.WriteInteger(SetValue,SetData);
        end;
        Result := True;
      end;
  finally
    Registry.Free;
  end;
end;

// 사용법 :   ARoot   := HKEY_LOCAL_MACHINE;
//            ASubKey := 'SOFTWARE\ORACLE'
//            CreateKeyValue(ARoot,ASubKey,'COMPANY_NAME')
function CreateKeyValue(ARootKey : HKEY; SubKey,SetValue : string; SetData : variant) : Boolean;
var
  Registry  : TRegistry;
begin
  Result   := False;
  Registry := TRegistry.Create;
  try
    Registry.RootKey := ARootKey;
    Registry.CreateKey(SubKey+'\');
    if Registry.OpenKey(SubKey,True) then
      begin
        case VarType(SetData) of
          varString  : Registry.WriteString(SetValue,SetData);
          varInteger : Registry.WriteInteger(SetValue,SetData);
        end;
        Result := True;
      end;
  finally
    Registry.Free;
  end;
end;

// 사용법 :   ARoot   := HKEY_LOCAL_MACHINE;
//            ASubKey := 'SOFTWARE\ORACLE'
//            DeleteKeyValue(ARoot,ASubKey)
function DeleteKeyValue(ARootKey : HKEY; SubKey : string) : Boolean;
var
  Registry  : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := ARootKey;
    if Registry.DeleteKey(SubKey+'\') = True then
      Result := True
    else
      Result := False;
  finally
    Registry.Free;
  end;
end;

procedure EnCode(const instring : string; var outstring : string; key : char);
var
  i : integer;
begin
  outstring := '';
  for i := 1 to Length(inString) do
    begin
      outstring := outString + Char(Byte(inString[i]) XOR Byte(key));
    end;
end;

procedure DeCode(const instring : string; var outstring : string; key : char);
var
  i : integer;
begin
  outstring := '';
  for i := 1 to Length(inString) do
    begin
      outstring := outString + Char(Byte(inString[i]) XOR Byte(key));
    end;
end;

function RunProgram(ExeFile : string) : DWORD;
var
  Pi           : TProcessInformation;
  Si           : TStartupInfo;
  sCommandLine : array[0..255] of char;
  success      : Boolean;
  dExitCode    : DWORD;
  size         : DWORD;
begin
  Result := 0;

  FillMemory(@Si, sizeof(Si),0);
  Si.cb := sizeof(Si);

  StrPCopy(sCommandLine,ExeFile);
  success := CreateProcess(nil,sCommandLine,
                           nil,
                           nil,
                           False,
                           CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,
                           nil,
                           nil,
                           Si,
                           Pi);
  if not success then
    begin
      Result := GetLastError();
      System.Exit;
    end;

  WaitForInputIdle(GetCurrentProcess,INFINITE);
  if Pi.hprocess <> 0 then
    begin
      dExitCode := STILL_ACTIVE;
      while (dExitCode = STILL_ACTIVE) do
        begin
           if WaitForSingleObject(Pi.hprocess,0) <> WAIT_TIMEOUT then
             GetExitCodeProcess(Pi.hprocess,dExitCode)
           else
             begin
               //DeleteFile(ExeFile);
               Break;
             end;
        end;
    end;
  Result := Pi.dwProcessId;

  CloseHandle(Pi.hProcess);
  CloseHandle(Pi.hThread);
end;

const
  ShowCommands : array[TOnExecState] of Integer = (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED, SW_HIDE);

function FileExecute(const FileName, Params, StartDir: string; InitialState: TOnExecState): THandle;
{$IFDEF WIN32}
begin
  Result := ShellExecute(Application.Handle, nil, PChar(FileName),
    PChar(Params), PChar(StartDir), ShowCommands[InitialState]);
end;
{$ELSE}
var
  cFileName, cParams, cPath: array [0..80] of Char;
begin
  Result := ShellExecute(Application.Handle, nil, StrPCopy(cFileName,
    FileName), StrPCopy(cParams, Params), StrPCopy(cPath, StartDir),
    ShowCommands[InitialState]);
end;
{$ENDIF}


procedure Process_Kill(AStr : String);
var
  Process32: TProcessEntry32;
  SHandle  : THandle;
  Next     : BOOL;
  ProcId   : DWORD;
begin
  Process32.dwSize := SizeOf(TProcessEntry32);
  SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Process32First(SHandle, Process32) then
    begin
      // 실행화일명과 process object 저장
      repeat
        Next := Process32Next(SHandle, Process32);
        if Next then
          begin
            GetWindowThreadProcessID(SHandle, @ProcId);
            if UpperCase(Process32.szExeFile) = UpperCase(AStr) then
              begin
                ProcId  := DWORD(Process32.th32ProcessID);
                SHandle := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
                // 명시한 process를 강제 종료시킨다
                TerminateProcess(SHandle, 0);
              end;
          end;
       until not Next;
    end;
  CloseHandle(SHandle);
end;


function Get_Process(AStr : String) : Boolean;
var
  Process32: TProcessEntry32;
  SHandle  : THandle;
  Next     : BOOL;
  ProcId   : DWORD;
begin
  Result := False;
  Process32.dwSize := SizeOf(TProcessEntry32);
  SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Process32First(SHandle, Process32) then
    begin
      // 실행화일명과 process object 저장
      repeat
        Next := Process32Next(SHandle, Process32);
        if Next then
          begin
            GetWindowThreadProcessID(SHandle, @ProcId);
            if UpperCase(Process32.szExeFile) = UpperCase(AStr) then
              begin
                ProcId  := DWORD(Process32.th32ProcessID);
                SHandle := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
                // 명시한 process를 강제 종료시킨다
                TerminateProcess(SHandle, 0);                
                Result := True;
              end;
          end;
       until not Next;
    end;
  CloseHandle(SHandle);
end;

function Win98EnumMsgWindowsProc(Wnd: HWND; lParam: TForm): BOOL;
var
  AppCaption: array [0..255] of Char;
begin
  try
    Result := True;
    if ((GetWindowLong(Wnd, GWL_EXSTYLE) and WS_EX_TOOLWINDOW) = 0) then
      begin
        SendMessage(Wnd, WM_GETTEXT, Sizeof(AppCaption), integer(@AppCaption));
        if Copy(AppCaption,1,Length(Win98AppCaption)) = Win98AppCaption then
          begin
            Win98AppHandle := Wnd;
          end;
      end;
  except
    Result := False;
  end;
end;

end.
