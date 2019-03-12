{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIA9040G(외국어 일괄등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 21.01
Date            : 1998.06.10
Update contents
 버전    수정일     수정자  관련근거      수정내용
 21.00  1996.07.27  전철호                신규프로그램개발 상세설계서
 21.01  1998.06.10  김순례  전(98.06.09)  유효일,청취점수,독해점수추가,시험명 삭제
 21.02  2000.02.11  강기우  전(2000.02.08) 직급 추가.
 30.00  2007.06.25  서혜미                 개선작업
-------------------------------------------------------------------------------}
unit pta2021g;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Gauges, ExtCtrls, DB, DBTables,timeftp,datelib,pass,
  codeText, func, Ora;

type
  Tpia9041gForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel8: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    FileSaveOpen: TSpeedButton;
    Ga1: TGauge;
    Label3: TLabel;
    Panel3: TPanel;
    FileNm: TMaskEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    readnum: TPanel;
    errornum: TPanel;
    acessnum: TPanel;
    Panel1: TPanel;
    BExit: TBitBtn;
    BSave: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    helpDsr: TLabel;
    Qemp: TQuery;
    QCode: TQuery;
    Qfore: TQuery;
    Qsfore: TQuery;
    Database1: TDatabase;
    FileOpenDlg: TOpenDialog;
    QTfore: TQuery;
    Berr: TBitBtn;
    Bcode: TBitBtn;
    Qtext: TQuery;
    Q_date: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure FileSaveOpenClick(Sender: TObject);
    procedure FileNmChange(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BcodeClick(Sender: TObject);
    procedure BerrClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ReadCnt   : integer;  {읽어들인 갯수}
    ErrorCnt  : integer;  {에러건수}
    AcessCnt  : integer;  {처리건수}
    FreeCheck : Boolean;
    function  QCodeDisp(s1,s2 : String) : String;
    procedure ErrorWrite( cnt : Real; s1,s2,Estr : string);
    procedure PimpmasUpdate(str : string);
  public
    { Public declarations }
    P_empno   : string;
    P_Korname : string;
    Rpaycl    : string;
    password  : string;
    HomeDir   : string;
    start     : integer;
  end;

type
   TextFile = record
              empno       : string[4];
              korname     : string[12];
              payra       : string[3];  // 30.02 추가..
              examdate    : string[8];
              examtodate  : string[8];
              examname    : string[2];
              examscore1  : string[4];
              examscore2  : string[4];
              examscore12 : string[4];
              examplace   : string[20];
end;

type
  errFile = record
            errlog : array[1..100] of char;
            lfcr   : array[1..2]   of char;
end;

var
  pia9041gForm: Tpia9041gForm;
  TextOpen    : system.Text;
  efile       : file of errFile;
  TextData    : TextFile;
  ErrData     : errFile;
  ErrorHelp   : array[0..255] of char;

implementation

{$R *.DFM}
{............................코드화일을 찾는다.................................}
function Tpia9041gForm.QCodeDisp(s1,s2 : String) : String;
var
     str : string;
     qq  : TOraQuery;
begin
     if trim(s2) = '' then
     begin
          QcodeDisp := '';
          system.exit;
     end;

     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     if FreeCheck = False then
     begin
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select codename from pyccode                      ');
               SQL.Add(' where codeid = :lcodeid and codeno = :lcodesub   ');
               Parambyname('lcodeid' ).AsString   := s1;
               Parambyname('lcodesub').AsString   := s2;

               Open;

               if   trim(FieldByName('CodeName').AsString) = ''  then
                    QcodeDisp := '코드에러'
               else QCodeDisp := FieldByName('CodeName').AsString;
          end
     end
     else
     begin
          str := TextCodeDisp(s1,s2,HomeDir+'\pia3010a.cod');
          if trim(str) = '' then QcodeDisp := '코드에러'
                            else QcodeDisp := str;
     end;
end;

{........................에러사항 기록프로시져................................}
procedure Tpia9041gForm.ErrorWrite(cnt : Real; s1,s2,Estr : string);
begin
     ErrorNum.Caption := IntToStr(ErrorCnt)+' 건';
     SendMessage(ErrorNum.Handle,WM_PAINT,0,0);
     ArrStr(ErrData.errLog,'순번 : '+FormatFloat('000',cnt)+ '  '+
                           '사원번호('+s1+')'+'  '+
                           '성명('+s2+')'+
                           '->'+Estr);

     ErrData.lfcr[1] := chr(13);
     ErrData.lfcr[2] := chr(10);
     System.Write(efile,ErrData);
end;

{........................폼에 관한 사항프로시져 함수들........................}
procedure Tpia9041gForm.FormActivate(Sender: TObject);
begin
     HomeDir   := HomeDirOpen;
     start     := 0;
end;

procedure Tpia9041gForm.FormPaint(Sender: TObject);
begin
     if Start = 0 then
     begin
          Start := 1;
          OraConnect;

          L_CurDate.Caption     :=  fn_GetDateStr;
          L_UserName.Caption    :=  Pkorname +  '(' + Pempno + ')';
     end;
end;

procedure Tpia9041gForm.BExitClick(Sender: TObject);
begin
     if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
     begin
        Close;
     end;
end;

procedure Tpia9041gForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     codeToText(HomeDir+'\pia9040g.cod','',3);
end;

{................화일오픈에 관한 사항들.........................................}
procedure Tpia9041gForm.FileSaveOpenClick(Sender: TObject);
begin
     FileOpenDlg.Execute;
     Filenm.Text := FileOpenDlg.FileName;
     FileNm.SetFocus;
end;

procedure Tpia9041gForm.FileNmChange(Sender: TObject);
begin
     HelpDsr.Caption := '';
end;

{................실행버턴에 관한 사항들.........................................}
procedure Tpia9041gForm.BSaveClick(Sender: TObject);
var
     i,j,check1,check2,check3 : integer;
     str                      : string;
     tempno                   : string[4];
     qq  : TOraQuery;
begin
     ReadCnt   := 0;  ErrorCnt  := 0;  AcessCnt  := 0;
     if FileExists(Filenm.Text) = False then
     begin     //화일 존재여부.
          MessageBox(handle,'화일이 있는지 확인 하십시오 !!.','에  러',MB_OK or $0010);
          Filenm.Setfocus;
          System.Exit;
     end;

     ReadNum.Caption  := '';     //read(+)
     ErrorNum.Caption := '';     //error(-)
     AcessNum.Caption := '';     //process(=)
     SendMessage(ReadNum.Handle,WM_PAINT,0,0);
     SendMessage(ErrorNum.Handle,WM_PAINT,0,0);
     SendMessage(AcessNum.Handle,WM_PAINT,0,0);

     System.AssignFile(TextOpen,Filenm.Text);
     System.Reset(TextOpen);

     i := 0; //처리 갯수
     while not Eof(TextOpen) do
     begin
          inc(i);
          Readln(TextOpen,str);
     end;
     system.Close(TextOpen);

     ReadCnt := i;
     ReadNum.Caption  := IntToStr(ReadCnt)+' 건';
     SendMessage(ReadNum.Handle,WM_PAINT,0,0);

     System.AssignFile(TextOpen,Filenm.Text);
     System.ReSet(TextOpen);
     System.AssignFile(efile,HomeDir+'\list\pia9040g.err');
     System.ReWrite(efile);

//---------error list--------------------------------------------------
     ArrStr(ErrData.errLog,'     ***** 외국어일괄등록 에러 리스트 ********  ');
     ErrData.lfcr[1] := chr(13);
     ErrData.lfcr[2] := chr(10);

     System.Write(efile,ErrData);

     ArrStr(ErrData.errLog,'');
     ErrData.lfcr[1] := chr(13);
     ErrData.lfcr[2] := chr(10);

     System.Write(efile,ErrData);
//----------------------------------------------------------------------

     i := 0;
     try
        tempno := '';
        while not Eof(TextOpen) do
        begin
             HelpDsr.Caption := '외국어사항을 일괄등록 하고있습니다 !!';
             SendMessage(Panel6.Handle,WM_PAINT,0,0);
             Readln(TextOpen,str);
             TextData.empno       := PasString(str,',',1);  //사원번호(4
             TextData.korname     := PasString(str,',',2);  //성명(12
             TextData.payra       := PasString(str,',',3);  //BAND(2      30.02 추가.
             TextData.examname    := PasString(str,',',4);  //외국어코드(2
             TextData.examdate    := PasString(str,',',5);  //검정일(8
             TextData.examscore1  := PasString(str,',',6);  //청취점수(4
             TextData.examscore2  := PasString(str,',',7);  //독해점수(4
             TextData.examplace   := PasString(str,',',8);  //검정기관(20

             check1 := 0;        //에러 체크
             check2 := 0;
             check3 := 0;

             for j := 1 to 4 do
             begin
                  if not (TextData.examscore1[j] in ['0'..'9',#0]) then inc(check1);
                  if not (TextData.examscore2[j] in ['0'..'9',#0]) then inc(check2);
             end;

             for j := 1 to 8 do
             begin
                  if not (TextData.examtodate[j] in ['0'..'9',#0]) then inc(check3);
             end;

             inc(i);        //Ga1 -> 읽은 처리 표시....
             if i <> ReadCnt then
                ga1.Progress := (i * 100) div ReadCnt
             else
                ga1.Progress := 100;

             qq  := TOraQuery.Create(nil);
             qq.Session := Ora_Session;

             with qq do {인사화일 존재여부,성명 동등여부 판단}
             begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select  empno,korname,paycl                ');
                  SQL.Add('  from  pimpmas                            ');
                  SQL.Add(' where  empno = :lempno                    ');

                  ParamByName('lempno').AsString := TextData.empno;
                  Open;

               // error시 error log 표시..
                  if (RecordCount <= 0) or
                     (FieldByName('korname').AsString <> TextData.korname) then
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'사번,성명 필드에러');
                       continue;
                  end;
                  Rpaycl := Qemp.FieldByName('paycl').AsString;   // 30.02  수정..
//                  Rpaycl := TextData.paycl;

                  if (length(TextData.examdate) <> 8) or  (check3 > 0) then
                  begin  {외국어명,검정기관,검정일 필수입력여부,시험명코드화일 존재여부}
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'검정일 필드에러');
                       continue;
                  end;
           {
                  if trim(TextData.langname) = '' then begin
                     inc(ErrorCnt);
                     ErrorWrite(i,TextData.empno,TextData.korname,'외국어명 필드에러');
                     continue;
                  end;
            //HR인프라 고도화로 BAND뺌
                  if QcodeDisp('I113',trim(TextData.examname)) = '코드에러' then  // 30.02 직책 존재여부 추가...
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'직책코드 필드에러');
                       continue;
                  end;
            }
                  if QcodeDisp('I611',trim(TextData.examname)) = '코드에러' then
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'시험명 필드에러');
                       continue;
                  end;

                  if trim(TextData.examplace) = '' then
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'검정기관 필드에러');
                       continue;
                  end;

                  {만점 >= 점수 > 0 여부}
                  if check1 > 0 then
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'점수 필드에러');
                       continue;
                  end;

                  if check2 > 0 then
                  begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'만점 필드에러');
                       continue;
                  end;
                  if (strToFloat(TextData.examscore1) <= 0) or
                     (strToFloat(TextData.examscore2) <= 0) then
                  begin
                 //   (strToFloat(TextData.examscore1) > strToFloat(TextData.fullscore)) then begin
                       inc(ErrorCnt);
                       ErrorWrite(i,TextData.empno,TextData.korname,'청취/독해점수 필드에러');
                       continue;
                  end;
                  // 유효일 := 입력된 검정일로 2년후 (1일감산)
                  TextData.examtodate := datecal1(inttostr(strtoint(copy(TextData.examdate,1,4))+2)+
                                                                    copy(TextData.examdate,5,2)+
                                                                    copy(TextData.examdate,7,2));
                  //점수계 := 청취점수+ 독해점수
                  TextData.examscore12 := inttostr(strtoint(TextData.examscore1)+
                                                   strtoint(TextData.examscore2));

                 // with Qsfore do
                 // begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select empno                                    ');
                   SQL.Add('  from pihfore                                  ');
                   SQL.Add(' where empno = :lempno                          ');
                   SQL.Add('   and examdate = :lexamdate                    ');
                   ParamByName('lempno').AsString     := TextData.empno;
                   ParamByName('lexamdate').AsString  := TextData.examdate;
                   Open;

                   if RecordCount > 0 then
                   begin
                        inc(ErrorCnt);
                        ErrorWrite(i,TextData.empno,TextData.korname,'데이타 중복 발생');
                        continue;
                   end;

                   Close;                 // 21.01  98.6.10  유효일,청취점수,독해점수항목 추가저장...
                   SQL.clear;             //                EXAMTODATE, EXAMSCORE1, EXAMSCORE2
                   SQL.Add('insert into pihfore   (empno,                         ');
                   SQL.Add('                       korname,                       ');
                   SQL.Add('                       paycl,                         ');
                   SQL.Add('                       examdate,                      ');
                   SQL.Add('                       examtodate,                    ');
                   SQL.Add('                       examname,                      ');
                   SQL.Add('                       examscore1,                    ');
                   SQL.Add('                       examscore2,                    ');
                   SQL.Add('                       examscore12,                   ');
                   SQL.Add('                       examplace,                     ');
                   SQL.Add('                       writeemp,                      ');
                   SQL.Add('                       writetime)                     ');
                   SQL.Add('              values (:l1,                            ');
                   SQL.Add('                      :l2,                            ');
                   SQL.Add('                      :l3,                            ');
                   SQL.Add('                      :l4,                            ');
                   SQL.Add('                      :l5,                            ');
                   SQL.Add('                      :l6,                            ');
                   SQL.Add('                      :l7,                            ');
                   SQL.Add('                      :l8,                            ');
                   SQL.Add('                      :l9,                            ');
                   SQL.Add('                      :l11,                           ');
                   SQL.Add('                      :l12,                           ');
                   SQL.Add('                      :l13)                           ');


                   ParambyName('l1').AsString  :=  TextData.empno;
                   ParambyName('l2').AsString  :=  TextData.korname;
                   ParambyName('l3').AsString  :=  rpaycl;
                   ParambyName('l4').AsString  :=  TextData.examdate;
                   ParambyName('l5').AsString   :=  TextData.examtodate;
                   ParambyName('l6').AsString   :=  TextData.examname;
                   ParambyName('l7').AsFloat   :=  StrToFloat(TextData.examscore1);
                   ParambyName('l8').AsFloat  :=  StrToFloat(TextData.examscore2);
                   ParambyName('l9').AsFloat  :=  StrToFloat(TextData.examscore12);
                   ParambyName('l11').AsString :=  TextData.examplace;
                   ParambyName('l12').AsString :=  p_empno;
                   ParambyName('l13').AsString :=  fn_GetDateTimeStr;

                   EXECSQL;
             //     end;   //with Qsfore End

                  {인사마스터를 수정한다..}
                   if tempno <> TextData.empno then//pimpmas에 toeic과 jpt점수 등록.
                   begin
                        HelpDsr.Caption := '기본인사화일을 수정하고 있습니다 !!.';
                        SendMessage(Panel6.Handle,WM_PAINT,0,0);
                        tempno := TextData.empno;
                        PimpmasUpdate(tempno);
                   end;
                   inc(AcessCnt);
                   AcessNum.Caption := IntToStr(AcessCnt)+' 건';
                   SendMessage(AcessNum.Handle,WM_PAINT,0,0);
             end; //with .. end
        end;  //while Eof(TextOpen) End..

        PimpmasUpdate(tempno);

        ArrStr(ErrData.errLog,'');
        ErrData.lfcr[1] := chr(13);
        ErrData.lfcr[2] := chr(10);
        System.Write(efile,ErrData);
        ArrStr(ErrData.errLog,'  총읽은건수 : '+inttostr(readCnt)+
                              '    에러건수 : '+inttostr(errorCnt)+
                              '    처리건수 : '+inttostr(AcessCnt));
        ErrData.lfcr[1] := chr(13);
        ErrData.lfcr[2] := chr(10);
        System.Write(efile,ErrData);

        System.Close(TextOpen);
        System.Close(efile);
        ga1.Progress := 0;
        HelpDsr.Caption := '작업완료 !!. (에러화일명 :'+HomeDir+'\list\pia9040g.err)';
        FileNm.SetFocus;

     finally
        qq.free;
     end;
end;   //?????????

{.......................인사마스터를 업데이트한다..............................}
procedure Tpia9041gForm.PimpmasUpdate(str : string);
var
     tj_date   : array [1..2] of string[8];
     tj_score1 : array [1..2] of real;
     tj_score2 : array [1..2] of real;
     qq        : TOraQuery;
begin
     if str = '' then
        System.Exit;

//     with QTfore do
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          Close;
          SQL.Clear;                               // 11 : TOEIC
          SQL.Add('select examdate,examscore12                    ');
          SQL.Add('  from pihfore                                 ');
          SQL.Add(' where (empno = :lempno and examname = ''11'') ');
          SQL.Add(' order by examdate desc');
          ParamByname('lempno').AsString := str;
          Open;
          tj_date[1]   := FieldByName('examdate').AsString;
          tj_score1[1] := FieldByName('examscore12').AsFloat;
          tj_score2[1] := 0;

          Close;
          SQL.Clear;                              // 21 : JPT
          SQL.Add('select examdate,examscore12                    ');
          SQL.Add('  from pihfore                                 ');
          SQL.Add(' where (empno = :lempno and examname = ''21'') ');
          SQL.Add(' order by examdate desc                        ');
          ParamByname('lempno').AsString := str;
          Open;
          tj_date[2]   := FieldByName('examdate').AsString;
          tj_score1[2] := FieldByName('examscore12').AsFloat;
          tj_score2[2] := 0;

          Close;                          //PIMPMAS에 마지막본 토익과 JPT등록.
          SQL.Clear;
          SQL.Add('update pimpmas set                     ');
          SQL.Add('       toeicdate  = :t1,               ');
          SQL.Add('       toeicscore = :t2,               ');
          SQL.Add('       toeicfull  = :t3,               ');
          SQL.Add('       jptdate    = :j1,               ');
          SQL.Add('       jptscore   = :j2,               ');
          SQL.Add('       jptfull    = :j3                ');
          SQL.Add(' where empno = :lempno                 ');
          ParamByname('t1').AsString     := tj_date[1];
          ParamByname('t2').AsFloat      := tj_score1[1];
          ParamByname('t3').AsFloat      := tj_score2[1];
          ParamByname('j1').AsString     := tj_date[2];
          ParamByname('j2').AsFloat      := tj_score1[2];
          ParamByname('j3').AsFloat      := tj_score2[2];
          ParamByname('lempno').AsString := str;
          EXECSQL;
     end;
end;

procedure Tpia9041gForm.BcodeClick(Sender: TObject);
var
     str : string;
     qq  : TOraQuery;
begin
     if FreeCheck = False then
     begin
          Bcode.Caption := '해당코드 해제';
     end
     else
     begin
          Bcode.Caption := '해당코드 다운';
          FreeCheck := False;
          system.exit;
     end;
     FreeCheck := DiskSpaceCheck;
     if FreeCheck = False then system.exit;
     HelpDsr.Caption := '해당코드를 다운받고 있습니다 !!.(속도증가를 위함)';
     SendMessage(Panel6.handle,WM_PAINT,0,0);

     codeToText(HomeDir+'\pia9040g.cod','',0);

     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          close; sql.clear;
          SQL.Add('select codeid,codeno,codename      ');
          SQL.Add('  from pyccode                     ');
          SQL.Add(' where (codeid = ''I611'')         ');
          SQL.Add(' order by codeid,codeno            ');
          Open;
          while not eof do
          begin
               str := '';
               str := FieldByName('codeid').AsString+','+
                      FieldByName('codeno').AsString+','+
                      FieldByName('codename').AsString;
               codeToText('',str,1);
               next;
          end;
     end;
     codeToText('','',2); HelpDsr.Caption := '';
end;

procedure Tpia9041gForm.BerrClick(Sender: TObject);
begin
     if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pia9040g.err'),SW_SHOW) < 32 then
        WinExec(PChar('edit '+HomeDir+'\list\pia9040g.err'),SW_SHOW);
end;

end.
