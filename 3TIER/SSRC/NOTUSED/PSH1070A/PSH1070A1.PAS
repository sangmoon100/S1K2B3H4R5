{* ======================= Program Header ======================================
 PROGRAM-NAME   : PSH1070A(임원 복리후생 신청 및 조회)
 SYSTEM-NAME    : 복리후생/우리사주
 SUBSYSTEM-NAME : 복리후생신청
 Programmer     : 지순미
 Version        : 1.00
 Date           : 2012.10.31

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       2012.10.31         지순미          신규개발
============================================================================= *}
unit PSH1070A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit,  TmaxFunc;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel2: TPanel;
    SL_payra: TOnShapeLabel;
    OnShapeLabel18: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    L_Appdate: TOnShapeLabel;
    SL_job: TOnShapeLabel;
    SL_dept: TOnShapeLabel;
    DataGrid: TOnGrDbGrid;
    BT_Hospital: TOnFocusButton;
    BT_Sports: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    PE_empno: TTMaxPersonPopupEdit;
    BT_Search: TOnFocusButton;
    Panel1: TPanel;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    BT_Print: TOnFocusButton;
    E_LoginEmp: TEdit;
    Bt_Login: TButton;
    Bt_Email: TOnFocusButton;
    TDS_Com: TTMaxDataSet;
    TmaxSession: TTMaxSession;
    TDS_Grid: TTMaxDataSet;
    DataSource1: TDataSource;
    SB_Help: TStatusBar;
    procedure BT_HospitalClick(Sender: TObject);
    procedure BT_SportsClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SearchClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure RB2Click(Sender: TObject);
    procedure RB3Click(Sender: TObject);
    procedure PE_empnoChange(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure Bt_LoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure PL_Com_Contructor;
    procedure PE_EmpnoInit;
    procedure PE_empnoSerach;
    Procedure Read_SumRecords(AppYY, Part, Empno : String);
  public
    { Public declarations }
    PEmpno,   Pkorname,   Pgrade : String;
    FG_Empno, FG_korname, FG_Date, FG_Sql : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_Sysdate, FG_Systime : String;
    frdate, todate, todate2, closetime : String;
    vEmpno, vKorname : String;
    frdateSP, todateSP : String;

  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PSH1070A2, PFamily, PSH1070A3, PSH1070A4, PPRINTFORM;   //C:\insa\newhana.env


{$R *.DFM}

procedure TFM_Mainform.PL_Com_Contructor;
begin
  with TDS_com do
    begin
      Close;
      ServiceName := 'HINSA_select10';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      AddField('field6'  , ftString, 100);
      AddField('field7'  , ftString, 100);
      AddField('field8'  , ftString, 100);
      AddField('field9'  , ftString, 100);
      AddField('field10' , ftString, 100);
      Sql.Clear;
    end;
end;

Procedure TFM_Mainform.Read_SumRecords(AppYY, Part, Empno : String);
begin
  with TDS_Grid do
    begin
      ServiceName := 'PSH1030A_sel4';
      Close;
      Sql.Clear;
      Sql.Add('SELECT APPDATE, PART,  EMPNO,                          ');
      //Sql.Add('       FAMINAME,                                       ');
      //Sql.Add('       (SELECT CODENAME FROM PKMYSCOD                  ');
      //Sql.Add('         WHERE CODENO = FAMIREL)       FAMIRELNAME,    ');
      //Sql.Add('       APPAMT, APPSUM, EXTAMT, EXTSUM, CONAMT, CONSUM, ');
      //Sql.Add('       SETAMT, SETSUM, PREAMT, PRESUM, SUPAMT, SUPSUM  ');
      Sql.Add('       SUM(APPAMT) APPAMT, SUM(APPSUM) APPSUM,         ');
      Sql.Add('       SUM(EXTAMT) EXTAMT, SUM(EXTSUM) EXTSUM,         ');
      Sql.Add('       SUM(CONAMT) CONAMT, SUM(CONSUM) CONSUM,         ');
      Sql.Add('       SUM(SETAMT) SETAMT, SUM(SETSUM) SETSUM,         ');
      Sql.Add('       SUM(PREAMT) PREAMT, SUM(PRESUM) PRESUM,         ');
      Sql.Add('       SUM(SUPAMT) SUPAMT, SUM(SUPSUM) SUPSUM          ');
      Sql.Add('  FROM PSHAPSUM                                        ');
      Sql.Add(' WHERE substr(APPDATE,1,4) = '''+ AppYY +'''           ');
      Sql.Add('   AND PART    = '''+ Part   +'''                      ');
      Sql.Add('   AND EMPNO   = '''+ Empno  +'''                      ');
      Sql.Add(' GROUP BY APPDATE, PART,  EMPNO                        ');   //jissi 2013.05 추가
      Sql.Add(' ORDER BY APPDATE DESC                                 ');

      ClearFieldInfo;
      AddField('APPDATE'      , ftString,  6);
      AddField('PART'         , ftString,  1);
      AddField('EMPNO'        , ftString,  4);
      //AddField('FAMINAME'     , ftString, 12);
      //AddField('FAMIRELNAME'  , ftString, 30);
      AddField('APPAMT'       , ftFloat,   9);
      AddField('APPSUM'       , ftFloat,   9);
      AddField('EXTAMT'       , ftFloat,   9);
      AddField('EXTSUM'       , ftFloat,   9);
      AddField('CONAMT'       , ftFloat,   9);
      AddField('CONSUM'       , ftFloat,   9);
      AddField('SETAMT'       , ftFloat,   9);
      AddField('SETSUM'       , ftFloat,   9);
      AddField('PREAMT'       , ftFloat,   9);
      AddField('PRESUM'       , ftFloat,   9);
      AddField('SUPAMT'       , ftFloat,   9);
      AddField('SUPSUM'       , ftFloat,   9);
      Open;

      TFloatField(FieldByName('APPAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('APPSUM')).DisplayFormat := '#,###';
      TFloatField(FieldByName('EXTAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('EXTSUM')).DisplayFormat := '#,###';
      TFloatField(FieldByName('CONAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('CONSUM')).DisplayFormat := '#,###';
      TFloatField(FieldByName('SETAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('SETSUM')).DisplayFormat := '#,###';
      TFloatField(FieldByName('PREAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('PRESUM')).DisplayFormat := '#,###';
      TFloatField(FieldByName('SUPAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('SUPSUM')).DisplayFormat := '#,###';
    end;
end;

/////////////////////////////////////////////////////////////////////////////////

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Mainform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Mainform.BT_HospitalClick(Sender: TObject);
begin
  if (PE_empno.Text  =  '')  then
  begin
       MessageDlg('의료비 신청 대상자를 먼저 선택하기기 바랍니다.  ' ,mtError, [mbOk],0);
       System.Exit;
  end;

  //2014.01.29.  jissi 양혜림, 이승철M 요청
  //체육활동지원금 신청은 신청기간마지막 날까지이며, 의료비는 마감일시까지 프로그램 중단 요청



  if Pgrade[4] in (['A','B']) then PE_Empno.Enabled := True
  else
  Begin
    if (FG_Sysdate < frdate) or ( FG_Sysdate > todate) then   //의료비
    begin
      MessageDlg('의료비 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                  copy(frdate,1,4)+'-'+copy(frdate,5,2)+'-'+copy(frdate,7,2)+ '부터 ' +
                  copy(todate,1,4)+'-'+copy(todate,5,2)+'-'+copy(todate,7,2)+
                 '까지 신청가능합니다.' , mtInformation, [mbOk], 0);
      System.Exit;
    end;
  End;

(*
  if  not (Pgrade[4] in (['A','B','C','E'])) and (copy(FG_Appdate,5,2) = '02') and (FG_Systime >= CloseTime)   then
  begin
       MessageDlg('의료비 등록기간이 종료되었습니다.'+#13+#13+
                  '체육활동만 등록이 가능합니다.    '+#13+#13+
                  '노사협력팀에 문의해 주시기 바랍니다....  ' ,mtError, [mbOk],0);
       System.Exit;
  end;
*)
  try
    FM_Hospital := TFM_Hospital.Create(Self);
    FM_Hospital.ShowModal;
  finally
    FM_Hospital.free;
  end;
end;

procedure TFM_Mainform.BT_SportsClick(Sender: TObject);
begin
  If (PE_empno.Text = '') Then
  begin
    MessageDlg('체육활동비 신청 대상자를 먼저 선택하기기 바랍니다.  ' ,mtError, [mbOk],0);
    System.Exit;
  end;

  if Pgrade[4] in (['A','B'])  then PE_Empno.Enabled := True
  else
  Begin
    if (FG_Sysdate < frdateSP) or ( FG_Sysdate > todateSP) then   //체육활동비
    begin
      MessageDlg('체육활동비 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                  copy(frdateSP,1,4)+'-'+copy(frdateSP,5,2)+'-'+copy(frdateSP,7,2)+ '부터 ' +
                  copy(todateSP,1,4)+'-'+copy(todateSP,5,2)+'-'+copy(todateSP,7,2)+
                 '까지 신청가능합니다.' , mtInformation, [mbOk], 0);
      System.Exit;
    end;
  End;

  try
    FM_Sports := TFM_Sports.Create(Self);
    FM_Sports.ShowModal;
  finally
    FM_Sports.free;
  end;
end;

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
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
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  // 이부분서부터 업무관련 초기화 부분 코딩 처리...(로그인 사용자)
  Pempno     := Hinsa_Param(CmdLine,1);
  Pkorname   := Hinsa_Param(CmdLine,2);
  Pgrade     := Hinsa_Param(CmdLine,4);
  E_Loginemp.Text := Pempno;
  FG_empno   := Hinsa_Param(CmdLine,1);
  FG_korname := Hinsa_Param(CmdLine,2);
  BT_Search.Visible := False;

end;

procedure TFM_Mainform.FormShow(Sender: TObject);
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    FG_Sql := 'SELECT SUBSTR(CONTODATE,1,6),        '+
              '       SUBSTR(CONTODATE,1,4),        '+
              '	      to_char(sysdate,''yyyymmddhh24miss''),'+
              '	      APPFRDATE,                    '+
              '       APPTODATE,                    '+
              '       CONTODATE,                    '+
              '	      CLOSETIME,                    '+
              '       APPFRDTSP,                   '+
              '	      APPTODTSP,                   '+
              '       ''field10''                   '+
              '  FROM PSCAPBAS                      ';
    Sql.Text := FG_Sql;
    Open;

    FG_Appdate := FieldByName('field1').AsString;
    FG_AppYY   := FieldByName('field2').AsString;
    L_Appdate.LabelCaption := Copy(FieldByName('field1').AsString,1,4) +' - '+
                              Copy(FieldByName('field1').AsString,5,2);
    FG_Sysdate := copy(FieldByName('field3').AsString,1,8);
    FG_Systime := FieldByName('field3').AsString;
    frdate     := FieldByName('field4').AsString;
    todate     := FieldByName('field5').AsString;
    todate2    := FieldByName('field6').AsString;
    closetime  := FieldByName('field7').AsString;
    frdateSP   := FieldByName('field8').AsString;
    todateSP   := FieldByName('field9').AsString;
    Close;
  end;

  if (FG_Sysdate < frdate) or ( FG_Sysdate > todate) then
  begin
{2012.10.09 요청서에 의해 수정
       MessageDlg(' 현재 체육활동비만 등록 가능합니다.   '+#10#13+
                  ' 의료비 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                   copy(todate2,1,4)+'-'+copy(todate2,5,2)+'-'+copy(todate2,7,2)+
                  '  이후에 등록이 가능합니다.' , mtInformation, [mbOk], 0);}

       MessageDlg('복리후생 등록기간이 아닙니다. 이력조회만 가능합니다.'+#10#13+#10#13+
                   copy(frdate,1,4)+'-'+copy(frdate,5,2)+'-'+copy(frdate,7,2)+ '부터 ' +
                   copy(todate,1,4)+'-'+copy(todate,5,2)+'-'+copy(todate,7,2)+
                  '까지 신청가능합니다.' , mtInformation, [mbOk], 0);
       BT_Hospital.Enabled := False;
       BT_Sports.Enabled   := False;
  end;

  PE_EmpnoInit;
  PE_empnoSerach;

  //복리후생 관리자는 변경후 사원의 데이터 수정/등록 가능토록,,,
  if  Pgrade[4] in (['A','B'])  then
  begin
       E_LoginEmp.Visible := True;
       Bt_Login.Visible   := True;
  end
  else
  begin
       E_LoginEmp.Visible := False;
       Bt_Login.Visible   := False;
  end;

  SB_Help.Panels[1].Text :=' ';

  //시작할때 의료비지원내역 기본 출력.
  RB1Click(Self);
end;


procedure TFM_Mainform.PE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      PE_empno.PL_get_singledata;
      PE_empnoSerach;
      BT_SearchClick(Sender);
      Key := #0;
    end;
end;

procedure TFM_Mainform.PE_EmpnoInit;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    FG_Sql := 'SELECT EMPNO,                        '+
              '       KORNAME,                      '+
              '	      BEMPNO,                       '+
              '	      BKORNAME,                     '+
              '       '''','''','''','''','''','''' '+
              '  FROM PKZSPMAS                      '+
              ' WHERE BEMPNO  = '''+ FG_Empno  +''' '+
              '    or EMPNO   = '''+ FG_Empno  +''' ';
    Sql.Text := FG_Sql;
    Open;
    if (RecordCount > 0) or (Copy(Pempno,1,1)='D') then
    begin
         vEmpno   := FieldByName('field1').AsString;
         vKorname := FieldByName('field2').AsString;
    end
    else
    begin
         MessageDlg(' 이 프로그램은 임원 비서만 등록 가능합니다.   '+#10#13+
                    ' 정규직은 복리후생신청 등록 및 조회에서 등록하시기 바랍니다. '+#10#13+
                    ' 프로그램을 종료합니다.' , mtInformation, [mbOk], 0);
         FM_Mainform.Close;
         system.Exit;
    end;
  end;

  if FG_empno <> '' then
  begin
       PE_empno.OnReadEnded := nil;
       PE_empno.Empno    := vEmpno;
       PE_empno.Korname  := vKorname;
       PE_empno.Text     := vEmpno + ' - ' + vKorname ;
       PE_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,     '+
                       '    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,'+
                       '    A.empdate, A.orgempdate, A.juminid, A.jobdept '+
                       '  FROM pycdept B, pyccode C, pyccode D, pimpmas A, pkzspmas M '+
                       ' WHERE D.codeid(+) = ''I113''       '+
                       '   AND A.payra     = D.codeno(+)    '+
                       '   AND C.codeid(+) = ''I112''       '+
                       '   AND A.paycl     = C.codeno(+)    '+
                       '   AND A.orgnum    = B.orgnum(+)    '+
                       '   AND A.deptcode  = B.deptcode(+)  '+
                       '   AND A.empno     = M.empno        '+
                       '   AND ((a.empno   = '''+FG_Empno+''')  '+
                       '    OR  (M.Bempno  = '''+FG_Empno+'''))  ';
       PE_empno.PL_get_singledata;
  end;
end;

procedure TFM_Mainform.PE_EmpnoSerach;
begin
  with TDS_Com do
  begin
    PL_Com_Contructor;
    FG_Sql := Format('SELECT JOBPLACE, PAYCL,                  '+
                     '      (SELECT DEPTNAME FROM PYCDEPT      '+
                     '        WHERE ORGNUM   = A.ORGNUM        '+
                     '          AND DEPTCODE = A.DEPTCODE) DNM,'+
                     '      (SELECT CODENAME FROM PYCCODE      '+
                     '        WHERE CODEID = ''I160''          '+
                     '          AND CODENO = JOBPLACE) JNM,    '+
                     '      (SELECT CODENAME FROM PYCCODE      '+
                     '        WHERE CODEID = ''I113''          '+
                     '          AND CODENO = PAYRA) PNM,       '+
                     '      ORGNUM, DEPTCODE, PAYRA, '''','''' '+
                     '  FROM PIMPMAS A                         '+
                     ' WHERE EMPNO     = ''%s''                ',[Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql;  //edit1.text := Sql.Text;
    Open;

    FG_Place  := FieldByName('field1').AsString;
    FG_Paycl  := FieldByName('field2').AsString;
    SL_Dept.ValueCaption  := FieldByName('field3').AsString;
    SL_Dept.Hint          := FieldByName('field6').AsString +
                             FieldByName('field7').AsString;
    SL_payra.ValueCaption := FieldByName('field5').AsString;
    SL_payra.Hint         := FieldByName('field8').AsString;
    SL_job.ValueCaption   := FieldByName('field4').AsString+' (' +
                             FieldByName('field1').AsString+') ';
    Close;
  end;
end;

procedure TFM_Mainform.BT_SearchClick(Sender: TObject);
begin
  if RB1.Checked then       //의료비
  begin
    DataGrid.Columns[4].Visible  := False;
    DataGrid.Columns[5].Visible  := False;
    DataGrid.Columns[10].Visible := False;
    DataGrid.Columns[11].Visible := False;
    DataGrid.Columns[0].Width    :=  90;
    DataGrid.Columns[1].Width    := 124;
    DataGrid.Columns[2].Width    := 124;
    DataGrid.Columns[3].Width    := 124;
    DataGrid.Columns[6].Width    := 124;
    DataGrid.Columns[7].Width    := 124;
    DataGrid.Columns[8].Width    := 120;
    DataGrid.Columns[9].Width    := 120;
    DataGrid.Columns[12].Width   := 120;
    
    Read_SumRecords(FG_AppYY, 'A', PE_empno.Empno);
  end
  else if RB2.Checked then  //체육활동
  begin
    DataGrid.Columns[4].Visible  := True;
    DataGrid.Columns[5].Visible  := True;
    DataGrid.Columns[10].Visible := True;
    DataGrid.Columns[11].Visible := True;
    DataGrid.Columns[0].Width    := 90;
    DataGrid.Columns[1].Width    := 80;
    DataGrid.Columns[2].Width    := 80;
    DataGrid.Columns[3].Width    := 80;
    DataGrid.Columns[6].Width    := 80;
    DataGrid.Columns[7].Width    := 80;
    DataGrid.Columns[8].Width    := 80;
    DataGrid.Columns[9].Width    := 80;
    DataGrid.Columns[12].Width   := 80;
    
    Read_SumRecords(FG_AppYY, 'B', PE_empno.Empno);
  end
  else if RB3.Checked then  //선택적복리후생
    Read_SumRecords(FG_AppYY, 'C', PE_empno.Empno)
  else
    MessageDlg('조회할 항목을 선택하세요.', mtInformation, [mbOk], 0);
end;

procedure TFM_Mainform.RB1Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.RB2Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.RB3Click(Sender: TObject);
begin
  BT_SearchClick(Sender);
end;

procedure TFM_Mainform.PE_empnoChange(Sender: TObject);
begin
  PE_EmpnoSerach;
end;

procedure TFM_Mainform.BT_PrintClick(Sender: TObject);
begin
  if (PE_empno.Text  =  '')  then
  begin
       MessageDlg('복리후생신청 대상자를 먼저 선택하기기 바랍니다.  ' ,mtError, [mbOk],0);
       System.Exit;
  end;


  try
    FM_PrintForm := TFM_PrintForm.Create(Self);
    FM_PrintForm.ShowModal;
  finally
    FM_PrintForm.free;
  end;
end;

procedure TFM_Mainform.Bt_LoginClick(Sender: TObject);
begin
  if length(trim(E_Loginemp.Text)) = 4 then
  begin
       FG_empno := E_Loginemp.Text;
       PE_EmpnoInit;
  end;
end;

end.
