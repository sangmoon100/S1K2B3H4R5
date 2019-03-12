{===================== Program Header ==========================================
 PROGRAM-NAME      : 종합인사정보시스템
 SYSTEM-NAME       : 인사
 SUBSYSTEM-NAME    : 개인별 직무경력등록(PIT1030A)
 Programmer        : 배준상
 Version           : 1.0
 Date              : 1999.06.18

Update Contents
 Version  date(yy.mm.dd)  programmer  description                       relevant doc.n
 1.00
 03.09    2002.04.02      손종운      Notes 기능 삭제
                                      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
 03.13    2002.04.04      손종운
 03.14    2002.04.08      손종운      결재자에게 보이는 상태 수정
 03.21    2003.02.26      손종운     ` Notes  기능 수정/보완
 03.26    2003.03.07      손종운      버그수정
 03.27    2003.03.07      손종운      사장/회장에게 보내는 결재상신 메일 차단
 03.28    2004.06.29      이민용      CI변경으로 폼캡션에서  뺌   자체개선
 03.29    2004.12.17      정규용      윗사람이 로고 덜빼서 마져 뺌
 04.00    2004.12.30      유효성      전면적 수정 --> 임시처리사항 많음: 다음 오픈시 하드코딩 부분 확인요
 04.01    2005.06.13      변춘미      결재자 조회 쿼리 수정 : 수정전=> 상위부서의 보임자 검색
                                       부서레벨 'E0'이면 상위부서, else 해당부서 보임자검색으로 수정
================================================================================}
unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, peprnview,
  OnFocusButton, Grids, pegradpanl, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme, Tmax_session, NotesHana_TLB,
  UpitLib, kpaylib, Mask, pebtnedit, OnPopupEdit, Oninsacommon,
  OnShapeLabel, TmaxFunc;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    TMaxSession: TTMaxSession;
    TCDS: TTMaxDataSet;
    TCODE: TTMaxDataSet;
    TCDS_Sub: TTMaxDataSet;
    TCupd: TTMaxDataSet;
    TCsel: TTMaxDataSet;
    TDml: TTMaxDataSet;
    SB_Help: TStatusBar;
    SG_Main: TStringGrid;
    Label4: TLabel;
    Shape2: TShape;
    SpecText: TMemo;
    Shape3: TShape;
    SpecBtn: TOnFocusButton;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape8: TShape;
    Label3: TLabel;
    Bt_Srh: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    AddBtn: TOnFocusButton;
    EditBtn: TOnFocusButton;
    DeleteBtn: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    Bt_Cancel: TOnFocusButton;
    Bt_return: TOnFocusButton;
    Bt_PreView: TOnFocusButton;
    Bt_Print: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    L_111: TOnShapeLabel;
    L_dutykind: TOnShapeLabel;
    Shape4: TShape;
    Label5: TLabel;
    Shape5: TShape;
    Label6: TLabel;
    BT_anno: TOnFocusButton;
    L_duty: TOnShapeLabel;
    TDS1: TTMaxDataSet;
    L_jobfield: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
//    procedure BitBtn_CloseClick(Sender: TObject);
//    procedure BitBtn_HelpClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure SpecBtnClick(Sender: TObject);
    procedure SG_MainDblClick(Sender: TObject);
    procedure SpecTextExit(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure Bt_PreViewClick(Sender: TObject);
    procedure SpecTextKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_returnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_CancelClick(Sender: TObject);
    procedure Ed_empnoEnter(Sender: TObject);
    procedure SG_MainSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_annoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Wempno, WKorname,AEMPNO : String;
    Pempno, Pkorname, Password, Ppermission, Pjobgun, Ppayra, Ppayrayn, Pjobpayrayn: String;
    Pjobpayra : String;
    Porgnum, Pdeptcode, PSysdate: string;
    Pdeptname : string;
    pConyn, pFinyn : String;
    pFrdate, pTodate : string;
    pSeqno : Integer;
    pOrgDeptList: String;
    PresEmp : String;
    PfrBasedate, PtoBasedate: String;
    Lgubun: Integer;
    LastToDate : String;
    LastFrDate : String;
    LastRate : String;
    pMilitary : String;
    pEmplist  : String;
    EempFind : Boolean;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    toMailKorname, toMailEmpno, Msg: string;
    payrachdate  : string;
    
    procedure fzInitialMainFrom;
    procedure SET_GRID;
    function  fnGetMainDataSet(mEmpno: String): Boolean;
    function  fnGetPrintData: Boolean;
    function  fnSetVariable(mGubun: Integer): Boolean;
    function  fnOrgDeptList(mEmpno: String): String;
    procedure fzSaveFinConData(var mSaved: Boolean; mGubun: Integer; mEmpno, mSayu: String);
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
    procedure fzGetToMailEmp(var mSaved: Boolean; var mKorname, mEmpno: String; mGubun: Integer);
    procedure fzSetSaveButtons(mEabled: Boolean);
    procedure fzSetConButtons(mEabled: Boolean);
    function  TCsel_gfd(p_loc: Integer): String;
  end;

var
  MainForm: TMainForm;
  giHeightRow : Integer;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;
const
//  iWidthOfDutyText : Integer = 300;
  iWidthOfDutyText : Integer = 440;
  iWidthOfPaycl    : Integer = 60;

implementation

uses
  //UpitLib,
  URegForm, UEmpForm, UDutyForm, UPreView, UConfirmForm, UPIA1070B_6;

{$R *.DFM}
//=============================================================================//
// Button 관련 Event...
//=============================================================================//
procedure TMainForm.SpecBtnClick(Sender: TObject);
var
  iCheckExist: Integer;
  SQLText: String;
begin
  if SpecText.Lines.Count > 4 then
    begin
      MessageDlg(' 4줄 이하로 줄여 주세요', mtInformation,[mbOK],0);
      System.Exit;
    end;

    // 입력, 수정 여부 결정
  SQLText:= Format('SELECT Count(EMPNO) CNT FROM pishrspec '+
                   ' WHERE empno = ''%s''               ', [Pempno]);
  TCsel.Close;
  TCsel.ClearFieldInfo;
  TCsel.AddField('CNT', ftInteger, 300);
  TCsel.SQL.Clear;
  TCsel.SQL.Text := SQLText;
  TCsel.ServiceName := 'PIT1030A_SEL1';
  TCsel.Open;

  iCheckExist := TCsel.FieldByName('CNT').AsInteger;
  TCsel.Close;

  if iCheckExist < 1  then
    begin
      SQLText := Format(
                 'INSERT INTO PISHRSPEC ' +
                 ' (empno, spectext, writeemp, writetime) '+
                 ' VALUES (''%s'',''%s'',''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')) ',
                 [MainForm.pEmpno, replace(SpecText.Text,'''','`'), MainForm.wEmpno]);
    end
  else
    begin
      if trim(SpecText.Text) <> '' then
          SQLText := Format(
                     'UPDATE  PISHRSPEC  SET   ' +
                     ' spectext = ''%s'' ,     ' +
                     ' writeemp = ''%s'' ,     ' +
                     ' writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +
                     'WHERE empno = ''%s''     ' ,
//                     '  and writetime > ''%s'' ' ,
                     [replace(SpecText.Text,'''','`'), MainForm.wEmpno, MainForm.pEmpno])//, Copy(PfrBasedate,1,4)])
      else
          SQLText := Format(
                     'DELETE FROM PISHRSPEC    ' +
                     'WHERE empno = ''%s''     ' ,
//                     '  and writetime > ''%s'' ' ,
                     [MainForm.pEmpno])//, Copy(PfrBasedate,1,4)])         //저장이 안되서 조건 풀어줌 김경호과장(0891) 요청(2008.10.10)
    end;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
//  edit1.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';
  if NOT TDml.Execute then
     MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
    begin
      gbChanged := False;
      MessageDlg('특기사항 저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    end;

  SpecText.Modified := False;
  SG_Main.SetFocus;
end;

procedure TMainForm.SpecTextExit(Sender: TObject);
begin
  if Trim(SpecText.Text) = '' then
    begin
      SpecText.Text := '입력된 내용이 없습니다.';
      SpecText.Modified := False;
    end;
end;

procedure TMainForm.SG_MainDblClick(Sender: TObject);
begin
  if SG_Main.Cells[1,SG_Main.Row] <> '' then
    if EditBtn.Enabled then
      EditBtn.Click;
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
var
  i, j, iSeqno: Integer;
  sTempDate: String;
begin
  Try
    RegForm := TRegForm.Create(Self);
    if TComponent(Sender).Tag = 1 then
      begin
        iSeqno  := StrToIntDef(Trim(SG_Main.Cells[m_SEQNO,SG_Main.Row]),0) + 1;

        RegForm.gsEmpno := MainForm.pEmpno;
        RegForm.gbSTATE := True;
        RegForm.gsEnable:= True
      end
    else
      begin
        if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

        with RegForm do
          begin
            // 초기화
            iSeqno       := StrToIntDef(Trim(SG_Main.Cells[m_SEQNO,SG_Main.Row]),0);
            gsEmpno      := trim(SG_Main.Cells[m_EMPNO, SG_Main.Row]);
            gsFrDutydate := trim(SG_Main.Cells[m_FRDUTYDATE, SG_Main.Row]);
            gsToDutydate := trim(SG_Main.Cells[m_TODUTYDATE, SG_Main.Row]);
            gbSTATE      := False;
            if (wempno = Workemp1) or (wempno = Workemp2) or
               (wempno = Workemp3) or (wempno = Workemp4) or (wempno = Workemp5) then
               gsEnable := True
            else
            if pseqno = SG_Main.Row then
              gsEnable := True
            else
              gsEnable := False;
          end;
      end;
    RegForm.ShowModal;

  Finally
    RegForm.Free;
  End;

  Application.ProcessMessages;

  SET_GRID;
  fnSGLocate(SG_Main,'0',IntToStr(iSeqno)); // UPitLib
end;

procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
//    if MessageDlg(' 저장하지 않은 데이타는 손실될 수 있습니다.'+#13 +
//                  ' 그래도 종료하시겠습니까? ', mtInformation,[mbYes, mbNo],0) = mrNo then
//        System.Exit;
  Close;
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
var
  SQL, sFrDate, sToDate: String;
  iSeqno: Integer;
begin
  if SG_Main.Cells[0,SG_Main.Row] = '' then Exit; // UPitLib

  iSeqno  := StrToInt(Trim(SG_Main.Cells[m_SEQNO, SG_Main.Row]));
  sFrDate := Trim(SG_Main.Cells[m_FRDUTYDATE, SG_Main.Row]);
  sToDate := Trim(SG_Main.Cells[m_TODUTYDATE, SG_Main.Row]);

  if MessageDlg(' "'+Trim(SG_Main.Cells[m_DUTYDATE, SG_Main.Row]) + '" 기간자료에 대하여 일괄 삭제하시겠습니까? ',
                mtInformation,[mbYes, mbNo],0) = mrNo then Exit;

  SQL := Format( 'DELETE FROM pishrsub s  '+
                 'WHERE empno   = ''%s''  '+
                 '  AND dutyno in         '+
                 '      (SELECT dutyno FROM pishrmas m                    '+
                 '       WHERE m.empno = s.empno                          '+
                 '         AND frdutydate = ''%s''                        '+
                 '         AND NVL(todutydate,''0'') = NVL(''%s'',''0'')) ',
                 [MainForm.pEmpno, sFrDate, sToDate]);

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQL;
  TDml.ServiceName := 'PIT1030A_DML';
  if NOT TDml.Execute then
  begin
     MessageDlg('"상세직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
     System.Exit;
  end;

  SQL := Format('DELETE FROM pishrmas    '+
                 'WHERE empno   = ''%s'' '+
                 '  AND frdutydate = ''%s'' '+
                 '  AND NVL(todutydate,''0'') = NVL(''%s'',''0'') ',
                 [MainForm.pEmpno, sFrDate, sToDate]);
  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQL;
  TDml.ServiceName := 'PIT1030A_DML';
  if NOT TDml.Execute then
  begin
     MessageDlg('"직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
     System.Exit;
  end;

  // 마스터에 자료가 없으면 전체 테이블 자료 제거
  // SQL := Format('SELECT Count(*) cnt FROM PISHRMAS  WHERE empno = ''%s'' ' , [MainForm.Pempno]);
  //
  // Csel_SQL := SQL;
  // Csel_Open;
  // if not Csel_ret then
  // begin
  //   Messagedlg('APP-Server Error : ' + Csel.ServiceName + #13 +
  //              '[' + Csel.HeaderInfo.ErrCode + '] ' + Csel.HeaderInfo.ErrMSG
  //              ,mtError,[mbOK],0);
  //   Exit;
  // end;
  //
  // if strtoint(TuxCDM.Csel_gfd(1)) < 1 then
  // begin
  //     SQL := Format('DELETE FROM pishrspec   '+
  //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
  //     if EXEC_SQL(SQL) = false then
  //     begin
  //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
  //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
  //        Exit;
  //     end;
  //
  //     SQL := Format('DELETE FROM pishreqip   '+
  //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
  //     if EXEC_SQL(SQL) = false then
  //     begin
  //        MessageDlg('"장비" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
  //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
  //        Exit;
  //     end;
  //
  //     SQL := Format('DELETE FROM pishrprog   '+
  //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
  //     if EXEC_SQL(SQL) = false then
  //     begin
  //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
  //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
  //        Exit;
  //     end;
  // end;

  MessageDlg('삭제 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
  Set_Grid;

  fnSGLocate(SG_Main,'0',IntToStr(iSeqno)); // UPitLib
end;

procedure TMainForm.Bt_PreViewClick(Sender: TObject);
begin
  if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                     // UPitLib
  Application.Processmessages;

  if fnGetPrintData then
    begin
      if TOnFocusButton(Sender).Tag = 1 then
          PreviewForm.PeQuickRepPrn1.preview
      else
          PreviewForm.PeQuickRepPrn1.Print;
    end;
end;

//=============================================================================//
// Form 관련 Event...
//=============================================================================//
procedure TMainForm.FormCreate(Sender: TObject);
begin
  START := True;
  EempFind := True;

  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
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

end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  sTemp : String;
  emptype : String;
begin
  if START = false then Exit;
  START := False;
  SF_Main.Refresh;

  fzInitialMainFrom;

  Pempno   := Hinsa_Param(CmdLine, 1);
  Pkorname := Hinsa_Param(CmdLine, 2);
  Password := Hinsa_Param(CmdLine, 3);
  Ppermission := copy(Hinsa_Param(CmdLine,7),1,1);

  Wempno   := Pempno;
  Wkorname := Pkorname;
  Aempno   := Pempno;   //사번기억 SHM
  LastToDate := '';
  LastRate   := '';

(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 추가.. 안효상M
  //2016.03.02.hjku.. 정규직만 등록 가능하도록 막음.. 이명노M 요청
  if (Pempno[1] in ['P','Q','J','Y']) then
  begin
      MessageDlg('직무경력 등록 대상이 아닙니다.'+#13#10+
                 '프로그램을 종료합니다.',mtInformation, [mbOk],0);
      Application.Terminate;
      exit;
  end;
*)
  emptype := '';
  TDS1.Close;
  TDS1.ServiceName := 'HINSA_select';
  TDS1.Sql.Text    := 'SELECT decode(substr('''+Pempno+''',1,1),''D'',''D'',FINDHIRE('''+Pempno+''')), ''Value2'', ''value3'','+
                      '       ''Value4'', ''Field5''                           '+
                      '  from dual                                             ';
  TDS1.ClearFieldInfo;
  TDS1.AddField('Value1' , ftString, 100);
  TDS1.AddField('Value2' , ftString, 100);
  TDS1.AddField('Value3' , ftString, 100);
  TDS1.AddField('Value4' , ftString, 100);
  TDS1.AddField('field5' , ftString, 100);
  //memo1.text := tds1.sql.text;
  TDS1.Open;
  emptype := TDS1.FieldByName('Value1').AsString;

  //2016.03.02.hjku.. 정규직만 등록 가능하도록 막음.. 이명노M 요청
  if (emptype[1] in ['P','Q','J','Y']) then
  begin
      MessageDlg('직무경력 등록 대상이 아닙니다.'+#13#10+
                 '프로그램을 종료합니다.',mtInformation, [mbOk],0);
      Application.Terminate;
      exit;
  end;

  if fnSetVariable(0) = False then System.Exit;
  if fnSetVariable(1) = False then System.Exit;  // 등록가능 fr~to
  if fnSetVariable(2) = False then System.Exit;  // 현재일

  if  (trim(Pjobpayra) = 'C51') or  (trim(Ppayrayn) = 'Y') or (trim(Pjobpayrayn) = 'Y') then Lgubun := 2 // 부서장
  else                                                                                       Lgubun := 1;
  TDS1.Close;
  TDS1.ServiceName := 'HINSA_select';
  TDS1.Sql.Text    := 'SELECT Value1, Value2, value3,                        '+
                      '       Value4, ''Field5''                             '+
                      '  from pimvari                                        '+
                      ' where gubun  = ''00''                                '+
                      '   and sgubun = ''0001''                              ';
  TDS1.ClearFieldInfo;
  TDS1.AddField('Value1' , ftString, 100);
  TDS1.AddField('Value2' , ftString, 100);
  TDS1.AddField('Value3' , ftString, 100);
  TDS1.AddField('Value4' , ftString, 100);
  TDS1.AddField('field5' , ftString, 100);
  TDS1.Open;
  payrachdate := TDS1.FieldByName('Value3').AsString;

  TDS1.Close;
  TDS1.ServiceName := 'HINSA_select';
  TDS1.Sql.Text    := 'SELECT Value1 workemp1, Value2 workemp2,                  '+
                      '       Value3 workemp3, Value4 workemp4, Value5 workemp5  '+
                      '  from pishrvari                                          '+
                      ' where gubun  = ''00''                                    '+
                      '   and sgubun = ''0001''                                  ';
  TDS1.ClearFieldInfo;
  TDS1.AddField('Workemp1' , ftString, 100);
  TDS1.AddField('Workemp2' , ftString, 100);
  TDS1.AddField('Workemp3' , ftString, 100);
  TDS1.AddField('Workemp4' , ftString, 100);
  TDS1.AddField('Workemp5' , ftString, 100);
  TDS1.Open;
  WorkEmp1 := TDS1.FieldByName('workemp1').AsString;
  WorkEmp2 := TDS1.FieldByName('workemp2').AsString;
  WorkEmp3 := TDS1.FieldByName('workemp3').AsString;
  WorkEmp4 := TDS1.FieldByName('workemp4').AsString;
  WorkEmp5 := TDS1.FieldByName('workemp5').AsString;
  if   (Pempno = WorkEmp1)  or (Pempno = WorkEmp2)       or
       (Pempno = WorkEmp3)  or (Pempno = WorkEmp4)       or
       (Pempno = WorkEmp5)  or (copy(Pempno,1,1) = 'D')  then
  begin
    Ed_empno.ReadOnly := false;
    Lgubun := 0;                // 박준민 과장 요청(2008.2.27)
  end;

  Label1.Caption := '▶등록기간:' +
                    Copy(PfrBasedate,1,4)+'.'+copy(PfrBasedate,5,2)+'.'+copy(PfrBasedate,7,2)+
                    ' ~ ' +
                    copy(PtoBasedate,1,4)+'.'+copy(PtoBasedate,5,2)+'.'+copy(PtoBasedate,7,2);
  Application.ProcessMessages;

  pOrgDeptList := fnOrgDeptList(pEmpno);

  ///유효성 병특관련 결재자 하드코딩...
  if pEmpno ='M091' then  pMilitary  := '''0363'',''0043'',''0786'',''1572'',''1708'',''1863'''
  else                    pMilitary  := '''''';

  Ed_empno.SetFocus;
  Ed_empno.Text          := pEmpno;
  L_korname.ValueCaption := pKorname;

  // 부서및 겸직부서조회
  if      Lgubun = 2 then  Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0)
  else if Lgubun = 1 then  Bt_SrhClick(Sender);

  //2004.12.22 유효성 추가 --> 사장 사번 읽어오기
  TDS1.Close;
  TDS1.ServiceName := 'PIT1030A_SEL1';
  TDS1.Sql.Text    := 'SELECT PRESEMPNO FROM PKCPBAS';
  TDS1.ClearFieldInfo;
  TDS1.AddField('PRESEMPNO', ftString, 300);
  TDS1.Open;
  PresEmp := TDS1.FieldByName('PRESEMPNO').AsString;

  Bt_SrhClick(Sender);
  SG_Main.SetFocus;
end;


function TMainForm.fnGetMainDataSet(mEmpno: String): Boolean;
var
  sSql: String;
begin
  Result := False;

  sSQL := Format(
      'SELECT  '+
      ' nvl(        a.empno         ,'' '') EMPNO        ,'+
      ' nvl(        a.korname       ,'' '') KORNAME      ,'+
      ' nvl(to_char(a.dutyno       ),''0'') DUTYNO       ,'+
      ' nvl(        a.JobField      ,'' '') JOBFIELD     ,'+
      ' nvl(        c.jobfieldname  ,'' '') JOBFIELDNAME ,'+
      ' nvl(        a.dutykind      ,'' '') DUTYKIND     ,'+
      ' nvl(        d.dutykindname  ,'' '') DUTYKINDNAME ,'+
      ' nvl(        a.duty          ,'' '') DUTY         ,'+
      ' nvl(DECODE(E.USEYN,''N'',''(舊)''||e.dutyname ,e.dutyname), '' '') DUTYNAME , '+
      //' nvl(        e.dutyname      ,'' '') DUTYNAME     ,'+
      ' nvl(        a.paycl         ,'' '') PAYCL        ,'+
      ' nvl(        b.payclname     ,'' '') PAYCLNAME    ,'+
      ' nvl(        g.dutytext      ,'' '') DUTYTEXT     ,'+
      ' nvl(        a.frdutydate    ,'' '') FRDUTYDATE   ,'+
      ' nvl(        a.todutydate    ,'' '') TODUTYDATE   ,'+
      ' nvl(to_char(a.dutyyy       ),''0'') DUTYYY       ,'+
      ' nvl(to_char(a.dutymm       ),''0'') DUTYMM       ,'+
      ' nvl(to_char(a.dutytermrate ),''0'') DUTYTERMRATE ,'+
      ' nvl(        a.dutylevel     ,'' '') DUTYLEVEL    ,'+
      ' nvl(        f.dutylevelname ,'' '') DUTYLEVELNAME '+
      'FROM  pishrmas a,                     '+
      '      (select codeno, codename payclname    from pyccode where codeid = ''I112'') b,  '+ // 직급
      '      (select codeno, codename jobfieldname from pyccode where codeid = ''I116'') c,  '+ // 업무분야
      '      pishrdukind d,                  '+
      '      pishrduty e,                    '+
      '      pishrlevel f,                   '+
      '      (select 1 gubun, empno, dutyno, dutytext    dutytext, null subdutyno from pishrmas     '+
      '       union all                                                                '+
      '       select 2 gubun, empno, dutyno, subdutytext dutytext, subdutyno      from pishrsub) g  '+
      'WHERE  a.empno = ''%s''               '+
      '  and  a.empno = g.empno and a.dutyno = g.dutyno '+
      '  and  a.paycl = b.codeno             '+
      '  and  a.JobField = c.codeno          '+
      '  and  a.JobField = d.JobField        '+
      '  and  a.dutykind = d.dutykind        '+
      '  and  a.JobField = e.JobField        '+
      '  and  a.dutykind = e.dutykind        '+
      '  and  a.duty = e.duty                '+
      '  and  a.dutylevel = f.dutylevel(+)   '+
      'order by a.frdutydate, a.dutytermrate desc, a.JobField, a.dutykind, a.dutyno, g.gubun, g.subdutyno ',[mEmpno]);


  With TCDS do
  begin
      Close;
      ClearFieldInfo;
      AddField('EMPNO'        , ftString,  4  );
      AddField('KORNAME'      , ftString,  12 );
      AddField('DUTYNO'       , ftString,  6  );
      AddField('JOBFIELD'     , ftString,  2  );
      AddField('JOBFIELDNAME' , ftString,  20 );
      AddField('DUTYKIND'     , ftString,  10 );
      AddField('DUTYKINDNAME' , ftString,  30 );
      AddField('DUTY'         , ftString,  10 );
      AddField('DUTYNAME'     , ftString,  30 );
      AddField('PAYCL'        , ftString,  3  );
      AddField('PAYCLNAME'    , ftString,  20 );
      AddField('DUTYTEXT'     , ftString,  80 );
      AddField('FRDUTYDATE'   , ftString,  8  );
      AddField('TODUTYDATE'   , ftString,  8  );
      AddField('DUTYYY'       , ftString,  40 );
      AddField('DUTYMM'       , ftString,  40 );
      AddField('DUTYTERMRATE' , ftString,  40 );
      AddField('DUTYLEVEL'    , ftString,  2  );
      AddField('DUTYLEVELNAME', ftString,  20 );
      Sql.Clear;
      Sql.Text := sSQL;
      ServiceName := 'PIT1030A_SEL2';
      Open;
  end;

  Result := True;
end;

procedure TMainForm.SET_GRID;
var
  sSQL, sTemp, GetSubText: String;
  iInd, jInd, iTempYYMM : Integer;
  sTempDate, sTempDutyno: String;
begin
  With TCDS do
    begin
      if fnGetMainDataSet(pEmpno) = False then System.Exit;
      SendMessage(SG_Main.Handle, WM_SETREDRAW, 0, 0);

      fzSGInitialRow(SG_Main); // UpitLib

      sTempDate   := '';
      sTempDutyno := '';

      L_jobfield.Font.Color      := clWhite; //마지막 직군, 직종을 찍어준다
      L_dutykind.ValueFont.Color := clWhite;

      iInd := 0;
      SG_Main.ColWidths[m_DUTYTEXT] := iWidthOfDutyText;
      SG_Main.ColWidths[m_PAYCLNM ] := iWidthOfPaycl ;
      While Not Eof do
      begin
          // 동일 일자면 동일 행 다른면 다른행
          if sTempDate <> FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
          begin
              Inc(iInd);
              if iInd > 1 then
                  SG_Main.RowCount := SG_Main.RowCount + 1;

              SG_Main.Cells[m_SEQNO       ,iInd] := IntToStr(iInd);
              SG_Main.Cells[m_EMPNO       ,iInd] := FieldByName('EMPNO').AsString;
              SG_Main.Cells[m_KORNAME     ,iInd] := FieldByName('KORNAME').AsString;
              SG_Main.Cells[m_FRDUTYDATE  ,iInd] := FieldByName('FRDUTYDATE').AsString;
              SG_Main.Cells[m_TODUTYDATE  ,iInd] := FieldByName('TODUTYDATE').AsString;

              if Trim(FieldByName('TODUTYDATE').AsString) = '' then
                  SG_Main.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                        Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                        '현재'
              else
                  SG_Main.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                        Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                        Copy(FieldByName('TODUTYDATE').AsString,1,4) + '/' +
                                                        Copy(FieldByName('TODUTYDATE').AsString,5,2) ;

              SG_Main.Cells[m_DUTYYY      ,iInd] := FieldByName('DUTYYY').AsString;
              SG_Main.Cells[m_DUTYMM      ,iInd] := FieldByName('DUTYMM').AsString;

              fnSetVariable(2);
              if FieldByName('TODUTYDATE').AsString = '' then
                  iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, Copy(pSysDate,1,6))+1
              else
                  iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, FieldByName('TODUTYDATE').AsString)+1;
              SG_Main.Cells[m_DUTYYYMM    ,iInd] := IntToStr(iTempYYMM div 12)+'년'+
                                                    IntToStr(iTempYYMM mod 12)+'개월';

              SG_Main.Cells[m_DUTYNO      ,iInd] := FieldByName('DUTYNO').AsString;
              SG_Main.Cells[m_JOBFIELD    ,iInd] := FieldByName('JobField').AsString;
              SG_Main.Cells[m_JOBFIELDNM  ,iInd] := FieldByName('JobFieldNAME').AsString;
              SG_Main.Cells[m_DUTYKIND    ,iInd] := FieldByName('DUTYKIND').AsString;
              SG_Main.Cells[m_DUTYKINDNM  ,iInd] := FieldByName('DUTYKINDNAME').AsString;
              SG_Main.Cells[m_DUTY        ,iInd] := FieldByName('DUTY').AsString;
              SG_Main.Cells[m_DUTYNM      ,iInd] := FieldByName('DUTYNAME').AsString;
              SG_Main.Cells[m_DUTYTERMRATE,iInd] := FieldByName('DUTYTERMRATE').AsString;
              SG_Main.Cells[m_DUTYLEVEL   ,iInd] := FieldByName('DUTYLEVEL').AsString;
              SG_Main.Cells[m_DUTYLEVELNM ,iInd] := FieldByName('DUTYLEVELNAME').AsString;
              SG_Main.Cells[m_PAYCL       ,iInd] := FieldByName('PAYCL').AsString;
              SG_Main.Cells[m_PAYCLNM     ,iInd] := FieldByName('PAYCLNAME').AsString;
              SG_Main.Cells[m_DUTYTEXT    ,iInd] := '⊙ ' + FieldByName('DUTYTEXT').AsString;

              L_jobfield.Caption      := FieldByName('JOBFIELDNAME').AsString; //마지막 직군, 직종을 찍어준다
              L_dutykind.ValueCaption := FieldByName('DUTYKINDNAME').AsString;
              L_duty.ValueCaption     := FieldByName('DUTYNAME').AsString;     //visible = false, for 최종확인
              L_jobfield.Hint         := FieldByName('JOBFIELD').AsString;
              L_dutykind.Hint         := FieldByName('DUTYKIND').AsString;
              L_duty.Hint             := FieldByName('DUTY').AsString;
              LastToDate              := Trim(FieldByName('TODUTYDATE').AsString);
              LastFrDate              := Trim(FieldByName('FRDUTYDATE').AsString);
              LastRate                := FieldByName('DUTYTERMRATE').AsString;

              giHeightRow := 1;
          end
          // sTempDate = FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
          else if sTempDutyno <> FieldByName('DUTYNO').AsString then
          begin
              //SG_Main.Cells[p_SEQNO       ,iInd] := IntToStr(iInd);
              SG_Main.Cells[m_EMPNO       ,iInd] := SG_Main.Cells[m_EMPNO       ,iInd] + #13;
              SG_Main.Cells[m_KORNAME     ,iInd] := SG_Main.Cells[m_KORNAME     ,iInd] + #13;
              SG_Main.Cells[m_FRDUTYDATE  ,iInd] := SG_Main.Cells[m_FRDUTYDATE  ,iInd] + #13;
              SG_Main.Cells[m_TODUTYDATE  ,iInd] := SG_Main.Cells[m_TODUTYDATE  ,iInd] + #13;
              SG_Main.Cells[m_DUTYDATE    ,iInd] := SG_Main.Cells[m_DUTYDATE    ,iInd] + #13;
              SG_Main.Cells[m_DUTYYY      ,iInd] := SG_Main.Cells[m_DUTYYY      ,iInd] + #13;
              SG_Main.Cells[m_DUTYMM      ,iInd] := SG_Main.Cells[m_DUTYMM      ,iInd] + #13;
              SG_Main.Cells[m_DUTYYYMM    ,iInd] := SG_Main.Cells[m_DUTYYYMM    ,iInd] + #13;
              SG_Main.Cells[m_DUTYNO      ,iInd] := SG_Main.Cells[m_DUTYNO      ,iInd] + #13 + FieldByName('DUTYNO').AsString;
              SG_Main.Cells[m_JOBFIELD    ,iInd] := SG_Main.Cells[m_JOBFIELD    ,iInd] + #13 + FieldByName('JobField').AsString;
              SG_Main.Cells[m_JOBFIELDNM  ,iInd] := SG_Main.Cells[m_JOBFIELDNM  ,iInd] + #13 + FieldByName('JobFieldNAME').AsString;
              SG_Main.Cells[m_DUTYKIND    ,iInd] := SG_Main.Cells[m_DUTYKIND    ,iInd] + #13 + FieldByName('DUTYKIND').AsString;
              SG_Main.Cells[m_DUTYKINDNM  ,iInd] := SG_Main.Cells[m_DUTYKINDNM  ,iInd] + #13 + FieldByName('DUTYKINDNAME').AsString;
              SG_Main.Cells[m_DUTY        ,iInd] := SG_Main.Cells[m_DUTY        ,iInd] + #13 + FieldByName('DUTY').AsString;
              SG_Main.Cells[m_DUTYNM      ,iInd] := SG_Main.Cells[m_DUTYNM      ,iInd] + #13 + FieldByName('DUTYNAME').AsString;
              SG_Main.Cells[m_DUTYTERMRATE,iInd] := SG_Main.Cells[m_DUTYTERMRATE,iInd] + #13 + FieldByName('DUTYTERMRATE').AsString;
              SG_Main.Cells[m_DUTYLEVEL   ,iInd] := SG_Main.Cells[m_DUTYLEVEL   ,iInd] + #13 + FieldByName('DUTYLEVEL').AsString;
              SG_Main.Cells[m_DUTYLEVELNM ,iInd] := SG_Main.Cells[m_DUTYLEVELNM ,iInd] + #13 + FieldByName('DUTYLEVELNAME').AsString;
              SG_Main.Cells[m_PAYCL       ,iInd] := SG_Main.Cells[m_PAYCL       ,iInd] + #13 + FieldByName('PAYCL').AsString;
              SG_Main.Cells[m_PAYCLNM     ,iInd] := SG_Main.Cells[m_PAYCLNM     ,iInd] + #13 + FieldByName('PAYCLNAME').AsString;
              SG_Main.Cells[m_DUTYTEXT    ,iInd] := SG_Main.Cells[m_DUTYTEXT    ,iInd] + #13 + '⊙ '+FieldByName('DUTYTEXT').AsString ;
              Inc(giHeightRow);
          end
          // sTempDate = FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
          // sTempDutyno = FieldByName('DUTYNO').AsString then
          else
          begin
              //SG_Main.Cells[p_SEQNO       ,iInd] := IntToStr(iInd);
              SG_Main.Cells[m_EMPNO       ,iInd] := SG_Main.Cells[m_EMPNO       ,iInd] + #13;
              SG_Main.Cells[m_KORNAME     ,iInd] := SG_Main.Cells[m_KORNAME     ,iInd] + #13;
              SG_Main.Cells[m_FRDUTYDATE  ,iInd] := SG_Main.Cells[m_FRDUTYDATE  ,iInd] + #13;
              SG_Main.Cells[m_TODUTYDATE  ,iInd] := SG_Main.Cells[m_TODUTYDATE  ,iInd] + #13;
              SG_Main.Cells[m_DUTYDATE    ,iInd] := SG_Main.Cells[m_DUTYDATE    ,iInd] + #13;
              SG_Main.Cells[m_DUTYYY      ,iInd] := SG_Main.Cells[m_DUTYYY      ,iInd] + #13;
              SG_Main.Cells[m_DUTYMM      ,iInd] := SG_Main.Cells[m_DUTYMM      ,iInd] + #13;
              SG_Main.Cells[m_DUTYYYMM    ,iInd] := SG_Main.Cells[m_DUTYYYMM    ,iInd] + #13;
              SG_Main.Cells[m_DUTYNO      ,iInd] := SG_Main.Cells[m_DUTYNO      ,iInd] + #13;
              SG_Main.Cells[m_JOBFIELD    ,iInd] := SG_Main.Cells[m_JOBFIELD    ,iInd] + #13;
              SG_Main.Cells[m_JOBFIELDNM  ,iInd] := SG_Main.Cells[m_JOBFIELDNM  ,iInd] + #13;
              SG_Main.Cells[m_DUTYKIND    ,iInd] := SG_Main.Cells[m_DUTYKIND    ,iInd] + #13;
              SG_Main.Cells[m_DUTYKINDNM  ,iInd] := SG_Main.Cells[m_DUTYKINDNM  ,iInd] + #13;
              SG_Main.Cells[m_DUTY        ,iInd] := SG_Main.Cells[m_DUTY        ,iInd] + #13;
              SG_Main.Cells[m_DUTYNM      ,iInd] := SG_Main.Cells[m_DUTYNM      ,iInd] + #13;
              SG_Main.Cells[m_DUTYTERMRATE,iInd] := SG_Main.Cells[m_DUTYTERMRATE,iInd] + #13;
              SG_Main.Cells[m_DUTYLEVEL   ,iInd] := SG_Main.Cells[m_DUTYLEVEL   ,iInd] + #13;
              SG_Main.Cells[m_DUTYLEVELNM ,iInd] := SG_Main.Cells[m_DUTYLEVELNM ,iInd] + #13;
              SG_Main.Cells[m_PAYCL       ,iInd] := SG_Main.Cells[m_PAYCL       ,iInd] + #13;
              SG_Main.Cells[m_PAYCLNM     ,iInd] := SG_Main.Cells[m_PAYCLNM     ,iInd] + #13;
              SG_Main.Cells[m_DUTYTEXT    ,iInd] := SG_Main.Cells[m_DUTYTEXT    ,iInd] + #13 + ' - '+FieldByName('DUTYTEXT').AsString ;

              Inc(giHeightRow);
          end;

          if SG_Main.Canvas.TextWidth(FieldByName('DUTYTEXT').AsString) > iWidthOfDutyText - 30 then
              SG_Main.ColWidths[m_DUTYTEXT    ] := 500; // iWidthOfDutyText := 300 약 58 Byte

          SG_Main.Cells[p_MODE        ,iInd] := 'U';
          SG_Main.RowHeights[iInd] := 20 + (giHeightRow * 12);
          sTempDate   := FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString;
          sTempDutyno := FieldByName('DUTYNO').AsString;

          Next;
      end;

      if TCDS.RecordCount > 0 then
        sg_main.Row := iInd;  //최근자료로 focus 가기 2002.04.03 shm

      pseqno := iInd;
      Close;

      SendMessage(SG_Main.Handle, WM_SETREDRAW, 1, 0);
      SG_Main.Refresh;

    end; // -- End of With

  sSQL := Format('SELECT nvl( spectext, '' '') FROM pishrspec '+
                 'WHERE empno = ''%s''                        ', [Pempno]);
  TCsel.Close;
  TCsel.ClearFieldInfo;
  TCsel.Addfield('CNT', ftstring, 300);
  TCsel.Sql.Clear;
  TCsel.Sql.text := sSQL ;
  TCsel.ServiceName := 'PIT1030A_SEL1';
  TCsel.Open;

  SpecText.Text := Trim(TCsel.FieldByName('CNT').AsString);
  SpecText.Modified := False;

  L_jobfield.Font.Color      := clBlack; //마지막 직군, 직종을 찍어준다
  L_dutykind.ValueFont.Color := clBlack;
  L_jobfield.Refresh;
  L_dutykind.Refresh;

  TCsel.Close;
end;

procedure TMainForm.SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
  with SG_Main.Canvas do
  begin
      if ARow = 0 then
          Font.Style := [fsBold]
      else
          Font.Style := [];

      FillRect(Rect);
      Rect.Top   := Rect.Top + 4;

      if (ACol in [m_SEQNO, m_DUTYYYMM, m_DUTYTERMRATE, m_DUTYLEVELNM, m_PAYCLNM]) or (ARow = 0) then
          Loc := DT_CENTER or DT_WORDBREAK
      else
          Loc := DT_LEFT or DT_WORDBREAK;

      DrawText(Handle, PChar(SG_Main.Cells[ACol, ARow]), -1, Rect, Loc);
  end;
end;

function TMainForm.fnOrgDeptList(mEmpno: String): String;
var
  sOrgDeptList, sSql,ssql1,ssql2: String;
begin
  Result := '';
  sOrgDeptList := '('''+pOrgnum+''','''+pDeptcode+''')'+','; //showmessage(Ppayra);

  sSQL :=    'SELECT NVL(empno        ,'' '') aa_empno,      '+
             '       NVL(korname      ,'' '') aa_korname,    '+
             '       NVL(anfrdate     ,'' '') aa_anfrdate,   '+
             '       NVL(antodate     ,'' '') aa_antodate,   '+
             '       NVL(orgnum       ,'' '') aa_orgnum,     '+
             '       NVL(deptcode     ,'' '') aa_deptcode,   '+
             '       NVL(addeptcode   ,'' '') aa_addeptcode, '+
             '       NVL(adpayra      ,'' '') aa_adpayra     '+
             ' FROM PIHANNO                   '+
      Format(' WHERE EMPNO = ''%s''           ',[mEmpno])+
             '   AND ANUPDYN = ''Y''          '+
             '   AND ADDEPTCODE IS NOT NULL   '+
             '   AND ANTODATE IS NOT NULL     '+
             '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN ANFRDATE AND NVL(ANTODATE,TO_CHAR(SYSDATE,''YYYYMMDD''))   '+
             '   AND ANCODE = ''233''         '+
             ' UNION                          '+
             'SELECT NVL(a_empno      ,'' '') aa_empno,      '+
             '       NVL(a_korname    ,'' '') aa_korname,    '+
             '       NVL(a_anfrdate   ,'' '') aa_anfrdate,   '+
             '       NVL(b_anfrdate   ,'' '') aa_antodate,   '+
             '       NVL(a_orgnum     ,'' '') aa_orgnum,     '+
             '       NVL(a_deptcode   ,'' '') aa_deptcode,   '+
             '       NVL(a_addeptcode ,'' '') aa_addeptcode, '+
             '       NVL(a_adpayra    ,'' '') aa_adpayra     '+
             ' FROM                                                            '+
             '     ( SELECT EMPNO      a_empno,        KORNAME   a_korname,    '+
             '              ANFRDATE   a_anfrdate,     ANTODATE  a_antodate,   '+
             '              ORGNUM     a_orgnum,       DEPTCODE  a_deptcode,   ';
             // 팀장이면 소속부서, 겸직부서 모두 팀장이 아니면 겸직부서만
      {if Ppayra = 'C11' then
          ssql := ssql+ '              ORGNUM     a_orgnum,       DEPTCODE  a_deptcode,   '
      else
          ssql := ssql+ '              ORGNUM     a_orgnum,       ''''  a_deptcode,   ';
      }
      ssql := ssql +
             '              ADDEPTCODE a_addeptcode,   ADPAYRA   a_adpayra     '+
             '       FROM PIHANNO                                              '+
      Format('       WHERE EMPNO = ''%s''                                      ',[mEmpno])+
             '        AND ANUPDYN = ''Y''                                      '+
             '        AND ADDEPTCODE IS NOT NULL                               '+
             '        AND ANTODATE IS NULL                                     '+
             '        AND ANCODE = ''233'' ),                                  '+
             '     ( SELECT EMPNO      b_empno,        KORNAME   b_korname,    '+
             '              ANFRDATE   b_anfrdate,     ANTODATE  b_antodate,   '+
             '              ORGNUM     b_orgnum,       DEPTCODE  b_deptcode,   '+
             '              ADDEPTCODE b_addeptcode,   ADPAYRA   b_adpayra     '+
             '      FROM PIHANNO                                               '+
      Format('      WHERE EMPNO = ''%s''                                       ',[mEmpno])+
             '        AND ANUPDYN = ''Y''                                      '+
             '        AND ADDEPTCODE IS NOT NULL                               '+
             '        AND ANTODATE IS NULL                                     '+
             '        AND ANCODE = ''238'' )                                   '+
             ' WHERE a_empno  = b_empno (+)                                    '+
             '   AND a_orgnum = b_orgnum (+) AND a_addeptcode = b_addeptcode (+) '+
             '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN a_anfrdate AND NVL(b_anfrdate,TO_CHAR(SYSDATE,''YYYYMMDD'')) '
             ;


  With TCDS do
    begin
      Close;
      ClearFieldInfo;
      AddField('AA_EMPNO'     , ftString,  4 );
      AddField('AA_KORNAME'   , ftString,  12);
      AddField('AA_ANFRDATE'  , ftString,  8 );
      AddField('AA_ANTODATE'  , ftString,  8 );
      AddField('AA_ORGNUM'    , ftString,  3 );
      AddField('AA_DEPTCODE'  , ftString,  6 );
      AddField('AA_ADDEPTCODE', ftString,  6 );
      AddField('AA_ADPAYRA'   , ftString,  3 );
      Sql.Clear;
      Sql.Text := sSQL; 
      Servicename := 'PIT1030A_SEL3';
      Open;

      while Not EOF do
        begin
          sOrgDeptList := sOrgDeptList +
                       '('''+FieldByName('AA_ORGNUM').AsString+''','''+FieldByName('AA_DEPTCODE').AsString+''')'+',';
          if trim(FieldByName('AA_DEPTCODE').AsString) <> '' then
              sOrgDeptList := sOrgDeptList +
                           '('''+FieldByName('AA_ORGNUM').AsString+''','''+FieldByName('AA_ADDEPTCODE').AsString+''')'+',';
          Next;
        end;
      // 마지막 ","제거
      if (length(sOrgDeptList) > 0) and (sOrgDeptList[length(sOrgDeptList)] = ',') then
          sOrgDeptList[length(sOrgDeptList)] := ' '
      else
          sOrgDeptList := '(''0'',''0'')'; // 의미없는 값
    end;

  Result := sOrgDeptList;
  //showmessage(Result);
end;

function TMainForm.TCsel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('CNT').AsString;
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

function TMainForm.fnSetVariable(mGubun: Integer): Boolean;
var
  sTemp: String;
begin
  Result := False;

  case mGubun of
    0 :
        sTemp:= Format(
(*2017.02.20.hjku.. 부서명추가.. 김진호M 요청
          'SELECT  ' +
          ' nvl(  korname  ,'' '') || '';'' || '+
          ' nvl(  jobpayra ,'' '') || '';'' || '+
          ' nvl(  jobgun   ,'' '') || '';'' || '+
          ' nvl(  orgnum   ,'' '') || '';'' || '+
          ' nvl(  deptcode ,'' '') || '';'' || '+
          ' nvl(  payrayn  ,'' '') || '';'' || '+     //  jobpayrayn
          ' nvl(  paycl    ,'' '') || '';'' || '+
          ' nvl(jobpayrayn ,'' '')             '+                                   //위 명단중 0695 제외 M사번 퇴임/0143,0491 일반팀장 겸직은 0695만
          ' FROM pimpmas           ' +
          ' WHERE empno = ''%s''   ' , [Pempno]);
*)
          'SELECT  ' +
          ' nvl(  korname  ,'' '') || '';'' || '+ #13#10 +
          ' nvl(  jobpayra ,'' '') || '';'' || '+ #13#10 +
          ' nvl(  jobgun   ,'' '') || '';'' || '+ #13#10 +
          ' nvl(  a.orgnum   ,'' '') || '';'' || '+ #13#10 +
          ' nvl(  a.deptcode ,'' '') || '';'' || '+ #13#10 +
          ' nvl(  payrayn  ,'' '') || '';'' || '+ #13#10 +     //  jobpayrayn
          ' nvl(  paycl    ,'' '') || '';'' || '+ #13#10 +
          ' nvl(jobpayrayn ,'' '') || '';'' || '+ #13#10 +                                   //위 명단중 0695 제외 M사번 퇴임/0143,0491 일반팀장 겸직은 0695만
          ' nvl(b.deptname ,'' '')             '+ #13#10 +
          ' FROM pimpmas a, pycdept b          '+ #13#10 +
          ' WHERE empno      = ''%s''          '+ #13#10 +
          '   and a.orgnum   = b.orgnum        '+ #13#10 +
          '   and a.deptcode = b.deptcode      ' , [Pempno]);
   1:
       sTemp:= Format(
          'SELECT  ' +
          ' nvl(  value1   ,'' '') || '';'' || '+
          ' nvl(  value2   ,'' '')             '+
          ' FROM pishrvari         ' +
          ' WHERE gubun = ''%s'' AND sgubun = ''%s'' ',['00','0004']); // 등록일
   2:
       sTemp:=
          'SELECT nvl(  to_char(sysdate,''YYYYMMDDHH24MISSD''),'' '') FROM dual';
   3:
       sTemp:= Format(
           'select nvl(i.korname                   ,'' '') || '';'' || '+
           '       nvl(max(nvl(r.conyn,''Z''))     ,'' '') || '';'' || '+
           '       nvl(max(nvl(r.finyn,''Z''))     ,'' '') || '';'' || '+
           '       nvl(max(r.frdutydate)           ,'' '') || '';'' || '+
           '       nvl(max(substr(r.writetime,1,4)),'' '')'+
           '  from pimpmas i, pishrmas r                  '+
           ' where i.empno = ''%s''                       '+
           '   and i.empno = r.empno(+)                   '+
           '   and r.findate(+) >= ''%s''                 '+   //해당년도 다른 자료 있어도 가능토록 Add,,, dsa2000
           ' group by i.korname                           ', [Pempno, Copy(PfrBasedate,1,6)]);
//==============================================================================//
    else
     System.Exit;
  end;

  with TCsel do
  begin
       Close;
       ClearFieldInfo;
       AddField('CNT', ftString, 300);
       Sql.Clear;
       Sql.Text := sTemp;
       ServiceName := 'PIT1030A_SEL1';
       Open;
  end;
  case mGubun of
    0 : begin
          Pkorname  := TCsel_gfd(1);
          Ppayra    := TCsel_gfd(2);
          Pjobgun   := TCsel_gfd(3);
          Porgnum   := TCsel_gfd(4);
          PDeptcode := TCsel_gfd(5);
          Ppayrayn  := TCsel_gfd(6);
          Pjobpayra    := TCsel_gfd(7);
          Pjobpayrayn  := TCsel_gfd(8);
          Pdeptname  := TCsel_gfd(9);
       end;
   1 : begin
         PfrBasedate:= TCsel_gfd(1);
         PtoBasedate:= TCsel_gfd(2);
       end;
   2:    pSysdate  := TCsel_gfd(1);
   3:  begin
         pKorName  := TCsel_gfd(1);
         pConYn    := TCsel_gfd(2);
         pFinYN    := TCsel_gfd(3);
         pFrdate   := TCsel_gfd(4);
         pTodate   := TCsel_gfd(5);
        end;
    else
    ;
  end;

  TCsel.Close;
  Result := True;
end;

procedure TMainForm.fzInitialMainFrom;
begin
  with SG_Main do
  begin
      Cols[m_SEQNO       ].Text := '연번';             ColWidths[m_SEQNO       ] := 30;
      Cols[m_FRDUTYDATE  ].Text := 'FR근무기간';       ColWidths[m_FRDUTYDATE  ] := -1;
      Cols[m_TODUTYDATE  ].Text := 'TO근무기간';       ColWidths[m_TODUTYDATE  ] := -1;
      Cols[m_DUTYDATE    ].Text := '근무기간';         ColWidths[m_DUTYDATE    ] := 60;
      Cols[m_DUTYYY      ].Text := '근무종사년수';     ColWidths[m_DUTYYY      ] := -1;
      Cols[m_DUTYMM      ].Text := '근무종사월수';     ColWidths[m_DUTYMM      ] := -1;
      Cols[m_DUTYYYMM    ].Text := '근무종사년월';     ColWidths[m_DUTYYYMM    ] := 60;
      Cols[m_EMPNO       ].Text := '사번';             ColWidths[m_EMPNO       ] := -1;
      Cols[m_KORNAME     ].Text := '성명';             ColWidths[m_KORNAME     ] := -1;
      Cols[m_DUTYNO      ].Text := '직무번호';         ColWidths[m_DUTYNO      ] := -1;
      Cols[m_JOBFIELD    ].Text := '업무분야';         ColWidths[m_JOBFIELD    ] := -1;
      Cols[m_JOBFIELDNM  ].Text := '업무분야명';       ColWidths[m_JOBFIELDNM  ] := -1;
      Cols[m_DUTYKIND    ].Text := '직종';             ColWidths[m_DUTYKIND    ] := -1;
      Cols[m_DUTYKINDNM  ].Text := '직종명';           ColWidths[m_DUTYKINDNM  ] := -1;
      Cols[m_DUTY        ].Text := '직무';             ColWidths[m_DUTY        ] := -1;
      Cols[m_DUTYNM      ].Text := '직무';             ColWidths[m_DUTYNM      ] := 140;
      Cols[m_DUTYTERMRATE].Text := '비중(%)';          ColWidths[m_DUTYTERMRATE] := 50;
      Cols[m_DUTYTEXT    ].Text := '직무내역';         ColWidths[m_DUTYTEXT    ] := iWidthOfDutyText; // iWithOfDutyText := 350 약 58 Byte
      Cols[m_DUTYLEVEL   ].Text := '직무수준';         ColWidths[m_DUTYLEVEL   ] := -1;
      Cols[m_DUTYLEVELNM ].Text := '직무수준명';       ColWidths[m_DUTYLEVELNM ] := 100;
      Cols[m_PAYCL       ].Text := '최종BAND';         ColWidths[m_PAYCL       ] := -1;
      Cols[m_PAYCLNM     ].Text := '최종BAND명';       ColWidths[m_PAYCLNM     ] := iWidthOfPaycl; // 40
      Cols[m_MODE        ].Text := '작업모드';         ColWidths[m_MODE        ] := -1;
      RowHeights[0] := 20 + (12*1);
  end;
end;


function TMainForm.fnGetPrintData: Boolean;
var
  Sql : string;
begin
  Result := False;

  if fnGetMainDataSet(pEmpno) = False then
      System.Exit;

  if TCDS.Eof then
  begin
      Messagedlg('등록된 자료가 없습니다.', mtError,[mbOK],0);
      exit;
  end;
//    PBar.Position := PBar.Max;
  Result := True;
end;

procedure TMainForm.SpecTextKeyPress(Sender: TObject; var Key: Char);
begin
  gbChanged := True;
end;

procedure TMainForm.Bt_ConfirmClick(Sender: TObject);
var
  bSaved: Boolean;
  iGubun: Integer;
begin
  SG_Main.SetFocus;
  if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                     // UPitLib

  TDS1.Close;
  TDS1.ServiceName := 'HINSA_select';

  TDS1.Sql.Text    := 'SELECT ''1'' F1, '''' F2,  '''' F3, '''' F4, '''' F5'+
                      '  from pishrmas a, pimpmas b              '+
                      ' WHERE a.empno    = '''+ED_empno.Text+''' '+
                      '   and a.empno    = b.empno                '+
                      '   and a.orgnum   = b.orgnum              '+
                      '   and a.deptcode = b.deptcode            ';

  TDS1.ClearFieldInfo;
  TDS1.AddField('F1' , ftString, 100);
  TDS1.AddField('F2' , ftString, 100);
  TDS1.AddField('F3' , ftString, 100);
  TDS1.AddField('F4' , ftString, 100);
  TDS1.AddField('F5' , ftString, 100);
  TDS1.Open;

  if TDS1.RecordCount = 0 Then
  begin
(*2017.02.24.hjku.. 수정작업없어도 결재상신 가능하도록 수정 요청.. 김진호M
    MessageDlg('수정작업 후 결재상신 하시기 바랍니다.' ,mtInformation,[mbOK],0);
    System.Exit;
*)

    TDml.Close;
    TDml.sql.clear;
    TDml.ServiceName := 'PIT1030A_DML';

    TDml.sql.add('UPDATE PISHRMAS A SET                                ');
    TDml.sql.add(' orgnum    = ''' + pOrgnum   + ''' ,                 ');
    TDml.sql.add(' deptcode  = ''' + pDeptCode + ''' ,                 ');
    TDml.sql.add(' writeemp  = ''' + wEmpno    + ''' ,                 ');
    TDml.sql.add(' writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
    TDml.sql.add(' conyn     = null ,                                  ');
    TDml.sql.add(' condate   = NULL,                                   ');
    TDml.sql.add(' conempno  = NULL,                                   ');
    TDml.sql.add(' FINDATE   = NULL,                                   ');
    TDml.sql.add(' finyn     = null                                    ');
    TDml.sql.add('WHERE empno  = '''+ED_empno.Text+'''                 ');
    TDml.sql.add('  AND dutyno = (SELECT MAX(DUTYNO) FROM PISHRMAS WHERE EMPNO = A.EMPNO)');

    if NOT TDml.Execute then
    begin
      MessageDlg('['+Bt_Confirm.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
      System.Exit;
    end;
  end;


  if Bt_Confirm.Caption = '결재상신' then // '등록자'
  begin
      iGubun := 1;
      Msg := '['+Bt_Confirm.Caption+']를 하시면 개인별 직무 경력을 편집할 수 없습니다.'#13#13+
             '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?';

      if (Ppayra <='C11') or (Ppayra = 'C15') or (Ppayra = 'C51') then //팀장이면  전결처리
        Msg := '[결재전결] 하시면 개인별 직무 경력을 편집할 수 없습니다.'#13#13+
             '[결재전결] 작업을 하시겠습니까 ?';
  end
  else
  begin
      iGubun := 2;
      Msg := '['+Bt_Confirm.Caption+'] 하시겠습니까?';
  end;
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
      System.Exit;

  SB_Help.Panels[1].Text := ' ['+Bt_Confirm.Caption+'] 작업 처리중입니다..';
  SB_Help.Perform(WM_PAINT,0,0);

  //2004.12.21 유효성 추가 시작-- 직군/직종/직무 최종확인 popup창 추가
  if Bt_Confirm.Caption = '결재상신' then
    begin
      Try
        if (LastToDate <> '')  then
          begin
            MessageDlg('최종 등록직무의 근무기간 To 값은 반드시 공란을 입력해야 합니다.'+#13+
                       '확인하시고 재상신 해 주시기 바랍니다.' ,mtError,[mbOK],0);
            System.Exit;
          end;

        TDS1.Close;
        TDml.sql.clear;        
        TDS1.ServiceName := 'PIT1030A_SEL1';
        TDS1.Sql.Text := 'SELECT to_char(sum(dutytermrate)) term_rate                           '+
                        '  FROM pishrmas                                                        '+
                        ' WHERE empno ='''+ED_empno.Text+'''                                    '+
                        '   and frdutydate = '''+LastFrDate+'''                                 ';

        TDS1.ClearFieldInfo;
        TDS1.AddField('term_rate', ftString, 300);
        TDS1.Open;

        if Strtointdef(TDS1.FieldByName('Term_Rate').AsString,0) < 100 then
          begin
            MessageDlg('동일기간내 직무비중의 합은 100% 보다 작을수 없습니다. '+#13+
                       '비중을 수정하거나, 직무를 추가하여 주시기 바랍니다. ', mtError, [mbOK], 0);
            System.Exit;
          end;

        ConForm := TConForm.Create(Self);
        ConForm.L_korname.Caption       := L_korname.ValueCaption;
        ConForm.L_jobfield.Caption      := L_jobfield.Caption;
        ConForm.L_dutykind.ValueCaption := L_dutykind.ValueCaption;
        ConForm.L_duty.ValueCaption     := L_duty.ValueCaption;
        ConForm.ConYN                   := False;
        ConForm.ShowModal;
        if not Conform.ConYN then
          System.Exit;

        //최종 직군/직종/직무를 Table에 저장
        TDml.Close;
        TDml.Sql.Text := 'DELETE FROM PISHRCURR WHERE EMPNO = '''+ED_empno.Text+'''';
        TDml.ServiceName := 'PIT1030A_DML';

        if NOT TDml.Execute then
        begin
          MessageDlg('['+Bt_Confirm.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                     '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
          System.Exit;
        end;

        TDml.Close;
        TDml.Sql.Text := // 현직무 테이블에 insert
                Format('INSERT INTO PISHRCURR' +
                       '        (EMPNO, KORNAME, JOBFIELD, DUTYKIND, DUTY, WRITEEMP, WRITETIME) '+
                       ' VALUES ( ''%s'', ''%s'',''%s'',''%s'',''%s'', ''%s'', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ) ',
                        [ED_empno.Text, L_korname.ValueCaption, L_jobfield.Hint, L_dutykind.Hint, L_duty.Hint, Wempno ]);

        TDml.ServiceName := 'PIT1030A_DML';
        if NOT TDml.Execute then
        begin
          MessageDlg('['+Bt_Confirm.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                     '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
          System.Exit;
        end;

      Finally
        ConForm.Free;
      End;
    end;

  fzSaveFinConData(bSaved, iGubun, pEmpno, ''); // 저장작업

  if (pempno = wempno) and ((Ppayra <= 'C11') or (Ppayra = 'C15') or (Ppayra = 'C51')) then   //팀장이면 전결처리
    begin
      fzSetSaveButtons(False);
      fzSetConButtons(False);
      System.Exit;
    end;

  if bSaved = False then
  begin
      MessageDlg('['+Bt_Confirm.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
      System.Exit;
  end
  else
  begin
      MessageDlg('['+Bt_Confirm.Caption+'] 작업 처리가 완료되었습니다.'
                 ,mtInformation,[mbOK],0);
  end;

  if iGubun = 1 then // '등록자'
  begin
      fzGetToMailEmp(bSaved, toMailKorname, toMailEmpno, Lgubun); //상위자 찾기...

      if not EempFind then exit; //상위자 없을시 루틴 안타도록.

      if toMailEmpno = PresEmp then
      begin
        MessageDlg('[결재상신] 작업 처리가 완료되었습니다.'+#13#13#13,mtInformation,[mbOK],0);
        System.Exit;
      end;

      if bSaved = False then
      begin
        MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                   '결재상신작업은 처리되었으므로    '+#13+
                   '상위부서장께 [직무경력 등록 확인요청] 메시지를 '+#13+
                   '[HINT]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
        System.Exit;
      end;

      //==============================================================================//
      // 메일을 보낸다.
      MessageDlg('상위부서장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      SendProgID  := 'PIT1030A';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := toMailEmpno; //'Z113';
      //2017.02.20.hjku.. 메일 발송 문구 수정.. 김진호M 요청
      //MailSubject := '[ 직무경력 등록 확인요청 ]';
      //MailBody    := '직무경력 등록을 완료했습니다.'+#13+#13+
      //               '확인해 주시기 바랍니다.      '+#13+#13+
      //               '★확인방법:종합인사정보시스템 ▶인사/인력개발 ▶직무경력 ▶개인별 직무경력 등록/결재';
      MailSubject := Pdeptname + ' ' + L_korname.ValueCaption + 'M 직무경력 등록 확인 요청의 건';
      MailBody    := '팀장님! 안녕하십니까? HR운영팀입니다.'+#13+#13+
                     L_korname.ValueCaption + 'M 가 직무경력 등록을 완료하였습니다.'+#13+#13+
                     '내용 확인 후, 승인해 주시기 바랍니다.'+#13+#13+
                     '감사합니다.'+#13+#13+#13+#13+
                     '※ 확인방법 : 종합인사 시스템 >인사 >직무경력 >개인별 직무경력 등록/결재';
      ReceiveYN   := 'N';
      //if ChkReceive.Checked then ReceiveYN := 'Y';

      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
           MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '결재상신작업은 처리되었으므로    '+#13+
                      '상위부서장께 [직무경력 등록 확인요청] 메시지를 '+#13+
                      '[HINT]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;

      //==============================================================================//
      fzSetSaveButtons(False);
      fzSetConButtons(False);
  end
  else
      Ed_empno.SetFocus;

  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.Bt_returnClick(Sender: TObject);
var
  Msg    : string;
  bSaved: Boolean;
begin
  SG_Main.SetFocus;
  if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                     // UPitLib

  Msg := '[반려] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
      System.Exit;

  SB_Help.Panels[1].Text := ' 반려 작업 처리중입니다..';
  SB_Help.Perform(WM_PAINT,0,0);

  fzSaveFinConData(bSaved, 3, pEmpno, ''); // 저장작업

  if bSaved = False then
  begin
      MessageDlg('[반려] 저장 작업중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
      System.Exit;
  end;

  // 메일을 보낸다.
  if Lgubun = 2 then
  begin
      //////////////////////////////////////////////////////////////////////////////
      SendProgID  := 'PIT1030A';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := toMailEmpno; //'Z113';
      MailSubject := '[ 직무경력 반려메일 ]';
      MailBody    := '직무경력등록을 반려했습니다. 다시 등록하여 주십시요. '+#13+#13+
                     '★확인방법:종합인사정보시스템 ▶인사/인력개발 ▶직무경력 ▶개인별 직무경력 등록/결재';
      ReceiveYN   := 'N';
      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
           MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '반려작업은 처리되었으므로    '+#13+
                      '직무경력 등록사원에게 [직무경력 반려됨] 메시지를 '+#13+
                      '직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;
      //==============================================================================//
{
      if Send_Mail('직무경력 반려메일',
                   pKorname+' '+pEmpno,
                   '직무경력등록을 반려했습니다. 다시 등록하여 주십시요.') = False then
      begin
        MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                   '반려작업은 처리되었으므로    '+#13+
                   '직무경력 등록사원에게 [직무경력 반려됨] 메시지를 '+#13+
                   '[HINT]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
        System.Exit;
      end;}
  end;
//==============================================================================//
  SB_Help.Panels[1].Text := '';
  MessageDlg('[반려] 작업 처리가 완료되었습니다.' ,mtInformation,[mbOK],0);
  Ed_empno.SetFocus;
end;

procedure TMainForm.Bt_CancelClick(Sender: TObject);
var
  Msg    : string;
  bSaved: Boolean;
begin
  SG_Main.SetFocus;
  if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                     // UPitLib

  Msg := '[결재취소] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
      System.Exit;

  SB_Help.Panels[1].Text := ' 결재쥐소 작업 처리중입니다..';
  SB_Help.Perform(WM_PAINT,0,0);

  fzSaveFinConData(bSaved, 4, pEmpno, ''); // 저장작업

  if bSaved = False then
  begin
      MessageDlg('[결재쥐소] 작업중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
      System.Exit;
  end;

  MessageDlg('[결재취소] 작업 처리가 완료되었습니다.' ,mtInformation,[mbOK],0);
  SB_Help.Panels[1].Text := '';
  Ed_empno.SetFocus;
end;

procedure TMainForm.fzGetToMailEmp(var mSaved: Boolean; var mKorname, mEmpno: String; mGubun: Integer);
var
  SQLText: String;
begin
  mSaved := False;

  case mGubun of
    //2015.03.12.hjku.. HR팀 관리자도 결재자 정보 사원과 같이 가져오도록 수정.. 팀장 확인
    //1: // 사원
    0,1: // 사원
       SQLText := Format(
                 'SELECT eempno empno, ekorname korname, '+
                 '       epayra payra                    '+
                 ' FROM pimeemp                          '+
                 ' WHERE  empno = ''%s''                 ',[MainForm.wEmpno]);
{
       SQLText := Format(
                 'SELECT empno, korname, payra           '+
                 ' FROM pimpmas                          '+
                 ' WHERE payrayn = ''Y''                 '+
                 '   AND pstate < ''80''                 '+
                 '   AND (orgnum, deptcode) IN           '+
                 '       (SELECT b.orgnum, decode(b.deptlevel,''E0'',b.extcode,b.deptcode)    '+
                 '         FROM pimpmas a, pycdept b        '+ // 나으 부서장
                 '         WHERE a.orgnum = b.orgnum       '+
                 '           and a.deptcode = b.deptcode   '+
                 '           and empno = ''%s'')         ',[MainForm.wEmpno]);
}
    2: // 부서장
       SQLText := Format(
                 'SELECT empno, korname, payra           '+
                 ' FROM pimpmas                          '+
                 ' WHERE payrayn = ''Y''                 '+
                 '   AND pstate < ''80''                 '+
                 '   AND (orgnum, deptcode) IN           '+
                 '       (SELECT d.orgnum, d.extcode     '+
                 '         FROM pimpmas i, pycdept d     '+
                 '         WHERE i.orgnum = d.orgnum     '+
                 '           AND i.deptcode = d.deptcode '+ // 나으 상급부서장
                 '           AND i.empno = ''%s'')       ',[MainForm.wEmpno]);
  end;

  With TCDS do
  begin
      Close;
      ClearFieldInfo;
      AddField('EMPNO'        , ftString,  4 );
      AddField('KORNAME'      , ftString,  12);
      AddField('PAYRA'        , ftString,  3 );
      Sql.Clear;
      Sql.Text := SQLText;
      ServiceName := 'PIT1030A_SEL4';
      Open;
      if (RecordCount > 1) then
      begin
          MessageDlg('상위직책자가 2명이상입니다.'+#13+
                     '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
          EempFind := False;
          System.Exit;
      end
      else if (RecordCount = 0)then
      begin
          // 겸직하고 있는 부서장
          if mGubun = 1 then
          begin
              SQLText := Format(
                   'SELECT empno, korname, payra                   '+
                   ' FROM pihorga                                  '+
                   ' WHERE orgym     = TO_CHAR(sysdate,''YYYYMM'') '+
                   '   AND payrayn   = ''Y''                       '+
                   '   AND adpayrayn = ''Y''                       '+
                   '   AND pstate    < ''80''                      '+
                   '   AND (orgnum, deptcode) IN                   '+
                   '       (SELECT d.orgnum, d.deptcode            '+
                   '         FROM pimpmas i, pycdept d             '+
                   '         WHERE i.orgnum = d.orgnum             '+
                   '           AND i.deptcode = d.deptcode         '+ // 나으 부서장
                   '           AND i.empno = ''%s'')               ',[MainForm.wEmpno]);

          end
          else
          begin
              SQLText := Format(
                   'SELECT empno, korname, payra                   '+
                   ' FROM pihorga                                  '+
                   ' WHERE orgym     = TO_CHAR(sysdate,''YYYYMM'') '+
                   '   AND payrayn   = ''Y''                       '+
                   '   AND adpayrayn = ''Y''                       '+
                   '   AND pstate    < ''80''                      '+
                   '   AND (orgnum, deptcode) IN                   '+
                   '       (SELECT d.orgnum, d.extcode             '+
                   '         FROM pimpmas i, pycdept d             '+
                   '         WHERE i.orgnum = d.orgnum             '+
                   '           AND i.deptcode = d.deptcode         '+ // 나으 상급부서장
                   '           AND i.empno = ''%s'')               ',[MainForm.wEmpno]);
          end;
               // edit1.text := SQLText;
          With TCDS do
          begin
              Close;
              ClearFieldInfo;
              AddField('EMPNO'        , ftString,  4 );
              AddField('KORNAME'      , ftString,  12);
              AddField('PAYRA'        , ftString,  3 );
              Sql.Clear;
              Sql.Text := SQLText;
              ServiceName :='PIT1030A_SEL4';
              Open;

              if (RecordCount = 0) then
              begin
                  MessageDlg('상위직책자가 없습니다.'+#13+
                             '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
                  EempFind := False;
                  System.Exit;
              end;
          end;
      end;

      mKorname := FieldByName('KORNAME').AsString;
      mEmpno   := FieldByName('EMPNO').AsString;
  end;

  mSaved := True;
end;

procedure TMainForm.fzSaveFinConData(var mSaved: Boolean; mGubun: Integer; mEmpno, mSayu: String);
var
  SQLText: String;
begin
    mSaved := False;

    case mGubun of
      1:  // 결재상신
        begin
          if (pempno = wempno) and ((ppayra <= 'C11') or (ppayra='C15') or (Ppayra = 'C51')) then // (팀장)결재자이면 결재완료처리까지
            SQLText := Format(
                       'UPDATE  pishrmas SET                                 '+
                       '  finyn = ''Y'',                                     '+
                       '  conyn = ''Y'',                                     '+
                       '  findate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  conempno   = ''%s'',                               '+
                       '  conkorname = ''%s'',                               '+
                       '  rejsayu  = NULL,                                   '+
                       '  writeemp = ''%s'',                                 '+
                       '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                       'WHERE empno = ''%s''                                 '+
                       '  and writetime > ''%s''                             ',
                       [MainForm.pEmpno, MainForm.wKorname, MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)])
          else  // 결재상신
            SQLText := Format(
                       'UPDATE  pishrmas SET                                 '+
                       '  finyn = ''Y'',                                     '+
                       '  conyn = NULL,                                      '+
                       //2015.03.12.hjku.. 결재일자와 결재자도 초기화 추가..
                       '  condate  = NULL,                                   '+
                       '  conempno = NULL,                                   '+
                       '  findate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  rejsayu  = NULL,                                   '+
                       '  writeemp = ''%s'',                                 '+
                       '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                       'WHERE empno = ''%s''                                 '+
                       '  and writetime > ''%s''                             ',
                       [MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)])
           // 2005.07.04
           //1. 결재상신시 현직무에 insert.
        end;
//==============================================================================//
      2: // 결재
          if (pempno = wempno) and ((Ppayra <= 'C11') or (Ppayra = 'C15') or (Ppayra = 'C51')) then // (팀장)결재자이면 상신 완료처리까지
            SQLText := Format(
                       'UPDATE  pishrmas SET                                 '+
                       '  finyn = ''Y'',                                     '+
                       '  conyn = ''Y'',                                     '+
                       '  findate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  conempno   = ''%s'',                               '+
                       '  conkorname = ''%s'',                               '+
                       '  rejsayu  = NULL,                                   '+
                       '  writeemp = ''%s'',                                 '+
                       '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                       'WHERE empno = ''%s''                                 '+
                       '  and writetime > ''%s''                             ',
                       [MainForm.pEmpno, MainForm.wKorname, MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)])
          else  // 결재
            SQLText := Format(
                       'UPDATE  pishrmas SET                                 '+
                       '  conyn = ''Y'',                                     '+
                       '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                       '  conempno   = ''%s'',                               '+
                       '  conkorname = ''%s'',                               '+
                       '  rejsayu    = NULL,                                 '+
                       '  writeemp   = ''%s'',                               '+
                       '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                       'WHERE empno = ''%s''                                 '+
                       '  and writetime > ''%s''                             ',
                       [MainForm.wEmpno, MainForm.wKorname, MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)]);
         //[2005.07.04] 2. 결재완료시 인사마스터 직종,직군 업데이트
      3: // 반려
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  finyn = ''N'',                                     '+
                   '  conyn = ''N'',                                     '+
                   '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                   '  conempno = ''%s'',                                 '+
                   '  conkorname = ''%s'',                               '+
                   '  rejsayu    = ''%s'',                               '+
                   '  writeemp   = ''%s'',                               '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 '+
                   '  and writetime > ''%s''                             ',
                   [MainForm.wEmpno, MainForm.wKorname, mSayu, MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)]);
      4: // 결재취소
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  conyn = NULL,                                      '+
                   '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                   '  conempno   = ''%s'',                               '+
                   '  conkorname = ''%s'',                               '+
                   '  rejsayu    = NULL,                                 '+
                   '  writeemp   = ''%s'',                               '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 '+
                   '  and writetime > ''%s''                             ',
                   [MainForm.wEmpno, MainForm.wKorname, MainForm.wEmpno, MainForm.pEmpno, Copy(PfrBasedate,1,4)]);
      else
      ;
    end;

    TDml.Close;
    TDml.Sql.Clear;
    TDml.Sql.Text := SqlText;
    TDml.ServiceName := 'PIT1030A_DML';

    if NOT TDml.Execute then
    begin
        MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    end;

    //1.결재상신시 팀장본인인경우,2. 결재완료시 : 인사마스터 직종,직군 업데이트    2005.07.05
    case mGubun of
      1:begin// 결재 // 2005.07.04
          if (pempno = wempno) and ((Ppayra <= 'C11') or (Ppayra = 'C15') or (Ppayra = 'C51')) then
          begin
            if  L_jobfield.Hint = '50' then     //2008.10.08 박준민 과장 요청
            begin
                  SQLText := Format(
                              'UPDATE PIMPMAS SET                                        '+
                             '       jobgun    = '''',                                  '+
                             '       jobkind   = '''',                                  '+
                             '       writeemp  = ''%s'',                                '+
                             '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                             ' WHERE empno     = ''%s''                                 ',
                             [MainForm.wEmpno,MainForm.pEmpno]);

            end
            else
            begin
                  SQLText := Format(
                             'UPDATE PIMPMAS SET                                        '+
                             '       jobgun    = ''%s'',                                '+
                             '       jobkind   = ''%s'',                                '+
                             '       writeemp  = ''%s'',                                '+
                             '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                             ' WHERE empno     = ''%s''                                 ',
                             [L_jobfield.Hint, L_dutykind.Hint, MainForm.wEmpno, MainForm.pEmpno]);
            end;
            TDml.Close;
            TDml.Sql.Clear;
            TDml.Sql.Text := SqlText;
            TDml.ServiceName := 'PIT1030A_DML';
          end;
        end;

      2:begin// 결재 // 2005.07.04
            if  L_jobfield.Hint = '50' then     //2008.10.08 박준민 과장 요청
            begin
                  SQLText := Format(
                             'UPDATE PIMPMAS SET                                        '+
                             '       jobgun    = '''',                                  '+
                             '       jobkind   = '''',                                  '+
                             '       writeemp  = ''%s'',                                '+
                             '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                             ' WHERE empno     = ''%s''                                 ',
                             [MainForm.wEmpno, MainForm.pEmpno]);

            end
            else
            begin
                  SQLText := Format(
                             'UPDATE PIMPMAS SET                                        '+
                             '       jobgun    = ''%s'',                                '+
                             '       jobkind   = ''%s'',                                '+
                             '       writeemp  = ''%s'',                                '+
                             '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                             ' WHERE empno     = ''%s''                                 ',
                             [L_jobfield.Hint, L_dutykind.Hint, MainForm.wEmpno, MainForm.pEmpno]);
            end;
            TDml.Close;
            TDml.Sql.Clear;
            TDml.Sql.Text := SqlText;
            TDml.ServiceName := 'PIT1030A_DML';
        end;
    end;

    if NOT TDml.Execute then
    begin
        MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    end;

    mSaved := True;
end;

procedure TMainForm.fzSetSaveButtons(mEabled: Boolean);
begin
  AddBtn.Enabled     := mEabled;
  if (wempno = Workemp1) or (wempno = Workemp2) or
     (wempno = Workemp3) or (wempno = Workemp4) or (wempno = Workemp5) then
     EditBtn.Enabled    := true
  else
     EditBtn.Enabled    := mEabled;
  DeleteBtn.Enabled  := mEabled;
  SpecBtn.Enabled    := mEabled;
end;

procedure TMainForm.fzSetConButtons(mEabled: Boolean);
begin
  Bt_Confirm.Enabled := mEabled; // 결재 or 결재상신
  Bt_Cancel.Enabled  := mEabled;
  Bt_return.Enabled  := mEabled;
end;

procedure TMainForm.Ed_empnoEnter(Sender: TObject);
begin
  fzSGInitialRow(SG_Main); // UpitLib
  fzSetSaveButtons(False);
  fzSetConButtons(False);

  L_jobfield.Caption := '';
  L_dutykind.ValueCaption := '';
  L_duty.ValueCaption     := '';

  SG_Main.Refresh;
end;

procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      fzSGInitialRow(SG_Main); // UpitLib
      fzSetSaveButtons(False);
      fzSetConButtons(False);

      SG_Main.Refresh;
      Bt_SrhClick(Sender);
      inherited;
      Key := #0;
    end;
end;

{
procedure TMainForm.Ed_empnoRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer;
begin
  Try
    Valuer := TPeDestValuer.Create(Self);
    Valuer.OrgDeptList := pOrgDeptList;
    Valuer.empno       := Pempno;

    if Valuer.Execute then
    begin
        Ed_empno.Text := Valuer.empno;
        Bt_SrhClick(Bt_Srh);
    end;

  Finally
    Valuer.Free;
  End;
end;
}

procedure TMainForm.Bt_SrhClick(Sender: TObject);
var
  sMsg: String;
begin
  pEmpno := Ed_empno.Text;
  fnSetVariable(3);
  L_korname.ValueCaption := pKorname;

  if   Lgubun = 1 then Ed_empno.Enabled := False
  else                 Ed_empno.Enabled := True;

  TRY    // all buttons disabled
    sMsg := '';    //등록기간에 등록하지 않으면 등록불가이다.    //은아 주석
    if (copy(pSysdate,1,8) < PfrBasedate) or (copy(pSysdate,1,8) > PtoBasedate) then // 등록 불가능
        System.Exit;

    if copy(pTodate,1,4) < copy(pSysdate,1,4) then
      begin
        pConYN := ' ';
        pFinYN := ' ';
      end;

    //if wEmpno = pEmpno then // 동일인
    if (wEmpno = pEmpno) or (Lgubun=0) then // 팀원과 관리자.  dsa2000 2014.03.21.
      begin
        Bt_Confirm.Caption := '결재상신';

        if pConYN = 'Y' then // 결재완료
        begin
            sMsg := '결재상신한 직무경력내역에 대하여 결재된 자료입니다.'#13#13+
                    '  [입력] [수정] [삭제] 하실 수 없습니다.';
            System.Exit;

        end;
        if pFinYN = 'Y' then // ☞ 확인중
        begin
            sMsg := '결재상신한 직무경력내역에 대하여 확인중입니다.'#13#13+
                    '상위 부서장 확인 후 작업 하시기 바랍니다.';
            System.Exit;
        end;
        if pFinYN = 'N' then // ☞ 반려된자료
        begin
            sMsg := '결재상신한 직무경력내역이 반려 되었습니다.'#13#13+
                    '  ';
        end;                            ;

        if (pempno = wempno) and ((Ppayra <= 'C11') or (Ppayra = 'C15') or (Ppayra = 'C51')) then   //팀장이면 전결처리
        begin                                            //2007.03.22 서혜미 추가
            Bt_Confirm.Caption := '결재';
        end;

        fzSetSaveButtons(True);
        Bt_Confirm.Enabled := True;  // 결재상신
      end
    else // wEmpno <> pEmpno then
      begin  //
        Bt_Confirm.Caption := '결재'; //주석: 결재버튼으로 바뀌는 부분
        if pConYN = 'N' then
            System.Exit
        else if pConYN = 'Y' then // 결재완료
        begin
            Bt_Cancel.Enabled := True;
            System.Exit;
        end;

        if pFinYN <> 'Y' then // 등록중          // 은아 주석
        begin
            sMsg :='아직 사원이 직무경력내역 등록중입니다.'#13#13+
                   '등록완료 후 작업 하시기 바랍니다.';
            fzSetConButtons(False);
            System.Exit;
        end;
        fzSetConButtons(True);
      end;

  FINALLY
    Set_Grid;
    if (SG_Main.Cells[0,SG_Main.FixedRows] <> '') and  (sMsg <> '') then
      MessageDlg(sMsg,mtInformation,[mbOK],0);
  END;
end;

procedure TMainForm.SG_MainSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
end;
//=============================================================================//

procedure TMainForm.Ed_empnoInitPopup(Sender: TObject);
begin  // 돋보기 클릭시
  Fm_DestValue.Edit        := TOnWinPopupEdit(Sender);
  Fm_DestValue.OrgDeptList := pOrgDeptList;
  Fm_DestValue.empno       := Pempno;
  Fm_DestValue.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_DestValue ;
end;

procedure TMainForm.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_DestValue.empno <> '' then
    begin
      Ed_empno.Text          := Fm_DestValue.empno;
      L_korname.ValueCaption := Fm_DestValue.Korname;
      Bt_SrhClick(Bt_Srh);
    end;
end;

procedure TMainForm.BT_annoClick(Sender: TObject);
var   FG_Date : String;
begin
  if length(Ed_empno.Text) < 4  then
    begin
      MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
      System.Exit;
    end;

  Try
    AnnoForm  := TAnnoForm.Create(Self);
    AnnoForm.L_emp.ValueCaption     := ED_empno.Text +' - '+L_korname.ValueCaption;

    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    FG_Date           := FM_Tmax.GetData('empdate','ED_empno.Text','');
    AnnoForm.ED_Date1.NoFormatDate  := FG_Date;

    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    FG_Date           := FM_Tmax.GetData('sysdate','ED_empno.Text','');
    AnnoForm.ED_Date2.NoFormatDate  := FG_Date;

    AnnoForm.ShowModal;
  Finally
    AnnoForm.Free;
  End;

end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  //ShowMessage('jobfield :'+L_jobfield.Hint+'| dutykind :'+L_dutykind.Hint+'| Empno :'+MainForm.pEmpno);
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
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

end.
