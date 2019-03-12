unit PZA1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, StdCtrls, OnFocusButton, ComCtrls, ImgList,
  OnOneInstance, Grids, OnPimcalendar, OnShapeLabel, Db, MemDS,
  DBAccess, Ora, Menus, OnPopupMenu, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate, OnEditMemo, OnInsaCommon, OraError, Pass, Func;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_BackWindow: TPanel;
    SB_Help: TStatusBar;
    Panel2: TPanel;
    BT_Save: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Add: TOnFocusButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ONE_1: TOnOnceInstance;
    PG_Work: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PA_MenuHeader: TPanel;
    SB_lun: TOnFocusButton;
    SB_month: TOnFocusButton;
    SB_week: TOnFocusButton;
    SB_inc: TOnFocusButton;
    SB_dec: TOnFocusButton;
    OnShapeLabel2: TOnShapeLabel;
    Ora_il: TOraQuery;
    Ora_Save: TOraQuery;
    PM_Cal: TOnPopupMenu;
    PN_Add: TMenuItem;
    ED_il_date: TOnDateEdit;
    ED_il_timefr: TOnMaskEdit;
    ED_il_timeto: TOnMaskEdit;
    ED_il_sendname: TOnEdit;
    ED_il_subject: TOnEdit;
    ED_il_content: TOnMemo;
    IMG_il: TImageList;
    PI_Cal: TOnPimcalendar;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_incClick(Sender: TObject);
    procedure SB_decClick(Sender: TObject);
    procedure SB_monthClick(Sender: TObject);
    procedure SB_weekClick(Sender: TObject);
    procedure SB_lunClick(Sender: TObject);
    procedure PN_AddClick(Sender: TObject);
    procedure PG_WorkChange(Sender: TObject);
    procedure PI_CalDiaryModify(Sender: TObject; var SrcSchItem,
      DestSchItem: TOnSchItem);
    procedure PI_CalDiaryPaste(Sender: TObject; var SchItem: TOnSchItem);
    procedure PI_CalDiaryDelete(Sender: TObject; SchItem: TOnSchItem);
  private
    { Private declarations }
    FL_Start   : Boolean;
    FL_Ins     : Boolean;
    FL_SchItem : TOnSchItem;

    procedure PG_LoadPlan;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
    begin
      FL_Start := False;
      SF_Main.Refresh;

      Application.ProcessMessages;
      SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';
      PG_WorkChange(Sender);
      Application.ProcessMessages;

      OraConnect;

      SB_monthClick(Sender);
      SB_Help.Panels[1].Text := '';
      FL_Ins := True;
    end;
end;

procedure TMainForm.BT_AddClick(Sender: TObject);
begin
  FL_Ins := True;
  ED_il_date.Enabled     := True;
  ED_il_timefr.Enabled   := True;
  ED_il_timeto.Enabled   := True;
  ED_il_sendname.Enabled := True;
  ED_il_subject.Enabled  := True;

  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,0);
  ED_il_date.NoFormatDate := Copy(Fn_GetDateTimeStr,1,8);
  Ed_il_timefr.Text       := '00:00';
  Ed_il_timeto.Text       := '23:59';
  ED_il_date.SetFocus;
end;

procedure TMainForm.BT_SaveClick(Sender: TObject);
var
  FSql : String;
begin
  if ED_il_date.NoFormatDate = '' then
    begin
      MessageDlg('일정일자를 입력하세요...',mtError,[mbOK],0);
      ED_il_date.SetFocus;
      System.Exit;
    end;
    
  if Trim(ED_il_timefr.Text) = ':' then
    begin
      MessageDlg('시간From을 입력하세요...',mtError,[mbOK],0);
      ED_il_timefr.SetFocus;
      System.Exit;
    end;

  if Trim(ED_il_timeto.Text) = ':' then
    begin
      MessageDlg('시간to를 입력하세요...',mtError,[mbOK],0);
      ED_il_timeto.SetFocus;
      System.Exit;
    end;

  if Trim(ED_il_sendname.Text) = '' then
    begin
      MessageDlg('등록자를 입력하세요...',mtError,[mbOK],0);
      ED_il_sendname.SetFocus;
      System.Exit;
    end;

  if Trim(ED_il_subject.Text) = '' then
    begin
      MessageDlg('일정제목을 입력하세요...',mtError,[mbOK],0);
      ED_il_subject.SetFocus;
      System.Exit;
    end;
    
  try
    if not FL_Ins then
      begin
        if FL_SchItem = nil then
          System.Exit;
        FL_SchItem.Ins          := False;
        FL_SchItem.Content.Text := ED_il_content.Lines.Text;

        Ora_Save.Session := Ora_Session;
        with Ora_Save do
          begin
            Close;
            Sql.Clear;
            FSql := 'UPDATE pymenuil SET '+
                    '  il_content = ''%s'', '+
                    '  writeman   = ''%s'', '+
                    '  writetime  = ''%s''  '+
                    ' WHERE il_date     = ''%s'' '+
                    '   AND il_timefr   = ''%s'' '+
                    '   AND il_timeto   = ''%s'' '+
                    '   AND il_sendname = ''%s'' '+
                    '   AND il_subject  = ''%s'' ';

            FSql := Format(FSql,[ED_il_content.Lines.Text,
                                 Pempno,
                                 Fn_GetDateTimeStr,
                                 ED_il_date.NoFormatDate,
                                 ED_il_timefr.Text,
                                 ED_il_timeto.Text,
                                 ED_il_sendname.Text,
                                 ED_il_subject.Text]);
            Sql.Text := FSql;
            ExecSql;
          end;
      end
    else
      begin
        Ora_Save.Session := Ora_Session;
        with Ora_Save do
          begin
            Close;
            Sql.Clear;
            FSql := 'INSERT INTO pymenuil '+
                    '  (il_network, il_gubun, il_date, il_timefr, il_timeto, '+
                    '   il_sendname, il_subject, il_arlam, il_import, il_content, writeman, writetime) '+
                    ' VALUES '+
                    ' (''0'',''0'',''%s'',''%s'',''%s'', '+
                    '  ''%s'',''%s'',''0'',''0'',''%s'',''%s'',''%s'') ';
            FSql := Format(FSql,[ED_il_date.NoFormatDate,
                                 ED_il_timefr.Text,
                                 ED_il_timeto.Text,
                                 ED_il_sendname.Text,
                                 ED_il_subject.Text,
                                 ED_il_content.Lines.Text,
                                 Pempno,
                                 Fn_GetDateTimeStr]);
            Sql.Text := FSql;
            ExecSql;
            PG_LoadPlan;
          end;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        MessageDlg('동일한 데이타가 존재합니다...',mtError,[mbOK],0);
      System.Exit;
    end;
  end;
end;

procedure TMainForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.SB_incClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
    PI_Cal.NextMonth
  else
    PI_Cal.NextWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  O '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월  종합인사정보 일정 열람';
end;

procedure TMainForm.SB_decClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
    PI_Cal.PrevMonth
  else
    PI_Cal.PrevWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  O '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월  종합인사정보 일정 열람';
end;

procedure TMainForm.SB_monthClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peMonth;
  PA_MenuHeader.Caption := '  O '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월  종합인사정보 일정 열람';
  PG_LoadPlan;
end;

procedure TMainForm.SB_weekClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peWeek;
  PA_MenuHeader.Caption := '  O '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월  종합인사정보 일정 열람';
  PG_LoadPlan;
end;

procedure TMainForm.SB_lunClick(Sender: TObject);
begin
  if SB_lun.Caption = '음력 보이기' then
    begin
      SB_lun.Caption    := '음력 숨기기';
      PI_Cal.LunarCheck := True;
    end
  else
    begin
      SB_lun.Caption    := '음력 보이기';
      PI_Cal.LunarCheck := False;
    end;
end;

procedure TMainForm.PN_AddClick(Sender: TObject);
begin
  PG_Work.ActivePage := TabSheet2;
  PG_WorkChange(Sender);
  BT_AddClick(Sender);
  ED_il_date.NoFormatDate := IntToStr(PI_Cal.Year) +
                             FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Month))) +
                             FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Day)));
end;

procedure TMainForm.PG_WorkChange(Sender: TObject);
begin
  if PG_Work.ActivePage = TabSheet1 then
    begin
      BT_Add.Enabled  := False;
      BT_Save.Enabled := False;
    end
  else
    begin
      if FL_Ins then
        BT_AddClick(Sender);
      BT_Add.Enabled  := True;
      BT_Save.Enabled := True;
    end;
end;

procedure TMainForm.PG_LoadPlan;
var
  i    : Integer;
  S    : TOnSchItem;
  F    : TOnDayItem;
  Kfr  : String;
  Kto  : String;
  FSql : String;
begin
  PI_Cal.DeleteSchedule;

  if (PI_Cal.StartDay = '') or (PI_Cal.LastDay = '') then
    System.Exit;

  SB_Help.Panels[1].Text := ' 일정사항을 읽고 있는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Kfr := Copy(PI_Cal.StartDay,1,4)+'/'+Copy(PI_Cal.StartDay,5,2)+'/'+Copy(PI_Cal.StartDay,7,2);
  Kto := Copy(PI_Cal.LastDay,1,4)+'/'+Copy(PI_Cal.LastDay,5,2)+'/'+Copy(PI_Cal.LastDay,7,2);

  Ora_il.Session := Ora_Session;
  with Ora_il do
    begin
      Close;
      Sql.Clear;
      FSql := 'SELECT il_network, il_gubun, il_date, il_timefr, il_timeto,     '+
              '       il_sendname, il_subject, il_arlam, il_import, il_content '+
              '  FROM pymenuil '+
              ' WHERE il_date >= ''%s'' AND il_date <= ''%s'' '+
              ' ORDER BY il_date ';
      FSql := Format(FSql,[PI_Cal.StartDay, PI_Cal.LastDay]);
      Sql.Text := FSql;
      Open;

      while not Eof do
        begin
          F := nil;
          for i := 0 to PI_Cal.DayItems.Count-1 do
            begin
               if (PI_Cal.DayItems[i].Year  = Copy(FieldByName('il_date').AsString,1,4)) and
                  (PI_Cal.DayItems[i].Month = Copy(FieldByName('il_date').AsString,5,2)) and
                  (PI_Cal.DayItems[i].Day   = Copy(FieldByName('il_date').AsString,7,2)) then
                 begin
                   F := PI_Cal.DayItems[i]; // 이미 있음
                   Break;
                 end;
            end;

          if F = nil then
            begin
              F       := PI_Cal.DayItems.Add;
              F.year  := Copy(FieldByName('il_date').AsString,1,4);
              F.month := Copy(FieldByName('il_date').AsString,5,2);
              F.day   := Copy(FieldByName('il_date').AsString,7,2);
              F.Box.ImageList := IMG_il;
            end;

           try
             S         := F.SchItems.Add;
             S.Ins     := True;  // 일정추가/수정 옵션 (True 추가, False 수정)
             S.kind    := FieldByName('il_gubun').AsString;
             S.o_state := FieldByName('il_import').AsString;
             S.timefr  := FieldByName('il_timefr').AsString;
             S.timeto  := FieldByName('il_timeto').AsString;
             
             if FieldByName('il_arlam').AsString = '1' then
               S.alam := True
             else
               S.alam := False;
             if FieldByName('il_network').AsString = '1' then
               S.network := True
             else
               S.network := False;
             S.sendname     := FieldByName('il_sendname').AsString;
             S.content.Text := FieldByName('il_content').AsString;
             S.subject      := FieldByName('il_subject').AsString;
           except
             begin
               MessageDlg('현재 동일한 일정이 존재합니다...',mtError,[mbOK],0);
               S.Free;
               Break;
             end;
           end;
          Next;
        end;
         
      Close;
    end;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.PI_CalDiaryModify(Sender: TObject; var SrcSchItem, DestSchItem: TOnSchItem);
var
  DayItem : TOnDayItem;
  S       : TOnSchItem;
  D       : TOnSchItem;
begin
  try
    PG_Work.ActivePage     := TabSheet2;
    ED_il_date.Enabled     := False;
    ED_il_timefr.Enabled   := False;
    ED_il_timeto.Enabled   := False;
    ED_il_sendname.Enabled := False;
    ED_il_subject.Enabled  := False;
    PG_WorkChange(Sender);

    S := SrcSchItem;
    D := DestSchItem;
    FL_SchItem := S;
    FL_Ins     := False;
    DayItem    := S.FParent.DayItem;
    ED_il_date.NoFormatDate := DayItem.Year + DayItem.Month + DayItem.Day;
    if D <> nil then
      begin
        ED_il_timefr.Text        := S.timefr;
        ED_il_timeto.Text        := S.timeto;
        ED_il_sendname.Text      := S.sendname;
        ED_il_content.Lines.Text := S.Content.Text;
        ED_il_subject.Text       := S.subject;
      end;
  except
  end;
end;

procedure TMainForm.PI_CalDiaryPaste(Sender: TObject; var SchItem: TOnSchItem);
var
  DayItem : TOnDayItem;
  Day     : String;
  FSql    : String;
begin
  try
    DayItem := SchItem.FParent.DayItem;
    Day := DayItem.Year + DayItem.Month + DayItem.Day;
    SchItem.FParent.DayItem.Box.ImageList := IMG_il;
    
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        FSql := 'INSERT INTO pymenuil '+
                '  (il_network, il_gubun, il_date, il_timefr, il_timeto, '+
                '   il_sendname, il_subject, il_arlam, il_import, il_content, writeman, writetime) '+
                ' VALUES '+
                ' (''0'',''0'',''%s'',''%s'',''%s'', '+
                '  ''%s'',''%s'',''0'',''0'',''%s'',''%s'',''%s'') ';
        FSql := Format(FSql,[Day,
                             SchItem.timefr,
                             SchItem.timeto,
                             SchItem.sendname,
                             SchItem.subject,
                             SchItem.content.Text,
                             Pempno,
                             Fn_GetDateTimeStr]);
        Sql.Text := FSql;
        ExecSql;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      SchItem.Free;  
      System.Exit;
    end;
  end;
end;

procedure TMainForm.PI_CalDiaryDelete(Sender: TObject; SchItem: TOnSchItem);
var
  DayItem : TOnDayItem;
  Day     : String;
  FSql    : String;
begin
  try
    DayItem := SchItem.FParent.DayItem;
    Day := DayItem.Year + DayItem.Month + DayItem.Day;

    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        FSql := 'DELETE FROM pymenuil   '+
                ' WHERE il_date     = ''%s'' '+
                '   AND il_timefr   = ''%s'' '+
                '   AND il_timeto   = ''%s'' '+
                '   AND il_sendname = ''%s'' '+
                '   AND il_subject  = ''%s'' ';
        FSql := Format(FSql,[Day,
                             SchItem.timefr,
                             SchItem.timeto,
                             SchItem.sendname,
                             SchItem.subject]);
        Sql.Text := FSql;
        ExecSql;
      end;
   except
   end;
end;

end.
