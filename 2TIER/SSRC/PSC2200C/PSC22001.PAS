{-------------------------------------------------------------------------------
PROGRAM-NAME   : Psc2140c.exe(우리사주 조합가입 및 탈퇴현황 출력)
SYSTEM-NAME    : 종합인사정보
SUBSYSTEM-NAME : 복리후생(우리사주/ 예탁 및 인출)
Programmer     : 허 철행
Version        : 1.00
Date           : 1997.12.01
Update Contents
  1.00  1997.12.01       허철행     신규 프로그램 개발          상세처리명세서
  1.01  2002.10.02       손종운     인원수 중복 카운트 제외등   요청서 2002-4777호
  1.03  2002.10.04       손종운     추출 기준일 반영            요청서 2002-4777호
  1.04  2002.11.20       손종운     기관별 대출자 총계 반영     요청서 2002-6774호
  1.06  2003.05.07       정규용     psc22004 엑셀출력추가       요청서 2003-6009호
  1.07  2003.05.15       정규용     psc22004 차수별출력가능추가
-------------------------------------------------------------------------------}
unit psc22001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, numedit, DBTables, Db, ExtCtrls, Mask, Buttons, Calen1, Pass,
  ComCtrls, userhelp, peoutlookbtn, Comobj, Menus;
type
  TF_psc22001 = class(TForm)
    Panel19: TPanel;
    BB_close: TBitBtn;
    BB_pset: TBitBtn;
    BB_prt: TBitBtn;
    p_help: TPanel;
    Panel8: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Image1: TImage;
    L_empinfo: TLabel;
    L_sysdate: TLabel;
    Query1: TQuery;
    DB1: TDatabase;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    GB_apply: TGroupBox;
    Panel6: TPanel;
    Panel4: TPanel;
    CB_cha: TComboBox;
    work_date: TMaskEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel12: TPanel;
    Pa_1: TPanel;
    Pa_2: TPanel;
    Panel3: TPanel;
    Pa_3: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Pa_4: TPanel;
    Panel11: TPanel;
    Pa_5: TPanel;
    Panel15: TPanel;
    Pa_6: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Pa_7: TPanel;
    Panel21: TPanel;
    Pa_10: TPanel;
    Panel25: TPanel;
    Pa_8: TPanel;
    Panel31: TPanel;
    Pa_9: TPanel;
    Panel23: TPanel;
    Pa_14: TPanel;
    Panel29: TPanel;
    Pa_15: TPanel;
    Label3: TLabel;
    Panel9: TPanel;
    Pa_11: TPanel;
    Panel36: TPanel;
    Pa_12: TPanel;
    Panel38: TPanel;
    Pa_13: TPanel;
    Panel40: TPanel;
    Bt_Excel: TPeJeonOutLookBtn;
    Qry1: TQuery;
    BB_Excelprn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BB_prtClick(Sender: TObject);
    procedure BB_psetClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure WORKDATE_ENTER(Sender: TObject);
    procedure WORKDATE_KEYPRESS(Sender: TObject);
    procedure RetrieveData;
    procedure DataAllClear;
    procedure work_dateExit(Sender: TObject);
    procedure Bt_ExcelClick(Sender: TObject);
    procedure BB_ExcelprnClick(Sender: TObject);
  private
    { Private declarations }
  public
    GSempno    : String[4];
    GSkorname  : String[12];
    GSpassword : String[10];
    GSgrade    : String[10];
    GSsysdate  : String[15];
    WK_ST_DATE : STring;
    procedure ExcelData1;

    { Public declarations }
  end;

var
    F_psc22001: TF_psc22001;
    WK_DIVSEQNUM  : STring;
    WK_STLORG     : STring;
    Running : Boolean;
    sqlstr  : string;
    mesg    : string;

const
     SKBBjusic = 295959087;

implementation

{$R *.DFM}
uses
 psc22003, psc22002, psc22004;


//------------------------------ USER PROCEDURE --------------------------------
//------------------------------ USER FUNCTION ---------------------------------
//------------------------------ MAIN ------------------------------------------
// 초기
procedure TF_psc22001.FormActivate(Sender: TObject);
var
     i : Integer;
begin
     if DB1.Connected = True then System.exit;
     GSempno := PassEmp(cmdline,1);
     GSkorname := PassEmp(cmdline,2);
     GSPassword := PassEmp(cmdline,3);
     GSgrade := Copy((PassEmp(cmdline,4)),4,1);
     Application.ProcessMessages;

     for i := 0 to DB1.Params.Count-1 do
     begin
          if  System.Pos('SERVER NAME',DB1.Params[i]) > 0 then
               DB1.Params[i] := 'SERVER NAME=' + PassEmp(cmdline,13);
          if  Pos('USER NAME',DB1.Params[i]) > 0 then
               DB1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
          if  Pos('PASSWORD',DB1.Params[i]) > 0 then
               DB1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
     end;

     DB1.Connected := True;

     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
     Query1.Sql.Add('FROM DUAL                                       ');
     Query1.Open;
     GSsysdate := Query1.FieldByName('D').AsString;

     L_empinfo.Caption := GSkorname + '(' + GSempno + ')';
     L_sysdate.Caption := Copy(GSsysdate,1,4) + '/' + Copy(GSsysdate,5,2) + '/' +
                          Copy(GSsysdate,7,2);
     WORK_DATE.TEXT    := Copy(GSsysdate,1,8);
end;

procedure TF_psc22001.ExcelData1;
begin
     with Qry1 do
     begin
          Close;
          Sql.Clear;
          Sql.Text := 'Select distinct A.divseqnum||''차'' 구분,                                                                             ' +
                      '       decode(A.stlorg,''ZZ'',''00'',''005'',''01'',''081'',''02'',''023'',''03'',''011'',''04'',''010'',''05'')  순번,    ' +
                      '       (Select codename From pyccode Where codeid = ''K910'' And codeno =A.stlorg) 대출기관,                          ' +
                      '       A.stldate   대출기간From, A.stledate  대출기간to, A.stirate   이율,                                            ' +
                      '       decode(A.divseqnum,1,(Select Count(distinct empno) From psdphis Where divseqnum = A.divseqnum),null) 조합원수, ' +
                      '       decode(A.divseqnum,1,B.empcnt,null) 주식보유자,                                                                ' +
                      '       (Select Count(distinct empno) From pslmas                                                                      ' +
                      '        Where corpname <> ''데이콤'' And stiramt <> 0 And divseqnum = A.divseqnum And stlorg = A.stlorg) 대출자,      ' +
                      '       C.stlamt   대부금액,  decode(A.divseqnum,1,B.totalju,null)  예탁주,                                            ' +
                      '       C.excpamt  상환금액,  decode(A.divseqnum,1,B.inchulju,null) 인출주,                                            ' +
                      '       C.remamt   잔액,      decode(A.divseqnum,1,B.boyuju,null)   잔여주,                                            ' +
                      '       (Select issueamt From pshsbas Where divseqnum = A.divseqnum) 취득가,    null 비고1,    null 비고2              ' +
                      '  From pshlbas A,                                                                                                     ' +
                      '       (Select AA.divseqnum,                                                                                          ' +
                      '               Count(distinct decode(nvl(AA.dpst,0) - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0),0,null, AA.empno)) empcnt, ' +
                      '               Sum(nvl(AA.dpst,0))                                        totalju,                                    ' +
                      '               Sum(nvl(AA.inchul,0) - nvl(BB.wdstcnt,0))                  inchulju,                                   ' +
                      '               Sum(nvl(AA.dpst,0) - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0)) boyuju                                      ' +
                      '          From (Select divseqnum, empno,  Sum(dpstcnt) dpst,   Sum(wrcnt) inchul                                      ' +
                      '                  From psdphis                                                                                        ' +
                      '                 Group by divseqnum, empno  ) AA,                                                                     ' +
                      '               (Select divseqnum, empno,  Sum(wdstcnt) wdstcnt                                                        ' +
                      '                  From psowhis                                                                                        ' +
                      '                 Where subdate >   '''+wk_st_date+'''                                                                 ' +
                      '                 Group by divseqnum, empno  ) BB                                                                      ' +
                      '         Where AA.divseqnum = BB.divseqnum(+)  And AA.empno     = BB.empno(+)                                         ' +
                      '         Group by AA.divseqnum) B,                                                                                    ' +
                      '       (Select A.divseqnum, A.stlorg,  Sum(A.stlamt) stlamt,  Sum(B.excpamt) excpamt,                                 ' +
                      '               Sum(A.stlamt) - Sum(B.excpamt) remamt                                                                  ' +
                      '          From pslmas A,                                                                                              ' +
                      '               (Select divseqnum, stlorg, empno, stclass, stldate, stlamt, Sum(excpamt) excpamt                       ' +
                      '                  From psemhis                                                                                        ' +
                      '                 Where nvl(exmdate, '' '') <= '''+wk_st_date+'''                                                      ' +
                      '                   And corpname <> ''데이콤''                                                                         ' +
                      '                 Group by divseqnum, stlorg, empno, stclass, stldate, stlamt) B                                       ' +
                      '          Where A.corpname  <> ''데이콤''                                                                             ' +
                      '            And A.divseqnum = B.divseqnum(+)  And A.stlorg    = B.stlorg(+)                                           ' +
                      '            And A.empno     = B.empno(+)      And A.stclass   = B.stclass(+)                                          ' +
                      '            And A.stldate   = B.stldate(+)    And A.stlamt    = B.stlamt(+)                                           ' +
                      '          Group by A.divseqnum, A.stlorg) C                                                                           ' +
                      ' Where A.stclass   = 1             And A.divseqnum = B.divseqnum                                                      ' +
                      '   And A.divseqnum = C.divseqnum   And A.stlorg    = C.stlorg                                                         ' +
                      'union                                                                                                                 ' +
                      'Select B.divseqnum||''차'', ''ZZ'', ''소계'', null, null, null,                                                       ' +
                      '       (Select Count(distinct empno) From psdphis Where divseqnum = B.divseqnum),                                     ' +
                      '       B.empcnt 주식보유자,                                                                                           ' +
                      '       (Select Count(distinct empno) From pslmas                                                                      ' +
                      '         Where corpname <> ''데이콤'' And stiramt <> 0 And divseqnum  = B.divseqnum ),                                ' +
                      '       C.stlamt, B.totalju, C.excpamt, B.inchulju, C.remamt, B.boyuju, null, null, null                               ' +
                      '  From (Select AA.divseqnum,                                                                                          ' +
                      '               Count(distinct decode(nvl(AA.dpst,0) - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0),0,null, AA.empno)) empcnt, ' +
                      '               Sum(nvl(AA.dpst,0))                                        totalju,                                    ' +
                      '               Sum(nvl(AA.inchul,0) - nvl(BB.wdstcnt,0))                  inchulju,                                   ' +
                      '               Sum(nvl(AA.dpst,0) - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0)) boyuju                                      ' +
                      '          From (Select divseqnum, empno,  Sum(dpstcnt) dpst,  Sum(wrcnt)  inchul                                      ' +
                      '                  From psdphis                                                                                        ' +
                      '                 Group by divseqnum, empno  ) AA,                                                                     ' +
                      '               (Select divseqnum, empno,  Sum(wdstcnt) wdstcnt                                                        ' +
                      '                  From psowhis                                                                                        ' +
                      '                 Where subdate >   '''+wk_st_date+'''                                                                 ' +
                      '                 Group by divseqnum, empno  ) BB                                                                      ' +
                      '         Where AA.divseqnum = BB.divseqnum(+)   And AA.empno     = BB.empno(+)                                        ' +
                      '         Group by AA.divseqnum ) B,                                                                                   ' +
                      '       (Select A.divseqnum, stlamt,   excpamt,   stlamt-excpamt remamt                                                ' +
                      '          From (Select divseqnum, Sum(stlamt) stlamt From pslmas Where corpname <> ''데이콤'' Group by divseqnum ) A, ' +
                      '               (Select divseqnum, Sum(excpamt) excpamt From psemhis                                                   ' +
                      '                 Where corpname <> ''데이콤'' And nvl(exmdate, '' '') <= '''+wk_st_date+'''  Group by divseqnum) B    ' +
                      '         Where A.divseqnum = B.divseqnum(+) ) C                                                                       ' +
                      ' Where B.divseqnum not in (1)  And B.divseqnum = C.divseqnum                                                          ' +
                      'union                                                                                                                 ' +
                      '  SELECT ''6차'',''ZS'',''자비'', NULL, NULL, NULL,  COUNT(aa.empno),              ' +
                      '    COUNT(CASE WHEN DPSTCNT-NVL(wdstcnt,0) > 0 THEN aa.empno END), 0,              ' +
                      '    NULL, SUM(aa.DPSTCNT),                                                         ' +
                      '	   NULL, NVL(SUM(bb.wdstcnt),0),                                                  ' +
                      '	   NULL, SUM(aa.DPSTCNT)- NVL(SUM(bb.wdstcnt),0),                                 ' +
                      '	   5000, NULL, NULL                                                               ' +
                      '  FROM psdphis	aa, (SELECT divseqnum, empno, SUM(wdstcnt) wdstcnt FROM psowhis   ' +
                      '                      WHERE subdate <= '''+wk_st_date+'''                          ' +
                      '                      GROUP BY divseqnum, empno  ) BB                              ' +
                      ' WHERE aa.divseqnum = 6                                                            ' +
                      '   AND to_char(aa.divseqnum) = bb.divseqnum(+)                                     ' +
                      '   AND aa.empno     = bb.empno(+)                                                  ' +
(*  2013.03.15 6차 조회커리 변경 HeeYong
                      'Select ''6차'',''ZS'',''자비'', null, null, null,  (Select Count(empno) From psdphis where divseqnum = 6),            ' +
                      '       (Select Count(distinct empno) From psdphis where divseqnum = 6 and remcnt <> 0), 0,                            ' +
                      '       null, (Select sum(DPSTCNT) From psdphis where divseqnum = 6),                                                  ' +
                      '	      null, (Select sum(WRCNT)   From psdphis where divseqnum = 6),                                                  ' +
                      '	      null, (Select sum(remcnt)  From psdphis where divseqnum = 6),                                                  ' +
                      '	      5000, null, null                                                                                               ' +
                      '  From dual	                                                                                                     ' +
*)
                      'union                                                                                                                 ' +
                      'Select ''총계'', ''00'', ''회사'', null, null, null, null, null,                                                      ' +
                      '       (Select Count(distinct empno) From pslmas Where corpname<> ''데이콤'' And stiramt<>0 And stlorg in (''ZZ'')),  ' +
                      '       C.stlamt, null, C.excpamt, null, C.remamt,null, null, ''SK브로드밴드주식수'', '+floattostr(SKBBjusic)+'        ' +
                      '  From (Select Sum(A.stlamt) stlamt,  Sum(B.excpamt) excpamt, Sum(A.stlamt) - sum(B.excpamt) remamt                   ' +
                      '          From pslmas A,                                                                                              ' +
                      '               (Select divseqnum, stlorg, empno, stclass, stldate, stlamt, Sum(excpamt) excpamt                       ' +
                      '                  From psemhis Where nvl(exmdate, '' '') <= '''+wk_st_date+'''  And corpname <> ''데이콤''            ' +
                      '                 Group by divseqnum, stlorg, empno, stclass, stldate, stlamt) B                                       ' +
                      '          Where A.corpname  <> ''데이콤''     And A.divseqnum = B.divseqnum(+)                                        ' +
                      '            And A.stlorg    = B.stlorg(+)     And A.empno     = B.empno(+)                                            ' +
                      '            And A.stclass   = B.stclass(+)    And A.stldate   = B.stldate(+)                                          ' +
                      '            And A.stlamt    = B.stlamt(+)     And A.stlorg    in (''ZZ'') ) C                                         ' +
                      'union                                                                                                                 ' +
                      'Select ''총계'',''02'',''은행'', null, null, null, null,null,                                                         ' +
                      '       (Select Count(distinct empno) empcnt From pslmas  Where corpname <> ''데이콤''                                 ' +
                      '                                                           And stiramt <> 0 And stlorg not in (''ZZ'')),              ' +
                      '       C.stlamt, null, C.excpamt, null, C.remamt, null, null, null, null                                              ' +
                      '  From (Select Sum(A.stlamt) stlamt,   Sum(B.excpamt) excpamt,  Sum(A.stlamt-B.excpamt) remamt                        ' +
                      '          From pslmas A,                                                                                              ' +
                      '               (Select divseqnum, stlorg, empno, stclass, stldate, stlamt, Sum(excpamt) excpamt                       ' +
                      '                  From psemhis Where nvl(exmdate, '' '') <= '''+wk_st_date+'''  And corpname <> ''데이콤''            ' +
                      '                 Group by divseqnum, stlorg, empno, stclass, stldate, stlamt) B                                       ' +
                      '          Where A.corpname  <> ''데이콤''     And A.divseqnum = B.divseqnum(+)                                        ' +
                      '            And A.stlorg    = B.stlorg(+)     And A.empno     = B.empno(+)                                            ' +
                      '            And A.stclass   = B.stclass(+)    And A.stldate   = B.stldate(+)                                          ' +
                      '            And A.stlamt    = B.stlamt (+)    And A.stlorg    not in (''ZZ'')) c                                      ' +
                      'union                                                                                                                 ' +
                      'Select ''총계'',''ZZ'',''합계'', null, null, null,  (Select Count(distinct empno) From psdphis),   B.empcnt,          ' +
                      '       (Select Count(distinct empno) From pslmas  Where corpname <> ''데이콤'' And stiramt <> 0),                     ' +
                      '       C.stlamt, B.totalju, C.excpamt, B.inchulju, C.remamt, B.boyuju, null,                                          ' +
                      '       ''우리사주비율'', round(B.boyuju/'+floattostr(SKBBjusic)+'*100,2) boyuju                                       ' +
                      '  From (Select Count(distinct decode(nvl(AA.dpst,0) - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0),0,null, AA.empno)) empcnt, ' +
                      '               Sum(nvl(AA.dpst,0)) totalju, Sum(nvl(AA.inchul,0)- nvl(BB.wdstcnt,0)) inchulju,                        ' +
                      '               Sum(nvl(AA.dpst,0)  - nvl(AA.inchul,0) + nvl(BB.wdstcnt,0)) boyuju                                     ' +
                      '          From (Select divseqnum, empno, Sum(dpstcnt) dpst, Sum(wrcnt) inchul From psdphis                            ' +
                      '                 Group by divseqnum, empno  ) AA,                                                                     ' +
                      '               (Select divseqnum, empno, Sum(wdstcnt) wdstcnt From psowhis                                            ' +
                      '                 Where subdate >   '''+wk_st_date+'''                                                                 ' +
                      '                 Group by divseqnum, empno  ) BB                                                                      ' +
                      '         Where AA.divseqnum = BB.divseqnum(+)  And AA.empno     = BB.empno(+)) B,                                     ' +
                      '       (Select stlamt, excpamt,stlamt-excpamt remamt                                                                  ' +
                      '          From (Select Sum(stlamt) stlamt From pslmas Where corpname  <> ''데이콤'') A,                               ' +
                      '               (Select Sum(excpamt) excpamt From psemhis                                                              ' +
                      '                 Where nvl(exmdate, '' '') <= '''+wk_st_date+'''                                                      ' +
                      '                   And corpname <> ''데이콤'') b ) c                                                                  ' ;
          open;
    //Edit1.Text := Sql.Text;
     end;
end;

// 실행
procedure TF_psc22001.BB_prtClick(Sender: TObject);
begin
     P_help.Caption := ' 작업중입니다...';
     sendmessage(p_help.handle,WM_PAINT,0,0);
     F_psc22003.QuickRep1.Preview;
end;

// 설정
procedure TF_psc22001.BB_psetClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

// 종료
procedure TF_psc22001.BB_closeClick(Sender: TObject);
begin
     close;
end;

procedure TF_psc22001.WORKDATE_ENTER(Sender: TObject);
begin
     DataAllClear;
end;

procedure TF_psc22001.WORKDATE_KEYPRESS(Sender: TObject);
begin
     DataAllClear;
end;

procedure TF_psc22001.DataAllClear;
begin
     PA_1.CAPTION  := '';
     PA_2.CAPTION  := '';
     PA_3.CAPTION  := '';
     PA_4.CAPTION  := '';
     PA_5.CAPTION  := '';
     PA_6.CAPTION  := '';
     PA_7.CAPTION  := '';
     PA_8.CAPTION  := '';
     PA_9.CAPTION  := '';
     PA_10.CAPTION := '';
     PA_11.CAPTION := '';
     PA_12.CAPTION := '';
     PA_13.CAPTION := '';
     PA_14.CAPTION := '';
     PA_15.CAPTION := '';
end;

procedure TF_psc22001.RetrieveData;
begin
     IF       CB_cha.Text = '1차회사'     THEN
     BEGIN
          WK_DIVSEQNUM := '1';
          WK_STLORG    := 'ZZ';
     END
     ELSE IF  CB_cha.Text = '2차회사'     THEN
     BEGIN
          WK_DIVSEQNUM := '2';
          WK_STLORG    := 'ZZ';
     END
     ELSE IF  CB_cha.Text = '2차외환은행' THEN
     BEGIN
          WK_DIVSEQNUM := '2';
          WK_STLORG    := '005';
     END
     ELSE IF  CB_cha.Text = '2차소계'     THEN
     BEGIN
          WK_DIVSEQNUM := '2';
          WK_STLORG    := ''  ;
     END
     ELSE IF  CB_cha.Text = '3차회사'     THEN
     BEGIN
          WK_DIVSEQNUM := '3';
          WK_STLORG    := 'ZZ';
     END
     ELSE IF  CB_cha.Text = '3차하나은행' THEN
     BEGIN
          WK_DIVSEQNUM := '3';
          WK_STLORG    := '081';
     END
     ELSE IF  CB_cha.Text = '3차소계'     THEN
     BEGIN
          WK_DIVSEQNUM := '3';
          WK_STLORG    := ''  ;
     END
     ELSE IF  CB_cha.Text = '4차하나은행' THEN
     BEGIN
          WK_DIVSEQNUM := '4';
          WK_STLORG    := '081';
     END
     ELSE IF  CB_cha.Text = '4차제일은행' THEN
     BEGIN
          WK_DIVSEQNUM := '4';
          WK_STLORG    := '023';
     END
     ELSE IF  CB_cha.Text = '4차소계'     THEN
     BEGIN
          WK_DIVSEQNUM := '4';
          WK_STLORG    := ''  ;
     END
     ELSE IF  CB_cha.Text = '5차농협1'    THEN
     BEGIN
          WK_DIVSEQNUM := '5';
          WK_STLORG    := '011';
     END
     ELSE IF  CB_cha.Text = '5차농협2'    THEN
     BEGIN
          WK_DIVSEQNUM := '5';
          WK_STLORG    := '010';
     END
     ELSE IF  CB_cha.Text = '5차소계'     THEN
     BEGIN
          WK_DIVSEQNUM := '5';
          WK_STLORG    := ''  ;
     END
     ELSE IF  CB_cha.Text = '6차자비'     THEN
     BEGIN
          WK_DIVSEQNUM := '6';
          WK_STLORG    := 'ZS'  ;
     END
     ELSE IF  CB_cha.Text = '총계회사'    THEN
     BEGIN
          WK_DIVSEQNUM := '9';
          WK_STLORG    := 'ZZ';
     END
     ELSE IF  CB_cha.Text = '총계은행'    THEN
     BEGIN
          WK_DIVSEQNUM := '9';
          WK_STLORG    := 'XX';
     END
     ELSE
     BEGIN
          WK_DIVSEQNUM := '9';
          WK_STLORG    := ''  ;
     END;

     //----------- 대출기간 이율 --------------
     IF  WK_DIVSEQNUM < '6' THEN
     BEGIN
          sqlstr := 'SELECT DISTINCT DIVSEQNUM ,STLORG ,STLDATE ,STLEDATE , STIRATE ' +
                    '  FROM PSHLBAS'                                                  +
                    ' WHERE DIVSEQNUM = '                              + WK_DIVSEQNUM;

          IF  WK_STLORG<>'' THEN     sqlstr:=sqlstr + '   AND STLORG = ''' + WK_STLORG+''' ' ;

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_1.CAPTION := Copy(Query1.FieldByName('STLDATE').AsString,1,4) + '/' +
                          Copy(Query1.FieldByName('STLDATE').AsString,5,2) + '/' +
                          Copy(Query1.FieldByName('STLDATE').AsString,7,2);

          PA_2.CAPTION := Copy(Query1.FieldByName('STLEDATE').AsString,1,4) + '/' +
                          Copy(Query1.FieldByName('STLEDATE').AsString,5,2) + '/' +
                          Copy(Query1.FieldByName('STLEDATE').AsString,7,2);

          PA_3.CAPTION := Query1.FieldByName('STIRATE').AsString;
     END
     ELSE
     BEGIN
          PA_1.CAPTION := '';
          PA_2.CAPTION := '';
          PA_3.CAPTION := '';
     END;
     //-- 차수별 인원수
     IF WK_DIVSEQNUM < '9' THEN
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT(EMPNO))  CT1        '+
                    '  FROM PSDPHIS                            '+
                    ' WHERE DIVSEQNUM = ' + WK_DIVSEQNUM        ;
          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_4.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT(EMPNO)) CT2         '+
                    '  FROM PSDPHIS                            ';
          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_4.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT2').Asfloat);
     END;

     //-- 대출자 대출기관별 인원
     IF ( WK_DIVSEQNUM < '9' ) AND ( WK_STLORG <> '' )THEN
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) CT1                '+
                    '  FROM PSLMAS                                   '+
                    ' WHERE CORPNAME   <> ''데이콤''                 '+
                    '   AND DIVSEQNUM  = ''' + WK_DIVSEQNUM  + '''   '+
                    '   AND STLORG     = ''' + WK_STLORG     + '''   '+
                    '   AND STIRAMT    <> 0                          ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_6.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM < '9' ) AND ( WK_STLORG = '' )THEN
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) CT2                '+
                    '  FROM PSLMAS                                   '+
                    ' WHERE CORPNAME   <> ''데이콤''                 '+
                    '   AND DIVSEQNUM  = ''' + WK_DIVSEQNUM  + '''   '+
                    '   AND STIRAMT    <> 0                          ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_6.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT2').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM = '9' ) AND ( WK_STLORG = 'XX' )THEN
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) CT2                '+
                    '  FROM PSLMAS                                   '+
                    ' WHERE CORPNAME <> ''데이콤''                   '+
                    '   AND STLORG   NOT IN  ( ''ZZ'' )              '+    // IN ( ''05'',''81'')
                    '   AND STIRAMT  <>  0                           ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_6.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT2').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM = '9' ) AND ( WK_STLORG = 'ZZ' )THEN
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) CT2                '+
                    '  FROM PSLMAS                                   '+
                    ' WHERE CORPNAME <> ''데이콤''                   '+
                    '   AND STLORG   = ''ZZ''                        '+
                    '   AND STIRAMT  <> 0                            ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_6.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT2').Asfloat);
     END
     ELSE
     BEGIN
          SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) CT2                '+
                    '  FROM PSLMAS                                   '+
                    ' WHERE CORPNAME <> ''데이콤''                   '+
                    '   AND STIRAMT  <> 0                            ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_6.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT2').Asfloat);
     END;
     //-- 잔여 주식수 0인 인원수
     IF WK_DIVSEQNUM < '9' THEN
     BEGIN
          SQLSTR := ' select  COUNT(DISTINCT AA.EMPNO) CT3                                     '+
                    '   from ( SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL '+
                    '            FROM psdphis a                                                '+
                    '           GROUP BY DIVSEQNUM, empno  ) AA,                               '+
                    '        ( select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                   '+
                    '            from PSowHIS                                                  '+
                    '           where subdate >   ''' + WK_ST_DATE + '''                       '+
                    '           GROUP BY DIVSEQNUM, empno ) BB                                 '+
                    '  WHERE AA.DIVSEQNUM = ''' + WK_DIVSEQNUM  + '''                          '+
                    '    AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
                    '    AND AA.empno     = BB.empno(+)                                        '+
                    '    AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0         ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_5.CAPTION := formatfloat('###,##0',STRTOINT(Query1.FieldByName('CT3').AsString) );
     END
     ELSE
     BEGIN
          SQLSTR := ' select  COUNT(DISTINCT AA.EMPNO) CT3                                     '+
                    '   from ( SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL '+
                    '            FROM psdphis a                                                '+
                    '           GROUP BY DIVSEQNUM, empno  ) AA,                               '+
                    '        ( select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                   '+
                    '            from PSowHIS                                                  '+
                    '           where subdate >   ''' + WK_ST_DATE + '''                       '+
                    '           GROUP BY DIVSEQNUM, empno ) BB                                 '+
                    '  WHERE AA.DIVSEQNUM   = BB.DIVSEQNUM(+)                                  '+
                    '    AND AA.empno       = BB.empno(+)                                      '+
                    '    AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0         ';
          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_5.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT3').Asfloat);
     END;

     //-- 대부기관별 차수별 주식수
     IF ( WK_DIVSEQNUM < '9' ) AND ( WK_STLORG <> '' )THEN
     BEGIN
          SQLSTR := 'SELECT BB.CT1 , BB.AMT1 , NVL(AA.AMT2_1,0) + CC.AMT2_2  AMT2,                   '+
   	  	    ' 	             BB.AMT1 - NVL(AA.AMT2_1,0) - CC.AMT2_2  AMT3                    '+
                    '  FROM (                                                                        '+
                    '         SELECT SUM(A.STLAMT / B.ISSUEAMT)              CT1,                    '+
                    '                ROUND(SUM(A.STLAMT) /1000000,0)         AMT1                    '+
                    '           FROM PSLMAS    A,                                                    '+
   	            '                PSHSBAS   B                                                     '+
                    '          WHERE A.DIVSEQNUM = B.DIVSEQNUM                                       '+
                    '            AND A.DIVSEQNUM =  ''' + WK_DIVSEQNUM  +        '''                 '+
                    '            AND A.STLORG    =  ''' + WK_STLORG     +        '''                 '+
                    '            AND A.CORPNAME  <> ''데이콤''                                       '+
                    '       ) BB,                                                                    '+    //GROUP BY A.DIVSEQNUM , A.STLORG ) BB,
   	  	    '	    ( SELECT SUM(A.EXCPAMT) AMT2_1                                           '+
   	  	    ' 	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.DIVSEQNUM =  ''' + WK_DIVSEQNUM  +        '''                 '+
                    '            AND A.STLORG    =  ''' + WK_STLORG     +        '''                 '+
   	  	    ' 	      	 AND A.CORPNAME  <> ''데이콤''                                       '+
   	  	    '		 AND A.exdate (+) <= ''19900101'') AA,                               '+
   	  	    '       ( SELECT ROUND(SUM(A.EXCPAMT) / 1000000,0) AMT2_2                        '+
   	  	    '	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.DIVSEQNUM  =  ''' + WK_DIVSEQNUM  +        '''                '+
                    '            AND A.STLORG     =  ''' + WK_STLORG     +        '''                '+
   	  	    '		 AND A.CORPNAME   <> ''데이콤''                                      '+
   	  	    '		 AND A.exdate between ''199001'' and ''' + WK_ST_DATE + '''' + ') CC ';
          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_7.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT1').Asfloat);
          PA_8.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT2').Asfloat);
          PA_9.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT3').Asfloat);
          PA_10.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM < '9' ) AND ( WK_STLORG = '' )THEN
     BEGIN
          SQLSTR := 'SELECT BB.CT1 , BB.AMT1 , NVL(AA.AMT2_1,0) + CC.AMT2_2 AMT2,                    '+
                    ' 	             BB.AMT1 - NVL(AA.AMT2_1,0) - CC.AMT2_2 AMT3                     '+
                    '  FROM (                                                                        '+
                    '         SELECT SUM(A.STLAMT / B.ISSUEAMT)               CT1,                   '+
                    '                ROUND(SUM(A.STLAMT) /1000000,0)          AMT1                   '+
                    '           FROM PSLMAS    A,                                                    '+
                    '                PSHSBAS   B                                                     '+
                    '          WHERE A.DIVSEQNUM = B.DIVSEQNUM                                       '+
                    '            AND A.DIVSEQNUM =  ''' + WK_DIVSEQNUM  +        '''                 '+
                    '            AND A.CORPNAME <> ''데이콤''                                        '+
                    '       ) BB,                                                                    '+    //GROUP BY A.DIVSEQNUM , A.STLORG ) BB,
                    '	    ( SELECT SUM(A.EXCPAMT) AMT2_1                                           '+
                    ' 	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.DIVSEQNUM =  ''' + WK_DIVSEQNUM  +        '''                 '+
                    ' 	         AND A.CORPNAME <> ''데이콤''                                        '+
                    '	         AND A.exdate (+) <= ''19900101'') AA,                               '+
                    '       ( SELECT ROUND(SUM(A.EXCPAMT) / 1000000,0) AMT2_2                        '+
                    '	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.DIVSEQNUM =  ''' + WK_DIVSEQNUM  +        '''                 '+
                    '	         AND A.CORPNAME  <> ''데이콤''                                       '+
                    '		 AND A.exdate between ''199001'' and ''' + WK_ST_DATE + '''' + ') CC ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_7.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT1').Asfloat);
          PA_8.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT2').Asfloat);
          PA_9.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT3').Asfloat);
          PA_10.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM = '9' ) AND ( WK_STLORG = 'XX' )THEN
     BEGIN
          SQLSTR := 'SELECT BB.CT1 , BB.AMT1 , NVL(AA.AMT2_1,0) + CC.AMT2_2 AMT2,                    '+
   	  	    ' 	             BB.AMT1 - NVL(AA.AMT2_1,0) - CC.AMT2_2 AMT3                     '+
                    '  FROM (                                                                        '+
                    '         SELECT SUM(A.STLAMT / B.ISSUEAMT)             CT1,                     '+
                    '                ROUND(SUM(A.STLAMT) /1000000,0)        AMT1                     '+
                    '           FROM PSLMAS    A,                                                    '+
   	            '                PSHSBAS   B                                                     '+
                    '          WHERE A.DIVSEQNUM = B.DIVSEQNUM                                       '+
                    '            AND A.STLORG    NOT   IN ( ''ZZ'' )                                 '+    // IN ( ''05'',''81'')
                    '            AND A.CORPNAME  <> ''데이콤''                                       '+
                    '       ) BB,                                                                    '+    //GROUP BY A.DIVSEQNUM , A.STLORG ) BB,
   	  	    '	    ( SELECT SUM(A.EXCPAMT) AMT2_1                                           '+
   	  	    ' 	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.STLORG    NOT   IN ( ''ZZ'' )                                 '+    // IN ( ''05'',''81'')
   	  	    ' 	         AND A.CORPNAME  <> ''데이콤''                                       '+
   	  	    '		 AND A.exdate(+) <= ''19900101'') AA,                                '+
   	  	    '       ( SELECT ROUND(SUM(A.EXCPAMT) / 1000000,0) AMT2_2                        '+
   	  	    '	        FROM PSEMHIS A                                                       '+
                    '          WHERE A.STLORG    NOT   IN ( ''ZZ'' )                                 '+    // IN ( ''05'',''81'')
   	  	    '	         AND A.CORPNAME  <> ''데이콤''                                       '+
   	  	    '		 AND A.exdate between ''199001'' and ''' + WK_ST_DATE + '''' + ') CC ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_7.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT1').Asfloat);
          PA_8.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT2').Asfloat);
          PA_9.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT3').Asfloat);
          PA_10.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE IF ( WK_DIVSEQNUM = '9' ) AND ( WK_STLORG = 'ZZ' )THEN
     BEGIN
          SQLSTR := 'SELECT BB.CT1 , BB.AMT1 , NVL(AA.AMT2_1,0) + CC.AMT2_2 AMT2,                     '+
   	  	    ' 	             BB.AMT1 - NVL(AA.AMT2_1,0) - CC.AMT2_2 AMT3                      '+
                    '  FROM (                                                                         '+
                    '         SELECT SUM(A.STLAMT / B.ISSUEAMT)             CT1,                      '+
                    '                ROUND(SUM(A.STLAMT) /1000000,0)        AMT1                      '+
                    '           FROM PSLMAS    A,                                                     '+
   	            '                PSHSBAS   B                                                      '+
                    '          WHERE A.DIVSEQNUM = B.DIVSEQNUM                                        '+
                    '            AND A.STLORG    =  ''' + WK_STLORG     +        '''                  '+
                    '            AND A.CORPNAME  <> ''데이콤''                                        '+
                    '       ) BB,                                                                     '+    //GROUP BY A.DIVSEQNUM , A.STLORG ) BB,
   	  	    '	    ( SELECT SUM(A.EXCPAMT) AMT2_1                                            '+
   	  	    ' 	        FROM PSEMHIS A                                                        '+
                    '          WHERE A.STLORG    =  ''' + WK_STLORG     +        '''                  '+
   	  	    ' 	         AND A.CORPNAME  <> ''데이콤''                                        '+
   	  	    '		 AND A.exdate(+) <= ''19900101'') AA,                                 '+
   	  	    '       ( SELECT ROUND(SUM(A.EXCPAMT) / 1000000,0) AMT2_2                         '+
   	  	    '	        FROM PSEMHIS A                                                        '+
                    '          WHERE A.STLORG    =  ''' + WK_STLORG     +        '''                  '+
   	  	    '	         AND A.CORPNAME  <> ''데이콤''                                        '+
   	  	    '		 AND A.exdate between ''199001'' and ''' + WK_ST_DATE + '''' + ') CC  ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_7.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT1').Asfloat);
          PA_8.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT2').Asfloat);
          PA_9.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT3').Asfloat);
          PA_10.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END
     ELSE
     BEGIN
          SQLSTR := 'SELECT BB.CT1 , BB.AMT1 , NVL(AA.AMT2_1,0) + CC.AMT2_2 AMT2,                     '+
   	  	    ' 	             BB.AMT1 - NVL(AA.AMT2_1,0) - CC.AMT2_2 AMT3                      '+
                    '  FROM (                                                                         '+
                    '         SELECT SUM(A.STLAMT/B.ISSUEAMT)               CT1,                      '+
                    '                ROUND(SUM(A.STLAMT) /1000000,0)        AMT1                      '+
                    '           FROM PSLMAS    A,                                                     '+
   	            '                PSHSBAS   B                                                      '+
                    '          WHERE A.CORPNAME  <> ''데이콤''                                        '+
                    '            AND A.DIVSEQNUM = B.DIVSEQNUM) BB,                                   '+    //GROUP BY A.DIVSEQNUM , A.STLORG ) BB,
   	  	    '	    ( SELECT SUM(A.EXCPAMT) AMT2_1                                            '+
   	  	    ' 	        FROM PSEMHIS A                                                        '+
                    '          WHERE A.CORPNAME  <> ''데이콤''                                        '+
   	  	    '	         AND A.exdate(+) <= ''19900101'') AA,                                 '+
   	  	    '       ( SELECT ROUND(SUM(A.EXCPAMT) / 1000000,0) AMT2_2                         '+
   	  	    '	        FROM PSEMHIS A                                                        '+
                    '          WHERE A.CORPNAME  <> ''데이콤''                                        '+
   	  	    '		 AND A.exdate between ''199001'' and ''' + WK_ST_DATE + '''' + ') CC  ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_7.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT1').Asfloat);
          PA_8.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT2').Asfloat);
          PA_9.CAPTION  := formatfloat('###,##0',Query1.FieldByName('AMT3').Asfloat);
          PA_10.CAPTION := formatfloat('###,##0',Query1.FieldByName('CT1').Asfloat);
     END;

     //-- 차수별 사주 주식수
     IF WK_DIVSEQNUM <> '9' THEN
     BEGIN
          SQLSTR := ' select  SUM(AA.DPST) CNT1,  SUM(NVL(AA.INCHUL,0))-SUM(NVL(BB.wdstcnt,0))     CNT2, '+
                    '         SUM(NVL(AA.DPST,0)) - SUM(NVL(AA.INCHUL,0)) + SUM(NVL(BB.wdstcnt,0)) CNT3  '+
                    '  from ( SELECT DIVSEQNUM, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                   '+
                    '           FROM psdphis a                                                           '+
                    '          GROUP BY DIVSEQNUM ) AA,                                                  '+
                    '       ( select DIVSEQNUM, sum(wdstcnt) wdstcnt                                     '+
                    '           from PSowHIS                                                             '+
                    '          where subdate >   ''' + WK_ST_DATE + '''                                  '+
                    '          GROUP BY DIVSEQNUM ) BB                                                   '+
                    '  WHERE AA.DIVSEQNUM = ''' + WK_DIVSEQNUM  + '''                                    '+
                    '    AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                              ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_11.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT1').Asfloat);
          PA_12.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT2').Asfloat);
          PA_13.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT3').Asfloat);
     END
     ELSE
     BEGIN
          SQLSTR := ' select  SUM(AA.DPST) CNT1,  SUM(NVL(AA.INCHUL,0))-SUM(NVL(BB.wdstcnt,0)) CNT2 ,    '+
                    '         SUM(NVL(AA.DPST,0)) - SUM(NVL(AA.INCHUL,0)) + SUM(NVL(BB.wdstcnt,0)) CNT3  '+
                    '  from ( SELECT DIVSEQNUM , SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                  '+
                    '           FROM psdphis a                                                           '+
                    '          GROUP BY DIVSEQNUM  ) AA,                                                 '+
                    '       ( select DIVSEQNUM, sum(wdstcnt) wdstcnt                                     '+
                    '           from PSowHIS                                                             '+
                    '          where subdate >   ''' + WK_ST_DATE + '''                                  '+
                    '          GROUP BY DIVSEQNUM ) BB                                                   '+
                    '  WHERE AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                              ';

          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_11.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT1').Asfloat);
          PA_12.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT2').Asfloat);
          PA_13.CAPTION := formatfloat('###,##0',Query1.FieldByName('CNT3').Asfloat);

     END;
     //-- 취득가
     IF WK_DIVSEQNUM < '9' THEN
     BEGIN
          sqlstr := 'SELECT ISSUEAMT                              '+
                    '  FROM PSHSBAS                               '+
                    ' WHERE DIVSEQNUM = ''' + WK_DIVSEQNUM  + ''' ';
          Query1.Close;
          Query1.Sql.Clear;
          Query1.Sql.Add(sqlstr);
          Query1.Open;

          PA_14.CAPTION := formatfloat('###,##0',Query1.FieldByName('ISSUEAMT').Asfloat);
     END
     ELSE
     BEGIN
          PA_14.CAPTION := '';
     END;
end;

procedure TF_psc22001.work_dateExit(Sender: TObject);
begin
     WK_ST_DATE  := WORK_DATE.TEXT;
     RetrieveData;
end;

procedure TF_psc22001.Bt_ExcelClick(Sender: TObject);
var
     subForm1 : TF_psc22004;
begin
     subForm1 := TF_psc22004.Create(self);
     subForm1.Show;
end;


procedure TF_psc22001.BB_ExcelprnClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
begin
     WK_ST_DATE  := WORK_DATE.TEXT;
     ExcelData1;
     { //전체자료 추출할때..}
     if  Qry1.RecordCount < 1 then
     begin
          showmessage('엑셀 변환할 자료가 없습니다.');
          exit;
     end;

     XArr := VarArrayCreate([1, 17], VarVariant);
     try
          XL := CreateOLEObject('Excel.Application');
     except
          MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
          Exit;
     end;

     XL.WorkBooks.Add; //새로운 페이지 생성
     XL.Visible            := false;
     XL.WorkSheets[1].Name := '총괄표';     //시트명 부여
     XL.Range['A1:Q2'].Merge;               //셀 병합

     //TITLE NAME 설정
     XL.Range['A1'].value     := '우리사주 주식수 및 대출금 총괄표';
     XL.Range['A1'].font.Size := 16;

     XArr[ 1]  := '작성기준일'   ;
     XArr[ 2]  := copy(WK_ST_DATE,1,4)+'.'+
                  copy(WK_ST_DATE,5,2)+'.'+
                  copy(WK_ST_DATE,7,2);
     XArr[15]  := '(단위:원)'     ;
     XL.Range['A3' , 'Q3'].Value := XArr;

     XL.Range['A4:A5'].Merge;
     XL.Range['B4:B5'].Merge;
     XL.Range['C4:C5'].Merge;
     XL.Range['D4:D5'].Merge;
     XL.Range['E4:E5'].Merge;
     XL.Range['F4:H4'].Merge;
     XL.Range['I4:N4'].Merge;
     XL.Range['O4:O5'].Merge;
     XL.Range['P4:P5'].Merge;
     XL.Range['Q4:Q5'].Merge;

     //컬럼명 지정_서브타이블 지정
     XL.Range['A4','A5'].value  := '구분'              ;
     XL.Range['B4','B5'].value  := '대출기관'          ;
     XL.Range['C4','C5'].value  := '대출기간From'      ;
     XL.Range['D4','D5'].value  := '대출기간To'        ;
     XL.Range['E4','E5'].value  := '이율'              ;
     XL.Range['F4','H4'].value  := '조합원(중복자제외)';
     XL.Range['F5','F5'].value  := '조합원수'          ;
     XL.Range['G5','G5'].value  := '주식보유'          ;
     XL.Range['H5','H5'].value  := '대출자'            ;
     XL.Range['I4','N4'].value  := '대부 현황'         ;
     XL.Range['I5','I5'].value  := '대부금액'          ;
     XL.Range['J5','J5'].value  := '예탁주'            ;
     XL.Range['K5','K5'].value  := '상환금액'          ;
     XL.Range['L5','L5'].value  := '인출주'            ;
     XL.Range['M5','M5'].value  := '잔액'              ;
     XL.Range['N5','N5'].value  := '잔여주'            ;
     XL.Range['O4','O5'].value  := '취득가'            ;
     XL.Range['P4','P5'].value  := '비고1'             ;
     XL.Range['Q4','Q5'].value  := '비고2'             ;
     k := 5;
     for i := 1 to 17 do
     begin
          XL.Range[CHR(64 + i)+ '4', CHR(64 + i) + '5'].HorizontalAlignment := 3;
          XL.Range[CHR(64 + i)+ '4', CHR(64 + i) + '5'].Interior.Color      := $00CBF0B3;
          XL.Range[CHR(64 + i)+ '4', CHR(64 + i) + '5'].font.Bold           := True;
     end;

     //검색된 자료를 excel에 export처리 시킨다.
     Qry1.First;

     for i := 1 to  Qry1.RecordCount do
     begin
          XArr[ 1]  := Qry1.FieldbyName('구분').AsString;
          XArr[ 2]  := Qry1.FieldByName('대출기관').AsString;
          XArr[ 3]  := Qry1.FieldbyName('대출기간From').AsString;
          XArr[ 4]  := Qry1.FieldbyName('대출기간To').AsString;
          XArr[ 5]  := Qry1.FieldByName('이율').AsString;
          XArr[ 6]  := Qry1.FieldByName('조합원수').AsString;
          XArr[ 7]  := Qry1.FieldByName('주식보유자').AsString;
          XArr[ 8]  := Qry1.FieldByName('대출자').AsString;
          XArr[ 9]  := Qry1.FieldByName('대부금액').AsString;
          XArr[10]  := Qry1.FieldByName('예탁주').AsString;
          XArr[11]  := Qry1.FieldByName('상환금액').AsString;
          XArr[12]  := Qry1.FieldByName('인출주').AsString;
          XArr[13]  := Qry1.FieldByName('잔액').AsString;
          XArr[14]  := Qry1.FieldByName('잔여주').AsString;
          XArr[15]  := Qry1.FieldByName('취득가').AsString;
          XArr[16]  := Qry1.FieldByName('비고1').AsString;
          XArr[17]  := Qry1.FieldByName('비고2').AsString;
          XL.Range['A' + IntToStr(k+1), 'Q' + IntToStr(k+1)].Value := XArr;
          inc(k);
          Qry1.Next;
     end;
     //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
     XL.Range['A1', 'Q' + IntToStr(k)].Borders.LineStyle   := 1;           //테두리선을 만든다.  1은 실선
     XL.Range['A1', 'Q' + IntToStr(k)].Borders.Weight      := 2;           //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
     XL.Range['A1', 'Q' + IntToStr(k)].Borders.ColorIndex  := 1;           //테두리선 색상설정  1은 검은색
     XL.Range['A1', 'Q' + IntToStr(k)].font.name           := '굴림체';
     XL.Range['A1', 'A1'].HorizontalAlignment              := 3;           //가운데 정렬
     XL.Range['A3', 'Q' + IntToStr(k)].font.Size           := 9;
     XL.Range['A4', 'Q5'].HorizontalAlignment              := 3;           //가운데 정렬
     XL.Range['A6', 'Q' + IntToStr(k)].HorizontalAlignment := 1;           //좌측정렬
     XL.Range['A1', 'Q' + IntToStr(k)].Select;                             //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
     XL.Selection.Columns.AutoFit;                                         //자동정렬
     XL.Range['A6', 'A6'].Select;                                          //A4열에 커서 위치시킴
     XL.Visible          := true;                                          //엑셀자료 보여줌
     Screen.Cursor       := crDefault;
end;

end.
