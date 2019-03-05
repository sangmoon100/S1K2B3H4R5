unit pea1060a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, StdCtrls, Mask, pebtnedit, Grids,
  DBGrids, pedbgrid, Db, DBTables, pegraphic, DBClient, MIDAScon,
  jeonPan, Tmax_DataSetText;

type
  TFm_DestValue = class(TForm)
    Panel1      : TPanel;
    Pa_Name     : TPeJeonGrdPanel;
    DataSource1 : TDataSource;
    Grid1       : TPeJeonDbGrid;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Sb_Ok: TPeJeonOutLookBtn;
    Sb_Close: TPeJeonOutLookBtn;
    Query1: TTMaxDataSet;
    db_qeury1: TTMaxDataSet;
    Ed_empno1: TPePanelBtnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure Bt_e12Click(Sender: TObject);
    procedure Ed_empno1RightBtnClick(Sender: TObject);
    procedure Ed_empno1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FStart        : Boolean;
    FYear         : string;
    Fempno        : string;
//    Fe12          : Boolean;
    SqlText       : string;

    FRemoteServer : TRemoteServer;

    procedure SqlOpen;
    procedure SqlOpen_new;
    procedure Select_Data(Sender: TObject);
  public
    //  Tuxedo Component BeforeCall Event 처리변수
    Query1_Pmax : String;
    Query1_Prfd : String;
    Query1_Psfd : array of String;

    FCloseYn : Boolean;

    property rabasdate    : string        read FYear         write FYear;
    property empno        : string        read Fempno        write Fempno;
   // property empno        : string        read Fempno        write Fempno;
    property RemoteServer : TRemoteServer read FRemoteServer write FRemoteServer;
  end;

  TPeDestValuer = class(TComponent)
  private
    FYear         : string;
    Fempno        : string;
    FRemoteServer : TRemoteServer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;

    function Execute : Boolean;
  published
    property rabasdate    : string        read FYear         write FYear;
    property empno        : string        read Fempno        write Fempno;
    property RemoteServer : TRemoteServer read FRemoteServer write FRemoteServer;
  end;

implementation

uses Hinsa_TmaxDM, PeMainForm;

{$R *.DFM}

procedure TFm_DestValue.FormCreate(Sender: TObject);
begin
  FStart        := True;
  FRemoteServer := nil;
  FCloseYn      := False;
end;

procedure TFm_DestValue.FormShow(Sender: TObject);
var sqltext : string;
begin
  if FStart then     //Lrabasdate pEmpno
    begin
      FStart := not FStart;


//      Bt_e12Click(Bt_e12);       //30.41
      //공동대상자관리테이블에 자료가 업으면 종전 sql을 실행하고
      //공동대상자관리테이블에 팀장이 존재하면 신규sql을 실행한다.

      sqltext := ' select count(0) from pehreaim_combas '+
                 ' where rabasdate = ''' + rabasdate + '''  '+
                 ' and empno = ''' + Empno + ''' ';

     // showmessage(sqltext);

      with db_qeury1 do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;

         if recordcount > 0 then
         begin
            if FieldByName('SEL_DATA').AsString = '0' then
            begin
               //showmessage('변경전');
               SqlOpen;
            end
            else
            begin
               //showmessage('변경후');
               SqlOpen_new;
            end;
         end;

      end;

      //SqlOpen;
    end;
end;

procedure TFm_DestValue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

procedure TFm_DestValue.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
     begin
       Releasecapture;
       Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_DestValue.Sb_CloseClick(Sender: TObject);
begin
  FCloseYn := True;
  Close;
end;

procedure TFm_DestValue.Sb_OkClick(Sender: TObject);
begin
  Fempno   := Query1.FieldByName('empno').AsString;
  FCloseYn := False;
  Close;
end;

procedure TFm_DestValue.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
begin

//  if Fe12 then    // 접속자가 1, 2차 평가자인경우
  if MainForm.EvalYN then
      SqlText :=
    'SELECT  '+
    ' nvl(        empno      ,'' ''), '+
    ' nvl(        korname    ,'' ''), '+
    ' nvl(        jobgun     ,'' ''), '+
    ' nvl(        paycl      ,'' ''), '+
    ' nvl(        deptcode   ,'' ''), '+
    ' nvl(        codename   ,'' ''), '+
    ' nvl(        deptname   ,'' ''), '+
    ' nvl(        prog       ,'' ''), '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
    ' nvl(        ebryn      ,'' '')  '+
//====================================================================================//
    ' FROM ( '+
                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
                        '       d.codename,e.deptname,                                  '+
    {===============================================================================
       Version    date(yy.mm.dd)     programmer      relevant doc.no  description
       30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
    ===============================================================================}
    //                    '       decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',         '+
    //                    '         decode(c.e2prjconyn, ''Y'', ''목표설정완료'', '+
    //                    '           decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
    //                    '             decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
    //                    '               decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))) prog  '
                        '       decode(f.value5,''2차'',                             '+
                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog, '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '       decode(g.ebryn,      ''Y'', ''참고인'', '''' ) ebryn '+
//====================================================================================//
                 Format('  FROM '+
                        '    pehremas a, '+
                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
                        '    ) b,                                                                 '+
                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
                        '    ) c,                                                                 '+
                        '    pyccode d, pycdept e,       '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '    (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+
                        '     from   pehremas                                                     '+
                        '     where  rabasdate = ''%s''                                           '+
                        '       AND reconyn    = ''Y''                                            '+
                        '       AND ebrexistyn = ''Y''                                            '+
                        '       AND ebrempno = ''%s''                                             '+
                        '     GROUP BY empno, ebrempno ) g,                                       '+
//====================================================================================//
                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
                        ' WHERE a.empno     = b.empno    '+
                        '   AND a.empno     = c.empno(+) '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '   AND a.empno     = g.empno(+) '+
//====================================================================================//
                        '   AND a.rabasdate = ''%s''     '+
                        '   AND a.reconyn= ''Y''         '+
                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
    {===============================================================================
       Version    date(yy.mm.dd)     programmer      relevant doc.no  description
       30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
    ===============================================================================}
    //                    '   AND (a.empno = ''%s'' OR b.e1empno = ''%s'' OR c.e2empno = ''%s'') '+
                        '   AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '        OR g.ebrempno = ''%s''                                         '+
//====================================================================================//
                        '        OR (f.value5 = ''2차'' AND c.e2empno = ''%s''))                '+
                        '      ) '+
                        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
//====================================================================================//
//   30.41      2001.07.24         손종운 수정             자기계발목표 추가
//====================================================================================//
//                 [ Fyear,Fyear,Fyear,Fyear,Fempno,Fempno,Fempno ]);
                 [ MainForm.GetBaseYear(1),Fyear,Fyear,Fempno,Fyear,MainForm.GetBaseYear(1),Fempno,Fempno,Fempno,Fempno ])
//                 [ Fyear,Fyear,Fyear,Fempno,Fyear,Fyear,Fempno,Fempno,Fempno,Fempno ])
//  else  // 접속자가 지점장인 경우
//      SqlText :=
//    'SELECT  '+
//    ' nvl(        empno      ,'' ''), '+
//    ' nvl(        korname    ,'' ''), '+
//    ' nvl(        jobgun     ,'' ''), '+
//    ' nvl(        paycl      ,'' ''), '+
//    ' nvl(        deptcode   ,'' ''), '+
//    ' nvl(        codename   ,'' ''), '+
//    ' nvl(        deptname   ,'' ''), '+
//    ' nvl(        prog       ,'' '')  '+
//    ' FROM ( '+
//                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
//                        '       d.codename,e.deptname,                                  '+
//                        '       decode(f.value5,''2차'',                             '+
//                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
//                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
//                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
//                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
//                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
//                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
//                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
//                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog '+
//                 Format('  FROM '+
//                        '    pehremas a, '+
//                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
//                        '       FROM pehremas                                                     '+
//                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
//                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
//                        '    ) b,                                                                 '+
//                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
//                        '       FROM pehremas                                                     '+
//                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
//                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
//                        '    ) c,                                                                 '+
//                        '    pyccode d, pycdept e,       '+
//                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
//                        ' WHERE a.empno     = b.empno    '+
//                        '   AND a.empno     = c.empno(+) '+
//                        '   AND a.rabasdate = ''%s''     '+
//                        '   AND a.reconyn= ''Y''         '+
//                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
//                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
//                        '   AND a.ebrempno = ''%s'' '+
//                        '      ) '+
//                        ' ORDER BY  deptcode, paycl, empno ',
//                 [ Fyear, Fyear, Fyear, Fyear, Fempno ]);
//
  else if not MainForm.EvalYN then
      SqlText :=
    'SELECT  '+
    ' nvl(        empno      ,'' ''), '+
    ' nvl(        korname    ,'' ''), '+
    ' nvl(        jobgun     ,'' ''), '+
    ' nvl(        paycl      ,'' ''), '+
    ' nvl(        deptcode   ,'' ''), '+
    ' nvl(        codename   ,'' ''), '+
    ' nvl(        deptname   ,'' ''), '+
    ' nvl(        prog       ,'' ''), '+
    ' nvl(        ebryn      ,'' '')  '+
    ' FROM ( '+
                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
                        '       d.codename,e.deptname,                                  '+
                        '       decode(f.value5,''2차'',                             '+
                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog, '+
                        '       decode(g.ebryn,      ''Y'', ''참고인'', '''' ) ebryn '+
                 Format('  FROM '+
                        '    pehremas a, '+
                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
                        '    ) b,                                                                 '+
                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
                        '    ) c,                                                                 '+
                        '    pyccode d, pycdept e,       '+
                        '    (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+
                        '     from   pehremas                                                     '+
                        '     where  rabasdate = ''%s''                                           '+
                        '       AND reconyn    = ''Y''                                            '+
                        '       AND ebrexistyn = ''Y''                                            '+
                        '       AND ebrempno = ''%s''                                             '+
                        '     GROUP BY empno, ebrempno ) g,                                       '+
                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
                        ' WHERE a.empno     = b.empno    '+
                        '   AND a.empno     = c.empno(+) '+
                        '   AND a.empno     = g.empno(+) '+
                        '   AND a.rabasdate = ''%s''     '+
                        '   AND a.reconyn= ''Y''         '+
                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
//JSH임의로 막음        '   AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+
                //        '        OR g.ebrempno = ''%s''                                         '+
                //        '        OR (f.value5 = ''2차'' AND c.e2empno = ''%s''))                '+
                        '   AND ((a.empno LIKE ''%s'' || ''%s'') OR ( a.korname LIKE ''%s''|| ''%s'')) '+   //손D요청으로 임의로 만들어줌.20051121JSH
                        '      ) '+
                        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
                 [ MainForm.GetBaseYear(1),Fyear,Fyear,MainForm.Le1empno,Fyear,MainForm.GetBaseYear(1),
//                 [ Fyear,Fyear,Fyear,MainForm.Le1empno,Fyear,Fyear,
                   //MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno , //위의 주석처리로 인해 강제로 막음. 나중에 열어줄것.20051121JSH
                   Trim(Ed_empno1.Text),'%',Trim(Ed_empno1.Text),'%'
                    ]) ;



//Edit1.Text :=  SqlText; //JSH
//Exit;

  with Query1 do
  begin
    Close;
    ServiceName := 'PEA1060A_sel1';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('empno'   , ftString, 4 );
    AddField('korname' , ftString, 12);
    AddField('jobgun'  , ftString, 2 );
    AddField('paycl'   , ftString, 3 );
    AddField('deptcode', ftString, 6 );
    AddField('codename', ftString, 20);
    AddField('deptname', ftString, 60);
    AddField('prog'    , ftString, 16);
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
    AddField('ebryn'   , ftString,  6);
//====================================================================================//
    SQL.Text := Sqltext;
    Open;
  end;

  if Query1.Eof then
  begin
    MessageDlg('목표등록/결재 대상자가 아닙니다1.'+#13+#10+''+#13+#10+'프로그램은 자동종료됩니다.', mtWarning, [mbOK], 0);
    Application.Terminate;
  end;

  for i := 0 to Query1.FieldCount - 1 do
    begin
      Field := Query1.Fields[i];
      Field.Visible := False;
      case Field.Index of
        0 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := '사 번';
            end;
        1 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 12;
              Field.DisplayLabel := '성 명';
            end;
        5 : begin
              Field.Visible      := false;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := 'BAND';
            end;
        6 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 48;         //+8
              Field.DisplayLabel := '부 서 명';
            end;
        7 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 30;
              Field.DisplayLabel := '진행상황';
            end;
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
        8 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 10;
              Field.DisplayLabel := '비  고';
            end;
//====================================================================================//
      end;
    end;
  Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,108) + 40;
  Grid1.SetFocus;
end;

procedure TFm_DestValue.SqlOpen_new;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
begin
//  if Fe12 then    // 접속자가 1, 2차 평가자인경우
  if MainForm.EvalYN then
      SqlText :=
    'SELECT  '+
    ' nvl(        empno      ,'' ''), '+
    ' nvl(        korname    ,'' ''), '+
    ' nvl(        jobgun     ,'' ''), '+
    ' nvl(        paycl      ,'' ''), '+
    ' nvl(        deptcode   ,'' ''), '+
    ' nvl(        codename   ,'' ''), '+
    ' nvl(        deptname   ,'' ''), '+
    ' nvl(        prog       ,'' ''), '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
    ' nvl(        ebryn      ,'' '')  '+
//====================================================================================//
    ' FROM ( '+
                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
                        '       d.codename,e.deptname,                                  '+
    {===============================================================================
       Version    date(yy.mm.dd)     programmer      relevant doc.no  description
       30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
    ===============================================================================}
    //                    '       decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',         '+
    //                    '         decode(c.e2prjconyn, ''Y'', ''목표설정완료'', '+
    //                    '           decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
    //                    '             decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
    //                    '               decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))) prog  '
                        '       decode(f.value5,''2차'',                             '+
                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog, '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '       decode(g.ebryn,      ''Y'', ''참고인'', '''' ) ebryn '+
//====================================================================================//
                 Format('  FROM '+
                       // '    pehremas a, '+
                        '    pehremas a, pehreaim_combas h , '+
                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
                        '    ) b,                                                                 '+
                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
                        '    ) c,                                                                 '+
                        '    pyccode d, pycdept e,       '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '    (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+
                        '     from   pehremas                                                     '+
                        '     where  rabasdate = ''%s''                                           '+
                        '       AND reconyn    = ''Y''                                            '+
                        '       AND ebrexistyn = ''Y''                                            '+
                        '       AND ebrempno = ''%s''                                             '+
                        '     GROUP BY empno, ebrempno ) g,                                       '+
//====================================================================================//
                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
                        ' WHERE a.empno     = b.empno    '+
                        '   AND a.empno     = h.empno    '+
                        '   AND a.rabasdate = h.rabasdate '+
                        '   AND substr(a.deptcode,1,3) = substr(h.deptcode,1,3) '+
                        '   AND nvl(h.unionyn,''N'') = ''N'' '+
                        '   AND a.empno     = c.empno(+) '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '   AND a.empno     = g.empno(+) '+
//====================================================================================//
                        '   AND a.rabasdate = ''%s''     '+
                        '   AND a.reconyn= ''Y''         '+
                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
    {===============================================================================
       Version    date(yy.mm.dd)     programmer      relevant doc.no  description
       30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
    ===============================================================================}
    //                    '   AND (a.empno = ''%s'' OR b.e1empno = ''%s'' OR c.e2empno = ''%s'') '+
                        '   AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
                        '        OR g.ebrempno = ''%s''                                         '+
//====================================================================================//
                        '        OR (f.value5 = ''2차'' AND c.e2empno = ''%s''))                '+
                        '      ) '+
                        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
//====================================================================================//
//   30.41      2001.07.24         손종운 수정             자기계발목표 추가
//====================================================================================//
//                 [ Fyear,Fyear,Fyear,Fyear,Fempno,Fempno,Fempno ]);
                 [ MainForm.GetBaseYear(1),Fyear,Fyear,Fempno,MainForm.GetBaseYear(1),Fyear,Fempno,Fempno,Fempno,Fempno ])
//                 [ Fyear,Fyear,Fyear,Fempno,Fyear,Fyear,Fempno,Fempno,Fempno,Fempno ])
//  else  // 접속자가 지점장인 경우
//      SqlText :=
//    'SELECT  '+
//    ' nvl(        empno      ,'' ''), '+
//    ' nvl(        korname    ,'' ''), '+
//    ' nvl(        jobgun     ,'' ''), '+
//    ' nvl(        paycl      ,'' ''), '+
//    ' nvl(        deptcode   ,'' ''), '+
//    ' nvl(        codename   ,'' ''), '+
//    ' nvl(        deptname   ,'' ''), '+
//    ' nvl(        prog       ,'' '')  '+
//    ' FROM ( '+
//                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
//                        '       d.codename,e.deptname,                                  '+
//                        '       decode(f.value5,''2차'',                             '+
//                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
//                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
//                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
//                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
//                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
//                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
//                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
//                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog '+
//                 Format('  FROM '+
//                        '    pehremas a, '+
//                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
//                        '       FROM pehremas                                                     '+
//                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
//                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
//                        '    ) b,                                                                 '+
//                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
//                        '       FROM pehremas                                                     '+
//                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
//                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
//                        '    ) c,                                                                 '+
//                        '    pyccode d, pycdept e,       '+
//                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
//                        ' WHERE a.empno     = b.empno    '+
//                        '   AND a.empno     = c.empno(+) '+
//                        '   AND a.rabasdate = ''%s''     '+
//                        '   AND a.reconyn= ''Y''         '+
//                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
//                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
//                        '   AND a.ebrempno = ''%s'' '+
//                        '      ) '+
//                        ' ORDER BY  deptcode, paycl, empno ',
//                 [ Fyear, Fyear, Fyear, Fyear, Fempno ]);
//
  else if not MainForm.EvalYN then
      SqlText :=
    'SELECT  '+
    ' nvl(        empno      ,'' ''), '+
    ' nvl(        korname    ,'' ''), '+
    ' nvl(        jobgun     ,'' ''), '+
    ' nvl(        paycl      ,'' ''), '+
    ' nvl(        deptcode   ,'' ''), '+
    ' nvl(        codename   ,'' ''), '+
    ' nvl(        deptname   ,'' ''), '+
    ' nvl(        prog       ,'' ''), '+
    ' nvl(        ebryn      ,'' '')  '+
    ' FROM ( '+
                        'SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,          '+
                        '       d.codename,e.deptname,                                  '+
                        '       decode(f.value5,''2차'',                             '+
                        '         decode(c.e2prjobjyn, ''Y'', ''2차평가자 반려'',    '+
                        '           decode(c.e2prjconyn, ''Y'', ''목표설정완료'',    '+
                        '             decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'','+
                        '               decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''목표설정완료'',''2차평가자 확인중''),'+
                        '                 decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))))), '+
                        '         decode(b.e1prjobjyn, ''Y'', ''1차평가자 반려'',         '+
                        '           decode(b.e1prjconyn, ''Y'', ''목표설정완료'',         '+
                        '             decode(a.rprjconyn,  ''Y'', ''1차평가자 확인중'',''목표설정중''))) ) prog, '+
                        '       decode(g.ebryn,      ''Y'', ''참고인'', '''' ) ebryn '+
                 Format('  FROM '+
                        //'    pehremas a, '+
                        '    pehremas a, pehreaim_combas h , '+
                        '    (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+
                        '      GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+
                        '    ) b,                                                                 '+
                        '    (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+
                        '       FROM pehremas                                                     '+
                        '      WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+
                        '      GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+
                        '    ) c,                                                                 '+
                        '    pyccode d, pycdept e,       '+
                        '    (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+
                        '     from   pehremas                                                     '+
                        '     where  rabasdate = ''%s''                                           '+
                        '       AND reconyn    = ''Y''                                            '+
                        '       AND ebrexistyn = ''Y''                                            '+
                        '       AND ebrempno = ''%s''                                             '+
                        '     GROUP BY empno, ebrempno ) g,                                       '+
                        '    (select decode(value5,'''',''2차'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+
                        ' WHERE a.empno     = b.empno    '+
                        '   AND a.empno     = h.empno    '+
                        '   AND a.rabasdate = h.rabasdate '+
                        '   AND substr(a.deptcode,1,3) = substr(h.deptcode,1,3) '+
                        '   AND nvl(h.unionyn,''N'') = ''N'' '+
                        '   AND a.empno     = c.empno(+) '+
                        '   AND a.empno     = g.empno(+) '+
                        '   AND a.rabasdate = ''%s''     '+
                        '   AND a.reconyn= ''Y''         '+
                        '   AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+
                        '   AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+
                        '   AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+
                        '        OR g.ebrempno = ''%s''                                         '+
                        '        OR (f.value5 = ''2차'' AND c.e2empno = ''%s''))                '+
                        '      ) '+
                        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
                 [ MainForm.GetBaseYear(1),Fyear,Fyear,MainForm.Le1empno,MainForm.GetBaseYear(1),Fyear,MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno ]) ;
//                 [ Fyear,Fyear,Fyear,MainForm.Le1empno,Fyear,Fyear,MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno,MainForm.Le1empno ]) ;


  with Query1 do
  begin
    Close;
    ServiceName := 'PEA1060A_sel1';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('empno'   , ftString, 4 );
    AddField('korname' , ftString, 12);
    AddField('jobgun'  , ftString, 2 );
    AddField('paycl'   , ftString, 3 );
    AddField('deptcode', ftString, 6 );
    AddField('codename', ftString, 20);
    AddField('deptname', ftString, 60);
    AddField('prog'    , ftString, 16);
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
    AddField('ebryn'   , ftString,  6);
//====================================================================================//
    SQL.Text := Sqltext;

    Open;
  end;

  if Query1.Eof then
  begin
    MessageDlg('목표등록/결재 대상자가 아닙니다2.'+#13+#10+''+#13+#10+'프로그램은 자동종료됩니다.', mtWarning, [mbOK], 0);
//   Application.Destroy;
   Application.Terminate;
//    System.Exit;
  end;

  for i := 0 to Query1.FieldCount - 1 do
    begin
      Field := Query1.Fields[i];
      Field.Visible := False;
      case Field.Index of
        0 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := '사 번';
            end;
        1 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 12;
              Field.DisplayLabel := '성 명';
            end;
        5 : begin
              Field.Visible      := false;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := 'BAND';
            end;
        6 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 48;     //+8
              Field.DisplayLabel := '부 서 명';
            end;
        7 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 30;
              Field.DisplayLabel := '진행상황';
            end;
//====================================================================================//
//   30.41      2001.07.24         손종운 추가             자기계발목표 추가
//====================================================================================//
        8 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 10;
              Field.DisplayLabel := '비  고';
            end;
//====================================================================================//
      end;
    end;
  Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,108) + 40;
  Grid1.SetFocus;
end;


procedure TFm_DestValue.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       Sb_OkClick(Sender);
    end;
end;


// TPeDestValuer...................................................................................
constructor TPeDestValuer.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  Fempno := '';
  FRemoteServer := nil;
end;

destructor TPeDestValuer.Destroy;
begin
  inherited;
end;

function TPeDestValuer.Execute : Boolean;
var
  Fm : TFm_DestValue;
begin
  Result := True;

  Try
    Fm := TFm_DestValue.Create(nil);
    Fm.RemoteServer := FRemoteServer;
    Fm.rabasdate    := Fyear;
    Fm.empno        := Fempno;
    Fm.ShowModal;
    if not Fm.FCloseYn then
      Fempno := Fm.empno
    else
      Result := False;
  Finally
    Fm.Free;
    Fm := nil;
  End;
end;

procedure TFm_DestValue.Select_Data(Sender: TObject);
begin
//  case TComponent(Sender).Tag of
//    0 : begin                                        // 평가자
//          Bt_e12.Font.Color := clPurple;
//          Bt_ebr.Font.Color := clBlack;
//          Fe12 := True;
//        end;
//    1 : begin                                        // 참고인
//          Bt_e12.Font.Color  := clBlack;
//          Bt_ebr.Font.Color  := clPurple;
//          Fe12 := False;
//        end;
//  end;

end;

procedure TFm_DestValue.Bt_e12Click(Sender: TObject);
begin
  Select_Data(Sender);
  SqlOpen;
end;

procedure TFm_DestValue.Ed_empno1RightBtnClick(Sender: TObject);
begin
   SqlOpen
end;

procedure TFm_DestValue.Ed_empno1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(13) then
   begin
      SqlOpen
   end;
end;

end.
