unit PTA30601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, Db, Tmax_DataSetText, Tmax_session,
  ComCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo,
  OnShapeLabel, Grids, DBGrids, OnGrDBGrid, StdCtrls, OnFocusButton, OnInsaCommon,
  OnRegistry, OnInternetFtp, OnPopupEdit, TmaxFunc;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    TMaxSession: TTMaxSession;
    SB_Help: TStatusBar;
    CB_base_yyF: TOnComboEdit;
    OnShapeLabel1: TOnShapeLabel;
    Grid2: TOnGrDbGrid;
    OnShapeLabel2: TOnShapeLabel;
    BT_find: TOnFocusButton;
    BT_close: TOnFocusButton;
    BT_Exec: TOnFocusButton;
    TDS_Grid2: TTMaxDataSet;
    DS_Grid2: TDataSource;
    Qr_Menu: TTMaxDataSet;
    PG_Guage: TProgressBar;
    TDS1: TTMaxDataSet;
    ED_team: TOnWinPopupEdit;
    L_team_empno: TOnShapeLabel;
    L_team_count: TOnShapeLabel;
    L_tot_score: TOnShapeLabel;
    L_avg_score: TOnShapeLabel;
    L_team_name: TOnShapeLabel;
    L_kpi_grade: TOnShapeLabel;
    L_teamnm: TOnShapeLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure CB_base_yyFChange(Sender: TObject);
    procedure BT_ExecClick(Sender: TObject);
    procedure Grid2ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    SqlStr : String;
    FL_HomeDir : String;
    FL_FileName : String;
    PEmpno, PKorname : String;

    procedure PL_FtpMessage(Sender : TObject; const Text : string);
    procedure PL_FtpProcess(Sender : TObject; aTotal, aRead : integer);
    procedure PL_FtpDone(Sender : TObject);
    procedure PL_DownLoad(ATier : Integer; AHostDir, AProgName, AProgID, AVer : String);
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    FG_Date   : String[15];
  end;

var
  MainForm: TMainForm;

const
  VERSUBKEY : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템\VER';

implementation

uses PTA30602;

{$R *.DFM}

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
     Close;
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

     base_yy := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];

     //팀별 KPI 현황
     SqlStr := Format('select base_yy, orgnum, teamcode, teamname,                       '+
                      '       teamempno||'' - ''||teamkorname  team_empno,  team_count,  '+
                      '       tot_score||'' (''||tot_sc||'')'' tot,                      '+
                      '       avg_score||'' (''||avg_sc||'')'' avg,                      '+
                      '       decode(sign(avg_score - 109.9), +1, ''S'',                 '+
                      '       decode(sign(avg_score - 99.9),  +1, ''A'',                 '+
                      '       decode(sign(avg_score - 89.9),  +1, ''B'',                 '+
                      '       decode(sign(avg_score - 79.9),  +1, ''C'',                 '+
                      '       decode(sign(avg_score - 69.9),  +1, ''D''))))) kpi_grade   '+
                      ' from       '+
                      '  (select B.base_yy, D.orgnum,  decode(D.deptlevel, ''E0'', D.extcode, D.deptcode ) teamcode,'+
                      '          E.deptname teamname,  E.empno teamempno,  E.korname teamkorname,                   '+
                      '          count(*) team_count,  sum(T.tot_sc) tot_sc, ceil(avg(T.tot_sc) * 10)/10 avg_sc,    '+
                      '          sum(decode( T.req_check, ''Y'',0,                                       '+
                      '              decode( T.req_check, ''Y'',0,                                       '+
                      '              decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) +      '+
                      '              decode( T.req_check, ''Y'',0,                                                            '+
                      '              decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )        '+
                      '             )) tot_score,                                                                             '+
                      '          ceil(avg(decode( T.req_check, ''Y'',0,                                                       '+
                      '                   decode( T.req_check, ''Y'',0,                                                       '+
                      '                   decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) + '+
                      '                   decode( T.req_check, ''Y'',0,                                                       '+
                      '                   decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )   '+
                      '             )) *10 ) / 10 avg_score                                                           '+
                      '    from  pimpmas A,  pedu2base B,                                                             '+
                      '         (select  T1.empno, max(T1.req_check) req_check, nvl(sum(T1.score),0) tot_sc,          '+
                      '                  nvl(sum(decode(T1.req_yn, ''Y'',T1.score)),0) req_sc,                        '+
                      '                  nvl(sum(decode(T1.req_yn, ''N'',T1.score)),0) opt_sc,                        '+
                      '                  nvl(sum(decode(T1.req_yn, ''Y'',decode(A.max_score, NULL,T1.score,           '+
                      '                  decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))   '+
                      '                  )),0) req_score,                                                             '+
                      '                  nvl(sum(decode(T1.req_yn, ''N'',decode(A.max_score, NULL,T1.score,           '+
                      '                  decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))   '+
                      '                  )),0) opt_score                                                              '+
                      '            from  pedu2limit A,                                                                '+
                      '                 (select  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type,        '+
                      '                          max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,        '+
                      '                          sum(A.edu_score) score                      '+
                      '                    from  pedu2item A,  pedu2type B                   '+
                      '                   where  A.base_yy = ''%s''                          '+
                      '                     and  B.edu_type = A.edu_type                     '+
                      '                   group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')'+
                      '                 ) T1                                                 '+
                      '           where A.limit_type(+) = T1.limit_type                      '+
                      '          group by  T1.empno                                          '+
                      '         ) T, pycdept D,                                              '+
                      '         (select orgnum, deptcode, deptname, empno, korname           '+
                      '            from pihorga                                              '+
                      '           where orgym = (select value1 from pimvari                  '+
                      '                          where gubun = ''B2'' and sgubun =''0000'')  '+
                      '            and deptcode = ''%s''                                     '+
                      '            and gubun =''0'' and payrayn = ''Y'') E                   '+
                      '   where A.empno    = T.empno                                         '+
                      '     and B.base_yy  = ''%s''                                          '+
                      '     and B.paycl    = decode(A.payra,''2C'',''0C'',A.paycl)           '+
                      '     and A.orgnum   = D.orgnum                                        '+
                      '     and A.deptcode = D.deptcode                                      '+
                      '     and D.orgnum   = E.orgnum                                        '+
                      '     and decode(D.deptlevel, ''E0'', D.extcode, D.deptcode) = E.deptcode  '+
                      '     and A.pstate   < ''80''                                              '+ //퇴사자 제외
                      '     and A.paycl    < ''99''                                              '+ //팀KPI는 특정직까지
                      '     and decode(D.deptlevel, ''E0'', D.extcode, D.deptcode ) = ''%s''     '+
                      '   group by B.base_yy, D.orgnum, decode(D.deptlevel, ''E0'', D.extcode, D.deptcode), E.deptname,E.empno, E.korname '+
                      ' )  ',[base_yy, ED_team.Text, base_yy, ED_team.Text ]);

     with TDS1 do
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

          if TDS1.eof then
          begin
               MessageDlg('해당하는 자료가 존재하지 않습니다.', mtInformation , [mbOk],0);
               SB_Help.Panels[1].Text := '';
               BT_closeClick(sender);
               System.Exit;
          end;

          L_team_name.ValueCaption  := FieldByName('TEAMNAME').AsString;
          L_team_empno.ValueCaption := FieldByName('TEAM_EMPNO').AsString;
          L_team_count.ValueCaption := FieldByName('TEAM_COUNT').AsString;
          L_tot_score.ValueCaption  := FieldByName('TOT').AsString;
          L_avg_score.ValueCaption  := FieldByName('AVG').AsString;
          L_kpi_grade.ValueCaption  := FieldByName('KPI_GRADE').AsString;
     end;

     //팀원별 교육이수 현황
     SqlStr := Format('select  base_yy, empno, korname, orgnum, deptcode, deptname, teamcode, paycl, paycl_name codename,'+
                      '        to_char(tot_score,''990.9'')||'' (''||to_char(tot_sc,''990.9'')||'')'' tot,               '+
                      '        to_char(req_score,''990.9'')||'' (''||to_char(req_sc,''990.9'')||'')'' req,               '+
                      '        to_char(opt_score,''990.9'')||'' (''||to_char(opt_sc,''990.9'')||'')'' opt                '+
                      '  from                                                                                            '+
                      '    (select  B.base_yy, T.empno, A.korname, D.orgnum, D.deptcode,                                 '+
                      '             D.deptname||'' ''||D.deptna3 deptname,                                               '+
                      '             decode(D.deptlevel, ''E0'', D.extcode, D.deptcode ) teamcode,                        '+
                      '             decode(A.payra,''2C'',''0C'',A.paycl) paycl, B.paycl_name,                           '+
                      '             T.req_sc, T.opt_sc, T.tot_sc,                                                        '+
                      '             decode( T.req_check, ''Y'',0,                                                        '+
                      '             decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) req_score, '+
                      '             decode( T.req_check, ''Y'',0,                                                                '+
                      '             decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) ) opt_score, '+
                      '             decode( T.req_check, ''Y'',0,                                                                '+
                      '             decode( T.req_check, ''Y'',0,                                                                '+
                      '             decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) +          '+
                      '             decode( T.req_check, ''Y'',0,                                                                '+
                      '             decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )            '+
                      '              ) tot_score                                                                                 '+
                      '       from  pimpmas A,  pedu2base B,                                                                     '+
                      '             (select  T1.empno, max(T1.req_check) req_check,                                              '+
                      '                      nvl(sum(T1.score),0) tot_sc,                                                        '+
                      '                      nvl(sum(decode(T1.req_yn, ''Y'',T1.score)),0) req_sc,                               '+
                      '                      nvl(sum(decode(T1.req_yn, ''N'',T1.score)),0) opt_sc,                               '+
                      '                      nvl(sum(decode(T1.req_yn, ''Y'',decode(A.max_score, NULL,T1.score,                  '+
                      '                      decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))          '+
                      '                      )),0) req_score,                                                                    '+
                      '                      nvl(sum(decode(T1.req_yn, ''N'',decode(A.max_score, NULL,T1.score,                  '+
                      '                      decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))          '+
                      '                      )),0) opt_score                                                                     '+
                      '                from  pedu2limit A,                                                                       '+
                      '                     (select  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type,               '+
                      '                              max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,               '+
                      '                              sum(A.edu_score) score                                '+
                      '                        from  pedu2item A,  pedu2type B                             '+
                      '                       where  A.base_yy = ''%s''                                    '+
                      '                         and  B.edu_type = A.edu_type                               '+
                      '                       group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')  '+
                      '                     ) T1                                                           '+
                      '               where  A.limit_type(+) = T1.limit_type                               '+
                      '               group by  T1.empno                                                   '+
                      '             ) T,                                                                   '+
                      '             pycdept D                                                              '+
                      '      where  A.empno    = T.empno                                                   '+
                      '        and  B.base_yy  = ''%s''                                                    '+
                      '        and  B.paycl    = decode(A.payra,''2C'',''0C'',A.paycl)                     '+
                      '        and  A.orgnum   = D.orgnum                                                  '+
                      '        and  A.deptcode = D.deptcode                                                '+
                      '        and  A.pstate   < ''80''                                                    '+
                      '        and  decode(D.deptlevel, ''E0'', D.extcode, D.deptcode ) = ''%s''           '+
                      '    ) A  order by deptcode, paycl      ',[base_yy, base_yy, ED_team.Text ]);

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
          AddField('PAYCL'   , ftString, 3);
          AddField('CODENAME', ftString, 20);
          AddField('TOT'     , ftString, 15);
          AddField('REQ'     , ftString, 15);
          AddField('OPT'     , ftString, 15);
          Open;
          FieldByName('TOT').Alignment := taCenter;
          FieldByName('REQ').Alignment := taCenter;
          FieldByName('OPT').Alignment := taCenter;
     end;

     SB_Help.Panels[1].Text := '조회되었습니다...';
end;

procedure TMainForm.CB_base_yyFChange(Sender: TObject);
begin
     L_team_name.ValueCaption  := '';
     L_team_empno.ValueCaption := '';
     L_team_count.ValueCaption := '';
     L_tot_score.ValueCaption  := '';
     L_avg_score.ValueCaption  := '';
     L_kpi_grade.ValueCaption  := '';
     TDS_Grid2.Close;
end;

procedure TMainForm.BT_ExecClick(Sender: TObject);
var
     FL_Check : Boolean;
begin
     if not TDS_Grid2.Active then System.Exit;

     PEmpno    := TDS_Grid2.FieldByName('empno').AsString ;
     PKorname  := TDS_Grid2.FieldByName('korname').AsString ;

     if (Trim(PEmpno) = '') then
     begin
         MessageDlg('조회하고자 하는 사원을 선택하세요.', mtError , [mbOk],0);
         System.Exit;
     end;

     FL_HomeDir   := GetKeyValue(HKEY_LOCAL_MACHINE,SUBKEY,'NewHomeDir');

     FL_FileName  := FL_HomeDir+'\Bin\3tier\PTA3070B.EXE';

     SqlStr := 'SELECT '''' menu_level, tier, gubun, progid, upper_progid,      '+  // LEVEL - 1 menu_level,
               '       progname, progexe, position, version, useyn, content     '+
               '  FROM pymenulist                                               '+
               ' WHERE tier =''3''                                              '+
               '   AND progexe = ''PTA3070B''                                   ';

     with Qr_Menu do
     begin
         ServiceName := 'HINSA_sel_menu';
         Close;
         Sql.Text := SqlStr;
         Open;
     end;

     FL_Check := False;
     if (Trim(GetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, 'PTA3070B')) <> Trim(Qr_Menu.FieldByName('version').AsString)) or
        (not FileExists(FL_FileName)) then FL_Check := True;

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
                     'KPI'    +','+     //PTA3070B 프로그램을 CALL하기 위한 FLAG
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
     //FL_Ftp.HostName     := FL_FtpAddr;
     //FL_Ftp.LoginName    := FL_UnixUser;
     //FL_Ftp.Password     := FL_UnixPass;

     FL_Ftp.HostName     := '10.4.4.72';
     FL_Ftp.LoginName    := 'hperson';
     FL_Ftp.Password     := 'qjsro12';

     FL_Ftp.Param1       := AProgID;
     FL_Ftp.Param2       := AVer;
     FL_Ftp.DownUpYn     := True;
     FL_Ftp.RemoteDir    := '';

     FL_Ftp.DestFileName := AHostDir + '/' + AProgName;

     if ATier = 1 then FL_Ftp.LocalFileName := FL_HomeDir+'\bin\tier\' + AProgName;
     if ATier = 2 then FL_Ftp.LocalFileName := FL_HomeDir+'\bin\2tier\' + AProgName;
     if ATier = 3 then FL_Ftp.LocalFileName := FL_HomeDir+'\bin\3tier\' + AProgName;

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
               if FL_Ftp.RetError <> '' then MessageDlg('에러 : '+FL_Ftp.RetError,mtError,[mbOK],0)
          else if FL_Ftp.Param2 <> '도움말' then
          begin
               if FileExists(FL_Ftp.LocalFilename) then
               begin
                    SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, FL_Ftp.Param1, FL_Ftp.Param2);

                    RunProgram(FL_Ftp.LocalFilename + ' ,'+
                               PEmpno +','+                     // 1  사용자 ID
                               PKorname +','+                   // 2  사용자 성명
                               'KPI' +','+                      // 3  PTA3070B 프로그램을 CALL하기 위한 FLAG
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
          else FileExecute(FL_Ftp.LocalFilename, '', '', esMaximized);
     end;
end;
procedure TMainForm.Grid2ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
     if (TDS_Grid2.FieldByName('PAYCL').AsString >'99') then Canvas.Brush.Color := $00FEB4E8;
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
     TDS_Grid2.Close;
     L_teamnm.ValueCaption := '';
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
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

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

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSgrade   := Hinsa_Param(cmdLine,4);

  SqlStr := 'select distinct base_yy,null,null,null,null  '+
            '  from pedu2base order by 1                  ';

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlStr;

    ClearFieldInfo;
    AddField('BASE_YY'   , ftString,  100);
    AddField('field2'    , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    if TDS1.recordcount > 0 then
    begin
      CB_base_yyF.items.Clear;
      CB_base_yyF.KeyItems.Clear;
      while not eof do
      begin
        CB_base_yyF.Items.Add(fields[0].AsString);
        CB_base_yyF.KeyItems.Add(fields[0].AsString);
        next;
      end;
      last;
      if Copy(FG_Date,1,4) <> fields[0].AsString then
      begin
        CB_base_yyF.Items.Add(Copy(FG_Date,1,4) +'년');
        CB_base_yyF.KeyItems.Add(Copy(FG_Date,1,4));
      end;
    end;
  end;
  CB_base_yyF.Text := Copy(FG_Date,1,4) +'년';
  SendMessage(SB_help.handle,WM_PAINT,0,0);

  if GSgrade[5] > 'C' then //일반사용자
  begin
    SqlStr := Format('select deptcode, deptname, adpayrayn, ''field4'',''field5''  '+
                     '  from pihorga                                               '+
                     ' where orgym = (select value1 from pimvari                   '+
                     '                 where gubun = ''B2'' and sgubun =''0000'')  '+
                     '   and gubun = ''0''                                         '+
                     '   and payrayn = ''Y''                                       '+
                     '   and deptlevel <> ''E0''                                   '+
                     '   and empno = ''%s'' '+
                     ' order by adpayrayn ', [GSempno]);

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

      if TDS1.eof then
      begin
        MessageDlg('해당하는 자료가 존재하지 않습니다. 프로그램을 종료합니다.', mtInformation , [mbOk],0);
        System.Exit;
      end;
      ED_team.Text           := FieldByName('DEPTCODE').AsString;
      L_teamnm.ValueCaption  := FieldByName('DEPTNAME').AsString;

      BT_findClick(Sender);
    end;
  end;
end;

end.
