{* ======================= Program Header ======================================
 PROGRAM-NAME   : 인턴사원 OJT 일일업무일지(pef5020a.exe)
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 인턴 평가
 Programmer     : 지순미
 Version        : 1.0
 Date           : 2012.07.20
 
 USER LIBRARY : OutputForm : 출력조건 Form.
                PrintForm  : 출력인쇄 Form.

Update Contents 
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description 
    1.00      2012.07.20         지순미        설계명세서       최초개발본
============================================================================= *}
unit UDiaryForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, MemDS, DBAccess, Func, Grids,
  ImgList, Buttons, OnDBGrid, DBGrids, OnGrDBGrid, OnPimcalendar;
  
type
  TDiaryForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Ed_WORKDATE: TOnDateEdit;
    Bt_Srh: TOnFocusButton;
    TCDS: TTMaxDataSet;
    Ed_empno: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    L_E1empno: TOnShapeLabel;
    L_deptcode: TOnShapeLabel;
    L_DeptName: TOnShapeLabel;
    Bt_insert: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    Loginemp: TEdit;
    TDml: TTMaxDataSet;
    Panel2: TPanel;
    PA_MenuHeader: TPanel;
    SB_lun: TOnFocusButton;
    SB_month: TOnFocusButton;
    SB_week: TOnFocusButton;
    SB_inc: TOnFocusButton;
    SB_dec: TOnFocusButton;
    IMG_il: TImageList;
    bt_Calen: TSpeedButton;
    Shape1: TShape;
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    TCSel: TTMaxDataSet;
    E_OPINION1: TOnMemo;
    E_OPINION2: TOnMemo;
    E_OPINION3: TOnMemo;
    Tds_il: TTMaxDataSet;
    Label1: TLabel;
    E_E1VALVIEW: TOnMemo;
    L_E1korname: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    DB_Grid: TOnGrDbGrid;
    T_Grid: TTMaxDataSet;
    DS_Grid: TDataSource;
    Bt_Confirm: TOnFocusButton;
    OutputBtn: TOnFocusButton;
    E_Status: TEdit;
    cb_empno: TComboBox;
    CB_Srh: TOnFocusButton;
    OnWinPopupEdit1: TOnWinPopupEdit;
    CB_RDate: TComboBox;
    PI_Cal: TOnPimcalendar;
    procedure ExitBtnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_WORKDATEDateChange(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure SB_lunClick(Sender: TObject);
    procedure SB_monthClick(Sender: TObject);
    procedure SB_weekClick(Sender: TObject);
    procedure SB_incClick(Sender: TObject);
    procedure SB_decClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bt_CalenClick(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PI_CalClick(Sender: TObject);
    procedure E_OPINION1Click(Sender: TObject);
    procedure DS_GridDataChange(Sender: TObject; Field: TField);
    procedure DB_GridCellClick(Column: TColumn);
    procedure DB_GridEnter(Sender: TObject);
    procedure DB_GridExit(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_OPINION1Exit(Sender: TObject);
    procedure CB_SrhClick(Sender: TObject);
    procedure cb_empnoChange(Sender: TObject);
    procedure cb_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure CB_RDateChange(Sender: TObject);
    procedure CB_RDateKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure PG_LoadPlan;
    procedure Csel_Open;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Wempno, vEMPNO, vE1Empno, vE2Empno, vConyn, vE1Conyn : String;
    Pempno, Pkorname, Password, Ppermission: String;
    vOPINION1, vOPINION2 : String;
    PSysdate    : string;
    Prabasdate  : String;
    Lgubun      : Integer;
    gubun       : Integer;
    check       : Integer;
    EempFind    : Boolean;
    pOrgDeptList: String;
    FL_Start   : Boolean;
    FL_Ins     : Boolean;
    FL_SchItem : TOnSchItem;
    function TCsel_gfd(p_loc: Integer): String;
    function fnSetVariable(mGubun: Integer): Boolean;
    procedure ComponentReadOnly(BValue:Boolean);
    procedure ComponentClear;
    procedure Select_BaseData;
    procedure Grid_Data;
    procedure Read_Data;

  end;

var
  DiaryForm: TDiaryForm;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;
  Csel_SQL : String;
  Csel_ret : Boolean;
implementation

uses UOutputForm, UEmpForm;

{$R *.DFM}

function TDiaryForm.TCsel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('SEL_DATA').AsString;
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

procedure TDiaryForm.Csel_Open;
begin
  Csel_ret := False;
  with TCsel do
  begin
  Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 5000);
       ClearParamInfo;
       SQL.Text := Csel_SQL;
       Open;
       if  RecordCount > 0 then     Csel_ret := True;
  end;
end;

function TDiaryForm.fnSetVariable(mGubun: Integer): Boolean;
begin
  Result := False;

  case mGubun of
    1:
       Csel_SQL := Format(
          'SELECT  ' +
          '       nvl(  value1   ,'' '')       '+
          '  FROM peintbas                     '+
          ' WHERE rabasdate = ''%s''           '+
          '   AND gubun     = ''%s''           '+
          '   AND sgubun    = ''%s''           ',['00000000','00','0000']); // 기준일
    2:
       Csel_SQL :=
          'SELECT nvl(  to_char(sysdate,''YYYYMMDDHH24MISSD''),'' '') FROM dual';
    3:
       Csel_SQL := Format(
          'SELECT  ' +
          '       nvl(  value1   ,'' '') || '';'' || '+
          '       nvl(  value2   ,'' '') || '';'' || '+
          '       nvl(  value3   ,'' '') || '';'' || '+
          '       nvl(  value4   ,'' '') || '';'' || '+
          '       nvl(  value5   ,'' '')             '+
          '  FROM peintbas                           '+
          ' WHERE rabasdate = ''%s''                 '+
          '   AND gubun     = ''%s''                 '+
          '   AND sgubun    = ''%s''                 ',[Prabasdate,'01','0002']); // 업무담당자
    4:
       Csel_SQL := Format(
          'SELECT Distinct rabasdate                 '+
          '  FROM peintbas                           '+
          ' WHERE gubun     = ''%s''                 '+
          '   AND sgubun    = ''%s''                 '+
          '   ORDER BY 1 DESC ',['01','0002']); // 기준일 선택용
//==============================================================================//
    else
     System.Exit;
  end;

  Csel_Open;

  case mGubun of
    1 : begin
             Prabasdate:= TCsel_gfd(1);
        end;
    2 : begin
             pSysdate  := TCsel_gfd(1);
        end;
    3 : begin
             workemp1  := TCsel_gfd(1);
             workemp2  := TCsel_gfd(2);
             workemp3  := TCsel_gfd(3);
             workemp4  := TCsel_gfd(4);
             workemp5  := TCsel_gfd(5);
        end;
    4 : begin
          CB_RDate.Items.CLEAR;
          WITH TCsel DO
          BEGIN
            WHILE NOT Eof DO
            BEGIN
              CB_RDate.Items.ADD(TCsel_gfd(1));
              NEXT;
            END;
          END;
          CB_RDate.ItemIndex := 0;
        end;
  end;

  TCsel.Close;
  Result := True;
end;

procedure TDiaryForm.Select_BaseData;
begin
  Ed_empno.Text := Loginemp.Text;
  wEmpno        := Loginemp.Text;
  Csel_SQL      := 'SELECT A.empno||'';''||A.korname||'';''||A.orgnum||'';''||A.deptcode||'';''||               '+#13+
                  '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''|| '+#13+
                  '       A.E1empno||'';''||A.E1korname||'';''||A.E2empno                                       '+#13+
                  '  FROM PEINTMAS A                                                                            '+#13+
                  ' WHERE rabasdate = '''+prabasdate+'''                         '+#13+
                  '   and (    (A.empno   like '''+ Ed_empno.Text +'''||''%'')   '+#13+
                  '         OR (A.E1empno like '''+ Ed_empno.Text +'''||''%'')   '+#13+
                  '         OR (A.E2empno like '''+ Ed_empno.Text +'''||''%'') ) ';

  Csel_Open;

  vEmpno                   := TCsel_gfd(1);
  Ed_Empno.Text            := TCsel_gfd(1);
  L_korname.ValueCaption   := TCsel_gfd(2);
  L_Deptcode.Hint          := TCsel_gfd(3);
  L_Deptcode.ValueCaption  := TCsel_gfd(4);
  L_Deptname.ValueCaption  := TCsel_gfd(5);
  vE1Empno                 := TCsel_gfd(6);
  L_E1empno.ValueCaption   := TCsel_gfd(6);
  L_E1korname.ValueCaption := TCsel_gfd(7);
  vE2Empno                 := TCsel_gfd(8);

  if (TCsel.RecordCount < 1) then
  begin
       if (Workemp1 = Pempno) or (Workemp2 = Pempno) or
          (Workemp3 = Pempno) or (Workemp4 = Pempno) or
          (Workemp5 = Pempno) or (Copy(Pempno,1,1) = 'D' ) then
       begin

       End
       Else
       Begin
         MessageDlg('인턴사원이나 멘토가 아닙니다.'+#13+
                    '프로그램을 종료합니다.',mtInformation,[mbOk],0);
         ExitBtnClick(ExitBtn);
         System.exit;
       End;
  end;

  if TCsel.RecordCount > 1 then
  begin
    CB_empno.Items.Clear;
    with TCsel do
    begin
      While Not Eof do
      begin
        CB_empno.Items.Add(TCsel_gfd(1));
        Next;
      end;
    end;
    CB_empno.ItemIndex := 0;
    cb_empno.Visible := True;
  End Else
  Begin
    cb_empno.Visible := False;
  End;

  if Wempno = vEmpno         then
  begin
    Lgubun := 1;
    Bt_Insert.Caption  := '저장';
    Bt_Confirm.Caption := '결재상신';
    ComponentReadOnly(False);
    CB_RDate.Enabled   := False;
  end
  else if Wempno = vE1Empno  then
  begin
    Lgubun := 2;
    Bt_Insert.Caption  := '반려';
    Bt_Confirm.Caption := '결재';
    ComponentReadOnly(True);
    CB_RDate.Enabled   := True;
  end
  else if Wempno = vE2Empno  then
  begin
    Lgubun := 3;
    Ed_empno.ButtonWidth  := 24;
    Ed_empno.Enabled      := true;
    Bt_Insert.Visible     := False;
    Bt_Confirm.Visible    := False;
    ComponentReadOnly(True);
    CB_RDate.Enabled   := True;
  end;
end;

procedure TDiaryForm.Grid_Data;
var
  sSQL : String;
begin
  sSQL :=  'SELECT WORKDATE, OPINION1, OPINION2, OPINION3, E1VALVIEW '+
           '  FROM PEINTOJT a                                        '+
           ' WHERE empno    = '''+ed_empno.Text  +'''                ';

  if LGubun = 2 then
       sSQL := sSQL + '    And Conyn   = ''Y''                       '
  else if LGubun = 3 then
       sSQL := sSQL + '    And E1Conyn = ''Y''                       ';

  sSQL := sSQL + ' Order by WORKDATE Desc, E1valview            ';
  with T_Grid do
  begin
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('WORKDATE'   , ftString, 2000);
       AddField('OPINION1'   , ftString, 2000);
       AddField('OPINION2'   , ftString, 2000);
       AddField('OPINION3'   , ftString, 2000);
       AddField('E1VALVIEW'  , ftString, 2000);
       ClearParamInfo;
       SQL.Text := sSQL;
       Open;
       TStringField(FieldByName('WORKDATE' )).EditMask := '9999-99-99;0;';

       if RecordCount > 1 then
       begin
            vOPINION1 := T_Grid.fieldbyname('OPINION1').AsString;
            vOPINION2 := T_Grid.fieldbyname('OPINION2').AsString;
       end
       else
       begin
        (*
            vOPINION1 := '부서 업무중에서 선정하되, 인턴사원으로서의 참신한 관점을 이용할 수 있는'+#13#10+
                         '창의적이고 생산적인 업무와 연관된 과제를 선정(Max 1000Byte)';

        *)
            vOPINION1 := '';
            vOPINION2 := '그 날에 수행한 업무, 과제수행에 대한 요약(Max 1000Byte)';
       end;
  end;
end;

procedure TDiaryForm.Read_data;
var
  WORKDATE : String;
begin
  WORKDATE := copy(Ed_WORKDATE.text,1,4)+copy(Ed_WORKDATE.text,6,2)+copy(Ed_WORKDATE.text,9,2);
  if LGubun = 1 then
  begin
       if T_Grid.Locate('Workdate',VarArrayOf([Workdate]),[loCaseInsensitive]) then
       begin
            E_OPINION1.Text  := T_Grid.fieldbyname('OPINION1').AsString;
            E_OPINION2.Text  := T_Grid.fieldbyname('OPINION2').AsString;
            E_OPINION3.Text  := T_Grid.fieldbyname('OPINION3').AsString;
            E_E1VALVIEW.Text := T_Grid.fieldbyname('E1VALVIEW').AsString;
            Gubun := 1;
       end
       else
       begin
            ComponentClear;
            Gubun := 0;
       end;
  end
  else if LGubun = 2 then
  begin
       if T_Grid.Locate('Workdate',VarArrayOf([Workdate]),[loCaseInsensitive]) then
       begin
            E_OPINION1.Text  := T_Grid.fieldbyname('OPINION1').AsString;
            E_OPINION2.Text  := T_Grid.fieldbyname('OPINION2').AsString;
            E_OPINION3.Text  := T_Grid.fieldbyname('OPINION3').AsString;
            E_E1VALVIEW.Text := T_Grid.fieldbyname('E1VALVIEW').AsString;
            if E_E1VALVIEW.Text ='' then
            begin
                 E_E1VALVIEW.Font.Color := clGray;
                 E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일의 관찰 평가 의견을');
                 E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
            end;
            Gubun := 2;
       end
       else
       begin
            if T_Grid.RecordCount < 1 then
            begin
                 MessageDlg('인턴사원이 결재상신한 업무일지가 없습니다.'+#13+
                            '프로그램을 종료합니다.',mtInformation,[mbOk],0);
                 ExitBtnClick(ExitBtn);
                 System.exit;
            end
            else
            begin
                 T_Grid.First;
                 Ed_Workdate.Text := copy(T_Grid.fieldbyname('Workdate').AsString,1,4)+'-'+
                                     copy(T_Grid.fieldbyname('Workdate').AsString,5,2)+'-'+
                                     copy(T_Grid.fieldbyname('Workdate').AsString,7,2);
                 E_OPINION1.Text  := T_Grid.fieldbyname('OPINION1').AsString;
                 E_OPINION2.Text  := T_Grid.fieldbyname('OPINION2').AsString;
                 E_OPINION3.Text  := T_Grid.fieldbyname('OPINION3').AsString;
                 if E_E1VALVIEW.Text ='' then
                 begin
                      E_E1VALVIEW.Font.Color := clGray;
                      E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일의 관찰 평가 의견을');
                      E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
                 end
                 else
                 begin
                      E_E1VALVIEW.Font.Color := clBlack;
                      E_E1VALVIEW.Text := T_Grid.fieldbyname('E1VALVIEW').AsString;
                 end;
                 Gubun := 2;
            end;
       end;
  end;
end;
procedure TDiaryForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDiaryForm.Bt_SrhClick(Sender: TObject);
begin
  Select_BaseData;
  Grid_Data;
  Read_Data;

  SB_monthClick(Sender);
  FL_Ins := True;
  check := 0;
end;

procedure TDiaryForm.Ed_WORKDATEDateChange(Sender: TObject);
begin
  Bt_SrhClick(Sender);
  panel2.Visible := false;
end;

procedure TDiaryForm.Bt_insertClick(Sender: TObject);
var
   SQLTEXT  : String;
   WORKDATE : String;
begin
  if MessageBox(handle,PChar('내용을 '+Bt_Insert.Caption+'하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
       system.exit;

  if (Pos('(Max 1000Byte)',E_Opinion1.Text)  > 0) then E_Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_Opinion2.Text)  > 0) then E_Opinion2.Text  := '';
  if (Pos('(Max 2000Byte)',E_Opinion3.Text)  > 0) then E_Opinion3.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1VALVIEW.Text) > 0) then E_E1VALVIEW.Text := '';

  WORKDATE := copy(Ed_WORKDATE.text,1,4)+copy(Ed_WORKDATE.text,6,2)+copy(Ed_WORKDATE.text,9,2);
  if gubun = 0 then
  begin
       if (trim(E_OPINION1.Text) <> '') or (trim(E_OPINION2.Text) <> '') or (trim(E_OPINION3.Text) <> '') then
       begin
           SQLText := Format(
                     ' INSERT INTO   PEINTOJT                                                      '+#13+
                     '        (WORKDATE, EMPNO, KORNAME, ORGNUM, DEPTCODE,                         '+#13+
                     '         OPINION1, OPINION2, OPINION3, INSTIME, UPDTIME,                     '+#13+
                     '         E1EMPNO,  E1KORNAME, E1VALVIEW                 )                    '+#13+
                     ' VALUES (''%s'',''%s'',''%s'',''%s'',''%s'',                                 '+#13+
                     '         ''%s'',''%s'',''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), '''',  '+#13+
                     '         ''%s'',''%s'',''%s'' )                                               ',
                     [WORKDATE,
                      Ed_empno.text,
                      L_korname.ValueCaption,
                      L_deptcode.Hint,
                      L_deptcode.ValueCaption,
                      E_OPINION1.Text,
                      E_OPINION2.Text,
                      E_OPINION3.Text,
                      L_E1EMPNO.ValueCaption,
                      L_E1KORNAME.ValueCaption,
                      E_E1VALVIEW.Text,
                      wEmpno]);
       end
       else
       begin
           MessageDlg('저장할 내용이 없습니다.',mtError,[mbOK],0);
           System.Exit;
       end;
  end
  else
  if gubun = 1 then
  begin
       if Wempno = vEmpno then
       begin
            if (trim(E_OPINION1.Text) <> '') or (trim(E_OPINION2.Text)  <> '')  or
               (trim(E_OPINION3.Text) <> '') or (trim(E_E1VALVIEW.Text) <> '') then
                 SQLText := Format(
                            'UPDATE PEINTOJT  SET                                      ' +#13+
                            '       OPINION1  = '''+E_OPINION1.Text+''' ,              ' +#13+
                            '       OPINION2  = '''+E_OPINION2.Text+''' ,              ' +#13+
                            '       OPINION3  = '''+E_OPINION3.Text+''' ,              ' +#13+
                            '       UPDTIME   = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                            ' WHERE WORKDATE  = ''%s''       ' +#13+
                            '   and empno     = ''%s''       ' ,
                            [WORKDATE,
                             Ed_empno.text])
            else
                 SQLText := Format(
                            'DELETE FROM PEINTOJT            ' +#13+
                            ' WHERE WORKDATE  = ''%s''       ' +#13+
                            '   and empno     = ''%s''       ' ,
                            [WORKDATE,
                             Ed_empno.text]);
       end
       else
       begin
            MessageDlg('내용을 등록하신 분이 아니므로 수정 및 삭제할 수 없습니다.',mtError,[mbOK],0);
            Bt_SrhClick(Sender);
            System.Exit;
       end;
  end
  else
  if gubun = 2 then
  begin
       SQLText := Format(
                  'UPDATE PEINTOJT  SET                                      ' +#13+
                  '       CONYN     = ''N'' ,                                ' +#13+
                  '       E1EMPNO   = '''+L_E1empno.ValueCaption+''' ,       ' +#13+
                  '       E1KORNAME = '''+L_E1korname.ValueCaption+''' ,     ' +#13+
                  '       E1VALVIEW = '''+E_E1VALVIEW.Text+''' ,             ' +#13+
                  '       E1CONTIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                  ' WHERE WORKDATE  = ''%s''       ' +#13+
                  '   and empno     = ''%s''       ' ,
                  [WORKDATE,
                   Ed_empno.text])
  end;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
       MessageDlg(Bt_Insert.Caption+' 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
       if  Bt_Insert.Caption ='반려' then
       begin
            // 인턴에게 메일 보내기 시작
            //==============================================================================//
            // 메일을 보낸다.
            MessageDlg('인턴사원에게 일일업무일지 반려 메일이 발송됩니다.',mtInformation,[mbOK],0);
            SendProgID  := 'PEF5020A';  //프로그램 ID
            SendEmpno   := ve1empno;    //발송자
            RcveEmpno   := vempno;
            MailSubject := '인턴사원 OJT 일일업무일지_'+WORKDATE+' 반려 메일';
            MailBody    := '작성하여 결재상신하신 인턴사원 OJT 일일업무일지를 멘토께서 반려하였습니다. '+#13#13+
                           '일일업무일지_'+WORKDATE+'의 과제에 대한 업무수행결과를 다시 작성하셔서 결재상신하시기 바랍니다.'+#13#13#13+
                           '[종합인사정보시스템] ▶ [평가] ▶ [인턴 평가] ▶ 인턴사원 OJT 일일업무일지';
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

       end;
       gbChanged := False;
       Grid_Data;
       PG_LoadPlan;
       Bt_SrhClick(Sender);
       MessageDlg(Bt_Insert.Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
  end;
end;

procedure TDiaryForm.PG_LoadPlan;
var
  i    : Integer;
  S    : TOnSchItem;
  F    : TOnDayItem;
  Kfr  : String;
  Kto  : String;
  FSql : String;
begin
  PI_Cal.DeleteSchedule;

  if (PI_Cal.StartDay = '') or (PI_Cal.LastDay = '') then     System.Exit;

  Kfr := Copy(PI_Cal.StartDay,1,4)+'/'+Copy(PI_Cal.StartDay,5,2)+'/'+Copy(PI_Cal.StartDay,7,2);
  Kto := Copy(PI_Cal.LastDay,1,4)+'/'+Copy(PI_Cal.LastDay,5,2)+'/'+Copy(PI_Cal.LastDay,7,2);

  with Tds_il do
  begin
       Close;
       ClearFieldInfo;
       AddField('WORKDATE'     , ftString,  100 );
       AddField('EMPNO'        , ftString,  100 );
       AddField('KORNAME'      , ftString,  100 );
       AddField('ORGNUM'       , ftString,  100 );
       AddField('DEPTCODE'     , ftString,  100 );
       Sql.Clear;
       FSql := 'SELECT WORKDATE, EMPNO, KORNAME, ORGNUM, DEPTCODE '+
               '  FROM PEINTOJT a                                 '+
               ' WHERE empno    = '''+ed_empno.Text  +'''         '+
               '   and WORKDATE >= ''%s'' AND WORKDATE <= ''%s''  ';
       FSql := Format(FSql,[PI_Cal.StartDay, PI_Cal.LastDay]);
       Sql.Text := FSql;
       ServiceName := 'HINSA_select';
       Open;

       while not Eof do
       begin
            F := nil;
            for i := 0 to PI_Cal.DayItems.Count-1 do
            begin
                 if (PI_Cal.DayItems[i].Year  = Copy(FieldByName('WORKDATE').AsString,1,4)) and
                    (PI_Cal.DayItems[i].Month = Copy(FieldByName('WORKDATE').AsString,5,2)) and
                    (PI_Cal.DayItems[i].Day   = Copy(FieldByName('WORKDATE').AsString,7,2)) then
                 begin
                      F := PI_Cal.DayItems[i]; // 이미 있음
                      Break;
                 end;
            end;

            if F = nil then
            begin
                 F       := PI_Cal.DayItems.Add;
                 F.year  := Copy(FieldByName('WORKDATE').AsString,1,4);
                 F.month := Copy(FieldByName('WORKDATE').AsString,5,2);
                 F.day   := Copy(FieldByName('WORKDATE').AsString,7,2);
                 F.Box.ImageList := IMG_il;
            end;

            try
                 S         := F.SchItems.Add;
                 S.Ins     := True;  // 일정추가/수정 옵션 (True 추가, False 수정)
                 S.kind    := '0';
                 S.alam         := False;
                 S.network      := False;
//                 S.sendname     := FieldByName('KORNAME').AsString;
//                 S.content.Text := FieldByName('COMMENTS').AsString;
                 S.subject      := FieldByName('KORNAME').AsString;
            except
                 begin
                      MessageDlg('현재 동일한 일정이 존재합니다...',mtError,[mbOK],0);
                      S.Free;
                      Break;
                 end;
            end;
            Next;
       end;

       Close;
  end;
end;

procedure TDiaryForm.SB_lunClick(Sender: TObject);
begin
  if SB_lun.Caption = '음력 보이기' then
  begin
       SB_lun.Caption    := '음력 숨기기';
       PI_Cal.LunarCheck := True;
  end
  else
  begin
       SB_lun.Caption    := '음력 보이기';
       PI_Cal.LunarCheck := False;
  end;
end;

procedure TDiaryForm.SB_monthClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peMonth;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 일일업무일지 열람';
  PG_LoadPlan;
end;

procedure TDiaryForm.SB_weekClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peWeek;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 일일업무일지 열람';
  PG_LoadPlan;
end;

procedure TDiaryForm.SB_incClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
       PI_Cal.NextMonth
  else
       PI_Cal.NextWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 일일업무일지 열람';
end;

procedure TDiaryForm.SB_decClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
       PI_Cal.PrevMonth
  else
       PI_Cal.PrevWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 일일업무일지 열람';
end;

procedure TDiaryForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  START := True;
  EempFind := True;
  panel2.Height := 550;
  panel2.Top    := 140;

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

procedure TDiaryForm.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  sTemp : String;
begin
  if FL_Start then
  begin
       FL_Start := False;
       SF_Main.Refresh;

       Pempno   := Hinsa_Param(CmdLine, 1);
       Pkorname := Hinsa_Param(CmdLine, 2);
       Password := Hinsa_Param(CmdLine, 3);
       Ppermission := copy(Hinsa_Param(CmdLine,7),1,1);

       Wempno   := Pempno;

       fnSetVariable(1);
       fnSetVariable(2);
       fnSetVariable(3);
       fnSetVariable(4);

       if (Workemp1 = Pempno) or (Workemp2 = Pempno) or
          (Workemp3 = Pempno) or (Workemp4 = Pempno) or
          (Workemp5 = Pempno) or (Copy(Pempno,1,1) = 'D' ) then
       begin
            Loginemp.Visible := True;
            Bt_Srh.Visible   := True;
       end
       else
       begin
            Loginemp.Text    := Pempno;   //사번기억
            Loginemp.Visible := False;
            Bt_Srh.Visible   := False;
       end;

       Ed_WORKDATE.Text        := copy(pSysdate,1,4)+'-'+
                                  copy(pSysdate,5,2)+'-'+
                                  copy(pSysdate,7,2);

       Bt_SrhClick(sender);
  end;
end;

procedure TDiaryForm.bt_CalenClick(Sender: TObject);
begin
  if Panel2.visible  then     Panel2.visible := false
  else                        Panel2.visible := true;
end;

procedure TDiaryForm.ComponentReadOnly(BValue:Boolean);
begin
  bt_Calen.Enabled     := not BValue;
  Ed_WorkDate.ReadOnly := BValue;
  E_OPINION1.ReadOnly  := BValue;
  E_OPINION2.ReadOnly  := BValue;
  E_OPINION3.ReadOnly  := BValue;
  E_E1VALVIEW.ReadOnly := not BValue;
end;

procedure TDiaryForm.ComponentClear;
begin
  E_Status.Text            := '입력';
  E_OPINION1.Font.Color    := clGray;
  E_OPINION2.Font.Color    := clGray;
  E_OPINION3.Font.Color    := clGray;
  E_E1VALVIEW.Font.Color   := clGray;
  E_OPINION1.Lines.Clear;
  E_OPINION2.Lines.Clear;
  E_OPINION3.Lines.Clear;
  E_E1VALVIEW.Lines.Clear;
{
  E_OPINION1.Lines.Add('부서 업무중에서 선정하되, 인턴사원으로서의 참신한 관점을 이용할 수 있는');
  E_OPINION1.Lines.Add('창의적이고 생산적인 업무와 연관된 과제를 선정(Max 1000Byte)');
  E_OPINION2.Lines.Add('개인과제에 대해 사전에 설정된 목표, Output Image 등을 작성하되,');
  E_OPINION2.Lines.Add('목표관리[MBO(Management By Objective)]가 가능하도록 되도록이면 ');
  E_OPINION2.Lines.Add('정량적인 과제목표로 설정(Max 1000Byte)');}
  E_OPINION1.Text := vOPINION1;
  E_OPINION2.Text := vOPINION2;
  E_OPINION3.Lines.Add('그 날에 수행한 부서 업무 활동을 기재(Max 2000Byte)');
  E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일의 관찰 평가 의견을');
  E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
  Bt_Insert.Caption  := '저장';
  Bt_Confirm.Caption := '결재상신';
  Bt_Insert.Visible  := True;
  Bt_Confirm.Visible  := True;
end;

procedure TDiaryForm.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  MemoText : string;
begin
  i := 222;
  if  key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
       MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
       TOnMemo(Sender).Clear;
       TOnMemo(Sender).Lines.Append(MemoText);
  end;
end;

procedure TDiaryForm.PI_CalClick(Sender: TObject);
begin
  Ed_WORKDATE.Text := IntToStr(PI_Cal.Year)+'-'+
                      FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Month)))+'-'+
                      FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Day  )));
  panel2.Visible := false;

  Read_Data;

  SB_monthClick(Sender);
  FL_Ins := True;
  check := 0;

  E_OPINION1.setfocus;
end;

procedure TDiaryForm.E_OPINION1Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',E_Opinion1.Text)  > 0)  then E_Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_Opinion2.Text)  > 0)  then E_Opinion2.Text  := '';
  if (Pos('(Max 2000Byte)',E_Opinion3.Text)  > 0)  then E_Opinion3.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1Valview.Text)  > 0) then E_E1Valview.Text := '';
  E_Opinion1.Font.Color  := clBlack;
  E_Opinion2.Font.Color  := clBlack;
  E_Opinion3.Font.Color  := clBlack;
  E_E1Valview.Font.Color := clBlack;
end;

procedure TDiaryForm.DS_GridDataChange(Sender: TObject; Field: TField);
var
  sSQL, Workdate : String;
begin
  if (LGubun = 2) or (check <> 0) then
  Ed_Workdate.Text := copy(T_Grid.fieldbyname('Workdate').AsString,1,4)+'-'+
                      copy(T_Grid.fieldbyname('Workdate').AsString,5,2)+'-'+
                      copy(T_Grid.fieldbyname('Workdate').AsString,7,2);
  E_OPINION1.Text  := T_Grid.fieldbyname('OPINION1').AsString;
  E_OPINION2.Text  := T_Grid.fieldbyname('OPINION2').AsString;
  E_OPINION3.Text  := T_Grid.fieldbyname('OPINION3').AsString;
  E_E1VALVIEW.Text := T_Grid.fieldbyname('E1VALVIEW').AsString;
  gubun := 1;

  WORKDATE := copy(Ed_WORKDATE.text,1,4)+copy(Ed_WORKDATE.text,6,2)+copy(Ed_WORKDATE.text,9,2);
  sSQL := 'SELECT WORKDATE, EMPNO, CONYN, E1EMPNO, E1CONYN              '+
          '  FROM PEINTOJT a                                            '+
          ' WHERE empno    = '''+ ed_empno.Text  +'''                   '+
          '   AND workdate = '''+ Workdate       +'''                   '+
          ' Order by WORKDATE Desc                                      ';
  With TCDS do
  begin
       Close;
       ClearFieldInfo;
       AddField('WORKDATE'  , ftString,  100 );
       AddField('EMPNO'     , ftString,  100 );
       AddField('CONYN'     , ftString,  100 );
       AddField('E1EMPNO'   , ftString,  100 );
       AddField('E1CONYN'   , ftString,  100 );
       Sql.Clear;
       Sql.Text := sSQL;
       ServiceName := 'HINSA_select';
       Open;
       if TCDS.RecordCount >= 0 then
       begin
            vConyn   := TCDS.fieldbyname('Conyn').AsString;
            vE1Conyn := TCDS.fieldbyname('E1Conyn').AsString;
            if vConyn = 'N' then
                 E_Status.Text := '등록'
            else if (vConyn = 'Y') and (vE1Conyn = 'N') then
                 E_Status.Text := '결재상신'
            else if vE1Conyn = 'Y' then
                 E_Status.Text := '결재';
       end
       else
       begin
            vConyn   := 'N';
            vE1Conyn := 'N';
            E_Status.Text := '입력';
       end;
  end;

  if   ((LGubun = 1) and (vConyn ='N')) or ((LGubun = 2) and (vE1Conyn ='N')) then
  begin
       Bt_insert.visible  := true;
       Bt_confirm.visible := true;
  end
  else if ((LGubun = 1) and (vConyn ='Y')) or ((LGubun = 2) and (vE1Conyn ='Y')) then
  begin
       Bt_insert.visible  := false;
       Bt_confirm.visible := false;
  end;

  if E_E1VALVIEW.Text ='' then
  begin
       E_E1VALVIEW.Font.Color := clGray;
       E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일의 관찰 평가 의견을');
       E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
  end
  else
  begin
       E_E1VALVIEW.Font.Color := clBlack;
  end;
end;

procedure TDiaryForm.DB_GridCellClick(Column: TColumn);
begin
  panel2.Visible   := false;
  DS_GridDataChange(DB_Grid,T_Grid.Fields[0]);
end;

procedure TDiaryForm.DB_GridEnter(Sender: TObject);
begin
  check := 1;  
end;

procedure TDiaryForm.DB_GridExit(Sender: TObject);
begin
  check := 0;
end;

procedure TDiaryForm.Bt_ConfirmClick(Sender: TObject);
var
   SQLTEXT  : String;
   WORKDATE : String;
begin
  if gubun = 0 then
  begin
       MessageDlg('저장버튼을 눌러 내용을 먼저 저장하시기 바랍니다.',mtInformation, [mbOk], 0);
       system.exit;
  end;

  WORKDATE := copy(Ed_WORKDATE.text,1,4)+copy(Ed_WORKDATE.text,6,2)+copy(Ed_WORKDATE.text,9,2);

  if (Pos('(Max 1000Byte)',E_Opinion1.Text)  > 0) then E_Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_Opinion2.Text)  > 0) then E_Opinion2.Text  := '';
  if (Pos('(Max 2000Byte)',E_Opinion3.Text)  > 0) then E_Opinion3.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1VALVIEW.Text) > 0) then E_E1VALVIEW.Text := '';

  if MessageBox(handle,PChar(Bt_Confirm.Caption+' 작업을 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                             '등록하신 내역에 대해 모두 확인을 마치셨으면 '+Bt_Confirm.Caption+' 작업을 하시기 바랍니다.'+#13+#13+
                             Bt_Confirm.Caption+' 작업을 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       system.Exit;
  end;


  if Bt_Confirm.Caption = '결재상신' then
  begin
       if (trim(E_OPINION1.Text) = '') or (trim(E_OPINION2.Text)  = '') or (trim(E_OPINION3.Text) = '')  then
            begin
                 MessageDlg('과제명, 과제목표, 업무수행결과를 먼저 성실히 등록하시기 바랍니다.',mtInformation, [mbOk], 0);
                 system.exit;
            end;
       SQLText := Format(
                            'UPDATE PEINTOJT  SET                                       ' +#13+
                            '       OPINION1  = '''+E_OPINION1.Text+''' ,               ' +#13+
                            '       OPINION2  = '''+E_OPINION2.Text+''' ,               ' +#13+
                            '       OPINION3  = '''+E_OPINION3.Text+''' ,               ' +#13+
                            '       UPDTIME   = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ' +#13+
                            '       CONYN     = ''Y''                                   ' +#13+
                            ' WHERE WORKDATE  = ''%s''       ' +#13+
                            '   and empno     = ''%s''       ' ,
                            [WORKDATE,
                             Ed_empno.text]);

       TDml.Close;
       TDml.Sql.Clear;
       TDml.Sql.Text := SqlText;
       TDml.ServiceName := 'PIT1030A_DML';

       if NOT TDml.Execute then
            MessageDlg('결재상신 작업 중 에러가 발생하였습니다.'+#13 +
                       '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
       else
       begin
            // 멘토에게 메일 보내기 시작
            //==============================================================================//
            // 메일을 보낸다.
            MessageDlg('멘토에게 일일업무일지 확인 요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
            SendProgID  := 'PEF5020A';  //프로그램 ID
            SendEmpno   := vempno;      //발송자(로그인 사번)
            RcveEmpno   := ve1empno;
            MailSubject := '인턴사원 OJT 일일업무일지_'+WORKDATE;
            MailBody    := '인턴사원['+ L_korname.ValueCaption +']이/가 OJT 일일업무일지를 작성하였습니다. '+#13#13+
                           '인턴사원['+ L_korname.ValueCaption +']에 대하여 과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일('+WORKDATE+')의 '+#13#13+
                           '관찰 평가 의견을 작성하셔서 결재하시기 바랍니다. '+#13#13#13+
                           '[종합인사정보시스템] ▶ [평가] ▶ [인턴 평가] ▶ 인턴사원 OJT 일일업무일지';
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
            gbChanged := False;
            Grid_Data;
            PG_LoadPlan;
            Bt_SrhClick(Sender);
            MessageDlg('결재상신 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
       end;
  end
  else
  if Bt_Confirm.Caption = '결재' then
  begin
       if (trim(E_E1VALVIEW.Text) = '') then
       begin
            MessageDlg('멘토 의견을 먼저 등록하시기 바랍니다.',mtInformation, [mbOk], 0);
            E_E1VALVIEW.SetFocus;
            system.exit;
       end;
       SQLText := Format(
                       'UPDATE PEINTOJT  SET                                      ' +#13+
                       '       E1EMPNO   = '''+L_E1empno.ValueCaption+''' ,       ' +#13+
                       '       E1KORNAME = '''+L_E1korname.ValueCaption+''' ,     ' +#13+
                       '       E1VALVIEW = '''+E_E1VALVIEW.Text+''' ,             ' +#13+
                       '       E1CONYN   = ''Y'' ,                                ' +#13+
                       '       E1CONTIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                       ' WHERE WORKDATE  = ''%s''       ' +#13+
                       '   and empno     = ''%s''       ' ,
                       [WORKDATE,
                        Ed_empno.text]);

       TDml.Close;
       TDml.Sql.Clear;
       TDml.Sql.Text := SqlText;
       TDml.ServiceName := 'PIT1030A_DML';

       if NOT TDml.Execute then
            MessageDlg('결재상신 작업 중 에러가 발생하였습니다.'+#13 +
                       '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
       else
       begin
            // 인턴에게 메일 보내기 시작
            //==============================================================================//
            // 메일을 보낸다.
            MessageDlg('인턴사원에게 일일업무일지 결재 완료 메일이 발송됩니다.',mtInformation,[mbOK],0);
            SendProgID  := 'PEF5020A';  //프로그램 ID
            SendEmpno   := ve1empno;    //발송자
            RcveEmpno   := vempno;
            MailSubject := '인턴사원 OJT 일일업무일지_'+WORKDATE+' 결재 완료';
            MailBody    := '작성하여 결재상신하신 인턴사원 OJT 일일업무일지를 멘토께서 결재하였습니다. '+#13#13+
                           '인턴사원 OJT 일일업무일지_'+WORKDATE+'의 멘토 의견을 확인하시기 바랍니다.'+#13#13#13+
                           '[종합인사정보시스템] ▶ [평가] ▶ [인턴 평가] ▶ 인턴사원 OJT 일일업무일지';
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

            gbChanged := False;
            Grid_Data;
            PG_LoadPlan;
            Bt_SrhClick(Sender);
            //MessageDlg('결재 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
       end;
  end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TDiaryForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       ServiceName := 'PET1010A_dml';
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
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

procedure TDiaryForm.OutputBtnClick(Sender: TObject);
begin
  OutputForm := TOutputForm.Create(nil);
  OutputForm.Show;
  OutputForm.E_Workdatefr.Text := Ed_WORKDATE.text;
  OutputForm.E_Workdateto.Text := Ed_WORKDATE.text;
end;

procedure TDiaryForm.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_Emp.empno <> '' then
  begin
       Ed_empno.Text           := Fm_Emp.empno;
       L_korname.ValueCaption  := Fm_Emp.Korname;
       L_deptcode.Hint         := Fm_Emp.orgnum;
       L_deptcode.ValueCaption := Fm_Emp.Deptcode;
       L_deptname.ValueCaption := Fm_Emp.Deptname;
       L_e1empno.ValueCaption  := Fm_Emp.e1empno;
       L_e1korname.ValueCaption:= Fm_Emp.e1Korname;

       vempno                  := Fm_Emp.empno;
       vE1Empno                := Fm_Emp.e1empno;

       Grid_Data;
       Read_Data;

       SB_monthClick(Sender);
       FL_Ins := True;
       check := 0;
  end;
end;

procedure TDiaryForm.Ed_empnoInitPopup(Sender: TObject);
begin
  Fm_Emp.Edit        := TOnWinPopupEdit(Sender);
  Fm_Emp.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TDiaryForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       Bt_SrhClick(Sender);
       inherited;
       Key := #0;
  end;
end;

procedure TDiaryForm.E_OPINION1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > TOnMemo(Sender).Tag  then
  begin
       MessageDlg('내용은 '+inttoStr(TOnMemo(Sender).Tag)+'줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

procedure TDiaryForm.CB_SrhClick(Sender: TObject);
begin
  vEmpno        := '';
  Ed_empno.Text := CB_empno.Text;
  Grid_Data;
  Read_Data;

  SB_monthClick(Sender);
  FL_Ins := True;
  check := 0;
end;

procedure TDiaryForm.cb_empnoChange(Sender: TObject);
begin
  Ed_empno.Text := CB_empno.Text;
  Csel_SQL      := 'SELECT A.korname FROM PEINTMAS A     '+#13+
                  ' WHERE rabasdate = '''+prabasdate+''' '+#13+
                  '   and A.empno   like '''+ Ed_empno.Text +'''||''%'' ';

  Csel_Open;
  L_korname.ValueCaption   := TCsel_gfd(1);
  CB_SrhClick(Sender);
end;

procedure TDiaryForm.cb_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       CB_SrhClick(Sender);
       inherited;
       Key := #0;
  end;
end;

procedure TDiaryForm.CB_RDateChange(Sender: TObject);
begin
  prabasdate := CB_RDate.Text;
  Select_BaseData;
end;

procedure TDiaryForm.CB_RDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       Select_BaseData;
       inherited;
       Key := #0;
  end;
end;

end.
