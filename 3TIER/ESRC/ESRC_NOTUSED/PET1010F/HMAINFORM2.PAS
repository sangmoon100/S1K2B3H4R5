unit HMainForm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnInsaCommon,kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, NotesHana_TLB, OnEditCombo,
  pass, registry, PDownLoad, Func;

type
  TFM_Main2 = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    TMaxSession: TTMaxSession;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnShapeLabel1: TOnShapeLabel;
    L_e1emp: TOnShapeLabel;
    L_e2emp: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    DBSet1: TTMaxDataSet;
    DataSource1: TDataSource;
    SB_1: TOnSkinButton;
    Notebook1: TNotebook;
    NE_Score1: TOnNumberEdit;
    DBcommon: TTMaxDataSet;
    TMaxDML_HInsa: TTMaxDataSet;
    BT_Save: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BitBtn1: TBitBtn;
    SB_2: TOnSkinButton;
    L_help: TLabel;
    Bt_Add: TOnFocusButton;
    Bt_OConfirm: TOnFocusButton;
    DBSet2: TTMaxDataSet;
    pan_common1: TPanel;
    sGrid1: TStringGrid;
    Label1: TLabel;
    Label3: TLabel;
    LRsontrScr: TLabel;
    pan_common2: TPanel;
    sGrid2: TStringGrid;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText1: TStaticText;
    Label6: TLabel;
    Label7: TLabel;
    Panel34: TPanel;
    StaticText5: TStaticText;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    ScrollBox1: TScrollBox;
    pnl_1: TPanel;
    SB_S1: TOnSkinButton;
    SB_A1: TOnSkinButton;
    SB_B1: TOnSkinButton;
    SB_C1: TOnSkinButton;
    SB_D1: TOnSkinButton;
    L_DetailTask1: TOnShapeLabel;
    L_detailweight1: TOnShapeLabel;
    L_validx1: TOnShapeLabel;
    L_bresultclass1: TOnShapeLabel;
    L_valfunction1: TOnShapeLabel;
    SelfScore1: TOnShapeLabel;
    DownScore1: TOnShapeLabel;
    pnl_no1: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    E_Aim1: TOnEdit;
    SelfClass1: TPanel;
    DownClass1: TPanel;
    pnl_2: TPanel;
    SB_S2: TOnSkinButton;
    SB_A2: TOnSkinButton;
    SB_B2: TOnSkinButton;
    SB_C2: TOnSkinButton;
    SB_D2: TOnSkinButton;
    DownScore2: TOnShapeLabel;
    L_valfunction2: TOnShapeLabel;
    L_bresultclass2: TOnShapeLabel;
    L_validx2: TOnShapeLabel;
    L_detailweight2: TOnShapeLabel;
    L_DetailTask2: TOnShapeLabel;
    SelfScore2: TOnShapeLabel;
    pnl_no2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel15: TPanel;
    E_Aim2: TOnEdit;
    SelfClass2: TPanel;
    DownClass2: TPanel;
    pnl_3: TPanel;
    SB_S3: TOnSkinButton;
    SB_A3: TOnSkinButton;
    SB_B3: TOnSkinButton;
    SB_C3: TOnSkinButton;
    SB_D3: TOnSkinButton;
    DownScore3: TOnShapeLabel;
    L_valfunction3: TOnShapeLabel;
    L_bresultclass3: TOnShapeLabel;
    L_validx3: TOnShapeLabel;
    L_detailweight3: TOnShapeLabel;
    L_DetailTask3: TOnShapeLabel;
    SelfScore3: TOnShapeLabel;
    pnl_no3: TPanel;
    E_Aim3: TOnEdit;
    SelfClass3: TPanel;
    DownClass3: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel23: TPanel;
    pnl_4: TPanel;
    SB_S4: TOnSkinButton;
    SB_A4: TOnSkinButton;
    SB_B4: TOnSkinButton;
    SB_C4: TOnSkinButton;
    SB_D4: TOnSkinButton;
    DownScore4: TOnShapeLabel;
    L_valfunction4: TOnShapeLabel;
    L_bresultclass4: TOnShapeLabel;
    L_validx4: TOnShapeLabel;
    L_detailweight4: TOnShapeLabel;
    L_DetailTask4: TOnShapeLabel;
    SelfScore4: TOnShapeLabel;
    pnl_no4: TPanel;
    E_Aim4: TOnEdit;
    SelfClass4: TPanel;
    DownClass4: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    pnl_5: TPanel;
    SB_S5: TOnSkinButton;
    SB_A5: TOnSkinButton;
    SB_B5: TOnSkinButton;
    SB_C5: TOnSkinButton;
    SB_D5: TOnSkinButton;
    Shape13: TShape;
    DownScore5: TOnShapeLabel;
    L_valfunction5: TOnShapeLabel;
    L_bresultclass5: TOnShapeLabel;
    L_validx5: TOnShapeLabel;
    L_detailweight5: TOnShapeLabel;
    L_DetailTask5: TOnShapeLabel;
    SelfScore5: TOnShapeLabel;
    pnl_no5: TPanel;
    E_Aim5: TOnEdit;
    SelfClass5: TPanel;
    DownClass5: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    NE_Score3: TOnNumberEdit;
    DBG_user: TOnGrDbGrid;
    OnFocusButton1: TOnFocusButton;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    E_Ratio: TOnEdit;
    LEsontrScr: TLabel;
    OnScrSave: TOnFocusButton;
    On_RContrScr: TOnComboEdit;
    NE_Score2: TOnNumberEdit;
    L_Confirm: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure Eda_plan1Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SB_S1Click(Sender: TObject);
    procedure pnl_1Enter(Sender: TObject);
    procedure pnl_1Exit(Sender: TObject);
    procedure ED_empnoChange(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_Aim1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB_1Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure Bt_infoscoreClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_OConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sGrid1DblClick(Sender: TObject);
    procedure OnScrSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnFocusButton1Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    Start      : Boolean;
    GSHomeDir  : string;
    LSfilename : string;
    LAarg : array[0..200] of char;
    procedure Read_pehreaim_det;
    procedure Read_pehamas;
    procedure ResetAllButton;
    procedure Read_pehreaim_comdet;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000

  public
    { Public declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    toMailKorname, toMailEmpno, Msg: string;

    v_pgroupratio : string;
    GSempno   : String;     //Login사번
    GSkorname : String;    //Login성명
    GSgrade   : String[10];    //등급
    Csel_SQL  : String;
    Cupd_SQL  : String;
    Cupd_ret  : Boolean;
    Ltime     : string;
    LSeqno    : real;
    L_S_Seqno : string;
    Lrabasdate: string;
    Le1empno   : string; //1차평가자 사번
    Le1korname : string; //1차평가자 이름
    Le2empno   : String;
    Le2korname : String;
    Le1valconyn   : String;
    Le1valcondate : String;
    Lpayclname    : String;
    Ldeptname     : String;
    Lpayraname    : String;
    Lsyn          : String;
    Lrvalconyn    : string;
    Levcno        : string;
    Ljobkind      : string;
    //Lobjsayu      : string;
    //Lobjopinion   : string;
    Lrvalobjyn    : string;
    Gdutykindname : string;
    Gjobgunname   : string;

    LDeptCode     : string;

    Gisum : double;

    Csel_ret : Boolean;

    g_rscore, g_escore : string;
    g_MainForm2_close : string;

    OBJSeason : String;

    procedure Cupd_Exec;
    procedure Csel_Open;
    procedure Rscore;
    function Csel_gfd(p_loc: Integer): String;
    function Csel_gfd1(p_loc: Integer): String;
    function  FL_CheckNullEval:Boolean;     //평가하지 않은 항목이 있는지 여부 체크

  end;
  
const
  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

var
  FM_Main2: TFM_Main2;
  DetailCnt : Integer;
  Inter    : ILotusNotes_Hana;
  gS_final_comp : string;
implementation

uses HPrintForm, UTeamForm2, UOpinon2,UDetailForm,HMainForm;

{$R *.DFM}

procedure TFM_Main2.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  VarLoading;
end;

procedure TFM_Main2.FormPaint(Sender: TObject);
const
  ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var
  SqlText       : string;
  v_restiyn,v_e1valobjyn,v_e1opinionyn   : string;
  i           : integer;
  reg_exe: TRegistry;
begin
  if FL_Start then
    begin
      FL_Start := False;
      SF_Main.Refresh;
      //
      FM_Main.Top := 2000;

      g_MainForm2_close := 'N';

      gS_final_comp := 'T';

      Application.ProcessMessages;

      GSempno       := FM_Main.GSempno;
      GSkorname     := Hinsa_Param(cmdLine,2);
      GSgrade       := Hinsa_Param(cmdLine,4);

      OBJSeason       := FM_Main.OBJSeason;

      if   OBJseason <> 'S'  then
      begin
           Bt_OConfirm.Visible := false;
           Bt_Add.Caption := '평가소견 열람';
      end;

      SB_1.BtnDown  := True;
(*
      ///////////////////////////////////////////////////////////////////////
      TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';    // ShowMessage(GetHomeDir);
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
      ///////////////////////////////////////////////////////////////////////

      reg_exe := TRegistry.Create;    //JSH추가
      reg_exe.RootKey := HKEY_LOCAL_MACHINE;
      if reg_exe.OpenKey(ObjName,False) then
         GSHomeDir := reg_exe.ReadString('NewHomeDir');
*)

  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  Try
    TMaxSession.Connect := True;
    TMaxSession.TMax_Begin(5000);
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  GSHomeDir := GetHomeDir;

      BT_Save.Caption := '업적평가 저장';

      //평가기준일 불러오기
      SqlText := 'SELECT  Value1                  ' +
                 '  FROM pehrebas                 ' +
                 ' WHERE rabasdate = ''00000000'' ' +
                 '   AND gubun     = ''00''       ' +
                 '   AND sgubun    = ''0001''     ';

      Csel_SQL := SqlText;
      Csel_Open;
      Lrabasdate := DBcommon.FieldByName('SEL_DATA').AsString;
//      Lrabasdate := '20081130';
      //기여도 평가점수를 조회한다.
      with DBcommon do
      begin
         Close;
         SqlText := 'Select RCONTRSCR||'';''||ECONTRSCR'+
                     ' from PEHREAIM_SCR'+
                    ' where rabasdate = '''+ Lrabasdate +''''+
	      	      ' and empno = '''+GSempno+'''';
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
         if RecordCount > 0 then
         begin
            On_RContrScr.Text := Csel_gfd(2);
            //On_RContrScr.Value := strtoint(Csel_gfd(1));
            LRsontrScr.Caption := Csel_gfd(1);
            LEsontrScr.Caption := Csel_gfd(2);
         end;
         close;
      end;
      //자기평가 여부, 시스템 시간, 1차 평가자사번, 1차 평가자 이름, 평가표 번호, 직종 불러오기
      SqlText := Format('select a.restiyn || '';'' || a.e1empno || '';'' || a.e1korname || '';'' || a.e2empno || '';'' || a.e2korname  '+
                        '|| '';'' || a.rvalconyn || '';'' || e1valconyn || '';'' || e1valcondate || '';'' || c.codename                '+
                        '|| '';'' || e.DEPTNAME || '';'' || d.codename || '';'' || nvl(f.syn,''N'') || '';'' ||  f.evcno               '+
                        '||'';''|| f.jobkind ||'';''|| a.e1valobjyn||'';''|| a.rvalobjyn ||'';''|| a.pgroupratio||'';''|| a.deptcode ||'';''|| a.e1opinionyn    '+
                        'from pehremas a, pehreaim_det b, pyccode c, pyccode d, pycdept e, pehamas f                                   '+
                        'where a.empno     = b.empno(+)                                                                                '+
                        '  and a.rabasdate = b.rabasdate(+)                                                                            '+
                        '  and a.empno     = ''%s''                                                                                    '+
                        '  and a.rabasdate = ''%s''                                                                                    '+
                        '  and a.e1PAYCL = c.codeno(+) AND c.codeid(+)=''I112''                                                        '+
                        '  and a.e1PAYRA = d.codeno(+) AND d.codeid(+)=''I113''                                                        '+
                        '  and a.e1ORGNUM= e.ORGNUM AND a.e1DEPTCODE = e.DEPTCODE                                                      '+
                        '  and a.rabasdate=f.rabasdate(+)                                                                              '+
                        '  and a.empno =f.empno(+)                                                                                     '+
                        '  group by a.restiyn , a.e1empno , a.e1korname , a.e2empno , a.e2korname,                                     '+
                        '           a.rvalconyn , a.e1valconyn , a.e1valcondate , c.codename,                                          '+
                        '           e.DEPTNAME , d.codename, f.syn, f.evcno, f.jobkind, a.e1valobjyn, a.rvalobjyn, a.pgroupratio, a.deptcode, a.e1opinionyn  ',[GSempno, Lrabasdate]);

      Csel_SQL := SqlText;
      Csel_Open;
      v_restiyn     := Csel_gfd(1);
      Le1empno      := Csel_gfd(2);
      Le1korname    := Csel_gfd(3);
      Le2empno      := Csel_gfd(4);
      Le2korname    := Csel_gfd(5);
      Lrvalconyn    := Csel_gfd(6);
      Le1valconyn   := Csel_gfd(7);
      Le1valcondate := Csel_gfd(8);
      Lpayclname    := Csel_gfd(9);
      Ldeptname     := Csel_gfd(10);
      Lpayraname    := Csel_gfd(11);
      Lsyn          := Csel_gfd(12);
      Levcno        := Csel_gfd(13);
      Ljobkind      := Csel_gfd(14);
      //showmessage(Csel_gfd(14));
      //FM_Main.Ljobkind := Csel_gfd(14);
      v_e1valobjyn  := Csel_gfd(15);
      Lrvalobjyn    := Csel_gfd(16);
      //v_pgroupratio := Csel_gfd(17);
      LDeptCode     := Csel_gfd(18);
      V_e1opinionyn := Csel_gfd(19);

      //Le1valconyn := 'Y';
      if Levcno  = '3' then
         SB_2.Visible := false
      else
         SB_2.Visible := true;
      //1차평가자 평가완료한경우
      if Le1valconyn = 'Y' then
      begin
         pan_common1.Visible   := true;
         pan_common2.Visible   := false;
         Bt_Add.Enabled        := true;
         Bt_OConfirm.Enabled   := true;
         NE_Score3.Visible     := true;
         NE_Score2.Visible     := true;
         //E_Ratio.Visible       := true;
         L_Confirm.Visible     := true;
      end
      else
      begin
         Bt_Add.Enabled        := false;
         Bt_OConfirm.Enabled   := false;
         pan_common1.Visible   := false;
         pan_common2.Visible   := true;
         L_Confirm.Visible     := false;
      end;

      //하은영
      //평가 Petition 기간이 지남에 따라 타이틀을 '평가소견보기'로  바꿈,
      //원래는 평가 Petition 등록임, 등록화면에서 저장과 삭제를 안보이게 하고 평가 Petition완료 버튼을 숨김.
      //나중에 기간에는 ㅇ할 수 있도록 변경

      //Bt_Add.Caption := '평가소견보기';

      // 자기평가 대상자가 아닌 경우.....
      if (v_restiyn <> 'Y') then
        begin
          MessageDlg('평가 대상자가 아닙니다.' + #13+#13+
                    '[평가 Petition]프로그램은 자동종료됩니다.', mtConfirmation, [mbOK],0);

          Application.Terminate;
          Exit;

        end;

      // 역량평가 대상자가 아닌 경우.....
      if (Lsyn <> 'Y') then
      begin
          SB_2.Visible := false;
      end;

      // 자기평가를 완료 했을 경우
      if (Lrvalconyn <> 'Y') then
      begin
        Bt_Confirm.Visible := true;
        BT_Save.Visible    := true;

        //평가 Petition 완료
        if (FM_Main.Lrvalobjyn = 'Y') then
        begin
          MessageDlg('평가 Petition 완료한 자료입니다.',mtInformation,[mbOK],0);
          if v_e1opinionyn = 'Y' then Bt_Add.Caption := '평가소견보기';
          FM_Main.Bt_OConfirm.Enabled := False;
        end;

        for i := 0 to Self.ComponentCount - 1  do  //클릭안되게 세팅
        begin
          if (Components[i] is TOnSkinButton) then
          begin
            if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and (Components[i].Name <> 'SB_3') then
            begin
             (Components[i] As TOnSkinButton).OnClick := Nil;
            end;
          end;
          if (Components[i] is TPanel) then
          begin
            (Components[i] As TPanel).OnEnter := Nil;
            (Components[i] As TPanel).OnExit  := Nil;
          end;
          if (Components[i] is TOnEdit) then
          begin
            (Components[i] As TOnEdit).ReadOnly := True;
          end;
        end;
      end
      else
      begin
        BT_Save.Visible := false;
        Bt_Confirm.Visible := false;
        OnFocusButton1.Visible := false;

        //평가자가 평가완료하지 않았을때
        {if (Le1valconyn = 'N') then
        begin
           Messagedlg('아직 1차평가자가 상사(하향)평가를 완료하지 않았습니다. '+#13+
                      '1차평가자의 상사(하향)평가완료 후 동의하지 않으시면 평가 Petition하십시오.',
                      mtInformation,[mbOK],0);
        end;}

        //기여도 평가저장 버튼 비활성화
        OnScrSave.Visible := false;

        //평가 Petition 완료
        if (FM_Main2.Lrvalobjyn = 'Y') then
        begin
            MessageDlg('평가 Petition 완료한 자료입니다.',mtInformation,[mbOK],0);
            if v_e1opinionyn = 'Y' then  Bt_Add.Caption := '평가소견 열람';
            FM_Main2.Bt_OConfirm.Enabled := False;
        end;

        for i := 0 to Self.ComponentCount - 1  do  //클릭안되게 세팅
        begin
          if (Components[i] is TOnSkinButton) then
          begin
            if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and (Components[i].Name <> 'SB_3') then
            begin
             (Components[i] As TOnSkinButton).OnClick := Nil;
            end;
          end;
          if (Components[i] is TPanel) then
          begin
            (Components[i] As TPanel).OnEnter := Nil;
            (Components[i] As TPanel).OnExit  := Nil;
          end;
          if (Components[i] is TOnEdit) then
          begin
            (Components[i] As TOnEdit).ReadOnly := True;
          end;
        end;
      end;
      //자기평가 점수 합계
      Rscore;
      
      //누적서열
      //E_Ratio.text:= '상위 '+v_pgroupratio+'% 이내';

      ED_empno.Text := GSempno;

      ED_empno.PL_get_singledata;
      // ※ 주의 : 프로그램 테스트 완료후 주석 부분을 해제 후 Rebuild해서 서버에 올린다..
      //if (ONE_App.Check) or (not ONE_App.MainCheck) then
      //  Application.Terminate;
      if not((FM_Main.wkempno = FM_Main.workemp1) or (FM_Main.wkempno = FM_Main.workemp2) or (FM_Main.wkempno = FM_Main.workemp3) or
             (FM_Main.wkempno = FM_Main.workemp4) or (FM_Main.wkempno = FM_Main.workemp5) or (copy(FM_Main.wkempno,1,1) ='D')) then
      begin
        ED_empno.ButtonWidth     := 0;
        ED_empno.Enabled         := False;
      end
      else begin
        ED_empno.ButtonWidth     := 24;
        ED_empno.Enabled         := True;
        ED_empno.SetFocus;
      end;

      NoteBook1.ActivePage := 'P1';
    end;
end;

procedure TFM_Main2.Rscore;
var
  SqlText       : string;
begin
  //자기평가점수 합계
  SqlText := Format('select decode(sum(rscore),'''',0,sum(rscore)) ||'';''|| decode(sum(escore),'''',0,sum(escore))  from pehreaim_DET   '+
                    'where empno=''%s'' and rabasdate=''%s'' ',[GSempno, Lrabasdate]);
  Csel_SQL := SqlText;
  Csel_Open;
  g_rscore        := Csel_gfd(1);
  g_escore        := Csel_gfd(2);
  NE_Score1.Value := StrToFloat(g_rscore);
  NE_Score2.Value := StrToFloat(g_escore);
end;

function TFM_Main2.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBcommon.FieldByName('SEL_DATA').AsString;
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

procedure TFM_Main2.Csel_Open;
begin
  Csel_ret := False;
  with DBcommon do
  begin
    Close;
    ServiceName := 'SHR0SSEL';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 5000);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
  if RecordCount > 0 then Csel_ret := True;
  end;
end;

procedure TFM_Main2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main2.BT_ExitClick(Sender: TObject);
begin
  FM_Main2.Close;
  FM_Main.Close;

  if g_MainForm2_close = 'Y' then
  begin
     TeamForm2.Close;
  end;
end;

procedure TFM_Main2.Eda_plan1Enter(Sender: TObject);
begin
  pnl_1.Color := clwhite;
end;


procedure TFM_Main2.SpeedButton1Click(Sender: TObject);
begin
  //SpeedButton1.Down := True;
end;

procedure TFM_Main2.SB_S1Click(Sender: TObject);
begin
  TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Setfocus;
  if TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Text ='' then
  begin
    MessageDlg('달성실적을 먼저 입력하세요!', mtWarning, [mbOK], 0);
    System.Exit;
  end;


  TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(TOnSkinButton(Sender).tag))).BtnDown := False;

  TOnSkinButton(Self.FindComponent('SB_S'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_A'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_B'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_C'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_D'+IntToStr(TOnSkinButton(Sender).tag))).Font.Color  := clBlack;

  TOnSkinButton(Sender).BtnDown := True;
  TOnSkinButton(Sender).Font.Color := clWhite;

  //달성 등급
  //TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);
       if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;

  //달성 점수
  if Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
    TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '100'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
    TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '90'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
    TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '80'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
    TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '70'
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
    TOnShapeLabel(Self.FindComponent('SelfScore'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := '60';

end;

procedure TFM_Main2.pnl_1Enter(Sender: TObject);
var
  i : integer;
  FColor : TColor;
begin
  FColor := $00F2E8E6;
  for i := 0 to (Sender As TPanel).ControlCount-1 do
  begin
     if ((Sender As TPanel).Controls[i] is TOnEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.FocusColor := $00FAF7F5;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.KillColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditLabel.Color := $00D3B3AF;
     end;
     if ((Sender As TPanel).Controls[i] is TPanel) then
     begin
       ((Sender As TPanel).Controls[i] As TPanel).Color := FColor;
     end;

     if ((Sender As TPanel).Controls[i] is TOnShapeLabel) then
     begin
       ((Sender As TPanel).Controls[i] As TOnShapeLabel).Brush.Color := FColor;
     end;

     if ((Sender As TPanel).Controls[i] is TOnNumberEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.FocusColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.KillColor := FColor;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditLabel.Color := FColor;
     end;
  end;

//  (Sender As TOnEdit).Repaint;
end;

procedure TFM_Main2.pnl_1Exit(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to (Sender As TPanel).ControlCount-1 do
  begin
     if ((Sender As TPanel).Controls[i] is TOnEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.FocusColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditStyle.KillColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnEdit).EditLabel.Color := $00E7E7E7;
     end;
     if ((Sender As TPanel).Controls[i] is TPanel) then
     begin
       ((Sender As TPanel).Controls[i] As TPanel).Color := clwhite;
     end;
     if ((Sender As TPanel).Controls[i] is TOnShapeLabel) then
     begin
       ((Sender As TPanel).Controls[i] As TOnShapeLabel).Brush.Color := $00E7E7E7;
     end;
     if ((Sender As TPanel).Controls[i] is TOnNumberEdit) then
     begin
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.FocusColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditStyle.KillColor := clwhite;
       ((Sender As TPanel).Controls[i] As TOnNumberEdit).EditLabel.Color := $00E7E7E7;
     end;
  end;

end;

procedure TFM_Main2.ED_empnoChange(Sender: TObject);
begin
  Read_pehreaim_det;
  Read_pehreaim_comdet;
end;

procedure TFM_Main2.Read_pehamas;
var
  SqlText : string;
begin
  
  //자기평가 여부, 시스템 시간, 1차 평가자사번, 1차 평가자 이름, 평가표 번호, 직종 불러오기
  SqlText := Format('select  evcno ||'';''|| jobkind '+
                    'from pehamas                    '+
                    'where empno=''%s''              '+
                    '  and rabasdate=''%s''   ',[Ed_empno.empno, Lrabasdate]);

   Csel_SQL := SqlText;
   Csel_Open;

   Levcno        := Csel_gfd(1);
   Ljobkind      := Csel_gfd(2);
end;

procedure TFM_Main2.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ED_empno.PL_get_singledata;
  end;
end;

procedure TFM_Main2.Read_pehreaim_det;   //관리직 자료 읽기
var
  SqlText : string;
begin
 with DBSet1 do
  begin
    SqlText := Format(
                      '  SELECT B.RABASDATE,B.EMPNO,B.EMPDATE,B.PAYCLDATE,B.TRDATE,                                 '+
                      '       B.JOBGUN,B.PAYCL,B.PAYRA,B.ORGNUM,                                                    '+
                      '       B.DEPTCODE,H.DEPTNAME ||'' ''||H.DEPTNA3 DEPTNAME,                                    '+
                      '       C.DUTYKINDNAME, A.OBJYN,E.CODENAME JOBGUNNAME,                                        '+
                      '       F.CODENAME PAYCLNAME, G.CODENAME PAYRANAME,                                           '+
                      '       SEQNO,PROPELTASK,MAINWEIGHT,                                                          '+
                      '       DETAILTASK1,DETAILTASK2,DETAILTASK3,DETAILTASK4,DETAILTASK5,                          '+
                      '       DETAILWEIGHT1,DETAILWEIGHT2,DETAILWEIGHT3,DETAILWEIGHT4,DETAILWEIGHT5,                '+
                      '       VALIDX1,VALIDX2,VALIDX3,VALIDX4,VALIDX5,                                              '+
                      '       VALFUNCTION1,VALFUNCTION2,VALFUNCTION3,VALFUNCTION4,VALFUNCTION5,                     '+
                      '       SRESULTCLASS1,ARESULTCLASS1,BRESULTCLASS1,CRESULTCLASS1,DRESULTCLASS1,                '+
                      '       SRESULTCLASS2,ARESULTCLASS2,BRESULTCLASS2,CRESULTCLASS2,DRESULTCLASS2,                '+
                      '       SRESULTCLASS3,ARESULTCLASS3,BRESULTCLASS3,CRESULTCLASS3,DRESULTCLASS3,                '+
                      '       SRESULTCLASS4,ARESULTCLASS4,BRESULTCLASS4,CRESULTCLASS4,DRESULTCLASS4,                '+
                      '       SRESULTCLASS5,ARESULTCLASS5,BRESULTCLASS5,CRESULTCLASS5,DRESULTCLASS5,                '+
                      '       E1PRJOPINON,RESULT1,RESULT2,RESULT3,RESULT4,RESULT5,NVL(A.RSCORE,0),                  '+
                      '       NVL(DETAILRSCORE1,0),DETAILRCLASS1,NVL(DETAILRSCORE2,0),DETAILRCLASS2,                '+
                      '       NVL(DETAILRSCORE3,0),DETAILRCLASS3,NVL(DETAILRSCORE4,0),DETAILRCLASS4,                '+
                      '       NVL(DETAILRSCORE5,0),DETAILRCLASS5,NVL(DETAILESCORE1,0),DETAILECLASS1,                '+
                      '       NVL(DETAILESCORE2,0),DETAILECLASS2,NVL(DETAILESCORE3,0),DETAILECLASS3,                '+
                      '       NVL(DETAILESCORE4,0),DETAILECLASS4,NVL(DETAILESCORE5,0),DETAILECLASS5,                '+
                      '       NVL(A.ESCORE,0)                                                                       '+
                      '  FROM PEHREAIM_DET A, PEHREMAS B,PISHRDUKIND C, PISHRDUTY D,PYCCODE E, PYCCODE F, PYCCODE G,'+
                      '       PYCDEPT H                                                                             '+
                      ' WHERE B.RABASDATE = ''%s''                                                                  '+
                      '   AND B.EMPNO = ''%s''                                                                      '+
                      '   AND B.RABASDATE = A.RABASDATE(+)                                                          '+
                      '   AND B.EMPNO = A.EMPNO(+)                                                                  '+
                      '   AND B.JOBKIND = C.DUTYKIND(+)                                                             '+
                      '   AND B.JOBDUTY = D.DUTY(+)                                                                 '+
                      '   AND B.JOBGUN = E.CODENO(+) AND E.CODEID(+)=''I115''                                       '+
                      '   AND B.PAYCL = F.CODENO(+) AND F.CODEID(+)=''I112''                                        '+
                      '   AND B.PAYRA =G.CODENO(+) AND G.CODEID(+)=''I113''                                         '+
                      '   AND B.ORGNUM = H.ORGNUM AND B.DEPTCODE = H.DEPTCODE                                       ',
                [Lrabasdate,Ed_empno.empno]);

    Close;
    ServiceName := 'PED1010A_sel1';
    ClearFieldInfo;
        AddField('RABASDATE'           , ftString, 8);
        AddField('EMPNO'               , ftString, 4);
        AddField('EMPDATE'             , ftString, 8);
        AddField('PAYCLDATE'           , ftString, 8);
        AddField('TRDATE'              , ftString, 8);
        AddField('JOBGUN'              , ftString, 2);
        AddField('PAYCL'               , ftString, 3);
        AddField('PAYRA'               , ftString, 3);
        AddField('ORGNUM'              , ftString, 3);
        AddField('DEPTCODE'            , ftString, 6);
        AddField('DEPTNAME'            , ftString, 60);
        AddField('DUTYKINDNAME'        , ftString, 30);
        AddField('OBJYN'               , ftString, 30);
        AddField('JOBGUNNAME'          , ftString, 20);
        AddField('PAYCLNAME'           , ftString, 20);
        AddField('PAYRANAME'           , ftString, 20);
        AddField('SEQNO'               , ftInteger, 2);
        AddField('PROPELTASK'          , ftString, 100);
        AddField('MAINWEIGHT'          , ftInteger, 3);
        AddField('DETAILTASK1'         , ftString, 100);
        AddField('DETAILTASK2'         , ftString, 100);
        AddField('DETAILTASK3'         , ftString, 100);
        AddField('DETAILTASK4'         , ftString, 100);
        AddField('DETAILTASK5'         , ftString, 100);
        AddField('DETAILWEIGHT1'       , ftInteger, 3);
        AddField('DETAILWEIGHT2'       , ftInteger, 3);
        AddField('DETAILWEIGHT3'       , ftInteger, 3);
        AddField('DETAILWEIGHT4'       , ftInteger, 3);
        AddField('DETAILWEIGHT5'       , ftInteger, 3);
        AddField('VALIDX1'             , ftString, 100);
        AddField('VALIDX2'             , ftString, 100);
        AddField('VALIDX3'             , ftString, 100);
        AddField('VALIDX4'             , ftString, 100);
        AddField('VALIDX5'             , ftString, 100);
        AddField('VALFUNCTION1'        , ftString, 100);
        AddField('VALFUNCTION2'        , ftString, 100);
        AddField('VALFUNCTION3'        , ftString, 100);
        AddField('VALFUNCTION4'        , ftString, 100);
        AddField('VALFUNCTION5'        , ftString, 100);
        AddField('SRESULTCLASS1'       , ftString, 100);
        AddField('ARESULTCLASS1'       , ftString, 100);
        AddField('BRESULTCLASS1'       , ftString, 100);
        AddField('CRESULTCLASS1'       , ftString, 100);
        AddField('DRESULTCLASS1'       , ftString, 100);
        AddField('SRESULTCLASS2'       , ftString, 100);
        AddField('ARESULTCLASS2'       , ftString, 100);
        AddField('BRESULTCLASS2'       , ftString, 100);
        AddField('CRESULTCLASS2'       , ftString, 100);
        AddField('DRESULTCLASS2'       , ftString, 100);
        AddField('SRESULTCLASS3'       , ftString, 100);
        AddField('ARESULTCLASS3'       , ftString, 100);
        AddField('BRESULTCLASS3'       , ftString, 100);
        AddField('CRESULTCLASS3'       , ftString, 100);
        AddField('DRESULTCLASS3'       , ftString, 100);
        AddField('SRESULTCLASS4'       , ftString, 100);
        AddField('ARESULTCLASS4'       , ftString, 100);
        AddField('BRESULTCLASS4'       , ftString, 100);
        AddField('CRESULTCLASS4'       , ftString, 100);
        AddField('DRESULTCLASS4'       , ftString, 100);
        AddField('SRESULTCLASS5'       , ftString, 100);
        AddField('ARESULTCLASS5'       , ftString, 100);
        AddField('BRESULTCLASS5'       , ftString, 100);
        AddField('CRESULTCLASS5'       , ftString, 100);
        AddField('DRESULTCLASS5'       , ftString, 100);
        AddField('E1PRJOPINON'         , ftString, 200);
        AddField('RESULT1'             , ftString, 100);
        AddField('RESULT2'             , ftString, 100);
        AddField('RESULT3'             , ftString, 100);
        AddField('RESULT4'             , ftString, 100);
        AddField('RESULT5'             , ftString, 100);
        AddField('RSCORE'              , ftFloat,    7);
        AddField('DETAILRSCORE1'       , ftFloat,    7);
        AddField('DETAILRCLASS1'       , ftString,   1);
        AddField('DETAILRSCORE2'       , ftFloat,    7);
        AddField('DETAILRCLASS2'       , ftString,   1);
        AddField('DETAILRSCORE3'       , ftFloat,    7);
        AddField('DETAILRCLASS3'       , ftString,   1);
        AddField('DETAILRSCORE4'       , ftFloat,    7);
        AddField('DETAILRCLASS4'       , ftString,   1);
        AddField('DETAILRSCORE5'       , ftFloat,    7);
        AddField('DETAILRCLASS5'       , ftString,   1);
        AddField('DETAILESCORE1'       , ftFloat,    7);
        AddField('DETAILECLASS1'       , ftString,   1);
        AddField('DETAILESCORE2'       , ftFloat,    7);
        AddField('DETAILECLASS2'       , ftString,   1);
        AddField('DETAILESCORE3'       , ftFloat,    7);
        AddField('DETAILECLASS3'       , ftString,   1);
        AddField('DETAILESCORE4'       , ftFloat,    7);
        AddField('DETAILECLASS4'       , ftString,   1);
        AddField('DETAILESCORE5'       , ftFloat,    7);
        AddField('DETAILECLASS5'       , ftString,   1);
        AddField('ESCORE'              , ftFloat,    7);
    SQL.Text := Sqltext;
    Open;
    DBSet1.fieldbyname('OBJYN').Alignment := taCenter;

    L_e1emp.ValueCaption     := Le1empno +' - '+ Le1korname;
    if   Le2empno <> '' then
         L_e2emp.ValueCaption   := Le2empno +' - '+ Le2korname
    else
         L_e2emp.ValueCaption := '없음';

    L_Deptname.ValueCaption  := FieldByName('DEPTNAME').AsString;
    L_Payclname.ValueCaption := FieldByName('PAYCLNAME').AsString;
    L_Payraname.ValueCaption := FieldByName('PAYRANAME').AsString;
    L_empdate.Text           := FieldByName('EMPDATE').AsString;
    L_paycldate.Text         := FieldByName('PAYCLDATE').AsString;
    //직군명
    Gjobgunname   := FieldByName('JOBGUNNAME').AsString;
    //직종명
    Gdutykindname := FieldByName('DUTYKINDNAME').AsString;

  end;
  Rscore;
end;

procedure TFM_Main2.DataSource1DataChange(Sender: TObject; Field: TField);
var
   vClass1 : String;
   vClass2 : String;
   vClass3 : String;
   vClass4 : String;
   vClass5 : String;
begin
  with DBSet1 do
  begin
    ResetAllButton;

    SelfClass1.Caption := '';
    SelfClass2.Caption := '';
    SelfClass3.Caption := '';
    SelfClass4.Caption := '';
    SelfClass5.Caption := '';

    SelfScore1.ValueCaption := '';
    SelfScore2.ValueCaption := '';
    SelfScore3.ValueCaption := '';
    SelfScore4.ValueCaption := '';
    SelfScore5.ValueCaption := '';

    LSeqno := FieldByName('seqno').AsFloat;

    // 달성 실적
    E_Aim1.Text := FieldByName('RESULT1').AsString;
    E_Aim2.Text := FieldByName('RESULT2').AsString;
    E_Aim3.Text := FieldByName('RESULT3').AsString;
    E_Aim4.Text := FieldByName('RESULT4').AsString;
    E_Aim5.Text := FieldByName('RESULT5').AsString;

    // 자기 세부 점수
    if FieldByName('DETAILRSCORE1').AsString <> '0' then
      SelfScore1.ValueCaption := FieldByName('DETAILRSCORE1').AsString;
    if FieldByName('DETAILRSCORE2').AsString <> '0' then
      SelfScore2.ValueCaption := FieldByName('DETAILRSCORE2').AsString;
    if FieldByName('DETAILRSCORE3').AsString <> '0' then
      SelfScore3.ValueCaption := FieldByName('DETAILRSCORE3').AsString;
    if FieldByName('DETAILRSCORE4').AsString <> '0' then
      SelfScore4.ValueCaption := FieldByName('DETAILRSCORE4').AsString;
    if FieldByName('DETAILRSCORE5').AsString <> '0' then
     SelfScore5.ValueCaption := FieldByName('DETAILRSCORE5').AsString;

    // 자기 세부 등급
    {
    SelfClass1.Caption := FieldByName('DETAILRCLASS1').AsString;
    SelfClass2.Caption := FieldByName('DETAILRCLASS2').AsString;
    SelfClass3.Caption := FieldByName('DETAILRCLASS3').AsString;
    SelfClass4.Caption := FieldByName('DETAILRCLASS4').AsString;
    SelfClass5.Caption := FieldByName('DETAILRCLASS5').AsString;
    }
         if FieldByName('DETAILRCLASS1').AsString = 'S' then       SelfClass1.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS1').AsString = 'A' then       SelfClass1.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS1').AsString = 'B' then       SelfClass1.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS1').AsString = 'C' then       SelfClass1.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS1').AsString = 'D' then       SelfClass1.Caption := var_GrdD
    else
       SelfClass1.Caption := FieldByName('DETAILRCLASS1').AsString;


         if FieldByName('DETAILRCLASS2').AsString = 'S' then       SelfClass2.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS2').AsString = 'A' then       SelfClass2.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS2').AsString = 'B' then       SelfClass2.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS2').AsString = 'C' then       SelfClass2.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS2').AsString = 'D' then       SelfClass2.Caption := var_GrdD
    else
       SelfClass2.Caption := FieldByName('DETAILRCLASS2').AsString;


         if FieldByName('DETAILRCLASS3').AsString = 'S' then       SelfClass3.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS3').AsString = 'A' then       SelfClass3.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS3').AsString = 'B' then       SelfClass3.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS3').AsString = 'C' then       SelfClass3.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS3').AsString = 'D' then       SelfClass3.Caption := var_GrdD
    else
       SelfClass3.Caption := FieldByName('DETAILRCLASS3').AsString;

         if FieldByName('DETAILRCLASS4').AsString = 'S' then       SelfClass4.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS4').AsString = 'A' then       SelfClass4.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS4').AsString = 'B' then       SelfClass4.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS4').AsString = 'C' then       SelfClass4.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS4').AsString = 'D' then       SelfClass4.Caption := var_GrdD
    else
       SelfClass4.Caption := FieldByName('DETAILRCLASS4').AsString;

         if FieldByName('DETAILRCLASS5').AsString = 'S' then       SelfClass5.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS5').AsString = 'A' then       SelfClass5.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS5').AsString = 'B' then       SelfClass5.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS5').AsString = 'C' then       SelfClass5.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS5').AsString = 'D' then       SelfClass5.Caption := var_GrdD
    else
       SelfClass5.Caption := FieldByName('DETAILRCLASS5').AsString;

    // 상사(하향) 세부 점수
    if FieldByName('DETAILESCORE1').AsString <> '0' then
      DownScore1.ValueCaption := FieldByName('DETAILESCORE1').AsString;
    if FieldByName('DETAILESCORE2').AsString <> '0' then
      DownScore2.ValueCaption := FieldByName('DETAILESCORE2').AsString;
    if FieldByName('DETAILESCORE3').AsString <> '0' then
      DownScore3.ValueCaption := FieldByName('DETAILESCORE3').AsString;
    if FieldByName('DETAILESCORE4').AsString <> '0' then
      DownScore4.ValueCaption := FieldByName('DETAILESCORE4').AsString;
    if FieldByName('DETAILESCORE5').AsString <> '0' then
      DownScore5.ValueCaption := FieldByName('DETAILESCORE5').AsString;

    // 상사(하향) 세부 등급
    {
    DownClass1.Caption := FieldByName('DETAILECLASS1').AsString;
    DownClass2.Caption := FieldByName('DETAILECLASS2').AsString;
    DownClass3.Caption := FieldByName('DETAILECLASS3').AsString;
    DownClass4.Caption := FieldByName('DETAILECLASS4').AsString;
    DownClass5.Caption := FieldByName('DETAILECLASS5').AsString;

    }
         if FieldByName('DETAILECLASS1').AsString = 'S' then       DownClass1.Caption := var_GrdS
    else if FieldByName('DETAILECLASS1').AsString = 'A' then       DownClass1.Caption := var_GrdA
    else if FieldByName('DETAILECLASS1').AsString = 'B' then       DownClass1.Caption := var_GrdB
    else if FieldByName('DETAILECLASS1').AsString = 'C' then       DownClass1.Caption := var_GrdC
    else if FieldByName('DETAILECLASS1').AsString = 'D' then       DownClass1.Caption := var_GrdD
    else           DownClass1.Caption := FieldByName('DETAILECLASS1').AsString;


         if FieldByName('DETAILECLASS2').AsString = 'S' then       DownClass2.Caption := var_GrdS
    else if FieldByName('DETAILECLASS2').AsString = 'A' then       DownClass2.Caption := var_GrdA
    else if FieldByName('DETAILECLASS2').AsString = 'B' then       DownClass2.Caption := var_GrdB
    else if FieldByName('DETAILECLASS2').AsString = 'C' then       DownClass2.Caption := var_GrdC
    else if FieldByName('DETAILECLASS2').AsString = 'D' then       DownClass2.Caption := var_GrdD
    else           DownClass2.Caption := FieldByName('DETAILECLASS2').AsString;


         if FieldByName('DETAILECLASS3').AsString = 'S' then       DownClass3.Caption := var_GrdS
    else if FieldByName('DETAILECLASS3').AsString = 'A' then       DownClass3.Caption := var_GrdA
    else if FieldByName('DETAILECLASS3').AsString = 'B' then       DownClass3.Caption := var_GrdB
    else if FieldByName('DETAILECLASS3').AsString = 'C' then       DownClass3.Caption := var_GrdC
    else if FieldByName('DETAILECLASS3').AsString = 'D' then       DownClass3.Caption := var_GrdD
     else          DownClass3.Caption := FieldByName('DETAILECLASS3').AsString;

         if FieldByName('DETAILECLASS4').AsString = 'S' then       DownClass4.Caption := var_GrdS
    else if FieldByName('DETAILECLASS4').AsString = 'A' then       DownClass4.Caption := var_GrdA
    else if FieldByName('DETAILECLASS4').AsString = 'B' then       DownClass4.Caption := var_GrdB
    else if FieldByName('DETAILECLASS4').AsString = 'C' then       DownClass4.Caption := var_GrdC
    else if FieldByName('DETAILECLASS4').AsString = 'D' then       DownClass4.Caption := var_GrdD
    else           DownClass4.Caption := FieldByName('DETAILECLASS4').AsString;


         if FieldByName('DETAILECLASS5').AsString = 'S' then       DownClass5.Caption := var_GrdS
    else if FieldByName('DETAILECLASS5').AsString = 'A' then       DownClass5.Caption := var_GrdA
    else if FieldByName('DETAILECLASS5').AsString = 'B' then       DownClass5.Caption := var_GrdB
    else if FieldByName('DETAILECLASS5').AsString = 'C' then       DownClass5.Caption := var_GrdC
    else if FieldByName('DETAILECLASS5').AsString = 'D' then       DownClass5.Caption := var_GrdD
    else           DownClass5.Caption := FieldByName('DETAILECLASS5').AsString;

    vClass1 := FieldByName('DETAILECLASS1').AsString;
    vClass2 := FieldByName('DETAILECLASS2').AsString;
    vClass3 := FieldByName('DETAILECLASS3').AsString;
    vClass4 := FieldByName('DETAILECLASS4').AsString;
    vClass5 := FieldByName('DETAILECLASS5').AsString;

    if  FieldByName('DETAILECLASS1').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS1+'1')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS1+'1')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS2').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS2+'2')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS2+'2')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS3').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS3+'3')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS3+'3')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS4').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS4+'4')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS4+'4')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILECLASS5').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS5+'5')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+vCLASS5+'5')).Font.Color := clWhite;
    end;

    L_DetailTask1.ValueCaption := FieldByName('detailtask1').AsString;
    L_DetailTask2.ValueCaption := FieldByName('detailtask2').AsString;
    L_DetailTask3.ValueCaption := FieldByName('detailtask3').AsString;
    L_DetailTask4.ValueCaption := FieldByName('detailtask4').AsString;
    L_DetailTask5.ValueCaption := FieldByName('detailtask5').AsString;

    L_detailweight1.ValueCaption := FieldByName('detailweight1').AsString+'%';
    L_detailweight2.ValueCaption := FieldByName('detailweight2').AsString+'%';
    L_detailweight3.ValueCaption := FieldByName('detailweight3').AsString+'%';
    L_detailweight4.ValueCaption := FieldByName('detailweight4').AsString+'%';
    L_detailweight5.ValueCaption := FieldByName('detailweight5').AsString+'%';

    L_validx1.ValueCaption := FieldByName('validx1').AsString;
    L_validx2.ValueCaption := FieldByName('validx2').AsString;
    L_validx3.ValueCaption := FieldByName('validx3').AsString;
    L_validx4.ValueCaption := FieldByName('validx4').AsString;
    L_validx5.ValueCaption := FieldByName('validx5').AsString;

    L_bresultclass1.ValueCaption := FieldByName('bresultclass1').AsString;
    L_bresultclass2.ValueCaption := FieldByName('bresultclass2').AsString;
    L_bresultclass3.ValueCaption := FieldByName('bresultclass3').AsString;
    L_bresultclass4.ValueCaption := FieldByName('bresultclass4').AsString;
    L_bresultclass5.ValueCaption := FieldByName('bresultclass5').AsString;

    L_valfunction1.ValueCaption := FieldByName('valfunction1').AsString;
    L_valfunction2.ValueCaption := FieldByName('valfunction2').AsString;
    L_valfunction3.ValueCaption := FieldByName('valfunction3').AsString;
    L_valfunction4.ValueCaption := FieldByName('valfunction4').AsString;
    L_valfunction5.ValueCaption := FieldByName('valfunction5').AsString;


    L_DetailTask1.Hint := FieldByName('detailtask1').AsString;
    L_DetailTask2.Hint := FieldByName('detailtask2').AsString;
    L_DetailTask3.Hint := FieldByName('detailtask3').AsString;
    L_DetailTask4.Hint := FieldByName('detailtask4').AsString;
    L_DetailTask5.Hint := FieldByName('detailtask5').AsString;

    L_validx1.Hint := FieldByName('validx1').AsString;
    L_validx2.Hint := FieldByName('validx2').AsString;
    L_validx3.Hint := FieldByName('validx3').AsString;
    L_validx4.Hint := FieldByName('validx4').AsString;
    L_validx5.Hint := FieldByName('validx5').AsString;

    L_bresultclass1.Hint := FieldByName('bresultclass1').AsString;
    L_bresultclass2.Hint := FieldByName('bresultclass2').AsString;
    L_bresultclass3.Hint := FieldByName('bresultclass3').AsString;
    L_bresultclass4.Hint := FieldByName('bresultclass4').AsString;
    L_bresultclass5.Hint := FieldByName('bresultclass5').AsString;

    L_valfunction1.Hint := FieldByName('valfunction1').AsString;
    L_valfunction2.Hint := FieldByName('valfunction2').AsString;
    L_valfunction3.Hint := FieldByName('valfunction3').AsString;
    L_valfunction4.Hint := FieldByName('valfunction4').AsString;
    L_valfunction5.Hint := FieldByName('valfunction5').AsString;

    SB_S1.Caption := Copy(FieldByName('sresultclass1').AsString,1,20);
    SB_A1.Caption := Copy(FieldByName('aresultclass1').AsString,1,20);
    SB_B1.Caption := Copy(FieldByName('bresultclass1').AsString,1,20);
    SB_C1.Caption := Copy(FieldByName('cresultclass1').AsString,1,20);
    SB_D1.Caption := Copy(FieldByName('dresultclass1').AsString,1,20);
    SB_S2.Caption := Copy(FieldByName('sresultclass2').AsString,1,20);
    SB_A2.Caption := Copy(FieldByName('aresultclass2').AsString,1,20);
    SB_B2.Caption := Copy(FieldByName('bresultclass2').AsString,1,20);
    SB_C2.Caption := Copy(FieldByName('cresultclass2').AsString,1,20);
    SB_D2.Caption := Copy(FieldByName('dresultclass2').AsString,1,20);
    SB_S3.Caption := Copy(FieldByName('sresultclass3').AsString,1,20);
    SB_A3.Caption := Copy(FieldByName('aresultclass3').AsString,1,20);
    SB_B3.Caption := Copy(FieldByName('bresultclass3').AsString,1,20);
    SB_C3.Caption := Copy(FieldByName('cresultclass3').AsString,1,20);
    SB_D3.Caption := Copy(FieldByName('dresultclass3').AsString,1,20);
    SB_S4.Caption := Copy(FieldByName('sresultclass4').AsString,1,20);
    SB_A4.Caption := Copy(FieldByName('aresultclass4').AsString,1,20);
    SB_B4.Caption := Copy(FieldByName('bresultclass4').AsString,1,20);
    SB_C4.Caption := Copy(FieldByName('cresultclass4').AsString,1,20);
    SB_D4.Caption := Copy(FieldByName('dresultclass4').AsString,1,20);
    SB_S5.Caption := Copy(FieldByName('sresultclass5').AsString,1,20);
    SB_A5.Caption := Copy(FieldByName('aresultclass5').AsString,1,20);
    SB_B5.Caption := Copy(FieldByName('bresultclass5').AsString,1,20);
    SB_C5.Caption := Copy(FieldByName('cresultclass5').AsString,1,20);
    SB_D5.Caption := Copy(FieldByName('dresultclass5').AsString,1,20);

    SB_S1.Hint := FieldByName('sresultclass1').AsString;
    SB_A1.Hint := FieldByName('aresultclass1').AsString;
    SB_B1.Hint := FieldByName('bresultclass1').AsString;
    SB_C1.Hint := FieldByName('cresultclass1').AsString;
    SB_D1.Hint := FieldByName('dresultclass1').AsString;
    SB_S2.Hint := FieldByName('sresultclass2').AsString;
    SB_A2.Hint := FieldByName('aresultclass2').AsString;
    SB_B2.Hint := FieldByName('bresultclass2').AsString;
    SB_C2.Hint := FieldByName('cresultclass2').AsString;
    SB_D2.Hint := FieldByName('dresultclass2').AsString;
    SB_S3.Hint := FieldByName('sresultclass3').AsString;
    SB_A3.Hint := FieldByName('aresultclass3').AsString;
    SB_B3.Hint := FieldByName('bresultclass3').AsString;
    SB_C3.Hint := FieldByName('cresultclass3').AsString;
    SB_D3.Hint := FieldByName('dresultclass3').AsString;
    SB_S4.Hint := FieldByName('sresultclass4').AsString;
    SB_A4.Hint := FieldByName('aresultclass4').AsString;
    SB_B4.Hint := FieldByName('bresultclass4').AsString;
    SB_C4.Hint := FieldByName('cresultclass4').AsString;
    SB_D4.Hint := FieldByName('dresultclass4').AsString;
    SB_S5.Hint := FieldByName('sresultclass5').AsString;
    SB_A5.Hint := FieldByName('aresultclass5').AsString;
    SB_B5.Hint := FieldByName('bresultclass5').AsString;
    SB_C5.Hint := FieldByName('cresultclass5').AsString;
    SB_D5.Hint := FieldByName('dresultclass5').AsString;

    if FieldByName('detailtask1').AsString = '' then
    begin
       pnl_1.Visible := False;
    end
    else begin
       pnl_1.Visible := True;
       DetailCnt     := 1;
    end;
    if FieldByName('detailtask2').AsString = '' then
    begin
       pnl_2.Visible := False;
    end
    else begin
       pnl_2.Visible := True;
       DetailCnt     := 2;
    end;
    if FieldByName('detailtask3').AsString = '' then
    begin
       pnl_3.Visible := False;
    end
    else begin
       pnl_3.Visible := True;
       DetailCnt     := 3;
    end;
    if FieldByName('detailtask4').AsString = '' then
    begin
       pnl_4.Visible := False;
    end
    else begin
       pnl_4.Visible := True;
       DetailCnt     := 4;
    end;
    if FieldByName('detailtask5').AsString = '' then
    begin
       pnl_5.Visible := False;
    end
    else begin
       pnl_5.Visible := True;
       DetailCnt     := 5;
    end;
  end;
end;

procedure TFM_Main2.ResetAllButton;
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1  do
  begin
    if (Components[i] is TOnSkinButton) then
    begin
      if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') then
      begin
       (Components[i] As TOnSkinButton).BtnDown    := False;
       (Components[i] As TOnSkinButton).Font.Color := clBlack;
      end;
    end;
  end;
end;

procedure TFM_Main2.E_Aim1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
begin
  if Key = VK_DOWN then
  begin
    i := StrToInt(Copy(TOnEdit(Sender).Name,6,1))+1;
    if i > DetailCnt then
       E_Aim1.SetFocus
    else  if TPanel(Self.FindComponent('pnl_'+IntToStr(i))).visible then
     TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i))).SetFocus;
  end;
  if Key = VK_UP then
  begin
    i := StrToInt(Copy(TOnEdit(Sender).Name,6,1))-1;
    if i < 1 then
       TOnEdit(Self.FindComponent('E_Aim'+IntToStr(DetailCnt))).SetFocus
    else if TPanel(Self.FindComponent('pnl_'+IntToStr(i))).visible then
     TOnEdit(Self.FindComponent('E_Aim'+IntToStr(i))).SetFocus;
  end;
end;

procedure TFM_Main2.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;

  gS_final_comp := 'F';

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
  if NoteBook1.ActivePage = 'P1' then
    begin
      //L_help.Visible := true;
      L_e1emp.LabelCaption := '1차평가자';
      L_e1emp.ValueCaption := Le1empno +' - '+ Le1korname;
      if   Le2empno <> '' then
           L_e2emp.ValueCaption   := Le2empno +' - '+ Le2korname
      else
           L_e2emp.ValueCaption := '없음';

      BT_Save.Caption := '업적평가 저장';
      if (Lrvalconyn = 'Y') then        //업적평가를 완료하면 저장버튼 비활성화
        begin
          BT_Save.Visible        := false;
          Bt_Confirm.Visible     := false;
          OnFocusButton1.Visible := false;
        end;
    end
  else if NoteBook1.ActivePage = 'P2' then
    begin
      L_e1emp.LabelCaption := '직군명';
      L_e1emp.ValueCaption := Gjobgunname;
      L_e2emp.LabelCaption := '직종명';
      L_e2emp.ValueCaption := Gdutykindname;
      L_help.Visible       := false;

      BT_Save.Caption := '공통역량 저장';
      TeamForm2.PageControl1Change(Sender);

      g_MainForm2_close := 'Y';

        if (Lrvalconyn = 'Y') then        //업적평가를 완료하면 저장버튼 비활성화
          begin
            BT_Save.Visible    := false;
            Bt_Confirm.Visible := false;
          end;
    end;

  {//저장버튼, 취소버튼 비활성화
  TeamForm.BB_Save.Visible  :=false;
  TeamForm.BB_Cancel.Visible  :=false;}

end;

//저장버튼 클릭시
procedure TFM_Main2.BT_SaveClick(Sender: TObject);
var
  Param     : OleVariant;
  SqlText   : string;
  v_rscore  : real;
  v_s_rscore: string;
  sSelfClass1,
  sSelfClass2,
  sSelfClass3,
  sSelfClass4,
  sSelfClass5: string;
begin
  if NoteBook1.ActivePage = 'P1' then
    begin
      L_S_Seqno := FloatToStr(LSeqno);
      //자기평가 점수 계산
      v_rscore  := ROUND(((StrToIntDef(SelfScore1.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT1').AsInteger/100)+
                          (StrToIntDef(SelfScore2.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT2').AsInteger/100)+
                          (StrToIntDef(SelfScore3.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT3').AsInteger/100)+
                          (StrToIntDef(SelfScore4.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT4').AsInteger/100)+
                          (StrToIntDef(SelfScore5.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT5').AsInteger/100))*10000)/10000;

      v_s_rscore := FloatToStr(v_rscore);

           if SelfClass1.Caption = var_GrdS then            sSelfClass1 := 'S'
      else if SelfClass1.Caption = var_GrdA then            sSelfClass1 := 'A'
      else if SelfClass1.Caption = var_GrdB then            sSelfClass1 := 'B'
      else if SelfClass1.Caption = var_GrdC then            sSelfClass1 := 'C'
      else if SelfClass1.Caption = var_GrdD then            sSelfClass1 := 'D';

           if SelfClass2.Caption = var_GrdS then            sSelfClass2 := 'S'
      else if SelfClass2.Caption = var_GrdA then            sSelfClass2 := 'A'
      else if SelfClass2.Caption = var_GrdB then            sSelfClass2 := 'B'
      else if SelfClass2.Caption = var_GrdC then            sSelfClass2 := 'C'
      else if SelfClass2.Caption = var_GrdD then            sSelfClass2 := 'D';

           if SelfClass3.Caption = var_GrdS then            sSelfClass3 := 'S'
      else if SelfClass3.Caption = var_GrdA then            sSelfClass3 := 'A'
      else if SelfClass3.Caption = var_GrdB then            sSelfClass3 := 'B'
      else if SelfClass3.Caption = var_GrdC then            sSelfClass3 := 'C'
      else if SelfClass3.Caption = var_GrdD then            sSelfClass3 := 'D';

           if SelfClass4.Caption = var_GrdS then            sSelfClass4 := 'S'
      else if SelfClass4.Caption = var_GrdA then            sSelfClass4 := 'A'
      else if SelfClass4.Caption = var_GrdB then            sSelfClass4 := 'B'
      else if SelfClass4.Caption = var_GrdC then            sSelfClass4 := 'C'
      else if SelfClass4.Caption = var_GrdD then            sSelfClass4 := 'D';

           if SelfClass5.Caption = var_GrdS then            sSelfClass5 := 'S'
      else if SelfClass5.Caption = var_GrdA then            sSelfClass5 := 'A'
      else if SelfClass5.Caption = var_GrdB then            sSelfClass5 := 'B'
      else if SelfClass5.Caption = var_GrdC then            sSelfClass5 := 'C'
      else if SelfClass5.Caption = var_GrdD then            sSelfClass5 := 'D';

      Param := VarArrayOf([replace(E_Aim1.Text,'''','`'),
                           replace(E_Aim2.Text,'''','`'),
                           replace(E_Aim3.Text,'''','`'),
                           replace(E_Aim4.Text,'''','`'),
                           replace(E_Aim5.Text,'''','`'),
                           replace(sSelfClass1,'''','`'),
                           replace(sSelfClass2,'''','`'),
                           replace(sSelfClass3,'''','`'),
                           replace(sSelfClass4,'''','`'),
                           replace(sSelfClass5,'''','`'),
                           replace(SelfScore1.ValueCaption,'''','`'),
                           replace(SelfScore2.ValueCaption,'''','`'),
                           replace(SelfScore3.ValueCaption,'''','`'),
                           replace(SelfScore4.ValueCaption,'''','`'),
                           replace(SelfScore5.ValueCaption,'''','`'),
                           copy(replace(ED_empno.Text,'''','`'),1,4),
                           Lrabasdate,
                           copy(replace(ED_empno.Text,'''','`'),1,4),
                           replace(L_S_Seqno,'''','`')
                          ]);

      SqlText := Format('UPDATE pehreaim_DET SET     '+
                        '  result1       = ''%s'',   '+
                        '  result2       = ''%s'',   '+
                        '  result3       = ''%s'',   '+
                        '  result4       = ''%s'',   '+
                        '  result5       = ''%s'',   '+
                        '  detailrclass1 = ''%s'',   '+
                        '  detailrclass2 = ''%s'',   '+
                        '  detailrclass3 = ''%s'',   '+
                        '  detailrclass4 = ''%s'',   '+
                        '  detailrclass5 = ''%s'',   '+
                        '  detailrscore1 = ''%s'',   '+
                        '  detailrscore2 = ''%s'',   '+
                        '  detailrscore3 = ''%s'',   '+
                        '  detailrscore4 = ''%s'',   '+
                        '  detailrscore5 = ''%s'',   '+
                        '  writeemp      = ''%s'',   '+
                        '  writetime     = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),   '+
                        '  rscore        = ''%s''    '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND seqno = ''%s'' ',
                 [Param[0],Param[1],Param[2], Param[3],Param[4],Param[5],
                  Param[6],Param[7],Param[8], Param[9],Param[10],
                  Param[11],Param[12],Param[13],Param[14], Param[15],
                  v_s_rscore,
                  // 키부분
                  Param[16],Param[17],Param[18] ]);

      Cupd_SQL := Sqltext;
      Cupd_Exec;
      DBSet1.DisableControls;
      Read_pehreaim_det;
      DBSet1.Locate('SEQNO',VarArrayof([L_S_Seqno]),[loPartialKey]);
      DBSet1.EnableControls;
      //자기평가 점수 합계
      Rscore;

      MessageDlg('중점추진업무 ['+trim(DBSet1.FieldByName('PROPELTASK').AsString)+'] 을 저장하였습니다.',mtinformation,[mbOK],0);
   end
   else if NoteBook1.ActivePage = 'P2' then
   begin
     TeamForm2.DataSave(TeamForm2.BB_save);
   end
end;

procedure TFM_Main2.Cupd_Exec;
var
 sql :string;
begin
  Cupd_ret := False;
  with TMaxDML_HInsa do
  begin
    //ServiceName := 'PED1010A_dml';
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    SQL.Text := Cupd_SQL;
    if Execute then Cupd_ret := True;
  end;
end;

//점수 확인
procedure TFM_Main2.Bt_infoscoreClick(Sender: TObject);
begin

end;

//최종완료
procedure TFM_Main2.Bt_ConfirmClick(Sender: TObject);
var
  var_evcno : String;
  iRet      : Integer;
  SqlText   : string;
  A         : Integer;
  PE_Down1, PE_Down2, PE_Down3 : Boolean;
  ParamVariant  : string;
function GetComp(ekind:String) : Integer;
var
  ParamVariant : String;
begin
  if (ekind ='공통역량') or (ekind ='리더십역량') then
    ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)      ' +
                    '    || '';'' || Count(Decode(nvl(B.score,0), 0, 1))    ' +
                    '  FROM pehacd A, pesds B                               ' +
                    ' WHERE A.rabasdate = '''+Lrabasdate+'''                ' +
                    '   AND A.ekind     = ''' +ekind + '''                  ' +
                    '   AND a.evcno = (select evcno from pehamas where      ' +
                    '                  rabasdate = '''+Lrabasdate+'''       ' +
                    '                  and empno = '''+GSempno+''')         ' +
                    '   AND b.empno(+)  = '''+GSempno+'''                   ' + // 평가자사번
                    '   AND A.rabasdate = B.rabasdate(+)                    ' +
                    '   AND A.ekind     = B.ekind(+)                        ' +
                    '   AND A.itemno    = B.itemno(+)                       ' +
                    '   AND A.imageno   = B.imageno(+)                      '
  else if (ekind ='직무역량') then
    ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)      ' +
                    '    || '';'' || Count(Decode(nvl(B.score,0), 0, 1))    ' +
                    '  FROM peducd A, pesds B                               ' +
                    ' WHERE A.rabasdate = '''+Lrabasdate+'''                ' +
                    '   AND A.ekind     = '''+ekind +'''                    ' +
                    '   AND a.jobkind   = '''+Ljobkind+'''                  ' +
                    '   AND b.empno(+)  = '''+GSempno+'''                   ' + // 평가자사번
                    '   AND A.rabasdate = B.rabasdate(+)                    ' +
                    '   AND A.ekind     = B.ekind(+)                        ' +
                    '   AND A.itemno    = B.itemno(+)                       ' +
                    '   AND A.imageno   = B.imageno(+)                      ';
//
  Csel_SQL := ParamVariant;
  Csel_Open;
  With DBcommon Do
  begin
    if not Csel_ret then
    begin
        Result := -1;
        Exit;
    end;
    Result := StrToInt(Csel_gfd(1)) - StrToInt(Csel_gfd(2)) + StrToInt(Csel_gfd(3));
  end;
end;

function Temp_Update(var_Ekind : String) : Boolean;
var
   ParamVariant : String;
begin
    result := false;
    if var_Ekind = '공통역량' then
      ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                      'SET (abconyn, abtotscr, writeemp, writetime) = '
    else if var_Ekind ='리더십역량' then
      ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                      'SET (beconyn, betotscr, writeemp, writetime) = '
    else if var_Ekind ='직무역량' then
      ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                      'SET (duconyn, dutotscr, writeemp, writetime) = ';

    ParamVariant := ParamVariant +
                    '      (SELECT ''Y'', SUM(nvl(score,0))/COUNT(nvl(score,0)), '+
                    '              '''+GSempno+''', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +
                    '       FROM pesds '+ // 역량자기평가
                    '       WHERE rabasdate = '''+Lrabasdate+''' ' +
                    '         AND ekind     = '''+var_Ekind+''' ' + // 평가구분
                    '         AND empno    = '''+GSempno+''' ) '+
                    'WHERE rabasdate = '''+Lrabasdate+''' ' +
                    '  AND empno    = '''+GSempno+''' '; // 평가자(접속자사번)

    Cupd_SQL := ParamVariant;
    Cupd_Exec;
    if not Cupd_ret then
      begin
        Messagedlg('APP-Server Error' ,mtError,[mbOK],0);
        Exit;
      end;

    result := True;
end;

//최종완료 begin
begin
  ParamVariant :=
         //하은영
         'select sum(hap)                                                      '+
         '        from (                                                       '+
         '           select empno, 0 taskcode, sum(mainweight) hap             '+
      	 '	         from pehreaim_det                                         '+
         '           WHERE rabasdate = '''+Lrabasdate+'''                      '+
         '             AND empno = '''+GSempno+'''                             '+
         '           group by empno                                            '+
         '           union                                                     '+
         '           select a.empno, a.taskcode, max(a.mainweight) hap         '+
   			 '	         from pehreaim_comdet a, pehreaim_bas b                    '+
         '           WHERE a.rabasdate = '''+Lrabasdate+'''                    '+
	       '             and a.rabasdate = b.rabasdate                           '+
         '             and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)     '+
         '             AND a.empno = '''+GSempno+'''                           '+
         '             and a.taskcode = b.taskcode                             '+
         '           group by a.empno, a.taskcode)                             '+
         '      group by empno                                                 ';

  Csel_SQL := ParamVariant;
  Csel_Open;

  if Csel_gfd(1) <> '100' then
  begin
     MessageDlg('공동목표평가 매체비중 + 개별목표평가 비중의 합이 100이 아닙니다!',mtError, [mbOk], 0);
     Exit;
  end;

  if  SB_2.Visible = True then  //최종완료 업적평가에서 바로저장 여부. 2006.11.15 하은영
  begin
     NoteBook1.ActivePage := 'P2';
     SB_1Click(Sender);
  end;


  ParamVariant :=
         //하은영
         'select sum(hap)                                                      '+
         '        from (                                                       '+
         '           select a.empno, a.taskcode, max(a.mainweight) hap         '+
   			 '	         from pehreaim_comdet a, pehreaim_bas b                    '+
         '           WHERE a.rabasdate = '''+Lrabasdate+'''                    '+
	       '             and a.rabasdate = b.rabasdate                           '+
         '             and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)     '+
         '             AND a.empno = '''+GSempno+'''                           '+
         '             and a.taskcode = b.taskcode                             '+
         '           group by a.empno, a.taskcode)                             '+
         '      group by empno                                                 ';

  Csel_SQL := ParamVariant;
  Csel_Open;

  if Csel_gfd(1) <> '100' then
  begin
    if (trim(DBSet1.FieldByName('PROPELTASK').AsString) = '') then //(trim(DBSet1.FieldByName('PAYRA').AsString) <> '2C') and
    begin
       MessageDlg('업무를 등록하지 않았습니다. 업무등록 작업을 먼저하세요!',mtError, [mbOk], 0);
       Exit;
    end;

    if not FL_CheckNullEval then
    begin
      MessageDlg('업적평가에 평가하지 않은 항목이 있습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      System.Exit;
    end;
  end;

  //////////////////////////////////////////////////////////////////////////////
  // 최종완료여부
  if TeamForm2.IsDataModified then
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.',
                 '작업순서오류',MB_ICONWARNING);
      if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
      System.Exit;
    end;

    ParamVariant :=  'SELECT  '+
    ' nvl(        abconyn         ,'' '') || '';'' || '+
    ' nvl(        beconyn         ,'' '') || '';'' || '+
    ' nvl(        duconyn         ,'' '')             '+
    'FROM pesms              ' + // 능력태도상향종합
    'WHERE rabasdate = '''+Lrabasdate+''' ' +
    '  AND empno     = '''+GSempno+''' ' ; // 평가자


    Csel_SQL := ParamVariant;
    Csel_Open;

      if (Csel_gfd(1) = 'Y') then
        PE_Down1 := True
      else
        PE_Down1 := False;

      if (Csel_gfd(2) = 'Y') then
        PE_Down2 := True
      else
        PE_Down2 := False;

      if (Csel_gfd(3) = 'Y') then
        PE_Down3 := True
      else
        PE_Down3 := False;

     if (PE_Down1 = false) or (PE_Down2 = false) or (PE_Down3 = false) then
     begin
        if (PE_Down1 = false) and (Levcno[1] in (['1','2','3'])) then
        begin
         A := GetComp('공통역량');
         if  A = -1 then Exit
         else if A > 0 then
         begin
          if start = true then
            MessageDlg('역량평가에 아직 입력되지 않은 항목이 있습니다.'#13#13+
                       '화면 왼쪽 상단에 ''역량평가''를 선택해서 평가를 완료해 주시기 바랍니다.',mtError,[mbOK],0)
          else
            MessageBox(handle,Pchar('역량평가에 아직 입력되지 않은 항목이 있습니다.'#13#13+
                                    '화면 왼쪽 상단에 ''역량평가''를 선택해서 평가를 완료해 주시기 바랍니다.'),
                       '작업순서오류',MB_ICONWARNING);
            if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
            Exit;
         end;
        end;

        if (PE_Down2 = false) and (Levcno[1] in (['2','3']))  then
        begin
         A := GetComp('리더십역량');
         if  A = -1 then Exit
         else if A > 0 then
         begin
          if start = true then
            MessageDlg('리더십평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                       '최종완료를 할 수 없습니다.',mtError,[mbOK],0)
          else
            MessageBox(handle,pChar('리더십 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.  확인하세요'),
                       '작업순서오류',MB_ICONWARNING);
            if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
            Exit;
         end;
        end;

        if (PE_Down3 = false) and (Levcno[1] in (['1','2'])) then
        begin
         A := GetComp('직무역량');
         if  A = -1 then Exit
         else if A > 0 then
         begin
          if start = true then
            MessageDlg('직무역량 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                       '최종완료를 할 수 없습니다.',mtError,[mbOK],0)
          else
            MessageBox(handle,Pchar('직무역량 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.  확인하세요'),
                       '작업순서오류',MB_ICONWARNING);
            if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
            Exit;
         end;
        end;
      end;

      if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                                 '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+

                                 '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
      begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
      end;

      //피평가자 평가완료 여부 'Y'로 update
      SqlText := 'update pehremas                        '+
                 '   set rvalconyn =''Y'', rvalcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
                 '       e1valobjyn= ''N'', e2valobjyn = ''N'' '+
                 '  WHERE rabasdate = '''+Lrabasdate+''' '+
                 '    AND empno  = '''+GSempno+'''       ';

      Cupd_SQL := Sqltext;
      Cupd_Exec;

      if (SB_2.Visible = True) then
      begin
       if Temp_Update('공통역량') = false then
         Exit;
       if Temp_Update('리더십역량') = false then
         Exit;
       if Temp_Update('직무역량') = false then
         Exit;
      end;

      Bt_Confirm.Visible     := false;
      BT_Save.Visible        := false;
      OnFocusButton1.Visible := false;
      MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);

  ////////////////////////////////////////////////////////////////////////////
end;

function TFM_Main2.FL_CheckNullEval:Boolean; // 하나라도 평가안한 항목이 있는지를 체크
begin
  Result := False;
  with DBcommon do
  begin
    SQL.Clear;
    SQL.Text := format('select count(*) cnt from pehreaim_Det                      '+
                       ' where((detailtask1 is not null and detailrclass1 is null) '+
                       '    or (detailtask2 is not null and detailrclass2 is null) '+
                       '    or (detailtask3 is not null and detailrclass3 is null) '+
                       '    or (detailtask4 is not null and detailrclass4 is null) '+
                       '    or (detailtask5 is not null and detailrclass5 is null))'+
                       '   and empno =''%s''                                       '+
                       '   and rabasdate =''%s''                                   ',
                       [ED_empno.empno, Lrabasdate]);
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 100);
    Open;
    if FieldByName('SEL_DATA').AsInteger >  0 then
       Result := False
    else
       Result := True;
  end;
end;
procedure TFM_Main2.BitBtn1Click(Sender: TObject);
begin
  PrintForm := TPrintForm.Create(Self);
  PrintForm.PeQuickRepPrn1.Preview;
end;       

procedure TFM_Main2.Notebook1PageChanged(Sender: TObject);
begin
  if NoteBook1.ActivePage = 'P2' then
  begin
    try
    TeamForm2 := TTeamForm2.Create(nil); // 역량평가
    TeamForm2.Parent      := Notebook1;
    TeamForm2.WindowState := wsMaximized;
    TeamForm2.Show;
  except
    begin
      if (TeamForm2 <> nil) or Assigned(TeamForm2) then
        begin
          TeamForm2.Free;
          TeamForm2 := nil;
        end;
    end;
  end;
  end;
end;

//평가 Petition 등록
procedure TFM_Main2.Bt_AddClick(Sender: TObject);
begin
  try
    F_Opinon2 := TF_Opinon2.Create(nil); // 역량평가
    F_Opinon2.WorkTab := Notebook1.PageIndex;
    F_Opinon2.ShowModal;
    if Notebook1.PageIndex = 0 then
       Read_pehreaim_det
    else
    if Notebook1.PageIndex = 1 then
       TeamForm2.BB_CancelClick(Sender);
  except
    begin
      if (F_Opinon2 <> nil) or Assigned(F_Opinon2) then
        begin
          F_Opinon2.Free;
          F_Opinon2 := nil;
        end;
    end;
   end;
end;

//평가 Petition 완료
procedure TFM_Main2.Bt_OConfirmClick(Sender: TObject);
var
  curdate,SqlStr,v_cnt : string;
  sWhereSql, snotobj, sUpdateSql : string;
  ManagerBody, JJangBody : String;

  function IsNullField(sw:integer):Boolean;
  var
    SqlStr : string;
  begin
    Result := False;

    if   sw = 10 then
         SqlStr := format('select count(seqno) cnt from pehreaim_det where %s ', [sWhereSql])
    else
    if   sw = 11 then
         SqlStr := format('select count(itemno) cnt from pesds  where %s ', [sWhereSql])
    else
    if   sw = 12 then
         SqlStr := format('select count(itemno) cnt from petds  where %s ', [sWhereSql])
    else
    if   sw = 20 then
         SqlStr := format('select count(seqno) cnt from pehreaim_det where %s ', [sNotobj])
    else
    if   sw = 21 then
         SqlStr := format('select count(itemno) cnt from pesds where %s ', [sNotobj])
    else
    if   sw = 22 then
         SqlStr := format('select count(itemno) cnt from petds  where %s ', [sNotobj]);

    with DBcommon do
    begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlStr;
         Open;

         if Bof and Eof then exit;
         v_cnt     := Csel_gfd(1);
         if v_cnt = '0' then Result := False
         else                Result := True;
    end;
  end;

begin
  if IDNO = Messagebox(handle,pchar('완료하시면 더이상 평가 Petition하실 수 없습니다.'+#13+#13+
                                    '계속하시겠습니까?'),'확인',MB_YESNO or $0030) then
            system.exit;

  curdate := copy(Lrabasdate,1,8);

  sWhereSql := format(' rabasdate = ''%s'' and empno = ''%s'' and objyn = ''Y'' and objsayu is  null ',
                      [Lrabasdate,Ed_empno.empno]);

  snotobj   := Format(' rabasdate = ''%s'' and empno = ''%s'' and objyn = ''Y'' ',
                      [Lrabasdate,Ed_empno.empno]);

  if (Levcno = '1') or (Levcno = '2') then
  begin
      if IsNullField(10)  or IsNullField(11)   then
      begin
          Messagedlg('평가 Petition사유를 입력하십시오',mtError,[mbOK],0);
          exit;
      end;

      if (not IsNullField(20)) and (not IsNullField(21))  then
      begin
         Messagedlg('평가 Petition 후  완료하시기 바랍니다.',mtError,[mbOK],0);
         exit;
      end;
  end
  else
  if Levcno = '3' then
  begin
      if IsNullField(10)  or IsNullField(12) then
      begin
          Messagedlg('평가 Petition사유를 입력하십시오',mtError,[mbOK],0);
          exit;
      end;

      if (not IsNullField(20)) and (not IsNullField(22))  then
      begin
         Messagedlg('평가 Petition 후  완료하시기 바랍니다.',mtError,[mbOK],0);
         exit;
      end;
  end;
  //============================================================================//
  sUpdateSql := format('update pehremas             '+
                       '   set rvalobjyn   = ''Y'' ,'+
                       '       rvalobjdate = ''%s'' '+
                       ' where rabasdate=''%s''     '+
                       '   and empno=''%s''         ',[curdate,Lrabasdate,Ed_empno.empno]);

  Cupd_SQL := sUpdateSql;
  Cupd_Exec;

  //메일 보내기 시작
  Messagedlg('평가자에게 평가 Petition 메일을 발송합니다.',mtinformation,[mbOK],0);

  //팀원 메세지.
  ManagerBody := '피평가자 ['+GSempno+'-'+ GSkorname +']이/가 평가 결과에 대해 평가 Petition 하였습니다. '+#13#13+
                 '['+GSempno+'-'+ GSkorname +']구성원에 대한 평가소견(평가사유 또는 근거)을 등록하여 주시기 바랍니다. '+#13#13+
                 '[종합인사정보시스템] ▶ [평가] ▶ [자기/상사평가] ▶ 팀원 상사(하향)평가' +#13#13+
                 ' => 평가 Petition한 구성원 선택후 평가수행 클릭 '+#13#13+
                 ' => 평가 Petition 여부 "Y" 인 중점추진업무 및 평가항목 클릭하면 하단에 버튼이 활성화 됩니다.';

  //팀장 메세지
  JJangBody   := '피평가자 ['+GSempno+'-'+ GSkorname +']이/가 평가 결과에 대해 평가 Petition 하였습니다. '+#13#13+
                 '['+GSempno+'-'+ GSkorname +']구성원에 대한 평가소견(평가사유 또는 근거)을 등록하여 주시기 바랍니다. '+#13#13+
                 '[종합인사정보시스템] ▶ [평가] ▶ [자기/상사평가] ▶ 팀장 상사(하향)평가' +#13#13+
                 ' => 평가 Petition한 구성원 선택후 평가수행 클릭 '+#13#13+
                 ' => 평가 Petition 여부 "Y" 인 중점추진업무 및 평가항목 클릭하면 하단에 버튼이 활성화 됩니다.';
                   
  //==============================================================================//
  SendProgID  := 'PET1010F';  //프로그램 ID
  SendEmpno   := GSempno;     //발송자(로그인 사번)
  MailSubject := '[ 피평가자('+GSempno+'-'+ GSkorname +') 평가 Petition ]';
  ReceiveYN   := 'N';

  if   FM_Main.Levcno <> '3' then MailBody := ManagerBody
  else                            MailBody := JJangBody;

  RcveEmpno   := FM_Main.Workemp1;    //인사팀 평가담당자에게 평가 Petition 내역을 전송한다.
  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);

  RcveEmpno   := 'Z113';      //개발자.
  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
  //==============================================================================//
  ////1차 평가자 메일을 보낸다.
  RcveEmpno   := Le1empno;    //'Z113';
  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('1차 평가자에게 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else
  begin
       MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                  '평가 Petition작업은 처리되었으므로    '+#13+
                  '상위부서장께 [평가 Petition 확인요청] 메시지를 '+#13+
                  '직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
       System.Exit;
  end;

  //==============================================================================//
  //2차 평가자  메일을 보낸다.
  if (Le2empno <> '') and (FM_Main.Le2Valconyn = '완료') then
  begin
       RcveEmpno   := Le2empno;    //'Z113';
       if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            MessageDlg('2차 평가자에게 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
       else
       begin
            MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                       '평가 Petition작업은 처리되었으므로    '+#13+
                       '상위부서장께 [평가 Petition 확인요청] 메시지를 '+#13+
                       '직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
            System.Exit;
       end;
  end;
  //==============================================================================//

  Bt_Add.Enabled      := false;
  Bt_OConfirm.Enabled := false;
  MessageDlg('[평가 Petition완료]가 정상처리 되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TFM_Main2.Read_pehreaim_comdet;
var SqlText : string;
    i : integer;
begin
   if Ed_empno.empno = '' then exit;

   Gisum := 0;

   //H10차 의한 부서코드변환 deptcode,1,3->deptcode,1,4   20051025JSH
   SqlText := 'select t1.taskname||'';''||t2.mainweight||'';''||t1.sel_data||'';''||nvl(round(t1.sel_data * t2.mainweight *0.01,2),0)||'';''||t1.taskcode'+
               ' from (select b.taskname, b.taskcode, substr(a.deptcode,1,4) deptcode,'+
                            ' nvl(round(sum((a.detailrscore * detailweight)/100),2),0) sel_data'+
                       ' from pehaimhis_com a, pehreaim_bas b, pehremas c'+  
                      ' where c.empno = '''+Ed_empno.empno+''' '+
                        ' and substr(a.deptcode,1,4) = substr(c.deptcode,1,4)'+
                        ' and a.rabasdate = '''+ Lrabasdate +''''+
                        ' and c.rabasdate = '''+ Lrabasdate +''''+
                        ' and nvl(a.eobjyn,''N'')  <> ''Y'''+
                        ' and nvl(a.econyn,''N'')  = ''Y'''+
                        ' and a.rabasdate = b.rabasdate'+
                        ' and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)'+
                        ' and a.taskcode  = b.taskcode'+
	               ' group by b.taskname, b.taskcode, substr(a.deptcode,1,4)) t1,'+
	  	    ' (select distinct substr(deptcode,1,4) deptcode, taskcode, mainweight'+
	  	       ' from pehreaim_comdet'+
		      ' where rabasdate = '''+ Lrabasdate +''''+
		        ' and empno = '''+Ed_empno.empno+''''+
                        ') t2'+
	     ' where t1.deptcode = t2.deptcode'+
	       ' and t1.taskcode = t2.taskcode';

   //Edit1.Text := SqlText;

   with DBSet2 do
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
         sGrid1.RowCount := RecordCount + 1;
         sGrid2.RowCount := RecordCount + 1;

         for i := 1 to RecordCount do
         begin
            sGrid1.Cells[1,i] :=  Csel_gfd1(1);
            sGrid1.Cells[2,i] :=  Csel_gfd1(2);
            sGrid1.Cells[3,i] :=  Csel_gfd1(3);
            sGrid1.Cells[4,i] :=  Csel_gfd1(4);  //공동목표평가점수

            sGrid2.Cells[1,i] :=  Csel_gfd1(1);
            sGrid2.Cells[2,i] :=  Csel_gfd1(2);

            Gisum := Gisum + strtoFloat(Csel_gfd1(4));

            next;
         end;
         if Le1valconyn = 'Y' then //1차평가자 평가완료이면
         begin
            if (trim(On_RContrScr.text) = '0') or (trim(On_RContrScr.text) = '1')
            or (trim(On_RContrScr.text) = '2') or (trim(On_RContrScr.text) = '3') then
            begin
               NE_Score3.Value := NE_Score1.Value +Gisum+ Strtoint(On_RContrScr.text);
               NE_Score2.Value := NE_Score2.Value +Gisum+ Strtoint(On_RContrScr.text);
            end
            else
            begin
               NE_Score3.Value := NE_Score1.Value +Gisum;
               NE_Score2.Value := NE_Score2.Value +Gisum;
            end;
         end;
      end;
      close;
   end;
end;

function TFM_Main2.Csel_gfd1(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet2.FieldByName('SEL_DATA').AsString;
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


procedure TFM_Main2.FormShow(Sender: TObject);
begin
   with sGrid1 do
   begin
     Cells[1,0] := '매체명';
     Cells[2,0] := '매체비중';
     Cells[3,0] := '매체별 평가점수';
     Cells[4,0] := '개인별 환산평가점수';
   end;
   with sGrid2 do
   begin
     Cells[1,0] := '매체명';
     Cells[2,0] := '매체비중';
   end;
end;

procedure TFM_Main2.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Left : integer;
   // ileft:integer;
begin
   //ileft := Rect.Right - Rect.Left - sGrid1.Canvas.TextWidth(sGrid1.Cells[ACol,ARow]);
   Left := Rect.Left + 3;//(ileft div 2);
   if ARow = 0 then
   begin
      sGrid1.Canvas.Font.Style := [fsBold];
      sGrid1.Canvas.FillRect(Rect);
   end;
   sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);
end;

procedure TFM_Main2.sGrid1DblClick(Sender: TObject);
begin
   //매체별 세부추진활동을 보여줘야 할지 말아야 할지 협의 해야 할듯 함
   //FDetailForm.ShowModal;
end;

procedure TFM_Main2.OnScrSaveClick(Sender: TObject);
var SqlText : string;
begin
   //자기평가의 기여도는 평가하지 않음.

   with DBcommon do
   begin
      Close;
      SqlText := 'Select RCONTRSCR '+
                 'from PEHREAIM_SCR '+
                 'where rabasdate = '''+ Lrabasdate +''' '+
                 'and empno = '''+Ed_empno.empno+''' ';

      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then //update처리
      begin
         SqlText := 'UPDATE PEHREAIM_SCR SET'+
                          ' RCONTRSCR = '+trim(On_RContrScr.Text)+
                    ' where rabasdate = '''+ Lrabasdate +''''+
		        ' and empno = '''+Ed_empno.empno+'''';
         Cupd_SQL := Sqltext;
         Cupd_Exec;
         if not Cupd_ret then
         begin
            Messagedlg('APP-Server Error' ,mtError,[mbOK],0);
            Exit;
         end;
         showmessage('기여도 점수 저장처리 되었습니다.');
      end
      else //insert처리
      begin
         SqlText := 'INSERT INTO PEHREAIM_SCR'+
                   ' (RABASDATE, EMPNO, DEPTCODE,RCONTRSCR, ECONTRSCR) '+
                   'VALUES '+
                   ' ('''+ Lrabasdate+''','+
                      ' '''+ Ed_empno.empno+''',' +
                      ' '''+ LDeptCode+''',' +
                       trim(On_RContrScr.Text)+ ','+
                     '  '''')';
         Cupd_SQL := Sqltext;
         Cupd_Exec;
         if not Cupd_ret then
         begin
            Messagedlg('APP-Server Error' ,mtError,[mbOK],0);
            Exit;
         end;
         showmessage('기여도 점수 저장처리 되었습니다.');
      end;
      close;
   end;

end;

procedure TFM_Main2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Main2.OnFocusButton1Click(Sender: TObject);
const
 ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var fName: TextFile;
    regtry: TRegistry;
begin
   AssignFile(fName, GSHomeDir+'\IDCheck1.txt');
   Rewrite(fName);
   //Writeln(fName, '1');                                  //구분값
   //Writeln(fName, sGrid1.Cells[1,sGrid1.Row]); //empno
   Writeln(fName, GSempno); //empno
   CloseFile(fName);

   regtry := TRegistry.Create;
   regtry.RootKey := HKEY_LOCAL_MACHINE;
   //HKEY_LOCAL_MACHINE\SOFTWARE\(주) 하나로\NEW종합인사정보시스템 //NewHomeDir
   if regtry.OpenKey(ObjName,False) then
      regtry.Writestring( 'KillProcess', '');
   regtry.CloseKey();
   regtry.Free;


   //일반목표등록
   // dsa2000  Program Down 또는 Call 하여 실행하기.
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
   FM_DownLoad.PL_VersionCHK3(3, 'PEA1060D');  //Call하는 단위 프로그램의 버젼을 체크..
   if (not FM_DownLoad.FL_VersionCHK ) or
      (not FileExists(GSHomeDir+'\Bin\3tier\PEA1060D.EXE')) then
   begin
      FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060D.EXE','PEA1060D',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
   end
   else
   begin
      FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';

      LSfilename := GSHomeDir+'\Bin\3Tier\PEA1060D.EXE ,'
                  +Passemp(cmdline,1) +','+Passemp(cmdline,2)+','+Passemp(cmdline,3)+','
                  +Passemp(cmdline,4) +','+Passemp(cmdline,5)+','+Passemp(cmdline,6)+','
                  +Passemp(cmdline,7) +','+Passemp(cmdline,8)+','+Passemp(cmdline,9)+','
                  +Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                  +Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

      strpcopy( LAarg, LSfilename );
      winexec(LAarg, SW_SHOWNORMAL);

      FM_DownLoad.Close;      // 다운로드 폼 닫기.

      MessageDlg('개인별업무목표 등록을 반영합니다.',mtInformation,[mbOK],0);

      FL_Start := True;
      FM_Main2.FormPaint(Sender);

   end;

end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_Main2.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TMaxDML_HInsa do
  begin
       ServiceName := 'PEA1060A_dml';
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

end.
