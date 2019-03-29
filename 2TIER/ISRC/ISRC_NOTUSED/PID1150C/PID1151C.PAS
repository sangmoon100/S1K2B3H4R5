{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PID1150C(수습평가표작성)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.01
Date            : 1998.03.12
Update contents
  버전      수정일    수정자   관련근거         수정내용
  1.00   1996.10.11   전철호  처리명세서     신규프로그램 개발
  1.01   1998.03.12   김혜진  전(98.03.11)   1차,2차 평가자지정 로직 변경.
 30.00   2004.04.22   정규용  자체           퀵레포트 버전 업그레이드
                                             평가 결재자 지정 로직 변경
 30.01   2004.07.28   정규용  오종석 과장    수습사원의 직급/직위 체크 하는 부분 제거
 30.02   2007.03.27   서혜미  신영섭 대리    수습사원 평가점수 온라인->출력폼에 penewmas의 점수 값 Display
--------------------------------------------------------------------------------
}

unit pid1151c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls,timeftp,datelib,pass,fempno,calen1,
  DB, DBTables,QuickRpt,codetext,OnRegistry;

type
  Tpid1151cForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Panel9: TPanel;
    Panel12: TPanel;
    deptcode1: TMaskEdit;
    deptcode2: TMaskEdit;
    Panel6: TPanel;
    mgu1: TRadioButton;
    empno1: TMaskEdit;
    empno2: TMaskEdit;
    korname1: TMaskEdit;
    korname2: TMaskEdit;
    Panel3: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel5: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Bexcel: TBitBtn;
    hp: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel4: TPanel;
    empdate1: TMaskEdit;
    Label1: TLabel;
    empdate2: TMaskEdit;
    Panel7: TPanel;
    mgu2: TRadioButton;
    Qdept: TQuery;
    QCode: TQuery;
    Qemp: TQuery;
    Qingo: TQuery;
    Database1: TDatabase;
    Qmas: TQuery;
    Qtext: TQuery;
    Qvari: TQuery;
    Qd: TQuery;
    Query1: TQuery;
    Edit1: TEdit;
    FSave: TSaveDialog;
    Btext: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure mguClick(Sender: TObject);
    procedure empnoDblClick(Sender: TObject);
    procedure CalendarDblClick(Sender: TObject);
    procedure empnoExit(Sender: TObject);
    procedure empnoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BscreenClick(Sender: TObject);
    procedure BexcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure inputFieldExit(Sender: TObject);
  private
    { Private declarations }
    deptlevel : string[2];
    extcode   : string[6];
    boncode   : string[6];
    deptna3   : String;

    wordpad,doubleName,FreeCheck : Boolean;
    ingoRpt : TquickRep;
    function  QCodeDisp(s1,s2 : String) : String;
    function  QdeptDisp(s1,s2 : String) : String;
    function  ingo_process_rtn : string;
    function  inputCheck : Boolean;
//  procedure ingo_select_rtn;
//  procedure ingo_find_rtn(const arg : integer);
//  procedure ingo_copy_rtn(const arg1 : integer; const arg2,arg3 : string);
    function  PL_Select_ingo : Boolean;
    procedure Pitingo_Clear;
    procedure ShowPreview;
    procedure MakeTextFile;
  public
    { Public declarations }
    P_empno  : string;
    pkorname : string;
    password : string;
    Torgnum : string;
    vRabasdate : String;
    start    : integer;
    mgubun   : integer;
  end;

type
   ingoText = record
     gubun       : string[1];
     deptname    : string[60];
     empno       : string[4];
     korname     : string[10];
     paycl       : string[6];
     payGR       : string[02];
     empdate     : string[10];
     indate      : string[20];
     e1payra     : string[12];
     e2payra     : string[12];
     e1empno     : string[4];
     e2empno     : string[4];
     e1korname   : string[10];
     e2korname   : string[10];
     eckorname   : string[10];
     econyn      : string[1];
     ability1    : string[2];  //shm
     ability2    : string[2];
     ability3    : string[2];
     ability4    : string[2];
     ability5    : string[2];
     ability6    : string[2];
     ability_tot : string[2];
     manner1     : string[2];
     manner2     : string[2];
     manner3     : string[2];
     manner4     : string[2];
     manner5     : string[2];
     manner_tot  : string[2];
     score_tot   : string[3];
     mark1       : string[255];
end;

var
  pid1151cForm: Tpid1151cForm;
  ErrorHelp : array[0..500] of char;
  F         : file of ingoText;
  iData     : ingoText;
  HomeDir   : string;
  NewHomeDir: String;
  CurDate   : String;

const
  SUBKEY    : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
  
implementation
uses pid1152c,pid1153c,pid1154c;
{$R *.DFM}

// 출력물을 화면으로 볼수있도록 한다.-------------------------------------------
procedure Tpid1151cForm.ShowPreView;
begin
  pid1153cForm := Tpid1153cForm.Create(Self);
  Try
    pid1153cForm.ShowModal;
  Finally
    pid1153cForm.Free;
  End;
end;

// 입력필드를 체크한다..--------------------------------------------------------
function Tpid1151cForm.inputCheck : Boolean;
begin
  inputCheck := True;
  if trim(empno1.Text) > trim(empno2.Text) then begin
      MessageBox(handle,'사번 필드에러','에  러',MB_OK or $0010);
      inputCheck := False;
  end;
  if trim(deptcode1.Text) > trim(deptcode2.Text) then begin
     MessageBox(handle,'부서코드 필드에러','에  러',MB_OK or $0010);
     inputCheck := False;
  end;
  if DateMaxmin(empdate1.Text,empdate2.Text) = False then begin
     MessageBox(handle,'입사일자 필드에러','에  러',MB_OK or $0010);
     inputCheck := False;
  end;
end;

procedure Tpid1151cForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\pid1150c.cod','',0);
 with QText do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where (codeid = ''I112'' or codeid = ''I113'') ');
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

// 입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..----------------
function Tpid1151cForm.QDeptDisp(s1,s2 : String) : String;
begin
  if trim(s1) = '' then begin QDeptDisp := ''; System.Exit; end;
  QDept.Close;
  QDept.ParamByName('Ldept').AsString := s1;
  QDept.ParamByName('Lorg').AsString  := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then begin
     QDeptDisp := QDept.FieldByName('deptname').AsString;
     deptlevel := Qdept.FieldByName('deptlevel').AsString;
     boncode   := Qdept.FieldByName('boncode').AsString;
     extcode   := Qdept.FieldByName('extcode').AsString;
     deptna3   := Qdept.FieldByName('deptna3').AsString;
  end else  QDeptDisp := '코드에러';
  QDept.Close;
end;

// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..----------------
function Tpid1151cForm.QCodeDisp(s1,s2 : String) : String;
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
   Qcode.close;
end else begin
    str := TextCodeDisp(s1,s2,HomeDir+'\pid1150c.cod');
    if trim(str) = '' then QcodeDisp := '('+trim(s2)+')'
                      else QcodeDisp := str;
end;
end;

// 폼에관련된 사항들.-----------------------------------------------------------
procedure Tpid1151cForm.FormCreate(Sender: TObject);
begin
  start    := 0;
  p_empno  := '';
  pkorname := '';
  password := '';
  NewHomeDir := GetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'NewHomeDir');
end;

procedure Tpid1151cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
  ingoRpt := pid1152cForm.ingoRpt;
  empno1.Text    := '0000';
  empno2.Text    := 'ZZZZ';
  Deptcode1.Text := '00000';
  Deptcode2.Text := 'ZZZZZ';
  doubleName := False;
end;

procedure Tpid1151cForm.FormPaint(Sender: TObject);
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
   CurDate  := TimeDate(Query1);
   L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                        copy(CurDate,5,2)+'/'+
                        copy(CurDate,7,2);

   //if PassDialog(pid1151cForm,p_empno,pkorname,password) = False then halt(0);
   L_UserName.Caption := pkorname+'('+p_empno+')';
   FreeCheck := DiskSpaceCheck;

   HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
   SendMessage(hp.handle,WM_PAINT,0,0);
   if FreeCheck = True then MakeTextFile;
   Qvari.close;   Qvari.open;
   Vrabasdate := Qvari.fieldbyname('value1').Asstring;
   Torgnum    := Qvari.fieldbyname('value2').Asstring;

   Qvari.close;

   Qvari.open;
   HelpDsr.Caption := '';
   mguClick(mgu1);
end;
end;

procedure Tpid1151cForm.BexitClick(Sender: TObject);
begin
if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then begin
   close;
end;
end;

procedure Tpid1151cForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   codeToText(HomeDir+'\list\pid1150c.tmp','',3);
   codeToText(HomeDir+'\pid1150c.cod','',3);
end;

// 작성구분을 클릭했을 경우.----------------------------------------------------
procedure Tpid1151cForm.mguClick(Sender: TObject);
begin
  TRadioButton(Sender).Checked := True;
  mgubun := TRadioButton(Sender).Tag;
end;

// 사원번호를 더블클릭할 경우---------------------------------------------------
procedure Tpid1151cForm.empnoDblClick(Sender: TObject);
begin
  empForm := TempForm.Create(self);
  Try
//    if copy(TmaskEdit(Sender).Name,1,5) ='empno' then
//       empForm.DataVal1 := TMaskEdit(Sender).Text;
//    if copy(TmaskEdit(Sender).Name,1,7) ='korname' then
//     empForm.DataVal2 := TMaskEdit(Sender).Text;

    empForm.ShowModal;
    if trim(empForm.code) <> '' then begin
       case TMaskEdit(Sender).tag of
        1 : begin
            empno1.Text    := empForm.Code;
            korname1.Text  := empForm.CodeName;
            end;
        2 : begin
            empno2.Text    := empForm.Code;
            korname2.Text  := empForm.CodeName;
            end;
       end;
    end;
  Finally
    empForm.Free;
  End;
end;

// 입사일자를 더블클릭할 경우.--------------------------------------------------
procedure Tpid1151cForm.CalendarDblClick(Sender: TObject);
begin
 Calendar := TCalendar.Create(Self);
 Try
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then
      TMaskEdit(Sender).Text := Calendar.DayCaption;
 Finally
   Calendar.Free;
 End;
end;

// 사원,성명이 포커스를 일었을 경우.--------------------------------------------
procedure Tpid1151cForm.empnoExit(Sender: TObject);
begin
  HelpDsr.Caption := '';
  if trim(TMaskEdit(Sender).Text) = '' then  system.Exit;
  Qemp.Close;
  if copy(TmaskEdit(Sender).Name,1,7) = 'korname' then begin
    case TMaskEdit(Sender).tag of
     1 : if trim(empno1.Text) <> '' then Qemp.ParamByName('lempno').AsString := empno1.Text
         else begin
              Qemp.ParamByName('lempno').AsString := TmaskEdit(Sender).text;
              doubleName := True;
              end;
     2 : if trim(empno2.Text) <> '' then Qemp.ParamByName('lempno').AsString := empno2.Text
         else begin
              Qemp.ParamByName('lempno').AsString := TmaskEdit(Sender).text;
              doubleName := True;
              end;
    end;
  end else Qemp.ParamByName('lempno').AsString := TMaskEdit(Sender).Text;
  Qemp.Open;
  if Qemp.RecordCount > 1 then begin
     HelpDsr.Caption := '동명이인 발생 !!. (성명필드에 커서를 옮기고 Enter키를 치세요).';
     doubleName := True;
     case TMaskEdit(Sender).tag of
      1 : korname1.SetFocus;
      2 : korname2.SetFocus;
     end;
  end
  else if Qemp.recordcount < 1 then begin
     case TMaskEdit(Sender).tag of
      1 :  korname1.Text := '';

      2 : korname2.Text := '';
     end;
  end
  else begin
    case TMaskEdit(Sender).tag of
     1 : begin
           empno1.Text   := Qemp.FieldByName('empno').AsString;
           korname1.Text := Qemp.FieldByName('korname').AsString;
         end;
     2 : begin
           empno2.Text   := Qemp.FieldByName('empno').AsString;
           korname2.Text := Qemp.FieldByName('korname').AsString;
         end;
    end;
  end;
    Qemp.close;

    if TMaskEdit(Sender).tag = 1 then begin
      if trim(empno2.Text)   = '' then empno2.Text   := empno1.Text;
      if trim(korname2.Text) = '' then korname2.Text := korname1.Text;
   end;
end;

// 부서,임사일자가 포커스를 상실하였을때........................................
procedure Tpid1151cForm.inputFieldExit(Sender: TObject);
begin
   if TMaskEdit(Sender).Name = 'empdate1' then begin
      if trim(empdate2.Text)  = '' then empdate2.Text  := empdate1.Text;
   end else begin
      if trim(deptcode2.Text) = '' then deptcode2.Text := deptcode1.Text;
   end;
end;

// 동명이인 처리를 하기위한 루틴.-----------------------------------------------
procedure Tpid1151cForm.empnoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Return) and (doubleName = True) then begin
     empnoDblClick(Sender);
     HelpDsr.Caption := '';
     doubleName := False;
  end;
end;

// 출력물을 생성해 준다.--------------------------------------------------------
procedure Tpid1151cForm.BscreenClick(Sender: TObject);
var
  rStr : string;
begin
  if inputCheck = False then begin
     HelpDsr.caption := '작업이 완료되었습니다 !!.';
     wordpad := False;  system.Exit;
  end;
  rStr := ingo_process_rtn;

  if rStr  = '작업중지' then
  begin
    System.Exit;
  end;
  if rStr <> '없슴' then begin
     HelpDsr.Caption := '추출된 자료를 출력합니다..';
     SendMessage(hp.handle,WM_PAINT,0,0);
     if TbitBtn(Sender).Name = 'Bscreen' then begin
        //QRPrinter.OnPreView := ShowPreView;
        //ingoRpt.PreView;
        pid1152cForm.ingoRpt.Preview;
     end;
     if TbitBtn(Sender).Name = 'Bprint'  then ingoRpt.print;
     if TbitBtn(Sender).Name = 'Btext'  then Form_TextFile;
     if TbitBtn(Sender).Name = 'Bexcel'  then
     begin
          Fsave.Execute;
          if trim(FSave.FileName) <> '' then excelFile(FSave.FileName);
          helpDsr.caption  := '작업이 완료되었습니다 !!. (결과화일 ==> ' + FSave.FileName + ')';
     end;
  end;
  HelpDsr.caption := '작업이 완료되었습니다 !!.';
end;

// 출력물을 추출하여 임시화일에 저장한다..--------------------------------------
procedure Tpid1151cForm.Pitingo_clear;
begin
     idata.gubun        := 'D';
     idata.deptname     := '';
     idata.empno        := '';
     idata.korname      := '';
     idata.paycl        := '';
     idata.paygr        := '0';
     idata.empdate      := '';
     idata.indate       := '';
     idata.e1payra      := '';
     idata.e2payra      := '';
     idata.e1empno      := '';
     idata.e2empno      := '';
     idata.e1korname    := '';
     idata.e2korname    := '';
     idata.eckorname    := '';
     idata.econyn       := '';  
     idata.ability1     := '';
     idata.ability2     := '';
     idata.ability3     := '';
     idata.ability4     := '';
     idata.ability5     := '';
     idata.ability6     := '';
     idata.ability_tot  := '';
     idata.manner1      := '';
     idata.manner2      := '';
     idata.manner3      := '';
     idata.manner4      := '';
     idata.manner5      := '';
     idata.manner_tot   := '';
     idata.score_tot    := '';
     idata.mark1        := '';
end;

// 자료를 인사마스터에서 수습사원인자만 추출한다..
function Tpid1151cForm.ingo_process_rtn : string;
var
  cnt   : integer;
  nmod  : integer;
  tdate,ddate : string[8];
begin
  ingo_process_rtn := '';
  HelpDsr.caption := '인사마스터 화일을 읽어서 출력작업을 하고 있습니다 !!.';  //shm
  SendMessage(hp.handle,WM_PAINT,0,0);
  Qingo.close;
  Qingo.sql.clear;
//  Qingo.sql.add('select empno,korname,empdate,orgnum,deptcode,paycl,paygr,payra from pimpmas ');  //shm
  if '200902' > Vrabasdate then
  begin
       Qingo.sql.add('select  a.empno,a.korname,a.empdate,a.orgnum,b.deptcode,a.paycl,a.paygr,a.payra,   ');  //shm
       Qingo.sql.add('        b.eempno e1empno,b.eempname e1korname,b.econyn,                            ');  //shm
       Qingo.sql.add('        (select codename from pyccode where codeid = ''I113''                      ');
       Qingo.sql.add('            and codeno=(select payra from pimpmas where empno = b.EEMPNO)) e1payra,');  //shm
       Qingo.sql.add('   b.ability1,b.ability2,b.ability3,b.ability4,b.ability5,b.ability6,b.ability_tot,');
       Qingo.sql.add('	 b.manner1,b.manner2,b.manner3,b.manner4,b.manner5,b.manner_tot,score_tot,mark1  ');
       Qingo.sql.add('  from  pimpmas  a, penewmas b                                                     ');
       Qingo.sql.add(' where  a.empno = b.empno                                                          ');
       Qingo.sql.add('   and  b.rabasdate = '''+Vrabasdate+'''                                           ');
       Qingo.sql.add('   and (a.empno    >= :lemp1     and    a.empno    <= :lemp2)  and                 ');
       if (Trim(deptcode1.Text) <> '') and (Trim(deptcode2.Text) <> '') then
           Qingo.sql.add('     (a.deptcode >= :ldept1  and    a.deptcode <= :ldept2) and                 ');
       if (empdate1.Text <> '')        and (empdate2.Text <> '')        then
           Qingo.sql.add('     (a.empdate  >= :ldate1  and    a.empdate  <= :ldate2) and                 ');
           Qingo.sql.add('      a.pstate   <  ''70''   and    b.payra = ''78''                           ');//a.payra=>b.payra
  end
  else
  begin
       Qingo.sql.add('select  a.empno,a.korname,a.empdate,a.orgnum,b.deptcode,a.paycl,a.paygr,a.payra,   ');  //shm
       Qingo.sql.add('        b.eempno e1empno,b.eempname e1korname,b.econyn,                            ');  //shm
       Qingo.sql.add('        (select codename from pyccode where codeid = ''I113''                      ');
       Qingo.sql.add('            and codeno=(select payra from pimpmas where empno = b.EEMPNO)) e1payra,');  //shm
       Qingo.sql.add('   b.ability1,b.ability2,b.ability3,b.ability4,b.ability5,b.ability6,b.ability_tot,');
       Qingo.sql.add('	 b.manner1,b.manner2,b.manner3,b.manner4,b.manner5,b.manner_tot,score_tot,mark1  ');
       Qingo.sql.add('  from  pimpmas  a, penewmas b                                                     ');
       Qingo.sql.add(' where  a.empno = b.empno                                                          ');
       Qingo.sql.add('   and  b.rabasdate = '''+Vrabasdate+'''                                           ');
       Qingo.sql.add('   and (a.empno    >= :lemp1     and    a.empno    <= :lemp2)  and                 ');
       if (Trim(deptcode1.Text) <> '') and (Trim(deptcode2.Text) <> '') then
           Qingo.sql.add('     (a.deptcode >= :ldept1  and    a.deptcode <= :ldept2) and                 ');
       if (empdate1.Text <> '')        and (empdate2.Text <> '')        then
           Qingo.sql.add('     (a.empdate  >= :ldate1  and    a.empdate  <= :ldate2) and                 ');
           Qingo.sql.add('      a.pstate   <  ''70''   and    b.payra = ''D51''                          ');//a.payra=>b.payra
  end;
 case mgubun of
  1 : Qingo.sql.add('order by empno');
  2 : Qingo.sql.add('order by deptcode, empno');
 end;
 Qingo.ParamByName('lemp1').AsString    := empno1.Text;
 Qingo.ParamByName('lemp2').AsString    := empno2.Text;
 if (empdate1.Text <> '') and (empdate2.Text <> '') then
 begin
   Qingo.ParamByName('ldate1').AsString   := empdate1.Text;
   Qingo.ParamByName('ldate2').AsString   := empdate2.Text;
 end;
 Qingo.ParamByName('ldept1').AsString   := deptcode1.Text;
 Qingo.ParamByName('ldept2').AsString   := deptcode2.Text;
 Qingo.Open;
 // 인쇄항목 조건을 체크하여 출력한다.
  if Qingo.RecordCount = 0 then begin
     MessageBox(handle,'해당자료가 없습니다 !!.','확 인',MB_OK or $0030);
     Qingo.close; ingo_process_rtn := '없슴';  wordpad := False;
     system.Exit;
  end;
  cnt := 1;
  AssignFile(F,HomeDir+'\list\pid1150c.tmp');  System.ReWrite(F);
  while not Qingo.Eof do
  begin
    Pitingo_clear;
    if Qingo.RecordCount <> cnt then
       Gr.Progress := (cnt * 100) div Qingo.RecordCount else Gr.Progress := 100;
    SendMessage(panel3.handle,WM_PAINT,0,0);
    // 데이타 할당
    idata.gubun    := 'D';
    idata.deptname := QdeptDisp(Qingo.FieldByName('deptcode').AsString,
                                Qingo.FieldByName('orgnum').AsString) +' '+deptna3;

    idata.empno    := Qingo.FieldByName('empno').AsString;
    idata.korname  := Qingo.FieldByName('korname').AsString;
    idata.paycl    := copy(QcodeDisp('I112',Qingo.FieldByName('paycl').AsString),1,6);
    idata.paygr    := FormatFloat('00',Qingo.FieldByName('paygr').AsFloat);
    idata.empdate  := copy(Qingo.FieldByName('empdate').AsString,1,4)+'/'+
                      copy(Qingo.FieldByName('empdate').AsString,5,2)+'/'+
                      copy(Qingo.FieldByName('empdate').AsString,7,2);
    ddate          := Qingo.FieldByName('empdate').AsString;
    // 평가기간 + 3개월 -1 일
   //  tdate := '19990228'; // 이번달만 (1999.03) 임시로 세팅 4월부터는 원래코드로 (아래 코멘트를 푼다) 해야 함.
    tdate := '';
    if trim(copy(ddate,5,2)) <> '' then begin

       if strtoint(trim(copy(ddate,5,2))) > 9 then begin
          tdate := inttostr(strToint(copy(ddate,1,4))+1)+copy(ddate,5,4);
          nmod  := (strtoint(trim(copy(ddate,5,2)))+3) mod 12;
          tdate := copy(tdate,1,4)+'0'+inttostr(nmod)+copy(ddate,7,2);
          tdate := DateCal1(tdate);
       end else begin
           tdate := copy(ddate,1,4)+
                    FormatFloat('00',StrtoFloat(trim(copy(ddate,5,2)))+3)+
                    copy(ddate,7,2);
           tdate := DateCal1(tdate);
       end;
    end;

    idata.indate    := idata.empdate+
                       copy(tdate,1,4)+'/'+copy(tdate,5,2)+'/'+copy(tdate,7,2);

    idata.ability1     :=  Qingo.FieldByName('ability1').AsString;     //shm
    idata.ability2     :=  Qingo.FieldByName('ability2').AsString;
    idata.ability3     :=  Qingo.FieldByName('ability3').AsString;
    idata.ability4     :=  Qingo.FieldByName('ability4').AsString;
    idata.ability5     :=  Qingo.FieldByName('ability5').AsString;
    idata.ability6     :=  Qingo.FieldByName('ability6').AsString;
    idata.ability_tot  :=  Qingo.FieldByName('ability_tot').AsString;
    idata.manner1      :=  Qingo.FieldByName('manner1').AsString;
    idata.manner2      :=  Qingo.FieldByName('manner2').AsString;
    idata.manner3      :=  Qingo.FieldByName('manner3').AsString;
    idata.manner4      :=  Qingo.FieldByName('manner4').AsString;
    idata.manner5      :=  Qingo.FieldByName('manner5').AsString;
    idata.manner_tot   :=  Qingo.FieldByName('manner_tot').AsString;
    idata.score_tot    :=  Qingo.FieldByName('score_tot').AsString;
    idata.mark1        :=  Qingo.FieldByName('mark1').AsString;

    idata.econyn       :=  Qingo.FieldByName('econyn').AsString;
    idata.e1empno      :=  Qingo.FieldByName('e1empno').AsString;
    idata.e1korname    :=  Qingo.FieldByName('e1korname').AsString;
//    if Qingo.FieldByName('e1payra').AsString = '팀원' then
//    idata.e1payra      :=  '팀장'
//    else
    idata.e1payra      :=  Qingo.FieldByName('e1payra').AsString;
//    ingo_select_rtn;
//    if not PL_Select_ingo then
//       ingo_process_rtn := '작업중지';


    system.Write(F,iData);

    Qingo.Next;  inc(cnt);
    if Qingo.Eof = False then
    begin
       Pitingo_Clear;     //system.Write(F,iData);
       iData.gubun := 'P';
    end;
  end;
  Gr.Progress := 0;
  Qingo.Close;
  System.Close(F);
end;

// 평가자 선정 rtn--------------------------------------------------------------
//procedure Tpid1151cForm.ingo_select_rtn;
//begin
//{  if copy(deptlevel,1,1) = 'E' then begin          {과단위
//     ingo_find_rtn(30);
//  end
//  else if copy(deptlevel,1,1) = 'D' then begin     {부단위
//     ingo_find_rtn(20);
//  end
//  else if copy(deptlevel,1,1) = 'C' then begin     {본부단위
//     ingo_find_rtn(10);
// end;
// }
//      ingo_find_rtn(30);   // 팀제이므로 부서장과 상위부서장(실장)만 존재함.
//end;

{-------------------------------------------------------------------------------
  버전      수정일    수정자   관련근거         수정내용
  1.01     98.03.12   김혜진  전(98.03.11)   1차,2차 평가자지정 로직 변경.
 -------------------------------------------------------------------------------}

//procedure Tpid1151cForm.ingo_find_rtn(const arg : integer);  // 평가자 find-rtn
//var
//  tdept : string[6];
//begin
//  {*} tdept := Qingo.FieldByName('deptcode').AsString;
//  case arg of
//   30 : begin           // 팀제이므로 부서장과 상위부서장(실장)만 존재함.
//          ingo_copy_rtn(arg,'3',tdept);
//          tdept := extcode;
//          ingo_copy_rtn(arg,'2',tdept);
//{          tdept := boncode;
//          ingo_copy_rtn(arg,'1',tdept);
//}
//        end;
//   20 : begin
//          ingo_copy_rtn(arg,'2',tdept);
//          tdept := boncode;
//          ingo_copy_rtn(arg,'1',tdept);
//        end;
//   10 : begin
//          ingo_copy_rtn(arg,'1',tdept);
//        end;
//  end;
//end;
//
//// 평가자 copy-rtn.-------------------------------------------------------------
//procedure Tpid1151cForm.ingo_copy_rtn(const arg1 : integer; const arg2,arg3 : string);
//var
//  deptlevel : string;
//begin
//   Qmas.Close;
//   Qmas.ParamByName('ldept').AsString  := arg3;
//   Qmas.ParamByName('lpaycl').AsString := '3';   {arg2;}
//   Qmas.Open;
//   Qd.close;
//   Qd.ParamByName('ldept').AsString  := arg3;
//   Qd.ParamByName('lorgnum').AsString  := Torgnum;
//   Qd.open;
//   deptlevel := Qd.fieldbyname('deptlevel').Asstring;
//   Qd.close;
//   if Qmas.RecordCount = 0 then
//   begin
//     Qmas.Close;
//     system.Exit;
//   end;
//   Qmas.First;  //첫번째 레코드만 사용한다..
//   case strtoint(arg2) of
//     1 : begin
//         idata.eckorname := copy(Qmas.FieldByName('korname').AsString,1,10);
//         if arg1 <> 10 then
//         begin
//           Qmas.close;
//           system.Exit;
//         end;
//         idata.e2korname := copy(Qmas.FieldByName('korname').AsString,1,10);
//         idata.e2payra   := copy(QcodeDisp('I113',Qmas.FieldByName('payra').AsString),1,12);
//         end;
//     2 : begin
//// 하나로는 팀단위부서이므로 부서코드=본부코드,1차평가자는 팀장,2차평가자는 실장,확인자는 실장.
//         idata.e2korname := copy(Qmas.FieldByName('korname').AsString,1,10);
//         idata.e2payra   := copy(QcodeDisp('I113',Qmas.FieldByName('payra').AsString),1,12);
//         idata.eckorname := copy(Qmas.FieldByName('korname').AsString,1,10);
//         if deptlevel  <= '50' then
//         begin
//           idata.e2korname := '';
//           idata.e2payra   := '';
//           idata.eckorname := '';
//         end;
//         Qmas.close; system.Exit;
//         end;
//     3 : begin
//         idata.e1korname := copy(Qmas.FieldByName('korname').AsString,1,10);
//         idata.e1payra   := copy(QcodeDisp('I113',Qmas.FieldByName('payra').AsString),1,12);
//         end;
//   end;
//   Qmas.Close;
//end;
//}
//
function Tpid1151cForm.PL_Select_ingo : Boolean;    // 30.00   2004.04.22 정규용 생성(기존 것 주석처리)
var
  pDept   :String;
  LoopCnt :integer;
begin
  Result := False;
  LoopCnt := 0;
  pDept := Qingo.FieldByName('deptcode').AsString;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from pihorga '+
            '  where orgym ='''+Copy(CurDate,1,6) + '''');
//             '  where orgym =''200405''');
    Open;
    if Eof then
    begin
      if MessageDlg('현재월의 조직도 생성이 미실행 상태입니다.'+
                    #13+#10+''+#13+#10+'먼저 조직도 생성을 하시기 바랍니다.'+
                    #13+#10+''+#13+#10+'조직도 생성을 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
        System.Exit;
      end
      else begin
        if FileExists(NewHomeDir+'\Bin\2tier\PIB2010G.EXE') then
        begin
          showmessage(cmdline);
          showmessage(paramstr(1));
          ShowMessage(IntToStr(Pos('.exe',Cmdline)+1));
          RunProgram(NewHomeDir+'\Bin\2tier\PIB2010G.EXE'+Copy(Cmdline,Pos('.exe',Cmdline)+4,Length(Cmdline)+4));
          Showmessage(NewHomeDir+'\Bin\2tier\PIB2010G.EXE'+Copy(Cmdline,Pos('.exe',Cmdline)+4,Length(Cmdline)+4));
        end
        else begin
          MessageDlg('메뉴에서 직접 조직도 생성을 실행 해 주십시요!', mtInformation, [mbOK], 0);
        end;
      end;
    end
    else begin
      while True do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from pihorga                      '+
                ' where orgym =''' + Copy(CurDate,1,6) + ''''+
                '   and gubun =''0''                        '+
                '   and deptcode = ''' + pDept + '''        '+
                '   and (payrayn =''Y'' or adpayrayn =''Y'')');
        Open;
        if Not Eof then
        begin
          Inc(LoopCnt);
          if LoopCnt = 1 then
          begin
            idata.e1empno   := FieldByName('empno').AsString;
            idata.e1korname := FieldByName('korname').AsString;
            idata.e1payra   := FieldByName('payraNM').AsString;
          end
          else if LoopCnt = 2 then
          begin
            idata.e2empno   := FieldByName('empno').AsString;
            idata.e2korname := FieldByName('korname').AsString;
            idata.e2payra   := FieldByName('payraNM').AsString;
            idata.eckorname := FieldByName('korname').AsString;
            System.Exit;
          end;
          Result := True;
        end;
        Qdept.Close;
        Qdept.ParamByName('Ldept').AsString := pDept;
        Qdept.ParamByName('Lorg').AsString  := Torgnum;
        Qdept.Open;
        if Qdept.Eof then
        begin
          System.Exit;
        end;
        pDept := Qdept.FieldByName('extcode').AsString;
      end;
    end;
  end;
end;

procedure Tpid1151cForm.BexcelClick(Sender: TObject);
begin
{  Wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pid1150c.out'),SW_SHOW) < 32 then
        WinExec(PChar('edit '+HomeDir+'\list\pid1150c.out'),SW_SHOW);
  end;
   HelpDsr.Caption := '작업결과 화일 ==> ['+HomeDir+'\list\pid1150c.out]';
   Application.Processmessages;
}
  Wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\windows\write '+{HomeDir+}FSave.FileName),
                SW_SHOW) < 32 then
        WinExec(PChar('edit '+{HomeDir+}FSave.FileName),SW_SHOW);
  end;
end;

end.
