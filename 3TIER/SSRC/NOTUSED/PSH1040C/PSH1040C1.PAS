unit PSH1040C1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit, OnLineLabel, OnTmaxCodeEdit,
  OnEditCombo, OnRadioBtn, OnEditMdate, Mask, OnSkinBtn, TmaxFunc, comobj,
  OnDBEditCtrl, Buttons, FormMon1, Func;

type
  TFM_Mainform = class(TForm)
    TDS_Com: TTMaxDataSet;
    TmaxSession: TTMaxSession;
    SF_Main: TOnSchemeForm;
    OnSectionLabel3: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel4: TOnSectionLabel;
    Shape3: TShape;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PE_empno: TTMaxPersonPopupEdit;
    ME_date1: TOnMaskEdit;
    ME_date2: TOnMaskEdit;
    RG2: TRadioGroup;
    RG1: TRadioGroup;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    BT_Print: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    SB_Help: TStatusBar;
    TDS_Com1: TTMaxDataSet;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_PrintClick(Sender: TObject);
    procedure Retrive1;
    procedure Retrive2;
    procedure Retrive3;
    procedure OnFocusButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME_date1Exit(Sender: TObject);
  private
    { Private declarations }
    FL_conyn  : String;
    procedure PL_Com_Contructor;

  public
    { Public declarations }
    FG_Empno, FG_korname, FG_grade, FG_Date, FG_Sql : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_Sysdate : String;
    gs_TOTamt, gs_conamt : Double;
    vAdmin  : Boolean;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PSH1040C2, PSH1040C3;


{$R *.DFM}

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//  TMaxSession.EnvFileName := 'd:\source\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  // 이부분서부터 업무관련 초기화 부분 코딩 처리...(로그인 사용자)
  FG_empno   := Hinsa_Param(CmdLine,1);
  FG_korname := Hinsa_Param(CmdLine,2);
  FG_grade   := Hinsa_Param(CmdLine,4);
  vAdmin := False;
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
 var frdate, todate, FL_sql : String;
begin
  if FG_empno <> '' then
  begin
    PE_empno.OnReadEnded := nil;
    PE_empno.Text := FG_empno;
    PE_empno.PL_get_singledata;
  end;

(* 권한에서 그룹으로 변경. 2015.10.14  HeeYong
  //복리후생 담당, 관리자는 변경가능
*)
  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Clear;

    FL_sql := ' Select Groupid, ''F2'', ''F3'', ''F4'', ''F5'' '+#13+
              ' from pymenuuser  '                              +#13+
              ' where empno = '''+ Hinsa_Param(cmdline,1) +''' ';
    Sql.Add(FL_sql);
    Open;

    if (Fields[0].AsString = 'G001') or (Fields[0].AsString = 'G042') then vAdmin := True;
    Close;
  end;

  if vAdmin = True then PE_Empno.Enabled := True
  else                  PE_Empno.Enabled := False;

  with TDS_Com do
  begin
    PL_Com_Contructor;
    Close;
    Sql.Clear;

    FL_sql := 'SELECT to_char(sysdate,''YYYYMM''), '+#13+
              '       ''field2'', ''field3'',      '+#13+
              '       ''field4'', ''field5''       '+#13+
              '  FROM dual                         ';
    Sql.Add(FL_sql);
    Open;

    First;
    ME_date1.Text := FieldByName('field1').AsString;
    ME_date2.Text := FieldByName('field1').AsString;

    Close;
  end;

  SB_Help.Panels[1].Text :=' ';
end;

procedure TFM_Mainform.PE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      PE_empno.PL_get_singledata;
      Key := #0;
    end;
end;

procedure TFM_Mainform.BT_PrintClick(Sender: TObject);
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
      MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
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
      MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
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

procedure TFM_Mainform.Retrive1;
 var i : Integer;
     d1, d2  : String;
begin
  gs_TOTamt := 0;
  gs_conamt := 0;
  d1 := ME_date1.Text;
  d2 := ME_date2.Text;

  with TDS_Com do
  begin
    Close;
    PL_Com_Contructor;  //기간내 전체신청총액
    Sql.Text := ' SELECT nvl(SUM(NVL(CASHAMT,0) + NVL(CARDAMT,0)),0) , '+
                '       ''field2'', ''field3'', ''field4'', ''field5'' '+
                ' FROM PSHAPHOS                                        '+
                ' WHERE APPDATE Between '''+d1+ ''' and '''+d2+ '''    ';

    if (PE_empno.Text <> '') Then
    Begin
      Sql.Text := Sql.Text + ' AND EMPNO = ''' + Copy(PE_empno.Text,1,4) +''' ';
    End;

    Open;
    gs_totamt :=  FieldByName('field1').AsFloat;

    Close;
    PL_Com_Contructor;  //기간내 전체승인총액
    Sql.Text := ' SELECT nvl(SUM(NVL(CASHAMT,0)+NVL(CARDAMT,0))-SUM(NVL(EXCEPTAMT,0)),0), '+
                '       ''field2'', ''field3'', ''field4'', ''field5''                    '+
                '  FROM PSHAPHOS                                                          '+
                ' WHERE CONYN = ''Y''                                '+
                '   AND APPDATE Between '''+d1+ ''' and '''+d2+ '''  ';

    if (PE_empno.Text <> '') Then
    Begin
      Sql.Text := Sql.Text + ' AND EMPNO = ''' + Copy(PE_empno.Text,1,4) +''' ';
    End;

    Open;
    gs_conamt :=  FieldByName('field1').AsFloat;
  end;

  //////////////////////////////////////////////////////////////////////////////

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select20';
    ClearFieldInfo;

    AddField('KORNAME'  , ftString, 100);
    AddField('APPDATE'  , ftString, 100);
    AddField('EMPNO'    , ftString, 100);
    AddField('FAMINAME' , ftString, 100);
    AddField('MEDCOMM'  , ftString, 100);
    AddField('CORPNAME' , ftString, 100);
    AddField('CONYNSAYU', ftString, 100);
    AddField('MEDIDATE' , ftString, 100);
    AddField('CONYN'    , ftString, 100);
    AddField('TOTAMT'   , ftString, 100);
    AddField('EXCEPTAMT', ftString, 100);
    AddField('APPAMT'   , ftString, 100);
    AddField('TSysdate' , ftString, 100);
    AddField('F14'      , ftString, 100);
    AddField('F15'      , ftString, 100);
    AddField('F16'      , ftString, 100);
    AddField('F17'      , ftString, 100);
    AddField('F18'      , ftString, 100);
    AddField('F19'      , ftString, 100);
    AddField('F20'      , ftString, 100);

    Close;
    Sql.Clear;
    Sql.Text := ' SELECT KORNAME  ,                                  '+
                '       substr(APPDATE,1,4)||''-''||substr(APPDATE,5,2) APPDATE, '+
                '       EMPNO    ,                                  '+
                '       FAMINAME ,                                  '+
                '       MEDCOMM  ,                                  '+
                '       CORPNAME ,                                  '+
                '       CONYNSAYU,                                  '+
                '       Substr(MEDIDATE,1,4)||''-''||Substr(MEDIDATE,5,2)||''-''||Substr(MEDIDATE,7,2) MEDIDATE,'+
                '       decode(CONYN,''Y'',''승인'',''N'',''미승인'',''X'',''미지원'','''',''미결재'') CONYN,   '+
                '       NVL(CASHAMT,0) + NVL(CARDAMT,0) TOTAMT   ,  '+
                '       NVL(EXCEPTAMT,0)       EXCEPTAMT,  '+
                '       NVL(APPAMT,0)          APPAMT   ,  '+
                '       To_Char(Sysdate,''YYYYMMDD'')   TSysdate ,  '+
                '                  ''F14'' , ''F15'', ''F16'',    '+
                '        ''F17'', ''F18'', ''F19'', ''F20''    '+
                '  FROM PSHAPHOS                                    '+
                ' WHERE NVL(CONYN,''N'') Like ''' + FL_conyn + '''  '+
                '   AND APPDATE Between '''+d1+ ''' and '''+d2+ ''' ';

    if (PE_empno.Text <> '') Then
    Begin
      Sql.Text := Sql.Text + ' AND EMPNO = ''' + Copy(PE_empno.Text,1,4) +''' ';
    End;
    Sql.Text := Sql.Text + ' Order by 3, 4, 2 ';

    Open;
  end;
end;

procedure TFM_Mainform.Retrive2;
 var i : Integer;
     d1, d2 : String;
begin
  d1 := ME_date1.Text;
  d2 := ME_date2.Text;

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select20';
    ClearFieldInfo;

    AddField('KORNAME'  , ftString, 100);
    AddField('PLAYDATE' , ftString, 100);
    AddField('EMPNO'    , ftString, 100);
    AddField('APPDATE'  , ftString, 100);
    AddField('PLAYITEM' , ftString, 100);
    AddField('CORPNAME' , ftString, 100);
    AddField('PLAYAMT'  , ftString, 100);
    AddField('EXCEPTAMT', ftString, 100);
    AddField('SETAMT'   , ftString, 100);
    AddField('PREAMT'   , ftString, 100);
    AddField('CONYN'    , ftString, 100);
    AddField('STARTYYMM', ftString, 100);
    AddField('ENDYYMM'  , ftString, 100);
    AddField('DIVISION' , ftString, 100);
    AddField('DIVISION2', ftString, 100);
    AddField('CONYNSAYU', ftString, 100);
    AddField('TSysdate' , ftString, 100);
    AddField('F18'      , ftString, 100);
    AddField('F19'      , ftString, 100);
    AddField('F20'      , ftString, 100);

    Close;
    Sql.Clear;
    Sql.Text := ' SELECT KORNAME,                                                 '+
                '       (substr(PLAYDATE,1,4)||''-''||substr(PLAYDATE,5,2)||''-''||substr(PLAYDATE,7,2)) PLAYDATE,'+
                '       EMPNO     ,                                               '+
                '       substr(APPDATE,1,4)||''-''||substr(APPDATE,5,2) APPDATE,  '+
                '       PLAYITEM  ,                                               '+
                '       CORPNAME  ,                                               '+
                '       NVL(PLAYAMT, 0)   ,                                               '+
                '       NVL(EXCEPTAMT, 0) ,                                               '+
                '       NVL(SETAMT, 0)    ,                                               '+
                '       NVL(PREAMT, 0)    ,                                               '+
                '       decode(CONYN,''Y'',''승인'',''N'',''미승인'',''X'',''미지원'','''',''미결재'') CONYN,   '+
                '       substr(STARTYYMM,1,4)||''-''||substr(STARTYYMM,5,2)    STARTYYMM, '+
                '       substr(ENDYYMM  ,1,4)||''-''||substr(ENDYYMM  ,5,2)    ENDYYMM,   '+
                '       DIVISION  ,                                                       '+
                '       DIVISION2 ,                                                       '+
                '       CONYNSAYU ,                                                       '+
                '       To_Char(Sysdate,''YYYYMMDD'') TSysdate,                           '+
                '       ''F18'', ''F19'', ''F20''                                         '+
                '  FROM PSHAPLAY                                                          '+
                ' WHERE NVL(CONYN,''N'') Like ''' + FL_conyn + '''  '+
                '   AND APPDATE Between '''+d1+ ''' and '''+d2+ ''' ';

    if (PE_empno.Text <> '') Then
    Begin
      Sql.Text := Sql.Text + ' AND EMPNO = ''' + Copy(PE_empno.Text,1,4) +''' ';
    End;

    Sql.Text := Sql.Text + ' Order by 3, 2   ';
    Open;
  end;
end;

procedure TFM_Mainform.Retrive3;
 var d1, d2 : String;
begin
  d1 := ME_date1.Text;
  d2 := ME_date2.Text;

 with TDS_Com1 do
  begin
    ServiceName := 'HINSA_select20';
    ClearFieldInfo;

    AddField('APPDATE',ftString, 100); //0  신청년월
    AddField('PART'   ,ftString, 100); //1  당월신청 구분 : a:의료,b:체육,c:선택
    AddField('EMPNO'  ,ftString, 100); //2  사번
    AddField('APPAMT' ,ftFloat , 100); //3  신청금액
    AddField('APPSUM' ,ftFloat , 100); //4  신청금액 누적분
    AddField('EXTAMT' ,ftFloat , 100); //5  제외금액
    AddField('EXTSUM' ,ftFloat , 100); //6  제외금액 누적분
    AddField('CONAMT' ,ftFloat , 100); //7  승인금액
    AddField('CONSUM' ,ftFloat , 100); //8  승인누계
    AddField('SETAMT' ,ftFloat , 100); //9  조정금액
    AddField('SETSUM' ,ftFloat , 100); //10 조정누계
    AddField('PREAMT' ,ftFloat , 100); //11 이월금액
    AddField('PRESUM' ,ftFloat , 100); //12 이월누계
    AddField('SUPAMT' ,ftFloat , 100); //13 지원금액
    AddField('SUPSUM' ,ftFloat , 100); //14 지원금액 누적분
    AddField('F16'    ,ftString, 100);
    AddField('F17'    ,ftString, 100);
    AddField('F18'    ,ftString, 100);
    AddField('F19'    ,ftString, 100);
    AddField('F20'    ,ftString, 100);

    Close;
    SQL.Clear;
    Sql.Add('SELECT APPDATE, DECODE(PART, ''A'', ''일반질병'', ''중증질병'') PART, ');
    Sql.Add('       EMPNO,   APPAMT, APPSUM, EXTAMT, EXTSUM,        ');
    Sql.Add('       CONAMT,  CONSUM, SETAMT, SETSUM,                ');
    Sql.Add('       NVL((SELECT ((FINDSPEC(SUBSTR(APPDATE,1,4), EMPNO)) - SUPSUM) FROM PSHAPSUM');
    Sql.Add('        WHERE APPDATE = A.APPDATE                      ');
    Sql.Add('          AND PART    = A.PART                         ');
    Sql.Add('          AND EMPNO   = A.EMPNO                        ');
    Sql.Add('          AND APPDATE > ''2015''), 0) PREAMT,          ');
    Sql.Add('       PRESUM, SUPAMT, SUPSUM, ''F16'',                ');
    Sql.Add('       ''F17'',''F18'', ''F19'', ''F20''               ');
    Sql.Add('  FROM PSHAPSUM A                                      ');
    Sql.Add('  WHERE APPDATE Between '''+d1+ ''' and '''+d2+ '''     ');
    Sql.Add('   AND PART   IN (''A'', ''D'')                        ');
    Sql.Add('   AND EMPNO    = '''+ Copy(PE_empno.Text,1,4) +'''    ');
    Sql.Add(' ORDER BY APPDATE DESC                                 ');

    Open;
  End;
end;

procedure TFM_Mainform.OnFocusButton1Click(Sender: TObject);
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
      MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
      Exit;
    end
    Else
    Begin
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
      XL.WorkSheets[1].Name := '의료비 상세내역'; //시트명 부여
      XL.Range['A1:K2'].Merge;                    //셀 병합

      //TITLE NAME 설정
      XL.Range['A1'].value := '의료비 상세내역';
      XL.Range['A1'].font.Size := 16;

      //컬럼명 지정_서브타이블 지정
      XArr[1] := '사원성명';
      XArr[2] := '진료일자';
      XArr[3] := '신청년월';
      XArr[4] := '가족성명';
      XArr[5] := '진료내역';
      XArr[6] := '의료기관';
      XArr[7] := '지 출 액';
      XArr[8] := '제외금액';
      XArr[9] := '공제비대상액';
      XArr[10]:= '승인여부';
      XArr[11]:= '비승인사유(비고)';
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
        XArr[1] := TDS_Com.FieldbyName('KORNAME').AsString;
        XArr[2] := TDS_Com.FieldbyName('MEDIDATE').AsString;
        XArr[3] := TDS_Com.FieldbyName('APPDATE').AsString;
        XArr[4] := TDS_Com.FieldbyName('FAMINAME').AsString;
        XArr[5] := TDS_Com.FieldbyName('MEDCOMM').AsString;
        XArr[6] := TDS_Com.FieldbyName('CORPNAME').AsString;
        XArr[7] := FormatFloat('#,##0', TDS_Com.FieldbyName('TOTAMT').AsFloat);
        XArr[8] := FormatFloat('#,##0', TDS_Com.FieldbyName('EXCEPTAMT').AsFloat);
        XArr[9] := FormatFloat('#,##0', TDS_Com.FieldbyName('APPAMT').AsFloat);
        XArr[10]:= TDS_Com.FieldbyName('CONYN').AsString;
        XArr[11]:= TDS_Com.FieldbyName('CONYNSAYU').AsString;
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
    End;

    Retrive3;
    if TDS_Com1.RecordCount = 0 then
    begin
      MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
      Exit;
    end
    Else
    Begin
      screen.cursor := crHourGlass;

      XArr := VarArrayCreate([1, 9], VarVariant); //Gird 출력시
      XL.Sheets[2].Select;

      XL.Visible := False;
      XL.WorkSheets[2].Name := '의료비 집계'; //시트명 부여
      XL.Range['A1:I2'].Merge;                //셀 병합

      //TITLE NAME 설정
      XL.Range['A1'].value := '의료비 월별 집계';
      XL.Range['A1'].font.Size := 16;
            //컬럼명 지정_서브타이블 지정
      XArr[1] := '신청년월';
      XArr[2] := '당월신청';
      XArr[3] := '당월제외';
      XArr[4] := '당월승인' ;
      XArr[5] := '신청누계';
      XArr[6] := '제외누계';
      XArr[7] := '승인누계';
      XArr[8] := '지원누계';
      XArr[9] := '구분';
      XL.Range['A3' , 'I3'].Value := XArr;
      k := 3;
      for i := 1 to 9 do     //Gird 출력시
      begin
        XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
        XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
        XL.Range[CHR(64 + i) + '1'].font.Size := 9;
        XL.Range[CHR(64 + i) + '1'].font.Bold := True;
      end;

      TDS_Com1.First;
      for i := 1 to TDS_Com1.RecordCount do
      begin
        XArr[1] := Copy(TDS_Com1.FieldbyName('APPDATE').AsString, 1,4) +'-'+
                   Copy(TDS_Com1.FieldbyName('APPDATE').AsString, 5,2);
        XArr[2] := FormatFloat('#,##0', TDS_Com1.FieldbyName('APPAMT').AsFloat);
        XArr[3] := FormatFloat('#,##0', TDS_Com1.FieldbyName('EXTAMT').AsFloat);
        XArr[4] := FormatFloat('#,##0', TDS_Com1.FieldbyName('CONAMT').AsFloat);
        XArr[5] := FormatFloat('#,##0', TDS_Com1.FieldbyName('APPSUM').AsFloat);
        XArr[6] := FormatFloat('#,##0', TDS_Com1.FieldbyName('EXTSUM').AsFloat);
        XArr[7] := FormatFloat('#,##0', TDS_Com1.FieldbyName('CONSUM').AsFloat);
        XArr[8] := FormatFloat('#,##0', TDS_Com1.FieldbyName('SUPSUM').AsFloat);
        XArr[9] := TDS_Com1.FieldbyName('PART').AsString;
        XL.Range['A' + IntToStr(k+1), 'I' + IntToStr(k+1)].Value := XArr;
        inc(k);
        TDS_Com1.Next;
      end;

      XL.Range['D3', 'I' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬

      //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
      XL.Range['A1', 'I' + IntToStr(k)].Borders.LineStyle := 1;
      XL.Range['A1', 'I' + IntToStr(k)].Borders.Weight := 2;
      XL.Range['A1', 'I' + IntToStr(k)].Borders.ColorIndex := 1;
      XL.Range['A1', 'I' + IntToStr(k)].font.name := '굴림체';
      XL.Range['A1', 'A1'].HorizontalAlignment := 3;
      XL.Range['A2', 'I' + IntToStr(k)].font.Size := 9;
      XL.Range['A2', 'I' + IntToStr(k)].HorizontalAlignment := 1;
      XL.Range['A1', 'I' + IntToStr(k)].Select;
      XL.Selection.Columns.AutoFit;
      XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
      XL.Visible := true;                                          //엑셀자료 보여줌
      Screen.Cursor := crDefault;
    End;
  end
  else if RG1.ItemIndex = 1 then
  begin
       Retrive2;
       if TDS_Com.RecordCount = 0 then
       begin
         MessageDlg('조회조건에 맞는 데이터가 존재하지 않습니다.',mtInformation, [mbOk], 0);
         Exit;
       end;

       XArr := VarArrayCreate([1, 12], VarVariant);
       try
            XL := CreateOLEObject('Excel.Application');
       except
            MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
            Exit;
       end;
       screen.cursor := crHourGlass;

       XL.WorkBooks.Add;                           //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := '체육활동 상세내역'; //시트명 부여
       XL.Range['A1:L2'].Merge;                    //셀 병합

       //TITLE NAME 설정
       XL.Range['A1'].value := '체육활동 상세내역';
       XL.Range['A1'].font.Size := 16;

       //컬럼명 지정_서브타이블 지정
       XArr[1] := '사원성명';
       XArr[2] := '지급일자';
       XArr[3] := '신청년월';
       XArr[4] := '운동종목';
       XArr[5] := '체육기관';
       XArr[6] := '지 출 액';
       XArr[7] := '제외금액';
       XArr[8] := '조정금액';
       XArr[9] := '전월이월액';
       XArr[10]:= '시작년월';
       XArr[11]:= '종료년월';
       XArr[12]:= '승인여부';
       XL.Range['A3' , 'L3'].Value := XArr;
       k := 3;
       for i := 1 to 12 do
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
         XArr[1] := TDS_Com.FieldbyName('KORNAME').AsString;
         XArr[2] := TDS_Com.FieldbyName('PLAYDATE').AsString;
         XArr[3] := TDS_Com.FieldbyName('APPDATE').AsString;
         XArr[4] := TDS_Com.FieldbyName('PLAYITEM').AsString;
         XArr[5] := TDS_Com.FieldbyName('CORPNAME').AsString;
         XArr[6] := TDS_Com.FieldbyName('PLAYAMT').AsFloat;
         XArr[7] := TDS_Com.FieldbyName('EXCEPTAMT').AsFloat;
         XArr[8] := TDS_Com.FieldbyName('SETAMT').AsFloat;
         XArr[9] := TDS_Com.FieldbyName('PREAMT').AsFloat;
         XArr[10]:= TDS_Com.FieldbyName('STARTYYMM').AsString;
         XArr[11]:= TDS_Com.FieldbyName('ENDYYMM').AsString;
         XArr[12]:= TDS_Com.FieldbyName('CONYN').AsString;
         XL.Range['A' + IntToStr(k+1), 'L' + IntToStr(k+1)].Value := XArr;
         inc(k);
         TDS_Com.Next;
       end;

       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', 'L' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'L' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', 'L' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', 'L' + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A3', 'L' + IntToStr(k)].font.Size := 9;
       XL.Range['B3', 'C' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
       XL.Range['D3', 'L' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', 'L' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                //자동정렬
       XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
       XL.Visible := true;                                          //엑셀자료 보여줌
       Screen.Cursor := crDefault;       
  end
end;

procedure TFM_Mainform.PL_Com_Contructor;
begin
  with TDS_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1' ,ftString, 100);
      AddField('field2' ,ftString, 100);
      AddField('field3' ,ftString, 100);
      AddField('field4' ,ftString, 100);
      AddField('field5' ,ftString, 100);
      Sql.Clear;
    end;
end;

/////////////////////////////////////////////////////////////////////////////////

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Mainform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TDS_Com.Close;
  Action := CaFree;
end;

procedure TFM_Mainform.SpeedButton1Click(Sender: TObject);
begin
  Try
    MonthForm := TMonthForm.Create(Self);
    MonthForm.ShowModal;
    ME_date1.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
    MonthForm.Free;
  End;
end;

procedure TFM_Mainform.SpeedButton2Click(Sender: TObject);
begin
  Try
    MonthForm := TMonthForm.Create(Self);
    MonthForm.ShowModal;
    ME_date2.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
    MonthForm.Free;
  End;
end;

procedure TFM_Mainform.ME_date1Exit(Sender: TObject);
begin
  If ((DateCheck(TOnMaskEdit(Sender).Text+'01') = False) and (TOnMaskEdit(Sender).Text <> '' )) then
  begin
    MessageBox(handle,'날짜를 정확히 입력하세요.','입력오류',MB_ICONEXCLAMATION);
    TOnMaskEdit(Sender).SetFocus;
    System.exit;
  end;
end;

end.

