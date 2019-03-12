{-------------------------------------------------------------------------------
  o 프로그램명 : 건강검진관리
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 급여
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2009.09
  o 변경 이력사항
    버전 일자       작성자   변경내용                                 처리명세서 반영여부
    1.14 2013.09    지순미   상담이력에 혈압,혈당 저장 및 그래프보기
-------------------------------------------------------------------------------}
unit PSJ1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, StdCtrls, OnFocusButton, Db,
  MemDS, DBAccess, Ora, jpeg, Func, OnInsaCommon, Grids, DBGrids,
  OnEditNumCtl, OnEditMemo, OnEditMdate, OnRadioBtn, OnEditCombo, comobj,
  TeEngine, Series, TeeProcs, Chart, DBChart;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    BT_Exit: TOnFocusButton;
    QryMas: TOraQuery;
    BT_Print: TOnFocusButton;
    L_age: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    L_medicineyn: TOnShapeLabel;
    E_empno: TOnPersonPopupEdit;
    E_caredate: TOnDateEdit;
    E_ment: TOnMemo;
    RB1: TOnRadioButton;
    RB2: TOnRadioButton;
    E_hospital: TOnEdit;
    E_medicine: TOnEdit;
    E_takemedicine: TOnEdit;
    E_height: TOnNumberEdit;
    E_weight: TOnNumberEdit;
    L_tobaccoyn: TOnShapeLabel;
    L_drinkyn: TOnShapeLabel;
    E_eat: TOnEdit;
    E_history: TOnMemo;
    E_family: TOnMemo;
    E_etc: TOnMemo;
    BT_Save: TOnFocusButton;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    RB4: TOnRadioButton;
    RB3: TOnRadioButton;
    RB6: TOnRadioButton;
    RB5: TOnRadioButton;
    E_Nursing: TOnEdit;
    E_Problem: TOnEdit;
    E_discomfort: TOnMemo;
    E_health: TOnMemo;
    E_sports: TOnMemo;
    E_Tobacco: TOnEdit;
    E_drink: TOnEdit;
    E_fatrate: TOnComboEdit;
    QryHis: TOraQuery;
    OnShapeLabel1: TOnShapeLabel;
    Q_Grid: TOraQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    E_DateFr: TOnDateEdit;
    E_CareLast: TOnDateEdit;
    Memo1: TMemo;
    BT_Excel: TOnFocusButton;
    Label2: TLabel;
    E_DateTo: TOnDateEdit;
    OnFocusButton1: TOnFocusButton;
    E_BloodMax: TOnNumberEdit;
    E_BloodMin: TOnNumberEdit;
    E_BloodSugar: TOnNumberEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoChange(Sender: TObject);
    procedure E_empnoClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_PrintClick(Sender: TObject);
    procedure E_DateFrChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_ExcelClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);

  private
    { Private declarations }
    procedure Comp_Clear;
    procedure MasterRead;

  public
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

implementation

uses PSJ1030A2, PSJ1030A3;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;

  QryMas.Session  := Ora_Session;
  E_empno.Session := Ora_Session;

  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  with QryMas do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select 1 from pymenuuser          ');
       Sql.Add (' Where groupid = ''G053''         ');  //건강검진관리자(간호사)
       Sql.Add ('   And lockyn  = ''N''            ');
       Sql.Add ('   And empno   = '''+ Pempno +''' ');
       Open
  end;

  if (QryMas.RecordCount <> 1) and (Copy(Pempno,1,1) <> 'D') then
  begin
       ShowMessage('귀하는 접근 권한이 부족합니다. 프로그램을 종료합니다.');
       QryMas.Close;
       FM_Main.Close;
  end;

  E_caredate.Text := InMask(fn_GetDate,'@@@@-@@-@@');     // showmessage(E_caredate.Text);
  SB_Help.Panels[1].Text := ' 상담하고자 하는 사번/성명 입력후 상담내역을 등록하시기 바랍니다.';
  E_Empno.SetFocus;
end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(13) then
  begin
       E_empno.Text := UpperCase(E_empno.Text);
       Key := #0;

       E_ment.SetFocus;
  end;
end;

procedure TFM_Main.E_empnoChange(Sender: TObject);
begin
  if E_empno.empno <> '' then
  begin
       MasterRead;
  end;
end;

procedure TFM_Main.E_empnoClick(Sender: TObject);
begin
  E_empno.empno := '';
  E_empno.Text  := '';
  
  //인적사항  Clear ...............................
  L_dept.ValueCaption := '';
  L_age.ValueCaption  := '';

  Comp_Clear;
end;


procedure TFM_Main.Comp_Clear;
begin
  RB1.Checked         := False;
  RB2.Checked         := False;
  RB3.Checked         := False;
  RB4.Checked         := False;
  RB5.Checked         := False;
  RB6.Checked         := False;
  L_age.ValueCaption  := '';
  L_dept.ValueCaption := '';
  E_ment.Text         := '';
  E_hospital.Text     := '';
  E_medicine.Text     := '';
  E_takemedicine.Text := '';
  E_eat.Text          := '';
  E_sports.Text       := '';
  E_health.Text       := '';
  E_discomfort.Text   := '';
  E_history.Text      := '';
  E_family.Text       := '';
  E_etc.Text          := '';
  E_Problem.Text      := '';
  E_Nursing.Text      := '';
end;

//마스터 Read...
procedure TFM_Main.MasterRead;
begin
  Hinsa_Initcomponent(Self,99);

  if E_empno.empno = '' then Exit;

  with QryMas do
  begin //인적사항
       Close;
       Sql.Clear;
       SQL.Add('SELECT empno, korname, juminid, sex, korage, deptcode,                                        ');
       SQL.Add('      (select codename from pyccode where codeid=''I113'' and codeno=A.payra )     payraname, ');
       SQL.Add('      (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode) deptname   ');
       SQL.Add('  FROM pimpmas A                                                                              ');
       Sql.Add(' Where Empno = '''+ E_empno.empno + '''                                                       ');
       Open;

       L_dept.ValueCaption := FieldByname('deptname').AsString;

       if FieldByname('sex').AsString = 'M' then  L_age.ValueCaption  := '남 / ' + FieldByname('korage').AsString;
       if FieldByname('sex').AsString = 'F' then  L_age.ValueCaption  := '여 / ' + FieldByname('korage').AsString;

       
       //건강상담내역    //Master Read...
       Close;
       Sql.Clear;  // [ 건 강 상 담 개 인 표 ]
       Sql.Add ('Select * From PsMtreat                  ');
       Sql.Add (' Where Empno = '''+ E_empno.empno + ''' ');
       Open;

       E_CareLast.Text     := FieldByName('Caredate').AsString; //마지막 상담일..       
       E_hospital.Text     := FieldByName('hospital').AsString;
       E_medicine.Text     := FieldByName('medicine').AsString;
       E_takemedicine.Text := FieldByName('takemedicine').AsString;
       E_ment.Text         := FieldByName('ment').AsString;
       E_height.Value      := FieldByName('height').AsFloat;
       E_weight.Value      := FieldByName('weight').AsFloat;
       E_fatrate.Text      := FieldByName('fatrate').AsString;
       E_eat.Text          := FieldByName('eat').AsString;
       E_sports.Text       := FieldByName('sports').AsString;
       E_health.Text       := FieldByName('health').AsString;
       E_discomfort.Text   := FieldByName('discomfort').AsString;
       E_history.Text      := FieldByName('history').AsString;
       E_family.Text       := FieldByName('family').AsString;
       E_etc.Text          := FieldByName('etc').AsString;
       if FieldByName('medicineyn').AsString = '유' then RB1.Checked := True;
       if FieldByName('medicineyn').AsString = '무' then RB2.Checked := True;
       if FieldByName('tobaccoyn').AsString  = '유' then RB3.Checked := True;
       if FieldByName('tobaccoyn').AsString  = '무' then RB4.Checked := True;
       if FieldByName('drinkyn').AsString    = '유' then RB5.Checked := True;
       if FieldByName('drinkyn').AsString    = '무' then RB6.Checked := True;

       /////////////////////////////////////////////////////////////////////////
       Close;
       Sql.Clear;   // [ 간  호  기  록  지 ]
       Sql.Add ('Select * From PsHtreat                                       ');
       Sql.Add (' Where Empno = '''+ E_empno.empno + '''                      ');
       Sql.Add ('   And caredate = (Select caredate From PsMtreat             ');
       Sql.Add ('                    Where Empno = '''+ E_empno.empno + ''' ) ');
       Open;

       E_Problem.Text      := FieldByName('Problem').AsString;
       E_Nursing.Text      := FieldByName('Nursing').AsString;
       E_BloodMax.Value    := FieldByName('BloodMax').AsInteger;
       E_BloodMin.Value    := FieldByName('BloodMin').AsInteger;
       E_BloodSugar.Value  := FieldByName('BloodSugar').AsInteger;
  end;

  SB_Help.Panels[1].Text := ' 조회 완료.';
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var vMedicineyn, vTobaccoyn, vDrinkyn : String;
begin
  if RB1.Checked = True then vMedicineyn := '유';
  if RB2.Checked = True then vMedicineyn := '무';  
  if RB3.Checked = True then vTobaccoyn  := '유';
  if RB4.Checked = True then vTobaccoyn  := '무';
  if RB5.Checked = True then vDrinkyn    := '유';
  if RB6.Checked = True then vDrinkyn    := '무';

  with QryMas do    //Master Read...
  begin
       Close;
       Sql.Clear;   // [ 건 강 상 담 개 인 표 ]
       Sql.Add ('Select 1 From psmtreat                  ');
       Sql.Add (' Where Empno = '''+ E_empno.empno + ''' ');
       Open;

       if QryMas.RecordCount = 0 then
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Insert into psmtreat   Values            ');
            Sql.Add (' ( '''+ E_empno.empno              +''', ');
            Sql.Add ('   '''+ E_empno.korname            +''', ');
            Sql.Add ('   '''+ E_caredate.Text            +''', ');
            Sql.Add ('   '''+ vMedicineyn                +''', ');
            Sql.Add ('   '''+ E_hospital.Text            +''', ');
            Sql.Add ('   '''+ E_medicine.Text            +''', ');
            Sql.Add ('   '''+ E_takemedicine.Text        +''', ');
            Sql.Add ('   '''+ E_ment.Text                +''', ');
            Sql.Add ('   '''+ FloatToStr(E_height.Value) +''', ');
            Sql.Add ('   '''+ FloatToStr(E_weight.Value) +''', ');
            Sql.Add ('   '''+ E_fatrate.Text             +''', ');
            Sql.Add ('   '''+ vTobaccoyn                 +''', ');
            Sql.Add ('   '''+ E_Tobacco.Text             +''', ');
            Sql.Add ('   '''+ vDrinkyn                   +''', ');
            Sql.Add ('   '''+ E_Drink.Text               +''', ');
            Sql.Add ('   '''+ E_eat.Text                 +''', ');
            Sql.Add ('   '''+ E_sports.Text              +''', ');
            Sql.Add ('   '''+ E_health.Text              +''', ');
            Sql.Add ('   '''+ E_discomfort.Text          +''', ');
            Sql.Add ('   '''+ E_history.Text             +''', ');
            Sql.Add ('   '''+ E_family.Text              +''', ');
            Sql.Add ('   '''+ E_etc.Text                 +''', ');
            Sql.Add ('   '''+ Pempno                     +''', ');
            Sql.Add ('   TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''))');
       end
       else
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Update psmtreat                                             ');
            Sql.Add ('   Set caredate     = '''+ E_caredate.text            +''', ');
            Sql.Add ('       Medicineyn   = '''+ vMedicineyn                +''', ');
            Sql.Add ('       hospital     = '''+ E_hospital.Text            +''', ');
            Sql.Add ('       medicine     = '''+ E_medicine.Text            +''', ');
            Sql.Add ('       takemedicine = '''+ E_takemedicine.Text        +''', ');
            Sql.Add ('       ment         = '''+ E_ment.Text                +''', ');            
            Sql.Add ('       height       = '''+ FloatToStr(E_height.Value) +''', ');
            Sql.Add ('       weight       = '''+ FloatToStr(E_weight.Value) +''', ');
            Sql.Add ('       fatrate      = '''+ E_fatrate.Text             +''', '); 
            Sql.Add ('       Tobaccoyn    = '''+ vTobaccoyn                 +''', ');
            Sql.Add ('       Drinkyn      = '''+ vDrinkyn                   +''', ');
            Sql.Add ('       eat          = '''+ E_eat.Text                 +''', ');
            Sql.Add ('       sports       = '''+ E_sports.Text              +''', ');
            Sql.Add ('       health       = '''+ E_health.Text              +''', ');
            Sql.Add ('       discomfort   = '''+ E_discomfort.Text          +''', ');
            Sql.Add ('       history      = '''+ E_history.Text             +''', ');
            Sql.Add ('       family       = '''+ E_family.Text              +''', ');
            Sql.Add ('       etc          = '''+ E_etc.Text                 +''', ');
            Sql.Add ('       Writeman     = '''+ Pempno                     +''', ');
            Sql.Add ('       Writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ');
            Sql.Add (' Where Empno        = '''+ E_empno.empno              +'''  ');
       end;
       QryMas.ExecSql;
  end;

  /////////////////////////////////////////////////////////////////////////
  with QryMas do
  begin
       Close;
       Sql.Clear;  // [ 간  호  기  록  지 ]  
       Sql.Add ('Select 1 From PsHtreat                       ');
       Sql.Add (' Where Empno    = '''+ E_empno.empno   + ''' ');
       Sql.Add ('   And caredate = '''+ E_caredate.Text + ''' ');
       Open;

       if QryMas.RecordCount = 0 then
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Insert into PsHtreat   Values              ');
            Sql.Add (' ( '''+ E_empno.empno                +''', ');
            Sql.Add ('   '''+ E_empno.korname              +''', ');
            Sql.Add ('   '''+ E_caredate.Text              +''', ');
            Sql.Add ('   '''+ E_problem.Text               +''', ');
            Sql.Add ('   '''+ E_nursing.Text               +''', ');
            Sql.Add ('   '''+ Pempno                       +''', ');
            Sql.Add ('   TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') , ');
            Sql.Add ('   '+ FloattoStr(E_BloodMax.Value)   +'  , ');
            Sql.Add ('   '+ FloattoStr(E_BloodMin.Value)   +'  , ');
            Sql.Add ('   '+ FloattoStr(E_BloodSugar.Value) +'  ) ');
       end
       else
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Update PsHtreat                                            ');
            Sql.Add ('   Set problem   = '''+ E_problem.Text               +''', ');
            Sql.Add ('       nursing   = '''+ E_nursing.Text               +''', ');
            Sql.Add ('       Writeman  = '''+ Pempno                       +''', ');
            Sql.Add ('       Writetime = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') , ');
            Sql.Add ('       BloodMax  = '+ FloattoStr(E_BloodMax.Value)   +'  , ');
            Sql.Add ('       BloodMin  = '+ FloattoStr(E_BloodMin.Value)   +'  , ');
            Sql.Add ('       BloodSugar= '+ FloattoStr(E_BloodSugar.Value) +'    ');
            Sql.Add (' Where Empno     = '''+ E_empno.empno                + ''' ');
            Sql.Add ('   And caredate  = '''+ E_caredate.Text              + ''' ');
       end;
       QryMas.ExecSql;
  end;

  SB_Help.Panels[1].Text := ' 저장 완료.';
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
  with QryMas do    //Master Read...
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select * From psmtreat                  ');
       Sql.Add (' Where Empno = '''+ E_empno.empno + ''' ');
       Open;
  end;

  with QryHis do    //건강기록지
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select substr(caredate,6,2) Wol, substr(caredate,9,2) il, ');
       Sql.Add ('       empno, korname, problem, nursing,');
       Sql.Add ('       bloodmax, bloodmin, bloodsugar   ');
       Sql.Add ('  From PsHtreat                         ');
       Sql.Add (' Where Empno = '''+ E_empno.empno + ''' ');
       Sql.Add ('   And Trim(Problem) Is Not Null        ');
       Sql.Add ('   And Trim(Nursing) Is Not Null        '); //건강기록지 미입력자료 안나오게..
       Sql.Add (' Order by caredate                      ');
       Open;
  end;
  
  FM_Print := TFM_Print.Create(Self);
  FM_Print.QRCompositeReport1.Preview;
end;

procedure TFM_Main.E_DateFrChange(Sender: TObject);
var vLoginEmp : String;
begin
  vLoginEmp := Pempno;
  if Copy(Pempno,1,1) = 'D' then vLoginEmp := '%';
  if Copy(Pempno,1,1) = 'D' then DBGrid1.Columns[5].Visible := True;

  with Q_Grid do    //Master Read...
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select Rownum Rank, Caredate, Empno, Korname, Problem, Nursing,');
       Sql.Add ('       Writeman, bloodmax, bloodmin, bloodsugar                ');
       Sql.Add ('  From PsHtreat                                                ');
       Sql.Add (' Where Caredate >= '''+ E_DateFr.Text +'''                     ');
       Sql.Add ('   And Caredate <= '''+ E_DateTo.Text +'''                     ');
       Sql.Add ('   And Writeman like '''+ vLoginEmp   +'''                     '); //동작, 본사 간호사가 각각 저장한 사원만 나타나도록.
       Sql.Add ('   And Trim(Problem) Is Not Null                               ');
       Sql.Add ('   And Trim(Nursing) Is Not Null                               '); //미입력자료 안나오게..
       Open;
  end;      // showmessage(E_Carehis.Text);
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_empno.empno := Q_Grid.Fields[2].AsString;
  E_empno.Text  := Q_Grid.Fields[2].AsString +' - '+ Q_Grid.Fields[3].AsString;
  if E_empno.empno <> '' then MasterRead;
end;

procedure TFM_Main.BT_ExcelClick(Sender: TObject);
var
    XL, XArr  : Variant;
    SavePlace : TBookmark;
    XLi, XLk  : integer;
begin
  if Q_Grid.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  SB_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 8], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_Help.Panels[1].Text := '';
       Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '간호기록지';  //시트명 부여

  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '상담일';
  XArr[2]  := '사번';
  XArr[3]  := '성명';
  XArr[4]  := 'Problem';
  XArr[5]  := 'NursingCare';
  XArr[6]  := '혈압(수축기)';
  XArr[7]  := '혈압(이완기)';
  XArr[8]  := '혈당';

  XL.Range['A1' , 'H1'].Value := XArr;
  XLk := 1;
  for XLi := 1 to 8 do
  begin
       XL.Range[CHR(64 + XLi) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + XLi) + '1'].Interior.Color      := $00CBF0B3;
       XL.Range[CHR(64 + XLi) + '1'].font.Size           := 10;
       XL.Range[CHR(64 + XLi) + '1'].font.Bold           := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := Q_Grid.GetBookmark;
  Q_Grid.DisableControls;
  Q_Grid.First;

  with Q_Grid do
  begin
       for XLi := 1 to  RecordCount do
       begin
            XArr[1]  := FieldbyName('CAREDATE').AsString;
            XArr[2]  := ''''+FieldbyName('EMPNO').AsString;
            XArr[3]  := FieldByName('KORNAME').AsString;
            XArr[4]  := FieldByName('Problem').AsString;
            XArr[5]  := FieldByName('Nursing').AsString;
            XArr[6]  := FieldByName('BloodMax').AsString;
            XArr[7]  := FieldByName('BloodMin').AsString;
            XArr[8]  := FieldByName('BloodSugar').AsString;

            XL.Range['A' + IntToStr(XLk+1), 'H' + IntToStr(XLk+1)].Value := XArr;
            inc(XLk);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'H' + IntToStr(XLk)].Borders.LineStyle   := 1;        //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'H' + IntToStr(XLk)].Borders.Weight      := 2;        //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'H' + IntToStr(XLk)].Borders.ColorIndex  := 1;        //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'H' + IntToStr(XLk)].font.name           := '굴림체';
  XL.Range['A1', 'H' + IntToStr(XLk)].font.Size           := 9;
  XL.Range['A1', 'A1'].HorizontalAlignment                := 3;        //가운데 정렬
  XL.Range['A2', 'H' + IntToStr(XLk)].HorizontalAlignment := 3;        //가운데 정렬
  XL.Range['D2', 'H' + IntToStr(XLk)].HorizontalAlignment := 1;        //우측정렬
  XL.Range['A1', 'H' + IntToStr(XLk)].Select;                          //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                       //자동정렬
  XL.Range['A2', 'A2'].Select;                                        //A4열에 커서 위치시킴
  //////////////////////////////////////////////////////////////////////////////
  XL.Visible := true;                                                 //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  Q_Grid.GotoBookmark(SavePlace);
  Q_Grid.FreeBookmark(SavePlace);
  Q_Grid.EnableControls;
  SB_Help.Panels[1].Text := ' 추출 완료.';
end;

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
begin
  if Length(trim(E_empno.Text)) >= 4 then
  begin
       try

         ChartForm := TChartForm.Create(self);
         ChartForm.L_empno.ValueCaption := E_empno.Text;
         ChartForm.L_dept.ValueCaption  := L_dept.ValueCaption;
         ChartForm.ShowModal;
       finally
         ChartForm.free;
       end;
  end
  else
  begin
        MessageDlg('조회할 구성원을 먼저 입력하시기 바랍니다.', MtWarning, [mbok], 0);
  end;
end;

end.
