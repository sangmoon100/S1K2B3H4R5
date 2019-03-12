unit PTA30201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnSkinBtn, Grids, DBGrids, OnGrDBGrid,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, ComCtrls,
  OnShapeLabel, OnEditCombo, StdCtrls, OnFocusButton, Db, Tmax_DataSetText,
  Tmax_session, OnInsaCommon, TmaxFunc;
type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    BT_Find: TOnFocusButton;
    BT_close: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TDS1: TTMaxDataSet;
    DS_Grid1: TDataSource;
    TDS_Grid1: TTMaxDataSet;
    TDS_Grid2: TTMaxDataSet;
    DS_Grid2: TDataSource;
    TDS_Grid3: TTMaxDataSet;
    DS_Grid3: TDataSource;
    TDS_Grid4: TTMaxDataSet;
    DS_Grid4: TDataSource;
    OnShapeLabel1: TOnShapeLabel;
    ED_empno: TTMaxPersonPopupEdit;
    L_pstate: TOnShapeLabel;
    L_cyear: TOnShapeLabel;
    L_orgempdate: TOnShapeLabel;
    L_deptname: TOnShapeLabel;
    L_paycl: TOnShapeLabel;
    L_cpaycldate: TOnShapeLabel;
    L_point: TOnShapeLabel;
    L_cpayradate: TOnShapeLabel;
    L_payra: TOnShapeLabel;
    L_ceduscore: TOnShapeLabel;
    L_avgpoint: TOnShapeLabel;
    Q_com: TTMaxDataSet;
    TDS_Grid5: TTMaxDataSet;
    DS_Grid5: TDataSource;
    TDS_Grid6: TTMaxDataSet;
    DS_Grid6: TDataSource;
    Notebook1: TNotebook;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Grid1: TOnGrDbGrid;
    OnGrDbGrid1: TOnGrDbGrid;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    Grid3: TOnGrDbGrid;
    RB_type2: TRadioButton;
    RB_date2: TRadioButton;
    OnShapeLabel9: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    Grid4: TOnGrDbGrid;
    RB_type3: TRadioButton;
    RB_date3: TRadioButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SB_3: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_1: TOnSkinButton;
    Label4: TLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure DS_Grid1DataChange(Sender: TObject; Field: TField);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure Grid5ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    GSempno     : String[4];     //Login사번
    GSkorname   : String[12];    //Login성명
    GSPassword  : String[10];
    GSgrade     : String[10];    //등급
    GSysdate    : string;
    Payrachdate : string;
    procedure PL_Com_Contructor;
  end;

var
  MainForm: TMainForm;

implementation

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


  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSPassword:= Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  with Q_com do
  begin
    PL_Com_Contructor;
    Sql.Text := ' select To_Char(sysdate,''YYYYMMDD'') field1,'''','''','''','''' from dual';
    Open;
    Gsysdate  := Q_com.FieldByName('field1').AsString;
  end;

  with Q_com do
  begin
    PL_Com_Contructor;
    Sql.Text := ' select Value3 field1, Value4 field2 ,'''','''','''' from pimvari '+#13 +
                '  where  gubun = ''00'' and sgubun = ''0001''            ';
    Open;
    Payrachdate  := Q_com.FieldByName('field1').AsString;
  end;

  ED_empno.Text := GSempno;
  ED_empno.PL_get_singledata;

  if (GSgrade[5] > 'C') or (GSgrade[9] > 'C') then
  begin
    ED_empno.ButtonWidth := 0;
    ED_empno.Enabled     := False;
  end
  else
  begin
    ED_empno.ButtonWidth := 24;
    ED_empno.Enabled     := True;
  end;
  SB_1Click(SB_1);
  SendMessage(SB_help.handle,WM_PAINT,0,0);
end;

procedure TMainForm.PL_Com_Contructor;
begin
  with Q_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
    end;
end;

procedure TMainForm.BT_FindClick(Sender: TObject);
var
     cpaycldate, cpayradate, paycldate : String;
     point : real;
begin
  if Trim(ED_empno.Text) = '' then
  begin
   MessageDlg('조회할 사원을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
   exit;
  end;

  L_deptname.ValueCaption   := ED_empno.deptname ;
  L_paycl.ValueCaption      := ED_empno.payclname;
  L_payra.ValueCaption      := ED_empno.payraname;
  L_orgempdate.ValueCaption := Copy(ED_empno.orgempdate,1,4)+'-'+Copy(ED_empno.orgempdate,5,2)+'-'+Copy(ED_empno.orgempdate,7,2);


  with TDS_Grid1 do
  begin
    ServiceName := 'HINSA_select20';
    Close;
    Sql.Text := Format(' SELECT A1.BASE_YY, A1.EMPNO,                                                                                                    '+
                      '        B1.TOT0_SCORE, B1.TOT1_SCORE, B1.TOT2_SCORE,                                                                              '+
                      '        B1.REQ1_SCORE, B1.REQ2_SCORE, B1.REQ3_SCORE,                                                                              '+
                      '        B1.REQ4_SCORE, B1.REQ5_SCORE, B1.REQ6_SCORE,  B1.REQ7_SCORE,                                                              '+
                      '        TO_CHAR(NVL(A1.TOT_SCORE,0), ''990.9'') TOT,                                                                              '+
                      '        ''F14'', ''F15'', ''F16'', ''F17'', ''F18'', ''F19'', ''F20''                                                             '+
                      ' FROM PEDU2HIS A1,                                                                                                                '+
                      '      (SELECT A.BASE_YY, A.EMPNO, SUM(DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0)) TOT0_SCORE,                                        '+
                      '                            SUM(DECODE(B.REQ_YN, ''Y'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) TOT1_SCORE,                  '+
                      '                            SUM(DECODE(B.REQ_YN, ''N'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) TOT2_SCORE,                  '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''공통직무교육'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ1_SCORE, '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''직무전문교육'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ2_SCORE, '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''그룹교육'',     DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ3_SCORE, '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''직급공통교육'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ4_SCORE, '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''직급전문교육'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ5_SCORE, '+                	        
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''핵심인재교육'', DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ6_SCORE, '+
                      '                            SUM(DECODE(B.EDU_GROUP_CD, ''팀장교육'',     DECODE(EDU_PASS_YN, ''Y'', EDU_TIME, 0), 0)) REQ7_SCORE  '+
                      '       FROM PEDU2ITEM A, PEDU2TYPE B                                                                                              '+
                      '       WHERE A.EDU_TYPE = B.EDU_TYPE                                                                                              '+
                      '         AND A.EMPNO    = ''%s''                                                                                                  '+
                      '       GROUP BY A.BASE_YY,EMPNO) B1                                                                                               '+
                      ' WHERE A1.BASE_YY = B1.BASE_YY                                                                                                    '+
                      '   AND A1.EMPNO   = B1.EMPNO                                                                                                      '+
                      '   AND A1.EMPNO  = ''%s''                                                                                                         '+
                      ' ORDER BY A1.BASE_YY DESC ', [ED_empno.empno, ED_empno.empno]);

    ClearFieldInfo;
    AddField('BASE_YY'    ,ftString, 100);
    AddField('EMPNO'      ,ftString, 100);
    AddField('TOT0_SCORE' ,ftFloat,  100);
    AddField('TOT1_SCORE' ,ftFloat,  100);
    AddField('TOT2_SCORE' ,ftFloat,  100);
    AddField('REQ1_SCORE' ,ftFloat,  100);
    AddField('REQ2_SCORE' ,ftFloat,  100);
    AddField('REQ3_SCORE' ,ftFloat,  100);
    AddField('REQ4_SCORE' ,ftFloat,  100);
    AddField('REQ5_SCORE' ,ftFloat,  100);
    AddField('REQ6_SCORE' ,ftFloat,  100);
    AddField('REQ7_SCORE' ,ftFloat,  100);
    AddField('TOT'        ,ftFloat,  100);
    AddField('F14'        ,ftString, 100);
    AddField('F15'        ,ftString, 100);
    AddField('F16'        ,ftString, 100);
    AddField('F17'        ,ftString, 100);
    AddField('F18'        ,ftString, 100);
    AddField('F19'        ,ftString, 100);
    AddField('F20'        ,ftString, 100);
    Open;

    DS_Grid1.OnDataChange := nil;
    DS_Grid1.OnDataChange := DS_Grid1DataChange;
  end;

  //  Notebook1.ActivePage = 'P_2'  //필수교육
  with TDS_Grid3 do
  begin
    ServiceName := 'PTA3020B_sel2';
    Close;
    Sql.Text := Format('select base_yy,                                '+
                   '       empno,                                      '+
                   '       a.edu_type,                                 '+
                   '       b.edu_name,                                 '+
                   '       edu_title,                                  '+
                   '       edu_date_from,                              '+
                   '       edu_date_to,                                '+
                   '       edu_time,                                   '+
                   '       score,                                      '+
                   '       edu_pass_yn,                                '+
                   '       nvl(edu_score,0)                            '+
                   '  from pedu2item a, pedu2type b                    '+
                   ' where a.edu_type = b.edu_type                     '+
                   '   and b.req_yn   = ''Y''                          '+
                   '   and a.empno    = ''%s''                         ', [ED_empno.empno]);

    if RB_type2.Checked then Sql.Text := Sql.Text + 'order by a.edu_type, edu_date_from '
    else                     Sql.Text := Sql.Text + 'order by edu_date_from, a.edu_type ';

    Edit3.Text := SQl.Text;

    ClearFieldInfo;
    AddField('BASE_YY'      , ftString,  4);
    AddField('EMPNO'        , ftString,  4);
    AddField('EDU_TYPE'     , ftString,  4);
    AddField('EDU_NAME'     , ftString,  30);
    AddField('EDU_TITLE'    , ftString,  80);
    AddField('EDU_DATE_FROM', ftString,  8);
    AddField('EDU_DATE_TO'  , ftString,  8);
    AddField('EDU_TIME'     , ftFloat,   5);
    AddField('SCORE'        , ftInteger, 3);
    AddField('EDU_PASS_YN'  , ftString,  1);
    AddField('EDU_SCORE'    , ftFloat,   5);
    Open;

    FieldByName('BASE_YY').Alignment     := taCenter;
    FieldByName('EDU_PASS_YN').Alignment := taCenter;
    FieldByName('EDU_DATE_FROM').EditMask := '!9999/99/00;0;_';
    FieldByName('EDU_DATE_TO').EditMask   := '!9999/99/00;0;_';
  end;

  //  Notebook1.ActivePage = 'P_3'   //선택교육
  with TDS_Grid4 do
  begin
    ServiceName := 'PTA3020B_sel2';
    Close;
    Sql.Text := Format('select base_yy,                   '+
                       '       empno,                     '+
                       '       a.edu_type,                '+
                       '       b.edu_name,                '+
                       '       edu_title,                 '+
                       '       edu_date_from,             '+
                       '       edu_date_to,               '+
                       '       edu_time,                  '+
                       '       score,                     '+
                       '       edu_pass_yn,               '+
                       '       nvl(edu_score,0)           '+
                       '  from pedu2item a, pedu2type b   '+
                       ' where a.edu_type = b.edu_type    '+
                       '   and b.req_yn   = ''N''         '+
                       '   and a.empno    = ''%s''        ', [ED_empno.empno]);

    if RB_type3.Checked then Sql.Text := Sql.Text + 'order by a.edu_type, edu_date_from '
    else                     Sql.Text := Sql.Text + 'order by edu_date_from, a.edu_type ';

    Edit4.Text := SQl.Text;

    ClearFieldInfo;
    AddField('BASE_YY'      , ftString,  4);
    AddField('EMPNO'        , ftString,  4);
    AddField('EDU_TYPE'     , ftString,  4);
    AddField('EDU_NAME'     , ftString,  30);
    AddField('EDU_TITLE'    , ftString,  80);
    AddField('EDU_DATE_FROM', ftString,  8);
    AddField('EDU_DATE_TO'  , ftString,  8);
    AddField('EDU_TIME'     , ftFloat,   5);
    AddField('SCORE'        , ftInteger, 3);
    AddField('EDU_PASS_YN'  , ftString,  1);
    AddField('EDU_SCORE'    , ftFloat,   5);
    Open;

    FieldByName('BASE_YY'      ).Alignment := taCenter;
    FieldByName('EDU_PASS_YN'  ).Alignment := taCenter;
    FieldByName('EDU_DATE_FROM').EditMask  := '!9999/99/00;0;_';
    FieldByName('EDU_DATE_TO'  ).EditMask  := '!9999/99/00;0;_';
  end;

end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
     SB_1.BtnDown  := False;
     SB_2.BtnDown  := False;
     SB_3.BtnDown  := False;

     TOnSkinButton(Sender).BtnDown := True;
     NoteBook1.ActivePage := 'P_' + IntToStr(TOnSkinButton(Sender).Tag);
end;

procedure TMainForm.DS_Grid1DataChange(Sender: TObject; Field: TField);
begin
     with TDS_Grid2 do
     begin
          ServiceName := 'HINSA_select20';
          Close;
          Sql.Text := Format('select base_yy,                   '+
                             '       empno,                     '+
                             '       a.edu_type,                '+
                             '       b.edu_name,                '+
                             '       edu_title,                 '+
                             '	     (SELECT HNAME FROM PEIDPCODE WHERE CLASSNO = CASE WHEN base_yy >= ''2014'' THEN ''5'' ELSE ''4'' END '+
                             '         AND CODENO = SUBSTR(A.EDUCODE, 6,2) and base_yy = a.base_yy) CN_LEVEL, '+
                             '       edu_date_from,             '+
                             '       edu_date_to,               '+
                             '       edu_time,                  '+
                             '       score,                     '+
                             '       edu_pass_yn,               '+
                             '       ''F12'', ''F13'', ''F14'', ''F15'', ''F16'', ''F17'', ''F18'', ''F19'', ''F20'' '+
                             '  from pedu2item a, pedu2type b   '+
                             ' where a.edu_type = b.edu_type    '+
                             '   and a.base_yy  = ''%s''        '+
                             '   and a.empno    = ''%s''        '+
                             ' order by a.edu_type, edu_date_from ', [TDS_Grid1.FieldByName('base_yy').AsString, ED_empno.empno]);

          ClearFieldInfo;
          AddField('BASE_YY'      , ftString, 100);
          AddField('EMPNO'        , ftString, 100);
          AddField('EDU_TYPE'     , ftString, 100);
          AddField('EDU_NAME'     , ftString, 100);
          AddField('EDU_TITLE'    , ftString, 100);
          AddField('CN_LEVEL'     , ftString, 100);
          AddField('EDU_DATE_FROM', ftString, 100);
          AddField('EDU_DATE_TO'  , ftString, 100);
          AddField('EDU_TIME'     , ftFloat,  100);
          AddField('SCORE'        , ftInteger,100);
          AddField('EDU_PASS_YN'  , ftString, 100);
          AddField('F12'          , ftString, 100);
          AddField('F13'          , ftString, 100);
          AddField('F14'          , ftString, 100);
          AddField('F15'          , ftString, 100);
          AddField('F16'          , ftString, 100);
          AddField('F17'          , ftString, 100);
          AddField('F18'          , ftString, 100);
          AddField('F19'          , ftString, 100);
          AddField('F20'          , ftString, 100);
          Open;

          FieldByName('BASE_YY'      ).Alignment := taCenter;
          FieldByName('EDU_PASS_YN'  ).Alignment := taCenter;
          FieldByName('CN_LEVEL'     ).Alignment := taCenter;
          FieldByName('EDU_DATE_FROM').EditMask  := '!9999/99/00;0;_';
          FieldByName('EDU_DATE_TO'  ).EditMask  := '!9999/99/00;0;_';
     end;
end;

procedure TMainForm.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then ED_empno.PL_get_singledata;
end;

procedure TMainForm.ED_empnoReadEnded(Sender: TObject);
begin
     BT_FindClick(Sender);
end;

procedure TMainForm.Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
  var
  i : integer;
begin
     if (Field.FieldName = 'REQ') or (Field.FieldName = 'REQ1_SCORE') or (Field.FieldName = 'REQ2_SCORE') or
        (Field.FieldName = 'REQ3_SCORE') or (Field.FieldName = 'REQ4_SCORE') then Canvas.Brush.Color := $00FEB4E8;

     if (Field.FieldName = 'OPT') or (Field.FieldName = 'OPT1_SCORE') or (Field.FieldName = 'OPT2_SCORE') or
        (Field.FieldName = 'OPT3_SCORE') then Canvas.Brush.Color := $008EC7FF;

     if Grid1.fields[0].AsString = '2005' then
       canvas.Font.Color := clGray ;
end;

procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  BT_FindClick(Sender);
//  if PageControl1.ActivePage.PageIndex = 0 then SB_1Click(Sender)
//  Else BT_FindClick(Sender);
end;

procedure TMainForm.Grid5ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (Field.FieldName = 'REQ') or (Field.FieldName = 'REQ1_SCORE') or (Field.FieldName = 'REQ2_SCORE') or
    (Field.FieldName = 'REQ3_SCORE') or (Field.FieldName = 'REQ4_SCORE') then Canvas.Brush.Color := $00FEB4E8;

  if (Field.FieldName = 'OPT') or (Field.FieldName = 'OPT1_SCORE') or (Field.FieldName = 'OPT2_SCORE') or
    (Field.FieldName = 'OPT3_SCORE') then Canvas.Brush.Color := $008EC7FF;
end;

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := cafree;
end;

end.
