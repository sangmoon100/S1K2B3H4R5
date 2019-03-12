{=============================== Program Header ================================
 PROGRAM-NAME   : 자기/상사 평가 - PET3020A
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 팀원 상사평가
 Programmer     :
 Version        : ver 1.0
 Date           : :2013.09.16
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.09.16    이희용       신규개발                HR팀 요청
================================================================================}
unit HSubForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, OnScheme, StdCtrls, ExtCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Db, Tmax_DataSetText,
  OnFocusButton, OnTmaxInsaData, Tmax_session,OnInsaCommon, DBTables,
  DBGrids, OnEditNumCtl, Math, PeJeonMemo, peoutlookbtn, Comobj, TmaxFunc;

type
  TFM_Sub = class(TForm)
    SF_Sub: TOnSchemeForm;
    DBGrd_E1: TDBGridEh;
    Panel2: TPanel;
    Shape1: TShape;
    DS_Sub: TDataSource;
    DBSet_Sub: TTMaxDataSet;
    Panel3: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Btn_Eval: TOnFocusButton;
    L_empkorname: TLabel;
    Btn_Exit: TOnFocusButton;
    Insa_Session: TTMaxSession;
    Insa_Data: TOnTMaxInsaData;
    DBSet2: TTMaxDataSet;
    RB1: TRadioButton;
    DBGrd_E2: TDBGridEh;
    BT_AllConfirm: TOnFocusButton;
    DBcommon: TTMaxDataSet;
    E_GROUP_AVG: TOnNumberEdit;
    L_Sum: TLabel;
    E_AVGYN_Check: TOnEdit;
    L_Tdev: TOnNumberEdit;
    E_DevYN_Check: TOnEdit;
    RB7: TRadioButton;
    OnFocusButton1: TOnFocusButton;
    Help_View: TPanel;
    bt_close: TPeJeonOutLookBtn;
    Memo1: TMemo;
    E_AVG_2A: TOnNumberEdit;
    E_AVG_1A: TOnNumberEdit;
    E_AVGYN: TOnEdit;
    Excel: TOnFocusButton;
    Print: TOnFocusButton;
    SuperUser: TGroupBox;
    ED_CN: TEdit;
    BT_Sel: TOnFocusButton;
    E_Sql: TEdit;
    procedure BT_SelClick( Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_ExitClick(Sender: TObject);
    procedure Btn_EvalClick(Sender: TObject);
    procedure E_AdminLoginClick(Sender: TObject);
    procedure DS_SubDataChange(Sender: TObject; Field: TField);
    procedure DBGrd_E1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure RB1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrd_E2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BT_AllConfirmClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure DBGrd_E2CellClick(Column: TColumnEh);
    procedure ExcelClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridData;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     FL_Start   : Boolean;
  public
    { Public declarations }
    aaa : Extended;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    pESCORE : string; //역량평가 상향점수(리더십역량 평가 점수와 맞추기위함.2012.11.21)
  end;
var
  FM_Sub     : TFM_Sub;
  Pempno     : string;        //Login사번
  gsEmpno    : String;        //Login사번
  GSkorname  : String;        //Login성명
  GSgrade    : String[10];    //Login등급
  sRabasdate : String;        //평가기준일
  sLoginGrant: String;
  Lwork      : String;
  var_E1empno: String;
  CheckGubun, CheckGubun1, CheckGubun2, CheckGubun3 : String;
  gS_final_comp : String; //최종완료 업적평가에서 바로저장 여부.JSH
  E_AVG_1V_count,E_AVG_1A_count, E_AVG_1B_count, E_AVG_2V_count, E_AVG_2A_count, E_AVG_2B_count : Integer;
  E_AVG_1V_SUM, E_AVG_1A_SUM, E_AVG_1B_SUM, E_AVG_2V_SUM, E_AVG_2A_SUM, E_AVG_2B_SUM : Real;
  E_AVGYN_Type, E_AVGYN_CheckNM1, E_AVGYN_CheckNM2, E_DEVYN_CheckNM : string;
  SqlText : string;
const
  STR_Y = '완료';
  STR_N = '미완료';
  STR_C = '진행전';
  STR_D = '신청';
  STR_X = '미합의';
implementation

uses HMainForm, HMainForm2, Hinsa_TmaxDM, RenewForm, UPrintForm1;
{$R *.DFM}

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  DBGrd_E1.Top  := 127;
  DBGrd_E1.Left :=   8;
  DBGrd_E2.Top  := 127;
  DBGrd_E2.Left :=   8;


  Insa_Session.EnvFileName := GetHomeDir+'\newhana.env';
  Insa_Session.LabelName   := 'HANAROHPER';
  Insa_Session.Connect     := False;
  Insa_Session.Host        := Hinsa_Param(cmdline,10);
  Insa_Session.Port        := '9999';

  try
     Insa_Session.Connect := True;
   except
     Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
     Application.Terminate;
     Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
end;

procedure TFM_Sub.FormShow(Sender: TObject);
begin
  if FL_Start then
  begin
    Application.ProcessMessages;
    FL_Start := False;
    GSgrade         := Hinsa_Param(cmdLine,4);
    SF_sub.Refresh;

    with DBSet2 do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT  Value1                 '+
                  '  FROM pehrebas                '+
                  ' WHERE rabasdate = ''00000000'''+
                  '   AND gubun     = ''00''      '+
                  '   AND sgubun    = ''0001''    ';
      Close;
      ServiceName := 'PED0000A_common';
      ClearFieldInfo;
      AddField('SEL_DATA'    , ftString, 100);
      Open;

      sRabasdate := FieldByName('SEL_DATA').AsString;
//      sRabasdate := '20141130'; //테스트시에...
    end;

    SqlText := 'SELECT Value1 ||'';''|| Value2 from pehrebas '+
               ' where rabasdate = '''+sRabasdate+'''        '+
               '   and gubun     = ''31''                    '+
               '   and sgubun    = ''0002''                  ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

//   L_Fdev.Value := StrToFloat(DataModule_Tmax.Csel_gfd(1));
    if DataModule_Tmax.Csel_gfd(2) <> '' then
      L_Tdev.Value  := strtofLOAT(DataModule_Tmax.Csel_gfd(2));

    pEmpno    := Hinsa_Param(cmdLine,1);
    GSkorname := Hinsa_Param(cmdLine,2);

    if GSgrade[1] > 'B' then sLoginGrant := '일반사용자'
    else                     sLoginGrant := '관리자';


    SqlText := 'SELECT Value1 ||'';''|| Value2||'';''||      '+
               '       Value3 ||'';''|| Value4||'';''||      '+
               '       Value5                                '+
               '  from pehrebas                              '+
               ' where rabasdate = '''+sRabasdate+'''        '+
               '   and gubun     = ''11''                    '+
               '   and sgubun    = ''0005''                  ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

    Workemp1  := DataModule_Tmax.Csel_gfd(1);
    Workemp2  := DataModule_Tmax.Csel_gfd(2);
    Workemp3  := DataModule_Tmax.Csel_gfd(3);
    Workemp4  := DataModule_Tmax.Csel_gfd(4);
    Workemp5  := DataModule_Tmax.Csel_gfd(5);

    L_empkorname.Caption := '('+pEmpno+') '+ GSkorname;
    gsEmpno := pEmpno;

    if (Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
       (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
       (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D') then
    Begin
      SuperUser.visible := True;
      gsEmpno := ED_CN.Text;
    End
    Else
    Begin
      (* 실장(2차 평가자)이상만 접속 가능 2014.10.22 By HeeYong *)
      SqlText := 'SELECT NVL(SUM(DECODE(e2empno, '''+pEmpno+''', 1, 0)), 0) ' +
                 'from PEHREMAS                                             ' +
                 'where rabasdate = ''' + sRabasdate + '''                  ' +
                 '  AND  e2empno  = ''' + pEmpno     + '''                  ' ;

      DataModule_Tmax.Csel_SQL := SqlText;
      DataModule_Tmax.Csel_Open;

      If StrToInt(DataModule_Tmax.Csel_gfd(1)) = 0 Then
      Begin
        MessageDlg('2차 평가자가 아니거나 자기평가를 완료한 피평가자들이 없습니다.' + #13#13 +
                   '               [프로그램은 자동 종료됩니다.]', mtConfirmation, [mbOK],0);
        Application.Terminate;
      end;
      SuperUser.visible := False;
    End;

    GridData;
  end;
end;

procedure TFM_Sub.BT_SelClick(Sender: TObject);
Begin
  gsEmpno := ED_CN.text;

  SqlText := 'SELECT Korname FROM pimpmas ' +
             ' WHERE empno = ''' + gsEmpno +''' ';
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  GSkorname := DataModule_Tmax.Csel_gfd(1);

  L_empkorname.Caption := '('+gsEmpno+') '+ GSkorname;

  (* 실장(2차 평가자)이상만 접속 가능 2014.10.22 By HeeYong *)
  SqlText := 'SELECT NVL(SUM(DECODE(e2empno, '''+gsEmpno+''', 1, 0)), 0) ' +
             'from PEHREMAS                                              ' +
             'where rabasdate = ''' + sRabasdate + '''                   ' +
             '  AND  e2empno  = ''' + gsEmpno     + '''                  ' ;

  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  If StrToInt(DataModule_Tmax.Csel_gfd(1)) = 0 Then
  Begin
    MessageDlg('2차 평가자가 아닙니다.', mtConfirmation, [mbOK],0);
    DBSet_Sub.Close;
    Exit;
  end;
  GridData;
End;

procedure TFM_Sub.GridData;
var
  I : Integer;
  DEV_1V, DEV_1A, DEV_1B, DEV_2V, DEV_2A, DEV_2B  : array [1..150] of Double;
begin
  Application.ProcessMessages;

  with DBSet_Sub do
  begin
       SQL.Clear;
       SQL.Text :=
        'Select /*+ RULE  NO_USE_MERGE()*/     HH.GUBUN  ,                         '+#13+
        '       NVL(HH.Empno, '' '')           Empno     ,                         '+#13+
        '       NVL(HH.KORNAME, '' '')         KORNAME   ,                         '+#13+
        '      (Select NVL(DEPTNAME||'' ''||DEPTNA3,'''') From Pycdept             '+#13+
        '        Where orgnum = HH.orgnum And Deptcode = HH.Deptcode) DEPTNAME,    '+#13+
        '       NVL(HH.PAYRA, '' '')           PAYRACODE,                          '+#13+
        '      (Select CODENAME From PYCCODE                                       '+#13+
        '        Where CODEID = ''I113'' AND CODENO = HH.PAYRA )      RANAME,      '+#13+
        '       NVL(HH.PAYCL, '' '')           PAYCLCODE,                          '+#13+
        '      (Select CODENAME From PYCCODE                                       '+#13+
        '        Where CODEID = ''I112'' AND CODENO = HH.PAYCL )      CLNAME,      '+#13+
        '       NVL(SS.ASELF,''비대상'')       ASELF     ,                         '+#13+ //역량 자기'
        '       NVL(BB.ADOWN1,'' '')           ADOWN1    ,                         '+#13+ //역량 1차 상사
        '       NVL(CC.ADOWN2,'' '')           ADOWN2    ,                         '+#13+ //역량 2차 상사  //기존 완료을 바꿈 하은영
        '       NVL(HH.SELF  ,'' '')           SELF1     ,                         '+#13+ //업적 자기'
        '       NVL(HH.DOWN1 ,'' '')           DOWN1     ,                         '+#13+ //업적 1차상사'
        '       NVL(HH.DOWN2 ,'' '')           DOWN2     ,                         '+#13+ //업적 2차상사'
        '       HH.E1Empno                               ,                         '+#13+
        '       DECODE(HH.RVALOBJYN,NULL,''진행전'',''X'',''미합의'',''Y'',''신청'',''N'',''미신청'') OBJSTATE,'+#13+ //이의제기
        '       decode((nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1),0,'''',(nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1)) fSCORE, '+#13+ //ESCORE 업적평가 1차 점수,
        '       ''0'' E1HAP,        (nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1)  TOTRESCR,  '+#13+ //상반기업적점수, 최종업적점수
      //'       ROUND(BB.ABILSCR1,4) ABILSCR1,                                     '+#13+ //역량1차점수  //2006.11.15 하은영 2차는 1차 점수 못 보게
      //'       DECODE('''+gsEmpno+''',HH.E1Empno, ROUND(BB.ABILSCR1,4),'''') ,    '+#13+ //최종역량점수 하은영
        '       ROUND(BB.ABILSCR1,4),                                              '+#13+ //최종역량점수
        '       NVL(AA.EVCNO,'' '')            OTHER     ,                         '+#13+ //태도2차
        '       XX.PGROUPGRADE                 REGRADE   ,                         '+#13+ //최종업적등급,
        '       DECODE('''+gsEmpno+''',HH.E2Empno,ROUND(CC.ABILSCR2,4),'''') ABILSCR2  ,                         '+#13+ //역량2차점수
        '       YY.HSCORE,                                                         '+#13+ //역량상향평가 보이지 않게 막아줌.
        '       DECODE('''+gsEmpno+''',HH.E3Empno, TOT.TOT_KD1, TOT.TOT_KD)  ,     '+#13+ //최종역량점수 하은영
        '       (SELECT CODENAME FROM PYCCODE                                      '+#13+
        '        WHERE CODEID = ''E101'' AND CODENO = SUBSTR(HH.PGROUP,4,2)) PGROUP,  '+#13+
//        '       HH.PGROUP,                                                         '+#13+ //그룹
        '       '''' BPAYSCORE,         '''' BPAYCLASS,                            '+#13+ //최종평가 점수, 최종평가등급 'ZZ.BPAYSCORE, ZZ.BPAYCLASS '+#13+
        '       Value1        ,         Value2                                     '+#13+ //Value 상사평가.
        ' From                                                                     '+#13+
        '      (Select ''자기'' GUBUN, A.Empno,                                    '+#13+
        '              Decode(B.EVCNO,''1'',DECODE(B.SYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.BECONYN,''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료'')),''미완료''),''비대상''), '+#13+
        '                                   DECODE(B.SYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료''),''비대상'')           )        ASELF '+#13+
        '         From PESMS A, PEHAMAS B                                          '+#13+
        '        Where A.RabasDate = '''+sRabasdate+'''                            '+#13+
        '          AND A.RabasDate = B.RabasDate                                   '+#13+
        '          AND A.Empno     = B.Empno                                       '+#13+
        '          AND B.EVCNO    in (''1'',''2'')                                 '+#13+
        '       ) SS,                                                              '+#13+
        '      (Select ''1차'' GUBUN, A.Empno, A.EEmpno,                           '+#13+
        '              Decode(B.EVCNO,''1'',C.ABILSCR1, D.ABILSCR1) ABILSCR1,      '+#13+
        '              Decode(B.EVCNO,''1'',DECODE(B.LAYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.BECONYN,''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료'')),''미완료''),'' '') , '+#13+
        '                                   DECODE(B.LAYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료''),''비대상'')           )   ADOWN1 '+#13+
        '         From PESMLA A, PEHAMAS B,                                        '+#13+
        '             (Select Empno, EEmpno,                                       '+#13+
        '                    (AVG(DECODE(EKIND,''공통역량''  ,SCORE))*0.5+         '+#13+
        '                     AVG(DECODE(EKIND,''리더십역량'',SCORE))*0.3+         '+#13+
        '                     AVG(DECODE(EKIND,''직무역량''  ,SCORE))*0.2) ABILSCR1'+#13+
        '                From PESDL                                                '+#13+
        '               Where RabasDate = '''+sRabasdate+'''                       '+#13+
        '               Group By Empno, EEmpno  ) C,                               '+#13+
        '             (Select Empno, EEmpno,                                       '+#13+
        '                    (AVG(DECODE(EKIND,''공통역량''  ,SCORE))*0.5+         '+#13+
        '                     AVG(DECODE(EKIND,''직무역량''  ,SCORE))*0.5) ABILSCR1'+#13+
        '                From PESDL                                                '+#13+
        '               Where RabasDate = '''+sRabasdate+'''                       '+#13+
        '               Group By Empno, EEmpno  ) D                                '+#13+
        '        Where A.RabasDate = '''+sRabasdate+'''                            '+#13+
        '          AND A.RabasDate = B.RabasDate   AND A.Empno = B.Empno           '+#13+
        '          AND A.Empno     = C.Empno(+)    AND A.Empno = D.Empno(+)        '+#13+
        '          AND A.EEmpno    = C.EEmpno(+)   AND A.EEmpno= D.EEmpno(+)       '+#13+
        '          AND B.EVCNO    in (''1'',''2'')                                 '+#13+
        '       ) BB,                                                              '+#13+
        '      (Select ''2차'' GUBUN, A.Empno, A.EEmpno,                           '+#13+
        '              Decode(B.EVCNO,''1'',C.ABILSCR2, D.ABILSCR2) ABILSCR2,      '+#13+
        '              Decode(B.EVCNO,''1'',DECODE(B.LBYN,''Y'',DECODE(A.ABCONYN,''Y'',DECODE(A.BECONYN,''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료''),''미완료''),'' ''), '+#13+
        '                                   DECODE(B.LBYN,''Y'',DECODE(A.ABCONYN,''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료''),'' '')                          )   ADOWN2 '+#13+
        '         From PESMLB A, PEHAMAS B,                                        '+#13+
        '             (Select Empno, EEmpno,                                       '+#13+
        '                    (AVG(DECODE(EKIND,''공통역량''  ,SCORE))*0.5+         '+#13+
        '                     AVG(DECODE(EKIND,''리더십역량'',SCORE))*0.3+         '+#13+
        '                     AVG(DECODE(EKIND,''직무역량''  ,SCORE))*0.2) ABILSCR2'+#13+
        '                From PESDL                                                '+#13+
        '              Where RabasDate = '''+sRabasdate+'''                        '+#13+
        '              Group By Empno, EEmpno  ) C,                                '+#13+
        '             (Select Empno, EEmpno,                                       '+#13+
        '                    (AVG(DECODE(EKIND,''공통역량''  ,SCORE))*0.5+         '+#13+
        '                     AVG(DECODE(EKIND,''직무역량''  ,SCORE))*0.5) ABILSCR2'+#13+
        '                From PESDL                                                '+#13+
        '              Where RabasDate = '''+sRabasdate+'''                        '+#13+
        '              Group By Empno, EEmpno  ) D                                 '+#13+
        '        Where A.RabasDate = '''+sRabasdate+'''                            '+#13+
        '	        AND A.RabasDate = B.RabasDate  AND A.Empno = B.Empno            '+#13+
        '          AND A.Empno     = C.Empno(+)   AND A.Empno = D.Empno(+)         '+#13+
        '          AND A.EEmpno    = C.EEmpno(+)  AND A.EEmpno= D.EEmpno(+)        '+#13+
        '          AND B.EVCNO    in (''1'',''2'')                                 '+#13+
        '       ) CC,                                                              '+#13+
      //'      (Select Empno,BRESULTSCR E1HAP From PEHTOTSCR Where RabasDate = '''+sRabasdate+'''      ) MM,         '+#13+
        '      (Select DECODE('''+gsEmpno+''',A.E1Empno,''1차'',E2Empno,''2차'',E3Empno,''2차'') GUBUN,              '+#13+
        '              A.PGROUP, A.Empno, E2VALOBJYN, A.KORNAME, A.PAYCL, A.PAYRA, A.ORGNUM, A.Deptcode,             '+#13+
        '              A.E1Empno, A.E2Empno, A.E3Empno, A.EBREmpno, RVALOBJYN,                                       '+#13+     //  B.ESCORE,
        '              DECODE(A.RESTIONLYYN,''Y'',''비대상'',DECODE(A.RVALCONYN ,''Y'',''완료'',''미완료'')) SELF,   '+#13+
        '              DECODE(A.RESTIONLYYN,''Y'',''비대상'',DECODE(A.E1VALCONYN,''Y'',''완료'',''미완료'')) DOWN1,  '+#13+
        '              DECODE(A.EBREmpno,NULL,'' '',         DECODE(EBRVALCONYN ,''Y'',''완료'',''미완료'')) DOWNEBR,'+#13+
        '              DECODE(A.RESTIONLYYN,''Y'',''비대상'',                                                  '+#13+
        '                     DECODE(A.E2Empno, NULL,'''',                                                     '+#13+
        '                            DECODE(E2VALCONYN,''Y'',''완료'',''N'',                                   '+#13+
        '                                   DECODE(E2VALOBJYN,''Y'',''반려중'',''미완료''),''미완료''))) DOWN2,'+#13+
        '             (Select sum(escore)                                                                      '+#13+
        '                From (Select t1.Empno, nvl(round(t1.seldata * t2.mainweight * 0.01,2),0) escore       '+#13+
        '                        From (Select c.Empno, a.taskcode, substr(a.Deptcode,1,4) Deptcode,            '+#13+
        '                                     nvl(round(sum((a.detailrscore*a.detailweight)/100),2),0) seldata '+#13+
        '                                From pehaimhis_com a, pehreaim_bas b, pehremas c                      '+#13+
        '                               Where a.RabasDate = '''+sRabasdate+''' and a.RabasDate = b.RabasDate   '+#13+
        '                                 and a.RabasDate = c.RabasDate        and a.taskcode  = b.taskcode    '+#13+
        '                                 and nvl(a.eobjyn,''N'') <> ''Y''     and nvl(a.econyn,''N'') = ''Y'' '+#13+
        '                                 and substr(a.Deptcode,1,4) = substr(c.Deptcode,1,4)                  '+#13+
        '                                 and SUBSTR(a.Deptcode,1,4) = SUBSTR(b.Deptcode,1,4)                  '+#13+
        '                               Group By c.Empno, a.taskcode, substr(a.Deptcode,1,4)         ) t1,     '+#13+ //Group By c.Empno, a.taskcode, b.taskname, substr(a.Deptcode,1,4)  ) t1,' +#13+
        '                             (Select distinct a.Empno, substr(a.Deptcode,1,4) Deptcode,               '+#13+
        '                                     a.taskcode, a.mainweight                                         '+#13+
        '                                From pehreaim_comdet a, pehremas b                                    '+#13+
        '                               Where a.RabasDate = '''+sRabasdate+''' and a.RabasDate = b.RabasDate   '+#13+
        '		 	               and a.Empno     = b.Empno                                  ) t2 '+#13+
        '	                     Where t1.Deptcode = t2.Deptcode                                           '+#13+
        '	                       and t1.taskcode = t2.taskcode   and t1.Empno = t2.Empno                 '+#13+
        '	                     union all                                                                 '+#13+
        '	                    Select Empno, SUM(ECONTRSCR) ESCORE From PEHREAIM_SCR                      '+#13+
        '                       Where RabasDate ='''+sRabasdate+'''   Group By Empno                           '+#13+
        '	                     union all                                                                 '+#13+
        '	                    Select Empno, SUM(ESCORE)    ESCORE From PEHREAIM_DET                      '+#13+
        '                       Where RabasDate ='''+sRabasdate+'''   Group By Empno )                         '+#13+
        '              Where Empno = A.Empno                                                                   '+#13+
        '	             Group By Empno ) ESCORE, A.proescore,                                             '+#13+

        '             (Select round(Avg(score),2)                                                              '+#13+
        '                From (Select Empno, EEmpno, itemno, avg(score) score from PESDL                       '+#13+
        '                       Where RabasDate = '''+sRabasdate+''' and EKIND  = ''Values''                   '+#13+
        '                       Group by Empno, EEmpno, itemno)                                                '+#13+
        '               Where Empno     = A.Empno            And EEmpno = A.E1Empno ) VALUE1 ,                 '+#13+
        '             (Select round(Avg(score),2)                                                              '+#13+
        '                From (Select Empno, EEmpno, itemno, avg(score) score from PESDL                       '+#13+
        '                       Where RabasDate = '''+sRabasdate+''' and EKIND  = ''Values''                   '+#13+
        '                       Group by Empno, EEmpno, itemno)                                                '+#13+
        '               Where Empno     = A.Empno            And EEmpno = A.E2Empno ) VALUE2                   '+#13+

        '         From PEHREMAS A                                                                              '+#13+
        '        Where  A.RabasDate = '''+sRabasdate+''' AND A.RESTIYN = ''Y''                                 '+#13+
        '          AND (A.E2Empno='''+gsEmpno+''' OR A.E3Empno='''+gsEmpno+''')                                '+#13+
//        '          AND (A.E1Empno='''+gsEmpno+''' OR A.E2Empno='''+gsEmpno+''' OR A.E3Empno='''+gsEmpno+''')   '+#13+
        '       ) HH,                                                                                          '+#13+
        '      (Select M.Empno, M.KORNAME, TO_CHAR(M.EVCNO,''0'') EVCNO, M.PAYCL, M.PAYRA, LAB.EEmpno          '+#13+
        '         From PEHAMAS M, (Select Empno, EEmpno  From PESMLA                                           '+#13+
        '                           Where RabasDate = '''+sRabasdate+''' and EEmpno = '''+gsEmpno+'''          '+#13+
        '                           UNION                                                                      '+#13+
        '                          Select Empno, EEmpno  From PESMLB                                           '+#13+
        '                           Where RabasDate = '''+sRabasdate+''' and EEmpno = '''+gsEmpno+''' ) LAB    '+#13+
        '       Where M.RabasDate = '''+sRabasdate+'''                                                         '+#13+
        '         AND M.Empno     = LAB.Empno                                                                  '+#13+
        '         AND (M.SYN = ''Y'' OR M.LAYN = ''Y'' OR M.LBYN = ''Y'')                                      '+#13+
        '       ) AA,                                                                                          '+#13+
        '      (Select Empno, PGROUPGRADE  From PEHTOTSCR  Where RabasDate = '''+sRabasdate+'''   '+' ) XX,    '+#13+
        '      (Select Empno, NVL(ROUND(AVG(SCORE),2),0) HSCORE  From PESDC                                    '+#13+//하은영 변경 PESDH -> PESDC
        '        Where RabasDate = '''+sRabasdate+''' AND EKIND = ''리더십역량'' AND length(EEmpno) = 16       '+#13+
        '        Group By Empno                                                                       ) YY,    '+#13+
   //   '      (Select Empno, NVL(ROUND(BPAYSCORE,2),0) BPAYSCORE, BPAYCLASS From PEHFUPAY Where PAYYEAR=''2006'') ZZ,'+#13+
        '      (Select Empno, TOT_KD, TOT_KD1 From hperson.v_tot_hpa_06     ) TOT    '+#13+
        'Where HH.Empno  = AA.Empno(+) '+#13+
        '  AND HH.Empno  = SS.Empno(+) '+#13+
        '  AND HH.Empno  = BB.Empno(+) '+#13+ //AND HH.E1Empno  = BB.EEmpno(+)   '+#13+
        '  AND HH.Empno  = CC.Empno(+) '+#13+ //AND HH.E2Empno  = CC.EEmpno(+)   '+#13+
        '  AND HH.Empno  = XX.Empno(+) '+#13+
        '  AND HH.Empno  = YY.Empno(+) '+#13+
        '  AND HH.Empno  = TOT.Empno(+)'+#13+
        '  AND SS.ASELF(+)<> ''비대상'''+#13+  //dsa2000  2008.10. Add 상사평가에 안나오도록...
        '  AND HH.Empno Not in (Select empno from Petremas Where RabasDate = '''+sRabasdate+''' '+')'; //dsa2000  2009.10. Add  팀장은 상사평가에 안나오도록...

        if RB1.Checked then SQL.Add(' ORDER BY SUBSTR(HH.PGROUP,4,2), NVL(fSCORE, 0) DESC ');
        E_Sql.Text := SQL.Text;

        Close;
        ServiceName := 'PET1020A_sel1';   ///SVRNAME = htmax_pe13
        ClearFieldInfo;
        ClearParamInfo;
        AddField('GUBUN'    , ftString ,   4 );
        AddField('Empno'    , ftString ,   4 );
        AddField('KORNAME'  , ftString ,  12 );
        AddField('DEPTNAME' , ftString ,  60 );
        AddField('PAYRACODE', ftString ,   3 );
        AddField('PAYRA'    , ftString ,  20 );
        AddField('PAYCLCODE', ftString ,   3 );
        AddField('PAYCL'    , ftString ,  20 );
        AddField('ASELF'    , ftString ,   6 ); // 역량 자기
        AddField('ADOWN1'   , ftString ,   6 ); // 역량 1차 상사
        AddField('ADOWN2'   , ftString ,   6 ); // 역량 2차 상사
        AddField('SELF'     , ftString ,   6 ); // 업적 자기
        AddField('DOWN1'    , ftString ,   6 ); // 업적 1차상사
        AddField('DOWN2'    , ftString ,   6 ); // 업적 2차상사
        AddField('E1Empno'  , ftString ,   6 ); // 업적평가 1차 점수
        AddField('OBJSTATE' , ftString ,   6 ); // 이의제기
        AddField('ESCORE'   , ftString ,   6 ); // 업적평가 1차 점수
        AddField('E1HAP'    , ftString ,   6 ); // 상반기 업적 점수
        AddField('TOTRESCR' , ftString ,   6 ); // 최종 업적 점수
        AddField('ABILSCR1' , ftString ,   6 ); // 역량 1차 점수
        AddField('OTHER'    , ftString ,   2 ); // 태도 2차
        AddField('REGRADE'  , ftString ,  10 ); // 최종 업적 등급
        AddField('ABILSCR2' , ftString ,  10 ); // 역량 2차 점수
        AddField('HSCORE'   , ftString ,  10 ); // 역량 상향 점수
        AddField('ABILSCR'  , ftString ,  10 ); // 최종 역량 점수
        AddField('PGROUP'   , ftString ,  10 ); // 그굽
        AddField('BPAYSCORE', ftString ,  10 ); // 최종평가 점수
        AddField('BPAYCLASS', ftString ,  10 ); // 최종평가 등급
        AddField('Value1'   , ftString ,   6 ); // Value 1차상사
        AddField('Value2'   , ftString ,   6 ); // Value 2차상사
        Open;

        if Not((Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
               (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
               (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D')) then
        Begin
          if Eof then
          begin
            MessageDlg('팀장님이 아니거나 자기평가를 완료한 피평가자들이 없습니다.' + #13#13 +
                       '               [프로그램은 자동 종료됩니다.]', mtConfirmation, [mbOK],0);
            Application.Terminate;
          end;
        End
        Else
        Begin
        End;

        DisableControls;

        CheckGubun      := '1차'; CheckGubun1     := '';    CheckGubun2     := 'Y'; CheckGubun3     := 'Y';
        E_AVG_1V_count  := 0;     E_AVG_1A_count  := 0;     E_AVG_1B_count  := 0;  //1차Values, 1차업적, 1차역량
        E_AVG_2V_count  := 0;     E_AVG_2A_count  := 0;     E_AVG_2B_count  := 0;  //2차Values, 2차업적, 2차역량
        E_AVG_1V_SUM    := 0;     E_AVG_1A_SUM    := 0;     E_AVG_1B_SUM    := 0;  //1차Values, 1차업적, 1차역량
        E_AVG_2V_SUM    := 0;     E_AVG_2A_SUM    := 0;     E_AVG_2B_SUM    := 0;  //2차Values, 2차업적, 2차역량
        E_AVGYN_Type    := 'Y';   E_AVGYN_CheckNM1:= '';    E_AVGYN_CheckNM2:= '';  E_DEVYN_CheckNM := '';

        for I := 1 to 150 do
        begin
          DEV_1V[I] := 0; DEV_1A[I] := 0; DEV_1B[I] := 0;
          DEV_2V[I] := 0; DEV_2A[I] := 0; DEV_2B[I] := 0;
        end;

        while not Eof do
        begin
             if FieldByName('GUBUN').AsString = '1차' then CheckGubun1 := '1차';
             if FieldByName('GUBUN').AsString = '2차' then CheckGubun  := '2차';

             //하은영
             if FieldByName('GUBUN').AsString = '1차' then
             begin
                  if FieldByName('Value1').AsString <> '' then //1차Values
                  begin
                       inc(E_AVG_1V_count);
                       E_AVG_1V_SUM := E_AVG_1V_SUM + FieldByName('Value1').AsFloat;

                       DEV_1V[E_AVG_1V_count] := FieldByName('Value1').AsFloat;
                  end;

                  if FieldByName('ESCORE').AsString <> '' then //1차 업적
                  begin
                       inc(E_AVG_1A_count);
                       E_AVG_1A_SUM := E_AVG_1A_SUM + FieldByName('ESCORE').AsFloat;

                       DEV_1A[E_AVG_1A_count] := FieldByName('ESCORE').AsFloat;
                  end;

                  if (TrimRight(FieldByName('PAYRA').AsString) = '팀장') or (TrimRight(FieldByName('PAYRA').AsString) = '실장') then
                  begin
                       if (TrimRight(FieldByName('DOWN1').AsString) = '미완료')  then  //업적
                       begin
                         E_AVGYN_Type    := 'N';
                         E_AVGYN_CheckNM1 := '피평가자별 미완료 인원 존재';
                       end;
                  end
                  else
                  begin
                       CheckGubun2 := 'N';  //팀장만 존재 유무

                       if FieldByName('ABILSCR1').AsString <> '' then //1차 역량
                       begin
                         inc(E_AVG_1B_count);
                         E_AVG_1B_SUM := E_AVG_1B_SUM + FieldByName('ABILSCR1').AsFloat;

                         DEV_1B[E_AVG_1B_count] := FieldByName('ABILSCR1').AsFloat;
                       end;

                       if (TrimRight(FieldByName('DOWN1').AsString) = '미완료') or (TrimRight(FieldByName('ADOWN1').AsString) = '미완료') then //업적,역량
                       begin
                         E_AVGYN_Type    := 'N';
                         E_AVGYN_CheckNM1 := '피평가자별 미완료 인원 존재';
                       end;
                  end;
             end;

             if FieldByName('GUBUN').AsString = '2차' then
             begin
                  if FieldByName('Value2').AsString <> '' then //2차Values
                  begin
                       inc(E_AVG_2V_count);
                       E_AVG_2V_SUM := E_AVG_2V_SUM + FieldByName('Value2').AsFloat;

                       DEV_2V[E_AVG_2V_count] := FieldByName('Value2').AsFloat;
                  end;

                  if FieldByName('ESCORE').AsString <> '' then //2차 업적
                  begin
                       inc(E_AVG_2A_count);
                       E_AVG_2A_SUM := E_AVG_2A_SUM + FieldByName('ESCORE').AsFloat;

                       DEV_2A[E_AVG_2A_count] := FieldByName('ESCORE').AsFloat;
                  end;

                  if (TrimRight(FieldByName('PAYRA').AsString) <> '팀장') and (TrimRight(FieldByName('PAYRA').AsString) <> '실장') then
                  begin
                       CheckGubun3 := 'N';  //팀장만 존재 유무

                       if FieldByName('ABILSCR2').AsString <> '' then //2차 역량
                       begin
                         inc(E_AVG_2B_count);
                         E_AVG_2B_SUM := E_AVG_2B_SUM + FieldByName('ABILSCR2').AsFloat;

                         DEV_2B[E_AVG_2B_count] := FieldByName('ABILSCR2').AsFloat;
                       end;


                       if TrimRight(FieldByName('DOWN2').AsString) = '미완료'  then  //역량 2차
                       begin
                         E_AVGYN_Type    := 'N';
                         E_AVGYN_CheckNM1 := '피평가자별 미완료 인원 존재';
                       end;
                  end;
             end;

             next;
        end;

        ///////////////////////////////////////////////////////////////////////////
        if CheckGubun = '1차' then
        begin
          DBGrd_E2.Visible := False;
          DBGrd_E1.Visible := True;
        end
        else if CheckGubun = '2차' then
        begin
          DBGrd_E2.Visible := True;
          DBGrd_E1.Visible := False;
        end;
        
        First;
        EnableControls;

        if (E_AVG_1A_SUM <> 0) and (E_AVG_1A_count <> 0) then  //1차업적
        begin
             //평균
             E_AVG_1A.Value := ROUND(E_AVG_1A_SUM / E_AVG_1A_count * 100) / 100;
        end;

        if (E_AVG_2A_SUM <> 0) and (E_AVG_2A_count <> 0) then   //2차 업적
        begin
//             E_AVG_2A.Value := ROUND(E_AVG_2A_SUM / E_AVG_2A_count * 100) / 100;  >> 2차 평가자 로그인 시  E_AVG_1A.Value
             E_AVG_1A.Value := ROUND(E_AVG_2A_SUM / E_AVG_2A_count * 100) / 100;
        end;

        if E_AVGYN_Type = 'Y' then E_AVGYN_Check.Text := '충족'
        else                       E_AVGYN_Check.Text := '불충족';

        if E_AVGYN_Type = 'Y' then
          E_AVGYN.Text := '완료'
        else
          E_AVGYN.Text := '미완료';


        L_Sum.Caption := '평가하실 피평가자수는 전체 '+IntToStr(RecordCount)+'명 입니다.';
  end;
end;

procedure TFM_Sub.Btn_EvalClick(Sender: TObject);
var SqlText : string;
    sEmpno : string;
begin

  if (DBSet_Sub.FieldByName('Self').AsString = '미완료') then
  begin
       if MessageDlg('피평가자가 자기평가를 완료하지 않았습니다. '+#13#13+
                  '상사(하향) 평가를 그대로 진행하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;

  if (DBSet_Sub.FieldByName('GUBUN').AsString = '2차') and                         // ???
     (DBSet_Sub.FieldByName('OBJSTATE').AsString = '진행전') then
  begin
    MessageDlg('현재 1차평가만 완료된 상태입니다.이의제기신청 전단계이므로'#13#13+
               '피평가자 이의신청 여부 결정 후 평가하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end;

  if (DBSet_Sub.FieldByName('GUBUN').AsString = '2차') and                         // ???
     (DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청중') then
  begin
    MessageDlg('<1차평가>는 완료되었으나 피평가자['+DBSet_Sub.FieldByName('KORNAME').AsString+']가 '+#13#13+
               '1차평가점수에 대해 [이의신청] 중 입니다..'+#13#13+
               '완료 된 후에 평가하시기 바랍니다..',mtInformation,[mbOK],0);
    Exit;
  end;

  if (DBSet_Sub.FieldByName('GUBUN').AsString = '2차') and                         // ???
     (DBSet_Sub.FieldByName('OBJSTATE').AsString = '미합의') then
  begin
    MessageDlg('<1차평가>는 완료되었으나 피평가자['+DBSet_Sub.FieldByName('KORNAME').AsString+']가 '+#13#13+
               '1차평가점수에 대해 [이의신청] 후 1차평가자와 미합의 상태입니다..'+#13#13+
               '완료 된 후에 평가하시기 바랍니다..',mtInformation,[mbOK],0);
    Exit;
  end;

  Self.Visible := False;

  sEmpno := DBSet_Sub.FieldByName('empno').AsString;

  with DBcommon do
  begin
     Close;
     SqlText := 'Select unionyn'+
                ' from pehreaim_combas'+
               ' where rabasdate = '''+ sRabasdate +''''+
        	      ' and empno = '''+sEmpno+'''';
     ServiceName := 'PEA1060A_common';
     ClearFieldInfo;
     AddField('SEL_DATA', ftString, 300);
     ClearParamInfo;
     SQL.Text := SqlText;
     Open;
     if RecordCount > 0 then
     begin
        //일반목표등록 대상자이면
        if trim(FieldByName('SEL_DATA').AsString) = 'N' then
        begin
           FM_Main       := TFM_Main.Create(nil);

           Application.ProcessMessages;
           FM_Main.PL_ResetAllButton;
           FM_Main.ED_empno.Text := sEmpno;
           FM_Main.ED_empno.PL_get_singledata;

           FM_Main.Show;

        end
        //공동목표등록 대상자이면
        else
        begin
           FM_Main2 := TFM_Main2.Create(nil);

           Application.ProcessMessages;
           FM_Main2.PL_ResetAllButton;
           FM_Main2.ED_empno.Text := sEmpno;
           FM_Main2.ED_empno.PL_get_singledata;

           FM_Main2.Show;

        end;
     end;
     close;
  end;
end;

procedure TFM_Sub.E_AdminLoginClick(Sender: TObject);
begin
  if sLoginGrant = '관리자' then
  begin
//    FM_Admin := TFM_Admin.Create(Self);
//    FM_Admin.ShowModal;
//    gsEmpno  := FM_Admin.e_eempno.Text;
  end
  else begin
    gsEmpno   := Hinsa_Param(cmdLine,1);
    GSkorname := Hinsa_Param(cmdLine,2);
  end;
  GridData;
  L_empkorname.Caption := '('+gsEmpno+')'+ GSkorname;
end;

procedure TFM_Sub.DS_SubDataChange(Sender: TObject; Field: TField);
begin
  Lwork := DBSet_Sub.FieldByName('gubun').AsString;

  E_GROUP_AVG.EditLabel.Caption  := DBSet_Sub.FieldByName('empno').AsString
                          + '('
                          + DBSet_Sub.FieldByName('korname').AsString
                          + ') 동료평가점수';

   //동료 평가 점수                          
   SqlText := ' select NVL(ROUND(AVG(SCORE),4),0)  from pesdc '
            + ' where rabasdate ='''+sRabasdate+''' and EMPNO  = '''+DBSet_Sub.FieldByName('empno').AsString+''' and length(eempno) = 16 ';

   DataModule_Tmax.Csel_SQL := SqlText;
   DataModule_Tmax.Csel_Open;

   if DataModule_Tmax.Csel_gfd(1) <> '' then
     E_GROUP_AVG.Value  := strtofLOAT(DataModule_Tmax.Csel_gfd(1))
   else
     E_GROUP_AVG.Value  := 0;
end;

procedure TFM_Sub.RB1Click(Sender: TObject);
begin
  GridData;
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
//  Application.ProcessMessages;
end;

procedure TFM_Sub.DBGrd_E1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  TW, X, Y: integer;
begin
  with DBGrd_E1.Canvas do
  begin
       if gdSelected in State then  Brush.Color := $00EEFE96;//$00FAFDEE;//$00FFE8D0;//$00FEEDED;

       Font.Style := [];
       if      (Column.Field.AsString = STR_D) or (Column.Field.AsString = STR_Y) then  Font.Color := clBlue
       else if (Column.Field.AsString = STR_N) or (Column.Field.AsString = STR_C) then  Font.Color := $00404080
       else if (Column.Field.AsString = '반려중') then                                  Font.Color := clRed
       else if (Column.Field.AsString = '미합의') then                                  Font.Color := clFuchsia
       else                                                                             Font.Color := clWindowText;

       if (Column.Field.AsString = '1차') then
       begin
            Font.Color := $00404080;
            Font.style := [fsBold];
       end;

       if (Column.Field.AsString = '2차') then
       begin
            Font.Color := clNavy;
            Font.style := [fsBold];
       end;

       FillRect(Rect);

       TW := TextWidth(Column.Field.AsString);
       if Column.Field.FieldName = 'DEPTNAME' then
       begin
            X := Rect.Left+2;
            Y := Rect.Top+2;
       end else
       begin
            X := (Rect.Left + Rect.Right -2 - TW) div 2;
            Y := Rect.Top+2;
       end;

       TextOut(X,Y,Column.Field.AsString);
  end;
end;

procedure TFM_Sub.DBGrd_E2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  TW, X, Y: integer;
begin
  with DBGrd_E2.Canvas do
  begin
       if (DBSet_Sub.FieldByName('PAYCL').AsString ='G4') then Brush.Color := $00DFDFDF;

       if gdSelected in State then  Brush.Color := $00EEFE96;//$00FAFDEE;//$00FFE8D0;//$00FEEDED;

       Font.Style := [];
       if      (Column.Field.AsString = STR_D) or (Column.Field.AsString = STR_Y) then  Font.Color := clBlue
       else if (Column.Field.AsString = STR_N) or (Column.Field.AsString = STR_C) then  Font.Color := $00404080
       else if (Column.Field.AsString = '반려중') then                                  Font.Color := clRed
       else if (Column.Field.AsString = '미합의') then                                  Font.Color := clFuchsia
       else                                                                             Font.Color := clWindowText;
       
       //Font.style := [fsBold];
       if (Column.Field.AsString = '1차') then Font.Color := $00404080;
       if (Column.Field.AsString = '2차') then Font.Color := clNavy;

       FillRect(Rect);

       TW := TextWidth(Column.Field.AsString);
       if Column.Field.FieldName = 'DEPTNAME' then
       begin
            X := Rect.Left+2;
            Y := Rect.Top+2;
       end else
       begin
            X := (Rect.Left + Rect.Right -2 - TW) div 2;
            Y := Rect.Top+2;
       end;

       TextOut(X,Y,Column.Field.AsString);
  end;
end;

procedure TFM_Sub.BT_AllConfirmClick(Sender: TObject);

  procedure RenewForm;
  begin
    FM_RenewForm             := TFM_RenewForm.Create(nil);
    FM_RenewForm.Parent      := FM_Sub;
    FM_RenewForm.Pempno      := gsEmpno;
    FM_RenewForm.Pkorname    := GSkorname;
    FM_RenewForm.Lrabasdate  := sRabasdate;
    FM_RenewForm.Show;

    FM_RenewForm.Bt_SrhClick(nil);
  end;

  var
  i :integer;
begin
  if MessageDlg('일괄 팀별 최종완료하시면 더 이상 평가 하실 수 없습니다.'+#13+#10+''+#13+#10+'일괄 완료 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    if (E_AVGYN_Check.Text = '불충족') and (E_AVGYN_CheckNM1 = '피평가자별 미완료 인원 존재') then
    begin
      MessageDlg('피 평가대상자중 최종완료를 하지 않은 피평가자가 있습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      System.Exit;
    end;

    if (E_DEVYN_Check.Text = '불충족') and (E_DEVYN_CheckNM = '피평가자별 표준편차 가이드 라인 불충족') then
    begin
      if MessageDlg('피평가자별 표준편차 가이드 라인 불충족 입니다.'+#13+#10+''+#13+#10+'그래도 최종 완료 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      else
      begin
        RenewForm;
        System.Exit;
      end;
    end;

    if (E_AVGYN_Check.Text = '불충족') and (E_AVGYN_CheckNM2 = '피평가자별 평균 가이드 라인 불충족') then
    begin
      if MessageDlg('피평가자별 평균 가이드 라인 불충족 입니다.'+#13+#10+''+#13+#10+'그래도 최종 완료 하시겠습니까?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      else
      begin
        RenewForm;
        System.Exit;
      end;
    end;

    with DBSet2 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Format('UPDATE PEHREClOSE                                                       '+
                         '   SET VALCONYN = ''Y'',                                                '+
                         '       VALCONDATE = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8)  '+
                         ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                          [sRabasdate, gsEmpno]);
      Close;
      ServiceName := 'PET1010A_dml';
      ClearFieldInfo;
      Execute;
    end;

    MessageDlg('팀별 평가에 대해 [상사평가]를 ◈최종완료◈ 하였습니다.',mtInformation,[mbOk],0);
    GridData;
    exit;
  end;
end;

procedure TFM_Sub.bt_closeClick(Sender: TObject);
begin
  Help_View.Visible := False;
end;

procedure TFM_Sub.OnFocusButton1Click(Sender: TObject);
begin
  if Help_View.Visible then
     Help_View.Visible := False
  else
  begin
     Help_View.Left    := 390;
     Help_View.Top     := 127;
     Help_View.Visible := True;
  end;
end;

procedure TFM_Sub.DBGrd_E2CellClick(Column: TColumnEh);
begin
  //동료평가 점수(리더십)
  If   DBSet_Sub.Fields[23].AsString = '' Then pESCORE := '0'
  Else pESCORE := DBSet_Sub.Fields[23].AsString;
end;

procedure TFM_Sub.ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if DBSet_Sub.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 14], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := Copy(sRabasdate,1,4)+'년 평가 팀원 List';  //시트명 부여
  XL.Range['A1:J2'].Merge;                       //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := Copy(sRabasdate,1,4)+'년 평가 팀원 List';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;


  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '구분';
  XArr[2]  := '사번';
  XArr[3]  := '성명';
  XArr[4]  := '소속';
  XArr[5]  := '직책명';
  XArr[6]  := '그룹';
  XArr[7]  := 'BAND';
  XArr[8]  := '업적평가점수';
  XArr[9]  := '비고1';
  XArr[10] := '비고2';
  XL.Range['A3' , 'J3'].Value := XArr;
  k := 3;
  for i := 1 to 10 do
  begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := DBSet_Sub.GetBookmark;
  DBSet_Sub.DisableControls;
  DBSet_Sub.First;

  with DBSet_Sub do
  begin
       for i := 1 to  RecordCount do
       begin
            XArr[1]  := ''''+FieldByName('GUBUN'    ).AsString;
            XArr[2]  := ''''+FieldbyName('Empno'    ).AsString;        
            XArr[3]  := ''''+FieldByName('KORNAME'  ).AsString;        
            XArr[4]  := ''''+FieldbyName('DEPTNAME' ).AsString;        
            XArr[5]  := ''''+FieldbyName('PAYRA'    ).AsString;
            XArr[6]  := ''''+FieldByName('PGROUP'   ).AsString;
            XArr[7]  := ''''+FieldByName('PAYCL'    ).AsString;
            XArr[8]  := ''''+FieldByName('ESCORE'   ).AsString;
            XArr[9]  := '''';
            XArr[10] := '''';
            XL.Range['A' + IntToStr(k+1), 'J' + IntToStr(k+1)].Value := XArr;
            inc(k);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'J' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'J' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'J' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'J' + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A3', 'J' + IntToStr(k)].font.Size := 9;
  XL.Range['C4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['A1', 'J' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  DBSet_Sub.GotoBookmark(SavePlace);
  DBSet_Sub.FreeBookmark(SavePlace);
  DBSet_Sub.EnableControls;
end;


procedure TFM_Sub.PrintClick(Sender: TObject);
begin
  try
    PrintForm1 := TPrintForm1.Create(Application);
    PrintForm1.QuickRep1.Preview;
  finally
    PrintForm1.free;
  end;
end;

procedure TFM_Sub.Btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;



end.




