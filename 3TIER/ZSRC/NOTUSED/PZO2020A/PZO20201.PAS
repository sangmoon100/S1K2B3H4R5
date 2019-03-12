{-------------------------------------------------------------------------------
 PROGRAM-NAME   : 외주인력 기간연장(PZO2020A.exe)
 SYSTEM-NAME    : 기타 - 외주인력관리
 SUBSYSTEM-NAME : 외주인력관리
 Programmer     : hjku
 Version        : 1.00
 Date           : 2015.06.30

Update Contents
  버전    수정일       수정자   수정내용                             관련근거
1.0    2015.06.30    hjku   최초개발본
--------------------------------------------------------------------------------}

unit PZO20201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, ComCtrls, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate, OnShapeLabel, OnPopupEdit, StdCtrls,
  OnFocusButton, Grids, DBGrids, OnGrDBGrid, OnInsaCommon, Db, OnTmaxPersonEdit,
  Tmax_DataSetText, OnDBGrid, Tmax_session, Mask, OnRegistry,Masks,
  TmaxFunc, OnStringUtils, OnEditCombo, comobj, OnEditNumCtl, func;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    TDS_Grid: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Panel1: TPanel;
    OnShapeLabel7: TOnShapeLabel;
    SB_Help: TStatusBar;
    PA_Buttons: TPanel;
    BT_exit: TOnFocusButton;
    BT_save: TOnFocusButton;
    bt_search: TOnFocusButton;
    Panel5: TPanel;
    s_deptcode: TOnWinPopupEdit;
    Grid2: TStringGrid;
    p_change: TPanel;
    e_deptcode: TOnWinPopupEdit;
    cb_all: TCheckBox;
    OnShapeLabel1: TOnShapeLabel;
    Panel2: TPanel;
    rb_change0: TRadioButton;
    rb_change1: TRadioButton;
    rb_change2: TRadioButton;
    e_managerid: TOnWinPopupEdit;
    s_managerid: TOnWinPopupEdit;
    s_empno: TOnEdit;
    s_korname: TOnEdit;
    procedure EempnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BT_exitClick(Sender: TObject);
    procedure bt_searchClick(Sender: TObject);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_saveClick(Sender: TObject);
    procedure Rbtn_YClick(Sender: TObject);
    procedure Rbtn_NClick(Sender: TObject);
    procedure Rbtn_AClick(Sender: TObject);
    procedure DBG_gridCellClick(Sender: TObject; const ACell: TOnJCell);
    procedure Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Grid2Click(Sender: TObject);
    procedure rb_changeClick(Sender: TObject);
    procedure cb_allClick(Sender: TObject);
    procedure e_deptcodeInitPopup(Sender: TObject);
    procedure e_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_manageridCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_manageridInitPopup(Sender: TObject);
    procedure e_manageridCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure e_manageridInitPopup(Sender: TObject);
    procedure e_manageridKeyPress(Sender: TObject; var Key: Char);
    procedure s_manageridKeyPress(Sender: TObject; var Key: Char);
    procedure s_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure s_kornameKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    FG_Date   : String[8];     //Host Date
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSpass    : String;        //비밀번호
    GSgrade   : String;        //등급

    GSorgnum   : String;        // Login조직차수
    GSdeptcode : String;       // Login부서코드
    GSDeptname : String;       // Login부서코드

    Curdeptcode : String;       // 조회할 사번 부서코드

    //저장변수
    p_empno       : String;
    p_orgnum      : String;
    p_deptcode    : String;
    p_managerid   : String;
    p_startdate   : String;
    p_enddate     : String;
    p_writeman    : String;  

    procedure Retrieve;
    Function CheckEmpnoDup(const korname, birthdate, sex : String):Boolean;
    procedure initialize_variables(ri : integer);
    procedure Clear_StringGrid;    

  end;
type
  TstCellObj = packed record
  case Integer of
    0 : ( Num      : Integer);
    1 : ( Sender   : TObject);
end;  

var
  FM_Main: TFM_Main;

implementation

uses   PZO20202, PZO20203;

{$R *.DFM}

procedure TFM_Main.EempnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
    begin
      s_managerid.Text  := EmpForm.GSempnoS + ' - '+ EmpForm.GSkornameS;
//      PDeptname.Text := EmpForm.GSdeptnameS;
    end;
end;

procedure TFM_Main.s_deptcodeInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.s_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
    begin
      //s_deptcode.Text    := DeptForm.GSdeptcode;
      s_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;

      Retrieve;
    end;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  emptype : string;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

    try
      TMaxSession.Connect := True;
    except
      //Application.MessageBox(PChar(TMaxSession.HeaderPacket),'에러',mb_ok);
      showmessage('Error Code : ' + TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                  'Error Msg  : ' + TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                  '관리자에게 문의하십시오.');
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

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

  GSorgnum          := FM_Tmax.GetData('orgnum','','');
  GSDeptCode        := '';
  GSDeptname        := '';


  (*2017.03.16.hjku.. 접속권한 체크 해제 요청.. 전지영M
  if (Copy(GSgrade,3,1) > 'C') then
  begin


  {2017.01.10.hjku.. J사번 정규직 사번 전환 관련 추가.. 안효상M
      if (GSempno[1] in ['P','Q','Y','J']) then
      begin
          ShowMessage('접속할 권한이 없습니다. 프로그램을 종료합니다.');
          Application.Terminate;
          Exit;
      end;  }
    emptype := '';
    TDS1.Close;
    TDS1.ServiceName := 'HINSA_select';
    TDS1.Sql.Text    := 'SELECT decode(substr('''+GSempno+''',1,1),''D'',''D'',FINDHIRE('''+GSempno+''')), ''Value2'', ''value3'','+
                        '       ''Value4'', ''Field5''                           '+
                        '  from dual                                             ';
    TDS1.ClearFieldInfo;
    TDS1.AddField('Value1' , ftString, 100);
    TDS1.AddField('Value2' , ftString, 100);
    TDS1.AddField('Value3' , ftString, 100);
    TDS1.AddField('Value4' , ftString, 100);
    TDS1.AddField('field5' , ftString, 100);
    TDS1.Open;
    emptype := TDS1.FieldByName('Value1').AsString;

    if (emptype[1] in ['P','Q','Y','J']) then
    begin
      ShowMessage('접속할 권한이 없습니다. 프로그램을 종료합니다.');
      Application.Terminate;
      Exit;
    end;

  end;
  *)

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.ADD(' select a.orgnum,                        ');
    SQL.ADD('        a.deptcode,                      ');
    SQL.ADD('        b.deptname,                      ');
    SQL.ADD('        ''field4'',                      ');
    SQL.ADD('        ''field5''                       ');
    SQL.ADD('   from pimpmas a, pycdept b             ');
    SQL.ADD('  where a.empno    = ''' + GSempno + ''' ');
    SQL.ADD('    and a.deptcode = b.deptcode          ');
    SQL.ADD('    and a.orgnum   = b.orgnum            ');

    ClearFieldInfo;
    AddField('field1' ,  ftString, 100);
    AddField('field2' ,  ftString, 100);
    AddField('field3' ,  ftString, 100);
    AddField('field4' ,  ftString, 100);
    AddField('field5' ,  ftString, 100);
    Open;

    if(TDS1.RecordCount >= 1) then
    begin
       //GSorgnum       := FieldByName('field1').AsString;
       GSDeptCode     := FieldByName('field2').AsString;
       GSDeptname     := FieldByName('field3').AsString;
    end;

    //s_managerid.empno   := Gsempno;
    //s_managerid.korname := GsKorname;
    s_managerid.Text    := Gsempno + ' - ' + GsKorname;

    //s_deptcode.Text := GSDeptCode + ' - ' + GSDeptname;

    //Clear_StringGrid;
    Retrieve;
  end;

  SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
  SendMessage(SB_help.handle,WM_PAINT,0,0);
end;

procedure TFM_Main.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.Retrieve;
var
  i       : Integer;
  CelObj  : TstCellObj;
begin
  with TDS_Grid do
  begin
       ServiceName := 'PZO2020A_sel1';
       Close;
       Sql.Clear;
       sql.Add('SELECT                                                                                               ');
       sql.Add('       A.EMPNO                                                                                       ');
       sql.Add('      ,A.KORNAME                                                                                     ');
       sql.Add('      ,A.COMCODE                                                                                     ');
       sql.Add('      ,(select codename from drmcode where codeid =''C001'' and a.comcode = codeno) COMNAME          ');
       sql.Add('      ,A.BIRTHDATE                                                                                   ');
       sql.Add('      ,(SELECT CODENO||'':''||CODENAME FROM PYCCODE WHERE CODEID = ''I039'' AND A.SEX = CODENO) SEX  ');
       sql.Add('      ,A.ORGNUM                                                                                      ');
       sql.Add('      ,A.DEPTCODE                                                                                    ');
       sql.Add('      ,C.DEPTNAME                                                                                    ');
       //sql.Add('      ,A.TELNO                                                                                       ');
       //sql.Add('      ,A.CELLNO                                                                                      ');
       //sql.Add('      ,A.EMAIL                                                                                       ');
       //sql.Add('      ,A.JOBPLACENM                                                                                  ');
       sql.Add('      ,A.MANAGERID                                                                                   ');
       sql.Add('      ,B.KORNAME MANAGERNAME                                                                         ');
       //sql.Add('      ,B.ORGNUM   MANAGER_ORGNUM                                                                     ');
       //sql.Add('      ,B.DEPTCODE MANAGER_DEPTCODE                                                                   ');
       //sql.Add('      ,D.DEPTNAME MANAGER_DEPTNAME                                                                   ');
       //sql.Add('      ,A.REGMAN                                                                                      ');
       //sql.Add('      ,(SELECT KORNAME FROM PIMPMAS WHERE A.REGMAN = EMPNO) REGMANNAME                               ');
       //sql.Add('      ,A.REGDATE                                                                                     ');
       sql.Add('      ,A.STARTDATE                                                                                   ');
       sql.Add('      ,A.ENDDATE                                                                                     ');
       //sql.Add('      ,A.FIELDREPYN                                                                                  ');
       sql.Add('      ,A.STATEYN                                                                                     ');
       //sql.Add('      ,A.WRITEMAN                                                                                    ');
       //sql.Add('      ,(SELECT KORNAME FROM PIMPMAS WHERE A.WRITEMAN = EMPNO) WRITEMANNAME                           ');
       //sql.Add('      ,A.WRITETIME                                                                                   ');
       sql.Add(' FROM PZMOUTMAS A, PIMPMAS B, PYCDEPT C, PYCDEPT D                                                   ');
       sql.Add('WHERE A.MANAGERID = B.EMPNO                                                                          ');
       sql.Add('  AND A.ORGNUM    = C.ORGNUM(+)                                                                      ');
       sql.Add('  AND A.DEPTCODE  = C.DEPTCODE(+)                                                                    ');
       sql.Add('  AND B.ORGNUM    = D.ORGNUM(+)                                                                      ');
       sql.Add('  AND B.DEPTCODE  = D.DEPTCODE(+)                                                                    ');
       sql.Add('  AND NVL(A.STATEYN,''N'')=''Y''                                                                     ');
       sql.Add('  AND ENDDATE BETWEEN TO_CHAR(SYSDATE,''YYYYMMDD'') AND TO_CHAR(ADD_MONTHS(SYSDATE,1),''YYYYMMDD'')  ');

       if s_Empno.Text <> '' then
            SQL.Add(' and a.empno like '''+s_Empno.Text+'%'+'''                                   ');

       if s_Korname.Text <> '' then
            SQL.Add(' and a.korname like '''+'%'+s_Korname.Text+'%'+'''                           ');

       if Trim(ParseString(s_managerid.text,'-',1)) <> '' then
       begin
            SQL.Add(' and (a.managerid like ''' + Trim(ParseString(s_managerid.text,'-',1)) + '%''  or   ');
            SQL.Add('      b.korname like ''' + Trim(ParseString(s_managerid.text,'-',1)) + '%''  )      ');
       end;

       if s_deptcode.text <> '' then
       begin
            SQL.Add(' and (  c.deptcode like ''%'+Trim(ParseString(s_deptcode.text,'-',1))+'%''                               ');
            SQL.Add('     or c.deptname like ''%'+Trim(ParseString(s_deptcode.text,'-',1))+'%'')                              ');
       end;

       SQL.Add('  order by a.empno                                                                ');

       ClearFieldInfo;
       AddField('EMPNO'      , ftString, 4);
       AddField('KORNAME'    , ftString, 12);
       AddField('COMCODE'    , ftString, 4);
       AddField('COMNAME'    , ftString, 20);
       AddField('BIRTHDATE'  , ftString, 8);
       AddField('SEX'        , ftString, 31);
       AddField('ORGNUM'     , ftString, 3);
       AddField('DEPTCODE'   , ftString, 6);
       AddField('DEPTNAME'   , ftString, 60);
       AddField('MANAGERID'  , ftString, 4);
       AddField('MANAGERNAME', ftString, 12);
       AddField('STARTDATE'  , ftString, 8);
       AddField('ENDDATE'    , ftString, 8);
       AddField('STATEYN'    , ftString, 1);

       Open;
  end;

  Clear_StringGrid;

  if TDS_Grid.RecordCount > 0 then
  begin
      Grid2.RowCount := TDS_Grid.RecordCount +1;

      for i := 1 to Grid2.RowCount do
      begin

        Grid2.Cells[1, i] :=  TDS_Grid.fieldbyname('EMPNO').AsString;
        Grid2.Cells[2, i] :=  TDS_Grid.fieldbyname('KORNAME').AsString;
        Grid2.Cells[3, i] :=  TDS_Grid.fieldbyname('COMNAME').AsString;
        Grid2.Cells[4, i] :=  TDS_Grid.fieldbyname('ORGNUM').AsString;
        Grid2.Cells[5, i] :=  TDS_Grid.fieldbyname('DEPTCODE').AsString;
        Grid2.Cells[6, i] :=  TDS_Grid.fieldbyname('DEPTNAME').AsString;
        Grid2.Cells[7, i] :=  TDS_Grid.fieldbyname('MANAGERNAME').AsString;
        Grid2.Cells[8, i] :=  TDS_Grid.fieldbyname('STARTDATE').AsString;
        Grid2.Cells[9, i] :=  TDS_Grid.fieldbyname('ENDDATE').AsString;

        CelObj.Num := 2;
        Grid2.Cells[0, i] := 'N';
        Grid2.Objects[0,i] := CelObj.Sender;

        TDS_Grid.next;
      end;
  end
  else
  begin
      Grid2.RowCount := 2;
        Grid2.Cells[1, 1] :=  '';
        Grid2.Cells[2, 1] :=  '';
        Grid2.Cells[3, 1] :=  '';
        Grid2.Cells[4, 1] :=  '';
        Grid2.Cells[5, 1] :=  '';
        Grid2.Cells[6, 1] :=  '';
        Grid2.Cells[7, 1] :=  '';
        Grid2.Cells[8, 1] :=  '';
        Grid2.Cells[9, 1] :=  '';

        CelObj.Num := 2;
        Grid2.Cells[0, 1] := 'N';                                          
        Grid2.Objects[0,1] := CelObj.Sender;             
  end;

  SB_help.Panels[1].Text := inttostr(TDS_Grid.RecordCount) + '건이 조회 되었습니다.';

end;


procedure TFM_Main.bt_searchClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TFM_Main.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
         System.Exit;
    Key := #0;
    Retrieve;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;    
end;

procedure TFM_Main.Rbtn_YClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TFM_Main.Rbtn_NClick(Sender: TObject);
begin
      Retrieve;
end;

procedure TFM_Main.Rbtn_AClick(Sender: TObject);
begin
    Retrieve;
end;


Function TFM_Main.CheckEmpnoDup(const korname, birthdate, sex : String):Boolean;
Begin
    result := false;

    with TDS1 do
    begin
        ServiceName := 'HINSA_select';
        Close;
        Sql.Clear;
        SQL.Add(' select count(*),                         ');
        SQL.Add('        ''field2'',                       ');
        SQL.Add('        ''field3'',                       ');
        SQL.Add('        ''field4'',                       ');
        SQL.Add('        ''field5''                        ');
        SQL.Add('   from PZMOUTMAS                         ');
        SQL.Add('  where korname   = ''' + korname   + ''' ');
        SQL.Add('    and birthdate = ''' + birthdate + ''' ');
        SQL.Add('    and sex       = ''' + sex       + ''' ');
        SQL.Add('    and nvl(stateyn,''N'') = ''Y''        ');        

        ClearFieldInfo;
        AddField('field1' ,  ftString, 100);
        AddField('field2' ,  ftString, 100);
        AddField('field3' ,  ftString, 100);
        AddField('field4' ,  ftString, 100);
        AddField('field5' ,  ftString, 100);
        Open;

        if(FieldByName('field1').AsInteger >= 1) then
        begin
            result := true;
            exit;
        end;
    end;
End;


procedure TFM_Main.BT_saveClick(Sender: TObject);
var
    i,j   : Integer;
begin
    j := 0;
    
    with Grid2 do
    Begin
        for i := 1 to RowCount-1 do
        begin
            if(Grid2.Cells[0, i]='Y')and(trim(Grid2.Cells[1, i])<>'') then j := j + 1;
        End;
    end;

    if( Grid2.RowCount <= 1 ) or ( j <= 0 ) then
    begin
        MessageDlg('선택한 자료가 없습니다.', mtError, [mbOk], 0);
        exit;
    end;

    if(rb_change2.Checked) then
    begin
        if(trim(e_managerid.Text)='') then
        begin
            MessageDlg('담당매니저를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
            e_managerid.SetFocus;
            exit;
        end;

        if(trim(e_deptcode.Text)='') then
        begin
            MessageDlg('관리부서를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
            e_deptcode.SetFocus;
            exit;
        end;
    end;

    if MessageDlg('선택하신 외주인력에 대해 1년 기간연장 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

    for i := 1 to Grid2.RowCount-1 do
    begin
        if(Grid2.Cells[0, i]='Y')and(trim(Grid2.Cells[1, i])<>'') then
        begin
            initialize_variables(i)  ;

            try

                with TDS1 do
                begin
                    ServiceName := 'PZO2010A_dml';
                    Close;
                    Sql.Clear;
                    sql.add('Update PZMOUTMAS A                                                           ');
                    sql.add('   Set                                                                       ');

                    if(p_deptcode <>'') then
                    begin
                        sql.add('       ORGNUM      = ''' + p_orgnum                        + ''',        ');
                        sql.add('       DEPTCODE    = ''' + p_deptcode                      + ''',        ');
                    end;

                    if(p_managerid <>'') then
                    begin
                        sql.add('       MANAGERID   =''' + p_managerid                     + ''',         ');
                    end;

                    sql.add('       STARTDATE   = to_char(to_date(''' + p_enddate + ''',''YYYYMMDD'')+1,''YYYYMMDD''),              ');
                    sql.add('       ENDDATE     = to_char(add_months(to_date(''' + p_enddate + ''',''YYYYMMDD''),12),''YYYYMMDD''), ');
                    sql.add('       WRITEMAN    = ''' + p_writeman                      + ''',            ');
                    sql.add('       WRITETIME   = to_char(sysdate,''YYYYMMDDHH24miss'')                   ');
                    sql.add(' WHERE empno       = '''  + p_empno                       + '''              ');

                    Execute;

                end;
            except
                MessageDlg('저장 오류!!!'+TMaxSession.TMax_GetHeaderValue, mtError, [mbOk], 0);
            end;
        end;
    end;

    Retrieve;
end;


procedure TFM_Main.DBG_gridCellClick(Sender: TObject;
  const ACell: TOnJCell);
begin
    if(TDS_Grid.RecordCount = 1 ) then Retrieve;
end;

procedure DrawCheck(DC:HDC;BBRect:TRect;bCheck:Boolean);
begin
  if bCheck then
  Begin
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK + DFCS_CHECKED)
  End
  else
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK);
end;

procedure TFM_Main.Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
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
      if ACol = 0 then
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

procedure TFM_Main.Grid2Click(Sender: TObject);
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

  with Grid2 do
  Begin
    valconyn := Cells[0 ,Row];
    inEEMPNO := Cells[1 ,Row];
  End;

  if (ARow > 0) and (ACol = 0) then
  begin
    CelObj.Sender := Grid2.Objects[ACol,ARow];

    if CelObj.Num = 1 then
    Begin
      CelObj.Num:=2;
      Grid2.Cells[0, ARow] := 'N';
    end else
    Begin
      CelObj.Num := 1;
      Grid2.Cells[0, ARow] := 'Y';
    End;

    Grid2.Objects[ACol,ARow] := CelObj.Sender;
    Grid2.Invalidate;
    Exit;
  End;

end;

procedure TFM_Main.rb_changeClick(Sender: TObject);
begin
    p_change.Enabled    := false;
    e_deptcode.Enabled  := false;
    e_managerid.Enabled := false;

    //e_managerid.empno   := '';
    //e_managerid.korname := '';
    e_managerid.text    := '';

    e_deptcode.Text     := '';

    if(rb_change1.Checked) then
    begin
        //e_managerid.empno   := Gsempno;
        //e_managerid.korname := GsKorname;
        e_managerid.Text    := Gsempno + ' - ' + GsKorname;

        e_deptcode.Text := GSDeptCode + ' - ' + GSDeptname;
    end
    else if(rb_change2.Checked) then
    begin
         p_change.Enabled    := true;
         e_deptcode.Enabled  := true;
         e_managerid.Enabled := true;
    end;   
end;

procedure TFM_Main.cb_allClick(Sender: TObject);
var
    i   : Integer;
  CelObj: TstCellObj;
begin

    with Grid2 do
    Begin
        for i := 1 to RowCount do
        begin
            CelObj.Sender := Grid2.Objects[0,i];

            if(cb_all.Checked) then
            begin
                CelObj.Num := 1;
                Grid2.Cells[0, i] := 'Y';
            end
            else
            begin
                CelObj.Num := 2;
                Grid2.Cells[0, i] := 'N';
            end;

            Grid2.Objects[0,i] := CelObj.Sender;
            Grid2.Invalidate;
        End;
    end;
end;


procedure TFM_Main.e_deptcodeInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.initialize_variables(ri : integer);
begin
    p_empno       := Grid2.Cells[1, ri];

    p_orgnum      := '';
    p_deptcode    := '';
    p_managerid   := '';
    
    if(trim(e_deptcode.text)<>'') then
    begin
        p_orgnum      := GSorgnum ;
        p_deptcode    := Trim(ParseString(e_deptcode.Text,'-',1));
    end;

    p_managerid   := Trim(ParseString(e_managerid.text,'-',1));
    
    p_startdate   := Grid2.Cells[8, ri];

    p_enddate     := Grid2.Cells[9, ri];

    p_writeman    :=  GSempno;
end;


procedure TFM_Main.e_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
    begin
      e_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;
    end;
end;

procedure TFM_Main.s_manageridCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       s_managerid.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;

       Retrieve;
  end;
end;

procedure TFM_Main.s_manageridInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TFM_Main.e_manageridCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       e_managerid.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;
  end;
end;

procedure TFM_Main.e_manageridInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TFM_Main.e_manageridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       e_manageridInitPopup(Self);
  end;
end;

procedure TFM_Main.s_manageridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Retrieve;
       s_manageridInitPopup(Self);
  end;
end;

procedure TFM_Main.Clear_StringGrid;
var
  i : integer;
begin
    cb_all.Checked    := false;

    grid2.ColCount    := 10;
    grid2.RowCount    := 2;
    Grid2.Cells[0,0]  := '선택';
    Grid2.Cells[1,0]  := '사번';
    Grid2.Cells[2,0]  := '성명';
    Grid2.Cells[3,0]  := '소속회사명';
    Grid2.Cells[4,0]  := '조직차수';
    Grid2.Cells[5,0]  := '관리부서코드';
    Grid2.Cells[6,0]  := '관리부서명';
    Grid2.Cells[7,0]  := '담당매니저명';
    Grid2.Cells[8,0]  := '투입시작일';
    Grid2.Cells[9,0]  := '투입종료일';  

    grid2.ColWidths[0]:= 40;
    grid2.ColWidths[1]:= 50;
    grid2.ColWidths[2]:= 60;
    grid2.ColWidths[3]:= 160;
    grid2.ColWidths[4]:= -1;
    grid2.ColWidths[5]:= -1;
    grid2.ColWidths[6]:= 120;
    grid2.ColWidths[7]:= 100;
    grid2.ColWidths[8]:= 80;
    grid2.ColWidths[9]:= 80;

    for i := 0 to 10 do
         grid2.Cells[i,1] := '';    
end;

procedure TFM_Main.s_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Retrieve;
       s_deptcodeInitPopup(Self);
  end;
end;

procedure TFM_Main.s_kornameKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
         System.Exit;
    Key := #0;
    Retrieve;
end;
end.


