{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIA1020G(입사내역 일괄등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1996.04.27
Update contents
  1.00   1996.04.27    전철호  신규프로그램개발   처리명세서
--------------------------------------------------------------------------------
}

unit Pia1021g;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Gauges,timeFtp, DB,
  DBTables,iniFiles,datelib,pass,codetext, MemDS, DBAccess, Ora, Func;

type
  Tpia1021gForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel5: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel4: TPanel;
    readnum: TPanel;
    Ga1: TGauge;
    errornum: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    acessnum: TPanel;
    Panel3: TPanel;
    FileNm: TMaskEdit;
    FileSaveOpen: TSpeedButton;
    Panel6: TPanel;
    Panel8: TPanel;
    R1: TPanel;
    R2: TPanel;
    J1: TPanel;
    J2: TPanel;
    J3: TPanel;
    BExit: TBitBtn;
    BSave: TBitBtn;
    FileOpenDlg: TOpenDialog;
    Panel9: TPanel;
    HelpPanel: TPanel;
    Bcode: TBitBtn;
    Im1: TImage;
    im2: TImage;
    dm1: TImage;
    dm2: TImage;
    dm3: TImage;
    Berr: TBitBtn;
    Qmas: TOraQuery;
    QMas1: TOraQuery;
    Qcode: TOraQuery;
    Qpcmvari: TOraQuery;
    Qpcmpass: TOraQuery;
    Qpchuapp: TOraQuery;
    Qtext: TOraQuery;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FileSaveOpenClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure J1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FileNmChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BcodeClick(Sender: TObject);
    procedure BerrClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ReadCnt,ErrorCnt,AcessCnt : integer;
    Gu1,Gu2   : integer;
    FreeCheck : Boolean;
    HomeDir   : string;
    function QcodeExit(s1,s2 : string) : Boolean;
    procedure Text_run;
    procedure Chung_run;
    procedure ErrorWrite(p : real; Estr : string);
  public
    { Public declarations }
    start    : integer;
  end;

type
 errFile = record
           errlog : array[1..200] of char;
           lfcr   : array[1..2]  of char;
end;

type
  MasFile = record
            empno    : string[4];    {사원번호}
            korname  : string[12];   {성명}
            empterm  : string[3];    {입사기수}
            empschgr : string[2];    {입사학력}
//            emppaycl : string[2];    {입사직급}
//            emppaygr : string[2];    {입사호봉}
            armypaygr: string[2];    {군호봉}
            maspaygr : string[2];    {석사호봉}
            carpaygr : string[2];    {경력호봉}
            etcpaygr : string[2];    {기타호봉}
            grpaygrsum : string[2];  {부여호봉계}
            etcpaycont : string[30]; {기타호봉내역}
            cardate  : string[8];    {경력일}
            remark   : string[2];    {특기사항}
end;

var
  pia1021gForm: Tpia1021gForm;
  ErrorHelp   : array[0..255] of char;
  F           : System.Text;
  MData       : MasFile;
  err         : file of errFile;
  errData     : errFile;
implementation

{$R *.DFM}

function Tpia1021gForm.QcodeExit(s1,s2 : string) : Boolean;
var
  str : string;
begin
 QcodeExit := True;
 if trim(s2) <> '' then begin
    if FreeCheck = False then begin
       QCode.Close;
       QCode.Parambyname('lcodeid').AsString  := s1;
       QCode.Parambyname('lcodeno').AsString  := s2;
       QCode.Open;
       if trim(Qcode.FieldByName('codeName').AsString) = '' then QcodeExit := False;
       Qcode.close;
    end else begin
       str := TextCodeDisp(s1,s2,HomeDir+'\list\pia1020g.dat');
       if trim(str) = '' then QcodeExit := False;
    end;
 end;
end;


{종료버턴을 누를경우 }
procedure Tpia1021gForm.BexitClick(Sender: TObject);
begin
   if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then begin
      close;
   end;
end;

procedure Tpia1021gForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   codeToText(HomeDir+'\list\pia1020g.dat','',3);
end;

// 폼에 관련된 사항들..---------------------------------------------------------
procedure Tpia1021gForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpia1021gForm.FormActivate(Sender: TObject);
{폼이 활성화 될때}
var
  iniFile : TiniFile;
begin
  HomeDir   := HomeDirOpen;
end;

procedure Tpia1021gForm.FormPaint(Sender: TObject);
var
  CurDate : string;
begin
if start = 0 then begin
  start := 1;
  Application.ProcessMessages;

  helpDsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;

  if copy(Pgrade,2,1) > 'C' then
  begin
       MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
       close;
  end;

  R1Click(R1);  J1Click(J1);  FileNm.SetFocus;
  Helpdsr.Caption := '해당코드를 다운받고 시작하시면 속도가 향상됩니다..';
end;
end;

procedure Tpia1021gForm.FileSaveOpenClick(Sender: TObject);
{화일을 오픈 한다..}
begin
 FileOpenDlg.Execute;
 Filenm.Text := FileOpenDlg.FileName;
 Filenm.SetFoCus;
end;

procedure Tpia1021gForm.ErrorWrite(p : real; Estr : string);
begin
  ArrStr(ErrData.errLog,'  '+FormatFloat('000',p)+'번째 : '+'사원번호('+Mdata.empno+') '+
                            '성명('+Mdata.korname+') =>'+Estr);
  ErrData.lfcr[1] := chr(13);
  ErrData.lfcr[2] := chr(10);
  System.Write(Err,ErrData);
end;

procedure Tpia1021gForm.BSaveClick(Sender: TObject);
{변경작업을 시작한다...}
begin
  ReadCnt  := 0;  ErrorCnt := 0;  AcessCnt := 0;

  if gu1 = 1 then begin
     if FileExists(Filenm.Text) = False then  begin
        MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
        System.Exit;
     end;
     Text_Run;
  end;
{  if gu1 = 2 then  Chung_run;}
  FileNm.SetFocus;
  ga1.Progress    := 0;
  HelpDsr.Caption := '작업 완료 !! (결과화일 : '+HomeDir+'\list\pia1020g.err)';
end;

procedure Tpia1021gForm.Text_run;
var
  i         : integer;
  s1,str    : string;
  procedure DispGuage;
  begin
    ErrorNum.Caption := IntToStr(ErrorCnt)+' 건'; SendMessage(ErrorNum.handle,WM_PAINT,0,0);
    AcessNum.Caption := IntToStr(AcessCnt)+' 건'; SendMessage(AcessNum.handle,WM_PAINT,0,0);
  end;
begin
  HelpDsr.Caption := '인사마스터 화일을 변경하고 있는 중입니다..';
  SendMessage(HelpPanel.Handle,WM_PAINT,0,0);

  System.AssignFile(F,Filenm.Text);
  System.Reset(F);   i := 0;
  while not Eof(F) do begin inc(i); Readln(F,str);  end;
  System.Close(F);

  System.AssignFile(F,Filenm.Text);  System.ReSet(F);
  System.AssignFile(Err,HomeDir+'\list\pia1020g.err');  System.Rewrite(Err);

  ArrStr(ErrData.errLog,'    ******* 입사내역일괄등록 결과리스트 *********');
  ErrData.lfcr[1] := chr(13); ErrData.lfcr[2] := chr(10);  System.Write(Err,ErrData);
  ArrStr(ErrData.errLog,' ');
  ErrData.lfcr[1] := chr(13); ErrData.lfcr[2] := chr(10);  System.Write(Err,ErrData);

  ReadCnt := i;
  ReadNum.Caption := IntToStr(ReadCnt)+' 건';
  SendMessage(ReadNum.Handle,WM_PAINT,0,0);
  i := 1;
  while not Eof(F) do begin
    DispGuage;
    if i <> ReadCnt then ga1.Progress := (i*100) div ReadCnt else ga1.Progress := 100;
    Readln(F,str);
    Mdata.empno     := PasString(str,',',1);
    Mdata.korname   := PasString(str,',',2);
    Mdata.empterm   := PasString(str,',',3);
    Mdata.empschgr  := PasString(str,',',4);
//    Mdata.emppaycl  := PasString(str,',',5);
//    Mdata.emppaygr  := PasString(str,',',6);
    Mdata.armypaygr := PasString(str,',',5);
    Mdata.maspaygr  := PasString(str,',',6);
    Mdata.carpaygr  := PasString(str,',',7);
    Mdata.etcpaygr  := PasString(str,',',8);
    Mdata.grpaygrsum:= PasString(str,',',9);
    Mdata.etcpaycont:= PasString(str,',',10);
    Mdata.cardate   := PasString(str,',',11);
    Mdata.remark    := PasString(str,',',12);
//    if NumberCheck(Mdata.emppaygr)   = False then Mdata.emppaygr   := '0';
    if NumberCheck(Mdata.armypaygr)  = False then Mdata.armypaygr  := '0';
    if NumberCheck(Mdata.maspaygr)   = False then Mdata.maspaygr   := '0';
    if NumberCheck(Mdata.carpaygr)   = False then Mdata.carpaygr   := '0';
    if NumberCheck(Mdata.etcpaygr)   = False then Mdata.etcpaygr   := '0';
    if NumberCheck(Mdata.grpaygrsum) = False then Mdata.grpaygrsum := '0';

    // 인사마스터에 존재하는지 판단한다..
    Qmas.Close;
    Qmas.ParamByName('lempno').AsString := trim(MData.empno);
    Qmas.Open;

    if Qmas.RecordCount > 0 then begin
      s1 := trim(Mdata.korname);
      if (trim(Qmas.FieldByName('korname').AsString) = s1) then begin
         if QcodeExit('I221',trim(Mdata.empschgr)) = false then begin
            ErrorWrite(i,'입사학력에러'); inc(ErrorCnt); DispGuage;
            inc(i); continue;
         end;
         if trim(Mdata.remark) <> '' then
            if QcodeExit('I040',trim(Mdata.remark)) = false then begin
               ErrorWrite(i,'특기사항코드에러'); inc(ErrorCnt); DispGuage;
               inc(i); continue;
            end;
         inc(AcessCnt); DispGuage;
         Qmas1.Close;
         Qmas1.Sql.Clear;
         Qmas1.Sql.Add('update pimpmas set ');
         Qmas1.Sql.Add(Format('empterm = ''%s'',',
                              [Mdata.empterm]));
       //Qmas1.Sql.Add(Format('emppaycl = ''%s'',emppaygr = ''%3f'',',
       //                     [Mdata.emppaycl,StrToFloat(Mdata.emppaygr)]));
         Qmas1.Sql.Add(Format('empschgr= ''%s'',cardate = ''%s'',',
                              [Mdata.empschgr,Mdata.cardate]));
         Qmas1.Sql.Add(Format('armypaygr= %3f,maspaygr = %3f,',
                              [StrToFloat(Mdata.armypaygr),StrToFloat(Mdata.maspaygr)]));
         Qmas1.Sql.Add(Format('carpaygr = %3f,etcpaygr = %3f,',
                              [StrToFloat(Mdata.carpaygr),StrToFloat(Mdata.etcpaygr)]));
         Qmas1.Sql.Add(Format('grpaygrsum = %3f,',
                              [StrToFloat(Mdata.armypaygr)+StrToFloat(Mdata.maspaygr)+
                               StrToFloat(Mdata.carpaygr)+StrToFloat(Mdata.etcpaygr)]));
         Qmas1.Sql.Add(Format('etcpaycont=''%s'',',
                              [Mdata.etcpaycont]));
         Qmas1.Sql.Add(Format('remark = ''%s'' where (empno = ''%s'')',
                              [Mdata.remark,Mdata.empno]));
         Qmas1.EXECSQL;
      end else begin
          ErrorWrite(i,'성명에러.'); inc(ErrorCnt); DispGuage;
      end;
    end else begin
        ErrorWrite(i,'인사마스터에 미존재.'); inc(ErrorCnt); DispGuage;
    end;
    inc(i);
  end; {while end}
  ArrStr(ErrData.errLog,'');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10);
  System.Write(Err,ErrData);
  ArrStr(ErrData.errLog,'  총건수   : '+ReadNum.Caption+
                        '  처리건수 : '+AcessNum.Caption+
                        '  오류건수 : '+ErrorNum.Caption);
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10);
  System.Write(Err,ErrData);
  
  system.Close(err); system.close(F);
end;

procedure Tpia1021gForm.Chung_run;
var
  i        : integer;
  s1,s2,s3 : string;
begin
  HelpDsr.Caption := '인력충원변수화일을 읽고 있습니다.';
  SendMessage(HelpPanel.Handle,WM_PAINT,0,0);
  Qpcmvari.close;
  case gu2 of
   1 :  Qpcmvari.parambyname('lsgubun').AsString := '0001';
   2 :  Qpcmvari.parambyname('lsgubun').AsString := '0002';
   3 :  Qpcmvari.parambyname('lsgubun').AsString := '0003';
  end;
  Qpcmvari.open;
  s1 := Qpcmvari.FieldByName('value1').AsString;  {채용년도}
  s2 := Qpcmvari.FieldByName('value2').AsString;  {채용구분}
  s3 := Qpcmvari.FieldByName('value3').AsString;  {채용기수}
  Qpcmvari.close;
  HelpDsr.Caption := '최종합격자화일을 읽고 있습니다.';
  SendMessage(HelpPanel.Handle,WM_PAINT,0,0);
  Qpcmpass.close;
  Qpcmpass.parambyname('lempyy').AsString    := s1;
  Qpcmpass.parambyname('lempgubun').AsString := s2;
  Qpcmpass.parambyname('lempnum').AsString   := s3;
  Qpcmpass.Open;

  HelpDsr.Caption := '인사마스터 화일을 변경하고 있는 중입니다..';
  SendMessage(HelpPanel.Handle,WM_PAINT,0,0);
  Qpcmpass.First;
  for i := 1 to Qpcmpass.RecordCount do begin
     Qmas.Close;
     Qmas.ParamByName('lempno').AsString := Qpcmpass.FieldByName('empno').AsString;
     Qmas.Open;

     if Qmas.RecordCount > 0 then  begin
           Qpchuapp.close;
           Qpchuapp.parambyname('lempyy').AsString    := s1;
           Qpchuapp.parambyname('lempgubun').AsString := s2;
           Qpchuapp.parambyname('lempnum').AsString   := s3;
           Qpchuapp.parambyname('lenrollno').AsString   := Qpcmpass.FieldByName('enrollno').AsString;
           Qpchuapp.Open;

           if QcodeExit('I101',Qpchuapp.FieldByName('empcode').AsString)  = false then begin
              ErrorWrite(i,'입사코드에러'); inc(ErrorCnt); continue;
           end;
           if QcodeExit('I221',Qpchuapp.FieldByName('empschgr').AsString) = false then begin
              ErrorWrite(i,'입사학력에러'); inc(ErrorCnt); continue;
           end;
           if QcodeExit('I115',Qpchuapp.FieldByName('jobline').AsString)  = false then begin
              ErrorWrite(i,'직렬코드에러'); inc(ErrorCnt); continue;
           end;
           if Qpchuapp.FieldByName('remark').AsString <> '' then
              if QcodeExit('I040',Qpchuapp.FieldByName('remark').AsString) = false then begin
                 ErrorWrite(i,'특기사항코드에러'); inc(ErrorCnt); continue;
              end;

           inc(AcessCnt);   Qmas1.Close;  Qmas1.Sql.Clear;
           Qmas1.Sql.Add('update pimpmas set ');
           Qmas1.Sql.Add('empcode = :l1,empterm = :l2,empschgr = :l3,armypaygr = :l4,');
           Qmas1.Sql.Add('maspaygr = :l5,carpaygr = :l6,etcpaygr = :l7,');
           Qmas1.Sql.Add('grpaygrsum = :l8,etcpaycont = :l9,cardate = :l10,');
           Qmas1.Sql.Add('jobline = :l11,remark = :l12 ');
           Qmas1.Sql.Add('where (empno = :lempno)');
           Qmas1.ParamByName('l1').AsString := Qpchuapp.FieldByName('empcode').AsString;
           Qmas1.ParamByName('l2').AsString := Qpchuapp.FieldByName('empterm').AsString;
           Qmas1.ParamByName('l3').AsString := Qpchuapp.FieldByName('empschgr').AsString;
           Qmas1.ParamByName('l4').AsFloat  := Qpchuapp.FieldByName('armypaygr').AsFloat;
           Qmas1.ParamByName('l5').AsFloat  := Qpchuapp.FieldByName('maspaygr').AsFloat;
           Qmas1.ParamByName('l6').AsFloat  := Qpchuapp.FieldByName('carpaygr').AsFloat;
           Qmas1.ParamByName('l7').AsFloat  := Qpchuapp.FieldByName('etcpaygr').AsFloat;
           Qmas1.ParamByName('l8').AsFloat  := Qpchuapp.FieldByName('armypaygr').AsFloat+
                                               Qpchuapp.FieldByName('maspaygr').AsFloat+
                                               Qpchuapp.FieldByName('carpaygr').AsFloat+
                                               Qpchuapp.FieldByName('etcpaygr').AsFloat;
           Qmas1.ParamByName('l9').AsString  := Qpchuapp.FieldByName('etcpaycont').AsString;
           Qmas1.ParamByName('l10').AsString := Qpchuapp.FieldByName('cardate').AsString;
           Qmas1.ParamByName('l11').AsString := Qpchuapp.FieldByName('jobline').AsString;
           Qmas1.ParamByName('l12').AsString := Qpchuapp.FieldByName('remark').AsString;
           Qmas1.ParamByName('lempno').AsString := Qpchuapp.FieldByName('empno').AsString;
           Qmas1.EXECSQL;
     end else begin ErrorWrite(i,'사원번호에러.'); inc(ErrorCnt); end;
     ReadNum.Caption  := IntToStr(i)+' 건';
     ErrorNum.Caption := IntToStr(ErrorCnt)+' 건';
     AcessNum.Caption := IntToStr(AcessCnt)+' 건';
     SendMessage(ReadNum.handle,WM_PAINT,0,0);
     SendMessage(ErrorNum.handle,WM_PAINT,0,0);
     SendMessage(AcessNum.handle,WM_PAINT,0,0);
     if i <> ReadCnt then ga1.Progress := (i*100) div ReadCnt else ga1.Progress := 100;
     Qpcmpass.Next;
  end; {for end}
  Qmas.Close;
  Qmas1.Close;
  Qpchuapp.Close;
  Qpcmpass.Close;
end;

procedure Tpia1021gForm.R1Click(Sender: TObject);
begin
  if TPanel(Sender).Tag = 2 then system.exit;
  im1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).Tag of
   1 : im1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : im2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  Gu1 := TPanel(Sender).Tag;
end;

procedure Tpia1021gForm.J1Click(Sender: TObject);
begin
  if Gu1 = 1 then system.exit;
  dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).Tag of
   1 : dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  Gu2 := TPanel(Sender).Tag;
end;

procedure Tpia1021gForm.FileNmChange(Sender: TObject);
begin
  HelpDsr.Caption := '';
end;

procedure Tpia1021gForm.BcodeClick(Sender: TObject);
var
  str : string;
begin
 if FreeCheck = False then begin
    Bcode.Caption := '해당코드 해제';
 end else begin
    Bcode.Caption := '해당코드 다운';
    FreeCheck := False; system.exit;
 end;
 FreeCheck := DiskSpaceCheck;
 if FreeCheck = False then system.exit;
 HelpDsr.Caption := '해당코드를 다운받고 있습니다 !!.(속도증가를 위함)';
 SendMessage(HelpPanel.handle,WM_PAINT,0,0);

 codeToText(HomeDir+'\list\pia1020g.dat','',0);
 with QText do begin
    close; sql.clear;
    sql.add('select codeid,codeno,codename from pyccode ');
    sql.add('where (codeid = ''I221'') or ');
    sql.add('      (codeid = ''I040'') ');
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
 codeToText('','',2); HelpDsr.Caption := '';
end;

procedure Tpia1021gForm.BerrClick(Sender: TObject);
begin
 if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pia1020g.err'),
            SW_SHOW) < 32 then
    WinExec(PChar('edit '+HomeDir+'\list\pia1020g.err'),SW_SHOW);
end;

end.
