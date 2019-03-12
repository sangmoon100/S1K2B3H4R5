{-------------------------------------------------------------------------------
 PROGRAM-NAME   : 휴가사용 현황조회(PKA4053A.exe)
 SYSTEM-NAME    : 급여 - 근태
 SUBSYSTEM-NAME : 근 태 
 Programmer     : 김 태 호
 Version        : 10.00
 Date           : 2011.04.26

Update Contents
  버전    수정일       수정자   수정내용                             관련근거
10.01    2011.04.26    김태호   최초개발본                           설계명세서
10.02    2012.07.23    강륜종   년도별 개인의 장휴일수를 반영
--------------------------------------------------------------------------------}

unit PKA40531;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, ComCtrls, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate, OnShapeLabel, OnPopupEdit, StdCtrls,
  OnFocusButton, Grids, DBGrids, OnGrDBGrid, OnInsaCommon, Db, OnTmaxPersonEdit,
  Tmax_DataSetText, OnDBGrid, Tmax_session, Mask, OnRegistry,
  TmaxFunc, OnStringUtils, OnEditCombo, comobj ;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    SB_Help: TStatusBar;
    Panel2: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    PA_Buttons: TPanel;
    BT_Find: TOnFocusButton;
    BT_Close: TOnFocusButton;
    TDS_Grid: TTMaxDataSet;
    DataSource1: TDataSource;
    BT_Print: TOnFocusButton;
    TMaxSession: TTMaxSession;
    Panel3: TPanel;
    ED_year: TOnComboEdit;
    E_empno: TTMaxPersonPopupEdit;
    TDS1: TTMaxDataSet;
    E_deptname: TOnEdit;
    E_deptcode: TOnWinPopupEdit;
    DbGrid2: TOnGrDbGrid;
    procedure BT_CloseClick(Sender: TObject);
    procedure EempnoInitPopup(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure EempnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_deptcodeInitPopup(Sender: TObject);
    procedure E_empnoChange(Sender: TObject);
    procedure E_empnoEnter(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoReadEnded(Sender: TObject);
    procedure E_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure DbGrid2ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      TempRow : Integer;
  public
    { Public declarations }
    FG_Date   : String[8];     //Host Date
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSpass    : String;        //비밀번호
    GSgrade   : String;        //등급
    All_Flag  : Boolean ;      //if 운영자 ? True : False
    GSorgnum  : String;        // Login조직차수
    GSdeptcode : String;       // Login부서코드
    GSdeptcode2 : String;       // Login부서코드

    Curdeptcode : String;       // 조회할 사번 부서코드

    procedure Retrieve;
    function StringOfDept(StringOfdeptcode : string): String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses   PKA40532, PKA40533;

{$R *.DFM}

procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Retrieve;
var
  SqlText : String;
begin
  if length(E_empno.Text) < 4 then
  begin
       MessageDlg('조회하려는 사번을 정확히 입력하세요', mtConfirmation, [mbYes], 0);
       E_empno.SetFocus;
       exit;
  end;


  with TDS_Grid do
  begin
       ServiceName := 'HINSA_select10';
       Close;
       Sql.Clear;
       Sql.Add( ' SELECT DUYYMM,                                                                     ');
       Sql.Add( ' 	(SELECT NVL(SUM(YEARLY_CNT),0) FROM PKYEARLT R                               ');
       Sql.Add( '         WHERE R.EMPNO= D.EMPNO AND YEARLY_YY = SUBSTR(DUYYMM,1,4)) -               ');
       Sql.Add( '       (SELECT NVL(SUM(YEAR),0)+NVL(SUM(YEARHALF*0.5),0) FROM PKHDUTY C             ');
       Sql.Add( '         WHERE C.EMPNO =D.EMPNO AND DUYYMM LIKE '''+ Copy(ED_year.Text,1,4) + '%''  ');
       Sql.Add( ' 	    AND C.DUYYMM <= D.DUYYMM ) YEARLY_CNT,                                   ');
       Sql.Add( ' 	 NVL(SUM(YEAR),0)+NVL(SUM(YEARHALF*0.5),0) YEAR,                             ');
       Sql.Add( ' 	(SELECT MAXCNT1  FROM  PKCDUCOD WHERE DUFLDNM =''special'') -                ');
       Sql.Add( '       (SELECT NVL(SUM(SPECIAL),0)  FROM PKHDUTY C                                  ');
       Sql.Add( '         WHERE C.EMPNO =D.EMPNO AND DUYYMM LIKE '''+ Copy(ED_year.Text,1,4) + '%''  ');
       Sql.Add( '	    AND C.DUYYMM <= D.DUYYMM )      SPECIALCNT,                              ');
       Sql.Add( ' 	 NVL(SUM(SPECIAL),0) SPECIAL,                                                ');
       Sql.Add( ' 	(SELECT MAXCNT1  FROM  PKCDUCOD WHERE DUFLDNM =''birth'') -                  ');
       Sql.Add( '	(SELECT NVL(SUM(BIRTH),0)  FROM PKHDUTY C                                    ');
       Sql.Add( '         WHERE C.EMPNO =D.EMPNO AND DUYYMM LIKE '''+ Copy(ED_year.Text,1,4) + '%''  ');
       Sql.Add( '	    AND C.DUYYMM <= D.DUYYMM )  BIRTHCNT,                                    ');
       Sql.Add( '        NVL(SUM(BIRTH),0) BIRTH,                                                    ');
//       Sql.Add( '       (SELECT MAXCNT1  FROM  PKCDUCOD WHERE DUFLDNM =''longwork'') -               ');
       Sql.Add( ' 	(SELECT NVL(SUM(LONGWORK_CNT),0) FROM PKYEARLT R                             ');//LONGWORK_CNT 필드 추가 및 데이터반영(안효상 요청)2012.07.18
       Sql.Add( '         WHERE R.EMPNO= D.EMPNO AND YEARLY_YY = SUBSTR(DUYYMM,1,4)) -               ');
       Sql.Add( '       (SELECT NVL(SUM(LONGWORK),0)  FROM PKHDUTY C                                 ');
       Sql.Add( '         WHERE C.EMPNO =D.EMPNO AND DUYYMM LIKE '''+ Copy(ED_year.Text,1,4) + '%''  ');
       Sql.Add( '           AND C.DUYYMM <= D.DUYYMM )     LONGWORKCNT,                              ');
       Sql.Add( ' 	 NVL(SUM(LONGWORK),0) LONGWORK ,                                             ');
       Sql.Add( '        NVL(SUM(SICK),0)     SICK                                                   ');
       Sql.Add( '   FROM PKHDUTY D                                                                   ');
       Sql.Add( '  WHERE DUYYMM LIKE '''+  Copy(ED_year.Text,1,4) + '%''                             ');
       Sql.Add( '   AND EMPNO  = '''+ E_empno.empno + '''                                            ');
       Sql.Add( '  GROUP BY DUYYMM,EMPNO ,KORNAME                                                    ');

       ClearFieldInfo;
       AddField('DUYYMM'     , ftString,100);
       AddField('YEARLY_CNT' , ftFloat, 100);
       AddField('YEAR'       , ftFloat, 100);
       AddField('SPECIALCNT' , ftFloat, 100);
       AddField('SPECIAL'    , ftFloat, 100);
       AddField('BIRTHCNT'   , ftFloat, 100);
       AddField('BIRTH'      , ftFloat, 100);
       AddField('LONGWORKCNT', ftFloat, 100);
       AddField('LONGWORK'   , ftFloat, 100);
       AddField('SICK'       , ftString, 100);    ///    sql.savetofile('c:\aa.sql');
       TDS_Grid.Open;

       FieldByName('DUYYMM').Alignment       := taCenter;
       FieldByName('YEARLY_CNT').Alignment   := taCenter;
       FieldByName('YEAR').Alignment         := taCenter;
       FieldByName('SPECIALCNT').Alignment   := taCenter;
       FieldByName('SPECIAL').Alignment      := taCenter;
       FieldByName('BIRTHCNT').Alignment     := taCenter;
       FieldByName('BIRTH').Alignment        := taCenter;
       FieldByName('LONGWORKCNT').Alignment  := taCenter;
       FieldByName('LONGWORK').Alignment     := taCenter;
       FieldByName('SICK').Alignment       := taRightJustify;

       TFloatField(FieldByName('YEARLY_CNT')).DisplayFormat := '#,##0.0';
  end;

  if TDS_Grid.RecordCount < 1 then
  begin
       MessageDlg('조회한사원이 조회년도 근태이력에 존재하지 않습니다.', mtInformation, [mbYes], 0 );
       SB_help.Panels[1].Text := '조회한사원이 조회년도 근태이력에 존재하지 않습니다.';
  end
  else
  begin
       SB_help.Panels[1].Text := '자료가 조회되었습니다.';
  end;

end;


procedure TFM_Main.EempnoInitPopup(Sender: TObject);
begin
  if All_Flag then
    begin
      EmpForm.GSorgnumS    := Trim(GSorgnum);
      EmpForm.GSdeptcodeS  := Trim(StringOfDept(Curdeptcode));
    end
  else
    begin
      EmpForm.GSorgnumS    := Trim(GSorgnum);
      EmpForm.GSdeptcodeS  := Trim(StringOfDept(GSdeptcode));
    end;

  EmpForm.Edit         := TOnWinPopupEdit(Sender);
  EmpForm.E_Cond.Text  := '';
  EmpForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := EmpForm ;

end;

function TFM_Main.StringOfDept(StringOfdeptcode : string): String;
var
  LengthOfDept : Integer;
begin
  for LengthOfDept := Length(StringOfdeptcode) downto 1  do begin
    if Copy(StringOfdeptcode,LengthOfDept,1) <> '0' then begin
      StringOfDept := Copy(StringOfdeptcode,1,LengthOfDept);
      Exit;
    end;
  end;
end;


procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TFM_Main.EempnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
    begin
      E_empno.Text  := EmpForm.GSempnoS + ' - '+ EmpForm.GSkornameS;
//      PDeptname.Text := EmpForm.GSdeptnameS;
      Retrieve;
    end;
end;

procedure TFM_Main.E_deptcodeInitPopup(Sender: TObject);
begin
  if All_Flag then
  begin
       DeptForm.GSdeptcodeS  := '';
  end
  else
  begin
       DeptForm.GSdeptcodeS  := Trim(StringOfDept(GSdeptcode));
  end;

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.E_empnoChange(Sender: TObject);
begin
     E_empno.Param_deptcode := E_deptCode.Text;
end;

procedure TFM_Main.E_empnoEnter(Sender: TObject);
begin
  E_empno.Sql  := '';
  if ((Copy(GSGrade,3,1) = 'A') OR (Copy(GSGrade,3,1) = 'B'))  then
        E_empno.Param_deptcode := E_deptCode.Text
  else
        E_empno.Param_deptcode := E_deptCode.Text;
//   E_deptname.Param_deptcode := E_deptCode.Text;

end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  E_empno.Param_deptcode := E_deptCode.Text;
  if Key = Chr(13) then
  begin
       E_empno.empno     := Copy(E_empno.Text,1,4);
       E_empno.Param_deptcode := E_deptCode.Text;
       E_empno.PL_get_singledata;
       E_deptcode.Text   := E_empno.jobdept;
       E_deptname.Text   := E_empno.deptname;
       GSorgnum          := E_empno.orgnum;
       Key := #0;
  end;
end;

procedure TFM_Main.E_empnoReadEnded(Sender: TObject);
begin
//ReadEnded 이벤트가 없으면 콘트롤에 값을 뿌려주지 않고 그냥 skip 하는 문제 해결을 위해.  $00E6CCCC $00E1E1E1
  E_empno.Param_deptcode := E_deptCode.Text;
  SB_Help.Panels[1].Text :='';
  E_empno.Text      := E_empno.empno +' - '+ E_empno.korname;
  E_deptcode.Text   := E_empno.jobdept;
  E_deptname.Text   := E_empno.deptname;
  GSorgnum          := E_empno.orgnum;

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  E_deptname.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text) ;
  
  Retrieve;
end;

procedure TFM_Main.E_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
    begin
      E_deptcode.Text    := DeptForm.GSdeptcode;
      E_deptname.Text    := DeptForm.GSdeptname;
    end;
end;

procedure TFM_Main.E_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if E_deptcode.Text ='' then
      begin
        FM_Tmax           := TFM_Tmax.Create(Self);
        FM_Tmax.T_Session := TMaxSession;
        E_deptcode.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);
        E_deptname.Text   := FM_Tmax.GetData('deptname',GSorgnum,E_deptcode.Text);
      end;
  end;
end;

procedure TFM_Main.DbGrid2ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
     if (Field.FieldName = 'DUYYMM') or
        (Field.FieldName = 'YEARLY_CNT') or
        (Field.FieldName = 'SPECIALCNT') or
        (Field.FieldName = 'BIRTHCNT') or
        (Field.FieldName = 'LONGWORKCNT')  then
         Canvas.Brush.Color := $0080FFFF  //$00FEB4E8   00CBF0B3
     else
         Canvas.Brush.Color := $00E3C688;//$00FEB4E8   00FFFF80   0080FFFF
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  FL_IDate: Integer;
  FL_Date : String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';

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
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  if ( GSgrade[2] <='C' ) or (GSgrade[3] <='C' ) then  All_Flag := True  //운영자
  else                                                 All_Flag := False;

  //if All_Flag = False then Eempno.Enabled := False;

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

  E_empno.Text      := GSempno + ' - ' + GSkorname;
  SB_help.Panels[1].Text := ' 작업자의 조직차수,부서코드,본부코드 설정중...';

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add ('Select Eempno, EKorname, orgnum, Jobdept, ');
    Sql.Add ('      (Select deptname from pycdept where orgnum=a.orgnum and deptcode=a.jobdept) ');
    Sql.Add ('  from Pimeemp A           ');
    Sql.Add (' where A.Eempno   = '''+ GSempno +'''  ');

    ClearFieldInfo;
    AddField('field1' ,  ftString, 100);
    AddField('field2' ,  ftString, 100);
    AddField('field3' ,  ftString, 100);
    AddField('field4' ,  ftString, 100);
    AddField('field5' ,  ftString, 100);
    Open;
  end;

  FL_Date    := Copy(FG_Date,1,4);

  if not IsNumber(FL_Date) then System.Exit;

  FL_IDate := GetStrToint(FL_Date);
  ED_year.Items.Clear;
  ED_year.KeyItems.Clear;
  ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
  ED_year.Items.Add(FL_Date+' 년');
  ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');
  ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
  ED_year.KeyItems.Add(FL_Date);
  ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
  ED_year.ItemIndex := 1;


  if ((Copy(GSGrade,3,1) = 'A') OR (Copy(GSGrade,3,1) = 'B'))  then
  begin
    E_empno.Enabled := True;
    E_empno.Text    := GSempno +' - '+ GSkorname;
    E_empno.empno   := GSempno;

    GSorgnum          := TDS1.FieldByName('field3').AsString;
    E_deptcode.Text   := TDS1.FieldByName('field4').AsString;
    E_deptname.Text   := TDS1.FieldByName('field5').AsString;

    Retrieve;
  end
  else if TDS1.FieldByName('field1').AsString <> ''  then
  begin
    E_empno.Enabled := True;
    E_empno.text := GSempno +' - '+ GSkorname;
    E_empno.Sql  := 'SELECT A.empno,   A.korname,    A.paycl,   A.payra,   A.orgnum,   A.deptcode, A.pstate,  '+
                    '       D.codename payraname,    C.codename payclname, B.deptname, B.deptna3,  B.extcode, '+
                    '       A.empdate, A.orgempdate, A.juminid, A.jobdept                                     '+
                    '  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                        '+
                    ' WHERE D.codeid(+) = ''I113''                                                            '+
                    '   AND A.payra     = D.codeno(+)                                                         '+
                    '   AND C.codeid(+) = ''I112''                                                            '+
                    '   AND A.paycl     = C.codeno(+)                                                         '+
                    '   AND A.orgnum    = B.orgnum(+)                                                         '+
                    '   AND A.jobdept   = B.deptcode(+)                                                       '+
                    '   AND (A.empno    = ''%s'' OR A.korname = ''%s'') ';

    E_empno.empno     := GSempno;
    GSorgnum          := TDS1.FieldByName('field3').AsString;
    E_deptcode.Text   := TDS1.FieldByName('field4').AsString;
    E_deptname.Text   := TDS1.FieldByName('field5').AsString;

    Retrieve;
  end
  else
  begin
    MessageDlg('현재는 사용 하실 수가 없습니다.  ', mtInformation,[mbOk], 0);
    Close;
    System.Exit;
  end;

  SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
  SendMessage(SB_help.handle,WM_PAINT,0,0);
end;

end.


