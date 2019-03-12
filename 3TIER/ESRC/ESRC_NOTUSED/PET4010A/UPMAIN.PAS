{* ======================= Program Header ======================================
 PROGRAM-NAME   : 팀장 동료평가 지정 : PET4010A
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 동료 평가
 Programmer     : 이희용
 Version        : 1.0
 Date           : 2014.10.17

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
    1.00      2014.10.17         이희용        설계명세서       최초개발본
============================================================================= *}
unit UPMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, PDownLoad, OnInsaCommon,
  Mask, pebtnedit, peoutlookbtn, OnScheme;

type
  TPMain = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    Panel2: TPanel;
    Shape3: TShape;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    L_eempno: TLabel;
    Panel1: TPanel;
    Grid1: TOnGrDbGrid;
    Grid2: TStringGrid;
    DS_GRID1: TDataSource;
    T_GRID1: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    T_GRID2: TTMaxDataSet;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Bt_Save: TOnFocusButton;
    Bt_Appr: TOnFocusButton;
    Bt_close: TOnFocusButton;
    RDGroup: TRadioGroup;
    SuperUser: TGroupBox;
    Edit1: TEdit;
    ED_CN1: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    BT_Sel: TOnFocusButton;
    BT_CANCLE: TOnFocusButton;
    MOD_EMP: TEdit;
    ED_CN: TEdit;
    L_Cnt: TLabel;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure Grid2Click(Sender: TObject);
    procedure Grid2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Csel_Open;
    procedure BT_SelClick(Sender: TObject);
    procedure DS_GRID1DataChange(Sender: TObject; Field: TField);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_closeClick(Sender: TObject);
    procedure Grid1CellClick(Column: TColumn);
    procedure RDGroupClick(Sender: TObject);
    procedure BT_CANCLEClick(Sender: TObject);

  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission, sPAYRAYN: string;
    CompIp: String;
    vRabasdate : String;
    var_orgnum : String;
    var_CanYN  : String;
    Mdeptname  : String;
    SqlText    : String;
    Cupd_SQL   : String;
    inEMPNO    : String;
    Cupd_ret   : Boolean;

    ParamVariant: String;
    procedure Grid_Data;
    procedure Cupd_Exec;
    procedure ClearStringGrid;

  end;
type
  TstCellObj = packed record
  case Integer of
    0 : ( Num      : Integer);
    1 : ( Sender   : TObject);
end;

var
  PMain: TPMain;

  workemp1   : String;
  workemp2   : String;
  workemp3   : String;
  workemp4   : String;
  workemp5   : String;
  Csel_ret   : Boolean;
  Csel_SQL   : String;

implementation
{$R *.DFM}

procedure TPMain.FormCreate(Sender: TObject);
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

  Pempno   := Hinsa_Param(CmdLine, 1);
  Pkorname := Hinsa_Param(CmdLine, 2);
  Password := Hinsa_Param(CmdLine, 3);
  Ppermission := copy(Hinsa_Param(CmdLine,4),1,1);
  CompIp := Copy(CompIp, 2, Length(CompIp) - 1);
end;

procedure TPMain.FormShow(Sender: TObject);
begin
  // 평가기준일, 차수을 읽어온다
  ParamVariant := 'SELECT Value1||'';''||Value2 FROM pehabas ' +
                  ' WHERE rabasdate = ''00000000'' ' +
                  '   AND gubun     = ''00''   ' +
                  '   AND sgubun    = ''0001'' ';

  Csel_SQL     := ParamVariant;
  Csel_Open;
  vRabasdate   := Csel_gfd(1);
  var_orgnum   := Csel_gfd(2);

(*
  vRabasdate   := '20141130';
  var_orgnum   := 'H19';

  //동료평가 가능여부 확인
  ParamVariant := 'SELECT Value9 FROM pehabas ' +
                  ' WHERE rabasdate = '''+vRabasdate+''' ' +
                  '   AND gubun     = ''11'' ' +
                  '   AND sgubun    = ''0001'' ';

  Csel_SQL     := ParamVariant;
  Csel_Open;
  var_CanYN    := Csel_gfd(1);

  if var_CanYN <> 'Y' then
  begin
    Messagedlg('동료평가점수 입력기간이 끝났습니다!'+#13+#13+
               Mdeptname+'에 문의 하십시오!'+#13
               ,mtError,[mbOK],0);
    close;
  end;
*)
  // 평가담당자를 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2||'';''|| Value3 ' +
                  '             || '';'' ||Value4||'';''|| Value5 ' +
                  '  FROM pehrebas                                ' +
                  ' WHERE rabasdate = '''+vRabasdate+'''          ' +
                  '   AND gubun     = ''11''                      ' +
                  '   AND sgubun    = ''0005''                    ';

  Csel_SQL     := ParamVariant;
  Csel_Open;
  Workemp1     := Csel_gfd(1);
  Workemp2     := Csel_gfd(2);
  Workemp3     := Csel_gfd(3);
  Workemp4     := Csel_gfd(4);
  Workemp5     := Csel_gfd(5);

  //팀장확인 여부
  ParamVariant := 'SELECT korname|| '';'' ||jobpayrayn FROM pimpmas ' +
                  'WHERE EMPNO = '''+Pempno+'''   ' +
                  '  AND PSTATE < ''80'' ';

  Csel_SQL   := ParamVariant;
  Csel_Open;
  Pkorname   := Csel_gfd(1);
  sPAYRAYN   := Csel_gfd(2);

  if Not((Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
         (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
         (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D')) then
  begin
    if sPAYRAYN <> 'Y' then
    begin
      Messagedlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.!'+#13+#13+
                 '관리자에게 문의 하십시오!'+#13
                 ,mtError,[mbOK],0);
      close;
    end;
  End
  Else SuperUser.visible := True;

  L_eempno.Caption := Pkorname + ' ('+Pempno+')';
  Grid_Data;
end;

procedure TPMain.BT_SelClick(Sender: TObject);
begin
  Pempno  := ED_CN.Text;

  ParamVariant := 'SELECT Korname FROM pimpmas ' +
                  '  WHERE EMPNO = '''+Pempno+''' ' +
                  '    AND PSTATE < ''80'' ';

  Csel_SQL   := ParamVariant;
  Csel_Open;
  Pkorname   := Csel_gfd(1);

  L_eempno.Caption := Pkorname + ' ('+Pempno+')';
  Grid_Data;
end;

procedure TPMain.Grid_Data;
begin
  SqlText := ' SELECT EMPNO, KORNAME, BAND, APPROVAL, '''' F5 FROM(                                    '+
             ' SELECT EMPNO, KORNAME, BAND,                                                            '+
             '        CASE WHEN CNT > 1 THEN ''Y'' ELSE ''N'' END APPROVAL          FROM(              '+
             '        SELECT A.EMPNO, A.KORNAME,                                                       '+
             '       (SELECT CODENAME FROM pyccode WHERE CODEID = ''I112'' AND CODENO = a.PAYCL) BAND, '+
             '       (SELECT COUNT(*) CNT FROM PESMCS                                                  '+
             '        WHERE RABASDATE = A.RABASDATE  AND EMPNO = A.EMPNO AND APPROVAL = ''Y''          '+
             '        GROUP BY RABASDATE, EMPNO) CNT, '''' F5                                          '+
             ' FROM pehamas a                                                                          '+
             ' where a.rabasdate = ''' + vRabasdate + '''                                              '+
             '   and a.cyn       = ''Y''                                                               '+
             '   and a.deptcode in (select deptcode from pehamas                                       '+
             '                      where rabasdate = ''' + vRabasdate + '''                           '+
             '                        and empno     = ''' + Pempno + '''                               '+
             '                        and cyn       = ''N'')))                                         ';

  if      RDGroup.ItemIndex = 0 then SqlText := SqlText
  else if RDGroup.ItemIndex = 1 then SqlText := SqlText + ' WHERE APPROVAL = ''Y'' '
  else if RDGroup.ItemIndex = 2 then SqlText := SqlText + ' WHERE APPROVAL = ''N'' ';

  SqlText := SqlText + ' order by band desc, empno ';

  with T_GRID1 do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 100);
    AddField('KORNAME' , ftString, 100);
    AddField('BAND'    , ftString, 100);
    AddField('APPROVAL', ftString, 100);
    AddField('F5'      , ftString, 100);
    ClearParamInfo;
    SQL.Text := SqlText;
    edit1.Text := SqlText;
    Open;

    Fields[0].Alignment := taCenter;
    Fields[1].Alignment := taCenter;
    Fields[2].Alignment := taCenter;
    Fields[3].Alignment := taCenter;

    if RecordCount > 0 then
    Begin
      RDGroup.Caption := ' 조  회 : ' +IntToStr(RecordCount)+ '건 ';
      RDGroup.Enabled := True;
      Bt_Save.Enabled := True;
      Bt_Appr.Enabled := True;
      Grid1.Enabled   := True;
      Grid2.visible   := True;
      Grid2.Enabled   := True;
      Grid2.Color     := clWindow;
    End
    Else
    begin
      RDGroup.Caption := ' 조  회';
      Grid1.Enabled := False;
      Grid2.Enabled := False;
      Grid2.visible := False;
      Grid2.Color   := $00E3E3E3;
      RDGroup.Enabled := False;
      Bt_Save.Enabled := False;
      Bt_Appr.Enabled := False;
      if      RDGroup.ItemIndex = 0 then
      Begin
        Messagedlg('조회된 자료가 없습니다.' ,mtInformation,[mbOK],0);
        Exit;
      End
      else if RDGroup.ItemIndex = 1 then
      Begin
        Messagedlg('최종완료된 자료가 없습니다.' ,mtInformation,[mbOK],0);
        Exit;
      End
      else if RDGroup.ItemIndex = 2 then
      Begin
        Messagedlg('모든 자료를 최종완료 하였습니다.' ,mtInformation,[mbOK],0);
        Exit;
      End;
    End;
  end;
end;

procedure TPMain.DS_GRID1DataChange(Sender: TObject; Field: TField);
var
  SqlText : String;
  i : integer;
  CelObj: TstCellObj;
begin
  Grid2.Cells[0,0]  := ' 사번';
  Grid2.Cells[1,0]  := ' 성명';
  Grid2.Cells[2,0]  := ' BAND';
  Grid2.Cells[3,0]  := ' 선택여부';
  Grid2.Cells[4,0]  := ' 평가완료';

  inEMPNO := T_GRID1.fieldbyname('EMPNO').AsString;

  SqlText := ' SELECT a.empno, a.korname,                                      ' +
             '       (SELECT codename FROM pyccode                             ' +
             '        WHERE codeid = ''I112'' AND codeno = a.PAYCL) BAND,      ' +
             '        NVL((SELECT CHKYN FROM pesmcs                            ' +
             '             WHERE RABASDATE = A.RABASDATE AND EEMPNO = A.EMPNO  ' +
             '               AND EMPNO = ''' + inEMPNO + '''), ''N'') CHKYN,   ' +
             '        NVL((SELECT valconyn FROM pesmcs                         ' +
             '             WHERE RABASDATE = A.RABASDATE AND EEMPNO = A.EMPNO  ' +
             '               AND EMPNO = ''' + inEMPNO + '''), ''N'') valconyn ' +
             ' FROM pehamas a                                        ' +
             ' where a.rabasdate = ''' + vRabasdate + '''            ' +
             '   and a.cyn       = ''Y''                             ' +
             '   and a.empno    <> ''' + inEMPNO + '''               ' +
             '   and a.deptcode in (select deptcode from pehamas     ' +
             '                      where rabasdate = a.rabasdate    ' +
             '                        and empno     = '''+Pempno+''' ' +
             '                        and cyn       = ''N'')         ' +
             ' ORDER BY CHKYN DESC, BAND DESC, empno ';



  with T_GRID2 do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('empno'   , ftString, 100);
    AddField('korname' , ftString, 100);
    AddField('BAND'    , ftString, 100);
    AddField('CHKYN'   , ftString, 100);
    AddField('valconyn', ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    SQL.Text := SqlText;
    Open;

    if RecordCount > 0 then
    begin
      Grid2.RowCount := RecordCount +1;
      for i := 1 to Grid2.RowCount do
      begin

        Grid2.Cells[0, i] :=  T_GRID2.fieldbyname('empno').AsString;    //사번
        Grid2.Cells[1, i] :=  T_GRID2.fieldbyname('korname').AsString;  //성명
        Grid2.Cells[2, i] :=  T_GRID2.fieldbyname('BAND').AsString;     //Band
        Grid2.Cells[3, i] :=  T_GRID2.fieldbyname('CHKYN').AsString;    //선택여부
        Grid2.Cells[4, i] :=  T_GRID2.fieldbyname('valconyn').AsString; //완료여부
        //등록자료 확인용.
        Grid2.Cells[5, i] :=  T_GRID2.fieldbyname('CHKYN').AsString;    //선택여부
        //선택여부
        If Grid2.Cells[3, i] = 'Y' then CelObj.Num := 1
        Else                            CelObj.Num := 2;
        Grid2.Objects[3,i] := CelObj.Sender;
        next;
      end;
    end;
    close;
  end;

end;
procedure TPMain.Grid2Click(Sender: TObject);
var
  CelObj: TstCellObj;
  pt: TPoint;
  ACol,ARow: Integer;
  valconyn : String;
  inEEMPNO : String;
begin
  pt := Mouse.CursorPos;
  pt := Grid2.ScreenToClient(pt);
  Grid2.MouseToCell(pt.x,pt.y,ACol,ARow);

  If (T_GRID1.fieldbyname('APPROVAL').AsString) = 'Y' Then
  Begin
    Messagedlg('최종완료된 자료입니다.!' ,mtInformation,[mbOK],0);
    Exit;
  End;

  with Grid2 do
  Begin
    valconyn := Cells[4 ,Row];
    inEEMPNO := Cells[0 ,Row];
  End;

  if (ARow > 0) and (ACol = 3) then
  begin
    CelObj.Sender := Grid2.Objects[ACol,ARow];

    if CelObj.Num = 1 then
    Begin
      CelObj.Num:=2;
      Grid2.Cells[3, ARow] := 'N';
      if valconyn = 'Y' then
      begin
        MessageBox(handle,'이미 평가하신 사원입니다.','평가선정오류',MB_ICONWARNING);
        CelObj.Num:=1;
        Exit;
      end  Else
      Begin

      End;
    end else
    Begin
      CelObj.Num := 1;
      Grid2.Cells[3, ARow] := 'Y';
    End;

    Grid2.Objects[ACol,ARow] := CelObj.Sender;
    Grid2.Invalidate;
    Exit;
  End;
end;


procedure TPMain.Bt_SaveClick(Sender: TObject);
var Chk_Cnt, i : Integer;
    inEEMPNO   : String;
    inAPPROV   : String;
    inChk      : String;
begin
  Chk_Cnt :=  0;
  for i := 1 to Grid2.RowCount do
  begin
    if (Grid2.Cells[3,i] = 'Y') Then
    Begin
      Chk_Cnt  := Chk_Cnt + 1;  //선택여부
      Next;
    End;
  End;

  //3명에서 2명으로 수정 (김현순M 요청)
  If (Chk_Cnt < 2) Then
  Begin
    MessageDlg('평가자는 2명이상 지정하여야 합니다.', mtInformation, [mbOK], 0);
    Exit;
  End;

  if TComponent(Sender).Tag = 0 then
  Begin
    if Application.MessageBox('선택된 내용을 저장 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End Else
  Begin
    if Application.MessageBox('선택된 내용을 최종완료 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End;

  for i := 1 to Grid2.RowCount -1 do
  begin
    inEEMPNO := Grid2.Cells[0 ,i];
    inAPPROV := Grid2.Cells[4 ,i];
    inChk    := Grid2.Cells[3 ,i];

    if (inChk = 'Y') Then
    Begin
      Chk_Cnt  := Chk_Cnt + 1;  //선택여부

      if (Grid2.Cells[5,i] = 'N') Then //미등록 자료만 입력
      Begin
        SqlText := ' INSERT INTO PESMCS ' +
                   ' (RABASDATE, EMPNO,   EEMPNO,  KORNAME,  JOBGUN ,    ' +
                   '  PAYCL,     PAYRA,   ORGNUM,  DEPTCODE, VALCONYN,   ' +
                   '  ABCONYN,   BECONYN, DUCONYN, CHKYN,    WRITEEMP,   ' +
                   '  WRITETIME)                                         ' +
                   ' SELECT RABASDATE, '''+inEMPNO+''', EMPNO, KORNAME,  ' +
                   '        JOBGUN,    PAYCL, PAYRA,   ORGNUM, DEPTCODE, ' +
                   '        ''N'', ''N'', ''N'', ''N'', ''Y'',           ' +
                   ' '''+Pempno+''',TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')' +
                   ' FROM PEHAMAS                                        ' +
                   ' WHERE RABASDATE = ''' + vRabasdate + '''            ' +
                   '   AND CYN       = ''Y''                             ' +
                   '   AND EMPNO     = '''+inEEMPNO+''' ';

        Cupd_SQL  := Sqltext;
        Cupd_Exec;

        if not Cupd_ret then
        begin
          MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                     '관리자에게 문의하십시오..' , mtError,[mbOK],0);
          Exit;
        End;
      End;

      if TComponent(Sender).Tag = 1 then//최종완료
      Begin
        SqlText := ' UPDATE PESMCS SET APPROVAL = ''Y''     ' +
                   ' WHERE RABASDATE = ''' +vRabasdate+ ''' ' +
                   '   AND EMPNO     =  '''+inEMPNO+'''     ' +
                   '   AND EEMPNO    =  '''+inEEMPNO+'''    ';

        Cupd_SQL  := Sqltext;
        Cupd_Exec;

        if not Cupd_ret then
        begin
          MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                     '관리자에게 문의하십시오..' , mtError,[mbOK],0);
          Exit;
        End;
      End;
    End
    Else
    Begin
      SqlText := ' DELETE FROM PESMCS ' +
                 ' WHERE RABASDATE = ''' +vRabasdate+ ''' ' +
                 '   AND EMPNO     = '''+inEMPNO+'''     ' +
                 '   AND EEMPNO    = '''+inEEMPNO+'''    ';

      Cupd_SQL  := Sqltext;
      Cupd_Exec;
    End;

    next;
  End;

  if TComponent(Sender).Tag = 0 then
    MessageDlg('정상적으로 저장 하였습니다.', mtInformation, [mbOK], 0)
  Else
    MessageDlg('정상적으로 최종완료 하였습니다.', mtInformation, [mbOK], 0);

  //최종완료 후 데이타 다시 읽기.
  Grid_Data;
End;

procedure DrawCheck(DC:HDC;BBRect:TRect;bCheck:Boolean);
begin
  if bCheck then
  Begin
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK + DFCS_CHECKED)
  End
  else
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK);
end;

procedure TPMain.Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
  arect: TRect;
  CelObj: TstCellObj;
begin
  with Grid2.Canvas do
  begin
    if (ARow = 0) then Font.Style := [fsBold]
    else               Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 4;

    Loc := DT_CENTER;
    DrawText(Handle, PChar(Grid2.Cells[ACol, ARow]), -1, Rect, Loc);
  end;

  with TStringGrid(Sender).Canvas do
  begin
    if ARow > 0 then
    begin
      if ACol = 3 then
      begin
        // 3. CheckBox 그리기
        with (Sender As TStringGrid) do
        begin
          //화면을 지웁니다.
          Canvas.FillRect(Rect);
          // arect는 크기입니다. Box크기를 보고 조절하세요.
          arect := Rect;
          arect.Top := Rect.Top + 2;
          arect.Bottom := Rect.Bottom - 2;
          CelObj.Sender:=Objects[ACol,ARow];
          DrawCheck(Canvas.Handle, arect, CelObj.Num = 1);
        end;
      end;
    end;
  end;
end;


procedure TPMain.Csel_Open;
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

function TPMain.Csel_gfd(p_loc: Integer): String;
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
       if not(v_tmp > 0) then Exit;
       v_cnt := v_cnt + 1;
       Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TPMain.Cupd_Exec;
begin
  Cupd_ret := False;
  with TMaxDataSet_HInsa do
  begin
    ServiceName := 'PET1010A_dml';
    ClearFieldInfo;
    ClearParamInfo;
    SQL.Text := Cupd_SQL;
    if Execute then Cupd_ret := True;
  end;
end;

procedure TPMain.Bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TPMain.Grid1CellClick(Column: TColumn);
begin
  If (T_GRID1.fieldbyname('APPROVAL').AsString) = 'Y' Then
  Begin
    Grid2.Color := $00E3E3E3;
    Messagedlg('최종완료된 자료입니다.!' ,mtInformation,[mbOK],0);
    MOD_EMP.TEXT    := T_GRID1.fieldbyname('EMPNO').AsString;
    MOD_EMP.HINT    := T_GRID1.fieldbyname('korname').AsString;
    Grid2.Enabled   := False;
    Bt_Save.Enabled := False;
    Bt_Appr.Enabled := False;
    BT_CANCLE.Enabled := True;
    Exit;
  End Else
  Begin
    Grid2.Color     := clWindow;
    MOD_EMP.TEXT    := '';
    Grid2.Enabled   := True;
    Bt_Save.Enabled := True;
    Bt_Appr.Enabled := True;
    BT_CANCLE.Enabled := False;
  End;
end;

procedure TPMain.RDGroupClick(Sender: TObject);
begin
  Grid_Data;
end;

procedure TPMain.BT_CANCLEClick(Sender: TObject);
begin
  if (MOD_EMP.Text = '') Then
  Begin
    MessageDlg('최종완료 취소 대상자를 선택 하십시오.', mtInformation, [mbOK], 0);
    EXIT;
  End;

  if Application.MessageBox(PChar(''+MOD_EMP.HINT+'('+inEMPNO+')팀원의 최종완료 자료를 취소 하시겠습니까?'),'작업안내',mb_yesno) = id_no then system.exit;
  SqlText := ' UPDATE PESMCS SET APPROVAL = ''N''     ' +
             ' WHERE RABASDATE = ''' +vRabasdate+ ''' ' +
             '   AND EMPNO     =  '''+inEMPNO+'''     ' ;

  Cupd_SQL  := Sqltext;
  Cupd_Exec;

  if not Cupd_ret then
  begin
    MessageDlg('취소 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' , mtError,[mbOK],0);
    Exit;
  End;
  MessageDlg('취소 하였습니다.', mtInformation, [mbOK], 0);

  //취소 후 데이타 다시 읽기.
  Grid_Data;
end;


procedure TPMain.ClearStringGrid;
var  i, j : integer;
begin



end;

end.

