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
    RB3: TRadioButton;
    RB2: TRadioButton;
    RB4: TRadioButton;
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
    DBcommon: TTMaxDataSet;
    L_Sum: TLabel;
    E_pemp: TEdit;
    E_AVG_1A: TOnNumberEdit;
    E_AVGYN: TOnEdit;
    Excel: TOnFocusButton;
    Label1: TLabel;
    BT_Sel: TOnFocusButton;
    Label3: TLabel;
    procedure BT_SelClick( Sender: TObject);
    procedure FormPaint(Sender: TObject);
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
    procedure DBGrd_E2CellClick(Column: TColumnEh);
    procedure ExcelClick(Sender: TObject);
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
  GsDeptcode : string;
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

uses HMainForm, Hinsa_TmaxDM, RenewForm;



{$R *.DFM}

procedure TFM_Sub.FormPaint(Sender: TObject);
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
//      sRabasdate := '20111130'; //테스트시에...
   end;

   SqlText := 'SELECT Value1 ||'';''|| Value2 from pehrebas '+
              ' where rabasdate = '''+sRabasdate+'''        '+
              '   and gubun     = ''31''                    '+
              '   and sgubun    = ''0002''                  ';
   DataModule_Tmax.Csel_SQL := SqlText;
   DataModule_Tmax.Csel_Open;

   pEmpno       := Hinsa_Param(cmdLine,1);
   GSkorname    := Hinsa_Param(cmdLine,2);

   if GSgrade[1] > 'B' then sLoginGrant := '일반사용자'
   else                     sLoginGrant := '관리자';
//   E_Sql.Visible := False;
//   if GSgrade[1] = 'A' then E_Sql.Visible := True;

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

   gsEmpno      := pEmpno;
   if (pEmpno = Workemp1) or (pEmpno = Workemp2) or (pEmpno = Workemp3) or
      (pEmpno = Workemp4) or (pEmpno = Workemp5) or (copy(pEmpno,1,1) = 'D') then
   begin
       E_pemp.Visible := true;
       BT_Sel.Visible := true;
       gsEmpno        := E_pemp.text;
   end
   else
   begin
       E_pemp.Visible := false;
       BT_Sel.Visible := false;
   end;

   L_empkorname.Caption := '('+gsEmpno+') '+ GSkorname;
   E_pemp.text := gsEmpno;


   BT_SelClick(nil);
  end;
end;

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  FL_Start := True;

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
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;  
end;

procedure TFM_Sub.Btn_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Sub.BT_SelClick(Sender: TObject);
var
  I : Integer;
  DEV_1V, DEV_1A, DEV_1B, DEV_2V, DEV_2A, DEV_2B  : array [1..150] of Double;
begin
  SqlText := 'SELECT DeptCode from pehremas '+
             ' where rabasdate = '''+sRabasdate +''' '+
             '   and empno     = '''+E_pemp.text+''' ';

  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  GsDeptcode:= DataModule_Tmax.Csel_gfd(1);

  gsEmpno := E_pemp.text;

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
        '       decode((nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1),0,'''',(nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1)),                         '+#13+ //ESCORE 업적평가 1차 점수,
        '       ''0'' E1HAP,        (nvl(HH.ESCORE,0)*0.9)+(nvl(HH.proescore,0)*0.1)  TOTRESCR,  '+#13+ //상반기업적점수, 최종업적점수
        '       ROUND(BB.ABILSCR1,4),                                              '+#13+ //최종역량점수
        '       NVL(AA.EVCNO,'' '')            OTHER     ,                         '+#13+ //태도2차
        '       XX.PGROUPGRADE                 REGRADE   ,                         '+#13+ //최종업적등급,
        '       DECODE('''+gsEmpno+''',HH.E2Empno,ROUND(CC.ABILSCR2,4),'''') ABILSCR2  ,                         '+#13+ //역량2차점수
        '       YY.HSCORE,                                                         '+#13+ //역량상향평가 보이지 않게 막아줌.
        '       DECODE('''+gsEmpno+''',HH.E3Empno, TOT.TOT_KD1, TOT.TOT_KD)  ,     '+#13+ //최종역량점수 하은영
        '       HH.PGROUP,                                                         '+#13+ //그룹
        '       '''' BPAYSCORE,         '''' BPAYCLASS,                            '+#13+ //최종평가 점수, 최종평가등급 'ZZ.BPAYSCORE, ZZ.BPAYCLASS '+#13+
        '       Value1        ,         Value2                                     '+#13+ //Value 상사평가.
        ' From                                                                     '+#13+
        '      (select * from pemrdmas Where RabasDate = '''+sRabasdate+''') qq,   '+#13+ // 육성평가
        '      (Select ''자기'' GUBUN, A.Empno,                                    '+#13+
        '              Decode(B.EVCNO,''1'',DECODE(B.SYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.BECONYN,''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료'')),''미완료''),''비대상''), '+#13+
        '                                   DECODE(A.ABCONYN, ''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료'')       )        ASELF '+#13+
// 육성평가 프로그램은 B.SYN가 'N'으로 되어져 있기 때문에 위와 같이 프로그램을 변경함.
//        '                                   DECODE(B.SYN,''Y'',DECODE(A.ABCONYN, ''Y'',DECODE(A.DUCONYN,''Y'',''완료'',''미완료''),''미완료''),''비대상'')           )        ASELF '+#13+
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
        '        Where  A.RabasDate = '''+sRabasdate+''' -- AND A.RESTIYN = ''Y''                              '+#13+ //AND A.Empno = B.Empno(+)
        '          AND (A.E1Empno='''+gsEmpno+''' OR A.E2Empno='''+gsEmpno+''' OR A.E3Empno='''+gsEmpno+''')   '+#13+
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

        '  AND HH.Empno  = QQ.Empno    '+#13+ // 육성평가대상  20131022

        '  AND HH.Empno  = SS.Empno(+) '+#13+
        '  AND HH.Empno  = BB.Empno(+) '+#13+
        '  AND HH.Empno  = CC.Empno(+) '+#13+
        '  AND HH.Empno  = XX.Empno(+) '+#13+
        '  AND HH.Empno  = YY.Empno(+) '+#13+
        '  AND HH.Empno  = TOT.Empno(+)'+#13+
        '  AND SS.ASELF(+)<> ''비대상'''+#13+  //dsa2000  2008.10. Add 상사평가에 안나오도록...
        '  AND HH.Empno Not in (Select empno from Petremas Where RabasDate = '''+sRabasdate+''' '+')'; //dsa2000  2009.10. Add  팀장은 상사평가에 안나오도록...

        if RB1.Checked then SQL.Add(' ORDER BY HH.PGROUP ');
        if RB2.Checked then SQL.Add(' ORDER BY AA.KORNAME           ');
        if RB3.Checked then SQL.Add(' ORDER BY DEPTNAME, AA.PAYCL   ');
        if RB4.Checked then SQL.Add(' ORDER BY AA.PAYCL, AA.KORNAME ');

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
        Open;          //E_Sql.Text := SQL.Text;
        if Eof then
        begin
          MessageDlg('팀장님이 아니거나 자기평가를 완료한 피평가자들이 없습니다.' + #13#13 +
                     '               [프로그램은 자동 종료됩니다.]', mtConfirmation, [mbOK],0);
          //if (pEmpno = Workemp1) or (pEmpno = Workemp2) or (pEmpno = Workemp3) or
          //   (pEmpno = Workemp4) or (pEmpno = Workemp5) or (copy(pEmpno,1,1) = 'D') then
          if GSgrade[1] > 'B' then  Application.Terminate;   
        end;
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

          next;
        end;

        ///////////////////////////////////////////////////////////////////////////

        First;
        EnableControls;

        if (E_AVG_1A_SUM <> 0) and (E_AVG_1A_count <> 0) then  //1차업적
        begin
             //평균
             E_AVG_1A.Value := ROUND(E_AVG_1A_SUM / E_AVG_1A_count * 100) / 100;
        end;

       SqlText := 'SELECT  VALCONYN from PEHREClOSE where rabasdate ='''+sRabasdate+''' and EMPNO  = '''+gsEmpno+''' ';
       DataModule_Tmax.Csel_SQL := SqlText;
       DataModule_Tmax.Csel_Open;

       if DataModule_Tmax.Csel_gfd(1) = 'Y' then
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
//        if trim(FieldByName('SEL_DATA').AsString) = 'N' then
//        begin
           FM_Main       := TFM_Main.Create(nil);

           Application.ProcessMessages;
           FM_Main.ED_empno.Text := sEmpno;
           FM_Main.ED_empno.PL_get_singledata;

           FM_Main.Show;
//        end
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
  else
  begin
    gsEmpno   := Hinsa_Param(cmdLine,1);
    GSkorname := Hinsa_Param(cmdLine,2);
  end;
  BT_SelClick(nil);
  L_empkorname.Caption := '('+gsEmpno+')'+ GSkorname;
end;

procedure TFM_Sub.DS_SubDataChange(Sender: TObject; Field: TField);
begin
  Lwork := DBSet_Sub.FieldByName('gubun').AsString;

   //동료 평가 점수
   SqlText := ' select NVL(ROUND(AVG(SCORE),4),0)  from pesdc '
            + ' where rabasdate ='''+sRabasdate+''' and EMPNO  = '''+DBSet_Sub.FieldByName('empno').AsString+''' and length(eempno) = 16 ';

   DataModule_Tmax.Csel_SQL := SqlText;
   DataModule_Tmax.Csel_Open;
end;

procedure TFM_Sub.RB1Click(Sender: TObject);
begin
  BT_SelClick(BT_Sel);
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
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

  XArr := VarArrayCreate([1, 26], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := Copy(sRabasdate,1,4)+'년 업적평가 List';  //시트명 부여
  XL.Range['A1:Z2'].Merge;                       //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := Copy(sRabasdate,1,4)+'년 업적평가 List';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;


  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '구분';
  XArr[2]  := '사번';
  XArr[3]  := '성명';
  XArr[4]  := '소속';
  XArr[5]  := '직책';
  XArr[6]  := '직책명';
  XArr[7]  := 'BAND코드';
  XArr[8]  := 'BAND';
  XArr[9]  := '역량 자기';
  XArr[10] := '역량 1차 상사';
  XArr[11] := '역량 2차 상사';
  XArr[12] := '업적 자기';
  XArr[13] := '업적 1차상사';
  XArr[14] := '업적 2차상사';
  XArr[15] := '업적평가 1차 점수';
  XArr[16] := '이의제기';
  XArr[17] := '업적평가 1차 점수';
  XArr[18] := '상반기 업적 점수';
  XArr[19] := '최종 업적 점수';
  XArr[20] := '역량 1차 점수';
  XArr[21] := '태도 2차';
  XArr[22] := '역량 2차 점수';
  XArr[23] := '역량 상향 점수';
  XArr[24] := '최종 역량 점수';
  XArr[25] := 'Value 1차상사';
  XArr[26] := 'Value 2차상사';    
  XL.Range['A3' , 'Z3'].Value := XArr;
  k := 3;
  for i := 1 to 26 do
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
            XArr[5]  := ''''+FieldbyName('PAYRACODE').AsString;        
            XArr[6]  := ''''+FieldbyName('PAYRA'    ).AsString;        
            XArr[7]  := ''''+FieldByName('PAYCLCODE').AsString;        
            XArr[8]  := ''''+FieldByName('PAYCL'    ).AsString;        
            XArr[9]  := ''''+FieldByName('ASELF'    ).AsString;        
            XArr[10] := ''''+FieldByName('ADOWN1'   ).AsString;        
            XArr[11] := ''''+FieldByName('ADOWN2'   ).AsString;
            XArr[12] := ''''+FieldByName('SELF'     ).AsString;        
            XArr[13] := ''''+FieldByName('DOWN1'    ).AsString;        
            XArr[14] := ''''+FieldByName('DOWN2'    ).AsString;        
            XArr[15] := ''''+FieldByName('E1Empno'  ).AsString;
            XArr[16] := ''''+FieldByName('OBJSTATE' ).AsString;
            XArr[17] := ''''+FieldByName('ESCORE'   ).AsString;
            XArr[18] := ''''+FieldByName('E1HAP'    ).AsString;
            XArr[19] := ''''+FieldByName('TOTRESCR' ).AsString;
            XArr[20] := ''''+FieldByName('ABILSCR1' ).AsString;
            XArr[21] := ''''+FieldByName('OTHER'    ).AsString;
            XArr[22] := ''''+FieldByName('ABILSCR2' ).AsString;
            XArr[23] := ''''+FieldByName('HSCORE'   ).AsString;
            XArr[24] := ''''+FieldByName('ABILSCR'  ).AsString;
            XArr[25] := ''''+FieldByName('Value1'   ).AsString;
            XArr[26] := ''''+FieldByName('Value2'   ).AsString;
            XL.Range['A' + IntToStr(k+1), 'Y' + IntToStr(k+1)].Value := XArr;
            inc(k);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'Z' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'Z' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'Z' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'Z' + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A3', 'Z' + IntToStr(k)].font.Size := 9;
  XL.Range['C4', 'Z' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['J4', 'Z' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['A1', 'Z' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  DBSet_Sub.GotoBookmark(SavePlace);
  DBSet_Sub.FreeBookmark(SavePlace);
  DBSet_Sub.EnableControls;
end;


end.




