{-------------------------------------------------------------------------------
  PROGRAM-NAME   : psc2040a(인출신청관리)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 복리후생/우리사주
  Programmer     : 김영대
  Version        : 1.0.0
  Date           : 1997.10.31
  Update Contents
    Version  date(yyyy.mm.dd) programmer  description       relevant doc.no
    1.00  98.10.30        이수임      상세처리명세서     신규프로그램개발
   30.00  1999.03.02      김승회      계산로직변경       업무로직변경 => 퇴직반환에 따른 인출신청기능추가
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능, 주식주수로도 신청가능
   30.03  2001.02.21      서혜미                         화면출력 추가
   40.00  2003.12.12      유효성      종합인사 개선작업
   40.01  2004.06.30      이민용      CI작업
-------------------------------------------------------------------------------}
unit PSC20401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, numedit,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnEditNumCtl, Mask, OnEditMdate, OnTmaxCodeEdit, Grids, DBGrids,
  OnShapeLabel, OnGrDBGrid, OnInsaCommon, OnFocusButton, Kylib1, shellapi,
  Tmax_session, OnScheme, TmaxFunc;

type
  TMainForm = class(TForm)
    Panel_Body: TPanel;
    CDS_psowhis: TTMaxDataSet;
    CDS_psdphis: TTMaxDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    TDS1: TTMaxDataSet;
    TDS_dml1: TTMaxDataSet;
    TDS_Gen: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Panel_Button: TPanel;
    StatusBar1: TStatusBar;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    E_empno: TTMaxPersonPopupEdit;
    P_owstcnt: TOnEdit;
    NE_owstcnt: TOnNumberEdit;
    P_juminid: TOnEdit;
    P_depositno: TOnEdit;
    L_bspassyn: TLabel;
    E_telno: TOnEdit;
    P_orgnum: TOnEdit;
    P_deptcode: TOnEdit;
    P_deptname: TOnEdit;
    P_paycl: TOnEdit;
    P_payclNAME: TOnEdit;
    OnShapeLabel3: TOnShapeLabel;
    Panel13: TPanel;
    M_intrtp: TMemo;
    ME_subdate: TOnDateEdit;
    E_wdissue: TTMaxCodePopupEdit;
    P_wdissueNAME: TOnEdit;
    NE_Substcnt: TOnNumberEdit;
    NE_subamt: TOnNumberEdit;
    ME_wdidate: TOnDateEdit;
    E_objaddr: TOnEdit;
    E_inmarkname: TTMaxCodePopupEdit;
    P_inmarkname: TOnEdit;
    E_instrname: TOnEdit;
    E_inaccnum: TOnEdit;
    E_inname: TOnEdit;
    SB_pswddis: TOnFocusButton;
    OnShapeLabel4: TOnShapeLabel;
    P_appamt: TOnShapeLabel;
    P_wddate: TOnEdit;
    P_wdstcnt: TOnEdit;
    P_wdamt: TOnEdit;
    DbGrid1: TOnGrDbGrid;
    DbGrid2: TOnGrDbGrid;
    OnShapeLabel5: TOnShapeLabel;
    BB_Insert: TOnFocusButton;
    BB_stockview: TOnFocusButton;
    BB_Save: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BBprint: TOnFocusButton;
    BB_Close: TOnFocusButton;
    P_appdate: TOnShapeLabel;
    BB_find: TOnFocusButton;

    procedure E_empnoEnter(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_wdissueChange(Sender: TObject);
    procedure SB_pswddisClick(Sender: TObject);
    procedure E_inmarknameChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ME_wdidateExit(Sender: TObject);
    procedure BB_insertClick(Sender: TObject);
    procedure BB_stockviewClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure E_empnoReadEnded(Sender: TObject);
    procedure BB_findClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sqlstr : String;
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission, FG_Date : string;
    Save_EMPNO, Save_SUBDATE, Save_Flag : String;
    { Public declarations }
    Job_mode: Integer;  {0.열람/무효, 1.입력, 2.수정}
    procedure GetAllData;
    procedure RetrieveData;
    procedure GetPsdphis;
    procedure DataAllClear;
    function  Get_CodeName( CodeId, CodeNo : String ) : String;
  end;

var
  MainForm: TMainForm;

implementation

uses psc20402, psc20403;

{$R *.DFM}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '인사시스템에 접속 중입니다...';

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
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  StatusBar1.Panels[1].Text := '';
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Pempno   := HInsa_Param(CmdLine, 1);
  Pkorname := HInsa_Param(CmdLine, 2);
  Password := HInsa_Param(CmdLine, 3);
  Ppermission := copy(HInsa_Param(CmdLine,4),4,1); {복리후생 권한}

  if not ((Ppermission = 'A') or (Ppermission = 'B') or (Ppermission = 'C'))
  then
  begin
       E_empno.Enabled := False; {권한이 A나B나C가 아니면 사번변경 못함}
       //BB_find.Enabled := False;
  end;

  Save_EMPNO   := '';
  Save_SUBDATE := '';
  E_empno.Text := Pempno;
  E_empno.PL_get_singledata;
end;

procedure TMainForm.GetAllData;
begin
  with TDS1 do
  begin
      ServiceName := 'PSC2040A_sel8';
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.EMPNO,    A.KORNAME,     A.JUMINID,  A.PAYCL,  ');
      Sql.Add('       CODENAME,   A.ORGNUM,      A.DEPTCODE, B.DEPTNAME');
      Sql.Add('  FROM PIMPMAS A, PYCDEPT B, PYCCODE C                  ');
      Sql.Add(' WHERE A.EMPNO   = '''+E_empno.empno+'''                ');
      Sql.Add('   AND A.ORGNUM   = B.ORGNUM(+)                         ');
      Sql.Add('   AND A.DEPTCODE = B.DEPTCODE(+)                       ');
      Sql.Add('   AND ''I112''   = CODEID(+)                           ');
      Sql.Add('   AND PAYCL      = CODENO(+)                           ');

      ClearFieldInfo;
      AddField('EMPNO'   , ftString,  4   );
      AddField('KORNAME' , ftString,  12  );
      AddField('JUMINID' , ftString,  14  );
      AddField('PAYCL'   , ftString,  3   );
      AddField('CODENAME', ftString,  20  );
      AddField('ORGNUM'  , ftString,  3   );
      AddField('DEPTCODE', ftString,  6   );
      AddField('DEPTNAME', ftString,  60  );
      Open;
  end;

  P_juminid.Text   := TDS1.FieldByName('JUMINID').AsString;
  P_paycl.Text     := TDS1.FieldByName('PAYCL').AsString;
  P_payclNAME.Text := TDS1.FieldByName('CODENAME').AsString;
  P_orgnum.Text    := TDS1.FieldByName('ORGNUM').AsString;
  P_deptcode.Text  := TDS1.FieldByName('DEPTCODE').AsString;
  P_deptname.Text  := TDS1.FieldByName('DEPTNAME').AsString;

  sqlstr := 'SELECT nvl((SELECT sum(REMCNT) FROM PSDPHIS WHERE EMPNO = a.EMPNO),0) OWSTCNT,'+
            '       nvl(a.telno           ,'' ''),                                         '+
            '       nvl(a.depositno       ,'' '')                                          '+
            '  FROM PSSTMAS  a                                                             '+
            ' WHERE EMPNO = '''+E_empno.empno+'''                                          ';
  with TDS1 do
  begin
      ServiceName := 'PSC2040A_sel3';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);
      ClearFieldInfo;
      AddField('OWSTCNT'  , ftInteger,  7   );
      AddField('TELNO'    , ftString ,  15  );
      AddField('DEPOSITNO', ftString ,  6   );
      Open;
  end;

  if TDS1.recordcount <= 0 then
  begin
      TDS1.Close;
      Application.ProcessMessages;
      MessageBox(handle, '보유하신 주식수가 없습니다. ',
                         '작업안내', MB_ICONWARNING);
  end
  else
  begin
      P_owstcnt.Text      := Format('%7.0n', [TDS1.FieldByName('OWSTCNT').AsFloat]);  // 보유주수
      NE_owstcnt.Value    := TDS1.FieldByName('OWSTCNT').AsFloat;    // 화면에 안 나타남
      P_depositno.Text    := TDS1.FieldByName('DEPOSITNO').AsString; // 예탁번호
      E_telno.Text        := TDS1.FieldByName('TELNO').AsString;     // 연락처
      TDS1.Close;
      Application.ProcessMessages;

      GetPsdphis;   //예탁현황

      RetrieveData; //인출이력

      BB_find.SetFocus;
  end;
end;

procedure TMainForm.GetPsdphis;
var
  ParamVariant : String;
begin
  Application.ProcessMessages;
  CDS_psdphis.Close;

  ParamVariant :=  'SELECT  nvl(sdivseqnum     , 0 ),             '+
                   '        nvl(divseqnum      , 0 ),             '+
                   '        nvl(dpstcnt        , 0 ),             '+
                   '        nvl(remcnt         , 0 ),             '+
                   '        nvl(orgremcnt      , 0 )              '+
                   ' FROM PSDPHIS                                 '+
                   ' WHERE EMPNO = ''' + E_empno.empno + '''      '+
                   ' ORDER BY SDIVSEQNUM desc ';

  with CDS_psdphis do
    begin
      ServiceName :='PSC2040A_sel2';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('SDIVSEQNUM'   , ftString  ,  3   );
      AddField('DIVSEQNUM'    , ftFloat   ,  3   );
      AddField('DPSTCNT'      , ftFloat   ,  6   );
      AddField('REMCNT'       , ftFloat   ,  6   );
      AddField('ORGREMCNT'    , ftFloat   ,  6   );
      Open;
      FieldByName('SDIVSEQNUM').Alignment := taCenter;
      TFloatField(FieldByName('DPSTCNT')).DisplayFormat   := '#,##0';
      TFloatField(FieldByName('REMCNT')).DisplayFormat    := '#,##0';
      TFloatField(FieldByName('ORGREMCNT')).DisplayFormat := '#,##0';
    end;
end;

procedure TMainForm.RetrieveData;
var
  ParamVariant : String;
begin
  Job_mode := 0;

  DataAllClear;
  CDS_psowhis.Close;              

  ParamVariant := 'SELECT NVL(A.EMPNO        ,'' '')  EMPNO     , '+
                  '       NVL(A.KORNAME      ,'' '')  KORNAME   , '+
                  '       NVL(A.DEPOSITNO    ,'' '')  DEPOSITNO , '+
                  '       NVL(A.JUMINID      ,'' '')  JUMINID   , '+
                  '       NVL(A.PAYCL        ,'' '')  PAYCL     , '+
                  '       NVL(A.ORGNUM       ,'' '')  ORGNUM    , '+
                  '       NVL(A.DEPTCODE     ,'' '')  DEPTCODE  , '+
                  '       NVL(A.TELNO        ,'' '')  TELNO     , '+
                  '       NVL(A.SUBDATE      ,'' '')  SUBDATE   , '+
                  '       NVL(A.SUBAMT       ,  0  )  SUBAMT    , '+
                  '       NVL(A.SUBSTCNT     ,  0  )  SUBSTCNT  , '+
                  '       NVL(A.WDISSUE      ,'' '')  WDISSUE   , '+
                  '       NVL(A.WDIDATE      ,'' '')  WDIDATE   , '+
                  '       NVL(A.OBJADDR      ,'' '')  OBJADDR   , '+
                  '       NVL(A.REQDATE      ,'' '')  REQDATE   , '+
                  '       NVL(A.REQYN        ,'' '')  REQYN     , '+
                  '       NVL(A.REQYNDATE    ,'' '')  REQYNDATE , '+
                  '       NVL(A.WDYN         ,'' '')  WDYN      , '+
                  '       NVL(A.WDYNDATE     ,'' '')  WDYNDATE  , '+
                  '       NVL(A.WDDATE       ,'' '')  WDDATE    , '+
                  '       NVL(A.WDSTCNT      ,  0  )  WDSTCNT   , '+
                  '       NVL(A.APPDATE      ,'' '')  APPDATE   , '+
                  '       NVL(A.APPAMT       ,  0  )  APPAMT    , '+
                  '       NVL(A.WDAMT        ,  0  )  WDAMT     , '+
                  '       NVL(INMARKNAME     ,'' '')  INMARKNAME, '+
                  '       NVL(INSTRNAME      ,'' '')  INSTRNAME , '+
                  '       NVL(INACCNUM       ,'' '')  INACCNUM  , '+
                  '       NVL(INNAME         ,'' '')  INNAME    , '+
                  '       NVL(DEPTNAME       ,'' '')  DEPTNAME  , '+
                  '       NVL(CODENAME       ,'' '')  CODENAME    '+
                  '  FROM PSOWHIS A, PSSTMAS B, PYCDEPT C, PYCCODE D '+
                  ' WHERE A.EMPNO    = '''+E_empno.empno + '''    '+
                  '   AND B.EMPNO    = '''+E_empno.empno + '''    '+
                  '   AND A.ORGNUM   = C.ORGNUM                   '+
                  '   AND A.DEPTCODE = C.DEPTCODE                 '+
                  '   AND CODEID     = ''I112''                   '+
                  '   AND CODENO     = PAYCL                      '+
                  ' ORDER BY A.SUBDATE DESC ';

  with CDS_psowhis do
    begin
      ServiceName := 'PSC2040A_sel1';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('EMPNO'     , ftString, 4);
      AddField('KORNAME'   , ftString, 12);
      AddField('DEPOSITNO' , ftString, 6);
      AddField('JUMINID'   , ftString, 14);
      AddField('PAYCL'     , ftString, 3);
      AddField('ORGNUM'    , ftString, 3);
      AddField('DEPTCODE'  , ftString, 6);
      AddField('TELNO'     , ftString, 15);
      AddField('SUBDATE'   , ftString, 8);
      AddField('SUBAMT'    , ftFloat,  9);
      AddField('SUBSTCNT'  , ftFloat,  9);
      AddField('WDISSUE'   , ftString, 3);
      AddField('WDIDATE'   , ftString, 8);
      AddField('OBJADDR'   , ftString, 60);
      AddField('REQDATE'   , ftString, 8);
      AddField('REQYN'     , ftString, 1);
      AddField('REQYNDATE' , ftString, 8);
      AddField('WDYN'      , ftString, 1);
      AddField('WDYNDATE'  , ftString, 8);
      AddField('WDDATE'    , ftString, 8);
      AddField('WDSTCNT'   , ftFloat,  6);
      AddField('APPDATE'   , ftString, 8);
      AddField('APPAMT'    , ftFloat,  9);
      AddField('WDAMT'     , ftFloat,  9);
      AddField('INMARKNAME', ftString, 20);
      AddField('INSTRNAME' , ftString, 20);
      AddField('INACCNUM'  , ftString, 20);
      AddField('INNAME'    , ftString, 20);
      AddField('DEPTNAME'  , ftString, 60);
      AddField('CODENAME'  , ftString, 20);
      Open;
      DataSource1.OnDataChange := Nil;
      FieldByName('SUBDATE').EditMask := '!9999/99/99;0;_';
      FieldByName('REQYN').Alignment  := taCenter;
      FieldByName('WDYN').Alignment   := taCenter;
      DataSource1.OnDataChange := DataSource1DataChange;   
    end;

  if CDS_psowhis.eof then
  begin
       StatusBar1.Panels[1].Text := '사번('+E_empno.empno+')의 신청된 자료가 한건도 없습니다.';
       BB_find.SetFocus;
  end
  else
  begin
       {if CDS_psowhis.Locate('EMPNO',VarArrayOf([Save_EMPNO]), [loPartialKey]) then
       begin
            while Not CDS_psowhis.Eof do
            begin
              if CDS_psowhis.FieldByName('SUBDATE').AsString = Save_SUBDATE then Exit
              else DBGrid1.SetFocus;
              CDS_psowhis.Next;
            end;
       end;}
       StatusBar1.Panels[1].Text := '조회되었습니다.';
  end;
end;

procedure TMainForm.DataAllClear;
begin
  ME_subdate.NoFormatDate  := '';
  NE_subamt.Value          := 0;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
  NE_substcnt.Value     := 0;

  //  CB_6thwithdrawal.Checked := True;
  E_wdissue.Text        := '';
  P_wdissueNAME.Text    := '';
  ME_wdidate.NoFormatDate        := '';
  E_objaddr.Text        := '';

  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : Clear 항목추가
  // =================================================

  E_inmarkname.Text     := '';
  E_instrname.Text      := '';
  E_inaccnum.Text       := '';
  E_inname.text         := '';

  M_intrtp.Lines.Clear;

  P_wddate.Text         := '';
  P_wdstcnt.Text        := '';
  P_appamt.ValueCaption := '';
  P_appdate.ValueCaption:= '';
  P_wdamt.Text          := '';
end;

procedure TMainForm.E_empnoEnter(Sender: TObject);
begin
  P_juminid.Text      := '';
  E_telno.Text        := '';
  P_paycl.Text        := '';
  P_payclNAME.Text    := '';
  P_owstcnt.Text      := '';
  NE_owstcnt.Value    := 0 ;
  P_depositno.Text    := '';
  P_orgnum.Text       := '';
  P_deptcode.Text     := '';
  P_deptname.Text     := '';
  DataAllClear;   
end;

procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  E_empno.PL_get_singledata;
end;

procedure TMainForm.E_wdissueChange(Sender: TObject);
begin
  if length(E_wdissue.Text) <> 3 then exit;

  SB_pswddis.Enabled := False;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
  if E_wdissue.text = '' then
    begin
      NE_Substcnt.Enabled := True;
      NE_subamt.Enabled   := True;
    end
  else if E_wdissue.text = '811' then
    begin
      NE_Substcnt.Enabled := True;
      NE_subamt.Value     := 0;
      NE_subamt.Enabled   := False;
    end
  else
    begin
      NE_Substcnt.Value   := 0;
      NE_Substcnt.Enabled := False;
      NE_subamt.Enabled   := True;
    end;

  if (Job_mode = 1) and // 입력
     ((E_wdissue.text = '001') or
      // =================================================
      // 1. 수 정 일 : 1999.04.08
      // 2. 수 정 자 : 김승회
      // 3. 수정내용 : 데이콤용을 하나로용으로 Conversion
      // =================================================

      //(E_wdissue.text = '111') or
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
 	30.00  1999.03.02      김승회      계산로직변경       업무로직변경 => 퇴직반환에 따른 인출신청기능추가
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
      //(E_wdissue.text = '811') or
      (E_wdissue.text = '999'))
  then
    begin
      MessageBox(Handle, '이 인출사유는 입력할 수 없습니다.', '입력오류', MB_ICONWARNING);
      E_wdissue.Text := '';
      P_wdissueNAME.Text := '';
      System.Exit;
    end;

  if Copy(E_wdissue.text,1,1) = '2' then
    SB_pswddis.Enabled := True;

  sqlstr :=  'SELECT  NVL(INTRPT   ,'' '') '+
             '  FROM  PSWDIBAS             '+
             ' WHERE  WDISSUE = '''+E_wdissue.text+''' ';

  with TDS1 do
    begin
      ServiceName := 'PSC2040A_common';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('INTRPT'       , ftString    ,  2000 );
      Open;
    end;

  if not TDS1.eof  then
    M_intrtp.Lines.Text := TDS1.FieldByName('INTRPT').AsString  // 제출서류
  else
    M_intrtp.Lines.Clear;

  P_wdissueNAME.Text := Get_CodeName('S210', E_wdissue.text);

end;

function TMainForm.Get_CodeName( CodeId, CodeNo : String ) : String;
begin
  with TDS1 do
    begin
      ServiceName := 'PSC2040A_common';
      Close;
      Sql.Clear;
      Sql.Add('SELECT CODENAME  SEL_DATA                   ');
      Sql.Add('  FROM PYCCODE                              ');
      Sql.Add(' WHERE CODEID = '''+CodeId+'''              ');
      Sql.Add('   AND CODENO = '''+CodeNo+'''              ');

      ClearFieldInfo;
      AddField('SEL_DATA'     , ftString,  2000);
      Open;

      if TDS1.Eof then
        begin
          Result := '';
          System.exit;
        end
      else
        Result := TDS1.FieldByName('SEL_DATA').AsString;
    end;
 end;


procedure TMainForm.SB_pswddisClick(Sender: TObject);
begin
  if (Copy(E_wdissue.Text,1,1) <> '2') or (Length(E_wdissue.Text) <> 3) then
    System.Exit;

  try
    DetailForm := TDetailForm.Create(self);
    DetailForm.ShowModal;
  finally
    DetailForm.free;
  end;

  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 데이콤용을 하나로용으로 Conversion
  // =================================================


  sqlstr :=  'select  nvl(to_char(count(*)        ),''0'') cnt,       '+
             '        nvl(        min(sdate)       ,'' '') min_sdate, '+
             '        nvl(to_char(sum(samt)       ),''0'') samt_sum   '+
             '  from  pswddis                                         '+
             ' where  empno   = ''' + E_empno.empno + '''              '+
             '   and  subdate = ''' + ME_subdate.NoformatDate + '''           ';

  with TDS1 do
    begin
      ServiceName := 'PSC2040A_sel4';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('CNT'          , ftString    ,  12  );
      AddField('MIN_SDATE'    , ftString    ,  8   );
      AddField('SAMT_SUM'     , ftString    ,  12  );

      Open;
    end;

  if TDS1.FieldByName('cnt').AsInteger > 0 then
    begin
      ME_wdidate.NoFormatDate := TDS1.FieldByName('min_sdate').AsString;
      NE_subamt.value := TDS1.FieldByName('samt_sum').AsFloat;
    end
  else
    begin
      ME_wdidate.NoFormatDate := '';
      NE_subamt.value := 0;
    end;

end;

procedure TMainForm.E_inmarknameChange(Sender: TObject);
begin
  P_inmarkname.Text := Get_CodeName('K930', E_inmarkname.text);
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if CDS_psowhis.eof then
  begin
    Job_mode := 0;
    System.Exit;
  end;
  Job_mode := 2;  // 수정

  Save_EMPNO   := E_empno.empno;
  Save_SUBDATE := CDS_psowhis.FieldByName('SUBDATE').AsString;

  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 우리사주 마스터 관련자료 조회기능 추가
  // =================================================

  E_inmarkname.Text   := '1818';

  E_inmarkname.Text   := CDS_psowhis.FieldByName('inmarkname').AsString;
  E_instrname.Text    := CDS_psowhis.FieldByName('INSTRNAME').AsString;
  E_inaccnum.Text     := CDS_psowhis.FieldByName('INACCNUM').AsString;
  E_inname.text       := CDS_psowhis.FieldByName('INNAME').AsString;

  P_juminid.Text      := CDS_psowhis.FieldByName('JUMINID').AsString;
  E_telno.Text        := CDS_psowhis.FieldByName('TELNO').AsString;
  P_paycl.Text        := CDS_psowhis.FieldByName('PAYCL').AsString;
  P_payclNAME.Text    := CDS_psowhis.fieldbyname('codename').AsString;
  P_depositno.Text    := CDS_psowhis.FieldByName('DEPOSITNO').AsString;
  P_orgnum.Text       := CDS_psowhis.FieldByName('ORGNUM').AsString;
  P_deptcode.Text     := CDS_psowhis.FieldByName('DEPTCODE').AsString;
  P_deptname.Text     := CDS_psowhis.fieldbyname('deptname').AsString;

  ME_subdate.NoFormatDate  := CDS_psowhis.FieldByName('SUBDATE').AsString;
  NE_subamt.Value          := CDS_psowhis.FieldByName('SUBAMT').AsFloat;
 {-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
 Query_psowhis : TQuery의 SUBSTCNT추가(Displaymask:= #,##0)
--------------------------------------------------------------------------------}
  NE_substcnt.Value   := CDS_psowhis.FieldByName('SUBSTCNT').AsFloat;

 {
  if CDS_psowhis.FieldByName('PSDPSP_EMPNO.AsString <> '' then
    CB_6thwithdrawal.Checked := True  //6차 예탁분 인출
  else
    CB_6thwithdrawal.Checked := False;
  }

  E_wdissue.text  := CDS_psowhis.FieldByName('WDISSUE').AsString;
  if E_wdissue.Text <> '' then
    P_wdissueNAME.Text    := Get_CodeName('S210', E_wdissue.text)
  else
    P_wdissueNAME.Text    := '';

  ME_wdidate.NoFormatDate := CDS_psowhis.FieldByName('WDIDATE').AsString;
  E_objaddr.Text  := CDS_psowhis.FieldByName('OBJADDR').AsString;

  if CDS_psowhis.FieldByName('WDDATE').AsString <> '' then
    P_wddate.Text     := Copy(CDS_psowhis.FieldByName('WDDATE').AsString,1,4)+'.'+
                         Copy(CDS_psowhis.FieldByName('WDDATE').AsString,5,2)+'.'+
                         Copy(CDS_psowhis.FieldByName('WDDATE').AsString,7,2)
  else
    P_wddate.Text     := '';

  P_wdstcnt.Text    := Format('%6.0n', [CDS_psowhis.FieldByName('WDSTCNT').AsFloat]);  // 인출주수
  P_wdamt.Text      := Format('%9.0n', [CDS_psowhis.FieldByName('WDAMT').AsFloat]);    // 인출금액

  P_appamt.ValueCaption  := Format('%9.0n', [CDS_psowhis.FieldByName('APPAMT').AsFloat]);   // 기준금액
  if CDS_psowhis.FieldByName('APPDATE').AsString <> '' then
    P_appdate.ValueCaption := Copy(CDS_psowhis.FieldByName('APPDATE').AsString,1,4)+'.'+
                         Copy(CDS_psowhis.FieldByName('APPDATE').AsString,5,2)+'.'+
                         Copy(CDS_psowhis.FieldByName('APPDATE').AsString,7,2)
  else P_appdate.ValueCaption := '';

  if CDS_psowhis.FieldByName('REQYN').AsString = '' then // 접수처리 안된자료는 기준통과여부 검사
    ME_wdidateExit(Sender);
end;

procedure TMainForm.ME_wdidateExit(Sender: TObject);
var
  FromDate, ToDate: String;
begin
  L_bspassyn.Caption := 'N'; {기준통과여부 default}
  if (Length(E_wdissue.text) <> 3) or
     (Length(ME_wdidate.NoFormatDate) <> 8) or
     (ME_wdidate.NoFormatDate ='00000000') or
     (Length(ME_subdate.NoFormatDate) <> 8) or
     (ME_subdate.NoFormatDate = '00000000') then
    System.Exit;

  sqlstr :=  'SELECT nvl(to_char(plmonth        ),''0''),   '+
             '       nvl(to_char(flmonth        ),''0'')    '+
             ' FROM  PSWDIBAS                               '+
             ' WHERE (WDISSUE = '''+E_wdissue.Text+''') ';

  with TDS1 do
    begin
      ServiceName := 'PSC2040A_sel6';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('PLMONTH'      , ftInteger   ,  2   );
      AddField('FLMONTH'      , ftInteger   ,  2   );
      Open;
    end;

  if not TDS1.eof then
    begin
      FromDate := CalcMonth(Copy(ME_subdate.NoFormatDate,1,6),
                            (-1 * TDS1.FieldByName('PLMONTH').AsInteger))+
                  Copy(ME_subdate.NoFormatDate,7,2);
      ToDate   := CalcMonth(Copy(ME_subdate.NoFormatDate,1,6),
                            TDS1.FieldByName('FLMONTH').AsInteger)+
                  Copy(ME_subdate.NoFormatDate,7,2);
      // 인출사유발생일이 이전,이후 한도를 벗어나면
      if (ME_wdidate.NoFormatDate < FromDate) or (ME_wdidate.NoFormatDate > ToDate) then
        begin
          MessageBox(Handle, '신청일을 기준으로 인출사유발생일이 인출한도개월수를 초과했습니다.', '입력오류', MB_ICONWARNING);
          TDS1.Close;
          System.Exit;
        end;
      L_bspassyn.Caption := 'Y'; {기준통과여부}
    end;
  TDS1.Close;
end;


procedure TMainForm.BB_insertClick(Sender: TObject);
begin
  if NE_owstcnt.Value = 0 then
    begin
      MessageBox(handle, '보유하신 주식수가 하나도 없습니다.  추가할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 데이콤용을 하나로용으로 Conversion
  // =================================================

  DataAllClear;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
  NE_subamt.Enabled     := True;
  NE_Substcnt.Enabled   := True;

  ME_subdate.NoFormatDate := Copy(FG_Date, 1, 8) ;  // 신청일자

  sqlstr :=  'select  nvl(        inmarkname      ,'' '') , '+
             '        nvl(        instrname       ,'' '') , '+
             '        nvl(        inaccnum        ,'' '') , '+
             '        nvl(        inname          ,'' '')   '+
             '  from  psstmas                              '+
             ' where  empno = ''' + E_empno.empno + '''     ';

  with TDS_Gen do
    begin
      ServiceName := 'PSC2040A_sel9';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('INMARKNAME', ftString, 20);
      AddField('INSTRNAME' , ftString, 20);
      AddField('INACCNUM'  , ftString, 20);
      AddField('INNAME'    , ftString, 20);
      Open;
    end;

  if not TDS_Gen.Eof then
    begin
      E_inmarkname.Text := TDS_Gen.FieldByName('INMARKNAME').AsString;
      E_instrname.Text  := TDS_Gen.FieldByName('INSTRNAME').AsString;
      E_inaccnum.Text   := TDS_Gen.FieldByName('INACCNUM').AsString;
      E_inname.text     := TDS_Gen.FieldByName('INNAME').AsString;
    end
  else
    begin
      E_inmarkname.Text := '';
      E_instrname.Text  := '';
      E_inaccnum.Text   := '';
      E_inname.text     := '';
    end;
  TDS_Gen.Close;

  Job_mode := 1;  // 입력
  L_bspassyn.Caption := 'N'; {기준통과여부 default}
  E_wdissue.SetFocus;
  StatusBar1.Panels[1].Text := ' 신규자료 입력후 저장하세요.';
end;

procedure TMainForm.BB_stockviewClick(Sender: TObject);
begin
  try
    ChartForm := TChartForm.Create(self);
    StatusBar1.Panels[1].Text  := '자료를 읽고 있습니다.';
    Application.ProcessMessages;
    sqlstr :=  'SELECT  '+
               ' nvl( (substr(appdate,1,4)||'#39'-'#39'||substr(appdate,5,2)||'#39'-'#39'||substr(appdate,7,2)) ,'' '') APPDATEMASK, '+
               ' nvl(to_char(appamt         ),''0'') APPAMT '+
               ' from pswdbas ';

    with ChartForm.CDS_pswdbas do
      begin
        ServiceName := 'PSC2040A_sel10';
        Close;
        Sql.Clear;
        Sql.Add( sqlstr);

        ClearFieldInfo;
        AddField('APPDATEMASK'  , ftString    ,  18  );
        AddField('APPAMT'       , ftFloat     ,  9   );
        Open;
      end;

    with ChartForm.CDS_pswdbas_d do
      begin
        ServiceName :='PSC2040A_sel10';
        Close;
        Sql.Clear;
        Sql.Add(sqlstr);

        ClearFieldInfo;
        AddField('APPDATEMASK'  , ftString    ,  18  );
        AddField('APPAMT'       , ftFloat     ,  9   );
        Open;
      end;

    StatusBar1.Panels[1].Text := '';
    ChartForm.ShowModal;
    ChartForm.CDS_pswdbas.Close;
    ChartForm.CDS_pswdbas_d.Close;
  finally
    ChartForm.free;
  end;

end;

procedure TMainForm.BB_SaveClick(Sender: TObject);
var
  FromDate, ToDate : String;
begin
  StatusBar1.Panels[1].Text := '';
  if Application.MessageBox('현재자료를 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
     system.exit;

  if Job_mode = 0 then
    begin
      MessageBox(handle, '작업한 내용이 없습니다.  저장할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if (CDS_psowhis.fieldbyname('REQYN').AsString <> '') and (Job_mode <> 1) then
    begin
      MessageBox(handle, '이미 접수처리된 신청자료는 수정할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  // =================================================
  // 1. 수 정 일 : 1999.04.30
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : Comment 처리(이호석 대리요청)
  // ==============================================

  {
  sqlstr := 'select empno from pkhmrhis ' + #13 +
     format('where  empno = ''%s''',[E_empno.text]);


  CDM.CDS_Gen.Close;
  CDM.RemoteServer1.AppServer.Query_GenREQ(vararrayof([sqlstr]));
  CDM.CDS_Gen.Open;

  if not CDM.CDS_Gen.Eof then
  begin
    if Application.MessageBox('보증채무 이행각서를 제출 하셔야 합니다.'+
                       #13#13+'          신청하시겠습니까?',
                                      '작업안내', MB_OKCANCEL + MB_DefButton1) = IDCANCEL
    then System.Exit;
  end;
  }

  if trim(E_telno.Text) = '' then
    begin
      MessageBox(Handle, '연락처를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      E_telno.setfocus;
      System.Exit;
    end;

  if Length(ME_subdate.Text) <> 10 then
    begin
      MessageBox(Handle, '신청일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      ME_subdate.setfocus;
      System.Exit;
    end;

{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능 -->  기간만료에 대하여는 신청주수로 반영
    // 인출사유의 첫자리가 '0','1'인 자료는 (예, 퇴직반환) but 합병(011), 기타(999)는 위에서 신청불가)
    // 우리사주마스터.보유주수에 대해 모두 인출.
--------------------------------------------------------------------------------}
  //if NE_subamt.Value <= 0 then
  //begin
  //  MessageBox(Handle, '신청금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
  //  NE_subamt.setfocus;
  //  System.Exit;
  //end;
  if (copy(E_wdissue.Text,1,1) <> '0') and (copy(E_wdissue.Text,1,1) <> '1') then
    begin
      if (E_wdissue.Text = '811') and (NE_subamt.Value > 0) then
        begin
          MessageBox(Handle, '인출사유가 기간만료인경우 신청주수로 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;
      if (E_wdissue.Text <> '811') and (NE_substcnt.Value > 0) then
        begin
          MessageBox(Handle, '인출사유가 기간만료가 아닌경우 신청금액으로 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;
      if (NE_subamt.Value * NE_substcnt.Value < 0) or (NE_subamt.Value + NE_substcnt.Value = 0) then
        begin
          MessageBox(Handle, '신청금액 또는 신청주식을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          if NE_substcnt.Enabled = True then
            NE_substcnt.SetFocus
          else
            NE_Subamt.SetFocus;
          System.Exit;
        end;
    end;

{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능 -->  기간만료에 대하여는 신청주수로 반영
--------------------------------------------------------------------------------}
  if (trim(E_wdissue.Text) = '') or (length(trim(E_wdissue.Text)) <> 3) then
    begin
      MessageBox(Handle, '인출사유를 정확히 입력하세요.','입력오류',MB_ICONWARNING);
      E_wdissue.setfocus;
      System.Exit;
    end;

  if copy(E_wdissue.Text,1,1) = '2' then
    begin
      sqlstr :=  'SELECT  nvl(to_char(count(*) ),''0'') cnt '+
                 ' from   pswddis ' + #13 +
                 ' where  empno = ''' + E_empno.empno + ''' ' + #13 +
                 ' and    subdate = ''' + ME_subdate.NoFormatDate + '''';

      with TDS1 do
        begin
          ServiceName :='PSC2040A_common';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

          ClearFieldInfo;
          AddField('CNT'          , ftString   ,  2000 );
          Open;
        end;

      if TDS1.FieldByName('cnt').AsInteger = 0 then
        begin
          MessageBox(Handle, '인출세부사유를 등록하지 않았습니다.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;
    end;

  if Length(ME_wdidate.Text) <> 10 then
    begin
      MessageBox(Handle, '인출사유발생일을 정확히 입력하세요.','입력오류',MB_ICONWARNING);
      ME_wdidate.setfocus;
      System.Exit;
    end;

  sqlstr :=  'SELECT  nvl(to_char(plmonth        ),''0''), '+
             '        nvl(to_char(flmonth        ),''0'') '+
             '  from  pswdibas' + #13 +
             ' where  wdissue = '''+ E_wdissue.text+''' ';

  with TDS1 do
    begin
      ServiceName := 'PSC2040A_sel6';
      Close;
      Sql.Clear;
      Sql.Add( sqlstr );

      ClearFieldInfo;
      AddField('PLMONTH'      , ftInteger   ,  2   );
      AddField('FLMONTH'      , ftInteger   ,  2   );
      Open;
    end;

  if TDS1.RecordCount > 0 then
    begin
    { ===========================================================================
       변경사유 : 날짜범위 Check Logic 수정
       변경일자 : 1999.04.14
       변경자   : 김승회
       =========================================================================== }
      FromDate := CalcMonth(Copy(ME_subdate.NoFormatDate,1,6),
                          (-1 * TDS1.FieldByName('PLMONTH').AsInteger))+
                  Copy(ME_subdate.NoFormatDate,7,2);
      ToDate   := CalcMonth(Copy(ME_subdate.NoFormatDate,1,6),
                          TDS1.FieldByName('FLMONTH').AsInteger)+
                  Copy(ME_subdate.NoFormatDate,7,2);

    // 인출사유발생일이 이전,이후 한도를 벗어나면
      if (ME_wdidate.NoFormatDate < FromDate) or (ME_wdidate.NoFormatDate > ToDate) then
        begin
          MessageBox(Handle, '신청일을 기준으로 인출사유발생일이 인출한도개월수를 초과했습니다.', '입력오류', MB_ICONWARNING);
          TDS1.Close;
          System.Exit;
        end;
    end;

  if (Copy(E_wdissue.Text,1,1) = '2') and (E_objaddr.Text = '') then
    begin
      MessageBox(Handle, '목적지주소를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      E_objaddr.setfocus;
      System.Exit;
    end;


  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 우리사주 마스터 Update
  // =================================================

  sqlstr := 'update psstmas' + #13 +
     format(' set   inmarkname = ''%s'',',[E_inmarkname.text]) + #13 +
     format('       instrname  = ''%s'',',[E_instrname.text]) + #13 +
     format('       inaccnum   = ''%s'',',[E_inaccnum.text]) + #13 +
     format('       inname     = ''%s'',',[E_inname.text]) + #13 +
     format('       writeman   = ''%s'',',[pempno]) + #13 +
            '       writetime  = to_char(sysdate,''yyyymmddhh24missd'')' + #13 +
     format(' where  empno = ''%s''',[E_empno.empno]);

  with TDS_dml1 do
    begin
      ServiceName := 'PSC2040A_dml';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      if not TDS_dml1.Execute then
        begin
          ShowMessage('저장중 에러가 발생했습니다.');
          System.Exit;
        end;
    end;

  sqlstr := 'SELECT  nvl(        empno           ,'' '') '+
            ' from   psowhis ' + #13 +
            ' where  empno = ''' + E_empno.empno + ''' ' + #13 +
            ' and    subdate = ''' + ME_subdate.NoFormatDate + ''' ';


  with TDS1 do
    begin
      ServiceName :='PSC2040A_common';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('EMPNO'        , ftString    ,  2000 );
      Open;
    end;

  if TDS1.Eof then
    begin
      sqlstr := 'insert into psowhis ' + #13 +
                ' (EMPNO, KORNAME, JUMINID, PAYCL, ORGNUM, DEPTCODE, DEPOSITNO, TELNO, ' + #13 +
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
              // '  SUBDATE, SUBAMT, WDISSUE, WDIDATE, OBJADDR, WRITETIME, WRITEMAN) ' + #13 +
               '  SUBDATE, SUBAMT, SUBSTCNT, WDISSUE, WDIDATE, OBJADDR, WRITETIME, WRITEMAN) ' + #13 +
               ' values( ' + #13 +
               ' ''' + E_empno.empno + ''', ''' + E_empno.korname + ''',' + #13 +
               ' ''' + P_juminid.Text + ''', ''' + P_paycl.Text + ''',' + #13 +
               ' ''' + P_orgnum.Text + ''', ''' + P_deptcode.Text + ''',' + #13 +
               ' ''' + P_depositno.Text + ''', ''' + E_telno.Text + ''',' + #13 +
               ' ''' + ME_subdate.NoFormatDate + ''', ' + FloatToStr(NE_subamt.Value) + ',' + #13 +
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
               '   ' + FloatToStr(NE_substcnt.Value) + ',' + #13 +
               ' ''' + E_wdissue.Text + ''', ''' + ME_wdidate.NoFormatDate + ''',' + #13 +
               ' ''' + E_objaddr.Text + ''',' + #13 +
               ' to_char(sysdate,''yyyymmddhh24missd''), ''' + Pempno + ''')';

      with TDS_dml1 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

          if TDS_dml1.Execute then
            Showmessage('신규 신청자료가 등록되었습니다.')
          else
            begin
              Showmessage('신규 신청자료 등록에 실패했습니다.');
              System.Exit;
            end;
        end;
    end
  else
    begin
      sqlstr := 'update psowhis ' + #13 +
               ' SET    TELNO = ''' + E_telno.Text + ''',' + #13 +
               '       SUBAMT = ' + FloatToStr(NE_subamt.Value) + ',' + #13 +
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
               '       SUBSTCNT= ' + FloatToStr(NE_substcnt.Value) + ',' + #13 +
               '       WDISSUE = ''' + E_wdissue.Text + ''',' + #13 +
               '       WDIDATE = ''' + ME_wdidate.NoFormatDate + ''',' + #13 +
               '       OBJADDR = ''' + E_objaddr.Text + ''',' + #13 +
               '       WRITETIME = to_char(sysdate,''yyyymmddhh24missd''), ' + #13 +
               '       WRITEMAN  = ''' + Pempno + '''' + #13 +
               ' where  EMPNO = ''' + CDS_psowhis.fieldbyname('EMPNO').AsString + '''' + #13 +
               ' and    SUBDATE = ''' + CDS_psowhis.fieldbyname('SUBDATE').AsString + '''';

      with TDS_dml1 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

          if TDS_dml1.Execute then
            Showmessage('기존 신청내역을 수정하였습니다.')
          else
            begin
              Showmessage('기존 신청내역 수정에 실패 했습니다.');
              System.Exit;
            end;
        end;
    end;

  if Copy(E_wdissue.text,1,1) = '2' then
    begin
      sqlstr :=  'SELECT  nvl(        empno           ,'' '') '+
                 ' from   pswddis ' + #13 +
          format(' where  empno = ''%s''',[E_empno.empno]) + #13 +
          format(' and    subdate = ''%s''',[ME_subdate.NoFormatDate]);

      with TDS1 do
        begin
          ServiceName := 'PSC2040A_common';
          Close;
          Sql.Clear;
          Sql.Add( sqlstr );

          ClearFieldInfo;
          AddField('EMPNO'        , ftString    ,  4   );
          Open;
        end;

      if not TDS1.Eof then
        begin
          sqlstr := 'update pswddis ' + #13 +
                    ' set   BSPASSYN = ''Y'',' + #13 +
                    '       SAVEYN   = ''Y'',' + #13 +
                    '       WRITETIME = to_char(sysdate,''yyyymmddhh24missd''),' + #13 +
             format('       writeman = ''%s''',[Pempno]) + #13 +
             format(' where  empno = ''%s''',  [E_empno.empno]) + #13 +
             format(' and    subdate = ''%s''',[ME_subdate.NoFormatDate]) + #13 +
                    ' and    saveyn = ''N''';

          with TDS_dml1 do
            begin
              ServiceName := 'PSC2040A_dml';
              Close;
              Sql.Clear;
              Sql.Add(sqlstr);

              if not TDS_dml1.Execute then
                begin
                  Showmessage('기존 신청내역 수정에 실패 했습니다.');
                  System.Exit;
                end;
            end;
        end;    
    end;

  Application.ProcessMessages;

  Save_EMPNO   := E_empno.empno;
  Save_SUBDATE := ME_subdate.NoFormatDate;
  RetrieveData;

  {

  ParamVariant := ' SELECT * FROM PSOWHIS                                   '+
                  ' WHERE (EMPNO   = '''+CDS_psowhisEMPNO.AsString+''') and '+
                  '       (SUBDATE = '''+ME_SUBDATE.Text+''')               ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  if CDM.CDS_Gen.RecordCount = 0 then
  begin
    if E_telno.Text = '' then
    begin
      MessageBox(Handle, '연락처를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if Length(ME_subdate.Text) <> 8 then
    begin
      MessageBox(Handle, '신청일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if NE_subamt.Value <= 0 then
    begin
      MessageBox(Handle, '신청금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if E_wdissue.Text = '' then
    begin
      MessageBox(Handle, '인출사유를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if Length(ME_wdidate.Text) <> 8 then
    begin
      MessageBox(Handle, '인출사유발생일을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if (Copy(E_wdissue.Text,1,1) = '2') and (E_objaddr.Text = '') then
    begin
      MessageBox(Handle, '목적지주소를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

    ParamVariant := ' INSERT INTO PSOWHIS '+
                    '   (EMPNO, KORNAME, JUMINID, PAYCL, ORGNUM, DEPTCODE, DEPOSITNO, TELNO, '+
                    '     SUBDATE, SUBAMT, WDISSUE, WDIDATE, OBJADDR, WRITETIME, WRITEMAN) '+
                    ' VALUES ('''+E_empno.Text+''', '''+P_korname.Caption+''', '''+P_juminid.Caption+''', ';
    ParamVariant := ParamVariant + ' '''+P_paycl.Caption+''', '''+P_orgnum.Caption+''', '''+P_deptcode.Caption+''', '+
                    '         '''+P_depositno.Caption+''', '''+E_telno.Text+''', '''+ME_subdate.Text+''', '+FloatToStr(NE_subamt.Value)+', '+
                    '         '''+E_wdissue.Text+''', '''+ME_wdidate.Text+''', '''+E_objaddr.Text+''', '+
                    '         '''+Copy(CurDate,1,14)+''', '''+Pempno+''') ';
    CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

    if CB_6thwithdrawal.Checked then //6차 예탁분 인출 저장
    begin
      ParamVariant := ' DELETE FROM PSDPSP '+ // 인출특이자의 이전자료 삭제
                      ' WHERE (EMPNO   = '''+E_empno.Text+''') and '+
                      '       (SUBDATE = '''+ME_subdate.Text+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

      ParamVariant := ' INSERT INTO PSDPSP '+
                      '   (EMPNO, KORNAME, DIVSEQNUM, SUBDATE, WRITETIME, WRITEMAN) '+
                      ' VALUES ('''+E_empno.Text+''', '''+P_korname.Caption+''', ''6'', '''+ME_subdate.Text+''', '+
                      '         '''+Copy(CurDate,1,14)+''', '''+Pempno+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
    end;
    Phelpmsg.Caption := '  신규 신청자료가 등록되었습니다.';
  end else
  if CDM.CDS_Gen.RecordCount > 0 then
  begin
    if CDS_psowhis.RecordCount = 0 then
    begin
      DataAllClear;
      MessageBox(handle, '신청내역 자료가 없으므로 저장할 수 없습니다',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;
    if CDS_psowhisREQYN.AsString <> '' then
    begin
      MessageBox(handle, '이미 접수처리된 신청자료는 수정할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;
    if job_mode = 1 then
    begin
      if Application.MessageBox('기존자료가 존재합니다. 수정하시겠습니까?','작업안내',
                                 mb_yesno) = id_yes then
      begin
        ParamVariant := ' UPDATE PSOWHIS '+
                        '    SET TELNO     = '''+E_telno.Text+''', '+
                        '        SUBAMT    = '''+FloatToStr(NE_subamt.Value)+''', '+
                        '        WDISSUE   = '''+E_wdissue.Text+''', '+
                        '        WDIDATE   = '''+ME_wdidate.Text+''', '+
                        '        OBJADDR   = '''+E_objaddr.Text+''', '+
                        '        WRITETIME = '''+Copy(CurDate,1,14)+''', '+
                        '        WRITEMAN  = '''+Pempno+''' '+
                        ' WHERE (EMPNO   = '''+CDS_psowhisEMPNO.AsString+''') and '+
                        '       (SUBDATE = '''+CDS_psowhisSUBDATE.AsString+''') ';
        CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

        ParamVariant := ' DELETE FROM PSDPSP '+ // 인출특이자의 이전자료 삭제
                        ' WHERE (EMPNO   = '''+E_empno.Text+''') and '+
                        '       (SUBDATE = '''+ME_subdate.Text+''') ';
        CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
        if CB_6thwithdrawal.Checked then //6차 예탁분 인출 저장
        begin
          ParamVariant := ' INSERT INTO PSDPSP '+
                          '   (EMPNO, KORNAME, DIVSEQNUM, SUBDATE, WRITETIME, WRITEMAN) '+
                          ' VALUES ('''+E_empno.Text+''', '''+P_korname.Caption+''', ''6'', '''+ME_subdate.Text+''', '+
                          '         '''+Copy(CurDate,1,14)+''', '''+Pempno+''') ';
          CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
        end;
      Phelpmsg.Caption := '  기존 신청내역을 수정하였습니다.';
      end;
    end else
    if job_mode <> 1 then
    begin
      ParamVariant := ' UPDATE PSOWHIS '+
                      '    SET TELNO     = '''+E_telno.Text+''', '+
                      '        SUBAMT    = '''+FloatToStr(NE_subamt.Value)+''', '+
                      '        WDISSUE   = '''+E_wdissue.Text+''', '+
                      '        WDIDATE   = '''+ME_wdidate.Text+''', '+
                      '        OBJADDR   = '''+E_objaddr.Text+''', '+
                      '        WRITETIME = '''+Copy(CurDate,1,14)+''', '+
                      '        WRITEMAN  = '''+Pempno+''' '+
                      ' WHERE (EMPNO   = '''+CDS_psowhisEMPNO.AsString+''') and '+
                      '       (SUBDATE = '''+CDS_psowhisSUBDATE.AsString+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

      ParamVariant := ' DELETE FROM PSDPSP '+ // 인출특이자의 이전자료 삭제
                      ' WHERE (EMPNO   = '''+E_empno.Text+''') and '+
                      '       (SUBDATE = '''+ME_subdate.Text+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
      if CB_6thwithdrawal.Checked then //6차 예탁분 인출 저장
      begin
        ParamVariant := ' INSERT INTO PSDPSP '+
                        '   (EMPNO, KORNAME, DIVSEQNUM, SUBDATE, WRITETIME, WRITEMAN) '+
                        ' VALUES ('''+E_empno.Text+''', '''+P_korname.Caption+''', ''6'', '''+ME_subdate.Text+''', '+
                        '         '''+Copy(CurDate,1,14)+''', '''+Pempno+''') ';
        CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
      end;
      Phelpmsg.Caption := '  기존 신청내역을 수정하였습니다.';
    end;
  end;

  if Copy(E_wdissue.text,1,1) = '2' then
  begin
    ParamVariant := ' SELECT EMPNO '+
                    ' FROM PSWDDIS '+  //인출세부내역
                    ' WHERE (EMPNO   = '''+E_empno.Text+''') and '+
                    '       (SUBDATE = '''+ME_subdate.Text+''') ';
    CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
    CDM.CDS_Gen.Open;
    if CDM.CDS_Gen.RecordCount > 0 then
    begin
      CDM.CDS_Gen.Close;
      ParamVariant := ' UPDATE PSWDDIS '+
                      '    SET BSPASSYN = ''Y'', '+
                      '        SAVEYN   = ''Y'', '+
                      '        WRITETIME = '''+Copy(CurDate,1,14)+''', '+
                      '        WRITEMAN  = '''+Pempno+''' '+
                      ' WHERE (EMPNO   = '''+E_empno.Text+''') and '+
                      '       (SUBDATE = '''+ME_subdate.Text+''') and '+
                      '       (SAVEYN  = ''N'') '; //저장확인
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
    end else
    begin
      CDM.CDS_Gen.Close;
      ParamVariant := ' INSERT INTO PSWDDIS '+
                      '   (EMPNO, KORNAME, DEPOSITNO, '+
                      '    SUBDATE, SSEQNO, WDISSUE, '+
                      '    WDISPT, SDATE, SAMT, '+
                      '    BSPASSYN, SAVEYN, '+
                      '    WRITETIME, WRITEMAN) '+
                      ' VALUES ('''+E_empno.Text+''', '''+P_korname.Caption+''', '''+P_depositno.Caption+''', ';
      ParamVariant := ParamVariant + ' '''+ME_subdate.Text+''', 1, '''+E_wdissue.Text+''', '+
                      '         '''+Copy(E_wdissue.text,3,1)+''', '''+ME_wdidate.Text+''', '+FloatToStr(NE_subamt.Value)+', '+
                      '         '''+L_bspassyn.Caption+''', ''Y'', '+
                      '         '''+Copy(CurDate,1,14)+''', '''+Pempno+''')';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
    end;
  end;
  }

end;

procedure TMainForm.BB_deleteClick(Sender: TObject);
begin
  if CDS_psowhis.eof then
    begin
      DataAllClear;
      MessageBox(handle, '신청내역 자료가 한건도 없습니다',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if (ME_subdate.NoFormatDate = '00000000') or (Job_mode <> 2) then
    begin
      MessageBox(handle, '먼저 삭제하려는 신청내역을 선택하세요.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if CDS_psowhis.FieldByName('REQYN').AsString <> '' then
    begin
      MessageBox(handle, '이미 접수처리된 신청자료는 삭제할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if Application.MessageBox('선택한 신청자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK then
    begin
     {
      ParamVariant := ' DELETE FROM PSOWHIS '+
                      '  WHERE (EMPNO      = '''+CDS_psowhisEMPNO.AsString+''') and '+
                      '        (SUBDATE    = '''+CDS_psowhisSUBDATE.AsString+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

    ParamVariant := ' DELETE FROM PSWDDIS '+ //세부내역 삭제
                      '  WHERE (EMPNO      = '''+CDS_psowhisEMPNO.AsString+''') and '+
                      '        (SUBDATE    = '''+CDS_psowhisSUBDATE.AsString+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));

    ParamVariant := ' DELETE FROM PSDPSP '+  //인출특이자의 이전자료 삭제
                      '  WHERE (EMPNO      = '''+CDS_psowhisEMPNO.AsString+''') and '+
                      '        (SUBDATE    = '''+CDS_psowhisSUBDATE.AsString+''') ';
      CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
      }

      sqlstr := 'delete from PSOWHIS' + #13 +
         format(' where  empno = ''%s'' and subdate = ''%s'' ',[e_empno.empno,ME_subdate.NoFormatDate]);

      with TDS_dml1 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

          if not TDS_dml1.Execute then
            begin
              Showmessage('삭제에 실패했습니다.');
              System.Exit;
            end;
        end;

      sqlstr :=  'select  nvl(to_char(count(*)        ),''0'') cnt,       '+
                 '        nvl(        min(sdate)       ,'' '') min_sdate, '+
                 '        nvl(to_char(sum(samt)       ),''0'') samt_sum   '+
                 '  from  pswddis                                         '+
                 ' where  empno   = ''' + E_empno.empno + '''              '+
                 '   and  subdate = ''' + ME_subdate.NoformatDate + '''           ';

      with TDS1 do
        begin
          ServiceName := 'PSC2040A_sel4';
          Close;
          Sql.Clear;
          Sql.Add(sqlstr);

          ClearFieldInfo;
          AddField('CNT'          , ftString    ,  12  );
          AddField('MIN_SDATE'    , ftString    ,  8   );
          AddField('SAMT_SUM'     , ftString    ,  12  );

          Open;
        end;

      if Not (TDS1.FieldByName('CNT').AsString = '0') then
        begin
          sqlstr := 'delete from pswddis' + #13 +
             format(' where  empno = ''%s'' and subdate = ''%s'' ',[E_empno.empno, ME_subdate.NoFormatDate]);

          with TDS_dml1 do
            begin
              ServiceName := 'PSC2040A_dml';
              Close;
              Sql.Clear;
              Sql.Add(sqlstr);

              if not TDS_dml1.Execute then
                begin
                  Showmessage('삭제에 실패했습니다.');
                  System.Exit;
                end;
            end;
        end;
      RetrieveData;
      ShowMessage('선택한 신청자료를 삭제하였습니다.');
    end;     
end;

procedure TMainForm.BB_cancelClick(Sender: TObject);
begin
  if Application.MessageBox('현재 작업을 취소 하시겠습니까?','작업안내',mb_yesno) = id_no then
     system.exit;

  Job_mode := 0;
  StatusBar1.Panels[1].Text := '작업이 취소되었습니다.';

  if CDS_psowhis.eof then
    begin
      DataAllClear;
      System.Exit;
    end;

  if CDS_psowhis.Locate('EMPNO', VarArrayOf([Save_EMPNO]), [loPartialKey]) then
     while Not CDS_psowhis.Eof Do
       begin
         if CDS_psowhis.FieldByName('SUBDATE').AsString = Save_SUBDATE then
           begin
             DBGrid1.SetFocus;
             Break;
           end;
         CDS_psowhis.Next;
       end;

  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 데이콤용을 하나로용으로 Conversion
  // =================================================
  sqlstr :=  'select  nvl(        inmarkname      ,'' ''), '+
             '        nvl(        instrname       ,'' ''), '+
             '        nvl(        inaccnum        ,'' ''), '+
             '        nvl(        inname          ,'' '')  '+
             '  from  psstmas                              '+
             ' where  empno = ''' + E_empno.empno + '''     ';

  with TDS_Gen do
    begin
      ServiceName := 'PSC2040A_sel9';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('INMARKNAME', ftString, 20);
      AddField('INSTRNAME' , ftString, 20);
      AddField('INACCNUM'  , ftString, 20);
      AddField('INNAME'    , ftString, 20);
      Open;
    end;

  if not TDS_Gen.Eof then
    begin
      E_inmarkname.Text := TDS_Gen.FieldByName('inmarkname').AsString;
      E_instrname.Text  := TDS_Gen.FieldByName('INSTRNAME').AsString;
      E_inaccnum.Text   := TDS_Gen.FieldByName('INACCNUM').AsString;
      E_inname.text     := TDS_Gen.FieldByName('INNAME').AsString;
    end
  else
    begin
      E_inmarkname.Text := '';
      E_instrname.Text  := '';
      E_inaccnum.Text   := '';
      E_inname.text     := '';
    end;

end;

procedure TMainForm.BBprintClick(Sender: TObject);
var
  FormImage: TBitmap;
  filename : string;
  fname    : string;
begin
  StatusBar1.Panels[1].Text := '화면 이미지를 적재 중...';

  Application.ProcessMessages;

  filename := Pempno + '.bmp';
  fname    := GetCurrentDir + '\' + filename;

  try
    FormImage := TBitmap.Create;
    FormImage := GetFormImage;
    FormImage.SaveToFile(fname);

    ShellExecute(MainForm.handle, 'open', pchar(fname), nil, nil, SW_SHOWNORMAL);
  finally
    FormImage.free;
  end;

  StatusBar1.Panels[1].Text := '화면 이미지 적재가 완료되었습니다. ';

end;

procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.E_empnoReadEnded(Sender: TObject);
begin
  GetAllData;
end;

procedure TMainForm.BB_findClick(Sender: TObject);
begin
  GetAllData;
end;


end.
