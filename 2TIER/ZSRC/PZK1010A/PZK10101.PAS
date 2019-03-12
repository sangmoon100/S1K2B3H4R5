unit PZK10101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnShapeLabel,
  DBAccess, Ora, Db, Grids, DBGrids, OnGrDBGrid, MemDS, StdCtrls, OnSkinBtn,
  ComCtrls, OnFocusButton, OnEditBtnCtrl, OnEditCombo, OnEditNumCtl,
  OnPopupEdit, OnDBGrid, OnCheckbox, OnInsaCommon, Psock, NMFtp, ComObj, kpaylib,
  NotesHana_TLB, Pdownload, func;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    DS_Task: TDataSource;
    Notebook1: TNotebook;
    OnShapeLabel8: TOnShapeLabel;
    ED_goal_1: TOnEdit;
    ED_goal_2: TOnEdit;
    ED_goal_3: TOnEdit;
    ED_goal_4: TOnEdit;
    ED_goal_5: TOnEdit;
    OnShapeLabel6: TOnShapeLabel;
    Grid_Task: TOnGrDbGrid;
    Grid_Motive: TOnGrDbGrid;
    Grid_Work: TOnGrDbGrid;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_3: TOnSkinButton;
    SB_4: TOnSkinButton;
    OnShapeLabel9: TOnShapeLabel;
    OnShapeLabel11: TOnShapeLabel;
    StatusBar1: TStatusBar;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    OnShapeLabel14: TOnShapeLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    L_entry_name: TOnShapeLabel;
    L_entry_date: TOnShapeLabel;
    L_decide1_name: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    Panel2: TPanel;
    E_group_major: TOnEdit;
    E_group_minor: TOnEdit;
    E_main_team: TOnEdit;
    OnShapeLabel10: TOnShapeLabel;
    OnShapeLabel15: TOnShapeLabel;
    Grid2: TOnGrDbGrid;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel17: TOnShapeLabel;
    Grid3: TOnGrDbGrid;
    OnShapeLabel18: TOnShapeLabel;
    Grid4: TOnGrDbGrid;
    OnShapeLabel19: TOnShapeLabel;
    NE_ratesum: TOnNumberEdit;
    OnShapeLabel50: TOnShapeLabel;
    NE_manager_rate1: TOnNumberEdit;
    NE_senior_rate1: TOnNumberEdit;
    NE_jonior_rate1: TOnNumberEdit;
    NE_nregular_rate1: TOnNumberEdit;
    NE_tot_rate1: TOnNumberEdit;
    NE_manager_rate: TOnNumberEdit;
    NE_senior_rate: TOnNumberEdit;
    NE_jonior_rate: TOnNumberEdit;
    NE_nregular_rate: TOnNumberEdit;
    NE_tot_rate: TOnNumberEdit;
    BT_save_msj: TOnFocusButton;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel21: TOnShapeLabel;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel23: TOnShapeLabel;
    SB_M: TOnSkinButton;
    SB_S: TOnSkinButton;
    SB_J: TOnSkinButton;
    OnShapeLabel38: TOnShapeLabel;
    OnShapeLabel40: TOnShapeLabel;
    OnShapeLabel42: TOnShapeLabel;
    OnShapeLabel44: TOnShapeLabel;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Shape6: TShape;
    OnShapeLabel46: TOnShapeLabel;
    OnShapeLabel47: TOnShapeLabel;
    OnShapeLabel48: TOnShapeLabel;
    OnShapeLabel49: TOnShapeLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape7: TShape;
    RB_M3: TRadioButton;
    RB_M6: TRadioButton;
    RB_Y1: TRadioButton;
    RB_Y3: TRadioButton;
    RB_Y5: TRadioButton;
    RB_Y7: TRadioButton;
    RB_YA: TRadioButton;
    Grid_Ability_A: TOnGrDbGrid;
    Panel7: TPanel;
    Panel17: TPanel;
    Grid_Ability_B: TOnGrDbGrid;
    Grid_Recom: TOnGrDbGrid;
    Panel18: TPanel;
    Shape10: TShape;
    BT_save_duty: TOnFocusButton;
    BT_cancel_duty: TOnFocusButton;
    SB_Close: TOnSkinButton;
    BT_add_motive: TOnFocusButton;
    BT_add_career: TOnFocusButton;
    Ora_Save: TOraQuery;
    Ora_Task: TOraQuery;
    Ora_Work: TOraQuery;
    DS_Work: TDataSource;
    Ora_Motive: TOraQuery;
    DS_Motive: TDataSource;
    BT_add_task: TOnFocusButton;
    BT_add_work: TOnFocusButton;
    CB_duty_name: TOnComboEdit;
    Panel10: TPanel;
    RB_hig_yn: TRadioButton;
    P_col: TPanel;
    RB_col_nref_yn: TRadioButton;
    RB_col_ref_yn: TRadioButton;
    Shape9: TShape;
    P_uni: TPanel;
    Shape11: TShape;
    RB_uni_nref_yn: TRadioButton;
    RB_uni_ref_yn: TRadioButton;
    P_mas: TPanel;
    Shape12: TShape;
    RB_mas_nref_yn: TRadioButton;
    RB_mas_ref_yn: TRadioButton;
    P_doc: TPanel;
    Shape13: TShape;
    RB_doc_nref_yn: TRadioButton;
    RB_doc_ref_yn: TRadioButton;
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_orgrcv: TOnFocusButton;
    ED_org_dutyname: TOnWinPopupEdit;
    Ora_Ability_A: TOraQuery;
    DS_Ability_A: TDataSource;
    Ora_Ability_B: TOraQuery;
    DS_Ability_B: TDataSource;
    CB_org_level: TOnComboEdit;
    ED_up_org_name: TOnWinPopupEdit;
    BT_orgsnd: TOnFocusButton;
    Ora_Recom: TOraQuery;
    DS_Recom: TDataSource;
    ED_up_org_id: TOnEdit;
    ED_orgId: TOnEdit;
    Ora_Senior: TOraQuery;
    DS_Senior: TDataSource;
    Ora_Jonior: TOraQuery;
    DS_Jonior: TDataSource;
    Ora_N: TOraQuery;
    DS_N: TDataSource;
    OpenDialog1: TOpenDialog;
    ED_goal_6: TOnEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    OnShapeLabel2: TOnShapeLabel;
    ED_etc_team1: TOnEdit;
    OnShapeLabel3: TOnShapeLabel;
    ED_etc_team3: TOnEdit;
    ED_etc_team2: TOnEdit;
    BT_mansave: TOnFocusButton;
    ED_person_cnt: TOnNumberEdit;
    ED_Manager: TOnNumberEdit;
    Label5: TLabel;
    Label6: TLabel;
    BT_finish: TOnFocusButton;
    BT_con: TOnFocusButton;
    BT_rej: TOnFocusButton;
    L_decide2_name: TOnShapeLabel;
    BT_concancel: TOnFocusButton;
    L_con_status: TOnShapeLabel;
    Label7: TLabel;
    Ora_Qry2: TOraQuery;
    procedure SB_1Click(Sender: TObject);
    procedure SB_CloseClick(Sender: TObject);
    procedure BT_save_dutyClick(Sender: TObject);
    procedure BT_cancel_dutyClick(Sender: TObject);
    procedure DS_TaskDataChange(Sender: TObject; Field: TField);
    procedure DS_WorkDataChange(Sender: TObject; Field: TField);
    procedure BT_add_taskClick(Sender: TObject);
    procedure BT_add_workClick(Sender: TObject);
    procedure BT_add_motiveClick(Sender: TObject);
    procedure SB_MClick(Sender: TObject);
    procedure BT_save_msjClick(Sender: TObject);
    procedure NE_manager_rateExit(Sender: TObject);
    procedure BT_add_careerClick(Sender: TObject);
    procedure CB_duty_nameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ED_org_dutynameInitPopup(Sender: TObject);
    procedure ED_org_dutynameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure ED_up_org_nameInitPopup(Sender: TObject);
    procedure ED_up_org_nameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Grid2CellClick(Column: TColumn);
    procedure Grid3CellClick(Column: TColumn);
    procedure Grid4CellClick(Column: TColumn);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure BT_orgrcvClick(Sender: TObject);
    procedure BT_orgsndClick(Sender: TObject);
    procedure BT_mansaveClick(Sender: TObject);
    procedure BT_finishClick(Sender: TObject);
    procedure BT_conClick(Sender: TObject);
    procedure BT_rejClick(Sender: TObject);
    procedure BT_concancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    JobMode : String;
    procedure Set_InputField(arg1, arg2 : Boolean ); 
  public
    { Public declarations }
    GSempno     : String;
    GSkorname   : String;
    GSdutyId    : String;
    GSdutyName  : String;
    GSStatus    : String;
    GS_entry_empno     : String;
    GS_decide1_empno   : String;
    GS_decide2_empno   : String;
    GS_entry_name      : String;
    GS_decide1_name    : String;
    GS_decide2_name    : String;

    WorkMode    : Char;
    WorkerLevel : Char;
    InsaDir     : String;
    SameYN      : Boolean;
    nMail       : ILotusNotes_Hana;
    procedure   Get_Dutydesc;
    procedure   Get_Data_Task;
    procedure   Get_Data_Work;
    procedure   Get_Data_Motive;
    procedure   Set_Level_Buttons;
    procedure   Update_dutyCnt;
    procedure   Read_Org;
    procedure   Set_Buttons(ConMode : String);
  end;

var
  MainForm: TMainForm;

implementation

uses PZK10105, PZK10103, PZK10104, PZK10102, PZK10106, PZK10108;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := '인사 시스템에 접속 중입니다...';
  Application.ProcessMessages;

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := HInsa_Param(cmdline,5);
  Ora_Session.Password      := HInsa_Param(cmdline,6);
  Ora_Session.Server        := HInsa_Param(cmdline,7)+':'+HInsa_Param(cmdline,9)+':'+HInsa_Param(cmdline,8);
  try
      Ora_Session.Connected := True;
  except on E : Exception do
      Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
  end;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;
  
  GSempno   := HInsa_Param(cmdline,1);
  GSkorname := HInsa_Param(cmdline,2);
  InsaDir   := GetHomeDir+'\';
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i : Integer;
  imsi_str : String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

  with Ora_Qry1 do
  begin
       Close;
       Sql.Clear;

       if  (GSempno = '1076') or (GSempno = '0884') or (GSempno = '1873') or  //2010.05.추가
           (GSempno = '1262') or (GSempno = '0215') or (GSempno = '2245') or (GSempno = '2684') or
           (Copy(GSempno,1,1) ='D') then 
       begin
            Sql.Add('Select duty_id, duty_name from a1duty ');
            Sql.Add('order by duty_name                    ');
       end
       else
       begin
            Sql.Add('Select duty_id, duty_name from a1duty ');
            Sql.Add(' where (entry_empno   = :empno        ');
            Sql.Add('    or decide1_empno  = :empno        ');
            Sql.Add('    or decide2_empno  = :empno)       ');
            Sql.Add(' order by duty_name                   ');
            ParamByName('empno').AsString := GSempno;
       end;
       Open;

       if Ora_Qry1.eof then
       begin
            MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
            SB_CloseClick(Self);
            Exit;
       end;

       CB_duty_name.Items.Clear;
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
  SB_1Click(SB_1);
end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P_' + IntToStr(TOnSkinButton(Sender).Tag);

  if TOnSkinButton(Sender).Tag = 2 then
    begin
      Get_Data_Task;
    end
  else if TOnSkinButton(Sender).Tag = 3 then
    begin
      ED_org_dutyname.Text   := '';
      CB_org_level.ItemIndex := -1;
      ED_person_cnt.Value    := 0 ;
      ED_up_org_name.Text    := '';
      ED_orgId.Text          := '';
      ED_up_org_id.Text      := '';

      Read_Org;
      JobMode                := 'F';
      Set_InputField(False, True);
    end
  else if TOnSkinButton(Sender).Tag = 4 then
    begin
      Set_Level_Buttons;
      NE_tot_rate1.Value := NE_manager_rate1.Value + NE_senior_rate1.Value + NE_jonior_rate1.Value + NE_nregular_rate1.Value;
      NE_tot_rate.Value  := NE_manager_rate.Value + NE_senior_rate.Value + NE_jonior_rate.Value + NE_nregular_rate.Value;
    end;
end;

procedure TMainForm.Set_Level_Buttons;
var
  tmp_mrate, tmp_srate, tmp_jrate, tmp_nrate : Double;
  tot_cnt : Double;
begin
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from  a1dutydesc       ');
      Sql.Add('where duty_id = :duty_id        ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      tmp_mrate := 0;
      tmp_srate := 0;
      tmp_jrate := 0;
      tmp_nrate := 0;

      NE_manager_rate1.Value  := 0;
      NE_senior_rate1.Value   := 0;
      NE_jonior_rate1.Value   := 0;
      NE_nregular_rate1.Value := 0;

      if not Ora_Qry1.eof then
        begin
          tot_cnt := FieldByName('manager_cnt').AsFloat  + FieldByName('senior_cnt').AsFloat +
                     FieldByName('jonior_cnt').AsFloat + FieldByName('nregular_cnt').AsFloat;

          if tot_cnt <> 0 then
            begin
              NE_manager_rate1.Value  := round(FieldByName('manager_cnt').AsFloat  / tot_cnt * 100);
              NE_senior_rate1.Value   := round(FieldByName('senior_cnt').AsFloat   / tot_cnt * 100);
              NE_jonior_rate1.Value   := round(FieldByName('jonior_cnt').AsFloat   / tot_cnt * 100);
              NE_nregular_rate1.Value := round(FieldByName('nregular_cnt').AsFloat / tot_cnt * 100);
            end;

          tmp_mrate := FieldByName('manager_rate').AsFloat;
          tmp_srate := FieldByName('senior_rate').AsFloat;
          tmp_jrate := FieldByName('jonior_rate').AsFloat;
          tmp_nrate := FieldByName('nregular_rate').AsFloat;
        end;

      NE_manager_rate.Value  := tmp_mrate;
      NE_senior_rate.Value   := tmp_srate;
      NE_jonior_rate.Value   := tmp_jrate;
      NE_nregular_rate.Value := tmp_nrate;

      SB_M.Enabled := False;
      SB_S.Enabled := False;
      SB_J.Enabled := False;

      if tmp_mrate > 0 then  SB_M.Enabled := True;

      if tmp_srate > 0 then  SB_S.Enabled := True;

      if tmp_jrate > 0 then  SB_J.Enabled := True;

      if (WorkMode ='0') and
        ((GSStatus='입력중')      or (GSStatus='1차결재반려') or (GSStatus='1차결재취소') or
         (GSStatus='2차결재반려') or (GSStatus='2차결재취소') ) then
        BT_add_career.Enabled := True;

      if not (SB_M.Enabled or SB_S.Enabled or SB_J.Enabled) then
        begin
          BT_add_career.Enabled := False;
          Exit;
        end;

      if      SB_M.Enabled then SB_MClick(SB_M)
      else if SB_S.Enabled then SB_MClick(SB_S)
      else if SB_J.Enabled then SB_MClick(SB_J);
    end;
end;

procedure TMainForm.SB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BT_save_dutyClick(Sender: TObject);
begin
  if CB_duty_name.Text = '' then
    begin
      MessageDlg('직무명(소분류)을 선택해주세요',mtError, [mbOk], 0);
      Exit;
    end;

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from  a1dutydesc       ');
      Sql.Add('where duty_id = :duty_id        ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      if Ora_Qry1.RecordCount < 1 then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('insert into a1dutydesc                                  ');
          Ora_Save.Sql.Add(' (duty_id, goal_1, goal_2, goal_3, goal_4, goal_5, goal_6)      ');
          Ora_Save.Sql.Add('values                                                  ');
          Ora_Save.Sql.Add(' (:duty_id, :goal_1, :goal_2, :goal_3, :goal_4, :goal_5, :goal_6)');
          Ora_Save.ParamByName('duty_id').AsString := GSdutyId;
          Ora_Save.ParamByName('goal_1').AsString  := ED_goal_1.Text;
          Ora_Save.ParamByName('goal_2').AsString  := ED_goal_2.Text;
          Ora_Save.ParamByName('goal_3').AsString  := ED_goal_3.Text;
          Ora_Save.ParamByName('goal_4').AsString  := ED_goal_4.Text;
          Ora_Save.ParamByName('goal_5').AsString  := ED_goal_5.Text;
          Ora_Save.ParamByName('goal_6').AsString  := ED_goal_6.Text;
          Ora_Save.ExecSql;
        end
      else
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('update a1dutydesc             ');
          Ora_Save.Sql.Add('   set goal_1 = :goal_1,      ');
          Ora_Save.Sql.Add('       goal_2 = :goal_2,      ');
          Ora_Save.Sql.Add('       goal_3 = :goal_3,      ');
          Ora_Save.Sql.Add('       goal_4 = :goal_4,      ');
          Ora_Save.Sql.Add('       goal_5 = :goal_5,      ');
          Ora_Save.Sql.Add('       goal_6 = :goal_6       ');
          Ora_Save.Sql.Add('where  duty_id = :duty_id     ');
          Ora_Save.ParamByName('duty_id').AsString := GSdutyId;
          Ora_Save.ParamByName('goal_1').AsString  := ED_goal_1.Text;
          Ora_Save.ParamByName('goal_2').AsString  := ED_goal_2.Text;
          Ora_Save.ParamByName('goal_3').AsString  := ED_goal_3.Text;
          Ora_Save.ParamByName('goal_4').AsString  := ED_goal_4.Text;
          Ora_Save.ParamByName('goal_5').AsString  := ED_goal_5.Text;
          Ora_Save.ParamByName('goal_6').AsString  := ED_goal_6.Text;
          Ora_Save.ExecSql;
        end;

      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('update a1duty                                      ');
      Ora_Save.Sql.Add('   set etc_team1  = :etc_team1,                    ');
      Ora_Save.Sql.Add('       etc_team2  = :etc_team2,                    ');
      Ora_Save.Sql.Add('       etc_team3  = :etc_team3,                    ');
      Ora_Save.Sql.Add('       entry_date = to_char(sysdate, ''yyyymmdd'') ');
      Ora_Save.Sql.Add('where  duty_id    = :duty_id     ');
      Ora_Save.ParamByName('duty_id').AsString   := GSdutyId;
      Ora_Save.ParamByName('etc_team1').AsString := ED_etc_team1.Text;
      Ora_Save.ParamByName('etc_team2').AsString := ED_etc_team2.Text;
      Ora_Save.ParamByName('etc_team3').AsString := ED_etc_team3.Text;
      Ora_Save.ExecSql;

      MessageDlg('저장 되었습니다', mtInformation, [mbOk], 0);
    end;
end;

procedure TMainForm.Get_Dutydesc;
begin

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1dutydesc     ');
      Sql.Add('where duty_id = :duty_id     ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      if Ora_Qry1.eof then
        begin
          ED_goal_1.Text              := '';
          ED_goal_2.Text              := '';
          ED_goal_3.Text              := '';
          ED_goal_4.Text              := '';
          ED_goal_5.Text              := '';
          ED_goal_6.Text              := '';
        end
      else
        begin
          ED_goal_1.Text              := FieldByName('goal_1').AsString;
          ED_goal_2.Text              := FieldByName('goal_2').AsString;
          ED_goal_3.Text              := FieldByName('goal_3').AsString;
          ED_goal_4.Text              := FieldByName('goal_4').AsString;
          ED_goal_5.Text              := FieldByName('goal_5').AsString;
          ED_goal_6.Text              := FieldByName('goal_6').AsString;
        end;
    end;

end;

procedure TMainForm.BT_cancel_dutyClick(Sender: TObject);
begin
  Get_Dutydesc;
end;

procedure TMainForm.DS_TaskDataChange(Sender: TObject; Field: TField);
begin
  Get_Data_Work;

  if (Trim(Ora_Task.FieldByName('task_name').AsString) = '') then
    BT_add_work.Enabled := False;

end;

procedure TMainForm.DS_WorkDataChange(Sender: TObject; Field: TField);
begin
  Get_Data_Motive;

  if Trim(Ora_Work.FieldByName('work_name').AsString) = '' then
    BT_add_motive.Enabled := False;
end;

procedure TMainForm.BT_add_taskClick(Sender: TObject);
begin
  Try
    Sub_Task := TSub_Task.Create(Self);
    Sub_Task.ED_duty_name.Text := GSDutyName;
    Sub_Task.Showmodal;
  Finally
    Sub_Task.Free;
  end;
  Get_Data_Task;
end;

procedure TMainForm.BT_add_workClick(Sender: TObject);
begin
  Try
    Sub_Work := TSub_Work.Create(Self);
    Sub_Work.ED_task_sno.Text  := Ora_Task.FieldByName('task_sno').AsString;
    Sub_Work.ED_task_name.Text := Ora_Task.FieldByName('task_name').AsString;
    Sub_Work.Showmodal;
  Finally
    Sub_Work.Free;
  end;
  Get_Data_Work;

end;

procedure TMainForm.BT_add_motiveClick(Sender: TObject);
begin
  Try
    Sub_Motive := TSub_Motive.Create(Self);
    Sub_Motive.ED_task_sno.Text  := Ora_Task.FieldByName('task_sno').AsString;
    Sub_Motive.ED_task_name.Text := Ora_Task.FieldByName('task_name').AsString;
    Sub_Motive.ED_work_sno.Text  := Ora_Work.FieldByName('work_sno').AsString;
    Sub_Motive.ED_work_name.Text := Ora_Work.FieldByName('work_name').AsString;
    Sub_Motive.NE_work_rate.Value:= Ora_Work.FieldByName('work_rate').AsFloat;

    Sub_Motive.Showmodal;
  Finally
    Sub_Motive.Free;
  end;

  Get_Data_Motive;

end;

procedure TMainForm.Get_Data_Work;
begin
//직무분석 등록 Closing --> "결재" 버튼만 활성화
{  if (WorkMode ='0') and
    ((GSStatus='입력중')     or (GSStatus='1차결재반려') or (GSStatus='1차결재취소') or
    (GSStatus='2차결재반려') or (GSStatus='2차결재취소') ) then
    BT_add_motive.Enabled := True;
}

  with Ora_Work do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1work ');
      Sql.Add('where duty_id   = :duty_id ');
      Sql.Add('  and task_sno  = :task_sno ');
      Sql.Add('order by work_sno           ');
      ParamByName('duty_id').AsString  := GSdutyId;
      ParamByName('task_sno').AsString := Ora_Task.FieldByName('task_sno').AsString;
      Open;
    end;

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select nvl(sum(work_rate),0) rate_sum from a1work ');
      Sql.Add('where duty_id   = :duty_id ');
      Sql.Add('  and task_sno  = :task_sno ');
      ParamByName('duty_id').AsString  := GSdutyId;
      ParamByName('task_sno').AsString := Ora_Task.FieldByName('task_sno').AsString;
      Open;
      NE_ratesum.Value := FieldByName('rate_sum').AsFloat;
    end;
end;

procedure TMainForm.Get_Data_Motive;
begin

  with Ora_Motive do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1motive ');
      Sql.Add('where duty_id   = :duty_id ');
      Sql.Add('  and task_sno  = :task_sno ');
      Sql.Add('  and work_sno  = :work_sno ');
      Sql.Add('order by motive_sno           ');
      ParamByName('duty_id').AsString  := GSdutyId;
      ParamByName('task_sno').AsString := Ora_Work.FieldByName('task_sno').AsString;
      ParamByName('work_sno').AsString := Ora_Work.FieldByName('work_sno').AsString;
      Open;
    end;

end;

procedure TMainForm.Get_Data_Task;
begin

  if (WorkMode ='0') and
    ((GSStatus='입력중')     or (GSStatus='1차결재반려') or (GSStatus='1차결재취소') or
    (GSStatus='2차결재반려') or (GSStatus='2차결재취소') ) then
    begin
//직무분석 등록 Closing --> "결재" 버튼만 활성화
//      BT_add_task.Enabled   := True;
//      BT_add_work.Enabled   := True;
//      BT_add_motive.Enabled := True;
    end;

  with Ora_Task do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1task ');
      Sql.Add('where duty_id = :duty_id ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;
    end;
end;

procedure TMainForm.SB_MClick(Sender: TObject);
var
  CareerTime : String;
begin
  SB_M.BtnDown  := False;
  SB_S.BtnDown  := False;
  SB_J.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  WorkerLevel := 'F';
  case TOnSkinButton(Sender).Tag of
    1 : WorkerLevel := 'M';
    2 : WorkerLevel := 'S';
    3 : WorkerLevel := 'J';
  end;

  RB_hig_yn.Checked      := False;
  RB_col_nref_yn.Checked := False;
  RB_col_ref_yn.Checked  := False;
  RB_uni_nref_yn.Checked := False;
  RB_uni_ref_yn.Checked  := False;
  RB_mas_nref_yn.Checked := False;
  RB_mas_ref_yn.Checked  := False;
  RB_doc_nref_yn.Checked := False;
  RB_doc_ref_yn.Checked  := False;

  RB_M3.Checked := False;
  RB_M6.Checked := False;
  RB_Y1.Checked := False;
  RB_Y3.Checked := False;
  RB_Y5.Checked := False;
  RB_Y7.Checked := False;
  RB_YA.Checked := False;

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1career              ');
      Sql.Add('where duty_id    = :duty_id         ');
      Sql.Add('  and worker_level = :worker_level  ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('worker_level').AsString := WorkerLevel;
      Open;

      if not Ora_Qry1.eof then
        begin
          if FieldByName('hig_yn').AsString = 'Y' then
            RB_hig_yn.Checked := True;
          if FieldByName('col_nref_yn').AsString = 'Y' then
            RB_col_nref_yn.Checked := True;
          if FieldByName('col_ref_yn').AsString  = 'Y' then
            RB_col_ref_yn.Checked := True;
          if FieldByName('uni_nref_yn').AsString = 'Y' then
            RB_uni_nref_yn.Checked := True;
          if FieldByName('uni_ref_yn').AsString  = 'Y' then
            RB_uni_ref_yn.Checked := True;
          if FieldByName('mas_nref_yn').AsString = 'Y' then
            RB_mas_nref_yn.Checked := True;
          if FieldByName('mas_ref_yn').AsString  = 'Y' then
            RB_mas_ref_yn.Checked := True;
          if FieldByName('doc_nref_yn').AsString = 'Y' then
            RB_doc_nref_yn.Checked := True;
          if FieldByName('doc_ref_yn').AsString  = 'Y' then
            RB_doc_ref_yn.Checked := True;

          CareerTime := FieldByName('career_time').AsString;

          if CareerTime ='M3' then
            RB_M3.Checked := True
          else if CareerTime ='M6' then
            RB_M6.Checked := True
          else if CareerTime ='Y1' then
            RB_Y1.Checked := True
          else if CareerTime ='Y3' then
            RB_Y3.Checked := True
          else if CareerTime ='Y5' then
            RB_Y5.Checked := True
          else if CareerTime ='Y7' then
            RB_Y7.Checked := True
          else if CareerTime ='YA' then
            RB_YA.Checked := True;
        end;
    end;

  with Ora_Ability_A do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, decode(b.task_name,'''', ''공통'', b.task_name) task_name              ');
      Sql.Add('  from a1ability a, a1task b         ');
      Sql.Add('where a.duty_id      = b.duty_id(+)  ');
      Sql.Add('  and a.task_sno     = b.task_sno(+) ');
      Sql.Add('  and a.duty_id      = :duty_id      ');
      Sql.Add('  and a.worker_level = :worker_level ');
      Sql.Add('  and a.ability_kind = ''A'' ');
      Sql.Add('order by a.ability_sno       ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('worker_level').AsString := WorkerLevel;
      Open;
    end;

  with Ora_Ability_B do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.ability_name from a1ability a, a1dic_abil b   ');
      Sql.Add('where a.item_name    = b.ability_cd       ');
      Sql.Add('  and a.duty_id      = :duty_id  ');
      Sql.Add('  and a.worker_level = :worker_level ');
      Sql.Add('  and a.ability_kind = ''B'' ');
      Sql.Add('order by a.ability_sno       ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('worker_level').AsString := WorkerLevel;
      Open;
    end;

  with Ora_Recom do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, duty_name from a1recommend a, a1duty b     ');
      Sql.Add('where a.recom_duty_id = b.duty_id  ');
      Sql.Add('  and a.duty_id       = :duty_id  ');
      Sql.Add('  and a.worker_level  = :worker_level ');
      Sql.Add('order by recom_sno       ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('worker_level').AsString := WorkerLevel;
      Open;
    end;

end;

procedure TMainForm.BT_save_msjClick(Sender: TObject);
begin
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1dutydesc ');
      Sql.Add('where duty_id = :duty_id ');
      Sql.Add('  and (manager_cnt > 0 or senior_cnt > 0 or jonior_cnt > 0)  ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;

      if Ora_Qry1.eof then
        begin
          if MessageDlg('직무조직도 상의 인원이 등록되어 있지 않습니다..'+#13+'그래도 인력비율을 저장하시겠습니까?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
            begin
              Exit;
            end;
        end;
    end;

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1dutydesc ');
      Sql.Add('where duty_id = :duty_id ');
      ParamByName('duty_id').AsString := GSdutyId;
      Open;
    end;

    if Ora_Qry1.eof then
      begin
        Ora_Save.Close;
        Ora_Save.Sql.Clear;
        Ora_Save.Sql.Add('insert into a1dutydesc                      ');
        Ora_Save.Sql.Add('   (duty_id, manager_rate,senior_rate, jonior_rate, nregular_rate) ');
        Ora_Save.Sql.Add('   values(:duty_id, :manager_rate, :senior_rate, :jonior_rate, :nregular_rate) ');

        Ora_Save.ParamByName('duty_id').AsString       := GSdutyId ;
        Ora_Save.ParamByName('manager_rate').AsFloat   := NE_manager_rate.Value  ;
        Ora_Save.ParamByName('senior_rate').AsFloat    := NE_senior_rate.Value  ;
        Ora_Save.ParamByName('jonior_rate').AsFloat    := NE_jonior_rate.Value  ;
        Ora_Save.ParamByName('nregular_rate').AsFloat  := NE_nregular_rate.Value  ;
        Ora_Save.ExecSql;
      end
    else
      begin
        Ora_Save.Close;
        Ora_Save.Sql.Clear;
        Ora_Save.Sql.Add('update a1dutydesc                      ');
        Ora_Save.Sql.Add('   set manager_rate  = :manager_rate,  ');
        Ora_Save.Sql.Add('       senior_rate   = :senior_rate,   ');
        Ora_Save.Sql.Add('       jonior_rate   = :jonior_rate,   ');
        Ora_Save.Sql.Add('       nregular_rate = :nregular_rate  ');
        Ora_Save.Sql.Add(' where duty_id       = :duty_id        ');
        Ora_Save.ParamByName('duty_id').AsString       := GSdutyId ;
        Ora_Save.ParamByName('manager_rate').AsFloat   := NE_manager_rate.Value  ;
        Ora_Save.ParamByName('senior_rate').AsFloat    := NE_senior_rate.Value  ;
        Ora_Save.ParamByName('jonior_rate').AsFloat    := NE_jonior_rate.Value  ;
        Ora_Save.ParamByName('nregular_rate').AsFloat  := NE_nregular_rate.Value  ;
        Ora_Save.ExecSql;
      end;

  MessageDlg('인력 비율이 저장되었습니다',mtInformation, [mbOk ],0) ;

  Set_Level_Buttons;
end;

procedure TMainForm.NE_manager_rateExit(Sender: TObject);
begin
  NE_tot_rate.Value := NE_manager_rate.Value + NE_senior_rate.Value + NE_jonior_rate.Value + NE_nregular_rate.Value;
end;

procedure TMainForm.BT_add_careerClick(Sender: TObject);
begin
  Try
    Sub_Career := TSub_Career.Create(Self);

    case WorkerLevel of
      'M' : begin
              Sub_Career.L_level_name.ValueCaption  := 'Manager 급';
              Sub_Career.L_worker_level.ValueCaption  := 'M';
            end;
      'S' : begin
              Sub_Career.L_level_name.ValueCaption  := 'Senior 급';
              Sub_Career.L_worker_level.ValueCaption  := 'S';
            end;
      'J' : begin
              Sub_Career.L_level_name.ValueCaption  := 'Junior 급';
              Sub_Career.L_worker_level.ValueCaption  := 'J';
            end;
    end;

    Sub_Career.Showmodal;
  Finally
    Sub_Career.Free;
  end;

  case WorkerLevel of
    'M' : SB_MClick(SB_M);
    'S' : SB_MClick(SB_S);
    'J' : SB_MClick(SB_J);
  end;

end;

procedure TMainForm.CB_duty_nameChange(Sender: TObject);
begin

  with Ora_Qry2 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('Select * from a1duty         ');
      Sql.Add('where duty_id     = :duty_id ');
      ParamByName('duty_id').AsString := Copy(CB_duty_name.Text,61,5);
      Open;

      if Ora_Qry2.eof then
        begin
          Exit;
        end;

      L_entry_date.ValueCaption    := Copy(FieldByName('entry_date').AsString,1,4)+'-'+Copy(FieldByName('entry_date').AsString,5,2)+'-'+Copy(FieldByName('entry_date').AsString,7,2);
      L_entry_name.ValueCaption    := FieldByName('entry_name').AsString;
      L_decide1_name.ValueCaption  := FieldByName('decide1_name').AsString;
      L_decide2_name.ValueCaption  := FieldByName('decide2_name').AsString;
      E_group_major.Text           := FieldByName('group_major').AsString;
      E_group_minor.Text           := FieldByName('group_minor').AsString;
      E_main_team.Text             := FieldByName('main_team').AsString;
      ED_etc_team1.Text            := FieldByName('etc_team1').AsString;
      ED_etc_team2.Text            := FieldByName('etc_team2').AsString;
      ED_etc_team3.Text            := FieldByName('etc_team3').AsString;

      GSdutyId                     := FieldByName('duty_id').AsString;
      GSdutyName                   := FieldByName('duty_name').AsString;

      GS_entry_empno               := FieldByName('entry_empno').AsString;
      GS_decide1_empno             := FieldByName('decide1_empno').AsString;
      GS_decide2_empno             := FieldByName('decide2_empno').AsString;

      GS_entry_name                := FieldByName('entry_name').AsString;
      GS_decide1_name              := FieldByName('decide1_name').AsString;
      GS_decide2_name              := FieldByName('decide2_name').AsString;


      if Trim(FieldByName('decide_stat').AsString) = '' then
        begin
          GSStatus                    := '입력중';
          L_con_status.ValueCaption   := '입력중';
        end
      else
        begin
          GSStatus                    := FieldByName('decide_stat').AsString;
          L_con_status.ValueCaption   := FieldByName('decide_stat').AsString;
        end;

      WorkMode := '9';
      if GSempno = FieldByName('entry_empno').AsString then
        WorkMode := '0'
      else if GSempno = FieldByName('decide1_empno').AsString then
        WorkMode := '1'
      else if GSempno = FieldByName('decide2_empno').AsString then
        WorkMode := '2';

      SameYN := False;

      if FieldByName('decide1_empno').AsString = FieldByName('decide2_empno').AsString then //1차, 2차 결재자가 같은 경우
        SameYN := True;

      Set_Buttons(GSStatus);
      Get_Dutydesc;
    end;

end;

procedure TMainForm.Set_Buttons(ConMode : String);
begin
//자료 저장 버튼

//직무분석 등록 Closing --> "결재" 버튼만 활성화
  BT_save_duty.Enabled   := False;
  BT_cancel_duty.Enabled := False;
  BT_add_task.Enabled    := False;
  BT_add_work.Enabled    := False;
  BT_add_motive.Enabled  := False;
  BT_mansave.Enabled     := False;
  BT_add.Enabled         := False;
  BT_mod.Enabled         := False;
  BT_save.Enabled        := False;
  BT_cancel.Enabled      := False;
  BT_del.Enabled         := False;
  BT_orgsnd.Enabled      := False;
  BT_save_msj.Enabled    := False;
  BT_add_career.Enabled  := False;

{ if (WorkMode ='0') and
    ((ConMode='입력중')      or (ConMode='1차결재반려') or (ConMode='1차결재취소') or
     (ConMode='2차결재반려') or (ConMode='2차결재취소') ) then
    begin
      BT_save_duty.Enabled   := True;
      BT_cancel_duty.Enabled := True;
      BT_add_task.Enabled    := True;
      BT_add_work.Enabled    := True;
      BT_add_motive.Enabled  := True;
      BT_mansave.Enabled     := True;
      BT_add.Enabled         := True;
      BT_mod.Enabled         := True;
      BT_save.Enabled        := True;
      BT_cancel.Enabled      := True;
      BT_del.Enabled         := True;
      BT_orgsnd.Enabled      := True;
      BT_save_msj.Enabled    := True;
      BT_add_career.Enabled  := True;
    end
  else
    begin
      BT_save_duty.Enabled   := False;
      BT_cancel_duty.Enabled := False;
      BT_add_task.Enabled    := False;
      BT_add_work.Enabled    := False;
      BT_add_motive.Enabled  := False;
      BT_mansave.Enabled     := False;
      BT_add.Enabled         := False;
      BT_mod.Enabled         := False;
      BT_save.Enabled        := False;
      BT_cancel.Enabled      := False;
      BT_del.Enabled         := False;
      BT_orgsnd.Enabled      := False;
      BT_save_msj.Enabled    := False;
      BT_add_career.Enabled  := False;
    end;
}

//결재 관련 버튼
  BT_finish.Enabled    := False;
  BT_con.Enabled       := False;
  BT_rej.Enabled       := False;
  BT_concancel.Enabled := False;

  if (ConMode = '입력중') or (ConMode = '1차결재반려') or (ConMode = '1차결재취소') or (ConMode = '2차결재반려') or (ConMode = '2차결재취소') then
    begin
      if WorkMode = '0' then
        begin
//직무분석 등록 Closing --> "결재" 버튼만 활성화
          BT_finish.Enabled := True;
        end;
    end
  else if ConMode = '결재상신' then
    begin
      if WorkMode ='1' then
        begin
          BT_con.Enabled := True;
//직무분석 등록 Closing --> "결재" 버튼만 활성화
//          BT_rej.Enabled := True;
        end;
    end
  else if ConMode = '1차결재승인' then
    begin
      if WorkMode ='1' then
        begin
//직무분석 등록 Closing --> "결재" 버튼만 활성화
//          BT_concancel.Enabled := True;
        end
      else if WorkMode ='2' then
        begin
          BT_con.Enabled       := True;
//직무분석 등록 Closing --> "결재" 버튼만 활성화
//          BT_rej.Enabled       := True;
        end;
    end
  else if ConMode = '2차결재승인' then
    begin
      if (WorkMode ='2') or ((WorkMode ='1') and SameYN) then
        begin
//직무분석 등록 Closing --> "결재" 버튼만 활성화
//          BT_concancel.Enabled := True;
        end;
    end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.ED_org_dutynameInitPopup(Sender: TObject);
begin
  CForm.Edit         := TOnWinPopupEdit(Sender);
  CForm.DutyId       := GSDutyId;
  CForm.FromWhere    := 'ORG';
  TOnWinPopupEdit(Sender).PopupControl := CForm ;
end;

procedure TMainForm.ED_org_dutynameCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  if CForm.Code <> '' then
    begin
      ED_org_dutyname.Text   := CForm.CodeName;
    end;

end;

procedure TMainForm.Set_InputField(arg1, arg2 : Boolean );
begin
  Grid2.Enabled    := not arg1;
  Grid3.Enabled    := not arg1;
  Grid4.Enabled    := not arg1;

  ED_org_dutyname.Enabled  := arg1;
  CB_org_level.Enabled     := arg1;
  ED_person_cnt.Enabled    := arg1;
  ED_up_org_name.Enabled   := arg1;

  if arg2 then
    begin
      ED_org_dutyname.Text    := '';
      CB_org_level.ItemIndex  := -1;
      ED_person_cnt.Value     := 0 ;
      ED_up_org_id.Text       := '';
      ED_up_org_name.Text     := '';
    end;

end;


procedure TMainForm.BT_addClick(Sender: TObject);
begin

  JobMode            := 'I';
  Set_InputField(True, True);
  ED_org_dutyname.SetFocus

end;

procedure TMainForm.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
  max_org_id : Integer;
begin
  if Trim(ED_org_dutyname.Text) ='' then
    begin
      MessageDlg('과업명을 입력해 주세요' , mtInformation, [mbOk], 0);
      Exit;
    end;

  if Trim(CB_org_level.Text) ='' then
    begin
      MessageDlg('관리 Level을 입력해 주세요' , mtInformation, [mbOk], 0);
      Exit;
    end;

  if ED_person_cnt.Value = 0 then
    begin
      MessageDlg('인원수를 입력해 주세요' , mtInformation, [mbOk], 0);
      Exit;
    end;

  if JobMode = 'I' then
    begin
      Ora_Qry1.Close;
      Ora_Qry1.Sql.Clear;
      Ora_Qry1.Sql.Add('select max(org_id) + 1 org_id from a1org ');
      Ora_Qry1.Open;
      max_org_id := Ora_Qry1.FieldByName('org_id').AsInteger;

      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('insert into a1org           ');
      Ora_Save.Sql.Add(' (org_id, duty_id, org_name, org_level, person_cnt, up_org_id  )     ');
      Ora_Save.Sql.Add('values                              ');
      Ora_Save.Sql.Add(' (:org_id, :duty_id, :org_name, :org_level, :person_cnt, :up_org_id  )     ');
      Ora_Save.ParamByName('org_id').AsInteger     := max_org_id ;
      Ora_Save.ParamByName('duty_id').AsString     := GSDutyId ;
      Ora_Save.ParamByName('org_name').AsString    := ED_org_dutyname.Text;
      Ora_Save.ParamByName('org_level').AsInteger  := CB_org_level.ItemIndex+2;
      Ora_Save.ParamByName('person_cnt').AsFloat   := ED_person_cnt.Value;
      Ora_Save.ParamByName('up_org_id').AsString   := ED_up_org_id.Text;
      Ora_Save.ExecSql;
    end
  else if JobMode = 'U' then
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('update a1org                           ');
      Ora_Save.Sql.Add('   set org_name    = :org_name,        ');
      Ora_Save.Sql.Add('       org_level   = :org_level,       ');
      Ora_Save.Sql.Add('       person_cnt  = :person_cnt,      ');
      Ora_Save.Sql.Add('       up_org_id   = :up_org_id        ');
      Ora_Save.Sql.Add(' WHERE org_id      = :org_id           ');
      Ora_Save.ParamByName('org_id').AsString      := ED_orgId.Text ;
      Ora_Save.ParamByName('org_name').AsString    := ED_org_dutyname.Text ;
      Ora_Save.ParamByName('person_cnt').Asfloat   := ED_person_cnt.Value;
      Ora_Save.ParamByName('org_level').AsInteger  := CB_org_level.ItemIndex+2;
      Ora_Save.ParamByName('up_org_id').AsString   := ED_up_org_id.Text;
      Ora_Save.ExecSql;
    end
  else
    System.Exit;

  Update_dutyCnt;
  Read_Org;
  MessageDlg('직무조직이 저장되었습니다',mtInformation, [mbOk ],0) ;
  JobMode               := 'F';
  Set_InputField(False, False );
end;

procedure TMainForm.Read_Org;
begin
  ED_Manager.Value := 0;
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.* from a1org a     ');
      Sql.Add(' where a.duty_id   = :duty_id ');
      Sql.Add('   and a.org_level = 1      ');
      ParamByName('duty_id').AsString := GSDutyId;
      Open;
      ED_Manager.EditLabel.Caption := GSdutyName;
      ED_Manager.Value             := FieldByName('person_cnt').AsFloat;
    end;

  with Ora_Senior do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.org_name up_org_name, decode(b.org_level,1,''Manager'',2, ''Senior'', 3,''Junior'',4, ''비정규직'') up_org_level from a1org a, a1org b      ');
      Sql.Add(' where a.up_org_id = b.org_id(+)       ');
      Sql.Add('   and a.duty_id = :duty_id ');
      Sql.Add('   and a.org_level = 2      ');
      ParamByName('duty_id').AsString := GSDutyId;
      Open;
    end;

  with Ora_Jonior do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.org_name up_org_name, decode(b.org_level,1,''Manager'',2, ''Senior'', 3,''Junior'',4, ''비정규직'') up_org_level from a1org a, a1org b                ');
      Sql.Add(' where a.up_org_id = b.org_id(+)     ');
      Sql.Add('   and a.duty_id   = :duty_id        ');
//      Sql.Add('   and a.up_org_id = :up_org_id      ');
      Sql.Add('   and a.org_level = 3               ');
      ParamByName('duty_id').AsString := GSDutyId;
//      ParamByName('up_org_id').AsString := Ora_Senior.FieldByName('org_id').AsString;
      Open;
    end;

  with Ora_N do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.org_name up_org_name, decode(b.org_level,1,''Manager'',2, ''Senior'', 3,''Junior'',4, ''비정규직'') up_org_level from a1org a, a1org b                ');
      Sql.Add(' where a.up_org_id = b.org_id(+)     ');
      Sql.Add('   and a.duty_id   = :duty_id        ');
//      Sql.Add('   and a.up_org_id = :up_org_id      ');
      Sql.Add('   and a.org_level = 4               ');
      ParamByName('duty_id').AsString := GSDutyId;
//      ParamByName('up_org_id').AsString := Ora_Jonior.FieldByName('org_id').AsString;
      Open;
    end;
end;

procedure TMainForm.Update_dutyCnt;
begin
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update a1dutydesc a                        ');
      Sql.Add('   set (manager_cnt, senior_cnt, jonior_cnt, nregular_cnt)  =            ');
      Sql.Add('       (select  sum(decode(org_level, 1, person_cnt, 0)) M,  ');
      Sql.Add('                sum(decode(org_level, 2, person_cnt, 0)) S,  ');
      Sql.Add('                sum(decode(org_level, 3, person_cnt, 0)) J,  ');
      Sql.Add('                sum(decode(org_level, 4, person_cnt, 0)) N   ');
      Sql.Add('          from a1org b                                     ');
      Sql.Add('          where a.duty_id = b.duty_id )                    ');
      Sql.Add(' where duty_id    =  :duty_id                              ');
      ParamByName('duty_id').AsString        := GSDutyId ;
      ExecSql;
    end;  
end;

procedure TMainForm.ED_up_org_nameInitPopup(Sender: TObject);
begin
  OrgForm.Edit         := TOnWinPopupEdit(Sender);
  OrgForm.DutyId       := GSDutyId;
  OrgForm.OrgLevel     := CB_org_level.ItemIndex + 2;
  OrgForm.FromWhere    := 'UPORG';
  TOnWinPopupEdit(Sender).PopupControl := OrgForm ;

end;

procedure TMainForm.ED_up_org_nameCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if OrgForm.Code  <> '' then
    begin
      ED_up_org_id.Text     := OrgForm.Code;
      ED_up_org_name.Text   := OrgForm.CodeName;
    end;

end;

procedure TMainForm.Grid2CellClick(Column: TColumn);
begin
  Grid2.BarColor        := $00CAD3C0;
  Grid3.BarColor        := clBtnFace;
  Grid4.BarColor        := clBtnFace;

  ED_orgId.Text         := Ora_Senior.FieldByName('org_id').AsString;
  ED_org_dutyname.Text   := Ora_Senior.FieldByName('org_name').AsString;
  CB_org_level.ItemIndex := (Ora_Senior.FieldByName('org_level').AsInteger) - 2;
  ED_person_cnt.Value    := Ora_Senior.FieldByName('person_cnt').AsFloat;
  ED_up_org_name.Text    := Ora_Senior.FieldByName('up_org_name').AsString;
  ED_up_org_id.Text      := Ora_Senior.FieldByName('up_org_id').AsString;

  with Ora_Jonior do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, b.org_name up_org_name, decode(b.org_level,1,''Manager'',2, ''Senior'', 3,''Junior'',4, ''비정규직'') up_org_level from a1org a, a1org b                ');
      Sql.Add(' where a.up_org_id = b.org_id(+)     ');
      Sql.Add('   and a.duty_id   = :duty_id        ');
      Sql.Add('   and a.up_org_id = :up_org_id      ');
      Sql.Add('   and a.org_level = 3               ');
      ParamByName('duty_id').AsString := GSDutyId;
      ParamByName('up_org_id').AsString := Ora_Senior.FieldByName('org_id').AsString;
      Open;
    end;
    
end;

procedure TMainForm.Grid3CellClick(Column: TColumn);
begin
  Grid2.BarColor        := clBtnFace;
  Grid3.BarColor        := $00CAD3C0;
  Grid4.BarColor        := clBtnFace;

  ED_orgId.Text         := Ora_Jonior.FieldByName('org_id').AsString;
  ED_org_dutyname.Text   := Ora_Jonior.FieldByName('org_name').AsString;
  CB_org_level.ItemIndex := (Ora_Jonior.FieldByName('org_level').AsInteger) - 2;
  ED_person_cnt.Value    := Ora_Jonior.FieldByName('person_cnt').AsFloat;
  ED_up_org_name.Text    := Ora_Jonior.FieldByName('up_org_name').AsString;
  ED_up_org_id.Text      := Ora_Jonior.FieldByName('up_org_id').AsString;

end;

procedure TMainForm.Grid4CellClick(Column: TColumn);
begin
  Grid2.BarColor        := clBtnFace;
  Grid3.BarColor        := clBtnFace;
  Grid4.BarColor        := $00CAD3C0;

  ED_orgId.Text          := Ora_N.FieldByName('org_id').AsString;
  ED_org_dutyname.Text   := Ora_N.FieldByName('org_name').AsString;
  CB_org_level.ItemIndex := (Ora_N.FieldByName('org_level').AsInteger) - 2;
  ED_person_cnt.Value    := Ora_N.FieldByName('person_cnt').AsFloat;
  ED_up_org_name.Text    := Ora_N.FieldByName('up_org_name').AsString;
  ED_up_org_id.Text      := Ora_N.FieldByName('up_org_id').AsString;

end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);
end;

procedure TMainForm.BT_delClick(Sender: TObject);
var
  tmpLevel : String;
begin
  if ED_orgId.Text ='' then
    begin
      MessageDlg('삭제할 직무 조직을 선택해주세요', mtError, [mbOk], 0);
      Exit;
    end;
  tmpLevel := CB_org_level.Text;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1org                   ');
      Sql.Add(' where org_id       = :org_id        ');
      ParamByName('org_id').AsString       := ED_orgId.Text;
      ExecSql;
      MessageDlg(tmpLevel+' 직무 조직이 삭제되었습니다.',mtInformation, [mbOk],0);
    end;
  ED_org_dutyname.Text   := '';
  CB_org_level.ItemIndex := -1;
  ED_person_cnt.Value    :=  0;
  ED_up_org_name.Text    := '';
  ED_up_org_id.Text      := '';
  ED_orgId.Text          := '';

  Update_dutyCnt;
  Read_Org;

end;

procedure TMainForm.BT_orgrcvClick(Sender: TObject);
var
   ObjName : String;
   fileyn  : Boolean;
begin
  ObjName     := Replace(GSDutyName,'/',' ') +'.PPT';
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_DownLoad(8,'/hper/insa/hperson/usrbin/Zbin',ObjName,ObjName,'도움말', FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
//  if not FM_DownLoad.PL_FTPFileExists('/hper/insa/hperson/usrbin/Zbin',ObjName) then
//  begin
//       FM_DownLoad.PL_DownLoad(8,'/hper/insa/hperson/usrbin/Zbin','직무조직도.PPT','직직무조직.PPT','도움말'); //단위 프로그램 다운받기.
//  end
//  else
//  begin
//       FM_DownLoad.PL_DownLoad(8,'/hper/insa/hperson/usrbin/Zbin',ObjName,ObjName,'도움말'); //단위 프로그램 다운받기.
//  end;
end;

procedure TMainForm.BT_orgsndClick(Sender: TObject);
var
   ObjName, FL_dir : String;
begin
  MessageDlg('전송하기전 파워포인트 조직도 파일을 먼저 닫아주세요', mtInformation, [mbOk], 0);

  if   OpenDialog1.Execute then FL_dir := OpenDialog1.FileName
  else Exit;

  ObjName     := Uppercase(Replace(GSDutyName,'/',' ')+'.PPT'); //저장하고자하는 파일명
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;

  FM_DownLoad.PL_UpLoad(FL_dir,'/hper/insa/hperson/usrbin/Zbin', ObjName, FL_UnixIP, FL_FtpUser, FL_FtpPass); //업로드
end;

procedure TMainForm.BT_mansaveClick(Sender: TObject);
var
  max_org_id : Integer;
begin
{  if (ED_Manager.Value < 0) or (ED_Manager.Value > 1) then
    begin
      MessageDlg('Manager의 인원수는 0~1사이만 입력가능합니다. 확인하시고 다시 입력해 주세요', mtInformation, [mbOk],0);
      Exit;
    end;
}
  Ora_Qry1.Close;
  Ora_Qry1.Sql.Clear;
  Ora_Qry1.Sql.Add('select * from a1org ');
  Ora_Qry1.Sql.Add('where duty_id   = :duty_id ');
  Ora_Qry1.Sql.Add('  and org_level = 1        ');
  Ora_Qry1.ParamByName('duty_id').AsString := GSDutyId;
  Ora_Qry1.Open;

  if Ora_Qry1.eof then
    begin
      Ora_Qry1.Close;
      Ora_Qry1.Sql.Clear;
      Ora_Qry1.Sql.Add('select max(org_id) + 1 org_id from a1org ');
      Ora_Qry1.Open;
      max_org_id := Ora_Qry1.FieldByName('org_id').AsInteger;

      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('insert into a1org           ');
      Ora_Save.Sql.Add(' (org_id, duty_id, org_name, org_level, person_cnt, up_org_id  )     ');
      Ora_Save.Sql.Add('values                              ');
      Ora_Save.Sql.Add(' (:org_id, :duty_id, :org_name, :org_level, :person_cnt, :up_org_id  )     ');
      Ora_Save.ParamByName('org_id').AsInteger     := max_org_id ;
      Ora_Save.ParamByName('duty_id').AsString     := GSDutyId ;
      Ora_Save.ParamByName('org_name').AsString    := ED_Manager.EditLabel.Caption;
      Ora_Save.ParamByName('org_level').AsInteger  := 1 ;
      Ora_Save.ParamByName('person_cnt').AsFloat   := ED_Manager.Value;
      Ora_Save.ParamByName('up_org_id').AsString   := '0';
      Ora_Save.ExecSql;
    end
  else
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('update a1org                           ');
      Ora_Save.Sql.Add('   set org_name    = :org_name,        ');
      Ora_Save.Sql.Add('       org_level   = :org_level,       ');
      Ora_Save.Sql.Add('       person_cnt  = :person_cnt,      ');
      Ora_Save.Sql.Add('       up_org_id   = :up_org_id        ');
      Ora_Save.Sql.Add(' WHERE org_id      = :org_id           ');
      Ora_Save.ParamByName('org_id').AsString      := Ora_Qry1.FieldByName('org_id').AsString ;
      Ora_Save.ParamByName('org_name').AsString    := ED_Manager.EditLabel.Caption;
      Ora_Save.ParamByName('person_cnt').AsFloat   := ED_Manager.Value;
      Ora_Save.ParamByName('org_level').AsInteger  := 1;
      Ora_Save.ParamByName('up_org_id').AsString   := '0';
      Ora_Save.ExecSql;
    end;

  Update_dutyCnt;
  MessageDlg('Manager 인원이 저장되었습니다',mtInformation, [mbOk ],0) ;
end;

procedure TMainForm.BT_finishClick(Sender: TObject);
begin
  if MessageDlg('결재상신 처리되면 데이터를 수정하지 못합니다. 결재상신 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Exit;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update a1duty                 ');
      Sql.Add('   set decide_stat  = :decide_stat       ');
      Sql.Add('where  duty_id = :duty_id     ');
      ParamByName('duty_id').AsString := GSdutyId;
      ParamByName('decide_stat').AsString  := '결재상신' ;
      ExecSql;
    end;

{2017.10.31 jissi 메일발송 삭제 서정배 선임.
//메일발송 Start
  Application.ProcessMessages;
  if not Assigned(nMail) then
    begin
      try
        nMail := CoLotusNotes_Hana.Create;
      except
        begin
          nMail := nil;
          System.Exit;
        end;
      end;
      try
        while not nMail.GetInstance do
      except
        begin
          if Assigned(nMail) then
             nMail := nil;
          Close;
          System.Exit;
       end;
      end;
    end;

  try
//    nMail.SendFrom   := '유효성' + ' ' + 'Z300';
//    nMail.SendTo     := 'Z300';
//    nMail.SendToName := '유효성';
    nMail.SendFrom   := GSkorname + ' ' + GSempno;
    nMail.SendTo     := GS_decide1_empno;    //1차 결재자에게
    nMail.SendToName := GS_decide1_name;

    nMail.CorName    := 'HANARO';
    nMail.Subject    := GSdutyName + ' 직무분석서가 결재 상신되었습니다.';
    nMail.Body       := '1/12까지 결재를 완료하여 주시기 바랍니다.'+#13#10+#13#10+
                        '종합인사 - 기타 - 직무분석서 등록 프로그램에서 직무분석서를 결재해 주시기 바랍니다.' ;

    nMail.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
    Halt;
  end;
//메일발송 End
  }
  MessageDlg('결재상신 처리가 완료되었습니다.', mtInformation, [mbOk],0);
  CB_duty_nameChange(Sender);
end;

procedure TMainForm.BT_conClick(Sender: TObject);
var
  ConStatus : String;
begin
  if MessageDlg('결재 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Exit;

  if SameYN then
    ConStatus  := '2차결재승인'
  else
    ConStatus  := WorkMode+'차결재승인' ;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update a1duty                             ');
      Sql.Add('   set decide_stat  = :decide_stat,       ');

      if SameYN then
        Sql.Add('       decide2_date = sysdate           ')
      else if WorkMode ='1' then
        Sql.Add('       decide1_date = sysdate           ')
      else //if WorkMode ='2' then
        Sql.Add('       decide2_date = sysdate           ');

      Sql.Add('where  duty_id = :duty_id     ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('decide_stat').AsString  := ConStatus;
      ExecSql;
    end;
{2017.10.31 jissi 메일발송 삭제 서정배 선임.
//메일발송 Start
  Application.ProcessMessages;
  if not Assigned(nMail) then
    begin
      try
        nMail := CoLotusNotes_Hana.Create;
      except
        begin
          nMail := nil;
          System.Exit;
        end;
      end;

      try
        while not nMail.GetInstance do
      except
        begin
          if Assigned(nMail) then
             nMail := nil;
          Close;
          System.Exit;
        end;
      end;
    end;

  try //메일발송 1 -- 담당자에게
    nMail.SendFrom   := GSkorname + ' ' + GSempno;
    nMail.SendTo     := GS_entry_empno;
    nMail.SendToName := GS_entry_name;

    nMail.CorName    := 'HANARO';
    nMail.Subject    := GSdutyName + ' 직무분석서 '+ConStatus+'이 완료되었습니다.';
    nMail.Body       := '직무명 : '+GSdutyName+ ' 직무분석서에 대한 '+ConStatus+'이 완료되었습니다.';

    nMail.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
    Halt;
  end;

  if (WorkMode = '2') and (not SameYN) then
    begin
      try //메일발송 2 -- 1차결재자에게
        nMail.SendFrom   := GSkorname + ' ' + GSempno;
        nMail.SendTo     := GS_decide1_empno;
        nMail.SendToName := GS_decide1_name;

        nMail.CorName    := 'HANARO';
        nMail.Subject    := GSdutyName + ' 직무분석서 '+ConStatus+'이 완료되었습니다.';
        nMail.Body       := '직무명 : '+GSdutyName+ ' 직무분석서에 대한 '+ConStatus+'이 완료되었습니다.';

        nMail.SendMail;
      except
        MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
        Halt;
      end;
    end;

  if (WorkMode = '1') and (not SameYN) then
    begin
      try //메일발송 3 -- 2차결재자에게
        nMail.SendFrom   := GSkorname + ' ' + GSempno;
        nMail.SendTo     := GS_decide2_empno;
        nMail.SendToName := GS_decide2_name;

        nMail.CorName    := 'HANARO';
        nMail.Subject    := GSdutyName + ' 직무분석서가 결재 상신 되었습니다.';
        nMail.Body       := '1/13까지 결재를 완료하여 주시기 바랍니다.'+#13#10+#13#10+
                            '종합인사 - 기타 - 직무분석서 등록 프로그램에서 직무분석서를 결재해 주시기 바랍니다.' ;

        nMail.SendMail;
      except
        MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
        Halt;
      end;
    end;


//메일발송 End
}
  MessageDlg('결재 되었습니다.', mtInformation, [mbOk],0);
  CB_duty_nameChange(Sender);
end;

procedure TMainForm.BT_rejClick(Sender: TObject);
var
  ConStatus : String;
begin
  if MessageDlg('반려 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Exit;

  if SameYN then
    ConStatus  := '2차결재반려'
  else
    ConStatus  := WorkMode+'차결재반려' ;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update a1duty                  ');
      Sql.Add('   set decide_stat  = :decide_stat,       ');

      if SameYN then
        Sql.Add('     decide2_date = sysdate              ')
      else if WorkMode = '1' then
        Sql.Add('     decide1_date = sysdate              ')
      else //if WorkMode = '2' then
        Sql.Add('     decide2_date = sysdate              ');

      Sql.Add('where  duty_id = :duty_id      ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('decide_stat').AsString  := ConStatus;
      ExecSql;
    end;
{2017.10.31 jissi 메일발송 삭제 서정배 선임.
//메일발송 Start
  Application.ProcessMessages;
  if not Assigned(nMail) then
    begin
      try
        nMail := CoLotusNotes_Hana.Create;
      except
        begin
          nMail := nil;
          System.Exit;
        end;
      end;
      try
        while not nMail.GetInstance do
      except
        begin
          if Assigned(nMail) then
             nMail := nil;
          Close;
          System.Exit;
       end;
      end;
    end;

  try  //메일발송 1 -- 입력자에게
    nMail.SendFrom   := GSKorname + ' ' + GSempno;
    nMail.SendTo     := GS_entry_empno;    //SameYN인경우 입력자에게, 아닌경우 입력자 ,1차결재자에게
    nMail.SendToName := GS_entry_name;

    nMail.CorName    := 'HANARO';
    nMail.Subject    := GSdutyName +' 직무분석서가 반려되었습니다.';
    nMail.Body       := '1/13까지 결재가 완료될수 있도록 수정후 재 상신해 주시기 바랍니다..'+#13#10+#13#10+
                        '종합인사 - 기타 - 직무분석서 등록 프로그램에서 직무분석서를 수정하시고 결재상신 해주시기 바랍니다.' ;
    nMail.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
    Halt;
  end;

  if (WorkMode ='2') and (not SameYN) then
    begin
      try //메일발송2 -- 1차결재자에게
        nMail.SendFrom   := GSKorname + ' ' + GSempno;
        nMail.SendTo     := GS_decide1_empno;    //SameYN인경우 입력자에게, 아닌경우 입력자 ,1차결재자에게
        nMail.SendToName := GS_decide1_name;

        nMail.CorName    := 'HANARO';
        nMail.Subject    := GSdutyName +' 직무분석서가 반려되었습니다.';
        nMail.Body       := '직무명 : '+GSdutyName+ '에 대한 직무분석서가 반려되었습니다..' ;
        nMail.SendMail;
      except
        MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
        Halt;
      end;
    end;
//메일발송 End
}
  MessageDlg('반려 되었습니다.', mtInformation, [mbOk],0);
  CB_duty_nameChange(Sender);
end;

procedure TMainForm.BT_concancelClick(Sender: TObject);
var
  ConStatus : String;
begin
  if MessageDlg('결재를 취소 하시겠습니까?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
    Exit;

  if SameYN then
    ConStatus  := '2차결재취소'
  else
    ConStatus  := WorkMode+'차결재취소' ;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update a1duty                 ');
      Sql.Add('   set decide_stat  = :decide_stat,       ');

      if SameYN then
        Sql.Add('     decide2_date = sysdate              ')
      else if WorkMode ='1' then
        Sql.Add('     decide1_date = sysdate              ')
      else //if workMode ='2' then
        Sql.Add('     decide2_date = sysdate              ');

      Sql.Add('where  duty_id = :duty_id     ');
      ParamByName('duty_id').AsString      := GSdutyId;
      ParamByName('decide_stat').AsString  := ConStatus;
      ExecSql;
    end;
{2017.10.31 jissi 메일발송 삭제 서정배 선임.
//메일발송 Start
  Application.ProcessMessages;
  if not Assigned(nMail) then
    begin
      try
        nMail := CoLotusNotes_Hana.Create;
      except
        begin
          nMail := nil;
          System.Exit;
        end;
      end;
      try
        while not nMail.GetInstance do
      except
        begin
          if Assigned(nMail) then
             nMail := nil;
          Close;
          System.Exit;
       end;
      end;
    end;

  try   //메일발송1 -- 입력자에게
    nMail.SendFrom   := GSkorname+ ' ' + GSempno;
    nMail.SendTo     := GS_entry_empno;       //SameYN인경우 입력자에게, 아닌경우 입력자 ,1차결재자에게
    nMail.SendToName := GS_entry_name;

    nMail.CorName    := 'HANARO';
    nMail.Subject    := GSdutyName +' 직무분석서가 결재취소 되었습니다.';
    nMail.Body       := '1/13까지 결재가 완료될수 있도록 수정후 재 상신해 주시기 바랍니다..'+#13#10+#13#10+
                        '종합인사 - 기타 - 직무분석서 등록 프로그램에서 직무분석서를 수정하시고 결재상신 해주시기 바랍니다.' ;
    nMail.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
    Halt;
  end;

  if (WorkMode ='2') and (not SameYN) then
    begin
      try   //메일발송2 -- 1차결재자에게
        nMail.SendFrom   := GSkorname+ ' ' + GSempno;
        nMail.SendTo     := GS_decide1_empno;       //SameYN인경우 입력자에게, 아닌경우 입력자 ,1차결재자에게
        nMail.SendToName := GS_decide1_name;

        nMail.CorName    := 'HANARO';
        nMail.Subject    := GSdutyName +' 직무분석서가 결재 취소 되었습니다';
        nMail.Body       := '직무명 : '+GSdutyName+ '에 대한 직무분석서가 결재취소 되었습니다..';
        nMail.SendMail;
      except
        MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
        Halt;
      end;
    end;
//메일발송 End
}
  MessageDlg('결재가 취소 되었습니다.', mtInformation, [mbOk],0);
  CB_duty_nameChange(Sender);
end;


end.






