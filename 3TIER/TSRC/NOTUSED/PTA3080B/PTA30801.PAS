unit PTA30801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,kpaylib,
  Db, Tmax_DataSetText, OnDBGrid, Tmax_DmlSet, hanapass,
  pass, registry, PDownLoad, TmaxFunc, OnEditMemo, OnEditCombo, OnPopupEdit, Func;
type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    CB_base_yyF: TOnComboEdit;
    Grid2: TOnGrDbGrid;
    OnShapeLabel2: TOnShapeLabel;
    BT_find: TOnFocusButton;
    BT_close: TOnFocusButton;
    ED_team: TOnWinPopupEdit;
    L_inwon: TOnShapeLabel;
    TMaxSession: TTMaxSession;
    TDS_Grid1: TTMaxDataSet;
    DS_Grid1: TDataSource;
    TDS1: TTMaxDataSet;
    L_teamnm: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    E_Notice: TOnMemo;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    On_OSnow: TOnMemo;
    E_edutobe: TOnMemo;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    BT_MyPlan: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_HList: TOnFocusButton;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure CB_base_yyFChange(Sender: TObject);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid2DblClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure DS_Grid1DataChange(Sender: TObject; Field: TField);
    procedure E_edutobeClick(Sender: TObject);
    procedure E_edutobeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_MyPlanClick(Sender: TObject);
    procedure BT_HListClick(Sender: TObject);
  private
    SqlStr : String;
    workemp1, workemp2, workemp3, workemp4, workemp5  : String;
    PsEmpno   : String;
    function  FL_CheckNullAnswer:Boolean;
    procedure Read_Data;

  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    FG_Date   : String[15];
  end;

var
  MainForm: TMainForm;

  implementation

uses PTA30802, UHelp;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  VarLoading;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';

  if Trim(Hinsa_Param(cmdLine,1)) = '' then
  begin
    MessageDlg('종합인사 메뉴 프로그램을 실행하세요.', mtError , [mbOk],0);
    BT_CloseClick(Self);
    Exit;
  end;

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
//TMaxSession.EnvFileName := 'd:\source\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  Try
    TMaxSession.Connect := True;
    TMaxSession.TMax_Begin(5000);
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
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSgrade   := Hinsa_Param(cmdLine,4);

  with TDS1 do
  begin
    SqlStr := ' select Value1 base_yy,null,null,null,null '+
              '  FROM peIDPbas                            '+
              ' where base_yy   = ''0000''                '+
              '   and gubun     = ''00''                  '+
              '   and sgubun    = ''0000''                ';

    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlStr;

    ClearFieldInfo;
    AddField('BASE_YY' ,ftString,  100);
    AddField('field2'  ,ftString,  100);
    AddField('field3'  ,ftString,  100);
    AddField('field4'  ,ftString,  100);
    AddField('field5'  ,ftString,  100);
    Open;

    CB_base_yyF.Text := fields[0].AsString +'년';
  End;

  SendMessage(SB_help.handle,WM_PAINT,0,0);

  with TDS1 do
  begin
    SqlStr := ' select Value1,  Value2,  Value3,  Value4,  Value5  '+
              ' from peIDPbas a                                    '+
              ' WHERE a.base_yy = '''+Copy(FG_Date,1,4)+'''        '+
              '   AND a.gubun   = ''01''                           '+
              '   AND a.sgubun  = ''0001''                         ';

    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlStr;

    ClearFieldInfo;
    AddField('Value1' ,ftString,  100);
    AddField('Value2'  ,ftString,  100);
    AddField('Value3'  ,ftString,  100);
    AddField('Value4'  ,ftString,  100);
    AddField('Value5'  ,ftString,  100);
    Open;

    workemp1 := fields[0].AsString;
    workemp2 := fields[1].AsString;
    workemp3 := fields[2].AsString;
    workemp4 := fields[3].AsString;
    workemp5 := fields[4].AsString;
  end;

  if ((GSempno = workemp1) or (GSempno = workemp2) or (Copy(GSempno, 1,1) = 'D')) Then //Learning Point 담당자
  Begin
    SqlStr := Format('select deptcode, deptname, adpayrayn, ''field4'',''field5'' '+
                    '  from pihorga                                               '+
                    ' where orgym = (select value1 from pimvari                   '+
                    '                 where gubun = ''B2'' and sgubun =''0000'')  '+
                    '   and deptlevel <> ''E0''                                   '+
                    '   and empno = ''%s'' '+
                    ' order by adpayrayn ', [GSempno]);

    ED_team.Enabled := True;
    CB_base_yyF.Enabled := True;
  End
  Else
  Begin
    SqlStr := Format(' SELECT  DEPTCODE, DEPTNAME, ADPAYRAYN, ''field4'',''field5'' FROM(                                     ' +
                     ' SELECT DEPTCODE, DEPTNAME, ADPAYRAYN, EMPNO                                                            ' +
                     '   FROM PIHORGA                                                                                         ' +
                     '  WHERE ORGYM = (SELECT VALUE1 FROM PIMVARI                                                             ' +
                     '                  WHERE GUBUN = ''B2'' AND SGUBUN =''0000'')                                            ' +
                     '    AND GUBUN = ''0''                                                                                   ' +
                     '    AND PAYRAYN = ''Y''                                                                                 ' +
                     '    AND DEPTLEVEL <> ''E0''                                                                             ' +
                     ' UNION ALL                                                                                              ' +
                     ' SELECT DEPTCODE,                                                                                       ' +
                     '       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE =A.DEPTCODE) DEPTNAME,        ' +
                     ' 	    ''N'' ADPAYRAYN, EMPNO  FROM PIMEEMP A                                                            ' +
                     ' WHERE  JOBPAYRAYN = ''Y''                                                                              ' +
                     '   AND NOT EXISTS(SELECT * FROM PIHORGA                                                                 ' +
                     '                  WHERE ORGYM = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN = ''B2'' AND SGUBUN = ''0000'') ' +
                     '                    AND GUBUN = ''0''                                                                   ' +
                     '                    AND PAYRAYN = ''Y''                                                                 ' +
                     '                    AND DEPTLEVEL <> ''E0''                                                             ' +
                     '                    AND EMPNO = A.EMPNO)                                                                ' +
                     ' )WHERE EMPNO = ''%s''                                                                                  ' +
                     ' ORDER BY ADPAYRAYN ', [GSempno]);

    with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('DEPTCODE'  , ftString,  100);
      AddField('DEPTNAME'  , ftString,  100);
      AddField('ADPAYRAYN' , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

      ED_team.Text           := FieldByName('DEPTCODE').AsString;
      L_teamnm.ValueCaption  := FieldByName('DEPTNAME').AsString;

      if (TDS1.eof) then
      begin
        BT_CloseClick(Self);
        Exit;
      end;
    end;
  End;

  BT_findClick(Sender);
end;

procedure TMainForm.BT_findClick(Sender: TObject);
var
  base_yy : String;
begin
  if length(ED_team.Text) < 5 then
  begin
    MessageDlg('조회하려는 팀을 선택하세요..', mtInformation , [mbOk],0);
    System.Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 조회중입니다....';
  SendMessage(SB_help.handle,WM_PAINT,0,0);

  base_yy := Copy(CB_base_yyF.Text, 1, 4);

  with TDS_Grid1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    SqlStr := Format(' SELECT A.EMPNO,  (SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.EMPNO) KORNAME, '+
                     ' (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO   = A.PAYCL) BAND, '+
                     ' (SELECT NVL(SUM(EDU_TIME), 0) EDU_TIME FROM PEDU2ITEM B                             '+
                     '  WHERE B.BASE_YY = A.BASE_YY                                                        '+
                     '    AND B.EMPNO = A.EMPNO                                                            '+
                     '    AND B.EDU_PASS_YN = ''Y''                                                        '+
                     '    AND EXISTS(SELECT * FROM PEDU2TYPE WHERE EDU_TYPE = B.EDU_TYPE)) EDU_TIME1,      '+
                     ' (SELECT NVL(SUM(EDU_TIME), 0) EDU_TIME FROM PEDU2ITEM B                             '+
                     '  WHERE B.BASE_YY = (A.BASE_YY -1)                                                   '+
                     '    AND B.EMPNO   = A.EMPNO                                                          '+
                     '    AND B.EDU_PASS_YN = ''Y''                                                        '+
                     '    AND EXISTS(SELECT * FROM PEDU2TYPE WHERE EDU_TYPE = B.EDU_TYPE)) EDU_TIME3,      '+
                     ' A.EDUTOBE, A.SGNOW, A.E1VALCONYN, '''' F9, '''' F10                                 '+
                     ' FROM PEIDPMAS A                                                                     '+
                     ' WHERE A.BASE_YY  = ''%s''                                                           '+
                     '   AND NOT EXISTS(SELECT * FROM PIMEEMP ' +
                     '                WHERE EMPNO = A.EMPNO   ' +
                     '                  AND PAYRAYN = ''Y'')  ' +
                     '   AND A.DEPTCODE = ''%s'' ' +
                     ' ORDER BY BAND DESC, EMPNO ', [base_yy, ED_team.Text ]);

    ClearFieldInfo;
    AddField('EMPNO'     , ftString, 100);
    AddField('KORNAME'   , ftString, 100);
    AddField('BAND'      , ftString, 100);
    AddField('EDU_TIME1' , ftString, 100);
    AddField('EDU_TIME3' , ftString, 100);
    AddField('EDUTOBE'   , ftString, 100);
    AddField('SGNOW'     , ftString, 100);
    AddField('E1VALCONYN', ftString, 100);
    AddField('F9'        , ftString, 100);
    AddField('F10'       , ftString, 100);
    Sql.Clear;
    Sql.Text := SqlStr;
    Open;

    FieldByName('EMPNO').Alignment     := taCenter;
    FieldByName('BAND').Alignment      := taCenter;
    FieldByName('KORNAME').Alignment   := taCenter;
    FieldByName('EDU_TIME1').Alignment := taRightJustify;
    FieldByName('EDU_TIME3').Alignment := taRightJustify;
    FieldByName('EDUTOBE').Alignment   := taCenter;
    FieldByName('SGNOW').Alignment     := taCenter;
  end;

  if TDS_Grid1.RecordCount < 1 then
  begin
    L_inwon.ValueCaption  := '0';
    MessageDlg('조회된 자료가 없습니다. ', mtInformation , [mbOk],0);
  end Else
  Begin
    SqlStr := Format(' SELECT SUM(CNT) CNT,''field2'',''field3'', ''field4'',''field5'' '+
                     ' FROM( '+
                     ' SELECT COUNT(DISTINCT A.EMPNO) CNT '+
                     '  FROM PIMPMAS A,  PEDU2HIS C '+
                     '  WHERE A.EMPNO    = C.EMPNO  '+
                     '    AND (SUBSTR(A.CPAYCLDATE,1,4) <= C.BASE_YY OR SUBSTR(A.PAYCLDATE,1,4) <= C.BASE_YY) '+
                     '    AND C.BASE_YY <> ''2005'' '+
                     '    AND A.PSTATE   < ''80''   '+
                     '    AND A.DEPTCODE = ''%s''   '+
                     ' GROUP BY A.EMPNO '+
                     ' ) ',[ED_team.Text ]);
    with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('CNT'   , ftString, 100);
      AddField('field2', ftString, 100);
      AddField('field3', ftString, 100);
      AddField('field4', ftString, 100);
      AddField('field5', ftString, 100);
      Open;
      L_inwon.ValueCaption  := FieldByName('CNT').AsString + ' 명';

      SB_Help.Panels[1].Text := '조회되었습니다...';
    end;
  end;
  Read_Data;
end;

procedure TMainForm.CB_base_yyFChange(Sender: TObject);
begin
  TDS_Grid1.Close;
end;

procedure TMainForm.ED_teamInitPopup(Sender: TObject);
begin
  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TMainForm.ED_teamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
    ED_team.Text            := DeptForm.GSdeptcode;
    L_teamnm.ValueCaption   := DeptForm.GSdeptname;
  end;
  BT_findClick(Sender);
end;

procedure TMainForm.ED_teamChange(Sender: TObject);
begin
  TDS_Grid1.Close;
  L_teamnm.ValueCaption := '';
end;

procedure TMainForm.BT_SaveClick(Sender: TObject);
begin
  if (FL_CheckNullAnswer = False) Then Exit;
  with TMaxDataSet_HInsa do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;

    SQL.Text := 'Update PEIDPMAS                                        '+
                '   Set EDUTOBE   = '''+ E_edutobe.Text +''',           '+
                '       SGNOW     = '''+ On_OSnow.Text  +''',           '+
                '       WRITEEMP  = '''+ GSempno        +''',           '+
                '       WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                ' WHERE BASE_YY   = '''+ Copy(CB_base_yyF.Text, 1, 4) +''' '+
                '   AND EMPNO     = '''+ PsEmpno +'''                   ';

    if Execute then
    begin
      MessageDlg(BT_Save.Caption+' 작업을 완료했습니다.', mtInformation, [mbOK], 0);
    end
    else
    begin
      MessageDlg(BT_Save.Caption+' 작업을 실패했습니다. 관리자에게 문의 바랍니다.', mtInformation, [mbOK], 0);
    end;
  end;
  BT_findClick(Sender);
end;

function TMainForm.FL_CheckNullAnswer:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
  Result := False;

  if (Pos('(Max 1000Byte)' ,E_edutobe.Text) > 0) Then E_edutobe.Text := '';
  if (Pos('(Max 1000Byte)' ,On_OSnow.Text)  > 0) Then On_OSnow.Text  := '';
  Result := True;
end;

procedure TMainForm.DS_Grid1DataChange(Sender: TObject; Field: TField);
begin
  PsEmpno        := TDS_Grid1.FieldByName('EMPNO').AsString;
  E_edutobe.Text := TDS_Grid1.FieldByName('EDUTOBE').AsString;
  On_OSnow.Text  := TDS_Grid1.FieldByName('SGNOW').AsString;

  If TDS_Grid1.FieldByName('E1VALCONYN').AsString = 'Y' Then
  Begin
    BT_Save.Enabled := False;
    SB_Help.Panels[1].Text := ' ◎ 결재완료된 자료입니다.';
    SB_Help.Font.Color := clRed;
  End Else
  Begin
    BT_Save.Enabled := True;
    SB_Help.Panels[1].Text := '';
    SB_Help.Font.Color := clBlack;;
  End;
  
  //필요역량
  if E_edutobe.Text = '' then
  begin
    E_edutobe.Font.Color := clGray;
    E_edutobe.Lines.Add(#13#10+ '● 올해 구성원 실력향상에 필요한 역량을 기입하고,');
    E_edutobe.Lines.Add('   이를 통해 기대하는 구성원의 성장모습을 정의해주시기 바랍니다.');
    E_edutobe.Lines.Add(#13#10+ '(예) 전략적 교육체계 수립 역량 및 조직문화 진단/조직개발 역량의');
    E_edutobe.Lines.Add('실력향상을 통해 인적자원개발 분야 전문가 수준의 성장을 기대함.'+#13#10+'(Max 1000Byte)');
  end
  Else E_edutobe.Font.Color  := clBlack;

  //Activity
  if On_OSnow.Text = '' then
  begin
    On_OSnow.Font.Color := clGray;
    On_OSnow.Lines.Add(#13#10+ '● 사내집합교육, 온라인과정, 사외교육, 전문자격증 취득 등');
    On_OSnow.Lines.Add('   구성원 실력향상에 필요한 activity를 직접 추천해주시기 바랍니다.');
    On_OSnow.Lines.Add('   (하단 교육List 보기 버튼을 클릭하시면 세부항목 확인이 가능합니다.)');
    On_OSnow.Lines.Add(#13#10+ '● 구성원의 교육참여를 적극적으로 지원하겠다는 commitment의견도 같이 기입해주시기 바랍니다.' +#13#10+ '(Max 1000Byte)');
  end
  Else On_OSnow.Font.Color  := clBlack;
end;

procedure TMainForm.Read_Data;
var
  i : integer;
  vEkind : String;
begin
  with TDS1 do
  Begin
    SqlStr := 'SELECT EDUTOBE, SGNOW, ''3'', ''4'', ''5'', '+
              '        ''6'', ''7'',  ''8'', ''9'', ''10'' '+
              '  FROM PEIDPMAS                             '+
              ' WHERE BASE_YY = '''+ Copy(CB_base_yyF.Text, 1, 4) +''' '+
              '   AND empno   = '''+ PsEmpno +'''          ';

    ServiceName := 'HINSA_select12';
    ClearFieldInfo;
    AddField('Field1' , ftString, 2000);
    AddField('Field2' , ftString, 2000);
    AddField('Field3' , ftString, 2000);
    AddField('Field4' , ftString, 2000);
    AddField('Field5' , ftString, 2000);
    AddField('Field6' , ftString, 2000);
    AddField('Field7' , ftString, 2000);
    AddField('Field8' , ftString, 2000);
    AddField('Field9' , ftString, 2000);
    AddField('Field10', ftString, 2000);

    Close;
    SQl.Clear;
    SQL.Text := SqlStr;
    Open;

    E_edutobe.text := Fields[0].AsString;
    On_OSnow.Text  := Fields[1].AsString;
  End;
end;

procedure TMainForm.Grid2DblClick(Sender: TObject);
var LSfilename :  string;
    LAarg : array[0..200] of char;
begin
  If PsEmpno = '' Then
  begin
    MessageDlg('선택된 자료가 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;
  FM_DownLoad.PL_VersionCHK3(3, 'PTA3020B');
  FM_DownLoad.FL_UserID := PsEmpno;
  if (not FM_DownLoad.FL_VersionCHK ) or
     (not FileExists(GetHomeDir+'\Bin\3tier\PTA3020B.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Tbin','PTA3020B.EXE','PTA3020B',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';

    LSfilename := GetHomeDir+'\Bin\3Tier\PTA3020B.EXE ,'
                 +PsEmpno                +','+Passemp(cmdline,2)    +','+'@@@@@'+','
                 +Hinsa_Param(cmdline,4) +','+Hinsa_Param(cmdline,5)+','+Hinsa_Param(cmdline,6)+','
                 +Hinsa_Param(cmdline,7) +','+Hinsa_Param(cmdline,8)+','+Hinsa_Param(cmdline,9)+','
                 +Hinsa_Param(cmdline,10)+','+Hinsa_Param(cmdline,11)+','+Hinsa_Param(cmdline,12)+','
                 +Hinsa_Param(cmdline,13)+','+Hinsa_Param(cmdline,14)+','+Hinsa_Param(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;
  end;
end;

procedure TMainForm.BT_MyPlanClick(Sender: TObject);
var LSfilename :  string;
    LAarg : array[0..200] of char;
begin
  If PsEmpno = '' Then
  begin
    MessageDlg('선택된 자료가 없습니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;

   //Learnign Point 이력자료 조회
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;
  FM_DownLoad.PL_VersionCHK3(3, 'PEK2020A');
  FM_DownLoad.FL_UserID := PsEmpno;
  if (not FM_DownLoad.FL_VersionCHK ) or
     (not FileExists(GetHomeDir+'\Bin\3tier\PEK2020A.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEK2020A.EXE','PEK2020A',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';

    LSfilename := GetHomeDir+'\Bin\3Tier\PEK2020A.EXE ,'
                 +PsEmpno                +','+Passemp(cmdline,2)    +','+'@@@@@'+','
                 +Hinsa_Param(cmdline,4) +','+Hinsa_Param(cmdline,5)+','+Hinsa_Param(cmdline,6)+','
                 +Hinsa_Param(cmdline,7) +','+Hinsa_Param(cmdline,8)+','+Hinsa_Param(cmdline,9)+','
                 +Hinsa_Param(cmdline,10)+','+Hinsa_Param(cmdline,11)+','+Hinsa_Param(cmdline,12)+','
                 +Hinsa_Param(cmdline,13)+','+Hinsa_Param(cmdline,14)+','+Hinsa_Param(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;
  end;
end;

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.E_edutobeClick(Sender: TObject);
begin
  case (sender As TOnMemo).tag of
    0: begin
         if (Pos('(Max 1000Byte)',E_edutobe.Text)  > 0) then E_edutobe.Text  := '';
         E_edutobe.Font.Color  := clBlack;
      end;
    1: begin
         if (Pos('(Max 1000Byte)',On_OSnow.Text)  > 0) then On_OSnow.Text  := '';
         On_OSnow.Font.Color  := clBlack;
      end;
  end;
end;

procedure TMainForm.E_edutobeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : integer;
    MemoText : string;
begin
   i := 222;
   if key = i then
   begin
     Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
     MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
     TOnMemo(Sender).Clear;
     TOnMemo(Sender).Lines.Append(MemoText);
   end;
end;

procedure TMainForm.BT_HListClick(Sender: TObject);
var ObjName, FL_Prog : String;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','2017년 교육 LIST.XLS','List',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
end;

end.
