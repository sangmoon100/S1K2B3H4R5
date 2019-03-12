unit PZK10103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, Mask,
  pebtnedit, PeJeonLabel, OnEditNumCtl, OnFocusButton, ComCtrls, Grids,
  DBGrids, OnGrDBGrid, Db, MemDS, DBAccess, Ora;

type
  TSub_Work = class(TForm)
    ED_task_name: TOnEdit;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    ED_work_name: TOnEdit;
    ED_output_item: TOnEdit;
    NE_work_rate: TOnNumberEdit;
    ED_value_nnum: TOnEdit;
    ED_value_num: TOnEdit;
    StatusBar1: TStatusBar;
    Grid_WorkS: TOnGrDbGrid;
    Shape1: TShape;
    Label10: TLabel;
    ED_work_sno: TOnEdit;
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_close: TOnFocusButton;
    Ora_WorkS: TOraQuery;
    DataSource1: TDataSource;
    Ora_Save: TOraQuery;
    OraQuery1: TOraQuery;
    ED_task_sno: TOnEdit;
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure ED_work_snoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    JobMode : String;
    procedure Set_InputField(arg1, arg2 : Boolean );
  public
    { Public declarations }
    Old_WorkSno : Integer;
    function  DataChk : Boolean ;
    procedure Retrieve;

  end;

var
  Sub_Work: TSub_Work;

implementation

uses PZK10101;

{$R *.DFM}

procedure TSub_Work.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True, True);

  Ed_work_sno.SetFocus;

end;

procedure TSub_Work.Set_InputField(arg1, arg2 : Boolean );
begin
  Grid_WorkS.Enabled     := not arg1;
  ED_work_sno.Enabled    := arg1;
  ED_work_name.Enabled   := arg1;
  NE_work_rate.Enabled   := arg1;
  ED_output_item.Enabled := arg1;
  ED_value_nnum.Enabled  := arg1;
  ED_value_num.Enabled   := arg1;

  if arg2 then
    begin
      ED_work_sno.Text       := '';
      ED_work_name.Text      := '';
      NE_work_rate.Value     := 0 ;
      ED_output_item.Text    := '';
      ED_value_nnum.Text     := '';
      ED_value_num.Text      := '';
    end;
end;


procedure TSub_Work.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );

end;

procedure TSub_Work.BT_saveClick(Sender: TObject);
begin
//  if MessageDlg('주요활동을 저장하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
//    System.Exit;

  if not DataChk then EXIT ;

  if JobMode = 'I' then
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('INSERT INTO A1WORK                  ');
      Ora_Save.Sql.Add(' (DUTY_ID, TASK_SNO, WORK_SNO, WORK_NAME, WORK_RATE, OUTPUT_ITEM, VALUE_NNUM, VALUE_NUM)     ');
      Ora_Save.Sql.Add('VALUES                              ');
      Ora_Save.Sql.Add(' (:DUTY_ID, :TASK_SNO, :WORK_SNO, :WORK_NAME, :WORK_RATE, :OUTPUT_ITEM, :VALUE_NNUM, :VALUE_NUM)     ');
      Ora_Save.ParamByName('DUTY_ID').AsString    := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString   := ED_Task_sno.Text  ;
      Ora_Save.ParamByName('WORK_SNO').AsString   := ED_work_sno.Text ;
      Ora_Save.ParamByName('WORK_NAME').AsString  := ED_work_name.Text ;
      Ora_Save.ParamByName('WORK_RATE').AsFloat   := NE_work_rate.Value ;
      Ora_Save.ParamByName('OUTPUT_ITEM').AsString:= ED_output_item.Text ;
      Ora_Save.ParamByName('VALUE_NNUM').AsString := ED_value_nnum.Text ;
      Ora_Save.ParamByName('VALUE_NUM').AsString  := ED_value_num.Text ;
      Ora_Save.ExecSql;
    end
  else if JobMode = 'U' then
    begin

      if IntToStr(Old_WorkSno) <> ED_work_sno.Text then
        begin
          if MessageDlg('주의!! '+#13+
                        '주요활동의 번호를 수정하시면 주요활동에 연결되어 저장된 목록들이 '+#13+
                        '모두 초기화 됩니다!!! 그래도 저장하시겠습니까?',mtConfirmation, [mbYes,mbNo],0 ) <> mrYes then
            Exit;
        end;

      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('UPDATE A1WORK                       ');
      Ora_Save.Sql.Add('   SET WORK_SNO    = :WORK_SNO,     ');
      Ora_Save.Sql.Add('       WORK_NAME   = :WORK_NAME,    ');
      Ora_Save.Sql.Add('       WORK_RATE   = :WORK_RATE,    ');
      Ora_Save.Sql.Add('       OUTPUT_ITEM = :OUTPUT_ITEM,  ');
      Ora_Save.Sql.Add('       VALUE_NNUM  = :VALUE_NNUM,   ');
      Ora_Save.Sql.Add('       VALUE_NUM   = :VALUE_NUM     ');
      Ora_Save.Sql.Add(' WHERE DUTY_ID     = :DUTY_ID       ');
      Ora_Save.Sql.Add('   AND TASK_SNO    = :TASK_SNO      ');
      Ora_Save.Sql.Add('   AND WORK_SNO    = :OLDWORK_SNO   ');
      Ora_Save.ParamByName('DUTY_ID').AsString    := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString   := ED_Task_sno.Text  ;
      Ora_Save.ParamByName('WORK_SNO').AsString   := ED_work_sno.Text ;
      Ora_Save.ParamByName('OLDWORK_SNO').AsInteger:= Old_WorkSno ;
      Ora_Save.ParamByName('WORK_NAME').AsString  := ED_work_name.Text ;
      Ora_Save.ParamByName('WORK_RATE').AsFloat   := NE_work_rate.Value ;
      Ora_Save.ParamByName('OUTPUT_ITEM').AsString:= ED_output_item.Text ;
      Ora_Save.ParamByName('VALUE_NNUM').AsString := ED_value_nnum.Text ;
      Ora_Save.ParamByName('VALUE_NUM').AsString  := ED_value_num.Text ;
      Ora_Save.ExecSql;

      if IntToStr(Old_WorkSno) <>  ED_work_sno.Text then
        begin
          with Ora_Save do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete a1motive               ');
              Sql.Add(' where duty_id  = :duty_id    ');
              Sql.Add('   and task_sno = :task_sno   ');
              Sql.Add('   and work_sno = :work_sno   ');
              ParamByName('duty_id').AsString  := MainForm.GSdutyId ;
              ParamByName('task_sno').AsString := ED_Task_sno.Text  ;
              ParamByName('work_sno').AsInteger:= Old_WorkSno ;
              ExecSql;
            end;
        end;
    end
  else
    System.Exit;

  MessageDlg('주요활동 내역이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;

  JobMode               := 'F';
  Set_InputField(False, False );

end;

function TSub_Work.DataChk : Boolean ;
begin

  Result := True;

  if Trim(ED_work_sno.Text) = '' then
    begin
      MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_work_name.Text) = '' then
    begin
      MessageDlg('주요활동을 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if NE_work_rate.Value = 0 then
    begin
      MessageDlg('비율을 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  with OraQuery1 do
    begin
    // 번호 중복체크
    if (ED_work_sno.Text <> IntToStr(Old_WorkSno)) or (JobMode = 'I') then
      begin
        Close;
        Sql.Clear ;
        Sql.Add('select * from a1work          ');
        Sql.Add(' where duty_id  = :duty_id    ');
        Sql.Add('   and task_sno = :task_sno   ');
        Sql.Add('   and work_sno = :work_sno   ');
        ParamByName('duty_id').AsString   := MainForm.GSdutyId ;
        ParamByName('task_sno').AsString  := ED_Task_sno.Text ;
        ParamByName('work_sno').AsString  := ED_work_sno.Text ;
        Open;

        if Recordcount >= 1 then
          begin
            MessageDlg('No: '+ ED_work_sno.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
            Result := False;
            exit;
          end;
      end;
    end;
end;

procedure TSub_Work.Retrieve;
begin
  with Ora_WorkS do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1work     ');
      Sql.Add('where duty_id  = :duty_id ');
      Sql.Add('  and task_sno = :task_sno ');
      Sql.Add('order by work_sno        ');
      ParamByName('duty_id').AsString  := MainForm.GSdutyId;
      ParamByName('task_sno').AsString := ED_Task_sno.Text;
      Open;
    end;
end;    

procedure TSub_Work.FormShow(Sender: TObject);
begin
  Retrieve;
end;

procedure TSub_Work.BT_closeClick(Sender: TObject);
var
  tot_rate : Double;
begin
  with OraQuery1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select sum(work_rate) tot_rate from a1work  ');
      Sql.Add(' where duty_id  = :duty_id         ');
      Sql.Add('   and task_sno = :task_sno        ');
      ParamByName('duty_id').AsString  := MainForm.GSdutyId;
      ParamByName('task_sno').AsString := ED_Task_sno.Text;
      Open;

      tot_rate := FieldByName('tot_rate').AsFloat;

      if (tot_rate <> 0) and (tot_rate <> 100) then
        begin
          if MessageDlg('주요활동 비율계가 100%가 아닙니다..확인하고 다시 입력해주세요.'+#13 +
                        '화면을 닫으시겠습니까?', mtError, [mbYes, mbNo], 0) = mrNo then
            Exit;
        end;
    end;

  Close;
end;

procedure TSub_Work.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ED_work_sno.Text   := Ora_WorkS.FieldByName('work_sno').AsString;
  ED_work_name.Text  := Ora_WorkS.FieldByName('work_name').AsString;
  NE_work_rate.Value := Ora_WorkS.FieldByName('work_rate').AsFloat;
  ED_output_item.Text:= Ora_WorkS.FieldByName('output_item').AsString;
  ED_value_nnum.Text := Ora_WorkS.FieldByName('value_nnum').AsString;
  ED_value_num.Text  := Ora_WorkS.FieldByName('value_num').AsString;
  Old_WorkSno        := Ora_WorkS.FieldByName('work_sno').AsInteger;

end;

procedure TSub_Work.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);

end;

procedure TSub_Work.BT_delClick(Sender: TObject);
begin
  if ED_work_sno.Text ='' then
    begin
      MessageDlg('삭제할 주요활동을 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('주요활동 '+ ED_work_sno.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1work                 ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      Sql.Add('   and work_sno = :work_sno   ');
      ParamByName('duty_id').AsString  := Ora_WorkS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_WorkS.FieldByName('task_sno').AsString;
      ParamByName('work_sno').AsString := Ora_WorkS.FieldByName('work_sno').AsString;
      ExecSql;
    end;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1motive               ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      Sql.Add('   and work_sno = :work_sno   ');
      ParamByName('duty_id').AsString  := Ora_WorkS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_WorkS.FieldByName('task_sno').AsString;
      ParamByName('work_sno').AsString := Ora_WorkS.FieldByName('work_sno').AsString;
      ExecSql;
    end;

  MessageDlg('주요활동이 삭제되었습니다.',mtInformation, [mbOk],0);
  Retrieve;

end;

procedure TSub_Work.ED_work_snoKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

end.
