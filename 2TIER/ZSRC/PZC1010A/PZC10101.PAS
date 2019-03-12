{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PZC1010A(공통코드관리 프로그램) 2Tier
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 정규용
Version         : 30.01
Date            : 2004.10.14
Update contents
  버전     수정일     수정자   관련근거        수정내용
  30.01   2004.10.14  정규용    자체개선   기존 퀵레포트 버전 오류 수정(레포트2개 신규작성)
                                           사용여부(USEYN) 필드추가(외 기타 컨트롤)
--------------------------------------------------------------------------------
}
unit pzc10101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Mask, Spin, Grids, DBGrids,
  Buttons, ExtCtrls, Tabs, Timeftp, pass, Datelib, Calen1, codetext;

type
  TMainForm = class(TForm)
    HeadPanel: TPanel;
    Lempinfo: TLabel;
    L_CurDate: TLabel;
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
    Panel1: TPanel;
    E_SERcode_id: TEdit;
    DataPanel: TPanel;
    Panel3: TPanel;
    E_codeid: TEdit;
    Panel5: TPanel;
    E_codelen: TEdit;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Query_code: TQuery;
    Database1: TDatabase;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Panel8: TPanel;
    E_codereg: TEdit;
    Query_exec: TQuery;
    E_codeidname: TEdit;
    P_codetype: TPanel;
    RB_codetype1: TRadioButton;
    RB_codetype2: TRadioButton;
    RB_codetype3: TRadioButton;
    ME_cidregday: TMaskEdit;
    ME_cidmodday: TMaskEdit;
    BB_Code: TBitBtn;
    BB_print: TBitBtn;
    BB_prnsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel22: TPanel;
    E_codeidFROM: TEdit;
    E_codeidTO: TEdit;
    Label1: TLabel;
    Panel9: TPanel;
    SB_cidregday: TSpeedButton;
    SB_cidmodday: TSpeedButton;
    Panel2: TPanel;
    E_SERcodeidname: TEdit;
    L_writetime: TLabel;
    Panel11: TPanel;
    Panel13: TPanel;
    L_writeemp: TLabel;
    Btext: TBitBtn;
    Query_codeCODEID: TStringField;
    Query_codeCODEIDNAME: TStringField;
    Query_codeCODELEN: TFloatField;
    Query_codeCIDREGDAY: TStringField;
    Query_codeCIDMODDAY: TStringField;
    Query_codeCODEREG: TStringField;
    Query_codeWRITETIME: TStringField;
    Query_codeWRITEEMP: TStringField;
    Query_codeCODETYPE: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_SERcode_idKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_exitClick(Sender: TObject);
    procedure BB_inputClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_CodeClick(Sender: TObject);
    procedure BB_prnsetupClick(Sender: TObject);
    procedure BB_printClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SB_cidregdayClick(Sender: TObject);
    procedure SB_cidmoddayClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure DBG_userDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pempno, pkorname, password: string;
    CurDate: string;
    start: Integer;
    procedure Update_Query;
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
implementation
{$R *.DFM}

uses
  pzc10102, pzc10103;

var
  OPstate: Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}
  LastCodeid: string;
  Running: Boolean;

procedure TMainForm.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  if Running then
    System.Exit;
  Running := True;  
  Application.ProcessMessages;


  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);
  Lempinfo.Caption := Pkorname + '(' +pempno+ ')';
  Application.ProcessMessages;
  Database1.Connected  := False;
  for i := 0 to Database1.Params.Count-1 do
  begin
    if System.Pos('SERVER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
    if System.Pos('USER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if System.Pos('PASSWORD',Database1.Params[i]) > 0 then
     Database1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
  end;
  Database1.Connected  := True;
  CurDate := Timeftp.TimeDate(Query_Exec);
  L_CurDate.Caption := Copy(CurDate, 1, 4)+'/'+
                       Copy(CurDate, 5, 2)+'/'+
                       Copy(CurDate, 7, 2);

  LastCodeid := '';
  Update_Query;
  E_SERcode_id.SetFocus;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('작업을 종료하시겠습니까?',
                            '작업안내', mb_YesNo) = IDYES
  then
    Action := caFree
  else
    Action := caNone;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Running := False;
  start := 0;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
{
  if start = 0 then
  begin
    start := 1;
    if not pass.PassDialog(Self, pempno, pkorname, password) then
      System.Halt(0);
      L_empinfo.Caption := pkorname+'('+pempno+')';
  end;
}
end;

procedure TMainForm.Update_Query;
var
  FirstWhere: Boolean;
  SearchOptions: TLocateOptions;
begin
  OPstate := 2; {열람상태}
  P_helpinfo.Caption := '해당 코드분류의 자료를 조회하고 있습니다.';
  Application.ProcessMessages;
  FirstWhere := False;
  Query_code.Close;
  Query_code.SQL.Clear;
  Query_code.SQL.Add(' SELECT ');
  Query_code.SQL.Add('    CODEID , ');
  Query_code.SQL.Add('    CODEIDNAME , ');
  Query_code.SQL.Add('    DECODE(CODETYPE,''1'',''문자'',''2'',''숫자'',''3'',''문자+숫자'') CODETYPE, ');
  Query_code.SQL.Add('    CODELEN , ');
  Query_code.SQL.Add('    CIDREGDAY , ');
  Query_code.SQL.Add('    CIDMODDAY , ');
  Query_code.SQL.Add('    CODEREG , ');
  Query_code.SQL.Add('    WRITETIME , ');
  Query_code.SQL.Add('    WRITEEMP ');
  Query_code.SQL.Add(' FROM PYCCOID ');
  if E_SERcode_id.Text <> '' then
  begin
    FirstWhere := True;
    Query_code.SQL.Add('   WHERE (CODEID LIKE '''+E_SERcode_id.Text+'%'+''' ) ');
  end;
  if E_SERcodeidname.Text <> '' then
  begin
    if FirstWhere then
      Query_code.SQL.Add(' and (CODEIDNAME LIKE '''+'%'+E_SERcodeidname.Text+'%'+''' ) ')
    else
      Query_code.SQL.Add(' WHERE (CODEIDNAME LIKE '''+'%'+E_SERcodeidname.Text+'%'+''' ) ');
  end;
  Query_code.SQL.Add(' ORDER BY CODEID ');
  Query_code.DisableControls;
  Query_code.Open;

  if Query_code.RecordCount = 0 then
  begin
    P_helpinfo.Caption := '해당 코드분류의 자료가 없습니다.';
  end
  else
  begin
    if LastCodeid <> '' then
    begin
      SearchOptions := [loPartialKey];
      if Query_code.Locate('CODEID', LastCodeid, SearchOptions) then
        DBG_user.SetFocus;
    end;
    P_helpinfo.Caption := '해당 코드분류의 자료가 조회되었습니다.';
  end;
  Query_code.EnableControls;
end;

procedure TMainForm.E_SERcode_idKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  Key := #0;
  Update_Query;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_codeid.Text := Query_codeCODEID.AsString;
  E_codeidname.Text := Query_codeCODEIDNAME.AsString;
  if Query_codeCODETYPE.AsString = '문자' then
    RB_codetype1.Checked := True
  else if Query_codeCODETYPE.AsString = '숫자' then
    RB_codetype2.Checked := True
  else if Query_codeCODETYPE.AsString = '문자+숫자' then
    RB_codetype3.Checked := True;
  E_codelen.Text    := IntToStr(Query_codeCODELEN.AsInteger);
  ME_cidregday.Text := Query_codeCIDREGDAY.AsString;
  ME_cidmodday.Text := Query_codeCIDMODDAY.AsString;
  E_codereg.Text    := Query_codeCODEREG.AsString;

  if Query_codeWRITETIME.AsString <> '' then
    L_writetime.Caption := Copy(Query_codeWRITETIME.AsString,1,4)+'.'+
                           Copy(Query_codeWRITETIME.AsString,5,2)+'.'+
                           Copy(Query_codeWRITETIME.AsString,7,2)+' '+
                           Copy(Query_codeWRITETIME.AsString,9,2)+':'+
                           Copy(Query_codeWRITETIME.AsString,11,2)+':'+
                           Copy(Query_codeWRITETIME.AsString,13,2)
  else
    L_writetime.Caption := '';
  L_writeemp.Caption := Query_codeWRITEEMP.AsString;

  OPstate := 2; {열람상태}

  if Query_code.BOF then
    P_helpinfo.Caption := '자료의 처음입니다.'
  else if Query_code.EOF then
    P_helpinfo.Caption := '자료의 마지막입니다.'
  else
    P_helpinfo.Caption := '';
end;

procedure TMainForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BB_inputClick(Sender: TObject);
begin
  OPstate := 1; {입력상태}
  P_helpinfo.Caption := '새로운 자료를 등록하십시요.';
  E_codeid.Text := '';
  E_codeidname.Text := '';
  RB_codetype3.Checked := True;
  E_codelen.text := '';
  L_writetime.Caption := '';
  L_writeemp.Caption  := '';

  ME_cidregday.Text := copy(CurDate,1,8);
  ME_cidmodday.Text := copy(CurDate,1,8);
  E_codereg.Text := Pkorname;
  E_codeid.SetFocus;
end;

procedure TMainForm.BB_cancelClick(Sender: TObject);
begin
  OPstate := 0; {비어있는상태}
  E_codeid.Text := '';
  E_codeidname.Text := '';
  RB_codetype3.Checked := True;
  E_codelen.text := '';
  L_writetime.Caption := '';
  L_writeemp.Caption  := '';

  ME_cidregday.Text := copy(CurDate,1,8);
  ME_cidmodday.Text := copy(CurDate,1,8);
  E_codereg.Text := Pkorname;
  E_codeid.SetFocus;
  P_helpinfo.Caption := '';
end;

procedure TMainForm.BB_saveClick(Sender: TObject);
begin
  if OPstate = 0 then  {비어있는상태}
  begin
    P_helpinfo.Caption := '자료가 없어 저장할 수 없습니다.';
    System.Exit;
  end;

  try
    if OPstate = 1 then {입력상태}
    begin
      Query_exec.Close;
      Query_exec.SQL.Clear;
      Query_exec.SQL.Add('SELECT CODEID ');
      Query_exec.SQL.Add('FROM PYCCOID ');
      Query_exec.SQL.Add('WHERE CODEID = '''+E_codeid.Text+''' ');
      Query_exec.Open;
      if Query_exec.RecordCount > 0 then
      begin
        Query_exec.Close;
        MessageBox(Handle, '이미 코드ID가 존재합니다.', '입력오류', MB_ICONWARNING);
        System.Exit;
      end;

      LastCodeid := E_codeid.Text;
      Query_exec.Close;
      Query_exec.SQL.Clear;
      Query_exec.SQL.Add('INSERT INTO PYCCOID ( ');
      Query_exec.SQL.Add('   CODEID,    CODEIDNAME, CODETYPE, CODELEN, ');
      Query_exec.SQL.Add('   CIDREGDAY, CIDMODDAY,  CODEREG, ');
      Query_exec.SQL.Add('   WRITETIME, WRITEEMP ) VALUES( ');
      Query_exec.SQL.Add(':Pcodeid, :Pcodeidname, :Pcodetype, :Pcodelen, ');
      Query_exec.SQL.Add(':Pcidregday, :Pcidmodday, :Pcodereg, ');
      Query_exec.SQL.Add(':Pwritetime, :Pwriteemp) ');
      Query_exec.ParamByName('Pcodeid').AsString     := E_codeid.Text;
      Query_exec.ParamByName('Pcodeidname').AsString := E_codeidname.Text;
      if RB_codetype1.Checked then
        Query_exec.ParamByName('Pcodetype').AsString := '1'
      else if RB_codetype2.Checked then
        Query_exec.ParamByName('Pcodetype').AsString := '2'
      else if RB_codetype3.Checked then
        Query_exec.ParamByName('Pcodetype').AsString := '3';
      Query_exec.ParamByName('Pcodelen').AsInteger   := StrToIntDef(E_codelen.Text, 0);
      Query_exec.ParamByName('Pcidregday').AsString  := ME_cidregday.Text;
      Query_exec.ParamByName('Pcidmodday').AsString  := ME_cidmodday.Text;
      Query_exec.ParamByName('Pcodereg').AsString    := E_codereg.Text;
      Query_exec.ParamByName('Pwritetime').AsString  := copy(CurDate,1,14);
      Query_exec.ParamByName('Pwriteemp').AsString   := Pempno;
      Query_exec.EXECSQL;
      Update_Query;
      P_helpinfo.Caption := '새로운 자료를 입력했습니다.';
    end
    else
    begin
      if E_codeid.Text = Query_codeCODEID.AsString then {내용만 변경}
      begin
        LastCodeid := E_codeid.Text;
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('UPDATE PYCCOID ');
        Query_exec.SQL.Add('SET CODEIDNAME = :Pcodeidname, CODETYPE = :Pcodetype, ');
        Query_exec.SQL.Add('    CODELEN = :Pcodelen,       CIDREGDAY = :Pcidregday, CIDMODDAY = :Pcidmodday, ');
        Query_exec.SQL.Add('    CODEREG = :Pcodereg,       WRITETIME = :Pwritetime, WRITEEMP = :Pwriteemp ');
        Query_exec.SQL.Add('WHERE CODEID = :Pcodeid');
        Query_exec.ParamByName('Pcodeid').AsString     := E_codeid.Text;
        Query_exec.ParamByName('Pcodeidname').AsString := E_codeidname.Text;
        if RB_codetype1.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '1'
        else if RB_codetype2.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '2'
        else if RB_codetype3.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '3';
        Query_exec.ParamByName('Pcodelen').AsInteger   := StrToIntDef(E_codelen.Text, 0);
        Query_exec.ParamByName('Pcidregday').AsString  := ME_cidregday.Text;
        Query_exec.ParamByName('Pcidmodday').AsString  := ME_cidmodday.Text;
        Query_exec.ParamByName('Pcodereg').AsString    := E_codereg.Text;
        Query_exec.ParamByName('Pwritetime').AsString  := copy(CurDate,1,14);
        Query_exec.ParamByName('Pwriteemp').AsString   := Pempno;
        Query_exec.EXECSQL;
        Update_Query;
        P_helpinfo.Caption := '기존의 자료를 수정했습니다.';
      end
      else {코드ID가 새로운 것으로 변경}
      begin
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('SELECT CODEID ');
        Query_exec.SQL.Add('FROM PYCCOID ');
        Query_exec.SQL.Add('WHERE CODEID = '''+E_codeid.Text+''' ');  {New codeid}
        Query_exec.Open;
        if Query_exec.RecordCount > 0 then
        begin
          Query_exec.Close;
          MessageBox(Handle, '변경하려는 코드ID가 이미 존재합니다.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

        LastCodeid := E_codeid.Text;
        Query_exec.Close;
        Query_exec.SQL.Clear;
        Query_exec.SQL.Add('UPDATE PYCCOID ');
        Query_exec.SQL.Add('SET CODEID = :PNEWcodeid, CODEIDNAME = :Pcodeidname, CODETYPE = :Pcodetype, ');
        Query_exec.SQL.Add('    CODELEN = :Pcodelen,  CIDREGDAY = :Pcidregday,   CIDMODDAY = :Pcidmodday, ');
        Query_exec.SQL.Add('    CODEREG = :Pcodereg,  WRITETIME = :Pwritetime,   WRITEEMP = :Pwriteemp ');
        Query_exec.SQL.Add('WHERE CODEID = :POLDcodeid');
        Query_exec.ParamByName('POLDcodeid').AsString  := Query_codeCODEID.AsString;
        Query_exec.ParamByName('PNEWcodeid').AsString  := E_codeid.Text;
        Query_exec.ParamByName('Pcodeidname').AsString := E_codeidname.Text;
        if RB_codetype1.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '1'
        else if RB_codetype2.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '2'
        else if RB_codetype3.Checked then
          Query_exec.ParamByName('Pcodetype').AsString := '3';
        Query_exec.ParamByName('Pcodelen').AsInteger   := StrToIntDef(E_codelen.Text, 0);
        Query_exec.ParamByName('Pcidregday').AsString  := ME_cidregday.Text;
        Query_exec.ParamByName('Pcidmodday').AsString  := ME_cidmodday.Text;
        Query_exec.ParamByName('Pcodereg').AsString    := E_codereg.Text;
        Query_exec.ParamByName('Pwritetime').AsString  := copy(CurDate,1,14);
        Query_exec.ParamByName('Pwriteemp').AsString   := Pempno;
        Query_exec.EXECSQL;

        if MessageDlg('코드내역 테이블도 수정할까요 ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
        begin
          Query_exec.Close;
          Query_exec.SQL.Clear;
          Query_exec.SQL.Add('UPDATE PYCCODE ');
          Query_exec.SQL.Add('SET CODEID = :PNEWcodeid ');
          Query_exec.SQL.Add('WHERE CODEID = :POLDcodeid');
          Query_exec.ParamByName('POLDcodeid').AsString  := Query_codeCODEID.AsString;
          Query_exec.ParamByName('PNEWcodeid').AsString  := E_codeid.Text;
          Query_exec.EXECSQL;
        end;
        Update_Query;
        P_helpinfo.Caption := '새로운 코드ID로 변경되었습니다.';
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

procedure TMainForm.BB_deleteClick(Sender: TObject);
var
  Save_codeid, Jump_codeid: string;
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
    Query_code.Next;
    if Query_code.eof then
    begin
      Query_code.Prior;
      Jump_codeid := Query_codeCODEID.AsString;
    end
    else
    begin
      Jump_codeid := Query_codeCODEID.AsString;
    end;

    Query_exec.Close;
    Query_exec.SQL.Clear;
    Query_exec.SQL.Add('DELETE FROM PYCCOID ');
    Query_exec.SQL.Add('WHERE CODEID = :Pcodeid ');
    Query_exec.ParamByName('Pcodeid').AsString := Save_codeid;
    Query_exec.EXECSQL;
    Query_exec.Close;

    if MessageDlg('코드내역 테이블도 삭제할까요 ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      Query_exec.SQL.Clear;
      Query_exec.SQL.Add('DELETE FROM PYCCODE ');
      Query_exec.SQL.Add('WHERE CODEID = :Pcodeid ');
      Query_exec.ParamByName('Pcodeid').AsString := Save_codeid;
      Query_exec.EXECSQL;
      Query_exec.Close;
    end;
    LastCodeid := '';
    Update_Query;
    SearchOptions := [loPartialKey];
    if Query_code.Locate('CODEID', Jump_codeid, SearchOptions) then
      DBG_user.SetFocus;

    P_helpinfo.Caption := '기존자료가 삭제되었습니다.';
  except
    on E: Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        BB_cancelClick(Sender);
      end;
  end;
  Query_exec.Close;
end;

procedure TMainForm.BB_CodeClick(Sender: TObject);
begin
  if OPstate <> 2 then {열람상태가 아니면}
  begin
    P_helpinfo.Caption := '먼저 코드ID를 선택하세요.';
    System.Exit;
  end;
  CodeForm.E_codeid.Text        := Query_codeCODEID.AsString; {작업코드ID}
  CodeForm.L_codeidname.Caption := Query_codeCODEIDNAME.AsString;

  CodeForm.E_codeidFROM.Text := Query_codeCODEID.AsString;
  CodeForm.E_codeidTO.Text   := Query_codeCODEID.AsString;
  CodeForm.ShowModal;
end;

procedure TMainForm.BB_prnsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TMainForm.BB_printClick(Sender: TObject);
begin
  if (E_codeidFROM.Text = '') or (E_codeidTO.Text = '') then
  begin
    P_helpinfo.Caption := '먼저 인쇄코드ID범위를 입력하세요.';
    System.Exit;
  end;
  P_helpinfo.Caption := '인쇄중입니다.';

  Application.ProcessMessages;

  PrintCodeID.QL_codeidRANGE.Caption := '◑ 코드ID 범위: '+E_codeidFROM.Text+' ~ '+E_codeidTO.Text;

  PrintCodeID.QuickRep1.Preview;
 // CodeidPrint.Query_print.Close;
 // CodeidPrint.QRL_codeidRANGE.Caption := E_codeidFROM.Text+' ~ '+E_codeidTO.Text;
 // CodeidPrint.QRLsysdate.Caption      := L_CurDate.Caption;
 // CodeidPrint.Query_print.ParamByName('P_codeidFROM').AsString := E_codeidFROM.Text;
 // CodeidPrint.Query_print.ParamByName('P_codeidTO').AsString   := E_codeidTO.Text;
 // CodeidPrint.QReport.Print;
 // CodeidPrint.Query_print.Close;
//  P_helpinfo.Caption := '인쇄가 완료되었습니다.';
end;

procedure TMainForm.SB_cidregdayClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_cidregday.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;
procedure TMainForm.SB_cidmoddayClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_cidmodday.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;
//
procedure TMainForm.BtextClick(Sender: TObject);
var
  str : string;
begin
 HomeDir := HomeDirOpen;
 codeToText(HomeDir+'\insacode.cod','',0);
 with Query_exec do begin
    close; sql.clear;
    sql.add('select codeid,codeno,codename from pyccode ');
    sql.add('order by codeid,codeno ');
    open;
    while not eof do begin
      str := '';
      str := FieldByName('codeid').AsString+','+
             FieldByName('codeno').AsString+','+
             FieldByName('codename').AsString;
      codeToText('',str,1);
      next;
    end;
   Query_exec.close;
 end;
 codeToText('','',2);
 MessageBox(0,pChar(HomeDir+'\insacode.cod에 코드를 다운받았습니다.'+#13+#10+#13+#10+
                    '호스트 /dper/person/usrbin 에 복사하십시오.'),'알 림',
            MB_OK or $0030);
end;

procedure TMainForm.DBG_userDblClick(Sender: TObject);
begin
  BB_CodeClick(Nil);
end;

end.
