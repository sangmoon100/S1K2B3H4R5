unit PZK10104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, OnFocusButton, OnEditStdCtrl, OnEditNumCtl, ExtCtrls,
  OnShapeLabel, OnEditBaseCtrl, Grids, DBGrids, OnGrDBGrid, Db, MemDS,
  DBAccess, Ora;

type
  TSub_Motive = class(TForm)
    ED_task_sno: TOnEdit;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    ED_motive_name: TOnEdit;
    ED_exp_nnum: TOnEdit;
    ED_exp_num_value: TOnEdit;
    StatusBar1: TStatusBar;
    ED_work_sno: TOnEdit;
    NE_work_rate: TOnNumberEdit;
    ED_real_unit: TOnEdit;
    Grid_MotiveS: TOnGrDbGrid;
    ED_task_name: TOnEdit;
    ED_work_name: TOnEdit;
    Shape2: TShape;
    Label10: TLabel;
    ED_motive_sno: TOnEdit;
    Ora_MotiveS: TOraQuery;
    DS_MotiveS: TDataSource;
    Ora_Save: TOraQuery;
    OraQuery1: TOraQuery;
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_close: TOnFocusButton;
    Ed_real_value: TOnEdit;
    ED_exp_num_unit: TOnEdit;
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DS_MotiveSDataChange(Sender: TObject; Field: TField);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure ED_motive_snoKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_real_valueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Old_MotiveSno : Integer;
    JobMode : String;
    procedure Set_InputField(arg1, arg2 : Boolean );

  public
    { Public declarations }
    function  DataChk : Boolean ;
    procedure Retrieve;

  end;

var
  Sub_Motive: TSub_Motive;

implementation

uses PZK10101;

{$R *.DFM}

function TSub_Motive.DataChk : Boolean ;
begin

  Result := True;

  if Trim(ED_motive_sno.Text) = '' then
    begin
      MessageDlg('No.를 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_motive_name.Text) = '' then
    begin
      MessageDlg('인력소요 동인을 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(Ed_real_value.Text) = '' then
    begin
      MessageDlg('실제값을 입력해 주세요', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;


  with OraQuery1 do
    begin
    if (ED_motive_sno.Text <> IntToStr(Old_MotiveSno)) or (JobMode = 'I') then
      begin
        Close;
        Sql.Clear ;
        Sql.Add('select * from a1motive         ');
        Sql.Add(' where duty_id    = :duty_id    ');
        Sql.Add('   and task_sno   = :task_sno   ');
        Sql.Add('   and work_sno   = :work_sno   ');
        Sql.Add('   and motive_sno = :motive_sno   ');
        ParamByName('duty_id').AsString   := MainForm.GSdutyId ;
        ParamByName('task_sno').AsString  := ED_task_sno.Text ;
        ParamByName('work_sno').AsString  := ED_work_sno.Text ;
        ParamByName('motive_sno').AsString:= ED_motive_sno.Text ;
        Open;

        if Recordcount >= 1 then
          begin
            MessageDlg('No: '+ ED_motive_sno.Text +'번이 이미 존재합니다. 저장할수 없습니다.', mtError, [mbok], 0) ;
            Result := False;
            exit;
          end;
      end;
    end;
end;

procedure TSub_Motive.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True, True);

  Ed_motive_sno.SetFocus;
end;

procedure TSub_Motive.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );
end;

procedure TSub_Motive.BT_saveClick(Sender: TObject);
begin
//  if MessageDlg('인력소요 동인 내용을 저장하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
//    System.Exit;

  if not DataChk then EXIT ;

  if JobMode = 'I' then
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('INSERT INTO A1MOTIVE                ');
      Ora_Save.Sql.Add(' (DUTY_ID, TASK_SNO, WORK_SNO, MOTIVE_SNO, MOTIVE_NAME, REAL_VALUE, REAL_UNIT, EXP_NNUM, EXP_NUM_VALUE, EXP_NUM_UNIT )     ');
      Ora_Save.Sql.Add('VALUES                              ');
      Ora_Save.Sql.Add(' (:DUTY_ID, :TASK_SNO, :WORK_SNO, :MOTIVE_SNO, :MOTIVE_NAME, :REAL_VALUE, :REAL_UNIT, :EXP_NNUM, :EXP_NUM_VALUE, :EXP_NUM_UNIT )     ');
      Ora_Save.ParamByName('DUTY_ID').AsString      := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString     := ED_task_sno.Text  ;
      Ora_Save.ParamByName('WORK_SNO').AsString     := ED_work_sno.Text ;
      Ora_Save.ParamByName('MOTIVE_SNO').AsString   := ED_motive_sno.Text ;
      Ora_Save.ParamByName('MOTIVE_NAME').AsString  := ED_motive_name.Text ;
      Ora_Save.ParamByName('REAL_VALUE').AsFloat    := StrToFloat(ED_real_value.Text) ;
      Ora_Save.ParamByName('REAL_UNIT').AsString    := ED_real_unit.Text ;      
      Ora_Save.ParamByName('EXP_NNUM').AsString     := ED_exp_nnum.Text ;
      Ora_Save.ParamByName('EXP_NUM_VALUE').AsString:= ED_exp_num_value.Text ;
      Ora_Save.ParamByName('EXP_NUM_UNIT').AsString := ED_exp_num_unit.Text ;
      Ora_Save.ExecSql;
    end
  else if JobMode = 'U' then
    begin
      Ora_Save.Close;
      Ora_Save.Sql.Clear;
      Ora_Save.Sql.Add('UPDATE A1MOTIVE                        ');
      Ora_Save.Sql.Add('   SET MOTIVE_SNO  = :MOTIVE_SNO,      ');
      Ora_Save.Sql.Add('       MOTIVE_NAME = :MOTIVE_NAME,     ');
      Ora_Save.Sql.Add('       REAL_VALUE  = :REAL_VALUE,      ');
      Ora_Save.Sql.Add('       REAL_UNIT   = :REAL_UNIT,       ');
      Ora_Save.Sql.Add('       EXP_NNUM    = :EXP_NNUM,        ');
      Ora_Save.Sql.Add('       EXP_NUM_VALUE = :EXP_NUM_VALUE,          ');
      Ora_Save.Sql.Add('       EXP_NUM_UNIT  = :EXP_NUM_UNIT   ');
      Ora_Save.Sql.Add(' WHERE DUTY_ID     = :DUTY_ID          ');
      Ora_Save.Sql.Add('   AND TASK_SNO    = :TASK_SNO         ');
      Ora_Save.Sql.Add('   AND WORK_SNO    = :WORK_SNO         ');
      Ora_Save.Sql.Add('   AND MOTIVE_SNO  = :OLDMOTIVE_SNO    ');
      Ora_Save.ParamByName('DUTY_ID').AsString       := MainForm.GSdutyId ;
      Ora_Save.ParamByName('TASK_SNO').AsString      := ED_task_sno.Text  ;
      Ora_Save.ParamByName('WORK_SNO').AsString      := ED_work_sno.Text  ;
      Ora_Save.ParamByName('MOTIVE_SNO').AsString    := ED_motive_sno.Text  ;
      Ora_Save.ParamByName('OLDMOTIVE_SNO').AsInteger:= Old_MotiveSno       ;
      Ora_Save.ParamByName('MOTIVE_NAME').AsString   := ED_motive_name.Text ;
      Ora_Save.ParamByName('REAL_VALUE').AsFloat     := StrToFloat(ED_real_value.Text) ;
      Ora_Save.ParamByName('REAL_UNIT').AsString     := ED_real_unit.Text ;
      Ora_Save.ParamByName('EXP_NNUM').AsString      := ED_exp_nnum.Text ;
      Ora_Save.ParamByName('EXP_NUM_VALUE').AsString := ED_exp_num_value.Text ;
      Ora_Save.ParamByName('EXP_NUM_UNIT').AsString  := ED_exp_num_unit.Text ;
      Ora_Save.ExecSql;
    end
  else
    System.Exit;

  MessageDlg('인력소요 동인이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;

  JobMode               := 'F';
  Set_InputField(False, False );
end;

procedure TSub_Motive.Retrieve;
begin
  with Ora_MotiveS do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from a1motive     ');
      Sql.Add('where duty_id  = :duty_id  ');
      Sql.Add('  and task_sno = :task_sno ');
      Sql.Add('  and work_sno = :work_sno ');
      Sql.Add('order by motive_sno        ');
      ParamByName('duty_id').AsString  := MainForm.GSdutyId;
      ParamByName('task_sno').AsString := ED_task_sno.Text;
      ParamByName('work_sno').AsString := ED_work_sno.Text;
      Open;
      FieldByName('exp_num_value').Alignment := taRightJustify;
    end;
end;

procedure TSub_Motive.Set_InputField(arg1, arg2 : Boolean );
begin
  Grid_MotiveS.Enabled    := not arg1;
  Ed_motive_sno.Enabled   := arg1;
  ED_motive_name.Enabled  := arg1;
  ED_real_value.Enabled   := arg1;
  ED_real_unit.Enabled    := arg1;
  ED_exp_nnum.Enabled     := arg1;
  ED_exp_num_value.Enabled      := arg1;
  ED_exp_num_unit.Enabled       := arg1;

  if arg2 then
    begin
      Ed_motive_sno.Text    := '';
      ED_motive_name.Text   := '';
      ED_real_value.Text    := '';
      ED_real_unit.Text     := '';
      ED_exp_nnum.Text      := '';
      ED_exp_num_value.Text       := '';
      ED_exp_num_unit.Text       := '';
    end;
end;

procedure TSub_Motive.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TSub_Motive.FormShow(Sender: TObject);
begin
  Retrieve;
end;

procedure TSub_Motive.DS_MotiveSDataChange(Sender: TObject;
  Field: TField);
begin
  ED_motive_sno.Text  := Ora_MotiveS.FieldByName('motive_sno').AsString;
  ED_motive_name.Text := Ora_MotiveS.FieldByName('motive_name').AsString;
  ED_real_value.Text  := FloatToStr(Ora_MotiveS.FieldByName('real_value').AsFloat);
  ED_real_unit.Text   := Ora_MotiveS.FieldByName('real_unit').AsString;
  ED_exp_nnum.Text    := Ora_MotiveS.FieldByName('exp_nnum').AsString;
  ED_exp_num_value.Text     := Ora_MotiveS.FieldByName('exp_num_value').AsString;
  ED_exp_num_unit.Text      := Ora_MotiveS.FieldByName('exp_num_unit').AsString;
  Old_MotiveSno       := Ora_MotiveS.FieldByName('motive_sno').AsInteger;
end;

procedure TSub_Motive.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);
end;

procedure TSub_Motive.BT_delClick(Sender: TObject);
begin

  if ED_motive_sno.Text ='' then
    begin
      MessageDlg('삭제할  인력소요 동인을 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('인력소요 동인 '+ ED_motive_sno.Text+'번을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('delete a1motive                     ');
      Sql.Add(' where duty_id     = :duty_id       ');
      Sql.Add('   and task_sno    = :task_sno      ');
      Sql.Add('   and work_sno    = :work_sno      ');
      Sql.Add('   and motive_sno  = :motive_sno    ');
      ParamByName('duty_id').AsString      := Ora_MotiveS.FieldByName('duty_id').AsString;
      ParamByName('task_sno').AsString     := Ora_MotiveS.FieldByName('task_sno').AsString;
      ParamByName('work_sno').AsString     := Ora_MotiveS.FieldByName('work_sno').AsString;
      ParamByName('motive_sno').AsString   := Ora_MotiveS.FieldByName('motive_sno').AsString;
      ExecSql;
    end;

  MessageDlg('인력소요 동인이 삭제되었습니다.',mtInformation, [mbOk],0);
  Retrieve;

end;

procedure TSub_Motive.ED_motive_snoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

procedure TSub_Motive.Ed_real_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not ( Key in [ '0'..'9', #8, #13] ) then
    Key := #0;

end;

end.
