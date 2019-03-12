{-------------------------------------------------------------------------------
  o 프로그램명 : 임원 부하의견조사 프로그램
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 평가
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2008.07.
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부

-------------------------------------------------------------------------------}
unit pez2020a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Db, DBAccess, Ora, Func, OnEditNumCtl, OnEditMdate,
  Grids, DBGrids, OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnShapeLabel, MemDS, OnLineLabel, OnGifimage, jpeg,
  OnEditMemo, OnRadioBtn, Pass, Tmax_session, Tmax_DataSetText, 
  OnInsaCommon, TmaxFunc;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    BT_Next: TOnFocusButton;
    BT_Prior: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_Send: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Help: TOnFocusButton;
    Pan_Help: TPanel;
    Panel15: TPanel;
    BT_HelpExit: TOnFocusButton;
    Label2: TLabel;
    Label5: TLabel;
    DataSource1: TDataSource;
    TMaxSession: TTMaxSession;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    L_Korname: TOnSectionLabel;
    L_Birth: TOnSectionLabel;
    L_Empdate: TOnSectionLabel;
    L_Payra: TOnSectionLabel;
    L_PayclDate: TOnSectionLabel;
    L_PayraDate: TOnSectionLabel;
    L_Rabasdate: TOnSectionLabel;
    L_Paycl: TOnSectionLabel;
    Shape2: TShape;
    Image1: TImage;
    OnSectionLabel4: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel6: TOnSectionLabel;
    E_LoginEmp: TOnEdit;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel5: TOnSectionLabel;
    TabSheet3: TTabSheet;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    Label4: TLabel;
    OnShapeLabel56: TOnShapeLabel;
    Label3: TLabel;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    OnShapeLabel14: TOnShapeLabel;
    OnShapeLabel15: TOnShapeLabel;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    OnShapeLabel9: TOnShapeLabel;
    OnShapeLabel10: TOnShapeLabel;
    OnShapeLabel11: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    OnMemo1: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo6: TOnMemo;
    OnMemo7: TOnMemo;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    OnMemo5: TOnMemo;
    OnMemo10: TOnMemo;
    E_Opinion1: TOnMemo;
    E_Opinion2: TOnMemo;
    RB2_5: TOnRadioButton;
    RB2_4: TOnRadioButton;
    RB2_3: TOnRadioButton;
    RB2_2: TOnRadioButton;
    RB2_1: TOnRadioButton;
    RB1_5: TOnRadioButton;
    RB1_4: TOnRadioButton;
    RB1_3: TOnRadioButton;
    RB1_2: TOnRadioButton;
    RB1_1: TOnRadioButton;
    OnMemo2: TOnMemo;
    OnMemo3: TOnMemo;
    TabSheet4: TTabSheet;
    OnShapeLabel18: TOnShapeLabel;
    OnShapeLabel19: TOnShapeLabel;
    Label1: TLabel;
    OnShapeLabel17: TOnShapeLabel;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel31: TOnShapeLabel;
    OnShapeLabel21: TOnShapeLabel;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel23: TOnShapeLabel;
    OnShapeLabel24: TOnShapeLabel;
    OnShapeLabel25: TOnShapeLabel;
    OnShapeLabel26: TOnShapeLabel;
    OnShapeLabel27: TOnShapeLabel;
    OnShapeLabel28: TOnShapeLabel;
    OnShapeLabel29: TOnShapeLabel;
    OnShapeLabel30: TOnShapeLabel;
    OnMemo11: TOnMemo;
    OnMemo12: TOnMemo;
    OnMemo13: TOnMemo;
    OnMemo14: TOnMemo;
    OnMemo15: TOnMemo;
    OnMemo16: TOnMemo;
    OnMemo17: TOnMemo;
    OnMemo18: TOnMemo;
    E_Opinion3: TOnMemo;
    E_Opinion4: TOnMemo;
    OnMemo20: TOnMemo;
    OnMemo21: TOnMemo;
    RB3_5: TOnRadioButton;
    RB3_4: TOnRadioButton;
    RB3_3: TOnRadioButton;
    RB3_2: TOnRadioButton;
    RB3_1: TOnRadioButton;
    RB4_5: TOnRadioButton;
    RB4_4: TOnRadioButton;
    RB4_3: TOnRadioButton;
    RB4_2: TOnRadioButton;
    RB4_1: TOnRadioButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    L_EmpList1: TPanel;
    L_EmpList2: TPanel;
    Label7: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TMaxDataSet: TTMaxDataSet;
    TMaxEmp: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BT_NextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_PriorClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure BT_HelpExitClick(Sender: TObject);
    procedure BT_SendClick(Sender: TObject);
    procedure E_LoginEmpChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_Opinion1Click(Sender: TObject);
    procedure E_Opinion3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
    procedure Read_SaveData;
    Function  NoInputCheck : Boolean;
  public
    { Public declarations }
     ParamSQL,   vLoginEmp,  vEvalNum,   vSendYN                : String;
     vRabasdate, vOrgnum,    vSysDate,   vEmpDept,   vPayduName : String;
     vScore11,   vScore12,   vScore13,   vScore14               : Integer;
     vScore21,   vScore22,   vScore23,   vScore24               : Integer;
     vScore31,   vScore32,   vScore33,   vScore34               : Integer;
     vOpinion11, vOpinion12, vOpinion13, vOpinion14             : String;
     vOpinion21, vOpinion22, vOpinion23, vOpinion24             : String;
     vOpinion31, vOpinion32, vOpinion33, vOpinion34             : String;
     vEvalEmp : Array[0..40] of String[5];
     vPosition : Boolean;
  end;

var
  FM_Main: TFM_Main;

implementation


{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_Help.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10); //'12.4.13.90'; //
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  // 정상실행여부체크
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  BT_HelpClick(Sender);

  SB_Help.Panels[1].Text := ' 평가하실 대상자를 선택하신후 작업을 진행하세요.';

  vPosition := True;   
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var i      : Integer;
begin
  vLoginEmp := Passemp(cmdline,1);

  if (Passemp(cmdline,1) <> '2245') and (Copy(Passemp(cmdline,1),1,1) <> 'D') then E_LoginEmp.Visible := False;
  if Length(E_LoginEmp.Text) = 4 then vLoginEmp := UpperCase(E_LoginEmp.Text);

  SB_Help.Panels[1].Text := '저장된 자료를 읽고 있습니다. 잠시만 기다려 주십시요..';

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vSysDate          := FM_Tmax.GetSysTime;   //ShowMessage(vSysDate);  
  //////////////////////////////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT rabasdate, orgnum, ''field3'', ''field4'',''field5'' '+
                   '  FROM PEZCPBAS                                             ';

       ClearFieldInfo;
       AddField('field1' , ftString,  100);
       AddField('field2' , ftString,  100);
       AddField('field3' , ftString,  100);
       AddField('field4' , ftString,  100);
       AddField('field5' , ftString,  100);
       Open;
       vRabasdate := Fields[0].AsString;
       Close;
  end;
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  with TMaxEmp do
  begin
       ServiceName := 'PEZ2000A_mas1';
       Close;
       Sql.Clear;
       Sql.Text := 'select ''1차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe1conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate           +'''           '+#13+
                   '   and upe1empno = '''+ vLoginEmp            +'''           '+#13+
                   ' Union                                                      '+#13+
                   'select ''2차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe2conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate           +'''           '+#13+
                   '   and upe2empno = '''+ vLoginEmp            +'''           '+#13+
                   ' Union                                                      '+#13+
                   'select ''3차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe3conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate           +'''           '+#13+
                   '   and upe3empno = '''+ vLoginEmp            +'''           '+#13+
                   ' Order by 7, 4, 2, 1                                        ';

       ClearFieldInfo;
       AddField('ENUM'    , ftString, 3);
       AddField('EMPNO'   , ftString, 4);
       AddField('KORNAME' , ftString, 20);
       AddField('PAYRA'   , ftString, 3);
       AddField('PAYCL'   , ftString, 3);
       AddField('PAYDUNM' , ftString, 30);
       AddField('CONYN'   , ftString, 6); 
       Open;

       //권한체크.
       if   (vLoginEmp <> '2245') and (Copy(vLoginEmp,1,1) <> 'D') then
       begin
            if TMaxEmp.RecordCount = 0 then
            begin
                 TMaxEmp.Close; 
                 ShowMessage('귀하께서 평가하실 대상자가 존재하지 않습니다.'+#13+#13+
                             '프로그램을 종료합니다.');
                 FM_Main.Close;
                 Exit;
            end;
       end;
  end;

  PageControl1.ActivePage := TabSheet1;

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.Read_SaveData;
var i      : Integer;
begin
  // 기 저장된 내역 Read ///////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2020A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,                                         '+#13+
                   '       score11  , score12  , score13  , score14  ,    '+#13+
                   '	   score21  , score22  , score23  , score24  ,    '+#13+
                   '       score31  , score32  , score33  , score34  ,    '+#13+
                   '	   opinion11, opinion12, opinion13, opinion14,    '+#13+
                   '	   opinion21, opinion22, opinion23, opinion24,    '+#13+
                   '	   opinion31, opinion32, opinion33, opinion34     '+#13+
                   '  from PEZUPMAS                                       '+#13+
                   ' where rabasdate = '''+ vRabasdate +'''               '+#13+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString+'''';

       ClearFieldInfo;
       AddField('EMPNO'    , ftString,  4);
       AddField('SCORE11'  , ftInteger, 1);
       AddField('SCORE12'  , ftInteger, 1);
       AddField('SCORE13'  , ftInteger, 1);
       AddField('SCORE14'  , ftInteger, 1);
       AddField('SCORE21'  , ftInteger, 1);
       AddField('SCORE22'  , ftInteger, 1);
       AddField('SCORE23'  , ftInteger, 1);
       AddField('SCORE24'  , ftInteger, 1);
       AddField('SCORE31'  , ftInteger, 1);
       AddField('SCORE32'  , ftInteger, 1);
       AddField('SCORE33'  , ftInteger, 1);
       AddField('SCORE34'  , ftInteger, 1);
       AddField('OPINION11', ftString, 400);
       AddField('OPINION12', ftString, 400);
       AddField('OPINION13', ftString, 400);
       AddField('OPINION14', ftString, 400);
       AddField('OPINION21', ftString, 400);
       AddField('OPINION22', ftString, 400);
       AddField('OPINION23', ftString, 400);
       AddField('OPINION24', ftString, 400);
       AddField('OPINION31', ftString, 400);
       AddField('OPINION32', ftString, 400);
       AddField('OPINION33', ftString, 400);
       AddField('OPINION34', ftString, 400);  
       Open;

       for i := 1 to 5 do
       begin
            if      vEvalNum = '1차' then
            begin
                 if FieldByName('SCORE11').AsInteger = i then TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE12').AsInteger = i then TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE13').AsInteger = i then TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE14').AsInteger = i then TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i))).Checked := True;
            end
            else if vEvalNum = '2차' then
            begin
                 if FieldByName('SCORE21').AsInteger = i then TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE22').AsInteger = i then TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE23').AsInteger = i then TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE24').AsInteger = i then TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i))).Checked := True;
            end
            else if vEvalNum = '3차' then
            begin
                 if FieldByName('SCORE31').AsInteger = i then TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE32').AsInteger = i then TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE33').AsInteger = i then TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i))).Checked := True;
                 if FieldByName('SCORE34').AsInteger = i then TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i))).Checked := True;
            end;
       end; //  showmessage(inttostr(vCapacity1));


       if      vEvalNum = '1차' then
       begin
            E_Opinion1.Text := FieldByName('Opinion11').AsString;
            E_Opinion2.Text := FieldByName('Opinion12').AsString;
            E_Opinion3.Text := FieldByName('Opinion13').AsString;
            E_Opinion4.Text := FieldByName('Opinion14').AsString;
       end
       else if vEvalNum = '2차' then
       begin
            E_Opinion1.Text := FieldByName('Opinion21').AsString;
            E_Opinion2.Text := FieldByName('Opinion22').AsString;
            E_Opinion3.Text := FieldByName('Opinion23').AsString;
            E_Opinion4.Text := FieldByName('Opinion24').AsString;
       end
       else if vEvalNum = '3차' then
       begin
            E_Opinion1.Text := FieldByName('Opinion31').AsString;
            E_Opinion2.Text := FieldByName('Opinion32').AsString;
            E_Opinion3.Text := FieldByName('Opinion33').AsString;
            E_Opinion4.Text := FieldByName('Opinion34').AsString;
       end;

       //기 저장내역 변수에 담기.
       vScore11   := FieldByName('SCORE11').AsInteger;
       vScore12   := FieldByName('SCORE12').AsInteger;
       vScore13   := FieldByName('SCORE13').AsInteger;
       vScore14   := FieldByName('SCORE14').AsInteger;
       vScore21   := FieldByName('SCORE21').AsInteger;
       vScore22   := FieldByName('SCORE22').AsInteger;
       vScore23   := FieldByName('SCORE23').AsInteger;
       vScore24   := FieldByName('SCORE24').AsInteger;
       vScore31   := FieldByName('SCORE31').AsInteger;
       vScore32   := FieldByName('SCORE32').AsInteger;
       vScore33   := FieldByName('SCORE33').AsInteger;
       vScore34   := FieldByName('SCORE34').AsInteger;
       vOpinion11 := FieldByName('Opinion11').AsString;
       vOpinion12 := FieldByName('Opinion12').AsString;
       vOpinion13 := FieldByName('Opinion13').AsString;
       vOpinion14 := FieldByName('Opinion14').AsString;
       vOpinion21 := FieldByName('Opinion21').AsString;
       vOpinion22 := FieldByName('Opinion22').AsString;
       vOpinion23 := FieldByName('Opinion23').AsString;
       vOpinion24 := FieldByName('Opinion24').AsString;
       vOpinion31 := FieldByName('Opinion31').AsString;
       vOpinion32 := FieldByName('Opinion32').AsString;
       vOpinion33 := FieldByName('Opinion33').AsString;
       vOpinion34 := FieldByName('Opinion34').AsString;

       Close;
  end;

  E_Opinion1.Font.Color := clBlack;
  E_Opinion2.Font.Color := clBlack;
  E_Opinion3.Font.Color := clBlack;
  E_Opinion4.Font.Color := clBlack;
  if Trim(E_Opinion1.Text) = '' then E_Opinion1.Text := '한글 기준 200자 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion2.Text) = '' then E_Opinion2.Text := '한글 기준 200자 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion3.Text) = '' then E_Opinion3.Text := '한글 기준 200자 등록 가능합니다 (Max 400Byte)';
  if Trim(E_Opinion4.Text) = '' then E_Opinion4.Text := '한글 기준 200자 등록 가능합니다 (Max 400Byte)';
  if Pos('(Max 400Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Font.Color := clGray;
  if Pos('(Max 400Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Font.Color := clGray;
  if Pos('(Max 400Byte)',E_Opinion3.Text) > 0 then E_Opinion3.Font.Color := clGray;
  if Pos('(Max 400Byte)',E_Opinion4.Text) > 0 then E_Opinion4.Font.Color := clGray;
end;

procedure TFM_Main.BT_NextClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet1  then PageControl1.ActivePage := TabSheet2
  else if PageControl1.ActivePage = TabSheet2  then PageControl1.ActivePage := TabSheet3
  else if PageControl1.ActivePage = TabSheet3  then PageControl1.ActivePage := TabSheet4;

  PageControl1Change(Sender);
end;

procedure TFM_Main.BT_PriorClick(Sender: TObject);
begin
  if      PageControl1.ActivePage = TabSheet4  then PageControl1.ActivePage := TabSheet3
  else if PageControl1.ActivePage = TabSheet3  then PageControl1.ActivePage := TabSheet2
  else if PageControl1.ActivePage = TabSheet2  then PageControl1.ActivePage := TabSheet1;

  PageControl1Change(Sender);
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  if      PageControl1.ActivePage =  TabSheet1 then BT_Prior.Enabled := False;
  if      PageControl1.ActivePage =  TabSheet4 then BT_Next.Enabled  := False;
  if      PageControl1.ActivePage <> TabSheet1 then BT_Prior.Enabled := True;
  if      PageControl1.ActivePage <> TabSheet4 then BT_Next.Enabled  := True;

  if vPosition = True then FM_Main.Top := FM_Main.Top - 5;
  if vPosition = True then vPosition := False;
    
  L_EmpList1.Caption := ' [ 피평가자 인적사항 ]  ' + vPayduName;
  L_EmpList2.Caption := ' [ 피평가자 인적사항 ]  ' + vPayduName;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
    i, vCnt  : Integer;
    FL_Comp  : TOnRadioButton;
begin
  if vSendYN <> 'Y' then
  begin
       if MessageDlg('평가한 내역을 저장하시겠습니까? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  end;

  if Pos('(Max 400Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Text := '';
  if Pos('(Max 400Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Text := '';
  if Pos('(Max 400Byte)',E_Opinion3.Text) > 0 then E_Opinion3.Text := '';
  if Pos('(Max 400Byte)',E_Opinion4.Text) > 0 then E_Opinion4.Text := '';
  //////////////////////////////////////////////////////////////////////////////
  for i := 1 to 5 do
  begin
       FL_Comp := nil;
       if      vEvalNum = '1차' then
       begin
            FL_Comp := TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore11 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore12 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore13 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore14 := FL_Comp.Tag;
       end
       else if vEvalNum = '2차' then
       begin
            FL_Comp := TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore21 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore22 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore23 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore24 := FL_Comp.Tag;
       end
       else if vEvalNum = '3차' then
       begin
            FL_Comp := TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore31 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore32 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore33 := FL_Comp.Tag;

            FL_Comp := TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i)));
            if (FL_Comp <> nil) and (FL_Comp.Checked) then vScore34 := FL_Comp.Tag;
       end;
  end;

  if      vEvalNum = '1차' then
  begin
       vOpinion11 := E_Opinion1.Text;
       vOpinion12 := E_Opinion2.Text;
       vOpinion13 := E_Opinion3.Text;
       vOpinion14 := E_Opinion4.Text;
  end
  else if vEvalNum = '2차' then
  begin
       vOpinion21 := E_Opinion1.Text;
       vOpinion22 := E_Opinion2.Text;
       vOpinion23 := E_Opinion3.Text;
       vOpinion24 := E_Opinion4.Text;
  end
  else if vEvalNum = '3차' then
  begin
       vOpinion31 := E_Opinion1.Text;
       vOpinion32 := E_Opinion2.Text;
       vOpinion33 := E_Opinion3.Text;
       vOpinion34 := E_Opinion4.Text;
  end;          

  //////////////////////////////////////////////////////////////////////////////

  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT count(*), ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM PEZUPMAS                                                '+
                   ' WHERE rabasdate = '''+ vRabasdate +'''                        '+
                   '   AND empno     = '''+ TMaxEmp.Fields[1].AsString +'''        ';

       ClearFieldInfo;
       AddField('field1' , ftString,  100);
       AddField('field2' , ftString,  100);
       AddField('field3' , ftString,  100);
       AddField('field4' , ftString,  100);
       AddField('field5' , ftString,  100);
       Open;
       vCnt := Fields[0].AsInteger;
  end;

  if   vCnt = 0 then
  begin
       ParamSQL := 'Insert into PEZUPMAS                    '+#13+
                   '  values                                '+#13+
                   '( '''+ vRabasdate                 +''', '+#13+
                   '  '''+ TMaxEmp.Fields[1].AsString +''', '+#13+
                   '  '''+ IntToStr(vScore11)         +''', '+#13+
                   '  '''+ IntToStr(vScore12)         +''', '+#13+
                   '  '''+ IntToStr(vScore13)         +''', '+#13+
                   '  '''+ IntToStr(vScore14)         +''', '+#13+
                   '  '''+ IntToStr(vScore21)         +''', '+#13+
                   '  '''+ IntToStr(vScore22)         +''', '+#13+
                   '  '''+ IntToStr(vScore23)         +''', '+#13+
                   '  '''+ IntToStr(vScore24)         +''', '+#13+
                   '  '''+ IntToStr(vScore31)         +''', '+#13+
                   '  '''+ IntToStr(vScore32)         +''', '+#13+
                   '  '''+ IntToStr(vScore33)         +''', '+#13+
                   '  '''+ IntToStr(vScore34)         +''', '+#13+
                   '  '''+ vOpinion11                 +''', '+#13+
                   '  '''+ vOpinion12                 +''', '+#13+
                   '  '''+ vOpinion13                 +''', '+#13+
                   '  '''+ vOpinion14                 +''', '+#13+
                   '  '''+ vOpinion21                 +''', '+#13+
                   '  '''+ vOpinion22                 +''', '+#13+
                   '  '''+ vOpinion23                 +''', '+#13+
                   '  '''+ vOpinion24                 +''', '+#13+
                   '  '''+ vOpinion31                 +''', '+#13+
                   '  '''+ vOpinion32                 +''', '+#13+
                   '  '''+ vOpinion33                 +''', '+#13+
                   '  '''+ vOpinion34                 +''', '+#13+
                   '  '''+ vLoginEmp                  +''', '+#13+
                   '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''))  ';
  end
  else
  begin
       ParamSQL := 'Update PEZUPMAS                                               '+#13+
                   '   Set Score11    = '''+ IntToStr(vScore11)             +''', '+#13+
                   '       Score12    = '''+ IntToStr(vScore12)             +''', '+#13+
                   '       Score13    = '''+ IntToStr(vScore13)             +''', '+#13+
                   '       Score14    = '''+ IntToStr(vScore14)             +''', '+#13+
                   '       Score21    = '''+ IntToStr(vScore21)             +''', '+#13+
                   '       Score22    = '''+ IntToStr(vScore22)             +''', '+#13+
                   '       Score23    = '''+ IntToStr(vScore23)             +''', '+#13+
                   '       Score24    = '''+ IntToStr(vScore24)             +''', '+#13+
                   '       Score31    = '''+ IntToStr(vScore31)             +''', '+#13+
                   '       Score32    = '''+ IntToStr(vScore32)             +''', '+#13+
                   '       Score33    = '''+ IntToStr(vScore33)             +''', '+#13+
                   '       Score34    = '''+ IntToStr(vScore34)             +''', '+#13+
                   '       Opinion11  = '''+ vOpinion11                     +''', '+#13+
                   '       Opinion12  = '''+ vOpinion12                     +''', '+#13+
                   '       Opinion13  = '''+ vOpinion13                     +''', '+#13+
                   '       Opinion14  = '''+ vOpinion14                     +''', '+#13+
                   '       Opinion21  = '''+ vOpinion21                     +''', '+#13+
                   '       Opinion22  = '''+ vOpinion22                     +''', '+#13+
                   '       Opinion23  = '''+ vOpinion23                     +''', '+#13+
                   '       Opinion24  = '''+ vOpinion24                     +''', '+#13+
                   '       Opinion31  = '''+ vOpinion31                     +''', '+#13+
                   '       Opinion32  = '''+ vOpinion32                     +''', '+#13+
                   '       Opinion33  = '''+ vOpinion33                     +''', '+#13+
                   '       Opinion34  = '''+ vOpinion34                     +''', '+#13+
                   '       writeman   = '''+ vLoginEmp                      +''', '+#13+
                   '       writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')       '+#13+
                   ' Where Rabasdate  = '''+ vRabasdate                     +'''  '+#13+
                   '   And Empno      = '''+ TMaxEmp.Fields[1].AsString     +'''  ';
  end;
  TMaxDataSet.Close;

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);  

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  if vSendYN <> 'Y' then MessageDlg(' 저장이 완료되었습니다. ', mtConfirmation, [mbOk], 0);
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 저장 완료';
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  Pan_Help.Top     := 200;
  Pan_Help.Left    := 155;
  Pan_Help.Visible := True;
end;

procedure TFM_Main.BT_HelpExitClick(Sender: TObject);
begin
  Pan_Help.Visible := False;
end;                            

procedure TFM_Main.BT_SendClick(Sender: TObject);
var
   SavePlace: TBookmark;
begin
  if MessageDlg('해당 임원에 대한 의견조사를 완료하시겠습니까? '+#13+#13+
                '의견조사 완료후에는 수정이 불가능합니다.      ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  SavePlace := TMaxEmp.GetBookmark;

  vSendYN := 'Y';
  BT_SaveClick(nil);             //최종 내역 자동 저장

  if not NoInputCheck then Exit; //입력 체크.

                  
  ParamSQL := 'Update pezcamas ';

  if      vEvalNum = '1차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set upe1conyn   = ''Y''                            ,  '+#13+
              '       upe1condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end
  else if vEvalNum = '2차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set upe2conyn   = ''Y''                            ,  '+#13+
              '       upe2condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end
  else if vEvalNum = '3차' then
  begin
       ParamSQL := ParamSQL +#13+
              '   Set upe3conyn   = ''Y''                            ,  '+#13+
              '       upe3condate = TO_CHAR(SYSDATE,''YYYYMMDD'')    ,  ';
  end;

  ParamSQL := ParamSQL +#13+
              '       writeman     = '''+ vLoginEmp                   +''','+#13+
              '       writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')   '+#13+
              ' Where Rabasdate    = '''+ vRabasdate                  +''' '+#13+
              '   And Empno        = '''+ TMaxEmp.Fields[1].AsString  +''' ';

  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);    

       if not TMaxDataSet.Execute then
       begin
            ShowMessage(' 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;

  TMaxEmp.Close;
  TMaxEmp.Open;
  TMaxEmp.GotoBookmark(SavePlace);
  TMaxEmp.FreeBookmark(SavePlace);

  BT_Save.Enabled := False;
  BT_Send.Enabled := False;

  PageControl1.ActivePage := TabSheet1;
  MessageDlg(' 의견조사 완료 되었습니다. ', mtConfirmation, [mbOk], 0);
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 의견조사 완료. ';
end;

procedure TFM_Main.E_LoginEmpChange(Sender: TObject);
begin
  if Length(E_LoginEmp.Text) = 4 then  FormShow(Sender);
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
var i      : Integer;
begin                  
  SB_Help.Panels[1].Text := '';

  //////////////////////////////////////////////////////////////////////////////
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas1';
       Close;
       Sql.Clear;
       Sql.Text := 'select ''1차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe1conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate                 +'''     '+#13+
                   '   and upe1empno = '''+ vLoginEmp                  +'''     '+#13+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString +'''     '+#13+
                   ' Union                                                      '+#13+
                   'select ''2차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe2conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate                 +'''     '+#13+
                   '   and upe2empno = '''+ vLoginEmp                  +'''     '+#13+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString +'''     '+#13+
                   ' Union                                                      '+#13+
                   'select ''3차'' enum, empno, korname, payra, paycl, paydunm, '+#13+
                   '       decode(upe3conyn,''Y'',''완료'',''미완료'')          '+#13+
                   '  from pezcamas                                             '+#13+
                   ' where rabasdate = '''+ vRabasdate                 +'''     '+#13+
                   '   and upe3empno = '''+ vLoginEmp                  +'''     '+#13+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString +'''     '+#13+
                   ' Order by 5, 6, 2, 1                                        ';

       ClearFieldInfo;
       AddField('ENUM'    , ftString, 3);
       AddField('EMPNO'   , ftString, 4);
       AddField('KORNAME' , ftString, 20);
       AddField('PAYRA'   , ftString, 3);
       AddField('PAYCL'   , ftString, 3);
       AddField('PAYDUNM' , ftString, 30);
       AddField('CONYN'   , ftString, 6);
       Open;

       if RecordCount <= 1 then
       begin
            vEvalNum   := Fields[0].AsString;

            BT_Save.Enabled := True;
            BT_Send.Enabled := True;
            if   Fields[6].AsString = '완료' then
            begin
                 BT_Save.Enabled := False;
                 BT_Send.Enabled := False;
                 //MessageDlg(' 해당 임원에 대한 의견조사를 완료하여 열람만 가능합니다.', mtConfirmation, [mbOk], 0);
                 SB_Help.Panels[1].Text := '해당 임원에 대한 평가를 완료하여 열람만 가능합니다.';
            end;
       end
       else ShowMessage(IntToStr(RecordCount)+'건. 담당자에게 문의 바랍니다');
  end;
  //////////////////////////////////////////////////////////////////////////////

  //초기화..
  for i := 1 to 5 do
  begin
       TOnRadioButton(Self.FindComponent('RB1_'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB2_'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB3_'+IntToStr(i))).Checked := False;
       TOnRadioButton(Self.FindComponent('RB4_'+IntToStr(i))).Checked := False;
  end;

  //////////////////////////////////////////////////////////////////////////////

  //임원평가 마스터 Read..
  with TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas2';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno, korname, juminid, empdate, paydunm, orgnum,                                     '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.deptcode) deptname, '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.jobdept ) jobdeptnm,'+
                   '      (select codename from pyccode where codeid= ''I112'' and codeno  =a.paycl   ) payclnm,  '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.payra   ) payranm,  '+
                   '       cpaycldate,   cpayradate,   selfyn,    selfconyn,    selfcondate,                      '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe1payra) e1payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe2payra) e2payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe3payra) e3payra, '+
                   '       dwe1empno, dwe1korname, dwe1conyn, dwe1condate, dwe1objyn, dwe1objdate,                '+
                   '       dwe2empno, dwe2korname, dwe2conyn, dwe2condate, dwe2objyn, dwe2objdate,                '+
                   '       dwe3empno, dwe3korname, dwe3conyn, dwe3condate                                         '+
                   '  from PEZCAMAS A                                                                             '+
                   ' where rabasdate = '''+ vRabasdate                  +'''                                      '+
                   '   and empno     = '''+ TMaxEmp.Fields[1].AsString  +'''                                      ';

       ClearFieldInfo;
       AddField('EMPNO'       , ftString, 4);
       AddField('KORNAME'     , ftString, 20);
       AddField('JUMINID'     , ftString, 14);
       AddField('EMPDATE'     , ftString, 8);
       AddField('PAYDUNM'     , ftString, 30);
       AddField('ORGNUM'      , ftString, 3);
       AddField('DEPTNAME'    , ftString, 60);
       AddField('JOBDEPTNM'   , ftString, 60);
       AddField('PAYCLNM'     , ftString, 20);
       AddField('PAYRANM'     , ftString, 20);
       AddField('CPAYCLDATE'  , ftString, 18);
       AddField('CPAYRADATE'  , ftString, 18);
       AddField('SELFYN'      , ftString, 1);
       AddField('SELFCONYN'   , ftString, 1);
       AddField('SELFCONDATE' , ftString, 14);
       AddField('E1PAYRA'     , ftString, 20);
       AddField('E2PAYRA'     , ftString, 20);
       AddField('E3PAYRA'     , ftString, 20);
       AddField('E1EMPNO'     , ftString, 4);
       AddField('E1KORNAME'   , ftString, 20);
       AddField('E1CONYN'     , ftString, 1);
       AddField('E1CONDATE'   , ftString, 8);
       AddField('E1OBJYN'     , ftString, 1);
       AddField('E1OBJDATE'   , ftString, 8);
       AddField('E2EMPNO'     , ftString, 4);
       AddField('E2KORNAME'   , ftString, 20);
       AddField('E2CONYN'     , ftString, 1);
       AddField('E2CONDATE'   , ftString, 8);
       AddField('E2OBJYN'     , ftString, 1);
       AddField('E2OBJDATE'   , ftString, 8);
       AddField('E3EMPNO'     , ftString, 4);
       AddField('E3KORNAME'   , ftString, 20);
       AddField('E3CONYN'     , ftString, 1);
       AddField('E3CONDATE'   , ftString, 8);
       Open;

       L_Korname.Caption     := '성          명 :   ' + FieldByName('KORNAME').AsString;
       L_Payra.Caption       := '직          책 :   ' + FieldByName('PAYRANM').AsString;
       //L_PayclDate.Caption   := '현BAND 승진일 :   ' + Hinsa_DisplayDate(FieldByName('CPAYCLDATE').AsString,'-');
       L_Paycl.Caption       := '직    무    명 :   ' + FieldByName('PAYDUNM').AsString;

       //L_Birth.Caption       := '생  년  월  일   : ' + Hinsa_DisplayDate('19'+FieldByName('JUMINID').AsString,'-');
       //L_Empdate.Caption     := '입  사  일  자   : ' + Hinsa_DisplayDate(FieldByName('EMPDATE').AsString,'-');
       //L_PayraDate.Caption := '현직책/직무보임일: ' + FieldByName('CPAYRADATE').AsString;
       L_Rabasdate.Caption   := '평  가  일  자   : ' + Hinsa_DisplayDate(vSysDate,'-');
       vPayduName            := FieldByName('KORNAME').AsString + ' - ' +
                                FieldByName('PAYCLNM').AsString + ' - ' +
                                FieldByName('PAYDUNM').AsString;
       Close;
  end;

  Read_SaveData; //기 저장내역 Read...
end;

procedure TFM_Main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDbGrid(Sender) do
  begin    //if State = [gdSelected] then Canvas.Font.Color := clRed;
       if   DbGrid1.Fields[4].AsString = '완료' then Canvas.Font.Color := clBlue;
       DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

Function TFM_Main.NoInputCheck : Boolean;
var iCnt : Integer;
begin
  Read_SaveData;

  iCnt := 0;
  Result := False;

  TMaxDataSet.Open;
  with TMaxDataSet do
  begin
       if   ((vEvalNum = '1차') and (FieldByName('Score11').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Score21').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Score31').AsInteger < 1)) then
       begin
            ShowMessage('기업관 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet3;   Exit;
       end;
       if   ((vEvalNum = '1차') and (FieldByName('Score12').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Score22').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Score32').AsInteger < 1)) then
       begin
            ShowMessage('인력활용 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet3;   Exit;
       end;
       if   ((vEvalNum = '1차') and (FieldByName('Score13').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Score23').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Score33').AsInteger < 1)) then
       begin
            ShowMessage('SUPEX 추구 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet4;   Exit;
       end;
       if   ((vEvalNum = '1차') and (FieldByName('Score14').AsInteger < 1)) or
            ((vEvalNum = '2차') and (FieldByName('Score24').AsInteger < 1)) or
            ((vEvalNum = '3차') and (FieldByName('Score34').AsInteger < 1)) then
       begin
            ShowMessage('변화선도 항목의 평가가 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet4;   Exit;
       end;
       { 의견등록 체크는 생략 요청.
       if FieldByName('Opinion1').AsString = '' then
       begin
            ShowMessage('기업관 항목의 의견등록이 누락되었습니다. 확인 바랍니다.');
            PageControl1.ActivePage := TabSheet7;   Exit;
       end;}
  end;
  Result := True;//if iCnt > 0 then  ShowMessage(IntToStr(iCnt)+'건의 평가가 누락되어 있습니다. 확인후 완료하시기 바랍니다.');
end;

procedure TFM_Main.E_Opinion1Click(Sender: TObject);
begin                    
  if Pos('(Max 400Byte)',E_Opinion1.Text) > 0 then E_Opinion1.Text := '';
  if Pos('(Max 400Byte)',E_Opinion2.Text) > 0 then E_Opinion2.Text := '';
  E_Opinion1.Font.Color := clBlack;
  E_Opinion2.Font.Color := clBlack;
end;

procedure TFM_Main.E_Opinion3Click(Sender: TObject);
begin
  if Pos('(Max 400Byte)',E_Opinion3.Text) > 0 then E_Opinion3.Text := '';
  if Pos('(Max 400Byte)',E_Opinion4.Text) > 0 then E_Opinion4.Text := '';
  E_Opinion3.Font.Color := clBlack;
  E_Opinion4.Font.Color := clBlack;
end;


end.

