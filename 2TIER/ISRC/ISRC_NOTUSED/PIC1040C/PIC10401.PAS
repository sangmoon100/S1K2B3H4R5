{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC1040C(인사발령안품의서)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김영대
  Version         : 30.00
  Date            : 1999.01.04
  Update Contents
    버전   수정일      수정자  관련근거        수정내용
 ----------------------------------------------------------------------------
    1.00    1996.5.31   김영대  신규프로그램 개발   처리명세서
    30.00   1999.01.04  김혜진  직급명 자리수늘림. 호봉삭제.  하나로신인사재개발
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
unit Pic10401;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, Codelib, DBGrids, pass, datelib, Timeftp,pic10404;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    G_Progress: TGauge;
    Panel4: TPanel;
    BB_Close:  TBitBtn;
    BB_Print:  TBitBtn;
    BB_SetUp:  TBitBtn;
    BB_Screen: TBitBtn;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    Database1: TDatabase;
    PrinterSetup: TPrinterSetupDialog;
    ME_frannono: TMaskEdit;
    ME_toannono: TMaskEdit;
    Label3: TLabel;
    ME_Uancode1: TMaskEdit;
    ME_Uancode2: TMaskEdit;
    ME_Uancode3: TMaskEdit;
    ME_Uancode4: TMaskEdit;
    Q_pihanno1: TQuery;
    Q_pihanno2: TQuery;
    Q_pihanno3: TQuery;
    Q_pihanno4: TQuery;
    Q_pihanno1EMPNO: TStringField;
    Q_pihanno1KORNAME: TStringField;
    Q_pihanno1ANNONO: TStringField;
    Q_pihanno1ANFRDATE: TStringField;
    Q_pihanno1ANTODATE: TStringField;
    Q_pihanno1ANCODE: TStringField;
    Q_pihanno1ANCODE_NAME: TStringField;
    Q_pihanno1BDEPTNAME: TStringField;
    Q_pihanno1BPAYCL: TStringField;
    Q_pihanno1BPAYGR: TFloatField;
    Q_pihanno1BPAYRA_NAME: TStringField;
    Q_pihanno1DEPTNAME: TStringField;
    Q_pihanno1PAYCL: TStringField;
    Q_pihanno1PAYGR: TFloatField;
    Q_pihanno1PAYRA_NAME: TStringField;
    Q_pihanno1MARK1: TStringField;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel9: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label1: TLabel;
    QueryA: TQuery;
    G_31: TPanel;
    dm1: TImage;
    G_32: TPanel;
    dm2: TImage;
    G_33: TPanel;
    dm3: TImage;
    G_34: TPanel;
    dm4: TImage;
    L_Uancode1: TPanel;
    L_Uancode2: TPanel;
    L_Uancode4: TPanel;
    L_Uancode3: TPanel;
    Bwink: TBitBtn;
    SaveDlg: TSaveDialog;
    Query1: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure ME_UancodeAllDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_ControlKeyPress(Sender: TObject; var Key: Char);
    procedure RB_OrderClick(Sender: TObject);
    procedure KeyTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodeExit(Sender: TObject);      {코드조회}
  private
    pempno, pkorname, password: string;
    start: Integer;
    RB_order : integer;
    { Private declarations }
    procedure ShowPreView;
    function PyccodeA(codeid, codeno : string; gu : integer) : string;
  public
    { Public declarations }
    AReport: TQuickRep;
    procedure ClearData;
  end;

type
  TDataIn = record
      flag        : string[1];   {C:계속, N:다음페이지}
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
//      annono      : string[7];   {발령번호 'xx-xxxx'}
      annono      : string[9];   {발령번호 'xxxx-xxxx'}
      ancode_name : string[20];  {발령구분명}
      korname     : string[12];  {성명}
      empno       : string[4];   {사번}
      mark        : string[60];  {기타사항}
      bpaycl      : string[8];   {전직급}
      bpaygr      : string[2];   {전호봉}
      bdeptname   : string[60];  {전소속}
      bpayra_name : string[20];  {전직위}
      anfrdate    : string[10];  {전발령일자 yyyy.mm.dd형태}

      paycl       : string[8];   {후직급}
      paygr       : string[2];   {후호봉}
      deptname    : string[60];  {후소속}
      payra_name  : string[20];  {후직위}
      antodate    : string[10];  {후발령일자 yyyy.mm.dd형태}
  end;

const
  MAXROW = 14;

var
  MainForm: TMainForm;
  DataIn: TDataIn;
  Q_pihanno: TQuery;
  ErrorHelp: array[0..255] of char;
  exeFile : array[0..255] of char;  
  HomeDir  : String;

implementation
{$R *.DFM}
uses
  pic10402, pic10403;
function TMainForm.PyccodeA( codeid,codeno : string; gu : integer ) : string;
begin
     QueryA.Close;
     QueryA.SQL.Clear;
     QueryA.SQL.ADD(' SELECT CODENAME FROM PYCCODE');
     QueryA.SQL.ADD(' WHERE (CODEID = :code_id) AND ');
     QueryA.SQL.ADD('       (CODENO = :code_no) ');
     QueryA.ParamByName('code_id').AsString := codeid;
     QueryA.ParamByName('code_no').AsString := codeno;
     QueryA.Open;
     if QueryA.RecordCount < 1 then
        PyccodeA := codeno
     else begin
        if gu = 1 then PyccodeA := Copy(QueryA.FieldByName('CODENAME').AsString,1,8);
        if gu = 2 then PyccodeA := QueryA.FieldByName('CODENAME').AsString;
     end;
     QueryA.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir := HomeDirOpen;

  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);

  AReport := PrintForm.InReport;
  Q_pihanno := Q_pihanno1; {default Query}
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
rStr:string;
begin
  if start = 0 then
  begin
    start := 1;

    DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
    DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
    DataBase1.Params[16] := 'PASSWORD=' +PassEmp(cmdline,6);

    Application.ProcessMessages;
    Try
      Database1.Connected := True;
    EXCEPT ON E : EDataBaseError DO begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
      halt(1);
    end;
    END;

  rStr := Timeftp.TimeDate(Query1);
  L_Date.Caption := Copy(rStr, 1, 4)+'/'+
                    Copy(rStr, 5, 2)+'/'+
                    Copy(rStr, 7, 2);

//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//      System.Halt(0);
    L_name.Caption := pkorname+'('+pempno+')';
    RB_OrderClick(G_31);
    ME_frannono.SetFocus;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TQuery) then
      TQuery(Self.Components[i]).Close;
  Action := caFree;
end;

{-----------------------------------------------------------}
procedure TMainForm.ShowPreView;
begin
  PreViewForm.ShowModal;
end;

procedure TMainForm.ClearData;
begin
  with DataIn do
  begin
    ancode_name := '';
    korname     := '';
    empno       := '';
    mark        := '';
    bpaycl      := '';
    bpaygr      := '';
    bdeptname   := '';
    bpayra_name := '';
    anfrdate    := '';
    paycl       := '';
    paygr       := '';
    deptname    := '';
    payra_name  := '';
    antodate    := '';
    annono      := '';
  end;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
var
  Fout:    file of TDataIn;
  rStr:    string[8];
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
//  Rannono: string[6];  {발령번호 'xxxxxx'}
  Rannono: string[8];  {발령번호 'xxxxxxxx'}
  LineCnt, cnt, i: Integer;
label end_point;
begin
  if TBitBtn(Sender).Name = 'Bwink' then begin
     SaveDlg.InitialDir := homedir+'\list';
     SaveDlg.Execute;
     if trim(SaveDlg.FileName) = '' then begin
        MessageBox(handle,'화일명을 입력하기 바랍니다 !!.','확 인',MB_OK or $0030);
        system.exit;
     end;
     Application.ProcessMessages;
  end;

  if (ME_frannono.Text = '') or (ME_toannono.text = '') or
     (ME_frannono.Text > ME_toannono.text ) then
  begin
    P_Help.Caption := '발령번호 입력오류입니다.';
    System.Exit;
  end;

  G_Progress.Progress := 0;
  AssignFile(Fout, HomeDir+'\list\pic1040c.tmp');
  System.ReWrite(Fout);

  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  Application.ProcessMessages;
  case RB_Order of
     1 : Q_pihanno := Q_pihanno1;
     2 : Q_pihanno := Q_pihanno2;
     3 : Q_pihanno := Q_pihanno3;
     4 : Q_pihanno := Q_pihanno4;
  end;

  Q_pihanno.ParamByName('P_frannono').AsString := ME_frannono.Text;
  Q_pihanno.ParamByName('P_toannono').AsString := ME_toannono.Text;
  if ME_Uancode1.Text = '' then
    Q_pihanno.ParamByName('P_ancode1').AsString := '000000' {임의의값}
  else
    Q_pihanno.ParamByName('P_ancode1').AsString := ME_Uancode1.Text;
  if ME_Uancode2.Text = '' then
    Q_pihanno.ParamByName('P_ancode2').AsString := '000000' {임의의값}
  else
    Q_pihanno.ParamByName('P_ancode2').AsString := ME_Uancode2.Text;
  if ME_Uancode3.Text = '' then
    Q_pihanno.ParamByName('P_ancode3').AsString := '000000' {임의의값}
  else
    Q_pihanno.ParamByName('P_ancode3').AsString := ME_Uancode3.Text;
  if ME_Uancode4.Text = '' then
    Q_pihanno.ParamByName('P_ancode4').AsString := '000000' {임의의값}
  else
    Q_pihanno.ParamByName('P_ancode4').AsString := ME_Uancode4.Text;

  Q_pihanno.Open;
  if Q_pihanno.RecordCount = 0 then
  begin
    P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
    System.Close(Fout);
    goto end_point;
  end;

  with DataIn do
  begin
    Rannono := Q_pihanno.FieldByName('ANNONO').AsString; {이전발령번호}
    LineCnt := 0;
    cnt := 0;
    while not Q_pihanno.Eof do
    begin
      Inc(LineCnt);
      Inc(cnt);
      G_Progress.Progress := (LineCnt*100) div Q_pihanno.RecordCount;
      Application.ProcessMessages;
      ClearData;
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
//      annono      := Copy(Q_pihanno.FieldByName('ANNONO').AsString,1,2)+'-'+
//                     Copy(Q_pihanno.FieldByName('ANNONO').AsString,3,4);
      annono      := Copy(Q_pihanno.FieldByName('ANNONO').AsString,1,4)+'-'+
                     Copy(Q_pihanno.FieldByName('ANNONO').AsString,5,4);
      ancode_name := Q_pihanno.FieldByName('ANCODE_NAME').AsString;
      korname     := Q_pihanno.FieldByName('KORNAME').AsString;
      empno       := Q_pihanno.FieldByName('EMPNO').AsString;

      if (Q_pihanno.FieldByName('ANCODE').AsString[1] = '1') and    {신규채용관련}
         (Q_pihanno.FieldByName('ANCODE').AsString[3] = '1') then
      begin
        bpaycl      := '';        bpaygr      := '';        bpayra_name := '';
        bdeptname   := '';
        paycl       := PyccodeA('I112', Q_pihanno.FieldByName('PAYCL').AsString,1);
        paygr       := Q_pihanno.FieldByName('PAYGR').AsString;
        payra_name  := Q_pihanno.FieldByName('PAYRA_NAME').AsString;
        deptname    := Q_pihanno.FieldByName('DEPTNAME').AsString;
      end
      else if Q_pihanno.FieldByName('ANCODE').AsString[1] = '8' then  {퇴사사항}
      begin
        bpaycl      := PyccodeA('I112', Q_pihanno.FieldByName('BPAYCL').AsString,1);
        bpaygr      := Q_pihanno.FieldByName('BPAYGR').AsString;
        bdeptname   := Q_pihanno.FieldByName('BDEPTNAME').AsString;
        bpayra_name := Q_pihanno.FieldByName('BPAYRA_NAME').AsString;
{        rStr        := Q_pihanno.FieldByName('ANFRDATE').AsString;
        if rStr <> '' then
          anfrdate    := Copy(rStr,3,2)+'.'+Copy(rStr,5,2)+'.'+Copy(rStr,7,2);}

        paycl       := '';
        paygr       := '';
        payra_name  := '';
        deptname    := '';
      end
      else
      begin
        bpaycl      := PyccodeA('I112', Q_pihanno.FieldByName('BPAYCL').AsString,1);
        bpaygr      := Q_pihanno.FieldByName('BPAYGR').AsString;
        bpayra_name := Q_pihanno.FieldByName('BPAYRA_NAME').AsString;
        bdeptname   := Q_pihanno.FieldByName('BDEPTNAME').AsString;

        paycl       := PyccodeA('I112', Q_pihanno.FieldByName('PAYCL').AsString,1);
        paygr       := Q_pihanno.FieldByName('PAYGR').AsString;
        payra_name  := Q_pihanno.FieldByName('PAYRA_NAME').AsString;
        deptname    := Q_pihanno.FieldByName('DEPTNAME').AsString
      end;

      rStr := Q_pihanno.FieldByName('ANFRDATE').AsString;
      if trim(rStr) <> '' then
        anfrdate    := Copy(rStr,1,4)+'.'+Copy(rStr,5,2)+'.'+Copy(rStr,7,2)
      else anfrdate := '';
      rStr := Q_pihanno.FieldByName('ANTODATE').AsString;
      if trim(rStr) <> '' then
        antodate    := Copy(rStr,1,4)+'.'+Copy(rStr,5,2)+'.'+Copy(rStr,7,2)
      else antodate := '';

      if Q_pihanno.FieldByName('ANCODE').AsString <> '211'  then   {전보가 아닐경우}
         mark := Q_pihanno.FieldByName('MARK1').AsString
      else
         mark := '';

      if cnt = MAXROW then
      begin
        cnt := 0;
        flag := 'E';
      end
      else
      begin
        flag := 'C';
      end;
      System.Write(Fout, DataIn);

      Q_pihanno.Next;

      if (Q_pihanno.Eof) or (Rannono <> Q_pihanno.FieldByName('ANNONO').AsString) then
      begin
        Rannono := Q_pihanno.FieldByName('ANNONO').AsString;
        ClearData;
        deptname := ' SK 브로드밴드(주)  대표이사 사장';          {HANARO}
{하나로통신용으로 Compile할 경우는 Sql문(4개)에 "anfrdate >= '19970923'" 조건을
 반드시 추가 할 것. 하지 않을 경우는 책임 못짐 ..... By 김혜진 }
        anfrdate := '  -끝-';
        Inc(cnt);
        if cnt = MAXROW then
        begin
          flag := 'E';
          System.Write(Fout, DataIn);
        end
        else
        begin
          flag := 'C';
          System.Write(Fout, DataIn);
          ClearData;
          flag := 'N';
          for i := cnt+1 to MAXROW - 1 do
            System.Write(Fout, DataIn);
          flag := 'E';
          System.Write(Fout, DataIn);
        end;
        cnt := 0;
      end;
    end; {while}
  end; {with}
  System.Close(Fout);
  Q_pihanno.Close;

  P_Help.Caption := '추출된 자료를 출력합니다.';
  if TBitBtn(Sender).Name = 'BB_Print' then  {인쇄}
  begin
    AReport.Print
  end
  else if TBitBtn(Sender).Name = 'Bwink' then begin
     Form_TextFile(SaveDlg.FileName);
     if WinExec(strpcopy(exeFile,'c:\program files\Accessories\wordpad '+SaveDlg.FileName),SW_SHOW) < 32 then
        WinExec(strpcopy(exeFile,'edit '+SaveDlg.FileName),SW_SHOW);
     P_Help.caption := '작업결과 화일 ==> ['+SaveDlg.FileName+']';
  end  else
  begin
    P_Help.Caption := '추출된 자료를 출력합니다.';
//    QRprinter.OnPreView := ShowPreView; {사용자정의 미리보기 화면}
    AReport.PreView;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';

end_point:
  Q_pihanno.Close;
  SysUtils.DeleteFile(HomeDir+'pic1040c.tmp');
  G_Progress.Progress := 0;
end;

procedure TMainForm.ME_UancodeAllDblClick(Sender: TObject);
begin
  try
    CodeForm := TCodeForm.Create(Self);
    CodeForm.FormData := '발령구분 선택';
    CodeForm.DataVal1 := 'I300';
    CodeForm.DataVal2 := TMaskEdit(Sender).Text;
    CodeForm.DataVal3 := '';

    if CodeForm.ShowModal = mrOk then
    begin
      case TMaskEdit(Sender).Tag of
        3:begin
            ME_Uancode1.Text := CodeForm.Code;
            L_Uancode1.Caption := CodeForm.CodeName;
          end;
        4:begin
            ME_Uancode2.Text := CodeForm.Code;
            L_Uancode2.Caption := CodeForm.CodeName;
          end;
        5:begin
            ME_Uancode3.Text := CodeForm.Code;
            L_Uancode3.Caption := CodeForm.CodeName;
          end;
        6:begin
            ME_Uancode4.Text := CodeForm.Code;
            L_Uancode4.Caption := CodeForm.CodeName;
          end;
      end;
    end;
  finally
    CodeForm.free;
  end;
end;

procedure TMainForm.E_ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then  Key := Chr(0);
end;

procedure TMainForm.RB_OrderClick(Sender: TObject);
begin
  dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   1 : dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   4 : dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  RB_Order := TPanel(Sender).HelpContext;
end;

procedure TMainForm.KeyTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not(ssShift  in Shift) then begin
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    P_Help.Caption := '';
    case TMaskEdit(Sender).Tag of
      1 : ME_toannono.Setfocus;
      2 : ME_Uancode1.Setfocus;
      3 : ME_Uancode2.Setfocus;
      4 : ME_Uancode3.Setfocus;
      5 : ME_Uancode4.Setfocus;
      6 : ME_frannono.SetFocus;
    end; {case end}
  end; {inner if end}
end else begin
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    P_Help.Caption := '';
    case TMaskEdit(Sender).Tag of
      1 : ME_Uancode4.Setfocus;
      2 : ME_frannono.SetFocus;
      3 : ME_toannono.Setfocus;
      4 : ME_Uancode1.Setfocus;
      5 : ME_Uancode2.Setfocus;
      6 : ME_Uancode3.Setfocus;
    end; {case end}
  end; {inner if end}
end; {else end}
end;

procedure TMainForm.CodeExit(Sender: TObject);
begin
  case TMaskEdit(Sender).Tag of
    1 : ME_toannono.text   := ME_frannono.text;
    3 : if trim(ME_Uancode1.Text) <> '' then
           L_Uancode1.Caption := PyccodeA('I300',ME_Uancode1.Text,2)
        else
           L_Uancode1.Caption := '';
    4 : if trim(ME_Uancode2.Text) <> '' then
           L_Uancode2.Caption := PyccodeA('I300',ME_Uancode2.Text,2)
        else
           L_Uancode2.Caption := '';
    5 : if trim(ME_Uancode3.Text) <> '' then
           L_Uancode3.Caption := PyccodeA('I300',ME_Uancode3.Text,2)
        else
           L_Uancode3.Caption := '';
    6 : if trim(ME_Uancode4.Text) <> '' then
           L_Uancode4.Caption := PyccodeA('I300',ME_Uancode4.Text,2)
        else
           L_Uancode4.Caption := '';
  end; {case end}
end;

end.

