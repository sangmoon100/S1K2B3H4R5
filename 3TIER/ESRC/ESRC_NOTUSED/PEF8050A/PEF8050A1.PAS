unit PEF8050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, PDownLoad,
  OnInsaCommon;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_payraname: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TDS_Works: TTMaxDataSet;
    DS_Works: TDataSource;
    L_Deptname: TOnShapeLabel;
    P_Opinion: TPanel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel8: TOnSectionLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    E_MIDTOTVIEW: TOnMemo;
    E_MIDCOMVIEW: TOnMemo;
    E_MIDPERVIEW: TOnMemo;
    DBG_works: TOnGrDbGrid;
    On_Comp: TOnMemo;
    L_Rabasdate: TOnShapeLabel;
    Memo1: TMemo;
    TDS: TTMaxDataSet;
    OnSectionLabel5: TOnSectionLabel;
    Shape10: TShape;
    Label9: TLabel;
    E_MIDVALVIEW: TOnMemo;
    BT_Help: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_Korname: TOnShapeLabel;
    P_Taskcode: TLabel;
    P_propeltask: TPanel;
    P_mainweight: TPanel;
    P_gubun: TPanel;
    BT_Print: TOnFocusButton;
    Label1: TLabel;
    On_Value: TOnMemo;
    Panel7: TPanel;
    Panel10: TPanel;
    E_Empno: TTMaxPersonPopupEdit;
    Bt_Eempno: TOnFocusButton;
    Panel11: TPanel;
    Panel15: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label6: TLabel;
    Panel17: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    TDS_Works1: TTMaxDataSet;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel3: TOnSectionLabel;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure E_EmpnoEnter(Sender: TObject);
    procedure DBG_worksCellClick(Column: TColumn);
    procedure BT_PrintClick(Sender: TObject);
    procedure E_MIDVALVIEWKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_MIDVALVIEWExit(Sender: TObject);
    procedure Bt_EempnoClick(Sender: TObject);
  private
    { Private declarations }
    vParamSQL  : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    procedure ConFirm_BtnVisible;
    procedure OpinionView;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Select_BaseData;
    procedure Works_data;
    function  FL_CheckNullEvalview:Boolean;     //등록하지 않은 항목이 있는지 여부 체크
    function  FL_CheckNullEcomview:Boolean;
    function  FL_CheckNullEperview:Boolean;
    function  FL_CheckNullEtotview:Boolean;
  public
    { Public declarations }
     vEmpno     : String;
     PEmpno     : String;
     Pevcno     : String;   // 평가표 번호
     Ppaycl     : string;
     Ppayra     : String;
     Porgnum    : String;
     Pdeptcode  : String;
     PFinyn     : String;
     PConyn     : String;
     EGubun     : String;
     sRabasdate : String;
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Check      : Integer;
     LE1empno   : String;
     LE2empno   : String;

     Workemp1   : String;
     Workemp2   : String;
     Workemp3   : String;
     Workemp4   : String;
     Workemp5   : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm, UHelp, UPrint;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
var
     ParamVariant: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10);
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

  // 평가기준일을 읽어온다
  ParamVariant := 'select DISTINCT rabasdate  ' +
                  '  FROM pejnobas            ' +
                  'ORDER BY rabasdate desc    ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  sRabasdate   := Csel_gfd(1);

  L_Rabasdate.ValueCaption  := copy(sRabasdate,1,4)+'-'+copy(sRabasdate,5,2)+'-'+copy(sRabasdate,7,2);

  // 평가담당자를 읽어온다
  ParamVariant := 'select Value3|| '';'' ||Value4||'';''|| ' +
                  '       Value5                           ' +
                  '  FROM pejnobas                         ' +
                  ' where rabasdate = '''+sRabasdate+'''   ' ;

  Csel_SQL     := ParamVariant;
  Csel_Open;
  Workemp1     := Csel_gfd(1);
  Workemp2     := Csel_gfd(2);
  Workemp3     := Csel_gfd(3);


  Check        := 0;
  Pempno       :=  Passemp(cmdline,1);
  E_empno.Text :=  Passemp(cmdline,1);
end;

procedure TFM_Main.Select_BaseData;
var
     ParamVariant: String;
     i : integer;
     vEkind : String;
begin
  ParamVariant := 'SELECT empno||'';''||korname||'';''||paycl||'';''||payra||'';''||'';''||                '+#13+
                  '       orgnum||'';''||deptcode||'';''||                                                 '+#13+
                  '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''|| '+#13+
                  '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''|| '+#13+
                  '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)     '+#13+
                  '       ||'';''||e1empno||'';''||E1MIDCONYN                                              '+#13+
                  '  FROM PEJNOMAS A                                                                       '+#13+
                  ' WHERE rabasdate = '''+ sRabasDate +'''                                                 '+#13+
                  '   AND (empno like '''+ Ed_empno.Text +'''||''%''   OR  korname like '''+ Ed_empno.Text +'''||''%'')      ';

  Csel_SQL := ParamVariant; // edit1.Text :=  ParamVariant;
  Csel_Open;

  vEmpno                   := Csel_gfd(1);
  Ed_Empno.Text            := Csel_gfd(1);
  L_korname.ValueCaption   := Csel_gfd(2);
  Ppaycl                   := Csel_gfd(3);
  Ppayra                   := Csel_gfd(4);
  Porgnum                  := Csel_gfd(5);
  Pdeptcode                := Csel_gfd(6);
  L_payraname.ValueCaption := Csel_gfd(8);
  L_Deptname.ValueCaption  := Csel_gfd(10);
  LE1empno                 := Csel_gfd(11);
  PFinyn                   := Csel_gfd(12);

  Works_data;
end;

procedure TFM_Main.Works_data;
var
     SqlText : string;
begin
  with TDS_Works1 do
  begin
    SqlText := Format('SELECT TASKNAME, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, TASKCODE '+
                      '  FROM PEJNOEMP_DET A                                       '+
                      ' WHERE A.RABASDATE = ''%s''                                 '+
                      '   AND A.EMPNO     = ''%s''                                 ',[sRabasdate,Ed_empno.Text]);
    Close;
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('TASKNAME'       , ftString, 400);
    AddField('MAINWEIGHT'     , ftString, 400);
    AddField('E1MIDPERVIEW1'  , ftString, 400);
    AddField('EMPNO'          , ftString, 400);
    AddField('TASKCODE'       , ftString, 400);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  with TDS_Works do
  begin
    SqlText := Format('SELECT PROPELTASK, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, SEQNO  '+
                      '  FROM PEJNOEMP_DET A                                       '+
                      ' WHERE A.RABASDATE = ''%s''                                 '+
                      '   AND A.EMPNO     = ''%s''                                 ',[sRabasdate,Ed_empno.Text]);
    Close;
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('PROPELTASK'   , ftString, 400);
    AddField('MAINWEIGHT'   , ftString, 400);
    AddField('E1MIDPERVIEW1', ftString, 400);
    AddField('EMPNO'        , ftString, 400);
    AddField('SEQNO'        , ftString, 400);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
    if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount > 0) then
    begin
  //            DBG_works.Top    := 435;
  //            DBG_works.Height := 105;
    end;
  end;
end;

procedure TFM_Main.Csel_Open;
begin
  Csel_ret := False;
  with TMaxDataSet_HInsa do
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

function TFM_Main.Csel_gfd(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
     v_cnt := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
     FL_IDate: Integer;
begin
  FM_Tmax                 := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session       := TMaxSession;

  E_MIDVALVIEW.Clear;
  E_MIDCOMVIEW.Clear;
  E_MIDTOTVIEW.Clear;

  if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
      (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
  begin
    E_empno.Visible   := True;
    BT_eempno.Visible := True;
  end
  else
  Begin
    E_empno.Visible   := False;
    BT_eempno.Visible := False;

    If (Copy(Pempno,1,1) = 'J') Then
    Begin
      Ed_empno.Text := Pempno;
      Select_BaseData;
      OpinionView;
      ConFirm_BtnVisible;

      If (PFinyn = 'N') Then
      Begin
        MessageDlg('팀장님 결재가 완료되지 않았습니다.'+#13 ,mtInformation,[mbOK],0);
        Close;
      End
      Else
      Begin
        BT_Print.Visible := True;
      End;
    End
    Else
    Begin
      MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
      Close;
    End;
  End;
end;

procedure TFM_Main.OpinionView;
var
     i, j   : integer;
     vEkind : String;
begin
  Works_data;

  with TMaxDataSet do
  begin
    vParamSQL := 'SELECT E1MIDVALVIEW, E1MIDCOMVIEW, E1MIDTOTVIEW, null, null   '+
                 '  FROM PEJNOMAS                                               '+
                 ' WHERE rabasdate = '''+ sRabasdate    +'''                    '+
                 '   AND empno     = '''+ vEmpno        +'''                    ';
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('Field1' , ftString, 400);
    AddField('Field2' , ftString, 400);
    AddField('Field3' , ftString, 400);
    AddField('Field4' , ftString, 400);
    AddField('Field5' , ftString, 400);

    Close;
    SQl.Clear;
    SQL.Text := vParamSQL;             //Memo1.Text := Sql.Text;
    Open;
    E_MIDVALVIEW.Text := Fields[0].AsString;
    E_MIDCOMVIEW.Text := Fields[1].AsString;
    E_MIDTOTVIEW.text := Fields[2].AsString;
  end;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

procedure TFM_Main.ConFirm_BtnVisible;
begin
  if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3) or
      (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
  begin
    E_empno.Visible    := True;
    BT_eempno.Visible  := True;
  end
  else
  begin
    E_empno.Visible    := False;
    BT_eempno.Visible  := False;
  end;
end;

procedure TFM_Main.E_EmpnoEnter(Sender: TObject);
begin
  Ed_Empno.Text             := '';
  L_korname.ValueCaption    := '';
  L_Payraname.ValueCaption  := '';
  L_deptname.ValueCaption   := '';

  On_Value.Clear;
  On_Comp.Clear;
  TDS_Works.Close;
  TDS_Works1.Close;
  E_MIDVALVIEW.Clear;
  E_MIDCOMVIEW.Clear;
  E_MIDTOTVIEW.Clear;
  BT_Help.Visible    := False;
end;

procedure TFM_Main.DBG_worksCellClick(Column: TColumn);
begin
(*
     P_Gubun.Caption      := '개별';
     P_Taskcode.Caption   := TDS_Works.Fieldbyname('SEQNO').AsString;
     P_propeltask.Caption := TDS_Works.Fieldbyname('PROPELTASK').AsString;
     P_mainweight.Caption := TDS_Works.Fieldbyname('MAINWEIGHT').AsString;
     E_MIDPERVIEW.Lines.Clear;
     E_MIDPERVIEW.Lines.Add(TDS_Works.Fieldbyname('E1MIDPERVIEW1').AsString);
*)
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  if  ed_empno.Text = '' then
  begin
    MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;
  Label1.Visible       := False;
  E_Empno.Visible      := False;
  Bt_Eempno.Visible    := False;
  P_propeltask.Caption := '';
  E_MIDPERVIEW.Text    := '';

  QuickReport1.Preview;
  ConFirm_BtnVisible;
end;

function TFM_Main.FL_CheckNullEvalview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  with TMaxDataSet do
  begin
    SQL.Clear;
    SQL.Text := format('select count(*) SEL_DATA from PEJNOMAS                         '+
                       ' where ((E1MIDVALVIEW is null) or (LENGTH(E1MIDVALVIEW) <15))  '+
                       '   and empno     =''%s''                                       '+
                       '   and rabasdate =''%s''                                       ',
                       [ED_empno.text, sRabasdate]);
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;

    if TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
       Result := False
    else
       Result := True;
  end;
end;

function TFM_Main.FL_CheckNullEcomview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  with TMaxDataSet do
  begin
    SQL.Clear;
    SQL.Text := format('select count(*) SEL_DATA from PEJNOMAS                         '+
                       ' where ((E1MIDCOMVIEW is null) or (LENGTH(E1MIDCOMVIEW) <15))  '+
                       '   and empno     =''%s''                                       '+
                       '   and rabasdate =''%s''                                       ',
                       [ED_empno.text, sRabasdate]);
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;
    if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
         Result := False
    else
         Result := True;
  end;
end;

function TFM_Main.FL_CheckNullEperview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  if  TDS_WORKS.RecordCount > 0 then
  begin
    with TMaxDataSet do
    begin
      SQL.Clear;
      SQL.Text := format('select count(*) SEL_DATA from PEJNOEMP_DET                 '+
                         ' where (Propeltask is not null and E1MIDPERVIEW1 is null)  '+
                         '   and empno     =''%s''                                   '+
                         '   and rabasdate =''%s''                                   ',
                         [ED_empno.text, sRabasdate]);
      Close;
      ServiceName := 'PED0000A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftInteger, 100);
      Open;
      if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
      begin
        Result := False;
        exit;
      end
      else
        Result := True;
    end;
  end;
  Result := True;
end;

function TFM_Main.FL_CheckNullEtotview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  with TMaxDataSet do
  begin
    SQL.Clear;
    SQL.Text := format('select count(*) SEL_DATA from PEJNOMAS                         '+
                       ' where ((E1MIDTOTVIEW is null) or (LENGTH(E1MIDTOTVIEW) <15))  '+
                       '   and empno     =''%s''                                       '+
                       '   and rabasdate =''%s''                                       ',
                       [ED_empno.text, sRabasdate]);
    Close;
    ServiceName := 'PED0000A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftInteger, 100);
    Open;
    if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
         Result := False
    else
         Result := True;
  end;
end;

procedure TFM_Main.E_MIDVALVIEWKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
  i := 222;
  if  key = i then
  begin
    Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
    ViewText := copy(E_MIDVALVIEW.text, 1, Length(TOnMemo(Sender).text)-1);
    TOnMemo(Sender).Clear;
    TOnMemo(Sender).Lines.Append(ViewText);
  end;
end;

procedure TFM_Main.E_MIDVALVIEWExit(Sender: TObject);
begin
  if TOnMemo(Sender).Lines.Count > 6 then
  begin
    Messagedlg('내용을 6줄이하로 작성해 주시기 바랍니다.',mtWarning,[mbOK],0);
    TOnMemo(Sender).SetFocus;
  end;
end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TMaxDataSet do
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

procedure TFM_Main.Bt_EempnoClick(Sender: TObject);
begin
  Ed_empno.Text := E_Empno.Text;
  Select_BaseData;
  OpinionView;
  ConFirm_BtnVisible;
end;

end.
