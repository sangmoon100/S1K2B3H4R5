{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIA8020C(부서/직책별 조합원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 홍은실
Version         : 1.00
Date            : 2007.01.29
Update contents
  버전     수정일     수정자   관련근거        수정내용
  1.00   2007.01.29   홍은실  전산처리 요청서  신규프로그램 개발
--------------------------------------------------------------------------------
}

unit PIA80201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt,  DBGrids, pass, Datelib, Timeftp,
  Db , ComObj, OleCtrls, Grids, kpaylib, Func, MemDS, DBAccess, Ora;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel14: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    SaveDialog1: TSaveDialog;
    Panel5: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    Label7: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Btext: TBitBtn;
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);

  private
    start: Integer;
    procedure Data_Display;
    Procedure Data_Display_csv(Sender: TObject);
    { Private declarations }

  public
    { Public declarations }
    AReport: TQuickRep;
  end;

var
  MainForm: TMainForm;
  ErrorHelp       : array[0..255] of char;
implementation

uses pia80202;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  if start = 0 then
  begin
       start := 1;
       Application.ProcessMessages;

       P_Help.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
       Application.ProcessMessages;

       OraConnect;

       Lempno.Caption   := Pkorname + '(' + Pempno+')';
       Lsysdate.Caption := fn_GetDateStr;
       if copy(Pgrade,5,1) > 'C' then
       begin
            MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
            close;
       end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
  Application.ProcessMessages;
  P_Help.Caption := '부서/BAND별 [조합원 현황]를 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  PrintForm.Qry_DetailSum.Active := True;

  {인쇄}
  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
    PrintForm.QuickRep1.Print;
  end
  {화면출력}
  else if TBitBtn(Sender).Name = 'BB_Screen' then   //화면출력
  begin
   PrintForm.QuickRep1.Preview;
  end
  {excel 변환}
  else if TBitBtn(Sender).Name = 'Btext' then     //excel 변환
  begin
    SaveDialog1.FileName := '부서 BAND별 조합원 현황_'+Copy(Fn_GetDateTimeStr,1,8)+'.csv';
    if saveDialog1.Execute then
    begin
        Data_Display_csv(Sender)
    end
  end;

  P_Help.Caption := '작업이 완료되었습니다.';

  Screen.Cursor := crDefault;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.Data_Display_csv(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,부,서,/,BAND,별,,,조,합,원,,현,황');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[기준년월] ,:, '+copy(Lsysdate.Caption,1,4)+' 년, '+copy(Lsysdate.Caption,6,2)+' 월');
  writeln(Fexcel, '');
  writeln(Fexcel, ',임원,L2현,L2가,L2조,L2퍼,L1현,L1가,L1조,L1퍼,G4현,G4가,G4조,G4퍼,G3현,G3가,G3조,G3퍼,G2현,G2가,G2조,G2퍼,특현,특가,특조,특퍼,무현,무가,무조,무퍼,소현,소가,소조,소퍼,계약,일반,소계,총계');
  Data_Display;
  with OraQuery1 do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '['+FieldByName('deptname').AsString+'] 근무부서별 인원을 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('DEPTNAME').AsString       +','+
                     FieldByName('임원').AsString           +','+
                     FieldByName('L2_현원').AsString      +','+
                     FieldByName('L2_가입대상').AsString  +','+
                     FieldByName('L2_조합원').AsString    +','+
                     FieldByName('BUPER').AsString          +','+
                     FieldByName('L1_현원').AsString      +','+
                     FieldByName('L1_가입대상').AsString  +','+
                     FieldByName('L1_조합원').AsString    +','+
                     FieldByName('CHPER').AsString          +','+
                     FieldByName('G4_현원').AsString      +','+
                     FieldByName('G4_가입대상').AsString  +','+
                     FieldByName('G4_조합원').AsString    +','+
                     FieldByName('GAPER').AsString          +','+
                     FieldByName('G3_현원').AsString      +','+
                     FieldByName('G3_가입대상').AsString  +','+
                     FieldByName('G3_조합원').AsString    +','+
                     FieldByName('DEPER').AsString          +','+
                     FieldByName('G2_현원').AsString      +','+
                     FieldByName('G2_가입대상').AsString  +','+
                     FieldByName('G2_조합원').AsString    +','+
                     FieldByName('SAPER').AsString          +','+
                     FieldByName('특정_현원').AsString      +','+
                     FieldByName('특정_가입대상').AsString  +','+
                     FieldByName('특정_조합원').AsString    +','+
                     FieldByName('SPPER').AsString          +','+
                     FieldByName('무계_현원').AsString      +','+
                     FieldByName('무계_가입대상').AsString  +','+
                     FieldByName('무계_조합원').AsString    +','+
                     FieldByName('SJPER').AsString          +','+
                     FieldByName('소계_현원').AsString      +','+
                     FieldByName('소계_가입대상').AsString  +','+
                     FieldByName('소계_조합원').AsString    +','+
                     FieldByName('SOPER').AsString          +','+
                     //FieldByName('전계').AsString           +','+
                     FieldByName('계약').AsString           +','+
                     FieldByName('일반').AsString           +','+
                     FieldByName('비정규직_소계').AsString  +','+
                     FieldByName('총계').AsString           );
      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.Data_Display;
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    sql.add('select  DEPTNAME, DIRECTOR 임원,                                                                                                                                                               ');
    sql.add('        HWON_BU L2_현원, NON_BU L2_가입대상, BU L2_조합원, BUPER,                                                                                                                              ');
    sql.add('        HWON_CHA L1_현원, NON_CHA L1_가입대상, CHA L1_조합원, CHPER,                                                                                                                           ');
    sql.add('        HWON_GOA G4_현원, NON_GOA G4_가입대상, GOA G4_조합원, GAPER,                                                                                                                           ');
    sql.add('        HWON_DAE G3_현원, NON_DAE G3_가입대상, DAE G3_조합원, DEPER,                                                                                                                           ');
    sql.add('        HWON_SA G2_현원, NON_SA G2_가입대상, SA G2_조합원, SAPER,                                                                                                                              ');
    sql.add('        HWON_특정 특정_현원, NON_특정 특정_가입대상, 특정 특정_조합원, SPPER,                                                                                                                  ');
    sql.add('        HWON_무계 무계_현원, NON_무계 무계_가입대상, 무계 무계_조합원, SJPER,                                                                                                                  ');
    sql.add('        HWON_SO 소계_현원, NON_SO 소계_가입대상, SO 소계_조합원, SOPER,                                                                                                                        ');
    sql.add('        HWON_J 전계, HWON_PQ 계약, HWON_Y 일반, HWON_BEALL 비정규직_소계,                                                                                                                      ');
    sql.add('        HWON_ALL 총계                                                                                                                                                                          ');
    sql.add('   from (                                                                                                                                                                                      ');
    sql.add('       select ''A'' DEPTLEVEL, ''0'' DEPTCODE, ''      총           계  '' DEPTNAME,                                                                                                           ');
    sql.add('              COUNT(DECODE(SUBSTR(B.EMPNO,1,1),''M'',''1''))                                                                                         "DIRECTOR",                               ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C11'',''1''))                                                                                                  "HWON_BU",                                ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_BU",                             ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "BU",                         ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''C11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''C11'',''1'')),1)                                                                             "BUPER",                                  ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C21'',''1''))                                                                                                  "HWON_CHA",                               ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_CHA",                            ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''C21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "CHA",                        ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''C21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''C21'',''1'')),1)                                                                             "CHPER",                                  ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D11'',''1''))                                                                                                  "HWON_GOA",                               ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_GOA",                            ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "GOA",                        ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''D11'',''1'')),1)                                                                             "GAPER",                                  ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D21'',''1''))                                                                                                  "HWON_DAE",                               ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_DAE",                            ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "DAE",                        ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''D21'',''1'')),1)                                                                             "DEPER",                                  ');
    sql.add('              COUNT(DECODE(SUBSTR(B.PAYCL,1,2), ''D3'',''1''))                                                                                       "HWON_SA",                                ');
    sql.add('              COUNT(DECODE(SUBSTR(B.PAYCL,1,2),''D3'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                   "NON_SA",                             ');
    sql.add('              count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                   "SA",                         ');
    sql.add('              HPER.CALC_PERCENT(count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                              ');
    sql.add('                                COUNT(DECODE(SUBSTR(B.PAYCL,1,2), ''D3'',''1'')),1)                                                                  "SAPER",                                  ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D41'',''1''))                                                                                                  "HWON_특정",                              ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''D41'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_특정",                           ');
    sql.add('              count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "특정",                       ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D41'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''D41'',''1'')),1)                                                                             "SPPER",                                  ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''H10'',''1''))                                                                                                  "HWON_무계", --추가                       ');
    sql.add('              COUNT(DECODE(B.PAYCL, ''H10'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                             "NON_무계",  --추가                   ');
    sql.add('              count(decode(b.paycl, ''H10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                             "무계",      --추가           ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''H10'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                                        ');
    sql.add('                                COUNT(DECODE(B.PAYCL, ''H10'',''1'')),1)                                                                             "SJPER",    --추가                        ');
    sql.add('              count(decode(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',''1''))                                                                  "HWON_SO",  --수정          ');
    sql.add('               COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',                                                                                                    ');
    sql.add('                     DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                                                  "NON_SO",   --수정                      ');
    sql.add('              COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',                                                                                                     ');
    sql.add('                    DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                                                   "SO",       --수정              ');
    sql.add('              HPER.CALC_PERCENT(COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''', DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),         ');
    sql.add('                                COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',''1'')),1)                                             "SOPER",    --수정          ');
    sql.add('              COUNT(DECODE(FINDHIRE(B.EMPNO), ''J'',''1'',''''))                                                                                       "HWON_J",                               ');
    sql.add('              COUNT(DECODE(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'',''''))                                                                               "HWON_PQ",                          ');
    sql.add('              COUNT(DECODE(FINDHIRE(B.EMPNO), ''Y'',''1'',''''))                                                                                       "HWON_Y",                               ');
    sql.add('              COUNT(DECODE(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'',''Y'',''1'',''''))                                                                       "HWON_BEALL",                   ');
    sql.add('              count(b.empno)                                                                                                                     "HWON_ALL"                                    ');
    sql.add('         from pimpmas b                                                                                                                                                                        ');
    sql.add('        where b.PSTATE < ''80''                                                                                                                                                                ');
    sql.add('         UNION ALL                                                                                                                                                                             ');
    sql.add('        SELECT A.DEPTLEVEL,A.DEPTCODE,                                                                                                                                                         ');
    sql.add('               DECODE(A.DEPTLEVEL,''20'','' ''||A.DEPTABBR, ''40'','' ''||A.DEPTABBR, ''A0'','' ''||A.DEPTABBR,                                                                                ');
    sql.add('                    ''B0'',''  ''||A.DEPTABBR,                                                                                                                                                 ');
    sql.add('                ''C0'',''    ''||A.DEPTABBR, ''D0'',''      ''||A.DEPTABBR, A.DEPTABBR) DEPTNAME,                                                                                              ');
    sql.add('               DIRECTOR, HWON_BU, NON_BU, BU, BUPER, HWON_CHA, NON_CHA, CHA, CHPER, HWON_GOA, NON_GOA, GOA, GAPER,                                                                             ');
    sql.add('               HWON_DAE, NON_DAE, DAE, DEPER, HWON_SA, NON_SA, SA, SAPER, HWON_특정, NON_특정, 특정,  SPPER, HWON_무계, NON_무계, 무계,  SJPER,                                                ');
    sql.add('               HWON_SO, NON_SO, SO, SOPER, HWON_J,                                                                                                                                             ');
    sql.add('               HWON_PQ, HWON_Y, HWON_BEALL, HWON_ALL                                                                                                                                           ');
    sql.add('          from (select a.DEPTLEVEL, a.DEPTCODE, a.DEPTABBR,                                                                                                                                    ');
    sql.add('                       COUNT(DECODE(SUBSTR(B.EMPNO,1,1),''M'',''1''))                                                                                "DIRECTOR",                               ');
    sql.add('                       count(decode(b.paycl, ''C11'',''1''))                                                                                         "HWON_BU",                                ');
    sql.add('                       count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1'')))                                                    "NON_BU",                             ');
    sql.add('                       count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "BU",                         ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''C11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         count(decode(b.paycl, ''C11'',''1'')),1)                                                                    "BUPER",                                  ');
    sql.add('                       count(decode(b.paycl, ''C21'',''1''))                                                                                         "HWON_CHA",                               ');
    sql.add('                       count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1'')))                                                    "NON_CHA",                            ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''C21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "CHA",                        ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''C21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         count(decode(b.paycl, ''C21'',''1'')),1)                                                                    "CHPER",                                  ');
    sql.add('                       count(decode(b.paycl, ''D11'',''1''))                                                                                         "HWON_GOA",                               ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                    "NON_GOA",                            ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "GOA",                        ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D11'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         count(decode(b.paycl, ''D11'',''1'')),1)                                                                    "GAPER",                                  ');
    sql.add('                       count(decode(b.paycl, ''D21'',''1''))                                                                                         "HWON_DAE",                               ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                    "NON_DAE",                            ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "DAE",                        ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D21'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         COUNT(DECODE(B.PAYCL, ''D21'',''1'')),1)                                                                    "DEPER",                                  ');
    sql.add('                       count(decode(substr(b.paycl,1,2), ''D3'',''1''))                                                                              "HWON_SA",                                ');
    sql.add('                       COUNT(DECODE(SUBSTR(B.PAYCL,1,2),''D3'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                          "NON_SA",                             ');
    sql.add('                       COUNT(DECODE(SUBSTR(B.PAYCL,1,2),''D3'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                          "SA",                         ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(SUBSTR(B.PAYCL,1,2), ''D3'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                    ');
    sql.add('                                         COUNT(DECODE(SUBSTR(B.PAYCL,1,2), ''D3'',''1'')),1)                                                         "SAPER",                                  ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D41'',''1''))                                                                                         "HWON_특정",                              ');
    sql.add('                       count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1'')))                                                    "NON_특정",                           ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''D41'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "특정",                       ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''D41'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         COUNT(DECODE(B.PAYCL, ''D41'',''1'')),1)                                                                    "SPPER",                                  ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''H10'',''1''))                                                                                         "HWON_무계", --추가                       ');
    sql.add('                       COUNT(DECODE(B.PAYCL, ''H10'',DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                    "NON_무계",  --추가                   ');
    sql.add('                       count(decode(b.paycl, ''H10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                    "무계",      --추가           ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(B.PAYCL, ''H10'',DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),                                               ');
    sql.add('                                         COUNT(DECODE(B.PAYCL, ''H10'',''1'')),1)                                                                    "SJPER",    --추가                        ');
    sql.add('                       count(decode(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',''1''))                                                         "HWON_SO",  --수정          ');
    sql.add('                        COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',                                                                                           ');
    sql.add('                              DECODE(SUBSTR(B.NOGUBUN,1,1),''9'','''',''1'')))                                                                         "NON_SO",   --수정                      ');
    sql.add('                       COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',                                                                                            ');
    sql.add('                             DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')))                                                          "SO",       --수정              ');
    sql.add('                       HPER.CALC_PERCENT(COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''', DECODE(SUBSTR(B.NOGUBUN,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))),');
    sql.add('                                         COUNT(DECODE(FINDHIRE(B.EMPNO), ''M'','''',''P'','''',''Q'','''',''Y'','''',''1'')),1)                                    "SOPER",    --수정          ');
    sql.add('                       count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''''))                                                                            "HWON_J",                               ');
    sql.add('                       count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'',''''))                                                                    "HWON_PQ",                          ');
    sql.add('                       COUNT(DECODE(FINDHIRE(B.EMPNO), ''Y'',''1'',''''))                                                                            "HWON_Y",                               ');
    sql.add('                       COUNT(DECODE(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'',''Y'',''1'',''''))                                                            "HWON_BEALL",                   ');
    sql.add('                       count(b.empno)                                                                                                            "HWON_ALL"                                    ');
    sql.add('                  from pycdept a, pimpmas b                                                                                                                                                    ');
    sql.add('                 where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')                                                                                           ');
    sql.add('                   and a.orgnum    = b.orgnum                                                                                                                                                  ');
    sql.add('                   and ((a.deptlevel in (''20'', ''40'', ''A0'', ''B0'') and a.existon =''0'') or a.existon = ''1'')                                                                           ');
    sql.add('                   and a.chanmode <>''3''                                                                                                                                                      ');
    sql.add('                   and B.PSTATE <''80''                                                                                                                                                        ');
    sql.add('        --           and substr(a.deptcode,1,(instr(a.deptcode,''0'')-1)) = substr(b.deptcode,1,(instr(a.deptcode,''0'')-1))                                                                   ');
    sql.add('                   and RTRIM(A.DEPTCODE,''0'') = substr(b.deptcode,1,LENGTH(RTRIM(A.DEPTCODE,''0'')))                                                                                          ');
    sql.add('                 group by a.deptlevel, A.DEPTCODE, a.DEPTABBR                                                                                                                                  ');
    sql.add('               ) A                                                                                                                                                                             ');
    sql.add('      )                                                                                                                                                                                        ');
    sql.add(' order by DEPTCODE                                                                                                                                                                             ');

    Open;

    edit1.text := sql.text;

    if Eof then
    begin
      MessageDlg('출력할  데이터가 없습니다.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

end.

