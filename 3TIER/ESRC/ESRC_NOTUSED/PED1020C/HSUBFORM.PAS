unit HSubForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, OnScheme, StdCtrls, ExtCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Db, Tmax_DataSetText,
  OnFocusButton, Tmax_session, OnInsaCommon, OnEditNumCtl, Math, TmaxFunc, Comobj;

type
  TFM_Sub = class(TForm)
    SF_Sub: TOnSchemeForm;
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
    TMaxSession: TTMaxSession;
    DBSet2: TTMaxDataSet;
    RB6: TRadioButton;
    RB7: TRadioButton;
    BT_Sel: TOnFocusButton;
    DBGrd_E2: TDBGridEh;
    RB1: TRadioButton;
    TMaxDataSet_HInsa: TTMaxDataSet;
    E_AVG_1A: TOnNumberEdit;
    E_AVGYN: TOnEdit;
    L_Tdev: TOnNumberEdit;
    ED_CN: TEdit;
    Edit1: TEdit;
    Print: TOnFocusButton;
    Excel: TOnFocusButton;
    procedure BT_SelClick( Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_ExitClick(Sender: TObject);
    procedure Btn_EvalClick(Sender: TObject);
    procedure E_AdminLoginClick(Sender: TObject);
    procedure DS_SubDataChange(Sender: TObject; Field: TField);
    procedure RB1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrd_E2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGrd_E2CellClick(Column: TColumnEh);
    procedure PrintClick(Sender: TObject);
    procedure ExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     FL_Start   : Boolean;

     function Csel_gfd(p_loc: Integer): String;
  public
    { Public declarations }
     workemp1,workemp2,workemp3,workemp4,workemp5 : string; //평가업무담당자
     pESCORE : string; //역량평가 상향점수(리더십역량 평가 점수와 맞추기위함.2012.11.21)
  end;

var
  FM_Sub     : TFM_Sub;
  pempno     : String;        //Login사번
  GSempno    : String;        //Login사번
  GSkorname  : String;        //Login성명
  GSgrade    : String[10];    //Login등급
  sRabasdate : String;        //평가기준일
  Ppaycl     : String;
  sLoginGrant: String;
  Lwork      : String;
  var_E1empno: String;
  CheckGubun, CheckGubun1 : String;
  GspEmpno   : String;
  E_AVG_1V_count, E_AVG_1A_count, E_AVG_1B_count, E_AVG_2V_count, E_AVG_2A_count, E_AVG_2B_count : Integer;
  E_AVG_1V_SUM,   E_AVG_1A_SUM,   E_AVG_1B_SUM,   E_AVG_2V_SUM,   E_AVG_2A_SUM,   E_AVG_2B_SUM : Real;
  E_AVGYN_Type, E_AVGYN_CheckNM1, E_AVGYN_CheckNM2, E_DEVYN_CheckNM : string;
  SqlText : string;
const
  STR_Y = '완료';
  STR_N = '미완료';
  STR_C = '진행전';
  STR_D = '합의';
  STR_X = '미합의';
implementation

uses HMainForm, HMainForm1, Hinsa_TmaxDM, RenewForm, UPrintForm,
  UPrintForm1;


{$R *.DFM}

procedure TFM_Sub.BT_SelClick(Sender: TObject);
var
  I : Integer;
  DEV_1V, DEV_1A, DEV_1B, DEV_2V, DEV_2A, DEV_2B  : array [1..150] of Double;
begin
  Application.ProcessMessages;

  if (Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
     (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
     (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D') then
  begin
    SqlText := 'SELECT Korname FROM pimpmas ' +
               ' WHERE empno = ''' + ED_CN.Text +''' ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

    GSkorname := DataModule_Tmax.Csel_gfd(1);
    L_empkorname.Caption := '('+ED_CN.Text+') '+ GSkorname;

    ED_CN.Visible  := true;
    BT_Sel.visible := true;
    Gsempno  := ED_CN.Text;
  end;

  with DBSet_Sub do
  begin
     close;
     ServiceName := 'PET1020A_sel1';
     ClearFieldInfo;
     ClearParamInfo;
     AddField('GUBUN'    , ftString ,  4  );
     AddField('EMPNO'    , ftString ,  4  );
     AddField('KORNAME'  , ftString ,  12 );
     AddField('DEPTNAME' , ftString ,  60 );
     AddField('PAYRACODE', ftString ,  3  );
     AddField('PAYRA'    , ftString ,  20 );
     AddField('PAYCLCODE', ftString ,  3  );
     AddField('PAYCL'    , ftString ,  20 );
     AddField('ASELF'    , ftString ,  6  ); // 자기평가 상태
     AddField('ADOWN1'   , ftString ,  6  ); // 1차평가 상태
     AddField('ADOWN2'   , ftString ,  6  ); // 2차평가 상태
     AddField('SELF'     , ftString ,  6  ); // VALUE 자기
     AddField('DOWN1'    , ftString ,  6  ); // VALUE 1차
     AddField('DOWN2'    , ftString ,  6  ); // VALUE 2차
     AddField('E1EMPNO'  , ftString ,  6  ); // 피평가자
     AddField('OBJSTATE' , ftString ,  6  ); // 평가표번호
     AddField('ESCORE'   , ftString ,  6  ); // 상향평가 점수 : 역량
     AddField('E1HAP'    , ftString ,  6  ); // 상향평가 점수 : VALUE
     AddField('TOTRESCR' , ftString ,  6  ); // 최종 업적 점수
     AddField('ABILSCR1' , ftString ,  6  ); // 역량 1차 점수
     AddField('OTHER'    , ftString ,  2  ); // 태도 2차
     AddField('REGRADE'  , ftString ,  10 ); // 최종 업적 등급
     AddField('ABILSCR2' , ftString ,  10 ); // 역량 2차 점수
     AddField('HSCORE'   , ftString ,  10 ); // 역량 자기 점수
     AddField('ABILSCR'  , ftString ,  10 ); // 최종 역량 점수
     AddField('PGROUP'   , ftString ,  10 ); // 그굽
     AddField('BPAYSCORE', ftString ,  10 ); // 초종평가 점수
     AddField('BPAYCLASS', ftString ,  10 ); // 최종평가 등급
     AddField('VALUE1'   , ftString ,  6  ); // Value 1차상사
     AddField('VALUE2'   , ftString ,  6  ); // Value 2차상사
     SQL.Clear;
     SQL.Text :=
       'SELECT DECODE('''+GSEMPNO+''',T1.E1EMPNO,''1차'',T1.E2EMPNO,''2차'',T1.E3EMPNO,''2차'') GUBUN, '+#13+  //구분
       '       T1.EMPNO,                                                            '+ #13+    //사번
       '       T1.KORNAME,                                                          '+ #13+    //성명
       '       (Select NVL(DEPTNAME||'' ''||DEPTNA3,'''') From Pycdept Where orgnum = T1.orgnum And Deptcode = T1.Deptcode) DEPTNAME, '+ #13+   //소속
       '       T1.PAYRA,   (Select CODENAME From PYCCODE Where CODEID = ''I113'' AND CODENO = T1.PAYRA ), '+ #13+         //PAYRA직책
       '       T1.PAYCL,   (Select CODENAME From PYCCODE Where CODEID = ''I112'' AND CODENO = T1.PAYCL ), '+ #13+         //PAYCL BAND
       '       DECODE(T1.RVALCONYN,  ''Y'', ''완료'', ''미완료''), '+ #13+//ASELF 역량자기평가완료여부
       '       DECODE(T1.E1VALCONYN, ''Y'', ''완료'', ''미완료''), '+ #13+//ADOWN1 역량1차평가완료여부
       '       DECODE(T1.E2EMPNO,NULL,'''',DECODE(T1.E2VALCONYN, ''Y'', ''완료'', ''미완료'')), '+ #13+//ADOWN2 역량2차평가완료여부
       '       DECODE(T1.RVSCORE,0,'''',T1.RVSCORE), '+ #13+//SELF   VALUE자기평가
       '       DECODE(TW.E1VALCONYN, ''Y'', ''완료'', ''미완료''), '+ #13+//DOWN1 ',VALUE평가 상태|1차'
       '       DECODE(T1.E2EMPNO,NULL,'''',DECODE(TW.E2VALCONYN, ''Y'', ''완료'', ''미완료'')), '+ #13+//DOWN2 'VALUE평가 상태|2차'
       '       T1.E1EMPNO, '+ #13+//E1EMPNO
       '       DECODE(TW.RVALOBJYN,NULL,''진행전'',''X'',''미합의'',''Y'',''신청'',''N'',''미신청'') OBJSTATE,'+ #13+//OBJSTATE
       '       NVL(decode(nvl(TW.WSCORE,0),0,'''',TW.WSCORE), 0) ESCORE, '+#13+     //최종업적|점수'
       '       NVL(DECODE(TH.Vscore,0,'''',TH.Vscore),0), '+ #13+//E1HAP   'VALUE평가|상향점수'
       '       NVL(DECODE(TH.Cscore,0,'''',TH.Cscore),0), '+ #13+//ESCORE  '리더십역량평가 |상향점수'
       '       DECODE(T1.E1SCORE,0,'''',T1.E1SCORE), '+ #13+//ABILSCR1'역량평가 상태|1차점수'
       '       DECODE('''+GSEMPNO+''',T1.E2EMPNO, ''e2'',T1.E3EMPNO,''e3''), '+ #13+  ////OTHER
       '       '''', '+ #13+//REGRADE'최종업적|등급'
       '       DECODE('''+GSEMPNO+''',T1.E2EMPNO, DECODE(T1.E2SCORE,0,'''',T1.E2SCORE),T1.E3EMPNO,DECODE(T1.E3SCORE,0,'''',T1.E3SCORE)), '+ #13+
       '       DECODE(T1.RESCORE,0,'''',T1.RESCORE), '+ #13+//HSCORE   역량 자기평가
       '       '''', '+ #13+//'최종역량|점수'
       '       '''', '+ #13+//PGROUP
       '       '''', '+ #13+//BPAYSCORE '최종평가|점수'
       '       '''', '+ #13+//BPAYCLASS '최종평가|등급'
       '       DECODE(V1SCORE,0,'''',V1SCORE) Value1, '+#13+ //Value 상사평가.
       '       DECODE('''+GSEMPNO+''',T1.E2EMPNO,DECODE(V2SCORE,0,'''',V2SCORE),T1.E3EMPNO,DECODE(T1.V3SCORE,0,'''',T1.V3SCORE)) Value2  '+ #13+ //Value 상사평가.
       'FROM PETREMAS T1,                                                        '+ #13+
       '     ( SELECT A.EMPNO, round((B.ESCORE*0.9+PROESCORE*0.1),2) WSCORE, a.RVALOBJYN,a.E1VALCONYN,a.E2VALCONYN  '+ #13+
       '         FROM PEHREMAS A,                                                '+ #13+
       '            (SELECT EMPNO,SUM(ESCORE) ESCORE FROM PEHREAIM_DET           '+ #13+
       '              WHERE RABASDATE ='''+SRABASDATE+''' GROUP BY EMPNO) B      '+ #13+
       '        WHERE  A.RABASDATE = '''+SRABASDATE+'''                          '+ #13+
       '          AND  A.RESTIYN   = ''Y''                                       '+ #13+
       '          AND  A.EMPNO = B.EMPNO                                         '+ #13+
       '          AND (A.E1EMPNO ='''+GSEMPNO+''' OR A.E2EMPNO ='''+GSEMPNO+'''  ) ) TW, '+ #13+
       '     (select pempno, pdeptcode, round(avg(elscore),2) Cscore             '+ #13+  //round(avg(elscore*0.5+ecscore*0.5),2) Cscore
       '             ,round(avg(evscore),2) Vscore                               '+ #13+
       '        from pesremas                                                    '+ #13+
       '       where rabasdate = '''+SRABASDATE+'''                              '+ #13+
       '         and RVALCONYN = ''Y''                                           '+ #13+
       '       group by pempno, pdeptcode) TH                                    '+ #13+
       'WHERE T1.RABASDATE = '''+SRABASDATE+'''                                  '+ #13+
       'AND (T1.E1EMPNO ='''+GSEMPNO+''' OR T1.E2EMPNO ='''+GSEMPNO+''' OR T1.E3EMPNO ='''+GSEMPNO+''' )        '+ #13+
       'AND T1.EMPNO    = TW.EMPNO(+)                                            '+ #13+
       'AND T1.EMPNO    = TH.PEMPNO(+)                                           '+ #13+
       'AND T1.DEPTCODE = TH.PDEPTCODE(+)                                        ';

     if RB1.Checked then  //구분순
        SQL.Add(' ORDER BY DECODE('''+GSEMPNO+''',T1.E1EMPNO,''1차'',T1.E2EMPNO,''2차''),  (Select NVL(DEPTNAME||'' ''||DEPTNA3,'''') From Pycdept Where orgnum = T1.orgnum And Deptcode = T1.Deptcode), T1.PAYCL, T1.KORNAME  ');
     if RB2.Checked then
        SQL.Add(' ORDER BY T1.KORNAME ');
     if RB3.Checked then
        SQL.Add(' ORDER BY (Select NVL(DEPTNAME||'' ''||DEPTNA3,'''') From Pycdept Where orgnum = T1.orgnum And Deptcode = T1.Deptcode) ');
     if RB4.Checked then
        SQL.Add(' ORDER BY T1.PAYCL ');
     if RB6.Checked then
        SQL.Add(' ORDER BY TW.WSCORE ');
     if RB7.Checked then
        SQL.Add(' ORDER BY DECODE('''+GSEMPNO+''',T1.E2EMPNO, T1.E2SCORE,T1.E1SCORE), T1.E1SCORE ');
     Open;

     edit1.Text :=SQL.TEXT;
     if not((Pempno =workemp1) or (Pempno =workemp2) or (copy(Pempno,1,1) ='D')) then
       if DBSet_Sub.recordcount <= 0 then
       begin
         MessageDlg('상사평가 대상자가 아닙니다.' + #13#13 +
                    '프로그램은 자동 종료됩니다.', mtConfirmation, [mbOK],0);
         Application.Terminate;
       end;

     DisableControls;

     CheckGubun := '1차';   CheckGubun1 := '';
     E_AVG_1V_count := 0;   E_AVG_1A_count := 0;   E_AVG_1B_count := 0;   //1차Values, 1차업적, 1차역량
     E_AVG_1V_SUM   := 0;   E_AVG_1A_SUM   := 0;   E_AVG_1B_SUM   := 0;
     E_AVG_2V_count := 0;   E_AVG_2A_count := 0; E_AVG_2B_count := 0;     //2차Values, 2차업적, 2차역량
     E_AVG_2V_SUM   := 0;   E_AVG_2A_SUM   := 0; E_AVG_2B_SUM   := 0;

     E_AVGYN_Type   := 'Y'; E_AVGYN_CheckNM1 := ''; E_AVGYN_CheckNM2 := ''; E_DEVYN_CheckNM := '';

     for I := 1 to 150 do
     begin
       DEV_1V[I] := 0; DEV_1A[I] := 0; DEV_1B[I] := 0;
       DEV_2V[I] := 0; DEV_2A[I] := 0; DEV_2B[I] := 0;
     end;

     while not Eof do
     begin
       if FieldByName('GUBUN').AsString = '1차' then
         CheckGubun1 := '1차';

       if FieldByName('GUBUN').AsString = '2차' then
         CheckGubun := '2차';

       //하은영

       if FieldByName('GUBUN').AsString = '1차' then
       begin
         if FieldByName('VALUE1').AsString <> '' then
         begin
           inc(E_AVG_1V_count);
           E_AVG_1V_SUM := E_AVG_1V_SUM + FieldByName('VALUE1').AsFloat;

           DEV_1V[E_AVG_1V_count] := FieldByName('VALUE1').AsFloat;
         end;

         if FieldByName('TOTRESCR').AsString <> '' then //업적
         begin
           inc(E_AVG_1A_count);
           E_AVG_1A_SUM := E_AVG_1A_SUM + FieldByName('ESCORE').AsFloat;

           DEV_1A[E_AVG_1A_count] := FieldByName('TOTRESCR').AsFloat;
         end;

         if FieldByName('ABILSCR1').AsString <> '' then //1차 역량
         begin
           inc(E_AVG_1B_count);
           E_AVG_1B_SUM := E_AVG_1B_SUM + FieldByName('ABILSCR1').AsFloat;

           DEV_1B[E_AVG_1B_count] := FieldByName('ABILSCR1').AsFloat;
         end;

         if (TrimRight(FieldByName('ADOWN1').AsString) = '미완료')  then
         begin
           E_AVGYN_Type    := 'N';
           E_AVGYN_CheckNM1 := '피평가자별 미완료 인원 존재';
         end;
       end;

       if FieldByName('GUBUN').AsString = '2차' then
       begin

         if FieldByName('VALUE2').AsString <> '' then //Values
         begin
           inc(E_AVG_2V_count);
           E_AVG_2V_SUM := E_AVG_2V_SUM + FieldByName('VALUE2').AsFloat;

           DEV_2V[E_AVG_2V_count] := FieldByName('VALUE2').AsFloat;
         end;

         if FieldByName('TOTRESCR').AsString <> '' then //업적
         begin
           inc(E_AVG_2A_count);
           E_AVG_2A_SUM := E_AVG_2A_SUM + FieldByName('TOTRESCR').AsFloat;

           DEV_2A[E_AVG_2A_count] := FieldByName('TOTRESCR').AsFloat;
         end;

         if FieldByName('ABILSCR2').AsString <> '' then //1차 역량
         begin
           inc(E_AVG_2B_count);
           E_AVG_2B_SUM := E_AVG_2B_SUM + FieldByName('ABILSCR2').AsFloat;

           DEV_2B[E_AVG_2B_count] := FieldByName('ABILSCR2').AsFloat;
         end;

         if (TrimRight(FieldByName('ADOWN1').AsString) = '미완료')  then
         begin
           E_AVGYN_Type    := 'N';
           E_AVGYN_CheckNM1 := '피평가자별 미완료 인원 존재';
         end;
       end;

       next;
     end;

     First;
     EnableControls;

     if (E_AVG_1A_SUM <> 0) and (E_AVG_1A_count <> 0) then
     begin
       E_AVG_1A.Value := ROUND(E_AVG_1A_SUM / E_AVG_1A_count * 100) / 100;
     end;

     if (E_AVG_2A_SUM <> 0) and (E_AVG_2A_count <> 0) then            //2차평가자는 미평가
     begin
       E_AVG_1A.Value := ROUND(E_AVG_2A_SUM / E_AVG_2A_count * 100) / 100;
     end;

     if E_AVGYN_Type = 'Y' then
       E_AVGYN.Text := '완료'
     else
       E_AVGYN.Text := '미완료';
  end;
end;

procedure TFM_Sub.FormShow(Sender: TObject);
begin
  if FL_Start then
  begin
    Application.ProcessMessages;
    FL_Start := False;
    GSgrade       := Hinsa_Param(cmdLine,4);
    SF_sub.Refresh;

    TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
    TMaxSession.LabelName   := 'HANAROHPER';
    TMaxSession.Connect     := False;
    TMaxSession.Host        := Hinsa_Param(cmdline,10);
    TMaxSession.Port        := '9999';

     try
          TMaxSession.Connect := True;
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;

    //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
      Application.Terminate;

    with DBSet2 do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT  Value1                '+#13+
                  '  FROM pehrebas               '+#13+
                  ' WHERE rabasdate = ''00000000'' '+
                  '   AND gubun     = ''00''     '+#13+
                  '   AND sgubun    = ''0001''     ';
      Close;
      ServiceName := 'PED0000A_common';
      ClearFieldInfo;
      AddField('SEL_DATA'    , ftString, 100);
      Open;

      sRabasdate := FieldByName('SEL_DATA').AsString;
//      sRabasdate := '20111130'; //Test
    end;


    SqlText := 'SELECT  Value1 ||'';''|| Value2 from pehrebas where rabasdate ='''+sRabasdate+''' and gubun     = ''31'' AND sgubun    = ''0002''';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;


    if DataModule_Tmax.Csel_gfd(2) <> '' then
      L_Tdev.Value  :=strtofLOAT(DataModule_Tmax.Csel_gfd(2));

    // ※ 주의 : 프로그램 테스트 완료후 주석 부분을 해제 후 Rebuild해서 서버에 올린다..
    //if (ONE_App.Check) or (not ONE_App.MainCheck) then
    //  Application.Terminate;
    if GSgrade[1] > 'B' then
    begin
      sLoginGrant := '일반사용자';
      GSempno       := Hinsa_Param(cmdLine,1);
      GSkorname     := Hinsa_Param(cmdLine,2);
    end
    else begin  //관리자 접속
      sLoginGrant := '관리자';
      GSempno       := Hinsa_Param(cmdLine,1);
      GSkorname     := Hinsa_Param(cmdLine,2);
    end;

    SqlText := 'SELECT  Value1 ||'';''|| Value2||'';''|| Value3||'';''|| Value4||'';''|| Value5 from pehrebas where rabasdate ='''+sRabasdate+''' and gubun     = ''11'' AND sgubun    = ''0005''';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

    workemp1 := DataModule_Tmax.Csel_gfd(1);
    workemp2  :=DataModule_Tmax.Csel_gfd(2);
    workemp3 := DataModule_Tmax.Csel_gfd(3);
    workemp4  :=DataModule_Tmax.Csel_gfd(4);
    workemp5  :=DataModule_Tmax.Csel_gfd(5);

    Pempno := Gsempno;

    if (Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
       (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
       (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D') then
    Excel.Visible := True;

    L_empkorname.Caption := '('+Gsempno+') '+ GSkorname;
    BT_SelClick(nil);
  end;
end;

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Sub.Btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sub.Btn_EvalClick(Sender: TObject);
var sqltext : string;
begin
  if (DBSet_Sub.FieldByName('GUBUN').AsString = '2차') and
     (DBSet_Sub.FieldByName('ADOWN1').AsString = STR_N) then
  begin
    MessageDlg('아직 1차평가중입니다.'#13#13+
               '1차평가 완료후 작업 하시기 바랍니다.',mtInformation,[mbOK],0);
    if not((Pempno =workemp1) or (Pempno =workemp2) or (copy(Pempno,1,1) ='D')) then Exit;
  end;

  if (DBSet_Sub.FieldByName('ASELF').AsString = STR_N)  then
  begin
     if MessageDlg('피평가자가 자기평가를 완료하지 않았습니다. '+#13#13+
                   '상사(하향) 평가를 그대로 진행하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;
{
  //하은영
  MessageDlg('현재는 평가 시스템 테스트 기간입니다. 공지사항에 안내된 평가시기에 평가하시기 바랍니다.'#13#13+
             '지금 입력하시는 자료는 자동 삭제됩니다.',mtInformation,[mbOK],0);
}
  Ppaycl := DBSet_Sub.FieldByName('payclcode').AsString;
  if (DBSet_Sub.FieldByName('GUBUN').AsString = '1차') then
  begin
     FM_Main       := TFM_Main.Create(nil);
     FM_Main.SB_Help.Panels[1].Text := '데이터를 조회중입니다.... 잠시만 기다려 주십시요';
     FM_Main.var_korname := DBSet_Sub.FieldByName('KORNAME').AsString;
     FM_Main.var_empno := DBSet_Sub.FieldByName('empno').AsString;

{
     FM_Main.ED_empno.Text := DBSet_Sub.FieldByName('empno').AsString + ' - ' + DBSet_Sub.FieldByName('Korname').AsString;
     FM_Main.L_Deptname.ValueCaption := DBSet_Sub.FieldByName('Deptname').AsString;
     FM_Main.L_Payclname.ValueCaption:= DBSet_Sub.FieldByName('Paycl').AsString;
     FM_Main.L_payraname.ValueCaption:= DBSet_Sub.FieldByName('payra').AsString;
     FM_Main.Label14.Caption :=  trim(DBSet_Sub.FieldByName('payra').AsString)+ '입니다.';
}

     SqlText := 'select b.deptname||'';''||c.codename||'';''||d.codename||'';''||e.codename||'';''||'+
                       'f.dutykindname||'';''||a.paycldate||'';''||a.empdate  '+
                  'from pimpmas a, pycdept b, pyccode c, pyccode d, pyccode e, pishrdukind f '+
                 'where a.empno = '''+ DBSet_Sub.FieldByName('empno').AsString+ ''' '+
                   'and a.orgnum = b.orgnum and a.deptcode = b.deptcode '+
                   'and a.paycl = c.codeno (+) and c.codeid(+) = ''I112'' '+
                   'and a.payra = d.codeno (+) and d.codeid(+) = ''I113'' '+
                   'and a.jobgun = e.codeno (+) and e.codeid(+) = ''I115'' '+
                   'and a.jobkind = f.dutykind (+)'                           ;
//                   'and a.empno = g.empno and g.rabasdate = '''+Srabasdate+'''';
     with TMaxDataSet_HInsa do
     begin
        Close;
        ServiceName := 'PTA1010B_common';
        ClearFieldInfo;
        AddField('SEL_DATA', ftString, 2000);
        ClearParamInfo;
        SQL.Text := SqlText;
        Edit1.Text :=  SQL.Text;
        Open;
        if RecordCount > 0 then
        begin
           FM_Main.ED_empno.Text           := DBSet_Sub.FieldByName('empno').AsString +' - ' +DBSet_Sub.FieldByName('KORNAME').AsString;
           FM_Main.ED_empno.Hint           := DBSet_Sub.FieldByName('empno').AsString;
           FM_Main.L_Deptname.ValueCaption := Csel_gfd(1);
           FM_Main.L_Payclname.ValueCaption:= Csel_gfd(2);
           FM_Main.L_payraname.ValueCaption:= Csel_gfd(3);
           FM_Main.L_jobgun.ValueCaption   := Csel_gfd(4);
           FM_Main.L_jobkind.ValueCaption  := Csel_gfd(5);
           FM_Main.L_paycldate.Text        := Csel_gfd(6);
           FM_Main.L_empdate.Text          := Csel_gfd(7);
           FM_Main.Label14.Caption :=  trim(Csel_gfd(3))+ '입니다.';
        end;
        close;
     end;
//     FM_Main.ED_empno.PL_get_singledata;
     FM_Main.SB_Help.Panels[1].Text := '데이터를 조회를 완료 하였습니다.';

     FM_Main.Show;
     Application.ProcessMessages;
  end
  else if (DBSet_Sub.FieldByName('GUBUN').AsString = '2차') then
  begin
     FM_Main1       := TFM_Main1.Create(nil);
     FM_Main1.SB_Help.Panels[1].Text := '데이터를 조회중입니다.... 잠시만 기다려 주십시요';
     FM_Main1.var_korname := DBSet_Sub.FieldByName('KORNAME').AsString;
     FM_Main1.var_empno   := DBSet_Sub.FieldByName('empno').AsString;

     //2006.11.10 하은영 수정   기술 팀장 구분
     FM_Main1.var_no      := DBSet_Sub.FieldByName('other').AsString;

     FM_Main1.Show;
     Application.ProcessMessages;


     SqlText := 'select b.deptname||'';''||c.codename||'';''||d.codename||'';''||e.codename||'';''||'+
                       'f.dutykindname||'';''||a.paycldate||'';''||a.empdate||'';''||a.paycl '+
                 'from pimpmas a, pycdept b, pyccode c, pyccode d, pyccode e, pishrdukind f '+
                 'where a.empno = '''+ DBSet_Sub.FieldByName('empno').AsString+ ''' '+
                   'and a.orgnum = b.orgnum and a.deptcode = b.deptcode '+
                   'and a.paycl = c.codeno (+) and c.codeid(+) = ''I112'' '+
                   'and a.payra = d.codeno (+) and d.codeid(+) = ''I113'' '+
                   'and a.jobgun = e.codeno (+) and e.codeid(+) = ''I115'' '+
                   'and a.jobkind = f.dutykind (+)';
     with TMaxDataSet_HInsa do
     begin
        Close;
        ServiceName := 'PTA1010B_common';
        ClearFieldInfo;
        AddField('SEL_DATA', ftString, 2000);
        ClearParamInfo;
        SQL.Text := SqlText;
        Open;
        if RecordCount > 0 then
        begin
           FM_Main1.ED_empno.Text           := DBSet_Sub.FieldByName('empno').AsString +' - ' +DBSet_Sub.FieldByName('KORNAME').AsString;
           FM_Main1.ED_empno.Hint           := DBSet_Sub.FieldByName('empno').AsString;
           FM_Main1.L_Deptname.ValueCaption := Csel_gfd(1);
           FM_Main1.L_Payclname.ValueCaption:= Csel_gfd(2);
           FM_Main1.L_payraname.ValueCaption:= Csel_gfd(3);
           FM_Main1.L_jobgun.ValueCaption   := Csel_gfd(4);
           FM_Main1.L_jobkind.ValueCaption  := Csel_gfd(5);
           FM_Main1.L_paycldate.Text        := Csel_gfd(6);
           FM_Main1.L_empdate.Text          := Csel_gfd(7);
           FM_Main1.L_payclname.Hint        := Csel_gfd(8);
           FM_Main1.Label14.Caption :=  trim(Csel_gfd(3))+ '입니다.';

        end;
        close;
     end;
//     FM_Main1.ED_empno.PL_get_singledata;
     FM_Main1.SB_Help.Panels[1].Text := '데이터를 조회를 완료 하였습니다.';

  end;

end;

procedure TFM_Sub.E_AdminLoginClick(Sender: TObject);
begin
  if sLoginGrant = '관리자' then
  begin
//    FM_Admin := TFM_Admin.Create(Self);
//
//    FM_Admin.ShowModal;
//
//    GSempno  := FM_Admin.e_eempno.Text;

  end
  else begin
    GSempno   := Hinsa_Param(cmdLine,1);
    GSkorname := Hinsa_Param(cmdLine,2);
  end;
  BT_SelClick(nil);
  L_empkorname.Caption := '('+GSempno+')'+ GSkorname;
end;

procedure TFM_Sub.DS_SubDataChange(Sender: TObject; Field: TField);
begin
  Lwork := DBSet_Sub.FieldByName('gubun').AsString;
end;

procedure TFM_Sub.RB1Click(Sender: TObject);
begin
  BT_SelClick(BT_Sel);
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TFM_Sub.DBGrd_E2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  TW, X, Y: integer;
begin
  with DBGrd_E2.Canvas do
  begin
    if (DBSet_Sub.FieldByName('PAYCL').AsString ='과장') then
    begin
      Brush.Color := $00DFDFDF;
    end;
    if gdSelected in State then
    begin
      Brush.Color := $00EEFE96;//$00FAFDEE;//$00FFE8D0;//$00FEEDED;
    end;
     Font.Style := [];
    if (Column.Field.AsString = STR_D) or (Column.Field.AsString = STR_Y) then
      Font.Color := clBlue
    else
    if (Column.Field.AsString = STR_N) or (Column.Field.AsString = STR_C) then
      Font.Color := $00404080
    else if (Column.Field.AsString = '반려중') then
      Font.Color := clRed
    else if ((Column.Field.AsString = '미합의')) then
      Font.Color := clFuchsia
    else
       Font.Color := clWindowText;
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
      Y := Rect.Top+2
    end else
    begin
      X := (Rect.Left + Rect.Right -2 - TW) div 2;
      Y := Rect.Top+2
    end;

      TextOut(X,Y,Column.Field.AsString);
  end;
end;

function TFM_Sub.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Sub.DBGrd_E2CellClick(Column: TColumnEh);
begin
   If (DBSet_Sub.Fields[16].AsString = '') Then pESCORE := '0' //상향평가 점수
   Else  pESCORE := DBSet_Sub.Fields[16].AsString;
end;

procedure TFM_Sub.PrintClick(Sender: TObject);
begin
  try
    PrintForm := TPrintForm.Create(Application);
    PrintForm.QuickRep1.Preview;
  finally
    PrintForm1.free;
  end;
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
  XL.WorkSheets[1].Name := Copy(sRabasdate,1,4)+'년 평가 팀장 List';  //시트명 부여
  XL.Range['A1:J2'].Merge;                       //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := Copy(sRabasdate,1,4)+'년 평가 팀장 List';
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

end.




