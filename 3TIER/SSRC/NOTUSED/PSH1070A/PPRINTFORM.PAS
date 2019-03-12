unit PPRINTFORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit, OnLineLabel, OnTmaxCodeEdit,
  OnEditCombo, OnRadioBtn, OnEditMdate, Mask, OnSkinBtn, TmaxFunc, comobj;

type
  TFM_Printform = class(TForm)
    TDS_Com: TTMaxDataSet;
    TmaxSession: TTMaxSession;
    BT_Exit: TOnFocusButton;
    PE_empno: TTMaxPersonPopupEdit;
    SF_Main: TOnSchemeForm;
    OnShapeLabel18: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    BT_Print: TOnFocusButton;
    OnShapeLabel2: TOnShapeLabel;
    RG2: TRadioGroup;
    RG1: TRadioGroup;
    Shape2: TShape;
    Label3: TLabel;
    ME_date1: TOnMaskEdit;
    ME_date2: TOnMaskEdit;
    OnFocusButton1: TOnFocusButton;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_PrintClick(Sender: TObject);
    procedure Retrive1;
    procedure Retrive2;
    procedure OnFocusButton1Click(Sender: TObject);
  private
    { Private declarations }
    FL_conyn  : String;
    procedure PL_Com_Contructor;

  public
    { Public declarations }
    FG_Empno, FG_korname, FG_grade, FG_Date, FG_Sql : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_Sysdate : String;
     gs_TOTamt, gs_conamt : Integer;
  end;

var
  FM_Printform: TFM_Printform;

implementation

uses PSH1070A1, PPRINT1, PPRINT2;


{$R *.DFM}

procedure TFM_Printform.PL_Com_Contructor;
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

/////////////////////////////////////////////////////////////////////////////////

procedure TFM_Printform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Printform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TDS_Com.Close;
  Action := CaFree;
end;

procedure TFM_Printform.FormShow(Sender: TObject);
 var frdate, todate, FL_sql : String;
begin

  PE_empno.OnReadEnded := nil;
  PE_empno.Empno   := FM_Mainform.vEmpno;
  PE_empno.Korname := FM_Mainform.vKorname;
  PE_empno.Text    := FM_Mainform.PE_empno.Text;
  PE_empno.Sql     := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,     '+
                      '    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,'+
                      '    A.empdate, A.orgempdate, A.juminid, A.jobdept '+
                      '  FROM pycdept B, pyccode C, pyccode D, pimpmas A, pkzspmas M '+
                      ' WHERE D.codeid(+) = ''I113''       '+
                      '   AND A.payra     = D.codeno(+)    '+
                      '   AND C.codeid(+) = ''I112''       '+
                      '   AND A.paycl     = C.codeno(+)    '+
                      '   AND A.orgnum    = B.orgnum(+)    '+
                      '   AND A.deptcode  = B.deptcode(+)  '+
                      '   AND A.empno     = M.empno        '+
                      '   AND ((a.empno   = '''+FM_Mainform.FG_Empno+''')  '+
                      '    OR  (M.Bempno  = '''+FM_Mainform.FG_Empno+'''))  ';
  PE_empno.PL_get_singledata;

  PE_Empno.Enabled := True;
//  //복리후생 담당 관리자는 변경가능토록,,,
//  if  FM_Mainform.FG_grade[4] in (['A','B'])  then PE_Empno.Enabled := True
//  else                                             PE_Empno.Enabled := False;

  
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Clear;      //지급년월 조회
    FL_sql := 'SELECT substr(max(to_char(sysdate,''YYYYMM'')),1,4),  '+#13+
              '       ''field2'', ''field3'',                        '+#13+
              '       ''field4'', ''field5''                         '+#13+
              '  FROM dual                                           ';
    Sql.Add(FL_sql);
    Open;

    First;
    ME_date1.Text := FieldByName('field1').AsString+'-01';
    ME_date2.Text := FieldByName('field1').AsString+'-12';
    Close;
  end;
end;

procedure TFM_Printform.PE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      PE_empno.PL_get_singledata;
      Key := #0;
    end;
end;

procedure TFM_Printform.BT_PrintClick(Sender: TObject);
begin
  FL_conyn := '';
  if      RG2.ItemIndex = 0 then FL_conyn := '%'
  else if RG2.ItemIndex = 1 then FL_conyn := 'Y'
  else if RG2.ItemIndex = 2 then FL_conyn := 'N';
  //////////////////////////////////////////////////

  if RG1.ItemIndex = 0 then
  begin
    Retrive1;
    if TDS_Com.RecordCount = 0 then
    begin
      MessageDlg('조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
      Exit;
    end;

    try
      FM_Print1 := TFM_Print1.Create(Application);
      FM_Print1.QuickRep1.Preview;
    finally
      FM_Print1.free;
    end;
  end
  else if RG1.ItemIndex = 1 then
  begin
    Retrive2;
    if TDS_Com.RecordCount = 0 then
    begin
      MessageDlg('조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
      Exit;
    end;
        
    try
      FM_Print2 := TFM_Print2.Create(Application);
      FM_Print2.QuickRep1.Preview;
    finally
      FM_Print2.free;
    end;
  end
end;

procedure TFM_Printform.Retrive1;
 var i : Integer;
     d1, d2  : String;
begin
  gs_TOTamt := 0;
  gs_conamt := 0;

  d1 := Copy(ME_date1.Text,1,4)+Copy(ME_date1.Text,6,2);
  d2 := Copy(ME_date2.Text,1,4)+Copy(ME_date2.Text,6,2);

  with TDS_Com do
  begin
    Close;
    PL_Com_Contructor;  //기간내 전체신청총액
    FG_Sql := Format('SELECT nvl(SUM(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0) ,          '+
                     '       ''field2'', ''field3'', ''field4'', ''field5''         '+
                     '  FROM PSHAPHOS                                               '+
                     ' WHERE MEDIDATE Between ''%s'' and ''%s''                     '+
                     '   AND EMPNO = ''%s''  ',[d1+'01', d2+'31', Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql;
    Open;
    gs_totamt :=  FieldByName('field1').AsInteger;

    Close;
    PL_Com_Contructor;  //기간내 전체승인총액
    FG_Sql := Format('SELECT nvl(SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0))-SUM(NVL(EXCEPTAMT,0)),0), '+
                     '       ''field2'', ''field3'', ''field4'', ''field5''                   '+
                     '  FROM PSHAPHOS                                                         '+
                     ' WHERE MEDIDATE Between ''%s'' and ''%s''                               '+
                     '   AND CONYN = ''Y''                                                    '+
                     '   AND EMPNO = ''%s''  ',[d1+'01', d2+'31', Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql; 
    Open;
    gs_conamt :=  FieldByName('field1').AsInteger;
  end;

  //////////////////////////////////////////////////////////////////////////////
  with TDS_Com do
  begin
    Close;
    ServiceName := 'PSH1040C_sel1';
    ClearFieldInfo;
    AddField('APPDATE'  , ftString, 7);
    AddField('EMPNO'    , ftString, 4);
    AddField('FAMINAME' , ftString, 12);
    AddField('MEDCOMM'  , ftString, 50);
    AddField('CORPNAME' , ftString, 30);
    AddField('CONYNSAYU', ftString, 50);
    AddField('MEDIDATE' , ftString, 10);
    AddField('CONYN'    , ftString, 7);
    AddField('TOTAMT'   , ftFloat,  9);
    AddField('EXCEPTAMT', ftFloat,  9);
    AddField('APPAMT'   , ftFloat,  9);
    AddField('TSysdate' , ftString, 8);

    FG_Sql := Format('SELECT substr(APPDATE,1,4)||''-''||substr(APPDATE,5,2) APPDATE,                                '+
                     '       EMPNO    ,                                                                              '+
                     '       FAMINAME ,                                                                              '+
                     '       MEDCOMM  ,                                                                              '+
                     '       CORPNAME ,                                                                              '+
                     '       CONYNSAYU,                                                                              '+
                     '       Substr(MEDIDATE,1,4)||''-''||Substr(MEDIDATE,5,2)||''-''||Substr(MEDIDATE,7,2) MEDIDATE,'+
                     '       decode(CONYN,''Y'',''승인'',''N'',''미승인'',''X'',''미지원'','''',''미결재'') CONYN,   '+
                     '       NVL(CASHAMT,0) + NVL(CARDAMT,0) TOTAMT   ,                                              '+
                     '       NVL(EXCEPTAMT,0)                EXCEPTAMT,                                              '+
                     '       NVL(APPAMT,0)                   APPAMT   ,                                              '+
                     '       To_Char(Sysdate,''YYYYMMDD'')   TSysdate                                                '+
                     '  FROM PSHAPHOS                                                                                '+
                     ' WHERE MEDIDATE Between ''%s'' and ''%s''                                                      '+
                     '   AND NVL(CONYN,''N'') Like ''%s''                                                            '+
                     '   AND EMPNO = ''%s''                                                                          '+
                     ' Order by 7, 1             ',[d1+'01', d2+'31', FL_conyn, Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql; // edit1.text := Sql.Text;
    Open;
  end;
end;

procedure TFM_Printform.Retrive2;
 var i : Integer;
     d1, d2 : String;
begin
  d1 := Copy(ME_date1.Text,1,4)+Copy(ME_date1.Text,6,2);
  d2 := Copy(ME_date2.Text,1,4)+Copy(ME_date2.Text,6,2);

  with TDS_Com do
  begin
    Close;
    ServiceName := 'PSH1040C_sel2';
    ClearFieldInfo;
    AddField('APPDATE'  , ftString,  7);
    AddField('EMPNO'    , ftString,  4);
    AddField('PLAYDATE' , ftString, 10);
    AddField('PLAYITEM' , ftString, 20);
    AddField('CORPNAME' , ftString, 30);
    AddField('PLAYAMT'  , ftInteger, 9);
    AddField('EXCEPTAMT', ftInteger, 9);
    AddField('SETAMT'   , ftInteger, 9);
    AddField('PREAMT'   , ftInteger, 9);
    AddField('CONYN'    , ftString,  6);
    AddField('STARTYYMM', ftString,  7);
    AddField('ENDYYMM'  , ftString,  7);
    AddField('DIVISION' , ftInteger, 2);
    AddField('DIVISION2', ftInteger, 2);
    AddField('CONYNSAYU', ftString, 50);
    AddField('TSysdate' , ftString,  8);    

    FG_Sql := Format('SELECT substr(APPDATE,1,4)||''-''||substr(APPDATE,5,2) APPDATE,                                '+
                     '       EMPNO     ,                                                                             '+
                     '       substr(PLAYDATE,1,4)||''-''||substr(PLAYDATE,5,2)||''-''||substr(PLAYDATE,7,2) PLAYDATE,'+
                     '       PLAYITEM  ,                                                                             '+
                     '       CORPNAME  ,                                                                             '+
                     '       PLAYAMT   ,                                                                             '+
                     '       EXCEPTAMT ,                                                                             '+
                     '       SETAMT    ,                                                                             '+
                     '       PREAMT    ,                                                                             '+
                     '       decode(CONYN,''Y'',''승인'',''N'',''미승인'',''X'',''미지원'','''',''미결재'') CONYN,   '+
                     '       substr(STARTYYMM,1,4)||''-''||substr(STARTYYMM,5,2)    STARTYYMM,                       '+
                     '       substr(ENDYYMM  ,1,4)||''-''||substr(ENDYYMM  ,5,2)    ENDYYMM,                         '+
                     '       DIVISION  ,                                                                             '+
                     '       DIVISION2 ,                                                                             '+
                     '       CONYNSAYU ,                                                                             '+
                     '       To_Char(Sysdate,''YYYYMMDD'') TSysdate                                                  '+
                     '  FROM PSHAPLAY                                                                                '+
                     ' WHERE PLAYDATE Between ''%s'' and ''%s''                                                      '+
                     '   AND NVl(CONYN,''N'') Like ''%s''                                                            '+
                     '   AND EMPNO = ''%s''                                                                          '+
                     ' Order by 3, 1            ',[d1+'01', d2+'31', FL_conyn, Copy(PE_empno.Text,1,4)]);
    Sql.Text := FG_Sql;  //edit1.text := Sql.Text;
    Open;
  end;
end;

procedure TFM_Printform.OnFocusButton1Click(Sender: TObject);
var XL, XArr: Variant;                                                                                                           
    i,k: integer;
begin
  FL_conyn := '';
  if      RG2.ItemIndex = 0 then FL_conyn := '%'
  else if RG2.ItemIndex = 1 then FL_conyn := 'Y'
  else if RG2.ItemIndex = 2 then FL_conyn := 'N';
  //////////////////////////////////////////////////

  if RG1.ItemIndex = 0 then
  begin
       Retrive1;
       if TDS_Com.RecordCount = 0 then
       begin
            MessageDlg('조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
            Exit;
       end;

       XArr := VarArrayCreate([1, 10], VarVariant);
       try
            XL := CreateOLEObject('Excel.Application');
       except
            MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
            Exit;
       end;
       screen.cursor := crHourGlass;

       XL.WorkBooks.Add;                           //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := Pe_empno.Korname +' 의료비 상세내역'; //시트명 부여
       XL.Range['A1:J2'].Merge;                    //셀 병합

       //TITLE NAME 설정
       XL.Range['A1'].value := Pe_empno.Korname +' 의료비 상세내역';
       XL.Range['A1'].font.Size := 16;

       //컬럼명 지정_서브타이블 지정
       XArr[1] := '진료일자';
       XArr[2] := '신청년월';
       XArr[3] := '가족성명';
       XArr[4] := '진료내역';
       XArr[5] := '의료기관';
       XArr[6] := '지 출 액';
       XArr[7] := '제외금액';
       XArr[8] := '공제비대상액';
       XArr[9] := '승인여부';
       XArr[10]:= '비승인사유(비고)';
       XL.Range['A3' , 'J3'].Value := XArr;
       k := 3;
       for i := 1 to 10 do
       begin                                                                                                                         
            XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;                                                                      
            XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;                                                                    
            XL.Range[CHR(64 + i) + '3'].font.Size := 10;                                                                               
            XL.Range[CHR(64 + i) + '3'].font.Bold := True;
       end;

       //검색된 자료를 excel에 export처리 시킨다.
       TDS_Com.First;

       for i := 1 to  TDS_Com.RecordCount do
       begin
            XArr[1] := TDS_Com.FieldbyName('MEDIDATE').AsString;
            XArr[2] := TDS_Com.FieldbyName('APPDATE').AsString;
            XArr[3] := TDS_Com.FieldbyName('FAMINAME').AsString;
            XArr[4] := TDS_Com.FieldbyName('MEDCOMM').AsString;
            XArr[5] := TDS_Com.FieldbyName('CORPNAME').AsString;
            XArr[6] := TDS_Com.FieldbyName('TOTAMT').AsFloat;
            XArr[7] := TDS_Com.FieldbyName('EXCEPTAMT').AsFloat;
            XArr[8] := TDS_Com.FieldbyName('APPAMT').AsFloat;
            XArr[9] := TDS_Com.FieldbyName('CONYN').AsString;
            XArr[10]:= TDS_Com.FieldbyName('CONYNSAYU').AsString;
            XL.Range['A' + IntToStr(k+1), 'J' + IntToStr(k+1)].Value := XArr;
            inc(k);
            TDS_Com.Next;
       end;

       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', 'J' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'J' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', 'J' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', 'J' + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A3', 'J' + IntToStr(k)].font.Size := 9;
       XL.Range['B3', 'C' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
       XL.Range['D3', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', 'J' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                //자동정렬
       XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
       XL.Visible := true;                                          //엑셀자료 보여줌
       Screen.Cursor := crDefault;
  end

  else if RG1.ItemIndex = 1 then
  begin
       Retrive2;
       if TDS_Com.RecordCount = 0 then
       begin
         MessageDlg('조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
         Exit;
       end;

       XArr := VarArrayCreate([1, 11], VarVariant);
       try
            XL := CreateOLEObject('Excel.Application');
       except
            MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
            Exit;
       end;
       screen.cursor := crHourGlass;

       XL.WorkBooks.Add;                           //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := Pe_empno.Korname + ' 체육활동 상세내역'; //시트명 부여
       XL.Range['A1:K2'].Merge;                    //셀 병합

       //TITLE NAME 설정
       XL.Range['A1'].value := Pe_empno.Korname + ' 체육활동 상세내역';
       XL.Range['A1'].font.Size := 16;

       //컬럼명 지정_서브타이블 지정
       XArr[1] := '지급일자';
       XArr[2] := '신청년월';
       XArr[3] := '운동종목';
       XArr[4] := '체육기관';
       XArr[5] := '지 출 액';
       XArr[6] := '제외금액';
       XArr[7] := '조정금액';
       XArr[8] := '전월이월액';
       XArr[9] := '시작년월';
       XArr[10]:= '종료년월';
       XArr[11]:= '승인여부';
       XL.Range['A3' , 'K3'].Value := XArr;
       k := 3;
       for i := 1 to 11 do
       begin                                                                                                                         
            XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;                                                                      
            XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;                                                                    
            XL.Range[CHR(64 + i) + '3'].font.Size := 10;                                                                               
            XL.Range[CHR(64 + i) + '3'].font.Bold := True;
       end;

       //검색된 자료를 excel에 export처리 시킨다.
       TDS_Com.First;
       for i := 1 to  TDS_Com.RecordCount do
       begin
            XArr[1] := TDS_Com.FieldbyName('PLAYDATE').AsString;
            XArr[2] := TDS_Com.FieldbyName('APPDATE').AsString;
            XArr[3] := TDS_Com.FieldbyName('PLAYITEM').AsString;
            XArr[4] := TDS_Com.FieldbyName('CORPNAME').AsString;
            XArr[5] := TDS_Com.FieldbyName('PLAYAMT').AsFloat;
            XArr[6] := TDS_Com.FieldbyName('EXCEPTAMT').AsFloat;
            XArr[7] := TDS_Com.FieldbyName('SETAMT').AsFloat;
            XArr[8] := TDS_Com.FieldbyName('PREAMT').AsFloat;
            XArr[9] := TDS_Com.FieldbyName('STARTYYMM').AsString;
            XArr[10]:= TDS_Com.FieldbyName('ENDYYMM').AsString;
            XArr[11]:= TDS_Com.FieldbyName('CONYN').AsString;
            XL.Range['A' + IntToStr(k+1), 'K' + IntToStr(k+1)].Value := XArr;
            inc(k);
            TDS_Com.Next;
       end;

       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', 'K' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'K' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', 'K' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', 'K' + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A3', 'K' + IntToStr(k)].font.Size := 9;
       XL.Range['B3', 'C' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
       XL.Range['D3', 'K' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', 'K' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                //자동정렬
       XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
       XL.Visible := true;                                          //엑셀자료 보여줌
       Screen.Cursor := crDefault;       
  end
end;

end.
{
SELECT APPDATE, DECODE(PART,'A','의료비','B','체육') PART,
       A.EMPNO, A.KORNAME, DEPTNAME, APPAMT, APPSUM, EXTAMT, EXTSUM,
       CONAMT, CONSUM, SETAMT, SETSUM, PREAMT, PRESUM, SUPAMT, SUPSUM
  FROM PSHAPSUM A, PIMPMAS B, PYCDEPT C
 WHERE A.EMPNO    = B.EMPNO
   AND B.ORGNUM   = C.ORGNUM
   AND B.DEPTCODE = C.DEPTCODE
   AND APPDATE    =:appdate
   AND A.EMPNO  Between :Empno1 and :Empno2
--   AND PART IN ( '+ partgubun +' )
 Order by 1,2,3
}
