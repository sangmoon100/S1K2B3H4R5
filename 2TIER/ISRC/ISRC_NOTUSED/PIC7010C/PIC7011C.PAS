{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC7010C(조직개편 부서변동내역)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김순례
  Version         : 1.00
  Date            : 1997.10.10
  Update Contents
    1.00    1997.10.10   김순례  신규프로그램 개발  처리명세서
 ---------------------------------------------------------------------------}
unit pic7011c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls,timeftp,pass,datelib,dept1lib, DB, DBTables,
  QuickRpt,Qrprntr,codeText,forgnum, Mask;

type
  Tpic7011cForm = class(TForm)
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    panel7: TPanel;
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
    deptcode1: TMaskEdit;
    Label2: TLabel;
    deptcode2: TMaskEdit;
    Qappr: TQuery;
    QCode: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure deptcode1Click(Sender: TObject);
  private
    { Private declarations }
    wordpad : Boolean;
    FreeCheck,FreeDept     : Boolean;
    pageCnt : integer;
    function  QcodeDisp(s1,s2 : String) : String;
    function  QdeptDisp(s1,s2 : String) : String;
//    function  Qdeptabbr:string;
    function  Data_Extract : string;
    procedure clear_data;
    procedure check_page;
  public
    { Public declarations }
    P_empno  : string;
    pkorname : string;
    password : string;
    start    : integer;
    torgnum  : string;
    Dpagenum : integer;
    mgubun   : integer;
  end;

  type
  inText = record
       gubun     : string[1];
       bdeptabbr : string[60];
       deptabbr  : string[60];
       remark    : string[20];
  end;

var
  pic7011cForm: Tpic7011cForm;
  ErrorHelp : array[0..255] of char;
  F         : file of inText;
  iData     : inText;
  HomeDir   : string;
  
implementation
uses pic7012c,pic7013c,pic7014c;
{$R *.DFM}

{------입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..-----------}
function Tpic7011cForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
if trim(s2) = '' then begin QcodeDisp := ''; system.exit; end;
if FreeCheck = False then begin
   QCode.Close;
   QCode.Parambyname('lcodeid').AsString := s1;
   QCode.Parambyname('lcodesub').AsString   := s2;
   QCode.Open;
   if trim(QCode.FieldByName('CodeName').AsString) = ''  then
      QcodeDisp := '('+s2+')'
   else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
end else begin
    str := TextCodeDisp(s1,s2,HomeDir+'\pic7010c.cod');
    if trim(str) = '' then QcodeDisp := '('+trim(s2)+')'
                      else QcodeDisp := str;
end;
end;
function Tpic7011cForm.QdeptDisp(s1,s2 : String) : String;
var
  str : string;
begin
 if trim(s2) = '' then begin QDeptDisp := ''; system.exit; end;
 if FreeDept = False then begin
    Qdept.Close;
    Qdept.Parambyname('lorgnum').AsString   := s1;
    Qdept.Parambyname('ldeptcode').AsString := s2;
    Qdept.Open;
    if trim(Qdept.FieldByName('DeptName').AsString) = ''  then
       QdeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
    else QdeptDisp := Qdept.FieldByName('DeptName').AsString;
 end else begin
    str := TextDeptDisp(s1,s2,HomeDir+'\pic7010c.dep');
    if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
                      else QDeptDisp := str;
 end;
end;


{
function Tpic7011cForm.Qdeptabbr : String;
begin
     Qdept.Open;
    if trim(Qdept.FieldByName('Deptabbr').AsString) = ''  then
       Qdeptabbr   := ''      // '부서코드('+Qdept.FieldByName('Deptcode').AsString+')'
    else Qdeptabbr := Qdept.FieldByName('Deptabbr').AsString;
    Qdept.Close;

end;
}
{------------------------------폼에 관련된 사항들----------------------------}
procedure Tpic7011cForm.FormCreate(Sender: TObject);
begin
  start    := 0;
end;

procedure Tpic7011cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
  end;

procedure Tpic7011cForm.FormPaint(Sender: TObject);
var
  CurDate : String;
begin
if start = 0 then begin
   start := 1;
   Application.Processmessages;
   DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
   DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
   DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
   Try
      Database1.Connected := True;
   EXCEPT ON E : EDataBaseError DO begin
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     halt(0);
   end;
   END;

   CurDate  := TimeDate(Qappr);
   L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                         copy(CurDate,5,2)+'/'+
                         copy(CurDate,7,2);

//  if PassDialog(pic7011cForm,p_empno,pkorname,password) = False then halt(0);
   L_UserName.Caption := pkorname+'('+p_empno+')';

//   if FreeCheck = True then
   HelpDsr.Caption := '';

   Qvari.close;   Qvari.Open;
   if trim(Qvari.FieldByName('value2').AsString) = '' then
      MessageBox(handle,'인사변수화일에 조직개편차수가  존재하지 않습니다 !!.','확 인',MB_OK or $0030)
   else begin
      torgnum := Qvari.FieldByName('value2').AsString;

   end;
   Qvari.close;
end;
end;

procedure Tpic7011cForm.BexitClick(Sender: TObject);
begin
if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then begin
   close;
end;
end;

{-------------------------작업을 실행한다--------------------------------------}
procedure Tpic7011cForm.BscreenClick(Sender: TObject);
begin
 if    deptcode1.text  >  deptcode2.text  then  begin
       MessageBox(handle,'부서코드  입력 오류입니다.','확 인',MB_OK or $0030);
       system.exit;
  end;

  HelpDsr.Caption := '부서코드 화일에서 데이타를 추출하고 있습니다 !!.';
  SendMessage(hp.handle,WM_PAINT,0,0);

  if Data_Extract  = '' then begin          //실행.
     Gr.Progress := 0; Qappr.Close;
     HelpDsr.Caption := '추출된 자료를 출력합니다..';
     SendMessage(hp.handle,WM_PAINT,0,0);


     if TbitBtn(sender).tag = 1 then begin   //화면
        pic7012cForm.apprReport.Preview;
     end;

     if TbitBtn(sender).tag = 2 then begin
        printdialog1.FromPage  := 1;
        printdialog1.ToPage    := Dpagenum;
        printdialog1.copies    := 1;
        if printdialog1.Execute = True  then begin
           pic7012cForm.apprReport.PrinterSettings.FirstPage := printdialog1.frompage;
           pic7012cForm.apprReport.PrinterSettings.lastpage  := printdialog1.topage;
           pic7012cForm.apprReport.PrinterSettings.Copies    := printdialog1.copies;
           pic7012cForm.apprReport.print;
        end;
     end;

   if TbitBtn(sender).tag  =  3  then  Form_TextFile;
  end else begin
      Wordpad := False; end;

  HelpDsr.Caption := '작업이 완료되었습니다..';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;

// 메모리변수 데이타 클리어
procedure Tpic7011cForm.clear_data;
begin
    iData.gubun     := 'D';
    iData.bdeptabbr := '';
    iData.deptabbr  := '';
    iData.remark    := '';

end;

function Tpic7011cForm.Data_Extract : string;
var
  cnt,gcnt  : integer;
begin
  Data_Extract := '';
  Qappr.close; Qappr.sql.clear;
  Qappr.sql.add('select deptcode, deptname,borgnum,bdeptcode1,   ');
  Qappr.sql.add('       bdeptcode2,bdeptcode3,chanmode           ');
  Qappr.sql.add('  from pycdept                                  ');
  Qappr.sql.add(' where orgnum = :lorgnum and existon = ''1''    ');
  Qappr.sql.add('   and deptcode >= :ldeptcode1                  ');
  Qappr.sql.add('   and deptcode <= :ldeptcode2                  ');
  Qappr.sql.add(' order by deptcode                              ');

  Qappr.ParamByName('lorgnum').AsString    := torgnum;
  Qappr.ParamByName('ldeptcode1').AsString := deptcode1.text;
  Qappr.ParamByName('ldeptcode2').AsString := deptcode2.text;
  Qappr.Open;
//showmessage(inttostr(Qappr.recordCount));
  if Qappr.recordCount = 0 then begin
     MessageBox(handle,'해당 자료가 없습니다 !!.','확 인',MB_OK or $0030);
     Qappr.close; Data_Extract := '없슴';
     system.Exit;
  end;

  Qappr.First;
  AssignFile(F,HomeDir+'\list\pic7010c.tmp');
  System.ReWrite(F);

  pageCnt := 1; cnt := 1; gcnt := 1;  Dpagenum := 1;
  while not Qappr.Eof do
  begin
    clear_data;
    if Qappr.RecordCount <> cnt then
       Gr.Progress := (cnt * 100) div Qappr.RecordCount else Gr.Progress := 100;
    SendMessage(panel3.handle,WM_PAINT,0,0);

    iData.deptabbr  := Qappr.fieldByName('deptcode').AsString + ' ' +
                       Qappr.fieldByName('deptname').AsString;

    iData.bdeptabbr   := Qappr.fieldByName('bdeptcode1').AsString + ' ' +
                         QdeptDisp(Qappr.FieldByName('borgnum').AsString,
                                   Qappr.FieldByName('bdeptcode1').AsString);

    iData.remark    := QcodeDisp('I170',Qappr.FieldByName('chanmode').AsString);   //변동구분코드
    System.Write(F,iData);  inc(pageCnt);
    check_page;
    if Qappr.fieldbyname('bdeptcode2').Asstring <> '' then
    begin
       iData.gubun := 'D';
       iData.bdeptabbr   := Qappr.fieldByName('bdeptcode2').AsString + ' ' +
                            QdeptDisp(Qappr.FieldByName('borgnum').AsString,
                                      Qappr.FieldByName('bdeptcode2').AsString);
       System.Write(F,iData);
       inc(pageCnt);
       check_page;
    end;
    if Qappr.fieldbyname('bdeptcode3').Asstring <> '' then
    begin
       iData.gubun := 'D';
       iData.bdeptabbr   := Qappr.fieldByName('bdeptcode3').AsString + ' ' +
                            QdeptDisp(Qappr.FieldByName('borgnum').AsString,
                                      Qappr.FieldByName('bdeptcode3').AsString);

       System.Write(F,iData);  inc(pageCnt);
       check_page;
    end;
    Qappr.Next;
    inc(cnt); inc(gcnt);
    Check_Page;
  end;
  Gr.Progress := 0;
  Qappr.close;
  system.close(F);
end;

procedure Tpic7011cForm.check_page;
begin
    if (pagecnt > 19) and (Qappr.Eof <> True) then begin
       pagecnt := 1;  inc(Dpagenum);
       iData.gubun := 'P';   system.Write(F,iData);
    end;
end;
//
procedure Tpic7011cForm.BtextClick(Sender: TObject);
begin
  wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pic7010c.out'),SW_SHOW) < 32 then
        WinExec(PChar('edit '+HomeDir+'\list\pic7010c.out'),SW_SHOW);
  end;
  HelpDsr.Caption := '작업결과 화일 ==> ['+HomeDir+'\list\pic7010c.out]';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;
//
procedure Tpic7011cForm.deptcode1Click(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Self);
  Try
//    DeptForm.DataVal1  := TmaskEdit(Sender).Text;
//    DeptForm.DataVal2  := '';
    DeptForm.ShowModal;
    if   deptForm.CodeName = ''  then System.Exit;
    if   TmaskEdit(Sender).Tag = 1 then
         deptcode1.Text     := DeptForm.Code1
    else deptcode2.Text   := DeptForm.Code1;
  Finally
    DeptForm.Free;
  End;
end;


end.
