//미사용
unit pic4020a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, pebtnedit, peempnobtnedit, ExtCtrls, peoutlookbtn,
  pegradpanl, pedeptbtnedit, pecodebtnedit, PeJeonBtnDateEdit, PeJeonLabel,
  peextcombo, ComCtrls, peNumedit, pedballutil, pedbutil, Db, DbTables,
  PeJeonMemo, Grids, DBGrids, pedbgrid;

type
  TFm_SubForm2 = class(TForm)
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Bt_Batch: TPeJeonOutLookBtn;
    PEE_empno: TPeEmpnoEdit;
    Panel2: TPanel;
    PJL_deptname: TPeJeonLabel;
    PJL_payclname: TPeJeonLabel;
    PJL_payraname: TPeJeonLabel;
    PJL_jobgunname: TPeJeonLabel;
    PCE_rapayra: TPeCodeEdit;
    PPE_raexsayu: TPePanelEdit;
    Pg_Control: TPageControl;
    TabSheet1: TTabSheet;
    PJL_paycldate: TPeJeonLabel;
    PJL_raisdate: TPeJeonLabel;
    PCB_edupointyn: TPeJeonPanelComboBox;
    PNE_proscore: TPePanelNumEdit;
    PCB_uppointyn: TPeJeonPanelComboBox;
    TabSheet3: TTabSheet;
    PDG_F2: TPeJeonDbGrid;
    TabSheet5: TTabSheet;
    PDG_F3: TPeJeonDbGrid;
    TabSheet7: TTabSheet;
    PDG_F4: TPeJeonDbGrid;
    PJL_pstatename: TPeJeonLabel;
    PCE_rapaycl: TPeCodeEdit;
    PCE_rajobgun: TPeCodeEdit;
    PPC_raobjyn: TPeJeonPanelComboBox;
    PJL_radeptname: TPeJeonLabel;
    PDE_radeptcode: TPeDeptEdit;
    PJL_rapayraname: TPeJeonLabel;
    PJL_rapayclname: TPeJeonLabel;
    PJL_rajobgunname: TPeJeonLabel;
    PNE_totscr: TPePanelNumEdit;
    PNE_uppoint: TPePanelNumEdit;
    PNE_qpayclscr: TPePanelNumEdit;
    PNE_payclscr: TPePanelNumEdit;
    PNE_prizescr: TPePanelNumEdit;
    PNE_suggscr: TPePanelNumEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    PNE_payclyy: TPePanelNumEdit;
    PNE_payclmm: TPePanelNumEdit;
    Label2: TLabel;
    Label3: TLabel;
    PNE_edupoint: TPePanelNumEdit;
    PNE_uppoint_2year: TPePanelNumEdit;
    PCB_shiftyn: TPeJeonPanelComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PEE_empnoExit(Sender: TObject);
    procedure PEE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_SaveClick(Sender: TObject);
    procedure PEE_empnoEnter(Sender: TObject);
    procedure Cb_ynChange(Sender: TObject);
    procedure Bt_delClick(Sender: TObject);
    procedure PNE_payclyymmExit(Sender: TObject);
    procedure PNE_proscoreExit(Sender: TObject);
    procedure PEE_empnoActionEvent(Sender: TObject);
    procedure Bt_BatchClick(Sender: TObject);
    procedure PDE_radeptcodeExit(Sender: TObject);
  private
    { Private declarations }
    Start      : Boolean;
    Up_Data    : Boolean;
    gbValieOK  : Boolean;

    Le1empno   : string;  // 임시 1차평가자 사번 (평가자별 인원을 계산하기 위함)
    Le1inwon   : real;    // 임시 1차평가자 평가자별 인원 (평가자별 인원을 계산하기 위함)

    Lempdate   : string;  // 입사일 (인사마스터)
    Ljobgun    : string;  // 직군   (인사마스터)
    Lpaycldate : string;  // 승격일 (인사마스터)
    Lrealtrdate: string;  // 발령일 (인사마스터)

    function  fnReadPimramas : Boolean; // 업적평가마스터와 평가자관리 화일과 조인하여 데이타를 읽어온다.
    function  fnCheckFields: Boolean; // 입력한 데이타를 체크한다.
    procedure fzDisplayPimramas; // Read_pimramas에서 조회된 데이타를 화면에 디스플레이한다.
  public
    { Public declarations }
  end;

implementation

uses
  peDm, peMainForm, pic4020a1;

{$R *.DFM}

procedure TFm_SubForm2.FormCreate(Sender: TObject);
begin
    Start := True;
end;

procedure TFm_SubForm2.FormShow(Sender: TObject);
begin
    if Start then
    begin
        Start := not Start;
        Application.ProcessMessages;

        MainForm.Pe_Date.GetOrgnum;
        PDE_radeptcode.orgnum := MainForm.Pe_Date.orgnum;

        MainForm.fzSetBaseDates;

        Pg_Control.ActivePage := TabSheet1;
        PEE_Empno.SetFocus;
    end;
end;

procedure TFm_SubForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

// 승격마스터 데이타를 읽어온다.
function TFm_SubForm2.fnReadPimramas: Boolean;
var
  iCnt : Integer;
  Field: TField;
begin
    Result := True;

    PDG_F2.DataSource := DM.DS_F2;
    PDG_F3.DataSource := DM.DS_F3;
    PDG_F4.DataSource := DM.DS_F4;

    with DM.Qr_F1 do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
              {   'SELECT korname      ,                                                             '+
                 '       orgnum       , deptcode     , funccode     , placecode    , paycl        , '+
                 '       payra        , jobgun       ,                                              '+
                 '       payrayn      , pstate       ,                                              '+
                 '       raorgnum     , radeptcode   , rafunccode   , raplacecode  , rapaycl      , '+
                 '       rapayra      , rajobgun     ,                                              '+
                 '       evjobgun     , raobjyn      , raexsayu     , rarecyn      , raisyn       , '+
                 '       ofempno      , ofkorname    , ofprefer     ,                               '+
                 '       evscore      , minrayearyn  ,                                              '+
                 '       payclyy      , payclmm      , paycldate    , raisdate     , payscore     , '+
                 '       eduscore     , forscore     , repclass     , orgrewscore  , proscore     , '+
                 '       rewscore     , etcscore1    , etcscore2    , etcscore3    , raisscore    , '+
                 '       totrank      , payclrank    , paygunrank   , mytotrank    , mypayclrank  , '+
                 '       mypaygunrank ,                                                             '+
                 '       totinwon     , payclinwon   , payguninwon  , mytotinwon   , mypayclinwon , '+
                 '       mypayguninwon,                                                             '+
                 '       totavg       , payclavg     , paygunavg    , mytotavg     , mypayclavg   , '+
                 '       mypaygunavg  ,                                                             '+
                 '       rarate1yn    , rarate2yn    , rarate3yn    , rarate4yn    , rarate5yn    , '+
                 '       anorgnum     , andeptcode   , anpaycl      , anpayra                       '+
                 '  FROM pimramas                                                                   '+
                 ' WHERE rabasdate = :p_rabasdate                                                   '+
                 '   AND empno     = :p_empno                                                       ';
              }

                 'SELECT a.korname,                                                            '+
                 '       a.orgnum, a.deptcode, a.paycl,                                        '+
                 '       a.payra, a.jobgun,                                                    '+
       	         '       DECODE(a.payra,''2C'',''Y'',''N'') payrayn, b.pstate,                 '+
                 '       a.orgnum raorgnum, a.deptcode radeptcode, a.paycl rapaycl,            '+
                 '       a.payra rapayra, a.jobgun rajobgun,                                   '+
                 '       DECODE(a.uppointyn || a.edupointyn || a.shiftyn,''YYY'',''Y'',''N'') raobjyn,'+
                 '       a.remark raexsayu,                                                    '+
                 '	     a.payclyy, a.payclmm, a.paycldate, a.rabasdate raisdate,              '+
                 '       a.totscr, a.payclscr, a.uppoint, a.edupoint, a.qpayclscr,             '+
                 '       nvl(a.prizescr,0) prizescr, nvl(a.suggscr,0) suggscr, a.uppoint_2year,'+
                 '       a.uppointyn, a.edupointyn, a.shiftyn                                  '+
                 'FROM pimupmas a, pimpmas b                                                   '+
                 'WHERE a.empno = b.empno                                                      '+
                 'AND a.rabasdate = :p_rabasdate                                               '+
                 'AND b.empno     = :p_empno                                                   ';

        ParamByName('p_rabasdate').AsString :=  MainForm.sg_rabasdate;
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;

        Open;
        if Bof and Eof then
            Result := False;
    end;

    with DM.Qr_F2 do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
                 'SELECT SUBSTR(M.rabasdate,1,4)||''/''||                        '+
                 '         SUBSTR(M.rabasdate,5,2)||''/''||                      '+
                 '         SUBSTR(M.rabasdate,7,2) 평가기준일,                   '+
                 '       R.resultscr 업적최종점수,                               '+
                 '       M.Abrscr    능력최종점수,                               '+
                 '       M.berscr    태도최종점수,                               '+
                 '       D.teamscr   팀평가점수,                                 '+
                 '       M.Layn      평가여부,                                   '+
             //     '       R.restiyn   ,                                    '+
                 '       M.evcno     평가표,                                     '+
                 '       CL.codename 직급,                                       '+
                 '       RA.codename 직위,                                       '+
                 '       JG.codename 직군                                        '+
                 '  FROM pyccode CL, pyccode RA, pyccode JG,                     '+
                 '       pehamas M, pehremas R, pehfumas D                       '+
                 ' WHERE M.rabasdate < ''20040101''                              '+
                 '   AND M.rabasdate = R.rabasdate (+) AND M.empno = R.empno (+) '+
                 '   AND M.rabasdate = D.rabasdate (+) AND M.empno = D.empno (+) '+
                 '   AND M.paycl  = CL.codeno (+) and ''I112'' = CL.codeid (+)   '+
                 '   AND M.payra  = RA.codeno (+) and ''I113'' = RA.codeid (+)   '+
                 '   AND M.jobgun = JG.codeno (+) and ''I115'' = JG.codeid (+)   '+
                 '   AND M.empno     = :p_empno                                  '+
                 'UNION                                                          '+
                 'SELECT  P.rabasyear || ''/'' || DECODE(b.cnt, 1,''06/30'', 2,''12/31'') 평가기준일, '+
		 '	  DECODE(b.cnt, 1, P.resultscr1,  2,  P.resultscr2) 업적최종점수,             '+
		 '	  DECODE(b.cnt, 1, P.abilityscr1, 2,  P.abilityscr2)능력최종점수,             '+
		 '	  0                   태도최종점수,                                           '+
		 '	  0                   팀평가점수,                                             '+
		 '	  ''Y''               팀평가여부,                                             '+
		 '	  0                   평가표,                                                 '+
		 '	  CL.codename         직급,                                                   '+
                 '        RA.codename         직위,                                                   '+
                 '        JG.codename         직군                                                    '+
                 'FROM pyccode CL, pyccode RA, pyccode JG,                                            '+
                 '     pehevhis P, ( SELECT ROWNUM cnt FROM pimpmas WHERE ROWNUM < 3 ) b              '+
                 'WHERE P.rabasyear >= ''2004''                                                       '+
                 'AND P.paycl  = CL.codeno (+) AND ''I112'' = CL.codeid (+)                           '+
                 'AND P.payra  = RA.codeno (+) AND ''I113'' = RA.codeid (+)                           '+
                 'AND P.jobgun = JG.codeno (+) AND ''I115'' = JG.codeid (+)                           '+
                 'AND P.empno     = :p_empno                                                          '+
                 'ORDER BY 평가기준일 DESC                                                            ';




               //  ' ORDER BY M.rabasdate DESC                                     ';
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        Open;

        for iCnt := 0 to FieldCount - 1 do
        begin
            Field := Fields[iCnt];
            Field.Alignment := taCenter;
            case Field.index of
              0 :  Field.DisplayWidth := 12;       // 평가기준일
              1,2,3,4 :                            // 점수
                   begin
                       Field.DisplayWidth := 14;
                       Field.Alignment := taRightJustify;
                   end;
              5 : Field.DisplayWidth := 10;       // 평가여부
              6 : Field.DisplayWidth := 8;        // 평가표
              7,8,9 :                             // 직급 직위 직군
                   begin
                       Field.DisplayWidth := 14;
                       Field.Alignment := taLeftJustify;
                   end;
            end;
        end;
    end;

    with DM.Qr_F3 do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
                 'SELECT SUBSTR(M.rabasdate,1,4)||''/''||                        '+
                 '         SUBSTR(M.rabasdate,5,2)||''/''||                      '+
                 '         SUBSTR(M.rabasdate,7,2) 평가기준일,                   '+
                 '       R.teamscr      실평가점수,                              '+
                 //'       M.lscore       개인평가점수,                            '+
                 '       R.abilscr      개인평가점수,                            '+
                 '       R.behavscr     최고경영자점수,                          '+
                 '       M.dyn          평가여부,                                '+
                 '       CL.codename    직급,                                    '+
                 '       RA.codename    직위                                     '+
                 '  FROM pyccode CL, pyccode RA, pmmmas M, pehfumas R            '+
                 ' WHERE M.rabasdate = R.rabasdate (+) AND M.empno = R.empno (+) '+
                 '   AND M.paycl    = CL.codeno (+) and ''I112'' = CL.codeid (+) '+
                 '   AND M.payra    = RA.codeno (+) and ''I113'' = RA.codeid (+) '+
                 '   AND M.empno    = :p_empno                                   '+
                 ' ORDER BY M.rabasdate DESC                                     ';
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        Open;

        for iCnt := 0 to FieldCount - 1 do
        begin
            Field := Fields[iCnt];
            Field.Alignment := taCenter;
            case Field.index of
              0 :  Field.DisplayWidth := 13;       // 평가기준일
              1,2,3 :                              // 점수
                   begin
                       Field.DisplayWidth := 15;
                       Field.Alignment := taRightJustify;
                   end;
              4 : Field.DisplayWidth := 11;        // 평가여부
              5,6 :                                // 직급 직위
                   begin
                       Field.DisplayWidth := 15;
                       Field.Alignment := taLeftJustify;
                   end;
            end;
        end;
    end;

    with DM.Qr_F4 do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
                 'SELECT SUBSTR(intodate,1,4)||''/''||                        '+
                 '         SUBSTR(intodate,5,2)||''/''||                      '+
                 '         SUBSTR(intodate,7,2) 평가기준일,                   '+
                 '       adjscore 고과점수,                                   '+
                 '       ingoyn   평가여부                                    '+
                 '  FROM pihingo                                              '+
                 ' WHERE empno = :p_empno                                     '+
                 ' ORDER BY intodate DESC                                     ';
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        Open;

        for iCnt := 0 to FieldCount - 1 do
        begin
            Field := Fields[iCnt];
            Field.Alignment := taCenter;
            case Field.index of
              0 :  Field.DisplayWidth := 34;       // 평가기준일
              1 :  begin                           // 점수
                       Field.DisplayWidth := 36;
                       Field.Alignment := taRightJustify;
                   end;
              2 : Field.DisplayWidth := 32;        // 평가여부
            end;
        end;
    end;

    if Result = False then
    begin
        MessageDlg('자료가 존재하지 않습니다...',mtInformation,[mbOk],0);
        Bt_Save.Enabled := False;
        Bt_Del.Enabled  := False;
        Bt_Batch.Enabled:= False;

        DM.Qr_F2.Close;
        DM.Qr_F3.Close;
        DM.Qr_F4.Close;
    end
    else
    begin
        Bt_Save.Enabled := True;
        Bt_Del.Enabled  := True;
        Bt_Batch.Enabled:= True;

        fzDisplayPimramas;
    end;

    DM.Qr_F1.Close;
end;

// Read_pimramas에서 조회된 데이타를 화면에 디스플레이한다.
procedure TFm_SubForm2.fzDisplayPimramas;
begin
    with DM.Qr_F1 do
    begin
        // 승격점수사항  pedbutil
        peFieldDisplay(Self,DM.Qr_F1,5,99);

        // 승격내역을 설정한다.
        MainForm.Pe_Date.GetDept(FieldByName('orgnum').AsString, FieldByName('deptcode').AsString);
        PJL_Deptname.TextCaption     := MainForm.Pe_Date.Deptname;

        MainForm.Pe_Date.GetCode('I114',FieldByName('pstate').AsString);
        PJL_Pstatename.TextCaption   := MainForm.Pe_Date.Codename;

        MainForm.Pe_Date.GetCode('I113',FieldByName('payra').AsString);
        PJL_Payraname.TextCaption    := MainForm.Pe_Date.Codename;

        MainForm.Pe_Date.GetCode('I112',FieldByName('paycl').AsString);
        PJL_Payclname.TextCaption    := MainForm.Pe_Date.Codename;

        MainForm.Pe_Date.GetCode('I115',FieldByName('jobgun').AsString);
        PJL_Jobgunname.TextCaption   := MainForm.Pe_Date.Codename;

        //승격심사사항 pedbutil
        peFieldDisplay(Self,DM.Qr_F1,5,88);

        PDE_radeptcode.Valuer.orgnum   := FieldByName('raorgnum').AsString;
        PDE_radeptcode.Valuer.deptcode := FieldByName('radeptcode').AsString;
        MainForm.Pe_Date.GetDept(PDE_radeptcode.Valuer.orgnum, PDE_radeptcode.Valuer.deptcode);
        PJL_raDeptname.TextCaption     := MainForm.Pe_Date.deptname;
        MainForm.Pe_Date.GetCode('I113',FieldByName('rapayra').AsString);
        PJL_rapayraname.TextCaption    := MainForm.Pe_Date.Codename;
        MainForm.Pe_Date.GetCode('I112',FieldByName('rapaycl').AsString);
        PJL_rapayclname.TextCaption    := MainForm.Pe_Date.Codename;
        MainForm.Pe_Date.GetCode('I115',FieldByName('rajobgun').AsString);
        PJL_rajobgunname.TextCaption   := MainForm.Pe_Date.Codename;
      

    end;
end;

// 입력한 데이타를 체크한다.
function TFm_SubForm2.fnCheckFields: Boolean;
begin
    Result := False;

    // 승격심사사항
    if (trim(PDE_RaDeptcode.orgnum) = '') or (trim(PDE_RaDeptcode.Text) = '') then
    begin
        MessageDlg('승격심사사항의 부서 항목 에러.',mtInformation,[mbOk],0);
        PDE_RaDeptcode.SetFocus;
        System.Exit;
    end;
    if trim(PCE_RaPayra.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직위 항목 에러.',mtInformation,[mbOk],0);
        PCE_RaPayra.SetFocus;
        System.Exit;
    end;
    if trim(PCE_RaPaycl.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직급 항목 에러.',mtInformation,[mbOk],0);
        PCE_RaPaycl.SetFocus;
        System.Exit;
    end;
    if trim(PCE_RaJobgun.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직군 항목 에러.',mtInformation,[mbOk],0);
        PCE_RaJobgun.SetFocus;
        System.Exit;
    end;
    if trim(PPC_RaObjyn.Text) = '' then
    begin
        MessageDlg('승격심사사항의 승격대상여부 항목 에러.',mtInformation,[mbOk],0);
        PPC_RaObjyn.SetFocus;
        System.Exit;
    end;

    // 승격점수사항
    if PNE_payclyy.Value < 0 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(년수)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclyy.SetFocus;
        system.exit;
    end;
    if PNE_payclmm.Value < 0 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(개월수)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclmm.SetFocus;
        system.exit;
    end;
    if PNE_payclmm.Value >= 12 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(월은 12보다 클 수 없습니다.)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclmm.SetFocus;
        system.exit;
    end;
    if trim(PCB_uppointyn.Text) = '' then
    begin
        MessageDlg('승격점수사항의 최소승격년한대상여부 항목 에러.',mtInformation,[mbOk],0);
        PCB_uppointyn.SetFocus;
        System.Exit;
    end;
    if PNE_Proscore.Value < 0 then
    begin
        MessageDlg('승격점수사항의 제안점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_Proscore.SetFocus;
        System.Exit;
    end;
    if trim(PCB_edupointyn.Text) = '' then
    begin
        MessageDlg('승격점수사항의 교육여부 항목 에러.',mtInformation,[mbOk],0);
        PCB_edupointyn.SetFocus;
        System.Exit;
    end;
    if trim(PCB_shiftyn.Text) = '' then
    begin
        MessageDlg('승격점수사항의 전환배치여부 항목 에러.',mtInformation,[mbOk],0);
        PCB_shiftyn.SetFocus;
        System.Exit;
    end;


    PNE_payclyymmExit(nil);
    PNE_proscoreExit(nil);
    if gbValieOK = False then //gbValieOK := False;
        System.Exit;

    Result := True;
end;

procedure TFm_SubForm2.PEE_empnoEnter(Sender: TObject);
begin
    peInitComponent(Self,99);
    peInitComponent(Self,88);
    peInitComponent(Self,77);
    Le1empno := '';
    Le1inwon := 0;

    Bt_Save.Enabled := False;
    Bt_Del.Enabled  := False;
    Bt_Batch.Enabled:= False;
end;

procedure TFm_SubForm2.PEE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        PDE_radeptcode.SetFocus;
end;

procedure TFm_SubForm2.PEE_empnoExit(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
        System.Exit;

    Up_Data := fnReadPimramas;
    if not Up_Data then // 없으면
    begin
        PDE_radeptcode.SetFocus;
        PEE_empno.SetFocus;
    end;
end;

procedure TFm_SubForm2.PEE_empnoActionEvent(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
    begin
        PEE_empno.SetFocus;
        System.Exit;
    end;

    MainForm.St_Help.Panels[0].Text := '데이타를 읽고 있는 중입니다.';
    MainForm.St_Help.Perform(WM_PAINT,0,0);


    Up_Data := fnReadPimramas;

    Bt_Save.Enabled := True;
    Bt_Del.Enabled  := True;
    Bt_Batch.Enabled:= True;
    MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm2.Cb_ynChange(Sender: TObject);
begin
    if TComponent(Sender).Name = 'PPC_raobjyn' then
    begin
        if TPeJeonPanelComboBox(Sender).ItemIndex = 0 then
        begin
            if PPC_raobjyn.Text = '' then
                PPC_raobjyn.Text := MainForm.Pe_Date.DateVal;
        end
        else
            PPC_raobjyn.Text := '';
    end;

    if TComponent(Sender).Name = 'PCB_minrayearyn' then
    begin
        if TPeJeonPanelComboBox(Sender).ItemIndex = 0 then
        begin
            if PCB_uppointyn.Text = '' then
                PCB_uppointyn.Text := MainForm.Pe_Date.DateVal;
        end
        else
            PCB_uppointyn.Text := '';
    end;

    if TComponent(Sender).Name = 'PCB_edupointyn' then
    begin
        if TPeJeonPanelComboBox(Sender).ItemIndex = 0 then
        begin
            if PCB_edupointyn.Text = '' then
                PCB_edupointyn.Text := MainForm.Pe_Date.DateVal;
        end
        else
            PCB_edupointyn.Text := '';
    end;

    if TComponent(Sender).Name = 'PCB_shiftyn' then
    begin
        if TPeJeonPanelComboBox(Sender).ItemIndex = 0 then
        begin
            if PCB_shiftyn.Text = '' then
                PCB_shiftyn.Text := MainForm.Pe_Date.DateVal;
        end
        else
            PCB_shiftyn.Text := '';
    end;
end;

procedure TFm_SubForm2.PNE_payclyymmExit(Sender: TObject);
begin
    gbValieOK := False;

    if trim(PEE_empno.Valuer.empno) = '' then
        system.exit;
    if trim(PCE_rapaycl.Text) = '' then
    begin
        MessageBox(handle,'승격심사 직급 확인하십시요','에러',MB_OK or $0020);
        system.exit;
    end;
    if PNE_payclyy.Value < 0 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(년수)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclyy.SetFocus;
        system.exit;
    end;
    if PNE_payclmm.Value < 0 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(개월수)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclmm.SetFocus;
        system.exit;
    end;
    if PNE_payclmm.Value >= 12 then
    begin
        MessageBox(handle,'승격점수사항의 재급기간 년월(월은 12보다 클 수 없습니다.)을 확인하십시요','에러',MB_OK or $0020);
        PNE_payclmm.SetFocus;
        system.exit;
    end;

    with DM.Q_Main do
    begin
        Close;
        Sql.Clear;
        Sql.Text := 'SELECT duscore FROM pimraduscr                                 '+
                    '  WHERE rabasdate = :p_rabasdate                               '+
                    '    AND paycl = :p_rapaycl                                     '+
                    '    AND :p_payclyy * 12 + :p_payclmm BETWEEN dummfr AND dummto ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_rabasdate;
        ParamByName('p_rapaycl').AsString   := PCE_rapaycl.Text;
        ParamByName('p_payclyy').AsInteger  := Round(PNE_payclyy.Value);
        ParamByName('p_payclmm').AsInteger  := Round(PNE_payclmm.Value);
        Open;

        PNE_edupoint.Value := FieldByName('duscore').AsFloat;
    end;

   // PNE_payclscr.Value := PNE_totscr.Value  + PNE_edupoint.Value +
   //                        PNE_qpayclscr.Value + PNE_uppoint.Value + PNE_rewscore.Value;

    gbValieOK := True;
end;

procedure TFm_SubForm2.PNE_proscoreExit(Sender: TObject);
begin
    gbValieOK := False;

    if trim(PEE_empno.Valuer.empno) = '' then
        system.exit;
    //if PNE_proscore.Value > 0 then
    //begin
    //    system.exit;
    //end;
    if trim(PCE_rapaycl.Text) = '' then
    begin
        MessageBox(handle,'승격심사 직급 확인하십시요','에러',MB_OK or $0020);
        system.exit;
    end;

    PNE_uppoint.Value := PNE_suggscr.Value + PNE_proscore.Value;

    with DM.Q_Main do
    begin
        Close;
        Sql.Clear;
        Sql.Text := 'SELECT NVL(value6,0) value6 FROM pimrabas                      '+
                    '  WHERE rabasdate = :p_rabasdate                               '+
                    '    AND gubun = ''30''                                         '+
                    '    AND paycl = :p_rapaycl                                     '+
                    '    AND jobgun = ''00''                                        ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_rabasdate;
        ParamByName('p_rapaycl').AsString   := PCE_rapaycl.Text;
        Open;

        if (DM.Q_Main.BOF) and (DM.Q_Main.EOF) then // 자료가 없으면
            PNE_uppoint.Value := 0
        else
        begin
          if PNE_uppoint.Value > FieldByName('value6').AsFloat then
            PNE_uppoint.Value := FieldByName('value6').AsFloat;
        end
    end;

    //PNE_payclscr.Value := PNE_totscr.Value  + PNE_edupoint.Value +
    //                       PNE_qpayclscr + PNE_prizescr.Value + PNE_uppoint.Value;

    gbValieOK := True;
end;

procedure TFm_SubForm2.Bt_SaveClick(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
        System.Exit;

    if MessageBox(handle,'수정한 데이타를 저장하시겠습니까 ?.','작업정보',MB_YESNO) <> IDYes then
        System.Exit;

    // 입력 데이타 체킹.
    if not fnCheckFields then
        System.Exit;

    MainForm.St_Help.Panels[0].Text := ' 수정한 데이타 저장 중입니다 !.';
    UpDateWindow(MainForm.St_Help.Handle);

  TRY
    with DM.Q_Exec do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
          'UPDATE pimramas                                                  '+
          'SET                                                              '+
          '    raorgnum    = '''+ PDE_radeptcode.Valuer.orgnum    +''' ,    '+
          '    radeptcode  = '''+ PDE_radeptcode.Text             +''' ,    '+
          '    rapayra     = '''+ PCE_rapayra.Text                +''' ,    '+
          '    rapaycl     = '''+ PCE_rapaycl.Text                +''' ,    '+
          '    rajobgun    = '''+ PCE_rajobgun.Text               +''' ,    '+
          '    raobjyn     = '''+ PPC_raobjyn.Text                +''' ,    '+
          '    raexsayu    = '''+ PPE_raexsayu.Text               +''' ,    '+
          '    minrayearyn = '''+ PCB_uppointyn.Text            +''' ,    '+
          '    payscore    =   '+ floattostr(PNE_edupoint.Value)  +'   ,    '+
          '    payclyy     =   '+ floattostr(PNE_payclyy.Value)   +'   ,    '+
          '    payclmm     =   '+ floattostr(PNE_payclmm.Value)   +'   ,    '+
          '    proscore    =   '+ floattostr(PNE_proscore.Value)  +'   ,    '+
          '    rewscore    =   '+ floattostr(PNE_uppoint.Value)  +'   ,    '+
          '    raisscore   =   '+ floattostr(PNE_payclscr.Value) +'   ,    '+
          '    raisyn      = '''+ PCB_edupointyn.Text                 +''' ,    '+
          '    writeemp    = '''+ MainForm.pEmpno                 +''' ,    '+
          '    writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')         '+
          '  WHERE rabasdate = :p_rabasdate                                 '+
          '    AND empno     = :p_empno                                     ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_RabasDate;
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        ExecSql;

        Close;
        Sql.Clear;
        Sql.Text :=
          'UPDATE pimramas M                                                '+
          'SET (rafunccode, raplacecode)  =                                 '+
          '    (SELECT deptfunc, placecode FROM pycdept D                   '+
          '     WHERE D.orgnum = M.raorgnum AND D.deptcode = M.radeptcode)  '+
          '  WHERE rabasdate = :p_rabasdate                                 '+
          '    AND empno     = :p_empno                                     ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_RabasDate;
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        ExecSql;
    end;

    PEE_empno.SetFocus;
    //PEE_empnoEnter(Sender);

    MainForm.St_Help.Panels[0].Text := '저장 작업이 완료되었습니다.';

  EXCEPT ON E : EDBEngineError DO
    begin
        MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
    end;
  END;
end;

procedure TFm_SubForm2.Bt_delClick(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
        System.Exit;

    if MessageBox(handle,'현재 데이타를 삭제하시겠습니까 ?.'#13#13+
                         '주의 하시기 바랍니다 !!.','작업정보',MB_YESNO+MB_DEFBUTTON2) <> IDYes then
        System.Exit;

    MainForm.St_Help.Panels[0].Text := ' 현재 데이타 삭제 중입니다 !.';
    UpDateWindow(MainForm.St_Help.Handle);

  TRY
    with DM.Q_Exec do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
          'DELETE FROM pimramas                                             '+
          '  WHERE rabasdate = :p_rabasdate                                 '+
          '    AND empno     = :p_empno                                     ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_RabasDate;
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;
        ExecSql;
    end;

    PEE_empno.SetFocus;
    //PEE_empnoEnter(Sender);

    MainForm.St_Help.Panels[0].Text := '삭제 작업이 완료되었습니다.';

  EXCEPT ON E : EDBEngineError DO
    begin
        MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
    end;
  END;
end;

procedure TFm_SubForm2.Bt_BatchClick(Sender: TObject);
var
  bBatchOk: Boolean;
begin
    if PEE_empno.Valuer.empno = '' then
        System.Exit;

    if MessageBox(handle,'작업 수행시 기계산된 승격점수가 재계산 됩니다.'#13#13+
                         ' 작업을 계속하시겠습니까 ?.','작업정보',MB_YESNO) <> IDYes then
        System.Exit;

    // 입력 데이타 체킹.
    if not fnCheckFields then
        System.Exit;

    MainForm.St_Help.Panels[0].Text := ' 승격점수 재계산 중입니다 !.';
    UpDateWindow(MainForm.St_Help.Handle);

    // 계산
    MainForm.fzSetBaseDates;
    workgubun := '승격재계산';
    // 초기화
    MainForm.sv_empno       := PEE_empno.Valuer.empno;
    MainForm.sv_korname     := PEE_empno.Valuer.korname;
    MainForm.sv_rapaycl     := PCE_rapaycl.Text;
    MainForm.sv_rajobgun    := PCE_rajobgun.Text;
    MainForm.sv_raobjyn     := PPC_raobjyn.Text;
    MainForm.sv_raexsayu    := PPE_raexsayu.Text;
    MainForm.sv_minrayearyn := PCB_uppointyn.Text;
    MainForm.sv_paycldate   := PJL_paycldate.Text;
    MainForm.sv_raisdate    := PJL_raisdate.Text;
    MainForm.iv_payclyy     := Round(PNE_payclyy.Value);
    MainForm.iv_payclmm     := Round(PNE_payclmm.Value);
    MainForm.fv_payscore    := PNE_edupoint.Value;
    MainForm.fv_proscore    := PNE_proscore.Value;

  TRY
    bBatchOk := False;



    bBatchOk := True;

    MessageBox(handle,'승격점수 재계산을 성공적으로 완료하였습니다. !!!','성공',MB_OK) ;

    //PEE_empno.SetFocus;
    //PEE_empnoEnter(Sender);

    MainForm.St_Help.Panels[0].Text := '';
    PEE_empnoActionEvent(Sender);
  FINALLY
    if bBatchOk = False then
        MessageBox(handle,'승격점수 재계산을 실패???','에러',MB_OK+MB_ICONWARNING) ;
  END;
end;

procedure TFm_SubForm2.PDE_radeptcodeExit(Sender: TObject);
begin
    MainForm.Pe_Date.GetDept(PDE_radeptcode.Valuer.orgnum, PDE_radeptcode.Text);
    PJL_raDeptname.TextCaption     := MainForm.Pe_Date.deptname;
    if PJL_raDeptname.TextCaption = '' then
        PJL_raDeptname.Setfocus;
end;

end.

