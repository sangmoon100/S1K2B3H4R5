unit PKG5040A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, ExtCtrls, OnShapeLabel, Grids,
  DBGrids, OnEditBaseCtrl, OnEditNumCtl, ComCtrls, OnInsaCommon, Db, DBTables,
  FormMon1, comobj, StdCtrls, OnFocusButton, MemDS, DBAccess, Ora, Pass;  // Calen2 ==> FormMon1  

type
  TFMainForm = class(TForm)
    SB_Help: TStatusBar;
    DataSource1: TDataSource;
    Panel1: TPanel;
    OnShapeLabel4: TOnShapeLabel;
    BE_Date1: TOnButtonEdit;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    E_DeptCode: TOnButtonEdit;
    E_deptname: TOnEdit;
    E_orgnum: TEdit;
    BT_Search: TOnFocusButton;
    Bt_MiDept: TOnFocusButton;
    BT_Excel: TOnFocusButton;
    Bt_Exit: TOnFocusButton;
    Ora_Session: TOraSession;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    procedure Bt_ExitClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure BE_Date1ButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Bt_MiDeptClick(Sender: TObject);
    procedure E_DeptCodeButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure E_DeptCodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BT_ExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

  public
      procedure GridSelect1;
      procedure GridSelect2;
      procedure ExcelSelect1;
      procedure ExcelSelect2;
      procedure Create_Excel1;
      procedure Create_Excel2;
      Function  GetHoliChk(sDay:String): String;

    { Public declarations }
  end;

var
  FMainForm: TFMainForm;

implementation

uses  ConDept, DeptForm;

{$R *.DFM}

procedure TFMainForm.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := Passemp(cmdline,5);
  Ora_Session.Password      := Passemp(cmdline,6);
  Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);

  try
    Ora_Session.Connected  := True;
  except on E : Exception do
    Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+ E.Message),'알 림',MB_OK);
  end;
end;

procedure TFMainForm.FormShow(Sender: TObject);
begin
  with OraQuery3 do
  begin
    Close;
    Sql.Clear;
    SQL.Add('SELECT TO_CHAR(SYSDATE,''YYYY - MM'') YYMM  FROM DUAL ');
    Open;
    BE_Date1.Text := OraQuery3.FieldByName('YYMM').AsString;

    Close;
    SQL.Clear;
    SQL.Add ( 'select value1 from pimvari where gubun=''00'' and sgubun=''0001''');
    Open;
    E_orgnum.Text := OraQuery3.FieldByName('value1').AsString;
    Close;
  end;
end;

procedure TFMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFMainForm.GridSelect1;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with DBGrid1, OraQuery1 do
  begin
    Close;
    Sql.Clear;
    sSql :=
    ' SELECT A.DUYYMM, A.DEPTCODE,                                                     '+#13+
    '        A.EMPNO                                                     사번,         '+#13+
    '	     A.KORNAME                                                   성명,         '+#13+
    '	     A.CNT                                                       교대근무일수, '+#13+
    '       (SELECT GREATEST(DECODE(SIGN(A.CNT - KIJUN11),-1,0,KIJUN12) ,              '+#13+
    '	                     DECODE(SIGN(A.CNT - KIJUN21),-1,0,KIJUN22))               '+#13+
    '          FROM PKCEXBAS WHERE DUYYMM = A.DUYYMM)                    교휴일수,     '+#13+
    '	     A.CNT2                                                      유급휴일근무  '+#13+
    ' FROM (SELECT DUYYMM,                                                             '+#13+
    '              EMPNO,                                                              '+#13+
    '		   KORNAME,                                                            '+#13+
    '		   DEPTCODE,                                                           '+#13+
    '		   SUM(DECODE(KEY1,''06'',1,0)) CNT,                                   '+#13+
    '              SUM(DECODE(KEY1,''06'',                                             '+#13+
    '                             (SELECT 1 FROM PKCHOLI                               '+#13+
    '                               WHERE HOLIDATE = A.DUYYMM || LPAD(A.CNT,2,''0'')   '+#13+
    '                                 AND HOLIKIND =''1''),0)) CNT2                    '+#13+
    '      FROM (SELECT A.DUYYMM,                                                      '+#13+
    '	                A.EMPNO,                                                       '+#13+
    '		        A.KORNAME,                                                     '+#13+
    '		        A.DEPTCODE,                                                    '+#13+
    '		        C.CNT,                                                         '+#13+
    '                   DECODE(C.CNT, 1,A.DD1,  2,A.DD2,  3,A.DD3,  4,A.DD4,  5,A.DD5, '+#13+
    '	                              6,A.DD6,  7,A.DD7,  8,A.DD8,  9,A.DD9, 10,A.DD10,'+#13+
    '       	                     11,A.DD11,12,A.DD12,13,A.DD13,14,A.DD14,15,A.DD15,'+#13+
    '      		             16,A.DD16,17,A.DD17,18,A.DD18,19,A.DD19,20,A.DD20,'+#13+
    '			             21,A.DD21,22,A.DD22,23,A.DD23,24,A.DD24,25,A.DD25,'+#13+
    '			             26,A.DD26,27,A.DD27,28,A.DD28,29,A.DD29,30,A.DD30,'+#13+
    '			             31,A.DD31) KEY1                                   '+#13+
    '             FROM PKHDUTY A, PKMEXLIST B,                                         '+#13+
    '                 (SELECT ROWNUM CNT FROM USER_TABLES                              '+#13+
    '	                WHERE ROWNUM < 32) C	               		  	       '+#13+
    '            WHERE A.DUYYMM = ''%s''                                               '+#13+
    '		   AND A.EMPNO  = B.EMPNO                                              '+#13+
    '		   AND A.DUYYMM = B.DUYYMM                                             '+#13+
    '		   AND B.DEPTCODE LIKE  ''%s'') A                                      '+#13+
    '      GROUP BY DUYYMM,EMPNO,KORNAME,DEPTCODE) A                                   ';
    SQL.Add( Format(sSql, [sYYMM,copy(e_deptcode.text,1,4)+'%']) );
    //memo1.text := Format(sSql, [sYYMM,copy(e_deptcode.text,1,3)+'%']);
    Open;
  end;                                        
end;                               

procedure TFMainForm.GridSelect2;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with DBGrid2, OraQuery2 do
  begin
    Close;
    Sql.Clear;
    sSql := 'SELECT DECODE(B.DUTYCODE,''04'',''교 휴'',''05'',''대 휴'') DUTYCODE,  '+
            '       B.EMPNO, B.KORNAME, B.USECOUNT,                                 '+
            '       DECODE(TO_CHAR(B.USEDAY2),'''',TO_CHAR(B.USEDAY1),              '+
            '              TO_CHAR(B.USEDAY1)||'' , ''||TO_CHAR(B.USEDAY2)) USEDAY1 '+
            '  FROM PIMPMAS A, PKMEXUSE B                                           '+
            ' WHERE A.EMPNO = B.EMPNO						    '+
            '   AND B.DUYYMM = ''%s''		        			    '+
            '   AND A.DEPTCODE LIKE ''%s''                                          '+
            ' ORDER BY B.DUTYCODE, B.KORNAME					    ';
    SQL.Add( Format(sSql, [sYYMM,copy(e_deptcode.text,1,4)+'%']) );
    Open;
  end;
end;

procedure TFMainForm.BT_SearchClick(Sender: TObject);
begin
  case PageControl1.ActivePage.TabIndex of
      0: GridSelect1;
      1: GridSelect2;
  end;

  SB_Help.Panels[1].Text := ' 조회 완료 ';
end;

procedure TFMainForm.BE_Date1ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    
    Try 
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
        BE_Date1.Text := Copy(MonthForm.DayCaption,1,4)+' - '+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;


{  Try
      Calendar2 := TCalendar2.Create(Self);
      Calendar2.ShowModal;
      BE_Date1.Text := Copy(Calendar2.Gsym,1,4)+' - '+Copy(Calendar2.Gsym,5,2);
  Finally
      Calendar2.Free;
  End;}

  case PageControl1.ActivePage.TabIndex of
      0: GridSelect1;
      1: GridSelect2;
  end;
end;

procedure TFMainForm.PageControl1Change(Sender: TObject);
begin
    case PageControl1.ActivePage.TabIndex of
        0: BE_Date1.EditLabel.Caption := '교대 근무월';
        1: BE_Date1.EditLabel.Caption := '휴가 사용월';
    end;
end;

procedure TFMainForm.Bt_MiDeptClick(Sender: TObject);
begin
     fcondept := Tfcondept.Create(Self);
     Try
        fcondept.E_orgnum.Text := E_orgnum.Text;
        fcondept.BE_Date1.Text := BE_Date1.Text;
        fcondept.GridSelect1;
        fcondept.ShowModal;
     Finally
        fcondept.Free;
     end;
  SB_Help.Panels[1].Text := ' ';  
end;

procedure TFMainForm.E_DeptCodeButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
     FDeptForm := TFDeptForm.Create(Self);
     Try
        FDeptForm.E_orgnum.Text := E_orgnum.Text;
        if E_DeptCode.Text <> '' then begin
           FDeptForm.E_DeptCode.Text := E_DeptCode.Text;
        end;
        FDeptForm.BT_SearchClick(sender);

        if FDeptForm.Qry_dept.RecordCount = 1 then
        begin
           E_DeptCode.Text :=  FDeptForm.E_DeptCode.Text;
           E_DeptName.Text :=  FDeptForm.E_DeptName.Text;
        end
        else
           FDeptForm.ShowModal;
        //Edeptcode.text    := Fdept2lib.GSdeptcode;
        //Pdeptname.Caption := ' '+Fdept2lib.GSdeptname;
        //Porgnum.Caption   := Fdept2lib.Eorgnum.Text;
     Finally
        FDeptForm.Free;
     end;
end;

procedure TFMainForm.E_DeptCodeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    E_DeptCode.Clear;
    E_deptname.Clear;
end;

function TFMainForm.GetHoliChk(sDay:String): String;
   var
   SqlText, sSep, sYYMM : String;
   i: integer;
   Holiday_List  :TStringList;
begin
   Result := '0';
   sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);

   Holiday_List := TStringList.Create;

   with OraQuery3 do
   begin
      SqlText := Format('select SUBSTR(HOLIDATE,5,2) MM,SUBSTR(HOLIDATE,7,2) DD '+
                        ' FROM   pkcholi                                 '+
                        ' WHERE SUBSTR(holidate,1,6) = ''%s'' AND HOLIKIND =''1''           ',
                       [sYYMM]);

      Sql.Text :=  SqlText;

      Open;
      if RecordCount > 0 then
      begin
         for i :=  1 to RecordCount do
         begin
            Holiday_List.Add(Trim(FieldByName('DD').AsString));
            next;
         end;
      end;
      close;
   end;

   for i := 0 to Holiday_List.Count -1 do
   begin
      if  Holiday_List.Strings[i] = sDay then
      begin
          Result := '1';
      end;
   end;
   Holiday_List.Free;
end;

procedure TFMainForm.BT_ExcelClick(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' EXCEL 추출중 ... ';
  case PageControl1.ActivePage.TabIndex of
      0: Create_Excel1;
      1: Create_Excel2;
  end;
  SB_Help.Panels[1].Text := ' ';
end;
               
procedure TFMainForm.Create_Excel1;
var XL, XArr: Variant;
    i,k: integer;
begin
   ExcelSelect1;

   if OraQuery3.RecordCount < 1 then
   begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
   end;

   XArr := VarArrayCreate([1, 14], VarVariant);
   try
      XL := CreateOLEObject('Excel.Application');
   except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
   end;
   screen.cursor := crHourGlass;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   XL.WorkSheets[1].Name := '교대근무 실적집계';  // 시트명 부여

   //컬럼명 지정_서브타이블 지정
   XL.Visible := false;
   XL.Range['A1:A2'].Merge;                //셀 병합
   XL.Range['B1:B2'].Merge;
   XL.Range['C1:C2'].Merge;
   XL.Range['D1:D2'].Merge;
   XL.Range['E1:G1'].Merge;
   XL.Range['H1:I1'].Merge;
   XL.Range['J1:M1'].Merge;
   XL.Range['N1:N2'].Merge;

   //TITLE NAME 설정
   XL.Range['A1'].value := '사번';
   XL.Range['B1'].value := '성명';
   XL.Range['C1'].value := 'BAND';
   XL.Range['D1'].value := '부서';
   XL.Range['E1'].value := '근무일';
   XL.Range['H1'].value := '기초급여';
   XL.Range['J1'].value := '수당산정내역';
   XL.Range['N1'].value := '야근식대';

   XL.Range['E2'].value := '야간근무일';    //교대 근무일
   XL.Range['F2'].value := '교휴미사용';    //발생교휴일
   XL.Range['G2'].value := '유급휴일근무';
   XL.Range['H2'].value := '총연봉';
   XL.Range['I2'].value := '통상임금';
   XL.Range['J2'].value := '야근수당';
   XL.Range['K2'].value := '교휴수당';
   XL.Range['L2'].value := '유휴수당';
   XL.Range['M2'].value := '합계';
   //XL.Range['A1'].font.Size := 16;
   //XArr[1] := '';
   //XArr[2] := '';
   {XL.Range['A3' , 'E3'].Value := XArr;
   k := 3;
   for i := 1 to 5 do
   begin
      XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
      XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
      XL.Range[CHR(64 + i) + '3'].font.Size := 10;
      XL.Range[CHR(64 + i) + '3'].font.Bold := True;
   end; }

   //검색된 자료를 excel에 export처리 시킨다.
   OraQuery3.First;

   for i := 3 to  OraQuery3.RecordCount + 2 do
   begin
      XL.Cells[i,1].Value  := ''''+OraQuery3.FieldbyName('사번').AsString;
      XL.Cells[i,2].Value  := OraQuery3.FieldbyName('성명').AsString;
      XL.Cells[i,3].Value  := OraQuery3.FieldbyName('직급').AsString;
      XL.Cells[i,4].Value  := OraQuery3.FieldbyName('부서').AsString;
      XL.Cells[i,5].Value  := OraQuery3.FieldbyName('야간근무일').AsString;
      XL.Cells[i,6].Value  := OraQuery3.FieldbyName('발생교휴일').AsString;
      XL.Cells[i,7].Value  := OraQuery3.FieldbyName('유급휴일근무일').AsString;
      XL.Cells[i,8].Value  := OraQuery3.FieldbyName('총연봉').AsString;
      XL.Cells[i,9].Value  := OraQuery3.FieldbyName('통상임금').AsString;
      XL.Cells[i,10].Value := OraQuery3.FieldbyName('야근수당').AsString;
      XL.Cells[i,11].Value := OraQuery3.FieldbyName('교휴수당').AsString;
      XL.Cells[i,12].Value := OraQuery3.FieldbyName('유휴수당').AsString;
      XL.Cells[i,13].Value := OraQuery3.FieldbyName('합계').AsString;
      XL.Cells[i,14].Value := OraQuery3.FieldbyName('야근식대').AsString;
      OraQuery3.Next;
      XL.Range['A1', 'N' + IntToStr(i)].font.Size := 9;
      XL.Range['A1', 'E' + IntToStr(i)].font.name := '굴림체';
      XL.Range['A1', 'N2'].HorizontalAlignment := 3;               //가운데 정렬
   end;

   //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A3', 'A3'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
end;

procedure TFMainForm.Create_Excel2;
var XL, XArr: Variant;
    i,k: integer;
begin
   ExcelSelect2;

   if OraQuery3.RecordCount < 1 then
   begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
   end;

   XArr := VarArrayCreate([1, 14], VarVariant);
   try
      XL := CreateOLEObject('Excel.Application');
   except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
   end;
   screen.cursor := crHourGlass;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   XL.WorkSheets[1].Name := '교휴 사용 실적 집계';  // 시트명 부여

   //컬럼명 지정_서브타이블 지정
   XL.Visible := false;
   XL.Range['A1:A2'].Merge;                //셀 병합
   XL.Range['B1:B2'].Merge;
   XL.Range['C1:C2'].Merge;
   XL.Range['D1:D2'].Merge;
   XL.Range['E1:E2'].Merge;
   XL.Range['F1:F2'].Merge;
   XL.Range['G1:H1'].Merge;
   XL.Range['I1:I2'].Merge;
   XL.Range['J1:J2'].Merge;

   //TITLE NAME 설정
   XL.Range['A1'].value := '사번';
   XL.Range['B1'].value := '성명';
   XL.Range['C1'].value := 'BAND';
   XL.Range['D1'].value := '부서명';
   XL.Range['E1'].value := '전월발생일수';
   XL.Range['F1'].value := '교휴사용일수';
   XL.Range['G1'].value := '수당산정 기초급여';
   XL.Range['G2'].value := '총연봉';
   XL.Range['H2'].value := '통상임금';
   XL.Range['I1'].value := '교휴수당환수액';
   XL.Range['J1'].value := '휴가사용일';

   //검색된 자료를 excel에 export처리 시킨다.
   OraQuery3.First;

   for i := 3 to  OraQuery3.RecordCount + 2 do
   begin
      XL.Cells[i,1].Value  := ''''+OraQuery3.FieldbyName('사번').AsString;
      XL.Cells[i,2].Value  := OraQuery3.FieldbyName('성명').AsString;
      XL.Cells[i,3].Value  := OraQuery3.FieldbyName('직급').AsString;
      XL.Cells[i,4].Value  := OraQuery3.FieldbyName('부서명').AsString;
      XL.Cells[i,5].Value  := OraQuery3.FieldbyName('전월발생일수').AsString;
      XL.Cells[i,6].Value  := OraQuery3.FieldbyName('교휴사용일수').AsString;
      XL.Cells[i,7].Value  := OraQuery3.FieldbyName('총연봉').AsString;
      XL.Cells[i,8].Value  := OraQuery3.FieldbyName('통상임금').AsString;
      XL.Cells[i,9].Value  := OraQuery3.FieldbyName('교휴수당환수액').AsString;
      XL.Cells[i,10].Value := OraQuery3.FieldbyName('휴가사용일').AsString;
      OraQuery3.Next;
      XL.Range['A1', 'J' + IntToStr(i)].font.Size := 9;
      XL.Range['A1', 'J' + IntToStr(i)].font.name := '굴림체';
      XL.Range['A1', 'J2'].HorizontalAlignment := 3;               //가운데 정렬
   end;

   //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A2', 'A2'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
end;



procedure TFMainForm.ExcelSelect1;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with OraQuery3 do
  begin
    Close;
    Sql.Clear;
    //2014.11.19 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)
    if sYYMM <=  '201412' then
    begin
      sSql :=
          'SELECT DEPTNAME 부서, EMPNO 사번 , PAYCL 직급, KORNAME 성명, KU_CNT  ,                           '+#13+
          '	   KU_CNT - YU_CNT                                                       야간근무일,          '+#13+
          '	   KU_HUGA             				   			 발생교휴일,          '+#13+
          '	   YU_CNT		         			   		 유급휴일근무일,      '+#13+
          '	   TOTPAY            				   			 총연봉,	      '+#13+
          '	   TONGPAY           				   			 통상임금,	      '+#13+
          '	   CEIL(TRUNC((14.5*(KU_CNT-YU_CNT)*TONGPAY),1))                         야근수당,	      '+#13+
          '	   (8*KU_HUGA*TONGPAY)   						 교휴수당,	      '+#13+
          '	   (22*YU_CNT*TONGPAY)   						 유휴수당,	      '+#13+
          '	   CEIL(TRUNC((14.5*(KU_CNT-YU_CNT)*TONGPAY),1))+(8*KU_HUGA*TONGPAY)+(22*YU_CNT*TONGPAY) 합계,'+#13+
          '	   (KU_CNT*3500) 		                                         야근식대             '+#13+
          '  FROM  											      '+#13+
          '     (SELECT A.DUYYMM, A.DEPTCODE,  A.DEPTNAME,  A.EMPNO, A.KORNAME, A.KU_CNT,  A.YU_CNT,	      '+#13+
          '            (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = A.PAYRA) PAYCL,   '+#13+
          '            (SELECT GREATEST(DECODE(SIGN(A.KU_CNT - KIJUN11),-1,0,KIJUN12),                      '+#13+
          '     	                  DECODE(SIGN(A.KU_CNT - KIJUN21),-1,0,KIJUN22))                      '+#13+
          '               FROM PKCEXBAS  WHERE DUYYMM = A.DUYYMM) KU_HUGA,			              '+#13+
          '     	  B.TOTPAY  ,B.TONGPAY			   			 		      '+#13+
          '       FROM (SELECT DUYYMM, DEPTCODE, MAX(DEPTNAME) DEPTNAME, 			              '+#13+
          '     	         EMPNO, KORNAME, PAYRA,  				 	              '+#13+
          '     	         SUM(DECODE(KEY1,''06'',1,0)) KU_CNT, 				              '+#13+
          '                    SUM(DECODE(KEY1,''06'',(SELECT 1  FROM PKCHOLI                               '+#13+
          '                                             WHERE HOLIDATE = A.DUYYMM || LPAD(A.CNT,2,''0'')    '+#13+
          '                                               AND HOLIKIND =''1'' ),0)) YU_CNT                  '+#13+
          '           FROM (SELECT A.DUYYMM, A.EMPNO, B.PAYRA, A.KORNAME, A.DEPTCODE, D.DEPTNAME, C.CNT,    '+#13+
          '                        DECODE(C.CNT,  1,A.DD1,  2,A.DD2,  3,A.DD3,  4,A.DD4,  5,A.DD5,          '+#13+
          '     	                            6,A.DD6,  7,A.DD7,  8,A.DD8,  9,A.DD9, 10,A.DD10,         '+#13+
          '            			   11,A.DD11,12,A.DD12,13,A.DD13,14,A.DD14,15,A.DD15,         '+#13+
          '           			   16,A.DD16,17,A.DD17,18,A.DD18,19,A.DD19,20,A.DD20,         '+#13+
          '     				   21,A.DD21,22,A.DD22,23,A.DD23,24,A.DD24,25,A.DD25,         '+#13+
          '     				   26,A.DD26,27,A.DD27,28,A.DD28,29,A.DD29,30,A.DD30,         '+#13+
          '     	                           31,A.DD31) KEY1                                            '+#13+
          '                   FROM PKHDUTY A, PKMEXLIST B, PYCDEPT D,                                       '+#13+
          '                        (SELECT ROWNUM CNT   FROM USER_TABLES  WHERE ROWNUM < 32) C	      '+#13+
          '                  WHERE A.DUYYMM = ''%s''                                                        '+#13+
          '     	         AND A.EMPNO = B.EMPNO			                                      '+#13+
          '     	         AND A.DUYYMM = B.DUYYMM		                                      '+#13+
          '     	         AND B.DEPTCODE = D.DEPTCODE		                                      '+#13+
          '     	         AND B.DEPTCODE LIKE ''%s'') A 		                                      '+#13+
          '           GROUP BY DUYYMM,EMPNO,KORNAME,DEPTCODE,PAYRA) A,                                      '+#13+
          '	  (SELECT EMPNO, TOTPAY,                       		                                      '+#13+
          '	          CEIL(TRUNC((TOTPAY/18/226),1)) TONGPAY1		                              '+#13+ //통상임금 변경 /23-> /18 kth  2009.03.13
          '	   FROM   PKHYPHIS	 		                                                      '+#13+
          '	   WHERE  YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS)                                       '+#13+
          '	  )B                                                                                          '+#13+
          'WHERE A.EMPNO = B.EMPNO )                                                                        ';
      SQL.Add( Format(sSql, [sYYMM, copy(e_deptcode.text,1,4)+'%']) );
    end else begin
      sSql :=
          'SELECT DEPTNAME 부서, EMPNO 사번 , PAYCL 직급, KORNAME 성명, KU_CNT  ,                           '+#13+
          '	   KU_CNT - YU_CNT                                                       야간근무일,          '+#13+
          '	   KU_HUGA             				   			 발생교휴일,          '+#13+
          '	   YU_CNT		         			   		 유급휴일근무일,      '+#13+
          '	   TOTPAY            				   			 총연봉,	      '+#13+
          '	   TONGPAY           				   			 통상임금,	      '+#13+
          '	   CEIL(TRUNC((14.5*(KU_CNT-YU_CNT)*TONGPAY),1))                         야근수당,	      '+#13+
          '	   (8*KU_HUGA*TONGPAY)   						 교휴수당,	      '+#13+
          '	   (22*YU_CNT*TONGPAY)   						 유휴수당,	      '+#13+
          '	   CEIL(TRUNC((14.5*(KU_CNT-YU_CNT)*TONGPAY),1))+(8*KU_HUGA*TONGPAY)+(22*YU_CNT*TONGPAY) 합계,'+#13+
          '	   (KU_CNT*3500) 		                                         야근식대             '+#13+
          '  FROM  											      '+#13+
          '     (SELECT A.DUYYMM, A.DEPTCODE,  A.DEPTNAME,  A.EMPNO, A.KORNAME, A.KU_CNT,  A.YU_CNT,	      '+#13+
          '            (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = A.PAYRA) PAYCL,   '+#13+
          '            (SELECT GREATEST(DECODE(SIGN(A.KU_CNT - KIJUN11),-1,0,KIJUN12),                      '+#13+
          '     	                  DECODE(SIGN(A.KU_CNT - KIJUN21),-1,0,KIJUN22))                      '+#13+
          '               FROM PKCEXBAS  WHERE DUYYMM = A.DUYYMM) KU_HUGA,			              '+#13+
          '     	  B.TOTPAY  ,B.TONGPAY			   			 		      '+#13+
          '       FROM (SELECT DUYYMM, DEPTCODE, MAX(DEPTNAME) DEPTNAME, 			              '+#13+
          '     	         EMPNO, KORNAME, PAYRA,  				 	              '+#13+
          '     	         SUM(DECODE(KEY1,''06'',1,0)) KU_CNT, 				              '+#13+
          '                    SUM(DECODE(KEY1,''06'',(SELECT 1  FROM PKCHOLI                               '+#13+
          '                                             WHERE HOLIDATE = A.DUYYMM || LPAD(A.CNT,2,''0'')    '+#13+
          '                                               AND HOLIKIND =''1'' ),0)) YU_CNT                  '+#13+
          '           FROM (SELECT A.DUYYMM, A.EMPNO, B.PAYRA, A.KORNAME, A.DEPTCODE, D.DEPTNAME, C.CNT,    '+#13+
          '                        DECODE(C.CNT,  1,A.DD1,  2,A.DD2,  3,A.DD3,  4,A.DD4,  5,A.DD5,          '+#13+
          '     	                            6,A.DD6,  7,A.DD7,  8,A.DD8,  9,A.DD9, 10,A.DD10,         '+#13+
          '            			   11,A.DD11,12,A.DD12,13,A.DD13,14,A.DD14,15,A.DD15,         '+#13+
          '           			   16,A.DD16,17,A.DD17,18,A.DD18,19,A.DD19,20,A.DD20,         '+#13+
          '     				   21,A.DD21,22,A.DD22,23,A.DD23,24,A.DD24,25,A.DD25,         '+#13+
          '     				   26,A.DD26,27,A.DD27,28,A.DD28,29,A.DD29,30,A.DD30,         '+#13+
          '     	                           31,A.DD31) KEY1                                            '+#13+
          '                   FROM PKHDUTY A, PKMEXLIST B, PYCDEPT D,                                       '+#13+
          '                        (SELECT ROWNUM CNT   FROM USER_TABLES  WHERE ROWNUM < 32) C	      '+#13+
          '                  WHERE A.DUYYMM = ''%s''                                                        '+#13+
          '     	         AND A.EMPNO = B.EMPNO			                                      '+#13+
          '     	         AND A.DUYYMM = B.DUYYMM		                                      '+#13+
          '     	         AND B.DEPTCODE = D.DEPTCODE		                                      '+#13+
          '     	         AND B.DEPTCODE LIKE ''%s'') A 		                                      '+#13+
          '           GROUP BY DUYYMM,EMPNO,KORNAME,DEPTCODE,PAYRA) A,                                      '+#13+
          '	  (SELECT EMPNO, TOTPAY,                       		                                      '+#13+
          '	          CEIL(TRUNC(((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3)/12/226),1)) TONGPAY1          '+#13+ //통상임금 변경 /18-> /12 kth  2014.11.18
          '	   FROM   PKHYPHIS	 		                                                      '+#13+
          '	   WHERE  YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS)                                       '+#13+
          '	  )B                                                                                          '+#13+
          'WHERE A.EMPNO = B.EMPNO )                                                                        ';
      SQL.Add( Format(sSql, [sYYMM, copy(e_deptcode.text,1,4)+'%']) );
    end;

    Open;
  end;
end;

procedure TFMainForm.ExcelSelect2;
var
  sSql,sYYMM : String;
begin
  sYYMM := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
  with OraQuery3 do
  begin
    Close;
    Sql.Clear;

    //2014.11.19 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)
    if sYYMM <=  '201412' then
    begin
      sSql := ' SELECT B.EMPNO    사번,                                                                                       '+
              '        B.KORNAME  성명,                                                                                       '+
              '       (SELECT CODENAME FROM PYCCODE WHERE A.PAYCL=CODENO AND CODEID=''I112'') 직급,                           '+
              ' 	    (SELECT DEPTNAME FROM PYCDEPT WHERE A.DEPTCODE=DEPTCODE AND A.ORGNUM=ORGNUM) 부서명,                    '+
              ' 	     KU_HUGA    전월발생일수,                                                                               '+
              '        B.USECOUNT 교휴사용일수,                                                                               '+
              ' 	     C.TOTPAY   총연봉,                                                                                     '+
              ' 	     C.TONGPAY  통상임금,                                                                                   '+
              '        DECODE(SIGN(C.TONGPAY * (B.USECOUNT-KU_HUGA)),-1,0, (C.TONGPAY * (B.USECOUNT-KU_HUGA))) 교휴수당환수액,'+
              '        DECODE(B.USEDAY2,'''',TO_CHAR(B.USEDAY1),TO_CHAR(B.USEDAY1)||'' , ''||TO_CHAR(B.USEDAY2)) 휴가사용일   '+
              '   FROM PIMPMAS A,                                                                                             '+
              '       (SELECT EMPNO, KORNAME, USEDAY1, USEDAY2, USECOUNT                                                      '+
              '          FROM PKMEXUSE                                                                                        '+
              '         WHERE DUYYMM = ''%s'' AND DUTYCODE =''04'') B,                                                        '+
              '       (SELECT EMPNO, TOTPAY, CEIL(TRUNC((TOTPAY/18/226),1)) TONGPAY                                           '+  //통상임금 변경 /23-> /18 kth  2009.03.13
              '          FROM PKHYPHIS                                                                                        '+
              '         WHERE YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS) ) C,                                              '+
              '       (SELECT EMPNO,GREATEST(DECODE(SIGN(MAX(Y.KU_CNT) - MAX(KIJUN11)),-1,0,MAX(KIJUN12)),                    '+
              '                              DECODE(SIGN(MAX(Y.KU_CNT) - MAX(KIJUN21)),-1,0,MAX(KIJUN22))) KU_HUGA            '+
              '          FROM PKCEXBAS X,                                                                                     '+
              '              (SELECT EMPNO,SUM(DECODE(DECODE(CNT, 1,A.DD1,  2,A.DD2,  3,A.DD3,  4,A.DD4,  5,A.DD5,            '+
              '                                                   6,A.DD6,  7,A.DD7,  8,A.DD8,  9,A.DD9, 10,A.DD10,           '+
              '                                                  11,A.DD11,12,A.DD12,13,A.DD13,14,A.DD14,15,A.DD15,           '+
              '                                                  16,A.DD16,17,A.DD17,18,A.DD18,19,A.DD19,20,A.DD20,           '+
              '                                                  21,A.DD21,22,A.DD22,23,A.DD23,24,A.DD24,25,A.DD25,           '+
              '                                                  26,A.DD26,27,A.DD27,28,A.DD28,29,A.DD29,30,A.DD30,           '+
              '                                                  31,A.DD31                                                    '+
              '                                       ),''06'',1,0 )                                                          '+
              '                               ) KU_CNT                                                                        '+
              '                FROM PKHDUTY A, (SELECT ROWNUM CNT FROM USER_TABLES  WHERE ROWNUM < 32)                        '+
              '               WHERE A.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')                  '+
              ' 		    GROUP BY EMPNO) Y                                                                               '+
              '         WHERE X.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')                        '+
              '         GROUP BY EMPNO) D                                                                                     '+
              '  WHERE A.EMPNO = B.EMPNO                                                                                      '+
              '    AND A.EMPNO = C.EMPNO                                                                                      '+
              '    AND A.EMPNO = D.EMPNO                                                                                      '+
              '    AND A.DEPTCODE LIKE ''%s''                                                                                 ';
      SQL.Add( Format(sSql, [sYYMM, sYYMM, sYYMM, copy(e_deptcode.text,1,4)+'%']) );
    end else begin
      sSql := ' SELECT B.EMPNO    사번,                                                                                       '+
              '        B.KORNAME  성명,                                                                                       '+
              '       (SELECT CODENAME FROM PYCCODE WHERE A.PAYCL=CODENO AND CODEID=''I112'') 직급,                           '+
              ' 	    (SELECT DEPTNAME FROM PYCDEPT WHERE A.DEPTCODE=DEPTCODE AND A.ORGNUM=ORGNUM) 부서명,                    '+
              ' 	     KU_HUGA    전월발생일수,                                                                               '+
              '        B.USECOUNT 교휴사용일수,                                                                               '+
              ' 	     C.TOTPAY   총연봉,                                                                                     '+
              ' 	     C.TONGPAY  통상임금,                                                                                   '+
              '        DECODE(SIGN(C.TONGPAY * (B.USECOUNT-KU_HUGA)),-1,0, (C.TONGPAY * (B.USECOUNT-KU_HUGA))) 교휴수당환수액,'+
              '        DECODE(B.USEDAY2,'''',TO_CHAR(B.USEDAY1),TO_CHAR(B.USEDAY1)||'' , ''||TO_CHAR(B.USEDAY2)) 휴가사용일   '+
              '   FROM PIMPMAS A,                                                                                             '+
              '       (SELECT EMPNO, KORNAME, USEDAY1, USEDAY2, USECOUNT                                                      '+
              '          FROM PKMEXUSE                                                                                        '+
              '         WHERE DUYYMM = ''%s'' AND DUTYCODE =''04'') B,                                                        '+
              '       (SELECT EMPNO, TOTPAY, CEIL(TRUNC(((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3)/12/226),1)) TONGPAY                                           '+  //통상임금 변경 /18-> /12 kth  2014.11.19
              '          FROM PKHYPHIS                                                                                        '+
              '         WHERE YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS) ) C,                                              '+
              '       (SELECT EMPNO,GREATEST(DECODE(SIGN(MAX(Y.KU_CNT) - MAX(KIJUN11)),-1,0,MAX(KIJUN12)),                    '+
              '                              DECODE(SIGN(MAX(Y.KU_CNT) - MAX(KIJUN21)),-1,0,MAX(KIJUN22))) KU_HUGA            '+
              '          FROM PKCEXBAS X,                                                                                     '+
              '              (SELECT EMPNO,SUM(DECODE(DECODE(CNT, 1,A.DD1,  2,A.DD2,  3,A.DD3,  4,A.DD4,  5,A.DD5,            '+
              '                                                   6,A.DD6,  7,A.DD7,  8,A.DD8,  9,A.DD9, 10,A.DD10,           '+
              '                                                  11,A.DD11,12,A.DD12,13,A.DD13,14,A.DD14,15,A.DD15,           '+
              '                                                  16,A.DD16,17,A.DD17,18,A.DD18,19,A.DD19,20,A.DD20,           '+
              '                                                  21,A.DD21,22,A.DD22,23,A.DD23,24,A.DD24,25,A.DD25,           '+
              '                                                  26,A.DD26,27,A.DD27,28,A.DD28,29,A.DD29,30,A.DD30,           '+
              '                                                  31,A.DD31                                                    '+
              '                                       ),''06'',1,0 )                                                          '+
              '                               ) KU_CNT                                                                        '+
              '                FROM PKHDUTY A, (SELECT ROWNUM CNT FROM USER_TABLES  WHERE ROWNUM < 32)                        '+
              '               WHERE A.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')                  '+
              ' 		    GROUP BY EMPNO) Y                                                                               '+
              '         WHERE X.DUYYMM = TO_CHAR(ADD_MONTHS(TO_DATE(''%s'',''YYYYMM''),-1),''YYYYMM'')                        '+
              '         GROUP BY EMPNO) D                                                                                     '+
              '  WHERE A.EMPNO = B.EMPNO                                                                                      '+
              '    AND A.EMPNO = C.EMPNO                                                                                      '+
              '    AND A.EMPNO = D.EMPNO                                                                                      '+
              '    AND A.DEPTCODE LIKE ''%s''                                                                                 ';
      SQL.Add( Format(sSql, [sYYMM, sYYMM, sYYMM, copy(e_deptcode.text,1,4)+'%']) );
    end;
    Open;
  end;
end;

end.


