unit PTA30501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, Db, Tmax_DataSetText, Tmax_session, OnTmaxInsaData,
  ComCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo,
  OnShapeLabel, Grids, DBGrids, OnGrDBGrid, StdCtrls, OnFocusButton, OnInsaCommon,
  OnRegistry, OnInternetFtp, OnPopupEdit, ComObj;

const
  xlCenter = -4108;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    Insa_Data: TOnTMaxInsaData;
    TMaxSession_HInsa: TTMaxSession;
    SB_Help: TStatusBar;
    CB_base_yyF: TOnComboEdit;
    OnShapeLabel1: TOnShapeLabel;
    Grid1: TOnGrDbGrid;
    Grid2: TOnGrDbGrid;
    OnShapeLabel2: TOnShapeLabel;
    BT_find: TOnFocusButton;
    BT_close: TOnFocusButton;
    BT_Exec: TOnFocusButton;
    TDS_Grid1: TTMaxDataSet;
    DS_Grid1: TDataSource;
    TDS_Grid2: TTMaxDataSet;
    DS_Grid2: TDataSource;
    Qr_Menu: TTMaxDataSet;
    PG_Guage: TProgressBar;
    TDS1: TTMaxDataSet;
    ED_team: TOnWinPopupEdit;
    L_teamnm: TOnShapeLabel;
    BT_Excel: TOnFocusButton;
    procedure FormPaint(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure DS_Grid1DataChange(Sender: TObject; Field: TField);
    procedure CB_base_yyFChange(Sender: TObject);
    procedure BT_ExecClick(Sender: TObject);
    procedure Grid2ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamChange(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    SqlStr : String;
    FL_HomeDir : String;
    FL_FileName : String;
    PEmpno, PKorname : String;
    Tmp_chk : Boolean;

    procedure PL_FtpMessage(Sender : TObject; const Text : string);
    procedure PL_FtpProcess(Sender : TObject; aTotal, aRead : integer);
    procedure PL_FtpDone(Sender : TObject);
    procedure PL_DownLoad(ATier : Integer; AHostDir, AProgName, AProgID, AVer : String);
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
  end;

var
  MainForm: TMainForm;

const
  VERSUBKEY : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템\VER';

implementation

uses PTA30502;

{$R *.DFM}

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

  Insa_Data.Gubun := data_env;
  TMaxSession_HInsa.EnvFileName := Insa_Data.EnvFile;

  try
    TMaxSession_HInsa.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSgrade   := Hinsa_Param(cmdLine,4);

  GSempno   := '0117';      //R'1735';
//  GSempno   := '1262';
  GSkorname := '';
  GSgrade   := 'EEEEEEEECE';

  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      //실장급 이상이면 전체팀을 볼수 있게
      Sql.Add('select empno , ''field2'', ''field3'', ''field4'',''field5''   ');
      Sql.Add('  from pihorga                                   ');
      Sql.Add(' where orgym = (select value1 from pimvari       ');
      Sql.Add('                 where gubun = ''B2''            ');
      Sql.Add('                  and sgubun =''0000'')          ');
      Sql.Add('   and gubun = ''0''                             ');
      Sql.Add('   and deptlevel < ''C0''                        ');
      Sql.Add('   and payrayn =''Y''                            ');
      Sql.Add('   and empno = '''+GSempno+'''                   ');

      ClearFieldInfo;
      AddField('EMPNO'     , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

      if not TDS1.eof then
        GSgrade[5] := 'C';
    end;

  Tmp_chk := False;    //조회권한 존재 여부
  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      //교육이수 팀KPI 조회 권한 체크
      Sql.Add('select empno , ''field2'', ''field3'', ''field4'',''field5''   ');
      Sql.Add('  from pedu2right                                ');
      Sql.Add(' where empno = '''+GSempno+'''                   ');

      ClearFieldInfo;
      AddField('EMPNO'     , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;

      if not TDS1.eof then begin
        GSgrade[5] := 'C';
        Tmp_chk    := True;
      end;
    end;

  if GSgrade[5] > 'C' then   //실장급, 조회권한존재사원, 인력개발팀 이 아니면
     begin
        MessageDlg('교육이수 팀KIP 조회 권한이 없는 사용자입니다.', mtInformation , [mbOk],0);
        Application.Terminate;
        Exit;
     end;

  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      //기준년도 검색
      Sql.Add('select max(base_yy) base_yy , ''field2'', ''field3'', ''field4'',''field5''   ');
      Sql.Add('  from pedu2team                                   ');

      ClearFieldInfo;
      AddField('BASE_YY'   , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;
    end;

  CB_base_yyF.Text         := TDS1.FieldByName('BASE_YY').AsString +'년';
  ED_team.Text             := '';
  L_teamnm.ValueCaption    := '';

  SendMessage(SB_help.handle,WM_PAINT,0,0);
end;

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BT_findClick(Sender: TObject);
var
   Gs_sectcode, Ed_sectcode : string;
begin
  if (length(Trim(ED_team.Text)) < 5) and (Tmp_chk = True) then
      begin
         MessageDlg('팀을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
         System.Exit;
      end;

  Gs_sectcode := ''  ; Ed_sectcode := '';
  if (Tmp_chk = True) then
  with TDS1 do
    begin
      ServiceName := 'HINSA_select';

      Close;
      Sql.Clear;
      // 팀조회 권한 체크
      Sql.Add(' select sectcode, ''field2'', ''field3'', ''field4'',''field5''   ');
      Sql.Add(' from pycdept a, pimpmas  b where a.deptcode=b.deptcode           ');
      Sql.Add(' and a.orgnum=(select value1 from pimvari where gubun=''00'' and sgubun=''0001'') ');
      Sql.Add(' and b.empno = '''+GSempno+'''                   ');

      ClearFieldInfo;
      AddField('sectcode'  , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;
      Gs_sectcode := FieldByName('SECTCODE').AsString;   //조회자 부문코드

      Close;
      Sql.Clear;
      // 팀조회 권한 체크
      Sql.Add(' select distinct b.sectcode, ''field2'', ''field3'', ''field4'',''field5''   ');
      Sql.Add(' from pedu2team a, pycdept b                                                 ');
      Sql.Add(' where a.teamcode = b.deptcode and  a.base_yy  = '''+CB_base_yyF.Text+'''    ');
      Sql.Add(' and a.orgnum   = b.orgnum and a.teamcode      = '''+ED_team.Text+'''        ');
      ClearFieldInfo;
      AddField('sectcode'  , ftString,  100);
      AddField('field2'    , ftString,  100);
      AddField('field3'    , ftString,  100);
      AddField('field4'    , ftString,  100);
      AddField('field5'    , ftString,  100);
      Open;
      Ed_sectcode := FieldByName('SECTCODE').AsString;
      if Recordcount=0 then
        begin
          MessageDlg('해당팀은 교육이수 내역이 없습니다. 확인바랍니다.', mtError, [mbok], 0) ;
          System.Exit;
        end;

      if Copy(Gs_sectcode,1,1) <> Copy(Ed_sectcode,1,1) then
        begin
          MessageDlg('해당팀은 조회권한이 없습니다. 확인바랍니다.', mtError, [mbok], 0) ;
          System.Exit;
        end;
    end;

  SqlStr := Format('select a.base_yy, a.orgnum, a.teamcode, b.deptname teamname, '+
                   '       a.team_empno||'' - ''||m.korname team_empno, '+
                   '       nvl(a.team_count,  0)   team_count,     '+
                   '       nvl(a.tot_score,0)||'' (''||nvl(a.tot_sc,0)||'')'' tot,   '+
	           '       nvl(a.avg_score,0)||'' (''||nvl(a.avg_sc,0)||'')'' avg,   '+
                   '       a.kpi_grade                             '+
                   '  from pedu2team a, pimpmas m, pycdept b       '+
                   ' where a.orgnum   = b.orgnum                   '+
                   '   and a.teamcode = b.deptcode                 '+
                   '   and a.team_empno = m.empno(+)               '+
                   '   and a.base_yy  = ''%s'' ', [CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex]]);

// 05.04.27 변춘미 조회권한체크 부분 추가에 따라 아래부분은 삭제                   
//  if (GSgrade[5] > 'C') then
//    SqlStr := SqlStr + 'and a.team_empno = '''+GSempno+''' ';

  if length(Trim(ED_team.Text)) = 5 then
    SqlStr := SqlStr + 'and a.teamcode = '''+Trim(ED_team.Text)+'''';

  SqlStr := SqlStr + 'order by a.teamcode';

  with TDS_Grid1 do
    begin
      ServiceName := 'PTA3050B_sel1';
      Close;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('BASE_YY'   , ftString, 4);
      AddField('ORGNUM'    , ftString, 3);
      AddField('TEAMCODE'  , ftString, 6);
      AddField('TEAMNAME'  , ftString, 60);
      AddField('TEAM_EMPNO', ftString, 16);
      AddField('TEAM_COUNT', ftFloat,  5);
      AddField('TOT'       , ftString, 15);
      AddField('AVG'       , ftString, 15);
      AddField('KPI_GRADE' , ftString, 1);
      Open;

      if TDS_Grid1.eof then
        begin
          MessageDlg('해당하는 자료가 존재하지 않습니다.', mtInformation , [mbOk],0);
          System.Exit;
        end;

      DS_Grid1.OnDataChange := nil;
      FieldByName('TOT').Alignment := taCenter;
      FieldByName('AVG').Alignment := taCenter;
      FieldByName('KPI_GRADE').Alignment := taCenter;
      DS_Grid1.OnDataChange := DS_Grid1DataChange;
    end;
end;

procedure TMainForm.DS_Grid1DataChange(Sender: TObject; Field: TField);
var
  base_yy , orgnum, teamcode : String;
begin
  base_yy  := TDS_Grid1.FieldByName('base_yy').AsString;
  orgnum   := TDS_Grid1.FieldByName('orgnum').AsString;
  teamcode := TDS_Grid1.FieldByName('teamcode').AsString;

  SqlStr := Format('select a.base_yy, a.empno, b.korname,                '+
                   '       a.orgnum,  a.deptcode, c.deptname||'' ''||c.deptna3 deptname, a.teamcode,'+
                   '       nvl(a.kpiyn,''Y'') kpiyn,   d.codename,                        '+
                   '       to_char(nvl(a.tot_score,0),''990.9'')||'' (''||to_char(nvl(a.tot_sc,0),''990.9'')||'')'' tot,      '+
	           '       to_char(nvl(a.req_score,0),''990.9'')||'' (''||to_char(nvl(a.req_sc,0),''990.9'')||'')'' req,      '+
	           '       to_char(nvl(a.opt_score,0),''990.9'')||'' (''||to_char(nvl(a.opt_sc,0),''990.9'')||'')'' opt       '+
                   '  from pedu2his a, pimpmas b, pycdept c,             '+
                   '      (select ''0C'' codeno, ''팀장'' codename       '+
                   '         from dual                                   '+
                   '        union                                        '+
                   '       select codeno, codename                       '+
                   '         from pyccode d                              '+
                   '        where codeid =''I112'') d                    '+
                   ' where a.empno    = b.empno                          '+
                   '   and a.orgnum   = c.orgnum                         '+
                   '   and a.deptcode = c.deptcode                       '+
                   '   and a.paycl    = d.codeno                         '+
//                   '   and b.pstate   < ''80''                           '+
                   '   and a.base_yy  = ''%s''                           '+
                   '   and a.orgnum   = ''%s''                           '+
                   '   and a.teamcode = ''%s''  '+
                   '  order by a.deptcode, a.paycl ', [base_yy, orgnum, teamcode]);

  with TDS_Grid2 do
    begin
      ServiceName := 'PTA3050B_sel2';
      Close;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('BASE_YY' , ftString, 4);
      AddField('EMPNO'   , ftString, 4);
      AddField('KORNAME' , ftString, 12);
      AddField('ORGNUM'  , ftString, 3);
      AddField('DEPTCODE', ftString, 6);
      AddField('DEPTNAME', ftString, 60);
      AddField('TEAMCODE', ftString, 6);
      AddField('KPIYN'   , ftString, 2);
      AddField('CODENAME', ftString, 20);
      AddField('TOT'     , ftString, 15);
      AddField('REQ'     , ftString, 15);
      AddField('OPT'     , ftString, 15);
      Open;
      FieldByName('TOT').Alignment := taCenter;
      FieldByName('REQ').Alignment := taCenter;
      FieldByName('OPT').Alignment := taCenter;
    end;
end;

procedure TMainForm.CB_base_yyFChange(Sender: TObject);
begin
//  BT_findClick(Sender);
  TDS_Grid1.Close;
  TDS_Grid2.Close;
end;

procedure TMainForm.BT_ExecClick(Sender: TObject);
var
  FL_Check : Boolean;
begin

  PEmpno    := TDS_Grid2.FieldByName('empno').AsString ;
  PKorname  := TDS_Grid2.FieldByName('korname').AsString ;

  if (Trim(PEmpno) = '') then
    begin
      MessageDlg('조회하고자 하는 사원을 선택하세요.', mtError , [mbOk],0);
      System.Exit;
    end;

  FL_HomeDir   := GetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'NewHomeDir');

  FL_FileName  := FL_HomeDir+'\Bin\3tier\PTA3020B.EXE';

  SqlStr := 'SELECT LEVEL - 1 menu_level, tier, gubun, progid, upper_progid, '+
            '       progname, progexe, position, version, useyn, content     '+
            '  FROM pymenulist            '+
	    ' WHERE tier =''3''           '+
	    '   AND progexe = ''PTA3020B'' ';

  with Qr_Menu do
    begin
      ServiceName := 'HINSA_sel_menu';
      Close;
      Sql.Text := SqlStr;
      Open;
    end;

  FL_Check := False;
  if (Trim(GetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, 'PTA3020B')) <> Trim(Qr_Menu.FieldByName('version').AsString)) or
     (not FileExists(FL_FileName)) then
    FL_Check := True;

  if FL_Check then
    begin
      PL_DownLoad(StrToInt(Qr_Menu.FieldByName('tier').AsString),
                  Qr_Menu.FieldByName('position').AsString,
                  Qr_Menu.FieldByName('progexe').AsString+'.EXE',
                  Qr_Menu.FieldByName('progid').AsString,
                  Qr_Menu.FieldByName('version').AsString);
    end
  else
    begin
      RunProgram(FL_FileName + ' ,'+
             PEmpno +','+       // 1  사용자 ID
             PKorname +','+     // 2  사용자 성명
             'KPI'    +','+     //PTA3020B 프로그램을 CALL하기 위한 FLAG
             'EEEEEEEEEE' +','+               // 4  사용자 등급
             Hinsa_Param(cmdLine,5) +','+     // 5  Oracle DB User
             Hinsa_Param(cmdLine,6) +','+     // 6  Oracle DB Pass
             Hinsa_Param(cmdLine,7) + ','+    // 7  Oracle Ip Addresss
             Hinsa_Param(cmdLine,8) +','+     // 8  Oracle Tns Name
             Hinsa_Param(cmdLine,9) +','+     // 9  Oracle Listen Port
             Hinsa_Param(cmdLine,10) +','+    // 10 Unix Ip Addresss
             Hinsa_Param(cmdLine,11) +','+    // 11 Unix Rexec User
             Hinsa_Param(cmdLine,12) +','+    // 12 Unix Rexec Pass
             Hinsa_Param(cmdLine,13) +',');   // 13 DB Server Name
    end;

end;

procedure TMainForm.PL_DownLoad(ATier : Integer; AHostDir, AProgName, AProgID, AVer : String);
var
  FL_Ftp : TOnInterNetDownLoad;
begin
  FL_Ftp := nil;
  PG_Guage.Visible := True;

  FL_Ftp              := TOnInterNetDownLoad.Create(True);
  FL_Ftp.HttpDownLoad := False;
//  FL_Ftp.HostName     := FL_FtpAddr;
//  FL_Ftp.LoginName    := FL_UnixUser;
//  FL_Ftp.Password     := FL_UnixPass;

  FL_Ftp.HostName     := '10.4.4.72';
  FL_Ftp.LoginName    := 'hperson';
  FL_Ftp.Password     := 'qjsro12';

  FL_Ftp.Param1       := AProgID;
  FL_Ftp.Param2       := AVer;
  FL_Ftp.DownUpYn     := True;
  FL_Ftp.RemoteDir    := '';

  FL_Ftp.DestFileName := AHostDir + '/' + AProgName;

  if ATier = 1 then
    FL_Ftp.LocalFileName := FL_HomeDir+'\bin\tier\' + AProgName;
  if ATier = 2 then
    FL_Ftp.LocalFileName := FL_HomeDir+'\bin\2tier\' + AProgName;
  if ATier = 3 then
    FL_Ftp.LocalFileName := FL_HomeDir+'\bin\3tier\' + AProgName;

  FL_Ftp.OnMessage    := PL_FtpMessage;
  FL_Ftp.OnProcess    := PL_FtpProcess;
  FL_Ftp.OnTerminate  := PL_FtpDone;
  try
    FL_Ftp.Resume;
  except
    on E: Exception do
      MessageDlg('에러 : '+E.Message,mtError,[mbOK],0);
  end;
end;

procedure TMainForm.PL_FtpMessage(Sender : TObject; const Text : string);
begin
  SB_Help.Panels[1].Text := Text;
  SB_Help.Perform(WM_PAINT,0,0);
end;

procedure TMainForm.PL_FtpProcess(Sender : TObject; aTotal, aRead : Integer);
begin
  PG_Guage.Max      := aTotal;
  PG_Guage.Position := aRead;
  PG_Guage.Perform(WM_PAINT,0,0);
end;

procedure TMainForm.PL_FtpDone(Sender : TObject);
var
  FL_Ftp    : TOnInterNetDownLoad;
begin
  PG_Guage.Visible  := False;
  PG_Guage.Position := 0;
  SB_Help.Panels[1].Text := '';

  FL_Ftp    := TOnInterNetDownLoad(Sender);
  if Assigned(FL_Ftp) then
    begin
      if FL_Ftp.RetError <> '' then
        begin
          MessageDlg('에러 : '+FL_Ftp.RetError,mtError,[mbOK],0);
        end
      else if FL_Ftp.Param2 <> '도움말' then
        begin
          if FileExists(FL_Ftp.LocalFilename) then
            begin
              SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, FL_Ftp.Param1, FL_Ftp.Param2);

              RunProgram(FL_Ftp.LocalFilename + ' ,'+
                         PEmpno +','+                     // 1  사용자 ID
                         PKorname +','+                   // 2  사용자 성명
                         'KPI' +','+                      // 3  PTA3020B 프로그램을 CALL하기 위한 FLAG
                         'EEEEEEEEEE' +','+               // 4  사용자 등급
                         Hinsa_Param(cmdLine,5) +','+     // 5  Oracle DB User
                         Hinsa_Param(cmdLine,6) +','+     // 6  Oracle DB Pass
                         Hinsa_Param(cmdLine,7) + ','+    // 7  Oracle Ip Addresss
                         Hinsa_Param(cmdLine,8) +','+     // 8  Oracle Tns Name
                         Hinsa_Param(cmdLine,9) +','+     // 9  Oracle Listen Port
                         Hinsa_Param(cmdLine,10) +','+    // 10 Unix Ip Addresss
                         Hinsa_Param(cmdLine,11) +','+    // 11 Unix Rexec User
                         Hinsa_Param(cmdLine,12) +','+    // 12 Unix Rexec Pass
                         Hinsa_Param(cmdLine,13) +',');   // 13 DB Server Name
            end;
        end
      else
        begin
          FileExecute(FL_Ftp.LocalFilename, '', '', esMaximized);
        end;
    end;
end;
procedure TMainForm.Grid2ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (TDS_Grid2.FieldByName('KPIYN').AsString = 'N') then
//  if (TDS_Grid2.FieldByName('PAYCL').AsString >= '99') then
      Canvas.Brush.Color := $00FEB4E8;
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
end;

procedure TMainForm.ED_teamChange(Sender: TObject);
begin
  TDS_Grid1.Close;
  TDS_Grid2.Close;
  L_teamnm.ValueCaption := '';
end;

procedure TMainForm.BT_ExcelClick(Sender: TObject);
var
  XL, Sheet : Variant;
  i : Integer;
begin

  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  XL.WorkBooks.Add;
  XL.Workbooks[1].WorkSheets[1].Name := '팀원별 교육이수 현황';
  Sheet := XL.WorkBooks[1].WorkSheets['팀원별 교육이수 현황'];

  Sheet.Cells[1,1]  := '<팀 KPI 현황>';
  Sheet.Cells[2,1]  := '팀코드';
  Sheet.Cells[2,2]  := '팀명';
  Sheet.Cells[2,3]  := '팀장';
  Sheet.Cells[2,4]  := '인원수';
  Sheet.Cells[2,5]  := '총이수학점';
  Sheet.Cells[2,6]  := '학점평균';
  Sheet.Cells[2,7]  := 'KPI등급';

  Sheet.Cells[3,1]  := TDS_Grid1.FieldByName('TEAMCODE').AsString;
  Sheet.Cells[3,2]  := TDS_Grid1.FieldByName('TEAMNAME').AsString;
  Sheet.Cells[3,3]  := ''''+TDS_Grid1.FieldByName('TEAM_EMPNO').AsString;
  Sheet.Cells[3,4]  := TDS_Grid1.FieldByName('TEAM_COUNT').AsString;
  Sheet.Cells[3,5]  := TDS_Grid1.FieldByName('TOT').AsString;
  Sheet.Cells[3,6]  := TDS_Grid1.FieldByName('AVG').AsString;
  Sheet.Cells[3,7]  := TDS_Grid1.FieldByName('KPI_GRADE').AsString;

  Sheet.Cells[5,1]  := '<팀원별 교육이수 현황>';
  Sheet.Cells[6,1]  := '부서명';
  Sheet.Cells[6,2]  := '직급';
  Sheet.Cells[6,3]  := '사번';
  Sheet.Cells[6,4]  := '성명';
  Sheet.Cells[6,5]  := '총학점';
  Sheet.Cells[6,6]  := '필수학점';
  Sheet.Cells[6,7]  := '선택학점';
  Sheet.Cells[6,8]  := 'KPI포함여부';

  TDS_Grid2.First;
  i := 1;
  while not TDS_Grid2.Eof do
    begin
      Sheet.Cells[i + 6, 1] := TDS_Grid2.FieldByName('DEPTNAME').AsString;
      Sheet.Cells[i + 6, 2] := TDS_Grid2.FieldByName('CODENAME').AsString;
      Sheet.Cells[i + 6, 3] := ''''+TDS_Grid2.FieldByName('EMPNO').AsString;
      Sheet.Cells[i + 6, 4] := TDS_Grid2.FieldByName('KORNAME').AsString;
      Sheet.Cells[i + 6, 5] := TDS_Grid2.FieldByName('TOT').AsString;
      Sheet.Cells[i + 6, 6] := TDS_Grid2.FieldByName('REQ').AsString;
      Sheet.Cells[i + 6, 7] := TDS_Grid2.FieldByName('OPT').AsString;
      Sheet.Cells[i + 6, 8] := TDS_Grid2.FieldByName('KPIYN').AsString;
      inc(i);
      TDS_Grid2.Next;
    end;

  XL.Range['A..H'].Select;
  XL.Selection.Columns.AutoFit;

  XL.Range['A1','H2'].Select;
  XL.Selection.Font.Bold := True ;

  XL.Range['A2','H2'].Select;
  XL.Selection.HorizontalAlignment := xlCenter;

  XL.Range['A5','H6'].Select;
  XL.Selection.Font.Bold := True ;

  XL.Range['A6','H6'].Select;
  XL.Selection.HorizontalAlignment := xlCenter;

  XL.Range['H..H'].Select;
  XL.Selection.HorizontalAlignment := xlCenter;

  XL.Range['A1','A1'].Select;
  XL.Visible := true;
  XL := UnAssigned;

end;

end.
