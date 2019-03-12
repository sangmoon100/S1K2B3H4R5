unit pta10201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ComCtrls, ExtCtrls, OnShapeLabel, TmaxFunc,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, ImgList, Grids, DBGrids,
  OnGrDBGrid, Db, OnInsaCommon, OnMemDataset,
  OnPopupEdit, Buttons, Tmax_DataSetText, OnScheme, Tmax_session;

type
  TFM_Main = class(TForm)
    DataSource1: TDataSource;
    Panel_Body: TPanel;
    Qry_11: TTMaxDataSet;
    Qry_12: TTMaxDataSet;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    ED_paycl: TOnShapeLabel;
    ED_empdate: TOnShapeLabel;
    ED_jobgun: TOnShapeLabel;
    ED_paycldate: TOnShapeLabel;
    ED_deptname: TOnShapeLabel;
    ED_cardate: TOnShapeLabel;
    ED_empno: TOnWinPopupEdit;
    Grid1: TOnGrDbGrid;
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    SB_find: TOnFocusButton;
    BT_close: TOnFocusButton;
    TMaxSession: TTMaxSession;
    ED_korname: TOnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SB_FindClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BitBtn_CloseClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_closeClick(Sender: TObject);
  private
    { Private declarations }
    FL_start     : Boolean;
    FL_deptcode  : string;
    FL_payrayn   : string;
    FL_payclcode : string;
    FL_jobgun    : string;

    procedure PL_Init;
    function  PL_GetPersonData : Boolean;
    function  PL_GetDeptcodes : Boolean;
    function  PL_FindPrevilige : Boolean;
  public
    { Public declarations }
    FG_Sql     : string;
    FG_empno   : string;
    FG_korname : string;
    FG_pass    : string;
    FG_grade   : string;
    FG_sysdate : string;
    FG_deptname: string;
    FG_mrtodate: string;
    FG_Dept    : TStringList;
  end;

var
  FM_Main: TFM_Main;

implementation

uses pta10202;

{$R *.DFM}

procedure TFM_Main.PL_Init;
begin
  //팀장 소속사원 열람가능하도록. shm 2001.05.23
  FG_Sql := 'SELECT NVL(deptcode,'' ''), NVL(payrayn,'' ''), TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
            '  FROM pimpmas '+
            ' WHERE empno  = ''%s'' ';
  FG_Sql := Format(FG_Sql,[FG_empno]);

  with Qry_12 do
    begin
      ServiceName := 'PTA1020B_sel2';
      Close;
      Sql.Clear;
      Sql.Add( FG_Sql );

      ClearFieldInfo;
      AddField('deptcode',  ftString, 6 );
      AddField('payrayn' ,  ftString, 1 );
      AddField('curdate' ,  ftString, 16 );
      Open;
      FL_deptcode := FieldByName('deptcode').AsString;
      FL_payrayn  := FieldByName('payrayn').AsString;
    end;

  if FL_payrayn = 'Y' then
    begin
      ED_empno.enabled := True;
      SB_find.Enabled  := True;
    end;

  FG_sysdate    := Qry_12.FieldByName('curdate').AsString;
  ED_empno.Text := FG_empno;
end;

function TFM_Main.PL_GetPersonData : Boolean;
begin
  Result := False;
  FG_Sql := 'SELECT NVL(empno,'' '')     '+
            '  FROM pimpmas              '+
            ' WHERE pstateyn = ''Y''     '+
            '   AND (empno   =    ''%s'' '+
            '    OR korname LIKE ''%s'') ';
  FG_Sql := Format(FG_Sql,[ED_empno.Text, ED_empno.Text+'%']);

  with Qry_12 do
    begin
      ServiceName := 'PTA1020B_common';
      Close;
      Sql.Clear;
      Sql.Add( FG_Sql );

      ClearFieldInfo;
      AddField('empno',  ftString, 2000 );
      Open;

      if not Qry_12.Eof then
        ED_empno.Text := Qry_12.FieldByName('empno').AsString;
      if Qry_12.RecordCount > 1 then
        //sb_empno_click;
    end;

  SB_Help.Panels[1].Text := ' 인사 정보를 읽고 있는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  FG_Sql := 'SELECT                                            '+
            '    NVL(A.empno      ,'' ''),                     '+
            '    NVL(A.korname    ,'' ''),                     '+
            '    NVL(B.deptname   ,'' ''),                     '+
            '    NVL(A.paycl      ,'' ''),                     '+
            '    NVL(C.codename   ,'' ''),                     '+
            '    NVL(A.jobgun     ,'' ''),                     '+
            '    NVL(D.codename   ,'' ''),                     '+
            '    NVL(A.orgempdate ,'' '') paycldate,           '+
            '    NVL(A.cpaycldate ,'' ''),                     '+
            '    NVL(A.cardate    ,'' '')                      '+
            '  FROM pimpmas A, pycdept B, pyccode C, pyccode D '+
            ' WHERE A.orgnum   = B.orgnum                      '+
            '   AND A.deptcode = B.deptcode                    '+
            '   AND C.codeid   = ''I112''                      '+
            '   AND A.paycl    = C.codeno                      '+
            '   AND D.codeid   = ''I115''                      '+
            '   AND A.jobgun   = D.codeno                      '+
            '   AND A.pstateyn = ''Y''                         '+
            '   AND A.empno    = ''%s''                        ';
  FG_Sql := Format(FG_Sql,[ED_empno.Text]);

  with Qry_12 do
    begin
      ServiceName := 'PTA1020B_sel3';
      Close;
      Sql.Clear;
      Sql.Add( FG_Sql );

      ClearFieldInfo;
      AddField('empno'     , ftString, 4 );
      AddField('korname'   , ftString, 12);
      AddField('deptname'  , ftString, 60);
      AddField('paycl'     , ftString, 3 );
      AddField('payclname' , ftString, 20);
      AddField('jobgun'    , ftString, 2 );
      AddField('jobgunname', ftString, 20);
      AddField('paycldate' , ftString, 8 );
      AddField('cpaycldate', ftString, 8 );
      AddField('cardate'   , ftString, 8 );
      Open;
    end;


  with Qry_12 do
    begin
      ED_korname.Text          := Fieldbyname('korname').AsString;
      ED_paycl.ValueCaption    := Fieldbyname('payclname').AsString;
      ED_deptname.ValueCaption := Fieldbyname('deptname').AsString;
      ED_jobgun.ValueCaption   := Fieldbyname('jobgunname').AsString;
    if Fieldbyname('paycldate').AsString = '' then
      ED_empdate.ValueCaption  := ''
    else
      ED_empdate.ValueCaption  := Copy(Fieldbyname('paycldate').AsString,1,4)+'/'+  //쓰던필드 그대로
                                  Copy(Fieldbyname('paycldate').AsString,5,2)+'/'+
                                  Copy(Fieldbyname('paycldate').AsString,7,2);
    if Fieldbyname('cpaycldate').AsString = '' then
      ED_paycldate.ValueCaption  := ''
    else
      ED_paycldate.ValueCaption:= Copy(Fieldbyname('cpaycldate').AsString,1,4)+'/'+
                                  Copy(Fieldbyname('cpaycldate').AsString,5,2)+'/'+
                                  Copy(Fieldbyname('cpaycldate').AsString,7,2);
    if Fieldbyname('cardate').AsString = '' then
      ED_cardate.ValueCaption  := ''
    else
      ED_cardate.ValueCaption  := Copy(Fieldbyname('cardate').AsString,1,4)+'/'+
                                  Copy(Fieldbyname('cardate').AsString,5,2)+'/'+
                                  Copy(Fieldbyname('cardate').AsString,7,2);
      FL_payclcode             := Fieldbyname('paycl').AsString;
      FL_jobgun                := Fieldbyname('jobgun').AsString;

      Close;
    end;

  SB_Help.Panels[1].Text := '';
  Result := True;
end;

function TFM_Main.PL_GetDeptcodes : Boolean;
begin
  Result := False;
  SB_Help.Panels[1].Text := ' 열람할 수 있는 부서를 읽어 오는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  FG_Sql := 'SELECT deptcode FROM pimpmas                                 '+
            ' WHERE empno = ''%s''                                        '+
            'UNION                                                        '+
            'SELECT deptcode FROM pycdept                                 '+
            ' WHERE orgnum =  (SELECT value1 FROM pimvari                 '+
            '                   WHERE gubun  = ''00''                     '+
            '                     AND sgubun = ''0001'')                  '+
            '   AND extcode = (SELECT deptcode FROM pimpmas               '+
            '                   WHERE empno = ''%s'')                     '+
            'UNION                                                        '+
            'SELECT deptcode FROM pihorga                                 '+
            ' WHERE orgym  = (SELECT value1 FROM pimvari                  '+
            '                  WHERE gubun = ''B2'' AND sgubun = ''0000'')'+
            '   AND empno     = ''%s''                                    '+
            '   AND gubun     = ''0''                                     '+
            '   AND adpayrayn = ''Y''                                     ';
  FG_Sql := Format(FG_Sql,[FG_empno, FG_empno, FG_empno]);

  with Qry_12 do
    begin
      ServiceName := 'PTA1020B_common';
      Close;
      Sql.Clear;
      Sql.Add(FG_Sql);

      ClearFieldInfo;
      AddField('deptcode', ftString, 2000 );
      Open;
      FG_Dept.Clear;
      while not Eof do
        begin
          FG_Dept.Add(Trim(FieldByName('deptcode').AsString));
          Next;
        end;
    end;

  SB_Help.Panels[1].Text := '';
  Result := True;
end;

function TFM_Main.PL_FindPrevilige : Boolean;
begin
  Result := False;

  SB_Help.Panels[1].Text := ' 열람할 수 있는 권한 설정 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  FG_Sql := 'SELECT deptcode FROM pimpmas '+
            ' WHERE empno = ''%s'' ';
  FG_Sql := Format(FG_Sql,[ED_empno.Text]);

  with Qry_12 do
    begin
      ServiceName := 'PTA1020B_common';
      Close;
      Sql.Clear;
      Sql.Add( FG_Sql);

      ClearFieldInfo;
      AddField('deptcode', ftString, 2000);
      Open;
    end;

  if not ((Copy(FG_grade,5,1) <= 'C') or
          (FG_Dept.IndexOf(Qry_12.FieldByName('deptcode').AsString) >= 0)) then
    begin
      Qry_12.Close;
      SB_Help.Panels[1].Text := '';
      Messagedlg('조회권한이 없습니다. 사번을 확인하십시요!!',mtError,[mbOK],0);
      System.Exit;
    end;
  Qry_12.Close;
  SB_Help.Panels[1].Text := '';
  Result := True;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_start := True;
  FM_empno := nil;
  FM_empno := TFM_empno.Create(Self);
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FM_empno.Free;
  FG_Dept.Free;
  FM_empno:= nil;
  FG_Dept := nil;
  CanClose := True;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  msg: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh ;
  SB_Help.Panels[1].Text := ' 데이터 초기화 작업을 하고 있는 중입니다...';

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

  if FL_start then
    begin
      FL_start := False;
      Application.ProcessMessages;
      FG_empno   := HInsa_param(cmdline,1);
      FG_korname := HInsa_param(cmdline,2);
      FG_pass    := HInsa_param(cmdline,3);
      FG_grade   := HInsa_param(cmdline,4);

      if (Copy(FG_grade,5,1) <> '') and (Copy(FG_grade,5,1) <= 'C') then
        begin
          ED_empno.Enabled := True;
          SB_find.Enabled  := True;
        end
      else
        begin
          ED_empno.Enabled := False;
          SB_find.Enabled  := False;
        end;

      FG_Dept := nil;
      FG_Dept := TStringList.Create;
      if not PL_GetDeptcodes then
        System.Exit;

      PL_Init;
      SB_FindClick(Sender);
      SB_Help.Panels[1].Text := '';
    end;
end;

procedure TFM_Main.SB_FindClick(Sender: TObject);
var
  FL_Date  : string;
  FL_Date1 : Integer;
begin
//  MD_Data.Close;

  SB_Help.Panels[1].Text := ' 개인 외국어 점수 데이타 검색중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);
  PL_GetPersonData;

  if not PL_FindPrevilige then
    System.Exit;

//2005.3.8. 유효성 수정(승격제도 변경으로 유효,무효 의미없어짐) --> 이미희씨 요청
{
  FL_Date := '2003';  // 기준코드 등록으로 처리해야 할 부분..
  FG_Sql  := 'SELECT                                                '+
             '    NVL(B.empno   ,'' '') empno,                      '+
             '    NVL(B.korname ,'' '') korname,                    '+
             '    NVL(B.paycl   ,'' '') paycl,                      '+
             '    NVL(D.codename,'' '') payclname,                  '+
             '    NVL(B.examdate,'' '') examdate,                   '+
             '    NVL(TO_CHAR(B.examscore1),''0'')  examscore1,     '+
             '    NVL(TO_CHAR(B.examscore2),''0'')  examscore2,     '+
             '    NVL(TO_CHAR(B.examscore12),''0'') examscore12,    '+
             '    NVL(C.leveli ,'' '') leveli,                      '+
             '    NVL(TO_CHAR(C.examscore ),''0'') examscore        '+
             '  FROM                                                '+
             '    (SELECT empno, jobgun FROM pimpmas) A,            '+
             '    pihfore B, forecode C,pyccode D                   '+
             ' WHERE A.empno  = B.empno                             '+
             '   AND A.jobgun = C.jobgun                            '+
             '   AND D.codeid = ''I112''                            '+
             '   AND B.paycl  = D.codeno                            '+
             '   AND B.paycl BETWEEN C.payclfr AND C.paycltr        '+
             '   AND C.yearyy = ''%s''                              '+
             '   AND B.examscore12  BETWEEN C.toeicfr AND C.toeictr '+
             '   AND B.empno = ''%s''                               '+
             ' ORDER BY B.examdate DESC                             ';
   FG_Sql := Format(FG_Sql,[FL_Date, ED_empno.Text]);
}

  FG_Sql  := 'SELECT                                                '+
             '    NVL(B.empno   ,'' '') empno,                      '+
             '    NVL(B.korname ,'' '') korname,                    '+
             '    NVL(B.paycl   ,'' '') paycl,                      '+
             '    NVL(D.codename,'' '') payclname,                  '+
             '    NVL(B.examdate,'' '') examdate,                   '+
             '    NVL(TO_CHAR(B.examscore1),''0'')  examscore1,     '+
             '    NVL(TO_CHAR(B.examscore2),''0'')  examscore2,     '+
             '    NVL(TO_CHAR(B.examscore12),''0'') examscore12,    '+
             '    NVL('' '' ,'' '') leveli,                         '+
             '    NVL(TO_CHAR(''0'' ),''0'') examscore              '+
             '  FROM pihfore B, pyccode D                           '+
             ' WHERE D.codeid(+) = ''I112''                         '+
             '   AND B.paycl  = D.codeno(+)                         '+
             '   AND B.empno = ''%s''                               '+
             ' ORDER BY B.examdate DESC                             ';
   FG_Sql := Format(FG_Sql,[ ED_empno.Text]);

   with Qry_11 do
     begin
       ServiceName := 'PTA1020B_sel1';
       Close;
       Sql.Clear;
       Sql.Add(FG_Sql);

       ClearFieldInfo;
       AddField('empno'      , ftString,   4 );
       AddField('korname'    , ftString,   12);
       AddField('paycl'      , ftString,   3 );
       AddField('payclname'  , ftString,   20);
       AddField('examdate'   , ftString,   8 );
       AddField('examscore1' , ftInteger,  4 );
       AddField('examscore2' , ftInteger,  4 );
       AddField('examscore12', ftInteger,  4 );
       AddField('leveli'     , ftString,   2 );
       AddField('examscore'  , ftFloat,    5 );
       Open;
       FieldByName('examdate').EditMask := '####/##/##;0;_';
     end;

{
  MD_Data.Open;
  MD_Data.FieldByName('examdate').EditMask := '####/##/##;0;_';
  MD_Data.FieldByName('leveli').Alignment  := taCenter;
  MD_Data.DisableControls;
  while not Qry_11.Eof do
    begin
      MD_Data.Append;
      MD_Data.FieldByName('empno').AsString        := Qry_11.FieldByName('empno').AsString;
      MD_Data.FieldByName('korname').AsString      := Qry_11.FieldByName('korname').AsString;
      MD_Data.FieldByName('paycl').AsString        := Qry_11.FieldByName('paycl').AsString;
      MD_Data.FieldByName('payclname').AsString    := Qry_11.FieldByName('payclname').AsString;
      MD_Data.FieldByName('examdate').AsString     := Qry_11.FieldByName('examdate').AsString;
      MD_Data.FieldByName('examscore1').AsInteger  := Qry_11.FieldByName('examscore1').AsInteger;
      MD_Data.FieldByName('examscore2').AsInteger  := Qry_11.FieldByName('examscore2').AsInteger;
      MD_Data.FieldByName('examscore12').AsInteger := Qry_11.FieldByName('examscore12').AsInteger;
      MD_Data.FieldByName('leveli').AsString       := Qry_11.FieldByName('leveli').AsString;
      MD_Data.FieldByName('examscore').AsInteger   := Qry_11.FieldByName('examscore').AsInteger;

      if Qry_11.FieldByName('leveli').AsString = '1' then
         MD_Data.FieldByName('gubun2').AsString := '유효점수';

      if (Qry_11.FieldByName('leveli').AsString <> '1') and
         (Qry_11.FieldByName('examdate').AsString < IntToStr(StrToInt(FL_Date) - 2) + '0101') then
        begin
          MD_Data.FieldByName('gubun2').AsString     := '무효점수';
          MD_Data.FieldByName('gubun1').AsString     := '';
          MD_Data.FieldByName('examscore').AsInteger := 0;
        end
      else
        MD_Data.FieldByName('gubun2').AsString := '유효점수';

      //검정일 직급과 현재직급이 다르면 무효(shm)
      if FL_payclcode <> Qry_11.FieldByName('paycl').AsString then
        begin
          MD_Data.FieldByName('gubun2').AsString     := '무효점수';
          MD_Data.FieldByName('gubun1').AsString     := '';
          MD_Data.FieldByName('examscore').AsInteger := 0;
        end;

      //검정일이  직급일 이전이면 무효 (shm)     2000.11.16
      if Qry_11.FieldByName('examdate').AsString < ED_empdate.ValueCaption  then
        begin
          MD_Data.FieldByName('gubun2').AsString     := '무효점수';
          MD_Data.FieldByName('gubun1').AsString     := '';
          MD_Data.FieldByName('examscore').AsInteger := 0;
        end;

      //검정일+2년 > 현재일 = 유효  shm
      FL_Date1 := StrToInt(Qry_11.FieldByName('examdate').AsString);
      FL_Date1 := FL_Date1 + 20000;
      if (IntToStr(FL_Date1) > FG_sysdate) then
        MD_Data.FieldByName('gubun1').AsString := '유효점수'
      else
        MD_Data.FieldByName('gubun1').AsString := '무효점수';
      MD_Data.Post;
      Qry_11.Next;
    end;
  MD_Data.First;
  MD_Data.EnableControls;
}
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.ED_empnoInitPopup(Sender: TObject);
begin
  FM_empno.FG_DeptCode := FG_Dept;
  FM_empno.FG_Edit     := TOnWinPopupEdit(Sender);
  FM_empno.PL_DataFind;
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
end;

procedure TFM_Main.ED_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_empno.CD_emp.FieldByName('empno').AsString;
      SB_FindClick(Sender);
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.BitBtn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  SB_FindClick(Sender);
end;

procedure TFM_Main.BT_closeClick(Sender: TObject);
begin
  Close;
end;

end.
