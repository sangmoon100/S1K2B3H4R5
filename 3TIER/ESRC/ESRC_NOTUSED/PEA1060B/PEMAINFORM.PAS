unit PeMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, TmaxFunc;

type
  TMainForm = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    Pa_Work: TPanel;
    St_Help: TStatusBar;
    Panel1: TPanel;
    Pa_jobgun: TPeJeonLabel;
    Pa_deptcode: TPeJeonLabel;
    Pa_paycl: TPeJeonLabel;
    Pa_payra: TPeJeonLabel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    Ed_empno: TPePanelBtnEdit;
    Nt_Book: TNotebook;
    Panel3: TPanel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Opt: TPeJeonOutLookBtn;
    Bt_Confirm: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Panel2: TPanel;
    Grid2: TDBCtrlGrid;
    Db_Bvalidx: TDBText;
    Db_Bforaim: TDBText;
    Db_Bforweight: TDBText;
    PeJeonLabel8: TPeJeonLabel;
    PeJeonLabel10: TPeJeonLabel;
    PeJeonLabel13: TPeJeonLabel;
    PeJeonLabel14: TPeJeonLabel;
    Pa_empdate: TPeJeonLabel;
    Pa_paycldate: TPeJeonLabel;
    Pa_trdate: TPeJeonLabel;
    Bt_can: TPeJeonOutLookBtn;
    Bt_Detail: TPeJeonOutLookBtn;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Db_Bpropeltask: TDBMemo;
    Db_Bvalfunction: TDBMemo;
    Pa_Le1KorName: TJeonPanel;
    Pa_Le2Payra: TJeonPanel;
    JeonPanel2: TJeonPanel;
    Pa_Le1Payra: TJeonPanel;
    JeonPanel4: TJeonPanel;
    Pa_Le2KorName: TJeonPanel;
    Panel4: TPanel;
    PeJeonLabel2: TPeJeonLabel;
    Bevel10: TBevel;
    PeJeonLabel6: TPeJeonLabel;
    PeJeonLabel7: TPeJeonLabel;
    PeJeonLabel9: TPeJeonLabel;
    PeJeonLabel11: TPeJeonLabel;
    PeJeonLabel12: TPeJeonLabel;
    Grid3: TDBCtrlGrid;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Tgt: TPeJeonOutLookBtn;
    Bt_Dev: TPeJeonOutLookBtn;
    P_Title: TPeJeonGrdPanel;
    DB_Devitem: TDBText;
    DB_Devmethod: TDBText;
    DB_Devaim: TDBText;
    DB_Demand: TDBText;
    DB_seq: TDBText;
    Pa_deptna3: TPeJeonLabel;
    btn_Print: TPeJeonOutLookBtn;
    Eda_weight: TOnNumberEdit;
    sGrid1: TStringGrid;
    DBSet1: TTMaxDataSet;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    DB_ComBas: TTMaxDataSet;
    DB_Chk_Set: TTMaxDataSet;
    DB_PIMPMAS: TTMaxDataSet;
    DBSet10: TTMaxDataSet;
    Label5: TLabel;
    TDml: TTMaxDataSet;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_empnoEnter(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ModClick(Sender: TObject);
    procedure Ed_empnoRightBtnClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Bt_delClick(Sender: TObject);
    procedure Bt_canClick(Sender: TObject);
    procedure Grid2DblClick(Sender: TObject);
    procedure Bt_TgtClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Start    : Boolean;
    pEmpno   : string;  // 로그인 사번
    pKorname : string;  // 로그인 성명
    pPass    : String;
    pClass   : string;  // 로그인 등급
    ComIp    : string;

    Lsysdate   : string;
    Lfordate   : string;
    Lwork      : string;  // 작업자 구분.
    Le2empno   : string;  // 2차 평가자
    Le1korname : string;  // 1차 평가자 성명.
    Le2korname : string;  // 2차 평가자 성명.
    Lebrempno   : string;  // 지점장
    Lebrkorname : string;  // 지점장 성명

    grvalconyn  ,
    ge1valconyn ,
    ge2valconyn ,
    ge1valobjyn ,
    ge2valobjyn : string;

    gebrvalconyn ,
    gebrvalobjyn : string;
    //팀장id일 경우 부서코드를 찾지 못하고 있어 공동대상자테이블에서 임시로 부서코드를 가져오도록함
    ls_deptcode : string;

    function GetBaseYear(gubun : integer) : string;
    function GetPehremas(Gubun : string) : string;
    function Check_Edit1 : Boolean;                 //입력 값 체크
    
    function VersionGetting(PgmId,sVer : string) : Boolean;

    procedure Read_pehreaim_det;
    procedure Read_pehaimhis_com;

    procedure Select_Form(Sender: TObject);
    function  Csel_gfd(p_loc: Integer): String;
    function  Csel_gfd1(p_loc: Integer): String;
    function  Csel_gfd2(p_loc: Integer): String;
    function  Csel_gfd3(p_loc: Integer): String;
    function  Csel_gfd10(p_loc: Integer): String;
  public
    gsLastConEv  : String;  //업무목표최종결재자 (1차 or 2차)
    Lrabasdate   : string;  // 평가기준일.
    Lorgnum      : string;  // 현조직차수.
    Le1empno     : string;  // 1차 평가자
    g_mainweight : string;  // 전체 비중
    EvalYN       : Boolean;
    sGr1Rowcount : Integer;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    { Public declarations }
    function  Get_Code(Acodeid, Acodeno : String) : String;  // 코드명 가져오기
    function  Get_Dept(Acodeid, Acodeno : String) : String;  // 부서명 가져오기
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  end;

var
  MainForm: TMainForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;

const
  Msg = '목표 면담등록 서버가 다운된 것 같습니다.'+#13#13+'담당자에게 문의 하십시오'#13;

implementation

uses
  Hinsa_TmaxDM, peDm, pea1060a1, pea1060a2, pea1060a3, pea1060b1;

{$R *.DFM}

//작업상 필요한 날짜 얻기
function TMainForm.GetBaseYear(gubun : integer) : string;
var
  Sql     : string;
begin
  Result := '';

  if gubun = 1 then                                            //업적평가 기준일(Lrabasdate)
    Sql := 'SELECT VALUE1 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 2 then                                            //하반기 업적평가 시작일(LFordate)
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0003'' ';

  if gubun = 3 then                                            //시스템 시각(Lsysdate)
    Sql := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') FROM DUAL ';

  if gubun = 4 then                                            //
    Sql := 'SELECT NVL(VALUE5,'' '') FROM PEHREBAS  '+
           ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND GUBUN = ''11'' AND SGUBUN = ''0003'' ';

  if gubun = 5 then                                            //
    Sql := 'SELECT VALUE3 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 6 then                                            //직위체계변경일
    Sql := 'SELECT VALUE3 FROM PIMVARI  WHERE  GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 7 then                                            //인사팀 부서명
    Sql := 'SELECT NVL(VALUE2,'' '') FROM PIMVARI       '+
           ' WHERE GUBUN = ''R0'' AND SGUBUN = ''0001'' ';

  DataModule_Tmax.Csel_SQL := Sql;
  DataModule_Tmax.Csel_Open4;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;


function TMainForm.GetPehremas(Gubun : string) : string;    //사원업적평가 마스터 읽기
var
   Sql     : string;
   OleData : OleVariant;
begin
   Result     := '';
   Le1empno   := '';
   Le2empno   := '';
   Le1korname := '';
   Le2korname := '';
   Lebrempno   := '';
   Lebrkorname := '';

   Sql := 'SELECT EMPNO      ||'';''|| KORNAME    ||'';''|| JOBGUN    ||'';''|| PAYCL       ||'';''|| PAYRA     ||'';''|| '+
          '       DEPTCODE   ||'';''|| ORGNUM     ||'';''|| TITLE     ||'';''|| PAYCLDATE   ||'';''|| TRDATE    ||'';''|| '+
          '       EMPDATE    ||'';''|| E1EMPNO    ||'';''|| E2EMPNO   ||'';''|| E1KORNAME   ||'';''|| E2KORNAME ||'';''|| '+
          '       E1PAYRA    ||'';''|| E2PAYRA    ||'';''|| RVALCONYN ||'';''|| E1VALCONYN  ||'';''|| E2VALCONYN||'';''|| '+
          '       E1VALOBJYN ||'';''|| E2VALOBJYN ||'';''|| EBREMPNO  ||'';''|| EBRKORNAME  ||'';''|| EBRPAYRA  ||'';''|| '+
          '       EBRVALCONYN||'';''|| EBRVALOBJYN||'';''|| E1PRJCONYN||'';''|| E1PRJCONDATE||'';''|| E1PAYCL   ||'';''|| '+
          '       E1ORGNUM   ||'';''|| E1DEPTCODE '+
          '  FROM PEHREMAS ';
   if Gubun = '읽기' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + '''         '+  // 평가기준일
                  '   AND EMPNO     = ''' + Ed_empno.LabelHint + ''' '+  // 선택된사번
                  '   AND RECONYN   = ''Y''                          ';  // 목표등록대상여부
   end;

   if Gubun = '추출' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+  //평가기준일
                  '   AND RECONYN   = ''Y''                  '+  //콕표등록대상여부
                  '   AND (EMPNO    = ''' + pEmpno + '''     '+  //선택된사번
                  '    OR  E1EMPNO  = ''' + pEmpno + '''     '+  //1차평가자
                  '    OR  E2EMPNO  = ''' + pEmpno + '''     '+  //2차평가자
                  '    OR  EBREMPNO = ''' + pEmpno + ''')    ';  //지점장
   end;

   // 접속자가 피평가자, 1차평가자, 2차평가자중 하나인지 검사
   if Gubun = '구분' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+  //평가기준일
                  '   AND RECONYN   = ''Y''                  '+  //목표등록대상여부
                  '   AND (E1EMPNO  = ''' + pEmpno + '''     '+  //1차평가자
                  '    OR  E2EMPNO  = ''' + pEmpno + '''     '+  //2차평가자
                  '    OR  EBREMPNO = ''' + pEmpno + ''')    ';  //지점장
   end;

   if Gubun = '구분' then
   begin
     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open4;
   end
   else
   begin
     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open;
   end;

   if Gubun = '읽기' then
   begin

      with DataModule_Tmax.TMaxDataSet_HInsa do
      begin
         Pa_deptcode.TextCaption  := Get_Dept(DataModule_Tmax.Csel_gfd(6),          //부서명
                                                  DataModule_Tmax.Csel_gfd(7));
         Pa_empdate.TextCaption   := DataModule_Tmax.Csel_gfd(11);                      //입사일
         Pa_paycldate.TextCaption := DataModule_Tmax.Csel_gfd(9);                       //승격일
         Pa_trdate.TextCaption    := DataModule_Tmax.Csel_gfd(10);                      //현부서발령일

         if pEmpno = DataModule_Tmax.Csel_gfd(12) then                                  //pEmpno = Login 사번
            Result := '1차';
         if pEmpno = DataModule_Tmax.Csel_gfd(23) then
            Result := '지점장';
         if pEmpno = DataModule_Tmax.Csel_gfd(13) then
            Result := '2차';
         if pEmpno = DataModule_Tmax.Csel_gfd(1) then
            Result := '피평가자';

         Le1empno   := DataModule_Tmax.Csel_gfd(12);                                    //1차평가자사번
         Le2empno   := DataModule_Tmax.Csel_gfd(13);                                    //2차평가자사번
         Le1korname := DataModule_Tmax.Csel_gfd(14);                                    //1차평가자성명
         Le2korname := DataModule_Tmax.Csel_gfd(15);                                    //2차평가자성명
         Lebrempno  := DataModule_Tmax.Csel_gfd(23);                                   //지점장사번
         Lebrkorname:= DataModule_Tmax.Csel_gfd(24);                                   //지점장성명

         Pa_Le1korname.Caption := Le1korname;                                  //1차평가자성명
         Pa_Le2korname.Caption := Le2korname;                                  //2차평가자성명
         Pa_Le1payra.Caption   := Get_Code('I113',DataModule_Tmax.Csel_gfd(16));    //1차평가자직위
         Pa_Le2payra.Caption   := Get_Code('I113',DataModule_Tmax.Csel_gfd(17));    //2차평가자직위
      end;

   end;

   if Gubun = '추출' then
   begin
      if DataModule_Tmax.TMaxDataSet_HInsa.Eof then
         Result := '없음';
   end;

   if Gubun = '구분' then
   begin
      if DM.Qmas.Eof then
         Result := '없음';
   end;

   grvalconyn  := DataModule_Tmax.Csel_gfd(18);              //피평가자  평가완료 여부
   ge1valconyn := DataModule_Tmax.Csel_gfd(19);              //1차평가자 평가완료 여부
   ge2valconyn := DataModule_Tmax.Csel_gfd(20);              //2차평가자 평가완료 여부
   ge1valobjyn := DataModule_Tmax.Csel_gfd(21);              //1차평가자 평가반려 여부
   ge2valobjyn := DataModule_Tmax.Csel_gfd(22);              //2차평가자 평가반려 여부

   vOrgnum   := DataModule_Tmax.Csel_gfd(07);
   vDeptcode := DataModule_Tmax.Csel_gfd(06);

   if Gubun = '읽기' then
   begin
     sql := 'SELECT NVL(DEPTNA3, '' '') FROM PYCDEPT '+
            ' WHERE ORGNUM   = ''' + vOrgnum   + ''' '+
            '   AND DEPTCODE = ''' + vDeptcode + ''' ';

     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open4;
     Pa_deptna3.TextCaption  := DataModule_Tmax.Csel_gfd4(1);
   end;
end;

// 선임일경우_ 팀장제외 자료를 조회한다.
procedure TMainForm.Read_pehreaim_det;
var
  SqlText,sql : string;
  i, j, isum, iChkRow, iChkNo : integer;
  bf_tmp : string;
  stmp1, stmp2 : string;
begin
   sGrid1.RowCount := 2;
   for i:= 0 to 25 do
   begin
      sGrid1.Cells[i,1] := '';
   end;

   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경
  { SqlText := 'SELECT NVL(TO_CHAR(B.SEQNO),''0'')||'';''||                                       '+
              '       NVL(A.TASKNAME,'''')||'';''||NVL(TO_CHAR(A.TASKCODE),''0'')||'';''||       '+
              '       NVL(B.DETAILTASK,'''')||'';''||NVL(TO_CHAR(B.DETAILWEIGHT),''0'')||'';''|| '+
              '       NVL(B.VALIDX,'''')||'';''||NVL(B.SRESULTCLASS,'''')||'';''||               '+
              '       NVL(B.ARESULTCLASS,'''')||'';''||NVL(B.BRESULTCLASS,'''')||'';''||         '+
              '       NVL(B.CRESULTCLASS,'''')||'';''||NVL(B.DRESULTCLASS,'''')||'';''||         '+
              '       NVL(C.eobjyn,''N'')||'';''||NVL(C.ECONYN,''N'')                            '+
              'FROM   PEHREAIM_BAS A, PEHREAIM_COM B, PEHAIMHIS_COM C                            '+
              'WHERE A.RABASDATE = ''' + Lrabasdate + '''                                        '+
              'AND   substr(A.DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + '''                    '+
              'AND   A.RABASDATE = B.RABASDATE(+)                                                '+
              'AND   substr(A.DEPTCODE,1,4)  = substr(B.DEPTCODE(+),1,4)                         '+
              'AND   A.TASKCODE  = B.TASKCODE(+)                                                 '+
              'AND   A.RABASDATE = C.RABASDATE(+)                                                '+
              'AND   substr(A.DEPTCODE,1,4)  = substr(C.DEPTCODE(+),1,4)                         '+
              'AND   A.TASKCODE  = C.TASKCODE(+)                                                 '+
              'ORDER BY A.TASKCODE, B.SEQNO                                                      ';  }

   //2014.08.12.  dsa2000 결재전에는 PEHAIMHIS_COM 테이블 데이터 없으므로 아래 쿼리로 변경함.
   SqlText := 'SELECT NVL(TO_CHAR(B.SEQNO),''0'')||'';''||                                       '+
              '       NVL(A.TASKNAME,'''')||'';''||NVL(TO_CHAR(A.TASKCODE),''0'')||'';''||       '+
              '       NVL(B.DETAILTASK,'''')||'';''||NVL(TO_CHAR(B.DETAILWEIGHT),''0'')||'';''|| '+
              '       NVL(B.VALIDX,'''')||'';''||NVL(B.SRESULTCLASS,'''')||'';''||               '+
              '       NVL(B.ARESULTCLASS,'''')||'';''||NVL(B.BRESULTCLASS,'''')||'';''||         '+
              '       NVL(B.CRESULTCLASS,'''')||'';''||NVL(B.DRESULTCLASS,'''')||'';''||         '+
              '       ''N''||'';''||''N''                                                        '+              
              '  FROM PEHREAIM_BAS A, PEHREAIM_COM B                                             '+
              ' WHERE A.RABASDATE = ''' + Lrabasdate + '''                                       '+
              '   AND substr(A.DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + '''                   '+
              '   AND A.RABASDATE = B.RABASDATE(+)                                               '+
              '   AND substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE(+),1,4)                         '+
              '   AND A.TASKCODE  = B.TASKCODE(+)                                                '+
              ' ORDER BY A.TASKCODE, B.SEQNO                                                     ';

   Edit1.Text := SqlText;
   
   with DBSet1 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      bf_tmp := '';
      isum   := 0;
      iChkRow:= 0;
      iChkNo := 0;

      if RecordCount < 1 then
         exit;

      sGrid1.RowCount := RecordCount + 1;

      sGr1Rowcount := RecordCount;

      for i := 1 to RecordCount do
      begin
         for j:= 0 to 25 do
         begin
            sGrid1.Cells[j,i] := '';
         end;

         stmp1 :=  Csel_gfd(2);  //매체명
         stmp2 :=  Csel_gfd(5);  //상세비중

         if bf_tmp = '' then
         begin
            iChkNo := 1;
            sGrid1.Cells[1,i] := inttostr(iChkNo);        //순번
            sGrid1.Cells[2,i] := stmp1;                   //매체명
            bf_tmp := stmp1;
            isum   := strtoint(stmp2);
            iChkRow:= i;
            sGrid1.Cells[3,iChkRow] := inttostr(isum); //JSH추가
         end
         else
         begin
            if trim(bf_tmp) = trim(stmp1) then   //매체명 비교
            begin
               isum:= isum + strtoint(stmp2);
               if i = RecordCount then
                 sGrid1.Cells[3,iChkRow] := inttostr(isum);
            end
            else
            begin
               sGrid1.Cells[3,iChkRow] := inttostr(isum);

               iChkRow:= i;
               isum:= strtoint(stmp2);
               inc(iChkNo);
               sGrid1.Cells[1,i] := inttostr(iChkNo);               //순번
               sGrid1.Cells[2,i] := stmp1;                          //매체명
               if i = RecordCount then
                 sGrid1.Cells[3,iChkRow] := inttostr(isum);
            end;
         end;

         //sGrid1.Cells[1,i] := inttostr(i);
         //sGrid1.Cells[1,i] := 'No';
         //sGrid1.Cells[2,i] := Csel_gfd(2);//'매체명';
         //sGrid1.Cells[3,i] := Csel_gfd(2);//'비중';
         sGrid1.Cells[4,i] := Csel_gfd(4); //'세부추진활동';
         sGrid1.Cells[5,i] := stmp2;       //'상세비중';
         sGrid1.Cells[6,i] := Csel_gfd(6); //'평가지표';
         sGrid1.Cells[7,i] := Csel_gfd(7); //'탁월';
         sGrid1.Cells[8,i] := Csel_gfd(8); //'우수';
         sGrid1.Cells[9,i] := Csel_gfd(9); //'보통';
         sGrid1.Cells[10,i]:= Csel_gfd(10);//'미흡';
         sGrid1.Cells[11,i]:= Csel_gfd(11);//'저조;
         //
         sGrid1.Cells[20,i] := Csel_gfd(1); //seqno
         sGrid1.Cells[21,i] := Csel_gfd(3); //TASKCODE
         sGrid1.Cells[22,i] := Csel_gfd(2); //매체명
         //sGrid1.Cells[23,i] :=  Csel_gfd(12);//반려여부
                                                              
         bf_tmp := stmp1;
         next;
      end;
      sGrid1.Row := 1;
   end;
end;

// 팀장일경우 자료를 조회한다.
procedure TMainForm.Read_pehaimhis_com;
var
  SqlText,sql : string;
  i, j, isum, iChkRow, iChkNo : integer;
  bf_tmp : string;
  stmp1, stmp2 : string;
begin
   sGrid1.RowCount := 2;
   for i := 1 to 20 do
   begin
      sGrid1.Cells[i,1] := '';
   end;

   //showmessage(vDeptcode);
   //Read_pehaimhis_com EOBJYN


   //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경
   SqlText := 'SELECT NVL(TO_CHAR(B.SEQNO),''0'')||'';''||                                       '+
              '       NVL(A.TASKNAME,'''')||'';''||NVL(TO_CHAR(A.TASKCODE),''0'')||'';''||       '+
              '       NVL(B.DETAILTASK,'''')||'';''||NVL(TO_CHAR(B.DETAILWEIGHT),''0'')||'';''|| '+
              '       NVL(B.VALIDX,'''')||'';''||NVL(B.SRESULTCLASS,'''')||'';''||               '+
              '       NVL(B.ARESULTCLASS,'''')||'';''||NVL(B.BRESULTCLASS,'''')||'';''||         '+
              '       NVL(B.CRESULTCLASS,'''')||'';''||NVL(B.DRESULTCLASS,'''')||'';''||         '+
              '       NVL(B.eobjyn,''N'')||'';''||NVL(B.ECONYN,''N'')                            '+
              'FROM pehreaim_bas A, pehaimhis_com B                                              '+
              'WHERE A.RABASDATE = ''' + Lrabasdate + '''                                        '+
              'AND substr(A.DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + '''                      '+
              'AND B.EEMPNO(+)   = ''' + pEmpno + '''                                            '+
                   //' AND NVL(B.EOBJYN,''N'')  <> ''Y'' '+
                   //' AND NVL(B.ECONYN,''N'')  <> ''Y'' '+
              'AND A.RABASDATE = B.RABASDATE(+)                                                  '+
              'AND substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE(+),1,4)                            '+
              'AND A.TASKCODE  = B.TASKCODE(+)                                                   '+
              'ORDER BY A.TASKCODE, B.SEQNO                                                      ';

   //showmessage(vDeptcode);
   Edit1.text := SqlText;

   with DBSet1 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      bf_tmp := '';
      isum   := 0;
      iChkRow:= 0;
      iChkNo := 0;

      if RecordCount < 1 then
         exit;

      sGrid1.RowCount := RecordCount + 1;
      sGr1Rowcount := RecordCount;

      for i := 1 to RecordCount do
      begin
         for j:= 1 to sGrid1.Colcount  do//for j:= 0 to sGrid1.Colcount -1 do
         begin
            sGrid1.Cells[j,i] := '';
         end;

         stmp1 :=  Csel_gfd(2);  //매체명
         stmp2 :=  Csel_gfd(5);  //상세비중

         if bf_tmp = '' then
         begin
            iChkNo := 1;
            sGrid1.Cells[1,i] := inttostr(iChkNo);        //순번
            sGrid1.Cells[2,i] := stmp1;                   //매체명
            bf_tmp := stmp1;
            isum   := strtoint(stmp2);
            iChkRow:= i;
         end
         else
         begin
            if trim(bf_tmp) = trim(stmp1) then
            begin
               isum:= isum + strtoint(stmp2);
               if i = RecordCount then
                 sGrid1.Cells[3,iChkRow] := inttostr(isum);
            end
            else
            begin
               sGrid1.Cells[3,iChkRow] := inttostr(isum);

               iChkRow:= i;
               isum:= strtoint(stmp2);
               inc(iChkNo);
               sGrid1.Cells[1,i] := inttostr(iChkNo);               //순번
               sGrid1.Cells[2,i] := stmp1;                          //매체명
               if i = RecordCount then
                 sGrid1.Cells[3,iChkRow] := inttostr(isum);
            end;
         end;

         sGrid1.Cells[4,i] := Csel_gfd(4); //'세부추진활동';
         sGrid1.Cells[5,i] := stmp2;       //'상세비중';
         sGrid1.Cells[6,i] := Csel_gfd(6); //'평가지표';
         sGrid1.Cells[7,i] := Csel_gfd(7); //'탁월';
         sGrid1.Cells[8,i] := Csel_gfd(8); //'우수';
         sGrid1.Cells[9,i] := Csel_gfd(9); //'보통';
         sGrid1.Cells[10,i]:= Csel_gfd(10);//'미흡';
         sGrid1.Cells[11,i]:= Csel_gfd(11);//'저조
         //
         sGrid1.Cells[20,i] := Csel_gfd(1); //seqno
         sGrid1.Cells[21,i] := Csel_gfd(3); //TASKCODE
         sGrid1.Cells[22,i] := Csel_gfd(2); //매체명
         sGrid1.Cells[23,i] :=  Csel_gfd(12);//반려여부
         sGrid1.Cells[24,i] :=  Csel_gfd(13);//확인여부

         bf_tmp := stmp1;
         next;
      end;
      sGrid1.Row := 1;
   end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  sMsg: String;
begin

  sMsg := DataModule_Tmax.Connect_Session;

  if sMsg <> '' then
  begin
    Application.MessageBox(PChar(msg),'TMAX에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  Start := True;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

//조회 버튼
procedure TMainForm.Bt_SrhClick(Sender: TObject);
var
  //DbSet : TDataSet;
  SqlText : String;
  stmp : string;
  i : integer;
begin
   Lwork := GetPehremas('읽기');

   if vDeptcode = '' then                 
   begin
{      SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''2C'',''Y'',''58'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                 '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                 '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                 ' FROM PEHREAIM_COMBAS A, PYCDEPT B          '+
                 ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                 ' AND A.EMPNO     = ''' + pEmpno + '''       '+
                 ' AND B.ORGNUM    = ''' + Lorgnum + '''      '+
                 ' AND A.DEPTCODE = B.DEPTCODE  ';
}
      if  Lrabasdate < GetBaseYear(6)  then
          SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''2C'',''Y'',''58'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                     '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                     '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                     ' FROM PEHREAIM_COMBAS A, PYCDEPT B          '+
                     ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                     ' AND A.EMPNO     = ''' + pEmpno + '''       '+
                     ' AND B.ORGNUM    = ''' + Lorgnum + '''      '+
                     ' AND A.DEPTCODE = B.DEPTCODE  '
      else
          SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''C11'',''Y'',''C15'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                     '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                     '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                     ' FROM PEHREAIM_COMBAS A, PYCDEPT B          '+
                     ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                     ' AND A.EMPNO     = ''' + pEmpno + '''       '+
                     ' AND B.ORGNUM    = ''' + Lorgnum + '''      '+
                     ' AND A.DEPTCODE = B.DEPTCODE  ';

   end
   else
   begin
{      //담당자를 체크한다.
      SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''2C'',''Y'',''58'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                 '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                 '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                  ' FROM PEHREAIM_COMBAS A, PYCDEPT B '+
                 ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                   ' AND A.EMPNO     = ''' + pEmpno + ''' '+
                   ' AND A.DEPTCODE  = ''' + vDeptcode + ''' '+
                   ' AND B.ORGNUM    = ''' + Lorgnum + ''' '+
                   ' AND A.DEPTCODE = B.DEPTCODE  ';
}
      if  Lrabasdate < GetBaseYear(6)  then
          SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''2C'',''Y'',''58'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                     '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                     '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                      ' FROM PEHREAIM_COMBAS A, PYCDEPT B '+
                     ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                       ' AND A.EMPNO     = ''' + pEmpno + ''' '+
                       ' AND A.DEPTCODE  = ''' + vDeptcode + ''' '+
                       ' AND B.ORGNUM    = ''' + Lorgnum + ''' '+
                       ' AND A.DEPTCODE = B.DEPTCODE  '
      else
          SqlText := 'SELECT NVL(A.SENIORYN,''N'')||'';''||DECODE(A.PAYRA,''C11'',''Y'',''C15'',''Y'',''N'')||'';''||A.DEPTCODE||'';''||B.DEPTNAME  '+
                     '       ||'';''|| (SELECT distinct(NVL(econyn,''N'')) FROM pehaimhis_com WHERE rabasdate = ''' + Lrabasdate + '''            '+
                     '                                                                          AND eempno = ''' + pEmpno + ''')                  '+
                      ' FROM PEHREAIM_COMBAS A, PYCDEPT B '+
                     ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                       ' AND A.EMPNO     = ''' + pEmpno + ''' '+
                       ' AND A.DEPTCODE  = ''' + vDeptcode + ''' '+
                       ' AND B.ORGNUM    = ''' + Lorgnum + ''' '+
                       ' AND A.DEPTCODE = B.DEPTCODE  ';


   end;

   with DB_ComBas do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      edit1.Text := sqltext;
      if RecordCount > 0 then
      begin
         if vDeptcode = '' then
             vDeptcode := Csel_gfd2(3);


         stmp := trim(FieldByName('SEL_DATA').AsString);

         if stmp <> '' then
         begin           //showmessage(Csel_gfd2(5));
            // 결재 완료 여부를 체크한다.
            if Csel_gfd2(5) = 'Y' then
                Read_pehaimhis_com
            else
                Read_pehreaim_det;

            //선임
            if copy(stmp,1,1) = 'Y' then
            begin
                //팀장인지 여부를 체크한다.
                if copy(stmp,3,1) = 'Y' then
                begin
                   //팀장이면

                    Pa_deptcode.TextCaption := Csel_gfd2(4);
                    JeonPanel2.Visible      := false;
                    Pa_Le1KorName.Visible   := false;
                    Pa_Le1Payra.Visible     := false;

                    JeonPanel4.Visible    := false;
                    Pa_Le2KorName.Visible := false;
                    Pa_Le2Payra.Visible   := false;


                    //showmessage('선임이면서 팀장');
                    Bt_Confirm.Caption := '결재';
                    Bt_can.Enabled     := true;
                    P_Title.Caption    := '공 동 목 표  결 재';
                    {
                    Bt_Mod.Enabled := true;
                    Bt_Add.Enabled := true;
                    Bt_del.Enabled := false;
                    }
                    Bt_Opt.Enabled    := true;
                    Bt_Detail.Enabled := true;

                    //선임이면서 자기자신이 반료처리를 한 경우
                    //사실 이런경우는 없을듯 하지만 예외상황이 발생할 수 있어 추가함.
                    //sGrid1.Cells[23,i] :=  Csel_gfd(12);//반려여부
                    //sGrid1.Cells[24,i] :=  Csel_gfd(13);//확인여부

                    //showmessage('PASS111=>' + sGrid1.Cells[1,1] + ' ' + sGrid1.Cells[23,1] + ' ' + sGrid1.Cells[24,1]);

                    //만일 반려를 하지 않은 경우
                    if (sGrid1.Cells[1,1] <> '') and (sGrid1.Cells[23,1] <> 'Y') then
                    begin
                       //확인처리를 하지 않은 경우 버튼을 모두 활성화 시킨다.
                       //그래야만 처리를 할수 있지요...
                       if (sGrid1.Cells[24,1] <> 'Y') then
                       begin
                          Bt_Confirm.Enabled := true;
                          Bt_can.Enabled     := true;
                          Bt_Mod.Enabled     := true;
                          Bt_Add.Enabled     := true;
                          Bt_del.Enabled     := false;
                       end
                       //확인처를 한 경우 .. 버튼 비활성화 처리 시킨다.
                       else
                       begin
                          Bt_Confirm.Enabled := false;
                          Bt_can.Enabled     := false;
                          Bt_Mod.Enabled     := false;
                          Bt_Add.Enabled     := false;
                          Bt_del.Enabled     := false;
                       end;
                    end
                    //반려를 한경우 무조건 막는다.
                    else if (sGrid1.Cells[1,1] <> '') and (sGrid1.Cells[23,1] = 'Y') then
                    begin
                       Bt_Confirm.Enabled := false;
                       Bt_can.Enabled     := false;
                       Bt_Mod.Enabled     := false;
                       Bt_Add.Enabled     := false;
                       Bt_del.Enabled     := false;
                    end
                    else
                    begin
                       Bt_Confirm.Enabled := true;
                       Bt_can.Enabled     := true;
                       Bt_Mod.Enabled     := true;
                       Bt_Add.Enabled     := true;
                       Bt_del.Enabled     := false;
                    end;
                end
                else
                begin
                   //팀장이 아니면
                   Bt_Confirm.Caption := '결재상신';
                   Bt_can.Enabled := false;
                   P_Title.Caption := '공 동 목 표  등 록';
                end;
            end
            //선임이 아니고
            else
            begin
               //팀장여부를 체크한다.
               if copy(stmp,3,1) = 'Y' then   //팀장이면
               begin
                  Pa_deptcode.TextCaption := Csel_gfd2(4);
                  JeonPanel2.Visible := false;
                  Pa_Le1KorName.Visible := false;
                  Pa_Le1Payra.Visible := false;

                  JeonPanel4.Visible := false;
                  Pa_Le2KorName.Visible := false;
                  Pa_Le2Payra.Visible := false;

                  //showmessage('선임아니고 팀장임');
                  Bt_Confirm.Caption := '결재';
                  P_Title.Caption    := '공 동 목 표  결 재';

                  Read_pehaimhis_com;
                  //버튼 활성화여부  판별

                  Bt_Mod.Enabled    := false;
                  Bt_Add.Enabled    := false;
                  Bt_del.Enabled    := false;
                  Bt_Opt.Enabled    := true;
                  Bt_Detail.Enabled := true;

                  Bt_Confirm.Enabled := true;
                  Bt_can.Enabled := true;

                  //확인처리를 하지 않은 경우
                  if (sGrid1.Cells[1,1] <> '') and (sGrid1.Cells[24,1] <> 'Y') then
                  begin
                      //반려처리를 하지 않았으면...
                      if (sGrid1.Cells[23,1] <> 'Y') then
                      begin
                         Bt_Confirm.Enabled := true;
                         Bt_can.Enabled     := true;
                      end
                      //반려한경우
                      else
                      begin
                         Bt_Confirm.Enabled := false;
                         Bt_can.Enabled     := false;
                         showmessage('반려처리한 공동목표입니다.' +#13+#13+
                                     '선임자에게 공동목표 확인 후 결재상신처리 시키십시오.');
                      end;

                      //if (sGrid1.Cells[24,1] <> 'Y')
                      //Bt_Confirm.Enabled := true;
                      //Bt_can.Enabled     := true;
                  end
                  //확인처리를 한 경우
                  else
                  begin
                     //반려처리를 하지 않은 경우
                      Bt_Confirm.Enabled := false;
                      Bt_can.Enabled     := false;
                      Bt_Mod.Enabled     := false;
                      Bt_Add.Enabled     := false;
                      Bt_del.Enabled     := false;
                     //반려경우는 아직 .....
                  end;
               end
               else
               begin
                  //showmessage('선임도 팀장도 아님');
                  Bt_Srh.Enabled    := false;
                  Bt_Detail.Enabled := false;
                  Bt_can.Enabled    := false;
               end;
            end;
         end;
      end;
   end;

   St_Help.Panels[0].Text := '';

end;

procedure TMainForm.Ed_empnoEnter(Sender: TObject);
begin
  peInitComponent(Self,88);
 {
  if Nt_Book.ActivePage = '관리직' then
     Grid1.DataSource.DataSet.Close;
 }
  if Nt_Book.ActivePage = '영업직' then
     Grid2.DataSource.DataSet.Close;

  Bt_Mod.Enabled := False;
  //Bt_Add.Enabled := False;
  Bt_Del.Enabled := False;
  Bt_Opt.Enabled := False;
  Bt_Can.Enabled := False;
  Bt_Confirm.Enabled := False;
  Bt_Detail.Enabled  := False;
end;
 
procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Bt_TgtClick( Bt_Tgt );
    inherited;
    Key := #0;
    Start := True;
  end;
end;

procedure TMainForm.Grid2DblClick(Sender: TObject);
begin
  if Lwork = '피평가자' then
  begin
    if Bt_Mod.Enabled then
      Bt_ModClick(Bt_Mod);
  end
  else
  begin
    if Bt_Detail.Enabled then
      Bt_ModClick(Bt_Detail);
  end;
end;

//자세히 보기
procedure TMainForm.Bt_ModClick(Sender: TObject);
var
  Fm : TFm_sub_Form1;
begin
  Try
    Fm := TFm_sub_Form1.Create(Self);
    if TComponent(Sender).Tag in [1,2] then              //1:자세히보기, 수정  2: 추가
       Fm.Pwork := Nt_Book.ActivePage;                   //Pwork:관리직, 영업직, 자기계발
    Fm.Pwork := '의견등록';

    Fm.Pework := '자세히보기';
    Fm.Lrabasdate := Lrabasdate;
    Fm.Lfordate   := Lfordate;
    Fm.gsLastConEv:= gsLastConEv;
    Fm.LSeqno     := 0;

    Fm.Lempno     := Ed_empno.LabelHint;
    Fm.Lwriteemp  := Pempno;
    Fm.vDeptcode  := vDeptcode;

    if TComponent(Sender).Name = 'Bt_Detail'  then
    begin
       Fm.LvPROPELTASK := sGrid1.Cells[22 ,sGrid1.Row];
       Fm.LvTaskCode := sGrid1.Cells[21,sGrid1.Row];
       Fm.Bt_Add.Enabled := false;
       Fm.Bt_Save.Enabled := false;
       Fm.Bt_del.Enabled := false;
       Fm.PeJeonOutLookBtn2.Enabled := false;
    end
    //수정일경우 ..
    else if TComponent(Sender).Name = 'Bt_Mod'  then
    begin
       Fm.LvPROPELTASK := sGrid1.Cells[22 ,sGrid1.Row];
       Fm.LvTaskCode := sGrid1.Cells[21,sGrid1.Row];
       Fm.Bt_Add.Enabled := true;
       Fm.Bt_Save.Enabled := true;
       Fm.Bt_del.Enabled := true;
    end
    else if TComponent(Sender).Name = 'Bt_Add'  then
    //if TComponent(Sender).Tag in [1,2] then
    begin
       Fm.Bt_Add.Enabled := true;
       Fm.Bt_Save.Enabled := true;
       Fm.Bt_del.Enabled := true;
    end;
    //Fm.Read_pehreaim_com;
    Fm.ShowModal;

    if TComponent(Sender).Name <> 'Bt_Detail'  then
    begin
       //팀장인지 선임인지 여부를 체크한 후 조회한다.
       // Read_pehreaim_det;
    end;

    Application.ProcessMessages;
    Bt_SrhClick(nil);
  Finally
    Fm.Free;
  End;
//  Read_pehaimaim_det;        //showmessage('PASS222=>' + sGrid1.Cells[1,1] + ' ' + sGrid1.Cells[23,1]);
end;

procedure TMainForm.Bt_ConfirmClick(Sender: TObject);
var
  //Lgubun     : integer;
  //Param      : OleVariant;
  //Save       : integer;    // 내역보관 유,무,이력보관(0, 1, 2)
  Msg        : string;
  //DbSet      : TDataSet;
  ToMail     : string;
  //detail_cnt :integer;
  sendtime   : String;
  SqlText : string;
  i : integer;
  sName, sCodeName, sBody: string;
begin

   //입력값 체크
   if not Check_Edit1 then
      System.Exit;

   for i := 1 to sGrid1.Rowcount -1 do
   begin
      if (sGrid1.Cells[2,i] <> '') and (sGrid1.Cells[3,i] <> '100') then
      begin
         showmessage('각 매체명당 상세비중의 합이 100이 아닌자료가 있습니다.' +#13+
                     '[' + sGrid1.Cells[2,i] + ']' + '매체의 상세비중의 합을 100으로 맞추세요!');
         exit;
      end;
   end;

   //작업자 여부를 체크한다.
   if Bt_Confirm.Caption = '결재상신' then
   begin
      Msg := '['+Bt_Confirm.Caption+']를 하시면 업무목표 내용을 편집할 수 없습니다.'#13#13+
           '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?';
      if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
      System.Exit;

      MessageDlg('팀장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);


      St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';

      //여기서부터 트랜잭션 처리를 한다.
      //결제상신한 자료를 몽땅 삭제처리 한 후 저장처리시킨다.
      //삭제처리 루틴
      SqlText := Format('DELETE FROM pehaimhis_com '+
                        ' WHERE rabasdate = ''%s'' AND substr(deptcode,1,4) = ''%s'' ',
                        [Lrabasdate, copy(vDeptcode,1,4)]);
      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         St_Help.Panels[0].Text := '';
         Exit;
      end;

      //저장처리 루틴
      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      SqlText := Format('INSERT INTO  pehaimhis_com '+
                        ' SELECT A.RABASDATE, A.TASKCODE, A.SEQNO, A.DEPTCODE, A.MAINWEIGHT,  A.DETAILTASK, A.DETAILWEIGHT, A.VALIDX, '+
                        ' A.VALFUNCTION, A.SRESULTCLASS, A.ARESULTCLASS, A.BRESULTCLASS, A.CRESULTCLASS, A.DRESULTCLASS, '+
                        ' A.E1PRJOPINON, A.RESULT, A.DETAILRSCORE, A.DETAILRCLASS, '''' DETAILESCORE, '''' DETAILECLASS, '+
                        ' A.ROBJYN1,     A.OBJYN, A.OBJSAYU, A.OBJOPINION, A.WRITEEMP, A.WRITETIME, '+
                        ' ''%s'' EEMPNO, ''%s'' EKORNAME, '''' EPAYCL, '''' EPAYRA, '''' EORGNUM, '''' EDEPTCODE, '+
                        ' ''N'' ECONYN, '''' ECONDATE , '''' EOBJYN, to_char(sysdate,''yyyymmddhh24miss''), '''' RCONYN  '+
                        ' FROM PEHREAIM_COM A, PEHREAIM_BAS B '+
                        ' WHERE A.RABASDATE =  ''%s''  AND substr(A.DEPTCODE,1,4)  = ''%s'' '+
                        ' AND A.RABASDATE = B.RABASDATE  AND substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE,1,4)  AND A.TASKCODE  = B.TASKCODE  ',
                       [Le1empno, Le1korname, Lrabasdate, copy(vDeptcode,1,4) ]);
      St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';

      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         St_Help.Panels[0].Text := '';
         Exit;
      end;

      //showmessage(Le1empno);
      //showmessage(Le1korname);

      //==============================================================================//
      // 메일을 보낸다.
      MessageDlg('상위부서장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      SendProgID  := 'PEA1060B';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := Le1empno;
      MailSubject := '[ 공동목표설정 팀장평가 확인요청 ]';
      MailBody    := '목표설정을 완료했습니다.'+#13+#13+
                     ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                     '★확인방법:종합인사정보시스템 ▶[평가] ▶[구성원목표관리] ▶[직무역량, 업무목표 등록/결재] ▶[공동목표 등록 / 결재]';
      ReceiveYN   := 'N';
      //if ChkReceive.Checked then ReceiveYN := 'Y';

      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
           MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '공동목표설정 팀장평가 확인되었으므로    '+#13+
                      '팀장께 [공동목표설정 팀장평가 확인요청] 메시지를 '+#13+
                      '[HINT]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;
      //==============================================================================//

      showmessage('결재상신 처리되었습니다.');

      Bt_Mod.Enabled := false;
      Bt_Add.Enabled := false;
      Bt_del.Enabled := false;
      Bt_Opt.Enabled := false;
      Bt_Detail.Enabled := true;
      Bt_Confirm.Enabled := false;
      Bt_can.Enabled := false;
      //Read_pehreaim_det;
   end
   else if Bt_Confirm.Caption = '결재' then
   begin
      Msg := '결재가 완료되면 공동목표 대상자 전원에게 통보됩니다. '+ #13+#13+
            '['+Bt_Confirm.Caption+'] 하시겠습니까?';
      if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
      System.Exit;


      //////////////////////////////////////////////////////////////////////////
      ////////////////////     결재 상신 동시 처리를 위한 작업  ////////////////
      //////////////////////////////////////////////////////////////////////////
      // 원래는 팀장에 의해 선임자로 지정된 자가 [결재상신] 처리를 하고,
      // 팀장이 [결재]를 해야하지만 처리 시간이 많이 걸리는 까닭에
      // 선임을 지정하지 않고 팀장이 바로 [결재상신]->[결재]를 동시에 처리하기
      // 위해서 밑의 처리를 추가 시킨것임.
      // 공동목표대상자 추출시 공동목표자이고 팀장이면 => 선임으로 바로 지정할것임.
      // 만약 팀장, 선임을 분리를 원하면 밑의 서식을 막아주고, 추출시 지정하지 말것.
      //  20060120 JSH
      //////////////////////////////////////////////////////////////////////////
      SqlText := Format('DELETE FROM pehaimhis_com '+
                        ' WHERE rabasdate = ''%s'' AND substr(deptcode,1,4) = ''%s'' ',
                        [Lrabasdate, copy(vDeptcode,1,4)]);
      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         St_Help.Panels[0].Text := '';
         Exit;
      end;

      //저장처리 루틴
      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      SqlText := Format('INSERT INTO  pehaimhis_com '+
                        ' SELECT A.RABASDATE, A.TASKCODE, A.SEQNO, A.DEPTCODE, A.MAINWEIGHT,  A.DETAILTASK, A.DETAILWEIGHT, A.VALIDX, '+
                        ' A.VALFUNCTION, A.SRESULTCLASS, A.ARESULTCLASS, A.BRESULTCLASS, A.CRESULTCLASS, A.DRESULTCLASS, '+
                        ' A.E1PRJOPINON, A.RESULT, A.DETAILRSCORE, A.DETAILRCLASS, '''' DETAILESCORE, '''' DETAILECLASS, '+
                        ' A.ROBJYN1,     A.OBJYN, A.OBJSAYU, A.OBJOPINION, A.WRITEEMP, A.WRITETIME, '+
                        ' ''%s'' EEMPNO, ''%s'' EKORNAME, '''' EPAYCL, '''' EPAYRA, '''' EORGNUM, '''' EDEPTCODE, '+
                        ' ''N'' ECONYN, '''' ECONDATE , '''' EOBJYN, to_char(sysdate,''yyyymmddhh24miss''), '''' RCONYN  '+
                        ' FROM PEHREAIM_COM A, PEHREAIM_BAS B '+
                        ' WHERE A.RABASDATE =  ''%s''  AND substr(A.DEPTCODE,1,4)  = ''%s'' '+
                        ' AND A.RABASDATE = B.RABASDATE  AND substr(A.DEPTCODE,1,4) = substr(B.DEPTCODE,1,4)  AND A.TASKCODE  = B.TASKCODE  ',
                       //[Le1empno, Le1korname, Lrabasdate, copy(vDeptcode,1,4) ]);
                       //실장이 아니라 팀장이 결재 상신처리하기에 1차 평가자는 자기자신임.
                       [pEmpno, pKorname, Lrabasdate, copy(vDeptcode,1,4) ]);
      St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';

      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         St_Help.Panels[0].Text := '';
         Exit;
      end;
      //////////////////////////////////////////////////////////////////////////
      ////////////////////     결재 상신 동시 처리를 작업 끝   ////////////////
      //////////////////////////////////////////////////////////////////////////


      SqlText := Format('UPDATE pehaimhis_com SET '+
                        '  ECONYN   = ''Y'',  ECONDATE = to_char(sysdate,''yyyymmdd'') '+
                        ' WHERE rabasdate = ''%s'' AND eempno = ''%s'' ',
                        [Lrabasdate, pEmpno]);

      St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';

      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         Exit;
      end;

      MessageDlg('선임자와 공동목표 대상자에게 공동목표 결재 확인 메일이 발송됩니다.',mtInformation,[mbOK],0);

      //팀장부서를 확인한다.
      SqlText := 'SELECT A.KORNAME||'';''||B.CODENAME '+
                 'FROM PEHREAIM_COMBAS A, PYCCODE B '+
                 'WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                 'AND EMPNO = '''+pEmpno+''' '+
                 'AND A.PAYCL = B.CODENO AND B.CODEID = ''I112'' AND B.USEYN = ''Y'' ';
      with DB_PIMPMAS do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            sName := Csel_gfd3(1);
            sCodeName := Csel_gfd3(2);
         end;
         close;
      end;

      //showmessage(Pkorname+' '+Pempno);

      //선임자에게도 메일을 보내야 된다.
      //공동목표 팈원들에게 메일을 보내야 한다.
      //타이틀 : 공동목표설정 완료
      //내용 :팀장 (홍길동 부장)으로 부터 팀공동목표의 설정이 완료되었습니다.
      //개인목표등록을 완료해 주시기 바랍니다.

      //먼저 선임자에게 공동목표등록 결재 확인메일을 보낸다.
      //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
      SqlText := 'SELECT NVL(A.EMPNO,'''')||'';''||NVL(A.KORNAME,'''')||'';''||B.CODENAME||'';''|| '+
                 '       NVL(A.UNIONYN,''N'')||'';''||NVL(A.SENIORYN,''N'') '+
                 'FROM PEHREAIM_COMBAS A, PYCCODE B '+
                 'WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                 'AND ((A.UNIONYN  = ''Y'') OR (A.SENIORYN = ''Y'')) '+
        	 'AND SUBSTR(A.DEPTCODE,1,4) IN (SELECT SUBSTR(DEPTCODE,1,4) FROM PEHREAIM_COMBAS '+
                 'WHERE RABASDATE = ''' + Lrabasdate + ''' '+' AND EMPNO = '''+pEmpno+''''+')'+
                 'AND A.PAYCL = B.CODENO AND B.CODEID = ''I112'' AND B.USEYN = ''Y'' '+
                 'ORDER BY A.SENIORYN desc, A.PAYCL, A.PAYRA, A.EMPNO';

      with DB_PIMPMAS do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;

         if RecordCount > 0 then
         begin
            for i := 1 to RecordCount do
            begin
               if (Csel_gfd3(5) = 'Y') then //선임이면
               begin
                  if (Csel_gfd3(4) = 'N') then
                  begin
                     //선임에게 메일을 보낸다. 확인메일
                     sBody := ' 팀장['+sName+' '+ sCodeName+']으로 부터 팀공동목표의 설정이 완료되었습니다.'+#13+#13+
                              ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                              '★확인방법:종합인사정보시스템 ▶[평가] ▶[구성원 성과관리] ▶[직무역량, 업무목표 등록/결재] ▶[개인 업무목표 등록]';

                  end
                  else if (Csel_gfd3(4) = 'Y') then
                  begin
                     //선임+공동목표대상자에게 메일을 보낸다.
                      sBody := ' 팀장['+sName+' '+ sCodeName+']으로 부터 팀공동목표의 설정이 완료되었습니다.'+#13+#13+
                               ' 개인목표등록을 완료해 주시기 바랍니다.'+#13+#13+
                               '★확인방법:종합인사정보시스템 ▶[평가] ▶[구성원 성과관리] ▶[직무역량, 업무목표 등록/결재] ▶[개인 업무목표 등록]';

                  end;
               end
               //공동목표대상자일 경우
               else if (Csel_gfd3(4) = 'Y') then
               begin
                  sBody := ' 팀장['+sName+' '+ sCodeName+']으로 부터 팀공동목표의 설정이 완료되었습니다.'+#13+#13+
                           ' 개인목표등록을 완료해 주시기 바랍니다.'+#13+#13+
                           '★확인방법:종합인사정보시스템 ▶[평가] ▶[구성원 성과관리] ▶[직무역량, 업무목표 등록/결재] ▶[개인 업무목표 등록]';

               end;

                  //==============================================================================//
                  // 메일을 보낸다.
                  MessageDlg(Csel_gfd3(1)+'-'+Csel_gfd3(2)+' '+Csel_gfd3(3)+'에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
                  SendProgID  := 'PEA1060B';  //프로그램 ID
                  SendEmpno   := Pempno;      //발송자(로그인 사번)
                  RcveEmpno   := Csel_gfd3(1);
                  MailSubject := '[ 공동목표설정 완료. ]';
                  MailBody    := sBody;
                  ReceiveYN   := 'N';
                  //if ChkReceive.Checked then ReceiveYN := 'Y';

                  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                       MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
                  else
                  begin
                       MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                                  '공동목표설정 완료 확인되었으므로    '+#13+
                                  '팀장께 [공동목표설정 완료.] 메시지를 '+#13+
                                  '[브로드넷]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
                       System.Exit;
                  end;
                  //==============================================================================//

               next;

            end;
         end;
      end;

      showmessage('결재 처리되었습니다.');
      Bt_SrhClick(self);
   end;

//   St_Help.Panels[0].Text := '';
   //Read_pehreaim_det;
   //조회루틴을 한번 더 탄다.
end;

procedure TMainForm.Ed_empnoRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer;
begin
  Try
    Valuer := TPeDestValuer.Create(Self);
    Valuer.rabasdate    := Lrabasdate;
    Valuer.empno        := Pempno;

    if Valuer.Execute then
      begin
        Ed_empno.LabelHint := Valuer.empno;
        Bt_TgtClick( Bt_Tgt );
      end;
  Finally
    Valuer.Free;
    Valuer := nil;
    Start := True;
  End;
end;

procedure TMainForm.Bt_delClick(Sender: TObject);
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
begin
  Msg := '[삭제] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
    System.Exit;
  {
  if (Nt_Book.ActivePage = '관리직') then
    DbSet := Grid1.DataSource.DataSet
  else
  }
  if (Nt_Book.ActivePage = '영업직') then
    DbSet := Grid2.DataSource.DataSet
  else                                            //자기계발
    DbSet := Grid3.DataSource.DataSet;

  St_Help.Panels[0].Text := ' 삭제 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);
  Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,FloatToStr(DbSet.FieldByName('seqno').AsFloat)]);
  {
  if Nt_Book.ActivePage = '관리직' then
    DM.FSvr_DeleteSql(1,0,Param)
  else
  }
  if Nt_Book.ActivePage = '영업직' then
    DM.FSvr_DeleteSql(2,0,Param)
  else
    DM.FSvr_DeleteSql(5,0,Param);               //자기계발

  Bt_SrhClick(Bt_Srh);

  St_Help.Panels[0].Text := '';
end;

procedure TMainForm.Bt_canClick(Sender: TObject);
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
  Lgubun : integer;
  ToMail : string;
  SqlText : string;
  i : integer;
  sTmp1, sTmp2 : string;
begin
  // 선임자를 선택하지 않고 바로 팀장이 모든 일을 다 함으로 반려를 우선 못쓰게 함..

  Msg := '[반려] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
    System.Exit;

  St_Help.Panels[0].Text := ' 반려 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);

  MessageDlg('선임자에게 반려메일이 발송됩니다.',mtInformation,[mbOK],0);

  SqlText := Format(' update pehaimhis_com set ' +
                    ' eobjyn = ''Y'' '+
                    ' WHERE RABASDATE =  ''%s'' '+// AND DEPTCODE  = ''%s'' '+
                    //' AND WRITEEMP = ''%s'' ',
                    ' AND EEMPNO = ''%s'' ',
                    //   [Lrabasdate, vDeptcode, pEmpno ]);
                       [Lrabasdate, pEmpno ]);
  St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';

  DataModule_Tmax.Cupd_SQL := Sqltext;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
     Messagedlg('APP-Server Error',mtError,[mbOK],0);
     Exit;
  end;
  showmessage('[반려] 처리 되었습니다.');
  St_Help.Panels[0].Text := '';
  sGrid1.RowCount := 2;

  //Bt_Confirm.Enabled := false;
  //Read_pehaimhis_com;
  //선임을 찾아서 반려메일을 보낸다.
  //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경 20051025JSH
  SqlText := ' SELECT NVL(A.EMPNO,'''')||'';''||NVL(A.KORNAME,'''')||'';''||B.CODENAME||'';''|| '+
                        ' NVL(A.UNIONYN,''N'')||'';''||NVL(A.SENIORYN,''N'') '+
                   ' FROM PEHREAIM_COMBAS A, PYCCODE B '+
                  ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' '+
                    ' AND A.SENIORYN = ''Y'' '+
        	    ' AND SUBSTR(A.DEPTCODE,1,4) IN (SELECT SUBSTR(DEPTCODE,1,4) FROM PEHREAIM_COMBAS '+
                                                     ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+' AND EMPNO = '''+pEmpno+''''+')'+
                    ' AND A.PAYCL = B.CODENO AND B.CODEID = ''I112'' AND B.USEYN = ''Y'' '+
                   ' ORDER BY A.SENIORYN desc, A.PAYCL, A.PAYRA, A.EMPNO';

  with DB_PIMPMAS do
  begin
     Close;
     ServiceName := 'PEA1060A_common';
     ClearFieldInfo;
     AddField('SEL_DATA', ftString, 300);
     ClearParamInfo;
     SQL.Text := SqlText;
     Open;

     if RecordCount > 0 then
     begin
        sTmp1:= Csel_gfd3(1);
        sTmp2:= Csel_gfd3(2);
     end;
     close;
  end;

  //==============================================================================//
  // 메일을 보낸다.
  MessageDlg('공동목표설정 평가자 반려메일이 발송됩니다.',mtInformation,[mbOK],0);
  SendProgID  := 'PEA1060B';  //프로그램 ID
  SendEmpno   := Pempno;      //발송자(로그인 사번)
  RcveEmpno   := sTmp1;
  MailSubject := '[ 공동목표설정 평가자 반려메일 ]';
  MailBody    := '공동목표설정을 반려했습니다. 다시 설정하여 주십시오.';
  ReceiveYN   := 'N';
  //if ChkReceive.Checked then ReceiveYN := 'Y';

  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else
  begin
       MessageDlg('메일전송중 에러가 발생하였습니다.',mtError,[mbOK],0);
       System.Exit;
  end;
  //==============================================================================//

  Bt_SrhClick(self);
end;

function TMainForm.VersionGetting(PgmId,sVer : string) : Boolean;
begin

end;

procedure TMainForm.Select_Form(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0 : begin                                        // 업무목표
          Bt_Tgt.Font.Color := clPurple;
          Bt_Dev.Font.Color := clBlack;

          if (Pa_jobgun.Hint = '11') OR (Pa_jobgun.Hint = '33') OR (Pa_jobgun.Hint = '44') then
          begin
            Nt_Book.ActivePage := '관리직';
          end;
        end;
    1 : begin                                        //자기계발
          Bt_Tgt.Font.Color  := clBlack;
          Bt_Dev.Font.Color  := clPurple;
          Nt_Book.ActivePage := '자기계발';
        end;
  end;
end;

procedure TMainForm.Bt_TgtClick(Sender: TObject);
begin
  Application.ProcessMessages;
  Select_Form(Sender);
  Bt_SrhClick(Sender);
end;

function TMainForm.Get_Code(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

function TMainForm.Get_Dept(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('deptname' ,Acodeid,Acodeno);
end;

procedure TMainForm.btn_PrintClick(Sender: TObject);
begin
  if ((DM.DBSET1.Eof) and (DM.DBSET1.Bof)) then
  begin
   MessageDlg('출력할 데이터가 없습니다.'+#13+#10+''+#13+#10+'출력 작업은 취소 되었습니다.', mtError, [mbOK], 0);
   System.Exit;
  end;
  PrintForm.PeQuickRepPrn1.Preview;
end;

function TMainForm.Check_Edit1 : Boolean;
var
  i : integer;
begin
  Result := False;

  //showmessage(inttostr(sGr1Rowcount));
  if sGr1Rowcount <= 0 then
  begin
     MessageDlg('공동목표 데이터가 없습니다. 추가 입력을 하셔야 합니다.',mtError,[mbOK],0);
     System.Exit;
  end;

  for i := 1 to sGr1Rowcount do
  begin
     if (sGrid1.Cells[4,i] <> '') and
        ((sGrid1.Cells[6,i] = '') or (sGrid1.Cells[7,i] = '') or (sGrid1.Cells[8,i] = '') or
         (sGrid1.Cells[9,i] = '') or (sGrid1.Cells[10,i] = '') or (sGrid1.Cells[11,i] = '')
        )
     then
     begin
        MessageDlg(sGrid1.Cells[4,i] + '의 항목을 모두 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
     end;
  end;

  Result := True;
end;

procedure TMainForm.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Left : integer;
begin
{ if (ARow > 0) and (ACol = 3) then
   begin
      if (trim(sGrid1.Cells[ACol,ARow]) <> '')  and (trim(sGrid1.Cells[ACol,ARow]) <> '100') then
      begin
         sGrid1.Canvas.Font.Color  := clRed;
         sGrid1.Canvas.FillRect(Rect);
         Left := Rect.Right - sGrid1.Canvas.TextWidth(sGrid1.Cells[ACol,ARow]) - 3;
         sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
      end
      else
      begin
         sGrid1.Canvas.Font.Color  := clBlack;
         sGrid1.Canvas.FillRect(Rect);
         Left := Rect.Right - sGrid1.Canvas.TextWidth(sGrid1.Cells[ACol,ARow]) - 3;
         sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
      end;
   end
   else
   begin
      Left := Rect.Left +3;
      sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
   end;
}
    Left := Rect.Left +3;
    sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow])

end;

function TMainForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet1.FieldByName('SEL_DATA').AsString;
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

function TMainForm.Csel_gfd1(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DB_Chk_Set.FieldByName('SEL_DATA').AsString;
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

function TMainForm.Csel_gfd2(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DB_ComBas.FieldByName('SEL_DATA').AsString;
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


function TMainForm.Csel_gfd3(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DB_PIMPMAS.FieldByName('SEL_DATA').AsString;
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

function TMainForm.Csel_gfd10(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet10.FieldByName('SEL_DATA').AsString;
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

Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       ServiceName := 'PIT1030A_DML';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                         ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
       SQL.Add('        ''''                  )             ');  //EAI_DATE

       try
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  SqlText : string;
  sDepcode : string;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  if Start then
  begin
    pEmpno   := peParam(CmdLine,1);
    pKorname := peParam(CmdLine,2);
    pPass    := peParam(CmdLine,3);
    pClass   := peParam(CmdLine,4);
    ComIp    := peParam(Cmdline,5);
    ComIP    := Copy(ComIP,2,Length(ComIP)-1);

    Application.Title  := '공 동 목 표 등 록 화 면';

    Lrabasdate := GetBaseYear(1);            //업적평가 기준일
    Lfordate   := GetBaseYear(2);            //하반기 업적평가 시작일(LFordate)
    Lsysdate   := Copy(GetBaseYear(3),1,8);  //시스템 시각(Lsysdate)
    Lorgnum    := GetBaseYear(5);            //현 조직차수

    if Lrabasdate = '' then
    begin
      Close;
    end;

    //사용자 권한체크
    {SqlText := ' select payra||'';''||nvl(senioryn,''N'') from PEHREAIM_COMBAS '+
               ' where  rabasdate =  ''' + Lrabasdate + ''' '+
               ' and    empno = ''' + pEmpno + ''' '+
               ' and    unionyn = ''Y'' ';
    }

    //망운용팀, 망통제팀, 각 해당 지사팀
    SqlText := ' SELECT payra||'';''||nvl(senioryn,''N'')                            '+
               ' FROM                                                                '+
               ' (                                                                   '+
               '   SELECT a.payra, a.senioryn                                        '+
               '   FROM pehreaim_combas a, pycdept b                                 '+
               '   WHERE substr(a.deptcode,1,4) = substr(b.deptcode,1,4)             '+
               '   AND   a.rabasdate = ''' + Lrabasdate + '''                        '+
               '   AND   a.senioryn  = ''Y''                                         '+
//               '   AND   b.orgnum = ''' + Lorgnum + '''                              '+
//               '   AND   ((b.deptna3 like ''%운용%'') or (b.deptname like ''%망%'')) '+
               '   AND   a.empno = ''' + pEmpno + '''                                '+
               ' )                                                                   ';

   // Edit1.Text := SqlText;
   // Exit;

    with DBSet10 do
    begin
      close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      //개인별공동목표등록내용이 존재하면 다음처리루틴을 따른다.
      if RecordCount > 0 then
      begin
         //showmessage(Csel_gfd10(1));
         //showmessage(Csel_gfd10(2));

         //if (Csel_gfd10(1) <> '2C') and (Csel_gfd10(2) = 'N') then  //팀장과 선임자만 등록가능.

         if  ((Csel_gfd10(1) <> '2C' ) and (Csel_gfd10(1) <> '58' )) and //팀장만 공동목표 등록가능. 팀장이 선임역활까지 한꺼번에 처리위함.
             ((Csel_gfd10(1) <> 'C11') and (Csel_gfd10(1) <> 'C15')) then //팀장만 공동목표 등록가능. 팀장이 선임역활까지 한꺼번에 처리위함.
         begin
            showmessage('공동목표는 망운용팀,망통제팀,해당지사 운용 팀장님만 등록하셔야 합니다.'
                        + #13 + '다른 분들은 이곳에서 등록하시면 안됩니다.');
            close;
            Bt_ExitClick(self);
         end;
      end
      else
      begin
         showmessage('공동목표는 망운용팀,망통제팀, 해당지사 운용 팀장님만 등록하셔야 합니다.'
                        + #13 + '다른 분들은 이곳에서 등록하시면 안됩니다.');
         close;
         Bt_ExitClick(self);
      end;
      close;

    end;

    // 1차평가자 최종결재 및 결재시 이력보관
    gsLastConEv:= '1차';//trim(GetBaseYear(4)); //업무목표최종결재자 (1차 or 2차)

    Ed_empno.LabelHint := Pempno;

    GetPehremas('읽기') ;

   // sDepcode
   // showmessage(vDeptcode);

    if GetPehremas('추출') = '없음' then
    begin
      MessageDlg('목표설정 대상자가 아니거나 평가권한이 없습니다.'+#13#13+
                 GetBaseYear(7)+'에 문의하십시오.',mtInformation,[mbOK],0);
      Close;
    end
    else
    begin
      if GetPehremas('구분') <> '없음' then
      begin
        //showmessage(vDeptcode);
        sDepcode := vDeptcode;
        GetPehremas('읽기');

        //showmessage(vDeptcode);

        EvalYN := True;
        Select_Form(Bt_Tgt);
        //Ed_empnoRightBtnClick(Sender);
        //showmessage('a');
        //팀장일때...
        //Read_pehaimhis_com;
        //if (sDepcode <> '') and (vDeptcode = '') then
        //    vDeptcode:= sDepcode;
        //showmessage(vDeptcode);

        Bt_TgtClick(Bt_Tgt);

      end
      else
      begin
        //showmessage('b');
        Bt_TgtClick(Bt_Tgt);
        EvalYN := False;
        // 권한여부를 체크한다.

        //H10차로 인한 deptcode,1,3->deptcode,1,4 로 변경
        //선임자일경우 .. 결제상신여부를 체크한다. 이때 반려여부도 같이 체크 해야 함.
        SqlText := 'SELECT  RABASDATE ||'';''|| NVL( EOBJYN,''N'') '+
                    ' FROM pehaimhis_com '+
//                   ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND SUBSTR(DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) + ''' AND WRITEEMP = ''' + pEmpno + ''' ';
                   ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND SUBSTR(DEPTCODE,1,4) = ''' + copy(vDeptcode,1,4) +''' ';

        with DB_Chk_Set do
        begin
            Close;
            ServiceName := 'PEA1060A_common';
            ClearFieldInfo;
            AddField('SEL_DATA', ftString, 300);
            ClearParamInfo;
            SQL.Text := SqlText;
            Open;

            if RecordCount > 0 then
            begin
                //접속한 사용자 id로 결제상신 여부 및 반려 여부를 체크함.
                //반려여부가 N이면 결제상신처리까지 된 자료이므로 단순 조회만 되어야 함.
                //showmessage(Csel_gfd1(2));
                if Csel_gfd1(2) = 'N' then
                begin
                   Bt_Mod.Enabled := false;
                   Bt_Add.Enabled := false;
                   Bt_del.Enabled := false;
                   Bt_Opt.Enabled := false;
                   Bt_Confirm.Enabled := false;
                end
                //반려여부가 Y이 이므로 결제상신처리 후 반려처리가 된자료이므로 추가,수정,삭제 처리를
                //할수 있도록 해야함.
                else
                begin

                end;
            end;
        end;
      end;
      //if (sDepcode <> '') and (vDeptcode = '') then
      //   vDeptcode:= sDepcode;
    end;

   Start := False;

   sGrid1.Cells[1,0] := 'No';
   sGrid1.Cells[2,0] := '매체명';
   sGrid1.Cells[3,0] := '비중';
   sGrid1.Cells[4,0] := '세부추진활동';
   sGrid1.Cells[5,0] := '상세비중';
   sGrid1.Cells[6,0] := '평가지표';
   sGrid1.Cells[7,0] := '탁월';
   sGrid1.Cells[8,0] := '우수';
   sGrid1.Cells[9,0] := '보통';
   sGrid1.Cells[10,0]:= '미흡';
   sGrid1.Cells[11,0]:= '저조';

   Bt_SrhClick(nil); //JSH 추가... 제대로 다시 조회해오도록.
  end;
end;

end.
