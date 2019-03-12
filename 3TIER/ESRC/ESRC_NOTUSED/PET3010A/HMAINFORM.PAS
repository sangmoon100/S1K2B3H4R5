{=============================== Program Header ================================
 PROGRAM-NAME   : 자기/상사 평가 - PET3010A
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 팀원 자기평가
 Programmer     :
 Version        : ver 1.0
 Date           : :2013.09.16
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.09.16    이희용       신규개발                HR팀 요청
================================================================================}

unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, hanapass,
  pass, registry, PDownLoad, TmaxFunc, OnEditMemo, OnEditCombo, Func;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    Insa_Session : TTMaxSession;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    L_e1emp: TOnShapeLabel;
    L_e2emp: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    DBSet1: TTMaxDataSet;
    DataSource1: TDataSource;
    SB_1: TOnSkinButton;
    Notebook1: TNotebook;
    Panel9: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
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
    Shape6: TShape;
    pnl_no1: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    E_Aim1: TOnEdit;
    SelfClass1: TPanel;
    DownClass1: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    OnNumberEdit1: TOnNumberEdit;
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
    Shape4: TShape;
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
    Shape3: TShape;
    pnl_no3: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    E_Aim3: TOnEdit;
    SelfClass3: TPanel;
    DownClass3: TPanel;
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
    Shape2: TShape;
    pnl_no4: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    E_Aim4: TOnEdit;
    SelfClass4: TPanel;
    DownClass4: TPanel;
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
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    E_Aim5: TOnEdit;
    SelfClass5: TPanel;
    DownClass5: TPanel;
    DBcommon: TTMaxDataSet;
    TMaxDML_HInsa: TTMaxDataSet;
    BT_Save: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    DBG_user: TOnGrDbGrid;
    SB_2: TOnSkinButton;
    DownScore1: TOnShapeLabel;
    L_help: TLabel;
    Bt_Add: TOnFocusButton;
    Bt_OConfirm: TOnFocusButton;
    E_Ratio: TOnEdit;
    BT_Insert: TOnFocusButton;
    TMaxDML_Group: TTMaxDataSet;
    Edit1: TEdit;
    OnNumberEdit2: TOnNumberEdit;
    TDml: TTMaxDataSet;
    E_ChangeEmp: TEdit;
    BT_Change: TButton;
    BT_Print: TOnFocusButton;
    SB_4: TOnSkinButton;
    pnl_6: TPanel;
    SB_S6: TOnSkinButton;
    SB_B6: TOnSkinButton;
    SB_C6: TOnSkinButton;
    SB_D6: TOnSkinButton;
    SB_A6: TOnSkinButton;
    E_TaskAdd1: TOnShapeLabel;
    E_TaskAdd2: TOnEdit;
    Label1: TLabel;
    SelfClass6: TPanel;
    DownClass6: TPanel;
    SelfScore6: TOnShapeLabel;
    DownScore6: TOnShapeLabel;
    Panel28: TPanel;
    DBSet2: TTMaxDataSet;
    DBSet3: TTMaxDataSet;
    OnFocusButton1: TOnFocusButton;
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
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_OConfirmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_InsertClick(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_ChangeClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    Start      : Boolean;
    GSHomeDir  : string;
    LSfilename : string;
    LAarg : array[0..200] of char;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure Read_pehreaim_det;
    procedure Read_Values;
    procedure Read_Com;
    procedure Read_pehamas;
    procedure ResetAllButton;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    Function  FL_CheckNullMERIT : Boolean;    //장단점 미입력 항목이 있는지 여부 체크
  public
    { Public declarations }
    GSempno   : String;     //Login사번
    GSkorname : String;     //Login성명
    GSgrade   : String[10]; //등급
    Pempno    : String;     //Login사번
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
    Lpaycl        : string;
    Ljobkind      : string;
    //Lobjsayu      : string;
    //Lobjopinion   : string;
    Lrvalobjyn    : string;
    Gdutykindname : string;
    Gjobgunname   : string;
    GsDeptcode    : string;

    Csel_ret : Boolean;

    g_rscore,    g_escore    : string;
    g_prorscore, g_proescore : string;
    g_prorclass, g_proeclass : string;

    clilk : real;

    vGradeTop : Boolean;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    mdeptname : String;         //인사팀 부서명

    LSelfValue1, LSelfValue2  : String;

    procedure Cupd_Exec;
    procedure Csel_Open;
    procedure Rscore;
    procedure InitSetup;
    function Csel_gfd(p_loc: Integer): String;
    function  FL_CheckNullEval:Boolean;     //평가하지 않은 항목이 있는지 여부 체크
  end;

const
  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;

implementation

uses HPrintForm, UTeamForm, UOpinon, HMainForm2, UValueForm ;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  VarLoading;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  SqlText       : string;
begin
  if FL_Start then
  begin
      FL_Start := False;
      SF_Main.Refresh;

      Application.ProcessMessages;

      GSempno       := Hinsa_Param(cmdLine,1);
      GSkorname     := Hinsa_Param(cmdLine,2);
      GSgrade       := Hinsa_Param(cmdLine,4);
      Pempno        := Hinsa_Param(cmdLine,1);
      SB_4.BtnDown  := True;

      Insa_Session.ServiceTimeOut := 1000;
      Insa_Session.Connect     := False;
      Insa_Session.EnvFileName := GetHomeDir+'\newhana.env';
      Insa_Session.LabelName   := 'HANAROHPER';

      Try
        Insa_Session.Connect := True;
        Insa_Session.TMax_Begin(5000);
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
//      Lrabasdate := '20111130';
      //평가담당자 불러오기
      SqlText := 'SELECT Value1||'';''||Value2||'';''||Value3  ' +
                 '       ||'';''||Value4||'';''||Value5        ' +
                 '  FROM pehrebas                              ' +
                 ' WHERE rabasdate = '''+Lrabasdate+'''        ' +
                 '   AND gubun     = ''11''                    ' +
                 '   AND sgubun    = ''0005''                  ' ;

      Csel_SQL := SqlText;
      Csel_Open;
      Workemp1 := Csel_gfd(1);
      Workemp2 := Csel_gfd(2);
      Workemp3 := Csel_gfd(3);
      Workemp4 := Csel_gfd(4);
      Workemp5 := Csel_gfd(5);

      //인사팀 부서명 불러오기
      SqlText := 'SELECT  Value2                  ' +
                 '  FROM pimvari                  ' +
                 ' WHERE gubun     = ''R0''       ' +
                 '   AND sgubun    = ''0001''     ';

      Csel_SQL := SqlText;
      Csel_Open;
      Mdeptname := DBcommon.FieldByName('SEL_DATA').AsString;

      vGradeTop := False;
      if (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
         (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
      begin
          vGradeTop           := True;
          E_ChangeEmp.Visible := true;
          BT_Change.Visible   := true;
          E_ChangeEmp.Text    := Gsempno;

          if copy(Gsempno,1,1) = 'D' then
          begin
               Gsempno          := Workemp1;
               E_ChangeEmp.Text := Workemp1;
          end;
      end
      else
      begin
          E_ChangeEmp.Visible := false;
          BT_Change.Visible   := false;
          E_ChangeEmp.Text    := Gsempno;
      end;

      ///프로그램 임시 종료시에 사용.  /////////////////////////////////////////
      {ShowMessage('"팀원 자기평가" 기간이 종료되었습니다.'+#13+#13+
                  '담당자에게 문의 하시기 바랍니다.    ');
      FM_Main.Close;
      Exit;  }
      //////////////////////////////////////////////////////////////////////////
            
      InitSetup;
  end;
end;

procedure TFM_Main.InitSetup;
const
  ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var
  SqlText       : string;
  v_pgroupratio, v_RESTIONLYYN, v_E1PRJCONYN : string;
  v_restiyn,v_e1valobjyn   : string;
  i           : integer;
  reg_exe: TRegistry;
begin
  if (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
     (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
  begin
      GSempno       := E_ChangeEmp.Text;  //dsa2000
  end;

  //공동목표대상자인지 여부를 체크 한다.
  //공동목표대상자이면    FM_Main2.ShowModal;
  //그렇지 않으면 다음처리로직을 실행한다.
  SqlText := 'select nvl(unionyn,''N'')  '+
             '  from pehreaim_combas     '+
             ' where rabasdate = '''+Lrabasdate+''' '+
             '   and empno     = '''+GSempno+'''';
  Csel_SQL := SqlText;
  Csel_Open;

  if DBcommon.FieldByName('SEL_DATA').AsString = 'Y' then
  begin
     FM_Main2 := TFM_Main2.Create(Self);  //폼을 불러들임.
     FM_Main2.v_pgroupratio := v_pgroupratio;

     FM_Main2.ShowModal;
  end
  else
  begin
     //자기평가 여부, 시스템 시간, 1차 평가자사번, 1차 평가자 이름, 평가표 번호, 직종 불러오기
     SqlText := Format('select a.restiyn  ||'';''||a.e1empno   ||'';''|| a.e1korname     ||'';''|| a.e2empno     ||'';''|| a.e2korname||'';''|| '+
                       '       a.rvalconyn||'';''||e1valconyn  ||'';''|| e1valcondate    ||'';''|| c.codename    ||'';''||'+
                       '       e.DEPTNAME ||'';''||d.codename  ||'';''|| nvl(f.syn,''N'')||'';''|| f.evcno       ||'';''||'+
                       '       a.jobkind  ||'';''||a.e1valobjyn||'';''|| a.rvalobjyn     ||'';''|| a.pgroupratio ||'';''||'+//하은영
                       '       a.RESTIONLYYN || '';'' || a.E1PRJCONYN|| '';'' || a.paycl||'';'' || a.deptcode    A   '+
                       '  from pehremas a, pehreaim_det b, pyccode c, pyccode d, pycdept e, pehamas f '+
                       ' where a.empno     = b.empno(+)                                               '+
                       '   and a.rabasdate = b.rabasdate(+)                                           '+
                       '   and a.empno     = ''%s''                                                   '+
                       '   and a.rabasdate = ''%s''                                                   '+
                       '   and a.e1PAYCL = c.codeno(+) AND c.codeid(+)=''I112''                       '+
                       '   and a.e1PAYRA = d.codeno(+) AND d.codeid(+)=''I113''                       '+
                       '   and a.e1ORGNUM= e.ORGNUM AND a.e1DEPTCODE = e.DEPTCODE                     '+
                       '   and a.rabasdate=f.rabasdate(+)                                             '+
                       '   and a.empno = f.empno(+)                                                   '+
                       ' group by a.restiyn , a.e1empno , a.e1korname , a.e2empno , a.e2korname,      '+
                       '           a.rvalconyn , a.e1valconyn , a.e1valcondate , c.codename,          '+
                       '           e.DEPTNAME , d.codename, f.syn, f.evcno, a.jobkind, a.e1valobjyn,  '+
                       '           a.rvalobjyn, a.pgroupratio, a.RESTIONLYYN,a.E1PRJCONYN,a.paycl,a.deptcode      ',[GSempno, Lrabasdate]);

     Edit1.Text := SqlText;     //Exit;
     Csel_SQL   := SqlText;
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
     v_e1valobjyn  := Csel_gfd(15);
     Lrvalobjyn    := Csel_gfd(16);
  //   v_pgroupratio := Csel_gfd(17);
     v_RESTIONLYYN := Csel_gfd(18);
     v_E1PRJCONYN  := Csel_gfd(19);  //dsa2000  2008.10. Add
     Lpaycl        := Csel_gfd(20);
     GsDeptcode    := Csel_gfd(21);


     //1차평가자 평가완료한경우
     if Le1valconyn = 'Y' then
     begin
       OnNumberEdit2.Visible := true;
//       E_Ratio.Visible := true;
     end
     else
     begin
       OnNumberEdit2.Visible := false;
       E_Ratio.Visible := false;
     end;


     // 자기평가 대상자가 아닌 경우.....
     if (v_restiyn <> 'Y') then
       begin
         MessageDlg('자기평가 대상자가 아닙니다.' + #13+#13+
                   '[자기평가]프로그램은 자동종료됩니다.', mtConfirmation, [mbOK],0);
         Application.Terminate;
         Exit;
       end;

     // 업적 자기평가 대상자가 아닌 경우.....
     if (v_RESTIONLYYN = 'Y') then
       begin
         MessageDlg('업적 자기평가 대상자가 아닙니다.' + #13+#13+
                    '역량자기평가만 진행하십시요.', mtConfirmation, [mbOK],0);

         SB_4.Visible := false;
       end;

     // 팀장이 이곳에서 자기평가하는것을 막음.
     if Levcno = '3' then
     begin
        MessageDlg('팀장님은 팀장자기평가에서 평가하세요.' + #13+#13+
                   '[자기평가]프로그램은 자동종료됩니다.', mtConfirmation, [mbOK],0);
        Application.Terminate;
        Exit;
     end;

     // 자기평가 반려인 경우.....
     if (v_e1valobjyn = 'Y') then
     begin
        MessageDlg('평가자가 자기평가를 반려하였습니다. ' + #13+#13+
                   '다시 [자기평가]를 하십시요.', mtConfirmation, [mbOK],0);
     end;

     // 역량평가 대상자가 아닌 경우.....
     if (Lsyn <> 'Y') then
     begin
        SB_2.Visible := false;
     end;

     // 자기평가를 완료 안했을 경우
     if (Lrvalconyn <> 'Y') then
     begin
          Bt_Confirm.Visible := true;
          BT_Save.Visible    := true;
          //BT_Insert.Visible  := true;

          for i := 0 to Self.ComponentCount - 1  do
          begin
               if (Components[i] is TOnSkinButton) then
               begin
                    if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and
                       (Components[i].Name <> 'SB_3') and (Components[i].Name <> 'SB_4')then
                    begin
                     (Components[i] As TOnSkinButton).OnClick := SB_S1Click;
                    end;
               end;
               if (Components[i] is TPanel) then
               begin
                    (Components[i] As TPanel).OnEnter := pnl_1Enter;
                    (Components[i] As TPanel).OnExit  := pnl_1Exit;
               end;
               if (Components[i] is TOnEdit) then (Components[i] As TOnEdit).ReadOnly := False;
          end;
     end
     /////////////////////////////////////////////////////////////////////////////////
     else
     begin
       MessageDlg('이미 [자기 평가]를 최종완료 하였습니다.' + #13+#13+
                  '[자기 평가]점수확인만 할수 있습니다.', mtConfirmation, [mbOK],0);
       BT_Save.Visible := false;
       Bt_Confirm.Visible := false;
       BT_Insert.Visible := false;

       //평가자가 평가완료하지 않았을때
       if (Le1valconyn = 'N') then
       begin
          //Messagedlg('아직 1차평가자가 하향평가를 완료하지 않았습니다. '+#13+
          //           '1차평가자의 하향평가완료 후 동의하지 않으시면 평가 Petition 하십시오.',
          //           mtInformation,[mbOK],0);
         Bt_Add.Visible := False;
         Bt_OConfirm.Visible := False;
       end;
       //하은영
       {else
       begin
         Bt_Add.Visible := true;
         Bt_OConfirm.Visible := true;
       end;}

       //이의신청 완료
       if (FM_Main.Lrvalobjyn = 'Y') then
         begin
           MessageDlg('평가 Petition 완료한 자료입니다.',mtInformation,[mbOK],0);
           Bt_Add.Caption := '평가소견보기';
           FM_Main.Bt_OConfirm.Enabled := False;
         end;

       for i := 0 to Self.ComponentCount - 1  do  //클릭안되게 세팅
       begin
         if (Components[i] is TOnSkinButton) then
         begin
           if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and
              (Components[i].Name <> 'SB_3') and (Components[i].Name <> 'SB_4') then
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
     E_Ratio.text:= '상위 '+v_pgroupratio+'% 이내';

     ED_empno.Text  := GSempno;

     ED_empno.PL_get_singledata;

     if GSgrade[1] > 'B' then ED_empno.Enabled         := False
     else                     ED_empno.Enabled         := True;
     if ED_empno.Enabled then ED_empno.SetFocus;

     SB_1Click(SB_4);

     if v_E1PRJCONYN <> 'Y' then
     begin
          MessageDlg('1차 평가자께서 목표설정에 대한 결재를 하지 않으셨습니다. '+#13+#13+
                     '확인 바랍니다.  프로그램을 종료합니다.', mtInformation, [mbOk], 0);
          if not vGradeTop then FM_Main.Close;
          if not vGradeTop then Exit;
     end;
  end;
end;


procedure TFM_Main.Rscore;
var
  SqlText       : string;
begin
  //자기평가점수 합계
  SqlText := Format('select decode(sum(rscore),'''',0,sum(rscore)) ||'';''|| decode(sum(escore),'''',0,sum(escore))  from pehreaim_DET   '+
                    ' where empno=''%s'' and rabasdate=''%s'' ',[GSempno, Lrabasdate]);
  Csel_SQL := SqlText;
  Csel_Open;
  g_rscore      := Csel_gfd(1);
  g_escore      := Csel_gfd(2);

  SqlText := Format('select decode(prorscore,'''',0,prorscore) ||'';''|| decode(proescore,'''',0,proescore) '+
                    '       ||'';''||prorclass ||'';''|| proeclass '+
                    '  from pehremas   '+
                    ' where empno=''%s'' and rabasdate=''%s'' ',[GSempno, Lrabasdate]);
  Csel_SQL := SqlText;
  Csel_Open;
  g_prorscore   := Csel_gfd(1);
  g_proescore   := Csel_gfd(2);
  g_prorclass   := Csel_gfd(3);
  g_proeclass   := Csel_gfd(4);

  TOnSkinButton(Self.FindComponent('SB_S6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_A6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_B6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_C6')).BtnDown := False;
  TOnSkinButton(Self.FindComponent('SB_D6')).BtnDown := False;

  TOnSkinButton(Self.FindComponent('SB_S6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_A6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_B6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_C6')).Font.Color  := clBlack;
  TOnSkinButton(Self.FindComponent('SB_D6')).Font.Color  := clBlack;

  if g_prorscore <> '0' then SelfScore6.ValueCaption := g_prorscore
  else                       SelfScore6.ValueCaption := '';

  if      g_prorclass = 'S' then SelfClass6.Caption := var_GrdS
  else if g_prorclass = 'A' then SelfClass6.Caption := var_GrdA
  else if g_prorclass = 'B' then SelfClass6.Caption := var_GrdB
  else if g_prorclass = 'C' then SelfClass6.Caption := var_GrdC
  else if g_prorclass = 'D' then SelfClass6.Caption := var_GrdD
  else                           SelfClass6.Caption := g_prorclass;

  if  g_prorclass <> '' then
  begin
    TOnSkinButton(Self.FindComponent('SB_'+g_prorclass+'6')).BtnDown    := True;
    TOnSkinButton(Self.FindComponent('SB_'+g_prorclass+'6')).Font.Color := clWhite;
  end;

  OnNumberEdit1.Value := StrToFloat(g_rscore)*0.9 + StrtoFloat(g_prorscore)*0.1;
  OnNumberEdit2.Value := StrToFloat(g_escore)*0.9 + StrtoFloat(g_proescore)*0.1;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Eda_plan1Enter(Sender: TObject);
begin
  pnl_1.Color := clwhite;
end;


procedure TFM_Main.SpeedButton1Click(Sender: TObject);
begin
  //SpeedButton1.Down := True;
end;

procedure TFM_Main.SB_S1Click(Sender: TObject);
var  Param      : OleVariant;
     SqlText    : string;
     sSelfClass6: string;
begin
  if TOnSkinButton(Sender).tag <> 6 then
  begin
       TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Setfocus;
       if TOnEdit(Self.FindComponent('E_Aim'+IntToStr(TOnSkinButton(Sender).tag))).Text ='' then
       begin
         MessageDlg('달성실적을 먼저 입력하세요!', mtWarning, [mbOK], 0);
         System.Exit;
       end;
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
//  TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);
  if      Copy(TOnSkinButton(Sender).Name,4,1) = 'S' then
    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'A' then
    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'B' then
    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'C' then
    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC
  else if Copy(TOnSkinButton(Sender).Name,4,1) = 'D' then
    TPanel(Self.FindComponent('SelfClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;

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

  if TOnSkinButton(Sender).tag = 6 then
  begin
      if      SelfClass6.Caption = var_GrdS  then        sSelfClass6 := 'S'
      else if SelfClass6.Caption = var_GrdA  then        sSelfClass6 := 'A'
      else if SelfClass6.Caption = var_GrdB  then        sSelfClass6 := 'B'
      else if SelfClass6.Caption = var_GrdC  then        sSelfClass6 := 'C'
      else if SelfClass6.Caption = var_GrdD  then        sSelfClass6 := 'D';

      Param := VarArrayOf([replace(sSelfClass6,'''','`'),
                           replace(SelfScore6.ValueCaption,'''','`'),
                           copy(replace(ED_empno.Text,'''','`'),1,4),
                           Lrabasdate,
                           copy(replace(ED_empno.Text,'''','`'),1,4)
                          ]);

      SqlText := Format('UPDATE pehremas SET                                         '+
                        '  prorclass      = ''%s'',                                  '+
                        '  prorscore      = ''%s'',                                  '+
                        '  writeemp       = ''%s'',                                  '+
                        '  writetime      = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')   '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s''                ',
                        [Param[0],Param[1],Param[2], Param[3],Param[4]]);

      Cupd_SQL := Sqltext;
      Cupd_Exec;
  end;

  //업적평가 자기점수 합계
  Rscore;
end;

procedure TFM_Main.pnl_1Enter(Sender: TObject);
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

procedure TFM_Main.pnl_1Exit(Sender: TObject);
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

procedure TFM_Main.ED_empnoChange(Sender: TObject);
begin
     Read_pehreaim_det;
end;

procedure TFM_Main.Read_pehamas;
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

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ED_empno.PL_get_singledata;
  end;
end;

procedure TFM_Main.Read_values;   //관리직 자료 읽기
var
  SqlText : string;
begin
 with DBSet2 do
 begin
      SqlText := 'SELECT nvl(        c.itemname        ,'' '') itemname, '+
                 '       nvl(        a.imagedesc       ,'' '') imagedesc,'+
                 '       nvl(to_char(a.itemno         ),''0'') itemno,   '+
                 '       nvl(to_char(a.imageno        ),''0'') imageno,  '+
                 '       nvl(to_char(a.ekind          ),'' '') ekind,    '+
                 '       nvl(to_char(b.score          ),''0'') rscore,   '+
                 '       nvl(to_char(b.empno          ),'' '') empno,    '+
                 '       nvl(        b.rabasdate       ,'' '') rabasdate '+
                 '  FROM pehacd a, pesds b, pehac C                '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
                 ' WHERE a.rabasdate = '''+LRabasdate+'''          '+
                 '   AND a.evcno     = '+Levcno+'                  '+ // 평가표번호
                 '   AND a.ekind     = ''Values''                  '+ // 평가구분
                 '   AND a.rabasdate = c.rabasdate                 '+
                 '   AND a.evcno     = c.evcno                     '+ // 평가표번호
                 '   AND a.ekind     = c.ekind                     '+
                 '   AND a.itemno    = c.itemno                    '+
                 '   AND a.rabasdate = b.rabasdate(+)              '+
                 '   AND a.ekind     = b.ekind(+)                  '+
                 '   AND b.empno(+)  = '''+Ed_empno.empno+'''      '+ // 피평가자사번
                 '   AND a.itemno    = b.itemno(+)                 '+
//                 '   AND a.imageno   = b.imageno(+)                '+
                 '   AND a.paycl     = c.paycl                     '+ //dsa2000 2008.09.Add
                 '   AND c.paycl     = '''+Lpaycl  +'''            '+ //dsa2000 2008.09.Add
                 '   ORDER BY a.evcno,a.ekind, a.itemno, a.imageno ';
      ServiceName := 'PED1010A_sel2';
      Close;
      Sql.Text := SqlText;

      ClearFieldInfo;
      AddField('itemname'  , ftString, 1000);
      AddField('imagedesc' , ftString, 1000);
      AddField('itemno'    , ftString,   30);
      AddField('imageno'   , ftString,   30);
      AddField('ekind'     , ftString,  400);
      AddField('rscore'    , ftString,   30);
      AddField('empno'     , ftString,   30);
      AddField('rabasdate' , ftString,  400);
      Open;
 end;
end;

procedure TFM_Main.Read_com;   //관리직 자료 읽기
var
  SqlText : string;
begin
 with DBSet3 do
 begin
      SqlText := 'SELECT nvl(        c.itemname        ,'' '') itemname, '+#13+
                 '       nvl(        a.imagedesc       ,'' '') imagedesc,'+#13+
                 '       a.itemno                              itemno,   '+#13+
                 '       nvl(to_char(a.imageno        ),''0'') imageno,  '+#13+
                 '       nvl(to_char(a.ekind          ),'' '') ekind,    '+#13+
                 '       nvl(to_char(b.score          ),''0'') rscore,   '+#13+
                 '       nvl(to_char(b.empno          ),'' '') empno,    '+#13+
                 '       '' ''                               jobkindname '+#13+
                 '  FROM pehacd a, pesds b, pehac C                      '+#13+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
                 ' WHERE a.rabasdate = '''+LRabasdate+'''                '+#13+
                 '   AND a.evcno     = '+Levcno+'                        '+#13+ // 평가표번호
                 '   AND a.ekind     in (''공통역량'',''리더십역량'')    '+#13+ // 평가구분
                 '   AND a.rabasdate = c.rabasdate                       '+#13+
                 '   AND a.evcno     = c.evcno                           '+#13+ // 평가표번호
                 '   AND a.ekind     = c.ekind                           '+#13+
                 '   AND a.itemno    = c.itemno                          '+#13+
                 '   AND a.rabasdate = b.rabasdate(+)                    '+#13+
                 '   AND a.ekind     = b.ekind(+)                        '+#13+
                 '   AND b.empno(+)  = '''+Ed_empno.empno+'''            '+#13+ // 피평가자사번
                 '   AND a.itemno    = b.itemno(+)                       '+#13+
                 '   AND a.imageno   = b.imageno(+)                      '+#13+
                 '   AND a.paycl     = c.paycl                           '+#13+ //dsa2000 2008.09.Add
                 '   AND c.paycl     = '''+Lpaycl  +'''                  '+#13+ //dsa2000 2008.09.Add
                 ' Union                                                 '+#13+
                 'SELECT nvl(        c.itemname        ,'' '') itemname, '+#13+
                 '       nvl(        c.itemdesc        ,'' '') imagedesc,'+#13+
                 '       a.itemno                              itemno,   '+#13+
                 '       nvl(to_char(a.imageno        ),''0'') imageno,  '+#13+
                 '       nvl(to_char(a.ekind          ),'' '') ekind,    '+#13+
                 '       nvl(to_char(b.score          ),''0'') rscore,   '+#13+
                 '       nvl(to_char(b.empno          ),'' '') empno,    '+#13+
                 '       nvl(        a.jobkindname   ,'' '') jobkindname '+#13+
                 '  FROM peducd a, pesds b, peduc C                      '+#13+
                 ' WHERE a.rabasdate = '''+LRabasdate+'''                '+#13+
                 '   AND a.evcno     = '+Levcno+'                        '+#13+ // 평가표번호
                 '   AND a.ekind     = ''직무역량''                      '+#13+ // 평가구분
                 '   AND a.rabasdate = c.rabasdate                       '+#13+
                 '   AND a.itemno    = c.itemno                          '+#13+
                 '   AND a.rabasdate = b.rabasdate(+)                    '+#13+
                 '   AND a.ekind     = b.ekind(+)                        '+#13+
	         '   AND a.jobkind   = '''+Ljobkind+'''                  '+#13+
                 '   AND b.empno(+)  = '''+Ed_empno.empno+'''            '+#13+ // 피평가자사번
                 '   AND a.itemno    = b.itemno(+)                       '+#13+
                 '   AND a.imageno   = b.imageno(+)                      '+#13+
                 ' ORDER BY ekind, itemno, imageno            ';
      ServiceName := 'PED1010A_sel2';
      Close;
      Sql.Text := SqlText;
      edit1.Text := SqlText;

      ClearFieldInfo;
      AddField('itemname'    , ftString, 1000);
      AddField('imagedesc'   , ftString, 1000);
      AddField('itemno'      , ftString,   30);
      AddField('imageno'     , ftString,   30);
      AddField('ekind'       , ftString,  400);
      AddField('rscore'      , ftString,   30);
      AddField('empno'       , ftString,   30);
      AddField('jobkindname' , ftString,  400);
      Open;
 end;
end;

procedure TFM_Main.Read_pehreaim_det;   //관리직 자료 읽기
var
  SqlText : string;
begin
  with DBSet1 do
  begin
    SqlText := Format('SELECT B.RABASDATE,B.EMPNO,B.EMPDATE,B.PAYCLDATE,B.TRDATE,                   '+
                      '       B.JOBGUN,B.PAYCL,B.PAYRA,B.ORGNUM,                                    '+
                      '       B.DEPTCODE,H.DEPTNAME ||'' ''||H.DEPTNA3 DEPTNAME,                    '+
                      '       C.DUTYKINDNAME, A.OBJYN,E.CODENAME JOBGUNNAME,                        '+
                      '       F.CODENAME PAYCLNAME, G.CODENAME PAYRANAME,                           '+
                      '       SEQNO,PROPELTASK,MAINWEIGHT,                                          '+
                      '       DETAILTASK1,DETAILTASK2,DETAILTASK3,DETAILTASK4,DETAILTASK5,          '+
                      '       DETAILWEIGHT1,DETAILWEIGHT2,DETAILWEIGHT3,DETAILWEIGHT4,DETAILWEIGHT5,'+
                      '       VALIDX1,VALIDX2,VALIDX3,VALIDX4,VALIDX5,                              '+
                      '       VALFUNCTION1,VALFUNCTION2,VALFUNCTION3,VALFUNCTION4,VALFUNCTION5,     '+
                      '       SRESULTCLASS1,ARESULTCLASS1,BRESULTCLASS1,CRESULTCLASS1,DRESULTCLASS1,'+
                      '       SRESULTCLASS2,ARESULTCLASS2,BRESULTCLASS2,CRESULTCLASS2,DRESULTCLASS2,'+
                      '       SRESULTCLASS3,ARESULTCLASS3,BRESULTCLASS3,CRESULTCLASS3,DRESULTCLASS3,'+
                      '       SRESULTCLASS4,ARESULTCLASS4,BRESULTCLASS4,CRESULTCLASS4,DRESULTCLASS4,'+
                      '       SRESULTCLASS5,ARESULTCLASS5,BRESULTCLASS5,CRESULTCLASS5,DRESULTCLASS5,'+
                      '       E1PRJOPINON,RESULT1,RESULT2,RESULT3,RESULT4,RESULT5,NVL(A.RSCORE,0),  '+
                      '       NVL(DETAILRSCORE1,0),DETAILRCLASS1,NVL(DETAILRSCORE2,0),DETAILRCLASS2,'+
                      '       NVL(DETAILRSCORE3,0),DETAILRCLASS3,NVL(DETAILRSCORE4,0),DETAILRCLASS4,'+
                      '       NVL(DETAILRSCORE5,0),DETAILRCLASS5,NVL(DETAILESCORE1,0),DETAILECLASS1,'+
                      '       NVL(DETAILESCORE2,0),DETAILECLASS2,NVL(DETAILESCORE3,0),DETAILECLASS3,'+
                      '       NVL(DETAILESCORE4,0),DETAILECLASS4,NVL(DETAILESCORE5,0),DETAILECLASS5,'+
                      '       NVL(A.ESCORE,0)                                                       '+
                      '  FROM PEHREAIM_DET A, PEHREMAS B, PISHRDUKIND C, PISHRDUTY D, PYCCODE E,    '+
                      '       PYCCODE F, PYCCODE G, PYCDEPT H                                       '+
                      ' WHERE B.RABASDATE = ''%s''                                                  '+
                      '   AND B.EMPNO = ''%s''                                                      '+
                      '   AND B.RABASDATE = A.RABASDATE(+)                                          '+
                      '   AND B.EMPNO = A.EMPNO(+)                                                  '+
                      '   AND B.JOBKIND = C.DUTYKIND(+)                                             '+
                      '   AND B.JOBDUTY = D.DUTY(+)                                                 '+
                      '   AND B.JOBGUN = E.CODENO(+) AND E.CODEID(+)=''I115''                       '+
                      '   AND B.PAYCL = F.CODENO(+) AND F.CODEID(+)=''I112''                        '+
                      '   AND B.PAYRA =G.CODENO(+) AND G.CODEID(+)=''I113''                         '+
                      '   AND B.ORGNUM = H.ORGNUM AND B.DEPTCODE = H.DEPTCODE ',[Lrabasdate,Ed_empno.empno]);

    ServiceName := 'PED1010A_sel1';  //SVRNAME = htmax_pe13
    ClearFieldInfo;
    AddField('RABASDATE'    , ftString, 8);
    AddField('EMPNO'        , ftString, 4);
    AddField('EMPDATE'      , ftString, 8);
    AddField('PAYCLDATE'    , ftString, 8);
    AddField('TRDATE'       , ftString, 8);
    AddField('JOBGUN'       , ftString, 2);
    AddField('PAYCL'        , ftString, 3);
    AddField('PAYRA'        , ftString, 3);
    AddField('ORGNUM'       , ftString, 3);
    AddField('DEPTCODE'     , ftString, 6);
    AddField('DEPTNAME'     , ftString, 60);
    AddField('DUTYKINDNAME' , ftString, 30);
    AddField('OBJYN'        , ftString, 30);
    AddField('JOBGUNNAME'   , ftString, 20);
    AddField('PAYCLNAME'    , ftString, 20);
    AddField('PAYRANAME'    , ftString, 20);
    AddField('SEQNO'        , ftInteger, 2);
    AddField('PROPELTASK'   , ftString, 100);
    AddField('MAINWEIGHT'   , ftInteger, 3);
    AddField('DETAILTASK1'  , ftString, 100);
    AddField('DETAILTASK2'  , ftString, 100);
    AddField('DETAILTASK3'  , ftString, 100);
    AddField('DETAILTASK4'  , ftString, 100);
    AddField('DETAILTASK5'  , ftString, 100);
    AddField('DETAILWEIGHT1', ftInteger, 3);
    AddField('DETAILWEIGHT2', ftInteger, 3);
    AddField('DETAILWEIGHT3', ftInteger, 3);
    AddField('DETAILWEIGHT4', ftInteger, 3);
    AddField('DETAILWEIGHT5', ftInteger, 3);
    AddField('VALIDX1'      , ftString, 100);
    AddField('VALIDX2'      , ftString, 100);
    AddField('VALIDX3'      , ftString, 100);
    AddField('VALIDX4'      , ftString, 100);
    AddField('VALIDX5'      , ftString, 100);
    AddField('VALFUNCTION1' , ftString, 100);
    AddField('VALFUNCTION2' , ftString, 100);
    AddField('VALFUNCTION3' , ftString, 100);
    AddField('VALFUNCTION4' , ftString, 100);
    AddField('VALFUNCTION5' , ftString, 100);
    AddField('SRESULTCLASS1', ftString, 100);
    AddField('ARESULTCLASS1', ftString, 100);
    AddField('BRESULTCLASS1', ftString, 100);
    AddField('CRESULTCLASS1', ftString, 100);
    AddField('DRESULTCLASS1', ftString, 100);
    AddField('SRESULTCLASS2', ftString, 100);
    AddField('ARESULTCLASS2', ftString, 100);
    AddField('BRESULTCLASS2', ftString, 100);
    AddField('CRESULTCLASS2', ftString, 100);
    AddField('DRESULTCLASS2', ftString, 100);
    AddField('SRESULTCLASS3', ftString, 100);
    AddField('ARESULTCLASS3', ftString, 100);
    AddField('BRESULTCLASS3', ftString, 100);
    AddField('CRESULTCLASS3', ftString, 100);
    AddField('DRESULTCLASS3', ftString, 100);
    AddField('SRESULTCLASS4', ftString, 100);
    AddField('ARESULTCLASS4', ftString, 100);
    AddField('BRESULTCLASS4', ftString, 100);
    AddField('CRESULTCLASS4', ftString, 100);
    AddField('DRESULTCLASS4', ftString, 100);
    AddField('SRESULTCLASS5', ftString, 100);
    AddField('ARESULTCLASS5', ftString, 100);
    AddField('BRESULTCLASS5', ftString, 100);
    AddField('CRESULTCLASS5', ftString, 100);
    AddField('DRESULTCLASS5', ftString, 100);
    AddField('E1PRJOPINON'  , ftString, 200);
    AddField('RESULT1'      , ftString, 100);
    AddField('RESULT2'      , ftString, 100);
    AddField('RESULT3'      , ftString, 100);
    AddField('RESULT4'      , ftString, 100);
    AddField('RESULT5'      , ftString, 100);
    AddField('RSCORE'       , ftFloat,    7);
    AddField('DETAILRSCORE1', ftFloat,    7);
    AddField('DETAILRCLASS1', ftString,   1);
    AddField('DETAILRSCORE2', ftFloat,    7);
    AddField('DETAILRCLASS2', ftString,   1);
    AddField('DETAILRSCORE3', ftFloat,    7);
    AddField('DETAILRCLASS3', ftString,   1);
    AddField('DETAILRSCORE4', ftFloat,    7);
    AddField('DETAILRCLASS4', ftString,   1);
    AddField('DETAILRSCORE5', ftFloat,    7);
    AddField('DETAILRCLASS5', ftString,   1);
    AddField('DETAILESCORE1', ftFloat,    7);
    AddField('DETAILECLASS1', ftString,   1);
    AddField('DETAILESCORE2', ftFloat,    7);
    AddField('DETAILECLASS2', ftString,   1);
    AddField('DETAILESCORE3', ftFloat,    7);
    AddField('DETAILECLASS3', ftString,   1);
    AddField('DETAILESCORE4', ftFloat,    7);
    AddField('DETAILECLASS4', ftString,   1);
    AddField('DETAILESCORE5', ftFloat,    7);
    AddField('DETAILECLASS5', ftString,   1);
    AddField('ESCORE'       , ftFloat,    7);

    Close;
    SQl.Clear;
    SQL.Text := Sqltext;
     Edit1.Text := SqlText;     //Exit;

    Open;

    DBSet1.fieldbyname('OBJYN').Alignment := taCenter;

    L_e1emp.ValueCaption     := Le1empno +' - '+ Le1korname;

    if Le2empno <> '' then  L_e2emp.ValueCaption := Le2empno +' - '+ Le2korname
    else                    L_e2emp.ValueCaption := '없음';

    L_Deptname.ValueCaption  := FieldByName('DEPTNAME').AsString;
    L_Payclname.ValueCaption := FieldByName('PAYCLNAME').AsString;
    L_Payraname.ValueCaption := FieldByName('PAYRANAME').AsString;
    L_empdate.Text           := FieldByName('EMPDATE').AsString;
    L_paycldate.Text         := FieldByName('PAYCLDATE').AsString;
    //직종명
    Gdutykindname := FieldByName('DUTYKINDNAME').AsString;
    //직군명
    Gjobgunname   := FieldByName('JOBGUNNAME').AsString;
  end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
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
    if FieldByName('DETAILRSCORE1').AsString <> '0' then SelfScore1.ValueCaption := FieldByName('DETAILRSCORE1').AsString;
    if FieldByName('DETAILRSCORE2').AsString <> '0' then SelfScore2.ValueCaption := FieldByName('DETAILRSCORE2').AsString;
    if FieldByName('DETAILRSCORE3').AsString <> '0' then SelfScore3.ValueCaption := FieldByName('DETAILRSCORE3').AsString;
    if FieldByName('DETAILRSCORE4').AsString <> '0' then SelfScore4.ValueCaption := FieldByName('DETAILRSCORE4').AsString;
    if FieldByName('DETAILRSCORE5').AsString <> '0' then SelfScore5.ValueCaption := FieldByName('DETAILRSCORE5').AsString;

    if      FieldByName('DETAILRCLASS1').AsString = 'S' then SelfClass1.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS1').AsString = 'A' then SelfClass1.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS1').AsString = 'B' then SelfClass1.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS1').AsString = 'C' then SelfClass1.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS1').AsString = 'D' then SelfClass1.Caption := var_GrdD
    else                                                     SelfClass1.Caption := FieldByName('DETAILRCLASS1').AsString;

    if      FieldByName('DETAILRCLASS2').AsString = 'S' then SelfClass2.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS2').AsString = 'A' then SelfClass2.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS2').AsString = 'B' then SelfClass2.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS2').AsString = 'C' then SelfClass2.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS2').AsString = 'D' then SelfClass2.Caption := var_GrdD
    else                                                     SelfClass2.Caption := FieldByName('DETAILRCLASS2').AsString;

    if      FieldByName('DETAILRCLASS3').AsString = 'S' then SelfClass3.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS3').AsString = 'A' then SelfClass3.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS3').AsString = 'B' then SelfClass3.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS3').AsString = 'C' then SelfClass3.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS3').AsString = 'D' then SelfClass3.Caption := var_GrdD
    else                                                     SelfClass3.Caption := FieldByName('DETAILRCLASS3').AsString;

    if      FieldByName('DETAILRCLASS4').AsString = 'S' then SelfClass4.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS4').AsString = 'A' then SelfClass4.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS4').AsString = 'B' then SelfClass4.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS4').AsString = 'C' then SelfClass4.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS4').AsString = 'D' then SelfClass4.Caption := var_GrdD
    else                                                     SelfClass4.Caption := FieldByName('DETAILRCLASS4').AsString;

    if      FieldByName('DETAILRCLASS5').AsString = 'S' then SelfClass5.Caption := var_GrdS
    else if FieldByName('DETAILRCLASS5').AsString = 'A' then SelfClass5.Caption := var_GrdA
    else if FieldByName('DETAILRCLASS5').AsString = 'B' then SelfClass5.Caption := var_GrdB
    else if FieldByName('DETAILRCLASS5').AsString = 'C' then SelfClass5.Caption := var_GrdC
    else if FieldByName('DETAILRCLASS5').AsString = 'D' then SelfClass5.Caption := var_GrdD
    else                                                     SelfClass5.Caption := FieldByName('DETAILRCLASS5').AsString;


    // 하향 세부 점수
    if FieldByName('DETAILESCORE1').AsString <> '0' then DownScore1.ValueCaption := FieldByName('DETAILESCORE1').AsString;
    if FieldByName('DETAILESCORE2').AsString <> '0' then DownScore2.ValueCaption := FieldByName('DETAILESCORE2').AsString;
    if FieldByName('DETAILESCORE3').AsString <> '0' then DownScore3.ValueCaption := FieldByName('DETAILESCORE3').AsString;
    if FieldByName('DETAILESCORE4').AsString <> '0' then DownScore4.ValueCaption := FieldByName('DETAILESCORE4').AsString;
    if FieldByName('DETAILESCORE5').AsString <> '0' then DownScore5.ValueCaption := FieldByName('DETAILESCORE5').AsString;

    if  FieldByName('DETAILRCLASS1').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS1').AsString+'1')).BtnDown    := True;
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS1').AsString+'1')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILRCLASS2').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS2').AsString+'2')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS2').AsString+'2')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILRCLASS3').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS3').AsString+'3')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS3').AsString+'3')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILRCLASS4').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS4').AsString+'4')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS4').AsString+'4')).Font.Color := clWhite;
    end;
    if  FieldByName('DETAILRCLASS5').AsString <> '' then
    begin
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS5').AsString+'5')).BtnDown := True;
      TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILRCLASS5').AsString+'5')).Font.Color := clWhite;
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

procedure TFM_Main.ResetAllButton;
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1  do
  begin
    if (Components[i] is TOnSkinButton) then
    begin
      if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and
         (Components[i].Name <> 'SB_3') and (Components[i].Name <> 'SB_4') and
         (Components[i].Name <> 'SB_S6') and (Components[i].Name <> 'SB_A6') and
         (Components[i].Name <> 'SB_B6') and (Components[i].Name <> 'SB_C6')  and (Components[i].Name <> 'SB_D6') then
      begin
       (Components[i] As TOnSkinButton).BtnDown    := False;
       (Components[i] As TOnSkinButton).Font.Color := clBlack;
      end;
    end;
  end;
end;

procedure TFM_Main.E_Aim1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_4.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

  if  NoteBook1.ActivePage = 'P1' then
  begin
    L_help.Visible := true;
    L_e1emp.LabelCaption := '1차평가자';
    L_e1emp.ValueCaption     := Le1empno +' - '+ Le1korname;
    L_e2emp.LabelCaption := '2차평가자';
    if Le2empno <> '' then   L_e2emp.ValueCaption := Le2empno +' - '+ Le2korname
    else                     L_e2emp.ValueCaption := '없음';

    BT_Save.Caption := '업적평가 저장';
    if (Lrvalconyn = 'Y') then        //업적평가를 완료하면 저장버튼 비활성화
    begin
      BT_Save.Visible    := false;
      Bt_Confirm.Visible := false;
      BT_Insert.Visible  := false;
    end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
    L_e1emp.LabelCaption := '직군명';
    L_e1emp.ValueCaption := Gjobgunname;
    L_e2emp.LabelCaption := '직종명';
    L_e2emp.ValueCaption := Gdutykindname;
    L_help.Visible := false;

    BT_Save.Caption := '공통역량 저장';
    TeamForm.PageControl1Change(Sender);

    if (Lrvalconyn = 'Y') then     //업적평가를 완료하면 저장버튼 비활성화
    begin
      BT_Save.Visible    := false;
      Bt_Confirm.Visible := false;
    end;
  end
  else if NoteBook1.ActivePage = 'P4' then
  begin
    L_e1emp.LabelCaption := '1차평가자';
    L_e1emp.ValueCaption     := Le1empno +' - '+ Le1korname;
    L_e2emp.LabelCaption := '2차평가자';
    if Le2empno <> '' then   L_e2emp.ValueCaption := Le2empno +' - '+ Le2korname
    else                     L_e2emp.ValueCaption := '없음';
    L_help.Visible := false;

    BT_Save.Caption := 'Values 저장';
    ValueForm.PageControl1Change(Sender);

    if (Lrvalconyn = 'Y') then        //업적평가를 완료하면 저장버튼 비활성화
    begin
      BT_Save.Visible    := false;
      Bt_Confirm.Visible := false;
    end;
  end
  Else;
end;

//저장버튼 클릭시
procedure TFM_Main.BT_SaveClick(Sender: TObject);
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
      if trim(DBSet1.FieldByName('PROPELTASK').AsString) = '' then
      begin
         MessageDlg('업무를 등록하지 않았습니다. 업무등록 작업을 먼저하세요!',mtError, [mbOk], 0);
         Exit;
      end;

      L_S_Seqno := FloatToStr(LSeqno);

      //자기평가 점수 계산
      v_rscore  := ROUND(((StrToIntDef(SelfScore1.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT1').AsInteger/100)+
                          (StrToIntDef(SelfScore2.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT2').AsInteger/100)+
                          (StrToIntDef(SelfScore3.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT3').AsInteger/100)+
                          (StrToIntDef(SelfScore4.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT4').AsInteger/100)+
                          (StrToIntDef(SelfScore5.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT5').AsInteger/100))*10000)/10000;

      v_s_rscore := FloatToStr(v_rscore);

      if      SelfClass1.Caption = var_GrdS then        sSelfClass1 := 'S'
      else if SelfClass1.Caption = var_GrdA then        sSelfClass1 := 'A'
      else if SelfClass1.Caption = var_GrdB then        sSelfClass1 := 'B'
      else if SelfClass1.Caption = var_GrdC then        sSelfClass1 := 'C'
      else if SelfClass1.Caption = var_GrdD then        sSelfClass1 := 'D';

      if      SelfClass2.Caption = var_GrdS then        sSelfClass2 := 'S'
      else if SelfClass2.Caption = var_GrdA then        sSelfClass2 := 'A'
      else if SelfClass2.Caption = var_GrdB then        sSelfClass2 := 'B'
      else if SelfClass2.Caption = var_GrdC then        sSelfClass2 := 'C'
      else if SelfClass2.Caption = var_GrdD then        sSelfClass2 := 'D';

      if      SelfClass3.Caption = var_GrdS then        sSelfClass3 := 'S'
      else if SelfClass3.Caption = var_GrdA then        sSelfClass3 := 'A'
      else if SelfClass3.Caption = var_GrdB then        sSelfClass3 := 'B'
      else if SelfClass3.Caption = var_GrdC then        sSelfClass3 := 'C'
      else if SelfClass3.Caption = var_GrdD then        sSelfClass3 := 'D';

      if      SelfClass4.Caption = var_GrdS then        sSelfClass4 := 'S'
      else if SelfClass4.Caption = var_GrdA then        sSelfClass4 := 'A'
      else if SelfClass4.Caption = var_GrdB then        sSelfClass4 := 'B'
      else if SelfClass4.Caption = var_GrdC then        sSelfClass4 := 'C'
      else if SelfClass4.Caption = var_GrdD then        sSelfClass4 := 'D';

      if      SelfClass5.Caption = var_GrdS then        sSelfClass5 := 'S'
      else if SelfClass5.Caption = var_GrdA then        sSelfClass5 := 'A'
      else if SelfClass5.Caption = var_GrdB then        sSelfClass5 := 'B'
      else if SelfClass5.Caption = var_GrdC then        sSelfClass5 := 'C'
      else if SelfClass5.Caption = var_GrdD then        sSelfClass5 := 'D';

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
     TeamForm.DataSave(TeamForm.BB_save);
   end
   else if NoteBook1.ActivePage = 'P4' then
   begin
     ValueForm.DataSave(ValueForm.BB_save);
   end;
end;

procedure TFM_Main.Cupd_Exec;
begin
  Cupd_ret := False;
  with TMaxDML_HInsa do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    SQL.Text := Cupd_SQL;
    if Execute then Cupd_ret := True;
  end;
end;

//최종완료
procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SqlText   : string;
  A         : Integer;
  PE_Down1, PE_Down2, PE_Down3, PE_Down4 : Boolean;
  ParamVariant  : string;

     function GetComp(ekind:String) : Integer;
     var
       ParamVariant : String;
     begin
       if (ekind ='Values') then
         ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)      ' +
                         '    || '';'' || Count(Decode(nvl(B.score,0), 0, 1))    ' +
                         '  FROM pehac A, pesds B                                ' +
                         ' WHERE A.rabasdate = '''+Lrabasdate+'''                ' +
                         '   AND A.ekind     = ''' +ekind + '''                  ' +
                         '   AND a.evcno = (select evcno from pehamas where      ' +
                         '                  rabasdate = '''+Lrabasdate+'''       ' +
                         '                  and empno = '''+GSempno+''')         ' +
                         '   AND b.empno(+)  = '''+GSempno+'''                   ' + // 평가자사번
                         '   AND A.rabasdate = B.rabasdate(+)                    ' +
                         '   AND A.ekind     = B.ekind(+)                        ' +
                         '   AND A.itemno    = B.itemno(+)                       ' 
       else if (ekind ='공통역량') or (ekind ='리더십역량') then
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
                         '   AND a.evcno = (select evcno from pehamas where      ' +
                         '                  rabasdate = '''+Lrabasdate+'''       ' +
                         '                  and empno = '''+GSempno+''')         ' +
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
         if      var_Ekind = 'Values' then
           ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                           'SET (valconyn, valtotscr, writeemp, writetime) = '
         else if var_Ekind = '공통역량' then
           ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                           'SET (abconyn, abtotscr, writeemp, writetime) = '
         else if var_Ekind = '리더십역량' then
           ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                           'SET (beconyn, betotscr, writeemp, writetime) = '
         else if var_Ekind = '직무역량' then
           ParamVariant := 'UPDATE pesms ' + // 역량상향종합
                           'SET (duconyn, dutotscr, writeemp, writetime) = ';

         ParamVariant := ParamVariant +
                         '      (SELECT ''Y'', SUM(nvl(score,0))/COUNT(nvl(score,0)),              '+
                         '              '''+GSempno+''', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')    '+
                         '         From                                                            '+
                         '             (SELECT itemno, SUM(nvl(score,0))/COUNT(nvl(score,0)) score '+
                         '                FROM pesds                                               '+ // 역량자기평가
                         '               WHERE rabasdate = '''+Lrabasdate+'''                      '+
                         '                 AND ekind     = '''+var_Ekind+'''                       '+ // 평가구분
                         '                 AND empno     = '''+GSempno+'''                         '+
                         '               GROUP BY itemno                   ))                      '+
                         'WHERE rabasdate = '''+Lrabasdate+'''                                     '+
                         '  AND empno    = '''+GSempno+'''                                         '; // 평가자(접속자사번)

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
  ParamVariant := 'SELECT sum(mainweight)                '+
                  '  FROM pehreaim_det                   '+
                  ' WHERE rabasdate = '''+Lrabasdate+''' '+
                  '   AND empno     = '''+GSempno   +''' ';

  Csel_SQL := ParamVariant;
  Csel_Open;

  if SB_1.Visible = True then
  begin
    if Csel_gfd(1) <> '100' then
    begin
      MessageDlg('개별목표평가 비중의 합이 100이 아닙니다!',mtError, [mbOk], 0);
      Exit;
    end;
  end;

  if (SB_1.Visible = True) then
  begin
    if (trim(DBSet1.FieldByName('PROPELTASK').AsString) = '') then
    begin
      MessageDlg('업무를 등록하지 않았습니다. 업무등록 작업을 먼저하세요!',mtError, [mbOk], 0);
      Exit;
    end;

    if not FL_CheckNullEval then
    begin
      MessageDlg('업적평가에 평가하지 않은 항목이 있습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      System.Exit;
    end;

    if (trim(SelfClass6.Caption) = '') or (trim(SelfClass6.Caption) = '0') then
    begin
      MessageDlg('과정지표를 평가하지 않았습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      SB_1Click(SB_1);
      System.Exit;
    end;
  end;

  //////////////////////////////////////////////////////////////////////////////
  // 최종완료여부
  if (SB_2.Visible = True) or (SB_4.Visible = True) then
  begin
       if ValueForm.IsDataModified1 then
       begin
            MessageBox(handle,'Values 평가의 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
            if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
            System.Exit;
       end;

      SB_1Click(SB_2);
       if TeamForm.IsDataModified then
       begin
            MessageBox(handle,'역량평가의 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
            if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
            System.Exit;
       end;

       ParamVariant := 'SELECT                                           '+
                       ' nvl(        abconyn         ,'' '') || '';'' || '+ //공통
                       ' nvl(        beconyn         ,'' '') || '';'' || '+ //리더십
                       ' nvl(        duconyn         ,'' '') || '';'' || '+ //직무
                       ' nvl(        valconyn        ,'' '')             '+ //Values
                       'FROM pesms                                       '+ // 능력태도상향종합
                       'WHERE rabasdate = '''+Lrabasdate+'''             '+
                       '  AND empno     = '''+GSempno+''' '               ; // 평가자

       Csel_SQL := ParamVariant;
       Csel_Open;

       if (Csel_gfd(1) = 'Y') then  PE_Down1 := True
       else                         PE_Down1 := False;

       if (Csel_gfd(2) = 'Y') then  PE_Down2 := True
       else                         PE_Down2 := False;

       if (Csel_gfd(3) = 'Y') then  PE_Down3 := True
       else                         PE_Down3 := False;

       if (Csel_gfd(4) = 'Y') then  PE_Down4 := True
       else                         PE_Down4 := False;

       if (PE_Down1 = false) or (PE_Down2 = false) or (PE_Down3 = false) or (PE_Down4 = false) then
       begin
            if (PE_Down4 = false) and (Levcno[1] in (['1','2','3'])) then
            begin
                 A := GetComp('Values');
                 if      A = -1 then Exit
                 else if A >  0 then
                 begin
                      if start = true then
                        MessageDlg('Values 평가에 아직 입력되지 않은 항목이 있습니다.'#13#13+
                                   '화면 왼쪽 상단에 ''Values 평가''를 선택해서 평가를 완료해 주시기 바랍니다.',mtError,[mbOK],0)
                      else
                        MessageBox(handle,Pchar('Values 평가에 아직 입력되지 않은 항목이 있습니다.'#13#13+
                                                '화면 왼쪽 상단에 ''Values 평가''를 선택해서 평가를 완료해 주시기 바랍니다.'),
                                                '작업순서오류',MB_ICONWARNING);
                      if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'NO';
                      Exit;
                 end;
            end;

            if (PE_Down1 = false) and (Levcno[1] in (['1','2','3'])) then
            begin
                 A := GetComp('공통역량');
                 if      A = -1 then Exit
                 else if A >  0 then
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

            if (PE_Down2 = false) and (Levcno[1] in (['2','3'])) then
            begin
                 A := GetComp('리더십역량');
                 if      A = -1 then Exit
                 else if A >  0 then
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
                 if      A = -1 then Exit
                 else if A >  0 then
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
  end;

  if Not FL_CheckNullMERIT then Exit;

  if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                             '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+

                             '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
    if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
    system.Exit;
  end;

  //업적평가 자기점수 합계
  Rscore;

  //피평가자 평가완료 여부 'Y'로 update
  SqlText := 'update pehremas                                                         '+
             '   set rvalconyn  = ''Y'',                                              '+
             '       rscore     = '''+OnNumberEdit1.Text+''',                         '+
             '       rvalcondate= SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
             '       e1valobjyn = ''N'',                                              '+
             '       e2valobjyn = ''N''                                               '+
             ' WHERE rabasdate  = '''+Lrabasdate+'''                                  '+
             '   AND empno      = '''+GSempno+'''                                     ';

  Cupd_SQL := Sqltext;
  Cupd_Exec;

  if (SB_4.Visible = True) then
  begin
    if Temp_Update('Values'  )   = false then  Exit;
  end;

  if (SB_2.Visible = True) then
  begin
    if Temp_Update('공통역량')   = false then  Exit;
    if Temp_Update('리더십역량') = false then  Exit;
    if Temp_Update('직무역량')   = false then  Exit;
  end;

  Bt_Confirm.Visible     := false;
  BT_Save.Visible        := false;
  BT_Insert.Visible      := false;

  MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
  Lrvalconyn := 'Y';
  BT_Exit.SetFocus;
end;

function TFM_Main.FL_CheckNullEval:Boolean; // 하나라도 평가안한 항목이 있는지를 체크
begin
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

function TFM_Main.FL_CheckNullMERIT:Boolean; // 장단점 미입력 항목이 있는지 여부 체크
var Msg : String;
begin
  Result := False;
  with DBcommon do
  begin
       SQL.Clear;
       if Levcno = '1' then //비보임차부장만 리더십 확인.
       Begin
         SQL.Text := format(' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values 평가(장점)'',  '+
                            '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values 평가(단점)'',  '+
                            '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',     '+
                            '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',     '+
                            '        (DECODE(REPLACE(MERIT_ERY, '' ''), NULL, ''리더십역량(장점)'',   '+
                            '        (DECODE(REPLACE(MERIT_ERN, '' ''), NULL, ''리더십역량(단점)'',   '+
                            '        (DECODE(REPLACE(MERIT_EAY, '' ''), NULL, ''직무역량(장점)'',     '+
                            '        (DECODE(REPLACE(MERIT_EAN, '' ''), NULL, ''직무역량(단점)'', ''0''))))))))))))))) SEL_DATA '+
                            ' from PEHREMER '+
                            ' WHERE  empno    =''%s'' '+
                            '   and rabasdate =''%s'' ',[ED_empno.empno, Lrabasdate]);
       End
       Else
       Begin
         SQL.Text := format(' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values 평가(장점)'',  '+
                            '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values 평가(단점)'',  '+
                            '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',     '+
                            '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',     '+
                            '        (DECODE(REPLACE(MERIT_EAY, '' ''), NULL, ''직무역량(장점)'',     '+
                            '        (DECODE(REPLACE(MERIT_EAN, '' ''), NULL, ''직무역량(단점)'', ''0''))))))))))) SEL_DATA '+
                            ' from PEHREMER '+
                            ' WHERE  empno    =''%s'' '+
                            '   and rabasdate =''%s'' ',[ED_empno.empno, Lrabasdate]);
       End;

       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 100);

       Open;

       Msg := FieldByName('SEL_DATA').AsString;

       if Msg =  '0' then Result := True
       Else
       Begin
         MessageDlg(Msg + '을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);

         If (Copy(Msg,1,6) = 'Values') Then ValueForm.Show
         Else                               TeamForm.Show;

         Result := False;
       End;
  end;
end;

procedure TFM_Main.Notebook1PageChanged(Sender: TObject);
begin
  if NoteBook1.ActivePage = 'P2' then
  begin
     try
       TeamForm := TTeamForm.Create(nil); // 역량평가
       TeamForm.Parent      := Notebook1;
       TeamForm.WindowState := wsMaximized;
       TeamForm.Show;
     except
       begin
           if (TeamForm <> nil) or Assigned(TeamForm) then
           begin
             TeamForm.Free;
             TeamForm := nil;
           end;
       end;
     end;
  end
  else
  if NoteBook1.ActivePage = 'P4' then
  begin
     try
       ValueForm := TValueForm.Create(nil); // 역량평가
       ValueForm.Parent      := Notebook1;
       ValueForm.WindowState := wsMaximized;
       ValueForm.Show;
     except
       begin
           if (ValueForm <> nil) or Assigned(ValueForm) then
           begin
             ValueForm.Free;
             ValueForm := nil;
           end;
       end;
     end;
  end;
end;

//이의 신청등록
procedure TFM_Main.Bt_AddClick(Sender: TObject);
begin
  try
    Form1 := TForm1.Create(nil); // 역량평가
    //Form1.WindowState := wsMaximized;
    Form1.ShowModal;
    Read_pehreaim_det;
  except
    begin
      if (Form1 <> nil) or Assigned(Form1) then
        begin
          Form1.Free;
          Form1 := nil;
        end;
    end;
   end;
end;

// 이의 신청 완료
procedure TFM_Main.Bt_OConfirmClick(Sender: TObject);
var
  curdate,v_cnt : string;
  sWhereSql, snotobj, sUpdateSql : string;

  function IsNullField(sw:integer):Boolean;
  var
    SqlStr : string;
  begin
    Result := False;

    if sw = 1 then
    begin
      SqlStr := format('select count(seqno) cnt from pehreaim_det '+
                       ' where %s ',            [sWhereSql]);
    end else
    begin
      SqlStr := format('select count(seqno) cnt from pehreaim_det '+
                       ' where %s ',             [sNotobj]);
    end;
    
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
      if v_cnt = '0' then
        Result := False
      else
        Result := True;
    end;
  end;

begin

  if IDNO = Messagebox(handle,pchar('완료하시면 더이상 평가 Petition 하실 수 없습니다.'+#13+#13+
                      '계속하시겠습니까?'),'확인',MB_YESNO or $0030) then
            system.exit;

  curdate := copy(Lrabasdate,1,8);

  sWhereSql := format(' rabasdate=''%s'' and empno=''%s'' and '+
                      ' objyn=''Y'' and objsayu is  null ',
                      [Lrabasdate,Ed_empno.empno]);

  snotobj   := Format(' rabasdate = ''%s'' and empno = ''%s'' and '+
                      ' objyn = ''Y'' ',
                      [Lrabasdate,Ed_empno.empno]);

  if IsNullField(1) then
    begin
      Messagedlg('평가 Petition 사유를 입력하십시오',mtError,[mbOK],0);
      exit;
    end;

  if not IsNullField(2) then
    begin
     Messagedlg('평가 Petition 후  완료하시기 바랍니다.',mtError,[mbOK],0);
     exit;
    end;

  //메일 보내기 시작
  Messagedlg('평가자 및 '+Mdeptname+'에 평가 Petition  메일을 발송합니다.',mtinformation,[mbOK],0);

  //1차 평가자
  //==============================================================================//
  // 메일을 보낸다.
  MessageDlg('상위부서장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
  SendProgID  := 'PET1010A';  //프로그램 ID
  SendEmpno   := GSempno;      //발송자(로그인 사번)
  RcveEmpno   := Le1empno;
  MailSubject := '평가 Petition ';
  MailBody    := '피평가자 ['+ GSkorname +']이/가 평가 결과에 대해 평가 Petition 하였습니다. '+#13#13+
                 '['+ GSkorname +']구성원에 대한 평가소견(평가사유 또는 근거)을 등록하여 주시기 바랍니다. '+#13#13+
                 '[종합인사정보시스템] ▶ [평가] ▶ [팀장 상사(하향)평가] ▶ 평가 평가소견 등록';
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


  sUpdateSql := format('update pehremas set rvalobjyn=''Y'', rvalobjdate=''%s'' '+
                       ' where rabasdate=''%s'' and empno=''%s'' ',
                       [curdate,Lrabasdate,Ed_empno.empno]);

  Cupd_SQL := sUpdateSql;
  Cupd_Exec;

  {
  Bt_Add.Enabled := false;
  Bt_OConfirm.Enabled := false;
  }
  Bt_Add.Visible := false;
  Bt_OConfirm.Visible := false;
  MessageDlg('[평가 Petition 완료]가 정상처리 되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

procedure TFM_Main.BT_InsertClick(Sender: TObject);
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
   if regtry.OpenKey(ObjName,False) then regtry.Writestring( 'KillProcess', '');
   regtry.CloseKey();
   regtry.Free;


   //일반목표등록
   // dsa2000  Program Down 또는 Call 하여 실행하기.
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
   FM_DownLoad.PL_VersionCHK3(3, 'PEA1060A');  //Call하는 단위 프로그램의 버젼을 체크..
   if (not FM_DownLoad.FL_VersionCHK ) or
      (not FileExists(GSHomeDir+'\Bin\3tier\PEA1060A.EXE')) then
   begin
      FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060A.EXE','PEA1060A',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
   end
   else
   begin
      FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';

      LSfilename := GSHomeDir+'\Bin\3Tier\PEA1060A.EXE ,'
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
      FM_Main.FormPaint(Sender);
   end;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
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

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  Read_pehreaim_det;
  Read_values;
  Read_Com;
  PrintForm := TPrintForm.Create(Self);
  PrintForm.PeQuickRepPrn1.Preview;
end;

procedure TFM_Main.BT_ChangeClick(Sender: TObject);
begin
  InitSetup;
end;

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
begin
  Read_pehreaim_det;
  Read_values;
  Read_Com;
  PrintForm := TPrintForm.Create(Self);
  PrintForm.PeQuickRepPrn1.Print;
end;

function TFM_Main.Csel_gfd(p_loc: Integer): String;
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

procedure TFM_Main.Csel_Open;
begin
  Csel_ret := False;
  with DBcommon do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
  if RecordCount > 0 then Csel_ret := True;
  end;
end;

end.
