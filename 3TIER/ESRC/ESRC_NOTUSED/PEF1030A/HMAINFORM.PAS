unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon, kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, peoutlookbtn, OnEditMemo, OnRadioBtn,
  PDownLoad, Func;

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
    SB_2: TOnSkinButton;
    Notebook1: TNotebook;
    DBSet_dml: TTMaxDataSet;
    BT_Exit: TOnFocusButton;
    TMaxDataSet_HInsa: TTMaxDataSet;
    P_Abil: TPanel;
    BT_Save: TOnFocusButton;
    BT_Confirm: TOnFocusButton;
    E_Ratio: TOnEdit;
    DBcommon: TTMaxDataSet;
    P_Value: TPanel;
    P_CoWorker: TPanel;
    Label20: TLabel;
    Merit: TOnMemo;
    DeMerit: TOnMemo;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    OnFocusButton4: TOnFocusButton;
    P_Opinion: TPanel;
    Memo_E1: TOnMemo;
    MERIT_JAY: TOnMemo;
    MERIT_JCY: TOnMemo;
    BT_Opinon: TOnFocusButton;
    Panel2: TPanel;
    Label4: TLabel;
    OnFocusButton1: TOnFocusButton;
    E_SelfValue1: TOnMemo;
    E_SelfValue2: TOnMemo;
    Shape1: TShape;
    Label5: TLabel;
    Shape7: TShape;
    Label6: TLabel;
    Shape8: TShape;
    Label7: TLabel;
    SB_3: TOnSkinButton;
    MERIT_JVN: TOnMemo;
    MERIT_JCN: TOnMemo;
    MERIT_JAN: TOnMemo;
    L_Msg: TLabel;
    Memo_E2: TOnMemo;
    BT_Print: TOnFocusButton;
    GroupBox1: TGroupBox;
    CH_mana: TCheckBox;
    CH_sale: TCheckBox;
    CH_tech: TCheckBox;
    RG_toteval: TRadioGroup;
    E_Sql: TEdit;
    MERIT_JVY: TOnMemo;
    Panel1: TPanel;
    Panel3: TPanel;
    BT_Download: TOnFocusButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_empnoChange(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_1Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
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
    procedure BT_PrintClick(Sender: TObject);
    procedure SB_3Click(Sender: TObject);
    procedure BT_DownloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    procedure PL_Read_pehreaim_det; //목표 Select
    procedure PL_SaveEview(flag :string);

    function  FL_CheckNullEval:Boolean;     //평가하지 않은 항목이 있는지 여부 체크
    function  FL_CheckNullMERIT:Boolean;    //평가의견 열람 미입력 항목이 있는지 여부 체크
    function  GetComp(ekind:String) : Integer;
    function  Csel_gfd(p_loc: Integer): String;

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

uses HSubForm, UDown_Sub1, Hinsa_TmaxDM,
     UDown_Value1, UPrintForm;

{$R *.DFM}

function TFM_Main.Csel_gfd(p_loc: Integer): String;
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

procedure TFM_Main.FormShow(Sender: TObject);
var
  SqlText : string;
  i       : integer;
  v_pgroupratio : string;
begin
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
    if ((FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료')) then
    begin
      E1ValconYN := FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString;

      if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString <> '신청') then //평가 Petition 사원은 완료여부 메세지 안띄우도록.
          MessageDlg('이미 [최종완료] 하신 구성원입니다.'+#13+#10+''+#13+#10+'<자료확인 및 출력>만 가능하십니다.  '+#13+#10+'', mtWarning, [mbOK], 0);

      BT_Confirm.Visible := False;
      BT_Save.Visible    := False;
      BT_Opinon.Caption  := '평가의견 열람';

      if (FM_Sub.DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청') then
      begin

        BT_Confirm.Visible := False;
        BT_Save.Visible    := False;
        BT_Opinon.Caption  := '평가의견 열람';

        if  ( (Lwork = '1차') and (v_e1opinionyn = 'Y') ) then   //평가소견 완료 여부
             MessageDlg('평가소견등록을 완료한 자료입니다.',mtInformation,[mbOK],0)
        else MessageDlg('피평가자가 평가 Petition을 하였습니다.'+#13+#10+''+#13+#10+'평가 Petition한 평가항목별로 평가근거를 등록하세요. '+#13+#10+'', mtWarning, [mbOK], 0);

      end;
    end
    else if (FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='미완료') then
    begin
      E1ValconYN := '';
    end;
  end;

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
    FM_Sub.BT_SelClick(nil);
    FM_Sub.Visible := True;
    System.exit;
  end;
end;

procedure TFM_Main.ED_empnoChange(Sender: TObject);
begin
  if Length(ED_empno.Text) > 10 then
  begin
    PL_Read_pehreaim_det;

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
      L_empdate.Text            := FieldByName('EMPDATE').AsString;        E_Sql.Text :=  SQL.Text;
      EnableControls;
  end;
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  gS_final_comp := 'F';

  TOnSkinButton(Sender).BtnDown := True;

  //초기화.
  if TOnSkinButton(Sender).Name = 'SB_2' then
  begin
    if Lwork ='1차' then
    begin
      if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
      else                                                            BT_Confirm.Visible := True;
    end;
  end
  else if TOnSkinButton(Sender).Name = 'SB_3' then
  begin
    if Lwork ='1차' then
    begin
      if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
      else                                                            BT_Confirm.Visible := True;
    end;
  end;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
  fESCORE   : Double;
  sSeq : String;
begin
  if Notebook1.ActivePage = 'P2' then
  begin
    if Lwork ='1차' then
    begin
      FDown_Sub1.DataSave(FDown_Sub1.BB_Save);
    end
  end
  else if Notebook1.ActivePage = 'P3' then
  begin
    if Lwork ='1차' then
    begin
      FDown_Value1.DataSave(FDown_Value1.BB_Save);
    end
  end
  else if Notebook1.ActivePage = 'P4' then
    PL_SaveEview('N');    //Y N 최종완료여부.
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
var
  A         : Integer;
  PE_Down1, PE_Down2, PE_Down3, PE_Down4, PE_Down5, PE_Down6 : Boolean;
  ParamVariant : String;
begin
  if  SB_2.Visible = True then SB_3Click(SB_2);

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

  end;

  PL_SaveEview('Y');
  MessageDlg('['+ED_empno.korname+']' + '구성원에 대한 [육성평가]를 ◈최종완료◈ 하였습니다.',mtInformation,[mbOk],0);

  Bt_Confirm.Visible := False;
  FM_Sub.BT_SelClick(FM_Sub.BT_Sel);
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

//  with FM_Sub.DBSet2 do
  with DBcommon do
  begin
       SQL.Clear;
       if v_evcno = '1' then //비보임차부장만 리더십 확인.
       Begin
         SQL.Text := format('SELECT  DECODE(REPLACE(MERIT_JVY, '' '', ''''), NULL, ''Values(장점)''  ,   '+
                            '       (DECODE(REPLACE(MERIT_JVN, '' '', ''''), NULL, ''Values(단점)''  ,   '+
                            '       (DECODE(REPLACE(MERIT_JCY, '' '', ''''), NULL, ''공통역량(장점)'',   '+
                            '       (DECODE(REPLACE(MERIT_JCN, '' '', ''''), NULL, ''공통역량(단점)'',   '+
                            '       (DECODE(REPLACE(MERIT_JRY, '' '', ''''), NULL, ''리더십역량(장점)'', '+
                            '       (DECODE(REPLACE(MERIT_JRN, '' '', ''''), NULL, ''리더십역량(단점)'', '+
                            '       (DECODE(REPLACE(MERIT_JAY, '' '', ''''), NULL, ''직무역량(장점)'',   '+
                            '       (DECODE(REPLACE(MERIT_JAN, '' '', ''''), NULL, ''직무역량(단점)'',   '+
                            '       (DECODE(REPLACE(TOTVIEW,   '' '', ''''), NULL, ''종합의견'' , ''0''))))))))))))))))) SEL_DATA '+
                            '  from PEHREMER a, PEMRDMAS B    '+
                            ' WHERE a.rabasdate = b.rabasdate '+
                            '   and a.rabasdate = ''%s''      '+
                            '   and a.empno     = b.empno     '+
                            '   and a.empno     = ''%s''      ',[sRabasDate,ED_empno.empno]);
       End
       Else
       Begin
         SQL.Text := format('SELECT  DECODE(REPLACE(MERIT_JVY, '' '', ''''), NULL, ''Values(장점)''  , '+
                            '       (DECODE(REPLACE(MERIT_JVN, '' '', ''''), NULL, ''Values(단점)''  , '+
                            '       (DECODE(REPLACE(MERIT_JCY, '' '', ''''), NULL, ''공통역량(장점)'', '+
                            '       (DECODE(REPLACE(MERIT_JCN, '' '', ''''), NULL, ''공통역량(단점)'', '+
                            '       (DECODE(REPLACE(MERIT_JAY, '' '', ''''), NULL, ''직무역량(장점)'', '+
                            '       (DECODE(REPLACE(MERIT_JAN, '' '', ''''), NULL, ''직무역량(단점)'', '+
                            '       (DECODE(REPLACE(TOTVIEW,   '' '', ''''), NULL, ''종합의견'' , ''0''))))))))))))) SEL_DATA '+
                            '  from PEHREMER a, PEMRDMAS B    '+
                            ' WHERE a.rabasdate = b.rabasdate '+
                            '   and a.rabasdate = ''%s''      '+
                            '   and a.empno     = b.empno     '+
                            '   and a.empno     = ''%s''      ',[sRabasDate,ED_empno.empno]);
       End;

       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 100);  //E_Sql.Text := SQL.Text;
       Open;
       Msg := FieldByName('SEL_DATA').AsString;

       if Msg =  '0' then Result := True
       Else
       Begin
         MessageDlg(Msg + '을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);

         If   (Copy(Msg,1,6) = 'Values') Then FDown_Sub1.Show
         Else                                 FDown_Value1.Show;
         Result := False;
       End;
  end;
end;

procedure TFM_Main.PL_SaveEview(flag :string);
var vMemo_E2, ParamVariant : String;
begin            
  if (CH_mana.Checked = False) and
     (CH_sale.Checked = False) and
     (CH_tech.Checked = False) then
  begin
    MessageBox(handle,'직무성향을 입력하지 않았습니다. 확인하세요','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if RG_toteval.ItemIndex = -1 then
  begin
    MessageBox(handle,'종합평가등급을 입력하지 않았습니다. 확인하세요','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if (Pos('(Max 1000Byte)', Memo_E2.Text) > 0) then
    vMemo_E2 := ''
  else
    vMemo_E2 := StrReplaceAll(Memo_E2.Text,'''','''''');

  if Length(Memo_E2.Text) < 10 then
  begin
    MessageDlg('[저장오류] 종합의견등록은 필수 입력 사항입니다. 성심성의껏 등록해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  Application.ProcessMessages;

//  CDM.CDS_Gen.Close;
  ParamVariant := 'UPDATE PEMRDMAS SET ';

  if CH_mana.Checked = True then
    ParamVariant := ParamVariant + 'MANANODE = ''Y'', '
  else ParamVariant := ParamVariant + 'MANANODE = ''N'', ' ;

  if CH_sale.Checked = True then
    ParamVariant := ParamVariant + 'SALEMODE = ''Y'', '
  else ParamVariant := ParamVariant + 'SALEMODE = ''N'', ' ;

  if CH_tech.Checked = True then
    ParamVariant := ParamVariant + 'TECHMODE = ''Y'', '
  else ParamVariant := ParamVariant + 'TECHMODE = ''N'', ' ;

  if RG_toteval.ItemIndex = 0 then
    ParamVariant := ParamVariant + 'TOTEVAL = ''A'', '
  else if RG_toteval.ItemIndex = 1 then
    ParamVariant := ParamVariant + 'TOTEVAL = ''B'', '
  else if RG_toteval.ItemIndex = 2 then
    ParamVariant := ParamVariant + 'TOTEVAL = ''C'', ' ;

  if Flag = 'Y' then // 최종확인
    ParamVariant := ParamVariant + 'CONYN = ''Y'', '; // 완료여부

  ParamVariant := ParamVariant +
                '      TOTVIEW   = '''+vMemo_E2+'''                      , ' +
                '      WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), ' +
                '      WRITEEMP  = '''+GSempno+'''                         ' +
                'WHERE RABASDATE = '''+sRabasdate+'''                      ' + // 평가기준일
                '  AND EMPNO     = '''+ED_empno.empno+'''                  ' ; // 피평가자사번

  DataModule_Tmax.Cupd_SQL := ParamVariant;
  DataModule_Tmax.Cupd_Exec;            E_Sql.Text := ParamVariant;

  if not DataModule_Tmax.Cupd_ret then
  begin
    Exit;
  end;

  MessageDlg('종합의견이 저장되었습니다.', mtInformation, [mbOk], 0);
end;

procedure TFM_Main.Notebook1PageChanged(Sender: TObject);
var
  ParamVariant : String;
begin
  Application.ProcessMessages;

  if NoteBook1.ActivePage = 'P4' then
    BT_Print.Visible := True
  else
    BT_Print.Visible := False;  

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
      ServiceName := 'HINSA_select3';

      ParamVariant := ' SELECT MANANODE ,                              ' +
                      '        SALEMODE ,                              ' +
                      '        TECHMODE ,                              ' +
                      '        TOTEVAL  ,                              ' +
                      '        TOTVIEW                                 ' +
                      '   FROM PEMRDMAS                                ' +
                      '  WHERE RABASDATE  = ''' + sRabasDate +'''      ' +
                      '    AND EMPNO      = ''' + Ed_empno.empno  +''' ' ;

      ClearFieldInfo;
      AddField('MANANODE' ,ftString, 2000);
      AddField('SALEMODE' ,ftString, 2000);
      AddField('TECHMODE' ,ftString, 2000);
      AddField('TOTEVAL'  ,ftString, 2000);
      AddField('TOTVIEW'  ,ftString, 2000);

      Close;
      SQl.Clear;
      SQL.Text := ParamVariant;
      Open;

      if Fields[0].AsString = 'Y' then
        CH_mana.Checked := True
      else
        CH_mana.Checked := False;

      if Fields[1].AsString = 'Y' then
        CH_sale.Checked := True
      else
        CH_sale.Checked := False;

      if Fields[2].AsString = 'Y' then
        CH_tech.Checked := True
      else
        CH_tech.Checked := False;

      if Fields[3].AsString = 'A' then
        RG_toteval.ItemIndex := 0
      else if Fields[3].AsString = 'B' then
        RG_toteval.ItemIndex := 1
      else if Fields[3].AsString = 'C' then
        RG_toteval.ItemIndex := 2
      else RG_toteval.ItemIndex := -1;

      Memo_E2.Text := Fields[4].AsString;

    End;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
    if Lwork ='1차' then
    begin
      FDown_Sub1             := TFDown_Sub1.Create(nil);
      FDown_Sub1.Parent      := P_Abil;
      FDown_Sub1.WindowState := wsMaximized;
      FDown_Sub1.Pempno      := GSempno;
      FDown_Sub1.Pkorname    := GSkorname;
      FDown_Sub1.var_empno   := ED_empno.empno;
      FDown_Sub1.var_korname := ED_empno.korname;
      FDown_Sub1.OpenForm    := 1;
      FDown_Sub1.Show;
    end ;
  end
  else if NoteBook1.ActivePage = 'P3' then
  begin
    if Lwork ='1차' then
    begin
      FDown_Value1             := TFDown_Value1.Create(nil);
      FDown_Value1.Parent      := P_Value;
      FDown_Value1.WindowState := wsMaximized;
      FDown_Value1.Pempno      := GSempno;
      FDown_Value1.Pkorname    := GSkorname;
      FDown_Value1.var_empno   := ED_empno.empno;
      FDown_Value1.var_korname := ED_empno.korname;
      FDown_Value1.Show;
    end;

  end;

  if (Lwork ='1차') then
  Begin
    If (E1ValconYN = '완료') Then
    Begin
      If (NoteBook1.ActivePage = 'P4') Then
        BT_Print.Visible := True
      Else
        BT_Print.Visible := False;
    End;
  End
{
  Else
  Begin
    If (E2ValconYN = '완료') Then
    Begin
      If (NoteBook1.ActivePage = 'P4') Then
      Begin
        BT_Print.Visible := True;
        Memo_E2.ReadOnly := True;
      End
      Else BT_Print.Visible := False;
    End
    Else
    Begin
      If (NoteBook1.ActivePage = 'P4') Then
      Begin
        BT_Print.Visible := False;
        Memo_E2.ReadOnly := False;
      End
      Else BT_Print.Visible := False;
    End;
  End;
}
End;

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

//업적평가 승인 : 2차 평가자만 가능.
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
(*
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
*)
end;

procedure TFM_Main.BT_OpinonClick(Sender: TObject);//dsa2000  2008.09. Add
begin
  if Lwork ='1차' then
  begin
       if FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString ='완료' then BT_Confirm.Visible := False
       else                                                           BT_Confirm.Visible := True;
  end;

  NoteBook1.ActivePage := 'P4';
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

procedure TFM_Main.BT_PrintClick(Sender: TObject);
var
  ParamVariant : String;
begin

  Application.ProcessMessages;
  with TMaxDataSet_HInsa do
  begin
    ServiceName := 'HINSA_select12';

    ParamVariant := ' SELECT MERIT_JVY,   ' +
                    '        MERIT_JVN,   ' +
                    '        MERIT_JCY,   ' +
                    '        MERIT_JCN,   ' +
                    '        MERIT_JAY,   ' +
                    '        MERIT_JAN,   ' +
                    '        ''''  JAN1,  ' +
                    '        ''''  JAN2,  ' +
                    '        ''''  JAN3,  ' +
                    '        ''''  JAN4   ' +
                    '   FROM PEHREMER     ' +
                    '  WHERE RABASDATE  = ''' + sRabasDate +'''      ' +
                    '    AND EMPNO      = ''' + Ed_empno.empno +'''  ' ;

    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('MERIT_JCY' ,ftString, 2000);
    AddField('MERIT_JCN' ,ftString, 2000);
    AddField('MERIT_JAY' ,ftString, 2000);
    AddField('MERIT_JAN' ,ftString, 2000);
    AddField('JAN1' ,ftString, 2000);
    AddField('JAN2' ,ftString, 2000);
    AddField('JAN3' ,ftString, 2000);
    AddField('JAN4' ,ftString, 2000);
    
    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    MERIT_JVY.Text := Fields[0].AsString;
    MERIT_JVN.Text := Fields[1].AsString;
    MERIT_JCY.Text := Fields[2].AsString;
    MERIT_JCN.Text := Fields[3].AsString;
    MERIT_JAY.Text := Fields[4].AsString;
    MERIT_JAN.Text := Fields[5].AsString;

  end;

  PrintForm := TPrintForm.Create(self);
  PrintForm.QuickRep1.Preview;
end;

procedure TFM_Main.SB_3Click(Sender: TObject);
begin

  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  gS_final_comp := 'F';

  TOnSkinButton(Sender).BtnDown := True;

  //초기화.
{
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
            end
            else
            begin
            end;
       end;
  end
  else
}
  if TOnSkinButton(Sender).Name = 'SB_2' then
  begin
    if Lwork ='1차' then
    begin
      if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
      else                                                            BT_Confirm.Visible := True;
    end;

  end
  else if TOnSkinButton(Sender).Name = 'SB_3' then
  begin
    if Lwork ='1차' then
    begin
      if FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString ='완료' then BT_Confirm.Visible := False
      else                                                            BT_Confirm.Visible := True;
    end;
  end;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TFM_Main.BT_DownloadClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
    sqltext : String;
    sE1Empno : String;
begin
   SqlText := 'Select A.Empno, A.korname, Unionyn, E1empno, E1korname '+
              '  From Pehremas A, Pehreaim_Combas B                   '+
              ' Where A.Rabasdate = B.Rabasdate                       '+
              '   And A.Rabasdate = '''+sRabasDate+'''                '+
              '   And A.Empno     = B.Empno                           '+
              '   And A.Empno     = '''+FM_Sub.DBSet_Sub.FieldByName('EMPNO').AsString+''' ';

   with DBcommon do
   begin
       Close;
       ClearFieldInfo;
       AddField('Empno'    , ftString,  100 );
       AddField('korname'  , ftString,  100 );
       AddField('Unionyn'  , ftString,  100 );
       AddField('E1empno'  , ftString,  100 );
       AddField('E1korname', ftString,  100 );
       Sql.Clear;
       Sql.Text := SqlText;
       ServiceName := 'HINSA_select';
       Open;
   end;
   sE1Empno := DBcommon.FieldByName('E1empno').AsString; //1차 평가자.

   //공동목표등록
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                 //환경변수값(파라미터) 읽어온다.
   FM_DownLoad.FL_UserID := pEmpno;        //ShowMessage(DBcommon.Fields[1].AsString);

   if DBcommon.FieldByName('Unionyn').AsString = 'Y' then // 공동목표등록 대상자
   begin
      FM_DownLoad.PL_VersionCHK3(3, 'PEA1060D');  //Call하는 단위 프로그램의 버젼을 체크..
      if (not FM_DownLoad.FL_VersionCHK ) or
         (not FileExists(GetHomeDir+'\Bin\3tier\PEA1060D.EXE')) then
      begin
         FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060D.EXE','PEA1060D',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
      end
      else
      begin
         FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
         LSfilename := GetHomeDir+'\Bin\3Tier\PEA1060D.EXE ,'
                    + sE1Empno              +','+Hinsa_Param(cmdline,2) +','+'@@@@@'+','   //@@@@@ 패스워드 체크 방지용.
                    +Hinsa_Param(cmdline,4) +','+Hinsa_Param(cmdline,5) +','+Hinsa_Param(cmdline,6)+','
                    +Hinsa_Param(cmdline,7) +','+Hinsa_Param(cmdline,8) +','+Hinsa_Param(cmdline,9)+','
                    +Hinsa_Param(cmdline,10)+','+Hinsa_Param(cmdline,11)+','+Hinsa_Param(cmdline,12)+','
                    +sRabasDate;

         strpcopy( LAarg, LSfilename );
         winexec(LAarg, SW_SHOWNORMAL);

         FM_DownLoad.Close;      // 다운로드 폼 닫기.
      end;
   end
   else if DBcommon.FieldByName('Unionyn').AsString = 'N' then //일반목표등록 대상자
   begin
      FM_DownLoad.PL_VersionCHK3(3, 'PEA1060A');  //Call하는 단위 프로그램의 버젼을 체크..
      if (not FM_DownLoad.FL_VersionCHK ) or
         (not FileExists(GetHomeDir+'\Bin\3tier\PEA1060A.EXE')) then
      begin
         FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060A.EXE','PEA1060A',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
      end
      else
      begin
         FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
         LSfilename := GetHomeDir+'\Bin\3Tier\PEA1060A.EXE ,'
                    + sE1Empno              +','+Hinsa_Param(cmdline,2) +','+'@@@@@'+','   //@@@@@ 패스워드 체크 방지용.
                    +Hinsa_Param(cmdline,4) +','+Hinsa_Param(cmdline,5) +','+Hinsa_Param(cmdline,6)+','
                    +Hinsa_Param(cmdline,7) +','+Hinsa_Param(cmdline,8) +','+Hinsa_Param(cmdline,9)+','
                    +Hinsa_Param(cmdline,10)+','+Hinsa_Param(cmdline,11)+','+Hinsa_Param(cmdline,12)+','
                    +Hinsa_Param(cmdline,13)+','+Hinsa_Param(cmdline,14)+','+Hinsa_Param(cmdline,15);

         strpcopy( LAarg, LSfilename );
         winexec(LAarg, SW_SHOWNORMAL);

         FM_DownLoad.Close;      // 다운로드 폼 닫기.
      end;
   end;

end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  VarLoading;
end;

end.
