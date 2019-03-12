{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 출자금 현황조회
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 이희용
  VERSION        : 1.00
  DATE           : 2011.05.09
  UPDATE CONTENTS
   1.00  11.05.09     이희용        신규프로그램개발           상세처리명세서

-------------------------------------------------------------------------------}
unit Psa31101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, DBTables, quickrpt, qrprntr,
  MemDS, DBAccess, Ora, Func, OnFocusButton, peoutlookbtn, ComObj, Grids,
  DBGrids, OnEditCombo, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPersonEdit, OnShapeLabel, OnScheme, OnTmaxPersonEdit;

type
  TFpsa31101 = class(TForm)
    Panel19: TPanel;
    Phelpmsg: TPanel;
    BBclose: TBitBtn;
    DBGrid: TDBGrid;
    DataSource1: TDataSource;
    OraQuery1: TOraQuery;
    OraQuery1EMPNO: TStringField;
    OraQuery1KORNAME: TStringField;
    OraQuery1PSTATE: TStringField;
    OraQuery1RETDATE: TStringField;
    OraQuery1BY_YSUMAMT: TFloatField;
    OraQuery1FloatField01: TFloatField;
    OraQuery1FloatField02: TFloatField;
    OraQuery1FloatField03: TFloatField;
    OraQuery1FloatField04: TFloatField;
    OraQuery1FloatField05: TFloatField;
    OraQuery1FloatField06: TFloatField;
    OraQuery1FloatField07: TFloatField;
    OraQuery1FloatField08: TFloatField;
    OraQuery1FloatField09: TFloatField;
    OraQuery1FloatField10: TFloatField;
    OraQuery1FloatField11: TFloatField;
    OraQuery1FloatField12: TFloatField;
    OraQuery1CY_SAUAMT: TFloatField;
    OraQuery1HAP_YSUMAMT: TFloatField;
    BB_search: TBitBtn;
    BBexcel: TBitBtn;
    OraQuery2: TOraQuery;
    ED_empno: TOnPersonPopupEdit;
    SF_Main: TOnSchemeForm;
    Lsysdate: TLabel;
    Lempno: TLabel;
    MEdefault: TOnComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BB_searchClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    StartUp, CloseFlag : Boolean;
    GSsysdate, SDFM : String;
    SelectOfGubun, EempnoGubun : String;
    IntrateOf, BaseAmt, IntrateAmt : Real;
    DayCount, PersonOf : Integer;
    Lastrepldate : String;
    procedure SetNow;
  end;

var
  Fpsa31101 : TFpsa31101;
  sqlstr    : widestring;

implementation

uses Pass, kylib1, UserHelp, Calen1;
{$R *.DFM}

procedure TFpsa31101.FormCreate(Sender: TObject);
begin
  StartUp := False;
end;

procedure TFpsa31101.FormActivate(Sender: TObject);
var  i : Integer;
     month, year : String;
begin
  if StartUp = True then     Exit;
  StartUp          := True;
  Phelpmsg.Caption := '  종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SDFM             := DateSeparator;
  SetNow;
  Application.ProcessMessages;
  MEdefault.Text := Copy(GSsysdate, 1, 4);

  Phelpmsg.Caption := '  출자금 현황조회를 시작하세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
//  BB_searchClick(BB_search);
  ED_empno.SetFocus;
end;

procedure TFpsa31101.SetNow;
begin
  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
    Sql.Add('   FROM DUAL                                    ');
    Open;
    GSsysdate := FieldByName('D').AsString;
  end;
end;

procedure TFpsa31101.BB_searchClick(Sender: TObject);
var XL, XArr : Variant;
    Sql      : String;
    i,k,j    : integer;
    SavePlace: TBookmark;
begin
  with OraQuery1 do
  begin
    close;
    Sql.Clear;  //2011.10.05 Coding by HeeYong
    Sql.Text := ' SELECT EMPNO, KORNAME, PSTATE, RETDATE, BY_YSUMAMT, HAP_YSUMAMT, ' + #13
              + ' "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", CY_SAUAMT ' + #13
              + ' FROM ( ' + #13
              + ' SELECT B.EMPNO, MAX(B.KORNAME) KORNAME,                                                                   ' + #13
              + '       MAX((SELECT CODENAME FROM PYCCODE WHERE CODEID=''I114'' AND CODENO = B.PSTATE)) PSTATE,             ' + #13
              + '       MAX(B.RETDATE) RETDATE,                                                                             ' + #13
              + '       MAX(C.YSUMAMT) BY_YSUMAMT,                                                                          ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''01'', SAUAMT )),0) "01",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''02'', SAUAMT )),0) "02",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''03'', SAUAMT )),0) "03",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''04'', SAUAMT )),0) "04",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''05'', SAUAMT )),0) "05",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''06'', SAUAMT )),0) "06",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''07'', SAUAMT )),0) "07",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''08'', SAUAMT )),0) "08",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''09'', SAUAMT )),0) "09",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''10'', SAUAMT )),0) "10",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''11'', SAUAMT )),0) "11",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''12'', SAUAMT )),0) "12",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE,1,4), SUBSTR(PAYDATE, 1,4), SAUAMT )),0) CY_SAUAMT,                   ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE,1,4), SUBSTR(PAYDATE, 1,4), SAUAMT )),0) + MAX(C.YSUMAMT) HAP_YSUMAMT ' + #13
              + ' FROM PIMPMAS B, PKHPHIS A,  PSSAUHIS C                                                                    ' + #13
              + ' WHERE (:P_DATE - 1) = C.SYEAR(+)                                                                          ' + #13
              + '   AND A.EMPNO = C.EMPNO(+)                                                                                ' + #13
              + '   AND SUBSTR(A.PAYDATE,1,4) = :P_DATE                                                                     ' + #13
              + '   AND A.EMPNO = B.EMPNO                                                                                   ' + #13
              + ' GROUP BY B.EMPNO                                                                                          ' + #13
              + ' UNION ALL                                                                                                 ' + #13
              + ' SELECT B.EMPNO, MAX(B.KORNAME) KORNAME,                                                                   ' + #13
              + '       MAX((SELECT CODENAME FROM PYCCODE WHERE CODEID=''I114'' AND CODENO = B.PSTATE)) PSTATE,             ' + #13
              + '       MAX(B.RETDATE) RETDATE,                                                                             ' + #13
              + '       MAX(C.YSUMAMT) BY_YSUMAMT,                                                                          ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''01'', SAUAMT )),0) "01",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''02'', SAUAMT )),0) "02",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''03'', SAUAMT )),0) "03",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''04'', SAUAMT )),0) "04",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''05'', SAUAMT )),0) "05",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''06'', SAUAMT )),0) "06",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''07'', SAUAMT )),0) "07",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''08'', SAUAMT )),0) "08",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''09'', SAUAMT )),0) "09",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''10'', SAUAMT )),0) "10",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''11'', SAUAMT )),0) "11",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE, 1, 6), SUBSTR(PAYDATE, 1,4)||''12'', SAUAMT )),0) "12",              ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE,1,4), SUBSTR(PAYDATE, 1,4), SAUAMT )),0) CY_SAUAMT,                   ' + #13
              + '       NVL(SUM(DECODE(SUBSTR(PAYDATE,1,4), SUBSTR(PAYDATE, 1,4), SAUAMT )),0) + MAX(C.YSUMAMT) HAP_YSUMAMT ' + #13
              + ' FROM PIMPMAS B, PKZHPHIS A,  PSSAUHIS C                                                                   ' + #13
              + ' WHERE (:P_DATE - 1) = C.SYEAR(+)                                                                          ' + #13
              + '   AND A.EMPNO = C.EMPNO(+)                                                                                ' + #13
              + '   AND SUBSTR(A.PAYDATE,1,4) = :P_DATE                                                                     ' + #13
              + '   AND A.EMPNO = B.EMPNO                                                                                   ' + #13
              + ' GROUP BY B.EMPNO                                                                                          ' + #13
              + ' UNION ALL                                                                                                 ' + #13
              + '  SELECT B.EMPNO, MAX(B.KORNAME) KORNAME,                                                                  ' + #13 //아래는
              + '        MAX((SELECT CODENAME FROM PYCCODE WHERE CODEID=''I114'' AND CODENO = B.PSTATE)) PSTATE,            ' + #13 //작년 퇴직자는 금년에 급여가 없기 때문에 출력이 안되므로
              + '        MAX(B.RETDATE) RETDATE, MAX(C.YSUMAMT) BY_YSUMAMT,                                                 ' + #13 //작년 누적액을 보여주기 위함 2012.02.29 HeeYong
              + '        0 "01", 0 "02", 0 "03", 0 "04",0 "05",0 "06",0 "07",0 "08",0 "09",0 "10",0 "11",0 "12",            ' + #13
              + '        0 CY_SAUAMT,  MAX(C.YSUMAMT) HAP_YSUMAMT                                                           ' + #13
              + '  FROM PIMPMAS B, PKHPHIS A,  PSSAUHIS C                                                                   ' + #13
              + '  WHERE (:P_DATE - 1) = C.SYEAR                                                                            ' + #13
              + '    AND A.EMPNO = C.EMPNO                                                                                  ' + #13
              + '    AND B.EMPNO = A.EMPNO                                                                                  ' + #13
              + '    AND NOT EXISTS(SELECT * FROM PKHPHIS                                                                   ' + #13
              + '                   WHERE EMPNO = C.EMPNO                                                                   ' + #13
              + '                   AND SUBSTR(PAYDATE,1,4) = :P_DATE)                                                      ' + #13
              + '    AND A.EMPNO NOT LIKE ''M%''                                                                            ' + #13
              + '  GROUP BY B.EMPNO                                                                                         ' + #13
              + '  UNION ALL                                                                                                ' + #13
              + '  SELECT B.EMPNO, MAX(B.KORNAME) KORNAME,                                                                  ' + #13
              + '        MAX((SELECT CODENAME FROM PYCCODE WHERE CODEID=''I114'' AND CODENO = B.PSTATE)) PSTATE,            ' + #13
              + '        MAX(B.RETDATE) RETDATE, MAX(C.YSUMAMT) BY_YSUMAMT,                                                 ' + #13
              + '        0 "01", 0 "02", 0 "03", 0 "04",0 "05",0 "06",0 "07",0 "08",0 "09",0 "10",0 "11",0 "12",            ' + #13
              + '        0 CY_SAUAMT,  MAX(C.YSUMAMT) HAP_YSUMAMT                                                           ' + #13
              + '  FROM PIMPMAS B, PKZHPHIS A,  PSSAUHIS C                                                                  ' + #13
              + '  WHERE (:P_DATE - 1) = C.SYEAR                                                                            ' + #13
              + '    AND A.EMPNO = C.EMPNO                                                                                  ' + #13
              + '    AND B.EMPNO = A.EMPNO                                                                                  ' + #13
              + '    AND NOT EXISTS(SELECT * FROM PKZHPHIS                                                                  ' + #13
              + '                   WHERE EMPNO = C.EMPNO                                                                   ' + #13
              + '                   AND SUBSTR(PAYDATE,1,4) = :P_DATE)                                                      ' + #13
              + '    AND A.EMPNO LIKE ''M%''                                                                                ' + #13
              + '  GROUP BY B.EMPNO ';
    If (ED_empno.Text <> '') Then
    Begin
      Sql.Text := Sql.Text + ' ) WHERE  EMPNO = ''' + Copy(ED_empno.Text,1,4) + ''' ' ;
    End Else
      Sql.Text := Sql.Text + ' ) ORDER BY EMPNO ';

    ParamByName('P_DATE').AsString :=  MEdefault.Text;
    open;
  end;

  screen.cursor := crHourGlass;

  if (Sender as TBitBtn).Tag = 0 then
  Begin
    if OraQuery1.RecordCount < 1 then
    begin
      Phelpmsg.Caption :='';
      showmessage('등록된 사우회 출자금자료가 없습니다.');
      exit;
    end;

    Phelpmsg.Caption := '  사우회 출자금자료를 조회중 입니다. 잠시만 기다려 주십시요.';
    SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);

    with DBGrid do
    begin
      Columns.Clear;

      for i := 0 to 18 do Columns.Add;

      Columns[0].FieldName      := 'EMPNO';
      Columns[0].Title.Caption  := '사번';
      Columns[0].Width          := 34;
      Columns[0].Alignment      := taCenter;
      Columns[0].Title.Alignment:= taCenter;

      Columns[1].FieldName      := 'KORNAME';
      Columns[1].Title.Caption  := '성명';
      Columns[1].Width          := 44;
      Columns[1].Alignment      := taCenter;
      Columns[1].Title.Alignment:= taCenter;

      Columns[2].FieldName      := 'PSTATE';
      Columns[2].Title.Caption  := '재직상태';
      Columns[2].Width          := 54;
      Columns[2].Alignment      := taCenter;
      Columns[2].Title.Alignment:= taCenter;

      Columns[3].FieldName      := 'RETDATE';
      Columns[3].Title.Caption  := '퇴직일';
      Columns[3].Width          := 50;
      Columns[3].Title.Alignment:= taCenter;
  //      Columns[3].Field.EditMask := '999-99-99999;0;_';

      Columns[4].FieldName      := 'BY_YSUMAMT';
      Columns[4].Title.Caption  := IntToStr(StrToInt(Copy(MEdefault.Text,3,2)) -1)+'년누적액';
      Columns[4].Width          := 70;
      Columns[4].Title.Alignment:= taCenter;

      Columns[5].FieldName      := 'HAP_YSUMAMT';
      Columns[5].Title.Caption  := IntToStr(StrToInt(Copy(MEdefault.Text,3,2)) -1)+'+'+
                                    Copy(MEdefault.Text,3,2)+'년누적액';
      Columns[5].Width          := 90;
      Columns[5].Title.Alignment:= taCenter;


      Columns[6].FieldName      := '01';
      Columns[6].Title.Caption  := Copy(MEdefault.Text,3,2)+'년1월';
      Columns[6].Width          := 50;
      Columns[6].Title.Alignment:= taCenter;

      Columns[7].FieldName      := '02';
      Columns[7].Title.Caption  := Copy(MEdefault.Text,3,2)+'년2월';
      Columns[7].Width          := 50;
      Columns[7].Title.Alignment:= taCenter;

      Columns[8].FieldName      := '03';
      Columns[8].Title.Caption  := Copy(MEdefault.Text,3,2)+'년3월';
      Columns[8].Width          := 50;
      Columns[8].Title.Alignment:= taCenter;

      Columns[9].FieldName      := '04';
      Columns[9].Title.Caption  := Copy(MEdefault.Text,3,2)+'년4월';
      Columns[9].Width          := 50;
      Columns[9].Title.Alignment:= taCenter;

      Columns[10].FieldName      := '05';
      Columns[10].Title.Caption  := Copy(MEdefault.Text,3,2)+'년5월';
      Columns[10].Width          := 50;
      Columns[10].Title.Alignment:= taCenter;

      Columns[11].FieldName      := '06';
      Columns[11].Title.Caption  := Copy(MEdefault.Text,3,2)+'년6월';
      Columns[11].Width          := 50;
      Columns[11].Title.Alignment:= taCenter;

      Columns[12].FieldName      := '07';
      Columns[12].Title.Caption  := Copy(MEdefault.Text,3,2)+'년7월';
      Columns[12].Width          := 50;
      Columns[12].Title.Alignment:= taCenter;

      Columns[13].FieldName      := '08';
      Columns[13].Title.Caption  := Copy(MEdefault.Text,3,2)+'년8월';
      Columns[13].Width          := 50;
      Columns[13].Title.Alignment:= taCenter;

      Columns[14].FieldName      := '09';
      Columns[14].Title.Caption  := Copy(MEdefault.Text,3,2)+'년9월';
      Columns[14].Width          := 50;
      Columns[14].Title.Alignment:= taCenter;

      Columns[15].FieldName      := '10';
      Columns[15].Title.Caption  := Copy(MEdefault.Text,3,2)+'년10월';
      Columns[15].Width          := 50;
      Columns[15].Title.Alignment:= taCenter;

      Columns[16].FieldName      := '11';
      Columns[16].Title.Caption  := Copy(MEdefault.Text,3,2)+'년11월';
      Columns[16].Width          := 50;
      Columns[16].Title.Alignment:= taCenter;

      Columns[17].FieldName      := '12';
      Columns[17].Title.Caption  := Copy(MEdefault.Text,3,2)+'년12월';
      Columns[17].Width          := 50;
      Columns[17].Title.Alignment:= taCenter;

      Columns[18].FieldName      := 'CY_SAUAMT';
      Columns[18].Title.Caption  := Copy(MEdefault.Text,3,2)+'년누적액';
      Columns[18].Width          := 65;
      Columns[18].Title.Alignment:= taCenter;


      TFloatField(Columns[4].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[5].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[6].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[7].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[8].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[9].Field).DisplayFormat  := '#,##0';
      TFloatField(Columns[10].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[11].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[12].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[13].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[14].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[15].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[16].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[17].Field).DisplayFormat := '#,##0';
      TFloatField(Columns[18].Field).DisplayFormat := '#,##0';
    end;
  End
  Else  (* Excel 저장 *)
  Begin

    if OraQuery1.RecordCount < 1 then
    begin
      Phelpmsg.Caption :='';
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
    end Else
    Begin
      Phelpmsg.Caption := '  엑셀변환중 입니다. 잠시만 기다려 주십시요.';
      SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
    End;

    XArr := VarArrayCreate([1, 19], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
    end;
    //새로운 페이지 생성
    XL.WorkBooks.Add;
    XL.Visible := false;
    //시트명 부여
    XL.WorkSheets[1].Name := '사우회 출자금 현황조회';

    //TITLE NAME 설정
    XL.Range['A1'].value := '사번';
    XL.Range['B1'].value := '성명';
    XL.Range['C1'].value := '재직상태';
    XL.Range['D1'].value := '퇴직일';
    XL.Range['E1'].value := IntToStr(StrToInt(Copy(MEdefault.Text,3,2)) -1)+'년누적액';
    XL.Range['F1'].value := IntToStr(StrToInt(Copy(MEdefault.Text,3,2)) -1)+'+'+Copy(MEdefault.Text,3,2)+'년누적액';
    XL.Range['G1'].value := Copy(MEdefault.Text,3,2)+'년1월';
    XL.Range['H1'].value := Copy(MEdefault.Text,3,2)+'년2월';
    XL.Range['I1'].value := Copy(MEdefault.Text,3,2)+'년3월';
    XL.Range['J1'].value := Copy(MEdefault.Text,3,2)+'년4월';
    XL.Range['K1'].value := Copy(MEdefault.Text,3,2)+'년5월';
    XL.Range['L1'].value := Copy(MEdefault.Text,3,2)+'년6월';
    XL.Range['M1'].value := Copy(MEdefault.Text,3,2)+'년7월';
    XL.Range['N1'].value := Copy(MEdefault.Text,3,2)+'년8월';
    XL.Range['O1'].value := Copy(MEdefault.Text,3,2)+'년9월';
    XL.Range['P1'].value := Copy(MEdefault.Text,3,2)+'년10월';
    XL.Range['Q1'].value := Copy(MEdefault.Text,3,2)+'년11월';
    XL.Range['R1'].value := Copy(MEdefault.Text,3,2)+'년12월';
    XL.Range['S1'].value := Copy(MEdefault.Text,3,2)+'년누적액';

    k := 1;
    for i := 1 to OraQuery1.Fields.Count do     //Gird 출력시
    begin
      XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
      XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
      XL.Range[CHR(64 + i) + '1'].font.Size := 9;
      XL.Range[CHR(64 + i) + '1'].font.Bold := True;
    end;

    //검색된 자료를 excel에 export처리 시킨다.
    SavePlace := OraQuery1.GetBookmark;
    OraQuery1.DisableControls;
    OraQuery1.First;

    while not OraQuery1.eof do
    begin
      for j := 1 to OraQuery1.Fields.Count do
      begin
        //사원번호 칼럼에 ' 문자 넣어주기 위해(18 >> 0018).
        if (j  = 1) then
           XArr[j]  := ''''+OraQuery1.Fields[j-1].AsString
        else XArr[j]  := OraQuery1.Fields[j-1].AsString;
      end;
      XL.Range['A' + IntToStr(k+1), CHR(64 + OraQuery1.Fields.Count) + IntToStr(k+1)].Value := XArr;
      inc(k);
      OraQuery1.Next;
    end;

    //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
    //테두리선을 만든다.  1은 실선
    XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;
    //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
    XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.Weight := 2;
    //테두리선 색상설정  1은 검은색
    XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;
    XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.name := '굴림체';
    //가운데 정렬
    XL.Range['A1', 'A1'].HorizontalAlignment := 3;
    XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.Size := 9;
    //좌측정렬
    //XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].HorizontalAlignment := 2;
    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
    XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Select;
    //자동정렬
    XL.Selection.Columns.AutoFit;
    //A2열에 커서 위치시킴
    XL.Range['A2', 'A2'].Select;
    //엑셀자료 보여줌
    XL.Visible := true;
    OraQuery1.GotoBookmark(SavePlace);
    OraQuery1.FreeBookmark(SavePlace);
    OraQuery1.EnableControls;
  End;

  Phelpmsg.Caption := ' RecordCount : ' + IntToStr(OraQuery1.RecordCount) + '건';
  Screen.Cursor := crDefault;
end;

procedure TFpsa31101.BBcloseClick(Sender: TObject);
begin
  CloseFlag := False;
  Close;
end;

procedure TFpsa31101.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     BB_searchClick(BB_search);
  end;
end;

end.

