unit pkc11305;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, pebtnedit,
  Db, DBTables, Animate, Func, KeyEmpno, KeyEmpnoY, OnDBGrid, OnGrDBGrid,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnEditBtnCtrl, OnEditCombo;//pass,

type
  TFpkc11305 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    BBdelete: TBitBtn;
    BBsave: TBitBtn;
    Panel1: TPanel;
    Panel18: TPanel;
    Sempno: TEdit;
    Panel7: TPanel;
    DbGrid1: TOnGrDbGrid;
    E_Addamt1: TOnNumberEdit;
    P_NM1: TPanel;
    P_NM2: TPanel;
    E_Addamt2: TOnNumberEdit;
    E_Addamt3: TOnNumberEdit;
    P_NM3: TPanel;
    Workkyy: TEdit;
    Label1: TLabel;
    E_Addamt4: TOnNumberEdit;
    P_NM4: TPanel;
    P_NM5: TPanel;
    E_Addamt5: TOnNumberEdit;
    E_Addamt6: TOnNumberEdit;
    P_NM6: TPanel;
    E_Addsum: TOnNumberEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    BitBtn1: TBitBtn;
    Lkorname: TLabel;
    BB_Save: TBitBtn;
    E_AdminMemo: TOnEdit;
    Panel11: TPanel;
    DataSource1: TDataSource;
    Eempno: TOnEdit;
    Create_Batch: TPanel;
    BitBtn4: TBitBtn;
    BBexit: TBitBtn;
    GroupBox1: TGroupBox;
    Panel12: TPanel;
    C_Empno1: TOnEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    C_Empno2: TOnEdit;
    BitBtn3: TBitBtn;
    C_Choice1: TOnComboEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    C_Choice2: TOnComboEdit;
    Panel13: TPanel;
    C_Choice3: TOnNumberEdit;
    maintitle: TPanel;
    Create_Batch1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    Panel19: TPanel;
    Panel23: TPanel;
    BB_Save1: TBitBtn;
    OnEdit1: TOnEdit;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    OnEdit2: TOnEdit;
    OnEdit4: TOnEdit;
    OnEdit3: TOnEdit;
    OnEdit6: TOnEdit;
    OnEdit5: TOnEdit;
    BitBtn7: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBdeleteClick(Sender: TObject);
    procedure EempnoChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_Addamt1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure WorkkyyExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BB_Save1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
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
  Fpkc11305: TFpkc11305;

implementation

uses pkc11303, Formmon1, calen1, pkc11301;//pkc11302,

{$R *.DFM}

procedure TFpkc11305.FormShow(Sender: TObject);
begin
  Start := True;
  SelForm := nil;
  DM.Qry_Pkyearadd.Close;
  Workkyy.Text := FormatDateTime('YYYY', Now);
  Retrieve;
end;

procedure TFpkc11305.Retrieve;
begin
   with DM.Qry_Pkyearadd do
   begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT a.*, b.korname, (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO = b.PAYCL) BAND  ');
     SQL.Add('  FROM Pkyearadd a, pimpmas b ');
     SQL.Add(' WHERE a.empno = b.empno');
     SQL.Add('   and a.Workyy = :Workyy');
     SQL.Add('   and (a.EMPNO like :empno or b.korname like :empno) ');
     SQL.Add(' ORDER BY a.empno  ');
     ParamByName('Workyy').AsString :=  Workkyy.text;

     if trimright(Sempno.text) <> '' then
       ParamByName('empno').AsString := Sempno.text + '%'
     else
       ParamByName('empno').AsString := '%';
     open;
   end;

   with DM.Query1 do
   begin
     Close;
     SQL.Clear;
     Sql.Add ('select * from PKYEARADDNM ');
     Sql.Add (' where workyy = :workyy   ');
     ParamByName('workyy').AsString := Workkyy.text;
     Open;

     P_NM1.Caption := ''; P_NM2.Caption := ''; P_NM3.Caption := '';
     P_NM4.Caption := ''; P_NM5.Caption := ''; P_NM6.Caption := '';

     DbGrid1.Columns[3].Title.Caption := '';
     DbGrid1.Columns[4].Title.Caption := '';
     DbGrid1.Columns[5].Title.Caption := '';
     DbGrid1.Columns[6].Title.Caption := '';
     DbGrid1.Columns[7].Title.Caption := '';
     DbGrid1.Columns[8].Title.Caption := '';

     DbGrid1.Columns[3].Width := 74;
     if RecordCount >= 1 then
     begin
       P_NM1.Caption := FieldbyName('ADDAMTNM1').AsString;
       P_NM2.Caption := FieldbyName('ADDAMTNM2').AsString;
       P_NM3.Caption := FieldbyName('ADDAMTNM3').AsString;
       P_NM4.Caption := FieldbyName('ADDAMTNM4').AsString;
       P_NM5.Caption := FieldbyName('ADDAMTNM5').AsString;
       P_NM6.Caption := FieldbyName('ADDAMTNM6').AsString;

       DbGrid1.Columns[3].Title.Caption := FieldbyName('ADDAMTNM1').AsString;
       DbGrid1.Columns[4].Title.Caption := FieldbyName('ADDAMTNM2').AsString;
       DbGrid1.Columns[5].Title.Caption := FieldbyName('ADDAMTNM3').AsString;
       DbGrid1.Columns[6].Title.Caption := FieldbyName('ADDAMTNM4').AsString;
       DbGrid1.Columns[7].Title.Caption := FieldbyName('ADDAMTNM5').AsString;
       DbGrid1.Columns[8].Title.Caption := FieldbyName('ADDAMTNM6').AsString;
     end;
   end;
   DbGrid1.Columns[3].Width := 75;
end;

procedure TFpkc11305.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    key := #0;
    with DM.Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.ADD(' SELECT EMPNO, KORNAME ');
      SQL.ADD('   FROM PIMPMAS A');
      SQL.ADD('  WHERE 1=1');
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

procedure TFpkc11305.EempnoChange(Sender: TObject);
begin
  Lkorname.caption := '';
  E_Addamt1.Value  := 0;
  E_Addamt2.Value  := 0;
  E_Addamt3.Value  := 0;
  E_Addamt4.Value  := 0;
  E_Addamt5.Value  := 0;
  E_Addamt6.Value  := 0;
  E_Addsum.Value   := 0;
  E_AdminMemo.Text := '';
end;

procedure TFpkc11305.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Eempno.Text      :=  DM.Qry_Pkyearadd.FieldbyName('Empno').AsString;
  Lkorname.Caption :=  DM.Qry_Pkyearadd.FieldbyName('Korname').AsString;
  E_AdminMemo.Text :=  DM.Qry_Pkyearadd.FieldbyName('AdminMemo').AsString;
  E_Addamt1.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt1').AsInteger;
  E_Addamt2.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt2').AsInteger;
  E_Addamt3.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt3').AsInteger;
  E_Addamt4.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt4').AsInteger;
  E_Addamt5.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt5').AsInteger;
  E_Addamt6.value  :=  DM.Qry_Pkyearadd.FieldbyName('Addamt6').AsInteger;
  E_Addsum.value   :=  DM.Qry_Pkyearadd.FieldbyName('Addsum').AsInteger;
end;

procedure TFpkc11305.BBdeleteClick(Sender: TObject);
begin
  if MessageBox(MAINFORM.HANDLE,'삭제하시겠습니까?','삭제확인',MB_YESNO) = IDYES then
  begin
    with DM.Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add (' delete from Pkyearadd                  ');
      Sql.Add ('  where WorkYY = '''+Workkyy.text+'''   ');
      Sql.Add ('    and empno = '''+Eempno.text+'''     ');
      ExecSql;
    end;
    Retrieve;
    phelpmsg.caption := '삭제되었습니다... ';
  end;
end;

procedure TFpkc11305.BBsaveClick(Sender: TObject);
var
  Savemode : Integer;
begin
  E_Addsum.Value := E_Addamt1.Value + E_Addamt2.Value + E_Addamt3.Value + E_Addamt4.Value + E_Addamt5.Value  + E_Addamt6.Value;

  if (length(Workkyy.text) < 4) then
  begin
     MessageBox(MAINFORM.HANDLE,'조회년도를 선택해 주세요','입력오류',MB_ICONWARNING);
     Workkyy.Setfocus;
     EXIT;
  end;

  if ((length(Eempno.text) < 4) or (Lkorname.caption = '')) then
  begin
     MessageBox(MAINFORM.HANDLE,'사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING);
     Eempno.Setfocus;
     EXIT;
  end;

  if MessageBox(MAINFORM.HANDLE,'저장하시겠습니까?','저장확인',MB_YESNO) = IDYES then
  begin
    Try
      Ora_Session.StartTransaction;
      with DM.Query1 do
      begin
        Close;
        SQL.Clear;
        Sql.Add ('select * from Pkyearadd                     ');
        Sql.Add ('  where  WorkYY =  '''+Workkyy.text+'''     ');
        Sql.Add ('    and  empno =  '''+Eempno.text+'''       ');
        Open;

        if ReCordCount <> 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('update Pkyearadd                            ');
          SQL.Add('   set Addamt1 = :Addamt1,                  ');
          SQL.Add('       Addamt2 = :Addamt2,                  ');
          SQL.Add('       Addamt3 = :Addamt3,                  ');
          SQL.Add('       Addamt4 = :Addamt4,                  ');
          SQL.Add('       Addamt5 = :Addamt5,                  ');
          SQL.Add('       Addamt6 = :Addamt6,                  ');
          SQL.Add('       Addsum = :Addsum,                    ');
          SQL.Add('       AdminMemo = :AdminMemo,              ');
          SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),  ');
          SQL.Add('       writeman = :WRITEMAN                 ');
          Sql.Add('where  WorkYY =  '''+Workkyy.text+'''       ');
          Sql.Add('  and  empno =  '''+Eempno.text+'''         ');

          ParamByName('Addamt1').AsFloat := E_Addamt1.Value;
          ParamByName('Addamt2').AsFloat := E_Addamt2.Value;
          ParamByName('Addamt3').AsFloat := E_Addamt3.Value;
          ParamByName('Addamt4').AsFloat := E_Addamt4.Value;
          ParamByName('Addamt5').AsFloat := E_Addamt5.Value;
          ParamByName('Addamt6').AsFloat := E_Addamt6.Value;
          ParamByName('Addsum').AsFloat  := E_Addsum.Value;
          ParamByName('AdminMemo').AsString := E_AdminMemo.Text;
          ParamByName('WRITEMAN').AsString  := Pempno;
          ExecSQL;
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.ADD(' INSERT INTO Pkyearadd                            ');
          SQL.ADD(' (WORKYY,EMPNO,ADDAMT1,ADDAMT2,ADDAMT3,ADDAMT4,ADDAMT5,ADDAMT6,ADDSUM,ADMINMEMO,WRITETIME,WRITEMAN)');
          SQL.ADD(' values(:WORKYY,:EMPNO,:ADDAMT1,:ADDAMT2,:ADDAMT3,:ADDAMT4,:ADDAMT5,:ADDAMT6,:ADDSUM,:ADMINMEMO,   ');
          SQL.ADD(' to_char(sysdate, ''YYYYMMDDHH24miss''), :WRITEMAN)');

          ParamByName('WORKYY').AsString := Workkyy.text;
          ParamByName('EMPNO').AsString  := Eempno.Text;
          ParamByName('Addamt1').AsFloat := E_Addamt1.Value;
          ParamByName('Addamt2').AsFloat := E_Addamt2.Value;
          ParamByName('Addamt3').AsFloat := E_Addamt3.Value;
          ParamByName('Addamt4').AsFloat := E_Addamt4.Value;
          ParamByName('Addamt5').AsFloat := E_Addamt5.Value;
          ParamByName('Addamt6').AsFloat := E_Addamt6.Value;
          ParamByName('Addsum').AsFloat  := E_Addsum.Value;
          ParamByName('AdminMemo').AsString := E_AdminMemo.Text;
          ParamByName('WRITEMAN').AsString  := Pempno;
          ExecSQL;
        end;
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

procedure TFpkc11305.E_Addamt1Exit(Sender: TObject);
begin
  E_Addsum.Value := E_Addamt1.Value + E_Addamt2.Value + E_Addamt3.Value + E_Addamt4.Value + E_Addamt5.Value + E_Addamt6.Value;
end;

procedure TFpkc11305.BitBtn1Click(Sender: TObject);
begin
   Try
      Fkeyempno := TFkeyempno.Create(Self);
      Fkeyempno.ShowModal;
      If Fkeyempno.CloseChk = -1 then Exit;
      Eempno.Text       := Fkeyempno.v_KeyEmpno;
      LKorname.caption  := Fkeyempno.v_KeyKorname;
   Finally
      Fkeyempno.Free;
   end;
end;

procedure TFpkc11305.BB_SaveClick(Sender: TObject);
var
  i : integer;
begin
  if (length(Workkyy.text) < 4) then
  begin
     MessageBox(MAINFORM.HANDLE,'조회년도를 선택해 주세요','입력오류',MB_ICONWARNING);
     Workkyy.Setfocus;
     EXIT;
  end;

  with DM.Query1 do
  begin
    Close;
    SQL.Clear;
    Sql.Add ('select * from PYCCODE      ');
    Sql.Add (' where CODEID = ''I112''   ');
    Sql.Add ('   and useyn =  ''Y''      ');
    Sql.Add (' order by codeno           ');
    Open;

    C_Choice2.Items.Clear;
    C_Choice2.DropDownRows := RecordCount;
    first;

    C_Choice2.Items.Add('선택하지않음');
    for i := 1 to RecordCount do
    begin
      C_Choice2.Items.Add(FieldByName('codeno').AsString + ' : ' + FieldByName('codename').AsString);
      next;
    end;
  end;

  C_Choice2.ItemIndex  := 0;
  C_Empno1.text        := '0000';
  C_Empno2.text        := 'ZZZZ';
  C_Choice3.Value      := 0;
  Create_Batch.Left    := 282;
  Create_Batch.Top     := 103;
  Create_Batch.Visible := True;
end;

procedure TFpkc11305.BBexitClick(Sender: TObject);
begin
  Create_Batch.Visible := False;
end;

procedure TFpkc11305.BitBtn2Click(Sender: TObject);
begin
   Try
      Fkeyempno := TFkeyempno.Create(Self);
      Fkeyempno.ShowModal;
      If Fkeyempno.CloseChk = -1 then Exit;
      C_Empno1.Text := Fkeyempno.v_KeyEmpno;
   Finally
      Fkeyempno.Free;
   end;
end;

procedure TFpkc11305.BitBtn3Click(Sender: TObject);
begin
   Try
      Fkeyempno := TFkeyempno.Create(Self);
      Fkeyempno.ShowModal;
      If Fkeyempno.CloseChk = -1 then Exit;
      C_Empno2.Text := Fkeyempno.v_KeyEmpno;
   Finally
      Fkeyempno.Free;
   end;
end;

procedure TFpkc11305.BitBtn4Click(Sender: TObject);
begin
  if ((length(C_Empno1.text) < 4) or (length(C_Empno2.text) < 4)) then begin
     MessageBox(MAINFORM.HANDLE,'사번을 먼저 선택해 주세요','입력오류',MB_ICONWARNING);
     C_Empno1.Setfocus;
     EXIT;
  end;

  if C_Choice3.Value <= 0 then begin
     MessageBox(MAINFORM.HANDLE,'반영금액을 입력해 주세요','입력오류',MB_ICONWARNING);
     C_Choice3.Setfocus;
     EXIT;
  end;

  if MessageBox(MAINFORM.HANDLE,'일괄생성하시겠습니까?','생성확인',MB_YESNO) = IDYES then
  begin
     Try
        Ora_Session.StartTransaction;
        with DM.Query2 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('merge into Pkyearadd p                                 ');
           SQL.Add('using (select empno from  pimpmas                      ');
           SQL.Add('       where pstate < ''80''                           ');
           SQL.Add('         and empno not like ''Y%''                     ');
           SQL.Add('         and empno not like ''M%''                     ');

           if  C_Choice2.Itemindex <> 0 then begin
             Sql.Add('         and paycl = :paycl ');
             ParamByName('paycl').AsString := Copy(C_Choice2.Text,1,3);
           end;

           Sql.Add('         and empno >= :empno1  and  empno <= :empno2) a');
           Sql.Add(' on (p.empno = a.empno and p.workyy = :workyy)         ');
           SQL.Add('when matched then                                      ');
           SQL.Add('  update set                                           ');

           if Copy(C_Choice1.Text,1,1) = '1' then
              SQL.Add('       p.Addamt1 = :Addamt, ')
           else if Copy(C_Choice1.Text,1,1) = '2' then
              SQL.Add('       p.Addamt2 = :Addamt, ')
           else if Copy(C_Choice1.Text,1,1) = '3' then
              SQL.Add('       p.Addamt3 = :Addamt, ')
           else if Copy(C_Choice1.Text,1,1) = '4' then
              SQL.Add('       p.Addamt4 = :Addamt, ')
           else if Copy(C_Choice1.Text,1,1) = '5' then
              SQL.Add('       p.Addamt5 = :Addamt, ')
           else if Copy(C_Choice1.Text,1,1) = '6' then
              SQL.Add('       p.Addamt6 = :Addamt, ');

           SQL.Add('       p.AdminMemo = :AdminMemo                  ');
           SQL.Add('when not matched then                            ');
           SQL.Add('  insert (p.WORKYY,p.EMPNO,p.ADMINMEMO,          ');

           if Copy(C_Choice1.Text,1,1) = '1' then
              SQL.Add('   Addamt1 ) ')
           else if Copy(C_Choice1.Text,1,1) = '2' then
              SQL.Add('   Addamt2 ) ')
           else if Copy(C_Choice1.Text,1,1) = '3' then
              SQL.Add('   Addamt3 ) ')
           else if Copy(C_Choice1.Text,1,1) = '4' then
              SQL.Add('   Addamt4 ) ')
           else if Copy(C_Choice1.Text,1,1) = '5' then
              SQL.Add('   Addamt5 ) ')
           else if Copy(C_Choice1.Text,1,1) = '6' then
              SQL.Add('   Addamt6 ) ') ;

           SQL.ADD('  values (:WORKYY,a.empno,:ADMINMEMO, :Addamt)   ');

           ParamByName('empno1').AsString    := C_Empno1.Text;
           ParamByName('empno2').AsString    := C_Empno2.Text;
           ParamByName('WORKYY').AsString    := Workkyy.text;
           ParamByName('Addamt').AsFloat     := C_Choice3.Value;
           ParamByName('AdminMemo').AsString := '일괄생성';
           ExecSQL;

           Close;
           SQL.Clear;
           SQL.Add('update Pkyearadd set                        ');
           SQL.Add('       Addsum = Addamt1 + Addamt2 + Addamt3 + Addamt4 + Addamt5 + Addamt6, ');
           SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),  ');
           SQL.Add('       writeman = :WRITEMAN                 ');
           Sql.Add('where  WorkYY =  '''+Workkyy.text+'''       ');
           Sql.Add('  and  empno >=  '''+C_Empno1.Text+'''      ');
           Sql.Add('  and  empno <=  '''+C_Empno2.Text+'''      ');
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
     phelpmsg.caption := '생성되었습니다... ';
  end;
end;

procedure TFpkc11305.WorkkyyExit(Sender: TObject);
begin
  if (length(Workkyy.text) < 4) then
  begin
     MessageBox(MAINFORM.HANDLE,'조회년도를 선택해 주세요','입력오류',MB_ICONWARNING);
     Workkyy.Setfocus;
     EXIT;
  end;
end;

procedure TFpkc11305.BitBtn6Click(Sender: TObject);
begin
  Create_Batch1.Visible := False;
  OnEdit1.Text
end;

procedure TFpkc11305.BB_Save1Click(Sender: TObject);
var
  I : integer;
begin
  if (length(Workkyy.text) < 4) then   begin
     MessageBox(MAINFORM.HANDLE,'조회년도를 선택해 주세요','입력오류',MB_ICONWARNING);
     Workkyy.Setfocus;
     EXIT;
  end;

  with DM.Query1 do
  begin
    Close;
    SQL.Clear;
    Sql.Add ('select * from PKYEARADDNM  ');
    Sql.Add ('  where workyy = :workyy   ');
    ParamByName('workyy').AsString := Workkyy.text;
    Open;

    if RecordCount >= 1 then
    begin
      OnEdit1.Text := FieldbyName('ADDAMTNM1').AsString;
      OnEdit2.Text := FieldbyName('ADDAMTNM2').AsString;
      OnEdit3.Text := FieldbyName('ADDAMTNM3').AsString;
      OnEdit4.Text := FieldbyName('ADDAMTNM4').AsString;
      OnEdit5.Text := FieldbyName('ADDAMTNM5').AsString;
      OnEdit6.Text := FieldbyName('ADDAMTNM6').AsString;
    end;
  end;

  Create_Batch1.Left    := 305;
  Create_Batch1.Top     := 85;
  Create_Batch1.Visible := True;
end;

procedure TFpkc11305.BitBtn5Click(Sender: TObject);
begin
  if MessageBox(MAINFORM.HANDLE,'자료를 저장하시겠습니까?','저장확인',MB_YESNO) = IDYES then
  begin
     Try
        Ora_Session.StartTransaction;
        with DM.Query2 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('merge into pkyearaddnm p         ');
           SQL.Add('using dual on (workyy = :workyy) ');
           SQL.Add('when matched then                ');
           SQL.Add('  update set                     ');
           SQL.Add('       p.addamtnm1 = :addamtnm1, ');
           SQL.Add('       p.addamtnm2 = :addamtnm2, ');
           SQL.Add('       p.addamtnm3 = :addamtnm3, ');
           SQL.Add('       p.addamtnm4 = :addamtnm4, ');
           SQL.Add('       p.addamtnm5 = :addamtnm5, ');
           SQL.Add('       p.addamtnm6 = :addamtnm6, ');
           SQL.Add('       p.writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),  ');
           SQL.Add('       p.writeman = :WRITEMAN                                 ');
           SQL.Add('when not matched then                                         ');
           SQL.Add('  insert (p.WORKYY,p.addamtnm1,p.addamtnm2,p.addamtnm3,p.addamtnm4,p.addamtnm5,p.addamtnm6,p.writetime,p.writeman) ');
           SQL.ADD('  values (:WORKYY,:addamtnm1,:addamtnm2,:addamtnm3,:addamtnm4,:addamtnm5,:addamtnm6,to_char(sysdate, ''YYYYMMDDHH24miss''), :WRITEMAN) ');

           ParamByName('WORKYY').AsString     := Workkyy.text;
           ParamByName('addamtnm1').AsString  := OnEdit1.text;
           ParamByName('addamtnm2').AsString  := OnEdit2.text;
           ParamByName('addamtnm3').AsString  := OnEdit3.text;
           ParamByName('addamtnm4').AsString  := OnEdit4.text;
           ParamByName('addamtnm5').AsString  := OnEdit5.text;
           ParamByName('addamtnm6').AsString  := OnEdit6.text;
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
     end;

     Retrieve;
     phelpmsg.caption := '저장되었습니다... ';
  end;
end;

procedure TFpkc11305.BitBtn7Click(Sender: TObject);
begin
  Retrieve;
end;

end.
