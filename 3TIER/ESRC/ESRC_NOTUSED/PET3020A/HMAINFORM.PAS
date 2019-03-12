unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon, kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, peoutlookbtn, OnEditMemo, OnRadioBtn;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    L_jobgun: TOnShapeLabel;
    L_jobkind: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    DBSet1: TTMaxDataSet;
    DataSource1: TDataSource;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
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
    DownScr1: TOnShapeLabel;
    L_DetailTask1: TOnShapeLabel;
    L_detailweight1: TOnShapeLabel;
    L_validx1: TOnShapeLabel;
    L_bresultclass1: TOnShapeLabel;
    L_valfunction1: TOnShapeLabel;
    SelfScr1: TOnShapeLabel;
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
    L_rscore: TOnNumberEdit;
    L_escore: TOnNumberEdit;
    pnl_2: TPanel;
    SB_S2: TOnSkinButton;
    SB_A2: TOnSkinButton;
    SB_B2: TOnSkinButton;
    SB_C2: TOnSkinButton;
    SB_D2: TOnSkinButton;
    DownScr2: TOnShapeLabel;
    L_valfunction2: TOnShapeLabel;
    L_bresultclass2: TOnShapeLabel;
    L_validx2: TOnShapeLabel;
    L_detailweight2: TOnShapeLabel;
    L_DetailTask2: TOnShapeLabel;
    SelfScr2: TOnShapeLabel;
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
    DownScr3: TOnShapeLabel;
    L_valfunction3: TOnShapeLabel;
    L_bresultclass3: TOnShapeLabel;
    L_validx3: TOnShapeLabel;
    L_detailweight3: TOnShapeLabel;
    L_DetailTask3: TOnShapeLabel;
    SelfScr3: TOnShapeLabel;
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
    DownScr4: TOnShapeLabel;
    L_valfunction4: TOnShapeLabel;
    L_bresultclass4: TOnShapeLabel;
    L_validx4: TOnShapeLabel;
    L_detailweight4: TOnShapeLabel;
    L_DetailTask4: TOnShapeLabel;
    SelfScr4: TOnShapeLabel;
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
    DownScr5: TOnShapeLabel;
    L_valfunction5: TOnShapeLabel;
    L_bresultclass5: TOnShapeLabel;
    L_validx5: TOnShapeLabel;
    L_detailweight5: TOnShapeLabel;
    L_DetailTask5: TOnShapeLabel;
    SelfScr5: TOnShapeLabel;
    pnl_no5: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    E_Aim5: TOnEdit;
    SelfClass5: TPanel;
    DownClass5: TPanel;
    DBSet_dml: TTMaxDataSet;
    BT_Exit: TOnFocusButton;
    DBG_user: TOnGrDbGrid;
    BT_OBJECT: TOnFocusButton;
    TMaxDataSet_HInsa: TTMaxDataSet;
    P_Abil: TPanel;
    BT_Save: TOnFocusButton;
    BT_Confirm: TOnFocusButton;
    E_Ratio: TOnEdit;
    BT_OK: TOnFocusButton;
    DBcommon: TTMaxDataSet;
    P_Value: TPanel;
    P_CoWorker: TPanel;
    P_Opinion: TPanel;
    Memo_E1: TOnMemo;
    MERIT_JRY: TOnMemo;
    MERIT_JAY: TOnMemo;
    MERIT_JCY: TOnMemo;
    OnMemo8: TOnMemo;
    BT_Opinon: TOnFocusButton;
    BT_SelfOpen: TOnFocusButton;
    SB_3: TOnSkinButton;
    MERIT_JVY: TOnMemo;
    pnl_6: TPanel;
    SB_S6: TOnSkinButton;
    SB_A6: TOnSkinButton;
    SB_B6: TOnSkinButton;
    SB_C6: TOnSkinButton;
    SB_D6: TOnSkinButton;
    E_TaskAdd1: TOnShapeLabel;
    Label8: TLabel;
    SelfScr6: TOnShapeLabel;
    DownScr6: TOnShapeLabel;
    E_TaskAdd2: TOnEdit;
    SelfClass6: TPanel;
    DownClass6: TPanel;
    Panel28: TPanel;
    BT_Help: TOnFocusButton;
    MERIT_JVN: TOnMemo;
    MERIT_JCN: TOnMemo;
    MERIT_JAN: TOnMemo;
    MERIT_JRN: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo6: TOnMemo;
    L_Msg: TLabel;
    E_E1PERVIEW: TOnMemo;
    Bt_OConfirm: TOnFocusButton;
    Bt_Add: TOnFocusButton;
    BT_E1PERVIEW: TOnFocusButton;
    Memo_E2: TOnMemo;
    BT_Print: TOnFocusButton;
    On_MERIT_JVN: TOnMemo;
    On_MERIT_JVY: TOnMemo;
    OnMemo3: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo7: TOnMemo;
    On_MERIT_JCN: TOnMemo;
    On_MERIT_JCY: TOnMemo;
    On_MERIT_JRY: TOnMemo;
    On_MERIT_JRN: TOnMemo;
    On_MERIT_JAN: TOnMemo;
    On_MERIT_JAY: TOnMemo;
    BT_E2Opinon: TOnFocusButton;
    On_Memo2: TOnMemo;
    Shape32: TShape;
    Label72: TLabel;
    BT_OPSave: TOnFocusButton;
    Print: TOnFocusButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
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
    procedure BT_ConfirmClick(Sender: TObject);
    procedure BT_OBJECTClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_OConfirmClick(Sender: TObject);
    procedure BT_OKClick(Sender: TObject);
    procedure BT_VIEWCloseClick(Sender: TObject);
    procedure BT_OpinonClick(Sender: TObject);
    procedure Memo_E1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MERIT_JCYKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MERIT_JRYKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MERIT_JAYKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo_E1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo_E2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MERIT_JVYKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_HelpClick(Sender: TObject);
    procedure BT_E1PERVIEWClick(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_SelfOpenClick(Sender: TObject);
    procedure BT_E2OpinonClick(Sender: TObject);
    procedure On_Memo2Click(Sender: TObject);
    procedure On_Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintClick(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    procedure PL_Read_pehreaim_det; //목표 Select
    procedure PL_SaveScrData;       //데이터 저장
    procedure PL_SetControls;
    function  FL_CheckNullEval:Boolean;     //평가하지 않은 항목이 있는지 여부 체크
    function  FL_CheckNullMERIT:Boolean;    //평가의견 열람 미입력 항목이 있는지 여부 체크
    procedure Read_E1SumSCR;
    function  GetComp(ekind:String) : Integer;

  public
    { Public declarations }
    var_Ekind, C_OBJYN: String;   // 역량종류
    Pjobkind : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    toMailKorname, toMailEmpno, Msg, v_evcno : string;
    v_e1opinionyn : String;
    v_e2opinionyn : String;

    g_rscore,    g_escore    : string;
    g_prorscore, g_proescore : string;
    g_prorclass, g_proeclass : string;

    procedure PL_ResetAllButton;    //버튼 All Clear
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  end;

var
  FM_Main: TFM_Main;
  DetailCnt : Integer;
  Csel_SQL : String;
  E1ValconYN, E2ValconYN : String;
  Le1korname, Le1empno : String;

const
  SScore = '100';
  AScore = '90';
  BScore = '80';
  CScore = '70';
  DScore = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';
implementation

uses HSubForm, UDown_Sub1, UDown_Sub2, Hinsa_TmaxDM, UOpinon,
     UDown_Value1,  UDown_Value2, UPrintForm, UPrintForm1, UPrintForm2;

{$R *.DFM}


procedure TFM_Main.FormShow(Sender: TObject);
var
  SqlText : string;
  i       : integer;
  v_pgroupratio : string;
begin
  BT_Help.Visible    := False;
  gS_final_comp := 'T';

  Application.ProcessMessages;
  FL_Start := False;
  SF_Main.Refresh;

  if FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString ='비대상' then  //역량자기
  begin
       SB_2.Visible    := False;
       if Lwork ='1차' then
       begin
            MessageDlg('업적 평가를 진행합니다.'
                      +#13+#10+''+#13+#10+ '팀장평가는 [팀장 상사평가] 프로그램에서 하십시오.'
                      +#13+#10+''+#13+#10+'[업적평가]만 완료 후 [최종완료] 부탁드립니다.', mtWarning, [mbOK], 0);
            BT_Confirm.Visible := True;
       end
       else
       begin
            MessageDlg('업적 평가를 진행합니다.'
                       +#13+#10+''+#13+#10+ '팀장평가는 [팀장 상사평가] 프로그램에서 하십시오.'
                       +#13+#10+''+#13+#10+'[업적평가]만 승인/완료 부탁드립니다.', mtWarning, [mbOK], 0);
            BT_Confirm.Visible := False;
       end;
  end
  else if FM_Sub.DBSet_Sub.FieldByName('SELF').AsString ='비대상' then  //업적자기 하은영 2006.11.28
  begin
       SB_1.Visible    := False;
       MessageDlg('[업적평가] 비대상자입니다.'
                  +#13+#10+''+#13+#10+'[Values 평가]와 [역량평가]만 완료 후 [최종완료] 부탁드립니다.', mtWarning, [mbOK], 0);
       BT_Confirm.Visible := True;
  end
  else
  begin
       SB_2.Visible       :=True;
       BT_Confirm.Visible :=True; //업적평가 화면에서 '최종완료'버튼 보이게 False->True...JSH
  end;

  SqlText := 'select e1opinionyn ||'';''|| e2opinionyn ||'';''|| pgroupratio '+
             '  from pehremas                           '+
             ' where rabasdate = '''+sRabasDate+'''     '+
             '   and empno     = '''+FM_Sub.DBSet_Sub.FieldByName('EMPNO').AsString+''' ';
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  v_e1opinionyn   := DataModule_Tmax.Csel_gfd(1);
  v_e2opinionyn   := DataModule_Tmax.Csel_gfd(2);
  v_pgroupratio   := DataModule_Tmax.Csel_gfd(3);

  E_Ratio.text:= '상위 '+v_pgroupratio+'% 이내';

//  SB_1.BtnDown         := True;
  if (Lwork = '1차') then
  begin
       BT_OK.Visible       := False;
       BT_OBJECT.Visible   := False;
       BT_E2Opinon.Visible := False;

       if ((FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료')) then
       begin
            E1ValconYN := FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString;

            if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString <> '신청') then //평가 Petition 사원은 완료여부 메세지 안띄우도록.
                MessageDlg('이미 [최종완료] 하신 구성원입니다.'+#13+#10+''+#13+#10+'<자료확인 및 출력>만 가능하십니다.  '+#13+#10+'', mtWarning, [mbOK], 0);

            BT_Confirm.Visible := False;
            BT_Save.Visible    := False;
            BT_OBJECT.Visible  := False;
            BT_Opinon.Caption  := '1차평가 의견열람';


            if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청') then
            begin
                 BT_Help.Visible    := True;
                 BT_Confirm.Visible := False;
                 BT_Save.Visible    := False;
                 BT_OBJECT.Visible  := False;
                 BT_Opinon.Caption  := '1차평가 의견열람';

                 if  ( (Lwork = '1차') and (v_e1opinionyn = 'Y') ) or
                     ( (Lwork = '2차') and (v_e2opinionyn = 'Y') ) then   //평가소견 완료 여부
                      MessageDlg('평가소견등록을 완료한 자료입니다.',mtInformation,[mbOK],0)
                 else MessageDlg('피평가자가 평가 Petition을 하였습니다.'+#13+#10+''+#13+#10+'평가 Petition한 평가항목별로 평가근거를 등록하세요. '+#13+#10+'', mtWarning, [mbOK], 0);

            end;
       end
       else if (FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='미완료') then
       begin
            E1ValconYN := '';
            Bt_Add.Visible      := false;
            Bt_OConfirm.Visible := false;
       end;
  end;
  if (Lwork = '2차') then
  begin
       BT_E2Opinon.Visible := True;
       if FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료' then
       begin
            BT_Opinon.Caption := '1차평가 의견열람';
            On_Memo2.ReadOnly := True;
            BT_OPSave.Visible := false;
       end;

       if (FM_Sub.DBSet_Sub.FieldByName('DOWN2').AsString ='완료') then
       begin
            E2ValconYN := FM_Sub.DBSet_Sub.FieldByName('DOWN2').AsString;

            if (FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료') then
                MessageDlg('이미 [최종완료] 하신 구성원입니다.'+#13+#10+''+#13+#10+'<자료확인 및 출력>만 가능하십니다.  '+#13+#10+'', mtWarning, [mbOK], 0);

            BT_Confirm.Visible := False;
            BT_Save.Visible    := False;
            BT_OK.Visible      := False;
            BT_OBJECT.Visible  := False;

            if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청') then
            begin
                 BT_Help.Visible    := False;
                 if  (v_e2opinionyn = 'Y') then   //평가소견 완료 여부
                      MessageDlg('평가소견등록을 완료한 자료입니다.',mtInformation,[mbOK],0)
                 else MessageDlg('피평가자가 평가 Petition을 하였습니다.'+#13+#10+''+#13+#10+'평가 Petition한 평가항목별로 평가근거를 등록하세요. '+#13+#10+'', mtWarning, [mbOK], 0);
            end;
       end
       else
       begin //2006.10.19 하은영 수정
            E2ValconYN := '';
            messagedlg('2차평가자는'+#13 +#13 +
                 '[업적평가]에 대한 조정,승인자로서 점수 입력이 없이 승인/반려하시면 되고.'+#13 +#13 +
                 '[Values 평가]와 [역량평가]에 대한 조회만 가능합니다.. ', mtinformation, [mbOK], 0);
       end;
       SqlText := 'select e1empno|| '';'' ||e1korname from pehremas where rabasdate ='''+sRabasDate+''' and empno ='''+FM_Sub.DBSet_Sub.FieldByName('EMPNO').AsString+'''';
       DataModule_Tmax.Csel_SQL := SqlText;
       DataModule_Tmax.Csel_Open;
       Le1empno   := DataModule_Tmax.Csel_gfd(1);
       Le1korname := DataModule_Tmax.Csel_gfd(2);
  end;
  PL_SetControls;
  NoteBook1.ActivePage := 'P3';
  SB_1Click(SB_3);
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  if MessageBox(handle,PChar(Ed_empno.Text+' '+L_payraname.valuecaption+'의 평가작업을 종료하시겠습니까?'+#13+#13
                             ), '확 인', MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
    Self.Close;
    DBSet1.Close;
    FM_Sub.GridData;
    FM_Sub.Visible := True;
    System.exit;
  end;
end;

procedure TFM_Main.SB_S1Click(Sender: TObject);
var  Param      : OleVariant;
     SqlText    : string;
     sDownClass6: string;
begin
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
  TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := Copy(TOnSkinButton(Sender).Name,4,1);

  if Copy(TOnSkinButton(Sender).Name,4,1) ='S' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScr'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := SScore;              
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdS;                      
  end                                                                                                                        
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='A' then                                                                     
  begin                                                                                                                      
       TOnShapeLabel(Self.FindComponent('DownScr'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := AScore;
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdA;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='B' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScr'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := BScore;
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdB;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='C' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScr'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := CScore;
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdC;
  end
  else if Copy(TOnSkinButton(Sender).Name,4,1) ='D' then
  begin
       TOnShapeLabel(Self.FindComponent('DownScr'+IntToStr(TOnSkinButton(Sender).tag))).ValueCaption := DScore;
       TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := var_GrdD;
  end
  else TPanel(Self.FindComponent('DownClass'+IntToStr(TOnSkinButton(Sender).tag))).Caption := '';

  if TOnSkinButton(Sender).tag = 6 then
  begin
      if      DownClass6.Caption = var_GrdS  then        sDownClass6 := 'S'
      else if DownClass6.Caption = var_GrdA  then        sDownClass6 := 'A'
      else if DownClass6.Caption = var_GrdB  then        sDownClass6 := 'B'
      else if DownClass6.Caption = var_GrdC  then        sDownClass6 := 'C'
      else if DownClass6.Caption = var_GrdD  then        sDownClass6 := 'D';

      Param := VarArrayOf([replace(sDownClass6,'''','`'),
                           replace(DownScr6.ValueCaption,'''','`'),
                           copy(replace(ED_empno.Text,'''','`'),1,4),
                           sRabasDate,
                           Ed_empno.empno
                          ]);

      SqlText := Format('UPDATE pehremas SET                                         '+
                        '  proeclass      = ''%s'',                                  '+
                        '  proescore      = ''%s'',                                  '+
                        '  writeemp       = ''%s'',                                  '+
                        '  writetime      = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'')   '+
                        ' WHERE rabasdate = ''%s'' AND empno = ''%s''                ',
                        [Param[0],Param[1],Param[2], Param[3],Param[4]]);

      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
  end;

  //업적평가 자기점수 합계
  Read_E1SumSCR;
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
  SelfClass1.Color := $00CDCDCD;
  SelfClass2.Color := $00CDCDCD;
  SelfClass3.Color := $00CDCDCD;
  SelfClass4.Color := $00CDCDCD;
  SelfClass5.Color := $00CDCDCD;
  SelfScr1.Brush.Color := $00CDCDCD;
  SelfScr2.Brush.Color := $00CDCDCD;
  SelfScr3.Brush.Color := $00CDCDCD;
  SelfScr4.Brush.Color := $00CDCDCD;
  SelfScr5.Brush.Color := $00CDCDCD;
end;

procedure TFM_Main.ED_empnoChange(Sender: TObject);
begin
  if Length(ED_empno.Text) > 10 then
  begin
    PL_Read_pehreaim_det;
    PL_SetControls;
  end;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ED_empno.PL_get_singledata;
  end;
end;

procedure TFM_Main.PL_Read_pehreaim_det;
Var
   SqlText : string;
begin
  with DBSet1 do
  begin
      DisableControls;
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
                        '   AND B.EMPNO     = ''%s''                                                  '+
                        '   AND B.RABASDATE = A.RABASDATE(+)                                          '+
                        '   AND B.EMPNO     = A.EMPNO(+)                                              '+
                        '   AND B.JOBKIND   = C.DUTYKIND(+)                                           '+
                        '   AND B.JOBDUTY   = D.DUTY(+)                                               '+
                        '   AND B.JOBGUN    = E.CODENO(+) AND E.CODEID(+)=''I115''                    '+
                        '   AND B.PAYCL     = F.CODENO(+) AND F.CODEID(+)=''I112''                    '+
                        '   AND B.PAYRA     = G.CODENO(+) AND G.CODEID(+)=''I113''                    '+
                        '   AND B.ORGNUM    = H.ORGNUM    AND B.DEPTCODE = H.DEPTCODE                 ',[sRabasDate,Ed_empno.empno]);

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
      Open;

      DBSet1.fieldbyname('OBJYN').Alignment := taCenter;
      L_Deptname.ValueCaption   := FieldByName('DEPTNAME').AsString;
      L_Payclname.ValueCaption  := FieldByName('PAYCLNAME').AsString;
      L_payraname.ValueCaption  := FieldByName('PAYRANAME').AsString;
      L_jobgun.ValueCaption     := FieldByName('JOBGUNNAME').AsString;
      L_jobkind.ValueCaption    := FieldByName('DUTYKINDNAME').AsString;
      L_paycldate.Text          := FieldByName('PAYCLDATE').AsString;
      L_empdate.Text            := FieldByName('EMPDATE').AsString;

      //2006.11.22 하은영       ShowMessage(FieldByName('OBJYN').AsString);
      Bt_Add.Visible      := False;
      Bt_OConfirm.Visible := False;
      if FieldByName('OBJYN').AsString = 'Y'  then
      begin
           if (Notebook1.ActivePage = 'P1') or (Notebook1.ActivePage = 'P2')  then
           begin
              Bt_Add.Visible      := True;
              Bt_OConfirm.Visible := True;
           end
           else
           begin
              Bt_Add.Visible      := false;
              Bt_OConfirm.Visible := false;
           end;

           if (Notebook1.ActivePage = 'P1') And (v_e1opinionyn = 'Y')  then
           begin
                Bt_Add.Caption      := '평가소견 열람';
                Bt_Add.Visible      := True;
                Bt_OConfirm.Enabled := False;
           end;
      end;

      EnableControls;
      Read_E1SumSCR;
  end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
var ParamVariant : String;
begin
  PL_ResetAllButton;
  SelfClass1.Caption := '';
  SelfClass2.Caption := '';
  SelfClass3.Caption := '';
  SelfClass4.Caption := '';
  SelfClass5.Caption := '';

  SelfScr1.ValueCaption := '';
  SelfScr2.ValueCaption := '';
  SelfScr3.ValueCaption := '';
  SelfScr4.ValueCaption := '';
  SelfScr5.ValueCaption := '';

  DownClass1.Caption := '';
  DownClass2.Caption := '';
  DownClass3.Caption := '';
  DownClass4.Caption := '';
  DownClass5.Caption := '';

  DownScr1.ValueCaption := '';
  DownScr2.ValueCaption := '';
  DownScr3.ValueCaption := '';
  DownScr4.ValueCaption := '';
  DownScr5.ValueCaption := '';


  with DBSet1 do
  begin
       Bt_Add.Visible      := False;
       Bt_OConfirm.Visible := False;
       if (Lwork = '1차') and (FieldByName('OBJYN').AsString = 'Y')  then
       begin
           if (Notebook1.ActivePage = 'P1') or (Notebook1.ActivePage = 'P2')  then
           begin
              Bt_Add.Visible      := True;
              Bt_OConfirm.Visible := True;
           end
           else
           begin
              Bt_Add.Visible      := false;
              Bt_OConfirm.Visible := false;
           end;

            if v_e1opinionyn = 'Y' then
            begin
                 Bt_Add.Caption  := '평가소견 열람';
                 Bt_OConfirm.Enabled := False;
            end;
       end
       else if (Lwork = '2차') and (FieldByName('OBJYN').AsString = 'Y')  then
       begin
            if (Notebook1.ActivePage = 'P1') or (Notebook1.ActivePage = 'P2')  then
            begin
              Bt_Add.Visible      := True;
              Bt_OConfirm.Enabled := True;
              Bt_OConfirm.Visible := True;
            end
            else
            begin
                Bt_Add.Visible      := false;
                Bt_OConfirm.Visible := false;
            end;
            if v_e2opinionyn = 'Y' then
            begin
                 Bt_Add.Caption  := '평가소견 열람';
                 Bt_OConfirm.Enabled := False;
            end;
       end;


       E_Aim1.Text :=  FieldByName('RESULT1').AsString;
       E_Aim2.Text :=  FieldByName('RESULT2').AsString;
       E_Aim3.Text :=  FieldByName('RESULT3').AsString;
       E_Aim4.Text :=  FieldByName('RESULT4').AsString;
       E_Aim5.Text :=  FieldByName('RESULT5').AsString;

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

       SelfScr1.ValueCaption := FieldByName('DETAILRSCORE1').AsString;
       SelfScr2.ValueCaption := FieldByName('DETAILRSCORE2').AsString;
       SelfScr3.ValueCaption := FieldByName('DETAILRSCORE3').AsString;
       SelfScr4.ValueCaption := FieldByName('DETAILRSCORE4').AsString;
       SelfScr5.ValueCaption := FieldByName('DETAILRSCORE5').AsString;

       if      FieldByName('DETAILECLASS1').AsString = 'S' then DownClass1.Caption := var_GrdS
       else if FieldByName('DETAILECLASS1').AsString = 'A' then DownClass1.Caption := var_GrdA
       else if FieldByName('DETAILECLASS1').AsString = 'B' then DownClass1.Caption := var_GrdB
       else if FieldByName('DETAILECLASS1').AsString = 'C' then DownClass1.Caption := var_GrdC
       else if FieldByName('DETAILECLASS1').AsString = 'D' then DownClass1.Caption := var_GrdD
       else                                                     DownClass1.Caption := FieldByName('DETAILECLASS1').AsString;

       if      FieldByName('DETAILECLASS2').AsString = 'S' then DownClass2.Caption := var_GrdS
       else if FieldByName('DETAILECLASS2').AsString = 'A' then DownClass2.Caption := var_GrdA
       else if FieldByName('DETAILECLASS2').AsString = 'B' then DownClass2.Caption := var_GrdB
       else if FieldByName('DETAILECLASS2').AsString = 'C' then DownClass2.Caption := var_GrdC
       else if FieldByName('DETAILECLASS2').AsString = 'D' then DownClass2.Caption := var_GrdD
       else                                                     DownClass2.Caption := FieldByName('DETAILECLASS2').AsString;

       if      FieldByName('DETAILECLASS3').AsString = 'S' then DownClass3.Caption := var_GrdS
       else if FieldByName('DETAILECLASS3').AsString = 'A' then DownClass3.Caption := var_GrdA
       else if FieldByName('DETAILECLASS3').AsString = 'B' then DownClass3.Caption := var_GrdB
       else if FieldByName('DETAILECLASS3').AsString = 'C' then DownClass3.Caption := var_GrdC
       else if FieldByName('DETAILECLASS3').AsString = 'D' then DownClass3.Caption := var_GrdD
       else                                                     DownClass3.Caption := FieldByName('DETAILECLASS3').AsString;

       if      FieldByName('DETAILECLASS4').AsString = 'S' then DownClass4.Caption := var_GrdS
       else if FieldByName('DETAILECLASS4').AsString = 'A' then DownClass4.Caption := var_GrdA
       else if FieldByName('DETAILECLASS4').AsString = 'B' then DownClass4.Caption := var_GrdB
       else if FieldByName('DETAILECLASS4').AsString = 'C' then DownClass4.Caption := var_GrdC
       else if FieldByName('DETAILECLASS4').AsString = 'D' then DownClass4.Caption := var_GrdD
       else                                                     DownClass4.Caption := FieldByName('DETAILECLASS4').AsString;

       if      FieldByName('DETAILECLASS5').AsString = 'S' then DownClass5.Caption := var_GrdS
       else if FieldByName('DETAILECLASS5').AsString = 'A' then DownClass5.Caption := var_GrdA
       else if FieldByName('DETAILECLASS5').AsString = 'B' then DownClass5.Caption := var_GrdB
       else if FieldByName('DETAILECLASS5').AsString = 'C' then DownClass5.Caption := var_GrdC
       else if FieldByName('DETAILECLASS5').AsString = 'D' then DownClass5.Caption := var_GrdD
       else                                                     DownClass5.Caption := FieldByName('DETAILECLASS5').AsString;

       DownScr1.ValueCaption := FieldByName('DETAILESCORE1').AsString;
       DownScr2.ValueCaption := FieldByName('DETAILESCORE2').AsString;
       DownScr3.ValueCaption := FieldByName('DETAILESCORE3').AsString;
       DownScr4.ValueCaption := FieldByName('DETAILESCORE4').AsString;
       DownScr5.ValueCaption := FieldByName('DETAILESCORE5').AsString;

       if  FieldByName('DETAILECLASS1').AsString <> '' then
       begin
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS1').AsString+'1')).BtnDown    := True;
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS1').AsString+'1')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILECLASS2').AsString <> '' then
       begin
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS2').AsString+'2')).BtnDown := True;
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS2').AsString+'2')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILECLASS3').AsString <> '' then
       begin
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS3').AsString+'3')).BtnDown := True;
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS3').AsString+'3')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILECLASS4').AsString <> '' then
       begin
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS4').AsString+'4')).BtnDown := True;
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS4').AsString+'4')).Font.Color := clWhite;
       end;
       if  FieldByName('DETAILECLASS5').AsString <> '' then
       begin
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS5').AsString+'5')).BtnDown := True;
        TOnSkinButton(Self.FindComponent('SB_'+FieldByName('DETAILECLASS5').AsString+'5')).Font.Color := clWhite;
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

       if FieldByName('detailtask1').AsString = '' then pnl_1.Visible := False
       else
       begin
           pnl_1.Visible := True;
           DetailCnt     := 1;
       end;

       if FieldByName('detailtask2').AsString = '' then pnl_2.Visible := False
       else
       begin
           pnl_2.Visible := True;
           DetailCnt     := 2;
       end;

       if FieldByName('detailtask3').AsString = '' then pnl_3.Visible := False
       else
       begin
           pnl_3.Visible := True;
           DetailCnt     := 3;
       end;

       if FieldByName('detailtask4').AsString = '' then pnl_4.Visible := False
       else
       begin
           pnl_4.Visible := True;
           DetailCnt     := 4;
       end;
       if FieldByName('detailtask5').AsString = '' then pnl_5.Visible := False
       else
       begin
           pnl_5.Visible := True;
           DetailCnt     := 5;
       end;
  end;

  with TMaxDataSet_HInsa do
  begin
    ServiceName := 'HINSA_select3';
    ParamVariant := ' SELECT E1PERVIEW, ''field2'', ''field3'', ''field4'',''field5''  '+
                    '  FROM PEHREMER  '+
                    ' where rabasdate  = ''' + sRabasDate +''' ' +
                    '   AND empno      = ''' + Ed_empno.empno  +''' ' ;

    ClearFieldInfo;
    AddField('E1PERVIEW' ,ftString, 2000);
    AddField('field2'    ,ftString, 2000);
    AddField('field3'    ,ftString, 2000);
    AddField('field4'    ,ftString, 2000);
    AddField('field5'    ,ftString, 2000);
    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    E_E1PERVIEW.Text := Fields[0].AsString;
  End;

  Read_E1SumSCR;
end;

procedure TFM_Main.E_Aim1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
begin
{  if Key = VK_DOWN then
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
  end; }
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  gS_final_comp := 'F';

  TOnSkinButton(Sender).BtnDown := True;

  //초기화.
  BT_OK.Visible     := False;
  BT_OBJECT.Visible := False;

  if TOnSkinButton(Sender).Name = 'SB_1' then
  begin
      // BT_Confirm.Visible := False;
       if Lwork ='1차' then
       begin
            //업적평가에서 '최종완료' 버튼 활성화 시킴. JSH
            if FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료' then BT_Confirm.Visible := False
            else                                                           BT_Confirm.Visible := True;
       end
       else if Lwork ='2차' then
       begin
            BT_Save.Visible := False;
            if FM_Sub.DBSet_Sub.FieldByName('DOWN2').AsString ='완료' then
            begin
                 BT_OK.Visible     := False;
                 BT_OBJECT.Visible := False;
            end
            else
            begin
                 BT_OK.Visible     := True;
                 BT_OBJECT.Visible := True;
            end;
       end;
  end
  else if TOnSkinButton(Sender).Name = 'SB_2' then
  begin
       if Lwork ='1차' then
       begin
            if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
            else                                                            BT_Confirm.Visible := True;
       end;
       if Lwork ='2차' then
       begin
            if FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료' then
            begin
                 BT_Confirm.Visible := False;
                 BT_Save.Visible    := False;
            end
            else
            begin
                 BT_Confirm.Visible := True;
                 BT_Save.Visible    := False;
            end;
       end;
  end
  else if TOnSkinButton(Sender).Name = 'SB_3' then
  begin
       if Lwork ='1차' then
       begin
            if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
            else                                                            BT_Confirm.Visible := True;
       end;
       if Lwork ='2차' then
       begin
            if FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료' then
            begin
                 BT_Confirm.Visible := False;
                 BT_Save.Visible    := False;
            end
            else
            begin
                 BT_Confirm.Visible := True;
                 BT_Save.Visible    := False;
            end;
       end;
  end;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TFM_Main.PL_ResetAllButton;
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1  do
  begin
    if (Components[i] is TOnSkinButton) then
    begin
      if (Components[i].Name <> 'SB_1')  and (Components[i].Name <> 'SB_2')  and (Components[i].Name <> 'SB_3') and
         (Components[i].Name <> 'SB_S6') and (Components[i].Name <> 'SB_A6') and
         (Components[i].Name <> 'SB_B6') and (Components[i].Name <> 'SB_C6') and (Components[i].Name <> 'SB_D6') then
      begin
       (Components[i] As TOnSkinButton).BtnDown    := False;
       (Components[i] As TOnSkinButton).Font.Color := clBlack;
      end;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TFM_Main.PL_SaveScrData;
var
  fESCORE : Double;
  sDownClass1, sDownClass2, sDownClass3,
  sDownClass4, sDownClass5 : string;
begin
  if      trim(DownClass1.Caption) = var_GrdS then sDownClass1 := 'S'
  else if trim(DownClass1.Caption) = var_GrdA then sDownClass1 := 'A'
  else if trim(DownClass1.Caption) = var_GrdB then sDownClass1 := 'B'
  else if trim(DownClass1.Caption) = var_GrdC then sDownClass1 := 'C'
  else if trim(DownClass1.Caption) = var_GrdD then sDownClass1 := 'D'
  else                                             sDownClass1 := DownClass1.Caption;

  if      trim(DownClass2.Caption) = var_GrdS then sDownClass2 := 'S'
  else if trim(DownClass2.Caption) = var_GrdA then sDownClass2 := 'A'
  else if trim(DownClass2.Caption) = var_GrdB then sDownClass2 := 'B'
  else if trim(DownClass2.Caption) = var_GrdC then sDownClass2 := 'C'
  else if trim(DownClass2.Caption) = var_GrdD then sDownClass2 := 'D'
  else                                             sDownClass2 := DownClass2.Caption;

  if      trim(DownClass3.Caption) = var_GrdS then sDownClass3 := 'S'
  else if trim(DownClass3.Caption) = var_GrdA then sDownClass3 := 'A'
  else if trim(DownClass3.Caption) = var_GrdB then sDownClass3 := 'B'
  else if trim(DownClass3.Caption) = var_GrdC then sDownClass3 := 'C'
  else if trim(DownClass3.Caption) = var_GrdD then sDownClass3 := 'D'
  else                                             sDownClass3 := DownClass3.Caption;

  if      trim(DownClass4.Caption) = var_GrdS then sDownClass4 := 'S'
  else if trim(DownClass4.Caption) = var_GrdA then sDownClass4 := 'A'
  else if trim(DownClass4.Caption) = var_GrdB then sDownClass4 := 'B'
  else if trim(DownClass4.Caption) = var_GrdC then sDownClass4 := 'C'
  else if trim(DownClass4.Caption) = var_GrdD then sDownClass4 := 'D'
  else                                             sDownClass4 := DownClass4.Caption;

  if      trim(DownClass5.Caption) = var_GrdS then sDownClass5 := 'S'
  else if trim(DownClass5.Caption) = var_GrdA then sDownClass5 := 'A'
  else if trim(DownClass5.Caption) = var_GrdB then sDownClass5 := 'B'
  else if trim(DownClass5.Caption) = var_GrdC then sDownClass5 := 'C'
  else if trim(DownClass5.Caption) = var_GrdD then sDownClass5 := 'D'
  else                                             sDownClass5 := DownClass5.Caption;

  fESCORE := ROUND(((StrToIntDef(DownScr1.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT1').AsInteger/100)+
                    (StrToIntDef(DownScr2.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT2').AsInteger/100)+
                    (StrToIntDef(DownScr3.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT3').AsInteger/100)+
                    (StrToIntDef(DownScr4.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT4').AsInteger/100)+
                    (StrToIntDef(DownScr5.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT5').AsInteger/100))*10000)/10000;
  with DBSet_dml do
  begin
    SQL.Text := Format('UPDATE PEHREAIM_DET            '+
                       '   SET DETAILESCORE1 = ''%s'', '+
                       '       DETAILECLASS1 = ''%s'', '+
                       '       DETAILESCORE2 = ''%s'', '+
                       '       DETAILECLASS2 = ''%s'', '+
                       '       DETAILESCORE3 = ''%s'', '+
                       '       DETAILECLASS3 = ''%s'', '+
                       '       DETAILESCORE4 = ''%s'', '+
                       '       DETAILECLASS4 = ''%s'', '+
                       '       DETAILESCORE5 = ''%s'', '+
                       '       DETAILECLASS5 = ''%s'', '+
                       '       ESCORE        = ''%f''  '+
                       ' WHERE RABASDATE = ''%s''      '+
                       '   AND EMPNO = ''%s''          '+
                       '   AND SEQNO = ''%S''          ',
                       [DownScr1.ValueCaption,sDownClass1,
                        DownScr2.ValueCaption,sDownClass2,
                        DownScr3.ValueCaption,sDownClass3,
                        DownScr4.ValueCaption,sDownClass4,
                        DownScr5.ValueCaption,sDownClass5,
                        fESCORE,sRabasdate,ED_empno.empno,
                        DBSet1.FieldByName('SEQNO').AsString]);
    Close;
    ServiceName := 'PET1010A_dml';
    ClearFieldInfo;
    Execute;
  end;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
  fESCORE   : Double;
  sSeq      : String;
  vMemo_E2  : String;
begin
  if Notebook1.ActivePage = 'P1' then
  begin
       fESCORE := ROUND(((StrToIntDef(DownScr1.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT1').AsInteger/100)+
                         (StrToIntDef(DownScr2.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT2').AsInteger/100)+
                         (StrToIntDef(DownScr3.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT3').AsInteger/100)+
                         (StrToIntDef(DownScr4.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT4').AsInteger/100)+
                         (StrToIntDef(DownScr5.ValueCaption,0) * DBSet1.FieldByName('DETAILWEIGHT5').AsInteger/100))*10000)/10000;
       if DBSet1.FieldByName('ESCORE').Asfloat <> fESCORE then
       begin
            sSeq := DBSet1.FieldByName('SEQNO').AsString;
            DBSet1.DisableControls;
            PL_SaveScrData;
            PL_Read_pehreaim_det;
            DBSet1.Locate('SEQNO',VarArrayof([sSeq]),[loPartialKey]);
            DBSet1.EnableControls;

            MessageDlg('중점추진업무 ['+trim(DBSet1.FieldByName('PROPELTASK').AsString)+'] 을 저장하였습니다.',mtinformation,[mbOK],0);
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       if      Lwork ='1차' then
       begin
            FDown_Sub1.DataSave(FDown_Sub1.BB_Save);
       end
  end
  else if Notebook1.ActivePage = 'P3' then
  begin
       if      Lwork ='1차' then
       begin
            FDown_Value1.DataSave(FDown_Value1.BB_Save);
       end
  end
  else if Notebook1.ActivePage = 'P6' then
  begin
    if (Pos('(Max 1000Byte)', On_Memo2.Text) > 0)    then vMemo_E2 := ''
    else                                                  vMemo_E2 := On_Memo2.Text;

    if Length(On_Memo2.Text) < 20 then
    begin
        MessageDlg('[저장오류]  종합의견을 성의껏 등록하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
        System.Exit;
    end;

    with DBSet_dml do
    begin
        Close;
        ClearFieldInfo;
        ServiceName := 'PET1010A_dml';
        SQL.Clear;
        SQL.Text := 'UPDATE pehremas                               '+      //dsa2000  2008.09. Modify
                    '   SET e2valview = '''+ vMemo_E2        +'''  '+
                    ' WHERE rabasdate = '''+ sRabasDate      +'''  '+
                    '   AND empno     = '''+ ED_empno.empno  +'''  ';
        Execute;
    end;
    MessageDlg('종합의견이 저장되었습니다.', mtInformation, [mbOk], 0);
  End;
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
var
  A         : Integer;
  PE_Down1, PE_Down2, PE_Down3, PE_Down4, PE_Down5, PE_Down6 : Boolean;
  ParamVariant : String;
begin
  if  SB_2.Visible = True then SB_1Click(SB_2);

  if (FM_Sub.DBSet_Sub.FieldByName('SELF').AsString <> '비대상') and (not FL_CheckNullEval) then
  begin
      MessageDlg('업적평가중 평가하지 않은 항목이 있습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      SB_1Click(SB_1);
      System.Exit;
  end;

  if (trim(DownClass6.Caption) = '') or (trim(DownClass6.Caption) = '0') then
    begin
      MessageDlg('과정지표를 평가하지 않았습니다.'+#13+#10+''+#13+#10+'평가 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
      SB_1Click(SB_1);
      System.Exit;
    end;

  if Lwork ='1차' then
  begin
       if (FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString <> '비대상') then
       begin
            if (FDown_Sub1.IsDataModified) then
            begin
                 MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
                 System.Exit;
            end;
       end;

       ParamVariant := 'SELECT nvl( a.abconyn ,'' '') || '';'' || '+
                       '       nvl( a.beconyn ,'' '') || '';'' || '+
                       '       nvl( a.duconyn ,'' '') || '';'' || '+
                       '       nvl( a.valconyn,'' '') || '';'' || '+
                       '      (Select E1PERVIEW From PEHREMER     '+
                       '       Where rabasdate = a.rabasdate      '+
                       '         AND empno     = a.empno)         '+
                       '  FROM pesmla a                           '+ // 능력태도상향종합
                       ' WHERE a.rabasdate = '''+sRabasDate       +'''   '+
                       '   AND a.empno     = '''+ED_empno.empno   +'''   '+ // 평가자
                       '   AND a.eempno    = '''+GSempno          +'''   '; // 피평가자
  end;

  if Lwork ='2차' then
  begin
       if (FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString <> '비대상') then
       begin
            if (FDown_Sub2.IsDataModified) then
            begin
                 MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
                 System.Exit;
            end;
       end;

       ParamVariant := 'SELECT nvl( abconyn ,'' '') || '';'' ||            '+
                       '       nvl( beconyn ,'' '') || '';'' ||            '+
                       '       nvl( duconyn ,'' '') || '';'' ||            '+
                       '       nvl( valconyn,'' '') || '';'' ||            '+ //dsa2000  2008.09. Add
                       '      (Select e2valview From pehremas              '+ //dsa2000  2008.09. Add
                       '        Where rabasdate = '''+sRabasDate    +'''   '+
                       '          AND empno     = '''+ED_empno.empno+'''   '+
                       '          AND length(e2valview) > 5) || '';'' ||   '+
                       '      (Select e2valconyn From pehremas             '+ //dsa2000  2008.09. Add
                       '        Where rabasdate = '''+sRabasDate    +'''   '+
                       '          AND empno     = '''+ED_empno.empno+''')  '+
                       '  FROM pesmlB                                      '+ // 능력태도상향종합
                       ' WHERE rabasdate = '''+sRabasDate           +'''   '+
                       '   AND eempno    = '''+GSempno              +'''   '+
                       '   AND empno     = '''+ED_empno.empno       +'''   '; // 평가자
  end;

  if (FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString <> '비대상') then
  begin
       DataModule_Tmax.Csel_SQL := ParamVariant;
       DataModule_Tmax.Csel_Open;

       if (DataModule_Tmax.Csel_gfd(1) = 'Y') then PE_Down1 := True
       else                                        PE_Down1 := False;

       if (DataModule_Tmax.Csel_gfd(2) = 'Y') then PE_Down2 := True
       else                                        PE_Down2 := False;

       if (DataModule_Tmax.Csel_gfd(3) = 'Y') then PE_Down3 := True
       else                                        PE_Down3 := False;

       if (DataModule_Tmax.Csel_gfd(4) = 'Y') then PE_Down4 := True
       else                                        PE_Down4 := False;

       if (DataModule_Tmax.Csel_gfd(5) <> '') then PE_Down5 := True      //dsa2000  2008.09. Add
       else                                        PE_Down5 := False;

       if (Lwork ='2차') and (DataModule_Tmax.Csel_gfd(6) = 'Y') then PE_Down6 := True
       else                                                           PE_Down6 := False;

       if (PE_Down1 = false) or (PE_Down2 = false) or (PE_Down3 = false) or (PE_Down4 = false) or (PE_Down5 = false) then
       begin
         if (Lwork ='1차') Then
         Begin
            if (PE_Down1 = false) then
            begin
                 A := GetComp('공통역량');
                 if      A = -1 then Exit
                 else if A >  0 then
                 begin
                      MessageDlg('공통역량 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                                 '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                      System.Exit;
                 end;
            end;

            if (PE_Down2 = false) then
            begin
                 A := GetComp('리더십역량');
                 if  A = -1 then Exit
                 else if A > 0 then
                 begin
                      MessageDlg('리더십평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                                 '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                      System.Exit;
                 end;
            end;

            if (PE_Down3 = false) then
            begin
                 A := GetComp('직무역량');
                 if  A = -1 then Exit
                 else if A > 0 then
                 begin
                      MessageDlg('직무역량 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                                 '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                      System.Exit;
                 end;
            end;

            if (PE_Down4 = false) then
            begin
                 A := GetComp('Values');
                 if  A = -1 then Exit
                 else if A > 0 then
                 begin
                      MessageDlg('Values 평가에 아직 입력되지 않은 평가항목이 남아 있습니다.'#13#13+
                                 '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                      System.Exit;
                 end;
            end;

            if (PE_Down5 = false) then
            begin
                 MessageDlg('업적평가의견은 필수 입력 항목입니다.. '#13#13+
                            '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                 SB_1Click(SB_1);
                 System.Exit;
            end;
         End
         Else
         Begin
            if (Lwork ='2차') and (PE_Down6 = false) then
            begin
                 MessageDlg('업적평가 승인을 처리하지 않으셨습니다. '#13#13+
                            '승인후  재작업해주시기 바랍니다. '#13#13+
                            '최종완료를 할 수 없습니다.',mtError,[mbOK],0);
                 SB_1Click(SB_1);
                 System.Exit;
            end;
         End;
       end;
  end;

  if (Lwork ='1차') then
  Begin
    if Not FL_CheckNullMERIT then Exit;
  End;

  if MessageBox(handle,PChar('[최종완료]를 하시면 등록하신 점수에 대해 수정하실 수 없습니다.'+#13+#13+
                             '[최종완료]를 하시겠습니까?'), '확 인', MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
    System.exit;
  end;
  
  with DBSet_dml do
  begin
       if (Lwork ='1차') then
       begin
            if (FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString <> '비대상') then
            begin
                 Close;
                 ServiceName := 'PET1010A_dml';
                 ClearFieldInfo;
                 SQL.Clear;
                 SQL.Text := 'UPDATE  pesmla Set                                                        '+
                             '       (abconyn,         abtotscr,                                        '+
                             '        beconyn,         betotscr,                                        '+
                             '        duconyn,         dutotscr,                                        '+
                             '        valconyn,        valtotscr,                                       '+
                             '        writeemp,        writetime)  =                                    '+
                             '       (SELECT ''Y'',           a.score / a.kindcount,                    '+
                             '               ''Y'',           b.score / b.kindcount,                    '+
                             '               ''Y'',           c.score / c.kindcount,                    '+
                             '               ''Y'',           d.score / d.kindcount,                    '+
                             '               '''+Gsempno+''', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')    '+
                             '         FROM (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''공통역량''                            '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') a,              '+
                             '              (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''리더십역량''                          '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') b,              '+
                             '              (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''직무역량''                            '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') c,              '+
                             '              (select sum(score) score, count(1) kindcount from           '+
                             '                     (select itemno, sum(score)/count(1) score from pesdl '+
                             '                       where ekind     = ''Values''                       '+
                             '                         and rabasdate = '''+sRabasDate    +'''           '+
                             '                         and empno     = '''+ED_empno.empno+'''           '+
                             '                         and eempno    = '''+Gsempno       +'''           '+
                             '                       group by itemno)                 ) d              )'+
                             ' WHERE rabasdate  = '''+sRabasDate    +'''                                '+
                             '   AND empno      = '''+ED_empno.empno+'''                                '+
                             '   AND eempno     = '''+Gsempno       +'''                                ';     //edit1.text := Sql.Text;
                 Execute;
            end;

            Close;
            SQL.Clear;
            SQL.Text := Format('UPDATE pehremas                                    '+
                               '   SET e1valconyn = ''Y'',                         '+
                               '       e1valobjyn = ''N'',                         '+ //dsa2000 2007.11.
                               '       e2valobjyn = ''N'',                         '+
                               '       e1valcondate = TO_CHAR(SYSDATE,''YYYYMMDD'')'+
                               ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                                [sRabasDate,ED_empno.empno]);
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            Execute;
       end;

       if (Lwork ='2차')  then
       begin
            if (FM_Sub.DBSet_Sub.FieldByName('ASELF').AsString <> '비대상') then
            begin
                 Close;
                 ServiceName := 'PET1010A_dml';
                 ClearFieldInfo;
                 SQL.Clear;
                 SQL.Text := 'UPDATE  pesmlb Set                                                        '+
                             '       (abconyn,         abtotscr,                                        '+
                             '        beconyn,         betotscr,                                        '+
                             '        duconyn,         dutotscr,                                        '+
                             '        valconyn,        valtotscr,                                       '+
                             '        writeemp,        writetime)  =                                    '+
                             '       (SELECT ''Y'',           a.score / a.kindcount,                    '+
                             '               ''Y'',           b.score / b.kindcount,                    '+
                             '               ''Y'',           c.score / c.kindcount,                    '+
                             '               ''Y'',           d.score / d.kindcount,                    '+
                             '               '''+Gsempno+''', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')    '+
                             '         FROM (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''공통역량''                            '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') a,              '+
                             '              (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''리더십역량''                          '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') b,              '+
                             '              (select sum(score) score, count(1) kindcount from pesdl     '+
                             '                where ekind     = ''직무역량''                            '+
                             '                  and rabasdate = '''+sRabasDate    +'''                  '+
                             '                  and empno     = '''+ED_empno.empno+'''                  '+
                             '                  and eempno    = '''+Gsempno       +''') c,              '+
                             '              (select sum(score) score, count(1) kindcount from           '+
                             '                     (select itemno, sum(score)/count(1) score from pesdl '+
                             '                       where ekind     = ''Values''                       '+
                             '                         and rabasdate = '''+sRabasDate    +'''           '+
                             '                         and empno     = '''+ED_empno.empno+'''           '+
                             '                         and eempno    = '''+Gsempno       +'''           '+
                             '                       group by itemno)                 ) d              )'+
                             ' WHERE rabasdate  = '''+sRabasDate+'''                                    '+
                             '   AND empno      = '''+ED_empno.empno+'''                                '+
                             '   AND eempno     = '''+Gsempno+'''                                       ';
                 Execute;
            end;
       end;
  end;

  MessageDlg('['+ED_empno.korname+']' + '구성원에 대한 [상사평가]를 ◈최종완료◈ 하였습니다.',mtInformation,[mbOk],0);

  Bt_Confirm.Visible := False;
  BT_OBJECT.visible := False;
  Close;
  FM_Sub.GridData;
  FM_Sub.Visible := True;
end;

function TFM_Main.FL_CheckNullEval:Boolean; // 하나라도 평가안한 항목이 있는지를 체크
begin
  Result := False;
  with FM_Sub.DBSet2 do
  begin
       SQL.Clear;
       SQL.Text := format('select count(*) cnt from pehreaim_Det                      '+
                          ' where((detailtask1 is not null and detaileclass1 is null) '+
                          '    or (detailtask2 is not null and detaileclass2 is null) '+
                          '    or (detailtask3 is not null and detaileclass3 is null) '+
                          '    or (detailtask4 is not null and detaileclass4 is null) '+
                          '    or (detailtask5 is not null and detaileclass5 is null))'+
                          '   and empno     =''%s''                                   '+
                          '   and rabasdate =''%s''                                   ',[ED_empno.empno, sRabasDate]);
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 100);
       Open;
       if FieldByName('SEL_DATA').AsInteger >  0 then Result := False
       else                                           Result := True;
  end;
end;

function TFM_Main.FL_CheckNullMERIT:Boolean; // 평가의견 열람 미입력 항목이 있는지 여부 체크
var Msg, v_evcno, ParamVariant : String;
begin
  Result := False;

  ParamVariant := 'SELECT evcno FROM pehamas ' +
                  ' WHERE rabasdate = '''+sRabasdate    +''' ' +
                  '   AND empno     = '''+Ed_empno.empno+''' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  v_evcno   := DataModule_Tmax.Csel_gfd(1);

  with FM_Sub.DBSet2 do
  begin
       SQL.Clear;
       if v_evcno = '1' then //비보임차부장만 리더십 확인.
       Begin
         SQL.Text := format(' SELECT  DECODE(REPLACE(MERIT_JVY, '' ''), NULL, ''Values평가(장점)'', '+
                            '        (DECODE(REPLACE(MERIT_JVN, '' ''), NULL, ''Values평가(단점)'', '+
                            '        (DECODE(REPLACE(MERIT_JCY, '' ''), NULL, ''공통역량(장점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JCN, '' ''), NULL, ''공통역량(단점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JRY, '' ''), NULL, ''리더십역량(장점)'', '+
                            '        (DECODE(REPLACE(MERIT_JRN, '' ''), NULL, ''리더십역량(단점)'', '+
                            '        (DECODE(REPLACE(MERIT_JAY, '' ''), NULL, ''직무역량(장점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JAN, '' ''), NULL, ''직무역량(단점)'',   '+
                            '        (DECODE(REPLACE(E1PERVIEW, '' ''), NULL, ''업적평가의견'' , ''0''))))))))))))))))) SEL_DATA '+
                            ' from PEHREMER '+
                            ' WHERE  empno    =''%s'' '+
                            '   and rabasdate =''%s'' ',[ED_empno.empno, sRabasDate]);
       End
       Else
       Begin
         SQL.Text := format(' SELECT  DECODE(REPLACE(MERIT_JVY, '' ''), NULL, ''Values평가(장점)'', '+
                            '        (DECODE(REPLACE(MERIT_JVN, '' ''), NULL, ''Values평가(단점)'', '+
                            '        (DECODE(REPLACE(MERIT_JCY, '' ''), NULL, ''공통역량(장점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JCN, '' ''), NULL, ''공통역량(단점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JAY, '' ''), NULL, ''직무역량(장점)'',   '+
                            '        (DECODE(REPLACE(MERIT_JAN, '' ''), NULL, ''직무역량(단점)'',   '+
                            '        (DECODE(REPLACE(E1PERVIEW, '' ''), NULL, ''업적평가의견'' , ''0''))))))))))))) SEL_DATA '+
                            ' from PEHREMER '+
                            ' WHERE  empno    =''%s'' '+
                            '   and rabasdate =''%s'' ',[ED_empno.empno, sRabasDate]);
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

         If (Copy(Msg,1,6) = 'Values')   Then FDown_Sub1.Show
         Else If  Msg = '업적평가의견'   Then NoteBook1.ActivePage := 'P1'
         Else                                 FDown_Value1.Show;

         Result := False;
       End;
  end;
end;

procedure TFM_Main.BT_OBJECTClick(Sender: TObject);
var
  Param : OleVariant;
  Msg   : string;
  ToMail: string;
begin
  Msg := '[반려] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then System.Exit;

  if LWork = '1차' then
  begin
       Messagedlg('피평가자에게 평가반려 메일을 발송합니다.',mtInformation,[MBOK],0);
       ToMail := '피평가자';

       with DBSet_dml do
       begin
            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            SQL.Clear;
            SQL.Text := 'UPDATE pehremas             '+
                        '   SET rvalconyn   = ''N'', '+
                        '       rvalcondate = '''' , '+
                        '       e1valobjyn  = ''Y''  '+
                        ' WHERE rabasdate   = '''+sRabasDate    +''' '+
                        '   AND empno       = '''+ED_empno.empno+''' ';
            Execute;

            Close;
            SQL.Clear;
            SQL.Text := 'UPDATE pesms              '+
                        '   SET abconyn   = ''N'', '+
                        '       beconyn   = ''N'', '+
                        '       duconyn   = ''N'', '+
                        '       valconyn  = ''N''  '+      //dsa2000  2008.09. Add
                        ' WHERE rabasdate = '''+sRabasDate+'''     '+
                        '   AND empno     = '''+ED_empno.empno+''' ';
            Execute;
       end;
  end;
  if LWork = '2차' then
  begin
       Messagedlg('1차평가자에게 평가반려 메일을 발송합니다.',mtInformation,[MBOK],0);
       ToMail := '1차메일';
       with DBSet_dml do
       begin
            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            SQL.Clear;
            SQL.Text := 'UPDATE pehremas              '+
                        '   SET e1valconyn   = ''N'', '+
                        '       e1valcondate = '''' , '+
                        '       e2valobjyn   = ''Y''  '+
                        ' WHERE rabasdate    = '''+sRabasDate+'''     '+
                        '   AND empno        = '''+ED_empno.empno+''' ';
            Execute;

            Close;
            SQL.Clear;
            SQL.Text := 'UPDATE pesmla             '+
                        '   SET abconyn   = ''N'', '+
                        '       beconyn   = ''N'', '+
                        '       duconyn   = ''N'', '+
                        '       valconyn  = ''N''  '+      //dsa2000  2008.09. Add
                        ' WHERE rabasdate = '''+sRabasDate+'''     '+
                        '   AND empno     = '''+ED_empno.empno+''' ';
            Execute;
       end;
  end;

  // 메일을 보낸다.
  if ToMail = '피평가자' then
  begin
       if Lwork = '1차' then
       begin
            SendProgID  := 'PET3020A';  //프로그램 ID
            SendEmpno   := Gsempno;      //발송자(로그인 사번)
            RcveEmpno   := Ed_empno.empno; //'Z113';
            MailSubject := '[ 업적평가의 자기평가에 대한 반려메일 ]';
            MailBody    := '귀하의 자기평가결과가 1차평가자('+Gsempno+'/'+Gskorname+')에 의하여 반려되었습니다.'+#13#13+
                           '업적평가에 대한 자기평가를 다시 실시하여 주시기 바랍니다!!.';
            ReceiveYN   := 'N';

            if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                 MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
            else
            begin
                 MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                            '반려작업은 처리되었으므로    '+#13+
                            '피평가자에게 [업적평가의 자기평가에 대한 반려] 메시지를 '+#13+
                            '[BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
                 System.Exit;
            end;
       end;
  end;
  if (ToMail = '1차메일') then
  begin
       SendProgID  := 'PET3020A'; //프로그램 ID
       SendEmpno   := Gsempno;    //발송자(로그인 사번)
       RcveEmpno   := Le1empno;   //'Z113';
       MailSubject := '[ 업적평가의 [1차평가/'+Ed_empno.Text+']에 대한 반려메일 ]';
       MailBody    := '2차평가자가 ['+Ed_empno.Text+']구성원의 업적평가를 반려 했습니다..'+#13#13+
                      '재평가를 부탁드리며,'+#13#13+
                      '평가 최종완료전에 해당 피평가자에게 재평가 결과를 공유해 주시기 바랍니다.';
       ReceiveYN   := 'N';

       if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
       else
       begin
            MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                       '반려작업은 처리되었으므로    '+#13+
                       '피평가자의 1차평가자['+Le1korname+']에게 [업적평가의 [1차평가/'+Ed_empno.Text+']에 대한 반려] 메시지를 '+#13+
                       '[BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
            System.Exit;
       end;
  end;
end;

procedure TFM_Main.Notebook1PageChanged(Sender: TObject);
var
  ParamVariant : String;
begin
  Application.ProcessMessages;
  if NoteBook1.ActivePage = 'P4' then
  begin
    ParamVariant := 'SELECT evcno FROM pehamas ' +
                    ' WHERE rabasdate = '''+sRabasdate    +''' ' +
                    '   AND empno     = '''+Ed_empno.empno+''' ';

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;
    v_evcno   := DataModule_Tmax.Csel_gfd(1);

    with TMaxDataSet_HInsa do
    begin
      ServiceName := 'HINSA_select12';

      ParamVariant := ' SELECT MERIT_JVY, MERIT_JVN, MERIT_JCY, MERIT_JCN, '+
	              '        MERIT_JRY, MERIT_JRN, MERIT_JAY, MERIT_JAN, E1PERVIEW, ''F10'' '+
                      '  FROM PEHREMER A '+
                      ' where rabasdate  = ''' + sRabasDate +''' ' +
                      '   AND empno      = ''' + Ed_empno.empno  +''' ' ;
      ClearFieldInfo;
      AddField('MERIT_JVY' ,ftString, 2000);
      AddField('MERIT_JVN' ,ftString, 2000);
      AddField('MERIT_JCY' ,ftString, 2000);
      AddField('MERIT_JCN' ,ftString, 2000);
      AddField('MERIT_JRY' ,ftString, 2000);
      AddField('MERIT_JRN' ,ftString, 2000);
      AddField('MERIT_JAY' ,ftString, 2000);
      AddField('MERIT_JAN' ,ftString, 2000);
      AddField('E1PERVIEW' ,ftString, 2000);
      AddField('F10'       ,ftString, 2000);
      Close;
      SQl.Clear;
      SQL.Text := ParamVariant;
      Open;

      MERIT_JVY.Text := Fields[0].AsString;
      MERIT_JVN.Text := Fields[1].AsString;
      MERIT_JCY.Text := Fields[2].AsString;
      MERIT_JCN.Text := Fields[3].AsString;
      MERIT_JAY.Text := Fields[6].AsString;
      MERIT_JAN.Text := Fields[7].AsString;
      Memo_E1.Text   := Fields[8].AsString;

      if v_evcno = '1' then //비보임차부장만 리더십 확인.
      Begin
        MERIT_JRY.Text := Fields[4].AsString;
        MERIT_JRN.Text := Fields[5].AsString;
        MERIT_JRY.Enabled := True;
        MERIT_JRN.Enabled := True;
      End
      Else
      Begin
        MERIT_JRY.Text := '';
        MERIT_JRN.Text := '';
        MERIT_JRY.Enabled := False;
        MERIT_JRN.Enabled := False;
      End;
    End;
  end
  else if NoteBook1.ActivePage = 'P5' then
  begin
    ParamVariant := 'SELECT evcno FROM pehamas ' +
                    ' WHERE rabasdate = '''+sRabasdate    +''' ' +
                    '   AND empno     = '''+Ed_empno.empno+''' ';

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;
    v_evcno   := DataModule_Tmax.Csel_gfd(1);

    with TMaxDataSet_HInsa do
    begin
      ServiceName := 'HINSA_select12';

      ParamVariant := ' SELECT MERIT_EVY, MERIT_EVN, MERIT_ECY, MERIT_ECN, '+
	              '        MERIT_ERY, MERIT_ERN, MERIT_EAY, MERIT_EAN, ''F9'', ''F10'' '+
                      '  FROM PEHREMER A '+
                      ' where rabasdate  = ''' + sRabasDate +''' ' +
                      '   AND empno      = ''' + Ed_empno.empno  +''' ' ;
      ClearFieldInfo;
      AddField('MERIT_JVY' ,ftString, 2000);
      AddField('MERIT_JVN' ,ftString, 2000);
      AddField('MERIT_JCY' ,ftString, 2000);
      AddField('MERIT_JCN' ,ftString, 2000);
      AddField('MERIT_JRY' ,ftString, 2000);
      AddField('MERIT_JRN' ,ftString, 2000);
      AddField('MERIT_JAY' ,ftString, 2000);
      AddField('MERIT_JAN' ,ftString, 2000);
      AddField('F9'        ,ftString, 2000);
      AddField('F10'       ,ftString, 2000);
      Close;
      SQl.Clear;
      SQL.Text := ParamVariant;
      Open;

      On_MERIT_JVY.Text := Fields[0].AsString;
      On_MERIT_JVN.Text := Fields[1].AsString;
      On_MERIT_JCY.Text := Fields[2].AsString;
      On_MERIT_JCN.Text := Fields[3].AsString;
      On_MERIT_JAY.Text := Fields[6].AsString;
      On_MERIT_JAN.Text := Fields[7].AsString;

      if v_evcno = '1' then //비보임차부장만 리더십 확인.
      Begin
        On_MERIT_JRY.Text := Fields[4].AsString;
        On_MERIT_JRN.Text := Fields[5].AsString;
        On_MERIT_JRY.Enabled := True;
        On_MERIT_JRN.Enabled := True;
      End
      Else
      Begin
        On_MERIT_JRY.Text := '';
        On_MERIT_JRN.Text := '';
        On_MERIT_JRY.Enabled := False;
        On_MERIT_JRN.Enabled := False;
      End;
    End;
  end
  else if NoteBook1.ActivePage = 'P6' then
  begin
    ParamVariant := 'SELECT E2VALVIEW '+
                    '  FROM pehremas  '+
                    ' WHERE rabasdate ='''+sRabasDate+''' '+
                    '   AND empno     ='''+ED_empno.empno+''' '+
                    '   AND e2empno   ='''+Gsempno+'''';
    with TMaxDataSet_HInsa do
    begin
      Close;
      ServiceName := 'PTA1010B_common';
      ClearFieldInfo;
      AddField('E2VALVIEW', ftString, 2000);
      ClearParamInfo;
      SQL.Text := ParamVariant;
      Open;
      if  FieldByName('E2VALVIEW').AsString <> '' then
      On_Memo2.text := FieldByName('E2VALVIEW').AsString;
    End;
  end
  else if NoteBook1.ActivePage = 'P1' then
  begin
    DBSet1.First;

    if (E1ValconYN = '완료') Then
    Begin
      BT_E1PERVIEW.Enabled := False;
      E_E1PERVIEW.ReadOnly := True;
    End
    Else
    Begin
      BT_E1PERVIEW.Enabled := True;
      E_E1PERVIEW.ReadOnly := False;

      if Lwork ='2차' then
      begin
        BT_E1PERVIEW.Enabled := False;
        E_E1PERVIEW.ReadOnly := True;
      End;
    End;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if Lwork ='1차' then
       begin
            if FDown_Sub2 <> nil then
            begin
              FDown_Sub2.Close;
              FDown_Sub2.Free;
            end;
            FDown_Sub1             := TFDown_Sub1.Create(nil);
            FDown_Sub1.Parent      := P_Abil;
            FDown_Sub1.WindowState := wsMaximized;
            FDown_Sub1.Pempno      := GSempno;
            FDown_Sub1.Pkorname    := GSkorname;
            FDown_Sub1.var_empno   := ED_empno.empno;
            FDown_Sub1.var_korname := ED_empno.korname;
            FDown_Sub1.OpenForm    := 1;
            FDown_Sub1.Show;
       end
       else if Lwork ='2차' then
       begin
            if FDown_Sub1 <> nil then
            begin
              FDown_Sub1.Close;
              FDown_Sub1.Free;
            end;
            FDown_Sub2             := TFDown_Sub2.Create(nil);
            FDown_Sub2.Parent      := P_Abil;
            FDown_Sub2.WindowState := wsMaximized;
            FDown_Sub2.Pempno      := GSempno;
            FDown_Sub2.Pkorname    := GSkorname;
            FDown_Sub2.var_empno   := ED_empno.empno;
            FDown_Sub2.var_korname := ED_empno.korname;
            FDown_Sub2.OpenForm    := 1;
            FDown_Sub2.Show;
       end;
  end
  else if NoteBook1.ActivePage = 'P3' then
  begin
       if Lwork ='1차' then
       begin
            if FDown_Value2 <> nil then
            begin
              FDown_Value2.Close;
              FDown_Value2.Free;
            end;
            FDown_Value1             := TFDown_Value1.Create(nil);
            FDown_Value1.Parent      := P_Value;
            FDown_Value1.WindowState := wsMaximized;
            FDown_Value1.Pempno      := GSempno;
            FDown_Value1.Pkorname    := GSkorname;
            FDown_Value1.var_empno   := ED_empno.empno;
            FDown_Value1.var_korname := ED_empno.korname;
            FDown_Value1.Show;
       end
       else if Lwork ='2차' then
       begin
            if FDown_Value1 <> nil then
            begin
              FDown_Value1.Close;
              FDown_Value1.Free;
            end;
            FDown_Value2             := TFDown_Value2.Create(nil);
            FDown_Value2.Parent      := P_Value;
            FDown_Value2.WindowState := wsMaximized;
            FDown_Value2.Pempno      := GSempno;
            FDown_Value2.Pkorname    := GSkorname;
            FDown_Value2.var_empno   := ED_empno.empno;
            FDown_Value2.var_korname := ED_empno.korname;
            FDown_Value2.Show;
       end;
       bt_Add.Visible := False;
       Bt_OConfirm.Visible := False;
  end;

  if (Lwork ='1차') then
  Begin
    If ((NoteBook1.ActivePage = 'P4') or (NoteBook1.ActivePage = 'P5')) Then  BT_Save.Visible := False
    Else                                                                      BT_Save.Visible := True;

    If (E1ValconYN = '완료') Then
    Begin
      BT_Save.Visible  := False;
      If (NoteBook1.ActivePage = 'P4') Then  BT_Print.Visible := True
      Else                                   BT_Print.Visible := False;
    End;
  End
  Else
  Begin
    If (E2ValconYN = '완료') Then
    Begin
      BT_Save.Visible    := False;
      BT_OK.Visible      := False;
      BT_OBJECT.Visible  := False;
      If (NoteBook1.ActivePage = 'P4') Then
      Begin
        BT_Print.Visible := True;
      End
      Else BT_Print.Visible := False;
    End
    Else
    Begin
      BT_Save.Visible  := False;
      If (NoteBook1.ActivePage = 'P4') Then
      Begin
        BT_OK.Visible    := False;
        BT_OBJECT.Visible:= False;
        BT_Print.Visible := False;
        Memo_E2.ReadOnly := False;
        BT_Save.Visible  := False;
      End;
    End;
  End;

  if ((NoteBook1.ActivePage = 'P2') or (NoteBook1.ActivePage = 'P3')) then  Print.Visible := True
  Else                                                                      Print.Visible := False;
End;

procedure TFM_Main.PL_SetControls;
var
  i : integer;
begin
  if (Lwork = '1차') and (FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString <>'완료') then      //상사평가 점수 입력
  begin
       for i := 0 to Self.ComponentCount - 1  do
       begin
            if (Components[i] is TOnSkinButton) then
            begin
              if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and (Components[i].Name <> 'SB_3')then
                 (Components[i] As TOnSkinButton).OnClick := SB_S1Click;
            end;
            if (Components[i] is TPanel) then
            begin
                 (Components[i] As TPanel).OnEnter := pnl_1Enter;
                 (Components[i] As TPanel).OnExit  := pnl_1Exit;
            end;
       end;
  end
  else if (Lwork = '2차') or (FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료') then  //승인 반려
  begin
       for i := 0 to Self.ComponentCount - 1  do
       begin
            if (Components[i] is TOnSkinButton) then
            begin
                 if (Components[i].Name <> 'SB_1') and (Components[i].Name <> 'SB_2') and (Components[i].Name <> 'SB_3') then
                    (Components[i] As TOnSkinButton).OnClick := Nil;
            end;
            if (Components[i] is TPanel) then
            begin
                 (Components[i] As TPanel).OnEnter := Nil;
                 (Components[i] As TPanel).OnExit  := Nil;
            end;
       end;
  end;
end;

procedure TFM_Main.Read_E1SumSCR;
var
  SqlText : string;
begin
  //자기평가점수 합계
  SqlText := Format('select nvl(sum(rscore),0)|| '';'' || nvl(sum(escore),0) '+
                    '  from pehreaim_DET                                     '+
                    ' where empno     = ''%s''                               '+
                    '   and rabasdate = ''%s'' ',[ED_empno.empno, sRabasDate]);
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;
  g_rscore := DataModule_Tmax.Csel_gfd(1);
  g_escore := DataModule_Tmax.Csel_gfd(2);

  SqlText := Format('select decode(prorscore,'''',0,prorscore) ||'';''|| decode(proescore,'''',0,proescore) '+
                    '       ||'';''||prorclass ||'';''|| proeclass '+
                    '  from pehremas   '+
                    ' where empno=''%s'' and rabasdate=''%s'' ',[ED_empno.empno, sRabasDate]);
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;
  g_prorscore   := DataModule_Tmax.Csel_gfd(1);
  g_proescore   := DataModule_Tmax.Csel_gfd(2);
  g_prorclass   := DataModule_Tmax.Csel_gfd(3);
  g_proeclass   := DataModule_Tmax.Csel_gfd(4);

  if g_prorscore <> '0' then SelfScr6.ValueCaption := g_prorscore
  else                       SelfScr6.ValueCaption := '0';

  if      g_prorclass = 'S' then SelfClass6.Caption := var_GrdS
  else if g_prorclass = 'A' then SelfClass6.Caption := var_GrdA
  else if g_prorclass = 'B' then SelfClass6.Caption := var_GrdB
  else if g_prorclass = 'C' then SelfClass6.Caption := var_GrdC
  else if g_prorclass = 'D' then SelfClass6.Caption := var_GrdD
  else                           SelfClass6.Caption := g_prorclass;

  if g_proescore <> '0' then DownScr6.ValueCaption := g_proescore
  else                       DownScr6.ValueCaption := '0';

  if      g_proeclass = 'S' then DownClass6.Caption := var_GrdS
  else if g_proeclass = 'A' then DownClass6.Caption := var_GrdA
  else if g_proeclass = 'B' then DownClass6.Caption := var_GrdB
  else if g_proeclass = 'C' then DownClass6.Caption := var_GrdC
  else if g_proeclass = 'D' then DownClass6.Caption := var_GrdD
  else                           DownClass6.Caption := g_proeclass;

  if  g_proeclass <> '' then
  begin
    TOnSkinButton(Self.FindComponent('SB_'+g_proeclass+'6')).BtnDown    := True;
    TOnSkinButton(Self.FindComponent('SB_'+g_proeclass+'6')).Font.Color := clWhite;
  end;

  L_RScore.Value := StrToFloat(g_rscore)*0.9 + StrtoFloat(g_prorscore)*0.1;
  L_EScore.Value := StrToFloat(g_escore)*0.9 + StrtoFloat(g_proescore)*0.1;

end;

function TFM_Main.GetComp(ekind:String) : Integer;
  var
    ParamVariant : String;
begin
     if (ekind ='Values') then
       ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)               '+
                       '       || '';'' || Count(Decode(nvl(B.score,0), 0, 1))          '+
                       '  FROM pehacd A, pesdl B                                        '+
                       ' WHERE A.rabasdate = '''+sRabasDate+'''                         '+
                       '   AND A.ekind     = ''' +ekind + '''                           '+
                       '   AND a.evcno     = (select evcno from pehamas                 '+
                       '                       where rabasdate = '''+sRabasDate    +''' '+
                       '                         and empno     = '''+ED_empno.empno+''')'+
                       '   AND b.eempno(+) = '''+GSempno       +'''                     '+ // 평가자사번
                       '   AND b.empno(+)  = '''+ED_empno.empno+'''                     '+
                       '   AND A.rabasdate = B.rabasdate(+)                             '+
                       '   AND A.ekind     = B.ekind(+)                                 '+
                       '   AND A.itemno    = B.itemno(+)                                '
                      // '   AND A.imageno   = B.imageno(+)                               '

     else if (ekind ='공통역량') or (ekind ='리더십역량') then
       ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)               '+
                       '       || '';'' || Count(Decode(nvl(B.score,0), 0, 1))          '+
                       '  FROM pehacd A, pesdl B                                        '+
                       ' WHERE A.rabasdate = '''+sRabasDate+'''                         '+
                       '   AND A.ekind     = ''' +ekind + '''                           '+
                       '   AND (a.evcno,a.paycl) = (select evcno,paycl from pehamas     '+
                       '                       where rabasdate = '''+sRabasDate    +''' '+
                       '                         and empno     = '''+ED_empno.empno+''')'+
                       '   AND b.eempno(+) = '''+GSempno       +'''                     '+ // 평가자사번
                       '   AND b.empno(+)  = '''+ED_empno.empno+'''                     '+
                       '   AND A.rabasdate = B.rabasdate(+)                             '+
                       '   AND A.ekind     = B.ekind(+)                                 '+
                       '   AND A.itemno    = B.itemno(+)                                '
                       //'   AND A.imageno   = B.imageno(+)                               '

     else if (ekind ='직무역량') then
       ParamVariant := 'SELECT COUNT(A.itemno) || '';'' || COUNT(B.empno)               '+
                       '       || '';'' || Count(Decode(nvl(B.score,0), 0, 1))          '+
                       '  FROM peducd A, pesdl B                                        '+
                       ' WHERE A.rabasdate = '''+sRabasDate+'''                         '+
                       '   AND A.ekind     = '''+ekind +'''                             '+
                       '   AND (a.evcno,a.jobkind) = (select evcno,jobkind from pehamas '+
                       '                       where rabasdate = '''+sRabasDate    +''' '+
                       '                         and empno     = '''+ED_empno.empno+''')'+
                       '   AND b.eempno(+) = '''+GSempno       +'''                     '+ // 평가자사번
                       '   AND b.empno(+)  = '''+ED_empno.empno+'''                     '+
                       '   AND A.rabasdate = B.rabasdate(+)                             '+
                       '   AND A.ekind     = B.ekind(+)                                 '+
                       '   AND A.itemno    = B.itemno(+)                                ';
                       //'   AND A.imageno   = B.imageno(+)                               ';
  //
    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;
    if not DataModule_Tmax.Csel_ret then
    begin
         Result := -1;
         Exit;
    end;
    Result := StrToIntdef(DataModule_Tmax.Csel_gfd(1),0) - StrToIntdef(DataModule_Tmax.Csel_gfd(2),0) + StrToIntdef(DataModule_Tmax.Csel_gfd(3),0);
end;

//평가 소견 등록
procedure TFM_Main.Bt_AddClick(Sender: TObject);
begin
  try
    Form1 := TForm1.Create(nil); // 역량평가
    Form1.Lwork   := Lwork;
    Form1.WorkTab := Notebook1.PageIndex;
    Form1.ShowModal;
    if Notebook1.PageIndex = 0 then
       PL_Read_pehreaim_det
//       PL_SetControls;
    else if Notebook1.PageIndex = 1 then
    begin
         if   Lwork = '2차' then FDown_Sub2.BB_CancelClick(Sender)
         else                    FDown_Sub1.BB_CancelClick(Sender);
    end;
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

procedure TFM_Main.Bt_OConfirmClick(Sender: TObject);
var
  v_cnt : string;
  sWhereSql, sWhereSql2, snotobj, sUpdateSql, SqlText : string;

  function IsNullField(sw:integer):Boolean;
  var
    SqlStr1 : string;
  begin
       Result := False;

       if   sw = 1 then
            SqlStr1 := format('select count(seqno)  cnt from pehreaim_det where %s ', [sWhereSql])
       else if   sw = 11 then
            SqlStr1 := format('select count(itemno) cnt from pesds        where %s ', [sWhereSql])
       else if   sw = 12 then
            SqlStr1 := format('select count(itemno) cnt from pesds        where %s ', [sWhereSql2]);

       with FM_Sub.DBSet2 do
       begin
            Close;
            ServiceName := 'PED0000A_common';
            ClearFieldInfo;
            AddField('SEL_DATA', ftString, 100);
            ClearParamInfo;
            SQL.Text := SqlStr1;
            Open;

            if Bof and Eof then exit;
            v_cnt     := FieldByName('SEL_DATA').AsString;
            if v_cnt = '0' then Result := False
            else                Result := True;
       end;
  end;

begin
  if ID_NO = Messagebox(handle,'완료하시면 해당 구성원에 대해 평가소견을 등록하실 수 없습니다.'+#13+#13+
                      '계속하시겠습니까?','확인',MB_YESNO or $0030) then  system.exit;

  sWhereSql := format('     rabasdate = ''%s'' '+
                      ' and empno     = ''%s'' '+
                      ' and objyn     = ''Y''  '+
                      ' and objopinion is null ', [sRabasDate,FM_Main.ED_empno.empno]);

  sWhereSql2:= format('     rabasdate = ''%s'' '+
                      ' and empno     = ''%s'' '+
                      ' and objyn     = ''Y''  '+
                      ' and objopinion2 is null ',[sRabasDate,FM_Main.ED_empno.empno]);

  if (Lwork = '1차') and (IsNullField(1))  then //1차 업적
  begin
       Messagedlg('업적평가의 평가 Petition한 업무에 대해 "평가소견 등록"을 작성하십시오'+#13+#13+
                  '평가소견을 미등록한 평가 항목이 존재합니다.', mtError,[mbOK],0);
       exit;
  end;

  if (Lwork = '1차') and (IsNullField(11)) then //1차 역량
  begin
       Messagedlg('역량평가의 평가 Petition한 항목에 대해 "평가소견 등록"을 작성하십시오 1'+#13+#13+
                  '평가소견을 미등록한 평가 항목이 존재합니다.', mtError,[mbOK],0);
       exit;
  end;

  if (Lwork = '2차') and (IsNullField(12)) then //2차 역량
  begin
       Messagedlg('역량평가의 평가 Petition한 항목에 대해 "평가소견 등록"을 작성하십시오 2'+#13+#13+
                  '평가소견을 미등록한 평가 항목이 존재합니다.', mtError,[mbOK],0);
       exit;
  end;


  with FM_Main.DBSet_dml do
  begin
       if  Lwork = '1차' then
       begin
            SQL.Text := format('update pehremas             '+
                               '   set e1opinionyn = ''Y''  '+
                               ' where rabasdate   = ''%s'' '+
                               '   and empno       = ''%s'' ',[sRabasDate, FM_Main.ED_empno.empno]);
       end
       else if Lwork = '2차' then
       begin
            SQL.Text := format('update pehremas             '+
                               '   set e2opinionyn = ''Y''  '+
                               ' where rabasdate   = ''%s'' '+
                               '   and empno       = ''%s'' ',[sRabasDate, FM_Main.ED_empno.empno]);
       end;

       Close;
       ServiceName := 'PET1010A_dml';
       ClearFieldInfo;
       Execute;
       Bt_Add.Enabled  := True;               //2006.11.22 하은영
       Bt_Add.Caption  := '평가소견 열람';
       Bt_OConfirm.Enabled := false;
       MessageDlg('[평가소견]이 등록되었습니다.'+#13#13+
                  '평가소견등록 완료 메일을 발송합니다.', mtInformation, [mbOK], 0);
  end;

  //피평가자에게 메일보내기
  //==============================================================================//
  SendProgID  := 'PET3020A';     //프로그램 ID
  SendEmpno   := GSempno;        //발송자(로그인 사번)
  RcveEmpno   := Ed_empno.empno; //'Z113';
  MailSubject := '[ 평가소견 등록 ]';
  MailBody    := '평가자 ['+ GSempno+'-'+Gskorname+']가  피평가자['+ ED_empno.Text  +']의 '+#13#13+
                 '평가 평가 Petition자료에 대해 평가근거를 등록했습니다.   '+#13#13+
                 '확인 바랍니다.';
  ReceiveYN   := 'N';

  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('해당팀원에게 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else
  begin
       MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                  '작업은 처리되었으므로    '+#13#13+
                  '해당 팀원에게 [평가 평가소견 등록] 메시지를 '+#13#13+
                  '[BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
       System.Exit;
  end;
  //==============================================================================//

  SqlText := 'select e2empno ||'';''|| e2korname    '+
             '  from pehremas                       '+
             ' where rabasdate = '''+sRabasDate+''' '+
             '   and empno     = '''+FM_Sub.DBSet_Sub.FieldByName('EMPNO').AsString+''' ';
  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  //2차평가자에게 메일보내기
  if ( Lwork = '1차') and (DataModule_Tmax.Csel_gfd(1) <> '') then
  begin
       SendProgID  := 'PET3020A';  //프로그램 ID
       SendEmpno   := GSempno;      //발송자(로그인 사번)
       RcveEmpno   := DataModule_Tmax.Csel_gfd(1); //'Z113';
       MailSubject := '[ 평가 평가소견 등록 ]';
       MailBody    := '평가자 ['+ Gskorname+']가  피평가자['+ ED_empno.korname  +']의 '+#13#13+
                      '평가 평가 Petition자료에 대해 평가근거를 등록했습니다.          '+#13#13+
                      '확인 바랍니다.';
       ReceiveYN   := 'N';

       if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
       else
       begin
            MessageDlg('메일전송중 에러가 발생하였습니다.'+#13#13+
                       '작업은 처리되었으므로    '+#13#13+
                       '2차 평가자께 [평가 평가소견 등록] 메시지를 '+#13#13+
                       '[BroadNet]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
            System.Exit;
       end;
  end;
end;

//업적평가 승인 : 2차 평가자만 가능.
procedure TFM_Main.BT_OKClick(Sender: TObject);
var
  SqlText,SqlText2,SqlText3 : String;
  cnt1, cnt2                : integer;
begin
  if MessageBox(handle,PChar('[업적평가 승인]를 하시겠습니까?'), '확 인',MB_YESNO or MB_DEFBUTTON2) <> IDYES then System.exit;

  with DBSet_dml do
  begin
       Close;
       SQL.Clear;
       SQL.Text := Format('UPDATE pehremas                                                          '+
                          '   SET e2valconyn   = ''Y'',                                             '+
                          '       e2valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8) '+
                          ' WHERE rabasdate    = ''%s'' AND empno = ''%s'' ',  [sRabasDate,ED_empno.empno]);
       Close;
       ServiceName := 'PET1010A_dml';
       ClearFieldInfo;
       Execute;

       MessageDlg('[업적평가] 승인완료 되었습니다.', mtInformation, [mbOK], 0);
  end;
end;

procedure TFM_Main.BT_VIEWCloseClick(Sender: TObject);
begin
  if SB_2.Visible = True then  NoteBook1.ActivePage := 'P2'
  else                         NoteBook1.ActivePage := 'P1';         //하은영

  BT_Opinon.Visible := True;

  if FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료' then BT_Save.Visible := False;
end;

//EAI 연동을 통한 Web BroadNet로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with DBSet_dml do
  begin
       ServiceName := 'PET1010A_dml';
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

procedure TFM_Main.BT_OpinonClick(Sender: TObject);//dsa2000  2008.09. Add
begin
  if Lwork ='1차' then
  begin
       if FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료' then BT_Confirm.Visible := False
       else                                                           BT_Confirm.Visible := True;
  end;
  if Lwork ='2차' then
  begin
       if FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료' then
       begin
            BT_Confirm.Visible := False;
            BT_Save.Visible    := False;
       end
       else
       begin
            BT_Confirm.Visible := True;
       end;
  end;

  NoteBook1.ActivePage := 'P4';
  SB_1.BtnDown := False;
  SB_2.BtnDown := False;
end;

procedure TFM_Main.Memo_E1Click(Sender: TObject);   //dsa2000  2008.09. Add
begin
  if (Pos('(Max 1000Byte)',Memo_E1.Text) > 0) then Memo_E1.Text := '';
end;

procedure TFM_Main.MERIT_JCYKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    Opinion3 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
   end;
end;

procedure TFM_Main.MERIT_JRYKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    Opinion2 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
   end;
end;

procedure TFM_Main.MERIT_JAYKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    Opinion4 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
   end;
end;

procedure TFM_Main.Memo_E1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    vMemo_E1 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        vMemo_E1 := copy(Memo_E1.text, 1, Length(Memo_E1.text)-1);
        Memo_E1.Clear;
        Memo_E1.Lines.Append(vMemo_E1);
   end;
end;

procedure TFM_Main.Memo_E2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    vMemo_E2 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
   end;
end;

procedure TFM_Main.MERIT_JVYKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    Opinion1 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
   end;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  MessageDlg('[평가 Petition 처리안내]'+#13+#13+
             ' 1. 평가 Petition여부가 Y 인 중점추진업무 또는 평가항목 클릭 '+#13+#13+
             ' 2. 평가소견등록 버튼 클릭후 평가사유등록 및 저장 (평가 Petition이 Y인 모든 항목별로 전부)'+#13+#13+
             ' 3. 평가소견완료 버튼 클릭'
             , mtInformation,
      [mbOk], 0);
end;

procedure TFM_Main.BT_E1PERVIEWClick(Sender: TObject);
var  Param  : OleVariant;
     SqlText, JobMode : String;
begin
//  평가 장점/단점 서술형 입력 테이블 생성할것.
  with DBSet_dml do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT empno,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEHREMER  '+
                ' where rabasdate  = ''' + sRabasdate +''' ' +
                '   AND empno      = ''' + ED_empno.empno  +''' ' ;

    ClearFieldInfo;
    AddField('empno'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  ( DBSet_dml.RecordCount < 1 )  then JobMode :='I'
    else                               JobMode :='U';
  end;

  if JobMode = 'I' then
  begin
    SQLText:= 'INSERT INTO PEHREMER                  ' +
              '   (RABASDATE, EMPNO,     E1PERVIEW,  ' +
              '               WRITEEMP,  WRITETIME)  ' +
              '  VALUES                              ' +
              '   ('''+ sRabasdate       +''',       ' +
              '    '''+ ED_empno.empno   +''',       ' +
              '    '''+ E_E1PERVIEW.Text +''',       ' +
              '    '''+ HSubForm.GSempno +''',       ' +
              '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
              '   ) ';
  end
  Else
  Begin
    SQLText := Format(
              'UPDATE PEHREMER SET ' +
              '       E1PERVIEW = ''%s'', '+
              '       WRITEEMP  = ''%s'', '+
              '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
              ' WHERE RABASDATE = ''%s'' '+
              '  AND  EMPNO     = ''%s'' ' ,
              [E_E1PERVIEW.Text, HSubForm.GSempno, sRabasdate, ED_empno.empno]);
  End;

  DBSet_dml.Close;
  DBSet_dml.Sql.Clear;
  DBSet_dml.Sql.Text := SQLText;
  DBSet_dml.ServiceName := 'PIT1030A_DML';

  if NOT DBSet_dml.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End
  Else MessageDlg(' 저장되었습니다.', mtInformation, [mbOk], 0);
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  PrintForm := TPrintForm.Create(self);
  PrintForm.VCHK.Caption       := '일반';
  PrintForm.QR_Empno.Caption   := ED_empno.empno;
  PrintForm.QR_Korname.Caption := ED_empno.korname;
  PrintForm.QuickRep1.Preview;
end;

procedure TFM_Main.BT_SelfOpenClick(Sender: TObject);
begin
  NoteBook1.ActivePage := 'P5';
end;

procedure TFM_Main.BT_E2OpinonClick(Sender: TObject);
begin
  NoteBook1.ActivePage := 'P6';
(*
  if Lwork ='1차' then
  begin
       if FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료' then BT_Confirm.Visible := False
       else                                                           BT_Confirm.Visible := True;
  end;
  if Lwork ='2차' then
  begin
       if FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString ='완료' then
       begin
            BT_Confirm.Visible := False;
            BT_Save.Visible    := False;
       end
       else
       begin
            BT_Confirm.Visible := True;
       end;
  end;
*)
end;

procedure TFM_Main.On_Memo2Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',On_Memo2.Text) > 0) then On_Memo2.Text := '';
end;

procedure TFM_Main.On_Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    vMemo_E2 : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.' ,mtError,[mbOK],0);
        vMemo_E2 := copy(On_Memo2.text, 1, Length(On_Memo2.text)-1);
        On_Memo2.Clear;
        On_Memo2.Lines.Append(vMemo_E2);
   end;
end;


procedure TFM_Main.PrintClick(Sender: TObject);
begin
  try
    PrintForm2 := TPrintForm2.Create(Application);
    PrintForm2.var_empno     := ED_empno.empno;
    PrintForm2.var_Rabasdate := sRabasdate;
    PrintForm2.QuickRep1.Preview;
  finally
    PrintForm2.free;
  end;
end;

end.
