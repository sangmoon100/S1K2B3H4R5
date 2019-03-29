{ header
 -----------------------------------------------------------------------
  PROGRAM-NAME    : PIC7060C(정기배치전환현황)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김순례
  Version         : 1.00
  Date            : 1997.10.14
  Update Contents
    1.00    1997.10.14   김순례 신규프로그램 개발     처리명세서
 ----------------------------------------------------------------------}
unit pic7061c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls,timeftp,pass,datelib,dept1lib,codelib, DB, DBTables,
  QuickRpt,Qrprntr,codeText,forgnum, Mask;

type
  Tpic7061cForm = class(TForm)
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel5: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Btext: TBitBtn;
    hp: TPanel;
    HelpDsr: TLabel;
    helpLabel: TLabel;
    Qvari: TQuery;
    Qdept: TQuery;
    Database1: TDatabase;
    PrintDialog1: TPrintDialog;
    Qappr: TQuery;
    QCode: TQuery;
    Qsubr: TQuery;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Qdept_name(Sender: TObject);

  private
    { Private declarations }
    wordpad : Boolean;
    FreeCheck,FreeDept : Boolean;
    function  Data_Extract : string;
    procedure clear_data;
  public
    { Public declarations }
    P_empno  : string;
    pkorname : string;
    password : string;
    start    : integer;
    tremddate : string;
    mgubun   : integer;
    bgubun   : integer;
    jgubun   : integer;
    dpagenum : integer;
  end;

  type
  inText = record
       gubun     : string[1];
       PropCnt   : array[1..16,1..8]  of  integer;    //신청 배열
       ChanCnt   : array[1..16,1..9]  of  integer;   // 전환배열 (9번째 미전환)

  end;

var
  pic7061cForm: Tpic7061cForm;
  ErrorHelp : array[0..255] of char;
  F         : file of inText;
  iData     : inText;
  HomeDir   : string;

implementation
uses pic7062c,pic7063c,pic7064c;
{$R *.DFM}

procedure Tpic7061cForm.Qdept_name(Sender: TObject);
begin
end;

{------------------------------폼에 관련된 사항들----------------------------}
procedure Tpic7061cForm.FormCreate(Sender: TObject);
begin
  start    := 0;
end;

procedure Tpic7061cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
end;

procedure Tpic7061cForm.FormPaint(Sender: TObject);
var
  CurDate : String;
begin
if start = 0 then begin
   start := 1;
   Application.Processmessages;
   DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
   DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
   DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
   Try
      Database1.Connected := True;
   EXCEPT ON E : EDataBaseError DO begin
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     halt(0);
   end;
   END;

   CurDate  := TimeDate(Qsubr);
   L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                         copy(CurDate,5,2)+'/'+
                         copy(CurDate,7,2);

//   if PassDialog(pic7061cForm,p_empno,pkorname,password) = False then halt(0);
   L_UserName.Caption := pkorname+'('+p_empno+')';

   HelpDsr.Caption := '';

   Qvari.close;   Qvari.Open;
   if trim(Qvari.FieldByName('value2').AsString) = '' then
      MessageBox(handle,'인사변수화일에 자기신고 대상기간일자 존재하지 않습니다 !!.','확 인',MB_OK or $0030)
   else begin
      tremddate := Qvari.FieldByName('value2').AsString;

   end;
   Qvari.close;
end;
end;

procedure Tpic7061cForm.BexitClick(Sender: TObject);
begin
if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
   close;
end;

procedure Tpic7061cForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
end;

{-------------------------작업을 실행한다--------------------------------------}
procedure Tpic7061cForm.BscreenClick(Sender: TObject);
begin
  HelpDsr.Caption := '조직개편 화일에서 데이타를 추출하고 있습니다 !!.';
  SendMessage(hp.handle,WM_PAINT,0,0);

  if Data_Extract  = '' then begin
     Gr.Progress := 0; Qappr.Close;
     HelpDsr.Caption := '추출된 자료를 출력합니다..';
     SendMessage(hp.handle,WM_PAINT,0,0);


     if TbitBtn(sender).tag = 1 then begin   //화면
        pic7062cForm.apprReport.Preview;
     end;

     if TbitBtn(sender).tag = 2 then begin
        printdialog1.FromPage  := 1;
        printdialog1.ToPage    := Dpagenum;
        printdialog1.copies    := 1;
        if printdialog1.Execute = True  then begin
           pic7062cForm.apprReport.PrinterSettings.FirstPage := printdialog1.frompage;
           pic7062cForm.apprReport.PrinterSettings.lastpage  := printdialog1.topage;
           pic7062cForm.apprReport.PrinterSettings.Copies    := printdialog1.copies;
           pic7062cForm.apprReport.print;
        end;
     end;

   if TbitBtn(sender).tag  =  3  then   Form_TextFile;
  end else begin
      Wordpad := False; end;

  HelpDsr.Caption := '작업이 완료되었습니다..';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;

// 메모리변수 데이타 클리어
procedure Tpic7061cForm.clear_data;
var
  i,j  : integer;
begin
    iData.gubun     := 'D';
    for  i := 1  to  16  do  begin
       for  j := 1  to  8 do  begin
           iData.PropCnt[i,j] := 0;
           iData.ChanCnt[i,j] := 0;
       end;
    end;
end;

function Tpic7061cForm.Data_Extract : string;
var
  cnt,pageCnt,gcnt,nRow,nCol  : integer;
  temp : string;
  rec  : string;
  procedure  Prop_Year;
    begin
       iData.PropCnt[nRow, nCol]  := iData.PropCnt[nRow, nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[nRow,    8]  := iData.PropCnt[nRow,    8]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[5   , nCol]  := iData.PropCnt[5   , nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[5   ,    8]  := iData.PropCnt[5   ,    8]+Qappr.FieldByName('cnt').Asinteger;

    end;
 //
  procedure  Chan_Year;
    begin
       iData.ChanCnt[nRow, nCol]  := iData.ChanCnt[nRow, nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[nRow,    8]  := iData.ChanCnt[nRow,    8]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[5   , nCol]  := iData.ChanCnt[5   , nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[5   ,    8]  := iData.ChanCnt[5   ,    8]+Qappr.FieldByName('cnt').Asinteger;
    end;
 //    
  procedure  Prop_Cause;
    begin
       iData.PropCnt[nRow, nCol]  := iData.PropCnt[nRow, nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[nRow,    8]  := iData.PropCnt[nRow,    8]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[16  , nCol]  := iData.PropCnt[16  , nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.PropCnt[16  ,    8]  := iData.PropCnt[16  ,    8]+Qappr.FieldByName('cnt').Asinteger;

    end;
 //
  procedure  Chan_Cause;
    begin
       iData.ChanCnt[nRow, nCol]  := iData.ChanCnt[nRow, nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[nRow,    8]  := iData.ChanCnt[nRow,    8]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[16  , nCol]  := iData.ChanCnt[16  , nCol]+Qappr.FieldByName('cnt').Asinteger;
       iData.ChanCnt[16  ,    8]  := iData.ChanCnt[16  ,    8]+Qappr.FieldByName('cnt').Asinteger;
    end;

begin
  Data_Extract := '';
  Qappr.close; Qappr.sql.clear;
  Qappr.sql.add('SELECT dispcause,dispterm,dispyn,paycl,count(empno) cnt ');
  Qappr.sql.add('FROM   pihport                                     ');
  Qappr.sql.add('WHERE  retodate   =  :lretodate                    ');
  Qappr.sql.add(' AND  dispcause is not null                        ');
  Qappr.sql.add(' AND  paycl < ''80''                               ');
  Qappr.sql.add('GROUP BY dispcause,dispyn,dispterm,paycl           ');
  Qappr.ParamByName('lretodate').AsString    := tremddate;
  Qappr.Open;

  if Qappr.recordCount = 0 then begin
     MessageBox(handle,'해당 자료가 없습니다 !!.','확 인',MB_OK or $0030);
     Qappr.close; Data_Extract := '없슴';
     system.Exit;
  end;

  Qappr.First;
  AssignFile(F,HomeDir+'\list\pic7060c.tmp');
  System.ReWrite(F);

  pageCnt := 1; cnt := 1; gcnt := 1;  Dpagenum := 1;
//  temp    := Qappr.fieldByName('boncode').AsString;
  clear_data;
  while not Qappr.Eof do begin
    if Qappr.RecordCount <> cnt then
       Gr.Progress := (cnt * 100) div Qappr.RecordCount else Gr.Progress := 100;
    SendMessage(panel3.handle,WM_PAINT,0,0);

   if   copy(Qappr.FieldByName('paycl').AsString,1,1)  > '7'  then
        nCol  := 7
   else begin
        nCol  :=  StrToInt(copy(Qappr.FieldByName('paycl').AsString,1,1));
   end;

    if  Qappr.FieldByName('dispterm').AsString =  '1'  then       //5년이상
        nRow  :=  1
    else
    if  Qappr.FieldByName('dispterm').AsString =  '2'  then       //3년~5년
        nRow  :=  2
    else
    if  Qappr.FieldByName('dispterm').AsString =  '3'  then       //1년~3년
        nRow  :=  3
    else
    if  Qappr.FieldByName('dispterm').AsString =  '4'  then       //1년미만
        nRow  :=  4;

    Prop_Year;

   if   Qappr.FieldByName('dispyn').AsString = 'Y'  then  begin      //전환이동여부
        Chan_Year;
   end;
////////////////
    if  Qappr.FieldByName('dispcause').AsString =  '11'  then     // 직무경력다양
        nRow  :=  6
    else
    if  Qappr.FieldByName('dispcause').AsString =  '12'  then     // 전공/자격활용
        nRow  :=  7
    else
    if  Qappr.FieldByName('dispcause').AsString =  '21'  then     // 업무애로 적성부적합
        nRow  :=  8
    else
    if  Qappr.FieldByName('dispcause').AsString =  '22'  then     //업무애로 능력부족/미발휘
        nRow  :=  9
    else
    if  Qappr.FieldByName('dispcause').AsString =  '23'  then     // 업무애로 흥미의욕없음
        nRow  :=  10
    else
    if  Qappr.FieldByName('dispcause').AsString =  '31'  then     // 무연고비자발적근무
        nRow  :=  11
    else
    if  Qappr.FieldByName('dispcause').AsString =  '32'  then     // 부부별거
        nRow  :=  12
    else
    if  Qappr.FieldByName('dispcause').AsString =  '33'  then     // 가족부양
        nRow  :=  13
    else
    if  Qappr.FieldByName('dispcause').AsString =  '34'  then     // 자녀교육
        nRow  :=  14
    else
        nRow  :=  15;                                             // 기타고충

    Prop_Cause;

   if   Qappr.FieldByName('dispyn').AsString = 'Y'  then  begin      //전환이동여부
        Chan_Cause;
   end;

   Qappr.Next;
   inc(cnt); inc(gcnt);
  end;
  //================ 출 력  ===========
  for  nRow := 1   to  16  do  begin    //  미전환 = ( 신청 - 전환 )
       iData.ChanCnt[nRow,  9]  :=   iData.PropCnt[nRow,  8] - iData.ChanCnt[nRow,  8];
  end;
  System.Write(F,iData);
  //====================================
  Gr.Progress := 0;
  Qappr.close;
  system.close(F);
end;

//
procedure Tpic7061cForm.BtextClick(Sender: TObject);
begin
  wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pic7060c.out'),SW_SHOW) < 32 then
        WinExec(PChar('edit '+HomeDir+'\list\pic7060c.out'),SW_SHOW);
  end;
  HelpDsr.Caption := '작업결과 화일 ==> ['+HomeDir+'\list\pic7060c.out]';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;
//
end.
