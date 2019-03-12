unit pkc11304;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, pebtnedit,
  Db, DBTables, Animate, Func, KeyEmpno, KeyEmpnoY, OnDBGrid, OnGrDBGrid,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl;//pass,

type
  TFpkc11304 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    BBdelete: TBitBtn;
    BBsave: TBitBtn;
    Panel1: TPanel;
    Panel18: TPanel;
    Sempno: TEdit;
    Panel7: TPanel;
    MEPaydate: TMaskEdit;
    SBfrdate: TSpeedButton;
    BitBtn2: TBitBtn;
    CBpaytype: TComboBox;
    Panel2: TPanel;
    DbGrid1: TOnGrDbGrid;
    E_Yeartax: TOnNumberEdit;
    Panel16: TPanel;
    Panel3: TPanel;
    E_TaxRate: TOnNumberEdit;
    E_TaxAmt: TOnNumberEdit;
    Panel4: TPanel;
    Panel6: TPanel;
    E_AdminMemo: TOnEdit;
    DataSource1: TDataSource;
    Panel10: TPanel;
    Eempno: TOnEdit;
    BitBtn1: TBitBtn;
    Lkorname: TLabel;
    L_Sum: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure SBfrdateClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure MEPaydateChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure EempnoChange(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    start : boolean;
    SelForm : TForm;
  public
    { Public declarations }
    SMsg : String;
    procedure Retrieve;
  end;

var
  Fpkc11304: TFpkc11304;

implementation

uses pkc11303, Formmon1, calen1, pkc11301;//pkc11302,

{$R *.DFM}

procedure TFpkc11304.Retrieve;
begin
  with DM.Ory_Pkyeartax do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT a.*, b.korname                                 ');
     SQL.Add('  FROM Pkyeartax a, pimpmas b                         ');
     SQL.Add(' WHERE a.empno = b.empno                              ');
     SQL.Add('   and a.Paydate like :Paydate                        ');
     SQL.Add('   and a.PayType = :PayType                           ');
     SQL.Add('   and (a.EMPNO like :empno or b.korname like :empno) ');
     SQL.Add(' ORDER BY a.empno                                     ');
     ParamByName('Paydate').AsString := MEPaydate.text;
     ParamByName('PayType').AsString := inttostr(CBpaytype.ItemIndex);
     if trimright(Sempno.text) <> '' then
       ParamByName('empno').AsString := Sempno.text + '%'
     else
       ParamByName('empno').AsString := '%';
     open;
   end;

   with DM.Query2 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select count(nvl(empno,0)) amt from Pkyeartax  ');
     SQL.Add(' where Paydate = :Paydate                      ');
     ParamByName('Paydate').AsString := MEPaydate.Text;
     open;

     L_Sum.Caption := '* 건수 : ' + FormatFloat('#,##0',FieldByName('amt').AsFloat );
  end;
end;

procedure TFpkc11304.FormShow(Sender: TObject);
begin
  Start := True;
  SelForm := nil;
  CBpaytype.ItemIndex := 0;
  MEPaydate.Text := FormatDateTime('YYYYMM', Now);
end;

procedure TFpkc11304.BBsaveClick(Sender: TObject);
begin
  if (length(Eempno.text) < 4)  then begin
     MessageBox(MAINFORM.HANDLE,'사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING);
     Eempno.Setfocus;
     EXIT;
  end;

  if E_Yeartax.Value <= 0 then begin
     MessageBox(MAINFORM.HANDLE,'년간추정 금액을 입력해 주세요','입력오류',MB_ICONWARNING);
     E_Yeartax.Setfocus;
     EXIT;
  end;

  if (E_TaxRate.Value <= 0) and (E_TaxAmt.Value <= 0) then begin
     MessageBox(MAINFORM.HANDLE,'세율과 세액 중 반드시 하나의 항목을 입력해 주세요','입력오류',MB_ICONWARNING);
     E_TaxRate.Setfocus;
     EXIT;
  end;

  if MessageBox(MAINFORM.HANDLE,'저장하시겠습니까?','저장확인',MB_YESNO) = IDYES then
  begin
     Try
        Ora_Session.StartTransaction;
        with DM.Query2 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('merge into Pkyeartax p                                                   ');
           SQL.Add('using (select empno from pimpmas  a  where empno = :empno) a             ');
           Sql.Add(' on (p.empno = a.empno and p.Paydate = :Paydate and p.paytype = :paytype)');
           SQL.Add('when matched then                                                        ');
           SQL.Add('  update set                                                             ');
           SQL.Add('       p.Yeartax = :Yeartax,                                             ');
           SQL.Add('       p.TaxRate = :TaxRate,                                             ');
           SQL.Add('       p.TaxAmt  = :TaxAmt,                                              ');
           SQL.Add('       p.AdminYN  = :AdminYN,                                            ');
           SQL.Add('       p.AdminMemo  = :AdminMemo,                                        ');
           SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),               ');
           SQL.Add('       writeman = :WRITEMAN                                              ');
           SQL.Add('when not matched then                                                    ');
           SQL.Add('  insert (p.Paydate,p.paytype,p.EMPNO,p.Yeartax,p.TaxRate,p.TaxAmt,p.AdminYN,p.ADMINMEMO,p.writetime,p.writeman)                   ');
           SQL.ADD('  values (:Paydate,:paytype,a.empno,:Yeartax,:TaxRate,:TaxAmt,:AdminYN,:ADMINMEMO,to_char(sysdate, ''YYYYMMDDHH24miss''),:WRITEMAN)');

           ParamByName('empno').AsString      := Eempno.text;
           ParamByName('Paydate').AsString    := MEPaydate.text;
           ParamByName('paytype').AsString    := InttoStr(CBpaytype.ItemIndex);
           ParamByName('Yeartax').AsFloat     := E_Yeartax.Value;
           ParamByName('TaxRate').AsFloat     := E_TaxRate.Value;
           ParamByName('TaxAmt').AsFloat      := E_TaxAmt.Value;
           ParamByName('AdminYN').AsString    := 'Y';
           ParamByName('AdminMemo').AsString  := E_AdminMemo.Text;
           ParamByName('WRITEMAN').AsString   := Pempno;
           ExecSQL;
       end;

       Ora_Session.Commit;
     Except
        on E: EDatabaseError do
        begin
             MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
             Ora_Session.Rollback;
             Exit;
        end;
        //MessageBox(handle,'저장에 실패하였습니다.','[안 내]',MB_OK or $0030);
     end;

     Retrieve;
     phelpmsg.caption := '저장되었습니다... ';
  end;
end;

procedure TFpkc11304.SBfrdateClick(Sender: TObject);
begin
  Try
    MonthForm := TMonthForm.Create(Application);
    MonthForm.rDayCaption := MEPaydate.Text;
    MonthForm.ShowModal;
    MEPaydate.Text := MonthForm.DayCaption;
  Finally
    MonthForm.Free;
  End;
end;

procedure TFpkc11304.BitBtn2Click(Sender: TObject);
begin
  {if length(Eempno.text) < 4 then   begin
     MessageBox(MAINFORM.HANDLE,'조회사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING) ;
     Eempno.Setfocus;
     EXIT;
  end;}

  if (length(MEPaydate.text) < 6) then
  begin
     MessageBox(MAINFORM.HANDLE,'조회기간을 먼저 선택해 주세요','입력오류',MB_ICONWARNING);
     MEPaydate.Setfocus;
     EXIT;
  end;
  Retrieve;
end;

procedure TFpkc11304.BBdeleteClick(Sender: TObject);
begin
{ if Savemode = 1 then
 begin

  if MessageDlg(Copy(MEPaydate.text,1,4) +'/' + Copy(MEPaydate.text,5,2) +'/' + Copy(MEPaydate.text,7,2) +
                   '일자를 삭제하시겠습니까? ', mtInformation, [mbYes, mbNo], 0) = mrYes  then
   begin
    with DM.Query1 do
    begin
      Close;
      Sql.Clear ;
      Sql.Add ('  delete  from pkhothis                  ');
      Sql.Add ('  where  ovtmdate =  '''+MEPaydate.text+'''                             ');
      Sql.Add ('    and  empno =  '''+Eempno.text+'''                              ');
      Sql.Add ('    and  frrealtime =  '''+MEPaydate.text+'''||'''+MEPaydate.text+'''  ');
      ExecSql;
    end;
    Retrieve;
    phelpmsg.caption := '삭제되었습니다... ';
  end ;
  end else
    MessageBox(MainForm.handle,'삭제할 자료를 선택해주세요.','삭제',MB_ICONINFORMATION) ;}
end;

procedure TFpkc11304.MEPaydateChange(Sender: TObject);
begin
//  Retrieve;
end;

procedure TFpkc11304.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Eempno.Text      := DM.Ory_Pkyeartax.FieldbyName('Empno').AsString;
  Lkorname.Caption := DM.Ory_Pkyeartax.FieldbyName('Korname').AsString;
  E_Yeartax.value  := DM.Ory_Pkyeartax.FieldbyName('Yeartax').AsInteger;
  E_TaxRate.value  := DM.Ory_Pkyeartax.FieldbyName('TaxRate').AsInteger;
  E_TaxAmt.value   := DM.Ory_Pkyeartax.FieldbyName('TaxAmt').AsInteger;
  E_AdminMemo.Text := DM.Ory_Pkyeartax.FieldbyName('AdminMemo').AsString;
end;

procedure TFpkc11304.EempnoChange(Sender: TObject);
begin
  Lkorname.caption := '';
  E_Yeartax.Value  := 0;
  E_TaxRate.Value  := 0;
  E_TaxAmt.Value   := 0;
  E_AdminMemo.Text := '';
end;

procedure TFpkc11304.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    key := #0;
    with DM.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.ADD(' SELECT EMPNO, KORNAME ');
      SQL.ADD('   FROM PIMPMAS A ');
      SQL.ADD('  WHERE 1=1 ');
      SQL.ADD('    AND (EMPNO LIKE :empno ');
      SQL.ADD('     OR KORNAME LIKE :empno) ');
      ParamByName('empno').AsString := Eempno.Text + '%';
      Open;

      If RecordCount < 1 then
      begin
        MessageBox(MAINFORM.HANDLE,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING);
        Close;
        Eempno.text := '';
        Exit;
      end
      else If RecordCount = 1 then
      begin
        Eempno.Text := FieldByName('empno').AsString;
        Lkorname.caption := FieldByName('korname').AsString;
      end
      else If RecordCount > 1 then
      begin
        Fkeyempno := TFkeyempno.Create(Self);
        Try
           Fkeyempno.Edempno.Text := Eempno.Text;
           Fkeyempno.ShowModal;
           If Fkeyempno.CloseChk = -1 then Exit;
           Eempno.Text := Fkeyempno.v_KeyEmpno;
           Lkorname.caption := Fkeyempno.v_KeyKorname;
        Finally
           Fkeyempno.Free;
        end;
      end;
    end;
  end;
end;

procedure TFpkc11304.BitBtn1Click(Sender: TObject);
begin
  Try
    Fkeyempno := TFkeyempno.Create(Self);
    Fkeyempno.ShowModal;
    If Fkeyempno.CloseChk = -1 then Exit;
    Eempno.Text      := Fkeyempno.v_KeyEmpno;
    LKorname.caption := Fkeyempno.v_KeyKorname;
  Finally
    Fkeyempno.Free;
  end;
end;

end.
