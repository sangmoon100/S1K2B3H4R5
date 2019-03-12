unit PZK10105;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid, ComCtrls,
  StdCtrls, OnFocusButton, OnEditBaseCtrl, ExtCtrls, OnShapeLabel, Db,
  MemDS, DBAccess, Ora;

type
  TSub_Task = class(TForm)
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    Shape1: TShape;
    ED_duty_name: TOnEdit;
    ED_task_name: TOnEdit;
    BT_close: TOnFocusButton;
    StatusBar1: TStatusBar;
    Grid_TaskS: TOnGrDbGrid;
    BT_add: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_save: TOnFocusButton;
    DataSource1: TDataSource;
    Ora_TaskS: TOraQuery;
    BT_cancel: TOnFocusButton;
    Label10: TLabel;
    Ora_Save: TOraQuery;
    OraQuery1: TOraQuery;
    ED_task_sno: TOnEdit;
    BT_mod: TOnFocusButton;
    procedure BT_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_addClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure ED_task_snoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Old_TaskSno : Integer;
    JobMode : String;
    procedure Set_InputField(arg1, arg2 : Boolean );
  public
    { Public declarations }
    function  DataChk : Boolean ;
    procedure Retrieve;

  end;

var
  Sub_Task: TSub_Task;

implementation

uses PZK10101;

{$R *.DFM}

procedure TSub_Task.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TSub_Task.Retrieve;
begin
  with Ora_TaskS do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1task     ');
      Sql.Add('where duty_id = :duty_id ');
      Sql.Add('order by task_sno        ');
      ParamByName('duty_id').AsString := MainForm.GSdutyId;
      Open;
    end;
end;

procedure TSub_Task.FormShow(Sender: TObject);
begin
  Retrieve;
end;

procedure TSub_Task.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ED_task_sno.Text  := Ora_TaskS.FieldByName('task_sno').AsString;
  ED_task_name.Text := Ora_TaskS.FieldByName('task_name').AsString;
  Old_TaskSno       := Ora_TaskS.FieldByName('task_sno').AsInteger;

end;

procedure TSub_Task.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True, True);

  Ed_task_sno.SetFocus;
end;

procedure TSub_Task.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);

end;

procedure TSub_Task.Set_InputField(arg1, arg2 : Boolean );
begin
  Grid_TaskS.Enabled    := not arg1;
  Ed_task_sno.Enabled   := arg1;
  ED_task_name.Enabled  := arg1;

  if arg2 then
    begin
      ED_task_sno.Text      := '' ;
      ED_task_name.Text     := '' ;
    end;
end;


procedure TSub_Task.BT_delClick(Sender: TObject);
begin
  if ED_task_sno.Text ='' then
    begin
      MessageDlg('삭제할 세부과업을 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('세부과업 '+ ED_task_sno.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1task                 ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      ParamByName('duty_id').AsString  := Ora_TaskS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_TaskS.FieldByName('task_sno').AsString;
      ExecSql;
    end;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1work                 ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      ParamByName('duty_id').AsString  := Ora_TaskS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_TaskS.FieldByName('task_sno').AsString;
      ExecSql;
    end;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1motive               ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      ParamByName('duty_id').AsString  := Ora_TaskS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_TaskS.FieldByName('task_sno').AsString;
      ExecSql;
    end;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1ability              ');
      Sql.Add(' where duty_id  = :duty_id    ');
      Sql.Add('   and task_sno = :task_sno   ');
      ParamByName('duty_id').AsString  := Ora_TaskS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString := Ora_TaskS.FieldByName('task_sno').AsString;
      ExecSql;
    end;

  MessageDlg('세부과업이 삭제되었습니다.',mtInformation, [mbOk],0);
  Retrieve;
end;

function TSub_Task.DataChk : Boolean ;
begin

  Result := True;

  if Trim(ED_task_sno.Text) = '' then
    begin
      MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_task_name.Text) = '' then
    begin
      MessageDlg('세부 과업을 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  with OraQuery1 do
    begin
      if (ED_task_sno.Text <> IntToStr(Old_TaskSno)) or (JobMode = 'I') then
        begin
          Close;
          Sql.Clear ;
          Sql.Add('select * from a1task          ');
          Sql.Add(' where duty_id  = :duty_id    ');
          Sql.Add('   and task_sno = :task_sno   ');
          ParamByName('duty_id').AsString   := MainForm.GSdutyId ;
          ParamByName('task_sno').AsString  := ED_task_sno.Text ;
          Open;

          if Recordcount >= 1 then
            begin
              MessageDlg('No: '+ ED_task_sno.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;
        end;
    end;
end;

procedure TSub_Task.BT_saveClick(Sender: TObject);
begin
//  if MessageDlg('세부과업을 저장하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
//    System.Exit;

  if not DataChk then EXIT ;

  if JobMode = 'I' then
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('INSERT INTO A1TASK                  ');
      Ora_Save.Sql.Add(' (DUTY_ID, TASK_SNO, TASK_NAME)     ');
      Ora_Save.Sql.Add('VALUES                              ');
      Ora_Save.Sql.Add(' (:DUTY_ID, :TASK_SNO, :TASK_NAME)  ');
      Ora_Save.ParamByName('DUTY_ID').AsString   := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString  := ED_task_sno.Text  ;
      Ora_Save.ParamByName('TASK_NAME').AsString := ED_task_name.Text ;
      Ora_Save.ExecSql;
    end
  else if JobMode = 'U' then
    begin
      if IntToStr(Old_TaskSno) <> ED_task_sno.Text then
        begin
          if MessageDlg('주의!! '+#13+
                        '세부과업의 번호를 수정하시면 세부과업에 연결되어 저장된 목록들이 '+#13+
                        '모두 초기화 됩니다!!! 그래도 저장하시겠습니까?',mtConfirmation, [mbYes,mbNo],0 ) <> mrYes then
            Exit;
        end;

      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('UPDATE A1TASK                    ');
      Ora_Save.Sql.Add('   SET TASK_SNO  = :TASK_SNO,     ');
      Ora_Save.Sql.Add('       TASK_NAME = :TASK_NAME    ');
      Ora_Save.Sql.Add(' WHERE DUTY_ID   = :DUTY_ID      ');
      Ora_Save.Sql.Add('   AND TASK_SNO  = :OLDTASK_SNO     ');
      Ora_Save.ParamByName('DUTY_ID').AsString      := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString     := ED_task_sno.Text  ;
      Ora_Save.ParamByName('OLDTASK_SNO').AsInteger := Old_TaskSno       ;
      Ora_Save.ParamByName('TASK_NAME').AsString    := ED_task_name.Text ;
      Ora_Save.ExecSql;

      if IntToStr(Old_TaskSno) <> ED_task_sno.Text then
        begin
          with Ora_Save do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete a1work                 ');
              Sql.Add(' where duty_id  = :duty_id    ');
              Sql.Add('   and task_sno = :task_sno   ');
              ParamByName('duty_id').AsString  := MainForm.GSdutyId ;
              ParamByName('task_sno').AsInteger:= Old_TaskSno;
              ExecSql;
            end;

          with Ora_Save do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete a1motive               ');
              Sql.Add(' where duty_id  = :duty_id    ');
              Sql.Add('   and task_sno = :task_sno   ');
              ParamByName('duty_id').AsString  := MainForm.GSdutyId ;
              ParamByName('task_sno').AsInteger:= Old_TaskSno;
              ExecSql;
            end;

          with Ora_Save do
            begin
              Close;
              Sql.Clear;
              Sql.Add('delete a1ability              ');
              Sql.Add(' where duty_id  = :duty_id    ');
              Sql.Add('   and task_sno = :task_sno   ');
              ParamByName('duty_id').AsString  := MainForm.GSdutyId ;
              ParamByName('task_sno').AsInteger:= Old_TaskSno;
              ExecSql;
            end;
        end;
    end
  else
    System.Exit;

  MessageDlg('세부 과업이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;

  JobMode               := 'F';
  Set_InputField(False, False );
end;

procedure TSub_Task.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );

end;

procedure TSub_Task.ED_task_snoKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;
end;

end.
