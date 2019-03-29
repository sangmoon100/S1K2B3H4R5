{header.
--------------------------------------------------------------------
PROGRAM-NAME    :  PIB3030C(경력증명서발급)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김영대
Version         : 31.00
Date            : 1999.01.04
Update contents
  1.00   1997.06.20    김영대  신규프로그램개발  처리명세서
 31.00     99.01.04   김혜진  직급명대신 고정된 명을 출력  -by 이평로
                              단,98년이전발령은 직급(직위)로 출력.
 31.01   2000.08.29   강기우  전보발령시 실제,조직 구분없이 근무부서 출력.(인사팀- 최준영)전()--(대외문서이므로)
 31.12   2003.12.01   이민용   양식에 맞게 레포트를 5cm 위로 올림 (총무팀 - 유지혜씨 요청)
 31.13   2004.12.20   정규용  양식위치 변경으로 퀵레포트 위치조정
 31.84   2012.02.07   지순미  간단양식 글자폰트 수정:맑은고딕, 경력증명서하단의 Line제거
---------------------------------------------------------------------}

unit pib30301;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, DBGrids,
  Calen1, pass, Datelib, Timeftp, jgrid, numedit, Func, MemDS,
  DBAccess, Ora, OraFempno;

type
  Tpib30301Form = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Sp1: TSpeedButton;
    Sp2: TSpeedButton;
    Panel5: TPanel;
    Notebook1: TNotebook;
    Label3: TLabel;
    E_STempno: TEdit;
    E_STkorname: TEdit;
    E_EDempno: TEdit;
    E_EDkorname: TEdit;
    E_certused: TEdit;
    Nfacode1: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    ME_certkidate: TMaskEdit;
    E_certcnt: TNumberEdit;
    NoData: TLabel;
    DBG_cert: Jdbgrid;
    Panel7: TPanel;
    G_Progress: TGauge;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Print: TBitBtn;
    BB_Screen: TBitBtn;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    Label4: TLabel;
    Panel15: TPanel;
    ME_certdate: TMaskEdit;
    SpeedButton1: TSpeedButton;
    BB_Search: TBitBtn;
    OraQuery1: TOraQuery;
    EmpQuery: TOraQuery;
    Qcode: TOraQuery;
    Qdept: TOraQuery;
    CertQuery: TOraQuery;
    InQuery: TOraQuery;
    CertQueryEMPNO: TStringField;
    CertQueryKORNAME: TStringField;
    CertQueryCERTKIND: TStringField;
    CertQueryCERTDATE: TStringField;
    CertQueryCERTUSED: TStringField;
    CertQueryCERTPRYN: TStringField;
    CertQueryCERTPRDATE: TStringField;
    CertQueryCERTPRNO: TStringField;
    CertQueryCERTKIDATE: TStringField;
    CertQueryROWNUM: TFloatField;
    CertQueryCERTCNT: TIntegerField;
    CertQueryCERTPRCNT: TIntegerField;
    CertQueryADMINYN: TStringField;
    CertQueryBATCHYN: TStringField;
    QGroup: TOraQuery;
    Label5: TLabel;
    Panel16: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    R_a1: TPanel;
    gm1: TImage;
    R_a2: TPanel;
    gm2: TImage;
    Panel17: TPanel;
    R_a3: TPanel;
    Image1: TImage;
    R_a4: TPanel;
    Image2: TImage;
    Panel18: TPanel;
    RB_1: TRadioButton;
    RB_2: TRadioButton;
    title: TPanel;
    Panel44: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;     

    procedure FormCreate(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure CalenClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure empnoChage(Sender: TObject);
    procedure empnoDblClick(Sender: TObject);
    procedure empnoExit(Sender: TObject);
    procedure E_KeyPress(Sender: TObject; var Key: Char);
    procedure WorkSelect(Sender: TObject);
    procedure StuffClick(Sender: TObject);
    procedure DBG_certDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBG_Select(Sender: TObject);
    procedure DataKeyControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BB_SearchClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RB_1Click(Sender: TObject);
  private
    start     : Integer;
    ChangeMod : Boolean;
    mpaycl,mpayra : string;
    { Private declarations }
    procedure ShowPreView;
    procedure Man_CertMEM;
  public
    { Public declarations }
    gu1       : Integer;
    vCompname : string;
    vPresname : string;
    HomeDir   : string;
    Gempno, Gkorname: string;
    test      : string;
    gbCheckGubun : Boolean;
    AReport:  TQuickRep;
    BReport:  TQuickRep;
    function  Get_certprno(sYear: string): string;
    procedure ClearData;
    function  QcodeDisp(s1,s2 : string) : string;
    function  QdeptDisp(s1,s2 : string) : string;
    function  call_payranm(s1,s2 : string):string;
    procedure QueryPihAnno(str : string);
    procedure Carr_rtn(a_ancode,a_anfrdate,a_antodate: string);
    function  DataIns : boolean;    
  end;

type
  TDataIn = record
      aflag      : string[1];       {'C':계속,  'E':끝(총근무기간 포함) }
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k
 ---------------------------------------------------------------------------}
//      acertprno  : string[8];       {발행번호}
      acertprno  : string[14];       {발행번호}
      akorname   : string[30];      {성명}
      ajuminid   : string[14];      {주민등록번호}
      aused      : string[50];      {용도}
      afrtodate  : string[21];      {from~to}
      adeptname  : string[60];      {소속} {총근무기간}
      apaycl     : string[15];      {BAND}
      apayra     : string[15];      {직책}
      apayra2    : string[15];      {직위}
      i_empno    : string[04];      {성명}
      i_certkind : string[01];      {제증명종류}
      i_certdate : string[08];      {신청일자}
      aloadCount : integer;
      atelno     : string[15];      {전화번호}        //2015.04.03.hjku.. 추가
      apayracode : string[03];      {직책}            //2015.04.03.hjku.. 추가
      acertcnt   : string[02];      {출력매수}        //2015.04.03.hjku.. 추가
      acertkidate: string[08];      {출력기준일}      //2015.04.03.hjku.. 추가
      aadminyn   : string[02];      {관리자등록여부}  //2015.04.03.hjku.. 추가
      apagecnt   : string[03];      {출력일련번호}    //2015.04.03.hjku.. 추가

  end;

const
  MAXROW = 100;
  PRTROW = 20;

var
  pib30301Form: Tpib30301Form;
  DataIn: TDataIn;
  CertMEM: array[1..10000] of Char;
  CertMEMsize: Integer;
  loadCount : integer;      {인사경력로드 건수}
  ErrorHelp : array[0..255] of char;
  HomeDir   : string;
  PGroupID  : String;
  payrachdate : String;

 {메모리 구성}
  Norgnum   : string[3];   {현조직차수}
  Ndept     : string[5];   {현부서}
  Npayra    : string[3];   {현직책}
  Npayra2   : string[3];   {현직위}

  pancode   : array[1..MAXROW] of string[3];  {발령구분}
  panfrdate : array[1..MAXROW] of string[8];  {발령일 from}
  pantodate : array[1..MAXROW] of string[8];  {발령일 to}
  ppaycl    : array[1..MAXROW] of string[3];  {BAND}
  ppayra    : array[1..MAXROW] of string[3];  {직책}
  ppayra2   : array[1..MAXROW] of string[3];  {직위}
  porgnum   : array[1..MAXROW] of string[3];  {조직차수}
  pdeptcode : array[1..MAXROW] of string[6];  {부서코드}
  pmark1    : array[1..MAXROW] of string[40]; {비고1}

implementation
{$R *.DFM}
uses
  Pib30302, Pib30303, pib30304, pib30305;

// 코드부분 ....................................................................
function Tpib30301Form.QcodeDisp(s1,s2 : string) : string;
begin
  if trim(s2) = ''  then begin
    QcodeDisp := s2; System.Exit;
  end;
  QCode.Parambyname('P_codeid').AsString := s1;
  QCode.Parambyname('P_codeno').AsString := s2;
  QCode.Open;
  if QCode.Fieldbyname('CODENAME').AsString = '' then begin
    QcodeDisp := '('+s2+')';
  end else begin
    QCodeDisp := QCode.Fieldbyname('CODENAME').AsString;
  end;
  QCode.Close;
end;

function Tpib30301Form.QdeptDisp(s1,s2 : string) : string;
begin
  if trim(s2) = ''  then begin
    QdeptDisp := ''; System.Exit;
  end;
  Qdept.Parambyname('P_orgnum').AsString   := s1;
  Qdept.Parambyname('P_deptcode').AsString := s2;
  Qdept.Open;
  if Qdept.Fieldbyname('DEPTNAME').AsString = '' then begin
    QdeptDisp := '조직차수('+s1+')'+' 부서코드('+s2+')';
  end else begin
    QdeptDisp := Qdept.Fieldbyname('DEPTNAME').AsString;
  end;
  Qdept.Close;
end;

// 출력물 화면을 생성한다.......................................................
procedure Tpib30301Form.ShowPreView;
begin
  Try
    PreViewForm := TPreViewForm.Create(self);
    PreViewForm.ShowModal;
  Finally
    PreViewForm.Free;
  End;
end;

// 폼에 관련된 사항들...........................................................
procedure Tpib30301Form.FormCreate(Sender: TObject);
begin
  P_Help.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption     := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption   := fn_GetDateStr;
  Gempno             := Pempno;
  Gkorname           := Pkorname;

  with QGroup do
  begin
       close;
       Sql.Clear;
       Sql.Add('Select GroupID from pymenuuser     ');
       Sql.Add(' where empno = '''+ Pempno + ''' ');
       Open;
       PGroupID   := QGroup.FieldbyName('GroupID').AsString;
  end;

  with QGroup do
  begin
       close;
       Sql.Clear;
       Sql.Add('Select replace(CORPNAME,''(주)'',''주식회사'') COMPNAME, ');
       Sql.Add('       PRESNAME                                          ');
       Sql.Add('  from pkcpbas                                           ');
       Open;
       vCompname    := QGroup.FieldbyName('COMPNAME').AsString;
       vPresname    := QGroup.FieldbyName('PRESNAME').AsString;
  end;

  with QGroup do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Value3, Value4 from pimvari          ');
       Sql.Add(' where gubun = ''00'' and sgubun = ''0001'' ');
       Open;
       payrachdate  := QGroup.FieldbyName('Value3').AsString;
  end;
  start := 0;
end;

procedure Tpib30301Form.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  HomeDir := HomeDirOpen;
  for i := 1 to SizeOf(CertMEM) do CertMEM[i] := 'N';
  CertMEMsize := 0;

  AReport := PrintForm1.InReport;
  BReport := PrintForm2.InReport;
end;

procedure Tpib30301Form.FormPaint(Sender: TObject);
begin
  if Start = 0 then
  begin
       ME_certdate.Text   := Copy(Fn_GetDateTimeStr,1,8);
       ME_certkidate.Text := Copy(Fn_GetDateTimeStr,1,8);

       WorkSelect(Sp1);

       P_Help.Caption     := '';
       Start := 1;
  end;
end;

procedure Tpib30301Form.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TQuery) then
      TQuery(Self.Components[i]).Close;
  Action := caFree;
end;

procedure Tpib30301Form.BB_CloseClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까 ?..','확  인',MB_YESNO or $0030)
     = ID_YES then begin
    Close;
  end;
end;

// 달력폼을 출력한다............................................................
procedure Tpib30301Form.CalenClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_certkidate.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;

// 사원번호에 해당하는 사원명을 출력한다........................................
procedure Tpib30301Form.empnoChage(Sender: TObject);
begin
  ChangeMod := True;
end;

procedure Tpib30301Form.empnoDblClick(Sender: TObject);
begin
  try
    OraEmpForm := TOraEmpForm.Create(Self);
    case TComponent(Sender).tag of
      1 : OraEmpForm.DataVal1 := E_STempno.Text;
      2 : OraEmpForm.DataVal2 := E_STkorname.Text;
      3 : OraEmpForm.DataVal1 := E_EDempno.Text;
      4 : OraEmpForm.DataVal2 := E_EDkorname.Text;
    end;
    OraEmpForm.ShowModal;
    if OraEmpForm.Code <> '' then begin
      if (TComponent(Sender).tag = 1) or
         (TComponent(Sender).tag = 2) then begin
         E_STempno.Text   := OraEmpForm.Code;
         E_STkorname.Text := OraEmpForm.CodeName;
      end;
      if (TComponent(Sender).tag = 3) or
         (TComponent(Sender).tag = 4) then begin
         E_EDempno.Text   := OraEmpForm.Code;
         E_EDkorname.Text := OraEmpForm.CodeName;
      end;
    end;
  finally
    OraEmpForm.free;
  end;
end;

procedure Tpib30301Form.empnoExit(Sender: TObject);
begin
  if ChangeMod = False then system.Exit;
  ChangeMod := False;
  EmpQuery.Close;
  if (copy(TEdit(Sender).Name,5,5) = 'empno') then
      if trim(TEdit(Sender).Text) = '' then begin
         System.Exit;
      end else begin
          EmpQuery.ParamByName('P_korname').AsString := TEdit(Sender).Text;
      end;
  if (copy(TEdit(Sender).Name,5,7) = 'korname') then begin
      if (TEdit(Sender).Tag = 2) and (E_STempno.Text = '') then
         EmpQuery.ParamByName('P_korname').AsString := TEdit(Sender).Text;
      if (TEdit(Sender).Tag = 4) and (E_EDempno.Text = '') then
         EmpQuery.ParamByName('P_korname').AsString := TEdit(Sender).Text;
      if (TEdit(Sender).Tag = 2) and (E_STempno.Text <> '') then
         EmpQuery.ParamByName('P_korname').AsString := E_STempno.Text;
      if (TEdit(Sender).Tag = 4) and (E_EDempno.Text <> '') then
         EmpQuery.ParamByName('P_korname').AsString := E_EDempno.Text;
  end;
  EmpQuery.Open;
  case TEdit(Sender).Tag of
    1..2 : begin
           E_STempno.Text   := EmpQuery.FieldByName('empno').Text;
           E_STkorname.Text := EmpQuery.FieldByName('korname').Text;
           E_EDempno.Text   := EmpQuery.FieldByName('empno').Text;
           E_EDkorname.Text := EmpQuery.FieldByName('korname').Text;
           end;
    3..4 : begin
           E_EDempno.Text   := EmpQuery.FieldByName('empno').Text;
           E_EDkorname.Text := EmpQuery.FieldByName('korname').Text;
           end;
  end;

  if EmpQuery.RecordCount > 1 then begin
     empnoDblClick(Sender);
  end;
  EmpQuery.Close;
end;

procedure Tpib30301Form.E_KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then Key := Chr(0);
  P_Help.Caption := '';
end;

procedure Tpib30301Form.DataKeyControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not(ssShift  in Shift) then
  begin
       if (Key = vk_Tab) or (Key = vk_Return) then
       begin
           P_Help.Caption := '';
           case TCustomEdit(Sender).Tag of
             1 : E_STkorname.setfocus;
//             2 : E_EDempno.setfocus;
//             3 : E_EDkorname.setfocus;
             4 : E_certused.setfocus;
             5 : E_certcnt.setfocus;
             6 : ME_certkidate.setfocus;
             7 : E_STempno.setfocus;
           end; {case end}
       end; {inner if end}
  end
  else
  begin
       if (Key = vk_Tab) or (Key = vk_Return) then
       begin
           P_Help.Caption := '';
           case TCustomEdit(Sender).Tag of
             1 : ME_certkidate.setfocus;
             2 : E_STempno.setfocus;
             3 : E_STkorname.setfocus;
//             4 : E_EDempno.setfocus;
//             5 : E_EDkorname.setfocus;
             6 : E_certused.setfocus;
             7 : E_certcnt.setfocus;
           end; {case end}
       end; {inner if end}
  end;
end;

// 온라인 출력,일괄출력 선택....................................................
procedure Tpib30301Form.WorkSelect(Sender: TObject);
begin
  //2017.04.06.hjku.. G012(인사담당자2) 권한 추가 요청.. 김진호M
  //2016.01.06.hjku.. G044(제증명담당자) 권한 추가 요청.. 이지연씨..
  //if (PgroupID = 'G001') or (PgroupID = 'G011') then
  if (PgroupID = 'G001') or (PgroupID = 'G011') or
     (PgroupID = 'G044') or (PgroupID = 'G012') then
  begin
    Notebook1.PageIndex := TComponent(Sender).tag;
    if TComponent(Sender).tag = 1 then
    begin {일괄출력}
      StuffClick(R_a1);  {미발행으로 default출력}
      BB_Search.Visible := True;
      Label5.Visible    := True;
    end
    else
    begin
      CertQuery.close;
      BB_Search.Visible := False;
      Label5.Visible    := False;
      E_STempno.setfocus;
    end;
  end
  else
  begin
    Notebook1.PageIndex := 1;
    Sp2.Down := true;
    Sp1.Down := False;
  end;

  if TComponent(Sender).tag = 1 then
  begin {일괄출력}
    StuffClick(R_a1);  {미발행으로 default출력}
    BB_Search.Visible := True;
    Label5.Visible    := True;
  end;
end;

// 자료구분을 선택한다..........................................................
procedure Tpib30301Form.StuffClick(Sender: TObject);
var
  i: Longint;
begin

   R_a1.Color := clSilver;
   R_a2.Color := clSilver;
   R_a3.Color := clSilver;
   R_a4.Color := clSilver;
   case TPanel(Sender).Tag of
     1 : R_a1.Color := clRed; // gm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
     2 : R_a2.Color := clRed; // gm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
     3 : R_a3.Color := clRed; // gm1.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
     4 : R_a4.Color := clRed; // gm2.picture.LoadFromFile(HomeDir+'\pic\Ball_5.bmp');
   end;
   gu1 := TPanel(Sender).Tag;

   if Pib30304Form.ME_certfr.Text = '' then
   begin
        Pib30304Form.ME_certfr.Text := Fn_GetPreday(7);
        Pib30304Form.ME_certto.Text := Copy(Fn_GetDateTimeStr,1,8);
   end;

   CertQuery.FetchAll := True;
   with CertQuery do
   begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CERTPRYN,CERTDATE, EMPNO, KORNAME,                               ');
        Sql.Add('       CERTPRDATE, CERTPRNO, CERTKIND,CERTUSED,                         ');
        Sql.Add('       CERTCNT,CERTPRCNT,CERTKIDATE, rownum,                            ');
        //2015.04.02.hjku.. adminyn,batchyn 추가..
        Sql.Add('       adminyn,batchyn                                                  ');
        Sql.Add('  FROM PIHCERT                                                          ');
        Sql.Add(' WHERE CERTKIND  = ''2''                                                ');

        //2015.04.02.hjku.. 관리자 등록 추가...요청서(SR-1503-1303)
        if pib30304Form.cb_admin.checked then
           Sql.Add('   AND ADMINYN   = ''Y''                                   ');

        //2015.04.02.hjku.. 일괄출력 추가...요청서(SR-1503-1303)
        if pib30304Form.cb_batch.checked then
           Sql.Add('   AND BATCHYN   = ''Y''                                   ');

        if      gu1 = 1 then
        begin
           Sql.Add('AND CERTPRYN  = ''N''                                                ');
           Sql.Add('AND NVL(CERTPRGB,''0'')  <> ''1''                                    ');
        end
        else if gu1 = 2 then
        begin
           Sql.Add('AND CERTPRYN  = ''Y''                                                ');
           Sql.Add('AND NVL(CERTPRGB,''0'')  <> ''1''                                    ');
        end
        else if gu1 = 3 then
        begin
           Sql.Add('AND CERTPRYN  = ''N''                                                ');
           Sql.Add('AND NVL(CERTPRGB,''0'')  =  ''1''                                    ');
        end
        else if gu1 = 4 then
        begin
           Sql.Add('AND CERTPRYN  = ''Y''                                                ');
           Sql.Add('AND NVL(CERTPRGB,''0'')  =  ''1''                                    ');
        end;
        Sql.Add('   AND CERTCONYN = ''Y''                                                ');
        Sql.Add('   AND CERTDATE >= :certfr                                              ');
        Sql.Add('   AND CERTDATE <= :certto                                              ');
        Sql.Add(' ORDER BY certdate, empno, korname                                      ');

        ParamByName('certfr').AsString := Pib30304Form.ME_certfr.Text;
        ParamByName('certto').AsString := Pib30304Form.ME_certto.Text;

        Open;

        if CertQuery.RecordCount = 0 then
        begin
             DBG_cert.Visible := False;
             CertQuery.close;
             system.exit;
        end
        else DBG_cert.Visible := True;


        CertQuery.DisableControls;
        CertMEMsize := CertQuery.RecordCount;
        CertQuery.First;
        while not CertQuery.EOF do
        begin
             i := CertQueryROWNUM.AsInteger;
             if   CertQueryCERTPRYN.AsString = 'Y' then CertMEM[i] := 'N' {발행자료는 초기치 미발행으로}
             else                                       CertMEM[i] := 'Y'; {미발행}
             CertQuery.Next;
        end;
        CertQuery.First;
        CertQuery.EnableControls;
   end;
   DBG_cert.SetFocus;
end;

// 발행번호를 생성하고 읽어온다.................................................
function Tpib30301Form.Get_certprno(sYear: String): String;
var
  prno : string;
begin
    //if sYear = '' then sYear := Copy(L_certdate.Caption,1,4);
    if sYear = '' then sYear := Copy(ME_certdate.Text,1,6);
    OraQuery1.Sql.clear;
    OraQuery1.Close;
    //2015.04.02.hjku..맨처음 발행시 오류로 인해 변경..
    //OraQuery1.sql.add('select Lpad(to_char(Max(substr(certprno,7,4))+1),4,''0'')  value1');
    OraQuery1.sql.add('select Lpad(to_char(nvl(Max(substr(certprno,7,4)),0)+1),4,''0'')  value1');
    OraQuery1.sql.add('  from pihcert                                                   ');
    OraQuery1.sql.add(' where (certkind = ''2'')                                        ');
    //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
    //OraQuery1.sql.add('   and (substr(certprno,1,6) = :Psgubun)                         ');
    OraQuery1.sql.add('   and (substr(certprno,1,6) = :Psgubun)                         ');
    OraQuery1.ParamByName('Psgubun').AsString := sYear;
    OraQuery1.Open;
    if OraQuery1.RecordCount > 0 then
    begin
      prno  := OraQuery1.FieldByName('value1').AsString;
//      if trim(prno) = '' then begin
//         prno := Copy(sYear,3,2)+'00001';
//         Result := Copy(sYear,3,2)+'-'+prno;
//      end else begin
//         Result := Copy(sYear,3,2)+'-'+prno;
      if trim(prno) = '' then
      begin
         prno := '0001';
         //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
         //Result := copy(sYear,1,4)+'-'+copy(sYear,5,2)+'-'+prno;
      end;
      {2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
      else
      begin
         Result := copy(sYear,1,4)+'-'+copy(sYear,5,2)+'-'+prno;
      end;
      }

{      with OraQuery1 do
      begin
        SQL.Clear;
        SQL.Add('update pimvari set ');
        SQL.Add('value1 = :Pvalue1 ');
        SQL.Add('where (gubun = :Pgubun) AND (sgubun = :Psgubun)');
        ParamByName('Pvalue1').AsString  := Format('%.5d', [StrToInt(prno)+1]);
        ParamByName('Pgubun').AsString   := 'Z2';
        ParamByName('Psgubun').AsString  := sYear;
        EXECSQL;
        Close;
      end;
    end else
    begin
//      Result := Copy(sYear,3,2)+'-'+'00001'; //없는 년도는 시작번호 '00001'
      Result := sYear+'-'+'00001'; //없는 년도는 시작번호 '00001'
      with OraQuery1 do begin
        SQL.Clear;
        SQL.Add('insert into pimvari (');
        SQL.Add('gubun,sgubun,value1,mark1,leng1) values (');
        SQL.Add(':Pgubun, :Psgubun, :Pvalue1, :Pmark1, :Pleng1)');
        ParamByName('Pvalue1').AsString := '00002';
        ParamByName('Pgubun').AsString := 'Z2';
        ParamByName('Psgubun').AsString := sYear;
        ParamByName('Pmark1').AsString := '증명서발행번호';
        ParamByName('Pleng1').AsFloat := 5;
        EXECSQL;
      end;
}
    end
    else
    begin
         prno := '0001';
         //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
         //Result := copy(sYear,1,4)+'-'+copy(sYear,5,2)+'-'+prno;
    end;

    //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
    Result := copy(sYear,1,6) + prno;
    OraQuery1.Close;
end;

procedure Tpib30301Form.ClearData;
begin
  with DataIn do begin
    afrtodate  := '';
    adeptname  := '';
    apaycl     := '';
    apayra     := '';
    apayra2    := '';
  end;
end;

procedure Tpib30301Form.Man_CertMEM;
var
  i: Longint;
begin
  CertQuery.DisableControls;
  CertMEMsize := CertQuery.RecordCount;
  CertQuery.First;
  while not CertQuery.EOF do begin
    i := CertQueryROWNUM.AsInteger;
    if CertQueryCERTPRYN.AsString = 'Y' then
         CertMEM[i] := 'N' {발행자료는 초기치 미발행으로}
    else CertMEM[i] := 'Y'; {미발행}
    CertQuery.Next;
  end;
  CertQuery.First;
  CertQuery.EnableControls;
end;

// 화면,출력을 한다.............................................................
procedure Tpib30301Form.BB_ScreenClick(Sender: TObject);
var
  i, j, k, PageCnt: Integer;
  old_loadcount: Integer;
  Fout : file of TDataIn;
  ankikn: string[4];
  tmp,test : string;
  addYN: Boolean;
  function DateFromTo(Date1,Date2 : string) : string;
  begin
     if Date1 <= Date2 then begin
        Result := InsaDateFormat(Date1)+'~'+InsaDateFormat(Date2);
     end else begin
        Result := InsaDateFormat(Date1);
     end;
  end;
begin
  if TbitBtn(Sender).Name = 'BB_Screen' then gbCheckGubun := False
  else                                       gbCheckGubun := True;

  P_Help.Caption := '작업조건에 맞는 자료를 추출하고 있는 중입니다.';
  if Notebook1.PageIndex = 0 then //ON-LINE출력
  begin
       if (trim(E_STempno.Text) = '') or (trim(E_EDempno.text) = '') or
          (trim(E_STempno.Text) > trim(E_EDempno.text)) then
       begin
            P_Help.Caption := '사원번호 입력오류입니다.';
            System.Exit;
       end;

       if E_certcnt.value <= 0 then
       begin
            P_Help.Caption := '매수 입력오류입니다.';
            System.Exit;
       end;

       if RB_1.Checked then
          gu1 := 1
       else
          gu1 := 3;

{      if trim(E_certused.Text) = '' then
       begin
            P_Help.Caption := '용도 입력오류입니다.';
            System.Exit;
       end;}
  end
  else
  begin //'일괄출력' 시
       if CertMEMsize = 0 then
       begin
            P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
            System.Exit;
       end;

       j := 0;
       for i := 1 to CertMEMsize do
            if CertMEM[i] = 'Y' then
            begin
                 j := 1;
                 break;
            end;

       if j = 0 then
       begin
         P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
         System.Exit;
       end;
  end;
  G_Progress.Progress := 0;
  AssignFile(Fout, HomeDir+'\list\pib3030c.tmp');  System.ReWrite(Fout);

  if Notebook1.PageIndex = 0 then //ON-LINE출력
  begin
     if  (gu1 = 1)  or  (gu1 = 2)  then
     begin
       InQuery.Close;
       InQuery.ParamByName('P_STempno').AsString := E_STempno.Text;
       InQuery.ParamByName('P_EDempno').AsString := E_EDempno.Text;
       InQuery.Open;
       if InQuery.RecordCount = 0 then
       begin
            InQuery.Close;
            P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
            System.Close(Fout);   system.exit;
       end;

       k := 0;
       while not InQuery.Eof do
       begin
            Inc(k);
            G_Progress.Progress := (k*100) div InQuery.RecordCount;
            SendMessage(panel7.handle,WM_PAINT,0,0);

//            DataIn.acertprno := Get_certprno(Copy(ME_certkidate.Text,1,6));   {발행번호}
            if Sp1.Down then
               DataIn.akorname  :=  E_STkorname.Text
            else
               DataIn.akorname  := InQuery.FieldBYName('KORNAME').AsString;      {성명}
            DataIn.ajuminid  := InQuery.FieldBYName('JUMINID').AsString;      {주민번호}
            DataIn.aused     := E_certused.Text;                              {용도}
            QueryPihAnno(InQuery.FieldBYName('EMPNO').AsString);
            old_loadcount := loadcount;

            //2015.04.03.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
            //2015.04.03.hjku...여러매수 발행하여도 관리할 수 있는 항목이 없음.. 제증명발급과 통일.. 이지연씨 요청
            if ME_certkidate.Text = '' then ME_certkidate.Text := Copy(Fn_GetDateTimeStr,1,8);
            DataIn.acertprno := Get_certprno(Copy(ME_certkidate.Text,1,6));

            //2015.04.03.hjku.. 추가
            DataIn.i_empno   := InQuery.FieldBYName('EMPNO').AsString;
            DataIn.acertcnt   := E_certcnt.Text;
            DataIn.apayracode := InQuery.FieldByName('payra').AsString;
            DataIn.atelno     := InQuery.FieldByName('OFFITEL').AsString;
            DataIn.i_certkind := '2';   //경력증명서
            DataIn.i_certdate := Copy(ME_certdate.text,1,8);
            DataIn.acertkidate:= Copy(ME_certkidate.text,1,8);
            DataIn.aadminyn   := 'Y';

            for PageCnt := 1 to StrToIntDef(E_certcnt.Text,1) do
            begin
                 {//2015.04.03.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 if  CertQueryCERTPRNO.AsString = '' then
                      DataIn.acertprno  := Get_certprno(Copy(ME_certkidate.Text,1,6))
                                         + Fn_Left_Zero(inttoStr(PageCnt),2)
                 else
//                    DataIn.acertprno  := Copy(CertQueryCERTPRNO.AsString,1,2)+'-'+
//                                         Copy(CertQueryCERTPRNO.AsString,3,5);
                      DataIn.acertprno  := Copy(CertQueryCERTPRNO.AsString,1,4)+'-'+
                                           Copy(CertQueryCERTPRNO.AsString,5,2)+'-'+
                                           Copy(CertQueryCERTPRNO.AsString,7,4)+
                                           Fn_Left_Zero(inttoStr(PageCnt),2);
                 }
                 DataIn.apagecnt :=  Fn_Left_Zero(inttoStr(PageCnt),2);

                 addYN := False;
                 DataIn.aflag := 'C';  {C:계속, E:끝}
                 loadcount := old_loadcount;
                 DataIn.aloadCount := loadcount;
                 for i := 1 to loadcount do
                 begin
                      with DataIn do
                      begin
{31.00  99.01.04   김혜진  99년이후발령은  직급명대신 고정된 명을 출력,임원도  -by 이평로
                        apaycl := QcodeDisp('I112', ppaycl[i]); //직급
                        apayra := QcodeDisp('I113', ppayra[i]); //직위
}                          apayra  := QcodeDisp('I113', ppayra[i]); //직책
                           apayra2 := QcodeDisp('I113', ppayra2[i]);//직위
                           if  (panfrdate[i] > '19990101') or
                               ((panfrdate[i] = '19990101') and (pancode[i] <> '311')) then //승격발령도 1월1일자
                                apaycl := call_payranm(ppaycl[i],ppayra[i])
                           else
                                apaycl := Qcodedisp('I112',ppaycl[i])+'('+Qcodedisp('I113',ppayra[i])+')';

                           if  (Copy(ppaycl[i],1,1) = 'N') or (Copy(ppaycl[i],1,1) = '0') then  //99년이전은 'N0'가 임원.
                                apaycl := call_payranm(ppaycl[i],ppayra[i]);

                           if  (pancode[i] = '288') and  {수습해제}
                               (apayra = '')  and (apayra2 <> '') then
//                                apaycl := '사원';
                                apayra2 := '사원'
                           else
                           if  (pancode[i] = '288') and  {수습해제}
                               (apayra <> '')  and (apayra2 = '') then
                                apayra  := '사원';

                           if  pancode[i] = '511' then  //휴직
                           begin
                                afrtodate := ''; {근무기간}
                                adeptname := '휴직('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+'~'+
                                                      Copy(pantodate[i],1,4)+'.'+
                                                      Copy(pantodate[i],5,2)+'.'+
                                                      Copy(pantodate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '512' then  //휴직
                           begin
                                afrtodate := ''; {근무기간}
                                adeptname := '휴직연장('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+'~'+
                                                      Copy(pantodate[i],1,4)+'.'+
                                                      Copy(pantodate[i],5,2)+'.'+
                                                      Copy(pantodate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '411' then  //파견
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := '파견('+ pmark1[i] + ')';
                           end
                           else
                           if  pancode[i] = '451' then  //교육
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := '교육('+ pmark1[i] + ')';
                           end
                           else
                           if  ((Copy(pancode[i],1,1) = '1') and
                               ((Copy(pancode[i],3,1) = '1') or
                                (Copy(pancode[i],3,1) = '4'))) then
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                afrtodate := '';
                                //2014.09.04.hjku. 임원의 선임(121)일 경우 그대로 출력되도록 추가.. 홍원영M 요청.
                                if(copy(E_STempno.Text,1,1)='M')and (Copy(pancode[i],1,3)='121')
                                then
                                begin
                                    adeptname := '선임('+ Copy(panfrdate[i],1,4)+'.'+
                                                              Copy(panfrdate[i],5,2)+'.'+
                                                              Copy(panfrdate[i],7,2)+')';
                                end
                                //추가 end.
                                else
                                begin
                                    adeptname := '신규채용('+ Copy(panfrdate[i],1,4)+'.'+
                                                              Copy(panfrdate[i],5,2)+'.'+
                                                              Copy(panfrdate[i],7,2)+')';
                                end
                           end
                           else
                           if  pancode[i] = '311' then  {승격}
                           begin
                               afrtodate := '';
                               adeptname := '승격('+ Copy(panfrdate[i],1,4)+'.'+
                                                     Copy(panfrdate[i],5,2)+'.'+
                                                     Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '322' then {직무대리}
                           begin
                                afrtodate := '';
                                adeptname := '직무대리('+ Copy(panfrdate[i],1,4)+'.'+
                                                          Copy(panfrdate[i],5,2)+'.'+
                                                          Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if pancode[i] = '809' then  {전적}
                           begin
                                afrtodate := '';
                                adeptname := '전적('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if pancode[i] = '251' then  {전입}
                           begin
                                afrtodate := '';
                                adeptname := '전입('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if (pancode[i] = '342') then {직급전환}
                           begin
                                afrtodate := '';
                                adeptname := '직급전환('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
{                          end else if (pancode[i] = '342') and (panfrdate[i] >= payrachdate) then
                           begin
                                afrtodate := '';
                                adeptname := 'BAND조정('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
}                          end
                           else
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := QDeptDisp(porgnum[i],pdeptcode[i]);
                           end;

                           {퇴직자처리}
                           if (i = 1) and (InQuery.FieldBYName('PSTATE').AsString >= '80') then
                           begin
                                afrtodate := '';
                                tmp       := '';
                                tmp       := QcodeDisp('I300', pancode[i]);
                                if Copy(E_STempno.Text,1,1) = 'M' then tmp := '퇴임';
                                adeptname := tmp +'('+ Copy(panfrdate[i],1,4)+'.'+
                                                       Copy(panfrdate[i],5,2)+'.'+
                                                       Copy(panfrdate[i],7,2)+')';
                           end;
                      end; {with}
                      System.Write(Fout, DataIn);
                 end; {for}

                 // if addYN then Inc(loadcount); {전문인력지원단 출력시}

                 {총행의갯수 = PRTROW + 1 + 1}
                 if   loadcount < PRTROW then
                 begin
                      ClearData;
                      DataIn.aflag := 'C';
//                      if (loadcount-1) >= PRTROW then
//                        DataIn.adeptname := '  ====== 이 하 생 략 ======'
//                      else
//                        DataIn.adeptname := '  ====== 이 하 여 백 ======';
                      System.Write(Fout, DataIn);

                      ClearData;
                      DataIn.aflag := 'C'; {빈공란}
                      for  i := loadcount+1 to PRTROW do
                           System.Write(Fout, DataIn);
                 end;

                 ClearData;
                 DataIn.aflag := 'E'; {총근무기간}
                 if InQuery.FieldBYName('PSTATE').AsString < '80' then
                 begin
                      ankikn := Datelib.DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,ME_certkidate.Text);
                      DataIn.adeptname := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(ME_certkidate.Text,1,4)+'.'+
                                          Copy(ME_certkidate.Text,5,2)+'.'+
                                          Copy(ME_certkidate.Text,7,2)+ ' 현재 ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end
                 else
                 begin
                      ankikn := DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,
                                InQuery.FieldByName('RETDATE').AsString);
                      DataIn.adeptname := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,7,2)+ ' ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end;
                 System.Write(Fout, DataIn);
            end;
            InQuery.Next
       end; {wile}
       InQuery.Close;
     end
     else
     if  (gu1 = 3)  or  (gu1 = 4)  then
     begin
       InQuery.Close;
       InQuery.ParamByName('P_STempno').AsString := E_STempno.Text;
       InQuery.ParamByName('P_EDempno').AsString := E_EDempno.Text;
       InQuery.Open;
       if InQuery.RecordCount = 0 then
       begin
            InQuery.Close;
            P_Help.Caption := '작업조건에 맞는 자료가 없습니다.';
            System.Close(Fout);   system.exit;
       end;

       k := 0;
       while not InQuery.Eof do
       begin
            Inc(k);
            G_Progress.Progress := (k*100) div InQuery.RecordCount;
            SendMessage(panel7.handle,WM_PAINT,0,0);

            //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
            //2015.04.02.hjku...여러매수 발행하여도 관리할 수 있는 항목이 없음.. 제증명발급과 통일.. 이지연씨 요청            
            if ME_certkidate.Text = '' then ME_certkidate.Text := Copy(Fn_GetDateTimeStr,1,8);
            DataIn.acertprno := Get_certprno(Copy(ME_certkidate.Text,1,6));

            //            DataIn.acertprno := Get_certprno(Copy(ME_certkidate.Text,1,6));   {발행번호}
            for PageCnt := 1 to StrToIntDef(E_certcnt.Text,1) do
            begin
                 if Sp1.Down then
                    DataIn.akorname  :=  E_STkorname.Text
                 else
                 DataIn.akorname  := InQuery.FieldBYName('KORNAME').AsString;      {성명}
                 DataIn.ajuminid  := InQuery.FieldBYName('JUMINID').AsString;      {주민번호}
                 DataIn.aused     := E_certused.Text;                              {용도}
                 DataIn.i_empno   := InQuery.FieldBYName('EMPNO').AsString;

                 //2015.04.03.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 //DataIn.acertprno := Get_certprno(Copy(ME_certkidate.Text,1,6))
                 //                  + Fn_Left_Zero(inttoStr(PageCnt),2);
                 DataIn.apagecnt :=  Fn_Left_Zero(inttoStr(PageCnt),2);

                 DataIn.adeptname := InQuery.FieldBYName('deptname').AsString;
                 DataIn.apayra    := InQuery.FieldBYName('payraname').AsString;

                 DataIn.aflag := 'E'; {총근무기간}

                 //2015.04.03.hjku.. 추가
                 DataIn.acertcnt   := E_certcnt.Text;
                 DataIn.apayracode := InQuery.FieldByName('payra').AsString;
                 DataIn.atelno     := InQuery.FieldByName('OFFITEL').AsString;
                 DataIn.i_certkind := '2';   //경력증명서
                 DataIn.i_certdate := Copy(ME_certdate.text,1,8);
                 DataIn.acertkidate:= Copy(ME_certkidate.text,1,8);
                 DataIn.aadminyn   := 'Y';

                 if InQuery.FieldBYName('PSTATE').AsString < '80' then
                 begin
                      ankikn := Datelib.DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,ME_certkidate.Text);
                      DataIn.aused     := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(ME_certkidate.Text,1,4)+'.'+
                                          Copy(ME_certkidate.Text,5,2)+'.'+
                                          Copy(ME_certkidate.Text,7,2)+ ' 현재 ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end
                 else
                 begin
                      ankikn := DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,
                                InQuery.FieldByName('RETDATE').AsString);
                      DataIn.aused     := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,7,2)+ ' ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end;
                 System.Write(Fout, DataIn);
            end;
            InQuery.Next
       end; {wile}
       InQuery.Close;
     end;

     //2015.04.03.hjku.. 온라인도 저장하도록 추가.. 이지연씨 요청
     if not(DataIns) then  system.exit;
  end //ON-LINE출력
  else
  begin
     if (gu1 = 1) or (gu1 = 2) then
     begin
       if  CertQuery.RecordCount = 0 then
       begin
            P_Help.Caption := '☞ 작업조건에 맞는 자료가 없습니다.';
            System.Close(Fout);
            InQuery.Close;
            SysUtils.DeleteFile(HomeDir+'\list\pib3030c.tmp');
            G_Progress.Progress := 0;
       end;
       CertQuery.First;
       k := 0;
       while  not CertQuery.EOF do
       begin
            Inc(k);
            G_Progress.Progress := (k*100) div CertQuery.RecordCount;
            SendMessage(panel7.handle,WM_PAINT,0,0);

            j := CertQueryROWNUM.AsInteger;
            if CertMEM[j] = 'N' then {미발행이면 인쇄안함}
            begin
                 CertQuery.Next;
                 Continue;
            end;
            ClearData;

            InQuery.Close;
            InQuery.ParamByName('P_STempno').AsString := CertQueryEMPNO.AsString;
            InQuery.ParamByName('P_EDempno').AsString := CertQueryEMPNO.AsString;

            InQuery.Open;
            if  InQuery.RecordCount = 0 then
            begin
                 InQuery.Close;
                 CertQuery.Next;
                 Continue;
            end;


            if  Sp1.Down then
                 DataIn.akorname  :=  E_STkorname.Text
            else
            DataIn.akorname  := InQuery.FieldBYName('KORNAME').AsString; {성명}
            DataIn.ajuminid  := InQuery.FieldBYName('JUMINID').AsString; {주민번호}
            DataIn.aused     := CertQueryCERTUSED.AsString;              {용도}
//            ME_certkidate.text := CertQueryCERTDATE.AsString; {기준일자에 신청일자를 저장}
            QueryPihAnno(InQuery.FieldBYName('EMPNO').AsString);
            old_loadcount := loadcount;

            //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
            //2015.04.02.hjku...여러매수 발행하여도 관리할 수 있는 항목이 없음.. 제증명발급과 통일.. 이지연씨 요청
            if   CertQueryCERTPRNO.AsString = '' then
                 if   CertQueryCERTKIDATE.AsString = '' then
                      DataIn.acertprno  := Get_certprno(Copy(fn_GetDateTimeStr,1,6))
                 else DataIn.acertprno  := Get_certprno(Copy(CertQueryCERTKIDATE.AsString,1,6))
            else
                 DataIn.acertprno  := CertQueryCERTPRNO.AsString;

           //2015.04.03.hjku.. 추가
           DataIn.acertcnt   := CertQueryCERTCNT.AsString;
           DataIn.apayracode := InQuery.FieldByName('payra').AsString;
           DataIn.atelno     := InQuery.FieldByName('OFFITEL').AsString;
           DataIn.i_empno    := CertQueryEMPNO.AsString;           
           DataIn.i_certkind := CertQueryCERTKIND.AsString;
           DataIn.i_certdate := CertQueryCERTDATE.AsString;
           DataIn.aadminyn   := CertQueryADMINYN.AsString;
           if   CertQueryCERTKIDATE.AsString = '' then
                DataIn.acertkidate := Copy(fn_GetDateTimeStr,1,8)
           else DataIn.acertkidate := CertQueryCERTKIDATE.AsString;


            for PageCnt := 1 to CertQueryCERTCNT.AsInteger do
            begin
                 {//2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 if  CertQueryCERTPRNO.AsString = '' then
                      DataIn.acertprno  := Get_certprno(Copy(CertQueryCERTKIDATE.AsString,1,6))
                                         + Fn_Left_Zero(inttoStr(PageCnt),2)
                 else
//                    DataIn.acertprno  := Copy(CertQueryCERTPRNO.AsString,1,2)+'-'+
//                                         Copy(CertQueryCERTPRNO.AsString,3,5);
                      DataIn.acertprno  := Copy(CertQueryCERTPRNO.AsString,1,4)+'-'+
                                           Copy(CertQueryCERTPRNO.AsString,5,2)+'-'+
                                           Copy(CertQueryCERTPRNO.AsString,7,4)+
                                           Fn_Left_Zero(inttoStr(PageCnt),2);
                 }
                 DataIn.apagecnt :=  Fn_Left_Zero(inttoStr(PageCnt),2);

                 loadcount         := old_loadcount;
                 DataIn.aloadCount := loadcount;
                 addYN := False;
                 DataIn.aflag := 'C';  {C:계속, E:끝}
                 for i := 1 to loadcount do
                 begin
                      with DataIn do
                      begin
{31.00  99.01.04   김혜진   직급명대신 고정된 명을 출력  -by 이평로
                            apaycl := QcodeDisp('I112', ppaycl[i]); //직급
                            apayra := QcodeDisp('I113', ppayra[i]); //직위
}
                           apayra  := QcodeDisp('I113', ppayra[i]);  //직책
                           apayra2 := QcodeDisp('I113', ppayra2[i]); //직위
                           if  (panfrdate[i] > '19990101') or
                               ((panfrdate[i] = '19990101') and (pancode[i] <> '311')) then //승격발령도 1월1일자
                                apaycl := call_payranm(ppaycl[i],ppayra[i])
                           else
                                apaycl := Qcodedisp('I112',ppaycl[i])+'('+Qcodedisp('I113',ppayra[i])+')';
                           if  (Copy(ppaycl[i],1,1) = 'N') or (Copy(ppaycl[i],1,1) = '0') then  //99년이전은 'N0'가 임원.
                                apaycl := call_payranm(ppaycl[i],ppayra[i]);

                           if  (pancode[i] = '288') and  {수습해제}
                               (apayra = '')  and (apayra2 <> '') then
//                              apaycl := '사원';
                                apayra2 := '사원'
                           else
                           if  (pancode[i] = '288') and  {수습해제}
                               (apayra <> '')  and (apayra2 = '') then
                                apayra  := '사원';

                           if   pancode[i] = '511' then  {휴직}
                           begin
                                afrtodate := ''; {근무기간}
                                adeptname := '휴직('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+'~'+
                                                      Copy(pantodate[i],1,4)+'.'+
                                                      Copy(pantodate[i],5,2)+'.'+
                                                      Copy(pantodate[i],7,2)+')';
//                                          showmessage(adeptname);
                           end
                           else
                           if  pancode[i] = '512' then  //휴직
                           begin
                                afrtodate := ''; {근무기간}
                                adeptname := '휴직연장('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+'~'+
                                                      Copy(pantodate[i],1,4)+'.'+
                                                      Copy(pantodate[i],5,2)+'.'+
                                                      Copy(pantodate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '411' then   {파견}
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := '파견('+ pmark1[i] + ')';
                           end
                           else
                           if  pancode[i] = '451' then   {교육}
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := '교육('+ pmark1[i] + ')';
                           end
                           else
                           if  ((Copy(pancode[i],1,1) = '1') and
                               ((Copy(pancode[i],3,1) = '1') or
                                (Copy(pancode[i],3,1) = '4'))) then
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                // adeptname := QDeptDisp(porgnum[i],pdeptcode[i]); {전문인력지원단}
                                // System.Write(Fout, DataIn);
                                // addYN := True;
                                afrtodate := '';
                                adeptname := '신규채용('+ Copy(panfrdate[i],1,4)+'.'+
                                                          Copy(panfrdate[i],5,2)+'.'+
                                                          Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '311' then  {승격}
                           begin
                                afrtodate := '';
                                adeptname := '승격('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '322' then  {직무대리}
                           begin
                                afrtodate := '';
                                adeptname := '직무대리('+ Copy(panfrdate[i],1,4)+'.'+
                                                          Copy(panfrdate[i],5,2)+'.'+
                                                          Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '809' then  {전적}
                           begin
                                afrtodate := '';
                                adeptname := '전적('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  pancode[i] = '251' then  {전입}
                           begin
                                afrtodate := '';
                                adeptname := '전입('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if  (pancode[i] = '342') and (panfrdate[i] < payrachdate) then   {직급전환}
                           begin
                                afrtodate := '';
                                adeptname := '직급전환('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           if (pancode[i] = '342') and (panfrdate[i] >= payrachdate) then
                           begin
                                afrtodate := '';
                                adeptname := 'BAND조정('+ Copy(panfrdate[i],1,4)+'.'+
                                                      Copy(panfrdate[i],5,2)+'.'+
                                                      Copy(panfrdate[i],7,2)+')';
                           end
                           else
                           begin
                                afrtodate := DateFromTo(panfrdate[i],pantodate[i]);
                                adeptname := QDeptDisp(porgnum[i],pdeptcode[i]);
                           end;

                            {퇴직자처리}
                           if (i = 1) and (InQuery.FieldBYName('PSTATE').AsString >= '80') then
                           begin
                                afrtodate := '';
                                tmp := QcodeDisp('I300', pancode[i]);
                                adeptname := tmp +'('+Copy(panfrdate[i],1,4)+'.'+
                                             Copy(panfrdate[i],5,2)+'.'+
                                             Copy(panfrdate[i],7,2)+')';
                           end;
                      end; {with}
                      System.Write(Fout, DataIn);
                 end; {for}

                 // if addYN then Inc(loadcount); {전문인력지원단 출력시}

                 {총행의갯수 = PRTROW + 1 + 1}
                 if   loadcount < PRTROW then
                 begin
                      ClearData;
                      DataIn.aflag := 'C';
                      //if  (loadcount) >= PRTROW then
                      //     DataIn.adeptname := '                 ====== 이 하 생 략 ======'
                      //else
                      //     DataIn.adeptname := '                 ====== 이 하 여 백 ======';
                      System.Write(Fout, DataIn);


                      ClearData;
                      DataIn.aflag := 'C'; {빈공란}
                      for i := loadcount+1 to PRTROW do
                          System.Write(Fout, DataIn);
                 end;

                 ClearData;
                 DataIn.aflag := 'E'; {총근무기간}
                 if  InQuery.FieldBYName('PSTATE').AsString < '80' then
                 begin
                      ankikn := datelib.DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,
                                ME_certkidate.Text);

                      DataIn.adeptname := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(ME_certkidate.Text,1,4)+'.'+
                                          Copy(ME_certkidate.Text,5,2)+'.'+
                                          Copy(ME_certkidate.Text,7,2)+ ' 현재 ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end
                 else
                 begin
                      ankikn := DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,
                                InQuery.FieldByName('RETDATE').AsString);
                      DataIn.adeptname := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,7,2)+ ' ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end;
                 System.Write(Fout, DataIn);
            end;

            InQuery.Close;
            with OraQuery1 do
            begin
                 OraQuery1.Close;
                 SQL.Clear;
                 SQL.Add('update pihcert set ');
                 //SQL.Add('certpryn   = :P_certpryn,   ');
                 SQL.Add('certpryn = decode(:P_certpryn,''Y'',''Y'',certpryn), ');
                 if   TBitBtn(Sender).Name <> 'BB_Screen' then
                 SQL.Add('certprdate = :P_certprdate, ');
                 SQL.Add('certprno   = :P_certprno, certprcnt  = :P_certprcnt, ');
                 SQL.Add('certkidate = :P_certkidate, ');
                 SQL.Add('WRITETIME  = :P_writetime, WRITEEMP = :P_writeemp ');
                 SQL.Add('where (empno    = :K_empno) AND    ');
                 SQL.Add('      (certkind = :K_certkind) AND ');
                 SQL.Add('      (certused = :K_certused) AND ');
                 SQL.Add('      (certdate = :K_certdate)');

                 //2015.04.03.hjku.. adminyn 추가
                 SQL.Add('  and (adminyn = :K_adminyn)');
                 ParamByName('K_adminyn').AsString := CertQueryADMINYN.AsString;

                 //ParamByName('P_certpryn').AsString   := 'Y';
                 if   TBitBtn(Sender).Name = 'BB_Screen'  then ParamByName('P_certpryn').AsString   := 'N'
                 else                                          ParamByName('P_certpryn').AsString   := 'Y';

                 if   TBitBtn(Sender).Name <> 'BB_Screen' then ParamByName('P_certprdate').AsString := ME_certdate.Text;
                 {//2015.03.31.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 ParamByName('P_certprno').AsString   := Copy(DataIn.acertprno,1,4)+
                                                         Copy(DataIn.acertprno,6,2)+
                                                         Copy(DataIn.acertprno,9,4);
                 }
                 ParamByName('P_certprno').AsString   := DataIn.acertprno;
                 ParamByName('P_certprcnt').AsInteger := CertQueryCERTPRCNT.AsInteger + 1;
                 ParamByName('P_certkidate').AsString := CertQueryCERTDATE.AsString;
                 ParamByName('P_writetime').AsString  := Fn_GetDateTimeStr;
                 ParamByName('P_writeemp').AsString   := pempno;

                 ParamByName('K_empno').AsString    := CertQueryEMPNO.AsString;
                 ParamByName('K_certkind').AsString := CertQueryCERTKIND.AsString;
                 ParamByName('K_certused').AsString := CertQueryCERTUSED.AsString;
                 ParamByName('K_certdate').AsString := CertQueryCERTDATE.AsString;
                 OraQuery1.EXECSQL;
                 OraQuery1.Close;
            end;
            CertQuery.Next;
       end; {while}
       CertQuery.First;
     end
     else
     if (gu1 = 3) or (gu1 = 4) then
     begin
       if  CertQuery.RecordCount = 0 then
       begin
            P_Help.Caption := '☞ 작업조건에 맞는 자료가 없습니다.';
            System.Close(Fout);
            InQuery.Close;
            SysUtils.DeleteFile(HomeDir+'\list\pib3030c.tmp');
            G_Progress.Progress := 0;
       end;
       CertQuery.First;
       k := 0;
       while  not CertQuery.EOF do
       begin
            Inc(k);
            G_Progress.Progress := (k*100) div CertQuery.RecordCount;
            SendMessage(panel7.handle,WM_PAINT,0,0);

            j := CertQueryROWNUM.AsInteger;
            if CertMEM[j] = 'N' then {미발행이면 인쇄안함}
            begin
                 CertQuery.Next;
                 Continue;
            end;
            ClearData;

            InQuery.Close;
            InQuery.ParamByName('P_STempno').AsString := CertQueryEMPNO.AsString;
            InQuery.ParamByName('P_EDempno').AsString := CertQueryEMPNO.AsString;

            InQuery.Open;
            if  InQuery.RecordCount = 0 then
            begin
                 InQuery.Close;
                 CertQuery.Next;
                 Continue;
            end;


            //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
            //2015.04.02.hjku...여러매수 발행하여도 관리할 수 있는 항목이 없음.. 제증명발급과 통일.. 이지연씨 요청
            if   CertQueryCERTPRNO.AsString = '' then
                 if   CertQueryCERTKIDATE.AsString = '' then
                      DataIn.acertprno  := Get_certprno(Copy(fn_GetDateTimeStr,1,6))
                 else DataIn.acertprno  := Get_certprno(Copy(CertQueryCERTKIDATE.AsString,1,6))
            else
                 DataIn.acertprno  := CertQueryCERTPRNO.AsString;

           //2015.04.03.hjku.. 추가
           DataIn.acertcnt   := CertQueryCERTCNT.AsString;
           DataIn.apayracode := InQuery.FieldByName('payra').AsString;
           DataIn.atelno     := InQuery.FieldByName('OFFITEL').AsString;
           DataIn.i_empno    := CertQueryEMPNO.AsString;           
           DataIn.i_certkind := CertQueryCERTKIND.AsString;
           DataIn.i_certdate := CertQueryCERTDATE.AsString;
           DataIn.aadminyn   := CertQueryADMINYN.AsString;
           if   CertQueryCERTKIDATE.AsString = '' then
                DataIn.acertkidate := Copy(fn_GetDateTimeStr,1,8)
           else DataIn.acertkidate := CertQueryCERTKIDATE.AsString;

            for PageCnt := 1 to CertQueryCERTCNT.AsInteger do
            begin
                 if  Sp1.Down then
                      DataIn.akorname  :=  E_STkorname.Text
                 else
                 DataIn.akorname  := InQuery.FieldBYName('KORNAME').AsString; {성명}
                 DataIn.ajuminid  := InQuery.FieldBYName('JUMINID').AsString; {주민번호}
                 DataIn.i_empno   := CertQueryEMPNO.AsString;                 {사번}
                 //2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 //DataIn.acertprno := Get_certprno(Copy(CertQueryCERTKIDATE.AsString,1,6))
                 //                  + Fn_Left_Zero(inttoStr(PageCnt),2);
                 DataIn.apagecnt :=  Fn_Left_Zero(inttoStr(PageCnt),2);

                 DataIn.adeptname := InQuery.FieldBYName('deptname').AsString;
                 DataIn.apayra    := InQuery.FieldBYName('payraname').AsString;

                 DataIn.aflag := 'E'; {총근무기간}
                 if InQuery.FieldBYName('PSTATE').AsString < '80' then
                 begin
                      ankikn := Datelib.DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,ME_certkidate.Text);
                      DataIn.aused     := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(ME_certkidate.Text,1,4)+'.'+
                                          Copy(ME_certkidate.Text,5,2)+'.'+
                                          Copy(ME_certkidate.Text,7,2)+ ' 현재 ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end
                 else
                 begin
                      ankikn := DateCal(InQuery.FieldByName('ORGEMPDATE').AsString,
                                InQuery.FieldByName('RETDATE').AsString);
                      DataIn.aused     := Copy(InQuery.FieldByName('ORGEMPDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('ORGEMPDATE').AsString,7,2)+' ~ '+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,1,4)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,5,2)+'.'+
                                          Copy(InQuery.FieldByName('RETDATE').AsString,7,2)+ ' ('+
                                          Copy(ankikn,1,2)+' 년 '+Copy(ankikn,3,2)+' 월)';
                 end;
                 System.Write(Fout, DataIn);
            end;

            InQuery.Close;
            with OraQuery1 do
            begin
                 OraQuery1.Close;
                 SQL.Clear;
                 SQL.Add('update pihcert set ');
                 //SQL.Add('certpryn   = :P_certpryn,   ');
                 SQL.Add('certpryn = decode(:P_certpryn,''Y'',''Y'',certpryn), ');
                 if   TBitBtn(Sender).Name <> 'BB_Screen' then
                 SQL.Add('certprdate = :P_certprdate, ');
                 SQL.Add('certprno   = :P_certprno, certprcnt  = :P_certprcnt, ');
                 SQL.Add('certkidate = :P_certkidate, ');
                 SQL.Add('WRITETIME  = :P_writetime, WRITEEMP = :P_writeemp ');
                 SQL.Add('where (empno    = :K_empno) AND    ');
                 SQL.Add('      (certkind = :K_certkind) AND ');
                 SQL.Add('      (certused = :K_certused) AND ');
                 SQL.Add('      (certdate = :K_certdate)');

                 //2015.04.03.hjku.. adminyn 추가
                 SQL.Add('  and (adminyn = :K_adminyn)');
                 ParamByName('K_adminyn').AsString := CertQueryADMINYN.AsString;

                 //ParamByName('P_certpryn').AsString   := 'Y';
                 if   TBitBtn(Sender).Name = 'BB_Screen'  then ParamByName('P_certpryn').AsString   := 'N'
                 else                                          ParamByName('P_certpryn').AsString   := 'Y';

                 if   TBitBtn(Sender).Name <> 'BB_Screen' then ParamByName('P_certprdate').AsString := ME_certdate.Text;
                 {//2015.04.02.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
                 ParamByName('P_certprno').AsString   := Copy(DataIn.acertprno,1,4)+
                                                         Copy(DataIn.acertprno,6,2)+
                                                         Copy(DataIn.acertprno,9,4);
                 }
                 ParamByName('P_certprno').AsString   := DataIn.acertprno;
                 ParamByName('P_certprcnt').AsInteger := CertQueryCERTPRCNT.AsInteger + 1;
                 ParamByName('P_certkidate').AsString := DataIn.acertkidate;
                 ParamByName('P_writetime').AsString  := Fn_GetDateTimeStr;
                 ParamByName('P_writeemp').AsString   := pempno;

                 ParamByName('K_empno').AsString    := CertQueryEMPNO.AsString;
                 ParamByName('K_certkind').AsString := CertQueryCERTKIND.AsString;
                 ParamByName('K_certused').AsString := CertQueryCERTUSED.AsString;
                 ParamByName('K_certdate').AsString := CertQueryCERTDATE.AsString;
                 OraQuery1.EXECSQL;
                 OraQuery1.Close;
            end;
            CertQuery.Next;
       end; {while}
       CertQuery.First;
     end;
  end; {if}

  P_Help.Caption := '추출된 자료를 출력합니다..';
  System.Close(Fout);

  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
     if (gu1 = 1) or (gu1 = 2) then
        AReport.Print; {바로인쇄}
     if (gu1 = 3) or (gu1 = 4) then
        BReport.Print; {바로인쇄}
  end
  else
  begin
     if (gu1 = 1) or (gu1 = 2) then
        AReport.PreView;
     if (gu1 = 3) or (gu1 = 4) then
        BReport.PreView;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';

  if Notebook1.PageIndex = 1 then
  begin
       if gu1 = 1 then Stuffclick(R_a1);
       if gu1 = 2 then Stuffclick(R_a2);
       if gu1 = 3 then Stuffclick(R_a3);
       if gu1 = 4 then Stuffclick(R_a4);
  end;

  InQuery.Close;
  SysUtils.DeleteFile(HomeDir+'\list\pib3030c.tmp');
  G_Progress.Progress := 0;
end;

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
procedure Tpib30301Form.QueryPihAnno(str : string);
var                                 //사번.
  i, j, nCheck, nCond : integer;
  de_flag, pa_flag, hu_flag, neworg_flag : integer;
  keyreorg  : string[3];
  keydept   : string[5];
  keypayra  : string[3];
  keypayra2 : string[3];
  annoto_pa : string[8];
  annoto_hu : string[8];
  annofr    : string[8];
  annoto    : string[8];
begin

  for i := 1 to MAXROW do begin  {메모리의 초기화}
    pancode[i]    := '';    panfrdate[i]  := '';    pantodate[i]  := '';
    ppaycl[i]     := '';    ppayra[i]     := '';    ppayra2[i]    := '';
    porgnum[i]    := '';    pdeptcode[i]  := '';    pmark1[i]     := '';
  end;

  with OraQuery1 do
  begin
    {인사발령 테이블에서 사원번호,발령경신여부가 'y'자료만 읽어온다}
    {하나로는 기존의 데이콤,dst는 포함하지 않으므로 하나로 입사일보다 크고,전적이
     아닌 발령만 읽어온다.  31.00   직급전환바령은 추가하지 않는다.}
    close;
    sql.clear;
    sql.add('select EMPNO, KORNAME, COMGUBUN, ANNONO, ANSEQNO,                              ');
    sql.add('       ANFRDATE, ANTODATE, ANCODE, ANDETCODE,                                  ');
    sql.add('       ORGNUM, DEPTCODE, JOBGUN, PAYCL, PAYGR,                                 ');
    sql.add('	   case when (anfrdate >= :payrachdate ) then payra else '''' end payra,    ');
    sql.add('	   case when (anfrdate <  :payrachdate ) then payra else '''' end payra2,   ');
    sql.add('	   JOBLINE, MARK1, MARK2, MARK3,                                            ');
    sql.add('	   ADDEPTCODE, ADPAYRA, RPAYGR, LPAYGR, SPAYGR,                             ');
    sql.add('	   HOFRDATE,HOTODATE, RETSAYU1, RETSAYU2,                                   ');
    sql.add('	   TCONTR, TCONTRAMT,TJOBDUTY, TTYPE, TCOMPANY,                             ');
    sql.add('	   BANNONO, BANFRDATE, BANTODATE, BANCODE, BANDETCODE,                      ');
    sql.add('	   BORGNUM, BDEPTCODE, BPAYCL, BPAYGR, BPAYRA, ANUPDYN,                     ');
    sql.add('	   ANUPDTIME, WRITETIME, WRITEEMP                                           ');
    sql.add('  from pihanno                                                                 ');
    sql.add(' where (empno = :lempno and anupdyn = ''Y'')                                   ');
    sql.add('   and (anfrdate >= :lorgempdate)                                              ');
    sql.add('   and (ancode not in (''336'',''337'',''809'',''346'',''656'',                ');
    if  str <> '1407' then
    sql.add('                       ''411'',''412'',                                        ');
    sql.add('                       ''452'',''454'',''935'',''355'')         )              '); //dsa2000 1031요청으로 파견411 412 제외시킴.
    Sql.add(' order by anfrdate desc,annono desc,ancode desc                                ');
    ParamByName('payrachdate').AsString :=  payrachdate;
    ParamByName('lempno').AsString := str;
    ParamByName('lorgempdate').AsString := InQuery.fieldbyname('orgempdate').Asstring;
    Open;

    annoto := ME_certkidate.text; {기준일자}//발행일자
    de_flag := 0;
    pa_flag := 0;
    hu_flag := 0;
    neworg_flag := 0;
    loadcount := 0;
    //OraQuery1.first;
    while not OraQuery1.Eof do
    begin
      Npayra   := OraQuery1.FieldByName('payra').AsString;
      Npayra2  := OraQuery1.FieldByName('payra2').AsString;
      Norgnum  := OraQuery1.FieldByName('orgnum').AsString;
      Ndept    := OraQuery1.FieldByName('deptcode').AsString;
      nCheck := 0;
//      for j := 1 to 6 do
//        if FieldByName('ancode').AsString = tAncode[j] then inc(nCheck);
      if (FieldByName('ancode').AsString = '351') or
         ((FieldByName('ancode').AsString = '341') and (FieldByName('paycl').AsString = FieldByName('bpaycl').AsString)) then
         inc(nCheck);

      if nCheck > 0 then
      begin
        OraQuery1.Next;
        Continue;
      end;

      nCond := 0;
      if FieldByName('ancode').AsString = '414' then  nCond := 1;         //파견복귀
      if FieldByName('ancode').AsString = '412' then  nCond := 2;         //파견연장
      if FieldByName('ancode').AsString = '411' then  nCond := 3;         //파견
      if FieldByName('ancode').AsString = '451' then  nCond := 4;         //교육
      if FieldByName('ancode').AsString = '514' then  nCond := 5;         //복직
      if FieldByName('ancode').AsString = '512' then  nCond := 6;         //휴직연장
      if FieldByName('ancode').AsString = '511' then  nCond := 7;         //휴직
      if copy(FieldByName('ancode').AsString,1,1) = '2' then nCond := 8;
      if copy(FieldByName('ancode').AsString,1,1) = '6' then nCond := 9;  //징계관련
      if OraQuery1.FieldByName('ancode').AsString = '248' then  nCond := 11;         //직무대행해제
      if OraQuery1.FieldByName('ancode').AsString = '243' then  nCond := 12;         //직무대행
      if (FieldByName('ancode').AsString = '311') or                      //승격
         (FieldByName('ancode').AsString = '322') or                      //직무대리
         (FieldByName('ancode').AsString = '342') or                      //BAND조정
         (FieldByName('ancode').AsString = '251') or                      //전입
         ((copy(FieldByName('ancode').AsString,1,1) = '1') and            //신규채용
          ((copy(FieldByName('ancode').AsString,3,1) = '1') or
           (copy(FieldByName('ancode').AsString,3,1) = '4')))
      then nCond := 10;

      case nCond of
       11: begin            //248
            annoto_pa := FieldByName('anfrdate').AsString;
            inc(de_flag);
           end;
       12: begin            //243
            if de_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
               Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto_pa);
            de_flag := 0;
           end;
       1 : begin            //414
           annoto_pa := FieldByName('anfrdate').AsString;
           inc(pa_flag);
           end;
       2 : begin            //412
           if pa_flag = 0 then
              annoto_pa := FieldByName('antodate').AsString;
           inc(pa_flag);
           end;
       3: begin            //411
          if pa_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
             Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto_pa);
          pa_flag := 0;
          end;
       4: begin {451}
          Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,
                   FieldByName('antodate').AsString);
          end;
       5: begin {514}
          Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
          annoto := DateCal1(FieldByName('anfrdate').AsString);
          inc(hu_flag);
          end;
       6: begin {512}
(*  2011.11.07 HeeYong : 휴직과 동일하게 처리(문구 : 휴직연장(2011.01.01~2011.08.81)
            if FieldByName('antodate').AsString >= ME_certkidate.Text then
               annoto := ME_certkidate.Text
            else begin
               if hu_flag = 0 then annoto := FieldByName('antodate').AsString;
            end;
            inc(hu_flag);
*)             if InQuery.FieldBYName('PSTATE').AsString >= '80' then
            begin
              annoto := FieldByName('antodate').AsString;
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
              annoto := DateCal1(FieldByName('anfrdate').AsString);
            end else
            begin
                  if hu_flag = 0 then
                  begin
                      if FieldByName('antodate').AsString >= ME_certkidate.Text then
                         annoto := ME_certkidate.Text
                      else
                         annoto := FieldByName('antodate').AsString;
                      Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto)
                  end else
                  begin
                    Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
                    hu_flag := 0;
                  end;
                  annoto := DateCal1(FieldByName('anfrdate').AsString);
            end;
          end;
       7: begin {511}                 //2007.06.14 서혜미
             if InQuery.FieldBYName('PSTATE').AsString >= '80' then
            begin
              annoto := FieldByName('antodate').AsString;
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
              annoto := DateCal1(FieldByName('anfrdate').AsString);
            end else
            begin
                  if hu_flag = 0 then
                  begin
                      if FieldByName('antodate').AsString >= ME_certkidate.Text then
                         annoto := ME_certkidate.Text
                      else
                         annoto := FieldByName('antodate').AsString;
                      Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto)
                  end else
                  begin
                    Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
                    hu_flag := 0;
                  end;
                  annoto := DateCal1(FieldByName('anfrdate').AsString);
            end;
          end;
       8: begin
            if (FieldByName('ancode').AsString = '288') // or
// 31.01          ((FieldByName('ancode').AsString = '211') and
//                (FieldByName('andetcode').AsString = '12'))
            then begin
               if neworg_flag = 0 then begin
                  Keyreorg  := Norgnum;
                  keydept   := Ndept;
                  keypayra  := Npayra;
                  keypayra2 := Npayra2;
// K.J. 추가했다가 없앰...수습해제 데이터가 보이지 않아서.. 해줬다가.. 다시 막음
// 요거 풀면 수습해제 데이터 보임
                  Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
                  annoto := DateCal1(FieldByName('anfrdate').AsString);

                  inc(neworg_flag);
               end;
            end else
              if (FieldByName('ancode').AsString = '211') or
//                  (FieldByName('andetcode').AsString = '11')) or
//jissi                  (FieldByName('ancode').AsString = '228') or
                  (FieldByName('ancode').AsString = '222') or
                  (FieldByName('ancode').AsString = '251') then begin
{//----------------
              if neworg_flag <> 0 then begin
                Norgnum  := keyreorg;
                Ndept    := keydept;
                Npayra   := keypayra;
              end;
//----------------}
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
//              showmessage(FieldByName('ancode').AsString+'-'+FieldByName('anfrdate').AsString+'-'+annoto);
              keyreorg := ''; keydept := ''; keypayra := '';
              neworg_flag := 0;
              annoto := DateCal1(FieldByName('anfrdate').AsString);
//         test := FieldByName('ancode').AsString+' - '+FieldByName('anfrdate').AsString+' - '+annoto;
//         showmessage(test);

            end;
          end;
       9: begin
            if copy(FieldByName('ancode').AsString,3,1) = '9' then
            begin
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
            end
            else if FieldByName('paycl').AsString = FieldByName('bpaycl').AsString then
            begin
              //2013.01.30 : 징계(600)일때 출력이 안되는 사항을 발령명("징계")을 제외하고, 기간만 출력함.(1,2번) HeeYong
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);        // 1
              annoto := DateCal1(FieldByName('anfrdate').AsString);                                    // 2

              OraQuery1.Next;
              Continue;
            end else
            begin
              Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
            end;
            annoto := DateCal1(FieldByName('anfrdate').AsString);
          end;
       10: begin
             if neworg_flag <> 0 then begin
               Norgnum  := keyreorg;
               Ndept    := keydept;
               Npayra   := keypayra;
               Npayra2  := keypayra2;
               keyreorg := '';
               keydept  := '';
               keypayra := '';
               neworg_flag := 0;
             end;
////##################
             Carr_Rtn('211',FieldByName('anfrdate').AsString,annoto);
             Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
             annoto := DateCal1(FieldByName('anfrdate').AsString);
           end;
////###############
       else begin
             Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto);
             annoto := DateCal1(FieldByName('anfrdate').AsString);
           end;
      end; {case}
      OraQuery1.Next;
      if loadcount > MAXROW then
        Break;
    end; {while}
  end; {with Qann do begin}
  OraQuery1.Close;
end;

//#######################
procedure Tpib30301Form.Carr_rtn(a_ancode,a_anfrdate,a_antodate: string);
begin
  inc(loadcount);
  pancode[loadcount]   := a_ancode;
  panfrdate[loadcount] := a_anfrdate;
  pantodate[loadcount] := a_antodate;
  ppaycl[loadcount]    := OraQuery1.FieldByName('paycl').AsString;
  ppayra[loadcount]    := Npayra;   {직책코드}
  ppayra2[loadcount]   := Npayra2;  {직위코드}
  porgnum[loadcount]   := Norgnum;  {조직차수}
  pdeptcode[loadcount] := Ndept;    {부서코드}
  pmark1[loadcount]    := OraQuery1.FieldByName('mark1').AsString;

  //2013.01.30 : 징계(600)일때 출력이 안되는 사항을 발령명("징계")을 제외하고, 기간은 출력함.
  if a_ancode = '600' then pancode[loadcount]   := '';

//     if (E_STempno.text = '1757') and (a_ancode = '211') and (pancode[loadcount-1] ='311') then   // 1757 홍기범 한장으로 처리하기위해 임시로 사용(jissi
//       loadcount := loadcount - 1;

end;

// 그리드 화면을 꾸민다.........................................................
procedure Tpib30301Form.DBG_certDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if (gdselected in State) then begin
  with (Sender as Jdbgrid).Canvas do begin
    Pen.Color   := clBlack;
    Brush.Color := $00B0B062;
    Fillrect(Rect);
    Rectangle(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
    Pen.Width   := 1;
    if Field.Index = 0 then begin
      if certMEM[CertQueryRownum.Asinteger] = 'Y' then begin
         Font.Color  := clRed;
         TextOut((Rect.Left+30), Rect.Top+5     ,'[사원번호] '+ CertQueryEmpno.AsString);
      end else begin
         Font.Color  := clwhite;
         TextOut((Rect.Left+30), Rect.Top+5     ,'[사원번호] '+ CertQueryEmpno.AsString);
      end;
      Font.Color  := clwhite;
      if Sp1.Down then
         TextOut((Rect.Left+190),Rect.Top+5     ,'[성    명] '+ E_STkorname.Text)
      else
         TextOut((Rect.Left+190),Rect.Top+5     ,'[성    명] '+ CertQueryKorname.AsString);
      TextOut((Rect.Left+330),Rect.Top+5     ,'[매    수] '+ FormatFloat('#0',CertQueryCertcnt.AsFloat)+'매');
      TextOut((Rect.Left+30),Rect.Top+20     ,'[용    도] '+ CertQueryCertused.AsString);
      TextOut((Rect.Left+30),Rect.Top+34     ,'[신청일자] '+
                                              copy(CertQueryCertdate.AsString,1,4)+'.'+
                                              copy(CertQueryCertdate.AsString,5,2)+'.'+
                                              copy(CertQueryCertdate.AsString,7,2));
      TextOut((Rect.Left+190),Rect.Top+34     ,'[발행일자] '+
                                              copy(CertQueryCertprdate.AsString,1,4)+'.'+
                                              copy(CertQueryCertprdate.AsString,5,2)+'.'+
                                              copy(CertQueryCertprdate.AsString,7,2));
      TextOut((Rect.Left+330),Rect.Top+34     ,'[기준일자] '+
                                              copy(CertQueryCertkidate.AsString,1,4)+'.'+
                                              copy(CertQueryCertkidate.AsString,5,2)+'.'+
                                              copy(CertQueryCertkidate.AsString,7,2));
{//2015.03.31.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
      TextOut((Rect.Left+30),Rect.Top+48     ,'[발행번호] '+
//                                              copy(CertQueryCertprno.AsString,1,2)+'-'+
//                                              copy(CertQueryCertprno.AsString,3,5));
                                              copy(CertQueryCertprno.AsString,1,4)+'-'+
                                              copy(CertQueryCertprno.AsString,5,2)+'-'+
                                              copy(CertQueryCertprno.AsString,7,6));
}
      TextOut((Rect.Left+30),Rect.Top+48     ,'[발행번호] '+
                                              copy(CertQueryCertprno.AsString,1,6)+'-'+
                                              copy(CertQueryCertprno.AsString,7,6));
      TextOut((Rect.Left+190),Rect.Top+48    ,'[발행횟수] '+
                                              FormatFloat('#0',CertQueryCertprcnt.AsFloat)+'회');
    end;
  end;
end else begin
  with (Sender as Jdbgrid).Canvas do begin
    Brush.Color := $00E0E0E0;
    Pen.Color   := clBlack;
    Fillrect(Rect);
    RoundRect(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1,10,10);
    if Field.Index = 0 then begin
      Font.Color  := clNavy;
      if certMEM[CertQueryRownum.Asinteger] = 'Y' then begin
         Font.Color  := clRed;
         TextOut((Rect.Left+30), Rect.Top+5     ,'[사원번호] '+ CertQueryEmpno.AsString);
      end else begin
         Font.Color  := clNavy;
         TextOut((Rect.Left+30), Rect.Top+5     ,'[사원번호] '+ CertQueryEmpno.AsString);
      end;
      Font.Color  := clNavy;
      if Sp1.Down then
         TextOut((Rect.Left+190),Rect.Top+5     ,'[성    명] '+ E_STkorname.Text)
      else
         TextOut((Rect.Left+190),Rect.Top+5     ,'[성    명] '+ CertQueryKorname.AsString);
      TextOut((Rect.Left+330),Rect.Top+5     ,'[매    수] '+ FormatFloat('#0',CertQueryCertcnt.AsFloat)+'매');
      TextOut((Rect.Left+30),Rect.Top+20     ,'[용    도] '+ CertQueryCertused.AsString);
      TextOut((Rect.Left+30),Rect.Top+34     ,'[신청일자] '+
                                              copy(CertQueryCertdate.AsString,1,4)+'.'+
                                              copy(CertQueryCertdate.AsString,5,2)+'.'+
                                              copy(CertQueryCertdate.AsString,7,2));
      TextOut((Rect.Left+190),Rect.Top+34     ,'[발행일자] '+
                                              copy(CertQueryCertprdate.AsString,1,4)+'.'+
                                              copy(CertQueryCertprdate.AsString,5,2)+'.'+
                                              copy(CertQueryCertprdate.AsString,7,2));
      TextOut((Rect.Left+330),Rect.Top+34     ,'[기준일자] '+
                                              copy(CertQueryCertkidate.AsString,1,4)+'.'+
                                              copy(CertQueryCertkidate.AsString,5,2)+'.'+
                                              copy(CertQueryCertkidate.AsString,7,2));
{//2015.03.31.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
      TextOut((Rect.Left+30),Rect.Top+48     ,'[발행번호] '+
//                                              copy(CertQueryCertprno.AsString,1,2)+'-'+
//                                              copy(CertQueryCertprno.AsString,3,5));
                                              copy(CertQueryCertprno.AsString,1,4)+'-'+
                                              copy(CertQueryCertprno.AsString,5,2)+'-'+
                                              copy(CertQueryCertprno.AsString,7,6));
}
      TextOut((Rect.Left+30),Rect.Top+48     ,'[발행번호] '+
                                              copy(CertQueryCertprno.AsString,1,6)+'-'+
                                              copy(CertQueryCertprno.AsString,7,6));
      TextOut((Rect.Left+190),Rect.Top+48    ,'[발행횟수] '+
                                              FormatFloat('#0',CertQueryCertprcnt.AsFloat)+'회');
    end;
  end;
end;
end;

// 프린터여부를 판단한다........................................................
procedure Tpib30301Form.DBG_Select(Sender: TObject);
begin
 //PV추진팀(2010.06추가)이나 인력팀이나 종합관리자외에 이미발행한 데이터 다시 발행 못해요~
   if (Gu1 = 2) and (certMEM[CertQueryRownum.Asinteger]='N') and
      not ((PGroupID = 'G042') or (PGroupID = 'G011') or (PGroupID = 'G001'))       then
   begin
      exit;
   end;

   if certMEM[CertQueryRownum.Asinteger]  = 'N' then
      certMEM[CertQueryRownum.Asinteger] := 'Y'
   else certMEM[CertQueryRownum.Asinteger] := 'N';
   CertQuery.DisableControls;
   CertQuery.Next;
   if not CertQuery.Eof then CertQuery.Prior;
   CertQuery.EnableControls;
end;

{31.00   99.01.01   김혜진  경력증명서의 직위(직급) => 실제직위,직급명 아래 직급명으로 고정. by-이평로
                            단,발령일이 99년이전이면 예전직급명으로 출력.
============================================================================================================
}
function Tpib30301Form.call_payranm(s1,s2 : string):string;
begin
   result := '';

   result := QCodeDisp('I113',s2) ;
 end;

procedure Tpib30301Form.BB_SearchClick(Sender: TObject);
begin
   Pib30304Form.ShowModal;
end;

procedure Tpib30301Form.SpeedButton1Click(Sender: TObject);
begin
     P_Help.Caption := '';
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;

        ME_certdate.Text := calendar.DayCaption;

        InQuery.Close;

        InQuery.ParamByName('P_STempno').AsString  := E_STempno.Text;
        InQuery.ParamByName('P_EDempno').AsString  := E_EDempno.Text;
        InQuery.ParamByName('P_Certdate').AsString := ME_certdate.Text;
        InQuery.ParamByName('P_Certkind').AsString := '2';

        InQuery.Open;

        if InQuery.RecordCount = 0 then begin
          InQuery.Close;
          E_certcnt.Text :=  '0';
          P_Help.Caption := '경력증명서 발급신청 내역이 없습니다.';
          showmessage('경력증명서 발급신청 내역이 없습니다.');
          system.exit;
        end;

        E_certcnt.Text :=  InQuery.FieldByName('certcnt').AsString;
        InQuery.Close;;

     Finally
        calendar.Free;
     end;
end;

procedure Tpib30301Form.RB_1Click(Sender: TObject);
begin
   gu1 := TRadioButton(Sender).Tag;
end;

//2015.04.03.hjku... 추가
function Tpib30301Form.DataIns : boolean;
begin
    DataIns := false;
    with OraQuery1 do
    begin
          Close;
          SQL.Clear;
          SQL.Add('select   certdate, certkind, certused, certcnt, certterm, certprdate  ');
          SQL.Add('  from   pihcert                                                      ');
          SQL.Add(' where   empno    = :eempno                                           ');
          SQL.Add('   and   certkind = :certkind                                         ');
          SQL.Add('   and   certdate = :certdate                                         ');
          SQL.Add('   and   adminyn  = ''Y''                                             ');          

          ParamByName('eempno').AsString   := DataIn.i_empno;
          ParamByName('certkind').AsString := DataIn.i_certkind;
          ParamByName('certdate').AsString := DataIn.i_certdate;

          open;

          if   RecordCount > 0 then
          begin
               MessageBox(handle,'기존 자료가 이미 있습니다..','작업안내',MB_ICONWARNING);
               System.Exit;
          end else
          begin
               Close;
               SQL.Clear;
               SQL.Add(' insert into pihcert                        ');
               SQL.Add('                       (empno,              ');
               SQL.Add('                        korname,            ');
               SQL.Add('                        certkind,           ');
               SQL.Add('                        certdate,           ');
               SQL.Add('                        certused,           ');
               SQL.Add('                        certpryn,           ');
               SQL.Add('                        certprdate,         ');
               SQL.Add('                        certprno,           ');
               SQL.Add('                        certprcnt,          ');
               SQL.Add('                        certkidate,         ');
               SQL.Add('                        certcnt,            ');
               SQL.Add('                        certterm,           ');
               SQL.Add('                        payra,              ');
               SQL.Add('                        telno,              ');
               SQL.Add('                        adminyn,            ');
               SQL.Add('                        certconyn,          ');
               SQL.Add('                        certprgb,           ');
               SQL.Add('                        writetime,          ');
               SQL.Add('                        writeemp)           ');
               SQL.Add('    values              (:empno,            ');
               SQL.Add('                         :korname,          ');
               SQL.Add('                         :certkind,         ');
               SQL.Add('                         :certdate,         ');
               SQL.Add('                         :certused,         ');
               SQL.Add('                         :certpryn,         ');
               SQL.Add('                         :certprdate,       ');
               SQL.Add('                         :certprno,         ');
               SQL.Add('                         :certprcnt,        ');
               SQL.Add('                         :certkidate,       ');
               SQL.Add('                         :certcnt,          ');
               SQL.Add('                         :certterm,         ');
               SQL.Add('                         :payra,            ');
               SQL.Add('                         :telno,            ');
               SQL.Add('                         ''Y'',             ');
               SQL.Add('                         ''Y'',             ');               
               SQL.Add('                         :certprgb,         ');
               SQL.Add('                         :writetime,        ');
               SQL.Add('                         :writeemp)         ');

               ParamByName('empno').AsString      := DataIn.i_empno;
               ParamByName('korname').AsString    := DataIn.akorname;
               ParamByName('certkind').AsString   := DataIn.i_certkind;
               ParamByName('certdate').AsString   := DataIn.i_certdate;
               ParamByName('certused').AsString   := DataIn.aused;
               ParamByName('certpryn').AsString   := 'N';
               ParamByName('certprdate').AsString := copy(Fn_GetDateTimeStr,1,8);
               ParamByName('certprno').AsString   := DataIn.acertprno;
               ParamByName('certprcnt').AsString  := '1';
               ParamByName('certkidate').AsString := DataIn.acertkidate;
               ParamByName('certcnt').AsString    := DataIn.acertcnt;
               ParamByName('certterm').AsString   := '';
               ParamByName('payra').AsString      := DataIn.apayracode;
               ParamByName('telno').AsString      := DataIn.atelno;

               if(RB_2.Checked) then ParamByName('certprgb').AsString   := '1'
               else                  ParamByName('certprgb').AsString   := '';
                 
               ParamByName('writetime').AsString  := Fn_GetDateTimeStr;
               ParamByName('writeemp').AsString   := pempno;

               ExecSQL;
          end;
    end;
    DataIns := true;
end;

end.

