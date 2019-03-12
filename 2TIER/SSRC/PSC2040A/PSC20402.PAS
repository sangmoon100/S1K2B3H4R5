unit psc20402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBClient, numedit, Mask,
  xinsadll, Kylib1, DBTables, Calen1;

type
  TDetailForm = class(TForm)
    Panel1: TPanel;
    Panel19: TPanel;
    BB_Save: TBitBtn;
    BB_cancel: TBitBtn;
    BB_exit: TBitBtn;
    BB_Insert: TBitBtn;
    BB_delete: TBitBtn;
    Phelpmsg: TPanel;
    DBGrid1: TDBGrid;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    DS_pswddis: TDataSource;
    RB_wdispt_1: TRadioButton;
    RB_wdispt_2: TRadioButton;
    RB_wdispt_3: TRadioButton;
    Panel2: TPanel;
    NE_sseqno: TNumberEdit;
    ME_sdate: TMaskEdit;
    SB_sdate: TSpeedButton;
    NE_samt: TNumberEdit;
    Label20: TLabel;
    L_bspassyn: TLabel;
    M_intrtp: TMemo;
    Panel3: TPanel;
    Query_pswddis: TQuery;
    Query_pswddisWDISPT: TStringField;
    Query_pswddiswdisptNAME: TStringField;
    Query_Gen: TQuery;
    Query_pswddisSSEQNO: TFloatField;
    Query_pswddisSDATE: TStringField;
    Query_pswddisSAMT: TFloatField;
    Query_pswddisBSPASSYN: TStringField;
    Query_pswddisREQYN: TStringField;
    Query_pswddisEMPNO: TStringField;
    Query_pswddisSUBDATE: TStringField;
    Query_pswddisINTRPT: TMemoField;
    procedure FormActivate(Sender: TObject);
    procedure CDSCalcFields(DataSet: TDataSet);
    procedure DS_pswddisDataChange(Sender: TObject; Field: TField);
    procedure SB_sdateClick(Sender: TObject);
    procedure BB_InsertClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ME_sdateChange(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure ME_sdateExit(Sender: TObject);
    procedure RB_wdispt_1Click(Sender: TObject);
  private
    { Private declarations }
    sqlstr : widestring;
    msg    : string;
  public
    { Public declarations }
    procedure RetrieveData;
    procedure DataAllClear;
  end;

var
  DetailForm: TDetailForm;
  Save_SUBDATE, Save_WDISPT: String;
  Save_SSEQNO: Real;
  Job_mode: Integer;  {0.열람/무효, 1.입력, 2.수정}

implementation
{$R *.DFM}
uses
  psc20401;

{------------------------------- Event ----------------------------------}
procedure TDetailForm.FormActivate(Sender: TObject);
begin
  DataAllClear;
  Phelpmsg.Caption := '  세부사유 등록사항을 읽고있습니다.';
  Application.ProcessMessages;

  Save_SUBDATE := '';
  Save_WDISPT  := '';
  Save_SSEQNO  := 0;

  RetrieveData;
  Phelpmsg.Caption := '  작업하세요.';
end;

procedure TDetailForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Query_pswddis.Close;
  CanClose := True;
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TDetailForm.RetrieveData;
begin
  Job_mode := 0;

  DataAllClear;
  Query_pswddis.Close;
  Query_pswddis.SQL.Clear;
  Query_pswddis.SQL.Add('SELECT a.*, intrpt FROM PSWDDIS a, pswdibas b ');
  Query_pswddis.SQL.Add('WHERE  (EMPNO = :P_empno) and  ');
  Query_pswddis.SQL.Add('       (SUBDATE = :P_subdate)  ');
  Query_pswddis.SQL.Add('and    a.wdissue = b.wdissue(+)  ');
  Query_pswddis.ParamByName('P_empno').AsString   := MainForm.E_empno.Text;
  Query_pswddis.ParamByName('P_subdate').AsString := MainForm.ME_subdate.Text;
  Query_pswddis.Open;
  if Query_pswddis.RecordCount > 0 then
     begin
     if Query_pswddis.Locate('SUBDATE;WDISPT;SSEQNO',VarArrayOf([Save_SUBDATE, Save_WDISPT, Save_SSEQNO]),
                              [loPartialKey]) then
        DBGrid1.SetFocus;
     end;
end;

procedure TDetailForm.DataAllClear;
begin
  RB_wdispt_1.Checked := True;
  NE_sseqno.Value     := 1;
  ME_sdate.Text       := '';
  NE_samt.Value       := 0;
  L_bspassyn.Caption  := 'N';  // 기준통과여부
  M_intrtp.Lines.Clear;
end;

procedure TDetailForm.CDSCalcFields(DataSet: TDataSet);
begin
  if Query_pswddisWDISPT.AsString = '1' then
    Query_pswddiswdisptNAME.AsString := '계약금'
  else if Query_pswddisWDISPT.AsString = '2' then
    Query_pswddiswdisptNAME.AsString := '중도금'
  else if Query_pswddisWDISPT.AsString = '3' then
    Query_pswddiswdisptNAME.AsString := '잔금'
  else
    Query_pswddiswdisptNAME.AsString := '';
end;

procedure TDetailForm.DS_pswddisDataChange(Sender: TObject; Field: TField);
begin
  if Query_pswddis.RecordCount = 0 then // 한건도 없음
  begin
    Job_mode := 0;
    System.Exit;
  end;
  Job_mode := 2; {수정}

  if Query_pswddisWDISPT.AsString = '1' then
    RB_wdispt_1.Checked := True
  else if Query_pswddisWDISPT.AsString = '2' then
    RB_wdispt_2.Checked := True
  else if Query_pswddisWDISPT.AsString = '3' then
    RB_wdispt_3.Checked := True
  else
    RB_wdispt_1.Checked := True;

  NE_sseqno.Value    := Query_pswddisSSEQNO.AsFloat;
  ME_sdate.Text      := Query_pswddisSDATE.AsString;
  NE_samt.Value      := Query_pswddisSAMT.AsFloat;
  L_bspassyn.Caption := Query_pswddisBSPASSYN.AsString;  // 기준통과여부
  M_intrtp.Lines.Assign(Query_pswddis.FieldByName('INTRPT'));  // 제출서류

  {
  sqlstr := 'select intrpt from pswdibas ' +
     format('where  wdissue = ''%s''',[MainForm.E_wdissue.text]);

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add(sqlstr);
  Query_Gen.Open;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT INTRPT  FROM PSWDIBAS ');
  Query_Gen.SQL.Add('WHERE (WDISSUE = '''+MainForm.E_wdissue.text+''')     ');

  if Query_pswddisWDISPT.AsString = '1' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'1'+''') ')
  else if Query_pswddisWDISPT.AsString = '2' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'2'+''') ')
  else if Query_pswddisWDISPT.AsString = '3' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'3'+''') ')
  else
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+''')     ');
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
    M_intrtp.Lines.Assign(Query_Gen.FieldByName('INTRPT'))  // 제출서류
  else
    M_intrtp.Lines.Clear;
  Query_Gen.Close;
  }
end;

procedure TDetailForm.SB_sdateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_sdate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TDetailForm.ME_sdateChange(Sender: TObject);
begin
  if Length(ME_sdate.Text) = 8 then
  begin
    if DateCheck(Copy(ME_sdate.Text,1,4),Copy(ME_sdate.Text,5,2),
                 Copy(ME_sdate.Text,7,2)) = -1 then
      MessageBox(Handle, '납입일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
  end;
end;

procedure TDetailForm.ME_sdateExit(Sender: TObject);
var
  FromDate, ToDate: String;
begin
  if (Length(ME_sdate.Text) <> 8) or
     (Length(MainForm.ME_subdate.Text) <> 8)  // 메인.신청일자
  then
    System.Exit;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT PLMONTH, FLMONTH                          ');
  Query_Gen.SQL.Add('FROM PSWDIBAS                                    ');
  Query_Gen.SQL.Add('WHERE (WDISSUE = '''+MainForm.E_wdissue.Text+''')');
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
  begin
    FromDate := CalcMonth(Copy(MainForm.ME_subdate.Text,1,6),
                          (-1 * Query_Gen.FieldByName('PLMONTH').AsInteger))+
                Copy(MainForm.ME_subdate.Text,7,2);
    ToDate   := CalcMonth(Copy(MainForm.ME_subdate.Text,1,6),
                          Query_Gen.FieldByName('FLMONTH').AsInteger)+
                Copy(MainForm.ME_subdate.Text,7,2);
    // 인출사유발생일이 이전,이후 한도를 벗어나면
    if (ME_sdate.Text < FromDate) or (ME_sdate.Text > ToDate) then
    begin
      MessageBox(Handle, '신청일을 기준으로 납입일자가 인출한도개원수를 초과했습니다.', '입력오류', MB_ICONWARNING);
      Query_Gen.Close;
      L_bspassyn.Caption := 'N';  // 기준통과여부
      System.Exit;
    end;
    L_bspassyn.Caption := 'Y';  // 기준통과여부
  end;
  Query_Gen.Close;
end;

{------------------------------- Button Click ----------------------------------}
procedure TDetailForm.BB_InsertClick(Sender: TObject);
var
   Found : Boolean;
begin
  sqlstr :=   'select   wdissue, replace(codename,'' '','''') codename' + #13 +
              'from   pswddis a, pyccode b' + #13 +
       format('where  empno = ''%s''',[MainForm.E_empno.Text]) + #13 +
       format('and    subdate = ''%s''',[MainForm.ME_subdate.Text]) + #13 +
              'and    (codeid(+) = ''S210'' and wdissue = codeno(+))' + #13 +
              'group by wdissue, codename';

  Query_Gen.Close;
  Query_Gen.sql.clear;
  Query_Gen.sql.add(sqlstr);
  Query_Gen.open;

  Found := False;
  while not Query_Gen.eof do
     begin
     if system.pos('계약',Query_Gen.FieldByName('codename').AsString) <> 0 then
        begin
        Found := True;
        system.Break;
        end;
     Query_Gen.Next;
     end;

  if Found then
     begin
     msg := '주택관련 계약금지급을 목적으로 인출사유가 발생한 경우는' + #13 + #13 +
            '세부사유를 2건 이상 등록하실 수 없습니다.';

     MessageBox(Handle,pchar(msg), '작업안내', MB_ICONWARNING);
     system.exit;
     end;

  Job_mode := 1; {추가}
  DataAllClear;
  {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.3.2       김승회     계산로직변경        업무로직변경
      => 세부사유에 따른 신청구분 Default Setting
     =============================================================================== /}
  if system.pos('계약금',trim(MainForm.P_wdissueNAME.caption)) <> 0 then
     RB_wdispt_1.Checked := True
  else if system.pos('중도금',trim(MainForm.P_wdissueNAME.caption)) <> 0 then
     RB_wdispt_2.Checked := True
  else if system.pos('잔액금',trim(MainForm.P_wdissueNAME.caption)) <> 0 then
     RB_wdispt_3.Checked := True
  else
     RB_wdispt_1.Checked := True;
  ME_sdate.Text := MainForm.ME_wdidate.Text;
  Phelpmsg.Caption := '';
  NE_samt.value := MainForm.NE_subamt.value;
  NE_sseqno.SetFocus;
end;

procedure TDetailForm.BB_deleteClick(Sender: TObject);
begin
  if Query_pswddis.RecordCount = 0 then
  begin
    DataAllClear;
    MessageBox(handle, '등록된 자료가 없으므로 삭제할 수 없습니다',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_pswddisREQYN.AsString <> '' then  // 접수확인이 is not null이면 삭제금지
  begin
    MessageBox(Handle, '접수확인된 자료는 삭제할 수 없습니다.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  if Application.MessageBox('선택한 자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK
  then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('DELETE FROM PSWDDIS                                             ');
    Query_Gen.SQL.Add('WHERE (EMPNO      = '''+Query_pswddisEMPNO.AsString+''')        ');
    Query_Gen.SQL.Add('and   (SUBDATE    = '''+Query_pswddisSUBDATE.AsString+''')      ');
    Query_Gen.SQL.Add('and   (SSEQNO     = '+FloatToStr(Query_pswddisSSEQNO.AsFloat)+')');
    Query_Gen.SQL.Add('and   (WDISPT     = '''+Query_pswddisWDISPT.AsString+''')       ');
    Query_Gen.ExecSQL;

    RetrieveData;
    Phelpmsg.Caption := '  선택한 자료를 삭제하였습니다.';
  end;
end;

procedure TDetailForm.BB_cancelClick(Sender: TObject);
begin
  Job_mode := 0;
  DataAllClear;
  if Query_pswddis.Locate('SUBDATE;WDISPT;SSEQNO',
                        VarArrayOf([Save_SUBDATE, Save_WDISPT, Save_SSEQNO]),
                        [loPartialKey])
  then
    DBGrid1.SetFocus;
  Phelpmsg.Caption := '  작업이 취소되었습니다.';
end;

procedure TDetailForm.BB_SaveClick(Sender: TObject);
begin
  Phelpmsg.Caption := '';
  if Job_mode = 0 then
  begin
    DataAllClear;
    MessageBox(handle, '작업한 내용이 없습니다.  저장할 수 없습니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end
  else if Job_mode = 1 then  // 추가
  begin
    if NE_sseqno.Value <= 0 then
    begin
      MessageBox(Handle, '납입회차를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if Length(ME_sdate.Text) <> 8 then
    begin
      MessageBox(Handle, '납입일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

    if NE_samt.Value <= 0 then
    begin
      MessageBox(Handle, '납입금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

    if MainForm.NE_subamt.value > NE_samt.Value then
    begin
      MessageBox(Handle, '납입금액이 신청금액보다 작습니다.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('INSERT INTO PSWDDIS                                                 ');
    Query_Gen.SQL.Add('(EMPNO, KORNAME, DEPOSITNO,SUBDATE, SSEQNO, WDISSUE,                ');
    Query_Gen.SQL.Add(' WDISPT, SDATE, SAMT,BSPASSYN, SAVEYN,WRITETIME, WRITEMAN)          ');
    Query_Gen.SQL.Add('VALUES                                                              ');
    Query_Gen.SQL.Add('('''+MainForm.E_empno.Text+''', '''+MainForm.P_korname.Caption+''', ');
    Query_Gen.SQL.Add(' '''+MainForm.P_depositno.Caption+''',                              ');
    Query_Gen.SQL.Add(' '''+MainForm.ME_subdate.Text+''', '+FloatToStr(NE_sseqno.Value)+', ');
    Query_Gen.SQL.Add(' '''+MainForm.E_wdissue.Text+''',                                   ');

    if RB_wdispt_1.Checked = True then Query_Gen.SQL.Add(' ''1'',                          ')
    else if RB_wdispt_2.Checked = True then Query_Gen.SQL.Add(' ''2'',                     ')
    else if RB_wdispt_3.Checked = True then Query_Gen.SQL.Add(' ''3'',                     ')
    else Query_Gen.SQL.Add(' '''',                                                         ');

    Query_Gen.SQL.Add(' '''+ME_sdate.Text+''', '+FloatToStr(NE_samt.Value)+',              ');
    Query_Gen.SQL.Add(' '''+L_bspassyn.Caption+''', ''N'',                                 ');
    Query_Gen.SQL.Add(' '''+Copy(MainForm.CurDate,1,14)+''', '''+MainForm.Pempno+''')      ');
    Query_Gen.ExecSQL;

    Phelpmsg.Caption := '  신규 자료가 등록되었습니다.';
  end
  else  // Job_mode = 2, 저장
  begin
    if Query_pswddis.RecordCount = 0 then
    begin
      DataAllClear;
      MessageBox(handle, '등록된 자료가 없으므로 저장할 수 없습니다',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

    if NE_sseqno.Value <= 0 then
    begin
      MessageBox(Handle, '납입회차를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if Length(ME_sdate.Text) <> 8 then
    begin
      MessageBox(Handle, '납입일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if NE_samt.Value <= 0 then
    begin
      MessageBox(Handle, '납입금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if Query_pswddisREQYN.AsString <> '' then  // 접수확인이 is not null이면 저장금지
    begin
      MessageBox(Handle, '접수확인된 자료는 저장할 수 없습니다.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('UPDATE PSWDDIS                                                 ');
    Query_Gen.SQL.Add('SET SDATE     = '''+ME_sdate.Text+''',                         ');
    Query_Gen.SQL.Add('    SAMT      = '''+FloatToStr(NE_samt.Value)+''',             ');
    Query_Gen.SQL.Add('    WRITETIME = '''+Copy(MainForm.CurDate,1,14)+''',           ');
    Query_Gen.SQL.Add('    WRITEMAN  = '''+MainForm.Pempno+'''                        ');
    Query_Gen.SQL.Add('WHERE (EMPNO      = '''+Query_pswddisEMPNO.AsString+''')       ');
    Query_Gen.SQL.Add('and   (SUBDATE    = '''+Query_pswddisSUBDATE.AsString+''')     ');
    Query_Gen.SQL.Add('and   (SSEQNO     = '+FloatToStr(Query_pswddisSSEQNO.AsFloat)+'');
    Query_Gen.SQL.Add('and   (WDISPT     = '''+Query_pswddisWDISPT.AsString+'''       ');
    Query_Gen.ExecSQL;
    Phelpmsg.Caption := '  기존 자료를 수정하였습니다.';
  end;

  Save_SUBDATE := MainForm.ME_subdate.Text;
  if RB_wdispt_1.Checked = True then
    Save_WDISPT  := '1'
  else if RB_wdispt_2.Checked = True then
    Save_WDISPT  := '2'
  else if RB_wdispt_3.Checked = True then
    Save_WDISPT  := '3'
  else
    Save_WDISPT  := '4';
  Save_SSEQNO  := NE_sseqno.Value;
  RetrieveData;
end;

procedure TDetailForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TDetailForm.RB_wdispt_1Click(Sender: TObject);
begin
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT INTRPT FROM PSWDIBAS                                       ');
  if Query_pswddisWDISPT.AsString = '1' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'1'+''') ')
  else if Query_pswddisWDISPT.AsString = '2' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'2'+''') ')
  else if Query_pswddisWDISPT.AsString = '3' then
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'3'+''') ')
  else
    Query_Gen.SQL.Add('WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+''')     ');
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
    M_intrtp.Lines.Assign(Query_Gen.FieldByName('INTRPT'))  // 제출서류
  else
    M_intrtp.Lines.Clear;
  Query_Gen.Close;
end;

end.
