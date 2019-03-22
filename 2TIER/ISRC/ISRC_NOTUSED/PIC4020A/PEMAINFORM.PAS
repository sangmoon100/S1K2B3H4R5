{===================== Program Header ==========================================
 PROGRAM-NAME      : 승격대상자 추출/관리
 SYSTEM-NAME       : 인사
 SUBSYSTEM-NAME    : 승격
 Programmer        : 윤형식
 Version           : 30.20
 Date              : 2001.02.24

Update Contents
 Version  date(yy.mm.dd)  programmer    relevant doc.n    description
 01.00    2001.02.24      윤형식        설계명세서        최초개발본
 30.20    2001.02.24      윤형식        전                특별승격자반영 (재급기간의혜택) : 외국어, 교육, 포상 --> 현재샐승격일에서 추출(raisdate)
 30.21    2004.03.10      정규용        이석희요청        기존 하드코딩된 사번 제거
                                                          개인별 교육이수학점열람과 동일한 점수 적용
                                                          교육점수를 상한점수로 제한
                                                          (S1급이상 5점,S2급 이하 7점) 
================================================================================}  
unit peMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, DBTables, peoutlookbtn, PeJeonLabel, pegradpanl, pedate,
  pedbdate, ComCtrls, pedbutil, datelib, StdCtrls;

type
  TMainForm = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    PeJeonLabel1: TPeJeonLabel;
    Bt_Form2: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Pa_Work: TPanel;
    St_Help: TStatusBar;
    pe_Date: TPeDbDate;
    Bt_Form1: TPeJeonOutLookBtn;
    Bt_Form3: TPeJeonOutLookBtn;
    Bt_Form4: TPeJeonOutLookBtn;
    Bt_Form5: TPeJeonOutLookBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_ExitClick(Sender: TObject);
    procedure Bt_SelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Start    : Boolean;
    SelForm  : TForm;   // 현재 작업중인 Form
    pTitle   : String;  // 프로그램 제목

    // 작업할 폼을 생성하는 procedure
    procedure SubFormCreate(Sender : TObject);
  public
    { Public declarations }
    pEmpno      : String;  // 로그인 사번
    pKorname    : String;  // 로그인 성명
    pClass      : String;  // 로그인 등급
    Gr          : TprogressBar;

    // 승격관련 전역변수 start ---------------------------------------------------
    // 개별 자료
    sv_rabasdate   : String;  // 승격기준일
    sv_empno       : String;  // 사번
    sv_korname     : String;  // 성명
    sv_rapaycl     : String;  // 승격심사직급
    sv_rajobgun    : String;  // 승격심사직군
    sv_paycldate   : String;  // 재급기간기준일
    sv_raisdate    : String;  // 승격점수추출기준일
    sv_raobjyn     : String;  // 승격대상여부
    sv_raexsayu    : String;  // 승격제외사유
    sv_minrayearyn : String;  // 최소승격년한대상여부
    iv_payclyy     : Integer; // 재급기간년수
    iv_payclmm     : Integer; // 재급기간월수
    fv_totevavg    : Double;  // 종합평가평균점수
    fv_evscore     : Double;  // 평가점수
    fv_payscore    : Double;  // 재급기간점수
    fv_eduscore    : Double;  // 교육점수
    fv_forgetscr   : Double;  // 외국어성적
    fv_forscore    : Double;  // 외국어점수
    sv_repclass    : String;  // 레포트등급
    fv_repscore    : Double;  // 레포트점수
    fv_orgrewscore : Double;  // 원시포상점수
    fv_proscore    : Double;  // 제안점수
    fv_rewscore    : Double;  // 포상점수
    fv_raisscore   : Double;  // 승격점수

    iv_maxexamscore12_1: Integer; // 외국어 시험결과 임시
    iv_maxexamscore12_2: Integer; // 외국어 시험결과 임시

    payrachdate    : String;  // 직책체계변경일
    Gsysdate       : String;  // 현시스템 일자

    // 변수자료
    sg_rabasdate   : String;  // 전역승격기준일
    sg_payclfr     : String;  // 승격대상자 직급fr
    sg_payclto     : String;  // 승격대상자 직급to
    sg_rabasyear   : String;  // 승격종합점수 기준년
    sg_pehrdate    : String;  // 업적평가 기준년
    sg_orgnum      : String;  // 현 차수

    sg_radumonth   : String;  // 승격대상자 재급월수
    sg_cardumonth  : String;  // 경력입사자 근무월수
    sg_basforscore : String;  // 부장외국어 기준점수
    sg_rapayclfr   : String;  // 승격대상자 직급fr
    sg_rapayclto   : String;  // 승격대상자 직급to
    sg_Basepaycldate    : String; // 승격대상기준일
    sg_BaseCarDate      : String; // 경력입사자기준일
    sg_BaseMinRaYearDate: String; // 최소승격년한기준일

    vUpManager1, vUpManager2 : String; //승격담당자.

    // 승격관련 전역변수 end -----------------------------------------------------

    procedure fzSetBaseDates;
    function  fnBatchPimupmas: Boolean;
    function  fnBatchCalc: Boolean;
    function  fnBatchCalc_2: Boolean;
    procedure fzInitVaribles;
    function  fnExecsql(mBatchCnt: Integer; mProgress: String): Boolean;
    function  fnCalcsql(mBatchCnt: Integer; mProgress: String): Boolean;
    function  fnCalcsql_2(mBatchCnt: Integer; mProgress: String): Boolean;
    function  fnSaveData: Boolean;
    function  fnSetDudays(mQuery: TQuery; mEmpno, mFrdate, mTodate: String): String;
    function  fnAllBatch: Boolean;
  end;

var
  MainForm: TMainForm;

  workgubun   : String;
  ig_TotCount : Integer;
  ig_CurCount : Integer;

implementation

uses
   pic4020a1, pic4020a2, pic4020a3, pic4020a4, pic4020a5, peDm;

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
  pEmpno   := peParam(CmdLine,1);
  pKorname := peParam(CmdLine,2);
  pClass   := peParam(CmdLine,4);
  pTitle   := peParam(CmdLine,9);

  Application.ProcessMessages;

  if not PeDBConnect(CmdLine,DM.DataBase1,St_Help) then Close;

  pe_Date.GetDate;
  St_Help.Panels[1].Text := ' '+pe_Date.DateFrm;
  UpDateWindow(St_Help.Handle);

  // 현 기준일을 읽어온다.
  Pe_Date.GetBaseYear;

  pTitle := 'BAND조정대상자 추출/관리';
  Pa_Title.Caption  := pTitle;
  Application.Title := pTitle;
  Bt_SelectClick(Bt_Form4);
  
  fzSetBaseDates;
  if (vUpManager1 <> pEmpno) and (vUpManager2 <> pEmpno) and (Copy(pEmpno,1,1) <> 'D') then  //승격담당자만 접속 가능케.
  begin
       Application.MessageBox(PChar('사용권한이 부족합니다.! 자동종료 됩니다.'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;
end;

procedure TMainForm.fzSetBaseDates;
begin
    with Dm.Q_Main do
    begin
        // BAND조정기준일, 승격담당자.
        close;
        sql.clear;
        sql.Text :='SELECT Value1, Text2, Text3     '+
                   '  FROM pimupbas                 '+
                   ' WHERE rabasdate = ''00000000'' ';
        Open;
        sg_rabasdate := FieldBYName('Value1').AsString;
        vUpManager1  := FieldBYName('Text2').AsString;
        vUpManager2  := FieldBYName('Text3').AsString;

        // 직책체계변경일
        close;
        sql.clear;
        sql.Text :='SELECT value3, value4 FROM pimvari          '+
                   ' WHERE gubun = ''00'' and sgubun = ''0001'' ';
        Open;
        payrachdate := FieldBYName('Value3').AsString;

        // 현시스템일자
        close;
        sql.clear;
        sql.Text :='SELECT to_char(sysdate,''YYYYMMDD'') value1 FROM dual ';
        Open;
        Gsysdate    := FieldBYName('Value1').AsString;

        // BAND조정대상재급월수, 경력입사근무월수, 부장외국어기준점수
        close;
        sql.clear;
        sql.Text :='SELECT value1, value2, value3      '+
                   '  FROM pimrabas                    '+
                   ' WHERE rabasdate = :p_rabasdate    '+
                   '   AND gubun  = ''10''             '+
                   '   AND paycl  = ''00''             '+
                   '   AND jobgun = ''00''             ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        Open;
        sg_radumonth   := FieldBYName('Value1').AsString;
        sg_cardumonth  := FieldBYName('Value2').AsString;
        sg_basforscore := FieldBYName('Value3').AsString;

        // BAND조정대상직급
        close;
        sql.clear;
        sql.Text :='SELECT PAYCLFR, PAYCLTO          '+ //직급제 변경에 따라 value1, value2 에서 필드변경 2009.11.
                   '  FROM pimupbas                  '+
                   ' WHERE rabasdate = :p_rabasdate  '+
                   '   AND upcodeno  = ''100''       ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        Open;
        sg_payclfr   := FieldBYName('PAYCLFR').AsString;
        sg_payclto   := FieldBYName('PAYCLTO').AsString;

        //BAND조정종합점수 기준년
        close;
        sql.clear;
        sql.Text :='SELECT value1                      '+
                   '  FROM pimupbas                    '+
                   ' WHERE rabasdate = :p_rabasdate    '+
                   '   AND upcodeno = ''200''          ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        Open;
        sg_rabasyear   := FieldBYName('Value1').AsString;

        //업적평가 기준년, 현 차수
        close;
        sql.clear;
        sql.Text :='SELECT value1, text1             '+
                   '  FROM pimupbas                  '+
                   ' WHERE rabasdate = :p_rabasdate  '+
                   '   AND upcodeno = ''300''        ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        Open;
        sg_pehrdate   := FieldBYName('Value1').AsString;
        sg_orgnum     := FieldBYName('text1').AsString;        //showmessage(sg_pehrdate + ' ' + sg_orgnum);
        close;
    end; // end of with Dm.Q_Main do
end;

procedure TMainForm.fzInitVaribles;
begin
    sv_rabasdate   := '';
    sv_empno       := '';
    sv_korname     := '';
    sv_rapaycl     := '';
    sv_rajobgun    := '';
    sv_paycldate   := '';
    sv_raisdate    := '';
    sv_raobjyn     := '';
    sv_raexsayu    := '';
    sv_minrayearyn := '';
    iv_payclyy     := 0;
    iv_payclmm     := 0;
    fv_totevavg    := 0;
    fv_evscore     := 0;
    fv_payscore    := 0;
    fv_eduscore    := 0;
    fv_forgetscr   := 0;
    fv_forscore    := 0;
    sv_repclass    := '';
    fv_repscore    := 0;
    fv_orgrewscore := 0;
    fv_proscore    := 0;
    fv_rewscore    := 0;
    fv_raisscore   := 0;

    iv_maxexamscore12_1 := 0;
    iv_maxexamscore12_2 := 0;
end;

procedure TMainForm.Bt_SelectClick(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.SubFormCreate(Sender : TObject);
begin
  Try
    if (SelForm <> nil) or Assigned(SelForm) then
    begin
       // SelForm.Free;
        SelForm := nil;
    end;

    case TComponent(Sender).Tag of
      1 : begin      //미사용
            Bt_Form1.Font.Color := clPurple;
            Bt_Form2.Font.Color := clBlack;
            Bt_Form3.Font.Color := clBlack;
            Bt_Form4.Font.Color := clBlack;
            Bt_Form5.Font.Color := clBlack;
            SelForm := TFm_SubForm1.Create(nil);
          end;
      2 : begin      //미사용
            Bt_Form1.Font.Color := clBlack;
            Bt_Form2.Font.Color := clBlack;
            Bt_Form3.Font.Color := clBlack;
            Bt_Form4.Font.Color := clBlack;
            Bt_Form5.Font.Color := clPurple;
            SelForm := TFm_SubForm2.Create(nil);
          end;

      3 : begin      //미사용
            Bt_Form1.Font.Color := clBlack;
            Bt_Form2.Font.Color := clBlack;
            Bt_Form3.Font.Color := clPurple;
            Bt_Form4.Font.Color := clBlack;
            Bt_Form5.Font.Color := clBlack;
            SelForm := TFm_SubForm3.Create(nil);
          end;
      4 : begin
            Bt_Form1.Font.Color := clBlack;
            Bt_Form2.Font.Color := clBlack;
            Bt_Form3.Font.Color := clBlack;
            Bt_Form4.Font.Color := clPurple;
            Bt_Form5.Font.Color := clBlack;
            SelForm := TFm_SubForm4.Create(nil);
          end;
      5 : begin
            Bt_Form1.Font.Color := clBlack;
            Bt_Form2.Font.Color := clBlack;
            Bt_Form3.Font.Color := clBlack;
            Bt_Form4.Font.Color := clBlack;
            Bt_Form5.Font.Color := clPurple;
            SelForm := TFm_SubForm5.Create(nil);
          end;
    end;

    if Assigned(SelForm) then
    begin
        SelForm.Parent      := Pa_Work;
        SelForm.WindowState := wsMaximized;
        SelForm.Show;
    end;

  Except
    begin
        SelForm.Free;
        SelForm := nil;
    end;
  End;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

function TMainForm.fnExecsql(mBatchCnt: Integer; mProgress: String): Boolean;
begin
    Result := False;

    with Dm.Q_Main do
    begin
        Close;
        Sql.Clear;
        case mBatchCnt of
           0: begin
                Sql.Text :=
                  'DELETE FROM pimupmas                                        '+
                  ' WHERE rabasdate = :p_rabasdate                             ';
                ParambyName('p_rabasdate').AsString  := sg_rabasdate;
              end;

           1: begin
                Sql.Text :=
                  'INSERT INTO pimupmas (rabasdate,                            '+
                  '                      empno,                                '+
	          '                      korname,                              '+
                  '                      orgnum,                               '+
                  '                      deptcode,                             '+
                  '                      paycl,                                '+
                  '                      payra,                                '+
                  '                      jobgun,                               '+
                  '                      paycldate)                            '+
                  '              SELECT  :p_rabasdate,                         '+
                  '                       empno,                               '+
                  '                       korname,                             '+
                  '                       orgnum,                              '+
                  '                       deptcode,                            '+
                  '                       paycl,                               '+
                  '                       payra,                               '+
                  '                       jobgun,                              '+
                  '                       paycldate                            '+
                  '                 FROM  pimpmas                              '+
                  '                WHERE  paycl BETWEEN :payclfr AND :payclto  '+
                  '                  AND  pstate < ''80''                      ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;

           //2. 승격 한번도 안한사람들
           //직급일이 2005년도 보다 작을경우
           //20050401 이전입사자 : 0101
           //20050401 이후입사자 : 3개월 전 날짜
           2: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                                                                 '+
                  '     ( SELECT CASE WHEN  SUBSTR(paycldate,5,4) <= ''0401'' THEN SUBSTR(paycldate,1,4) || ''0101'' '+
                  '                   ELSE  TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -3),''yyyymmdd'') END             '+
                  '       FROM pimpmas                                                                               '+
                  '       WHERE cpaycldate IS NULL                                                                   '+
                  '       AND paycl BETWEEN :payclfr AND :payclto                                                    '+
                  '       AND pstate < ''80''                                                                        '+
                  '       AND paycldate IS NOT NULL                                                                  '+
                  '       AND paycldate < ''20050101''                                                               '+
                  '       AND empno = a.empno )                                                                      '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                                                        '+
                  '                 WHERE cpaycldate IS NULL                                                         '+
                  '                 AND paycl BETWEEN :payclfr AND :payclto                                          '+
                  '                 AND pstate < ''80''                                                              '+
                  '                 AND paycldate IS NOT NULL                                                        '+
		  '		    AND paycldate < ''20050101'')                                                    '+
                  'AND rabasdate = :p_rabasdate                                                                      ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

           //3. 승격 한번도 안한사람들
           //직급일이 2005년도 보다 이상일 경우
           //20050301 이전입사자 : 0101
           //20050301 이후입사자 : 2개월 전 날짜
           3: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                                                                  '+
                  '      ( SELECT CASE WHEN  SUBSTR(paycldate,5,4) <= ''0301'' THEN SUBSTR(paycldate,1,4) || ''0101'' '+
                  '                    ELSE  TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -2),''yyyymmdd'') END             '+
                  '        FROM pimpmas                                                                               '+
                  '        WHERE cpaycldate IS NULL                                                                   '+
                  '        AND paycl BETWEEN :payclfr AND :payclto                                                    '+
                  '        AND pstate < ''80''                                                                        '+
                  '        AND paycldate IS NOT NULL                                                                  '+
		  '	   AND paycldate >= ''20050101''                                                              '+
		  '	   AND empno = a.empno )                                                                      '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                                                         '+
                  '                 WHERE cpaycldate IS NULL                                                          '+
                  '                 AND paycl BETWEEN :payclfr AND :payclto                                           '+
                  '                 AND pstate < ''80''                                                               '+
                  '                 AND paycldate IS NOT NULL                                                         '+
		  '		    AND paycldate >= ''20050101'')                                                    '+
                  'AND rabasdate = :p_rabasdate                                                                       ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

           //4. 승격 한번도 안한 경력자 : 경력일과 직급일중 작은값
           //직급일이 2005년도 보다 작을경우  << 직급일 기준임.
           //20050401 이전입사자 : 0101
           //20050401 이후입사자 : 3개월 전 날짜
           4: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                                                                     '+
                  '      ( SELECT CASE WHEN SUBSTR(LEAST(cardate,paycldate),5,4) <= ''0401'' THEN                        '+
                  '                          SUBSTR(LEAST(cardate,paycldate),1,4) || ''0101''                            '+
                  '                     ELSE TO_CHAR(ADD_MONTHS(TO_DATE(LEAST(cardate,paycldate)), -3),''yyyymmdd'') END '+
                  '         FROM pimpmas                                                                                 '+
                  '         WHERE cpaycldate IS NULL                                                                     '+
		  '	    AND cardate IS NOT NULL                                                                      '+
                  '         AND paycl BETWEEN :payclfr AND :payclto                                                      '+
                  '         AND pstate < ''80''                                                                          '+
                  '         AND paycldate IS NOT NULL                                                                    '+
		  '	    AND paycldate < ''20050101''                                                                 '+
		  '	    AND empno = a.empno )                                                                        '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                                                            '+
                  '                 WHERE cpaycldate IS NULL                                                             '+
		  '		    AND cardate IS NOT NULL                                                              '+
                  '                 AND paycl BETWEEN :payclfr AND :payclto                                              '+
                  '                 AND pstate < ''80''                                                                  '+
                  '                 AND paycldate IS NOT NULL                                                            '+
		  '		    AND paycldate < ''20050101'')                                                        '+
                  '                 AND rabasdate = :p_rabasdate                                                         ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

           //5. 승격 한번도 안한 경력자 : 경력일과 직급일중 작은값
           //직급일이 2005년도 보다 이상일 경우       << 직급일 기준임.
           //20050301 이전입사자 : 0101
           //20050301 이후입사자 : 2개월 전 날짜
           5: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                                                                        '+
                  '         ( SELECT CASE WHEN SUBSTR(LEAST(cardate,paycldate),5,4) <= ''0301'' THEN                        '+
                  '                            SUBSTR(LEAST(cardate,paycldate),1,4) || ''0101''                             '+
                  '                       ELSE  TO_CHAR(ADD_MONTHS(TO_DATE(LEAST(cardate,paycldate)), -2),''yyyymmdd'') END '+
                  '                  FROM pimpmas                                                                           '+
                  '                  WHERE cpaycldate IS NULL                                                               '+
		  '		     AND cardate IS NOT NULL                                                                '+
                  '                  AND paycl BETWEEN :payclfr AND :payclto                                                '+
                  '                  AND pstate < ''80''                                                                    '+
                  '                  AND paycldate IS NOT NULL                                                              '+
		  '		     AND paycldate >= ''20050101''                                                          '+
		  '		     AND empno = a.empno )                                                                  '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                                                               '+
                  '                 WHERE cpaycldate IS NULL                                                                '+
		  '		    AND cardate IS NOT NULL                                                                 '+
                  '                 AND paycl BETWEEN :payclfr AND :payclto                                                 '+
                  '                 AND pstate < ''80''                                                                     '+
                  '                 AND paycldate IS NOT NULL                                                               '+
		  '		    AND paycldate >= ''20050101'')                                                          '+
                  'AND rabasdate = :p_rabasdate                                                                             ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

           //6. 기존 승격자들
           //0401 이전승격일: 0101
           //0401 이후긍격일 : 3개월 전 날짜
           6: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                                                                   '+
                  '      ( SELECT CASE WHEN SUBSTR(paycldate,5,4) <= ''0401'' THEN SUBSTR(paycldate,1,4) || ''0101''   '+
                  '                    ELSE  TO_CHAR(ADD_MONTHS(TO_DATE(paycldate), -3),''yyyymmdd'') END              '+
                  '        FROM pimpmas                                                                                '+
                  '        WHERE cpaycldate IS NOT NULL                                                                '+
                  '        AND paycl BETWEEN :payclfr AND :payclto                                                     '+
                  '        AND pstate < ''80''                                                                         '+
                  '        AND paycldate IS NOT NULL                                                                   '+
		  '	   AND empno = a.empno )                                                                       '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                                                          '+
                  '                 WHERE cpaycldate IS NOT NULL                                                       '+
                  '                 AND paycl BETWEEN :payclfr AND :payclto                                            '+
                  '                 AND pstate < ''80''                                                                '+
                  '                 AND paycldate IS NOT NULL)                                                         '+
                  'AND rabasdate = :p_rabasdate                                                                        ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

           //7. 휴직이 없는 사람들 승격마스터(PIMUPMAS)에 재급기간 update
           7: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET payclyy = fyear_between (TO_DATE(paycldate),TO_DATE(:p_rabasdate)),     '+
                  '                      payclmm = fmonth_between(TO_DATE(paycldate),TO_DATE(:p_rabasdate)),     '+
                  '                      paycldd = fday_between  (TO_DATE(paycldate),TO_DATE(:p_rabasdate))      '+
                  'WHERE a.paycldate IS NOT NULL                                                                 '+
                  'AND a.empno NOT IN (SELECT empno                                                              '+
                  '                    FROM pihexdu b                                                            '+
		  '	               WHERE a.paycldate <= b.extodate                                           '+
		  '	               AND a.empno = b.empno )                                                   '+
                  'AND rabasdate = :p_rabasdate                                                                  ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;


           //8. 휴직이 있는 사람들 승격마스터(PIMUPMAS)에 재급기간 update
           8: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET payclyy =                                                                                           '+
                  '                       fyear_between ((SELECT TO_DATE(paycldate) + hucnt                                                  '+
                  '                                       FROM ( SELECT a.empno,                                                             '+
                  '                                                     b.paycldate,                                                         '+
                  '                                                     SUM(TO_DATE(LEAST(a.extodate,:p_rabasdate), ''yyyymmdd'') -          '+
                  '                                                         TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''yyyymmdd'')) hucnt  '+
                  '                                              FROM pihexdu a, pimupmas b                                                  '+
                  '                                              WHERE a.empno = b.empno                                                     '+
                  '                                              AND b.paycldate <= extodate                                                 '+
		  '						 AND b.rabasdate = :p_rabasdate                                              '+
                  '                                              GROUP BY a.empno,b.paycldate )                                              '+
                  '                                        WHERE empno = a.empno),TO_DATE(:p_rabasdate)),                                    '+
                  '                       payclmm =                                                                                          '+
                  '                        fmonth_between((SELECT TO_DATE(paycldate) + hucnt                                                 '+
                  '                                        FROM ( SELECT a.empno,                                                            '+
                  '                                                      b.paycldate,                                                        '+
                  '                                                      SUM(TO_DATE(LEAST(a.extodate,:p_rabasdate), ''yyyymmdd'') -         '+
                  '                                                          TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''yyyymmdd'')) hucnt '+
                  '                                               FROM pihexdu a, pimupmas b                                                 '+
                  '                                               WHERE a.empno = b.empno                                                    '+
                  '                                               AND b.paycldate <= extodate                                                '+
		  '					          AND rabasdate = :p_rabasdate                                               '+
                  '                                               GROUP BY a.empno,b.paycldate )                                             '+
                  '                                        WHERE empno = a.empno),TO_DATE(:p_rabasdate)),                                    '+
                  '                       paycldd =                                                                                          '+
                  '                        fday_between  ((SELECT TO_DATE(paycldate) + hucnt                                                 '+
                  '                                        FROM ( SELECT a.empno,                                                            '+
                  '                                                      b.paycldate,                                                        '+
                  '                                                      SUM(TO_DATE(LEAST(a.extodate,:p_rabasdate), ''yyyymmdd'') -         '+
                  '                                                          TO_DATE(GREATEST(b.paycldate, a.exfrdate), ''yyyymmdd'')) hucnt '+
                  '                                               FROM pihexdu a, pimupmas b                                                 '+
                  '                                               WHERE a.empno = b.empno                                                    '+
                  '                                               AND b.paycldate <= extodate                                                '+
		  '				                  AND rabasdate = :p_rabasdate                                               '+
                  '                                               GROUP BY a.empno,b.paycldate )                                             '+
                  '                                        WHERE empno = a.empno),TO_DATE(:p_rabasdate))                                     '+
                  'WHERE a.paycldate IS NOT NULL                                                                                             '+
                  'AND a.empno IN (SELECT empno                                                                                              '+
                  '                FROM pihexdu b                                                                                            '+
                  '		   WHERE a.paycldate <= b.extodate                                                                           '+
		  '	           AND a.empno = b.empno )                                                                                   '+
                  'AND rabasdate = :p_rabasdate                                                                                              ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

              //9. 승격 종합 점수 삭제
           9: begin
                Sql.Text :=
                  'DELETE FROM pehevhis            '+
                  'WHERE rabasyear = :rabasyear    ';
                ParambyName('rabasyear').AsString  := sg_rabasyear;
              end;

          //10. 승격 종합 점수 입력
          10: begin
                Sql.Text :=
                  'INSERT INTO pehevhis                                   '+
                  '  ( rabasyear,                                         '+
                  '    empno,                                             '+
	          '    korname,                                           '+
                  '    orgnum,                                            '+
                  '    deptcode,                                          '+
                  '    paycl,                                             '+
                  '    payra,                                             '+
                  '    jobgun,                                            '+
                  '    finalgrade )                                       '+
                  'SELECT :rabasyear,                                     '+
                  '       empno,                                          '+
                  '       korname,                                        '+
                  '       orgnum,                                         '+
                  '       deptcode,                                       '+
                  '       paycl,                                          '+
                  '       payra,                                          '+
                  '       jobgun,                                         '+
                  '       ''B''                                           '+
                  'FROM pimupmas                                          '+
                  'WHERE empno NOT IN (SELECT empno FROM pehevhis         '+
                  '                    WHERE  rabasyear = :rabasyear)     '+
                  'AND rabasdate = :p_rabasdate                           ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;



        end; // end of case



        St_Help.Panels[0].Text := ' '+mProgress;
        Application.ProcessMessages;

      TRY
        ExecSQL;

        Result := True;
      EXCEPT
        begin
          Showmessage('다음의 작업을 실행하는 도중 오류가 발생하였습니다.'+#13+#10+
                      '[ '+mProgress+' ]');
        end;
      END;
    end;
end;

function TMainForm.fnCalcsql(mBatchCnt: Integer; mProgress: String): Boolean;
begin
    Result := False;

    with Dm.Q_Sub do
    begin
        Close;
        Sql.Clear;
        case mBatchCnt of

          //11. 평가이력에 하반기 업적점수 데이터 삭제
          11: begin
                Sql.Text :=
                  'DELETE FROM TMP_RESULT2                    ';
              end;

          //12. 평가이력에 하반기 업적점수 데이터 입력
          12: begin
                Sql.Text :=
                  'INSERT INTO TMP_RESULT2                                                                          '+
                  'SELECT a.empno, NVL(eac.each_hap,0)+NVL(b.econtrscr,0)+NVL(alt.all_hap,0)   tot_hap              '+
                  'FROM                                                                                             '+
                  '(                                                                                                '+
	          '  SELECT                                                                                         '+
                  '         b.rabasdate,                                                                            '+
                  '         b.empno, SUM(NVL(b.ESCORE,0)) each_hap                                                  '+
                  '  FROM   PEHREAIM_DET b                                                                          '+
   	          '  WHERE b.RABASDATE = :p_pehrdate                                                               '+
                  '  GROUP BY b.rabasdate, b.EMPNO                                                                  '+
                  ') eac,                                                                                           '+
                  '(                                                                                                '+
                  '  SELECT t1.rabasdate, t1.empno,  SUM(NVL(ROUND(t1.sel_data * t2.mainweight *0.01,2),0)) all_hap '+
                  '  FROM ( SELECT a.rabasdate, c.empno,                                                            '+
                  '                b.taskname, b.taskcode, SUBSTR(a.deptcode,1,4) deptcode,                         '+
                  '                NVL(ROUND(SUM((a.detailrscore * a.detailweight)/100),2),0) sel_data              '+
     		  '         FROM pehaimhis_com a, pehreaim_bas b, pimpmas c                                         '+
     		  '	    WHERE SUBSTR(a.deptcode,1,4) = SUBSTR(c.deptcode,1,4)                                   '+
     		  '	    AND a.rabasdate = :p_pehrdate                                                          '+
     		  '	    AND NVL(a.eobjyn,''N'')  <> ''Y''                                                       '+
     		  '	    AND NVL(a.econyn,''N'')  =  ''Y''                                                       '+
     		  '	    AND a.rabasdate = b.rabasdate                                                           '+
     		  '	    AND SUBSTR(a.deptcode,1,4) = SUBSTR(b.deptcode,1,4)                                     '+
     		  '	    AND a.taskcode  = b.taskcode                                                            '+
     		  '	    AND c.orgnum = :orgnum                                                                  '+
     		  '	    GROUP BY a.rabasdate, c.empno, b.taskname, b.taskcode, SUBSTR(a.deptcode,1,4)           '+
   		  '       ) t1,                                                                                     '+
      		  '	  ( SELECT DISTINCT empno, SUBSTR(deptcode,1,4) deptcode, taskcode, mainweight              '+
      		  '	    FROM pehreaim_comdet                                                                    '+
      		  '	    WHERE rabasdate = :p_pehrdate                                                          '+
   		  '	  ) t2                                                                                      '+
                  'WHERE t1.deptcode = t2.deptcode                                                                  '+
                  'AND   t1.taskcode = t2.taskcode                                                                  '+
    	          'AND   t1.empno    = t2.empno                                                                     '+
    	          'GROUP BY t1.rabasdate, t1.empno                                                                  '+
                  ') alt, pehevhis a, pehreaim_scr b                                                                '+
                  'WHERE a.empno        = eac.empno(+)                                                              '+
                  'AND   a.empno        = alt.empno(+)                                                              '+
                  'AND   a.empno        = b.empno(+)                                                                '+
                  'AND   a.rabasyear    = :rabasyear                                                                '+
                  'AND   b.rabasdate(+) = :p_pehrdate                                                              ';
                ParambyName('p_pehrdate').AsString      := '20041231'; //sg_pehrdate;   //20041231->20051231로 바꿔줄것.
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('orgnum').AsString          := sg_orgnum;

               // showmessage(sg_pehrdate + ' ' +  sg_rabasyear + ' ' + sg_orgnum);
              end;

          //13. 하반기 업적점수 업데이트
          13: begin
                Sql.Text :=
                  'UPDATE pehevhis a                                          '+
                  'SET    resultscr2 =                                        '+
                  '       ( SELECT b.tot_hap                                  '+
                  '         FROM   TMP_RESULT2 b                              '+
                  '         WHERE a.empno = b.empno                           '+
                  '         AND   a.rabasyear = :rabasyear )                  '+
                  'WHERE a.rabasyear = :rabasyear                             '+
                  'AND EXISTS (SELECT *                                       '+
                  '            FROM TMP_RESULT2 b                             '+
		  '            WHERE  a.empno = b.empno )                     ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //14. 조직유형별 평가자 임시테이블 삭제
          14: begin
                Sql.Text :=
                  'DELETE FROM TMP_PPERSON                    ';
              end;

          //15. 조직유형별 평가자 임시테이블 입력
          15: begin
                Sql.Text :=
                  'INSERT INTO TMP_PPERSON                                                                                                                                   '+
                  'SELECT ph.rabasyear, pm.orgnum, pm.empno, pm.paycl, pm.payra, pm.payrayn, pm.jobgun, pm.jobkind, pd.deptcode, pd.fieldcode                                '+
                  ',CASE WHEN pm.paycl IN (''10'',''20'') AND pm.payra =  ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind      IN (''22110'',''22150'') THEN ''BCT3B''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra =  ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''BCT3M''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra =  ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind      IN (''22110'',''22150'') THEN ''BCT2B''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra =  ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''BCT2M''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind      IN (''22110'',''22150'') THEN ''BCM3B''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''BCM3M''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind      IN (''22110'',''22150'') THEN ''BCM2B''   '+
		  '	 WHEN pm.paycl IN (''10'',''20'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''BCM2M''   '+
		  '	 WHEN pm.paycl IN (''22'',''32'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind      IN (''22110'',''22150'') THEN ''KDM3B''   '+
		  '	 WHEN pm.paycl IN (''22'',''32'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''KDM3M''   '+
		  '	 WHEN pm.paycl IN (''22'',''32'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind      IN (''22110'',''22150'') THEN ''KDM2B''   '+
		  '	 WHEN pm.paycl IN (''22'',''32'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''KDM2M''   '+
		  '	 WHEN pm.paycl IN (''40'',''42'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind      IN (''22110'',''22150'') THEN ''SSM3B''   '+
		  '	 WHEN pm.paycl IN (''40'',''42'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) = 3  AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''SSM3M''   '+
		  '	 WHEN pm.paycl IN (''40'',''42'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind      IN (''22110'',''22150'') THEN ''SSM2B''   '+
		  '	 WHEN pm.paycl IN (''40'',''42'') AND pm.payra <> ''2C'' AND LENGTH(pd.fieldcode) <> 3 AND pm.jobkind  NOT IN (''22110'',''22150'') THEN ''SSM2M''   '+
		  '	 ELSE ''XXXXX''                                                                                                                                      '+
		  '  END gubun                                                                                                                                               '+
                  'FROM  pehevhis ph, pimpmas pm, pycdept pd                                                                                                                 '+
                  'WHERE ph.empno     = pm.empno                                                                                                                             '+
                  'AND   pm.orgnum    = pd.orgnum                                                                                                                            '+
                  'AND   pm.deptcode  = pd.deptcode                                                                                                                          '+
                  'AND   ph.rabasyear = :rabasyear                                                                                                                           '+
                  'AND   pm.orgnum    = :orgnum                                                                                                                              '+
                  'AND   pm.paycl BETWEEN :payclfr AND :payclto                                                                                                              ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('orgnum').AsString          := sg_orgnum;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;

          //16. 조직유형별 역량점수 삭제
          16: begin
                Sql.Text :=
                  'DELETE FROM  TMP_ABILITYSCR2              ';
              end;

          //17. 조직유형별 역량점수 삭제
          17: begin
                Sql.Text :=
                  'INSERT INTO TMP_ABILITYSCR2                                                                                                       '+
                  'SELECT gubun, empno,                                                                                                              '+
                  '       ROUND(DECODE(gubun,''BCT3B'', ( SUM(DECODE(ekind || chasu,''공통역량팀장1차'',   (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''공통역량팀장2차'',   (hap/num)*0.4, 0)) )*0.5  +               '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'', (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''리더십역량팀장2차'', (hap/num)*0.4, 0)) )*0.5 ,                '+
		  '			     ''BCT3M'', ( SUM(DECODE(ekind || chasu,''공통역량팀장1차'',   (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''공통역량팀장2차'',   (hap/num)*0.4, 0)) )*0.5  +               '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'', (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''리더십역량팀장2차'', (hap/num)*0.4, 0)) )*0.5,                 '+
		  '			     ''BCT2B'', ( SUM(DECODE(ekind || chasu,''공통역량팀장1차'',   (hap/num)*1.0, 0)) )*0.5  +               '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'', (hap/num)*1.0, 0)) )*0.5,                 '+
		  '			     ''BCT2M'', ( SUM(DECODE(ekind || chasu,''공통역량팀장1차'',   (hap/num)*1.0, 0)) )*0.5  +               '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀장1차'', (hap/num)*1.0, 0)) )*0.5,                 '+
                  '                	     ''BCM3B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) ) * 0.5 +              '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀원'',    (hap/num)*0.4, 0)) +                      '+
                  '                	                  SUM(DECODE(ekind || chasu,''리더십역량1차'',     (hap/num)*0.36, 0)) +                     '+
                  '                                       SUM(DECODE(ekind || chasu,''리더십역량2차'',     (hap/num)*0.24, 0)) ) * 0.3 +             '+
                  '                		        ( SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0))  ) * 0.2,              '+
		  '			     ''BCM3M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) ) * 0.5 +              '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀원'',    (hap/num)*0.4, 0)) +                      '+
                  '                  	       	          SUM(DECODE(ekind || chasu,''리더십역량1차'',     (hap/num)*0.36, 0)) +                     '+
                  '                                       SUM(DECODE(ekind || chasu,''리더십역량2차'',     (hap/num)*0.24, 0)) ) * 0.3 +             '+
                  '                  		        ( SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                                       SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0)) ) * 0.2,               '+
		  '			     ''BCM2B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) ) * 0.5 +              '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀원'',    (hap/num)*0.4, 0)) +                      '+
                  '                  	                  SUM(DECODE(ekind || chasu,''리더십역량1차'',     (hap/num)*0.6, 0)) ) * 0.3 +              '+
                  '                  	    	        ( SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) * 0.2,               '+
		  '			     ''BCM2M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) ) * 0.5 +              '+
                  '                                     ( SUM(DECODE(ekind || chasu,''리더십역량팀원'',    (hap/num)*0.4, 0)) +                      '+
                  '                  	     	          SUM(DECODE(ekind || chasu,''리더십역량1차'',     (hap/num)*0.6, 0)) ) * 0.3 +              '+
                  '                  			( SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) * 0.2,               '+
		  '		             ''KDM3B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0)) ) /2,                  '+
   		  '                          ''KDM3M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                          	          SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) +                      '+
                  '                          		  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                          		  SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0)) ) /2,                  '+
   		  '                          ''KDM2B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) +                      '+
   		  '	                                  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) /2,                  '+
   		  '                          ''KDM2M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) +                      '+
   		  '	                                  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) /2,                  '+
		  '			     ''SSM3B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                         		  SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0)) ) /2,                  '+
   		  '                          ''SSM3M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                          	          SUM(DECODE(ekind || chasu,''공통역량2차'',       (hap/num)*0.4, 0)) +                      '+
                  '                          		  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*0.6, 0)) +                      '+
                  '                          		  SUM(DECODE(ekind || chasu,''직무역량2차'',       (hap/num)*0.4, 0)) ) /2,                  '+
   		  '                          ''SSM2B'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) +                      '+
   		  '	                                  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) /2,                  '+
   		  '                          ''SSM2M'', ( SUM(DECODE(ekind || chasu,''공통역량1차'',       (hap/num)*1.0, 0)) +                      '+
   		  '	                                  SUM(DECODE(ekind || chasu,''직무역량1차'',       (hap/num)*1.0, 0)) ) /2                   '+
		  '	    ), 2) tot_kd                                                                                                             '+
                  'FROM (                                                                                                                            '+
		  '	  SELECT empno, gubun, paycl, payra, deptcode, ekind, eempno, chasu, hap, num                                                '+
                  '       FROM (                                                                                                                     '+
                  '  	         SELECT c.gubun, c.empno,                                                                                            '+
	          '                     c.paycl, NVL((SELECT payra FROM pehremas WHERE  rabasdate = a.rabasdate AND empno = a.empno), '''') payra,   '+
	          '                     c.deptcode,                                                                                                  '+
	          '                     a.ekind  ekind, ''팀장하향평가자'' eempno,                                                                   '+
	          '                     DECODE(b.cnt,1,''팀장1차'',2,''팀장2차'') chasu,                                                             '+
	          '                     DECODE(b.cnt,1,a.e1score, a.e2score) hap,                                                                    '+
	          '                     a.cnt  num                                                                                                   '+
                  '              FROM ( SELECT rabasdate, empno, ekind, cnt, e1score, e2score                                                        '+
	          '                     FROM ( SELECT rabasdate, empno, ekind, SUM(e1score) e1score, SUM(e2score) e2score, COUNT(ekind) cnt          '+
	          '                            FROM petds                                                                                            '+
	          '                            WHERE rabasdate = :p_pehrdate                                                                         '+
	          '                            GROUP BY rabasdate, empno, ekind ) ) a,                                                               '+
	          '                          ( SELECT ROWNUM cnt FROM pimpmas WHERE ROWNUM < 3 ) b,                                                  '+
	          '                          TMP_PPERSON c                                                                                           '+
                  '              WHERE c.empno = a.empno                                                                                             '+
		  '		 UNION                                                                                                               '+
		  '		 SELECT ppr.gubun, ppr.empno,                                                                                        '+
                  '               	ppr.paycl, phr.payra, ppr.deptcode,                                                                          '+
                  '               	pdl.ekind, pdl.eempno,                                                                                       '+
                  '               	DECODE(pdl.eempno, phr.e1empno, ''1차'', phr.e2empno, ''2차'', ''평가자없음'') chasu,                        '+
                  '               	NVL(SUM(pdl.score),0) hap,                                                                                   '+
                  '               	DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num                                                           '+
                  '              FROM   pehremas phr, pesdl pdl, TMP_PPERSON ppr                                                                     '+
                  '              WHERE  phr.empno      = ppr.empno                                                                                   '+
                  '  		 AND    phr.rabasdate = pdl.rabasdate                                                                                '+
                  '              AND    phr.empno      = pdl.empno                                                                                   '+
                  '              AND    phr.rabasdate = :p_pehrdate                                                                                  '+
                  '              GROUP BY ppr.gubun, ppr.empno, phr.e1empno, phr.e2empno, ppr.paycl, phr.payra, ppr.deptcode,                        '+
                  '                   	  pdl.ekind, pdl.eempno                                                                                      '+
                  '  		 UNION                                                                                                               '+
                  '  		 SELECT ppr.gubun, ppr.empno,                                                                                        '+
                  '               	ppr.paycl, phr.payra, ppr.deptcode,                                                                          '+
                  '               	pdh.ekind, ''팀원'' eempno,                                                                                  '+
                  '               	''팀원'' chasu,                                                                                              '+
                  '               	NVL(SUM(pdh.score),0) hap,                                                                                   '+
                  '               	DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1))  num                                                           '+
                  '               FROM  pehremas phr, pesdh pdh, TMP_PPERSON ppr                                                                     '+
                  '               WHERE phr.empno      = ppr.empno                                                                                   '+
                  '  		  AND   phr.rabasdate = pdh.rabasdate                                                                                '+
                  '               AND   phr.empno      = pdh.empno                                                                                   '+
                  '               AND   phr.rabasdate = :p_pehrdate                                                                                  '+
                  '               GROUP BY ppr.gubun, ppr.empno, phr.e1empno, phr.e2empno, ppr.paycl, phr.payra, ppr.deptcode,                       '+
                  '               	   pdh.ekind                                                                                                 '+
                  '          )                                                                                                                       '+
                  ')                                                                                                                                 '+
                  'GROUP BY empno, gubun                                                                                                             ';
                ParambyName('p_pehrdate').AsString      := '20041231'; //sg_pehrdate;   //20041231->20051231로 바꿔줄것.
              end;

          //18. 평가이력에 하반기 업량점수 update
          18: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET                                     '+
                  '        abilityscr2 =                                     '+
                  '       ( SELECT b.tot_kd                                  '+
                  '         FROM TMP_ABILITYSCR2 b                           '+
		  '	    WHERE a.empno = b.empno                          '+
		  '	    AND   a.rabasyear = :rabasyear )                 '+
                  'WHERE a.rabasyear = :rabasyear                            '+
                  'AND EXISTS ( SELECT *                                     '+
                  '             FROM TMP_ABILITYSCR2 b                       '+
		  '	        WHERE a.empno = b.empno                      '+
		  '	        AND   a.rabasyear = :rabasyear )             ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //19. 업적과 역량에 대한 최종점수를 구한다.
          19: begin
                Sql.Text :=
                  'UPDATE pehevhis f                                                                                          '+
                  'SET        f.finalscr =                                                                                    '+
                  '(                                                                                                          '+
                  '  SELECT NVL(e.totscr,0)                                                                                   '+
                  '  FROM (                                                                                                   '+
                  '        SELECT d.rabasyear, d.empno,                                                                       '+
                  '               ROUND(DECODE(gubun, ''BCT3B'', d.resultscr2*0.63 + d.abilityscr2*0.27 + upabl2*0.1,         '+
               	  '		                      ''BCT3M'', d.resultscr2*0.54 + d.abilityscr2*0.36 + upabl2*0.1,         '+
               	  '				      ''BCT2B'', d.resultscr2*0.63 + d.abilityscr2*0.27 + upabl2*0.1,         '+
               	  '				      ''BCT2M'', d.resultscr2*0.54 + d.abilityscr2*0.36 + upabl2*0.1,         '+
               	  '				      ''BCM3B'', d.resultscr2*0.7  + d.abilityscr2*0.3,                       '+
               	  '				      ''BCM3M'', d.resultscr2*0.6  + d.abilityscr2*0.4,                       '+
               	  '				      ''BCM2B'', d.resultscr2*0.7  + d.abilityscr2*0.3,                       '+
               	  '				      ''BCM2M'', d.resultscr2*0.6  + d.abilityscr2*0.4,                       '+
               	  '				      ''KDM3B'', d.resultscr2*0.6  + d.abilityscr2*0.4,                       '+
               	  '				      ''KDM3M'', d.resultscr2*0.5  + d.abilityscr2*0.5,                       '+
               	  '				      ''KDM2B'', d.resultscr2*0.6  + d.abilityscr2*0.4,                       '+
               	  '				      ''KDM2M'', d.resultscr2*0.5  + d.abilityscr2*0.5,                       '+
               	  '				      ''SSM3B'', d.resultscr2*0.5  + d.abilityscr2*0.5,                       '+
               	  '				      ''SSM3M'', d.resultscr2*0.4  + d.abilityscr2*0.6,                       '+
               	  '				      ''SSM2B'', d.resultscr2*0.5  + d.abilityscr2*0.5,                       '+
               	  '				      ''SSM2M'', d.resultscr2*0.4  + d.abilityscr2*0.6,  0), 2) totscr        '+
                  '        FROM ( SELECT a.rabasyear, a.empno, b.gubun, a.resultscr2, a.abilityscr2, NVL(c.upabl2,0) upabl2   '+
                  '               FROM pehevhis a,                                                                            '+
		  '	    	       TMP_PPERSON b,                                                                         '+
                  '                   ( SELECT pempno, ekind, SUM(score)/DECODE(NVL(COUNT(1),0), 0, 1000000, COUNT(1)) upabl2 '+
                  '                     FROM petdl                                                                            '+
                  '                     WHERE rabasdate = :p_pehrdate                                                         '+
                  '            	        AND ekind = ''리더십역량''                                                            '+
                  '                     GROUP BY  pempno, ekind                                                               '+
		  '		       ) c                                                                                    '+
                  '               WHERE a.empno = b.empno                                                                     '+
                  '               AND   a.empno = c.pempno(+)                                                                 '+
                  '               AND   a.rabasyear = :rabasyear                                                              '+
               	  '	        ) d                                                                                           '+
		  '	 ) e                                                                                                  '+
		  '    WHERE f.rabasyear = e.rabasyear                                                                        '+
		  '    AND   f.empno     = e.empno                                                                            '+
		  '    AND   f.rabasyear = :rabasyear                                                                         '+
                  ')                                                                                                          '+
                  'WHERE f.rabasyear = :rabasyear                                                                             ';
                ParambyName('p_pehrdate').AsString      := sg_pehrdate;
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //20. 과장 / 대리,사원  평가집단 분류 테이블1 삭제.
          20: begin
                Sql.Text :=
                  'DELETE FROM  TMP_TEAMGUBUN1          ';
              end;

          //21. 과장 / 대리,사원  평가집단 분류 (실/본부/지사, 단 지사의 경우 영업팀과 기술팀으로 나눔.)
          21: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN1                                             '+
                  '  SELECT b.fieldcode, ''부문'' LEVELS, ''DS'' paycl, COUNT(*) cnt      '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 1                                          '+  //부문
                  '  AND b.deptlevel = ''D0''                                             '+
                  '  AND a.paycl BETWEEN ''32'' AND ''44''                                '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, ''부문'' LEVELS, ''KK'' paycl, COUNT(*) cnt      '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 1                                          '+  //부문
                  '  AND b.deptlevel = ''D0''                                             '+
                  '  AND a.paycl BETWEEN ''22'' AND ''22''                                '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, ''본부'' LEVELS, ''DS'' paycl, COUNT(*) cnt      '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 2                                          '+  //본부
                  '  AND b.deptlevel IN (''D0'',''E0'')                                   '+
                  '  AND a.paycl BETWEEN ''32'' AND ''44''                                '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, ''본부'' LEVELS, ''KK'' paycl, COUNT(*) cnt      '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 2                                          '+  //본부
                  '  AND b.deptlevel IN (''D0'',''E0'')                                   '+
                  '  AND a.paycl BETWEEN ''22'' AND ''22''                                '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, ''실'' LEVELS, ''DS'' paycl, COUNT(*) cnt        '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 3                                          '+  //실
                  '  AND b.deptlevel = ''D0''                                             '+
                  '  AND a.paycl BETWEEN ''32'' AND ''44''                                '+
                  '  AND Trim(b.deptname) NOT LIKE ''%지사%''                             '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, ''실'' LEVELS, ''KK'' paycl, COUNT(*) cnt        '+
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 3                                          '+  //실
                  '  AND b.deptlevel = ''D0''                                             '+
                  '  AND a.paycl BETWEEN ''22'' AND ''22''                                '+
                  '  AND Trim(b.deptname) NOT LIKE ''%지사%''                             '+
                  '  GROUP BY b.fieldcode                                                 '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, SUBSTR(TRIM(b.deptname),                         '+
                  '         INSTR(TRIM(b.deptname), '' '')+1, 2) LEVELS,                  '+
                  '         ''DS'' paycl, COUNT(*) cnt                                    '+  //지사
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 3                                          '+  //실
                  '  AND b.deptlevel IN (''D0'',''E0'')                                   '+  //팀, 팀상세
                  '  AND a.paycl BETWEEN ''32'' AND ''44''                                '+
                  '  AND Trim(b.deptname) LIKE ''%지사%''                                 '+
                  '  GROUP BY b.fieldcode, SUBSTR(TRIM(b.deptname),                       '+
                  '           INSTR(TRIM(b.deptname), '' '')+1, 2)                        '+
                  '  UNION                                                                '+
                  '  SELECT b.fieldcode, SUBSTR(TRIM(b.deptname),                         '+
                  '         INSTR(TRIM(b.deptname), '' '')+1, 2) LEVELS,                  '+
                  '         ''KK'' paycl, COUNT(*) cnt                                    '+  //지사
                  '  FROM pimupmas a, pycdept b                                           '+
                  '  WHERE a.deptcode = b.deptcode                                        '+
                  '  AND a.orgnum = b.orgnum                                              '+
                  '  AND a.rabasdate = :p_rabasdate                                       '+
                  '  AND a.orgnum = :orgnum                                               '+
                  '  AND LENGTH(b.fieldcode) = 3                                          '+  //실
                  '  AND b.deptlevel IN (''D0'',''E0'')                                   '+  //팀, 팀상세
                  '  AND a.paycl BETWEEN ''22'' AND ''22''                                '+
                  '  AND Trim(b.deptname) LIKE ''%지사%''                                 '+
                  '  GROUP BY b.fieldcode, SUBSTR(TRIM(b.deptname),                       '+
                  '           INSTR(TRIM(b.deptname), '' '')+1, 2)                        ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
                ParambyName('orgnum').AsString          := sg_orgnum;
              end;                                                                        

          //22. 과장 / 대리,사원  평가집단 분류 테이블2 삭제.
          22: begin
                Sql.Text :=
                  'DELETE FROM TMP_TEAMGUBUN2            ';
              end;

          //23. 대리~사원 조회시 팀의 인원수가 10명 이하면 과장~사원까지 rank를 포함시킴.(사원~과장 총인원)
          23: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN2                                            '+
                  '  SELECT fieldcode, levels, ''AA'' paycl, SUM(cnt) totcnt             '+
                  '  FROM TMP_TEAMGUBUN1                                                 '+
                  '  WHERE fieldcode || levels IN ( SELECT fieldcode || levels           '+
                  '                                 FROM TMP_TEAMGUBUN1                  '+
                  '                                 WHERE paycl = ''DS''                 '+
                  '                                 AND cnt < 10 )                       '+
                  'GROUP BY fieldcode, levels                                            '+
                  'UNION                                                                 '+
                  'SELECT *                                                              '+
                  'FROM TMP_TEAMGUBUN1                                                   '+
                  'WHERE fieldcode || levels NOT IN (SELECT fieldcode || levels          '+
                  '                                  FROM TMP_TEAMGUBUN1                 '+
                  '                                  WHERE paycl = ''DS''                '+
                  '                                  AND cnt < 10)                       ';
              end;

          //24. 최종등급과 최종순위 데이터 초기화.
          24: begin
                Sql.Text :=
                  'DELETE FROM TMP_TEAMGUBUN3            ';
              end;

          //25. 최종등급과 최종순위를 집계(지사소속이 아닌 과장이하).
          25: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN3                                                                    '+
                  '  SELECT empno, jobgun, deptcode,                                                             '+
                  '         paycl, finalscr, resultscr2, abilityscr2,  rank, totcnt,                             '+
                  '         (rank /  totcnt) * 100 rankrate                                                      '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 10), -1, ''S'' , 0 ,''S''                     '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 30), -1, ''A'' , 0, ''A''                     '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 45), -1, ''B+'', 0, ''B+''                    '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 70), -1, ''B'' , 0, ''B''                     '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 85), -1, ''B-'', 0, ''B-''                    '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 95), -1, ''C'' , 0, ''C''                     '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 100), -1, ''D'', 0, ''D'' ))))))) finalgrade  '+
                  '  FROM                                                                                        '+
                  '  (                                                                                           '+
                  '    SELECT DISTINCT a.empno, a.jobgun, a.deptcode, b.deptname, a.paycl, b.fieldcode,          '+
                  '                    c.paycl payclgrade, a.finalscr, a.resultscr2, a.abilityscr2,              '+
                  '                    rank() over (PARTITION BY b.fieldcode, c.paycl                            '+
                  '                                 ORDER BY a.finalscr DESC) rank,                              '+
                  '                    c.totcnt                                                                  '+
                  '    FROM pehevhis a, pycdept b, tmp_teamgubun2 c                                              '+
                  '    WHERE a.deptcode = b.deptcode                                                             '+
                  '    AND a.orgnum     = b.orgnum                                                               '+
                  '    AND b.fieldcode  = c.fieldcode                                                            '+
                  '    AND a.paycl BETWEEN DECODE(c.paycl,''KK'',''22'',''DS'',''32'',''AA'',''22'')             '+
                  '                    AND DECODE(c.paycl,''KK'',''22'',''DS'',''44'',''AA'',''44'')             '+
                  '    AND a.rabasyear = :rabasyear                                                              '+
                  '    AND a.orgnum    = :orgnum                                                                 '+
                  '    AND a.paycl >= ''22''                                                                     '+
                  '    AND b.deptname NOT LIKE ''%지사%''                                                        '+
                  '    ORDER BY b.fieldcode, c.paycl, a.finalscr DESC                                            '+
                  '  )                                                                                           ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('orgnum').AsString          := sg_orgnum;
              end;

          //26. 최종등급과 최종순위를 집계(지사소속인  과장이하). 지사소속은 영업과 기술팀으로 따로 분류를 또 해야함.
          26: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN3                                                                                        '+
                  '  SELECT empno, jobgun, deptcode,                                                                                 '+
                  '         paycl, finalscr, resultscr2, abilityscr2,  rank, totcnt,                                                 '+
                  '         (rank /  totcnt) * 100 rankrate                                                                          '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 10), -1, ''S'' , 0 ,''S''                                         '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 30), -1, ''A'' , 0, ''A''                                         '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 45), -1, ''B+'', 0, ''B+''                                        '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 70), -1, ''B'',  0, ''B''                                         '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 85), -1, ''B-'', 0, ''B-''                                        '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 95), -1, ''C'' , 0, ''C''                                         '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 100), -1, ''D'', 0, ''D'' ))))))) finalgrade                      '+
                  '  FROM                                                                                                            '+
                  '  (                                                                                                               '+
                  '    SELECT SUBSTR(a.deptcode,1,3),                                                                                '+
                  '           SUBSTR(TRIM(a.deptname), INSTR(TRIM(a.deptname), '' '')+1, 2) gubun,                                   '+
                  '           c.empno, c.jobgun, a.deptcode, a.deptname, c.paycl, b.levels, b.paycl payclgrade,                      '+
                  '           c.finalscr, c.resultscr2, abilityscr2,                                                                 '+
                  '           rank() over (PARTITION BY SUBSTR(a.deptcode,1,3), SUBSTR(TRIM(a.deptname),                             '+
                  '                                     INSTR(TRIM(a.deptname), '' '')+1, 2), b.paycl                                '+
                  '                        ORDER BY NVL(c.finalscr,0) DESC, NVL(c.resultscr2,0) DESC, NVL(abilityscr2,0) DESC) rank, '+
                  '           b.totcnt                                                                                               '+
                  '    FROM pycdept a, tmp_teamgubun2 b, pehevhis c                                                                  '+
                  '    WHERE SUBSTR(a.deptcode,1,3) = b.fieldcode                                                                    '+
                  '    AND SUBSTR(TRIM(a.deptname), INSTR(TRIM(a.deptname), '' '')+1, 2) = b.levels                                  '+
                  '    AND a.deptcode = c.deptcode                                                                                   '+
                  '    AND c.paycl BETWEEN DECODE(b.paycl,''KK'',''22'',''DS'',''32'',''AA'',''22'')                                 '+
                  '                    AND DECODE(b.paycl,''KK'',''22'',''DS'',''44'',''AA'',''44'')                                 '+
                  '    AND c.rabasyear = :rabasyear                                                                                  '+
                  '    AND a.orgnum = :orgnum                                                                                        '+
                  '    AND Trim(a.deptname) LIKE ''%지사%''                                                                          '+
                  '    AND Trim(a.deptname) LIKE ''%팀''                                                                             '+
                  '    ORDER BY SUBSTR(a.deptcode,1,3),                                                                              '+
                  '             SUBSTR(TRIM(a.deptname), INSTR(TRIM(a.deptname), '' '')+1, 2),                                       '+
                  '             b.paycl, c.finalscr DESC                                                                             '+
                  '  )                                                                                                               ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('orgnum').AsString          := sg_orgnum;
              end;

          //27. 최종등급과 최종순위를 집계(팀장평가) 조직평가군(3개군)에 따라 평가 등급 및 서열화 실시.
          27: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN3                                                                                  '+
                  '  SELECT empno, DECODE(jobgun, ''33'',''44'', jobgun) jobgun, deptcode, paycl                               '+
                  '         , finalscr                                                                                         '+
                  '         , RESULTSCR2                                                                                       '+
                  '         , ABILITYSCR2                                                                                      '+
                  '         , rank                                                                                             '+
                  '         , totcnt                                                                                           '+
                  '         , (rank /  totcnt) * 100  rankrate                                                                 '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 10), -1, ''S'' , 0, ''S''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 30), -1, ''A'' , 0, ''A''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 45), -1, ''B+'', 0, ''B+''                                  '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 70), -1, ''B'' , 0, ''B''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 85), -1, ''B-'', 0, ''B-''                                  '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 95), -1, ''C'' , 0, ''C''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 100), -1, ''D'', 0, ''D'' )))))))	finalgrade             '+
                  '  FROM                                                                                                      '+
                  '  (                                                                                                         '+
                  '     SELECT empno                                                                                           '+
                  '            ,DECODE(jobgun, ''33'',''44'', jobgun) jobgun                                                   '+
                  '            ,deptcode                                                                                       '+
                  '            ,paycl                                                                                          '+
                  '            ,NVL(FINALSCR, 0) finalscr                                                                      '+
                  '            ,NVL(RESULTSCR2,0) RESULTSCR2                                                                   '+
                  '            ,NVL(ABILITYSCR2, 0) ABILITYSCR2                                                                '+
                  '            ,rank() over(PARTITION BY DECODE(jobgun, ''33'',''44'', jobgun)                                 '+
                  '                         ORDER BY  NVL(FINALSCR,0) DESC, NVL(RESULTSCR2,0) DESC, NVL(ABILITYSCR2,0)) rank   '+
                  '            ,( SELECT COUNT(*)  cnt FROM pehevhis                                                           '+
                  '               WHERE RABASYEAR = :rabasyear                                                                 '+
                  '               AND DECODE(jobgun, ''33'',''44'', jobgun) = DECODE(a.jobgun, ''33'',''44'', a.jobgun)        '+
                  '               AND PAYRA = ''2C''                                                                           '+
                  '               AND PAYCL IN (''10'', ''20'')                                                                '+
                  '               GROUP BY DECODE(a.jobgun, ''33'',''44'', a.jobgun) ) totcnt                                  '+
                  '     FROM pehevhis a                                                                                        '+
                  '     WHERE a.RABASYEAR = :rabasyear                                                                         '+
                  '     AND PAYRA = ''2C''                                                                                     '+
                  '     AND paycl IN (''10'', ''20'')                                                                          '+
                  ')                                                                                                           ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //28. 최종등급과 최종순위를 집계(비보임 차장/부장 평가)
          28: begin
                Sql.Text :=
                  'INSERT INTO TMP_TEAMGUBUN3                                                                                  '+
                  '  SELECT empno, DECODE(jobgun, ''33'',''44'', jobgun) jobgun, deptcode, paycl                               '+
                  '         , finalscr                                                                                         '+
                  '         , RESULTSCR2                                                                                       '+
                  '         , ABILITYSCR2                                                                                      '+
                  '         , rank                                                                                             '+
                  '         , totcnt                                                                                           '+
                  '         , (rank /  totcnt) * 100  rankrate                                                                 '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 10), -1, ''S'' , 0, ''S''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 30), -1, ''A'' , 0, ''A''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 45), -1, ''B+'', 0, ''B+''                                  '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 70), -1, ''B'',  0, ''B''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 85), -1, ''B-'', 0, ''B-''                                  '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 95), -1, ''C'' , 0, ''C''                                   '+
                  '         , DECODE(SIGN((rank /  totcnt) * 100 - 100), -1, ''D'', 0, ''D'' )))))))	finalgrade             '+
                  '  FROM                                                                                                      '+
                  '  (                                                                                                         '+
                  '     SELECT empno,                                                                                          '+  //사업총괄부문 제외한 나머지
                  '            jobgun,                                                                                         '+
                  '            deptcode,                                                                                       '+
                  '            paycl,                                                                                          '+
                  '            NVL(finalscr, 0) finalscr,                                                                      '+
                  '            NVL(resultscr2,0)   resultscr2,                                                                 '+
                  '            NVL(abilityscr2, 0) abilityscr2,                                                                '+
                  '            rank() over(PARTITION BY SUBSTR(a.deptcode,1,1)                                                 '+
                  '                        ORDER BY  NVL(finalscr,0) DESC, NVL(resultscr2,0) DESC, NVL(abilityscr2,0) ) rank,  '+
                  '            ( SELECT COUNT(*) cnt                                                                           '+
                  '              FROM pehevhis                                                                                 '+
                  '              WHERE SUBSTR(deptcode,1,1) = SUBSTR(a.deptcode,1,1)                                           '+
                  '              AND rabasyear = :rabasyear                                                                    '+
                  '              AND SUBSTR(deptcode,1,1) <> ''Q''                                                             '+  //사업총괄부문제외
                  '              AND paycl IN (''10'',''20'')                                                                  '+
                  '              AND payra <> ''2C''                                                                           '+
                  '              GROUP BY SUBSTR(deptcode,1,1) ) totcnt                                                        '+
                  '     FROM pehevhis a                                                                                        '+
                  '     WHERE a.rabasyear = :rabasyear                                                                         '+
                  '     AND SUBSTR(a.deptcode,1,1) <> ''Q''                                                                    '+  //사업총괄부문제외
                  '     AND paycl IN (''10'',''20'')                                                                           '+
                  '     AND a.payra <> ''2C''                                                                                  '+
                  '     UNION                                                                                                  '+
                  '     SELECT empno,                                                                                          '+  //사업총괄부문
                  '            jobgun,                                                                                         '+
                  '            deptcode,                                                                                       '+
                  '            paycl,                                                                                          '+
                  '            NVL(finalscr, 0) finalscr,                                                                      '+
                  '            NVL(resultscr2,0) resultscr2,                                                                   '+
                  '            NVL(abilityscr2, 0)   abilityscr2,                                                              '+
                  '            rank() over(PARTITION BY SUBSTR(a.deptcode,1,2)                                                 '+
                  '                        ORDER BY  NVL(finalscr,0) DESC, NVL(resultscr2,0) DESC, NVL(abilityscr2,0) ) rank,  '+
                  '           ( SELECT COUNT(*) cnt                                                                            '+
                  '             FROM pehevhis                                                                                  '+
                  '             WHERE SUBSTR(deptcode,1,2) = SUBSTR(a.deptcode,1,2)                                            '+
                  '             AND rabasyear = :rabasyear                                                                     '+
                  '             AND SUBSTR(deptcode,1,1) = ''Q''                                                               '+  //사업총괄부문
                  '             AND paycl IN (''10'',''20'')                                                                   '+
                  '             AND payra <> ''2C''                                                                            '+
                  '             GROUP BY SUBSTR(deptcode,1,2) ) totcnt                                                         '+
                  '     FROM pehevhis a                                                                                        '+
                  '     WHERE a.rabasyear = :rabasyear                                                                         '+
                  '     AND SUBSTR(a.deptcode,1,1) = ''Q''                                                                     '+  //사업총괄부문
                  '     AND paycl IN (''10'',''20'')                                                                           '+
                  '     AND a.payra <> ''2C''                                                                                  '+
                  '  )                                                                                                         ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //29. 순위와 최종등급을 업데이트 한다.
          29: begin
                Sql.Text :=
                  'UPDATE pehevhis a                           '+
                  'SET (finalgrade, rank) =                    '+
                  '       ( SELECT b.finalgrade, b.rank        '+
                  '         FROM TMP_TEAMGUBUN3 b              '+
                  '         WHERE a.empno = b.empno            '+
                  '         AND      a.rabasyear = :rabasyear  '+
                  '       )                                    '+
                  'WHERE a.rabasyear = :rabasyear              ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //30. 평가이력에 휴직테이블 근거 근속제외일수, 근속제외내용 update  << 부장이 아니고, 공상휴직이 아닌경우 빼줌.
          30: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET ( exdudays,                                                                                                     '+
                  '                        exdudesc,                                                                                                     '+
		  '			   exfrdate,                                                                                                     '+
		  '			   extodate ) =                                                                                                  '+
                  '( SELECT SUM(DECODE( SIGN(2005 - TO_NUMBER(SUBSTR(exfrdate,1,4))),                                                                    '+
		  '                     +1, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '                                 -1, TO_DATE(''20071231'',''yyyymmdd'') - TO_DATE(''20070101'',''yyyymmdd'') + 1 ,                    '+
		  '                                  0, TO_DATE(NVL(extodate, ''20071231'') ,''yyyymmdd'') -   TO_DATE(''20070101'',''yyyymmdd'') + 1),  '+
		  '                      0, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '		                    -1, TO_DATE(''20071231'',''yyyymmdd'') - TO_DATE(exfrdate,''yyyymmdd'') + 1,                         '+
		  '		                     0, TO_DATE(NVL(extodate, ''20071231'') ,''yyyymmdd'') - TO_DATE(exfrdate,''yyyymmdd'') + 1))),      '+
                  '         MIN(DECODE( SIGN(2005 - TO_NUMBER(SUBSTR(exfrdate,1,4))),                                                                    '+
	          '                     +1, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '	                            -1, codename ,                                                                                       '+
		  '	                             0, codename),                                                                                       '+
                  '    	                 0,DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                      '+
		  '	                            -1, codename,                                                                                        '+
		  '	                             0, codename ))),                                                                                    '+
		  '	    MIN(DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(exfrdate,1,4))),                                                                    '+
		  '	                +1, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '	                            -1, TO_DATE(''20070101'',''yyyymmdd'') ,                                                             '+
		  '	                             0, TO_DATE(''20070101'',''yyyymmdd'') ),                                                            '+
		  '	                 0, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '	                            -1, TO_DATE(exfrdate,''yyyymmdd'') ,                                                                 '+
		  '	                             0, TO_DATE(exfrdate,''yyyymmdd'') )))  ,                                                            '+
		  '	    MIN(DECODE( SIGN(2005 - TO_NUMBER(SUBSTR(exfrdate,1,4))),                                                                    '+
		  '	                +1, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '	                            -1, TO_DATE(''20071231'',''yyyymmdd'') ,                                                             '+
		  '	                             0, TO_DATE(NVL(extodate, ''20071231'') ,''yyyymmdd'')) ,                                            '+
		  '	                 0, DECODE( SIGN(2007 - TO_NUMBER(SUBSTR(NVL(extodate, ''20071231''),1,4))),                                     '+
		  '	                            -1, TO_DATE(''20071231'',''yyyymmdd'') ,                                                             '+
		  '	                             0, TO_DATE(NVL(extodate, ''20071231'') ,''yyyymmdd''))))                                            '+
		  'FROM pihexdu b, pyccode c                                                                                                             '+
                  'WHERE a.empno = b.empno                                                                                                               '+
                  'AND b.excode <> ''71''                                                                                                                '+
                  'AND c.codeid =''I310''                                                                                                                '+
                  'AND b.excode = c.codeno                                                                                                               '+
                  'GROUP BY b.empno  )                                                                                                                   '+
                  'WHERE rabasyear = :rabasyear                                                                                                          '+
                  'AND paycl <> ''10''                                                                                                                   ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //31. 평가이력에 승격테이블 근거 근속제외일수, 근속제외내용 update  <<<  올해 입사자에 대해 근속제외일수를 계산해서 더해줌.�
          31: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET (exdudays,                                                   '+
		  '			  exfrdate,                                                   '+
		  '			  extodate                                                    '+
                  '                       ) =                                                         '+
                  '       (SELECT NVL(exdudays,0) + TO_DATE(b.paycldate) - TO_DATE(''20070101''),     '+
		  '	          TO_DATE(''20070101''),                                              '+
		  '	          TO_DATE(b.paycldate)                                                '+
                  '        FROM pimupmas b                                                            '+
                  '        WHERE b.rabasdate = :p_rabasdate                                           '+
                  '        AND b.paycldate >= ''20070101''                                            '+
                  '        AND a.empno = b.empno )                                                    '+
                  'WHERE rabasyear = :rabasyear                                                       '+
                  'AND paycl <> ''10''                                                                '+
                  'AND empno IN (SELECT empno                                                         '+
                  '              FROM   pimupmas                                                      '+
                  '              WHERE rabasdate = :p_rabasdate                                       '+
                  '              AND   paycldate >= ''20070101'')                                     ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //32. 최종등급으로 평점을 계산한다.
          //승격점수조회 프로그램에서 finalscr <= 0 데이터 최종등급, 평점을 null값 보여주도록 함. 20051118
          //근속제외 기간에 따른 점수를 일괄계산하지 않고 그냥 등급대로 다 주기로 함. 그래서 위에 식 2개를 쓰지 않음.
          32: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET a.upscore = DECODE(a.finalgrade,''S'', 100,   '+
                  '                                                      ''A'',  90,   '+
		  '		    		                       	 ''B+'', 85,   '+
		  '					                 ''B'',  80,   '+
		  '						         ''B-'', 75,   '+
		  '						         ''C'',  70,   '+
		  '						         ''D'',  60,   '+
		  '							         80 )  '+  //최종평가등급 미획득시 B등급을 줌.
		  '								       '+				                  
                  'WHERE a.rabasyear = :rabasyear                                      '+
                  'AND a.finalscr > 0                                                  '+  //최종점수가 없는 경우 제외. 밑에서 종합평점 계산시 제외하고 계산함.
                  'AND EXISTS (SELECT *                                                '+
                  '            FROM pimpmas b                                          '+
                  '            WHERE a.empno = b.empno                                 '+
                  '            AND b.paycl BETWEEN :payclfr AND :payclto               '+
                  '            AND b.pstate < ''80''                                   '+
                  '            AND b.empdate < ''20050101''                            '+   //올해년도 신규입사자 제외(올해 입사자는 승격점수 없음.)
                  '            AND a.rabasyear = :rabasyear)                           ';

                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;

          //33. 공상휴직을 제외한 휴직자중 최종 평가등급 미획득자 또는 신규입사자는 승격점수 없음.
          33: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET a.upscore = 0                                                                 '+
                  'WHERE a.rabasyear = :rabasyear                                                                      '+
                  'AND EXISTS (SELECT *                                                                                '+
                  '            FROM pimpmas b                                                                          '+
                  '            WHERE a.empno = b.empno                                                                 '+
                  '            AND a.rabasyear = :rabasyear                                                            '+
		  '	       AND b.paycl BETWEEN :payclfr AND :payclto                                               '+
                  '            AND b.pstate < ''80''                                                                   '+
		  '	       AND ( (b.empdate >= ''20070101'') OR (a.finalgrade IS NULL AND NVL(a.exdudays,0) > 0) ) '+
		  '	      )                                                                                        ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;

          //34. 승격포인트 입력 (신규입사자가 아닌경우)
          //승격점수조회 프로그램에서 finalscr <= 0 데이터 승격포인터를 null값 보여주도록 함. 20051118
          //평가이력에 승격포인트 재급기준일 기준 update  <<최종점수가 0 이거나 최종등급이 없을경우에 B등급으로 일할계산
          34: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET uppoint =                                                                            '+
                  '          DECODE(SIGN(finalscr), 1, DECODE(finalgrade,''S'', ROUND(10 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                                                      ''A'', ROUND( 7 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                     				 ''B+'',ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                                                      ''B'', ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                                          	    	 ''B-'',ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                                                      ''C'', ROUND( 5 * (365 - NVL(exdudays,0)) / 365,2),  '+
                  '                                                      ''D'', ROUND( 4 * (365 - NVL(exdudays,0)) / 365,2),  '+
		  '				                                ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2) ),'+
		  '		         	       ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2)                            '+
		  '		   )                                                                                          '+
                  'WHERE a.rabasyear = :rabasyear                                                                             '+
                  'AND NOT EXISTS (SELECT *                                                                                   '+
                  '                FROM pimpmas b                                                                             '+
                  '                WHERE a.empno = b.empno                                                                    '+
                  '                AND b.paycl BETWEEN :payclfr AND :payclto                                                  '+
                  '                AND b.pstate < ''80''                                                                      '+
                  '                AND b.empdate >= ''20050101''                                                              '+
                  '                AND a.rabasyear = :rabasyear)                                                              ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;

          //35. 승격포인트 입력 (신규입사자일 경우)
          35: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET uppoint = ROUND( 6 * (365 - NVL(exdudays,0)) / 365,2)        '+
                  'WHERE a.rabasyear = :rabasyear                                                     '+
                  'AND EXISTS (SELECT *                                                               '+
                  '            FROM pimpmas b                                                         '+
                  '            WHERE a.empno = b.empno                                                '+
                  '            AND b.paycl BETWEEN :payclfr AND :payclto                              '+
                  '            AND b.pstate < ''80''                                                  '+
                  '            AND b.empdate >= ''20070101''                                          '+
                  '	       AND a.rabasyear =:rabasyear)                                           ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
              end;


        end; // end of case

        St_Help.Panels[0].Text := '';
        St_Help.Panels[0].Text := mProgress;
        Application.ProcessMessages;

      TRY
       // Edit1.Text := Dm.Q_Main.sql.Text;
        Dm.Q_Sub.ExecSQL;

        Result := True;
      EXCEPT
        begin
          Showmessage('다음의 작업을 실행하는 도중 오류가 발생하였습니다.'+#13+#10+
                      '[ '+mProgress+' ]');
        end;
      END;
    end;
end;


function TMainForm.fnBatchCalc: Boolean;
var
  sProgress  : String;
begin
    result := False;
{
    sProgress := '...11 평가이력에 하반기 업적점수 데이터 삭제';
    if not fnCalcsql(11, sProgress) then System.Exit;
    Gr.position := 5;

    sProgress := '...12 평가이력에 하반기 업적점수 데이터 입력';
    if not fnCalcsql(12, sProgress) then System.Exit;

    sProgress := '...13 하반기 업적점수 업데이트';
    if not fnCalcsql(13, sProgress) then System.Exit;
    Gr.position := 10;

    sProgress := '...14 조직유형별 평가자 임시테이블 삭제';
    if not fnCalcsql(14, sProgress) then System.Exit;

    sProgress := '...15 조직유형별 평가자 임시테이블 입력';
    if not fnCalcsql(15, sProgress) then System.Exit;

    sProgress := '...16 조직유형별 역량점수 삭제';
    if not fnCalcsql(16, sProgress) then System.Exit;

    sProgress := '...17 조직유형별 역량점수 입력';
    if not fnCalcsql(17, sProgress) then System.Exit;
    Gr.position := 15;

    sProgress := '...18 평가이력에 하반기 업량점수 update';
    if not fnCalcsql(18, sProgress) then System.Exit;

    sProgress := '...19 업적과 역량에 대한 최종점수를 구한다.';
    if not fnCalcsql(19, sProgress) then System.Exit;
    Gr.position := 20;

    sProgress := '...20 과장 / 대리,사원  평가집단 분류 테이블1 삭제.';
    if not fnCalcsql(20, sProgress) then System.Exit;

    sProgress := '...21 과장 / 대리,사원  평가집단 분류.';
    if not fnCalcsql(21, sProgress) then System.Exit;
    Gr.position := 25;

    sProgress := '...22 과장 / 대리,사원  평가집단 분류 테이블2 삭제.';
    if not fnCalcsql(22, sProgress) then System.Exit;

    sProgress := '...23 대리~사원 조회시 팀의 인원수가 10명 이하면 과장~사원까지 rank를 포함시킴.';
    if not fnCalcsql(23, sProgress) then System.Exit;
    Gr.position := 30;

    sProgress := '...24 최종등급과 최종순위 데이터 초기화.';
    if not fnCalcsql(24, sProgress) then System.Exit;

    sProgress := '...25 최종등급과 최종순위를 집계(지사소속이 아닌 과장이하).';
    if not fnCalcsql(25, sProgress) then System.Exit;

    sProgress := '...26 최종등급과 최종순위를 집계(지사소속인 과장이하).';
    if not fnCalcsql(26, sProgress) then System.Exit;
    Gr.position := 35;

    sProgress := '...27 최종등급과 최종순위를 집계(팀장).';
    if not fnCalcsql(27, sProgress) then System.Exit;

    sProgress := '...28 최종등급과 최종순위를 집계(비보임 차부장).';
    if not fnCalcsql(28, sProgress) then System.Exit;

    sProgress := '...29 순위와 최종등급을 업데이트 한다.';
    if not fnCalcsql(29, sProgress) then System.Exit;
    Gr.position := 40;

    sProgress := '...30 평가이력에 휴직테이블 근거 근속제외일수, 근속제외내용 update.';
    if not fnCalcsql(30, sProgress) then System.Exit;

    sProgress := '...31 올해 입사자 평가이력에 휴직테이블 근거 근속제외일수, 근속제외내용 update.';
    if not fnCalcsql(31, sProgress) then System.Exit;

    sProgress := '...32 최종등급으로 평점을 계산한다.';
    if not fnCalcsql(32, sProgress) then System.Exit;
    Gr.position := 45;

    sProgress := '...33 공상휴직을 제외한 휴직자중 최종 평가등급 미획득자 또는 신규입사자는 승격점수 0으로 update.';
    if not fnCalcsql(33, sProgress) then System.Exit;

    sProgress := '...34 승격포인트 입력 (신규입사자가 아닌경우).';
    if not fnCalcsql(34, sProgress) then System.Exit;

    sProgress := '...35 승격포인트 입력 (신규입사자일 경우).';
    if not fnCalcsql(35, sProgress) then System.Exit;
    Gr.position := 50;
                          }
    Result := True;
end;

function TMainForm.fnBatchPimupmas: Boolean;
var
  sProgress  : String;
begin
{    result := False;

    sProgress := '...0 승격마스터 데이터 삭제';
    if not fnExecsql(0, sProgress) then System.Exit;
    Gr.position := 5;

    sProgress := '...1 승격마스터 데이터 추출';
    if not fnExecsql(1, sProgress) then System.Exit;
    Gr.position := 10;

    sProgress := '...2 직급일이 2005년도 보다 작고, 승격 한번도 안한 사원들 직급일 수정';
    if not fnExecsql(2, sProgress) then System.Exit;
    Gr.position := 20;

    sProgress := '...3 직급일이 2005년도 보다 크고, 승격 한번도 안한 사원들 직급일 수정';
    if not fnExecsql(3, sProgress) then System.Exit;
    Gr.position := 30;

    sProgress := '...4 직급일이 2005년도 보다 작고, 승격 한번도 안한 경력자 직급일 수정';
    if not fnExecsql(4, sProgress) then System.Exit;
    Gr.position := 40;

    sProgress := '...5 직급일이 2005년도 보다 크고, 승격 한번도 안한 경력자 직급일 수정';
    if not fnExecsql(5, sProgress) then System.Exit;
    Gr.position := 50;

    sProgress := '...6 기존 승격자들 수정';
    if not fnExecsql(6, sProgress) then System.Exit;
    Gr.position := 60;

    sProgress := '...7 휴직이 없는 사원들 승격마스터(PIMUPMAS)에 재급기간 update';
    if not fnExecsql(7, sProgress) then System.Exit;
    Gr.position := 70;

    sProgress := '...8 휴직이 있는 사원들 승격마스터(PIMUPMAS)에 재급기간 update';
    if not fnExecsql(8, sProgress) then System.Exit;
    Gr.position := 80;

    sProgress := '...9 승격마스터 데이터 삭제';
    if not fnExecsql(9, sProgress) then System.Exit;
    Gr.position := 90;

    sProgress := '...10 승격 종합 점수 입력';
    if not fnExecsql(10, sProgress) then System.Exit;
    Gr.position := 100;

    Result := True;      }
end;


function TMainForm.fnBatchCalc_2: Boolean;
var
  sProgress  : String;
begin
    result := False;
        {
    sProgress := '...36 하반기 평가점수가 없는사람중 당해년도 퇴사자는 서열에서 빠짐';
    if not fnCalcsql_2(36, sProgress) then System.Exit;

    sProgress := '...37 하반기 평가점수가 없는사람중 퇴사자가 아닌 휴직자의 경우 다음해에도 평가점수가 없는 경우 서열에서 빠짐';
    if not fnCalcsql_2(37, sProgress) then System.Exit;
    Gr.position := 55;

    sProgress := '...38 재급기간 계산후 원상복귀';
    if not fnCalcsql_2(38, sProgress) then System.Exit;
    Gr.position := 65;

    sProgress := '...39 재급기간내 승격포인트 합 update';
    if not fnCalcsql_2(39, sProgress) then System.Exit;

    sProgress := '...40 교육포인트 update';
    if not fnCalcsql_2(40, sProgress) then System.Exit;
    Gr.position := 70;

    sProgress := '...41 승격포인트, 교육포인트, 전환배치요건 충족여부 초기화';
    if not fnCalcsql_2(41, sProgress) then System.Exit;

    sProgress := '...42 승격포인트 충족여부';
    if not fnCalcsql_2(42, sProgress) then System.Exit;
    Gr.position := 75;

    sProgress := '...43 교육포인트 충족여부';
    if not fnCalcsql_2(43, sProgress) then System.Exit;

    sProgress := '...44 경력입사자중 승격을 한번도 안했을 경우 입사일로 부터 평점계산';
    if not fnCalcsql_2(44, sProgress) then System.Exit;

    sProgress := '...45 경력입사자가 아니거나 승격을 했을 경우 직급일로 부터 평점계산';
    if not fnCalcsql_2(45, sProgress) then System.Exit;
    Gr.position := 80;

    sProgress := '...46 모든 년도의 최종점수가 0일경우 B등급인 80점 처리.';
    if not fnCalcsql_2(46, sProgress) then System.Exit;

    sProgress := '...47 재급점수 update.';
    if not fnCalcsql_2(47, sProgress) then System.Exit;
    Gr.position := 85;

    sProgress := '...48 재급기간점수 update.';
    if not fnCalcsql_2(48, sProgress) then System.Exit;

    sProgress := '...49 포상점수 update.';
    if not fnCalcsql_2(49, sProgress) then System.Exit;
    Gr.position := 90;

    sProgress := '...50 제안점수 update.';
    if not fnCalcsql_2(50, sProgress) then System.Exit;

    sProgress := '...51 최근 2년 승격포인트 update.';
    if not fnCalcsql_2(51, sProgress) then System.Exit;
    Gr.position := 95;

    sProgress := '...52 승격대상여부 선정.';
    if not fnCalcsql_2(52, sProgress) then System.Exit;

    sProgress := '...53 승격대상 제외내역 최근 2년 연속 최종평가등급 D 등급자는 당해년도 승격제외.(사원만)';
    if not fnCalcsql_2(53, sProgress) then System.Exit;

    sProgress := '...54 승격대상 제외내역 최근 3년 견책2회, 감봉~정직 1회이상 당해년도 승격제외.(사원만)';
    if not fnCalcsql_2(54, sProgress) then System.Exit;
    Gr.position := 100;
             }
    result := True;

end;

function TMainForm.fnCalcsql_2(mBatchCnt: Integer; mProgress: String): Boolean;
begin
    result := False;

    with Dm.Q_Exec do
    begin
        Close;
        Sql.Clear;
        case mBatchCnt of
          //36. 하반기 평가점수가 없는사람중 당해년도 퇴사자는 서열에서 빠짐
          36: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET  a.rankinyn =''N''             '+
                  'WHERE a.paycl <> ''10''                              '+
                  'AND a.rabasyear = :rabasyear                         '+
                  'AND a.rabasyear = (SELECT SUBSTR(b.retdate,1,4)      '+
                  '                   FROM pimpmas b                    '+
		  '	              WHERE b.empno = a.empno           '+
		  '	      	      AND      a.rabasyear = :rabasyear '+
		  '		      )                                 ';
                 ParambyName('rabasyear').AsString       := sg_rabasyear;
               end;

          //37. 하반기 평가점수가 없는사람중 퇴사자가 아닌 휴직자의 경우 다음해에도 평가점수가 없는 경우 서열에서 빠짐
          37: begin
                Sql.Text :=
                  'UPDATE pehevhis a SET  a.rankinyn = ''N''           '+
                  'WHERE a.paycl <> ''10''                             '+
                  'AND a.rabasyear = :rabasyear                        '+
                  'AND a.empno IN (SELECT b.empno                      '+
                  '                FROM pehevhis b                     '+
		  '	           WHERE b.rabasyear = a.rabasyear + 1 '+
		  '	           AND b.empno = a.empno               '+
		  '	    	   AND a.rabasyear = :rabasyear        '+
		  '		   )                                   ';
                 ParambyName('rabasyear').AsString       := sg_rabasyear;
               end;

          //38. 재급기간 계산후 원상복귀
          38: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET paycldate =                           '+
                  '                ( SELECT paycldate                          '+
                  '                  FROM pimpmas                              '+
                  '                  WHERE paycl BETWEEN :payclfr AND :payclto '+
                  '                  AND pstate < ''80''                       '+
                  '                  AND paycldate IS NOT NULL                 '+
		  '         	     AND empno = a.empno )                     '+
                  'WHERE empno IN ( SELECT empno FROM pimpmas                  '+
                  '                 WHERE paycl BETWEEN :payclfr AND :payclto  '+
                  '                   AND pstate < ''80''                      '+
                  '                   AND paycldate IS NOT NULL)               '+
                  '  AND rabasdate = :p_rabasdate                              ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //39. 재급기간내 승격포인트 합 update
          39: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET uppoint = ( SELECT SUM(NVL(b.uppoint,0))                    '+
                  '                                  FROM pehevhis b                                 '+
		  '  	                             WHERE a.empno = b.empno                         '+
		  '				     AND a.rabasdate = :p_rabasdate                  '+
                  '                                  AND b.rabasyear BETWEEN SUBSTR(a.paycldate,1,4) '+
                  '                                                  AND :rabasyear                  '+
		  '				   )                                                 '+
                  'WHERE rabasdate = :p_rabasdate                                                    ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //40. 교육포인트 update
          //2005년도에는 교육포인트 계산안함. 충족조건으로 승격여부 체크 안함.
          40: begin
                Sql.Text :=
                  'UPDATE pimupmas                     '+
                  'SET edupoint = 0                    '+
                  'WHERE rabasdate = :p_rabasdate      ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //41. 승격포인트, 교육포인트, 전환배치요건 충족여부 초기화
          41: begin
                Sql.Text :=
                  'UPDATE pimupmas SET uppointyn = ''N'',   '+
                  '                    edupointyn = ''N'',  '+
		  '                    shiftyn = ''N'',     '+
		  ' 		       upyn = ''N''         '+
                  'WHERE rabasdate = :p_rabasdate           ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //42. 승격포인트 충족여부
          42: begin
                Sql.Text :=
                  'UPDATE pimupmas SET uppointyn = ''Y''                            '+
                  'WHERE empno IN ( SELECT a.empno                                  '+
                  '                 FROM pimupmas a, pimupbas b                     '+
                  '                 WHERE b.upkind = ''직급별승격포인트_재급년한''  '+
             	  '	     	    AND a.rabasdate = b.rabasdate                   '+
                  '                 AND a.paycl = b.upcodeno                        '+
                  '                 AND a.uppoint >= b.value1                       '+
             	  '		    AND a.rabasdate = :p_rabasdate                  '+
		  '		  )                                                 '+
                  'AND rabasdate = :p_rabasdate                                     ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //43. 교육포인트 충족여부	<< 2005년도에는 교육포인트 계산안함.
          43: begin
                Sql.Text :=
                  'UPDATE pimupmas SET edupointyn = ''Y''     '+
                  'WHERE empno IN ( SELECT empno              '+
                  '                 FROM pimupmas             '+
                //  '	    	      --WHERE edupoint >= 10    '+
		  '		   )                          '+
                  'AND rabasdate = :p_rabasdate               ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //44. 경력입사자중 승격을 한번도 안했을 경우 입사일로 부터 평점계산. 나머지는 직급일로 부터 평점계산
          //    부장승격의 경우 최근 4년, 차장승격의 경우 최근 5년 나머지는 전체 입사일로 부터의 평균점수
          //최종평가등급이 없을 경우 B등급에 해당하는 80을 줌.
          //이런경우 문제 발생. '0737' 사번일 경우 1999년도 데이터까지 포함하기에 근속제외기간으로 점수가 20.1밖에 안나옴. 평균을 내면 많이 적게 받음.
          //그래서 근속제외 기간을 계산 안하고 등급 일괄계산으로 바꿈.
          44: begin
                Sql.Text :=
                  'UPDATE pimupmas a                                                                                 '+
                  'SET a.totscr = ( SELECT ROUND(SUM(DECODE(b.upscore,NULL,80, b.upscore))/NVL(COUNT(1),1000000), 1) '+
                  '                 FROM  pehevhis b, pimpmas c                                                      '+
                  '                 WHERE a.empno = b.empno                                                          '+
		  '                 AND   a.empno = c.empno                                                          '+
                  '                 AND   a.rabasdate = :p_rabasdate                                                 '+
                  '                 AND   b.rabasyear BETWEEN CASE WHEN c.paycl = ''20'' THEN GREATEST(SUBSTR(c.empdate,1,4),TO_CHAR(TO_NUMBER(:rabasyear)-3)) '+
		  '	                                           WHEN c.paycl = ''22'' THEN GREATEST(SUBSTR(c.empdate,1,4),TO_CHAR(TO_NUMBER(:rabasyear)-4)) '+
		  '			   	                   ELSE  SUBSTR(c.empdate,1,4)                       '+
		  '	                                      END                                                    '+
		  '				      AND :rabasyear                                                 '+
		  '                 AND   NVL(b.finalscr,0) > 0                                                      '+  //최종점수가 0인것 계산에서 제외.
		  '                 AND   b.finalgrade IS NOT NULL                                                   '+  //최종평가등급이 있는 경우만
		  '                 AND   c.cardate IS NOT NULL                                                      '+  //경력일
		  '                 AND   c.cpaycldate IS NULL                                                       '+  //승격일
                  '                 AND   c.paycl BETWEEN :payclfr AND :payclto                                      '+
                  '                 AND   c.pstate < ''80''                                                          '+
                  '                 AND   c.paycldate IS NOT NULL                                                    '+
                  '                 GROUP BY a.empno                                                                 '+
		  '		   )                                                                                 '+
                  'WHERE a.rabasdate = :p_rabasdate                                                                  '+
                  'AND EXISTS ( SELECT * FROM pimpmas                                                                '+
                  '                      WHERE a.empno = empno                                                       '+
                  '                      AND   cardate IS NOT NULL                                                   '+  //경력일
                  '                      AND   cpaycldate IS NULL                                                    '+  //승격일
                  '                      AND   paycl BETWEEN :payclfr AND :payclto                                   '+
                  '                      AND   pstate < ''80''                                                       '+
                  '                      AND   paycldate IS NOT NULL )                                               ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //45. 경력입사자가 아니거나  승격을 했을 경우 직급일로 부터 평점계산.
          //    부장승격의 경우 최근 4년, 차장승격의 경우 최근 5년 나머지는 전체 재급기간의 평균점수
          //최종평가등급이 없을 경우 B등급에 해당하는 80을 줌.
          //근속제외 기간을 계산 안하고 등급 일괄계산으로 바꿈.
          45: begin
                Sql.Text :=
                  'UPDATE pimupmas a                                                                                  '+
                  'SET a.totscr = ( SELECT ROUND(SUM(DECODE(b.upscore,NULL,80, b.upscore))/NVL(COUNT(1),1000000), 1)  '+
                  '                 FROM  pehevhis b, pimpmas c                                                       '+
                  '                 WHERE a.empno = b.empno                                                           '+
		  '	            AND   a.empno = c.empno                                                           '+
                  '                 AND   a.rabasdate = :p_rabasdate                                                  '+
                  '                 AND   b.rabasyear BETWEEN CASE WHEN c.paycl = ''20'' THEN GREATEST(SUBSTR(c.paycldate,1,4),TO_CHAR(TO_NUMBER(:rabasyear)-3)) '+
		  '	                                           WHEN c.paycl = ''22'' THEN GREATEST(SUBSTR(c.paycldate,1,4),TO_CHAR(TO_NUMBER(:rabasyear)-4)) '+
		  '			   	                   ELSE  SUBSTR(c.paycldate,1,4)                      '+
		  '	                                      END                                                     '+
		  '				      AND :rabasyear                                                  '+
		  '	            AND   NVL(b.finalscr,0) > 0                                                       '+  //최종점수가 0인것 계산에서 제외.
		  '	            AND   b.finalgrade IS NOT NULL                                                    '+  //최종평가등급이 있는 경우만
                  '                 AND   ((c.cardate IS NULL) OR (c.cpaycldate IS NOT NULL))                         '+
                  '                 AND   c.paycl BETWEEN :payclfr AND :payclto                                       '+
                  '                 AND   c.pstate < ''80''                                                           '+
                  '                 AND   c.paycldate IS NOT NULL                                                     '+
                  '                 GROUP BY a.empno                                                                  '+
		  '			  )                                                                           '+
                  'WHERE a.rabasdate = :p_rabasdate                                                                   '+
                  'AND EXISTS ( SELECT * FROM pimpmas                                                                 '+
                  '             WHERE a.empno = empno                                                                 '+
                  '             AND   ((cardate IS NULL) OR (cpaycldate IS NOT NULL))                                 '+
                  '             AND   paycl BETWEEN :payclfr AND :payclto                                             '+
                  '             AND   pstate < ''80''                                                                 '+
                  '             AND   paycldate IS NOT NULL )                                                         ';
                ParambyName('rabasyear').AsString       := sg_rabasyear;
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //46. 만약, 모든 년도의 최종점수가 0일경우 'B'등급인 80점을 줄것.
          //올해 신규입사자는 제외. 신규입사자는 0점임. 경력을 인정받아 올해 입사한 사람이 승격하는 경우를 막기위해
          46: begin
                Sql.Text :=
                  'UPDATE pimupmas a                                       '+
                  'SET a.totscr =  80                                      '+
                  'WHERE a.rabasdate = :p_rabasdate                        '+
                  'AND NVL(a.totscr,0) = 0                                 '+
                  'AND EXISTS (SELECT *                                    '+
                  '            FROM pimpmas b                              '+
                  '            WHERE a.empno = b.empno                     '+
                  '            AND b.paycl BETWEEN :payclfr AND :payclto   '+
                  '            AND b.pstate < ''80''                       '+
                  '            AND b.empdate < ''20070101''                '+  //올해년도 신규입사자 제외
                  '            AND a.rabasdate = :p_rabasdate)             ';
                ParambyName('payclfr').AsString         := sg_payclfr;
                ParambyName('payclto').AsString         := sg_payclto;
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //47. 재급점수 Update
          47: begin
                Sql.Text :=
                  'UPDATE pimupmas SET payclscr =                                              '+
                  '        DECODE(paycl, ''22'', CASE WHEN payclyy >= 6 THEN 3 ELSE 0 END,     '+
                  '                      ''32'', CASE WHEN payclyy =  4 THEN 5                 '+
		  '                                   WHEN payclyy >= 5 THEN 10 ELSE 0 END,    '+
                  '               	 ''40'', CASE WHEN payclyy =  4 THEN 5                 '+
                  '                                   WHEN payclyy >= 5 THEN 10 ELSE 0 END,    '+
                  '                      ''42'', CASE WHEN payclyy =  6 THEN 5                 '+
                  '                  	              WHEN payclyy >= 7 THEN 10 ELSE 0 END,    '+
                  '                      ''44'', CASE WHEN payclyy =  8 THEN 5                 '+
                  '                  	              WHEN payclyy >= 9 THEN 10 ELSE 0 END, 0) '+
                  'WHERE rabasdate = :p_rabasdate                                              ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //48. 재급기간점수 update.
          48: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET qpayclscr                                                 '+
                  '      = (SELECT DECODE(a.payclyy, b.value2,                                     '+
                  '                                     DECODE(SIGN( 3-a.payclmm),+1,0,            '+
		  '				        DECODE(SIGN( 6-a.payclmm),+1,1,            '+
		  '				        DECODE(SIGN( 9-a.payclmm),+1,2,            '+
		  '				        DECODE(SIGN(12-a.payclmm),+1,3)))),        '+
                  '                                  b.value2+1,                                   '+
                  '                                     DECODE(SIGN( 3-a.payclmm),+1,4,            '+
		  '				        DECODE(SIGN( 6-a.payclmm),+1,5,            '+
		  '				        DECODE(SIGN( 9-a.payclmm),+1,6,            '+
		  '				        DECODE(SIGN(12-a.payclmm),+1,7)))),        '+
                  '                    		     DECODE(SIGN(a.payclyy -(b.value2+1)),+1,8,0)) '+
                  '          FROM pimupbas b                                                       '+
                  '          WHERE a.rabasdate  = b.rabasdate                                      '+
                  '          AND b.upkind = ''직급별승격포인트_재급년한''                          '+
                  '          AND a.rabasdate = :p_rabasdate                                        '+
                  '          AND a.paycl = b.upcodeno)                                             '+
                  'WHERE rabasdate = :p_rabasdate                                                  ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //49. 포상점수 update.
          49: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET prizescr =                                      '+
                  '                  ( SELECT SUM(NVL(repoint,0))                        '+
                  '                    FROM pimrewa                                      '+
                  '                    WHERE empno = a.empno                             '+
                  '                    AND redate BETWEEN a.paycldate AND :p_rabasdate   '+
                  '                    AND rerayn = ''Y'')                               '+
                  'WHERE a.rabasdate = :p_rabasdate                                      ';
                 ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //50. 제안점수 update.
          50: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET suggscr =                                         '+
                  '                  ( SELECT SUM(NVL(proscore,0))                         '+
                  '                    FROM pimramas                                       '+
                  '                    WHERE empno = a.empno                               '+
                  '                    AND rabasdate BETWEEN a.paycldate AND :p_rabasdate) '+
                  'WHERE a.rabasdate = :p_rabasdate                                        ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //51. 최근 2년 승격포인트 update.
          51: begin
                Sql.Text :=
                  'UPDATE pimupmas a SET uppoint_2year =                                        '+
                  '                  ( SELECT SUM(NVL(uppoint,0))                               '+
                  '                    FROM pehevhis                                            '+
		  '   	               WHERE empno = a.empno                                    '+
		  '                    AND a.rabasdate = :p_rabasdate                           '+
                  '                    AND rabasyear >=  TO_CHAR( TO_NUMBER(:rabasyear) - 1) )  '+
                  'WHERE rabasdate = :p_rabasdate                                               ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //52. 승격대상여부 선정.
          52: begin
                Sql.Text :=
                  'UPDATE pimupmas a                             '+
                  'SET    a.upyn = ''Y''                         '+
                  'WHERE a.rabasdate = :p_rabasdate              '+
                  'AND   a.paycl BETWEEN ''20'' AND ''44''       '+
                  'AND   a.uppointyn = ''Y''                     '+
                  'AND   a.edupointyn = ''Y''                    ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

          //53. 승격대상 제외내역 최근 2년 연속 최종평가등급 D 등급자는 당해년도 승격제외.(사원만)
          53: begin
                Sql.Text :=
                  'UPDATE pimupmas a                                                           '+
                  'SET upyn = ''N'',                                                           '+
                  '    remark = ''최근 2년 D등급 승격대상제외''                                '+
                  'WHERE a.rabasdate = :p_rabasdate                                            '+
                  'AND      a.paycl BETWEEN ''40'' AND ''44''                                  '+
                  'AND EXISTS ( SELECT * FROM pehevhis b, pehevhis c                           '+
                  '             WHERE a.empno = b.empno                                        '+
                  '             AND   a.empno = c.empno                                        '+
                  '             AND   a.rabasdate = :p_rabasdate                               '+
                  '             AND   b.rabasyear = TO_CHAR(TO_NUMBER(:rabasyear) - 1)         '+
                  '             AND   c.rabasyear = :rabasyear                                 '+
                  '             AND   NVL(b.finalgrade,''B'') = ''D''                          '+
                  '             AND   NVL(c.finalgrade,''B'') = ''D''                          '+
                  '           )                                                                ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
                ParambyName('rabasyear').AsString       := sg_rabasyear;
              end;

          //54. 승격대상 제외내역 최근 3년 견책2회, 감봉~정직 1회이상 당해년도 승격제외.(사원만)
          54: begin
                Sql.Text :=
                  'UPDATE pimupmas a                                                                             '+
                  'SET upyn = ''N'' ,                                                                            '+
                  '    remark = ''최근3년 상벌누적 승격대상제외''                                                '+
                  'WHERE a.rabasdate = :p_rabasdate                                                              '+
                  'AND   a.paycl BETWEEN ''40'' AND ''44''                                                       '+
                  'AND   a.empno IN ( SELECT empno                                                               '+
                  '                   FROM ( SELECT empno, pukind, pukindnm, COUNT(*)                            '+
		  '	                     FROM pimpuni                                                        '+
                  '                          WHERE pudate >= TO_CHAR(ADD_MONTHS(:p_rabasdate,-36),''YYYYMMDD'')  '+
		  '			     AND   pukind IS NOT NULL                                            '+
                  '                          GROUP BY empno, pukind, pukindnm                                    '+
                  '                          HAVING ((DECODE(pukind, ''17'', COUNT(*), 0) >= 2)                  '+
                  '                          OR (DECODE(pukind, ''16'', 0, COUNT(*)) >= 1)                       '+
                  '                          OR (DECODE(pukind, ''14'', 0, COUNT(*)) >= 1))                      '+
                  '                         )                                                                    '+
		  '		     )                                                                           ';
                ParambyName('p_rabasdate').AsString     := sg_rabasdate;
              end;

        end; // end of case

        St_Help.Panels[0].Text := '';
        St_Help.Panels[0].Text := mProgress;
        Application.ProcessMessages;

      TRY
        //Edit1.Text := Dm.Q_Exec.sql.Text;
        Dm.Q_Exec.ExecSQL;

        Result := True;
      EXCEPT
        begin
          Showmessage('다음의 작업을 실행하는 도중 오류가 발생하였습니다.'+#13+#10+
                      '[ '+mProgress+' ]');
        end;
      END;
    end;

end;

function TMainForm.fnAllBatch: Boolean;
var
  sRealYYMMDD: String;
  sProgress  : String;
begin
    Result := False;

    with Dm.Q_Main do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
          'SELECT empno, korname, rapaycl, rajobgun, raobjyn, raexsayu,       '+
          '       minrayearyn, paycldate, raisdate, repclass,                 '+
          '       NVL(payclyy,0)  payclyy,  NVL(payclmm,0) payclmm,           '+
          '       NVL(payscore,0) payscore, NVL(proscore,0) proscore          '+
          '  FROM pimramas                                                    '+
          '  WHERE rabasdate = :p_rabasdate                                   '+
          '  ORDER BY empno                                                   ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        Open;

        ig_CurCount := 0;
        ig_TotCount := RecordCount;

        while not EOF do
        begin
            Inc(ig_CurCount);
            sProgress := '...20.0 초기화';
            fzInitVaribles;

            sv_empno       := FieldByName('empno').AsString;
            sv_korname     := FieldByName('korname').AsString;
            sv_rapaycl     := FieldByName('rapaycl').AsString;
            sv_rajobgun    := FieldByName('rajobgun').AsString;
            sv_raobjyn     := FieldByName('raobjyn').AsString;
            sv_raexsayu    := FieldByName('raexsayu').AsString;
            sv_minrayearyn := FieldByName('minrayearyn').AsString;
            sv_paycldate   := FieldByName('paycldate').AsString;
            sv_raisdate    := FieldByName('raisdate').AsString;
            sv_repclass    := FieldByName('repclass').AsString;
            iv_payclyy     := FieldByName('payclyy').AsInteger;
            iv_payclmm     := FieldByName('payclmm').AsInteger;
            fv_payscore    := FieldByName('payscore').AsFloat;
            fv_proscore    := FieldByName('proscore').AsFloat;

            Dm.Q_Main.Next;
        end;
    end;

    Result := True;
end;

function TMainForm.fnSaveData: Boolean;
begin
    Result := False;

    with DM.Q_Exec do
    begin
        Close;
        Sql.Clear;
        Sql.Text := 'UPDATE pimramas                                          '+
                    'SET raobjyn     = '''+ sv_raobjyn                 +''',  '+
                    '    raexsayu    = '''+ sv_raexsayu                +''',  '+
                    '    totevavg    =   '+ floattostr(fv_totevavg)    +'  ,  '+
                    '    evscore     =   '+ floattostr(fv_evscore)     +'  ,  '+
                    '    payclyy     =   '+ inttostr(iv_payclyy)       +'  ,  '+
                    '    payclmm     =   '+ inttostr(iv_payclmm)       +'  ,  '+
                    '    payscore    =   '+ floattostr(fv_payscore)    +'  ,  '+
                    '    eduscore    =   '+ floattostr(fv_eduscore)    +'  ,  '+
                    '    forgetscr   =   '+ floattostr(fv_forgetscr)   +'  ,  '+
                    '    forscore    =   '+ floattostr(fv_forscore)    +'  ,  '+
                    '    orgrewscore =   '+ floattostr(fv_orgrewscore) +'  ,  '+
                    '    rewscore    =   '+ floattostr(fv_rewscore)    +'  ,  '+
                    '    etcscore1   =   '+ floattostr(fv_repscore)    +'  ,  '+
                    '    raisscore   =   '+ floattostr(fv_raisscore)   +'  ,  '+
                    '    minrayearyn = '''+ sv_minrayearyn             +'''   '+
                    '  WHERE rabasdate = :p_rabasdate                         '+
                    '    AND empno = :p_empno                                 ';
        ParamByName('p_rabasdate').AsString := sg_rabasdate;
        ParamByName('p_empno').AsString     := sv_empno;

      TRY
        ExecSql;
        Result := True;
      EXCEPT
        on E : EDataBaseError do
        begin
            MessageBox(0,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
            Halt(1);
        end;
      END;
    end;
end;

function TMainForm.fnSetDudays(mQuery: TQuery; mEmpno, mFrdate, mTodate: String): String;
var
  sDutyYYMMDD : String;
  sCalcFrdate, sCalcTodate: String;
  sCalcYYMMDD : String;

  Dutyyy, Dutymm, Dutydd: Integer;

  iCalcyy,  iCalcmm,  iCalcdd : Integer;
  iTotExmm, iTotExdd, iTotExyy: Integer;

  iExyy,    iExmm,    iExdd    : Integer;
  iRealyy,  iRealmm,  iRealdd  : Integer;
  iCarryoff  : ShortInt;
begin
    Result := '000000'; //초기값

    // 초기화
    Dutyyy  := 0;  Dutymm  := 0;  Dutydd  := 0;
    iRealyy := 0;  iRealmm := 0;  iRealdd := 0;
    iExyy   := 0;  iExmm   := 0;  iExdd   := 0;
    iCarryoff  := 0;
    iTotExmm   := 0;  iTotExdd   := 0;  iTotExyy   := 0;
    iCalcyy    := 0;  iCalcmm    := 0;  iCalcdd    := 0;

    sDutyYYMMDD := datelib.DateCal(mFrdate, mTodate);
    dutyyy := strtointdef(copy(sDutyYYMMDD,1,2),0);
    dutymm := strtointdef(copy(sDutyYYMMDD,3,2),0);
    dutydd := strtointdef(copy(sDutyYYMMDD,5,2),0);

    with mQuery do
    begin
        Close;
        SQL.Clear;
        SQL.Text :=
          'SELECT exfrdate, extodate,                                            '+
          '       (TO_DATE(LEAST(extodate,:p_todate),''YYYYMMDD'') + 1           '+
          '         - TO_DATE(GREATEST(exfrdate,:p_frdate),''YYYYMMDD'')) exdays '+
          ' FROM   pihexdu                                                       '+
          ' WHERE  empno = :p_empno                                              '+
          ' ORDER BY exfrdate                                                    ';
        ParamByName('p_empno').AsString  := mEmpno;
        ParamByName('p_frdate').AsString := mFrdate;
        ParamByName('p_todate').AsString := mTodate;
        Open;

        if (EOF and BOF) then
        begin
            Result := FormatFloat('00',Dutyyy) + FormatFloat('00',Dutymm) + FormatFloat('00',Dutydd);
            Close;
            System.Exit;
        end;

        while not EOF do
        begin
            sCalcFrdate := FieldByName('EXFRDATE').AsString ;
            sCalcTodate := FieldByName('EXTODATE').AsString  ;
            // (기산일 fr > 근속제외to )   or (기산일 to < 근속제외fr)*/
            if ((mFrDate > sCalcTodate) or (mTodate < sCalcFrDate)) then
            begin
                mQuery.Next;
                continue;
            end;
            // 기산일 fr > 근속제외fr
            if (mFrDate > sCalcFrdate) then
                sCalcFrDate := mFrDate;
             // 기산일 to < 근속제외to
            if (mToDate < sCalcTodate) then
                sCalcToDate := mToDate;

            sCalcYYMMDD := datelib.DateCal(sCalcFrDate, sCalcToDate);
            iCalcyy := strtoint(copy(sCalcYYMMDD,1,2));
            iCalcmm := strtoint(copy(sCalcYYMMDD,3,2));
            iCalcdd := strtoint(copy(sCalcYYMMDD,5,2));

            iTotExmm := iTotExmm + iCalcmm + (iCalcdd div 30);
            iTotExdd := iTotExdd + (iCalcdd mod 30);
            iTotExyy := iTotExyy + iCalcyy;

            mQuery.Next;
        end;

        Close;
    end;

    iTotExmm := (iTotExmm mod 12) + (iTotExdd div 30);
    iTotExyy := iTotExyy + (iTotExmm div 12);
    iTotExdd := (iTotExdd mod 30);

    if ((Dutydd - iTotExdd) < 0)  then
    begin
        iCarryoff := 1;
        iRealdd   := (30 - iTotExdd) + Dutydd;
    end
    else
    begin
        iRealdd   := Dutydd - iTotExdd;
        iCarryoff := 0;
    end;

    if ((Dutymm - iTotExmm - iCarryoff) < 0) then
    begin
        iRealmm := (12 - iTotExmm) + Dutymm - iCarryoff;
        iCarryoff := 1;
    end
    else
    begin
        iRealmm := Dutymm - iTotExmm - iCarryoff;
        iCarryoff :=0;
    end;

    iRealyy := Dutyyy - iTotExyy - iCarryoff;

    iExyy := iTotExyy;
    iExmm := iTotExmm;
    iExdd := iTotExdd;

    Result := FormatFloat('00',iRealyy) + FormatFloat('00',iRealmm) + FormatFloat('00',iRealdd);
end;


end.
