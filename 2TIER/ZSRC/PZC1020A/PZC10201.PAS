{ ----------------------------------------------------------------------------
  PROGRAM-NAME    : PZC1020A(부서 코드 관리)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 전철호 (???)
  Version         : 1.00
  Date            : 1998. ??. ??
  Update Contents
    버전     수정일     수정자      관련근거        수정내용
 ----------------------------------------------------------------------------
    1.00   1996.04.19   전철호  신규프로그램개발   처리명세서
   30.00   2000.05.26.  강기우  전(2000.05.24)     근무지 변동시 마스터의 현인원들도 반영.
   30.01   2000.10.09   강기우  조직변경.          Partcode 본부코드 생성.
   30.02   2001.10.22   서혜미  인사팀 이석희      부서기능/부서세부기능 추가
   30.03   2001.12.07   서혜미  인사팀 이석희      조직개편(H06)으로 인한 화면 수정.
                                                   부서명(과)deptna3 -> 직무그룹으로 쓰기로 함.
   30.04   2002.08.26   서혜미  자체(박경철)       근무지관련(인사마스터 적용,미적용...)
                                                   미적용시 PYMPLOG 프로그램에 기록
   30.05   2003.11.13   정규용  H07차 조직개편     실제여부(EXISTON)에서 관리코드부분을 빼기 위해서
                                                   부문/실단코드 뿌려주는 부분변경(Get_Name 함수변경)
   30.06   2004.08.30   정규용  부서등급관련      부서등급을 콤보로만 입력받게 수정(관리자 잦은 사용 오류로)
   30.07   2004.11.09.  강륜종(dsa2000)            신규부서 등록후 재무부서코드 담당자에게 메일발송토록....
   30.08   2005.06.01.  변춘미                    총괄부서 추가(D0000,K0000)로 부서코드2 field추가하여 order by 시 사용
   30.14   2005.10.25.  최경진                    부서코드내역 수정/추가/삭제시 특정사람에게 Hint메일 전송 프로그램 추가
   30.15   2007.02.23.  서혜미                    HINT조직도 관리를 위한 FLAG생성을 위해 PYCDEPT_FLAG 에 INSERT/UPDATE 문 추가
---------------------------------------------------------------------------}
unit pzc10201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Mask, StdCtrls, Grids, DBGrids, Buttons,
  FileCtrl, ExtCtrls, Tabs, Timeftp, pass, Datelib, Calen1, codelib,
  codetext, forgnum, peoutlookbtn, ActiveX, Func, ComCtrls, ShellApi,
  OnFocusButton;

type
  TDeptForm = class(TForm)
    HeadPanel: TPanel;
    Panel6: TPanel;
    BB_exit: TBitBtn;
    BB_delete: TBitBtn;
    BB_cancel: TBitBtn;
    BB_save: TBitBtn;
    BB_input: TBitBtn;
    SearchPanel: TPanel;
    DBG_user: TDBGrid;
    DataPanel: TPanel;
    Panel7: TPanel;
    E_deptcode: TEdit;
    Query_dept: TQuery;
    DataSource1: TDataSource;
    Query_exec: TQuery;
    Panel10: TPanel;
    E_SERorgnum: TEdit;
    Panel3: TPanel;
    E_orgnum: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    E_deptna1: TEdit;
    Panel4: TPanel;
    Panel8: TPanel;
    E_deptna2: TEdit;
    E_deptna3: TEdit;
    Panel_existon: TPanel;
    RB_existon0: TRadioButton;
    RB_existon1: TRadioButton;
    Panel9: TPanel;
    E_placecode: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    E_fieldcode: TEdit;
    Panel11: TPanel;
    E_extcode: TEdit;
    Panel14: TPanel;
    E_boncode: TEdit;
    Panel15: TPanel;
    E_fincode: TEdit;
    Panel16: TPanel;
    E_overmode: TEdit;
    Panel17: TPanel;
    Panel19: TPanel;
    ME_reorgdate: TMaskEdit;
    Panel20: TPanel;
    Panel21: TPanel;
    ME_chandate: TMaskEdit;
    ME_closedate: TMaskEdit;
    Panel18: TPanel;
    Database1: TDatabase;
    Panel22: TPanel;
    E_SERdeptcode: TEdit;
    Panel23: TPanel;
    E_SERdeptname: TEdit;
    Lempinfo: TLabel;
    L_CurDate: TLabel;
    SB_reorgdate: TSpeedButton;
    SB_chandate: TSpeedButton;
    SB_closedate: TSpeedButton;
    BB_print: TBitBtn;
    BB_prnsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SB_placecode: TSpeedButton;
    L_fieldcode: TLabel;
    L_placecode: TLabel;
    BB_BatchRead: TBitBtn;
    OD_File: TOpenDialog;
    Panel26: TPanel;
    E_deptcodeFROM: TEdit;
    E_deptcodeTO: TEdit;
    Btext: TBitBtn;
    Panel5: TPanel;
    E_Sectcode: TEdit;
    L_SectCode: TLabel;
    Panel27: TPanel;
    E_Technique: TEdit;
    L_Technique: TLabel;
    L_Chanmode: TLabel;
    SB_DeptFunc: TSpeedButton;
    SB_ChanMode: TSpeedButton;
    E_Chanmode: TEdit;
    Qcod: TQuery;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    E_Borgnum: TEdit;
    E_Bdeptcode1: TEdit;
    E_BDeptcode2: TEdit;
    E_BDeptcode3: TEdit;
    L_BDeptcode1: TLabel;
    L_BDeptcode2: TLabel;
    L_BDeptcode3: TLabel;
    Panel_insa: TPanel;
    RB_insa2: TRadioButton;
    RB_insa1: TRadioButton;
    Panel30: TPanel;
    E_DetailsTech: TEdit;
    SpeedButton1: TSpeedButton;
    L_DetailsTech: TLabel;
    Query_deptORGNUM: TStringField;
    Query_deptDEPTCODE: TStringField;
    Query_deptDEPTNAME: TStringField;
    Query_deptDEPTNA1: TStringField;
    Query_deptDEPTNA2: TStringField;
    Query_deptDEPTNA3: TStringField;
    Query_deptDEPTABBR: TStringField;
    Query_deptEXISTON: TStringField;
    Query_deptPLACECODE: TStringField;
    Query_deptDEPTLEVEL: TStringField;
    Query_deptSECTCODE: TStringField;
    Query_deptFIELDCODE: TStringField;
    Query_deptEXTCODE: TStringField;
    Query_deptBONCODE: TStringField;
    Query_deptFINCODE: TStringField;
    Query_deptOVERMODE: TStringField;
    Query_deptDEPTFUNC: TStringField;
    Query_deptCHANMODE: TStringField;
    Query_deptREORGDATE: TStringField;
    Query_deptCHANDATE: TStringField;
    Query_deptCLOSEDATE: TStringField;
    Query_deptBORGNUM: TStringField;
    Query_deptBDEPTCODE1: TStringField;
    Query_deptBDEPTCODE2: TStringField;
    Query_deptBDEPTCODE3: TStringField;
    Query_deptWRITETIME: TStringField;
    Query_deptWRITEEMP: TStringField;
    Query_deptTECHNIQUE: TFloatField;
    Query_deptDETAILSTECH: TStringField;
    Query1: TQuery;
    E_deptlevel: TComboBox;
    Panel31: TPanel;
    Fincode_emp: TEdit;
    Panel32: TPanel;
    Fincode_Korname: TEdit;
    Panel33: TPanel;
    Panel34: TPanel;
    E_bonbucode: TEdit;
    Query_deptbonbucode: TStringField;
    L_deptgubun: TLabel;
    SB_deptgubun: TSpeedButton;
    Panel35: TPanel;
    E_deptgubun: TEdit;
    Query_deptDEPTGUBUN: TStringField;
    L_bonbucode: TLabel;
    Mail_Send: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    L_extcode: TLabel;
    SB_Help: TStatusBar;
    BB_MyHR: TOnFocusButton;
    BitBtn9: TBitBtn;
    Panel36: TPanel;
    Ed_TRIBEGB: TEdit;
    Label5: TLabel;
    Query_deptTRIBEGB: TStringField;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BB_exitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_inputClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_SERorgnumKeyPress(Sender: TObject; var Key: Char);
    procedure CalenDarClick(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure BB_BatchReadClick(Sender: TObject);
    procedure BB_prnsetupClick(Sender: TObject);
    procedure BB_printClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DataCodeExit(Sender: TObject);
    procedure Mail_SendClick(Sender: TObject);
    procedure RB_insa1Click(Sender: TObject);
    procedure E_deptcodeExit(Sender: TObject);
    procedure E_fincodeExit(Sender: TObject);
    procedure E_boncodeExit(Sender: TObject);
    procedure E_deptcodeFROMExit(Sender: TObject);
    procedure ME_closedateExit(Sender: TObject);
    procedure BB_MyHRClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);

  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure Update_History;  //2002.08.26 shm 30.40
    procedure Update_Pimpmas;  //2002.08.26 shm 30.40
    procedure PBnetMail(Sender : TObject);
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000

  public
    { Public declarations }
    pempno, pkorname, password: string;
    CurDate,F_CurDate, Save_orgnum, Save_deptcode, Save_deptname: string;
    start, update, seq_no : Integer;
    changedept, NullFincode : string;

    procedure Select_Pycdept;
    function  Get_Name(str1,str2 : string; gubun : integer) : string;
    function  Get_Value(rStr : String; nPos : Integer): String;
  end;

var
  DeptForm: TDeptForm;

const
  DeptcodeLength = '5';  //현 부서코드테이블(pycdept)의 자리수, 테이블 변경시 같이변경해야함 --정규용

implementation
{$R *.DFM}

uses
  pzc10202, pzc10203;

var
  OPstate: Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}
  LastOrgnum, LastDeptcode: string; {조직차수+부서코드}
  HomeDir: String;
//------------------------------------------------------------------------------
procedure TDeptForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.FormPaint(Sender: TObject);
var
  i: Integer;
begin
  if Start = 0 then
  begin
       Start := 1;
       Application.ProcessMessages;

       pempno   := PassEmp(cmdline, 1);
       pkorname := PassEmp(cmdline, 2);
       password := PassEmp(cmdline, 3);
       HomeDir  := HomeDirOpen;
       Lempinfo.Caption := Pkorname + '(' +pempno+ ')';

       Application.ProcessMessages;

       Database1.Params[0] := 'SERVER NAME='+PassEmp(CmdLine,13);
       Database1.Params[1] := 'USER NAME='+PassEmp(CmdLine,5);
       Database1.Params[16]:= 'PASSWORD='+PassEmp(CmdLine,6);

       Try
            Database1.Connected := True;
       EXCEPT
            ON E : EDataBaseError DO
                 MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
       END;

       CurDate := Timeftp.TimeDate(Qcod);
       L_CurDate.Caption := Copy(CurDate,1,4)+'/'+ Copy(CurDate,5,2)+'/'+ Copy(CurDate,7,2);
       F_CurDate         := Copy(CurDate,1,8);
       E_SERorgnum.Text  := OrgnumDisp(Qcod);
       LastOrgnum        := '';
       LastDeptcode      := '';
  //   RB_insa1.Checked := True;
       RB_insa2.checked := True;  //2002.08.26 30.04 shm
       
       Select_Pycdept;
       E_SERorgnum.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.BB_exitClick(Sender: TObject);
//var  NowOrgnum : String;
begin
  //dsa2000  2018.09. 재무부서코드 등록요청메일 자동발송 로직 구현으로 아래 로직 삭제.
  {//dsa2000    2004.11.09.
  NowOrgnum := OrgnumDisp(Qcod);
  with Query1 do
  begin
       Close;  SQL.Clear;
       SQL.Add('SELECT 1                           ');
       SQL.Add('  FROM PYCDEPT                     ');
       SQL.Add(' WHERE ORGNUM  = '''+NowOrgnum+''' ');
       SQL.Add('   AND FINCODE IS NULL             '); //2014.08.05.hjku. 폐쇄부서 중 제무부서 등록되지 않은 것은 제외함..
       SQL.Add('   AND TRIM(CHANMODE)<>''3''       ');
       SQL.Add('   AND existon <> 0                ');
       Open;
  end;
  if Query1.RecordCount > 0 then
  begin
    NullFincode := 'NULL';
    Select_Pycdept;
    Query1.Close;
    Fincode_emp.SetFocus;
    MessageDlg('실제 부서코드 중 재무 부서코드가 널(NULL) 인 부서가 있습니다 '+#13#13+
               '재무부서코드 등록 담당자를 입력후 등록요청 메일발송을 하시기 바랍니다',mtInformation, [mbOk], 0);//    exit;
  end;  Query1.Close; }

  Close;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//------------------------------------------------------------------------------
function TDeptForm.Get_Name(str1,str2 : string; gubun : integer) : string;
begin
  Result := '';
  if (trim(str1) = '') or (trim(str2) = '') then system.exit;
  with Query_exec do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT DEPTNAME,DEPTABBR             ');
     SQL.Add('  FROM PYCDEPT                       ');
     SQL.Add(' WHERE (ORGNUM   = '''+str1+''') and ');
     SQL.Add('       (DEPTCODE = RPAD('''+str2+''',' + deptcodelength + ',''0''))');
     Open;
     if RecordCount = 0 then Result := '없음'
     else
     begin
          if Gubun = 1 then Result := FieldByName('DEPTNAME').AsString
          else              Result := FieldByName('DEPTABBR').AsString;
     end;
     Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.Select_Pycdept;
var
  FirstWhere: Boolean;
  SearchOptions: TLocateOptions;
  V: Variant;
begin
     OPstate := 2; {열람상태}
     SB_Help.Panels[1].Text :='해당 코드분류의 자료를 조회하고 있습니다.';
     Application.ProcessMessages;
     FirstWhere := False;

     with Query_dept do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT orgnum,                                        '); //차수
          SQL.Add('        deptcode,                                      '); //부서코드
          SQL.Add('        decode(deptna3,null,deptname,deptna3) deptname,');
          SQL.Add('        deptna1,                                       ');
          SQL.Add('        deptna2,                                       ');
          SQL.Add('        deptna3,                                       ');
          SQL.Add('        deptabbr,                                      ');
          SQL.Add('        existon,                                       ');
          SQL.Add('        placecode,                                     ');
          SQL.Add('        deptlevel,                                     ');
          SQL.Add('        sectcode,                                      ');
          SQL.Add('        fieldcode,                                     ');
          SQL.Add('        extcode,                                       ');
          SQL.Add('        boncode,                                       ');
          SQL.Add('        fincode,                                       ');
          SQL.Add('        overmode,                                      ');
          SQL.Add('        deptfunc,                                      ');
          SQL.Add('        chanmode,                                      ');
          SQL.Add('        reorgdate,                                     ');
          SQL.Add('        chandate,                                      ');
          SQL.Add('        closedate,                                     ');
          SQL.Add('        borgnum,                                       ');
          SQL.Add('        bdeptcode1,                                    ');
          SQL.Add('        bdeptcode2,                                    ');
          SQL.Add('        bdeptcode3,                                    ');
          SQL.Add('        writetime,                                     ');
          SQL.Add('        writeemp,                                      ');
          SQL.Add('        technique,                                     ');
          SQL.Add('        detailstech,                                   ');
          SQL.Add('        bonbucode,                                     ');
          SQL.Add('        deptgubun,                                     ');
          SQL.Add('        TRIBEGB                                        ');
          SQL.Add(' FROM PYCDEPT                                          ');

          if E_SERorgnum.Text <> '' then
          begin //현조직차수 shm
               FirstWhere := True;
               SQL.Add('   WHERE (ORGNUM LIKE '''+E_SERorgnum.Text+'%'+''' ) ');
          end;

          if E_SERdeptcode.Text <> '' then
          begin
               if FirstWhere then SQL.Add(' and (DEPTCODE LIKE '''+E_SERdeptcode.Text+'%'+''' ) ')
               else               SQL.Add(' WHERE (DEPTCODE LIKE '''+E_SERdeptcode.Text+'%'+''' ) ');
          end;

          if E_SERdeptname.Text <> '' then
          begin
               if FirstWhere then SQL.Add(' and (DEPTNAME LIKE '''+'%'+E_SERdeptname.Text+'%'+''' ) ')
               else               SQL.Add(' WHERE (DEPTNAME LIKE '''+'%'+E_SERdeptname.Text+'%'+''' ) ');
          end;                                                                 
          {if NullFincode <> '' then    //dsa2000  2018.09. 재무부서코드 등록요청메일 자동발송 로직 구현으로 아래 로직 삭제.
          begin if FirstWhere then SQL.Add(' and (Trim(Fincode) Is Null ) ')
                else               SQL.Add(' WHERE (Trim(Fincode) Is Null ) ');          end;}
          SQL.Add(' ORDER BY DEPTORDER ');
          Open;

          if RecordCount = 0 then SB_Help.Panels[1].Text := '해당 코드분류의 자료가 없습니다.'
          else
          begin
               if (LastOrgnum <> '') and (LastDeptcode <> '') then
               begin
                    V := VarArrayCreate([0,1], varVariant);
                    V[0] := LastOrgnum;   {조직차수}
                    V[1] := LastDeptcode; {부서코드}
                    SearchOptions := [loPartialKey];

                    if Locate('ORGNUM;DEPTCODE', V, SearchOptions) then DBG_user.SetFocus;
               end;
               SB_Help.Panels[1].Text := '해당 코드분류의 자료가 조회되었습니다.';
          end;
     end;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.E_SERorgnumKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then System.Exit;
  Key := #0;
  Select_Pycdept;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_orgnum.Text   := Query_deptORGNUM.AsString;
  E_deptcode.Text := Query_deptDEPTCODE.AsString;
  E_deptna1.Text  := Query_deptDEPTNA1.AsString;
  E_deptna2.Text  := Query_deptDEPTNA2.AsString;
  E_deptna3.Text  := Query_deptDEPTNA3.AsString;

       if Query_deptEXISTON.AsString = '0' then RB_existon0.Checked := True
  else if Query_deptEXISTON.AsString = '1' then RB_existon1.Checked := True;

  E_placecode.Text   := Query_deptPLACECODE.AsString;
  L_placecode.Caption := CodeDisp(Qcod,'I160',E_placecode.Text,'');

// (부서등급을 잘못 입력하는 오류 제거 <에디트박스 -> 콤보박스>) 정규용 수정 2004.08.30
  // E_deptlevel.Text   := Query_deptDEPTLEVEL.AsString;
  E_deptlevel.ItemIndex := E_deptlevel.Items.IndexOf(Query_deptDEPTLEVEL.AsString);
  E_extcode.Text     := Query_deptEXTCODE.AsString;
  E_boncode.Text     := Query_deptBONCODE.AsString;
  E_fincode.Text     := Query_deptFINCODE.AsString;
  E_overmode.Text    := Query_deptOVERMODE.AsString;
  E_Sectcode.Text    := Query_deptSECTCODE.AsString;
  L_SectCode.Caption := Get_Name(E_orgnum.Text,E_SectCode.Text,1);
//  30.01
//  E_Partcode.Text    := Query_deptPARTCODE.AsString;
//  L_PartCode.Caption := Get_Name(E_orgnum.Text,E_PartCode.Text,1);
  E_fieldcode.Text   := Query_deptFIELDCODE.AsString;
  L_Fieldcode.Caption:= Get_Name(E_orgnum.Text,E_fieldcode.Text,1);
//  E_DeptFunc.Text    := Query_deptDEPTFUNC.AsString;
//  L_DeptFunc.Caption := CodeDisp(Qcod,'I330',E_DeptFunc.Text,'');

  L_extcode.Caption   := Get_Name(E_orgnum.Text,E_extcode.Text,1);      //dsa2000  Add  2018.09.

  E_Technique.Text    := Query_deptTechnique.AsString;                  //2001.10.22 shm
  L_Technique.Caption := CodeDisp(Qcod,'I801',E_Technique.Text,'');     //2001.10.22 shm

  E_DetailsTech.Text    := Query_deptDetailsTech.AsString;              //2001.10.22 shm
  L_DetailsTech.Caption := CodeDisp(Qcod,'I803',E_DetailsTech.Text,''); //2001.10.22 shm

  E_Chanmode.Text       := Query_deptCHANMODE.AsString;
  L_ChanMode.Caption    := CodeDisp(Qcod,'I170',E_ChanMode.Text,'');

  E_bonbucode.Text      := Query_deptbonbucode.AsString; //2007.01.02
  L_bonbucode.Caption   := Get_Name(E_orgnum.Text,E_bonbucode.Text,1);

  E_deptgubun.Text      := Query_deptDEPTGUBUN.AsString;
  L_deptgubun.Caption   := CodeDisp(Qcod,'I804',E_deptgubun.Text,'');

  ME_reorgdate.Text     := Query_deptREORGDATE.AsString;
  ME_chandate.Text   := Query_deptCHANDATE.AsString;
  ME_closedate.Text  := Query_deptCLOSEDATE.AsString;
  E_Borgnum.Text     := Query_deptBorgnum.AsString;
  E_Bdeptcode1.Text  := Query_deptBdeptcode1.AsString;
  E_Bdeptcode2.Text  := Query_deptBdeptcode2.AsString;
  E_Bdeptcode3.Text  := Query_deptBdeptcode3.AsString;
  Ed_TRIBEGB.Text    := Query_deptTRIBEGB.AsString;

  L_BDeptcode1.Caption:= Get_Name(E_Borgnum.Text,E_Bdeptcode1.Text,2);
  L_BDeptcode2.Caption:= Get_Name(E_Borgnum.Text,E_Bdeptcode2.Text,2);
  L_BDeptcode3.Caption:= Get_Name(E_Borgnum.Text,E_Bdeptcode3.Text,2);

  OPstate := 2; {열람상태}

  if      Query_dept.BOF then SB_Help.Panels[1].Text := '자료의 처음입니다.'
  else if Query_dept.EOF then SB_Help.Panels[1].Text := '자료의 마지막입니다.'
  else                        SB_Help.Panels[1].Text := '';
end;
//------------------------------------------------------------------------------
procedure TDeptForm.BB_inputClick(Sender: TObject);
begin
  OPstate := 1; {입력상태}
  SB_Help.Panels[1].Text  := '새로운 자료를 등록하십시요.';
  E_orgnum.Text       := E_SERorgnum.Text;
  E_deptcode.Text     := '';
  E_deptna1.Text      := '';
  E_deptna2.Text      := '';
  E_deptna3.Text      := '';
  RB_existon1.Checked := True;
  E_placecode.Text    := '';
  E_deptlevel.Text    := '';
  E_fieldcode.Text    := '';
  E_extcode.Text      := '';
  //E_boncode.Text      := '';
  E_fincode.Text      := '';
  E_overmode.Text     := '';
  E_Sectcode.Text     := '';
  E_extcode.Text      := '';
//  E_Partcode.Text     := '';
  E_fieldcode.Text    := '';
//  E_DeptFunc.Text     := '';
  E_Technique.Text     := '';
  E_DetailsTech.Text     := '';
  E_Chanmode.Text     := '';
  E_bonbucode.Text    := '';

  E_BOrgnum.Text      := '';
  E_BDeptcode1.Text   := '';
  E_BDeptcode2.Text   := '';
  E_BDeptcode3.Text   := '';

  L_SectCode.Caption  := '';
  L_bonbucode.Caption := '';
//  L_PartCode.Caption  := '';
//  L_DeptFunc.Caption  := '';
  L_Technique.Caption  := '';
  L_DetailsTech.Caption  := '';
  L_Fieldcode.Caption := '';
  L_ChanMode.Caption  := '';

  L_BDeptcode1.Caption:= '';
  L_BDeptcode2.Caption:= '';
  L_BDeptcode3.Caption:= '';
  Ed_TRIBEGB.Text     := '';  

  ME_reorgdate.Text   := copy(CurDate,1,8);
  ME_chandate.Text    := copy(CurDate,1,8);
  ME_closedate.Text   := '';
  E_orgnum.SetFocus;
end;

procedure TDeptForm.BB_cancelClick(Sender: TObject);
begin
  OPstate := 0; {비어있는상태}
  ME_reorgdate.Text   := copy(CurDate,1,8);
  ME_chandate.Text    := copy(CurDate,1,8);
  ME_closedate.Text   := copy(CurDate,1,8);
  E_orgnum.SetFocus;
  SB_Help.Panels[1].Text  := '';
end;
//------------------------------------------------------------------------------
procedure TDeptForm.BB_saveClick(Sender: TObject);
var
  DEPTABBR: string;
begin
  update := 0;
  if OPstate = 0 then
  begin
       System.Exit;
       SB_Help.Panels[1].Text := '자료가 없어 저장할 수 없습니다.';
  end;
  //  if E_deptna3.Text <> '' then DEPTABBR := E_deptna3.Text  {부서요약명}
  if      E_deptna2.Text <> '' then DEPTABBR := E_deptna2.Text  //2001.12.07 shm deptna3는 직무그룹으로 활용!
  else if E_deptna1.Text <> '' then DEPTABBR := E_deptna1.Text
  else                              DEPTABBR := '';

  if (Length(E_deptcode.Text) <> 5) then
  begin
       ShowMessage('부서코드 자리수를 확인바랍니다.!!');
       System.Exit;
       E_deptcode.SetFocus;
  end
  else if (Length(E_extcode.Text) <> 5) then
  begin
       ShowMessage('상위부서코드 자리수를 확인바랍니다.!!');
       System.Exit;
       E_extcode.SetFocus;
  end
  else if ((Length(E_fincode.Text) <> 5) and (TrimRight(E_fincode.Text) <> '')) then
  begin
       ShowMessage('재무부서코드 자리수를 확인바랍니다.!!');
       System.Exit;
       E_fincode.SetFocus;
  end
  {else if (Length(E_boncode.Text) <> 5) then
  begin
       ShowMessage('팀코드 자리수를 확인바랍니다.!!');
       System.Exit;
       E_boncode.SetFocus;
  end}
  else if (E_bonbucode.Text = '') then
  begin
       ShowMessage('실/단코드 확인바랍니다.!!');
       System.Exit;
       E_bonbucode.SetFocus;
  end
  else if ((Length(E_Bdeptcode1.Text) <> 5) and (TrimRight(E_Bdeptcode1.Text) <> '')) then
  begin
       ShowMessage('변동전부서1 자리수를 확인바랍니다.!!');
       System.Exit;
       E_Bdeptcode1.SetFocus;
  end
  else if ((Length(E_Bdeptcode2.Text) <> 5) and (TrimRight(E_Bdeptcode2.Text) <> '')) then
  begin
       ShowMessage('변동전부서2 자리수를 확인바랍니다.!!');
       System.Exit;
       E_Bdeptcode2.SetFocus;
  end
  else if ((Length(E_Bdeptcode3.Text) <> 5) and (TrimRight(E_Bdeptcode3.Text) <> '')) then
  begin
       ShowMessage('변동전부서3 자리수를 확인바랍니다.!!');
       System.Exit;
       E_Bdeptcode3.SetFocus;
  end
  else if ((Length(E_deptcodeFROM.Text) <> 5) and (TrimRight(E_deptcodeFROM.Text) <> '')) or
          ((Length(E_deptcodeTO.Text) <> 5) and (TrimRight(E_deptcodeTO.Text) <> '')) then
  begin
       ShowMessage('인쇄부서코드 자리수를 확인바랍니다.!!');
       System.Exit;
       E_deptcodeFROM.SetFocus;
  end;

  if (E_Chanmode.Text='') then
  begin
       ShowMessage('부서변동구분 입력바랍니다.!!');
       System.Exit;
  end;
  if (E_Chanmode.Text = '3') and (Length(ME_closedate.Text) <> 8) then
  begin
       ShowMessage('부서폐쇄시 반드시 폐쇄일자를 입력하세요!!');
       System.Exit;
  end;

  if (Trim(Ed_TRIBEGB.Text)='') then
  begin
       ShowMessage('Tribe 구분 입력 바랍니다.!!');
       System.Exit;
  end;
  //////////////////////////////////////////////////////////////////////////////
  try
    if OPstate = 1 then
    begin {입력상태}  //새로 추가 INSERT  - UPDATE 시에만 인사마스터 반영.
         if Get_Name(E_orgnum.Text,E_Deptcode.Text,1) <> '없음' then begin
            MessageBox(Handle, '저장하려는 조직차수의 부서가 이미 존재합니다.', '입력오류',MB_ICONWARNING);
            System.Exit;
         end;
         if Get_Name(E_Borgnum.Text,E_BDeptcode1.Text,2) = '없음' then begin
            MessageBox(Handle, '저장하려는 변동전 부서1이 존재하지 않았습니다.', '입력오류',MB_ICONWARNING);
            System.Exit;
         end;
         if Get_Name(E_Borgnum.Text,E_BDeptcode2.Text,2) = '없음' then begin
            MessageBox(Handle, '저장하려는 변동전 부서2이 존재하지 않았습니다.', '입력오류',MB_ICONWARNING);
            System.Exit;
         end;
         if Get_Name(E_Borgnum.Text,E_BDeptcode3.Text,2) = '없음' then begin
            MessageBox(Handle, '저장하려는 변동전 부서3이 존재하지 않았습니다.', '입력오류',MB_ICONWARNING);
            System.Exit;
         end;

         LastOrgnum   := E_orgnum.Text;
         LastDeptcode := E_deptcode.Text;
         Query_exec.Close;
         Query_exec.SQL.Clear;
         Query_exec.SQL.Add('INSERT INTO PYCDEPT (                                           ');
         Query_exec.SQL.Add('   ORGNUM,    DEPTCODE,  DEPTNAME,  DEPTNA1,                    ');
         Query_exec.SQL.Add('   DEPTNA2,   DEPTNA3,   EXISTON,   PLACECODE,                  ');
         Query_exec.SQL.Add('   DEPTLEVEL, DEPTABBR,  FIELDCODE, EXTCODE, BONCODE,           ');
         Query_exec.SQL.Add('   bonbucode, FINCODE,   OVERMODE,  CHANMODE,  REORGDATE,       ');
         Query_exec.SQL.Add('   TECHNIQUE, DETAILSTECH, DEPTGUBUN,                           ');  //2001.10.22 shm
         Query_exec.SQL.Add('   CHANDATE,  CLOSEDATE, WRITETIME, WRITEEMP,SECTCODE, Borgnum, ');
         Query_exec.SQL.Add('   Bdeptcode1,Bdeptcode2,Bdeptcode3, DEPTORDER, TRIBEGB) VALUES(         ');
         Query_exec.SQL.Add('  :Porgnum, :Pdeptcode, :Pdeptname, :Pdeptna1,                  ');
         Query_exec.SQL.Add('  :Pdeptna2, :Pdeptna3, :Pexiston, :Pplacecode,                 ');
         Query_exec.SQL.Add('  :Pdeptlevel, :Pdeptabbr,:Pfieldcode,:Pextcode, :Pboncode,     ');
         Query_exec.SQL.Add('  :Pbonbucode, :Pfincode, :Povermode, :Pchanmode,:Preorgdate,   ');
         Query_exec.SQL.Add('  :Ptechnique, :Pdetailstech, :Pdeptgubun,                      ');  //2001.10.22 shm
         Query_exec.SQL.Add('  :Pchandate,:Pclosedate, :Pwritetime, :Pwriteemp,:Psectcode,   '); //:Pdeptfunc
         Query_exec.SQL.Add('  :Pborgnum, :Pbdeptcode1,:Pbdeptcode2,:Pbdeptcode3,:Pdeptorder,:Ptribegb)');
         Query_exec.ParamByName('Porgnum').AsString   := E_orgnum.Text;
         Query_exec.ParamByName('Pdeptcode').AsString := E_deptcode.Text;
         if  Trim(E_deptna3.Text) <> '' then                           //2001.12.07 shm
              Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)
         else Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)+' '+
                                                              Trim(E_deptna2.Text); //Trim(E_deptna3.Text);
         Query_exec.ParamByName('Pdeptna1').AsString  := E_deptna1.Text;
         Query_exec.ParamByName('Pdeptna2').AsString  := E_deptna2.Text;
         Query_exec.ParamByName('Pdeptna3').AsString  := E_deptna3.Text;
         if      RB_existon0.Checked then Query_exec.ParamByName('Pexiston').AsString := '0'
         else if RB_existon1.Checked then Query_exec.ParamByName('Pexiston').AsString := '1';
         Query_exec.ParamByName('Pplacecode').AsString   := E_placecode.Text;
         Query_exec.ParamByName('Pdeptlevel').AsString   := E_deptlevel.Text;
         Query_exec.ParamByName('Pdeptabbr').AsString    := DEPTABBR;
         Query_exec.ParamByName('Pfieldcode').AsString   := E_fieldcode.Text;
         Query_exec.ParamByName('Pextcode').AsString     := E_extcode.Text;
         //Query_exec.ParamByName('Pboncode').AsString     := E_boncode.Text;
         Query_exec.ParamByName('Pboncode').AsString     := E_Deptcode.Text;
         Query_exec.ParamByName('Pbonbucode').AsString   := E_bonbucode.Text;
         Query_exec.ParamByName('Pfincode').AsString     := E_fincode.Text;
         Query_exec.ParamByName('Povermode').AsString    := E_overmode.Text;
         Query_exec.ParamByName('Preorgdate').AsString   := ME_reorgdate.Text;
         Query_exec.ParamByName('Pchandate').AsString    := ME_chandate.Text;
         Query_exec.ParamByName('Pclosedate').AsString   := ME_closedate.Text;
         Query_exec.ParamByName('Pwritetime').AsString   := copy(CurDate,1,14);
         Query_exec.ParamByName('Pwriteemp').AsString    := Pempno;
         Query_exec.ParamByName('Pchanmode').AsString    := E_ChanMode.Text;
         Query_exec.ParamByName('PTechnique').AsString   := E_Technique.Text;   //2001.10.22 shm
         Query_exec.ParamByName('PDetailsTech').AsString := E_DetailsTech.Text; //2001.10.22 shm
         Query_exec.ParamByName('Pdeptgubun').AsString   := E_deptgubun.Text;
         Query_exec.ParamByName('PSectcode').AsString    := E_SectCode.Text;
         Query_exec.ParamByName('Pborgnum').AsString     := E_Borgnum.Text;
         Query_exec.ParamByName('Pbdeptcode1').AsString  := E_bdeptcode1.Text;
         Query_exec.ParamByName('Pbdeptcode2').AsString  := E_Bdeptcode2.Text;
         Query_exec.ParamByName('Pbdeptcode3').AsString  := E_Bdeptcode3.Text;
         Query_exec.ParamByName('Pdeptorder').AsString   := E_deptcode.Text; // 30.08 부서코드조회순위
         Query_exec.ParamByName('Ptribegb').AsString     := Ed_TRIBEGB.Text; //20181026 신범주
         Query_exec.EXECSQL;

         //  2   007.02.23 서혜미 flag check_insert부분 시작(신규 입력했을때)
         with Query_exec    do
         begin
              Close;
              SQL.CLear;
              SQL.Add('insert into pycdept_hint                                         ');
              SQL.Add('(select :curdate,                                                ');
              SQL.Add('        nvl((select max(seqno)                                   ');
              SQL.Add('               from pycdept_hint                                 ');
              SQL.Add('              where workdate = :curdate                          ');
              SQL.Add('                and orgnum   = a.orgnum                          ');
              SQL.Add('                and deptcode = a.deptcode),0) + 1 seqno,         ');
              SQL.Add('        ORGNUM, DEPTCODE, DEPTNAME, DEPTNA1, DEPTNA2, DEPTNA3,   ');
              SQL.Add('        DEPTABBR, EXISTON, PLACECODE, DEPTLEVEL, SECTCODE,       ');
              SQL.Add('        FIELDCODE, EXTCODE, BONCODE, FINCODE, OVERMODE, DEPTFUNC,');
              SQL.Add('        CHANMODE, REORGDATE, CHANDATE, CLOSEDATE, BORGNUM,       ');
              SQL.Add('        BDEPTCODE1, BDEPTCODE2, BDEPTCODE3, WRITETIME, WRITEEMP, ');
              SQL.Add('        TECHNIQUE, DETAILSTECH,  DEPTORDER, BONBUCODE,           ');
              SQL.Add('        ''A''  flag, TRIBEGB                                     ');
              SQL.Add('  from pycdept a                                                 ');
              SQL.Add(' where a.orgnum   = :orgnum                                      ');
              SQL.Add('   and a.deptcode = :deptcode  )                                 ');
              ParamByName('curdate' ).AsString := F_CurDate;
              ParamByName('orgnum'  ).AsString := E_orgnum.Text;
              ParamByName('deptcode').AsString := E_deptcode.Text;  //seqno := seqno + 1;     ParamByName('seq').AsString       := inttostr(seqno);
              EXECSQL;
         end; // 2007.02.23 서혜미 flag check insert 신규입력했을때  끝

         Select_Pycdept;

         SB_Help.Panels[1].Text := '새로운 자료를 입력했습니다.';
         update := 1;
    end
    else   // 수정시  if OPstate = 1 then else
    begin
         if (E_orgnum.Text = Query_deptORGNUM.AsString) and (E_deptcode.Text = Query_deptDEPTCODE.AsString)  then //차수와 부서가 바귀지않고 다른 필드만 바뀔때
         begin
              LastOrgnum   := E_orgnum.Text;
              LastDeptcode := E_deptcode.Text;
              Query_exec.Close;
              Query_exec.SQL.Clear;
              Query_exec.SQL.Add('UPDATE PYCDEPT ');
              Query_exec.SQL.Add('SET DEPTNAME  = :Pdeptname,  DEPTNA1   = :Pdeptna1,   DEPTNA2   = :Pdeptna2,   DEPTNA3   = :Pdeptna3,      ');
              Query_exec.SQL.Add('    EXISTON   = :Pexiston,   PLACECODE = :Pplacecode, DEPTLEVEL = :Pdeptlevel, DEPTABBR = :Pdeptabbr,      ');
              Query_exec.SQL.Add('    FIELDCODE = :Pfieldcode, EXTCODE   = :Pextcode,   BONCODE   = :Pboncode,   BONbuCODE = :Pbonbucode,    ');
              Query_exec.SQL.Add('    FINCODE   = :Pfincode,   OVERMODE  = :Povermode,  CHANMODE  = :Pchanmode,                              ');
              Query_exec.SQL.Add('    REORGDATE = :Preorgdate, CHANDATE  = :Pchandate,  CLOSEDATE = :Pclosedate,                             ');
              Query_exec.SQL.Add('    WRITETIME = :Pwritetime, WRITEEMP  = :Pwriteemp,  Technique = :pTechnique, DetailsTech = :pDetailsTech,');
              Query_exec.SQL.Add('    SECTCODE  = :PSectCode,  DEPTGUBUN = :Pdeptgubun,                                                      ');
              Query_exec.SQL.Add('    Borgnum   = :PBorgnum,   Bdeptcode1=:Pbdeptcode1, Bdeptcode2= :pbdeptcode2,bdeptcode3=:Pbdeptcode3, TRIBEGB=:Ptribegb');
              Query_exec.SQL.Add('WHERE (ORGNUM = :Porgnum) AND (DEPTCODE = :Pdeptcode)                                                      ');
              Query_exec.ParamByName('Porgnum').AsString       := E_orgnum.Text;
              Query_exec.ParamByName('Pdeptcode').AsString     := E_deptcode.Text;
              if  Trim(E_deptna3.Text) <> '' then                           //2001.12.07 shm
                   Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)
              else Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)+' '+
                                                                   Trim(E_deptna2.Text);//Trim(E_deptna3.Text);
              Query_exec.ParamByName('Pdeptna1').AsString      := E_deptna1.Text;
              Query_exec.ParamByName('Pdeptna2').AsString      := E_deptna2.Text;
              Query_exec.ParamByName('Pdeptna3').AsString      := E_deptna3.Text;
              if RB_existon0.Checked then      Query_exec.ParamByName('Pexiston').AsString := '0'
              else if RB_existon1.Checked then Query_exec.ParamByName('Pexiston').AsString := '1';
              Query_exec.ParamByName('Pplacecode').AsString    := E_placecode.Text;
              Query_exec.ParamByName('Pdeptlevel').AsString    := E_deptlevel.Text;
              Query_exec.ParamByName('Pdeptabbr').AsString     := DEPTABBR;
              Query_exec.ParamByName('Pfieldcode').AsString    := E_fieldcode.Text;
              Query_exec.ParamByName('Pextcode').AsString      := E_extcode.Text;
              //Query_exec.ParamByName('Pboncode').AsString      := E_boncode.Text;
              Query_exec.ParamByName('Pboncode').AsString      := E_Deptcode.Text;
              Query_exec.ParamByName('Pbonbucode').AsString    := E_bonbucode.Text;
              Query_exec.ParamByName('Pfincode').AsString      := E_fincode.Text;
              Query_exec.ParamByName('Povermode').AsString     := E_overmode.Text;
              Query_exec.ParamByName('Preorgdate').AsString    := ME_reorgdate.Text;
              Query_exec.ParamByName('Pchandate').AsString     := ME_chandate.Text;
              Query_exec.ParamByName('Pclosedate').AsString    := ME_closedate.Text;
              Query_exec.ParamByName('Pwritetime').AsString    := copy(CurDate,1,14);
              Query_exec.ParamByName('Pwriteemp').AsString     := Pempno;
              Query_exec.ParamByName('Pchanmode').AsString     := E_ChanMode.Text;
              Query_exec.ParamByName('PTechnique').AsString    := E_Technique.Text;     //2001.10.22 shm
              Query_exec.ParamByName('PDetailsTech').AsString  := E_DetailsTech.Text; //2001.10.22 shm
              Query_exec.ParamByName('PSectcode').AsString     := E_SectCode.Text;
              Query_exec.ParamByName('Pdeptgubun').AsString    := E_deptgubun.Text;
              Query_exec.ParamByName('Pborgnum').AsString      := E_Borgnum.Text;
              Query_exec.ParamByName('Pbdeptcode1').AsString   := E_bdeptcode1.Text;
              Query_exec.ParamByName('Pbdeptcode2').AsString   := E_Bdeptcode2.Text;
              Query_exec.ParamByName('Pbdeptcode3').AsString   := E_Bdeptcode3.Text;
              Query_exec.ParamByName('Ptribegb').AsString      := Ed_TRIBEGB.Text; //20181026 신범주
              Query_exec.EXECSQL;
              SB_Help.Panels[1].Text := '기존의 자료를 수정했습니다.';

              //  2007.02.23 서혜미 flag check_insert부분 시작(수정했을때)
              with Query_exec    do
              begin
                   Close;
                   SQL.CLear;
                   SQL.Add('insert into hper.pycdept_hint                                    ');
                   SQL.Add('(select :curdate,                                                ');
                   SQL.Add('        nvl((select max(seqno)                                   ');
                   SQL.Add('               from pycdept_hint                                 ');
                   SQL.Add('              where workdate = :curdate                          ');
                   SQL.Add('                and orgnum   = a.orgnum                          ');
                   SQL.Add('                and deptcode = a.deptcode),0) + 1 seqno,         ');
                   SQL.Add('        ORGNUM, DEPTCODE, DEPTNAME, DEPTNA1, DEPTNA2, DEPTNA3,   ');
                   SQL.Add('        DEPTABBR, EXISTON, PLACECODE, DEPTLEVEL, SECTCODE,       ');
                   SQL.Add('        FIELDCODE, EXTCODE, BONCODE, FINCODE, OVERMODE, DEPTFUNC,');
                   SQL.Add('        CHANMODE, REORGDATE, CHANDATE, CLOSEDATE, BORGNUM,       ');
                   SQL.Add('        BDEPTCODE1, BDEPTCODE2, BDEPTCODE3, WRITETIME, WRITEEMP, ');
                   SQL.Add('        TECHNIQUE, DETAILSTECH,  DEPTORDER, BONBUCODE,           ');
                   SQL.Add('        decode(chanmode,3,''D'',''C'') flag, TRIBEGB             ');
                   SQL.Add('  from pycdept a                                                 ');
                   SQL.Add(' where a.orgnum   = :orgnum                                      ');
                   SQL.Add('   and a.deptcode = :deptcode  )                                 ');
                   ParamByName('curdate' ).AsString := F_CurDate;
                   ParamByName('orgnum'  ).AsString := E_orgnum.Text;
                   ParamByName('deptcode').AsString := E_deptcode.Text;
                   EXECSQL;
              end;

              IF RB_insa1.checked = True then //2002.08.26 30.04 shm
              begin
                   Update_History;             //마스터에 적용하지 않음
              end
              else IF RB_insa2.checked = True then
              begin
                   Update_Pimpmas              //마스터에 적용
              end;
              Select_Pycdept;                  //코드 자료 조회...
         end
         //////////////////////////////////////////////////////////////////////////
         else  //if (E_orgnum.Text = Query_deptORGNUM.AsString) and (E_deptcode.Text = Query_deptDEPTCODE.AsString)  then 의 else
         begin  {orgnum+deptcode가 새로운 것으로 변경  차수변경....}
              if Get_Name(E_orgnum.Text,E_Deptcode.Text,1) <> '없음' then
              begin
                   MessageBox(Handle, '변경하려는 조직차수의 부서가 이미 존재합니다.', '입력오류', MB_ICONWARNING);
                   System.Exit;
              end;

              //부서코드가 바뀌었을때  이 루틴 탐 shm
              LastOrgnum   := E_orgnum.Text;
              LastDeptcode := E_deptcode.Text;
              Query_exec.Close;
              Query_exec.SQL.Clear;
              Query_exec.SQL.Add('UPDATE PYCDEPT ');
              Query_exec.SQL.Add('SET ORGNUM    = :PNEWorgnum, DEPTCODE  = :PNEWdeptcode, DEPTNAME  = :Pdeptname,                               ');
              Query_exec.SQL.Add('    DEPTNA1   = :Pdeptna1,   DEPTNA2   = :Pdeptna2,     DEPTNA3   = :Pdeptna3,                                ');
              Query_exec.SQL.Add('    EXISTON   = :Pexiston,   PLACECODE = :Pplacecode,   DEPTLEVEL = :Pdeptlevel,  DEPTABBR = :Pdeptabbr,      ');
              Query_exec.SQL.Add('    FIELDCODE = :Pfieldcode, EXTCODE   = :Pextcode,     BONCODE   = :Pboncode,    BONbuCODE = :Pbonbucode,    ');
              Query_exec.SQL.Add('    FINCODE   = :Pfincode,   OVERMODE  = :Povermode,    CHANMODE  = :Pchanmode,                               ');
              Query_exec.SQL.Add('    REORGDATE = :Preorgdate, CHANDATE  = :Pchandate,    CLOSEDATE = :Pclosedate,                              ');
              Query_exec.SQL.Add('    WRITETIME = :Pwritetime, WRITEEMP  = :Pwriteemp,    Technique = :pTechnique,  DetailsTech = :pDetailsTech,');
              Query_exec.SQL.Add('    SECTCODE  = :PSectCode,  DEPTGUBUN = :Pdeptgubun                                                          ');
              Query_exec.SQL.Add('    Borgnum   = :PBorgnum,   Bdeptcode1= :Pbdeptcode1,  Bdeptcode2= :pbdeptcode2, bdeptcode3=:Pbdeptcode3, TRIBEGB=:Ptribegb     ');
              Query_exec.SQL.Add('WHERE (ORGNUM = :POLDorgnum) AND (DEPTCODE = :POLDdeptcode)');
              Query_exec.ParamByName('PNEWorgnum').AsString    := E_orgnum.Text;
              Query_exec.ParamByName('POLDorgnum').AsString    := Query_deptORGNUM.AsString;
              Query_exec.ParamByName('PNEWdeptcode').AsString  := E_deptcode.Text;
              Query_exec.ParamByName('POLDdeptcode').AsString  := Query_deptDEPTCODE.AsString;
              if  Trim(E_deptna3.Text) <> '' then                           //2001.12.07 shm
                  Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)
              else
                  Query_exec.ParamByName('Pdeptname').AsString := Trim(E_deptna1.Text)+' '+
                                                                  Trim(E_deptna2.Text);//+' '+Trim(E_deptna3.Text);
              Query_exec.ParamByName('Pdeptna1').AsString      := E_deptna1.Text;
              Query_exec.ParamByName('Pdeptna2').AsString      := E_deptna2.Text;
              Query_exec.ParamByName('Pdeptna3').AsString      := E_deptna3.Text;
              if RB_existon0.Checked then      Query_exec.ParamByName('Pexiston').AsString := '0'
              else if RB_existon1.Checked then Query_exec.ParamByName('Pexiston').AsString := '1';
              Query_exec.ParamByName('Pplacecode').AsString    := E_placecode.Text;
              Query_exec.ParamByName('Pdeptlevel').AsString    := E_deptlevel.Text;
              Query_exec.ParamByName('Pdeptabbr').AsString     := DEPTABBR;
              Query_exec.ParamByName('Pfieldcode').AsString    := E_fieldcode.Text;
              Query_exec.ParamByName('Pextcode').AsString      := E_extcode.Text;
              //Query_exec.ParamByName('Pboncode').AsString      := E_boncode.Text;
              Query_exec.ParamByName('Pboncode').AsString      := E_Deptcode.Text;
              Query_exec.ParamByName('Pbonbucode').AsString    := E_bonbucode.Text;
              Query_exec.ParamByName('Pfincode').AsString      := E_fincode.Text;
              Query_exec.ParamByName('Povermode').AsString     := E_overmode.Text;
              Query_exec.ParamByName('Preorgdate').AsString    := ME_reorgdate.Text;
              Query_exec.ParamByName('Pchandate').AsString     := ME_chandate.Text;
              Query_exec.ParamByName('Pclosedate').AsString    := ME_closedate.Text;
              Query_exec.ParamByName('Pwritetime').AsString    := copy(CurDate,1,14);
              Query_exec.ParamByName('Pwriteemp').AsString     := Pempno;
              Query_exec.ParamByName('Pchanmode').AsString     := E_ChanMode.Text;
              Query_exec.ParamByName('PTechnique').AsString    := E_Technique.Text;      //2001.10.22 shm
              Query_exec.ParamByName('PDetailsTech').AsString  := E_DetailsTech.Text;  //2001.10.22 shm
              Query_exec.ParamByName('PSectcode').AsString     := E_SectCode.Text;
              Query_exec.ParamByName('Pdeptgubun').AsString    := E_DeptGubun.Text;
              Query_exec.ParamByName('Pborgnum').AsString      := E_Borgnum.Text;
              Query_exec.ParamByName('Pbdeptcode1').AsString   := E_bdeptcode1.Text;
              Query_exec.ParamByName('Pbdeptcode2').AsString   := E_Bdeptcode2.Text;
              Query_exec.ParamByName('Pbdeptcode3').AsString   := E_Bdeptcode3.Text;
              Query_exec.ParamByName('Ptribegb').AsString      := Ed_TRIBEGB.Text;
              Query_exec.EXECSQL;

              //  2007.02.23 서혜미 flag check_insert부분 시작(수정했을때)
              with Query_exec    do
              begin
                   Close;
                   SQL.CLear;
                   SQL.Add('insert into pycdept_hint                                       ');
                   SQL.Add('(select :curdate, :seq,                                        ');
                   SQL.Add('        ORGNUM, DEPTCODE, DEPTNAME, DEPTNA1, DEPTNA2,          ');
                   SQL.Add('        DEPTNA3, DEPTABBR, EXISTON, PLACECODE, DEPTLEVEL,      ');
                   SQL.Add('        SECTCODE, FIELDCODE, EXTCODE, BONCODE, FINCODE,        ');
                   SQL.Add('        OVERMODE, DEPTFUNC, CHANMODE, REORGDATE, CHANDATE,     ');
                   SQL.Add('        CLOSEDATE, BORGNUM, BDEPTCODE1, BDEPTCODE2, BDEPTCODE3,');
                   SQL.Add('        WRITETIME, WRITEEMP, TECHNIQUE, DETAILSTECH,           ');
                   SQL.Add('        DEPTORDER, BONBUCODE,                                  ');
                   SQL.Add('        :flag, TRIBEGB from pycdept a                          ');
                   SQL.Add(' where a.orgnum   = :orgnum                                    ');
                   SQL.Add('   and a.deptcode = :deptcode  )                               ');

                   ParamByName('curdate' ).AsString := F_CurDate;
                   ParamByName('orgnum'  ).AsString := E_orgnum.Text;
                   ParamByName('deptcode').AsString := E_deptcode.Text;
                   seq_no := seq_no + 1;
                   ParamByName('seq').AsString      := inttostr(seq_no);

                   if   E_ChanMode.Text = '3' then
                        ParamByName('flag').AsString := 'D'
                   else ParamByName('flag').AsString := 'C';
                   EXECSQL;
              end;//  2007.02.23 서혜미 flag check_insert부분  끝(수정했을때)

              changedept          :=   E_deptcode.text;  //부서코드찾기에서 조회를 해서 부서코드를 수정할경우
              E_SERdeptcode.text  :=   changedept;       //E_SERdeptcode에는 바뀌기전 부서가 그대로 남아 바뀐부서로
              // 2007.02.23 서혜미 flag check update  끝           조회가 되지 않기때문에 추가(hint메일로 blank로 보내짐) shm
              
              Select_Pycdept;

              SB_Help.Panels[1].Text := '새로운 부서코드로 변동되었습니다.';
         end;
  end;
  Query_exec.Close;

  PBnetMail(Sender); //메일발송

  except
     on E: Exception do
       begin
         MessageDlg(E.Message, mtError, [mbOk], 0);
         BB_cancelClick(Sender);
       end;
  end; //try
end;
//------------------------------------------------------------------------------
procedure TDeptForm.BB_deleteClick(Sender: TObject);
var
  Jump_orgnum, Jump_deptcode: string;
  SearchOptions: TLocateOptions;
  V: Variant;
begin
  if OPstate <> 2 then {열람상태가 아니면}
  begin
    SB_Help.Panels[1].Text := '선택된 자료가 없으므로 삭제할 수 없습니다.';
    System.Exit;
  end;
  if MessageDlg('삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
    System.Exit;
  try
    Save_orgnum   := E_orgnum.Text;
    Save_deptcode := E_deptcode.Text;
    Save_deptname := E_deptna1.Text;
    Query_dept.Next;
    if Query_dept.eof then begin
      Query_dept.Prior;
      Jump_orgnum   := Query_deptORGNUM.AsString;
      Jump_deptcode := Query_deptDEPTCODE.AsString;
    end else begin
      Jump_orgnum   := Query_deptORGNUM.AsString;
      Jump_deptcode := Query_deptDEPTCODE.AsString;
    end;

     with Query_exec    do
      begin
           Close;
           SQL.CLear;
           SQL.Add('insert into pycdept_hint                                       ');
           SQL.Add('(select :curdate,                                              ');
           SQL.Add('        nvl((select max(seqno)                                 ');
           SQL.Add('             from pycdept_hint                                 ');
           SQL.Add('             where workdate = :curdate                         ');
           SQL.Add('               and orgnum   = a.orgnum                         ');
//2014.08.04.hjku. 동일한 날짜에 생성과 삭제가 이루어질 경우 오류 발생.
           SQL.Add('               and deptcode = a.deptcode),0)+1  seqno,         '); ///SQL.Add('               and deptcode = a.deptcode),0)  seqno,           ');
           SQL.Add('        ORGNUM, DEPTCODE, DEPTNAME, DEPTNA1, DEPTNA2,          ');
           SQL.Add('        DEPTNA3, DEPTABBR, EXISTON, PLACECODE, DEPTLEVEL,      ');
           SQL.Add('        SECTCODE, FIELDCODE, EXTCODE, BONCODE, FINCODE,        ');
           SQL.Add('        OVERMODE, DEPTFUNC, CHANMODE, REORGDATE, CHANDATE,     ');
           SQL.Add('        CLOSEDATE, BORGNUM, BDEPTCODE1, BDEPTCODE2, BDEPTCODE3,');
           SQL.Add('        WRITETIME, WRITEEMP, TECHNIQUE, DETAILSTECH,           ');
           SQL.Add('        DEPTORDER, BONBUCODE,                                  ');
           SQL.Add('        ''D'' flag, TRIBEGB                                    ');
           SQL.Add(' from pycdept a                                                ');
           SQL.Add(' where a.orgnum   = :orgnum                                    ');
           SQL.Add('   and a.deptcode = :deptcode  )                               ');

           ParamByName('curdate' ).AsString := F_CurDate;
//2014.08.04.hjku. 전체 조회후 삭제 오류 수정.. 엉뚱한 값이 폐쇄조직으로 넘어감.
           ParamByName('orgnum'  ).AsString := Save_orgnum;   //ParamByName('orgnum'  ).AsString := E_orgnum.Text;
           ParamByName('deptcode').AsString := Save_deptcode; //ParamByName('deptcode').AsString := E_deptcode.Text;
           EXECSQL;
      end;

    Query_exec.Close;
    Query_exec.SQL.Clear;
    Query_exec.SQL.Add('DELETE FROM PYCDEPT ');
    Query_exec.SQL.Add(' WHERE (ORGNUM = :Porgnum) AND (DEPTCODE = :Pdeptcode) ');
    Query_exec.ParamByName('Porgnum').AsString   := Save_orgnum;
    Query_exec.ParamByName('Pdeptcode').AsString := Save_deptcode;
    Query_exec.EXECSQL;

    LastOrgnum   := '';
    LastDeptcode := '';
    Select_Pycdept;

    V := VarArrayCreate([0,1], varVariant);
    V[0] := Jump_orgnum;   {조직차수}
    V[1] := Jump_deptcode; {부서코드}
    SearchOptions := [loPartialKey];
    if Query_dept.Locate('ORGNUM;DEPTCODE', V, SearchOptions) then
      DBG_user.SetFocus;

    SB_Help.Panels[1].Text := '기존자료가 삭제되었습니다.';

    PBnetMail(Sender); //메일발송
    
  except
    on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        BB_cancelClick(Sender);
      end;
  end;
end;
//------------------------------------------------------------------------------
// 코드 부분을 벗어날때 사용한다................................................
procedure TDeptForm.DataCodeExit(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1 : L_placecode.Caption  := CodeDisp(Qcod,'I160',E_placecode.Text,'');
    2 : L_Sectcode.Caption   := Get_Name(E_orgnum.Text,E_Sectcode.Text,1);
    3 : L_fieldcode.Caption  := Get_Name(E_orgnum.Text,E_fieldcode.Text,1);
//  4 : L_DeptFunc.Caption   := CodeDisp(Qcod,'I330',E_DeptFunc.Text,'');
    4 : L_Technique.Caption  := CodeDisp(Qcod,'I801',E_Technique.Text,'');    //2001.10.22 shm
    5 : L_Chanmode.Caption   := CodeDisp(Qcod,'I170',E_Chanmode.Text,'');
    6 : L_BDeptcode1.Caption := Get_Name(E_Borgnum.Text,E_Bdeptcode1.Text,2);
    7 : L_BDeptcode2.Caption := Get_Name(E_Borgnum.Text,E_Bdeptcode2.Text,2);
    8 : L_BDeptcode3.Caption := Get_Name(E_Borgnum.Text,E_Bdeptcode3.Text,2);
//  9 : L_Partcode.Caption   := Get_Name(E_orgnum.Text,E_Partcode.Text,1);
    9 : L_DetailsTech.Caption:= CodeDisp(Qcod,'I803',E_DetailsTech.Text,'');  //2001.10.22 shm
   10 : L_deptgubun.Caption  := CodeDisp(Qcod,'I804',E_Deptgubun.Text,'');
   11 : L_bonbucode.Caption  := Get_Name(E_orgnum.Text,E_bonbucode.Text,1);
   12 : L_extcode.Caption    := Get_Name(E_orgnum.Text,E_extcode.Text,1);     //dsa2000 Add  2018.09.
  end;

  if ((Length(E_Bdeptcode1.Text) <> 5) and (TrimRight(E_Bdeptcode1.Text) <> '')) then
  begin
    ShowMessage('변동전부서1 자리수를 확인바랍니다.!!');
    System.Exit;
  end
  else
  if ((Length(E_Bdeptcode2.Text) <> 5) and (TrimRight(E_Bdeptcode2.Text) <> '')) then
  begin
    ShowMessage('변동전부서2 자리수를 확인바랍니다.!!');
    System.Exit;
  end
  else
  if ((Length(E_Bdeptcode3.Text) <> 5) and (TrimRight(E_Bdeptcode3.Text) <> '')) then
  begin
    ShowMessage('변동전부서3 자리수를 확인바랍니다.!!');
    System.Exit;
  end;

  if (Length(E_extcode.Text) <> 5) then
  begin
    ShowMessage('상위부서코드 자리수를 확인바랍니다.!!');
    System.Exit;
  end
end;
//------------------------------------------------------------------------------
// 달력폼을 불러온다............................................................
procedure TDeptForm.CalenDarClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      case TComponent(Sender).Tag of
       1 : ME_reorgdate.Text := calendar.DayCaption;
       2 : ME_chandate.Text  := calendar.DayCaption;
       3 : ME_closedate.Text := calendar.DayCaption;
      end;
  finally
    calendar.free;
  end;

  ME_closedateExit(Sender);
end;
//------------------------------------------------------------------------------
// 코드폼을 불러온다............................................................
procedure TDeptForm.CodeClick(Sender: TObject);
begin
  codeForm := TCodeForm.Create(self);
  try
    case TComponent(Sender).Tag of
      1 : begin
          codeForm.FormData := '근무지코드 열람';
          codeForm.DataVal1 := 'I160';
          codeForm.DataVal2 := E_placecode.Text;
          end;
      2 : begin
          codeForm.FormData := '부서기능코드 열람';
          codeForm.DataVal1 := 'I801';           //codeForm.DataVal1 := 'I330';
          codeForm.DataVal2 := E_Technique.Text; //codeForm.DataVal2 := E_DeptFunc.Text;  2001.10.22 shm
          end;
      3 : begin
          codeForm.FormData := '부서변동구분코드 열람';
          codeForm.DataVal1 := 'I170';
          codeForm.DataVal2 := E_ChanMode.Text;
          end;
      4 : begin
          codeForm.FormData := '부서세부기능코드 열람';
          codeForm.DataVal1 := 'I803';
          codeForm.DataVal2 := E_DetailsTech.Text; //2001.10.22 shm
          end;
      5 : begin
          codeForm.FormData := '부서구분코드 열람';
          codeForm.DataVal1 := 'I804';
          codeForm.DataVal2 := E_Deptgubun.Text; //2001.10.22 shm
          end;
    end;
    codeForm.ShowModal;
    if CodeForm.Code <> '' then begin
      case TComponent(Sender).Tag of
        1 : begin
             E_placecode.Text   := CodeForm.Code;
             L_placecode.Caption:= CodeForm.CodeName;
            end;
        2 : begin   //2001.10.22 shm
             E_Technique.Text    := CodeForm.Code;     //E_DeptFunc.Text    := CodeForm.Code;
             L_Technique.Caption := CodeForm.CodeName; //L_DeptFunc.Caption := CodeForm.CodeName;
            end;
        3 : begin
             E_ChanMode.Text    := CodeForm.Code;
             L_Chanmode.Caption := CodeForm.CodeName;
            end;
        4 : begin   //2001.10.22 shm
             E_DetailsTech.Text    := CodeForm.Code;
             L_DetailsTech.Caption := CodeForm.CodeName;
            end;
        5 : begin
             E_Deptgubun.Text    := CodeForm.Code;
             L_Deptgubun.Caption := CodeForm.CodeName;
            end;
      end;
    end;
  finally
    codeForm.Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TDeptForm.BB_BatchReadClick(Sender: TObject);
var
  ReadF, LogoF: TextFile;
  rData, ErrMesg, RealOrg, Str : string;
  i : Integer;
  ReadCnt, ErrCnt, ProCnt: Integer;
  ErrMark: Boolean;

  ORGNUM, DEPTCODE, DEPTNA1, DEPTNA2, DEPTNA3, EXISTON,
  PLACECODE, DEPTLEVEL, DEPTABBR, FIELDCODE, EXTCODE, BONCODE, FINCODE,
  CHANMODE, REORGDATE, CHANDATE, CLOSEDATE, SECTCODE, PARTCODE, TECHNIQUE,//DEPTFUNC,
  Borgnum, BDeptcode1,BDeptcode2,BDeptcode3,DETAILSTECH : string;
begin
  if MessageDlg('< 화일 Layout >'+#13#10#13#10+
                '  조직차수(3),부서코드(6),부서명(30),小팀명(30),직무그룹(30),'+#13#10+
                '  실제조직여부(1),근무지코드(2),부서등급(2),부문코드(3),'+#13#10+
                '  본부/그룹코드(3),상위부서코드(6),본코드(6),재무코드(6),부서기능(1),'+#13#10+
                '  부서변동구분1(1),실/단코드(3),조직개편일(8),변동일(8),폐쇄일(8),'+#13#10+
                '  변동전차수(3),변동전부서(6),변동전부서2(6),변동전부서3(6),'+#13#10+
                '  부서세부기능코드(2)'+#13#10#13#10+
                '☞ 작업하시겠습니까 ?'
           , mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
    System.Exit;

  if not OD_File.Execute then
    System.Exit;

  AssignFile(ReadF, OD_File.FileName);
  {$I-}
  Reset(ReadF);
  if IOResult <> 0 then
  begin
    MessageDlg('자료화일 접근에러', mtWarning, [mbOk], 0);
    System.Exit;
  end;

  if not FileCtrl.DirectoryExists(HomeDir+'\LIST') then
    MkDir(HomeDir+'\LIST');
  AssignFile(LogoF, HomeDir+'\LIST\pzc1020a.err');

  ReWrite(LogoF);
  if IOResult <> 0 then
  begin
    CloseFile(ReadF);
    MessageDlg('에러출력화일(Logo file) 생성에러', mtWarning, [mbOk], 0);
    System.Exit;
  end;

  ReadCnt := 0;
  ErrCnt  := 0;
  ProCnt  := 0;
  LastOrgnum   := E_orgnum.Text;
  LastDeptcode := E_deptcode.Text;

  SB_Help.Panels[1].Text := '자료를 읽고있습니다';
  Application.ProcessMessages;
  WriteLn(LogoF, '**************************************************************************');
  WriteLn(LogoF, ' 일괄입력 작업화일 : '+OD_File.FileName);
  WriteLn(LogoF, '          작업일자 : '+ Copy(CurDate, 1, 4)+'.'+Copy(CurDate, 5, 2)+'.'+Copy(CurDate, 7, 2)+' '+
                                          Copy(CurDate, 9, 2)+':'+Copy(CurDate, 11, 2)+':'+Copy(CurDate, 13, 2));
  WriteLn(LogoF, '          작 업 자 : '+Lempinfo.Caption);
  WriteLn(LogoF, '**************************************************************************');
  while not eof(ReadF) do begin
    ReadLn(ReadF, rData);
    Inc(ReadCnt); {읽은건수}

    ErrMesg := '['+Format('%.4d',[ReadCnt])+'] : ';
    ErrMark := False;

    ORGNUM := Get_Value(rData,1); {조직차수}
    if ORGNUM = '' then begin
      WriteLn(LogoF, ErrMesg+'자료화일에 조직차수없음');
      ErrMark := True;
    end;

    DEPTCODE := Get_Value(rData,2); {부서코드}
    if DEPTCODE = '' then begin
      WriteLn(LogoF, ErrMesg+'자료화일에 부서코드없음');
      ErrMark := True;
    end;

    DEPTNA1 := Get_Value(rData,3); {본부명}
    DEPTNA2 := Get_Value(rData,4); {부명}
    DEPTNA3 := Get_Value(rData,5); {과명}
    if DEPTNA3 <> '' then          {부서요약명}
      DEPTABBR := DEPTNA3
    else if DEPTNA2 <> '' then
      DEPTABBR := DEPTNA2
    else if DEPTNA1 <> '' then
      DEPTABBR := DEPTNA1;

    EXISTON := Get_Value(rData,6); {실제조직여부}
    if EXISTON = '' then begin
      WriteLn(LogoF, ErrMesg+'자료화일에 실제조직여부가 없슴');
      ErrMark := True;
    end;
    RealOrg := EXISTON;

    PLACECODE := Get_Value(rData,7); {근무지코드}             //2001.12.07 임시 shm
{    if (RealOrg = '1') and (PLACECODE = '') then //실제조직이며 값이없으면 error
    begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 근무지코드 없슴');
      ErrMark := True;
    end;}

    DEPTLEVEL := Get_Value(rData,8); {부서등급}
    if (RealOrg = '1') and (DEPTLEVEL = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 부서등급없음');
      ErrMark := True;
    end;

    SectCode := Get_Value(rData,9);  {부문코드}
    if (RealOrg = '1') and (SectCode = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 부문코드없음');
      ErrMark := True;
    end;

    FIELDCODE := Get_Value(rData,10); {본부/그룹코드}
    if (RealOrg = '1') and (FIELDCODE = '') then
    begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 본부/그룹코드없음');
      ErrMark := True;
    end;

    EXTCODE := Get_Value(rData,11); {상위부서코드}
//    if (RealOrg = '1') and (EXTCODE = '') then            실제조직도 상위부서가 없을수도 있다.(사장)
//    begin
//      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 상위부서코드없음');
//      ErrMark := True;
//    end;

    BONCODE := Get_Value(rData,12); {본코드}
{    if (RealOrg = '1') and (BONCODE = '') then 2001.12.07 임시 
    begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 인원통계코드없음');
      ErrMark := True;
    end;}

    FINCODE := Get_Value(rData,13); {재무코드}            // 재무코드는 나중에 등록한다.(이영진)
//    if (RealOrg = '1') and (FINCODE = '') then
//    begin
//      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 재무코드없음');
//      ErrMark := True;
//    end;

{    DeptFunc := Get_Value(rData,14); //부서기능
    if (RealOrg = '1') and (DeptFunc = '') then begin}
    TECHNIQUE := Get_Value(rData,14); //부서기능 2001.10.22 shm
    if (RealOrg = '1') and (TECHNIQUE = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 부서기능없음');
      ErrMark := True;
    end;

    DETAILSTECH := Get_Value(rData,24); //부서세부기능 2001.10.22 shm
    if (RealOrg = '1') and (DETAILSTECH = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 부서기능없음');
      ErrMark := True;
    end;

    CHANMODE := Get_Value(rData,15); {부서변동구분1}
    if (RealOrg = '1') and (CHANMODE = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 부서변동구분없음');
      ErrMark := True;
    end;

    REORGDATE := Get_Value(rData,17); {조직개편일}
    if (RealOrg = '1') and (REORGDATE = '') then begin
      WriteLn(LogoF, ErrMesg+'실제조직이나 자료화일에 조직개편일없음');
      ErrMark := True;
    end;

    CHANDATE  := Get_Value(rData,18); {변동일}
    CLOSEDATE := Get_Value(rData,19); {폐쇄일}
    Borgnum   := Get_Value(rData,20); // 변동전 조직차수
    Bdeptcode1:= Get_Value(rData,21); // 변동전 부서코드1
    Bdeptcode2:= Get_Value(rData,22); // 변동전 부서코드2
    Bdeptcode3:= Get_Value(rData,23); // 변동전 부서코드3

    if ErrMark then begin
      Inc(ErrCnt);
      WriteLn(LogoF, '');
    end else begin
      str := Get_Name(orgnum,Deptcode,1);
      if (str <> '없음') or (str = '') then begin
        WriteLn(LogoF, ErrMesg+'조직차수('+ORGNUM+')의 부서코드('+DEPTCODE+')가 이미 존재합니다');
        ErrMark := True;
      end;

      if (RealOrg = '1') then begin     // 실제조직일 경우
         str := Copy(CodeDisp(Qcod,'I160',PlaceCode,''),1,8);
{         if (str = '코드에러') or (str = '') then begin
              WriteLn(LogoF, ErrMesg+'근무지 코드('+PLACECODE+')가 존재하지 않습니다');
              ErrMark := True;
         end;                 } //임시 
      end;

      if (RealOrg = '1') then begin     // 실제조직일 경우
         str := Copy(CodeDisp(Qcod,'I170',ChanMode,''),1,8);
         if (str = '코드에러') or (str = '') then begin
              WriteLn(LogoF, ErrMesg+'부서변동구분 코드('+ChanMode+')가 존재하지 않습니다');
              ErrMark := True;
         end;
      end;
{      if (RealOrg = '1') then begin     // 실제조직일 경우
         str := Copy(CodeDisp(Qcod,'I330',Deptfunc,''),1,8);
         if (str = '코드에러') or (str = '') then begin
              WriteLn(LogoF, ErrMesg+'부서기능 코드('+Deptfunc+')가 존재하지 않습니다');
              ErrMark := True;
         end;
      end;}

      if (RealOrg = '1') then begin     // 실제조직일 경우  2001.10.22 shm
         str := Copy(CodeDisp(Qcod,'I801',Technique,''),1,8);
//         if (str = '코드에러') or (str = '') then begin
         if (str = '코드에러')  then begin //2001.12.07 shm
              WriteLn(LogoF, ErrMesg+'부서기능 코드('+Technique+')가 존재하지 않습니다');
              ErrMark := True;
         end;
      end;

      if (RealOrg = '1') then begin     // 실제조직일 경우  2001.10.22 shm
         str := Copy(CodeDisp(Qcod,'I803',DetailsTech,''),1,8);
//         if (str = '코드에러') or (str = '') then begin
         if (str = '코드에러')  then begin //2001.12.07 shm
              WriteLn(LogoF, ErrMesg+'부서세부기능 코드('+DetailsTech+')가 존재하지 않습니다');
              ErrMark := True;
         end;
      end;

      if (RealOrg = '1') then begin     // 실제조직일 경우
         str := Get_Name(orgnum,FieldCode,1);
         if (str = '없음') or (str = '') then begin
            WriteLn(LogoF, ErrMesg+'조직차수('+ORGNUM+')의 본부/그룹코드('+FIELDCODE+')가 존재하지 않습니다');
            ErrMark := True;
         end;
      end;

      if (EXTCODE <> '') then begin        // 상위부서코드 입력시
         str := Get_Name(orgnum,Extcode,1);
     {    if (str = '없음') or (str = '') then begin
              WriteLn(LogoF, ErrMesg+'조직차수('+ORGNUM+')의 상위부서코드('+EXTCODE+')가 존재하지 않습니다');
              ErrMark := True;
         end;} //임시
      end;

      if (RealOrg = '1') then begin     // 실제조직일 경우
         str := Get_Name(orgnum,Boncode,1);
         if (Deptcode <> Boncode) and
            ((str = '없음') or (str = '')) then begin
              WriteLn(LogoF, ErrMesg+'조직차수('+ORGNUM+')의 팀코드('+BONCODE+')가 존재하지 않습니다');
              ErrMark := True;
         end;
      end;

      // 변동전 차수가 Null 이면 부서1,부서2,부서3은 널.
      if trim(Borgnum) = '' then begin
         Bdeptcode1 := '';
         Bdeptcode2 := '';
         Bdeptcode3 := '';
      end;
      // 변동전 차수가 Null이 아니면 부서1,부서2,부서3 코드화일에 존재.
      if trim(Borgnum) <> '' then begin
         if Get_Name(borgnum,Bdeptcode1,2) = '없음' then begin
            WriteLn(LogoF, ErrMesg+'변동전차수('+BORGNUM+')의 변동전부서코드1('+BDeptcode1+')가 존재하지 않습니다');
            ErrMark := True;
         end;
         if Get_Name(borgnum,Bdeptcode2,2) = '없음' then begin
            WriteLn(LogoF, ErrMesg+'변동전차수('+BORGNUM+')의 변동전부서코드2('+BDeptcode2+')가 존재하지 않습니다');
            ErrMark := True;
         end;
         if Get_Name(borgnum,Bdeptcode3,2) = '없음' then begin
            WriteLn(LogoF, ErrMesg+'변동전차수('+BORGNUM+')의 변동전부서코드3('+BDeptcode3+')가 존재하지 않습니다');
            ErrMark := True;
         end;
      end;

      if ErrMark then begin
        Inc(ErrCnt);
        WriteLn(LogoF, '');
      end else begin
        Inc(ProCnt);
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('INSERT INTO PYCDEPT ( ');
        Query_exec.SQL.Add('  ORGNUM, DEPTCODE, DEPTNA1, DEPTNA2, DEPTNA3, EXISTON, ');
        Query_exec.SQL.Add('  PLACECODE, DEPTLEVEL, DEPTABBR, FIELDCODE, EXTCODE, BONCODE, FINCODE, ');
        Query_exec.SQL.Add('  CHANMODE,  REORGDATE, CHANDATE, CLOSEDATE, ');
//        Query_exec.SQL.Add('  DEPTNAME, WRITETIME, WRITEEMP,SECTCODE,DEPTFUNC,Borgnum,Bdeptcode1,Bdeptcode2,Bdeptcode3) VALUES ( ');
        Query_exec.SQL.Add('  DEPTNAME, WRITETIME, WRITEEMP,SECTCODE,TECHNIQUE,DETAILSTECH,Borgnum,Bdeptcode1,Bdeptcode2,Bdeptcode3) VALUES ( ');
        Query_exec.SQL.Add(' '''+ORGNUM+''','''+DEPTCODE+''','''+DEPTNA1+''','''+DEPTNA2+''','''+DEPTNA3+''','''+EXISTON+''', ');
        Query_exec.SQL.Add(' '''+PLACECODE+''','''+DEPTLEVEL+''','''+DEPTABBR+''','''+FIELDCODE+''','''+EXTCODE+''','''+BONCODE+''','''+FINCODE+''', ');
        Query_exec.SQL.Add(' '''+CHANMODE+''','''+REORGDATE+''','''+CHANDATE+''','''+CLOSEDATE+''', ');
        Query_exec.SQL.Add(' '''+DEPTNA1+' '+DEPTNA2+' '+DEPTNA3+''','''+copy(CurDate,1,14)+''','''+Pempno+''',');
//        Query_exec.Sql.Add(' '''+SECTCODE+''','''+DEPTFUNC+''','''+BORGNUM+''',');
        Query_exec.Sql.Add(' '''+SECTCODE+''','''+TECHNIQUE+''','''+DETAILSTECH+''',');
        Query_exec.Sql.Add(' '''+BORGNUM+''','''+BDeptCode1+''','''+BDeptcode2+''','''+Bdeptcode3+''') ');
        Query_exec.EXECSQL;
        Query_exec.Close;
      end;
    end;

    SB_Help.Panels[1].Text := ' 읽은건수: '+IntToStr(ReadCnt)+
                          '   처리건수: '+IntToStr(ProCnt)+
                          '   오류건수: '+IntToStr(ErrCnt);
    Application.ProcessMessages;
  end;
  WriteLn(LogoF, '');
  WriteLn(LogoF, '**************************************************************************');
  WriteLn(LogoF, ' 읽은건수 : '+IntToStr(ReadCnt)+
                 '    처리건수 : '+IntToStr(ProCnt)+
                 '    오류건수 : '+IntToStr(ErrCnt));
  CloseFile(ReadF);
  CloseFile(LogoF);
  {$I+}
  SB_Help.Panels[1].Text := ' 읽은건수: '+IntToStr(ReadCnt)+
                        '   처리건수: '+IntToStr(ProCnt)+
                        '   오류건수: '+IntToStr(ErrCnt)+'    오류화일명: '+HomeDir+'\LIST\pzc1020a.err';
  MessageDlg('읽은건수: '+IntToStr(ReadCnt)+'    '+#13#10+
             '처리건수: '+IntToStr(ProCnt) +'    '+#13#10+
             '오류건수: '+IntToStr(ErrCnt) +'    ', mtInformation, [mbOk], 0);

  Select_Pycdept;
end;

//------------------------------------------------------------------------------
{','문자로 분리된 문자열에서 nPos번째 문자열을 return}
function TDeptForm.Get_Value(rStr:String; nPos: Integer): String;
var
  i, j, dotcnt: Integer;
begin
  if Copy(rStr,length(rStr),1) <> ',' then {맨마지막에 ","문자 추가}
    rStr := Trim(rStr) + ',';
  j := 1;
  dotcnt := 1; {','문자 갯수}
  for i := 1 to Length(rStr) do
    if rStr[i] = ',' then
    begin
      if dotcnt = nPos then
      begin
           if (i - j) = 0 then Result := '' {빈공란일경우}
           else                Result := Trim(Copy(rStr, j, i - j));
         System.Exit;
      end;
      Inc(dotcnt);
      j := i + 1;
      if i >= Length(rStr) then {nPos번째 자료없음}
      begin
        Result := '';
        System.Exit;
      end;
    end;
  Result := '';
end;

//------------------------------------------------------------------------------
procedure TDeptForm.BB_prnsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TDeptForm.BB_printClick(Sender: TObject);
begin
  if (E_deptcodeFROM.Text = '') or (E_deptcodeTO.Text = '') then
  begin
    SB_Help.Panels[1].Text := '먼저 인쇄부서코드범위를 입력하세요.';
    System.Exit;
  end;
  SB_Help.Panels[1].Text := '인쇄중입니다.';
  Application.ProcessMessages;

  DeptPrint.Query_print.Close;
  DeptPrint.QRL_orgnum.Caption        := E_SERorgnum.Text;
  DeptPrint.QRL_deptcodeRANGE.Caption := E_deptcodeFROM.Text+' ~ '+E_deptcodeTO.Text;
  DeptPrint.QRLsysdate.Caption        := L_CurDate.Caption;
  DeptPrint.Query_print.ParamByName('P_orgnum').AsString       := E_SERorgnum.Text;
  DeptPrint.Query_print.ParamByName('P_deptcodeFROM').AsString := E_deptcodeFROM.Text;
  DeptPrint.Query_print.ParamByName('P_deptcodeTO').AsString   := E_deptcodeTO.Text;
  DeptPrint.QReport.Print;
//    DeptPrint.QReport.Preview;
  DeptPrint.Query_print.Close;
  SB_Help.Panels[1].Text := '인쇄가 완료되었습니다.';
end;

procedure TDeptForm.BtextClick(Sender: TObject);
begin
 Try
   forg := Tforg.Create(self);
   forg.filename := 'deptcode.xls';//'insacode.dep';
   forg.ShowModal;
 Finally
   forg.Free;
 End;
end;

//------------------------------------------------------------------------------
//30.04 SHM 근무지 미적용 관련
procedure TDeptForm.RB_insa1Click(Sender: TObject);
begin
  Showmessage('인사마스터 미적용을 선택하셨습니다.'+#13#10+#13#10+
              '따라서 인사마스터에 변경내용이 적용되지 않습니다!');
end;
//------------------------------------------------------------------------------
procedure TDeptForm.Update_History;
var
  Temp_no    : Integer;
begin
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
  Query1.Sql.Add('  WHERE  PROGID = ''PZA1020A''               ');
  Query1.Open;
  Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
  Query1.Close;

  Query1.Sql.Clear;
  Query1.Sql.Add('INSERT INTO PYMPHIS                                      ');
  Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS)');
  Query1.Sql.Add('VALUES                                                   ');
  Query1.Sql.Add('   (                                                     ');
  Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                 );
  Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PZA1020A'',     ');
  Query1.Sql.Add('       '''+CURDATE+''',                                  ');
  Query1.Sql.Add('       ''부서코드관리(근무지 변경->인사마스터 미적용)- '' || '''+E_deptcode.TEXT+''') ');
  Query1.ExecSQL;
  Query1.Close;
  RB_insa1.checked := True;
end;
//------------------------------------------------------------------------------
//저장 rtn 에 속해있던 것을 분리함. 근무지 이외 저장시 항상 물어보기 때문.
procedure TDeptForm.Update_Pimpmas;
begin
  Query_exec.Close;
  Query_exec.SQL.Clear;
  Query_exec.SQL.Add('UPDATE pimpmas                                     '+
                     '   SET boncode   =  ''' + E_deptcode.Text    + ''' '+
                     '     , jobplace  =  ''' + E_placecode.Text   + ''' '+
                     '     , fincode   =  ''' + E_fincode.Text     + ''' '+
                     '     , writetime =  ''' + copy(CurDate,1,14) + ''' '+
                     '     , writeemp  =  ''' + pempno             + ''' '+
                     ' WHERE orgnum    =  ''' + E_orgnum.Text      + ''' '+
                     '   and deptcode  =  ''' + E_deptcode.Text    + ''' '+
                     '   AND pstate    <  ''80''                         ');
  Query_exec.EXECSQL;
  SB_Help.Panels[1].Text := '인사마스터의 자료를 갱신했습니다.';
  RB_insa2.checked := True;
end;

procedure TDeptForm.PBnetMail(Sender : TObject);
var
  MailTitle1, MailTitle2, MailBody : string;
  iIdx : Integer;
const //인원정리 dsa2000  2018.09. 퇴사자삭제 &  2개(Z429 Z799) 계정은 미사용으로 생각되나 공용계정이므로 유지함. 
//asEmpno : array[0..22] of string[5] = ('Z159'  ,'Z429'  ,'ZZ95'  ,'ZZ98'  ,'ZZ97'  ,'ZZ82'  ,'ZZ96'  ,'Z1114' ,'Z1395' ,'Z113'  ,'1447'  ,'Z710'  ,'ZH80'  ,'Z799'    ,'Z185'  ,'1951'  ,'Z741'  ,'Z959','2429'  ,'2089'  , '0859' ,'0965'  ,'2228' );
//asKornm : array[0..22] of string[12]= ('윤현숙','CLIENT','김성만','성광환','양순직','윤광수','이미선','정지은','구해자','강륜종','김철겸','박희은','송종훈','내부영업','최원창','서영태','김소정','까마','홍창현','임균홍','강태호','임성훈','제환종' );
//asEmpno : array[0..7] of string[5] = ('Z429'  ,'Z799'    ,'ZZ95'    ,'Z113'  ,  '1951'  ,'2429'  ,'2614'  ,'2251'  ); //ZZ95로 보내면 BNet운영팀 전체로 전송되도록 분기설정되어져 있다고 함.
//asKornm : array[0..7] of string[12]= ('CLIENT','내부영업','Bnet운영','강륜종',  '서영태','홍창현','정요진','김동국');

  //경영기획팀은 부서신설시에만 메일 전송토록 요청하여 리스트에서 삭제
  asEmpno : array[0..5] of string[5] = ('Z429'  ,'Z799'    ,'ZZ95'    ,'Z113'  ,  '1951'  ,'2429'  );//ZZ95로 보내면 BNet운영팀 전체로 전송되도록 분기설정되어져 있다고 함.
  asKornm : array[0..5] of string[12]= ('CLIENT','내부영업','Bnet운영','강륜종',  '서영태','홍창현');

  //dsa2000  2018.09. ADD  경영기획팀 재무부서코드 등록 담당자에게 메일 자동전송 위해 추가
  asEmpno2: array[0..1] of string[5]  = ('2614','2251'); //'정요진','김동국'
begin
  if TBitBtn(Sender).Name = 'BB_save' then
  begin
       if (E_Chanmode.Text = '0') or (E_Chanmode.Text = '1') then
       begin
            if update = 1 then
            begin
                 MailBody:= '안녕하십니까? '        + #13#10 +
                     '조직차수['+E_orgnum.Text+']'      + #13#10 +
                     '재무부서코드['+E_fincode.Text+']' + #13#10 +
                     '상위부서코드['+E_extcode.Text+']' + #13#10 +
                     '부서코드/명 ['+E_deptcode.Text+ '/' + E_deptna1.Text + ']' + L_Chanmode.Caption + ' 등록 되었기에 알려 드립니다. ' + #13#10 +
                     '변동전 조직차수['+E_borgnum.Text+']' + #13#10 +
                     '변동전 부서1코드/명['+E_bdeptcode1.Text+ '/' + L_Bdeptcode1.Caption + '] '+#13#10 +
                     '변동전 부서2코드/명['+E_bdeptcode2.Text+ '/' + L_Bdeptcode2.Caption + '] '+#13#10 +
                     '변동전 부서3코드/명['+E_bdeptcode3.Text+ '/' + L_Bdeptcode3.Caption + '] 이었습니다. ' + #13#10 +
                     '수고하세요.' + #13#10 +  #13#10 +
                     '※ [안내] 재무부서코드 및 변동전부서코드 내역이 없는 경우는 신설부서 또는 담당자가 등록하지 않은 경우입니다.'  + #13#10 +
                     '          업무에 참고하시기 바랍니다. ';
            end
            else
            begin
                 MailBody:= '안녕하십니까? '         + #13#10 +
                     '조직차수['+E_orgnum.Text+']'      + #13#10 +
                     '재무부서코드['+E_fincode.Text+']' + #13#10 +
                     '상위부서코드['+E_extcode.Text+']' + #13#10 +
                     '부서코드/명 ['+E_deptcode.Text+ '/' + E_deptna1.Text + ']' + ' 수정 되었기에 알려 드립니다. ' + #13#10 +
                     '변동전 조직차수['+E_borgnum.Text+']' + #13#10 +
                     '변동전 부서1코드/명['+E_bdeptcode1.Text+ '/' + L_Bdeptcode1.Caption + '] '+#13#10 +
                     '변동전 부서2코드/명['+E_bdeptcode2.Text+ '/' + L_Bdeptcode2.Caption + '] '+#13#10 +
                     '변동전 부서3코드/명['+E_bdeptcode3.Text+ '/' + L_Bdeptcode3.Caption + '] 이었습니다. ' + #13#10 +
                     '수고하세요.' + #13#10 +  #13#10 +
                     '※ [안내] 재무부서코드 및 변동전부서코드 내역이 없는 경우는 신설부서 또는 담당자가 등록하지 않은 경우입니다.'  + #13#10 +
                     '          업무에 참고하시기 바랍니다. ';
            end;
       end
       else if (E_Chanmode.Text = '2') or (E_Chanmode.Text = '3') then
       begin
            MailBody := '안녕하십니까? '              + #13#10 +
                     '조직차수['+E_orgnum.Text+']'      + #13#10 +
                     '재무부서코드['+E_fincode.Text+']' + #13#10 +
                     '상위부서코드['+E_extcode.Text+']' + #13#10 +
                     '부서코드/명 ['+E_deptcode.Text+ '/' + E_deptna1.Text + ']' + L_Chanmode.Caption + ' 등록 되었기에 알려 드립니다. ' + #13#10 +
                     '변동전 조직차수['+E_borgnum.Text+']' + #13#10 +
                     '변동전 부서1코드/명['+E_bdeptcode1.Text+ '/' + L_Bdeptcode1.Caption + '] '+#13#10 +
                     '변동전 부서2코드/명['+E_bdeptcode2.Text+ '/' + L_Bdeptcode2.Caption + '] '+#13#10 +
                     '변동전 부서3코드/명['+E_bdeptcode3.Text+ '/' + L_Bdeptcode3.Caption + '] 이었습니다. ' + #13#10 +
                     '수고하세요.' + #13#10 +  #13#10 +
                     '※ [안내] 재무부서코드 및 변동전부서코드 내역이 없는 경우는 신설부서 또는 담당자가 등록하지 않은 경우입니다.'  + #13#10 +
                     '          업무에 참고하시기 바랍니다. ';
       end;
  end
  else if TBitBtn(Sender).Name = 'BB_delete' then
  begin
       MailBody:= '안녕하십니까? '              + #13#10 +
                  '조직차수['+E_orgnum.Text+']'      + #13#10 +
                  '재무부서코드['+E_fincode.Text+']' + #13#10 +
                  '상위부서코드['+E_extcode.Text+']' + #13#10 +
                  '부서코드/명['+ Save_deptcode + '/' + Save_deptname + ']' + ' 삭제 되었기에 알려 드립니다. ' + #13#10 +
                  '수고하세요.';
  end;

  MailTitle1 := '[ 부서코드 변경안내 ]';
  for iIdx := 0 to 5 do   //반드시 위 인원수와 동일하게. asEmpno
  begin
       SendProgID  := 'PZC1020A';
       SendEmpno   := Pempno;
       RcveEmpno   := asEmpno[iIdx];
       MailSubject := MailTitle1;
       MailBody    := MailBody;
       ReceiveYN   := 'N';  //if ChkReceive.Checked then ReceiveYN := 'Y';

       if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       begin
            MessageDlg(MailTitle1 + ' 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
       end;
       next;
  end; //end of for
  MessageDlg(MailTitle1 + ' 메일이 성공적으로 발송되었습니다.('+IntToStr(iIdx)+'명)',mtInformation, [mbOk], 0);
  iIdx := 0;
  //////////////////////////////////////////////////////////////////////////////////////////////////


  //dsa2000  2018.09. ADD  경영기획팀 재무부서코드 등록 담당자에게 자동메일전송 위해 추가
  MailTitle2 := '[ 재무부서코드 등록요청 ]';
  IF Trim(E_fincode.Text) = '' then //해당 부서코드 저장시마다 메일 전송.
  begin
       for iIdx := 0 to 1 do
       begin
            SendProgID  := 'PZC1020A';
            SendEmpno   := Pempno;
            RcveEmpno   := asEmpno2[iIdx];
            MailSubject := MailTitle2;
            MailBody    := ' 안녕하십니까? ' + #13#10 + #13#10 +
                           ' 금일 HR팀에서 신규 부서를 생성하였으며 해당 부서의 재무코드 등록이 필요합니다.'+ #13#10 +
                           ' ※ 부서코드/명 ['+E_deptcode.Text+ '/' + E_deptna1.Text + ']'+ #13#10 + #13#10 +
                           ' 추후 HR팀에서 MyHR 인사발령공지 또는 메일로 상세 부서정보를 안내할 예정이오니 업무에 참고 부탁드립니다.'+ #13#10 +
                           ' - 명칭 / 운영기간 / 운영체계 등 '+ #13#10 + #13#10 +
                           ' 상세 부서정보 확인 후 재무코드 빠른 등록 부탁드리며, 재무코드가 없는 부서는 SAP 결재 상신시 에러 발생합니다.';
            ReceiveYN   := 'N';

            if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            begin
                 MessageDlg(MailTitle2 + ' 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                 exit;
            end;
            next;
       end; //end of for
       MessageDlg(MailTitle2 + ' 메일이 성공적으로 발송되었습니다.('+IntToStr(iIdx)+'명)',mtInformation, [mbOk], 0);
  end;//////////////////////////////////////////////////////////////////////////
end;

procedure TDeptForm.E_deptcodeExit(Sender: TObject);
begin
  if (Length(E_deptcode.Text) <> 5) then
  begin
    ShowMessage('부서코드 자리수를 확인바랍니다.!!');
    System.Exit;
  end;
end;

procedure TDeptForm.E_fincodeExit(Sender: TObject);
begin
  if ((Length(E_fincode.Text) <> 5) and (TrimRight(E_fincode.Text) <> '')) then
  begin
    ShowMessage('재무용부서코드 자리수를 확인바랍니다.!!');
    System.Exit;
  end;
end;

procedure TDeptForm.E_boncodeExit(Sender: TObject);
begin
  if (Length(E_boncode.Text) <> 5) then
  begin
    ShowMessage('인원집계코드(BONCODE) 자리수를 확인바랍니다.!!');
    System.Exit;
  end;
end;

procedure TDeptForm.E_deptcodeFROMExit(Sender: TObject);
begin
  if ((Length(E_deptcodeFROM.Text) <> 5) and (TrimRight(E_deptcodeFROM.Text) <> '')) or
     ((Length(E_deptcodeTO.Text) <> 5) and (TrimRight(E_deptcodeTO.Text) <> '')) then
  begin
    ShowMessage('인쇄부서코드 자리수를 확인바랍니다.!!');
    System.Exit;
  end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TDeptForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with Query_exec do
  begin
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                           ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHH24MISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',               ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',               ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',               ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,               ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',               ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,               ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',               ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,               ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',               ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,               ');  //EAI_FLAG
       SQL.Add('        ''''                  )               ');  //EAI_DATE

       try
            ExecSql;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;

procedure TDeptForm.ME_closedateExit(Sender: TObject);
begin //das2000  2018.09. Add
  if (Trim(ME_closedate.Text) <> '') And (E_Chanmode.Text <>'3') then
      ShowMessage('"조직폐쇄일"을 지우거나 "부서변동구분"을 폐쇄로 변경 바랍니다');
end;

procedure TDeptForm.Mail_SendClick(Sender: TObject);  //dsa2000   2004.11.09.
var
   MailTitle, MailBody, MailKorname : string;
begin
  if (Fincode_emp.text < ' ' ) or (Fincode_Korname.text < ' ') then
  begin
    MessageDlg('재무부서코드 등록 담당자를 입력후 메일발송을 해 주시기 바랍니다',mtInformation, [mbOk], 0);
    exit;
  end;

  CoInitialize(nil);  //메일발송시 에러 발생하여 ...(uses ActiveX)
  MailTitle := '[ 재무부서코드 등록요청 ]';
  MailBody  := '안녕하십니까? ' + #13#10 +
               '신규 부서코드가 등록되었기에 신규부서코드의 재무부서코드 등록을 요청드립니다. ';
  MailKorname := Fincode_Korname.Text;

  Application.ProcessMessages;
  if MessageDlg(MailTitle + #13#13 + '재무부서코드 등록담당자 '+MailKorname+' 에게 메일을 보내시겠습니까?',
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
    MessageDlg('메일 발송이 취소되었습니다.~~~', mtInformation, [mbOK], 0);
    System.Exit;
  end;

  SendProgID  := 'PZC1020A';
  SendEmpno   := Pempno;
  RcveEmpno   := Fincode_emp.text;
  MailSubject := MailTitle;
  MailBody    := MailBody;
  ReceiveYN   := 'N';
  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
end;

procedure TDeptForm.BB_MyHRClick(Sender: TObject);
begin //ShellApi   dsa2000  2018.09. Add    개발자는 MyHR 로그인 후 정상 접속 됨.
  ShellExecute(0,'Open','iexplore','http://hr.skbroadband.com/hrinfo/personnel/getPersonnelAppointListInit.do','',SW_SHOWNORMAL);
end;

procedure TDeptForm.BitBtn9Click(Sender: TObject);
begin

  FPIC10203 := TFPIC10203.Create(self);
  try
     if FPIC10203.ShowModal = mrOK then
     begin



     end;
  finally
     FPIC10203.Free;
  end;
end;

end.




