{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB4030C(임원 명단)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김영대
Version         : 1.01
Date            : 1998.12.22
Update contents
  1.00   1996.05.31    김영대     신규프로그램개발                              처리명세서
  1.01   1998.12.22    김혜진     임원추출조건(paycl='00') =>substr(paycl,1,1)='0'
 30.00   1999.02.24    유미나     Y2K(주민번호관련)                             하나로인사재개발
 30.01   2000.09.28    강기우     발령구분중 차수변경,전보(직위가 바뀐 전보는 제외)  하병수대리 요청.
 30.08   2003.12.04    이민용     총합, 연번, 직급 추가, 직위순에서 직급순으로 정렬함 최상용과장님 요청
-----------------------------------------------------}

unit Pib40301;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, DBGrids, Comobj,
  pass, datelib, Timeftp, Func, KeyCode, MemDS, DBAccess, Ora;

type
  TMainForm = class(TForm)
    P_Help: TLabel;
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    G_Progress: TGauge;
    Panel4: TPanel;
    BB_Close:  TBitBtn;
    BB_Print:  TBitBtn;
    BB_SetUp:  TBitBtn;
    BB_Screen: TBitBtn;
    BB_File:   TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Panel5: TPanel;
    Panel6: TPanel;
    RB_OrderPaycl: TRadioButton;
    RB_OrderDeptcode: TRadioButton;
    RB_In: TRadioButton;
    RB_Out: TRadioButton;
    RB_All: TRadioButton;
    FileOpen: TOpenDialog;
    Panel8: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label2: TLabel;
    OraQuery1: TOraQuery;
    Q_sosok: TOraQuery;
    Q_InsaMas1: TOraQuery;
    Q_InsaMas2: TOraQuery;
    Q_pimscho: TOraQuery;
    Q_pihanno: TOraQuery;
    Q_pimcarr: TOraQuery;
    Bexcel: TBitBtn;
    tmp_oraqry: TOraQuery;
    Q_Excel: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_PrintClick(Sender: TObject);
    procedure BB_FileClick(Sender: TObject);
    procedure BexcelClick(Sender: TObject);
  private
    start: Integer;
    { Private declarations }
    //procedure ShowPreView;
  public
    { Public declarations }
    AReport:  TQuickRep;
    Q_Insa: TOraQuery;
    payrachdate : string;

    procedure ClearData;
    procedure Write_File;
    function  ConvertForm: Boolean;
    procedure AddMacroBlock(BlockName: String);
    procedure SetMacro(MacroName, RealVal: String);
    function  QcodeDisp(s1,s2 : string) : string;
    procedure Write_gubun;
  end;

type
  TDataIn = record
      flag        : string[1];       {C:계속, E:끝, N:(재,퇴직자 분리)}
      curpaycl    : string[20];      {BAND}
      korname     : string[12];      {성명}
      sosok       : string[60];      {소속}
      curpayra    : string[20];      {직책}
      empno       : string[4];       {사번}
      lschgr_name : string[20];      {학력}
      schnm       : string[30];      {학교명}
      major_name  : string[20];      {전공}
      schtoym     : string[2];       {졸업년도}
      an_name     : string[20];      {구분명}
      payra_name  : string[20];      {직책명}
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.24     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
      anfrdate    : string[10];       {선임일, yyyy.mm.dd}
      antodate    : string[10];       {만료일, yyyy.mm.dd}
      carr_name   : string[60];      {선임전경력}
  end;

var
  MainForm: TMainForm;
  DataIn: TDataIn;
  Job_Cond: Integer;
  Full_Data: Boolean;
  HomeDir : string;

implementation
{$R *.DFM}
uses
  pib40302;
var
  sBody: TStringList; {원시 폼화일 저장}
  sText: TStringList; {Text화일 저장}
  Fd : TextFile; {저장할 text화일}
  Fi : file of TDataIn;
  Fout : file of TDataIn;
//  Q_Insa: TQuery;
  cnt, RowCnt, LineCnt: Integer;
const
  MAX_WRITE_FILE_LINE = 33;

procedure TMainForm.FormActivate(Sender: TObject);
begin
{  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);
  DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
  DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
  DataBase1.Params[16] := 'PASSWORD='  + PassEmp(cmdline, 6);
  HomeDir := HomeDirOpen;}

  AReport := PrintForm.InReport;
//  ROOTDIR := Sysutils.ExtractFilePath(Application.ExeName);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 i : integer;
begin
  start := 0;

  P_Help.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select VALUE3,  VALUE4         ');
       Sql.Add('  from pimvari                 ');
       Sql.Add(' where gubun  = ''00''         ');
       Sql.Add('   and sgubun = ''0001''       ');
       Open;
       payrachdate := FieldByName('VALUE3').AsString;
       close;
  end;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,2,1);
  if  Pgrade > 'C' then Close;

  HomeDir := 'C:\insa';
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
{procedure TMainForm.ShowPreView;
begin
  PreViewForm.ShowModal;
end;   }

procedure TMainForm.ClearData;
begin
  with DataIn do
  begin
    flag        := '';
    curpaycl    := '';
    curpayra    := '';
    empno       := '';
    korname     := '';
    lschgr_name := '';
    schnm       := '';
    major_name  := '';
    schtoym     := '';
    an_name     := '';
    payra_name  := '';
    anfrdate    := '';
    antodate    := '';
    carr_name   := '';
    sosok       := '';
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

procedure TMainForm.Write_gubun;
var
  n: Integer;
  pre_payra : string;
begin
  LineCnt := 0;

  with DataIn do
  begin
    while not Q_insa.Eof do
    begin
      Inc(LineCnt);
      G_Progress.Progress := (LineCnt*100) div Q_Insa.RecordCount;
      Application.ProcessMessages;

      if Job_Cond = 1 then {재직자}
      begin
        if Q_insa.FieldByName('PSTATE').AsString >= '80' then
        begin
          Q_Insa.Next;
          Continue;
        end;
      end
      else if Job_Cond = 2 then {퇴직자}
      begin
        if Q_insa.FieldByName('PSTATE').AsString < '80' then
        begin
          Q_Insa.Next;
          Continue;
        end;
      end;

      ClearData;
      flag        := 'C';
      curpaycl    := QcodeDisp('I112', Q_insa.FieldByName('PAYCL').AsString);
      curpayra    := QcodeDisp('I113', Q_insa.FieldByName('PAYRA').AsString);
      empno       := Q_insa.FieldByName('EMPNO').AsString;
      korname     := Q_insa.FieldByName('KORNAME').AsString;
      lschgr_name := QcodeDisp('I221', Q_insa.FieldByName('LSCHGR').AsString);


      Q_pimscho.ParamByName('P_empno').AsString := empno;
      if Q_insa.FieldByName('LSCHGR').AsString >= '49' then {전문대졸이상}
        Q_pimscho.ParamByName('P_schgr').AsString := '40'
      else
        Q_pimscho.ParamByName('P_schgr').AsString := '00';

      Q_pihanno.ParamByName('P_empno').AsString := empno;
      Q_pimcarr.ParamByName('P_empno').AsString := empno;
      Q_sosok.ParamByName('P_empno').AsString := empno;

      Q_pimscho.Open; {학력사항}
      Q_pihanno.Open; {이사선임사항}
      Q_pimcarr.Open; {선임전 경력}
      Q_sosok.Open;   {소속}

      n := 0;
      while True do
      begin
        Inc(n);
        if n > 1 then
        begin
          curpaycl    := '';
          curpayra    := '';
          empno       := '';
          korname     := '';
          lschgr_name := '';
        end;

        if n = 2 then
          korname := '('+ Copy(Q_insa.FieldByName('JUMINID').AsString,1,2)+'.'+
                          Copy(Q_insa.FieldByName('JUMINID').AsString,3,2)+'.'+
                          Copy(Q_insa.FieldByName('JUMINID').AsString,5,2)+')';

        if Q_pimscho.EOF then
        begin
          schnm      := '';
          major_name := '';
          schtoym    := '';
        end
        else
        begin
          schnm      := '';
          major_name := '';
          schtoym    := '';
          schnm := Q_pimscho.FieldByName('SCHNM').AsString;
          if Q_insa.FieldByName('LSCHGR').AsString >= '49' then {전문대졸이상}
            major_name := QcodeDisp('I225', Q_pimscho.FieldByName('MAJORCODE').AsString)
          else
            major_name := '';
          schtoym    := Copy(Q_pimscho.FieldByName('SCHTOYM').AsString,3,4); {년도만}
          Q_pimscho.Next;
        end;

        if Q_pihanno.EOF then
        begin
          an_name    := '';
          payra_name := '';
          anfrdate   := '';
          antodate   := '';
        end
        else
        begin
          an_name    := '';
          payra_name := '';
          anfrdate   := '';
          antodate   := '';

     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description                                  relevant doc.no
   	30.01     2000.09.28      강기우    발령구분중 차수변경,전보(직위가 바뀐 전보는 제외)  하병수대리 요청.
	=============================================================================== /}
          an_name    := QcodeDisp('I300', Q_pihanno.FieldByName('ANCODE').AsString);
          payra_name := QcodeDisp('I113', Q_pihanno.FieldByName('PAYRA').AsString);
          if Q_pihanno.FieldByName('ANCODE').AsString = '935' then
          begin
            Q_pihanno.Next;
            Continue;
          end;

          if (Q_pihanno.FieldByName('ANCODE').AsString = '211') and
                (pre_payra = payra_name) then
          begin
            Q_pihanno.Next;
            Continue;
          end;
          pre_payra  := payra_name;  // 전발령의 직위
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.24     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
          if Q_pihanno.FieldByName('ANFRDATE').AsString <> '' then
            anfrdate   := Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,1,4)+'.'+
                          Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,5,2)+'.'+
                          Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,7,2);
          if Q_pihanno.FieldByName('ANTODATE').AsString <> '' then
            antodate   := Copy(Q_pihanno.FieldByName('ANTODATE').AsString,1,4)+'.'+
                          Copy(Q_pihanno.FieldByName('ANTODATE').AsString,5,2)+'.'+
                          Copy(Q_pihanno.FieldByName('ANTODATE').AsString,7,2);
          Q_pihanno.Next;
        end;

        if Q_pimcarr.EOF then
        begin
          carr_name := '';
        end
        else
        begin
          carr_name := '';
          carr_name := Q_pimcarr.FieldByName('CARR_NAME').AsString;
          Q_pimcarr.Next;
        end;

        if Q_sosok.EOF then
        begin
          sosok := '';
        end
        else
        begin
          sosok := '';
          sosok := Q_sosok.FieldByName('deptname').AsString;
          Q_sosok.Next;
        end;

        if Q_sosok.EOF and Q_pimscho.EOF and Q_pihanno.EOF and Q_pimcarr.EOF then
        begin
          flag := 'E'; {한 사원의 맨끝자료}
          if n = 2 then
            korname := '('+ Copy(Q_insa.FieldByName('JUMINID').AsString,1,2)+'.'+
                            Copy(Q_insa.FieldByName('JUMINID').AsString,3,2)+'.'+
                            Copy(Q_insa.FieldByName('JUMINID').AsString,5,2)+')';
{          System.Write(Fout, DataIn);}
          break;
        end
        else
        begin
          System.Write(Fout, DataIn);
        end;
      end; {while}
      Q_sosok.Close;
      Q_pimscho.Close;
      Q_pihanno.Close;
      Q_pimcarr.Close;
      Q_Insa.Next;
      if Q_Insa.EOF then
        flag := 'N'; {페이지분리}
      System.Write(Fout, DataIn);
    end; {while}
  end; {with}
end;

{-----------------------------------------------------------}
procedure TMainForm.Write_File;
var
  Ret: Boolean;
  i, n: Integer;
begin
  if not FileOpen.Execute then
    System.Exit;
  if FileOpen.FileName = '' then
    System.Exit;

  try
    System.AssignFile(Fd, FileOpen.FileName);
    System.Rewrite(Fd); {저장할 text화일 open}
    System.AssignFile(Fi, HomeDir+'\list\pib4030c.tmp');
    System.Reset(Fi);

    sBody := TStringList.Create;
    sText := TStringList.Create;
    sBody.LoadFromFile(HomeDir+'\bin\ibin\pib4030c.frm'); {form화일 reading}

    n := 0;
    Ret := True;

    while Ret do
    begin
      Inc(n);
      sText.Clear;
      AddMacroBlock('head');
      SetMacro('yymmdd_date', Lsysdate.Caption);
      SetMacro('pageno',      IntToStr(n));
      Ret := ConvertForm;
      AddMacroBlock('footer');
      for i := 0 to sText.Count - 1 do
        System.Write(Fd, sText.Strings[i]+#13#10);
      System.Write(Fd, #13#10);
      System.Write(Fd, #13#10);
    end;
  finally
    sBody.free;
    sText.free;
    System.Close(Fi);
    System.Close(Fd);
  end;
end;

{1페이지 분량의 레코드를 sText에 저장}
function TMainForm.ConvertForm: Boolean;
var
  i, j:      Integer;
  Str:       String;
  First_Data: Boolean;
label end_point;
begin
  First_Data := True;
  for i := 1 to MAX_WRITE_FILE_LINE do
  begin
    Read(Fi, DataIn);
    if Eof(Fi) then
    begin
      ConvertForm := False;
      G_Progress.Progress := 100;
      Application.ProcessMessages;
      goto end_point;
    end;

    with DataIn do
    begin
      if curpaycl = '' then
         curpaycl := ' ';
      if curpayra = '' then
         curpayra := ' ';
      if empno = '' then
         empno := ' ';
      if sosok = '' then
         sosok := ' ';
      if korname = '' then
         korname := ' ';
      if lschgr_name = '' then
         lschgr_name := ' ';
      if schnm = '' then
         schnm := ' ';
      if major_name = '' then
         major_name := ' ';
      if schtoym = '' then
         schtoym := ' ';
      if an_name = '' then
         an_name := ' ';
      if payra_name = '' then
         payra_name := ' ';
      if (anfrdate = '') or (anfrdate = '..') then
         anfrdate := ' ';
      if (antodate = '') or (antodate = '..') then
         antodate := ' ';
      if carr_name = '' then
         carr_name := ' ';

      AddMacroBlock('row');
      if First_Data then
      begin
        SetMacro('curpaycl',   Copy(curpaycl,1,16));
        SetMacro('curpayra',   Copy(curpayra,1,16));
        SetMacro('emp',        Copy(empno,1,4));
        SetMacro('korname',    Copy(korname,1,10));
        SetMacro('schgr',      Copy(lschgr_name,1,6));
        First_Data := False;
      end
      else
      begin
        SetMacro('curpaycl',   ' ');
        SetMacro('curpayra',   ' ');
        SetMacro('emp',        ' ');
        SetMacro('sosok',      Copy(sosok,1,60));
        SetMacro('korname',    ' ');
        SetMacro('schgr',      ' ');
      end;

      SetMacro('schnm',      Copy(schnm,1,20));
      SetMacro('major_name', Copy(major_name,1,12));
      SetMacro('y',          Copy(schtoym,1,2));
      SetMacro('an_name',    Copy(an_name,1,8));
      SetMacro('payra',      Copy(payra_name,1,10));
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.24     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
      SetMacro('anfr',       Copy(anfrdate,1,10));
      SetMacro('anto',       Copy(antodate,1,10));
      SetMacro('carr_name',  Copy(carr_name,1,60));

      if Flag = 'E' then
      begin
        if i <> MAX_WRITE_FILE_LINE then
          AddMacroBlock('rowline');
        First_Data := True;
        Inc(cnt);
        G_Progress.Progress := (cnt*100) div RowCnt;
        Application.ProcessMessages;
      end
      else if Flag = 'N' then
      begin
        Inc(cnt);
        G_Progress.Progress := (cnt*100) div RowCnt;
        Application.ProcessMessages;
        Break;
      end;      
    end; {with}
  end; {for}
  ConvertForm := True;
end_point:
end;

{지정한Macro부터 다음Macro까지 sText에 추가}
procedure TMainForm.AddMacroBlock(BlockName: String);
var
  i, j: Integer;
begin
  BlockName := '.' + BlockName;
  for i := 0 to sBody.Count-1 do
  begin
    if Pos(BlockName, sBody.Strings[i]) > 0 then
    begin
      for j := i+1 to sBody.Count-1 do
      begin
        if sBody.Strings[j]= '' then
        begin
          sText.Add(' ');
          Continue;
        end;  
        if sBody.Strings[j][1] = '.' then
          break;
        sText.Add(sBody.Strings[j]);
      end;
      break;
    end;
  end;
end;

procedure TMainForm.SetMacro(MacroName, RealVal: String);
var
  i, j, k: Integer;
  s, sub: String;
begin
  sub := '@'+MacroName;
  for i:= 0 to sText.Count -1 do
  begin
    j := pos(sub, sText.Strings[i]);
    if j = 0 then
      Continue;
    s := sText.Strings[i];
    for k := 1 to Length(RealVal) do
    begin
      s[j] := RealVal[k];
      Inc(j);
    end;
    while (j <= Length(s)) and (s[j] in ['0'..'9','A'..'z', '_']) do
    begin
      s[j] := ' ';
      Inc(j);
    end;
    sText.Strings[i] := s;
    Break;
  end;
end;

function TMainForm.QcodeDisp(s1,s2 : string) : string;
begin
  if s2 = ''  then
  begin
    QcodeDisp := s2;
    System.Exit;
  end;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('select codeid,codeno,codename   ');
            Sql.Add('  from pyccode                  ');
            Sql.Add(' where codeid = :Lcodeid        ');
            Sql.Add('   and codeno = :Lcodesub       ');
            Parambyname('lcodeid').AsString  := s1;
            Parambyname('lcodesub').AsString := s2;
            Open;
            QCodeDisp := FieldByName('CodeName').AsString;
            if trim(FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
            close;
       end;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  Application.Processmessages;
  G_Progress.Progress := 0;

  if   RB_OrderPaycl.Checked then Q_Insa := Q_InsaMas1  {직위순}
  else                            Q_Insa := Q_InsaMas2; {부서순}
  Q_Insa.Open;
  if Q_Insa.RecordCount = 0 then
  begin
    P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
    Q_Insa.Close;
  end
  else
  begin
    Full_Data := False;
    if RB_In.Checked then
      Job_Cond := 1  {재직자}
    else if RB_Out.Checked then
      Job_Cond := 2  {재직자}
    else
    begin
      Job_Cond  := 3;
      Full_Data := True;
    end;

//    while Job_Cond <> 3 do
//    begin
      Q_Insa.First;
      AssignFile(Fout, HomeDir+'\list\pib4030c.tmp');
      System.ReWrite(Fout);
      P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
      Application.Processmessages;
      G_Progress.Progress := 0;
      Write_gubun;
      System.Close(Fout);

      P_Help.Caption := '추출된 자료를 출력합니다.';
      Application.Processmessages;
//      QRprinter.OnPreView := ShowPreView; {사용자정의 미리보기 화면}
      AReport.PreView;
      P_Help.Caption := '';
      SysUtils.DeleteFile(HomeDir+'\list\pib4030c.tmp');
      G_Progress.Progress := 0;
  //  end;
    Q_Insa.Close;
    P_Help.Caption := '작업이 완료되었습니다.';
  end;
end;

procedure TMainForm.BB_PrintClick(Sender: TObject);
begin
  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  Application.Processmessages;
  G_Progress.Progress := 0;

  if RB_OrderPaycl.Checked then
    Q_Insa := Q_InsaMas1  {직위순}
  else
    Q_Insa := Q_InsaMas2; {부서순}
  Q_Insa.Open;
  if Q_Insa.RecordCount = 0 then
  begin
    P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
    Q_Insa.Close;
  end
  else
  begin
    AssignFile(Fout, HomeDir+'\list\pib4030c.tmp');
    System.ReWrite(Fout);
    P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
    Application.Processmessages;
    G_Progress.Progress := 0;

    if RB_In.Checked then
    begin
      Job_Cond := 1;
      Write_gubun;
    end
    else if RB_Out.Checked then
    begin
      Job_Cond := 2;
      Write_gubun;
    end
    else
    begin
      Job_Cond := 1;
      Write_gubun;
      Q_Insa.First;
      Job_Cond := 2;
      Write_gubun;
    end;
    System.Close(Fout);
    P_Help.Caption := '추출된 자료를 출력합니다.';
    Application.Processmessages;
    AReport.Print;

    P_Help.Caption := '';
    SysUtils.DeleteFile(HomeDir+'\list\pib4030c.tmp');
    G_Progress.Progress := 0;
    Q_Insa.Close;
    P_Help.Caption := '작업이 완료되었습니다.';
  end;
end;

procedure TMainForm.BB_FileClick(Sender: TObject);
begin
  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  Application.Processmessages;
  G_Progress.Progress := 0;

  if RB_OrderPaycl.Checked then
    Q_Insa := Q_InsaMas1  {직위순}
  else
    Q_Insa := Q_InsaMas2; {부서순}
  Q_Insa.Open;
  if Q_Insa.RecordCount = 0 then
  begin
    P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
    Q_Insa.Close;
  end
  else
  begin
    AssignFile(Fout, HomeDir+'\list\pib4030c.tmp');
    System.ReWrite(Fout);
    P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
    Application.Processmessages;
    G_Progress.Progress := 0;
    cnt := 0;
    if RB_In.Checked then
    begin
      Job_Cond := 1;
      Write_gubun;
      RowCnt := LineCnt;
    end
    else if RB_Out.Checked then
    begin
      Job_Cond := 2;
      Write_gubun;
      RowCnt := LineCnt;
    end
    else
    begin
      Job_Cond := 1;
      Write_gubun;
      RowCnt := LineCnt;
      Q_Insa.First;
      Job_Cond := 2;
      Write_gubun;
      RowCnt := RowCnt + LineCnt;
    end;
    System.Close(Fout);
    P_Help.Caption := '추출된 자료를 화일로 출력합니다.';
    Application.Processmessages;
    Write_File;

    P_Help.Caption := '';
    SysUtils.DeleteFile(HomeDir+'\list\pib4030c.tmp');
    G_Progress.Progress := 0;
    Q_Insa.Close;
    P_Help.Caption := '작업이 완료되었습니다.';
  end;
end;

procedure TMainForm.BexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
    empno, tmp_value, tmp_schnm, tmp_major, tmp_schto, tmp_carr : String;
begin

  with Q_Excel do
  begin
    Sql.clear;
    Sql.Add('SELECT PIMPMAS."PAYCL" ,                           ');
    Sql.Add('       PIMPMAS."EMPNO" ,                           ');
    Sql.Add('       PIMPMAS."KORNAME" ,                         ');
    Sql.Add('       PIMPMAS."JUMINID" ,                         ');
    Sql.Add('       PIMPMAS."LSCHGR" ,                          ');
    Sql.Add('       PIMPMAS."PAYRA" ,                           ');
    Sql.Add('       PIMPMAS."PSTATE"                            ');
    Sql.Add(' FROM  PIMPMAS                                     ');
    Sql.Add('WHERE ( ( substr(PIMPMAS."PAYCL",1,1) = ''0'' ) or ');
    Sql.Add('        ( substr(PIMPMAS."EMPNO",1,1) = ''M'' ))   ');

    if RB_In.Checked then {재직자}
    Sql.Add('  AND PSTATE < ''80''                              ')
    else if RB_Out.Checked then {퇴직자}
    Sql.Add('  AND PSTATE >= ''80''                             ');

    Sql.Add('ORDER BY                                           ');
    Sql.Add('        PIMPMAS."DEPTCODE" ,                       ');
    Sql.Add('        PIMPMAS."PAYRA" ,                          ');
    Sql.Add('        PIMPMAS."EMPNO"                            ');

    Open;
  end;

  if Q_Excel.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end
  else
  begin

    P_Help.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 14], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      p_help.caption := '';
      Exit;
    end;

  end;

  p_help.caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '임원 명단';  //시트명 부여
  XL.Range['A1:M2'].Merge;               //셀 병합
  XL.Range['A3:M3'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '임원 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  // 요약
  if RB_Out.Checked then //퇴직자
  begin
    PrintForm.Q_total.Session := Ora_Session;
    with PrintForm.Q_total do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select sum(cou) total                                '+
              '  from (                                             '+
              '  SELECT  B.CODENAME, count(*) cou                   '+
              '  FROM  PIMPMAS A, PYCCODE B                                   '+
              '  WHERE  A.PAYCL=B.CODENO                                      '+
              '   ANd   B.CODEID=''I112''                                     '+
              '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
              '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
              '   AND   PSTATE >=''80''                             '+
              '  GROUP BY      B.CODENAME                           '+
              '  )  A                                               ');
       parambyname('payrachdate').AsString := payrachdate;
  
       Open;
       tmp_value := '■총 ' + PrintForm.Q_total.FieldByName('total').AsString + '명';
       Close;
    end;

    PrintForm.Q_Inwon.Session := Ora_Session;
    with PrintForm.Q_Inwon do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT B.CODENAME payclname , count(*) count   '+
              '  FROM  PIMPMAS A, PYCCODE B                                   '+
              '  WHERE  A.PAYCL=B.CODENO                                      '+
              '   ANd   B.CODEID=''I112''                                     '+
              '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
              '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
              '   AND   PSTATE >=''80''                                       '+
              '  GROUP BY B.CODENAME                                          ');
      parambyname('payrachdate').AsString := Mainform.payrachdate;


      Open;
      First;
      tmp_value := tmp_value + ' (';
      while not Eof do
      begin
         tmp_value := tmp_value + PrintForm.Q_Inwon.FieldByName('payclname').AsString + ' ' +
         PrintForm.Q_Inwon.FieldByName('count').AsString + '명 ';

         PrintForm.Q_Inwon.Next;
      end;
      tmp_value := tmp_value + ')';
      XL.Range['A3'].value  := tmp_value;
      Close;
    end;
  end
  else if RB_In.Checked then //재직자
  begin
    PrintForm.Q_total.Session := Ora_Session;
    with PrintForm.Q_total do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select sum(cou) total                                '+
              '  from (                                             '+
              '  SELECT PIMPMAS."PAYRA", count(*) cou               '+
              '  FROM  PIMPMAS                                      '+
              '  WHERE  ( substr(PIMPMAS."EMPNO",1,1)  =  ''M'' )   '+
              '   AND   PSTATE <''80''                              '+
              '  GROUP BY PIMPMAS."PAYRA"                           '+
              '  )  A                                               ');

       Open;
       tmp_value := '■총 ' + PrintForm.Q_total.FieldByName('total').AsString + '명';
       Close;
    end;
    
    PrintForm.Q_Inwon.Session := Ora_Session;
    with PrintForm.Q_Inwon do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.PAYra payra , B.CODENAME payraname , count(*) count   '+
              '  FROM  PIMPMAS A, PYCCODE B                                   '+
              '  WHERE  A.PAYRA=B.CODENO                                      '+
              '   ANd   B.CODEID=''I113''                                     '+
              '   AND   ( substr(A.empno,1,1)  =  ''M'' )                     '+
              '   AND   PSTATE <''80''                                       '+
              '  GROUP BY A.PAYra,                                            '+
              '       B.CODENAME                                              ');

       Open;
       First;
       tmp_value := tmp_value + ' (';
       while not Eof do
       begin
          tmp_value := tmp_value + PrintForm.Q_Inwon.FieldByName('payraname').AsString + ' ' +
          PrintForm.Q_Inwon.FieldByName('count').AsString + '명 ';
  
          PrintForm.Q_Inwon.Next;
       end;
       tmp_value := tmp_value + ')';
       XL.Range['A3'].value  := tmp_value;
       Close;
    end;
  end
  else if RB_All.Checked then //전체
  begin
    PrintForm.Q_total.Session := Ora_Session;
    with PrintForm.Q_total do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select sum(cou) total                                '+
              '  from (                                             '+
              '  SELECT b.codename, count(*) cou                    '+
              '  FROM  PIMPMAS a , PYCCODE B                                  '+
              '  WHERE  A.PAYra=B.CODENO                                      '+
              '   ANd   B.CODEID=''I113''                                     '+
              '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
              '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
              '  GROUP BY b.codename                                '+
              '  )  A                                               ');
       parambyname('payrachdate').AsString := Mainform.payrachdate;

       Open;
       tmp_value := '■총 ' + PrintForm.Q_total.FieldByName('total').AsString + '명';
       Close;
    end;
    
    PrintForm.Q_Inwon.Session := Ora_Session;
    with PrintForm.Q_Inwon do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT  B.CODENAME payraname , count(*) count                  '+
              '  FROM  PIMPMAS A, PYCCODE B                                   '+
              '  WHERE  A.PAYra=B.CODENO                                      '+
              '   ANd   B.CODEID=''I113''                                     '+
              '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
              '         ( retdate >= :payrachdate and substr(a.EMPNO,1,1)  =  ''M'' ))  '+
              '  GROUP BY B.CODENAME                                              ');
       parambyname('payrachdate').AsString := Mainform.payrachdate;


       Open;
       First;
       tmp_value := tmp_value + ' (';
       while not Eof do
       begin
          tmp_value := tmp_value + PrintForm.Q_Inwon.FieldByName('payraname').AsString + ' ' +
          PrintForm.Q_Inwon.FieldByName('count').AsString + '명 ';

          PrintForm.Q_Inwon.Next;
       end;
       tmp_value := tmp_value + ')';
       XL.Range['A3'].value  := tmp_value;
       Close;
    end;
  end;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '연번'            ;
  XArr[ 2]  := '성명'            ;
  XArr[ 3]  := '소속'            ;
  XArr[ 4]  := '직책'          ;
  XArr[ 5]  := '학력'          ;
  XArr[ 6]  := '학교명'        ;
  XArr[ 7]  := '전공'          ;
  XArr[ 8]  := '졸'      ;
  XArr[ 9]  := '구분'    ;
  XArr[10]  := '직책'    ;
  XArr[11]  := '선임일'    ;
  XArr[12]  := '만료일'    ;
  XArr[13]  := '선임전경력'    ;

  XL.Range['A4' , 'M4'].Value := XArr;
  k := 4;
  for i := 1 to 13 do
  begin
     XL.Range[CHR(64 + i) + '4'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '4'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '4'].font.Size := 10;
     XL.Range[CHR(64 + i) + '4'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := tmp_oraqry.GetBookmark;
  Q_Excel.DisableControls;
  Q_Excel.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  Q_Excel.RecordCount do
  begin
     Q_pimscho.Close; {학력사항}
     Q_pihanno.Close; {이사선임사항}
     Q_pimcarr.Close; {선임전 경력}
     Q_sosok.Close;   {소속}

     empno := Q_Excel.FieldByName('EMPNO').AsString;
     Q_pimscho.ParamByName('P_empno').AsString := empno;
     if Q_Excel.FieldByName('LSCHGR').AsString >= '49' then {전문대졸이상}
       Q_pimscho.ParamByName('P_schgr').AsString := '40'
     else
       Q_pimscho.ParamByName('P_schgr').AsString := '00';
     
     Q_pihanno.ParamByName('P_empno').AsString := empno;
     Q_pimcarr.ParamByName('P_empno').AsString := empno;
     Q_sosok.ParamByName('P_empno').AsString := empno;

     Q_pimscho.Open; {학력사항}
     Q_pihanno.Open; {이사선임사항}
     Q_pimcarr.Open; {선임전 경력}
     Q_sosok.Open;   {소속}

     XArr[ 1]  := IntToStr(i);

     XArr[ 2]  := Q_Excel.FieldByName('KORNAME').AsString;
     XArr[ 3]  := Q_sosok.FieldByName('DEPTNAME').AsString;
     XArr[ 4]  := QcodeDisp('I113', Q_Excel.FieldByName('PAYRA').AsString);
     XArr[ 5]  := QcodeDisp('I221', Q_Excel.FieldByName('LSCHGR').AsString);

     tmp_schnm := '';
     tmp_major := '';
     tmp_schto := '';
     for j := 1 to Q_pimscho.RecordCount do
     begin
       tmp_schnm := tmp_schnm + Q_pimscho.FieldByName('SCHNM').AsString + #10#13;
       tmp_major := tmp_major + QcodeDisp('I225',Q_pimscho.FieldbyName('MAJORCODE').AsString) + #10#13;
       tmp_schto := tmp_schto + Copy(Q_pimscho.FieldByName('SCHTOYM').AsString,3,2) + #10#13; {년도만}
       Q_pimscho.Next;
     end;
     tmp_schnm := trim(tmp_schnm);
     tmp_major := trim(tmp_major);
     tmp_schto := trim(tmp_schto);

     XArr[ 6]  := tmp_schnm;
     XArr[ 7]  := tmp_major;
     XArr[ 8]  := tmp_schto;
     XArr[ 9]  := QcodeDisp('I300', Q_pihanno.FieldByName('ANCODE').AsString);
     XArr[10]  := QcodeDisp('I113', Q_pihanno.FieldByName('PAYRA').AsString);
     if Q_pihanno.FieldByName('ANFRDATE').AsString <> '' then
     XArr[11]   := Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,1,4)+'.'+
                   Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,5,2)+'.'+
                   Copy(Q_pihanno.FieldByName('ANFRDATE').AsString,7,2)
     else XArr[11] := '';
     if Q_pihanno.FieldByName('ANTODATE').AsString <> '' then
     XArr[12]   := Copy(Q_pihanno.FieldByName('ANTODATE').AsString,1,4)+'.'+
                   Copy(Q_pihanno.FieldByName('ANTODATE').AsString,5,2)+'.'+
                   Copy(Q_pihanno.FieldByName('ANTODATE').AsString,7,2)
     else XArr[12] := '';

     tmp_carr := '';
     for j := 1 to Q_pimcarr.RecordCount do
     begin
       tmp_carr := tmp_carr + Q_pimcarr.FieldByName('CARR_NAME').AsString + #10#13;
       Q_pimcarr.Next;
     end;
     tmp_carr := trim(tmp_carr);
     XArr[13]  := tmp_carr;
     //XArr[11]  := Q_pihanno.FieldbyName('ANFRDATE').AsString;
     //XArr[12]  := Q_pihanno.FieldByName('ANTODATE').AsString;
     {XArr[13]  := Q_Insa.FieldByName('NOTICE_YN').AsString;
     XArr[14]  := Q_Insa.FieldByName('ASSIGN_YN').AsString;}

     XL.Range['A' + IntToStr(k+1), 'N' + IntToStr(k+1)].Value := XArr;
     inc(k);
     Q_Excel.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'M' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'M' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'M' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'M' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'M' + IntToStr(k)].font.Size           := 9;
   XL.Range['A5', 'M' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'M' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   Q_Excel.GotoBookmark(SavePlace);
   Q_Excel.FreeBookmark(SavePlace);
   Q_Excel.EnableControls;
   p_help.caption := '';

   G_Progress.Progress := 0;
   Q_Excel.Close;
   P_Help.Caption := '작업이 완료되었습니다.';
end;

end.
