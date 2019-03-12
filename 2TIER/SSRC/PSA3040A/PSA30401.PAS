{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출 상환등록
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
         08.03.17     jissi         일시상환등록부분 수정 요청서(2008-5378호)관련
-------------------------------------------------------------------------------}
unit Psa30401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, MemDS, DBAccess, Ora, Func;

type
  TFpsa30401 = class(TForm)
    Panel19: TPanel;
    Phelpmsg: TPanel;
    Panel8: TPanel;
    Lempno: TLabel;
    Panel9: TPanel;
    BBsave: TBitBtn;
    BBabort: TBitBtn;
    BBclose: TBitBtn;
    Lsysdate: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    SB1: TSpeedButton;
    Panel3: TPanel;
    RBempno: TRadioButton;
    RBloandate: TRadioButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel10: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    MEdefault: TMaskEdit;
    DBGrid: TDBGrid;
    P1: TPanel;
    P2: TPanel;
    Pallsum: TPanel;
    Psum: TPanel;
    Ppre: TPanel;
    BBcalc: TBitBtn;
    BBonly: TBitBtn;
    BBlast: TBitBtn;
    BBcan1: TBitBtn;
    BBprn: TBitBtn;
    DataSource1: TDataSource;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    OraQuery2F_EMPNO: TStringField;
    OraQuery2F_KORNAME: TStringField;
    OraQuery2F_LOANAMT: TFloatField;
    OraQuery2F_LOANDATE: TStringField;
    OraQuery2F_REPTODATE: TStringField;
    OraQuery2F_BEFOREAMT: TFloatField;
    OraQuery2F_BASEAMT: TFloatField;
    OraQuery2F_INTRATEAMT: TFloatField;
    OraQuery2F_SUMAMT: TFloatField;
    OraQuery2F_TOTALAMT: TFloatField;
    OraQuery2F_APPDATE: TStringField;
    OraQuery2F_REPCNT: TIntegerField;
    OraQuery2F_REPMAXMM: TIntegerField;
    Panel4: TPanel;
    MEmonth: TMaskEdit;
    Shape7: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBcloseClick(Sender: TObject);
    procedure BBcalcClick(Sender: TObject);
    procedure RBempnoClick(Sender: TObject);
    procedure MEdefaultExit(Sender: TObject);
    procedure BBonlyClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBabortClick(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure BBcan1Click(Sender: TObject);
    procedure BBlastClick(Sender: TObject);
    procedure MEdefaultKeyPress(Sender: TObject; var Key: Char);
    procedure MEdefaultEnter(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
    procedure Lastreplmonth;
  public
    { Public declarations }
    StartUp, CloseFlag, MakeTableOfFlag : Boolean;
    GSsysdate, SDFM : String;
    TmpTable, SelectOfGubun, EempnoGubun : String;
    IntrateOf, BaseAmt, IntrateAmt : Real;
    DayCount, PersonOf : Integer;
    Lastrepldate : String;
    procedure SetNow;
    procedure MakeTable(Parameter: String);
    procedure ReplaceData(Parameter: String);
    procedure CalcOfIntrate(Parameter: String);
    procedure QueryOfWant(Parameter: String);
    procedure DayOfBeforeMonth(Par : String);
  end;

var
  Fpsa30401 : TFpsa30401;
  sqlstr    : widestring;

implementation

uses Pass, kylib1, UserHelp, Calen1, Psa30402, Psa30403;
{$R *.DFM}

procedure TFpsa30401.SetNow;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
       Sql.Add('   FROM DUAL                                    ');
       Open;
       GSsysdate := FieldByName('D').AsString;
  end;
end;

procedure TFpsa30401.ReplaceData(Parameter: String);
begin
  try
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('TRUNCATE TABLE '+ Parameter);
            ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO '+Parameter                                          );
            Sql.Add('(SELECT A.EMPNO, B.KORNAME, A.LOANAMT, A.LOANDATE, A.REPTODATE, ');
            Sql.Add('        A.REPCNT, A.JANAMT, 0, 0, 0, 0, A.APPDATE, A.APPTIME,   ');
            Sql.Add('        A.REPMAXMM, A.REPCNT, A.REPLDATE, A.REPLDATE,           ');
            Sql.Add('        A.YYMM,  A.WRITETIME, A.WRITEMAN                        '); //DSA2000  YYMM 필드추가  2015.01
            Sql.Add('   FROM PSMLOAN A, PSCMAN B                                     ');
            Sql.Add('  WHERE A.EMPNO = B.EMPNO AND A.ENDYN <> ''Y''                  ');
            Sql.Add('    AND NVL(JANAMT,0) > 0                                       ');
            Sql.Add('    AND A.REPFRDATE IS NOT NULL                                 ');
            Sql.Add('    AND A.REPFRDATE <= '''+MEdefault.Text+''' )                 ');
            ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT EMPNO FROM '+Parameter );
            Open;
            if RecordCount > 0 then
            begin
                 BBcalc.Enabled := True;
                 BBonly.Enabled := True;
                 RBempno.Enabled := True;
                 RBloandate.Enabled := True;
            end
            else
            begin
                 BBcalc.Enabled := False;
                 BBonly.Enabled := False;
                 RBempno.Enabled := False;
                 RBloandate.Enabled := False;
            end;
       end;
  except on  EDataBaseError do
       begin
            Phelpmsg.Caption   := ('  데이타베이스 작업오류!!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금상환등록', mb_OK);
            BBcalc.Enabled     := False;
            BBonly.Enabled     := False;
            RBempno.Enabled    := False;
            RBloandate.Enabled := False;
            BBlast.Enabled     := False;
            BBcan1.Enabled     := False;
            BBsave.Enabled     := False;
            BBabort.Enabled    := False;
            BBprn.Enabled      := False;
            CloseFlag          := True;
            Close;
            Exit;
       end;
  end;
end;

procedure TFpsa30401.MakeTable(Parameter: String);
begin
  try
       sqlstr := 'select count(*) from user_tables      ' + char(13) +
                 ' where table_name = upper(:table_name)';

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(sqlstr);
            ParamByName('table_name').AsString := Parameter;
            Open;
       end;

       if OraQuery1.Fields[0].AsInteger > 0 then
       begin
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('DROP TABLE '+ Parameter );
                 ExecSql;
            end;
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

  try
       with OraQuery1 do
       begin
            sqlstr :=
            'create table                    ' + parameter + char(13) +
            '(                                           ' + char(13) +
            '       empno        varchar2(4),            ' + char(13) +
            '       korname      varchar2(12) not null,  ' + char(13) +
            '       loanamt      number(12,0) default 0, ' + char(13) +
            '       loandate     varchar2(8),            ' + char(13) +
            '       reptodate    varchar2(6),            ' + char(13) +
            '       repcnt       number(2,0)  default 0, ' + char(13) +
            '       beforeamt    number(12,0) default 0, ' + char(13) +
            '       baseamt      number(12,0) default 0, ' + char(13) +
            '       intrateamt   number(12,0) default 0, ' + char(13) +
            '       sumamt       number(12,0) default 0, ' + char(13) +
            '       totalamt     number(12,0) default 0, ' + char(13) +
            '       appdate      varchar2(8),            ' + char(13) +
            '       apptime      varchar2(6),            ' + char(13) +
            '       repmaxmm     number(2,0)  default 0, ' + char(13) +
            '       repcnt2      number(2,0)  default 0, ' + char(13) +
            '       repldate     varchar2(6),            ' + char(13) +
            '       repldate2    varchar2(8),            ' + char(13) +   //jissi
            '       yymm         varchar2(6),            ' + char(13) +  //DSA2000  2015.01. yymm 필드추가
            '       writetime    varchar2(15),           ' + char(13) +
            '       writeman     varchar2(4),            ' + char(13) +
            ' constraint  pk_' + parameter + ' primary key(empno, appdate)' + char(13) +
            ')' + char(13) +
            'STORAGE(INITIAL 100K NEXT 50K MINEXTENTS 1 MAXEXTENTS 121 PCTINCREASE 1)';
            Close;
            Sql.Clear;
            Sql.Add(sqlstr);
            ExecSql;
       end;
  except on  EDataBaseError do
       begin
            Phelpmsg.Caption := ('  임시테이블을 생성할 수 없습니다!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금상환등록', mb_OK);
            CloseFlag := True;
            Close;
            Exit;
       end;
  end;
end;

procedure TFpsa30401.FormCreate(Sender: TObject);
begin
  StartUp := False;
end;

procedure TFpsa30401.FormActivate(Sender: TObject);
var  i : Integer;
     month, year : String;
begin
  if StartUp = True then     Exit;
  StartUp          := True;
  Phelpmsg.Caption := '  종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;
  
  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SDFM             := DateSeparator;
  SetNow;
  Application.ProcessMessages;
  TmpTable         := 'TEMP'+Pempno+Copy(GSsysdate, 1, 8);
  MEdefault.Text   := Copy(GSsysdate, 1, 6) + '25';

  MakeTableOfFlag  := True;
  DayOfBeforeMonth(GSsysdate);
  MakeTableOfFlag  := False;

  Lastreplmonth;

  Phelpmsg.Caption := '  상환작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.DayOfBeforeMonth(Par : String);
var  i : Integer;
     month, year : String;
begin
  if StrToInt(Copy(Par, 5, 2)) = 1 then
  begin
       year := IntToStr(StrToInt(Copy(Par, 1, 4)) - 1);
       month := '12';
  end
  else
  begin
       year := Copy(Par, 1, 4);
       if StrToInt(Copy(Par, 5, 2)) < 11 then month := '0' + IntToStr(StrToInt(Copy(Par, 5, 2)) - 1)
       else                                   month := IntToStr(StrToInt(Copy(Par, 5, 2)) - 1);
  end;
  i := StrToInt(month);

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select max(paydate)||''25'' from pkhphis          ');
       Sql.Add(' where paydate < '''+copy(MEdefault.text,1,6)+''' ');
       Open;
  end;

  if OraQuery1.Fields[0].AsString = '' then
  begin
       MessageBox(Handle,'전월 급여일이 없습니다'+#13#13+
                         '급여의 이력보관 여부를 확인하시기 바랍니다.'+#13#13+
                         '프로그램을 종료합니다', '주의', mb_iconwarning);
       Ppre.Caption       := '';
       BBcalc.Enabled     := False;
       BBonly.Enabled     := False;
       RBempno.Enabled    := False;
       RBloandate.Enabled := False;
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       CloseFlag := True;
       Fpsa30401.Close;//if OraQuery1.Active then Close;
  end
  else
  begin
       Ppre.Caption := Copy(OraQuery1.Fields[0].AsString,1,4)+'-'+
                       Copy(OraQuery1.Fields[0].AsString,5,2)+'-'+
                       Copy(OraQuery1.Fields[0].AsString,7,2);
       if MakeTableOfFlag = True then
       begin
            Phelpmsg.Caption := '  임시테이블 생성중입니다.';
            SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
            MakeTable(TmpTable);
       end;
       Phelpmsg.Caption := '  임시테이블의 자료를 재구축합니다.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       ReplaceData(TmpTable);
       QueryOfWant(TmpTable);
       CalcOfIntrate(Copy(Trim(Ppre.Caption), 1, 4)+
                     Copy(Trim(Ppre.Caption), 6, 2)+
                     Copy(Trim(Ppre.Caption), 9, 2));
  end;
end;

procedure TFpsa30401.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CloseFlag = True then
  begin
       try
            with OraQuery1 do
            begin
              Close;
              Sql.Clear;
              Sql.Add('DROP TABLE '+ TmpTable );
              ExecSql;
            end;
       Except On E : EDataBaseError do
            CanClose := True;
       end;
       CanClose := True;
  end
  else
  begin
       if ID_YES = MessageBox(Handle,'종료하시겠습니까?','종료', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
       begin
            try
                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('DROP TABLE '+ TmpTable );
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

procedure TFpsa30401.BBcloseClick(Sender: TObject);
begin
  CloseFlag := False;
  Close;
end;

procedure TFpsa30401.CalcOfIntrate(Parameter: String);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT INTRATE FROM PSCLOANS WHERE YYMM = '''+Copy(MEdefault.Text,1, 6)+''' ');
       Open;
       if   RecordCount > 0 then IntrateOf := Fields[0].AsFloat
       else                      IntrateOf := 0;

       Close;
       Sql.Clear;
       Sql.Add(' SELECT TO_DATE(:KIJUN, ''YYYYMMDD'') - TO_DATE(:BEFOR, ''YYYYMMDD'') ');
       Sql.Add('   FROM DUAL                                                          ');
       ParamByName('KIJUN').AsString := MEdefault.Text;
       ParamByName('BEFOR').AsString := parameter;
       Open;
       if RecordCount > 0 then DayCount := Fields[0].AsInteger
       else                    DayCount := 0;
  end;
end;

procedure TFpsa30401.QueryOfWant(Parameter: String);
begin
  with OraQuery2 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT EMPNO F_EMPNO, KORNAME F_KORNAME, LOANAMT F_LOANAMT,           ');
       Sql.Add('       LOANDATE F_LOANDATE, REPTODATE F_REPTODATE,                    ');
       Sql.Add('       REPCNT F_REPCNT, BEFOREAMT F_BEFOREAMT, BASEAMT F_BASEAMT,     ');
       Sql.Add('       INTRATEAMT F_INTRATEAMT, SUMAMT F_SUMAMT, TOTALAMT F_TOTALAMT, ');
       Sql.Add('       REPMAXMM F_REPMAXMM, APPDATE F_APPDATE                         ');
       Sql.Add('  FROM '+Parameter                                                     );
       if RBempno.Checked then
            Sql.Add('  ORDER BY EMPNO, LOANDATE                                       ')
       else
            Sql.Add('  ORDER BY LOANDATE, EMPNO                                       ');
       Open;
       if RecordCount > 0 then
       begin
            PersonOf       := RecordCount;
            BBonly.Enabled := True;
       end
       else
       begin
            PersonOf := 0;
            BBonly.Enabled := True;
       end;
  end;
end;

procedure TFpsa30401.BBcalcClick(Sender: TObject);
begin
  if IntRateOf = 0 then
  begin
       showmessage('기준등록이 되어 있지 않습니다. 다시 등록해 주세요.');
       exit;
  end;

  SelectOfGubun    := '';
  BaseAmt          := 0;
  IntrateAmt       := 0;
  Phelpmsg.Caption := '  상환금 계산중입니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
  Setnow;
  CalcOfIntrate(Copy(Trim(Ppre.Caption), 1, 4) +
                Copy(Trim(Ppre.Caption), 6, 2) +
                Copy(Trim(Ppre.Caption), 9, 2));
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('UPDATE '+TmpTable+' A SET                                                            ');
       Sql.Add('       BASEAMT    = TRUNC(LOANAMT / REPMAXMM) ,                                      ');
       //Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * :Parameter2) ,                                 ');    //DSA20000  2015.01 기준테이블 조인하여 계산토록 변경.
       //Sql.Add('       SUMAMT     = TRUNC((LOANAMT / REPMAXMM)) + TRUNC((BEFOREAMT * :Parameter2)) , ');
       Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2 ),');
       Sql.Add('       SUMAMT     = TRUNC((LOANAMT / REPMAXMM)) + TRUNC((BEFOREAMT * (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2)) , ');

       Sql.Add('       TOTALAMT   = BEFOREAMT - TRUNC((LOANAMT / REPMAXMM)) ,                        ');
       Sql.Add('       REPCNT2    = NVL(REPCNT,0) + 1,                                               ');
       Sql.Add('       REPLDATE   = '''+Copy(MEdefault.Text,1,6)+''' ,                               ');
       Sql.Add('       REPLDATE2  = '''+Copy(MEdefault.Text,1,8)+''' ,                               '); //jissi
       Sql.Add('       WRITETIME  = '''+Copy(GSsysdate,1,15)+''' ,                                   ');
       Sql.Add('       WRITEMAN   = '''+Pempno+'''                                                   ');
       //ParamByName('Parameter2').AsFloat := IntRateOf * Daycount / 365;
       ParamByName('Parameter2').AsFloat := Daycount / 365;
       ExecSql;
              
       Close;
       Sql.Clear;
       Sql.Add('UPDATE '+TmpTable+' SET                                                              ');
       Sql.Add('       BASEAMT    = 285000 ,                                                         ');
       Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * :Parameter2) ,                                 ');
       Sql.Add('       SUMAMT     = 285000 + TRUNC((BEFOREAMT * :Parameter2)) ,                      ');
       Sql.Add('       TOTALAMT   = BEFOREAMT - 285000,                                              ');
       Sql.Add('       REPCNT2    = NVL(REPCNT,0) + 1,                                               ');
       Sql.Add('       REPLDATE   = '''+Copy(MEdefault.Text,1,6)+''' ,                               ');
       Sql.Add('       REPLDATE2  = '''+Copy(MEdefault.Text,1,8)+''' ,                               '); //jissi
       Sql.Add('       WRITETIME  = '''+Copy(GSsysdate,1,15)+''' ,                                   ');
       Sql.Add('       WRITEMAN   = '''+Pempno+'''                                                   ');
       Sql.Add(' WHERE EMPNO      = ''0665''                                                         ');
       Sql.Add('   AND LOANDATE   = ''20110425''                                                     ');
       //ParamByName('Parameter2').AsFloat := IntRateOf * Daycount / 365;
       ParamByName('Parameter2').AsFloat := 0.04 * Daycount / 365;                                    //DSA2000 2015.01.
       ExecSql;
  end;

  //DSA20000  2015.01 기준테이블 조인하여 계산토록 변경.
  sqlstr := 'update ' + TmpTable + ' A                ' + char(13) +
            '   set intrateamt                        ' + char(13) +
 //           '     = (select floor(A.LoanAmt * (:intrate * (to_date(:basedate,''yyyymmdd'')-to_date(B.loandate,''yyyymmdd'')+1)/365))' + char(13) +
            '     = (select floor(A.LoanAmt * ((SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * (to_date(:basedate,''yyyymmdd'')-to_date(B.loandate,''yyyymmdd'')+1)/365))' + char(13) +
            '          from psmloan B                 ' + char(13) +
            '         where A.empno   = B.empno       ' + char(13) +
            '           and A.appdate = B.appdate)    ' + char(13) +
            ' where nvl(repcnt,0) = 0                 ' + char(13) +
            '   and (empno, appdate) in (select empno, appdate from psmloan)';
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(sqlstr);
//       ParamByName('intrate').AsFloat   := IntRateOf;
       ParamByName('basedate').AsString := MEdefault.Text;
       ExecSql;
  end;

  sqlstr := 'update '+ TmpTable                                    + char(13) +
            '   set sumamt = floor(LOANAMT/REPMAXMM) + intrateamt' + char(13) +
            ' where nvl(repcnt,0) = 0                            ' ;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(sqlstr);
       ExecSql;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('UPDATE '+TmpTable+' A SET                                          ');
       Sql.Add('       BASEAMT    = BEFOREAMT ,                                    ');
       //Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * :Parameter2) ,               ');  //DSA20000  2015.01 기준테이블 조인하여 계산토록 변경.
       //Sql.Add('       SUMAMT     = BEFOREAMT + TRUNC((BEFOREAMT * :Parameter2)) , ');
       Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2) ,               ');
       Sql.Add('       SUMAMT     = BEFOREAMT + TRUNC((BEFOREAMT * (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2)) , ');
       
       Sql.Add('       TOTALAMT   = 0 ,                                            ');
       Sql.Add('       REPCNT2    = NVL(REPCNT,0) + 1,                             ');
       Sql.Add('       REPLDATE   = '''+Copy(MEdefault.Text,1,6)+''' ,             ');
       Sql.Add('       REPLDATE2  = '''+Copy(MEdefault.Text,1,8)+''' ,             '); //jissi
       Sql.Add('       WRITETIME  = '''+Copy(GSsysdate,1,15)+''' ,                 ');
       Sql.Add('       WRITEMAN   = '''+Pempno+'''                                 ');
       Sql.Add(' WHERE REPCNT2    = REPMAXMM                                       ');
//       ParamByName('Parameter2').AsFloat := IntRateOf * Daycount / 365;
       ParamByName('Parameter2').AsFloat := Daycount / 365;
       ExecSql;

  end;
  QueryOfWant(TmpTable);
  Psum.Caption := '총 '+Format('%4.0n', [StrToFloat(IntToStr(PersonOf))]) + ' 건';
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT SUM(BASEAMT), SUM(INTRATEAMT), SUM(SUMAMT) ' );
       Sql.Add(' FROM   '+TmpTable                                  );
       Open;
       P1.Caption      := Format('%15.0n', [Fields[0].AsFloat]);
       P2.Caption      := Format('%15.0n', [Fields[1].AsFloat]);
       Pallsum.Caption := Format('%15.0n', [Fields[2].AsFloat]);
  end;
  Phelpmsg.Caption := '  상환금계산이 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.RBempnoClick(Sender: TObject);
begin
  BaseAmt    := 0;
  IntrateAmt := 0;
  QueryOfWant(TmpTable);
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.MEdefaultExit(Sender: TObject);
begin
  if DateCheck(Copy(MEdefault.Text,1,4),Copy(MEdefault.Text,5,2),Copy(MEdefault.Text,7,2))= -1 then
  begin
       MessageBox(Handle,'상환기준일 확인바랍니다', '일자오류', mb_iconwarning);
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       MEdefault.SetFocus;
       Exit;
  end;
  P1.Caption      := '';
  P2.Caption      := '';
  Psum.Caption    := '';
  Pallsum.Caption := '';
  SelectOfGubun   := '';
  DayOfBeforeMonth(Trim(MEdefault.Text));
end;

procedure TFpsa30401.BBonlyClick(Sender: TObject);
begin
 with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select max(repldate2) from psdrepay            ');
       Sql.Add(' where repldate <= to_char(sysdate,''YYYYMM'') ');
       Open;
  end;
  Lastrepldate := OraQuery1.Fields[0].AsString;

  if LastRepldate >= Copy(GSsysdate, 1, 6) + '25' then
  begin
        Messagedlg('상환기준일('+LastRepldate+')의 사우회 대출 상환 등록 작업이 이미 되어 있습니다.'+#13#13+
                  '다시 작업하시려면 상환취소버튼을 눌러 상환취소후 작업해 주시기 바랍니다.', mtWarning	,[mbOk], 0);
       exit;
  end;

  SelectOfGubun := '일시';
  if OraQuery2F_EMPNO.AsString = '' then
  begin
       Phelpmsg.Caption := '  사원을 선택하세요.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       Exit;
  end
  else
  begin
       try
            Fpsa30402 := TFpsa30402.Create(Self);
            Fpsa30402.ShowModal;
            if Fpsa30402.GSclose <> -1 then
            begin
                 Phelpmsg.Caption := '  일시상환 계산중입니다.';
                 SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
//          일시상환시 이자계산개시일이 바뀔 수 있기 때문에...
//                 CalcOfIntrate(Fpsa30402.MEdate_1.Text);
                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('SELECT INTRATE FROM PSCLOANS WHERE YYMM = '''+Copy(MEdefault.Text,1, 6)+''' ');
                      Open;
                      if   RecordCount > 0 then IntrateOf := Fields[0].AsFloat
                      else                      IntrateOf := 0;

                      Close;
                      Sql.Clear;
                      Sql.Add(' SELECT TO_DATE(:KIJUN, ''YYYYMMDD'') - TO_DATE(:BEFOR, ''YYYYMMDD'')  ');
                      Sql.Add('   FROM DUAL                                                           ');
                      ParamByName('KIJUN').AsString    := Fpsa30402.MEdate_1.Text;
                      ParamByName('BEFOR').AsString    := copy(Ppre.Caption,1,4)+
                                                          copy(Ppre.Caption,6,2)+
                                                          copy(Ppre.Caption,9,2);
                      Open;
                      if RecordCount > 0 then DayCount := Fields[0].AsInteger
                      else                    DayCount := 0;
                 end;

                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('UPDATE '+TmpTable+' SET                                             ');
                      Sql.Add('       BASEAMT    = :Parameter1 ,                                   ');
                      //Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT * :Parameter2) ,                ');   //DSA20000  2015.01 기준테이블 조인하여 계산토록 변경.
                      //Sql.Add('       SUMAMT     = :Parameter1 + TRUNC((BEFOREAMT * :Parameter2)), ');
                      Sql.Add('       INTRATEAMT = TRUNC(BEFOREAMT *  (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2) ,               '); //DSA2000 2015.01
                      Sql.Add('       SUMAMT     = :Parameter1 + TRUNC((BEFOREAMT * (SELECT INTRATE FROM PSCLOANS WHERE YYMM=A.YYMM) * :Parameter2)), '); //DSA2000 2015.01
                      
                      Sql.Add('       TOTALAMT   = :Parameter4 ,                                   ');
                      Sql.Add('       REPCNT2    = NVL(REPCNT,0) + 1,                              ');
                      Sql.Add('       REPLDATE   = '''+Copy(MEdefault.Text,1,6)+''' ,              ');
                      Sql.Add('       REPLDATE2  = '''+Copy(Fpsa30402.MEdate_1.Text,1,8)+''' ,     ');     //jissi
                      Sql.Add('       WRITETIME  = '''+Copy(GSsysdate,1,15)+''' ,                  ');
                      Sql.Add('       WRITEMAN   = '''+Pempno+'''                                  ');
                      Sql.Add(' WHERE EMPNO      = '''+OraQuery2F_EMPNO.AsString+'''               ');
                      Sql.Add('   AND APPDATE    = '''+OraQuery2F_APPDATE.AsString+'''             ');
                      ParamByName('Parameter1').AsFloat := OraQuery2F_BEFOREAMT.AsFloat;
                      //ParamByName('Parameter2').AsFloat := IntRateOf * Daycount / 365;
                      ParamByName('Parameter2').AsFloat := Daycount / 365;
                      ParamByName('Parameter4').AsFloat := 0;
                      ExecSql;
                 end;
                 QueryOfWant(TmpTable);
                 with OraQuery1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add('SELECT SUM(BASEAMT), SUM(INTRATEAMT), SUM(SUMAMT) ' );
                      Sql.Add('  FROM '+TmpTable                                   );
                      Open;
                      P1.Caption      := Format('%15.0n', [Fields[0].AsFloat]);
                      P2.Caption      := Format('%15.0n', [Fields[1].AsFloat]);
                      Pallsum.Caption := Format('%15.0n', [Fields[2].AsFloat]);
                 end;
                 Phelpmsg.Caption := '  일시상환작업이 완료되었습니다.';
                 SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
            end;
       except on  EDataBaseError do
            begin
                 Phelpmsg.Caption := ('  임시테이블의 자료를 재구축할 수 없습니다!');
                 Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                        #13+#13+'    전산담당자 또는 개발자와 상의하십시요',
                                        '사우회 대출금상환등록', mb_OK);
                 Exit;
            end;
       end;
  end;
end;

procedure TFpsa30401.BBsaveClick(Sender: TObject);
begin
  if DateCheck(Copy(MEdefault.Text,1,4),Copy(MEdefault.Text,5,2),Copy(MEdefault.Text,7,2))= -1 then
  begin
       MessageBox(Handle,'상환기준일 확인바랍니다', '일자오류', mb_iconwarning);
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       Exit;
  end;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NVL(SUM(BASEAMT),0), NVL(SUM(INTRATEAMT),0) ');
       Sql.Add('  FROM '+Tmptable                                   );
       Open;
  end;

  if Copy(MEdefault.Text, 1, 6) <> Copy(GSsysdate, 1, 6) then
  begin
       MessageBox(Handle,'기준일의 년월은 반드시 현재 월이여야 합니다', '일자오류', mb_iconwarning);
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       MEdefault.SetFocus;
       Exit;
  end;

  if (OraQuery1.Fields[0].AsFloat = 0) and (OraQuery1.Fields[1].AsFloat = 0) then
  begin
       MessageBox(Handle,'상환작업을 먼저 실행하세요', '저장주의', mb_iconwarning);
       Exit;
  end;
  Phelpmsg.Caption := '  저장중입니다. 잠시만 기다려주세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT * FROM psmloan         ');
       Sql.Add(' WHERE repldate= :v_repldate  ');
       Sql.Add('   AND ENDYN <> ''Y''         '); //jissi

       ParamByName('v_repldate').AsString := Copy(Medefault.Text,1,6);
       Open;
  end;

  if OraQuery1.RecordCount>0 then
  begin
       showmessage('상환취소후 저장해 주세요.');
       exit;
  end;

  Try  //
       with OraQuery1 do
       begin
         Close;
         Sql.Clear;
         Sql.Add('UPDATE PSMLOAN A SET                                    ');
         Sql.Add('       (  JANAMT,                                       ');
         Sql.Add('          REPCNT,                                       ');
         Sql.Add('          REPLDATE,                                     ');
         Sql.Add('          WRITETIME,                                    ');
         Sql.Add('          WRITEMAN   )                                  ');
         Sql.Add('= (SELECT BEFOREAMT - BASEAMT,                          ');
         Sql.Add('          REPCNT2 ,                                     ');
         Sql.Add('          REPLDATE,                                     ');
         Sql.Add('          WRITETIME,                                    ');
         Sql.Add('          WRITEMAN                                      ');
         Sql.Add('     FROM '+Tmptable+' B                                ');
         Sql.Add('    WHERE A.EMPNO = B.EMPNO AND A.APPDATE = B.APPDATE)  ');
         Sql.Add(' WHERE ENDYN <> ''Y'' AND NVL(JANAMT,0) > 0             ');
         Sql.Add('   AND A.REPFRDATE IS NOT NULL                          ');
         Sql.Add('   AND A.REPFRDATE <= '''+MEdefault.Text+'''            ');
         ExecSql;
       end;
       with OraQuery1 do begin
         Close;
         Sql.Clear;
         Sql.Add('UPDATE PSMLOAN A SET        ');
         Sql.Add('       ENDYN = ''Y''        ');
         Sql.Add(' WHERE NVL(JANAMT,0) = 0    ');
         Sql.Add('   AND LOANDATE IS NOT NULL ');
         ExecSql;
       end;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO PSDREPAY     ');
            Sql.Add('        (   EMPNO,       ');
            Sql.Add('            REPLDATE,    ');
            Sql.Add('            APPDATE,     ');
            Sql.Add('            REPLDATE2,   ');
            Sql.Add('            REPCNT,      ');
            Sql.Add('            REPAMT,      ');
            Sql.Add('            REPINT,      ');
            Sql.Add('            WRITETIME,   ');
            Sql.Add('            WRITEMAN )   ');
            Sql.Add('     SELECT EMPNO,       ');
            Sql.Add('            REPLDATE ,   ');
            Sql.Add('            APPDATE,     ');
            Sql.Add('            REPLDATE2,   ');  //jissi
            Sql.Add('            REPCNT2,     ');
            Sql.Add('            BASEAMT,     ');
            Sql.Add('            INTRATEAMT,  ');
            Sql.Add('            WRITETIME ,  ');
            Sql.Add('            WRITEMAN     ');
            Sql.Add('  FROM '+ Tmptable+' B   ');
            Sql.Add(' WHERE  B.SUMAMT > 0     ');
            ExecSql;
       end;
  Except On E : EDataBaseError do
       begin
            StrPCopy(DBErrMsg, E.Message);
            if Pos('ORA-00001', DBErrMsg) > 0 then
                 Application.MessageBox(' 기존 테이블에 자료가 저장되어 있습니다.'+
                          #13#10+#13#10+'                 확인바랍니다.',
                                        '사우회 대출금상환등록', mb_OK)
            else
                 Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                #13+#13+'    전산담당자 또는 개발자와 상의하십시요',
                                        '사우회 대출금상환등록', mb_OK);
            Phelpmsg.Caption := '  저장작업중 오류가 발생했습니다.';
            SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
            Exit;
       end;
  end;
  BBabortClick(Self);
  Lastreplmonth;
  Phelpmsg.Caption := '  저장작업이 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.BBabortClick(Sender: TObject);
begin
  P1.Caption       := '';
  P2.Caption       := '';
  Psum.Caption     := '';
  Pallsum.Caption  := '';
  SelectOfGubun    := '';
  MEdefault.Text   := Copy(GSsysdate, 1, 6) + '25';
  RBempno.Checked  := True;
  DayOfBeforeMonth(Trim(MEdefault.Text));
//  ReplaceData(TmpTable);
//  OraQueryOfWant(TmpTable);
  Phelpmsg.Caption := '  상환작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.SB1Click(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  try
       Calendar.ShowModal;
       if Calendar.DayCaption <> '' then
       begin
            MEdefault.Text := Calendar.DayCaption;
            MEdefaultExit(Self);
       end;
  finally
       Calendar.Free;
  end;
end;

procedure TFpsa30401.BBcan1Click(Sender: TObject);
var  temp1 : String;
     DateOf : String;
     i : integer;
begin
  with OraQuery3 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT MAX(REPLDATE) FROM PSDREPAY ');
       Open;
  end;
  temp1  := OraQuery3.Fields[0].AsString;
  DateOf := Copy(temp1, 1, 4) + '-' + Copy(temp1, 5, 2)+
           ' 상환처리한 자료를 취소하시겠습니까?';
  if ID_YES <> MessageBox(Handle,Pchar(DateOf),'상환취소', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
  begin
       Phelpmsg.Caption := '  상환작업을 시작하세요.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       Exit;
  end;
  Setnow;
  Phelpmsg.Caption := '  대출만기자테이블에서 가져온 자료를 갱신합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

  try
       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO PSMLOAN                                                         ');
            Sql.Add('       (SELECT A.EMPNO, A.APPDATE, A.APPTIME, A.PAYCL, A.STDAMT, A.REPMM1,  ');
            Sql.Add('              A.MAXAMT, A.REPMM2, A.BANK, A.BANKACT, A.APPFLAG, A.YYMM,     ');
            Sql.Add('              A.LOANDATE, A.LOANAMT, A.REPMAXMM, A.REPFRDATE, A.REPTODATE,  ');
            Sql.Add('              A.JANAMT, A.REPLDATE, A.REPCNT, A.ENDYN,                      ');
            Sql.Add('              A.WRITETIME, A.WRITEMAN, A.TELNO                              ');
            Sql.Add('         FROM PSHLOAN A                                                     ');
            Sql.Add('        WHERE A.REPLDATE = '''+temp1+''' )                                  ');
            ExecSql;
       end;

       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO PSDREPAY                                                  ');
            Sql.Add('       (SELECT A.EMPNO, A.REPLDATE, A.APPDATE, A.REPLDATE2,           ');
            Sql.Add('               A.REPCNT, A.REPAMT, A.REPINT, A.WRITETIME, A.WRITEMAN  ');
            Sql.Add('          FROM PSHREPAY A, PSHLOAN B                                  ');
            Sql.Add('         WHERE B.REPLDATE = '''+temp1+''' AND                         ');
            Sql.Add('               B.EMPNO = A.EMPNO AND B.APPDATE = A.APPDATE)           ');
            ExecSql;
       end;

       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE PSHREPAY C WHERE (C.EMPNO, C.APPDATE) IN                   ');
            Sql.Add('       (SELECT A.EMPNO, A.APPDATE                                 ');
            Sql.Add('          FROM PSHREPAY A, PSHLOAN B                              ');
            Sql.Add('         WHERE B.REPLDATE = '''+temp1+''' AND                     ');
            Sql.Add('               B.EMPNO = A.EMPNO AND B.APPDATE = A.APPDATE)       ');
            ExecSql;
       end;

       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE PSHLOAN WHERE REPLDATE = '''+temp1+''' ');
            ExecSql;
       end;

       Phelpmsg.Caption := '  대출신청지급테이블을 갱신합니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       i := 0;
       OraQuery3.Close;
       OraQuery3.Sql.Clear;
       OraQuery3.Sql.Add('select * from  PSMLOAN          ');
       OraQuery3.Sql.Add(' WHERE REPLDATE = '''+temp1+''' ');
       OraQuery3.Open;
       while not OraQuery3.EOF do
       begin
            inc(i);
            Phelpmsg.Caption := inttostr(i) +'/'+ inttostr(OraQuery3.recordcount);
            SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
            OraQuery1.Close;
            OraQuery1.Sql.Clear;
            OraQuery1.SQL.Add(' UPDATE PSMLOAN                                                                       ');
            OraQuery1.Sql.Add('  SET JANAMT = (SELECT SUM(NVL(B.REPAMT + A.JANAMT, A.JANAMT))                        ');
            OraQuery1.Sql.Add('                  FROM PSDREPAY B, PSMLOAN A                                          ');
            OraQuery1.Sql.Add('                 WHERE A.REPLDATE = '''+temp1+'''                                     ');
            OraQuery1.Sql.Add('                   AND A.REPLDATE = B.REPLDATE                                        ');
            OraQuery1.Sql.Add('                   AND A.EMPNO = '''+OraQuery3.fieldbyname('empno').asstring+'''      ');
            OraQuery1.Sql.Add('                   AND A.EMPNO = B.EMPNO                                              ');
            OraQuery1.Sql.Add('                   AND A.APPDATE = '''+OraQuery3.fieldbyname('appdate').asstring+'''  ');
            OraQuery1.Sql.Add('                   AND A.APPDATE = B.APPDATE),                                        ');
            OraQuery1.Sql.Add('      ENDYN     = ''N'',                                                              ');
            OraQuery1.Sql.Add('      REPCNT    = NVL(REPCNT,0) - 1,                                                  ');
            OraQuery1.Sql.Add('      REPLDATE  = TO_CHAR(ADD_MONTHS(TO_DATE(REPLDATE, ''YYYYMM''), -1), ''YYYYMM''), ');
            OraQuery1.Sql.Add('      WRITETIME = '''+Copy(GSsysdate,1,15)+''',                                       ');
            OraQuery1.Sql.Add('      WRITEMAN  = '''+Pempno+'''                                                      ');
            OraQuery1.Sql.Add(' WHERE REPLDATE = '''+temp1+'''                                                       ');
            OraQuery1.Sql.Add('   AND EMPNO    = '''+OraQuery3.fieldbyname('empno').asstring+'''                     ');
            OraQuery1.Sql.Add('   AND APPDATE  = '''+OraQuery3.fieldbyname('appdate').asstring+'''                   ');
            OraQuery1.ExecSql;
            OraQuery3.next;
       end;
(*
       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN B SET                                                    ');
            Sql.Add('B.JANAMT = (SELECT NVL(A.REPAMT + B.JANAMT, B.JANAMT) FROM PSDREPAY A   ');
            Sql.Add('            WHERE  A.REPLDATE = '''+temp1+''' AND A.EMPNO = B.EMPNO AND ');
            Sql.Add('                   A.APPDATE = B.APPDATE ) ,                            ');
//            Sql.Add('                   A.REPLDATE = B.REPLDATE AND ),                       ');
            Sql.Add('B.ENDYN = ''N'',                                                        ');
            Sql.Add('B.REPCNT = NVL(B.REPCNT,0) - 1 ,                                               ');
            Sql.Add('B.REPLDATE = TO_CHAR(ADD_MONTHS(TO_DATE(B.REPLDATE, ''YYYYMM''), -1), ''YYYYMM'') ');
            Sql.Add(',B.WRITETIME = '''+Copy(GSsysdate,1,15)+''' ,                           ');
            Sql.Add('B.WRITEMAN = '''+GSempno+'''                                            ');
            Sql.Add('WHERE B.REPLDATE = '''+temp1+'''                                        ');
            ExecSql;
       end;
*)
       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PSMLOAN                                ');
            Sql.Add('   SET REPLDATE = '' '',                      ');
            Sql.Add('       REPCNT   = TO_NUMBER(''0''),           ');
            Sql.Add('       JANAMT   = LOANAMT                     ');
            Sql.Add(' WHERE SUBSTR(LOANDATE, 1, 6) = '''+temp1+''' ');
            ExecSql;
       end;

       Phelpmsg.Caption := '  대출상환테이블에서 조건에 맞는 자료를 삭제합니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       with OraQuery3 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE PSDREPAY WHERE REPLDATE = '''+temp1+''' ');
            ExecSql;
       end;

  Except on  EDataBaseError do
       begin
       {
            Phelpmsg.Caption := ('  작업을 진행할 수 없습니다!');
            Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                                   #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                                   #13+#13+'                     종료합니다',
                                   '사우회 대출금상환등록', mb_OK);
        }
            Exit;
       end;
  end;
  MEdefault.Text   := Copy(GSsysdate, 1, 6) + '25';
  ReplaceData(TmpTable);
  QueryOfWant(TmpTable);
  Psum.Caption     := '';
  P1.Caption       := '';
  P2.Caption       := '';
  Pallsum.Caption  := '';
//  BBcalcClick(Self);

  Lastreplmonth;
  Phelpmsg.Caption := '  상환취소작업이 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.BBlastClick(Sender: TObject);
begin
  FPsa30403.ShowModal;
end;

procedure TFpsa30401.MEdefaultKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Key := #0;
       MEdefaultExit(Self);
  end;
end;

procedure TFpsa30401.MEdefaultEnter(Sender: TObject);
begin
  Phelpmsg.Caption := '  입력후 ENTER KEY 나 TAB KEY 를 누르시면 결과가 반영됩니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30401.Lastreplmonth;
var Sql : String;
Begin
  with OraQuery3 do
  begin
    Close;
    Sql.Clear;
    SQL.ADD('SELECT MAX(REPLDATE) FROM PSDREPAY            ');
    SQL.ADD(' WHERE REPLDATE <= TO_CHAR(SYSDATE,''YYYYMM'') ');

    Open;
  end;
  MEmonth.Text := OraQuery3.Fields[0].AsString;
End;

end.


