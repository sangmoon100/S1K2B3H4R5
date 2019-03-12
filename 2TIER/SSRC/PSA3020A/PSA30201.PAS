{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출신청등록
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.03
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
   1.03  98.05.04     김한경        전산처리요청서             대출순위 및 대출예정월 조회
-------------------------------------------------------------------------------}
unit Psa30201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, DBAccess, MemDS, Ora, Func;

type
  TFpsa30201 = class(TForm)
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
    BBsimm1: TBitBtn;
    BBsimm2: TBitBtn;
    BBupdate: TBitBtn;
    SGsimm: TStringGrid;
    Panel12: TPanel;
    Panel6: TPanel;
    Pperiod: TPanel;
    Panel10: TPanel;
    Pempdate: TPanel;
    Panel14: TPanel;
    Ppaycl: TPanel;
    Panel16: TPanel;
    Pankorname: TPanel;
    SpeedButton1: TSpeedButton;
    Eempno: TEdit;
    Panel18: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Pappdate: TPanel;
    Pperson: TPanel;
    Panel20: TPanel;
    GroupBox1: TGroupBox;
    Panel21: TPanel;
    NEstdamt: TNumberEdit;
    Panel22: TPanel;
    CBrepmm1: TComboBox;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Panel23: TPanel;
    NEmaxamt: TNumberEdit;
    Panel24: TPanel;
    CBrepmm2: TComboBox;
    Ebankcode: TEdit;
    SpeedButton2: TSpeedButton;
    Pbankname: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    Ebankacnt: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel5: TPanel;
    Pmax_a: TPanel;
    Pshow: TPanel;
    BBdelete: TBitBtn;
    Panel7: TPanel;
    Etelno: TEdit;
    Panel11: TPanel;
    Panel13: TPanel;
    P_ord: TPanel;
    P_loanym: TPanel;
    OraQuery1: TOraQuery;
    OraQuery1F_EMPNO: TStringField;
    OraQuery1F_KORNAME: TStringField;
    OraQuery1F_PAYCL: TStringField;
    OraQuery1F_ORGNUM: TStringField;
    OraQuery1F_DEPTCODE: TStringField;
    OraQuery1F_EMPDATE: TStringField;
    OraQuery1F_PAYBANK: TStringField;
    OraQuery1F_PAYACNT: TStringField;
    OraQuery1F_BONCODE: TStringField;
    OraQuery1F_APPDATE: TStringField;
    OraQuery1F_STDAMT: TFloatField;
    OraQuery1F_REPMM1: TIntegerField;
    OraQuery1F_MAXAMT: TFloatField;
    OraQuery1F_REPMM2: TIntegerField;
    OraQuery1F_APPFLAG: TStringField;
    OraQuery1F_JANAMT: TFloatField;
    OraQuery1F_TELNO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure EbankcodeChange(Sender: TObject);
    procedure EbankcodeKeyPress(Sender: TObject; var Key: Char);
    procedure EbankcodeExit(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NEstdamtExit(Sender: TObject);
    procedure NEmaxamtExit(Sender: TObject);
    procedure BBsimm1Click(Sender: TObject);
    procedure SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BBsimm2Click(Sender: TObject);
    procedure BBupdateClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBabortClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EempnoEnter(Sender: TObject);
    procedure CBrepmm1Exit(Sender: TObject);
    procedure CBrepmm2Exit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EempnoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FlagBox, FlagPmax, FlagOfClose : Boolean;
    FlagOfButton, DBFlag : Boolean;
    GradeOfUser, GSboncode, ButtonOfupdate, GSpaycl, GSyymm : String;
    GRtotalamt, GSamount, GSintrate, GSremain, GSlimitamt, CompOf1, CompOf2 : Real;
    GSmonth : Integer;
    Cur_yymm,next_yymm: String;      // 대출기준의 기준년월(당일을 기준으로)
    sum_limitamt,sum_limitamt1: Double;  // 97.03부터의 sum(총 대출한도금액)
    sum_loanamt: Double;  // 지금까지의 대출금총액
    sum_appamt: Double;   // 직전신청자까지 기준신청금액 sum
    DBErrMsg : Array[0..255] of char;
    procedure DBgridShow(Parameter: String);
    procedure SumOfTable;
    procedure InitOfStart;
    function CheckOfMember(Parameter: String): Boolean;
    function CaclOfMonth(Param1, Param2 : String): Integer;
    procedure EempnoOfChange(Parameter: String);
    Procedure TitleOfStringGrid;
    procedure DBgridOfCalc(ValueOfstdamt: Real; ValueOfrepmm: String);
    procedure PmaxOf(Parameter : String);
    Procedure InitOfStringGrid;
    procedure Loanym_ord;  // 대출순위 및 대출예정월 (98.05.04 수정된 Routine)
  public
    { Public declarations }
  end;

var
  Fpsa30201: TFpsa30201;

implementation

uses Iempnod3, Ibank;
{$R *.DFM}


procedure TFpsa30201.FormCreate(Sender: TObject);
begin
  Phelpmsg.Caption := '  초기화 설정중입니다.  잠시만 기다려 주세요.';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,4,1);
end;

// 사원들이 대출하기로한 총합(대출이 아직 안된 자료만)
procedure TFpsa30201.SumOfTable;
var
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT SUM(STDAMT) FROM PSMLOAN                                   ');
            Sql.Add('WHERE (LOANDATE IS NULL                                           ');
            Sql.Add('  AND  SUBSTR(APPDATE,1,6) < :APPDATE                             ');
            Sql.Add('  AND  APPFLAG = ''2'' )                                          ');
            Sql.Add('   OR (LOANDATE IS NULL     AND APPFLAG = ''1'' )                 ');
            Sql.Add('   OR (LOANDATE IS NOT NULL AND SUBSTR(LOANDATE,1,6) = :LOANDATE) ');
            ParamByName('APPDATE').AsString  := Copy(Fn_GetDateTimeStr,1,6);
            ParamByName('LOANDATE').AsString := GSyymm;
            Open;
            GRtotalamt := Fields[0].AsFloat;
       end;
  finally
       qq.Free;
  end;
end;

// DBGRID에 뿌려줌
procedure TFpsa30201.DBgridShow(Parameter: String);
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.EMPNO   F_EMPNO,   A.KORNAME  F_KORNAME, A.PAYCL   F_PAYCL,  ');
       Sql.Add('       A.ORGNUM  F_ORGNUM,  A.DEPTCODE F_DEPTCODE,                    ');
       Sql.Add('       A.EMPDATE F_EMPDATE, B.BANK     F_PAYBANK, B.BANKACT F_PAYACNT,');
       Sql.Add('       A.BONCODE F_BONCODE, B.APPDATE  F_APPDATE, B.STDAMT  F_STDAMT, ');
       Sql.Add('       B.REPMM1  F_REPMM1,  B.MAXAMT   F_MAXAMT,  B.REPMM2  F_REPMM2, ');
       Sql.Add('       B.APPFLAG F_APPFLAG, B.JANAMT   F_JANAMT,  B.TELNO   F_TELNO   ');
       Sql.Add('  FROM PKMPMAS A, PSMLOAN B                                           ');
       Sql.Add(' WHERE A.EMPNO = :EMPNO                                               ');
       Sql.Add('   AND B.EMPNO = :EMPNO                                               ');
       Sql.Add('   AND B.LOANDATE IS NULL                                             ');
       Sql.Add(' ORDER BY B.APPDATE DESC                                              ');
       ParamByName('EMPNO').AsString := Parameter ;
       Open;
       
       // 데이타가 없으면 접근금지
       if RecordCount <= 0 then
       begin
            if DBFlag = False then Phelpmsg.Caption := '  새로운 신청등록을 하세요.';
            Application.ProcessMessages;
            NEstdamt.Enabled  := True;
            NEmaxamt.Enabled  := True;
            Ebankcode.Enabled := True;
            Ebankacnt.Enabled := True;
            Etelno.Enabled    := True;
            Pperson.Tag       := 0;
            ButtonOfupdate    := '저장';
            BBdelete.Enabled  := False;
            BBupdate.Enabled  := True;
       end
       else
       begin
            Pperson.Tag          := 1;
            NEstdamt.Enabled     := False;
            NEmaxamt.Enabled     := False;
            Ebankcode.Enabled    := True;
            Ebankacnt.Enabled    := True;
            Etelno.Enabled       := True;
            ButtonOfupdate       := '등록';
            BBdelete.Enabled     := True;
            BBupdate.Enabled     := True;
            SpeedButton2.Enabled := True;
            if DBFlag = False then Phelpmsg.Caption := '  신청사항을 수정하시고 저장버튼을 누르세요.';
            Application.ProcessMessages;
       end;
  end;

  Loanym_ord;        // 98.05.04 수정..........................................
end;

// 사우회원인지 여부 체크 리턴값은 TRUE or FALSE
function TFpsa30201.CheckOfMember(Parameter: String): Boolean;
var
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT EMPNO FROM PSCMAN ');
            Sql.Add(' WHERE EMPNO = :EMPNO    ');
            Sql.Add('   AND RETDATE IS NULL   ');
            ParamByName('EMPNO').AsString := Parameter ;
            Open;
            if   RecordCount <= 0 then CheckOfMember := False
            else                       CheckOfMember := True;
       end;
  finally
       qq.Free;
  end;
end;

procedure TFpsa30201.InitOfStart;
begin
  Pankorname.Caption  := '';
  Ppaycl.Caption      := '';
  Pempdate.Caption    := '';
  Pperiod.Caption     := '';
  Pmax_a.Caption      := '';
  Ebankcode.Text      := '';
  Pbankname.Caption   := '';
  Ebankacnt.Text      := '';
  Etelno.Text         := '';
  Pperson.Caption     := '';
  NEstdamt.Value      := 0;
  NEmaxamt.Value      := 0;
  CBrepmm1.Text       := '0';
  CBrepmm2.Text       := '0';  
end;

// 재직한 개월수 추출한다
function TFpsa30201.CaclOfMonth(Param1, Param2 : String): Integer;
var
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT MONTHS_BETWEEN(TO_DATE(:TODATE, ''YYYYMMDD''), ');
            Sql.Add('                      TO_DATE(:FRDATE, ''YYYYMMDD'')) ');
            Sql.Add('  FROM DUAL                                           ');
            ParamByName('FRDATE').AsString := Param2;
            ParamByName('TODATE').AsString := Param1;
            Open;
            CaclOfMonth := Trunc(Fields[0].AsFloat);
       end;
  finally
       qq.Free;
  end;
end;

procedure TFpsa30201.BBcloseClick(Sender: TObject);
begin
  Close;
end;

// 사번이 바뀔때마다 재 셋팅
procedure TFpsa30201.EempnoOfChange(Parameter: String);
var
  LSjanamtOfOk, LSjanamtOfNo, LSjanamtOfNo_1 : Real;
  TempString : String;
  A  : array[0..79] of Char;
  qq : TOraQuery;
begin
  Pshow.Visible := False;
  Pshow.Caption := '';

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT A.EMPNO F_EMPNO, A.KORNAME F_KORNAME, A.PAYCL F_PAYCL,           ');
            Sql.Add('       A.ORGNUM F_ORGNUM, A.DEPTCODE F_DEPTCODE, A.EMPDATE F_EMPDATE,   ');
            Sql.Add('       A.PAYBANK F_PAYBANK, A.PAYACNT F_PAYACNT, A.BONCODE F_BONCODE    ');
            Sql.Add('  FROM PKMPMAS A                                                        ');
            Sql.Add(' WHERE A.EMPNO = :EMPNO                                                 ');
            ParamByName('EMPNO').AsString := Parameter;
            Open;
            if RecordCount <= 0 then
            begin
                 InitOfStart;
                 MessageBox(Fpsa30201.handle , '사우회원이 아닙니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                 Application.ProcessMessages;
                 BBsimm1.SetFocus;
                 Exit;
            end;

            NEstdamt.Enabled := True;
            NEmaxamt.Enabled := True;
            if GradeOfUser = 'OnlyDept' then
            begin
                 if FieldByName('F_BONCODE').AsString <> GSboncode then
                 begin
                      MessageBox(Fpsa30201.handle , '타 본부사원은 작업할 수 없습니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                      if FlagOfButton = True then DBFlag := False;
                      FlagOfButton := True;
                      DBgridShow('개발자');
                      FlagOfButton := False;
                      Phelpmsg.Caption := '  ';
                      Eempno.SetFocus;
                      Application.ProcessMessages;
                      Exit;
                 end;
            end;
            Pankorname.Caption := FieldByName('F_KORNAME').AsString;
            Pempdate.Caption   := InMask(FieldByName('F_EMPDATE').AsString,'@@@@-@@-@@');
            Pappdate.Caption   := InMask(Copy(Fn_GetDateTimeStr,1,8),'@@@@-@@-@@');
            Ebankcode.Text     := FieldByName('F_PAYBANK').AsString;
            Ebankacnt.Text     := FieldByName('F_PAYACNT').AsString;
            GSpaycl            := FieldByName('F_PAYCL').AsString;
            Ppaycl.Caption     := GetCodeName('I112', GSpaycl);
            GSmonth            := CaclOfMonth( Copy(Fn_GetDateTimeStr, 1, 8),
                                               Copy(FieldByName('F_EMPDATE').AsString, 1, 8));
            ////////////////////////////////////////////////////////////////////

            if   GSmonth <= 0 then  Pperiod.Caption := ''
            else                    Pperiod.Caption := IntToStr(GSmonth div 12) + '년' + IntToStr(GSmonth mod 12) + '개월';

            Close;
            Sql.Clear;
            Sql.Add('SELECT NVL(SUM(JANAMT),0) FROM PSMLOAN ');
            Sql.Add(' WHERE EMPNO  = :EMPNO                 ');
            Sql.Add('   AND JANAMT <> 0                     ');
            Sql.Add('   AND LOANDATE IS  NOT NULL           ');
            ParamByName('EMPNO').AsString := Trim(Eempno.Text);
            Open;
            LSjanamtOfOk := Fields[0].AsFloat;

            Close;
            Sql.Clear;
            Sql.Add('SELECT NVL(SUM(STDAMT),0), NVL(SUM(MAXAMT),0) ');
            Sql.Add('  FROM PSMLOAN                                ');
            Sql.Add(' WHERE EMPNO  = :EMPNO                        ');
            Sql.Add('   AND LOANDATE IS NULL                       ');
            ParamByName('EMPNO').AsString := Trim(Eempno.Text);
            Open;
            LSjanamtOfNo   := Fields[0].AsFloat;
            LSjanamtOfNo_1 := Fields[1].AsFloat;

            Close;
            Sql.Clear;
            Sql.Add('SELECT YYMM, LIMITAMT, STDAMT1, MAXAMT1, STDAMT2, ');
            Sql.Add('       MAXAMT2, INTRATE, BASEYEAR, REPMAXMM       ');
            Sql.Add('  FROM PSCLOANS                                   ');
            Sql.Add(' WHERE WORKFRDATE <= :ParamDT                     ');
            Sql.Add('   AND WORKTODATE >= :ParamDT                     ');
            ParamByName('ParamDT').AsString := Copy(Fn_GetDateTimeStr,1,8);
            Open;

            if RecordCount > 0 then
            begin
                 if ((GSmonth div 12) >= FieldByName('BASEYEAR').AsInteger) then
                 begin
                      NEstdamt.Value := FieldByName('STDAMT2').AsFloat - LSjanamtOfOk - LSjanamtOfNo;
                      NEmaxamt.Value := FieldByName('MAXAMT2').AsFloat - LSjanamtOfOk - LSjanamtOfNo_1;
                      NEstdamt.Value := Trunc(NEstdamt.Value / 100000) * 100000;
                      NEmaxamt.Value := Trunc(NEmaxamt.Value / 100000) * 100000;
                 end
                 else
                 begin
                      NEstdamt.Value := FieldByName('STDAMT1').AsFloat - LSjanamtOfOk - LSjanamtOfNo;
                      NEmaxamt.Value := FieldByName('MAXAMT1').AsFloat - LSjanamtOfOk - LSjanamtOfNo_1;
                      NEstdamt.Value := Trunc(NEstdamt.Value / 100000) * 100000;
                      NEmaxamt.Value := Trunc(NEmaxamt.Value / 100000) * 100000;
                 end;
                 NEstdamt.Enabled := True;
                 NEmaxamt.Enabled := True;
                 BBsave.Enabled   := True;
                 if (NEstdamt.Value < 0) then NEstdamt.Value := 0;
                 if (NEmaxamt.Value < 0) then NEmaxamt.Value := 0;
                 if (NEstdamt.Value <= 0) and (NEmaxamt.Value <= 0) then
                 begin
                      NEstdamt.Enabled := False;
                      NEmaxamt.Enabled := False;
                      NEstdamt.Value   := 0;
                      NEmaxamt.Value   := 0;
                      BBsave.Enabled   := False;
                      FlagBox          := True;
                      TempString       := '  '+Trim(Pankorname.Caption)+'씨는 대출신청할 대출잔액이 없습니다.';
                      StrPCopy(A, TempString);
                      if FlagBox then MessageBox(Fpsa30201.handle , A,'주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                      Phelpmsg.Caption := '  대출잔액이 없습니다.';
                      Application.ProcessMessages;
                 end;
                 CBrepmm1.Text := FieldByName('REPMAXMM').AsString;
                 CBrepmm2.Text := FieldByName('REPMAXMM').AsString;
                 GSamount      := FieldByName('LIMITAMT').AsFloat;
                 GSremain      := FieldByName('LIMITAMT').AsFloat - GRtotalamt;
                 if   GSremain >= NEstdamt.Value then Pperson.Caption := '신청자'
                 else                                 Pperson.Caption := '대기자';
                 if   GSremain <= 0 then Pmax_a.Caption := '0'
                 else
                 begin
                      if   FlagPmax = True then Pmax_a.Caption := ' '
                      else                      Pmax_a.Caption := Format('%14.0n',[GSremain]);
                 end;
                 GSintrate := FieldByName('INTRATE').AsFloat;
            end;
       end;
  finally
       qq.Free;
  end;
end;

procedure TFpsa30201.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if OraQuery1F_EMPNO.AsString = '' then
  begin
       if FlagOfButton then  Exit;
       EempnoOfChange(Trim(Eempno.Text));
       CompOf1     := NEstdamt.Value;
       CompOf2     := NEmaxamt.Value;
       Etelno.Text := OraQuery1F_TELNO.AsString;
       Exit;
  end;

  if (GradeOfUser = 'OnlyDept') and (OraQuery1F_BONCODE.AsString <> GSboncode) then Exit;
  ButtonOfupdate       := '등록';
  NEstdamt.Enabled     := False;
  NEmaxamt.Enabled     := False;
  Ebankcode.Enabled    := True;
  Ebankacnt.Enabled    := True;
  Etelno.Enabled       := True;
  SpeedButton2.Enabled := True;
  BBdelete.Enabled     := True;
  Pankorname.Caption   := OraQuery1F_KORNAME.AsString;

  if OraQuery1F_EMPDATE.AsString = '' then Pempdate.Caption := ''
  else                                     Pempdate.Caption := InMask(OraQuery1F_EMPDATE.AsString,'@@@@-@@-@@');

  Ppaycl.Caption := GetCodeName('I112', OraQuery1F_PAYCL.AsString);
  GSmonth        := CaclOfMonth( Copy(Fn_GetDateTimeStr, 1, 8), Copy(OraQuery1F_EMPDATE.AsString, 1, 8));

  if   GSmonth <= 0 then Pperiod.Caption := ''
  else                   Pperiod.Caption := IntToStr(GSmonth div 12) + '년' + IntToStr(GSmonth mod 12) + '개월';

  if OraQuery1F_APPDATE.AsString = '' then Pappdate.Caption := ''
  else                                     Pappdate.Caption := InMask(OraQuery1F_APPDATE.AsString,'@@@@-@@-@@');

  Ebankcode.Text := OraQuery1F_PAYBANK.AsString;
  Ebankacnt.Text := OraQuery1F_PAYACNT.AsString;
  Etelno.Text    := OraQuery1F_TELNO.AsString;

  if OraQuery1F_APPFLAG.AsString = '0' then Pperson.Caption := '대출자';
  if OraQuery1F_APPFLAG.AsString = '1' then Pperson.Caption := '신청자';
  if OraQuery1F_APPFLAG.AsString = '2' then Pperson.Caption := '대기자';
  if OraQuery1F_APPFLAG.AsString = '3' then Pperson.Caption := '기각자';

  NEstdamt.Value := OraQuery1F_STDAMT.AsFloat;
  NEmaxamt.Value := OraQuery1F_MAXAMT.AsFloat;
  CBrepmm1.Text  := OraQuery1F_REPMM1.AsString;
  CBrepmm2.Text  := OraQuery1F_REPMM2.AsString;
  Phelpmsg.Caption := '  신청사항을 수정하시고 저장버튼을 누르세요.';
  Application.ProcessMessages;
end;

procedure TFpsa30201.PmaxOf(Parameter : String);
var
  StringOfPmax : String;
  qq : TOraQuery;
begin
  StringOfPmax := Copy(Trim(Pappdate.Caption), 1, 4) +
                  Copy(Trim(Pappdate.Caption), 6, 2) +
                  Copy(Trim(Pappdate.Caption), 9, 2);

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT LIMITAMT, YYMM              ');
            Sql.Add('  FROM PSCLOANS                    ');
            Sql.Add(' WHERE WORKFRDATE <= :StringOfPmax ');
            Sql.Add('   AND WORKTODATE >= :StringOfPmax ');
            ParamByName('StringOfPmax').AsString := StringOfPmax;
            Open;

            GSremain := FieldByName('LIMITAMT').AsFloat;
            GSyymm   := FieldByName('YYMM').AsString;
            SumOfTable;
            GSremain := GSremain - GRtotalamt;
            if   GSremain <= 0 then Pmax_a.Caption := '0'
            else                    Pmax_a.Caption := Format('%14.0n',[GSremain]);
       end;
  finally
       qq.Free;
  end;
end;

// 은행코드가 바뀔때
procedure TFpsa30201.EbankcodeChange(Sender: TObject);
begin
  if   Length(Trim(Ebankcode.Text)) = 3 then
       Pbankname.Caption := GetCodeName('K910', Trim(Ebankcode.Text));
end;

procedure TFpsa30201.EbankcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if   not (Key in ['A'..'Z','a'..'z','0'..'9',#8]) then
       Key := #0;
end;

procedure TFpsa30201.EbankcodeExit(Sender: TObject);
begin
  Pbankname.Caption := GetCodeName('K910', Trim(Ebankcode.Text));
end;

procedure TFpsa30201.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  if   Key <> #13 then exit;
  Key := #0;
  BBsave.Enabled := True;
  if (Length(Trim(Eempno.Text)) = 4) and (Eempno.Text[2] in ['0'..'9']) and
     (Eempno.Text[3] in ['0'..'9'])  and (Eempno.Text[4] in ['0'..'9']) then
  begin
       if CheckOfMember(Trim(Eempno.Text)) then
       begin
            DBFlag := False;
            DBgridShow(Trim(Eempno.Text));
       end
       else
       begin
            MessageBox(Fpsa30201.handle , '사우회원이 아닙니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
            BBsimm1.SetFocus;
            Exit;
       end;
  end
  else SpeedButton1Click(Self);
end;

procedure TFpsa30201.SpeedButton1Click(Sender: TObject);
var
  Key : Char;
begin
  Key := #13;
  EempnoEnter(Self);
  FIempnod3 := TFIempnod3.Create(Self);
  FIempnod3.GSempnoS := Trim(Eempno.Text);
  FIempnod3.GSboncode := '';
  if GradeOfUser = 'OnlyDept' then FIempnod3.GSboncode := GSBoncode;

  Try
       FIempnod3.ShowModal;
       If FIempnod3.GIcloseS = 0 then
       begin
            if FIempnod3.GSempnoS <> '' then
            begin
                 Eempno.Text := FIempnod3.GSempnoS;
                 Pankorname.Caption := FIempnod3.GSkornameS;
                 EempnoKeyPress(Self, Key);
            end;
       end;
  Finally
       FIempnod3.Free;
  end;  
end;

procedure TFpsa30201.SpeedButton2Click(Sender: TObject);
begin
  FIbank := TFIbank.Create(Self);
  Try
       FIbank.ShowModal;
       If FIbank.GIcloseS = 0 then
       begin
            Ebankcode.Text    := FIbank.GSempnoS;
            Pbankname.Caption := FIbank.GSkornameS;
       end;
  Finally
       FIbank.Free;
  end;
end;

procedure TFpsa30201.NEstdamtExit(Sender: TObject);
begin
  if NEstdamt.Value > CompOf1 then
  begin
       MessageBox(Fpsa30201.handle , '입력한값이 기준신청금액보다 적어야 합니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
       NEstdamt.Value := CompOf1;
       NEstdamt.SetFocus;
       Exit;
  end;

  if Pperson.Tag = 0 then
  begin
       if   GSremain >= NEstdamt.Value then Pperson.Caption := '신청자'
       else                                 Pperson.Caption := '대기자';
  end;
  NEstdamt.Value := Trunc(NEstdamt.Value / 100000) * 100000;
end;

Procedure TFpsa30201.InitOfStringGrid;
var i, j : Integer;
Begin
  For i := 0 to SGsimm.ColCount-1 Do
       for j := 0 to 4 do
            SGsimm.Cells[i, j] := '';
End;

Procedure TFpsa30201.TitleOfStringGrid;
var i : Integer;
Begin
  For i := 1 to SGsimm.ColCount-2 Do
       SGsimm.Cells[i, 0] := '+'+InttoStr(i)+'       ';

  SGsimm.Cells[SGsimm.ColCount-1, 0] := '계       ';
  SGsimm.Cells[0,0] := '상환횟수   ';
  SGsimm.Cells[0,1] := '상환원금   ';
  SGsimm.cells[0,2] := '상환이자   ';
  SGsimm.Cells[0,3] := '상환금 계  ';
  SGsimm.Cells[0,4] := '상환금잔액 ';
End;

procedure TFpsa30201.NEmaxamtExit(Sender: TObject);
begin
  if NEmaxamt.Value > CompOf2 then
  begin
       MessageBox(Fpsa30201.handle , '입력한값이 최대신청금액보다 적어야 합니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
       NEmaxamt.Value := CompOf2;
       NEmaxamt.SetFocus;
       Exit;
  end;
  NEmaxamt.Value := Trunc(NEmaxamt.Value / 100000) * 100000;
end;

procedure TFpsa30201.DBgridOfCalc(ValueOfstdamt: Real; ValueOfrepmm: String);
var i, j : Integer;
  CellOfOne, CellOfTwo, CellOfThree, CellOfFour: Real;
  Sum1, Sum2, Sum3 : Real;
begin
  for i := 1 to StrToInt(Trim(ValueOfrepmm)) + 1 do
  begin
       for j := 0 to 4 do
            SGsimm.Cells[i, j] := '';
  end;

  Sum1 := 0;
  Sum2 := 0;
  Sum3 := 0;
  SGsimm.ColCount := StrToInt(Trim(ValueOfrepmm)) + 2;
  TitleOfStringGrid;
  CellOfOne := Trunc(ValueOfstdamt / StrToInt(Trim(ValueOfrepmm)));
  CellOfFour:= ValueOfstdamt;
  for i := 1 to SGsimm.ColCount - 2 do
  begin
       SGsimm.Cells[i,1] := FormatFloat('#,##0', CellOfOne);
       CellOfTwo         := Trunc(CellOfFour * GSintrate * ( 30 / 365 ));
       SGsimm.cells[i,2] := FormatFloat('#,##0', CellOfTwo);
       CellOfThree       := CellOfOne + CellOfTwo;
       CellOfFour        := CellOfFour - CellOfOne;
       SGsimm.Cells[i,3] := FormatFloat('#,##0', CellOfThree);
       SGsimm.Cells[i,4] := FormatFloat('#,##0', CellOfFour);
       Sum1              := Sum1 + CellOfOne;
       Sum2              := Sum2 + CellOfTwo;
       Sum3              := Sum3 + CellOfThree;
  end;
  SGsimm.Cells[SGsimm.ColCount - 1,1] := FormatFloat('#,##0', Sum1);
  SGsimm.Cells[SGsimm.ColCount - 1,2] := FormatFloat('#,##0', Sum2);
  SGsimm.Cells[SGsimm.ColCount - 1,3] := FormatFloat('#,##0', Sum3);
  SGsimm.Cells[SGsimm.ColCount - 1,4] := '';
end;

procedure TFpsa30201.BBsimm1Click(Sender: TObject);
begin
  Pshow.Visible := True;
  Pshow.Caption := '기준신청';
  DBgridOfCalc(NEstdamt.Value, Trim(CBrepmm1.Text));
end;

procedure TFpsa30201.SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var Oldalign : Integer;
begin
  if ((row = 2) or (row = 4)) and (col >= 1) then
       with (Sender as TStringGrid).Canvas do
       Begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;

  if (col = SGsimm.ColCount-1) and (row > 0) then
       with (Sender as TStringGrid).Canvas do
       begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;

  if (row = 0) or (col < 1) then
       SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style + [fsbold];

  if (col >= 0) then
  begin
       Oldalign := SetTextAlign(SGsimm.Canvas.Handle,ta_right);
       SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);
       SetTextAlign(SGsimm.Canvas.Handle,Oldalign);
  end
  else SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);

  SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style - [fsbold];
end;

procedure TFpsa30201.BBsimm2Click(Sender: TObject);
begin
  Pshow.Visible := True;
  Pshow.Caption := '최대신청';
  DBgridOfCalc(NEmaxamt.Value, Trim(CBrepmm2.Text));
end;

procedure TFpsa30201.BBupdateClick(Sender: TObject);
begin
  if not CheckOfMember(Trim(Eempno.Text)) then
  begin
       MessageBox(Fpsa30201.handle , '사우회원이 아닙니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
       Exit;
  end;
  NEstdamt.Enabled     := True;
  NEmaxamt.Enabled     := True;
  CBrepmm1.Enabled     := True;
  CBrepmm2.Enabled     := True;
  Ebankcode.Enabled    := True;
  Ebankacnt.Enabled    := True;
  Etelno.Enabled       := True;
  SpeedButton2.Enabled := True;
  BBdelete.Enabled     := False;
  Pperson.Tag          := 0;
  Pappdate.Caption     := InMask(Copy(Fn_GetDateTimeStr,1,8),'@@@@-@@-@@');
  ButtonOfupdate       := '저장';
  EempnoOfChange(Trim(Eempno.Text));
  InitOfStringGrid;
  CompOf1              := NEstdamt.Value;
  CompOf2              := NEmaxamt.Value;
  Phelpmsg.Caption     := '  신청사항을 등록하시고 저장버튼을 누르세요.';
  Application.ProcessMessages;
end;

procedure TFpsa30201.BBsaveClick(Sender: TObject);
var
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT KORNAME FROM PSCMAN ');
            Sql.Add(' WHERE EMPNO = :empno      ');
            Sql.Add('   AND RETDATE IS NULL     ');
            ParamByName('empno').AsString := Trim(Eempno.Text);
            Open;
            
            if Trim(Pankorname.Caption) <> Fields[0].AsString then
            begin
                 MessageBeep(1);
                 MessageBox(Fpsa30201.handle , '사번을 바르게 입력하세요.','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                 if   GradeOfUser = 'Mine' then BBupdate.SetFocus
                 else                           Eempno.SetFocus;
                 Exit;
            end;
       end;
  finally
       qq.Free;
  end;

  if NEmaxamt.value < NEstdamt.value then
  begin
       Phelpmsg.Caption := '  신청금액이 최대신청금액을 초과하였습니다.';
       Application.ProcessMessages;
       NEstdamt.SetFocus;
       Exit;
  end;

  if (CBrepmm1.Text = '') or (CBrepmm2.Text = '') then
  begin
       Phelpmsg.Caption := '  상환기간을 정확히 입력하세요.';
       Application.ProcessMessages;
       CBrepmm1.SetFocus;
       Exit;
  end;

  if (Ebankcode.Text = '') or (Ebankacnt.Text = '') then
  begin
       Phelpmsg.Caption := '  은행명과 계좌번호을 정확히 입력하세요.';
       Application.ProcessMessages;
       Ebankcode.SetFocus;
       Exit;
  end;

  if Etelno.Text = '' then
  begin
       Phelpmsg.Caption := ' 사내전화번호를 정확히 입력하세요.';
       Application.ProcessMessages;
       Etelno.SetFocus;
       System.Exit;
  end;

  if ButtonOfupdate = '등록' then
  begin
       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;
       try
            with qq do
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('UPDATE PSMLOAN                                          ');
                 Sql.Add('SET BANK      = '''+Trim(Ebankcode.Text)+''' ,          ');
                 Sql.Add('    BANKACT   = '''+Trim(Ebankacnt.Text)+''' ,          ');
                 Sql.Add('    REPMM1    = :P1 ,                                   ');
                 Sql.Add('    REPMM2    = :P2 ,                                   ');
                 Sql.Add('    REPLDATE  = '' '' ,                                 ');
                 Sql.Add('    TELNO     = '''+Etelno.Text+''',                    ');
                 Sql.Add('    WRITETIME = '''+Copy(Fn_GetDateTimeStr, 1, 15)+''' ,');
                 Sql.Add('    WRITEMAN  = '''+Pempno+'''                         ');
                 Sql.Add('WHERE EMPNO   = '''+Trim(Eempno.Text)+'''               ');
                 Sql.Add('  AND APPDATE = '''+OraQuery1F_APPDATE.AsString+'''     ');
                 ParamByName('P1').AsInteger := StrToInt(Trim(CBrepmm1.Text));
                 ParamByname('P2').AsInteger := StrToInt(Trim(CBrepmm2.Text));
                 ExecSQl;
            end;
       finally
            qq.Free;
       end;

       DBFlag := True;
       DBgridShow(Trim(Eempno.Text));
       PmaxOf('당월대출잔고');
       Phelpmsg.Caption := '  자료가 수정완료되었습니다.';
       Application.ProcessMessages;
       Exit;
  end;

  SumOfTable;


  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT YYMM, LIMITAMT              ');
            Sql.Add('  FROM PSCLOANS                    ');
            Sql.Add(' WHERE WORKFRDATE <= :StringOfPmax ');
            Sql.Add('   AND WORKTODATE >= :StringOfPmax ');
            ParamByName('StringOfPmax').AsString := Copy(Fn_GetDateTimeStr,1,8);
            Open;

            if RecordCount > 0 then
            begin
                 GSamount   := FieldByName('LIMITAMT').AsFloat;
                 GSlimitamt := FieldByName('LIMITAMT').AsFloat;
                 GSremain   := GSlimitamt - GRtotalamt;
                 if   GSremain >= NEstdamt.Value then Pperson.Caption := '신청자'
                 else                                 Pperson.Caption := '대기자';

                 if   GSremain <= 0 then Pmax_a.Caption := '0'
                 else                    Pmax_a.Caption := Format('%14.0n',[GSremain]);
            end;
            /////////////////////////////////////////////////////////////////////
            Close;
            SQL.Clear;
            Sql.Add('SELECT EMPNO, APPDATE     ');
            Sql.Add('  FROM PSMLOAN            ');
            Sql.Add(' WHERE EMPNO   = :EMPNO   ');
            Sql.Add('   AND APPDATE = :APPDATE ');
            ParamByName('EMPNO').AsString   := Trim(Eempno.Text);
            ParamByName('APPDATE').AsString := Copy(Fn_GetDateTimeStr,1,8);
            Open;
            if RecordCount > 0 then
            begin
                 MessageBox(Fpsa30201.handle , '같은날짜에 두번이상 신청할 수 없습니다','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_OK);
                 Application.ProcessMessages;
                 Exit;
            end;

            if ButtonOfupdate = '저장' then
            begin
                if Pperson.Caption = '대기자' then
                begin
                  if ID_NO = MessageDlg('당월 총 대출한도금액을 초과하였습니다'+#13+'대기자료로 등록하시겠습니까?',mtConfirmation, [mbYes, mbNO],0) then  Exit;
                end;
                Close;
                Sql.Clear;
                Sql.Add('INSERT INTO PSMLOAN(EMPNO, APPDATE, APPTIME, PAYCL, STDAMT,    ');
                Sql.Add('                    REPMM1, MAXAMT, REPMM2, BANK, BANKACT,     ');
                Sql.Add('                    APPFLAG, REPLDATE, TELNO, WRITETIME, WRITEMAN)  ');
                Sql.Add('VALUES ( :EMPNO, :APPDATE, :APPTIME, :PAYCL, :STDAMT,          ');
                Sql.Add('         :REPMM1, :MAXAMT, :REPMM2, :BANK, :BANKACT,           ');
                Sql.Add('         :APPFLAG, :REPLDATE, :TELNO, :WRITETIME, :WRITEMAN )  ');
                ParambyName('EMPNO').AsString     := Trim(Eempno.Text);
                ParamByName('APPDATE').AsString   := Copy(Fn_GetDateTimeStr, 1, 8);
                ParamByName('APPTIME').AsString   := Copy(Fn_GetDateTimeStr, 9, 6);
                ParambyName('PAYCL').AsString     := GSpaycl;
                ParamByName('STDAMT').AsFloat     := NEstdamt.Value;
                ParamByName('REPMM1').AsInteger   := StrToInt(Trim(CBrepmm1.Text));
                ParamByName('MAXAMT').AsFloat     := NEmaxamt.Value;
                ParamByname('REPMM2').AsInteger   := StrToInt(Trim(CBrepmm2.Text));
                ParamByName('BANK').AsString      := Trim(Ebankcode.Text);
                ParamByName('BANKACT').AsString   := Trim(Ebankacnt.Text);
                if   Pperson.Caption = '신청자' then ParamByName('APPFLAG').AsString := '1'
                else                                 ParamByName('APPFLAG').AsString := '2';
                ParamByName('REPLDATE').AsString  := ' ';
                ParamByName('TELNO').AsString     := Trim(Etelno.Text);
                ParamByName('WRITETIME').AsString := Fn_GetDateTimeStr;
                ParamByName('WRITEMAN').AsString  := Pempno;
                ExecSql;

                DBFlag := True;
                DBgridShow(Trim(Eempno.Text));
                PmaxOf('당월대출잔고');
                Phelpmsg.Caption := '  자료가 저장완료되었습니다.';
                Application.ProcessMessages;
            end;

       end;
  finally
       qq.Free;
  end;
end;

procedure TFpsa30201.BBabortClick(Sender: TObject);
var
  Key : Char;
  qq  : TOraQuery;
begin
  Key := #13;
  Application.ProcessMessages;
  InitOfStringGrid;
  FlagBox := False;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            Sql.Clear;
            Sql.Add('select KORNAME          ');
            Sql.Add('  from PSCMAN           ');
            Sql.Add(' WHERE EMPNO = :empno   ');
            Sql.Add('   AND RETDATE IS NULL  ');
            ParamByName('empno').AsString := Eempno.Text;
            Open;

            if Fields[0].AsString <> Trim(Pankorname.Caption) then
            begin
                 FlagOfButton := True;
                 DBFlag := True;
                 DBgridShow('개발자');
                 Eempno.SetFocus;
                 FlagOfButton := False;
                 Exit;
            end;
       end;
  finally
       qq.Free;
  end;

  DBFlag := True;
  DBgridShow(Trim(Eempno.Text));
  PmaxOf('당월대출잔고');
  EempnoKeyPress(Self, Key);
//  InitOfStringGrid;
  Phelpmsg.Caption := '  초기화 상태입니다.';
  Application.ProcessMessages;
end;

procedure TFpsa30201.BBdeleteClick(Sender: TObject);
label 1, 2;
var TempOf : String;
  TempOfFloat, TempOfBefore : Real;
  TempOfGubun : String;
  TempOfEmpno, TempOfAppdate, TempOfApptime : String;
  qq : TOraQuery;
begin
  InitOfStringGrid;
  TempOf       := Copy(Trim(Pappdate.Caption), 1, 4) +
                  Copy(Trim(Pappdate.Caption), 6, 2) +
                  Copy(Trim(Pappdate.Caption), 9, 2);

  TempOfBefore := NEstdamt.Value;

  if ID_YES = MessageBox(Handle,'삭제하시겠습니까?','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
  begin
       if Trim(Pperson.Caption) = '신청자' then TempOfGubun := '1'
       else                                     TempOfGubun := '2';


        qq := TOraQuery.Create(nil);
        qq.Session := Ora_Session;
        try
             with qq do
             begin
                  Close;
                  Sql.Clear;
                  Sql.Add('DELETE FROM PSMLOAN                        ');
                  Sql.Add(' WHERE EMPNO   = '''+Trim(Eempno.Text)+''' ');
                  Sql.Add('   AND APPDATE = '''+TempOf+'''            ');
                  ExecSql;
                  P_ord.Caption := '';               // 98.05.04에 수정
                  P_loanym.Caption := '';            // 98.05.04에 수정

                  SumOfTable;

                  if TempOfGubun = '1' then
                  begin
                       SumOfTable;

                       Close;
                       Sql.Clear;
                       Sql.Add('SELECT LIMITAMT ');
                       Sql.Add('  FROM PSCLOANS ');
                       Sql.Add(' WHERE WORKFRDATE <= '''+Copy(Fn_GetDateTimeStr,1,8)+'''  ');
                       Sql.Add('   NAD WORKTODATE >= '''+Copy(Fn_GetDateTimeStr,1,8)+'''  ');
                       Open;
                       GSremain := FieldByName('LIMITAMT').AsFloat - GRtotalAmt + NEstdamt.Value;

                       1:
                         Close;
                         Sql.Clear;
                         Sql.Add('SELECT EMPNO, APPDATE, APPTIME, STDAMT   ');
                         Sql.Add('FROM   PSMLOAN                           ');
                         Sql.Add('WHERE  APPFLAG = ''2'' AND               ');
                         Sql.Add('       STDAMT <= :P1   AND               ');
                         Sql.Add('       ROWNUM = 1                        ');
                         Sql.Add('ORDER BY APPDATE ASC, APPTIME ASC        ');
                         ParamByName('P1').AsFloat := TempOfBefore;
                         Open;

                         if RecordCount > 0 then
                         begin
                              TempOfFloat   := Fields[3].AsFloat;
                              TempOfEmpno   := Fields[0].AsString;
                              TempOfAppdate := Fields[1].AsString;
                              TempOfApptime := Fields[2].AsString;

                              Close;
                              Sql.Clear;
                              Sql.Add('UPDATE PSMLOAN SET APPFLAG = ''1''         ');
                              Sql.Add('WHERE EMPNO = '''+TempOfEmpno+'''     AND  ');
                              Sql.Add('      APPDATE = '''+TempOfAppdate+''' AND  ');
                              Sql.Add('      APPTIME = '''+TempOfApptime+'''      ');
                              ExecSql;

                              TempOfBefore := TempOfBefore - TempOfFloat;
                              GSremain     := GSremain     - TempOfFloat;

                              if   TempOfBefore > 0 then goto 1
                              else                       goto 2;
                         end;

                       2:
                         Phelpmsg.Caption := '  자료삭제와 수정이 완료되었습니다.';
                         Application.ProcessMessages;
                  end
                  else
                  begin
                       Phelpmsg.Caption := '  자료가 삭제 완료되었습니다.';
                       Application.ProcessMessages;
                  end;

                  DBFlag := True;
                  DBgridShow(Trim(Eempno.Text));
                  PmaxOf('당월대출잔고');
             end;
        finally
             qq.Free;
        end;
  end;
end;

procedure TFpsa30201.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FlagOfClose = True then
  begin
       CanClose := True;
       Exit;
  end;

  if ID_YES = MessageBox(Handle,'종료하시겠습니까?','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
       CanClose := True
  else CanClose := False;
end;

procedure TFpsa30201.EempnoEnter(Sender: TObject);
var tMode : HIMC;
begin
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);
  Phelpmsg.Caption := '  입력후 반드시 ENTER KEY를 눌러주세요.';
  Application.ProcessMessages;
  InitOfStringGrid;
  Eempno.SetFocus;
end;

procedure TFpsa30201.CBrepmm1Exit(Sender: TObject);
begin
  if StrToInt(Trim(CBrepmm1.Text)) >= 20 then CBrepmm1.Text := '20';
  if StrToInt(Trim(CBrepmm1.Text)) <= 1  then CBrepmm1.Text := '1';
end;

procedure TFpsa30201.CBrepmm2Exit(Sender: TObject);
begin
  if StrToInt(Trim(CBrepmm2.Text)) >= 20 then CBrepmm2.Text := '20';
  if StrToInt(Trim(CBrepmm2.Text)) <= 1  then CBrepmm2.Text := '1';
end;

procedure TFpsa30201.DBGrid1CellClick(Column: TColumn);
begin
  DataSource1DataChange(Self, OraQuery1F_EMPNO);
end;

procedure TFpsa30201.EempnoExit(Sender: TObject);
var tMode : HIMC;
begin
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_ALPHANUMERIC, IME_CMODE_ALPHANUMERIC);
end;

procedure TFpsa30201.FormShow(Sender: TObject);
var i : Integer;
    tMode : HIMC;
    qq : TOraQuery;
begin
  FlagPmax := True;

// 권한부여
// ALL      ====> 담당자 ( 제한없음 )
// OnlyDept ====> 본부까지만
// Mine     ====> 자신만 사용

  if (Pgrade = 'A') or (Pgrade = 'B') or (Pgrade = 'C') then GradeOfUser := 'All';
  if (Pgrade = 'D') then
  begin
       GradeOfUser := 'OnlyDept';

       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;
       try
            with qq do
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('SELECT BONCODE        ');
                 Sql.Add('  FROM PKMPMAS        ');
                 Sql.Add(' WHERE EMPNO = :empno ');
                 ParamByName('empno').AsString := Pempno;
                 Open;
                 GSboncode := FieldByName('BONCODE').AsString;
            end;
       finally
            qq.Free;
       end;
  end;

  if (Pgrade = 'E') then
  begin
       GradeOfUser          := 'Mine';
       Eempno.Enabled       := False;
       SpeedButton1.Enabled := False;
  end;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT YYMM FROM PSCLOANS    ');
            Sql.Add(' WHERE WORKFRDATE <= :Ptoday ');
            Sql.Add('   AND WORKTODATE >= :Ptoday ');
            ParamByName('Ptoday').AsString := Copy(Fn_GetDateTimeStr,1,8);
            Open;
            Cur_yymm := FieldByName('YYMM').AsString;  // 대출기준의 기준년월(당일 기준으로)

            Close;
            sql.Clear;
            sql.Add('SELECT SUM(LIMITAMT) FROM PSCLOANS       ');
            sql.Add(' WHERE YYMM BETWEEN ''199703'' AND :yymm ');
            ParamByName('yymm').AsString := Cur_yymm;
            Open;
            sum_limitamt := FieldByName('sum(limitamt)').AsFloat - 7200000;

            Close;
            sql.Clear;
            sql.Add('SELECT SUM(LOANAMT) FROM PSMLOAN  ');
            Open;
            sum_loanamt := FieldByName('sum(loanamt)').AsFloat;  // 현재까지의 총대출금액
       end;
  finally
       qq.Free;
  end;

  Application.ProcessMessages;
  FlagBox := True;
  FlagOfButton := False;
  if CheckOfMember(Pempno) then
  begin
       Eempno.Text := Pempno;
       if GradeOfUser = 'Mine' then DBFlag := False
       else                         DBFlag := True;
       DBgridShow(Pempno);
  end;
  FlagOfClose := False;
  PmaxOf('당월대출잔고');
  BBsimm1.SetFocus;
  FlagPmax := False;
  tMode    := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);
  if GradeOfUser = 'Mine' then BBupdate.SetFocus
  else                         Eempno.SetFocus;
end;

////////////////////////////////////////////////////////////////////////////////
//////////// 대출순위 및 대출예정월 (98.05.04 수정 Start)  /////////////////////
////////////////////////////////////////////////////////////////////////////////
procedure TFpsa30201.Loanym_ord;
var
  i: Integer;
begin
{
  Query2.Close;
  Query2.Sql.Clear;
  Query2.Sql.Add('SELECT EMPNO FROM PSMLOAN ');
  Query2.Sql.Add('WHERE EMPNO = '''+Eempno.Text+'''  ');
  Query2.Sql.Add('  AND STDAMT <= 0          ');
  Query2.Sql.Add('  AND APPFLAG IN (''1'',''2'') ');
  Query2.Sql.Add('ORDER BY APPDATE,APPTIME  ');
  Query2.Open;
  if not Query2.EOF then   // 기준신청금액 = 0 인 사원이면...
  begin
       Query2.Close;
       P_ord.Caption := '';
       P_loanym.Caption := '여유자금이 있을시 대출가능';
  end
  else
  if Query2.EOF then      // 기준신청금액 > 0 인 사원이면...
  begin
       Query2.Close;
       Query4.Close;
       Query4.Sql.Clear;
       Query4.Sql.Add('SELECT EMPNO FROM PSMLOAN ');
       Query4.Sql.Add('WHERE EMPNO = '''+Eempno.Text+'''  ');
       Query4.Sql.Add('  AND STDAMT > 0          ');
       Query4.Sql.Add('  AND APPFLAG IN (''1'',''2'') ');
       Query4.Sql.Add('ORDER BY APPDATE,APPTIME  ');
       Query4.Open;
       if not Query4.EOF then
       begin
            Query4.Close;
            Query1.Close;
            Query1.Sql.Clear;
            Query1.Sql.Add('SELECT EMPNO FROM PSMLOAN ');
            Query1.Sql.Add('WHERE STDAMT > 0          ');
            Query1.Sql.Add('  AND APPFLAG IN (''1'',''2'') ');
            Query1.Sql.Add('ORDER BY APPDATE,APPTIME  ');
            Query1.Open;
            i := 1;
            // 대출순위를 신청일가 신청시간으로 looping을 돌려 정한다.
            While Query1.FieldByName('EMPNO').AsString <> Trim(Eempno.text) do
            begin
                 inc(i);
                 Query1.Next;
            end;
            Query1.Close;
            P_ord.Caption := IntToStr(i) + '위';

            Query2.Close;
            Query2.sql.Clear;
            Query2.sql.Add('select sum(stdamt) from psmloan  ');  // 해당사원 신청직전까지의 기준신청총액
            Query2.sql.Add('where appflag in (''1'',''2'')  ');
            Query2.sql.Add('  and stdamt > 0  ');
            Query2.sql.Add('  and appdate||apptime <   ');
            Query2.sql.Add('(select appdate||apptime from psmloan  ');
            Query2.sql.Add(' where empno = '''+Eempno.Text+'''   ');
            Query2.sql.Add('   and appflag in (''1'',''2'')  ');
            Query2.sql.Add('   and stdamt > 0)  ');
            Query2.Open;
            sum_appamt := Query2.FieldByName('sum(stdamt)').AsFloat;  // 직전까지의 기준신청금액 sum
            Query2.Close;
            if sum_loanamt + sum_appamt + NEstdamt.Value <= sum_limitamt then
            begin
                 P_loanym.Caption := Copy(Cur_yymm,1,4) + '년 ' +
                                     Copy(Cur_yymm,5,2) + '월 대출예정';
            end
            else
            if sum_loanamt + sum_appamt + NEstdamt.Value > sum_limitamt then
            begin
                 next_yymm := CalcMonth(Cur_yymm,1);
                 Query1.Close;
                 Query1.sql.Clear;
                 Query1.sql.Add('SELECT NVL(LIMITAMT,0) lmtamt FROM PSCLOANS  ');
                 Query1.sql.Add('WHERE YYMM = '''+Next_yymm+'''  ');
                 Query1.Open;
 //          97.03부터 현 기준년월까지의 대출한도금액(7,200,000을 뺀 이유는 과거데이타와의 차이때문)
                 sum_limitamt1 := sum_limitamt + Query1.FieldByName('lmtamt').AsFloat;
                 Query1.Close;
                 if sum_loanamt + sum_appamt + NEstdamt.Value <= sum_limitamt1 then
                 begin
                      P_loanym.Caption := Copy(Next_yymm,1,4) + '년 ' +
                                          Copy(Next_yymm,5,2) + '월 대출예정';
                 end
                 else
                 if sum_loanamt + sum_appamt + NEstdamt.Value > sum_limitamt1 then
                 begin
                      P_loanym.Caption := Copy(Next_yymm,1,4) + '년 ' +
                                          Copy(Next_yymm,5,2) + '월이후 대출가능';
                 end;
            end;
       end
       else
       begin
            P_ord.Caption := '';
            P_loanym.Caption := '';
       end;
  end;
  Query2.Close;
}
end;

end.

