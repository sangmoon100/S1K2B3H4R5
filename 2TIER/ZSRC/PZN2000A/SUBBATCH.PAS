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
  with Ory_juminid do   // 재직중이면서 주민가 동일하면 저장 안되게 체크
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
       gsJuminMsg := '중복된 주민번호 입력'+#13#10;
  end
  else If Length(No) <> 13 then
  begin
       Result:= False;
       gsJuminMsg := '자릿수가 틀린 주민번호 입력.';
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
         gsJuminMsg := '잘못된 주민번호 입력';
       Except
         Result:= False;
         gsJuminMsg := '잘못된 주민번호 입력 Error';
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
  StringGrid1.Cells[ 0,0] := '회사코드';
  StringGrid1.Cells[ 1,0] := '사원번호';
  StringGrid1.Cells[ 2,0] := '사원성명';
  StringGrid1.Cells[ 3,0] := '주민번호';
  StringGrid1.Cells[ 4,0] := '부서코드';
  StringGrid1.Cells[ 5,0] := '입사일';
  StringGrid1.Cells[ 6,0] := '핸드폰';
  StringGrid1.Cells[ 7,0] := '사무실Tel';
  StringGrid1.Cells[ 8,0] := 'SK-Email';
  StringGrid1.Cells[ 9,0] := '담당업무';
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

  Case MessageDlg('일괄저장할 데이터 업로드이면 Yes를 선택하세요.', mtConfirmation, [mbYes, mbCancel], 0) of
       mrYes : Work := 1;
  else
       System.Exit;
  end;

  try
       v:= CreateOleObject('Excel.application');
  except
       ShowMessage('Excel이 설치되어 있어야 합니다.');
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
                                                   Trim(v.cells[iRow, 2])+' - 동일회사코드없음');
                         end;
                      2: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 사원성명없음');
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
                                                   Trim(v.cells[iRow, 2])+' - 동일부서코드없음');
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
                 ShowMessage('사번을 정확히 입력하세요.');
                 Exit;
            end;
            if not CheckEmpno(Uppercase(v.cells[iRow, 1]),sEmpno) then
                 Memo1.Lines.Add(inttoStr(iRow)+','+
                                 Trim(v.cells[iRow, 1])+','+
                                 Trim(v.cells[iRow, 2])+','+
                                 Trim(v.cells[iRow, 3])+'-이 사원은 없습니다.');
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
       Memo1.Lines.Add('상기 오류 내역 수정후 재작업 요망.');
       Memo1.Lines.Add('==================================');
       Memo1.Lines.Add('중복된 주민번호 입력 오류사원에 경우 ');   //재직중이면서 주민가 동일하면 저장 안되게 체크
       Memo1.Lines.Add('재직중인 동일 사원이 존재함으로 해당사원 검색후  ');
       Memo1.Lines.Add('해당사번으로 사용해 주시기 바랍니다.             ');

       StringGrid_Clear;
       ErrorPanel.Visible := True;
       P_Help.Visible     := True;
       System.Exit;
  end;

  P_helpinfo.SimpleText := ('총 ' + IntTostr(Cnt -1) + ' 건의 엑셀파일 로드가 완료 되었습니다.');

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

  if MessageDlg('일괄저장 작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       Memo1.Lines.Text := '';
       For MRow := 1 to StringGrid1.RowCount -1 do
       begin
            if CheckEmpno(StringGrid1.Cells[0, MRow], StringGrid1.Cells[1, MRow]) Then
                 Memo1.Lines.Add(IntToStr(MRow)+','+
                                 Trim(StringGrid1.Cells[0, MRow])+','+
                                 Trim(StringGrid1.Cells[1, MRow])+','+
                                 Trim(StringGrid1.Cells[2, MRow])+'-사번중복오류');

       end;  //Row For End

       if Memo1.Lines.Text <> '' then
       begin
            Memo1.Lines.Add('==================================');
            Memo1.Lines.Add('상기 오류 내역 수정후 재작업 요망.');
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
                 ParamByName('P13').AsString := FM_MainMenu.FG_Empno;   // 작업자
                 ParamByName('P14').AsString := Copy(Fn_GetDateTimeStr,1,14);
                 ExecSql;         //edit1.text := sql.text;
                 Cnt := Cnt + 1;
            end;
       end;  //Row For End
       StringGrid1.ColCount := 3;
       BT_Insert.Enabled    := False;
       BT_Delete.Enabled    := True;
       MessageDlg('총 ' + IntTostr(Cnt) + '건의 데이터 저장완료.', mtInformation,[mbOK],0);
  end;
end;

procedure TFM_Batch.BT_DeleteClick(Sender: TObject);
var
  MRow, Cnt : integer ;
  sEmpno : String;
begin
  Cnt := 0;
  if MessageDlg('일괄 삭제작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  
  For MRow := 1 to StringGrid1.RowCount -1 do
  begin
       if      length(Trim(StringGrid1.Cells[1, MRow])) = 1 then sEmpno := '000' + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 2 then sEmpno := '00'  + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 3 then sEmpno := '0'   + Trim(StringGrid1.Cells[1, MRow])
       else if length(Trim(StringGrid1.Cells[1, MRow])) = 4 then sEmpno := Trim(StringGrid1.Cells[1, MRow])
       else
       begin
            ShowMessage('사번을 정확히 입력하세요.');
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
  MessageDlg('총 ' + IntTostr(Cnt) + '건의 데이터 삭제완료.', mtInformation,[mbOK],0);
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
  P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 9], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if cbx_down.ItemIndex = 0 then
  begin
       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '회사코드';
       XArr[2]  := '사원성명';
       XArr[3]  := '주민번호(''-''입력)';
       XArr[4]  := '부서코드';
       XArr[5]  := '입사일(ex. 20140101)';
       XArr[6]  := '핸드폰';
       XArr[7]  := '사무실Tel';
       XArr[8]  := 'SKemail';
       XArr[9]  := '담당업무';
       XL.Range['A1', 'I1'].Value := XArr;
       XL.Range['A1', 'I1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'I1'].Interior.Color:= $00CBF0B3;
       XL.Range['A1', 'I1'].Select;                    //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                   //자동정렬
  end
  else
  begin
       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '회사코드';
       XArr[2]  := '사원번호';

       XL.Range['A1', 'B1'].Value := XArr;
       XL.Range['A1', 'B1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'B1'].Interior.Color:= $00CBF0B3;
  end;
  XL.Visible := true;                 //엑셀자료 보여줌
  P_helpinfo.SimpleText := '';
end;

end.


