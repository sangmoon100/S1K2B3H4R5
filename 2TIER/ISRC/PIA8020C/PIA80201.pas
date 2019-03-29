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
    { Private declarations }
    start: Integer;
    procedure Data_Display;
    Procedure Data_Display_csv(Sender: TObject);
    procedure Data_Display2;
    Procedure Data_Display2_csv(Sender: TObject);

  public
    { Public declarations }
    AReport: TQuickRep;
  end;

var
  MainForm: TMainForm;
  ErrorHelp       : array[0..255] of char;
implementation

uses pia80202, PIA80203;

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

  if Copy(Fn_GetDateTimeStr,1,8) < '20190101' then
  begin
     PrintForm.Qry_DetailSum.Active := True;
     AReport := PrintForm.QuickRep1;
  end
  else
  begin
     PrintForm2.Qry_DetailSum.Active := True;
     AReport := PrintForm2.QuickRep1;
  end;

  {인쇄}
  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
    AReport.Print;
  end
  {화면출력}
  else if TBitBtn(Sender).Name = 'BB_Screen' then   //화면출력
  begin
    AReport.Preview;
  end
  {excel 변환}
  else if TBitBtn(Sender).Name = 'Btext' then     //excel 변환
  begin
    SaveDialog1.FileName := '부서 BAND별 조합원 현황_'+Copy(Fn_GetDateTimeStr,1,8)+'.csv';
    if saveDialog1.Execute then
    begin
        if Copy(Fn_GetDateTimeStr,1,8) < '20190101' then
        begin
            Data_Display_csv(Sender)
        end
        else
        begin
            Data_Display2_csv(Sender)
        end
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
  writeln(Fexcel, ',임원,L2현,L2가,L2조,L2퍼,L1현,L1가,L1조,L1퍼,G4현,G4가,G4조,G4퍼,G3현,G3가,G3조,G3퍼,G2현,G2가,G2조,G2퍼,특현,특가,특조,특퍼,소현,소가,소조,소퍼,전계,계약,일반,소계,총계');
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
                     FieldByName('소계_현원').AsString      +','+
                     FieldByName('소계_가입대상').AsString  +','+
                     FieldByName('소계_조합원').AsString    +','+
                     FieldByName('SOPER').AsString          +','+
                     FieldByName('전계').AsString           +','+
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
    SQL.Add('select  DEPTNAME, DIRECTOR 임원,                                                                 ');
    SQL.Add('        HWON_BU L2_현원, NON_BU L2_가입대상, BU L2_조합원, BUPER,                          ');
    SQL.Add('        HWON_CHA L1_현원, NON_CHA L1_가입대상, CHA L1_조합원, CHPER,                       ');
    SQL.Add('        HWON_GOA G4_현원, NON_GOA G4_가입대상, GOA G4_조합원, GAPER,                       ');
    SQL.Add('        HWON_DAE G3_현원, NON_DAE G3_가입대상, DAE G3_조합원, DEPER,                       ');
    SQL.Add('        HWON_SA G2_현원, NON_SA G2_가입대상, SA G2_조합원, SAPER,                          ');
    SQL.Add('        HWON_특정 특정_현원, NON_특정 특정_가입대상, 특정 특정_조합원, SPPER,                    ');
    SQL.Add('        HWON_SO 소계_현원, NON_SO 소계_가입대상, SO 소계_조합원, SOPER,                          ');
    SQL.Add('        HWON_J 전계, HWON_PQ 계약, HWON_Y 일반, HWON_BEALL 비정규직_소계, ');
    SQL.Add('        HWON_ALL 총계');
    SQL.Add('   from (                                                                                  ');
    SQL.Add('       select ''A'' DEPTLEVEL, ''0'' DEPTCODE, ''      총           계  '' DEPTNAME,     ');
    SQL.Add('                count(decode(substr(b.empno,1,1),''M'',''1'')) DIRECTOR,                   ');
    SQL.Add('                count(decode(b.paycl, ''C11'',''1'')) "HWON_BU",                                                                                                                    ');
    SQL.Add('                count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",                                                                            ');
    SQL.Add('                round((count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C11'',''1''))  ) * 100,1) "BUPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",                                                        ');
    SQL.Add('                count(decode(b.paycl, ''C21'',''1'')) "HWON_CHA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C21'',''1'')) ) * 100,1) "CHPER",                                                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D11'',''1'')) "HWON_GOA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D11'',''1'')) )  * 100,1) "GAPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''D21'',''1'')) "HWON_DAE",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_DAE",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "DAE",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D21'',''1'')) ) * 100,1) "DEPER",                                                                                                          ');
    SQL.Add('                count(decode(substr(b.paycl,1,2), ''D3'',''1'')) "HWON_SA",                                                                                                         ');
    SQL.Add('                count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SA",                                                                  ');
    SQL.Add('                count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SA",                                              ');
    SQL.Add('                round((count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                         ');
    SQL.Add('                (count(decode(substr(b.paycl,1,2), ''D3'',''1'')) ) * 100,1) "SAPER",                                                                                               ');
    SQL.Add('                count(decode(b.paycl, ''D41'',''1'')) "HWON_특정",                                                                                                                  ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_특정",                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "특정",                                                      ');
    SQL.Add('                round((count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D41'',''1'')) ) * 100,1) "SPPER",                                                                                                          ');
(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');

*)
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');
    SQL.Add('                count(b.empno) "HWON_ALL"                                                                                                                                          ');
    SQL.Add('         from pimpmas b                                                                                               ');
    SQL.Add('        where b.PSTATE < ''80''                                                '); 
    SQL.Add('         UNION ALL');
    SQL.Add('        SELECT A.DEPTLEVEL,A.DEPTCODE,');
    SQL.Add('               DECODE(A.DEPTLEVEL,''20'','' ''||A.DEPTABBR, ''40'','' ''||A.DEPTABBR, ''A0'','' ''||A.DEPTABBR,');
    SQL.Add('             		       ''B0'',''  ''||A.DEPTABBR,');
    SQL.Add('        			       ''C0'',''    ''||A.DEPTABBR, ''D0'',''      ''||A.DEPTABBR, A.DEPTABBR) DEPTNAME,');
    SQL.Add('               DIRECTOR, HWON_BU, NON_BU, BU, BUPER, HWON_CHA, NON_CHA, CHA, CHPER, HWON_GOA, NON_GOA, GOA, GAPER, ');
    SQL.Add('        	    HWON_DAE, NON_DAE, DAE, DEPER, HWON_SA, NON_SA, SA, SAPER, HWON_특정, NON_특정, 특정,  SPPER, ');
    SQL.Add('        	    HWON_SO, NON_SO, SO, SOPER, HWON_J, HWON_PQ, HWON_Y, HWON_BEALL, HWON_ALL');
    SQL.Add('          FROM (select  a.deptlevel, A.DEPTCODE, a.DEPTABBR,');
    SQL.Add('                        count(decode(substr(b.empno,1,1),''M'',''1'')) "DIRECTOR",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',''1'')) "HWON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C11'',''1''))) , 0,1,(count(decode(b.paycl, ''C11'',''1''))) )) * 100 ,1) "BUPER",');
    SQL.Add('                        count(decode(b.paycl, ''C21'',''1'')) "HWON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C21'',''1''))) , 0,1,(count(decode(b.paycl, ''C21'',''1''))) )) * 100 ,1) "CHPER",');
    SQL.Add('                        count(decode(b.paycl, ''D11'',''1'')) "HWON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D11'',''1''))) , 0,1,(count(decode(b.paycl, ''D11'',''1''))) )) * 100,1) "GAPER",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',''1'')) "HWON_DAE",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_DAE",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "DAE",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D21'',''1''))) , 0,1,(count(decode(b.paycl, ''D21'',''1''))) )) * 100,1) "DEPER",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2), ''D3'',''1'')) "HWON_SA",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SA",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SA",');
    SQL.Add('                        trunc(count(decode(substr(b.paycl,1,2), ''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) / ');
    SQL.Add('                        (decode( (count(decode(substr(b.paycl,1,2), ''D3'',''1''))) , 0,1,(count(decode(substr(b.paycl,1,2), ''D3'',''1''))) )) * 100,1)  "SAPER",');
    SQL.Add('                        count(decode(b.paycl, ''D41'',''1'')) "HWON_특정",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_특정",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "특정",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D41'',''1''))) , 0,1,(count(decode(b.paycl, ''D41'',''1''))) )) * 100,1)  "SPPER",');
(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --조합원 all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(substr(b.empno,1,1), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
*)
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --조합원 all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
    SQL.Add('        	             count(b.empno) "HWON_ALL"');
    SQL.Add('                  from pycdept a, pimpmas b                                                                                                   ');
    SQL.Add('                 where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')                                          ');
    SQL.Add('                   and a.orgnum    = b.orgnum                                                                                                 ');
    SQL.Add('                   and ((a.deptlevel in (''20'', ''40'', ''A0'', ''B0'') and a.existon =''0'') or a.existon = ''1'')                                                                                             ');
    SQL.Add('                   and a.chanmode <>''3''                                                                                                     ');
    SQL.Add('                   and b.pstate <''80''                                                                                                       ');
    //2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정(부서코드내 숫자'0'이 있는 부서 통계오류 수정).. 안효상M
    //SQL.Add('                   and substr(a.deptcode,1,(instr(a.deptcode,''0'')-1)) = substr(b.deptcode,1,(instr(a.deptcode,''0'')-1))              ');
    SQL.Add('                   and RTRIM(A.DEPTCODE,''0'') = substr(b.deptcode,1,LENGTH(RTRIM(A.DEPTCODE,''0'')))              ');
    SQL.Add('                 group by a.deptlevel, A.DEPTCODE, a.DEPTABBR 				                                                                                             ');
    SQL.Add('                ) A                                           ');
    SQL.Add('	    )');
    SQL.Add(' order by deptcode    ');
    Open;

    edit1.text := sql.text;

    if Eof then
    begin
      MessageDlg('출력할  데이터가 없습니다.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

procedure TMainForm.Data_Display2_csv(Sender: TObject);
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
  writeln(Fexcel, ',임원,M2(직책)현,M2(직책)가,M2(직책)조,M2(직책)퍼,M2(일반)현,M2(일반)가,M2(일반)조,M2(일반)퍼,M1현,M1가,M1조,M1퍼,특현,특가,특조,특퍼,소현,소가,소조,소퍼,전계,계약,일반,소계,총계');
  Data_Display2;
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
                     FieldByName('M2(직책)_현원').AsString      +','+
                     FieldByName('M2(직책)_가입대상').AsString  +','+
                     FieldByName('M2(직책)_조합원').AsString    +','+
                     FieldByName('BUPER').AsString          +','+
                     FieldByName('M2(일반)_현원').AsString      +','+
                     FieldByName('M2(일반)_가입대상').AsString  +','+
                     FieldByName('M2(일반)_조합원').AsString    +','+
                     FieldByName('CHPER').AsString          +','+
                     FieldByName('M1_현원').AsString      +','+
                     FieldByName('M1_가입대상').AsString  +','+
                     FieldByName('M1_조합원').AsString    +','+
                     FieldByName('GAPER').AsString          +','+
                     {FieldByName('G3_현원').AsString      +','+
                     FieldByName('G3_가입대상').AsString  +','+
                     FieldByName('G3_조합원').AsString    +','+
                     FieldByName('DEPER').AsString          +','+
                     FieldByName('G2_현원').AsString      +','+
                     FieldByName('G2_가입대상').AsString  +','+
                     FieldByName('G2_조합원').AsString    +','+
                     FieldByName('SAPER').AsString          +','+}
                     FieldByName('특정_현원').AsString      +','+
                     FieldByName('특정_가입대상').AsString  +','+
                     FieldByName('특정_조합원').AsString    +','+
                     FieldByName('SPPER').AsString          +','+
                     FieldByName('소계_현원').AsString      +','+
                     FieldByName('소계_가입대상').AsString  +','+
                     FieldByName('소계_조합원').AsString    +','+
                     FieldByName('SOPER').AsString          +','+
                     FieldByName('전계').AsString           +','+
                     FieldByName('계약').AsString           +','+
                     FieldByName('일반').AsString           +','+
                     FieldByName('비정규직_소계').AsString  +','+
                     FieldByName('총계').AsString           );
      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.Data_Display2;
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  DEPTNAME, DIRECTOR 임원,                                                                 ');
    SQL.Add('        HWON_BU "M2(직책)_현원", NON_BU "M2(직책)_가입대상", BU "M2(직책)_조합원", BUPER,                          ');
    SQL.Add('        HWON_CHA "M2(일반)_현원", NON_CHA "M2(일반)_가입대상", CHA "M2(일반)_조합원", CHPER,                       ');
    SQL.Add('        HWON_GOA "M1_현원", NON_GOA "M1_가입대상", GOA "M1_조합원", GAPER,                       ');
    SQL.Add('        HWON_특정 특정_현원, NON_특정 특정_가입대상, 특정 특정_조합원, SPPER,                    ');
    SQL.Add('        HWON_SO 소계_현원, NON_SO 소계_가입대상, SO 소계_조합원, SOPER,                          ');
    SQL.Add('        HWON_J 전계, HWON_PQ 계약, HWON_Y 일반, HWON_BEALL 비정규직_소계, ');
    SQL.Add('        HWON_ALL 총계');
    SQL.Add('   from (                                                                                  ');
    SQL.Add('       select ''A'' DEPTLEVEL, ''0'' DEPTCODE, ''      총           계  '' DEPTNAME,     ');
    SQL.Add('                count(decode(substr(b.empno,1,1),''M'',''1'')) DIRECTOR,                   ');
    SQL.Add('                count(decode(b.paycl, ''C31'',''1'')) "HWON_BU",                                                                                                                    ');
    SQL.Add('                count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",                                                                            ');
    SQL.Add('                round((count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C31'',''1''))  ) * 100,1) "BUPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",                                                        ');
    SQL.Add('                count(decode(b.paycl, ''C33'',''1'')) "HWON_CHA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C33'',''1'')) ) * 100,1) "CHPER",                                                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D10'',''1'')) "HWON_GOA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D10'',''1'')) )  * 100,1) "GAPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''D41'',''1'')) "HWON_특정",                                                                                                                  ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_특정",                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "특정",                                                      ');
    SQL.Add('                round((count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D41'',''1'')) ) * 100,1) "SPPER",                                                                                                          ');
    (*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M *)
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');
    SQL.Add('                count(b.empno) "HWON_ALL"                                                                                                                                          ');
    SQL.Add('         from pimpmas b                                                                                               ');
    SQL.Add('        where b.PSTATE < ''80''                                                '); 
    SQL.Add('         UNION ALL');
    SQL.Add('        SELECT A.DEPTLEVEL,A.DEPTCODE,');
    SQL.Add('               DECODE(A.DEPTLEVEL,''20'','' ''||A.DEPTABBR, ''40'','' ''||A.DEPTABBR, ''A0'','' ''||A.DEPTABBR,');
    SQL.Add('             		       ''B0'',''  ''||A.DEPTABBR,');
    SQL.Add('        			       ''C0'',''    ''||A.DEPTABBR, ''D0'',''      ''||A.DEPTABBR, A.DEPTABBR) DEPTNAME,');
    SQL.Add('               DIRECTOR, HWON_BU, NON_BU, BU, BUPER, HWON_CHA, NON_CHA, CHA, CHPER, HWON_GOA, NON_GOA, GOA, GAPER, ');
    SQL.Add('        	    HWON_특정, NON_특정, 특정,  SPPER, ');
    SQL.Add('        	    HWON_SO, NON_SO, SO, SOPER, HWON_J, HWON_PQ, HWON_Y, HWON_BEALL, HWON_ALL');
    SQL.Add('          FROM (select  a.deptlevel, A.DEPTCODE, a.DEPTABBR,');
    SQL.Add('                        count(decode(substr(b.empno,1,1),''M'',''1'')) "DIRECTOR",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',''1'')) "HWON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C31'',''1''))) , 0,1,(count(decode(b.paycl, ''C11'',''1''))) )) * 100 ,1) "BUPER",');
    SQL.Add('                        count(decode(b.paycl, ''C33'',''1'')) "HWON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C33'',''1''))) , 0,1,(count(decode(b.paycl, ''C21'',''1''))) )) * 100 ,1) "CHPER",');
    SQL.Add('                        count(decode(b.paycl, ''D10'',''1'')) "HWON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D10'',''1''))) , 0,1,(count(decode(b.paycl, ''D11'',''1''))) )) * 100,1) "GAPER",');
    SQL.Add('                        count(decode(b.paycl, ''D41'',''1'')) "HWON_특정",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_특정",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "특정",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D41'',''1''))) , 0,1,(count(decode(b.paycl, ''D41'',''1''))) )) * 100,1)  "SPPER",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --조합원 all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
    SQL.Add('        	             count(b.empno) "HWON_ALL"');
    SQL.Add('                  from pycdept a, pimpmas b                                                                                                   ');
    SQL.Add('                 where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')                                          ');
    SQL.Add('                   and a.orgnum    = b.orgnum                                                                                                 ');
    SQL.Add('                   and ((a.deptlevel in (''20'', ''40'', ''A0'', ''B0'') and a.existon =''0'') or a.existon = ''1'')                                                                                             ');
    SQL.Add('                   and a.chanmode <>''3''                                                                                                     ');
    SQL.Add('                   and b.pstate <''80''                                                                                                       ');
    //2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정(부서코드내 숫자'0'이 있는 부서 통계오류 수정).. 안효상M
    SQL.Add('                   and RTRIM(A.DEPTCODE,''0'') = substr(b.deptcode,1,LENGTH(RTRIM(A.DEPTCODE,''0'')))              ');
    SQL.Add('                 group by a.deptlevel, A.DEPTCODE, a.DEPTABBR 				                                                                                             ');
    SQL.Add('                ) A                                           ');
    SQL.Add('	    )');
    SQL.Add(' order by deptcode    ');
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

