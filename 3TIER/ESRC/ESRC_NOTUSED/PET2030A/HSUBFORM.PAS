{=============================== Program Header ================================
 PROGRAM-NAME   : 무기계약직 평가 - PET2020A
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 무기계약직 팀원 상사평가
 Programmer     :
 Version        : ver 1.0
 Date           : :2013.11.10
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2013.09.16    이희용       신규개발                HR팀 요청
================================================================================}
unit HSubForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, OnScheme, StdCtrls, ExtCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Db, Tmax_DataSetText,
  OnFocusButton, OnTmaxInsaData, Tmax_session,OnInsaCommon, DBTables,
  DBGrids, OnEditNumCtl, Math, PeJeonMemo, peoutlookbtn, Comobj, TmaxFunc;

type
  TFM_Sub = class(TForm)
    SF_Sub: TOnSchemeForm;
    DBGrd_E1: TDBGridEh;
    Panel2: TPanel;
    Shape1: TShape;
    RB3: TRadioButton;
    RB4: TRadioButton;
    DS_Sub: TDataSource;
    DBSet_Sub: TTMaxDataSet;
    Panel3: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Btn_Eval: TOnFocusButton;
    L_empkorname: TLabel;
    Btn_Exit: TOnFocusButton;
    Insa_Session: TTMaxSession;
    Insa_Data: TOnTMaxInsaData;
    DBSet2: TTMaxDataSet;
    DBcommon: TTMaxDataSet;
    L_Sum: TLabel;
    ED_CN: TEdit;
    BT_Sel: TOnFocusButton;
    E_Sql: TEdit;
    E_AVG_1A: TOnNumberEdit;
    E_AVGYN: TOnEdit;
    RB5: TRadioButton;
    RB2: TRadioButton;
    RB1: TRadioButton;
    procedure BT_SelClick( Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_ExitClick(Sender: TObject);
    procedure Btn_EvalClick(Sender: TObject);
    procedure E_AdminLoginClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PrintClick(Sender: TObject);
  private
    { Private declarations }
     FL_Start   : Boolean;
  public
    { Public declarations }
    aaa : Extended;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    pESCORE : string; //역량평가 상향점수(리더십역량 평가 점수와 맞추기위함.2012.11.21)
  end;
var
  FM_Sub     : TFM_Sub;
  Pempno     : string;        //Login사번
  gsEmpno    : String;        //Login사번
  GSkorname  : String;        //Login성명
  GSgrade    : String[10];    //Login등급
  sRabasdate : String;        //평가기준일
  sLoginGrant: String;
  Lwork      : String;
  var_E1empno: String;
  gS_final_comp : String; //최종완료 업적평가에서 바로저장 여부.JSH
  E_AVG_1V_count,E_AVG_1A_count, E_AVG_1B_count, E_AVG_2V_count, E_AVG_2A_count, E_AVG_2B_count : Integer;
  E_AVG_1V_SUM, E_AVG_1A_SUM, E_AVG_1B_SUM, E_AVG_2V_SUM, E_AVG_2A_SUM, E_AVG_2B_SUM : Real;
  E_AVGYN_Type, E_AVGYN_CheckNM1, E_AVGYN_CheckNM2, E_DEVYN_CheckNM : string;
  SqlText : string;

implementation

uses HMainForm, Hinsa_TmaxDM, UPrintForm1;
{$R *.DFM}

procedure TFM_Sub.FormPaint(Sender: TObject);
begin
  if FL_Start then
  begin
    Application.ProcessMessages;
    FL_Start := False;
    GSgrade         := Hinsa_Param(cmdLine,4);
    SF_sub.Refresh;

    with DBSet2 do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT  Value1                 '+
                  '  FROM pehrebas                '+
                  ' WHERE rabasdate = ''00000000'''+
                  '   AND gubun     = ''00''      '+
                  '   AND sgubun    = ''0001''    ';
      Close;
      ServiceName := 'PED0000A_common';
      ClearFieldInfo;
      AddField('SEL_DATA'    , ftString, 100);
      Open;

      sRabasdate := FieldByName('SEL_DATA').AsString;
//      sRabasdate := '20121130'; //테스트시에...
   end;

   SqlText := 'SELECT Value1 ||'';''|| Value2 from pehrebas '+
              ' where rabasdate = '''+sRabasdate+'''        '+
              '   and gubun     = ''31''                    '+
              '   and sgubun    = ''0002''                  ';
   DataModule_Tmax.Csel_SQL := SqlText;
   DataModule_Tmax.Csel_Open;

   pEmpno       := Hinsa_Param(cmdLine,1);
   GSkorname    := Hinsa_Param(cmdLine,2);

   if GSgrade[1] > 'B' then sLoginGrant := '일반사용자'
   else                     sLoginGrant := '관리자';


   SqlText := 'SELECT Value1 ||'';''|| Value2||'';''||      '+
              '       Value3 ||'';''|| Value4||'';''||      '+
              '       Value5                                '+
              '  from pehrebas                              '+
              ' where rabasdate = '''+sRabasdate+'''        '+
              '   and gubun     = ''11''                    '+
              '   and sgubun    = ''0005''                  ';
   DataModule_Tmax.Csel_SQL := SqlText;
   DataModule_Tmax.Csel_Open;

   Workemp1  := DataModule_Tmax.Csel_gfd(1);
   Workemp2  := DataModule_Tmax.Csel_gfd(2);
   Workemp3  := DataModule_Tmax.Csel_gfd(3);
   Workemp4  := DataModule_Tmax.Csel_gfd(4);
   Workemp5  := DataModule_Tmax.Csel_gfd(5);

   gsEmpno   := pEmpno;

   L_empkorname.Caption := '('+gsEmpno+') '+ GSkorname;
   BT_SelClick(nil);
  end;
end;

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  Insa_Session.EnvFileName := GetHomeDir+'\newhana.env';
  Insa_Session.LabelName   := 'HANAROHPER';
  Insa_Session.Connect     := False;
  Insa_Session.Host        := Hinsa_Param(cmdline,10);
  Insa_Session.Port        := '9999';

  try
     Insa_Session.Connect := True;
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
end;

procedure TFM_Sub.Btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sub.BT_SelClick(Sender: TObject);
var
  DEV_1A : array [1..150] of Double;
begin
  Application.ProcessMessages;

  if (Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
     (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
     (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D') then
  begin
    SqlText := 'SELECT Korname FROM pimpmas ' +
               ' WHERE empno = ''' + ED_CN.Text +''' ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

    GSkorname := DataModule_Tmax.Csel_gfd(1);

    L_empkorname.Caption := '('+ED_CN.Text+') '+ GSkorname;

    ED_CN.Visible  := true;
    BT_Sel.visible := true;
    gsEmpno        := ED_CN.text;
  end;

  with DBSet_Sub do
  begin
    SQL.Text := ' SELECT EMPNO, KORNAME,  ' +
                '    (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME,  ' +
                '    (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = A.PAYRA )  RANAME, ' +
                '    (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO = A.PAYRA )  CLNAME, ' +
                '    DECODE(RVALCONYN, ''Y'', ''완료'', ''미완료'') RVALCONYN, ' +
                '    DECODE(E1ATCONYN, ''Y'', DECODE(E1DUCONYN, ''Y'', ''완료'', ''미완료''), ''미완료'') E1ATCONYN, ' +
                '    DECODE(E1DACONYN, ''Y'', ''완료'', ''미완료'') E1DACONYN, ' +
                '    DECODE(RVALOBJYN,NULL,''진행전'',''X'',''미합의'',''Y'',''신청'',''N'',''미신청'') OBJSTATE,'+
                '    NVL((SELECT ESCORE FROM PEJNOEMP_DET WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EMPNO), 0) ESCORE  '+
                '  FROM PEJNOMAS A  ' +
                '  WHERE A.rabasdate = '''+sRabasdate +''' '+
                '    AND A.e1empno   = '''+gsEmpno  +''' ';

    if RB5.Checked then SQL.Add(' ORDER BY ESCORE DESC');
    if RB4.Checked then SQL.Add(' ORDER BY PAYCL, KORNAME      ');
    if RB3.Checked then SQL.Add(' ORDER BY DEPTNAME, A.PAYCL   ');
    if RB2.Checked then SQL.Add(' ORDER BY KORNAME             ');
    if RB1.Checked then SQL.Add(' ORDER BY EMPNO               ');

    E_Sql.Text := SQL.Text;

    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EMPNO'     , ftString, 100);
    AddField('KORNAME'   , ftString, 100);
    AddField('DEPTNAME'  , ftString, 100);
    AddField('RANAME'    , ftString, 100);
    AddField('CLNAME'    , ftString, 100);
    AddField('RVALCONYN' , ftString, 100);
    AddField('E1ATCONYN' , ftString, 100);
    AddField('E1DACONYN' , ftString, 100);
    AddField('OBJSTATE'  , ftString, 100);
    AddField('ESCORE'    , ftString, 100);
    Open;

    if Eof then
    begin
      if Not((Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D')) then
      Begin
        MessageDlg('팀장님이 아니거나 자기평가를 완료한 피평가자들이 없습니다.' + #13#13 +
                   '               [프로그램은 자동 종료됩니다.]', mtConfirmation, [mbOK],0);
        Application.Terminate;
      End;
    end;

    First;
    EnableControls;

    E_AVG_1V_count  := 0;
    E_AVG_1V_SUM    := 0;

    if FieldByName('ESCORE').AsString <> '' then //1차 업적
    begin
         inc(E_AVG_1A_count);
         E_AVG_1A_SUM := E_AVG_1A_SUM + FieldByName('ESCORE').AsFloat;

         DEV_1A[E_AVG_1A_count] := FieldByName('ESCORE').AsFloat;
    end;

    if (E_AVG_1A_SUM <> 0) and (E_AVG_1A_count <> 0) then  //1차업적
    begin
      E_AVG_1A.Value := ROUND(E_AVG_1A_SUM / E_AVG_1A_count * 100) / 100;
    end;

    L_Sum.Caption := '평가하실 피평가자수는 전체 '+IntToStr(RecordCount)+'명 입니다.';
  end;
end;

procedure TFM_Sub.Btn_EvalClick(Sender: TObject);
var SqlText : string;
    sEmpno : string;
begin

  if (DBSet_Sub.FieldByName('RVALCONYN').AsString = '미완료') then
  begin
       if MessageDlg('피평가자가 자기평가를 완료하지 않았습니다. '+#13#13+
                  '상사(하향) 평가를 그대로 진행하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;

  if (DBSet_Sub.FieldByName('OBJSTATE').AsString = '진행전') then
  begin
    MessageDlg('현재 1차평가만 완료된 상태입니다.이의제기신청 전단계이므로'#13#13+
               '피평가자 이의신청 여부 결정 후 평가하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end;

  if (DBSet_Sub.FieldByName('OBJSTATE').AsString = '신청중') then
  begin
    MessageDlg('<1차평가>는 완료되었으나 피평가자['+DBSet_Sub.FieldByName('KORNAME').AsString+']가 '+#13#13+
               '1차평가점수에 대해 [이의신청] 중 입니다..'+#13#13+
               '완료 된 후에 평가하시기 바랍니다..',mtInformation,[mbOK],0);
    Exit;
  end;

  Self.Visible := False;

  sEmpno := DBSet_Sub.FieldByName('empno').AsString;

  FM_Main := TFM_Main.Create(nil);

  Application.ProcessMessages;
  FM_Main.PL_ResetAllButton;
  FM_Main.ED_empno.Text := sEmpno;
  FM_Main.ED_empno.PL_get_singledata;

  FM_Main.Show;
end;

procedure TFM_Sub.E_AdminLoginClick(Sender: TObject);
begin
  if sLoginGrant = '관리자' then
  begin
//    FM_Admin := TFM_Admin.Create(Self);
//    FM_Admin.ShowModal;
//    gsEmpno  := FM_Admin.e_eempno.Text;
  end
  else begin
    gsEmpno   := Hinsa_Param(cmdLine,1);
    GSkorname := Hinsa_Param(cmdLine,2);
  end;
  BT_SelClick(nil);
  L_empkorname.Caption := '('+gsEmpno+')'+ GSkorname;
end;

procedure TFM_Sub.RB1Click(Sender: TObject);
begin
  BT_SelClick(BT_Sel);
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TFM_Sub.PrintClick(Sender: TObject);
begin
  try
    PrintForm1 := TPrintForm1.Create(Application);
    PrintForm1.QuickRep1.Preview;
  finally
    PrintForm1.free;
  end;
end;

end.




