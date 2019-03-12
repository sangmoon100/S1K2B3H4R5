{===================== Program Header ==========================================
 PROGRAM-NAME      : PSH1050A(사내 대출금 통합 조회)
 SYSTEM-NAME       : 복리후생
 SUBSYSTEM-NAME    : 대출금
 Programmer        : 김태호
 Version           : 10.00
 Date              : 2011.12.07

Update Contents
 Version  date(yy.mm.dd)  programmer  description                relevant doc.no
 10.00    2011.12.07      김태호     최초개발본                 설계명세서

================================================================================}
unit PSH10501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnTmaxDeptEdit, StdCtrls, Mask, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnShapeLabel, OnEditMdate,
  ComCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, Tmax_session,
  Db, Tmax_DataSetText, OnInsaCommon, OnTmaxPersonEdit,
  OnEditNumCtl, OnRegistry, TmaxFunc;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Panel2: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    PA_Buttons: TPanel;
    BT_Find: TOnFocusButton;
    BT_Close: TOnFocusButton;
    SB_Help: TStatusBar;
    DbGrid1: TOnGrDbGrid;
    TMaxSession: TTMaxSession;
    DataSource1: TDataSource;
    TDS_Grid: TTMaxDataSet;
    E_deptname: TOnEdit;
    TDS1: TTMaxDataSet;
    E_deptcode: TOnEdit;
    E_empno: TTMaxPersonPopupEdit;
    HelpMemo1: TMemo;
    BB_Help: TOnFocusButton;
    ED_realamt: TOnEdit;
    ED_retire: TOnEdit;
    ED_naked: TOnEdit;
    ED_Total: TOnEdit;
    Label1: TLabel;
    TDS2: TTMaxDataSet;
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure RB_OneClick(Sender: TObject);
    procedure RB_AllClick(Sender: TObject);
    procedure E_empnoEnter(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_empnoReadEnded(Sender: TObject);
    procedure DbGrid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure BB_HelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    GSpass : String; //dsa2000  2005.03.

  public
    { Public declarations }
    FG_Date   : String[8];     //Host Date
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String;        //등급
    All_Flag  : Boolean ;      //if 운영자 ? True : False
    GSorgnum  : String;        // Login조직차수
    GSdeptcode : String;       // Login부서코드
    procedure Retrieve;
    function  StringOfDept(StringOfdeptcode : string): String;
  end;

var
  FM_Main: TFM_Main;

implementation


uses PSH10502;
{$R *.DFM}

procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Retrieve;
var
  common_sql, SqlText, GSmrtodate : String;
begin
     if length(E_empno.empno) < 4  then
     begin
          MessageDlg('조회하려는 사번를 정확히 입력하세요', mtConfirmation, [mbYes], 0);
          E_empno.SetFocus;
          exit;
     end;

     //2016.02.17.hjku..공통쿼리 통합 및 오류 수정.. 최나리씨 요청.
     //           hjku..공통쿼리 동일함은 확인. 주택자금 오류만 변경함.
     common_sql := 'SELECT TYPE1,nvl(LENDAMT,0) LENDAMT,nvl(ASSURANCE,0) ASSURANCE,nvl(CONNECTION,0) CONNECTION, '+#13#10+
                   '       nvl(STOCK,0) STOCK, nvl(RETIRE,0) RETIRE,nvl(NAKED,0) NAKED,                          '+#13#10+
                   '       nvl(SURETYTOT,0) SURETYTOT, nvl(NAKEDTOT,0) NAKEDTOT,nvl(ODDEXCAMT,0) ODDEXCAMT       '+#13#10+
                   '   FROM (                                                                                    '+#13#10+
                   '          SELECT ''주택자금'' TYPE1,                                                                         '+#13#10+
                   '                 EMPNO,                                                                                      '+#13#10+
                   '                 SUM(HSAMT) LENDAMT,                                                                         '+#13#10+
                   '                 SUM(NVL(DECODE(ASSUMETHOD,''2'', REMSUM,                                                    '+#13#10+
                   '                                           ''4'', CASE WHEN (REMSUM -SURETYAMT)  > 0 THEN SURETYAMT          '+#13#10+
                   '                                                                                     ELSE REMSUM             '+#13#10+
                   '                                                                                     END),0)) ASSURANCE,     '+#13#10+
                   '                 SUM(NVL(DECODE(ASSUMETHOD,''3'', REMSUM),0)) CONNECTION,                                    '+#13#10+
                   '                 0 STOCK,                                                                                    '+#13#10+
                   '                 SUM(NVL(DECODE(ASSUMETHOD,''1'', REMSUM,                                                    '+#13#10+
                   '                                           ''4'', CASE WHEN (REMSUM -SURETYAMT) >= 0 THEN REMSUM -SURETYAMT  '+#13#10+
                   '                                                                                     ELSE 0                  '+#13#10+
                   '                                                                                     END),0)) RETIRE,        '+#13#10+
                   '                 0 NAKED,                                                                                    '+#13#10+
                   '                 SUM(NVL(REMSUM,0)) SURETYTOT,                                                               '+#13#10+
                   '                 0 NAKEDTOT,                                                                                 '+#13#10+
                   '                 SUM(NVL(REMSUM,0)) ODDEXCAMT                                                                '+#13#10+
                   '            FROM PKMHSMAS                                                                                    '+#13#10+
                   '           WHERE REMSUM > 0                                                                                  '+#13#10+
                   '           GROUP BY EMPNO                                                                                    '+#13#10+
                   '          UNION ALL                                                                          '+#13#10+
                   '          SELECT ''의료비'' TYPE1,EMPNO ,SUM(LENDAMT) LENDAMT,                               '+#13#10+
                   '                 SUM(DECODE(ASSUMETHOD,''2'',ODDEXCAMT)) ASSURANCE,                          '+#13#10+
                   '             SUM(DECODE(ASSUMETHOD,''3'',ODDEXCAMT)) CONNECTION,0 STOCK,                     '+#13#10+
                   '                 SUM(DECODE(ASSUMETHOD,''1'',ODDEXCAMT)) RETIRE,                             '+#13#10+
                   '                 SUM(DECODE(NVL(ASSUMETHOD,''9''),''9'',ODDEXCAMT)) NAKED,                   '+#13#10+
                   '               SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT                 '+#13#10+
                   '            FROM PKMHOMAS   WHERE ODDEXCAMT > 0   GROUP BY EMPNO                             '+#13#10+
                   '          UNION ALL                                                                          '+#13#10+
                   '          SELECT ''학자금'' TYPE1, EMPNO ,SUM(LENDAMT),0 ASSURANCE,0 CONNECTION,0 STOCK,     '+#13#10+
                   '                 0 RETIRE,SUM(ODDEXCAMT) NAKED,                                              '+#13#10+
                   '               SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT                 '+#13#10+
                   '            FROM PKMSCMAS  WHERE ODDEXCAMT > 0   GROUP BY EMPNO                              '+#13#10+
                   '         UNION ALL                                                                           '+#13#10+
                   '         SELECT ''사우회'' TYPE1,EMPNO , LOANAMT LENDAMT, 0 ASSURANCE, 0 CONNECTION, 0 STOCK,'+#13#10+
                   '                0 RETIRE, JANAMT NAKED, 0 SURETYTOT, JANAMT NAKEDTOT, JANAMT ODDEXCAMT       '+#13#10+
                   '         FROM                                                                                '+#13#10+
                   '         (      SELECT EMPNO, SUM(LOANAMT) LOANAMT, SUM(JANAMT) JANAMT FROM PSMLOAN          '+#13#10+
                   '          WHERE JANAMT > 0   GROUP BY EMPNO     )                                            '+#13#10+
                   '         UNION ALL                                                                           '+#13#10+
                   '        SELECT ''우리사주'' TYPE1, EMPNO , AA LENDAMT, 0 ASSURANCE, 0 CONNECTION,            '+#13#10+
                   '               (BB+CC) * NVL(EE, 0) STOCK, 0 RETIRE,                                         '+#13#10+
                   '             CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                                 '+#13#10+
                   '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKED,                              '+#13#10+
                   '             ((BB + CC) * NVL(EE, 0)) SURETYTOT,                                             '+#13#10+
                   '             CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                                 '+#13#10+
                   '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKEDTOT,                           '+#13#10+
                   '             DD ODDEXCAMT                                                                    '+#13#10+
                   '        FROM                                                                                 '+#13#10+
                   '        (                                                                                    '+#13#10+
                   '          SELECT EMPNO, SUM(STLAMT) AA, SUM(DPSTCNT) BB, SUM(REMCNT) CC, SUM(STIRAMT) DD,    '+#13#10+
                   '              (SELECT CPRICE FROM                                                            '+#13#10+
                   '                (SELECT * FROM PSTOCKBAS A                                                   '+#13#10+
                   ' WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,''YYYYMM''), ''YYYYMM'' ) , -1) , ''YYYYMM'')'+#13#10+
                   '               ORDER BY STOCKDATE DESC                                                       '+#13#10+
                   '                )                                                                            '+#13#10+
                   '              WHERE ROWNUM = 1) EE                                                           '+#13#10+
                   '          FROM                                                                               '+#13#10+
                   '          (                                                                                  '+#13#10+
                   '            SELECT EMPNO, STLAMT , 0 DPSTCNT, 0 REMCNT, STIRAMT, 0 CPRICE                    '+#13#10+
                   '            FROM PSLMAS                                                                      '+#13#10+
                   '            WHERE STIRAMT > 0                                                                '+#13#10+
                   '            UNION ALL                                                                        '+#13#10+
                   '            SELECT  A.EMPNO, 0 STLAMT, 0 DPSTCNT, A.REMCNT, 0 STIRAMT, 0 CPRICE              '+#13#10+
                   '            FROM PSDPHIS A                                                                   '+#13#10+
                   '            WHERE A.EMPNO NOT IN (SELECT EMPNO FROM PSDPSP                                   '+#13#10+
                   '                                  WHERE DIVSEQNUM = 5                                        '+#13#10+
                   '                                    AND EMPNO = A.EMPNO)                                     '+#13#10+
                   '            UNION ALL                                                                        '+#13#10+
                   '            SELECT  A.EMPNO, 0 STLAMT, A.DPSTCNT, 0 REMCNT, 0 STIRAMT, 0 CPRICE              '+#13#10+
                   '            FROM PSDPHIS A                                                                   '+#13#10+
                   '            WHERE A.DIVSEQNUM = 5                                                            '+#13#10+
                   '              AND A.EMPNO IN (SELECT EMPNO FROM PSDPSP                                       '+#13#10+
                   '                              WHERE DIVSEQNUM = 5  AND EMPNO = A.EMPNO)                      '+#13#10+
                   '          )  GROUP BY EMPNO                                                                  '+#13#10+
                   '        )    WHERE DD > 0                                                                    '+#13#10+
                   ' )                                                                                           '+#13#10+
                   ' WHERE EMPNO =''' + Copy(Trim(E_empno.empno),1,4) +'''                                       ';

//◎우리사주 종가입력 : 복리후생/우리사주 >> STOCK OPTION >> SK브로드밴드 종가관리
(*2016.02.17.hjku.. 중복 쿼리 삭제..
     SqlText := 'SELECT TYPE1,nvl(LENDAMT,0) LENDAMT,nvl(ASSURANCE,0) ASSURANCE,nvl(CONNECTION,0) CONNECTION,'+#13#10+
                '       nvl(STOCK,0) STOCK, nvl(RETIRE,0) RETIRE,nvl(NAKED,0) NAKED,                         '+#13#10+
                '       nvl(SURETYTOT,0) SURETYTOT, nvl(NAKEDTOT,0) NAKEDTOT,nvl(ODDEXCAMT,0) ODDEXCAMT      '+#13#10+
                '   FROM (                                                                                   '+#13#10+
                '          SELECT ''주택자금'' TYPE1, EMPNO, SUM(HSAMT) LENDAMT,                             '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM,''4'',                                  '+#13#10+
                '                 CASE WHEN (REMSUM -SURETYAMT)  > 0 THEN   SURETYAMT                  '+#13#10+
  		'        	       WHEN (REMSUM -SURETYAMT) <= 0 THEN  HSAMT -REMSUM END)) ASSURANCE, '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                   '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM,''4'',                                  '+#13#10+
                '                 case when (REMSUM -SURETYAMT) >= 0 then REMSUM -SURETYAMT             '+#13#10+
                ' 		  else 0 end)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,         '+#13#10+
                {//jissi 2013.07.16 쿼리오류수정.
                '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM,''4'',                                  '+#13#10+
                '                 CASE WHEN (HSAMT -SURETYAMT -REMSUM) > 0 THEN   SURETYAMT                  '+#13#10+
  		'        	       WHEN (HSAMT -SURETYAMT -REMSUM) <= 0 THEN  HSAMT -REMSUM END)) ASSURANCE, '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                   '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM,''4'',                                  '+#13#10+
                '                 case when (HSAMT -SURETYAMT-REMSUM) >= 0 then HSAMT -SURETYAMT-REMSUM      '+#13#10+
		' 		  else 0 end)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,         '+#13#10+
                }
                '                 0 NAKEDTOT, SUM(REMSUM) ODDEXCAMT                                          '+#13#10+
                '            FROM PKMHSMAS WHERE REMSUM > 0  GROUP BY EMPNO                                  '+#13#10+
                '          UNION ALL                                                                         '+#13#10+
                '          SELECT ''의료비'' TYPE1,EMPNO ,SUM(LENDAMT) LENDAMT,                              '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''2'',ODDEXCAMT)) ASSURANCE,                         '+#13#10+
                ' 		        SUM(DECODE(ASSUMETHOD,''3'',ODDEXCAMT)) CONNECTION,0 STOCK,          '+#13#10+
                '                 SUM(DECODE(ASSUMETHOD,''1'',ODDEXCAMT)) RETIRE,                            '+#13#10+
                '                 SUM(DECODE(NVL(ASSUMETHOD,''9''),''9'',ODDEXCAMT)) NAKED,                  '+#13#10+
                '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT            '+#13#10+
                '            FROM PKMHOMAS   WHERE ODDEXCAMT > 0   GROUP BY EMPNO                            '+#13#10+
                '          UNION ALL                                                                         '+#13#10+
                '          SELECT ''학자금'' TYPE1, EMPNO ,SUM(LENDAMT),0 ASSURANCE,0 CONNECTION,0 STOCK,    '+#13#10+
                '                 0 RETIRE,SUM(ODDEXCAMT) NAKED,                                             '+#13#10+
                '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT            '+#13#10+
                '            FROM PKMSCMAS  WHERE ODDEXCAMT > 0   GROUP BY EMPNO                                                                 '+#13#10+
               '         UNION ALL                                                                           '+#13#10+
               '         SELECT ''사우회'' TYPE1,EMPNO , LOANAMT LENDAMT, 0 ASSURANCE, 0 CONNECTION, 0 STOCK,'+#13#10+
               '                0 RETIRE, JANAMT NAKED, 0 SURETYTOT, JANAMT NAKEDTOT, JANAMT ODDEXCAMT       '+#13#10+
               '         FROM                                                                                '+#13#10+
               '         (     	SELECT EMPNO, SUM(LOANAMT) LOANAMT, SUM(JANAMT) JANAMT FROM PSMLOAN          '+#13#10+
               '         	WHERE JANAMT > 0   GROUP BY EMPNO     )                                                                                                                                          '+#13#10+
               '         UNION ALL                                                                           '+#13#10+
               '        SELECT ''우리사주'' TYPE1, EMPNO , AA LENDAMT, 0 ASSURANCE, 0 CONNECTION,            '+#13#10+
               '               (BB+CC) * NVL(EE, 0) STOCK, 0 RETIRE,                                         '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                           '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKED,                              '+#13#10+
               '             ((BB + CC) * NVL(EE, 0)) SURETYTOT,                                             '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                           '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKEDTOT,                           '+#13#10+
               '        	   DD ODDEXCAMT                                                              '+#13#10+
               '        FROM                                                                                 '+#13#10+
               '        (                                                                                    '+#13#10+
               '        	SELECT EMPNO, SUM(STLAMT) AA, SUM(DPSTCNT) BB, SUM(REMCNT) CC, SUM(STIRAMT) DD,'+#13#10+
               '        		  (SELECT CPRICE FROM                                                  '+#13#10+
               '        		    (SELECT * FROM PSTOCKBAS A                                         '+#13#10+
               ' WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,''YYYYMM''), ''YYYYMM'' ) , -1) , ''YYYYMM'')'+#13#10+
//               '        			 WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(SYSDATE,''YYYYMM'') -1 '+#13#10+
               '        			 ORDER BY STOCKDATE DESC                                       '+#13#10+
               '        		    )                                                                  '+#13#10+
               '        		  WHERE ROWNUM = 1) EE                                                 '+#13#10+
               '        	FROM                                                                           '+#13#10+
               '        	(                                                                              '+#13#10+
               '        		SELECT EMPNO, STLAMT , 0 DPSTCNT, 0 REMCNT, STIRAMT, 0 CPRICE          '+#13#10+
               '        		FROM PSLMAS                                                            '+#13#10+
               '        		WHERE STIRAMT > 0                                                      '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, 0 DPSTCNT, A.REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.EMPNO NOT IN (SELECT EMPNO FROM PSDPSP                         '+#13#10+
               '        		                      WHERE DIVSEQNUM = 5                              '+#13#10+
               '        		  	   	                AND EMPNO = A.EMPNO)                   '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, A.DPSTCNT, 0 REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.DIVSEQNUM = 5                                                  '+#13#10+
               '        		  AND A.EMPNO IN (SELECT EMPNO FROM PSDPSP                             '+#13#10+
               '        		                  WHERE DIVSEQNUM = 5  AND EMPNO = A.EMPNO)            '+#13#10+
               '        	)  GROUP BY EMPNO                                                                 '+#13#10+
               '        )    WHERE DD > 0                                                                           '+#13#10+
               ' )                                                                                             '+#13#10+
               ' WHERE EMPNO =''' + Copy(Trim(E_empno.empno),1,4) +'''                                         '+#13#10+
               ' UNION ALL   '+#13#10+
               'SELECT ''합계'' TYPE1,nvl(SUM(LENDAMT),0) LENDAMT,nvl(SUM(ASSURANCE),0) ASSURANCE, '+#13#10+
               '       nvl(SUM(CONNECTION),0) CONNECTION, nvl(SUM(STOCK),0) STOCK,          '+#13#10+
               '        nvl(SUM(RETIRE),0) RETIRE,nvl(SUM(NAKED),0) NAKED,                  '+#13#10+
               '       nvl(SUM(SURETYTOT),0) SURETYTOT, nvl(SUM(NAKEDTOT),0) NAKEDTOT,      '+#13#10+
               '       nvl(SUM(ODDEXCAMT),0) ODDEXCAMT                                      '+#13#10+
               '   FROM (                                                                                     '+#13#10+
               '          SELECT ''주택자금'' TYPE1, EMPNO, SUM(HSAMT) LENDAMT,                               '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM,''4'',                                  '+#13#10+
               '                 CASE WHEN (REMSUM -SURETYAMT)  > 0 THEN  SURETYAMT                      '+#13#10+
  	       '                      WHEN (REMSUM -SURETYAMT) <= 0 THEN  HSAMT -REMSUM END)) ASSURANCE, '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                   '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM,''4'',                                  '+#13#10+
               '                 case when (REMSUM -SURETYAMT) >= 0 then REMSUM -SURETYAMT               '+#13#10+
               ' 		  else 0 end)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,                     '+#13#10+
               {//jissi 2013.07.16 쿼리오류수정.
               '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM)) ASSURANCE,                              '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                     '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,   '+#13#10+
               }
               '                 0 NAKEDTOT, SUM(REMSUM) ODDEXCAMT                                            '+#13#10+
               '            FROM PKMHSMAS  WHERE REMSUM > 0   GROUP BY EMPNO                                                                   '+#13#10+
              '          UNION ALL                                                                           '+#13#10+
               '          SELECT ''의료비'' TYPE1,EMPNO ,SUM(LENDAMT) LENDAMT,                                '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''2'',ODDEXCAMT)) ASSURANCE,                           '+#13#10+
               ' 		        SUM(DECODE(ASSUMETHOD,''3'',ODDEXCAMT)) CONNECTION,0 STOCK,           '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',ODDEXCAMT)) RETIRE,                              '+#13#10+
               '                 SUM(DECODE(NVL(ASSUMETHOD,''9''),''9'',ODDEXCAMT)) NAKED,                    '+#13#10+
               '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT             '+#13#10+
               '            FROM PKMHOMAS  WHERE ODDEXCAMT > 0    GROUP BY EMPNO                                                                '+#13#10+
               '          UNION ALL                                                                           '+#13#10+
               '          SELECT ''학자금'' TYPE1, EMPNO ,SUM(LENDAMT),0 ASSURANCE,0 CONNECTION,0 STOCK,      '+#13#10+
               '                 0 RETIRE,SUM(ODDEXCAMT) NAKED,                                               '+#13#10+
               '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT             '+#13#10+
               '            FROM PKMSCMAS   WHERE ODDEXCAMT > 0  GROUP BY EMPNO                                                                 '+#13#10+
               '         UNION ALL                                                                            '+#13#10+
               '         SELECT ''사우회'' TYPE1,EMPNO , LOANAMT LENDAMT, 0 ASSURANCE, 0 CONNECTION, 0 STOCK, '+#13#10+
               '                0 RETIRE, JANAMT NAKED, 0 SURETYTOT, JANAMT NAKEDTOT, JANAMT ODDEXCAMT        '+#13#10+
               '         FROM ( SELECT EMPNO, SUM(LOANAMT) LOANAMT, SUM(JANAMT) JANAMT FROM PSMLOAN           '+#13#10+
               '         	WHERE JANAMT > 0                                                              '+#13#10+
               '         	GROUP BY EMPNO       )            '+#13#10+
               '         UNION ALL                                                                            '+#13#10+
               '        SELECT ''우리사주'' TYPE1, EMPNO , AA LENDAMT, 0 ASSURANCE, 0 CONNECTION,             '+#13#10+
               '               (BB+CC) * NVL(EE, 0) STOCK, 0 RETIRE,                                          '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                            '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKED,                               '+#13#10+
               '             ((BB + CC) * NVL(EE, 0)) SURETYTOT,                                              '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                            '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKEDTOT,                            '+#13#10+
               '        	   DD ODDEXCAMT                                                               '+#13#10+
               '        FROM  (                                                                                     '+#13#10+
               '        	SELECT EMPNO, SUM(STLAMT) AA, SUM(DPSTCNT) BB, SUM(REMCNT) CC, SUM(STIRAMT) DD,'+#13#10+
               '        		  (SELECT CPRICE FROM                                                  '+#13#10+
               '        		    (SELECT * FROM PSTOCKBAS A                                         '+#13#10+
               ' WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,''YYYYMM''), ''YYYYMM'' ) , -1) , ''YYYYMM'')'+#13#10+
//               '        			 WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(SYSDATE,''YYYYMM'') -1 '+#13#10+
               '        			 ORDER BY STOCKDATE DESC                                       '+#13#10+
               '        		    )                                                                  '+#13#10+
               '        		  WHERE ROWNUM = 1) EE                                                 '+#13#10+
               '        	FROM  (  SELECT EMPNO, STLAMT , 0 DPSTCNT, 0 REMCNT, STIRAMT, 0 CPRICE          '+#13#10+
               '        		FROM PSLMAS                                                            '+#13#10+
               '        		WHERE STIRAMT > 0                                                      '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, 0 DPSTCNT, A.REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.EMPNO NOT IN (SELECT EMPNO FROM PSDPSP                         '+#13#10+
               '        		                      WHERE DIVSEQNUM = 5                              '+#13#10+
               '        		  	   	                AND EMPNO = A.EMPNO)                   '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, A.DPSTCNT, 0 REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.DIVSEQNUM = 5                                                  '+#13#10+
               '        		  AND A.EMPNO IN (SELECT EMPNO FROM PSDPSP                             '+#13#10+
               '        		                  WHERE DIVSEQNUM = 5                                  '+#13#10+
               '        			  	          AND EMPNO = A.EMPNO)                         '+#13#10+
               '        	) GROUP BY EMPNO                                                                 '+#13#10+
               '        )  WHERE DD > 0                                                                           '+#13#10+
               ' )                                                                                             '+#13#10+
               ' WHERE EMPNO =''' + Copy(Trim(E_empno.empno),1,4) +'''                                         '+#13#10;
*)

     SqlText :='with loan_list as                                                                     '+#13#10+
               '(                                                                                     '+#13#10+
               common_sql +#13#10+
               ')                                                                                     '+#13#10+
               'select * from loan_list                                                               '+#13#10+
               'union all                                                                             '+#13#10+
               'SELECT ''합계'' TYPE1,nvl(SUM(LENDAMT),0) LENDAMT,nvl(SUM(ASSURANCE),0) ASSURANCE,    '+#13#10+
               '       nvl(SUM(CONNECTION),0) CONNECTION, nvl(SUM(STOCK),0) STOCK,                    '+#13#10+
               '        nvl(SUM(RETIRE),0) RETIRE,nvl(SUM(NAKED),0) NAKED,                            '+#13#10+
               '       nvl(SUM(SURETYTOT),0) SURETYTOT, nvl(SUM(NAKEDTOT),0) NAKEDTOT,                '+#13#10+
               '       nvl(SUM(ODDEXCAMT),0) ODDEXCAMT                                                '+#13#10+
               'from loan_list                                                                        ';


     with TDS_Grid do
     begin
          ServiceName := 'PSH1050A_sel1';
          Close;
          Sql.Clear;
          Sql.Add(SqlText);
          ClearFieldInfo;
          AddField('TYPE1'     , ftString,10);
          AddField('LENDAMT'   , ftfloat, 10);
          AddField('ASSURANCE' , ftfloat, 10);
          AddField('CONNECTION', ftfloat, 10);
          AddField('STOCK'     , ftfloat, 10);
          AddField('RETIRE'    , ftfloat, 10);
          AddField('NAKED'     , ftfloat, 10);
          AddField('SURETYTOT' , ftfloat, 10);
          AddField('NAKEDTOT'  , ftfloat, 10);
          AddField('ODDEXCAMT' , ftfloat, 10);
          //memo1.text := sql.text;
          Open;
          FieldByName('TYPE1').Alignment      := taCenter;
          TFloatField(FieldByName('LENDAMT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('ASSURANCE')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('CONNECTION')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('STOCK')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('RETIRE')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('NAKED')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('SURETYTOT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('NAKEDTOT')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('ODDEXCAMT')).DisplayFormat := '#,##0';

     end;

     if TDS_Grid.RecordCount < 1 then
     begin
          MessageDlg('조회 조건에 맞는 대여금 내역이 존재하지 않습니다.', mtInformation, [mbYes], 0 );
          SB_help.Panels[1].Text := '조회 조건에 맞는 대여금 내역이 존재하지 않습니다.';
          System.Exit;
     end;

(*2016.02.17.hjku.. 중복 쿼리 삭제..
     SqlText := 'SELECT TYPE1,nvl(LENDAMT,0) LENDAMT,nvl(ASSURANCE,0) ASSURANCE,nvl(CONNECTION,0) CONNECTION,'+#13#10+
                '       nvl(STOCK,0) STOCK, nvl(RETIRE,0) RETIRE,nvl(NAKED,0) NAKED,                         '+#13#10+
                '       nvl(SURETYTOT,0) SURETYTOT, nvl(NAKEDTOT,0) NAKEDTOT,nvl(ODDEXCAMT,0) ODDEXCAMT      '+#13#10+
                '   FROM (                                                                                   '+#13#10+
               'SELECT ''합계'' TYPE1,nvl(SUM(LENDAMT),0) LENDAMT,nvl(SUM(ASSURANCE),0) ASSURANCE, '+#13#10+
               '       nvl(SUM(CONNECTION),0) CONNECTION, nvl(SUM(STOCK),0) STOCK,          '+#13#10+
               '        nvl(SUM(RETIRE),0) RETIRE,nvl(SUM(NAKED),0) NAKED,                  '+#13#10+
               '       nvl(SUM(SURETYTOT),0) SURETYTOT, nvl(SUM(NAKEDTOT),0) NAKEDTOT,      '+#13#10+
               '       nvl(SUM(ODDEXCAMT),0) ODDEXCAMT                                      '+#13#10+
               '   FROM (                                                                                     '+#13#10+
               '          SELECT ''주택자금'' TYPE1, EMPNO, SUM(HSAMT) LENDAMT,                               '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM,''4'',                                  '+#13#10+
               '                 CASE WHEN (REMSUM -SURETYAMT)  > 0 THEN   SURETYAMT                  '+#13#10+
  	       '        	       WHEN (REMSUM -SURETYAMT) <= 0 THEN  HSAMT -REMSUM END)) ASSURANCE, '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                   '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM,''4'',                                  '+#13#10+
               '                 case when (REMSUM -SURETYAMT) >= 0 then REMSUM -SURETYAMT             '+#13#10+
               ' 		  else 0 end)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,         '+#13#10+
               {//jissi 2013.07.16 쿼리오류수정.
               '                 SUM(DECODE(ASSUMETHOD,''2'',REMSUM)) ASSURANCE,                              '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''3'',REMSUM)) CONNECTION,0 STOCK,                     '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',REMSUM)) RETIRE,0 NAKED,SUM(REMSUM) SURETYTOT,   '+#13#10+
               }
               '                 0 NAKEDTOT, SUM(REMSUM) ODDEXCAMT                                            '+#13#10+
               '            FROM PKMHSMAS  WHERE REMSUM > 0   GROUP BY EMPNO                                                                   '+#13#10+
              '          UNION ALL                                                                           '+#13#10+
               '          SELECT ''의료비'' TYPE1,EMPNO ,SUM(LENDAMT) LENDAMT,                                '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''2'',ODDEXCAMT)) ASSURANCE,                           '+#13#10+
               ' 		        SUM(DECODE(ASSUMETHOD,''3'',ODDEXCAMT)) CONNECTION,0 STOCK,           '+#13#10+
               '                 SUM(DECODE(ASSUMETHOD,''1'',ODDEXCAMT)) RETIRE,                              '+#13#10+
               '                 SUM(DECODE(NVL(ASSUMETHOD,''9''),''9'',ODDEXCAMT)) NAKED,                    '+#13#10+
               '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT             '+#13#10+
               '            FROM PKMHOMAS  WHERE ODDEXCAMT > 0    GROUP BY EMPNO                                                                '+#13#10+
               '          UNION ALL                                                                           '+#13#10+
               '          SELECT ''학자금'' TYPE1, EMPNO ,SUM(LENDAMT),0 ASSURANCE,0 CONNECTION,0 STOCK,      '+#13#10+
               '                 0 RETIRE,SUM(ODDEXCAMT) NAKED,                                               '+#13#10+
               '          	    SUM(ODDEXCAMT) SURETYTOT,0 NAKEDTOT, SUM(ODDEXCAMT) ODDEXCAMT             '+#13#10+
               '            FROM PKMSCMAS   WHERE ODDEXCAMT > 0  GROUP BY EMPNO                                                                 '+#13#10+
               '         UNION ALL                                                                            '+#13#10+
               '         SELECT ''사우회'' TYPE1,EMPNO , LOANAMT LENDAMT, 0 ASSURANCE, 0 CONNECTION, 0 STOCK, '+#13#10+
               '                0 RETIRE, JANAMT NAKED, 0 SURETYTOT, JANAMT NAKEDTOT, JANAMT ODDEXCAMT        '+#13#10+
               '         FROM ( SELECT EMPNO, SUM(LOANAMT) LOANAMT, SUM(JANAMT) JANAMT FROM PSMLOAN           '+#13#10+
               '         	WHERE JANAMT > 0                                                              '+#13#10+
               '         	GROUP BY EMPNO       )            '+#13#10+
               '         UNION ALL                                                                            '+#13#10+
               '        SELECT ''우리사주'' TYPE1, EMPNO , AA LENDAMT, 0 ASSURANCE, 0 CONNECTION,             '+#13#10+
               '               (BB+CC) * NVL(EE, 0) STOCK, 0 RETIRE,                                          '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                            '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKED,                               '+#13#10+
               '             ((BB + CC) * NVL(EE, 0)) SURETYTOT,                                              '+#13#10+
               '        	   CASE WHEN ((BB + CC) * NVL(EE, 0)) > DD THEN DD                            '+#13#10+
               '               ELSE DD - ((BB + CC) * NVL(EE, 0))    END NAKEDTOT,                            '+#13#10+
               '        	   DD ODDEXCAMT                                                               '+#13#10+
               '        FROM  (                                                                                     '+#13#10+
               '        	SELECT EMPNO, SUM(STLAMT) AA, SUM(DPSTCNT) BB, SUM(REMCNT) CC, SUM(STIRAMT) DD,'+#13#10+
               '        		  (SELECT CPRICE FROM                                                  '+#13#10+
               '        		    (SELECT * FROM PSTOCKBAS A                                         '+#13#10+
               ' WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,''YYYYMM''), ''YYYYMM'' ) , -1) , ''YYYYMM'')'+#13#10+               
//               '        			 WHERE SUBSTR(STOCKDATE, 1,6) = TO_CHAR(SYSDATE,''YYYYMM'') -1 '+#13#10+
               '        			 ORDER BY STOCKDATE DESC                                       '+#13#10+
               '        		    )                                                                  '+#13#10+
               '        		  WHERE ROWNUM = 1) EE                                                 '+#13#10+
               '        	FROM  (  SELECT EMPNO, STLAMT , 0 DPSTCNT, 0 REMCNT, STIRAMT, 0 CPRICE          '+#13#10+
               '        		FROM PSLMAS                                                            '+#13#10+
               '        		WHERE STIRAMT > 0                                                      '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, 0 DPSTCNT, A.REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.EMPNO NOT IN (SELECT EMPNO FROM PSDPSP                         '+#13#10+
               '        		                      WHERE DIVSEQNUM = 5                              '+#13#10+
               '        		  	   	                AND EMPNO = A.EMPNO)                   '+#13#10+
               '        		UNION ALL                                                              '+#13#10+
               '        		SELECT  A.EMPNO, 0 STLAMT, A.DPSTCNT, 0 REMCNT, 0 STIRAMT, 0 CPRICE    '+#13#10+
               '        		FROM PSDPHIS A                                                         '+#13#10+
               '        		WHERE A.DIVSEQNUM = 5                                                  '+#13#10+
               '        		  AND A.EMPNO IN (SELECT EMPNO FROM PSDPSP                             '+#13#10+
               '        		                  WHERE DIVSEQNUM = 5                                  '+#13#10+
               '        			  	          AND EMPNO = A.EMPNO)                         '+#13#10+
               '        	) GROUP BY EMPNO                                                                 '+#13#10+
               '        )  WHERE DD > 0                                                                           '+#13#10+
               ' )                                                                                             '+#13#10+
               ' WHERE EMPNO =''' + Copy(Trim(E_empno.empno),1,4) +'''  )                                       '+#13#10;
*)
     SqlText :='SELECT ''합계'' TYPE1,nvl(SUM(LENDAMT),0) LENDAMT,nvl(SUM(ASSURANCE),0) ASSURANCE,    '+#13#10+
               '       nvl(SUM(CONNECTION),0) CONNECTION, nvl(SUM(STOCK),0) STOCK,                    '+#13#10+
               '        nvl(SUM(RETIRE),0) RETIRE,nvl(SUM(NAKED),0) NAKED,                            '+#13#10+
               '       nvl(SUM(SURETYTOT),0) SURETYTOT, nvl(SUM(NAKEDTOT),0) NAKEDTOT,                '+#13#10+
               '       nvl(SUM(ODDEXCAMT),0) ODDEXCAMT                                                '+#13#10+
               'from (                                                                                '+#13#10+
               common_sql +#13#10+
               ')                                                                                     ';

     with TDS1 do
     begin
          ServiceName := 'PSH1050A_sel1';
          Close;
          Sql.Clear;
          Sql.Add(SqlText);
          ClearFieldInfo;
          AddField('TYPE1'     , ftString,10);
          AddField('LENDAMT'   , ftfloat, 10);
          AddField('ASSURANCE' , ftfloat, 10);
          AddField('CONNECTION', ftfloat, 10);
          AddField('STOCK'     , ftfloat, 10);
          AddField('RETIRE'    , ftfloat, 10);
          AddField('NAKED'     , ftfloat, 10);
          AddField('SURETYTOT' , ftfloat, 10);
          AddField('NAKEDTOT'  , ftfloat, 10);
          AddField('ODDEXCAMT' , ftfloat, 10);
          //memo2.text := sql.text;          
          Open;
          ED_retire.Text :=   FormatFloat('#,##0',FieldByName('retire').AsFloat);
          ED_naked.Text  :=   FormatFloat('#,##0',FieldByName('naked').AsFloat);
     end;



     with TDS2 do
     begin
          ServiceName := 'PKQ5020A_common';
          Close;
          Sql.Clear;
          Sql.Add('SELECT NVL(MAX(MRTODATE), '' '') ');
          Sql.Add('  FROM PKHMRESH ');
          ClearFieldInfo;
          AddField('SEL_DATA'     , ftString,  2000);
          Open;
          GSmrtodate :=FieldByName('SEL_DATA').AsString;
     end;

          // TDS4 SELECT  시 RECODE COUNT 를 1로 나오기 때문에 다시 체크 KTH 20091109  TDS_com 설정.
     with TDS2 do
     begin
           ServiceName := 'HINSA_select';
           Close;
           Sql.Clear;
           Sql.Add('SELECT NVL(B.REALAMT,   0) REALAMT,'' '','' '', '' '','' '' ');
           Sql.Add('  FROM PYCDEPT A, PKHMRESH B  ');
           Sql.Add(' WHERE A.ORGNUM    = B.ORGNUM ');
           Sql.Add('   AND A.DEPTCODE  = B.DEPTCODE ');
           Sql.Add('   AND B.EMPNO     = ''' + Copy(Trim(E_empno.empno),1,4) +'''      ');
           Sql.Add('   AND B.MRTODATE  = '''+ GSmrtodate +''' ');
           ClearFieldInfo;
           AddField('REALAMT' , ftString, 100);
           AddField('field2'  , ftString, 100);
           AddField('field3'  , ftString, 100);
           AddField('field4'  , ftString, 100);
           AddField('field5'  , ftString, 100);
           Open;
           ED_realamt.Text := FormatFloat('#,##0', FieldByName('REALAMT').AsFloat);
           ED_Total.Text   := FormatFloat('#,##0', FieldByName('REALAMT').AsFloat -
                                                  (TDS1.FieldByName('retire').AsFloat +
                                                   TDS1.FieldByName('naked').AsFloat));
     end;

     SB_help.Panels[1].Text := '자료가 조회되었습니다.';

end;


procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
     Retrieve;
end;

function TFM_Main.StringOfDept(StringOfdeptcode : string): String;
var
  LengthOfDept : Integer;
begin
     for  LengthOfDept := Length(StringOfdeptcode) downto 1  do begin
          if  Copy(StringOfdeptcode,LengthOfDept,1) <> '0' then begin
              StringOfDept := Copy(StringOfdeptcode,1,LengthOfDept);
              Exit;
          end;
     end;
end;


procedure TFM_Main.RB_OneClick(Sender: TObject);
begin
     E_empno.Enabled := True;
end;

procedure TFM_Main.RB_AllClick(Sender: TObject);
begin
     E_empno.Enabled := False;
     E_empno.Text    := '';
end;

procedure TFM_Main.E_empnoEnter(Sender: TObject);
begin
     E_empno.Sql  := '';
//     E_empno.Param_deptcode := E_deptCode.Text;
     E_deptcode.Text        := E_empno.deptcode;
     E_deptname.Text        := E_empno.deptname ;
end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
     begin
          E_empno.empno := E_empno.Text;
          E_empno.PL_get_singledata;
          E_deptcode.Text        := E_empno.deptcode;
          E_deptname.Text        := E_empno.deptname ;
          Retrieve;
     end;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := CaFree;
end;

procedure TFM_Main.E_empnoReadEnded(Sender: TObject);
begin
     SB_Help.Panels[1].Text :='';
     E_deptcode.Text        := E_empno.deptcode;
     E_deptname.Text        := E_empno.deptname ;
     Retrieve;
end;

procedure TFM_Main.DbGrid1ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
     if TDS_Grid.FieldByName('type1').AsString <> '합계' then
     begin
          if (Field.FieldName = 'ASSURANCE') or
             (Field.FieldName = 'CONNECTION') or
             (Field.FieldName = 'STOCK') or
             (Field.FieldName = 'RETIRE'){ or
             (Field.FieldName = 'LONGWORKCNT') } then
              Canvas.Brush.Color := $00DDF1EA  //$00FEB4E8   00CBF0B3
          else if  (Field.FieldName = 'NAKED') then
              Canvas.Brush.Color := $00D9E9FD  //$00FEB4E8   00CBF0B3
          else
              Canvas.Brush.Color := clwhite;//$00FEB4E8   00FFFF80   0080FFFF  $00DDF1EA
     end else
     begin
          Canvas.Brush.Color := $00BCE4D7;//$00FEB4E8   00FFFF80   0080FFFF  $00DDF1EA 
     end;


end;

procedure TFM_Main.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '급여시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////  C:\insa\newhana.env
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

{ begin
        if (GSgrade <> '') and (( GSgrade[2] <='C' ) or (GSgrade[3] <='C' )) then  //운영자
          All_Flag := True
        else
          All_Flag := False;

        if GSempno <> '' then
        begin
             E_empno.OnReadEnded := nil;
             E_empno.Text := GSempno;
             E_empno.PL_get_singledata;
             E_empno.OnReadEnded := E_empnoReadEnded;
             E_deptCode.Text    := E_empno.jobdept;
             E_deptName.Text    := E_empno.deptname;
         end;                
         SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
         SendMessage(SB_help.handle,WM_PAINT,0,0);
  end;    }

  if (GSGrade[2] in (['A','B','C'])) OR (GSGrade[3] in (['A','B'])) OR (GSGrade[4] in (['A','B'])) then
  begin
    E_deptcode.Enabled := True;
    E_deptname.Enabled := True;
    E_empno.Enabled    := True;
  end;

  //2014.05.30  dsa2000  홍원영M 요청 : 임사담당자1 그룹 프로그램 권한부여하고 다른이 못보도록 Add
  with TDS2 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add('SELECT Groupid, '' '','' '', '' '','' '' ');
       Sql.Add('  FROM PYMENUUSER                        ');
       Sql.Add(' WHERE EMPNO   = ''' + GSempno +'''      ');
       ClearFieldInfo;
       AddField('field1', ftString, 100);
       AddField('field2', ftString, 100);
       AddField('field3', ftString, 100);
       AddField('field4', ftString, 100);
       AddField('field5', ftString, 100);
       Open;

       if (TDS2.FieldByName('field1').AsString = 'G011') and (GSempno <> '2563') then
       begin
            ShowMessage('권한이 부족합니다.'+#13+#13+'프로그램을 종료합니다.');
            FM_Main.Close;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////
  
end;

end.
