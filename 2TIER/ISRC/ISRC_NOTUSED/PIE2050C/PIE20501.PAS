{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2050C( 부서/BAND별 인원 상세 현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김영대
Version         : 1.01
Date            : 1998.04.14
Update contents
  버전     수정일     수정자   관련근거         수정내용
  1.00   1996.06.08   김영대  처리명세서    신규프로그램 개발
  1.01   1998.04.14   김순례  전(98.4.11)   sectcode(부문)별 인원계 추가
 30.18   2000.03.08   김대훈       -       출력물 소계부분 이사를 상무보로 변경
 30.19   2002.06.25   서혜미   자체        excel 추출시 log 남기기
 30.04   2003.07.22   이민용  전(2003-9433) 명칭변경: 과단위 부서별 인원 현황 ->
                                                     부서/BAND벼 인원 상세 현황
                                            비정규직란 추가: 전문계약직, 계약직
                                                               일반직, 소계반영
                                            담당급 하단의 '소계'란 삭제
                                            '본부 계' -> '팀계'로 수정
 30.05   2003.11.19   이민용   자체         'H07' 조직개편으로 rpad함수 추가
 30.06   2004.05.03   이민용   자체         임시조직을 리포트에서 제거함, Query_sectotal, Query_SubTotal
                                            ( PIHTOPO."SECTCODE"  <> 'Z')  AND 쿼리 추가
 30.07   2005.06.02   변춘미   임현수          총괄부서코드추가(부서등급 60 추가)에 따라 쿼리수정_하드코딩
                                               (차수 변동시 REMARK 한 쿼리 재사용 예정(PIE20506.PAS에 쿼리존재)
 30.08   2005.06.29   최은아   임현수       부서코드 추가(경영총괄실/경영총괄팀)에 따라 쿼리수정_하드코딩
                                               (차수 변동시 REMARK 한 쿼리 재사용 예정(PIE20506.PAS에 쿼리존재)
--------------------------------------------------------------------------------
}

unit pie20501;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, DBGrids,dept1lib,
  pass, Datelib,kpaylib;

type
  TMainForm = class(TForm)
    Q_vari: TQuery;
    Database1: TDatabase;
    Query_TotalSum: TQuery;
    Query_SubTotal: TQuery;
    Qbondept: TQuery;
    Query_comment1: TQuery;
    Query_comment2: TQuery;
    Query_BonTotal: TQuery;
    Query_BonData: TQuery;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;               
    Panel3: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel6: TPanel;
    P_Body: TPanel;
    Panel7: TPanel;
    Panel5: TPanel;
    G_Progress: TGauge;
    Panel8: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    ME_WorkDate: TMaskEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Edit1_1: TEdit;
    Edit2_1: TEdit;
    Edit3_1: TEdit;
    Edit4_1: TEdit;
    Edit5_1: TEdit;
    Edit6_1: TEdit;
    Edit7_1: TEdit;
    Edit8_1: TEdit;
    Edit1_2: TEdit;
    Edit2_2: TEdit;
    Edit3_2: TEdit;
    Edit4_2: TEdit;
    Edit5_2: TEdit;
    Edit6_2: TEdit;
    Edit7_2: TEdit;
    Edit8_2: TEdit;
    Edit1_3: TEdit;
    Edit2_3: TEdit;
    Edit3_3: TEdit;
    Edit4_3: TEdit;
    Edit5_3: TEdit;
    Edit6_3: TEdit;
    Edit7_3: TEdit;
    Edit8_3: TEdit;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    L_LastDate: TPanel;
    L_CurCreate: TPanel;
    L_PlaneCreate: TPanel;
    Q_UpdateVari: TQuery;
    Panel22: TPanel;
    deptcode1: TMaskEdit;
    deptcode2: TMaskEdit;
    Label2: TLabel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Query_sectotal: TQuery;
    Q_date: TQuery;
    Bwink: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DeptCodeClick(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure ChangePimvari(Sender: TObject);
  private
    pempno, pkorname, password: string;
    start: Integer;
    wordpad : boolean;
    DeptLevel : string;
    Lastyymm,pcount,pdeptcode  : string;  {최종작업년월,파견/교육 부서,파견계획인원}
    Change_PIMVARI: Boolean;
    rStr: string;
    { Private declarations }
    procedure DeptAssign(const QTemp : TQuery; const Fmt : string);
    procedure DeptSumAssign(const QTemp : TQuery);
    procedure JunimAssign(const QTemp : TQuery);
    function DeptNameFind : string;     {부서명 Find}
    function PageCheck(var pageLine : integer; gubun : integer) : Boolean;
    procedure Update_History;
        
  public
    { Public declarations }
    AReport: TQuickRep;
    payrachym : String;
    procedure ClearNumData;
    procedure ClearData;
  end;

type
  TDataIn = record
      flag      : string[1];  {C:계속, S:인쇄후 구분선 출력}
      deptname  : string[30];
      ttotal    : string[5];
      ptotal    : string[5];
      pdirsum   : string[5];
      ppos1     : string[5]; {1급}
      ppos2     : string[5];
      ppos3     : string[5];
      ppos4     : string[5];
      ppos5     : string[5];
      ppos6     : string[5];
      ppos7     : string[5];
      ppos8     : string[5];
      ppos9     : string[5];
      pspe      : string[5]; {특정}
      pemp      : string[5]; {정규계}
      psconsum  : string[5]; {전계}
      pcontsum  : string[5]; {계약}
      pextrsum  : string[5]; {임시직 일반}
      ptempsum  : string[5]; {용역}
      pimsisum  : string[5]; {비정규직 계}
      psum      : string[5];
  end;

  TNumData = record {부서별 소계계산용}
      nttotal    : integer;
      nptotal    : integer;
      npdirsum   : integer;
      nppos1     : integer;
      nppos2     : integer;
      nppos3     : integer;
      nppos4     : integer;
      nppos5     : integer;
      nppos6     : integer;
      nppos7     : integer;
      nppos8     : integer;
      nppos9     : integer;
      npspe      : integer;
      npemp      : integer;
      npsconsum  : integer;
      npcontsum  : integer;
      npextrsum  : integer;
      nptempsum  : integer;
      npimsisum  : integer;  
      npsum      : integer;
      npspe2     : integer;
      npspe21    : integer;
      npspe22    : integer;
      npspe23    : integer;
      npspe24    : integer;
      npspe25    : integer;
      npspe26    : integer;
      npspe27    : integer;
  end;

var
  MainForm: TMainForm;
  DataIn: TDataIn;
  Fout : file of TDataIn;
  FCom : Textfile;
  NumData: TNumData;
  ErrorHelp : array[0..255] of char;
  HomeDir : string;

implementation
{$R *.DFM}
uses
  pie20502, pie20504, pie20505, PIE20506;

const
  sPrn = '#####';
  dPrn = '(####)';

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir := HomeDirOpen;
  AReport := PrintForm.InReport;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
 i ,j    : integer;
// rStr: string;
 EditCom : TEdit;
begin
  if start = 0 then begin
    start := 1;
    pempno   := PassEmp(cmdline, 1);
    pkorname := PassEmp(cmdline, 2);
    password := PassEmp(cmdline, 3);
    DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
    DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
    DataBase1.Params[19] := 'PASSWORD='  + PassEmp(cmdline, 6);
    Application.Processmessages;
    Try
       Database1.Connected := True;
    EXCEPT ON E : EDataBaseError DO begin
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
       halt(1);
    end;
    END;

    with Q_date do
    begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') sys_date FROM DUAL';
        Open;
        rStr := FieldByName('sys_date').AsString;
        Close;
    end;

    L_Date.Caption := Copy(rStr, 1, 4)+'/'+
                      Copy(rStr, 5, 2)+'/'+
                      Copy(rStr, 7, 2);
//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//    System.Halt(0);
      L_Name.Caption := pkorname+'('+pempno+')';
    P_Help.Caption := '인사변수화일을 읽는 중입니다 !!..';
    SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
    with Q_vari do begin
      Close;
      ParamByName('P_gubun').AsString  := '00';
      ParamByName('P_sgubun').AsString := '0001';
      Open; {최종작업년월}
      Payrachym := FieldByName('VALUE4').AsString;

      Close;
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '0001';
      Open; {최종작업년월}
      L_LastDate.Caption := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                            Copy(FieldByName('VALUE2').AsString,5,2);
      Lastyymm := Copy(FieldByName('VALUE2').AsString, 1, 6);
      ME_WorkDate.Text := Lastyymm;
      Close;
      //=======(98.01.20 총무관리본부 파견 게획인원 변수 )
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '1001';
      Open;
      pdeptcode := FieldByName('VALUE1').AsString;
      pcount    := FieldByName('VALUE2').AsString;
      close;
      //========
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '0002';
      Open; {계획인원생성일자, 현원생성일자}
      L_PlaneCreate.Caption := Copy(FieldByName('VALUE1').AsString,1,4)+'.'+
                               Copy(FieldByName('VALUE1').AsString,5,2)+'.'+
                               Copy(FieldByName('VALUE1').AsString,7,2);
      L_CurCreate.Caption   := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                               Copy(FieldByName('VALUE2').AsString,5,2)+'.'+
                               Copy(FieldByName('VALUE2').AsString,7,2);
      Close;
      ParamByName('P_gubun').AsString  := 'E2';
      for i := 1 to 8 do begin
          ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
          Open;
          for j := 1 to 3 do  begin
              EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_'+inttostr(j)) as TEdit;
              if EditCom <> nil then
              EditCom.Text := FieldByName('VALUE'+IntToStr(j)).AsString;
          end;
         Close;
      end;
    end;
    Change_PIMVARI := False;
    P_Help.Caption := '';
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;
  EditCom : TEdit;
begin
  if Change_PIMVARI = True then begin
    if MessageBox(handle,'변경된 Comment를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020)
       = ID_YES then begin
      for i := 1 to 8 do begin
        Q_Updatevari.Close;
        Q_Updatevari.SQL.Clear;
        Q_Updatevari.SQL.Add('UPDATE PIMVARI SET ');
        Q_Updatevari.SQL.Add('VALUE1 = :P_value1, ');
        Q_Updatevari.SQL.Add('VALUE2 = :P_value2, ');
        Q_Updatevari.SQL.Add('VALUE3 = :P_value3  ');

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_1') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value1').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_2') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value2').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_3') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value3').AsString := EditCom.Text;

        Q_Updatevari.SQL.Add('WHERE (GUBUN  = :P_gubun ) AND ');
        Q_Updatevari.SQL.Add('      (SGUBUN = :P_sgubun) ');
        Q_Updatevari.ParamByName('P_gubun').AsString  := 'E2';
        Q_Updatevari.ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
        Q_Updatevari.ExecSQL;
        Q_Updatevari.Close;
      end;
    end;
  end;

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TQuery) then
      TQuery(Self.Components[i]).Close;
  Action := caFree;
end;

procedure TMainForm.ClearNumData;
begin
  with NumData do begin
    nttotal    := 0;    nptotal    := 0;
    npdirsum   := 0;    nppos1     := 0;
    nppos2     := 0;    nppos3     := 0;
    nppos4     := 0;    nppos5     := 0;
    nppos6     := 0;    nppos7     := 0;
    nppos8     := 0;    nppos9     := 0;
    npspe      := 0;    npemp      := 0;
    npextrsum  := 0;    nptempsum  := 0;
    npsum      := 0;    npspe2     := 0;
    npspe21    := 0;    npspe22    := 0;
    npspe23    := 0;    npspe24    := 0;
    npspe25    := 0;    npspe26    := 0;
    npspe27    := 0;    npsconsum  := 0;
    npcontsum  := 0;    npimsisum  := 0;
  end;
end;

procedure TMainForm.ClearData;
begin
  with DataIn do begin
    ttotal    := '';    ptotal    := '';
    pdirsum   := '';    ppos1     := '';
    ppos2     := '';    ppos3     := '';
    ppos4     := '';    ppos5     := '';
    ppos6     := '';    ppos7     := '';
    ppos8     := '';    ppos9     := '';
    pspe      := '';    pemp      := '';
    pextrsum  := '';    ptempsum  := '';
    psum      := '';    psconsum  := '';
    pcontsum  := '';    pimsisum  := '';
  end;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까 ?..','확  인',MB_YESNO or $0020)
     = ID_YES then  begin
    if FileExists(HomeDir+'\list\pie2050c.tmp') = True then begin
       DeleteFile(PChar(HomeDir+'\list\pie2050c.tmp'));
       DeleteFile(PChar(HomeDir+'\list\pie2050c.dat'));
    end;
    Close;
  end;
end;

procedure TMainForm.DeptAssign(const QTemp : TQuery; const Fmt : string);
begin
  with DataIn do begin
      ttotal   := FormatFloat(Fmt, QTemp.FieldByName('TTOTAL').AsInteger);
      ptotal   := FormatFloat(Fmt, QTemp.FieldByName('PTOTAL').AsInteger);
      pdirsum  := FormatFloat(Fmt, QTemp.FieldByName('PDIRSUM').AsInteger);
      ppos1    := FormatFloat(Fmt, QTemp.FieldByName('PPOS1').AsInteger);
      ppos2    := FormatFloat(Fmt, QTemp.FieldByName('PPOS2').AsInteger);
      ppos3    := FormatFloat(Fmt, QTemp.FieldByName('PPOS3').AsInteger);
      ppos4    := FormatFloat(Fmt, QTemp.FieldByName('PPOS4').AsInteger);
      ppos5    := FormatFloat(Fmt, QTemp.FieldByName('PPOS5').AsInteger);
      ppos6    := FormatFloat(Fmt, QTemp.FieldByName('PPOS6').AsInteger);
      ppos7    := FormatFloat(Fmt, QTemp.FieldByName('PPOS7').AsInteger);
      ppos8    := FormatFloat(Fmt, QTemp.FieldByName('PPOS8').AsInteger);
      ppos9    := FormatFloat(Fmt, QTemp.FieldByName('PPOS9').AsInteger);
      pspe     := FormatFloat(Fmt, QTemp.FieldByName('PSPE').AsInteger);
      pemp     := FormatFloat(Fmt, QTemp.FieldByName('PTOTAL').AsInteger);
      pextrsum := FormatFloat(Fmt, QTemp.FieldByName('PEXTRSUM').AsInteger);
      ptempsum := FormatFloat(Fmt, QTemp.FieldByName('PTOTAL').AsInteger-
                                   QTemp.FieldByName('TTOTAL').AsInteger);

      //  총무관리본부 파견/교육 계획인원  ,과부족 (인사변수 읽어온 count) 98.2.17
      if (Query_BonData.FieldByName('TPGUBUN_1').AsString = '20') and
          (Query_BonData.FieldByName('deptcode').AsString = Pdeptcode)  then begin
           ttotal := '('+pcount+')';
           ptempsum := FormatFloat(Fmt, QTemp.FieldByName('PTOTAL').AsInteger-
                                                 StrToInt(pcount));
           end;
      //
      psum     := FormatFloat(Fmt, QTemp.FieldByName('PTOTAL').AsInteger +
                                   QTemp.FieldByName('PEXTRSUM').AsInteger);
  end;
end;

procedure TMainForm.DeptSumAssign(const QTemp : TQuery);
begin
  with DataIn do begin
      ttotal   := FormatFloat(sPrn, QTemp.FieldByName('TTOTAL').AsInteger);
      ptotal   := FormatFloat(sPrn, QTemp.FieldByName('PTOTAL').AsInteger+
                                    QTemp.FieldByName('PSPE2').AsInteger);
      pdirsum  := FormatFloat(sPrn, QTemp.FieldByName('PDIRSUM').AsInteger);
      ppos1    := FormatFloat(sPrn, QTemp.FieldByName('PPOS1').AsInteger+
                                    QTemp.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(sPrn, QTemp.FieldByName('PPOS2').AsInteger+
                                    QTemp.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(sPrn, QTemp.FieldByName('PPOS3').AsInteger+
                                    QTemp.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(sPrn, QTemp.FieldByName('PPOS4').AsInteger+
                                    QTemp.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(sPrn, QTemp.FieldByName('PPOS5').AsInteger+
                                    QTemp.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(sPrn, QTemp.FieldByName('PPOS6').AsInteger+
                                    QTemp.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(sPrn, QTemp.FieldByName('PPOS7').AsInteger+
                                    QTemp.FieldByName('PSPE27').AsInteger);
      ppos8    := FormatFloat(sPrn, QTemp.FieldByName('PPOS8').AsInteger);
      ppos9    := FormatFloat(sPrn, QTemp.FieldByName('PPOS9').AsInteger);
      pspe     := FormatFloat(sPrn, QTemp.FieldByName('PSPE').AsInteger);
      pemp     := FormatFloat(sPrn, QTemp.FieldByName('PTOTAL').AsInteger+
                                    QTemp.FieldByName('PSPE2').AsInteger);
      //민용 2003.07.21 전 2003-9433 오종석 요청 -> 비정규직 인원(전계, 계약, 일반, 계) 추가
      // 전문계약직
      psconsum := FormatFloat(sPrn, QTemp.FieldByName('psconsum').AsInteger);
      // 계약직
      pcontsum := FormatFloat(sPrn, QTemp.FieldByName('pcontsum').AsInteger);
      // 일반직
      pextrsum := FormatFloat(sPrn, QTemp.FieldByName('PEXTRSUM').AsInteger);
      // 소계
      pimsisum := FormatFloat(sPrn, QTemp.FieldByName('pcontsum').AsInteger  +
                                     QTemp.FieldByName('pextrsum').AsInteger  +
                                     QTemp.FieldByName('psconsum').AsInteger);
      //과부족
      ptempsum := FormatFloat(sPrn, (QTemp.FieldByName('PTOTAL').AsInteger+
                                     QTemp.FieldByName('PSPE2').AsInteger)-
                                    QTemp.FieldByName('TTOTAL').AsInteger);
      //총계
      psum     := FormatFloat(sPrn, QTemp.FieldByName('PTOTAL').AsInteger    +
                                    QTemp.FieldByName('pcontsum').AsInteger  +
                                    QTemp.FieldByName('pextrsum').AsInteger  +
                                    QTemp.FieldByName('psconsum').AsInteger  +
                                    QTemp.FieldByName('PSPE2').AsInteger);
  end;
end;

procedure TMainForm.JunimAssign(const QTemp : TQuery);
begin
  with DataIn do begin
      ttotal   := FormatFloat(dPrn, 0);
      ptotal   := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
      pdirsum  := FormatFloat(dPrn, 0);
      ppos1    := FormatFloat(dPrn, QTemp.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(dPrn, QTemp.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(dPrn, QTemp.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(dPrn, QTemp.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(dPrn, QTemp.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(dPrn, QTemp.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(dPrn, QTemp.FieldByName('PSPE27').AsInteger);
      pspe     := FormatFloat(dPrn, 0);
      pemp     := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
      ptempsum := FormatFloat(dPrn, 0);
      pextrsum := FormatFloat(dPrn, 0);
      psum     := FormatFloat(dPrn, QTemp.FieldByName('PSPE2').AsInteger);
  end;
end;

function TMainForm.PageCheck(var pageLine : integer; gubun : integer) : Boolean;
begin
  PageCheck := False;
  if pageLine > 37 then begin  // 민용 2003.11.19   if pageLine > 40 -> if pageLine > 37로 수정
     if gubun = 1 then begin
        ClearData; DataIn.flag := 'S'; System.Write(Fout, DataIn);
        ClearData; DataIn.flag := 'P'; System.Write(Fout, DataIn);
     end;
     if gubun = 2 then begin
        System.WriteLn(FCom, 'PAGESKIP');
     end;
     pageLine := 1;  PageCheck := True;
  end;
end;

procedure TMainForm.Update_History;
var
  Temp_no    : Integer;
begin
     Q_date.Close;
     Q_date.Sql.Clear;
     Q_date.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Q_date.Sql.Add('  WHERE  PROGID = ''PIE2050C''               ');
     Q_date.Open;
     Temp_No    := Q_date.FieldByName('NO').AsInteger + 1;
     Q_date.Close;


     Q_date.Sql.Clear;
     Q_date.Sql.Add('INSERT INTO PYMPHIS                                                  ');
     Q_date.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
     Q_date.Sql.Add('VALUES                                                               ');
     Q_date.Sql.Add('   (                                                                 ');
     Q_date.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
     Q_date.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PIE2050C'',                 ');
     Q_date.Sql.Add('       '''+rstr+''',                                              ');
     Q_date.Sql.Add('       ''과단위 부서별 인원현황을 TEXT 화일로 출력한다.'')                               ');
     Q_date.ExecSQL;
     Q_date.Close;
end;


procedure TMainForm.BB_ScreenClick(Sender: TObject);
var
  rStr: string[8];
  LineCnt,cnt,ProgressCnt: Integer;
  Buff, Buff1,Buff2,Buff3,Buff4 : string;
  imsi_boncode: string[6];
  New_dept, Single_dept : Boolean;
  Single_dept1 : integer;
  JeonSpace : string;
begin
  Update_History; //log 남기기 위해 2002.06.24 shm 추가
  P_Help.Caption := '부서/BAND별 [인원 총계]를 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  if (trim(ME_WorkDate.Text) = '') or (ME_WorkDate.Text > Lastyymm) then begin
    MessageBox(handle,'작업년월 오류입니다.','에  러',MB_OK or $0020);
    ME_WorkDate.SetFocus;
    System.Exit;
  end;

  G_Progress.Progress := 0;
  Query_TotalSum.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
  Query_TotalSum.ParamByName('ldeptcode1').AsString := deptcode1.Text;
  Query_TotalSum.ParamByName('ldeptcode2').AsString := deptcode2.Text;
  Query_TotalSum.Open;
  if Query_TotalSum.FieldByName('PTOTAL').AsInteger = 0 then begin
    MessageBox(handle,'작업조건에 맞는 자료가 없습니다.','알  림',MB_OK or $0030);
    Query_TotalSum.Close;   P_Help.Caption := '';
    System.Exit;
  end;

  if Trim(ME_WorkDate.Text) < '200404' then
  begin
    if Trim(ME_WorkDate.Text) <= '199812' then
      AReport := PrintForm.InReport
    else
      AReport := NewPrintForm.InReport;

    AssignFile(Fout, HomeDir+'\list\pie2050c.tmp');

    System.ReWrite(Fout); LineCnt := 1;

    with DataIn do begin
      ClearData; ClearNumData;  deptname := '   총     계';
      DeptSumAssign(Query_TotalSum);

      flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
      ClearData;   flag := 'S'; System.Write(Fout, DataIn);

      if Query_TotalSum.FieldByName('PSPE2').AsInteger > 0 then begin
        ClearData;
        deptname := '   (전임행정총계)';
        JunimAssign(Query_TotalSum);

        flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
        ClearData; flag := 'S'; System.Write(Fout, DataIn);
      end;
      Query_TotalSum.Close;
  {-------------------------------------------------------------------------------
    버전     수정일     수정자   관련근거         수정내용
    1.01   1998.04.14   김순례  전(98.4.11)   sectcode(부문)별 인원계 추가
  --------------------------------------------------------------------------------}
      {부문별(sectcode) 소계}
      Query_SecTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
      Query_SecTotal.ParamByName('ldeptcode1').AsString := deptcode1.Text;
      Query_SecTotal.ParamByName('ldeptcode2').AsString := deptcode2.Text;
      Query_SecTotal.Open;
      ProgressCnt := 0;
      while not Query_SecTotal.Eof do begin
        inc(ProgressCnt);
        G_Progress.Progress := (ProgressCnt*100) div Query_SecTotal.RecordCount;
        SendMessage(Panel5.handle,WM_PAINT,0,0);
        ClearData;
        Qbondept.ParamByName('P_orgnum').AsString   := Query_SecTotal.FieldByName('orgnum').AsString;
        //30.05   2003.11.19   이민용   자체         'H07' 조직개편으로 rpad함수 추가
        Qbondept.ParamByName('P_deptcode').AsString := rpad(Query_SecTotal.FieldByName('sectcode').AsString,5,'0');
        deptname := '★ ' + DeptNameFind;
        P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        DeptSumAssign(Query_SecTotal);
        Single_dept  := True; {부분만 있고 하위 본부, 부,과가 없음을 나타냄}

        flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
        if PageCheck(LineCnt,1) = False then begin
           ClearData; flag := 'S'; System.Write(Fout, DataIn);
        end;

        if Query_SecTotal.FieldByName('PSPE2').AsInteger > 0 then begin
          ClearData;  deptname := '   (전임행정소계)';
          JunimAssign(Query_SecTotal);

          flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(Cnt);
          if PageCheck(LineCnt,1) = False then begin
              ClearData; flag := 'S'; System.Write(Fout, DataIn);
          end;
        end;
  {    //===sectcode에대한 부서등급이 A0(98.01.20) 차후 계획인원을 세분화할경우 수정요
        Query_Depdata.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
        Query_DepData.ParamByName('P_orgnum').AsString  := Query_SecTotal.FieldByName('ORGNUM').AsString;
        Query_DepData.ParamByName('ldeptcode1').AsString := deptcode1.Text;
        Query_DepData.ParamByName('ldeptcode2').AsString := deptcode2.Text;
        Query_DepData.ParamByName('P_sectcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
        Query_DepData.Open;
        while not Query_DepData.Eof do begin
          Qbondept.ParamByName('P_orgnum').AsString   := Query_SecTotal.FieldByName('ORGNUM').AsString;
          Qbondept.ParamByName('P_deptcode').AsString := Query_DepData.FieldByName('DEPTCODE').AsString;
          deptname := DeptNameFind;  //본부명 출력
        if (copy(DeptLevel,1,1) = 'A')  then begin        // 부문
           ClearData;
           deptname := '○ ' + deptname;  //본부명 출력
           P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
           SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

           JeonSpace := '   ';    //전임행정직앞에 Spaces 첨가용
           Single_dept  := True;  //본부만 있고 하위 부,과가 없음을 나타냄

           single_dept1 := 0;      //부서별 소계출력여부 결정용
           if Query_DepData.FieldByName('TPGUBUN_1').AsString = '20' then begin
              deptname := '    (파견/교육)';
              DeptAssign(Query_DepData,dPrn);
            end else DeptSumAssign(Query_DepData);
              flag  := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
              if PageCheck(LineCnt,1) = False then begin
                 ClearData; flag := 'S'; System.Write(Fout, DataIn);
              end;
            end;
           Query_DepData.Next;
          end;
          Query_DepData.close;
          }
      //==========================================================
      {부문별 소계}
      Query_SubTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
      Query_SubTotal.ParamByName('ldeptcode1').AsString := deptcode1.Text;
      Query_SubTotal.ParamByName('ldeptcode2').AsString := deptcode2.Text;
      Query_SubTotal.ParamByName('P_sectcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
      Query_SubTotal.Open;
      while not Query_SubTotal.Eof do begin
        ClearData;
        Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('orgnum').AsString;
        // 30.05   2003.11.19   이민용   자체         'H07' 조직개편으로 rpad함수 추가
        Qbondept.ParamByName('P_deptcode').AsString := rpad(Query_SubTotal.FieldByName('fieldcode').AsString,5,'0');
        deptname := '■ ' + DeptNameFind;
        P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        DeptSumAssign(Query_SubTotal);
        Single_dept  := True; {부분만 있고 하위 본부, 부,과가 없음을 나타냄}

        flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
        if PageCheck(LineCnt,1) = False then begin
           ClearData; flag := 'S'; System.Write(Fout, DataIn);
        end;

        if Query_SubTotal.FieldByName('PSPE2').AsInteger > 0 then begin
          ClearData;  deptname := '   (전임행정소계)';
          JunimAssign(Query_SubTotal);

          flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(Cnt);
          if PageCheck(LineCnt,1) = False then begin
              ClearData; flag := 'S'; System.Write(Fout, DataIn);
          end;
        end;
        // 부문별 총계 Query에서 부문코드, 조직차수를 가져와 그 조건에 맞는 자료의
        // 본부별 계를 그룹으로 구한다
        Query_BonTotal.ParamByName('P_topoym').AsString    := ME_WorkDate.Text;
        Query_BonTotal.ParamByName('P_orgnum').AsString    := Query_SubTotal.FieldByName('ORGNUM').AsString;
        Query_BonTotal.ParamByName('P_sectcode').AsString  := Query_SubTotal.FieldByName('SECTCODE').AsString;
        Query_BonTotal.ParamByName('P_fieldcode').AsString := Query_SubTotal.FieldByName('FIELDCODE').AsString;
        Query_BonTotal.ParamByName('ldeptcode1').AsString  := deptcode1.Text;
        Query_BonTotal.ParamByName('ldeptcode2').AsString  := deptcode2.Text;
        Query_BonTotal.Open;

        while not Query_BonTotal.Eof do begin
          {본부별 내용을 출력한다, 과별소계는 직접계산, 본부계는 나중에 출력}
          cnt := 0;
          Query_BonData.ParamByName('P_topoym').AsString    := ME_WorkDate.Text;
          Query_BonData.ParamByName('P_orgnum').AsString    := Query_SubTotal.FieldByName('ORGNUM').AsString;
          Query_BonData.ParamByName('P_sectcode').AsString := Query_SubTotal.FieldByName('SECTCODE').AsString;
          Query_BonData.ParamByName('P_fieldcode').AsString := Query_SubTotal.FieldByName('FIELDCODE').AsString;
          Query_BonData.ParamByName('P_boncode').AsString   := Query_BonTotal.FieldByName('BONCODE').AsString;
          Query_BonData.ParamByName('ldeptcode1').AsString  := deptcode1.Text;
          Query_BonData.ParamByName('ldeptcode2').AsString  := deptcode2.Text;
          Query_BonData.Open;

          New_dept := true;    {새로운 부의 시작을 나타냄}
          while not Query_BonData.Eof do begin
            Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('ORGNUM').AsString;
            Qbondept.ParamByName('P_deptcode').AsString := Query_BonData.FieldByName('DEPTCODE').AsString;
            deptname := DeptNameFind;  {본부명 출력}
            if (copy(DeptLevel,1,1) <= 'C') or         //본부,(실,단)
               (copy(DeptLevel,1,2) = '40') or         // 사장.
               (copy(DeptLevel,1,2) = '50') then begin // 부사장,감사
              ClearData;
              deptname := '○ ' + deptname;  {본부명 출력}
              P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
              SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

              JeonSpace := '   ';    {전임행정직앞에 Spaces 첨가용}
              Single_dept  := True;  {본부만 있고 하위 부,과가 없음을 나타냄}

              single_dept1 := 0;     {부서별 소계출력여부 결정용}
              if Query_BonData.FieldByName('TPGUBUN_1').AsString = '20' then begin
                 deptname := '    (파견/교육)';
                 DeptAssign(Query_BonData,dPrn);
              end else DeptSumAssign(Query_BonData);

              flag  := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
              if PageCheck(LineCnt,1) = False then begin
                 ClearData; flag := 'S'; System.Write(Fout, DataIn);
              end;
            end;

            if copy(DeptLevel,1,1) = 'D' then begin  {부단위}
              ClearData;  deptname := ' ◆ ' + deptname;  {부명 출력}
              P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
              SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
              JeonSpace := '    ';
              Single_dept  := False;
              Single_dept1 := 0;
              if Query_BonData.FieldByName('TPGUBUN_1').AsString = '20' then begin
                 deptname := '    (파견/교육)';
                 DeptAssign(Query_BonData,dPrn);
              end else DeptSumAssign(Query_BonData);
              flag  := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); PageCheck(LineCnt,1);
              if New_dept then begin
                imsi_boncode := Query_BonData.FieldByName('DEPTCODE').AsString; {부가 바뀌는 것을 check}
                ClearNumData;
                New_dept := False;
              end;
            end;

            if copy(DeptLevel,1,1) = 'E' then begin  {과단위}
              ClearData;
              deptname := '  · ' + deptname; {과명 출력}
              P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
              SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
              JeonSpace := '     ';
              Single_dept := False;
              Inc(Single_dept1);
              if Query_BonData.FieldByName('TPGUBUN_1').AsString = '20' then begin
                 deptname := '    (파견/교육)';
                 DeptAssign(Query_BonData,dPrn);
              end else DeptSumAssign(Query_BonData);
              flag  := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); PageCheck(LineCnt,1);
              if New_dept then begin
                imsi_boncode := Query_BonData.FieldByName('DEPTCODE').AsString; {부가 바뀌는 것을 check}
                ClearNumData;
                New_dept := False;
              end;
            end;

            if Query_BonData.FieldByName('PSPE2').AsInteger > 0 then begin
              ClearData;   deptname := JeonSpace + '(전임행정직)';
              JunimAssign(Query_BonData);
              P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
              SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

              flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(cnt);
              PageCheck(LineCnt,1);
            end;
            {본부명이 아니면 부별 소계누적}
            if Query_BonData.FieldByName('DEPTCODE').AsString <>
               Query_BonData.FieldByName('BONCODE').AsString then begin
              // 부별 소계를 구하기 위해 누적
              // 단 파견,교육일경우는 소계를 더하지 않는다.
              if Query_BonData.FieldByName('TPGUBUN_1').AsString <> '20' then
              with NumData do begin
                Inc(nttotal   ,Query_BonData.FieldByName('TTOTAL').AsInteger);
                Inc(nptotal   ,Query_BonData.FieldByName('PTOTAL').AsInteger);
                Inc(npdirsum  ,Query_BonData.FieldByName('PDIRSUM').AsInteger);
                Inc(nppos1    ,Query_BonData.FieldByName('PPOS1').AsInteger);
                Inc(nppos2    ,Query_BonData.FieldByName('PPOS2').AsInteger);
                Inc(nppos3    ,Query_BonData.FieldByName('PPOS3').AsInteger);
                Inc(nppos4    ,Query_BonData.FieldByName('PPOS4').AsInteger);
                Inc(nppos5    ,Query_BonData.FieldByName('PPOS5').AsInteger);
                Inc(nppos6    ,Query_BonData.FieldByName('PPOS6').AsInteger);
                Inc(nppos7    ,Query_BonData.FieldByName('PPOS7').AsInteger);
                Inc(nppos8    ,Query_BonData.FieldByName('PPOS8').AsInteger);
                Inc(nppos9    ,Query_BonData.FieldByName('PPOS9').AsInteger);
                Inc(npspe     ,Query_BonData.FieldByName('PSPE').AsInteger);
                Inc(npemp     ,Query_BonData.FieldByName('PTOTAL').AsInteger);
                Inc(npextrsum ,Query_BonData.FieldByName('PEXTRSUM').AsInteger);
                Inc(nptempsum ,Query_BonData.FieldByName('PTOTAL').AsInteger-
                               Query_BonData.FieldByName('TTOTAL').AsInteger);
                Inc(npsum     ,Query_BonData.FieldByName('PTOTAL').AsInteger +
                               Query_BonData.FieldByName('PSPE2').AsInteger +
                               Query_BonData.FieldByName('PEXTRSUM').AsInteger);
                Inc(npspe2    ,Query_BonData.FieldByName('PSPE2').AsInteger);
                Inc(npspe21   ,Query_BonData.FieldByName('PSPE21').AsInteger);
                Inc(npspe22   ,Query_BonData.FieldByName('PSPE22').AsInteger);
                Inc(npspe23   ,Query_BonData.FieldByName('PSPE23').AsInteger);
                Inc(npspe24   ,Query_BonData.FieldByName('PSPE24').AsInteger);
                Inc(npspe25   ,Query_BonData.FieldByName('PSPE25').AsInteger);
                Inc(npspe26   ,Query_BonData.FieldByName('PSPE26').AsInteger);
                Inc(npspe27   ,Query_BonData.FieldByName('PSPE27').AsInteger);
              end;
              //==============
              Query_BonData.Next;
              if Query_BonData.Eof or
                 ( (Copy(imsi_boncode,1,4) <> {부가 바뀌면 소계출력}
                   Copy(Query_BonData.FieldByName('DEPTCODE').AsString,1,4)) ) then begin
                if Single_dept1 >= 1 then begin
               //민용 2003.07.19 수정중
                  {ClearData;  deptname := '    <소   계>';
                  ttotal   := FormatFloat(sPrn, NumData.nttotal);
                  ptotal   := FormatFloat(sPrn, NumData.nptotal+NumData.npspe2);
                  pdirsum  := FormatFloat(sPrn, NumData.npdirsum);
                  ppos1    := FormatFloat(sPrn, NumData.nppos1+NumData.npspe21);
                  ppos2    := FormatFloat(sPrn, NumData.nppos2+NumData.npspe22);
                  ppos3    := FormatFloat(sPrn, NumData.nppos3+NumData.npspe23);
                  ppos4    := FormatFloat(sPrn, NumData.nppos4+NumData.npspe24);
                  ppos5    := FormatFloat(sPrn, NumData.nppos5+NumData.npspe25);
                  ppos6    := FormatFloat(sPrn, NumData.nppos6+NumData.npspe26);
                  ppos7    := FormatFloat(sPrn, NumData.nppos7+NumData.npspe27);
                  ppos8    := FormatFloat(sPrn, NumData.nppos8);
                  ppos9    := FormatFloat(sPrn, NumData.nppos9);
                  pspe     := FormatFloat(sPrn, NumData.npspe);
                  pemp     := FormatFloat(sPrn, NumData.npemp+NumData.npspe2);
                  ptempsum := FormatFloat(sPrn, NumData.nptempsum+NumData.npspe2);
                  pextrsum := FormatFloat(sPrn, NumData.npextrsum);
                  psum     := FormatFloat(sPrn, NumData.npsum);
                  flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
                  PageCheck(LineCnt,1);  }
                  if NumData.npspe2 > 0 then begin
                    ClearData;  deptname := '    <전임행정직 부계>';
                    P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
                    SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
                    ptotal   := FormatFloat(dPrn, NumData.npspe2);
                    ppos1    := FormatFloat(dPrn, NumData.npspe21);
                    ppos2    := FormatFloat(dPrn, NumData.npspe22);
                    ppos3    := FormatFloat(dPrn, NumData.npspe23);
                    ppos4    := FormatFloat(dPrn, NumData.npspe24);
                    ppos5    := FormatFloat(dPrn, NumData.npspe25);
                    ppos6    := FormatFloat(dPrn, NumData.npspe26);
                    ppos7    := FormatFloat(dPrn, NumData.npspe27);
                    pemp     := FormatFloat(dPrn, NumData.npspe2);
                    psum     := FormatFloat(dPrn, NumData.npspe2);
                    flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(cnt);
                    PageCheck(LineCnt,1);
                  end;
                end;
                imsi_boncode := Query_BonData.FieldByName('DEPTCODE').AsString;
                New_dept := True; {새로운 부의 시작을 알림}
                Single_dept1 := 0;
              end;
            end else begin
              Query_BonData.Next;
            end;
          end;
          Query_BonData.Close;
          {본부계출력}
          {본부만 있고 하위 부,과가 없으면 인쇄안함}
          if not Single_dept then begin
            ClearData;  deptname := '    [팀 계]';  //민용 수정중 2003.07.19 본부계 -> 팀계로 명칭 변경
            DeptSumAssign(Query_BonTotal);
            flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
            if PageCheck(LineCnt,1) = False then begin
               if Query_BonTotal.FieldByName('PSPE2').AsInteger = 0  then begin
                  ClearData; flag := 'S'; System.Write(Fout, DataIn);
               end;
            end;
            if Query_BonTotal.FieldByName('PSPE2').AsInteger > 0 then begin
              ClearData; deptname := '    [전임행정직 본부계]';
              JunimAssign(Query_BonTotal);
              P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
              SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

              flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(Cnt);
              if PageCheck(LineCnt,1) = False then begin
                 ClearData; flag := 'S'; System.Write(Fout, DataIn);
              end;
            end;
          end else begin
            if (cnt > 0) and (LineCnt > 1) then begin
               ClearData; flag := 'S'; System.Write(Fout, DataIn);
            end;
          end;
          Query_BonTotal.Next;
          Single_dept := True;
        end;
        Query_BonTotal.Close;
        Query_SubTotal.Next;
      end; {while, 부문별 소계}
      Query_SubTotal.Close;
      Query_SecTotal.Next;
    // 98.01.15
     end; {while,  sect(부문별)소계}
     Query_SecTotal.Close;

    end; {with}
    System.Close(Fout);

    {comment 처리}
    Query_comment1.Close;
    AssignFile(FCom, HomeDir+'\list\pie2050c.dat');

    System.ReWrite(FCom);
    Query_comment1.ParamByName('P_topoym').AsString    := ME_WorkDate.Text;
    Query_comment1.ParamByName('ldeptcode1').AsString  := deptcode1.Text;
    Query_comment1.ParamByName('ldeptcode2').AsString  := deptcode2.Text;
    Query_comment1.Open;
    with Query_comment1 do begin
        Buff:='① 총괄현원 ['+IntToStr(FieldByName('TOTCUR').AsInteger)+
              ' 명] = 정규직 + 계약직[임원은 제외]';
        System.WriteLn(FCom, Buff);
        inc(LineCnt);
        PageCheck(LineCnt,2);

        Buff1 := '';  Buff2 := '';  Buff3 := '';  Buff4 := '';
        Buff1 := '   ☞ 임원 ['+IntToStr(FieldByName('PDIRSUM').AsInteger)+' 명] : ';
        if FieldByName('PDIR11').AsInteger <> 0 then
           Buff1:=Buff1+'회장 '+IntToStr(FieldByName('PDIR11').AsInteger)+', ';
        if FieldByName('PDIR12').AsInteger <> 0 then
           Buff1:=Buff1+'부회장 '+IntToStr(FieldByName('PDIR12').AsInteger)+', ';
        if FieldByName('PDIR21').AsInteger <> 0 then
           Buff1:=Buff1+'사장 '+IntToStr(FieldByName('PDIR21').AsInteger)+', ';
        if FieldByName('PDIR31').AsInteger <> 0 then
           Buff1:=Buff1+'감사 '+IntToStr(FieldByName('PDIR31').AsInteger)+', ';
        if FieldByName('PDIR41').AsInteger <> 0 then
           Buff1:=Buff1+'부사장 '+IntToStr(FieldByName('PDIR41').AsInteger)+', ';
        if FieldByName('PDIR51').AsInteger <> 0 then
           Buff1:=Buff1+'전무 '+IntToStr(FieldByName('PDIR51').AsInteger)+', ';
        if FieldByName('PDIR61').AsInteger <> 0 then
           Buff1:=Buff1+'상무 '+IntToStr(FieldByName('PDIR61').AsInteger)+', ';
        if FieldByName('PDIR6A').AsInteger <> 0 then
           Buff1:=Buff1+'선임연구위원1 '+IntToStr(FieldByName('PDIR6A').AsInteger)+', ';
  {      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);}

  {-----------------------------------------------------------------------
     버전     수정일     수정자   관련근거        수정내용
   30.18   2000.03.08   김대훈       -          출력물 소계부분 이사를 상무보로 변경
  -----------------------------------------------------------------------}
  //      if FieldByName('PDIR71').AsInteger <> 0 then
  //         Buff2:=Buff2+'이사 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
        if FieldByName('PDIR71').AsInteger <> 0 then
           Buff2:=Buff2+'상무보 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
        if FieldByName('PDIR72').AsInteger <> 0 then
           Buff2:=Buff2+'이사대우 '+IntToStr(FieldByName('PDIR72').AsInteger)+', ';
        if FieldByName('PDIR7A').AsInteger <> 0 then
           Buff2:=Buff2+'선임연구위원2 '+IntToStr(FieldByName('PDIR7A').AsInteger)+', ';
        if FieldByName('PDIRETC').AsInteger <> 0 then
           Buff2:=Buff2+'기타 '+IntToStr(FieldByName('PDIRETC').AsInteger)+', ';

        if (length(Buff1)+length(Buff2)) < 110 then begin
           Buff := Buff1 + Buff2;
           Buff := Copy(Buff, 1, length(Buff)-2);   {끝부분의 ", "제거}
           System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
        end
        else begin
           System.WriteLn(FCom, Buff1); inc(LineCnt); PageCheck(LineCnt,2);
           Buff := '                     ' + Buff2;
           Buff := Copy(Buff, 1, length(Buff)-2);   {끝부분의 ", "제거}
           System.WriteLn(FCom, Buff);
           inc(LineCnt);
           PageCheck(LineCnt,2);
        end;

        Buff:='② 특정직현원 ['+IntToStr(FieldByName('PSPE').AsInteger)+' 명] = ';
        if FieldByName('PSPE1').AsInteger <> 0 then
           Buff:=Buff+'특정기술직['+IntToStr(FieldByName('PSPE1').AsInteger)+' 명] + ';
        if FieldByName('PSPE3').AsInteger <> 0 then
           Buff:=Buff+'특수직['+IntToStr(FieldByName('PSPE3').AsInteger)+' 명] + ';
        if FieldByName('PSPE4').AsInteger <> 0 then
           Buff:=Buff+'특정행정직['+IntToStr(FieldByName('PSPE4').AsInteger)+' 명] + ';
  {      Buff:=Buff+'기타1['+IntToStr(FieldByName('PSPE5').AsInteger) +' 명]';}
        Buff := Copy(Buff, 1, length(Buff)-3);   {끝부분의 " + "제거}
        System.WriteLn(FCom, Buff); inc(LineCnt);
        PageCheck(LineCnt,2);

        Buff:='③ 비정규직 ['+IntToStr(FieldByName('PIMSISUM').AsInteger)+' 명] = ';
        if FieldByName('PEXTR1').AsInteger <> 0 then
           Buff:=Buff+'고문['+IntToStr(FieldByName('PEXTR1').AsInteger)+' 명] + ';
        if FieldByName('PEXTR2').AsInteger <> 0 then
           Buff:=Buff+'촉탁['+IntToStr(FieldByName('PEXTR2').AsInteger)+' 명] + ';
        if FieldByName('PEXTR3').AsInteger <> 0 then
           Buff:=Buff+'용무['+IntToStr(FieldByName('PEXTR3').AsInteger)+' 명] + ';
        if FieldByName('PSCONSUM').AsInteger <> 0 then
           Buff:=Buff+'전문계약직['+IntToStr(FieldByName('PSCONSUM').AsInteger)+' 명] + ';
        if FieldByName('PCONTSUM').AsInteger <> 0 then
           Buff:=Buff+'계약직['+IntToStr(FieldByName('PCONTSUM').AsInteger)+' 명] + ';
        if FieldByName('PTEMPSUM').AsInteger <> 0 then
           Buff:=Buff+'일반사원['+IntToStr(FieldByName('PTEMPSUM').AsInteger)+' 명] + ';

  {      Buff:=Buff+'기타1['+IntToStr(FieldByName('PEXTR4').AsInteger)+' 명] + ';
        Buff:=Buff+'기타2['+IntToStr(FieldByName('PEXTR5').AsInteger)+' 명]';}
        Buff := Copy(Buff, 1, length(Buff)-3);   {끝부분의 " + "제거}
        System.WriteLn(FCom, Buff); inc(LineCnt);
        PageCheck(LineCnt,2);
    end; {with}
    {comment 1}
    if Edit1_1.Text+Edit1_2.Text+Edit1_3.Text <> '' then begin
      Buff := Edit1_1.Text+Edit1_2.Text+Edit1_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt);
      PageCheck(LineCnt,2);
    end;
  {
    Query_comment2.ParamByName('P_topoym').AsString    := ME_WorkDate.Text;
    Query_comment2.ParamByName('ldeptcode1').AsString  := deptcode1.Text;
    Query_comment2.ParamByName('ldeptcode2').AsString  := deptcode2.Text;
    Query_comment2.Open;
    with Query_comment2 do begin
        Buff1 := '';  Buff2 := '';  Buff3 := '';  Buff4 := '';
        Buff:='   ☞ 노조전임간부 ['+IntToStr(FieldByName('PSUM').AsInteger)+' 명] : ';
        if FieldByName('PPOS1').AsInteger <> 0 then
           Buff1:=Buff1+'일반직1급('+IntToStr(FieldByName('PPOS1').AsInteger)+'), ';
        if FieldByName('PPOS2').AsInteger <> 0 then
           Buff1:=Buff1+'일반직2급('+IntToStr(FieldByName('PPOS2').AsInteger)+'), ';
        if FieldByName('PPOS3').AsInteger <> 0 then
           Buff1:=Buff1+'일반직3급('+IntToStr(FieldByName('PPOS3').AsInteger)+'), ';
        if FieldByName('PPOS4').AsInteger <> 0 then
           Buff1:=Buff1+'일반직4급('+IntToStr(FieldByName('PPOS4').AsInteger)+'), ';
        if FieldByName('PPOS5').AsInteger <> 0 then
           Buff1:=Buff1+'일반직5급('+IntToStr(FieldByName('PPOS5').AsInteger)+'), ';
        System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
        Buff := '                         ';

        if FieldByName('PPOS6').AsInteger <> 0 then
           Buff2:=Buff2+'일반직6급('+IntToStr(FieldByName('PPOS6').AsInteger)+'), ';
        if FieldByName('PPOS7').AsInteger <> 0 then
           Buff2:=Buff2+'일반직7급('+IntToStr(FieldByName('PPOS7').AsInteger)+'), ';
        Buff:=Buff+'현원일반직8급 '+IntToStr(FieldByName('PPOS8').AsInteger)+', ';
        System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
        Buff := '                         ';
        if FieldByName('PSPE21').AsInteger <> 0 then
           Buff3:=Buff3+'전임행정직1급('+IntToStr(FieldByName('PSPE21').AsInteger)+'), ';
        if FieldByName('PSPE22').AsInteger <> 0 then
           Buff3:=Buff3+'전임행정직2급('+IntToStr(FieldByName('PSPE22').AsInteger)+'), ';
        if FieldByName('PSPE23').AsInteger <> 0 then
           Buff3:=Buff3+'전임행정직3급('+IntToStr(FieldByName('PSPE23').AsInteger)+'), ';
        if FieldByName('PSPE24').AsInteger <> 0 then
           Buff3:=Buff3+'전임행정직4급('+IntToStr(FieldByName('PSPE24').AsInteger)+'), ';
        if FieldByName('PSPE25').AsInteger <> 0 then
           Buff3:=Buff3+'전임행정직5급('+IntToStr(FieldByName('PSPE25').AsInteger)+'), ';
        System.WriteLn(FCom, Buff);  inc(LineCnt); PageCheck(LineCnt,2);
        Buff := '                         ';

        if FieldByName('PSPE26').AsInteger <> 0 then
           Buff4:=Buff4+'전임행정직6급('+IntToStr(FieldByName('PSPE26').AsInteger)+'), ';
        if FieldByName('PSPE27').AsInteger <> 0 then
           Buff4:=Buff4+'전임행정직7급('+IntToStr(FieldByName('PSPE27').AsInteger)+'), ';
        System.WriteLn(FCom, Buff);  inc(LineCnt); PageCheck(LineCnt,2);
        if length(Buff1) <> 0 then
           Buff := Buff + Buff1;
        if length(Buff2) <> 0 then begin
           if (length(Buff)+length(Buff2)) < 110 then
              Buff := Buff + Buff2
           else begin
              System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
              Buff := '                            '+Buff2;
           end;
        end;
        if length(Buff3) <> 0 then begin
           if (length(Buff)+length(Buff3)) < 110 then
              Buff := Buff + Buff3
           else begin
              System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
              Buff := '                            '+Buff3;
           end;
        end;
        if length(Buff4) <> 0 then begin
           if (length(Buff)+length(Buff4)) < 110 then
              Buff := Buff + Buff4
           else begin
              System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
              Buff := '                            '+Buff4;
           end;
        end;
        Buff := Copy(Buff, 1, length(Buff)-2);   //끝부분의 ", "제거
        System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
  }
      {comment 2 ~ 8}
    if Edit2_1.Text+Edit2_2.Text+Edit2_3.Text <> '' then begin
      Buff := Edit2_1.Text+Edit2_2.Text+Edit2_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit3_1.Text+Edit3_2.Text+Edit3_3.Text <> '' then begin
      Buff := Edit3_1.Text+Edit3_2.Text+Edit3_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit4_1.Text+Edit4_2.Text+Edit4_3.Text <> '' then begin
      Buff := Edit4_1.Text+Edit4_2.Text+Edit4_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit5_1.Text+Edit5_2.Text+Edit5_3.Text <> '' then begin
      Buff := Edit5_1.Text+Edit5_2.Text+Edit5_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit6_1.Text+Edit6_2.Text+Edit6_3.Text <> '' then begin
      Buff := Edit6_1.Text+Edit6_2.Text+Edit6_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit7_1.Text+Edit7_2.Text+Edit7_3.Text <> '' then begin
      Buff := Edit7_1.Text+Edit7_2.Text+Edit7_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    if Edit8_1.Text+Edit8_2.Text+Edit8_3.Text <> '' then begin
      Buff := Edit8_1.Text+Edit8_2.Text+Edit8_3.Text;
      System.WriteLn(FCom, Buff); inc(LineCnt); PageCheck(LineCnt,2);
    end;
    System.Close(FCom);
    P_Help.Caption := '추출된 자료를 출력합니다.';
    if TBitBtn(Sender).Name = 'BB_Print' then  {인쇄}
    begin
      wordpad := False;
      AReport.Print;
    end
    else if TBitBtn(Sender).Name = 'Bwink' then begin
       wordpad := True;
       Form_TextFile;
         if WinExec(PChar('c:\program files\Accessories\wordpad '+HomeDir+'\list\pie2050c.out'),SW_SHOW) < 32 then
            WinExec(PChar('edit '+HomeDir+'\list\pie2050c.out'),SW_SHOW);
    end  else
    begin
      wordpad := False;
      P_Help.Caption := '추출된 자료를 출력합니다.';
      //QRprinter.OnPreView := ShowPreView; {사용자정의 미리보기 화면}
      AReport.PreView;
    end;
  end
  else begin //2004년 04월 부터 의 자료
    if TBitBtn(Sender).Name = 'BB_Screen' then
    begin
      NewPrintForm2.InReport.Preview;
    end
    else if TBitBtn(Sender).Name = 'BB_Print' then
    begin
      NewPrintForm2.InReport.Print;
    end;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';
  G_Progress.Progress := 0;
end;

function TMainForm.DeptNameFind : string;
begin
     Qbondept.Open;
     if Qbondept.RecordCount < 1 then
          DeptNameFind := Qbondept.ParamByName('P_deptcode').AsString
     else
         begin
              if Qbondept.FieldByName('DEPTNA3').AsString <> '' then
                 DeptNameFind := Qbondept.FieldByName('DEPTNA3').AsString
              else if Qbondept.FieldByName('DEPTNA2').AsString <> '' then
                 DeptNameFind := Qbondept.FieldByName('DEPTNA2').AsString
              else if Qbondept.FieldByName('DEPTNA1').AsString <> '' then
                 DeptNameFind := Qbondept.FieldByName('DEPTNA1').AsString
              else
                 DeptNameFind := Qbondept.FieldByName('DEPTNAME').AsString;
         end;
     DeptLevel := Qbondept.FieldByName('DEPTLEVEL').AsString;
     Qbondept.Close;
end;

procedure TMainForm.DeptCodeClick(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Self);
  Try
    DeptForm.ShowModal;
    if deptForm.CodeName = ''  then System.Exit;
    TMaskEdit(Sender).Text := DeptForm.Code1;
  Finally
    DeptForm.Free;
  End;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
     PrinterSetup.Execute;
end;

// 콤멘트가 변했는지 체크한다...................................................
procedure TMainForm.ChangePimvari(Sender: TObject);
begin
   Change_PIMVARI := True;
end;

end.
