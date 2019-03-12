unit PTA30701;

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
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_3: TOnSkinButton;
    Notebook1: TNotebook;
    SB_Help: TStatusBar;
    Grid1: TOnGrDbGrid;
    Grid2: TOnGrDbGrid;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    BT_Find: TOnFocusButton;
    BT_close: TOnFocusButton;
    OnShapeLabel5: TOnShapeLabel;
    Grid3: TOnGrDbGrid;
    OnShapeLabel6: TOnShapeLabel;
    RB_type2: TRadioButton;
    RB_date2: TRadioButton;
    RB_type3: TRadioButton;
    RB_date3: TRadioButton;
    OnShapeLabel9: TOnShapeLabel;
    TMaxSession: TTMaxSession;
    DS_Grid1: TDataSource;
    TDS_Grid1: TTMaxDataSet;
    TDS_Grid2: TTMaxDataSet;
    DS_Grid2: TDataSource;
    TDS_Grid3: TTMaxDataSet;
    DS_Grid3: TDataSource;
    TDS_Grid4: TTMaxDataSet;
    DS_Grid4: TDataSource;
    Grid4: TOnGrDbGrid;
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
    OnShapeLabel4: TOnShapeLabel;
    Label1: TLabel;
    Edit1: TEdit;
    TDS1: TTMaxDataSet;
    L_ceduscore: TOnShapeLabel;
    L_avgpoint: TOnShapeLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Q_com: TTMaxDataSet;
    procedure BT_closeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure DS_Grid1DataChange(Sender: TObject; Field: TField);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSPassword: String[10];
    GSgrade   : String[10];    //등급
    CurYear   : String;
    GSysdate    : string;
    Payrachdate : string;
    procedure PL_Com_Contructor;

  end;

var
  MainForm: TMainForm;

implementation

uses PTA30702;

{$R *.DFM}

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
     Close;
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
  CurYear           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  CurYear := Copy(CurYear,1,4);
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
    ED_empno.ButtonWidth     := 0;
    ED_empno.Enabled         := False;
  end
  else
  begin
    ED_empno.ButtonWidth     := 24;
    ED_empno.Enabled         := True;
  end;

  SB_1Click(SB_1);
  SendMessage(SB_help.handle,WM_PAINT,0,0);

{
  if (GSPassword <> 'KPI') then
  begin
       Try
            InfoForm := TInfoForm.Create(Self);
            InfoForm.ShowModal;
       Finally
            InfoForm.Free;
       end;
  end;
}
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
     //  Notebook1.ActivePage = 'P_1' //전체
     if Trim(ED_empno.Text) = '' then
     begin
          MessageDlg('조회할 사원을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
          exit;
     end;

     L_deptname.ValueCaption   := ED_empno.deptname ;
     L_paycl.ValueCaption      := ED_empno.payclname;
     L_payra.ValueCaption      := ED_empno.payraname;
     L_orgempdate.ValueCaption := Copy(ED_empno.orgempdate,1,4)+'-'+Copy(ED_empno.orgempdate,5,2)+'-'+Copy(ED_empno.orgempdate,7,2);


//2007.05.30 서혜미 2007-13105 요청서 보임기준일 -> 표준년한 초과 / POINT -> 변화리더수강여부
     with TDS1 do
     begin
          ServiceName := 'PTA3020B_sel3';
          SQL.Clear;
          SQL.Add('select pstate,  b.codename pstatenm, a.cpaycldate, a.paycldate,                                       ');
       if Gsysdate <  payrachdate then
       begin
          SQL.Add('       case when (a.paycl = ''40'' and a.payclyy > 3 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''42'' and a.payclyy > 5 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''44'' and a.payclyy > 7 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''32'' and a.payclyy > 3 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''22'' and a.payclyy > 5 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''20'' and a.payclyy > 4 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''10''                   and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('	  else ''N''	 		   	   	   	   	                                 ');
          SQL.Add('       end  cpayradate,                                                                               '); //standardyy   표준년한초과
          SQL.Add('       decode(a.paycl,''40'',3,''42'',5,''44'',7,''32'',3,''22'',5,''20'',4,0) payclyy,               ');
//          SQL.Add('       decode(a.paycl,''40'',3,''42'',5,''44'',7,''32'',3,''22'',5,''20'',4,''10'',0,3) payclyy, ');
       end
       else
       begin
          SQL.Add('       case when (a.paycl = ''D31'' and a.payclyy > 3 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''D33'' and a.payclyy > 5 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''D35'' and a.payclyy > 7 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''D21'' and a.payclyy > 3 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''D11'' and a.payclyy > 5 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''C21'' and a.payclyy > 4 and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('            when (a.paycl = ''C11''                   and a.empdate > ''20040401'') then ''Y''         ');
          SQL.Add('	  else ''N''	 		   	   	   	   	                                 ');
          SQL.Add('       end  cpayradate,                                                                               '); //standardyy   표준년한초과 (위 3가지 조건 맞을때 'Y')
          SQL.Add('       decode(a.paycl,''D31'',3,''D33'',5,''D35'',7,''D21'',3,''D11'',5,''C21'',4,0) payclyy,    ');
//          SQL.Add('       decode(a.paycl,''D31'',3,''D33'',5,''D35'',7,''D21'',3,''D11'',5,''C21'',4,''C11'',0,3) payclyy, ');
       end;
          SQL.Add('   	  nvl(sum(c.tot_score),0) payclpoint,                                                            ');
          SQL.Add('  	  trunc(avg(c.tot_score),1) avgpoint,                                                            ');
          SQL.Add('	  decode(x.cnt,0,0,1) point                                                                      '); //reder   변화리더수강여부
          SQL.Add('  from pimpmas a, pyccode b,  pedu2his c,                                                             ');
          SQL.Add('             (select count(*) cnt from pedu2item                                                      ');
          SQL.Add('               where                                                                                  ');
          SQL.Add('                     (edu_title = ''05년직급역량과정(변화리더양성)''                                  ');
          SQL.Add('                  or  edu_title = ''06년 관리자변화리더양성과정''                                     ');
          SQL.Add('                  or  edu_title = ''07년 변화리더양성과정''                                           ');
	  SQL.Add('		     or  empno in   (''0010'',''0040'',''0041'',''0090'',                                '); //사번list:2004년 주니어보드
          SQL.Add('                                  ''0142'',''0154'',''0156'',''0335'',                                '); //수강자 명단.2004년이후 교육 없고
          SQL.Add('                                  ''0480'',''0483'',''2215'',''0573'',                                '); //앞으로도 없음.박찬일 과장 하드코딩 요청
          SQL.Add('                                  ''0694'',''0711'',''0902'',''1119'',                                '); //2007.05.30 2007-13105 요청서
          SQL.Add('                                  ''1502'',''1510'',''1518'',''1740'',                                ');
          SQL.Add('                                  ''1748'',''0030'')                                                  ');
          SQL.Add('                      )                                                                               ');
          SQL.Add('                  and empno = '''+ED_empno.empno+''' ) x                                              ');
          SQL.Add(' where b.codeid = ''I114''                                                                            ');
          SQL.Add('   and a.pstate = b.codeno                                                                            ');
          SQL.Add('   and a.empno  = c.empno(+)                                                                          ');
          SQL.Add('   and ((substr(a.cpaycldate,1,4) <= c.base_yy) or (substr(a.paycldate,1,4) <= c.base_yy))            ');
          SQL.Add('   and c.base_yy <> ''2005''                                                                          ');
          SQL.Add('   and a.empno = '''+ED_empno.empno+'''                                                               ');
          SQL.Add(' group by pstate,  b.codename , a.cpaycldate, a.cpayradate, a.paycl,                                  ');
          SQL.Add('                   a.paycldate, a.payclyy, a.empdate, x.cnt                                           ');



          Close;
          ClearFieldInfo;
          AddField('PSTATE'    , ftString, 2);
          AddField('PSTATENM'  , ftString, 30);
          AddField('CPAYCLDATE', ftString, 8);  //
          AddField('PAYCLDATE' , ftString, 8);
          AddField('CPAYRADATE', ftString, 8);
          AddField('PAYCLYY'   , ftFloat,  3);
          AddField('PAYCLPOINT', ftFloat,  5);
          AddField('AVGPOINT'  , ftFloat,  5);
          AddField('POINT'     , ftFloat,  5);  //

          Open;

          paycldate                 := FieldByName('PAYCLDATE').AsString;  //BAND조정일(기존 승격일(cpaycldate) display하던것을 BAND조정일로 변경)
          point                     := FieldByName('POINT').Asfloat;       //tmax 바꾸지 않기 위해서 기존꺼 그대로 씀 (변화리더 수강여부임)
          L_cpayradate.ValueCaption := FieldByName('CPAYRADATE').AsString; //표준년한초과
          L_pstate.ValueCaption     := FieldByName('PSTATENM').AsString;


          if cpaycldate <> '' then
          begin
             L_cpaycldate.ValueCaption := Copy(cpaycldate,1,4)+'-'+Copy(cpaycldate,5,2)+'-'+Copy(cpaycldate,7,2);
          end
          else
          begin
             L_cpaycldate.ValueCaption := Copy(paycldate,1,4)+'-'+Copy(paycldate,5,2)+'-'+Copy(paycldate,7,2);
          end;

//          L_cpayradate.ValueCaption := Copy(cpayradate,1,4)+'-'+Copy(cpayradate,5,2)+'-'+Copy(cpayradate,7,2);
          L_cyear.ValueCaption      := FieldByName('PAYCLYY').AsString;
          L_ceduscore.ValueCaption  := FloatToStr(FieldByName('PAYCLPOINT').AsFloat);
          L_avgpoint.ValueCaption   := FieldByName('AVGPOINT').AsString;

          if point = 0 then    //tmax 바꾸지 않기 위해서 기존꺼 그대로 씀 (변화리더 수강여부임)
             L_point.ValueCaption := 'N'
          else
             L_point.ValueCaption := 'Y';
     end;


{          Sql.Text :=
              'select a.pstate,  b.codename pstatenm, a.cpaycldate, a.paycldate, a.cpayradate,'+ chr(13) + chr(10) +
              '       decode(a.paycl, ''32'', 3, ''22'', 5, ''20'', 4, ''10'', 1, 3) payclyy, '+ chr(13) + chr(10) +
              '       d.payclpoint,                                                           '+ chr(13) + chr(10) +
              '       nvl(ceil(sum(c.tot_score)/ decode(a.paycl, ''32'', 3, ''22'', 5, ''20'', 4, ''10'', 1, 3)/10 *10) /10,0) point '+ chr(13) + chr(10) +
              '  from pimpmas a, pyccode b,                 '+ chr(13) + chr(10) +
              '       (select base_yy, empno, tot_score     '+ chr(13) + chr(10) +
              '          from pedu2his                      '+ chr(13) + chr(10) +
              '         where base_yy <> ''2005''           '+ chr(13) + chr(10) +
              '           and empno ='''+ED_empno.empno+''' '+ chr(13) + chr(10) +
              '         union                               '+ chr(13) + chr(10) +
              '        select B.base_yy, T.empno,           '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0, '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0, '+ chr(13) + chr(10) +
              '               decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) )+ '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0,                                                      '+ chr(13) + chr(10) +
              '               decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )  '+ chr(13) + chr(10) +
              '               ) tot_score                                                                        '+ chr(13) + chr(10) +
              '          from pimpmas M, pedu2base B,                                                            '+ chr(13) + chr(10) +
              '               (select T1.empno, max(T1.req_check) req_check,                                     '+ chr(13) + chr(10) +
              '                       nvl(sum(decode(T1.req_yn, ''Y'',decode(A.max_score, NULL,T1.score,         '+ chr(13) + chr(10) +
              '                       decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score)) '+ chr(13) + chr(10) +
              '                       )),0) req_score,                                                           '+ chr(13) + chr(10) +
              '                       nvl(sum(decode(T1.req_yn, ''N'',decode(A.max_score, NULL,T1.score,         '+ chr(13) + chr(10) +
              '                       decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score)) '+ chr(13) + chr(10) +
              '                       )),0) opt_score                                                            '+ chr(13) + chr(10) +
              '                  from pedu2limit A,                                                              '+ chr(13) + chr(10) +
              '                       (select A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type,      '+ chr(13) + chr(10) +
              '                               max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,      '+ chr(13) + chr(10) +
              '                               sum(A.edu_score) score                                             '+ chr(13) + chr(10) +
              '                          from pedu2item A,  pedu2type B                                          '+ chr(13) + chr(10) +
              '                         where A.base_yy = '''+CurYear+'''                                        '+ chr(13) + chr(10) +
              '                           and B.edu_type = A.edu_type                                            '+ chr(13) + chr(10) +
              '                         group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')              '+ chr(13) + chr(10) +
              '                       ) T1                                      '+ chr(13) + chr(10) +
              '                 where A.limit_type(+) = T1.limit_type           '+ chr(13) + chr(10) +
              '                 group by  T1.empno  ) T                         '+ chr(13) + chr(10) +
              '         where M.empno = T.empno                                 '+ chr(13) + chr(10) +
              '           and B.paycl = decode(M.payra, ''2C'', ''0C'', M.paycl)'+ chr(13) + chr(10) +
              '           and B.base_yy ='''+CurYear+'''                        '+ chr(13) + chr(10) +
              '           and M.empno ='''+ED_empno.empno+'''                   '+ chr(13) + chr(10) +
              '       ) c,                                                      '+ chr(13) + chr(10) +
              '      (select max(case when a.cpaycldate <> '' ''                '+ chr(13) + chr(10) +
              '                       then decode(sign(substr(a.cpaycldate,1,4)-2005),1,nvl(sum(c.tot_score),0),nvl(sum(c.tot_score),0) - nvl(sum(c.mis_score),0)) '+ chr(13) + chr(10) +
              '                  else decode(sign(substr(a.paycldate,1,4)-2005),1,nvl(sum(c.tot_score),0),nvl(sum(c.tot_score),0) - nvl(sum(c.mis_score),0))       '+ chr(13) + chr(10) +
              '                  end ) payclpoint                               '+ chr(13) + chr(10) +
              '             from pimpmas d, pimpmas a, pedu2his c               '+ chr(13) + chr(10) +
              '         where d.empno = a.empno                                 '+ chr(13) + chr(10) +
              '           and a.empno = c.empno(+)                              '+ chr(13) + chr(10) +
              '   and  ((substr(a.cpaycldate,1,4) <= c.base_yy) or (substr(a.paycldate,1,4) <= c.base_yy))'+ chr(13) + chr(10) +
              '           and a.empno ='''+ED_empno.empno+'''                   '+ chr(13) + chr(10) +
              '         group by a.cpaycldate, a.paycldate                      '+ chr(13) + chr(10) +
              '      ) d                                                        '+ chr(13) + chr(10) +
              ' where b.codeid =''I114''                                        '+ chr(13) + chr(10) +
              '   and a.pstate = b.codeno                                       '+ chr(13) + chr(10) +
              '   and a.empno = c.empno(+)                                      '+ chr(13) + chr(10) +
              '   and substr(a.cpaycldate,1,4) <= c.base_yy(+)                  '+ chr(13) + chr(10) +
              '   and a.empno    ='''+ED_empno.empno+'''                        '+ chr(13) + chr(10) +
              ' group by pstate,  b.codename , a.cpaycldate, a.paycldate, a.cpayradate, a.paycl, d.payclpoint     ';
}

{          Sql.Text :=
              'select a.pstate,  b.codename pstatenm, a.cpaycldate, a.paycldate, a.cpayradate,                   '+ chr(13) + chr(10) +
              '       decode(a.paycl, ''32'', 3, ''22'', 5, ''20'', 4, ''10'', 1, 3) payclyy,                    '+ chr(13) + chr(10) +
              '	      nvl(sum(c.tot_score),0) payclpoint,                                                        '+ chr(13) + chr(10) +
	      '       trunc(avg(c.tot_score),1) avgpoint,                                                        '+ chr(13) + chr(10) +
	      '       trunc((avg(c.tot_score)/10),1) point                                                       '+ chr(13) + chr(10) +
              '  from pimpmas a, pyccode b,                                                                      '+ chr(13) + chr(10) +
              '       (select base_yy, empno, tot_score                                                          '+ chr(13) + chr(10) +
              '          from pedu2his                                                                           '+ chr(13) + chr(10) +
              '         where base_yy <> ''2005''                                                                '+ chr(13) + chr(10) +
              '           and empno ='''+ED_empno.empno+'''                                                      '+ chr(13) + chr(10) +
              '         union                                                                                    '+ chr(13) + chr(10) +
              '        select B.base_yy, T.empno,                                                                '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0,                                                      '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0,                                                      '+ chr(13) + chr(10) +
              '               decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) )+ '+ chr(13) + chr(10) +
              '               decode( T.req_check, ''Y'',0,                                                      '+ chr(13) + chr(10) +
              '               decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )  '+ chr(13) + chr(10) +
              '               ) tot_score                                                                        '+ chr(13) + chr(10) +
              '          from pimpmas M, pedu2base B,                                                            '+ chr(13) + chr(10) +
              '               (select T1.empno, max(T1.req_check) req_check,                                     '+ chr(13) + chr(10) +
              '                       nvl(sum(decode(T1.req_yn, ''Y'',decode(A.max_score, NULL,T1.score,         '+ chr(13) + chr(10) +
              '                       decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score)) '+ chr(13) + chr(10) +
              '                       )),0) req_score,                                                           '+ chr(13) + chr(10) +
              '                       nvl(sum(decode(T1.req_yn, ''N'',decode(A.max_score, NULL,T1.score,         '+ chr(13) + chr(10) +
              '                       decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score)) '+ chr(13) + chr(10) +
              '                       )),0) opt_score                                                            '+ chr(13) + chr(10) +
              '                  from pedu2limit A,                                                              '+ chr(13) + chr(10) +
              '                       (select A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type,      '+ chr(13) + chr(10) +
              '                               max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,      '+ chr(13) + chr(10) +
              '                               sum(A.edu_score) score                                             '+ chr(13) + chr(10) +
              '                          from pedu2item A,  pedu2type B                                          '+ chr(13) + chr(10) +
              '                         where A.base_yy = '''+CurYear+'''                                        '+ chr(13) + chr(10) +
              '                           and B.edu_type = A.edu_type                                            '+ chr(13) + chr(10) +
              '                         group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')              '+ chr(13) + chr(10) +
              '                       ) T1                                                                       '+ chr(13) + chr(10) +
              '                 where A.limit_type(+) = T1.limit_type                                            '+ chr(13) + chr(10) +
              '                 group by  T1.empno  ) T                                                          '+ chr(13) + chr(10) +
              '         where M.empno = T.empno                                                                  '+ chr(13) + chr(10) +
              '           and B.paycl = decode(M.payra, ''2C'', ''0C'', M.paycl)                                 '+ chr(13) + chr(10) +
              '           and B.base_yy ='''+CurYear+'''                                                         '+ chr(13) + chr(10) +
              '           and M.empno ='''+ED_empno.empno+'''                                                    '+ chr(13) + chr(10) +
              '       ) c                                                                                        '+ chr(13) + chr(10) +
              ' where b.codeid =''I114''                                                                         '+ chr(13) + chr(10) +
              '   and a.pstate = b.codeno                                                                        '+ chr(13) + chr(10) +
              '   and a.empno = c.empno(+)                                                                       '+ chr(13) + chr(10) +
              '   and  ((substr(a.cpaycldate,1,4) <= c.base_yy) or (substr(a.paycldate,1,4) <= c.base_yy))       '+ chr(13) + chr(10) +
              '   and a.empno    ='''+ED_empno.empno+'''                                                         '+ chr(13) + chr(10) +
              ' group by pstate,  b.codename , a.cpaycldate, a.paycldate, a.cpayradate, a.paycl                  ';


          edit1.Text := sql.Text;

          Close;
          ClearFieldInfo;
          AddField('PSTATE'    , ftString, 2);
          AddField('PSTATENM'  , ftString, 30);
          AddField('CPAYCLDATE', ftString, 8);
          AddField('PAYCLDATE' , ftString, 8);
          AddField('CPAYRADATE', ftString, 8);
          AddField('PAYCLYY'   , ftFloat,  3);
          AddField('PAYCLPOINT', ftFloat,  5);
          AddField('AVGPOINT'  , ftFloat,  5);
          AddField('POINT'     , ftFloat,  5);
          Open;

//          if TDS1.Active then
//          showmessage(inttostr(TDS1.recordcount));

          cpaycldate := FieldByName('CPAYCLDATE').AsString;
          cpayradate := FieldByName('CPAYRADATE').AsString;
          paycldate  := FieldByName('PAYCLDATE').AsString;
          point      := FieldByName('POINT').Asfloat;

          L_pstate.ValueCaption     := FieldByName('PSTATENM').AsString;

          if cpaycldate <> '' then
          begin
             L_cpaycldate.ValueCaption := Copy(cpaycldate,1,4)+'-'+Copy(cpaycldate,5,2)+'-'+Copy(cpaycldate,7,2);
          end
          else
          begin
             L_cpaycldate.ValueCaption := Copy(paycldate,1,4)+'-'+Copy(paycldate,5,2)+'-'+Copy(paycldate,7,2);
          end;

          L_cpayradate.ValueCaption := Copy(cpayradate,1,4)+'-'+Copy(cpayradate,5,2)+'-'+Copy(cpayradate,7,2);
          L_cyear.ValueCaption      := FieldByName('PAYCLYY').AsString;
          L_ceduscore.ValueCaption  := FieldByName('PAYCLPOINT').AsString;
          L_avgpoint.ValueCaption   := FieldByName('AVGPOINT').AsString;

          if point < 10 then
          begin
             L_point.ValueCaption := FieldByName('POINT').AsString;
          end
          else
          begin
             L_point.ValueCaption := '10.0';
          end;}


     with TDS_Grid1 do
     begin
          ServiceName := 'PTA3020B_sel1';
          Close;
          Sql.Text := 'select a1.base_yy, a1.empno,        '+
                      '       to_char(nvl(a1.tot_score,0), ''990.9'')||'' (''||to_char(nvl(a1.tot_sc,0),''990.9'')||'')'' tot,     '+
                      '       to_char(nvl(a1.req_score,0), ''990.9'')||'' (''||to_char(nvl(a1.req_sc,0),''990.9'')||'')'' req,     '+
                      '       to_char(nvl(a1.opt_score,0), ''990.9'')||'' (''||to_char(nvl(a1.opt_sc,0),''990.9'')||'')'' opt,     '+
                      '       b1.req1_score, b1.req2_score, b1.req3_score, b1.req4_score,                                          '+
                      '       b1.opt1_score, b1.opt2_score, b1.opt3_score                                                          '+
                      '   from (select base_yy, empno, req_sc, opt_sc, tot_sc, req_score, opt_score, tot_score                     '+
                      '          from pedu2his                                                                                     '+
                      '         where base_yy <> '''+CurYear+'''                                                                   '+
                      '           and empno ='''+ED_empno.empno+'''                                                                '+
                      '         union                                                                                              '+
                      '        select B.base_yy, T.empno,T.req_sc, T.opt_sc, T.tot_sc,                                             '+
                      '               decode( T.req_check, ''Y'',0,                                                                '+
                      '               decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) req_score, '+
                      '               decode( T.req_check, ''Y'',0,                                                                '+
                      '               decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) ) opt_score, '+
                      '               decode( T.req_check, ''Y'',0,                                                                '+
                      '               decode( T.req_check, ''Y'',0,                                                                '+
                      '               decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) +          '+
                      '               decode( T.req_check, ''Y'',0,                                                                '+
                      '               decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )            '+
                      '               ) tot_score                                                                                  '+
                      '          from pimpmas M, pedu2base B,                                                                      '+
                      '              (select T1.empno, max(T1.req_check) req_check,                                                '+
                      '                      nvl(sum(T1.score),0) tot_sc,                                                          '+
                      '                      nvl(sum(decode(T1.req_yn, ''Y'',T1.score)),0) req_sc,                                 '+
                      '                      nvl(sum(decode(T1.req_yn, ''N'',T1.score)),0) opt_sc,                                 '+
                      '                      nvl(sum(decode(T1.req_yn, ''Y'',decode(A.max_score, NULL,T1.score,                    '+
                      '                      decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))            '+
                      '                      )),0) req_score,                                                                      '+
                      '                      nvl(sum(decode(T1.req_yn, ''N'',decode(A.max_score, NULL,T1.score,                    '+
                      '                      decode(greatest(T1.score,A.max_score), A.max_score,T1.score, A.max_score))            '+
                      '                      )),0) opt_score                                                                       '+
                      '                 from pedu2limit A,                                                                         '+
                      '                      (select A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type,                 '+
                      '                              max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,                 '+
                      '                              sum(A.edu_score) score                                                        '+
                      '                         from pedu2item A,  pedu2type B                                                     '+
                      '                        where A.base_yy = '''+CurYear+'''                                                   '+
                      '                          and B.edu_type = A.edu_type                                                       '+
                      '                        group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')                         '+
                      '                      ) T1                                                                                  '+
                      '                where A.limit_type(+) = T1.limit_type                                                       '+
                      '                group by  T1.empno  ) T                                                                     '+
                      '         where M.empno = T.empno                                                                            '+
                      '           and B.paycl = decode(M.payra, ''2C'', ''0C'',''C11'',''C00'', M.paycl)                           '+
                      '           and B.base_yy ='''+CurYear+'''                                                                   '+
                      '           and M.empno ='''+ED_empno.empno+''')  a1,                                                        '+
                      '       (select a.base_yy, a.empno,                                                                          '+
                      '               sum(decode(b.edu_group_cd, ''직급공통'',a.edu_score,''BAND공통'',a.edu_score,0)) req1_score, '+
                      '               sum(decode(b.edu_group_cd, ''직급전문'',a.edu_score,''BAND전문'',a.edu_score,0)) req2_score, '+
                      '               sum(decode(b.edu_group_cd, ''직무공통'',   a.edu_score,0))   req3_score,                     '+
                      '               sum(decode(b.edu_group_cd, ''기타(필수)'', a.edu_score,0))   req4_score,                     '+
                      '               sum(decode(b.edu_group_cd, ''직무전문1'',  a.edu_score,0))   opt1_score,                     '+
                      '               sum(decode(b.edu_group_cd, ''직무전문2'',  a.edu_score,0))   opt2_score,                     '+
                      '               sum(decode(b.edu_group_cd, ''기타(선택)'', a.edu_score,0))   opt3_score                      '+
                      '           from pedu2item a, pedu2type b                                                                    '+
                      '         where a.edu_type = b.edu_type                                                                      '+
                      '           and a.empno    = '''+ED_empno.empno+'''                                                          '+
                      '          group by a.base_yy,empno) b1                                                                      '+
                      ' where a1.base_yy = b1.base_yy                                                                              '+
                      '   and a1.empno   = b1.empno                                                                                '+
                      '   and a1.empno  = '''+ED_empno.empno+'''                                                                   '+
                      ' order by a1.base_yy desc ';

          ClearFieldInfo;
          AddField('BASE_YY'   , ftString,  4);
          AddField('EMPNO'     , ftString,  4);
          AddField('TOT'       , ftString, 15);
          AddField('REQ'       , ftString, 15);
          AddField('OPT'       , ftString, 15);
          AddField('REQ1_SCORE', ftFloat,   5);
          AddField('REQ2_SCORE', ftFloat,   5);
          AddField('REQ3_SCORE', ftFloat,   5);
          AddField('REQ4_SCORE', ftFloat,   5);
          AddField('OPT1_SCORE', ftFloat,   5);
          AddField('OPT2_SCORE', ftFloat,   5);
          AddField('OPT3_SCORE', ftFloat,   5);
          Open;
          DS_Grid1.OnDataChange := nil;
          FieldByName('TOT').Alignment := taCenter;
          FieldByName('REQ').Alignment := taCenter;
          FieldByName('OPT').Alignment := taCenter;
          DS_Grid1.OnDataChange := DS_Grid1DataChange;
     end;

     //  Notebook1.ActivePage = 'P_2'  //필수교육
     with TDS_Grid3 do
     begin
          ServiceName := 'PTA3020B_sel2';
          Close;
          Sql.Text := Format('select base_yy,                    '+
                             '       empno,                      '+
                             '       a.edu_type,                 '+
                             '       b.edu_name,                 '+
                             '       edu_title,                  '+
                             '       edu_date_from,              '+
                             '       edu_date_to,                '+
                             '       edu_time,                   '+
                             '       score,                      '+
                             '       edu_pass_yn,                '+
                             '       nvl(edu_score,0)            '+
                             '  from pedu2item a, pedu2type b    '+
                             ' where a.edu_type = b.edu_type     '+
                             '   and b.req_yn   = ''Y''          '+
                             '   and a.empno    = ''%s''         ', [ED_empno.empno]);

          if RB_type2.Checked then Sql.Text := Sql.Text + 'order by a.edu_type, edu_date_from '
          else                     Sql.Text := Sql.Text + 'order by edu_date_from, a.edu_type ';

          ClearFieldInfo;
          AddField('BASE_YY'      , ftString,   4);
          AddField('EMPNO'        , ftString,   4);
          AddField('EDU_TYPE'     , ftString,   4);
          AddField('EDU_NAME'     , ftString,  30);
          AddField('EDU_TITLE'    , ftString,  80);
          AddField('EDU_DATE_FROM', ftString,   8);
          AddField('EDU_DATE_TO'  , ftString,   8);
          AddField('EDU_TIME'     , ftFloat,    5);
          AddField('SCORE'        , ftInteger,  3);
          AddField('EDU_PASS_YN'  , ftString,   1);
          AddField('EDU_SCORE'    , ftString,   5);
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
          Sql.Text := Format('select base_yy,               '+
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

          if RB_type3.Checked then
             Sql.Text := Sql.Text + 'order by a.edu_type, edu_date_from '
          else
             Sql.Text := Sql.Text + 'order by edu_date_from, a.edu_type ';

          ClearFieldInfo;
          AddField('BASE_YY'      , ftString,   4);
          AddField('EMPNO'        , ftString,   4);
          AddField('EDU_TYPE'     , ftString,   4);
          AddField('EDU_NAME'     , ftString,  30);
          AddField('EDU_TITLE'    , ftString,  80);
          AddField('EDU_DATE_FROM', ftString,   8);
          AddField('EDU_DATE_TO'  , ftString,   8);
          AddField('EDU_TIME'     , ftFloat,    5);
          AddField('SCORE'        , ftInteger,  3);
          AddField('EDU_PASS_YN'  , ftString,   1);
          AddField('EDU_SCORE'    , ftFloat,    5);
          Open;

          FieldByName('BASE_YY').Alignment     := taCenter;
          FieldByName('EDU_PASS_YN').Alignment := taCenter;
          FieldByName('EDU_DATE_FROM').EditMask := '!9999/99/00;0;_';
          FieldByName('EDU_DATE_TO').EditMask   := '!9999/99/00;0;_';
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
                             '   and a.base_yy  = ''%s''        '+
                             '   and a.empno    = ''%s''        '+
                             ' order by a.edu_type, edu_date_from ', [TDS_Grid1.FieldByName('base_yy').AsString, ED_empno.empno]);

          ClearFieldInfo;
          AddField('BASE_YY'      , ftString,   4);
          AddField('EMPNO'        , ftString,   4);
          AddField('EDU_TYPE'     , ftString,   4);
          AddField('EDU_NAME'     , ftString,  30);
          AddField('EDU_TITLE'    , ftString,  80);
          AddField('EDU_DATE_FROM', ftString,   8);
          AddField('EDU_DATE_TO'  , ftString,   8);
          AddField('EDU_TIME'     , ftFloat,    5);
          AddField('SCORE'        , ftInteger,  3);
          AddField('EDU_PASS_YN'  , ftString,   1);
          AddField('EDU_SCORE'    , ftFloat,    5);
          Open;

          FieldByName('BASE_YY').Alignment     := taCenter;
          FieldByName('EDU_PASS_YN').Alignment := taCenter;
          FieldByName('EDU_DATE_FROM').EditMask := '!9999/99/00;0;_';
          FieldByName('EDU_DATE_TO').EditMask   := '!9999/99/00;0;_';
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
begin
     if (Field.FieldName = 'REQ') or (Field.FieldName = 'REQ1_SCORE') or (Field.FieldName = 'REQ2_SCORE') or
        (Field.FieldName = 'REQ3_SCORE') or (Field.FieldName = 'REQ4_SCORE') then Canvas.Brush.Color := $00FEB4E8;

     if (Field.FieldName = 'OPT') or (Field.FieldName = 'OPT1_SCORE') or (Field.FieldName = 'OPT2_SCORE') or
        (Field.FieldName = 'OPT3_SCORE') then Canvas.Brush.Color := $008EC7FF;

      if Grid1.fields[0].AsString = '2005' then
       canvas.Font.Color := clGray ;
end;

end.
