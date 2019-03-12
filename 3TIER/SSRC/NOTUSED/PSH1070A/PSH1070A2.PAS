unit PSH1070A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnEditBaseCtrl, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  OnFocusButton, OnShapeLabel, OnEditNumCtl, OnEditMdate, OnScheme,
  OnRadioBtn, OnCheckBox, Mask, pebtnedit, PeJeonBtnDateEdit,
  Tmax_DataSetText, Func, ComCtrls;

type
  TFM_Hospital = class(TForm)
    Shape1: TShape;
    Label10: TLabel;
    DB_Hoslist: TOnGrDbGrid;
    Panel16: TPanel;
    Panel53: TPanel;
    Panel52: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    E_corpname: TOnEdit;
    E_Fami: TOnComboEdit;
    HelpMemo1: TMemo;
    DataSource1: TDataSource;
    TDS_Detail: TTMaxDataSet;
    TDS_Fami2: TTMaxDataSet;
    BT_Exit: TOnFocusButton;
    BB_Append: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BB_Help: TOnFocusButton;
    BB_FamiSave: TOnFocusButton;
    Panel1: TPanel;
    E_medcomm: TOnEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    TDS_Com: TTMaxDataSet;
    E_cashcnt: TOnNumberEdit;
    E_cardcnt: TOnNumberEdit;
    E_cashamt: TOnNumberEdit;
    E_cardamt: TOnNumberEdit;
    E_corpno: TOnEdit;
    Panel9: TPanel;
    SF_Main: TOnSchemeForm;
    E_totamt: TOnNumberEdit;
    E_appamtyn: TOnEdit;
    L_AppEmpno: TOnShapeLabel;
    E_Seq: TOnEdit;
    Check_AppamtY: TRadioButton;
    Check_AppamtN: TRadioButton;
    CK_DataCheck: TCheckBox;
    BT_DataMove: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    L_Appdate: TOnComboEdit;
    E_medidate: TOnMaskEdit;
    E_contot: TOnNumberEdit;
    Label1: TLabel;
    BB_Hossearch: TOnFocusButton;
    SB_Help: TStatusBar;
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_FamiSaveClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Set_Field2(arg1, arg2 : Boolean);
    procedure Read_HosRecords(Appdate, EmpNO: String);
    procedure Read_HosMonthSum(Appdate, EmpNO: String);
    procedure Read_FamRecords(WorkYY, Empno, Faminame: String);
    procedure MaxSeq;
    function  Check_Input : Boolean;
    Function  Check_Jumin(No:String) : Boolean;
    procedure E_FamiChange(Sender: TObject);
    procedure Check_AppamtYClick(Sender: TObject);
    procedure Check_AppamtNClick(Sender: TObject);
    procedure OnCheckBox1Click(Sender: TObject);
    procedure CK_DataCheckExit(Sender: TObject);
    procedure CK_DataCheckClick(Sender: TObject);
    procedure L_AppdateExit(Sender: TObject);
    procedure BT_DataMoveClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure L_AppdateKeyPress(Sender: TObject; var Key: Char);
    procedure L_AppdateChange(Sender: TObject);
    procedure BB_HossearchClick(Sender: TObject);
    procedure E_medidateChange(Sender: TObject);
    procedure E_medcommChange(Sender: TObject);
    procedure E_cashamtChange(Sender: TObject);
    procedure E_corpnoChange(Sender: TObject);
    procedure E_corpnameChange(Sender: TObject);

  private
    { Private declarations }
    FL_AppYY, FL_Appdate, FL_AppEmp  : String;
    FL_Famirel, FL_Faminame, FL_Famijumin : String;
    SQLStr   : String;
    ErrFocus : Integer;
    JobMode  : Char;
    FL_CONYN : String;
    FL_Appamt : Double;
        
    procedure PL_Com_Contructor;

  public
    { Public declarations }
    procedure Initialize;
  end;

var
  FM_Hospital: TFM_Hospital;

implementation

uses PSH1070A1, PFamily,PHosSearch;

{$R *.DFM}


Function TFM_Hospital.Check_Jumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of Integer =
         ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
Begin
  if (Copy(No,7,1) <> '5') and (Copy(No,7,1) <> '6') and
     (Copy(No,7,1) <> '7') and (Copy(No,7,1) <> '8') then    //외국인은 루틴 안타도록..
  begin
    If Length(No) <> 13 then
      Result:= False
    Else
      Try
        Sum:= 0;
        For Loop:= 1 to  12 do
          Sum:= Sum + StrToInt(No[Loop])*Weight[Loop];
        Rest:= 11-(Sum Mod 11);
        If Rest = 11 then Rest:= 1;
        If Rest = 10 then Rest:= 0;
        Result:= Char(Rest+48) = No[13];
      Except
        Result:= False;
      End;
  end
  else
    Result:= True;
End;

procedure TFM_Hospital.PL_Com_Contructor;
begin
  with TDS_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
    end;
end;

function TFM_Hospital.Check_Input : Boolean;
var
   Temp : Real;
   C_chknum : String;
   C_sumnum : Integer;
   C_divide : Integer;
   C_tmpval : Integer;
   C_chkval : Integer;
   i        : Integer;
begin
// 사업자 번호 변수초기화 kth 2009.03

  C_chknum  := '137137135';
  C_sumnum  := 0;
  C_divide  := 10;
  C_tmpval  := 0;
  C_chkval  := 0;
// 사업자 번호 변수초기화 kth 2009.03끝

  result := True;

  if Pos('-',E_corpno.Text) > 0 then
  begin
       MessageDlg('사업자 등록번호는 숫자만 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
  if (E_corpno.Text < '       ') or ( Length(E_corpno.Text) < 10 ) then
  begin
       MessageDlg('사업자 등록번호를 정확히 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
  if E_corpname.Text < '       ' then
  begin
       MessageDlg('사업자 명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
       result := false;
  end;
//사업자 번호 오류 체크 kth 2009.03

  for i := 1 to 9 do
  begin
       C_tmpval := StrtoInt( Copy(E_corpno.Text,i,1) ) * StrtoInt( Copy(C_chknum,i,1) );   // 사업자 번호와 '137137135' 각 자리 수를 곱한다.
       if i = 9  THEN
          C_sumnum :=  C_sumnum  + trunc(C_tmpval / 10) + (C_tmpval mod 10)
       else
          C_sumnum  := C_sumnum  + C_tmpval;
       Next;
  end;


  C_chkval  :=  C_divide - (C_sumnum mod C_divide);                      // 10 - (계산값 mod 10)
  if   StrtoInt(Copy(E_corpno.Text,10,1)) = (C_chkval mod 10)  THEN     // 사업자 번호 마지막과 비교
  else
  begin
       MessageDlg('정확한 사업자 번호를 넣어 주시기 바랍니다.'+#13#10+
                  '영수증에 있는 사업자 번호를 입력 시에도 오류가 발생하면 해당 의료기관에 '+#13#10+
                  '사업자번호 문의 해 주시기 바랍니다. ' ,mtInformation,[mbOK],0);
       result := false;
  end;

//사업자 번호 오류 체크 kth 2009.03 끝

{  if (E_cardcnt.Value = 0) and (E_cashcnt.Value = 0) then
  begin
    MessageDlg('현금 또는 카드 지급건수를 반드시 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;}
  if (E_cardamt.Value = 0) and (E_cashamt.Value = 0) then
  begin
    MessageDlg('현금 또는 카드지급액을 반드시 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_Fami.Text     < '            ' then
  begin
    MessageDlg('공제가족을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
{  if E_hosgubun.Text < '      ' then
  begin
    MessageDlg('의료비구분을 선택하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;}

  if Length(Trim(E_medidate.Text)) <> 10 then
  begin
    MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
    E_medidate.SetFocus;
    result := false;
  end;

  Try
    Temp := StrToDate(E_medidate.Text);
  Except on EConvertError do
    begin
      MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
      E_medidate.SetFocus;
      Result  := False;
    end;
  end;
end;

procedure TFM_Hospital.MaxSeq;
begin
  with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1),   ');
      Sql.Add('      ''field2'', ''field3'',        ');
      Sql.Add('      ''field4'', ''field5''         ');
      Sql.Add('  FROM PSHAPHOS                      ');
      Sql.Add(' WHERE EMPNO   ='''+ FL_AppEmp  +''' ');
      Sql.Add('   AND SUBSTR(APPDATE,1,4)     ='''+ Copy(L_Appdate.Text,1,4)  +''' ');

      Open;
    end;

  if TDS_Com.Active then
    E_Seq.Text := TDS_Com.FieldByName('field1').AsString
  else
    E_Seq.Text := '1';

  TDS_Com.Close;
end;

Procedure TFM_Hospital.Read_FamRecords(WorkYY, EmpNo, Faminame : String);
begin
  with TDS_Fami2 do
    begin
      ServiceName := 'PSH1030A_sel3';
      Close;
      Sql.Clear;
{     SQL.Add('SELECT EMPNO, KORNAME FAMINAME,  ''00'' FAMIREL, ''본인'' relname,');//PKMYSFAM 테이블에 본인도 등록함에 따라 삭제.2007.01.
      SQL.Add('       JUMINID,  0  AGE, '''' OBSYN     ');
      SQL.Add('  FROM PKMPMAS                          ');
      SQL.Add(' WHERE EMPNO = '''+ Empno +'''          ');
      SQL.Add('   AND KORNAME Like '''+ Faminame +'''  ');
      SQL.Add('UNION                                   ');  }
      SQL.Add('SELECT EMPNO,  FAMINAME, FAMIREL,');
      SQL.Add('	  (SELECT CODENAME FROM PKMYSCOD WHERE FAMIREL = CODENO) relname,');
      SQL.Add('       JUMINID, AGE, OBSYN 	');
      SQL.Add('  FROM PKZYSFAM                  ');
      SQL.Add(' WHERE WORKYY  = '''+WorkYY+'''  ');
      SQL.Add('   AND EMPNO   = '''+Empno +'''  ');
      SQL.Add('   AND FAMINAME Like '''+ Faminame +''' ');
      SQL.Add('   AND FAMIREL IN (''00'',''01'',''04'',''05'',''06'') '); //2013.05.07 jissi 가족관계 관련관계만  등록 가능하게 처리(직계존속 제외 ''02'',''03'',)
      SQL.Add('ORDER BY 3                              '); //Edit1.Text := SQL.Text;

      ClearFieldInfo;
      AddField('EMPNO'   , ftString, 4);
      AddField('FAMINAME', ftString, 12);
      AddField('FAMIREL' , ftString, 2);
      AddField('RELNAME' , ftString, 20);
      AddField('JUMINID' , ftString, 14);
      AddField('AGE'     , ftInteger,3);
      AddField('OBSYN'   , ftString, 1);
      Open;                                    
    end;
end;

Procedure TFM_Hospital.Read_HosRecords(Appdate, EmpNo : String);
begin
  with TDS_Detail do
    begin
      ServiceName := 'PSH1030A_sel1';
      Close;
      Sql.Clear;
      Sql.Add('SELECT EMPNO, SEQ, FAMINAME, FAMIJUMIN, FAMIREL,                     ');
      Sql.Add('      (SELECT CODENAME FROM PKMYSCOD WHERE FAMIREL = CODENO) RELNAME,');
      Sql.Add('       GUBUN, MEDIDATE, MEDCOMM, CORPNAME, CORPNO, CASHCNT, CASHAMT, ');
      Sql.Add('       CARDCNT, CARDAMT, APPAMT, CONYN, CONYNSAYU                    ');
      Sql.Add('  FROM PSHAPHOS                                                      ');
      Sql.Add(' WHERE APPDATE = '''+ Appdate +'''                                   ');
      Sql.Add('   AND EMPNO   = '''+ Empno  +'''                                    ');
      Sql.Add(' ORDER BY SEQ                                                        ');
      ClearFieldInfo;
      AddField('EMPNO'    , ftString,  4);
      AddField('SEQ'      , ftInteger, 3);
      AddField('FAMINAME' , ftString, 12);
      AddField('FAMIJUMIN', ftString, 14);
      AddField('FAMIREL'  , ftString,  2);
      AddField('RELNAME'  , ftString, 10);
      AddField('GUBUN'    , ftString,  1);
      AddField('MEDIDATE' , ftString,  8);
      AddField('MEDCOMM'  , ftString, 50);
      AddField('CORPNAME' , ftString, 30);
      AddField('CORPNO'   , ftString, 13);
      AddField('CASHCNT'  , ftInteger, 3);
      AddField('CASHAMT'  , ftInteger, 9);
      AddField('CARDCNT'  , ftInteger, 3);
      AddField('CARDAMT'  , ftInteger, 9);
      AddField('APPAMT'   , ftInteger, 9);
      AddField('CONYN'    , ftString,  1);
      AddField('CONYNSAYU', ftString, 50);
      Open;

      TFloatField(FieldByName('CASHAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('CARDAMT')).DisplayFormat := '#,###';
      TFloatField(FieldByName('APPAMT')).DisplayFormat  := '#,###';
    end;
end;

Procedure TFM_Hospital.Read_HosMonthSum(Appdate, EmpNo : String);
begin
  E_totamt.EditLabel.Caption :=  Copy(FL_Appdate,5,2)+'월 신청총액';
  E_contot.EditLabel.Caption :=  Copy(FL_Appdate,5,2)+'월 승인총액';

  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Add('SELECT nvl(Sum(CASHAMT+CARDAMT),0) field1,           ');
    Sql.Add('      ''field2'', ''field3'', ''field4'', ''field5'' ');
    Sql.Add('  FROM PSHAPHOS                                      ');
    Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +'''                ');
    Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +'''                ');
    Open;
    if TDS_Com.RecordCount > 0  then
      E_totamt.Value := FieldByName('field1').AsFloat;  //신청총액

    PL_Com_Contructor;
    Close;
    Sql.Add('SELECT nvl(Sum(CASHAMT+CARDAMT),0) field1,           ');
    Sql.Add('      ''field2'', ''field3'', ''field4'', ''field5'' ');
    Sql.Add('  FROM PSHAPHOS                                      ');
    Sql.Add(' WHERE APPDATE = '''+ FL_Appdate +'''                ');
    Sql.Add('   AND EMPNO   = '''+ FL_AppEmp  +'''                ');
    Sql.Add('   AND CONYN   = ''Y''                               ');
    Open;
    if TDS_Com.RecordCount > 0  then
      E_contot.Value := FieldByName('field1').AsFloat;  //승인총액
  end;
end;

procedure TFM_Hospital.Set_Field(arg1, arg2 : Boolean );
begin
  DB_Hoslist.Enabled  := not arg1;

  E_Fami.Enabled     := arg1;
//  E_hosgubun.Enabled := arg1;
  E_medidate.Enabled := arg1;
  E_medcomm.Enabled  := arg1;
  E_corpname.Enabled := arg1;
  E_corpno.Enabled   := arg1;
  E_cashcnt.Enabled  := arg1;
  E_cashamt.Enabled  := arg1;
  E_cardcnt.Enabled  := arg1;
  E_cardamt.Enabled  := arg1;
  Check_AppamtY.Enabled  := arg1;
  Check_AppamtN.Enabled  := arg1;

  if arg2 then
    begin
      E_Fami.Text     := '';
//      E_hosgubun.Text := '';
      E_medidate.Text := '';
      E_medcomm.Text  := '';
      E_corpname.Text := '';
      E_corpno.Text   := '';
      E_cashcnt.Value := 0;
      E_cashamt.Value := 0;
      E_cardcnt.Value := 0;
      E_cardamt.Value := 0;

      Check_AppamtY.Checked := False;
      Check_AppamtN.Checked := False;
      if E_corpno.Enabled then
         E_corpno.SetFocus;
    end;
    SB_Help.Panels[1].Text := '';
end;


procedure TFM_Hospital.Set_Field2(arg1, arg2 : Boolean );
begin
  DB_Hoslist.Enabled  := not arg1;

  E_Fami.Enabled     := arg1;
//  E_hosgubun.Enabled := arg1;
  E_medidate.Enabled := arg1;
  E_medcomm.Enabled  := arg1;
  E_corpname.Enabled := arg1;
  E_corpno.Enabled   := arg1;
  E_cashcnt.Enabled  := arg1;
  E_cashamt.Enabled  := arg1;
  E_cardcnt.Enabled  := arg1;
  E_cardamt.Enabled  := arg1;
  Check_AppamtY.Enabled  := arg1;
  Check_AppamtN.Enabled  := arg1;

  if arg2 then
    begin
//      E_Fami.Text     := '';
//      E_hosgubun.Text := '';
      E_medidate.Text := '';
      E_medcomm.Text  := '';
//      E_corpname.Text := '';
//      E_corpno.Text   := '';
      E_cashcnt.Value := 0;
      E_cashamt.Value := 0;
      E_cardcnt.Value := 0;
      E_cardamt.Value := 0;

      Check_AppamtY.Checked := False;
      Check_AppamtN.Checked := False;
    end;
end;

////////////////////////////////////////////////////////////////////////////////


procedure TFM_Hospital.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FL_AppYY   := FM_Mainform.FG_AppYY;
  FL_Appdate := FM_Mainform.FG_Appdate;
  FL_AppEmp  := Copy(FM_Mainform.PE_empno.Text,1,4);
  L_Appdate.Text := Copy(FM_Mainform.FG_Appdate,1,4)+'-'+Copy(FM_Mainform.FG_Appdate,5,2);

  L_Appdate.Items.Clear;
  for i := 0 downto -15 do
  begin
    L_Appdate.Items.Add(Copy(AddMonthStr(L_Appdate.Text+'-01',i),1,7));
  end;

  if FM_Mainform.FG_Date > '20080108' then //연말정산 등록기간 종료 후  사용 못하게 막음...
  begin
//    CK_DataCheck.Enabled := True;
    //BT_DataMove.Enabled  := False;
  end;
end;


procedure TFM_Hospital.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Hospital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Hospital.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  Set_Field(True, True);

  MaxSeq;

  MaxSeq;
end;

procedure TFM_Hospital.BB_ModifyClick(Sender: TObject);
begin
  JobMode := 'U';
  Set_Field(True, False);
end;

procedure TFM_Hospital.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);
  Read_HosRecords(FL_Appdate, FL_AppEmp);
  Read_HosMonthSum(FL_Appdate, FL_AppEmp);
  SB_Help.Panels[1].Text := '취소 되었습니다.....';
end;

procedure TFM_Hospital.BB_SaveClick(Sender: TObject);
var
     Mdate,C_date : String;
     tmp_JobMode : Char;
     V : Variant;
begin
  FL_Famirel   := '';
  FL_Faminame  := '';
  FL_Famijumin := '';

  tmp_JobMode := JobMode;
  V := VarArrayCreate([0,1], varInteger);

  if JobMode = 'I' then
  begin
        with TDS_Com do
        begin
             PL_Com_Contructor;
             Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1),   ');
             Sql.Add('      ''field2'', ''field3'',        ');
             Sql.Add('      ''field4'', ''field5''         ');
             Sql.Add('  FROM PSHAPHOS                      ');
             Sql.Add(' WHERE EMPNO   ='''+ FL_AppEmp  +''' ');
             Sql.Add('   AND SUBSTR(APPDATE,1,4)     ='''+ Copy(L_Appdate.Text,1,4)  +''' ');
             Open;
        end;

        if TDS_Com.Active then
           E_Seq.Text := TDS_Com.FieldByName('field1').AsString
        else
           E_Seq.Text := '1';
  end;

  if  Trim(E_Seq.Text) <>  '' then   //SEQ가  NULL  이 들어가 처리 KTH 2009.01
      V[0] := StrToInt(E_Seq.Text)
  else
  begin
       maxseq;
{        with TDS_Com do
        begin
          PL_Com_Contructor;
          Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1),   ');
          Sql.Add('      ''field2'', ''field3'',        ');
          Sql.Add('      ''field4'', ''field5''         ');
          Sql.Add('  FROM PSHAPHOS                      ');
          Sql.Add(' WHERE EMPNO   ='''+ FL_AppEmp  +''' ');
          Sql.Add('   AND SUBSTR(APPDATE,1,4)     ='''+ Copy(L_Appdate.Text,1,4)  +''' ');
          Open;
        end;

        if TDS_Com.Active then
          E_Seq.Text := TDS_Com.FieldByName('field1').AsString
        else
          E_Seq.Text := '1';}
  end;

  Mdate := Copy(E_medidate.Text,1,4)+Copy(E_medidate.Text,6,2)+Copy(E_medidate.Text,9,2);
  
//2012.05.29 kth 입사일 체크  입사전 입력 안되게 처리 시작
  with TDS_Com do
  begin
       PL_Com_Contructor;
       Sql.Add('SELECT EMPDATE ,                      ');
       Sql.Add('       ''field2'', ''field3'',        ');
       Sql.Add('       ''field4'', ''field5''         ');
       Sql.Add('  FROM PIMPMAS                ');
       Sql.Add(' WHERE EMPNO = '''+ Trim(FL_AppEmp) +'''   ');
       Open;
       C_date := TDS_Com.FieldByName('field1').AsString;
       if  C_date > Mdate  then
       begin
            MessageDlg(' 입사전 의료비는 등록 할 수 없습니다. 확인 후 입력 해주세요. ',mtError, [mbOk],0);
            System.Exit;
       end;

  end;
//2012.05.29 kth 입사일 체크  입사전 입력 안되게 처리 끝

  if JobMode <> 'U' then
  begin
       with TDS_Com do
       begin
            PL_Com_Contructor;
            Sql.Add(' SELECT * FROM PSHAPHOS                                                                    ');
            Sql.Add('  WHERE Trim(MEDIDATE)         = '''+ Trim(Mdate)          +'''                            ');
            Sql.Add('    AND Trim(EMPNO)            = '''+ Trim(FL_AppEmp)      +'''                            ');
            Sql.Add('    AND Trim(FAMINAME)         = '''+ Trim(E_Fami.Text)    +'''                            ');
            Sql.Add('    AND Trim(CORPNO)           = '''+ Trim(E_corpno.Text)  +'''                            ');
            Sql.Add('    AND Trim(CASHAMT +CARDAMT) = ''' + Trim(FloatToStr(E_cashamt.Value + E_cardamt.Value )) +''' ');
            Open;

            if not TDS_Com.eof then
            begin
                 MessageDlg('기존에 등록 된 데이터가 있습니다. 확인 후 입력 해주세요. ',mtError, [mbOk],0);
                 System.Exit;
            end;
       end;
  end;
  if not Check_Input then
    Exit;
  Check_AppamtY.Checked := True; //2010.12.28 kth 무조건 넣게 처리
  if (not Check_AppamtY.Checked) and (not Check_AppamtN.Checked) then
  begin
    MessageDlg('소득공제 대상여부를 선택하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  //소득공제 비대상금액을 변수에 저장....
  FL_Appamt := 0;
  if Check_AppamtN.Checked then
    FL_Appamt := E_cashamt.Value + E_cardamt.Value;

  Read_FamRecords(FL_AppYY, FL_AppEmp, E_Fami.Text);

//  Read_FamRecords(FL_AppYY, FL_AppEmp, E_Fami.Text);

  if not TDS_Fami2.Active then
    TDS_Fami2.Active := True;

  with TDS_Fami2 do
    begin
      FL_Famirel   := FieldByName('FAMIREL').AsString;
      FL_Faminame  := FieldByName('FAMINAME').AsString;
      FL_Famijumin := FieldByName('JUMINID').AsString;
      Close;
    end;


  if (FL_Famirel = '') or (FL_Faminame = '') or (FL_Famijumin = '') then
  begin
    MessageDlg('신청가족 선택이 잘못 되었습니다. 마우스로 선택하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  if not Check_Jumin( Copy(FL_Famijumin,1,6) + Copy(FL_Famijumin,8,7)  ) then
  begin
     ShowMessage( E_Fami.Text +': 잘못된 주민등록번호입니다. 가족 등록에서 수정후 저장 바랍니다.' );
//     ChkJuminFlag  := False;
     Exit;
  end;  

  Mdate := Copy(E_medidate.Text,1,4)+Copy(E_medidate.Text,6,2)+Copy(E_medidate.Text,9,2);
  // 의료비 등록시 날짜 체크  kth
  if ((Copy(FL_Appdate,5,2) = '01')or (Copy(FL_Appdate,5,2) = '02'))  and  (FM_Mainform.FG_empno  <>  'YF07') then    // or (Copy(FL_Appdate,5,2) = '02') 1월,2월일 경우 작년 1월 부터 올해 12월까지 의료일자 기즌으로 등록 할 수 있게 함.
  begin
       if Copy(Mdate,1,6) = inttostr(strtoint(Copy(Trim(FL_Appdate),1,4))-2)+'12'  then
       begin
       end
       else
       if Copy(Mdate,1,4) <> inttostr(strtoint(Copy(FL_Appdate,1,4))-1)  then
       begin
            MessageDlg(inttostr(strtoint(Copy(FL_Appdate,1,4))-1) + '년 의료비만 등록 할 수 있습니다.'+#13#10+
                        Copy(FL_Appdate,1,4)+'년 3월 부터 등록 해주시기 바랍니다. ',mtError, [mbOk],0);
            System.Exit;
       end;
  end else
  begin
       if Copy(Mdate,1,6) = inttostr(strtoint(Copy(Trim(FL_Appdate),1,4)))+'01'  then
       begin
       end
       else
       if (Copy(Mdate,1,4) <> Copy(FL_Appdate,1,4)) and  (FM_Mainform.FG_empno  <>  'YF07') then
       begin
            MessageDlg(Copy(FL_Appdate,1,4) +'년 의료비만 등록 할 수 있습니다. ' ,mtError, [mbOk],0);
            System.Exit;
       end;
  end;
  // 의료비 등록시 날짜 체크  마지막  kth 

  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PSHAPHOS                                         '+
                '      (APPDATE, EMPNO, KORNAME, PAYCL, SEQ, JOBPLACE,        '+
                '       FAMINAME, FAMIJUMIN, FAMIREL,   MEDIDATE,        '+
                '       CORPNO, CORPNAME, CASHCNT, CASHAMT, CARDCNT, CARDAMT, '+
                '       APPAMT, MEDCOMM, WRITETIME, WRITEMAN  )               '+
                '  VALUES                                    '+
                '   ('''+ FL_Appdate                   +''', '+
                '    '''+ FL_AppEmp                    +''', '+
                '    '''+ FM_Mainform.PE_empno.Korname +''', '+
                '    '''+ FM_Mainform.FG_Paycl         +''', '+
                '    '''+ E_Seq.Text                   +''', '+
                '    '''+ FM_Mainform.FG_Place         +''', '+
                '    '''+ E_Fami.Text                  +''', '+
                '    '''+ FL_Famijumin                 +''', '+
                '    '''+ FL_Famirel                   +''', '+
//                '    '''+ Copy(E_hosgubun.Text,1,1)    +''', '+
                '    '''+ Mdate                        +''', '+
                '    '''+ E_corpno.Text                +''', '+
                '    '''+ E_corpname.Text              +''', '+
                '    '''+ FloatToStr(E_cashcnt.Value)  +''', '+
                '    '''+ FloatToStr(E_cashamt.Value)  +''', '+
                '    '''+ FloatToStr(E_cardcnt.Value)  +''', '+
                '    '''+ FloatToStr(E_cardamt.Value)  +''', '+
                '    '''+ FloatToStr(FL_Appamt)        +''', '+
                '    '''+ E_MedComm.Text               +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),    '+
                '    '''+ FM_Mainform.FG_Empno         +''' )';
    end
  else if (JobMode = 'U') and (FM_Mainform.Pgrade[4] in (['A','B'])) then  //관리자는 업데이트 가능.
    begin
        SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
                  '       FAMINAME  = '''+ FL_Faminame                 +''', '+
                  '       FAMIJUMIN = '''+ FL_Famijumin                +''', '+
                  '       FAMIREL   = '''+ FL_Famirel                  +''', '+
//                  '       GUBUN     = '''+ Copy(E_hosgubun.Text,1,1)   +''', '+
                  '       MEDIDATE  = '''+ Mdate                       +''', '+
                  '       CORPNO    = '''+ E_corpno.Text               +''', '+
                  '       CORPNAME  = '''+ E_corpname.Text             +''', '+
                  '       CASHCNT   = '''+ FloatToStr(E_cashcnt.Value) +''', '+
                  '       CASHAMT   = '''+ FloatToStr(E_cashamt.Value) +''', '+
                  '       CARDCNT   = '''+ FloatToStr(E_cardcnt.Value) +''', '+
                  '       CARDAMT   = '''+ FloatToStr(E_cardamt.Value) +''', '+
                  '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
                  '       MEDCOMM   = '''+ E_MedComm.Text              +''', '+
                  '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
                  '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
                  ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
                  '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
                  '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
    end
  else if (JobMode = 'U') and (FL_CONYN = '') then  //결재전에만 Update 가능토록 FL_CONYN 추가 .
    begin
        SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
                  '       FAMINAME  = '''+ FL_Faminame                 +''', '+
                  '       FAMIJUMIN = '''+ FL_Famijumin                +''', '+
                  '       FAMIREL   = '''+ FL_Famirel                  +''', '+
//                  '       GUBUN     = '''+ Copy(E_hosgubun.Text,1,1)   +''', '+
                  '       MEDIDATE  = '''+ Mdate                       +''', '+
                  '       CORPNO    = '''+ E_corpno.Text               +''', '+
                  '       CORPNAME  = '''+ E_corpname.Text             +''', '+
                  '       CASHCNT   = '''+ FloatToStr(E_cashcnt.Value) +''', '+
                  '       CASHAMT   = '''+ FloatToStr(E_cashamt.Value) +''', '+
                  '       CARDCNT   = '''+ FloatToStr(E_cardcnt.Value) +''', '+
                  '       CARDAMT   = '''+ FloatToStr(E_cardamt.Value) +''', '+
                  '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
                  '       MEDCOMM   = '''+ E_MedComm.Text              +''', '+
                  '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
                  '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
                  ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
                  '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
                  '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
    end
  else if (JobMode = 'C') then  //연말정산시 소득공제 여부 수정 가능토록 추가...2006.12.
    begin
        SQLStr := 'UPDATE PSHAPHOS  SET                                      '+
//                  '       GUBUN     = '''+ Copy(E_hosgubun.Text,1,1)   +''', '+
                  '       APPAMT    = '''+ FloatToStr(FL_Appamt)       +''', '+
                  '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),   '+
                  '       WRITEMAN  = '''+ FM_Mainform.FG_Empno        +'''  '+
                  ' WHERE APPDATE   = '''+ FL_Appdate                  +'''  '+
                  '   AND EMPNO     = '''+ FL_AppEmp                   +'''  '+
                  '   AND SEQ       = '''+ E_Seq.Text                  +'''  ';
    end
  else if (JobMode = 'U') and (FL_CONYN <> '') then
    begin
      MessageDlg('결재완료후에는 변경이 불가능합니다',mtError, [mbOk],0);
      System.Exit;
    end
  else
    System.Exit;

  with TDS_Com do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr); //Edit1.Text := SQL.Text;
      if not TDS_Com.Execute then
        begin
          MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  ///최종 저장하는 시점의 근무지로 해당월의 모든 데이터 업데이트
  SQLStr := 'UPDATE PSHAPHOS  SET                               '+
            '       JOBPLACE  = '''+ FM_Mainform.FG_Place +'''  '+
            ' WHERE APPDATE   = '''+ FL_Appdate           +'''  '+
            '   AND EMPNO     = '''+ FL_AppEmp            +'''  ';
  with TDS_Com do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr); //Edit1.Text := SQL.Text;

      if not TDS_Com.Execute then
        begin
          MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;
  ////////////////////////////////////////////////////////////////

  Read_HosRecords(FL_Appdate, FL_AppEmp);

  Read_HosMonthSum(FL_Appdate, FL_AppEmp);


  if (tmp_JobMode = 'I') then
  begin
       TDS_Detail.Last;
       JobMode := 'I';
       Set_Field2(True, True);
  end
  else if (tmp_JobMode = 'U') then
  begin
       TDS_Detail.Locate('SEQ',V,[]);

       JobMode := 'F';
       Set_Field(False, False);

       if CK_DataCheck.Checked then
       begin
            CK_DataCheck.Checked := False;
            L_Appdate.Enabled := False;
            BB_Append.Enabled := True;
            BB_Modify.Enabled := True;
            BB_cancel.Enabled := True;
            BB_Delete.Enabled := True;

            Check_AppamtY.Enabled := False;
            Check_AppamtN.Enabled := False;
            Check_AppamtY.Color   := $00D5D5D5;
            Check_AppamtN.Color   := $00D5D5D5;
       end;
  end;
  SB_Help.Panels[1].Text := '저장 되었습니다.....';

end;

procedure TFM_Hospital.BB_DeleteClick(Sender: TObject);
var
  V : Variant;
  del_seqno : String;
begin
  if E_Fami.Text = '' then
  begin
    MessageDlg('삭제할 데이터를 선택후 작업하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;
  if JobMode ='I' then
  begin
    MessageDlg('지금은 입력 모드 입니다. 취소 버튼을 누른후에 삭제 해주세요.',mtError, [mbOk],0);
    System.Exit;
  end;


  if MessageDlg('신청인원사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  del_seqno := E_Seq.Text;

  V := VarArrayCreate([0,1], varInteger);
  TDS_Detail.Next;
  V[0] := TDS_Detail.FieldByName('seq').AsInteger;

  if FL_CONYN = '' then      //결재전에만 삭제 가능토록.
  begin
    SQLStr  := 'DELETE PSHAPHOS  '+
               ' WHERE APPDATE = '''+ FL_Appdate +''' '+
               '   AND EMPNO   = '''+ FL_AppEmp  +''' '+
               '   AND SEQ     = '''+ del_seqno  +''' ';

    with TDS_Com do
      begin
        ServiceName := 'PKQ1030A_dml';
        Close;
        Sql.Clear;
        Sql.Add(SQLStr);

        if not TDS_Com.Execute then
          begin
            MessageDlg('신청인원사항 삭제에 실패했습니다.',mtError, [mbOk],0);
            System.Exit;
          end;
      end;

    Read_HosRecords(FL_Appdate, FL_AppEmp);
    Read_HosMonthSum(FL_Appdate, FL_AppEmp);

    JobMode := 'F';
    Set_Field(False, True);

  end
  else
  begin
    MessageDlg('결재완료후에는 삭제가 불가능합니다',mtError, [mbOk],0);
  end;

  TDS_Detail.Locate('SEQ',V,[]);
  SB_Help.Panels[1].Text := '삭제 되었습니다.....';

end;

procedure TFM_Hospital.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_Hospital.BB_FamiSaveClick(Sender: TObject);
begin
  FM_Family := TFM_Family.Create(Self);
  FM_Family.ShowModal;
end;

procedure TFM_Hospital.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
    with TDS_Detail do
    begin
      JobMode         := 'F';
      E_Seq.Text      := FieldByName('SEQ').AsString;
      E_Fami.Text     := FieldByName('FAMINAME').AsString;      
//      E_hosgubun.Text := FieldByName('GUBUN').AsString;
      E_medidate.Text := Copy(FieldByName('MEDIDATE').AsString,1,4)+'-'+
                         Copy(FieldByName('MEDIDATE').AsString,5,2)+'-'+
                         Copy(FieldByName('MEDIDATE').AsString,7,2);
      E_medcomm.Text  := FieldByName('MEDCOMM').AsString;
      E_corpname.Text := FieldByName('CORPNAME').AsString;
      E_corpno.Text   := FieldByName('CORPNO').AsString;
      E_cashcnt.Value := FieldByName('CASHCNT').AsFloat;
      E_cashamt.Value := FieldByName('CASHAMT').AsFloat;
      E_cardcnt.Value := FieldByName('CARDCNT').AsFloat;
      E_cardamt.Value := FieldByName('CARDAMT').AsFloat;
      if FieldByName('APPAMT').AsFloat > 0 then //소득공제 비대상액 
        Check_AppamtN.Checked := True
      else
        Check_AppamtY.Checked := True;
      FL_CONYN        := FieldByName('CONYN').AsString;

{      if FieldByName('GUBUN').AsString <> '' then
      begin
        Case StrToInt(FieldByName('GUBUN').AsString) of
          0 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-본인';
          1 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-경로';
          2 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-장애';
          3 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-일반';
        end;
      end;}
    end;

  if CK_DataCheck.Checked then
  begin
    JobMode := 'C';
  end;
end;

procedure TFM_Hospital.FormShow(Sender: TObject);
begin
  initialize;

  //복리후생 관리자는 변경후 사원의 데이터 수정/등록 가능토록,,,
  if  FM_Mainform.Pgrade[4] in (['A','B'])  then
  begin
    L_AppEmpno.Visible := True;
    L_Appdate.Enabled := True;
    E_Seq.Visible := True;
  end
  else
  begin
    L_AppEmpno.Visible := False;
    //L_Appdate.Enabled := False;
    E_Seq.Visible := False;
  end;

  L_AppEmpno.ValueCaption := FM_Mainform.PE_empno.Text;
end;

procedure TFM_Hospital.initialize;
var
  i : Integer;
begin
  Read_FamRecords(FL_AppYY, FL_AppEmp, '%');

  with TDS_Fami2 do
  begin
    E_Fami.Items.Clear;
    E_Fami.DropDownRows := RecordCount;
    First;
    for i := 1 to RecordCount do
    begin
      E_Fami.Items.Add(FieldByName('FAMINAME').AsString);
      next;
    end;
  end;

  Read_HosRecords(FL_Appdate, FL_AppEmp);
  Read_HosMonthSum(FL_Appdate, FL_AppEmp);
end;

procedure TFM_Hospital.E_FamiChange(Sender: TObject);
 var age : Integer;
begin
 age := 0;
  if E_Fami.Enabled then
  begin
    Read_FamRecords(FL_AppYY, FL_AppEmp, E_Fami.Text);
    FL_Famijumin := TDS_Fami2.FieldByName('JUMINID').AsString;
    TDS_Fami2.Close;

    if (Copy(FL_Famijumin,8,1) = '1') or (Copy(FL_Famijumin,8,1) = '2') then
      age := StrToInt(FL_AppYY) - StrToInt('19'+Copy(FL_Famijumin,1,2))
    else if (Copy(FL_Famijumin,8,1) = '3') or (Copy(FL_Famijumin,8,1) = '4') then
      age := StrToInt(FL_AppYY) - StrToInt('20'+Copy(FL_Famijumin,1,2))
    else if (Copy(FL_Famijumin,8,1) = '5') or (Copy(FL_Famijumin,8,1) = '6') then
      age := StrToInt(FL_AppYY) - StrToInt('19'+Copy(FL_Famijumin,1,2));

//    E_hosgubun.Enabled := True;
    
{    if FM_Mainform.PE_empno.Korname = E_Fami.Text then
      begin
        E_hosgubun.ItemIndex := 0;
        E_hosgubun.Enabled := False;
      end
    else if age >= 65 then  ///만 65세 이상이면 경로의료비에 해당.
      E_hosgubun.ItemIndex := 1
    else
      E_hosgubun.ItemIndex := 3;      }

    E_corpno.SetFocus;
  end;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.Check_AppamtYClick(Sender: TObject);
begin
  Check_AppamtN.Checked := False;
end;

procedure TFM_Hospital.Check_AppamtNClick(Sender: TObject);
begin
  Check_AppamtY.Checked := False;
end;

procedure TFM_Hospital.OnCheckBox1Click(Sender: TObject);
begin
  if not L_Appdate.Enabled then
     L_Appdate.Enabled := True;

  L_Appdate.SetFocus;
end;

procedure TFM_Hospital.CK_DataCheckExit(Sender: TObject);
begin
  if CK_DataCheck.Checked then
  begin
    L_Appdate.Enabled   := True;
    BB_Append.Enabled   := False;
    BB_Modify.Enabled   := False;
    BB_cancel.Enabled   := False;
    BB_Delete.Enabled   := False;
    BB_FamiSave.Enabled := False;

    JobMode := 'C';
    Set_Field(False, False);

//    E_hosgubun.Enabled    := True;
    Check_AppamtY.Enabled := True;
    Check_AppamtN.Enabled := True;
    Check_AppamtY.Color   := clWindow;
    Check_AppamtN.Color   := clWindow;
  end
  else
  begin
    L_Appdate.Enabled   := False;
    BB_Append.Enabled   := True;
    BB_Modify.Enabled   := True;
    BB_cancel.Enabled   := True;
    BB_Delete.Enabled   := True;
    BB_FamiSave.Enabled := True;

    JobMode := 'F';
    Set_Field(False, False);

//    E_hosgubun.Enabled    := False;
    Check_AppamtY.Enabled := False;
    Check_AppamtN.Enabled := False;
    Check_AppamtY.Color   := $00D5D5D5;
    Check_AppamtN.Color   := $00D5D5D5;

    L_Appdate.Text := Copy(FM_Mainform.FG_Appdate,1,4)+'-'+Copy(FM_Mainform.FG_Appdate,5,2);
  end;
end;

procedure TFM_Hospital.CK_DataCheckClick(Sender: TObject);
begin
  if not L_Appdate.Enabled then
     L_Appdate.Enabled := True;

  L_Appdate.SetFocus;
end;


procedure TFM_Hospital.L_AppdateExit(Sender: TObject);
begin
     FL_Appdate := Copy(L_Appdate.Text,1,4)+Copy(L_Appdate.Text,6,2);
end;

procedure TFM_Hospital.L_AppdateKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          FL_Appdate := Copy(L_Appdate.Text,1,4)+Copy(L_Appdate.Text,6,2);
          Read_HosRecords(FL_Appdate, FL_AppEmp);
          Read_HosMonthSum(FL_Appdate, FL_AppEmp);
     end;
end;

procedure TFM_Hospital.BT_DataMoveClick(Sender: TObject);
begin
{  if MessageDlg('기존에 이관된 Data 존재 시 삭제후 재 전송합니다.?'+#13+#13+
                '이관 작업을 진행하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TDS_Com do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      SQLStr := 'Delete from pkmyshos              '+
                ' where workyy = ''2008''          '+
                '   and empno  = '''+FL_AppEmp+''' '+
                '   and MoveComment =''이관''      ';

      Sql.Add(SQLStr);     // Edit1.Text := SQL.Text;

      if not TDS_Com.Execute then
      begin
        MessageDlg('이관된 데이터 삭제 작업을 실패했습니다. ',mtError, [mbOk],0);
        System.Exit;
      end;

      Sql.Clear;
      SQLStr := 'Insert Into pkmyshos                                  '+
                'select ''2008'' workyy,   empno,  Rownum,             '+
                '       corpno,  corpname,                             '+
                '       cashcnt, cashamt,                              '+
                '       cardcnt, cardamt,                              '+
                '       decode(famirel,                                '+
                '             ''00'',''0'',                            '+
                '             ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''18'',''1'',''19'',''1'','+
                '             ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'','+
                '             ''01'',''3'',''06'',''3'',                                                    '+
                '             ''04'',''4'',''05'',''4'',''20'',''4'',''21'',''4'',''22'',''4'',''23'',''4'','+
                '             ''13'',''5'',''14'',''5'',''15'',''5'',''28'',''5'',''29'',''5'',''30'',''5'','+
                '             ''6'')             famirel,              '+
                '       faminame,  famijumin, gubun,                   '+
                '       writetime, writeman,  medidate,                '+
                '       ''이관''   MoveComment,''Y''                   '+
                '  from pshaphos                                       '+
                ' where medidate between ''20071201'' and ''20081231'' '+  //1~11월까지 지출한 의료비만 소득공제
                '   and empno  = '''+ FL_AppEmp +'''                   '+
                '   and appamt = 0                                     '+  //소득공제 대상
                '   and  Conyn = ''Y''                      ';  //200701신청년월에 등록한 데이터는 모든 데이터 이관

      Sql.Add(SQLStr);     //Edit1.Text := SQL.Text;
                      
      if not TDS_Com.Execute then
      begin
        MessageDlg('데이터 이관 작업을 실패했습니다. ',mtError, [mbOk],0);
        System.Exit;
      end;

    end;  //with TDS_Com do
  end; //if MessageDlg

  MessageDlg('소득공제 대상 의료비 데이터 이관 완료. ',mtInformation, [mbOk], 0);   }
end;

procedure TFM_Hospital.OnFocusButton1Click(Sender: TObject);
var
    V : variant;
begin
    V := VarArrayCreate([0,1], varInteger);
    V[0] := 12000;
    TDS_Detail.Locate('cashamt',V,[]);
end;





procedure TFM_Hospital.L_AppdateChange(Sender: TObject);
begin
     FL_Appdate := Copy(L_Appdate.Text,1,4)+Copy(L_Appdate.Text,6,2);
     Read_HosRecords(FL_Appdate, FL_AppEmp);
     Read_HosMonthSum(FL_Appdate, FL_AppEmp);
end;

procedure TFM_Hospital.BB_HossearchClick(Sender: TObject);
begin
     if E_corpno.Enabled then
     begin
          FM_HosSearch := TFM_HosSearch.Create(Self);
          FM_HosSearch.ShowModal;
          E_corpno.Text   :=  FM_HosSearch.CORPNO;
          E_corpname.Text :=  FM_HosSearch.CORPNAME;
          E_medidate.SetFocus;
     end else
     begin
          MessageDlg('입력이나 수정 모드를 선택 해주세요...',mtError, [mbOk],0);
          System.Exit;
     end;
end;

procedure TFM_Hospital.E_medidateChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_medcommChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_cashamtChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_corpnoChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
end;

procedure TFM_Hospital.E_corpnameChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
end;

end.


