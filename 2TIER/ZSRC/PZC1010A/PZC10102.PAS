unit pzc10102;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Tabs, StdCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, Mask, Calen1, comobj;

type
  TCodeForm = class(TForm)
    HeadPanel: TPanel;
    P_helpinfo: TPanel;
    Panel6: TPanel;
    BB_exit: TBitBtn;
    bb_help: TBitBtn;
    BB_delete: TBitBtn;
    BB_cancel: TBitBtn;
    BB_save: TBitBtn;
    BB_input: TBitBtn;
    P_help: TPanel;
    SearchPanel: TPanel;
    DBG_user: TDBGrid;
    DataPanel: TPanel;
    Panel5: TPanel;
    E_codename: TEdit;
    Panel7: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    E_codeno: TEdit;
    Panel8: TPanel;
    E_codefname: TEdit;
    Query_codeid: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    E_codeorder: TEdit;
    Query_exec: TQuery;
    P_codesuper: TPanel;
    RB_codesuper0: TRadioButton;
    RB_codesuper1: TRadioButton;
    P_codemainon: TPanel;
    RB_codemainon0: TRadioButton;
    RB_codemainon1: TRadioButton;
    Panel2: TPanel;
    Panel9: TPanel;
    ME_coderegday: TMaskEdit;
    ME_codemodday: TMaskEdit;
    Label1: TLabel;
    Panel22: TPanel;
    E_codeidFROM: TEdit;
    E_codeidTO: TEdit;
    BB_print: TBitBtn;
    BB_prnsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel10: TPanel;
    Panel14: TPanel;
    E_SERcode: TEdit;
    SB_coderegday: TSpeedButton;
    SB_codemodday: TSpeedButton;
    L_codeidname: TLabel;
    E_codeid: TEdit;
    Panel3: TPanel;
    Panel11: TPanel;
    E_SERcodename: TEdit;
    L_writetime: TLabel;
    Panel13: TPanel;
    Panel15: TPanel;
    L_writeemp: TLabel;
    Query_codeidCODEID: TStringField;
    Query_codeidCODEIDNAME: TStringField;
    Query_codeidCODENO: TStringField;
    Query_codeidCODENAME: TStringField;
    Query_codeidCODEFNAME: TStringField;
    Query_codeidCODESUPER: TStringField;
    Query_codeidCODEMAINON: TStringField;
    Query_codeidCODEORDER: TFloatField;
    Query_codeidCODEREGDAY: TStringField;
    Query_codeidCODEMODDAY: TStringField;
    Query_codeidWRITETIME: TStringField;
    Query_codeidWRITEEMP: TStringField;
    Panel16: TPanel;
    cb_UseYN: TComboBox;
    Query_codeidUSEYN: TStringField;
    Panel17: TPanel;
    RadioButton1: TRadioButton;
    Rbtn_Y: TRadioButton;
    Rbtn_N: TRadioButton;
    Btext: TBitBtn;
    E_HRCODE1: TEdit;
    Panel18: TPanel;
    E_HRCODE2: TEdit;
    Panel19: TPanel;
    Query_codeidGROUPCODE: TStringField;
    Query_codeidGROUPCODENAME: TStringField;
    Query_codeidGROUPCODE2: TStringField;
    Query_codeidGROUPCODENAME2: TStringField;
    E_CNHRCODE1: TEdit;
    E_CNHRCODE2: TEdit;
    Panel21: TPanel;
    Panel20: TPanel;
    procedure BB_exitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_inputClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_prnsetupClick(Sender: TObject);
    procedure BB_printClick(Sender: TObject);
    procedure E_SERcodeKeyPress(Sender: TObject; var Key: Char);
    procedure SB_coderegdayClick(Sender: TObject);
    procedure SB_codemoddayClick(Sender: TObject);
    procedure Rbtn_YClick(Sender: TObject);
    procedure cb_UseYNChange(Sender: TObject);
    procedure BtextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Update_Query;
  end;

var
  CodeForm: TCodeForm;

implementation
{$R *.DFM}

uses
  pzc10101, pzc10104;

var
  OPstate: Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}
  LastCodeno: string;

procedure TCodeForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TCodeForm.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  Update_Query;
  E_SERcode.SetFocus;
end;

procedure TCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query_codeid.Close;
end;

procedure TCodeForm.Update_Query;
var
  SearchOptions: TLocateOptions;
begin
  OPstate := 2; {열람상태}
  P_helpinfo.Caption := '해당 코드분류의 자료를 조회하고 있습니다.';
  Application.ProcessMessages;
  Query_codeid.Close;
  Query_codeid.SQL.Clear;
  Query_codeid.SQL.Add(' SELECT              ');
  Query_codeid.SQL.Add('    A.CODEID,        ');
  Query_codeid.SQL.Add('    B.CODEIDNAME,    ');
  Query_codeid.SQL.Add('    A.CODENO,        ');
  Query_codeid.SQL.Add('    A.CODENAME,      ');
  Query_codeid.SQL.Add('    A.CODEFNAME,     ');
  Query_codeid.SQL.Add('    A.CODESUPER,     ');
  Query_codeid.SQL.Add('    A.CODEMAINON,    ');
  Query_codeid.SQL.Add('    A.CODEORDER,     ');
  Query_codeid.SQL.Add('    A.CODEREGDAY,    ');
  Query_codeid.SQL.Add('    A.CODEMODDAY,    ');
  Query_codeid.SQL.Add('    A.WRITETIME,     ');
  Query_codeid.SQL.Add('    A.WRITEEMP,      ');
  Query_codeid.SQL.Add('    A.USEYN,         ');
  Query_codeid.SQL.Add('    A.GROUPCODE,     ');
  Query_codeid.SQL.Add('    A.GROUPCODENAME, ');
  Query_codeid.SQL.Add('    A.GROUPCODE2,    ');
  Query_codeid.SQL.Add('    A.GROUPCODENAME2 ');
  Query_codeid.SQL.Add(' FROM PYCCODE A, PYCCOID B                ');
  Query_codeid.SQL.Add(' WHERE (A.CODEID = '''+E_codeid.Text+''' )');
  Query_codeid.SQL.Add('   AND (A.codeid = B.codeid)');
  if E_SERcode.Text <> '' then
    Query_codeid.SQL.Add(' and (A.CODENO LIKE '''+E_SERcode.Text+'%'+''' ) ');
  if E_SERcodename.Text <> '' then
    Query_codeid.SQL.Add(' and (A.CODENAME LIKE '''+'%'+E_SERcodename.Text+'%'+''' ) ');

  if Rbtn_Y.Checked = True then
     Query_codeid.SQL.Add('   AND (A.USEYN = ''Y'')');

  if Rbtn_N.Checked = True then
     Query_codeid.SQL.Add('   AND (A.USEYN = ''N'')');

  Query_codeid.SQL.Add('  ORDER BY A.CODEID , ');
  Query_codeid.SQL.Add('           A.CODENO ');
  Query_codeid.Open;

  if Query_codeid.RecordCount = 0 then
  begin
    P_helpinfo.Caption := '해당 코드분류의 자료가 없습니다.';
  end
  else
  begin
    if LastCodeno <> '' then
    begin
      SearchOptions := [loPartialKey];
      if Query_codeid.Locate('CODENO', LastCodeno, SearchOptions) then
        DBG_user.SetFocus;
    end;
    P_helpinfo.Caption := '해당 코드분류의 자료가 조회되었습니다.';
  end;
end;

procedure TCodeForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_codeno.Text    := Query_codeidCODENO.AsString;
  E_codename.Text  := Query_codeidCODENAME.AsString;
  E_codefname.Text := Query_codeidCODEFNAME.AsString;
  if Query_codeidCODESUPER.AsString = '0' then
    RB_codesuper0.Checked := True
  else if Query_codeidCODESUPER.AsString = '1' then
    RB_codesuper1.Checked := True;
  if Query_codeidCODEMAINON.AsString = '0' then
    RB_codemainon0.Checked := True
  else if Query_codeidCODEMAINON.AsString = '1' then
    RB_codemainon1.Checked := True;
  E_codeorder.Text := IntToStr(Query_codeidCODEORDER.AsInteger);
  ME_coderegday.Text := Query_codeidCODEREGDAY.AsString;
  ME_codemodday.Text := Query_codeidCODEMODDAY.AsString;

  E_HRCODE1.Text := Query_codeidGROUPCODE.AsString;
  E_CNHRCODE1.Text := Query_codeidGROUPCODENAME.AsString;
  E_HRCODE2.Text := Query_codeidGROUPCODE2.AsString;
  E_CNHRCODE2.Text := Query_codeidGROUPCODENAME2.AsString;

  if Query_codeidWRITETIME.AsString <> '' then
    L_writetime.Caption := Copy(Query_codeidWRITETIME.AsString,1,4)+'.'+
                           Copy(Query_codeidWRITETIME.AsString,5,2)+'.'+
                           Copy(Query_codeidWRITETIME.AsString,7,2)+' '+
                           Copy(Query_codeidWRITETIME.AsString,9,2)+':'+
                           Copy(Query_codeidWRITETIME.AsString,11,2)+':'+
                           Copy(Query_codeidWRITETIME.AsString,13,2)
  else
    L_writetime.Caption := '';
  L_writeemp.Caption := Query_codeidWRITEEMP.AsString;

  if Query_codeidUSEYN.AsString = 'Y' then
    cb_UseYN.ItemIndex := 0
  else if  Query_codeidUSEYN.AsString ='N' then
    cb_UseYN.ItemIndex := 1
  else
    cb_UseYN.Text := '';
  OPstate := 2; {열람상태}

  if Query_codeid.BOF then
    P_helpinfo.Caption := '자료의 처음입니다.'
  else if Query_codeid.EOF then
    P_helpinfo.Caption := '자료의 마지막입니다.'
  else
    P_helpinfo.Caption := '';
  if cb_UseYN.Text ='Y' then
    cb_UseYN.Color := $00FFDCB9
  else if cb_UseYN.Text ='N' then
    cb_UseYN.Color := $00D9D9FF
  else
     cb_UseYN.Color := $00E8E8E8;
end;

procedure TCodeForm.BB_inputClick(Sender: TObject);
begin
  OPstate := 1; {입력상태}
  P_helpinfo.Caption := '새로운 자료를 등록하십시요.';
  E_codeno.Text := '';
  E_codename.Text := '';
  E_codefname.Text := '';
  L_writetime.Caption := '';
  L_writeemp.Caption  := '';

  RB_codesuper1.Checked := True;
  RB_codemainon1.Checked := True;
  E_codeorder.Text := '9999';
  ME_coderegday.Text := Copy(MainForm.CurDate,1,8);
  ME_codemodday.Text := Copy(MainForm.CurDate,1,8);
  E_codeno.SetFocus;
end;

procedure TCodeForm.BB_cancelClick(Sender: TObject);
begin
  OPstate := 0; {비어있는상태}
  E_codeno.Text := '';
  E_codename.Text := '';
  E_codefname.Text := '';
  L_writetime.Caption := '';
  L_writeemp.Caption  := '';

  RB_codesuper1.Checked := True;
  RB_codemainon1.Checked := True;
  E_codeorder.Text := '9999';
  ME_coderegday.Text := Copy(MainForm.CurDate,1,8);
  ME_codemodday.Text := Copy(MainForm.CurDate,1,8);
  E_codeno.SetFocus;
  P_helpinfo.Caption := '';
end;

procedure TCodeForm.BB_saveClick(Sender: TObject);
begin
  if OPstate = 0 then  {비어있는상태}
  begin
    System.Exit;
    P_helpinfo.Caption := '자료가 없어 저장할 수 없습니다.';
  end;

  try
    if OPstate = 1 then {입력상태}
    begin
      Query_exec.Close;
      Query_exec.SQL.Clear;
      Query_exec.SQL.Add('SELECT CODENO ');
      Query_exec.SQL.Add('FROM PYCCODE ');
      Query_exec.SQL.Add('WHERE (CODEID = '''+E_codeid.Text+''') and  ');
      Query_exec.SQL.Add('      (CODENO = '''+E_codeno.Text+''') ');
      Query_exec.Open;
      if Query_exec.RecordCount > 0 then
      begin
        Query_exec.Close;
        MessageBox(Handle, '이미 코드가 존재합니다.', '입력오류', MB_ICONWARNING);
        System.Exit;
      end;

      LastCodeno := E_codeno.Text;
      Query_exec.Close;
      Query_exec.SQL.Clear;
      Query_exec.SQL.Add('INSERT INTO PYCCODE (');
      Query_exec.SQL.Add('   CODEID,     CODENO,    CODENAME, CODEFNAME, CODESUPER, ');
      Query_exec.SQL.Add('   CODEMAINON, CODEORDER, CODEREGDAY, ');
      Query_exec.SQL.Add('   CODEMODDAY, WRITETIME, WRITEEMP, USEYN, ');
      Query_exec.SQL.Add('   GROUPCODE, GROUPCODENAME, GROUPCODE2, GROUPCODENAME2) VALUES(');
      Query_exec.SQL.Add(':Pcodeid, :Pcodeno, :Pcodename, :Pcodefname, :Pcodesuper, ');
      Query_exec.SQL.Add(':Pcodemainon, :Pcodeorder, :Pcoderegday, ');
      Query_exec.SQL.Add(':Pcodemodday, :Pwritetime, :Pwriteemp, :Puseyn,');
      Query_exec.SQL.Add(':Pgroupcode,  :Pgroupcodename, :Pgroupcode2, :Pgroupcodename2)');
      Query_exec.ParamByName('Pcodeid').AsString    := E_codeid.Text;
      Query_exec.ParamByName('Pcodeno').AsString    := E_codeno.Text;
      Query_exec.ParamByName('Pcodename').AsString  := E_codename.Text;
      Query_exec.ParamByName('Pcodefname').AsString := E_codefname.Text;
      if RB_codesuper0.Checked then
        Query_exec.ParamByName('Pcodesuper').AsString  := '0'
      else if RB_codesuper1.Checked then
        Query_exec.ParamByName('Pcodesuper').AsString  := '1';
      if RB_codemainon0.Checked then
        Query_exec.ParamByName('Pcodemainon').AsString := '0'
      else if RB_codemainon1.Checked then
        Query_exec.ParamByName('Pcodemainon').AsString := '1';
      Query_exec.ParamByName('Pcodeorder').AsFloat       := StrToIntDef(E_codeorder.Text,0);
      Query_exec.ParamByName('Pcoderegday').AsString     := ME_coderegday.Text;
      Query_exec.ParamByName('Pcodemodday').AsString     := ME_codemodday.Text;
      Query_exec.ParamByName('Pwritetime').AsString      := Copy(MainForm.CurDate,1,14);
      Query_exec.ParamByName('Pwriteemp').AsString       := MainForm.Pempno;
      Query_exec.ParamByName('PuseYN').AsString          := cb_UseYN.Text;
      Query_exec.ParamByName('Pgroupcode').AsString      := E_HRCODE1.Text;
      Query_exec.ParamByName('Pgroupcodename').AsString  := E_CNHRCODE1.Text;
      Query_exec.ParamByName('Pgroupcode2').AsString     := E_HRCODE2.Text;
      Query_exec.ParamByName('Pgroupcodename2').AsString := E_CNHRCODE2.Text;
      Query_exec.EXECSQL;
      Update_Query;
      P_helpinfo.Caption := '새로운 자료를 입력했습니다.';
    end
    else
    begin
      if E_codeno.Text = Query_codeidCODENO.AsString then {내용만 변경}
      begin
        LastCodeno := E_codeno.Text;
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('UPDATE PYCCODE ');
        Query_exec.SQL.Add('SET CODENAME   = :Pcodename, ');
        Query_exec.SQL.Add('    CODEFNAME  = :Pcodefname,  CODESUPER      = :Pcodesuper,  ');
        Query_exec.SQL.Add('    CODEMAINON = :Pcodemainon, CODEORDER      = :Pcodeorder,  ');
        Query_exec.SQL.Add('    CODEREGDAY = :Pcoderegday, CODEMODDAY     = :Pcodemodday, ');
        Query_exec.SQL.Add('    WRITETIME  = :Pwritetime,  WRITEEMP       = :Pwriteemp, USEYN = :Puseyn, ');
        Query_exec.SQL.Add('    GROUPCODE  = :Pgroupcode,  GROUPCODENAME  = :Pgroupcodename, ');
        Query_exec.SQL.Add('    GROUPCODE2 = :Pgroupcode2, GROUPCODENAME2 = :Pgroupcodename2 ');
        Query_exec.SQL.Add('WHERE (CODEID  = :Pcodeid) and ');
        Query_exec.SQL.Add('      (CODENO  = :Pcodeno) ');
        Query_exec.ParamByName('Pcodeid').AsString := E_codeid.Text;
        Query_exec.ParamByName('Pcodeno').AsString := E_codeno.Text;

        Query_exec.ParamByName('Pcodename').AsString  := E_codename.Text;
        Query_exec.ParamByName('Pcodefname').AsString := E_codefname.Text;
        if RB_codesuper0.Checked then
          Query_exec.ParamByName('Pcodesuper').AsString := '0'
        else if RB_codesuper1.Checked then
          Query_exec.ParamByName('Pcodesuper').AsString := '1'
        else
          Query_exec.ParamByName('Pcodesuper').AsString := ' ';

        if RB_codemainon0.Checked then
          Query_exec.ParamByName('Pcodemainon').AsString := '0'
        else if RB_codemainon1.Checked then
          Query_exec.ParamByName('Pcodemainon').AsString := '1'
        else
          Query_exec.ParamByName('Pcodemainon').AsString := ' ';

        Query_exec.ParamByName('Pcodeorder').AsFloat       := StrToIntDef(E_codeorder.Text,0);
        Query_exec.ParamByName('Pcoderegday').AsString     := ME_coderegday.Text;
        Query_exec.ParamByName('Pcodemodday').AsString     := ME_codemodday.Text;
        Query_exec.ParamByName('Pwritetime').AsString      := Copy(MainForm.CurDate,1,14);
        Query_exec.ParamByName('Pwriteemp').AsString       := MainForm.Pempno;
        Query_exec.ParamByName('PuseYN').AsString          := cb_UseYN.Text;
        Query_exec.ParamByName('Pgroupcode').AsString      := E_HRCODE1.Text;
        Query_exec.ParamByName('Pgroupcodename').AsString  := E_CNHRCODE1.Text;
        Query_exec.ParamByName('Pgroupcode2').AsString     := E_HRCODE2.Text;
        Query_exec.ParamByName('Pgroupcodename2').AsString := E_CNHRCODE2.Text;

        Query_exec.EXECSQL;
        Update_Query;
        P_helpinfo.Caption := '기존의 자료를 수정했습니다.';
      end
      else
      begin
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('SELECT CODENO ');
        Query_exec.SQL.Add('FROM PYCCODE ');
        Query_exec.SQL.Add('WHERE (CODEID = '''+ E_codeid.Text+''') and  ');
        Query_exec.SQL.Add('      (CODENO = '''+ E_codeno.Text+''') ');
        Query_exec.Open;
        if Query_exec.RecordCount > 0 then
        begin
          Query_exec.Close;
          MessageBox(Handle, '이미 코드가 존재합니다.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

        LastCodeno := E_codeno.Text;
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('UPDATE PYCCODE ');
        Query_exec.SQL.Add('SET CODENO     = :PNEWcodeno,  CODENAME       = :Pcodename, ');
        Query_exec.SQL.Add('    CODEFNAME  = :Pcodefname,  CODESUPER      = :Pcodesuper,  CODEMAINON = :Pcodemainon, ');
        Query_exec.SQL.Add('    CODEORDER  = :Pcodeorder,  CODEREGDAY     = :Pcoderegday, CODEMODDAY = :Pcodemodday, ');
        Query_exec.SQL.Add('    WRITETIME  = :Pwritetime,  WRITEEMP       = :Pwriteemp, ');
        Query_exec.SQL.Add('    GROUPCODE  = :Pgroupcode,  GROUPCODENAME  = :Pgroupcodename, ');
        Query_exec.SQL.Add('    GROUPCODE2 = :Pgroupcode2, GROUPCODENAME2 = :Pgroupcodename2 ');
        Query_exec.SQL.Add('WHERE (CODEID  = :Pcodeid) and ');
        Query_exec.SQL.Add('      (CODENO  = :POLDcodeno)  ');
        Query_exec.ParamByName('Pcodeid').AsString := E_codeid.Text;
        Query_exec.ParamByName('POLDcodeno').AsString := Query_codeidCODENO.AsString;
        Query_exec.ParamByName('PNEWcodeno').AsString := E_codeno.Text;

        Query_exec.ParamByName('Pcodename').AsString  := E_codename.Text;
        Query_exec.ParamByName('Pcodefname').AsString := E_codefname.Text;
        if RB_codesuper0.Checked then
          Query_exec.ParamByName('Pcodesuper').AsString := '0'
        else if RB_codesuper1.Checked then
          Query_exec.ParamByName('Pcodesuper').AsString := '1'
        else
          Query_exec.ParamByName('Pcodesuper').AsString := ' ';

        if RB_codemainon0.Checked then
          Query_exec.ParamByName('Pcodemainon').AsString := '0'
        else if RB_codemainon1.Checked then
          Query_exec.ParamByName('Pcodemainon').AsString := '1'
        else
          Query_exec.ParamByName('Pcodemainon').AsString := ' ';

        Query_exec.ParamByName('Pcodeorder').AsFloat       := StrToIntDef(E_codeorder.Text,0);
        Query_exec.ParamByName('Pcoderegday').AsString     := ME_coderegday.Text;
        Query_exec.ParamByName('Pcodemodday').AsString     := ME_codemodday.Text;
        Query_exec.ParamByName('Pwritetime').AsString      := Copy(MainForm.CurDate,1,14);
        Query_exec.ParamByName('Pwriteemp').AsString       := MainForm.Pempno;
        Query_exec.ParamByName('PuseYN').AsString          := cb_UseYN.Text;
        Query_exec.ParamByName('Pgroupcode').AsString      := E_HRCODE1.Text;
        Query_exec.ParamByName('Pgroupcodename').AsString  := E_CNHRCODE1.Text;
        Query_exec.ParamByName('Pgroupcode2').AsString     := E_HRCODE2.Text;
        Query_exec.ParamByName('Pgroupcodename2').AsString := E_CNHRCODE2.Text;
        Query_exec.EXECSQL;
        Update_Query;
        P_helpinfo.Caption := '새로운 코드로 변경되었습니다.';
      end;
    end;
    Query_exec.Close;
  except
    on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        BB_cancelClick(Sender);
      end;
  end;
end;

procedure TCodeForm.BB_deleteClick(Sender: TObject);
var
  Save_codeid, Save_codeno, Jump_codeno: string;
  SearchOptions: TLocateOptions;
begin
  if OPstate <> 2 then {열람상태가 아니면}
  begin
    P_helpinfo.Caption := '선택된 자료가 없으므로 삭제할 수 없습니다.';
    System.Exit;
  end;
  if MessageDlg('삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
    System.Exit;
  try
    Save_codeid := E_codeid.Text;
    Save_codeno := E_codeno.Text;
    Query_codeid.Next;
    if Query_codeid.eof then
    begin
      Query_codeid.Prior;
      Jump_codeno := Query_codeidCODENO.AsString;
    end
    else
    begin
      Jump_codeno := Query_codeidCODENO.AsString;
    end;

    Query_exec.Close;
    Query_exec.SQL.Clear;
    Query_exec.SQL.Add('DELETE FROM PYCCODE ');
    Query_exec.SQL.Add('WHERE (CODEID = :Pcodeid) AND (CODENO = :Pcodeno) ');
    Query_exec.ParamByName('Pcodeid').AsString := Save_codeid;
    Query_exec.ParamByName('Pcodeno').AsString := Save_codeno;
    Query_exec.EXECSQL;
    Query_exec.Close;
    LastCodeno := '';
    Update_Query;
    SearchOptions := [loPartialKey];
    if Query_codeid.Locate('CODENO', Jump_codeno, SearchOptions) then
      DBG_user.SetFocus;

    P_helpinfo.Caption := '기존자료가 삭제되었습니다.';
  except
    on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        BB_cancelClick(Sender);
      end;
  end;
end;

procedure TCodeForm.BB_prnsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TCodeForm.BB_printClick(Sender: TObject);
begin
  if (E_codeidFROM.Text = '') or (E_codeidTO.Text = '') then
  begin
    P_helpinfo.Caption := '먼저 인쇄코드ID범위를 입력하세요.';
    System.Exit;
  end;
  P_helpinfo.Caption := '인쇄중입니다.';


 // CodePrint.Query_print.Close;
   PrintCodeno.QRL_codeRANGE.Caption := '◑ 코드ID 범위: '+E_codeidFROM.Text+' ~ '+E_codeidTO.Text;
   PrintCodeno.QRLsysdate.Caption    := MainForm.L_CurDate.Caption;
   PrintCodeno.QuickRep1.Preview;
 // CodePrint.Query_print.ParamByName('P_codeidFROM').AsString := E_codeidFROM.Text;
 // CodePrint.Query_print.ParamByName('P_codeidTO').AsString   := E_codeidTO.Text;
 // CodePrint.Query_print.Open;
 // CodePrint.QReport.Print;
  P_helpinfo.Caption := '인쇄가 완료되었습니다.';
end;

procedure TCodeForm.E_SERcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  Key := #0;
  Update_Query;
end;

procedure TCodeForm.SB_coderegdayClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_coderegday.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;
procedure TCodeForm.SB_codemoddayClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_codemodday.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;

procedure TCodeForm.Rbtn_YClick(Sender: TObject);
begin
  Update_Query;
end;

procedure TCodeForm.cb_UseYNChange(Sender: TObject);
begin
  if cb_UseYN.Text ='Y' then
    cb_UseYN.Color := $00FFDCB9
  else if cb_UseYN.Text ='N' then
    cb_UseYN.Color := $00D9D9FF
  else
     cb_UseYN.Color := $00E8E8E8;
end;

procedure TCodeForm.BtextClick(Sender: TObject);
var XL, XArr: Variant;
    i,k: integer;
begin
   if Query_codeid.RecordCount < 1 then
   begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
   end;

   XArr := VarArrayCreate([1, 9], VarVariant);
   try
      XL := CreateOLEObject('Excel.Application');
   except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
   end;
   screen.cursor := crHourGlass;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   XL.WorkSheets[1].Name := 'EXCEL TEST';  // 시트명 부여
   XL.Range['A1:I2'].Merge;                //셀 병합

   //TITLE NAME 설정
   XL.Range['A1'].value := '코드내역 리스트';
   XL.Range['A1'].font.Size := 16;

   //컬럼명 지정_서브타이블 지정
   XArr[1] := '코드ID';
   XArr[2] := '코드번호';
   XArr[3] := '코드약명';
   XArr[4] := '코드총명';
   XArr[5] := '그룹HR CODE';
   XArr[6] := '그룹HR CODE명';
   XArr[7] := '그룹HR CODE2';
   XArr[8] := '그룹HR CODE명2';
   XArr[9] := '사용여부';
   XL.Range['A3' , 'I3'].Value := XArr;
   k := 3;
   for i := 1 to 9 do
   begin
      XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
      //XL.Range[CHR(64 + i) + '3'].VerticalAlignment := 3;
      XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
      //XL.Range[CHR(64 + i) + '3'].Borders.color:= clblack;
      XL.Range[CHR(64 + i) + '3'].font.Size := 10;
      XL.Range[CHR(64 + i) + '3'].font.Bold := True;
   end;

   //검색된 자료를 excel에 export처리 시킨다.
   //어케 하냐구? ㅋㅋ 잘 하면 되지요~

   Query_codeid.First;

   for i := 1 to  Query_codeid.RecordCount do
   begin
      XArr[1] := Query_codeid.FieldbyName('CODEID').AsString;
      XArr[2] := Query_codeid.FieldbyName('CODENO').AsString;
      XArr[3] := Query_codeid.FieldbyName('CODENAME').AsString;;
      XArr[4] := Query_codeid.FieldbyName('CODEFNAME').AsString;;
      XArr[5] := Query_codeid.FieldbyName('GROUPCODE').AsString;
      XArr[6] := Query_codeid.FieldbyName('GROUPCODENAME').AsString;
      XArr[7] := Query_codeid.FieldbyName('GROUPCODE2').AsString;;
      XArr[8] := Query_codeid.FieldbyName('GROUPCODENAME2').AsString;;
      XArr[9] := Query_codeid.FieldbyName('USEYN').AsString;;
      //XArr[5] := Query_codeidUSEYN.AsString;
      XL.Range['A' + IntToStr(k+1), 'I' + IntToStr(k+1)].Value := XArr;
      inc(k);
      Query_codeid.Next;
   end;

   //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.

   XL.Range['A1', 'I' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'I' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'I' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'I' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A3', 'I' + IntToStr(k)].font.Size := 9;
   XL.Range['B3', 'C' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['D3', 'I' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   XL.Range['A1', 'I' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;

end;

end.
