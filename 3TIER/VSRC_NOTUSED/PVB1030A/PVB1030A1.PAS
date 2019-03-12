{-------------------------------------------------------------------------------
  o 프로그램명  : 방문결과 조회 및 방문정보 관리(PVB1030A)
  o 시스템명    : 종합인사정보시스템
  o 부시스템명  : 방문자 예약시스템
  o 작성자      :
  o 버전        : 1.25
  o 작성일자    :
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부
    1.25 2013.04.09 지순미   주민번호 삭제 요청         SR-1304-0356
-------------------------------------------------------------------------------}
unit pvb1030a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, ComCtrls, OnSkinBtn,
  OnOneInstance, Tmax_session, OnInsaCommon, Tmax_DataSetText, DB,
  OnExcelExp, OnLineLabel, OnEditCombo, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate, ImgList, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnDBGrid, OnCalendarUtil, OnPopupEdit, OnTmaxPersonEdit, On_pvprolist,
  On_pvperson, TmaxFunc;

type
  TFM_PVB1030A = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    SB_Help: TStatusBar;
    PA_Buttons: TPanel;
    BT_Exit: TOnFocusButton;
    PA_MenuSelect: TPanel;
    SB_Tab1: TOnSkinButton;
    PA_Client: TPanel;
    ONE_App: TOnOnceInstance;
    TmaxSession: TTMaxSession;
    BT_find: TOnFocusButton;
    SB_Tab2: TOnSkinButton;
    EX_1: TOnExcelExport;
    BT_Excel: TOnFocusButton;
    PA_Work: TPanel;
    PA_Grid: TPanel;
    PA_Where: TPanel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    NT_book: TNotebook;
    ImageList1: TImageList;
    ED_jobplace: TTMaxCodePopupEdit;
    ED_deptcode: TTMaxDeptPopupEdit;
    ED_v_orgnum: TOnEdit;
    Grid1: TOnDBGrid;
    QR_srh: TTMaxDataSet;
    DataSource1: TDataSource;
    BT_visit: TOnFocusButton;
    ED_indatefr: TOnDateEdit;
    ED_indateto: TOnDateEdit;
    ED_infoyn: TOnComboEdit;
    Label1: TLabel;
    Shape2: TShape;
    ED_v_korname: TOnWinPopupEdit;
    ED_sec_empno: TTMaxPersonPopupEdit;
    ED_v_pcid: TOnWinPopupEdit;
    ED_v_cardinyn: TOnComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_Tab1Click(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
    procedure OnComboindex(Sender: TObject; const ItemIndex: Integer;
      var idx: Integer);
    procedure BT_findClick(Sender: TObject);
    procedure Grid1TitleClick(Sender: TObject; const ACell: TOnJCell);
    procedure ED_v_orgnumChange(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure BT_visitClick(Sender: TObject);
    procedure ED_v_kornameCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure ED_v_kornameInitPopup(Sender: TObject);
    procedure ED_v_pcidInitPopup(Sender: TObject);
    procedure ED_v_pcidCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure OnEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnEditChange(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    FG_CurTag  : Integer;
    FG_pempno  : String;
    FG_grade   : String;
    FG_Loading : Boolean;

    FG_Sql     : String;
    FG_gubun   : String;

    FM_pro     : TFM_pvprolist;
    FM_per     : TFM_perlist;

    procedure PL_Get_Select;
    procedure PL_Get_Order(AGubun : String);
    procedure PL_Get_Select1(ASort : String);
    procedure PL_Get_Select2(ASort : String);
    procedure PL_Covert_Excel1;
  public
    { Public declarations }
    procedure PL_Com_Contructor(var AQR_com : TTMaxDataSet);
    procedure PL_ShowPanel(APanel: TPanel);    
  end;

var
  FM_PVB1030A: TFM_PVB1030A;

implementation

uses On_pvvistlist;

{$R *.DFM}

procedure TFM_PVB1030A.PL_ShowPanel(APanel: TPanel);
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

procedure TFM_PVB1030A.PL_Com_Contructor(var AQR_com : TTMaxDataSet);
begin
  with AQR_com do
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

procedure TFM_PVB1030A.FormCreate(Sender: TObject);
begin
  FM_SubForm1 := nil;
  FL_Start    := True;
  FG_Loading  := False;
  FG_gubun    := '';
end;

procedure TFM_PVB1030A.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  FG_Date : String;
begin
  if FL_Start then
    begin
      FG_Loading := True;
      FL_Start := not FL_Start;
      SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
      Self.SetBounds(FL_Rect.Top + 10, FL_Rect.Left + 20, Self.Width, Self.Height);
      SF_Main.Refresh;
      NT_book.ActivePage := '작업1';

      Application.ProcessMessages;

      // ※ 주의 : 프로그램 테스트 완료후 주석 부분을 해제 후 Rebuild해서 서버에 올린다..
      //if (ONE_App.Check) or (not ONE_App.MainCheck) then
      //  Application.Terminate;

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
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      FG_Date           := FM_Tmax.GetData('sysdate','','');
      ///////////////////////////////////////////////////////////////////////

      // 이부분서부터 업무관련 초기화 부분 코딩 처리...
      FG_pempno := Hinsa_Param(CmdLine,1);
      FG_Grade  := Hinsa_Param(CmdLine,4);
      FG_Loading := False;
      SB_Tab1Click(SB_Tab1);

      ED_indatefr.NoFormatDate := GetDateMinus(Copy(FG_Date,1,8), -30);
      ED_indateto.NoFormatDate := Copy(FG_Date,1,8);

      Application.CreateForm(TFM_pvprolist, FM_pro);
      Application.CreateForm(TFM_perlist, FM_per);
    end;
end;

procedure TFM_PVB1030A.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FM_pro.Free;
  FM_per.Free;

  EX_1.DoQuit;
  CanClose := True;
end;

procedure TFM_PVB1030A.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_PVB1030A.SB_Tab1Click(Sender: TObject);
begin
  if FG_Loading then System.Exit;

  FG_Loading       := True;
  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;

  QR_srh.Close;
  FG_CurTag := TComponent(Sender).Tag;
  case TComponent(Sender).Tag of
   1 : begin
         NT_book.ActivePage := '작업1';
       end;
   2 : begin
         NT_book.ActivePage := '작업2';
       end;
  end;

  TOnSkinButton(Sender).BtnDown := True;
  FG_Loading := False;
end;

procedure TFM_PVB1030A.BT_ExcelClick(Sender: TObject);
begin
  if not QR_srh.Active then
    begin
      MessageDlg('데이타 검색 작업 후에 작업을 하세요...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := ' Excel로 데이타 변환중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  PL_Covert_Excel1;

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_PVB1030A.OnComboindex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  Idx := 0;
end;

procedure TFM_PVB1030A.BT_findClick(Sender: TObject);
var
  FL_i  : Integer;
  Colum : TOnJColumn;
begin
  SB_Help.Panels[1].Text := ' 데이타 검색중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  for FL_i := 0 to 9 do
    begin
      Colum := Grid1.Columns[FL_i];
      Colum.Sorted := jssNone;
      Colum.Color  := clWindow;
    end;
      
  FG_gubun := '';
  if NT_Book.ActivePage = '작업1' then
    PL_Get_Select1('');
  if NT_Book.ActivePage = '작업2' then
    PL_Get_Select2('');

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_PVB1030A.ED_v_orgnumChange(Sender: TObject);
begin
  ED_deptcode.orgnum := ED_v_orgnum.Text;
end;

procedure TFM_PVB1030A.PL_Get_Select;
begin
  FG_Sql := 'SELECT A.v_id,                      '+
            '       A.placecode,                 '+
            '       E.codename,                  '+
            '       C.deptcode,                  '+
            '       (A.sec_empno ||''-''||G.korname), '+
            '       B.v_pid,                     '+
            '       '''' v_juminid,              '+ //jissi 2013.04.09  주민번호 삭제 요청(SR-1304-0356) D.v_juminid
            '       D.v_korname,                 '+
            '       (B.v_indatefr||B.v_intimefr),'+
            '       (B.v_indateto||B.v_intimeto),'+
            '       B.v_cardinyn,                '+
            '       (F.deptname|| '' ''||F.deptna3),'+
            '       D.v_company,                 '+
            '       DECODE(A.v_pcid,''9999'',A.v_propose,H.v_pcname) , '+
            '       (B.v_cardoutdate||B.v_cardouttime||B.v_cardindate||B.v_cardintime) '+
            '  FROM pvvisitlist B, pvdeptlist C, pvbookvisit A, pvperson D, pvprolist H, pyccode E, pvpycdept F, pvpimpmas G '+
            ' WHERE A.v_id      = B.v_id      '+
            '   AND A.v_id      = C.v_id      '+
            '   AND B.v_pid     = D.v_pid     '+
            '   AND A.v_pcid    = H.v_pcid    '+
            '   AND E.codeid    = ''I160''    '+
            '   AND A.placecode = E.codeno    '+
            '   AND A.sec_empno = G.empno     '+
            '   AND C.orgnum    = F.orgnum    '+
            '   AND C.deptcode  = F.deptcode  '+
            '   AND B.v_infoyn  = ''%s''      '+
            '   AND A.off_indatefr >= ''%s''  '+
            '   AND A.off_indatefr <= ''%s''  ';
  FG_Sql := Format(FG_Sql,[ED_infoyn.Text,
                           ED_indatefr.NoFormatDate,
                           ED_indateto.NoFormatDate]);
  if ED_v_cardinyn.Text <> '' then
    FG_Sql := FG_Sql + Format(' AND v_cardinyn = ''%s'' ',[ED_v_cardinyn.Text]);
end;

procedure TFM_PVB1030A.PL_Get_Order(AGubun : String);
begin
  with QR_srh do
    begin
      if FG_gubun = '' then
        Sql.Text := FG_Sql + ' ORDER BY A.v_id, D.v_korname, B.v_indatefr DESC ';
            
      if AGubun = '내림차순' then
        begin
          if FG_gubun = '00' then
            Sql.Text := FG_Sql + ' ORDER BY A.placecode, B.v_indatefr DESC ';
          if FG_gubun = '01' then
            Sql.Text := FG_Sql + ' ORDER BY F.deptcode, B.v_indatefr DESC ';
          if FG_gubun = '02' then
            Sql.Text := FG_Sql + ' ORDER BY A.sec_empno, B.v_indatefr DESC ';
          if FG_gubun = '10' then
            Sql.Text := FG_Sql + ' ORDER BY DECODE(A.v_pcid,''9999'',A.v_propose,H.v_pcname), B.v_indatefr DESC ';
          if FG_gubun = '21' then
            Sql.Text := FG_Sql + ' ORDER BY D.v_korname, B.v_indatefr DESC ';
          if FG_gubun = '22' then
            Sql.Text := FG_Sql + ' ORDER BY D.v_company, B.v_indatefr DESC ';
          if FG_gubun = '23' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_indatefr, D.v_korname ';
          if FG_gubun = '24' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_indateto, D.v_korname ';
          if FG_gubun = '25' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_cardinyn, B.v_indatefr DESC ';
       end;

      if AGubun = '오름차순' then
        begin
          if FG_gubun = '00' then
            Sql.Text := FG_Sql + ' ORDER BY A.placecode DESC, B.v_indatefr DESC ';
          if FG_gubun = '01' then
            Sql.Text := FG_Sql + ' ORDER BY F.deptcode DESC, B.v_indatefr DESC ';
          if FG_gubun = '02' then
            Sql.Text := FG_Sql + ' ORDER BY A.sec_empno DESC, B.v_indatefr DESC ';
          if FG_gubun = '10' then
            Sql.Text := FG_Sql + ' ORDER BY DECODE(A.v_pcid,''9999'',A.v_propose,H.v_pcname) DESC, B.v_indatefr DESC ';
          if FG_gubun = '21' then
            Sql.Text := FG_Sql + ' ORDER BY D.v_korname DESC, B.v_indatefr DESC ';
          if FG_gubun = '22' then
            Sql.Text := FG_Sql + ' ORDER BY D.v_company DESC, B.v_indatefr DESC ';
          if FG_gubun = '23' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_indatefr DESC, D.v_korname ';
          if FG_gubun = '24' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_indateto DESC, D.v_korname ';
          if FG_gubun = '25' then
            Sql.Text := FG_Sql + ' ORDER BY B.v_cardinyn DESC, B.v_indatefr DESC ';
        end;
    end;
end;

procedure TFM_PVB1030A.PL_Get_Select1(ASort : String);
begin
  PL_Get_Select;
  if ED_jobplace.codeno <> '' then
    begin
      FG_Sql := FG_Sql + Format(' AND A.placecode  =  ''%s'' ',[ED_jobplace.codeno]);
    end;

  if ED_deptcode.deptcode <> '' then
    begin
      FG_Sql := FG_Sql + Format(' AND C.deptcode =  ''%s'' '+
                                ' AND C.orgnum   =  ''%s'' ',
                                [ED_deptcode.deptcode, ED_deptcode.orgnum]);
    end;

  with QR_srh do
    begin
      Close;
      Sql.clear;
      PL_Get_Order(ASort);

      Open;
      FieldByName('field9').EditMask  := '0000년00월00일 00:00;0;';
      FieldByName('field10').EditMask := '0000년00월00일 00:00;0;';
    end;
end;


procedure TFM_PVB1030A.PL_Get_Select2(ASort : String);
begin
  PL_Get_Select;
  if ED_v_korname.Hint <> '' then
    begin
      FG_Sql := FG_Sql + Format(' AND B.v_pid  =  ''%s'' ',[ED_v_korname.Hint]);
    end;
  if ED_sec_empno.empno <> '' then
    begin
      FG_Sql := FG_Sql + Format(' AND A.sec_empno =  ''%s'' ',[ED_sec_empno.empno]);
    end;
  if ED_v_pcid.Hint <> '' then
    begin
      FG_Sql := FG_Sql + Format(' AND A.v_pcid =  ''%s'' ',[ED_v_pcid.Hint]);
    end;

  with QR_srh do
    begin
      Close;
      Sql.clear;
      PL_Get_Order(ASort);

      Open;
      FieldByName('field9').EditMask  := '0000년00월00일 00:00;0;';
      FieldByName('field10').EditMask := '0000년00월00일 00:00;0;';
    end;
end;

procedure TFM_PVB1030A.Grid1TitleClick(Sender: TObject; const ACell: TOnJCell);
var
  Colum : TOnJColumn;
  FL_i  : Integer;
begin
  for FL_i := 0 to 9 do
    begin
      Colum := Grid1.Columns[FL_i];
      if ACell.LevelIndex <> Colum.LevelIndex then
        begin
          Colum.Sorted := jssNone;
          Colum.Color  := clWindow;
        end;
    end;

  FG_gubun := IntToStr(ACell.Level) + IntToStr(ACell.LevelIndex);
  Colum := Grid1.ColumnByCell(ACell);
  if Trim(Colum.Title.Caption) = '주민번호' then
    System.Exit;

  Colum.Color := clYellow;

  if Colum.Sorted = jssDown then
    Colum.Sorted := jssUp
  else if Colum.Sorted = jssNone then
    Colum.Sorted := jssDown
  else if Colum.Sorted = jssUp then
    Colum.Sorted := jssDown;

  if Colum.Sorted = jssDown then
    PL_Get_Select1('내림차순');
  if Colum.Sorted = jssUp then
    PL_Get_Select1('오름차순');
end;

procedure TFM_PVB1030A.PL_Covert_Excel1;
var
  A : OleVariant;
  i : integer;
begin
  A := VarArrayCreate([0, EX_1.ExcelAttr.Count], varVariant);
  EX_1.DoBegin;
  EX_1.DoWriteHeader;

  A[8] := 'o 입실일자 From';
  A[9] := ED_indatefr.Text;
  EX_1.DoWriteRecord(A);
  A[8] := 'o 입실일자 To';
  A[9] := ED_indateto.Text;
  EX_1.DoWriteRecord(A);
  if ED_jobplace.codeno <> '' then
    begin
       A[8] := 'o 근무지';
       A[9] := ED_jobplace.Text;
       EX_1.DoWriteRecord(A);
    end;
  if ED_deptcode.deptcode <> '' then
    begin
       A[8]  := 'o 방문부서';
       A[9] := ED_deptcode.Text;
       EX_1.DoWriteRecord(A);
    end;

  EX_1.DoWriteTitle;
  with QR_srh do
    begin
      First;
      while not Eof do
        begin
          for i := 0 to EX_1.ExcelAttr.Count - 1 do
            begin
              if EX_1.ExcelAttr[i].FieldName = 'field9' then
                begin
                  A[i] := Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,1,4)+'년'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,5,2)+'월'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,7,2)+'일 '+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,9,2)+':'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,11,2);
                end
              else if EX_1.ExcelAttr[i].FieldName = 'field10' then
                begin
                  A[i] := Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,1,4)+'년'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,5,2)+'월'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,7,2)+'일 '+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,9,2)+':'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,11,2);
                end
              else if EX_1.ExcelAttr[i].FieldName = 'field15' then
                begin
                  A[i] := Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,1,4)+'년'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,5,2)+'월'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,7,2)+'일 '+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,9,2)+':'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,11,2)+ ' ~ '+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,13,4)+'년'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,17,2)+'월'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,19,2)+'일 '+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,21,2)+':'+
                          Copy(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString,23,2)
                end
              else
                A[i] := FieldByName(EX_1.ExcelAttr[i].FieldName).AsString;

              if Trim(FieldByName(EX_1.ExcelAttr[i].FieldName).AsString) = '' then
                A[i] := '';
            end;
          EX_1.DoWriteRecord(A);
          Next;
        end;
    end;

  EX_1.DoWriteRecordEnd;
  EX_1.DoEnd;
end;

procedure TFM_PVB1030A.Grid1DblClick(Sender: TObject);
begin
  if not QR_srh.Active then
    begin
      MessageDlg('검색된 데이타를 선택하세요...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  SB_Help.Panels[1].Text := ' 방문출입 상세정보 검색중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);
  if FM_SubForm1 = nil then
    FM_SubForm1 := TFM_SubForm1.Create(Self);

  FM_SubForm1.Insa_Session := TmaxSession;
  FM_SubForm1.FG_empno     := FG_pempno;
  FM_SubForm1.FG_v_id      := QR_srh.FieldByName('field1').AsString;
  FM_SubForm1.FG_Button    := True;
  FM_SubForm1.SB_Help      := SB_Help;
  FM_SubForm1.PL_InitForm;
  try
    SB_Help.Panels[1].Text := '';
    FM_SubForm1.ShowModal;
  finally
    FM_SubForm1.Release;
    FM_SubForm1.Free;
    FM_SubForm1 := nil;
  end;
end;

procedure TFM_PVB1030A.BT_visitClick(Sender: TObject);
begin
  Grid1DblClick(Sender);
end;

procedure TFM_PVB1030A.ED_v_kornameCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_per.FG_v_korname;
      TOnWinPopupEdit(Sender).Hint := FM_per.FG_v_pid;
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_PVB1030A.ED_v_pcidCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_pro.FG_v_pcname;
      TOnWinPopupEdit(Sender).Hint := FM_pro.FG_v_pcid;
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_PVB1030A.ED_v_kornameInitPopup(Sender: TObject);
begin
  FM_per.Insa_Session  := TmaxSession;
  FM_per.FG_empno      := FG_pempno;
  FM_per.BE_key.Text   := '';
  TOnWinPopupEdit(Sender).PopupControl := FM_per;
  FM_per.Edit     := TOnWinPopupEdit(Sender);
  FM_per.PL_Init;
end;

procedure TFM_PVB1030A.ED_v_pcidInitPopup(Sender: TObject);
begin
  FM_pro.Insa_Session  := TmaxSession;
  FM_per.BE_key.Text   := '';
  TOnWinPopupEdit(Sender).PopupControl := FM_pro;
  FM_pro.Edit     := TOnWinPopupEdit(Sender);
  FM_pro.PL_Init;
end;

procedure TFM_PVB1030A.OnEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      BT_findClick(Sender);
      Key := 0;
    end;
end;

procedure TFM_PVB1030A.OnEditChange(Sender: TObject);
begin
  if Trim(TOnEdit(Sender).Text) = '' then
    TOnEdit(Sender).Hint := '';
end;

end.

