unit pic4020a4;//BAND조정점수 계산

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PeJeonLabel, StdCtrls, Mask, pebtnedit, peoutlookbtn, ExtCtrls,
  pegradpanl, Gauges, pecheckbox, pedballutil, DbTables, PeJeonBtnDateEdit, DB;

type
  TAData = Array[1..80] of String;

  TFm_SubForm4 = class(TForm)
    Gauge: TGauge;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    E_rabasdate: TPePanelBtnDateEdit;
    Bt_Save1: TPeJeonOutLookBtn;
    PPE_rapayclfr: TPePanelEdit;
    Label2: TLabel;
    PPE_rapayclto: TPePanelEdit;
    PPE_rabasyear: TPePanelEdit;
    PPE_pehrdate: TPePanelEdit;
    FileOpenDlg: TOpenDialog;
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    PPE_orgnum: TPePanelEdit;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Bt_Save2: TPeJeonOutLookBtn;
    Panel1: TPanel;
    CB_4: TPeJeonCheckBox;
    CB_5: TPeJeonCheckBox;
    CB_6: TPeJeonCheckBox;
    P_4: TPeJeonLabel;
    P_5: TPeJeonLabel;
    p_6: TPeJeonLabel;
    Panel2: TPanel;
    CB_3: TPeJeonCheckBox;
    CB_2: TPeJeonCheckBox;
    CB_1: TPeJeonCheckBox;
    P_3: TPeJeonLabel;
    P_2: TPeJeonLabel;
    P_1: TPeJeonLabel;
    E_Sql: TEdit;
    Chk_Group: TCheckBox;
    Label3: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    BT_Update: TPeJeonOutLookBtn;
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure Bt_Save2Click(Sender: TObject);
    procedure PeJeonOutLookBtn3Click(Sender: TObject);
    procedure BT_UpdateClick(Sender: TObject);
  private
    { Private declarations }
    procedure Convet(var Data: TAData; Value: String);
    function  fnRunSql1(iCase: Integer): Boolean;
    function  fnRunSql2(iCase: Integer): Boolean;
    function  fnRunSql3(iCase: Integer): Boolean;
    function  fnRunSql5(iCase: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  Fm_SubForm4: TFm_SubForm4;

implementation

uses peMainForm, peDm;


{$R *.DFM}

procedure TFm_SubForm4.FormShow(Sender: TObject);
begin
  MainForm.fzSetBaseDates;

  E_rabasdate.Text   := MainForm.sg_rabasdate;  // 승격기준일

  PPE_rapayclfr.Text := MainForm.sg_payclfr;    // 승격대상BAND
  PPE_rapayclto.Text := MainForm.sg_payclto;

  PPE_rabasyear.Text := MainForm.sg_rabasyear;  //승격종합점수 기준년

  PPE_pehrdate.Text := MainForm.sg_pehrdate;    //업적평가 기준년, 현 차수
  PPE_orgnum.Text   := MainForm.sg_orgnum;
  
  if  (MainForm.Gsysdate >= PPE_rabasyear.Text + '1231') And
      (MainForm.pEmpno  <> MainForm.vUpManager1) And
      (MainForm.pEmpno  <> MainForm.vUpManager2) And (Copy(MainForm.pEmpno,1,1) <> 'D') then
       Bt_Save1.Enabled := False
  else Bt_Save1.Enabled := True;

  E_Sql.Visible := False;
  //if Copy(MainForm.pEmpno,1,1) = 'D' then E_Sql.Visible := True;
end;

procedure TFm_SubForm4.Convet(var Data: TAData; Value: String);
var
  I, J, K: Integer;
  Temp: String;
begin
  J := 1;
  K := 1;
  Temp := '';

  for I := 1 to Length(Value) do
  begin
    if K = 79 then J := J;
    if Value[I] <> ',' then
    begin
         if Value[I] <> ' ' then
         begin
              Temp := Temp + Value[I];
              Inc(J);
         end;
    end
    else
    begin
         Data[K] := Temp;
         Temp := '';
         J := 1;
         Inc(K);
    end;
  end;
  Data[K] := Temp;
end;

procedure TFm_SubForm4.Bt_SaveClick(Sender: TObject);
var
  sqltext : string;
begin
  P_1.TextCaption := '';
  P_2.TextCaption := '';
  P_3.TextCaption := '';
  P_4.TextCaption := '';
  P_5.TextCaption := '';
  P_6.TextCaption := '';

  if MessageDlg('각 평가자 추출을 계속 진행하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    System.Exit;

  Gauge.Progress := 0;
  Application.ProcessMessages;

  /////////////////////////// run //////////////////////////////////////////////
  DM.Database1.StartTransaction;

  TRY
      //대상자 추출
      if CB_1.Checked then
      begin
           ///////////////////////////////////////////////////////////////////////////////////
           with DM.Query_Gen do
           begin
                //승격마스터 테이블 이전백업테이블 DROP
                Close;
                SQL.Clear;
                sqltext := 'Select 1 From all_tables Where table_name like ''PIMUPMAS_BAK' + Formatdatetime('YYYYMMDD', now())+'''';
                SQL.Add(sqltext);
                Open;

                if Recordcount >= 1 then
                begin
                     Close;
                     SQL.Clear;
                     sqltext := 'DROP TABLE PIMUPMAS_BAK' + Formatdatetime('YYYYMMDD', now());
                     SQL.Add(sqltext);
                     ExecSQL;
                end;

                //승격마스터 테이블 백업
                Close;
                SQL.Clear;
                sqltext := 'CREATE TABLE PIMUPMAS_BAK' + Formatdatetime('YYYYMMDD', now());
                SQL.Add(sqltext);
                SQL.Add('  TABLESPACE EVAL                                            ');
                SQL.Add('          AS Select * From PIMUPMAS                          ');
                SQL.Add('              Where rabasdate = ''' + E_rabasdate.Text + ''' ');
                ExecSQL;

                //연도별 평가점수 테이블 이전백업테이블 DROP
                Close;
                SQL.Clear;
                sqltext := 'Select * From all_tables Where table_name like ''PEHEVHIS_BAK' + Formatdatetime('YYYYMMDD', now())+'''';
                SQL.Add(sqltext);
                Open;

                if Recordcount >= 1 then
                begin
                     Close;
                     SQL.Clear;
                     sqltext := 'DROP TABLE PEHEVHIS_BAK' + Formatdatetime('YYYYMMDD', now());
                     SQL.Add(sqltext);
                     ExecSQL;
                end;

                //연도별 평가점수 테이블 백업
                Close;
                SQL.Clear;
                sqltext := 'CREATE TABLE PEHEVHIS_BAK' + Formatdatetime('YYYYMMDD', now());
                SQL.Add(sqltext);
                SQL.Add('  TABLESPACE EVAL                                            ');
                SQL.Add('          AS Select * From PEHEVHIS                          ');
                SQL.Add('              Where rabasyear = ''' + PPE_rabasyear.Text + ''' ');
                ExecSQL;
           end;
           ///////////////////////////////////////////////////////////////////////////////////

           MainForm.St_Help.Panels[0].Text := ' 대상자 자료를 추출중입니다.';
           Application.ProcessMessages;
           if fnRunSql1(111) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql1(112) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql1(113) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql1(114) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql1(115) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_1.TextCaption := '대상자 자료추출 완료';
      end;
      Gauge.Progress := 10;

      //Values 업적 역량 점수 계산
      if CB_2.Checked then
      begin
           MainForm.St_Help.Panels[0].Text := ' Values, 업적, 역량 점수를 계산중입니다.';
           Application.ProcessMessages;
           if fnRunSql2(200) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(201) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(202) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(203) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(211) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(212) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(213) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(214) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(215) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(216) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(217) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql2(218) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_2.TextCaption := 'Values, 업적, 역량 점수 계산 완료';
      end;
      Gauge.Progress := 40;

      //평가집단 분류별 최종등급 선정
      if CB_3.Checked then
      begin
           MainForm.St_Help.Panels[0].Text := ' 평가집단 분류별 최종등급 선정 자료를 추출중입니다.';
           Application.ProcessMessages;
           if fnRunSql3(311) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql3(312) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql3(313) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_3.TextCaption := '평가집단 분류별 최종등급 선정 자료추출 완료';
      end;
      Gauge.Progress := 50;
      /////////////////////////////////////////////////////////////////////////////////////////////


      /////////////////////////////////////////////////////////////////////////////////////////////
      //근속제외, 평점, BAND조정 포인트
      if CB_4.Checked then
      begin
           MainForm.St_Help.Panels[0].Text := ' 근속제외, 평점, BAND조정포인트 자료를 추출중입니다.';
           Application.ProcessMessages;
           if fnRunSql5(411) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(412) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(413) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(414) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(415) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(416) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_4.TextCaption := '근속제외, 평점, BAND조정 포인트 자료추출 완료';
      end;
      Gauge.Progress := 60;

      //경력입사자 승격포인트, 평점생성
      if CB_5.Checked then
      begin
           MainForm.St_Help.Panels[0].Text := ' 경력입사자 BAND조정포인트, BAND조정점수 자료를 추출중입니다.';
           Application.ProcessMessages;
           if fnRunSql5(511) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(512) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_5.TextCaption := '경력입사자 BAND조정포인트, BAND조정점수 추출 완료';
      end;
      Gauge.Progress := 70;

      //승격 MST 계산
      if CB_6.Checked then
      begin
           MainForm.St_Help.Panels[0].Text := ' BAND조정 MST 계산중입니다.';
           Application.ProcessMessages;
           if fnRunSql5(611) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(612) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(613) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(614) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(615) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(616) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(617) = False then begin DM.Database1.Rollback; System.Exit; end;
           if fnRunSql5(618) = False then begin DM.Database1.Rollback; System.Exit; end;
           P_6.TextCaption := 'BAND조정 MST 계산 완료';
      end;
      Gauge.Progress := 100;

      MainForm.St_Help.Panels[0].Text := '';

      DM.Database1.Commit;
  EXCEPT
    on E:EDBEngineError do
    begin
         DM.Database1.Rollback;
         MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);

         Gauge.Progress := 80;
         MainForm.St_Help.Panels[0].Text := '';
         Exit;
    end;
  END;

  MessageDlg('◈ 완료 ◈ 하였습니다.',mtInformation,[mbOk],0);
end;

function TFm_SubForm4.fnRunSql1(iCase: Integer): Boolean;
begin
  with DM.Query_Gen do
  begin
       //①대상자 추출 : 111~115
       case iCase of
       111:  // 1 : 승격마스터(PIMUPMAS)에 입력
       begin
            Close;
            SQL.Clear;
            SQL.Add('Delete From PIMUPMAS              ');  //승격마스터 테이블 삭제
            SQL.Add(' Where rabasdate = :p_Srabasdate  ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //BAND조정기준일
            ExecSQL;

            Close;     //업적평가 마스터 내용 승격마스터에 입력
            SQL.Clear;
            SQL.Add('Insert Into pimupmas (rabasdate, Empno,   korname, orgnum,  deptcode,');
            SQL.Add('                      paycl,     payra,   jobgun,  jobkind,          ');
            SQL.Add('                      paycldate, shiftyn, totscr)                    ');
            SQL.Add('Select :p_Srabasdate, a.Empno,     a.korname,  a.orgnum,  a.deptcode,');
            SQL.Add('       a.paycl,       a.payra,     a.jobgun,   a.jobkind,            ');
            SQL.Add('       a.paycldate,   a.shiftyn,   0              ');
            SQL.Add('  From pehremas a                                 ');
            SQL.Add(' Where a.rabasdate =  :pb_pehrdate                ');
            SQL.Add('   And a.paycl BETWEEN :p_payclfr And :p_payclto  ');
            SQL.Add('   And Substr(a.Empno,1,1) in (''0'',''1'',''2'') ');
          //SQL.Add('   And Empno not in (''2196'',''2197'',''2290'',''2291'',''2292'',''2300'',''2301'') '); //2008년 BAND조정 대상제외자
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;    //BAND조정기준일
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;   //평가기준일
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;  //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;  //BANDto
            ExecSQL;

            Close;     //업적평가 없는 사람 인사마스터에서 BAND조정마스터에 입력
            SQL.Clear;
            SQL.Add('Insert Into pimupmas (rabasdate, Empno,   korname,  ');
            SQL.Add('                      orgnum,    deptcode,          ');
            SQL.Add('                      paycl,     payra,             ');
            SQL.Add('                      jobgun,    jobkind,           ');
            SQL.Add('                      paycldate, shiftyn, totscr)   ');
            SQL.ADD('Select :p_Srabasdate, a.Empno,    a.korname,        ');
            SQL.ADD('       a.orgnum,      a.deptcode,                   ');
            SQL.ADD('       a.paycl,       a.payra,                      ');
            SQL.ADD('       a.jobgun,      a.jobkind,                    ');
            SQL.ADD('       a.paycldate,   ''N'',      0                 ');
            SQL.ADD('  From pimpmas a                                    ');
            SQL.ADD(' Where Empno not in (Select Empno From pimupmas     ');
            SQL.ADD('                      Where rabasdate=:p_Srabasdate)');
            SQL.ADD('   And pstate < ''80''                              ');
            SQL.ADD('   And Substr(Empno,1,1) in (''0'',''1'',''2'')     ');
            SQL.ADD('   And paycldate < :pb_pehrdate                     ');
            SQL.Add('   And a.paycl BETWEEN :p_payclfr And :p_payclto    ');
          //SQL.Add('   And Empno not in (''2196'',''2197'',''2290'',''2291'',''2292'',''2300'',''2301'') '); //2008년 BAND조정 대상제외자
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //BAND조정기준일
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;   //BANDto
            ExecSQL;

            //현소속, 본부코드 넣기
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                               ');
            SQL.Add('   Set (jobdept, extcode)                       ');
            SQL.Add('     = (Select jobdept,                         ');
            SQL.Add('               rpad(Substr(jobdept,1,2),5,''0'')');
            SQL.Add('          From pimpmas b                        ');
            SQL.Add('	      Where a.Empno = b.Empno)               ');
            SQL.Add(' Where a.rabasdate =  :p_Srabasdate             ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //BAND조정기준일
            ExecSQL;
       end;

       112:   // 2 : 재급년차 기준일
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a Set paycldate = (Select paycldate             ');
            SQL.Add('                                     From pimpmas               ');
            SQL.Add('                                    Where Empno = a.Empno )     ');
            SQL.Add(' Where Empno IN ( Select Empno From pimpmas                     ');
            SQL.Add('                   Where paycl BETWEEN :p_payclfr And :p_payclto');
            SQL.Add('                     And pstate < ''80''  )                     ');
            SQL.Add('   And rabasdate = :p_Srabasdate                                ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //BAND조정기준일
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;   //BANDto
            ExecSQL;

            //2005년 재급년차기준일임
            //2. 승격 한번도 안한사람들....   20050701 이전입사자 : 3개월 소급적용.
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                  ');
            SQL.Add('   Set paycldate = (Select TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -3),''yyyymmdd'')');
            SQL.Add('                      From pimpmas                                                 ');
            SQL.Add('                     Where Empno = a.Empno )                                       ');
            SQL.Add(' Where Empno IN (Select Empno From pimpmas                                         ');
            SQL.Add('                  Where cpaycldate IS NULL                                         ');
            SQL.Add('                    And paycl BETWEEN :p_payclfr And :p_payclto                    ');
            SQL.Add('                    And pstate    < ''80''                                         ');
            SQL.Add('                    And paycldate IS NOT NULL                                      ');
            SQL.Add('                    And not (Empno >= ''1932'' And Empno <= ''2099'')              ');  //두루넷 직원은 제외
            SQL.Add('                    And orgempdate < ''20050701''                                  ');  //SKB입사일...
            SQL.Add(' 		         And paycldate  < ''20050701'')                                 ');
            SQL.Add('   And rabasdate = :p_Srabasdate                                                   ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //승격기준일
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;   //BANDto
            ExecSQL;

            //4. 승격한 사람들  954   //20050301 미만입사자 : 3개월 소급적용.
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                  ');
            SQL.Add('   Set paycldate = (Select TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -3),''yyyymmdd'')');
            SQL.Add('                      From pimpmas                                                 ');
            SQL.Add('                     Where Empno = a.Empno )                                       ');
            SQL.Add(' Where Empno IN (Select Empno From pimpmas                                         ');
            SQL.Add('                  Where cpaycldate IS NOT NULL                                     ');
            SQL.Add('                    And paycl BETWEEN :p_payclfr And :p_payclto                    ');
            SQL.Add('                    And pstate     < ''80''                                        ');
            SQL.Add('                    And paycldate IS NOT NULL                                      ');
            SQL.Add('                    And not (Empno >= ''1932'' And Empno <= ''2099'')              ');  //두루넷 직원은 제외
            SQL.Add(' 		         And orgempdate < ''20050301''                                  ');  //SKB입사일...
            SQL.Add(' 		         And paycldate  < ''20050301'')                                 ');
            SQL.Add('   And rabasdate = :p_Srabasdate                                                    ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ParamByName('p_payclfr').AsString     := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString     := PPE_rapayclto.Text;   //BANDto
            ExecSQL;

            //5. 승격한 사람들  157    //20050301  입사자 : 2개월 소급적용.
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                  ');
            SQL.Add('   Set paycldate = (Select TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -2),''yyyymmdd'')');
            SQL.Add('                      From pimpmas                                                 ');
            SQL.Add('                     Where Empno = a.Empno )                                       ');
            SQL.Add(' Where Empno IN (Select Empno From pimpmas                                         ');
            SQL.Add('                  Where cpaycldate IS NOT NULL                                     ');
            SQL.Add('                    And paycl BETWEEN :p_payclfr And :p_payclto                    ');
            SQL.Add('                    And pstate     < ''80''                                        ');
            SQL.Add('                    And paycldate IS NOT NULL                                      ');
            SQL.Add('                    And not (Empno >= ''1932'' And Empno <= ''2099'')              ');  //두루넷 직원은 제외
            SQL.Add('		         And orgempdate < ''20050301''                                  ');  //SKB입사일...
            SQL.Add('		         And paycldate  = ''20050301'')                                 ');
            SQL.Add('   And rabasdate = :p_Srabasdate                                                   ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ParamByName('p_payclfr').AsString     := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString     := PPE_rapayclto.Text;   //BANDto
            ExecSQL;
       end;

       113:   //7 : 휴직이 없는 사람들 승격마스터(PIMUPMAS)에 재급기간 Update //'0052','0122','0413', '0503'' 명예퇴직 상태
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a Set payclyy = fyear_between (TO_DATE(paycldate),TO_DATE(:p_Srabasdate)),');
            SQL.Add('                      payclmm = fmonth_between(TO_DATE(paycldate),TO_DATE(:p_Srabasdate)),');
            SQL.Add('                      paycldd = fday_between  (TO_DATE(paycldate),TO_DATE(:p_Srabasdate)) ');
            SQL.Add(' Where a.paycldate IS NOT NULL                                                            ');
            SQL.Add('   And a.Empno NOT IN (Select Empno From pihexdu b                                        ');
            SQL.Add('	                     Where a.paycldate <= b.extodate                                   ');
            SQL.Add('		               And a.Empno      = b.Empno )                                    ');
            SQL.Add('   And rabasdate = :p_Srabasdate                                                          ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;
       end;

       114:  //8 : 휴직이 있는 사람들 승격마스터(PIMUPMAS)에 재급기간 Update
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                                                   ');
            SQL.Add('   Set payclyy = fyear_between ((Select TO_DATE(paycldate) + hucnt                                                  ');
            SQL.Add('                                   From ( Select a.Empno,                                                           ');
            SQL.Add('                                                 b.paycldate,                                                       ');
            SQL.Add('                                                 SUM(TO_DATE(LEAST(a.extodate,:p_Srabasdate)  , ''YYYYMMDD'')       ');
            SQL.Add('                                                   - TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''YYYYMMDD'')) hucnt');
            SQL.Add('                                            From pihexdu a, pimupmas b                                              ');
            SQL.Add('                                           Where a.Empno = b.Empno                                                  ');
            SQL.Add('                                             And b.paycldate <= extodate                                            ');
            SQL.Add('		                                  And b.rabasdate = :p_Srabasdate                                        ');
            SQL.Add('                                           GROUP BY a.Empno,b.paycldate )                                           ');
            SQL.Add('                                   Where Empno = a.Empno),  TO_DATE(:p_Srabasdate)),                                ');
            SQL.Add('       payclmm = fmonth_between((Select TO_DATE(paycldate) + hucnt                                                  ');
            SQL.Add('                                   From ( Select a.Empno,                                                           ');
            SQL.Add('                                                 b.paycldate,                                                       ');
            SQL.Add('                                                 SUM(TO_DATE(LEAST(a.extodate,:p_Srabasdate)   , ''YYYYMMDD'')      ');
            SQL.Add('                                                   - TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''YYYYMMDD'')) hucnt');
            SQL.Add('                                            From pihexdu a, pimupmas b                                              ');
            SQL.Add('                                           Where a.Empno = b.Empno                                                  ');
            SQL.Add('                                             And b.paycldate <= extodate                                            ');
            SQL.Add('	                                          And rabasdate = :p_Srabasdate                                          ');
            SQL.Add('                                           GROUP BY a.Empno,b.paycldate )                                           ');
            SQL.Add('                                   Where Empno = a.Empno),  TO_DATE(:p_Srabasdate)),                                ');
            SQL.Add('       paycldd = fday_between  ((Select TO_DATE(paycldate) + hucnt                                                  ');
            SQL.Add('                                   From ( Select a.Empno,                                                           ');
            SQL.Add('                                                 b.paycldate,                                                       ');
            SQL.Add('                                                 SUM(TO_DATE(LEAST(a.extodate,:p_Srabasdate),    ''YYYYMMDD'')      ');
            SQL.Add('                                                   - TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''YYYYMMDD'')) hucnt');
            SQL.Add('                                            From pihexdu a, pimupmas b                                              ');
            SQL.Add('                                           Where a.Empno = b.Empno                                                  ');
            SQL.Add('                                             And b.paycldate <= extodate                                            ');
            SQL.Add('		                                  And rabasdate = :p_Srabasdate                                          ');
            SQL.Add('                                           GROUP BY a.Empno,b.paycldate )                                           ');
            SQL.Add('                                   Where Empno = a.Empno),  TO_DATE(:p_Srabasdate))                                 ');
            SQL.Add(' Where a.paycldate IS NOT NULL                                                                                      ');
            SQL.Add('   And a.rabasdate = :p_Srabasdate                                                                                  ');
            SQL.Add('   And a.Empno IN (Select Empno  From pihexdu b Where a.paycldate <= b.extodate And a.Empno = b.Empno )             ');
            SQL.Add('   And a.Empno not in (''0963'',''1075'')   ');       //200307월이전 유학휴직후 학위 취득한자 제외
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;
       end;

       115:    //9, 10 : 연도별 평가점수 테이블 삭제, 입력
       begin
            Close;
            SQL.Clear;
            SQL.Add('Delete From PEHEVHIS            ');
            SQL.Add(' Where rabasyear = :p_rabasyear ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년도
            ExecSQL;

            //승격 종합 점수 입력
            Close;
            SQL.Clear;
            SQL.Add('Insert Into pehevhis                                ');
            SQL.Add('         ( rabasyear,    Empno,      korname,       ');
            SQL.Add('           orgnum,       deptcode,   paycl,         ');
            SQL.Add('           payra,        jobgun,     finalgrade )   ');
            SQL.Add('Select     :p_rabasyear, Empno,      korname,       ');
            SQL.Add('           orgnum,       deptcode,   paycl,         ');
            SQL.Add('           payra,        jobgun,     ''G0''         ');
            SQL.Add(' From pimupmas                                      ');
            SQL.Add('Where rabasdate = :p_Srabasdate                     ');
            SQL.Add('  And Empno NOT IN (Select Empno From pehevhis      ');
            SQL.Add('                     Where rabasyear = :p_rabasyear)');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
       end;
       end; // End of Case
  end; // End of DM.Query_Gen
  Result := True;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
function TFm_SubForm4.fnRunSql2(iCase: Integer): Boolean;
begin
  with DM.Query_Gen do
  begin
       case iCase of
       //②Values, 업적, 역량 점수 계산 : 200~218
       200:   //// 조직유형별 평가자 임시테이블 입력
       begin
            Close;
            SQL.Clear;
            Sql.Text := 'Delete From TMP_PPERSON  ';
            ExecSQL;

            //첫째,둘째자리- BC:L2,L1 KD:G4,G3 SS:G2
            //세번째자리   - T:팀장, M:팀원
            //네번째자리   - 2:팀-부문,팀-사장, 3:팀-실-부문
            //다섯번째자리 - B:영업('22110'기업영업,'22150'매스영업), M:비영업
            Close;
            SQL.Clear;
            Sql.Text :=
            'Insert Into TMP_PPERSON                                                                                                            '+
            'Select ph.rabasyear, pm.orgnum, pm.Empno, pm.paycl, pm.payra, pm.jobgun, pm.jobkind, pd.deptcode, pd.fieldcode,                    '+
            '   CASE WHEN (pt.empno is not null) and '+ //pm.payra in (''A81'',''A84'',''A87'',''A91'',''B50'',''C11'',''C15'',''C51'') And         //팀장.(petremas 테이블 전체)                            '+ //팀장이상보임자
            '             pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind     IN (''22110'',''22150'') THEN ''BCT3B'' '+
	    '   	WHEN (pt.empno is not null) and '+ //pm.payra in (''A81'',''A84'',''A87'',''A91'',''B50'',''C11'',''C15'',''C51'') And       '+ //팀장이상보임자
            '             pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''BCT3M'' '+
	    '   	WHEN (pt.empno is not null) and '+ //pm.payra in (''A81'',''A84'',''A87'',''A91'',''B50'',''C11'',''C15'',''C51'') And       '+ //팀장이상보임자
            '             pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind     IN (''22110'',''22150'') THEN ''BCT2B'' '+
	    '   	WHEN (pt.empno is not null) and '+ //pm.payra in (''A81'',''A84'',''A87'',''A91'',''B50'',''C11'',''C15'',''C51'') And       '+ //팀장이상보임자
            '             pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''BCT2M'' '+
//	    '   	WHEN pm.Empno = ''0221'' THEN ''BCT3M''  /*특이자*/                                                                        '+
	    '   	WHEN pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind     IN (''22110'',''22150'') THEN ''BCM3B'' '+ //이하 팀원.
	    '   	WHEN pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''BCM3M'' '+
	    '   	WHEN pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind     IN (''22110'',''22150'') THEN ''BCM2B'' '+
	    '   	WHEN pm.paycl IN (''C11'',''C21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''BCM2M'' '+
	    '   	WHEN pm.paycl IN (''D11'',''D21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind     IN (''22110'',''22150'') THEN ''KDM3B'' '+
	    '   	WHEN pm.paycl IN (''D11'',''D21'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''KDM3M'' '+
	    '   	WHEN pm.paycl IN (''D11'',''D21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind     IN (''22110'',''22150'') THEN ''KDM2B'' '+
	    '   	WHEN pm.paycl IN (''D11'',''D21'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''KDM2M'' '+
	    '   	WHEN pm.paycl IN (''D31'',''D33'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind     IN (''22110'',''22150'') THEN ''SSM3B'' '+
	    '   	WHEN pm.paycl IN (''D31'',''D33'') And LENGTH(pd.fieldcode) = 3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''SSM3M'' '+
	    '   	WHEN pm.paycl IN (''D31'',''D33'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind     IN (''22110'',''22150'') THEN ''SSM2B'' '+
	    '   	WHEN pm.paycl IN (''D31'',''D33'') And LENGTH(pd.fieldcode) <>3 And pm.jobkind NOT IN (''22110'',''22150'') THEN ''SSM2M'' '+
	    '  ELSE ''XXXXX''                                                                                                                   '+
	    '  END gubun                                                                                                                        '+
            ' From pehevhis ph, pehremas pm, petremas pt,  pycdept pd                                                                           '+
            'Where ph.Empno     = pm.Empno                                                                                                      '+
            '  And pm.orgnum    = pd.orgnum                                                                                                     '+
            '  And pm.deptcode  = pd.deptcode                                                                                                   '+
            '  And ph.rabasyear = :rabasyear                                                                                                    '+
            '  And pm.rabasdate = :pb_pehrdate                                                                                                  '+
            '  And pm.rabasdate = pt.rabasdate(+)                                                                                               '+
            '  And pm.Empno     = pt.Empno(+)                                                                                                   '+
            '  And pm.orgnum    = :orgnum                                                                                                       '+
            '  And pm.paycl BETWEEN :payclfr And :payclto                                                                                       ';
            ParambyName('rabasyear').AsString   := PPE_rabasyear.Text;
            ParambyName('pb_pehrdate').AsString := PPE_pehrdate.Text;
            ParambyName('orgnum').AsString      := PPE_orgnum.Text;
            ParambyName('payclfr').AsString     := PPE_rapayclfr.Text;
            ParambyName('payclto').AsString     := PPE_rapayclto.Text;
            ExecSQL;
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                 
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       201:     //16,17 : Values 점수 삭제, 입력
       begin
            Close; //16 : Values 점수 테이블
            SQL.Clear;
            SQL.Add('Delete From  TMP_VALUESCR2');
            ExecSQL;

            //17 : 역량점수 입력
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TMP_VALUESCR2  	                                                                      ');
            SQL.Add('Select gubun, Empno, e3Empno, 0,                                                                         ');
            SQL.Add('  ROUND(DECODE(gubun,''BCT3B'',DECODE(e3Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*1.0, 0)) ,       ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*0.6, 0)) +       ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장2차''  ,(hap1/num)*0.4, 0)) ),      ');
            SQL.Add('		          ''BCT3M'',DECODE(e3Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*1.0, 0)),        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*0.6, 0)) +       ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장2차''  ,(hap1/num)*0.4, 0)) ),      ');
            SQL.Add('		          ''BCT2B'',SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*1.0, 0)) ,       ');
            SQL.Add('		          ''BCT2M'',SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap1/num)*1.0, 0))         ');
            SQL.Add('	           ), 4) tot_kd1,                                                                             ');
            SQL.Add('  ROUND(DECODE(gubun,''BCT3B'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('		          ''BCT3M'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values팀장2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('		          ''BCT2B'',SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('		          ''BCT2M'',SUM(DECODE(ekind || chasu,''Values팀장1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                     ''BCM3B'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('		          ''BCM3M'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('		          ''BCM2B'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('		          ''BCM2M'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('		          ''KDM3B'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('   		  ''KDM3M'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)),         ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('   		  ''KDM2B'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('   		  ''KDM2M'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                     ''SSM3B'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('   		  ''SSM3M'',DECODE(e2Empno,NULL,                                                      ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*0.6, 0)) +        ');
            SQL.Add('                               SUM(DECODE(ekind || chasu,''Values하향2차''  ,(hap/num)*0.4, 0)) ),       ');
            SQL.Add('   		  ''SSM2B'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0)) ,        ');
            SQL.Add('   		  ''SSM2M'',SUM(DECODE(ekind || chasu,''Values하향1차''  ,(hap/num)*1.0, 0))          ');
            SQL.Add('              ), 4) tot_kd2                                                                              ');
            SQL.Add('  From                                                                                                   ');
            SQL.Add(' (Select Empno,gubun,paycl,payra,deptcode, eEmpno,ekind,chasu,e2Empno,e2existyn, hap, num, e3Empno, hap1 ');
            SQL.Add('    From (Select c.gubun, c.Empno,  c.paycl,                                                             ');
            SQL.Add('                 (Select payra From pehremas Where rabasdate=a.rabasdate And Empno = a.Empno) payra,     ');
            SQL.Add('                 c.deptcode,  ''팀장하향평가자'' eEmpno, a.ekind  ekind,                                 ');
            SQL.Add('                 DECODE(b.cnt,1,''팀장1차'',2,''팀장2차'') chasu,                                        ');
            SQL.Add('                 d.e2Empno, d.e2existyn, DECODE(b.cnt,1,a.e1score, a.e2score) hap,                       ');
            SQL.Add('                 a.cnt num, d.e3Empno,   DECODE(b.cnt,1,a.e1score, a.e3score) hap1                       ');
            SQL.Add('            From (Select rabasdate, Empno, ekind, cnt, e1score, e2score, e3score  			      ');
            SQL.Add('                    From (Select rabasdate, Empno, ekind, nvl(SUM(e1score),0) e1score,                   ');
            SQL.Add('                                 nvl(SUM(e2score),0) e2score, nvl(SUM(e3score),0) e3score,               ');
            SQL.Add('                                 COUNT(ekind) cnt                                                        ');
            SQL.Add('                            From petds						                      ');
            SQL.Add('                           Where rabasdate = :pb_pehrdate                                                ');
            SQL.Add('                           GROUP BY rabasdate, Empno, ekind ) ) a,                                       ');
            SQL.Add('                 (Select ROWNUM cnt From pimpmas Where ROWNUM < 3 ) b,                                   ');
            SQL.Add('   	      (Select * From TMP_PPERSON Where rabasyear = :p_rabasyear) c,		              ');
            SQL.Add('   	      (Select * From pehremas    Where rabasdate = :pb_pehrdate) d 		              ');
            SQL.Add('           Where c.Empno = a.Empno                                                                       ');
            SQL.Add('   	      And c.Empno = d.Empno                                                                   ');
            SQL.Add('   	      And a.rabasdate = d.rabasdate                                                           ');
            SQL.Add('           UNION                                                                                         ');
            SQL.Add('          Select ppr.gubun, ppr.Empno,                                                                   ');
            SQL.Add('                 ppr.paycl, phr.payra, ppr.deptcode,                                                     ');
            SQL.Add('                 pdl.eEmpno,pdl.ekind,                                                                   ');
            SQL.Add('                 DECODE(pdl.eEmpno,phr.e1Empno,''하향1차'',phr.e2Empno,''하향2차'',''평가자없음'') chasu,');
            SQL.Add('                 phr.e2Empno, phr.e2existyn,    		                                              ');
            SQL.Add('                 NVL(SUM(pdl.score),0) hap,                                                              ');
            SQL.Add('                 DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num,                                     ');
            SQL.Add('                 '''' e3Empno, 0 hap1                                                                    ');
            SQL.Add('           From  pehremas phr, pesdl pdl, TMP_PPERSON ppr                                                ');
            SQL.Add('           Where phr.Empno     = ppr.Empno                                                               ');
            SQL.Add('             And phr.rabasdate = pdl.rabasdate                                                           ');
            SQL.Add('             And phr.Empno     = pdl.Empno                                                               ');
            SQL.Add('             And phr.rabasdate = :pb_pehrdate                                                            ');
            SQL.Add('             And ppr.rabasyear = :p_rabasyear                                                            ');
            SQL.Add('           GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra, ppr.deptcode,  ');
            SQL.Add('                    pdl.ekind, pdl.eEmpno, phr.e2Empno, phr.e2existyn                                    ');
            SQL.Add('           UNION                                                                                         ');
            SQL.Add('          Select ppr.gubun, ppr.Empno,                                                                   ');
            SQL.Add('                 ppr.paycl, phr.payra, ppr.deptcode,                                                     ');
            SQL.Add('                 ''비보임평가자'' eEmpno, pdh.ekind,                                                     ');
            SQL.Add('                 ''비보임'' chasu,  phr.e2Empno, phr.e2existyn,                                          ');
            SQL.Add('                 NVL(SUM(pdh.score),0) hap,                                                              ');
            SQL.Add('                 DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num,                                     ');
            SQL.Add('                 '''' e3Empno, 0 hap1        			           			      ');
            SQL.Add('            From pehremas phr, pesdc pdh, TMP_PPERSON ppr                                                ');
            SQL.Add('           Where phr.Empno     = ppr.Empno                                                               ');
            SQL.Add('             And phr.rabasdate = pdh.rabasdate                                                           ');
            SQL.Add('             And phr.Empno     = pdh.Empno                                                               ');
            SQL.Add('             And phr.rabasdate = :pb_pehrdate                                                            ');
            SQL.Add('             And ppr.rabasyear = :p_rabasyear                                                            ');
            SQL.Add('             And length(pdh.eEmpno) = 16                                                                 ');
            SQL.Add('           GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra, ppr.deptcode,  ');
            SQL.Add('                    pdh.ekind, phr.e2Empno, phr.e2existyn                                                ');
            SQL.Add('        )                                                                                                ');
            SQL.Add('   )			                                                                              ');
            SQL.Add('GROUP BY Empno, gubun, e2Empno, e3Empno		                                                      ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 15;
       end;

       202:    //17 : Values점수 입력최종 마무리
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update TMP_VALUESCR2 a                                                            ');
            SQL.Add('    Set tot_kd = (Select DECODE(e3Empno, null, tot_kd2,                           '); //3차가 없으면 1,2차 비율 합계(tot_kd2) 반영
            SQL.Add('                         ROUND((nvl(tot_kd1,0) * 0.5) + (nvl(tot_kd2,0) * 0.5),4))');
            SQL.Add('                    From TMP_VALUESCR2                                            ');
            SQL.Add('		        Where a.Empno = Empno )                                        ');
            ExecSQL;

            Gauge.Progress := 16;
       end;

       203:    //18 : 평가이력에 하반기 Values점수 Update
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                                ');
            SQL.Add('   Set valuescr2                                 ');
            SQL.Add('    = (Select b.tot_kd                           ');
            SQL.Add('         From TMP_VALUESCR2 b                    ');
            SQL.Add('	     Where a.Empno     = b.Empno              ');
            SQL.Add('	       And a.rabasyear = :p_rabasyear  )      ');
            SQL.Add('Where a.rabasyear = :p_rabasyear                 ');
            SQL.Add('  And EXISTS (Select 1 From TMP_VALUESCR2 b      ');
            SQL.Add('	            Where a.Empno     = b.Empno       ');
            SQL.Add('	              And a.rabasyear = :p_rabasyear )');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 17;
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       211: //11, 12 : 평가이력에 업적점수
       begin
            Close;  //평가이력에 업적점수 삭제
            SQL.Clear;
            SQL.Add('Delete From TMP_RESULT2   ');
            ExecSQL;

            Close;     //평가이력에 업적점수 테이블 입력
            SQL.Clear;
            SQL.Add('Insert Into TMP_RESULT2                                                                       ');
            SQL.Add('Select a.Empno,                                                                               ');
            SQL.Add('       (NVL(eac.each_hap,0) + NVL(b.econtrscr,0) + NVL(alt.all_hap,0)) * 0.9 +                ');
            SQL.Add('        NVL(c.PROESCORE,0)                                             * 0.1  tot_hap         ');//업적평가 1차평가자점수(업무목표점수(90%)+과정점수(10%))
            SQL.Add('  From (Select b.rabasdate,  b.Empno, SUM(NVL(b.ESCORE,0)) each_hap                           ');
            SQL.Add('          From PEHREAIM_DET b                                                                 ');
            SQL.Add('         Where b.RABASDATE =:pb_pehrdate                                                      ');
            SQL.Add('         GROUP BY b.rabasdate, b.Empno  ) eac,                                                ');
            SQL.Add('       (Select t1.rabasdate, t1.Empno,                                                        ');
            SQL.Add('               SUM(NVL(ROUND(t1.sel_data * t2.mainweight *0.01,2),0)) all_hap                 ');
            SQL.Add('          From (Select /*+ index(PK_PEHAIMHIS_COM) */ a.rabasdate, c.Empno,                   ');
            SQL.Add('                       b.taskname, b.taskcode, Substr(a.deptcode,1,4) deptcode,               ');
            SQL.Add('		            NVL(ROUND(SUM((a.detailrscore * a.detailweight)/100),2),0) sel_data    ');
            SQL.Add('     	       From pehaimhis_com a, pehreaim_bas b, pehremas c                            ');
            SQL.Add('     	      Where Substr(a.deptcode,1,4) = Substr(c.deptcode,1,4)                        ');
            SQL.Add('		        And a.rabasdate = :pb_pehrdate                                             ');
            SQL.Add('		        And c.rabasdate = :pb_pehrdate                                             ');
            SQL.Add('		        And NVL(a.eobjyn,''N'')  <> ''Y''                                          ');
            SQL.Add('		        And NVL(a.econyn,''N'')  =  ''Y''                                          ');
            SQL.Add('		        And a.rabasdate = b.rabasdate                                              ');
            SQL.Add('		        And Substr(a.deptcode,1,4) = Substr(b.deptcode,1,4)                        ');
            SQL.Add('		        And a.taskcode  = b.taskcode                                               ');
            SQL.Add('		      GROUP BY a.rabasdate, c.Empno, b.taskname, b.taskcode, Substr(a.deptcode,1,4)');
            SQL.Add('   	     ) t1,                                                                         ');
            SQL.Add('      	     (Select /*+ index(PK_PEHREAIM_COMDET) */ DISTINCT Empno,                      ');
            SQL.Add('      	             Substr(deptcode,1,4) deptcode, taskcode, mainweight                   ');
            SQL.Add('      	        From pehreaim_comdet                                                       ');
            SQL.Add('      	       Where rabasdate = :pb_pehrdate                                              ');
            SQL.Add('   	     ) t2                                                                          ');
            SQL.Add('         Where t1.deptcode = t2.deptcode                                                      ');
            SQL.Add('           And t1.taskcode = t2.taskcode                                                      ');
            SQL.Add('           And t1.Empno    = t2.Empno                                                         ');
            SQL.Add('         GROUP BY t1.rabasdate, t1.Empno      ) alt,                                          ');
            SQL.Add('       pehevhis a , pehreaim_scr b , pehremas c                                               ');
            SQL.Add(' Where a.Empno       = eac.Empno(+)                                                           ');
            SQL.Add('   And a.Empno       = alt.Empno(+)                                                           ');
            SQL.Add('   And a.Empno       = b.Empno(+)                                                             ');
            SQL.Add('   And a.Empno       = c.Empno(+)                                                             ');
            SQL.Add('   And a.rabasyear   = :p_rabasyear                                                           ');
            SQL.Add('   And b.rabasdate(+)= :pb_pehrdate                                                           ');
            SQL.Add('   And c.rabasdate(+)= :pb_pehrdate                                                           ');
            ParamByName('pb_pehrdate').AsString := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString := PPE_rabasyear.Text;   //승격종합점수 기준년  
            ExecSQL;
            Gauge.Progress := 18;
       end;

       212:    //13 : 업적점수 업데이트
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                           ');
            SQL.Add('   Set resultscr2                           ');
            SQL.Add('     = ( Select b.tot_hap                   ');
            SQL.Add('           From TMP_RESULT2 b               ');
            SQL.Add('          Where a.Empno     = b.Empno       ');
            SQL.Add('            And a.rabasyear = :p_rabasyear) ');
            SQL.Add('Where a.rabasyear = :p_rabasyear            ');
            SQL.Add('  And EXISTS (Select 1 From TMP_RESULT2 b   ');
            SQL.Add('	            Where a.Empno = b.Empno )    ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
            Gauge.Progress := 19;

            //2008년도에는 팀장도 업적평가를 하였기에 불필요하여 막음.
            {//dsa2000  Add  2007.12.    TMP_RESULT0 : Excel Import : 2007팀장 업적점수...
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                             ');
            SQL.Add('   Set resultscr2                             ');
            SQL.Add('     = ( Select resultscr2                    ');
            SQL.Add('           From TMP_RESULT0 b                 ');
            SQL.Add('          Where a.Empno     = b.Empno )       ');
            SQL.Add('Where a.rabasyear = :p_rabasyear              ');
            SQL.Add('  And EXISTS (Select 1 From TMP_RESULT0 b     ');
            SQL.Add('	        Where a.Empno = b.Empno )      ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
            Gauge.Progress := 17;}
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       213:
       begin //업적자기점수 계산
            Close;
            SQL.Clear;
            SQL.Add('Delete From TMP_RESULT2  ');
            ExecSQL;

            //평가이력에 업적자기점수 테이블 입력
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TMP_RESULT2                                                                       ');
            SQL.Add('Select a.Empno,                                                                               ');
            SQL.Add('       (NVL(eac.each_hap,0) + NVL(b.econtrscr,0) + NVL(alt.all_hap,0)) * 0.9  +               ');
            SQL.Add('        NVL(c.PRORSCORE,0)                                             * 0.1   tot_hap        ');//업적평가 1차평가자점수(업무목표점수(90%)+과정점수(10%))
            SQL.Add('  From (Select b.rabasdate, b.Empno, SUM(NVL(b.RSCORE,0)) each_hap                            ');
            SQL.Add('          From PEHREAIM_DET b                                                                 ');
            SQL.Add('         Where b.RABASDATE =:pb_pehrdate                                                      ');
            SQL.Add('         GROUP BY b.rabasdate, b.Empno                                                        ');
            SQL.Add('        ) eac,	                                                                           ');
            SQL.Add('       (Select t1.rabasdate, t1.Empno,                                                        ');
            SQL.Add('               SUM(NVL(ROUND(t1.sel_data * t2.mainweight *0.01,2),0)) all_hap                 ');
            SQL.Add('          From (Select /*+ index(PK_PEHAIMHIS_COM) */ a.rabasdate, c.Empno,                   ');
            SQL.Add('                       b.taskname, b.taskcode, Substr(a.deptcode,1,4) deptcode,               ');
            SQL.Add('		            NVL(ROUND(SUM((a.detailrscore * a.detailweight)/100),2),0) sel_data    ');
            SQL.Add('     	       From pehaimhis_com a, pehreaim_bas b, pimpmas c                             ');
            SQL.Add('     	      Where Substr(a.deptcode,1,4) = Substr(c.deptcode,1,4)                        ');
            SQL.Add('		        And a.rabasdate = :pb_pehrdate                                             ');
            SQL.Add('		        And NVL(a.eobjyn,''N'')  <> ''Y''                                          ');
            SQL.Add('		        And NVL(a.econyn,''N'')  =  ''Y''                                          ');
            SQL.Add('		        And a.rabasdate = b.rabasdate                                              ');
            SQL.Add('		        And Substr(a.deptcode,1,4) = Substr(b.deptcode,1,4)                        ');
            SQL.Add('		        And a.taskcode  = b.taskcode                                               ');
            SQL.Add('		      GROUP BY a.rabasdate, c.Empno, b.taskname, b.taskcode, Substr(a.deptcode,1,4)');
            SQL.Add('   	     ) t1,                                                                         ');
            SQL.Add('      	    (Select /*+ index(PK_PEHREAIM_COMDET) */ DISTINCT Empno,                       ');
            SQL.Add('      	            Substr(deptcode,1,4) deptcode, taskcode, mainweight                    ');
            SQL.Add('      	       From pehreaim_comdet                                                        ');
            SQL.Add('      	      Where rabasdate = :pb_pehrdate                                               ');
            SQL.Add('   	     ) t2                                                                          ');
            SQL.Add('        Where t1.deptcode = t2.deptcode                                                       ');
            SQL.Add('          And t1.taskcode = t2.taskcode                                                       ');
            SQL.Add('          And t1.Empno    = t2.Empno                                                          ');
            SQL.Add('        GROUP BY t1.rabasdate, t1.Empno					                   ');
            SQL.Add('       ) alt,   pehevhis a , pehreaim_scr b, pehremas c                                       ');
            SQL.Add(' Where a.Empno        = eac.Empno(+)                                                          ');
            SQL.Add('   And a.Empno        = alt.Empno(+)                                                          ');
            SQL.Add('   And a.Empno        = b.Empno(+)                                                            ');
            SQL.Add('   And a.rabasyear    = :p_rabasyear                                                          ');
            SQL.Add('   And b.rabasdate(+) = :pb_pehrdate                                                          ');
            SQL.Add('   And a.Empno        = c.Empno(+)                                                            ');
            SQL.Add('   And c.rabasdate(+) = :pb_pehrdate                                                          ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            //13 : 업적자기점수 업데이트
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                           ');
            SQL.Add('   Set resultscr3                           ');
            SQL.Add('     = (Select b.tot_hap                    ');
            SQL.Add('          From TMP_RESULT2 b                ');
            SQL.Add('         Where a.Empno     = b.Empno        ');
            SQL.Add('           And a.rabasyear = :p_rabasyear ) ');
            SQL.Add(' Where a.rabasyear = :p_rabasyear           ');
            SQL.Add('   And EXISTS (Select 1 From TMP_RESULT2 b  ');
            SQL.Add('                Where a.Empno = b.Empno   ) ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 20;
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       214:     //16,17 : 역량점수 삭제, 입력   : 역량점수 테이블
       begin
            Close;
            SQL.Clear;
            SQL.Add('Delete From  TMP_ABILITYSCR2');
            ExecSQL;

            //17 : 역량점수 입력
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TMP_ABILITYSCR2  	                                                                          ');
            SQL.Add('Select gubun, Empno, e3Empno, 0,                                                                             ');
            SQL.Add('  ROUND(DECODE(gubun,''BCT3B'',DECODE(e3Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*1.0, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*1.0, 0))  )*0.5 , ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*0.6, 0)) +        ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량팀장2차''  ,(hap1/num)*0.4, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*0.6, 0)) +        ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량팀장2차'',(hap1/num)*0.4, 0))  )*0.5 ),');
            SQL.Add('		          ''BCT3M'',DECODE(e3Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*1.0, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*1.0, 0))  )*0.5 , ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*0.6, 0)) +        ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량팀장2차''  ,(hap1/num)*0.4, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*0.6, 0)) +        ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량팀장2차'',(hap1/num)*0.4, 0))  )*0.5 ),');
            SQL.Add('		          ''BCT2B'',(SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*1.0, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*1.0, 0))  )*0.5  ,');
            SQL.Add('		          ''BCT2M'',(SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap1/num)*1.0, 0))  )*0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap1/num)*1.0, 0))  )*0.5   ');
            SQL.Add('	           ), 4) tot_kd1,                                                                                 ');
            SQL.Add('  ROUND(DECODE(gubun,''BCT3B'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량팀장2차''  ,(hap/num)*0.4, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량팀장2차'',(hap/num)*0.4, 0))  )*0.5  ),');
            SQL.Add('		          ''BCT3M'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량팀장2차''  ,(hap/num)*0.4, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량팀장2차'',(hap/num)*0.4, 0))  )*0.5  ),');
            SQL.Add('		          ''BCT2B'',(SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5   ,');
            SQL.Add('		          ''BCT2M'',(SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5   ,');

            SQL.Add('                     ''BCM3B'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.6, 0))  )*0.3 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0))  )*0.2 ,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0))  )*0.5 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.36,0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향2차'',(hap/num)*0.24,0))  )*0.3 +  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0))  )*0.2  ),');
            SQL.Add('		          ''BCM3M'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0))  )* 0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.6, 0))  )* 0.3 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0))  )* 0.2 , ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0))  )* 0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.36, 0))+         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향2차'',(hap/num)*0.24, 0)) )* 0.3 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0)) ) * 0.2 ),');
            SQL.Add('		          ''BCM2B'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.6, 0)) ) * 0.3 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.2  ,');
//            SQL.Add('		          ''BCM2M'',DECODE(Empno,''0022'',     /*특이자*/                                         ');
            SQL.Add('		          ''BCM2M'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*1.0, 0)) ) * 0.3 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.2 , ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''리더십역량비보임'', (hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*0.6, 0)) ) * 0.3 + ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.2  ,');

            SQL.Add('		          ''KDM3B'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0)) ) * 0.5), ');
            SQL.Add('   		  ''KDM3M'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0)) ) * 0.5), ');
            SQL.Add('   		  ''KDM2B'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('   		             SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('   		  ''KDM2M'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('   		             SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('                     ''SSM3B'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0)) ) * 0.5), ');
            SQL.Add('   		  ''SSM3M'',DECODE(e2Empno,NULL,                                                          ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('                               (SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''공통역량하향2차''  ,(hap/num)*0.4, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*0.6, 0)) +         ');
            SQL.Add('                                SUM(DECODE(ekind || chasu,''직무역량하향2차''  ,(hap/num)*0.4, 0)) ) * 0.5), ');
            SQL.Add('   		  ''SSM2B'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('   		             SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5,  ');
            SQL.Add('   		  ''SSM2M'',(SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0)) +         ');
            SQL.Add('   		             SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0)) ) * 0.5   ');
            SQL.Add('              ), 4) tot_kd2                                                                                  ');
            SQL.Add('  From                                                                                                       ');
            SQL.Add(' (Select Empno,gubun,paycl,payra,deptcode, eEmpno, ekind, chasu, e2Empno, e2existyn, hap, num, e3Empno, hap1 ');
            SQL.Add('    From (Select c.gubun, c.Empno,  c.paycl,                                                                 ');
            SQL.Add('                 (Select payra From pehremas Where rabasdate=a.rabasdate And Empno = a.Empno) payra,         ');
            SQL.Add('                 c.deptcode,  ''팀장하향평가자'' eEmpno, a.ekind  ekind,                                     ');
            SQL.Add('                 DECODE(b.cnt,1,''팀장1차'',2,''팀장2차'') chasu,                                            ');
            SQL.Add('                 d.e2Empno, d.e2existyn, DECODE(b.cnt,1,a.e1score, a.e2score) hap,                           ');
            SQL.Add('                 a.cnt  num, d.e3Empno, DECODE(b.cnt,1,a.e1score, a.e3score) hap1 				  ');
            SQL.Add('            From (Select rabasdate, Empno, ekind, cnt, e1score, e2score, e3score  			          ');
            SQL.Add('                    From (Select rabasdate, Empno, ekind, nvl(SUM(e1score),0) e1score,                       ');
            SQL.Add('                                 nvl(SUM(e2score),0) e2score, nvl(SUM(e3score),0) e3score,  COUNT(ekind) cnt ');
            SQL.Add('                            From petds						                          ');
            SQL.Add('                           Where rabasdate = :pb_pehrdate                                                    ');
            SQL.Add('                           GROUP BY rabasdate, Empno, ekind ) ) a,                                           ');
            SQL.Add('                 (Select ROWNUM cnt From pimpmas Where ROWNUM < 3 ) b,                                       ');
            SQL.Add('   	      (Select * From TMP_PPERSON Where rabasyear = :p_rabasyear) c,		                  ');
            SQL.Add('   	      (Select * From pehremas    Where rabasdate = :pb_pehrdate) d 		                  ');
            SQL.Add('           Where c.Empno = a.Empno                                                                           ');
            SQL.Add('   	      And c.Empno = d.Empno                                                                       ');
            SQL.Add('   	      And a.rabasdate = d.rabasdate                                                               ');
            SQL.Add('           UNION                                                                                             ');
            SQL.Add('          Select ppr.gubun, ppr.Empno,                                                                       ');
            SQL.Add('                 ppr.paycl, phr.payra, ppr.deptcode,                                                         ');
            SQL.Add('                 pdl.eEmpno,pdl.ekind,                                                                       ');
            SQL.Add('                 DECODE(pdl.eEmpno, phr.e1Empno, ''하향1차'', phr.e2Empno, ''하향2차'',''평가자없음'') chasu,');
            SQL.Add('                 phr.e2Empno, phr.e2existyn,    		                                                  ');
            SQL.Add('                 NVL(SUM(pdl.score),0) hap,                                                                  ');
            SQL.Add('                 DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num,                                         ');
            SQL.Add('                 '''' e3Empno, 0 hap1                                                                        ');
            SQL.Add('           From  pehremas phr, pesdl pdl, TMP_PPERSON ppr                                                    ');
            SQL.Add('           Where phr.Empno     = ppr.Empno                                                                   ');
            SQL.Add('             And phr.rabasdate = pdl.rabasdate                                                               ');
            SQL.Add('             And phr.Empno     = pdl.Empno                                                                   ');
            SQL.Add('             And phr.rabasdate = :pb_pehrdate                                                                ');
            SQL.Add('             And ppr.rabasyear = :p_rabasyear                                                                ');
            SQL.Add('           GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra, ppr.deptcode,      ');
            SQL.Add('                    pdl.ekind, pdl.eEmpno, phr.e2Empno, phr.e2existyn                                        ');
            SQL.Add('           UNION                                                                                             ');
            SQL.Add('          Select ppr.gubun, ppr.Empno,                                                                       ');
            SQL.Add('                 ppr.paycl, phr.payra, ppr.deptcode,                                                         ');
            SQL.Add('                 ''비보임평가자'' eEmpno, pdh.ekind,                                                         ');
            SQL.Add('                 ''비보임'' chasu,  phr.e2Empno, phr.e2existyn,                                              ');
            SQL.Add('                 NVL(SUM(pdh.score),0) hap,                                                                  ');
            SQL.Add('                 DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num,                                         ');
            SQL.Add('                 '''' e3Empno, 0 hap1        			           				  ');
            SQL.Add('            From pehremas phr, pesdc pdh, TMP_PPERSON ppr                                                    ');
            SQL.Add('           Where phr.Empno     = ppr.Empno                                                                   ');
            SQL.Add('             And phr.rabasdate = pdh.rabasdate                                                               ');
            SQL.Add('             And phr.Empno     = pdh.Empno                                                                   ');
            SQL.Add('             And phr.rabasdate = :pb_pehrdate                                                                ');
            SQL.Add('             And ppr.rabasyear = :p_rabasyear                                                                ');
            SQL.Add('             And length(pdh.eEmpno) = 16                                                                     ');
            SQL.Add('           GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra, ppr.deptcode,      ');
            SQL.Add('                    pdh.ekind, phr.e2Empno, phr.e2existyn                                                    ');
            SQL.Add('        )                                                                                                    ');
            SQL.Add('   )			                                                                                  ');
            SQL.Add('GROUP BY Empno, gubun, e2Empno, e3Empno		                                                          ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
            Gauge.Progress := 25;
       end;

       215:    //17 : 역량점수 입력최종 마무리
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update TMP_ABILITYSCR2 a                                                          ');
            SQL.Add('    Set tot_kd = (Select DECODE(e3Empno, null, tot_kd2,                           ');
            SQL.Add('                         ROUND((nvl(tot_kd1,0) * 0.5) + (nvl(tot_kd2,0) * 0.5),4))');
            SQL.Add('                    From TMP_ABILITYSCR2                                          ');
            SQL.Add('		        Where a.Empno = Empno)                                         ');
            ExecSQL;
            Gauge.Progress := 26;
       end;

       216:    //18 : 평가이력에 하반기 역량점수 Update
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                                ');
            SQL.Add('   Set abilityscr2                               ');
            SQL.Add('    = (Select b.tot_kd                           ');
            SQL.Add('         From TMP_ABILITYSCR2 b                  ');
            SQL.Add('	     Where a.Empno     = b.Empno              ');
            SQL.Add('	       And a.rabasyear = :p_rabasyear  )      ');
            SQL.Add('Where a.rabasyear = :p_rabasyear                 ');
            SQL.Add('  And EXISTS (Select 1 From TMP_ABILITYSCR2 b    ');
            SQL.Add('	            Where a.Empno = b.Empno           ');
            SQL.Add('	              And a.rabasyear = :p_rabasyear) ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 27;
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       //jissi 2008년 평가 실,지사장(16,19)는 상향평가점수가 없으므로 이부분에서 잘 정리되어야 함, 팀장만(2C)
       217:    //19 : 업적과 역량에 대한 최종점수
       begin
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis f                                                                                                                 ');
            SQL.Add('   Set (f.finalscr)  =                                                                                                            ');
            SQL.Add('   (Select NVL(e.finalscr,0)                                                                                                      ');
            SQL.Add('      From (Select d.rabasyear, d.Empno,                                                                                          ');
            SQL.Add('                   ROUND(DECODE(gubun,                                                                                            ');
            SQL.Add('                              ''BCT3B'', (nvl(d.valuescr2,0) * 0.3) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.2), ');
            SQL.Add('                              ''BCT3M'', (nvl(d.valuescr2,0) * 0.3) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('                              ''BCT2B'', (nvl(d.valuescr2,0) * 0.3) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.2), ');
            SQL.Add('                              ''BCT2M'', (nvl(d.valuescr2,0) * 0.3) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.3), ');

            SQL.Add('          		           ''BCM3B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''BCM3M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');
            SQL.Add('          		           ''BCM2B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''BCM2M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');

            SQL.Add('          		           ''KDM3B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''KDM3M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');
            SQL.Add('          		           ''KDM2B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''KDM2M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');
            SQL.Add('          		           ''SSM3B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''SSM3M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');
            SQL.Add('          		           ''SSM2B'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr2,0) * 0.3), ');
            SQL.Add('          		           ''SSM2M'', (nvl(d.valuescr2,0) * 0.2) + (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr2,0) * 0.4), ');
            SQL.Add('          	              0), 4) finalscr                                                                                          ');
            SQL.Add('              From (Select a.rabasyear, a.Empno, b.gubun, a.payra, a.valuescr2, a.resultscr2, a.abilityscr2,                      ');
            SQL.Add('          	                ROUND(NVL(c.upabl2,0),2) upabl2                                                                        ');
            SQL.Add('                      From pehevhis a,  TMP_PPERSON b,                                                                            ');
         // SQL.Add('                          (Select pEmpno, SUM(score)/DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1)) upabl2                         ');
         // SQL.Add('                             From petdl                                                                                           ');
         // SQL.Add('                            Where rabasdate = :pb_pehrdate And ekind = ''리더십역량''                                             ');
         // SQL.Add('                            GROUP BY  pEmpno ) c  	                                                                               ');
            SQL.Add('                          (Select pEmpno, round(avg(elscore),2) upabl2                                                            ');//dsa2000  2008.11. 대체,
            SQL.Add('                             From pesremas                                                                                        ');//팀장역량상향마스터.
            SQL.Add('                            Where rabasdate = :pb_pehrdate And RVALCONYN = ''Y''                                                  ');
            SQL.Add('                            group by pEmpno) c                                                                                    ');
            SQL.Add('                     Where a.Empno     = b.Empno                                                                                  ');
            SQL.Add('                       And a.Empno     = c.pEmpno(+)                                                                              ');
            SQL.Add('                       And a.rabasyear = :p_rabasyear                                                                             ');
            SQL.Add('                       And b.rabasyear = :p_rabasyear                                                                             ');
            SQL.Add('                   ) d                                                                                                            ');
            SQL.Add('   	     ) e                                                                                                               ');
            SQL.Add('     Where f.rabasyear  = e.rabasyear                                                                                             ');
            SQL.Add('       And f.Empno      = e.Empno                                                                                                 ');
            SQL.Add('       And f.rabasyear  = :p_rabasyear   )                                                                                        ');
            SQL.Add(' Where f.rabasyear = :p_rabasyear                                                                                                 ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            //업적 평가을 하지 않고 역량만 평가 할 경우
            {Close;
            SQL.Clear;
            SQL.Add('Update pehevhis f                                      ');
            SQL.Add('   Set f.finalscr  = f.abilityscr2                     ');
            SQL.Add(' Where f.rabasyear = :p_rabasyear                      ');
            SQL.Add('   And f.Empno in (Select a.Empno                      ');
            SQL.Add('                     From pehremas a                   ');
            SQL.Add('		         Where a.rabasdate   = :pb_pehrdate ');
            SQL.Add('		           And a.restiyn     = ''Y''        ');
            SQL.Add('                      And a.restionlyyn = ''Y'')       ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;}
            Gauge.Progress := 28;
       end;
       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


       /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       //1차평가자 역량만 최종점수 구하기
       218:
       begin
            //16 : 역량점수 테이블
            Close;
            SQL.Clear;
            SQL.Add('Delete From  TMP_ABILITYSCR2 ');
            ExecSQL;

            //17 : 역량점수 입력               gubun, Empno, e3Empno, tot_kd, tot_kd1, tot_kd2
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TMP_ABILITYSCR2                                                                        ');
            SQL.Add('Select gubun, Empno, e3Empno, 0 tot_kd,  0 tot_kd1,                                                ');
            SQL.Add('  ROUND(DECODE(gubun,                                                                              ');
            SQL.Add('       ''BCT3B'',( SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,     ');
            SQL.Add('	    ''BCT3M'',( SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,     ');
            SQL.Add('	    ''BCT2B'',( SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,     ');
            SQL.Add('       ''BCT2M'',( SUM(DECODE(ekind || chasu,''공통역량팀장1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'',(hap/num)*1.0, 0))  )*0.5 ,     ');

            SQL.Add('       ''BCM3B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*1.0, 0))  )*0.3 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0))  )*0.2 ,     ');
            SQL.Add('	    ''BCM3M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*1.0, 0))  )*0.3 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0))  )*0.2 ,     ');
            SQL.Add('	    ''BCM2B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차''  ,(hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*1.0, 0))  )*0.3 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''직무역량하향1차''  ,(hap/num)*1.0, 0))  )*0.2 ,     ');
            SQL.Add('       ''BCM2M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0))  )*0.5 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''리더십역량하향1차'',(hap/num)*1.0, 0))  )*0.3 +     ');
            SQL.Add('                 ( SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0))  )*0.2 ,     ');

            SQL.Add('       ''KDM3B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('                   SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''KDM3M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('                   SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''KDM2B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('                   SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''KDM2M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('   	        SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''SSM3B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('                   SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''SSM3M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('                   SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''SSM2B'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('   	        SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5 ,     ');
            SQL.Add('       ''SSM2M'',( SUM(DECODE(ekind || chasu,''공통역량하향1차'',  (hap/num)*1.0, 0)) +            ');
            SQL.Add('   	        SUM(DECODE(ekind || chasu,''직무역량하향1차'',  (hap/num)*1.0, 0)) ) *0.5       ');
            SQL.Add('       ), 4) tot_kd2                                                                               ');
            SQL.Add(' From                                                                                              ');
            SQL.Add(' (Select Empno, gubun, paycl, payra, deptcode, eEmpno, ekind, chasu,                               ');
            SQL.Add('         e2Empno, e2existyn, hap, num, e3Empno, hap1                                               ');
            SQL.Add('    From (Select c.gubun, c.Empno, c.paycl,                                                        ');
            SQL.Add('                 NVL((Select payra From pehremas                                                   ');
            SQL.Add('                       Where rabasdate = a.rabasdate And Empno=a.Empno), '''') payra,              ');
            SQL.Add('                 c.deptcode, ''팀장하향평가자'' eEmpno, a.ekind  ekind,                            ');
            SQL.Add('                 DECODE(b.cnt,1,''팀장1차'',2,''팀장2차'') chasu,                                  ');
            SQL.Add('                 d.e2Empno, d.e2existyn, DECODE(b.cnt,1,a.e1score, a.e2score) hap, a.cnt  num,     ');
            SQL.Add('                 d.e3Empno, DECODE(b.cnt,1,a.e1score, a.e3score) hap1 				');
            SQL.Add('           From ( Select rabasdate, Empno, ekind, cnt, e1score, e2score, e3score  		        ');
            SQL.Add('                    From ( Select rabasdate, Empno, ekind,  COUNT(ekind) cnt,                      ');
            SQL.Add('                                  nvl(SUM(e1score),0) e1score,                                     ');
            SQL.Add('                                  nvl(SUM(e2score),0) e2score,                                     ');
            SQL.Add('                                  nvl(SUM(e3score),0) e3score                                      ');
            SQL.Add('                             From petds						                ');
            SQL.Add('                            Where rabasdate = :pb_pehrdate                                         ');
            SQL.Add('                            GROUP BY rabasdate, Empno, ekind ) ) a,                                ');
            SQL.Add('                ( Select ROWNUM cnt From pimpmas Where ROWNUM < 3 ) b,                             ');
            SQL.Add('                ( Select * From TMP_PPERSON Where rabasyear = :p_rabasyear) c,	                ');
            SQL.Add('                ( Select * From pehremas    Where rabasdate = :pb_pehrdate) d 	                ');
            SQL.Add('          Where a.rabasdate = d.rabasdate                                                          ');
            SQL.Add('            And c.Empno = d.Empno                                                                  ');
            SQL.Add('            And c.Empno = a.Empno                                                                  ');
            SQL.Add('          UNION                                                                                    ');
            SQL.Add('         Select ppr.gubun, ppr.Empno, ppr.paycl, phr.payra, ppr.deptcode, pdl.eEmpno,pdl.ekind,    ');
            SQL.Add('                DECODE(pdl.eEmpno, phr.e1Empno, ''하향1차'',                                       ');
            SQL.Add('                                   phr.e2Empno, ''하향2차'', ''평가자없음'') chasu,                ');
            SQL.Add('                phr.e2Empno, phr.e2existyn, NVL(SUM(pdl.score),0) hap,                             ');
            SQL.Add('                DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num,  '''' e3Empno, 0 hap1          ');
            SQL.Add('           From  pehremas phr, pesdl pdl, TMP_PPERSON ppr                                          ');
            SQL.Add('          Where phr.Empno     = ppr.Empno                                                          ');
            SQL.Add('            And phr.rabasdate = pdl.rabasdate                                                      ');
            SQL.Add('            And phr.Empno     = pdl.Empno                                                          ');
            SQL.Add('            And phr.rabasdate = :pb_pehrdate                                                       ');
            SQL.Add('            And ppr.rabasyear = :p_rabasyear                                                       ');
            SQL.Add('          GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra,           ');
            SQL.Add('                   ppr.deptcode, pdl.ekind, pdl.eEmpno, phr.e2Empno, phr.e2existyn                 ');
            SQL.Add('          UNION                                                                                    ');
            SQL.Add('         Select ppr.gubun, ppr.Empno, ppr.paycl, phr.payra, ppr.deptcode, ''비보임평가자'' eEmpno, ');
            SQL.Add('                pdh.ekind, ''비보임'' chasu, phr.e2Empno, phr.e2existyn, NVL(SUM(pdh.score),0) hap,');
            SQL.Add('                DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num, '''' e3Empno, 0 hap1 	        ');
            SQL.Add('           From pehremas phr, pesdc pdh, TMP_PPERSON ppr                                           ');
            SQL.Add('          Where phr.Empno     = ppr.Empno                                                          ');
            SQL.Add('            And phr.rabasdate = pdh.rabasdate                                                      ');
            SQL.Add('            And phr.Empno     = pdh.Empno                                                          ');
            SQL.Add('            And phr.rabasdate = :pb_pehrdate                                                       ');
            SQL.Add('            And ppr.rabasyear = :p_rabasyear                                                       ');
            SQL.Add('            And length(pdh.eEmpno) = 16                                                            ');
            SQL.Add('          GROUP BY ppr.gubun, ppr.Empno, phr.e1Empno, phr.e2Empno, ppr.paycl, phr.payra,           ');
            SQL.Add('                   ppr.deptcode, pdh.ekind, phr.e2Empno, phr.e2existyn                             ');
            SQL.Add('        )                                                                                          ');
            SQL.Add('  )			                                                                        ');
            SQL.Add(' GROUP BY Empno, gubun, e2Empno, e3Empno	                                                        ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 32;

            //18 : 평가이력에 하반기 역량점수 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                                ');
            SQL.Add('   Set abilityscr3  =                            ');
            SQL.Add('     ( Select b.tot_kd2                          ');
            SQL.Add('         From TMP_ABILITYSCR2 b                  ');
            SQL.Add('	     Where a.Empno = b.Empno                  ');
            SQL.Add('	       And a.rabasyear = :p_rabasyear  )      ');
            SQL.Add(' Where a.rabasyear = :p_rabasyear                ');
            SQL.Add('   And EXISTS (Select 1 From TMP_ABILITYSCR2 b   ');
            SQL.Add('	             Where a.Empno = b.Empno          ');
            SQL.Add('	               And a.rabasyear = :p_rabasyear)');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 34;
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //19 : 업적과 역량에 대한 최종점수 : 1차평가자꺼만.
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis f                                                                                          ');
            SQL.Add('   Set (f.finalscr1no)  =                                                                                  ');
            SQL.Add('       (Select NVL(e.finalscr1no,0)                                                                        ');
            SQL.Add('          From (Select d.rabasyear, d.Empno,                                                               ');
            SQL.Add('                       ROUND(DECODE(gubun,                                                                 ');
            SQL.Add('                                    ''BCT3B'', (nvl(d.resultscr2,0) * 0.7) + (nvl(d.abilityscr3,0) * 0.3), ');
            SQL.Add('                                    ''BCT3M'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('                                    ''BCT2B'', (nvl(d.resultscr2,0) * 0.7) + (nvl(d.abilityscr3,0) * 0.3), ');
            SQL.Add('               			 ''BCT2M'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('               			 ''BCM3B'', (nvl(d.resultscr2,0) * 0.7) + (nvl(d.abilityscr3,0) * 0.3), ');
            SQL.Add('               			 ''BCM3M'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('               			 ''BCM2B'', (nvl(d.resultscr2,0) * 0.7) + (nvl(d.abilityscr3,0) * 0.3), ');
            SQL.Add('               			 ''BCM2M'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('               			 ''KDM3B'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('               			 ''KDM3M'', (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr3,0) * 0.5), ');
            SQL.Add('               			 ''KDM2B'', (nvl(d.resultscr2,0) * 0.6) + (nvl(d.abilityscr3,0) * 0.4), ');
            SQL.Add('               			 ''KDM2M'', (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr3,0) * 0.5), ');
            SQL.Add('               			 ''SSM3B'', (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr3,0) * 0.5), ');
            SQL.Add('               			 ''SSM3M'', (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr3,0) * 0.6), ');
            SQL.Add('               			 ''SSM2B'', (nvl(d.resultscr2,0) * 0.5) + (nvl(d.abilityscr3,0) * 0.5), ');
            SQL.Add('               			 ''SSM2M'', (nvl(d.resultscr2,0) * 0.4) + (nvl(d.abilityscr3,0) * 0.6), ');
            SQL.Add('                                    0), 4) finalscr1no                                                     ');
            SQL.Add('                  From (Select a.rabasyear, a.Empno, b.gubun, a.payra,                                     ');
            SQL.Add('                               a.valuescr2, a.resultscr2, a.abilityscr3                                    ');
            SQL.Add('                          From pehevhis a, TMP_PPERSON b                                                   ');
            SQL.Add('                         Where a.rabasyear = :p_rabasyear                                                  ');
            SQL.Add('                           And b.rabasyear = :p_rabasyear                                                  ');
            SQL.Add('                           And a.Empno     = b.Empno                                                       ');
            SQL.Add('                       ) d                                                                                 ');
            SQL.Add('        	 ) e                                                                                            ');
            SQL.Add('        	 Where f.rabasyear  = e.rabasyear                                                               ');
            SQL.Add('        	 And   f.rabasyear  = :p_rabasyear                                                              ');
            SQL.Add('        	 And   f.Empno      = e.Empno                                                                   ');
            SQL.Add('       )                                                                                                   ');
            SQL.Add(' Where f.rabasyear = :p_rabasyear                                                                          ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Gauge.Progress := 37;

            //업적 평가을 하지 않고 역량만 평가 할 경우
            {Close;
            SQL.Clear;
            SQL.Add('Update pehevhis f                                    ');
            SQL.Add('   Set f.finalscr1no = f.abilityscr3                 ');
            SQL.Add(' Where f.rabasyear   = :p_rabasyear                  ');
            SQL.Add('   And f.Empno in (Select a.Empno                    ');
            SQL.Add('                     From pehremas a                 ');
            SQL.Add('                    Where a.rabasdate = :pb_pehrdate ');
            SQL.Add('      	           And a.restiyn     = ''Y''      ');
            SQL.Add('                      And a.restionlyyn = ''Y'')     ');
            ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;}
       end;
       end; // End of Case
  end; // End of DM.Query_Gen
  Result := True;
end;

     //////////////////////////////////////////////////////////////////////////////////////////////////////////////
     //③평가집단 분류별 최종등급,최종순위 산정     2009년 : S A B C D => S E G N U 등급 변경
     //////////////////////////////////////////////////////////////////////////////////////////////////////////////
function TFm_SubForm4.fnRunSql3(iCase: Integer): Boolean;
var
  I : Integer;
begin
  with DM.Query_Gen2 do
  begin
       case iCase of //해년마다 틀리므로 사번 변경할것
           311:      //20 : 최종등급 랭킹에 포함되지 않는 사람.:
                     //평가 안받은 사람 : 휴직자, 육성평가 대상자, 교육파견, 특정직, 노동조합, 입사 5개월 미만, SKT에서 평가받는자
                     //Select * from pehremas where rabasdate='20091130' and restiyn='N' 대부분
           begin
                Close;
                SQL.Clear;
                SQL.Add('Update pehevhis a                                         ');
                SQL.Add('   Set rankinyn     = ''N''                               ');
                SQL.Add(' Where rabasyear    = :p_rabasyear                        ');
                SQL.Add('   And :pb_eardate <= (Select paycldate From pimupmas     ');
                SQL.Add('                        Where rabasdate = :p_Srabasdate  And a.Empno   = Empno)                   '); //올해 승격자.
                SQL.Add('   And (Empno in (Select empno from pehremas where rabasdate=:pb_pehrdate and pstate like ''7%'') '); //휴직자           6
                SQL.Add('    OR  Empno in (Select empno from pemrdmas where rabasdate=:pb_pehrdate             )           '); //육성평가 대상자 37
                SQL.Add('    OR  Empno in (Select empno from pimpmas  where pstate in (''25'',''32'',''33'')   )           '); //교육파견         5
                SQL.Add('    OR  Empno in (Select empno from pimpmas  where pstate < ''80'' and paycl= ''D41'' )           '); //특정직           6
                SQL.Add('    OR  Empno in (Select empno from pimpmas  where pstate < ''80'' and deptcode= ''YKKK0'')       '); //노동조합         6
                SQL.Add('    OR  Empno in (''2357'')                                                                       '); //입사 5개월 미만  1
                SQL.Add('    OR  Empno in (''2290'',''2306'',''2291'',''2304'',''2305'',''2355'',''2292'',''2345'',''2344'',''2348'',''2349'') ) '); //SKT에서 평가받는자.
                ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;           //승격종합점수 기준년
                ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;             //승격 기준일
                ParamByName('pb_eardate').AsString   := PPE_rabasyear.Text + '0101';  //년초
                ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;            //업적평가 기준일
                ExecSQL;
           end;

           312:
           begin
                if Chk_Group.Checked then
                begin            //2009-11 pgroupmas 임시테이블 Data생성 (최종등급 나오기전 계산시 사용)
                     SQL.Clear;  //        ==> 실제 계산시에는 엑셀로 반영.
                     SQL.Add('Delete From pgroupmas           ');
                     SQL.Add(' Where rabasyear = :pb_pehrdate ');
                     ParamByName('pb_pehrdate').AsString  := Copy(PPE_pehrdate.Text,1,4);
                     ExecSQL;

                     SQL.Clear;
                     SQL.Add('Insert Into pgroupmas                                                                               ');
                     SQL.Add('Select Substr(rabasdate,1,4) rabasyear,                                                             ');
                     SQL.Add('       empno,                                                                                       ');
                     SQL.Add('       extcode||decode(paycl,''D31'',''D21'',''D33'',''D21'',''D34'',''D21'',paycl) groupnm,        ');
                     SQL.Add('       korname, jobkind, payra, c.totcnt, '''' groupnmtm, '''' totcnttm, ''팀원B'' grade            ');
                     SQL.Add('  from pehremas a, pycdept b,                                                                       ');
                     SQL.Add('       (Select extcode||decode(paycl,''D31'',''D21'',''D33'',''D21'',''D34'',''D21'',paycl) groupnm,');
                     SQL.Add('               count(*) totcnt                                                                      ');
                     SQL.Add('          from pehremas a, pycdept b                                                                ');
                     SQL.Add('         where rabasdate  = :pb_pehrdate                                                            ');
                     SQL.Add('           And a.orgnum   = b.orgnum                                                                ');
                     SQL.Add('           And a.deptcode = b.deptcode                                                              ');
                     SQL.Add('           And Substr(jobkind,1,2) in (''11'',''22'',''33'',''44'')                                 ');
                     SQL.Add('           And a.empno not in (select empno From petremas where rabasdate = :pb_pehrdate )          ');
                     SQL.Add('         group by extcode||decode(paycl,''D31'',''D21'',''D33'',''D21'',''D34'',''D21'',paycl) ) C  ');
                     SQL.Add(' where rabasdate  = :pb_pehrdate                                                                    ');
                     SQL.Add('   And a.orgnum   = b.orgnum                                                                        ');
                     SQL.Add('   And a.deptcode = b.deptcode                                                                      ');
                     SQL.Add('   And Substr(jobkind,1,2) in (''11'',''22'',''33'',''44'')                                         ');
                     SQL.Add('   And extcode||decode(paycl,''D31'',''D21'',''D33'',''D21'',''D34'',''D21'',paycl)  = c.groupnm    ');
                     SQL.Add('   And a.empno not in (select empno From petremas where rabasdate = :pb_pehrdate )                  ');
                     ParamByName('pb_pehrdate').AsString := PPE_pehrdate.Text;               //평가기준일
                     ExecSQL;
                             
                     SQL.Clear;
                     SQL.Add('Insert Into pgroupmas                                           ');
                     SQL.Add('Select Substr(a.rabasdate,1,4) rabasyear,                       ');
                     SQL.Add('       a.empno,                                                 ');
                     SQL.Add('       substr(a.deptcode,1,2)||''000''||a.paycl groupnm,        ');
                     SQL.Add('       a.korname, a.jobkind, a.payra, e.totcnt, '''', '''',     ');
                     SQL.Add('       ''팀장B'' grade                                          ');
                     SQL.Add('  from pehremas a, petremas c,                                  ');
                     SQL.Add('      (Select substr(a.deptcode,1,2)||''000''||a.paycl groupnm, ');
                     SQL.Add('              count(*)                                 totcnt   ');
                     SQL.Add('         from petremas a                                        ');
                     SQL.Add('       where rabasdate= :pb_pehrdate                            ');
                     SQL.Add('       group by substr(a.deptcode,1,2)||''000''||a.paycl )  E   ');
                     SQL.Add(' where a.rabasdate  = :pb_pehrdate                              ');
                     SQL.Add('   And a.rabasdate  = c.rabasdate                               ');
                     SQL.Add('   And a.empno      = c.empno                                   ');
                     SQL.Add('   And substr(a.deptcode,1,2)||''000''||a.paycl = e.groupnm     ');
                     ParamByName('pb_pehrdate').AsString := PPE_pehrdate.Text;
                     ExecSQL;
                end;
                //////////////////////////////////////////////////////////////////// 2009-11 pgroupmas end..


                ////////////////////////////////////////////////////////////////////
                //PSILGRADE 테이블 : 조직의 성과를 A,B,C 등급으로 구분하여 각 등급별 인원배정을 달리할때 사용되는 기준 테이블
                // 2009년도에는 조직성과점수를 미반영하기로 하여 하나의 등급으로 작업함.  ==> 3.평가등급별 인원배분현황(Psilgrade).sql
                // 차기년도 작업시 평가 담당자에게 확인하기 바람.
                {
                Close;
                SQL.Clear;
                SQL.Add('Delete From psilgrade            ');
                SQL.Add(' Where rabasdate = :pb_pehrdate  ');
                ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일///E_rabasdate.Text;     //승격기준일
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add(' Insert Into Psilgrade                                 ');
                SQL.Add(' Select :pb_pehrdate, SILGRADE, INWON, SGRADE, AGRADE, ');
                SQL.Add('        BPGRADE, BGRADE, BMGRADE, CGRADE, DGRADE       ');
                SQL.Add('   From psilgrade                                      ');
                SQL.Add('  Where Rabasdate = :p_OldDate                         ');
                ParamByName('pb_pehrdate').AsString := PPE_pehrdate.Text;    //평가기준일 ///E_rabasdate.Text;  //승격종합점수 기준년
                ParamByName('p_OldDate').AsString   := IntToStr(StrToInt(PPE_rabasyear.Text) - 1)+'1130';   //전년도 기준일
                ExecSQL;
                ////////////////////////////////////////////////////////////////////     }



                ////////////////////////////////////////////////////////////////////
                Close;     //312 : 최종등급과 최종순위 데이터 초기화.
                SQL.Clear;
                SQL.Add('Delete From TMP_TEAMGUBUN3');
                ExecSQL;

                Close;
                SQL.Clear;  //312 : 최종등급과 최종순위를 집계
                SQL.Add('Insert Into TMP_TEAMGUBUN3                                                                                                  ');
                SQL.Add('Select :p_rabasyear, e.Empno, e.groupnm, e.jobgun, e.deptcode, e.paycl, e.finalscr, e.resultscr2, e.abilityscr2,            ');
                SQL.Add('       e.rank, e.totcnt,  (e.rank /  e.totcnt) * 100 rankrate,                                                              ');
                SQL.Add('       DECODE(SIGN(e.totcnt-101), 1,                                                                                        ');
                SQL.Add('       DECODE(SIGN((e.rank / e.totcnt) * 100 - 10), -1, ''S'' , 0 ,''S''                                                    ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 30), -1, ''E'' , 0, ''E''                                           ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 45), -1, ''G+'', 0, ''G+''                                          ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 70), -1, ''G0'' ,0, ''G0''                                          ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 85), -1, ''G-'', 0, ''G-''                                          ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 95), -1, ''N'' , 0, ''N''                                           ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 100),-1, ''U'' , 0, ''U'' ))))))) ,                                 ');
                SQL.Add('       DECODE(SIGN(e.rank-f.sgrade),  -1, ''S'' , 0, ''S''                                                                  ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade)),  -1, ''E'' , 0, ''E''                                              ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade)), -1, ''G+'', 0, ''G+''                                    ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade)),  -1, ''G0'' , 0, ''G0''                         ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade)), -1, ''G-'', 0, ''G-''                 ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade+f.cgrade)),  -1, ''N'' , 0, ''N''        ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade+f.cgrade+f.dgrade)), -1, ''U'', 0, ''U'')');
                SQL.Add('              ) ) ) ) ) )    ) finalgrade,                                                                                  ');
                SQL.Add('       e.grade                                                                                                              ');
                SQL.Add('  From (Select DISTINCT a.Empno, a.jobgun, a.deptcode, a.paycl, b.GROUPNM,                                                  ');
                SQL.Add('               a.finalscr, a.resultscr2, a.abilityscr2, a.abilityscr3, b.totcnt,  b.GRADE,                                  ');
                SQL.Add('               rank() over (PARTITION BY b.GROUPNM ORDER BY NVL(a.finalscr,0) DESC, nvl(a.resultscr2,0) desc,               ');
                SQL.Add('                                                            nvl(a.abilityscr2,0) desc, nvl(a.abilityscr3,0) desc) rank      ');
                SQL.Add('          From pehevhis a, pgroupmas b                                                                                      ');
                SQL.Add('         Where a.rabasyear = :p_rabasyear                                                                                   ');
                SQL.Add('           And a.rabasyear = b.rabasyear                                                                                    ');
                SQL.Add('           And a.Empno     = b.Empno                                                                                        ');
                SQL.Add('           And a.rankinyn  = ''Y''                                                                                          ');
                SQL.Add('         ORDER BY b.GROUPNM, a.finalscr DESC, a.resultscr2 desc, a.abilityscr2 desc, a.abilityscr3 desc                     ');
                SQL.Add('       ) e, psilgrade f                                                                                                     ');
                SQL.Add('Where f.rabasdate = :pb_pehrdate                                                                                            ');
                SQL.Add('  And e.totcnt = f.inwon                                                                                                    ');
                SQL.Add('  And e.GRADE  = f.SILGRADE                                                                                                 ');
                SQL.Add('order by e.GROUPNM, e.totcnt, e.rank                                                                                        ');
                ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
                ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
                E_Sql.text := sql.text;
                ExecSQL;

                //312 : 순위와 최종등급을 업데이트
                Close;
                SQL.Clear;
                SQL.Add('Update pehevhis a                                   ');
                SQL.Add('   Set (finalgrade, rank, ranktot)                  ');
                SQL.Add('     = (Select b.finalgrade, b.rank, b.totcnt       ');
                SQL.Add('          From TMP_TEAMGUBUN3  b                    ');
                SQL.Add('         Where a.Empno     = b.Empno                ');
                SQL.Add('           And a.rabasyear = :p_rabasyear )         ');
                SQL.Add(' Where a.rabasyear = :p_rabasyear                   ');
                SQL.Add('   And a.Empno in (Select Empno From TMP_TEAMGUBUN3)');
                ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
                ExecSQL;
           end;

           313:
           begin          //313 : 업적등급과 순위 데이터 초기화.
                Close;
                SQL.Clear;
                SQL.Add('Delete From TMP_TEAMGUBUN3 ');
                ExecSQL;

                Close;
                SQL.Clear; //313 : 업적등급과 순위를 집계
                SQL.Add('Insert Into TMP_TEAMGUBUN3                                                                                                  ');
                SQL.Add('Select :p_rabasyear, e.Empno, e.groupnm, e.jobgun, e.deptcode,                                                              ');
                SQL.Add('       e.paycl, e.finalscr, e.resultscr2, e.abilityscr2, e.rank, e.totcnt,                                                  ');
                SQL.Add('       (e.rank /  e.totcnt) * 100 rankrate,                                                                                 ');
                SQL.Add('       DECODE(SIGN(e.totcnt-101), 1,                                                                                        ');
                SQL.Add('       DECODE(SIGN((e.rank / e.totcnt) * 100 - 10), -1, ''S'' , 0 ,''S''                                                    ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 30) , -1, ''E'' , 0, ''E''                                          ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 45) , -1, ''G+'', 0, ''G+''                                         ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 70) , -1, ''G0'' ,0, ''G0''                                         ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 85) , -1, ''G-'', 0, ''G-''                                         ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 95) , -1, ''N'' , 0, ''N''                                          ');
                SQL.Add('              , DECODE(SIGN((e.rank / e.totcnt) * 100 - 100), -1, ''U'' , 0, ''U'' ))))))) ,                                ');
                SQL.Add('       DECODE(SIGN(e.rank-f.sgrade),  -1, ''S'' , 0, ''S''                                                                  ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade)),  -1, ''E'', 0, ''E''                                               ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade)), -1, ''G+'', 0, ''G+''                                    ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade)), -1, ''G0'', 0, ''G0''                           ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade)), -1, ''G-'', 0, ''G-''                 ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade+f.cgrade)), -1, ''N'', 0, ''N''          ');
                SQL.Add('              , DECODE(SIGN(e.rank-(f.sgrade+f.agrade+f.bpgrade+f.bgrade+f.bmgrade+f.cgrade+f.dgrade)), -1, ''U'', 0, ''U'')');
                SQL.Add('              ))))))  ) finalgrade,                                                                                         ');
                SQL.Add('       e.grade                                                                                                              ');
                SQL.Add(' From (Select DISTINCT a.Empno, a.jobgun, a.deptcode, a.paycl, b.GROUPNM,                                                   ');
                SQL.Add('              a.finalscr, a.resultscr2, a.abilityscr2,  b.totcnt,  b.GRADE,                                                 ');
                SQL.Add('              rank() over (PARTITION BY b.GROUPNM ORDER BY NVL(a.resultscr2,0) DESC) rank                                   ');
                SQL.Add('         From pehevhis a, pgroupmas b                                                                                       ');
                SQL.Add('        Where a.rabasyear = :p_rabasyear                                                                                    ');
                SQL.Add('          And a.rabasyear = b.rabasyear                                                                                     ');
                SQL.Add('          And a.Empno     = b.Empno                                                                                         ');
                SQL.Add('          And a.rankinyn  = ''Y''                                                                                           ');
                SQL.Add('        ORDER BY b.GROUPNM,  a.resultscr2 DESC                                                                              ');
                SQL.Add('       ) e, psilgrade f                                                                                                     ');
                SQL.Add('Where f.rabasdate = :pb_pehrdate                                                                                            ');
                SQL.Add('  And e.totcnt    = f.inwon                                                                                                 ');
                SQL.Add('  And e.GRADE     = f.SILGRADE                                                                                              ');
                SQL.Add('order by e.GROUPNM, e.totcnt, e.rank                                                                                        ');
                ParamByName('pb_pehrdate').AsString  := PPE_pehrdate.Text;    //평가기준일
                ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add('Update pehevhis a                                  ');
                SQL.Add('   Set (resultscrgrade, resultscrrank)             ');
                SQL.Add('     = (Select b.finalgrade, b.rank                ');
                SQL.Add('          From TMP_TEAMGUBUN3  b                   ');
                SQL.Add('         Where a.Empno     = b.Empno               ');
                SQL.Add('           And a.rabasyear = :p_rabasyear)         ');
                SQL.Add('Where a.rabasyear = :p_rabasyear                   ');
                SQL.Add('  And a.Empno in (Select Empno From TMP_TEAMGUBUN3)');
                ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;
                ExecSQL;
           end;
      end; // End of Case
  end; // End of DM.Query_Gen2
  Result := True;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
function TFm_SubForm4.fnRunSql5(iCase: Integer): Boolean;
var
  I : Integer;
begin
  with DM.Query_Gen do
  begin
       case iCase of
         411:
         begin   //30 : 평가이력에 휴직테이블 근거 근속제외일수, 근속제외내용 Update  << 부장이 아니고, 공상휴직이 아닌경우 빼줌
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                                                                                                                           ');
            SQL.Add('   Set ( exdudays, exdudesc, exfrdate,  extodate ) =                                                                                        ');
            SQL.Add('       (  Select SUM(DECODE(SIGN(:p_pehryear - TO_NUMBER(Substr(exfrdate,1,4))),                                                            ');
            SQL.Add('                            +1, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_lastdate),1,4))),                              ');
            SQL.Add('			         -1, TO_DATE(:p_lastdate,''YYYYMMDD'') - TO_DATE(:p_eardate,''YYYYMMDD'') + 1 ,                                  ');
            SQL.Add('			          0, TO_DATE(NVL(extodate, :p_lastdate) ,''YYYYMMDD'') - TO_DATE(:p_eardate,''YYYYMMDD'') + 1),                  ');
            SQL.Add('			          0, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_Srabasdate),1,4))),                            ');
            SQL.Add('			         -1, TO_DATE(:p_lastdate,''YYYYMMDD'') - TO_DATE(exfrdate,''YYYYMMDD'') + 1,                                     ');
            SQL.Add('			          0, TO_DATE(NVL(extodate, :p_lastdate) ,''YYYYMMDD'') - TO_DATE(exfrdate,''YYYYMMDD'') + 1))),                  '); //exdudays
            SQL.Add('                                MIN(DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(exfrdate,1,4))),                                            ');
            SQL.Add('	                         +1, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_Srabasdate),1,4))),-1, codename,0, codename),  ');
            SQL.Add('                      	  0, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_Srabasdate),1,4))),-1, codename,0, codename))),'); //exdudesc
            SQL.Add('		      MIN(DECODE(SIGN(:p_pehryear - TO_NUMBER(Substr(exfrdate,1,4))),                                                            ');
            SQL.Add('		                 +1, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_Srabasdate),1,4))),                            ');
            SQL.Add('		                 -1, TO_DATE(:p_eardate,''YYYYMMDD'') ,                                                                          ');
            SQL.Add('		                  0, TO_DATE(:p_eardate,''YYYYMMDD'') ),                                                                         ');
            SQL.Add('		                  0, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_Srabasdate),1,4))),                            ');
            SQL.Add('		                 -1, TO_DATE(exfrdate,''YYYYMMDD'') ,                                                                            ');
            SQL.Add('		                  0, TO_DATE(exfrdate,''YYYYMMDD'') )))  ,                                                                       '); //exfrdate
            SQL.Add('		      MIN(DECODE(SIGN(:p_pehryear - TO_NUMBER(Substr(exfrdate,1,4))),                                                            ');
            SQL.Add('		                 +1, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_lastdate),1,4))),                              ');
            SQL.Add('		                 -1, TO_DATE(:p_lastdate,''YYYYMMDD'') ,                                                                         ');
            SQL.Add('		                  0, TO_DATE(NVL(extodate, :p_lastdate) ,''YYYYMMDD'')) ,                                                        ');
            SQL.Add('		                  0, DECODE( SIGN(:p_pehryear - TO_NUMBER(Substr(NVL(extodate, :p_lastdate),1,4))),                              ');
            SQL.Add('		                 -1, TO_DATE(:p_lastdate,''YYYYMMDD'') ,                                                                         ');
            SQL.Add('		                  0, TO_DATE(NVL(extodate, :p_lastdate) ,''YYYYMMDD''))))                                                        ');
            SQL.Add('          From pihexdu b, pyccode c                                                                                                         ');
            SQL.Add('         Where a.Empno   = b.Empno                                                                                                          ');
            SQL.Add('           And b.excode  <> ''71''                                                                                                          ');
            SQL.Add('           And (c.codeid = ''I300'' OR c.codeid =''I310'')                                                                                  ');
            SQL.Add('           And b.excode  = c.codeno                                                                                                         ');
            SQL.Add('         GROUP BY b.Empno   )                                                                                                               ');
            SQL.Add('Where rabasyear = :p_rabasyear                                                                                                              ');
            SQL.Add('  And paycl <> ''C11''                                                                                                                      ');//부장.
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;              //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;            //승격종합점수 기준년
            ParamByName('p_eardate').AsString    := PPE_rabasyear.Text + '0101';   //년초
            ParamByName('p_lastdate').AsString   := PPE_rabasyear.Text + '1231';   //년말
            ParamByName('p_pehryear').AsString   := PPE_rabasyear.Text;            //평가년도
            ExecSQL;
         end;

         412:
         begin   //31 : 올해 입사자에 대해 근속제외일수를 계산해서 더해줌
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                                                           ');
            SQL.Add('   Set (exdudays, exfrdate, extodate)                                       ');
            SQL.Add('     = (Select NVL(exdudays,0) + TO_DATE(b.paycldate) - TO_DATE(:p_eardate),');
            SQL.Add('               TO_DATE(:p_eardate),                                         ');
            SQL.Add('               TO_DATE(b.paycldate)                                         ');
            SQL.Add('          From pimupmas b                                                   ');
            SQL.Add('         Where b.rabasdate  = :p_Srabasdate                                 ');
            SQL.Add('           And b.paycldate >= :p_eardate                                    ');
            SQL.Add('           And a.Empno      = b.Empno )	                                 ');
            SQL.Add(' Where rabasyear = :p_rabasyear                                             ');
            SQL.Add('   And Empno IN (Select b.Empno From pimupmas b                             ');
            SQL.Add('                  Where b.rabasdate  = :p_Srabasdate                        ');
            SQL.Add('                    And b.paycldate >= :p_eardate                           ');
            SQL.Add('                    And a.Empno      = b.Empno )                            ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;              //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;            //승격종합점수 기준년
            ParamByName('p_eardate').AsString    := PPE_rabasyear.Text + '0101';   //년초
            ExecSQL;
         end;

         413:
         begin   //32 : 평가대상자들은 승격점수 넣기
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a Set a.upscore        ');
            SQL.Add('     = DECODE(a.finalgrade,''S'', 100, ');
            SQL.Add('                           ''E'',  90, ');
            SQL.Add('                           ''G+'', 85, ');
            SQL.Add('                           ''G0'', 80, ');
            SQL.Add('                           ''G-'', 75, ');
            SQL.Add('                           ''N'',  70, ');
            SQL.Add('                           ''U'',  60, ');
            SQL.Add('                                   80) ');
            SQL.Add(' Where a.rabasyear = :p_rabasyear      ');
            SQL.Add('   And a.RANKINYN  = ''Y''             ');
            SQL.ADD('   And a.empno not in (''0849'',''1902'',''1031'',''1145'',''1722'')  '); //2009년도 미평가자들 승격점수 제외..//해마다 바뀜.
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
         end;

         414:
         begin //33 : 평가대상제외자들은 승격점수 Null, 등급은 'G0'넣기 ==> Case 311 에서  RANKINYN = 'N'으로 업데이트 한 사원들.
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a                  ');
            SQL.Add('   Set a.upscore    = '''',        ');
            SQL.Add('       a.finalgrade = ''G0''       ');
            SQL.Add(' Where a.rabasyear  = :p_rabasyear ');
            SQL.Add('   And a.RANKINYN   = ''N''        ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
         end;

         415:
         begin  //34 : 승격포인트
           {SQL.Clear;
            SQL.Add('Update pehevhis a                                                                                                  ');
            SQL.Add('   Set uppoint = DECODE(SIGN(finalscr), 1, DECODE(finalgrade,''S'' , ROUND(10 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                                             ''E'' , ROUND( 8 * (365 - NVL(exdudays,0)) / 365,2),  '); //2009년부터 7->8점.
            SQL.Add('                                                             ''G+'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                                             ''G0'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                                             ''G-'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                                             ''N'' , ROUND( 5 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                                             ''U'' , ROUND( 4 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('							                  ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2) ),');
            SQL.Add('				                                  ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2) )         ');
            SQL.Add(' Where a.rabasyear = :p_rabasyear                                                                                  ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL; }

            Close;    //2009.12.  서류로 평가 받은자들은  finalscr 값이 없어서 수정함.
            SQL.Clear;
            SQL.Add('Update pehevhis a                                                                        ');
            SQL.Add('   Set uppoint = DECODE(finalgrade,''S'' , ROUND(10 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                   ''E'' , ROUND( 8 * (365 - NVL(exdudays,0)) / 365,2),  '); //2009년부터 7->8점.
            SQL.Add('                                   ''G+'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                   ''G0'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                   ''G-'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                   ''N'' , ROUND( 5 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('                                   ''U'' , ROUND( 4 * (365 - NVL(exdudays,0)) / 365,2),  ');
            SQL.Add('		      	                        ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2) ) ');
            SQL.Add(' Where a.rabasyear = :p_rabasyear                                                        '); //2009년도 서류평가 받은자.    (''0269'',''2412'')
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
         end;

         416:
         begin      //36 : 퇴사자는 서열에서 빠짐
            Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a Set Rankinyn = ''N''                ');
            SQL.Add(' Where rabasyear = :p_rabasyear                       ');
            SQL.Add('   And rabasyear = (Select Substr(b.retdate,1,4)      ');
            SQL.Add('                      From pimpmas b                  ');
            SQL.Add('                     Where b.Empno     = a.Empno      ');
            SQL.Add('                       And a.rabasyear = :p_rabasyear)');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            ////해당사항이 없을것 같음
            //37 : 휴직자의 경우 다음해에도 평가점수가 없는 경우 서열에서 빠짐
            {Close;
            SQL.Clear;
            SQL.Add('Update pehevhis a Set  a.rankinyn = ''N''              ');
            SQL.Add('Where a.paycl <> ''10''                                ');
            SQL.Add('  And a.rabasyear = :p_rabasyear                       ');
            SQL.Add('  And a.Empno IN (Select b.Empno                       ');
            SQL.Add('                    From pehevhis b                    ');
            SQL.Add('                   Where b.rabasyear = a.rabasyear + 1 ');
            SQL.Add('                     And b.Empno = a.Empno             ');
            SQL.Add('                     And a.rabasyear = :p_rabasyear)   ');
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;}
         end;
         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         511:
         begin  //39_0 : 당해년도 경력입사자들 재급기간내 pehevhis 강제 생성 해 줄것
            Close;
            SQL.Clear;
            SQL.Add('Delete From pehevhis a                                                 ');
            SQL.Add(' Where a.remark = ''경력자_기본등급''                                  ');
            SQL.Add('   And a.Empno in (Select b.Empno                                      ');
            SQL.Add('                     From pimpmas b                                    ');
            SQL.Add('                    Where b.pstate      < ''80''                       ');
            SQL.Add('                      And b.orgempdate  > :p_enddate                   ');
            SQL.Add('                      And b.orgempdate  <> b.paycldate                 ');
            SQL.Add('                      And b.paycl BETWEEN :p_payclfr And :p_payclto    ');
            SQL.Add('                      And Substr(b.Empno,1,1) in (''0'',''1'',''2'')   ');
            SQL.Add('                      And Substr(b.paycldate,1,4) <> :p_rabasyear  )   ');
            ParamByName('p_enddate').AsString   := IntToStr(StrToInt(PPE_rabasyear.Text) - 1) + '1101'; //전년도 승격시작시점부근.
            ParamByName('p_rabasyear').AsString := PPE_rabasyear.Text;   //승격종합점수 기준년
            ParamByName('p_payclfr').AsString   := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString   := PPE_rapayclto.Text;   //BANDto
            ExecSQL;
         end;

         512:
         begin
              //2006년에는 경력입사자중 2000년까지만 있기 때문에 2000년~2005년 까지 생성하면 됨
              for I := 1 to 10 do
              begin
                   Close;     //한해에 한번만 생성할것
                   SQL.Clear;
                   SQL.Add('Insert Into pehevhis                                                       ');
                   SQL.Add('      (rabasyear, Empno, korname, uppoint, upscore,  remark ,  ranktot)    ');
                   SQL.Add('Select Substr(a.paycldate,1,4) + b.cnt,                                    ');
                   SQL.Add('       a.Empno, a.korname,                                                 ');
                   SQL.Add('       case when (Substr(a.paycldate,1,4) = Substr(a.paycldate,1,4)+ b.cnt)');
                   SQL.Add('             And (Substr(a.paycldate,5,4) <> ''0101'' )                    ');
                   SQL.Add('	   then ROUND( 6 * (to_date(Substr(a.paycldate,1,4)||''1231'')         ');
                   SQL.Add('                   -    to_date(a.paycldate)+1 ) / 365, 2)                 ');
                   SQL.Add('       else 6  end         uppoint,                                        ');
                   SQL.Add('	   ''''                upscore,                                        ');
                   SQL.Add('	   ''경력자_기본등급'' remark,                                         ');
                   SQL.Add('       1                   ranktot                                         ');
                   SQL.Add('  From pimpmas a,                                                          ');
                   SQL.Add('      (Select ROWNUM - 1 cnt  From pimpmas b                               ');
                   SQL.Add('        Where ROWNUM <= (:p_pehryear - :p_calcyear) )b                     ');
                   SQL.Add(' Where pstate     < ''80''                                                 ');
                   SQL.Add('   And orgempdate > :p_enddate                                             ');
                   SQL.Add('   And orgempdate <> paycldate                                             ');
                   SQL.Add('   And paycl BETWEEN :p_payclfr And :p_payclto                             ');
                   SQL.Add('   And Substr(Empno,1,1) in (''0'',''1'',''2'')                            ');
                   SQL.Add('   And Substr(a.paycldate,1,4) = :p_calcyear2                              ');
                   SQL.Add('   And empno not in (Select empno from pehevhis Where rabasyear = :p_calcyear)');
                   SQL.Add(' order by  a.Empno                                                         ');
                   ParamByName('p_enddate').AsString  := IntToStr(StrToInt(PPE_rabasyear.Text) - 1) + '1101';  //전년도 승격시작시점부근.
                   ParamByName('p_payclfr').AsString  := PPE_rapayclfr.Text;                //BANDfr
                   ParamByName('p_payclto').AsString  := PPE_rapayclto.Text;                //BANDto
                   ParamByName('p_pehryear').AsInteger:= StrToInt(PPE_rabasyear.Text);      //승격종합점수 기준년
                   ParamByName('p_calcyear').AsInteger:= StrToInt(PPE_rabasyear.Text) - I;  //기준년도 -1부터 시작해서 10년까지만 생성
                   ParamByName('p_calcyear2').AsString:= IntToStr(StrToInt(PPE_rabasyear.Text) - I);
                   E_Sql.text := E_Sql.text + '    '+Sql.Text;
                   ExecSQL;
              end;

              /////2278 계약직에서 경력사원으로 입사한 케이스여서  강제로 입력.    dsa2000  2008.12.
              {SQL.Clear;
              SQL.Add('Delete pehevhis  Where rabasyear < ''2008'' And Empno in (''2278'')  ');
              ExecSQL;

              Close;
              SQL.Clear;
              SQL.Add('Insert Into pehevhis                                                                      ');
              SQL.Add('      (rabasyear, Empno, korname, uppoint, upscore,  remark ,  ranktot)                   ');
              SQL.Add('Select rabasyear, ''2278'' Empno, ''박준상'' korname, uppoint, upscore,  remark ,  ranktot');
              SQL.Add('  From pehevhis a                                                                         ');
              SQL.Add(' Where rabasyear < ''2008'' And Empno in (''2295'')                                       ');
              ExecSQL;    }
         end;
         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      


         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         //승격 MST 계산
         611:
         begin     //39 : 재급기간내 승격포인트 합 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                        ');
            SQL.Add('   Set a.uppoint = ( Select SUM(NVL(b.uppoint,0))                                        ');
            SQL.Add('                       From pehevhis b                                                   ');
            SQL.Add('		           Where a.Empno = b.Empno                                            ');
            SQL.Add('		             And a.rabasdate = :p_Srabasdate                                  ');
            SQL.Add('                        And b.rabasyear BETWEEN Substr(a.paycldate,1,4) And :p_rabasyear ');
            SQL.Add('		         )                                                                    ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                                                       ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
         end;

         612:
         begin     //41 : 승격포인트, 교육포인트, 전환배치요건 충족여부 clear
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas Set uppointyn  = ''N'',  ');
            SQL.Add('                    edupointyn = ''N'',  ');
          //SQL.Add('                    shiftyn    = ''N'',  ');
            SQL.Add('                    upyn       = ''N''   ');
            SQL.Add(' Where rabasdate = :p_Srabasdate         ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;
         end;

         613:
         begin     //40 : 교육포인트 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                               ');
            SQL.Add('   Set (edupoint, edupointyn)                                                   ');
            SQL.Add('     = (Select ROUND( avg(NVL(b.tot_score,0)) / 10,2),                          ');
            SQL.Add('               case when ROUND(avg(NVL(b.tot_score,0)) / 10,2) >= 10 then ''Y'' ');
            SQL.Add('               else ''N''                                                       ');
            SQL.Add('               end  edupointyn                                                  ');
            SQL.Add('          From pedu2his b, pimpmas c                                            ');
            SQL.Add('         Where a.Empno     = b.Empno                                            ');
            SQL.Add('           And a.Empno     = c.Empno                                            ');
            SQL.Add('           And b.base_yy   <> ''2005''                                          ');  //2005년 제외.
            SQL.Add('           And a.rabasdate = :p_Srabasdate                                      ');
            SQL.Add('           And b.base_yy BETWEEN Substr(a.paycldate,1,4) And :p_rabasyear )     ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                                              ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;
         end;

         614:
         begin     //42 : 승격포인트 충족여부
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas Set uppointyn = ''Y''                                ');
            SQL.Add(' Where Empno IN ( Select a.Empno                                     ');
            SQL.Add('                    From pimupmas a, pimupbas b                      ');
            SQL.Add('                   Where b.upkind    = ''BAND별 승격Point_재급년한'' '); //기준관리의 항목명 동일해야함.
            SQL.Add('                     And a.rabasdate = b.rabasdate                   ');
            SQL.Add('                     And a.paycl     = b.upcodeno                    ');
            SQL.Add('                     And a.uppoint  >= b.value1                      ');
            SQL.Add('                     And a.rabasdate = :p_Srabasdate   )             ');
            SQL.Add('And rabasdate = :p_Srabasdate                                        ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;
         end;

         615:
         begin     //43 : 1점차 승격대상자 누락 구제
            {Close;
            SQL.Clear;
            SQL.Add('Update pimupmas Set uppointyn = ''Y''                                                       ');
            SQL.Add(' Where rabasdate = :p_Srabasdate                                                            ');
            SQL.Add('   And Empno IN                                                                             ');
            SQL.Add('(''0977'',''1037'',''1587'',''0687'',''1600'',''1151'',''1264'',''1040'',''1399'',''1471'', ');
            SQL.Add(' ''1534'',''1505'',''1018'',''1016'',''1463'',''1540'',''1629'')                            ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;}
         end;

         616:
         begin  // 44 : 승격점수 계산   : 당내년도/
            Close;
            SQL.Clear;
            SQL.ADD('Update pimupmas a                                                                                                            ');
            SQL.ADD('   Set a.totscr                                                                                                              ');
            SQL.ADD('    = (Select ROUND(SUM(DECODE(b.finalgrade,''S'',100,''E'',90,''G+'',85,''G0'',80,''G'',80,''G-'',75,''N'',70,''U'',60,     ');
            SQL.ADD('                                                      ''A'',90,''B+'',85,''B0'',80,''B'',80,''B-'',75,''C'',70,''D'',60,0) ) ');
            SQL.ADD('                             / NVL(COUNT(1),1000000), 2)                                                                     ');
            SQL.ADD('          From pehevhis b,                                                                                                   ');
            SQL.ADD('	           ( Select Empno, Substr(greatest(to_number(nvl(cpaycldate,''00000000'')), to_number(paycldate)),1,4) paycldate  ');
            SQL.ADD('                  From pimpmas                                                                                               ');
            SQL.ADD('                 Where paycl BETWEEN :p_payclfr And :p_payclto                                                               ');
            SQL.ADD('                   And pstate < ''80''  ) C                                                                                  ');
            SQL.ADD('         Where a.Empno     = b.Empno                                                                                         ');
            SQL.ADD('           And a.Empno     = c.Empno                                                                                         ');
            SQL.ADD('           And a.rabasdate = :p_Srabasdate                                                                                   ');
            SQL.ADD('           And b.rabasyear BETWEEN c.paycldate And :p_rabasyear                                                              ');
            SQL.ADD('           And b.finalgrade IS NOT NULL                                                                                      ');
            SQL.ADD('           And b.upscore    IS NOT NULL                                                                                      ');
            SQL.ADD('         GROUP BY a.Empno                                                                                                    ');
            SQL.ADD('      )                                                                                                                      ');
            SQL.ADD(' Where a.rabasdate = :p_Srabasdate                                                                                           ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;     //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;   //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;   //BANDto
            ExecSQL;

            {//승격일이 올해인 사원을 제외하고 다시한번 계산....
            SQL.ADD('Update pimupmas a                                     ');
            SQL.ADD('   Set a.totscr = (Select round(avg(upscore),2)       ');
            SQL.ADD('                     From pehevhis b                  ');
            SQL.ADD('                    Where a.Empno = b.Empno           ');
            SQL.ADD('                      And upscore <> 0                ');
            SQL.ADD('                    GROUP BY a.Empno             )    ');
            SQL.ADD(' Where a.rabasdate = :p_Srabasdate                    ');
            SQL.ADD('   And a.Empno in (Select Empno From pimpmas          ');
            SQL.ADD('                    Where pstate     < ''80''         ');
            SQL.ADD('                      And CPAYCLDATE < :p_rabasyear ) '); }
            Close;
            SQL.Clear;                                                                      //2009.12. BAND별 적용년수의 평균으로 변경.
            SQL.ADD('Update pimupmas a                                                 ');  //G2 G3 : 과거 3개년 평균.
            SQL.ADD('   Set a.totscr = (Select round(avg(upscore),2)                   ');  //G4    : 과거 5개년 평균.
            SQL.ADD('                     From pehevhis b                              ');  //L1    : 과거 4개년 평균.
            SQL.ADD('                    Where a.Empno = b.Empno                       ');
            SQL.ADD('                      And upscore <> 0                            ');
            SQL.ADD('                      And Rabasyear between TO_Char(To_Number(:p_rabasyear)-decode(substr(a.paycl,1,2),''C2'',3,''D1'',4,''D2'',2,''D3'',2)) and :p_rabasyear ');
            SQL.ADD('                    GROUP BY a.Empno             )                ');
            SQL.ADD(' Where a.rabasdate = :p_Srabasdate                                ');
            SQL.ADD('   And a.Empno in (Select Empno From pimpmas                      ');
            SQL.ADD('                    Where pstate     < ''80''                     ');
            SQL.ADD('                      And nvl(cpaycldate,''0'') < :p_rabasyear )  ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;   //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text; //승격종합점수 기준년
            //ParamByName('p_year').AsInteger      := StrToInt(PPE_rabasyear.Text);
            ExecSQL;
         end;

         617:
         begin       //47 : 재급기간점수 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas Set payclscr                                             ');
            SQL.Add('     = DECODE(paycl, ''D11'', CASE WHEN payclyy >= 6 THEN 3  ELSE 0 END, '); //과장
            SQL.Add('                     ''D21'', CASE WHEN payclyy =  4 THEN 5              '); //대리
            SQL.Add('                                   WHEN payclyy >= 5 THEN 10 ELSE 0 END, ');
            SQL.Add('                       0 )                                               ');
            SQL.Add(' Where rabasdate = :p_Srabasdate                                         ');
            SQL.Add('   And paycl in (''D11'',''D21'')                                        ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;

            //48 : 재급점수 Update.
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                            ');
            SQL.Add('   Set a.qpayclscr                                           ');
            SQL.Add('     = (Select DECODE(a.payclyy, b.value2,                   ');
            SQL.Add('               DECODE(SIGN( 3-a.payclmm),+1,0,               ');
            SQL.Add('               DECODE(SIGN( 6-a.payclmm),+1,1,               ');
            SQL.Add('               DECODE(SIGN( 9-a.payclmm),+1,2,               ');
            SQL.Add('               DECODE(SIGN(12-a.payclmm),+1,3)))),           ');
            SQL.Add('               b.value2 + 1,                                 ');
            SQL.Add('               DECODE(SIGN( 3-a.payclmm),+1,4,               ');
            SQL.Add('               DECODE(SIGN( 6-a.payclmm),+1,5,               ');
            SQL.Add('               DECODE(SIGN( 9-a.payclmm),+1,6,               ');
            SQL.Add('               DECODE(SIGN(12-a.payclmm),+1,7)))),           ');
            SQL.Add('               DECODE(SIGN(a.payclyy -(b.value2+1)),+1,8,0)) ');
            SQL.Add('          From pimupbas b                                    ');
            SQL.Add('         Where a.rabasdate = b.rabasdate                     ');
            SQL.Add('           And b.upkind    = ''BAND별 승격Point_재급년한''   ');  //기준관리의 항목명 동일해야함.
            SQL.Add('           And a.rabasdate = :p_Srabasdate                   ');
            SQL.Add('           And a.paycl     = b.upcodeno)                     ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                           ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;

            //49 : 포상점수 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a Set prizescr =( Select SUM(NVL(repoint,0))                         ');
            SQL.Add('                                    From pimrewa                                     ');  //사원의 포상내역을 관리하는 테이블
            SQL.Add('                                   Where Empno = a.Empno                             ');
            SQL.Add('                                     And redate BETWEEN a.paycldate And :p_Srabasdate');
            SQL.Add('                                     And rerayn = ''Y''                              ');
            SQL.Add('                                     And rekind not in (''1112'',''1155'',''1160'') )'); //2008.11 Add - 제안상은 제외.
            SQL.Add('Where a.rabasdate = :p_Srabasdate                                                    ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;

            //50 : 제안점수 Update : 제안점수는 해당테이블에 업데이트가 안되고 있으므로 엑셀 받아 업데이트....2008.11.
            {Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a Set suggscr = ( Select SUM(NVL(proscore,0))                           ');
            SQL.Add('                                    From pimramas                                       ');
            SQL.Add('                                   Where Empno = a.Empno                                ');
            SQL.Add('                                     And rabasdate BETWEEN a.paycldate And :p_Srabasdate)');
            SQL.Add('Where a.rabasdate = :p_Srabasdate                                                        ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL; }

            //51 : 최근 2년 승격포인트 Update
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a Set uppoint_2year = (Select SUM(NVL(uppoint,0))                                 ');
            SQL.Add('                                         From pehevhis                                            ');
            SQL.Add('	                                     Where Empno       = a.Empno                               ');
            SQL.Add('                                          And rabasyear  >= TO_CHAR( TO_NUMBER(:p_rabasyear) - 1))');
            SQL.Add(' Where rabasdate = :p_Srabasdate                                                                  ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;    //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;   //승격종합점수 기준년
            ExecSQL;

            Close;  //올초에 승격자들은 최근1년치만 승격포인트 Update.    //dsa2000  2008.11.
            SQL.Clear;
            SQL.Add('Update pimupmas a Set uppoint_2year = ( Select SUM(NVL(uppoint,0))                                 ');
            SQL.Add('                                          From pehevhis                                            ');
            SQL.Add('	                                      Where Empno     = a.Empno                                 ');
            SQL.Add('                                           And rabasyear = :p_rabasyear )                          ');
            SQL.Add(' Where rabasdate = :p_Srabasdate                                                                   ');
            SQL.ADD('   And a.Empno in (Select Empno From pimpmas Where pstate < ''80'' And CPAYCLDATE = :p_rabasyear ) ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;           //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text+'0101';   //승격종합점수 기준년
            ExecSQL;
         end;

         618:
         begin  //52 : 승격대상여부 선정
            Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                               ');
            SQL.Add('   Set a.upyn = ''Y''                           ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate              ');
            SQL.Add('   And a.paycl BETWEEN :p_payclfr And :p_payclto');
            SQL.Add('   And a.uppointyn  = ''Y''                     '); //승격포인트 충족요건.
            SQL.Add('   And a.edupointyn = ''Y''                     '); //교육포인트 충족요건.
            SQL.Add('   And a.shiftyn    = ''Y''                     '); //전환배치   충족요건.
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;    //승격기준일
            ParamByName('p_payclfr').AsString    := PPE_rapayclfr.Text;  //BANDfr
            ParamByName('p_payclto').AsString    := PPE_rapayclto.Text;  //BANDto
            ExecSQL;

            Close; //53 : 승격대상 제외내역 사원만처리 : 최근 2년 연속 최종평가등급 U(D) 등급자는 당해년도 승격제외
            SQL.Clear;
            SQL.Add('Update pimupmas a                                          ');
            SQL.Add('   Set upyn   = ''N'',                                     ');
            SQL.Add('       remark = ''최근 2년 D등급 승격대상제외''            ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                         ');
            SQL.Add('   And a.paycl BETWEEN ''D31'' And ''D35''                 ');  //사원
            SQL.Add('   And EXISTS ( Select 1 From pehevhis b, pehevhis c       ');
            SQL.Add('                 Where a.Empno     = b.Empno               ');
            SQL.Add('                   And a.Empno     = c.Empno               ');
            SQL.Add('                   And a.rabasdate = :p_Srabasdate         ');
            SQL.Add('                   And b.rabasyear = :p_beforyear          ');
            SQL.Add('                   And c.rabasyear = :p_rabasyear          ');
            SQL.Add('                   And NVL(b.finalgrade,''G0'') = ''U''    ');
            SQL.Add('                   And NVL(c.finalgrade,''G0'') = ''U'' )  ');
            ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;                           //승격기준일
            ParamByName('p_rabasyear').AsString  := PPE_rabasyear.Text;                         //승격종합점수 기준년도(현재)
            ParamByName('p_beforyear').AsString  := IntToStr(StrToInt(PPE_rabasyear.Text) - 1); //전년도
            ExecSQL;

            Close; //54 : 승격대상 제외내역 사원만 최근 3년 견책2회, 감봉~정직 1회이상 당해년도 승격제외
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                               ');
            SQL.Add('   Set upyn   = ''N'' ,                                                                         ');
            SQL.Add('       remark = ''최근3년 상벌누적 승격대상제외''                                               ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                                                              ');
            SQL.Add('   And a.paycl BETWEEN ''D31'' And ''D35''                                                      '); //사원
            SQL.Add('   And a.Empno IN ( Select Empno                                                                ');
            SQL.Add('                      From (Select Empno, pukind, pukindnm, COUNT(*)                            ');
            SQL.Add('		                   From pimpuni                                                      ');
            SQL.Add('                             Where pudate >= TO_CHAR(ADD_MONTHS(:p_Srabasdate,-36),''YYYYMMDD'')');
            SQL.Add('			            And pukind IS NOT NULL                                           ');
            SQL.Add('                             GROUP BY Empno, pukind, pukindnm                                   ');
            SQL.Add('                            HAVING ((DECODE(pukind, ''17'', COUNT(*), 0) >= 2)                  ');
            SQL.Add('			              OR (DECODE(pukind, ''16'', 0, COUNT(*)) >= 1)                  ');
            SQL.Add('			              OR (DECODE(pukind, ''14'', 0, COUNT(*)) >= 1))                 ');
            SQL.Add('                            )                                                                   ');
            SQL.Add('		        )                                                                            ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;

            // 승격대상 제외자, 점수 및 모든 포인트는 동일
            {Close;
            SQL.Clear;
            SQL.Add('Update pimupmas a                                                                ');
            SQL.Add('   Set a.upyn = ''N'', uppointyn = ''N'', edupointyn = ''N'', shiftyn = ''N''    ');
            SQL.Add(' Where a.rabasdate = :p_Srabasdate                                                ');
            SQL.Add('   And a.Empno in (''1346'')                                                     ');
            ParamByName('p_Srabasdate').AsString  := E_rabasdate.Text;     //승격기준일
            ExecSQL;}
         end;
       end; // End of Case
  end; // End of DM.Query_Gen
  Result := True;
end;

////미사용
procedure TFm_SubForm4.Bt_Save2Click(Sender: TObject);
begin
  P_1.TextCaption := '';
  P_2.TextCaption := '';
  P_3.TextCaption := '';
  P_4.TextCaption := '';
  P_5.TextCaption := '';
  P_6.TextCaption := '';

  if MessageDlg('각 평가자 추출을 계속 진행하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    System.Exit;

  Gauge.Progress := 0;
  Application.ProcessMessages;

  if not DM.Database1.InTransaction then DM.Database1.StartTransaction;

  try
  except
      on E:EDBEngineError do
      begin
          DM.Database1.Rollback;
          MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);
          Exit;
      end;
  end;

  if DM.Database1.InTransaction then  DM.Database1.Commit;

  /////////////////////////// run //////////////////////////////////////////////
  DM.Database1.StartTransaction;

  TRY
    Gauge.Progress := 10;

    MainForm.St_Help.Panels[0].Text := ' 업적 및 역량 점수를 계산중입니다.';
    Application.ProcessMessages;

    if fnRunSql1(218) = False then begin DM.Database1.Rollback; System.Exit; end;

    P_2.TextCaption := '업적 및 역량 점수 계산 완료';
    Gauge.Progress := 100;

    MainForm.St_Help.Panels[0].Text := '';

    DM.Database1.Commit;
    EXCEPT
        on E:EDBEngineError do
        begin
            DM.Database1.Rollback;
            MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);

            Gauge.Progress := 100;
            MainForm.St_Help.Panels[0].Text := '';
            Exit;
        end;
    END;

  MessageDlg('◈ 완료 ◈ 하였습니다.',mtInformation,[mbOk],0);
end;

////미사용 
procedure TFm_SubForm4.PeJeonOutLookBtn1Click(Sender: TObject);
var
  I, j, k : Integer;
  SqlText : string;
begin
  if DM.Database1.InTransaction then  DM.Database1.Commit;
  DM.Database1.StartTransaction;

  TRY

  with DM.Query_Gen do
  begin
    Gauge.Progress := 0;

    Close;     //한해에 한번만 생성할것
    SQL.Clear;
    SQL.Add(' Select cnt,                                                                                        ');
    SQL.Add('        max(grade1)  A1,  max(grade2)  A2,  max(grade3)  A3,  max(grade4)  A4,  max(grade5)  A5,    ');
    SQL.Add('        max(grade6)  A6,  max(grade7)  A7,  max(grade8)  A8,  max(grade9)  A9,  max(grade10) A10,   ');
    SQL.Add('        max(grade11) A11, max(grade12) A12, max(grade13) A13, max(grade14) A14, max(grade15) A15,   ');
    SQL.Add('        max(grade16) A16, max(grade17) A17, max(grade18) A18, max(grade19) A19, max(grade20) A20,   ');
    SQL.Add('        max(grade21) A21, max(grade22) A22, max(grade23) A23, max(grade24) A24, max(grade25) A25,   ');
    SQL.Add('        max(grade26) A26, max(grade27) A27, max(grade28) A28, max(grade29) A29, max(grade30) A30,   ');
    SQL.Add('        max(grade31) A31, max(grade32) A32, max(grade33) A33, max(grade34) A34, max(grade35) A35,   ');
    SQL.Add('        max(grade36) A36, max(grade37) A37, max(grade38) A38, max(grade39) A39, max(grade30) A30,   ');
    SQL.Add('        max(grade41) A41, max(grade42) A42, max(grade43) A43, max(grade44) A44, max(grade45) A45,   ');
    SQL.Add('        max(grade46) A46, max(grade47) A47, max(grade48) A48, max(grade49) A49, max(grade40) A40,   ');
    SQL.Add('        max(grade51) A51, max(grade52) A52, max(grade53) A53, max(grade54) A54, max(grade55) A55,   ');
    SQL.Add('        max(grade56) A56, max(grade57) A57, max(grade58) A58, max(grade59) A59, max(grade50) A50,   ');
    SQL.Add('        max(grade61) A61, max(grade62) A62, max(grade63) A63, max(grade64) A64, max(grade65) A65,   ');
    SQL.Add('        max(grade66) A66, max(grade67) A67, max(grade68) A68, max(grade69) A69, max(grade60) A60,   ');
    SQL.Add('        max(grade71) A71, max(grade72) A72, max(grade73) A73, max(grade74) A74, max(grade75) A75,   ');
    SQL.Add('        max(grade76) A76, max(grade77) A77, max(grade78) A78, max(grade79) A79, max(grade70) A70,   ');
    SQL.Add('        max(grade81) A81, max(grade82) A82, max(grade83) A83, max(grade84) A84, max(grade85) A85,   ');
    SQL.Add('        max(grade86) A86, max(grade87) A87, max(grade88) A88, max(grade89) A89, max(grade80) A80,   ');
    SQL.Add('        max(grade91) A91, max(grade92) A92, max(grade93) A93, max(grade94) A94, max(grade95) A95,   ');
    SQL.Add('        max(grade96) A96, max(grade97) A97, max(grade98) A98, max(grade99) A99, max(grade100) A100  ');
    SQL.Add('	 From (                                                                                          ');

    for I := 1 to 100 do
    begin
      SQL.Add('      Select ROWNUM cnt,                                                                         ');
      SqlText := '             ';
      k := 0;
      for J := 1 to 100 do
      begin
           if I = J then
           begin
                if   J = 100 then SqlText := SqlText + ' grade grade' + inttostr(J)
                else              SqlText := SqlText + ' grade grade' + inttostr(J) + ',' ;
           end
           else
           begin
                if   J = 100 then SqlText := SqlText + ' ''''  grade' + inttostr(J)
                else              SqlText := SqlText + ' ''''  grade' + inttostr(J) + ',';
           end;
      end;

      SQL.Add( SqlText );
      SQL.Add('      From psilgradelist        ');
      SQL.Add('     Where silgrade = ''E''     ');
      SqlText := '    And inwon = ' + inttostr(I);
      SQL.Add(SqlText);
      if I <> 100 then
        SQL.Add('  union all                                                                                      ');
    end;

    SQL.Add('	 )     group by cnt                                                                               ');
  end;

  Gauge.Progress := 100;

  MainForm.St_Help.Panels[0].Text := '';

  DM.Database1.Commit;
  EXCEPT
    on E:EDBEngineError do
    begin
         DM.Database1.Rollback;
         MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);

         Gauge.Progress := 100;
         MainForm.St_Help.Panels[0].Text := '';
         Exit;
    end;
  END;
end;

////미사용 
procedure TFm_SubForm4.PeJeonOutLookBtn3Click(Sender: TObject);
var
  CNo, I : Integer;
  CEmpno : String;
begin
  P_1.TextCaption := '';
  P_2.TextCaption := '';
  P_3.TextCaption := '';
  P_4.TextCaption := '';
  P_5.TextCaption := '';
  P_6.TextCaption := '';

  if MessageDlg('각 직무자료 추출을 계속 진행하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    System.Exit;

  Gauge.Progress := 0;
  Application.ProcessMessages;

  if not DM.Database1.InTransaction then DM.Database1.StartTransaction;

  try
  except
    on E:EDBEngineError do
    begin
      DM.Database1.Rollback;
      MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);
      Exit;
    end;
  end;

  if DM.Database1.InTransaction then DM.Database1.Commit;

  /////////////////////////// run //////////////////////////////////////////////
  DM.Database1.StartTransaction;

  TRY
    Gauge.Progress := 0;

    MainForm.St_Help.Panels[0].Text := '자료를 추출중입니다.';
    Application.ProcessMessages;

    DM.Query1.Close;
    DM.Query1.Open;

    CEmpno := Dm.Query1.FieldByName('Empno').Asstring;
    CNo := 1;
    I   := 0;
    
    while not DM.Query1.Eof do
    begin
      if (CEmpno = Dm.Query1.FieldByName('Empno').Asstring) And (CNo in [1,2]) then
      begin
        DM.Query_Gen.Close;
        DM.Query_Gen.Sql.Clear;
        DM.Query_Gen.Sql.Add('Insert Into PISHRMAS_LIST                                                  ');
        DM.Query_Gen.Sql.Add('      (Empno, korname, No, FRDUTYDATE, TODUTYDATE,                         ');
        DM.Query_Gen.Sql.Add('       Cyear, CMonth, JOBFIELD, JOBFIELDNM, DUTYKIND, DUTYKINDNM)          ');
        DM.Query_Gen.Sql.Add('values(:Empno, :korname, :No, :FRDUTYDATE, :TODUTYDATE,                    ');
        DM.Query_Gen.Sql.Add('       :Cyear, :CMonth, :JOBFIELD, :JOBFIELDNM, :DUTYKIND, :DUTYKINDNM)    ');

        DM.Query_Gen.ParamByName('Empno').AsString       := Dm.Query1.FieldByName('Empno').Asstring;
        DM.Query_Gen.ParamByName('korname').AsString     := Dm.Query1.FieldByName('korname').Asstring;
        DM.Query_Gen.ParamByName('No').AsInteger         := Dm.Query1.FieldByName('No').AsInteger;
        DM.Query_Gen.ParamByName('FRDUTYDATE').AsString  := Dm.Query1.FieldByName('FRDUTYDATE').Asstring;
        DM.Query_Gen.ParamByName('TODUTYDATE').AsString  := Dm.Query1.FieldByName('TODUTYDATE').Asstring;
        DM.Query_Gen.ParamByName('Cyear').AsInteger      := Dm.Query1.FieldByName('Cyear').AsInteger;
        DM.Query_Gen.ParamByName('CMonth').AsInteger     := Dm.Query1.FieldByName('CMonth').AsInteger;
        DM.Query_Gen.ParamByName('JOBFIELD').AsString    := Dm.Query1.FieldByName('JOBFIELD').AsString;
        DM.Query_Gen.ParamByName('JOBFIELDNM').AsString  := Dm.Query1.FieldByName('JOBFIELDNM').Asstring;
        DM.Query_Gen.ParamByName('DUTYKIND').AsString    := Dm.Query1.FieldByName('DUTYKIND').Asstring;
        DM.Query_Gen.ParamByName('DUTYKINDNM').AsString  := Dm.Query1.FieldByName('DUTYKINDNM').Asstring;
        DM.Query_Gen.ExecSQL;
      end;

      DM.Query1.Next;

      if (CEmpno <> Dm.Query1.FieldByName('Empno').Asstring) then
      begin
         CEmpno := Dm.Query1.FieldByName('Empno').Asstring;
         CNo := 0;         
      end;


      inc(CNo); inc(I);

      Gauge.Progress := I;
    end;

    MainForm.St_Help.Panels[0].Text := '';

    DM.Database1.Commit;
    EXCEPT
      on E:EDBEngineError do
      begin
        DM.Database1.Rollback;
        MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);

        Gauge.Progress := 100;
        MainForm.St_Help.Panels[0].Text := '';
        Exit;
      end;
    END;

  MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
end;

procedure TFm_SubForm4.BT_UpdateClick(Sender: TObject);
var
  Dest: TStringList;
  I, J: Integer;
  Data: TAData;
  Excel_name: String;
begin
  if MessageDlg('엑셀자료를 Upload 하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then System.Exit;

  CB_1.Checked := False;
  CB_2.Checked := False;
  CB_3.Checked := False;
  CB_4.Checked := False;

  if FileOpenDlg.Execute then Excel_name := FileOpenDlg.FileName ;

  Dest := TStringList.Create;
  Dest.LoadFromFile(Excel_name);

  Gauge.Progress := 0;
  Application.ProcessMessages;

  if not DM.Database1.InTransaction then DM.Database1.StartTransaction;
                                     // 1       2         3        4        5       6          7          8        9      10
  try                                //사번 최종등급 Value등급 역량등급 업적등급 제안점수 전환배치여부 상위부서 승격부서 직군 평가그룹(그룹별인원)
    if Excel_name <> '' then         //사번 최종등급 Value등급 역량등급 업적등급 제안점수 전환배치여부 상위부서 승격부서 직군 //2009년
    begin                            //사번 최종등급 업적등급 승격부서 직종              //2010년
         DM.Query_Gen.Close;
         DM.Query_Gen.Sql.Clear;
         DM.Query_Gen.Sql.Add('Delete pgroupmas              ');
         DM.Query_Gen.Sql.Add(' Where rabasyear = :rabasyear ');
         DM.Query_Gen.ParamByName('rabasyear').AsString  := PPE_rabasyear.Text;
         DM.Query_Gen.ExecSQL;

         for I := 0 to Dest.Count - 1 do
         begin
              Convet(Data, Dest.Strings[I]);

              if (Data[1] <> '사번') And (Data[1] <> '') then
              begin
                  DM.Query_Gen.Close;
                  DM.Query_Gen.Sql.Clear;
                  DM.Query_Gen.Sql.Add('Update pehevhis                           ');
                  DM.Query_Gen.Sql.Add('   Set finalgrade      = :finalgrade,     ');
                  DM.Query_Gen.Sql.Add('       ValuesGrade     = :ValuesGrade,    ');
                  DM.Query_Gen.Sql.Add('       abilityscrgrade = :abilityscrgrade,');
                  DM.Query_Gen.Sql.Add('       resultscrgrade  = :resultscrgrade, ');
                  DM.Query_Gen.Sql.Add('       jobgun          = :jobgun          ');
                  DM.Query_Gen.Sql.Add(' Where rabasyear       = :rabasyear       ');
                  DM.Query_Gen.Sql.Add('   And Empno           = :Empno           ');

                  DM.Query_Gen.ParamByName('rabasyear').AsString       := PPE_rabasyear.Text;
                  DM.Query_Gen.ParamByName('Empno').AsString           := Data[1];
                  DM.Query_Gen.ParamByName('finalgrade').AsString      := Data[2];
                  DM.Query_Gen.ParamByName('ValuesGrade').AsString     := Data[3];
                  DM.Query_Gen.ParamByName('abilityscrgrade').AsString := Data[4];
                  DM.Query_Gen.ParamByName('resultscrgrade').AsString  := Data[5];
                  DM.Query_Gen.ParamByName('jobgun').AsString          := Data[9];
                  DM.Query_Gen.ExecSQL;


                  //////////////////////////////////////////////////////////////
                  DM.Query_Gen.Close;
                  DM.Query_Gen.Sql.Clear;
                  DM.Query_Gen.Sql.Add('Update pimupmas                  ');
//                  DM.Query_Gen.Sql.Add('   Set suggscr   = :suggscr,     ');
//                  DM.Query_Gen.Sql.Add('     shiftyn   = :shiftyn,     ');
                  DM.Query_Gen.Sql.Add('   Set shiftyn   = ''Y'',        '); //2010년부터 폐지로 전체 Y 처리.
                  DM.Query_Gen.Sql.Add('       extcode   = :extcode,     ');
                  DM.Query_Gen.Sql.Add('       deptcode  = :deptcode,    ');
                  DM.Query_Gen.Sql.Add('       jobgun    = :jobgun       ');
                  DM.Query_Gen.Sql.Add(' Where rabasdate = :p_Srabasdate ');
                  DM.Query_Gen.Sql.Add('   And Empno     = :Empno        ');

                  DM.Query_Gen.ParamByName('p_Srabasdate').AsString := E_rabasdate.Text;
                  DM.Query_Gen.ParamByName('Empno').AsString        := Data[1];
//                  DM.Query_Gen.ParamByName('suggscr').AsString      := Data[6];
                  DM.Query_Gen.ParamByName('shiftyn').AsString      := Data[6];
                  DM.Query_Gen.ParamByName('extcode').AsString      := Data[7];
                  DM.Query_Gen.ParamByName('deptcode').AsString     := Data[8];
                  DM.Query_Gen.ParamByName('jobgun').AsString       := Data[9];
                  DM.Query_Gen.ExecSQL;

                  //////////////////////////////////////////////////////////////
                 { DM.Query_Gen.Close;
                  DM.Query_Gen.Sql.Clear;
                  DM.Query_Gen.Sql.Add('Insert Into pgroupmas  ( rabasyear,  Empno,  grade,  groupnm,  totcnt) ');
                  DM.Query_Gen.Sql.Add(' Values                (:rabasyear, :Empno, :grade, :groupnm, :totcnt) ');

                  DM.Query_Gen.ParamByName('rabasyear').AsString := PPE_rabasyear.Text;
                  DM.Query_Gen.ParamByName('Empno').AsString     := Data[1];
                  DM.Query_Gen.ParamByName('grade').AsString     := Data[4];
                  DM.Query_Gen.ParamByName('groupnm').AsString   := Data[8];
                  DM.Query_Gen.ParamByName('totcnt').AsString    := Data[6];
                  DM.Query_Gen.ExecSQL;    }
              end;

              Gauge.Progress :=  I;
         end;
         Dest.Free;

         if DM.Database1.InTransaction then DM.Database1.Commit;

         Gauge.Progress := 100;

         MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
    end;
  except
    on E:EDBEngineError do
    begin
         DM.Database1.Rollback;
         MessageDlg(BDEErrorInfo(E), mtWarning, [mbOK],0);
         Exit;
    end;
  end;
end;


end.




