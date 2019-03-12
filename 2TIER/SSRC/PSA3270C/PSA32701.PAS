{=============================== Program Header ================================
 PROGRAM-NAME   : PSA3220A(사내근로복지기금 대출 지급등록)
 SYSTEM-NAME    : 복리후생
 SUBSYSTEM-NAME : 사내근로복지기금 대출
 Programmer     : 사내근로복지기금 대출 신청
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.6.08     이희용   신규개발                    노사협력팀 요청
================================================================================}

unit Psa32701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, DBTables, quickrpt, qrprntr,
  MemDS, DBAccess, Ora, Comobj, Func, OnEditStdCtrl, OnFocusButton,
  OnEditNumCtl, OnEditBaseCtrl, OnLineLabel, OnScheme;

type
  TFpsa32701 = class(TForm)
    Phelpmsg: TPanel;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    OraQuery1: TOraQuery;
    SF_Main: TOnSchemeForm;
    Shape4: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    OnSectionLabel1: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel3: TOnSectionLabel;
    MEfrom: TOnMaskEdit;
    Pcount: TOnNumberEdit;
    Panel5: TPanel;
    BBexcel: TOnFocusButton;
    BBclose: TOnFocusButton;
    OnEdit6: TOnEdit;
    OnEdit1: TOnEdit;
    Shape2: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnEdit2: TOnEdit;
    OnNumberEdit1: TOnNumberEdit;
    RB2: TRadioButton;
    RB1: TRadioButton;
    Panel2: TPanel;
    RBprint: TRadioButton;
    RBscreen: TRadioButton;
    OnFocusButton2: TOnFocusButton;
    BBprnset: TOnFocusButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBprnsetClick(Sender: TObject);
    procedure MEfromChange(Sender: TObject);
    procedure RBscreenClick(Sender: TObject);
    procedure RBprintClick(Sender: TObject);
    procedure BBexcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Startup, CheckOfdate : Boolean;
    GSempno, GSkorname, GSpass, GSgrade, userid, word : String;
    GSsysdate, SDFM : String;
    SelectOfPrint : String;
    GSGroupId : String[4];     //GroupId
    procedure SetNow;
  end;

var
  Fpsa32701: TFpsa32701;
  AReport : TQuickRep;

implementation

uses Pass, kylib1, userhelp, FormMon1, Psa32702;     //Calen2,
{$R *.DFM}

// 날짜와 시간
procedure TFpsa32701.SetNow;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
       Sql.Add('   FROM DUAL                                     ');
       Open;
       GSsysdate := FieldByName('D').AsString;
  end;
end;

procedure TFpsa32701.FormActivate(Sender: TObject);
var  i : Integer;
begin
  if StartUp = True then     System.Exit
  else                       StartUp := True;

  Phelpmsg.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  with OraQuery1 do
  begin
       close;
       Sql.Clear;
       Sql.Text := 'select Groupid from pymenuuser  '+
                   ' where empno = '''+ Pempno +''' ';
       open;
       GSGroupID := Fields[0].AsString;
  end;
{
  if Copy(Pempno,1,1) ='D' then  //if   (GSGroupid = 'G001') then
  begin
    BBexcel.Visible := True;
  end
  else
  begin
    BBexcel.Visible := False;
  end;
}
  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SDFM             := '-'; //SystemDateFormatMask;
  SetNow;
  MEfrom.Text      := Copy(GSsysdate, 1, 6);
  SelectOfPrint    := 'A';
  AReport          := Fpsa32702.QuickReport1;
  Phelpmsg.Caption := '  대출상환 내역출력작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa32701.FormCreate(Sender: TObject);
begin
  StartUp := False;
end;

procedure TFpsa32701.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa32701.SpeedButton3Click(Sender: TObject);
begin
    Try
         MonthForm := TMonthForm.Create(Self);
         MonthForm.ShowModal;
         if MonthForm.DayCaption <> '' then
         MEfrom.Text := Copy(MonthForm.DayCaption,1,6);
    Finally
         MonthForm.Free;
    End;
end;

procedure TFpsa32701.BBrunClick(Sender: TObject);
begin
  if DateCheck(Copy(MEfrom.Text,1,4),Copy(MEfrom.Text,5,2),'01')= -1 then
  begin
    MessageBox(Handle,'기준년월 확인바랍니다', '일자오류', mb_iconwarning);
    SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
    Exit;
  end;

  if (MEfrom.Text = '') or (Length(MEfrom.Text) <> 6) then
  begin
    MessageBox(Handle,'   날짜설정이 서로 맞지않습니다','날짜입력오류', mb_iconwarning);
    Exit;
  end;

  with PrintDialog1 do
  begin
    MaxPage    := 0;
    Copies     := 0;
    FromPage   := 0;
    MinPage    := 0;
    ToPage     := 0;
    PrintRange := prAllPages;
  end;
  Phelpmsg.Caption := '  추출/출력작업중입니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

  if RBscreen.Checked then AReport.Preview;
  if RBprint.Checked  then
    if PrintDialog1.Execute then
    begin
      AReport.Print;
      Phelpmsg.Caption := '  추출/출력작업이 완료되었습니다.';
    end
    else
      Phelpmsg.Caption := '  추출/출력작업이 취소되었습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  QRPrinter.Cleanup;
end;

procedure TFpsa32701.BBprnsetClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFpsa32701.MEfromChange(Sender: TObject);
begin
//  PrintDialog1.MaxPage := 0;
end;

procedure TFpsa32701.RBscreenClick(Sender: TObject);
begin
  SelectOfPrint := 'A';
end;

procedure TFpsa32701.RBprintClick(Sender: TObject);
begin
  SelectOfPrint := 'B';
end;

procedure TFpsa32701.BBexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  Phelpmsg.Caption :=' 엑셀 변환할 자료를 검색중입니다.';

  with OraQuery1 do
  begin
       close;
       Sql.Clear;

       Sql.Text := 'SELECT C.REPLDATE 상환월, A.EMPNO 사번, B.KORNAME 성명, A.LOANDATE 대출일, A.REPFRDATE 상환개시, A.LOANAMT 대출금,  ' + #13
                 + '       TRUNC(A.LOANAMT / A.REPMAXMM) 분할액,  C.REPAMT 당월원금, C.REPINT 당월이자, C.REPAMT+C.REPINT 당월원리금,   ' + #13
                 + '       (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT  원금잔액,                        ' + #13
                 + '	   C.REPCNT 최종상환회수, A.REPMAXMM 분할회수                                                                   ' + #13
                 + '  FROM PSNLOAN A, PSCMAN B, PSNREPAY C                                                                              ' + #13
                 + ' WHERE C.REPLDATE = :P_DATE                                                                                         ' + #13
                 + '   AND A.EMPNO    = C.EMPNO                                                                                         ' + #13
                 + '   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                                                 ' + #13
                 + 'UNION                                                                                                               ' + #13
                 + 'SELECT C.REPLDATE 상환월, A.EMPNO 사번, B.KORNAME 성명, A.LOANDATE 대출일, A.REPFRDATE 상환개시, A.LOANAMT 대출금,  ' + #13
                 + '       TRUNC(A.LOANAMT / A.REPMAXMM) 분할액,  C.REPAMT 당월원금, C.REPINT 당월이자, C.REPAMT+C.REPINT 당월원리금,   ' + #13
                 + '       (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT  원금잔액,                        ' + #13
                 + '	   C.REPCNT 최종상환회수, A.REPMAXMM 분할회수                                                                   ' + #13
                 + '  FROM PSELOAN A, PSCMAN B, PSOREPAY C                                                                              ' + #13
                 + ' WHERE C.REPLDATE = :P_DATE                                                                                         ' + #13
                 + '   AND A.EMPNO    = C.EMPNO                                                                                         ' + #13
                 + '   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                                                 ' ;

       if Rb1.Checked then
            Sql.Text := Sql.Text + '  ORDER BY 사번 ASC, 대출일 ASC  '
       else if Rb2.Checked then
            Sql.Text := Sql.Text + '  ORDER BY 대출일 ASC, 사번 ASC  ' ;
       ParamByName('P_DATE').AsString :=  MEfrom.Text;
       open;
  end;
  if OraQuery1.RecordCount < 1 then
  begin
    Phelpmsg.Caption :='';
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;
  Phelpmsg.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, OraQuery1.Fields.Count], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Phelpmsg.Caption := '';
      Exit;
  end;

  Phelpmsg.Caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := MEfrom.Text;  //시트명 부여

  //TITLE NAME 설정
  //XL.Range['A1'].value := '';
  //XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to OraQuery1.Fields.Count do
  begin
       if OraQuery1.Fields[i-1].FullName = '사번' then Cap_empno := i;
       XArr[i]  := OraQuery1.Fields[i-1].FullName;
  end;

  XL.Range['A1' , CHR(64 + OraQuery1.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
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
            if  (j  = Cap_empno) then   //사원번호 칼럼에 ' 문자 넣어주기 위해.
                 XArr[j]  := ''''+OraQuery1.Fields[j-1].AsString
            else XArr[j]  := OraQuery1.Fields[j-1].AsString;
       end;
       XL.Range['A' + IntToStr(k+1), CHR(64 + OraQuery1.Fields.Count) + IntToStr(k+1)].Value := XArr;
       inc(k);
       OraQuery1.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.Size := 9;
  //XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A2', 'A2'].Select;                                 //A2열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  OraQuery1.GotoBookmark(SavePlace);
  OraQuery1.FreeBookmark(SavePlace);
  OraQuery1.EnableControls;
  Phelpmsg.Caption := '';
end;

end.
