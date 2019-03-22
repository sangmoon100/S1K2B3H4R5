{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC1100G(조직차수 변경작업)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 전철호
  Version         : 1.00
  Date            : 1996.4.25
  Update Contents
    1.00    1996.4.25   전철호  신규프로그램 개발   처리명세서
 ---------------------------------------------------------------------------}
unit Pic1101g;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,iniFiles, DB, DBTables,
  Gauges,timeftp,datelib,pass;

type
  Tpic1101gForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel1: TPanel;
    BExit: TBitBtn;
    BSave: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    helpDsr: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    FileNm: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    FileSaveOpen: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    readnum: TPanel;
    errornum: TPanel;
    acessnum: TPanel;
    FileOpenDlg: TOpenDialog;
    Ga1: TGauge;
    QMas1: TQuery;
    Panel8: TPanel;
    Qdept: TQuery;
    Qsave: TQuery;
    Qmas: TQuery;
    Berr: TBitBtn;
    Database1: TDatabase;
    Q_date: TQuery;
    procedure FileSaveOpenClick(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FileNmChange(Sender: TObject);
    procedure BerrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ReadCnt   : integer; {읽어들인 갯수}
    ErrorCnt  : integer; {에러건수}
    AcessCnt  : integer;  {처리건수}
    procedure nojo_check(s1,s2 : string; var nojopayra : string);
    procedure ErrorWrite(s1,s2,s3,s4,Estr : string);
    function  QDeptDisp(s1,s2 : String) : String;
    function  PaydunmCheck(s1,s2,s3 : String) : String;
  public
    { Public declarations }
    P_empno   : string;
    P_Korname : string;
    password  : string;
    HomeDir   : string;
    start     : integer;
  end;

type
   OrgFile = record
             empno   : string[4];
             korname : string[12];
             orgnum  : string[3];
             deptcode: string[6];
end;

type
   DeptRec = record
             deptcode  : string[6];
             boncode   : string[6];
             fieldcode : string[2];
             jobdept   : string[6];
             placecode : string[2];
             fincode   : string[6];
             nogubun   : string[2];
             payrayn   : string[1];
             paydunm   : string[30];
end;

type
 errFile = record
           errlog : array[1..200] of char;
           lfcr   : array[1..2]  of char;
end;


var
  pic1101gForm: Tpic1101gForm;
  OrgOpen     : system.Text; {조직차수를 변경할 화일구조 }
  efile       : file of errFile;
  OrgData     : OrgFile;
  tDeptRec    : DeptRec;
  ErrData     : errFile;
  ErrorHelp   : array[0..255] of char;
implementation
{$R *.DFM}

// 입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..................
function Tpic1101gForm.QDeptDisp(s1,s2 : String) : String;
begin
  QDeptDisp := '';
  QDept.Close;
  QDept.ParamByName('ldeptcode').AsString := s1;
  QDept.ParamByName('lorgnum').AsString   := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then begin
     QDeptDisp := '';
     tDeptRec.deptcode := Qdept.FieldByName('deptcode').AsString;
     tDeptRec.jobdept  := Qdept.FieldByName('deptcode').AsString;
     tDeptRec.boncode  := Qdept.FieldByName('boncode').AsString;
     tDeptRec.fieldcode:= Qdept.FieldByName('fieldcode').AsString;
     tDeptRec.placecode:= Qdept.FieldByName('placecode').AsString;
     tDeptRec.fincode  := Qdept.FieldByName('fincode').AsString;
  end else  QDeptDisp := '부서에러';
  QDept.Close;
end;

// 직책명을 구해준다............................................................
function Tpic1101gForm.PayDunmCheck(s1,s2,s3 : String) : String;
var
  gu  : string;
begin
  gu := '';
  if (copy(s3,2,1) <> '0') and (copy(s3,2,1) <> '5') then begin
     PaydunmCheck := ''; system.Exit
  end;
  QDept.Close;
  QDept.ParamByName('Ldeptcode').AsString := s1;
  QDept.ParamByName('lorgnum').AsString   := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then begin
     if (copy(s3,2,1) = '5') then
        gu := Qdept.FieldByName('deptabbr').AsString+'장직대'
     else gu := Qdept.FieldByName('deptabbr').AsString+'장';
  end;
  PaydunmCheck := copy(gu,1,30);
  QDept.Close;
end;

// 노조원 체크를 한다...........................................................
procedure Tpic1101gForm.nojo_check(s1,s2 : string; var nojopayra : string);
var
  d1,d2,p1,p2 : string;
  tnojopayra1,tnojopayra2  : string;
begin
 {노조원여부(노조구분) 체크 }
 {1. 직위 <100 또는 직위 >900 보다 큰경우 노조원구분 비노조원(10)}
   nojopayra := '20';
   if (copy(s2,1,3) < '100') or (copy(s2,1,3) > '999') then begin
      nojopayra := '10'; system.exit;
   end;
 {2.직위를 조건으로 하여 인사변수화일에 존재여부 확인(변수구분,변수1 = 직위}
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1,value2 from pimvari where gubun = ''60'' and sgubun = ''0001'' ');
   Qsave.Open;
   tnojopayra1 := Qsave.FieldByName('value1').AsString;
   tnojopayra2 := Qsave.FieldByName('value2').AsString;
   Qsave.Close;
   if copy(s2,1,3) <= tnojoPayra1 then begin
      nojopayra := '10'; system.exit;
   end;
   if (copy(s2,1,3) <= tnojoPayra2) and (tDeptRec.Payrayn  = 'Y') then begin
      nojopayra := '10'; system.exit;
   end;

 {부서,직위조건으로 인사변수화일에 존재여부 확인}
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1 from pimvari ');
   Qsave.Sql.Add('where (gubun = ''61'') and ');
   Qsave.Sql.Add(Format('(value1 <= ''%s'' and value2 >= ''%s'') and ',
                 [s1,s1]));
   Qsave.Sql.Add(Format('(value3 <= ''%s'' and value4 >= ''%s'') ',
                 [s2,s2]));
   Qsave.Open;
   if Qsave.RecordCount > 0 then nojopayra := '10';
   Qsave.Close;
   if (tDeptRec.nogubun >= '20') and (nojopayra = '20') then
      nojopayra := tDeptRec.nogubun;
end;

// 에러를 화일에 기록한다.......................................................
procedure Tpic1101gForm.ErrorWrite(s1,s2,s3,s4,Estr : string);
begin
  ArrStr(ErrData.errLog,'사원번호('+s1+')'+'성명('+s2+')'+
                        '조직차수('+s3+')'+'부서코드('+s4+')  →'+Estr);
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10);
  System.Write(efile,ErrData);
end;

procedure Tpic1101gForm.FileSaveOpenClick(Sender: TObject);
begin
   FileOpenDlg.Execute;
   Filenm.Text := FileOpenDlg.FileName;
   FileNm.SetFocus;
end;

procedure Tpic1101gForm.BExitClick(Sender: TObject);
begin
  if MessageBox(handle,'종료하시겠습니까 ?','확 인',MB_YESNO or $0030) = ID_YES then begin
     close;
  end;
end;

// 폼에 관련된 사항들...........................................................
procedure Tpic1101gForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpic1101gForm.FormActivate(Sender: TObject);
var
  iniFile : TiniFile;
begin
  HomeDir   := HomeDirOpen;
  P_empno   := PassEmp(cmdline,1);
  P_korname := PassEmp(cmdline,2);
  password  := PassEmp(cmdline,3);
  Helpdsr.Caption := '';
  FileNm.SetFocus;
end;

procedure Tpic1101gForm.FormPaint(Sender: TObject);
var
  CurDate : string;
begin
if start = 0 then begin
  start := 1;
  Application.ProcessMessages;
  DataBase1.Params[0] := 'SERVER NAME='+ Passemp(cmdline,13);
  DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
  DataBase1.Params[16] := 'PASSWORD=' +PassEmp(cmdline,6);
  Try
     Database1.Connected := True;
  EXCEPT ON E : EDataBaseError DO begin
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     halt(0);
  end;
  END;
  CurDate := TimeDate(Q_date);
  L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                        copy(CurDate,5,2)+'/'+
                        copy(CurDate,7,2);


//  if PassDialog(pic1101gForm,p_empno,p_korname,password) = False then halt(0);
  L_UserName.Caption := P_korname+'('+P_empno+')';
end;
end;

// 실행버턴을 눌렀을 경우.......................................................
procedure Tpic1101gForm.BSaveClick(Sender: TObject);
var
  i,j      : integer;
  s1,s2    : string;
  str,nojo : string;
  procedure DispGuage;
  begin
    ErrorNum.Caption := IntToStr(ErrorCnt)+' 건';
    AcessNum.Caption := IntToStr(AcessCnt)+' 건';
    SendMessage(ErrorNum.Handle,WM_PAINT,0,0);
    SendMessage(AcessNum.Handle,WM_PAINT,0,0);
  end;
begin
  ReadCnt   := 0;
  ErrorCnt  := 0;
  AcessCnt  := 0;
  if FileExists(Filenm.Text) = False then begin
     MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0010);
     System.Exit;
  end;

  HelpDsr.Caption := '조직차수를 변경하고 있는 중입니다..';
  SendMessage(Panel6.Handle,WM_PAINT,0,0);

  System.AssignFile(OrgOpen,Filenm.Text);
  System.Reset(OrgOpen);  i := 0;
  while not Eof(OrgOpen) do begin
     inc(i); Readln(OrgOpen,str);
  end;
  ReadCnt := i;  system.Close(OrgOpen);
  ReadNum.Caption := IntToStr(ReadCnt)+' 건';
  SendMessage(ReadNum.Handle,WM_PAINT,0,0);

  System.AssignFile(OrgOpen,Filenm.Text);
  System.ReSet(OrgOpen);
  System.AssignFile(efile,HomeDir+'\list\pic1100g.err');
  System.ReWrite(efile);

  ArrStr(ErrData.errLog,'      **** 조직차수 에러 리스트 ****');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10);  System.Write(efile,ErrData);
  ArrStr(ErrData.errLog,'');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10);  System.Write(efile,ErrData);

  i := 1;
  while not Eof(orgOpen) do begin
    if i <> ReadCnt then ga1.Progress := (i * 100) div ReadCnt else ga1.Progress := 100;
    DispGuage;   Readln(orgOpen,str);
    tDeptRec.deptcode := '';
    tDeptRec.fieldcode:= '';
    tDeptRec.boncode  := '';
    tDeptRec.placecode:= '';
    tDeptRec.fincode  := '';
    tDeptRec.nogubun  := '';
    tDeptRec.paydunm  := '';

    OrgData.empno   := PasString(str,',',1);
    OrgData.korname := PasString(str,',',2);
    OrgData.orgnum  := PasString(str,',',3);
    OrgData.deptcode:= PasString(str,',',4);

    Qmas.Close;
    Qmas.ParamByName('lempno').AsString := OrgData.Empno;
    Qmas.Open;
    tDeptRec.payrayn  := Qmas.FieldByName('payrayn').AsString;
    tDeptRec.nogubun  := Qmas.FieldByName('nogubun').AsString;
    s2 := Qmas.FieldByName('korname').AsString;
    s1 := copy(OrgData.korname,1,length(s2));
    if Qmas.RecordCount > 0 then   begin
       if s2 = s1 then begin
          if QDeptDisp(OrgData.deptcode,OrgData.orgnum) ='부서에러' then begin
             inc(ErrorCnt); inc(i); DispGuage;
             ErrorWrite(OrgData.empno,OrgData.korname,OrgData.orgnum,
                        OrgData.deptcode,'부서코드,조직차수에러');
             continue;
          end;
          //tDeptRec.paydunm  := PaydunmCheck(Qmas.FieldByName('deptcode').AsString,
          //                                  Qmas.FieldByName('orgnum').AsString,
          //                                  Qmas.FieldByName('payra').AsString);
          Nojo_Check(Qmas.FieldByName('deptcode').AsString,
                     Qmas.FieldByName('payra').AsString,nojo);
          tDeptRec.nogubun  := copy(nojo,1,2);

          Qmas1.Close;  Qmas1.Sql.Clear;
          Qmas1.Sql.Add('update pimpmas ');
          Qmas1.Sql.Add(Format('set orgnum    = ''%s'',deptcode = ''%s'','+
                                   'fieldcode = ''%s'',jobplace = ''%s'','+
                                   'fincode   = ''%s'',nogubun  = ''%s'','+
                                   'boncode   = ''%s'',jobdept  = ''%s'' where empno = ''%s'' ',
                        [trim(OrgData.Orgnum)    ,trim(OrgData.deptcode),
                         trim(tDeptRec.fieldcode),trim(tDeptRec.placecode),
                         trim(tDeptRec.fincode)  ,trim(tDeptRec.nogubun),
                         trim(tDeptRec.boncode)  ,trim(tDeptRec.jobdept),trim(OrgData.empno) ]));
          Qmas1.EXECSQL;
          inc(acessCnt); DispGuage;
       end else begin
                inc(ErrorCnt); DispGuage;
                ErrorWrite(OrgData.empno,OrgData.korname,OrgData.orgnum,
                           OrgData.deptcode,'성명에러');
                end;
    end else begin
             inc(ErrorCnt); DispGuage;
             ErrorWrite(OrgData.empno,OrgData.korname,OrgData.orgnum,
                        OrgData.deptcode,'사원코드에러');
             end;
    inc(i);
  end;

  ArrStr(ErrData.errLog,'  총읽은건수 : '+inttostr(readCnt)+
                        '    에러건수 : '+inttostr(errorCnt)+
                        '    처리건수 : '+inttostr(AcessCnt));
  ErrData.lfcr[1] := chr(13);
  ErrData.lfcr[2] := chr(10);
  System.Write(efile,ErrData);

  System.Close(OrgOpen);  System.Close(efile);
  Qmas.Close;             Qmas1.close;
  ga1.Progress := 0;
  HelpDsr.Caption := '작업완료 !!. (에러화일명 : '+HomeDir+'\list\pic1100g.err)';
  FileNm.SetFocus;
end;

procedure Tpic1101gForm.FileNmChange(Sender: TObject);
begin
  HelpDsr.Caption := '';
end;

procedure Tpic1101gForm.BerrClick(Sender: TObject);
begin
 if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pic1100g.err'),SW_SHOW) < 32 then
    WinExec(PChar('edit '+HomeDir+'\list\pic1100g.err'),SW_SHOW);
end;

end.
