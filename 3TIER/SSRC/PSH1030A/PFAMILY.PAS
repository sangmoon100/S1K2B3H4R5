unit PFamily;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnEditNumCtl, OnEditBtnCtrl, OnPopupEdit, OnEditStdCtrl,
  OnEditBaseCtrl, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ExtCtrls,
  OnShapeLabel, Db, Tmax_DataSetText;

type
  TFM_Family = class(TForm)
    OnShapeLabel3: TOnShapeLabel;
    Panel14: TPanel;
    Shape1: TShape;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DB_Fami: TOnGrDbGrid;
    P_FamirelN: TPanel;
    P_Age: TPanel;
    Panel16: TPanel;
    Panel53: TPanel;
    Panel50: TPanel;
    Panel52: TPanel;
    Panel51: TPanel;
    E_Faminame: TOnEdit;
    E_Obsyn: TOnEdit;
    E_Juminid: TOnMaskEdit;
    E_Famirel: TOnWinPopupEdit;
    TDS_Fami: TTMaxDataSet;
    DataSource1: TDataSource;
    TDS_Comm: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    BB_FamAll: TOnFocusButton;
    BB_Append: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    TDS_Extract: TTMaxDataSet;
    RB1: TRadioButton;
    RB2: TRadioButton;
    procedure E_FamirelCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_FamirelInitPopup(Sender: TObject);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_FamAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_JuminidExit(Sender: TObject);

    procedure Set_FamiField(arg1, arg2 : Boolean);
    Function  Get_CodeName(CodeNo : String ) : String;
    Function  Check_FamiRecord : Boolean;
    Function  Check_SubJuminID(BirthDate : String) : Boolean;
    procedure Read_FamiRecords(WorkYY, EmpNo : String);
    Function  Update_AppFamiDedNo: Boolean;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    Function  Get_Age(BirthDate : String) : String;
    procedure DB_FamiCellClick(Column: TColumn);
    procedure BT_ExitClick(Sender: TObject);
    procedure E_ObsynDblClick(Sender: TObject);
    Function Check_Jumin(No:String):Boolean;
    procedure Set_FamiRelNm;
    
  private
    { Private declarations }
    JobMode       : Char;
    sMsg, SQLStr, SQLStr2 : String;
    FL_Workyy, FL_Empno   : String;
    ErrFocus      : Integer;
    FamiRelNm     : array[0..50] of String[20];
    gsJuminMsg    : String;
  public
    { Public declarations }
  end;

var
  FM_Family: TFM_Family;

implementation

uses PSH1030A1, PFamicod, PSH1030A2;

{$R *.DFM}

Function TFM_Family.Check_Jumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of
    Integer = ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
  sJuminid : String;
Begin
  gsJuminMsg := '';
  sJuminid := copy(no,1, 6) + '-' + copy(no,7, 13);
  SQLStr  := 'SELECT  count(*) CNT                '+
             '  FROM  pkmysfam                    '+
             ' WHERE  workyy  = '''+FL_WorkYY+''' '+
             '   AND  juminid = '''+sJuminid +''' ';
  with TDS_Comm do
    begin
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ClearFieldInfo;
      AddField('CNT',   ftInteger,  2000);
      Open;
    end;

{  if TDS_Comm.FieldByName('CNT').AsInteger >= 1 then
  begin
     Result := False;
     gsJuminMsg := '중복된 주민번호 입력. 확인하시고 다시 입력하시기 바랍니다.';
  end
  else }
  If Length(No) <> 13 then
  begin
    Result:= False;
    gsJuminMsg := '자릿수가 틀린 주민번호 입력. 확인하시고 다시 입력하시기 바랍니다.';
  end
  else if (Copy(No,7,1) <> '5') and (Copy(No,7,1) <> '6') then   //외국인은 루틴 안타도록..
  begin
    Try
      Sum:= 0;
      For Loop:= 1 to  12 do
        Sum:= Sum + StrToInt(No[Loop])*Weight[Loop];
      Rest:= 11-(Sum Mod 11);
      If Rest = 11 then Rest:= 1;
      If Rest = 10 then Rest:= 0;
      Result:= Char(Rest+48) = No[13];
      gsJuminMsg := '잘못된 주민번호 입력. 확인하시고 다시 입력하시기 바랍니다.';
    Except
      Result:= False;
      gsJuminMsg := '잘못된 주민번호 입력. 확인하시고 다시 입력하시기 바랍니다.';
    End;
  end
  else
    Result:= True;
End;

procedure TFM_Family.Set_FamiRelNm;
var
  i: Integer;
  Tem : String;
begin
  Tem := 'SELECT RPAD(NVL(CODENO,'' ''), 2) || '+
         '       RPAD(NVL(CODENAME,'' ''),20)  '+
         '  FROM PKMYSCOD  ORDER BY CODENO     ';

  with TDS_Comm do
    begin
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add(Tem);

      ClearFieldInfo;
      AddField('SEL_DATA', ftString , 2000);
      Open;
    end;

  while not TDS_Comm.EOF do
    begin
      i := StrToInt( Copy(TDS_Comm.FieldByName('SEL_DATA').AsString,1,2) );
      FamiRelNm[i] := Copy(TDS_Comm.FieldByName('SEL_DATA').AsString,3,20);
      TDS_Comm.Next;
    end;

  TDS_Comm.close;
end;


Procedure TFM_Family.Read_FamiRecords(WorkYY, EmpNo : String);
begin
  with TDS_Fami do
    begin
      ServiceName := 'PSH1030A_sel3';
      Close;
      Sql.Clear;
      SQL.Add('SELECT EMPNO,  FAMINAME, FAMIREL,       ');
      SQL.Add('	     (select CODENAME from PKMYSCOD    ');
      SQL.Add('        where FAMIREL = CODENO) RELNAME,');
      SQL.Add('       JUMINID, AGE, OBSYN              ');
      SQL.Add('  FROM PKMYSFAM                         ');
      SQL.Add(' WHERE WORKYY  = '''+WorkYY+'''         ');
      SQL.Add('   AND EMPNO   ='''+Empno +'''          ');
      SQL.Add(' ORDER BY FAMIREL   ');

      ClearFieldInfo;
      AddField('EMPNO'   , ftString, 4);
      AddField('FAMINAME', ftString, 12);
      AddField('FAMIREL' , ftString, 2);
      AddField('RELNAME' , ftString, 20);
      AddField('JUMINID' , ftString, 14);
      AddField('AGE'     , ftInteger,3);
      AddField('OBSYN'   , ftString, 1);
      Open;
      DataSource1.OnDataChange := Nil;
      DataSource1.OnDataChange := DataSource1DataChange;
    end;
end;

Function TFM_Family.Get_Age(BirthDate : String) : String;
var
  mm1  : LongInt;
  mm2  : LongInt;
  Age  : LongInt;
begin
  if not Check_SubJuminID(copy(BirthDate,1,6)) then
    begin
      Result := '0';
      System.Exit;
    end;

  try
    mm2    := StrToInt(FL_WorkYY)*12 + 12;

    if (Copy(BirthDate,8,1) = '1') or (Copy(BirthDate,8,1) = '2') then
      mm1 := StrToInt('19' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2))
    else
      mm1 := StrToInt('20' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2));

    Age   := (mm2-mm1) div 12;
       { 2000.12. 20세이하 0101일 포함으로 변경됨.  주석처리
         if (Copy(BirthDate,3,4) = '0101') AND (Age >= 0) AND (Age < 54) then        Age := Age+1;}
    Result := FloatToStr(Age);
  except
    Result := '0';
    System.Exit;
  end;
end;

Function TFM_Family.Update_AppFamiDedNo : Boolean;
begin
  Read_FamiRecords(FL_WorkYY, FL_Empno);
  Set_FamiField(False, False );
end;

Function TFM_Family.Check_SubJuminID(BirthDate : String) : Boolean;
var
  Tmp : Real;
begin
  if Length(Trim(BirthDate)) <> 6 then
    begin
      Result := False;
      System.Exit;
    end;

  ShortDateFormat := 'YY' + DateSeparator + 'MM' + DateSeparator + 'DD';
  BirthDate       := Copy(BirthDate,1,2) + DateSeparator +
                     Copy(BirthDate,3,2) + DateSeparator +
                     Copy(BirthDate,5,2);
  Try
    Tmp := StrToDate(BirthDate);
  Except
    begin
      Result := False;
      System.Exit;
    end;
  end;
  Result := True;
end;

function TFM_Family.Get_CodeName(CodeNo : String ) : String;
begin
  if codeno <> '' then
    result := FamiRelNm[StrToInt(codeno)]
  else
    result := '';
end;

procedure TFM_Family.Set_FamiField(arg1, arg2 : Boolean );
begin
  DB_Fami.Enabled    := not arg1;
  E_FamiName.Enabled := arg1;
  E_Famirel.Enabled  := arg1;
  E_Juminid.Enabled  := arg1;
  E_Obsyn.Enabled    := arg1;

  if arg2 then
    begin
      E_FamiName.Text    := '';
      E_Famirel.Text     := '';
      P_FamirelN.Caption := '';
      E_Juminid.Text     := '';
      P_Age.Caption      := '';
      E_Obsyn.Text       := 'N';
    end;
end;


procedure TFM_Family.FormCreate(Sender: TObject);
begin
  FL_Workyy := FM_Mainform.FG_AppYY;
  FL_Empno  := FM_Mainform.PE_empno.Empno;

  OnShapeLabel3.LabelCaption := '['+FL_Workyy+'년 기준] '+OnShapeLabel3.LabelCaption;
end;

procedure TFM_Family.E_FamirelCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CodeForm.FamCode <> '' then
    begin
      E_FamiRel.Text      := CodeForm.FamCode;
      P_FamirelN.Caption  := CodeForm.FamCodeN;
      E_Juminid.SetFocus;
    end;
end;

procedure TFM_Family.E_FamirelInitPopup(Sender: TObject);
begin
  CodeForm.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CodeForm;
end;

procedure TFM_Family.BB_AppendClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_FamiField(True, True);
  E_Faminame.SetFocus;
end;

procedure TFM_Family.BB_ModifyClick(Sender: TObject);
begin
  if E_Faminame.Text <> '' then
    begin
      JobMode            := 'U';
      Set_FamiField(True, False );
    end;

  if E_Obsyn.Text  = '' then E_Obsyn.Text  := 'N';
end;

procedure TFM_Family.BB_SaveClick(Sender: TObject);
begin
  sMsg := '';

  if not Check_Jumin( Copy(E_Juminid.Text,1,6) + Copy(E_Juminid.Text,8,7) ) then
  begin
     ShowMessage( gsJuminMsg );
     Exit;
  end;
    
  if not Check_FamiRecord then
    begin
      MessageDlg(sMsg, mtError, [mbOK ],0) ;
      case ErrFocus of
          1 : if E_Faminame.Enabled then E_Faminame.SetFocus;
          2 : if E_FamiRel.Enabled  then E_FamiRel.SetFocus;
          3 : if E_Juminid.Enabled  then E_Juminid.SetFocus;
      end;
      System.Exit;
    end;
    
  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSFAM                           '+
                '   (WORKYY, EMPNO, FAMINAME, FAMIREL, JUMINID, '+
		'    AGE, DEDYN, OBSYN, DEDYN3, DEDYN4, DEDYN5, '+
                '    DEDYN6, DEDYN7, WRITEMAN, WRITETIME )      '+
                '  VALUES                                       '+
                '   ('''+ FL_Workyy                       +''', '+
                '    '''+ FL_Empno                        +''', '+
                '    '''+ E_Faminame.Text                 +''', '+
                '    '''+ E_FamiRel.Text                  +''', '+
                '    '''+ E_Juminid.Text                  +''', '+
                '    '''+ P_Age.Caption                   +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ UpperCase(E_Obsyn.Text)         +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ 'N'                             +''', '+
                '    '''+ FM_Mainform.FG_Empno            +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')        '+
                '   ) ';
    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSFAM  SET                         '+
                '       JUMINID   = '''+ E_Juminid.Text +''', '+
                '       FAMINAME  = '''+ E_Faminame.Text+''', '+
                '       FAMIREL   = '''+ E_FamiRel.Text +''', '+
                '       AGE       = '''+ P_Age.Caption  +''', '+
                '       DEDYN     = '''+ 'N'            +''', '+
                '       OBSYN     = '''+ UpperCase(E_Obsyn.Text) +''', '+
                '       DEDYN3    = '''+ 'N'            +''', '+
                '       DEDYN4    = '''+ 'N'            +''', '+
                '       DEDYN5    = '''+ 'N'            +''', '+
                '       DEDYN6    = '''+ 'N'            +''', '+
                '       DEDYN7    = '''+ 'N'            +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                '       WRITEMAN  = '''+ FM_Mainform.FG_Empno  +'''  '+
                ' WHERE WORKYY    = '''+ FL_Workyy      +'''  '+
                '   AND EMPNO     = '''+ FL_Empno       +'''  '+
                '   AND NVL(JUMINID,'' '') = NVL('''+ TDS_Fami.FieldByName('JUMINID').AsString +''','' '') ';
    end
  else
    System.Exit;

  with TDS_dml do
    begin
      //ServiceName := 'PKQ1030A_dml';
      ServiceName := 'PSC1040C_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('가족사항 저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;
    
  if not Update_AppFamiDedNo then
    MessageDlg('가족 공제인원 저장에 실패했습니다.',mtError, [mbOk],0);
end;

procedure TFM_Family.BB_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_FamiField(False, True);
end;

procedure TFM_Family.BB_DeleteClick(Sender: TObject);
begin 
  if (Length(Trim(E_Juminid.Text)) < 14) or
     (Trim(E_Juminid.Text) <> (TDS_Fami.FieldByName('JUMINID').AsString)) then
  begin
    MessageDlg('삭제할 데이터를 정확히 선택후 작업하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;
  
  if MessageDlg('가족사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SQLStr  := 'DELETE PKMYSFAM  '+
             ' WHERE WORKYY  = '''+ FL_Workyy +''' '+
             '   AND EMPNO   = '''+ FL_Empno  +''' '+
             '   AND JUMINID = '''+ TDS_Fami.FieldByName('JUMINID').AsString +''' ';

  with TDS_dml do
    begin
      //ServiceName := 'PKQ1030A_dml';
      ServiceName := 'PSC1040C_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not TDS_dml.Execute then
        begin
          MessageDlg('가족사항 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;
    
  if Update_AppFamiDedNo then
    MessageDlg('가족사항이 삭제되었습니다.',mtInformation, [mbOk],0)
  else
    MessageDlg('가족 공제인원 저장에 실패했습니다.',mtError, [mbOk],0);
end;

procedure TFM_Family.BB_FamAllClick(Sender: TObject);
var
  FamiCnt,  FamiOkCnt  : Integer;
  Old_Workyy : String;
begin
  if (not RB1.Checked) and (not RB2.Checked) then
  begin
       MessageDlg('가족사항 추출기준을 선택하세요',mtInformation,[mbOk], 0);
       Exit;
  end;      

  Old_Workyy := InttoStr(StrtoInt(FL_Workyy)-1);

  SQLStr  := 'SELECT TO_CHAR(count(*)) CNT         '+
             '  FROM PKMYSFAM                      '+
             ' WHERE WORKYY = '''+ Old_Workyy +''' '+
             '   AND EMPNO  = '''+ FL_Empno   +''' ';
             
  with TDS_Extract do
  begin
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ClearFieldInfo;
      AddField('CNT',   ftInteger,  2000);
      Open;
  end;

  FamiCnt := TDS_Extract.FieldByName('CNT').AsInteger;
  if FamiCnt < 1 then
  begin
      Application.MessageBox('작년에 등록된 가족이 없습니다.','[확인]',MB_OK+MB_ICONINFORMATION);
      System.Exit;
  end;

  if RB1.Checked then
  begin
       if IDYes <> Application.MessageBox('현재 등록된 가족자료를 삭제후  연말정산 기준 가족사항으로 재추출하시겠습니까?','[확인]',MB_YesNo+MB_ICONQUESTION) then
          System.Exit;
       SQLStr  := 'DELETE PKMYSFAM   '+
                  ' WHERE WORKYY  = '''+ FL_Workyy +'''  '+
                  '   AND EMPNO   = '''+ FL_Empno  +'''  ';

       with TDS_dml do
       begin
           ServiceName := 'PSC1040C_dml';
           Close;
           Sql.Clear;
           Sql.Add(SQLStr);

           if not TDS_dml.Execute then
             begin
               MessageDlg('가족사항 삭제에 실패했습니다.',mtError, [mbOk],0);
               System.Exit;
             end;
       end;
  end;

  //////////////////////////////////////////////////////////////////////////////
  DB_Fami.Enabled := False;
  SQLStr  := 'INSERT INTO PKMYSFAM                                             '+#13+
             '      (WORKYY, EMPNO,  FAMINAME, FAMIREL,   JUMINID, AGE,        '+#13+
             '       DEDYN,  OBSYN,  DEDYN3,   WRITETIME, WRITEMAN     )       '+#13+
             'SELECT '''+FL_Workyy+''' WORKYY,                                 '+#13+
             '       EMPNO   ,                                                 '+#13+
             '       FAMINAME,                                                 '+#13+
             '       FAMIREL ,                                                 '+#13+
             '       JUMINID ,                                                 '+#13+
             '       Floor(((TO_NUMBER('''+FL_Workyy+''')*12+12)-(TO_NUMBER(DECODE(SUBSTR(JUMINID,8,1),''3'',''20'',''4'',''20'',''19'')||SUBSTR(JUMINID,1,2))*12+TO_NUMBER(SUBSTR(JUMINID,3,2)))) '+#13+
             '             / 12                                                '+#13+
             '             ) AGE,                                              '+#13+
             '       nvl(DEDYN ,''N''),                                        '+#13+
             '       nvl(OBSYN ,''N''),                                        '+#13+
             '       nvl(DEDYN3,''N''),                                        '+#13+
             '       TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') yymmdd,            '+#13+
             '       '''+FM_Mainform.FG_Empno+'''                              '+#13+
             '  FROM PKMYSFAM                                                  '+#13+
             ' WHERE WORKYY  = '''+Old_Workyy +'''                             '+#13+
             '   AND EMPNO   = '''+FL_Empno   +'''                             ';

  SQLStr2 := '';
  if RB2.Checked then
  begin
       SQLStr2 := '   AND JUMINID NOT IN (SELECT JUMINID FROM PKMYSFAM         '+
                  '                        WHERE WORKYY = '''+ FL_Workyy +'''  '+
                  '                          AND EMPNO  = '''+ FL_Empno  +''') ';
  end;

  with TDS_dml do
    begin
      ServiceName := 'PSC1040C_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Sql.Add(SQLStr2);      //    edit1.Text := sqlstr;

      if not TDS_dml.Execute then
        begin
          MessageDlg('가족사항 추출중 에러가 발생했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;


  if Update_AppFamiDedNo then
    MessageDlg(FL_Workyy+'년 가족 공제인원 추출 완료되었습니다. ',mtInformation, [mbOK],0)
  else
    MessageDlg('가족 공제인원 추출 실패했습니다.   ',mtInformation, [mbOk],0);

  DB_Fami.Enabled := True;
end;

Function TFM_Family.Check_FamiRecord : Boolean;
 var  sJuminid : String;
begin
   if Trim(E_FamiName.Text) = '' then
   begin
     SMsg     := '성명은 필수입력항목입니다. 성명을 입력하신 후 다시 작업하시기 바랍니다.';
     ErrFocus := 1;
     Result   := False;
     System.Exit;
   end;

   if Get_CodeName(E_FamiRel.Text) = '' then
   begin
      SMsg     := '입력하신 가족관계가 유효하지 않습니다. 확인하시고 다시 입력하시기 바랍니다.';
      ErrFocus := 2;
      Result   := False;
      System.Exit;
   end;

   sJuminid := Trim( Copy(E_Juminid.Text,1,6) + Copy(E_Juminid.Text,8,7) );
   if not Check_Jumin(sJuminid) then //주민번호 체크
   begin
     SMsg     := gsJuminMsg;
     ErrFocus := 3;
     Result   := False;
     System.Exit;
   end;

   Result := True;
end;

procedure TFM_Family.BB_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Family.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  with TDS_Fami do
  begin
    JobMode             := 'F';
    E_faminame.Text     := FieldByName('FAMINAME').AsString;
    E_famirel.Text      := FieldByName('FAMIREL').AsString;
    P_famirelN.Caption  := FieldByName('RELNAME').AsString;
    E_Juminid.Text      := FieldByName('JUMINID').AsString;
    P_Age.Caption       := FieldByName('AGE').AsString;
    E_Obsyn.Text        := FieldByName('OBSYN').AsString;
  end;
end;

procedure TFM_Family.FormShow(Sender: TObject);
begin
  Set_FamiRelNm;
  Read_FamiRecords(FL_Workyy, FL_Empno);
end;

procedure TFM_Family.E_JuminidExit(Sender: TObject);
var
  calage : String;
begin
  if not Check_Jumin( Copy(E_Juminid.Text,1,6) + Copy(E_Juminid.Text,8,7) ) then
  begin
     ShowMessage( gsJuminMsg );
     Exit;
  end;

  calage := Get_Age(E_Juminid.Text);

  if (StrtoInt(Calage) >=  0 ) then
    P_Age.Caption := calage
  else
    P_Age.Caption := '0';

end;

procedure TFM_Family.DB_FamiCellClick(Column: TColumn);
begin
  DataSource1DataChange(DataSource1, TField(Column));
end;

procedure TFM_Family.BT_ExitClick(Sender: TObject);
begin
  Close;

  FM_Hospital.Initialize;  
end;

procedure TFM_Family.E_ObsynDblClick(Sender: TObject);
begin
  if UpperCase(TOnEdit(Sender).Text) = 'Y' then
    TOnEdit(Sender).Text := 'N'
  else
    TOnEdit(Sender).Text := 'Y';

  if UpperCase(TOnEdit(Sender).Text) = 'N' then
    TOnEdit(Sender).Text := 'N'; 
end;

end.
