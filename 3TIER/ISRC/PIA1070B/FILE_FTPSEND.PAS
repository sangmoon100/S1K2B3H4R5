unit file_ftpSend;interface
uses    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ExtCtrls, StdCtrls, Buttons, Gauges, Mask, DB, DBTables, Winsock, Sockets;

type  TCommand = (PUT_USER, PUT_PASS, PUT_CWD,  PUT_CDUP, PUT_QUIT, PUT_TYPE,
              PUT_RETR, PUT_STOR, PUT_DELE, PUT_RMD,  PUT_MKD,  PUT_LIST,
              PUT_NLST, PUT_STAT, PUT_HELP, PUT_PORT, PUT_PWD,  PUT_RNFR, GET_MESSAGE);

var
 // private
         ctrl_skt,  Listen_skt, Data_skt : Tsocket;
         Server_in, Listen_in,  Data_in  : TSockAddrIn;
         SERV_ADDR  : array[0..15] of Char; {host측 IP주소}
         LOCAL_ADDR : String[15];           {local측 IP주소}
         //buff 변수 사이즈 조정에 따른 변경.
         rStr       : String[100];           {reply message}
         ErrMsg     : String[80];
         //buff 변수 사이즈 83->100으로 상향조정 (장비교체로 인한 버퍼사이즈 변경)
         buff       : array[0..100] of Char; {명령어 전송용 버퍼}
         DirName    : String[80];
         Comd       : TCommand;
         File_Size  : Integer;
         Passwd     : String;

//  public        procedure Delay_Second(Delay: LongInt);
        procedure Send_Command(cStr: String);
        procedure AllCloseSocket;
        function  GetFTPListenSocket: Tsocket;
        procedure DOclosesocket(var socket_id: Tsocket);
        function  GetReply: Boolean;
        procedure Command_Proc;
        function fileftp(HostIP,UserID,Password,HostFname,Dname,PCFname: String; var RetMsg: String) : Boolean;

  const
  PORT            = IPPORT_FTP;
  TRANSFER_BYTE   = (1 - 1);

{ Macro = Indicate code (respond message) }
  C150  = '150'; {Opening data connection for xxxxxxxx.xxxx}
  C200  = '200'; {일반명령어의 실행 성공 }
  C220  = '220'; {Service ready}
  C226  = '226'; {Transfer complete}
  C250  = '250'; {DELE command successful} {RMD command successful}
  C331  = '331'; {Password required for xxxx}
  C230  = '230'; {User xxxx logged in}
  C257  = '257'; {"xxxxxx" is current directory} {MKD command successful}
  C350  = '350'; {File exists,ready for destination name}
  C550  = '550'; {xxxx: No such file or directory}

implementation

{------------------------------ User Function --------------------------}{Command전송후 reply message를 처리
    multiline 메시지수신(첫번째 message만 rStr변수에 받고 나머지는 삭제}

procedure Command_Proc;var
   i, j: integer;
   SubStr: String;
Label end_point;
begin
     if (ctrl_skt = SOCKET_ERROR) then
     begin
          ErrMsg := '데이터를 받을 수 없습니다.';
          AllCloseSocket;
          goto end_point;
     end;
     case Comd of
          PUT_USER:
          begin
               if CompareStr(C331, Copy(rStr,1,3)) = 0 then
                  begin
                       Comd := PUT_PASS;
                       Send_Command('PASS ' + Passwd);
                  end;
          end;
          PUT_PASS:
          begin
               if CompareStr(C230, Copy(rStr,1,3))= 0 then
               begin
                    ErrMsg := rStr;
                    if DirName <> '' then
                    begin
                         Comd := GET_MESSAGE;
                         Send_Command('CWD '+ DirName);
                         Send_Command('PWD');
                    end;

                    i := SizeOf(Server_in);
                    if getsockname(ctrl_skt, Server_in, i) <> SOCKET_ERROR then
                    begin
                         SubStr := StrPas(inet_ntoa(Server_in.sin_addr)); {local address를 구한다}
                         for i := 1 to System.Length(SubStr) do
                             if SubStr[i] = '.' then
                                SubStr[i] := ',';
                         LOCAL_ADDR := SubStr;
                    end
                    else
                    begin
                         ErrMsg := 'Packet Driver 에러로 로컬주소를 얻지못했습니다.';
                         AllCloseSocket;
                         goto end_point;
                    end;
               end
               else
               begin
                    ErrMsg := '로그인 실패, 비밀번호를 확인하십시요.';
                    AllCloseSocket;
                    goto end_point;
               end;
          end;
          PUT_PORT:
          begin
               if CompareStr(C200, Copy(rStr,1,3)) <> 0 then
                  DOclosesocket(Listen_skt)
               else
                   ErrMsg := rStr;
          end;
          PUT_STOR:
          begin
               if CompareStr(C150, Copy(rStr,1,3)) = 0 then
               begin
                    ErrMsg := rStr;
               end;
          end;
          GET_MESSAGE:
          begin
               ErrMsg := rStr;
          end;
          PUT_QUIT: {program end}
          begin
               ErrMsg := rStr;
               Delay_Second(500);
          end;
          end; {case}
     end_point:
     FillChar(Buff, SizeOf(Buff), #0);
end;

{Data Connection(listen socket을 얻는다)}
function GetFTPListenSocket: Tsocket;
var
   i: Integer;
   a, p: PChar;
begin
     DOclosesocket(Listen_skt);  {혹시 이전 소켓이 열려있을 수 있으므로}
     DOclosesocket(Data_skt);
     Listen_skt := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
     if Listen_skt = INVALID_SOCKET then
     begin
          ErrMsg := '데이터 소켓핸들을 얻을수 없습니다.';
          DOclosesocket(Listen_skt);
          GetFTPListenSocket := INVALID_SOCKET;
     end;
     with Listen_in do
     begin
          FillChar(Listen_in, SizeOf(Listen_in), #0);
          sin_family          := AF_INET;
          sin_addr.s_addr     := htonl(INADDR_ANY);
          sin_port            := htons(0);
     end;
     if bind(Listen_skt, Listen_in, SizeOf(Listen_in)) = SOCKET_ERROR then
     begin
          ErrMsg := '데이터 바인딩을 못했습니다.';
          DOclosesocket(Listen_skt);
          GetFTPListenSocket := INVALID_SOCKET;
     end;

     i := SizeOf(Listen_in);
     if getsockname(Listen_skt, Listen_in, i) < 0 then
     begin
          ErrMsg := '데이터 포트번호를 얻지 못했습니다.(data control)';
          DOclosesocket(Listen_skt);
          GetFTPListenSocket := INVALID_SOCKET;
     end;

     if Listen(Listen_skt, 1) = SOCKET_ERROR then
     begin
          ErrMsg := '데이터를 받을 수 없습니다.';
          DOclosesocket(Listen_skt);
          GetFTPListenSocket := INVALID_SOCKET;
     end;

     {port번호를 생성하여 "PORT"명령을 송신한다}
     a := PChar(@(Server_in.sin_addr)); {local IP address}
     p := PChar(@(Listen_in.sin_port)); {listen socket(htons(0)에 의해 생성된 port}
     comd := PUT_PORT;
     Send_Command(
       Format('PORT %d,%d,%d,%d,%d,%d',[Byte(a[0]) and $00ff
                                       ,Byte(a[1]) and $00ff
                                       ,Byte(a[2]) and $00ff
                                       ,Byte(a[3]) and $00ff
                                       ,Byte(p[0]) and $00ff
                                       ,Byte(p[1]) and $00ff]));
     GetFTPListenSocket := Listen_skt;
end;

procedure Send_Command(cStr: String);
begin
     AppendStr(cStr, #10);
     StrPcopy(buff, cStr);
     if send(ctrl_skt, buff, strlen(buff), 0) = SOCKET_ERROR then
     begin
          ErrMsg := '데이터를 보낼 수 없습니다.';
          DOclosesocket(Listen_skt);
          DOclosesocket(Data_skt);
          System.Exit;
     end;
     if GetReply then
        Command_proc;
end;

function GetReply: Boolean;
var
  i, iNumByte: Integer;
begin
     FillChar(Buff, SizeOf(Buff), #0);
     //showmessage(inttostr(Sizeof(Buff)));
     iNumByte := recv(ctrl_skt, Buff, SizeOf(Buff), MSG_PEEK); {미리보기, peek}
     i := 0;
     if iNumByte > 0 then
        for i := 0 to iNumByte do
            if (Buff[i] = #10) then
               Break
            else
                GetReply := False;
     FillChar(Buff, SizeOf(Buff), #0);
     iNumByte := recv(ctrl_skt, Buff, i+1, 0);
     if iNumByte = 0 then
     begin
          GetReply := False;
          rStr := '';
     end
     else
     begin
          rStr := StrPas(buff);
          rStr := Copy(rStr, 1, System.Length(rStr)-2); {CR,LF제거}
          GetReply := True;
     end;
end;

{열려있는 모든 소켓을 닫는다}
procedure AllCloseSocket;
begin
     if ctrl_skt <> INVALID_SOCKET then
        DOclosesocket(ctrl_skt);
     if listen_skt <> INVALID_SOCKET then
        DOclosesocket(listen_skt);
     if Data_skt <> INVALID_SOCKET then
        DOclosesocket(Data_skt);
end;

{parameter로 지정한 소켓을 닫는다}
procedure DOclosesocket(var socket_id: TSocket);
var
  lingerinfo : Tlinger;
begin
     if socket_id <> INVALID_SOCKET then
        if WSAISBlocking then
           WSACancelBlockingCall;  {블럭킹된 원속함수가 있다면 이를 취소시킨다}
     shutdown(socket_id, 2);   {data 송수신 급지}
     lingerinfo.l_onoff  := 1; { 소켓을 강제로 즉시 종료 }
     lingerinfo.l_linger := 0;
     SetSockopt(socket_id,SOL_SOCKET,SO_LINGER,Pchar(@lingerinfo),sizeof(lingerinfo));
     socket_id := INVALID_SOCKET;
end;

procedure Delay_second(Delay: LongInt);
var
   i: Longint;
begin
     for i:= 1 to Delay do
         Application.ProcessMessages;
end;

{화일전송 module}
function fileftp(HostIP,UserID,Password,HostFname,Dname,PCFname: String; var RetMsg: String) : Boolean;
var
   OutF  : file;
   ImsiF : file of byte;
   iNumRead, iNumWrite: Integer;
   cnt   : Integer;
   Oobinline: Integer;
   WData    : TWSAData;
   MsgBuf: array[0..TRANSFER_BYTE] of Char; {전송 버퍼}
label end_point;
begin
     fileftp := False;
     Passwd := Password;
     DirName := Dname;

     if WSAStartup($0101, WData) <> 0  then
     begin
          ErrMsg :='WINSOCK.DLL을 실행할 수 없습니다.';
          goto end_point;
     end;

     if HostIP = '' then     begin
          ErrMsg := '호스트 IP를 지정하세요.';
          goto end_point;
     end;

     if UserID = '' then     begin
          ErrMsg := '사용자 ID를 지정하세요.';
          goto end_point;
     end;

     if Password = '' then     begin
          ErrMsg := '비밀번호를 지정하세요.';
          goto end_point;
     end;

     StrPCopy(SERV_ADDR, HostIP);     ctrl_skt := socket(AF_INET, SOCK_STREAM, 0);

     if ctrl_skt = INVALID_SOCKET then
     begin
          ErrMsg  := '소켓핸들을얻을수 없습니다';
          goto end_point;
     end;

     with Server_in do
     begin
          FillChar(Server_in, SizeOf(Server_in), #0);
          sin_family          := AF_INET;
          sin_addr.s_addr     := u_long(inet_addr(SERV_ADDR));
          sin_port            := htons(PORT);
     end;

     if Connect(ctrl_skt, Server_in, sizeof(Server_in)) = SOCKET_ERROR then        if WSAGetLastError <> WSAEWOULDBLOCK then
           begin
                ErrMsg := 'ftpd 21/tcp daemon과 연결을 못했습니다.';
                AllCloseSocket;
                goto end_point;
           end;

     Oobinline := 1;  {대역외 테이터가 일반 테이터와 마찬가지로 취급되도록 한다}     SetSockopt(ctrl_skt,SOL_SOCKET,SO_OOBINLINE,Pchar(@Oobinline),sizeof(Oobinline));

     if GetReply then        if CompareStr(C220, Copy(rStr,1,3)) <> 0 then
        begin
             ErrMsg  := 'ftpd 21/tcp daemon과 연결을 못했습니다.';
             AllCloseSocket;
             goto end_point;
        end;

     Comd := PUT_USER;     Send_Command('USER ' + UserID); {login}
     Comd := GET_MESSAGE;
     Send_Command('TYPE A');   {ascii}

     {$I-}
     try
        FileMode := 0;   {Read Only}
        AssignFile(ImsiF, PCFname);
        ReSet(ImsiF);
        File_Size := System.FileSize(ImsiF);
     finally
        System.CloseFile(ImsiF);
     end;
     AssignFile(OutF, PCFname);

     ReSet(OutF,1); {Record Size 1(byte단위)}

     {$I+}     if IOResult <> 0 then
     begin
          ErrMsg := 'PC 화일 '''+PCFname+''' 읽기에러';
          System.CloseFile(OutF);
          goto end_point;
     end;

     if GetFTPListenSocket = INVALID_SOCKET then   {listen socket을 얻은후 "PORT"명령을 보내는 함수호출후 비교}
     begin
          System.CloseFile(OutF);
          goto end_point;
     end;

     Comd := PUT_STOR;     Send_Command('STOR '+HostFname);
     cnt := SizeOf(Data_in);

     if CompareStr(C150, Copy(rStr,1,3)) <> 0 then {접속을 못하면}     begin
          System.CloseFile(OutF);
          goto end_point;
     end;

     Data_skt := accept(listen_skt, @Data_in, @cnt); {listen socket에서 대기}
     if Data_skt = INVALID_SOCKET then
     begin
          DoCloseSocket(listen_skt);
          System.CloseFile(OutF);
          goto end_point;
     end;

     DoCloseSocket(listen_skt); {data송수신시 Listen socket은 필요없으므로 닫는다}     iNumRead  := 0;
     iNumWrite := 0;
     cnt := 0;

     try        while True do
        begin
             BlockRead(OutF, MsgBuf, SizeOf(MsgBuf), iNumRead);
             if iNumRead <= 0 then
                Break;
             iNumWrite := send(Data_skt, MsgBuf, iNumRead, 0);
             if iNumWrite = SOCKET_ERROR then
             begin
                  ErrMsg := '데이타를 전송할 수 없는 상태입니다.';
             end;
             Inc(cnt, iNumWrite);
             Delay_second(100);
        end; {while}
     finally
            System.CloseFile(OutF);
     end;

     DoCloseSocket(Data_skt); {data control 소켓을 닫는다}     GetReply;
     ErrMsg := '화일전송을 완료했습니다.';
     fileftp := True;

 end_point:
     if WSAIsBlocking then
        WSACancelBlockingCall;
     AllCloseSocket;
     RetMsg := ErrMsg;
end;

end.