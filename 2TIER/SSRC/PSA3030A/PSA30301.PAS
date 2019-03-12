{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출금 지급등록
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
   1.03  98.05.04     성용권        전산처리요청서             대출순위 및 대출예정월 조회
-------------------------------------------------------------------------------}
unit Psa30301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, Db, DBTables, DBGrids,
  MemDS, DBAccess, Ora, Func;

type
  TFpsa30301 = class(TForm)
    Panel19: TPanel;
    Shape7: TShape;
    Phelpmsg: TPanel;
    Panel8: TPanel;
    Lempno: TLabel;
    Panel9: TPanel;
    BBsave: TBitBtn;
    BBabort: TBitBtn;
    BBclose: TBitBtn;
    Lsysdate: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnCalen: TSpeedButton;
    Panel7: TPanel;
    RBempno: TRadioButton;
    RBappdate: TRadioButton;
    Panel4: TPanel;
    Panel3: TPanel;
    MEtoday: TMaskEdit;
    Panel6: TPanel;
    BBkill: TBitBtn;
    BBrest: TBitBtn;
    BBcalc: TBitBtn;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel2: TPanel;
    PpersonIn: TPanel;
    PpersonOut: TPanel;
    PLimitAmt: TPanel;
    PTotalAmt: TPanel;
    PExpandAmt: TPanel;
    PResAmt: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    SpeedButton1: TSpeedButton;
    BBcancel: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    MEdefault: TMaskEdit;
    BBDeleteDrop: TBitBtn;
    OraQuery4: TOraQuery;
    OraQuery4F_APPFLAG: TStringField;
    OraQuery4F_EMPNO: TStringField;
    OraQuery4F_KORNAME: TStringField;
    OraQuery4F_APPDATE: TStringField;
    OraQuery4F_STDAMT: TFloatField;
    OraQuery4F_REPMM1: TStringField;
    OraQuery4F_MAXAMT: TFloatField;
    OraQuery4F_REPMM2: TStringField;
    OraQuery4F_APPTIME: TStringField;
    OraQuery4F_LASTAMT: TFloatField;
    OraQuery4F_RESTAMT: TFloatField;
    OraQuery4F_STATE: TStringField;
    OraQuery4F_LASTDATE: TStringField;
    OraQuery4F_LASTAMTOFTEMP: TFloatField;
    OraQuery3: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery1: TOraQuery;
    OraQuery3F_STATE: TStringField;
    OraQuery3F_APPFLAG: TStringField;
    OraQuery3F_EMPNO: TStringField;
    OraQuery3F_KORNAME: TStringField;
    OraQuery3F_APPDATE: TStringField;
    OraQuery3F_RESTAMT: TFloatField;
    OraQuery3F_REPTODATE: TStringField;
    OraQuery3F_STDAMT: TFloatField;
    OraQuery3F_MAXAMT: TFloatField;
    OraQuery3F_LASTAMT: TFloatField;
    OraQuery3F_LASTDATE: TStringField;
    OraQuery3F_YYMM: TStringField;
    OraQuery3F_APPTIME: TStringField;
    OraQuery3F_REPMM1: TIntegerField;
    OraQuery3F_REPMM2: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure OraQuery3CalcFields(DataSet: TDataSet);
    procedure RBappdateClick(Sender: TObject);
    procedure BBcalcClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBrestClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBkillClick(Sender: TObject);
    procedure BBabortClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnCalenClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MEdefaultEnter(Sender: TObject);
    procedure MEdefaultExit(Sender: TObject);
    procedure MEdefaultKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BBDeleteDropClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure OraQuery4CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    StartUp, CancelOfFlag, CloseFlag, FlagOfPerson : Boolean;
    GSempno, GSkorname, GSpass, GSgrade,userid, word, GSsysdate, SDFM : String;
    SelectOfGubun1, SelectOfGubun2, TmpTbl : String;
    AmtOfCalc, AmtOfCalcOf, AmtOfRestOf : Real;
    TotalAmtOfStdamt : Real;
    ExpandAmt, LimitAmt, AmtOfBBrest, TempOf : Real;
    RecordCountOf, BeginOfDate, BoxOfResult : Integer;
    procedure SetNow(Parameter : String);
    procedure DBGridShow(Parameter : String);
    procedure CalcOfPersonAndTotal(Parameter : String);
    procedure MakeTableOfTemp(Parameter : String);
    procedure ReplaceOfTable(Parameter : String);
    procedure ShowDBGrid;
    procedure BottomOf;
    procedure PersonOfNumber;
  end;

var
  Fpsa30301: TFpsa30301;

implementation

uses Pass, kylib1, Calen1, FormMon1, Psa30302, Psa30303;//Calen2
{$R *.DFM}

procedure TFpsa30301.ShowDBGrid;
begin
  with OraQuery4 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT APPFLAG F_APPFLAG, EMPNO F_EMPNO, KORNAME F_KORNAME,     ');
       Sql.Add('       LASTDATE F_LASTDATE, APPDATE F_APPDATE, STDAMT F_STDAMT, ');
       Sql.Add('       REPMM1 F_REPMM1, MAXAMT F_MAXAMT, REPMM2 F_REPMM2,       ');
       Sql.Add('       LASTAMT F_LASTAMT, APPTIME F_APPTIME, RESTAMT F_RESTAMT  ');
       Sql.Add('  FROM '+ TmpTbl                                                 );
       if RBappdate.Checked then
            Sql.Add('  ORDER BY APPDATE , APPTIME                               ')
       else
            Sql.Add('  ORDER BY EMPNO , APPDATE                                 ');
       Open;
  end;
end;

procedure TFpsa30301.ReplaceOfTable(Parameter : String);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('DELETE  FROM '+TmpTbl );
       ExecSql;
  end;
  OraQuery3.First;
  while not OraQuery3.Eof do
  begin
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO '+TmpTbl );
            Sql.Add('VALUES ( '''+OraQuery3F_EMPNO.AsString+''', '''+OraQuery3F_KORNAME.AsString+''', ');
            Sql.Add('        TO_NUMBER('''+FloatToStr(OraQuery3F_RESTAMT.AsFloat)+'''), '''+OraQuery3F_LASTDATE.AsString+''',  ');
            Sql.Add('        TO_NUMBER('''+FloatToStr(OraQuery3F_STDAMT.AsFloat)+'''), '''+OraQuery3F_REPMM1.AsString+''',     ');
            Sql.Add('        TO_NUMBER('''+FloatToStr(OraQuery3F_MAXAMT.AsFloat)+'''), '''+OraQuery3F_REPMM2.AsString+''',     ');
            Sql.Add('        TO_NUMBER('''+FloatToStr(OraQuery3F_LASTAMT.AsFloat)+'''), '''+OraQuery3F_APPTIME.AsString+''',   ');
            Sql.Add('        '''+OraQuery3F_APPDATE.AsString+''' ,                                 ');
            Sql.Add('        '''+OraQuery3F_APPFLAG.AsString+''', ''Q'', ''Q'' )                   ');
            ExecSql;
       end;
       OraQuery3.Next;
  end;
end;

procedure TFpsa30301.MakeTableOfTemp(Parameter : String);
var
  iCNT : Integer;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT COUNT(*) CNT FROM ALL_TABLES ');
       Sql.Add(' WHERE TABLE_NAME = '''+ Parameter +''' ');
       Open;
       iCNT := OraQuery1.FieldByName('CNT').AsInteger;
  end;

  if iCNT > 0 then
  begin
       try
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('DROP TABLE '+ Parameter );
                 ExecSql;
            end;
       Except On E : EDataBaseError do
            begin
                 StrPCopy(DBErrMsg, E.Message);
                 if Pos('ORA-00942', DBErrMsg) > 0 then
                 else
                 begin
                      Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                     #13+#13+'    전산담당자 또는 개발자와 상의하십시요',
                                             '사우회 대출금상환등록', mb_OK);
                      CloseFlag := True;
                      Close;
                 end;
            end;
       end;
  end;

  Try
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('CREATE TABLE '+ Parameter              );
            Sql.Add('( EMPNO    VARCHAR2(4) ,              ');
            Sql.Add('  KORNAME  VARCHAR2(12),              ');
            Sql.Add('  RESTAMT  NUMBER(12,0) DEFAULT 0,    ');
            Sql.Add('  LASTDATE VARCHAR2(6),               ');
            Sql.Add('  STDAMT   NUMBER(12,0) DEFAULT 0,    ');
            Sql.Add('  REPMM1   VARCHAR2(2),               ');
            Sql.Add('  MAXAMT   NUMBER(12,0) DEFAULT 0,    ');
            Sql.Add('  REPMM2   VARCHAR2(2),               ');
            Sql.Add('  LASTAMT  NUMBER(12,0) DEFAULT 0,    ');
            Sql.Add('  APPTIME  VARCHAR2(15),              ');
            Sql.Add('  APPDATE  VARCHAR2(15),              ');
            Sql.Add('  APPFLAG  VARCHAR2(1) ,              ');
            Sql.Add('  YN       VARCHAR2(1) ,              ');
            Sql.Add('  YN2      VARCHAR2(1)            )   ');
//            Sql.Add('TABLESPACE WELF                       ');
            Sql.Add('STORAGE(INITIAL    100K   NEXT 5K     ');
            Sql.Add('        MINEXTENTS   1                ');
            Sql.Add('        MAXEXTENTS 121                ');
            Sql.Add('        PCTINCREASE  1            )   ');
            ExecSql;
       end;
  except on  EDataBaseError do
       begin
            Phelpmsg.Caption := ('  임시테이블 생성할 수 없습니다!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금지급', mb_OK);
            CloseFlag := True;
            Close;
       end;
  end;
end;

procedure TFpsa30301.SetNow(Parameter : String);
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

procedure TFpsa30301.CalcOfPersonAndTotal(Parameter : String);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT COUNT(*), SUM(LOANAMT) FROM PSMLOAN  ');
       Sql.Add('WHERE APPFLAG = ''0''  AND                  ');
       Sql.Add('      YYMM = '''+Trim(MEdefault.Text)+'''   ');
       Open;
       if RecordCount > 0 then
       begin
            if FlagOfPerson then     PPersonOut.Caption := '0'
            else                     PPersonOut.Caption := Format('%4.0n', [Fields[0].AsFloat]);
            ExpandAmt := Fields[1].AsFloat;
            PExpandAmt.Caption := Format('%12.0n', [ExpandAmt]);
       end
       else
       begin
            PPersonOut.Caption := '0';
            ExpandAmt          := 0;
            PExpandAmt.Caption := '0';
       end;
  end;
end;

procedure TFpsa30301.DBGridShow(Parameter : String);
begin
  with OraQuery3 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.APPFLAG F_APPFLAG, A.EMPNO F_EMPNO, C.KORNAME F_KORNAME,      ');
       Sql.Add('       A.APPDATE F_APPDATE, A.REPTODATE F_REPTODATE, A.STDAMT F_STDAMT,');
       Sql.Add('       A.REPMM1 F_REPMM1, A.MAXAMT F_MAXAMT, A.REPMM2 F_REPMM2,        ');
       Sql.Add('       A.YYMM F_YYMM, A.APPTIME F_APPTIME                              ');
       Sql.Add('  FROM PSMLOAN A, PSCMAN C                                             ');
       Sql.Add(' WHERE A.EMPNO = C.EMPNO(+) AND                                        ');
       if CancelOfFlag then
            Sql.Add('  A.LOANDATE LIKE '''+Copy(MEtoday.Text, 1, 6)+'%''               ')
       else
            Sql.Add('  A.LOANDATE IS NULL AND APPFLAG <> ''3''                         ');
       Sql.Add(' ORDER BY A.APPDATE ASC, A.APPTIME ASC                                 ');
       Open;
       if not EOF then
            PpersonIn.Caption := Format('%4.0n' , [StrToFloat(IntToStr(RecordCount))])
       else
       begin
            Phelpmsg.Caption := '  해당하는 자료가 없습니다.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            PpersonIn.Caption := '0';
       end;
  end;
end;

procedure TFpsa30301.FormCreate(Sender: TObject);
begin
  StartUp := False;
  CloseFlag := False;
end;

procedure TFpsa30301.FormActivate(Sender: TObject);
var i : Integer;
begin
  if StartUp = True then  Exit;
  StartUp          := True;
  CancelOfFlag     := False;
  Phelpmsg.Caption := '  초기화 설정중입니다 잠시만 기다려 주세요.';
  Application.ProcessMessages;
  BBrest.Enabled   := False;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SelectOfGubun1   := '';
  SelectOfGubun2   := '';
  TotalAmtOfStdamt := 0;
  RecordCountOf    := 0;
//  SDFM := SystemDateFormatMask;
  SDFM             := '-';
  SetNow('사용자함수');
  TmpTbl           := 'T' + GSempno + Copy(GSsysdate, 3, 4);
  MakeTableOfTemp(TmpTbl);
  Application.ProcessMessages;
  MEtoday.Text     := Copy(GSsysdate, 1, 8);
  MEdefault.Text   := Copy(GSsysdate, 1, 6);
  MEdefaultExit(Self);
  FlagOfPerson     := True;
  CalcOfPersonAndTotal('0');
  FlagOfPerson     := False;
  DBGridShow('사용자함수');
  ReplaceOfTable('사용자함수');
  ShowDBGrid;
  BottomOf;
  Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30301.BBcloseClick(Sender: TObject);
begin
  CloseFlag := False;
  Close;
end;

procedure TFpsa30301.OraQuery3CalcFields(DataSet: TDataSet);
begin
  RecordCountOf := RecordCountOf + 1;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT SUM(JANAMT) FROM PSMLOAN                  ');
       Sql.Add('  WHERE LOANDATE IS NOT NULL                      ');
       Sql.Add('    AND JANAMT > 0                                ');
       Sql.Add('    AND EMPNO = '''+OraQuery3F_EMPNO.AsString+''' ');
       Sql.Add('  GROUP BY EMPNO                                  ');
       Open;
       if Fields[0].AsFloat >= 0 then     OraQuery3F_RESTAMT.AsFloat := Fields[0].AsFloat
       else                               OraQuery3F_RESTAMT.AsFloat := 0;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT ADD_MONTHS(ADD_MONTHS(TO_DATE('''+Copy(MEtoday.Text, 1 ,6)+''', ''YYYYMM'') , :P1  ) , :P2 )');
       Sql.Add(' FROM DUAL                                                                                          ');
       ParamByName('P1').AsInteger := BeginOfDate;
       ParamByName('P2').AsInteger := OraQuery3F_REPMM1.AsInteger - 1;
       Open;
  end;
  OraQuery3F_LASTDATE.AsString := Copy(OraQuery1.Fields[0].AsString, 1, 4) + Copy(OraQuery1.Fields[0].AsString, 6, 2);
end;

procedure TFpsa30301.RBappdateClick(Sender: TObject);
begin
  ShowDBGrid;
end;

procedure TFpsa30301.BBcalcClick(Sender: TObject);
label 1;
var String1, String2, String3 : String;
begin
  Phelpmsg.Caption := '  당월 총 대출금액내에서 기준신청금액을 지급합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  SelectOfGubun1 := '신청금';
  SelectOfGubun2 := '';

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NVL(SUM(STDAMT), 0) FROM '+TmpTbl  );
       Sql.Add(' WHERE APPFLAG <> ''0''                  ');
       Sql.Add('   AND APPFLAG <> ''9''                  ');
       Sql.Add('   AND APPFLAG <> ''3''                  ');
       Open;
       if Fields[0].AsFloat = 0 then
       begin
            Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            Exit;
       end;
  end;

  if OraQuery1.Fields[0].AsFloat <= TempOf then
  begin
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE '+TmpTbl+'   A                         ');
            Sql.Add('   SET A.APPFLAG = ''0'' ,                    ');
            Sql.Add('       A.YN      = ''S'' ,                    ');
            Sql.Add('       A.LASTAMT =                            ');
            Sql.Add('          ( SELECT B.STDAMT FROM '+TmpTbl+' B ');
            Sql.Add('            WHERE A.EMPNO = B.EMPNO           ');
            Sql.Add('              AND A.APPDATE = B.APPDATE       ');
            Sql.Add('              AND A.APPTIME = B.APPTIME       ');
            Sql.Add('              AND A.APPFLAG <> ''0''          ');
            Sql.Add('              AND A.APPFLAG <> ''9''          ');
            Sql.Add('              AND A.APPFLAG <> ''3''  )       ');
            Sql.Add(' WHERE A.APPFLAG <> ''0''                     ');
            Sql.Add('   AND A.APPFLAG <> ''3''                     ');
            Sql.Add('   AND A.APPFLAG <> ''9''                     ');
            ExecSql;
       end;
  end
  else
  begin
       while TempOf > 0 do
       begin
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('SELECT MIN(CONCAT(APPDATE, APPTIME||EMPNO)) FROM '+TmpTbl  );
                 Sql.Add(' WHERE APPFLAG <> ''0'' AND                                ');
                 Sql.Add('       APPFLAG <> ''9'' AND                                ');
                 Sql.Add('       APPFLAG <> ''3'' AND                                ');
                 Sql.Add('       YN <> ''S''                                         ');
                 Open;
            end;
            String1 := Copy(OraQuery1.Fields[0].AsString, 1, 8);
            String2 := Copy(OraQuery1.Fields[0].AsString, 9, 6);
            String3 := Copy(OraQuery1.Fields[0].AsString, 15, 4);

            if (String1 = '') and (String2 = '') then     goto 1;

            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('SELECT NVL(STDAMT, 0) FROM '+TmpTbl     );
                 Sql.Add('WHERE APPDATE = '''+String1+''' AND    ');
                 Sql.Add('      APPTIME = '''+String2+''' AND    ');
                 Sql.Add('      EMPNO = '''+String3+'''          ');
                 Open;
            end;
            if OraQuery1.Fields[0].AsFloat > 0 then
            begin
                 if TempOf >= OraQuery1.Fields[0].AsFloat then
                 begin
                      with OraQuery2 do
                      begin
                           Close;
                           Sql.Clear;
                           Sql.Add('UPDATE '+TmpTbl                   );
                           Sql.Add('   SET APPFLAG = ''0'' ,         ');
                           Sql.Add('       YN      = ''S'' ,         ');
                           Sql.Add('       LASTAMT = :P1             ');
                           Sql.Add(' WHERE APPDATE = '''+String1+''' ');
                           Sql.Add('   AND APPTIME = '''+String2+''' ');
                           Sql.Add('   AND EMPNO   = '''+String3+''' ');
                           ParamByName('P1').AsFloat := OraQuery1.Fields[0].AsFloat;
                           ExecSql;
                      end;
                      TempOf := TempOf - OraQuery1.Fields[0].AsFloat;
                 end
                 else
                 begin
                      with OraQuery2 do
                      begin
                           Close;
                           Sql.Clear;
                           Sql.Add('UPDATE '+TmpTbl                      );
                           Sql.Add('   SET APPFLAG = ''9'' ,            ');
                           Sql.Add('       YN      = ''S'' ,            ');
                           Sql.Add('       LASTAMT = :P1                ');
                           Sql.Add(' WHERE APPDATE = '''+String1+'''    ');
                           Sql.Add('   AND APPTIME = '''+String2+'''    ');
                           Sql.Add('   AND EMPNO   = '''+String3+'''    ');
                           ParamByName('P1').AsFloat := 0;
                           ExecSql;
                      end;
                 end;
            end
            else
            begin
                 with OraQuery2 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('UPDATE '+TmpTbl                           );
                      Sql.Add('   SET YN      = ''S''                   ');
                      Sql.Add(' WHERE APPDATE = '''+String1+'''         ');
                      Sql.Add('   AND APPTIME = '''+String2+'''         ');
                      Sql.Add('   AND EMPNO   = '''+String3+'''         ');
                      ExecSql;
                 end;
            end;
       end;
  end;

  1:   with OraQuery2 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE '+TmpTbl              );
            Sql.Add('   SET APPFLAG = ''2'' ,    ');
            Sql.Add('       LASTAMT = :P1        ');
            Sql.Add(' WHERE APPFLAG = ''1''      ');
            Sql.Add('    OR APPFLAG = ''9''      ');  // 일괄적으로 복구
            ParamByName('P1').AsFloat := 0;
            ExecSql;
       end;
       with OraQuery2 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE '+TmpTbl              );
            Sql.Add('   SET YN = ''Q''           ');
            Sql.Add(' WHERE YN = ''S''           ');
            ExecSql;
       end;

       BBrest.Enabled   := True;
       ShowDBGrid;
       BottomOf;
       PersonOfNumber;
       Phelpmsg.Caption := '  기준금액 계산이 완료되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.PersonOfNumber;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT COUNT(*) FROM '+TmpTbl  );
       Sql.Add(' WHERE APPFLAG = ''0''        ');
       Open;
  end;
  if OraQuery1.RecordCount > 0 then     PpersonOut.Caption := Format('%5.0n', [StrToFloat(IntToStr(OraQuery1.Fields[0].AsInteger))])
  else                                  PpersonOut.Caption := '0';
end;

procedure TFpsa30301.BottomOf;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NVL(SUM(LASTAMT), 0), NVL(SUM(STDAMT), 0) FROM '+TmpTbl  );
       Open;
  end;
  PTotalAmt.Caption  := Format('%13.0n', [OraQuery1.Fields[1].AsFloat]);
  PExpandAmt.Caption := Format('%13.0n', [OraQuery1.Fields[0].AsFloat]);
  TempOf             := LimitAmt - OraQuery1.Fields[0].AsFloat;
  PResAmt.Caption    := Format('%13.0n', [TempOf]);
end;

procedure TFpsa30301.BBcancelClick(Sender: TObject);
var  i, j, k : String;
     l : Pchar;
begin
  Phelpmsg.Caption   := '  대출설정을 취소합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  CancelOfFlag       := True;
  DBGridShow('사용자함수');
  ReplaceOfTable('사용자함수');
  ShowDBGrid;
  PpersonIn.Caption  := '0';
  PpersonOut.Caption := '0';
  PLimitAmt.Caption  := '0';
  PTotalAmt.Caption  := '0';
  PExpandAmt.Caption := '0';
  PResAmt.Caption    := '0';
  i := Copy(MEtoday.Text, 1, 4);
  j := Copy(MEtoday.Text, 5, 2);
  k := Copy(MEtoday.Text, 7, 2);
  l := Pchar(i +'-' + j + ' 대출처리한 자료를 취소하시겠습니까?'+#13+#13+
             '이미 상환중인 자료는 대출처리취소가 되지않습니다');
  if ID_YES = MessageBox(Handle,l,'주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
  begin
       try
            SetNow('사용자함수');
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('UPDATE PSMLOAN SET                                       ');
                 Sql.Add('       LOANDATE  = NULL,                                 ');
                 Sql.Add('       LOANAMT   = TO_NUMBER(''0''),                     ');
                 Sql.Add('       REPMAXMM  = TO_NUMBER(''0''),                     ');
                 Sql.Add('       REPFRDATE = NULL,                                 ');
                 Sql.Add('       REPTODATE = NULL,                                 ');
                 Sql.Add('       REPLDATE  = '' '',                                ');
                 Sql.Add('       REPCNT    = TO_NUMBER(''0''),                     ');
                 Sql.Add('       YYMM      = NULL ,                                ');
                 Sql.Add('       JANAMT    = TO_NUMBER(''0''),                     ');
                 Sql.Add('       APPFLAG   = ''1'' ,                               ');
                 Sql.Add('       ENDYN     = NULL  ,                               ');
                 Sql.Add('       WRITETIME = '''+Copy(GSsysdate, 1, 15)+''',       ');
                 Sql.Add('       WRITEMAN  = '''+GSempno+'''                       ');
                 Sql.Add(' WHERE LOANDATE  LIKE '''+Copy(MEtoday.Text, 1, 6)+'%''  ');
                 Sql.Add('   AND LOANAMT   = JANAMT                                ');
                 ExecSql;
            end;
       except on  EDataBaseError do
            begin
                 Phelpmsg.Caption := ('  자료를 저장할 수 없습니다!');
                 Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                        #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                        #13+#13+'                     종료합니다',
                                        '사우회 대출금지급', mb_OK);
                 Phelpmsg.Caption := '  자료오류로인해 진행중인작업을 복구하는 중입니다.';
                 SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
                 Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
                 SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
                 CancelOfFlag := False;
                 Exit;
            end;
       end;
       CancelOfFlag     := False;
       Phelpmsg.Caption := '  대출취소작업이 완료되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end
  else
  begin
       Phelpmsg.Caption := '  대출취소작업이 취소되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end;
end;

procedure TFpsa30301.BBrestClick(Sender: TObject);
label 1;
var  String1, String2, String3 : String;
begin
  Phelpmsg.Caption := '  당월 총 대출금액 여유분내에서 최대신청금액을 지급합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  SelectOfGubun2   := '여유분';
  RecordCountOf    := 0;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NVL(SUM(STDAMT), 0), NVL(SUM(MAXAMT), 0), NVL(SUM(LASTAMT), 0) FROM '+TmpTbl  );
       Sql.Add(' WHERE APPFLAG = ''0''                        ');
       Open;
  end;
  if OraQuery1.Fields[1].AsFloat <> OraQuery1.Fields[2].AsFloat then
  begin
       if (TempOf + OraQuery1.Fields[0].AsFloat - OraQuery1.Fields[1].AsFloat) >= 0 then
       begin
            with OraQuery2 do
            begin
              Close;
              Sql.Clear;
              Sql.Add('UPDATE '+TmpTbl+' A    ');
              Sql.Add(' SET A.APPFLAG = ''0'' , ');
              Sql.Add('     A.YN2 = ''M'' ,     ');
              Sql.Add(' A.LASTAMT =             ');
              Sql.Add('          ( SELECT B.MAXAMT FROM '+TmpTbl+' B ');
              Sql.Add('            WHERE A.EMPNO = B.EMPNO AND       ');
              Sql.Add('                  A.APPDATE = B.APPDATE AND   ');
              Sql.Add('                  A.APPTIME = B.APPTIME AND   ');
              Sql.Add('                  A.APPFLAG = ''0''  )        ');
              Sql.Add('WHERE A.APPFLAG = ''0''                       ');
              ExecSql;
            end;
            TempOf := TempOf - OraQuery1.Fields[1].AsFloat + OraQuery1.Fields[0].AsFloat;
       end
       else
       begin
            while TempOf > 0 do
            begin
                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('SELECT MIN(CONCAT(APPDATE, APPTIME||EMPNO)) FROM '+TmpTbl       );
                      Sql.Add(' WHERE APPFLAG = ''0'' AND MAXAMT <> LASTAMT  AND YN2 <> ''M'' ');
                      Open;
                 end;
                 String1 := Copy(OraQuery1.Fields[0].AsString, 1, 8);
                 String2 := Copy(OraQuery1.Fields[0].AsString, 9, 6);
                 String3 := Copy(OraQuery1.Fields[0].AsString, 15, 4);

                 if (String1 = '') and (String2 = '') then     goto 1;

                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('SELECT NVL(STDAMT, 0), NVL(MAXAMT, 0), NVL(LASTAMT, 0)  ');
                      Sql.Add('  FROM '+TmpTbl                                          );
                      Sql.Add(' WHERE APPDATE = '''+String1+'''                        ');
                      Sql.Add('   AND APPTIME = '''+String2+'''                        ');
                      Sql.Add('   AND EMPNO   = '''+String3+'''                        ');
                      Open;
                 end;
                 if OraQuery1.Fields[1].AsFloat <> OraQuery1.Fields[2].AsFloat then
                 begin
                      if TempOf <= (OraQuery1.Fields[1].AsFloat - OraQuery1.Fields[2].AsFloat) then
                      begin
                           with OraQuery2 do
                           begin
                                Close;
                                Sql.Clear;
                                Sql.Add('UPDATE '+TmpTbl                   );
                                Sql.Add('   SET APPFLAG = ''8'' ,         ');            // 8 ===> 중복방지를 위한
                                Sql.Add('       YN2     = ''M'' ,         ');
                                Sql.Add('       LASTAMT = :P1             ');            //  임시플래그
                                Sql.Add(' WHERE APPDATE = '''+String1+''' ');
                                Sql.Add('   AND APPTIME = '''+String2+''' ');
                                Sql.Add('   AND EMPNO   = '''+String3+''' ');
                                ParamByName('P1').AsFloat := OraQuery1.Fields[2].AsFloat + TempOf;
                                ExecSql;
                           end;
                           TempOf := 0;
                      end
                      else
                      begin
                           with OraQuery2 do
                           begin
                                Close;
                                Sql.Clear;
                                Sql.Add('UPDATE '+TmpTbl                   );
                                Sql.Add('   SET APPFLAG = ''8'' ,         ');
                                Sql.Add('       YN2     = ''M'' ,         ');
                                Sql.Add('       LASTAMT = :P1             ');
                                Sql.Add(' WHERE APPDATE = '''+String1+''' ');
                                Sql.Add('   AND APPTIME = '''+String2+''' ');
                                Sql.Add('   AND EMPNO   = '''+String3+''' ');
                                ParamByName('P1').AsFloat := OraQuery1.Fields[1].AsFloat;
//                                ParamByName('P1').AsFloat := OraQuery1.Fields[2].AsFloat;
                                ExecSql;
                                TempOf := TempOf - OraQuery1.Fields[1].AsFloat + OraQuery1.Fields[0].AsFloat;
                           end;
                      end;
                 end;
            end;
       end;
  end;
  with OraQuery2 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('UPDATE '+TmpTbl           );
       Sql.Add('   SET APPFLAG = ''0''   ');                    // 재 복구
       Sql.Add(' WHERE APPFLAG = ''8''   ');
       ExecSql;
  end;

  1:   with OraQuery2 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT NVL(SUM(LASTAMT), 0), NVL(SUM(STDAMT), 0) FROM '+TmpTbl );
            Open;
       end;
       PExpandAmt.Caption := Format('%13.0n', [OraQuery2.Fields[0].AsFloat]);
       PResAmt.Caption    := Format('%13.0n', [TempOf]);
       with OraQuery2 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE '+TmpTbl       );
            Sql.Add(' SET   YN2 = ''Q''   ');                    // 재 복구
            Sql.Add('WHERE YN2 = ''M''    ');
            ExecSql;
       end;
       ShowDBGrid;
       PersonOfNumber;
       SelectOfGubun2   := '';
       Phelpmsg.Caption := '  여유분 계산이 완료되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.BBsaveClick(Sender: TObject);
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
  Phelpmsg.Caption := '  저장 중입니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

  try
       SetNow('사용자함수');
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN A SET                                            ');
            Sql.Add('               ( LOANDATE, LOANAMT, JANAMT, REPMAXMM, ENDYN     ');
            Sql.Add('                ,YYMM, WRITETIME, WRITEMAN, APPFLAG        )    ');
            Sql.Add('   = ( SELECT  '''+MEtoday.Text+''', B.LASTAMT, B.LASTAMT,      ');
            Sql.Add('             ''0'', ''N'', '''+Copy(MEtoday.Text, 1, 6)+''' ,   ');
            Sql.Add('             '''+Copy(GSsysdate, 1, 15)+''',                    ');
            Sql.Add('             '''+GSempno+''', ''0''                             ');
            Sql.Add('         FROM '+TmpTbl+' B'                                      );
            Sql.Add('        WHERE A.APPDATE = B.APPDATE AND A.APPTIME = B.APPTIME   ');
            Sql.Add('          AND A.EMPNO = B.EMPNO AND NVL(B.LASTAMT,0) > 0     )  ');
            Sql.Add(' WHERE (A.EMPNO, A.APPDATE, A.APPTIME)                          ');
            Sql.Add('    IN (SELECT C.EMPNO, C.APPDATE, C.APPTIME FROM '+TmpTbl+' C  ');
            Sql.Add('         WHERE A.APPDATE = C.APPDATE AND A.APPTIME = C.APPTIME  ');
            Sql.Add('           AND A.EMPNO = C.EMPNO AND NVL(C.LASTAMT,0) > 0     ) ');
            ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN A SET                                            ');
            Sql.Add('               ( REPMAXMM, REPFRDATE, REPTODATE )               ');
            Sql.Add(' = ( SELECT TO_NUMBER(B.REPMM1),                                ');
            Sql.Add('    TO_CHAR(ADD_MONTHS(TO_DATE(A.LOANDATE, ''YYYYMMDD''), :P1), ''YYYYMM''),    ');
            Sql.Add('    TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE(A.LOANDATE, ''YYYYMMDD''), :P1), TO_NUMBER(B.REPMM1)-1), ''YYYYMM'') ');
            Sql.Add('       FROM '+TmpTbl+' B'                                        );
            Sql.Add('      WHERE A.EMPNO = B.EMPNO AND A.APPDATE = B.APPDATE         ');
            Sql.Add('        AND A.APPTIME = B.APPTIME  AND NVL(B.LASTAMT,0) > 0     ');
            Sql.Add('        AND B.STDAMT = B.LASTAMT                             )  ');
            Sql.Add(' WHERE (A.EMPNO, A.APPDATE, A.APPTIME)                          ');
            Sql.Add('    IN (SELECT C.EMPNO, C.APPDATE, C.APPTIME FROM '+TmpTbl+' C'  );
            Sql.Add('         WHERE A.APPDATE = C.APPDATE AND A.APPTIME = C.APPTIME  ');
            Sql.Add('           AND A.EMPNO = C.EMPNO AND NVL(C.LASTAMT,0) > 0       ');
            Sql.Add('           AND C.STDAMT = C.LASTAMT                           ) ');
            ParamByName('P1').AsInteger := BeginOfDate;
            ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN A SET                                               ');
            Sql.Add('               ( REPMAXMM, REPFRDATE, REPTODATE )                  ');
            Sql.Add(' = ( SELECT TO_NUMBER(B.REPMM2),                                   ');
            Sql.Add('    TO_CHAR(ADD_MONTHS(TO_DATE(A.LOANDATE, ''YYYYMMDD''), :P1), ''YYYYMM''),    ');
            Sql.Add('    TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE(A.LOANDATE, ''YYYYMMDD''), :P1), TO_NUMBER(B.REPMM2)-1), ''YYYYMM'') ');
            Sql.Add('       FROM '+TmpTbl+' B'                                           );
            Sql.Add('      WHERE A.EMPNO = B.EMPNO AND A.APPDATE = B.APPDATE            ');
            Sql.Add('        AND A.APPTIME = B.APPTIME  AND NVL(B.LASTAMT,0) > 0        ');
            Sql.Add('        AND NVL(B.STDAMT,0) >= 0                                   ');
            Sql.Add('        AND B.LASTAMT > B.STDAMT                                )  ');
            Sql.Add(' WHERE (A.EMPNO, A.APPDATE, A.APPTIME)                             ');
            Sql.Add('    IN (SELECT C.EMPNO, C.APPDATE, C.APPTIME FROM '+TmpTbl+' C'     );
            Sql.Add('         WHERE A.APPDATE = C.APPDATE AND A.APPTIME = C.APPTIME     ');
            Sql.Add('           AND A.EMPNO = C.EMPNO AND NVL(C.LASTAMT,0) > 0          ');
            Sql.Add('           AND NVL(C.STDAMT,0) >= 0                                ');
            Sql.Add('           AND C.LASTAMT > C.STDAMT                             )  ');
            ParamByName('P1').AsInteger := BeginOfDate;
            ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN A SET                                               ');
            Sql.Add('               ( APPFLAG )                                         ');
            Sql.Add(' = (SELECT B.APPFLAG FROM '+TmpTbl+' B                             ');
            Sql.Add('     WHERE A.EMPNO = B.EMPNO AND A.APPDATE = B.APPDATE             ');
            Sql.Add('       AND A.APPTIME = B.APPTIME AND B.APPFLAG = ''3''  )          ');
            Sql.Add(' WHERE (A.EMPNO, A.APPDATE, A.APPTIME)                             ');
            Sql.Add('    IN (SELECT C.EMPNO, C.APPDATE, C.APPTIME FROM '+TmpTbl+' C     ');
            Sql.Add('         WHERE A.APPDATE = C.APPDATE AND A.APPTIME = C.APPTIME     ');
            Sql.Add('           AND A.EMPNO   = C.EMPNO   AND C.APPFLAG = ''3''    )    ');
            ExecSql;
       end;
  except on  EDataBaseError do
       begin
            Phelpmsg.Caption := ('  자료를 수정할 수 없습니다!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금지급', mb_OK);
            Phelpmsg.Caption := '  자료오류로인해 진행중인작업을 복구하는 중입니다.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            Exit;
       end;
  end;
  Phelpmsg.Caption := '  저장작업이 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.BBkillClick(Sender: TObject);
begin
  Phelpmsg.Caption := '  기각자를 삭제합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

  try
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE FROM PSMLOAN WHERE APPFLAG = ''3'' ');
            ExecSql;
       end;
  except on  EDataBaseError do
       begin
            Phelpmsg.Caption := ('  기각자를 삭제할 수 없습니다!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금지급', mb_OK);
            Phelpmsg.Caption := '  자료오류로인해 진행중인작업을 복구하는 중입니다.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            Exit;
       end;
  end;
  Phelpmsg.Caption := '  기각자를 삭제하였습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.BBabortClick(Sender: TObject);
begin
  Phelpmsg.Caption := '  초기화상태로 되돌아 갑니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  CancelOfFlag     := False;
  SelectOfGubun1   := '';
  SelectOfGubun2   := '';
  RecordCountOf    := 0;
  BBrest.Enabled   := False;
  BBcalc.Enabled   := True;
  BBrest.Enabled   := False;
  BBkill.Enabled   := True;
  BBcancel.Enabled := True;
  BBsave.Enabled   := True;
  PResAmt.Caption  := '';
  MEtoday.Text     := Copy(GSsysdate, 1, 8);
  MEdefault.Text   := Copy(GSsysdate, 1, 6);
  MEdefaultExit(Self);
  CalcOfPersonAndTotal('0');
  DBGridShow('사용자함수');
  ReplaceOfTable('사용자함수');
  ShowDBGrid;
  PersonOfNumber;
  BottomOf;
  Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.SpeedButton1Click(Sender: TObject);
begin
  MEdefaultEnter(Self);
  Try
       MonthForm := TMonthForm.Create(Self);
       MonthForm.ShowModal;
       if MonthForm.DayCaption <> '' then
            MEdefault.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
       MonthForm.Free;
  End;
end;

procedure TFpsa30301.btnCalenClick(Sender: TObject);
begin
  MEdefaultEnter(Self);
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

end;

procedure TFpsa30301.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CloseFlag = True then
  begin
       try
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('DROP TABLE '+ TmpTbl );
                 ExecSql;
            end;
       Except On E : EDataBaseError do
           CanClose := True;
       end;
       CanClose := True;
  end
  else
  begin
       if ID_YES = MessageBox(Handle,'종료하시겠습니까?','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
       begin
         try
              with OraQuery1 do
              begin
                   Close;
                   Sql.Clear;
                   Sql.Add('DROP TABLE '+ TmpTbl );
                   ExecSql;
              end;
         Except On E : EDataBaseError do
              CanClose := True;
         end;
         CanClose := True;
       end
       else
            CanClose := False;
  end;
end;

procedure TFpsa30301.DBGrid1DblClick(Sender: TObject);
begin
  Fpsa30302.ShowModal;
  if (BoxOfResult = 1) or (BoxOfResult = 2) then
  begin
       with OraQuery2 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT SUM(LASTAMT) FROM '+TmpTbl );
            Open;
       end;
       if (OraQuery4F_APPFLAG.AsString = '0') or (OraQuery4F_APPFLAG.AsString = '1') or
          (OraQuery4F_APPFLAG.AsString = '2') or (OraQuery4F_APPFLAG.AsString = '3') then
       begin
            with OraQuery1 do
            begin
              Close;
              Sql.Clear;
              Sql.Add('UPDATE '+TmpTbl       );
              Sql.Add(' SET APPFLAG = ''0'' ');
              Sql.Add(',    LASTAMT = :P1   ');
              Sql.Add('WHERE EMPNO =  :P2   ');
              Sql.Add(' AND  APPDATE = :P3  ');
              Sql.Add(' AND  APPTIME = :P4  ');
              if BoxOfResult = 1 then
              begin
                   if (TempOf + OraQuery4F_LASTAMT.AsFloat) < OraQuery4F_STDAMT.AsFloat  then
                   begin
                     MessageBox(Self.Handle,'대출한도 금액을 넘지않도록 하세요','주의',
                                MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                     Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
                     SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
                     Exit;
                   end
                   else
                   begin
                     TempOf := TempOf + OraQuery4F_LASTAMT.AsFloat - OraQuery4F_STDAMT.AsFloat;
                     ParamByName('P1').AsFloat := OraQuery4F_STDAMT.AsFloat;
                   end;
              end;
              if BoxOfResult = 2 then
              begin
                   if (TempOf + OraQuery4F_LASTAMT.AsFloat) < OraQuery4F_MAXAMT.AsFloat   then
                   begin
                        MessageBox(Self.Handle,'대출한도 금액을 넘지않도록 하세요','주의',
                                   MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                        Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
                        SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
                        Exit;
                   end
                   else
                   begin
                        TempOf := TempOf + OraQuery4F_LASTAMT.AsFloat - OraQuery4F_MAXAMT.AsFloat;
                        ParamByName('P1').AsFloat := OraQuery4F_MAXAMT.AsFloat;
                   end;
              end;
              ParamByName('P2').AsString := OraQuery4F_EMPNO.AsString;
              ParamByName('P3').AsString := OraQuery4F_APPDATE.AsString;
              ParamByName('P4').AsString := OraQuery4F_APPTIME.AsString;
              ExecSql;
            end;
       end;
  end;
  if BoxOfResult = 3 then
  begin
       TempOf := TempOf + OraQuery4F_LASTAMT.AsFloat;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE '+TmpTbl          );
            Sql.Add('   SET APPFLAG = ''3'', ');
            Sql.Add('       LASTAMT = :P1    ');
            Sql.Add(' WHERE EMPNO   = :P2    ');
            Sql.Add('   AND APPDATE = :P3    ');
            Sql.Add('   AND APPTIME = :P4    ');
            ParamByName('P1').AsFloat  := 0;
            ParamByName('P2').AsString := OraQuery4F_EMPNO.AsString;
            ParamByName('P3').AsString := OraQuery4F_APPDATE.AsString;
            ParamByName('P4').AsString := OraQuery4F_APPTIME.AsString;
            ExecSql;
       end;
  end;
  ShowDBGrid;
  BottomOf;
  PersonOfNumber;
  Phelpmsg.Caption := '  개별심사 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.MEdefaultEnter(Sender: TObject);
begin
  BBcalc.Enabled   := False;
  BBrest.Enabled   := False;
  BBkill.Enabled   := False;
  BBcancel.Enabled := False;
  BBsave.Enabled   := False;
  Phelpmsg.Caption := '  입력후 반드시 ENTER KEY를 눌러야 반영됩니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30301.MEdefaultExit(Sender: TObject);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT LIMITAMT , REPAYBEGIN FROM PSCLOANS        ');
       Sql.Add(' WHERE YYMM = '''+Copy(MEdefault.Text, 1, 6)+'''  ');
       Open;
  end;
  with OraQuery2 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT SUM(LOANAMT) FROM PSMLOAN                  ');
       Sql.Add(' WHERE YYMM = '''+Copy(MEdefault.Text, 1, 6)+'''  ');
       Sql.Add('   AND LOANDATE IS NOT NULL                       ');
       Open;
  end;
  LimitAmt           := OraQuery1.Fields[0].AsFloat - OraQuery2.Fields[0].AsFloat;
  BeginOfDate        := OraQuery1.Fields[1].AsInteger;
  TempOf             := LimitAmt;
  PLimitAmt.Caption  := Format('%13.0n', [TempOf]);
  PResAmt.Caption    := '';
  PExpandAmt.Caption := '';
end;

procedure TFpsa30301.MEdefaultKeyPress(Sender: TObject; var Key: Char);
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
//       if MEdefault.Text < Copy(GSsysdate, 1, 6) then
//       begin
//            MessageBox(Self.Handle, '기준년월은 현재년월보다 크거나 같아야합니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
//            Exit;
//       end;
       if MEdefault.Text <> Copy(MEtoday.Text, 1, 6) then
       begin
            MessageBox(Self.Handle, '기준년월과 대출일의 년월은 같아야 합니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
            Exit;
       end;
       SelectOfGubun1   := '';
       SelectOfGubun2   := '';
       RecordCountOf    := 0;
       BBcalc.Enabled   := True;
       BBrest.Enabled   := False;
       BBkill.Enabled   := True;
       BBcancel.Enabled := True;
       BBsave.Enabled   := True;
       FlagOfPerson     := True;
       CalcOfPersonAndTotal('0');
       FlagOfPerson     := False;
       DBGridShow('사용자함수');
       ReplaceOfTable('사용자함수');
       ShowDBGrid;
       Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       BBcalc.SetFocus;
  end;
end;

procedure TFpsa30301.SpeedButton2Click(Sender: TObject);
begin
  Fpsa30303.GStempVar := MEdefault.Text;
  Fpsa30303.Showmodal;
end;

{ *************************************************************************
  Update Date : 1998.04.28
  Update by   : 성용권
  수정내용    : 사우회 대출에서 신청자나 대기자로 등록된 회원이 중간에
                퇴직한 경우 "퇴직자 삭제" 버튼을 누르면 자동적으로 삭제
  신규생성된 프로시저명 :
          1. procedure TFpsa30301.BBDeleteDropClick(Sender: TObject);
          2. procedure TFpsa30301.DataSource2StateChange(Sender: TObject);
************************************************************************* }
procedure TFpsa30301.BBDeleteDropClick(Sender: TObject);
var
     i: Integer;
begin
//  Phelpmsg.Caption := '  퇴직(휴직)자를 삭제하고 있습니다.';
//  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

//  if Application.MessageBox('대출신청자중에서 퇴직(휴직)자를 삭제하시겠습니까?',
//                            '작업안내',mb_YESNO) = id_yes then
//  begin
//       with Query5 do
//       begin
//            Close;       { 대출신청지급(PSMLOAN) 에서 먼저 삭제 }
//            SQL.Clear;
//            SQL.Add('SELECT A.EMPNO, A.APPDATE          ');
//            SQL.Add('  FROM PSMLOAN A, PIMPMAS B        ');
//            SQL.Add(' WHERE B.PSTATE >= ''60''          ');
//            SQL.Add('   AND A.EMPNO  = B.EMPNO          ');
//            SQL.Add('   AND A.APPFLAG IN (''1'',''2'')  ');
//            Open;
//       end;
//       i := Query5.RecordCount;
//       Query5.Close;

//       Database1.StartTransaction;
//       try
//            with Query5 do
//            begin
//                 Close;       { 대출신청지급(PSMLOAN) 에서 먼저 삭제 }
//                 SQL.Clear;
//                 SQL.Add('DELETE FROM PSMLOAN               ');
//                 SQL.Add('WHERE (EMPNO, APPDATE) =          ');
//                 SQL.Add('      (SELECT A.EMPNO, A.APPDATE  ');
//                 SQL.Add('       FROM PSMLOAN A, PIMPMAS B  ');
//                 SQL.Add('       WHERE B.PSTATE >= ''60''   ');
//                 SQL.Add('         AND A.EMPNO = B.EMPNO    ');
//                 SQL.Add('         AND A.APPFLAG IN (''1'',''2'')  )');
//                 ExecSQL;
//                 if RowsAffected < 1 then
//                      Application.MessageBox(' 삭제할 자료가 없습니다.','사우회 대출금지급등록', mb_OK)
//                 else
//                      Application.MessageBox(PChar(IntToStr(i) + ' 건의 자료가 삭제되었습니다.'),'작업안내',mb_ok);
//                 Close;       { 임시테이블에서도 삭제 }
//                 SQL.Clear;
//                 SQL.Add(Format('DELETE FROM %s                           ', [TmpTbl]));
//                 SQL.Add('       WHERE EMPNO IN (                         ');
//                 SQL.Add('         SELECT A.EMPNO FROM PSCMAN A, PIMPMAS B');
//                 SQL.Add('          WHERE A.EMPNO = B.EMPNO               ');
//                 SQL.Add('            AND B.PSTATE >= ''60''             )');

//                 ExecSQL;
//                 Database1.Commit;
//            end;
//       except on Exception do
//            begin
//                 Database1.Rollback;
//                 Application.MessageBox(' DB에서 자료를 삭제할 수 없습니다.'+
//                                #13+#13+'    전산담당자 또는 개발자와 상의하십시요',
//                                      '사우회 대출금지급등록', mb_OK);
//                 Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
//                 SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
//                 exit;
//            end;
//       end;
//  end;
//  CalcOfPersonAndTotal('0');
//  ShowDBGrid;

//  Phelpmsg.Caption := '  대출지급등록작업을 시작하세요.';
//  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30301.DataSource1StateChange(Sender: TObject);
begin
//  if OraQuery4.State in [dsInactive] then { 쿼리가 비활성이면 퇴직자 삭제 버튼 Disable }
//       BBDeleteDrop.Enabled := False
//  else if OraQuery4.State in [dsBrowse] then { 쿼리가 활성이고 데이타가 있으면 퇴직자 삭제 버튼 Enable }
//       BBDeleteDrop.Enabled := OraQuery4.Fields[0].AsString <> '';
end;

procedure TFpsa30301.OraQuery4CalcFields(DataSet: TDataSet);
begin
  case StrToInt(OraQuery4F_APPFLAG.AsString) of
       0 : OraQuery4F_STATE.AsString := '대출자';
       1 : OraQuery4F_STATE.AsString := '신청자';
       2 : OraQuery4F_STATE.AsString := '대기자';
       3 : OraQuery4F_STATE.AsString := '기각자';
  end;
end;

end.
