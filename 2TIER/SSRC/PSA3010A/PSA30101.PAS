{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출 기준등록
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Psa30101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Spin, Func, MemDS, DBAccess, Ora;

type
  TFpsa30101 = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    NEbaseyear: TNumberEdit;
    sbtnKunsok: TSpinButton;
    NEstdamt1: TNumberEdit;
    NEstdamt2: TNumberEdit;
    NEmaxamt1: TNumberEdit;
    NEmaxamt2: TNumberEdit;
    Panel3: TPanel;
    NElimitamt: TNumberEdit;
    Panel2: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    NErepaybegin: TNumberEdit;
    NEintrate: TNumberEdit;
    sbtnRepmaxmm: TSpinButton;
    sbtnRepaybegin: TSpinButton;
    sbtnIntrate: TSpinButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    NErepmaxmm: TNumberEdit;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    MEyymm: TMaskEdit;
    MEworkfrdate: TMaskEdit;
    MEworktodate: TMaskEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    OraQuery1: TOraQuery;
    OraQuery1YYMM: TStringField;
    OraQuery1F_LIMITAMT: TStringField;
    OraQuery1LIMITAMT: TFloatField;
    OraQuery1BASEYEAR: TIntegerField;
    OraQuery1STDAMT1: TFloatField;
    OraQuery1MAXAMT1: TFloatField;
    OraQuery1STDAMT2: TFloatField;
    OraQuery1MAXAMT2: TFloatField;
    OraQuery1INTRATE: TFloatField;
    OraQuery1REPMAXMM: TIntegerField;
    OraQuery1WORKFRDATE: TStringField;
    OraQuery1WORKTODATE: TStringField;
    OraQuery1REPAYBEGIN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure sbtnKunsokUpClick(Sender: TObject);
    procedure sbtnKunsokDownClick(Sender: TObject);
    procedure sbtnRepmaxmmUpClick(Sender: TObject);
    procedure sbtnRepmaxmmDownClick(Sender: TObject);
    procedure sbtnRepaybeginUpClick(Sender: TObject);
    procedure sbtnRepaybeginDownClick(Sender: TObject);
    procedure sbtnIntrateUpClick(Sender: TObject);
    procedure sbtnIntrateDownClick(Sender: TObject);
    procedure NEbaseyearExit(Sender: TObject);
    procedure NErepmaxmmExit(Sender: TObject);
    procedure NErepaybeginExit(Sender: TObject);
    procedure NEintrateExit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEyymmEnter(Sender: TObject);
    procedure MEyymmKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BBabortClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    StartUp, CheckOfEnter : Boolean;
    word  : String;
    procedure DBgridShow;
    function CheckDateOf: Boolean;
    procedure InitOfValue;
  end;

var
  Fpsa30101: TFpsa30101;

implementation

uses  Calen1,FormMon1 ;    //Calen2,
{$R *.DFM}

procedure TFpsa30101.DBgridShow;
begin
  DBgrid1.Enabled := True;
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT YYMM, BASEYEAR, LIMITAMT, STDAMT1, MAXAMT1, STDAMT2, MAXAMT2, ');
       Sql.Add('       INTRATE, REPMAXMM, WORKFRDATE, WORKTODATE, REPAYBEGIN         ');
       Sql.Add('  FROM PSCLOANS                                                      ');
       Sql.Add(' ORDER BY YYMM DESC                                                  ');
       Open;

       if RecordCount <= 0 then
       begin
            InitOfValue;
            Phelpmsg.Caption := '  자료가 없습니다.';
            DBgrid1.Enabled := False;
            Exit;
       end
       else Phelpmsg.Caption := '  등록작업을 시작하세요.';
  end;
end;

procedure TFpsa30101.FormCreate(Sender: TObject);
begin
  Phelpmsg.Caption := ' 작업자,작업일설정 및 주택자금대출/상환내역을 조회하고 있습니다,잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  CheckOfEnter     := False;
end;

procedure TFpsa30101.FormShow(Sender: TObject);
begin
  DBgridShow;
end;

procedure TFpsa30101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFpsa30101.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa30101.sbtnKunsokUpClick(Sender: TObject);
begin
  if   NEbaseyear.Value < 9 then NEbaseyear.Value := NEbaseyear.Value + 1
  else                           NEbaseyear.Value := 9;
end;

procedure TFpsa30101.sbtnKunsokDownClick(Sender: TObject);
begin
  if   NEbaseyear.Value > 1 then NEbaseyear.Value := NEbaseyear.Value - 1
  else                           NEbaseyear.Value := 1;
end;

procedure TFpsa30101.sbtnRepmaxmmUpClick(Sender: TObject);
begin
  if   NErepmaxmm.Value < 99 then NErepmaxmm.Value := NErepmaxmm.Value + 1
  else                            NErepmaxmm.Value := 99;
end;

procedure TFpsa30101.sbtnRepmaxmmDownClick(Sender: TObject);
begin
  if   NErepmaxmm.Value > 0 then NErepmaxmm.Value := NErepmaxmm.Value - 1
  else                           NErepmaxmm.Value := 0;
end;

procedure TFpsa30101.sbtnRepaybeginUpClick(Sender: TObject);
begin
  if   NErepaybegin.Value < 9 then NErepaybegin.Value := NErepaybegin.Value + 1
  else                             NErepaybegin.Value := 9;
end;

procedure TFpsa30101.sbtnRepaybeginDownClick(Sender: TObject);
begin
  if   NErepaybegin.Value > 0 then NErepaybegin.Value := NErepaybegin.Value - 1
  else                             NErepaybegin.Value := 0;
end;

procedure TFpsa30101.sbtnIntrateUpClick(Sender: TObject);
begin
  if   NEintrate.Value < 99 then NEintrate.Value := NEintrate.Value + 1
  else                           NEintrate.Value := 99;
end;

procedure TFpsa30101.sbtnIntrateDownClick(Sender: TObject);
begin
  if   NEintrate.Value > 0 then NEintrate.Value := NEintrate.Value - 1
  else                          NEintrate.Value := 0;
end;

procedure TFpsa30101.NEbaseyearExit(Sender: TObject);
begin
  if NEbaseyear.Value < 0 then NEbaseyear.Value := 0;
  if NEbaseyear.Value > 9 then NEbaseyear.Value := 9;
end;

procedure TFpsa30101.NErepmaxmmExit(Sender: TObject);
begin
  if NErepmaxmm.Value < 0  then NErepmaxmm.Value := 0;
  if NErepmaxmm.Value > 99 then NErepmaxmm.Value := 99;
end;

procedure TFpsa30101.NErepaybeginExit(Sender: TObject);
begin
  if NErepaybegin.Value < 0 then NErepaybegin.Value := 0;
  if NErepaybegin.Value > 9 then NErepaybegin.Value := 9;
end;

procedure TFpsa30101.NEintrateExit(Sender: TObject);
begin
  if NEintrate.Value < 0  then NEintrate.Value := 0;
  if NEintrate.Value > 99 then NEintrate.Value := 99;
end;

procedure TFpsa30101.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  InitOfValue;
  MEyymm.Text        := OraQuery1YYMM.AsString;
  NEbaseyear.Value   := OraQuery1BASEYEAR.AsFloat;
  NEstdamt1.Value    := OraQuery1STDAMT1.AsFloat;
  NEmaxamt1.Value    := OraQuery1MAXAMT1.AsFloat;
  NEstdamt2.Value    := OraQuery1STDAMT2.AsFloat;
  NEmaxamt2.Value    := OraQuery1MAXAMT2.AsFloat;
  NElimitamt.Value   := OraQuery1LIMITAMT.AsFloat;
  NErepmaxmm.Value   := OraQuery1REPMAXMM.AsFloat;
  NEintrate.Value    := OraQuery1INTRATE.AsFloat * 100;
  MEworkfrdate.Text  := OraQuery1WORKFRDATE.AsString;
  MEworktodate.Text  := OraQuery1WORKTODATE.AsString;
  NErepaybegin.Value := OraQuery1REPAYBEGIN.AsFloat;
end;

procedure TFpsa30101.SpeedButton1Click(Sender: TObject);
begin
{
  Calendar2 := TCalendar2.Create(Self);
  try
    Calendar2.ShowModal;
    if Calendar2.GSym <> '' then MEyymm.Text := Calendar2.GSym;
  finally
    Calendar2.Free;
  end;
}
    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
        MEyymm.Text := Copy(MonthForm.DayCaption,1,6);//+'-'+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
end;

procedure TFpsa30101.MEyymmEnter(Sender: TObject);
begin
  if CheckOfEnter = False then
  begin
       CheckOfEnter := True;
       Exit;
  end;
  CheckOfEnter     := True;
  BBsave.Enabled   := False;
  Phelpmsg.Caption := '  입력후 반드시 ENTER KEY를 눌러야 결과가 반영됩니다.';
end;

procedure TFpsa30101.InitOfValue;
begin
  NEbaseyear.Value   := 0;
  NEstdamt1.Value    := 0;
  NEmaxamt1.Value    := 0;
  NEstdamt2.Value    := 0;
  NEmaxamt2.Value    := 0;
  NElimitamt.Value   := 0;
  NErepmaxmm.Value   := 0;
  NEintrate.Value    := 0;
  MEworkfrdate.Text  := '';
  MEworktodate.Text  := '';
  NErepaybegin.Value := 0;
end;

procedure TFpsa30101.MEyymmKeyPress(Sender: TObject; var Key: Char);
var
  qq : TOraQuery;
begin
  if Key <> #13 then exit;

  BBsave.Enabled := True;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT YYMM, BASEYEAR, LIMITAMT, STDAMT1, MAXAMT1, STDAMT2, MAXAMT2, ');
            Sql.Add('       INTRATE, REPMAXMM, WORKFRDATE, WORKTODATE, REPAYBEGIN         ');
            Sql.Add('FROM   PSCLOANS                                                      ');
            Sql.Add('WHERE YYMM = :yymm                                                   ');
            ParamByName('yymm').AsString := Trim(MEyymm.Text) ;
            Open;

            if RecordCount <= 0 then
            begin
                 InitOfValue;
                 Phelpmsg.Caption := '  새로운 자료를 입력하세요.';
                 MEyymm.SetFocus;
                 Exit;
            end;
            NEbaseyear.Value   := FieldByName('BASEYEAR').AsFloat;
            NEstdamt1.Value    := FieldByName('STDAMT1').AsFloat;
            NEmaxamt1.Value    := FieldByName('MAXAMT1').AsFloat;
            NEstdamt2.Value    := FieldByName('STDAMT2').AsFloat;
            NEmaxamt2.Value    := FieldByName('MAXAMT2').AsFloat;
            NElimitamt.Value   := FieldByName('LIMITAMT').AsFloat;
            NErepmaxmm.Value   := FieldByName('REPMAXMM').AsFloat;
            NEintrate.Value    := FieldByName('INTRATE').AsFloat * 100;
            MEworkfrdate.Text  := FieldByName('WORKFRDATE').AsString;
            MEworktodate.Text  := FieldByName('WORKTODATE').AsString;
            NErepaybegin.Value := FieldByName('REPAYBEGIN').AsFloat;
       end;
  finally
       qq.Free;
  end;
end;

procedure TFpsa30101.SpeedButton2Click(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  try
    Calendar.ShowModal;
    if Calendar.DayCaption <> '' then MEworkfrdate.Text := Calendar.DayCaption;
  finally
    Calendar.Free;
  end;
end;

procedure TFpsa30101.SpeedButton3Click(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  try
    Calendar.ShowModal;
    if Calendar.DayCaption <> '' then MEworktodate.Text := Calendar.DayCaption;
  finally
    Calendar.Free;
  end;
end;

procedure TFpsa30101.BBabortClick(Sender: TObject);
begin
  CheckOfEnter := False;
  DBgridShow;
end;

procedure TFpsa30101.BBsaveClick(Sender: TObject);
var LsYear, LsMonth : String;
    qq : TOraQuery;
begin
  if DateCheck(MEyymm.Text+'01') = false then
  begin
       MessageBox(Handle,'기준년월 확인바랍니다', '일자오류', mb_iconwarning);
       Exit;
  end;

  if DateCheck(MEworkfrdate.Text) = false then
  begin
       MessageBox(Handle,'신청기간 확인바랍니다', '일자오류', mb_iconwarning);
       Exit;
  end;

  if DateCheck(MEworktodate.Text) = false then
  begin
       MessageBox(Handle,'신청기간 확인바랍니다', '일자오류', mb_iconwarning);
       Exit;
  end;

  LsYear  := Copy(MEyymm.Text, 1, 4);
  LsMonth := Copy(MEyymm.Text, 5, 2);

  if StrToInt(LsMonth) = 1 then
  begin
       LsYear := IntToStr(StrToInt(LsYear) - 1);
       LsMonth := '12';
  end
  else
  begin
       LsYear := LsYear;
       LsMonth := IntToStr(StrToInt(LsMonth) - 1);
  end;

  if   Length(LsMonth) = 1 then LsMonth := '0'+LsMonth
  else                          LsMonth := LsMonth;
  LsYear := LsYear + LsMonth;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT WORKTODATE FROM PSCLOANS ');
            Sql.Add('WHERE YYMM = :yymm              ');
            ParamByName('yymm').AsString := LsYear;
            Open;

            if MEworkfrdate.Text <= Fields[0].AsString then
            begin
                 MessageBox(Handle,'   당월대출처리 신청기간의 최대일이 전월의 당월일보다 커야합니다','날짜입력오류', mb_iconwarning);
                 Exit;
            end;
       end;
  finally
       qq.Free;
  end;

  if NEstdamt1.Value > NEmaxamt1.Value then
  begin
       MessageBox(Handle,'기준대출금액1은 최대대출금액1보다 작거나 같아야 합니다','입력오류', mb_iconwarning);
       NEstdamt1.SetFocus;
       Exit;
  end;

  if NEstdamt2.Value > NEmaxamt2.Value then
  begin
       MessageBox(Handle,'기준대출금액2은 최대대출금액2보다 작거나 같아야 합니다','입력오류', mb_iconwarning);
       NEstdamt2.SetFocus;
       Exit;
  end;

  if NEstdamt1.Value > NEstdamt2.Value then
  begin
       MessageBox(Handle,'기준대출금액1은 기준대출금액1보다 작거나 같아야 합니다','입력오류', mb_iconwarning);
       NEstdamt1.SetFocus;
       Exit;
  end;

  if NEmaxamt1.Value > NEmaxamt2.Value then
  begin
       MessageBox(Handle,'최대대출금액1은 최대대출금액2보다 작거나 같아야 합니다','입력오류', mb_iconwarning);
       NEmaxamt1.SetFocus;
       Exit;
  end;

  if NEmaxamt1.Value > NElimitamt.Value  then
  begin
       MessageBox(Handle,'   총대출금액이 작습니다','입력오류', mb_iconwarning);
       NElimitamt.SetFocus;
       Exit;
  end;

  if NEmaxamt2.Value > NElimitamt.Value  then
  begin
       MessageBox(Handle,'   총대출금액이 작습니다','입력오류', mb_iconwarning);
       NElimitamt.SetFocus;
       Exit;
  end;

  if CheckDateOf = False then
  begin
       Phelpmsg.Caption := '  기준등록 작업을 시작하세요.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       Exit;
  end;


  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            Sql.Add('SELECT YYMM FROM PSCLOANS ');
            Sql.Add(' WHERE YYMM = :yymm       ');
            ParamByName('yymm').AsString := Trim(MEyymm.Text);
            Open;

            if RecordCount <= 0 then
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('INSERT INTO PSCLOANS  VALUES                            ');
                 Sql.Add('      (:YYMM,     :BASEYEAR,   :LIMITAMT,  :STDAMT1,    ');
                 Sql.Add('       :MAXAMT1,  :STDAMT2,    :MAXAMT2,   :INTRATE,    ');
                 Sql.Add('       :REPMAXMM, :WORKFRDATE, :WORKTODATE,:REPAYBEGIN, ');
                 Sql.Add('       :WRITETIME, :WRITEMAN )                          ');
                 ParamByName('YYMM').AsString      := Trim(MEyymm.Text);
                 ParamByName('BASEYEAR').AsFloat   := NEbaseyear.Value;
                 ParamByName('LIMITAMT').AsFloat   := NElimitamt.Value;
                 ParamByName('STDAMT1').AsFloat    := NEstdamt1.Value;
                 ParamByName('MAXAMT1').AsFloat    := NEmaxamt1.Value;
                 ParamByName('STDAMT2').AsFloat    := NEstdamt2.Value;
                 ParamByName('MAXAMT2').AsFloat    := NEmaxamt2.Value;
                 ParamByName('INTRATE').AsFloat    := NEintrate.Value / 100;
                 ParamByName('REPMAXMM').AsFloat   := NErepmaxmm.Value;
                 ParamByName('WORKFRDATE').AsString:= Trim(MEworkfrdate.Text);
                 ParamByName('WORKTODATE').AsString:= Trim(MEworktodate.Text);
                 ParamByName('REPAYBEGIN').AsFloat := NErepaybegin.Value;
                 ParamByName('WRITETIME').AsString := Fn_GetDateTimeStr;
                 ParamByName('WRITEMAN').AsString  := Pempno;
                 ExecSql;
            end
            else
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('UPDATE PSCLOANS                ');
                 Sql.Add('SET BASEYEAR   = :BASEYEAR,    ');
                 Sql.Add('    LIMITAMT   = :LIMITAMT,    ');
                 Sql.Add('    STDAMT1    = :STDAMT1,     ');
                 Sql.Add('    MAXAMT1    = :MAXAMT1,     ');
                 Sql.Add('    STDAMT2    = :STDAMT2,     ');
                 Sql.Add('    MAXAMT2    = :MAXAMT2,     ');
                 Sql.Add('    INTRATE    = :INTRATE,     ');
                 Sql.Add('    REPMAXMM   = :REPMAXMM,    ');
                 Sql.Add('    WORKFRDATE = :WORKFRDATE,  ');
                 Sql.Add('    WORKTODATE = :WORKTODATE,  ');
                 Sql.Add('    REPAYBEGIN = :REPAYBEGIN,  ');
                 Sql.Add('    WRITETIME  = :WRITETIME,   ');
                 Sql.Add('    WRITEMAN   = :WRITEMAN     ');
                 Sql.Add('WHERE YYMM = '''+Trim(MEyymm.Text)+''' ');
                 ParamByName('BASEYEAR').AsFloat    := NEbaseyear.Value;
                 ParamByName('LIMITAMT').AsFloat    := NElimitamt.Value;
                 ParamByName('STDAMT1').AsFloat     := NEstdamt1.Value;
                 ParamByName('MAXAMT1').AsFloat     := NEmaxamt1.Value;
                 ParamByName('STDAMT2').AsFloat     := NEstdamt2.Value;
                 ParamByName('MAXAMT2').AsFloat     := NEmaxamt2.Value;
                 ParamByName('INTRATE').AsFloat     := NEintrate.Value / 100;
                 ParamByName('REPMAXMM').AsFloat    := NErepmaxmm.Value;
                 ParamByName('WORKFRDATE').AsString := Trim(MEworkfrdate.Text);
                 ParamByName('WORKTODATE').AsString := Trim(MEworktodate.Text);
                 ParamByName('REPAYBEGIN').AsFloat  := NErepaybegin.Value;
                 ParamByName('WRITETIME').AsString  := Fn_GetDateTimeStr;
                 ParamByName('WRITEMAN').AsString   := Pempno;
                 ExecSql;
            end;
       end;
  finally
       qq.Free;
  end;
    DBgridShow;
    MessageBeep(0);
    Phelpmsg.Caption := '  등록작업이 완료되었습니다.';
end;

function TFpsa30101.CheckDateOf: Boolean;
var LsYear, LsMonth : String;
begin
  LsYear  := Copy(MEyymm.Text, 1, 4);
  LsMonth := Copy(MEyymm.Text, 5, 2);

  if StrToInt(LsMonth) = 1 then
  begin
       if (StrToInt(LsYear) - 1) <> StrToInt(Copy(MEworkfrdate.Text, 1, 4)) then
       begin
            MessageBox(Handle,'   신청기간의 년도오류입니다','날짜입력오류', mb_iconwarning);
            MEworkfrdate.SetFocus;
            CheckDateOf := False;
            Exit;
       end;
       if StrToInt(Copy(MEworkfrdate.Text, 5, 2)) <> 12 then
       begin
            MessageBox(Handle,'   신청기간의 월입력오류입니다','날짜입력오류', mb_iconwarning);
            MEworkfrdate.SetFocus;
            CheckDateOf := False;
            Exit;
       end;
  end
  else
  begin
       if LsYear <> Copy(MEworkfrdate.Text, 1, 4) then
       begin
            MessageBox(Handle,'   신청기간의 년도오류입니다','날짜입력오류', mb_iconwarning);
            MEworkfrdate.SetFocus;
            CheckDateOf := False;
            Exit;
       end;
       if (StrToInt(Copy(MEworkfrdate.Text, 5, 2)) + 1) <> StrToInt(LsMonth) then
       begin
            MessageBox(Handle,'   신청기간의 월입력오류입니다','날짜입력오류', mb_iconwarning);
            MEworkfrdate.SetFocus;
            CheckDateOf := False;
            Exit;
       end;
  end;

  if LsYear <> Copy(MEworktodate.Text, 1, 4) then
  begin
       MessageBox(Handle,'   신청기간의 년도오류입니다','날짜입력오류', mb_iconwarning);
       MEworktodate.SetFocus;
       CheckDateOf := False;
       Exit;
  end;
  if LsMonth <> Copy(MEworktodate.Text, 5, 2)  then
  begin
       MessageBox(Handle,'   신청기간의 월입력오류입니다','날짜입력오류', mb_iconwarning);
       MEworktodate.SetFocus;
       CheckDateOf := False;
       Exit;
  end;
  CheckDateOf := True;
end;

procedure TFpsa30101.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if   ID_YES = MessageBox(Handle,'종료하시겠습니까?','주의', MB_SYSTEMMODAL + MB_ICONEXCLAMATION + MB_YESNO) then
       CanClose := True
  else CanClose := False;
end;

procedure TFpsa30101.OraQuery1CalcFields(DataSet: TDataSet);
begin
  OraQuery1F_LIMITAMT.AsString := Format('%15.0n', [OraQuery1LIMITAMT.AsFloat]);
end;

end.

