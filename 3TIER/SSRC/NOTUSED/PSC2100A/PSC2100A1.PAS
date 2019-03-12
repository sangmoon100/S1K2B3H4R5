// 2009-06  오종석 manager 요청으로 개발
// 배정분 신청 청약을 받기전에 pshcsapp 테이블에 배정내역을 프로그래머가 등록한후 신청을 받는다.


unit PSC2100A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, OnFocusButton, OnPopupEdit, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme, OnEditCombo,
  OnEditNumCtl, Db, Tmax_DataSetText, Tmax_session, ComCtrls, OnRadioBtn,
  OnInsaCommon, KeycodeTmax, TmaxFunc, Comobj;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    ED_empno: TTMaxPersonPopupEdit;
    ED_dept: TOnWinPopupEdit;
    BT_Exit: TOnFocusButton;
    L_EmpList1: TPanel;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    SB_Help: TStatusBar;
    TMaxMaster: TTMaxDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    E_owstcnt: TOnNumberEdit;
    E_csdivcnt: TOnNumberEdit;
    E_csodrcnt: TOnNumberEdit;
    E_cssodrcnt: TOnNumberEdit;
    E_csodramtapp: TOnNumberEdit;
    E_csdivmonmth: TOnComboEdit;
    P_Title: TPanel;
    GroupBox1: TGroupBox;
    OnRadioButton1: TOnRadioButton;
    OnRadioButton2: TOnRadioButton;
    OnRadioButton3: TOnRadioButton;
    OnRadioButton4: TOnRadioButton;
    OnRadioButton5: TOnRadioButton;
    OnRadioButton6: TOnRadioButton;
    BT_AppSave: TOnFocusButton;
    E_divseqnum: TOnEdit;
    BT_Print: TOnFocusButton;
    E_csdivbank: TOnComboEdit;
    Panel1: TPanel;
    E_cssetsum: TOnNumberEdit;
    E_csodrcntset: TOnNumberEdit;
    E_csodramtset: TOnNumberEdit;
    E_cssodrcntset: TOnNumberEdit;
    E_csbank: TOnWinPopupEdit;
    E_csbanknum: TOnEdit;
    OnEdit2: TOnEdit;
    OnEdit3: TOnEdit;
    BT_BankSave: TOnFocusButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    E_cspay1: TOnRadioButton;
    E_cspay2: TOnRadioButton;
    BT_Extract: TOnFocusButton;
    L_SaveHint: TLabel;
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AppSaveClick(Sender: TObject);
    procedure Data_read;
    procedure E_csbankCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_csbankInitPopup(Sender: TObject);
    procedure E_csdivmonmthChange(Sender: TObject);
    procedure E_csodrcntExit(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_ExtractClick(Sender: TObject);
    procedure BT_BankSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vEmpno, vSysdate : String;
    vDivseqnum, vLimitsubdate, vBankName : String;
    vExissueamt, vIssueamt  : Integer;
    vAdmin, vSaveSuccess : Boolean;
  end;

var
  FM_Main: TFM_Main;

implementation

uses PSC2100A2;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  if   (TMaxMaster.RecordCount > 0) and (E_csodramtset.Value > 0) then
  begin
       if (Trim(E_csbank.Text) <= '-') or (Trim(E_csbanknum.Text) = '') then
       begin
            ShowMessage('연계은행 및 계좌번호를 입력하시기 바랍니다.');
            Exit;
       end;
  end;

  Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except //Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    ShowMessage(TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                '종합인사 관리자에게 문의하십시오.');
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  vEmpno := Hinsa_Param(cmdline,1);
  ED_empno.Enabled   := False;
  BT_Extract.Visible := False;
  L_SaveHint.Visible := False;
  E_cspay1.Enabled   := False;
  E_cspay2.Enabled   := False;
  vAdmin             := False;
  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  TMaxMaster.BatchRows := 1000;
  E_csdivbank.Enabled := False;

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('field1'  , ftString, 100);
       AddField('field2'  , ftString, 100);
       AddField('field3'  , ftString, 100);
       AddField('field4'  , ftString, 100);
       AddField('field5'  , ftString, 100);
         
       Close;
       Sql.Clear;
       Sql.Text := 'Select divseqnum, limitsubdate, exissueamt, issueamt,   '+
                   '       to_char(sysdate,''yyyymmdd'')                    '+
                   '  from pshsbas                                          '+
                   ' where divseqnum = (select max(divseqnum) from pshsbas) ';
       open;

       E_divseqnum.Text := Fields[0].AsString + ' 차';
       vDivseqnum       := Fields[0].AsString;
       vLimitsubdate    := Fields[1].AsString;
       vExissueamt      := Fields[2].AsInteger;
       vIssueamt        := Fields[3].AsInteger;
       vSysdate         := Fields[4].AsString;

       if vLimitsubdate < vSysdate then //신청기한까지만 저장 가능토록....
       begin
            //ShowMessage('청약 신청기간이 종료 되었습니다.'+#13+#13+#10+  //신청종료후 확정내역 조회기간중에는 메세지 중지.
            //            '담당자에게 문의 하시기 바랍니다.');
            BT_AppSave.Enabled := False;
       end;

       // 관리자 권한 부여...///////////////////////////////////////////////////
       Close;
       Sql.Clear;
       Sql.Text := 'Select Groupid, ''F2'', ''F3'', ''F4'', ''F5''  '+
                   '  from pymenuuser                               '+
                   ' where empno = '''+ Hinsa_Param(cmdline,1) +''' ';
       open;

       if (Fields[0].AsString = 'G001') or (Fields[0].AsString = 'G042') or (Fields[0].AsString = 'G052') then vAdmin := True;

       if vAdmin then
       begin
            ED_empno.Enabled   := True;
            BT_Extract.Visible := True;
            BT_AppSave.Enabled := True;

            L_SaveHint.Visible := True;
            E_cspay1.Enabled   := True;
            E_cspay2.Enabled   := True;
       end
       else ED_empno.ButtonGlyph.Visible := False;       
  end;

  ED_empno.empno := Hinsa_Param(cmdline,1);
  if ED_empno.empno <> '' then
  begin
       ED_empno.OnReadEnded := nil;
       ED_empno.Text := ED_empno.empno;
       ED_empno.PL_get_singledata;

       ED_dept.Text  := ED_empno.deptname;
       ED_dept.Hint  := ED_empno.jobdept;
       ED_empno.OnReadEnded := ED_empnoReadEnded;
  end;

  Data_read;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       ED_empno.PL_get_singledata;
       Key := #0;
  end;
end;

procedure TFM_Main.ED_empnoReadEnded(Sender: TObject);
begin
  ED_empno.PL_get_singledata;

  Data_read;

  ED_dept.Text := ED_empno.deptname;
  ED_dept.Hint := ED_empno.jobdept;
end;

procedure TFM_Main.Data_read;
begin
  if ED_Empno.empno = '' then  Exit;

  E_cssodrcnt.MaxValue := 1000;    //실권주 청약주수 한도.

  //관리자를 위한 초기화.
  E_owstcnt.Value     := 0;   //現 보유주수
  E_csdivcnt.Value    := 0;   //배정 주수
  E_csodrcnt.MaxValue := 0;   //배정분 청약주수 한도.
  E_csodrcnt.Value    := 0;   //배정분 청약주수
  E_cssodrcnt.Value   := 0;   //실권주 청약주수
  E_csodramtapp.Value := 0;   //청약 금액
  E_csdivmonmth.ItemIndex := -1;

  E_cspay1.Checked := False;
  E_cspay2.Checked := False;

  with TMaxMaster do
  begin
       ServiceName := 'PSC2100A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT divseqnum,          empno,               korname,         '+#13+
                   '       nvl(owstcnt,0),     nvl(csdivcnt,0),     nvl(csodrcnt,0), '+#13+
                   '       nvl(cssodrcnt,0),   nvl(csodramt,0),                      '+#13+
                   '       csdivmonmth,        csdivbanknm,                          '+#13+
                   '       writetime,          writeman,                             '+#13+
                   '       nvl(csodrcntset,0), nvl(cssodrcntset,0),                  '+#13+
                   '       csbank,             csbanknum,           cspay,           '+#13+
                   '      (select codename from pyccode                              '+#13+
                   '        where codeid = ''K910''                                  '+#13+
                   '          and codeno = a.csbank ),                               '+#13+
                   '       banktime,           bankman                               '+#13+
                   '  FROM pshcsapp a                                                '+#13+
                   ' WHERE divseqnum = '''+ vDivseqnum     +'''                      '+#13+
                   '   AND empno     = '''+ ED_Empno.empno +'''                      ';

       ClearFieldInfo;
       AddField('DIVSEQNUM'   , ftString, 10);
       AddField('EMPNO'       , ftString, 4);
       AddField('KORNAME'     , ftString, 12);
       AddField('OWSTCNT'     , ftFloat , 7);
       AddField('CSDIVCNT'    , ftFloat , 6);
       AddField('CSODRCNT'    , ftFloat , 6);
       AddField('CSSODRCNT'   , ftFloat , 6);
       AddField('CSODRAMT'    , ftFloat , 9);
       AddField('CSDIVMONMTH' , ftString, 1);
       AddField('CSDIVBANKNM' , ftString, 3);
       AddField('WRITETIME'   , ftString, 15);
       AddField('WRITEMAN'    , ftString, 4);

       AddField('CSODRCNTSET' , ftFloat , 6);
       AddField('CSSODRCNTSET', ftFloat , 6);
       AddField('CSBANK'      , ftString, 3);
       AddField('CSBANKNUM'   , ftString, 20);
       AddField('CSPAY'       , ftString, 5);
       AddField('BANKNAME'    , ftString, 20);       
       AddField('BANKTIME'    , ftString, 15);
       AddField('BANKMAN'     , ftString, 4);
       Open;

       if   Fields[4].AsFloat = 0 then E_csodrcnt.Enabled := False
       else                            E_csodrcnt.Enabled := True;
       
       if TMaxMaster.RecordCount = 0 then
       begin
            //ShowMessage('배정분 주식이 존재하지 않습니다.'+#13+#13+  //신청종료후 확정내역 조회기간중에는 메세지 중지.
            //            '실권주를 신청하실수 있습니다.   ');
            Close;
            Exit;
       end;

       E_owstcnt.Value     := Fields[3].AsFloat;   //現 보유주수
       E_csdivcnt.Value    := Fields[4].AsFloat;   //배정 주수
       E_csodrcnt.MaxValue := Fields[4].AsFloat;   //배정분 청약주수 한도.
       E_csodrcnt.Value    := Fields[5].AsFloat;   //배정분 청약주수
       E_cssodrcnt.Value   := Fields[6].AsFloat;   //실권주 청약주수
       E_csodramtapp.Value := Fields[7].AsFloat;   //신청 청약 금액

       if   Fields[8].AsString = '' then E_csdivmonmth.ItemIndex := -1
       else                              E_csdivmonmth.ItemIndex := StrToInt(Fields[8].AsString); //청약금 조달방법

       if      Fields[9].AsString = '11' then E_csdivbank.ItemIndex := 0
       else if Fields[9].AsString = '81' then E_csdivbank.ItemIndex := 1;


       E_cssetsum.Value    := Fields[12].AsFloat + Fields[13].AsFloat;           // 총 배정 확정주수
       E_csodrcntset.Value := Fields[12].AsFloat;                                // 배정분 신청확정주수
       E_cssodrcntset.Value:= Fields[13].AsFloat;                                // 실권주 신청확정주수
       E_csodramtset.Value := E_cssetsum.Value * vIssueamt;                      // 확정 청약 금액
       E_csbank.Text       := Fields[14].AsString + ' - ' + Fields[17].AsString; // 연계은행명
       E_csbanknum.Text    := Fields[15].AsString;                               // 연계은행 계좌번호
       if      Fields[16].AsString = '납부' then E_cspay1.Checked := True        // 청약금 납부 여부
       else if Fields[16].AsString = '미납' then E_cspay2.Checked := True;
  end;
end;

procedure TFM_Main.E_csbankCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  E_csbank.Text := FM_KeycodeTmax.Codeid +' - '+ FM_KeycodeTmax.CodeName;
end;

procedure TFM_Main.E_csbankInitPopup(Sender: TObject);
begin
  FM_KeycodeTmax := TFM_KeycodeTmax.Create(Self);
  FM_KeycodeTmax.TGrid.Session := TMaxSession;

  FM_KeycodeTmax.Edit := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_KeycodeTmax;

  FM_KeycodeTmax.Caption  := '[ 은행코드조회 ]';
  FM_KeycodeTmax.Codeid   := 'K910';
  FM_KeycodeTmax.BankOnly := True; {실제 은행코드만 나타나도록.}
end;

procedure TFM_Main.E_csdivmonmthChange(Sender: TObject);
begin
  if   E_csdivmonmth.ItemIndex = 1 then  E_csdivbank.Enabled := True
  else                                   E_csdivbank.Enabled := False;

  if E_csdivbank.Enabled = False then E_csdivbank.ItemIndex := -1;
end;

procedure TFM_Main.E_csodrcntExit(Sender: TObject);
begin
  E_csodramtapp.Value := E_csodrcnt.Value * vExissueamt; 
end;

procedure TFM_Main.BT_AppSaveClick(Sender: TObject);
begin
  vSaveSuccess := False;
  if (E_csodrcnt.Enabled <> False) and (E_csodrcnt.Value = 0) then
  begin
       ShowMessage('배정분 청약주수를 입력하시기 바랍니다.');
       Exit;
  end;

  if E_csdivmonmth.ItemIndex = -1 then
  begin
       ShowMessage('청약금 조달방법을 선택하시기 바랍니다.');
       Exit;
  end;
  
  if (E_csdivmonmth.ItemIndex = 1) and (Trim(RemoveChar(E_csdivbank.Text,'-')) = '' ) then
  begin
       ShowMessage('대출은행을 선택하시기 바랍니다.');
       Exit;
  end;
               ShowMessage( Copy(Trim(RemoveChar(E_csdivbank.Text,'-')),1,2)  );
  with TMaxDataSet do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;

       TMaxMaster.Close;
       TMaxMaster.Open;
       if   TMaxMaster.RecordCount > 0 then
       begin
            Sql.Text := 'Update pshcsapp                                                                 '+#13+
                        '   Set csodrcnt    = '''+ FloatToStr(E_csodrcnt.Value)                    +''' ,'+#13+
                        '       cssodrcnt   = '''+ FloatToStr(E_cssodrcnt.Value)                   +''' ,'+#13+
                        '       csodramt    = '''+ FloatToStr(E_csodramtapp.Value)                 +''' ,'+#13+
                        '       csdivmonmth = '''+ FloatToStr(E_csdivmonmth.ItemIndex)             +''' ,'+#13+
                        '       csdivbanknm = '''+ Copy(Trim(RemoveChar(E_csdivbank.Text,'-')),1,2)+''' ,'+#13+
                        '       writetime   = TO_char(sysdate,''YYYYMMDDHH24MISSD'')                    ,'+#13+
                        '       writeman    = '''+ vEmpno                                          +'''  '+#13+
                        ' WHERE divseqnum   = '''+ vDivseqnum                                      +'''  '+#13+
                        '   AND empno       = '''+ ED_Empno.empno +'''                                   ';
      end
      else
      begin //배정분 없이 실권주만 신청하는 케이스.
           Sql.Text := 'Insert into pshcsapp                                                 '+#13+
                       '       (  divseqnum,   empno,       korname,                         '+#13+
                       '          owstcnt,     csdivcnt,    csodrcnt,  cssodrcnt, csodramt,  '+#13+
                       '          csdivmonmth, csdivbanknm, writetime, writeman           )  '+#13+
                       'Values (  '''+ vDivseqnum                                      +''' ,'+#13+
                       '          '''+ ED_Empno.empno                                  +''' ,'+#13+
                       '          '''+ ED_Empno.korname                                +''' ,'+#13+
                       '          0                                                         ,'+#13+
                       '          0                                                         ,'+#13+
                       '          0                                                         ,'+#13+
                       '          '''+ FloatToStr(E_cssodrcnt.Value)                   +''' ,'+#13+
                       '          0                                                         ,'+#13+
                       '          '''+ FloatToStr(E_csdivmonmth.ItemIndex)             +''' ,'+#13+
                       '          '''+ Copy(Trim(RemoveChar(E_csdivbank.Text,'-')),1,2)+''' ,'+#13+
                       '          TO_char(sysdate,''YYYYMMDDHH24MISSD'')                    ,'+#13+
                       '          '''+ vEmpno                                          +''' )';

      end;

      if not TMaxDataSet.Execute then
      begin
           Application.MessageBox('청약신청 저장에 실패했습니다.','작업실패',MB_OK);
           Exit;
      end;
  end;
  vSaveSuccess := True;

  if TComponent(Sender).Tag = 0 then
     Application.MessageBox('청약신청 저장에 성공했습니다.','작업안내',MB_OK);
end;

procedure TFM_Main.BT_BankSaveClick(Sender: TObject);
var v_Cspay : String;
begin
  //관리자는 계좌번호 등록없이 납부여부만 등록가능토록.
  if (not vAdmin) and ( (Trim(RemoveChar(E_csbank.Text,'-')) <= '-') or (Trim(RemoveChar(E_csbanknum.Text,'-')) = '') ) then
  begin
       ShowMessage('연계은행 및 계좌번호를 입력하시기 바랍니다.');
       Exit;
  end;

  v_Cspay := '';
  if E_cspay1.Checked then v_Cspay := '납부';
  if E_cspay2.Checked then v_Cspay := '미납';

  with TMaxDataSet do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;

       TMaxMaster.Close;
       TMaxMaster.Open;
       if   TMaxMaster.RecordCount > 0 then
       begin
            Sql.Text := 'Update pshcsapp                                                 '+#13+
                        '   Set csbank     = '''+ Copy(Trim(E_csbank.Text),1,2)    +''' ,'+#13+
                        '       csbanknum  = '''+ Trim(E_csbanknum.Text)           +''' ,'+#13+
                        '       cspay      = '''+ v_Cspay                          +''' ,'+#13+
                        '       banktime   = TO_char(sysdate,''YYYYMMDDHH24MISSD'')     ,'+#13+
                        '       bankman    = '''+ vEmpno                           +'''  '+#13+
                        ' WHERE divseqnum  = '''+ vDivseqnum                       +'''  '+#13+
                        '   AND empno      = '''+ ED_Empno.empno                   +'''  ';
      end
      else Exit;

      if not TMaxDataSet.Execute then
      begin
           Application.MessageBox(' 저장을 실패했습니다.','작업실패',MB_OK);
           Exit;
      end;
  end;

  Application.MessageBox(' 저장을 성공했습니다.','작업안내',MB_OK);
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  if vLimitsubdate >= vSysdate then  //신청기한까지만 저장 가능토록....
  begin
       BT_AppSaveClick(Sender);      //자동저장.
       if not vSaveSuccess then Exit;
  end;

  //신청기한 이후에도 출력은 가능...
  FM_Print := TFM_Print.Create(Application);

  with TMaxMaster do
  begin
       TMaxMaster.Close;
       TMaxMaster.Open;
       
       with FM_Print do
       begin
            L_Empno.Caption     := '사    번 : '+ ED_Empno.empno;
            L_Korname.Caption   := '성    명 : '+ ED_Empno.korname;
            L_Dept.Caption      := '부    서 : '+ ED_Empno.deptname;
            L_owstcnt.Caption   := InsCom(Fields[3].AsInteger,0);   //現 보유주수
            L_csdivcnt.Caption  := InsCom(Fields[4].AsInteger,0);   //배정 주수
            L_csodrcnt.Caption  := InsCom(Fields[5].AsInteger,0);   //배정분 청약주수
            L_cssodrcnt.Caption := InsCom(Fields[6].AsInteger,0);   //실권주 청약주수
            L_csodramt.Caption  := InsCom(Fields[7].AsInteger,0);   //청약 금액

            //청약금 조달방법
            L_csdivmonmth.Caption := '';
            if      Fields[8].AsString = '0' then L_csdivmonmth.Caption := '자   비'
            else if Fields[8].AsString = '1' then
            begin
                 if      Fields[9].AsString = '11' then vBankName := '농협중앙회'
                 else if Fields[9].AsString = '81' then vBankName := '하나은행';
                 
                 L_csdivmonmth.Caption := '대   출 ('+ vBankName +')';
            end;

            L_AppDate.Caption   := Copy(vSysdate,1,4) + ' 년  ' +
                                   Copy(vSysdate,5,2) + ' 월  ' +
                                   Copy(vSysdate,7,2) + ' 일';
            L_AppMan.Caption    := '청  약  자 :  ' + ED_Empno.korname + '  (인)';
       end;
       Close;
  end;
  
  FM_Print.QuickRep1.Preview;
end;

procedure TFM_Main.BT_ExtractClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
    vCssetsum : Integer;
begin
  SB_Help.Panels[1].Text :=' 엑셀 변환할 자료를 검색중입니다.';
  
  with TMaxMaster do
  begin
       ServiceName := 'PSC2100A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT divseqnum,    empno,        korname,  '+#13+
                   '       owstcnt,      csdivcnt,     csodrcnt, '+#13+
                   '       cssodrcnt,    csodramt,               '+#13+
                   '       csdivmonmth,  csdivbanknm,            '+#13+
                   '       writetime,    writeman,               '+#13+
                   '       csodrcntset,  cssodrcntset,           '+#13+
                   '       csbank,       csbanknum,    cspay,    '+#13+
                   '      (select codename from pyccode          '+#13+
                   '        where codeid = ''K910''              '+#13+
                   '          and codeno = a.csbank ),           '+#13+
                   '       banktime,     bankman                 '+#13+
                   '  FROM pshcsapp a                            '+#13+
                   ' WHERE divseqnum = '''+ vDivseqnum +'''      '+#13+  //'   AND (NVL(csodrcnt,0) <> 0 OR NVL(cssodrcnt,0) <> 0)'+#13+
                   ' order by empno                              ';
       Open;
  end;

  if TMaxMaster.RecordCount < 1 then
  begin
       SB_Help.Panels[1].Text :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  SB_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, TMaxMaster.Fields.Count + 3], VarVariant); //Gird 출력시       +3은 가상필드 갯수 더함.
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      SB_Help.Panels[1].Text := '';
      Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add;                       //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '우리사주 청약자 명단';  //시트명 부여

  //TITLE NAME 설정
  XL.Range['A1'].value := '';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to TMaxMaster.Fields.Count do
  begin
       if TMaxMaster.Fields[i-1].FullName = 'EMPNO' then Cap_empno := i+1;
       //XArr[i]  := TMaxMaster.Fields[i-1].FullName;
       XArr[1]  := '차수';
       XArr[2]  := '사번';
       XArr[3]  := '성명';
       XArr[4]  := '현보유주수';
       XArr[5]  := '배정주수';
       XArr[6]  := '배정분 청약주수';
       XArr[7]  := '실권주 청약주수';
       XArr[8]  := '배정분 청약금액';
       XArr[9]  := '조달방법';
       XArr[10] := '대출은행';
       XArr[11] := '신청작업일시';
       XArr[12] := '신청작업사번';
       XArr[13] := '배정분 잔여주수';    //가상필드1
       XArr[14] := '총 배정 확정주수';   //가상필드1
       XArr[15] := '배정분 신청확정주수';
       XArr[16] := '실권주 신청확정주수';
       XArr[17] := '확정 청약 금액';     //가상필드1
       XArr[18] := '연계은행명';
       XArr[19] := '은행코드';
       XArr[20] := '연계은행 계좌번호';
       XArr[21] := '청약금 납부 여부';
       XArr[22] := '은행저장일시';
       XArr[23] := '최종저장사번';
  end;

  XL.Range['A1' , CHR( 64 + TMaxMaster.Fields.Count + 3 )+'1'].Value := XArr;  //Gird 출력시
  k := 1;
  for i := 1 to TMaxMaster.Fields.Count + 3 do     //Gird 출력시
  begin
       XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '1'].font.Size := 9;
       XL.Range[CHR(64 + i) + '1'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := TMaxMaster.GetBookmark;
  TMaxMaster.DisableControls;
  TMaxMaster.First;

  for i := 1 to  TMaxMaster.RecordCount do
  begin
       begin
            vCssetsum := StrToInt(TMaxMaster.Fields[12].AsString)   //총 배정 확정주수
                       + StrToInt(TMaxMaster.Fields[13].AsString);

            XArr[1] := TMaxMaster.Fields[0].AsString;
            XArr[2] := ''''+TMaxMaster.Fields[1].AsString;
            XArr[3] := TMaxMaster.Fields[2].AsString;
            XArr[4] := TMaxMaster.Fields[3].AsString;
            XArr[5] := TMaxMaster.Fields[4].AsString;
            XArr[6] := TMaxMaster.Fields[5].AsString;
            XArr[7] := TMaxMaster.Fields[6].AsString;
            XArr[8] := TMaxMaster.Fields[7].AsString;
            if   (TMaxMaster.Fields[8].AsString = '0')  then
            begin
                 XArr[9]  := '자비';
                 XArr[10] := '';
            end
            else if (TMaxMaster.Fields[8].AsString = '1')  then
            begin
                 XArr[9]  := '대출';
                 if      (TMaxMaster.Fields[9].AsString = '11') then XArr[10]  := '농협중앙회'
                 else if (TMaxMaster.Fields[9].AsString = '81') then XArr[10]  := '하나은행';
            end;
            XArr[11] := ''''+TMaxMaster.Fields[10].AsString;
            XArr[12] := ''''+TMaxMaster.Fields[11].AsString;
            XArr[13] := IntToStr( StrToInt(TMaxMaster.Fields[4].AsString)   //배정분 잔여주수
                                 -StrToInt(TMaxMaster.Fields[5].AsString) );
            XArr[14] := IntToStr( vCssetsum );
            XArr[15] := TMaxMaster.Fields[12].AsString;
            XArr[16] := TMaxMaster.Fields[13].AsString;
            XArr[17] := IntToStr( vCssetsum * 5000 );
            XArr[18] := TMaxMaster.Fields[17].AsString;       //연계은행명
            XArr[19] := ''''+TMaxMaster.Fields[14].AsString;  //연계은행코드

            //연계은행 계좌번호
            if   Pos('-', TMaxMaster.Fields[15].AsString) > 0 then XArr[20] := TMaxMaster.Fields[15].AsString
            else                                                   XArr[20] := ''''+TMaxMaster.Fields[15].AsString;

            XArr[21] := TMaxMaster.Fields[16].AsString;       //청약금 납부 여부
            XArr[22] := ''''+TMaxMaster.Fields[18].AsString;  //은행저장일시
            XArr[23] := ''''+TMaxMaster.Fields[19].AsString;  //최종저장사번
       end;
       XL.Range['A' + IntToStr(k+1), CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k+1)].Value := XArr;
       inc(k);
       TMaxMaster.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].Borders.LineStyle  := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].Borders.Weight     := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].Borders.ColorIndex := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;              //가운데 정렬
   XL.Range['A2', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].font.Size := 9;
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].HorizontalAlignment := 1;  //정렬
   XL.Range['A1', CHR(64 + TMaxMaster.Fields.Count + 3) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A2', 'A2'].Select;                                 //A2열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   TMaxMaster.GotoBookmark(SavePlace);
   TMaxMaster.FreeBookmark(SavePlace);
   TMaxMaster.EnableControls;
   SB_Help.Panels[1].Text := '';     
end;


end.

