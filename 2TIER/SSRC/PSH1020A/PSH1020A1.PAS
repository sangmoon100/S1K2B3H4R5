unit PSH1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Db, MemDS, DBAccess, Ora, Pass, OnMemDataset,
  OnPopupEdit, OnEditCombo, OraError, OnEditNumCtl, Comobj, OnCheckBox,
  OnRadioBtn, OnLineLabel, Func, Menus, OnEditMdate;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel2: TPanel;
    L_ExduCnt: TOnSectionLabel;
    BE_jobfr: TOnButtonEdit;
    BE_jobto: TOnButtonEdit;
    HelpMemo1: TMemo;
    NE7: TOnNumberEdit;
    NE8: TOnNumberEdit;
    NE9: TOnNumberEdit;
    NE10: TOnNumberEdit;
    NE11: TOnNumberEdit;
    NE12: TOnNumberEdit;
    NE6: TOnNumberEdit;
    NE5: TOnNumberEdit;
    NE4: TOnNumberEdit;
    NE3: TOnNumberEdit;
    NE2: TOnNumberEdit;
    NE1: TOnNumberEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DbGrid1: TOnGrDbGrid;
    TabSheet5: TTabSheet;
    DbGrid5: TOnGrDbGrid;
    TabSheet6: TTabSheet;
    DbGrid6_3: TOnGrDbGrid;
    DbGrid6_2: TOnGrDbGrid;
    DbGrid6_1: TOnGrDbGrid;
    TabSheet2: TTabSheet;
    DbGrid2: TOnGrDbGrid;
    TabSheet3: TTabSheet;
    OnGrDbGrid1: TOnGrDbGrid;
    TabSheet4: TTabSheet;
    DbGrid4: TOnGrDbGrid;
    TabSheet7: TTabSheet;
    DbGrid7: TOnGrDbGrid;
    CB_conyn: TOnComboEdit;
    BT_Search1: TOnFocusButton;
    BT_Y_Save: TOnFocusButton;
    BT_N_Save: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Help: TOnFocusButton;
    CE_appdate: TOnComboEdit;
    E_bigo: TOnEdit;
    NE_Except: TOnNumberEdit;
    NE_Setamt: TOnNumberEdit;
    NE_Preamt: TOnNumberEdit;
    E_setcomm: TOnEdit;
    PE_appemp: TOnPersonPopupEdit;
    NE_division2: TOnNumberEdit;
    BT_Modify: TOnFocusButton;
    BT_Excel: TOnFocusButton;
    BT_Excel_Hos: TOnFocusButton;
    Panel1: TPanel;
    Label1: TLabel;
    Grid_Exdu: TOnGrDbGrid;
    E_empdate: TOnMaskEdit;
    BE_Playsum: TEdit;
    Button1: TButton;
    Ora_Session: TOraSession;
    Ora_Comm: TOraQuery;
    DataSource1: TDataSource;
    Ora_Sql1: TOraQuery;
    Ora_Sql2: TOraQuery;
    Ora_Sql3: TOraQuery;
    MD_Data: TOnMemData;
    MD_Dataappdate: TStringField;
    MD_Dataempno: TStringField;
    MD_Dataseq: TStringField;
    MD_Dataconyn: TStringField;
    MD_Dataconynsayu: TStringField;
    MD_Dataexceptamt: TFloatField;
    MD_Datasetcomm: TStringField;
    MD_Datasetamt: TFloatField;
    MD_Datadivision2: TFloatField;
    MD_Datafaminame: TStringField;
    MD_Datamegubun: TStringField;
    OraQuery1: TOraQuery;
    Ora_Sql4: TOraQuery;
    Ora_Sql5: TOraQuery;
    DataSource2: TDataSource;
    Ora_Sql6: TOraQuery;
    Ora_Hos1: TOraQuery;
    Ora_Hos2: TOraQuery;
    Ora_Hos3: TOraQuery;
    Ds_Hos1: TDataSource;
    Ds_Hos2: TDataSource;
    Ds_Hos3: TDataSource;
    Ora_Exdu: TOraQuery;
    Ora_ExduEMPNO: TStringField;
    Ora_ExduEXCODE: TStringField;
    Ora_ExduEXNAME: TStringField;
    Ora_ExduEXFRDATE: TStringField;
    Ora_ExduEXTODATE: TStringField;
    DS_Exdu: TDataSource;
    Ora_Sql7: TOraQuery;
    DataSource3: TDataSource;
    SB_Help: TStatusBar;
    BT_X_Save: TOnFocusButton;
    MD_Dataplayamt: TFloatField;
    MD_Datapreamt: TFloatField;
    PopMenu: TPopupMenu;
    ViewJPG: TMenuItem;
    E_Consayu: TOnEdit;
    MD_Dataconsayu: TStringField;
    Edit1: TEdit;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    BT_Send: TOnFocusButton;
    GB_FINA: TGroupBox;
    LB_Fina: TLabel;
    Panel4: TPanel;
    RG_Check: TRadioGroup;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    Chk_All: TCheckBox;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    NE_INSURAMT: TOnNumberEdit;
    NE_CANCEAMT: TOnNumberEdit;
    NE14: TOnNumberEdit;
    NE13: TOnNumberEdit;
    Panel6: TPanel;
    RG_sort: TRadioGroup;
    OnMaskEdit1: TOnMaskEdit;
    MD_Datafamirel: TStringField;
    TabSheet8: TTabSheet;
    OnGrDbGrid2: TOnGrDbGrid;
    Ora_Sql8: TOraQuery;
    MD_Datafgubun: TStringField;

    procedure BT_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BT_Search1Click(Sender: TObject);
    procedure BT_Y_SaveClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_N_SaveClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure CB_conynChange(Sender: TObject);
    procedure CE_appdateChange(Sender: TObject);
    procedure BE_jobfrClick(Sender: TObject);
    procedure BE_jobfrButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_jobtoClick(Sender: TObject);
    procedure BE_jobtoButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
    procedure NE_PreamtExit(Sender: TObject);
    procedure DbGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NE_PreamtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure BT_ModifyClick(Sender: TObject);
    procedure BT_Excel_HosClick(Sender: TObject);
    procedure Ds_Hos1DataChange(Sender: TObject; Field: TField);
    procedure DbGrid7DblClick(Sender: TObject);
    procedure PE_appempKeyPress(Sender: TObject; var Key: Char);
    procedure DbGrid7CellClick(Column: TColumn);
    procedure BT_SendClick(Sender: TObject);
    procedure PL_Get_Except_Sum(v_empno, v_appdate, v_seq : String; cur_playsum : double ; out cur_exceptsum : double);
    procedure DbGrid2CellClick(Column: TColumn);
    procedure ViewJPGClick(Sender: TObject);
    procedure F_AppDate;
    procedure Get_Mail(ChkValue : Integer);
    procedure RG_CheckClick(Sender: TObject);
    procedure Chk_AllClick(Sender: TObject);
    procedure DbGrid1CellClick(Column: TColumn);
    procedure OnFocusButton2Click(Sender: TObject);

  private
    { Private declarations }
    FL_SaveClick, FL_DataChk : Boolean;
    FL_GiveMax1,  FL_GiveMax2,  FL_GiveMax3,  FL_GiveMax4: Double;
    FL_ZGiveMax1, FL_ZGiveMax2              : Double;
    FL_corpname, FL_playdate : String;
    FL_Sql, FL_Appdate1, FL_AppEmpno, FL_AppFaminame : String;
    FL_AppFamiJumin, FL_AppCorpNo : String;
    FL_SaveCnt : Integer;
    FL_FGUBUN : String;

    function Prior_Month(yyyymm: string): string;
    procedure GetSysDate;
    procedure MD_DataAppend1(DBGrid : TDBGrid; DataSet : TDataSet);
    procedure MD_DataAppend2(DBGrid : TDBGrid; DataSet : TDataSet);
    procedure DataSave(sTable : String);
    procedure DataSum(sAppdate : String; sEmpno : String; sFname : String; sMeGubun : String; sFgubun : String); //jissi 2013.05. 합계금액 데이터 생성
    procedure AutoSum;                                     //체육활동 : 전월 분할신청 Data 승인 합계 Procedure
    procedure AutoSum_DataChk(sEmpno : String; sSeq : String);
    procedure Send_Select;
    procedure Sendmail;
  public
    { Public declarations }
    FG_Sysdate : String;
    FG_Empno, FG_Korname, FG_grade : String;
    FG_AppYY , FG_Appdate : String;
    FG_jobclick : String;
    NotChk : integer; // 0 : 비승인, 1 : 비지원
    FL_MaxApp  : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Msg  : Array[0..1000] of Char;
    SMsg : String;
    ExceptSum : Double;
    ScAmtSum  : Double;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses Pdeptcode, Pcode, PSH1020A3, PSH1020A4;

{$R *.DFM}

function TFM_Mainform.Prior_Month(yyyymm: string): string;
var
  yyyy, mm: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),0);
  mm   := StrToIntDef(Copy(yyyymm,5,2),0);
  if (yyyy = 0) or (mm = 0) then
  begin
    Prior_Month := '';
    System.Exit;
  end;
  if mm = 1 then
  begin
    Dec(yyyy);
    mm := 13;
  end;
  Dec(mm);
  Prior_Month := format('%.4d%.2d', [yyyy,mm]);
end;

procedure TFM_Mainform.GetSysDate;
begin
  with Ora_Comm do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') value1 FROM DUAL');
    Open;
    FG_Sysdate := FieldByName('value1').AsString;
    Close;
  end;
end;

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Mainform.FormCreate(Sender: TObject);
var empno : String;
begin
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';
  Application.ProcessMessages;
  Ora_Session.Connected := False;
  Ora_Session.Username := Passemp(cmdline,5);
  Ora_Session.PassWord := Passemp(cmdline,6);
  Ora_Session.Server   := Passemp(cmdline,7) +':'+
                          Passemp(cmdline,9) +':'+
                          Passemp(cmdline,8);
  Ora_Session.Connect;
  empno      := Passemp(CmdLine,1);
  //FG_empno   := Passemp(CmdLine,1);
  if (empno = 'U220') or  (empno = 'U221') or (empno = 'U222') then
      empno := 'U206';
      
  FG_empno   := empno;
  FG_korname := Passemp(CmdLine,2);
  FG_grade   := Passemp(CmdLine,4);
  FG_Grade   := UpperCase(Copy(PassEmp(cmdline,4),4,1)); //복리후생 등급이 B등급 여부 조회.

  PageControl1.ActivePage := TabSheet1;
  FL_SaveClick := False;
  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Mainform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
 var frdate, todate : String;
begin
  GetSysDate;

{  if FG_empno <> '' then
    begin
      PE_empno.Text := FG_empno;
      PE_empno.PL_get_singledata;
    end;

  with Ora_Comm do //승인자 인적사항.
  begin
    Close;
    Sql.Clear;
    FL_Sql := Format('SELECT A.ORGNUM, A.JOBDEPT, B.DEPTNAME,'+
                     '	     A.PAYCL,  C.CODENAME            '+
                     '  FROM PYCDEPT B, PIMPMAS A, PYCCODE C '+
                     ' WHERE A.ORGNUM  = B.ORGNUM            '+
                     '   AND A.JOBDEPT = B.DEPTCODE          '+
                     '   AND CODEID    = ''I112''            '+
                     '   AND CODENO    = PAYCL               '+
                     '   AND EMPNO     = ''%s''              ',[FG_empno]);
    Sql.Text := FL_Sql;
    Open;
    SL_paycl.ValueCaption := FieldByName('CODENAME').AsString+'(' +
                             FieldByName('PAYCL').AsString+')';
    SL_dept.ValueCaption  := FieldByName('DEPTNAME').AsString+'(' +
                             FieldByName('JOBDEPT').AsString+')';
    Close;
  end;
}
  with Ora_Comm do   //작업기준사항
  begin
    Close;
    Sql.Clear;
    FL_Sql := 'SELECT SUBSTR(CONTODATE,1,4)  AppYY,  '+
              '       SUBSTR(CONTODATE,1,6)  Appdate,'+
              '       CONFRDATE ,                    '+
              '       CONTODATE ,                    '+
              '       GIVEMAX1 ,                     '+
              '       GIVEMAX2 ,                     '+
              '       GIVEMAX3 ,                     '+
              '       GIVEMAX4 ,                     '+
              '       ZGIVEMAX1 ,                    '+
              '       ZGIVEMAX2                      '+
              '  FROM PSCAPBAS                       ';
    Sql.Text := FL_Sql;
    Open;
    FG_AppYY       := FieldByName('AppYY').AsString;
    FG_Appdate     := FieldByName('Appdate').AsString;
    CE_Appdate.Text:= Copy(FG_Appdate,1,4) +' - '+ Copy(FG_Appdate,5,2);
    frdate         := FieldByName('CONFRDATE').AsString;
    todate         := FieldByName('CONTODATE').AsString;
    FL_GiveMax1    := FieldByName('GIVEMAX1').AsFloat;
    FL_GiveMax2    := FieldByName('GIVEMAX2').AsFloat;
    FL_GiveMax3    := FieldByName('GIVEMAX3').AsFloat;
    FL_GiveMax4    := FieldByName('GIVEMAX4').AsFloat;
    FL_ZGiveMax1   := FieldByName('ZGIVEMAX1').AsFloat;
    FL_ZGiveMax2   := FieldByName('ZGIVEMAX2').AsFloat;
    Close;
  end;

  with Ora_Comm do   //승인년월 조회
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT APPDATE  ');
    Sql.Add('  FROM (SELECT DISTINCT APPDATE FROM PSHAPSUM ');
    Sql.Add('        Where APPDATE <= (SELECT SUBSTR(CONTODATE,1,6) FROM PSCAPBAS )) ');
    //2012.09.14 조회기간 늘림.요청 오종석 매니저
    //SQL.Add(' Where appdate > to_char(add_months(sysdate,-24),''yyyymm'')   ');
    SQL.Add(' Where appdate > to_char(add_months(sysdate,-36),''yyyymm'')   ');
    Sql.Add(' order by appdate desc ');
    Open;
    First;
    CE_appdate.Items.Clear;
    while not Ora_Comm.Eof do
    begin
      CE_appdate.Items.Add(Copy(FieldByName('APPDATE').AsString,1,4)+' - '+Copy(FieldByName('APPDATE').AsString,5,2));
      Next;
    end;
    Close;
  end;

  //체육활동 : 분할신청 데이터중 승인합계금액 생성되지 않은 사원 데이터 생성 ////
  with Ora_Sql2 do
  begin
    Close;
    Sql.Clear;
    SQL.Add('SELECT Count(*) cnt FROM PSHAPLAY      ');
    SQL.Add(' WHERE APPDATE  = '''+ FG_Appdate +''' ');
    SQL.Add('   AND CONYN    = ''Y''                ');
    SQL.Add('   AND division > 1                    ');
    SQL.Add('   AND Empno Not in (Select Empno From PSHAPSUM Where APPDATE = '''+ FG_Appdate +''' ');
    SQL.Add('                                                  AND PART    = ''B'') ');

//    SQL.Add('   AND JOBPLACE in  (Select JOBPLACE From PSCAPJOB Where Empno = '''+ FG_Empno +''' ) '); //승인자 관할근무지만.
    Open;
    FL_SaveCnt := FieldByName('cnt').AsInteger;
    Close;
  end;

  if FL_SaveCnt > 0 then
  begin
       MessageDlg(IntToStr(FL_SaveCnt)+' 건의 분할신청 Data 승인합계금액 생성작업을 진행합니다... '+#13+#13+
                  ' 확인버튼을 누른후 잠시만 기다려 주시기 바랍니다...', mtInformation, [mbOk], 0);

       AutoSum; //체육활동 : 전월 분할신청 Data 승인 합계 Procedure
  end;
  //////////////////////////////////////////////////////////////////////////////


{  if (Copy(FG_Sysdate,1,8) < frdate) or (Copy(FG_Sysdate,1,8) > todate) then
  begin
    MessageDlg('승인기간이 아닙니다. 조회만 가능합니다.', mtInformation, [mbOk], 0);
    BT_Y_Save.Enabled := False;
    BT_N_Save.Enabled := False;
  end;}
  E_bigo.Text := '';
  SB_Help.Panels[1].Text :=' ';

  CB_conyn.ItemIndex := 0;
    //연간금액계산용 년월 계산(체육활동비)
  F_AppDate;
end;

procedure TFM_Mainform.PageControl1Change(Sender: TObject);
begin
  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.CB_conynChange(Sender: TObject);
begin
  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.CheckBox1Click(Sender: TObject);
begin
  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.CheckBox2Click(Sender: TObject);
begin
  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.PE_appempKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then BT_Search1Click(Sender);
end;

procedure TFM_Mainform.BT_Search1Click(Sender: TObject);
var
  partgubun, Fmegubun : String;
begin
  E_bigo.Text    := '';
  E_empdate.Text := '';
  MD_Data.Close;
  Ora_Sql1.Close;
  Ora_Sql2.Close;
  Ora_Hos1.Close;
  Ora_Hos2.Close;
  Ora_Hos3.Close;
  Ora_Exdu.Close;
  Chk_All.Checked := False;

  PageControl1.Height := 470;

  if PageControl1.ActivePage = TabSheet1 then
  begin
    NE_Preamt.Enabled    := False;
    NE_Setamt.Enabled    := False;
    E_Setcomm.Enabled    := False;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := True;
    E_bigo.Enabled       := True;
    BT_Modify.visible    := True;
    TabSheet1.Font.Color := clRed;
    TabSheet1.Font.Color := clBlack;
    TabSheet1.Font.Color := clBlack;
    BT_Excel.Caption     := '정규직의료비 Excel추출';
    BE_Playsum.Visible   := False;
    BT_Excel.visible     := true;
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := true;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := true;
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    NE_Preamt.Enabled    := True;
    NE_Setamt.Enabled    := True;
    E_Setcomm.Enabled    := True;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := False;
    E_bigo.Enabled       := True;
    BT_Modify.visible    := False;
    BT_Excel.Caption     := '체육활동 Excel 추출';
    BE_Playsum.Visible   := True;
    BT_Excel.visible     := true;
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := false;
    E_Consayu.visible    := true;
    Chk_All.Enabled      := false;
  end
  else if PageControl1.ActivePage = TabSheet3 then
  begin
    NE_Preamt.Enabled    := False;
    NE_Setamt.Enabled    := False;
    E_Setcomm.Enabled    := False;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := False;
    E_bigo.Enabled       := False;
    BT_Modify.visible    := False;
    BE_Playsum.Visible   := False;
    BT_Excel.Caption     := '당월승인전체 Excel추출';
    BT_Excel.visible     := true;
    BT_Excel_Hos.Visible := true;
    BT_Send.visible      := false;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := false;
  end
  else
  if PageControl1.ActivePage = TabSheet5 then
  begin
    NE_Preamt.Enabled    := False;
    NE_Setamt.Enabled    := False;
    E_Setcomm.Enabled    := False;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := True;
    E_bigo.Enabled       := True;
    BT_Modify.visible    := True;
    TabSheet1.Font.Color := clRed;
    TabSheet1.Font.Color := clBlack;
    TabSheet1.Font.Color := clBlack;
    BT_Excel.Caption     := '임원 의료비 Excel 추출';
    BE_Playsum.Visible   := False;
    BT_Excel.visible     := true;
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := false;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := true;
  end
  else
  if PageControl1.ActivePage = TabSheet6 then  //의료비심사(개인별) 2013.01. hjku 추가
  begin
    NE_Preamt.Enabled    := False;
    NE_Setamt.Enabled    := False;
    E_Setcomm.Enabled    := False;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := True;
    E_bigo.Enabled       := True;
    BT_Modify.visible    := false;
    TabSheet1.Font.Color := clRed;
    TabSheet1.Font.Color := clBlack;
    TabSheet1.Font.Color := clBlack;
    BE_Playsum.Visible   := False;
    PageControl1.Height  := 521;
    BT_Excel.Visible     := False;
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := false;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := true;
  end
  else if PageControl1.ActivePage = TabSheet8 then
  begin
    NE_Preamt.Enabled    := False;
    NE_Setamt.Enabled    := False;
    E_Setcomm.Enabled    := False;
    NE_division2.Enabled := False;
    NE_Except.Enabled    := False;
    E_bigo.Enabled       := False;
    BT_Modify.visible    := False;
    BE_Playsum.Visible   := False;
    BT_Excel.Caption     := '당월승인전체 Excel추출';
    BT_Excel.visible     := true;
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := false;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := false;
  end
  else
  if PageControl1.ActivePage = TabSheet4 then
  begin
    BT_Excel_Hos.Visible := false;
    BT_Send.visible      := false;
    E_Consayu.visible    := false;
    Chk_All.Enabled      := false;
  end
  else
  if PageControl1.ActivePage = TabSheet7 then
  begin
    Chk_All.Enabled      := false;
  end;

  if PageControl1.ActivePage = TabSheet1 then
  begin
    DataSource1.DataSet := Ora_Sql1;
    Ora_Sql1.FetchRows  := 5000;

    if RG_Check.ItemIndex = 1 then
    Begin
      Fmegubun := '1';
      NE_CANCEAMT.Enabled := True;
      NE_INSURAMT.Enabled := True;
    End
    Else
    Begin
      Fmegubun := '0';
      NE_CANCEAMT.Enabled := False;
      NE_INSURAMT.Enabled := False;
      NE_CANCEAMT.Clear;
      NE_INSURAMT.Clear;
    End;

    with Ora_Sql1 do
    begin
      Close;
      Sql.Clear;
      SQL.Add('SELECT COUNT( DISTINCT A.EMPNO) OVER() COUNT1 , APPDATE, A.EMPNO,     ');
      SQL.Add('       A.KORNAME,  DECODE(MEGUBUN, 1, ''중증'', ''일반'') MEGUBUN,    ');
      SQL.Add('       SEQ, FAMINAME, FAMIJUMIN, MEDIDATE, MEDCOMM, CORPNO, CORPNAME, ');
      SQL.Add('       NVL(CASHAMT,0)+NVL(CARDAMT,0)  TOTAMT,                         ');
      SQL.Add('       CONYN,  CONYNSAYU, EXCEPTAMT,  DEPTNAME,                       ');
      SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
      SQL.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,      ');
      SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
      SQL.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,        ');
      SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
      SQL.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,      ');
      SQL.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE CODENO=A.FAMIREL) RELNAME  ');
      SQL.Add('  FROM PSHAPHOS A, PIMPMAS B, PYCDEPT C');
      SQL.Add(' WHERE A.EMPNO    = B.EMPNO   ');
      SQL.Add('   AND APPDATE    =:appdate   ');
      SQL.Add('   AND B.ORGNUM   = C.ORGNUM  ');
      SQL.Add('   AND B.DEPTCODE = C.DEPTCODE');
      Sql.Add('   AND A.EMPNO    Like :appemp ');
      Sql.Add('   AND A.EMPNO NOT Like ''M%'' ');
      //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');
      Sql.Add('   AND A.MEGUBUN IN ( '''+ Fmegubun +''' ) ');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록

      //Edit1.Text := sql.Text;
      if      CB_conyn.Text = '전체'   then SQL.Add(' Order by empno  ')
      else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN  IS NULL  Order by empno ')
      else
      begin
        SQL.Add(' AND CONYN  = :conyn  Order by empno ');
        ParamByName('conyn').AsString  := CB_conyn.Text;
      end;

      ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
      //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
      //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

      if      Trim(PE_appemp.Text) = '' then  ParamByName('appemp').AsString  := '%'
      else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
      begin
        ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
        //ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
        //ParamByName('codeto').AsString  := 'ZZ';
      end
      else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);

      
      Open;

      TFloatField(FieldByName('TOTAMT')).DisplayFormat    := '#,###';
      TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
      //Edit1.text:=sql.text;
    end;

    with Ora_Sql5 do
    begin
      Close;
      Sql.Clear;
      SQL.Add('SELECT COUNT(DISTINCT EMPNO) EMPCNT,SUM(PLAYAMT)-SUM(EXCEPTAMT)+nvl(sum(SETAMT),0) PLAYAMT ');
      SQL.Add('  FROM PSHAPLAY                                                                            ');
      SQL.Add(' WHERE APPDATE =:appdate2                                                                  ');
      SQL.Add('   AND CONYN   =''Y''                                                                      ');
      ParamByName('appdate2').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
      open;
      BE_Playsum.Text := '체육활동비 '+FieldByName('EMPCNT').AsString +'명'+
                          FormatFloat('#,##0',FieldByName('PLAYAMT').AsFloat) + '원 입니다';
    end;

    Send_Select;
  end
  else if PageControl1.ActivePage = TabSheet2 then    //체육활동
  begin
    DataSource1.DataSet := Ora_Sql2;
    Ora_Sql2.FetchRows := 5000;
    with Ora_Sql2 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT COUNT( DISTINCT A.EMPNO) OVER() COUNT1 , APPDATE, A.EMPNO,     ');
        Sql.Add('       '''' MEGUBUN, A.KORNAME, SEQ, PLAYDATE, PLAYITEM, PLAYAMT,     ');
        Sql.Add('       division, division2, CORPNAME, CORPTEL, CONYN, CONYNSAYU,      ');
        Sql.Add('       EXCEPTAMT, SETAMT, PREAMT, SETCOMM, DEPTNAME,                  ');
        Sql.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        Sql.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,      ');
        Sql.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        Sql.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,        ');
        Sql.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        Sql.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,      ');
        Sql.Add('       substr(STARTYYMM,1,4)||''-''||substr(STARTYYMM,5,2) STARTYYMM, ');
        Sql.Add('       substr(ENDYYMM,1,4)||''-''||substr(ENDYYMM,5,2)     ENDYYMM,   ');
        Sql.Add('        (SELECT COUNT(*) FROM PSHPHOT                                 ');
        Sql.Add('         WHERE APPDATE = A.APPDATE                                    ');
        Sql.Add('           AND EMPNO   = A.EMPNO                                      ');
        Sql.Add('           AND SEQ     = A.SEQ) SSEQ, COMMENTS, CONSAYU, A.WRITETIME  ');
        Sql.Add('  FROM PSHAPLAY A, PIMPMAS B, PYCDEPT C                               ');
        Sql.Add(' WHERE A.EMPNO    = B.EMPNO                                           ');
        Sql.Add('   AND APPDATE    =:appdate                                           ');
        Sql.Add('   AND B.ORGNUM   = C.ORGNUM                                          ');
        Sql.Add('   AND B.DEPTCODE = C.DEPTCODE                                        ');
        Sql.Add('   AND A.EMPNO    Like :appemp                                        ');
        //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto                         ');
//      SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록

        if      CB_conyn.Text = '전체'   then SQL.Add('')
        else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN IS NULL ')
        else
        begin
          SQL.Add(' AND CONYN  = :conyn ');
          ParamByName('conyn').AsString  := CB_conyn.Text;
        end;

        if RG_sort.ItemIndex = 0 then  SQL.Add(' Order by empno  ')
        Else                           SQL.Add(' Order by WRITETIME  ');

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        if Trim(PE_appemp.Text) = '' then
          ParamByName('appemp').AsString  := '%'
        else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
        begin
          ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
          //ParamByName('codefr').AsString  := '00';  // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
          //ParamByName('codeto').AsString  := 'ZZ';
        end
        else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);
        //Edit1.text := sql.text;
        Open;

        TFloatField(FieldByName('PLAYAMT')).DisplayFormat   := '#,###';
        TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
        TFloatField(FieldByName('SETAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('PREAMT')).DisplayFormat    := '#,###';
      end; //with Ora_Sql2 do

//20091112 KTH 추가 제외내역 처리

      with Ora_Sql4 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT APPDATE, A.EMPNO, A.KORNAME, SEQ, PLAYDATE, PLAYITEM, PLAYAMT, ');
        Sql.Add('       division, division2, CORPNAME, CORPTEL, CONYN, CONYNSAYU,      ');
        Sql.Add('       EXCEPTAMT, SETAMT, PREAMT, SETCOMM, DEPTNAME,                  ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        SQL.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,      ');
        Sql.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        Sql.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,        ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
        SQL.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,      ');
        Sql.Add('       substr(STARTYYMM,1,4)||''-''||substr(STARTYYMM,5,2) STARTYYMM, ');
        Sql.Add('       substr(ENDYYMM,1,4)||''-''||substr(ENDYYMM,5,2)     ENDYYMM    ');//시작일자, 종료일자 추가.. 2006.05.
        SQL.Add('  FROM PSHAPLAY A, PIMPMAS B, PYCDEPT C');
        SQL.Add(' WHERE A.EMPNO    = B.EMPNO    ');
        SQL.Add('   AND APPDATE    =:appdate    ');
        SQL.Add('   AND B.ORGNUM   = C.ORGNUM   ');
        SQL.Add('   AND B.DEPTCODE = C.DEPTCODE ');
        Sql.Add('   AND A.EMPNO    Like :appemp ');
        Sql.Add('   AND A.CONYN    = ''Y''      ');
        //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록

        if      CB_conyn.Text = '전체'   then SQL.Add(' Order by empno  ')
        else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN  IS NULL   Order by empno ')
        else
        begin
          SQL.Add(' AND CONYN  = :conyn  Order by empno ');
          ParamByName('conyn').AsString  := CB_conyn.Text;
        end;

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        if Trim(PE_appemp.Text) = '' then
          ParamByName('appemp').AsString  := '%'
        else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
        begin
          ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
          //ParamByName('codefr').AsString  := '00';  // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
          //ParamByName('codeto').AsString  := 'ZZ';
        end
        else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);
  //      SQL.SAVETOFILE('C:\AA.SQL');

        Open;

        {TFloatField(FieldByName('PLAYAMT')).DisplayFormat   := '#,###';
        TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
        TFloatField(FieldByName('SETAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('PREAMT')).DisplayFormat    := '#,###';}
      end; //with Ora_Sql2 do

//20091112 KTH 추가 제외내역 처리 끝

  end
  else if PageControl1.ActivePage = TabSheet3 then
  begin
    if      (CheckBox1.Checked) and (CheckBox2.Checked) and (CheckBox3.Checked) then partgubun := 'A'+''','''+'B'+''','''+'D'
    else if (CheckBox1.Checked) and (CheckBox2.Checked) then                         partgubun := 'A'+''','''+'B'
    else if (CheckBox1.Checked) and (CheckBox3.Checked) then                         partgubun := 'A'+''','''+'D'
    else if (CheckBox2.Checked) and (CheckBox3.Checked) then                         partgubun := 'B'+''','''+'D'
    else if (CheckBox1.Checked) then                                                 partgubun := 'A'
    else if (CheckBox2.Checked) then                                                 partgubun := 'B'
    else if (CheckBox3.Checked) then                                                 partgubun := 'D';

    DataSource1.DataSet := Ora_Sql3;
    Ora_Sql3.FetchRows := 5000;
    with Ora_Sql3 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT APPDATE, PART, EMPNO, KORNAME, DEPTNAME, FAMINAME, FAMIREL,   ');
      Sql.Add('       FAMIRELNAME, APPAMT, APPSUM, EXTAMT, EXTSUM, CONAMT, CONSUM,  ');
      Sql.Add('       SETAMT, SETSUM, DECODE(SIGN(JANSUM), -1, 0, JANSUM) JANSUM,   ');
      Sql.Add('       SUPAMT, SUPSUM,  JOBPLACE, PAYCLNAME, PSTATENAME FROM (       ');
      Sql.Add('SELECT APPDATE, DECODE(PART,''A'',''의료비(일반)'',''B'',''체육'',   ');
      Sql.Add('                            ''D'',''의료비(중증)'','''') PART,       ');
      Sql.Add('       A.EMPNO, A.KORNAME, DEPTNAME, A.FAMINAME, A.FAMIREL,          ');
      Sql.Add('      (SELECT CODENAME FROM PKMYSCOD                                 ');
      Sql.Add('        WHERE CODENO = A.FAMIREL) FAMIRELNAME,                       ');
      Sql.Add('       APPAMT, APPSUM, EXTAMT, EXTSUM,                               ');
      Sql.Add('       CONAMT, CONSUM, SETAMT, SETSUM,                               ');
      Sql.Add('       NVL(TO_NUMBER(                                                ');
      Sql.Add('       (SELECT ((SELECT DECODE(A.PART, ''A'', GIVEMAX2, ''B'',       ');
//      Sql.Add('                        (FINDSPEC(SUBSTR(A.APPDATE,1,4 ), A.EMPNO)), ');
      Sql.Add('                        (HPER.FINDSPEC('''+ copy(FL_MaxApp,1,4) +''', A.EMPNO)), ');
      Sql.Add('                        ''D'',GIVEMAX4)                              ');
      Sql.Add('                 FROM PSCAPBAS) - SUPSUM)                            ');
      Sql.Add('        FROM PSHAPSUM                                                ');
      Sql.Add('        WHERE APPDATE = A.APPDATE                                    ');
      Sql.Add('          AND PART    = A.PART                                       ');
      Sql.Add('          AND EMPNO   = A.EMPNO                                      ');
      Sql.Add('          AND APPDATE > ''2015'')),0) JANSUM,                        ');
      Sql.Add('       SUPAMT, SUPSUM,                                               ');
      Sql.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      Sql.Add('        WHERE CODEID = ''I160'' AND CODENO = A.JOBPLACE) JOBPLACE,   ');
      Sql.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      Sql.Add('        WHERE CODEID = ''I112'' AND CODENO = B.PAYCL)    PAYCLNAME,  ');
      SQL.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      SQL.Add('        WHERE CODEID = ''I114'' AND CODENO = B.PSTATE)   PSTATENAME  ');
      Sql.Add('  FROM PSHAPSUM A, PIMPMAS B, PYCDEPT C                              ');
      SQL.Add(' WHERE A.EMPNO    = B.EMPNO                                          ');
      SQL.Add('   AND APPDATE    =:appdate                                          ');
      SQL.Add('   AND A.EMPNO NOT LIKE ''M%''                                        ');
      SQL.Add('   AND B.ORGNUM   = C.ORGNUM                                         ');
      SQL.Add('   AND B.DEPTCODE = C.DEPTCODE                                       ');
      Sql.Add('   AND PART IN ( '''+ partgubun +''' )                               ');
      Sql.Add('   AND A.EMPNO    Like :appemp                                       ');
      //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto                        ');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록
      SQL.Add(' Order by 2, 3 )');

      ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
      //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
      //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

      if Trim(PE_appemp.Text) = '' then
        ParamByName('appemp').AsString  := '%'
      else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
      begin
        ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
        //ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...
        //ParamByName('codeto').AsString  := 'ZZ';
      end
      else
        MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);

      Open;

      //edit1.Text := sql.Text;

      TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SETAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SETSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('JANSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,##0';

    end;  //with Ora_Sql3 do

  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
    DataSource1.DataSet := Ora_Sql5;
    Ora_Sql5.FetchRows  := 5000;
       if Trim(PE_appemp.Text) <> '' then
       begin
             with Ora_Sql5 do
             begin
                  Close;
                  Sql.Clear;
                  SQL.Add('SELECT COUNT( DISTINCT A.EMPNO) OVER() COUNT1 , APPDATE, A.EMPNO,     ');
                  SQL.Add('       A.KORNAME,  SEQ, FAMINAME, FAMIJUMIN,                          ');
                  SQL.Add('       MEDIDATE, MEDCOMM, CORPNO, CORPNAME,                           ');
                  SQL.Add('       NVL(CASHAMT,0)+NVL(CARDAMT,0)  TOTAMT,                         ');
                  SQL.Add('       CONYN,  CONYNSAYU, EXCEPTAMT,  DEPTNAME,                       ');
                  SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
                  SQL.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,      ');
                  SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
                  SQL.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,        ');
                  SQL.Add('      (SELECT CODENAME FROM PYCCODE                                   ');
                  SQL.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,      ');
                  SQL.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE CODENO=A.FAMIREL) RELNAME  ');
                  SQL.Add('  FROM PSHAPHOS A, PIMPMAS B, PYCDEPT C                               ');
                  SQL.Add(' WHERE A.EMPNO    = B.EMPNO                                           ');
                  SQL.Add('   AND MEDIDATE   like :medidate                                      ');
                  SQL.Add('   AND B.ORGNUM   = C.ORGNUM                                          ');
                  SQL.Add('   AND B.DEPTCODE = C.DEPTCODE                                        ');
                  SQL.Add('   AND A.EMPNO    = :appemp                                           ');

                  ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
                  if  Copy(CE_appdate.Text,8,2) <= '02' then
                      ParamByName('medidate').AsString  :=  inttostr(strtoint(Copy(CE_appdate.Text,1,4))-1)
                  else
                      ParamByName('medidate').AsString  :=  Copy(CE_appdate.Text,1,4)+'%';
                  Open;
                  TFloatField(FieldByName('TOTAMT')).DisplayFormat    := '#,###';
                  TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
            end;
       end;
  end
  else if PageControl1.ActivePage = TabSheet5 then
  begin
    DataSource1.DataSet := Ora_Sql1;
    Ora_Sql1.FetchRows  := 5000;
    with Ora_Sql1 do
      begin
        Close;
        Sql.Clear;
        SQL.Add('SELECT COUNT( DISTINCT A.EMPNO) OVER() COUNT1 , APPDATE, A.EMPNO,   ');
        SQL.Add('       A.KORNAME,DECODE(MEGUBUN, 1, ''중증'', ''일반'') MEGUBUN,  SEQ, FAMINAME, FAMIJUMIN, ');
        SQL.Add('       MEDIDATE, MEDCOMM, CORPNO, CORPNAME,                         ');
        SQL.Add('       NVL(CASHAMT,0)+NVL(CARDAMT,0)  TOTAMT,                       ');
        SQL.Add('       CONYN,  CONYNSAYU, EXCEPTAMT,  DEPTNAME,A.FAMIREL ,A.FGUBUN, ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,    ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,      ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,    ');
        SQL.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE CODENO=A.FAMIREL) RELNAME');
        SQL.Add('  FROM PSHAPHOS A, PIMPMAS B, PYCDEPT C');
        SQL.Add(' WHERE A.EMPNO    = B.EMPNO   ');
        SQL.Add('   AND APPDATE    =:appdate   ');
        SQL.Add('   AND B.ORGNUM   = C.ORGNUM  ');
        SQL.Add('   AND B.DEPTCODE = C.DEPTCODE');
        Sql.Add('   AND A.EMPNO    Like :appemp ');
        Sql.Add('   AND A.EMPNO    Like ''M%''  ');
        //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록
        //Edit1.text := sql.text;
        if      CB_conyn.Text = '전체'   then SQL.Add(' Order by empno  ')
        else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN  IS NULL  Order by empno ')
        else
        begin
          SQL.Add(' AND CONYN  = :conyn  Order by empno ');
          ParamByName('conyn').AsString  := CB_conyn.Text;
        end;

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        if      Trim(PE_appemp.Text) = '' then  ParamByName('appemp').AsString  := '%'
        else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
        begin
          ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
          //ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
          //ParamByName('codeto').AsString  := 'ZZ';
        end
        else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);
        Open;

        TFloatField(FieldByName('TOTAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
      end;

      with Ora_Sql5 do
      begin
        Ora_Sql5.Close;
        Ora_Sql5.Sql.Clear;
        Ora_Sql5.SQL.Add('SELECT COUNT(DISTINCT EMPNO) EMPCNT,SUM(PLAYAMT)-SUM(EXCEPTAMT)+nvl(sum(SETAMT),0) PLAYAMT FROM PSHAPLAY     ');
        Ora_Sql5.SQL.Add('WHERE APPDATE =:appdate2                                                  ');
        Ora_Sql5.SQL.Add('  AND  CONYN =''Y''                                                 ');
        Ora_Sql5.ParamByName('appdate2').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        Ora_Sql5.open;
        BE_Playsum.Text := '체육활동비 '+FieldByName('EMPCNT').AsString +'명'+
                           FormatFloat('#,##0',FieldByName('PLAYAMT').AsFloat) + '원 입니다';

      end;
  end
  else if PageControl1.ActivePage = TabSheet6 then
  begin
    if(Length(Copy(Trim(PE_appemp.Text),1,4)) <> 4) then
    begin
         ShowMessage('신청사원란에 심사할 사원을 조회후 작업을 진행하세요.');
         PE_appemp.SetFocus;
         exit;
    end;

    Ora_Hos1.FetchRows  := 5000;

    with Ora_Hos1 do
      begin
        Close;
        Sql.Clear;
        SQL.Add('SELECT DISTINCT appdate, empno, FAMINAME,FAMIJUMIN, CORPNO,   ');
        SQL.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE CODENO=A.FAMIREL) RELNAME');
        SQL.Add('  FROM PSHAPHOS A');
        SQL.Add(' WHERE APPDATE    =:appdate   ');
        Sql.Add('   AND A.EMPNO    Like :appemp ');
        //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');

        if      CB_conyn.Text = '전체'   then SQL.Add(' Order by 1,2,3  ')
        else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN  IS NULL  Order by empno ')
        else
        begin
          SQL.Add(' AND CONYN  = :conyn  Order by empno ');
          ParamByName('conyn').AsString  := CB_conyn.Text;
        end;

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
        begin
          ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
          //ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
          //ParamByName('codeto').AsString  := 'ZZ';
        end
        else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);

        Open;
      end;
  end
  else if PageControl1.ActivePage = TabSheet7 then
  begin
    PE_appemp.Text := '';
    DataSource3.DataSet := Ora_Sql7;
    Ora_Sql7.FetchRows  := 5000;
    with Ora_Sql7 do
      begin
        Close;
        Sql.Clear;
        SQL.Add('SELECT DISTINCT A.EMPNO, A.KORNAME    ');
        SQL.Add('  FROM PSHAPHOS A                     ');
        SQL.Add(' WHERE APPDATE    =:appdate           ');
        Sql.Add('   AND A.EMPNO NOT Like ''M%''        ');
        //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');
        SQL.Add('   AND CONYN  = ''N'' order by empno ');

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        Open;
      end;
  end
  else if PageControl1.ActivePage = TabSheet8 then //임원의료비 당월승인 탭추가 20171102
  begin
    if      (CheckBox1.Checked) and (CheckBox2.Checked) and (CheckBox3.Checked) then partgubun := 'A'+''','''+'B'+''','''+'D'
    else if (CheckBox1.Checked) and (CheckBox2.Checked) then                         partgubun := 'A'+''','''+'B'
    else if (CheckBox1.Checked) and (CheckBox3.Checked) then                         partgubun := 'A'+''','''+'D'
    else if (CheckBox2.Checked) and (CheckBox3.Checked) then                         partgubun := 'B'+''','''+'D'
    else if (CheckBox1.Checked) then                                                 partgubun := 'A'
    else if (CheckBox2.Checked) then                                                 partgubun := 'B'
    else if (CheckBox3.Checked) then                                                 partgubun := 'D';

    DataSource2.DataSet := Ora_Sql8;
    Ora_Sql8.FetchRows := 5000;
    with Ora_Sql8 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT APPDATE, PART, EMPNO, KORNAME, DEPTNAME, FAMINAME, FAMIREL,   ');
      Sql.Add('       FAMIRELNAME, APPAMT, APPSUM, EXTAMT, EXTSUM, CONAMT, CONSUM,  ');
      Sql.Add('       SETAMT, SETSUM,DECODE(FGUBUN,''0'',''본인'',''1'',''가족'',''2'',''부모'') FGUBUN,    ');  //DECODE(SIGN(JANSUM), -1, 0, JANSUM) JANSUM,
      Sql.Add('       SUPAMT, SUPSUM,  JOBPLACE, PAYCLNAME, PSTATENAME FROM (       ');
      Sql.Add('SELECT APPDATE, DECODE(PART,''A'',''의료비(일반)'',''B'',''체육'',   ');
      Sql.Add('                            ''D'',''의료비(중증)'','''') PART,       ');
      Sql.Add('       A.EMPNO, A.KORNAME, DEPTNAME, A.FAMINAME, A.FAMIREL,          ');
      Sql.Add('      (SELECT CODENAME FROM PKMYSCOD                                 ');
      Sql.Add('        WHERE CODENO = A.FAMIREL) FAMIRELNAME,A.FGUBUN,                       ');
      Sql.Add('       APPAMT, APPSUM, EXTAMT, EXTSUM,                               ');
      Sql.Add('       CONAMT, CONSUM, SETAMT, SETSUM,                               ');
      {Sql.Add('       NVL(TO_NUMBER(                                                ');
      Sql.Add('       (SELECT ((SELECT DECODE(A.PART, ''A'', GIVEMAX2, ''B'',       ');
//      Sql.Add('                        (FINDSPEC(SUBSTR(A.APPDATE,1,4 ), A.EMPNO)), ');
      Sql.Add('                        (HPER.FINDSPEC('''+ copy(FL_MaxApp,1,4) +''', A.EMPNO)), ');
      Sql.Add('                        ''D'',GIVEMAX4)                              ');
      Sql.Add('                 FROM PSCAPBAS) - SUPSUM)                            ');
      Sql.Add('        FROM PSHAPSUM                                                ');
      Sql.Add('        WHERE APPDATE = A.APPDATE                                    ');
      Sql.Add('          AND PART    = A.PART                                       ');
      Sql.Add('          AND EMPNO   = A.EMPNO                                      ');
      Sql.Add('          AND FAMINAME   = A.FAMINAME                                ');
      Sql.Add('          AND APPDATE > ''2015'')),0) JANSUM,                        ');}
      Sql.Add('       SUPAMT, SUPSUM,                                               ');
      Sql.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      Sql.Add('        WHERE CODEID = ''I160'' AND CODENO = A.JOBPLACE) JOBPLACE,   ');
      Sql.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      Sql.Add('        WHERE CODEID = ''I112'' AND CODENO = B.PAYCL)    PAYCLNAME,  ');
      SQL.Add('      (SELECT CODENAME FROM PYCCODE                                  ');
      SQL.Add('        WHERE CODEID = ''I114'' AND CODENO = B.PSTATE)   PSTATENAME  ');
      Sql.Add('  FROM PSHAPSUM A, PIMPMAS B, PYCDEPT C                              ');
      SQL.Add(' WHERE A.EMPNO    = B.EMPNO                                          ');
      SQL.Add('   AND APPDATE    =:appdate                                          ');
      SQL.Add('   AND A.EMPNO  LIKE ''M%''                                          ');
      SQL.Add('   AND B.ORGNUM   = C.ORGNUM                                         ');
      SQL.Add('   AND B.DEPTCODE = C.DEPTCODE                                       ');
      Sql.Add('   AND PART IN ( '''+ partgubun +''' )                               ');
      Sql.Add('   AND A.EMPNO    Like :appemp                                       ');
      //Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto                        ');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록
      SQL.Add(' Order by 2, 3 )');

      ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
      //ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
      //ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

      if Trim(PE_appemp.Text) = '' then
        ParamByName('appemp').AsString  := '%'
      else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
      begin
        ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
        //ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...
        //ParamByName('codeto').AsString  := 'ZZ';
      end
      else
        MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);

      Open;

      //edit1.Text := sql.Text;

      TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SETAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SETSUM')).DisplayFormat := '#,##0';
      //TFloatField(FieldByName('JANSUM')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,##0';
      TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,##0';

    end;  //with Ora_Sql3 do
  end;
  E_empdate.Text := '';
  if Trim(PE_appemp.Text) <> '' then    //dsa2000  2013.01.
  begin
       with Ora_Comm do
       begin
            Close;
            Sql.Clear;
            SQL.Add('Select To_Char(To_Date(Empdate ,''YYYYMMDD''),''YYYY-MM-DD'') Empdate ');
            SQL.Add('  From Pimpmas                                                        ');
            SQL.Add(' Where EMPNO  = :appemp                                               ');
            ParamByName('appemp').AsString := Copy(Trim(PE_appemp.Text),1,4);
            Open;
            E_empdate.Text := FieldByname('Empdate').AsString;
       end;

       with Ora_Exdu do
       begin
            Close;
            Sql.Clear;
            SQL.Add('Select A.Empno, A.Excode,                                                             ');
            SQL.Add('       To_Char(To_Date(A.Exfrdate,''YYYYMMDD''),''YYYY-MM-DD'') Exfrdate,             ');
            SQL.Add('       To_Char(To_Date(A.Extodate,''YYYYMMDD''),''YYYY-MM-DD'') Extodate,             ');
            SQL.Add('      (Select Codename From Pyccode Where Codeid=''I310'' And Codeno=A.Excode) Exname ');
            SQL.Add('  From Pihexdu A                                                                      ');
            SQL.Add(' Where Exfrdate >= To_Char(Add_Months(Sysdate,-24),''yyyy'')||''0101''                ');
            Sql.Add('   And A.EMPNO  = :appemp                                                             ');
            SQL.Add(' Order by A.Exfrdate Desc                                                             ');
            ParamByName('appemp').AsString := Copy(Trim(PE_appemp.Text),1,4);
            Open;
       end;
       L_ExduCnt.Caption := IntToStr(Ora_Exdu.RecordCount)+' 건';
       if Ora_Exdu.RecordCount <= 1 then Grid_Exdu.Height := 45;
       if Ora_Exdu.RecordCount >  1 then Grid_Exdu.Height := 60;
  end;

  SB_Help.Panels[1].Text := ' 조회 완료';
end;

//승인저장
procedure TFM_Mainform.BT_Y_SaveClick(Sender: TObject);
var
   i : Integer;
begin
  if PageControl1.ActivePage = TabSheet1 then   //의료비
  begin
      if  Ora_Sql1.FieldByName('COUNT1').AsFloat >  1 then
      begin
        MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;
    
    if (NE_Except.Value > 0) and (E_bigo.Text = '') then
      begin
        MessageDlg('제외금액 사유를 입력하여 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;
  end
  else if PageControl1.ActivePage = TabSheet6 then   //의료비심사 개인
  begin
      if  Ora_Hos3.FieldByName('COUNT1').AsFloat >  1 then
      begin
        MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;

    if (NE_Except.Value > 0) and (E_bigo.Text = '') then
      begin
        MessageDlg('제외금액 사유를 입력하여 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;
  end
  else if PageControl1.ActivePage = TabSheet2 then  //체육활동.
  begin
(*
    if  Ora_Sql2.FieldByName('COUNT1').AsFloat >  1 then
      begin
        MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;
*)
    if  Ora_Sql2.FieldByName('CONYN').AsString =  'Y' then
      begin
        MessageDlg('승인 완료된 자료입니다.', mtInformation,[mbOk], 0);
        System.Exit;
      end;


    if (NE_Setamt.Value > 0) and (E_setcomm.Text = '') then
      begin
        MessageDlg('조정금액 사유를 입력하여 주시기 바랍니다', mtInformation,[mbOk], 0);
        System.Exit;
      end;

    if (DbGrid2.SelectedRows.Count > 1) then
    begin
      if MessageDlg('최종선택한 전월이월금액, 조정금액, 조정사유 등의 값으로'+#13+#13+
                    '전부를 승인 처리하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      System.Exit;
    end;

    if MessageDlg(' 승인 처리하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then System.Exit;
  end;

  FL_SaveClick := True;
  if PageControl1.ActivePage = TabSheet1 then
  begin
    if not Ora_Sql1.Active then    System.Exit;
    if (DbGrid1.SelectedRows.Count < 1) and (not Chk_All.Checked) then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

    MD_DataAppend1(DbGrid1, Ora_Sql1);  // 의료비 승인저장(메모리)
    DataSave('PSHAPHOS');               // 의료비 승인저장(Table)
    DbGrid1.SelectedRows.Clear;
  end
  else if PageControl1.ActivePage = TabSheet6 then //2013.01. hjku 의료비심사(개인)
  begin
    if not Ora_Hos3.Active then    System.Exit;
    if (DbGrid6_3.SelectedRows.Count < 1) and (not Chk_All.Checked) then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

    MD_DataAppend1(DbGrid6_3, Ora_Hos3);  // 의료비 승인저장(메모리)
    DataSave('PSHAPHOS');                 // 의료비 승인저장(Table)
    DbGrid6_3.SelectedRows.Clear;
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    if not Ora_Sql2.Active then    System.Exit;
    if DbGrid2.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

    MD_DataAppend1(DbGrid2, Ora_Sql2);  // 체육활동 승인저장(메모리)
    DataSave('PSHAPLAY');               // 체육활동 승인저장(Table)
    DbGrid2.SelectedRows.Clear;
  end
  else if PageControl1.ActivePage = TabSheet5 then
  begin
    if not Ora_Sql1.Active then    System.Exit;
    if (DbGrid5.SelectedRows.Count < 1) and (not Chk_All.Checked) then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

    MD_DataAppend1(DbGrid5, Ora_Sql1);  // 의료비 승인저장(메모리)
    DataSave('PSHAPHOS');               // 의료비 승인저장(Table)
    DbGrid5.SelectedRows.Clear;
  end
  else
    System.Exit;

  FL_SaveClick := False;
  BT_Search1Click(Sender);
//  NE_division2.Value := 0;
  SB_Help.Panels[1].Text := ' 승인 저장 완료';
end;

//비승인저장
procedure TFM_Mainform.BT_N_SaveClick(Sender: TObject);
var
   i : Integer;
   NotStr : String;
begin
  If (TOnFocusButton(Sender).Tag = 2) Then
  Begin
    NotStr := '비승인';
    NotChk := 0;
  End Else
  Begin
    NotStr := '비지원';
    NotChk := 1;
  End;

  if E_bigo.Text = '' then
  begin
    MessageDlg(NotStr + ' 사유를 입력하여 주시기 바랍니다', mtInformation,[mbOk], 0);
    System.Exit;
  end
  else if (E_bigo.Text <> '') and ((DbGrid1.SelectedRows.Count >1) or (DbGrid2.SelectedRows.Count >1)) then
  begin
    if MessageDlg('입력하신 '+NotStr+ '사유로 선택한 사원 전부를 '+NotStr+' 처리하시겠습니까?',
       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    System.Exit;
  end;

  if DBGrid2.SelectedRows.Count > 1 then
    MessageDlg('다중선택후 승인저장시 전월이월금액, 조정금액, 조정사유 등이 '+#13+#13+
               '최종선택 내용으로 같이 등록됨을 주의하시기 바랍니다', mtInformation,[mbOk], 0);

  FL_SaveClick := True;
  if PageControl1.ActivePage = TabSheet1 then
  begin
    if not Ora_Sql1.Active then    System.Exit;
    if DbGrid1.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    if  Ora_Sql1.FieldByName('COUNT1').AsFloat >  1 then
    begin
      MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    MD_DataAppend2(DbGrid1, Ora_Sql1);   // 의료비 비승인저장
    DataSave('PSHAPHOS');
  end
  else if PageControl1.ActivePage = TabSheet5 then
  begin
    if not Ora_Sql1.Active then    System.Exit;
    if DbGrid5.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    if  Ora_Sql1.FieldByName('COUNT1').AsFloat >  1 then
    begin
      MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    MD_DataAppend2(DbGrid5, Ora_Sql1);   // 의료비 비승인저장
    DataSave('PSHAPHOS');
  end
  else if PageControl1.ActivePage = TabSheet6 then
  begin
    if not Ora_Hos3.Active then    System.Exit;
    if DbGrid6_3.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    if  Ora_Hos3.FieldByName('COUNT1').AsFloat >  1 then
    begin
      MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    MD_DataAppend2(DbGrid6_3, Ora_Hos3);   // 의료비 비승인저장
    DataSave('PSHAPHOS');
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    if not Ora_Sql2.Active then    System.Exit;
    if DbGrid2.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;

    if  Ora_Sql2.FieldByName('COUNT1').AsFloat >  1 then
    begin
      MessageDlg('사원 조회 후 사용해 주시기 바랍니다', mtInformation,[mbOk], 0);
      System.Exit;
    end;
    MD_DataAppend2(DbGrid2, Ora_Sql2);  // 체육활동 비승인저장
    DataSave('PSHAPLAY');
  end;

  FL_SaveClick := False;
  DbGrid2.SelectedRows.Clear;
  BT_Search1Click(Sender);
  SB_Help.Panels[1].Text := NotStr+' 저장 완료';
end;

//승인저장 MD_Data
procedure TFM_Mainform.MD_DataAppend1(DBGrid : TDBGrid; DataSet : TDataSet);
var
   i : Integer;
   cur_exceptsum : double;
begin
  MD_Data.Close;

  if not Chk_All.Checked  then
  begin
       for i := 0 to DBGrid.SelectedRows.Count -1 do
       begin
            DataSet.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
            MD_Data.Open;
            MD_Data.Append;
            MD_Data.FieldByName('appdate').AsString    := DataSet.FieldByName('appdate').AsString;
            MD_Data.FieldByName('empno').AsString      := DataSet.FieldByName('empno').AsString;
            MD_Data.FieldByName('seq').AsString        := DataSet.FieldByName('seq').AsString;
            //추가 20171020 임원의료비 지원금액 가족합산으로 변경
            if (PageControl1.ActivePage = TabSheet5)  then
               MD_Data.FieldByName('fgubun').AsString     := DataSet.FieldByName('fgubun').AsString;
           
               
            If (DataSet.FieldByName('megubun').AsString = '중증') Then
              MD_Data.FieldByName('megubun').AsString  := '1'
            Else
              MD_Data.FieldByName('megubun').AsString  := '0';
            if (PageControl1.ActivePage <> TabSheet5)  then
                 MD_Data.FieldByName('faminame').AsString   := ''
            else
                 MD_Data.FieldByName('faminame').AsString   := DataSet.FieldByName('faminame').AsString; //jissi 2013.05. 가족명 추가
            MD_Data.FieldByName('conyn').AsString      := 'Y';
            MD_Data.FieldByName('conynsayu').AsString  := E_bigo.Text;

            if ((PageControl1.ActivePage = TabSheet1) or (PageControl1.ActivePage = TabSheet5) or (PageControl1.ActivePage = TabSheet6)) then
               MD_Data.FieldByName('exceptamt').AsFloat := NE_Except.Value
            else if PageControl1.ActivePage = TabSheet2 then
            begin
            
              MD_Data.FieldByName('playamt').AsString  := DataSet.FieldByName('playamt').AsString;
              MD_Data.FieldByName('exceptamt').AsFloat := DataSet.FieldByName('exceptamt').AsFloat;   //체크
              MD_Data.FieldByName('setcomm').AsString  := E_setcomm.Text;
              MD_Data.FieldByName('consayu').AsString  := E_Consayu.Text;
              MD_Data.FieldByName('setamt').AsFloat    := NE_Setamt.Value;
              MD_Data.FieldByName('preamt').AsFloat    := NE_Preamt.Value;
              MD_Data.FieldByName('division2').AsFloat := NE_division2.Value;
            end;
            MD_Data.Post;
            DBGrid.SelectedRows.CurrentRowSelected := True;
            DataSet.Next;
       end;
  end;

  //의료비 1명씩 일괄 승인 가능토록 추가....dsa2000   2007.12.
  if (Chk_All.Checked) and ((PageControl1.ActivePage = TabSheet1) or (PageControl1.ActivePage = TabSheet5) or (PageControl1.ActivePage = TabSheet6)) then
  begin
    for i := 0 to Ora_Sql1.RecordCount do
    begin
      MD_Data.Open;
      MD_Data.Append;
      MD_Data.FieldByName('appdate').AsString   := DataSet.FieldByName('appdate').AsString;
      MD_Data.FieldByName('empno').AsString     := DataSet.FieldByName('empno').AsString;
      MD_Data.FieldByName('seq').AsString       := DataSet.FieldByName('seq').AsString;
      if (PageControl1.ActivePage = TabSheet5)  then       //추가 20171020
      MD_Data.FieldByName('fgubun').AsString    := DataSet.FieldByName('fgubun').AsString;

      If (DataSet.FieldByName('megubun').AsString = '중증') Then
        MD_Data.FieldByName('megubun').AsString := '1'
      Else
        MD_Data.FieldByName('megubun').AsString := '0';
      if (PageControl1.ActivePage <> TabSheet5)  then
        MD_Data.FieldByName('faminame').AsString:= ''
      else
        MD_Data.FieldByName('faminame').AsString:= DataSet.FieldByName('faminame').AsString; //jissi 2013.05. 가족명 추가
      MD_Data.FieldByName('conyn').AsString     := 'Y';
      MD_Data.FieldByName('conynsayu').AsString := E_bigo.Text;
      MD_Data.FieldByName('exceptamt').AsFloat  := NE_Except.Value;
      MD_Data.Post;
      DBGrid.SelectedRows.CurrentRowSelected    := True;
      DataSet.Next;
    end;
  end;

  MD_Data.EnableControls;
  MD_Data.first;
end;

//비승인, 비지원 저장 MD_Data
procedure TFM_Mainform.MD_DataAppend2(DBGrid : TDBGrid; DataSet : TDataSet);
var
   i : Integer;
begin
  MD_Data.Close;
  for i := 0 to DBGrid.SelectedRows.Count -1 do
    begin
      DataSet.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
      if PageControl1.ActivePage = TabSheet2 then
      begin
        AutoSum_DataChk(DataSet.FieldByName('empno').AsString,
                        DataSet.FieldByName('seq').AsString);  //전월 분할신청 Data 인지 체크...
      end;


      MD_Data.Open;
      MD_Data.Append;
      if not FL_DataChk then                                 //Save 항목에서 제외 시킴.
      begin
        MD_Data.FieldByName('appdate').AsString    := DataSet.FieldByName('appdate').AsString;
        MD_Data.FieldByName('empno').AsString      := DataSet.FieldByName('empno').AsString;
        MD_Data.FieldByName('seq').AsString        := DataSet.FieldByName('seq').AsString;
        If (DataSet.FieldByName('megubun').AsString = '중증') Then
          MD_Data.FieldByName('megubun').AsString  := '1'
        Else
          MD_Data.FieldByName('megubun').AsString  := '0';
        if (PageControl1.ActivePage <> TabSheet5)  then
             MD_Data.FieldByName('faminame').AsString := ''
        else
             MD_Data.FieldByName('faminame').AsString := DataSet.FieldByName('faminame').AsString;   //jissi 2013.05. 가족명 추가
        If NotChk = 0 Then MD_Data.FieldByName('conyn').AsString := 'N'  //비승인
        Else               MD_Data.FieldByName('conyn').AsString := 'X'; //비지원
        MD_Data.FieldByName('conynsayu').AsString  := E_bigo.Text;

        if PageControl1.ActivePage = TabSheet1 then
          MD_Data.FieldByName('exceptamt').AsFloat := NE_Except.Value
        else if PageControl1.ActivePage = TabSheet2 then
        begin
          MD_Data.FieldByName('exceptamt').AsFloat := DataSet.FieldByName('exceptamt').AsFloat;    //체크
          MD_Data.FieldByName('setcomm').AsString  := '';
          MD_Data.FieldByName('setamt').AsFloat    := 0;
          MD_Data.FieldByName('preamt').AsFloat    := 0;
          MD_Data.FieldByName('division2').AsFloat := DataSet.FieldByName('division').AsFloat; //신청개월수로 저장.
        end;
      end;
      //추가 20171020 임원의료비 지원금액 가족합산으로 변경
      if (PageControl1.ActivePage = TabSheet5)  then
      MD_Data.FieldByName('fgubun').AsString     := DataSet.FieldByName('fgubun').AsString;

      MD_Data.Post;
      DBGrid.SelectedRows.CurrentRowSelected := True;
      DataSet.Next;
    end;
  MD_Data.EnableControls;
  MD_Data.first;
end;

procedure TFM_Mainform.DataSave(sTable : String);
var
   cur_exceptsum : double;
begin
  Ora_Session.StartTransaction;
  try
    with Ora_Comm do
      begin
        MD_Data.First;
        while not MD_Data.Eof do
          begin
            if  sTable = 'PSHAPHOS' then
            begin
              Close;
              Sql.Clear;
              Sql.Add('Update PSHAPHOS                                         ');
              Sql.Add('   Set conyn     = :conyn,     conynsayu = :conynsayu,  ');
              Sql.Add('       exceptamt = :exceptamt, writeman  = :writeman,   ');
              Sql.Add('       writetime= TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')');
              Sql.Add(' WHERE appdate  = :appdate                              ');
              Sql.Add('   AND Empno    = :Empno                                ');
              Sql.Add('   AND Seq      = :Seq                                  ');
              ParamByName('conyn').AsString     := MD_Data.FieldByName('conyn').AsString;
              ParamByName('conynsayu').AsString := MD_Data.FieldByName('conynsayu').AsString;
              ParamByName('exceptamt').AsFloat  := MD_Data.FieldByName('exceptamt').AsFloat;
              ParamByName('writeman').AsString  := FG_Empno;
              ParamByName('Appdate').AsString   := MD_Data.FieldByName('Appdate').AsString;
              ParamByName('Empno').AsString     := MD_Data.FieldByName('Empno').AsString;
              ParamByName('Seq').AsString       := MD_Data.FieldByName('Seq').AsString;
              ExecSql;
            end
            else if  sTable = 'PSHAPLAY' then
            begin
              //2015.01.26.hjku.. 멜티승인처리를 위해 옮김..
              //2015.01.22.hjku.. 체육활동비 제외누계 추가..
              PL_Get_Except_Sum(MD_Data.FieldByName('empno').AsString,
                                MD_Data.FieldByName('appdate').AsString,
                                MD_Data.FieldByName('seq').AsString,
                                MD_Data.FieldByName('playamt').AsFloat,
                                cur_exceptsum);
              //2015.01.22.hjku..계산된 값으려 변경..
              //MD_Data.FieldByName('exceptamt').AsFloat := cur_exceptsum;   //체크

              Close;  //당월데이터 저장
              Sql.Clear;
              Sql.Add('Update PSHAPLAY  ');
              Sql.Add('   Set conyn    = :conyn,     conynsayu = :conynsayu,    ');
              Sql.Add('       preamt   = :preamt,    exceptamt = :exceptamt,    ');
              Sql.Add('       setamt   = :setamt,    setcomm   = :setcomm,      ');
              Sql.Add('       division2= :division2, consayu   = :consayu,      ');
              //SR-1311-0802 석수영 YG32 체육활동비 승인저장시 지원개월수 계산루틴(시작년월로 기준) 변경요청 jissi 2013.11
              //Sql.Add('     endyymm  = to_char(add_months(to_date(endyymm,''yyyymm''),-(division-:division2)),''yyyymm''), ');
              Sql.Add('       endyymm  = to_char(add_months(to_date(startyymm,''yyyymm''),:division2 - 1),''yyyymm''), ');
              Sql.Add('       conynday = TO_CHAR(SYSDATE, ''YYYYMMDD''),        ');
              Sql.Add('       writeman = :writeman,                             ');
              Sql.Add('       writetime= TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ');
              Sql.Add(' WHERE appdate  = :appdate                               ');
              Sql.Add('   AND Empno    = :Empno                                 ');
              Sql.Add('   AND Seq      = :Seq                                   ');
              ParamByName('conyn').AsString     := MD_Data.FieldByName('conyn').AsString;
              ParamByName('conynsayu').AsString := MD_Data.FieldByName('conynsayu').AsString;
              ParamByName('preamt').AsFloat     := MD_Data.FieldByName('preamt').AsFloat;
              ParamByName('consayu').AsString   := MD_Data.FieldByName('consayu').AsString;
              //2015.01.26.hjku.. 재계산값 반영
              //ParamByName('exceptamt').AsFloat  := MD_Data.FieldByName('exceptamt').AsFloat;
              ParamByName('exceptamt').AsFloat  := cur_exceptsum;
              ExceptSum := cur_exceptsum;
              ParamByName('setamt').AsFloat     := MD_Data.FieldByName('setamt').AsFloat;
              ParamByName('setcomm').AsString   := MD_Data.FieldByName('setcomm').AsString;
              ParamByName('writeman').AsString  := FG_Empno;
              ParamByName('division2').AsFloat  := MD_Data.FieldByName('division2').AsFloat;
              ParamByName('Appdate').AsString   := MD_Data.FieldByName('Appdate').AsString;
              ParamByName('Empno').AsString     := MD_Data.FieldByName('Empno').AsString;

              ParamByName('Seq').AsString       := MD_Data.FieldByName('Seq').AsString;
              ExecSql;

              If MD_Data.FieldByName('conyn').AsString = 'Y' Then
              Begin
                SMsg := '(사번 : ' + MD_Data.FieldByName('Empno').AsString + ') 승인 메일을 발송하시겠습니까?';
                if IDYes = Application.MessageBox(StrPCopy(Msg, SMsg),'[작업안내]',MB_YesNo+MB_ICONQUESTION) then Get_Mail(1);
              End
              Else
              Begin
                SMsg := '(사번 : ' + MD_Data.FieldByName('Empno').AsString + ') 비승인 메일을 발송하시겠습니까?';
                if IDYes = Application.MessageBox(StrPCopy(Msg, SMsg),'[작업안내]',MB_YesNo+MB_ICONQUESTION) then Get_Mail(2);
              SB_Help.Panels[1].Text := '   메일을 성공적으로 발송되었습니다.';
              End;
              //SB_Help.Panels[1].Text := '   메일을 성공적으로 발송되었습니다.';
            end;

            ///// 합계금액 데이터 생성 ///////////////////////////////////////// ]
            if  sTable <> 'PSHAPHOS' then
            begin
              DataSum(MD_Data.FieldByName('Appdate').AsString,
                      MD_Data.FieldByName('Empno').AsString,
                      MD_Data.FieldByName('Faminame').AsString,
                      MD_Data.FieldByName('MEGUBUN').AsString,
                      MD_Data.FieldByName('fgubun').AsString);
            end;

            if  (PageControl1.ActivePage = TabSheet5) and  (sTable = 'PSHAPHOS') then   //jissi 2013.05. 합계금액 생성 while 안으로
            begin
              DataSum(MD_Data.FieldByName('Appdate').AsString,
                      MD_Data.FieldByName('Empno').AsString,
                      MD_Data.FieldByName('Faminame').AsString,
                      MD_Data.FieldByName('MEGUBUN').AsString,
                      MD_Data.FieldByName('fgubun').AsString);
            end;

            MD_Data.Next;
          end;  // while not MD_Data.Eof do 
          if   (PageControl1.ActivePage <> TabSheet5) and (sTable = 'PSHAPHOS') then
          begin
            DataSum(MD_Data.FieldByName('Appdate').AsString,
                    MD_Data.FieldByName('Empno').AsString,
                    MD_Data.FieldByName('Faminame').AsString,
                    MD_Data.FieldByName('MEGUBUN').AsString,
                    MD_Data.FieldByName('fgubun').AsString);
          end;
      end;  //with Ora_Comm do

    Ora_Session.Commit;

  except on E : EOraError do
    begin
      Ora_Session.RollBack;
      System.Exit;
    end;
  end;
end;

procedure TFM_Mainform.BT_HelpClick(Sender: TObject);
begin
  HelpMemo1.BringToFront;
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

//지원금액 생성
procedure TFM_Mainform.DataSum(sAppdate : String; sEmpno : String; sFname : String; sMeGubun : String; sFgubun :String);
 var  iCnt     : Integer;
      BConsum  : Double;
      vPart ,paycl   : String;
      sFsupsum ,sFconsum: String;

begin
  GetSysDate;

    /// 정규직 의료비 ////////////////////////////////////////////////////////////
  if ((PageControl1.ActivePage = TabSheet1) or (PageControl1.ActivePage = TabSheet6)) then
  begin
    If sMeGubun = '1' Then vPart := 'D'
    Else                   vPart := 'A';

    with Ora_Comm do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM  PSHAPSUM               ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +''' ');
      Sql.Add('   AND PART    = '''+ vPart + '''   ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''   ');
      ExecSql;

      Close;
      Sql.Clear; //의료비 신청금액
      Sql.Add('INSERT INTO PSHAPSUM ');
      Sql.Add('(APPDATE,  PART,     EMPNO,   KORNAME,  JOBPLACE, APPAMT, APPSUM, EXTAMT, EXTSUM,    ');
      Sql.Add(' CONAMT,   CONSUM,   SETAMT,  SETSUM,   PREAMT,   PRESUM, SUPAMT, SUPSUM, WRITETIME, ');
      Sql.Add(' WRITEMAN, FAMINAME, FAMIREL, INSURAMT, CANCEAMT) '   );
      Sql.Add('SELECT  APPDATE, '''+ vPart + ''' PART, EMPNO, KORNAME, MIN(JOBPLACE) JOBPLACE,');
      Sql.Add('       SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0))  APPAMT,   ');
      Sql.Add('       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,              ');
      Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),       ');
      Sql.Add('       '''+ FG_Empno +''','''','''', 0, 0            ');
      Sql.Add('  FROM PSHAPHOS                                      ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                  ');
      Sql.Add('   AND SUBSTR(MEDIDATE,1,4) = :AppYY                 ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +'''                  ');
      Sql.Add('   AND MEGUBUN = '''+ sMeGubun +'''                  ');
      Sql.Add(' GROUP BY APPDATE, EMPNO, KORNAME          ');

      if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
         ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else
         ParamByName('AppYY').AsString := Copy(sAppdate,1,4);

      //Edit1.text := sql.text;
      ExecSql;

      Sql.Clear; // 의료비 신청합계 :당월승인금액 : 승인합계 : 당월지원금액
      Sql.Add('UPDATE PSHAPSUM  A                                                                ');
      Sql.Add('   SET APPSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) ');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''01'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                         ');
      Sql.Add('                    AND MEGUBUN = '''+ sMeGubun +'''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                                ');
      Sql.Add('       EXTAMT = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(EXCEPTAMT,0)   ');
      Sql.Add('                        + NVL(INSURAMT,0) + NVL(CANCEAMT,0) )                     ');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                              ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                         ');
      Sql.Add('                    AND MEGUBUN = '''+ sMeGubun +'''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                                ');
      Sql.Add('       EXTSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(EXCEPTAMT,0)   ');
      Sql.Add('                        + NVL(INSURAMT,0) + NVL(CANCEAMT,0) )                     ');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''01'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                         ');
      Sql.Add('                    AND MEGUBUN = '''+ sMeGubun +'''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                                ');
      Sql.Add('       CONAMT = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0))');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                              ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                         ');
      Sql.Add('                    AND MEGUBUN = '''+ sMeGubun +'''                              ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                                  ');
      Sql.Add('                  GROUP BY EMPNO),                                                ');
      Sql.Add('       CONSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0))');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''01'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                         ');
      Sql.Add('                    AND MEGUBUN = '''+ sMeGubun +'''                              ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                                  ');
      Sql.Add('                  GROUP BY EMPNO),                                                ');
      Sql.Add('       INSURAMT = :fINSURAMT, CANCEAMT = :fCANCEAMT                               ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                               ');
      Sql.Add('   AND PART    = '''+ vPart + '''                                                 ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''                                                 ');

      If (sMeGubun = '1') Then
      Begin
        ParamByName('fINSURAMT').AsFloat:= NE_INSURAMT.Value;
        ParamByName('fCANCEAMT').AsFloat:= NE_CANCEAMT.Value;
      End
      Else
      Begin
        ParamByName('fINSURAMT').AsFloat:= 0;
        ParamByName('fCANCEAMT').AsFloat:= 0;
      End;

      if (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02') then
         ParamByName('AppYY').AsString    := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else
         ParamByName('AppYY').AsString    := Copy(sAppdate,1,4);

      ExecSql;

      Close;
      Sql.Clear;
      Sql.Add('SELECT count(*) Cnt                                          ');
      Sql.Add('  FROM PSHAPSUM                                              ');
      Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');      //3월 - 2월 까지 등록 처리 KTH
      Sql.Add('   AND PART  = '''+ vPart + '''                              ');
      Sql.Add('   AND Empno = '''+ sEmpno +'''                              ');
      Sql.Add('   AND nvl(SUPSUM,0) > 0                                     ');
      if (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02') then
           ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);

      Open;
      //Edit1.text := sql.text;
      iCnt := FieldByName('Cnt').AsInteger;
      Close;

(* 의료비 계산방법 2016.1.28 HeeYong
   1. 일반질병 : 당월지원금액 = (승인누적금액 - 지원기준 최소(500,000)) / 2  <= 4,750,000(최대지원금액)
   2. 중증질병 : 당월지원금액 =  지원누적금액 / 2  <= 20,000,000(최대지원금액)
*)
      if (iCnt >= 0) and (Copy(sAppdate,5,2) = '02') then
      begin
        Sql.Clear; // 정규직 및 계약직 : 의료비 당월지원금액
        Sql.Add('UPDATE PSHAPSUM  A  SET SUPAMT                                      ');
        If (sMeGubun = '1') Then        //중증 지원최대 : 20,000,000원, 지원최소 : 0원)
         Sql.Add('    = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ DECODE(SIGN(LEAST(:GiveMax2 , ceil(A.CONAMT/2)  - (A.INSURAMT+A.CANCEAMT))),-1,0,1,LEAST(:GiveMax2 , ceil(A.CONAMT/2)  - (A.INSURAMT+A.CANCEAMT))) ')
        else
         Sql.Add('    = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ DECODE(SIGN(LEAST(:GiveMax2 , ceil((A.CONAMT-500000)/2)  - (A.INSURAMT+A.CANCEAMT))),-1,0,1,LEAST(:GiveMax2 , ceil((A.CONAMT-500000)/2)  - (A.INSURAMT+A.CANCEAMT))) ');
        Sql.Add('       FROM PSHAPSUM                                                ');
        Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''  '); //3월 - 2월 까지 등록 처리 KTH
        Sql.Add('          AND PART  = '''+ vPart + '''                              ');
        Sql.Add('          AND Empno = '''+ sEmpno +'''                              ');
        Sql.Add('        GROUP BY EMPNO )                                            ');//GROUP BY EMPNO
        Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
        Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
        Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');

        if (Copy(sAppdate,5,2) = '01') or  (Copy(sAppdate,5,2) = '02') then
            ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
        else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
        //ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1);
        //ParamByName('AppYY1').AsString := Copy(sAppdate,1,4);

         //중증 : 2천만원, 일반 : 475만원 2016.1.27 HeeYong
        If (sMeGubun = '1') Then ParamByName('GiveMax2').AsFloat:= FL_GiveMax4
        Else                     ParamByName('GiveMax2').AsFloat:= FL_GiveMax2;

        ExecSql;

      end else
      if iCnt > 0 then //당해년도 지원금 이력이 있으면
      begin
        Sql.Clear; // 정규직 및 계약직 : 의료비 당월지원금액
        Sql.Add('UPDATE PSHAPSUM  A  SET SUPAMT                                      ');
        Sql.Add('    = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ LEAST((:GiveMax2 - NVL(MAX(SUPSUM),0)), ceil(A.CONAMT/2) - (A.INSURAMT+A.CANCEAMT)) ');
        Sql.Add('       FROM PSHAPSUM                                                ');
        Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' '); //3월 - 2월 까지 등록 처리 KTH
        Sql.Add('          AND PART  = '''+ vPart + '''                              ');
        Sql.Add('          AND Empno = '''+ sEmpno +'''                              ');
        Sql.Add('        GROUP BY EMPNO )                                            ');
        Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
        Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
        Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');
        if (Copy(sAppdate,5,2) = '01') or  (Copy(sAppdate,5,2) = '02') then
            ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
        else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
        //중증 : 2천만원, 일반 : 475만원 2016.1.27 HeeYong
        If (sMeGubun = '1') Then ParamByName('GiveMax2').AsFloat:= FL_GiveMax4
        Else                     ParamByName('GiveMax2').AsFloat:= FL_GiveMax2;
        ExecSql;
      end
      else   //지원금 발생 처음이면...
      begin
        Sql.Clear; // 의료비 당월지원금액
        Sql.Add('UPDATE PSHAPSUM A SET SUPAMT                                        ');
        If (sMeGubun = '1') Then //중증 지원최대 : 20,000,000원, 지원최소 : 0원)
          Sql.Add(' = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ LEAST(DECODE(SIGN(MAX(CONSUM)/2 - (A.INSURAMT+A.CANCEAMT)),1, ceil(MAX(CONSUM)/2) - (A.INSURAMT+A.CANCEAMT), 0), :GiveMax4) ')
        Else                     //일반 지원최대 : 4,750,000원,  지원최소 : 500,000원(개인부담금))
          Sql.Add(' = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ LEAST(DECODE(SIGN(MAX(CONSUM)-:GiveMax1),1 ,ceil(MAX(CONSUM)-:GiveMax1)/2,0), :GiveMax2) ');
        Sql.Add('         FROM PSHAPSUM                                              ');
        Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');  //3월 - 2월 까지 등록 처리 KTH
        Sql.Add('          AND PART    = '''+ vPart + '''                            ');
        Sql.Add('          AND Empno   = '''+ sEmpno +'''                            ');
        Sql.Add('        GROUP BY EMPNO )                                            ');
        Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
        Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
        Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');
        if (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02') then
          ParamByName('AppYY').AsString    := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
        else
          ParamByName('AppYY').AsString    := Copy(sAppdate,1,4);

        If (sMeGubun = '1') Then ParamByName('GiveMax4').AsFloat:= FL_GiveMax4
        Else
        Begin
          ParamByName('GiveMax1').AsFloat := FL_GiveMax1;
          ParamByName('GiveMax2').AsFloat := FL_GiveMax2;
        End;
        //Edit1.text := sql.text;
        ExecSql;
      end;

      // 의료비 지원누계
      Sql.Clear;
      Sql.Add('UPDATE PSHAPSUM  A   SET   SUPSUM                                   ');
      Sql.Add('    = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */   sum(SUPAMT) FROM PSHAPSUM ');
      Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');    //3월 - 2월 까지 등록 처리 KTH
      Sql.Add('          AND PART  = '''+ vPart + '''                              ');
      Sql.Add('          AND Empno = '''+ sEmpno +''' )                            ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
      Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');
      if (Copy(sAppdate,5,2) = '01') or  (Copy(sAppdate,5,2) = '02') then
        ParamByName('AppYY').AsString    := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else
        ParamByName('AppYY').AsString    := Copy(sAppdate,1,4);
      ExecSql;

     
      if (iCnt > 0) and (Copy(sAppdate,5,2) = '02') then
      begin
        // 연말의료비  당월지원금액 =  연말의료비 지원금액 - 연중뵤비 지원금액누적분
        Sql.Clear;
        Sql.Add('UPDATE PSHAPSUM  A  SET SUPAMT                                      ');
        Sql.Add('    =  DECODE(SIGN(A.SUPAMT - (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ NVL(MAX(SUPSUM),0) ');
        Sql.Add('       FROM PSHAPSUM                                                ');
        Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND :AppYY1||''01''    ');
        Sql.Add('          AND PART  = '''+ vPart + '''                              ');
        Sql.Add('          AND Empno = '''+ sEmpno +'''                              ');
        Sql.Add('        GROUP BY EMPNO)),-1,0,1,A.SUPAMT - (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ NVL(MAX(SUPSUM),0) ');
        Sql.Add('      FROM PSHAPSUM                                                ');
        Sql.Add('       WHERE APPDATE BETWEEN :AppYY||''03'' AND :AppYY1||''01''    ');
        Sql.Add('         AND PART  = '''+ vPart + '''                              ');
        Sql.Add('         AND Empno = '''+ sEmpno +'''                              ');
        Sql.Add('       GROUP BY EMPNO))                                            ');
        Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
        Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
        Sql.Add('   AND Empno   = '''+ sEmpno +'''                                  ');


        ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1);
        ParamByName('AppYY1').AsString := Copy(sAppdate,1,4);
        Edit1.text := sql.text;
        ExecSql;

        // 연말의료비 지원누계
        //연말의료비 지원금액누적  - 연중의료비 지원금액(sum)
        Sql.Clear;
        Sql.Add('UPDATE PSHAPSUM  A   SET   SUPSUM                                   ');
        Sql.Add('    = A.SUPSUM - (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */   sum(SUPAMT) FROM PSHAPSUM ');
        Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND  :AppYY1||''01''   ');
        Sql.Add('          AND PART  = '''+ vPart + '''                              ');
        Sql.Add('          AND Empno = '''+ sEmpno +''' )                            ');
        Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
        Sql.Add('   AND PART    = '''+ vPart + '''                                   ');
        Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');

        ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1);
        ParamByName('AppYY1').AsString := Copy(sAppdate,1,4);

        //Edit1.text := sql.text;
        ExecSql;
      end;
        
      // 의료비 중증질병 지원금(암보장, 단체보험)
      Sql.Clear;
      Sql.Add('UPDATE PSHAPSUM SET INSURAMT = 0, CANCEAMT = 0 ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''            ');
      Sql.Add('   AND PART    = '''+ vPart + '''              ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''              ');
      Sql.Add('   AND nvl(SUPSUM,0) = 0                       ');

      ExecSql;
    end;
  end 
  /// 임원  의료비 ////////////////////////////////////////////////////////////
   /// 임원  의료비 ////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage = TabSheet5 then      //jissi 2013.05. 임원 의료비 계산 로직 변경
  begin
    with Ora_Comm do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM  PSHAPSUM               ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +''' ');
      Sql.Add('   AND PART    = ''A''              ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''   ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +''' ');
      //Sql.Add('   AND Faminame= '''+ sFname +'''   ');
      ExecSql;

      Close;
      Sql.Clear; //의료비 신청금액
      Sql.Add('INSERT INTO PSHAPSUM ');
      Sql.Add('(APPDATE,  PART,     EMPNO,   KORNAME,  APPAMT, APPSUM, EXTAMT, EXTSUM,    ');
      Sql.Add(' CONAMT,   CONSUM,   SETAMT,  SETSUM,   PREAMT,   PRESUM, SUPAMT, SUPSUM, WRITETIME, ');
      Sql.Add(' WRITEMAN, INSURAMT, CANCEAMT,FGUBUN) '   );
      Sql.Add('SELECT APPDATE, ''A'' PART, EMPNO, KORNAME, ');
      Sql.Add('       SUM(APPAMT),0,0,0,0,0,0,0,0,0,0,0,             ');
      Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),        ');
      Sql.Add('       '''+ FG_Empno +''',0, 0,FGUBUN                  ');
      Sql.Add('FROM(SELECT APPDATE, ''A'' PART, EMPNO, KORNAME, ');
      Sql.Add('       SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0))  APPAMT,   ');
      Sql.Add('       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,              ');
      Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),       ');
      Sql.Add('       '''+ FG_Empno +''',0, 0,FGUBUN                ');
      Sql.Add('  FROM PSHAPHOS                                      ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                  ');
      Sql.Add('   AND SUBSTR(MEDIDATE,1,4) = :AppYY                 ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +'''                  ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                                 ');
      //Sql.Add('   AND Faminame= '''+ sFname   +'''                  ');
      Sql.Add(' GROUP BY APPDATE, EMPNO, KORNAME, JOBPLACE, FAMINAME, FAMIREL ,FGUBUN) ');
      Sql.Add(' GROUP BY APPDATE,PART,EMPNO,KORNAME,FGUBUN ');

      if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
           ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
      //Edit1.text := sql.text;
      ExecSql;

      Sql.Clear; // 의료비 신청합계 :당월승인금액 : 승인합계 : 당월지원금액
      Sql.Add('UPDATE PSHAPSUM  A                                                                ');
      Sql.Add('   SET APPSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) ');//신청금액 누적분
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                        ');
      Sql.Add('                    AND FGUBUN = A.FGUBUN                                         ');
      Sql.Add('                  GROUP BY EMPNO, FGUBUN),                                      ');
      Sql.Add('       EXTAMT = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(EXCEPTAMT,0))');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                              ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                        ');
      Sql.Add('                    AND FGUBUN = A.FGUBUN                                         ');
      Sql.Add('                  GROUP BY EMPNO, FGUBUN),                                      ');
      Sql.Add('       EXTSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(EXCEPTAMT,0))');
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                        ');
      Sql.Add('                    AND FGUBUN = A.FGUBUN                                         ');
      Sql.Add('                  GROUP BY EMPNO, FGUBUN),                                        ');
      Sql.Add('       CONAMT = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0)) ');//승인금액
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                              ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND CONYN = ''Y''                                  ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                        ');
      Sql.Add('                    AND FGUBUN = A.FGUBUN                                         ');
      Sql.Add('                  GROUP BY EMPNO, FGUBUN),                                        ');
      Sql.Add('       CONSUM = (SELECT /*+ index(PSHAPHOS I1_PSHAPHOS) */ SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0))');//승인누계
      Sql.Add('                   FROM PSHAPHOS                                                  ');
      Sql.Add('                  WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''     ');
      Sql.Add('                    AND SUBSTR(MEDIDATE,1,4) = :AppYY                             ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                                  ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                        ');
      Sql.Add('                    AND FGUBUN = A.FGUBUN                                         ');
      Sql.Add('                  GROUP BY EMPNO, FGUBUN)                                         ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                               ');
      Sql.Add('   AND PART    = ''A''                                                            ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''                                                 ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                                ');

      if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
           ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
      ExecSql;

      //Edit1.text := sql.text ;

      Close;
      Sql.Clear;
      Sql.Add('SELECT Count(*) Cnt                                          ');
      Sql.Add('  FROM PSHAPSUM                                              ');
      if (sAppdate >= '201305') AND (sAppdate <= '201402') then
      Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''05'' AND '''+ sAppdate +''' ')
      else
      Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');      //3월 - 2월 까지 등록 처리 KTH
      Sql.Add('   AND PART    = ''A''                                       ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''                            ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                                 ');
      //Sql.Add('   AND Faminame= '''+ sFname +'''                            ');
      Sql.Add('   AND nvl(SUPSUM,0) > 0                                     ');  //지원금액누적분

      if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
           ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
      Open;

      iCnt := FieldByName('Cnt').AsInteger;

      sFsupsum := '0';
      sFconsum := '0';
      Close;
      Sql.Clear;
      Sql.Add('SELECT FGUBUN, sum(supamt) FSUPSUM ,sum(conamt) FCONSUM      ');
      Sql.Add('  FROM PSHAPSUM                                              ');
      if (sAppdate >= '201305') AND (sAppdate <= '201402') then
      Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''05'' AND '''+ sAppdate +''' ')
      else
      Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');      //3월 - 2월 까지 등록 처리 KTH
      Sql.Add('   AND PART    = ''A''                                       ');
      Sql.Add('   AND Empno   = '''+ sEmpno  +'''                           ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                         ');
      Sql.Add(' GROUP BY FGUBUN                                             ');
      if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
           ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
      Open;

      sFsupsum := FieldByName('FSUPSUM').AsString;
      sFconsum := FieldByName('FCONSUM').AsString;
      //Edit1.Text := sql.Text;

      {Close;
      Sql.Clear;
      Sql.Add('SELECT paycl from PIMPMAS                                          ');
      Sql.Add('  WHERE Empno   = '''+ sEmpno +'''                            ');

      Open;

      paycl := FieldByName('paycl').AsString;   }
      //임원분리 20190115일 자체임원,edm 임원 지원
      //if paycl < 'A61' then  //edm임원
      //begin
      Close;
      Sql.Clear;
      //임원의료비 기준변경 개별 10,000,000 원 --> 가족(아내,아들,딸,남편) 합산 20,000,000 각 최대지원금액 20,000,000 변경
      //당월지원금액 = (승인누적금액 - 지원기준 최소(0)) / 2  <= 20,000,000(최대지원금액)
      if iCnt > 0 then //당해년도 지원금 이력이 있으면
        begin
          Sql.Clear; // 의료비 당월지원금액
          Sql.Add('UPDATE PSHAPSUM  A  SET SUPAMT                                               ');//지원금액
          Sql.Add('    = (SELECT DECODE(M.FGUBUN,''2'',LEAST( GREATEST(Max(B.ZMaxAmt) - '+sFsupsum+',0), A.CONAMT/2 ),   ');//지원최대금액 - 지원금액누적분 (20000000 -
          Sql.Add('                                    LEAST( GREATEST(Max(B.ZMaxAmt) - '+sFsupsum+',0), A.CONAMT   ))   ');
          Sql.Add('         FROM PSHAPSUM M, PKZSPBAS B                                         ');
          if (sAppdate >= '201305') AND (sAppdate <= '201402') then
          Sql.Add('        WHERE M.APPDATE BETWEEN :AppYY||''05'' AND '''+ sAppdate +'''        ')
          else
          Sql.Add('        WHERE M.APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''        '); //3월 - 2월 까지 등록 처리 KTH
          Sql.Add('          AND M.FGUBUN    = B.FGUBUN                                         ');
          Sql.Add('          AND M.PART    = ''A''                                              ');
          Sql.Add('          AND M.Empno   = '''+ sEmpno +'''                                   ');
          Sql.Add('          AND M.FGUBUN  = '''+ sFgubun +'''                                   ');
          //Sql.Add('          AND M.Famirel = B.Famirel                                          ');
          Sql.Add('        GROUP BY M.EMPNO, M.FGUBUN )                                         ');
          Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                          ');
          Sql.Add('   AND PART    = ''A''                                                       ');
          Sql.Add('   AND Empno   = '''+ sEmpno +'''                                            ');
          Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                                 ');
          //Sql.Add('   AND Faminame= '''+ sFname +'''                                            ');
          if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
               ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
          else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
          //Edit1.Text := sql.Text;
          ExecSql;

        end
      else   //지원금 발생 처음이면...
        begin
          Sql.Clear; // 의료비 당월지원금액
          Sql.Add('UPDATE PSHAPSUM  A    SET   SUPAMT                                           ');
          Sql.Add('    = (SELECT DECODE(B.FGUBUN,''2'',LEAST(DECODE(SIGN('+sFconsum+'-Max(B.ZMinAmt)), 1,'+sFconsum+' -Max(B.ZMinAmt),0)/2, Max(B.ZMaxAmt)),');
          Sql.Add('                                    LEAST(DECODE(SIGN('+sFconsum+'-Max(B.ZMinAmt)), 1,'+sFconsum+' -Max(B.ZMinAmt),0),   Max(B.ZMaxAmt)))');
          Sql.Add('         FROM PKZSPBAS B                                                     ');
          Sql.Add('        WHERE B.FGUBUN  = '''+sFgubun+'''                                  ');
          Sql.Add('        GROUP BY B.FGUBUN )                                                  ');
          Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                          ');
          Sql.Add('   AND PART    = ''A''                                                       ');
          Sql.Add('   AND Empno   = '''+ sEmpno +'''                                            ');
          Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                         ');
          //Sql.Add('   AND Faminame= '''+ sFname +'''                                            ');

          ExecSql;
        end;

      // 의료비 지원누계
      Sql.Clear;
      Sql.Add('UPDATE PSHAPSUM  A   SET   SUPSUM                                   ');
      Sql.Add('    = (SELECT /*+ index (PSHAPSUM I1_PSHAPSUM) */ sum(SUPAMT) FROM PSHAPSUM ');
      if (sAppdate >= '201305') AND (sAppdate <= '201402') then
      Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''05'' AND '''+ sAppdate +''' ')
      else
      Sql.Add('        WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +''' ');    //3월 - 2월 까지 등록 처리 KTH
      Sql.Add('          AND PART    = ''A''                                       ');
      Sql.Add('          AND Empno   = '''+ sEmpno +'''                            ');
      Sql.Add('          AND FGUBUN  = '''+ sFgubun +''' )                       ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                 ');
      Sql.Add('   AND PART    = ''A''                                              ');
      Sql.Add('   AND Empno   = '''+ sEmpno +'''                                   ');
      Sql.Add('   AND FGUBUN  = '''+ sFgubun +'''                                                 ');
      //Sql.Add('   AND Faminame= '''+ sFname +'''                                   ');
      if (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02') then
           ParamByName('AppYY').AsString    := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
      else ParamByName('AppYY').AsString    := Copy(sAppdate,1,4);
      //edit1.text := sql.text;
      ExecSql;
      //end else begin
      //자체임원
      //end;
      if (sAppdate >= '201305') AND (sAppdate <= '201402') then
      begin
           BConsum := 0;

           Close;
           Sql.Clear;
           Sql.Add('SELECT SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0)) CONSUM');
           Sql.Add('  FROM PSHAPHOS                                                         ');
           Sql.Add(' WHERE APPDATE BETWEEN :AppYY||''03'' AND :AppYY||''04''                ');      //3월 - 2월 까지 등록 처리 KTH
           Sql.Add('   AND SUBSTR(MEDIDATE,1,4) = :AppYY                                    ');
           Sql.Add('   AND NVL(CONYN,''N'') = ''Y''                                         ');
           Sql.Add('   AND Empno   = '''+ sEmpno +'''                                       ');
           Sql.Add('   AND Faminame= '''+ sFname +'''                                       ');
           Sql.Add(' GROUP BY EMPNO, FAMINAME                                               ');

           if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
                ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
           else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
           Open;

           BConsum := FieldByName('CONSUM').AsFloat;
           Close;

           if BConsum > 0 then
           begin
                Sql.Clear;
                Sql.Add('UPDATE PSHAPSUM  A  SET                                                       ');
                Sql.Add('SUPAMT = (SELECT decode(sign((NVL(SUPSUM,0)+:Bconsum )-ZMaxAmt),1,            ');
                Sql.Add('                        SUPAMT-((NVL(SUPSUM,0)+:Bconsum)-ZMaxAmt), SUPAMT)    ');
                Sql.Add('            FROM PSHAPSUM M, PKZSPBAS B                                       ');
                Sql.Add('           WHERE APPDATE = '''+ sAppdate +'''                                 ');
                Sql.Add('             AND PART    = ''A''                                              ');
                Sql.Add('             AND Empno   = '''+ sEmpno +'''                                   ');
                Sql.Add('             AND Faminame= '''+ sFname +'''                                   ');
                Sql.Add('             AND M.Famirel = B.Famirel),                                      ');
                Sql.Add('CONSUM = (SELECT SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0)) - SUM(NVL(EXCEPTAMT,0))   ');
                Sql.Add('            FROM PSHAPHOS                                                     ');
                Sql.Add('           WHERE APPDATE BETWEEN :AppYY||''03'' AND '''+ sAppdate +'''        ');
                Sql.Add('             AND SUBSTR(MEDIDATE,1,4) = :AppYY                                ');
                Sql.Add('             AND NVL(CONYN,''N'') = ''Y''                                     ');
                Sql.Add('             AND EMPNO    = A.EMPNO                                           ');
                Sql.Add('             AND FAMINAME = A.FAMINAME                                        ');
                Sql.Add('           GROUP BY EMPNO, FAMINAME)                                          ');
                Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                           ');
                Sql.Add('   AND PART    = ''A''                                                        ');
                Sql.Add('   AND Empno   = '''+ sEmpno +'''                                             ');
                Sql.Add('   AND Faminame= '''+ sFname +'''                                             ');
                if  (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02')    then
                     ParamByName('AppYY').AsString := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
                else ParamByName('AppYY').AsString := Copy(sAppdate,1,4);
                ParamByName('Bconsum').AsFloat     := Bconsum;
                ExecSql;


                // 의료비 지원누계
                Sql.Clear;
                Sql.Add('UPDATE PSHAPSUM  A   SET   SUPSUM                                              ');
                Sql.Add('    = :Bconsum + (SELECT sum(SUPAMT) FROM PSHAPSUM                             ');
                Sql.Add('                   WHERE APPDATE BETWEEN :AppYY||''05'' AND '''+ sAppdate +''' '); //3월 - 2월 까지 등록 처리 KTH
                Sql.Add('                     AND PART    = ''A''                                       ');
                Sql.Add('                     AND Empno   = '''+ sEmpno +'''                            ');
                Sql.Add('                     AND Faminame= '''+ sFname +''' )                          ');
                Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                            ');
                Sql.Add('   AND PART    = ''A''                                                         ');
                Sql.Add('   AND Empno   = '''+ sEmpno +'''                                              ');
                Sql.Add('   AND Faminame= '''+ sFname +'''                                              ');
                if (Copy(sAppdate,5,2) = '01') or (Copy(sAppdate,5,2) = '02') then
                     ParamByName('AppYY').AsString    := InttoStr(Strtoint(Copy(sAppdate,1,4))-1)
                else ParamByName('AppYY').AsString    := Copy(sAppdate,1,4);
                ParamByName('Bconsum').AsFloat        := Bconsum;
                ExecSql;
           end;
      end;
    end;
  end
  ///// 체육활동 ///////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    with Ora_Comm do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM  PSHAPSUM               ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +''' ');
      Sql.Add('   AND PART    = ''B''              ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +''' ');
      ExecSql;

      Close;
      Sql.Clear; //체육활동 신청금액
      Sql.Add('INSERT INTO PSHAPSUM ');
      Sql.Add('(APPDATE,  PART,     EMPNO,   KORNAME,  JOBPLACE, APPAMT, APPSUM, EXTAMT, EXTSUM,    ');
      Sql.Add(' CONAMT,   CONSUM,   SETAMT,  SETSUM,   PREAMT,   PRESUM, SUPAMT, SUPSUM, WRITETIME, ');
      Sql.Add(' WRITEMAN, FAMINAME, FAMIREL, INSURAMT, CANCEAMT) '   );
      Sql.Add('SELECT APPDATE, ''B'' PART, EMPNO, KORNAME, MIN(JOBPLACE) JOBPLACE,');
      Sql.Add('       SUM(NVL(PLAYAMT,0))   APPAMT,  0,             ');
      Sql.Add('       SUM(NVL(EXCEPTAMT,0)) EXTAMT,  0,             ');
      Sql.Add('       0, 0, 0, 0, 0, 0, 0, 0,                       ');
      Sql.Add('       TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),       ');
      Sql.Add('       '''+ FG_Empno +''','''','''', 0, 0            ');
      Sql.Add('  FROM PSHAPLAY                                      ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                  ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +'''                  ');
      Sql.Add(' GROUP BY APPDATE, EMPNO, KORNAME          ');
      ExecSql;

      Sql.Clear; // 체육활동 승인금액
      Sql.Add('UPDATE PSHAPSUM  A                                                            ');
      Sql.Add('   SET APPSUM = (SELECT SUM(NVL(PLAYAMT,0))                                   ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND EMPNO    = A.EMPNO                                    ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       EXTSUM = (SELECT SUM(NVL(EXCEPTAMT,0))                                 ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       CONAMT = (SELECT SUM(NVL(PLAYAMT,0)) - SUM(NVL(EXCEPTAMT,0)) - SUM(NVL(SETAMT,0)) ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                          ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       CONSUM = (SELECT SUM(NVL(PLAYAMT,0)) - SUM(NVL(EXCEPTAMT,0)) - SUM(NVL(SETAMT,0)) ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       SETAMT = (SELECT SUM(NVL(SETAMT,0))                                    ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                          ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       SETSUM = (SELECT SUM(NVL(SETAMT,0))                                    ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       PREAMT = (SELECT SUM(NVL(PREAMT,0))                                    ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                          ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       PRESUM = (SELECT SUM(NVL(PREAMT,0))                                    ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO),                                            ');
      Sql.Add('       SUPAMT = (SELECT LEAST(SUM(NVL(PLAYAMT,0)),                            ');
      Sql.Add('                        MAX(FINDSPEC(SUBSTR(APPDATE,1,4 ), EMPNO)),           ');
      Sql.Add('                        (SUM(NVL(PLAYAMT,0)) - (SUM(NVL(exceptAMT,0))) - SUM(NVL(SETAMT,0)))) ');
      Sql.Add('                   FROM PSHAPLAY                                              ');
      Sql.Add('                  WHERE APPDATE = '''+ sAppdate +'''                          ');
      Sql.Add('                    AND EMPNO   = A.EMPNO                                     ');
      Sql.Add('                    AND NVL(CONYN,''N'') = ''Y''                              ');
      Sql.Add('                  GROUP BY EMPNO)                                             ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                           ');
      Sql.Add('   AND PART    = ''B''                                                        ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +'''                                           ');
      ExecSql;

      Sql.Clear; // 체육활동  지원합계금액
      Sql.Add('UPDATE PSHAPSUM  A');
      Sql.Add('   SET SUPSUM = (SELECT SUM(nvl(SUPAMT,0))                                   ');
      Sql.Add('                   FROM PSHAPSUM                                             ');
      Sql.Add('                  WHERE APPDATE BETWEEN ''' + FL_MaxApp + ''' AND '''+ sAppdate +''' ');
      Sql.Add('                    AND PART  = ''B''                                        ');
      Sql.Add('                    AND EMPNO = '''+ sEmpno +'''                             ');
      Sql.Add('                  GROUP BY EMPNO)                                            ');
      Sql.Add(' WHERE APPDATE = '''+ sAppdate +'''                                          ');
      Sql.Add('   AND PART    = ''B''                                                       ');
      Sql.Add('   AND Empno   = '''+ sEmpno   +'''                                          ');
      ExecSql;
    end;
  end;

   Ora_Session.Commit;
end;

procedure TFM_Mainform.CE_appdateChange(Sender: TObject);
begin
{  if  CE_appdate.Text <> Copy(FG_Appdate,1,4)+' - '+Copy(FG_Appdate,5,2) then
    begin
      BT_Y_Save.Enabled := False;
      BT_N_Save.Enabled := False;
      SB_Help.Panels[1].Text := '1. 과거승인내역은 조회만 가능합니다.   2. YYYY - MM 형태로 입력해야합니다.';
    end
  else
    begin
      BT_Y_Save.Enabled := True;
      BT_N_Save.Enabled := True;
    end;}

  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.BE_jobfrClick(Sender: TObject);
begin
  FG_jobclick := 'FR';
  FCodeForm := TFCodeForm.Create(Self);
  Try
     if BE_jobfr.Text <> '' then begin
        FCodeForm.E_CodeNo.Text   := Copy(BE_jobfr.Text,1,2);
        FCodeForm.E_CodeName.Text := BE_jobfr.Text;
     end;

     if FCodeForm.Qry_Code.RecordCount = 1 then
       BE_jobfr.Text := FCodeForm.E_CodeNo.Text+' - '+FCodeForm.E_CodeName.Text
     else
       FCodeForm.ShowModal;
  Finally
     FCodeForm.Free;
  end;
end;

procedure TFM_Mainform.BE_jobfrButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  BE_jobfrClick(Sender);
end;

procedure TFM_Mainform.BE_jobtoClick(Sender: TObject);
begin
  FG_jobclick := 'TO';
  FCodeForm := TFCodeForm.Create(Self);
  Try
     if BE_jobto.Text <> '' then begin
        FCodeForm.E_CodeNo.Text   := Copy(BE_jobto.Text,1,2);
        FCodeForm.E_CodeName.Text := BE_jobto.Text;
     end;

     if FCodeForm.Qry_Code.RecordCount = 1 then
       BE_jobto.Text := FCodeForm.E_CodeNo.Text+' - '+FCodeForm.E_CodeName.Text
     else
       FCodeForm.ShowModal;
  Finally
     FCodeForm.Free;
  end;
end;

procedure TFM_Mainform.BE_jobtoButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  BE_jobtoClick(Sender);
end;

procedure TFM_Mainform.DataSource1DataChange(Sender: TObject;
  Field: TField);
 var  partgubun : String;
begin
  FL_corpname  := '';
  FL_playdate  := '';
//  NE_division2.Value := 0;

  if not FL_SaveClick then
  begin
    if PageControl1.ActivePage = TabSheet1 then
    begin
      FL_Appdate1       := Ora_Sql1.FieldByName('appdate').AsString; //선택한 신청년월
      FL_AppEmpno       := Ora_Sql1.FieldByName('empno').AsString;   //선택한 사번
      FL_AppFaminame    := '';  //선택한 가족명 jissi 2013.05
      NE_Except.Value   := Ora_Sql1.FieldByName('exceptamt').AsFloat;
      E_bigo.Text       := Ora_Sql1.FieldByName('conynsayu').AsString;

      if RG_Check.ItemIndex = 1 then partgubun := 'D'
      Else                           partgubun := 'A';
    end
    else if PageControl1.ActivePage = TabSheet2 then
      begin
        FL_Appdate1     := Ora_Sql2.FieldByName('appdate').AsString;
        FL_AppEmpno     := Ora_Sql2.FieldByName('empno').AsString;
        FL_AppFaminame  := '';  //선택한 가족명 jissi 2013.05
        NE_Except.Value := Ora_Sql2.FieldByName('exceptamt').AsFloat;
        E_bigo.Text     := Ora_Sql2.FieldByName('conynsayu').AsString;
        NE_Setamt.Value := Ora_Sql2.FieldByName('setamt').AsFloat;
        NE_Preamt.Value := Ora_Sql2.FieldByName('preamt').AsFloat;
        E_Setcomm.Text  := Ora_Sql2.FieldByName('setcomm').AsString;
        E_Consayu.Text  := Ora_Sql2.FieldByName('consayu').AsString;
        FL_corpname     := Ora_Sql2.FieldByName('corpname').AsString;
        FL_playdate     := Ora_Sql2.FieldByName('playdate').AsString;
        NE_division2.Value := Ora_Sql2.FieldByName('division').AsInteger;  //신청개월수를 지원개월수에 넣어 수정 가능토록
        if NE_division2.Value > 1 then
          NE_Preamt.Enabled := True
        else
          NE_Preamt.Enabled := False;

        partgubun       := 'B';
      end
    else if PageControl1.ActivePage = TabSheet5 then
      begin
        FL_Appdate1     := Ora_Sql1.FieldByName('appdate').AsString; //선택한 신청년월
        FL_AppEmpno     := Ora_Sql1.FieldByName('empno').AsString;   //선택한 사번
        FL_AppFaminame  := Ora_Sql1.FieldByName('Faminame').AsString;   //선택한 가족명 jissi 2013.05
        NE_Except.Value := Ora_Sql1.FieldByName('exceptamt').AsFloat;
        E_bigo.Text     := Ora_Sql1.FieldByName('conynsayu').AsString;
        FL_FGUBUN       := Ora_Sql1.FieldByName('fgubun').AsString;
        partgubun       := 'A';
      end
  end;

  //하단에 개인별 Sum 보여주기 /////////////////////////////////////////////////
  if (PageControl1.ActivePage = TabSheet3) or (PageControl1.ActivePage = TabSheet8)  then
  begin
      NE1.Value  := 0;
      NE2.Value  := 0;
      NE3.Value  := 0;
      NE4.Value  := 0;
      NE5.Value  := 0;
      NE6.Value  := 0;
      NE7.Value  := 0;
      NE8.Value  := 0;
      NE9.Value  := 0;
      NE10.Value := 0;
      NE11.Value := 0;
      NE12.Value := 0;
      NE13.Value := 0;
      NE14.Value := 0;
  end
  else
  begin
    Ora_Sql3.FetchRows := 5000;
    with Ora_Sql3 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT APPDATE, DECODE(PART,''A'',''의료비'',''B'',''체육'') PART,');
      Sql.Add('       A.EMPNO, A.KORNAME, A.FAMINAME,                            ');
      Sql.Add('       APPAMT, APPSUM, EXTAMT, EXTSUM, CONAMT, CONSUM,   SETAMT,  ');
      Sql.Add('       SETSUM, PREAMT, PRESUM, SUPAMT, SUPSUM, INSURAMT, CANCEAMT ');
      Sql.Add('  FROM PSHAPSUM A, PIMPMAS B                                      ');
      SQL.Add(' WHERE A.EMPNO    = B.EMPNO                                       ');
      SQL.Add('   AND APPDATE    =:appdate                                       ');
      Sql.Add('   AND PART       =:partgubun                                     ');
      Sql.Add('   AND A.EMPNO    =:appemp                                        ');
      IF (PageControl1.ActivePage = TabSheet8)or  (PageControl1.ActivePage = TabSheet5) then
       Sql.Add('   AND A.FGUBUN    ='''+ FL_FGUBUN +'''                             ');
      //Sql.Add('   AND NVL(A.FAMINAME,'' '') = NVL(:appfaminame,'' '')            ');
      ParamByName('appdate').AsString   := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
      ParamByName('partgubun').AsString := partgubun;
      ParamByName('appemp').AsString    := FL_AppEmpno;
      //if FL_Appdate1 < '201305' then ParamByName('appfaminame').AsString := ''
      //else
      //   ParamByName('appfaminame').AsString  := FL_AppFaminame;
      
      Open;
      NE1.Value  := FieldByName('APPAMT').AsFloat;//당월신청
      NE2.Value  := FieldByName('EXTAMT').AsFloat;
      NE3.Value  := FieldByName('CONAMT').AsFloat;
      ScAmtSum   := FieldByName('CONAMT').AsFloat;//당월승인

      NE4.Value  := FieldByName('SETAMT').AsFloat;
      NE5.Value  := FieldByName('PREAMT').AsFloat;
      NE6.Value  := FieldByName('SUPAMT').AsFloat;//당월지원
      NE7.Value  := FieldByName('APPSUM').AsFloat;//신청누계
      NE8.Value  := FieldByName('EXTSUM').AsFloat;
      NE9.Value  := FieldByName('CONSUM').AsFloat;//승인누계
      NE10.Value := FieldByName('SETSUM').AsFloat;
      NE11.Value := FieldByName('PRESUM').AsFloat;
      NE12.Value := FieldByName('SUPSUM').AsFloat;//지원누계
      NE13.Value := FieldByName('INSURAMT').AsFloat;
      NE14.Value := FieldByName('CANCEAMT').AsFloat;
      Close;
    end;  //with Ora_Sql3 do
  end;
end;

//체육활동 : 분할신청 승인합계Data 생성 :
procedure TFM_Mainform.AutoSum;
 var  i : Integer;
begin
  Ora_Sql2.FetchRows := FL_SaveCnt + 10;
  DbGrid2.SelectedRows.Clear;
  DataSource1.DataSet := Ora_Sql2;
  with Ora_Sql2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT APPDATE, EMPNO, KORNAME, SEQ, PLAYDATE, PLAYITEM, PLAYAMT, ');
    Sql.Add('       division, division2, CORPNAME, CORPTEL, CONYN, CONYNSAYU,  ');
    Sql.Add('       EXCEPTAMT, SETAMT, PREAMT, SETCOMM                         ');
    SQL.Add('  FROM PSHAPLAY                                                   ');
    SQL.Add(' WHERE APPDATE  = '''+ FG_Appdate +'''                            ');
    SQL.Add('   AND CONYN    = ''Y''                                           ');
    SQL.Add('   AND division > 1                                               ');
    SQL.Add('   AND Empno Not in (Select Empno From PSHAPSUM Where APPDATE = '''+ FG_Appdate +''' '); //
    SQL.Add('                                                  AND PART    = ''B'') ');
    SQL.Add(' ORDER BY APPDATE, EMPNO, SEQ');
    Open;
  end;

  PageControl1.ActivePage := TabSheet2;//체육활동으로 지정.
  MD_Data.Close;
  Ora_Sql2.First;
  for i := 0 to Ora_Sql2.RecordCount -1 do
  begin
    MD_Data.Open;
    MD_Data.Append;
    MD_Data.FieldByName('Appdate').AsString   := Ora_Sql2.FieldByName('Appdate').AsString;
    MD_Data.FieldByName('empno').AsString     := Ora_Sql2.FieldByName('empno').AsString;
    MD_Data.FieldByName('seq').AsString       := Ora_Sql2.FieldByName('seq').AsString;
    MD_Data.FieldByName('conyn').AsString     := 'Y';
    MD_Data.FieldByName('conynsayu').AsString := '';
    MD_Data.FieldByName('exceptamt').AsFloat  := 0;
    MD_Data.FieldByName('setcomm').AsString   := '';
    MD_Data.FieldByName('setamt').AsFloat     := 0;
    MD_Data.FieldByName('preamt').AsFloat     := 0;
    MD_Data.Post;
    Ora_Sql2.Next;
  end;

  if MD_Data.Active then
  begin
    MD_Data.EnableControls;
    MD_Data.first;
    for i := 0 to MD_Data.RecordCount -1 do
    begin
      DataSum(MD_Data.FieldByName('Appdate').AsString,
              MD_Data.FieldByName('Empno').AsString,
              MD_Data.FieldByName('Faminame').AsString,
              '',
              '');
      MD_Data.Next;
    end;
  end;

  Ora_Sql2.Close;
  Ora_Sql2.FetchRows := 5000;
end;

//전월 분할신청 Data Check
procedure TFM_Mainform.AutoSum_DataChk(sEmpno : String; sSeq : String);
 var FL_Pridate : String;
begin
  FL_DataChk := False;
  FL_Pridate := Prior_Month(FG_Appdate); //전월 승인년월

  with Ora_Comm do
  begin
    Close;
    Sql.Clear;
    SQL.Add('SELECT 1 FROM PSHAPLAY                                    ');
    SQL.Add(' WHERE PLAYDATE = (SELECT distinct PLAYDATE FROM PSHAPLAY ');
    SQL.Add('                    WHERE division > 1                    ');
    SQL.Add('                      AND APPDATE  = '''+ FL_Pridate +''' ');
    SQL.Add('                      AND Empno    = '''+ sEmpno +'''     ');
    SQL.Add('                      AND Seq      = '''+ sSeq   +'''     ');
    SQL.Add('                      AND CONYN    = ''Y'' )              ');
    SQL.Add('   AND APPDATE >= '''+ FG_Appdate +'''                    ');
    SQL.Add('   AND Empno    = '''+ sEmpno +'''                        ');
    SQL.Add('   AND Seq      = '''+ sSeq   +'''                        ');
//    SQL.Add('   AND JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록
    Open;

    if RecordCount > 0 then
    begin
      FL_DataChk := True;
      MessageDlg('이전에 승인한 분할신청 Data는 비승인 처리 불가능합니다. 사번 : '+sEmpno, mtInformation, [mbOk], 0);
    end
    else
      FL_DataChk := False;

    Close;
  end;
end;

//엑셀추출......................................................................
procedure TFM_Mainform.BT_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
    flagYN : String;
begin
  BT_Search1Click(Sender);

  //정규직 의료비 //////////////////////////////////////////////////////////////////
  if PageControl1.ActivePage = TabSheet1 then
  begin
    if Ora_Sql1.RecordCount < 1 then
    begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
    end
    else if Ora_Sql1.RecordCount > 5000 then
    begin
      showmessage('의료비 내역 추출은 5000건 까지 가능합니다. 개발자에게 문의 하세요.');
      exit;
    end;

    SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 14], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');  //Comobj
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      SB_Help.SimpleText := '';
      Exit;
    end;

    SB_Help.SimpleText := '자료를 변환하고 있습니다.';
    XL.WorkBooks.Add;         //새로운 페이지 생성
    XL.Visible := false;
    XL.WorkSheets[1].Name := '정규직 의료비내역 List'; //시트명 부여
    XL.Range['A1:N2'].Merge;                         //셀 병합

    //TITLE NAME 설정
    XL.Range['A1'].value := CE_appdate.Text +' 월 정규직 의료비내역';
    XL.Range['A1'].font.Size := 16;

    //컬럼명 지정_서브타이블 지정
    XArr[1]  := '사번';
    XArr[2]  := '성명';
    XArr[3]  := '재직상태';
    XArr[4]  := 'BAND';
    XArr[5]  := '소속부서';
    XArr[6]  := '근무지';
    XArr[7]  := '가족명';
    XArr[8]  := '사업자번호';
    XArr[9]  := '사업자명';
    XArr[10] := '치료내역';
    XArr[11] := '지출액';
    XArr[12] := '제외액';
    XArr[13] := '승인여부';
    XArr[14] := '비고';

    XL.Range['A3' , 'N3'].Value := XArr;
    k := 3;
    for i := 1 to 14 do
    begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
    end;
    //검색된 자료를 excel에 export처리 시킨다.
    SavePlace := Ora_Sql1.GetBookmark;
    Ora_Sql1.DisableControls;
    Ora_Sql1.First;

    for i := 1 to  Ora_Sql1.RecordCount do
    begin

      XArr[1]  := ''''+Ora_Sql1.FieldbyName('EMPNO').AsString;
      XArr[2]  := Ora_Sql1.FieldbyName('KORNAME').AsString;
      XArr[3]  := Ora_Sql1.FieldbyName('PSTATENAME').AsString;
      XArr[4]  := Ora_Sql1.FieldbyName('PAYCLNAME').AsString;
      XArr[5]  := Ora_Sql1.FieldByName('DEPTNAME').AsString;
      XArr[6]  := Ora_Sql1.FieldByName('JOBPLACE').AsString;
      XArr[7]  := Ora_Sql1.FieldByName('FAMINAME').AsString;
      XArr[8]  := Ora_Sql1.FieldByName('CORPNO').AsString;
      XArr[9]  := Ora_Sql1.FieldByName('CORPNAME').AsString;
      XArr[10] := Ora_Sql1.FieldByName('MEDCOMM').AsString;
      XArr[11] := Ora_Sql1.FieldByName('TOTAMT').AsFloat;
      XArr[12] := Ora_Sql1.FieldByName('EXCEPTAMT').AsFloat;
      XArr[13] := Ora_Sql1.FieldByName('CONYN').AsString;
      XArr[14] := Ora_Sql1.FieldByName('CONYNSAYU').AsString;
      XL.Range['A' + IntToStr(k+1), 'N' + IntToStr(k+1)].Value := XArr;
      inc(k);
      Ora_Sql1.Next;
    end;
    XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
    XL.Range['A1', 'N' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
    XL.Range['A1', 'N' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
    XL.Range['A1', 'N' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
    XL.Range['A1', 'N' + IntToStr(k)].font.name := '굴림체';
    XL.Range['A3', 'N' + IntToStr(k)].font.Size := 9;
    XL.Range['A1', 'N' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
    XL.Selection.Columns.AutoFit;                                //자동정렬
    XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
    XL.Visible := true;                                          //엑셀자료 보여줌
    Screen.Cursor := crDefault;
    Ora_Sql1.GotoBookmark(SavePlace);
    Ora_Sql1.FreeBookmark(SavePlace);
    Ora_Sql1.EnableControls;
    SB_Help.SimpleText := '';
  end
  //////////////////////////////////////////////////////////////////////////////

  //임원 의료비 //////////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage = TabSheet5 then
  begin
    if Ora_Sql1.RecordCount < 1 then
    begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
    end
    else if Ora_Sql1.RecordCount > 5000 then
    begin
      showmessage('의료비 내역 추출은 5000건 까지 가능합니다. 개발자에게 문의 하세요.');
      exit;
    end;

    SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 14], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');  //Comobj
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      SB_Help.SimpleText := '';
      Exit;
    end;

    SB_Help.SimpleText := '자료를 변환하고 있습니다.';
    XL.WorkBooks.Add;         //새로운 페이지 생성
    XL.Visible := false;
    XL.WorkSheets[1].Name := '임원 의료비내역 List'; //시트명 부여
    XL.Range['A1:N2'].Merge;                         //셀 병합

    //TITLE NAME 설정
    XL.Range['A1'].value := CE_appdate.Text +' 월 임원 의료비내역';
    XL.Range['A1'].font.Size := 16;

    //컬럼명 지정_서브타이블 지정
    XArr[1]  := '사번';
    XArr[2]  := '성명';
    XArr[3]  := '재직상태';
    XArr[4]  := 'BAND';
    XArr[5]  := '소속부서';
    XArr[6]  := '근무지';
    XArr[7]  := '가족명';
    XArr[8]  := '사업자번호';
    XArr[9]  := '사업자명';
    XArr[10] := '치료내역';
    XArr[11] := '지출액';
    XArr[12] := '제외액';
    XArr[13] := '승인여부';
    XArr[14] := '비고';

    XL.Range['A3' , 'N3'].Value := XArr;
    k := 3;
    for i := 1 to 14 do
    begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
    end;
    //검색된 자료를 excel에 export처리 시킨다.
    SavePlace := Ora_Sql1.GetBookmark;
    Ora_Sql1.DisableControls;
    Ora_Sql1.First;

    for i := 1 to  Ora_Sql1.RecordCount do
    begin
      XArr[1]  := ''''+Ora_Sql1.FieldbyName('EMPNO').AsString;
      XArr[2]  := Ora_Sql1.FieldbyName('KORNAME').AsString;
      XArr[3]  := Ora_Sql1.FieldbyName('PSTATENAME').AsString;
      XArr[4]  := Ora_Sql1.FieldbyName('PAYCLNAME').AsString;
      XArr[5]  := Ora_Sql1.FieldByName('DEPTNAME').AsString;
      XArr[6]  := Ora_Sql1.FieldByName('JOBPLACE').AsString;
      XArr[7]  := Ora_Sql1.FieldByName('FAMINAME').AsString;
      XArr[8]  := Ora_Sql1.FieldByName('CORPNO').AsString;
      XArr[9]  := Ora_Sql1.FieldByName('CORPNAME').AsString;
      XArr[10] := Ora_Sql1.FieldByName('MEDCOMM').AsString;

      XArr[11] := Ora_Sql1.FieldByName('TOTAMT').AsFloat;
      XArr[12] := Ora_Sql1.FieldByName('EXCEPTAMT').AsFloat;
      XArr[13] := Ora_Sql1.FieldByName('CONYN').AsString;
      XArr[14] := Ora_Sql1.FieldByName('CONYNSAYU').AsString;
      XL.Range['A' + IntToStr(k+1), 'N' + IntToStr(k+1)].Value := XArr;
      inc(k);
      Ora_Sql1.Next;
    end;
    XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
    XL.Range['A1', 'N' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
    XL.Range['A1', 'N' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
    XL.Range['A1', 'N' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
    XL.Range['A1', 'N' + IntToStr(k)].font.name := '굴림체';
    XL.Range['A3', 'N' + IntToStr(k)].font.Size := 9;
    XL.Range['A1', 'N' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
    XL.Selection.Columns.AutoFit;                                //자동정렬
    XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
    XL.Visible := true;                                          //엑셀자료 보여줌
    Screen.Cursor := crDefault;
    Ora_Sql1.GotoBookmark(SavePlace);
    Ora_Sql1.FreeBookmark(SavePlace);
    Ora_Sql1.EnableControls;
    SB_Help.SimpleText := '';
  end
  //////////////////////////////////////////////////////////////////////////////

  //체육활동////////////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage = TabSheet2 then
  begin         
    if Ora_Sql2.RecordCount < 1 then
    begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
    end
    else if Ora_Sql2.RecordCount > 1500 then
    begin
      showmessage('체육활동 내역 추출은 1500건 까지 가능합니다. 개발자에게 문의 하세요.');
      exit;
    end;

    SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 19], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');  //Comobj
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      SB_Help.SimpleText := '';
      Exit;
    end;

    SB_Help.SimpleText := '자료를 변환하고 있습니다.';
    XL.WorkBooks.Add;         //새로운 페이지 생성
    XL.Visible := false;
    XL.WorkSheets[1].Name := '체육활동비내역 List';  //시트명 부여
    XL.Range['A1:S2'].Merge;                         //셀 병합

    //TITLE NAME 설정
    XL.Range['A1'].value := CE_appdate.Text +' 월 체육활동내역';
    XL.Range['A1'].font.Size := 16;

    //컬럼명 지정_서브타이블 지정
    XArr[1]  := '사번';
    XArr[2]  := '성명';
    XArr[3]  := '재직상태';
    XArr[4]  := '직급';
    XArr[5]  := '소속부서';
    XArr[6]  := '근무지';
    XArr[7]  := '시작년월';
    XArr[8]  := '종료년월';
    XArr[9]  := '지급처';
    XArr[10] := '종목';
    XArr[11] := '신청금액';
    XArr[12] := '제외금액';
    XArr[13] := '전월이월금액';
    XArr[14] := '조정금액';
    XArr[15] := '조정내역';
    XArr[16] := '승인여부';
    XArr[17] := '증빙서류';
    XArr[18] := '비고';
    XArr[19] := '등록/변경일';

    XL.Range['A3' , 'S3'].Value := XArr;
    k := 3;
    for i := 1 to 19 do
    begin
      XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
      XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
      XL.Range[CHR(64 + i) + '3'].font.Size := 10;
      XL.Range[CHR(64 + i) + '3'].font.Bold := True;
    end;
    //검색된 자료를 excel에 export처리 시킨다.
    SavePlace := Ora_Sql2.GetBookmark;
    Ora_Sql2.DisableControls;
    Ora_Sql2.First;

    for i := 1 to Ora_Sql2.RecordCount do
    begin

      XArr[1]  := ''''+Ora_Sql2.FieldbyName('EMPNO').AsString;
      XArr[2]  := Ora_Sql2.FieldbyName('KORNAME').AsString;
      XArr[3]  := Ora_Sql2.FieldbyName('PSTATENAME').AsString;
      XArr[4]  := Ora_Sql2.FieldbyName('PAYCLNAME').AsString;
      XArr[5]  := Ora_Sql2.FieldByName('DEPTNAME').AsString;
      XArr[6]  := Ora_Sql2.FieldByName('JOBPLACE').AsString;
      XArr[7]  := Ora_Sql2.FieldByName('STARTYYMM').AsString;
      XArr[8]  := Ora_Sql2.FieldByName('ENDYYMM').AsString;
      XArr[9]  := Ora_Sql2.FieldByName('CORPNAME').AsString;
      XArr[10] := Ora_Sql2.FieldByName('PLAYITEM').AsString;
      XArr[11] := Ora_Sql2.FieldByName('PLAYAMT').AsFloat;
      XArr[12] := Ora_Sql2.FieldByName('EXCEPTAMT').AsFloat;
      XArr[13] := Ora_Sql2.FieldByName('PREAMT').AsFloat;
      XArr[14] := Ora_Sql2.FieldByName('SETAMT').AsFloat;
      XArr[15] := Ora_Sql2.FieldByName('SETCOMM').AsString;
      XArr[16] := Ora_Sql2.FieldByName('CONYN').AsString;
      XArr[17] := Ora_Sql2.FieldByName('SSEQ').AsString;
      XArr[18] := Ora_Sql2.FieldByName('CONYNSAYU').AsString;
      XArr[19] := ''''+Ora_Sql2.FieldByName('WRITETIME').AsString;
      XL.Range['A' + IntToStr(k+1), 'S' + IntToStr(k+1)].Value := XArr;
      inc(k);
     
      Ora_Sql2.Next;

    end;
    XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
    XL.Range['A1', 'S' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
    XL.Range['A1', 'S' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
    XL.Range['A1', 'S' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
    XL.Range['A1', 'S' + IntToStr(k)].font.name := '굴림체';
    XL.Range['A3', 'S' + IntToStr(k)].font.Size := 9;
    XL.Range['A1', 'S' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
    XL.Selection.Columns.AutoFit;                                //자동정렬
    XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
    XL.Visible := true;                                          //엑셀자료 보여줌
    Screen.Cursor := crDefault;
    Ora_Sql2.GotoBookmark(SavePlace);
    Ora_Sql2.FreeBookmark(SavePlace);
    Ora_Sql2.EnableControls;
    SB_Help.SimpleText := '';
  end

  //승인내역 ///////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage = TabSheet3 then
  begin
    if Ora_Sql3.RecordCount < 1 then
    begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
    end
    else if Ora_Sql3.RecordCount > 1500 then
    begin
      showmessage('승인내역 추출은 1500건 까지 가능합니다. 개발자에게 문의 하세요.');
      exit;
    end;

    SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    if  not CheckBox1.Checked then
         XArr := VarArrayCreate([1, 17], VarVariant)
    else
         XArr := VarArrayCreate([1, 20], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');  //Comobj
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      SB_Help.SimpleText := '';
      Exit;
    end;

    SB_Help.SimpleText := '자료를 변환하고 있습니다.';
    XL.WorkBooks.Add;         //새로운 페이지 생성
    XL.Visible := false;
    XL.WorkSheets[1].Name := '승인내역 List';  //시트명 부여
    if not CheckBox1.Checked then    //jissi 2013.05 의료비내역 제외시 가족관련필드 제외
    begin
      XL.Range['A1:Q2'].Merge;                   //셀 병합

      //TITLE NAME 설정
      XL.Range['A1'].value := CE_appdate.Text +' 월 승인내역';
      XL.Range['A1'].font.Size := 16;

      //컬럼명 지정_서브타이블 지정
      XArr[01] := '신청구분';
      XArr[02] := '사원번호';
      XArr[03] := '성명';
      XArr[04] := '재직상태';
      XArr[05] := '근무지';
      XArr[06] := '당월신청액';
      XArr[07] := '신청누계액';
      XArr[08] := '당월제외액';
      XArr[09] := '제외누계액';
      XArr[10] := '당월승인액';
      XArr[11] := '승인누계액';
      XArr[12] := '당월조정액';
      XArr[13] := '조정누계액';
      XArr[14] := '잔여누계액'; //전월이월액
//       XArr[15] := '이월누계액';
      XArr[15] := '당월지원액';
      XArr[16] := '지원누계액';

      XL.Range['A3' , 'Q3'].Value := XArr;
      k := 3;
      for i := 1 to 17 do
      begin
        XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
        XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
        XL.Range[CHR(64 + i) + '3'].font.Size := 10;
        XL.Range[CHR(64 + i) + '3'].font.Bold := True;
      end;
      //검색된 자료를 excel에 export처리 시킨다.
      SavePlace := Ora_Sql3.GetBookmark;
      Ora_Sql3.DisableControls;
      Ora_Sql3.First;

      for i := 1 to  Ora_Sql3.RecordCount do
      begin
        XArr[01] := Ora_Sql3.FieldbyName('PART').AsString;
        XArr[02] := ''''+Ora_Sql3.FieldbyName('EMPNO').AsString;
        XArr[03] := Ora_Sql3.FieldbyName('KORNAME').AsString;
        XArr[04] := Ora_Sql3.FieldByName('PSTATENAME').AsString;
        XArr[05] := Ora_Sql3.FieldByName('JOBPLACE').AsString;
        XArr[06] := Ora_Sql3.FieldByName('APPAMT').AsFloat;
        XArr[07] := Ora_Sql3.FieldByName('APPSUM').AsFloat;
        XArr[08] := Ora_Sql3.FieldByName('EXTAMT').AsFloat;
        XArr[09] := Ora_Sql3.FieldByName('EXTSUM').AsFloat;
        XArr[10] := Ora_Sql3.FieldByName('CONAMT').AsFloat;
        XArr[11] := Ora_Sql3.FieldByName('CONSUM').AsFloat;
        XArr[12] := Ora_Sql3.FieldByName('SETAMT').AsFloat;
        XArr[13] := Ora_Sql3.FieldByName('SETSUM').AsFloat;
        XArr[14] := Ora_Sql3.FieldByName('JANSUM').AsFloat;  //PREAMT
//          XArr[15] := Ora_Sql3.FieldByName('PRESUM').AsFloat;
        XArr[15] := Ora_Sql3.FieldByName('SUPAMT').AsFloat;
        XArr[16] := Ora_Sql3.FieldByName('SUPSUM').AsFloat;

        XL.Range['A' + IntToStr(k+1), 'Q' + IntToStr(k+1)].Value := XArr;
        inc(k);
        Ora_Sql3.Next;
      end;
      XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
      XL.Range['A1', 'Q' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
      XL.Range['A1', 'Q' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
      XL.Range['A1', 'Q' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
      XL.Range['A1', 'Q' + IntToStr(k)].font.name := '굴림체';
      XL.Range['A3', 'Q' + IntToStr(k)].font.Size := 9;
      XL.Range['A1', 'Q' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
      XL.Selection.Columns.AutoFit;                                //자동정렬
      XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
      XL.Visible := true;                                          //엑셀자료 보여줌
      Screen.Cursor := crDefault;
      Ora_Sql3.GotoBookmark(SavePlace);
      Ora_Sql3.FreeBookmark(SavePlace);
      Ora_Sql3.EnableControls;
      SB_Help.SimpleText := '';
    end
    else
    begin
      XL.Range['A1:T2'].Merge;                   //셀 병합

      //TITLE NAME 설정
      XL.Range['A1'].value := CE_appdate.Text +' 월 승인내역';
      XL.Range['A1'].font.Size := 16;

      //컬럼명 지정_서브타이블 지정
      XArr[01] := '신청구분';
      XArr[02] := '사원번호';
      XArr[03] := '성명';
      XArr[04] := '재직상태';
      XArr[05] := '근무지';
      XArr[06] := '환자명';
      XArr[07] := '관계코드';
      XArr[08] := '관계';
      XArr[09] := '당월신청액';
      XArr[10] := '신청누계액';
      XArr[11] := '당월제외액';
      XArr[12] := '제외누계액';
      XArr[13] := '당월승인액';
      XArr[14] := '승인누계액';
      XArr[15] := '당월조정액';
      XArr[16] := '조정누계액';
      XArr[17] := '잔여누계액'; //전월이월액
      XArr[18] := '당월지원액';
      XArr[19] := '지원누계액';

      XL.Range['A3' , 'T3'].Value := XArr;
      k := 3;
      for i := 1 to 19 do
      begin
        XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
        XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
        XL.Range[CHR(64 + i) + '3'].font.Size := 10;
        XL.Range[CHR(64 + i) + '3'].font.Bold := True;
      end;
      //검색된 자료를 excel에 export처리 시킨다.
      SavePlace := Ora_Sql3.GetBookmark;
      Ora_Sql3.DisableControls;
      Ora_Sql3.First;

      for i := 1 to  Ora_Sql3.RecordCount do
      begin
        XArr[01] := Ora_Sql3.FieldbyName('PART').AsString;
        XArr[02] := ''''+Ora_Sql3.FieldbyName('EMPNO').AsString;
        XArr[03] := Ora_Sql3.FieldbyName('KORNAME').AsString;
        XArr[04] := Ora_Sql3.FieldByName('PSTATENAME').AsString;
        XArr[05] := Ora_Sql3.FieldByName('JOBPLACE').AsString;
        XArr[06] := Ora_Sql3.FieldbyName('FAMINAME').AsString;
        XArr[07] := ''''+Ora_Sql3.FieldByName('FAMIREL').AsString;
        XArr[08] := Ora_Sql3.FieldByName('FAMIRELNAME').AsString;
        XArr[09] := Ora_Sql3.FieldByName('APPAMT').AsFloat;
        XArr[10] := Ora_Sql3.FieldByName('APPSUM').AsFloat;
        XArr[11] := Ora_Sql3.FieldByName('EXTAMT').AsFloat;
        XArr[12] := Ora_Sql3.FieldByName('EXTSUM').AsFloat;
        XArr[13] := Ora_Sql3.FieldByName('CONAMT').AsFloat;
        XArr[14] := Ora_Sql3.FieldByName('CONSUM').AsFloat;
        XArr[15] := Ora_Sql3.FieldByName('SETAMT').AsFloat;
        XArr[16] := Ora_Sql3.FieldByName('SETSUM').AsFloat;
        XArr[17] := Ora_Sql3.FieldByName('JANSUM').AsFloat; //PREAMT
        XArr[18] := Ora_Sql3.FieldByName('SUPAMT').AsFloat;
        XArr[19] := Ora_Sql3.FieldByName('SUPSUM').AsFloat;

        XL.Range['A' + IntToStr(k+1), 'T' + IntToStr(k+1)].Value := XArr;
        inc(k);
        Ora_Sql3.Next;
      end;
      XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
      XL.Range['A1', 'T' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
      XL.Range['A1', 'T' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
      XL.Range['A1', 'T' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
      XL.Range['A1', 'T' + IntToStr(k)].font.name := '굴림체';
      XL.Range['A3', 'T' + IntToStr(k)].font.Size := 9;
      XL.Range['A1', 'T' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
      XL.Selection.Columns.AutoFit;                                //자동정렬
      XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
      XL.Visible := true;                                          //엑셀자료 보여줌
      Screen.Cursor := crDefault;
      Ora_Sql3.GotoBookmark(SavePlace);
      Ora_Sql3.FreeBookmark(SavePlace);
      Ora_Sql3.EnableControls;
      SB_Help.SimpleText := '';
    end;
  end;
end;

procedure TFM_Mainform.NE_PreamtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (NE_Preamt.Value > 0) then
    NE_PreamtExit(Sender);
end;

procedure TFM_Mainform.NE_PreamtExit(Sender: TObject);
begin
  //전월이월금액 한도 체크...
  if (NE_Preamt.Value > 0) then
  begin
    with Ora_Comm do
    begin
      Close;
      Sql.Clear;
      SQL.Add ( ' select sum(preamt) A1,                          ');
      SQL.Add ( '        FINDSPEC(SUBSTR(APPDATE,1,4 ), EMPNO) A2 ');
      SQL.Add ( ' from pshaplay                                   ');
      SQL.Add ( '  where appdate = '''+ FL_Appdate1 + '''         ');
      SQL.Add ( '    and empno   = '''+ FL_AppEmpno + '''         ');
      SQL.Add ( '    and conyn   = ''Y'' ');
      Open;
    end;

    if (Ora_Comm.FieldByName('A1').AsFloat + NE_Preamt.Value) > Ora_Comm.FieldByName('A2').AsFloat then
    begin
      MessageDlg('해당사원의 전월이월금액  한도('+FloatToStr(Ora_Comm.FieldByName('A2').AsFloat)+'원) 초과입니다. 확인요망.', mtInformation, [mbOk], 0);
      NE_Preamt.Value := 0;
    end;
  end;
end;

//임의로 체육활동 합계데이터 생성하기................
procedure TFM_Mainform.Button1Click(Sender: TObject);
 var i : integer;
begin
  if MessageDlg('체육활동  합계금액 데이터 생성 작업을 하시겠습니까? '
                , mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     System.Exit;

  PageControl1.ActivePage := TabSheet2;
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    SQL.Add ( ' select sum(preamt) A1 from pshaplay     ');
    SQL.Add ( '  where appdate = '''+ FL_Appdate1 + ''' ');
    SQL.Add ( '    and empno   = '''+ FL_AppEmpno + ''' ');
    SQL.Add ( '    and conyn   = ''Y'' ');
    Open;
  end;
  OraQuery1.First;
  with OraQuery1 do
  begin
    for i := 1 to OraQuery1.RecordCount -1 do
    begin
      DataSum(FieldByName('APPDATE').AsString,
              FieldByName('Empno').AsString,
              FieldByName('Faminame').AsString,
              '',
              '');
      next;
    end;
  end;
end;


procedure TFM_Mainform.BT_ModifyClick(Sender: TObject);
var
   cnt, sPreDate, sAppdate, sEmpno : String;
begin
  sAppdate := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
  sEmpno   := Copy( Trim(PE_appemp.Text),1,4);
  
  if length( sEmpno ) <> 4 then
  begin
       ShowMessage('신청사원란에 변경할 사원을 조회후 작업을 진행하세요.');
       Exit;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       SQL.Add('select Count(*)   a,                                                        ');
       SQL.Add('       to_char(add_months(to_date(max(appdate),''YYYYMM''),1), ''YYYYMM'') b');
       SQL.Add('  from pshaphos                                                             ');
       SQL.Add(' where appdate          = '''+ sAppdate + '''                               ');
       SQL.Add('   and empno            = '''+ sEmpno   + '''                               ');
       SQL.Add('   and nvl(conyn,''N'') = ''N''                                             ');
       Open;
       cnt      := IntToStr(FieldByName('a').AsInteger);
       sPreDate := FieldByName('b').AsString;

       if FieldByName('a').AsInteger = 0 then
       begin
            ShowMessage('해당월에 해당사원의 미승인내역이 없습니다.   확인후 작업을 진행하세요.');
            Close;
            Exit;
       end;
       Close;
  end;

  if MessageDlg(PE_appemp.Text + ' 사원의 미승인 데이터  ' +
                cnt            + ' 건을 '+
                sPreDate       + ' 월로 이관 작업을 진행하시겠습니까? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     System.Exit;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       //2013.03.22.hjku. 데이타이관시 오류로 인하여 seq 추가
       //2014.05.09.jissi 데이타이관시 오류로 인하여 max(seq)+1 -> max(seq)+a.seq로 변경
       SQL.Add('update pshaphos a                              ');
       SQL.Add('   set appdate          = '''+ sPreDate + ''', ');
       SQL.Add('       seq              = nvl((select max(seq) from pshaphos where appdate ='''+ sPreDate + ''' and a.empno=empno),0)+a.seq ');
       SQL.Add(' where appdate          = '''+ sAppdate + ''' ');
       SQL.Add('   and empno            = '''+ sEmpno   + ''' ');
       SQL.Add('   and nvl(conyn,''N'') = ''N''               ');
       ExecSQL;
  end;

  ShowMessage('처리완료');
end;

// 당월 승인 의료비 내역만 별도로 EXCEL 추출 시작... 양혜림씨 요청서에 의해 2012.10.30 hjku
procedure TFM_Mainform.BT_Excel_HosClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
    sAppYear, sAppMonth, partgubun : string;
begin
  BT_Search1Click(Sender);

  sAppYear  := Copy(CE_appdate.Text,1,4) ;
  sAppMonth := Copy(CE_appdate.Text,8,2);

  if      (CheckBox1.Checked) and (CheckBox3.Checked) then partgubun := 'A'+''','''+'D'
  else if (CheckBox1.Checked) then                         partgubun := 'A'
  else if (CheckBox3.Checked) then                         partgubun := 'D';

  if(sAppMonth = '01') or (sAppMonth='02' ) then sAppYear := inttostr(strtoint(sAppYear) -1);

  Ora_Sql6.FetchRows := 5000;
  with Ora_Sql6 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT * FROM (                                                                                                    ');
       Sql.Add('SELECT DECODE(A.PART,''A'',''의료비(일반)'',''D'',''의료비(중증)'','''') PART,                                     ');
       SQL.Add('       A.EMPNO, A.KORNAME, A.Faminame,                                                                             ');
       SQL.Add('      DECODE(A.FGUBUN,''0'',''본인'',''1'',''가족'',''2'',''부모'') FGUBUN,                                                    ');
       //SQL.Add('      (SELECT CODENAME FROM PKMYSCOD where CODENO = A.famirel) famirelname,                                      ');
       SQL.Add('       APPAMT, APPSUM,                                                                                             ');
       SQL.Add('       decode(SUBSTR(A.EMPNO,1,1),''M'',                                                                           ');
       SQL.Add('              NVL((SELECT SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0))                      ');
       SQL.Add('                     FROM PSHAPHOS                                                                                 ');
       SQL.Add('                    WHERE A.APPDATE=APPDATE AND A.EMPNO=EMPNO                                                      ');
       SQL.Add('                      AND NVL(A.FAMINAME,'' '') = NVL(FAMINAME,'' '') ),0),                                        ');
       SQL.Add('	      NVL((SELECT SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0))                      ');
       SQL.Add('                     FROM PSHAPHOS                                                                                 ');
       SQL.Add('                    WHERE A.APPDATE=APPDATE AND A.EMPNO=EMPNO),0))  NONCONAMT,                                     ');
       SQL.Add('       NVL(B.NONCONSUM,0) NONCONSUM,                                                                               ');
       SQL.Add('       EXTAMT ,   EXTSUM ,                                                                                         ');
       SQL.Add('       CONAMT ,   CONSUM ,                                                                                         ');
       SQL.Add('       DECODE(A.PART,''A'',                                                                                        ');
       SQL.Add('       DECODE(SUBSTR(A.EMPNO,1,1),''M'',                                                                           ');
       SQL.Add('	      CASE WHEN NOT EXISTS (SELECT 1 FROM PSHAPSUM                                                         ');
       SQL.Add('                                     WHERE APPDATE BETWEEN :appfrdate                                              ');
       SQL.Add('                                       AND TO_CHAR(ADD_MONTHS(TO_DATE(A.APPDATE,''YYYYMM''),-1),''YYYYMM'')        ');
       SQL.Add('                                       AND EMPNO  = A.EMPNO   AND PART    = A.PART                                 ');
       SQL.Add('	            		       AND NVL(FAMINAME,'' '') = NVL(A.FAMINAME,'' ''))                            ');
       SQL.Add('		   THEN (select Zminamt from PKZSPBAS where FAMIREL=A.FAMIREL) ElSE NULL END,                      ');
       SQL.Add('	      CASE WHEN NOT EXISTS (SELECT 1 FROM PSHAPSUM                                                         ');
       SQL.Add('                                     WHERE APPDATE BETWEEN :appfrdate                                              ');
       SQL.Add('                                       AND TO_CHAR(ADD_MONTHS(TO_DATE(A.APPDATE,''YYYYMM''),-1),''YYYYMM'')        ');
       SQL.Add('       	                               AND EMPNO = A.EMPNO    AND PART    = A.PART )                               ');
       SQL.Add('       	           THEN 500000 ELSE NULL END), 0) FIRSTEXCEPT,                                                     ');
       SQL.Add('       SUPAMT ,   SUPSUM                                                                                           ');
       SQL.Add('  FROM PSHAPSUM A,                                                                                                 ');
       SQL.Add('       (SELECT EMPNO,DECODE(SUBSTR(EMPNO,1,1),''M'',FAMINAME,'''') FAMINAME,                                       ');
       SQL.Add('               DECODE(SUBSTR(EMPNO,1,1),''M'',FAMIREL,'''')  FAMIREL,                                              ');
       SQL.Add('	       SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0)) NONCONSUM                       ');
       SQL.Add('          FROM PSHAPHOS                                                                                            ');
       SQL.Add('         WHERE APPDATE BETWEEN :appfrdate AND :appdate                                                             ');
       SQL.Add('	 GROUP BY EMPNO,DECODE(SUBSTR(EMPNO,1,1),''M'',FAMINAME,''''),                                             ');
       SQL.Add('                        DECODE(SUBSTR(EMPNO,1,1),''M'',FAMIREL,'''')   ) B                                         ');
       SQL.Add(' WHERE APPDATE   =:appdate                                                                                         ');
       SQL.Add('   AND A.PART IN ( '''+ partgubun +''' )                                                                           ');
       SQL.Add('   AND A.EMPNO   = B.EMPNO(+)                                                                                      ');
       SQL.Add('   AND NVL(A.FAMINAME, '' '')= NVL(B.FAMINAME(+), '' '')                                                           ');
       SQL.Add('   AND NVL(A.FAMIREL, '' '') = NVL(B.FAMIREL(+), '' '')                                                            ');
       SQL.Add('   AND A.EMPNO Like :appemp                                                                                        ');
//       SQL.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto                                                                      ');
       SQL.Add('Union                                                                                                              ');
       Sql.Add('SELECT DECODE(PART,''A'',''의료비(일반)'',''D'',''의료비(중증)'','''') PART,                                       ');
       SQL.Add('       DECODE(SUBSTR(A.EMPNO,1,1),''M'',''MZZZ'',''L999''),  '''', '''','''',                                      ');
       SQL.Add('       Sum(APPAMT),    Sum(APPSUM),                                                                                ');
       SQL.Add('       Sum(NONCONAMT),                                                                                             ');
       SQL.Add('       SUM(NONCONSUM),                                                                                             ');
       SQL.Add('       Sum(EXTAMT) ,   Sum(EXTSUM) ,                                                                               ');
       SQL.Add('       Sum(CONAMT) ,   Sum(CONSUM) ,                                                                               ');
       SQL.Add('       Sum(FIRSTEXCEPT),                                                                                           ');
       SQL.Add('       Sum(SUPAMT) ,   Sum(SUPSUM)                                                                                 ');
       SQL.Add('  FROM(                                                                                                            ');
       SQL.Add('       SELECT A.PART, A.EMPNO, A.KORNAME, A.Faminame,                                                              ');
       SQL.Add('              (SELECT CODENAME FROM PKMYSCOD where CODENO = A.famirel) famirelname,                                ');
       SQL.Add('              APPAMT,    APPSUM,                                                                                   ');
       SQL.Add('              decode(SUBSTR(A.EMPNO,1,1),''M'',                                                                    ');
       SQL.Add('                     NVL((SELECT SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0))               ');
       SQL.Add('                            FROM PSHAPHOS                                                                          ');
       SQL.Add('                           WHERE A.APPDATE=APPDATE AND A.EMPNO=EMPNO                                               ');
       SQL.Add('                             AND NVL(A.FAMINAME,'' '') = NVL(FAMINAME,'' '') ),0),                                 ');
       SQL.Add('	                 NVL((SELECT SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0))           ');
       SQL.Add('                            FROM PSHAPHOS                                                                          ');
       SQL.Add('                           WHERE A.APPDATE=APPDATE AND A.EMPNO=EMPNO),0))  NONCONAMT,                              ');
       SQL.Add('              NVL(B.NONCONSUM,0) NONCONSUM,                                                                        ');
       SQL.Add('              EXTAMT ,   EXTSUM ,                                                                                  ');
       SQL.Add('              CONAMT ,   CONSUM ,                                                                                  ');
       SQL.Add('              DECODE(A.PART,''A'',                                                                                 ');
       SQL.Add('              DECODE(SUBSTR(A.EMPNO,1,1),''M'',                                                                    ');
       SQL.Add('		     CASE WHEN NOT EXISTS (SELECT 1 FROM PSHAPSUM                                                  ');
       SQL.Add('                                            WHERE APPDATE BETWEEN :appfrdate                                       ');
       SQL.Add('                                              AND TO_CHAR(ADD_MONTHS(TO_DATE(A.APPDATE,''YYYYMM''),-1),''YYYYMM'') ');
       SQL.Add('              	                              AND EMPNO = A.EMPNO  AND PART    = A.PART                            ');
       SQL.Add('					      AND NVL(FAMINAME,'' '') = NVL(A.FAMINAME,'' ''))                     ');
       SQL.Add('		          THEN (select Zminamt from PKZSPBAS where FAMIREL=A.FAMIREL) ElSE NULL END,               ');
       SQL.Add('       	             CASE WHEN NOT EXISTS (SELECT 1 FROM PSHAPSUM                                                  ');
       SQL.Add('                                            WHERE APPDATE BETWEEN :appfrdate                                       ');
       SQL.Add('                                              AND TO_CHAR(ADD_MONTHS(TO_DATE(A.APPDATE,''YYYYMM''),-1),''YYYYMM'') ');
       SQL.Add('              	                              AND EMPNO = A.EMPNO AND PART    = A.PART )                           ');
       SQL.Add('              	          THEN 500000 ELSE NULL END), 0) FIRSTEXCEPT,                                              ');
       SQL.Add('              SUPAMT ,   SUPSUM                                                                                    ');
       SQL.Add('         FROM PSHAPSUM A,                                                                                          ');
       SQL.Add('              (SELECT EMPNO,DECODE(SUBSTR(EMPNO,1,1),''M'',FAMINAME,'''') FAMINAME,                                ');
       SQL.Add('                      DECODE(SUBSTR(EMPNO,1,1),''M'',FAMIREL,'''')  FAMIREL,                                       ');
       SQL.Add('       	              SUM(DECODE(NVL(CONYN,''N''),''N'',NVL(CASHAMT,0)+NVL(CARDAMT,0),0)) NONCONSUM                ');
       SQL.Add('                 FROM PSHAPHOS                                                                                     ');
       SQL.Add('                WHERE APPDATE BETWEEN :appfrdate AND :appdate                                                      ');
       SQL.Add('       		GROUP BY EMPNO,DECODE(SUBSTR(EMPNO,1,1),''M'',FAMINAME,''''),                                      ');
       SQL.Add('       		               DECODE(SUBSTR(EMPNO,1,1),''M'',FAMIREL,'''')   ) B                                  ');
       SQL.Add('        WHERE APPDATE   = :appdate                                                                                 ');
       SQL.Add('          AND A.PART IN ('''+ partgubun +''')                                                                      ');
       SQL.Add('          AND A.EMPNO   = B.EMPNO(+)                                                                               ');
       SQL.Add('          AND NVL(A.FAMINAME, '' '')= NVL(B.FAMINAME(+), '' '')                                                    ');
       SQL.Add('          AND NVL(A.FAMIREL, '' '') = NVL(B.FAMIREL(+), '' '')                                                     ');
       SQL.Add('          AND A.EMPNO Like :appemp                                                                                 ');
       SQL.Add('          )  A                                                                                                     ');  //AND A.JOBPLACE BETWEEN :codefr AND :codeto
       SQL.Add(' GROUP BY rollup(PART,DECODE(SUBSTR(A.EMPNO,1,1),''M'',''MZZZ'',''L999''))                                         ');
       SQL.Add(' ) WHERE NOT (PART IS NOT NULL AND EMPNO IS NULL)                                                                  ');
       SQL.Add(' ORDER BY 1                                                                                                        ');

       ParamByName('appfrdate').AsString := sAppYear+'03';
       ParamByName('appdate').AsString   := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
  //     ParamByName('codefr').AsString    := Copy(BE_jobfr.Text,1,2);
  //     ParamByName('codeto').AsString    := Copy(BE_jobto.Text,1,2);

       if Trim(PE_appemp.Text) = '' then
         ParamByName('appemp').AsString  := '%'
       else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
       begin
         ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
  //       ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...
  //       ParamByName('codeto').AsString  := 'ZZ';
       end
       else
         MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);
       //Edit1.text := sql.text;
       Open;

       TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,###';
       TFloatField(FieldByName('NONCONAMT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('NONCONSUM')).DisplayFormat := '#,###';
       TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,###';
       TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,###';
       TFloatField(FieldByName('FIRSTEXCEPT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,###';
       TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,###';
  end;  //with Ora_Sql3 do

  if PageControl1.ActivePage = TabSheet3 then
  begin
       if Ora_Sql6.RecordCount < 1 then
       begin
            showmessage('엑셀 변환할 자료가 없습니다.');
            exit;
       end
       else if Ora_Sql6.RecordCount > 1500 then
       begin
            showmessage('승인내역 추출은 1500건 까지 가능합니다. 개발자에게 문의 하세요.');
            exit;
       end;

       SB_Help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

       XArr := VarArrayCreate([1, 16], VarVariant);
       try
            XL := CreateOLEObject('Excel.Application');  //Comobj
       except
            MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
            SB_Help.SimpleText := '';
            Exit;
       end;

       SB_Help.SimpleText := '자료를 변환하고 있습니다.';
       XL.WorkBooks.Add;         //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := '의료비 승인내역 List';  //시트명 부여
       XL.Range['A1:P2'].Merge;                   //셀 병합

       //TITLE NAME 설정
       XL.Range['A1'].value := CE_appdate.Text +' 월 의료비 승인내역';
       XL.Range['A1'].font.Size := 16;

       //컬럼명 지정_서브타이블 지정
       XArr[01] := '신청구분';
       XArr[02] := '사원번호';
       XArr[03] := '성명';
       XArr[04] := '환자명';
       XArr[05] := '관계';
       XArr[06] := '신청당월액';
       XArr[07] := '신청누계액';
       XArr[08] := '미승인당월액';
       XArr[09] := '미승인누계액';
       XArr[10] := '제외당월액';
       XArr[11] := '제외누계액';
       XArr[12] := '승인당월액';
       XArr[13] := '승인누계액';
       XArr[14] := '최초제외';
       XArr[15] := '당월지원액';
       XArr[16] := '지원누계액';

       XL.Range['A3' , 'P3'].Value := XArr;
       k := 3;
       for i := 1 to 16 do
       begin
         XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
         XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
         XL.Range[CHR(64 + i) + '3'].font.Size := 10;
         XL.Range[CHR(64 + i) + '3'].font.Bold := True;
       end;
       //////////////////////////////////////////////////////////////////////////////////////

       //검색된 자료를 excel에 export처리 시킨다.
       SavePlace := Ora_Sql6.GetBookmark;
       Ora_Sql6.DisableControls;
       Ora_Sql6.First;

       for i := 1 to  Ora_Sql6.RecordCount do
       begin
         If Ora_Sql6.FieldByName('PART').AsString = '의료비(일반)' Then
           begin
           if Ora_Sql6.FieldByName('EMPNO').AsString = 'L999' then
           Begin
             XArr[1] := '정규직 일반(소계)';
             XArr[2] := '';
             XArr[3] := '';
           end
           else if Ora_Sql6.FieldByName('EMPNO').AsString = 'MZZZ' then
           begin
             XArr[1] := '임원 일반(소계)';
             XArr[2] := '';
             XArr[3] := '';
           end
           else if Ora_Sql6.FieldByName('EMPNO').AsString = '' then
           begin
             XArr[1] := '전체합계';
             XArr[2] := '';
             XArr[3] := '';
           end
           else
           begin
             XArr[1] := ''''+Ora_Sql6.FieldbyName('PART').AsString;
             XArr[2] := ''''+Ora_Sql6.FieldbyName('EMPNO').AsString;
             XArr[3] := Ora_Sql6.FieldbyName('KORNAME').AsString;
           end;
         End
         Else
           begin
           if Ora_Sql6.FieldByName('EMPNO').AsString = 'L999' then
           Begin
             XArr[1] := '정규직 중증(소계)';
             XArr[2] := '';
             XArr[3] := '';
           end
           else if Ora_Sql6.FieldByName('EMPNO').AsString = 'MZZZ' then
           begin
             XArr[1] := '임원 중증(소계)';
             XArr[2] := '';
             XArr[3] := '';
           end
           else if Ora_Sql6.FieldByName('EMPNO').AsString = '' then
           begin
             XArr[1] := '전체합계';
             XArr[2] := '';
             XArr[3] := '';
           end
           else
           begin
             XArr[1] := ''''+Ora_Sql6.FieldbyName('PART').AsString;
             XArr[2] := ''''+Ora_Sql6.FieldbyName('EMPNO').AsString;
             XArr[3] := Ora_Sql6.FieldbyName('KORNAME').AsString;
           end;
         End;

         XArr[04] := Ora_Sql6.FieldbyName('FAMINAME').AsString;
         XArr[05] := Ora_Sql6.FieldbyName('FGUBUN').AsString;
         XArr[06] := Ora_Sql6.FieldByName('APPAMT').AsFloat;
         XArr[07] := Ora_Sql6.FieldByName('APPSUM').AsFloat;
         XArr[08] := Ora_Sql6.FieldByName('NONCONAMT').AsFloat;
         XArr[09] := Ora_Sql6.FieldByName('NONCONSUM').AsFloat;
         XArr[10] := Ora_Sql6.FieldByName('EXTAMT').AsFloat;
         XArr[11] := Ora_Sql6.FieldByName('EXTSUM').AsFloat;
         XArr[12] := Ora_Sql6.FieldByName('CONAMT').AsFloat;
         XArr[13] := Ora_Sql6.FieldByName('CONSUM').AsFloat;
         XArr[14] := Ora_Sql6.FieldByName('FIRSTEXCEPT').AsFloat;
         XArr[15] := Ora_Sql6.FieldByName('SUPAMT').AsFloat;
         XArr[16] := Ora_Sql6.FieldByName('SUPSUM').AsFloat;

         XL.Range['A' + IntToStr(k+1), 'P' + IntToStr(k+1)].Value := XArr;

         if (Ora_Sql6.FieldbyName('EMPNO').AsString ='L999') or
            (Ora_Sql6.FieldbyName('EMPNO').AsString ='MZZZ') or
            (Ora_Sql6.FieldbyName('EMPNO').AsString ='') then
         begin
           XL.Range['A' + IntToStr(k+1), 'P' + IntToStr(k+1)].Interior.Color:= $00CBF0B3 ;
           XL.Range['A' + IntToStr(k+1), 'P' + IntToStr(k+1)].font.Size := 10;
           XL.Range['A' + IntToStr(k+1), 'P' + IntToStr(k+1)].font.Bold := True;
         end;

         inc(k);
         Ora_Sql6.Next;
       end;

       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A1', 'P' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'P' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', 'P' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정   1은 검은색
       XL.Range['A1', 'P' + IntToStr(k)].font.name := '굴림체';
       XL.Range['A3', 'P' + IntToStr(k)].font.Size := 9;
       XL.Range['A1', 'P' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                //자동정렬
       XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴

       XL.Visible := true;                                          //엑셀자료 보여줌
       Screen.Cursor := crDefault;
       Ora_Sql6.GotoBookmark(SavePlace);
       Ora_Sql6.FreeBookmark(SavePlace);
       Ora_Sql6.EnableControls;
       SB_Help.SimpleText := '';
  end;
end;
// 당월 승인 의료비 내역만 별도로 EXCEL 추출 종료... 양혜림 요청서에 의해 2012.10.30 hjku
procedure TFM_Mainform.Ds_Hos1DataChange(Sender: TObject; Field: TField);
 var  partgubun : String;
begin
  FL_corpname  := '';
  FL_playdate  := '';
//  NE_division2.Value := 0;

// if not FL_SaveClick then
//  begin
//    if PageControl1.ActivePage = TabSheet1 then
//      begin
        FL_Appdate1     := Ora_Hos1.FieldByName('appdate').AsString; //선택한 신청년월
        FL_AppEmpno     := Ora_Hos1.FieldByName('empno').AsString;   //선택한 사번
        FL_AppFamiJumin := Ora_Hos1.FieldByName('FAMIJUMIN').AsString;
        FL_AppCorpNo    := Ora_Hos1.FieldByName('CORPNO').AsString;
        partgubun       := 'A';
//      end
//  end;

    Ora_Hos2.FetchRows  := 5000;

    with Ora_Hos2 do
      begin
        Close;
        Sql.Clear;
        SQL.ADD('SELECT                                                                                                                   ');
        SQL.ADD('      RANK,                                                                                                              ');
        SQL.ADD('      DECODE(SORT_FLAG,''01'', APPDATE,'''') APPDATE,                                                                    ');
        SQL.ADD('      DECODE(SORT_FLAG,''01'', CORPNO,'''') CORPNO,                                                                      ');
//        SQL.ADD('      DECODE(SORT_FLAG,''01'', CORPNAME,''02'',''소계'',''총합계'') CORPNAME,                                            ');
        SQL.ADD('      DECODE(SORT_FLAG,''01'', CORPNAME,'''') CORPNAME,                                                                  ');
        SQL.ADD('      DECODE(SORT_FLAG,''01'', FAMINAME,'''') FAMINAME,                                                                  ');
        SQL.ADD('      DECODE(SORT_FLAG,''01'', MEDIDATE,''02'',''소계'',''총합계'') MEDIDATE,                                            ');
        //SQL.ADD('      DECODE(SORT_FLAG,''01'', MEDIDATE,'''') MEDIDATE,                                                                  ');
        SQL.ADD('      APPAMT,                                                                                                            ');
        SQL.ADD('      CONAMT,                                                                                                            ');
        SQL.ADD('      EXAMT                                                                                                              ');
        SQL.ADD('FROM (                                                                                                                   ');
        SQL.ADD('     SELECT                                                                                                              ');
        SQL.ADD('           RANK() OVER (ORDER BY APPDATE,CORPNO,FAMINAME,MEDIDATE, SORT_FLAG) AS RANK,                                   ');
        SQL.ADD('           A.*                                                                                                           ');
        SQL.ADD('     FROM (                                                                                                              ');
        SQL.ADD('          SELECT ''01'' SORT_FLAG, APPDATE, CORPNO, CORPNAME, FAMINAME,MEDIDATE,                                         ');
        SQL.ADD('                 (NVL(CASHAMT,0) + NVL(CARDAMT,0)) APPAMT,                                                               ');
        SQL.ADD('                 DECODE(NVL(CONYN,''N''),''Y'',(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0) CONAMT,                              ');
        SQL.ADD('                 NVL(EXCEPTAMT,0) EXAMT                                                                                  ');
        SQL.ADD('            FROM PSHAPHOS A                                                                                              ');
        SQL.ADD('           WHERE APPDATE BETWEEN (CASE WHEN SUBSTR(:APPDATE,5,2) IN (''01'',''02'')                                      ');
        SQL.ADD('                                       THEN TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-12),''YYYY'')               ');
        SQL.ADD('                     ELSE SUBSTR(:APPDATE,1,4)                                                                           ');
        SQL.ADD('                      END)||''03''                                                                                       ');
//        SQL.ADD('                       AND :APPDATE                                                                                      ');
        SQL.ADD('                       AND TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-1),''YYYYMM'')                               ');
        SQL.ADD('             AND A.EMPNO    LIKE :APPEMP                                                                                 ');
        Sql.Add('             AND A.FAMIJUMIN = :appfaminjumin                                                                            ');
        Sql.Add('             AND A.CORPNO    = :appcorpno                                                                                ');
        SQL.ADD('             AND A.JOBPLACE BETWEEN :CODEFR AND :CODETO                                                                  ');
        //SQL.ADD('           GROUP BY APPDATE, CORPNO, CORPNAME, FAMINAME,MEDIDATE                                                         ');

        SQL.ADD('          UNION ALL                                                                                                      ');
        SQL.ADD('          SELECT ''02'' SORT_FLAG, APPDATE, CORPNO, '''' CORPNAME, FAMINAME, '''' MEDIDATE,                                   ');
        SQL.ADD('           SUM(NVL(CASHAMT,0) + NVL(CARDAMT,0)) APPAMT,                                                                  ');
        SQL.ADD('                 SUM(DECODE(NVL(CONYN,''N''),''Y'',(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0)) CONAMT,                         ');
        SQL.ADD('                 SUM(NVL(EXCEPTAMT,0)) EXAMT                                                                             ');
        SQL.ADD('            FROM PSHAPHOS A                                                                                              ');
        SQL.ADD('           WHERE APPDATE BETWEEN (CASE WHEN SUBSTR(:APPDATE,5,2) IN (''01'',''02'')                                      ');
        SQL.ADD('                                       THEN TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-12),''YYYY'')               ');
        SQL.ADD('                     ELSE SUBSTR(:APPDATE,1,4)                                                                           ');
        SQL.ADD('                      END)||''03''                                                                                       ');
        //SQL.ADD('                       AND :APPDATE                                                                                      ');
        SQL.ADD('                       AND TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-1),''YYYYMM'')                               ');
        SQL.ADD('             AND A.EMPNO    LIKE :APPEMP                                                                                 ');
        Sql.Add('             AND A.FAMIJUMIN = :appfaminjumin                                                                            ');
        Sql.Add('             AND A.CORPNO    = :appcorpno                                                                                ');
        SQL.ADD('             AND A.JOBPLACE BETWEEN :CODEFR AND :CODETO                                                                  ');
        SQL.ADD('           GROUP BY APPDATE,CORPNO,FAMINAME                                                                              ');

        SQL.ADD('          UNION ALL                                                                                                      ');
        SQL.ADD('          SELECT ''03'' SORT_FLAG, MAX(APPDATE) APPDATE, ''ZZZZZZZZZZ'' CORPNO, '''' CORPNAME, '''' FAMINAME,'''' MEDIDATE,   ');
        SQL.ADD('           SUM(NVL(CASHAMT,0) + NVL(CARDAMT,0)) APPAMT,                                                                  ');
        SQL.ADD('                 SUM(DECODE(NVL(CONYN,''N''),''Y'',(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0)) CONAMT,                         ');
        SQL.ADD('                 SUM(NVL(EXCEPTAMT,0)) EXAMT                                                                             ');
        SQL.ADD('            FROM PSHAPHOS A                                                                                              ');
        SQL.ADD('           WHERE APPDATE BETWEEN (CASE WHEN SUBSTR(:APPDATE,5,2) IN (''01'',''02'')                                      ');
        SQL.ADD('                                       THEN TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-12),''YYYY'')               ');
        SQL.ADD('                     ELSE SUBSTR(:APPDATE,1,4)                                                                           ');
        SQL.ADD('                      END)||''03''                                                                                       ');
        //SQL.ADD('                       AND :APPDATE                                                                                      ');
        SQL.ADD('                       AND TO_CHAR(ADD_MONTHS(TO_DATE(:APPDATE,''YYYYMM''),-1),''YYYYMM'')                               ');
        SQL.ADD('             AND A.EMPNO    LIKE :APPEMP                                                                                 ');
        Sql.Add('             AND A.FAMIJUMIN = :appfaminjumin                                                                            ');
        Sql.Add('             AND A.CORPNO    = :appcorpno                                                                                ');
        SQL.ADD('             AND A.JOBPLACE BETWEEN :CODEFR AND :CODETO                                                                  ');
        SQL.ADD('          ) A)                                                                                                           ');
        SQL.ADD('order by rank                                                                                                            ');

        ParamByName('appdate').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
        ParamByName('appfaminjumin').AsString := FL_AppFamiJumin;
        ParamByName('appcorpno').AsString := FL_AppCorpNo;
        ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
        ParamByName('codeto').AsString  := 'ZZ';

        Open;

        TFloatField(FieldByName('APPAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('CONAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('EXAMT')).DisplayFormat    := '#,###';
      end;
    DataSource1.DataSet := Ora_Hos3;
    Ora_Hos3.FetchRows  := 5000;
    
    with Ora_Hos3 do
      begin
        Close;
        Sql.Clear;
        SQL.Add('SELECT COUNT( DISTINCT A.EMPNO) OVER() COUNT1 , APPDATE, A.EMPNO,   ');
        SQL.Add('       A.KORNAME,  SEQ, FAMINAME, FAMIJUMIN,                        ');
        SQL.Add('       MEDIDATE, MEDCOMM, CORPNO, CORPNAME,                         ');
        SQL.Add('       NVL(CASHAMT,0)+NVL(CARDAMT,0)  TOTAMT,                       ');
        SQL.Add('       CONYN,  CONYNSAYU, EXCEPTAMT,  DEPTNAME,                     ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I160'' AND CODENO= A.JOBPLACE) JOBPLACE,    ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I112'' AND CODENO= A.PAYCL) PAYCLNAME,      ');
        SQL.Add('      (SELECT CODENAME FROM PYCCODE                                 ');
        SQL.Add('        WHERE CODEID =''I114'' AND CODENO= B.PSTATE) PSTATENAME,    ');
        SQL.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE CODENO=A.FAMIREL) RELNAME');
        SQL.Add('  FROM PSHAPHOS A, PIMPMAS B, PYCDEPT C');
        SQL.Add(' WHERE A.EMPNO     = B.EMPNO   ');
        SQL.Add('   AND APPDATE     = :appdate   ');
        SQL.Add('   AND B.ORGNUM    = C.ORGNUM  ');
        SQL.Add('   AND B.DEPTCODE  = C.DEPTCODE');
        Sql.Add('   AND A.EMPNO     = :appemp ');
        Sql.Add('   AND A.FAMIJUMIN = :appfaminjumin ');
        Sql.Add('   AND A.CORPNO    = :appcorpno ');
        Sql.Add('   AND A.JOBPLACE BETWEEN :codefr AND :codeto');
//        SQL.Add('   AND A.JOBPLACE in (SELECT JOBPLACE FROM PSCAPJOB WHERE Empno = '''+ FG_Empno +''' ) '); //승인자 관할 부서만 나오도록

        if      CB_conyn.Text = '전체'   then SQL.Add(' Order by MEDIDATE  ')
        else if CB_conyn.Text = '미결재' then SQL.Add(' AND CONYN  IS NULL  Order by MEDIDATE ')
        else
        begin
          SQL.Add(' AND CONYN  = :conyn  Order by MEDIDATE ');
          ParamByName('conyn').AsString  := CB_conyn.Text;
        end;

        ParamByName('appdate').AsString := FL_Appdate1;
        ParamByName('appfaminjumin').AsString := FL_AppFamiJumin;
        ParamByName('appcorpno').AsString := FL_AppCorpNo;
        ParamByName('codefr').AsString  := Copy(BE_jobfr.Text,1,2);
        ParamByName('codeto').AsString  := Copy(BE_jobto.Text,1,2);

        if      Trim(PE_appemp.Text) = '' then  ParamByName('appemp').AsString  := '%'
        else if Length(Copy(Trim(PE_appemp.Text),1,4)) = 4 then
        begin
          ParamByName('appemp').AsString  := Copy(Trim(PE_appemp.Text),1,4);
          ParamByName('codefr').AsString  := '00'; // 1 명만 조회시 근무지 조건 받지 않도록...(단, 관할근무지내)
          ParamByName('codeto').AsString  := 'ZZ';
        end
        else MessageDlg('신청사원의 사번을 정확히 입력하시기 바랍니다.', mtInformation, [mbOk], 0);

        Open;

        TFloatField(FieldByName('TOTAMT')).DisplayFormat    := '#,###';
        TFloatField(FieldByName('EXCEPTAMT')).DisplayFormat := '#,###';
      end;

      with Ora_Sql5 do
      begin
        Ora_Sql5.Close;
        Ora_Sql5.Sql.Clear;
        Ora_Sql5.SQL.Add('SELECT COUNT(DISTINCT EMPNO) EMPCNT,SUM(PLAYAMT)-SUM(EXCEPTAMT)+nvl(sum(SETAMT),0) PLAYAMT FROM PSHAPLAY     ');
        Ora_Sql5.SQL.Add('WHERE APPDATE =:appdate2                                                  ');
        Ora_Sql5.SQL.Add('  AND  CONYN =''Y''                                                 ');
        Ora_Sql5.ParamByName('appdate2').AsString := Copy(CE_appdate.Text,1,4)+Copy(CE_appdate.Text,8,2);
        Ora_Sql5.open;
        BE_Playsum.Text := '체육활동비 '+FieldByName('EMPCNT').AsString +'명'+
                           FormatFloat('#,##0',FieldByName('PLAYAMT').AsFloat) + '원 입니다';

      end;
end;

procedure TFM_Mainform.DbGrid7DblClick(Sender: TObject);
begin
  PE_appemp.text := DbGrid7.Fields[0].AsString;
  PageControl1.ActivePage := TabSheet1;
  CheckBox1.Checked := True;
  CheckBox2.Checked := False;
  CB_conyn.Text  := 'N';
end;

procedure TFM_Mainform.Send_Select;
VAR
  FINAYN    : String;
Begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT DISTINCT MESYN ');
    SQL.ADD(' FROM PSHAPHOS         ');
    SQL.ADD('  WHERE APPDATE = '''+Copy(FM_Mainform.CE_appdate.Text,1,4)+Copy(FM_Mainform.CE_appdate.Text,8,2)+''' ');
    SQL.ADD('    AND   EMPNO = '''+Copy(PE_appemp.text ,1,4)+''' ');
    Open;
    //Sms 발송여부(Y : 전체승인, N : 비승인(승인포함), X : 비지원(승인포함), Null : 미전송 2014.11.06 By HeeYong)
    FINAYN := FieldByName('MESYN').AsString;

    If (OraQuery1.RecordCount = 0) Then LB_Fina.Caption := ''
    Else
    Begin
      if      (FINAYN = 'Y') Then LB_Fina.Caption := '발송(승인내역)'
      Else if (FINAYN = 'N') Then LB_Fina.Caption := '발송(비승인내역)'
      Else if (FINAYN = 'X') Then LB_Fina.Caption := '발송(비지원내역)'
      Else                        LB_Fina.Caption := '미발송';
    End;
  end;
End;

procedure TFM_Mainform.DbGrid7CellClick(Column: TColumn);
begin
  PE_appemp.text := DbGrid7.Fields[0].AsString;
end;

procedure TFM_Mainform.BT_SendClick(Sender: TObject);
var
  v_empno : String;
begin
  if(Length(Copy(Trim(PE_appemp.Text),1,4)) <> 4) then
  begin
    ShowMessage('신청사원란에 메세지 발송할 사원을 조회후 작업을 진행하세요.');
    PE_appemp.SetFocus;
    exit;
  end;

  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT EMPNO, KORNAME ');
    SQL.ADD(' FROM PIMPMAS        ');
    SQL.ADD('  WHERE EMPNO = '''+Copy(PE_appemp.text ,1,4)+''' ');
    Open;

    v_empno := FieldByName('EMPNO').AsString + ' (' +  FieldByName('KORNAME').AsString + ')';
  End;


  Application.CreateForm(TFM_Sms, FM_Sms);

  FM_Sms.OE_Acce.Text := v_empno;
  FM_Sms.ShowModal;
end;

//2015.01.22.hjku. 체육활동비 제외 누계 계산 추가..
procedure TFM_Mainform.PL_Get_Except_Sum(v_empno, v_appdate, v_seq : String;  cur_playsum : double ; out cur_exceptsum : double);
var
  pre_playsum, pre_exceptsum, playsum, exceptsum, FL_GiveMax : double;
begin
  pre_playsum   := 0.0;
  pre_exceptsum := 0.0;
  playsum       := 0.0;
  exceptsum     := 0.0;
  cur_exceptsum := 0.0;
  FL_GiveMax    := 0.0;

  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    sql.Add('SELECT nvl(SUM(NVL(PLAYAMT,0))-SUM(NVL(SETAMT,0)),0)   PRE_PLAYSUM,  ');
    sql.Add('       nvl(SUM(NVL(EXCEPTAMT,0)),0) PRE_EXCEPTSUM ');
    sql.Add('  FROM PSHAPLAY                                   ');
    sql.Add(' WHERE APPDATE >= ''' + FL_MaxApp + '''           ');
    sql.Add('   AND EMPNO   =  ''' + v_empno + '''             ');
    sql.Add('   AND nvl(CONYN,''N'')=''Y''                     ');
    //2015.01.26.hjku.. 재승인시 현재 계산하고자 하는 승인금액을 제외하고 계산하도록 추가..
    sql.Add('   AND not(APPDATE =''' + v_appdate + ''' AND SEQ='''+v_seq+''') ');
    Open;

    pre_playsum   := FieldByName('PRE_PLAYSUM').Asfloat;
    pre_exceptsum := FieldByName('PRE_EXCEPTSUM').Asfloat;
  End;

  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    sql.Add('SELECT FINDSPEC('''+ copy(FL_MaxApp,1,4) +''', ''' + v_empno + ''') GIVEMAX');
    sql.Add('  FROM DUAL                                                                ');
    Open;

    FL_GiveMax    := FieldByName('GIVEMAX').Asfloat;
  End;


  playsum := pre_playsum + cur_playsum;
  exceptsum := playsum - FL_GiveMax;

  if(exceptsum < 0) then exceptsum :=0;

  cur_exceptsum := (exceptsum - pre_exceptsum);

  if(cur_exceptsum >  cur_playsum) then  cur_exceptsum := cur_playsum;

  if(cur_exceptsum < 0) then cur_exceptsum :=0;
end;

procedure TFM_Mainform.DbGrid2CellClick(Column: TColumn);
begin
//  PE_appemp.text := DbGrid2.Fields[0].AsString;
end;

procedure TFM_Mainform.DbGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  sAppdate, sEmpno, sSeq : String;
begin
  if (DbGrid2.SelectedRows.Count > 1) then
    NE_Preamt.Enabled := False
  else
  Begin
    NE_Preamt.Enabled := True;

    sAppdate := Ora_Sql2.FieldByName('appdate').AsString;
    sEmpno   := Ora_Sql2.FieldByName('empno').AsString;
    sSeq     := Ora_Sql2.FieldByName('seq').AsString;

    with OraQuery1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT COUNT(*) CNT FROM PSHPHOT   ');
      Sql.Add(' WHERE APPDATE = ''' +sAppdate+ ''' ');
      Sql.Add('   AND EMPNO   = ''' +sEmpno+  '''  ');
      Sql.Add('   AND SEQ     = ''' +sSeq+ '''     ');
      Open;

      if Fieldbyname('CNT').Asinteger >= 1 then
      begin
        if Button = mbRight then
        begin
          PopMenu.AutoPopup := False;
          PopMenu.Popup(TWincontrol(Sender).left+left+X,
                        TWincontrol(Sender).top+(top+100)+Y);
        end;
      end;
    End;
  End;
end;

procedure TFM_Mainform.ViewJPGClick(Sender: TObject);
begin
  FM_Viewer32 := TFM_Viewer32.Create(Self);
  try
    FM_Viewer32.ShowModal;
  finally
    FM_Viewer32.Free;
  end;
end;

procedure TFM_Mainform.F_AppDate;
var
  F_AppD : String;
begin
  F_AppD := FG_Appdate;

  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT CASE WHEN '''+F_AppD+''' <= ''201601'' THEN ''201501'' ');
    Sql.Add('       WHEN '''+F_AppD+''' > ''2016'' AND SUBSTR('''+F_AppD+''',5,2)=''01'' THEN TO_NUMBER(SUBSTR('''+F_AppD+''',1,4)-1)||''02'' ');
    Sql.Add('       ELSE SUBSTR('''+F_AppD+''',1,4)||''02''  END field1 ');
    Sql.Add('   FROM DUAL                          ');
    Open;
    FL_MaxApp := FieldByName('field1').AsString;
    Close;
  end;
end;

procedure TFM_Mainform.Get_Mail(ChkValue : Integer);
var
  i : Integer;
  ExSum,SCAMT,setamt : Double;
  scyymm,setcomm : String;
begin
  SendProgID := 'PSH1020A';
  SendEmpno  := FG_empno;
  ExSum      := ExceptSum;
  RcveEmpno  := MD_Data.FieldByName('Empno').AsString;
  SCAMT      := MD_Data.FieldByName('playamt').AsFloat -  ExSum - MD_Data.FieldByName('setamt').AsFloat;//지급금액
  setamt     := MD_Data.FieldByName('setamt').AsFloat;
  scyymm     := MD_Data.FieldByName('appdate').AsString;       //지급월
  setcomm    := MD_Data.FieldByName('setcomm').AsString; //조정사유

  If (ChkValue = 1) Then //승인메일
  Begin
    MailSubject := ' [체육활동지원금]승인요청 건이 [승인완료] 되었습니다. ';
    MailBody    := ' 체육활동 지원금 승인이 완료되었습니다. ' + #13#10+
                     scyymm+' 월 급여일에 '+formatfloat('#,###',SCAMT)+' 원이 급여에 포함되어 지급됩니다.'+ #13#10+
                    ' 제외금액: '+formatfloat('#,###',setamt)+  #13#10+
                    ' 제외사유 :' +setcomm ;
    If E_Consayu.Text <> '' Then
      MailBody  :=  MailBody +#13#13+ '승인사유 : ' + E_Consayu.Text;
  End
  Else                   //비승인메일
  Begin
    MailSubject := ' [체육활동지원금]승인요청 건이 [미승인 처리] 되었습니다. ';
    MailBody    := ' 체육활동 지원금 미승인. ' +#13#13+
                   '미승인 사유 확인 후 My-HR에 재등록 요청드립니다.';
    If E_bigo.Text <> '' Then
      MailBody  :=  MailBody +#13#13+ '미승인사유 : ' + E_bigo.Text;
  End;
  ReceiveYN   := 'N';

  FM_Sms.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
end;

procedure TFM_Mainform.RG_CheckClick(Sender: TObject);
begin
  BT_Search1Click(Sender);
end;

procedure TFM_Mainform.Chk_AllClick(Sender: TObject);
begin
  if (Chk_All.Checked) and (trim(PE_appemp.Text) = '') then
  begin
    ShowMessage('승인할 사원을 선택/조회후 작업을 진행하세요');
    Chk_All.Checked := False;
  end;
end;

procedure TFM_Mainform.DbGrid1CellClick(Column: TColumn);
begin
  NE_INSURAMT.Value := NE13.Value;
  NE_CANCEAMT.Value := NE14.Value;
end;

procedure TFM_Mainform.OnFocusButton2Click(Sender: TObject);
begin
  //sendmail();
end;

procedure TFM_Mainform.Sendmail;
var
 gubun :String;
begin
  {if not Ora_Sql3.Active then    System.Exit;
    if OnGrDbGrid1.SelectedRows.Count < 1 then
    begin
      MessageDlg('사원 선택후 저장하시기 바랍니다.', mtInformation,[mbOk], 0);
      System.Exit;
    end;
   gubun := Ora_Sql3.FieldByName('PART').AsString;
   if  gubun = '체육' then
   begin
     SMsg := '(사번 : ' + Ora_Sql3.FieldByName('Empno').AsString + ') 승인 메일을 발송하시겠습니까?';
     if IDYes = Application.MessageBox(StrPCopy(Msg, SMsg),'[작업안내]',MB_YesNo+MB_ICONQUESTION) then ;
   end else
   begin
     MessageDlg('체육활동지원금 승인 안내메일입니다.', mtInformation,[mbOk], 0);
   end;}
end;

end.
