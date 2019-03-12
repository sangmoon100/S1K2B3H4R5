unit PZK10102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ExtCtrls, OnShapeLabel, OnSkinBtn,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, Grids,
  DBGrids, OnGrDBGrid, OnPopupEdit, OnEditNumCtl, ComCtrls, Db, DBAccess,
  Ora, MemDS, DBTables;

type
  TSub_Career = class(TForm)
    Notebook1: TNotebook;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    Grid_AbilityS: TOnGrDbGrid;
    OnShapeLabel26: TOnShapeLabel;
    ED_item_name: TOnEdit;
    OnShapeLabel6: TOnShapeLabel;
    CB_import_kind: TOnComboEdit;
    CB_req_kind: TOnComboEdit;
    ED_license_item: TOnEdit;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel30: TOnShapeLabel;
    Grid_AbilityB: TOnGrDbGrid;
    CB_req_kindB: TOnComboEdit;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    OnShapeLabel9: TOnShapeLabel;
    Grid_Recom: TOnGrDbGrid;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_3: TOnSkinButton;
    SB_4: TOnSkinButton;
    L_level_name: TOnShapeLabel;
    OnShapeLabel11: TOnShapeLabel;
    Shape1: TShape;
    ED_recom_duty: TOnWinPopupEdit;
    P_recom: TPanel;
    StatusBar1: TStatusBar;
    Ora_Qry1: TOraQuery;
    DS_AbilityS: TDataSource;
    ED_ability_sno: TOnEdit;
    ED_task_sno: TOnWinPopupEdit;
    Label10: TLabel;
    OnShapeLabel21: TOnShapeLabel;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel23: TOnShapeLabel;
    OnShapeLabel38: TOnShapeLabel;
    OnShapeLabel40: TOnShapeLabel;
    OnShapeLabel42: TOnShapeLabel;
    OnShapeLabel44: TOnShapeLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    P_col: TPanel;
    Shape3: TShape;
    RB_col_nref_yn: TRadioButton;
    RB_col_ref_yn: TRadioButton;
    P_uni: TPanel;
    Shape4: TShape;
    RB_uni_nref_yn: TRadioButton;
    RB_uni_ref_yn: TRadioButton;
    P_mas: TPanel;
    Shape5: TShape;
    RB_mas_nref_yn: TRadioButton;
    RB_mas_ref_yn: TRadioButton;
    P_doc: TPanel;
    Shape6: TShape;
    RB_doc_nref_yn: TRadioButton;
    RB_doc_ref_yn: TRadioButton;
    Panel8: TPanel;
    Panel14: TPanel;
    Shape10: TShape;
    Panel15: TPanel;
    Panel16: TPanel;
    Shape2: TShape;
    OnShapeLabel46: TOnShapeLabel;
    OnShapeLabel47: TOnShapeLabel;
    OnShapeLabel48: TOnShapeLabel;
    OnShapeLabel49: TOnShapeLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    RB_M3: TRadioButton;
    RB_M6: TRadioButton;
    RB_Y1: TRadioButton;
    RB_Y3: TRadioButton;
    RB_Y5: TRadioButton;
    RB_Y7: TRadioButton;
    RB_YA: TRadioButton;
    L_worker_level: TOnShapeLabel;
    Ora_Save: TOraQuery;
    SB_close: TOnSkinButton;
    Ora_AbilityS: TOraQuery;
    ED_task_name: TOnEdit;
    ED_ability_cd: TOnWinPopupEdit;
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    ED_ability_snoB: TOnEdit;
    Shape14: TShape;
    Label1: TLabel;
    ED_ability_name: TOnEdit;
    Ora_AbilityB: TOraQuery;
    DS_AbilityB: TDataSource;
    RB_M: TRadioButton;
    RB_S: TRadioButton;
    RB_J: TRadioButton;
    OnShapeLabel10: TOnShapeLabel;
    Shape9: TShape;
    Label2: TLabel;
    OnShapeLabel12: TOnShapeLabel;
    ED_recom_sno: TOnEdit;
    Ora_Recom: TOraQuery;
    DS_Recom: TDataSource;
    ED_recom_dutyid: TOnEdit;
    CK_col: TCheckBox;
    CK_uni: TCheckBox;
    CK_mas: TCheckBox;
    CK_doc: TCheckBox;
    RB_hig_yn: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure SB_1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure SB_closeClick(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure DS_AbilitySDataChange(Sender: TObject; Field: TField);
    procedure BT_cancelClick(Sender: TObject);
    procedure ED_task_snoInitPopup(Sender: TObject);
    procedure ED_task_snoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_delClick(Sender: TObject);
    procedure DS_AbilityBDataChange(Sender: TObject; Field: TField);
    procedure DS_RecomDataChange(Sender: TObject; Field: TField);
    procedure ED_recom_dutyInitPopup(Sender: TObject);
    procedure ED_recom_dutyCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_ability_cdCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_ability_cdInitPopup(Sender: TObject);
    procedure CK_colClick(Sender: TObject);
    procedure CK_uniClick(Sender: TObject);
    procedure CK_masClick(Sender: TObject);
    procedure CK_docClick(Sender: TObject);
    procedure ED_recom_snoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_ability_snoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_ability_snoBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Old_AbilitySno, Old_AbilitySnoB, Old_RecomSno : Integer;
    JobMode : String;
    procedure Set_InputField(arg1, arg2 : Boolean );

  public
    { Public declarations }
    procedure Retrieve;
    function  DataChk : Boolean ;
  end;

var
  Sub_Career: TSub_Career;

implementation

uses PZK10101, PZK10106, PZK10107;

{$R *.DFM}

procedure TSub_Career.SB_1Click(Sender: TObject);
var
  CareerTime : String;
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P_' + IntToStr(TOnSkinButton(Sender).Tag);

  BT_add.Enabled         := True;
  BT_mod.Enabled         := True;
  BT_save.Enabled        := True;
  BT_cancel.Enabled      := True;
  BT_del.Enabled         := True;

  if TOnSkinButton(Sender).Tag = 1 then
    begin
      BT_add.Enabled         := False;
      BT_mod.Enabled         := False;
      BT_cancel.Enabled      := False;
      BT_del.Enabled         := False;

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
          Sql.Add('where duty_id      = :duty_id         ');
          Sql.Add('  and worker_level = :worker_level  ');
          ParamByName('duty_id').AsString      := MainForm.GSdutyId;
          ParamByName('worker_level').AsString := L_worker_level.ValueCaption;
          Open;

          if Ora_Qry1.eof then
            begin
              Exit;
            end;

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


          if (RB_col_nref_yn.Checked or RB_col_ref_yn.Checked)  then
            CK_col.Checked := True;
          if (RB_uni_nref_yn.Checked or RB_uni_ref_yn.Checked)  then
            CK_uni.Checked := True;
          if (RB_mas_nref_yn.Checked or RB_mas_ref_yn.Checked)  then
            CK_mas.Checked := True;
          if (RB_doc_nref_yn.Checked or RB_doc_ref_yn.Checked)  then
            CK_doc.Checked := True;

          if CK_col.Checked then
            P_col.Enabled := True;
          if CK_uni.Checked then
            P_uni.Enabled := True;
          if CK_mas.Checked then
            P_mas.Enabled := True;
          if CK_doc.Checked then
            P_doc.Enabled := True;

        end;
    end
  else
    Retrieve;

end;

procedure TSub_Career.FormShow(Sender: TObject);
begin
  SB_1Click(SB_1);
end;

procedure TSub_Career.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TSub_Career.SB_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TSub_Career.Retrieve;
begin
  if Notebook1.ActivePage = 'P_2' then
    begin
      with Ora_AbilityS do
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
          ParamByName('duty_id').AsString      := MainForm.GSdutyId;
          ParamByName('worker_level').AsString := L_worker_level.ValueCaption;
          Open;
        end;
    end
  else if Notebook1.ActivePage = 'P_3' then
    begin
      with Ora_AbilityB do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select a.*, b.ability_name           ');
          Sql.Add('  from a1ability a, a1dic_abil b     ');
          Sql.Add('where a.item_name    = b.ability_cd  ');
          Sql.Add('  and a.duty_id      = :duty_id      ');
          Sql.Add('  and a.worker_level = :worker_level ');
          Sql.Add('  and a.ability_kind = ''B'' ');
          Sql.Add('order by a.ability_sno       ');
          ParamByName('duty_id').AsString      := MainForm.GSdutyId;
          ParamByName('worker_level').AsString := L_worker_level.ValueCaption;
          Open;
          FieldByName('req_kind').Alignment := taCenter;
        end;
    end
  else if Notebook1.ActivePage = 'P_4' then
    begin
      with Ora_Recom do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select a.*, b.duty_name              ');
          Sql.Add('  from a1recommend a, a1duty b       ');
          Sql.Add('where a.recom_duty_id= b.duty_id     ');
          Sql.Add('  and a.duty_id      = :duty_id      ');
          Sql.Add('  and a.worker_level = :worker_level ');
          Sql.Add('order by a.recom_sno       ');
          ParamByName('duty_id').AsString      := MainForm.GSdutyId;
          ParamByName('worker_level').AsString := L_worker_level.ValueCaption;
          Open;
          FieldByName('manager_yn').Alignment := taCenter;
          FieldByName('senior_yn').Alignment := taCenter;
          FieldByName('jonior_yn').Alignment := taCenter;
        end;
    end;

end;

procedure TSub_Career.Set_InputField(arg1, arg2 : Boolean );
begin
  if Notebook1.ActivePage = 'P_2' then
    begin
      Grid_AbilityS.Enabled    := not arg1;
      ED_ability_sno.Enabled   := arg1;
      ED_task_sno.Enabled      := arg1;
      ED_item_name.Enabled     := arg1;
      CB_import_kind.Enabled   := arg1;
      CB_req_kind.Enabled      := arg1;
      ED_license_item.Enabled  := arg1;

      if arg2 then
        begin
          ED_ability_sno.Text      :='';
          ED_task_sno.Text         :='';
          ED_item_name.Text        :='';
          CB_import_kind.ItemIndex :=-1;
          CB_req_kind.ItemIndex    :=-1;
          ED_license_item.Text     :='';
        end;
    end
  else if Notebook1.ActivePage = 'P_3' then
    begin
      Grid_AbilityB.Enabled    := not arg1;
      ED_ability_snoB.Enabled   := arg1;
      ED_ability_cd.Enabled     := arg1;
      CB_req_kindB.Enabled      := arg1;

      if arg2 then
        begin
          ED_ability_snoB.Text      :='';
          ED_ability_cd.Text        :='';
          ED_ability_name.Text      := '';
          CB_req_kindB.ItemIndex    :=-1;
        end;
    end
  else if Notebook1.ActivePage = 'P_4' then
    begin
      Grid_Recom.Enabled    := not arg1;
      ED_recom_sno.Enabled      := arg1;
      ED_recom_duty.Enabled     := arg1;
      P_recom.Enabled           := arg1;

      if arg2 then
        begin
          ED_recom_sno.Text      := '';
          ED_recom_duty.Text     := '';
          ED_recom_dutyid.Text   := '';
          RB_M.Checked           := False;
          RB_S.Checked           := False;
          RB_J.Checked           := False;
        end;
    end;

end;

procedure TSub_Career.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True, True);

  if Notebook1.ActivePage = 'P_2' then
    Ed_ability_sno.SetFocus
  else if Notebook1.ActivePage = 'P_3' then
    ED_ability_snoB.SetFocus
  else if Notebook1.ActivePage = 'P_4' then
    ED_recom_sno.SetFocus;
end;

procedure TSub_Career.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );  
end;

procedure TSub_Career.BT_saveClick(Sender: TObject);
var
  cnt : Integer;
begin
  if Notebook1.ActivePage = 'P_1' then
    begin
      Ora_Qry1.Close;
      Ora_Qry1.Sql.Clear;
      Ora_Qry1.Sql.Add('select count(*) cnt from a1career    ');
      Ora_Qry1.Sql.Add(' where duty_id      = :duty_id       ');
      Ora_Qry1.Sql.Add('   and worker_level = :worker_level  ');
      Ora_Qry1.ParamByName('duty_id').AsString      := MainForm.GSdutyId;
      Ora_Qry1.ParamByName('worker_level').AsString := L_worker_level.ValueCaption;
      Ora_Qry1.Open;
      cnt := Ora_Qry1.FieldByName('cnt').AsInteger;

      if cnt = 0 then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('insert into a1career               ');
          Ora_Save.Sql.Add(' (duty_id, worker_level, hig_yn, col_nref_yn, col_ref_yn, uni_nref_yn, uni_ref_yn,   ');
          Ora_Save.Sql.Add('  mas_nref_yn, mas_ref_yn, doc_nref_yn, doc_ref_yn, career_time)                     ');
          Ora_Save.Sql.Add('values                              ');
          Ora_Save.Sql.Add(' (:duty_id, :worker_level, :hig_yn, :col_nref_yn, :col_ref_yn, :uni_nref_yn, :uni_ref_yn,   ');
          Ora_Save.Sql.Add('  :mas_nref_yn, :mas_ref_yn, :doc_nref_yn, :doc_ref_yn, :career_time)                     ');
        end
      else
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('update a1career                     ');
          Ora_Save.Sql.Add('   set hig_yn      = :hig_yn,       ');
          Ora_Save.Sql.Add('       col_nref_yn = :col_nref_yn,  ');
          Ora_Save.Sql.Add('       col_ref_yn  = :col_ref_yn,   ');
          Ora_Save.Sql.Add('       uni_nref_yn = :uni_nref_yn,  ');
          Ora_Save.Sql.Add('       uni_ref_yn  = :uni_ref_yn,   ');
          Ora_Save.Sql.Add('       mas_nref_yn = :mas_nref_yn,  ');
          Ora_Save.Sql.Add('       mas_ref_yn  = :mas_ref_yn,   ');
          Ora_Save.Sql.Add('       doc_nref_yn = :doc_nref_yn,  ');
          Ora_Save.Sql.Add('       doc_ref_yn  = :doc_ref_yn,   ');
          Ora_Save.Sql.Add('       career_time = :career_time   ');
          Ora_Save.Sql.Add('where  duty_id     = :duty_id       ');
          Ora_Save.Sql.Add('  and  worker_level = :worker_level ');
        end;

      Ora_Save.ParamByName('duty_id').AsString           := MainForm.GSdutyId ;
      Ora_Save.ParamByName('worker_level').AsString      := L_worker_level.ValueCaption;

      if RB_hig_yn.Checked then
        Ora_Save.ParamByName('hig_yn').AsString          := 'Y'
      else
        Ora_Save.ParamByName('hig_yn').AsString          := 'N';

      if RB_col_nref_yn.Checked then
        Ora_Save.ParamByName('col_nref_yn').AsString     := 'Y'
      else
        Ora_Save.ParamByName('col_nref_yn').AsString     := 'N';

      if RB_col_ref_yn.Checked then
        Ora_Save.ParamByName('col_ref_yn').AsString      := 'Y'
      else
        Ora_Save.ParamByName('col_ref_yn').AsString      := 'N';

      if RB_uni_nref_yn.Checked then
        Ora_Save.ParamByName('uni_nref_yn').AsString     := 'Y'
      else
        Ora_Save.ParamByName('uni_nref_yn').AsString     := 'N';

      if RB_uni_ref_yn.Checked then
        Ora_Save.ParamByName('uni_ref_yn').AsString      := 'Y'
      else
        Ora_Save.ParamByName('uni_ref_yn').AsString      := 'N';

      if RB_mas_nref_yn.Checked then
        Ora_Save.ParamByName('mas_nref_yn').AsString     := 'Y'
      else
        Ora_Save.ParamByName('mas_nref_yn').AsString     := 'N';

      if RB_mas_ref_yn.Checked then
        Ora_Save.ParamByName('mas_ref_yn').AsString      := 'Y'
      else
        Ora_Save.ParamByName('mas_ref_yn').AsString      := 'N';

      if RB_doc_nref_yn.Checked then
        Ora_Save.ParamByName('doc_nref_yn').AsString     := 'Y'
      else
        Ora_Save.ParamByName('doc_nref_yn').AsString     := 'N';

      if RB_doc_ref_yn.Checked then
        Ora_Save.ParamByName('doc_ref_yn').AsString      := 'Y'
      else
        Ora_Save.ParamByName('doc_ref_yn').AsString      := 'N';

      if RB_M3.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'M3'
      else if RB_M6.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'M6'
      else if RB_Y1.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'Y1'
      else if RB_Y3.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'Y3'
      else if RB_Y5.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'Y5'
      else if RB_Y7.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'Y7'
      else if RB_YA.Checked then
        Ora_Save.ParamByName('career_time').AsString     := 'YA'
      else
        Ora_Save.ParamByName('career_time').AsString     := '';

      Ora_Save.ExecSql;

      MessageDlg('교육/경력 내용이 저장되었습니다',mtInformation, [mbOk ],0) ;

    end
  else if Notebook1.ActivePage = 'P_2' then
    begin
      if not DataChk then EXIT ;

      if JobMode = 'I' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('insert into a1ability            ');
          Ora_Save.Sql.Add(' (duty_id, worker_level, ability_kind, ability_sno, task_sno, item_name, req_kind, import_kind, license_item  )     ');
          Ora_Save.Sql.Add('values                              ');
          Ora_Save.Sql.Add(' (:duty_id, :worker_level, :ability_kind, :ability_sno, :task_sno, :item_name, :req_kind, :import_kind, :license_item  ) ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('ability_kind').AsString     := 'A' ;
          Ora_Save.ParamByName('ability_sno').AsString      := ED_ability_sno.Text ;
          Ora_Save.ParamByName('task_sno').AsString         := ED_task_sno.Text ;
          Ora_Save.ParamByName('item_name').AsString        := ED_item_name.Text ;
          Ora_Save.ParamByName('req_kind').AsString         := CB_req_kind.Text ;
          Ora_Save.ParamByName('import_kind').AsString      := Copy(CB_import_kind.Text,1,1) ;
          Ora_Save.ParamByName('license_item').AsString     := ED_license_item.Text ;
          Ora_Save.ExecSql;
        end
      else if JobMode = 'U' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('update a1ability                       ');
          Ora_Save.Sql.Add('   set ability_sno = :ability_sno,     ');
          Ora_Save.Sql.Add('       task_sno    = :task_sno,        ');
          Ora_Save.Sql.Add('       item_name   = :item_name,       ');
          Ora_Save.Sql.Add('       req_kind    = :req_kind,        ');
          Ora_Save.Sql.Add('       import_kind = :import_kind,     ');
          Ora_Save.Sql.Add('       license_item= :license_item     ');
          Ora_Save.Sql.Add(' WHERE duty_id     = :duty_id          ');
          Ora_Save.Sql.Add('   AND worker_level= :worker_level     ');
          Ora_Save.Sql.Add('   AND ability_kind= :ability_kind     ');
          Ora_Save.Sql.Add('   AND ability_sno = :oldability_sno   ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('ability_kind').AsString     := 'A' ;
          Ora_Save.ParamByName('ability_sno').AsString      := ED_ability_sno.Text ;
          Ora_Save.ParamByName('oldability_sno').AsInteger  := Old_AbilitySno ;
          Ora_Save.ParamByName('task_sno').AsString         := ED_task_sno.Text ;
          Ora_Save.ParamByName('item_name').AsString        := ED_item_name.Text ;
          Ora_Save.ParamByName('req_kind').AsString         := CB_req_kind.Text ;
          Ora_Save.ParamByName('import_kind').AsString      := Copy(CB_import_kind.Text,1,1) ;
          Ora_Save.ParamByName('license_item').AsString     := ED_license_item.Text ;
          Ora_Save.ExecSql;
        end
      else
        System.Exit;

      MessageDlg('지식/기술 내용이 저장되었습니다',mtInformation, [mbOk ],0) ;

    end
  else if Notebook1.ActivePage = 'P_3' then
    begin
      if not DataChk then EXIT ;

      if JobMode = 'I' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('insert into a1ability            ');
          Ora_Save.Sql.Add(' (duty_id, worker_level, ability_kind, ability_sno, task_sno, item_name, req_kind, import_kind, license_item  )     ');
          Ora_Save.Sql.Add('values                              ');
          Ora_Save.Sql.Add(' (:duty_id, :worker_level, :ability_kind, :ability_sno, :task_sno, :item_name, :req_kind, :import_kind, :license_item  ) ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('ability_kind').AsString     := 'B' ;
          Ora_Save.ParamByName('ability_sno').AsString      := ED_ability_snoB.Text ;
          Ora_Save.ParamByName('task_sno').AsString         := '0' ;
          Ora_Save.ParamByName('item_name').AsString        := ED_ability_cd.Text ;
          Ora_Save.ParamByName('req_kind').AsString         := CB_req_kindB.Text ;
          Ora_Save.ParamByName('import_kind').AsString      := '';
          Ora_Save.ParamByName('license_item').AsString     := '';
          Ora_Save.ExecSql;
        end
      else if JobMode = 'U' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('update a1ability                       ');
          Ora_Save.Sql.Add('   set ability_sno = :ability_sno,     ');
          Ora_Save.Sql.Add('       task_sno    = :task_sno,        ');
          Ora_Save.Sql.Add('       item_name   = :item_name,       ');
          Ora_Save.Sql.Add('       req_kind    = :req_kind,        ');
          Ora_Save.Sql.Add('       import_kind = :import_kind,     ');
          Ora_Save.Sql.Add('       license_item= :license_item     ');
          Ora_Save.Sql.Add(' WHERE duty_id     = :duty_id          ');
          Ora_Save.Sql.Add('   AND worker_level= :worker_level     ');
          Ora_Save.Sql.Add('   AND ability_kind= :ability_kind     ');
          Ora_Save.Sql.Add('   AND ability_sno = :oldability_sno   ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('ability_kind').AsString     := 'B' ;
          Ora_Save.ParamByName('ability_sno').AsString      := ED_ability_snoB.Text ;
          Ora_Save.ParamByName('oldability_sno').AsInteger  := Old_AbilitySnoB ;
          Ora_Save.ParamByName('task_sno').AsString         := '0' ;
          Ora_Save.ParamByName('item_name').AsString        := ED_ability_cd.Text ;
          Ora_Save.ParamByName('req_kind').AsString         := CB_req_kindB.Text ;
          Ora_Save.ParamByName('import_kind').AsString      := '';
          Ora_Save.ParamByName('license_item').AsString     := '';
          Ora_Save.ExecSql;
        end
      else
        System.Exit;

      MessageDlg('역량 항목이 저장되었습니다',mtInformation, [mbOk ],0) ;

    end
  else if Notebook1.ActivePage = 'P_4' then
    begin
      if not DataChk then EXIT ;

      if JobMode = 'I' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('insert into a1recommend           ');
          Ora_Save.Sql.Add(' (duty_id, worker_level, recom_sno, recom_duty_id, manager_yn, senior_yn, jonior_yn)     ');
          Ora_Save.Sql.Add('values                              ');
          Ora_Save.Sql.Add(' (:duty_id, :worker_level, :recom_sno, :recom_duty_id, :manager_yn, :senior_yn, :jonior_yn)     ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('recom_sno').AsString        := ED_recom_sno.Text;
          Ora_Save.ParamByName('recom_duty_id').AsString    := ED_recom_dutyid.Text;

          if RB_M.Checked then
            Ora_Save.ParamByName('manager_yn').AsString     := 'Y'
          else
            Ora_Save.ParamByName('manager_yn').AsString     := 'N';

          if RB_S.Checked then
            Ora_Save.ParamByName('senior_yn').AsString      := 'Y'
          else
            Ora_Save.ParamByName('senior_yn').AsString      := 'N';

          if RB_J.Checked then
            Ora_Save.ParamByName('jonior_yn').AsString      := 'Y'
          else
            Ora_Save.ParamByName('jonior_yn').AsString      := 'N';

          Ora_Save.ExecSql;
        end
      else if JobMode = 'U' then
        begin
          Ora_Save.Close;
          Ora_Save.Sql.Clear;
          Ora_Save.Sql.Add('update a1recommend                      ');
          Ora_Save.Sql.Add('   set recom_sno      = :recom_sno,  ');
          Ora_Save.Sql.Add('       recom_duty_id  = :recom_duty_id,     ');
          Ora_Save.Sql.Add('       manager_yn  = :manager_yn,       ');
          Ora_Save.Sql.Add('       senior_yn   = :senior_yn,        ');
          Ora_Save.Sql.Add('       jonior_yn   = :jonior_yn        ');
          Ora_Save.Sql.Add(' WHERE duty_id     = :duty_id          ');
          Ora_Save.Sql.Add('   AND worker_level= :worker_level     ');
          Ora_Save.Sql.Add('   AND recom_sno   = :oldrecom_sno     ');
          Ora_Save.ParamByName('duty_id').AsString          := MainForm.GSdutyId ;
          Ora_Save.ParamByName('worker_level').AsString     := L_worker_level.ValueCaption ;
          Ora_Save.ParamByName('recom_sno').AsString        := ED_recom_sno.Text;
          Ora_Save.ParamByName('oldrecom_sno').AsInteger    := Old_RecomSno ;
          Ora_Save.ParamByName('recom_duty_id').AsString    := ED_recom_dutyid.Text;

          if RB_M.Checked then
            Ora_Save.ParamByName('manager_yn').AsString       := 'Y'
          else
            Ora_Save.ParamByName('manager_yn').AsString       := 'N';

          if RB_S.Checked then
            Ora_Save.ParamByName('senior_yn').AsString       := 'Y'
          else
            Ora_Save.ParamByName('senior_yn').AsString       := 'N';

          if RB_J.Checked then
            Ora_Save.ParamByName('jonior_yn').AsString       := 'Y'
          else
            Ora_Save.ParamByName('jonior_yn').AsString       := 'N';
          Ora_Save.ExecSql;
        end
      else
        System.Exit;

      MessageDlg('추천직무 항목이 저장되었습니다',mtInformation, [mbOk ],0) ;

    end;

  Retrieve;
  JobMode               := 'F';
  Set_InputField(False, False );

end;

procedure TSub_Career.DS_AbilitySDataChange(Sender: TObject;
  Field: TField);
begin
  ED_ability_sno.Text        := Ora_AbilityS.FieldByName('ability_sno').AsString;
  ED_task_sno.Text           := Ora_AbilityS.FieldByName('task_sno').AsString;
  ED_task_name.Text          := Ora_AbilityS.FieldByName('task_name').AsString;  
  ED_item_name.Text          := Ora_AbilityS.FieldByName('item_name').AsString;
  CB_import_kind.Text        := Ora_AbilityS.FieldByName('import_kind').AsString ;
  CB_req_kind.Text           := Ora_AbilityS.FieldByName('req_kind').AsString;
  ED_license_item.Text       := Ora_AbilityS.FieldByName('license_item').AsString;
  Old_AbilitySno             := Ora_AbilityS.FieldByName('ability_sno').AsInteger;

end;

function TSub_Career.DataChk : Boolean ;
begin
  Result := True;

  with Ora_Qry1 do
    begin
      if Notebook1.ActivePage = 'P_2' then
        begin
          if Trim(ED_ability_sno.Text) ='' then
            begin
              MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(ED_task_sno.Text) ='' then
            begin
              MessageDlg('세부과업을 선택해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(ED_item_name.Text) ='' then
            begin
              MessageDlg('지식및 기술항목을 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(CB_import_kind.Text) ='' then
            begin
              MessageDlg('중요도를 선택해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(CB_req_kind.Text) ='' then
            begin
              MessageDlg('요구수준을 선택해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if (ED_ability_sno.Text <> IntToStr(Old_AbilitySno)) or (JobMode = 'I') then
            begin
              Close;
              Sql.Clear ;
              Sql.Add('select * from a1ability                ');
              Sql.Add(' where duty_id       = :duty_id        ');
              Sql.Add('   and worker_level  = :worker_level   ');
              Sql.Add('   and ability_kind  = ''A''           ');
              Sql.Add('   and ability_sno   = :ability_sno     ');
              ParamByName('duty_id').AsString       := MainForm.GSdutyId ;
              ParamByName('worker_level').AsString  := L_worker_level.ValueCaption ;
              ParamByName('ability_sno').AsString   := ED_ability_sno.Text ;
              Open;

              if Recordcount >= 1 then
                begin
                  MessageDlg('No: '+ ED_ability_sno.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
                  Result := False;
                  exit;
                end;
            end;
        end
      else if Notebook1.ActivePage = 'P_3' then
        begin

          if Trim(ED_ability_snoB.Text) ='' then
            begin
              MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(ED_ability_cd.Text) ='' then
            begin
              MessageDlg('역량항목을 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(CB_req_kindB.Text) ='' then
            begin
              MessageDlg('요구수준을 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if (ED_ability_snoB.Text <> IntToStr(Old_AbilitySnoB)) or (JobMode = 'I') then
            begin
              Close;
              Sql.Clear ;
              Sql.Add('select * from a1ability                ');
              Sql.Add(' where duty_id       = :duty_id        ');
              Sql.Add('   and worker_level  = :worker_level   ');
              Sql.Add('   and ability_kind  = ''B''           ');
              Sql.Add('   and ability_sno   = :ability_sno     ');
              ParamByName('duty_id').AsString       := MainForm.GSdutyId ;
              ParamByName('worker_level').AsString  := L_worker_level.ValueCaption ;
              ParamByName('ability_sno').AsString   := ED_ability_snoB.Text ;
              Open;

              if Recordcount >= 1 then
                begin
                  MessageDlg('No: '+ ED_ability_snoB.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
                  Result := False;
                  exit;
                end;
            end;
        end
      else if Notebook1.ActivePage = 'P_4' then
        begin

          if Trim(ED_recom_sno.Text) ='' then
            begin
              MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if Trim(ED_recom_duty.Text) ='' then
            begin
              MessageDlg('추천 직무명을 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if not (RB_M.Checked or RB_S.Checked or RB_J.Checked) then
            begin
              MessageDlg('추천 역할수준을 입력해 주세요', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;

          if (ED_recom_sno.Text <> IntToStr(Old_RecomSno)) or (JobMode = 'I') then
            begin
              Close;
              Sql.Clear ;
              Sql.Add('select * from a1recommend              ');
              Sql.Add(' where duty_id       = :duty_id        ');
              Sql.Add('   and worker_level  = :worker_level   ');
              Sql.Add('   and recom_sno     = :recom_sno      ');
              ParamByName('duty_id').AsString       := MainForm.GSdutyId ;
              ParamByName('worker_level').AsString  := L_worker_level.ValueCaption ;
              ParamByName('recom_sno').AsString     := ED_recom_sno.Text ;
              Open;

              if Recordcount >= 1 then
                begin
                  MessageDlg('No: '+ ED_recom_sno.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
                  Result := False;
                  exit;
                end;
            end;
        end;
    end;  
end;

procedure TSub_Career.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);
end;

procedure TSub_Career.ED_task_snoInitPopup(Sender: TObject);
begin
  CForm.Edit          := TOnWinPopupEdit(Sender);
  CForm.DutyId        := MainForm.GSDutyId;
  CForm.FromWhere      := 'ABIL';
  TOnWinPopupEdit(Sender).PopupControl := CForm ;

end;

procedure TSub_Career.ED_task_snoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CForm.Code <> '' then
    begin
      ED_task_sno.Text    := CForm.Code;
      ED_task_name.Text   := CForm.CodeName;
    end;
end;

procedure TSub_Career.BT_delClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'P_2' then
    begin

      if ED_ability_sno.Text ='' then
        begin
          MessageDlg('삭제할 지식및 기술을 선택해 주세요', mtError, [mbOk],0);
          Exit;
        end;

      if MessageDlg('지식및 기술 '+ ED_ability_sno.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
        System.Exit;

      with Ora_Save do
        begin
          Close;
          Sql.Clear;
          Sql.Add('delete a1ability                      ');
          Sql.Add(' where duty_id      = :duty_id        ');
          Sql.Add('   and worker_level = :worker_level   ');
          Sql.Add('   and ability_kind = :ability_kind   ');
          Sql.Add('   and ability_sno  = :ability_sno    ');
          ParamByName('duty_id').AsString      := Ora_AbilityS.FieldByName('duty_id').AsString;
          ParamByName('worker_level').AsString := Ora_AbilityS.FieldByName('worker_level').AsString;
          ParamByName('ability_kind').AsString := Ora_AbilityS.FieldByName('ability_kind').AsString;
          ParamByName('ability_sno').AsString  := Ora_AbilityS.FieldByName('ability_sno').AsString;
          ExecSql;
          MessageDlg('지식및 기술이 삭제되었습니다.',mtInformation, [mbOk],0);
        end;
    end
  else if Notebook1.ActivePage = 'P_3' then
    begin
      if ED_ability_snoB.Text ='' then
        begin
          MessageDlg('삭제할 필요 역량을 선택해 주세요', mtError, [mbOk],0);
          Exit;
        end;

      if MessageDlg('필요 역량 '+ ED_ability_snoB.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
        System.Exit;

      with Ora_Save do
        begin
          Close;
          Sql.Clear;
          Sql.Add('delete a1ability                      ');
          Sql.Add(' where duty_id      = :duty_id        ');
          Sql.Add('   and worker_level = :worker_level   ');
          Sql.Add('   and ability_kind = :ability_kind   ');
          Sql.Add('   and ability_sno  = :ability_sno    ');
          ParamByName('duty_id').AsString      := Ora_AbilityB.FieldByName('duty_id').AsString;
          ParamByName('worker_level').AsString := Ora_AbilityB.FieldByName('worker_level').AsString;
          ParamByName('ability_kind').AsString := Ora_AbilityB.FieldByName('ability_kind').AsString;
          ParamByName('ability_sno').AsString  := Ora_AbilityB.FieldByName('ability_sno').AsString;
          ExecSql;
          MessageDlg('필요 역량이 삭제되었습니다.',mtInformation, [mbOk],0);
        end;
    end
  else if Notebook1.ActivePage = 'P_4' then
    begin
      if ED_recom_sno.Text ='' then
        begin
          MessageDlg('삭제할 추천 직무를 선택해 주세요', mtError, [mbOk],0);
          Exit;
        end;

      if MessageDlg('추천 직무 '+ ED_recom_sno.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
        System.Exit;

      with Ora_Save do
        begin
          Close;
          Sql.Clear;
          Sql.Add('delete a1recommend                    ');
          Sql.Add(' where duty_id      = :duty_id        ');
          Sql.Add('   and worker_level = :worker_level   ');
          Sql.Add('   and recom_sno    = :recom_sno     ');
          ParamByName('duty_id').AsString      := Ora_Recom.FieldByName('duty_id').AsString;
          ParamByName('worker_level').AsString := Ora_Recom.FieldByName('worker_level').AsString;
          ParamByName('recom_sno').AsString    := Ora_Recom.FieldByName('recom_sno').AsString;
          ExecSql;
          MessageDlg('추천 직무가 삭제되었습니다.',mtInformation, [mbOk],0);
        end;
    end;

  Retrieve;

end;

procedure TSub_Career.DS_AbilityBDataChange(Sender: TObject;
  Field: TField);
begin
  ED_ability_snoB.Text       := Ora_AbilityB.FieldByName('ability_sno').AsString;
  ED_ability_cd.Text         := Ora_AbilityB.FieldByName('item_name').AsString;
  ED_ability_name.Text       := Ora_AbilityB.FieldByName('ability_name').AsString;
  CB_req_kindB.Text          := Ora_AbilityB.FieldByName('req_kind').AsString;
  Old_AbilitySnoB            := Ora_AbilityB.FieldByName('ability_sno').AsInteger;

end;

procedure TSub_Career.DS_RecomDataChange(Sender: TObject; Field: TField);
begin
  ED_recom_sno.Text          := Ora_Recom.FieldByName('recom_sno').AsString;
  ED_recom_duty.Text         := Ora_Recom.FieldByName('duty_name').AsString;
  ED_recom_dutyid.Text       := Ora_Recom.FieldByName('recom_duty_id').AsString;
  Old_RecomSno               := Ora_Recom.FieldByName('recom_sno').AsInteger;

  RB_M.Checked := False;
  RB_S.Checked := False;
  RB_J.Checked := False;

  if Ora_Recom.FieldByName('manager_yn').AsString = 'Y' then
    RB_M.Checked := True ;

  if Ora_Recom.FieldByName('senior_yn').AsString = 'Y' then
    RB_S.Checked := True ;

  if Ora_Recom.FieldByName('jonior_yn').AsString = 'Y' then
    RB_J.Checked := True ;
end;

procedure TSub_Career.ED_recom_dutyInitPopup(Sender: TObject);
begin
  CForm.Edit          := TOnWinPopupEdit(Sender);
  CForm.DutyId        := MainForm.GSDutyId;
  CForm.FromWhere      := 'RECOM';
  TOnWinPopupEdit(Sender).PopupControl := CForm ;

end;

procedure TSub_Career.ED_recom_dutyCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  if CForm.Code <> '' then
    begin
      ED_recom_dutyid.Text    := CForm.Code;
      ED_recom_duty.Text      := CForm.CodeName;
    end;

end;

procedure TSub_Career.ED_ability_cdCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  if DicForm.AbilityCd  <> '' then
    begin
      ED_ability_cd.Text    :=  DicForm.AbilityCd;
      ED_ability_name.Text   := DicForm.AbilityName;
    end;

end;

procedure TSub_Career.ED_ability_cdInitPopup(Sender: TObject);
begin
  DicForm.Edit          := TOnWinPopupEdit(Sender);
  DicForm.E_cond.Text   := '';
  DicForm.E_condButtonClick(Sender, 0);
  TOnWinPopupEdit(Sender).PopupControl := DicForm ;

end;

procedure TSub_Career.CK_colClick(Sender: TObject);
begin
  if CK_col.Checked then
    P_col.Enabled := True
  else
    begin
      P_col.Enabled := False;
      RB_col_nref_yn.Checked := False;
      RB_col_ref_yn.Checked := False;
    end;

end;

procedure TSub_Career.CK_uniClick(Sender: TObject);
begin
  if CK_uni.Checked then
    P_uni.Enabled := True
  else
    begin
      P_uni.Enabled := False;
      RB_uni_nref_yn.Checked := False;
      RB_uni_ref_yn.Checked := False;
    end;

end;

procedure TSub_Career.CK_masClick(Sender: TObject);
begin
  if CK_mas.Checked then
    P_mas.Enabled := True
  else
    begin
      P_mas.Enabled := False;
      RB_mas_nref_yn.Checked := False;
      RB_mas_ref_yn.Checked := False;
    end;

end;

procedure TSub_Career.CK_docClick(Sender: TObject);
begin
  if CK_doc.Checked then
    P_doc.Enabled := True
  else
    begin
      P_doc.Enabled := False;
      RB_doc_nref_yn.Checked := False;
      RB_doc_ref_yn.Checked := False;
    end;

end;

procedure TSub_Career.ED_recom_snoKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

procedure TSub_Career.ED_ability_snoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

procedure TSub_Career.ED_ability_snoBKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

end.
