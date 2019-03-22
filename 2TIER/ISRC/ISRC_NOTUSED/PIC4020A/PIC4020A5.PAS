unit pic4020a5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, pebtnedit, peempnobtnedit, ExtCtrls, peoutlookbtn,
  pegradpanl, pedeptbtnedit, pecodebtnedit, PeJeonBtnDateEdit, PeJeonLabel,
  peextcombo, ComCtrls, peNumedit, pedballutil, pedbutil, Db, DbTables,
  PeJeonMemo, Grids, DBGrids, pedbgrid;

type
  TFm_SubForm5 = class(TForm)
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    Panel1: TPanel;
    PEE_empno: TPeEmpnoEdit;
    Panel2: TPanel;
    PCE_payra: TPeCodeEdit;
    PPE_remark: TPePanelEdit;
    Pg_Control: TPageControl;
    TabSheet1: TTabSheet;
    PJL_raisdate: TPeJeonLabel;
    PCB_edupointyn: TPeJeonPanelComboBox;
    PNE_uppoint_2year: TPePanelNumEdit;
    PCB_uppointyn: TPeJeonPanelComboBox;
    TabSheet2: TTabSheet;
    PDG_F2: TPeJeonDbGrid;
    PCE_paycl: TPeCodeEdit;
    PCE_jobgun: TPeCodeEdit;
    PPC_upyn: TPeJeonPanelComboBox;
    PJL_deptname: TPeJeonLabel;
    PDE_deptcode: TPeDeptEdit;
    PJL_payraname: TPeJeonLabel;
    PJL_payclname: TPeJeonLabel;
    PJL_jobgunname: TPeJeonLabel;
    PNE_payclyy: TPePanelNumEdit;
    PNE_payclmm: TPePanelNumEdit;
    Label2: TLabel;
    Label3: TLabel;
    PCB_shiftyn: TPeJeonPanelComboBox;
    PNE_uppoint: TPePanelNumEdit;
    PNE_edupoint: TPePanelNumEdit;
    PNE_totscr: TPePanelNumEdit;
    PNE_payclscr: TPePanelNumEdit;
    PNE_qpayclscr: TPePanelNumEdit;
    PNE_suggscr: TPePanelNumEdit;
    PNE_prizescr: TPePanelNumEdit;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    PJL_paycldate: TPePanelBtnDateEdit;
    PJL_jobname: TPeJeonLabel;
    PDE_jobdept: TPeDeptEdit;
    PJL_extname: TPeJeonLabel;
    PDE_extcode: TPeDeptEdit;
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
    procedure PEE_empnoActionEvent(Sender: TObject);
    procedure PDE_deptcodeExit(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure PDE_jobdeptExit(Sender: TObject);
    procedure PDE_extcodeExit(Sender: TObject);
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

    function  fnReadPimupMas : Boolean; // 업적평가마스터와 평가자관리 화일과 조인하여 데이타를 읽어온다.
    function  fnCheckFields: Boolean; // 입력한 데이타를 체크한다.
    procedure fzDisplayPimupMas; // Read_PimupMas에서 조회된 데이타를 화면에 디스플레이한다.
  public
    { Public declarations }
  end;

implementation

uses
  peDm, peMainForm, pic4020a1;

{$R *.DFM}

procedure TFm_SubForm5.FormCreate(Sender: TObject);
begin
    Start := True;
end;

procedure TFm_SubForm5.FormShow(Sender: TObject);
begin
    if Start then
    begin
        Start := not Start;
        Application.ProcessMessages;

        MainForm.Pe_Date.GetOrgnum;
        PDE_deptcode.orgnum := MainForm.Pe_Date.orgnum;

        MainForm.fzSetBaseDates;

        Pg_Control.ActivePage := TabSheet1;
        PEE_Empno.SetFocus;
    end;

  //하은영
  if (MainForm.pEmpno = '1031') or (MainForm.pEmpno = '1076') or (copy(MainForm.pEmpno,1,1) = 'D') then
    Bt_Save.Visible := True;
end;

procedure TFm_SubForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

// 승격마스터 데이타를 읽어온다.
function TFm_SubForm5.fnReadPimupMas: Boolean;
var
  iCnt : Integer;
  Field: TField;
begin
    Result := True;

    PDG_F2.DataSource := DM.DS_F2;

    //승격마스터
    with DM.Qr_F1 do
    begin
        Close;
        Sql.Clear;
        if  MainForm.Gsysdate < MainForm.Payrachdate  then
        begin
             Sql.Text :=
                 'SELECT a.korname,                                                            '+
                 '       a.orgnum, a.deptcode, a.jobdept, a.extcode, a.paycl,                  '+
                 '       a.payra, a.jobgun,                                                    '+
       	         '       DECODE(a.payra,''16'',''Y'',''2C'',''Y'',''N'') payrayn, b.pstate,    '+
                 '       a.upyn, a.remark,                                                     '+
                 '	     a.payclyy, a.payclmm, a.paycldate, a.rabasdate raisdate,              '+
                 '       a.totscr, a.payclscr, a.uppoint, a.edupoint, a.qpayclscr,             '+
                 '       nvl(a.prizescr,0) prizescr, nvl(a.suggscr,0) suggscr, a.uppoint_2year,'+
                 '       a.uppointyn, a.edupointyn, a.shiftyn                                  '+
                 'FROM pimupmas a, pimpmas b                                                   '+
                 'WHERE a.empno = b.empno                                                      '+
                 'AND a.rabasdate = :p_rabasdate                                               '+
                 'AND b.empno     = :p_empno                                                   ';
        end
        else
        begin
             Sql.Text :=
                 'SELECT a.korname,                                                            '+
                 '       a.orgnum, a.deptcode, a.jobdept, a.extcode, a.paycl,                  '+
                 '       a.payra, a.jobgun,                                                    '+
       	         '       DECODE(a.payra,''A71'',''Y'',''C11'',''Y'',''N'') payrayn, b.pstate,    '+
                 '       a.upyn, a.remark,                                                     '+
                 '	     a.payclyy, a.payclmm, a.paycldate, a.rabasdate raisdate,          '+
                 '       a.totscr, a.payclscr, a.uppoint, a.edupoint, a.qpayclscr,             '+
                 '       nvl(a.prizescr,0) prizescr, nvl(a.suggscr,0) suggscr, a.uppoint_2year,'+
                 '       a.uppointyn, a.edupointyn, a.shiftyn                                  '+
                 'FROM pimupmas a, pimpmas b                                                   '+
                 'WHERE a.empno = b.empno                                                      '+
                 'AND a.rabasdate = :p_rabasdate                                               '+
                 'AND b.empno     = :p_empno                                                   ';
        end;
        ParamByName('p_rabasdate').AsString := MainForm.sg_rabasdate;
        ParamByName('p_empno').AsString     := PEE_empno.Valuer.empno;

        Open;
        if Bof and Eof then
            Result := False;
    end;

    //평가이력
    with DM.Qr_F2 do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
                 'SELECT M.rabasyear    평가년도,                                             '+
                 '       M.resultscr2   업적점수,                                             '+
                 '       M.abilityscr2  역량점수,                                             '+
                 '       M.finalscr     최종점수,                                             '+
                 '       M.finalgrade   최종등급,                                             '+
                 '       decode(M.finalgrade,''S'',100,''A'',90,''B+'',85,''B0'',80,''B'',80,''B-'',75,''C'',70,''D'',60, NULL) 승격점수,     '+
                 '       M.uppoint      승격포인트,                                           '+
                 '       decode(nvl(M.exdudays,0),0,NULL,                                     '+
                 '       exdudesc||''(총''||exdudays||''일) '') 승격제외기간                  '+
                 '  FROM pehevhis M                                                           '+
                 ' WHERE empno = '''+ PEE_empno.Valuer.empno + '''                            '+
                 '   AND rabasyear >=                                                         '+
                 '                   ( select substr(a.paycldate,1,4)                         '+  //하은영 수정
                 '                     from pimupmas a                                        '+
                 '                     where a.empno = '''+ PEE_empno.Valuer.empno + '''      '+
                 '                     and   a.rabasdate = '''+ MainForm.sg_rabasdate + ''' ) '+
                 ' ORDER BY rabasyear DESC                                                    ';
        Open;

        for iCnt := 0 to FieldCount - 1 do
        begin
            Field := Fields[iCnt];
            Field.Alignment := taCenter;
            case Field.index of
              0 :  Field.DisplayWidth := 9;       // 평가기준일
              1,2,3 :                              // 점수
                   begin
                       Field.DisplayWidth := 10;
                       Field.Alignment := taRightJustify;
                   end;
              4,5,6 : Field.DisplayWidth := 10;
              7 : Field.DisplayWidth := 30;
            end;
        end;
    end;

    if Result = False then
    begin
        MessageDlg('자료가 존재하지 않습니다...',mtInformation,[mbOk],0);
        Bt_Save.Enabled := False;
        Bt_Del.Enabled  := False;

        DM.Qr_F2.Close;
    end
    else
    begin
        Bt_Save.Enabled := True;
        Bt_Del.Enabled  := True;

        fzDisplayPimupMas;
    end;

    DM.Qr_F1.Close;
end;

// Read_PimupMas에서 조회된 데이타를 화면에 디스플레이한다.
procedure TFm_SubForm5.fzDisplayPimupMas;
begin
    with DM.Qr_F1 do
    begin
        // 승격점수사항  pedbutil
        peFieldDisplay(Self,DM.Qr_F1,5,99);

        // 승격내역을 설정한다.
        MainForm.Pe_Date.GetDept(FieldByName('orgnum').AsString, FieldByName('deptcode').AsString);
        PJL_Deptname.TextCaption     := MainForm.Pe_Date.Deptname;

        MainForm.Pe_Date.GetDept(FieldByName('orgnum').AsString, FieldByName('jobdept').AsString);
        PJL_jobname.TextCaption     := MainForm.Pe_Date.Deptname;

        MainForm.Pe_Date.GetDept(FieldByName('orgnum').AsString, FieldByName('extcode').AsString);
        PJL_extname.TextCaption     := MainForm.Pe_Date.Deptname;

        MainForm.Pe_Date.GetCode('I113',FieldByName('payra').AsString);
        PJL_Payraname.TextCaption    := MainForm.Pe_Date.Codename;

        MainForm.Pe_Date.GetCode('I112',FieldByName('paycl').AsString);
        PJL_Payclname.TextCaption    := MainForm.Pe_Date.Codename;

        MainForm.Pe_Date.GetCode('I115',FieldByName('jobgun').AsString);
        PJL_Jobgunname.TextCaption   := MainForm.Pe_Date.Codename;
    end;
end;

// 입력한 데이타를 체크한다.
function TFm_SubForm5.fnCheckFields: Boolean;
begin
    Result := False;

    // 승격심사사항
    if (trim(PDE_Deptcode.orgnum) = '') or (trim(PDE_Deptcode.Text) = '') then
    begin
        MessageDlg('승격심사사항의 부서 항목 에러.',mtInformation,[mbOk],0);
        PDE_Deptcode.SetFocus;
        System.Exit;
    end;
    if trim(PCE_Payra.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직위 항목 에러.',mtInformation,[mbOk],0);
        PCE_Payra.SetFocus;
        System.Exit;
    end;
    if trim(PCE_Paycl.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직급 항목 에러.',mtInformation,[mbOk],0);
        PCE_Paycl.SetFocus;
        System.Exit;
    end;
    if trim(PCE_Jobgun.Text) = '' then
    begin
        MessageDlg('승격심사사항의 직군 항목 에러.',mtInformation,[mbOk],0);
        PCE_Jobgun.SetFocus;
        System.Exit;
    end;
    if trim(PPC_upyn.Text) = '' then
    begin
        MessageDlg('승격심사사항의 승격대상여부 항목 에러.',mtInformation,[mbOk],0);
        PPC_upyn.SetFocus;
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
    if PNE_totscr.Value < 0 then
    begin
        MessageDlg('승격점수사항의 종합평가점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_totscr.SetFocus;
        System.Exit;
    end;
    if PNE_payclscr.Value < 0 then
    begin
        MessageDlg('승격점수사항의 재급기간점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_payclscr.SetFocus;
        System.Exit;
    end;
    if PNE_qpayclscr.Value < 0 then
    begin
        MessageDlg('승격점수사항의 재급점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_qpayclscr.SetFocus;
        System.Exit;
    end;
    if PNE_prizescr.Value < 0 then
    begin
        MessageDlg('승격점수사항의 포상점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_prizescr.SetFocus;
        System.Exit;
    end;
    if PNE_suggscr.Value < 0 then
    begin
        MessageDlg('승격점수사항의 제안점수 항목 에러.',mtInformation,[mbOk],0);
        PNE_suggscr.SetFocus;
        System.Exit;
    end;
    if trim(PCB_uppointyn.Text) = '' then
    begin
        MessageDlg('승격점수사항의 승격여부 항목 에러.',mtInformation,[mbOk],0);
        PCB_uppointyn.SetFocus;
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
    if gbValieOK = False then //gbValieOK := False;
        System.Exit;

    Result := True;
end;

procedure TFm_SubForm5.PEE_empnoEnter(Sender: TObject);
begin
    peInitComponent(Self,99);
    Le1empno := '';
    Le1inwon := 0;

    Bt_Save.Enabled := False;
    Bt_Del.Enabled  := False;
end;

procedure TFm_SubForm5.PEE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        PDE_deptcode.SetFocus;
end;

procedure TFm_SubForm5.PEE_empnoExit(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
        System.Exit;

    Up_Data := fnReadPimupMas;
    if not Up_Data then // 없으면
    begin
        PDE_deptcode.SetFocus;
        PEE_empno.SetFocus;
    end;
end;

procedure TFm_SubForm5.PEE_empnoActionEvent(Sender: TObject);
begin
    if PEE_empno.Valuer.empno = '' then
    begin
        PEE_empno.SetFocus;
        System.Exit;
    end;

    MainForm.St_Help.Panels[0].Text := '데이타를 읽고 있는 중입니다.';
    MainForm.St_Help.Perform(WM_PAINT,0,0);


    Up_Data := fnReadPimupMas;

    Bt_Save.Enabled := True;
    Bt_Del.Enabled  := True;
    MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm5.Cb_ynChange(Sender: TObject);
begin
    if TComponent(Sender).Name = 'PPC_objyn' then
    begin
        if TPeJeonPanelComboBox(Sender).ItemIndex = 0 then
        begin
            if PPC_upyn.Text = '' then
                PPC_upyn.Text := MainForm.Pe_Date.DateVal;
        end
        else
            PPC_upyn.Text := '';
    end;

    if TComponent(Sender).Name = 'PCB_uppointyn' then
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

procedure TFm_SubForm5.PNE_payclyymmExit(Sender: TObject);
begin
    gbValieOK := False;

    if trim(PEE_empno.Valuer.empno) = '' then
        system.exit;
    if trim(PCE_paycl.Text) = '' then
    begin
        MessageBox(handle,'승격심사 BAND 확인하십시요','에러',MB_OK or $0020);
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

    gbValieOK := True;
end;

procedure TFm_SubForm5.Bt_SaveClick(Sender: TObject);
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
          'UPDATE PimupMas                                                          '+
          'SET                                                                      '+
          '    paycldate      = '''+ PJL_paycldate.Text                   +''' ,    '+
          '    deptcode       = '''+ PDE_deptcode.Text                    +''' ,    '+
          '    jobdept        = '''+ PDE_jobdept.Text                     +''' ,    '+
          '    extcode        = '''+ PDE_extcode.Text                     +''' ,    '+
          '    payra          = '''+ PCE_payra.Text                       +''' ,    '+
          '    paycl          = '''+ PCE_paycl.Text                       +''' ,    '+
          '    jobgun         = '''+ PCE_jobgun.Text                      +''' ,    '+
          '    upyn           = '''+ PPC_upyn.Text                        +''' ,    '+
          '    remark         = '''+ PPE_remark.Text                      +''' ,    '+
          '    payclyy        =   '+ floattostr(PNE_payclyy.Value)        +'   ,    '+
          '    payclmm        =   '+ floattostr(PNE_payclmm.Value)        +'   ,    '+
          '    uppointyn      = '''+ PCB_uppointyn.Text                   +''' ,    '+
          '    uppoint        =   '+ floattostr(PNE_uppoint.Value)        +'   ,    '+
          '    edupointyn     = '''+ PCB_edupointyn.Text                  +''' ,    '+
          '    edupoint       =   '+ floattostr(PNE_edupoint.Value)       +'   ,    '+
          '    shiftyn        = '''+ PCB_shiftyn.Text                     +''' ,    '+
          '    totscr         =   '+ floattostr(PNE_totscr.Value)         +'   ,    '+
          '    payclscr       =   '+ floattostr(PNE_payclscr.Value)       +'   ,    '+
          '    qpayclscr      =   '+ floattostr(PNE_qpayclscr.Value)      +'   ,    '+
          '    prizescr       =   '+ floattostr(PNE_prizescr.Value)       +'   ,    '+
          '    suggscr        =   '+ floattostr(PNE_suggscr.Value)        +'   ,    '+
          '    uppoint_2year  =   '+ floattostr(PNE_uppoint_2year.Value)  +'        '+
          '  WHERE rabasdate = :p_rabasdate                                         '+
          '    AND empno     = :p_empno                                             ';
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

procedure TFm_SubForm5.Bt_delClick(Sender: TObject);
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
          'DELETE FROM PimupMas                                             '+
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

procedure TFm_SubForm5.PDE_deptcodeExit(Sender: TObject);
begin
    MainForm.Pe_Date.GetDept(PDE_deptcode.Valuer.orgnum, PDE_deptcode.Text);
    PJL_Deptname.TextCaption     := MainForm.Pe_Date.deptname;
    if PJL_Deptname.TextCaption = '' then
        PJL_Deptname.Setfocus;
end;

procedure TFm_SubForm5.PeJeonOutLookBtn1Click(Sender: TObject);
begin
  if MessageBox(handle,'BAND가 L2인 경우만 승격대상여부를 "Y"로 처리하시겠습니까 ?.','작업정보',MB_YESNO) <> IDYes then
      System.Exit;

  MainForm.St_Help.Panels[0].Text := ' 현재 데이타 처리 중입니다 !.';
  UpDateWindow(MainForm.St_Help.Handle);

  TRY
    with DM.Q_Exec do
    begin
        Close;
        Sql.Clear;
        Sql.Text :=
          'UPDATE PimupMas  SET upyn = ''Y''                                '+
          '  WHERE rabasdate = :p_rabasdate                                 '+
          '    AND ((paycl   = ''10'')  or (paycl = ''C11''))               ';
        ParamByName('p_rabasdate').AsString := MainForm.sg_RabasDate;
        ExecSql;
    end;

    PEE_empno.SetFocus;
    //PEE_empnoEnter(Sender);

    MainForm.St_Help.Panels[0].Text := '작업이 완료되었습니다.';

  EXCEPT ON E : EDBEngineError DO
    begin
        MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
    end;
  END;
end;

procedure TFm_SubForm5.PDE_jobdeptExit(Sender: TObject);
begin
  MainForm.Pe_Date.GetDept(PDE_jobdept.Valuer.orgnum, PDE_jobdept.Text);
  PJL_jobname.TextCaption     := MainForm.Pe_Date.deptname;
  if PJL_jobname.TextCaption = '' then
     PJL_jobname.Setfocus;
end;

procedure TFm_SubForm5.PDE_extcodeExit(Sender: TObject);
begin
  MainForm.Pe_Date.GetDept(PDE_extcode.Valuer.orgnum, PDE_extcode.Text);
  PJL_extname.TextCaption     := MainForm.Pe_Date.deptname;
  if PJL_extname.TextCaption = '' then
     PJL_extname.Setfocus;
end;

end.

