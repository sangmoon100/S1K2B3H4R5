{-------------------------------------------------------------------------------
  o 프로그램명  : 방문예약 시스템 관리(PVB1040A)
  o 시스템명    : 종합인사정보시스템
  o 부시스템명  : 방문자 예약시스템
  o 작성자      :
  o 버전        : 2.15
  o 작성일자    :
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부
    2.15 2013.04.09 지순미   주민번호 삭제 요청         SR-1304-0356
-------------------------------------------------------------------------------}
unit pvb1040a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, ComCtrls, OnSkinBtn,
  OnTmaxInsaData, OnOneInstance, Tmax_session, OnInsaCommon, Tmax_DataSetText,
  tmax_common, DB, OnEditBaseCtrl, OnEditStdCtrl, OnLineLabel, OnDBGrid,
  OnEditBtnCtrl, OnTmaxDeptEdit, OnTmaxCodeEdit, Tmax_DmlSet, OnStringUtils,
  TmaxFunc;

type
  TFM_PVB4010A = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    SB_Help: TStatusBar;
    PA_Buttons: TPanel;
    BT_Exit: TOnFocusButton;
    PA_MenuSelect: TPanel;
    SB_Tab1: TOnSkinButton;
    SB_Tab2: TOnSkinButton;
    PA_Client: TPanel;
    ONE_App: TOnOnceInstance;
    TmaxSession: TTMaxSession;
    BT_find: TOnFocusButton;
    SB_Tab3: TOnSkinButton;
    PA_work: TPanel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    ED_sempno: TOnEdit;
    ED_skorname: TOnEdit;
    Shape2: TShape;
    Grid1: TOnDBGrid;
    ED_empno: TOnEdit;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    ED_korname: TOnEdit;
    ED_deptcode: TTMaxDeptPopupEdit;
    ED_juminid: TOnEdit;
    ED_payra: TTMaxCodePopupEdit;
    ED_jobplace: TTMaxCodePopupEdit;
    ED_temp1: TOnEdit;
    ED_temp2: TOnEdit;
    BT_ins: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_del: TOnFocusButton;
    QR_pvmas: TTMaxDataSet;
    DataSource1: TDataSource;
    Shape3: TShape;
    Label1: TLabel;
    QR_dml: TTMaxDML;
    QR_com: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_Tab1Click(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure BT_insClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
  private
    { Private declarations }
    FL_Start    : Boolean;
    FG_CurTag   : Integer;
    FG_pempno   : String;
    FG_grade    : String;
    FG_Loading  : Boolean;
    FG_Ins1     : Boolean;

    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    function  PL_Check_Tag1 : Boolean;
    procedure PL_pvpimpmas_FieldSet;
    function  PL_Get_empno : String;
    procedure PL_Select_Tag1;
    procedure PL_Insert_Tag1;
    procedure PL_Save_Tag1;
    procedure PL_Delete_Tag1;
  public
    { Public declarations }
    procedure PL_ShowPanel(APanel: TPanel);
  end;

var
  FM_PVB4010A: TFM_PVB4010A;

implementation

uses pvb1040a2, pvb1040a3;

{$R *.DFM}

procedure TFM_PVB4010A.PL_ShowPanel(APanel: TPanel);
var
  FL_I     : Integer;
  AControl : TControl;
begin
  APanel.Parent  := PA_Client;
  APanel.Left    := 0;
  APanel.Top     := 0;
  APanel.Visible := True;
  APanel.Perform(WM_PAINT,0,0);

  for FL_I := 0 to PA_Client.ControlCount - 1 do
  begin
       AControl := PA_Client.Controls[FL_I];
       if (AControl is TPanel) and (AControl <> APanel) then
            AControl.Visible := False;
  end;
end;

procedure TFM_PVB4010A.FormCreate(Sender: TObject);
begin
  FM_SubForm1 := nil;
  FM_SubForm2 := nil;
  FL_Start    := True;
  FG_Loading  := False;
end;

procedure TFM_PVB4010A.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
  begin
       FG_Loading := True;
       FL_Start := not FL_Start;
       SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
       Self.SetBounds(FL_Rect.Top + 10, FL_Rect.Left + 20, Self.Width, Self.Height);
       SF_Main.Refresh;

       Application.ProcessMessages;

       // ※ 주의 : 프로그램 테스트 완료후 주석 부분을 해제 후 Rebuild해서 서버에 올린다..
       {if (ONE_App.Check) or (not ONE_App.MainCheck) then
         begin
              Application.Terminate;
              System.Exit;
         end;}

       ///////////////////////////////////////////////////////////////////////
       TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
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
       ///////////////////////////////////////////////////////////////////////

       // 이부분서부터 업무관련 초기화 부분 코딩 처리...
       FG_pempno := Hinsa_Param(CmdLine,1);
       FG_Grade  := Hinsa_Param(CmdLine,4);
       FG_Loading := False;
       SB_Tab1Click(SB_Tab1);
  end;
end;

procedure TFM_PVB4010A.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(FM_SubForm1) then
       FM_SubForm1.Free;
  if Assigned(FM_SubForm2) then
       FM_SubForm2.Free;
  CanClose := True;
end;

procedure TFM_PVB4010A.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_PVB4010A.SB_Tab1Click(Sender: TObject);
begin
  if FG_Loading then
       System.Exit;

  FG_Loading := True;
  SB_Tab1.BtnDown := False;
  SB_Tab2.BtnDown := False;
  SB_Tab3.BtnDown := False;

  FG_CurTag := TComponent(Sender).Tag;
  case TComponent(Sender).Tag of
     1 : begin
              PL_ShowPanel(PA_Work);
              Application.ProcessMessages;
         end;
     2 : begin
              if FM_SubForm1 = nil then
                   Application.CreateForm(TFM_SubForm1, FM_SubForm1);
              FM_SubForm1.Insa_Session := TmaxSession;
              FM_SubForm1.FG_empno     := FG_pempno;

              PL_ShowPanel(FM_SubForm1.PA_Work);
              Application.ProcessMessages;
              FM_SubForm1.PL_InitForm;
         end;
     3 : begin
              if FM_SubForm2 = nil then
                   Application.CreateForm(TFM_SubForm2, FM_SubForm2);
              FM_SubForm2.Insa_Session := TmaxSession;
              FM_SubForm2.FG_empno     := FG_pempno;

              PL_ShowPanel(FM_SubForm2.PA_Work);
              Application.ProcessMessages;
              FM_SubForm2.PL_InitForm;
         end;
  end;

  TOnSkinButton(Sender).BtnDown := True;
  FG_Loading := False;
end;

procedure TFM_PVB4010A.PL_Select_Tag1;
begin
  with QR_pvmas do
  begin
       Close;
       ServiceName := 'PVB1040A_sel1';
       Sql.Clear;
       Sql.Text := 'SELECT A.empno       ,  '+
                   '       A.korname     ,  '+
                   '       '''' juminid  ,  '+ //jissi 2013.04.09  주민번호 삭제 요청(SR-1304-0356) A.juminid
                   '       A.orgnum      ,  '+
                   '       A.deptcode    ,  '+
                   '       B.deptname    ,  '+
                   '       A.payra       ,  '+
                   '       C.codename    ,  '+
                   '       A.jobplace    ,  '+
                   '       D.codename    ,  '+
                   '       A.temp1       ,  '+
                   '       A.temp2          '+
                   '  FROM pvpimpmas A, pvpycdept B, pyccode C, pyccode D '+
                   ' WHERE A.orgnum   = B.orgnum(+)   '+
                   '   AND A.deptcode = B.deptcode(+) '+
                   '   AND C.codeid(+)= ''I113''      '+
                   '   AND A.payra    = C.codeno(+)   '+
                   '   AND D.codeid(+)= ''I160''      '+
                   '   AND A.jobplace = D.codeno(+)   '+
                   '   AND (A.empno    LIKE ''%s''    '+
                   '    OR  A.korname  LIKE ''%s'')   '+
                   '   AND A.orgnum   = ''ZZZ''       '+
                   ' ORDER BY A.empno, A.korname ';
        Sql.Text := Format(Sql.Text,[ED_sempno.Text+'%', ED_skorname.Text+'%']);
        DataSource1.OnDataChange := DataSource1DataChange;
        Open;
  end;
end;

function TFM_PVB4010A.PL_Check_Tag1 : Boolean;
begin
  Result := False;

  if ED_empno.Text = '' then
  begin
       MessageDlg('사원번호를 입력하세요...', mtInformation, [mbOK], 0);
       ED_empno.SetFocus;
       System.Exit;
  end;

  if ED_korname.Text = '' then
  begin
       MessageDlg('성명을 입력하세요...', mtInformation, [mbOK], 0);
       ED_korname.SetFocus;
       System.Exit;
  end;

  if SpaceInExists(ED_korname.Text) then
  begin
       MessageDlg('성명 입력시 문자열 중간에 공백을 입력할 수 없습니다...', mtInformation, [mbOK], 0);
       ED_korname.SetFocus;
       System.Exit;
  end;

  if ED_deptcode.deptcode = '' then
  begin
       MessageDlg('부서명을 입력하세요...', mtInformation, [mbOK], 0);
       ED_deptcode.SetFocus;
       System.Exit;
  end;

  if ED_jobplace.codeno = '' then
  begin
       MessageDlg('근무지를 입력하세요...', mtInformation, [mbOK], 0);
       ED_jobplace.SetFocus;
       System.Exit;
  end;
        
  Result := True;
end;

procedure TFM_PVB4010A.PL_pvpimpmas_FieldSet;
var
  FG_Date : String;
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  with QR_dml do
  begin
       TableName   := 'pvpimpmas';
       ServiceName := 'HINSA_perins';
       ClearFieldInfo;
       DataSet.ClearParamInfo;
       if not FG_ins1 then
            AddField('empno'    ,ED_empno.Text          ,ftString, False, True, True, '=')
       else
            AddField('empno'    ,ED_empno.Text          ,ftString, True, False, False, '');

       AddField('korname'       ,ED_korname.Text        ,ftString, True, False, False, '');
       AddField('juminid'       ,ED_juminid.Text        ,ftString, True, False, False, '');
       AddField('orgnum'        ,'ZZZ'                  ,ftString, True, False, False, '');
       AddField('deptcode'      ,ED_deptcode.deptcode   ,ftString, True, False, False, '');
       AddField('payra'         ,ED_payra.codeno        ,ftString, True, False, False, '');
       AddField('pstate'        ,'10'                   ,ftString, True, False, False, '');
       AddField('jobplace'      ,ED_jobplace.codeno     ,ftString, True, False, False, '');
       AddField('temp1'         ,ED_temp1.Text          ,ftString, True, False, False, '');
       AddField('temp2'         ,ED_temp2.Text          ,ftString, True, False, False, '');
       AddField('writetime'     ,FG_Date                ,ftString, True, False, False, '');
       AddField('writeman'      ,FG_pempno              ,ftString, True, False, False, '');
  end;
end;

function TFM_PVB4010A.PL_Get_empno : String;
begin
  Result := '';
  with QR_com do
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
       Sql.Text := 'SELECT NVL(MAX(SUBSTR(empno,2,3)),0) + 1 cnt, ''2'',''3'',''4'',''5'' '+
                   '  FROM pvpimpmas A '+
                   ' WHERE empno  LIKE ''Z%'' ';
       if Open then
       begin
            Result := FillDataFix(Result,3 - Length(Trim(FieldByName('field1').AsString)),'0');
            Result := 'Z' + Result + Trim(FieldByName('field1').AsString);
       end;
       Close;
  end;
end;

procedure TFM_PVB4010A.PL_Insert_Tag1;
begin
  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);
  ED_deptcode.orgnum   := 'ZZZ';
  ED_deptcode.deptcode := '';
  ED_deptcode.PL_get_singledata;

  ED_payra.codeno := '';
  ED_payra.PL_get_singledata;

  ED_jobplace.codeno := '';
  ED_jobplace.PL_get_singledata;

  FG_Ins1       := True;
  ED_empno.Text := PL_Get_empno;
  ED_korname.SetFocus;
end;

procedure TFM_PVB4010A.PL_Save_Tag1;
begin
  DataSource1.OnDataChange := nil;
  PL_pvpimpmas_FieldSet;
  if not FG_ins1 then
       QR_dml.Update
  else
       QR_dml.Insert;

  if not QR_dml.Execute then
  begin
       DataSource1.OnDataChange := DataSource1DataChange;
       System.Exit;
  end;

  if QR_pvmas.Active then
  begin
       QR_dml.ApplyDataSet(QR_pvmas, FG_ins1);
       with QR_pvmas do
       begin
            Edit;
            FieldByName('deptname').AsString  := ED_deptcode.deptname;
            FieldByName('payraname').AsString := ED_payra.codename;
            Post;
       end;
  end;
  FG_ins1 := False;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_PVB4010A.PL_Delete_Tag1;
begin
  DataSource1.OnDataChange := nil;
  PL_pvpimpmas_FieldSet;
  QR_dml.Delete;

  if not QR_dml.Execute then
  begin
       DataSource1.OnDataChange := DataSource1DataChange;
       System.Exit;
  end;

  if QR_pvmas.Active then
  begin
       with QR_pvmas do
            Delete;
  end;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_PVB4010A.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if FG_Ins1 then
  begin
       if MessageDlg('신규 등록 중입니다... 취소하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
            System.Exit;
  end;

  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);

  Hinsa_FieldDisplay(Self, QR_pvmas, 4, 11);
  FG_ins1 := False;
end;

procedure TFM_PVB4010A.BT_findClick(Sender: TObject);
begin
  case FG_CurTag of
     1 : begin
              FG_ins1 := False;
              PL_Select_Tag1;
         end;
     2 : begin
              FM_SubForm1.PL_Select_Tag2;
         end;
     3 : begin
              FM_SubForm2.PL_Select_Tag3;
         end;
  end;
end;

procedure TFM_PVB4010A.BT_insClick(Sender: TObject);
begin
  case FG_CurTag of
     1 : begin
              PL_Insert_Tag1;
         end;
     2 : begin
              FM_SubForm1.PL_Insert_Tag2;
         end;
     3 : begin
              FM_SubForm2.PL_Insert_Tag3;
         end;
  end;
end;

procedure TFM_PVB4010A.BT_saveClick(Sender: TObject);
begin
  if MessageDlg('데이타를 저장 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
       System.Exit;

  SB_Help.Panels[1].Text := '데이타 저장중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);
  case FG_CurTag of
     1 : begin
              if not PL_Check_Tag1 then
              begin
                   SB_Help.Panels[1].Text := '';
                   System.Exit;
              end;
              PL_Save_Tag1;
         end;
     2 : begin
              if not FM_SubForm1.PL_Check_Tag2 then
              begin
                   SB_Help.Panels[1].Text := '';
                   System.Exit;
              end;
              FM_SubForm1.PL_Save_Tag2;
         end;
     3 : begin
              if not FM_SubForm2.PL_Check_Tag3 then
              begin
                   SB_Help.Panels[1].Text := '';
                   System.Exit;
              end;
              FM_SubForm2.PL_Save_Tag3;
         end;
  end;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_PVB4010A.BT_delClick(Sender: TObject);
begin
  if MessageDlg('데이타를 삭제 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
       System.Exit;

  SB_Help.Panels[1].Text := '데이타 삭제중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);
  case FG_CurTag of
     1 : begin
              PL_Delete_Tag1;
         end;
     2 : begin
              FM_SubForm1.PL_Delete_Tag2;
         end;
     3 : begin
              FM_SubForm2.PL_Delete_Tag3;
         end;
  end;
  SB_Help.Panels[1].Text := '';
end;

end.
