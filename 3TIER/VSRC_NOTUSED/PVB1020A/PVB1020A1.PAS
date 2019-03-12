{-------------------------------------------------------------------------------
  o 프로그램명  : 방문정보등록(PVB1020A)
  o 시스템명    : 종합인사정보시스템
  o 부시스템명  : 방문자 예약시스템
  o 작성자      :
  o 버전        : 1.97
  o 작성일자    :
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부
    1.97 2013.04.09 지순미   주민번호 삭제 요청         SR-1304-0356
-------------------------------------------------------------------------------}
unit pvb1020a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, ComCtrls, OnSkinBtn,
  OnOneInstance, Tmax_session, OnInsaCommon, Tmax_DataSetText, DB,
  OnShapeLabel, OnEditStdCtrl, OnLineLabel, OnEditCombo, OnEditBaseCtrl,
  OnEditBtnCtrl, OnEditMdate, OnDBGrid, ImgList, OnCalendarUtil,
  OnTmaxCodeEdit, TmaxFunc;

type
  TFM_PVB1020A = class(TForm)
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
    PA_Work: TPanel;
    ED_off_datefr: TOnDateEdit;
    Label1: TLabel;
    ED_off_dateto: TOnDateEdit;
    ED_v_infoyn: TOnComboEdit;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    ED_off_empno: TOnEdit;
    ED_sec_empno: TOnEdit;
    ED_v_korname: TOnEdit;
    Grid1: TOnDBGrid;
    DataSource1: TDataSource;
    QR_book: TTMaxDataSet;
    ImageList1: TImageList;
    Shape1: TShape;
    Label2: TLabel;
    BT_visit: TOnFocusButton;
    BT_vins: TOnFocusButton;
    BT_novisit: TOnFocusButton;
    ED_v_cardno: TOnEdit;
    ED_jobplace: TTMaxCodePopupEdit;
    TDS1: TTMaxDataSet;
    ED_v_cardinyn: TOnComboEdit;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_Tab1Click(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure FindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid1DblClick(Sender: TObject);
    procedure ED_v_infoynGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
    procedure BT_visitClick(Sender: TObject);
    procedure BT_vinsClick(Sender: TObject);
    procedure BT_novisitClick(Sender: TObject);
    procedure ED_v_cardinynGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
  private
    { Private declarations }
    FL_Start   : Boolean;
    FG_CurTag  : Integer;
    FG_pempno  : String;
    FG_pkorname: String;
    FG_grade   : String;
    FG_Loading : Boolean;
    FG_Date    : String;

    procedure PL_Select_bookvisit;
  public
    { Public declarations }
    procedure PL_ShowPanel(APanel: TPanel);
  end;

var
  FM_PVB1020A: TFM_PVB1020A;

implementation

uses On_pvvistlist;

{$R *.DFM}

procedure TFM_PVB1020A.PL_ShowPanel(APanel: TPanel);
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

procedure TFM_PVB1020A.FormCreate(Sender: TObject);
begin
  FM_SubForm1 := nil;
  FL_Start    := True;
  FG_Loading  := False;
end;

procedure TFM_PVB1020A.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  FL_Dat  : String;
begin
  if FL_Start then
    begin
      FG_Loading := True;
      FL_Start := not FL_Start;
      SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
      Self.SetBounds(FL_Rect.Top + 10, FL_Rect.Left + 20, Self.Width, Self.Height);
      SF_Main.Refresh;

      Application.ProcessMessages;

      ///////////////////////////////////////////////////////////////////////
      TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
      TMaxSession.LabelName   := 'HANAROHPER';
      TMaxSession.Connect     := False;
      TMaxSession.Host        := Hinsa_Param(cmdline,10);
      TMaxSession.Port        := '9999';

      try
           TMaxSession.Connect := True;
      except
           Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
           Application.Terminate;
           Exit;
      end;
      ///////////////////////////////////////////////////////////////////////
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      FG_Date           := FM_Tmax.GetData('sysdate','','');
      ///////////////////////////////////////////////////////////////////////

      // 이부분서부터 업무관련 초기화 부분 코딩 처리...
      FG_pempno  := Hinsa_Param(CmdLine,1);
      FG_pkorname:= Hinsa_Param(CmdLine,2);
      FG_Grade   := Hinsa_Param(CmdLine,4);
      FG_Loading := False;
      SB_Tab1Click(SB_Tab1);

      //from일에도 오늘날짜가 뜨게 수정 2004.7.14.
      //  ED_off_datefr.NoFormatDate := GetDateMinus(Copy(FL_Dat,1,8), -30);
      ED_off_datefr.NoFormatDate := Copy(FG_Date,1,8);
      ED_off_dateto.NoFormatDate := Copy(FG_Date,1,8);

      //검색조건에 근무지 추가 start 2004.7.6.
      with TDS1 do
        begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := 'select jobplace , ''field2'', ''field3'', ''field4'',''field5''   '+
                      '  from pvpimpmas                        '+
                      ' where empno = '''+FG_pempno+'''    ';

          ClearFieldInfo;
          AddField('jobplace'  , ftString,  100);
          AddField('field2'    , ftString,  100);
          AddField('field3'    , ftString,  100);
          AddField('field4'    , ftString,  100);
          AddField('field5'    , ftString,  100);
          Open;
        end;
      ED_jobplace.Text := TDS1.FieldByName('jobplace').AsString;
      ED_jobplace.PL_get_singledata;
      //근무지 추가 end

      BT_findClick(Sender);
    end;
end;

procedure TFM_PVB1020A.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_PVB1020A.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_PVB1020A.SB_Tab1Click(Sender: TObject);
begin
  if FG_Loading then
    System.Exit;

  if FG_visitinsert then
    begin
      if MessageDlg('방문자 추가등록 중입니다... 취소하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
        System.Exit;
      FG_visitinsert := False;  
    end; 

  FG_Loading := True;
  FG_CurTag := TComponent(Sender).Tag;
  case TComponent(Sender).Tag of
   1 : begin
         PL_ShowPanel(PA_Work);
         ED_off_datefr.SetFocus;
         BT_find.Enabled    := True;
         BT_vins.Enabled    := False;
         BT_novisit.Enabled := False;
         BT_visit.Enabled   := False;
         BT_findClick(Sender);
       end;
   2 : begin
         if not QR_book.Active then
           begin
             MessageDlg('열람하고자 하는 방문정보를 선택하세요...', mtInformation, [mbOK], 0);
             Grid1.SetFocus;
             FG_Loading := False;
             System.Exit;
           end;

         if QR_book.FieldByName('v_id').AsString = '' then
           begin
             MessageDlg('열람하고자 하는 방문정보를 선택하세요...', mtInformation, [mbOK], 0);
             Grid1.SetFocus;
             FG_Loading := False;
             System.Exit;
           end;

         SB_Help.Panels[1].Text := ' 방문정보를 읽고 있는 중입니다... 잠시만 기다리세요...';
         SB_Help.Perform(WM_PAINT,0,0);

         if FM_SubForm1 = nil then
           Application.CreateForm(TFM_SubForm1, FM_SubForm1);
         FM_SubForm1.Insa_Session := TmaxSession;
         FM_SubForm1.FG_empno     := FG_pempno;
         FM_SubForm1.FG_v_id      := QR_book.FieldByName('v_id').AsString;
         FM_SubForm1.FG_Button    := False;
         PL_ShowPanel(FM_SubForm1.PA_Work);

         FM_SubForm1.PL_InitForm;
         SB_Help.Panels[1].Text := '';
         BT_find.Enabled     := False;
         BT_vins.Enabled     := True;
         BT_novisit.Enabled  := True;
         BT_visit.Enabled    := True;
       end;
  end;

  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  FG_Loading := False;
end;

procedure TFM_PVB1020A.BT_findClick(Sender: TObject);
begin
  PL_Select_bookvisit;
end;

procedure TFM_PVB1020A.PL_Select_bookvisit;
begin
  with QR_book do
    begin
      Close;
      ServiceName := 'PVB1010A_lbook';
      Sql.Text := 'SELECT                                    '+
                  '    A.v_id        ,                       '+
                  '    (A.off_date||SUBSTR(A.off_time,1,4)), '+
                  '    (A.off_empno||''-''||D.korname),      '+
                  '    (A.sec_empno||''-''||C.korname),      '+
                  '    A.placecode ,                         '+
                  '    (A.off_indatefr||A.off_intimefr),     '+
                  '    (A.off_indateto||A.off_intimeto),     '+
                  '    A.v_pcid      ,                       '+
                  '    B.v_pcname    ,                       '+
                  '    DECODE(A.v_pcid,''9999'',A.v_propose,B.v_pcname),    '+
                  '    A.v_infoyn                            '+
                  '  FROM pvprolist B, pvpimpmas C, pvpimpmas D, pvbookvisit A  ';
       if ED_v_korname.Text <> '' then
         begin
           Sql.Text := Sql.Text +
                       Format(', (SELECT DISTINCT A.v_id FROM pvvisitlist A, pvperson B '+
                              '    WHERE B.v_korname LIKE ''%s''   '+
                              '      AND A.v_pid = B.v_pid(+)      '+
                              '   ) E  ',[ED_v_korname.Text+'%']);
         end;
       Sql.Text := Sql.Text +
//검색조건 변경 2004.7.14  신청일을 출입요청일로...        
//                   Format(' WHERE (A.off_date >= ''%s'' AND A.off_date <= ''%s'')   '+
//검색조건 변경 2012.03.07 출입요청일 구간을 => 출입요청일이 포함된 모든 방문예약자료로
//                   Format(' WHERE (A.off_indatefr >= ''%s'' AND A.off_indatefr <= ''%s'') ', [ED_off_datefr.NoFormatDate, ED_off_dateto.NoFormatDate]) +
                   Format(' WHERE (''%s'' between A.off_indatefr AND A.off_indateto )',[ED_off_datefr.NoFormatDate])+
                          '   AND A.v_pcid    = B.v_pcid(+) '+
                          '   AND A.sec_empno = C.empno(+)  '+
                          '   AND A.off_empno = D.empno(+)  ';

{
                   Format(' WHERE (''%s'' Between A.off_indatefr AND A.off_indatefr)   '+
                          '   AND A.v_infoyn  = ''%s''      '+
                          '   AND A.v_pcid    = B.v_pcid(+) '+
                          '   AND A.sec_empno = C.empno(+)  '+
                          '   AND A.off_empno = D.empno(+)  ',
                   [ED_off_datefr.NoFormatDate, ED_v_infoyn.Text]);
}
      if ED_v_infoyn.itemindex <> 0 then
         Sql.Text := Sql.Text +  Format('   AND A.v_infoyn  = ''%s''      ',[ED_v_infoyn.Text]);
      if ED_v_korname.Text <> '' then
         Sql.Text := Sql.Text + ' AND A.v_id      = E.v_id  ';
      if ED_off_empno.Text <> '' then
        Sql.Text := Sql.Text + Format(' AND D.korname = ''%s''  ', [ED_off_empno.Text]);
      if ED_sec_empno.Text <> '' then
        Sql.Text := Sql.Text + Format(' AND C.korname = ''%s''  ', [ED_sec_empno.Text]);
      if ED_v_cardno.Text <> '' then
//        Sql.Text := Sql.Text + Format(' AND A.v_id = (SELECT DISTINCT v_id FROM pvvisitlist '+
        Sql.Text := Sql.Text + Format(' AND A.v_id in (SELECT DISTINCT v_id FROM pvvisitlist '+
                                      '                WHERE v_cardno = ''%s'')  ', [ED_v_cardno.Text]);
      //검색조건에 근무지 추가 start 2004.7.6
      if ED_jobplace.Text <> '' then
        Sql.Text := Sql.Text + Format(' AND A.placecode = ''%s''  ', [ED_jobplace.Codeno]);
      // end

      //검색조건에 방문증정보(불출, 회수, 미회수) 추가 2004.7.13.
      if ED_v_cardinyn.ItemIndex <> 0 then
        Sql.Text := Sql.Text + Format(' AND A.v_id in (SELECT DISTINCT v_id FROM pvvisitlist '+
                                      '                WHERE v_cardinyn = ''%s'')  ', [ED_v_cardinyn.Text]);
      //추가 end

      Sql.Text := Sql.Text + ' ORDER BY A.off_date DESC, A.off_time DESC, A.off_indatefr DESC ';
      Open;

      edit1.Text := Sql.Text;
      FieldByName('off_date').EditMask     := '0000년00월00일 00:00;0;';
      FieldByName('off_indatefr').EditMask := '0000년00월00일 00:00;0;';
      FieldByName('off_indateto').EditMask := '0000년00월00일 00:00;0;';
    end;
end;

procedure TFM_PVB1020A.FindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
       BT_findClick(Sender);
       Key := 0;
    end;
end;

procedure TFM_PVB1020A.Grid1DblClick(Sender: TObject);
begin
  SB_Tab1Click(SB_Tab2);
end;

procedure TFM_PVB1020A.ED_v_infoynGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_PVB1020A.BT_visitClick(Sender: TObject);
begin
  if MessageDlg('방문자 출입정보를 저장 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
    System.Exit;
  SB_Help.Panels[1].Text := ' 방문자 출입정보를 저장 있는 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  FM_SubForm1.FG_infoyn := '방문';
  if FG_visitinsert then
    FM_SubForm1.PL_Save_pvvisitlist('추가')
  else if not FG_visitinsert then
    FM_SubForm1.PL_Save_pvvisitlist('수정');

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_PVB1020A.BT_vinsClick(Sender: TObject);
begin
  FG_visitinsert := True;
  FM_SubForm1.ED_v_korname.Enabled := True;
  
  Hinsa_InitComponent(FM_SubForm1,22);
  Hinsa_InitComboBox(FM_SubForm1,22,-1);

  Hinsa_InitComponent(FM_SubForm1,33);
  Hinsa_InitComboBox(FM_SubForm1,33,-1);
end;

procedure TFM_PVB1020A.BT_novisitClick(Sender: TObject);
begin
  if MessageDlg('미방문자로 처리 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
    System.Exit;

  SB_Help.Panels[1].Text := ' 미방문자로 처리 중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  FM_SubForm1.FG_infoyn := '미방문';
  FM_SubForm1.PL_Save_pvvisitlist('미방문');
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_PVB1020A.ED_v_cardinynGetImageIndex(Sender: TObject;
  const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

end.
