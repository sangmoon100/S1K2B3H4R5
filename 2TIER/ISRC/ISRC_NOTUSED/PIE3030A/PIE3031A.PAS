{--------------------------------------------------------------------------------
PROGRAM-NAME    : PIA1060C(인사기록요약표)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.16
Date            : 1998.08.28
Update contents
 버전     수정일      수정자   관련근거       수정내용
 1.00   1996.02.01    전철호  처리명세서      신규프로그램개발
--------------------------------------------------------------------------------}
unit PIE3031A;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, Mask, ExtCtrls,QuickRpt,
  iniFiles, DB, DBTables, ImgList, MemDS, DBAccess, Ora, Func,
  KeyEmpno, keycode,  DeptCode;

{$I PIE3031A.inc}
const
    PRTROW = 20;
type
  TPIE3031cForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Gauge1: TGauge;
    Panel5: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    baseDate: TMaskEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel4: TPanel;
    G_11: TPanel;
    G_12: TPanel;
    Label7: TLabel;
    empno1: TMaskEdit;
    empno2: TMaskEdit;
    Panel13: TPanel;
    Label1: TLabel;
    deptcode1: TMaskEdit;
    deptcode2: TMaskEdit;
    Panel6: TPanel;
    Label2: TLabel;
    paycl1: TMaskEdit;
    paycl2: TMaskEdit;
    Panel7: TPanel;
    G_21: TPanel;
    G_22: TPanel;
    Panel14: TPanel;
    filenm: TMaskEdit;
    Panel15: TPanel;
    G_31: TPanel;
    G_32: TPanel;
    G_33: TPanel;
    G_34: TPanel;
    Panel21: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Panel11: TPanel;
    hp: TPanel;
    FileOpen: TOpenDialog;
    filesel: TSpeedButton;
    Btext: TBitBtn;
    Bdept: TBitBtn;
    im1: TImage;
    im2: TImage;
    im3: TImage;
    dm1: TImage;
    dm2: TImage;
    dm3: TImage;
    dm4: TImage;
    im4: TImage;
    korname1: TPanel;
    korname2: TPanel;
    Panel12: TPanel;
    G_41: TPanel;
    em1: TImage;
    G_42: TPanel;
    em2: TImage;
    G_43: TPanel;
    em3: TImage;
    G_44: TPanel;
    em4: TImage;
    FSave: TSaveDialog;
    Panel16: TPanel;
    em5: TImage;
    Panel17: TPanel;
    Dacomgu: TCheckBox;
    Timer1: TTimer;
    ImageList1: TImageList;
    Qmas: TOraQuery;
    Qsch: TOraQuery;
    Q_date: TOraQuery;
    Q_pay: TOraQuery;
    Qtext: TOraQuery;
    Qrew: TOraQuery;
    Qpun: TOraQuery;
    Qann: TOraQuery;
    QLic: TOraQuery;
    QryGen: TOraQuery;
    Qcar: TOraQuery;
    QCode: TOraQuery;
    Qdept: TOraQuery;
    Qfami: TOraQuery;
    Bexcel: TBitBtn;
    Chk_Group: TCheckBox;
    Panel18: TPanel;
    QAdm: TOraQuery;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure G_11Click(Sender: TObject);
    procedure G_31Click(Sender: TObject);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure BscreenClick(Sender: TObject);
    procedure EmpmoClick(Sender: TObject);
    procedure DeptClick(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure CalenClick(Sender: TObject);
    procedure fileselClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BdeptClick(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure G_41Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel16Click(Sender: TObject);

  private
    { Private declarations }
    EnterKey  : integer;
    C_RunSave,dpay_amt,tmpday : integer;
    wordPad   : Boolean;
    FreeCheck,FreeDept,Dataempno : Boolean;
    CurDate   : string[8];
    bYearPayNum: String; // 전년 연봉차수
  {출력용 메모리 구성}

    norgnum   : string[3];   {현조직차수}
    ndept     : string[5];   {현부서}
    npayra    : string[3];   {현직책}
    pancode   : array[1..PRTROW] of string[3];  {발령구분}
    panfrdate : array[1..PRTROW] of string[8];  {발령일 from}
    pantodate : array[1..PRTROW] of string[8];  {  "     to}
    ppaycl    : array[1..PRTROW] of string[8];  {BAND}
    ppayra    : array[1..PRTROW] of string[8];  {직책}
    ppayra2   : array[1..PRTROW] of string[8];  {직위}
    porgnum   : array[1..PRTROW] of string[3];  {조직차수}
    pdeptcode : array[1..PRTROW] of string[6];  {부서코드}
    pmark1    : array[1..PRTROW] of string[40]; {비고1}
    pmark2    : array[1..PRTROW] of string[40]; {비고2}
    pmark3    : array[1..PRTROW] of string[40]; {비고3}
//  ===========================================================
    Dancode   : array[1..2] of string[3];  {발령구분}
    Danfrdate : array[1..2] of string[8];  {발령일 from}
    Dantodate : array[1..2] of string[8];  {  "     to}
    Dpaycl    : array[1..2] of string[8];  {BAND}
    Dpayra    : array[1..2] of string[8];  {직책}
    Dpayra2   : array[1..2] of string[8];  {직위}
    Dorgnum   : array[1..2] of string[3];  {조직차수}
    Ddeptcode : array[1..2] of string[6];  {부서코드}
    Dmark1    : array[1..2] of string[40]; {비고1}
    Dmark2    : array[1..2] of string[40]; {비고2}
    Dmark3    : array[1..2] of string[40]; {비고3}
//  ===========================================================
    tData     : Datasource_insa;
    tFile     : file of Datasource_insa; //pia1061c.inc shm
    eFile     : TextFile;
    function  QmasExecute : Boolean;
    function  QempDisp(str : string) : string;
    procedure QueryPimsch(str : string);
    procedure QueryPimFami(str : string);
    procedure QueryPimCari(str : string);
    procedure QueryPimjPay(str : string);
    procedure QueryPimdPay(str : string);
    procedure QueryPimLic(str : string);
    procedure QueryPimfore(str : string);
    procedure QueryPimtran(str : string);
    procedure QueryPimingo(str : string);
    procedure QueryPimappr(str : string);
    procedure QueryPimRewa(str : string);
    procedure QueryPimPuni(str : string);
    procedure QueryPihAnno(str : string);
    procedure QueryPihpstate(str : string);
    procedure Carr_rtn(a_ancode,a_anfrdate,a_antodate : string; c: integer);
    procedure Run_Text_Create;
    function MyPasString(const S, Delimiters : string; Num : integer) : string;
    procedure Update_History;
    function CheckOfAdmin(Parameter: String): Boolean;

  public
    { Public declarations }
    start     : integer;
    pempno    : string;
    pkorname  : string;
    password  : string;
    f_SECTCODE : string;
    tReport  : TQuickRep;
    sqlcommand1,temp_orgempdate : string;
    gu1,gu3,gu4 : integer;
    pageCnt : integer; {출력장수}
    empnostr  : array[1..50] of string[4];
    procedure MakeTextFile;
    procedure helpHint(str : string);
    function QDeptDisp(s1,s2 : String) : String;
    function QDeptJikg(s1,s2 : String) : String;
    function QCodeDisp(s1,s2 : String) : String;

  end;

type sText = record
     empno : string[4];
end;

var
  PIE3031cForm: TPIE3031cForm;
  empText     : sText;
  ErrorHelp   : array[0..255] of char;
  HomeDir     : string;
  loadCount   : integer;      {인사경력로드 건수}
  DacomCount  : integer;      {인사경력로드 데이콤 건수}
  sqlstr      : AnsiString;
  payrachdate : string;
implementation

{$R *.DFM}
uses datelib,  Calen1,  Pass, codeText, forgnum, {timeftp,}
     kylib1, PIE3032A, PIE3033A, PIE3034A;

procedure TPIE3031cForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\insacode.cod','',0);
 with QText do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where (codeid = ''I001'' or codeid= ''I002'' ) or ');
      sql.add('      (codeid = ''I031'' or codeid= ''I034'' ) or ');
      sql.add('      (codeid = ''I035'' or codeid= ''I039'' ) or ');
      sql.add('      (codeid = ''I101'' or codeid= ''I300'' ) or ');
      sql.add('      (codeid = ''I112'' or codeid= ''I113'' ) or ');
      sql.add('      (codeid = ''I114'' or codeid= ''I115'' ) or ');
      sql.add('      (codeid = ''I211'' or codeid= ''I225'' ) or ');
      sql.add('      (codeid = ''I231'' or codeid= ''I232'' ) or ');
      sql.add('      (codeid = ''I221'' or codeid= ''I160'' ) or ');
      sql.add('      (codeid = ''I602'' or codeid= ''I603'' ) or ');
      // 3. 수정일 : 1999.07.28
      sql.add('      (codeid = ''I040'') or ');
      sql.add('      (codeid = ''I016'') or ');
      sql.add('      (codeid = ''I015'') or ');
      sql.add('      (codeid = ''I012'') or ');
      sql.add('      (codeid = ''I011'') or ');
      sql.add('      (codeid = ''I036'' or codeid= ''I611'' ) or codeid = ''I702'' or');
      sql.add('      (codeid = ''I120'')');  //노조원 구분
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
         codeToText('',str,1);
         next;
      end;
      QText.close;
 end;
 codeToText('','',2);
end;

Function TPIE3031cForm.QempDisp(str : string) : string;
begin
   result := '';
   if trim(str) = '' then system.exit;
   Qmas.close;
   Qmas.Sql.clear;
   Qmas.Sql.Add('select empno, korname from pimpmas where empno = :lempno OR korname = :lempno ');
   Qmas.ParamByName('lempno').AsString := str;
   Qmas.Open;
   if Qmas.recordCount > 0 then
   begin
     result := Qmas.FieldByName('korname').AsString;
   end
   else
     result := '미등록사원';
   Qmas.close;
end;

function TPIE3031cForm.QDeptDisp(s1,s2 : String) : String;
{부서명을 가져온다..}
var
  str : string;
begin
   if trim(s2) = '' then
   begin
     QDeptDisp := '';
     System.exit;
   end;
{
   if FreeDept = False then
   begin
      Qdept.Close;
      Qdept.Parambyname('lorg').AsString  := s1;
      Qdept.Parambyname('ldept').AsString := s2;
      Qdept.Open;
      if trim(Qdept.FieldByName('DeptName').AsString) = ''  then
        QdeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
      else
//        QdeptDisp := Qdept.FieldByName('DeptName').AsString;
        QdeptDisp := Qdept.FieldByName('DeptNaME').AsString;
   end
   else
   begin
      str := TextDeptDisp(s1,s2,HomeDir+'\insacode.dep');
      if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
                        else QDeptDisp := str;
   end;
}
   with Qdept do
   begin
     Close;
     ParamByName('lorg').AsString  := Trim(S1);
     ParamByName('ldept').AsString := Trim(S2);
     Open;
     if Eof then
        Result := '부서코드에러'
     else
        Result := Qdept.FieldByName('DeptNaME').AsString;
   end;
end;

function TPIE3031cForm.QDeptJikg(s1,s2 : String) : String;
{부서명을 가져온다..}
var
  str : string;
begin
   if trim(s2) = '' then
   begin
     QDeptJikg := '';
     System.exit;
   end;
{
   if FreeDept = False then
   begin
      Qdept.Close;
      Qdept.Parambyname('lorg').AsString  := s1;
      Qdept.Parambyname('ldept').AsString := s2;
      Qdept.Open;
      if trim(Qdept.FieldByName('DeptNa3').AsString) = ''  then
//        QdeptJikg := '부서코드('+s2+') '+'조직차수('+s1+')'
        QdeptJikg := ''
      else
        QdeptJikg := Qdept.FieldByName('DeptNa3').AsString;
   end
   else
   begin
      str := TextDeptDisp(s1,s2,HomeDir+'\insacode.dep');
      if trim(str) = '' then QDeptJikg := '부서코드('+s2+') '+'조직차수('+s1+')'
                        else QDeptJikg := str;
   end; }
   with Qdept do
   begin
     Close;
     ParamByName('lorg').AsString  := Trim(S1);
     ParamByName('ldept').AsString := Trim(S2);
     Open;
     if Eof then
        Result := '직무그룹코드에러'
     else
        Result := Qdept.FieldByName('DeptNa3').AsString;
   end;
end;


// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..
function TPIE3031cForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if Copy(s2,1,1) = '-' then
  begin
    Result := s2;
    System.Exit;
  end;

  if trim(s2) <> '' then
  begin
{   if FreeCheck = False then
   begin
     QCode.Close;
     QCode.Parambyname('lcodeid').AsString  := s1;
     QCode.Parambyname('lcodesub').AsString := s2;
     QCode.Open;
     QCodeDisp := Qcode.FieldByName('CodeName').AsString;
     if trim(Qcode.FieldByName('CodeName').AsString) = '' then
       QcodeDisp := '('+s2+')';
   end
   else begin
     str := TextCodeDisp(s1,s2,HomeDir+'\insacode.cod');
     QCodeDisp := str;
     if trim(str) = '' then QcodeDisp := '('+s2+')';
   end;
 end else QCodeDisp := ''; }
    with QCode do
    begin
      Close;
      ParamByName('lcodeid').AsString  := Trim(S1);
      ParamByName('lcodesub').AsString := Trim(S2);
      Open;
      if EOF then
        Result := ''
      else
        Result := FieldByName('CodeName').AsString;
    end;
  end
  else
    Result := '';
end;

procedure TPIE3031cForm.BexitClick(Sender: TObject);
{종료버턴을 누를경우}
begin
  if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then begin
     close;
  end;
end;

procedure TPIE3031cForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FileExists(HomeDir+'\list\pia1060c.tmp') = True then
      DeleteFile(PChar(HomeDir+'\list\pia1060c.tmp'));
   codeToText(HomeDir+'\insacode.cod','',3);
   codeToText(HomeDir+'\insacode.dep','',3);
end;

// 폼에 관련된 사항들..
procedure TPIE3031cForm.FormCreate(Sender: TObject);
begin
  start     := 0;
  Dataempno := False;
  EnterKey  := 1;     {누르지 않았다..}
  C_RunSave := 1;     {실행}
end;

procedure TPIE3031cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  pempno   := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);

  gu1 := 1;  gu3 := 1;
  G_11Click(G_11);
  G_31Click(G_31);
  G_41Click(G_43);    //초기치로 모두제외 (97.11.6)수정
  empno1.SetFocus;
end;

procedure TPIE3031cForm.FormPaint(Sender: TObject);
var
 i : integer;
begin
  if start = 0 then
  begin
       start := 1;
       Application.Processmessages;

       OraConnect;

       Lempno.Caption   := Pkorname + '(' + Pempno+')';
       Lsysdate.Caption := fn_GetDateStr;
{
       if copy(Pgrade,2,1) > 'C' then
       begin
            MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
            close;
       end;
}
       with Q_date do
       begin
           Close;
           Sql.Clear;
           Sql.Text := 'select Value3, Value4 from pimvari           '+
                       ' where gubun = ''00'' and sgubun = ''0001''  ';
           Open;
           payrachdate  := Fields[0].AsString;
       end;


       with Q_date do
       begin
           Close;
           Sql.Clear;
           Sql.Text := 'select to_char(sysdate,''YYYYMMDDHH24MISSD'') from dual';
           Open;
           CurDate  := Fields[0].AsString;
       end;

       with Q_date do
       begin
           Close;
           Sql.Clear;
           Sql.Text := 'select max(a.yearpaynum) byearpaynum '+
                       ' from pkhyphis a, pkcpbas b                                 '+
                       ' where substr(a.yearpaynum,1,4) = substr(b.yearpaynum,1,4)-1';
           Open;
           if Fields[0].AsString = '' then
               bYearPayNum := '0000'
           else
               bYearPayNum := Fields[0].AsString;
           Close;
       end;

       (* 부문담당자 확인 *)
       if not CheckOfAdmin(pempno) then
       begin
         MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
         Close;
       end;

       with QAdm do
       begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT SUBSTRB(SECTCODE,1,1) CODE FROM PICHARE ');
         Sql.Add(' WHERE EMPNO = ''' +pempno+ ''' ');
         Sql.Add('   AND USEYN = ''Y'' ');

         Open;

         f_SECTCODE := QAdm.FieldByName('CODE').AsString;
       end;

       baseDate.Text := CurDate;

     //=================================================================================
     // 30.95    2004.04.14  정규용   자체         코드파일 다운 부분 제거
     //=================================================================================
     //  FreeCheck := DiskSpaceCheck;
     //  HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
     //  SendMessage(hp.handle,WM_PAINT,0,0);
     //  if FreeCheck = True then MakeTextFile;
     //=================================================================================
       HelpDsr.Caption := '';


       if MyPasString(cmdline, ',', 16) <> '' then
     {  개인인사종합,요약 열람에서 해당 사원번호를 받아 인사기록 요약표를
        출력한다. 인사팀 하병수 대리 요청 1999.3.17 }
       begin
        empno1.text :=   MyPasString(cmdline, ',', 16);
        empno2.text :=   MyPasString(cmdline, ',', 16);
       // showmessage(cmdline);
        timer1.enabled := true;
       end;
  end;
end;

procedure TPIE3031cForm.G_11Click(Sender: TObject);
{사원번호순/부서직급순을 클릭했을 경우}
{화일,입력사번순을 클릭했을 경우 }
var
  i : integer;
begin
  {im1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  im4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   1 : im1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : im2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : im3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   4 : begin
       im4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
       Try
         for i := 1 to 50 do empnostr[i] := '';
         pia1064cForm := Tpia1064cForm.Create(Self);
         pia1064cForm.ShowModal;
       Finally
         pia1064cForm.Free;
       End;
       end;
  end;
  gu1 := TPanel(Sender).HelpContext;}

  ImageList1.GetBitmap(0, im1.Picture.Bitmap);
  ImageList1.GetBitmap(0, im2.Picture.Bitmap);
  ImageList1.GetBitmap(0, im3.Picture.Bitmap);
  ImageList1.GetBitmap(0, im4.Picture.Bitmap);
  case TPanel(Sender).HelpContext of
   1 : ImageList1.GetBitmap(1, im1.Picture.Bitmap);
   2 : ImageList1.GetBitmap(1, im2.Picture.Bitmap);
   3 : ImageList1.GetBitmap(1, im3.Picture.Bitmap);
   4 : begin
       ImageList1.GetBitmap(1, im4.Picture.Bitmap);
       Try
         for i := 1 to 50 do empnostr[i] := '';
         pia1064cForm := Tpia1064cForm.Create(Self);
         pia1064cForm.ShowModal;
       Finally
         pia1064cForm.Free;
       End;
       end;
  end;
  im1.Refresh;
  im2.Refresh;
  im3.Refresh;
  im4.Refresh;
  gu1 := TPanel(Sender).HelpContext;
end;

procedure TPIE3031cForm.G_31Click(Sender: TObject);
{작성대상을 클릭했을 경우 }
begin
  {dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   1 : dm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : dm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : dm3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   4 : dm4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  gu3 := TPanel(Sender).HelpContext;}

  ImageList1.GetBitmap(0, dm1.Picture.Bitmap);
  ImageList1.GetBitmap(0, dm2.Picture.Bitmap);
  ImageList1.GetBitmap(0, dm3.Picture.Bitmap);
  ImageList1.GetBitmap(0, dm4.Picture.Bitmap);
  case TPanel(Sender).HelpContext of
   1 : ImageList1.GetBitmap(1, dm1.Picture.Bitmap);
   2 : ImageList1.GetBitmap(1, dm2.Picture.Bitmap);
   3 : ImageList1.GetBitmap(1, dm3.Picture.Bitmap);
   4 : ImageList1.GetBitmap(1, dm4.Picture.Bitmap);
  end;
  dm1.Refresh;
  dm2.Refresh;
  dm3.Refresh;
  dm4.Refresh;
  gu3 := TPanel(Sender).HelpContext;
end;

procedure TPIE3031cForm.G_41Click(Sender: TObject);
begin
  {em1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  em2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  em3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  em4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  em5.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
  case TPanel(Sender).HelpContext of
   1 : em1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   2 : em2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   3 : em3.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   4 : em4.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   //5 : em5.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
  end;
  gu4 := TPanel(Sender).HelpContext;}

  ImageList1.GetBitmap(0, em1.Picture.Bitmap);
  ImageList1.GetBitmap(0, em2.Picture.Bitmap);
  ImageList1.GetBitmap(0, em3.Picture.Bitmap);
  ImageList1.GetBitmap(0, em4.Picture.Bitmap);
  ImageList1.GetBitmap(0, em5.Picture.Bitmap);
  case TPanel(Sender).HelpContext of
   1 : ImageList1.GetBitmap(1, em1.Picture.Bitmap);
   2 : ImageList1.GetBitmap(1, em2.Picture.Bitmap);
   3 : ImageList1.GetBitmap(1, em3.Picture.Bitmap);
   4 : ImageList1.GetBitmap(1, em4.Picture.Bitmap);
   5 : ImageList1.GetBitmap(1, em5.Picture.Bitmap);
  end;
  em1.Refresh;
  em2.Refresh;
  em3.Refresh;
  em4.Refresh;
  em5.Refresh;
  gu4 := TPanel(Sender).HelpContext;
end;

procedure TPIE3031cForm.DataTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{작성조건 키 제어}
begin
if not(ssShift  in Shift) then
begin
  if (Key = vk_Tab) or (Key = vk_Return) then
  begin
    HelpDsr.Caption := '';
    case TMaskEdit(Sender).Tag of
      1 : begin
          if EnterKey <> 0 then empno2.Setfocus;
          EnterKey := 1;
          empno2.Text := empno1.Text;
          end;
      2 : begin
          deptcode1.SetFocus;
          Dataempno := True;
          end;
      3 : begin
          deptcode2.SetFocus;
          deptcode2.Text := deptcode1.Text;
          end;
      4 : paycl1.SetFocus;
      5 : begin
          paycl2.SetFocus;
          paycl2.Text := paycl1.Text;
          end;
      6 : filenm.SetFocus;
      7 : basedate.SetFocus;
      8 : empno1.SetFocus;
    end; {case end}
  end; {inner if end}
end {if end}
else
begin
  if (Key = vk_Tab) or (Key = vk_Return) then
  begin
    HelpDsr.Caption := '';
    case TMaskEdit(Sender).Tag of
      1 : basedate.Setfocus;
      2 : empno1.SetFocus;
      3 : empno2.SetFocus;
      4 : deptcode1.SetFocus;
      5 : deptcode2.SetFocus;
      6 : paycl1.SetFocus;
      7 : paycl2.SetFocus;
      8 : filenm.SetFocus;
    end; {case end}
  end; {inner if end}
end; {else end}
end;

procedure TPIE3031cForm.EnterKeyPress(Sender: TObject; var Key: Char);
{소리제거용}
begin
 if key = chr(13) then key := chr(0);
end;


// 출력물을 화면애 나타낸다..
procedure TPIE3031cForm.BscreenClick(Sender: TObject);
var
  i, k : integer;
  str, helpstr : string;
begin
  AssignFile(tFile,HomeDir+'\list\pia1060c.tmp');  {임시 화일을 생성한다..}
  System.ReWrite(tFile);

  if (Gu1 = 1) or (Gu1 = 2) then
  begin
    if QmasExecute = False then
    begin
      System.Close(tFile);
      wordPad := False; System.Exit;
    end;

    Run_Text_Create;
  end;

  {입력사번순일경우}
  if Gu1 = 4 then begin
     PageCnt := 0; k := 0;
     for i := 1 to 50 do
         if empnostr[i] <> '' then inc(PageCnt);
     for i := 1 to pageCnt do begin
       if i <> PageCnt then
          Gauge1.progress := (i*100) div PageCnt else Gauge1.Progress := 100;
       UpdateWindow(panel3.handle);
       Qmas .Close;
       Qmas.Sql.Clear;
       Qmas.Sql.Add('select * from pimpmas where empno = :lempno');
       Qmas.ParamByName('lempno').AsString := empnostr[i];
       Qmas.Open;
       if Qmas.RecordCount > 0 then begin
          Run_Text_Create; inc(k);
       end;
     end;
     Qmas.Close; pageCnt := k;
     if pageCnt = 0 then begin
        MessageBox(handle,'해당되는 데이타가 없습니다..(확인요망)','확  인',MB_OK or $0020);
        empno1.SetFocus;  System.Close(tFile);
        wordPad := False; System.Exit;
     end;
  end;

  {화일사번순일 경우}
  if Gu1 = 3 then begin
     if FileExists(Filenm.Text) = False then   begin
        MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
        Filenm.SetFocus; System.Exit;
     end;
     AssignFile(eFile,Filenm.Text); System.ReSet(eFile);
     pagecnt := 0;
     while not EOF(efile) do begin
       Readln(eFile,str); inc(pagecnt);
     end; // 총읽은갯수를 파악한다..
     system.Close(efile);

     i := 1; k := 0;
     AssignFile(eFile,Filenm.Text); System.ReSet(eFile);
     while not EOF(efile) do begin
       Readln(eFile,str);    // 텍스테이타를 읽어온다..
       empText.empno := PasString(str,',',1);
       if pageCnt <> i then
          Gauge1.progress := (i*100) div PageCnt else Gauge1.Progress := 100;
       UpdateWindow(panel3.handle);
       Qmas.Close; Qmas.Sql.Clear;
       Qmas.Sql.Add('select * from pimpmas where empno = :lempno');
       Qmas.ParamByName('lempno').AsString := empText.empno;
       Qmas.Open;
       if Qmas.RecordCount > 0 then begin Run_Text_Create; inc(k);  end;
       inc(i);
    end;
    Qmas.Close;  System.Close(eFile);
    pageCnt := k;
    if pageCnt = 0 then begin
       MessageBox(handle,'해당되는 데이타가 없습니다..(확인요망)','확  인',MB_OK or $0020);
       empno1.SetFocus;  System.Close(tFile);
       wordPad := False; System.Exit;
    end;
  end;
  System.Close(tFile);
  HelpHint('추출된 자료를 출력합니다 !!..');

  if TBitBtn(Sender).Name = 'Bprint'  then begin
     Report1.Print;
     helpstr := '작업이 완료되었습니다 !!.';
  end;
  if TBitBtn(Sender).Name = 'Bscreen' then begin
     Report1.Preview;
     helpstr := '작업이 완료되었습니다 !!.';
  end;
  if TbitBtn(Sender).Name = 'Btext'   then begin
     Fsave.Execute;
     if trim(FSave.FileName) <> '' then Form_TextFile(FSave.FileName);
     helpstr := '작업이 완료되었습니다 !!. (결과화일 ==> ' + FSave.FileName + ')';
  end;
  if TbitBtn(Sender).Name = 'Bexcel'  then begin
     Fsave.Execute;
     if trim(FSave.FileName) <> '' then excelFile(FSave.FileName);
     helpstr := '작업이 완료되었습니다 !!. (결과화일 ==> ' + FSave.FileName + ')';
  end;
  HelpHint(helpstr); Gauge1.Progress := 0;
  //empno1.SetFocus;
  Screen.Cursor := crDefault;
end;

{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
 1.11   1998.07.25    김혜진  전(98.7.22)   정규직에서 임원으로 승격할 경우 사번이 변동되지 않도록 발령냄.
                                            이에 따라, 임원입사일을 empdate로, 정규직입사일을 firempdate로 등록.
                                            근속년수등을 계산, 출력할 때는 최초입사일부터(firempdate)
 }
procedure TPIE3031cForm.Run_Text_Create;
{조건에 맞는출력물을 텍스트화일로 만든다..}
var
   cnt,i     : integer;
   ty,tm     : integer;
   ankikan,cal_day       : string[6];
   str,strJeonim         : string;
   tCarfrdate,tCartodate : String;

  procedure DacomRepl(x : integer; y: integer);
  begin
      pancode   [x] := Dancode    [y];   //Dacom 자료 최종발령
      panfrdate [x] := Danfrdate  [y];
      pantodate [x] := Dantodate  [y];
      ppaycl    [x] := Dpaycl     [y];
      ppayra    [x] := Dpayra     [y];
      ppayra2   [x] := Dpayra2    [y];
      porgnum   [x] := Dorgnum    [y];
      pdeptcode [x] := Ddeptcode  [y];
      pmark1    [x] := Dmark1     [y];
      pmark2    [x] := Dmark2     [y];
      pmark3    [x] := Dmark3     [y];
  end;

begin
   helpHint('기본인사 화일을 읽고 있는 중입니다 !!..');
   cnt := 1;
 //   dacom자료출력여부  comgubun = (1:dacom, 2:dst, 3:hanaro)
  if   Dacomgu.checked  then
       sqlcommand1 := ' and comgubun= ''3'' '
  else sqlcommand1 := '';
//
   {추출된 데이타를 텍스트화일에 저장한다..}
   while not Qmas.EOF do
   begin
     if gu1 <= 2 then
     begin {사번순,부서/직급순일경우만 해당}
       if PageCnt <> cnt then
         Gauge1.progress := (cnt*100) div PageCnt else Gauge1.Progress := 100;
       UpdateWindow(panel3.handle);
     end;

     with Qmas,tData do begin
     //
       if   Dacomgu.checked  then
            temp_orgempdate := FieldByName('orgempdate').AsString
       else temp_orgempdate := FieldByName('empdate').AsString;
    //
       empno       := FieldByName('empno').AsString;
       korname     := FieldByName('korname').AsString;
       chnname     := FieldByName('chnname').AsString;    //2002.08.19 shm 추가 정세영과장님 요청
       deptname	   := QdeptDisp(FieldByName('orgnum').AsString,FieldByName('deptcode').AsString);
       jikdeptname := Qdeptjikg(FieldByName('orgnum').AsString,FieldByName('deptcode').AsString);
       payranm	   := QcodeDisp('I113',FieldByName('payra').AsString);
       empdate	   := FieldByName('empdate').AsString;	    {최초입사일}
       Groupempdate:= FieldByName('Groupempdate').AsString; {그룹입사일} //dsa2000  2010.06. Add

       if  FieldByName('trlimfrdate').AsString <> ''  then
           trlimfrto  :=     copy(FieldByName('trlimfrdate').AsString,3,2)+'.'+   {전보제한기간}
                             copy(FieldByName('trlimfrdate').AsString,5,2)+'.'+
                             copy(FieldByName('trlimfrdate').AsString,7,2)+'~'+
                             copy(FieldByName('trlimtodate').AsString,3,2)+'.'+
                             copy(FieldByName('trlimtodate').AsString,5,2)+'.'+
                             copy(FieldByName('trlimtodate').AsString,7,2)
           else  trlimfrto := '';

//     조직전보일... 2000.05.10 추가
       realtrdate := FieldByName('realtrdate').AsString; // 조직전보일
       offtrdate  := FieldByName('offtrdate').AsString; // 전보일

                     //98.03.13 추가
       jobplace   := QcodeDisp('I160',FieldByName('jobplace').AsString);  {현근무지 }
       licalkind  := QcodeDisp('I231',FieldByName('licalkind').AsString); {자격선임 }
       paycldate  := FieldByName('paycldate').AsString;
       orgempdate := FieldByName('orgempdate').AsString;                     {1.11 하나로 입사일}
       empcode	  := Qcodedisp('I101',FieldByName('empcode').AsString);   {입사구분}

{30.00     98.01.05    김혜진    직위,직급코드변경,호봉,직렬삭제    하나로신인사재개발
       paygr1	  := copy(QcodeDisp('I112',FieldByName('paycl').AsString),1,6)+'-'+
                     FormatFloat('#0',FieldByName('paygr').AsFloat);      //직급+호봉

       paygr2	  := copy(QcodeDisp('I112',FieldByName('emppaycl').AsString),1,6)+'-'+
                     FormatFloat('#0',FieldByName('emppaygr').AsFloat);     //입사시 직급,호봉
       jobline := QcodeDisp('I115',FieldByName('jobline').AsString);  //입사직렬
}
       paygr1	  := QcodeDisp('I112',FieldByName('paycl').AsString);      {직급}

       // 3. 수정일 : 1999.07.28
       //paygr2	  := QcodeDisp('I112',FieldByName('emppaycl').AsString);     //입사시 직급

       //입사시 직급/호봉
       paygr2	  := QcodeDisp('I112',FieldByName('emppaycl').AsString) + '-' +
                     FieldByName('emppaygr').AsString;
       jobline    := QcodeDisp('I115',FieldByName('jobgun').AsString);  //입사직군

       if  FieldByName('cardate').AsString <> '' then
           cardate    := copy(FieldByName('cardate').AsString,1,4)+'.'+         //경력일
                         copy(FieldByName('cardate').AsString,5,2)+'.'+
                         copy(FieldByName('cardate').AsString,7,2)
       else cardate   := '';

       empjobplace:= QcodeDisp('I160',FieldByName('empjobplace').AsString); //입사근무지
       ability	  := FieldByName('ability').AsString;                       // 특기
//       korage     := '('+FieldByName('korage').AsString+'세)' ;            // 연령
       korage     := '('+FieldByName('usaage').AsString+'세)' ;            // 연령       //30.02
       juminid	  := FieldByName('juminid').AsString;                      // 주민번호
       usaageSex  := FormatFloat('#0',FieldByName('usaage').AsFloat)+'('+
                     QcodeDisp('I039',FieldByName('sex').AsString)+')';	    // 나이,성별
       regaddr    := FieldByName('regaddr').AsString;                       // 본적
       telno      := FieldByName('telno').AsString;                         // 전화
       curaddr    := FieldByName('curaddr').AsString;                       // 현주소
       bornarea   := QcodeDisp('I001',FieldByName('bornarea').AsString) + ' ]';    //출생지

       if FieldByName('marrigeyn').AsString = 'Y' then  marrigeyn  := '기혼'
       else marrigeyn  := '미혼';                                        // 혼인여부

       if (FieldByName('marrigeyn').AsString   =  'Y') and
          (FieldByName('weddingdate').AsString <> '')  then                      //결혼기념일
             weddingdate :=  copy(FieldByName('weddingdate').AsString,1,4)+'.'+
                             copy(FieldByName('weddingdate').AsString,5,2)+'.'+
                             copy(FieldByName('weddingdate').AsString,7,2)
       else  weddingdate := '';

       if  FieldByName('birthday').AsString <> ''  then                      //생년월일
             birthday  :=   copy(FieldByName('birthday').AsString,1,4)+'.'+
                            copy(FieldByName('birthday').AsString,5,2)+'.'+
                            copy(FieldByName('birthday').AsString,7,2)
       else  birthday  := '';

       if  FieldByName('birthday').AsString <> ''  then
           birthgubun := FieldByName('birthgubun').AsString
       else
           birthgubun := '';

       armykind	  := QcodeDisp('I031',FieldByName('armykind').AsString); {군별}

       if  FieldByName('armyfrdate').AsString  <> ''  then
           armyfrto   := copy(FieldByName('armyfrdate').AsString,1,4)+'.'+
                         copy(FieldByName('armyfrdate').AsString,5,2)+'.'+
                         copy(FieldByName('armyfrdate').AsString,7,2)+'~'+
                         copy(FieldByName('armytodate').AsString,1,4)+'.'+
                         copy(FieldByName('armytodate').AsString,5,2)+'.'+
                         copy(FieldByName('armytodate').AsString,7,2)
       else armyfrto := '';

       pstate     := QcodeDisp('I114',FieldByName('pstate').AsString);
       if  copy(FieldByName('pstate').AsString,1,1)  = '2' then  begin {파견 }
           if  FieldByName('lsefrdate').AsString <> ''  then
               psdate := copy(FieldByName('lsefrdate').AsString,1,4)+'.'+
                         copy(FieldByName('lsefrdate').AsString,5,2)+'.'+
                         copy(FieldByName('lsefrdate').AsString,7,2)+'~'+
                         copy(FieldByName('lsetodate').AsString,1,4)+'.'+
                         copy(FieldByName('lsetodate').AsString,5,2)+'.'+
                         copy(FieldByName('lsetodate').AsString,7,2)
                else psdate := '';
       end else
       if  copy(FieldByName('pstate').AsString,1,1)  = '3' then  begin {교육}
           if  FieldByName('edufrdate').AsString <> ''  then
               psdate := copy(FieldByName('edufrdate').AsString,1,4)+'.'+
                         copy(FieldByName('edufrdate').AsString,5,2)+'.'+
                         copy(FieldByName('edufrdate').AsString,7,2)+'~'+
                         copy(FieldByName('edutodate').AsString,1,4)+'.'+
                         copy(FieldByName('edutodate').AsString,5,2)+'.'+
                         copy(FieldByName('edutodate').AsString,7,2)
                else psdate := '';
       end else
       if  copy(FieldByName('pstate').AsString,1,1)  = '7' then  begin {휴직}
           if  FieldByName('lrfrdate').AsString <> ''  then
               psdate := copy(FieldByName('lrfrdate').AsString,1,4)+'.'+
                         copy(FieldByName('lrfrdate').AsString,5,2)+'.'+
                         copy(FieldByName('lrfrdate').AsString,7,2)+'~'+
                         copy(FieldByName('lrtodate').AsString,1,4)+'.'+
                         copy(FieldByName('lrtodate').AsString,5,2)+'.'+
                         copy(FieldByName('lrtodate').AsString,7,2)
                else psdate := '';
        end else
        if  (copy(FieldByName('pstate').AsString,1,1)  = '8') or
             (copy(FieldByName('pstate').AsString,1,1)  = '9') then  begin {퇴직}
               if  FieldByName('retdate').AsString <> ''  then
               psdate := copy(FieldByName('retdate').AsString,1,4)+'.'+
                         copy(FieldByName('retdate').AsString,5,2)+'.'+
                         copy(FieldByName('retdate').AsString,7,2)
               else
                psdate := ''
        end  else
        if  FieldByName('pstate').AsString  = '60'  then  begin
            QueryPihpstate(Qmas.FieldByName('empno').AsString);  {정직발령사항 Rtn}
            if Qann.Eof = True then Break;
            if Qann.FieldByName('anfrdate').AsString <> ''  then
               psdate := copy(FieldByName('anfrdate').AsString,1,4)+'.'+
                         copy(FieldByName('anfrdate').AsString,5,2)+'.'+
                         copy(FieldByName('anfrdate').AsString,7,2)+'~'+
                         copy(FieldByName('antodate').AsString,1,4)+'.'+
                         copy(FieldByName('antodate').AsString,5,2)+'.'+
                         copy(FieldByName('antodate').AsString,7,2)
               else
                 psdate := '';
        end  else
             psdate := '';
       bcaryy     := FormatFloat('00',FieldByName('bcaryy').AsFloat);
       bcarmm     := FormatFloat('00',FieldByName('bcarmm').AsFloat);

       prnDate    := copy(Lsysdate.caption,1,4)+'.'+
                     copy(Lsysdate.caption,6,2)+'.'+
                     copy(Lsysdate.caption,9,2);
       exduym     := FormatFloat('00',FieldByName('exdutyy').AsFloat)+' 년 '+
                     FormatFloat('00',FieldByName('exdutmm').AsFloat)+' 월';

       // 1. 내용   : 출력양식변경에 의한 수정
       // 2. 수정자 : 김승회
       // 3. 수정일 : 1999.07.28
       // begin

       // 입사기수
       empterm      := '';
       if FieldByName('empterm').AsString <> '' then
          empterm := FieldByName('empterm').AsString + ' 기';
       lschgr       := QcodeDisp('I221',FieldByName('lschgr').AsString);
       remark       := QcodeDisp('I040',FieldByName('remark').AsString);
// 1.20  일반직 사원.
       if (copy(empno,1,1) = 'Y') or (copy(empno,1,1) = 'P') Then
         tjobduty     := QcodeDisp('I702',FieldByName('tjobduty').AsString)
       else
         tjobduty     := FieldByName('tjobduty').AsString;

       height       := FormatFloat('#,##0',FieldByName('height').AsFloat) + ' cm';
       weight       := FormatFloat('#,##0',FieldByName('weight').AsFloat) + ' kg';
       blood        := FieldByName('blood').AsString;
       religion     := QcodeDisp('I002',FieldByName('religion').AsString);
       habit        := FieldByName('habit').AsString;
       ability      := FieldByName('ability').AsString;
       armycl       := QcodeDisp('I034',FieldByName('armycl').AsString);
       armyfield    := QcodeDisp('I035',FieldByName('armyfield').AsString);
       armydis      := QcodeDisp('I036',FieldByName('armydis').AsString);

       armyfrdate   := '';
       if FieldByName('armyfrdate').AsString <> '' then
          armyfrdate := copy(FieldByName('armyfrdate').AsString,1,4) + '.' +
                        copy(FieldByName('armyfrdate').AsString,5,2) + '.' +
                        copy(FieldByName('armyfrdate').AsString,7,2);

       armytodate   := '';
       if FieldByName('armytodate').AsString <> '' then
          armytodate := copy(FieldByName('armytodate').AsString,1,4) + '.' +
                        copy(FieldByName('armytodate').AsString,5,2) + '.' +
                        copy(FieldByName('armytodate').AsString,7,2);

       // 비정규학력
        helpHint('('+Qmas.FieldByName('korname').AsString+') 비정규학력 화일을 읽고 있는 중입니다 !!..');
        for i := 1 to 4 do
        begin
        eduorgnm[i]   := '';
        educontent[i] := '';
        edudate[i]    := '';
        end;

        sqlstr := 'select * ' + #13 +
                  'from   pimeduc' + #13 +
           format('where  empno = ''%s'' ',[FieldByName('empno').AsString]) + #13 +
                  'order by edufrdate desc';
        QryGen.close;
        QryGen.Sql.Clear;
        QryGen.Sql.Add(sqlstr);
        QryGen.Open;

        i := 1;
        while not QryGen.eof do
        begin
        if i > 4 then
           system.break;

        eduorgnm[i]  := QryGen.FieldByName('eduorgnm').AsString;
        educontent[i]:= QryGen.FieldByName('educontent').AsString;
        edudate[i]   := copy(QryGen.FieldByName('edufrdate').AsString,3,2)+'.'+
                        copy(QryGen.FieldByName('edufrdate').AsString,5,2)+'~'+
                        copy(QryGen.FieldByName('edutodate').AsString,3,2)+'.'+
                        copy(QryGen.FieldByName('edutodate').AsString,5,2);
        inc(i);
        QryGen.Next;
        end;
        QryGen.Close;

        scgubun := QcodeDisp('I016',FieldByName('scgubun').AsString);
        scentdate := '';
        if FieldByName('scentdate').AsString <> '' then
           scentdate := copy(FieldByName('scentdate').AsString,1,4) + '.' +
                        copy(FieldByName('scentdate').AsString,5,2) + '.' +
                        copy(FieldByName('scentdate').AsString,7,2);

        scpredate := '';
        if FieldByName('scpredate').AsString <> '' then
           scpredate := copy(FieldByName('scpredate').AsString,1,4) + '.' +
                        copy(FieldByName('scpredate').AsString,5,2) + '.' +
                        copy(FieldByName('scpredate').AsString,7,2);

        scenddate := '';
        if FieldByName('scenddate').AsString <> '' then
           scenddate := copy(FieldByName('scenddate').AsString,1,4) + '.' +
                        copy(FieldByName('scenddate').AsString,5,2) + '.' +
                        copy(FieldByName('scenddate').AsString,7,2);

        bohungubun := QcodeDisp('I015',FieldByName('bohungubun').AsString);
        bohunnm    := FieldByName('bohunnm').AsString;
        bohunrel   := QcodeDisp('I211',FieldByName('bohunrel').AsString);

        obskind    := QcodeDisp('I012',FieldByName('obskind').AsString);
        obsgr      := QcodeDisp('I011',FieldByName('obsgr').AsString);
        obsstate   := FieldByName('obsstate').AsString;

// 30.93   2003.10.12    이민용  오종석(인사팀)  노조원구분, 세부구분 수정
{// ==============전임여부 한글로 표기 2003.06.09 정규용 추가===========================================
        if FieldByName('nojeonyn').AsString = 'Y' then
           strJeonim  := '전임'
        else
           strJeonim  := '비전임';
// ==============노조사항 추가 2003.06.03 정규용 추가===========================================
        if  FieldByName('nogubun').AsString <> '' then
          begin
            noGubun := QcodeDisp('I120',FieldByName('nogubun').AsString);
            if (FieldByName('nojeonyn').AsString <> '') and (FieldByName('nogubun').AsString <> '10' )then
               noGubun := noGubun + '(' + strJeonim + ')'
          end;
//=============================================================================================== }
// ............. 급여사항을 텍스트화일로 변환한다..............................................

// 3. 수정일 : 1999.07.28
if Qmas.FieldByName('pstate').AsString < '80' then
   cal_day := DateCal2(Qmas.FieldByName('orgempdate').AsString,baseDate.Text)
else
   cal_day := DateCal2(Qmas.FieldByName('orgempdate').AsString, Qmas.FieldByName('retdate').AsString);

tmpday  :=  (StrToInt(copy(cal_day,1,2)) * 12) + StrToInt(copy(cal_day,3,2));

helpHint('('+Qmas.FieldByName('korname').AsString+') 급여사항 화일을 읽고 있는 중입니다 !!..');
QueryPimjpay(Qmas.FieldByName('empno').AsString);  // 전년도급여사항 Rtn

QueryPimdpay(Qmas.FieldByName('empno').AsString);  //당년도급여사항 Rtn

if gu4 <> 3 then
   begin
     if dpay_amt > 0 then
        danpay_amt  := FormatFloat('#,##0',dpay_amt)+' 원'
     else
        danpay_amt := '';
   end
else
begin
   danpay_amt := '';
   junpay_amt := '';
end;

{..............학력사항을 텍스트화일로 변환한다.............................................}
       helpHint('('+Qmas.FieldByName('korname').AsString+') 학력사항 화일을 읽고 있는 중입니다 !!..');
       QueryPimsch(Qmas.FieldByName('empno').AsString);  {학력사항 Rtn}
       for i := 1 to 4 do begin
           if Qsch.Eof = True then Break;
           schgr[i]     := Qcodedisp('I221',Qsch.FieldByName('schgr').AsString);
           schnm[i]     := Qsch.FieldByName('schnm').AsString;
           schfrtoym[i] := copy(Qsch.FieldByName('schfrym').AsString,3,2)+'.'+
                           copy(Qsch.FieldByName('schfrym').AsString,5,2)+'~'+
                           copy(Qsch.FieldByName('schtoym').AsString,3,2)+'.'+
                           copy(Qsch.FieldByName('schtoym').AsString,5,2);
           majorcode[i] := QcodeDisp('I225',Qsch.FieldByName('majorcode').AsString);
           Qsch.Next;
       end;
       Qsch.Close;
{..........................자격증사항을 텍스트화일로 변환한다....................................}
(*
        helpHint('('+Qmas.FieldByName('korname').AsString+') 자격증사항 화일을 읽고 있는 중입니다 !!..');
        QueryPimLic(Qmas.FieldByName('empno').AsString);  {자격증사항 Rtn}
        for i := 1 to 2 do begin
            if Qlic.Eof = True then break;
            licekind[i]    := QcodeDisp('I231',Qlic.FieldByName('lickind').AsString);
            licgr[i]       := QcodeDisp('I232',Qlic.FieldByName('licgr').AsString);
            licalfield[i]  := Qlic.FieldByName('licalfield').AsString;
            if  Qlic.FieldByName('licgetdate').AsString  <>  ''  then
               licgetdate[i] := copy(Qlic.FieldByName('licgetdate').AsString,1,4)+'.'+
                                copy(Qlic.FieldByName('licgetdate').AsString,5,2)+'.'+
                                copy(Qlic.FieldByName('licgetdate').AsString,7,2)
            else  licgetdate[i] := '';
            Qlic.Next;
        end;
        Qlic.Close;
{..........................외국어사항을 텍스트화일로 변환한다....................................}
        helpHint('('+Qmas.FieldByName('korname').AsString+') 외국어사항 화일을 읽고 있는 중입니다 !!..');
        QueryPimfore(Qmas.FieldByName('empno').AsString);  {외국어증사항 Rtn}
        for i := 1 to 2 do begin
            if Qlic.Eof = True then break;
            if copy(Qlic.FieldByName('examname').AsString,1,1) = '1'  then
               langname[i]   := '영어' //trim(Qlic.FieldByName('langname').AsString);
            else  if  copy(Qlic.FieldByName('examname').AsString,1,1) ='2' then
               langname[i]   := '일어'
            else langname[i]   := '';
            examname[i]   := QcodeDisp('I611',Qlic.FieldByName('examname').AsString);
            examscore[i]  := IntToStr(Qlic.FieldByName('examscore12').AsInteger);
            examdate[i]   := trim(Qlic.FieldByName('examdate').AsString);
            Qlic.Next;
        end;
        Qlic.Close;
{..........................교육항을 텍스트화일로 변환한다....................................}
        helpHint('('+Qmas.FieldByName('korname').AsString+') 교육 화일을 읽고 있는 중입니다 !!..');
        QueryPimtran(Qmas.FieldByName('empno').AsString);  {교육사항 rtn}
        for i := 1 to 5 do begin
            if Qlic.Eof = True then break;
            if   Qlic.FieldByName('edufrdate').AsString  <> ''  then
              edufrtodate[i]  :=  copy(Qlic.FieldByName('edufrdate').AsString,3,2)+'.'+
                                  copy(Qlic.FieldByName('edufrdate').AsString,5,2)+'.'+
                                  copy(Qlic.FieldByName('edufrdate').AsString,7,2)+'~'+
                                  copy(Qlic.FieldByName('edutodate').AsString,3,2)+'.'+
                                  copy(Qlic.FieldByName('edutodate').AsString,5,2)+'.'+
                                  copy(Qlic.FieldByName('edutodate').AsString,7,2)
            else
             edufrtodate[i]  := '';
//30.05 shm 2001.07.11
//             edutype[i]    :=  QcodeDisp('I602',Qlic.FieldByName('edutype').AsString);
//             edugubun[i]   :=  QcodeDisp('I603',Qlic.FieldByName('edugubun').AsString);
//             edutime[i]    :=  Qlic.FieldByName('edutime').AsString;
//             eduscore[i]   :=  Qlic.FieldByName('eduscore').AsString;
//             educourse[i]  :=  Qlic.FieldByName('educourse').AsString;

             edutype[i]    :=  Qlic.FieldByName('currname').AsString;
             edugubun[i]   :=  Qlic.FieldByName('edutype').AsString;

             edutime[i]    :=  Qlic.FieldByName('eduterm').AsString + Qlic.FieldByName('eduunit').AsString;
             eduscore[i]   :=  Qlic.FieldByName('edupoint').AsString;
             educourse[i]  :=  Qlic.FieldByName('edudesc').AsString;


            Qlic.Next;
        end;
        Qlic.Close;
*)
{..........................입사전경력사항을 텍스트화일로 변환한다.....................................}
       helpHint('('+Qmas.FieldByName('korname').AsString+') 입사전경력사항 화일을 읽고 있는 중입니다 !!..');
       QueryPimCari(Qmas.FieldByName('empno').AsString);  {입사전사항 Rtn}

       tCarfrdate:='00000000';
       tCartodate:='00000000';

       for i := 1 to 4 do begin
           if Qcar.Eof = True then break;
           carplace[i] := Qcar.FieldByName('carplace').AsString;
           carymd[i]   := copy(Qcar.FieldByName('carfrdate').AsString,3,2)+'.'+
                          copy(Qcar.FieldByName('carfrdate').AsString,5,2)+'~'+
                          copy(Qcar.FieldByName('cartodate').AsString,3,2)+'.'+
                          copy(Qcar.FieldByName('cartodate').AsString,5,2);

           // 3. 수정일 : 1999.07.28
           // 개별경력기간산정
//=========================================================================================
// 30.97   2004.09.10    정규용  자체            입사전 경력 개월수 계산 오류 수정
//===========================================================================================
           if Length(Trim(Qcar.FieldByName('carfrdate').AsString)) <> 8 then
           begin
             if Length(Trim(Qcar.FieldByName('carfrdate').AsString)) = 6 then
                tCarfrdate := Trim(Qcar.FieldByName('carfrdate').AsString)+'01'
             else
                MessageDlg('['+Qmas.FieldByName('empno').AsString+']'+
                           ' '+Qmas.FieldByName('korname').AsString+
                           '의 입사전 경력FROM일자에 오류가 있습니다.'+
                            #13+#10+''+#13+#10+'확인하시기 바랍니다.'+#13+#10+
                            ''+#13+#10+'입사전 경력개월수는 출력되지 않습니다.', mtError, [mbOK], 0);
           end
           else tCarfrdate := Trim(Qcar.FieldByName('carfrdate').AsString);

           if Length(Trim(Qcar.FieldByName('cartodate').AsString)) <> 8 then
           begin
             if Length(Trim(Qcar.FieldByName('cartodate').AsString)) = 6 then
                tCartodate := Trim(Qcar.FieldByName('cartodate').AsString)+'01'
             else
                MessageDlg('['+Qmas.FieldByName('empno').AsString+']'+
                           ' '+Qmas.FieldByName('korname').AsString+
                           '의 입사전 경력TO일자에 오류가 있습니다.'+
                            #13+#10+''+#13+#10+'확인하시기 바랍니다.'+#13+#10+
                            ''+#13+#10+'입사전 경력개월수는 출력되지 않습니다.', mtError, [mbOK], 0);
           end
           else tCartodate := Trim(Qcar.FieldByName('cartodate').AsString);
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //   str := idatecal(Qcar.FieldByName('carfrdate').AsString,Qcar.FieldByName('cartodate').AsString);
           str := idatecal(tCarfrdate,tCartodate);
           carym[i] := copy(str,1,2)+ ' 년' + copy(str,3,2) + ' 개월';

           cardept[i]  := Qcar.FieldByName('cardeptnm').AsString;
           carjobnm[i] := Qcar.FieldByName('carjobnm').AsString;
           Qcar.Next;
        end;
        Qcar.Close;
(*
{....................가족사항을 텍스트화일로 변환한다.........................................}
       helpHint('('+Qmas.FieldByName('korname').AsString+') 가족사항 화일을 읽고 있는 중입니다 !!..');
       QueryPimFami(Qmas.FieldByName('empno').AsString);  {가족사항 Rtn}
       for i := 1 to 6 do begin
           if QFami.Eof = True then break;
           facode[i]  := Qcodedisp('I211',QFami.FieldByName('facode').AsString);
           faname[i]  := QFami.FieldByName('faname').AsString;
           fabirth[i] := copy(QFami.FieldByName('fabirthdate').AsString,1,4)+'.'+
                         copy(QFami.FieldByName('fabirthdate').AsString,5,2)+'.'+
                         copy(QFami.FieldByName('fabirthdate').AsString,7,2);
//           if QFami.FieldByName('facode').AsString ='01' then
//              fabirth[i] := ;
           faschgr[i] := QcodeDisp('I221',QFami.FieldByName('faschgr').AsString);
           faplace[i] := QFami.FieldByName('faplace').AsString;
           QFami.Next;
       end;
       QFami.Close;

{..........................인사고과사항을 텍스트화일로 변환한다....................................}
        if (gu4 <> 1) and (gu4 <> 3) then begin
           helpHint('('+Qmas.FieldByName('korname').AsString+') 인사고과 화일을 읽고 있는 중입니다 !!..');
           QueryPimingo(Qmas.FieldByName('empno').AsString);  {인사고과 Rtn}
           for i := 1 to 6 do begin
               if Qlic.Eof = True then break;
               intodate[i] := copy(Qlic.FieldByName('intodate').AsString,1,4);
               ipaycl[i]   := QcodeDisp('I112',Qlic.FieldByName('paycl').AsString);

               if (Qlic.FieldByName('e1korname').AsString <> '')  or
                  (Qlic.FieldByName('e1score').AsFloat > 0) then
                    ie1scr[i]   := trim(Qlic.FieldByName('e1korname').AsString)+'/'+
                                   FormatFloat('##0.00',Qlic.FieldByName('e1score').AsFloat);
               if (Qlic.FieldByName('e2korname').AsString <> '')  or
                    (Qlic.FieldByName('e2score').AsFloat > 0) then
                     ie2scr[i]  := trim(Qlic.FieldByName('e2korname').AsString)+'/'+
                                   FormatFloat('##0.00',Qlic.FieldByName('e2score').AsFloat);
               adjclass[i] := FormatFloat('##0.00',Qlic.FieldByName('adjscore').AsFloat)+' / '+
                              Qlic.FieldByName('adjclass').AsString;
               Qlic.Next;
           end;
           Qlic.Close;
        end else begin
           for i := 1 to 6 do begin
               intodate[i] := '';
               ie1scr[i]   := '';
               adjclass[i] := '';      ie2scr[i] :='';
               ipaycl[i]   := '';
           end;
        end;
{..........................상향평가사항을 텍스트화일로 변환한다....................................}
        if (gu4 <> 1) and (gu4 <> 3) then begin
           helpHint('('+Qmas.FieldByName('korname').AsString+') 상향평가 화일을 읽고 있는 중입니다 !!..');
           QueryPimappr(Qmas.FieldByName('empno').AsString);  {사향평가 Rtn}
           for i := 1 to 3 do begin
               if Qlic.Eof = True then break;
               aptodate[i] := copy(Qlic.FieldByName('aptodate').AsString,1,4);
               apaycl[i]   := QcodeDisp('I112',Qlic.FieldByName('paycl').AsString);
               ascore[i]   := FormatFloat('##0.00',Qlic.FieldByName('apprscore').AsFloat);
               if Qlic.FieldByName('apprclass').AsString = 'A'  then
                  aclass[i] := '우수'
               else if  Qlic.FieldByName('apprclass').AsString = 'B'  then
                  aclass[i] := '보통'
               else if  Qlic.FieldByName('apprclass').AsString = 'C'  then
                  aclass[i] := '미흡';
               Qlic.Next;
           end;
           Qlic.Close;
        end else begin
           for i := 1 to 3 do begin
               aptodate[i] := '';
               apaycl[i] := '';
               ascore[i] := '';
               aclass[i]   := '';
           end;
        end;
{...............................포상사항을 텍스트화일로 변환한다....................................}
        helpHint('('+Qmas.FieldByName('korname').AsString+') 포상사항 화일을 읽고 있는 중입니다 !!..');
        QueryPimRewa(Qmas.FieldByName('empno').AsString);  {포상사항 Rtn}
        for i := 1 to 2 do begin
            if Qrew.Eof = True then break;
            rekindnm[i] := QRew.FieldByName('rekindnm').AsString;
            reorgnm[i]  := QRew.FieldByName('reorgnm').AsString;
            redate[i]   := copy(QRew.FieldByName('redate').AsString,1,4)+'.'+
                           copy(QRew.FieldByName('redate').AsString,5,2)+'.'+
                           copy(QRew.FieldByName('redate').AsString,7,2);
            QRew.Next;
        end;
{...............................징계사항을 텍스트화일로 변환한다......................................}
        if (gu4 <> 2) and (gu4 <> 3) then begin
           helpHint('('+Qmas.FieldByName('korname').AsString+') 징계사항 화일을 읽고 있는 중입니다 !!..');
           QueryPimPuni(Qmas.FieldByName('empno').AsString);  {징계사항 Rtn}
           for i := 1 to 2 do begin
               if QPun.Eof = True then break;
               pukindnm[i] := QPun.FieldByName('pukindnm').AsString;
               pucause[i]  := QPun.FieldByName('pucause').AsString;
               pudate[i]   := copy(QPun.FieldByName('pudate').AsString,1,4)+'.'+
                              copy(QPun.FieldByName('pudate').AsString,5,2)+'.'+
                              copy(QPun.FieldByName('pudate').AsString,7,2);
               QPun.Next;
           end;
           Qpun.Close;
        end else begin
           for i := 1 to 2 do begin
               pukindnm[i] := '';
               pucause[i]  := '';
               pudate[i]   := '';
           end;
        end;
 *)
{...............................발령사항을 텍스트화일로 변환한다...................................}
       {1. 발령구분
           if 발령구분 = 파견 or 교육
              - "[발령구분명]" 형태로 출력
           else -발령구분명 출력
        2. 직급,직위를 출력
        3. 발령사항
           if 발령구분 = 급호조정,징계,파견,교육,휴직 : 비고 1출력
           else 부서명출력
           if 직급 < '10' 발령사항 spaces
        4. 발령일자(기간)
           if 인사상태 > 입사포기(80)
              - 발령일 from 출력
           if 발령구분 = 파견,교육 발령일 from,to 출력
           그밖의 경우는 발령일 from,to 기간을 계산(일수가 15일 이상이면 1월로 계산
                         발령일 from,기간 (년,월)을 출력}
        helpHint('('+Qmas.FieldByName('korname').AsString+') 인사발령사항 화일을 읽고 있는 중입니다 !!..');
        QueryPihAnno(Qmas.FieldByName('empno').AsString);  {발령사항 Rtn}

//      Dacom 발령사항
        for i := 1 to PRTROW do begin
           if (i <= 18) and (pancode[i] = '') then begin
               if Dancode[1] <> '' then begin
                  pancode[18] := '-';   //구분선
                  DacomRepl(19,   1);   //Dacom 최종발령
                  DacomRepl(20,   2);   //Dacom 첫발령

                  break;
               end;
           end
           else if (i > 18) and (pancode[i] = '') then begin
               if Dancode[1] <> '' then begin
                  pancode   [17] := pancode    [i-1];   //하나로 최종발령
                  panfrdate [17] := panfrdate  [i-1];
                  pantodate [17] := pantodate  [i-1];
                  ppaycl    [17] := ppaycl     [i-1];
                  ppayra    [17] := ppayra     [i-1];
                  ppayra2   [17] := ppayra2    [i-1];
                  porgnum   [17] := porgnum    [i-1];
                  pdeptcode [17] := pdeptcode  [i-1];
                  pmark1    [17] := pmark1     [i-1];
                  pmark2    [17] := pmark2     [i-1];
                  pmark3    [17] := pmark3     [i-1];

                  pancode[18] := '-';   //구분선
                  DacomRepl(19,   1);   //Dacom 최종발령
                  DacomRepl(20,   2);   //Dacom 첫발령

                  break;
               end;
           end
           else if (i = 20) and (pancode[i] <> '') then begin
               if Dancode[1] <> '' then begin
                  pancode   [17] := pancode    [20];   //하나로 최종발령
                  panfrdate [17] := panfrdate  [20];
                  pantodate [17] := pantodate  [20];
                  ppaycl    [17] := ppaycl     [20];
                  ppayra    [17] := ppayra     [20];
                  ppayra2   [17] := ppayra2    [20];
                  porgnum   [17] := porgnum    [20];
                  pdeptcode [17] := pdeptcode  [20];
                  pmark1    [17] := pmark1     [20];
                  pmark2    [17] := pmark2     [20];
                  pmark3    [17] := pmark3     [20];

                  pancode[18] := '-';   //구분선
                  DacomRepl(19,   1);   //Dacom 최종발령
                  DacomRepl(20,   2);   //Dacom 첫발령

                  break;
               end;
           end;
        end;

 {발령사항 출력내용}
        for i := 1 to PRTROW do begin
            if pancode[i] = '' then Continue;
            if pancode[i] = '-' then
              begin
                tData.ancode[i] := '-';
                Continue;
              end;
            ankikan := '000000'; {발령일 From - To }
            if (pancode[i] = '411') or (pancode[i] = '451') then
               tData.ancode[i]  := '  ['+QcodeDisp('I300',pancode[i])+']'
            else tData.ancode[i]  := QcodeDisp('I300',pancode[i]);

            tData.anpaycl[i]  := QcodeDisp('I112',ppaycl[i]);
            tData.anpayra[i]  := QcodeDisp('I113',ppayra[i]);
            tData.anpayra2[i] := QcodeDisp('I113',ppayra2[i]);
                   //파견,휴직,급호조정일경우 발령사항 = 비고1+비고2+비고3 (98.03.04)
            if (pancode[i] = '341') or (pancode[i] = '411') or
               (pancode[i] = '451') or (pancode[i] = '511') or
               (copy(pancode[i],1,1) = '6') then
            begin
                {   2001.03.19    윤형식  하병수          파견관련 사유2,사유3 출력안함.}
                //  tData.andept[i]  := trim(pmark1[i])+trim(pmark2[i])+trim(pmark3[i])
               if   pancode[i] = '411' then tData.andept[i]  := trim(pmark1[i])
               else                         tData.andept[i]  := trim(pmark1[i])+trim(pmark2[i])+trim(pmark3[i]);
            end
            else tData.andept[i]  := QDeptDisp(porgnum[i],pdeptcode[i]);

            //if ppaycl[i] < '10' then tData.andept[i]  := '';    //인사과 최효락시 요청으로 삭제함
            ankikan := DateCal2(panfrdate[i],pantodate[i]);

            if (Copy(pancode[i],1,1) = '8') or (pancode[i] = '619') or (pancode[i] = '629') then
                ankikan := '0 0'; //2007.08. 퇴직발령코드일 경우 기간 출력되지 않도록...정정명 요청으로 추가. dsa2000

            if trim(ankikan) <> '0 0' then
            begin
               tData.anDate[i] := copy(panfrdate[i],1,4)+'.'+
                                  copy(panfrdate[i],5,2)+'.'+
                                  copy(panfrdate[i],7,2)+'('+
                                  copy(ankikan,1,2)+'년'+copy(ankikan,3,2)+'월)';
            end
            else
            begin
                tData.anDate[i] := copy(panfrdate[i],1,4)+'.'+
                                   copy(panfrdate[i],5,2)+'.'+
                                   copy(panfrdate[i],7,2);
            end;            //ShowMessage(trim(ankikan)+'/'+tData.anDate[i]);

            if (pancode[i] = '411') or (pancode[i] = '451') then begin
                tData.andate[i]  := copy(panfrdate[i],1,4)+'.'+
                                    copy(panfrdate[i],5,2)+'.'+
                                    copy(panfrdate[i],7,2)+'~'+
                                    copy(pantodate[i],1,4)+'.'+
                                    copy(pantodate[i],5,2)+'.'+
                                    copy(pantodate[i],7,2);
            end;

{ 버전     수정일      수정자   관련근거       수정내용
--------------------------------------------------------------------------------
 1.11   1998.07.25    김혜진  전(98.7.22)  정규직에서 임원으로 승격할 경우 사번이 변동되지 않도록 발령냄.
                                           이에 따라, 임원입사일을 empdate로, 정규직입사일을 firempdate로 등록.
                                           근속년수등을 계산, 출력할 때는 최초입사일부터(firempdate) }
            {총경력 계산}
            {Dacom 입사일과 하나로 입사일로 총 근무 년수 확인 }
            if Qmas.FieldByName('pstate').AsString < '80' then
               caramt := DateCal2(temp_orgempdate,baseDate.Text)
            else
               caramt := DateCal2(temp_orgempdate,
                                  Qmas.FieldByName('retdate').AsString);
        end; {for}
     end; {with Qmas,tData do begin}
     tData.gubun := 'D'; System.write(tFile,tData);
     Qmas.Next; inc(cnt);
//     if Qmas.Eof <> True then begin
//        tData.gubun := 'P'; System.write(tFile,tData);
//     end;
   end; {while not Qmas.EOF do begin}
end;

procedure TPIE3031cForm.QueryPimsch(str : string);
{학력사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 4 do begin
      tData.schgr[i]     := '';
      tData.schnm[i]     := '';
      tData.schfrtoym[i] := '';
      tData.majorcode[i] := '';
  end;

  with Qsch do begin
    close;
    sql.clear;
    sql.add('select empno,schgr,schnm,schfrym,schtoym,majorcode from pimscho ');
    sql.add('where (empno = :lempno) order by schgr desc,schtoym desc');
    ParamByName('lempno').AsString := str;
    Open;
  end;
end;

procedure TPIE3031cForm.QueryPimFami(str : string);
{가족사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 6 do begin
      tData.facode[i]     := '';
      tData.faname[i]     := '';
      tData.fabirth[i]    := '';
      tData.faschgr[i]    := '';
      tData.faplace[i]    := '';
  end;

  with Qfami do begin
    close;
    sql.clear;
    sql.add('select empno,facode,faname,fabirthdate,faschgr,faplace from pimfami ');
    sql.add('where (empno = :lempno) order by facode,fabirthdate');
    ParamByName('lempno').AsString := str;
    Open;
  end;
end;


procedure TPIE3031cForm.Carr_rtn(a_ancode,a_anfrdate,a_antodate : string; c : integer);
{세부경력 -Rtn}
{해당자료를 메모리에 저장한다.
 -발령구분,발령일From,To: Argument로 넘어온값 저장
 -직급,직위,조직차수,부서코드,비고1 : 현자료의 값을 저장}
{인사요약경력 로드건수를 확인한다..}
begin
// 하나로
   if Qann.FieldByName('comgubun').AsString = '3' then begin   // 하나로
       pancode[c]   := a_ancode;
       panfrdate[c] := a_anfrdate;
       pantodate[c] := a_antodate;
       ppaycl[c]    := Qann.FieldByName('paycl').AsString;
    //---------------------
       ppayra[c]    := Qann.FieldByName('payra').AsString;
       ppayra2[c]   := Qann.FieldByName('payra2').AsString;
       porgnum[c]   := Norgnum;
       pdeptcode[c] := Ndept;
       pmark1[c]    := Qann.FieldByName('mark1').AsString;
       if Qann.FieldByName('mark2').AsString <> ''  then
          pmark2[c]    := ','+trim(Qann.FieldByName('mark2').AsString);
       if Qann.FieldByName('mark3').AsString <> ''  then
          pmark3[c]    := ','+trim(Qann.FieldByName('mark3').AsString);
       if loadCount < PRTROW then
         inc(loadcount);
{       if a_ancode = '251' then
         begin
           pancode[loadcount] := '-';
           if loadCount < PRTROW then
             inc(loadcount);
         end;}
   end
// 데이콤
   else begin   // 데이콤
       if DacomCount = 0 then begin    //최종발령
         Dancode[1]   := a_ancode;
         Danfrdate[1] := a_anfrdate;
         Dantodate[1] := a_antodate;
         Dpaycl[1]    := Qann.FieldByName('paycl').AsString;
      //---------------------
         Dpayra[1]    := Qann.FieldByName('payra').AsString;
         Dpayra2[1]    := Qann.FieldByName('payra2').AsString;
         Dorgnum[1]   := Norgnum;
         Ddeptcode[1] := Ndept;
         Dmark1[1]    := Qann.FieldByName('mark1').AsString;
         if Qann.FieldByName('mark2').AsString <> ''  then
            Dmark2[1]    := ','+trim(Qann.FieldByName('mark2').AsString);
         if Qann.FieldByName('mark3').AsString <> ''  then
            Dmark3[1]    := ','+trim(Qann.FieldByName('mark3').AsString);
         DacomCount := 1;
      end
      else begin  //첫발령
         Dancode[2]   := a_ancode;
         Danfrdate[2] := a_anfrdate;
         Dantodate[2] := a_antodate;
         Dpaycl[2]    := Qann.FieldByName('paycl').AsString;
      //---------------------
         Dpayra[2]    := Qann.FieldByName('payra').AsString;
         Dpayra2[2]    := Qann.FieldByName('payra2').AsString;
         Dorgnum[2]   := Norgnum;
         Ddeptcode[2] := Ndept;
         Dmark1[2]    := Qann.FieldByName('mark1').AsString;
         if Qann.FieldByName('mark2').AsString <> ''  then
            Dmark2[2]    := ','+trim(Qann.FieldByName('mark2').AsString);
         if Qann.FieldByName('mark3').AsString <> ''  then
            Dmark3[2]    := ','+trim(Qann.FieldByName('mark3').AsString);
      end;
   end;
end;

procedure TPIE3031cForm.QueryPihpstate(str : string);
{정직인사발령 사항을 읽어온다..}
begin
  with Qann do begin
    close;
    sql.clear;
    sql.add('select  max(anfrdate) antodate  from pihanno ');
    sql.add(' where  empno = :lempno and ');
    sql.add('       (ancode = ''641'' or (ancode = ''600'' and andetcode = ''64'') ');
    sql.add(sqlcommand1);
    sql.add(' ) ');
    ParamByName('lempno').AsString := str;
    Open;
  end;
end;

procedure TPIE3031cForm.QueryPihAnno(str : string);
{발령사항을 읽어온다..}
var
  i,nCheck,nCond : integer;
  pa_flag,hu_flag,neworg_flag, n211_flag : integer;
  keyreorg  : string[3];
  keydept   : string[5];
  keypayra  : string[3];
  annoto_pa : string[8];
//  annoto_hu : string[8];
//  annofr    : string[8];
  annoto    : string[8];
  yyyy,mm,dd : integer;
  MyDate: TDateTime;

//const
// tancode   : array[1..6] of string[3] = ('336','337','346','656','452','454');

begin

for i := 1 to PRTROW do begin  {메모리의 초기화}
    tData.ancode[i]   := '';
    tData.andate[i]   := '';
    tData.anpaycl[i]  := '';
    tData.anpayra[i]  := '';
    tData.anpayra2[i] := '';
    tData.andept[i]   := '';
    pancode[i]   := '';
    panfrdate[i] := '';
    pantodate[i] := '';
    ppaycl[i]    := '';
    ppayra[i]    := '';
    ppayra2[i]   := '';
    porgnum[i]   := '';
    pdeptcode[i] := '';
    pmark1[i]    := '';
    pmark2[i]    := '';
    pmark3[i]    := '';
end;

for i := 1 to 2 do begin  {메모리의 초기화}
    Dancode[i]   := '';
    Danfrdate[i] := '';
    Dantodate[i] := '';
    Dpaycl[i]    := '';
    Dpayra[i]    := '';
    Dpayra2[i]   := '';
    Dorgnum[i]   := '';
    Ddeptcode[i] := '';
    Dmark1[i]    := '';
    Dmark2[i]    := '';
    Dmark3[i]    := '';
end;

with Qann do begin {사원번호,발령경신여부가 'y'자료만 읽어온다..}
 Qann.close;
 Qann.sql.clear;
 Qann.sql.add('select EMPNO, KORNAME, COMGUBUN, ANNONO, ANSEQNO,                                         ');
 Qann.sql.add('       ANFRDATE, ANTODATE, ANCODE, ANDETCODE,                                             ');
 Qann.sql.add('       ORGNUM, DEPTCODE, JOBGUN, PAYCL, PAYGR,                                            ');
 Qann.sql.add('	   case when(anfrdate >= :lpayrachdate ) then payra else '''' end payra,                 ');
 Qann.sql.add('	   case when(anfrdate <  :lpayrachdate ) then payra else '''' end payra2,                ');
 Qann.sql.add('	   JOBLINE, MARK1, MARK2, MARK3,                                                         ');
 Qann.sql.add('	   ADDEPTCODE, ADPAYRA, RPAYGR, LPAYGR, SPAYGR,                                          ');
 Qann.sql.add('	   HOFRDATE,HOTODATE, RETSAYU1, RETSAYU2,                                                ');
 Qann.sql.add('	   TCONTR, TCONTRAMT,TJOBDUTY, TTYPE, TCOMPANY,                                          ');
 Qann.sql.add('	   BANNONO, BANFRDATE, BANTODATE, BANCODE, BANDETCODE,                                   ');
 Qann.sql.add('	   BORGNUM, BDEPTCODE, BPAYCL, BPAYGR, BPAYRA, ANUPDYN,                                  ');
 Qann.sql.add('	   ANUPDTIME, WRITETIME, WRITEEMP                                                        ');
 Qann.sql.add(' from pihanno where (empno = :lempno and anupdyn = ''Y'') and                             ');
 Qann.sql.add('(ancode not in (''336'',''337'',''346'',''656'',''452'',''454'',''935'',''995'',''955'')  '); //995 추가 shm 2001.07.24
 Qann.sql.add(' and EMPNO||ANNONO||ANFRDATE||ANCODE <> ''M1412012000120120101211''                       '); //M141 추가 LHY 2012.02.13
 Qann.sql.add(sqlcommand1);
 Qann.sql.add(' )  ');
 Qann.Sql.add('order by comgubun desc,anfrdate desc,annono desc,ancode desc');
 Qann.ParamByName('lpayrachdate').AsString := payrachdate;
 Qann.ParamByName('lempno').AsString := str;
 Open;
 {출력용 메모리에 쿼리한 결과를 저장한다..}
 {단  발령구분이 승급 336,승호 337,호봉조정 346, 강호 656, 교육연장 452,교육복귀 454인
  자료와 발령구분이 급호조정(341)인데 직급이 변동없으면 제외한다.}
 {첫번째 자료 변수 annoto에 현재일자 저장}
 annoto := baseDate.Text;
 pa_flag   := 0; hu_flag := 0; neworg_flag := 0;
 n211_flag := 0;   //211(12) 출력용 임시 flag
 DacomCount:= 0;   //Dacom 최종발령 출력 여부
 loadcount := 1;
 while not Qann.Eof do begin
   if loadcount > PRTROW then break;

// 최종 발령이 전보_조직전보(211_12)면 출력(원래는 출력안함)
   if loadcount > 1 then
      n211_flag := 1;

  npayra   := Qann.FieldByName('payra').AsString;
  norgnum  := Qann.FieldByName('orgnum').AsString;
  ndept    := Qann.FieldByName('deptcode').AsString;
  nCheck := 0;
//  for j := 1 to 6 do
//     if FieldByName('ancode').AsString = tAncode[j] then inc(nCheck);
  if FieldByName('ancode').AsString = '341' then
     if FieldByName('paycl').AsString = FieldByName('bpaycl').AsString then inc(nCheck);

  if nCheck > 0 then begin Qann.Next; Continue; end;
  {이루틴은 변칙적으로 사용하였다..****주의를 헤서 보기 바란다..***********}
  nCond := 0;
  if FieldByName('ancode').AsString = '414' then  nCond := 1;
  if FieldByName('ancode').AsString = '412' then  nCond := 2;
  if FieldByName('ancode').AsString = '411' then  nCond := 3;
  if FieldByName('ancode').AsString = '451' then  nCond := 4;
  if FieldByName('ancode').AsString = '514' then  nCond := 5;
  if FieldByName('ancode').AsString = '512' then  nCond := 6;
  if FieldByName('ancode').AsString = '511' then  nCond := 7;
  if copy(FieldByName('ancode').AsString,1,1) = '2' then  nCond := 8;
  if copy(FieldByName('ancode').AsString,1,1) = '6' then  nCond := 9;
  if ((FieldByName('ancode').AsString = '311') or (FieldByName('ancode').AsString = '322')) or
      ((copy(FieldByName('ancode').AsString,1,1) = '1') and
       ((copy(FieldByName('ancode').AsString,3,1) = '1') or
        (copy(FieldByName('ancode').AsString,3,1) = '4'))) then nCond := 10;

  {nCond 조건에 맞는 데이타를 추출한다..}
  {nCond 1 -> 발령구분이 파견복귀 이면
              - anonoto_pa에 발령일 from을 저장.
              - pa_flag 1증가}
  {nCond 2 -> 발령구분이 파견연장이면
              - if pa_flag = 0 이면 annoto_pa에 발령일 to를 저장.
              - pa_flag 1증가}
  {nCond 3 -> 발령구분이 파견이면
              - if pa_flag = 0 이면 annoto_pa에 발령일 to를 저장.
              - 세부경력 rtn(발령구분,발령일 From,annoto_pa)
              - pa_flag 0 저장}
  {nCond 4 -> 발령구분이 교육이면
              - 세부경력 rtn(발령구분,발령일 From,발령일 to)}
  {nCond 5 -> 발령구분이 복직이면
              - 세부경력 rtn(발령구분,발령일 From,annoto)
              - annoto에 발령일 from을 1일을 감소하여 저장
              - hu_flag 를 1증가}
  {nCond 6 -> 발령구분이 휴직연장이면
              - if hu_flag = 0 이면 annoto에 발령일 to 저장
              - hu_flag 를 1증가}
  {nCond 7 -> 발령구분이 휴직이면
              - if hu_flag = 0 이면 세부경력 rtn(발령구분,발령일 from,발령일 to)
                else 세부경력 rtn(발령구분,발령일 from,annoto), hu_flag := 0
              - annoto 에 발령일을 1일감소하여 저장}
  {nCond 8 -> 발령구분 첫번째자리가 = '2'이면
              -if (발령구분 = 수습해제) or (발령구분 = 전보 and 발령세부구분 = 조직전보) 일경우는
                  if neworg_flag = 0 이면
                     .keyreorg,keydept,keypayra에 현자료의 값을 저장하고 neworg_flag를 1 증가
              -if (발령구분 = 전보 and 발령세부구분 = 전보) or
                  (발령구분 = 보임해제) or (발령구분 = 보임) 일경우
                  if neworg_flag != 0 이면
                     .현자료의 조직차수,부서코드,직위코드에 keyreorg,keydept,keypayra를 저장
              - 세부경력 rtn(발령구분,발령일 from,annoto)
              - neworg_flag := 0;
              - keyreorg,keydept,keypayra 에 space
              - annotodp 발령일 from 을 1 감소하여 저장}
  {nCond 9 -> if 발령구분 첫번째자리가 = '6' /*징계 */
                 -if 발령구분 세번째자리 = '9'   /*퇴직*/
                     세부경력 rtn(발령구분,발령일 from,annoto)
                  else if 전직급 = 후직급 다음자료 처리
                       else 세부경력 rtn(발령구분,발령일 from,annoto)
                 - annotodp 발령일 from 을 1 감소하여 저장}
  {nCond 10-> if 발령구분 = 승격,직무대리,발령구분첫번째자리가 '1'(신규채용)
                 - if neworg_flag != 0
                   .현자료의 조직차수,부서코드,직위코드에 keyreorg,keydept,keypayra를 저장
                   . neworg_flag := 0;
                   . keyreorg,keydept,keypayra 에 space
                 - 세부경력 rtn(발령구분,발령일 from,annoto)
                 - annotodp 발령일 from 을 1 감소하여 저장}
  {(*) 모든 경우를 제외한 발령구분은
        - 세부경력 rtn(발령구분,발령일 from,annoto)
        - annotodp 발령일 from 을 1 감소하여 저장}
  case nCond of
   1 : begin
//       annoto_pa := FieldByName('anfrdate').AsString;
       annoto_pa := FieldByName('anfrdate').AsString;
       try
         yyyy := strtoint(copy(annoto_pa,1,4));
         mm   := strtoint(copy(annoto_pa,5,2));
         dd   := strtoint(copy(annoto_pa,7,2));
         MyDate := EncodeDate(yyyy, mm, dd);
         annoto_pa := FormatDateTime('yyyymmdd', MyDate-1);
       except
         annoto_pa :='파견복귀일 수정요함';
       end;
       inc(pa_flag);
       end;
   2 : begin
       if pa_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
       inc(pa_flag);
       end;
   3: begin
      if pa_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
      Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto_pa,loadcount);
      pa_flag := 0;
      end;
   4: begin
      Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,
               FieldByName('antodate').AsString,loadcount);
      end;
   5: begin
      Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
      annoto := DateCal1(FieldByName('anfrdate').AsString);
      inc(hu_flag);
      end;
   6: begin
      if FieldByName('antodate').AsString >= baseDate.Text then
           annoto := baseDate.Text
      else begin
           if hu_flag = 0 then
              annoto := FieldByName('antodate').AsString;
      end;
      inc(hu_flag);
      end;
   7: begin
      if hu_flag = 0 then begin
         if FieldByName('antodate').AsString >= baseDate.Text then
             annoto := baseDate.Text
         else annoto := FieldByName('antodate').AsString;
         Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount)
      end
      else begin
           Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
           hu_flag := 0;
           end;
      annoto := DateCal1(FieldByName('anfrdate').AsString);
      end;
   8: begin
      if (FieldByName('ancode').AsString = '288') then begin
         if neworg_flag = 0 then begin
            Keyreorg := Norgnum;
            keydept  := Ndept;
            keypayra := Npayra;
//            inc(neworg_flag);     31.01  내용 참고  (2005.06.15)
         end;
      end
      else if   (((FieldByName('ancode').AsString = '211') and
         (FieldByName('andetcode').AsString = '12')) and
//==========================================================================================================
//조직개편 관련 - 조직전보라도 H07차 조직개편(2000년 11월 17일) 조직전보내용은 강제로 보이게함 (추후 제거)
//                                  최상용 요청         2003.11.17  정규용 하드코딩
        (FieldByName('anfrdate').AsString <> '20031117')) then begin
//==========================================================================================================
         if n211_flag = 0 then begin   // 최종 발령이 전보_조직전보(211_12)면 출력(원래는 출력안함)
            Carr_Rtn(FieldByName('ancode').AsString,
                     FieldByName('anfrdate').AsString,annoto,loadcount);
            annoto := DateCal1(FieldByName('anfrdate').AsString);
         end;
      end
      else if (FieldByName('ancode').AsString = '211')  or
      //      and (FieldByName('andetcode').AsString = '11')     //발령세부구분 11 임원은 세부구분 코드가 없어서 ....
              (FieldByName('ancode').AsString = '228') or (FieldByName('ancode').AsString = '222') or
              (FieldByName('ancode').AsString = '251') then begin
              if neworg_flag <> 0 then begin
                 Norgnum  := keyreorg;
                 Ndept    := keydept;
                 Npayra   := keypayra;
              end;
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
              keyreorg := ''; keydept := ''; keypayra := '';
              neworg_flag := 0;
              annoto := DateCal1(FieldByName('anfrdate').AsString);
      end;
      end;
   9: begin
      if copy(FieldByName('ancode').AsString,3,1) = '9' then
         Carr_Rtn(FieldByName('ancode').AsString,
                  FieldByName('anfrdate').AsString,annoto,loadcount)
      else if FieldByName('paycl').AsString = FieldByName('bpaycl').AsString then begin
              Qann.Next; Continue;
           end else
               Carr_Rtn(FieldByName('ancode').AsString,
                        FieldByName('anfrdate').AsString,annoto,loadcount);
      annoto := DateCal1(FieldByName('anfrdate').AsString);
      end;
  10: begin
{버젼  수정일        작업자  작업근거      작업내용
--------------------------------------------------------------------------------
1.16   1998.08.28    김혜진  전(98.8.27)   명예승격은 출력하지 않도록.
 }
      if (FieldByName('ancode').Asstring='311') and (FieldByName('andetcode').Asstring='41') then
      begin
         Qann.Next;
         continue;
      end;
      if neworg_flag <> 0 then begin
         Norgnum  := keyreorg;
         Ndept    := keydept;
         Npayra   := keypayra;
         keyreorg := ''; keydept := ''; keypayra := '';
         neworg_flag := 0;
      end;
      Carr_Rtn(FieldByName('ancode').AsString,
               FieldByName('anfrdate').AsString,annoto,loadcount);
      annoto := DateCal1(FieldByName('anfrdate').AsString);
      end;
   else begin
          Carr_Rtn(FieldByName('ancode').AsString,
                   FieldByName('anfrdate').AsString,annoto,loadcount);
          annoto := DateCal1(FieldByName('anfrdate').AsString);
        end;
   end; {case nCond of}
   Qann.Next;
  end; {while not Qann.Eof do begin}
 end; {with Qann do begin}
 Qann.Close;
end;

procedure TPIE3031cForm.QueryPimCari(str : string);
{입사전경력사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 4 do begin
      tData.carplace[i]   := '';
      tData.carymd[i]     := '';
      tData.carym[i]      := '';
      tData.cardept[i]    := '';
      tData.carjobnm[i]   := '';
  end;

  with QCar do begin
    close;
    sql.clear;
    sql.add('select * from pimcarr where (empno = :lempno) order by carfrdate desc');
    ParamByName('lempno').AsString := str;
    Open;
  end;
end;

procedure TPIE3031cForm.QueryPimLic(str : string);
{자격증사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.licekind[i]   := '';
      tData.licgr[i]      := '';
      tData.licgetdate[i] :='';
      tData.licalfield[i] :='';
  end;
  with QLic do begin
    close;
    sql.clear;
    sql.add('select * from pimlice where (empno = :lempno) order by licrank');
    ParamByName('lempno').AsString := str;
    Open;
  end;
end;

{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
                                            전년도 급여기준으로 연봉계산, empdate부터 계산.
 -------------------------------------------------------------------------------}
procedure TPIE3031cForm.QueryPimjpay(str : string);
{전년도 급여사항을 읽어온다..}
begin
{
31.00  99.1.5   김혜진  임원은 그대로, 이사대우이하는 연봉내역화일에서 전년연봉을 읽는다.
}
  with QLic do begin
    close;
    sql.clear;
    if Qmas.FieldByName('paycl').Asstring <= '08' then begin //임원이상이면 연봉이 아닌 예전의 것 그대로
      sql.add('select empno,sum(basicamt+infoamt+dutyamt+bbasicamt+binfoamt+bdutyamt+ ');
      sql.add('       +bonusamt+incentamt    ');
      sql.add('       +trainamt+winteramt+homesupamt+sobon)  jun_amt, ');
      sql.add('       sum(ovtmamt+sptmamt+ybonamt+mbonamt+mateamt+partamt+childamt+mcaramt+liceamt+sopay+odamt) gita_amt      ');
      sql.add(' from  pkhphis where (empno = :lempno)                 ');
      sql.add('       and substr(paydate,1,4) = :lpaydate  and  payyn = ''Y'' ');
      sql.add(' group  by  empno ');
      ParamByName('lempno').AsString := str;
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
      ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);

      Open;
      if  Qlic.recordcount <= 0  then begin
         tdata.junpay_amt :=FormatFloat('##,###,###,###',0);
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.junpay_amt  := FormatFloat('##,###,###,###',Qlic.FieldByName('jun_amt').AsFloat)+' 원';
      tdata.jungita_amt  := FormatFloat('##,###,###,###',Qlic.FieldByName('gita_amt').AsFloat)+' 원';
    end  //이사이상
    else begin //전년도연봉은 개인연봉내역화일에서 기본연봉과 업적연봉을 합한값.
//      수정전
//      sql.add('select (TOTPAY)jun_amt ');
//      sql.add(' from  PKHYPHIS where (empno = :lempno)                 ');
//      sql.add('       and YEARPAYNUM = :lpaydate  ');
//       수정안 -->
      sql.add('select (TOTPAY)jun_amt ');
      sql.add(' from  PKHYPHIS where (empno = :lempno)                 ');
      sql.add('       and YEARPAYNUM = :lpaydate  ');
      ParamByName('lempno').AsString := str;
      ParamByName('lpaydate').AsString := bYearPayNum;
      Open;
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}

      if  Qlic.recordcount <= 0  then begin
         tdata.junpay_amt :=FormatFloat('##,###,###,###',0);
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.junpay_amt  := FormatFloat('##,###,###,###',Qlic.FieldByName('jun_amt').AsFloat)+' 원';
      //기타연봉은 급여마스터화일에서 직책수당+식대교통비+가족수당+법정자격수당+복지연금+
      //초과근무+특별근무+연월차수당+자가운전지원금+소급+직책수당
      close;  sql.clear;
      sql.add('select sum(roleamt+mcaramt+mateamt+partamt+childamt+liceamt+bokjisupamt');
      sql.add('        +ovtmamt+sptmamt+ybonamt+mbonamt+odamt+sopay+dutyamt) gita_amt           ');
      sql.add(' from  pkhphis where (empno = :lempno)                 ');
      sql.add('       and substr(paydate,1,4) = :lpaydate  and  payyn = ''Y'' ');
      ParamByName('lempno').AsString := str;
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
       ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
      Open;
      if  Qlic.recordcount <= 0  then begin
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.jungita_amt  := FormatFloat('##,###,###,###',Qlic.FieldByName('gita_amt').AsFloat)+' 원';
   end;// 이사대우 이하
  end;
end;
procedure TPIE3031cForm.QueryPimdpay(str : string);
{31.00  당년 급여사항을 읽어온다..}
var
  i,home_amt,winter_amt,basic_amt,info_amt,duty_amt,tpaygr : integer;
  dpay_amt1  : integer;
  paynum,tpaydate : string;
begin
  dpay_amt := 0;  dpay_amt1 := 0;
  basic_amt:=0;   info_amt :=0;    duty_amt :=0;
  with QLic do begin
    close;
    sql.clear;
    sql.add('select cpaynum   from  pkcpbas ');
    open;
    paynum := FieldByName('cpaynum').AsString;

    close;
    sql.clear;
    sql.add('select  value1,value2   from  pimvari ');
    sql.add(' where  gubun = ''PK'' and  sgubun = ''0001'' ');
    open;
    home_amt   := StrToInt(FieldByName('value1').AsString);
    winter_amt := StrToInt(FieldByName('value2').AsString);

{
 버전     수정일      수정자   관련근거       수정내용
--------------------------------------------------------------------------------
 31.00    99.1.5     김혜진   임원은 그대로계산,이사대우이하는 연봉내역화일에서 읽어온다.
 }
    close;
    sql.clear;
    if Qmas.FieldByName('paycl').AsString <= '08' then begin
      sql.add('select basicamt,infoamt,dutyamt   from  pkcptbl ');
      sql.add(Format(' where paynum = ''%s''  and  paycl = ''%s'' ',
                       [paynum,Qmas.FieldByName('paycl').AsString]));
      Open;
      basic_amt    := FieldByName('basicamt').AsInteger;  //현호봉
      duty_amt  := FieldByName('dutyamt').AsInteger;

      dpay_amt1 := (((basic_amt+ duty_amt)*2)*4) // 정기상여
                     +((basic_amt+duty_amt)*12)//월급여
                     +(home_amt*2)+winter_amt //귀향지원비*2+월동보조비
                     +((basic_amt+duty_amt)*2); //체력단련비(7월,11월)
      close;
      sql.clear;
      sql.add('select max(paydate) paydate from  pkhphis  ');
      sql.add(' where (empno = :lempno) and payyn = ''Y'' ');
      ParamByName('lempno').AsString := str;
      open;
      tpaydate := FieldByName('paydate').AsString;

      close;
      sql.clear;
      sql.add('select (bokjisupamt*12) bokji_amt  ');
      sql.add(' from   pkhphis where (empno = :lempno) and payyn = ''Y'' ');
      sql.add('  and   paydate = :lpaydate ');
      ParamByName('lempno').AsString := str;
      ParamByName('lpaydate').AsString := tpaydate;
      Open;
      dpay_amt := dpay_amt1 + FieldByName('bokji_amt').AsInteger;
    end else begin
//    수정전
//      sql.add('select (TOTPAY)jun_amt ');
//      sql.add(' from  PKHYPHIS where (empno = :lempno)                 ');
//      sql.add('       and YEARPAYNUM = :lpaydate  ');

//    수정안  03/26/2000 9:34오전-->
      sql.add('select (TOTPAY) jun_amt ');
      sql.add(' from  PKHYPHIS a, pkcpbas b where (empno = :lempno)      ');
      sql.add('       and a.YEARPAYNUM = b.yearpaynum  ');
      ParamByName('lempno').AsString := str;
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
//        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4)));
      Open;
      if  recordcount <= 0  then begin
        dpay_amt := 0;
        system.exit;
      end;
      dpay_amt  := FieldByName('jun_amt').Asinteger;
    end;  //이사대우이하

  end;
end;

procedure TPIE3031cForm.QueryPimfore(str : string);
{외국어사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.langname[i]   := '';
      tData.examname[i]   := '';
      tData.examscore[i]  := '';
      tData.examdate[i]   := '';
  end;
  with QLic do begin
    close;
    sql.clear;
    sql.add('select * from pihfore    ');
    //sql.add(' where (empno = :lempno)  and examdate >= :lexamdate');
    sql.add(' where empno = :lempno ');
    sql.add(' order by examdate desc  ');
    ParamByName('lempno').AsString := str;
    //ParamByName('lexamdate').AsString := temp_orgempdate;
    Open;
  end;
end;


procedure TPIE3031cForm.QueryPimtran(str : string);
{교육사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 5 do begin
      tData.edufrtodate[i]    := '';
      tData.educourse[i]      := '';
      tData.edutype[i]        := '';
      tData.edutime[i]        := '';
      tData.eduscore[i]       := '';
      tData.edugubun[i]       := '';
  end;
{  with QLic do begin
    close;
    sql.clear;
    sql.add('select * from pihtran    ');
    sql.add(' where (empno = :lempno) ');
    sql.add('        and  edufrdate >= :ledufrdate ');
    sql.add('  order by edufrdate desc');
    ParamByName('lempno').AsString := str;
    ParamByName('ledufrdate').AsString := temp_orgempdate;
    Open;
  end;}
{
//30.05 shm  2001.07.11
  with QLic do begin
    close;
    sql.clear;
    sql.add('select  a.edufrdate,a.edutodate,a.edudesc,a.eduterm,             ');
    sql.add('        a.eduunit,a.edupoint,b.currname, b.edutype               ');
    sql.add('  from  peduhis a, peducurr b                                    ');
    sql.add(' where  a.currcode = b.currcode and  a.empno = :lempno           ');
    sql.add(' order by a.edufrdate desc                                       ');
    ParamByName('lempno').AsString := str;
    Open;
  end;
}
  //jissi  2009.01.19
  with QLic do begin
    close;
    sql.clear;
    sql.add('select  a.edu_date_from edufrdate,a.edu_date_to edutodate,              ');
    sql.add('        a.edu_title edudesc,a.edu_time eduterm,                         ');
    sql.add('        a.base_time eduunit,a.edu_score edupoint,                       ');
    sql.add('        b.Edu_name currname, b.edu_type edutype                         ');
    sql.add('  from  pedu2item a, pedu2type b                                        ');
    sql.add(' where    a.Edu_type = b.Edu_type(+) and a.empno = :lempno              ');
    sql.add('      and  a.edu_type not in (''8001'',''8002'',''8003'')               ');
    sql.add(' order by a.edu_date_from desc                                          ');
    ParamByName('lempno').AsString := str;
    Open;
  end;

end;

// 인사고과사항을 읽어온다..
procedure TPIE3031cForm.QueryPimingo(str : string);
var
  i : integer;
begin
  for i := 1 to 6 do begin
      tData.intodate[i] := '';
      tData.ipaycl[i]   := '';
      tData.ie1scr[i]   := '';
      tData.ie2scr[i]   := '';
      tData.adjclass[i] := '';
  end;
  with QLic do begin
    close;
    sql.clear;
    sql.add('select intodate,paycl,e1korname,e1score,e2korname,e2score,  ');
    sql.add('       adjclass,adjscore from pihingo ');
    sql.add(' where ( empno = :lempno and adjscore > 0 ) ');
    sql.add('   and  substr(intodate,1,4) >= :lintodate ');
    sql.add('   and  intodate >= :lintodate ');
    sql.add(' order by intodate desc');
    ParamByName('lempno').AsString := str;
    ParamByName('lintodate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-3);
    ParamByName('lintodate').AsString := temp_orgempdate;

    Open;
  end;
end;

// 상향평가사항을 읽어온다..
procedure TPIE3031cForm.QueryPimappr(str : string);
var
  i : integer;
begin
  for i := 1 to 3 do begin
      tData.aptodate[i] := '';
      tData.apaycl[i]   := '';
      tData.ascore[i] := '';
      tData.aclass[i] := '';
  end;
  with QLic do begin
    close;
    sql.clear;
    sql.add('select aptodate,paycl,apprscore,apprclass  from pihappr ');
    sql.add(' where (empno = :lempno) and pappryn = ''Y'' and apprscore > 0 ');
    sql.add('   and  apfrdate >= :lapfrdate ');
    sql.add(' order by aptodate desc');
    ParamByName('lempno').AsString := str;
    ParamByName('lapfrdate').AsString := temp_orgempdate;
    Open;
  end;
end;


procedure TPIE3031cForm.QueryPimRewa(str : string);
{포상사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.rekindnm[i]   := '';
      tData.reorgnm[i]    := '';
      tData.redate[i]     := '';
  end;
  with QRew do begin
    close;
    sql.clear;
    sql.add('select * from pimrewa   ');
    sql.add(' where (empno = :lempno) '); //  and  redate >= :lredate'); 30.05  shm
    sql.add(' order by redate desc');
    ParamByName('lempno').AsString := str;
//    ParamByName('lredate').AsString := temp_orgempdate; 30.05 shm
    Open;
  end;
end;

procedure TPIE3031cForm.QueryPimPuni(str : string);
{징계사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.pukindnm[i]   := '';
      tData.pucause[i]    := '';
      tData.pudate[i]     := '';
  end;
  with QPun do begin
    close;
    sql.clear;
    sql.add('select * from pimpuni  ');
    sql.add(' where (empno = :lempno) and  pudate >= :lpudate  ');
    sql.add(' order by pudate');
    ParamByName('lempno').AsString := str;
    ParamByName('lpudate').AsString := temp_orgempdate;
    Open;
  end;
end;

function TPIE3031cForm.QmasExecute : Boolean;
begin
   {작업조건에 따른 출력물 추출}
   {gu1 = 1 -> 사원번호순으로출력물 추출}
   {gu1 = 2 -> 부서/직급순으로 출력물 추출}
   {gu1 = 3 -> 화일(사번순으로 출력물추출}
   {gu1 = 4 -> 입력사번순으로 출력물 추출}
   QmasExecute := True;
   if gu1 = 1 then begin
      {작성대상에 따른 출력물 추출}
      {gu3 = 1 then 재직자,gu3 = 2 then 휴직자,gu3 = 3 then 퇴직자,gu3 = 4 then 전체 }
      Qmas.Close;
      Qmas.Sql.Clear;
      case gu3 of
       1 : begin
           Qmas.Sql.Add('select * from pimpmas where (empno >= :lempno1 and empno <= :lempno2)');
           Qmas.Sql.Add('                        and (pstate < ''60'') and (deptcode like :lsectcode||''%'') order by empno');
           end;
       2 : begin
           Qmas.Sql.Add('select * from pimpmas where (empno >= :lempno1 and empno <= :lempno2)');
           Qmas.Sql.Add('                        and (pstate >= ''60'' and pstate < ''80'') and (deptcode like :lsectcode||''%'') order by empno ');
           end;
       3 : begin
           Qmas.Sql.Add('select * from pimpmas where (empno >= :lempno1 and empno <= :lempno2)');
           Qmas.Sql.Add('                        and (pstate >= ''80'') and (deptcode like :lsectcode||''%'') order by empno ');
           end;
       4 : Qmas.Sql.Add('select * from pimpmas where (empno >= :lempno1 and empno <= :lempno2) and (deptcode like :lsectcode||''%'') order by empno');
      end;
      Qmas.ParamByName('lempno1').AsString   := empno1.Text;
      Qmas.ParamByName('lempno2').AsString   := empno2.Text;
      Qmas.ParamByName('lsectcode').AsString := f_SECTCODE;
      Qmas.Open;
      PageCnt := QMas.RecordCount;
   end;
   if gu1 = 2 then begin
      {작성대상에 따른 출력물 추출}
      {gu3 = 1 then 재직자,gu3 = 2 then 휴직자,gu3 = 3 then 퇴직자,gu3 = 4 then 전체 }
      Qmas.Close;
      Qmas.Sql.Clear;
      case gu3 of
       1 : begin
           Qmas.Sql.Add('select * from pimpmas where ((deptcode >= :ldept1 and deptcode <= :ldept2) ');
           Qmas.Sql.Add('and (paycl >= :lpaycl1 and paycl <= :lpaycl2) and (pstate < ''60'')) and (deptcode like :lsectcode||''%'') ');
           Qmas.Sql.Add('order by deptcode,paycl,payra,empno');
           end;
       2 : begin
           Qmas.Sql.Add('select * from pimpmas where ( (deptcode >= :ldept1 and deptcode <= :ldept2) ');
           Qmas.Sql.Add('and (paycl >= :lpaycl1 and paycl <= :lpaycl2) and ');
           Qmas.Sql.Add('    (pstate >= ''60'' and pstate < ''80'') ) and (deptcode like :lsectcode||''%'')');
           Qmas.Sql.Add('order by deptcode,paycl,payra,empno');
           end;
       3 : begin
           Qmas.Sql.Add('select * from pimpmas where ((deptcode >= :ldept1 and deptcode <= :ldept2) ');
           Qmas.Sql.Add('and (paycl >= :lpaycl1 and paycl <= :lpaycl2) and (pstate >= ''80'')) and (deptcode like :lsectcode||''%'') ');
           Qmas.Sql.Add('order by deptcode,paycl,payra,empno');
           end;
       4 : begin
           Qmas.Sql.Add('select * from pimpmas where ((deptcode >= :ldept1 and deptcode <= :ldept2) ');
           Qmas.Sql.Add('and (paycl >= :lpaycl1 and paycl <= :lpaycl2) ) and (deptcode like :lsectcode||''%'') ');
           Qmas.Sql.Add('order by deptcode,paycl,payra,empno');
           end;
      end;
      Qmas.ParamByName('ldept1').AsString  := deptcode1.Text;
      Qmas.ParamByName('ldept2').AsString  := deptcode2.Text;
      Qmas.ParamByName('lpaycl1').AsString := paycl1.Text;
      Qmas.ParamByName('lpaycl2').AsString := paycl2.Text;
      Qmas.ParamByName('lsectcode').AsString := f_SECTCODE;
      Qmas.Open;
      PageCnt := QMas.RecordCount;
   end;

   if PageCnt <= 0 then begin
      MessageBox(handle,'해당되는 데이타가 없습니다..(확인요망)','확  인',MB_OK or $0020);
      empno1.SetFocus;
      QmasExecute := False;  {데이타가 없을경우는 작업 끝냄}
   end;
end;

procedure TPIE3031cForm.helpHint(str : string);
begin
   HelpDsr.Caption := str;
   SendMessage(hp.handle,WM_PAINT,0,0);
end;

procedure TPIE3031cForm.EmpmoClick(Sender: TObject);
{사원번호 더블클릭을 할경우}
begin
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
       if TMaskEdit(Sender).Name = 'empno1' then
            FKeyEmpno.EdEmpno.Text := empno1.Text
       else
            FKeyEmpno.EdEmpno.Text := empno2.Text;
       FKeyEmpno.v_Table_Name := 'pkmpmas';
       FKeyEmpno.ShowModal;

       if FKeyEmpno.CloseChk = -1 then Exit;

       if FKeyEmpno.v_KeyEmpno <> '' then
       begin
           if TMaskEdit(Sender).Name = 'empno1' then
           begin
                empno1.Text      := FKeyempno.v_KeyEmpno;
                korname1.Caption := FKeyEmpno.v_KeyKorname;
           end
           else
           begin
                empno2.Text      := FKeyempno.v_KeyEmpno;
                korname2.Caption := FKeyEmpno.v_KeyKorname;
           end;
       end;
  finally
       FKeyEmpno.Free;
  end;
end;

procedure TPIE3031cForm.DeptClick(Sender: TObject);
{부서코드를 더블클릭할 경우}
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.ShowModal;
          if FDeptCode.GSdeptcode <> '' then
          begin
               if TMaskEdit(Sender).Name = 'deptcode1' then
                    deptcode1.Text     := FDeptCode.GSdeptcode
               else deptcode2.Text     := FDeptCode.GSdeptcode;
          end;
     Finally
          FDeptCode.Free;
     End;
end;

procedure TPIE3031cForm.CodeClick(Sender: TObject);
begin
  Fkeycode := TFkeycode.Create(self);
  Try
    case TMaskEdit(Sender).HelpContext of
      0: begin
	  Fkeycode.FormData  := 'BAND코드 열람';
	  Fkeycode.DataVal1  := 'I112';
	  end;
    end;
    Fkeycode.ShowModal;
    if Fkeycode.Code = '' then System.Exit;
    case TMaskEdit(Sender).HelpContext of
      0: begin
           if Fkeycode.Code <> '' then
           begin
              if TMaskEdit(Sender).Name = 'paycl1' then
                   paycl1.Text	 := Fkeycode.Code
              else paycl2.Text	 := Fkeycode.Code;
           end;
         end;
    end;

  Finally
    Fkeycode.Free;
  END;

end;

procedure TPIE3031cForm.CalenClick(Sender: TObject);
begin
 Calendar := TCalendar.Create(Self);
 Try
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then  TMaskEdit(Sender).Text := Calendar.DayCaption;
 Finally
   Calendar.Free;
 End;
end;

procedure TPIE3031cForm.fileselClick(Sender: TObject);
begin
  FileOpen.Execute;
  Filenm.Text := FileOpen.FileName;
  Filenm.SetFocus;
end;

procedure TPIE3031cForm.DataChange(Sender: TObject);
begin
  DataEmpno := True;
end;

procedure TPIE3031cForm.DataExit(Sender: TObject);
var
  str : string;
begin
  if Dataempno = True then
  begin
    if (TmaskEdit(Sender).tag = 1) then
    begin
      str := QempDisp(TmaskEdit(Sender).Text);
      if str <> '미등록사원' then
      begin
        empno1.Text      := TmaskEdit(Sender).Text;
        korname1.Caption := str;
      end
      else
      begin
        empno1.Text      := '';
        korname1.Caption := str;
      end;
    end;
    if (TmaskEdit(Sender).tag = 2) then
    begin
      str := QempDisp(TmaskEdit(Sender).Text);
      if str <> '미등록사원' then
      begin
        empno2.Text      := TmaskEdit(Sender).Text;
        korname2.Caption := str;
      end
      else
      begin
        empno2.Text      := '';
        korname2.Caption := str;
      end;
    end;
  end;
  Dataempno := False;
end;

procedure TPIE3031cForm.BtextClick(Sender: TObject);
begin
//  Update_History; //log 남기기 위해 2002.06.24 shm 추가
  wordpad := True;
  BscreenClick(Sender);
  if wordpad = True then begin
     if WinExec(PChar('c:\windows\write '+{HomeDir+}FSave.FileName),
                SW_SHOW) < 32 then
        WinExec(PChar('edit '+{HomeDir+}FSave.FileName),SW_SHOW);
  end;
end;

procedure TPIE3031cForm.Update_History;
var
  Temp_no    : Integer;
begin
     Q_date.Close;
     Q_date.Sql.Clear;
     Q_date.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Q_date.Sql.Add('  WHERE  PROGID = ''PIA1060C''               ');
     Q_date.Open;
     Temp_No    := Q_date.FieldByName('NO').AsInteger + 1;
     Q_date.Close;


     Q_date.Sql.Clear;
     Q_date.Sql.Add('INSERT INTO PYMPHIS                                                  ');
     Q_date.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
     Q_date.Sql.Add('VALUES                                                               ');
     Q_date.Sql.Add('   (                                                                 ');
     Q_date.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
     Q_date.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PIA1060C'',                 ');
     Q_date.Sql.Add('       '''+CurDate+''',                                              ');
     Q_date.Sql.Add('       ''인사기록요약표를 TEXT 화일로 출력한다.'')                   ');
     Q_date.ExecSQL;
     Q_date.Close;
end;

procedure TPIE3031cForm.BdeptClick(Sender: TObject);
var
  str : string;
begin
 if FreeDept = False then begin
    Bdept.Caption := '부서코드 해제';
 end else begin
    Bdept.Caption := '부서코드 다운';
    deptToText(HomeDir+'\insacode.dep','',3);
    FreeDept := False;
    system.exit;
 end;
 FreeDept := DiskSpaceCheck;
 if FreeDept = False then system.exit;
 Try
   forg := Tforg.Create(self);
   forg.filename := 'insacode.dep';
   forg.ShowModal;
   if forg.ModalResult <> mrYes then begin
      Bdept.Caption := '부서코드 다운';
      FreeDept      := False;
   end;
 Finally
   forg.Free;
 End;
end;

function TPIE3031cForm.MyPasString(const S, Delimiters : string; Num : integer) : string;
var
  I, Len, Count : Integer;
begin
  Count := 0;
  Len := Length(S);
  I := 1;

  Result := '';

  while I <= Len do
  begin
    Result := Result + S[I];
    if Pos(Delimiters, Copy(s, i, 50000)) = 1 then
    begin
      Inc(Count);
      if Count = Num then
      begin
        Result := Copy(Result, 1, Length(Result) - 1);
        Break;
      end
      else
      begin
        Result := '';
        I := I + Length(Delimiters) - 1;
      end;
    end;
    I := I + 1;
  end;

  if (Num < 1) or (Num > Count + 1) then
    Result := '';

  Result := Trim(Result);
end;

{  개인인사종합,요약 열람에서 해당 사원번호를 받아 인사기록 요약표를
   출력한다. 인사팀 하병수 대리 요청 1999.3.17 }
procedure TPIE3031cForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  BscreenClick(Bprint);
  close;
end;

procedure TPIE3031cForm.Panel16Click(Sender: TObject);
begin
  {em1.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
   em2.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
   em3.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
   em4.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
   em5.picture.LoadFromFile(HomeDir+'\pic\Ball_1.bmp');
   em5.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   gu4 := TPanel(Sender).HelpContext;}

  ImageList1.GetBitmap(0, em1.Picture.Bitmap);
  ImageList1.GetBitmap(0, em2.Picture.Bitmap);
  ImageList1.GetBitmap(0, em3.Picture.Bitmap);
  ImageList1.GetBitmap(0, em4.Picture.Bitmap);
  ImageList1.GetBitmap(0, em5.Picture.Bitmap);

  ImageList1.GetBitmap(1, em5.Picture.Bitmap);
  em1.Refresh;
  em2.Refresh;
  em3.Refresh;
  em4.Refresh;
  em5.Refresh;
  gu4 := TPanel(Sender).HelpContext;
end;

// 부문관련 프로그램 권한 체크 리턴값은 TRUE or FALSE
function TPIE3031cForm.CheckOfAdmin(Parameter: String): Boolean;
begin
  with QAdm do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT Groupid FROM PYMENUUSER  ' +
            ' WHERE EMPNO = '''+ pempno +'''  ' +
            '   AND GROUPID IN (''G001'', ''G011'', ''G072'') ') ;
                                //관리자,   HR팀  , 부문담당
    Open;

    if RecordCount <= 0 then CheckOfAdmin := False
    else                     CheckOfAdmin := True;
  end;
end;

end.


