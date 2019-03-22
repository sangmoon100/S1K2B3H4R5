{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB2010G(조직도 생성)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김동철
Version         : 1.00
Date            : 1996.10.25
Update contents
  1.00   1996.10.25    김동철  신규프로그램개발 처리명세서
 30.01   2003.09.30    정규용  컴포넌트 교체 (TSocket -> Indy Rexcd)
 30.03   2004.09.10    이민용  최종작업년월에서 최종작업년월일로 수정(2004/09 -> 2004/09/10)
-----------------------------------------------------}

unit pib20101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, TimeFtp, DB,
  DBTables, DateLib, Tmax_DataSetText,
  Tmax_session, OnInsaCommon, MemDS, DBAccess,  Pass, Func, Ora;     //Ora,

type
  TFpib20101 = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    MEorgym: TMaskEdit;
    Panel6: TPanel;
    Llastorgym: TLabel;
    Label14: TLabel;
    Lorgnum: TLabel;
    Label16: TLabel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    Panel5: TPanel;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    Gauge1: TGauge;
    Panel7: TPanel;
    Label1: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Memo1: TMemo;
    TMaxDataSet1: TTMaxDataSet;
    procedure FormActivate(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure ReadPimvari;
    procedure PihorgaCheck;
    procedure FormPaint(Sender: TObject);
    procedure Panel6DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Lastorgym  : string;      {최종작업년월}
    Lastorgymd : string;      {최종작업년월일}
    Orgnum : string;         {현조직차수}
    ExistCount : integer;    {자료존재건수}
  public
    { Public declarations }
    PaintCount : integer;
    Pempno   : string;
    Pkorname : string;
    Pgrade   : string;
    rxcMsg   : String;
    Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
  end;

var
  Fpib20101: TFpib20101;

implementation

{$R *.DFM}

procedure TFpib20101.FormActivate(Sender: TObject);
begin
  PaintCount := 0;

  ReadPimvari;                 {조직차수, 최종작업년월}

  Lorgnum.Caption := Orgnum + ' 차';
  {조직도 최종작업년월일 민용추가}
  Llastorgym.Caption := Copy(Lastorgymd, 1, 4) + '/' + Copy(Lastorgymd, 5, 2)+ '/' + Copy(Lastorgymd, 7, 2);
  P_help.Caption := '작업조건을 확인후 실행하십시요.';
  MEorgym.Setfocus;
end;

procedure TFpib20101.BB_CloseClick(Sender: TObject);
var
  BitBtn: Integer;
begin
  BitBtn := Application.MessageBox('종료 하시겠습니까?', 'Message Box',
    mb_OKCancel + mb_DefButton1);
 if Bitbtn = IDOK then
   close;
 if BitBtn = IDCANCEL then

end;

procedure TFpib20101.BB_RunClick(Sender: TObject);
var
   BitBtn : Integer;
   LJobMsg : string;
   LResMsg : string;
begin
  Application.ProcessMessages;
  Gauge1.Progress := 0;
  if (MEorgym.Text < Lastorgym) then
  begin
    P_help.Caption := '작업년월 오류입니다 !!!';
    MEorgym.Setfocus;
    System.Exit;
  end;
  P_help.Caption := '자료 확인중입니다.';

  PihorgaCheck;    {자료존재여부 확인}

  if (ExistCount > 0) then
  begin
    BitBtn := Application.MessageBox('기존자료 존재 ! 삭제 후 작업하시겠습니까 ?',
                                  'Message Box', mb_OKCancel + mb_DefButton1);
    if Bitbtn <> IDOK then
    begin
      MEorgym.Setfocus;
      System.Exit;
    end;
  end;

       P_help.Caption := '작업중입니다.';

       Memo1.Clear;
       Memo1.Lines.Add('실행중...');
       with TMaxDataSet1 do
       begin
           Close;           {조직도 최종작업년월일 민용추가}
           ServiceName := 'SHR0SSEL';
           ClearFieldInfo;
           ClearParamInfo;
           AddField('WRITETIME', ftString, 5000);
           SQL.Clear;
           SQL.ADD(' SELECT to_char(sysdate,''YYYYMMDDHH24MISS'') WRITETIME');
           SQL.ADD(' FROM dual     ');
           Open;
           Rundate := FieldByName('WRITETIME').AsString;
       end;
       ProgId  := 'pib2010g';
       // 경진의 메모(주의사항) :1) 꼭 bin디렉토리에서 실행하라(권한 문제 땜시 그렇다구 하네여..
       //                        2) 서버에서 컴파일 후 src에 있는 실행파일을 bin으로 복사할때 꼭 mv 시켜라
       //                           (cp는 권한 까지 복사하기때문)...
       //             logfile확인 :tmax/log/ulog/htmax_batch.out
       CmdStr  := '/hper/insa/HINSA/proc/bin/Ibin/pib2010g'
                  +' '+ Pempno +' '+ MEorgym.Text +' '+ Orgnum
                  +' '+ Pempno +' '+ ProgId       +' '+ Rundate ;

       with TDS_batch do
         begin
           Close;
           ServiceName := 'HINSA_batch';
           ClearFieldInfo;
           ClearParamInfo;
           AddParam('cmdstr', 300, CmdStr);
           Execute;

           Close;
           ServiceName := 'SHR0SSEL';
           ClearFieldInfo;
           ClearParamInfo;
           AddField('RESULT', ftString, 5000);
           Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                              ' WHERE RUNDATE = ''%s''     '+
                              '   AND PROGID  = ''%s''     '+
                              ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
           Open;

           while not Eof do
             begin
               Memo1.Lines.Add(FieldByName('RESULT').AsString);
               Next;
             end;
         end;    //with TDS_batch do
       /////////////////////////////////////////////////////////////////////////
    if Pos('OK',Memo1.Text) > 0 then
       P_Help.Caption := '조직도 생성이 성공적으로 완료되었습니다. '
    else
       begin
         Memo1.Clear;
         P_Help.Caption := '조직도 생성에 실패했습니다. ';
       end;
     MEorgym.Setfocus;
     System.Exit;



end;

procedure TFpib20101.ReadPimvari;
begin
   with  TMaxDataSet1 do
   begin
     Close;           {현조직차수}
     ServiceName := 'SHR0SSEL';
     ClearFieldInfo;
     ClearParamInfo;
     AddField('VALUE1', ftString, 5000);
     SQL.Clear;
     SQL.ADD(' SELECT VALUE1 FROM PIMVARI ');
     SQL.ADD(' WHERE GUBUN = ''00'' AND SGUBUN = ''0001'' ');
     Open;
     Orgnum := FieldByName('value1').AsString;

     Close;           {조직도 최종작업년월}
     ServiceName := 'SHR0SSEL';
     ClearFieldInfo;
     ClearParamInfo;
     AddField('VALUE1', ftString, 5000);
     SQL.Clear;
     SQL.ADD(' SELECT VALUE1 ');
//     SQL.ADD('       ,TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(VALUE1,1,6), ''YYYYMM''), 1), ''YYYYMM'') ');
     SQL.ADD(' FROM PIMVARI  WHERE GUBUN = ''B2'' AND SGUBUN = ''0000'' ');
     Open;
     Lastorgym := FieldByName('value1').AsString;
{     Addorgym := Fields[1].AsString;}

     Close;           {조직도 최종작업년월일 민용추가}
     ServiceName := 'SHR0SSEL';
     ClearFieldInfo;
     ClearParamInfo;
     AddField('WRITETIME', ftString, 5000);
     SQL.Clear;
     SQL.ADD(' SELECT WRITETIME ');
     SQL.ADD(' FROM PIHORGA  WHERE ORGYM = '''+Lastorgym+''' ');
     SQL.ADD('                 AND  ROWNUM =''1''               ');
     Open;
     Lastorgymd := FieldByName('WRITETIME').AsString;

     Close;
   end;
end;

procedure TFpib20101.PihorgaCheck;
begin
   with TMaxDataSet1 do
   begin
     ExistCount := 0;
     Close;           {기존자료존재여부확인}
     ServiceName := 'SHR0SSEL';
     ClearFieldInfo;
     ClearParamInfo;
     AddField('ORGYM', ftString, 5000);
     SQL.Clear;
     SQL.ADD(' SELECT ORGYM FROM PIHORGA ');
     SQL.ADD(' WHERE ORGYM = ''' + MEorgym.Text + ''' ');
     Open;
     ExistCount := RecordCount;
     Close;
   end;
end;

procedure TFpib20101.FormPaint(Sender: TObject);
var
Sysdate:string;
begin
    MEorgym.Text := copy(datetostr(now),1,4)+copy(datetostr(now),6,2);//Copy(Fn_GetDateTimeStr, 1, 6);

    if PaintCount = 0 then            {처음 Paint시만 처리}
    begin
//
    end;
    PaintCount := 1;
end;


procedure TFpib20101.Panel6DblClick(Sender: TObject);
begin
  MessageDlg(rxcMsg, mtInformation, [mbOK], 0);
end;

procedure TFpib20101.FormCreate(Sender: TObject);
begin
     P_Help.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
     Application.ProcessMessages;

     //2004.11. dsa2000   Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
     //for test by hjku
     //TMaxSession.EnvFileName := 'd:\src\newhana.env';
     TMaxSession.EnvFileName    := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
     TMaxSession.LabelName      := 'HANAROHPER';
     TMaxSession.ServiceTimeOut := 1000;
     TMaxSession.Connect        := False;

     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;

     Pempno   := Passemp(cmdline,1);
     Pkorname := Passemp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Lempno.Caption   := Pkorname + '(' + Pempno+')';
     Lsysdate.Caption := copy(datetostr(now),1,10);
     if copy(Pgrade,2,1) > 'C' then
     begin
          MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
          Application.Terminate;
     end;

end;

end.
