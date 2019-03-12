unit SubBatch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnFocusButton, ComCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnShapeLabel, Db, MemDS, DBAccess, Ora, Datelib,
  Func, Grids, Comobj, OnScheme;

type
  TFM_Batch = class(TForm)
    OpenDialog1: TOpenDialog;
    Ory_juminid: TOraQuery;
    OnShapeLabel4: TOnShapeLabel;
    P_helpinfo: TStatusBar;
    Panel2: TPanel;
    BT_Delete: TOnFocusButton;
    BT_exit: TOnFocusButton;
    BT_load: TOnFocusButton;
    BT_Insert: TOnFocusButton;
    Bt_Down: TOnFocusButton;
    cbx_down: TComboBox;
    StringGrid1: TStringGrid;
    ErrorPanel: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    Memo1: TMemo;
    BT_ErrorClose: TOnFocusButton;
    P_Help: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    OnShapeLabel2: TOnShapeLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BT_HelpClose: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_DeleteClick(Sender: TObject);
    procedure BT_loadClick(Sender: TObject);
    procedure BT_InsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ErrorCloseClick(Sender: TObject);
    procedure BT_HelpCloseClick(Sender: TObject);
    procedure Bt_DownClick(Sender: TObject);

  private
    LastEmpno : String;
    { Private declarations }
    gsJuminMsg : String;

  public
    { Public declarations }
    Function CheckComCode(ComCd:String):Boolean;
    Function CheckDeptCode(DeptCd:String):Boolean;
    Function CheckJumin(No:String):Boolean;
    Function CheckEmpno(ComCd, sEmpno:String):Boolean;
    Function AutoEmpno:String;
    procedure StringGrid_Clear;

  end;

var
  FM_Batch: TFM_Batch;

implementation

uses SubPmas, PZN2000A1;

{$R *.DFM}

Function TFM_Batch.CheckJumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of Integer = ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
  sJuminid : String;
Begin
  sJuminid := copy(no,1, 6) + '-' + copy(no,7, 13);
  with Ory_juminid do   // �������̸鼭 �ֹΰ� �����ϸ� ���� �ȵǰ� üũ
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select kname                                             ');
       Sql.Add('  From PZSUBMAS                                          ');
       Sql.Add(' Where juminid = ''' + sJuminid +  '''                   ');
       Sql.Add('   And (Trim(Retdate) is null or trim(Retdate) = ''--'') ');
       Open;
  end;
  
  if Ory_juminid.RecordCount >= 1 then
  begin
       Result := False;
       gsJuminMsg := '�ߺ��� �ֹι�ȣ �Է�'+#13#10;
  end
  else If Length(No) <> 13 then
  begin
       Result:= False;
       gsJuminMsg := '�ڸ����� Ʋ�� �ֹι�ȣ �Է�.';
  end
  else
  begin
       Try
         Sum     := 0;
         For Loop:= 1 to  12 do
              Sum:= Sum + StrToInt(No[Loop])*Weight[Loop];
         Rest    := 11-(Sum Mod 11);
         If Rest  = 11 then Rest := 1;
         If Rest  = 10 then Rest := 0;
         Result  := Char(Rest+48) = No[13];
         gsJuminMsg := '�߸��� �ֹι�ȣ �Է�';
       Except
         Result:= False;
         gsJuminMsg := '�߸��� �ֹι�ȣ �Է� Error';
       End;
  end;
End;

Function TFM_Batch.CheckComCode(ComCd:String):Boolean;
Begin
  Result:= False;
  with FM_MainMenu.Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add(' Select COUNT(CODENO) CNT      ');
       Sql.Add('   From PZSUBCODE              ');
       Sql.Add('  Where USEYN  = ''Y''         ');
       Sql.Add('    And CODEID = ''A001''      ');
       Sql.Add('    And CODENO = '''+ComCd+''' ');
       Open;
       if FieldByName('CNT').AsInteger > 0 then Result:= True;
  end;
End;

Function TFM_Batch.CheckDeptCode(DeptCd:String):Boolean;
Begin
  Result:= False;
  with FM_MainMenu.Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add(' Select COUNT(Deptcode) CNT    ');
       Sql.Add('   From PYCDept                ');
       Sql.Add('  Where Closedate is null      ');
       Sql.Add('    And Orgnum = (Select Value1 From Pimvari Where gubun=''00'' And sgubun=''0001'') ');
       Sql.Add('    And Deptcode = '''+deptCd+''' ');
       Open;
       if FieldByName('CNT').AsInteger = 1 then Result:= True
       else                                     Result:= False;
  end;
End;

Function TFM_Batch.CheckEmpno(ComCd, sEmpno:String):Boolean;
Begin
  Try
       with FM_MainMenu.Ora_Qry1 do
       begin
            Close;
            SQL.Clear;
            Sql.Add(' Select count(*) CNT        ');
            Sql.Add('   From PZSUBMAS             ');
            Sql.Add('  Where EMPNO = '''+sEmpno+'''');
            Open;
            if FieldByName('CNT').AsInteger = 1 then Result:= True
            else                                     Result:= False;
       end;
  Except
       Result:= False;
  End;
End;

procedure TFM_Batch.StringGrid_Clear;
var
  i : integer;
begin
  StringGrid1.ColCount    := 10;
  StringGrid1.RowCount    := 2;
  StringGrid1.Cells[ 0,0] := 'ȸ���ڵ�';
  StringGrid1.Cells[ 1,0] := '�����ȣ';
  StringGrid1.Cells[ 2,0] := '�������';
  StringGrid1.Cells[ 3,0] := '�ֹι�ȣ';
  StringGrid1.Cells[ 4,0] := '�μ��ڵ�';
  StringGrid1.Cells[ 5,0] := '�Ի���';
  StringGrid1.Cells[ 6,0] := '�ڵ���';
  StringGrid1.Cells[ 7,0] := '�繫��Tel';
  StringGrid1.Cells[ 8,0] := 'SK-Email';
  StringGrid1.Cells[ 9,0] := '������';
  for i := 0 to 10 do
       StringGrid1.Cells[i,1] := '';
end;

Function TFM_Batch.AutoEmpno : String;
var
  i, ck , ick: integer;
  StEmpno : String;
begin
  if LastEmpno = '0000' then
  begin
       with FM_MainMenu.Ora_Qry1 do
       begin
            Close;
            SQL.Clear;
            Sql.Add('Select decode(substr(max(empno),2,3),''999'',                              ');
            Sql.Add('              decode(substr(max(empno),1,2),''U9'',''UA00'',               ');
            Sql.Add('                     CHR(ASCII(substr(max(empno),1,1))+1)||''00''),        ');
            Sql.Add('       substr(max(empno),1,1)||                                            ');
            Sql.Add('       Lpad(to_char(to_number(substr(max(empno),2,3))+1),3,''0'')) MAXEMPNO');
            Sql.Add('  From PZSUBMAS                                                            ');
            Open;

            StEmpno   := FieldByName('MAXEMPNO').AsString;
            LastEmpno := StEmpno;
            Result    := StEmpno;
       end; // with end
  end //if end
  else
  begin
       StEmpno := InttoStr(StrToint(Copy(LastEmpno,2,3)) + 1) ;
       Case Length(StEmpno) of
         1 : begin
                  LastEmpno := Copy(LastEmpno,1,1) +'00'+ StEmpno;
                  Result    := Copy(LastEmpno,1,1) +'00'+ StEmpno;
             end;
         2 : begin
                  LastEmpno := Copy(LastEmpno,1,1) + '0'+ StEmpno;
                  Result    := Copy(LastEmpno,1,1) + '0'+ StEmpno;
             end;
         3 : begin
                  LastEmpno := Copy(LastEmpno,1,1) + StEmpno;
                  Result    := Copy(LastEmpno,1,1) + StEmpno;
             end;
         4 : begin
                  if Copy(LastEmpno,1,1) = '9' then
                  begin
                       LastEmpno := 'A000';
                       Result    := 'A000';
                  end
                  else
                  begin
                       StEmpno   := Copy(LastEmpno,1,1);
                       LastEmpno := CHR(ORD(StEmpno[1])+1)+'000';
                       Result    := CHR(ORD(StEmpno[1])+1)+'000';
                  end;
             end;
      end;
  end;
end;

procedure TFM_Batch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Batch.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Batch.BT_loadClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT, Sg_RCnt, work : integer;
  sEmpno, sImsiEmpno, sJobcode : String;
begin
  P_Help.Visible    := True;

  Work              := 0;
  StringGrid_Clear;
  BT_Insert.Enabled := False;
  BT_Delete.Enabled := False;
  LastEmpno         := '0000';

  Case MessageDlg('�ϰ������� ������ ���ε��̸� Yes�� �����ϼ���.', mtConfirmation, [mbYes, mbCancel], 0) of
       mrYes : Work := 1;
  else
       System.Exit;
  end;

  try
       v:= CreateOleObject('Excel.application');
  except
       ShowMessage('Excel�� ��ġ�Ǿ� �־�� �մϴ�.');
       Exit;
  end;

  if OpenDialog1.Execute then
  begin
       v.WorkBooks.open(OpenDialog1.FileName);
  end
  else Exit;

  cnt  := strToint(v.ActiveSheet.UsedRange.Rows.Count);
  if Work = 1 then
  begin
       Memo1.Lines.Text := '';
       StringGrid1.ColCount := 10;
       StringGrid1.RowCount := cnt;
       For iRow := 2 to cnt do
       begin
            For iCol := 1 to StringGrid1.ColCount - 1 do
            begin
                 Case iCol of
                      1: begin
                              if not CheckComcode(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - ����ȸ���ڵ����');
                         end;
                      2: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - �����������');
                         end;
                      3: begin
                              if not CheckJumin(Copy(Trim(v.cells[iRow, iCol]),1,6) +
                                   Copy(Trim(v.cells[iRow, iCol]),8,7) ) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2]) + ' - ' + gsJuminMsg );

                         end;
                      4: begin
                              if not CheckDeptcode(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - ���Ϻμ��ڵ����');
                         end;
                 end;

                 if Memo1.Lines.text = '' then
                 begin
                      if (iCol = 1) then
                      begin
                           StringGrid1.Cells[iCol -1, iRow -1] := Uppercase(v.cells[iRow, iCol]) ;
                           StringGrid1.Cells[iCol,    iRow -1] := AutoEmpno;  //AutoEmpno(Uppercase(v.cells[iRow, iCol]));
                      end
                      else if (iCol = 2) or (iCol = 3) then
                      begin
                           StringGrid1.Cells[iCol, iRow -1] := v.cells[iRow, iCol];
                      end
                      else if (iCol = 4) then
                      begin
                           StringGrid1.Cells[iCol, iRow -1] := Uppercase(v.cells[iRow, iCol]);
                      end
                      else if (iCol = 5) or (iCol = 6) or (iCol = 7) or (iCol = 8) or (iCol = 9) then
                      begin
                           StringGrid1.Cells[iCol , iRow -1] := v.cells[iRow, iCol] ;
                      end;
                 end;
            end;
       end;
  end
  else
  begin
       Memo1.Lines.Text     := '';
       StringGrid1.ColCount := 3;
       StringGrid1.RowCount := cnt;
       For iRow := 2 to cnt do
       begin
            sImsiEmpno := v.cells[iRow, 2];
            if      length(sImsiEmpno) = 1 then sEmpno := '000' + sImsiEmpno
            else if length(sImsiEmpno) = 2 then sEmpno := '00'  + sImsiEmpno
            else if length(sImsiEmpno) = 3 then sEmpno := '0'   + sImsiEmpno
            else if length(sImsiEmpno) = 4 then sEmpno :=         sImsiEmpno
            else
            begin
                 ShowMessage('����� ��Ȯ�� �Է��ϼ���.');
                 Exit;
            end;
            if not CheckEmpno(Uppercase(v.cells[iRow, 1]),sEmpno) then
                 Memo1.Lines.Add(inttoStr(iRow)+','+
                                 Trim(v.cells[iRow, 1])+','+
                                 Trim(v.cells[iRow, 2])+','+
                                 Trim(v.cells[iRow, 3])+'-�� ����� �����ϴ�.');
            if Memo1.Lines.text = '' then
                 For iCol := 1 to StringGrid1.ColCount do
                 begin
                      if iCol = 2 then StringGrid1.Cells[iCol -1, iRow -1] := sEmpno
                      else             StringGrid1.Cells[iCol -1, iRow -1] := UpperCase(v.cells[iRow, iCol]) ;
                 end;
       end;
  end;
  v.WorkBooks.Close;
  v.quit ;
  v:=unassigned;

  if Memo1.Lines.Text <> '' then
  begin
       Memo1.Lines.Add('==================================');
       Memo1.Lines.Add('��� ���� ���� ������ ���۾� ���.');
       Memo1.Lines.Add('==================================');
       Memo1.Lines.Add('�ߺ��� �ֹι�ȣ �Է� ��������� ��� ');   //�������̸鼭 �ֹΰ� �����ϸ� ���� �ȵǰ� üũ
       Memo1.Lines.Add('�������� ���� ����� ���������� �ش��� �˻���  ');
       Memo1.Lines.Add('�ش������� ����� �ֽñ� �ٶ��ϴ�.             ');

       StringGrid_Clear;
       ErrorPanel.Visible := True;
       P_Help.Visible     := True;
       System.Exit;
  end;

  P_helpinfo.SimpleText := ('�� ' + IntTostr(Cnt -1) + ' ���� �������� �ε尡 �Ϸ� �Ǿ����ϴ�.');

  if (Cnt - 1) <> 0 then
  begin
       if   work = 1 then BT_Insert.Enabled := True
       else               BT_Delete.Enabled := True;
  end
  else
  begin
       BT_Insert.Enabled := False;
       BT_Delete.Enabled := False;
  end;
  P_Help.Visible := False;
end;

procedure TFM_Batch.BT_InsertClick(Sender: TObject);
var
  MRow, Cnt : integer ;
begin
  P_helpinfo.SimpleText := '';
  Cnt := 0;

  if MessageDlg('�ϰ����� �۾��� �����Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       Memo1.Lines.Text := '';
       For MRow := 1 to StringGrid1.RowCount -1 do
       begin
            if CheckEmpno(StringGrid1.Cells[0, MRow], StringGrid1.Cells[1, MRow]) Then
                 Memo1.Lines.Add(IntToStr(MRow)+','+
                                 Trim(StringGrid1.Cells[0, MRow])+','+
                                 Trim(StringGrid1.Cells[1, MRow])+','+
                                 Trim(StringGrid1.Cells[2, MRow])+'-����ߺ�����');

       end;  //Row For End

       if Memo1.Lines.Text <> '' then
       begin
            Memo1.Lines.Add('==================================');
            Memo1.Lines.Add('��� ���� ���� ������ ���۾� ���.');
            StringGrid_Clear;
            ErrorPanel.Visible := True;
            P_Help.Visible := True;
            System.Exit;
       end;

       ////////////////////////////////////////////////////////////////////////////
       For MRow := 1 to StringGrid1.RowCount -1 do
       begin
            with FM_MainMenu.Ora_Qry1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('Insert into PZSUBMAS (COMCODE,                ');//P1
                 Sql.Add('                      EMPNO,                  ');
                 Sql.Add('                      KNAME,                  ');
                 Sql.Add('                      JUMINID,                ');
                 Sql.Add('                      ORGNUM,                 ');//P5
                 Sql.Add('                      DEPTCODE,               ');
                 Sql.Add('                      REGDATE,                ');//7
                 Sql.Add('                      EMPDATE,                ');
                 Sql.Add('                      HAndP,                  ');
                 Sql.Add('                      OTEL,                   ');
                 Sql.Add('                      SKEMAIL,                ');
                 Sql.Add('                      CJOB1,                  ');
                 Sql.Add('                      WRITEMAN,               ');
                 Sql.Add('                      WRITETIME )             ');
                 Sql.Add('              Values (:P1,                    ');
                 Sql.Add('                      :P2,                    ');
                 Sql.Add('                      :P3,                    ');
                 Sql.Add('                      :P4,                    ');
                 Sql.Add('                      :P5,                    ');
                 Sql.Add('                      :P6,                    ');
                 Sql.Add('                      :P7,                    ');
                 Sql.Add('                      :P8,                    ');
                 Sql.Add('                      :P9,                    ');
                 Sql.Add('                      :P10,                   ');
                 Sql.Add('                      :P11,                   ');
                 Sql.Add('                      :P12,                   ');
                 Sql.Add('                      :P13,                   ');
                 Sql.Add('                      :P14  )                 ');

                 ParamByName('P1' ).AsString := Trim(StringGrid1.Cells[ 0, MRow]);
                 ParamByName('P2' ).AsString := Trim(StringGrid1.Cells[ 1, MRow]);
                 ParamByName('P3' ).AsString := Trim(StringGrid1.Cells[ 2, MRow]);
                 ParamByName('P4' ).AsString := Trim(StringGrid1.Cells[ 3, MRow]);
                 ParamByName('P5' ).AsString := FM_MainMenu.FG_Orgnum;
                 ParamByName('P6' ).AsString := Trim(StringGrid1.Cells[ 4, MRow]);
                 ParamByName('P7' ).AsString := Copy(Fn_GetDateTimeStr,1,8);
                 ParamByName('P8' ).AsString := Trim(StringGrid1.Cells[ 5, MRow]);
                 ParamByName('P9' ).AsString := Trim(StringGrid1.Cells[ 6, MRow]);
                 ParamByName('P10').AsString := Trim(StringGrid1.Cells[ 7, MRow]);
                 ParamByName('P11').AsString := Trim(StringGrid1.Cells[ 8, MRow]);
                 ParamByName('P12').AsString := Trim(StringGrid1.Cells[ 9, MRow]);
                 ParamByName('P13').AsString := FM_MainMenu.FG_Empno;   // �۾���
                 ParamByName('P14').AsString := Copy(Fn_GetDateTimeStr,1,14);
                 ExecSql;         //edit1.text := sql.text;
                 Cnt := Cnt + 1;
            end;
       end;  //Row For End
       StringGrid1.ColCount := 3;
       BT_Insert.Enabled    := False;
       BT_Delete.Enabled    := True;
       MessageDlg('�� ' + IntTostr(Cnt) + '���� ������ ����Ϸ�.', mtInformation,[mbOK],0);
  end;
end;

procedure TFM_Batch.BT_DeleteClick(Sender: TObject);
var
  MRow, Cnt : integer ;
  sEmpno : String;
begin
  Cnt := 0;
  if MessageDlg('�ϰ� �����۾��� �����Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  
  For MRow := 1 to StringGrid1.RowCount -1 do
  begin
       if      length(Trim(StringGrid1.Cells[1, MRow])) = 1 then sEmpno := '000' + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 2 then sEmpno := '00'  + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 3 then sEmpno := '0'   + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 4 then sEmpno := Trim(StringGrid1.Cells[1, MRow])
       else
       begin
            ShowMessage('����� ��Ȯ�� �Է��ϼ���.');
            Exit;
       end;

       with FM_MainMenu.Ora_Qry1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select Count(*) CNT From PZSUBMAS                                      ');
            Sql.Add(' Where Comcode = '''+ Uppercase(Trim(StringGrid1.Cells[0, MRow])) +''' ');
            Sql.Add('   And Empno   = '''+ sEmpno +'''                                      ');
            Open;

            if FieldByName('CNT').AsInteger > 0 then
            begin
                 Cnt := Cnt + 1;

                 Close;
                 Sql.Clear;
                 Sql.Add('Delete From PZSUBMAS                                                   ');
                 Sql.Add(' Where Comcode = '''+ Uppercase(Trim(StringGrid1.Cells[0, MRow])) +''' ');
                 Sql.Add('   And Empno   = '''+ sEmpno +'''                                      ');
                 ExecSQL;
            end;
       end;
  end;

  StringGrid_Clear;
  BT_Insert.Enabled := False;
  BT_Delete.Enabled := False;
  MessageDlg('�� ' + IntTostr(Cnt) + '���� ������ �����Ϸ�.', mtInformation,[mbOK],0);
end;


procedure TFM_Batch.FormShow(Sender: TObject);
begin
  FM_Batch.Left      := FM_MainMenu.Left + 45;
  FM_Batch.Top       := FM_MainMenu.Top  + 55;
  StringGrid_Clear;
  cbx_down.ItemIndex := 0;
end;

procedure TFM_Batch.BT_ErrorCloseClick(Sender: TObject);
begin
  ErrorPanel.Visible := False;
end;

procedure TFM_Batch.BT_HelpCloseClick(Sender: TObject);
begin
  P_Help.Visible     := False;
end;

procedure TFM_Batch.Bt_DownClick(Sender: TObject);
var
  XL, XArr: Variant;
  i,j,k: integer;
  SavePlace: TBookmark;
begin
  P_helpinfo.SimpleText := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 9], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible := false;
  if cbx_down.ItemIndex = 0 then
  begin
       //�÷��� ����_����Ÿ�̺� ����
       XArr[1]  := 'ȸ���ڵ�';
       XArr[2]  := '�������';
       XArr[3]  := '�ֹι�ȣ(''-''�Է�)';
       XArr[4]  := '�μ��ڵ�';
       XArr[5]  := '�Ի���(ex. 20140101)';
       XArr[6]  := '�ڵ���';
       XArr[7]  := '�繫��Tel';
       XArr[8]  := 'SKemail';
       XArr[9]  := '������';
       XL.Range['A1', 'I1'].Value := XArr;
       XL.Range['A1', 'I1'].Borders.LineStyle := 1;    //�׵θ����� �����.  1�� �Ǽ�
       XL.Range['A1', 'I1'].Interior.Color:= $00CBF0B3;
       XL.Range['A1', 'I1'].Select;                    //�ڷḦ ��� Select�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
       XL.Selection.Columns.AutoFit;                   //�ڵ�����
  end
  else
  begin
       //�÷��� ����_����Ÿ�̺� ����
       XArr[1]  := 'ȸ���ڵ�';
       XArr[2]  := '�����ȣ';

       XL.Range['A1', 'B1'].Value := XArr;
       XL.Range['A1', 'B1'].Borders.LineStyle := 1;    //�׵θ����� �����.  1�� �Ǽ�
       XL.Range['A1', 'B1'].Interior.Color:= $00CBF0B3;
  end;
  XL.Visible := true;                 //�����ڷ� ������
  P_helpinfo.SimpleText := '';
end;

end.

