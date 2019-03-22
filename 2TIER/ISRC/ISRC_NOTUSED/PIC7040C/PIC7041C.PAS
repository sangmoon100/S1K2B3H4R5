{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC7040C(조직개편내역)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 박규석
  Version         : 30.00
  Date            : 1998.12.29
  Update Contents
    버전    수정일     수정자   수정내용            관련근거
    1.00   1997.10.10  김순례   신규프로그램 개발   처리명세서
   30.00   1998.12.29  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
unit pic7041c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls,timeftp,pass,datelib,dept1lib,codelib, DB, DBTables,
  QuickRpt,Qrprntr,codeText,forgnum, Mask;

type
  Tpic7041cForm = class(TForm)
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
    Panel6: TPanel;
    Panel12: TPanel;
    paycl1: TMaskEdit;
    Label3: TLabel;
    paycl2: TMaskEdit;
    Panel15: TPanel;
    mgu3: TRadioButton;
    mgu2: TRadioButton;
    mgu1: TRadioButton;
    mgu4: TRadioButton;
    mgu5: TRadioButton;
    Panel4: TPanel;
    deptcode3: TMaskEdit;
    deptcode4: TMaskEdit;
    Label1: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    bgu3: TRadioButton;
    bgu2: TRadioButton;
    bgu1: TRadioButton;
    Panel17: TPanel;
    jgu3: TRadioButton;
    jgu2: TRadioButton;
    jgu1: TRadioButton;
    QCode: TQuery;
    Query1: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mgu1Click(Sender: TObject);
    procedure bguClick(Sender: TObject);
    procedure jguClick(Sender: TObject);
    procedure paycl1Click(Sender: TObject);
    procedure deptcode1DblClick(Sender: TObject);
  private
    { Private declarations }
    wordpad : Boolean;
    FreeCheck,FreeDept : Boolean;
    function  QdeptDisp(s1,s2 : String) : String;
    function  QcodeDisp(s1,s2 : String) : String;
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
       empno     : string[4];
       korname   : string[12];
       deptname  : string[60];
       payra     : string[20];
       paycl     : string[12];
       bdeptname : string[60];
       bpayra    : string[20];
       jgubun    : string[4];

  end;

var
  pic7041cForm: Tpic7041cForm;
  ErrorHelp : array[0..255] of char;
  F         : file of inText;
  iData     : inText;
  HomeDir   : string;
  payrachdate : string;

implementation
uses pic7042c,pic7043c,pic7044c;
{$R *.DFM}

//------입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..-----------}
function Tpic7041cForm.QCodeDisp(s1,s2 : String) : String;
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
    str := TextCodeDisp(s1,s2,HomeDir+'\pic7040c.cod');
    if trim(str) = '' then QcodeDisp := '('+trim(s2)+')'
                      else QcodeDisp := str;
end;
end;

function Tpic7041cForm.QdeptDisp(s1,s2 : String) : String;
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
    str := TextDeptDisp(s1,s2,HomeDir+'\pic7040c.dep');
    if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
                      else QDeptDisp := str;
 end;
end;

{------------------------------폼에 관련된 사항들----------------------------}
procedure Tpic7041cForm.FormCreate(Sender: TObject);
begin
  start    := 0;
end;

procedure Tpic7041cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
end;

procedure Tpic7041cForm.FormPaint(Sender: TObject);
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

   CurDate  := TimeDate(Qappr);
   L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                         copy(CurDate,5,2)+'/'+
                         copy(CurDate,7,2);

//   if PassDialog(pic7041cForm,p_empno,pkorname,password) = False then halt(0);
   L_UserName.Caption := pkorname+'('+p_empno+')';

   HelpDsr.Caption := '';
   with Query1 do
   begin
        close;
        sql.Clear;
        sql.Add('select Value3, Value4 from pimvari          ');
        sql.Add(' where gubun = ''00'' and sgubun = ''0001'' ');
        open;
        payrachdate := Query1.FieldByName('value3').AsString;
   end;

   Qvari.close;   Qvari.Open;
   if trim(Qvari.FieldByName('value1').AsString) = '' then
      MessageBox(handle,'인사변수화일에 조직개편기준일자 존재하지 않습니다 !!.','확 인',MB_OK or $0030)
   else begin
      tremddate := Qvari.FieldByName('value1').AsString;
   end;
   Qvari.close;
   mgu1Click(mgu1);
   bguClick(bgu1);
   jguClick(jgu1);
   deptcode1.SetFocus;
end;
end;

procedure Tpic7041cForm.BexitClick(Sender: TObject);
begin
if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
   close;
end;

procedure Tpic7041cForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
end;

{-------------------------작업을 실행한다--------------------------------------}
procedure Tpic7041cForm.BscreenClick(Sender: TObject);
begin
 if    deptcode1.text  >  deptcode2.text  then  begin
       MessageBox(handle,'부서코드  입력 오류입니다.','확 인',MB_OK or $0030);
       system.exit;
  end;

  HelpDsr.Caption := '조직개편 화일에서 데이타를 추출하고 있습니다 !!.';
  SendMessage(hp.handle,WM_PAINT,0,0);

  if Data_Extract  = '' then begin
     Gr.Progress := 0; Qappr.Close;
     HelpDsr.Caption := '추출된 자료를 출력합니다..';
     SendMessage(hp.handle,WM_PAINT,0,0);


     if TbitBtn(sender).tag = 1 then begin   //화면
        pic7042cForm.apprReport.Preview;
     end;

     if TbitBtn(sender).tag = 2 then begin
        printdialog1.FromPage  := 1;
        printdialog1.ToPage    := Dpagenum;
        printdialog1.copies    := 1;
        if printdialog1.Execute = True  then begin
           pic7042cForm.apprReport.PrinterSettings.FirstPage := printdialog1.frompage;
           pic7042cForm.apprReport.PrinterSettings.lastpage  := printdialog1.topage;
           pic7042cForm.apprReport.PrinterSettings.Copies    := printdialog1.copies;
           pic7042cForm.apprReport.print;
        end;
     end;

   if TbitBtn(sender).tag  =  3  then  Form_TextFile;
  end else begin
      Wordpad := False; end;

  HelpDsr.Caption := '작업이 완료되었습니다..';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;

// 메모리변수 데이타 클리어
procedure Tpic7041cForm.clear_data;
begin
    iData.gubun     := 'D';
    iData.empno     := '';
    iData.korname   := '';
    iData.deptname  := '';
    iData.payra     := '';
    iData.bdeptname := '';
    iData.bpayra    := '';
    iData.jgubun    := '';
end;

function Tpic7041cForm.Data_Extract : string;
var
  cnt,pageCnt,gcnt  : integer;
  temp,cur_vari,temp_vari,bumun_temp : string;
  rec  : string;
begin
  Data_Extract := '';
  Qappr.close;
  Qappr.sql.clear;
  Qappr.sql.add('select empno,korname,orgnum,deptcode,boncode,payra,dporgnum, ');
  Qappr.sql.add('       deptlevel,dpdeptlevel,dpdeptcode,dppayra,dpboncode,trgubun,paycl ');
  Qappr.sql.add('from   pitremd                                                      ');
  Qappr.sql.add('where  remddate   =  :lremddate                                     ');
  Qappr.sql.add('  and  deptcode   >= :ldeptcode1   and  deptcode   <= :ldeptcode2   ');
  Qappr.sql.add('  and  dpdeptcode >= :ldpdeptcode1 and  dpdeptcode <= :ldpdeptcode2 ');
  Qappr.sql.add('  and  paycl      >= :lpaycl1      and  paycl      <= :lpaycl2      ');
  case bgubun of
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.29  박규석   직위,직급수정       하나로인사재개발
  2 : 전보,   3 : 조직.
 ---------------------------------------------------------------------------}
//    2 :  Qappr.sql.add(' and (substr(dppayra,2,1) in (''0'',''5''))     ');
//    3 :  Qappr.sql.add(' and (substr(dppayra,2,1) not in (''0'',''5'')) ');
    2 :begin
         if tremddate < payrachdate then
            Qappr.sql.add(' and (substr(dppayra,1,1) in (''1'',''2'',''3'',''4'',''5''))     ')
         else
            Qappr.sql.add(' and (substr(dppayra,1,1) in (''A'',''B'',''C''))                       ');
       end;
    3 :begin
         if tremddate < payrachdate then
            Qappr.sql.add(' and (substr(dppayra,1,1) not in (''1'',''2'',''3'',''4'',''5'')) ')
         else
            Qappr.sql.add(' and (substr(dppayra,1,1) not in (''A'',''B'',''C''))                   ');
       end;
  end;
  case jgubun of
    2 :  Qappr.sql.add(' and trgubun =''11''                          ');
    3 :  Qappr.sql.add(' and trgubun <> ''11''                        ');
  end;

  case mgubun of
    1 :  Qappr.sql.add('order by deptcode,dpdeptcode,payra,paycl,paygr          ');
    2 :  Qappr.sql.add('order by dpdeptcode,deptcode,dppayra,paycl,paygr,empno');
    3 :  Qappr.sql.add('order by korname,empno                       ');
    4 :  Qappr.sql.add('order by paycl,deptcode,dpdeptcode,payra,paygr,empno    ');
    5 :  Qappr.sql.add('order by paycl,dpdeptcode,deptcode,dppayra,trgubun    ');
  end;
  Qappr.ParamByName('lremddate').AsString    := tremddate;
  Qappr.ParamByName('ldeptcode1').AsString   := deptcode1.text;
  Qappr.ParamByName('ldeptcode2').AsString   := deptcode2.text;
  Qappr.ParamByName('ldpdeptcode1').AsString := deptcode3.text;
  Qappr.ParamByName('ldpdeptcode2').AsString := deptcode4.text;
  Qappr.ParamByName('lpaycl1').AsString      := paycl1.text;
  Qappr.ParamByName('lpaycl2').AsString      := paycl2.text;

  Qappr.Open;

  if Qappr.recordCount = 0 then begin
     MessageBox(handle,'해당 자료가 없습니다 !!.','확 인',MB_OK or $0030);
     Qappr.close; Data_Extract := '없슴';
     system.Exit;
  end;

  Qappr.First;
  AssignFile(F,HomeDir+'\list\pic7040c.tmp');
  System.ReWrite(F);

  pageCnt := 1; cnt := 1; gcnt := 1;  Dpagenum := 1;

  if  mgubun  =  1   then       //현부서순
      temp_vari := copy(Qappr.fieldByName('boncode').AsString,1,2)
  else
  if  mgubun  =  2   then       //배치부서순
      temp_vari := copy(Qappr.fieldByName('dpboncode').AsString,1,2)
  else
  if  mgubun   >  3  then       //BAND순
      temp_vari := copy(Qappr.fieldByName('paycl').AsString,1,1)
  else
      temp_vari := '';

  while not Qappr.Eof do begin
    clear_data;
    if Qappr.RecordCount <> cnt then
       Gr.Progress := (cnt * 100) div Qappr.RecordCount else Gr.Progress := 100;
    SendMessage(panel3.handle,WM_PAINT,0,0);
    //  현부서분,배치부서순일경우 본부별  page skip
    //  성명순일경우 page skip하지 않음
    if  mgubun  =  1   then   begin    //현부서순
        if Qappr.fieldbyname('deptlevel').Asstring ='A0' then
             bumun_temp := copy(Qappr.fieldbyname('deptcode').Asstring,1,1);
             cur_vari := copy(Qappr.fieldByName('deptcode').AsString,1,2);
    end  else if  mgubun  =  2   then  begin     //배치부서순
           if Qappr.fieldbyname('dpdeptlevel').Asstring ='A0' then
               bumun_temp := copy(Qappr.fieldbyname('dpdeptcode').Asstring,1,1);
               cur_vari := copy(Qappr.fieldByName('dpdeptcode').AsString,1,2);
    end   else   if  mgubun   >  3  then   //BAND순
        cur_vari := copy(Qappr.fieldByName('paycl').AsString,1,1)
    else
        cur_vari := '';
   if  (mgubun  <>  3)    then  begin
      if  (temp_vari <> cur_vari) and (Qappr.Eof <> True) then  begin
             if (bumun_temp <> copy(temp_vari,1,1)) then begin
                pagecnt := 1;  inc(Dpagenum);
                iData.gubun := 'P';   system.Write(F,iData);
             end;
             if  mgubun  =  1   then       //현부서순
                 temp_vari := copy(Qappr.fieldByName('boncode').AsString,1,2)
             else if  mgubun  =  2   then       //배치부서순
                 temp_vari := copy(Qappr.fieldByName('dpboncode').AsString,1,2)
             else if  mgubun   >  3  then   //BAND순
                 temp_vari := copy(Qappr.fieldByName('paycl').AsString,1,1)
             else
                 temp_vari := '';
          end;
    end;
//}
   iData.gubun    :=  'D';
   iData.empno    :=  Qappr.fieldByName('empno').AsString;
   iData.korname  :=  Qappr.fieldByName('korname').AsString;
   iData.deptname :=  QdeptDisp(Qappr.FieldByName('orgnum').AsString,
                                Qappr.FieldByName('deptcode').AsString);
   iData.payra    :=  Qcodedisp('I113',Qappr.FieldByName('payra').Asstring);
   iData.paycl    :=  Qcodedisp('I112',Qappr.FieldByname('paycl').Asstring);
   iData.bdeptname:=  QdeptDisp(Qappr.FieldByName('dporgnum').AsString,
                                Qappr.FieldByName('dpdeptcode').AsString);
   iData.bpayra   :=  Qcodedisp('I113',Qappr.FieldByName('dppayra').Asstring);
   // 전보구분으로 코드화일에서 코드명 앞에서 4자리만 출력
   iData.jgubun   :=  copy(QcodeDisp('I310',Qappr.FieldByName('trgubun').AsString),1,4);
   System.Write(F,iData);

    Qappr.Next;
    inc(pageCnt); inc(cnt); inc(gcnt);

    if (pagecnt > 21) and (Qappr.Eof <> True) then begin
       pagecnt := 1;  inc(Dpagenum);
       iData.gubun := 'P';   system.Write(F,iData);
    end;
  end;
  Gr.Progress := 0;
  Qappr.close;
  system.close(F);
end;

//
procedure Tpic7041cForm.BtextClick(Sender: TObject);
begin
  wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pic7040c.out'),SW_SHOW) < 32 then
        WinExec(PChar('edit '+HomeDir+'\list\pic7040c.out'),SW_SHOW);
  end;
  HelpDsr.Caption := '작업결과 화일 ==> ['+HomeDir+'\list\pic7040c.out]';
  SendMessage(hp.handle,WM_PAINT,0,0);
end;
//
procedure Tpic7041cForm.mgu1Click(Sender: TObject);
begin
  mgubun := TRadioButton(Sender).Tag;
  TRadioButton(Sender).Checked := True;

end;

procedure Tpic7041cForm.bguClick(Sender: TObject);
begin
  bgubun := TRadioButton(Sender).Tag;
  TRadioButton(Sender).Checked := True;

end;

procedure Tpic7041cForm.jguClick(Sender: TObject);
begin
  jgubun := TRadioButton(Sender).Tag;
  TRadioButton(Sender).Checked := True;

end;

procedure Tpic7041cForm.paycl1Click(Sender: TObject);
begin
  codeForm := TcodeForm.Create(Self);
  Try
    codeForm.FormData := 'BAND코드 열람';
    codeForm.DataVal1 := 'I112';

    codeForm.ShowModal;
    if   codeForm.CodeName = ''  then System.Exit;
    if   TmaskEdit(Sender).Tag = 1 then
         paycl1.Text     := codeForm.Code
    else paycl2.Text     := codeForm.Code;
  Finally
    codeForm.Free;
  End;

end;


procedure Tpic7041cForm.deptcode1DblClick(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Self);
  Try
    DeptForm.DataVal1  := TmaskEdit(Sender).Text;
    DeptForm.DataVal2  := '';
    DeptForm.ShowModal;
    if   deptForm.CodeName = ''  then System.Exit;
    if   TmaskEdit(Sender).Tag = 1 then  begin
         deptcode1.Text     := DeptForm.Code1
    end  else
    if   TmaskEdit(Sender).Tag = 2 then  begin
         deptcode2.Text     := DeptForm.Code1
    end  else
    if   TmaskEdit(Sender).Tag = 3 then  begin
         deptcode3.Text     := DeptForm.Code1
    end  else
    if   TmaskEdit(Sender).Tag = 4 then  begin
         deptcode4.Text     := DeptForm.Code1
    end;
  Finally
    DeptForm.Free;
  End;

end;

end.
