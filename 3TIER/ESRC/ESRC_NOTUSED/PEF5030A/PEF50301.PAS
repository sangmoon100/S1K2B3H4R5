unit PEF50301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, PeJeonBtnDateEdit, MemDS, DBAccess, Func, Grids,
  OnPimcalendar, ImgList, Buttons, OnDBGrid, DBGrids, OnGrDBGrid, QuickRpt,
  Qrctrls, OnLineLabel, OnEditNumCtl;
  
type
  TPEF5030 = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
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
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    TCSel: TTMaxDataSet;
    E_OPINION1: TOnMemo;
    E_OPINION2: TOnMemo;
    E_OPINION3: TOnMemo;
    Tds_il: TTMaxDataSet;
    Bt_print: TOnFocusButton;
    Label1: TLabel;
    E_E1VALVIEW: TOnMemo;
    L_E1korname: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    T_Grid: TTMaxDataSet;
    DS_Grid: TDataSource;
    Bt_Confirm: TOnFocusButton;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    Shape2: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape3: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Shape4: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnWinPopupEdit1: TOnWinPopupEdit;
    OnWinPopupEdit2: TOnWinPopupEdit;
    OnWinPopupEdit3: TOnWinPopupEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    OM: TOnMemo;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    OnMemo1: TOnMemo;
    OnMemo2: TOnMemo;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    ON_E1App1: TOnNumberEdit;
    ON_E1App2: TOnNumberEdit;
    ON_E1App3: TOnNumberEdit;
    ON_E1App4: TOnNumberEdit;
    ON_E1App9: TOnNumberEdit;
    ON_E1App10: TOnNumberEdit;
    ON_E1App5: TOnNumberEdit;
    ON_E1App6: TOnNumberEdit;
    ON_E1App7: TOnNumberEdit;
    ON_E1App8: TOnNumberEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Bt_printClick(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_OPINION1Click(Sender: TObject);
    procedure DS_GridDataChange(Sender: TObject; Field: TField);
    procedure Bt_ConfirmClick(Sender: TObject);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure Csel_Open;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Wempno, vEMPNO, vE1Empno, vConyn, vE1Conyn : String;
    Pempno, Pkorname, Password, Ppermission: String;
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
    procedure ComponentClear;
    procedure Select_BaseData;
    procedure Grid_Data;
  end;

var
  PEF5030: TPEF5030;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;
  Csel_SQL : String;
  Csel_ret : Boolean;
implementation

uses PEF50302;

{$R *.DFM}

procedure TPEF5030.FormCreate(Sender: TObject);
begin
     FL_Start := True;
     START := True;
     EempFind := True;
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
end;

procedure TPEF5030.FormPaint(Sender: TObject);
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

       if (Copy(Pempno,1,1) <> 'D' ) then
            Loginemp.Text := Pempno;   //사번기억 SHM

       fnSetVariable(1);
       fnSetVariable(2);
       fnSetVariable(3);

       if (Workemp1 = Pempno) or (Workemp2 = Pempno) or
          (Workemp3 = Pempno) or (Workemp4 = Pempno) or
          (Workemp5 = Pempno) or (Copy(Pempno,1,1) = 'D' ) then
       begin
            Loginemp.Visible := True;
            Bt_Srh.Visible   := True;
       end
       else
       begin
            Loginemp.Visible := False;
            Bt_Srh.Visible   := False;
       end;

       Bt_SrhClick(sender);
  end;
end;

procedure TPEF5030.Select_BaseData;
begin
  Ed_empno.Text := Loginemp.Text;
  wEmpno        := Loginemp.Text;
  Csel_SQL      := 'SELECT A.empno||'';''||A.korname||'';''||A.orgnum||'';''||A.deptcode||'';''||               '+#13+
                  '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''|| '+#13+
                  '       A.E1empno||'';''||A.E1korname                                                         '+#13+
                  '  FROM PEINTMAS A                                                                            '+#13+
                  ' WHERE rabasdate = '''+prabasdate+'''                         '+#13+
                  '   and (    (A.empno   like '''+ Ed_empno.Text +'''||''%'')   '+#13+
                  '         OR (A.E1empno like '''+ Ed_empno.Text +'''||''%'') ) ';

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

  if TCsel.RecordCount < 1 then
  begin
    MessageDlg('인턴사원이나 멘토가 아닙니다.'+#13+
               '프로그램을 종료합니다.',mtInformation,[mbOk],0);
    ExitBtnClick(ExitBtn);
    System.exit;
  end;

  if Wempno = vEmpno then
  begin
    Lgubun := 1;
    Bt_Confirm.Caption := '결재상신';
  end
  else if Wempno = vE1Empno  then
  begin
    Lgubun := 2;
    Bt_Confirm.Caption := '결재';
  end;
end;

procedure TPEF5030.Bt_SrhClick(Sender: TObject);
begin
  Select_BaseData;
  Grid_Data;
  FL_Ins := True;
  check := 0;
end;

function TPEF5030.TCsel_gfd(p_loc: Integer): String;
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

procedure TPEF5030.Csel_Open;
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

function TPEF5030.fnSetVariable(mGubun: Integer): Boolean;
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
  end;

  TCsel.Close;
  Result := True;
end;

procedure TPEF5030.Grid_Data;
var
  sSQL : String;
begin
  sSQL :=  'SELECT WORKDATE, OPINION1, OPINION2, OPINION3, E1VALVIEW '+
           '  FROM PEINTOJT a                                        '+
           ' WHERE empno    = '''+ed_empno.Text  +'''                ';

  if LGubun = 2 then
       sSQL := sSQL + '    And Conyn = ''Y''                         ';
  sSQL := sSQL + ' Order by WORKDATE Desc, E1valview                 ';
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
  end;
end;

procedure TPEF5030.Bt_insertClick(Sender: TObject);
var
   SQLTEXT  : String;
   WORKDATE : String;
begin
  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
       system.exit;

  if (Pos('(Max 1000Byte)',E_Opinion1.Text)  > 0) then E_Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_Opinion2.Text)  > 0) then E_Opinion2.Text  := '';
  if (Pos('(Max 2000Byte)',E_Opinion3.Text)  > 0) then E_Opinion3.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1VALVIEW.Text) > 0) then E_E1VALVIEW.Text := '';

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
       if (trim(E_E1VALVIEW.Text) <> '') then
            SQLText := Format(
                       'UPDATE PEINTOJT  SET                                      ' +#13+
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
       MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
       gbChanged := False;
       Grid_Data;
       Bt_SrhClick(Sender);
       MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
  end;
end;

procedure TPEF5030.ComponentClear;
begin
  E_OPINION1.Font.Color    := clGray;
  E_OPINION2.Font.Color    := clGray;
  E_OPINION3.Font.Color    := clGray;
  E_E1VALVIEW.Font.Color   := clGray;
  E_OPINION1.Lines.Clear;
  E_OPINION2.Lines.Clear;
  E_OPINION3.Lines.Clear;
  E_E1VALVIEW.Lines.Clear;
  E_OPINION1.Lines.Add('부서 업무중에서 선정하되, 인턴사원으로서의 참신한 관점을 이용할 수 있는');
  E_OPINION1.Lines.Add('창의적이고 생산적인 업무와 연관된 과제를 선정(Max 1000Byte)');
  E_OPINION2.Lines.Add('개인과제에 대해 사전에 설정된 목표, Output Image 등을 작성하되,');
  E_OPINION2.Lines.Add('목표관리[MBO(Management By Objective)]가 가능하도록 되도록이면 ');
  E_OPINION2.Lines.Add('정량적인 과제목표로 설정(Max 1000Byte)');
  E_OPINION3.Lines.Add('그 날에 수행한 부서 업무 활동을 기재(Max 2000Byte)');
  E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 업무를 임하는 태도 등 OJT 당일의 관찰 평가 의견을');
  E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
end;

procedure TPEF5030.Bt_printClick(Sender: TObject);
var sSql : String;
begin
  sSQL := 'SELECT WORKDATE, EMPNO, KORNAME, E1EMPNO, E1KORNAME          '+
          '  FROM PEINTOJT a                                            '+
          ' WHERE empno    = '''+ ed_empno.Text  +'''                   '+
          ' Order by WORKDATE                                           ';
  With TCDS do
  begin
       Close;
       ClearFieldInfo;
       AddField('WORKDATE'  , ftString,  100 );
       AddField('EMPNO'     , ftString,  100 );
       AddField('KORNAME'   , ftString,  100 );
       AddField('E1EMPNO'   , ftString,  100 );
       AddField('E1KORNAME' , ftString,  100 );
       Sql.Clear;
       Sql.Text := sSQL;
       ServiceName := 'HINSA_select';
       Open;
       if TCDS.RecordCount > 0 then
       begin
            sSQL :=  'SELECT WORKDATE, OPINION1, OPINION2, OPINION3, E1VALVIEW '+
                     '  FROM PEINTOJT a                                        '+
                     ' WHERE empno    = '''+ed_empno.Text  +'''                '+
                     ' Order by WORKDATE                                       ';
            with TDS1 do
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
            end;
       end;
  end;

  if TCDS.recordcount < 1 then
  begin
       MessageDlg('작성하신 내용이 없습니다.',mtError,[mbOK],0);
       exit;
  end;

//  QuickRep1.Preview;
end;

procedure TPEF5030.MemoKeyDown(Sender: TObject; var Key: Word;
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

procedure TPEF5030.E_OPINION1Click(Sender: TObject);
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

procedure TPEF5030.DS_GridDataChange(Sender: TObject; Field: TField);
var
  sSQL, Workdate : String;
begin
  if check <> 0 then
  E_OPINION1.Text  := T_Grid.fieldbyname('OPINION1').AsString;
  E_OPINION2.Text  := T_Grid.fieldbyname('OPINION2').AsString;
  E_OPINION3.Text  := T_Grid.fieldbyname('OPINION3').AsString;
  E_E1VALVIEW.Text := T_Grid.fieldbyname('E1VALVIEW').AsString;

  sSQL := 'SELECT WORKDATE, EMPNO, CONYN, E1EMPNO, E1CONYN              '+
          '  FROM PEINTOJT a                                            '+
          ' WHERE empno    = '''+ ed_empno.Text  +'''                   '+
          '   AND workdate = '''+ Workdate       +'''                   '+
          ' Order by WORKDATE                                           ';
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
       if TCDS.RecordCount >= 1 then
       begin
            vConyn   := TCDS.fieldbyname('Conyn').AsString;
            vE1Conyn := TCDS.fieldbyname('E1Conyn').AsString;
       end
       else
       begin
            vConyn   := 'N';
            vE1Conyn := 'N';
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

procedure TPEF5030.Bt_ConfirmClick(Sender: TObject);
var
   SQLTEXT  : String;
   WORKDATE : String;
begin
  if gubun = 0 then
  begin
       MessageDlg('저장버튼을 눌러 내용을 먼저 저장하시기 바랍니다.',mtInformation, [mbOk], 0);
       system.exit;
  end;

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

(*
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
            gbChanged := False;
            Grid_Data;
            PG_LoadPlan;
            Bt_SrhClick(Sender);
            MessageDlg('결재 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
       end;
  end;

*)
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TPEF5030.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
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

procedure TPEF5030.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
