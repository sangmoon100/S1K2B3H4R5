{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE1020G(계획인원 일괄등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 정재헌
Version         : 1.00
Date            : 1996.6.8
Update contents
  1.00     1996.6.8    정재헌  신규프로그램 개발   처리명세서
  2.00     2005.03.02. 유효성   '999999'로 입력되게 수정
--------------------------------------------------------------------------------
}

unit E1020g;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, IniFiles, DB,
  DBTables, QuickRpt, Winsock, pass, datelib;

type
  TFpie1020g = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    MaskEdit1: TMaskEdit;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    Panel5: TPanel;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    Gauge1: TGauge;
    OpenDialog1: TOpenDialog;
    Database1: TDatabase;
    Query1: TQuery;
    Query2: TQuery;
    Query2TOPOYM: TStringField;
    Query2ORGNUM: TStringField;
    Query2DEPTCODE: TStringField;
    Query2TPGUBUN: TStringField;
    Query2FIELDCODE: TStringField;
    Query2BONCODE: TStringField;
    Query2TDIRECT: TFloatField;
    Query2TPOS1: TFloatField;
    Query2TPOS2: TFloatField;
    Query2TPOS3: TFloatField;
    Query2TPOS4: TFloatField;
    Query2TPOS5: TFloatField;
    Query2TPOS6: TFloatField;
    Query2TPOS7: TFloatField;
    Query2TPOS8: TFloatField;
    Query2TPOSSUM: TFloatField;
    Query2TSPE1: TFloatField;
    Query2TSPE21: TFloatField;
    Query2TSPE22: TFloatField;
    Query2TSPE23: TFloatField;
    Query2TSPE24: TFloatField;
    Query2TSPE25: TFloatField;
    Query2TSPE26: TFloatField;
    Query2TSPE27: TFloatField;
    Query2TSPE2: TFloatField;
    Query2TSPE3: TFloatField;
    Query2TSPE4: TFloatField;
    Query2TSPE5: TFloatField;
    Query2TSPESUM: TFloatField;
    Query2TEMPTOT: TFloatField;
    Query2TEXTR1: TFloatField;
    Query2TEXTR2: TFloatField;
    Query2TEXTR3: TFloatField;
    Query2TEXTR4: TFloatField;
    Query2TEXTR5: TFloatField;
    Query2TEXTRSUM: TFloatField;
    Query2TTEMPSUM: TFloatField;
    Query2TIMSITOT: TFloatField;
    Query2TTOTAL: TFloatField;
    Query2TCRETIME: TStringField;
    Query2PDIR11: TFloatField;
    Query2PDIR21: TFloatField;
    Query2PDIR31: TFloatField;
    Query2PDIR41: TFloatField;
    Query2PDIR51: TFloatField;
    Query2PDIR61: TFloatField;
    Query2PDIR6A: TFloatField;
    Query2PDIR71: TFloatField;
    Query2PDIR72: TFloatField;
    Query2PDIR7A: TFloatField;
    Query2PDIRRTC: TFloatField;
    Query2PDIRSUM: TFloatField;
    Query2PPOS1: TFloatField;
    Query2PPOS2: TFloatField;
    Query2PPOS3: TFloatField;
    Query2PPOS4: TFloatField;
    Query2PPOS5: TFloatField;
    Query2PPOS6: TFloatField;
    Query2PPOS7: TFloatField;
    Query2PPOS8: TFloatField;
    Query2PPOSSUM: TFloatField;
    Query2PSPE1: TFloatField;
    Query2PSPE21: TFloatField;
    Query2PSPE22: TFloatField;
    Query2PSPE23: TFloatField;
    Query2PSPE24: TFloatField;
    Query2PSPE25: TFloatField;
    Query2PSPE26: TFloatField;
    Query2PSPE27: TFloatField;
    Query2PSPE2: TFloatField;
    Query2PSPE3: TFloatField;
    Query2PSPE4: TFloatField;
    Query2PSPE5: TFloatField;
    Query2PSPESUM: TFloatField;
    Query2PEMPTOT: TFloatField;
    Query2PEXTR1: TFloatField;
    Query2PEXTR2: TFloatField;
    Query2PEXTR3: TFloatField;
    Query2PEXTR4: TFloatField;
    Query2PEXTR5: TFloatField;
    Query2PEXTRSUM: TFloatField;
    Query2PTEMPSUM: TFloatField;
    Query2PIMSITOT: TFloatField;
    Query2PTOTAL: TFloatField;
    Query2PCRETIME: TFloatField;
    Query2TPBIGO: TFloatField;
    Query2WRITETIME: TStringField;
    Query2WRITEEMP: TStringField;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Rcount: TLabel;
    Ecount: TLabel;
    Scount: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Label8: TLabel;
    Query3: TQuery;
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LastCount;
    procedure ErrorWrite(s0,s1,s2,s3,Estr : string);
  public
    { Public declarations }
    pempno   : String; {user identification}
    pkorname : String; {user name}
    password : String; {password}
    start    : Integer;{initialized value}
    AReport  : TQuickRep;
    pSysdate : String;
  end;

type
 errFile = record
           errlog : array[1..100] of char;
           lfcr   : array[1..2]  of char;
end;

var
  Fpie1020g: TFpie1020g;
  efile       : file of errFile;
  ErrData     : errFile;
  ErrorHelp : array[0..255] of char;
  Ai, Ci, errcnt : integer;
  F: TextFile;
  S: String[200];
  HomeDir : string;
implementation

uses
  pie10201;

{$R *.DFM}

procedure TFpie1020g.BB_CloseClick(Sender: TObject);
var
  BitBtn: Integer;
begin
  BitBtn := Application.MessageBox('종료 하시겠습니까?', 'Message Box',
    mb_OKCancel + mb_DefButton1);
 if Bitbtn = IDOK then
   close;
 if BitBtn = IDCANCEL then

end;

procedure TFpie1020g.ErrorWrite(s0,s1,s2,s3,Estr : string);
begin
  ArrStr(ErrData.errLog,'발생라인('+s0+')'+'구분('+s1+')'+'부서코드('+s2+')'+
                        '계획인원('+s3+')'+Estr);

  ErrData.lfcr[1] := chr(13);
  ErrData.lfcr[2] := chr(10);
  System.Write(efile,ErrData);
end;

{PC 화일을 읽어 라인 수를 가진다....................................}
procedure TFpie1020g.LastCount;
begin
    AssignFile(F,MaskEdit1.Text);
    Reset(F);
    Ai := 0;
    while not EOF(F) do
          begin
               Readln(F, S);
               inc(Ai);
          end;
    CloseFile(F);
end;

procedure TFpie1020g.BB_RunClick(Sender: TObject);
var
  BitBtn,Deptcnt,ccnt,Si,Pihcnt,guval: Integer;
  CurOrg,Tempyymm,Lastyymm,gubun,deptcode,manplan,Dfieldcode,Dboncode,Dsectcode: String;
  Tlevel : string;     {인원관리단위}
begin

 with Query3 do
 begin
     Close;
     Sql.Clear;
     Sql.Add( ' SELECT TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') sys_date FROM DUAL ');;
     Open;
     pSysDate := FieldByName('sys_date').AsString;
     Close;
 end;

 P_help.Caption := '';
 if MaskEdit1.Text = '' then begin {화일명이 공란일 때.........................}
    P_help.Caption := '화일명을 반드시 입력하셔야 합니다.';
    MaskEdit1.SetFocus;
    end
    else
 if not FileExists(MaskEdit1.Text) then begin{화일을 찾을 수 없을 때...........}
       MaskEdit1.SetFocus;
       P_help.Caption := '해당화일이 없습니다.';
       end
    else
 begin
  BitBtn := Application.MessageBox('실행하시겠습니까?', 'Message Box',
    mb_OKCancel + mb_DefButton1);
 if Bitbtn = IDOK then begin
    {............................실행 시작 부분입니다..........................}
    {1.현조직차수와 최종작업년월을 읽어온다....................................}
     begin
          Query1.Close;
          Query1.SQL.Clear;
          Query1.SQL.ADD(' SELECT  VALUE1 ');
          Query1.SQL.ADD('   FROM  PIMVARI ');
          Query1.SQL.ADD('  WHERE ((GUBUN =''00'') AND ');
          Query1.SQL.ADD('         (SGUBUN =''0001''))');
          Query1.Open;
     end;
     CurOrg   := Query1.Fields[0].AsString;

     begin
          Query1.Close;
          Query1.SQL.Clear;
          Query1.SQL.ADD(' SELECT  VALUE1, VALUE2 ');
          Query1.SQL.ADD('   FROM  PIMVARI ');
          Query1.SQL.ADD('  WHERE ((GUBUN =''50'') AND ');
          Query1.SQL.ADD('         (SGUBUN =''0001''))');
          Query1.Open;
     end;
     Tlevel   := Copy(Query1.Fields[0].AsString,1,1);    {인원관리단위:1자리만사용}
     Tempyymm := Query1.Fields[1].AsString;              {최종작업년월}
     Lastyymm := Copy(Tempyymm,1,6);
     Query1.Close;
    {1.의 끝...................................................................}
    {2.텍스트 화일을 읽어 확인한다.............................................}
     begin
         P_help.Caption := 'PC 화일을 읽는 중입니다.';
         Application.Processmessages;
         LastCount;
         AssignFile(F,MaskEdit1.Text);
         Reset(F);
         System.AssignFile(efile,HomeDir+'\list\pie1020g.err');
         System.ReWrite(efile);
         Ci := 0;
         errcnt := 0;
              while Ci < Ai do
              begin
              gauge1.Progress := Ci * (100 div Ai);
              Readln(F, S);             { Read the first line out of the file }
              CCnt := 0;
              Si := 1;
              guval := 0;
              while True do
                   begin
                        CCnt := System.Pos(',', S);
                        if CCnt = 0 then  begin
                          Break;
                          end;
                        case Si of
                          1:
                            gubun := Copy(S, 1, CCnt-1);
                          2:
                            deptcode := Copy(S, 1, CCnt-1);
                        end; {...case의 end...}
                        S := copy(S, CCnt+1, 30);
                        inc(Si);
                   end;
                   manplan := S;
                   if manplan = '' then begin
                      manplan := '0';
                      end;

                   {3.부서코드 존재여부를 확인한다.............................}
                   begin
                        Query1.Close;
                        Query1.SQL.Clear;
                        Query1.SQL.ADD(' SELECT  FIELDCODE,BONCODE,SECTCODE ');
                        Query1.SQL.ADD('   FROM  PYCDEPT ');
                        Query1.SQL.ADD('  WHERE ((ORGNUM   =  '''+CurOrg+''')    ');
                        Query1.SQL.ADD('    AND  (DEPTCODE =  '''+deptcode+''')  ');
                        Query1.SQL.ADD('    AND  (EXISTON  =  ''1'')             ');
                        Query1.SQL.ADD('    AND  (CHANMODE != ''3'')             ');
                        Query1.SQL.ADD('    AND  (NVL(SUBSTR(DEPTLEVEL,1,1),'' '') <= '''+Tlevel+''') )');
                        Query1.Open;
                        Deptcnt := Query1.RecordCount;
                   end;
                   Dfieldcode := Query1.Fields[0].AsString;
                   Dboncode   := Query1.Fields[1].AsString;
                   Dsectcode  := Query1.Fields[2].AsString;
                   {3.의 끝....................................................}
                   {3.5 각 데이타 값의 조건 체크를 위해 gubun에 특정 값을 준다.}
                   begin
                        if gubun = '10' then begin
                           guval := 10;
                           end;
                        if gubun = '30' then begin
                           guval := 30;
                           end;
                        if gubun = '20' then begin
                           guval := 20;
                           end;
                   end;
                   {3.5 의 끝..................................................}
                   {4.각 데이타의 값에 대한 타당성을 검사한다..................}
                   begin
                        if Deptcnt > 0 then begin
                           if guval <> 0 then begin
                              if ((StrToInt(manplan) > 0) and (Length(manplan)< 5)) then begin
{100........위 조건을 만족할 경우 여기서 저장한다..............................}
                              {5.작업년월,조직차수,부서코드를 KEY로 하여
                                   계획인원/현원인원화일에 존재여부를 확인한다.}

                   begin
                        Query1.Close;
                        Query1.SQL.Clear;
                        Query1.SQL.ADD(' SELECT  TOPOYM ');
                        Query1.SQL.ADD('   FROM  PIHTOPO ');
                        Query1.SQL.ADD('  WHERE ((TOPOYM =''999999'') AND ');
                        Query1.SQL.ADD('         (ORGNUM ='''+curorg+''') AND ');
                        Query1.SQL.ADD('         (DEPTCODE ='''+deptcode+''') AND ');
                        Query1.SQL.ADD('         (TPGUBUN ='''+gubun+'''))');
                        Query1.Open;
                        Pihcnt := Query1.RecordCount;
                   end;
                   {5.의 끝....................................................}
                   if Pihcnt > 0 then begin
                      {6.............해당 자료를 수정한다......................}
                        Query2.Close;
                        Query2.SQL.Clear;
                        Query2.SQL.ADD(' UPDATE PIHTOPO ');
                        Query2.SQL.ADD('    SET TPOSSUM =:lttotal, TEMPTOT =:lttotal,');
                        Query2.SQL.ADD('        TTOTAL =:lttotal,');
                        Query2.SQL.ADD('        WRITETIME =:lwritetime, WRITEEMP =:lwriteemp ');
                        Query2.SQL.ADD('  WHERE ((TOPOYM =''999999'') AND ');
                        Query2.SQL.ADD('         (ORGNUM =:lorgnum) AND ');
                        Query2.SQL.ADD('         (DEPTCODE ='''+deptcode+''') AND ');
                        Query2.SQL.ADD('         (TPGUBUN ='''+gubun+'''))');
                        Query2.ParamByName('lttotal').AsInteger  := StrToInt(manplan);
                        Query2.ParamByName('lwritetime').AsString:= Copy(pSysdate,1,15);
                        Query2.ParamByName('lwriteemp').AsString := pempno;
                        Query2.ParamByName('lorgnum').AsString   := Copy(CurOrg,1,3);

                        Query2.EXECSQL;
                        Query2.CLOSE;
                      {6.의 끝.................................................}
                      end
                   else begin
                      {7.............해당 자료를 생성한다......................}
                        Query1.Close;
                        Query1.SQL.Clear;
                        Query1.SQL.ADD(' INSERT  INTO  PIHTOPO ');
                        Query1.SQL.ADD('(TOPOYM,ORGNUM,DEPTCODE,TPGUBUN,FIELDCODE,BONCODE,SECTCODE, ');
                        Query1.SQL.ADD(' TDIRECT,TPOS1,TPOS2,TPOS3,TPOS4,TPOS5, ');
                        Query1.SQL.ADD(' TPOS6,TPOS7,TPOS8,TPOSSUM,TSPE1,TSPE21, ');
                        Query1.SQL.ADD(' TSPE22,TSPE23,TSPE24,TSPE25,TSPE26,TSPE27, ');
                        Query1.SQL.ADD(' TSPE2,TSPE3,TSPE4,TSPE5,TSPESUM,TEMPTOT, ');
                        Query1.SQL.ADD(' TEXTR1,TEXTR2,TEXTR3,TEXTR4,TEXTR5, ');
                        Query1.SQL.ADD(' TEXTRSUM,TTEMPSUM,TIMSITOT,TTOTAL,TCRETIME, ');
                        Query1.SQL.ADD(' PDIR11,PDIR21,PDIR31,PDIR41,PDIR51,PDIR61,PDIR6A, ');
                        Query1.SQL.ADD(' PDIR71,PDIR72,PDIR7A,PDIRETC,PDIRSUM, ');
                        Query1.SQL.ADD(' PPOS1,PPOS2,PPOS3,PPOS4,PPOS5, ');
                        Query1.SQL.ADD(' PPOS6,PPOS7,PPOS8,PPOSSUM, ');
                        Query1.SQL.ADD(' PSPE1,PSPE21,PSPE22,PSPE23,PSPE24,PSPE25, ');
                        Query1.SQL.ADD(' PSPE26,PSPE27,PSPE2,PSPE3,PSPE4,PSPE5, ');
                        Query1.SQL.ADD(' PSPESUM,PEMPTOT, ');
                        Query1.SQL.ADD(' PEXTR1,PEXTR2,PEXTR3,PEXTR4,PEXTR5, ');
                        Query1.SQL.ADD(' PEXTRSUM,PTEMPSUM,PIMSITOT,PTOTAL,PCRETIME, ');
                        Query1.SQL.ADD(' TPBIGO,WRITETIME,WRITEEMP) ');
                        Query1.SQL.ADD(' VALUES(''999999'',:lorgnum,:ldeptcode,:ltpgubun, ');
                        Query1.SQL.ADD('        :lfieldcode,:lboncode,:Lsectcode, ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''',:lttotal, ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''',:lttotal, ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        :lttotal,:ltcretime, ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
                        Query1.SQL.ADD('        NULL,NULL, ');
                        Query1.SQL.ADD('        :lwritetime,:lwriteemp)');
                        Query1.ParamByName('lorgnum').AsString    := Copy(Curorg,1,3);
                        Query1.ParamByName('ldeptcode').AsString  := Copy(deptcode,1,5);
                        Query1.ParamByName('ltpgubun').AsString   := Copy(gubun,1,2);
                        Query1.ParamByName('lfieldcode').AsString := Copy(Dfieldcode,1,2);
                        Query1.ParamByName('lboncode').AsString   := Copy(Dboncode,1,6);
                        Query1.ParamByName('lsectcode').AsString := Copy(Dsectcode,1,2);
                        Query1.ParamByName('lttotal').AsInteger   := StrToInt(manplan);
                        Query1.ParamByName('ltcretime').AsString  := Copy(pSysdate,1,15);
                        Query1.ParamByName('lwritetime').AsString := Copy(pSysdate,1,15);
                        Query1.ParamByName('lwriteemp').AsString  := pempno;
                        Query1.EXECSQL;
                        Query1.Close;
                      {7.의 끝.................................................}
                      end;
{100..의 끝....................................................................}
                                 end
                              else begin
                                 errcnt := errcnt+1;

                                 ErrorWrite(IntToStr(Ci+1),gubun,deptcode,manplan,'계획인원 에러');
                                 end;
                              end
                           else begin
                              errcnt := errcnt+1;
                              ErrorWrite(IntToStr(Ci+1),gubun,deptcode,manplan,'구분코드 에러');
                              end;
                           end
                        else begin
                           if guval = 0 then  begin
                           errcnt := errcnt+1;
                           ErrorWrite(IntToStr(Ci+1),gubun,deptcode,manplan,'구분 및 부서코드 에러');
                           end
                           else begin
                           errcnt := errcnt+1;
                           ErrorWrite(IntToStr(Ci+1),gubun,deptcode,manplan,'부서코드 에러');
                           end;
                           end;
                   end;
                   gubun    := '';
                   deptcode := '';
                   manplan  := '0';
                   {4.의 끝....................................................}
                   inc(Ci);{읽은 데이타 건수를 증가시킨다......................}
                   Rcount.Caption := IntToStr(Ci)+' 건';
                   Ecount.Caption := IntToStr(errcnt)+' 건';
                   Scount.Caption := IntToStr(Ci-errcnt)+' 건';
         end;
         Gauge1.progress := 100;
    {2.의 끝...................................................................}
    end;
    CloseFile(F);
    System.Close(efile);
    P_Help.Caption := '작업완료...';
                  {.............작업 결과를 보여준다...........}
//    Rcount.Caption := '';     2001.08.16 shm
//    Ecount.Caption := '';
//    Scount.Caption := '';
    //TextPrint;
    if  errcnt = 0 then        //2001.08.06 shm 추가
    begin
        Gauge1.progress := 0;
        system.exit;
    end else
        Fpie10201.QuickReport1.Preview;

    {............................실행 끝 부분입니다............................}
 end

 else
 if BitBtn = IDCANCEL then begin
    BB_run.setfocus;
 end;

 end;
 Query1.Close;
 Query2.Close;
 Gauge1.progress := 0;
end;

procedure TFpie1020g.FormActivate(Sender: TObject);
begin
  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);

  DataBase1.Params[0]  := 'SERVER NAME=' + passEmp(CmdLine, 13);
  DataBase1.Params[1]  := 'USER NAME=' + passEmp(CmdLine, 5);
  DataBase1.Params[16] := 'PASSWORD='  + passEmp(CmdLine, 6);
  HomeDir  := HomeDirOpen;
  start := 0;
  MaskEdit1.SetFocus;
  P_help.Caption := '▼ 를 누르시면 텍스트화일을 찾을 수 있습니다.';
end;

procedure TFpie1020g.FormPaint(Sender: TObject);
var
rStr:string;
begin
 with Query3 do
 begin
     Close;
     Sql.Clear;
     Sql.Add( ' SELECT TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') sys_date FROM DUAL ');;
     Open;
     rStr := FieldByName('sys_date').AsString;
     Close;
 end;

  L_CurDate.Caption := Copy(rStr, 1, 4)+'/'+
                       Copy(rStr, 5, 2)+'/'+
                       Copy(rStr, 7, 2);

     if start = 0 then
  begin
//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//      System.Halt(0);
    start := 1;
    L_UserName.Caption := pkorname+'('+pempno+')';
  end;
end;

procedure TFpie1020g.SpeedButton1Click(Sender: TObject);
begin
     OpenDialog1.FileName := '*.*';
     if OpenDialog1.Execute then
        begin
             MaskEdit1.Text := OpenDialog1.FileName;
        end;
     P_help.Caption := '';
     BB_run.SetFocus;
end;

end.

