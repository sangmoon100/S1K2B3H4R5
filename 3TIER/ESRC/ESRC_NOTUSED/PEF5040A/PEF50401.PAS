unit PEF50401;

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
  TPEF5040 = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Bt_Srh: TOnFocusButton;
    TCDS: TTMaxDataSet;
    ExitBtn: TOnFocusButton;
    Loginemp: TEdit;
    TDml: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    TCSel: TTMaxDataSet;
    E_E2OPINION1: TOnMemo;
    E_E2OPINION2: TOnMemo;
    E_OPINION3: TOnMemo;
    Tds_il: TTMaxDataSet;
    Label1: TLabel;
    E_E2VALVIEW: TOnMemo;
    OnShapeLabel2: TOnShapeLabel;
    T_Grid: TTMaxDataSet;
    DS_Grid: TDataSource;
    Shape3: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Shape4: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnWinPopupEdit1: TOnWinPopupEdit;
    OnWinPopupEdit2: TOnWinPopupEdit;
    OnWinPopupEdit3: TOnWinPopupEdit;
    OM: TOnMemo;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    ON_E2App1: TOnNumberEdit;
    ON_E2App2: TOnNumberEdit;
    ON_E2App3: TOnNumberEdit;
    ON_E2App4: TOnNumberEdit;
    ON_E2App5: TOnNumberEdit;
    ON_E2App6: TOnNumberEdit;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    OnMemo3: TOnMemo;
    QRLabel1: TQRLabel;
    OnMemo4: TOnMemo;
    QRLabel2: TQRLabel;
    OnMemo5: TOnMemo;
    QRLabel3: TQRLabel;
    OnMemo2: TOnMemo;
    QRLabel4: TQRLabel;
    OnMemo6: TOnMemo;
    QRLabel5: TQRLabel;
    OnWinPopupEdit4: TOnWinPopupEdit;
    ON_E2Bas1: TOnMemo;
    ON_E2Bas2: TOnMemo;
    ON_E2Bas4: TOnMemo;
    ON_E2Bas3: TOnMemo;
    OnMemo13: TOnMemo;
    QRLabel8: TQRLabel;
    OnMemo14: TOnMemo;
    QRLabel9: TQRLabel;
    OnMemo15: TOnMemo;
    QRLabel10: TQRLabel;
    OnMemo16: TOnMemo;
    ON_E2App7: TOnNumberEdit;
    ON_E2Bas7: TOnMemo;
    QRLabel11: TQRLabel;
    ON_E2App9: TOnNumberEdit;
    ON_E2Bas9: TOnMemo;
    ON_E2Bas8: TOnMemo;
    ON_E2App8: TOnNumberEdit;
    OnWinPopupEdit5: TOnWinPopupEdit;
    RG: TRadioGroup;
    BT_Help: TOnFocusButton;
    DB_Grid: TOnGrDbGrid;
    Label2: TLabel;
    OnMemo1: TOnMemo;
    ON_E2Bas5: TOnMemo;
    ON_E2Bas6: TOnMemo;
    ON_E2Bas10: TOnMemo;
    ON_E2App10: TOnNumberEdit;
    Bt_Confirm: TOnFocusButton;
    Bt_print: TOnFocusButton;
    Bt_insert: TOnFocusButton;
    L_DeptName: TOnShapeLabel;
    L_deptcode: TOnShapeLabel;
    L_korname: TOnShapeLabel;
    L_E1korname: TOnShapeLabel;
    TCDS1: TTMaxDataSet;
    CB_RDate: TOnWinPopupEdit;
    PL_Help: TPanel;
    procedure ExitBtnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_printClick(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_E2OPINION1Click(Sender: TObject);
    procedure DS_GridDataChange(Sender: TObject; Field: TField);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure DB_GridCellClick(Column: TColumn);
    procedure ON_E2App1Exit(Sender: TObject);
    procedure ON_E2Bas1Exit(Sender: TObject);
    procedure CB_RDateChange(Sender: TObject);
    procedure CB_RDateKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AppTOT_Sum;
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure Csel_Open;
  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;
    CURDATE  : String;

    Wempno, vEMPNO, vE1Empno, vE2Empno, vConyn, vE1Conyn, vE2yn : String;
    Pempno, Pkorname, Password, Ppermission: String;
    FnEmpno: String;
    vOPINION1, vOPINION2 : String;
    PSysdate    : string;
    Prabasdate  : String;
    Lgubun      : Integer;
    gubun       : Integer;
    check       : Integer;
    EempFind    : Boolean;
    pOrgDeptList: String;
    FL_Start    : Boolean;
    FL_Ins      : Boolean;
    FL_SchItem  : TOnSchItem;
    vE2Apptot   : integer;
    Checkinx    : String;
    vE2KORNAME  : String;
    procedure ComponentClear;
    procedure Read_Data;
    procedure fnSKValues(vYY: String; vEmpno: String);
    function TCsel_gfd(p_loc: Integer): String;
    function fnSetVariable(mGubun: Integer): Boolean;
    function Select_BaseData : boolean;
    function Data_Check : boolean;
    function OverLap_Data : boolean;
  end;

var
  PEF5040: TPEF5040;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;
  Csel_SQL : String;
  Csel_ret : Boolean;

  AReport : TQuickRep;
implementation

uses UPrintForm, UHelp;

{$R *.DFM}

procedure TPEF5040.FormCreate(Sender: TObject);
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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;                                 
end;

function TPEF5040.fnSetVariable(mGubun: Integer): Boolean;
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
          'SELECT count(*) cnt FROM pimeemp      '+
          ' WHERE payrayn   = ''Y'' '+
          '   AND empno   = ''%s'' ',[Pempno]);  // 팀장확인
{
          'SELECT count(*) cnt FROM PEINTMAS      '+
          ' WHERE rabasdate = ''%s'' '+
          '   AND E2empno   = ''%s'' ',[Prabasdate,Pempno]);  // 팀장확인
}
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
        vE2yn  := TCsel_gfd(1);
      end;
  end;

  TCsel.Close;
  Result := True;
end;

procedure TPEF5040.Bt_SrhClick(Sender: TObject);
begin
  If not (Select_BaseData) Then
  Begin
    T_Grid.Close;
    ComponentClear;
    Exit;
  End;
  Read_Data;

  FL_Ins := True;
  check := 0;
end;

function TPEF5040.Select_BaseData: boolean;
begin
  wEmpno   := Loginemp.Text;
  Csel_SQL := 'SELECT A.empno||'';''||A.korname||'';''||A.orgnum||'';''||A.deptcode||'';''||                '+#13+
              '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''|| '+#13+
              '       A.E1empno||'';''||A.E1korname||'';''||A.E2empno||'';''||to_char(sysdate, ''YYYYMMDD'')'+#13+
              '       ||'';''||A.E2korname                                                                  '+#13+
              '  FROM PEINTMAS A                                                                            '+#13+
              ' WHERE RABASDATE like '''+Copy(prabasdate,1,4)+'%'+''' '+#13+
//              ' WHERE rabasdate = '''+ prabasdate+'''     '+#13+
              '   and A.E2empno = '''+ Loginemp.Text +''' ';


  Csel_Open;

  vEmpno                   := TCsel_gfd(1);
  L_Deptcode.Hint          := TCsel_gfd(3);
  L_Deptcode.ValueCaption  := TCsel_gfd(4);
  L_Deptname.ValueCaption  := TCsel_gfd(5);
  vE1Empno                 := TCsel_gfd(6);
  vE2Empno                 := TCsel_gfd(8);
  CURDATE                  := TCsel_gfd(9);
  vE2KORNAME               := TCsel_gfd(10);

  if TCsel.RecordCount < 1 then
  Begin
    ComponentClear;
    T_Grid.Close;
    Result := False;
  End
  Else Result := True;
end;

procedure TPEF5040.Read_Data;
var
  sSQL, vDate : String;
begin
  vDate:= Copy(prabasdate,1,4);
  sSQL :=  ' SELECT SUBSTR(RABASDATE,1,4) ||''-''||  ' +
           '        SUBSTR(RABASDATE,5,2) ||''-''||  ' +
           '        SUBSTR(RABASDATE,7,2) RABASDATE, ' +
           '        EMPNO, KORNAME, E1EMPNO, E1KORNAME '+
           ' FROM PEINTMAS '+
           ' WHERE RABASDATE like '''+vDate+'%'+''' '+
           '   AND E2EMPNO   = '''+vE2Empno+'''  '+
           ' Order by RABASDATE, EMPNO ';

  with T_Grid do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('RABASDATE', ftString, 100);
    AddField('EMPNO'    , ftString, 100);
    AddField('KORNAME'  , ftString, 100);
    AddField('E1EMPNO'  , ftString, 100);
    AddField('E1KORNAME', ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    SQL.Text := sSQL;
    Open;

    if RecordCount < 1 then
    Begin
      MessageDlg('인턴사원의 근무평가 자료가 없습니다.',mtInformation,[mbOk],0);
      ComponentClear;
    End;
  end;
end;

procedure TPEF5040.DB_GridCellClick(Column: TColumn);
begin
  If (T_Grid.RecordCount = 0) Then Exit;

  DS_GridDataChange(DB_Grid,T_Grid.Fields[0]);
end;

procedure TPEF5040.DS_GridDataChange(Sender: TObject; Field: TField);
var
  sSQL, sCONYN : String;
begin
  prabasdate := Copy(T_Grid.fieldbyname('RABASDATE').AsString,1,4) +
                Copy(T_Grid.fieldbyname('RABASDATE').AsString,6,2) +
                Copy(T_Grid.fieldbyname('RABASDATE').AsString,9,2);

  CB_RDate.Text := T_Grid.fieldbyname('RABASDATE').AsString;
  FnEmpno       := T_Grid.fieldbyname('EMPNO').AsString;


  sSQL := ' SELECT KORNAME, E1KORNAME, ''F3'', ''F4'', ''F5'''+
          ' FROM PEINTMAS '+
          ' WHERE RABASDATE = '''+prabasdate+''' '+
          '   AND EMPNO     = '''+ FnEmpno  +''' ';
  With TCDS1 do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('KORNAME'  , ftString, 100);
    AddField('E1KORNAME', ftString, 100);
    AddField('F3',        ftString, 100);
    AddField('F4',        ftString, 100);
    AddField('F5',        ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    SQL.Text := sSQL;
    Open;

    L_korname.ValueCaption   := fieldbyname('KORNAME').AsString;
    L_E1korname.ValueCaption := fieldbyname('E1KORNAME').AsString;
  End;

  sSQL := ' SELECT E1CONYN||E2CONYN CONYN, E2OPINION1, '+
          '        E2OPINION2, E2OPINION3, E2VALVIEW   '+
          ' FROM PEINTMAS '+
          ' WHERE RABASDATE = '''+prabasdate+''' '+
          '   AND EMPNO     = '''+ FnEmpno  +''' ';
  With TCDS do
  begin
    Close;
    ServiceName := 'HINSA_select3';
    ClearFieldInfo;
    AddField('CONYN'     , ftString, 2000);
    AddField('E2OPINION1', ftString, 2000);
    AddField('E2OPINION2', ftString, 2000);
    AddField('E2OPINION3', ftString, 2000);
    AddField('E2VALVIEW' , ftString, 2000);
    ClearParamInfo;
    Sql.Clear;
    SQL.Text := sSQL;
    Open;

    sCONYN := fieldbyname('CONYN').AsString;

    if Copy(sCONYN,1,1) = 'Y' then //멘토 최종완료
    begin
      E_E2OPINION1.Text := fieldbyname('E2OPINION1').AsString;
      E_E2OPINION2.Text := fieldbyname('E2OPINION2').AsString;
      E_E2VALVIEW.Text  := fieldbyname('E2VALVIEW').AsString;
      If      Copy(fieldbyname('E2OPINION3').AsString, 1, 1) = 'H' Then RG.ItemIndex := 0
      else If Copy(fieldbyname('E2OPINION3').AsString, 1, 1) = 'R' Then RG.ItemIndex := 1
      else If Copy(fieldbyname('E2OPINION3').AsString, 1, 1) = 'N' Then RG.ItemIndex := 2
      else    RG.ItemIndex := -1;

      Bt_insert.Enabled  := True;
      Bt_print.Enabled   := True;

      fnSKValues(prabasdate, FnEmpno);

      Bt_Confirm.Enabled := True;

      E_E2OPINION1.Font.Color := clBlack;
      E_E2OPINION2.Font.Color := clBlack;
      E_E2VALVIEW.Font.Color  := clBlack;
      ON_E2Bas1.Font.Color    := clBlack;

      If Copy(sCONYN,2,1) = 'Y' then //팀장 최종완료
      Begin
        Bt_insert.Enabled  := False;
        Bt_print.Enabled   := True;
        Bt_Confirm.Enabled := False;

        MessageDlg('최종완료 처리 된 자료입니다.'+#13+
                   '조회 및 출력만 가능합니다..',mtInformation,[mbOk],0);

      End;
    end
    else
    begin
      ComponentClear;
      MessageDlg('인턴사원 OJT 개인 평가서에서 담당멘토의 최종완료 처리가 되지 않았습니다.'+#13+
                 '담당멘토의 최종완료 후 작업하시기 바랍니다.',mtInformation,[mbOk],0);
      exit;
    end;
  end;
end;

procedure TPEF5040.ComponentClear;
begin
  E_E2OPINION1.Font.Color := clGray;
  E_E2OPINION2.Font.Color := clGray;
  E_E2VALVIEW.Font.Color  := clGray;
  ON_E2Bas1.Font.Color    := clGray;
  E_E2OPINION1.Lines.Clear;
  E_E2OPINION2.Lines.Clear;
  E_E2VALVIEW.Lines.Clear;
  ON_E2Bas1.Lines.Clear;
  RG.ItemIndex := -1;
  Bt_insert.Enabled  := False;
  Bt_print.Enabled   := False;
  Bt_Confirm.Enabled := False;

  ON_E2App1.Text  := '';
  ON_E2App2.Text  := '';
  ON_E2App3.Text  := '';
  ON_E2App4.Text  := '';
  ON_E2App5.Text  := '';
  ON_E2App6.Text  := '';
  ON_E2App7.Text  := '';
  ON_E2App8.Text  := '';
  ON_E2App9.Text  := '';
  ON_E2App10.Text := '';
  ON_E2Bas1.Text  := '';
  ON_E2Bas2.Text  := '';
  ON_E2Bas3.Text  := '';
  ON_E2Bas4.Text  := '';
  ON_E2Bas5.Text  := '';
  ON_E2Bas6.Text  := '';
  ON_E2Bas7.Text  := '';
  ON_E2Bas8.Text  := '';
  ON_E2Bas9.Text  := '';
  ON_E2Bas10.Text := '';

  E_E2OPINION1.Lines.Add('소속인턴이 4주간 수행한 프로젝트/업무에 대해 간략히 기술하여 주십시요.(Max 1000Byte)');
  E_E2OPINION2.Lines.Add('최대한 다양한 관찰방법을 통해 인턴사원의 기본인성/업무역량/잠재력등에 대해 기술하여 주십시요.(Max 1000Byte)');
  E_E2VALVIEW.Lines.Add('인턴사원에 대한 종합 판단 및 정규직 채용에 대한 의견을');
  E_E2VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
  ON_E2Bas1.Lines.Add('5점 입력 시, 최고 점수 부여');
  ON_E2Bas1.Lines.Add('근거(발현된 행동/태도/성과/');
  ON_E2Bas1.Lines.Add('Output 등)필수입력');
end;

procedure TPEF5040.fnSKValues(vYY: String; vEmpno: String);
var
  sSQL : String;
begin
  sSQL := ' SELECT E2APP01, E2APP02, E2APP03, E2APP04, E2APP05, '+
          '        E2APP06, E2APP07, E2APP08, E2APP09, E2APP10  '+
          ' FROM PEINTMAS '+
          ' WHERE RABASDATE = '''+ vYY+''' '+
          '   AND EMPNO     = '''+ vEmpno +''' ';
  With TCDS do
  begin
    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('E2APP01', ftString, 100);
    AddField('E2APP02', ftString, 100);
    AddField('E2APP03', ftString, 100);
    AddField('E2APP04', ftString, 100);
    AddField('E2APP05', ftString, 100);
    AddField('E2APP06', ftString, 100);
    AddField('E2APP07', ftString, 100);
    AddField('E2APP08', ftString, 100);
    AddField('E2APP09', ftString, 100);
    AddField('E2APP10', ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := sSQL;
    Open;

    ON_E2App1.Text  := fieldbyname('E2APP01').AsString;
    ON_E2App2.Text  := fieldbyname('E2APP02').AsString;
    ON_E2App3.Text  := fieldbyname('E2APP03').AsString;
    ON_E2App4.Text  := fieldbyname('E2APP04').AsString;
    ON_E2App5.Text  := fieldbyname('E2APP05').AsString;
    ON_E2App6.Text  := fieldbyname('E2APP06').AsString;
    ON_E2App7.Text  := fieldbyname('E2APP07').AsString;
    ON_E2App8.Text  := fieldbyname('E2APP08').AsString;
    ON_E2App9.Text  := fieldbyname('E2APP09').AsString;
    ON_E2App10.Text := fieldbyname('E2APP10').AsString;
  end;

  sSQL := ' SELECT E2BAS01, E2BAS02, E2BAS03, E2BAS04, E2BAS05, '+
          '        E2BAS06, E2BAS07, E2BAS08, E2BAS09, E2BAS10  '+
          ' FROM PEINTMAS '+
          ' WHERE RABASDATE = '''+ vYY+''' '+
          '   AND EMPNO     = '''+ vEmpno +''' ';

  With TCDS do
  begin
    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('E2BAS01', ftString, 100);
    AddField('E2BAS02', ftString, 100);
    AddField('E2BAS03', ftString, 100);
    AddField('E2BAS04', ftString, 100);
    AddField('E2BAS05', ftString, 100);
    AddField('E2BAS06', ftString, 100);
    AddField('E2BAS07', ftString, 100);
    AddField('E2BAS08', ftString, 100);
    AddField('E2BAS09', ftString, 100);
    AddField('E2BAS10', ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := sSQL;
    Open;

    ON_E2Bas1.Text  := fieldbyname('E2BAS01').AsString;
    ON_E2Bas2.Text  := fieldbyname('E2BAS02').AsString;
    ON_E2Bas3.Text  := fieldbyname('E2BAS03').AsString;
    ON_E2Bas4.Text  := fieldbyname('E2BAS04').AsString;
    ON_E2Bas5.Text  := fieldbyname('E2BAS05').AsString;
    ON_E2Bas6.Text  := fieldbyname('E2BAS06').AsString;
    ON_E2Bas7.Text  := fieldbyname('E2BAS07').AsString;
    ON_E2Bas8.Text  := fieldbyname('E2BAS08').AsString;
    ON_E2Bas9.Text  := fieldbyname('E2BAS09').AsString;
    ON_E2Bas10.Text := fieldbyname('E2BAS10').AsString;
  end;
End;

function TPEF5040.TCsel_gfd(p_loc: Integer): String;
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

procedure TPEF5040.Csel_Open;
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

function TPEF5040.Data_Check: boolean;
Begin
  Result := False;

  if trim(E_E2OPINION1.Text) = '' Then Begin MessageDlg('담당 업무 및 결과를 입력하시기 바랍니다.' ,mtError, [mbOK], 0); E_E2OPINION1.SetFocus; exit; End;
  if trim(E_E2OPINION2.Text) = '' Then Begin MessageDlg('면담 및 관찰 사항을 입력하시기 바랍니다.' ,mtError, [mbOK], 0); E_E2OPINION2.SetFocus; exit; End;

  if ON_E2App1.Value    = 0 Then Begin MessageDlg('SK Values의 Passion 항목의 점수를 입력하시기 바랍니다.'          ,mtError, [mbOK], 0);  ON_E2App1.SetFocus; Exit; End;
  if ON_E2App2.Value    = 0 Then Begin MessageDlg('SK Values의 Love 항목의 점수를 입력하시기 바랍니다.'             ,mtError, [mbOK], 0);  ON_E2App2.SetFocus; Exit; End;
  if ON_E2App3.Value    = 0 Then Begin MessageDlg('SK Values의 Challenge 항목의 점수를 입력하시기 바랍니다.'        ,mtError, [mbOK], 0);  ON_E2App3.SetFocus; Exit; End;
//  if ON_E2App4.Value    = 0 Then Begin MessageDlg('SK Values의 Integrity 항목의 점수를 입력하시기 바랍니다.'      ,mtError, [mbOK], 0);  ON_E2App4.SetFocus; Exit; End;
  if ON_E2App5.Value    = 0 Then Begin MessageDlg('SK Values의 Innovation 항목의 점수를 입력하시기 바랍니다.'       ,mtError, [mbOK], 0);  ON_E2App5.SetFocus; Exit; End;
//  if ON_E2App6.Value    = 0 Then Begin MessageDlg('SK Values의 Accountability 항목의 점수를 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  ON_E2App6.SetFocus; Exit; End;
  if ON_E2App7.Value    = 0 Then Begin MessageDlg('성공 잠재력의 돌파 항목의 점수를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2App7.SetFocus; Exit; End;
  if ON_E2App8.Value    = 0 Then Begin MessageDlg('성공 잠재력의 혁신 항목의 점수를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2App8.SetFocus; Exit; End;
  if ON_E2App9.Value    = 0 Then Begin MessageDlg('성공 잠재력의 참여 항목의 점수를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2App9.SetFocus; Exit; End;
  if ON_E2App10.Value   = 0 Then Begin MessageDlg('성공 잠재력의 협력 항목의 점수를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2App10.SetFocus; Exit; End;

  if ((ON_E2App1.Value  = 5) and (ON_E2Bas1.Text  = '')) Then Begin MessageDlg('SK Values의 Passion 항목의 근거를 입력하시기 바랍니다.'          ,mtError, [mbOK], 0);  ON_E2Bas1.SetFocus; Exit; End;
  if ((ON_E2App2.Value  = 5) and (ON_E2Bas2.Text  = '')) Then Begin MessageDlg('SK Values의 Love 항목의 근거를 입력하시기 바랍니다.'             ,mtError, [mbOK], 0);  ON_E2Bas2.SetFocus; Exit; End;
  if ((ON_E2App3.Value  = 5) and (ON_E2Bas3.Text  = '')) Then Begin MessageDlg('SK Values의 Challenge 항목의 근거를 입력하시기 바랍니다.'        ,mtError, [mbOK], 0);  ON_E2Bas3.SetFocus; Exit; End;
//  if ((ON_E2App4.Value  = 5) and (ON_E2Bas4.Text  = '')) Then Begin MessageDlg('SK Values의 Integrity 항목의 근거를 입력하시기 바랍니다.'      ,mtError, [mbOK], 0);  ON_E2Bas4.SetFocus; Exit; End;
  if ((ON_E2App5.Value  = 5) and (ON_E2Bas5.Text  = '')) Then Begin MessageDlg('SK Values의 Innovation 항목의 근거를 입력하시기 바랍니다.'       ,mtError, [mbOK], 0);  ON_E2Bas5.SetFocus; Exit; End;
//  if ((ON_E2App6.Value  = 5) and (ON_E2Bas6.Text  = '')) Then Begin MessageDlg('SK Values의 Accountability 항목의 근거를 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  ON_E2Bas6.SetFocus; Exit; End;
  if ((ON_E2App7.Value  = 5) and (ON_E2Bas7.Text  = '')) Then Begin MessageDlg('성공 잠재력의 돌파 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas7.SetFocus; Exit; End;
  if ((ON_E2App8.Value  = 5) and (ON_E2Bas8.Text  = '')) Then Begin MessageDlg('성공 잠재력의 혁신 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas8.SetFocus; Exit; End;
  if ((ON_E2App9.Value  = 5) and (ON_E2Bas9.Text  = '')) Then Begin MessageDlg('성공 잠재력의 참여 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas9.SetFocus; Exit; End;
  if ((ON_E2App10.Value = 5) and (ON_E2Bas10.Text = '')) Then Begin MessageDlg('성공 잠재력의 협력 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas10.SetFocus; Exit; End;
  if trim(E_E2VALVIEW.Text)  = '' Then Begin MessageDlg('종합 의견을 입력하시기 바랍니다.'         ,mtError, [mbOK], 0); E_E2VALVIEW.SetFocus;  exit; End;

  If RG.ItemIndex = -1 Then Begin MessageDlg('정규직 추천여부를 선택 하시기 바랍니다.' ,mtError, [mbOK], 0);  RG.SetFocus; Exit; End;
  Result := True;
End;

procedure TPEF5040.Bt_insertClick(Sender: TObject);
var SQLText : String;
begin
  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
       system.exit;

  if (Pos('(Max 1000Byte)',E_E2OPINION1.Text) > 0) then E_E2OPINION1.Text := '';
  if (Pos('(Max 1000Byte)',E_E2OPINION2.Text) > 0) then E_E2OPINION2.Text := '';
  if (Pos('(Max 1000Byte)',E_E2VALVIEW.Text)  > 0) then E_E2VALVIEW.Text  := '';
  if (Pos('필수입력' ,ON_E2Bas1.Text)       > 0) then ON_E2Bas1.Text    := '';

  If not (Data_Check) Then Exit;

  if (trim(E_E2OPINION1.Text) <> '') or (trim(E_E2OPINION2.Text) <> '') or (trim(E_E2VALVIEW.Text) <> '') then
  Begin
    Checkinx := '';
    If      RG.ItemIndex = 0 Then Checkinx := 'Highly Recommend'
    else If RG.ItemIndex = 1 Then Checkinx := 'Recommend'
    else If RG.ItemIndex = 2 Then Checkinx := 'Not Recommend';

    AppTOT_Sum;

    If (OverLap_Data = True) Then
    Begin
    MessageDlg(' 복수 피평가자의 평가항목 총점 및 정규직 추천여부 상대서열화가 필수'+#13 +
               ' 동점 입력 불가, 재입력 요청드립니다..' ,mtError,[mbOK],0);
      Bt_SrhClick(sender);
      Exit;
    End;

     SQLText := Format(
                'UPDATE PEINTMAS  SET                                      ' +#13+
                '       E2OPINION1  = '''+E_E2OPINION1.Text+''' ,          ' +#13+
                '       E2OPINION2  = '''+E_E2OPINION2.Text+''' ,          ' +#13+
                '       E2VALVIEW   = '''+E_E2VALVIEW.Text+'''  ,          ' +#13+
                '       E2APP01     = '''+ON_E2App1.Text+''',              ' +#13+
                '       E2APP02     = '''+ON_E2App2.Text+''',              ' +#13+
                '       E2APP03     = '''+ON_E2App3.Text+''',              ' +#13+
//                '       E2APP04     = '''+ON_E2App4.Text+''',              ' +#13+
                '       E2APP05     = '''+ON_E2App5.Text+''',              ' +#13+
//                '       E2APP06     = '''+ON_E2App6.Text+''',              ' +#13+
                '       E2APP07     = '''+ON_E2App7.Text+''',              ' +#13+
                '       E2APP08     = '''+ON_E2App8.Text+''',              ' +#13+
                '       E2APP09     = '''+ON_E2App9.Text+''',              ' +#13+
                '       E2APP10     = '''+ON_E2App10.Text+''',             ' +#13+
                '       E2BAS01     = '''+ON_E2Bas1.Text+''',              ' +#13+
                '       E2BAS02     = '''+ON_E2Bas2.Text+''',              ' +#13+
                '       E2BAS03     = '''+ON_E2Bas3.Text+''',              ' +#13+
//                '       E2BAS04     = '''+ON_E2Bas4.Text+''',              ' +#13+
                '       E2BAS05     = '''+ON_E2Bas5.Text+''',              ' +#13+
//                '       E2BAS06     = '''+ON_E2Bas6.Text+''',              ' +#13+
                '       E2BAS07     = '''+ON_E2Bas7.Text+''',              ' +#13+
                '       E2BAS08     = '''+ON_E2Bas8.Text+''',              ' +#13+
                '       E2BAS09     = '''+ON_E2Bas9.Text+''',              ' +#13+
                '       E2BAS10     = '''+ON_E2Bas10.Text+''',             ' +#13+
                '       E2OPINION3  = '''+Checkinx+''',                    ' +#13+
                '       WRITEEMP    = '''+Pempno+''',                      ' +#13+
                '       WRITETIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')' +#13+
                ' WHERE RABASDATE   = ''%s'' ' +#13+
                '   AND EMPNO       = ''%s'' ' ,
                [prabasdate, FnEmpno])
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
    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);

    If (Data_Check) Then Bt_Confirm.Enabled := True
    Else                 Bt_Confirm.Enabled := False;
  end;
end;

procedure TPEF5040.Bt_ConfirmClick(Sender: TObject);
var
   SQLTEXT  : String;
begin
  If not (Data_Check) Then Exit;

  if (trim(E_E2OPINION1.Text) <> '') or (trim(E_E2OPINION2.Text) <> '') or (trim(E_E2VALVIEW.Text) <> '') then
  Begin

    AppTOT_Sum;

    If (OverLap_Data = True) Then
    Begin
      MessageDlg(' 복수 피평가자의 평가항목 총점 및 정규직 추천여부 상대서열화가 필수'+#13 +
                 ' 동점 입력 불가, 재입력 요청드립니다..' ,mtError,[mbOK],0);
      Bt_SrhClick(sender);
      Exit;
    End;

    SQLText := Format(
                'UPDATE PEINTMAS  SET       ' +#13+
                '       E2CONYN   = ''Y'',  ' +#13+
                '       WRITEEMP  = '''+Pempno+''',                        ' +#13+
                '       WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                ' WHERE RABASDATE = ''%s'' ' +#13+
                '   AND EMPNO     = ''%s'' ' ,
                [prabasdate, FnEmpno])
  end;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
    MessageDlg('최종완료 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Bt_insert.Enabled  := False;
    Bt_print.Enabled   := True;
    Bt_Confirm.Enabled := False;
  end;
end;

procedure TPEF5040.Bt_printClick(Sender: TObject);
var sSql : String;
begin
  sSQL := ' SELECT E2CONYN, ''F2'', ''F3'', ''F4'', ''F5'''+
          ' FROM PEINTMAS '+
          ' WHERE RABASDATE = '''+prabasdate+''' '+
          '   AND EMPNO     = '''+ FnEmpno  +''' ';
  With TCDS1 do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('E2CONYN', ftString, 100);
    AddField('F2',      ftString, 100);
    AddField('F3',      ftString, 100);
    AddField('F4',      ftString, 100);
    AddField('F5',      ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := sSQL;
    Open;

    If fieldbyname('E2CONYN').AsString <> 'Y' Then
    Begin
      MessageDlg('최종완료 처리가 되지 않았습니다.' +#13 +
                 '최종완료 후 출력하시기 바랍니다.', mtInformation,[mbOK],0);
      Exit;
    End;
  End;

  PrintForm := TPrintForm.Create(self);
  PrintForm.QuickRep1.Preview;
end;

procedure TPEF5040.MemoKeyDown(Sender: TObject; var Key: Word;
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

procedure TPEF5040.E_E2OPINION1Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',E_E2OPINION1.Text) > 0) then E_E2OPINION1.Text := '';
  if (Pos('(Max 1000Byte)',E_E2OPINION2.Text) > 0) then E_E2OPINION2.Text := '';
  if (Pos('(Max 1000Byte)',E_E2VALVIEW.Text)  > 0) then E_E2VALVIEW.Text  := '';
  if (Pos('필수입력' ,ON_E2Bas1.Text)       > 0) then ON_E2Bas1.Text    := '';

  E_E2OPINION1.Font.Color := clBlack;
  E_E2OPINION2.Font.Color := clBlack;
  E_E2VALVIEW.Font.Color  := clBlack;
  ON_E2Bas1.Font.Color    := clBlack;
end;

procedure TPEF5040.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

procedure TPEF5040.ON_E2App1Exit(Sender: TObject);
begin  //평가점수가 5점이상인 자료중 근거입력이 없으면 근거항목에 포커스이동(안효상M 요청 2012.08.08)
  if ((ON_E2App1.Value  = 5) and (ON_E2Bas1.Text  = '')) Then Begin MessageDlg('SK Values의 Passion 항목의 근거를 입력하시기 바랍니다.'          ,mtError, [mbOK], 0);  ON_E2Bas1.SetFocus; Exit; End;
  if ((ON_E2App2.Value  = 5) and (ON_E2Bas2.Text  = '')) Then Begin MessageDlg('SK Values의 Love 항목의 근거를 입력하시기 바랍니다.'             ,mtError, [mbOK], 0);  ON_E2Bas2.SetFocus; Exit; End;
  if ((ON_E2App3.Value  = 5) and (ON_E2Bas3.Text  = '')) Then Begin MessageDlg('SK Values의 Challenge 항목의 근거를 입력하시기 바랍니다.'        ,mtError, [mbOK], 0);  ON_E2Bas3.SetFocus; Exit; End;
//  if ((ON_E2App4.Value  = 5) and (ON_E2Bas4.Text  = '')) Then Begin MessageDlg('SK Values의 Integrity 항목의 근거를 입력하시기 바랍니다.'      ,mtError, [mbOK], 0);  ON_E2Bas4.SetFocus; Exit; End;
  if ((ON_E2App5.Value  = 5) and (ON_E2Bas5.Text  = '')) Then Begin MessageDlg('SK Values의 Innovation 항목의 근거를 입력하시기 바랍니다.'       ,mtError, [mbOK], 0);  ON_E2Bas5.SetFocus; Exit; End;
//  if ((ON_E2App6.Value  = 5) and (ON_E2Bas6.Text  = '')) Then Begin MessageDlg('SK Values의 Accountability 항목의 근거를 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  ON_E2Bas6.SetFocus; Exit; End;
  if ((ON_E2App7.Value  = 5) and (ON_E2Bas7.Text  = '')) Then Begin MessageDlg('성공 잠재력의 돌파 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas7.SetFocus; Exit; End;
  if ((ON_E2App8.Value  = 5) and (ON_E2Bas8.Text  = '')) Then Begin MessageDlg('성공 잠재력의 혁신 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas8.SetFocus; Exit; End;
  if ((ON_E2App9.Value  = 5) and (ON_E2Bas9.Text  = '')) Then Begin MessageDlg('성공 잠재력의 참여 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas9.SetFocus; Exit; End;
  if ((ON_E2App10.Value = 5) and (ON_E2Bas10.Text = '')) Then Begin MessageDlg('성공 잠재력의 협력 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas10.SetFocus; Exit; End;
end;

procedure TPEF5040.ON_E2Bas1Exit(Sender: TObject);
begin
  if ((ON_E2App1.Value  = 5) and (ON_E2Bas1.Text  = '')) Then Begin MessageDlg('SK Values의 Passion 항목의 근거를 입력하시기 바랍니다.'          ,mtError, [mbOK], 0);  ON_E2Bas1.SetFocus; Exit; End;
  if ((ON_E2App2.Value  = 5) and (ON_E2Bas2.Text  = '')) Then Begin MessageDlg('SK Values의 Love 항목의 근거를 입력하시기 바랍니다.'             ,mtError, [mbOK], 0);  ON_E2Bas2.SetFocus; Exit; End;
  if ((ON_E2App3.Value  = 5) and (ON_E2Bas3.Text  = '')) Then Begin MessageDlg('SK Values의 Challenge 항목의 근거를 입력하시기 바랍니다.'        ,mtError, [mbOK], 0);  ON_E2Bas3.SetFocus; Exit; End;
//  if ((ON_E2App4.Value  = 5) and (ON_E2Bas4.Text  = '')) Then Begin MessageDlg('SK Values의 Integrity 항목의 근거를 입력하시기 바랍니다.'      ,mtError, [mbOK], 0);  ON_E2Bas4.SetFocus; Exit; End;
  if ((ON_E2App5.Value  = 5) and (ON_E2Bas5.Text  = '')) Then Begin MessageDlg('SK Values의  Innovation 항목의 근거를 입력하시기 바랍니다.'      ,mtError, [mbOK], 0);  ON_E2Bas5.SetFocus; Exit; End;
//  if ((ON_E2App6.Value  = 5) and (ON_E2Bas6.Text  = '')) Then Begin MessageDlg('SK Values의 Accountability 항목의 근거를 입력하시기 바랍니다.' ,mtError, [mbOK], 0);  ON_E2Bas6.SetFocus; Exit; End;
  if ((ON_E2App7.Value  = 5) and (ON_E2Bas7.Text  = '')) Then Begin MessageDlg('성공 잠재력의 돌파 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas7.SetFocus; Exit; End;
  if ((ON_E2App8.Value  = 5) and (ON_E2Bas8.Text  = '')) Then Begin MessageDlg('성공 잠재력의 혁신 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas8.SetFocus; Exit; End;
  if ((ON_E2App9.Value  = 5) and (ON_E2Bas9.Text  = '')) Then Begin MessageDlg('성공 잠재력의 참여 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas9.SetFocus; Exit; End;
  if ((ON_E2App10.Value = 5) and (ON_E2Bas10.Text = '')) Then Begin MessageDlg('성공 잠재력의 협력 항목의 근거를 입력하시기 바랍니다.'           ,mtError, [mbOK], 0);  ON_E2Bas10.SetFocus; Exit; End;
end;

procedure TPEF5040.CB_RDateChange(Sender: TObject);
begin
//  prabasdate := Copy(CB_RDate.Text,1,4) + Copy(CB_RDate.Text,6,2) + Copy(CB_RDate.Text,9,2);
//  Bt_SrhClick(sender);
end;

procedure TPEF5040.CB_RDateKeyPress(Sender: TObject; var Key: Char);
begin
(*
  if Key = Chr(13) then
  begin
    Bt_SrhClick(sender);
    inherited;
    Key := #0;
  end;
*)
end;

procedure TPEF5040.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPEF5040.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPEF5040.FormShow(Sender: TObject);
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
      // 팀장 또는 개발자, 담당자만 열리도록.
      if (vE2yn = '0') then
      Begin
        showmessage('인턴 근무평가서는 인턴평가 팀장님만 등록 가능합니다.'+#13+#13+'프로그램을 강제 종료 합니다.');
        Close;
      End;

      Loginemp.Text    := Pempno;   //사번기억
      Loginemp.Visible := False;
      Bt_Srh.Visible   := False;
    end;

    Bt_SrhClick(sender);
  end;
end;

function TPEF5040.OverLap_Data;
var
  SQLTEXT, nE1APPTOT1, nE1APPTOT2, vE2OPINION3 : String;
begin
  Result := True;
  SQLTEXT := 'SELECT E2APPTOT, E2OPINION3, '''' F3, '''' F4, '''' F5  FROM ( '+
             'SELECT RABASDATE, DEPTCODE, EMPNO, MAX(E2OPINION3) E2OPINION3, '+
             '   NVL(SUM(NVL(E2APP01,0)+NVL(E2APP02,0)+NVL(E2APP03,0)+NVL(E2APP04,0)+NVL(E2APP05,0)+ '+
             '   NVL(E2APP06,0)+NVL(E2APP07,0)+NVL(E2APP08,0)+NVL(E2APP09,0)+NVL(E2APP10,0)), 0) E2APPTOT '+
             '  FROM PEINTMAS  '+
              ' WHERE RABASDATE like '''+Copy(prabasdate,1,4)+'%'+''' '+#13+
//             ' WHERE RABASDATE = '''+ prabasdate +'''              '+
             '   and DEPTCODE  = '''+ L_Deptcode.ValueCaption +''' '+
             '   and EMPNO     NOT IN ('''+ FnEmpno +''')    '+
             ' GROUP BY rabasdate, DEPTCODE, EMPNO                 '+
             ' ORDER BY E2APPTOT DESC                              '+
             ' )  '+
             ' WHERE ROWNUM = 1 ';

  With TCDS1 do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('E2APPTOT'   , ftString, 100);
    AddField('E2OPINION3' , ftString, 100);
    AddField('F3' , ftString, 100);
    AddField('F4' , ftString, 100);
    AddField('F5' , ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := SQLTEXT;
    Open;

    nE1APPTOT1  := FieldByName('E2APPTOT').AsString;
    nE1APPTOT2  := IntToStr(vE2APPTOT);
    vE2OPINION3 := FieldByName('E2OPINION3').AsString;

    If ((nE1APPTOT1 = nE1APPTOT2) or (vE2OPINION3 = Checkinx)) Then
    Begin
      Exit;
    End;
  end;
  Result := False;
end;

procedure TPEF5040.AppTOT_Sum;
begin
  vE2APPTOT := 0;
  if ON_E2App1.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App1.Text);
  if ON_E2App2.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App2.Text);
  if ON_E2App3.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App3.Text);
  if ON_E2App4.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App4.Text);
  if ON_E2App5.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App5.Text);
  if ON_E2App6.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App6.Text);
  if ON_E2App7.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App7.Text);
  if ON_E2App8.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App8.Text);
  if ON_E2App9.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App9.Text);
  if ON_E2App10.Text <> '' then
     vE2APPTOT := vE2APPTOT + StrtoInt(ON_E2App10.Text);
end;

end.


