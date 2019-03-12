{===================== Program Header ==========================================
 PROGRAM-NAME      : PKA4058A
 SYSTEM-NAME       : 급여
 SUBSYSTEM-NAME    : 연차사용촉진제도(연차 추가신청 및 수정 요청)
 Programmer        : hjku
 Version           : 1.0
 Date              : 2013.06.19

Update Contents
 Version  date(yy.mm.dd)  programmer  description                relevant doc.no
 1.00    2013.06.19       hjku        연차사용촉진제도(연차 추가신청 및 수정 요청)
================================================================================}
unit pka4058a0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnTmaxDeptEdit, StdCtrls, Mask, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnShapeLabel, OnEditMdate,
  ComCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, Tmax_session,
  Db, Tmax_DataSetText, OnInsaCommon, OnTmaxPersonEdit, func,
  OnEditNumCtl, OnRegistry, TmaxFunc, pebtnedit, Tmax_DmlSet, comobj,
  OnRadioBtn,PDownLoad, OnDBGrid, OnEditCombo,OnStringUtils;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    BT_app_bak: TOnFocusButton;
    BT_appno: TOnFocusButton;
    BBExcel: TOnFocusButton;
    BBdelete: TOnFocusButton;
    NE_Mod_Yearly_Cnt2: TOnEdit;
    ME_Modtodate2: TOnButtonEdit;
    ME_Modfrdate2: TOnButtonEdit;
    NE_Mod_Yearly_Cnt: TOnEdit;
    ME_Modtodate: TOnButtonEdit;
    ME_Modfrdate: TOnButtonEdit;
    ED_hotkeyname: TOnEdit;
    ED_hotkey: TOnWinPopupEdit;
    BBsave: TOnFocusButton;
    BT_Close: TOnFocusButton;
    SL_Assign_Yn: TOnEdit;
    ME_Regfrdate: TOnButtonEdit;
    ME_Regtodate: TOnButtonEdit;
    NE_Reg_Yearly_Cnt: TOnEdit;
    SL_Yearly_Cnt: TOnEdit;
    SL_Used_Yearly_Cnt: TOnEdit;
    OnEdit2: TOnEdit;
    SB_Help: TStatusBar;
    RB_Append: TOnRadioButton;
    RB_Modify: TOnRadioButton;
    e_jobname: TEdit;
    RB_Delete: TOnRadioButton;
    SL_YearlyPlan_Cnt: TOnEdit;
    ME_Regfrdate2: TOnButtonEdit;
    ME_Regtodate2: TOnButtonEdit;
    NE_Reg_Yearly_Cnt2: TOnEdit;
    Memo3: TMemo;
    Bt_Menual: TOnFocusButton;
    DataSource1: TDataSource;
    TDS_Grid: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TDS2: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    QR_com: TTMaxDataSet;
    E_EMPNO: TTMaxPersonPopupEdit;
    E_deptCode: TOnWinPopupEdit;
    E_deptname: TOnEdit;
    OnSchemeForm1: TOnSchemeForm;
    BBcancelsave: TOnFocusButton;
    BT_app: TOnFocusButton;
    DBG_grid: TOnDBGrid;
    ED_year: TOnComboEdit;
    E_Mod_YN: TOnComboEdit;
    bt_ModYN_save: TOnFocusButton;
    procedure BT_CloseClick(Sender: TObject);
    procedure RB_OneClick(Sender: TObject);
    procedure RB_AllClick(Sender: TObject);
    procedure E_empnoEnter(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoReadEnded(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_empnoChange(Sender: TObject);
    procedure ME_RegfrdateButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure ME_RegtodateButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure ED_hotkeyCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure ED_hotkeyInitPopup(Sender: TObject);
    procedure BT_app_bakClick(Sender: TObject);
    procedure BBExcelClick(Sender: TObject);
    procedure E_empnoExit(Sender: TObject);
    procedure BT_appnoClick(Sender: TObject);
    procedure ME_RegfrdateChange(Sender: TObject);
    procedure ME_RegtodateChange(Sender: TObject);
    procedure ME_ModfrdateChange(Sender: TObject);
    procedure ME_ModtodateChange(Sender: TObject);
    procedure ME_ModfrdateButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ME_ModtodateButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ED_hotkeyChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RB_AppendClick(Sender: TObject);
    procedure RB_ModifyClick(Sender: TObject);
    procedure E_deptcodeInitPopup(Sender: TObject);
    procedure E_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure RB_DeleteClick(Sender: TObject);
    procedure ME_Modfrdate2Change(Sender: TObject);
    procedure ME_Modtodate2Change(Sender: TObject);
    procedure ME_Modfrdate2ButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ME_Modtodate2ButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ME_Regfrdate2ButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ME_Regtodate2ButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ME_Regfrdate2Change(Sender: TObject);
    procedure ME_Regtodate2Change(Sender: TObject);
    procedure Bt_MenualClick(Sender: TObject);
    procedure BBcancelsaveClick(Sender: TObject);
    procedure BT_appClick(Sender: TObject);
    procedure ED_yearChange(Sender: TObject);
    procedure bt_ModYN_saveClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    GSdate        : String[8];     //Host Date
    GSYear        : String[4];     //기준년도
    Knteyymm      : String;        //근태결재년월 Date
    GSempno       : String[4];     //Login사번
    GSConEmpno    : String;        //결재자
    GSSndtel      : String;
    GSRcvtel      : String;
    GSgrade       : String;        //등급
    All_Flag      : Boolean ;      //if 운영자 ? True : False
    GSorgnum      : String;        // Login조직차수
    GSdeptcode    : String;        // Login부서코드
    GSdeptcode2   : String;        // Login부서코드
    GSSelectSql   : String;
    ffrrealtime   : String;
    oriovtmdate   : String;        //original ovtmdate
    orifrrealtime : String;        //original frrealtime
    SMsg          : String;
    orgnum        : String;
    concode       : String;
    JobName       : String;
//사번체크
    FL_Yempno     : String;
    FL_Bempno     : String;
    FL_conEmpno   : String;
//부서
    FL_Deptcode   : String;


    Mod_flag, Regfrdate,  Regtodate, Regfrdate2,  Regtodate2, Modfrdate, Modtodate, Modfrdate2, Modtodate2 :String;
    dup_frdate1, dup_frdate2, dup_frdate3, dup_frdate4, dup_todate1, dup_todate2, dup_todate3, dup_todate4 : String; //2015.01.20.hjku. 연차당일 반영하기 위해 추가.. 이명노M요청
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    CancelSayu, ReturnSayu : String;   

    procedure PL_Com_Contructor;
    procedure Initialize;
    procedure Retrieve;
    function  ModifyExists : Boolean;
    procedure Check_Modify;
    function  PL_Input_Check : Boolean;
    function  PL_Cancel_Input_Check : Boolean;    
    function  PL_Yearly_Check(add_yearly, minus_yearly : real) : Boolean;
    function  PL_Get_Duty_Confirm(var stdate : string) : Boolean;    
    function  PL_Process_Yearly : Boolean;
    procedure PL_Get_ConEmpno(P_empno: String);    
    function  Make_Query(v_empno,stdate,todate, dutycode, flag : string;out update_list, insert_list, column_list :string):boolean;
    function  Get_DupDate(rfrdate,rtodate,mfrdate,mtodate : string; out dupfrdate,duptodate :string) : Boolean;
    function  Update_Query(v_empno,stdate,todate, flag, update_list, insert_list, column_list :string):boolean;
    function  PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
    function  PL_Calc_Yearly_Cnt(empno, fromdate, todate, flag : String) : real;
    function  StringOfDept(StringOfdeptcode : string): String;
    Function  Check_DateValid( InDate : String ) : Boolean;
    Function  Check_Range(TmpFrrealtime, Tmptorealtime : String ;
                          var DateTime1,DateTime2 :String): Boolean;
    Function  To_DateTime(Tmp :String):Extended;
    procedure PL_Select_pkyearlt(workyy, empno : string;
                                 out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String);
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
    function  Get_JobName(p_payra : string) : String;
    function  RemoveSpecialChar(sSrc: string): string;
    function  PL_Get_Cancel_YearCnt(empno : string): real;
  end;

var
  FM_Main: TFM_Main;

//2015.02.27.hjku.. 연차 프로그램 메시지 출력용 추가..  
//연차등록 prog.
  FL_Progid     : String = 'PKA4058A'; //연차등록 프로그램 ID
  FL_Tier       : String = '3';        //연차등록 프로그램 ID Tier
  FL_ProgName   : String;              //연차등록 프로그램명


implementation


uses Calen1, PYCCODE, pka4058a1, pka4058a2, pka4058a3;
{$R *.DFM}

procedure TFM_Main.Initialize;
var
     FL_Date : String;
     FL_Sql  : String;
     FL_IDate: Integer;
begin
     //2015.01.20.hjku. 여러해 수정가능하도록 수정.. 이명노M 요청
     FL_Date    := Copy(GSdate,1,4);
     //FG_Month   := Copy(GSdate,5,2);

     if not IsNumber(FL_Date) then
       System.Exit;

     FL_IDate := GetStrToint(FL_Date);
     ED_year.Items.Clear;
     ED_year.KeyItems.Clear;
     ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
     ED_year.Items.Add(FL_Date+' 년');
     ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');
     ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
     ED_year.KeyItems.Add(FL_Date);
     ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
     ED_year.ItemIndex := 1;

     SB_Help.Panels[1].Text := '' ;

     ME_Regfrdate.Text := '';
     ME_Regtodate.Text := '';
     ME_Regfrdate2.Text:= '';
     ME_Regtodate2.Text:= '';
     ME_Modfrdate.Text := '';
     ME_Modtodate.Text := '';
     ME_Modfrdate2.Text:= '';
     ME_Modtodate2.Text:= '';

     Regfrdate         := '';
     Regtodate         := '';
     Regfrdate2        := '';
     Regtodate2        := '';
     Modfrdate         := '';
     Modtodate         := '';
     Modfrdate2        := '';
     Modtodate2        := '';

     CancelSayu        := '';
     ReturnSayu        := '';     

     SL_Yearly_Cnt.Text         := '';
     SL_Used_Yearly_Cnt.Text    := '';
     SL_Assign_Yn.Text          := '';

     NE_Reg_Yearly_Cnt.Text := '0';
     NE_Mod_Yearly_Cnt.Text := '0';

     ED_hotkey.Text        := '63';
     ED_hotkeyname.Text    := '연차';

     //2016.12.19.. 연차휴가 등록취소 시행.. 김진호M
     //if Mod_flag='' then Mod_flag          := 'M';
     if Mod_flag='' then Mod_flag          := 'D';
     
     if not (Mod_flag[1] in ['M','I','D']) then Mod_flag          := 'I';
     //2014.09.12.hjku. 디폴트 변경.. 이명노M 요청.
     //RB_Append.Checked := true;

          if(Mod_flag='I') then RB_Append.Checked := true
     else if(Mod_flag='D') then RB_Delete.Checked := true
     else                       RB_Modify.Checked := true;

     Check_Modify;
end;

function TFM_Main.ModifyExists : Boolean;
begin
  result := false;
  
  with QR_com do
    begin
      PL_Com_Contructor;

      SQL.Add('SELECT YEARLY_YY,                               ');
      SQL.Add('       empno,                                   ');
      SQL.Add('       korname,                                 ');
      SQL.Add('       YEARLY_CNT,                              ');
      SQL.Add('       YEARLYPLAN_CNT                           ');
      SQL.Add('  FROM PKYEARLT                                 ');
      SQL.Add(' WHERE yearly_yy = '''+GSYear+''' AND empno = '''+E_empno.empno+''' AND NVL(MOD_YN,''N'')=''Y''           ');
      Open;

      if(RecordCount > 0) then
      begin
        result := true;
        E_Mod_YN.ItemIndex := 0;
      end
      else
      begin
        result := false;
        E_Mod_YN.ItemIndex := 1;
      end;

      Close;
  end;
end;


procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Retrieve;
var
  yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String;
begin
     PL_Select_Pkyearlt(GSYear,E_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);
     SL_Yearly_Cnt.text      := yearly_cnt;
     SL_YearlyPlan_Cnt.text  := yearlyplan_cnt;
     SL_Used_Yearly_Cnt.text := used_yearly_cnt;
     SL_Assign_Yn.Text       := assign_yn;

     with TDS_Grid do
     begin
          ServiceName := 'PKA4058A_sel1';
          Close;
          Sql.Clear;
          SQL.Add('SELECT APPDATE,                                                                                             ');
          SQL.Add('       EMPNO,                                                                                               ');
          SQL.Add('       KORNAME,                                                                                             ');
          SQL.Add('       (SELECT PAYRA FROM PIMPMAS WHERE A.EMPNO =EMPNO) PAYRA,                                              ');
          SQL.Add('       MOD_FLAG,                                                                                            ');
          SQL.Add('       DECODE(UPPER(MOD_FLAG),''I'',''추가'',''M'',''수정'',''D'',''취소'','''') MOD_NAME,                  ');
          SQL.Add('       REGFRDATE,                                                                                           ');
          SQL.Add('       REGTODATE,                                                                                           ');
          SQL.Add('       nvl(REGYEARLY_CNT,0),                                                                                ');
          SQL.Add('       REGFRDATE2,                                                                                          ');
          SQL.Add('       REGTODATE2,                                                                                          ');
          SQL.Add('       nvl(REGYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       MODFRDATE,                                                                                           ');
          SQL.Add('       MODTODATE,                                                                                           ');
          SQL.Add('       nvl(MODYEARLY_CNT,0),                                                                                ');
          SQL.Add('       MODFRDATE2,                                                                                          ');
          SQL.Add('       MODTODATE2,                                                                                          ');
          SQL.Add('       nvl(MODYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       DUTYCODE,                                                                                            ');
          //2014.11.03.hjku. 삭제 추가로 화면 표기 일부 변경...
          //SQL.Add('       (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) DUTYNAME,                ');

          SQL.Add('       CASE WHEN MOD_FLAG<>''D'' THEN (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) ELSE '''' END DUTYNAME,                ');
          SQL.Add('       NVL(CON_YN,''N''),                                                                                     ');
          SQL.Add('       CASE WHEN MOD_FLAG=''D'' THEN decode(NVL(CON_YN,''N''),''Y'',''결재'',''R'',''반려'',''미결재'') ELSE '''' END,                                        ');
          SQL.Add('       CANCELSAYU,                                                                                          ');
          SQL.Add('       RETURNSAYU                                                                                           ');
          SQL.Add('  FROM PKYEARLYMODIFY A                                                                                     ');
          Sql.Add( 'WHERE REGFRDATE LIKE '''+ GSYear + '%''                                                              ');
          Sql.Add( '  AND EMPNO ='''+ E_empno.empno + '''                                                                      ');

               if(RB_Modify.Checked) then
                  Sql.Add( '  AND MOD_FLAG =''M''                                                                      ')
          else if(RB_Append.Checked) then
                  Sql.Add( '  AND MOD_FLAG =''I''                                                                      ')
          else if(RB_Delete.Checked) then
                  Sql.Add( '  AND MOD_FLAG =''D''                                                                      ');

          Sql.Add( '  ORDER BY APPDATE DESC, WRITETIME DESC, MOD_FLAG, REGFRDATE                                                         ');

          ClearFieldInfo;
          //2016.12.19.hjku.. 연차휴가 등록취소 시행.. 김진호M 요청
          //AddField('APPDATE'        , ftString, 8);
          AddField('APPDATE'        , ftString, 16);
          AddField('EMPNO'          , ftString, 4);
          AddField('KORNAME'        , ftString, 12);
          AddField('PAYRA'          , ftString, 3);
          AddField('MOD_FLAG'       , ftString, 1);
          AddField('MOD_NAME'       , ftString, 4);
          AddField('REGFRDATE'      , ftString, 8);
          AddField('REGTODATE'      , ftString, 8);
          AddField('REGYEARLY_CNT'  , ftString, 10);
          AddField('REGFRDATE2'     , ftString, 8);
          AddField('REGTODATE2'     , ftString, 8);
          AddField('REGYEARLY_CNT2' , ftString, 10);
          AddField('MODFRDATE'      , ftString, 8);
          AddField('MODTODATE'      , ftString, 8);
          AddField('MODYEARLY_CNT'  , ftString, 10);
          AddField('MODFRDATE2'     , ftString, 8);
          AddField('MODTODATE2'     , ftString, 8);
          AddField('MODYEARLY_CNT2' , ftString, 10);
          AddField('DUTYCODE'       , ftString, 2);
          AddField('DUTYNAME'       , ftString, 20);
          AddField('CON_YN'         , ftString, 1);
          AddField('CONYNNAME'      , ftString, 10);
          AddField('CANCELSAYU'     , ftString, 200);
          AddField('RETURNSAYU'     , ftString, 200);
          Open;
          //memo1.text := sql.text;

          if TDS_Grid.RecordCount < 1 then
          begin
               //MessageDlg('조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.',mtInformation,[mbOK],0);
               SB_help.Panels[1].Text := '조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.';
               System.Exit;
          end;

          SB_help.Panels[1].Text := '자료가 조회되었습니다.';
     end;
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     with QR_com do
     begin
          ServiceName := 'PKA4040A_dml';
          Close;
          SQL.Clear;
          SQL.Add('insert into PZHMAIL                         ');
          SQL.Add('values (to_char(sysdate,''YYYYMMDDHH24MISS''),');  //SENDTIME   메일발송 작업시간
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
               Execute
          except
               Result := false;
               exit;
          end;
          Result := True;
     end;
end;  


function TFM_Main.StringOfDept(StringOfdeptcode : string): String;
var
  LengthOfDept : Integer;
begin
  for LengthOfDept := Length(StringOfdeptcode) downto 1  do begin
    if Copy(StringOfdeptcode,LengthOfDept,1) <> '0' then begin
      StringOfDept := Copy(StringOfdeptcode,1,LengthOfDept);
      Exit;
    end;
  end;
end;


{==============================================================================
         날짜 체크(현재날짜 이후) Procedure.
 ==============================================================================}
Function TFM_Main.Check_DateValid( InDate : String ) : Boolean;
var
   Temp : Real;
   Buf  : String;
begin
     Buf := InDate;
     if (Length(Buf) <> 8) or (Buf < Knteyymm) then
        begin
           Result := False;
           System.Exit;
        end;

     //2013.11.29.hjku... 해당년도만 반영되도록..
     if (Copy(Buf,1,4)<>GSYear) then
        begin
           Result := False;
           System.Exit;
        end;

     Buf := Copy(Buf,1,4) + DateSeparator + Copy(Buf,5,2) + DateSeparator + Copy(Buf,7,2);

     Try
     Temp := StrToDate( Buf );
     Except on EConvertError do
        begin
             Result := False;
             System.Exit;
        end;
     end;

     Result := True;

end;


{==============================================================================
         이미 신청한 내역과 중복여부를 체크하는 Procedure.
 ==============================================================================}
Function TFM_Main.Check_Range(TmpFrrealtime, Tmptorealtime : String ;
                            var DateTime1,DateTime2 :String): Boolean;
var
   Value1       : Extended;
   Value2       : Extended;
   SValue       : Extended;
   EValue       : Extended;
begin
    Value1 := To_DateTime(TmpFrRealTime);
    Value2 := To_DateTime(TmpToRealTime);

    if ((SValue >  Value1)  AND (EValue <  Value2)) OR
       ((SValue >= Value1)  AND (SValue <= Value2)) OR
       ((EValue >= Value1)  AND (EValue <= Value2)) then
       begin
            DateTime1 := TmpFrRealTime;
            DateTime2 := TmpToRealTime;
            Result    := False;
            System.Exit;
       end;
       Result := True;
end;
{==============================================================================
         String을 DateTime로 변환하는 함수.
 ==============================================================================}
Function TFM_Main.To_DateTime(Tmp :String):Extended;
var
   A            : Extended;
   B            : Extended;
   Buf          : String;
begin
    Buf    := Copy(Tmp,1,4) + DateSeparator +
              Copy(Tmp,5,2) + DateSeparator +
              Copy(Tmp,7,2);

    A      := StrToDate(Buf);
    Buf    := Copy(Tmp,9,2) + TimeSeparator + Copy(Tmp,11,2);
    B      := StrToTime(Buf);
    Result := A + B;
end;

procedure TFM_Main.RB_OneClick(Sender: TObject);
begin
  E_empno.Enabled := True;
end;

procedure TFM_Main.RB_AllClick(Sender: TObject);
begin
//  E_empno.Enabled := False;
end;

procedure TFM_Main.E_empnoEnter(Sender: TObject);
begin
  E_empno.Sql  := '';
  if ((Copy(GSGrade,3,1) = 'A') OR (Copy(GSGrade,3,1) = 'B'))  then
       E_empno.Param_deptcode := ''
  else E_empno.Param_deptcode := E_deptCode.Text;
  Retrieve;
end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
//  E_empno.Param_deptcode := E_deptCode.Text;
    if Key = Chr(13) then
    begin
        E_empno.empno := E_empno.Text;

        if All_Flag then
        begin
            E_empno.Param_deptcode  := '';
        end
        else
        begin
            E_empno.Param_deptcode  := GSdeptcode;
        end;

        //E_empno.Param_deptcode := E_deptCode.Text;
        E_empno.PL_get_singledata;
        E_deptcode.Text    := E_empno.jobdept;
        FM_Tmax           := TFM_Tmax.Create(Self);
        FM_Tmax.T_Session := TMaxSession;
        E_deptname.Text    := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;
        Key := #0;
        Retrieve;
    end;

end;

procedure TFM_Main.PL_Com_Contructor;
begin
  with QR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
    end;
end;

procedure TFM_Main.PL_Select_pkyearlt(workyy, empno : string;
                   out yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String);
begin

  with QR_com do
    begin
      PL_Com_Contructor;
      
      SQL.Add('SELECT nvl(YEARLY_CNT,0),                                                                         ');
      SQL.Add('       nvl(YEARLYPLAN_CNT,0),                                                                     ');
      SQL.Add('       PAYUTIL.GET_DUTY_CNT(EMPNO,YEARLY_YY||''0101'',YEARLY_YY||''1231'',''1'') USED_YEARLY_CNT, ');
      SQL.Add('       CASE WHEN NVL(YEARLYPLAN_CNT,0) <=0 THEN ''Y'' ELSE NVL(NOTICE_YN,''N'') END NOTICE_YN,    ');
      SQL.Add('       CASE WHEN NVL(YEARLYPLAN_CNT,0) <=0 THEN ''Y'' ELSE NVL(ASSIGN_YN,''N'') END ASSIGN_YN     ');
      //
      //SQL.Add('       NVL(NOTICE_YN,''N'') NOTICE_YN,                                                            ');
      //SQL.Add('       NVL(ASSIGN_YN,''N'') ASSIGN_YN                                                             ');
      SQL.Add('  FROM PKYEARLT                                                                                   ');
      SQL.Add(' WHERE yearly_yy = '''+workyy+''' AND empno = '''+empno+'''                                       ');
      Open;

      if(RecordCount > 0) then
      begin
          yearly_cnt        := FieldByName('field1').AsString;
          yearlyplan_cnt    := FieldByName('field2').AsString;
          used_yearly_cnt   := FieldByName('field3').AsString;
          notice_yn         := FieldByName('field4').AsString;
          assign_yn         := FieldByName('field5').AsString;
      end
      else
      begin
          yearly_cnt        := '0';
          yearlyplan_cnt    := '0';
          used_yearly_cnt   := '0';
          notice_yn         := '0';
          assign_yn         := '0';
      end;
    end;
end;


procedure TFM_Main.E_empnoReadEnded(Sender: TObject);
begin
//ReadEnded 이벤트가 없으면 콘트롤에 값을 뿌려주지 않고 그냥 skip 하는 문제 해결을 위해.
  E_empno.Param_deptcode := E_deptCode.Text;
  SB_Help.Panels[1].Text :='';
  E_deptcode.Text    := E_empno.jobdept;
  FM_Tmax            := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session  := TMaxSession;
  E_deptname.Text    := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;

  PL_Get_ConEmpno(E_empno.empno) ;
  ModifyExists;

{2014.10.28.hjku. 
  if(ModifyExists) then
  begin
       RB_Delete.Visible := true;
       RB_Modify.Left := 15;
       RB_Append.Left := 144;
       RB_Delete.Left := 273;
  end
  else
  begin
       RB_Delete.Visible := false;
       RB_Modify.Left := 43;
       RB_Append.Left := 252;
       RB_Delete.Left := 273;
  end;
 }

  //2013.07.05.hjku. 사원별 칭호 구분... 이명노M 요청
  //2013.07.29.hjku. 연차휴가 발송 관련 직함 교체 건... 이명노M 요청
  if(E_empno.empno<>'') then
  begin
      {if(E_empno.empno[1] in ['P','Q','Y']) then
         JobName := '사원'
      else JobName := 'M';}
      {2014.10.31.hjku. function으로 이동.get_jobname
      if(E_empno.payra ='D11') then
        JobName := '매니저'
      else if(E_empno.payra ='D41') then
        JobName := '비상계획관'
      else if(E_empno.payra ='D51') or
             (E_empno.payra ='D61') or
             (E_empno.payra ='H11') or
             (E_empno.payra ='K11') or
             (E_empno.payra ='O31') then
        JobName := '사원'
      else if(E_empno.payra ='D91') or
             (E_empno.payra ='H10') or
             (E_empno.payra ='H41') then
        JobName := '팀원'
      else if(E_empno.payra ='C11') or
             (E_empno.payra ='C18') then
        JobName := '팀장'
      else JobName := FM_Tmax.GetData('codename','I113',E_empno.payra);
  }      
  end
  else
  begin
      JobName := '';
  end;

  JobName        := Get_JobName(E_empno.payra);
  
  e_jobname.Text := JobName;


  ME_Regfrdate.SetFocus; 
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Main.BBdeleteClick(Sender: TObject);
begin
(*2015.01.22.hjku.. 사용안함.
    if  Trim(TDS_Grid.Fieldbyname('con_yn').AsString) = 'Y' then
    begin
          MessageDlg('결재가 완료된 자료는 삭제 할 수 없습니다.   삭제실패!!', mtInformation, [mbok], 0) ;
          System.exit;
    end;

    if TDS_Grid.FieldbyName('REGFRDATE').AsString = '' then
    begin
          MessageDlg('선택 된 자료가 없습니다.    삭제실패!!', mtInformation, [mbok], 0) ;
          System.exit;
    end;

    if MessageBox(FM_Main.HANDLE,'삭제하시겠습니까?','삭제확인',MB_YESNO) = IDYES then
    begin
        with TDS1 do
        begin
              ServiceName := 'PKA4040A_dml';
              Close;
              Sql.Clear ;
              Sql.Add ('DELETE FROM PKYEARLYMODIFY                                               ');
              Sql.Add (' WHERE APPDATE   =  ''' + TDS_Grid.FieldbyName('APPDATE').AsString+'''   ');
              Sql.Add ('   AND EMPNO     =  ''' + E_empno.empno +'''                             ');
              Sql.Add ('   AND REGFRDATE =  ''' + TDS_Grid.FieldbyName('REGFRDATE').AsString+''' ');
              Sql.Add ('   AND REGTODATE =  ''' + TDS_Grid.FieldbyName('REGTODATE').AsString+''' ');
        
        
              if Execute then
              else
              begin
                   Application.MessageBox('휴일 삭제에 실패했습니다.','작업실패',MB_OK);
                   Exit;
               end;
        end;
    end;
    Retrieve;
*)    
end;

function TFM_Main.PL_Get_Duty_Confirm(var stdate : string) : Boolean;
begin
     result := false;

     with QR_com do
     begin
          PL_Com_Contructor;

          Sql.Add ('SELECT conyn, ''field2'', ''field3'', ''field4'', ''field5'' FROM PKHDUTY          ' );
          Sql.Add ('WHERE DUYYMM           = '''+ copy(stdate,1,6) +'''                                ' );
          Sql.Add ('  AND EMPNO            = '''+ E_empno.empno    +'''                                ' );
          Sql.Add ('  AND NVL(conyn,''N'') = ''Y''                                                     ' );

//          memo1.text := sql.text;
          Open;

          if QR_com.RecordCount >= 1 then
          begin
               result := true;
          end;
     end;
end;

function TFM_Main.PL_Input_Check : Boolean;
var
     reg_yearly_cnt,reg_yearly_cnt2, mod_yearly_cnt, mod_yearly_cnt2 : real;
     tmp_dup_frdate, tmp_dup_todate : string;
begin
     result := false;

     reg_yearly_cnt  := strtofloat(NE_Reg_Yearly_Cnt.Text);
     reg_yearly_cnt2 := strtofloat(NE_Reg_Yearly_Cnt2.Text);
     mod_yearly_cnt  := strtofloat(NE_Mod_Yearly_Cnt.Text);
     mod_yearly_cnt2 := strtofloat(NE_Mod_Yearly_Cnt2.Text);


     {if (Trim(SL_Assign_Yn.text) <> 'Y') then
     begin
          if not(E_empno.empno[1] in ['P','Q','Y']) then
          begin
              MessageDlg('연차휴가 사용계획을 등록 완료 하지 않은 자료는 수정요청할 수 없습니다. ', mtInformation,[mbOk], 0);
              Exit;
          end;
     end;}

     if(GSempno<> E_empno.empno)and (not All_Flag) Then
     begin
          MessageDlg('본인자료만 연차휴가 사용/변경 처리할 수 있습니다.', mtInformation, [mbOK], 0);
          Exit;
     end;

     if strtofloat(SL_Yearly_Cnt.Text)<=0 then
     begin
          MessageDlg('등록된 사용연차가 존재하지 않습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
          result := false;
          exit;
     end;

     if (Trim(ED_hotkey.Text) = '') then
     begin
          MessageDlg('휴가 코드를 선택 해주세요. ', mtInformation,[mbOk], 0);
          ED_hotkey.SetFocus;
          Exit;
     end;

     if PL_Get_Duty_Confirm(Regfrdate) then
     begin
          MessageDlg('등록시작년월은 근태 결재된 자료입니다.', mtInformation, [mbOK], 0);
          Exit;
     end;

     if  not ( Check_DateValid(Regfrdate))  then
     begin
          MessageDlg('등록시작일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                     '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
          ME_Regfrdate.SetFocus;
          Exit;
     end;

     if  not (Check_DateValid(Regtodate))  then
     begin
          MessageDlg('등록종료일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                     '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
          ME_Regtodate.SetFocus;
          Exit;
     end;

     if   copy(Regfrdate,1,6) <> copy(Regtodate,1,6) then
     begin
          MessageDlg('등록일자는 같은 달의 범위를 신청하여야 합니다.  ', mtInformation,[mbOk], 0);
          ME_Regfrdate.SetFocus;
          Exit;
     end;

     if   (Regfrdate > Regtodate) then
     begin
          MessageDlg('등록시작일이 등록종료일보다 빨라야 합니다.', mtInformation,[mbOk], 0);
          ME_Regfrdate.SetFocus;
          Exit;
     end;

     if   (reg_yearly_cnt <=0) then
     begin
          MessageDlg('기등록일자가 유효하지 않습니다.  '+ #13 +
                     '근태 등록 내역을 확인해 보시기 바랍니다.', mtInformation,[mbOk], 0);
          ME_Regfrdate.SetFocus;
          Exit;
     end;

     if(Mod_Flag ='M') then
     begin
         if PL_Get_Duty_Confirm(Modfrdate) then
         begin
              MessageDlg('변경시작년월은 근태 결재된 자료입니다.', mtInformation, [mbOK], 0);
              Exit;
         end;

         if  not (Check_DateValid(Modfrdate))  then
         begin
              MessageDlg('변경시작일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                         '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
              ME_Modfrdate.SetFocus;
              Exit;
         end;

          if  not ( Check_DateValid(Modtodate))  then
         begin
              MessageDlg('변경종료일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                         '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
              ME_Modtodate.SetFocus;
              Exit;
         end;

         if   (Modfrdate > Modtodate) then
         begin
              MessageDlg('변경시작일이 변경종료일보다 빨라야 합니다.', mtInformation,[mbOk], 0);
              ME_Modfrdate.SetFocus;
              Exit;
         end;

         if   (mod_yearly_cnt<=0) then
         begin
              MessageDlg('변경등록일자가 유효하지 않습니다.  '+ #13 +
                         '근태 등록 내역을 확인해 보시기 바랍니다.', mtInformation,[mbOk], 0);
              ME_Modfrdate.SetFocus;
              Exit;
         end;

         if   copy(Modfrdate,1,6) <> copy(Modtodate,1,6) then
         begin
              MessageDlg('변경등록일자는 같은 달의 범위를 신청하여야 합니다.  ', mtInformation,[mbOk], 0);
              ME_Modfrdate.SetFocus;
              Exit;
         end;

         if(Regfrdate2 <>'') and (ED_hotkey.text = '63') then
         begin
              if PL_Get_Duty_Confirm(Regfrdate2) then
              begin
                   MessageDlg('등록시작년월2은 근태 결재된 자료입니다.', mtInformation, [mbOK], 0);
                   Exit;
              end;

              if  not (Check_DateValid(Regfrdate2))  then
              begin
                   MessageDlg('등록시작일2 날짜가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                              '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
                   ME_Regfrdate2.SetFocus;
                   Exit;
              end;

               if  not ( Check_DateValid(Regtodate2))  then
              begin
                   MessageDlg('등록종료일2 날짜가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                              '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
                   ME_Modtodate2.SetFocus;
                   Exit;
              end;

              if   (Regfrdate2 > Regtodate2) then
              begin
                   MessageDlg('등록시작일2이 등록종료일2보다 빨라야 합니다.', mtInformation,[mbOk], 0);
                   ME_Regfrdate2.SetFocus;
                   Exit;
              end;

              //2015.01.20.hjku. 등록일 중복오류 체크 추가..
              if(Get_DupDate(Regfrdate,Regtodate,Regfrdate2,Regtodate2, tmp_dup_frdate,tmp_dup_todate)) then
              begin
                   MessageDlg('등록일1이 등록일2와 중복되지 않아야 합니다.', mtInformation,[mbOk], 0);
                   ME_Regfrdate.SetFocus;
                   Exit;
              end;

              if   (reg_yearly_cnt2<=0) then
              begin
                   MessageDlg('등록등록일2 날짜가 유효하지 않습니다.  '+ #13 +
                              '근태 등록 내역을 확인해 보시기 바랍니다.', mtInformation,[mbOk], 0);
                   ME_Regfrdate2.SetFocus;
                   Exit;
              end;

              if   copy(Regfrdate2,1,6) <> copy(Regtodate2,1,6) then
              begin
                   MessageDlg('등록등록일2 날짜는 같은 달의 범위를 신청하여야 합니다.  ', mtInformation,[mbOk], 0);
                   ME_Regfrdate2.SetFocus;
                   Exit;
              end;
         end;
         
         if(Modfrdate2 <>'') and (ED_hotkey.text = '64') then
         begin
              if PL_Get_Duty_Confirm(Modfrdate2) then
              begin
                   MessageDlg('변경시작년월2은 근태 결재된 자료입니다.', mtInformation, [mbOK], 0);
                   Exit;
              end;

              if  not (Check_DateValid(Modfrdate2))  then
              begin
                   MessageDlg('변경시작일2 날짜가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                              '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
                   ME_Modfrdate2.SetFocus;
                   Exit;
              end;

               if  not ( Check_DateValid(Modtodate2))  then
              begin
                   MessageDlg('변경종료일2 날짜가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
                              '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
                   ME_Modtodate2.SetFocus;
                   Exit;
              end;

              if   (Modfrdate2 > Modtodate2) then
              begin
                   MessageDlg('변경시작일2이 변경종료일2보다 빨라야 합니다.', mtInformation,[mbOk], 0);
                   ME_Modfrdate2.SetFocus;
                   Exit;
              end;

              //2015.01.20.hjku. 등록일 중복오류 체크 추가..
              if(Get_DupDate(Modfrdate,Modtodate,Modfrdate2,Modtodate2, tmp_dup_frdate,tmp_dup_todate)) then
              begin
                   MessageDlg('변경일1이 변경일2와 중복되지 않아야 합니다.', mtInformation,[mbOk], 0);
                   ME_Modfrdate.SetFocus;
                   Exit;
              end;

              if   (mod_yearly_cnt2<=0) then
              begin
                   MessageDlg('변경등록일2 날짜가 유효하지 않습니다.  '+ #13 +
                              '근태 등록 내역을 확인해 보시기 바랍니다.', mtInformation,[mbOk], 0);
                   ME_Modfrdate2.SetFocus;
                   Exit;
              end;

              if   copy(Modfrdate2,1,6) <> copy(Modtodate2,1,6) then
              begin
                   MessageDlg('변경등록일2 날짜는 같은 달의 범위를 신청하여야 합니다.  ', mtInformation,[mbOk], 0);
                   ME_Modfrdate2.SetFocus;
                   Exit;
              end;
         end;

         if   (reg_yearly_cnt + reg_yearly_cnt2) <> (mod_yearly_cnt + mod_yearly_cnt2) then
         begin
              MessageDlg('등록연차일수와 변경연차일수는 동일하여야 합니다.  ', mtInformation,[mbOk], 0);
              ME_Modfrdate.SetFocus;
              Exit;
         end;

(*2015.01.21.hjku.등록일과 변경일 중복되더라도 처리 가능하도록 수정...
         //hjku check
         if  ((Regfrdate <= Modfrdate) and (Modfrdate <= Regtodate))
           or((Regfrdate <= Modtodate) and (Modtodate <= Regtodate)) then
         begin
              MessageDlg('등록일과 변경일이 중복되었습니다.  ', mtInformation,[mbOk], 0);
              ME_Regfrdate.SetFocus;
              Exit;
         end;
*)
          if not PL_Yearly_Check((reg_yearly_cnt+reg_yearly_cnt2),(mod_yearly_cnt+mod_yearly_cnt2)) then
          begin
               MessageDlg('사용가능한 연차일을 초과하였습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
               result := false;
               exit;
          end;
     end
     else if(Mod_Flag ='I') then
     begin
          if not PL_Yearly_Check(0,reg_yearly_cnt) then
          begin
               MessageDlg('사용가능한 연차일을 초과하였습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
               result := false;
               exit;
          end;
     end
     else if(Mod_Flag ='D') then
     begin
          if not PL_Yearly_Check(reg_yearly_cnt,0) then
          begin
               MessageDlg('연차사용일수는 연차사용목표보다 작을 수 없습니다.', mtInformation, [mbok], 0) ;
               result := false;
               exit;
          end;
     end;

     result := true;
end;

function TFM_Main.PL_Cancel_Input_Check : Boolean;
var
     reg_yearly_cnt,reg_yearly_cnt2, mod_yearly_cnt, mod_yearly_cnt2 : real;
begin
  result := false;

  reg_yearly_cnt  := strtofloat(NE_Reg_Yearly_Cnt.Text);
  reg_yearly_cnt2 := strtofloat(NE_Reg_Yearly_Cnt2.Text);
  mod_yearly_cnt  := strtofloat(NE_Mod_Yearly_Cnt.Text);
  mod_yearly_cnt2 := strtofloat(NE_Mod_Yearly_Cnt2.Text);

  if(GSempno<> E_empno.empno)and (not All_Flag) Then
  begin
    MessageDlg('본인자료만 연차휴가 취소 처리할 수 있습니다.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if   (trim(GSYear) <> '2016')then
  begin
    MessageDlg('2016년 자료만 연차 취소 할 수 있습니다.  ', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  if   (copy(Regfrdate,5,2) <> '12') or (copy(Regtodate,5,2) <> '12') then
  begin
    MessageDlg('12월 자료만 연차 취소 할 수 있습니다.  ', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  if PL_Get_Duty_Confirm(Regfrdate) then
  begin
    MessageDlg('등록시작년월은 근태 결재된 자료입니다.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if  not ( Check_DateValid(Regfrdate))  then
  begin
    MessageDlg('등록시작일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
               '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  if  not (Check_DateValid(Regtodate))  then
  begin
    MessageDlg('등록종료일자가 유효 하지 않거나 근태등록마감된 날짜입니다.'+#13#10 +
               '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
    ME_Regtodate.SetFocus;
    Exit;
  end;

  if   copy(Regfrdate,1,6) <> copy(Regtodate,1,6) then
  begin
    MessageDlg('등록일자는 같은 달의 범위를 신청하여야 합니다.  ', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  if   (Regfrdate > Regtodate) then
  begin
    MessageDlg('등록시작일이 등록종료일보다 빨라야 합니다.', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  if   (reg_yearly_cnt <=0) then
  begin
    MessageDlg('기등록일자가 유효하지 않습니다.  '+ #13 +
               '근태 등록 내역을 확인해 보시기 바랍니다.', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    Exit;
  end;

  result := true;
end;


procedure TFM_Main.BBsaveClick(Sender: TObject);
var
   FL_Date: String;
   FL_Date2: String;
   FL_Date3: Real;
   CmdStr,vProgId, vRundate,vMessage : String;
   update_list, insert_list, column_list :string;
   update_list2, insert_list2, column_list2 :string;   
   yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String;
begin
     //화면 입력값 계산
     ED_hotkeyChange(self);

     //연차 사용 내역 재확인
     PL_Select_Pkyearlt(GSYear,E_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);
     SL_Yearly_Cnt.text      := yearly_cnt;
     SL_YearlyPlan_Cnt.text  := yearlyplan_cnt;
     SL_Used_Yearly_Cnt.text := used_yearly_cnt;
     SL_Assign_Yn.Text       := assign_yn;

     //입력 값 점검
     if not PL_Input_Check then exit;

     //중복 등록 점검
     with QR_com do
     begin
         PL_Com_Contructor;

         if(MOD_FLAG='M') then
         begin
             //2014.11.03.hjku. 변경일 경우 미결재 취소가 있는 지 확인후 변경...
             Sql.Add ('SELECT CON_YN, ''field2'', ''field3'', ''field4'', ''field5'' FROM PKYEARLYMODIFY  ' );
             Sql.Add (' WHERE EMPNO ='''+ E_empno.empno +'''                                              ' );
             Sql.Add ('   AND (   (MOD_FLAG = ''D''                                                       ' );
             Sql.Add ('            AND nvl(CON_YN,''N'')=''N''                                            ' );
             Sql.Add ('            AND (   '''+ Regfrdate +''' between REGFRDATE and REGTODATE            ' );
             Sql.Add ('                 OR '''+ Regtodate +''' between REGFRDATE and REGTODATE))          ' );
             Sql.Add ('        OR (    APPDATE  = '''+ copy(GSdate,1,8) +'''                              ' );
             Sql.Add ('            AND MOD_FLAG = '''+ Mod_flag         +'''                              ' );
             Sql.Add ('            AND REGFRDATE= '''+ Regfrdate        +'''                              ' );
             Sql.Add ('            AND REGTODATE= '''+ Regtodate        +'''))                            ' );

//             memo1.text := sql.text;

             Open;

             if QR_com.RecordCount >= 1 then
             begin
                  MessageDlg('같은 기간내의 미결재중인 취소 연차가 있거나, '+#13#10+
                             '같은 기간에 등록된 변경 연차휴일이 있습니다', mtInformation, [mbok], 0) ;
                  SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
                  System.Exit;
             end;
         end
         else
         begin
             //2013.08.01.hjku. 결재하지 않고 등록시 반영으로 반경... 이명노M 요청
             Sql.Add ('SELECT CON_YN, ''field2'', ''field3'', ''field4'', ''field5'' FROM PKYEARLYMODIFY  ' );
             Sql.Add ('WHERE APPDATE  = '''+ copy(GSdate,1,8) +'''                                        ' );
             Sql.Add ('  AND EMPNO    = '''+ E_empno.empno    +'''                                        ' );
             Sql.Add ('  AND MOD_FLAG = '''+ Mod_flag         +'''                                        ' );
             Sql.Add ('  AND REGFRDATE= '''+ Regfrdate        +'''                                        ' );
             Sql.Add ('  AND REGTODATE= '''+ Regtodate        +'''                                        ' );             

             Open;

             if QR_com.RecordCount >= 1 then
             begin
                  MessageDlg('같은 기간에 등록된 휴일이 있습니다 .확인후에 등록 해 주세요. 저장실패!!', mtInformation, [mbok], 0) ;
                  SB_help.Panels[1].Text := '같은 기간에 등록된 휴일이 있습니다 .확인후에 등록 해 주세요..';

                  System.Exit;
             end;
         end;
     end;

     //DB 반영
     if MessageBox(FM_Main.HANDLE,'저장하시겠습니까?','저장확인',MB_YESNO) = IDYES then
     begin
          SendProgID  := 'PKA4058A';
          SendEmpno   := E_empno.empno;
          RcveEmpno   := GSConEmpno;
          ReceiveYN   := 'N';

          if(MOD_FLAG='I') then
          begin
              Modfrdate              := '';
              Modtodate              := '';
              NE_Mod_Yearly_Cnt.Text := '0';

              MailSubject := ' [구성원 연차휴가 사용신청]';
              MailBody    := E_empno.korname + JobName + '(이)가 아래와 같이 연차휴가를 사용하고자 하여 안내드립니다.' + #13#10 + #13#10 +
                             '추가 사용 희망일 : ' + copy(Regfrdate,1,4)+'년 ' +copy(Regfrdate,5,2)+'월 ' +copy(Regfrdate,7,2)+'일' + ' ~ ' +
                                                     copy(Regtodate,1,4)+'년 ' +copy(Regtodate,5,2)+'월 ' +copy(Regtodate,7,2)+'일' +
                                                     '('+NE_Reg_Yearly_Cnt.Text+'일) ' + #13#10 ;
                            //'검토하시어 승인 여부를 결정하여 주시기 바랍니다.' + #13#10 +
                            //'(경로 : 종합인사시스템>인사/인력개발>근태/초과근무/휴가>연차휴가 사용/변경)'; //메일내용
          end
          else if(MOD_FLAG='M') then
          begin
              MailSubject := '[구성원 연차휴가 사용계획 변경]';

              if(Regfrdate2<>'') then
              begin
                   MailBody    := E_empno.korname + JobName + '의 기등록한 연차휴가 사용계획을 아래와 같이 변경하였음을 안내드립니다.' + #13#10 + #13#10 +
                                  '변경전 : ' + copy(Regfrdate,1,4)+'년 '  +copy(Regfrdate,5,2)+'월 '  +copy(Regfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Regtodate,1,4)+'년 '  +copy(Regtodate,5,2)+'월 '  +copy(Regtodate,7,2)+'일' +
                                                '('+NE_Reg_Yearly_Cnt.Text+'일), ' + #13#10 +
                                  '         ' + copy(Regfrdate2,1,4)+'년 ' +copy(Regfrdate2,5,2)+'월 ' +copy(Regfrdate2,7,2)+'일' + ' ~ '   +
                                                copy(Regtodate2,1,4)+'년 ' +copy(Regtodate2,5,2)+'월 ' +copy(Regtodate2,7,2)+'일' +
                                                '('+NE_Reg_Yearly_Cnt2.Text+'일) ' + #13#10 +
                                  '변경후 : ' + copy(Modfrdate,1,4)+'년 '  +copy(Modfrdate,5,2)+'월 '  +copy(Modfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Modtodate,1,4)+'년 '  +copy(Modtodate,5,2)+'월 '  +copy(Modtodate,7,2)+'일' +
                                                '('+NE_Mod_Yearly_Cnt.Text+'일)' + #13#10  ;

                                 //'검토하시어 승인 여부를 결정하여 주시기 바랍니다.' + #13#10 +
                                 //'(경로 : 종합인사시스템>인사/인력개발>근태/초과근무/휴가>연차휴가 사용/변경)'; //메일내용
              end
              else if(Modfrdate2<>'') then
              begin
                   MailBody    := E_empno.korname + JobName + '의 기등록한 연차휴가 사용계획을 아래와 같이 변경하였음을 안내드립니다.' + #13#10 + #13#10 +
                                  '변경전 : ' + copy(Regfrdate,1,4)+'년 '  +copy(Regfrdate,5,2)+'월 '  +copy(Regfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Regtodate,1,4)+'년 '  +copy(Regtodate,5,2)+'월 '  +copy(Regtodate,7,2)+'일' +
                                                '('+NE_Reg_Yearly_Cnt.Text+'일) ' + #13#10 +
                                  '변경후 : ' + copy(Modfrdate,1,4)+'년 '  +copy(Modfrdate,5,2)+'월 '  +copy(Modfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Modtodate,1,4)+'년 '  +copy(Modtodate,5,2)+'월 '  +copy(Modtodate,7,2)+'일' +
                                                '('+NE_Mod_Yearly_Cnt.Text+'일),' + #13#10 +
                                  '         ' + copy(Modfrdate2,1,4)+'년 ' +copy(Modfrdate2,5,2)+'월 ' +copy(Modfrdate2,7,2)+'일' + ' ~ '   +
                                                copy(Modtodate2,1,4)+'년 ' +copy(Modtodate2,5,2)+'월 ' +copy(Modtodate2,7,2)+'일' +
                                                '('+NE_Mod_Yearly_Cnt2.Text+'일) ' + #13#10 ;

                                 //'검토하시어 승인 여부를 결정하여 주시기 바랍니다.' + #13#10 +
                                 //'(경로 : 종합인사시스템>인사/인력개발>근태/초과근무/휴가>연차휴가 사용/변경)'; //메일내용
              end
              else
              begin
                   MailBody    := E_empno.korname + JobName + '의 기등록한 연차휴가 사용계획을 아래와 같이 변경하였음을 안내드립니다.' + #13#10 + #13#10 +
                                  '변경전 : ' + copy(Regfrdate,1,4)+'년 ' +copy(Regfrdate,5,2)+'월 ' +copy(Regfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Regtodate,1,4)+'년 ' +copy(Regtodate,5,2)+'월 ' +copy(Regtodate,7,2)+'일' +
                                                '('+NE_Reg_Yearly_Cnt.Text+'일) ' + #13#10 +
                                  '변경후 : ' + copy(Modfrdate,1,4)+'년 ' +copy(Modfrdate,5,2)+'월 ' +copy(Modfrdate,7,2)+'일' + ' ~ '   +
                                                copy(Modtodate,1,4)+'년 ' +copy(Modtodate,5,2)+'월 ' +copy(Modtodate,7,2)+'일' +
                                                '('+NE_Mod_Yearly_Cnt.Text+'일) ' + #13#10 ;

                                 //'검토하시어 승인 여부를 결정하여 주시기 바랍니다.' + #13#10 +
                                 //'(경로 : 종합인사시스템>인사/인력개발>근태/초과근무/휴가>연차휴가 사용/변경)'; //메일내용
              end;
          end
          else if(MOD_FLAG='D') then
          begin
              Modfrdate              := '';
              Modtodate              := '';
              NE_Mod_Yearly_Cnt.Text := '0';

              MailSubject := ' [구성원 연차휴가 사용계획 취소]';
              MailBody    := E_empno.korname + JobName + '(이)가 아래와 같이 연차휴가를 취소하여 안내드립니다.' + #13#10 + #13#10 +
                             '취소일 : ' + copy(Regfrdate,1,4)+'년 ' +copy(Regfrdate,5,2)+'월 ' +copy(Regfrdate,7,2)+'일 ' + ' ~ ' +
                                                     copy(Regtodate,1,4)+'년 ' +copy(Regtodate,5,2)+'월 ' +copy(Regtodate,7,2)+'일 ' +
                                                     '('+NE_Reg_Yearly_Cnt.Text+'일) ' + #13#10 ;
                            //'검토하시어 승인 여부를 결정하여 주시기 바랍니다.' + #13#10 +
                            //'(경로 : 종합인사시스템>인사/인력개발>근태/초과근무/휴가>연차휴가 사용/변경)'; //메일내용
          end;

          if(Mod_flag='M') then
          begin
              if not Make_Query(E_empno.empno,Regfrdate,Regtodate,'', '1', update_list, insert_list, column_list) then
              begin
                   MessageDlg('기등록한 근태를 확인해 보시기 바랍니다... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
              if not Update_Query(E_empno.empno,Regfrdate,Regtodate, '1', update_list, insert_list, column_list) then
              begin
                   MessageDlg('변경일 연차 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;

              if(Regfrdate2<>'') then
              begin
                   if not Make_Query(E_empno.empno,Regfrdate2,Regtodate2,'', '1', update_list, insert_list, column_list) then
                   begin
                        MessageDlg('등록일2 날짜의 근태를 확인해 보시기 바랍니다... 저장실패!!', mtInformation, [mbok], 0) ;
                        exit;
                   end;
                   if not Update_Query(E_empno.empno,Regfrdate2,Regtodate2, '1', update_list, insert_list, column_list) then
                   begin
                        MessageDlg('등록일2 연차 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                        exit;
                   end;
              end;

              if not Make_Query(E_empno.empno,Modfrdate,  Modtodate,  ED_hotkey.Text, '2', update_list,  insert_list,  column_list)
              then
              begin
                   MessageDlg('변경일 날짜의 근태를 확인해 보시기 바랍니다... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
              if not Update_Query(E_empno.empno,Modfrdate,Modtodate, '2', update_list, insert_list, column_list) then
              begin
                  MessageDlg('변경일 날짜의 연차 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                  exit;
              end;

              if(Modfrdate2<>'') then
              begin
                   if not Make_Query(E_empno.empno,Modfrdate2,Modtodate2,ED_hotkey.Text, '2', update_list, insert_list, column_list) then
                   begin
                        MessageDlg('변경일2 날짜의 근태를 확인해 보시기 바랍니다... 저장실패!!', mtInformation, [mbok], 0) ;
                        exit;
                   end;
                   if not Update_Query(E_empno.empno,Modfrdate2,Modtodate2, '2', update_list, insert_list, column_list) then
                   begin
                        MessageDlg('변경일2 날짜의 연차 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                        exit;
                   end;
              end;



          end
          else if(Mod_flag='I') then
          begin
              if not Make_Query(E_empno.empno,Regfrdate,Regtodate,ED_hotkey.Text, '2', update_list, insert_list, column_list) then
              begin
                   MessageDlg('연차휴가 쿼리 생성 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
              if not Update_Query(E_empno.empno,Regfrdate,Regtodate, '2', update_list, insert_list, column_list) then
              begin
                   MessageDlg('연차휴가 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
          end
          else if(Mod_flag='D') then
          begin
              if not Make_Query(E_empno.empno,Regfrdate,Regtodate,'', '1', update_list, insert_list, column_list) then
              begin
                   MessageDlg('연차휴가 쿼리 생성 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
              if not Update_Query(E_empno.empno,Regfrdate,Regtodate, '1', update_list, insert_list, column_list) then
              begin
                   MessageDlg('연차휴가 반영 오류... 저장실패!!', mtInformation, [mbok], 0) ;
                   exit;
              end;
          end;


          with TDS1 do   //tds_grid3
          begin
                ServiceName := 'PKA4040A_dml';
                Close;
                Sql.Clear ;

                Sql.Add(' INSERT INTO PKYEARLYMODIFY(APPDATE, EMPNO, KORNAME,MOD_FLAG,                                                          ');
                Sql.Add('                            REGFRDATE, REGTODATE, REGYEARLY_CNT,                                                       ');
                Sql.Add('                            REGFRDATE2, REGTODATE2, REGYEARLY_CNT2,                                                    ');                
                Sql.Add('                            MODFRDATE, MODTODATE, MODYEARLY_CNT,                                                       ');
                Sql.Add('                            MODFRDATE2, MODTODATE2, MODYEARLY_CNT2, DUTYCODE, EEMPNO, CON_YN, WRITEEMPNO, WRITETIME)   ');
                Sql.Add(' VALUES                                                                                                                ');
                Sql.Add('       ('''+GSDate+''',    '''+ E_empno.empno+''', '''+E_empno.korname+''', '''+Mod_flag+''',                          ');
                Sql.Add('        '''+Regfrdate+''',                                                                                             ');
                Sql.Add('        '''+Regtodate+''',                                                                                             ');
                Sql.Add('        '''+NE_Reg_Yearly_Cnt.Text+''',                                                                                ');
                Sql.Add('        '''+Regfrdate2+''',                                                                                            ');
                Sql.Add('        '''+Regtodate2+''',                                                                                            ');
                Sql.Add('        '''+NE_Reg_Yearly_Cnt2.Text+''',                                                                               ');
                Sql.Add('        '''+Modfrdate +''',                                                                                            ');
                Sql.Add('        '''+Modtodate +''',                                                                                            ');
                Sql.Add('        '''+NE_Mod_Yearly_Cnt.Text+''',                                                                                ');
                Sql.Add('        '''+Modfrdate2+''',                                                                                            ');
                Sql.Add('        '''+Modtodate2+''',                                                                                            ');
                Sql.Add('        '''+NE_Mod_Yearly_Cnt2.Text+''',                                                                               ');
                Sql.Add('        '''+ ED_hotkey.Text+''','''+GSConEmpno+''',''Y'',                                                              ');
                Sql.Add('        '''+GSempno+''', to_char(sysdate,''YYYYMMDDHH24MISS''))                                                      ');

//                Memo2.text := sql.text;

               try
                   Execute
               except
                   Application.MessageBox('연차휴가 변경신청이 실패했습니다.','작업실패',MB_OK);
                   Exit;
               end;
          end;

          if(Mod_flag<>'D') then
          begin
              if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
              begin
                  {if(GSrcvtel<>'') then
                  begin
                      //등록완료 문자전송
                      vProgId           := 'pksendsms';

                      FM_Tmax           := TFM_Tmax.Create(Self);
                      FM_Tmax.T_Session := FM_main.TMaxSession;

                      vRundate          := FM_Tmax.GetData('sysdate' ,'','');
                      vMessage          := '"'+E_empno.korname+'('+E_empno.empno+')"';

                      CmdStr := '/hper/insa/HINSA/proc/bin/Kbin/pksendsms'+' '
                                +E_empno.empno+' '+vProgId+' '+vRundate+' '+GSrcvtel+' '+GSsndtel+' '+vMessage+' '+'2';

                      with QR_com do
                      begin
                           Close;
                           ServiceName := 'HINSA_batch';
                           ClearFieldInfo;
                           ClearParamInfo;
                           AddParam('cmdstr', 300, CmdStr);
                           Execute;    //실제 SMS 전송실행.

                           Close;
                           ServiceName := 'SHR0SSEL';
                           ClearFieldInfo;
                           ClearParamInfo;
                           AddField('RESULT', ftString, 5000);
                           Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                                              ' WHERE RUNDATE = ''%s''     '+
                                              '   AND PROGID  = ''%s''     '+
                                              ' ORDER BY to_number(SEQNO)  ',[vRundate, vProgId]);
                           Open;

                           Memo1.Clear;
                           while not Eof do
                           begin
                                Memo1.Lines.Add(FieldByName('RESULT').AsString);
                                Next;
                           end;

                      end; //with TDS_batch do ////////////////////////////////////////////////
                      MessageDlg('연차휴가 사용계획 변경 메일/문자 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
                  end
                  else
                  begin
                      MessageDlg('연차휴가 사용계획 변경 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
                  end;}
                  MessageDlg('연차휴가 사용계획 변경 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
              end
              else
              begin
                   MessageDlg('연차휴가 사용계획 변경 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                   exit;
              end;
          end;
          Initialize;
    end;
    Retrieve;

end;

procedure TFM_Main.PL_Get_ConEmpno(P_empno : String);
var
  FL_Sql : String;
begin
    try
        GSConEmpno := '';
        GSSndtel   := '';
        GSRcvtel   := '';

        with QR_Com do
        begin
            PL_Com_Contructor;
            FL_Sql := 'SELECT eempno,                '+
                      '       (select retcont from pimpmas where a.empno  = empno) sndtel,            '+
                      '       (select retcont from pimpmas where a.eempno = empno) rcvtel,            '+
                      '       ''field4'',            '+
                      '       ''field5''             '+
                      '  FROM pimeemp  a               '+
                      ' WHERE empno  = ''%s''        ';
            Sql.Text := Format(FL_Sql,[P_empno]);
            Open;
            GSConEmpno := Trim(FieldByName('field1').AsString);
            GSSndtel   := RemoveChar(Trim(FieldByName('field2').AsString),'-');
            GSRcvtel   := RemoveChar(Trim(FieldByName('field3').AsString),'-');
            Close;
        end;
    except
    end;
end;


procedure TFM_Main.FormShow(Sender: TObject);
var
   SqlText , C_DATE: String;
begin

  SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
  SendMessage(SB_help.handle,WM_PAINT,0,0);

  with QR_com do
  begin
    PL_Com_Contructor;
    Sql.Add ('Select Eempno , ''field2'', ''field3'', ''field4'', ''field5'' ');
    Sql.Add ('  from pimeemp            ');
    Sql.Add (' where Eempno   = '''+ GSempno +'''  ');

    Open;

    if QR_com.RecordCount = 0 then
    begin
      E_deptcode.Enabled  := False;
      E_deptname.Enabled  := False;
      E_empno.Enabled     := False;
    end;
  end;

  if ((Copy(GSGrade,3,1) = 'A') OR (Copy(GSGrade,3,1) = 'B'))  then
  begin
//    BT_app.Visible   := True;
//    BT_appno.Visible := True;
    E_empno.Enabled  := True;
    E_empno.Text     := GSempno;
    E_empno.empno    := E_empno.Text;
    E_empno.PL_get_singledata;
  end
  else if (QR_com.FieldByName('field1').AsString <> '')  then
  begin
//    BT_app.Visible   := True;
//    BT_appno.Visible := True;
    E_empno.Enabled  := True;
    E_empno.text     := GSempno;

    E_empno.Text := GSempno;
    E_empno.Sql  := 'SELECT A.empno,   A.korname,    A.paycl,   A.payra,   A.orgnum,   A.deptcode, A.pstate,  '+
                    '       D.codename payraname,    C.codename payclname, B.deptname, B.deptna3,  B.extcode, '+
                    '       A.empdate, A.orgempdate, A.juminid, A.jobdept                                     '+
                    '  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                        '+
                    ' WHERE D.codeid(+) = ''I113''                                                            '+
                    '   AND A.payra     = D.codeno(+)                                                         '+
                    '   AND C.codeid(+) = ''I112''                                                            '+
                    '   AND A.paycl     = C.codeno(+)                                                         '+
                    '   AND A.orgnum    = B.orgnum(+)                                                         '+
                    '   AND A.jobdept   = B.deptcode(+)                                                       '+
                    '   AND (A.empno    = ''%s'' OR A.korname = ''%s'') ';

    E_empno.empno := E_empno.Text;
    E_empno.PL_get_singledata;
  end
  else
  begin
    E_empno.Enabled := False;
    E_empno.empno := GSempno;
    E_empno.Text  := GSempno;
    E_empno.PL_get_singledata;
  end;

  GSorgnum            := E_empno.orgnum;
  GSdeptcode          := E_empno.jobdept;
  GSdeptcode2         := E_empno.jobdept;
  E_deptcode.Text     := E_empno.jobdept;

  FM_Tmax             := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session   := TMaxSession;

  if(GSorgnum='') then GSorgnum   := FM_Tmax.GetData('orgnum','','');

  E_deptname.Text     := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);

  {2016.12.19.hjku.. 연차휴가 등록취소 시행... 김진호M 요청
  //2016.02.03.hjku.. 1~7월은 신규신청우선, 8월이휴 변경 우선.. 김진호M 요청
  if(('0110'<=Copy(GSdate,5,4)) and (Copy(GSdate,5,4)<='0731')) then
  begin
    RB_Modify.Left := 289;
    RB_Append.Left := 70;
    RB_Append.Checked := true;
  end
  else
  begin
    RB_Modify.Left := 70;
    RB_Append.Left := 289;
    RB_Modify.Checked := true;
  end;
  }
{2014.10.28.hjku.
  if(ModifyExists) then
  begin
       RB_Delete.Visible := true;
       RB_Modify.Left := 15;
       RB_Append.Left := 144;
       RB_Delete.Left := 273;
  end
  else
  begin
       RB_Delete.Visible := false;
       RB_Modify.Left := 43;
       RB_Append.Left := 252;
       RB_Delete.Left := 273;
  end;
}

  RB_Delete.Visible := true;
  RB_Delete.Checked := true;
  RB_Modify.Visible := false;
  RB_Append.Visible := false;
  RB_Delete.Left := 119;

  if not(ModifyExists) and (not All_Flag) and (Gsempno <> GSConEmpno) then
  begin
    //RB_Delete.Visible := false;

    MessageDlg('연차휴가 등록취소 대상자가 아닙니다.', mtInformation, [mbok], 0) ;
    SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
    Application.Terminate;
    Exit;
  end;

  Retrieve;
end;

procedure TFM_Main.E_empnoChange(Sender: TObject);
begin
  //edit1.text := e_empno.paycl;
  TDS_Grid.Close;
  if ((Copy(GSGrade,3,1) = 'A') OR (Copy(GSGrade,3,1) = 'B'))  then
      E_empno.Param_deptcode := ''
  else
      E_empno.Param_deptcode := E_deptCode.Text;
end;

procedure TFM_Main.ME_RegfrdateButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    ME_Regfrdate.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
  Finally
    calendar.Free;
  End;
end;

procedure TFM_Main.ME_RegtodateButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    ME_Regtodate.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
  Finally
    calendar.Free;
  End;
end;

procedure TFM_Main.ED_hotkeyCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CCodeForm.CodeNo <> '' then
  begin
      ED_hotkey.Text      := CCodeForm.CodeNo;
      ED_hotkeyname.Text  := CCodeForm.CodeName;
  end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.ED_hotkeyInitPopup(Sender: TObject);
begin
  CcodeForm.Edit     := TOnWinPopupEdit(Sender);

  CcodeForm.CodeSql1 :='SELECT  CODENO , CODENAME  '+
                       '  FROM  PYCCODE            '+
                       ' WHERE  CODEID =''Y112''   '+
                       '   AND  CODENO IN (''63'',''64'' )              '+
                       'ORDER BY CODENO    ';

  CCodeForm.CodeKind.Caption       := '[연차코드조회]';
  TOnWinPopupEdit(Sender).PopupControl := CCodeForm ;
end;

function TFM_Main.Make_Query(v_empno,stdate,todate,dutycode, flag : string;out update_list, insert_list, column_list :string):boolean;
var
 i,j,k : integer;
 holi_insert_list, holi_column_list : String;
begin
//flag 1: 연차, 2:평일 조회

  result := false;

  update_list      := '';
  insert_list      := '';
  column_list      := '';
  holi_insert_list := '';
  holi_column_list := '';

  with TDS1 do
  begin
    Close;
    ServiceName := 'HINSA_select4';
    ClearFieldInfo;
    AddField('YYYYMMDD'  , ftString, 100);
    AddField('EMPNO'     , ftString, 100);
    AddField('DUTYCODE'  , ftString, 100);
    AddField('field4'    , ftString, 100);
    AddField('field5'    , ftString, 100);

    Sql.Clear;

    SQL.Add('SELECT YYYYMMDD, EMPNO, DUTYCODE, '''' field4, '''' field5 from (                                                                                                                                           ');
    SQL.Add('    SELECT                                                                                                                                                                                                  ');
    SQL.Add('          A.YYYYMMDD,                                                                                                                                                                                       ');
    SQL.Add('          EMPNO,                                                                                                                                                                           ');
    SQL.Add('          CASE WHEN DUTYCODE IS NULL                                                                                                                                                                        ');
    SQL.Add('               THEN (CASE WHEN A.DAYCODE IN (''1'',''7'') OR B.HOLIDATE IS NOT NULL                                                                                                                         ');
    SQL.Add('                          THEN ''49''                                                                                                                                                                       ');
    SQL.Add('                          ELSE ''99'' END)                                                                                                                                                                  ');
    SQL.Add('               ELSE DUTYCODE END DUTYCODE                                                                                                                                                                   ');
    SQL.Add('      FROM                                                                                                                                                                                                  ');
    SQL.Add('          PKHCALDAYS A,                                                                                                                                                                                     ');
    SQL.Add('          PKCHOLI B,                                                                                                                                                                                        ');
    SQL.Add('          (                                                                                                                                                                                                 ');
    SQL.Add('           SELECT DUYYMM||''01'' DUTYYYMMDD, EMPNO,  DD1 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''02'' DUTYYYMMDD, EMPNO,  DD2 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''03'' DUTYYYMMDD, EMPNO,  DD3 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''04'' DUTYYYMMDD, EMPNO,  DD4 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''05'' DUTYYYMMDD, EMPNO,  DD5 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''06'' DUTYYYMMDD, EMPNO,  DD6 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''07'' DUTYYYMMDD, EMPNO,  DD7 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''08'' DUTYYYMMDD, EMPNO,  DD8 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''09'' DUTYYYMMDD, EMPNO,  DD9 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''10'' DUTYYYMMDD, EMPNO, DD10 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''11'' DUTYYYMMDD, EMPNO, DD11 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''12'' DUTYYYMMDD, EMPNO, DD12 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''13'' DUTYYYMMDD, EMPNO, DD13 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''14'' DUTYYYMMDD, EMPNO, DD14 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''15'' DUTYYYMMDD, EMPNO, DD15 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''16'' DUTYYYMMDD, EMPNO, DD16 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''17'' DUTYYYMMDD, EMPNO, DD17 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''18'' DUTYYYMMDD, EMPNO, DD18 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''19'' DUTYYYMMDD, EMPNO, DD19 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''20'' DUTYYYMMDD, EMPNO, DD20 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''21'' DUTYYYMMDD, EMPNO, DD21 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''22'' DUTYYYMMDD, EMPNO, DD22 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''23'' DUTYYYMMDD, EMPNO, DD23 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''24'' DUTYYYMMDD, EMPNO, DD24 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''25'' DUTYYYMMDD, EMPNO, DD25 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''26'' DUTYYYMMDD, EMPNO, DD26 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''27'' DUTYYYMMDD, EMPNO, DD27 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''28'' DUTYYYMMDD, EMPNO, DD28 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''29'' DUTYYYMMDD, EMPNO, DD29 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''30'' DUTYYYMMDD, EMPNO, DD30 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + ''' UNION ALL  ');
    SQL.Add('           SELECT DUYYMM||''31'' DUTYYYMMDD, EMPNO, DD31 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(''' + stdate + ''',1,6) AND SUBSTR(''' + todate + ''',1,6) AND EMPNO=''' + v_empno + '''            ');
    SQL.Add('          )C                                                                                                                                                                                                ');
    SQL.Add('       WHERE A.YYYYMMDD BETWEEN ''' + stdate + ''' AND ''' + todate + '''                                                                                                                                   ');
    SQL.Add('         AND A.YYYYMMDD = B.HOLIDATE(+)                                                                                                                                                                     ');
    SQL.Add('         AND A.YYYYMMDD = C.DUTYYYMMDD(+)                                                                                                                                                                   ');
    SQL.Add(')                                                                                                                                                                                                           ');

    if(flag='1') then
       Sql.Add (' WHERE DUTYCODE in (''63'',''64'')                        ' )
    else if(flag='2') then
       Sql.Add (' WHERE DUTYCODE in (''00'',''99'')                        ' )

        (*2015.01.27.hjku.. 사용안함..
    else if(flag='3') then
       Sql.Add (' WHERE DUTYCODE in (''63'',''64'',''00'',''99'')          ' )
*)
       ;

    //memo1.text := sql.text;
    Open;

    TDS1.First;

    if(TDS1.RecordCount <=0) then exit;

    for i := 1 to TDS1.RecordCount do
    begin
      j := strtoint(copy(TDS1.FieldbyName('YYYYMMDD').AsString,7,2));

      if(flag='1') then
      begin
        //2013.11.21.hjku. 요청서(SR-1311-0745):연차휴가 사용계획일 변경 시, 기존 연차휴가일은 자동으로 '정상' 처리 구현

        if(copy(stdate,1,6)<=copy(GSdate,1,6))and(copy(stdate,1,6)>copy(Knteyymm,1,6)) then
        begin
          update_list := update_list + 'DD'+inttostr(j)+' =''00'', ';
          insert_list := insert_list + ' ''00'', ';
          column_list := column_list + 'DD'+inttostr(j)+', ';
        end
        else
        begin
          update_list := update_list + 'DD'+inttostr(j)+' =''00'', ';
          insert_list := insert_list + ' ''00'', ';
          column_list := column_list + 'DD'+inttostr(j)+', ';
        end;
      end
      else if(flag='2') then
      begin
        update_list := update_list + 'DD'+inttostr(j)+' ='''+dutycode+''', ';
        insert_list := insert_list + ' '''+dutycode+''', ';
        column_list := column_list + 'DD'+inttostr(j)+', ';
      end;

      TDS1.Next;
    end;
  end;

  // insert시 휴일정보가 반영되도록
  with QR_com do
  begin
    PL_Com_Contructor;

    SQL.ADD('    SELECT A.YYYYMMDD, ''field2'', ''field3'', ''field4'', ''field5''                                         ');
    SQL.ADD('      FROM PKHCALDAYS A,                                                                                      ');
    SQL.ADD('           PKCHOLI B                                                                                          ');
    SQL.ADD('     WHERE A.YYYYMMDD = B.HOLIDATE(+)                                                                         ');
    SQL.ADD('       AND A.YYYYMM   = ''' + copy(stdate,1,6) +'''                                                           ');
    SQL.ADD('       AND (CASE WHEN A.DAYCODE IN (''1'',''7'') OR B.HOLIDATE IS NOT NULL                                    ');
    SQL.ADD('                 THEN ''49''                                                                                  ');
    SQL.ADD('                 ELSE ''99'' END)=''49''                                                                      ');
    Open;

    QR_com.First;

    if(QR_com.RecordCount > 0) then
    begin
      for i := 1 to QR_com.RecordCount do
      begin
        j := strtoint(copy(QR_com.FieldbyName('field1').AsString,7,2));

        if(flag='1') then
        begin
          holi_insert_list := holi_insert_list + ' ''49'', ';
          holi_column_list := holi_column_list + 'DD'+inttostr(j)+', ';
        end
        else if(flag='2') then
        begin
          holi_insert_list := holi_insert_list + ' ''49'', ';
          holi_column_list := holi_column_list + 'DD'+inttostr(j)+', ';
        end;

        QR_com.Next;
      end;
    end;
    insert_list := insert_list + holi_insert_list;
    column_list := column_list + holi_column_list;
  end;

  result := true;
end;

function TFM_Main.Update_Query(v_empno,stdate,todate, flag, update_list, insert_list, column_list :string):boolean;
begin
  result := false;

  with TDS1 do   //TDS_Grid3
  begin
    ServiceName := 'PKA4040A_dml';
    Close;
    Sql.Clear ;
{
    Sql.Add ('MERGE INTO PKHDUTY P                                                                                                         ');
    Sql.Add ('      USING DUAL                                                                                                             ');
    Sql.Add ('         ON (DUYYMM = '''+copy(stdate,1,6)+''' AND EMPNO = '''+v_empno+''')                                                                            ');
    Sql.Add ('       WHEN MATCHED THEN                                                                                                     ');
    Sql.Add ('            UPDATE SET                                                                                                       ');
    Sql.Add (update_list);
    Sql.Add ('                   WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),                                                        ');
    Sql.Add ('                   WRITEMAN  = '''+GSempno+'''                                                                                     ');
    Sql.Add ('       WHEN NOT MATCHED THEN                                                                                                 ');
    Sql.Add ('            INSERT(DUYYMM, EMPNO, KORNAME,ORGNUM,DEPTCODE, '+column_list+' WRITETIME, WRITEMAN)                                         ');
    Sql.Add ('            VALUES('''+copy(stdate,1,6)+''','''+v_empno+''','''+E_empno.korname+''','''+E_empno.orgnum+''',  '''
             +E_empno.jobdept+''',  '+insert_list+'TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),'''+GSempno+''')         ');
}
    Sql.Add ('MERGE INTO PKHDUTY P                                                                                                         ');
    Sql.Add ('      USING (SELECT '''+copy(stdate,1,6)+''' DUYYMM, EMPNO, ORGNUM, DEPTCODE, KORNAME FROM PIMPMAS WHERE EMPNO ='''+v_empno+''') V1                                                                                                             ');
    Sql.Add ('         ON  (P.DUYYMM = V1.DUYYMM AND P.EMPNO = V1.EMPNO)                                                                             ');
    Sql.Add ('       WHEN MATCHED THEN                                                                                                     ');
    Sql.Add ('            UPDATE SET                                                                                                       ');
    Sql.Add (update_list);
    Sql.Add ('                   WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),                                                        ');
    Sql.Add ('                   WRITEMAN  = '''+GSempno+'''                                                                                     ');
    Sql.Add ('       WHEN NOT MATCHED THEN                                                                                                 ');
    Sql.Add ('            INSERT( p.DUYYMM, p.EMPNO, p.KORNAME ,p.ORGNUM, p.DEPTCODE, '+column_list+' WRITETIME, WRITEMAN)                                         ');
    Sql.Add ('            VALUES(V1.DUYYMM,V1.EMPNO,V1.KORNAME,V1.ORGNUM,V1.DEPTCODE, '+insert_list+'TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),'''+GSempno+''')         ');

    //memo2.Text := sql.Text;

    if Execute then
    else
    begin
      Exit;
    end;
  end;
  result := true;
end;

//연차 사용 목표 체크
function TFM_Main.PL_Yearly_Check(add_yearly, minus_yearly : real) : Boolean;
var
  tmp_yearly_cnt, tmp_yearlyplan_cnt, tmp_used_cnt, tmp_unused_cnt : real;
begin
  result := false;

  tmp_yearly_cnt     := strtofloat(SL_Yearly_Cnt.text);
  tmp_yearlyplan_cnt := strtofloat(SL_YearlyPlan_Cnt.text);
  tmp_used_cnt       := strtofloat(SL_Used_Yearly_Cnt.text);

  tmp_unused_cnt     := tmp_yearly_cnt - tmp_used_cnt + add_yearly - minus_yearly;

  if (tmp_unused_cnt < 0)                                     then    Exit;

  if (MOD_FLAG='D')and((tmp_yearly_cnt - tmp_unused_cnt) < tmp_yearlyplan_cnt) then    Exit;

  result := true;
end;


function TFM_Main.PL_Process_Yearly : Boolean;
var
  old_yearly_cnt, new_yearly_cnt : real;
  tmp_Regcnt, tmp_Modcnt :real;
  tmp_appdate,tmp_Mod_Flag, tmp_Regfrdate, tmp_Regtodate, tmp_Modfrdate,tmp_Modtodate, tmp_modcode : String;
  update_list, insert_list, column_list :string;
begin
  result := false;

  with(TDS_Grid) do
  begin
    tmp_Appdate   := FieldbyName('APPDATE').AsString;
    tmp_Mod_Flag  := FieldbyName('MOD_FLAG').AsString;
    tmp_Regfrdate := FieldbyName('REGFRDATE').AsString;
    tmp_Regtodate := FieldbyName('REGTODATE').AsString;
    tmp_Regcnt    := FieldbyName('REGYEARLY_CNT').ASFloat;
    tmp_Modfrdate := FieldbyName('MODFRDATE').AsString;
    tmp_Modtodate := FieldbyName('MODTODATE').AsString;
    tmp_Modcnt    := FieldbyName('MODYEARLY_CNT').ASFloat;
    tmp_Modcode   := FieldbyName('DUTYCODE').AsString;
  end;

  if(tmp_Mod_Flag='M') then
  begin
    old_yearly_cnt := PL_Get_Duty_Cnt(E_empno.empno,tmp_Regfrdate,tmp_Regtodate,'1') ;
    new_yearly_cnt := PL_Get_Duty_Cnt(E_empno.empno,tmp_Modfrdate,tmp_Modtodate,'2') ;

    if(tmp_Modcode='64') then new_yearly_cnt := new_yearly_cnt / 2;

    if(old_yearly_cnt<> tmp_Regcnt)or(new_yearly_cnt <> tmp_Modcnt ) then
    begin
      MessageDlg('연차기간 변경 일이 신청시와 달라졌습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
      result := false;
      exit;
    end;

    //yearly_cnt := strtofloat(SL_Used_Yearly_Cnt.text) - old_yearly_cnt + new_yearly_cnt;

    if not PL_Yearly_Check(old_yearly_cnt,new_yearly_cnt) then
    begin
      MessageDlg('사용가능한 연차일을 초과하였습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
      result := false;
      exit;
    end;

    if not Make_Query(e_empno.empno,tmp_Modfrdate,tmp_Modtodate,tmp_Modcode, '2', update_list, insert_list, column_list) then exit;
    if not Update_Query(e_empno.empno,tmp_Modfrdate,tmp_Modtodate, '2', update_list, insert_list, column_list) then exit;

    if not Make_Query(e_empno.empno,tmp_Regfrdate,tmp_Regtodate,'', '1', update_list, insert_list, column_list) then exit;
    if not Update_Query(e_empno.empno,tmp_Regfrdate,tmp_Regtodate, '1', update_list, insert_list, column_list) then exit;
  end
  else
  begin
    old_yearly_cnt := PL_Get_Duty_Cnt(E_empno.empno,tmp_Regfrdate,tmp_Regtodate,'2') ;

    if(tmp_Modcode='64') then old_yearly_cnt := old_yearly_cnt / 2;

    if(old_yearly_cnt<> tmp_Regcnt) then
    begin
      result := false;
      exit;
    end;

    if not PL_Yearly_Check(0,old_yearly_cnt) then
    begin
      MessageDlg('사용가능한 연차일을 초과하였습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
      result := false;
      exit;
    end;

    if not Make_Query(e_empno.empno,tmp_Regfrdate,tmp_Regtodate,tmp_Modcode, '2', update_list, insert_list, column_list) then exit;
    if not Update_Query(e_empno.empno,tmp_Regfrdate,tmp_Regtodate, '2', update_list, insert_list, column_list) then exit;
  end;
  
  result := true;
end;


procedure TFM_Main.BT_app_bakClick(Sender: TObject);
var
  CmdStr,vProgId, vRundate,vMessage : String;
begin
(*2015.01.22.hjku.. 사용안함.
     if TDS_Grid.FieldbyName('APPDATE').AsString = '' then
     begin
           MessageDlg('선택 된 자료가 없습니다.    삭제실패!!', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if TDS_Grid.FieldbyName('Con_Yn').AsString <> '' then
     begin
           MessageDlg('결재처리된 자료입니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if not PL_Process_Yearly then
     begin
           MessageDlg('연차기간 변경 값이 신청시와 달라졌습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if MessageBox(FM_Main.HANDLE,'승인 하시겠습니까?','승인확인',MB_YESNO) = IDYES then
     begin
          with TDS1 do   //TDS_Grid3
          begin
               ServiceName := 'PKA4040A_dml';
               Close;
               Sql.Clear ;
               Sql.Add ('UPDATE PKYEARLYMODIFY                                                  ');
               Sql.Add ('   SET CON_YN =''Y'',                                                  ');
               Sql.Add ('       CONEMPNO  = '''+ GSempno + ''',                        ');
               Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')               ');
               Sql.Add ('WHERE  APPDATE   = '''+ TDS_Grid.FieldbyName('APPDATE').AsString+'''   ');
               Sql.Add ('  AND  EMPNO     = '''+ E_empno.empno + '''                            ');
               Sql.Add ('  AND  REGFRDATE = '''+ TDS_Grid.FieldbyName('REGFRDATE').AsString+''' ');
               Sql.Add ('  AND  REGTODATE = '''+ TDS_Grid.FieldbyName('REGTODATE').AsString+''' ');

               if Execute then
               else
               begin
                    Application.MessageBox('결재처리에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;
          end;

          {SendProgID  := 'PKA4058A';
          SendEmpno   := GSempno;//GSConEmpno;
          RcveEmpno   := E_empno.empno;
          MailSubject := '[연차휴가 사용계획 수정 요청] 요청 문서의 승인이 완료되었습니다.';

          ReceiveYN   := 'N';

          if(TDS_Grid.FieldbyName('MOD_FLAG').AsString='I') then
          begin
               MailBody    := E_empno.korname + JobName + '의 연차휴가 사용 요청에 대한 승인이 완료되었습니다.'+ #13#10 +
                              '즐거운 휴가 보내시기 바랍니다.'; //메일내용
          end
          else
          begin
               MailBody    := E_empno.korname + JobName + '의 연차휴가 사용계획 수정 요청에 대한 승인이 완료되었습니다.'+ #13#10 +
                              '즐거운 휴가 보내시기 바랍니다.'; //메일내용
          end;

          if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
             MessageDlg('연차휴가 사용계획 결재 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
          else
             MessageDlg('연차휴가 사용계획 결재 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
          }
     end;

     Retrieve;
     SB_Help.Panels[1].Text := '결제 되었습니다... ';
*)     
end;



procedure TFM_Main.BBExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,k: integer;
begin
(*2015.01.22.hjku.. 사용안함.
{  Retrieve;

  if TDS_Grid.RecordCount = 0 then
  begin
       MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
       Exit;
  end;

  XArr := VarArrayCreate([1, 10], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;
  screen.cursor := crHourGlass;

  XL.WorkBooks.Add;                           //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '연차 사용 계획 내역 '; //시트명 부여
  XL.Range['A1:E2'].Merge;                    //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := '연차 사용 계획 내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;
  XL.Range['A1'].Interior.Color:= $00E7D9AD;//$00CBF0B3;
  XL.Range['A1','E2'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1','E2'].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움


  XL.Range['B4'].value := '연차 휴가 현황';
  XL.Range['B4'].font.Size := 12;
  XL.Range['B4'].font.Bold := True;
  XL.Range['B4:C4'].Merge;
  XL.Range['B4:C4'].HorizontalAlignment := 3;  //가운데 정렬 3
  XL.Range['B4'].Interior.Color:= $00EAFBDB;//$;
  XL.Range['B4','C4'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['B4','C4'].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움

//  $00EAFBDB


  //컬럼명 지정_서브타이블 지정

  XL.Range['B6' , 'B6'].Value  := '부서명';
  XL.Range['B7' , 'B7'].Value  := '사번';
  XL.Range['B8' , 'B8'].Value  := '성명';
  XL.Range['B9' , 'B9'].Value  := '기준연도';
  XL.Range['B10' ,'B10'].Value := '사용가능연차';
  XL.Range['B11' ,'B11'].Value := '실제사용연차';
  XL.Range['B12', 'B12'].Value := '미사용연차';
  XL.Range['B13', 'B13'].Value := '연차사용율';

  XL.Range['C6' ,'C6'].Value  := E_deptname.Text ;
  XL.Range['C7' ,'C7'].Value  := ''''+E_empno.empno;
  XL.Range['C8' ,'C8'].Value  := E_empno.korname;
  XL.Range['C9' ,'C9'].Value  := GSYear;
  XL.Range['C10','C10'].Value  := TDS1.FieldByName('REALYEAR').AsString;
  XL.Range['C11','C11'].Value  := TDS1.FieldByName('YEARCNT').AsString;
  XL.Range['C12','C12'].Value := FormatFloat('#,##0.0%',TDS1.FieldByName('REALYEAR').AsFloat-TDS1.FieldByName('YEARCNT').AsFloat);
  XL.Range['C13','C13'].Value := FormatFloat('#,##0.0%',((TDS1.FieldByName('YEARCNT').AsFloat /TDS1.FieldByName('REALYEAR').AsFloat))*100);

  XL.Range['B6','C13'].HorizontalAlignment := 3;
  XL.Range['B6','B13'].Interior.Color:= $00CBF0B3;
  XL.Range['B6','C13'].font.Size := 10;
  XL.Range['B6','C13'].font.Bold := True;
  XL.Range['B6','C13'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['B6','C13'].Borders.Weight := 3;       //테두리선 두깨 설정  2Q 보통두깨, 3은 무지 두꺼움




  XL.Range['B15'].value := '연차 휴가 계획';
  XL.Range['B15'].font.Size := 12;
  XL.Range['B15'].font.Bold := True;
  XL.Range['B15:D15'].Merge;
  XL.Range['B15:D15'].HorizontalAlignment := 3;  //가운데 정렬 3
  XL.Range['B15'].Interior.Color:= $00EAFBDB;//$;
  XL.Range['B15','D15'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['B15','D15'].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움




  //컬럼명 지정_서브타이블 지정
  XArr[1] := '휴가 시작일';
  XArr[2] := '휴가 종료일';
  XArr[3] := '휴가 구분';
  XArr[4] := '휴가 일수';
  XArr[5] := '결재 여부 ';
  XL.Range['A17' , 'E17'].Value := XArr;
  k := 17;
  for i := 1 to 5 do
  begin
       XL.Range[CHR(64 + i) + '17'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '17'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '17'].font.Size := 10;
       XL.Range[CHR(64 + i) + '17'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  TDS_Grid.First;

  for i := 1 to  TDS_Grid.RecordCount do
  begin
       XArr[1] := Copy(TDS_Grid.FieldbyName('STDATE').AsString,1,4)+ '-' +
                  Copy(TDS_Grid.FieldbyName('STDATE').AsString,5,2)+ '-' +
                  Copy(TDS_Grid.FieldbyName('STDATE').AsString,7,2);
       XArr[2] := Copy(TDS_Grid.FieldbyName('TODATE').AsString,1,4)+ '-' +
                  Copy(TDS_Grid.FieldbyName('TODATE').AsString,5,2)+ '-' +
                  Copy(TDS_Grid.FieldbyName('TODATE').AsString,7,2);
       XArr[3] := TDS_Grid.FieldbyName('DUCODE').AsString;
       XArr[4] := TDS_Grid.FieldbyName('HOLIDAY').AsString;
       XArr[5] := TDS_Grid.FieldbyName('CONYN').AsString;
       XL.Range['A' + IntToStr(k+1), 'E' + IntToStr(k+1)].Value := XArr;
       inc(k);
       TDS_Grid.Next;
  end;

  XL.Range['A' + IntToStr(k+1)].Value := '합계';
  XL.Range['D' + IntToStr(k+1)].Value := E_Holiday.Text;
  XL.Range['A'+ IntToStr(k+1),'C'+ IntToStr(k+1)].Merge;
  XL.Range['D'+ IntToStr(k+1),'E'+ IntToStr(k+1)].Merge;
  XL.Range['A'+ IntToStr(k+1)].Interior.Color:= $00EAFBDB;
  XL.Range['D'+ IntToStr(k+1)].Interior.Color:= $00EAFBDB;
  XL.Range['A'+ IntToStr(k+1)].font.Size := 10;
  XL.Range['A'+ IntToStr(k+1)].font.Bold := True;
  XL.Range['D'+ IntToStr(k+1)].font.Size := 10;
  XL.Range['D'+ IntToStr(k+1)].font.Bold := True;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A17', 'E' + IntToStr(k+1)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A17', 'E' + IntToStr(k+1)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A17', 'E' + IntToStr(k+1)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A17', 'E' + IntToStr(k+1)].font.name := '굴림체';
  XL.Range['A17', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A17', 'E' + IntToStr(k+1)].font.Size := 9;
  XL.Range['A17', 'E' + IntToStr(k+1)].HorizontalAlignment := 3;  //가운데 정렬 3
//  XL.Range['D3', 'E' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬 1 좌측정렬 2 가운데 정렬 3
  XL.Range['A1', 'E' + IntToStr(k+1)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  }
*)  
end;

procedure TFM_Main.E_empnoExit(Sender: TObject);
begin
  Retrieve;
end;

procedure TFM_Main.BT_appnoClick(Sender: TObject);
begin
(*2015.01.22.hjku.. 사용안함.
     if TDS_Grid.FieldbyName('APPDATE').AsString = '' then
     begin
           MessageDlg('선택 된 자료가 없습니다.    삭제실패!!', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if TDS_Grid.FieldbyName('Con_Yn').AsString <> '' then
     begin
           MessageDlg('결재처리된 자료입니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if MessageBox(FM_Main.HANDLE,'반려 하시겠습니까?','반려확인',MB_YESNO) = IDYES then
     begin
          with TDS1 do   //TDS_Grid3
          begin
               ServiceName := 'PKA4040A_dml';
               Close;
               Sql.Clear ;
               Sql.Add ('UPDATE PKYEARLYMODIFY                                                  ');
               Sql.Add ('   SET CON_YN =''N'',                                                  ');
               Sql.Add ('       CONEMPNO  = '''+ GSempno + ''',                        ');
               Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')               ');
               Sql.Add ('WHERE  APPDATE   = '''+ TDS_Grid.FieldbyName('APPDATE').AsString+'''   ');
               Sql.Add ('  AND  EMPNO     = '''+ E_empno.empno + '''                            ');
               Sql.Add ('  AND  REGFRDATE = '''+ TDS_Grid.FieldbyName('REGFRDATE').AsString+''' ');
               Sql.Add ('  AND  REGTODATE = '''+ TDS_Grid.FieldbyName('REGTODATE').AsString+''' ');

               if Execute then
               else
               begin
                    Application.MessageBox('반려처리에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;
          end;

          SendProgID  := 'PKA4058A';
          SendEmpno   := GSempno;//GSConEmpno;
          RcveEmpno   := E_empno.empno;
          ReceiveYN   := 'N';
          MailSubject := '[연차휴가 사용 승인 요청] 요청 문서가 반려되었습니다.';
          if(TDS_Grid.FieldbyName('MOD_FLAG').AsString='I') then
          begin
              MailBody    := E_empno.korname + JobName + '의 연차휴가 사용 요청에 대한 승인이 반려되었습니다.'; //메일내용
          end
          else
          begin
              MailBody    := E_empno.korname + JobName + '의 연차휴가 사용계획 수정 요청에 대한 승인이 반려되었습니다. '; //메일내용
          end;


          if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
               MessageDlg('연차휴가 사용계획 반려 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
          else
          begin
               MessageDlg('연차휴가 사용계획 반려 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
               exit;
          end;
     end;

     Retrieve;
     SB_Help.Panels[1].Text := '결제 되었습니다... ';
*)     
end;

function TFM_Main.PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
begin
  result := 0.0;

  with QR_com do
  begin
    PL_Com_Contructor;

    SQL.Add('select payutil.GET_DUTY_CNT('''+empno+''','''+fromdate+''','''+todate+''','''+flag+'''),   ');
    SQL.Add('       '''' field2, '''' field3,'''' field4,'''' field5 from dual                          ');
    //memo1.text := sql.text;
    Open;

    if(RecordCount > 0) then
      result := FieldByName('field1').AsFloat
    else result := 0.0;
  end;
end;


procedure TFM_Main.ME_RegfrdateChange(Sender: TObject);
begin
  Regfrdate := trim(RemoveChar(ME_Regfrdate.Text,'-'));
  Regtodate := trim(RemoveChar(ME_Regtodate.Text,'-'));

  if(Regfrdate='') then
  begin
    //MessageDlg('기등록시작일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    System.Exit;
  end;

  if(Regtodate='') then
  begin
    //2014.11.14.hjku. 입력초기값 셋팅..
    ME_Regtodate.Text := ME_Regfrdate.Text;
    ME_Regtodate.SetFocus;
    System.Exit;
  end;

  if (Regfrdate > Regtodate) then
  begin
//    MessageDlg('기등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
    ME_Regfrdate.SetFocus;
    System.Exit;
  end;

  if(Mod_flag= 'I') then
    NE_Reg_Yearly_Cnt.text := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,regfrdate,regtodate,'2'))
  else
    NE_Reg_Yearly_Cnt.text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate,Regtodate,'1'));
end;

procedure TFM_Main.ME_RegtodateChange(Sender: TObject);
begin
  Regfrdate := trim(RemoveChar(ME_Regfrdate.Text,'-'));
  Regtodate := trim(RemoveChar(ME_Regtodate.Text,'-'));

  if(Regtodate='') then
  begin
    ME_Regtodate.SetFocus;
    System.Exit;
  end;

  if(Regfrdate='') then
  begin
    ME_Regfrdate.SetFocus;
    System.Exit;
  end;

  if (Regfrdate > Regtodate) then
  begin
    ME_Regfrdate.SetFocus;
    System.Exit;
  end;

  if(Mod_flag= 'I') then
    NE_Reg_Yearly_Cnt.text := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,regfrdate,regtodate,'2'))
  else
    NE_Reg_Yearly_Cnt.text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate,Regtodate,'1'));
end;

procedure TFM_Main.ME_ModfrdateChange(Sender: TObject);

begin
  Modfrdate  := trim(RemoveChar(ME_Modfrdate.Text,'-'));
  Modtodate  := trim(RemoveChar(ME_Modtodate.Text,'-'));

  if(Modfrdate='') then
  begin
//     MessageDlg('변경시작일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
    ME_Modfrdate.SetFocus;
    System.Exit;
  end;

  if(Modtodate='') then
  begin
    //2014.11.14.hjku. 입력초기값 셋팅..
    ME_Modtodate.Text := ME_Modfrdate.Text;
    ME_Modtodate.SetFocus;
    System.Exit;
  end;

  if (Modfrdate > Modtodate) then
  begin
//    MessageDlg('변경등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
    ME_Modfrdate.SetFocus;
    System.Exit;
  end;

  ED_hotkeyChange(self);
end;

procedure TFM_Main.ME_ModtodateChange(Sender: TObject);
begin
    Modfrdate := trim(RemoveChar(ME_Modfrdate.Text,'-'));
    Modtodate := trim(RemoveChar(ME_Modtodate.Text,'-'));

    if(Modtodate='') then
    begin
//       MessageDlg('변경종료일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
       ME_Modtodate.SetFocus;
       System.Exit;
    end;

    if(Modfrdate='') then
    begin
       ME_Modfrdate.SetFocus;
       System.Exit;
    end;

     if (Modfrdate > Modtodate) then
     begin
//         MessageDlg('변경등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
         ME_Modfrdate.SetFocus;
         System.Exit;
     end;
     
     ED_hotkeyChange(self);
     //NE_Mod_Yearly_Cnt.text := PL_Get_Duty_Cnt(E_empno.empno,Modfrdate,Modtodate,'2') ;
end;

procedure TFM_Main.ME_ModfrdateButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Modfrdate.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
    Finally
        calendar.Free;
    End;
end;

procedure TFM_Main.ME_ModtodateButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Modtodate.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
    Finally
        calendar.Free;
    End;
end;

function TFM_Main.PL_Calc_Yearly_Cnt(empno, fromdate, todate, flag : String) : real;
var
   tmp_modcnt : real;
begin
     result := 0.0;
     //2015.01.27.hjku. 연차변경시 동일 날짜 수정도 가능하도록 개발(요청서)..이명노M요청
     //tmp_modcnt := PL_Get_Duty_Cnt(empno,fromdate,todate,'2') ;
     tmp_modcnt := PL_Get_Duty_Cnt(empno,fromdate,todate,flag) ;

     if(ED_hotkey.Text='64') then tmp_modcnt := tmp_modcnt / 2;

     result := tmp_modcnt;
end;

procedure TFM_Main.ED_hotkeyChange(Sender: TObject);
var
   tmp_modcnt : real;
begin
    dup_frdate1 := '';
    dup_todate1 := '';

    dup_frdate2 := '';
    dup_todate2 := '';

    dup_frdate3 := '';
    dup_todate3 := '';

    dup_frdate4 := '';
    dup_todate4 := '';

    if(Mod_Flag ='M')and(ED_hotkey.Text ='63') then
    begin
         ME_Regfrdate2.enabled       := true;
         ME_Regtodate2.enabled       := true;

         ME_Modfrdate2.text          := '';
         ME_Modtodate2.text          := '';         
         ME_Modfrdate2.enabled       := false;
         ME_Modtodate2.enabled       := false;
    end
    else if(Mod_Flag ='M')and(ED_hotkey.Text ='64') then
    begin
         ME_Regfrdate2.text          := '';
         ME_Regtodate2.text          := '';
         ME_Regfrdate2.enabled       := false;
         ME_Regtodate2.enabled       := false;

         ME_Modfrdate2.enabled       := true;
         ME_Modtodate2.enabled       := true;
    end
    else
    begin
         ME_Regfrdate2.text          := '';
         ME_Regtodate2.text          := '';
         ME_Regfrdate2.enabled       := false;
         ME_Regtodate2.enabled       := false;

         ME_Modfrdate2.text          := '';
         ME_Modtodate2.text          := '';
         ME_Modfrdate2.enabled       := false;
         ME_Modtodate2.enabled       := false;
    end;
    
    if(Mod_Flag ='I') then
    begin
        NE_Reg_Yearly_Cnt.Text := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,regfrdate,regtodate,'2'));
        NE_Reg_Yearly_Cnt2.Text:= '0';
        NE_Mod_Yearly_Cnt.Text := '0';
        NE_Mod_Yearly_Cnt2.Text:= '0';
    end
    else if(Mod_Flag ='D') then
    begin
        NE_Reg_Yearly_Cnt.Text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate,Regtodate,'1'));
        NE_Reg_Yearly_Cnt2.Text:= '0';
        NE_Mod_Yearly_Cnt.Text := '0';
        NE_Mod_Yearly_Cnt2.Text:= '0';
    end
    else
    begin
         NE_Reg_Yearly_Cnt.text  := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate,Regtodate,'1'));
         NE_Mod_Yearly_Cnt.Text  := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,Modfrdate, Modtodate, '2'));

         //2015.01.27.hjku. 연차변경시 동일 날짜 수정도 가능하도록 개발(요청서)..이명노M요청
         if Get_DupDate(Regfrdate,Regtodate,Modfrdate,Modtodate, dup_frdate1,dup_todate1) then
         begin
              NE_Mod_Yearly_Cnt.Text := floattostr(strtofloat(NE_Mod_Yearly_Cnt.Text) +
                                                   PL_Calc_Yearly_Cnt(E_empno.empno,dup_frdate1, dup_todate1, '3'));
         end;

         if(ED_hotkey.Text ='63') then
         begin
              NE_Reg_Yearly_Cnt2.text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate2,Regtodate2,'1'));
              NE_Mod_Yearly_Cnt2.Text := '0';

              //2015.01.27.hjku. 연차변경시 동일 날짜 수정도 가능하도록 개발(요청서)..이명노M요청
              if Get_DupDate(Regfrdate2,Regtodate2,Modfrdate,Modtodate, dup_frdate2,dup_todate2) then
              begin
                   NE_Mod_Yearly_Cnt.Text := floattostr(strtofloat(NE_Mod_Yearly_Cnt.Text) +
                                                        PL_Calc_Yearly_Cnt(E_empno.empno,dup_frdate2, dup_todate2, '3'));
              end;
         end
         else if(ED_hotkey.Text ='64') then
         begin
              NE_Reg_Yearly_Cnt2.text := '0';
              NE_Mod_Yearly_Cnt2.Text := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,Modfrdate2,Modtodate2,'2'));

              //2015.01.27.hjku. 연차변경시 동일 날짜 수정도 가능하도록 개발(요청서)..이명노M요청
              if Get_DupDate(Regfrdate,Regtodate,Modfrdate2,Modtodate2, dup_frdate3,dup_todate3) then
              begin
                   NE_Mod_Yearly_Cnt2.Text := floattostr(strtofloat(NE_Mod_Yearly_Cnt2.Text) +
                                                        PL_Calc_Yearly_Cnt(E_empno.empno,dup_frdate3, dup_todate3, '3'));
              end;

         end
         else
         begin
              NE_Reg_Yearly_Cnt2.text:= '0';
              NE_Mod_Yearly_Cnt2.Text:= '0';
         end;
    end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  FM_Main.Refresh;
  SB_help.Panels[1].Text := '급여시스템에 접속 중입니다...';

 ///////////////////////////////////////////////////////////////////////
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;    

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  GSdate            := FM_Tmax.GetData('sysdate','','');

(*2015.01.27.hjku.. 여러해 지원으로 삭제..
  //2014.01.04.hjku. 이명노M요청(다음해1월7일까지만 입력가능하도록)
  if(copy(GsDate,5,4)>='0101')and (copy(GsDate,5,4)<='0107') then GSYear := inttostr(strtoint(copy(GSdate,1,4))-1)
  else GSYear := copy(GSdate,1,4);
*)
  with QR_com do
  begin
       PL_Com_Contructor;
       Sql.Add ('Select to_char(last_day(to_date(Knteyymm,''YYYYMM'')),''YYYYMMDD''), ''field2'', ''field3'', ''field4'', ''field5'' ');
       Sql.Add ('  from pkcpbas            ');

       Open;

       Knteyymm := QR_com.FieldByName('field1').AsString ;
  end;

  //2015.02.27.hjku.. 연차휴가사용/변경 메뉴명 변경으로 인한 추가..이명노M 요청  
  with QR_com do
  begin
       PL_Com_Contructor;
       Sql.Add ('select progname , ''field2'', ''field3'', ''field4'', ''field5'' ');
       Sql.Add ('  from pymenulist            ');
       Sql.Add (' where tier   = ''' + FL_Tier   + '''            ');
       Sql.Add ('   and progid = ''' + FL_Progid + '''            ');

       Open;

       FL_ProgName := QR_com.FieldByName('field1').AsString ;
  end;

  //OnSchemeForm1.caption.text := '- ' + FL_ProgName + ' : ' + FL_Progid;
  
  PL_Get_ConEmpno(GSempno);

  if (GSgrade <> '') and (( GSgrade[2] <='C' ) or (GSgrade[3] <='C' )) then  //운영자
  begin
    All_Flag               := True;
    E_Mod_YN.Visible       := true;
    bt_ModYN_save.Visible  := true;
  end
  else
  begin
    All_Flag               := False;
    E_Mod_YN.Visible       := false;
    bt_ModYN_save.Visible  := false;
  end;

  Initialize;
end;

procedure TFM_Main.Check_Modify;
begin

    if(RB_Append.Checked) then
    begin
        Mod_flag             := 'I';

        ME_Regfrdate2.text    := '';
        ME_Regtodate2.text    := '';

        ME_Regfrdate2.Enabled := false;
        ME_Regtodate2.Enabled := false;

        ME_Modfrdate.text    := '';
        ME_Modtodate.text    := '';

        ME_Modfrdate.Enabled := false;
        ME_Modtodate.Enabled := false;

        BBsave.enabled       := true;
        BBcancelsave.enabled := false;
        ED_hotkey.enabled    := true;

        {ME_Modfrdate2.text   := '';
        ME_Modtodate2.text   := '';}
    end
    else if(RB_Delete.Checked) then
    begin
        Mod_flag             := 'D';

        BBsave.enabled       := false;
        BBcancelsave.enabled := true;
        ED_hotkey.enabled    := false;

        ME_Regfrdate2.text    := '';
        ME_Regtodate2.text    := '';

        ME_Regfrdate2.Enabled := false;
        ME_Regtodate2.Enabled := false;

        ME_Modfrdate.text    := '';
        ME_Modtodate.text    := '';

        ME_Modfrdate.Enabled := false;
        ME_Modtodate.Enabled := false;

        ME_Modfrdate2.text    := '';
        ME_Modtodate2.text    := '';

        ME_Modfrdate2.Enabled := false;
        ME_Modtodate2.Enabled := false;
    end
    else if(RB_Modify.Checked) then
    begin
        Mod_flag             := 'M';
        ME_Modfrdate.Enabled := true;
        ME_Modtodate.Enabled := true;

        BBsave.enabled       := true;
        BBcancelsave.enabled := false;
        ED_hotkey.enabled    := true;
    end
    else
    begin
        Mod_flag             := '';
        
        BBsave.enabled       := true;
        BBcancelsave.enabled := false;
        ED_hotkey.enabled    := true;
    end;

    //2014.10.31.hjku. 결재자인 경우 버튼 제어
    if(GSConEmpno=GSEmpno)or all_flag then
    begin
        BT_app.enabled := true;
    end
    else
    begin
        BT_app.enabled := false;
    end;
    ED_hotkeyChange(self);

end;


procedure TFM_Main.RB_AppendClick(Sender: TObject);
begin
     Check_Modify;
     Retrieve;
end;

procedure TFM_Main.RB_ModifyClick(Sender: TObject);
begin
     Check_Modify;
     Retrieve;
end;

procedure TFM_Main.E_deptcodeInitPopup(Sender: TObject);
begin  
  if All_Flag then
    begin
      DeptForm.GSdeptcodeS  := '';
    end
  else
    begin
      DeptForm.GSdeptcodeS  := Trim(StringOfDept(GSdeptcode));
    end;

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.E_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
    begin
      E_deptcode.Text    := DeptForm.GSdeptcode;
      E_deptname.Text    := DeptForm.GSdeptname;
    end;
end;

procedure TFM_Main.E_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
    if E_deptcode.Text ='' then
      begin
        FM_Tmax           := TFM_Tmax.Create(Self);
        FM_Tmax.T_Session := TMaxSession;
        E_deptcode.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);
      end;
  end;
end;

procedure TFM_Main.RB_DeleteClick(Sender: TObject);
begin
(*2015.01.27.hjku.. 12월에만 사용함..사용전에 테스트 필요..
     //2013.11.21.hjku.(Mod_flag='D'관련부분 모두) 요청서(SR-1311-0745):목표대비 초과등록된 연차에 대해 본인이 연차를 삭제할 수 있도록 구현
     Check_Modify;
     Retrieve;
 *)
end;

procedure TFM_Main.ME_Modfrdate2Change(Sender: TObject);
begin
    Modfrdate2  := trim(RemoveChar(ME_Modfrdate2.Text,'-'));
    Modtodate2  := trim(RemoveChar(ME_Modtodate2.Text,'-'));

    if(Modfrdate2='') then
    begin
//       MessageDlg('변경시작일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
       ME_Modfrdate2.SetFocus;
       System.Exit;
    end;

    if(Modtodate2='') then
    begin
       //2014.11.14.hjku. 입력초기값 셋팅..
       ME_Modtodate2.Text := ME_Modfrdate2.Text;
       ME_Modtodate2.SetFocus;
       System.Exit;
    end;

     if (Modfrdate2 > Modtodate2) then
     begin
//         MessageDlg('변경등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
         ME_Modfrdate2.SetFocus;
         System.Exit;
     end;
     
     ED_hotkeyChange(self);
end;

procedure TFM_Main.ME_Modtodate2Change(Sender: TObject);
begin
    Modfrdate2 := trim(RemoveChar(ME_Modfrdate2.Text,'-'));
    Modtodate2 := trim(RemoveChar(ME_Modtodate2.Text,'-'));

    if(Modtodate2='') then
    begin
//       MessageDlg('변경종료일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
       ME_Modtodate2.SetFocus;
       System.Exit;
    end;

    if(Modfrdate2='') then
    begin
       ME_Modfrdate2.SetFocus;
       System.Exit;
    end;

     if (Modfrdate2 > Modtodate2) then
     begin
//         MessageDlg('변경등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
         ME_Modfrdate2.SetFocus;
         System.Exit;
     end;
     
     ED_hotkeyChange(self);
     //NE_Mod_Yearly_Cnt.text := PL_Get_Duty_Cnt(E_empno.empno,Modfrdate,Modtodate,'2') ;
end;

procedure TFM_Main.ME_Modfrdate2ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Modfrdate2.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
    Finally
        calendar.Free;
    End;
end;

procedure TFM_Main.ME_Modtodate2ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Modtodate2.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
    Finally
        calendar.Free;
    End;
end;

procedure TFM_Main.ME_Regfrdate2ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Regfrdate2.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);

    Finally
        calendar.Free;
    End;
end;

procedure TFM_Main.ME_Regtodate2ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        ME_Regtodate2.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);
    Finally
        calendar.Free;
    End;
end;

procedure TFM_Main.ME_Regfrdate2Change(Sender: TObject);
begin
    Regfrdate2 := trim(RemoveChar(ME_Regfrdate2.Text,'-'));
    Regtodate2 := trim(RemoveChar(ME_Regtodate2.Text,'-'));

    if(Regfrdate2='') then
    begin
//       MessageDlg('기등록시작일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
       ME_Regfrdate2.SetFocus;
       System.Exit;
    end;

    if(Regtodate2='') then
    begin
       //2014.11.14.hjku. 입력초기값 셋팅..
       ME_Regtodate2.Text := ME_Regfrdate2.Text;
       ME_Regtodate2.SetFocus;
       System.Exit;
    end;

     if (Regfrdate2 > Regtodate2) then
     begin
//         MessageDlg('기등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
         ME_Regfrdate2.SetFocus;
         System.Exit;
     end;

     if(Mod_flag= 'I') then
        NE_Reg_Yearly_Cnt2.text := floattostr(PL_Calc_Yearly_Cnt(E_empno.empno,regfrdate2,regtodate2,'2'))
     else
        NE_Reg_Yearly_Cnt2.text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate2,Regtodate2,'1'));

end;

procedure TFM_Main.ME_Regtodate2Change(Sender: TObject);
begin
    Regfrdate2 := trim(RemoveChar(ME_Regfrdate2.Text,'-'));
    Regtodate2 := trim(RemoveChar(ME_Regtodate2.Text,'-'));

    if(Regtodate2='') then
    begin
//       MessageDlg('기등록종료일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
       ME_Regtodate2.SetFocus;
       System.Exit;
    end;

    if(Regfrdate2='') then
    begin
       ME_Regfrdate2.SetFocus;
       System.Exit;
    end;

     if (Regfrdate2 > Regtodate2) then
     begin
//         MessageDlg('기등록일자가 유효 하지 않습니다.  ', mtInformation,[mbOk], 0);
         ME_Regfrdate.SetFocus;
         System.Exit;
     end;

     if(Mod_flag= 'I') then
        NE_Reg_Yearly_Cnt2.text := '0'
     else
        NE_Reg_Yearly_Cnt2.text := floattostr(PL_Get_Duty_Cnt(E_empno.empno,Regfrdate2,Regtodate2,'1'));

end;

procedure TFM_Main.Bt_MenualClick(Sender: TObject);
var ObjName, FL_Prog : String;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','[SKT공용]연차휴가 사용_변경 시스템 MANUAL.PDF','연차휴가 사용/변경',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
end;

procedure TFM_Main.BBcancelsaveClick(Sender: TObject);
var
  FL_Date: String;
  FL_Date2: String;
  FL_Date3: Real;
  CmdStr,vProgId, vRundate,vMessage : String;
  update_list, insert_list, column_list :string;
  yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String;
  tmp_check_Regcnt :real;
begin
  //2014.12.22.hjku. band=L2(C11)인 경우 취소 등록할 수 없도록.. 이명노M 요청
  if(e_empno.paycl <='C11') then
  begin
    //Mod_flag :='M';
    //RB_Modify.checked := true;
    MessageDlg('연차휴가 등록취소 대상자가 아닙니다.', mtInformation, [mbok], 0) ;
    SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
    exit;
  end;

  //2016.12.20.hjku.. 연차휴가 등록취소 대상자 체크.. 김진호M 요청
  if E_Mod_YN.items[E_Mod_YN.ItemIndex]<>'Y' then
  begin
    //MessageDlg('팀장 이상 및 L2 Band 구성원은 연차휴가 사용계획 등록취소 대상이 아닙니다. ', mtInformation, [mbok], 0) ;
    MessageDlg('연차휴가 등록취소 대상자가 아닙니다.', mtInformation, [mbok], 0) ;
    SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
    exit;
  end;

  //화면 입력값 계산
  ED_hotkeyChange(self);

  //연차 사용 내역 재확인
  PL_Select_Pkyearlt(GSYear,E_empno.empno,yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn);
  SL_Yearly_Cnt.text      := yearly_cnt;
  SL_YearlyPlan_Cnt.text  := yearlyplan_cnt;
  SL_Used_Yearly_Cnt.text := used_yearly_cnt;
  SL_Assign_Yn.Text       := assign_yn;

  //입력 값 점검
  if not PL_Cancel_Input_Check then exit;

  //중복 등록 점검
  with QR_com do
  begin
    PL_Com_Contructor;
    //2014.11.03.hjku. 변경일 경우 미결재 취소가 있는 지 확인후 변경...
    Sql.Add ('SELECT CON_YN, ''field2'', ''field3'', ''field4'', ''field5'' FROM PKYEARLYMODIFY  ' );
    Sql.Add (' WHERE EMPNO ='''+ E_empno.empno +'''                                              ' );
    Sql.Add ('   AND (   (MOD_FLAG = ''D''                                                       ' );
    Sql.Add ('            AND nvl(CON_YN,''N'')=''N''                                            ' );
    Sql.Add ('            AND (   '''+ Regfrdate +''' between REGFRDATE and REGTODATE            ' );
    Sql.Add ('                 OR '''+ Regtodate +''' between REGFRDATE and REGTODATE))          ' );
    Sql.Add ('        OR (    APPDATE  = '''+ copy(GSdate,1,8) +'''                              ' );
    Sql.Add ('            AND MOD_FLAG = '''+ Mod_flag         +'''                              ' );
    Sql.Add ('            AND REGFRDATE= '''+ Regfrdate        +'''                              ' );
    Sql.Add ('            AND REGTODATE= '''+ Regtodate        +'''))                            ' );

    Open;

    if QR_com.RecordCount >= 1 then
    begin
      MessageDlg('같은 기간내의 미결재중인 취소 연차가 있거나, '+#13#10+
                 '같은 기간에 등록된 변경 연차휴일이 있습니다', mtInformation, [mbok], 0) ;
      SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
      System.Exit;
    end;
  end; 

  //2016.12.19.hjku.. 최소 연차사용 갯수 체크.. 김진호M
  tmp_check_Regcnt :=   strtofloat(used_yearly_cnt)
                      - strtofloat(NE_Reg_Yearly_Cnt.Text)
                      - PL_Get_Cancel_YearCnt(E_empno.empno)
                      ;

  if( tmp_check_Regcnt < 3) then
  begin
    MessageDlg('우리 회사는 구성원의 Work & Life Balance 제고를 위해,'+#13#10+
               '‘연차휴가 사용촉진제(年 10일 사용 Guide)’를 시행하고 있습니다.'+#13#10#13#10+
               E_EMPNO.korname +'M는 ‘16년 사용 실적이 ‘매우 낮음’으로 확인됩니다.'+#13#10+
               '따라서, 올해 최소 3개 이상의 연차는 꼭 사용해 주시기 바랍니다.', mtInformation, [mbok], 0) ;
    SB_help.Panels[1].Text := '확인후에 등록 해 주세요..';
    System.Exit;
  end;

  Fm_cancelform := TFm_cancelform.Create(Self);
  cancelsayu    := '';
  Fm_cancelform.ShowModal;

  if(trim(cancelsayu)='') then
  begin
    MessageDlg('등록 연차 취소 사유가 입력되지 않았습니다.', mtInformation, [mbok], 0) ;
    System.Exit;
  end;

  //DB 반영
  if MessageBox(FM_Main.HANDLE,'연차 취소 신청 하시겠습니까?','저장확인',MB_YESNO) = IDYES then
  begin
    SendProgID  := 'PKA4058A';
    SendEmpno   := E_empno.empno;
    RcveEmpno   := GSConEmpno;
    ReceiveYN   := 'N';

    if(MOD_FLAG='D') then
    begin
      Modfrdate              := '';
      Modtodate              := '';
      NE_Mod_Yearly_Cnt.Text := '0';

      MailSubject := ' [구성원 연차휴가 사용계획 취소]';
      MailBody    := E_empno.korname + JobName + '가 아래와 같이 연차휴가를 취소하여 안내드립니다.' + #13#10 + #13#10 +
                     '취소일 : ' + copy(Regfrdate,1,4)+'년 ' +copy(Regfrdate,5,2)+'월 ' +copy(Regfrdate,7,2)+'일 ' + ' ~ ' +
                                             copy(Regtodate,1,4)+'년 ' +copy(Regtodate,5,2)+'월 ' +copy(Regtodate,7,2)+'일 ' +
                                             '('+NE_Reg_Yearly_Cnt.Text+'일) ' + #13#10 +
                     '취소사유 : ' + CancelSayu ;
    end;

    with TDS1 do   //tds_grid3
    begin
      ServiceName := 'PKA4040A_dml';
      Close;
      Sql.Clear ;

      Sql.Add(' INSERT INTO PKYEARLYMODIFY(APPDATE, EMPNO, KORNAME,MOD_FLAG,                                                          ');
      Sql.Add('                            REGFRDATE, REGTODATE, REGYEARLY_CNT,                                                       ');
      Sql.Add('                            DUTYCODE, EEMPNO, CON_YN, cancelsayu,WRITEEMPNO, WRITETIME)                                           ');
      Sql.Add(' VALUES                                                                                                                ');
      //2016.12.19.hjku.. 연차휴가 등록취소 시행. 김진호M 요청
      //Sql.Add('       ('''+GSDate+''',    '''+ E_empno.empno+''', '''+E_empno.korname+''', '''+Mod_flag+''',                          ');
      Sql.Add('       (to_char(sysdate,''YYYYMMDDHH24MISS''),    '''+ E_empno.empno+''', '''+E_empno.korname+''', '''+Mod_flag+''',                          ');
      Sql.Add('        '''+Regfrdate+''',                                                                                             ');
      Sql.Add('        '''+Regtodate+''',                                                                                             ');
      Sql.Add('        '''+NE_Reg_Yearly_Cnt.Text+''',                                                                                ');
      Sql.Add('        '''+ ED_hotkey.Text+''','''+GSConEmpno+''',''N'',                                                              ');
      Sql.Add('        '''+cancelsayu+''',                                                                                             ');
      Sql.Add('        '''+GSempno+''', to_char(sysdate,''YYYYMMDDHH24MISS''))                                                      ');

      try
        Execute
      except
        Application.MessageBox('연차휴가 취소 신청이 실패했습니다.','작업실패',MB_OK);
        Exit;
      end;
    end;

    if(Mod_flag='D') then
    begin
      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
      begin
        MessageDlg('연차휴가 사용계획 취소 신청 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
      end
      else
      begin
        MessageDlg('연차휴가 사용계획 취소 신청 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
        exit;
      end;
    end;
    Initialize;
  end;
  Retrieve;  
end;

procedure TFM_Main.BT_appClick(Sender: TObject);
begin
  FM_ConForm := TFM_ConForm.Create(Self);
  FM_ConForm.ShowModal;
  Retrieve;    
end;

function TFM_Main.Get_JobName(p_payra : string) : String;
begin
  result := '';
  
  if(p_payra ='D11') then
    result := '매니저'
  else if(p_payra ='D41') then
    result := '비상계획관'
  else if(p_payra ='D51') or
         (p_payra ='D61') or
         (p_payra ='H11') or
         (p_payra ='K11') or
         (p_payra ='O31') then
    result := '사원'
  else if(p_payra ='D91') or
         (p_payra ='H10') or
         (p_payra ='H41') then
    result := '팀원'
  else if(p_payra ='C11') or
         (p_payra ='C18') then
    result := '팀장'
  else result := FM_Tmax.GetData('codename','I113',p_payra);
end;

//2014.12.29.hjku. 특수문자 제외 추가..
function TFM_Main.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result := '';
  
  for I:=1 to Length(sSrc) do
    //if (sSrc[I] in [' ','A'..'Z', 'a'..'z', '0'..'9','(',')']) or (ByteType(sSrc, I)<>mbSingleByte) then
    if not(sSrc[I] in ['''','$','#']) then
      result := result + sSrc[I];
end;

procedure TFM_Main.ED_yearChange(Sender: TObject);
begin
  //2015.01.20.hjku.. 여러해 지원해 주기 위해 추가.. 이명노M 요청..
  GSYear := ED_year.KeyItems[ED_year.ItemIndex];

  if(trim(E_empno.empno)<>'') then
     Retrieve;
end;

function TFM_Main.Get_DupDate(rfrdate,rtodate,mfrdate,mtodate : string; out dupfrdate,duptodate :string) : Boolean;
begin
    result := true;
    dupfrdate :='';
    duptodate :='';

         if(rfrdate <  mfrdate) then dupfrdate := mfrdate
    else if(rfrdate >= mfrdate) then dupfrdate := rfrdate;

         if(rtodate <  mtodate) then duptodate := rtodate
    else if(rtodate >= mtodate) then duptodate := mtodate;


    if(dupfrdate > duptodate) then
    begin
        dupfrdate := '';
        duptodate := '';

        result := false;
    end;
end;

function TFM_Main.PL_Get_Cancel_YearCnt(empno : string): real;
begin
  result := 0.0;

  with QR_com do
  begin
    PL_Com_Contructor;

    SQL.Add('SELECT NVL(SUM(NVL(REGYEARLY_CNT,0)),0),                ');
    SQL.Add('       ''field2'', ''field3'', ''field4'', ''field5''   ');
    SQL.Add('  FROM PKYEARLYMODIFY                                   ');
    SQL.Add(' WHERE REGFRDATE LIKE '''+GSYear+'%''                   ');
    SQL.Add('   AND MOD_FLAG=''D''                                   ');
    SQL.Add('   AND EMPNO ='''+empno+'''                             ');
    SQL.Add('   AND NVL(CON_YN,''N'')=''N''                          ');
    Open;

    if(RecordCount > 0) then result := FieldByName('field1').AsFloat;

    Close;
  end;
end;

procedure TFM_Main.bt_ModYN_saveClick(Sender: TObject);
var
  tmp_mod_yn : string;
begin  
  with TDS1 do
  begin
    ServiceName := 'PKA4040A_dml';
    Close;
    Sql.Clear ;
    Sql.Add ('UPDATE PKYEARLT                                                           ');
    Sql.Add ('   SET MOD_YN    = ''' + E_Mod_YN.items[E_Mod_YN.ItemIndex] + ''',        ');
    Sql.Add ('       WRITEID   = ''' + GSempno + ''',                                   ');
    Sql.Add ('       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')                  ');
    Sql.Add ('WHERE  YEARLY_YY = ''' + GSYear + '''                                     ');
    Sql.Add ('  AND  EMPNO     = ''' + E_EMPNO.empno     + '''                          ');

    if not Execute then
    begin
      Application.MessageBox('연차휴가 등록취소 대상자 저장에 실패했습니다.','작업실패',MB_OK);
      Exit;
    end;
  end;
end;

end.

