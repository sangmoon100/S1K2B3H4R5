{-------------------------------------------------------------------------------
  PROGRAM-NAME   : psc3080g(월별 상환대상자 추출 및 계산)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 복리후생/우리사주
  Programmer     : 김영대
  Version        : 1.06
  Date           : 1997.10.31
  Update Contents
   1.00    97.10.31       김영대     신규프로그램개발       상세처리명세서
   1.05    98.06.25       김한경     프로그램 수정(전)      중도완전상환자 급여공제 안함
   1.06    98.07.02       김한경     프로그램 수정(콜)      원금상환시 floor→trunc
   1.13  2011.05.19       이희용     프로그램 수정          우리사주 원금상환 적용
   1.14  2012.01.16       이희용     프로그램 수정          우리사주 5차 농협대출 원금상환 반영
   1.15  2015.01.02       이희용     프로그램 수정          원금상환변경 : SR-1410-0971
   1.16  2016.01.19       이희용     프로그램 수정          윤년계산(이자) : 주택대출, 사우회등 회사내의 대출은 노사협의으로 365일로 이자를 계산하고,
                                                                             우리사주는 은행과 관련되어 윤년일 경우 366일로 계산한다.

-------------------------------------------------------------------------------}

unit psc30801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Gauges, Mask, DB, DBTables, numedit, Spin, Func,
  kylib1, Pass, DateLib, FormMon1, UserHelp, ComCtrls, OnCheckBox, OnScheme,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, pebtnedit,
  PeJeonBtnDateEdit, OnEditNumCtl;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Phelpmsg: TPanel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    BB_run: TBitBtn;
    BB_exit: TBitBtn;
    BB_help: TBitBtn;
    Database1: TDatabase;
    SB_exdate: TSpeedButton;
    L_exdate: TLabel;
    Query_Update: TQuery;
    Query_Gen: TQuery;
    SF_Main: TOnSchemeForm;
    Panel5: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel7: TPanel;
    Label9: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Bevel2: TBevel;
    Label13: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    NE_exdedamt: TNumberEdit;
    NE_inwon: TNumberEdit;
    NE_record: TNumberEdit;
    ProgressBar1: TProgressBar;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel3: TPanel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Panel9: TPanel;
    E_exdate: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure BB_runClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SB_exdateClick(Sender: TObject);
    procedure BB_helpClick(Sender: TObject);
  private
    { Private declarations }
  public
    Pempno, Pkorname, PassWord : String;
    GSsysdate: String;
    { Public declarations }
    function indc_date(yyyymmdd: String; disc: Integer): String;
    function indc_Month(yyyymm: string; disc: Integer): string;
    function Last_day(yyyymm: String): String;
  end;

var
  MainForm: TMainForm;
  Running: Boolean;

implementation
{$R *.DFM}

{-------------------------------- MAIN ----------------------------------------}
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('작업을 종료하시겠습니까?',
                            '작업안내', mb_YesNo) = IDYES
  then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Running := False;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  i : Integer;
begin
  if Running then
    System.Exit;
  Running := True;
  PhelpMsg.Caption := '  초기자료를 읽고 있습니다.';
  Application.ProcessMessages;

  Pempno   := PassEmp(CmdLine, 1);
  Pkorname := PassEmp(CmdLine, 2);
  Password := PassEmp(CmdLine, 3);
  L_UserName.Caption := Pkorname + '(' +pempno+ ')';
  Application.ProcessMessages;

  for i := 0 to Database1.Params.Count-1 do
  begin
    if System.Pos('SERVER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'SERVER NAME=' + PassEmp(cmdline,13);
    if Pos('USER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if Pos('PASSWORD',Database1.Params[i]) > 0 then
     Database1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
  end;
  Database1.Connected  := True;

  edit1.text :=   PassEmp(CmdLine,13);
  If (Copy(pempno, 1,1) = 'D') THEN edit1.Visible := True;

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(' SELECT (TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')) D ');
  Query_Gen.Sql.Add(' FROM DUAL ');
  Query_Gen.Open;
  GSsysdate := Query_Gen.FieldByName('D').AsString;

  Query_Gen.Close;
  Application.ProcessMessages;

  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(' SELECT (MAX(EXDATE)) MAX_EXDATE ');
  Query_Gen.Sql.Add(' FROM PSEMHIS ');
  Query_Gen.Open;
  E_exdate.Text    := Query_Gen.FieldByName('MAX_EXDATE').AsString;  // 상환년월
  L_exdate.Caption := Query_Gen.FieldByName('MAX_EXDATE').AsString;  // 상환년월(저장용)
  Query_Gen.Close;

  L_Curdate.Caption := DateFormatMask(Copy(GSsysdate, 1, 8), DateSeparator, 1);
  Phelpmsg.Caption := '';
end;

procedure TMainForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

{------------------------------ User Function ---------------------------------}
function TMainForm.indc_date(yyyymmdd: String; disc: Integer): String;
var
  yyyy,mm,dd: Integer;
  MyDate: TDateTime;
  Convert_OK: Boolean;
begin
  yyyy := StrToIntDef(Copy(yyyymmdd,1,4),-1);
  mm   := StrToIntDef(Copy(yyyymmdd,5,2),-1);
  dd   := StrToIntDef(Copy(yyyymmdd,7,2),-1);
  if (yyyy <= 0) or (mm <= 0) or (dd <= 0) then
  begin
    indc_date := '';
    System.exit;
  end;

  if disc = 0 then
  begin
    try
      Convert_OK := True;
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
    begin
      indc_date := FormatDateTime('yyyymmdd', MyDate);
    end
    else
    begin
      indc_date := '';
    end;
  end
  else
  begin
    Convert_OK := True;
    try
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
    begin
      indc_date := FormatDateTime('yyyymmdd', MyDate+disc);
    end
    else
    begin
      indc_date := '';
    end;
  end;
end;

function TMainForm.indc_Month(yyyymm: string; disc: Integer): string;
var
  yyyy, mm: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),-1);
  mm   := StrToIntDef(Copy(yyyymm,5,2),-1);
  if (yyyy <= 0) or (mm <= 0) then
  begin
    indc_Month := '';
    System.Exit;
  end;

  mm := mm + disc;
  if mm > 12 then
  begin
    Inc(yyyy);
    mm := mm - 12;
  end
  else if mm < 1 then
  begin
    Dec(yyyy);
    mm := mm + 12;
  end;
  indc_Month := format('%.4d%.2d', [yyyy,mm]);
end;

function TMainForm.Last_day(yyyymm: String): String;
var
  MyDate: TDateTime;
  Convert_OK: Boolean;
  yyyy, mm, dd: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),0);
  mm   := StrToIntDef(Copy(yyyymm,5,2),0);
  if (yyyy <= 0) or (mm <= 0) then
  begin
    Last_day := '';
    System.exit;
  end;

  Convert_OK := True;
  dd := 28;
  while Convert_OK do
  begin
    try
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
      Inc(dd)
    else
      Dec(dd);
  end;
  Last_day := format('%.4d%.2d%.2d', [yyyy,mm,dd]);
end;

{------------------------------- Button Click ---------------------------------}
procedure TMainForm.BB_runClick(Sender: TObject);
var
  YunCnt : integer;
begin
  ProgressBar1.Position := 0;
  Phelpmsg.Caption := '';
  Application.ProcessMessages;

  YunCnt := YunYearDay(Copy(E_exdate.Text,1,4));

  if L_exdate.Caption > E_exdate.Text then
  begin
    Application.MessageBox('월별상환이력의 상환월이 입력한 상환월보다 큽니다',
                           '작업취소', mb_OK);
    System.Exit;
  end;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT (COUNT(EMPNO)) CNT FROM PSLMAS ');
  Query_Gen.SQL.ADD('WHERE STIRAMT > 0 ');
  Query_Gen.Open;
  if Query_Gen.FieldByName('CNT').AsFloat = 0 then
  begin
    Query_Gen.Close;
    Application.MessageBox('상환할 원금상환자료가 존재하지 않습니다.',
                           '작업종료', mb_OK);
    System.Exit;
  end;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT (COUNT(EMPNO)) CNT ');
  Query_Gen.SQL.ADD('FROM   PSEMHIS '); // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) and ');
  Query_Gen.SQL.ADD('      (EXIAMT > 0) ');
  Query_Gen.Open;
  if Query_Gen.FieldByName('CNT').AsFloat > 0 then
  begin
    Query_Gen.Close;
    if MessageBox(handle, '해당월의 상환이력이 존재합니다.'+#13+#13+
                          '재계산 하겠습니까 ?',
                          '작업 안내', MB_YesNo or $0030) = IDNo
    then
      System.Exit;
  end;

  NE_inwon.Value    := 0;
  NE_record.Value   := 0;
  NE_exdedamt.Value := 0;
  PhelpMsg.Caption := '  월별 상환대상자를 추출 및 계산하고 있습니다.';
  Application.ProcessMessages;
  ProgressBar1.Position := 5;
  Application.ProcessMessages;

//0. 당월자료 존재여부 확인-------------------------------------------------------------------
//   해당월 자료가 존해하면 우리사주마스터 수정
//                 존재하지않으면
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS a ');  // 대부마스터
  Query_Gen.SQL.ADD('    SET (a.STISUM, a.STIRAMT, a.STIRISUM, a.WRITETIME, a.WRITEMAN) = ');
  Query_Gen.SQL.ADD('          (SELECT a.STISUM   - EXCPAMT, ');
  Query_Gen.SQL.ADD('                  a.STIRAMT  + EXCPAMT, ');
  Query_Gen.SQL.ADD('                  a.STIRISUM - EXIAMT, ');
  Query_Gen.SQL.ADD('                  '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                  '''+Pempno+''' ');
  Query_Gen.SQL.ADD('           FROM PSEMHIS '); {월별상환이력}
  Query_Gen.SQL.ADD('           WHERE ');
  Query_Gen.SQL.ADD('                 (CORPNAME  = a.CORPNAME) and ');
  Query_Gen.SQL.ADD('                 (DIVSEQNUM = a.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('                 (EMPNO     = a.EMPNO) and ');
  Query_Gen.SQL.ADD('                 (STCLASS   = a.STCLASS) and ');
  Query_Gen.SQL.ADD('                 (STLORG    = a.STLORG) and ');
  Query_Gen.SQL.ADD('                 (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('                 (EXMDATE IS NULL) and ');
  Query_Gen.SQL.ADD('                 (EXYN = ''Y'')) ');
  Query_Gen.SQL.ADD(' WHERE (a.EMPNO||a.STCLASS||a.STLORG||TO_CHAR(a.DIVSEQNUM))||a.corpname IN ');
  Query_Gen.SQL.ADD('          (SELECT EMPNO||STCLASS||STLORG||TO_CHAR(DIVSEQNUM)||CORPNAME ');
  Query_Gen.SQL.ADD('           FROM PSEMHIS ');
  Query_Gen.SQL.ADD('           WHERE ');
  Query_Gen.SQL.ADD('                 (CORPNAME  = a.CORPNAME) and ');
  Query_Gen.SQL.ADD('                 (DIVSEQNUM = a.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('                 (EMPNO     = a.EMPNO) and ');
  Query_Gen.SQL.ADD('                 (STCLASS   = a.STCLASS) and ');
  Query_Gen.SQL.ADD('                 (STLORG    = a.STLORG) and ');
  Query_Gen.SQL.ADD('                 (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('                 (EXMDATE IS NULL) and ');
  Query_Gen.SQL.ADD('                 (EXYN = ''Y'')) ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 10;
  Application.ProcessMessages;

  PhelpMsg.Caption := ' 당월자료 삭제중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('DELETE FROM PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) ');
  Query_Gen.ExecSQL;

// 1. 당월 기초자료 생성 -------------------------------------------------------------------
  ProgressBar1.Position := 13;
  Application.ProcessMessages;
  PhelpMsg.Caption := '  월별 상환대상자(기본사항)를 추출하고 있습니다.';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD(' INSERT INTO PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('  (CORPNAME, EXDATE, DIVSEQNUM, STCLASS, EMPNO, KORNAME, STLORG, ');
  Query_Gen.SQL.ADD('   STLDATE, STBIAMT, STLAMT, WRITETIME, WRITEMAN) ');
  Query_Gen.SQL.ADD(' (SELECT CORPNAME, '''+E_exdate.Text+''', DIVSEQNUM, STCLASS, EMPNO, KORNAME, STLORG, ');
  Query_Gen.SQL.ADD('         STLDATE, STIRAMT, STLAMT, ' );
  Query_Gen.SQL.ADD('         '''+copy(GSsysdate,1,14)+''', '''+Pempno+''' ');
  Query_Gen.SQL.ADD('    FROM PSLMAS ');
  Query_Gen.SQL.ADD('   WHERE STIRAMT > 0 ');
  Query_Gen.SQL.ADD('   AND EMPNO IN (SELECT EMPNO FROM PIMPMAS WHERE PSTATE < ''80'' OR EMPNO = ''0181'')) ');
  Query_Gen.ExecSQL;

// 2. 기산일자 생성-------------------------------------------------------------------------
  ProgressBar1.Position := 17;
  Application.ProcessMessages;
  PhelpMsg.Caption := ' 개인별 기산일자를 설정하고 있습니다... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, STCFDATE, STCTDATE, STIRATE ');
  Query_Gen.SQL.ADD('FROM PSHLBAS '); // 대부기준
  Query_Gen.Open;
  while not Query_Gen.eof do
  begin
    if Query_Gen.FieldByName('STIRATE').AsFloat = 0 then  {이자울 = 0}
    begin
      //이자율 0이고, 원금상환기준_NEW에 자료가 없으면 삭제.
      PhelpMsg.Caption := ' 무이자 자료 삭제중...... ';
      Application.ProcessMessages;
      Query_update.Close;
      Query_update.SQL.Clear;
      Query_update.SQL.ADD(' DELETE FROM PSEMHIS ');  // 월별상환이력
      Query_update.SQL.ADD(' WHERE CORPNAME  = '''+Query_Gen.FieldByName('CORPNAME').AsString+''' ');
      Query_update.SQL.ADD('   AND EXDATE    = '''+E_exdate.Text+''' ');
      Query_update.Sql.Add('   AND DIVSEQNUM = '  +FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+' ');
      Query_update.Sql.Add('   AND STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''' ');
      Query_update.Sql.Add('   AND STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''' ');
      Query_update.SQL.ADD('   AND EXMDATE IS NULL) ');
      Query_update.SQL.ADD('   AND NOT EXISTS(SELECT * FROM PSNEWBAS         '); {원금상환기준_NEW}
      Query_update.SQL.ADD('                   WHERE CORPNAME  = A.CORPNAME  ');
      Query_update.SQL.ADD('                     AND DIVSEQNUM = A.DIVSEQNUM ');
      Query_update.SQL.ADD('                     AND STCLASS   = A.STCLASS   ');
      Query_update.SQL.ADD('                     AND STLORG    = A.STLORG)   ');
    end;

    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('   SET STCFDATE  = '''+Query_Gen.FieldByName('STCFDATE').AsString+''', ');
    Query_update.SQL.ADD('       STCTDATE  = '''+Query_Gen.FieldByName('STCTDATE').AsString+''', ');
    Query_update.SQL.ADD('       WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('       WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('CORPNAME').AsString+''') and ');
    Query_update.Sql.Add('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '+FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') and ');
    Query_update.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;

  // 대부일자 = 당월
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('  SET  STCFDATE  = STLDATE, ');
  Query_Gen.SQL.ADD('       WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('       WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (STCFDATE <= STLDATE) and ');
  Query_Gen.SQL.ADD('      (substr(STLDATE,1,6) = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
  Query_Gen.ExecSQL;

  // 전월 중도상환처리자이고 상환잔액 > 0 인 사람 기산일자를 변경
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('select a.empno, a.corpname, a.divseqnum, a.stclass, a.stlorg,        ');
  Query_Gen.SQL.ADD('       to_char(to_date(exmdate,''YYYYMMDD'')+1,''YYYYMMDD'') exmdate ');
  Query_Gen.SQL.ADD('from   psemhis a, pshlbas b ');
  Query_Gen.SQL.ADD('where  a.corpname   = b.corpname ');
  Query_Gen.SQL.ADD('and    a.divseqnum  = b.divseqnum ');
  Query_Gen.SQL.ADD('and    a.stclass    = b.stclass ');
  Query_Gen.SQL.ADD('and    a.stlorg     = b.stlorg  ');
  Query_Gen.SQL.ADD('and    (exmdate >= b.stcfdate and exmdate <= b.stctdate) ');
  Query_Gen.SQL.ADD('and    exdate = to_char(add_months(to_date(:exdate,''YYYYMM''),-1),''YYYYMM'') ');
  Query_Gen.SQL.ADD('order by empno, exmdate ');
  Query_Gen.ParamByName('exdate').AsString := E_exdate.Text;
  Query_Gen.Open;

  while not Query_Gen.eof do
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('   SET STCFDATE  = '''+Query_Gen.FieldByName('exmdate').AsString+''', ');
    Query_update.SQL.ADD('       WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('       WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('CORPNAME').AsString+''') and ');
    Query_update.Sql.Add('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '+FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (EMPNO     = '''+Query_Gen.FieldByName('EMPNO').AsString+''') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') and ');
    Query_update.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;

  // 당월 중도상환처리자이고 상환잔액 > 0 인 사람 기산일자를 변경
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('select a.empno, a.corpname, a.divseqnum, a.stclass, a.stlorg,        ');
  Query_Gen.SQL.ADD('       to_char(to_date(exmdate,''YYYYMMDD'')+1,''YYYYMMDD'') exmdate ');
  Query_Gen.SQL.ADD('from   psemhis a, pshlbas b ');
  Query_Gen.SQL.ADD('where  a.corpname   = b.corpname ');
  Query_Gen.SQL.ADD('and    a.divseqnum  = b.divseqnum ');
  Query_Gen.SQL.ADD('and    a.stclass    = b.stclass ');
  Query_Gen.SQL.ADD('and    a.stlorg     = b.stlorg  ');
  Query_Gen.SQL.ADD('and    (exmdate >= b.stcfdate and exmdate <= b.stctdate) ');
  Query_Gen.SQL.ADD('and    exdate = :exdate ');
  Query_Gen.SQL.ADD('order by empno, exmdate ');
  Query_Gen.ParamByName('exdate').AsString := E_exdate.Text;
  Query_Gen.Open;

  while not Query_Gen.eof do
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('   SET STCFDATE  = '''+Query_Gen.FieldByName('exmdate').AsString+''', ');
    Query_update.SQL.ADD('       WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('       WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('CORPNAME').AsString+''') and ');
    Query_update.Sql.Add('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '+FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (EMPNO     = '''+Query_Gen.FieldByName('EMPNO').AsString+''') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') and ');
    Query_update.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;

  PhelpMsg.Caption := ' 개인별 기산일자를 설정하고 있습니다... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT EMPNO ');
  Query_Gen.SQL.ADD('FROM PSEMHIS '); // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) and ');
  Query_Gen.SQL.ADD('      ((STCFDATE IS NULL) or ');
  Query_Gen.SQL.ADD('       (STCTDATE IS NULL)) ');
  Query_Gen.Open;   {
  if Query_Gen.RecordCount > 0 then
  begin
    Query_Gen.Close;
    Application.MessageBox('기준(기산일자) 입력 오류',
                           '작업취소', mb_OK);
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('DELETE FROM PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
    Query_update.SQL.ADD('      (EXMDATE IS NULL) ');  {중도상환일자 is null}
   { Query_update.ExecSQL;
    System.Exit;
  end;
    }
  PhelpMsg.Caption := ' 자료 검사중...... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT EMPNO ');
  Query_Gen.SQL.ADD('FROM PSEMHIS '); // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (substr(STCTDATE,1,6) <> '''+E_exdate.Text+''') ');

  Query_Gen.Open;
  if Query_Gen.RecordCount > 0 then
  begin
    Query_Gen.Close;
    if MessageBox(handle, '기준의 기산일자To가 당월이 아닌 자료가 존재합니다'+#13+#13+
                          '무시하고 진행하겠습니까 ?',
                          '작업 안내', MB_YesNo or $0030) = IDNo
    then
    begin
      Query_update.Close;
      Query_update.SQL.Clear;
      Query_update.SQL.ADD('DELETE FROM PSEMHIS ');  // 월별상환이력
      Query_update.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
      Query_update.SQL.ADD('      (EXMDATE IS NULL) ');  {중도상환일자 is null}
      Query_update.ExecSQL;
      PhelpMsg.Caption := '';
      Application.ProcessMessages;
      System.Exit;
    end;
  end;
  ProgressBar1.Position := 20;
  Application.ProcessMessages;

// 3. 상환이자일수 계산-------------------------------------------------------------------------
// 월별상환이력.상환이자일수(기산일from ~ 기산일to)
  PhelpMsg.Caption := ' 월별상환이력.상환이자일수(기산일from ~ 기산일to)...... ';
  Application.ProcessMessages;
  ProgressBar1.Position := 30;
  Application.ProcessMessages;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXICNT    = to_date(STCTDATE,''YYYYMMDD'') - to_date(STCFDATE,''YYYYMMDD'') + 1, ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
  Query_Gen.ExecSQL;

// 4. 특이자-------------------------------------------------------------------------
// 월별상환이력.특이여부, 특이일자
  PhelpMsg.Caption := ' 특이여부, 특이일자 갱신중...... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT a.corpname, a.DIVSEQNUM, a.STCLASS, ');
  Query_Gen.SQL.ADD('       a.EMPNO, a.STLORG, b.EXSPDATE ');
  Query_Gen.SQL.ADD('FROM PSEMHIS a , PSEXSPM b '); // 월별상환이력, 상환특이자
  Query_Gen.SQL.ADD('WHERE (a.EXDATE    = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (a.EXMDATE IS NULL) and '); // 중도제외
  Query_Gen.SQL.ADD('      (a.CORPNAME  = b.CORPNAME) and ');
  Query_Gen.SQL.ADD('      (a.EMPNO     = b.EMPNO) and ');
  Query_Gen.SQL.ADD('      (a.DIVSEQNUM = b.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('      (a.STCLASS   = b.STCLASS) and ');
  Query_Gen.SQL.ADD('      (a.STLORG    = b.STLORG) ');
  Query_Gen.Open;
  while not Query_Gen.eof do
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXSPYN    = ''Y'', ');
    Query_update.SQL.ADD('        EXSPDATE  = '''+Query_Gen.FieldByName('EXSPDATE').AsString+''', ');
    Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ' );
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('Corpname').AsString+''') and ');
    Query_update.SQL.ADD('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (EMPNO     = '''+Query_Gen.FieldByName('EMPNO').AsString+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '  +FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') and ');
    Query_update.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;
  ProgressBar1.Position := 35;
  Application.ProcessMessages;

  // 월별상환이력.특이이자일수1, 특이이자일수2
  // 특이일자 BETWEEN 기산일 from AND 기산일 to
  PhelpMsg.Caption := ' 특이일자일수1,2 갱신중...... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPCNT1  = to_date(EXSPDATE,''YYYYMMDD'') - to_date(STCFDATE,''YYYYMMDD'') + 1, ');
  Query_Gen.SQL.ADD('        EXSPCNT2  = to_date(STCTDATE,''YYYYMMDD'') - to_date(EXSPDATE,''YYYYMMDD''), ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXSPYN = ''Y'') and ');
  Query_Gen.SQL.ADD('      (EXSPDATE BETWEEN STCFDATE AND STCTDATE) and ');
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
  Query_Gen.ExecSQL;

  // 월별상환이력.특이이자일수2
  // 기산일 from > 특이일자
  PhelpMsg.Caption := ' 특이일자일수2 갱신중...... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPCNT1  = 0, ');
  Query_Gen.SQL.ADD('        EXSPCNT2  = EXICNT, ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXSPYN = ''Y'') and ');
  Query_Gen.SQL.ADD('      (STCFDATE > EXSPDATE) and '); {기산일 from > 특이일자}
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 45;
  Application.ProcessMessages;

  // 특이자중 월별상환이력.특이여부 = ''(정상)
  // 기산일 to < 특이일자
  PhelpMsg.Caption := ' 특이일자일수2 갱신중...... ';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPYN = '''' ');
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (EXSPYN = ''Y'') and ');
  Query_Gen.SQL.ADD('      (STCTDATE < EXSPDATE) and '); {기산일 from < 특이일자}
  Query_Gen.SQL.ADD('      (EXMDATE IS NULL) '); // 중도제외
  Query_Gen.ExecSQL;

  // 월별상환이력.상환이자(중도상환자가 아니고 특이자도 아닌 대상자)
  // 정상
  PhelpMsg.Caption := ' 월별상환이력.상환이자(중도상환자가 아니고 특이자도 아닌 대상자) 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, STIRATE ');
  Query_Gen.SQL.ADD('FROM PSHLBAS '); // 대부기준
  Query_Gen.Open;
  while not Query_Gen.eof do
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXIAMT    = FLOOR(STBIAMT * ('+FloatToStr(Query_Gen.FieldByName('STIRATE').AsFloat)+' / 100) * ');
    Query_update.SQL.ADD('                          (EXICNT / '+FloatToStr(YunCnt)+')), ');
//    Query_update.SQL.ADD('                          (EXICNT / 365)), ');
    Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') and ');
    Query_update.SQL.ADD('      (EXSPYN IS NULL) and ');   // 특이제외
    Query_update.SQL.ADD('      (EXMDATE IS NULL) and ');  // 중도제외
    Query_update.SQL.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('corpname').AsString+''') and ');
    Query_update.SQL.Add('      (DIVSEQNUM = '  +FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.SQL.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.SQL.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') ');  {대부기관}
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;
  ProgressBar1.Position := 50;
  Application.ProcessMessages;

  // 상환특이자
  PhelpMsg.Caption := ' 상환특이자 처리중...';
  Application.ProcessMessages;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT a.corpname, a.DIVSEQNUM, a.STCLASS, a.EMPNO, a.STLORG, b.EXSPRATE1, b.EXSPRATE2 ');
  Query_Gen.SQL.ADD('FROM PSEMHIS a , PSEXSPM b '); // 월별상환이력, 상환특이자
  Query_Gen.SQL.ADD('WHERE (a.EXDATE = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('      (a.EXMDATE IS NULL) and ');  // 중도제외
  Query_Gen.SQL.ADD('      (a.EXSPYN = ''Y'') and ');
  Query_Gen.SQL.ADD('      (a.corpname  = b.corpname) and ');
  Query_Gen.SQL.ADD('      (a.EMPNO     = b.EMPNO) and ');
  Query_Gen.SQL.ADD('      (a.DIVSEQNUM = b.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('      (a.STCLASS   = b.STCLASS) and ');
  Query_Gen.SQL.ADD('      (a.STLORG    = b.STLORG) ');
  Query_Gen.Open;
  while not Query_Gen.eof do
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXSPINT1 = FLOOR(STBIAMT * ('+FloatToStr(Query_Gen.FieldByName('EXSPRATE1').AsFloat)+' / 100) * ');
    Query_update.SQL.ADD('                        (EXSPCNT1/'+FloatToStr(YunCnt)+')), ');
    Query_update.SQL.ADD('        EXSPINT2 = FLOOR(STBIAMT * ('+FloatToStr(Query_Gen.FieldByName('EXSPRATE2').AsFloat)+' / 100) * ');
    Query_update.SQL.ADD('                        (EXSPCNT2/'+FloatToStr(YunCnt)+')) ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('corpname').AsString+''') and ');
    Query_update.SQL.ADD('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (EMPNO     = '''+Query_Gen.FieldByName('EMPNO').AsString+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '  +FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') ');  {대부기관}
    Query_update.ExecSQL;

    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXIAMT    = EXSPINT1 + EXSPINT2, '); {상환이자 = 특이이자1 + 특이이자2}
    Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.Sql.Add('      (CORPNAME  = '''+Query_Gen.FieldByName('corpname').AsString+''') and ');
    Query_update.SQL.ADD('      (EXDATE    = '''+E_exdate.Text+''') and ');
    Query_update.Sql.Add('      (EMPNO     = '''+Query_Gen.FieldByName('EMPNO').AsString+''') and ');
    Query_update.Sql.Add('      (DIVSEQNUM = '  +FloatToStr(Query_Gen.FieldByName('DIVSEQNUM').AsFloat)+') and ');
    Query_update.Sql.Add('      (STCLASS   = '''+Query_Gen.FieldByName('STCLASS').AsString+''') and ');
    Query_update.Sql.Add('      (STLORG    = '''+Query_Gen.FieldByName('STLORG').AsString+''') ');  {대부기관}
    Query_update.ExecSQL;
    Query_Gen.Next;
  end;
  ProgressBar1.Position := 60;
  Application.ProcessMessages;

// 5. 원금상환-------------------------------------------------------------------------
// 월별상환이력.원금상환구분

  PhelpMsg.Caption := ' 월별상환이력.원금상환구분 설정 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD(' UPDATE PSEMHIS  ');
  Query_Gen.SQL.ADD(' SET EXCPCS     = ''1'', ');
  Query_Gen.SQL.ADD('     WRITETIME  = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('     WRITEMAN   = '''+Pempno+'''  ');
  Query_Gen.SQL.ADD(' WHERE EXDATE   = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('   AND EXMDATE IS NULL ');

  Query_Gen.ExecSQL;
  ProgressBar1.Position := 65;
  Application.ProcessMessages;

 (*  BY HeeYong : 2012.01.17
 1   IF         정액상환    : 5차(60건)
 2     IF       대출금액이 7천만원초과 (1년 상환금액 : 대출금액 / 7 / 18) : 2건('1399','0939')
 3       IF      상환 최종월 : 잔액 <= 대출금액 / 7 / 18
 4       ELSE    상환 평  월 :
 5       END IF;
 6     ELSE     대출금액이 7천만원이하 (1년 상환금액 : 10,000,000/18) : 58건
 7       IF     상환 최종월 : 잔액 <= 555556
 8       ELSE   상환 평  월 :
 9       END IF;
10     END IF;
11   ELSE       분할상환
12     IF       상환 최종월 : 상환월(마지막) 이면 대출금 - 원금상환금(누적)
13     ELSE     상환 평  월 : 상환원금계산 (CEIL(ROUND((NVL(B.STLAMT, 0)/18....
14     END IF;
15   END IF;

 * BY HeeYong : 2015.01.06
 * 우리사주대출
   - 1차 : 남은잔액 / 48개월
   - 2차,3차 : 남은잔액 / 44개월
   - 5차 : 매년 1천만원씩 상환 833,333원(정액공제)
           단, 대출잔액 5천만원 이상자
           사번 : 1399 매년 12,571,428원 상환 (월 1,047,619원씩 공제)

  ******************************************************************************
  *************    정액상환(5차 : 7천만원 초과자료의 경우(2건)     *************
  ************* >> 상환만기 전에 중도상환(부분)하여 잔액이 7천만원 *************
  *************    이하 이면, 2Line ~ 6Line, 10Line을 제거한다.    *************
  ******************************************************************************
  *)

  // 월별상환이력.상환원금
  // 월별상환이력.상환원금
  PhelpMsg.Caption := ' 월별상환이력.상환원금 설정 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD(' DECLARE CURSOR CUR IS ');
  Query_Gen.SQL.ADD('  SELECT A.CORPNAME, A.DIVSEQNUM, A.STCLASS, A.STLORG,    ');
  Query_Gen.SQL.ADD('         A.EMPNO,A.STLAMT, A.STISUM, A.STIRAMT, A.STRAMT, ');
//  Query_Gen.SQL.ADD('  (SELECT STAIAMT FROM PSEMHIS                            '); // 11ZZM165건은 2015년1월에 중도상환하여
  Query_Gen.SQL.ADD('  (SELECT DECODE(DIVSEQNUM||STCLASS||STLORG||EMPNO,       ');   // 어쩔수없이  2014년12월 금액을 입력함.
  Query_Gen.SQL.ADD('          ''11ZZM165'', 2275490, STAIAMT) FROM PSEMHIS    ');
  Query_Gen.SQL.ADD('   WHERE CORPNAME  = A.CORPNAME                           ');
  Query_Gen.SQL.ADD('     AND DIVSEQNUM = A.DIVSEQNUM                          ');
  Query_Gen.SQL.ADD('     AND EMPNO     = A.EMPNO                              ');
  Query_Gen.SQL.ADD('     AND STCLASS   = A.STCLASS                            ');
  Query_Gen.SQL.ADD('     AND STLORG    = A.STLORG                             ');
  Query_Gen.SQL.ADD('     AND EXCPCS    = ''1''                                ');
  Query_Gen.SQL.ADD('     AND EXDATE    = ''201412'') JAN                      ');
  Query_Gen.SQL.ADD('  FROM PSLMAS A                                           ');
  Query_Gen.SQL.ADD('  WHERE A.STIRAMT > 0                                     ');
  Query_Gen.SQL.ADD('  AND EMPNO IN (SELECT EMPNO FROM PIMPMAS WHERE PSTATE < ''80''); ');
  Query_Gen.SQL.ADD(' BEGIN ');
  Query_Gen.SQL.ADD('   FOR R IN CUR LOOP  ');
  Query_Gen.SQL.ADD('     IF R.EMPNO = ''M165'' THEN ');                          //차장님!!!
  Query_Gen.SQL.ADD('       IF (R.STIRAMT    <=  (R.JAN / 20)) THEN ');           //임원분 한분 상환방법 특별 케이스로 등록 요청드립니다.
  Query_Gen.SQL.ADD('         UPDATE PSEMHIS ');
  Query_Gen.SQL.ADD('         SET EXCPAMT     = NVL(R.STLAMT - R.STISUM, 0), ');  // 우리사주대출(M165 유창완)
  Query_Gen.SQL.ADD('             STAIAMT     = 0, ');                            //   - 1차 [사주실권 회사] - 잔액 :    123,620원 / 20개월 = 6,181
  Query_Gen.SQL.ADD('             WRITETIME   = '''+Copy(GSsysdate,1,14)+''', '); //   - 1차 [사주우선 회사] - 잔액 :  2,275,490원 / 20개월 = 113,775
  Query_Gen.SQL.ADD('             WRITEMAN    = '''+Pempno + ''' ');              //   - 2차 [주주우선(예탁)]- 잔액 :  2,347,740원 / 20개월 = 117,387
  Query_Gen.SQL.ADD('         WHERE CORPNAME  = R.CORPNAME  ');                   //   - 2차 [사주우선 회사)]- 잔액 :  3,691,420원 / 20개월 = 184,571
  Query_Gen.SQL.ADD('           AND DIVSEQNUM = R.DIVSEQNUM ');                   //   - 3차 [사주우선 회사] - 잔액 : 11,478,710원 / 20개월 = 573,935
  Query_Gen.SQL.ADD('           AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('           AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('           AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('           AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('           AND EXCPCS    = ''1'';      ');
  Query_Gen.SQL.ADD('       ELSE ');
  Query_Gen.SQL.ADD('          UPDATE PSEMHIS ');                                 // 평달
  Query_Gen.SQL.ADD('          SET EXCPAMT    =  NVL(CEIL((R.JAN/20)/10)*10, 0), ');
  Query_Gen.SQL.ADD('              WRITETIME  = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('              WRITEMAN   = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('         WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('           AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('           AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('           AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('           AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('           AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('           AND EXCPCS    = ''1''; ');
  Query_Gen.SQL.ADD('       END IF; ');                                     
  Query_Gen.SQL.ADD('     ELSE ');                                           // 분할상환
  Query_Gen.SQL.ADD('       IF R.DIVSEQNUM = 1 THEN ');                             // 분할상환                                         
  Query_Gen.SQL.ADD('         IF (R.STIRAMT    <=  (R.JAN / 48)) THEN ');           // 1차 : 남은잔액 / 48개월(남은금액은 2014.12 기준) 
  Query_Gen.SQL.ADD('           UPDATE PSEMHIS ');                                  // 마지막 달 : 잔액 <= 상환금                       
  Query_Gen.SQL.ADD('           SET EXCPAMT     = NVL(R.STLAMT - R.STISUM, 0), ');
  Query_Gen.SQL.ADD('               STAIAMT     = 0, ');
  Query_Gen.SQL.ADD('               WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('               WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('           WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('             AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('             AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('             AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('             AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('             AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('             AND EXCPCS    = ''1'';      ');
  Query_Gen.SQL.ADD('         ELSE ');
  Query_Gen.SQL.ADD('            UPDATE PSEMHIS ');                                 // 평달
  Query_Gen.SQL.ADD('            SET EXCPAMT    =  NVL(CEIL((R.JAN/48)/10)*10, 0), ');
  Query_Gen.SQL.ADD('                WRITETIME  = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                WRITEMAN   = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('           WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('             AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('             AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('             AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('             AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('             AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('             AND EXCPCS    = ''1''; ');
  Query_Gen.SQL.ADD('         END IF; ');                                          // 분할상환
  Query_Gen.SQL.ADD('       ELSIF ((R.DIVSEQNUM = 2) OR (R.DIVSEQNUM = 3)) THEN'); // 2, 3차 : 남은잔액 / 44개월(남은금액은 2014.12 기준)
  Query_Gen.SQL.ADD('         IF (R.STIRAMT    <=  (R.JAN / 44)) THEN ');          // 마지막 달 : 잔액 <= 상환금
  Query_Gen.SQL.ADD('           UPDATE PSEMHIS ');
  Query_Gen.SQL.ADD('           SET EXCPAMT     = NVL(R.STLAMT - R.STISUM, 0), ');
  Query_Gen.SQL.ADD('               STAIAMT     = 0, ');
  Query_Gen.SQL.ADD('               WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('               WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('           WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('             AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('             AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('             AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('             AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('             AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('             AND EXCPCS    = ''1'';      ');
  Query_Gen.SQL.ADD('         ELSE ');
  Query_Gen.SQL.ADD('            UPDATE PSEMHIS ');                                // 평달
  Query_Gen.SQL.ADD('            SET EXCPAMT    =  NVL(CEIL((R.JAN/44)/10)*10, 0), ');
  Query_Gen.SQL.ADD('               WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('               WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('           WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('             AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('             AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('             AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('             AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('             AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('             AND EXCPCS    = ''1''; ');
  Query_Gen.SQL.ADD('         END IF; ');
  Query_Gen.SQL.ADD('       ELSIF (R.DIVSEQNUM = 5) THEN');                        // 정액상환
  Query_Gen.SQL.ADD('         IF ((R.STLAMT = 88000000) AND (R.EMPNO IN (''1399''))) THEN ');
  Query_Gen.SQL.ADD('           IF (R.STIRAMT    <= 1047619) THEN ');              // 사번 : 1399 매년 12,571,428원 상환 (월 1,047,619원씩 공제)
  Query_Gen.SQL.ADD('             UPDATE PSEMHIS ');                               // 마지막달
  Query_Gen.SQL.ADD('             SET EXCPAMT     = NVL(R.STLAMT - R.STISUM, 0), ');
  Query_Gen.SQL.ADD('                 STAIAMT     = 0, ');
  Query_Gen.SQL.ADD('                 WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                 WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('             WHERE CORPNAME  = R.CORPNAME    ');
  Query_Gen.SQL.ADD('               AND DIVSEQNUM = R.DIVSEQNUM   ');
  Query_Gen.SQL.ADD('               AND STCLASS   = R.STCLASS     ');
  Query_Gen.SQL.ADD('               AND STLORG    = R.STLORG      ');
  Query_Gen.SQL.ADD('               AND EMPNO     = R.EMPNO       ');
  Query_Gen.SQL.ADD('               AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('               AND EXCPCS    = ''1'';        ');
  Query_Gen.SQL.ADD('           ELSE ');
  Query_Gen.SQL.ADD('              UPDATE PSEMHIS ');                              // 평달
  Query_Gen.SQL.ADD('              SET EXCPAMT    = 1047620, ');
  Query_Gen.SQL.ADD('                 WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                 WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('             WHERE CORPNAME  = R.CORPNAME    ');
  Query_Gen.SQL.ADD('               AND DIVSEQNUM = R.DIVSEQNUM   ');
  Query_Gen.SQL.ADD('               AND STCLASS   = R.STCLASS     ');
  Query_Gen.SQL.ADD('               AND STLORG    = R.STLORG      ');
  Query_Gen.SQL.ADD('               AND EMPNO     = R.EMPNO       ');
  Query_Gen.SQL.ADD('               AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('               AND EXCPCS    = ''1''; ');
  Query_Gen.SQL.ADD('           END IF; ');
  Query_Gen.SQL.ADD('         ELSE ');                                             // 매년 1천만원씩 상환 833,333원(정액공제)
  Query_Gen.SQL.ADD('           IF (R.STIRAMT    <= 833333) THEN ');               // 마지막달
  Query_Gen.SQL.ADD('             UPDATE PSEMHIS ');
  Query_Gen.SQL.ADD('             SET EXCPAMT     = NVL(R.STLAMT - R.STISUM, 0), ');
  Query_Gen.SQL.ADD('                 STAIAMT     = 0, ');
  Query_Gen.SQL.ADD('                 WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                 WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('             WHERE CORPNAME  = R.CORPNAME    ');
  Query_Gen.SQL.ADD('               AND DIVSEQNUM = R.DIVSEQNUM   ');
  Query_Gen.SQL.ADD('               AND STCLASS   = R.STCLASS     ');
  Query_Gen.SQL.ADD('               AND STLORG    = R.STLORG      ');
  Query_Gen.SQL.ADD('               AND EMPNO     = R.EMPNO       ');
  Query_Gen.SQL.ADD('               AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('               AND EXCPCS    = ''1'';        ');
  Query_Gen.SQL.ADD('           ELSE ');
  Query_Gen.SQL.ADD('              UPDATE PSEMHIS ');                              // 평달
  Query_Gen.SQL.ADD('              SET EXCPAMT    = 833340, ');
  Query_Gen.SQL.ADD('                 WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('                 WRITEMAN    = '''+Pempno + ''' ');
  Query_Gen.SQL.ADD('             WHERE CORPNAME  = R.CORPNAME    ');
  Query_Gen.SQL.ADD('               AND DIVSEQNUM = R.DIVSEQNUM   ');
  Query_Gen.SQL.ADD('               AND STCLASS   = R.STCLASS     ');
  Query_Gen.SQL.ADD('               AND STLORG    = R.STLORG      ');
  Query_Gen.SQL.ADD('               AND EMPNO     = R.EMPNO       ');
  Query_Gen.SQL.ADD('               AND EXDATE    = '''+E_exdate.Text+''' ');
  Query_Gen.SQL.ADD('               AND EXCPCS    = ''1''; ');
  Query_Gen.SQL.ADD('           END IF; ');
  Query_Gen.SQL.ADD('         END IF; ');
  Query_Gen.SQL.ADD('       END IF; ');
  Query_Gen.SQL.ADD('     END IF; ');
  Query_Gen.SQL.ADD('   END LOOP; ');
  Query_Gen.SQL.ADD(' END; ');


//  Query_Gen.SQL.SaveToFile('c:\testsql.sql');

  Query_Gen.ExecSQL;
  ProgressBar1.Position := 70;
  Application.ProcessMessages;

// 6. 공제금액-------------------------------------------------------------------------
// 월별상환이력.원금공제여부, 공제금액, 확인여부, 확인일자
  PhelpMsg.Caption := ' 월별상환이력.원금공제여부, 공제금액, 확인여부, 확인일자 설정 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('SET CPDEDYN   = ''Y'', ');                       {원금공제여부}
  Query_Gen.SQL.ADD('    EXDEDAMT  = (EXIAMT+EXCPAMT), ');            {공제금액}
  Query_Gen.SQL.ADD('    EXYN      = ''Y'', ');                       {획인여부}
  Query_Gen.SQL.ADD('    EXYNDATE  = '''+Copy(GSsysdate, 1,8)+''', '); {당일일자}
  Query_Gen.SQL.ADD('    WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('    WRITEMAN  = '''+Pempno+'''  ');
  Query_Gen.SQL.ADD('WHERE EXDATE  = '''+E_exdate.Text+'''  ');
  Query_Gen.SQL.ADD('AND  (EXMDATE IS NULL) ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 75;
  Application.ProcessMessages;

// 7. 상환내역 갱신-------------------------------------------------------------------------
// 월별상환이력.원금공제여부, 공제금액, 확인여부, 확인일자
  PhelpMsg.Caption := ' 대부마스터에 상환내역 갱신 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS a ');  // 대부마스터
  Query_Gen.SQL.ADD('   SET (a.STISUM, a.STIRAMT, a.STIRISUM, a.WRITETIME, a.WRITEMAN) = ');
  Query_Gen.SQL.ADD('          (SELECT a.STISUM   + nvl(EXCPAMT,0), ');
  Query_Gen.SQL.ADD('                  a.STIRAMT  - nvl(EXCPAMT,0), ');
  Query_Gen.SQL.ADD('                  a.STIRISUM + nvl(EXIAMT,0),  ');
  Query_Gen.SQL.ADD('                  '''+Copy(GSsysdate,1,14)+''',');
  Query_Gen.SQL.ADD('                  '''+Pempno+''' ');
  Query_Gen.SQL.ADD('           FROM PSEMHIS '); {월별상환이력}
  Query_Gen.SQL.ADD('           WHERE ');
  Query_Gen.SQL.ADD('             (CORPNAME  = a.corpname)  and ');
  Query_Gen.SQL.ADD('             (DIVSEQNUM = a.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('             (EMPNO     = a.EMPNO)     and ');
  Query_Gen.SQL.ADD('             (STCLASS   = a.STCLASS)   and ');
  Query_Gen.SQL.ADD('             (STLORG    = a.STLORG)    and ');
  Query_Gen.SQL.ADD('             (EXDATE    = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('             (EXMDATE IS NULL)) '); // 중도제외
  Query_Gen.SQL.ADD(' WHERE (a.EMPNO||a.STCLASS||a.STLORG||TO_CHAR(a.DIVSEQNUM))||a.CORPNAME IN ');
  Query_Gen.SQL.ADD('          (SELECT EMPNO||STCLASS||STLORG||TO_CHAR(DIVSEQNUM)||CORPNAME ');
  Query_Gen.SQL.ADD('           FROM PSEMHIS ');
  Query_Gen.SQL.ADD('           WHERE ');
  Query_Gen.SQL.ADD('             (CORPNAME  = a.corpname)  and ');
  Query_Gen.SQL.ADD('             (DIVSEQNUM = a.DIVSEQNUM) and ');
  Query_Gen.SQL.ADD('             (EMPNO     = a.EMPNO)     and ');
  Query_Gen.SQL.ADD('             (STCLASS   = a.STCLASS)   and ');
  Query_Gen.SQL.ADD('             (STLORG    = a.STLORG)    and ');
  Query_Gen.SQL.ADD('             (EXDATE    = '''+E_exdate.Text+''') and ');
  Query_Gen.SQL.ADD('             (EXMDATE IS NULL)) '); // 중도제외
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 80;
  Application.ProcessMessages;

  // 월별상환이력.상환후잔액
  PhelpMsg.Caption := ' 상환후잔액 설정 작업중...';
  Application.ProcessMessages;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;

  Query_Gen.SQL.ADD('DECLARE CURSOR CUR IS ');
  Query_Gen.SQL.ADD('  SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO, STIRAMT');
  Query_Gen.SQL.ADD('  FROM PSLMAS; ');
  Query_Gen.SQL.ADD('BEGIN ');
  Query_Gen.SQL.ADD('  FOR R IN CUR LOOP ');
  Query_Gen.SQL.ADD('    UPDATE PSEMHIS ');
  Query_Gen.SQL.ADD('	SET STAIAMT     = R.STIRAMT,  ');
  Query_Gen.SQL.ADD('	    WRITETIME   = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('	    WRITEMAN    = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('	WHERE CORPNAME  = R.CORPNAME  ');
  Query_Gen.SQL.ADD('	  AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_Gen.SQL.ADD('	  AND STCLASS   = R.STCLASS   ');
  Query_Gen.SQL.ADD('	  AND STLORG    = R.STLORG    ');
  Query_Gen.SQL.ADD('	  AND EMPNO     = R.EMPNO     ');
  Query_Gen.SQL.ADD('     AND EXDATE    = ''' + E_exdate.Text + ''' ');
  Query_Gen.SQL.ADD('     AND EXMDATE IS NULL; ');
  Query_Gen.SQL.ADD('  END LOOP; ');
  Query_Gen.SQL.ADD('END; ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 85;
  Application.ProcessMessages;

  PhelpMsg.Caption := ' 원금상환 최종상환일/최종월상환금(SUM) 상환작업중...';
  Application.ProcessMessages;
  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('DECLARE CURSOR CUR IS ');
  Query_update.SQL.ADD('  SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO, ');
  Query_update.SQL.ADD('         MAX(STCTDATE) EXDATE, SUM(EXCPAMT) EXCPAMT ');
  Query_update.SQL.ADD('  FROM PSEMHIS ');
  Query_update.SQL.ADD('  WHERE EXDATE  = ''' + E_exdate.Text + ''' ');
  Query_update.SQL.ADD('    AND EXCPAMT > 0 ');
  Query_update.SQL.ADD('  GROUP BY CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO; ');
  Query_update.SQL.ADD('BEGIN ');
  Query_update.SQL.ADD('  FOR R IN CUR LOOP ');
  Query_update.SQL.ADD('    UPDATE PSLMAS ');
  Query_update.SQL.ADD('	SET EXDATE      = R.EXDATE,   ');
  Query_update.SQL.ADD('	    EXCPAMT     = R.EXCPAMT   ');
  Query_update.SQL.ADD('	WHERE CORPNAME  = R.CORPNAME  ');
  Query_update.SQL.ADD('	  AND DIVSEQNUM = R.DIVSEQNUM ');
  Query_update.SQL.ADD('	  AND STCLASS   = R.STCLASS   ');
  Query_update.SQL.ADD('	  AND STLORG    = R.STLORG    ');
  Query_update.SQL.ADD('	  AND EMPNO     = R.EMPNO;    ');
  Query_update.SQL.ADD('  END LOOP; ');
  Query_update.SQL.ADD('END; ');
  Query_update.ExecSQL;
  ProgressBar1.Position := 98;
  Application.ProcessMessages;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT EMPNO ');
  Query_Gen.SQL.ADD('FROM PSEMHIS '); // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') ');
  Query_Gen.SQL.ADD('GROUP BY EMPNO ');
  Query_Gen.Open;
  NE_inwon.Value := Query_Gen.RecordCount;  // 대상인원
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT (count(EMPNO)) CNT_RECORD, (sum(exdedamt)) SUM_EXDEDAMT ');
  Query_Gen.SQL.ADD('FROM PSEMHIS '); // 월별상환이력
  Query_Gen.SQL.ADD('WHERE (EXDATE = '''+E_exdate.Text+''') ');
  Query_Gen.Open;
  NE_record.Value   := Query_Gen.FieldByName('CNT_RECORD').AsFloat;
  NE_exdedamt.Value := Query_Gen.FieldByName('SUM_EXDEDAMT').AsFloat;
  Query_Gen.Close;

  Phelpmsg.Caption := '  추출 및 계산을 완료하였습니다.';
  ProgressBar1.Position := 100;
end;

procedure TMainForm.SB_exdateClick(Sender: TObject);
begin
{var
  Calendar2: TCalendar2;
begin
  Calendar2 := TCalendar2.Create(Self);
  try
    Calendar2.ShowModal;
    if Calendar2.GIcloseChk = 0 then
      E_exdate.Text := Calendar2.GSym; // 상환년월
  finally
    Calendar2.Free;
  end;
}
    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
//        E_exdate.Text := Copy(MonthForm.DayCaption,1,4)+' - '+Copy(MonthForm.DayCaption,5,2);
        E_exdate.Text := Copy(MonthForm.DayCaption,1,6);//+' - '+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
end;

procedure TMainForm.BB_helpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  try
    HelpForm.Programid := 'PSC3080G';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

end.




