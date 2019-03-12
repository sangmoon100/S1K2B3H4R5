unit PZK10201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, OnFocusButton, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditCombo, ExtCtrls, OnScheme, Db, MemDS,
  DBAccess, Ora, OnInsaCommon, QuickRpt, ComObj, Gauges, Psock, NMFtp, kpaylib,
  Pass;

const
  xlCenter = -4108;
  xlTop    = -4160;
  xlLeft   = -4131;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    CB_duty_name: TOnComboEdit;
    BT_Screen: TOnFocusButton;
    BT_Close: TOnFocusButton;
    StatusBar1: TStatusBar;
    BT_Print: TOnFocusButton;
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    QRCompositeReport1: TQRCompositeReport;
    Ora_duty: TOraQuery;
    Ora_task: TOraQuery;
    BT_Excel: TOnFocusButton;
    Gauge1: TGauge;
    procedure FormPaint(Sender: TObject);
    procedure CB_duty_nameChange(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_ScreenClick(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GSempno   : String;
    GSkorname : String;
    GSgrade   : String;
    GSdutyId  : String;
    GSdutyName : String;
    GSworkLevel: Integer;
    InsaDir     : String;
  end;

var
  MainForm: TMainForm;

implementation

uses PZK10202, PZK10203, PZK10204, PZK10205, PZK10206, PZK10208, PZK10209;

{$R *.DFM}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := '인사 시스템에 접속 중입니다...';

     Ora_Session.Options.Net   := True;
     Ora_Session.ConnectPrompt := False;
     Ora_Session.Username      := Passemp(cmdline,5);
     Ora_Session.Password      := Passemp(cmdline,6);
     Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);
     try
         Ora_Session.Connected := True;
     except on E : Exception do
         Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
     end;
     
  GSempno   := HInsa_Param(cmdline,1);
  GSkorname := HInsa_Param(cmdline,2);
  GSgrade   := HInsa_Param(cmdline,4);
  InsaDir   := GetHomeDir+'\';
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  imsi_str : String;
  i : Integer;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;


  with Ora_Qry1 do
  begin
       Close;
       Sql.Clear;

       if  (GSempno = '1076') or (GSempno = '0884') or (GSempno = '1873') or  //2010.05.추가
           (GSempno = '1262') or (GSempno = '0215') or (GSempno = '2245') or  (GSempno = '2684') or
           (Copy(GSempno,1,1) ='D') then
       begin
            Sql.Add('Select duty_id, duty_name from a1duty       ');
            Sql.Add('order by duty_name                          ');
       end
       else
       begin
            Sql.Add('Select duty_id, duty_name from a1duty       ');
            Sql.Add('where entry_empno = :empno ');
            Sql.Add('order by duty_name         ');
            ParamByName('empno').AsString := GSempno;
       end;
       Open;

       if Ora_Qry1.eof then
       begin
            MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
            BT_CloseClick(Self);
            Exit;
       end;

       CB_duty_name.Clear;
       Ora_Qry1.First;
       while not Ora_Qry1.eof do
       begin
            imsi_str := FieldByName('duty_name').AsString;
            i := length(imsi_str);
            while i < 60 do
              begin
                i := i +1 ;
                imsi_str := imsi_str + ' ';
              end;

            imsi_str := imsi_str + FieldByName('duty_id').Asstring;
            CB_duty_name.Items.Add(imsi_str);
            Ora_Qry1.Next;
       end;
       CB_duty_name.ItemIndex      := 0;
  end;

  StatusBar1.Panels[1].Text := '';

end;

procedure TMainForm.CB_duty_nameChange(Sender: TObject);
begin
  GSdutyId                    := Copy(CB_duty_name.Text,61,5);
  GSdutyName                  := Trim(Copy(CB_duty_name.Text,1,60));
end;

procedure TMainForm.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BT_ScreenClick(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := '출력 준비중입니다..';

  with Ora_duty do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.goal_1, b.goal_2, b.goal_3, b.goal_4, b.goal_5, b.goal_6,      ');
      Sql.Add('       nvl(b.manager_cnt, 0) manager_cnt,  nvl(b.senior_cnt,0) senior_cnt,   ');
      Sql.Add('       nvl(b.jonior_cnt, 0) jonior_cnt, nvl(b.nregular_cnt, 0) nregular_cnt, ');
      Sql.Add('       nvl(b.manager_cnt,0)+nvl(b.senior_cnt,0)+ nvl(b.jonior_cnt,0)+ nvl(b.nregular_cnt,0) tot_cnt,    ');
      Sql.Add('       b.manager_rate,  b.senior_rate, b.jonior_rate, b.nregular_rate, ');
      Sql.Add('       nvl(b.manager_rate,0)+ nvl(b.senior_rate,0)+nvl(b.jonior_rate,0)+nvl(b.nregular_rate,0) tot_rate ');
      Sql.Add('  from a1duty a, a1dutydesc b                                          ');
      Sql.Add(' where a.duty_id = b.duty_id(+)                                        ');
      Sql.Add('   and a.duty_id = :duty_id                                            ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;
    end;

  with Ora_task do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,  ');
      Sql.Add('       A.TASK_SNO, A.TASK_NAME,  ');
      Sql.Add('       B.WORK_SNO, B.WORK_NAME, B.WORK_RATE, B.OUTPUT_ITEM, B.VALUE_NNUM, B.VALUE_NUM,  ');
      Sql.Add('       C.MOTIVE_SNO, C.MOTIVE_NAME, C.REAL_VALUE, C.REAL_UNIT, C.EXP_NNUM, C.EXP_NUM_VALUE, C.EXP_NUM_UNIT ');
      Sql.Add('  FROM A1DUTY M, A1TASK A, A1WORK B, A1MOTIVE C                    ');
      Sql.Add(' WHERE M.DUTY_ID  = A.DUTY_ID                                      ');
      Sql.Add('   AND A.DUTY_ID  = B.DUTY_ID(+)                                   ');
      Sql.Add('   AND A.TASK_SNO = B.TASK_SNO(+)                                  ');
      Sql.Add('   AND B.DUTY_ID  = C.DUTY_ID(+)                                   ');
      Sql.Add('   AND B.TASK_SNO = C.TASK_SNO(+)                                  ');
      Sql.Add('   AND B.WORK_SNO = C.WORK_SNO(+)                                  ');
      Sql.Add('   AND M.DUTY_ID  = :DUTY_ID                                       ');
      Sql.Add('ORDER BY M.DUTY_ID, A.TASK_SNO, A.TASK_NAME,  B.WORK_SNO, C.MOTIVE_SNO           ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;
    end;

  if TOnFocusButton(Sender).Tag = 0 then
    QRCompositeReport1.Preview
  else
    QRCompositeReport1.Print;

  StatusBar1.Panels[1].Text := '출력이 완료되었습니다.';
end;

procedure TMainForm.QRCompositeReport1AddReports(Sender: TObject);
begin
  with QRCompositeReport1 do
  begin
    Reports.Add(QuickRep1);
    Reports.Add(QuickRep2);
    Reports.Add(QuickRep6);//조직도

    Reports.Add(QuickR);

    Reports.Add(QuickRep3);
    Reports.Add(QuickRep4);
    Reports.Add(QuickRep5);

    Reports.Add(QuickRep3);
    Reports.Add(QuickRep4);
    Reports.Add(QuickRep5);

    Reports.Add(QuickRep3);
    Reports.Add(QuickRep4);
    Reports.Add(QuickRep5);
  end;

end;

procedure TMainForm.BT_ExcelClick(Sender: TObject);
var
  XL, Sheet1, Sheet2, Sheet3, Sheet4 : Variant;
  i,j,k : Integer;
  taskname, workname, worker_level : String;
  tmpIntT, tmpIntW : Integer;
begin
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  XL.Workbooks.Open(InsaDir + Replace(GSDutyName,'/',' ')+'.XLS') ;
  Sheet1 := XL.WorkBooks[1].Sheets[1];
  Sheet1.Name := '기본사항 및 목적';
  Sheet2 := XL.WorkBooks[1].Sheets[2];
  Sheet2.Name := '과업내용';
  Sheet3 := XL.WorkBooks[1].Sheets[3];
  Sheet3.Name := '조직도';
  Sheet4 := XL.WorkBooks[1].Sheets[4];
  Sheet4.Name := '지식기술';

  Gauge1.Visible  := True;

  with Ora_Qry1 do
    begin
      // 첫번째 Sheet - 기본사항 및 목적
      Gauge1.Progress := 10 ;
      Close;
      Sql.Clear;
      Sql.Add('select a.duty_id,     a.duty_name,   a.entry_empno, a.entry_name,   a.entry_date,  a.group_major, a.group_minor,       ');
      Sql.Add('       a.main_team,   a.etc_team1,   a.etc_team2,   a.etc_team3,                                        ');
      Sql.Add('       b.goal_1 ,     b.goal_2,      b.goal_3,      b.goal_4,       b.goal_5,      b.goal_6             ');
      Sql.Add('  from a1duty a, a1dutydesc b                                          ');
      Sql.Add(' where a.duty_id = b.duty_id(+)                                        ');
      Sql.Add('   and a.duty_id = :duty_id                                            ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      XL.WorkBooks[1].Sheets[Sheet1.Name].Select;
      Sheet1.cells[9,2]   := FieldByName('duty_name').AsString ;
      Sheet1.cells[10,2]  := FieldByName('entry_name').AsString ;
      Sheet1.cells[10,6]  := FieldByName('entry_date').AsString ;
      Sheet1.cells[12,2]  := FieldByName('group_major').AsString ;
      Sheet1.cells[12,3]  := FieldByName('group_minor').AsString ;
      Sheet1.cells[12,4]  := FieldByName('main_team').AsString ;
      Sheet1.cells[12,6]  := FieldByName('etc_team1').AsString ;
      Sheet1.cells[12,7]  := FieldByName('etc_team2').AsString ;
      Sheet1.cells[12,8]  := FieldByName('etc_team3').AsString ;
      Sheet1.cells[15,2]  := FieldByName('goal_1').AsString ;
      Sheet1.cells[16,2]  := FieldByName('goal_2').AsString ;
      Sheet1.cells[17,2]  := FieldByName('goal_3').AsString ;
      Sheet1.cells[18,2]  := FieldByName('goal_4').AsString ;
      Sheet1.cells[19,2]  := FieldByName('goal_5').AsString ;
      Sheet1.cells[20,2]  := FieldByName('goal_6').AsString ;

      // 두번째 Sheet - 과업내용
      Gauge1.Progress := 20 ;
      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,  ');
      Sql.Add('       A.TASK_SNO, A.TASK_NAME,  ');
      Sql.Add('       B.WORK_SNO, B.WORK_NAME, B.WORK_RATE, B.OUTPUT_ITEM, B.VALUE_NNUM, B.VALUE_NUM,  ');
      Sql.Add('       C.MOTIVE_SNO, C.MOTIVE_NAME, C.REAL_VALUE, C.REAL_UNIT, C.EXP_NNUM, C.EXP_NUM_VALUE, C.EXP_NUM_UNIT ');
      Sql.Add('  FROM A1DUTY M, A1TASK A, A1WORK B, A1MOTIVE C                    ');
      Sql.Add(' WHERE M.DUTY_ID  = A.DUTY_ID                                      ');
      Sql.Add('   AND A.DUTY_ID  = B.DUTY_ID(+)                                   ');
      Sql.Add('   AND A.TASK_SNO = B.TASK_SNO(+)                                  ');
      Sql.Add('   AND B.DUTY_ID  = C.DUTY_ID(+)                                   ');
      Sql.Add('   AND B.TASK_SNO = C.TASK_SNO(+)                                  ');
      Sql.Add('   AND B.WORK_SNO = C.WORK_SNO(+)                                  ');
      Sql.Add('   AND M.DUTY_ID  = :DUTY_ID                                       ');
      Sql.Add('ORDER BY M.DUTY_ID, A.TASK_SNO, A.TASK_NAME,  B.WORK_SNO, C.MOTIVE_SNO           ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      XL.WorkBooks[1].Sheets[Sheet2.Name].Select;
      i := 5 ;
      First;
      taskname  := FieldByName('task_name').AsString ;
      workname  := FieldByName('work_name').AsString ;
      tmpIntT   :=  5;
      tmpIntW   :=  5;
      while not Ora_Qry1.eof do
        begin
          if taskname <> FieldByName('task_name').AsString then
            begin
              XL.Range['A'+IntToStr(tmpIntT+1), 'A'+Inttostr(i-1)].Select;
              XL.Selection.ClearContents;
              XL.Range['A'+IntToStr(tmpIntT),'A'+Inttostr(i-1)].Select;
              XL.Selection.Merge;
              XL.Selection.HorizontalAlignment := xlCenter;
              XL.Selection.VerticalAlignment := xlTop;
              tmpIntT   :=  i;
            end;

          if workname <> FieldByName('work_name').AsString then
            begin
              if tmpIntW <> (i-1) then
                begin
                  //주요활동
                  XL.Range['B'+IntToStr(tmpIntW+1), 'B'+Inttostr(i-1)].Select;
                  XL.Selection.ClearContents;
                  XL.Range['B'+IntToStr(tmpIntW),'B'+Inttostr(i-1)].Select;
                  XL.Selection.Merge;
                  XL.Selection.HorizontalAlignment := xlLeft;
                  XL.Selection.VerticalAlignment := xlTop;
                  //비율
                  XL.Range['C'+IntToStr(tmpIntW+1), 'C'+Inttostr(i-1)].Select;
                  XL.Selection.ClearContents;
                  XL.Range['C'+IntToStr(tmpIntW),'C'+Inttostr(i-1)].Select;
                  XL.Selection.Merge;
                  XL.Selection.HorizontalAlignment := xlCenter;
                  XL.Selection.VerticalAlignment := xlTop;
                  //과업별 주요산출물
                  XL.Range['J'+IntToStr(tmpIntW+1), 'J'+Inttostr(i-1)].Select;
                  XL.Selection.ClearContents;
                  XL.Range['J'+IntToStr(tmpIntW),'J'+Inttostr(i-1)].Select;
                  XL.Selection.Merge;
                  XL.Selection.HorizontalAlignment := xlCenter;
                  XL.Selection.VerticalAlignment := xlTop;
                  //과업별 성과측정 지표 -비계량적
                  XL.Range['K'+IntToStr(tmpIntW+1), 'K'+Inttostr(i-1)].Select;
                  XL.Selection.ClearContents;
                  XL.Range['K'+IntToStr(tmpIntW),'K'+Inttostr(i-1)].Select;
                  XL.Selection.Merge;
                  XL.Selection.HorizontalAlignment := xlCenter;
                  XL.Selection.VerticalAlignment := xlTop;
                  //과업별 성과측정 지표 -계량적
                  XL.Range['L'+IntToStr(tmpIntW+1), 'L'+Inttostr(i-1)].Select;
                  XL.Selection.ClearContents;
                  XL.Range['L'+IntToStr(tmpIntW),'L'+Inttostr(i-1)].Select;
                  XL.Selection.Merge;
                  XL.Selection.HorizontalAlignment := xlCenter;
                  XL.Selection.VerticalAlignment := xlTop;
                end;

              tmpIntW   :=  i;
            end;

          Sheet2.cells[i,1]  := FieldByName('task_name').AsString ;
          Sheet2.cells[i,2]  := FieldByName('work_name').AsString ;
          Sheet2.cells[i,3]  := FieldByName('work_rate').AsString ;
          Sheet2.cells[i,4]  := FieldByName('motive_name').AsString ;
          Sheet2.cells[i,5]  := FieldByName('real_value').AsString ;
          Sheet2.cells[i,6]  := FieldByName('real_unit').AsString ;
          Sheet2.cells[i,7]  := FieldByName('exp_nnum').AsString ;
          Sheet2.cells[i,8]  := FieldByName('exp_num_value').AsString ;
          Sheet2.cells[i,9]  := FieldByName('exp_num_unit').AsString ;
          Sheet2.cells[i,10] := FieldByName('output_item').AsString ;
          Sheet2.cells[i,11] := FieldByName('value_nnum').AsString ;
          Sheet2.cells[i,12] := FieldByName('value_num').AsString ;
          taskname := FieldByName('task_name').AsString ;
          workname := FieldByName('work_name').AsString ;
          Ora_Qry1.Next;
          inc(i);
        end;  //end of while

      Gauge1.Progress := 30 ;
      //세부과업
      XL.Range['A'+IntToStr(tmpIntT+1), 'A'+Inttostr(i-1)].Select;
      XL.Selection.ClearContents;
      XL.Range['A'+IntToStr(tmpIntT),'A'+Inttostr(i-1)].Select;
      XL.Selection.Merge;
      XL.Selection.HorizontalAlignment := xlCenter;
      XL.Selection.VerticalAlignment := xlTop;

      if tmpIntW <> (i-1) then
        begin
         //주요활동
          XL.Range['B'+IntToStr(tmpIntW+1), 'B'+Inttostr(i-1)].Select;
          XL.Selection.ClearContents;
          XL.Range['B'+IntToStr(tmpIntW),'B'+Inttostr(i-1)].Select;
          XL.Selection.Merge;
          XL.Selection.HorizontalAlignment := xlLeft;
          XL.Selection.VerticalAlignment := xlTop;
          //비율
          XL.Range['C'+IntToStr(tmpIntW+1), 'C'+Inttostr(i-1)].Select;
          XL.Selection.ClearContents;
          XL.Range['C'+IntToStr(tmpIntW),'C'+Inttostr(i-1)].Select;
          XL.Selection.Merge;
          XL.Selection.HorizontalAlignment := xlCenter;
          XL.Selection.VerticalAlignment := xlTop;
          //과업별 주요산출물
          XL.Range['J'+IntToStr(tmpIntW+1), 'J'+Inttostr(i-1)].Select;
          XL.Selection.ClearContents;
          XL.Range['J'+IntToStr(tmpIntW),'J'+Inttostr(i-1)].Select;
          XL.Selection.Merge;
          XL.Selection.HorizontalAlignment := xlCenter;
          XL.Selection.VerticalAlignment := xlTop;
          //과업별 성과측정 지표 -비계량적
          XL.Range['K'+IntToStr(tmpIntW+1), 'K'+Inttostr(i-1)].Select;
          XL.Selection.ClearContents;
          XL.Range['K'+IntToStr(tmpIntW),'K'+Inttostr(i-1)].Select;
          XL.Selection.Merge;
          XL.Selection.HorizontalAlignment := xlCenter;
          XL.Selection.VerticalAlignment := xlTop;
          //과업별 성과측정 지표 -계량적
          XL.Range['L'+IntToStr(tmpIntW+1), 'L'+Inttostr(i-1)].Select;
          XL.Selection.ClearContents;
          XL.Range['L'+IntToStr(tmpIntW),'L'+Inttostr(i-1)].Select;
          XL.Selection.Merge;
          XL.Selection.HorizontalAlignment := xlCenter;
          XL.Selection.VerticalAlignment := xlTop;
        end;

      //세번째 시트 - 조직도
      Gauge1.Progress := 40 ;
      XL.WorkBooks[1].Sheets[Sheet3.Name].Select;
      Close;
      Sql.Clear;
      Sql.Add('select a.org_name ,   a.person_cnt             ');
      Sql.Add('  from a1org a                                 ');
      Sql.Add(' where a.duty_id      = :duty_id               ');
      Sql.Add('   and a.org_level    = 1                      ');
      Sql.Add(' order by a.up_org_id                          ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      while not Ora_Qry1.eof do
        begin
          Sheet3.cells[4,12]  := FieldByName('org_name').AsString;
          Sheet3.cells[5,12]  := FieldByName('person_cnt').AsString;
          Ora_Qry1.Next;
        end;

      Close;
      Sql.Clear;
      Sql.Add('select a.org_name ,   a.person_cnt             ');
      Sql.Add('  from a1org a                                 ');
      Sql.Add(' where a.duty_id      = :duty_id               ');
      Sql.Add('   and a.org_level    = 2                      ');
      Sql.Add(' order by a.up_org_id                          ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      i := 3;
      while not Ora_Qry1.eof do
        begin
          Sheet3.cells[8,i]  := FieldByName('org_name').AsString;
          Sheet3.cells[9,i]  := FieldByName('person_cnt').AsString;
          i := i + 3;
          Ora_Qry1.Next;
        end;

      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,     M.DUTY_NAME,  ');
      Sql.Add('       a.org_name ,   a.person_cnt, ');
      Sql.Add('       b.org_level    up_org_level  ');
      Sql.Add('  from a1duty m,  a1org a, a1org b            ');
      Sql.Add(' where m.duty_id      = a.duty_id             ');
      Sql.Add('   and a.up_org_id    = b.ORG_ID(+)           ');
      Sql.Add('   and a.duty_id      = :duty_id              ');
      Sql.Add('   and a.org_level    = 3                     ');
      Sql.Add(' order by up_org_level desc, a.up_org_id      ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      i := 3;
      while not Ora_Qry1.eof do
        begin
          Sheet3.cells[12,i]  := FieldByName('org_name').AsString;
          Sheet3.cells[13,i]  := FieldByName('person_cnt').AsString;
          i := i + 3;
          Ora_Qry1.Next;
        end;

      Gauge1.Progress := 50 ;

      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,     M.DUTY_NAME,  ');
      Sql.Add('       a.org_name ,   a.person_cnt, ');
      Sql.Add('       b.org_level    up_org_level  ');
      Sql.Add('  from a1duty m,  a1org a, a1org b            ');
      Sql.Add(' where m.duty_id      = a.duty_id             ');
      Sql.Add('   and a.up_org_id    = b.ORG_ID(+)           ');
      Sql.Add('   and a.duty_id      = :duty_id              ');
      Sql.Add('   and a.org_level    = 4                     ');
      Sql.Add(' order by up_org_level desc, a.up_org_id      ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      i := 3;
      while not Ora_Qry1.eof do
        begin
          Sheet3.cells[16,i]  := FieldByName('org_name').AsString;
          Sheet3.cells[17,i]  := FieldByName('person_cnt').AsString;
          i := i + 3;
          Ora_Qry1.Next;
        end;

      Close;
      Sql.Clear;
      Sql.Add('select b.manager_rate, b.senior_rate, b.jonior_rate, b.nregular_rate,                                   ');
      Sql.Add('       nvl(b.manager_rate,0)+ nvl(b.senior_rate,0)+nvl(b.jonior_rate,0)+nvl(b.nregular_rate,0) tot_rate ');
      Sql.Add('  from a1dutydesc b                                                    ');
      Sql.Add(' where b.duty_id = :duty_id                                            ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      while not Ora_Qry1.eof do
        begin
          Sheet3.cells[25,4]  := Ora_Qry1.FieldByName('manager_rate').AsInteger/100;
          Sheet3.cells[25,7]  := Ora_Qry1.FieldByName('senior_rate').AsInteger/100;
          Sheet3.cells[25,10] := Ora_Qry1.FieldByName('jonior_rate').AsInteger/100;
          Sheet3.cells[25,13] := Ora_Qry1.FieldByName('nregular_rate').AsInteger/100;
          Sheet3.cells[25,16] := Ora_Qry1.FieldByName('tot_rate').AsInteger/100;
          Ora_Qry1.Next;
        end;

      //네번째 시트 - 지식기술
      Gauge1.Progress := 60 ;
      XL.WorkBooks[1].Sheets[Sheet4.Name].Select;

      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,  ');
      Sql.Add('       worker_level,             ');
			Sql.Add('       a.hig_yn,   a.col_nref_yn,   a.col_ref_yn,  a.uni_nref_yn,   a.uni_ref_yn,               ');
			Sql.Add('       a.mas_nref_yn,   a.mas_ref_yn,  a.doc_nref_yn,   a.doc_ref_yn,                           ');
      Sql.Add('       career_time,                                                                             ');
      Sql.Add('       decode(worker_level,''M'',1,''S'', 2, ''J'', 3) sort_key                                 ');
      Sql.Add('  from a1duty m, a1career a                                                                     ');
      Sql.Add(' where m.duty_id      = a.duty_id                                                               ');
      Sql.Add('   and a.duty_id      = :duty_id                                                                ');
      Sql.Add(' order by a.duty_id, sort_key                                                                   ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      while not Ora_Qry1.eof do
        begin
          if FieldByName('worker_level').AsString = 'M' then
            begin
              if FieldByName('hig_yn').AsString = 'Y' then
                Sheet4.cells[6,3]  := '○';

              if FieldByName('col_nref_yn').AsString = 'Y' then
                Sheet4.cells[6,5]  := '○';

              if FieldByName('col_ref_yn').AsString = 'Y' then
                Sheet4.cells[6,6]  := '○';

              if FieldByName('uni_nref_yn').AsString = 'Y' then
                Sheet4.cells[6,7]  := '○';

              if FieldByName('uni_ref_yn').AsString = 'Y' then
                Sheet4.cells[6,8]  := '○';

              if FieldByName('mas_nref_yn').AsString = 'Y' then
                Sheet4.cells[6,9]  := '○';

              if FieldByName('mas_ref_yn').AsString = 'Y' then
                Sheet4.cells[6,10]  := '○';

              if FieldByName('doc_nref_yn').AsString = 'Y' then
                Sheet4.cells[6,11]  := '○';

              if FieldByName('doc_ref_yn').AsString = 'Y' then
                Sheet4.cells[6,12]  := '○';

              if FieldByName('career_time').AsString ='M3' then
                Sheet4.cells[10,3]  := '○'
              else if FieldByName('career_time').AsString ='M6' then
                Sheet4.cells[10,4]  := '○'
              else if FieldByName('career_time').AsString ='Y1' then
                Sheet4.cells[10,5]  := '○'
              else if FieldByName('career_time').AsString ='Y3' then
                Sheet4.cells[10,6]  := '○'
              else if FieldByName('career_time').AsString ='Y5' then
                Sheet4.cells[10,7]  := '○'
              else if FieldByName('career_time').AsString ='Y7' then
                Sheet4.cells[10,8]  := '○'
              else if FieldByName('career_time').AsString ='YA' then
                Sheet4.cells[10,9]  := '○';
            end
          else if FieldByName('worker_level').AsString = 'S' then
            begin
              if FieldByName('hig_yn').AsString = 'Y' then
                Sheet4.cells[50,3]  := '○';

              if FieldByName('col_nref_yn').AsString = 'Y' then
                Sheet4.cells[50,5]  := '○';

              if FieldByName('col_ref_yn').AsString = 'Y' then
                Sheet4.cells[50,6]  := '○';

              if FieldByName('uni_nref_yn').AsString = 'Y' then
                Sheet4.cells[50,7]  := '○';

              if FieldByName('uni_ref_yn').AsString = 'Y' then
                Sheet4.cells[50,8]  := '○';

              if FieldByName('mas_nref_yn').AsString = 'Y' then
                Sheet4.cells[50,9]  := '○';

              if FieldByName('mas_ref_yn').AsString = 'Y' then
                Sheet4.cells[50,10]  := '○';

              if FieldByName('doc_nref_yn').AsString = 'Y' then
                Sheet4.cells[50,11]  := '○';

              if FieldByName('doc_ref_yn').AsString = 'Y' then
                Sheet4.cells[50,12]  := '○';

              if FieldByName('career_time').AsString ='M3' then
                Sheet4.cells[54,3]  := '○'
              else if FieldByName('career_time').AsString ='M6' then
                Sheet4.cells[54,4]  := '○'
              else if FieldByName('career_time').AsString ='Y1' then
                Sheet4.cells[54,5]  := '○'
              else if FieldByName('career_time').AsString ='Y3' then
                Sheet4.cells[54,6]  := '○'
              else if FieldByName('career_time').AsString ='Y5' then
                Sheet4.cells[54,7]  := '○'
              else if FieldByName('career_time').AsString ='Y7' then
                Sheet4.cells[54,8]  := '○'
              else if FieldByName('career_time').AsString ='YA' then
                Sheet4.cells[54,9]  := '○';
            end
          else if FieldByName('worker_level').AsString = 'J' then
            begin
              if FieldByName('hig_yn').AsString = 'Y' then
                Sheet4.cells[94,3]  := '○';

              if FieldByName('col_nref_yn').AsString = 'Y' then
                Sheet4.cells[94,5]  := '○';

              if FieldByName('col_ref_yn').AsString = 'Y' then
                Sheet4.cells[94,6]  := '○';

              if FieldByName('uni_nref_yn').AsString = 'Y' then
                Sheet4.cells[94,7]  := '○';

              if FieldByName('uni_ref_yn').AsString = 'Y' then
                Sheet4.cells[94,8]  := '○';

              if FieldByName('mas_nref_yn').AsString = 'Y' then
                Sheet4.cells[94,9]  := '○';

              if FieldByName('mas_ref_yn').AsString = 'Y' then
                Sheet4.cells[94,10]  := '○';

              if FieldByName('doc_nref_yn').AsString = 'Y' then
                Sheet4.cells[94,11]  := '○';

              if FieldByName('doc_ref_yn').AsString = 'Y' then
                Sheet4.cells[94,12]  := '○';

              if FieldByName('career_time').AsString ='M3' then
                Sheet4.cells[98,3]  := '○'
              else if FieldByName('career_time').AsString ='M6' then
                Sheet4.cells[98,4]  := '○'
              else if FieldByName('career_time').AsString ='Y1' then
                Sheet4.cells[98,5]  := '○'
              else if FieldByName('career_time').AsString ='Y3' then
                Sheet4.cells[98,6]  := '○'
              else if FieldByName('career_time').AsString ='Y5' then
                Sheet4.cells[98,7]  := '○'
              else if FieldByName('career_time').AsString ='Y7' then
                Sheet4.cells[98,8]  := '○'
              else if FieldByName('career_time').AsString ='YA' then
                Sheet4.cells[98,9]  := '○';
            end;

          Ora_Qry1.Next;
        end; //end of while

      Gauge1.Progress := 70 ;
      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,  ');
      Sql.Add('       worker_level,             ');
      Sql.Add('       ability_sno , decode(b.task_name, null, ''공통'', b.task_name) task_name,                ');
      Sql.Add('       item_name   , req_kind , import_kind , license_item ,                                    ');
      Sql.Add('       decode(worker_level,''M'',1,''S'', 2, ''J'', 3) sort_key                                 ');
      Sql.Add('  from a1duty m, a1ability a, a1task b                                                          ');
      Sql.Add(' where m.duty_id      = a.duty_id                                                               ');
      Sql.Add('   and a.duty_id      = b.duty_id(+)                                                            ');
      Sql.Add('   and a.task_sno     = b.task_sno(+)                                                           ');
      Sql.Add('   and a.ability_kind = ''A''                                                                   ');
      Sql.Add('   and a.duty_id      = :duty_id                                                                ');
      Sql.Add(' order by a.duty_id, sort_key, a.ability_sno                                                    ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      worker_level := '';
      while not Ora_Qry1.eof do
        begin
          if (worker_level <> FieldByName('worker_level').AsString) then
            begin
              if (FieldByName('worker_level').AsString = 'M') then
                i := 14
              else if (FieldByName('worker_level').AsString = 'S') then
                i := 58
              else if (FieldByName('worker_level').AsString = 'J') then
                i := 102;
            end;

          Sheet4.cells[i,1]   := FieldByName('task_name').AsString;
          Sheet4.cells[i,4]   := FieldByName('item_name').AsString;
          Sheet4.cells[i,9]   := FieldByName('import_kind').AsString;
          Sheet4.cells[i,10]  := FieldByName('req_kind').AsString;
          Sheet4.cells[i,11]  := FieldByName('license_item').AsString;
          worker_level        := FieldByName('worker_level').AsString;
          inc(i);
          Ora_Qry1.Next;
        end;

      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,   ');
      Sql.Add('       worker_level,              ');
		  Sql.Add('       ability_sno , b.ability_name , req_kind,                                                 ');
      Sql.Add('       decode(worker_level,''M'',1,''S'', 2, ''J'', 3) sort_key                                 ');
      Sql.Add('  from a1duty m, a1ability a, a1dic_abil b                                                      ');
      Sql.Add(' where m.duty_id      = a.duty_id                                                               ');
      Sql.Add('   and a.item_name    = b.ability_cd                                                            ');
      Sql.Add('   and a.ability_kind = ''B''                                                                   ');
      Sql.Add('   and a.duty_id      = :duty_id                                                                ');
      Sql.Add(' order by a.duty_id, sort_key, a.ability_sno                                                    ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      worker_level := '';
      while not Ora_Qry1.eof do
        begin
          if (worker_level <> FieldByName('worker_level').AsString) then
            begin
              i := 0;
              j := 3 ;
              if (FieldByName('worker_level').AsString = 'M') then
                k := 29
              else if (FieldByName('worker_level').AsString = 'S') then
                k := 73
              else if (FieldByName('worker_level').AsString = 'J') then
                k := 117;
            end;

          if i = 5 then
            begin
              k := k + 3;
              j := 3;
            end;

          Sheet4.cells[k,   j]   := FieldByName('ability_name').AsString;
          Sheet4.cells[k+1, j]   := FieldByName('req_kind').AsString;
          worker_level           := FieldByName('worker_level').AsString;

          inc(i);
          j := j + 2;
          Ora_Qry1.Next;
        end;

      Gauge1.Progress := 80 ;
      Close;
      Sql.Clear;
      Sql.Add('SELECT M.DUTY_ID,  M.DUTY_NAME,  ');
      Sql.Add('       worker_level,             ');
		  Sql.Add('       b.duty_name rduty_name, manager_yn, senior_yn, jonior_yn,                                ');
      Sql.Add('       decode(worker_level,''M'',1,''S'', 2, ''J'', 3) sort_key                                 ');
      Sql.Add('  from a1duty m, a1recommend a, a1duty  b                                                       ');
      Sql.Add(' where m.duty_id      = a.duty_id                                                               ');
      Sql.Add('   and a.recom_duty_id= b.duty_id                                                               ');
      Sql.Add('   and a.duty_id      = :duty_id                                                                ');
      Sql.Add(' order by a.duty_id, sort_key, a.recom_sno                                                      ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      Ora_Qry1.First;
      worker_level := '';
      while not Ora_Qry1.eof do
        begin
          if (worker_level <> FieldByName('worker_level').AsString) then
            begin
              i := 0;
              j := 3 ;
              if (FieldByName('worker_level').AsString = 'M') then
                k := 37
              else if (FieldByName('worker_level').AsString = 'S') then
                k := 81
              else if (FieldByName('worker_level').AsString = 'J') then
                k := 125;
            end;

          if i = 5 then
            begin
              k := k + 3;
              j := 3;
            end;

          Sheet4.cells[k,   j]   := FieldByName('rduty_name').AsString;

          if FieldByName('manager_yn').AsString  = 'Y' then
            Sheet4.cells[k+1, j]   := 'M'
          else if FieldByName('senior_yn').AsString  = 'Y' then
            Sheet4.cells[k+1, j]   := 'S'
          else if FieldByName('jonior_yn').AsString  = 'Y' then
            Sheet4.cells[k+1, j]   := 'J';

          worker_level          := FieldByName('worker_level').AsString;

          inc(i);
          j := j + 2;
          Ora_Qry1.Next;
        end;

     end;   //end of with

  Gauge1.Progress := 100 ;
  Gauge1.Visible  := False;

  XL.WorkBooks[1].Sheets[Sheet1.Name].Select;
  XL.Visible := True;
  XL := UnAssigned;
end;
{
var
  LFileName : String;
begin

  try
    NMFTP1.Connect;
  except On E:Exception do
    begin
      MessageDlg('FTP 서버에 연결할수 없습니다. 개발자에게 연락하세요.', mtInformation, [mbOK], 0) ;
      Exit;
    end;
  end ;

  LFileName := Replace(GSDutyName,'/',' ') +'.XLS';

  Screen.Cursor := crHourGlass ;
  NMFTP1.Mode(MODE_IMAGE); //전송타입을 binary type으로 지정

  Try
    NMFTP1.Download('직무분석서.XLS', InsaDir + LFileName);
  except On E:Exception do
    begin
      MessageDlg('직무분석서를 다운로드 받는데 실패했습니다. 개발자에게 연락하세요.', mtInformation, [mbOK], 0) ;
      Screen.Cursor := crDefault ;
      Exit;
    end;
  end;
  Screen.Cursor := crDefault ;
end;
}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

end.
