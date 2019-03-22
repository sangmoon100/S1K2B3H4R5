{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC1050C(인사발령통보 작성)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김영대
  Version         : 1.00
  Date            : 1996.5.31
  Update Contents
    버전   수정일      수정자  관련근거        수정내용
 ----------------------------------------------------------------------------
    1.00    1996.5.31   김영대  신규프로그램 개발   처리명세서
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
 
unit pic10501;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, Codelib, DBGrids, Calen1,
  pass, datelib, Timeftp;

type
  TMainForm = class(TForm)
    Database1: TDatabase;
    QN_pihanno1: TQuery;
    QN_pihanno2: TQuery;
    QN_pihanno3: TQuery;
    QN_pihanno4: TQuery;
    Query_who: TQuery;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel9: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Panel7: TPanel;
    G_Progress: TGauge;
    Panel12: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Print: TBitBtn;
    BB_Screen: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    ME_frannono: TMaskEdit;
    ME_toannono: TMaskEdit;
    ME_Uancode1: TMaskEdit;
    ME_Uancode2: TMaskEdit;
    ME_Uancode3: TMaskEdit;
    ME_Uancode4: TMaskEdit;
    ME_dispatch: TMaskEdit;
    ME_DocNum: TMaskEdit;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    QM_pihanno1: TQuery;
    QM_pihanno2: TQuery;
    QM_pihanno3: TQuery;
    QM_pihanno4: TQuery;
    Bwink: TBitBtn;
    Panel16: TPanel;
    SaveDlg: TSaveDialog;
    G_11: TPanel;
    im1: TImage;
    G_12: TPanel;
    im2: TImage;
    G_31: TPanel;
    dm1: TImage;
    G_32: TPanel;
    dm2: TImage;
    G_33: TPanel;
    dm3: TImage;
    G_34: TPanel;
    dm4: TImage;
    QCode: TQuery;
    L_Uancode1: TPanel;
    L_Uancode3: TPanel;
    L_Uancode2: TPanel;
    L_Uancode4: TPanel;
    Query1: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure ME_UancodeAllDblClick(Sender: TObject);
    procedure ME_dispatchDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure RB_ObjectClick(Sender: TObject);
    procedure RB_OrderClick(Sender: TObject);
    procedure KeyTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KeyEnter(Sender: TObject; var Key: Char);
    procedure CodeExit(Sender: TObject);
  private
    pempno, pkorname, password: string;
    start: Integer;
    MAXROW : integer;
    RB_Order   : integer;
    RB_ObjectN : integer;
    { Private declarations }
    procedure ShowPreView;
    function  QCodeDisp(s1,s2 : String) : String;
  public
    { Public declarations }
    sDoc: string[10];
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

      tcontramt   : string[12+3];{계약금액, ','문자 3개 포함}
      tcontr_name : string[20];  {계약방법}
      ttype       : string[20];  {근무형태}
      tjobduty    : string[40];  {담당직무}

      bpaycl      : string[20];  {전직급}
      bdeptname   : string[60];  {전소속}
      bpayra_name : string[20];  {전직위}
      anfrdate    : string[10];   {전발령일자 yyyy.mm.dd형태}

      paycl       : string[20];  {후직급}
      deptname    : string[60];  {후소속}
      payra_name  : string[20];  {후직위}
      antodate    : string[10];   {후발령일자 yyyy.mm.dd형태}

      mark        : string[60];   {기타사항, 비고}
  end;

var
  MainForm: TMainForm;
  DataIn: TDataIn;
  Q_pihanno: TQuery;
  sWho: string[20];
  ErrorHelp: array[0..255] of char;
  HomeDir  : string;

implementation
{$R *.DFM}
uses
  pic10502, pic10503, pic10504,pic10505;

// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..
function TMainForm.QCodeDisp(s1,s2 : String) : String;
begin
 if trim(s2) <> '' then begin
    QCode.Close;
    QCode.Parambyname('lcodeid').AsString  := s1;
    QCode.Parambyname('lcodesub').AsString := s2;
    QCode.Open;
    QCodeDisp := Qcode.FieldByName('CodeName').AsString;
    if trim(Qcode.FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
    Qcode.close;
 end else QCodeDisp := '';
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

  AReport := PrintForm_1.InReport; {default QReport}
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
rStr:string;
begin


  if start = 0 then begin
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
  ME_dispatch.Text := Copy(rStr, 1, 8);

//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//      System.Halt(0);
    L_name.Caption := pkorname+'('+pempno+')';
    Q_pihanno := QN_pihanno1;         {default Query}
    Query_who.Open;
    sWho := Query_who.FieldByName('VALUE1').AsString; {인사발령통보자}
    sDoc := Query_who.FieldByName('VALUE2').AsString; {인사발령통보문서번호}
    Query_who.Close;
    RB_ObjectClick(G_11);
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
  with DataIn do begin
    ancode_name := '';
    korname     := '';
    empno       := '';
    tcontramt   := '';
    tcontr_name := '';
    ttype       := '';
    tjobduty    := '';
    bpaycl      := '';
    bdeptname   := '';
    bpayra_name := '';
    anfrdate    := '';
    paycl       := '';
    deptname    := '';
    payra_name  := '';
    antodate    := '';
    mark        := '';
  end;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
var
  Fout:    file of TDataIn;
  LineCnt, cnt, i: Integer;
  rStr:    string[8];
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
//  Rannono: string[6];  {발령번호 'xxxxxx'}
  Rannono: string[8];  {발령번호 'xxxxxx'}
  exeFile : array[0..255] of char;
  PageCheck : Boolean;

label end_point;
begin
  if TBitBtn(Sender).Name = 'Bwink' then begin
     saveDlg.initialDir := Homedir+'\list';
     SaveDlg.Execute;
     if trim(SaveDlg.FileName) = '' then begin
        MessageBox(handle,'화일명을 입력하기 바랍니다 !!.','확 인',MB_OK or $0030);
        system.exit;
     end;
     Application.ProcessMessages;
  end;
  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  if (ME_frannono.Text = '') or (ME_toannono.text = '') or
     (ME_frannono.Text > ME_toannono.text ) then begin
    P_Help.Caption := '발령번호 입력오류입니다.';
    System.Exit;
  end;

{  if ME_dispatch.Text = '' then begin
    P_Help.Caption := '통보일자 입력오류입니다.';
    System.Exit;
  end;

  if ME_DocNum.Text = '' then begin
    P_Help.Caption := '문서번호 입력오류입니다.';
    System.Exit;
  end;}

  G_Progress.Progress := 0;
  AssignFile(Fout, HomeDir+'\list\pic1050c.tmp');
  System.ReWrite(Fout);

(*  if RB_objectN = 1 then begin {정규직}    TTTT*)
    case RB_Order of
     1 : Q_pihanno := QN_pihanno1;
     2 : Q_pihanno := QN_pihanno2;
     3 : Q_pihanno := QN_pihanno3;
     4 : Q_pihanno := QN_pihanno4;
    end;
(*  end else begin
    case RB_Order of
     1 : Q_pihanno := QM_pihanno1;
     2 : Q_pihanno := QM_pihanno2;
     3 : Q_pihanno := QM_pihanno3;
     4 : Q_pihanno := QM_pihanno4;
    end;
  end;
*)

{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
// if RB_objectN = 1 then {정규직}
//    Q_pihanno.sql[39] := 'substr(PIHANNO."ANNONO",3,1) <> ''9'''
// else
//    Q_pihanno.sql[39] := 'substr(PIHANNO."ANNONO",3,1) = ''9''';
 if RB_objectN = 1 then {정규직}
    Q_pihanno.sql[39] := 'substr(PIHANNO."ANNONO",5,1) <> ''9'''
 else
    Q_pihanno.sql[39] := 'substr(PIHANNO."ANNONO",5,1) = ''9''';

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
  if Q_pihanno.RecordCount = 0 then begin
    P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
    System.Close(Fout);
    goto end_point;
  end;

  with DataIn do begin
    Rannono := Q_pihanno.FieldByName('ANNONO').AsString; {이전발령번호}
    LineCnt := 0;
    cnt := 0;
    if TBitBtn(Sender).Name = 'Bwink' then
       MAXROW := 5
    else begin
//         if RB_objectN = 2 then   {임원/임시직은 12 LINE}
//            MAXROW := 12
//         else
            MAXROW := 13;
    end;

    while not Q_pihanno.Eof do begin
      Inc(LineCnt);  Inc(cnt);
      PageCheck := False;
      G_Progress.Progress := (LineCnt*100) div Q_pihanno.RecordCount;
      SendMessage(Panel7.handle,WM_PAINT,0,0);

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

      tcontramt   := format('%12.0n', [Q_pihanno.FieldByName('TCONTRAMT').AsFloat]);
      tcontr_name := Q_pihanno.FieldByName('TCONTR_NAME').AsString;
      ttype       := Q_pihanno.FieldByName('TTYPE').AsString;
      tjobduty    := Q_pihanno.FieldByName('TJOBDUTY').AsString;

      if (Q_pihanno.FieldByName('ANCODE').AsString[1] = '1') and
         (Q_pihanno.FieldByName('ANCODE').AsString[3] = '1') then begin
        bdeptname   := '';
        deptname    := Q_pihanno.FieldByName('DEPTNAME').AsString;
      end
      else if (Q_pihanno.FieldByName('ANCODE').AsString[1] = '4') or
              (Q_pihanno.FieldByName('ANCODE').AsString[1] = '5') then begin
        bdeptname   := Q_pihanno.FieldByName('BDEPTNAME').AsString;
        if Q_pihanno.FieldByName('ANCODE').AsString = '514' then {복직}
          if ( Q_pihanno.FieldByName('BDEPTCODE').AsString <>
               Q_pihanno.FieldByName('DEPTCODE').AsString ) or
             ( Q_pihanno.FieldByName('BORGNUM').AsString <>
               Q_pihanno.FieldByName('ORGNUM').AsString )
          then deptname := Q_pihanno.FieldByName('DEPTNAME').AsString;
      end else begin
        if ( Q_pihanno.FieldByName('BDEPTCODE').AsString =
             Q_pihanno.FieldByName('DEPTCODE').AsString ) and
           ( Q_pihanno.FieldByName('BORGNUM').AsString =
             Q_pihanno.FieldByName('ORGNUM').AsString )
        then begin
          bdeptname := Q_pihanno.FieldByName('BDEPTNAME').AsString;
        end else begin
          bdeptname := Q_pihanno.FieldByName('BDEPTNAME').AsString;
          deptname  := Q_pihanno.FieldByName('DEPTNAME').AsString;
        end;
      end;

      bpaycl      := Q_pihanno.FieldByName('BPAYCL_NAME').AsString;
      bpayra_name := Q_pihanno.FieldByName('BPAYRA_NAME').AsString;
      paycl       := Q_pihanno.FieldByName('PAYCL_NAME').AsString;
      payra_name  := Q_pihanno.FieldByName('PAYRA_NAME').AsString;
      if bpaycl = paycl then paycl := '';
      if bpayra_name = payra_name then payra_name := '';

      rStr := Q_pihanno.FieldByName('ANFRDATE').AsString;
      if rStr <> '' then
        anfrdate    := Copy(rStr,1,4)+'.'+Copy(rStr,5,2)+'.'+Copy(rStr,7,2);

      rStr := Q_pihanno.FieldByName('ANTODATE').AsString;
      if rStr <> '' then
        antodate    := Copy(rStr,1,4)+'.'+Copy(rStr,5,2)+'.'+Copy(rStr,7,2);

      if Q_pihanno.FieldByName('ANCODE').AsString <> '211'  then   {전보가 아닐경우}
         mark := Q_pihanno.FieldByName('MARK1').AsString
      else
         mark := '';

  (*    {임원/임시직이면서 윙크용이 아닐경우}
      if (RB_objectN = 2) and (TBitBtn(Sender).Name <> 'Bwink') then begin
           paycl      := Q_pihanno.FieldByName('PAYCL_NAME').AsString;
           payra_name := Q_pihanno.FieldByName('PAYRA_NAME').AsString;
           deptname   := Q_pihanno.FieldByName('DEPTNAME').AsString;
      end;
*)
      flag := 'C';  System.Write(Fout, DataIn);
      if cnt = MAXROW then begin
        if TBitBtn(Sender).Name = 'Bwink' then
           MAXROW := 7
        else begin
//           if RB_objectN = 2 then   {임원/임시직은 12 LINE}
//              MAXROW := 12
//           else
              MAXROW := 14;
        end;
        cnt := 0; PageCheck := True;
        ClearData; flag := 'E'; System.Write(Fout, DataIn);
      end;
      Q_pihanno.Next;

      if (Q_pihanno.Eof) or (Rannono <> Q_pihanno.FieldByName('ANNONO').AsString) then begin
        Rannono := Q_pihanno.FieldByName('ANNONO').AsString;
        ClearData;
        deptname := '    '+sWho;
        anfrdate := '   -끝-';
        Inc(cnt);
        // 마지막 데이타에서 변수화일에서 인사발령통보자를 찍기위함.
        flag := 'F';  System.Write(Fout, DataIn);
        if cnt <> MAXROW then begin
          ClearData;  flag := 'N';
          for i := cnt+1 to MAXROW{ - 1} do System.Write(Fout, DataIn);
          if TBitBtn(Sender).Name = 'Bwink' then begin
             MAXROW := 7;  cnt := 0;
             if PageCheck = True then continue;
          end;
        end;
        if (Q_pihanno.Eof) then begin
           ClearData;
           if TBitBtn(Sender).Name = 'Bwink' then begin
              flag := 'E';  System.Write(Fout, DataIn);
           end;
        end else begin
           ClearData;  flag := 'E';  System.Write(Fout, DataIn);
        end;
        cnt := 0;
        if TBitBtn(Sender).Name = 'Bwink' then
           MAXROW := 7
        else begin
//           if RB_objectN = 2 then   {임원/임시직은 12 LINE}
//              MAXROW := 12
//           else
              MAXROW := 13;
        end;
      end;
    end; {while}
  end; {with}
  System.Close(Fout);
  Q_pihanno.Close;

  P_Help.Caption := '추출된 자료를 출력합니다.';
//  if RB_objectN = 1 then {정규직}
    AReport := PrintForm_1.InReport;
//  else
//    AReport := PrintForm_2.InReport;

  if TBitBtn(Sender).Name = 'BB_Print' then AReport.Print;
  if TBitBtn(Sender).Name = 'BB_Screen' then begin
    P_Help.Caption := '추출된 자료를 출력합니다.';
//    QRprinter.OnPreView := ShowPreView; {사용자정의 미리보기 화면}
    AReport.PreView;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';

  if TBitBtn(Sender).Name = 'Bwink' then begin
     Form_TextFile(SaveDlg.FileName);
     if WinExec(strpcopy(exeFile,'c:\program files\Accessories\wordpad '+SaveDlg.FileName),SW_SHOW) < 32 then
        WinExec(strpcopy(exeFile,'edit '+SaveDlg.FileName),SW_SHOW);
     P_Help.caption := '작업결과 화일 ==> ['+SaveDlg.FileName+']';
  end;

end_point:
  Q_pihanno.Close;
  SysUtils.DeleteFile(HomeDir+'\list\pic1050c.tmp');
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
    
    if CodeForm.ShowModal = mrOk then begin
      case TMaskEdit(Sender).Tag of
        5:begin
            ME_Uancode1.Text   := CodeForm.Code;
            L_Uancode1.Caption := CodeForm.CodeName;
          end;
        6:begin
            ME_Uancode2.Text   := CodeForm.Code;
            L_Uancode2.Caption := CodeForm.CodeName;
          end;
        7:begin
            ME_Uancode3.Text   := CodeForm.Code;
            L_Uancode3.Caption := CodeForm.CodeName;
          end;
        8:begin
            ME_Uancode4.Text   := CodeForm.Code;
            L_Uancode4.Caption := CodeForm.CodeName;
          end;
      end;
    end;
  finally
    CodeForm.free;
  end;      
end;

procedure TMainForm.ME_dispatchDblClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_dispatch.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;

procedure TMainForm.RB_ObjectClick(Sender: TObject);
begin
  im1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   1 : im1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : im2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  RB_ObjectN := TPanel(Sender).HelpContext;
end;

procedure TMainForm.RB_OrderClick(Sender: TObject);
begin
  dm1.picture.LoadFromFile(Homedir+'\pic\Ball_1.bmp');
  dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   4 : dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   1 : dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
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
      2 : ME_dispatch.Setfocus;
      3 : ME_DocNum.Setfocus;
      4 : ME_Uancode1.Setfocus;
      5 : ME_Uancode2.Setfocus;
      6 : ME_Uancode3.Setfocus;
      7 : ME_Uancode4.Setfocus;
      8 : ME_frannono.SetFocus;
    end; {case end}
  end; {inner if end}
end else begin
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    P_Help.Caption := '';
    case TMaskEdit(Sender).Tag of
      1 : ME_Uancode4.Setfocus;
      2 : ME_frannono.SetFocus;
      3 : ME_toannono.Setfocus;
      4 : ME_dispatch.Setfocus;
      5 : ME_DocNum.Setfocus;
      6 : ME_Uancode1.Setfocus;
      7 : ME_Uancode2.Setfocus;
      8 : ME_Uancode3.Setfocus;
    end; {case end}
  end; {inner if end}
end; {else end}
end;

procedure TMainForm.KeyEnter(Sender: TObject; var Key: Char);
begin
  if key = chr(13) then key := chr(0);
end;

procedure TMainForm.CodeExit(Sender: TObject);
begin
  case TMaskEdit(Sender).Tag of
    1 : ME_toannono.text   := ME_frannono.text;
    5 : if trim(ME_Uancode1.Text) <> '' then
           L_Uancode1.Caption := QcodeDisp('I300',ME_Uancode1.Text)
        else
           L_Uancode1.Caption := '';
    6 : if trim(ME_Uancode2.Text) <> '' then
           L_Uancode2.Caption := QcodeDisp('I300',ME_Uancode2.Text)
        else
           L_Uancode2.Caption := '';
    7 : if trim(ME_Uancode3.Text) <> '' then
           L_Uancode3.Caption := QcodeDisp('I300',ME_Uancode3.Text)
        else
           L_Uancode3.Caption := '';
    8 : if trim(ME_Uancode4.Text) <> '' then
           L_Uancode4.Caption := QcodeDisp('I300',ME_Uancode4.Text)
        else
           L_Uancode4.Caption := '';
  end; {case end}
end;

end.
