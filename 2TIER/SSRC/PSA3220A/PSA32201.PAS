{=============================== Program Header ================================
 PROGRAM-NAME   : PSA3220A(사내근로복지기금 대출 지급등록)
 SYSTEM-NAME    : 복리후생
 SUBSYSTEM-NAME : 사내근로복지기금 대출
 Programmer     : 사내근로복지기금 대출 신청
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.6.08     이희용   신규개발                    노사협력팀 요청
================================================================================}

unit Psa32201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, Db, DBTables, DBGrids,
  MemDS, DBAccess, Ora, Func, DBCtrls, OnGrDBGrid, OnScheme, ComCtrls,
  OnEditBaseCtrl, OnEditStdCtrl, OnLineLabel, OnFocusButton;

type
  TPSA3220 = class(TForm)
    Label7: TLabel;
    btnCalen: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    SpeedButton2: TSpeedButton;
    OraQuery2: TOraQuery;
    OraQuery1: TOraQuery;
    SF_Main: TOnSchemeForm;
    Panel8: TPanel;
    DbGrid1: TOnGrDbGrid;
    Shape4: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Phelpmsg: TPanel;
    Label3: TLabel;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    PpersonIn: TOnEdit;
    PpersonOut: TOnEdit;
    PLimitAmt: TOnEdit;
    PTotalAmt: TOnEdit;
    PExpandAmt: TOnEdit;
    PResAmt: TOnEdit;
    MEtoday: TOnMaskEdit;
    MEdefault: TOnMaskEdit;
    Panel7: TPanel;
    RB3: TRadioButton;
    RB2: TRadioButton;
    Panel3: TPanel;
    BBclose: TOnFocusButton;
    BBcalc: TOnFocusButton;
    OraQuery3: TOraQuery;
    OraQuery3APPFLAG: TStringField;
    OraQuery3APPDATE: TStringField;
    OraQuery3EMPNO: TStringField;
    OraQuery3KORNAME: TStringField;
    OraQuery3APPSARYU: TStringField;
    OraQuery3STDAMT: TFloatField;
    OraQuery3REPMM1: TStringField;
    OraQuery3LOANAMT: TFloatField;
    OraQuery3JANAMT: TFloatField;
    OraQuery3APPTIME: TStringField;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PSumAmt: TOnEdit;
    Lsysdate: TLabel;
    Lempno: TLabel;
    RB1: TRadioButton;
    OnEdit1: TOnEdit;
    OnEdit2: TOnEdit;
    OnEdit3: TOnEdit;
    OnEdit4: TOnEdit;
    INW1: TOnEdit;
    OnEdit6: TOnEdit;
    OnEdit7: TOnEdit;
    OnEdit8: TOnEdit;
    OnEdit9: TOnEdit;
    OnEdit10: TOnEdit;
    OnEdit11: TOnEdit;
    OnEdit12: TOnEdit;
    OnSectionLabel3: TOnSectionLabel;
    Shape2: TShape;
    INW2: TOnEdit;
    INW3: TOnEdit;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnCalenClick(Sender: TObject);
    procedure MEdefaultKeyPress(Sender: TObject; var Key: Char);
    procedure DbGrid1DblClick(Sender: TObject);
    procedure MEdefaultEnter(Sender: TObject);
    procedure DbGrid1CellClick(Column: TColumn);
    procedure RB3Click(Sender: TObject);
    procedure BBcalcClick(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    GSkorname, GSpass, GSgrade,userid, word, GSsysdate : String;
    f_APPFLAG, f_EMPNO, f_KORNAME, f_APPDATE, f_APPTIME : String;
    AmtOfCalc, AmtOfCalcOf, AmtOfRestOf : Real;
    ExpandAmt, LimitAmt, AmtOfBBrest, TempOf, f_STDAMT, SumAmt : Real;
    BeginOfDate, BoxOfResult : Integer;
    procedure CalcOfPersonAndTotal;
    procedure ShowDBGrid;
    procedure SetNow(Parameter : String);

  end;

var
  PSA3220: TPSA3220;

implementation

uses Pass, kylib1, Calen1, FormMon1, Psa32202;
{$R *.DFM}

procedure TPSA3220.FormActivate(Sender: TObject);
var i : Integer;
begin
  Phelpmsg.Caption := '  초기화 설정중입니다 잠시만 기다려 주세요.';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;

  SetNow('사용자함수');
  Application.ProcessMessages;
  MEtoday.Text     := Copy(GSsysdate, 1, 8);
  MEdefault.Text   := Copy(GSsysdate, 1, 6);
  CalcOfPersonAndTotal;
  ShowDBGrid;
  Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TPSA3220.SetNow(Parameter : String);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
       Sql.Add('   FROM DUAL                                     ');
       Open;
       GSsysdate := FieldByName('D').AsString;
  end;
end;


//당월 대출금액 및 건수 확인
procedure TPSA3220.CalcOfPersonAndTotal;
begin
  with OraQuery1 do  //당별 대출한도 금액
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT LIMITAMT, REPAYBEGIN FROM PSNLOANS        ');
    Sql.Add(' WHERE YYMM = '''+Copy(MEdefault.Text, 1, 6)+''' ');
    Open;
  end;

  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT NVL(SUM(STDAMT), 0) 신청총액, ');
    Sql.Add('       COUNT(*)          신청총건수, ');
    Sql.Add('       SUM(DECODE(APPFLAG, ''1'', STDAMT, 0)) 대출신청액,  ');
    Sql.Add('       SUM(DECODE(APPFLAG, ''1'', 1, 0))      대출신청건수,');
    Sql.Add('       SUM(DECODE(APPFLAG, ''0'', LOANAMT,0)) 대출총액,    ');
    Sql.Add('       SUM(DECODE(APPFLAG, ''0'', 1, 0))      대출건수     ');
    Sql.Add('FROM PSNLOAN ');
    Sql.Add('WHERE APPDATE LIKE '''+Copy(MEtoday.Text, 1, 6)+'%'' ');
    Open;
  end;
  BeginOfDate     := OraQuery1.Fields[1].AsInteger;                  //상환개시년월

  SumAmt          := OraQuery1.Fields[0].AsFloat;                    //당월 대출가능액
  PSumAmt.Text    := Trim(Format('%13.0n', [SumAmt]));               //당월 대출받을수있는 총액(기초자료에서 가져옴).
  LimitAmt        := OraQuery1.Fields[0].AsFloat - OraQuery2.Fields[4].AsFloat;  //대출한도액 : 대출가능액 - 대출액
  PLimitAmt.Text  := Trim(Format('%13.0n', [LimitAmt]));

  //당월 대출신청 총액
  PTotalAmt.Text  := Trim(Format('%13.0n',[OraQuery2.Fields[0].AsFloat]));
  INW1.Text       := Trim(Format('%4.0n' ,[OraQuery2.Fields[1].AsFloat]));

  //당월 대출신청
  PPersonIn.Text  := Trim(Format('%13.0n',[OraQuery2.Fields[2].AsFloat]));
  INW2.Text       := Trim(Format('%4.0n' ,[OraQuery2.Fields[3].AsFloat]));

  //당월 대출
  PPersonOut.Text := Trim(Format('%13.0n',[OraQuery2.Fields[4].AsFloat]));
  INW3.Text       := Trim(Format('%4.0n' ,[OraQuery2.Fields[5].AsFloat]));

  ExpandAmt       := OraQuery2.Fields[4].AsFloat;
  PExpandAmt.Text := Trim(Format('%13.0n',[ExpandAmt]));             //당월 대출 총액

  TempOf          := LimitAmt - ExpandAmt;                           //당월 대출잔액
  PResAmt.Text    := Trim(Format('%13.0n', [TempOf]));               //당월 대출액

  if (OraQuery2.Fields[2].AsFloat > 0) Then BBcalc.Enabled := True
  Else BBcalc.Enabled := False;
end;

procedure TPSA3220.ShowDBGrid;
begin
  with OraQuery3 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT DECODE(APPFLAG, ''0'', ''대출'', ');
    Sql.Add('                       ''1'', ''신청'', ');
    Sql.Add('                       ''2'', ''대기'', ');
    Sql.Add('                       ''3'', ''기각'', '''') APPFLAG, ');
    Sql.Add('       APPDATE, EMPNO, ');
    Sql.Add('(SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.EMPNO) KORNAME,  ');
    Sql.Add('       DECODE(APPSARYU, ''1'', ''경조사'', ');
    Sql.Add('                        ''2'', ''의료비'', ');
    Sql.Add('                        ''3'', ''정착지원금'', '''') APPSARYU,');
    Sql.Add('       STDAMT, REPMM1||''개월'' REPMM1, LOANAMT, JANAMT, APPTIME ');
    Sql.Add('FROM PSNLOAN A');
    Sql.Add('WHERE APPDATE LIKE '''+Copy(MEtoday.Text, 1, 6)+'%'' ');

    if      RB1.Checked then Sql.Add(' ORDER BY APPFLAG DESC ')
    else if RB2.Checked then Sql.Add(' ORDER BY APPDATE, APPTIME ')
    else if RB3.Checked then Sql.Add(' ORDER BY EMPNO,   APPDATE ');
    Open;

    FieldByName('APPDATE').EditMask := '!9999-99-99;0;_';
    TFloatField(FieldByName('STDAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('LOANAMT')).DisplayFormat:= '#,##0';
    TFloatField(FieldByName('JANAMT')).DisplayFormat := '#,##0';
  end;
  DbGrid1.Fields[0].Alignment := taCenter;
  DbGrid1.Fields[1].Alignment := taCenter;
  DbGrid1.Fields[2].Alignment := taCenter;
  DbGrid1.Fields[3].Alignment := taCenter;
  DbGrid1.Fields[4].Alignment := taCenter;
  DbGrid1.Fields[5].Alignment := taRightJustify;
  DbGrid1.Fields[6].Alignment := taCenter;
  DbGrid1.Fields[7].Alignment := taRightJustify;
  DbGrid1.Fields[8].Alignment := taRightJustify;
end;

procedure TPSA3220.MEdefaultKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if DateCheck(Copy(MEdefault.Text,1,4),Copy(MEdefault.Text,5,2),'01')= -1 then
    begin
      MessageBox(Handle,'기준년월 확인바랍니다', '일자오류', mb_iconwarning);
      SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
      Exit;
    end;

    if DateCheck(Copy(MEtoday.Text,1,4),Copy(MEtoday.Text,5,2),Copy(MEtoday.Text,7,2))= -1 then
    begin
      MessageBox(Handle,'대출일자 확인바랍니다', '일자오류', mb_iconwarning);
      SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
      Exit;
    end;

    if MEdefault.Text <> Copy(MEtoday.Text, 1, 6) then
    begin
      MessageBox(Self.Handle, '기준년월과 대출일의 년월은 같아야 합니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;
    CalcOfPersonAndTotal;
    ShowDBGrid;
    Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
    SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end;
end;

procedure TPSA3220.DbGrid1DblClick(Sender: TObject);
begin
  with OraQuery1 do  //상환진행중(대출금 <> 대출잔액)인 자료는 변경 불가.
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT EMPNO FROM PSNLOAN     ');
    Sql.Add('WHERE EMPNO   = '''+f_EMPNO+'''  ');
    Sql.Add('  AND APPDATE = '''+f_APPDATE+'''');
    Sql.Add('  AND APPTIME = '''+f_APPTIME+'''');
    Sql.Add('  AND LOANAMT <> JANAMT          ');
    Sql.Add('  AND APPFLAG = ''0''            ');
    Open;
  end;

  if OraQuery1.RecordCount > 0 then
  begin
    MessageBox(Handle,'대출상환중인 자료는 수정할 수 없습니다.', '자료확인', mb_iconwarning);
    SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
    Exit;
  end;

  PSA3221.ShowModal;

  if (BoxOfResult = 1) or (BoxOfResult = 2) then
  begin
    if (BoxOfResult = 1) Then //BoxOfResult = 1   신청금액
    Begin
      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE PSNLOAN ');
        Sql.Add('  SET APPFLAG   = ''0'', ');
        Sql.Add('      LOANDATE  = '''+MEtoday.Text+''', ');
        Sql.Add('      LOANAMT   = STDAMT,');
        Sql.Add('      JANAMT    = STDAMT,');
        Sql.Add('      ENDYN     = ''N'', ');
        Sql.Add('      YYMM      = '''+Copy(MEtoday.Text, 1, 6)+''' , ');
        Sql.Add('      REPMAXMM  = REPMM1,');
        Sql.Add('      REPFRDATE = TO_CHAR(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), ''YYYYMM''), ');
        Sql.Add('      REPTODATE = TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), TO_NUMBER(REPMM1)-1), ''YYYYMM''), ');
        Sql.Add('      WRITETIME = '''+Copy(GSsysdate, 1, 15)+''', ');
        Sql.Add('      WRITEMAN  = '''+Pempno+''' ');
        Sql.Add('WHERE EMPNO   = :P2  ');
        Sql.Add(' AND  APPDATE = :P3  ');
        Sql.Add(' AND  APPTIME = :P4  ');

        ParamByName('P1').AsInteger:= BeginOfDate;
        ParamByName('P2').AsString := f_EMPNO;
        ParamByName('P3').AsString := f_APPDATE;
        ParamByName('P4').AsString := f_APPTIME;
        ExecSql;
      End;
    End Else                  //BoxOfResult = 2  최대금액(5,000,000)
    Begin
      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE PSNLOAN ');
        Sql.Add('  SET APPFLAG   = ''0'', ');
        Sql.Add('      LOANDATE  = '''+MEtoday.Text+''', ');
        Sql.Add('      LOANAMT   = MAXAMT,');
        Sql.Add('      JANAMT    = MAXAMT,');
        Sql.Add('      ENDYN     = ''N'', ');
        Sql.Add('      YYMM      = '''+Copy(MEtoday.Text, 1, 6)+''' , ');
        Sql.Add('      REPMAXMM  = REPMM1,');
        Sql.Add('      REPFRDATE = TO_CHAR(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), ''YYYYMM''), ');
        Sql.Add('      REPTODATE = TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), TO_NUMBER(REPMM1)-1), ''YYYYMM''), ');
        Sql.Add('      WRITETIME = '''+Copy(GSsysdate, 1, 15)+''', ');
        Sql.Add('      WRITEMAN  = '''+Pempno+''' ');
        Sql.Add('WHERE EMPNO   = :P2  ');
        Sql.Add(' AND  APPDATE = :P3  ');
        Sql.Add(' AND  APPTIME = :P4  ');

        ParamByName('P1').AsInteger:= BeginOfDate;
        ParamByName('P2').AsString := f_EMPNO;
        ParamByName('P3').AsString := f_APPDATE;
        ParamByName('P4').AsString := f_APPTIME;
        ExecSql;
      End;
    End;
  End Else
  Begin
    if (BoxOfResult = 3) Then //BoxOfResult = 3  기각
    Begin
      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE PSNLOAN ');
        Sql.Add('  SET APPFLAG   = ''3'', ');
        Sql.Add('      LOANDATE  = '''' , ');
        Sql.Add('      LOANAMT   = 0    , ');
        Sql.Add('      JANAMT    = 0    , ');
        Sql.Add('      ENDYN     = ''N'', ');
        Sql.Add('      YYMM      = '''' , ');
        Sql.Add('      REPMAXMM  = 0    , ');
        Sql.Add('      REPFRDATE = '''' , ');
        Sql.Add('      REPTODATE = '''' , ');
        Sql.Add('      WRITETIME = '''+Copy(GSsysdate, 1, 15)+''', ');
        Sql.Add('      WRITEMAN  = '''+Pempno+''' ');
        Sql.Add('WHERE EMPNO   = :P1  ');
        Sql.Add('  AND APPDATE = :P2  ');
        Sql.Add('  AND APPTIME = :P3  ');
        ParamByName('P1').AsString := f_EMPNO;
        ParamByName('P2').AsString := f_APPDATE;
        ParamByName('P3').AsString := f_APPTIME;
        ExecSql;
      End;
    End Else                  //BoxOfResult = 4  대출취소
    Begin
      with OraQuery1 do
      begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE PSNLOAN ');
        Sql.Add('  SET APPFLAG   = ''1'', ');
        Sql.Add('      LOANDATE  = '''' , ');
        Sql.Add('      LOANAMT   = 0    , ');
        Sql.Add('      JANAMT    = 0    , ');
        Sql.Add('      ENDYN     = ''N'', ');
        Sql.Add('      YYMM      = '''' , ');
        Sql.Add('      REPMAXMM  = 0    , ');
        Sql.Add('      REPFRDATE = '''' , ');
        Sql.Add('      REPTODATE = '''' , ');
        Sql.Add('      WRITETIME = '''+Copy(GSsysdate, 1, 15)+''', ');
        Sql.Add('      WRITEMAN  = '''+Pempno+''' ');
        Sql.Add('WHERE EMPNO   = :P1    ');
        Sql.Add('  AND APPDATE = :P2    ');
        Sql.Add('  AND APPTIME = :P3    ');
        Sql.Add('  AND LOANAMT = JANAMT ');
        Sql.Add('  AND APPFLAG = ''0''  ');

        ParamByName('P1').AsString := f_EMPNO;
        ParamByName('P2').AsString := f_APPDATE;
        ParamByName('P3').AsString := f_APPTIME;
        ExecSql;
      End;
    End;
  End;

  CalcOfPersonAndTotal;
  ShowDBGrid;
  Phelpmsg.Caption := '  개별심사 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TPSA3220.MEdefaultEnter(Sender: TObject);
begin
  Phelpmsg.Caption := '  입력후 반드시 ENTER KEY를 눌러야 반영됩니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TPSA3220.DbGrid1CellClick(Column: TColumn);
begin
  f_EMPNO   := '';
  f_KORNAME := '';
  f_APPDATE := '';
  f_APPTIME := '';

  f_APPFLAG := OraQuery3.Fields[0].AsString;
  f_EMPNO   := OraQuery3.Fields[2].AsString;
  f_KORNAME := OraQuery3.Fields[3].AsString;
  f_APPDATE := OraQuery3.Fields[1].AsString;
  f_APPTIME := OraQuery3.Fields[9].AsString;
  f_STDAMT  := OraQuery3.Fields[5].AsFloat;
end;

procedure TPSA3220.BBcalcClick(Sender: TObject);
begin
  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT SUM(DECODE(APPFLAG, ''1'', STDAMT, 0)) 신청액,  ');
    Sql.Add('       SUM(DECODE(APPFLAG, ''0'', LOANAMT,0)) 대출총액 ');
    Sql.Add('FROM PSNLOAN ');
    Sql.Add('WHERE APPDATE LIKE '''+Copy(MEtoday.Text, 1, 6)+'%'' ');
    Open;
  end;

  If (SumAmt < (OraQuery2.Fields[0].AsFloat + OraQuery2.Fields[1].AsFloat)) Then
  begin
    MessageBox(Handle,'당월 총대출 가능액을 초과하였습니다.', '대출금액 확인', mb_iconwarning);
    Exit;
  end;

  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('UPDATE PSNLOAN ');
    Sql.Add('  SET APPFLAG   = ''0'', ');
    Sql.Add('      LOANDATE  = '''+MEtoday.Text+''', ');
    Sql.Add('      LOANAMT   = STDAMT,');
    Sql.Add('      JANAMT    = STDAMT,');
    Sql.Add('      ENDYN     = ''N'', ');
    Sql.Add('      YYMM      = '''+Copy(MEtoday.Text, 1, 6)+''' , ');
    Sql.Add('      REPMAXMM  = REPMM1,');
    Sql.Add('      REPFRDATE = TO_CHAR(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), ''YYYYMM''), ');
    Sql.Add('      REPTODATE = TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE('''+MEtoday.Text+''', ''YYYYMMDD''), :P1), TO_NUMBER(REPMM1)-1), ''YYYYMM''), ');
    Sql.Add('      WRITETIME = '''+Copy(GSsysdate, 1, 15)+''', ');
    Sql.Add('      WRITEMAN  = '''+Pempno+''' ');
    Sql.Add('WHERE APPDATE LIKE '''+Copy(MEtoday.Text, 1, 6)+'%'' ');
    Sql.Add('  AND APPFLAG   = ''1''  ');
    ParamByName('P1').AsInteger := BeginOfDate;
    ExecSql;
  End;

  MessageDlg('지급등록을 일괄완료 하였습니다.', mtInformation,[mbOK],0);
  Phelpmsg.Caption := '  지급등록을 완료 하였습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  CalcOfPersonAndTotal;
  ShowDBGrid;
end;

procedure TPSA3220.RB3Click(Sender: TObject);
begin
  ShowDBGrid;
end;

procedure TPSA3220.SpeedButton1Click(Sender: TObject);
var tmp_key : char;
begin
  tmp_key := #13;

  Try
    MonthForm := TMonthForm.Create(Self);
    MonthForm.ShowModal;
    if MonthForm.DayCaption <> '' then
      MEdefault.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
    MonthForm.Free;
  End;
  MEdefaultKeyPress(Sender, tmp_key);
end;

procedure TPSA3220.btnCalenClick(Sender: TObject);
var tmp_key : char;
begin
  tmp_key := #13;

  Calendar := TCalendar.Create(Self);
  try
    Calendar.Showmodal;
    if Calendar.DayCaption <> '' then
    begin
      MEtoday.Text := Calendar.DayCaption;
      MEtoday.SetFocus;
    end;
    finally
      Calendar.Free;
  end;

  MEdefaultKeyPress(Sender, tmp_key);
end;

procedure TPSA3220.BBcloseClick(Sender: TObject);
begin
  Close;
end;

end.

