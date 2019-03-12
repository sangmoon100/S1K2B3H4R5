unit PSH1070A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, Grids,
  DBGrids, OnGrDBGrid, StdCtrls, OnFocusButton, OnShapeLabel,
  OnEditBtnCtrl, OnEditMdate, OnEditNumCtl, OnScheme;

type
  TFM_Sports = class(TForm)
    Shape1: TShape;
    Label10: TLabel;
    L_Appdate: TOnShapeLabel;
    DB_PalyList: TOnGrDbGrid;
    Panel53: TPanel;
    Panel52: TPanel;
    Panel7: TPanel;
    E_corpname: TOnEdit;
    E_playitem: TOnEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    E_corptel: TOnEdit;
    Panel3: TPanel;
    E_comments: TOnEdit;
    DataSource1: TDataSource;
    TDS_Detail: TTMaxDataSet;
    TDS_Com: TTMaxDataSet;
    BB_Append: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Panel4: TPanel;
    E_playamt: TOnNumberEdit;
    E_division: TOnNumberEdit;
    TDS_DML: TTMaxDataSet;
    HelpMemo1: TMemo;
    BB_Help: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    L_AppEmpno: TOnShapeLabel;
    E_Seq: TOnEdit;
    E_Playdate: TOnMaskEdit;
    BB_Print: TOnFocusButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);

    procedure MaxSeq;
    procedure Next_Month(sAppdate : String);
    function  Check_Input : Boolean;
    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Read_PlayRecords(Appdate, EmpNO: String);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_ExitClick(Sender: TObject);
    procedure E_divisionExit(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_PrintClick(Sender: TObject);
  private
    { Private declarations }
    FL_Appdate, FL_AppEmp, FL_DevYYMM  : String;
    FL_CONYN : String;

    procedure PL_Com_Contructor;

  public
    { Public declarations }
    JobMode       : Char;
    sMsg          : String;
    SQLStr        : String;
    AmtChk,AmtChk2,iEXCEPTAMT : Double;
  end;

var
  FM_Sports: TFM_Sports;

implementation

uses PSH1070A1, PSH1070A4;

{$R *.DFM}

procedure TFM_Sports.PL_Com_Contructor;
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

function TFM_Sports.Check_Input : Boolean;
var
   Temp : Real;
begin
  result := True;

  if E_playamt.Text   < '0' then
  begin
    MessageDlg('지급액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_playitem.Text < '       ' then
  begin
    MessageDlg('운동종목을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_corpname.Text < '       ' then
  begin
    MessageDlg('사업자명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_corptel.Text  < '0' then
  begin
    MessageDlg('운동시설의 전화번호를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;

  if Length(Trim(E_Playdate.Text)) <> 10 then
  begin
    MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
    E_Playdate.SetFocus;
    result := false;
  end;

  Try
    Temp := StrToDate(E_Playdate.Text);
  Except on EConvertError do
    begin
      MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
      E_Playdate.SetFocus;
      Result  := False;
    end;
  end;
end;

procedure TFM_Sports.Set_Field(arg1, arg2 : Boolean );
begin
  DB_PalyList.Enabled  := not arg1;

  E_playdate.Enabled := arg1;
  E_playamt.Enabled  := arg1;
  E_playitem.Enabled := arg1;
  E_corpname.Enabled := arg1;
  E_corptel.Enabled  := arg1;
  E_comments.Enabled := arg1;
  E_division.Enabled := arg1;

  if arg2 then
    begin
      E_playdate.Text := '____-__-__';
      E_playamt.Text  := '';
      E_playitem.Text := '';
      E_corpname.Text := '';
      E_corptel.Text  := '';
      E_comments.Text := '';
      E_division.Text := '';
    end;

  if JobMode = 'U' then    E_division.Enabled := False
  else E_division.Enabled := True;
end;

procedure TFM_Sports.MaxSeq;
begin
  with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1),   ');
      Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
      Sql.Add('  FROM PSHAPLAY                      ');
      Sql.Add(' WHERE EMPNO   ='''+ FL_AppEmp  +''' ');
      Open;
      E_Seq.Text := FieldByName('field1').AsString;
      Close;
    end;
end;

procedure TFM_Sports.Next_Month(sAppdate : String);
begin
  with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+ sAppdate +''',''YYYYMM''), 1),''YYYYMM''),');
      Sql.Add('       ''field2'', ''field3'', ''field4'', ''field5''  ');
      Sql.Add('  FROM Dual                      ');
      Open;        //  edit1.text := sql.text;
      FL_DevYYMM := FieldByName('field1').AsString;
      Close;
    end;
end;

Procedure TFM_Sports.Read_PlayRecords(Appdate, EmpNo : String);
begin
  with TDS_Detail do
    begin
      ServiceName := 'PSH1030A_sel2';
      Close;
      Sql.Clear;
      Sql.Add('SELECT EMPNO, SEQ, CORPNAME, CORPTEL, PLAYDATE, PLAYITEM, ');
      Sql.Add('       PLAYAMT, DIVISION, CONYN, CONYNSAYU, COMMENTS      ');
      Sql.Add('  FROM PSHAPLAY                            ');
      Sql.Add(' WHERE APPDATE = '''+ Appdate +'''         ');
      Sql.Add('   AND EMPNO   = '''+ Empno  +'''          ');
      Sql.Add(' ORDER BY SEQ                              ');

      ClearFieldInfo;
      AddField('EMPNO'   , ftString,  4);
      AddField('SEQ'     , ftInteger, 3);
      AddField('CORPNAME', ftString,  30);
      AddField('CORPTEL' , ftString,  15);
      AddField('PLAYDATE', ftString,  8);
      AddField('PLAYITEM', ftString,  20);
      AddField('PLAYAMT' , ftInteger, 7);
      AddField('DIVISION', ftInteger, 2);
      AddField('CONYN'   , ftString,  1);
      AddField('CONYNSAYU', ftString,  50);
      AddField('COMMENTS' , ftString,  50);
      Open;       //edit1.text := sql.text;

      TFloatField(FieldByName('PLAYAMT')).DisplayFormat := '#,###';
    end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TFM_Sports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Sports.FormCreate(Sender: TObject);
begin
  FL_Appdate := FM_Mainform.FG_Appdate;
  FL_AppEmp  := Copy(FM_Mainform.PE_empno.Text,1,4);
  L_Appdate.ValueCaption := FM_Mainform.L_Appdate.LabelCaption;
end;

procedure TFM_Sports.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  Set_Field(True, True);
                       
  MaxSeq;
  MaxSeq;
end;

procedure TFM_Sports.BB_ModifyClick(Sender: TObject);
begin
  if E_division.Value > 1 then
    begin
      MessageDlg('분할신청 내역은 삭제후 재등록하여 주시기 바랍니다',mtInformation, [mbOk],0);
      System.Exit;
    end;
    
  JobMode := 'U';
  Set_Field(True, False);
end;

procedure TFM_Sports.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);
  Read_PlayRecords(FL_Appdate, FL_AppEmp);
end;

procedure TFM_Sports.BB_DeleteClick(Sender: TObject);
var Playdate : string;
begin
  if E_corpname.Text = '' then
  begin
    MessageDlg('삭제할 데이터를 선택후 작업하시기 바랍니다.',mtError, [mbOk],0);
    System.Exit;
  end;
  
  Playdate := Copy(E_playdate.Text,1,4)+Copy(E_playdate.Text,6,2)+Copy(E_playdate.Text,9,2);

  if MessageDlg('공제인원사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  //분할등록된 내역 삭제
  if (FL_CONYN = '') and (E_division.Value > 1) then      //결재전에만 삭제 가능토록.
    begin
      SQLStr  := 'DELETE PSHAPLAY  '+
                 ' WHERE EMPNO    = '''+ FL_AppEmp       +''' '+
                 '   AND Playdate = '''+ Playdate        +''' '+
                 '   AND PlayItem = '''+ E_playitem.Text +''' '+
                 '   AND Conyn is Null ';

      TDS_DML.Sql.Clear;  // ServiceName := 'PKQ1030A_dml';
      TDS_DML.Sql.Add(SQLStr);

      if not TDS_DML.Execute then
        begin
          MessageDlg('등록내역 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;

      Read_PlayRecords(FL_Appdate, FL_Appemp);
      JobMode := 'F';
      Set_Field(False, True);
    end
    
  //분할안된 데이터 삭제.
  else  if (FL_CONYN = '') and (E_division.Value <= 1) then      //결재전에만 삭제 가능토록.
    begin
      SQLStr  := 'DELETE PSHAPLAY  '+
                 ' WHERE APPDATE = '''+ FL_Appdate +''' '+
                 '   AND EMPNO   = '''+ FL_AppEmp  +''' '+
                 '   AND SEQ     = '''+ E_Seq.Text +''' ';

      TDS_DML.Sql.Clear;  // ServiceName := 'PKQ1030A_dml';
      TDS_DML.Sql.Add(SQLStr);

      if not TDS_DML.Execute then
        begin
          MessageDlg('등록내역 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;

      Read_PlayRecords(FL_Appdate, FL_Appemp);  
      JobMode := 'F';
      Set_Field(False, True);
    end
  else
    begin
      MessageDlg('결재완료후에는 삭제가 불가능합니다',mtError, [mbOk],0);
    end;
end;

procedure TFM_Sports.BB_SaveClick(Sender: TObject);
var
    Playdate, DevYYMM, EndYYMM : string;
    i : integer;
    AmtFirst, AmtLast, iGIVEMAX3 : Double;
    tmp_JobMode : Char;
    V : Variant; //데이터 수정 후 해당 레코드 Locate 하기위한 Seq 저장변수
begin
  if not Check_Input then
    Exit;

  with TDS_Com do
    begin
      PL_Com_Contructor;
      SQLStr := 'SELECT to_char(add_months(to_date('+FL_Appdate+',''yyyymm''),'+FloatToStr(E_division.Value)+'-1),''yyyymm''), '+
                '       GIVEMAX3, ''field3'', ''field4'', ''field5''  '+
                ' FROM PSCAPBAS                   ';
      Sql.Clear;
      Sql.Add(SQLStr);    //edit1.text := SQLStr;
      Open;

      EndYYMM   := FieldByName('field1').AsString;   //분할개월 마지막월
      iGIVEMAX3 := FieldByName('field2').AsFloat;    //월 한도액
      Close;
    end;

  Playdate := Copy(E_playdate.Text,1,4)+Copy(E_playdate.Text,6,2)+Copy(E_playdate.Text,9,2);
  
  tmp_JobMode := JobMode;

  //////////////////////////////////////////////////////////////////////////////
  //분할신청일때
  if (JobMode = 'I') and (E_division.Value > 1) then
  begin
    if MessageDlg('분할신청은 신청개월수만큼 신청금액을 나누어 자동저장 됩니다.'+#13+#13
                 +'총신청금액 '+FloatToStr(E_playamt.Value)+ '원, '
                 +FloatToStr(E_division.Value)+'개월 분할신청이 맞습니까?'
                 ,mtConfirmation, [mbYes, mbNo],0) <> mrYes then
      System.Exit;

    FL_DevYYMM := FL_Appdate;    //현재년월
    AmtFirst := Trunc(E_playamt.Value / E_division.Value);  //처음금액 (절삭)
    AmtLast  := E_playamt.Value - ( Trunc(E_playamt.Value / E_division.Value) * (E_division.Value - 1) );  //마지막월 금액
    for i := 1 to  StrToInt(FloatToStr(E_division.Value)) do
      begin
// 월에 신청금액이 7만원이 넘지 않게 처리 시작 kth
            with TDS_Com do
            begin
                 PL_Com_Contructor;
                 SQLStr := 'SELECT NVL(SUM(PLAYAMT),0), ''field2'', ''field3'', ''field4'', ''field5''  '+
                           ' FROM PSHAPLAY                                                       '+
                           'WHERE APPDATE ='''+ FL_DevYYMM + '''                                 '+
                           '  AND NVL(CONYN,''N'') <> ''X''                                                 '+
                           '  AND EMPNO = '''+ FL_AppEmp+'''                                     ';
                 Sql.Clear;
                 Sql.Add(SQLStr);    //edit1.text := SQLStr;
                 Open;
// 현금액 KTH     필요없어 주석 처리 KTH 2012.05.24 

{                 if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast > iGIVEMAX3) then
                    AmtChk2 :=     AmtLast - (AmtLast  - iGIVEMAX3)
                 else
                 if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst > iGIVEMAX3) then
                    AmtChk2 :=     (AmtFirst) - (AmtFirst - iGIVEMAX3);  //EXCEPTAMT

                 if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast <= iGIVEMAX3) then
                    AmtChk2  :=    (AmtLast)
                 else
                 if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst <= iGIVEMAX3) then
                    AmtChk2 :=   (AmtFirst);        //EXCEPTAMT}

                 iEXCEPTAMT:= 0;
                 AmtChk    := FieldByName('field1').AsFloat;   //기존 신청금액  임시 변수에 넣음 kth 2012.05.24
                 if AmtChk > iGIVEMAX3  then                   //기존 신청금액이 7만원 이상이면   kth 2012.05.24
                 begin
                       iEXCEPTAMT := AmtFirst ;                //마지막 신청금액 전부 iEXCEPTAMT 넣음  kth 2012.05.24
                 end
                 else begin                                    //기존 신청금액이 7만원 이하이면   kth 2012.05.24
                       AmtChk    := FieldByName('field1').AsFloat+AmtLast;  //마지막 신청금액+기존신청금액  kth 2012.05.24
                       if   AmtChk >= iGIVEMAX3  then                          //마지막 신청금액+기존신청금액 7만원 넘는지 체크 kth 2012.05.24
                            iEXCEPTAMT := AmtChk - iGIVEMAX3
                       else
                            iEXCEPTAMT := 0;                                   //7만원 미만이면 0 을 넣어 줌.
                 end;

//현금액 끝 KTH
                 Close;
            end;

           { if  AmtChk > 70000 then
            begin
                 MessageDlg('이번달 신청금액이 7만원을 초과 했습니다...'+#13#10
                           +'신청하려면 담당자에게 문의 부탁 드립니다...',mtError, [mbOk],0);
                 System.Exit;
            end;}
// 월에 신청금액이 7만원이 넘지 않게 처리 끝 kth

        SQLStr := 'INSERT INTO PSHAPLAY                                  '+
                  '      (APPDATE, EMPNO, KORNAME, PAYCL, SEQ, JOBPLACE, '+
                  '       CORPNAME, CORPTEL, PLAYDATE, PLAYITEM, PLAYAMT,'+
                  '       EXCEPTAMT, DIVISION, STARTYYMM, ENDYYMM,       '+
                  '       COMMENTS, WRITETIME, WRITEMAN )                '+
                  '  VALUES                                 '+
                  '   ('''+ FL_DevYYMM                +''', '+
                  '    '''+ FL_AppEmp                 +''', '+
                  '    '''+ FM_Mainform.PE_empno.Korname +''', '+
                  '    '''+ FM_Mainform.FG_Paycl      +''', '+
                  '    '''+ E_Seq.Text                +''', '+
                  '    '''+ FM_Mainform.FG_Place      +''', '+
                  '    '''+ E_corpname.Text           +''', '+
                  '    '''+ E_corptel.Text            +''', '+
                  '    '''+ Playdate                  +''', '+
                  '    '''+ E_playitem.Text           +''', '+
                  '    '''+ FloatToStr(AmtLast)       +''', '+
                  '    '''+ FloatToStr(iEXCEPTAMT)    +''', '+


{        if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast  > iGIVEMAX3) then
          SQLStr := SQLStr + ' '''+ FloatToStr(AmtLast)  +''', '+
                             ' '''+ FloatToStr(AmtLast  - iGIVEMAX3) +''', '
        else if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst > iGIVEMAX3) then
          SQLStr := SQLStr + ' '''+ FloatToStr(AmtFirst) +''', '+              //PLAYAMT
                             ' '''+ FloatToStr(AmtFirst - iGIVEMAX3) +''', ';  //EXCEPTAMT

        if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast <= iGIVEMAX3) then
          SQLStr := SQLStr + ' '''+ FloatToStr(AmtLast)  +''', '+
                             ' '''+ FloatToStr(0)  +''', '
        else if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst <= iGIVEMAX3) then
          SQLStr := SQLStr + ' '''+ FloatToStr(AmtFirst) +''', '+  //PLAYAMT
                             ' '''+ FloatToStr(0)  +''', ';        //EXCEPTAMT}

//        SQLStr := SQLStr +
                  '    '''+ FloatToStr(E_division.Value)+''', '+
                  '    '''+ FL_Appdate                +''', '+  //STARTYYMM
                  '    '''+ EndYYMM                   +''', '+  //ENDYYMM
                  '    '''+ E_comments.Text           +''', '+
                  '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                  '    '''+ FM_Mainform.FG_Empno      +''') ';

        TDS_DML.Sql.Clear;  // ServiceName := 'PKQ1030A_dml';
        TDS_DML.Sql.Add(SQLStr);   // edit1.text := SQLStr;

        if not TDS_DML.Execute then
          begin
            MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
            System.Exit;
          end;

        Next_Month(FL_DevYYMM); //다음 분할 신청년월
        Next;
      end;

    Read_PlayRecords(FL_Appdate, FL_AppEmp);
    Set_Field(False, False);
  end;

  //////////////////////////////////////////////////////////////////////////////
  //분할신청 아닐때
  //////////////////////////////////////////////////////////////////////////////  
  if (JobMode = 'I') and (E_division.Value <= 1) then
    begin
// 월에 신청금액이 7만원이 넘지 않게 처리 시작 kth
            with TDS_Com do
            begin
                 PL_Com_Contructor;
                 SQLStr := 'SELECT NVL(SUM(PLAYAMT),0), ''field2'', ''field3'', ''field4'', ''field5''  '+
                           ' FROM PSHAPLAY                                                       '+
                           'WHERE APPDATE ='''+ FL_Appdate + '''                                 '+
                           '  AND NVL(CONYN,''N'') <> ''X''                                                 '+
                           '  AND EMPNO = '''+ FL_AppEmp+'''                                     ';
                 Sql.Clear;
                 Sql.Add(SQLStr);    //edit1.text := SQLStr;
                 Open;
// 현금액 KTH
                 if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast > iGIVEMAX3) then
                    AmtChk2 :=     AmtLast - (AmtLast  - iGIVEMAX3)
                 else
                 if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst > iGIVEMAX3) then
                    AmtChk2 :=     (AmtFirst) - (AmtFirst - iGIVEMAX3);  //EXCEPTAMT

                 if (i = StrToInt(FloatToStr(E_division.Value))) and (AmtLast <= iGIVEMAX3) then
                    AmtChk2  :=    (AmtLast)
                 else
                 if (i <> StrToInt(FloatToStr(E_division.Value))) and (AmtFirst <= iGIVEMAX3) then
                    AmtChk2 :=   (AmtFirst);        //EXCEPTAMT
//현금액 끝 KTH

                 AmtChk    := FieldByName('field1').AsFloat+E_playamt.Value;   //기존 신청금액
                 Close;
            end;

// 월에 신청금액이 7만원이 넘지 않게 처리 끝 kth






      SQLStr := 'INSERT INTO PSHAPLAY                                  '+
                '      (APPDATE, EMPNO, KORNAME, PAYCL, SEQ, JOBPLACE, '+
                '       CORPNAME, CORPTEL, PLAYDATE, PLAYITEM, PLAYAMT,'+
                '       EXCEPTAMT, DIVISION, STARTYYMM, ENDYYMM,       '+
                '       COMMENTS, WRITETIME, WRITEMAN )                '+
                '  VALUES                                 '+
                '   ('''+ FL_Appdate                +''', '+
                '    '''+ FL_AppEmp                 +''', '+
                '    '''+ FM_Mainform.PE_empno.Korname +''', '+
                '    '''+ FM_Mainform.FG_Paycl      +''', '+
                '    '''+ E_Seq.Text                +''', '+
                '    '''+ FM_Mainform.FG_Place      +''', '+
                '    '''+ E_corpname.Text           +''', '+
                '    '''+ E_corptel.Text            +''', '+
                '    '''+ Playdate                  +''', '+
                '    '''+ E_playitem.Text           +''', '+
                '    '''+ FloatToStr(E_playamt.Value) +''', ';

             if (E_playamt.Value > iGIVEMAX3) then
                SQLStr := SQLStr + '    '''+ FloatToStr(E_playamt.Value - iGIVEMAX3) +''', '
             else
                SQLStr := SQLStr + '    '''+ FloatToStr(0) +''', ';

       SQLStr := SQLStr +
                '    '''+ FloatToStr(E_division.Value)+''', '+
                '    '''+ FL_Appdate                +''', '+  //STARTYYMM
                '    '''+ EndYYMM                   +''', '+  //ENDYYMM
                '    '''+ E_comments.Text           +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                '    '''+ FM_Mainform.FG_Empno      +''') ';
    end
  else if (JobMode = 'U') and (FL_CONYN = '') then  //결재전에만 Update 가능토록 FL_CONYN 추가 .
    begin
      SQLStr := 'UPDATE PSHAPLAY  SET                          '+
                '       CORPNAME  = '''+ E_corpname.Text +''', '+
                '       CORPTEL   = '''+ E_corptel.Text  +''', '+
                '       PLAYDATE  = '''+ Playdate        +''', '+
                '       PLAYITEM  = '''+ E_playitem.Text +''', '+
                '       PLAYAMT   = '''+ FloatToStr(E_playamt.Value) +''', ';

             if (E_playamt.Value > iGIVEMAX3) then
                SQLStr := SQLStr + '       EXCEPTAMT = '''+ FloatToStr(E_playamt.Value - iGIVEMAX3) +''', '
             else
                SQLStr := SQLStr + '       EXCEPTAMT = '''+ FloatToStr(0) +''', ';

      SQLStr := SQLStr +
                '       DIVISION  = '''+ FloatToStr(E_division.Value)+''', '+
                '       STARTYYMM = '''+ FL_Appdate                  +''', '+
                '       ENDYYMM   = '''+ EndYYMM                     +''', '+
                '       COMMENTS  = '''+ E_comments.Text             +''', '+
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

  TDS_DML.Sql.Clear;  // ServiceName := 'PKQ1030A_dml';
  TDS_DML.Sql.Add(SQLStr);      //edit1.text := SQLStr;

  if not TDS_DML.Execute then
    begin
      MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
      System.Exit;
    end;

  ///최종 저장하는 시점의 근무지로 해당월의 모든 데이터 업데이트
  SQLStr := 'UPDATE PSHAPLAY  SET                          '+
            '       JOBPLACE  = '''+ FM_Mainform.FG_Place +'''  '+
            ' WHERE APPDATE   = '''+ FL_Appdate           +'''  '+
            '   AND EMPNO     = '''+ FL_AppEmp            +'''  ';
  TDS_DML.Sql.Clear;  // ServiceName := 'PKQ1030A_dml';
  TDS_DML.Sql.Add(SQLStr);

  if not TDS_DML.Execute then
    begin
      MessageDlg('저장에 실패했습니다. 취소후 재등록 해주시기 바랍니다.',mtError, [mbOk],0);
      System.Exit;
    end;
  ////////////////////////////////////////////////////////////////

  V := VarArrayCreate([0,0],varInteger);
  V[0] := StrToInt(E_Seq.Text);

  Read_PlayRecords(FL_Appdate, FL_AppEmp);

  if (tmp_JobMode = 'I') then
  begin
       TDS_Detail.Last;
  end
  else if (tmp_JobMode = 'U') then
  begin
       TDS_Detail.Locate('seq',V,[]);
  end;

  Set_Field(False, False);
end;


procedure TFM_Sports.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sports.FormShow(Sender: TObject);
begin
  Read_PlayRecords(FL_Appdate, FL_Appemp);

  //복리후생 관리자는 사번 보이도록...
  if  FM_Mainform.Pgrade[4] in (['A','B'])  then
  begin
    L_AppEmpno.Visible := True;
    E_Seq.Visible := True;
  end
  else
  begin
    L_AppEmpno.Visible := False;
    E_Seq.Visible := False;
  end;
  
  L_AppEmpno.ValueCaption := FM_Mainform.PE_empno.Text;
end;

procedure TFM_Sports.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  with TDS_Detail do
  begin
    JobMode         := 'F';
    E_Seq.Text      := FieldByName('SEQ').AsString;    
    E_corpname.Text := FieldByName('CORPNAME').AsString;
    E_corptel.Text  := FieldByName('CORPTEL').AsString;
    E_playdate.Text := Copy(FieldByName('PLAYDATE').AsString,1,4)+'-'+
                       Copy(FieldByName('PLAYDATE').AsString,5,2)+'-'+
                       Copy(FieldByName('PLAYDATE').AsString,7,2);
    E_playamt.Text  := FieldByName('PLAYAMT').AsString;
    E_playitem.Text := FieldByName('PLAYITEM').AsString;
    E_division.Text := FieldByName('DIVISION').AsString;
    E_comments.Text := FieldByName('COMMENTS').AsString;

    FL_CONYN        := FieldByName('CONYN').AsString;
  end;
end;

procedure TFM_Sports.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sports.E_divisionExit(Sender: TObject);
var  frdate, todate, sDivi : String;
begin
  sDivi := FloatToStr(E_division.Value - 1);
  with TDS_Com do
    begin
      PL_Com_Contructor;
      Sql.Add('SELECT SUBSTR(CONTODATE,1,6) field1,');
      Sql.Add('       TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(CONTODATE,1,6),''YYYYMM''), '''+ sDivi +'''),''YYYYMM''), ');
      Sql.Add('       ''field3'', ''field4'', ''field5''  ');
      Sql.Add('  FROM PSCAPBAS                      ');
      Open;       //   edit1.text := sql.text;
      frdate := FieldByName('field1').AsString;
      todate := FieldByName('field2').AsString;
      Close;
    end;

  if frdate <> todate then
    E_comments.Text := frdate+' ~ '+todate
  else
    E_comments.Text := frdate;
end;

procedure TFM_Sports.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_Sports.BB_PrintClick(Sender: TObject);
begin
  ///////////////////////////////////////////////////////////////////////
//  FM_Tmax           := TFM_Tmax.Create(Self);
//  FM_Tmax.T_Session := TMaxSession;
//  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  FM_Print := TFM_Print.Create(Application);
  FM_Print.QRCompositeReport1.Preview;
end;

end.
