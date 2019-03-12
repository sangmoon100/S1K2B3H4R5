{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출 상환내역출력
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Psa30701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, DBTables, quickrpt, qrprntr,
  MemDS, DBAccess, Ora, Func, OnFocusButton, peoutlookbtn, ComObj;

//  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, ExtCtrls, OnShapeLabel, Grids,
//  DBGrids, OnEditBaseCtrl, OnEditNumCtl, ComCtrls, OnInsaCommon, Db, DBTables,
//  comobj, StdCtrls, OnFocusButton, MemDS, DBAccess, Ora,
//  Mask, Buttons, quickrpt, qrprntr;         ComObj

type
  TFpsa30701 = class(TForm)
    Panel19: TPanel;
    Shape7: TShape;
    Phelpmsg: TPanel;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    MEfrom: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    RBscreen: TRadioButton;
    RBprint: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel5: TPanel;
    Panel8: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Image1: TImage;
    Lempno: TLabel;
    Lsysdate: TLabel;
    PrintDialog1: TPrintDialog;
    Image2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    RB1: TRadioButton;
    RB2: TRadioButton;
    BBprnset: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    OraQuery1: TOraQuery;
    BBexcel: TBitBtn;
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
    procedure SetNow;
    procedure ExcelSelect;
  end;

var
  Fpsa30701: TFpsa30701;
  AReport : TQuickRep;

implementation

uses Pass, kylib1, userhelp, FormMon1, Psa30702;     //Calen2,
{$R *.DFM}

// 날짜와 시간
procedure TFpsa30701.SetNow;
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

procedure TFpsa30701.FormActivate(Sender: TObject);
var  i : Integer;
begin
  if StartUp = True then     System.Exit
  else                       StartUp := True;

  Phelpmsg.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

  SDFM             := '-'; //SystemDateFormatMask;
  SetNow;
  MEfrom.Text      := Copy(GSsysdate, 1, 6);
  SelectOfPrint    := 'A';
  AReport          := Fpsa30702.QuickReport1;
  Phelpmsg.Caption := '  대출상환 내역출력작업을 시작하세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa30701.FormCreate(Sender: TObject);
begin
  StartUp := False;
end;

procedure TFpsa30701.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa30701.SpeedButton3Click(Sender: TObject);
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

procedure TFpsa30701.BBrunClick(Sender: TObject);
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

  if RBscreen.Checked then     AReport.Preview;
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

procedure TFpsa30701.BBprnsetClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFpsa30701.MEfromChange(Sender: TObject);
begin
//  PrintDialog1.MaxPage := 0;
end;

procedure TFpsa30701.RBscreenClick(Sender: TObject);
begin
  SelectOfPrint := 'A';
end;

procedure TFpsa30701.RBprintClick(Sender: TObject);
begin
  SelectOfPrint := 'B';
end;

procedure TFpsa30701.BBexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,k: integer;
begin
   ExcelSelect;

   if OraQuery1.RecordCount < 1 then
   begin
      showmessage('엑셀 변환할 자료가 없습니다.');
      exit;
   end;

   XArr := VarArrayCreate([1, 12], VarVariant);
   try
      XL := CreateOLEObject('Excel.Application');
   except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
   end;
   screen.cursor := crHourGlass;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   XL.WorkSheets[1].Name := '사우회 대출원리금 상환내역서';  // 시트명 부여

(*
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
*)
   //TITLE NAME 설정
   XL.Range['F1'].value := '사우회 대출원리금 상환내역서 LIST';

   XL.Range['A2'].value := '사번';
   XL.Range['B2'].value := '성명';
   XL.Range['C2'].value := '대출일';
   XL.Range['D2'].value := '상환개시';
   XL.Range['E2'].value := '대출금';
   XL.Range['F2'].value := '분할액';
   XL.Range['G2'].value := '당월원금';
   XL.Range['H2'].value := '당월이자';
   XL.Range['I2'].value := '당월원리금';
   XL.Range['J2'].value := '원금잔액';
   XL.Range['K2'].value := '최종상환횟수';
   XL.Range['L2'].value := '분할횟수';

   //검색된 자료를 excel에 export처리 시킨다.
   OraQuery1.First;

   for i := 3 to  OraQuery1.RecordCount + 2 do
   begin
      XL.Cells[i,1].Value  := ''''+OraQuery1.FieldbyName('사번').AsString;
      XL.Cells[i,2].Value  := OraQuery1.FieldbyName('성명').AsString;
      XL.Cells[i,3].Value  := OraQuery1.FieldbyName('대출일').AsString;
      XL.Cells[i,4].Value  := OraQuery1.FieldbyName('상환개시').AsString;
      XL.Cells[i,5].Value  := OraQuery1.FieldbyName('대출금').AsString;
      XL.Cells[i,6].Value  := OraQuery1.FieldbyName('분할액').AsString;
      XL.Cells[i,7].Value  := OraQuery1.FieldbyName('당월원금').AsString;
      XL.Cells[i,8].Value  := OraQuery1.FieldbyName('당월이자').AsString;
      XL.Cells[i,9].Value  := OraQuery1.FieldbyName('당월원리금').AsString;
      XL.Cells[i,10].Value := OraQuery1.FieldbyName('원금잔액').AsString;
      XL.Cells[i,11].Value := OraQuery1.FieldbyName('최종상환횟수').AsString;
      XL.Cells[i,12].Value := OraQuery1.FieldbyName('분할횟수').AsString;
      OraQuery1.Next;
      XL.Range['A1', 'N' + IntToStr(i)].font.Size := 9;
      XL.Range['A1', 'L' + IntToStr(i)].font.name := '굴림체';
      XL.Range['A1', 'N2'].HorizontalAlignment := 3;               //가운데 정렬
   end;

   //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
//  XL.Selection.Columns.AutoFit;                                //자동정렬
//   XL.Range['A3', 'A3'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
end;

procedure TFpsa30701.ExcelSelect;
var
   sSql : String;
begin
  with OraQuery1 do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT A.EMPNO 사번, B.KORNAME 성명, A.LOANDATE 대출일, A.REPFRDATE 상환개시, A.LOANAMT 대출금, ');
    Sql.Add('       C.REPCNT 분할액, A.REPMAXMM 당월원금, C.REPAMT 당월이자, C.REPINT 당월원리금,            ');
    Sql.Add('        A.APPDATE 원금잔액, TRUNC(A.LOANAMT / A.REPMAXMM) 최종상환횟수,                         ');
    Sql.Add('       (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT 분할횟수      ');
    Sql.Add('  FROM PSMLOAN A, PSCMAN B, PSDREPAY C                                                          ');
    Sql.Add(' WHERE C.REPLDATE = '''+MEfrom.Text+'''                                                         ');
    Sql.Add('   AND A.EMPNO    = C.EMPNO                                                                     ');
    Sql.Add('   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                             ');
    Sql.Add('UNION                                                                                           ');
    Sql.Add('SELECT A.EMPNO 사번, B.KORNAME 성명, A.LOANDATE 대출일, A.REPFRDATE 상환개시, A.LOANAMT 대출금, ');
    Sql.Add('       C.REPCNT 분할액, A.REPMAXMM 당월원금, C.REPAMT 당월이자, C.REPINT 당월원리금,            ');
    Sql.Add('        A.APPDATE 원금잔액, TRUNC(A.LOANAMT / A.REPMAXMM) 최종상환횟수,                         ');
    Sql.Add('       (A.LOANAMT - (TRUNC(A.LOANAMT / A.REPMAXMM) * (C.REPCNT - 1))) -  C.REPAMT 분할횟수      ');
    Sql.Add('  FROM PSHLOAN A, PSCMAN B, PSHREPAY C                                                          ');
    Sql.Add(' WHERE C.REPLDATE = '''+MEfrom.Text+'''                                                         ');
    Sql.Add('   AND A.EMPNO    = C.EMPNO                                                                     ');
    Sql.Add('   AND A.APPDATE  = C.APPDATE AND A.EMPNO = B.EMPNO                                             ');
    if RB1.Checked then
         Sql.Add('  ORDER BY 사번 ASC, 대출일 ASC                                                            ')
    else
         Sql.Add('  ORDER BY 대출일 ASC, 사번 ASC                                                            ');
    Open;
  end;
end;

end.

