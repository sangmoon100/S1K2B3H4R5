{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 우리사주 인출 신청 및 보유현황(PSC2040A)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 복리후생(우리사주)
  Programmer     : 윤형식
  Version        : 1.00
  Date           : 2000.02.10
  Update Contents
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
     1.00  98.10.30        이수임      상세처리명세서     신규프로그램개발
    30.00  1999.03.02      김승회      계산로직변경       업무로직변경 => 퇴직반환에 따른 인출신청기능추가
    30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능, 주식주수로도 신청가능
    30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
--------------------------------------------------------------------------------}

unit psc20401;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Mask, StdCtrls, numedit, Gauges,
  Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls, Kyempno, //Sempno,
  Calen1, pass, Datelib, Kycode1, Kylib1, UserHelp, ActnList;

type
  TMainForm = class(TForm)
    DS_psowhis: TDataSource;

    GB_apply: TGroupBox;
    Panel6: TPanel;
    E_telno: TEdit;
    Panel1: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    Panel19: TPanel;
    BB_Save: TBitBtn;
    BB_cancel: TBitBtn;
    BB_exit: TBitBtn;
    BB_Insert: TBitBtn;
    Phelpmsg: TPanel;
    P_juminid: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    P_paycl: TPanel;
    P_payclNAME: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    P_owstcnt: TPanel;
    Panel8: TPanel;
    P_deptname: TPanel;
    P_deptcode: TPanel;
    P_orgnum: TPanel;
    GB_history: TGroupBox;
    DBGrid1: TDBGrid;
    GB_content: TGroupBox;
    Panel2: TPanel;
    ME_subdate: TMaskEdit;
    SB_subdate: TSpeedButton;
    NE_subamt: TNumberEdit;
    Label20: TLabel;
    Panel10: TPanel;
    E_wdissue: TEdit;
    SB_wdissue: TSpeedButton;
    Panel12: TPanel;
    P_wdissueNAME: TPanel;
    Panel13: TPanel;
    M_intrtp: TMemo;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    ME_wdidate: TMaskEdit;
    SB_wdidate: TSpeedButton;
    Panel18: TPanel;
    E_objaddr: TEdit;
    P_wddate: TPanel;
    P_wdstcnt: TPanel;
    P_wdamt: TPanel;
    E_ExitCheck: TEdit;
    NE_owstcnt: TNumberEdit;
    BB_delete: TBitBtn;
    Panel11: TPanel;
    P_depositno: TPanel;
    SB_pswddis: TSpeedButton;
    L_bspassyn: TLabel;
    BB_stockview: TBitBtn;
    SB_empno: TSpeedButton;
    P_Korname: TPanel;
    E_empno: TEdit;
    DS_psdphis: TDataSource;
    Panel21: TPanel;
    Panel22: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    L_appamt: TLabel;
    L_appdate: TLabel;
    GroupBox1: TGroupBox;
    Query_psdphis: TQuery;
    Query_psowhis: TQuery;
    Query_Gen: TQuery;
    Query_Code: TQuery;
    Query_psowhisSUBDATE: TStringField;
    Query_psowhisREQYN: TStringField;
    Query_psowhisWDYN: TStringField;
    Query_psowhisJUMINID: TStringField;
    Query_psowhisPAYCL: TStringField;
    Query_psowhisTELNO: TStringField;
    Query_psowhisDEPOSITNO: TStringField;
    Query_psowhisDEPTCODE: TStringField;
    Query_psowhisSUBAMT: TFloatField;
    Query_psowhisORGNUM: TStringField;
    Query_psowhisWDISSUE: TStringField;
    Query_psowhisWDIDATE: TStringField;
    Query_psowhisOBJADDR: TStringField;
    Query_psowhisREQDATE: TStringField;
    Query_psowhisREQYNDATE: TStringField;
    Query_psowhisWDYNDATE: TStringField;
    Query_psowhisWDDATE: TStringField;
    Query_psowhisWDSTCNT: TFloatField;
    Query_psowhisAPPDATE: TStringField;
    Query_psowhisAPPAMT: TFloatField;
    Query_psowhisWDAMT: TFloatField;
    Query_psowhisWRITETIME: TStringField;
    Query_psowhisWRITEMAN: TStringField;
    Query_psowhisEMPNO: TStringField;
    Query_psowhisKORNAME: TStringField;
    Panel20: TPanel;
    E_inmarkname: TEdit;
    SB_inmarkname: TSpeedButton;
    P_inmarkname: TPanel;
    Panel23: TPanel;
    E_instrname: TEdit;
    Panel24: TPanel;
    E_inaccnum: TEdit;
    Panel25: TPanel;
    E_inname: TEdit;
    Query_psowhisINMARKNAME: TStringField;
    Query_psowhisINSTRNAME: TStringField;
    Query_psowhisINACCNUM: TStringField;
    Query_psowhisINNAME: TStringField;
    Database1: TDatabase;
    NE_Substcnt: TNumberEdit;
    Panel26: TPanel;
    Label2: TLabel;
    Query_psowhisSUBSTCNT: TFloatField;
    Query_psdphisDIVSEQNUM: TFloatField;
    Query_psdphisDPSTCNT: TFloatField;
    Query_psdphisREMCNT: TFloatField;
    Query_psdphisSDIVSEQNUM: TFloatField;
    Query_psdphis_sum: TQuery;
    sGrid1: TStringGrid;
    Query_psdphisTAXCNT: TFloatField;
    Query_psdphisBTAXCNT: TFloatField;
    Query_psdphisTAXWRCNT: TFloatField;
    Query_psdphisBTAXWRCNT: TFloatField;
    DBGrid2: TDBGrid;
    Query_psdphisSTCLASS: TStringField;
    E_divseqnum: TEdit;
    Panel27: TPanel;
    BB_req: TBitBtn;
    P_Tax: TPanel;
    C_btax: TCheckBox;
    C_tax: TCheckBox;
    Query_psowhisTAXGUBUN: TStringField;
    P_App: TPanel;
    Panel29: TPanel;
    ME_Appdate: TMaskEdit;
    SB_reqdate: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Query_psowhisDIVSEQNUM: TStringField;
    Query_psowhisSDIVSEQNUM: TStringField;
    Query_psdphischoise1: TStringField;
    Query_psdphischoise2: TStringField;
    Query1: TQuery;
    ActionList1: TActionList;
    ActionList2: TActionList;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DS_psowhisDataChange(Sender: TObject; Field: TField);
    procedure ME_subdateChange(Sender: TObject);
    procedure E_wdissueKeyPress(Sender: TObject; var Key: Char);
    procedure SB_subdateClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure E_ExitCheckEnter(Sender: TObject);
    procedure BB_InsertClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure SB_wdissueClick(Sender: TObject);
    procedure ME_wdidateChange(Sender: TObject);
    procedure SB_wdidateClick(Sender: TObject);
    procedure E_wdissueChange(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure ME_wdidateExit(Sender: TObject);
    procedure SB_pswddisClick(Sender: TObject);
    procedure BB_stockviewClick(Sender: TObject);
    procedure SB_empnoClick(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoEnter(Sender: TObject);
    procedure ME_subdateEnter(Sender: TObject);
    procedure E_inmarknameChange(Sender: TObject);
    procedure SB_inmarknameClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BB_reqClick(Sender: TObject);
    procedure C_taxClick(Sender: TObject);
    procedure C_btaxClick(Sender: TObject);
    procedure E_divseqnumChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ME_AppdateChange(Sender: TObject);
    procedure SB_reqdateClick(Sender: TObject);
    //procedure DS_psdphisDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure psdphis_view;
    procedure psdphis_Save;
    procedure TaxGubun_Check;
    procedure DrawCheck(ACanvas: TCanvas; ARect: TRect; AColor: TColor; EditStyle: word; Flag: string);
  public
    { Public declarations }
    Pempno, Pkorname, Password : string;
    Curdate : String;
    { Public declarations }
    Job_mode : Integer;  {0.열람/무효, 1.입력, 2.수정}
    function  PyccodeA(codeid, codeno: string): string;
    function  PycdeptA(orgnum, deptcode: string): string;
    procedure RetrieveData;
    procedure GetInsa;
    procedure GetPsdphis;
    procedure DataAllClear;
    procedure Sdivseqnum_Select;
  end;

var
  MainForm: TMainForm;
  Running: Boolean;
  Save_EMPNO, Save_SUBDATE, Save_DIVSEQNUM : String;
  Sdivseqnum : String;
  taxGubun : String;
  SqlStr : WideString;
  ACol,ARow: Integer;
  iChkSenioryn : integer;

implementation
{$R *.DFM}

uses
  psc20402, psc20403, empno;

{------------------------------- Main ----------------------------------}
procedure TMainForm.FormActivate(Sender: TObject);
var
  i : integer;
begin
  if Running then System.Exit;
  Running := True;
  Application.ProcessMessages;

  Pempno   := PassEmp(CmdLine, 1);
  Pkorname := PassEmp(CmdLine, 2);
  Password := PassEmp(CmdLine, 3);
  Lempinfo.Caption := Pkorname + '(' +pempno+ ')';

  Application.ProcessMessages;
  for i := 0 to Database1.Params.Count-1 do
  begin
    if System.Pos('SERVER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'SERVER NAME=' + PassEmp(cmdline,13);
    if Pos('USER NAME',Database1.Params[i]) > 0 then
      Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if Pos('PASSWORD',Database1.Params[i]) > 0 then
     Database1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
  end;
  Database1.Connected := True;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
  Query_Gen.SQL.Add('FROM DUAL                                       ');
  Query_Gen.Open;

  Curdate := Query_Gen.FieldByName('D').AsString;
  Query_Gen.Close;
  Lsysdate.Caption := Copy(Curdate,1,4)+'/'+Copy(Curdate,5,2)+'/'+Copy(Curdate,7,2);

  Save_EMPNO      := '';
  Save_SUBDATE    := '';
  Save_DIVSEQNUM  := '';
  job_mode        := 0;

  Phelpmsg.caption := '  기초설정이 완료되었습니다. 작업하세요..';

  // =================================================
  // 1. 수 정 일 : 99-06-17
  // 2. 수 정 자 : 김승회
  // =================================================
  {
  E_empno.Text      := Pempno;    //login한 사원
  P_Korname.Caption := Pkorname;  // login한 사원의 성명
  Application.ProcessMessages;
  }

  {
  GetInsa;           // 기본인사사항

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add(' SELECT OWSTCNT, TELNO, DEPOSITNO     ');
  Query_Gen.SQL.Add(' FROM PSSTMAS                         ');
  Query_Gen.SQL.Add(' WHERE (EMPNO = '''+E_empno.Text+''') ');
  Query_Gen.Open;

  if Query_Gen.RecordCount = 0 then
  begin
    Query_Gen.Close;
    Application.ProcessMessages;
    E_ExitCheck.SetFocus;
  end
  else
  begin
    P_owstcnt.Caption   := Format('%7.0n',[Query_Gen.FieldByName('OWSTCNT').AsFloat]);  // 보유주수
    NE_owstcnt.Value    := Query_Gen.FieldByName('OWSTCNT').AsFloat;    // 화면에 안 나타남
    P_depositno.Caption := Query_Gen.FieldByName('DEPOSITNO').AsString; // 예탁번호
    E_telno.Text        := Query_Gen.FieldByName('TELNO').AsString;     // 연락처
    Query_Gen.Close;
    Application.ProcessMessages;
    GetPsdphis; // 예탁현황
    RetrieveData;
    DBGrid1.SetFocus;
  end;
  }
  //30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
  DBGrid2.Enabled:=True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Running := False;
end;

{------------------------------- USER FUNCTION ----------------------------------}
function TMainForm.PyccodeA(codeid,codeno: string): string;
begin
  Query_Code.Close;
  Query_Code.SQL.Clear;
  Query_Code.SQL.Add(' SELECT CODENAME                      ');
  Query_Code.SQL.Add(' FROM PYCCODE                         ');
  Query_Code.SQL.Add(' WHERE (CODEID   = '''+codeid+''') and');
  Query_Code.SQL.Add('       (CODENO   = '''+codeno+''')    ');
  Query_Code.Open;

  if Query_Code.RecordCount > 0 then
    Result := Query_Code.FieldByName('CODENAME').AsString
  else
    Result := '';
  Query_Code.Close;
end;

function TMainForm.PycdeptA(orgnum, deptcode: string): string;
begin
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add(' SELECT DEPTNAME                      ');
  Query_Gen.SQL.Add(' FROM PYCDEPT                         ');
  Query_Gen.SQL.Add(' WHERE (ORGNUM   = '''+orgnum+''') and');
  Query_Gen.SQL.Add('       (DEPTCODE = '''+deptcode+''')  ');
  Query_Gen.Open;
  
  if Query_Gen.RecordCount > 0 then
    Result := Query_Gen.FieldByName('DEPTNAME').AsString
  else
    Result := '';
  Query_Gen.Close;
end;

procedure TMainForm.DataAllClear;
var  i : integer;
begin
  ME_subdate.Text       := '';
  NE_subamt.Value       := 0;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
  NE_substcnt.Value     := 0;

  E_divseqnum.Text      := '';
  C_tax.Checked         := false;
  C_btax.Checked        := false;
  taxGubun              := ' ';
  for i := 1 to sGrid1.RowCount - 1 do
  begin
     if sGrid1.Cells[1,i] = '' then
       sGrid1.Cells[5,i] := ''
     else
       sGrid1.Cells[5,i] := '1';
  end;
  E_wdissue.Text        := '';
  P_wdissueNAME.Caption := '';
  ME_wdidate.Text       := '';
  E_objaddr.Text        := '';

  {/ ===============================================================================
     Version  date(yy.mm.dd)  programmer  description        relevant doc.no
     30.00     1999.3.2       김승회     계산로직변경        업무로직변경
   => Clear 항목추가
     =============================================================================== /}

  E_inmarkname.Text     := '';
  E_instrname.Text      := '';
  E_inaccnum.Text       := '';
  E_inname.text         := '';

  M_intrtp.Lines.Clear;

  P_wddate.Caption      := '';
  P_wdstcnt.Caption     := '';
  L_appamt.Caption      := '';
  L_appdate.Caption     := '';
  P_wdamt.Caption       := '';
end;

procedure TMainForm.GetInsa;
begin
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT a.JUMINID, a.PAYCL, a.ORGNUM, a.DEPTCODE,  ');
  Query_Gen.SQL.Add('       b.DEPTNAME, codename payclname             ');
  Query_Gen.SQL.Add('  FROM PIMPMAS a, PYCDEPT b, pyccode c            ');
  Query_Gen.SQL.Add(' WHERE a.EMPNO = '''+E_empno.text+''' and         ');
  Query_Gen.SQL.Add('       a.ORGNUM   = b.ORGNUM(+) and               ');
  Query_Gen.SQL.Add('       a.DEPTCODE = b.DEPTCODE(+)                 ');
  Query_Gen.SQL.Add('   and codeid(+) = ''I112'' and paycl = codeno(+) ');
  Query_Gen.Open;   {주민번호, 직급, 부서}

  P_juminid.Caption   := Query_Gen.FieldByName('JUMINID').AsString;
  P_paycl.Caption     := Query_Gen.FieldByName('PAYCL').AsString;
  //P_payclNAME.Caption := PyccodeA('I112', P_paycl.Caption);
  P_payclNAME.Caption := Query_Gen.FieldByName('payclname').AsString;
  P_orgnum.Caption    := Query_Gen.FieldByName('ORGNUM').AsString;
  P_deptcode.Caption  := Query_Gen.FieldByName('DEPTCODE').AsString;
  P_deptname.Caption  := Query_Gen.FieldByName('DEPTNAME').AsString;
  Query_Gen.Close;
end;

procedure TMainForm.GetPsdphis;
var
    tot_remcnt, iIdx : Longint;
    i                : integer;
begin
  //민용
  Application.ProcessMessages;
  Query_psdphis.Close;
  Query_psdphis.SQL.Clear;
  Query_psdphis.SQL.Add('SELECT a.DIVSEQNUM, a.EMPNO, a.KORNAME, a.DEPOSITNO,   ');
  Query_psdphis.SQL.Add('       A.DPSTCNT ,A.REMCNT, A.SDIVSEQNUM, A.STCLASS,   ');
  Query_psdphis.SQL.Add('       a.TAXCNT, a.BTAXCNT, a.TAXWRCNT, a.BTAXWRCNT ,  ');
  Query_psdphis.SQL.Add('       b.choice1, b.choice2                            ');
  Query_psdphis.SQL.Add(' FROM PSDPHIS A, PSOWCHK B                             ');
  Query_psdphis.SQL.Add('WHERE (A.EMPNO = :P_empno)                             ');
  Query_psdphis.SQL.Add('  AND (A.EMPNO = B.EMPNO (+))                          ');
  Query_psdphis.SQL.Add('  AND (B.SUBDATE (+)= :SUBDATE )                       ');
  Query_psdphis.SQL.Add('  AND (A.DIVSEQNUM = B.DIVSEQNUM(+) )                  ');
  Query_psdphis.SQL.Add('  AND (A.STCLASS   = B.STCLASS(+) )                    ');
  Query_psdphis.SQL.Add('ORDER BY DIVSEQNUM  desc                               ');
  Query_psdphis.ParamByName('P_empno').AsString := E_empno.Text;
  Query_psdphis.ParamByName('SUBDATE').AsString := ME_subdate.Text;
  Query_psdphis.Open;   // 예탁이력

  if Query_psdphis.RecordCount > 0 then
  begin
    tot_remcnt := 0;

    for iIdx := 0 to  Query_psdphis.RecordCount -1 do
    begin
      tot_remcnt := tot_remcnt + strtoint(Query_psdphis.FieldByName('REMCNT').AsString);
      //showmessage(inttostr(tot_remcnt));

      Query_psdphis.Next;
    end;
    P_owstcnt.Caption := inttostr(tot_remcnt);

    psdphis_view;
  end
  else
  begin
    for i := 1 to SGrid1.RowCount do
       SGrid1.Rows[i].Clear;
    SGrid1.RowCount     := 2;
  end;
end;

procedure TMainForm.RetrieveData;
begin
  Job_mode := 0;

  DataAllClear;
  Query_psowhis.Close;
  Query_psowhis.SQL.Clear;
  Query_psowhis.SQL.Add('SELECT A.*, inmarkname, instrname, inaccnum, inname ');
  Query_psowhis.SQL.Add('  FROM PSOWHIS A, PSSTMAS B                         ');
  Query_psowhis.SQL.Add(' WHERE (A.EMPNO = :P_empno)                         ');
  Query_psowhis.SQL.Add('   AND (B.EMPNO = :P_empno)                         ');
  Query_psowhis.SQL.Add(' ORDER BY SUBDATE desc                              ');
  Query_psowhis.ParamByName('P_empno').AsString := E_empno.Text;
  Query_psowhis.Open;

  if Query_psowhis.RecordCount = 0 then
  begin
    Phelpmsg.Caption := '  사번('+E_empno.Text+')의 신청된 자료가 한건도 없습니다.';
    BB_Insert.SetFocus;
  end
  else
  begin
    if Query_psowhis.Locate('EMPNO;SUBDATE;DIVSEQNUM',VarArrayOf([Save_EMPNO, Save_SUBDATE, Save_DIVSEQNUM]), [loPartialKey]) then
      DBGrid1.SetFocus;
  end;
end;

{------------------------------- Button Click ----------------------------------}
procedure TMainForm.SB_pswddisClick(Sender: TObject);
begin
  if (Copy(E_wdissue.Text,1,1) <> '2') or (Length(E_wdissue.Text) <> 3) then
    System.Exit;

  try
  DetailForm := TDetailForm.create(self);
  DetailForm.ShowModal;
  finally
  DetailForm.free;
  end;

  SqlStr := 'select count(*) cnt, min(sdate) min_sdate, sum(samt) samt_sum' + #13 +
            '  from pswddis                                               ' + #13 +
            ' where empno   =                     ''' + E_empno.Text + '''' + #13 +
            '   and subdate =                  ''' + ME_subdate.Text + '''';

  {/ ===============================================================================
     Version  date(yy.mm.dd)  programmer  description        relevant doc.no
     30.00     1999.3.2       김승회     계산로직변경        업무로직변경
  => 등록된 납일일자을 읽어 인출사유발생일을 설정
     =============================================================================== /}
  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(sqlstr);
  Query_Gen.Open;
  if Query_Gen.FieldByName('cnt').AsInteger > 0 then
     begin
     ME_wdidate.Text := Query_Gen.FieldByName('min_sdate').AsString;
     NE_subamt.value := Query_Gen.FieldByName('samt_sum').AsFloat;
     end
  else
     begin
     ME_wdidate.Text := '';
     NE_subamt.value := 0;
     end;
  Query_Gen.Close;
end;

procedure TMainForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BB_InsertClick(Sender: TObject);
begin
  if NE_owstcnt.Value = 0 then
  begin
    MessageBox(handle, '보유하신 주식수가 하나도 없습니다.  추가할 수 없습니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  Job_mode := 1;  // 입력
  DataAllClear;

  BB_req.Visible    := true;
  BB_save.Visible   := true;
  BB_delete.Visible := true;
  BB_cancel.Visible := true;

  ME_subdate.ReadOnly   := false;
  E_divseqnum.ReadOnly := false;
  SB_subdate.Enabled    := true;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
  NE_subamt.Enabled     := True;
  NE_Substcnt.Enabled   := True;
  NE_subamt.Color       := clWhite;
  NE_Substcnt.Color     := clWhite;

  GetInsa;
  ME_subdate.Text := Copy(CurDate,1,8);  // 신청일자
  sqlstr := 'select INMARKNAME, INSTRNAME, INACCNUM, INNAME' + #13 +
            '  from psstmas                                ' + #13 +
            ' where empno =        ''' + E_empno.Text + '''';
  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(sqlstr);
  Query_Gen.Open;

  if not Query_Gen.Eof then
     begin
     E_inmarkname.Text := Query_Gen.FieldByName('inmarkname').AsString;
     E_instrname.Text  := Query_Gen.FieldByName('INSTRNAME').AsString;
     E_inaccnum.Text   := Query_Gen.FieldByName('INACCNUM').AsString;
     E_inname.text     := Query_Gen.FieldByName('INNAME').AsString;
     end
  else
     begin
     E_inmarkname.Text := '';
     E_instrname.Text  := '';
     E_inaccnum.Text   := '';
     E_inname.text     := '';
     end;

  ME_subdate.SetFocus;
  L_bspassyn.Caption := 'N'; {기준통과여부 default}
end;

procedure TMainForm.BB_stockviewClick(Sender: TObject);
begin
  try
    ChartForm := TChartForm.Create(self);
    Phelpmsg.Caption := '  자료를 읽고 있습니다.';
    Application.ProcessMessages;
    ChartForm.Query_pswdbas.Open;
    ChartForm.Query_pswdbas_d.Open;
    Phelpmsg.Caption := '';
    ChartForm.ShowModal;
    ChartForm.Query_pswdbas.Close;
    ChartForm.Query_pswdbas_d.Close;
  finally
    ChartForm.free;
  end;
end;

procedure TMainForm.BB_cancelClick(Sender: TObject);
begin
  {
  sqlstr := 'delete from pswddis' + #13 +
            'where  (empno, subdate) in ' + #13 +
            '       (select empno, subdate ' + #13 +
            '        from   pswddis        ' + #13 +
     format('        where  empno = ''%s''',[E_empno.text]) + #13 +
           '        group by empno, subdate' + #13 +
           '        minus' + #13 +
           '        select empno, subdate' + #13 +
           '        from   psowhis' + #13 +
    format('        where  empno = ''%s'')',[E_empno.text]);
  }

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.sql.add(sqlstr);
  Query_Gen.ExecSql;

  if Query_psowhis.eof then
  begin
     DataAllClear;
     system.Exit;
  end;

  Job_mode := 0;
  if Query_psowhis.Locate('EMPNO;SUBDATE;DIVSEQNUM',VarArrayOf([Save_EMPNO, Save_SUBDATE,Save_DIVSEQNUM]), [loPartialKey]) then
     DBGrid1.SetFocus;

  sqlstr := 'select INMARKNAME, INSTRNAME, INACCNUM, INNAME' + #13 +
            '  from psstmas                                ' + #13 +
            ' where empno =        ''' + E_empno.Text + '''';

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(sqlstr);
  Query_Gen.Open;

  if not Query_Gen.Eof then
     begin
     E_inmarkname.Text := Query_Gen.FieldByName('inmarkname').AsString;
     E_instrname.Text  := Query_Gen.FieldByName('INSTRNAME').AsString;
     E_inaccnum.Text   := Query_Gen.FieldByName('INACCNUM').AsString;
     E_inname.text     := Query_Gen.FieldByName('INNAME').AsString;
     end
  else
     begin
     E_inmarkname.Text := '';
     E_instrname.Text  := '';
     E_inaccnum.Text   := '';
     E_inname.text     := '';
     end;
  Phelpmsg.Caption := '  작업이 취소되었습니다.';
end;

procedure TMainForm.BB_SaveClick(Sender: TObject);
var
   FromDate, ToDate : String;
   v_divseqnum      : string;
   i, Cntsum        : integer;
begin
  Phelpmsg.Caption := '';

  // =================================================
  // 1. 수 정 일 : 99-06-17
  // 2. 수 정 자 : 김승회
  // =================================================
  if (Job_mode = 2) and (Query_psowhisWDYN.AsString = 'Y') then
    begin
      MessageBox(handle, '이미 인출처리된 신청자료는 수정할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if Application.MessageBox('현재자료를 신청저장하시겠습니까?','작업안내',mb_yesno) = id_no then
     system.exit;

  if Job_mode = 0 then
  begin
    MessageBox(handle, '작업한 내용이 없습니다.  저장할 수 없습니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
{
  if Length(E_divseqnum.Text) = 0 then
  begin
    MessageBox(Handle, '상세차수를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;
}
  // =================================================
  // 1. 수 정 일 : 1999.04.30
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : Comment 처리(이호석 대리요청)
  // ==============================================
  {
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('Select empno From pkhmrhis           ');
  Query_Gen.SQL.Add('Where  empno = '''+E_empno.Text+'''  ');
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
  begin
    if Application.MessageBox('보증채무 이행각서를 제출 하셔야 합니다.'+
                       #13#13+'          신청하시겠습니까?',
                                      '작업안내', MB_OKCANCEL + MB_DefButton1) = IDCANCEL
    then System.Exit;
  end;
  }

  if trim(E_telno.Text) = '' then
  begin
    MessageBox(Handle, '연락처를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  if Length(ME_subdate.Text) <> 8 then
  begin
    MessageBox(Handle, '신청일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능 -->  기간만료에 대하여는 신청주수로 반영
    // 인출사유의 첫자리가 '0','1'인 자료는 (예, 퇴직반환) but 합병(011), 기타(999)는 위에서 신청불가)
    // 우리사주마스터.보유주수에 대해 모두 인출.
--------------------------------------------------------------------------------}
  //if NE_subamt.Value <= 0 then
  if (copy(E_wdissue.Text,1,1) <> '0') and (copy(E_wdissue.Text,1,1) <> '1') then
  begin                              //신청금액
    if (E_wdissue.Text = '811') and (NE_subamt.Value > 0) then
    begin
      MessageBox(Handle, '인출사유가 기간만료인경우 신청주수로 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;                              //신청주수
    if ((E_divseqnum.Text <> '6') or (E_wdissue.Text <> '999')) and (E_wdissue.Text <> '811') and (NE_substcnt.Value > 0) then
    begin
      MessageBox(Handle, '인출사유가 기간만료가 아닌경우 신청금액으로 입력하세요.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;
    if (NE_subamt.Value * NE_substcnt.Value < 0) or (NE_subamt.Value + NE_substcnt.Value = 0) then
    begin
      MessageBox(Handle, '신청금액 또는 신청주식을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      if NE_substcnt.Enabled = True then NE_substcnt.SetFocus
      else NE_Subamt.SetFocus;
      System.Exit;
    end;
  end;

  //신청주수와 잔여주수 비교
  Cntsum := 0;
  with sGrid1 do
  begin
    for i := 1 to RowCount -1 do
    begin
      if sGrid1.Cells[5,i] = '2' then
        Cntsum := Cntsum + StrToInt(sGrid1.Cells[3,i]);
    end;
  end;

  if (NE_substcnt.Value > Cntsum) then
  begin
    MessageBox(Handle, '신청주수가 잔여주수보다 많습니다. 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    if NE_substcnt.Enabled = True then NE_substcnt.SetFocus
    else NE_Subamt.SetFocus;
    System.Exit;
  end;


{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능 -->  기간만료에 대하여는 신청주수로 반영
--------------------------------------------------------------------------------}
  //if trim(E_wdissue.Text) = '' or then
  if (trim(E_wdissue.Text) = '') or (length(trim(E_wdissue.Text)) <> 3) then
  begin
    MessageBox(Handle, '인출사유를 정확히 입력하세요.','입력오류',MB_ICONWARNING);
    System.Exit;
  end;

  if Length(ME_wdidate.Text) <> 8 then
  begin
    MessageBox(Handle, '인출사유발생일을 정확히 입력하세요.','입력오류',MB_ICONWARNING);
    System.Exit;
  end;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT PLMONTH, FLMONTH                  ');
  Query_Gen.SQL.Add('  FROM PSWDIBAS                          ');
  Query_Gen.SQL.Add(' WHERE (WDISSUE = '''+E_wdissue.text+''')');
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
  begin
    { ===========================================================================
       변경사유 : 날짜범위 Check Logic 수정
       변경일자 : 1999.04.14
       변경자   : 김승회
       =========================================================================== }
    {
    FromDate := CalcMonth(Copy(ME_subdate.Text,1,6),
                          (-1 * Query_Gen.FieldByName('PLMONTH').AsInteger))+
                Copy(ME_subdate.Text,7,2);
    ToDate   := CalcMonth(Copy(ME_subdate.Text,1,6),
                          Query_Gen.FieldByName('FLMONTH').AsInteger)+
                Copy(ME_subdate.Text,7,2);
    }
    FromDate := CalcMonth(Copy(ME_wdidate.Text,1,6),
                          (-1 * Query_Gen.FieldByName('PLMONTH').AsInteger))+
                Copy(ME_wdidate.Text,7,2);
    ToDate   := CalcMonth(Copy(ME_wdidate.Text,1,6),
                          Query_Gen.FieldByName('FLMONTH').AsInteger)+
                Copy(ME_wdidate.Text,7,2);


    // 인출사유발생일이 이전,이후 한도를 벗어나면
    //if (ME_wdidate.Text < FromDate) or (ME_wdidate.Text > ToDate) then
    if (ME_subdate.Text < FromDate) or (ME_subdate.Text > ToDate) then
    begin
      //MessageBox(Handle, '신청일을 기준으로 인출사유발생일이 인출한도개월수를 초과했습니다.', '입력오류', MB_ICONWARNING);
      MessageBox(Handle, '사유발생일기준으로 인출신청일이 인출한도개월수를 초과했습니다.', '입력오류', MB_ICONWARNING);
      Query_Gen.Close;
      System.Exit;
    end;
  end;

  if (E_divseqnum.Text = '2') and (C_tax.Checked = false) and (C_btax.Checked = false) then
  begin
    MessageBox(Handle, '신주/구주를 정확히 선택하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  if (E_divseqnum.Text > '3') and (E_divseqnum.Text < '6') and (C_tax.Checked = false) and (C_btax.Checked = false) then
  begin
    MessageBox(Handle, '과세/비과세를 정확히 선택하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  if (Copy(E_wdissue.Text,1,1) = '2') and (E_objaddr.Text = '') then
  begin
    MessageBox(Handle, '목적지주소를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  {/ ===============================================================================
      Version  date(yy.mm.dd)  programmer  description        relevant doc.no
  	30.00     1999.3.2       김승회     계산로직변경        업무로직변경
   => Check 로직추가
     =============================================================================== /}

  if copy(E_wdissue.Text,1,1) = '2' then
  begin
  SqlStr := 'select count(*) cnt '   + #13 +
            '  from pswddis      '   + #13 +
            ' where empno   =    ''' + E_empno.Text + '''' + #13 +
            '   and subdate =    ''' + ME_subdate.Text + '''';

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add(sqlstr);
  Query_Gen.Open;
  if Query_Gen.FieldByName('cnt').AsInteger = 0 then
     begin
     MessageBox(Handle, '인출세부사유를 등록하지 않았습니다.', '입력오류', MB_ICONWARNING);
     System.Exit;
     end;
  end;

  {/ ===============================================================================
     Version  date(yy.mm.dd)  programmer  description        relevant doc.no
     30.00     1999.3.2       김승회     계산로직변경        업무로직변경
  => 우리사주 마스터 Update
    =============================================================================== /}
  sqlstr := 'update psstmas                                            '                      + #13 +
     format('   set inmarkname = ''%s'',                               ',[E_inmarkname.text]) + #13 +
     format('       instrname  = ''%s'',                               ',[E_instrname.text])  + #13 +
     format('       inaccnum   = ''%s'',                               ',[E_inaccnum.text])   + #13 +
     format('       inname     = ''%s'',                               ',[E_inname.text])     + #13 +
     format('       writeman   = ''%s'',                               ',[pempno])            + #13 +
            '       writetime  = to_char(sysdate,''yyyymmddhh24missd'')'                      + #13 +
     format(' where empno      = ''%s''                                ',[E_empno.text]);

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add(sqlstr);
  Query_Gen.ExecSql;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT * FROM PSOWHIS                                  ');
  Query_Gen.SQL.Add('WHERE  (EMPNO   = '''+Query_psowhisEMPNO.AsString+''') ');
  Query_Gen.SQL.Add('and    (SUBDATE = '''+ME_SUBDATE.Text+''')             ');
  Query_Gen.SQL.Add('and (SDIVSEQNUM = '''+Sdivseqnum+''')                  ');
  Query_Gen.SQL.Add('and (TAXGUBUN   = '''+TAXGUBUN+''')                    ');
  Query_Gen.Open;

  if Query_Gen.RecordCount = 0 then
  begin
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
{
//     Query_Gen.Close;
//     Query_Gen.SQL.Clear;
//     Query_Gen.SQL.Add('INSERT INTO PSOWHIS                                                 ');
//     Query_Gen.SQL.Add('(EMPNO, KORNAME, JUMINID, PAYCL, ORGNUM, DEPTCODE, DEPOSITNO, TELNO,');
//     //Query_Gen.SQL.Add('SUBDATE, SUBAMT, WDISSUE, WDIDATE, OBJADDR, WRITETIME, WRITEMAN)    ');
//     Query_Gen.SQL.Add('VALUES                                                              ');
//     Query_Gen.SQL.Add('('''+E_empno.Text+''', '''+P_korname.Caption+''',                   ');
//     Query_Gen.SQL.Add(' '''+P_juminid.Caption+''','''+P_paycl.Caption+''',                 ');
//     Query_Gen.SQL.Add(' '''+P_orgnum.Caption+''', '''+P_deptcode.Caption+''',              ');
//     Query_Gen.SQL.Add(' '''+P_depositno.Caption+''', '''+E_telno.Text+''',                 ');
//     Query_Gen.SQL.Add(' '''+ME_subdate.Text+''', '+FloatToStr(NE_subamt.Value)+',          ');
//     Query_Gen.SQL.Add(' '''+E_wdissue.Text+''', '''+ME_wdidate.Text+''',                   ');
//     Query_Gen.SQL.Add(' '''+E_objaddr.Text+''',                                            ');
//     //Query_Gen.SQL.Add(' '''+Copy(CurDate,1,14)+''', '''+Pempno+''')                        ');
//     Query_Gen.SQL.Add(' to_char(sysdate,''yyyymmddhh24missd''), '''+Pempno+''')                        ');
//     Query_Gen.ExecSQL;
}
     //30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
     //예탁현황(DBGrid2)에서 차수를 선택하면 PSOWHIS(인출이력)테이블의 sdivseqnum필드에 선택한 차수를 저장한다.
      if Query_psdphis.Active then
      begin
        for i := 0 to DBGrid2.SelectedRows.Count-1 do
        begin
          Query_psdphis.DisableControls;
          Query_psdphis.GotoBookmark(pointer(DBGrid2.SelectedRows.Items[i]));
          v_divseqnum:=Query_psdphis.FieldByName('divseqnum').AsString;
        end;
      end;

     Query_Gen.Close;
     Query_Gen.SQL.Clear;
     Query_Gen.SQL.Text:='INSERT INTO PSOWHIS                                                 '+
                         '(EMPNO, KORNAME, JUMINID, PAYCL,                                    '+
                         ' ORGNUM, DEPTCODE, DEPOSITNO, TELNO,                                '+
                         ' SUBDATE, SUBAMT, SUBSTCNT, WDISSUE, WDIDATE,                       '+
                         ' OBJADDR, REQYN, REQDATE,                                           '+
                         ' WRITETIME, WRITEMAN,                                               '+
                         ' DIVSEQNUM,SDIVSEQNUM,TAXGUBUN)                                     '+
                         'VALUES                                                              '+
                         '('''+E_empno.Text+''', '''+P_korname.Caption+''',                   '+
                         ' '''+P_juminid.Caption+''','''+P_paycl.Caption+''',                 '+
                         ' '''+P_orgnum.Caption+''', '''+P_deptcode.Caption+''',              '+
                         ' '''+P_depositno.Caption+''', '''+E_telno.Text+''',                 '+
                         ' '''+ME_subdate.Text+''', '+FloatToStr(NE_subamt.Value)+',          '+
                         ' '+FloatToStr(NE_SubStcnt.Value)+',                                 '+
                         ' '''+E_wdissue.Text+''', '''+ME_wdidate.Text+''',                   '+
                         ' '''+E_objaddr.Text+''', ''Y'', '''+ME_wdidate.Text+''',            '+
                         ' to_char(sysdate,''yyyymmddhh24missd''), '''+Pempno+''',            '+
                         ' '''+E_divseqnum.Text+''','''+Sdivseqnum+''','''+taxGubun+''')      ';

     //Edit1.Text := Query_Gen.SQL.Text;

     Query_Gen.ExecSQL;

     Phelpmsg.Caption := '  신규 신청자료가 등록되었습니다.';
  end
  else if Query_Gen.RecordCount > 0 then
  begin
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
{
//        Query_Gen.Close;
//        Query_Gen.SQL.Clear;
//        Query_Gen.SQL.Add(' UPDATE PSOWHIS                                            ');
//        Query_Gen.SQL.Add('    SET TELNO     = '''+E_telno.Text+''',                  ');
//        Query_Gen.SQL.Add('        SUBAMT    = '''+FloatToStr(NE_subamt.Value)+''',   ');
//        Query_Gen.SQL.Add('        WDISSUE   = '''+E_wdissue.Text+''',                ');
//        Query_Gen.SQL.Add('        WDIDATE   = '''+ME_wdidate.Text+''',               ');
//        Query_Gen.SQL.Add('        OBJADDR   = '''+E_objaddr.Text+''',                ');
//        Query_Gen.SQL.Add('        WRITETIME = to_char(sysdate,''yyyymmddhh24missd''), ');
//        Query_Gen.SQL.Add('        WRITEMAN  = '''+Pempno+'''                         ');
//        Query_Gen.SQL.Add(' WHERE (EMPNO   = '''+Query_psowhisEMPNO.AsString+''') and ');
//        Query_Gen.SQL.Add('       (SUBDATE = '''+Query_psowhisSUBDATE.AsString+''')   ');
//        Query_Gen.ExecSQL;
}
        //30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
        //예탁현황(DBGrid2)에서 차수를 선택하면 PSOWHIS(인출이력)테이블의 divseqnum필드에 선택한 차수를 저장한다.
        if Query_psdphis.Active then
        begin
          for i := 0 to DBGrid2.SelectedRows.Count-1 do
          begin
            Query_psdphis.DisableControls;
            Query_psdphis.GotoBookmark(pointer(DBGrid2.SelectedRows.Items[i]));
            v_divseqnum:=Query_psdphis.FieldByName('divseqnum').AsString;
          end;
        end;

        Query_Gen.Close;
        Query_Gen.SQL.Clear;
        if  Query_psowhisSDIVSEQNUM.AsString <> ''then
        Query_Gen.SQL.Text := ' UPDATE PSOWHIS                                                 '+
                              '    SET TELNO       = '''+E_telno.Text+''',                     '+
                              '        SUBAMT      = '''+FloatToStr(NE_subamt.Value)+''',      '+
                              '        SUBSTCNT    = '''+FloatToStr(NE_SubStcnt.Value)+''',    '+
                              '        WDISSUE     = '''+E_wdissue.Text+''',                   '+
                              '        WDIDATE     = '''+ME_wdidate.Text+''',                  '+
                              '        OBJADDR     = '''+E_objaddr.Text+''',                   '+
                              '        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),   '+
                              '        WRITEMAN    = '''+Pempno+''',                           '+
                              '        SDIVSEQNUM  = '''+Sdivseqnum+''',                       '+
                              '        TAXGUBUN    = '''+TaxGubun+'''                          '+
                              ' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''') '+
                              '   and (SUBDATE     = '''+Query_psowhisSUBDATE.AsString   +''') '+
                              '   and (SDIVSEQNUM  = '''+Query_psowhisSDIVSEQNUM.AsString+''') '+
                              '   and (TAXGUBUN    = '''+Query_psowhisTAXGUBUN.AsString+''')   '
        else
                Query_Gen.SQL.Text := ' UPDATE PSOWHIS                                                 '+
                              '    SET TELNO       = '''+E_telno.Text+''',                     '+
                              '        SUBAMT      = '''+FloatToStr(NE_subamt.Value)+''',      '+
                              '        SUBSTCNT    = '''+FloatToStr(NE_SubStcnt.Value)+''',    '+
                              '        WDISSUE     = '''+E_wdissue.Text+''',                   '+
                              '        WDIDATE     = '''+ME_wdidate.Text+''',                  '+
                              '        OBJADDR     = '''+E_objaddr.Text+''',                   '+
                              '        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),   '+
                              '        WRITEMAN    = '''+Pempno+''',                           '+
                              '        SDIVSEQNUM  = '''+Sdivseqnum+''',                       '+
                              '        TAXGUBUN    = '''+TaxGubun+'''                          '+
                              ' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''') '+
                              '   and (SUBDATE     = '''+Query_psowhisSUBDATE.AsString   +''') ';
        Query_Gen.ExecSQL;

        {
        Query_Gen.Close;
        Query_Gen.SQL.Clear;
        Query_Gen.SQL.Add(' DELETE FROM PSDPSP                           ');
        Query_Gen.SQL.Add(' WHERE (EMPNO   = '''+E_empno.Text+''') and   ');
        Query_Gen.SQL.Add('       (SUBDATE = '''+ME_subdate.Text+''')    ');
        Query_Gen.ExecSQL;
        }
        Phelpmsg.Caption := '  기존 신청내역을 수정하였습니다.';
  end;

  //저장
  psdphis_save;

  if Copy(E_wdissue.text,1,1) = '2' then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('SELECT EMPNO                               ');
    Query_Gen.SQL.Add('FROM PSWDDIS                               ');
    Query_Gen.SQL.Add('WHERE (EMPNO   = '''+E_empno.Text+''')     ');
    Query_Gen.SQL.Add('and   (SUBDATE = '''+ME_subdate.Text+''')  ');
    Query_Gen.Open;

    if Query_Gen.RecordCount > 0 then
    begin
      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.Add('UPDATE PSWDDIS                                ');
      Query_Gen.SQL.Add('SET BSPASSYN = ''Y'',                         ');
      Query_Gen.SQL.Add('    SAVEYN   = ''Y'',                         ');
      Query_Gen.SQL.Add('    WRITETIME = to_char(sysdate,''yyyymmddhh24missd''),   ');
      Query_Gen.SQL.Add('    WRITEMAN  = '''+Pempno+'''                ');
      Query_Gen.SQL.Add('WHERE (EMPNO   = '''+E_empno.Text+''') and    ');
      Query_Gen.SQL.Add('      (SUBDATE = '''+ME_subdate.Text+''') and ');
      Query_Gen.SQL.Add('      (SAVEYN  = ''N'')                       ');
      Query_Gen.ExecSQL;
    end;
  end;

  Application.ProcessMessages;

  Save_EMPNO      := E_empno.Text;
  Save_SUBDATE    := ME_subdate.Text;
  Save_DIVSEQNUM  := E_divseqnum.Text;
  RetrieveData;
end;

procedure TMainForm.BB_deleteClick(Sender: TObject);
begin
  Phelpmsg.Caption := '';

  if Query_psowhisWDYN.AsString = 'Y' then
  begin
    MessageBox(handle, '이미 인출처리된 신청자료는 삭제할 수 없습니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  if Application.MessageBox('현재자료를 삭제하시겠습니까?','작업안내',mb_yesno) = id_no then
     system.exit;

  if Query_psowhis.RecordCount = 0 then
  begin
    DataAllClear;
    MessageBox(handle, '신청내역 자료가 한건도 없습니다',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  if (ME_subdate.Text = '') or (Job_mode <> 2) then
  begin
    MessageBox(handle, '먼저 삭제하려는 신청내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  {
  if Application.MessageBox('선택한 신청자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK
  then
  begin
  }
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('DELETE FROM PSOWHIS                                          ');
  Query_Gen.SQL.Add('WHERE (EMPNO      = '''+Query_psowhisEMPNO.AsString+     ''')');
  Query_Gen.SQL.Add('and   (SUBDATE    = '''+Query_psowhisSUBDATE.AsString+   ''')');
  if Query_psowhisSDIVSEQNUM.AsString <> '' then
  begin
  Query_Gen.SQL.Add('and   (Sdivseqnum = '''+Query_psowhisSDIVSEQNUM.AsString+ ''')');
  Query_Gen.SQL.Add('and   (TAXGUBUN   = '''+Query_psowhisTAXGUBUN.AsString+ ''')  ');
  end;
  Query_Gen.ExecSQL;

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.SQL.Add('DELETE FROM PSOWCHK                                       ');
  Query_Gen.SQL.Add(' WHERE (EMPNO      = '''+e_empno.text+     ''')           ');
  Query_Gen.SQL.Add('   and (SUBDATE    = '''+ME_subdate.text+  ''')           ');
  Query_Gen.ExecSql;

  {
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('DELETE FROM PSDPSP                                       ');
  Query_Gen.SQL.Add('WHERE (EMPNO      = '''+Query_psowhisEMPNO.AsString+''')  ');
  Query_Gen.SQL.Add('and   (SUBDATE    = '''+Query_psowhisSUBDATE.AsString+''')');
  Query_Gen.ExecSQL;
  }

  RetrieveData;
  Phelpmsg.Caption := '  선택한 신청자료를 삭제하였습니다.';
  //end;
end;

{------------------------------- Event ----------------------------------}
procedure TMainForm.E_ExitCheckEnter(Sender: TObject);
begin
  MessageBox(handle, '보유하신 주식수가 없습니다.  작업할 수 없습니다.',
                     '작업안내', MB_ICONWARNING);
  Close;
end;

procedure TMainForm.Sdivseqnum_Select;
begin
  Sdivseqnum := ' ';
  if E_Divseqnum.Text = '1' then
     Sdivseqnum := '1'
  else
  if E_Divseqnum.Text = '2' then
  begin
    if taxgubun    = '신주' then
       Sdivseqnum := '3'
    else
       Sdivseqnum := '4';
  end
  else
  if E_Divseqnum.Text = '3' then
     Sdivseqnum := '5'
  else
  if E_Divseqnum.Text = '4' then
     Sdivseqnum := '6'
  else
  if E_Divseqnum.Text = '5' then
     Sdivseqnum := '7'
  else
  if E_Divseqnum.Text = '6' then
     Sdivseqnum := '8'
  else
     Sdivseqnum := ' ';
  if taxgubun    = '' then
     taxgubun   := ' ';   
end;

procedure TMainForm.DS_psowhisDataChange(Sender: TObject; Field: TField);
var
  i : integer;
begin
  if Query_psowhis.RecordCount = 0 then
  begin
    Job_mode := 0;
    System.Exit;
  end;
  Job_mode := 2;  // 수정

  Save_EMPNO      := Query_psowhisEMPNO.AsString;
  Save_SUBDATE    := Query_psowhisSUBDATE.AsString;
  Save_DIVSEQNUM  := Query_psowhisDIVSEQNUM.AsString;

  {/ ===============================================================================
     Version  date(yy.mm.dd)  programmer  description        relevant doc.no
     30.00     1999.3.2       김승회     계산로직변경        업무로직변경
  => 우리사주 마스터 관련자료 조회기능 추가
     =============================================================================== /}

  E_inmarkname.Text := Query_psowhis.FieldByName('inmarkname').AsString;
  E_instrname.Text  := Query_psowhis.FieldByName('INSTRNAME').AsString;
  E_inaccnum.Text   := Query_psowhis.FieldByName('INACCNUM').AsString;
  E_inname.text     := Query_psowhis.FieldByName('INNAME').AsString;
  E_divseqnum.Text  := Query_psowhis.FieldByName('divseqnum').AsString;
  TaxGubun          := Query_psowhis.FieldByName('taxgubun').AsString;
  if (TaxGubun ='과세') or
     (TaxGubun ='신주') then
     C_tax.Checked  := true
  else if (TaxGubun ='비과세') or
          (TaxGubun ='구주'  ) then
     C_btax.Checked := true;

  Sdivseqnum_Select;

  P_juminid.Caption   := Query_psowhisJUMINID.AsString;
  E_telno.Text        := Query_psowhisTELNO.AsString;
//  P_paycl.Caption     := Query_psowhisPAYCL.AsString;
//  P_payclNAME.Caption := PyccodeA('I112', P_paycl.Caption);
  P_depositno.Caption := Query_psowhisDEPOSITNO.AsString;
//  P_orgnum.Caption    := Query_psowhisORGNUM.AsString;
//  P_deptcode.Caption  := Query_psowhisDEPTCODE.AsString;
//  P_deptname.Caption  := PycdeptA(P_orgnum.Caption, P_deptcode.Caption);

  ME_subdate.text := Query_psowhisSUBDATE.AsString;
  NE_subamt.Value := Query_psowhisSUBAMT.AsFloat;
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
 Query_psowhis : TQuery의 SUBSTCNT추가(Displaymask:= #,##0)
--------------------------------------------------------------------------------}
  NE_substcnt.Value := Query_psowhisSUBSTCNT.AsFloat;

  E_wdissue.text  := Query_psowhisWDISSUE.AsString;
  if E_wdissue.Text <> '' then
    P_wdissueNAME.Caption := PyccodeA('S210', E_wdissue.text)
  else
    P_wdissueNAME.Caption := '';

  ME_wdidate.Text := Query_psowhisWDIDATE.AsString;
  E_objaddr.Text  := Query_psowhisOBJADDR.AsString;

  if Query_psowhisWDDATE.AsString <> '' then
    P_wddate.Caption  := Copy(Query_psowhisWDDATE.AsString,1,4)+'.'+
                         Copy(Query_psowhisWDDATE.AsString,5,2)+'.'+
                         Copy(Query_psowhisWDDATE.AsString,7,2)
  else
    P_wddate.Caption  := '';

  P_wdstcnt.Caption := Format('%6.0n', [Query_psowhisWDSTCNT.AsFloat]);  // 인출주수
  P_wdamt.Caption   := Format('%9.0n', [Query_psowhisWDAMT.AsFloat]);    // 인출금액

  L_appamt.Caption  := Format('%9.0n', [Query_psowhisAPPAMT.AsFloat]);   // 기준금액
  if Query_psowhisAPPDATE.AsString <> '' then
    L_appdate.Caption := Copy(Query_psowhisAPPDATE.AsString,1,4)+'.'+
                         Copy(Query_psowhisAPPDATE.AsString,5,2)+'.'+
                         Copy(Query_psowhisAPPDATE.AsString,7,2)
  else
    L_appdate.Caption := '';

  if Query_psowhisWDYN.AsString <> 'Y' then // 접수처리 안된자료는 기준통과여부 검사
  begin
    ME_wdidateExit(Sender);
    BB_req.Visible    := true;
    BB_save.Visible   := true;
    BB_delete.Visible := true;
    BB_cancel.Visible := true;
  end
  else
  begin
    BB_req.Visible    := false;
    BB_save.Visible   := false;
    BB_delete.Visible := false;
    BB_cancel.Visible := false;
  end;
  GetPsdphis;
end;

procedure TMainForm.ME_subdateChange(Sender: TObject);
begin
  if Length(ME_subdate.Text) = 8 then
  begin
    if DateCheck(Copy(ME_subdate.Text,1,4),Copy(ME_subdate.Text,5,2),
                 Copy(ME_subdate.Text,7,2)) = -1 then
    begin
      MessageBox(Handle, '신청일자을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      exit;
    end;
  end;
end;
procedure TMainForm.SB_subdateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_subdate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TMainForm.E_wdissueKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  Key := #0;
  P_wdissueNAME.Caption := PyccodeA('S210', E_wdissue.text);
end;
procedure TMainForm.SB_wdissueClick(Sender: TObject);
begin
  Fkycode1 := TFkycode1.Create(Self);
  Try
    Fkycode1.FormData := '인출사유 코드조회';
    Fkycode1.DataVal1 := 'S210';
    Fkycode1.ShowModal;
    if Fkycode1.CloseChk = -1 then Exit;
    E_wdissue.Text        := Fkycode1.code;
    P_wdissueNAME.Caption := Fkycode1.CodeName;
  Finally
    Fkycode1.Free;
  end;
  E_wdissue.SetFocus;
end;

procedure TMainForm.E_wdissueChange(Sender: TObject);
begin
  SB_pswddis.Enabled := False;

{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
   30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
--------------------------------------------------------------------------------}
  if E_wdissue.text = '' then
  begin
    NE_Substcnt.Enabled := True;
    NE_Substcnt.Color   := clWhite;

    NE_subamt.Enabled   := True;
    NE_subamt.Color     := clWhite;
  end
  else if ((E_wdissue.text = '011') or (E_wdissue.text = '111')) then
  begin
    DBGrid2.Enabled:=False;            //합병(011), 퇴직반환(111)인 경우 예탁현황(DBGrid2)를 False한다.
    DBGrid2.Color  := $00E6DED9;       //False된 예탁현황(DBGrid2)에 다른 색을 준다.
  end
  else if ((E_wdissue.text = '811') or ((E_divseqnum.Text = '6') AND (E_wdissue.text = '999'))) then
  begin
    NE_Substcnt.Enabled := True;
    NE_Substcnt.Color   := clWhite;

    NE_subamt.Value     := 0;
    NE_subamt.Enabled   := False;
    NE_subamt.Color     := $00E6DED9;
    DBGrid2.Enabled     := True;      //기간만료(811)인 경우 예탁현황(DBGrid2)를 True한다.
    DBGrid2.Color       := $00E3FFFF; //True된 예탁현황(DBGrid2)에 원래 색을 준다.
  end
  else
  begin
    NE_Substcnt.Value   := 0;
    NE_Substcnt.Enabled := False;
    NE_Substcnt.Color   := $00E6DED9;

    NE_subamt.Enabled   := True;
    NE_subamt.Color     := clWhite;
    DBGrid2.Enabled     := True;      //그외 인출사유인 경우 예탁현황(DBGrid2)를 True한다.
    DBGrid2.Color       := $00E3FFFF; //True된 예탁현황(DBGrid2)에 원래 색을 준다.
  end;

  if Length(E_wdissue.text) <> 3 then
    System.Exit;
  if (Job_mode = 1) and // 입력
     ( (E_wdissue.text = '001') or
{-------------------------------------------------------------------------------
 Version  date(yy.mm.dd)  programmer  relevant doc.no    description
   30.00  1999.03.02      김승회      계산로직변경       업무로직변경 => 퇴직반환에 따른 인출신청기능추가
   30.02  2000.02.10      윤형식      전2000-02-08       기간만료 신청가능
--------------------------------------------------------------------------------}
       //(E_wdissue.text = '111') or
       //(E_wdissue.text = '811') or
       (E_wdissue.text = '001'))
       //(E_wdissue.text = '999'))
  then
  begin
    MessageBox(Handle, '이 인출사유는 입력할 수 없습니다.', '입력오류', MB_ICONWARNING);
    E_wdissue.Text := '';
    P_wdissueNAME.Caption := '';
    System.Exit;
  end;

  if Copy(E_wdissue.text,1,1) = '2' then
    SB_pswddis.Enabled := True;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT INTRPT                           ');
  Query_Gen.SQL.Add('FROM PSWDIBAS                           ');
  Query_Gen.SQL.Add('WHERE (WDISSUE = '''+E_wdissue.text+''')');
  Query_Gen.Open;

  if not Query_Gen.EOF then
    M_intrtp.Lines.Assign(Query_Gen.FieldByName('INTRPT'))  // 제출서류
  else
    M_intrtp.Lines.Clear;
  Query_Gen.Close;
  P_wdissueNAME.Caption := PyccodeA('S210', E_wdissue.text);
end;

procedure TMainForm.ME_wdidateChange(Sender: TObject);
begin
  if Length(ME_wdidate.Text) = 8 then
  begin
    if DateCheck(Copy(ME_wdidate.Text,1,4),Copy(ME_wdidate.Text,5,2),
                 Copy(ME_wdidate.Text,7,2)) = -1 then
      MessageBox(Handle, '인출사유발생일을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
  end;
end;

procedure TMainForm.SB_wdidateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_wdidate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TMainForm.ME_wdidateExit(Sender: TObject);
var
  FromDate, ToDate: String;
begin
  {
  L_bspassyn.Caption := 'N'; //기준통과여부 default
  if (Length(E_wdissue.text) <> 3) or
     (Length(ME_wdidate.Text) <> 8) or
     (Length(ME_subdate.Text) <> 8)
  then System.Exit;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT PLMONTH, FLMONTH                 ');
  Query_Gen.SQL.Add('FROM PSWDIBAS                           ');
  Query_Gen.SQL.Add('WHERE (WDISSUE = '''+E_wdissue.text+''')');
  Query_Gen.Open;


  if Query_Gen.RecordCount > 0 then
  begin
    // ===========================================================================
    // 변경사유 : 날짜범위 Check Logic 수정
    // 변경일자 : 1999.04.14
    // 변경자   : 김승회
    //  ===========================================================================
    FromDate := CalcMonth(Copy(ME_subdate.Text,1,6),
                          (-1 * Query_Gen.FieldByName('PLMONTH').AsInteger))+
                Copy(ME_subdate.Text,7,2);
    ToDate   := CalcMonth(Copy(ME_subdate.Text,1,6),
                          Query_Gen.FieldByName('FLMONTH').AsInteger)+
                Copy(ME_subdate.Text,7,2);

    // 인출사유발생일이 이전,이후 한도를 벗어나면
    if (ME_wdidate.Text < FromDate) or (ME_wdidate.Text > ToDate) then
    begin
      MessageBox(Handle, '신청일을 기준으로 인출사유발생일이 인출한도개월수를 초과했습니다.', '입력오류', MB_ICONWARNING);
      Query_Gen.Close;
      System.Exit;
    end;
    L_bspassyn.Caption := 'Y'; // 기준통과여부
  end;
  Query_Gen.Close;
  }
end;

procedure TMainForm.SB_empnoClick(Sender: TObject);
begin
  Try
     EmpForm           := TEmpForm.Create(Self);
     EmpForm.InValue   := E_EmpNo.Text;
     EmpForm.ShowModal;
     if EmpForm.OutEmpNo <> '' then
     begin
        DataAllClear;

        E_EmpNo.Text      := EmpForm.OutEmpNo;
        P_KorName.Caption := EmpForm.OutKorName;
        Application.ProcessMessages;

        GetInsa;     // 기본인사사항

        Query_Gen.Close;
        Query_Gen.SQL.Clear;
        Query_Gen.SQL.Add('SELECT EMPNO, KORNAME, OWSTCNT, TELNO, DEPOSITNO ');
        Query_Gen.SQL.Add('FROM   PSSTMAS                                   ');
        Query_Gen.SQL.Add('WHERE (EMPNO = '''+E_empno.Text+''')             ');
        Query_Gen.Open;
        //Edit1.Text := Query_Gen.SQL.Text;

        //E_Empno.Text        := Query_Gen.FieldByName('empno').AsString;     // 사번
        P_Korname.Caption   := Query_Gen.FieldByName('KORNAME').AsString;   // 성명
       // P_owstcnt.Caption   := Format('%7.0n',[Query_Gen.FieldByName('OWSTCNT').AsFloat]);  // 보유주수
        NE_owstcnt.Value    := Query_Gen.FieldByName('OWSTCNT').AsFloat;    // 화면에 안 나타남
        P_depositno.Caption := Query_Gen.FieldByName('DEPOSITNO').AsString; // 예탁번호
        E_telno.Text        := Query_Gen.FieldByName('TELNO').AsString;     // 연락처
        Query_Gen.Close;
        Application.ProcessMessages;
        GetPsdphis; // 예탁현황
        RetrieveData;
        ME_subdate.ReadOnly   := true;
        E_divseqnum.ReadOnly  := true;
        SB_subdate.Enabled    := false;
        DBGrid1.SetFocus;
     end;
  Finally
     EmpForm.Free;
  end;
end;

procedure TMainForm.E_empnoEnter(Sender: TObject);
var  i : integer;
begin
  P_Korname.Caption   := '';
  P_juminid.Caption   := '';
  E_telno.Text        := '';
  P_paycl.Caption     := '';
  P_payclNAME.Caption := '';
  P_owstcnt.Caption   := '';
  NE_owstcnt.Value    := 0;
  P_depositno.Caption := '';
  P_orgnum.Caption    := '';
  P_deptcode.Caption  := '';
  P_deptname.Caption  := '';
  DataAllClear;
  for i := 1 to SGrid1.RowCount do
       SGrid1.Rows[i].Clear;
  SGrid1.RowCount     := 2;
  Query_psowhis.Close;
  Query_psdphis.Close;
end;
procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then System.Exit;
  Key := #0;

  DataAllClear;
  Query_psowhis.Close;
  Query_psdphis.Close;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD(' SELECT EMPNO, KORNAME        ');
  Query_Gen.SQL.ADD('   FROM PIMPMAS               ');
  Query_Gen.SQL.ADD('  WHERE EMPNO LIKE :empno     ');
  Query_Gen.SQL.ADD('     OR KORNAME LIKE :empno   ');
  Query_Gen.ParamByName('empno').AsString := E_Empno.Text + '%';
  Query_Gen.Open;
  If Query_Gen.RecordCount < 1 then
  begin
     Application.MessageBox('해당사원이 존재하지 않습니다.','조회조건입력오류',MB_OK+MB_ICONWARNING);
     Query_Gen.Close;
     System.Exit;
  end
  else If Query_Gen.RecordCount = 1 then
  begin
     E_Empno.Text      := Query_Gen.FieldByName('empno').AsString;
     P_KorName.Caption := Query_Gen.FieldByName('KorName').AsString;
  end
  else If Query_Gen.RecordCount > 1 then
  begin

       Try
       EmpForm           := TEmpForm.Create(Self);
       EmpForm.InValue   := E_EmpNo.Text;
       EmpForm.ShowModal;
       if EmpForm.OutEmpNo <> '' then
          begin
          E_EmpNo.Text      := EmpForm.OutEmpNo;
          P_KorName.Caption := EmpForm.OutKorName;
          end;
       Finally
       EmpForm.Free;
       end;

  end;

  GetInsa;     // 기본인사사항

  sqlstr := 'select empno, korname, owstcnt, telno, depositno,' + #13 +
            '       inmarkname,instrname,inaccnum,inname      ' + #13 +
            '  from psstmas                                   ' + #13 +
     format(' where empno = ''%s''                            ',[e_empno.text]);

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.Sql.Add(sqlstr);
  Query_Gen.Open;

  {
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT KORNAME, OWSTCNT, TELNO, DEPOSITNO ');
  Query_Gen.SQL.Add('FROM   PSSTMAS                            ');
  Query_Gen.SQL.Add('WHERE (EMPNO = '''+E_empno.Text+''')      ');
  Query_Gen.Open;
  }
   edit1.text := sqlstr;
  //E_empno.text        := Query_Gen.FieldByName('empno').AsString;   // 사번
  P_Korname.Caption   := Query_Gen.FieldByName('KORNAME').AsString;   // 성명
  //P_owstcnt.Caption   := Format('%7.0n',[Query_Gen.FieldByName('OWSTCNT').AsFloat]);  // 보유주수
  NE_owstcnt.Value    := Query_Gen.FieldByName('OWSTCNT').AsFloat;    // 화면에 안 나타남
  P_depositno.Caption := Query_Gen.FieldByName('DEPOSITNO').AsString; // 예탁번호
  E_telno.Text        := Query_Gen.FieldByName('TELNO').AsString;     // 연락처

  E_inmarkname.Text   := Query_Gen.FieldByName('inmarkname').AsString;     // 증권사코드
  P_inmarkname.Caption:= PyccodeA('K930',E_inmarkname.Text);     // 증권사명
  E_instrname.Text    := Query_Gen.FieldByName('instrname').AsString;     // 지점명
  E_inaccnum.Text     := Query_Gen.FieldByName('inaccnum').AsString;     // 계좌번호
  E_inname.Text       := Query_Gen.FieldByName('inname').AsString;     // 계좌명

  Query_Gen.Close;
  Application.ProcessMessages;

  GetPsdphis; // 예탁현황

 {
  Query_psdphis_sum.Close;
  Query_psdphis_sum.SQL.Clear;
  Query_psdphis_sum.SQL.Add('SELECT  SUM(REMCNT) TOT_REMCNT  ');
  Query_psdphis_sum.SQL.Add('FROM PSDPHIS                    ');
  Query_psdphis_sum.SQL.Add('WHERE (EMPNO = :P_empno)        ');
  Query_psdphis_sum.SQL.Add('GROUP BY EMPNO                  ');

  Query_psdphis_sum.ParamByName('P_empno').AsString := E_empno.Text;
  Query_psdphis_sum.Open;   // 예탁이력

  P_owstcnt.Caption :=  Query_psdphis_sum.FieldByName('TOT_REMCNT').AsString;
  }
  RetrieveData;

  ME_subdate.ReadOnly   := true;
  E_divseqnum.ReadOnly  := true;
  SB_subdate.Enabled    := false;

  DBGrid1.SetFocus;
end;

procedure TMainForm.ME_subdateEnter(Sender: TObject);
begin
//  DataAllClear;
  Phelpmsg.Caption := ' 신규자료 입력후 저장하세요.';
  Application.ProcessMessages;
end;

procedure TMainForm.E_inmarknameChange(Sender: TObject);
begin
     P_inmarkname.Caption := PyccodeA('K930',E_inmarkname.Text);
end;

procedure TMainForm.SB_inmarknameClick(Sender: TObject);
begin
  Fkycode1 := TFkycode1.Create(Self);
  Try
    Fkycode1.FormData := '증권사코드조회';
    Fkycode1.DataVal1 := 'K930';
    Fkycode1.ShowModal;
    if Fkycode1.CloseChk = -1 then Exit;
      E_inmarkname.Text := Fkycode1.code;
      P_inmarkname.Caption := Fkycode1.codename;
  Finally
    Fkycode1.Free;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료 하시겠습니까?','[확인]',MB_YesNo+MB_ICONQUESTION) then
        begin
        sqlstr := 'delete from pswddis            ' + #13 +
                  ' where (empno, subdate) in     ' + #13 +
                  '       (select empno, subdate  ' + #13 +
                  '        from   pswddis         ' + #13 +
           format('        where  empno = ''%s''  ',[E_empno.text]) + #13 +
                  '        group by empno, subdate' + #13 +
                  '        minus                  ' + #13 +
                  '        select empno, subdate  ' + #13 +
                  '        from   psowhis         ' + #13 +
           format('        where  empno = ''%s'') ',[E_empno.text]);

        Query_Gen.Close;
        Query_Gen.Sql.Clear;
        Query_Gen.sql.add(sqlstr);
        Query_Gen.ExecSql;
        Action := caFree;
        end
     else
        Action := caNone;
end;

{
//30.03  2004.05.31      이민용      전2004-5808        우리사주 인출을 차수별로 선택가능하게 보완
//우리사주 인출이력(psowhis)테이블에 선택한 차수를 sdivseqnum 필드에 넣어준다.
procedure TMainForm.DS_psdphisDataChange(Sender: TObject; Field: TField);
begin
  sqlstr := 'select sdivseqnum from psdphis  ' + #13 +
     format('                 where empno = ''%s''',[E_empno.text]) + #13 +
     format('                   and sdivseqnum = ''%s''', [Query_psdphis.FieldByName('sdivseqnum').AsString]);

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.sql.add(sqlstr);
  //ShowMessage(sqlstr);
  Query_Gen.Open;
end;
}
procedure TMainForm.FormShow(Sender: TObject);
begin
  with sGrid1 do       //예탁현황  shm
  begin
     Cells[1,0] := '차수';
     Cells[2,0] := '예탁주수';
     Cells[3,0] := '잔여주수';
     Cells[4,0] := '구분';
     Cells[5,0] := '선택';
  end;
end;

procedure TMainForm.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  oldalign : word;
begin
  if (ACol = 5) and (ARow > 0) then
  begin
    if sGrid1.Cells[ACol,ARow] <> '' then  //Check Box
       with sGrid1 do DrawCheck(Canvas,Rect, Color,1, Cells[ACol, ARow]);
  end
  else
  begin
    oldalign:=settextalign(sGrid1.canvas.handle,ta_right);
    sGrid1.canvas.textrect(rect,rect.right-2,rect.top+2, sGrid1.cells[Acol,Arow]);
    settextalign(sGrid1.canvas.handle,oldalign);
  end;
end;

procedure TMainForm.sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft Then
  begin
    //showmessage(sGrid1.Cells[ACol,ARow]);
    sGrid1.MouseToCell(X, Y, ACol, ARow);
  end;
end;

procedure TMainForm.sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var iCol,iRow, i: Integer;
    SqlText       : string;
begin
     if (Job_mode = 1) and (E_divseqnum.Text = '') then
          if Button = mbLeft then
          begin
            with sGrid1 do
            begin
              MouseToCell(X, Y, iCol, iRow);
              if iRow = 0 then
                exit;

              if (ACol = 5) and (ARow > 0) and (ACol = iCol) and (ARow = iRow) and (sGrid1.Cells[ACol,ARow] <> '') then
                Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
            end;
          end;
end;


procedure TMainForm.DrawCheck(ACanvas: TCanvas; ARect: TRect; AColor: TColor; EditStyle: word; Flag: string);
var iDR:integer;
begin
  if Trim(Flag) = '' then Exit;
  with ACanvas do
  begin
    case EditStyle of
      1: begin //esCheckBox
        case Flag[1] of
          '1': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
          '2': iDR:= DFCS_BUTTONCHECK or DFCS_CHECKED;
          '3': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE;
          '4': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE or DFCS_CHECKED;
          else iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
        end;
      end;
      2: begin //esRadioButton
        case Flag[1] of
          '1': iDR:= DFCS_BUTTONRADIO;
          '2': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED;
          '3': iDR:= DFCS_BUTTONRADIO or DFCS_INACTIVE;
          '4': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED or DFCS_INACTIVE;
          else iDR:= DFCS_BUTTONRADIO;
        end;
      end;
      else Exit;
    end;
    ACanvas.Brush.Color:= AColor;
    ACanvas.FillRect(ARect);
    InflateRect(ARect,-((ARect.Right  - ARect.Left -14) shr 1),-((ARect.Bottom - ARect.Top  -14) shr 1)); //DFCS_MONO
    DrawFrameControl(Handle, ARect, DFC_BUTTON, iDR);
  end;
end;


procedure TMainForm.psdphis_view;
var
  SqlText       : string;
  i, J : integer;
  sJOBDUTY : string;
begin
  if Query_psdphis.RecordCount > 0 then
  begin
    iChkSenioryn := -1;
    sGrid1.RowCount := Query_psdphis.RecordCount+3;   //3

    Query_psdphis.First;
    J := 1;
    for i := 1 to Query_psdphis.RecordCount do
    begin
      sGrid1.Rows[j].Clear;
      if (Query_psdphis.FieldByName('DIVSEQNUM').AsString = '4')  or
         (Query_psdphis.FieldByName('DIVSEQNUM').AsString = '5')  then
      begin
        sGrid1.Cells[1,j] :=  Query_psdphis.FieldByName('DIVSEQNUM').AsString;
        sGrid1.Cells[2,j] :=  Query_psdphis.FieldByName('TAXCNT').AsString;
        sGrid1.Cells[3,j] :=  IntToStr(Query_psdphis.FieldByName('TAXCNT').AsInteger
                           -  Query_psdphis.FieldByName('TAXWRCNT').AsInteger);
        sGrid1.Cells[4,j] :=  '과세';
        if (Query_psdphis.FieldByName('Choice1').AsString   = 'Y') then
          sGrid1.Cells[5,j] :=  '2'
        else
          sGrid1.Cells[5,j] :=  '1';
        sGrid1.Cells[6,j] :=  Query_psdphis.FieldByName('STCLASS').AsString;

        inc(j);
        sGrid1.Rows[j].Clear;
        sGrid1.Cells[1,j] :=  Query_psdphis.FieldByName('DIVSEQNUM').AsString;
        sGrid1.Cells[2,j] :=  Query_psdphis.FieldByName('BTAXCNT').AsString;           //비과세 예탁   shm
        sGrid1.Cells[3,j] :=  IntToStr(Query_psdphis.FieldByName('BTAXCNT').AsInteger  //비과세 예탁  -
                           -  Query_psdphis.FieldByName('BTAXWRCNT').AsInteger);       //비과세 인출  = 잔여주수
        sGrid1.Cells[4,j] :=  '비과세';
        if (Query_psdphis.FieldByName('Choice2').AsString  = 'Y') then
          sGrid1.Cells[5,j] :=  '2'
        else
          sGrid1.Cells[5,j] :=  '1';

        sGrid1.Cells[6,j] :=  Query_psdphis.FieldByName('STCLASS').AsString;

        inc(j);
        sGrid1.Rows[j].Clear;
      end
      else if (Query_psdphis.FieldByName('DIVSEQNUM').AsString = '2') then
      begin
        sGrid1.Cells[1,j] :=  Query_psdphis.FieldByName('DIVSEQNUM').AsString;
        sGrid1.Cells[2,j] :=  Query_psdphis.FieldByName('DPSTCNT').AsString;
        sGrid1.Cells[3,j] :=  Query_psdphis.FieldByName('REMCNT').AsString;
        sGrid1.Cells[4,j] :=  Query_psdphis.FieldByName('STCLASS').AsString;
        if (Query_psdphis.FieldByName('Choice1').AsString  = 'Y')     then
          sGrid1.Cells[5,j] :=  '2'
        else
          sGrid1.Cells[5,j] :=  '1';

        sGrid1.Cells[6,j] :=  Query_psdphis.FieldByName('STCLASS').AsString;

        inc(j);
        sGrid1.Rows[j].Clear;
      end
      else
      begin
        sGrid1.Cells[1,j] :=  Query_psdphis.FieldByName('DIVSEQNUM').AsString;
        sGrid1.Cells[2,j] :=  Query_psdphis.FieldByName('DPSTCNT').AsString;
        sGrid1.Cells[3,j] :=  Query_psdphis.FieldByName('REMCNT').AsString;
        sGrid1.Cells[4,j] :=  '';
        if (Query_psdphis.FieldByName('CHoice1').AsString   ='Y')     then
          sGrid1.Cells[5,j] :=  '2'
        else
          sGrid1.Cells[5,j] :=  '1';
        sGrid1.Cells[6,j] :=  Query_psdphis.FieldByName('STCLASS').AsString;

        inc(j);
        sGrid1.Rows[j].Clear;
      end;

      Query_psdphis.next;
    end;
    for i := 1 to  sGrid1.RowCount do
      if sGrid1.Cells[1,i] = '' then
         sGrid1.Cells[5,i] :=  '';
  end;
end;

procedure TMainForm.BB_reqClick(Sender: TObject);
begin

  if (Job_mode = 2) and (Query_psowhisWDYN.AsString = 'Y') then
    begin
      MessageBox(handle, '이미 인출처리된 신청자료는 수정할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

    P_App.Visible   := true;
    ME_appdate.text := ME_wdidate.Text;
end;

procedure TMainForm.C_taxClick(Sender: TObject);
var
  i : integer;
begin
    if C_tax.Checked then
    begin
       C_btax.Checked := false;
       taxGubun       := C_tax.Caption;
       TaxGubun_Check;
    end;
end;

procedure TMainForm.C_btaxClick(Sender: TObject);
var
  i : integer;
begin
    if C_btax.Checked then
    begin
       C_tax.Checked  := false;
       taxGubun       := C_btax.Caption;
       TaxGubun_Check;
    end;
end;

procedure TMainForm.TaxGubun_Check;
var
  i : integer;   aa:string;
  info : Pchar;
begin
  for i := 1 to sGrid1.RowCount - 1 do
  begin
      aa := sGrid1.Cells[4,i] ;
     if (sGrid1.Cells[1,i] <> '') and (E_divseqnum.Text = sGrid1.Cells[1,i]) and (trim(taxGubun) = sGrid1.Cells[4,i])  then
     begin
        if (Job_mode = 1) and (strtoint(sGrid1.Cells[3,i]) = 0) then
        begin
            MessageDlg(sGrid1.Cells[1,i]+'차 '+taxGubun+' 잔여주수가 '+sGrid1.Cells[3,i]+'입니다.',
                       mtInformation,[mbOk], 0);
            C_tax.Checked  := false;
            C_btax.Checked := false;
            taxGubun       := ' ';
            System.Exit;
        end;
        sGrid1.Cells[5,i] := '2';
     end
     else if sGrid1.Cells[1,i] = '' then
        sGrid1.Cells[5,i] := ''
     else
        sGrid1.Cells[5,i] := '1';
  end;
  Sdivseqnum_Select;
end;

procedure TMainForm.E_divseqnumChange(Sender: TObject);
begin
  if (E_divseqnum.Text > '3') And (E_divseqnum.Text < '6') then
  begin
      C_tax.Caption  := '과세';
      C_btax.Caption := '비과세';
      P_Tax.Visible  := true;
  end
  else if E_divseqnum.Text = '2' then
  begin
      C_tax.Caption  := '신주';
      C_btax.Caption := '구주';
      P_Tax.Visible  := true;
  end
  else
  begin
      C_tax.Checked  := false;
      C_btax.Checked := false;
      taxGubun       := ' ';
      TaxGubun_Check;
      P_Tax.Visible  := false;
  end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  P_App.Visible := false;
end;

procedure TMainForm.psdphis_Save;
var i : integer;
    sqltext : string;
    sChkYN, C_CHOICE1, C_CHOICE2 : string;
begin
  with sGrid1 do
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('DELETE FROM PSOWCHK                           ');
    Query_Gen.SQL.Add('WHERE (EMPNO     = '''+E_empno.Text+     ''') ');
    Query_Gen.SQL.Add('  and (SUBDATE   = '''+ME_subdate.Text+  ''') ');
    Query_Gen.ExecSQL;

    C_CHOICE1 := ''; C_CHOICE2 := '';

    for i := 1 to RowCount - 1 do
    begin
       if sGrid1.Cells[1,i] <> ''  then
          if (sGrid1.Cells[1,i] = '4') or (sGrid1.Cells[1,i] = '5') then
          begin
            if sGrid1.Cells[4,i] = '과세' then
              C_CHOICE1 := sGrid1.Cells[5,i];

            if sGrid1.Cells[4,i] = '비과세' then
            begin
              C_CHOICE2 := sGrid1.Cells[5,i];

              Query_Gen.Close;
              Query_Gen.SQL.Clear;
              Query_Gen.SQL.Add('INSERT INTO PSOWCHK (EMPNO, SUBDATE, DIVSEQNUM, STCLASS, CHOICE1, CHOICE2, WRITETIME, WRITEMAN) ');
              Query_Gen.SQL.Add('            values  (:EMPNO, :SUBDATE, :DIVSEQNUM, :STCLASS, :CHOICE1, :CHOICE2, to_char(sysdate,''yyyymmddhh24missd''), '''+Pempno+''') ');

              Query_Gen.ParamByName('EMPNO').AsString      :=  E_empno.Text;
              Query_Gen.ParamByName('SUBDATE').AsString    :=  ME_subdate.Text;
              Query_Gen.ParamByName('DIVSEQNUM').AsString  :=  sGrid1.Cells[1,i];
              Query_Gen.ParamByName('STCLASS').AsString    :=  sGrid1.Cells[6,i];
              if C_CHOICE1 = '2' then
                Query_Gen.ParamByName('CHOICE1').AsString   :=  'Y'
              else
                Query_Gen.ParamByName('CHOICE1').AsString   :=  'N';
              if C_CHOICE2 = '2' then
                Query_Gen.ParamByName('CHOICE2').AsString   :=  'Y'
              else
                Query_Gen.ParamByName('CHOICE2').AsString   :=  'N';
              Query_Gen.ExecSQL;
            end;  //if sGrid1.Cells[4,i] = '비과세' then
          end
          else
          begin
            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.Add('INSERT INTO PSOWCHK (EMPNO, SUBDATE, DIVSEQNUM, STCLASS, CHOICE1, CHOICE2, WRITETIME, WRITEMAN) ');
            Query_Gen.SQL.Add('            values  (:EMPNO, :SUBDATE, :DIVSEQNUM, :STCLASS, :CHOICE1, :CHOICE2, to_char(sysdate,''yyyymmddhh24missd''), '''+Pempno+''') ');

            Query_Gen.ParamByName('EMPNO').AsString      :=  E_empno.Text;
            Query_Gen.ParamByName('SUBDATE').AsString    :=  ME_subdate.Text;
            Query_Gen.ParamByName('DIVSEQNUM').AsString  :=  sGrid1.Cells[1,i];
            Query_Gen.ParamByName('STCLASS').AsString    :=  sGrid1.Cells[6,i];

            if sGrid1.Cells[5,i] = '2' then
              Query_Gen.ParamByName('CHOICE1').AsString   :=  'Y'
            else
              Query_Gen.ParamByName('CHOICE1').AsString   :=  'N';
            Query_Gen.ParamByName('CHOICE2').AsString     :=  'N';
            Query_Gen.ExecSQL;
          end; //if sGrid1.Cells[1,i] = '4' then

    end;  //for i := 1 to RowCount -1 do
  end;    //with  sGrid1 do
  with Query1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select a.EMPNO,     a.SUBDATE,  a.SDIVSEQNUM,     ');
       SQL.Add('       a.DIVSEQNUM, a.TAXGUBUN, b.STCLASS         ');
       SQL.Add('  FROM psowhis a,   PSDPHIS b                     ');
       SQL.Add(' WHERE (a.EMPNO      = '''+E_empno.Text+     ''') ');
       SQL.Add('   and (a.SUBDATE    = '''+ME_subdate.Text+  ''') ');
       SQL.Add('   and (a.empno      = b.empno                  ) ');
       SQL.Add('   and (a.sdivseqnum = b.sdivseqnum             ) ');
       Open;

       if Query1.recordcount > 0 then
       begin
            Query1.First;
            for i := 1 to Query1.recordcount do
            begin
                 Query_Gen.Close;
                 Query_Gen.SQL.Clear;
                 Query_Gen.SQL.Add('Update PSOWCHK                  ');
                 if (Query1.fieldbyName('DIVSEQNUM').AsString = '4') or
                    (Query1.fieldbyName('DIVSEQNUM').AsString = '5') then
                 begin
                      if Query1.fieldbyName('TAXGUBUN').AsString = '과세' then
                          Query_Gen.SQL.Add('   set CHOICE1    = :CHOICE1    ')
                      else
                          Query_Gen.SQL.Add('   set CHOICE2    = :CHOICE2    ');
                 end
                 else
                 begin
                      Query_Gen.SQL.Add('   set CHOICE1    = :CHOICE1,   ');
                      Query_Gen.SQL.Add('       CHOICE2    = :CHOICE2    ');
                 end;
                 Query_Gen.SQL.Add(' WHERE (EMPNO     = :EMPNO    ) ');
                 Query_Gen.SQL.Add('   and (SUBDATE   = :SUBDATE  ) ');
                 Query_Gen.SQL.Add('   and (DIVSEQNUM = :DIVSEQNUM) ');
                 Query_Gen.SQL.Add('   and (STCLASS   = :STCLASS  ) ');

                 Query_Gen.ParamByName('EMPNO').AsString     := Query1.fieldbyName('EMPNO').AsString;
                 Query_Gen.ParamByName('SUBDATE').AsString   := Query1.fieldbyName('SUBDATE').AsString;
                 Query_Gen.ParamByName('DIVSEQNUM').AsString := Query1.fieldbyName('DIVSEQNUM').AsString;
                 Query_Gen.ParamByName('STCLASS').AsString   := Query1.fieldbyName('STCLASS').AsString;

                 if (Query1.fieldbyName('DIVSEQNUM').AsString = '4') or
                    (Query1.fieldbyName('DIVSEQNUM').AsString = '5') then
                 begin
                      if Query1.fieldbyName('TAXGUBUN').AsString = '과세' then
                      begin
                           Query_Gen.ParamByName('CHOICE1').AsString := 'Y';
                      end
                      else
                      begin
                           Query_Gen.ParamByName('CHOICE2').AsString := 'Y';
                      end;
                 end
                 else
                 begin
                      Query_Gen.ParamByName('CHOICE1').AsString := 'Y';
                      Query_Gen.ParamByName('CHOICE2').AsString := 'N';
                 end;

                 Query_Gen.ExecSQL;
                 Query1.next;
            end;
       end;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
   save_remcnt : real;
   save_cnt    : integer;
begin
  Phelpmsg.Caption := '';
  if Application.MessageBox('인출작업이 끝나면 다시 수정할 수 없습니다.현재자료를 인출하시겠습니까?','작업안내',mb_yesno) = id_no then
     system.exit;

  with  Query_Code do
  begin
       Close;
       SQL.Clear;
       SQL.Add(' Select APPDATE, APPAMT, REQDATE, WRDATE from PSWDBAS    ');
       SQL.Add('  Where AppDate = '''+ME_AppDate.Text+'''                ');
       Open;
       edit1.text := Sql.Text;
       if  Query_Code.RecordCount <=0 then
       begin
           MessageDlg('우리사주 인출금액 산정관리에서 먼저 인출적용일자를 입력하신 후 인출작업을 하십시오.',
                       mtInformation,[mbOk], 0);
           exit;
       end;
  end;

  save_Remcnt := 0;
  with  Query_Gen do
  begin
       Close;
       SQL.Clear;
       SQL.Add(' Select Remcnt  From psdphis                                   ');
       SQL.Add(' WHERE (EMPNO      = '''+Query_psowhisEMPNO.AsString     +''') ');
       SQL.Add('   and (SDIVSEQNUM = '''+Query_psowhisSDIVSEQNUM.AsString+''') ');
       Open;
       if  Query_Gen.RecordCount <=0 then
       begin
           MessageDlg('현차수의 보유주수가 없습니다. 확인하고 작업하시기 바랍니다.',
                       mtInformation,[mbOk], 0);
           exit;
       end;
       Save_Remcnt := Query_Gen.Fieldbyname('REMCNT').AsFloat;
  end;

  with  Query_Gen  do
  begin
       Close;
       SQL.Clear;
       SQL.Add(' UPDATE psdphis     a                                                  ');
       SQL.Add('    set wrcnt       = wrcnt     +  '+FloattoStr(NE_Substcnt.Value)+',  ');
       SQL.Add('        remcnt      = remcnt    -  '+FloattoStr(NE_Substcnt.Value)+',  ');
       if      taxgubun = '과세'    then
          SQL.Add('     taxwrcnt    = taxwrcnt  +  '+FloattoStr(NE_Substcnt.Value)+',  ')         //과세일 경우
       else if taxgubun = '비과세'  then
          SQL.Add('     btaxwrcnt   = btaxwrcnt +  '+FloattoStr(NE_Substcnt.Value)+',  ');        //비과세일 경우
       SQL.Add('        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),          ');
       SQL.Add('        WRITEMAN    = '''+Pempno+'''                                   ');
       SQL.Add(' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''')        ');
       SQL.Add('   and (SDIVSEQNUM  = '''+Query_psowhisSDIVSEQNUM.AsString+''')         ');
       if (Query_psowhisTAXGUBUN.AsString = '신주') or (Query_psowhisTAXGUBUN.AsString = '구주') then
       SQL.Add('   and (StClass     = '''+Query_psowhisTAXGUBUN.AsString+''')          ');
       edit1.text := Sql.Text;
       ExecSQL;
  end;

  with  Query_Gen  do
  begin
       SQL.Clear;
       SQL.Add(' UPDATE PSOWHIS  a                                                          ');
       SQL.Add('    SET TELNO       = '''+E_telno.Text+''',                                 ');
       SQL.Add('        WDIDATE     = '''+ME_wdidate.Text+''',                              ');
       SQL.Add('        OBJADDR     = '''+E_objaddr.Text+''',                               ');
       SQL.Add('        REQYN       = ''Y'',  WDYN  = ''Y'',                                ');
       SQL.Add('        REQDATE     = '''+Query_Code.FieldbyName('REQDATE').AsString+''',   ');
       SQL.Add('        REQYNDATE   = '''+Query_Code.FieldbyName('REQDATE').AsString+''',   ');
       SQL.Add('        WDYNDATE    = '''+Query_Code.FieldbyName('WRDATE').AsString+''',    ');
       SQL.Add('        WDDATE      = '''+Query_Code.FieldbyName('WRDATE').AsString+''',    ');
       SQL.Add('        APPDATE     = '''+Query_Code.FieldbyName('APPDATE').AsString+''',   ');
       SQL.Add('        APPAMT      = '+Query_Code.FieldbyName('AppAMT').AsString+',        ');
       SQL.Add('        WDSTCNT     = '+FloattoStr(NE_Substcnt.Value)+',                    ');
       SQL.Add('        WDAMT       = '+FloattoStr(NE_Substcnt.Value)+'*'+Query_Code.FieldbyName('AppAMT').AsString+',');
       SQL.Add('        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),               ');
       SQL.Add('        WRITEMAN    = '''+Pempno+'''                                        ');
       SQL.Add(' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''')             ');
       SQL.Add('   and (SUBDATE     = '''+Query_psowhisSUBDATE.AsString   +''')             ');
       SQL.Add('   and (SDIVSEQNUM  = '''+Query_psowhisSDIVSEQNUM.AsString+''')             ');
       if Query_psowhisTAXGUBUN.AsString <> ' ' then
       SQL.Add('   and (TAXGUBUN    = '''+Query_psowhisTAXGUBUN.AsString  +''')             ');
       edit1.text := Sql.Text;
       ExecSQL;
  end;

  with  Query_Gen  do
  begin
       SQL.Clear;
       SQL.Add(' UPDATE PSSTMAS  a                                                          ');
       SQL.Add('    SET OWSTCNT     = (Select sum(REMCNT)                                   ');
       SQL.Add('                         from PSDPHIS                                       ');
       SQL.Add(' 	                where EMPNO   = a.EMPNO ),                          ');
       SQL.Add('        STCNT1      = (select sum(REMCNT)                                   ');
       SQL.Add('                         from PSDPHIS                                       ');
       SQL.Add(' 	                where STCLASS = ''신주''                            ');
       SQL.Add('                          and EMPNO   = a.EMPNO ),                          ');
       SQL.Add('        STCNT2      = (select sum(REMCNT)                                   ');
       SQL.Add('                         from PSDPHIS                                       ');
       SQL.Add(' 	                where STCLASS = ''구주''                            ');
       SQL.Add('                          and EMPNO   = a.EMPNO ),                          ');
       SQL.Add('        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),               ');
       SQL.Add('        WRITEMAN    = '''+Pempno+'''                                        ');
       SQL.Add(' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''')             ');
       edit1.text := Sql.Text;
       ExecSQL;
  end;
  Save_Cnt := 0;
  with  Query_Gen do
  begin
       Close;
       SQL.Clear;
       SQL.Add(' Select count(*) cnt From psdohis                                 ');
       SQL.Add(' WHERE (EMPNO      = '''+Query_psowhisEMPNO.AsString     +''') ');
       SQL.Add('   and (DIVSEQNUM  = '''+Query_psowhisSDIVSEQNUM.AsString+''') ');
       Open;
       Save_Cnt := Query_Gen.Fieldbyname('CNT').AsInteger;
  end;
  if  Save_Cnt = 0   then
  begin
       with  Query_Gen  do
       begin
           Close;
           SQL.Clear;
           SQL.ADD('INSERT INTO PSDOHIS                                                                  '); //예탁별 인출이력
           SQL.ADD('           (DIVSEQNUM, DEPOSITNO, EMPNO,                                             ');
           SQL.ADD('            KORNAME,   SUBDATE,   REQDATE,                                           ');
           SQL.ADD('            WDISSUE,   WDSTCNT,   WDAMT,                                             ');
           SQL.ADD('            REMCNT,    REMCNT1,   REMCNT2,                                           ');
           SQL.ADD('            WDSTCNT1,  WDSTCNT2,  WDSTAMT1,                                          ');
           SQL.ADD('            WRITETIME, WRITEMAN)                                                     ');
           SQL.ADD('     VALUES ('+Query_psowhisSDIVSEQNUM.AsString+',                                   ');
           SQL.ADD('             '''+Query_psowhisDEPOSITNO.AsString+''',                                ');
           SQL.ADD('             '''+Query_psowhisEMPNO.AsString+''',                                    ');
           SQL.ADD('             '''+Query_psowhisKORNAME.AsString+''',                                  ');
           SQL.ADD('             '''+Query_psowhisSUBDATE.AsString+''',                                  '); //신청일자
           SQL.ADD('             '''+Query_psowhisREQDATE.AsString+''',                                  ');
           SQL.ADD('             '''+Query_psowhisWDISSUE.AsString+''',                                  ');
           SQL.ADD('             '+FloattoStr(NE_Substcnt.Value)+',                                      ');
           SQL.ADD('             '+FloatToStr(Trunc(NE_Substcnt.Value*Query_Code.FieldbyName('AppAMT').AsFloat/1000) * 1000)+', '); //인출금액, 1000원이하 버림
           SQL.ADD('             '+FloatToStr(Save_REMCNT)+',                                            ');
           if (Query_psowhisDIVSEQNUM.AsString = '4') or (Query_psowhisDIVSEQNUM.AsString = '5') then
           begin
             if  Query_psowhisTAXGUBUN.AsString = '과세' then
             begin
                SQL.ADD('        (select Taxcnt - taxwrcnt   from PSDPHIS                                ');
                SQL.ADD('          where sdivseqnum = '+Query_psowhisSDIVSEQNUM.AsString+'               ');
                SQL.ADD('            and empno      = '''+Query_psowhisEMPNO.AsString     +'''),         ');
                SQL.ADD('        ''0'', '+FloattoStr(NE_Substcnt.Value)+', ''0'',                        ');
                SQL.ADD('        '+FloatToStr(NE_Substcnt.Value*Query_Code.FieldbyName('AppAMT').AsFloat)+', ');
             end
             else
             begin
                SQL.ADD('        ''0'',(select bTaxcnt - btaxwrcnt from PSDPHIS                          ');
                SQL.ADD('             where sdivseqnum = '+Query_psowhisSDIVSEQNUM.AsString+'            ');
                SQL.ADD('               and empno      = '''+Query_psowhisEMPNO.AsString     +'''),      ');
                SQL.ADD('        ''0'', '+FloattoStr(NE_Substcnt.Value)+', ''0'',                        ');
             end;
           end
           else
                SQL.ADD('        ''0'', ''0'', ''0'', ''0'', ''0'',                                      ');
           SQL.ADD('             to_char(sysdate,''yyyymmddhh24missd''),                                 ');
           SQL.ADD('             '''+Pempno+''')                                                         ');

           ExecSQL;
       end;
  end
  else
  begin
       with  Query_Gen  do
       begin
            SQL.Clear;
            SQL.Add(' UPDATE PSDOHIS  a                                                          ');
            SQL.Add('    SET WDSTCNT     = WDSTCNT + '+FloattoStr(NE_Substcnt.Value)+',          ');
            SQL.Add('        WDAMT       = Trunc((WDSTCNT + '+FloattoStr(NE_Substcnt.Value)+')*'+Query_Code.FieldbyName('AppAMT').AsString+'/1000)*1000,');
            if (Query_psowhisDIVSEQNUM.AsString = '4') or (Query_psowhisDIVSEQNUM.AsString = '5') then
            begin
              if  Query_psowhisTAXGUBUN.AsString = '과세' then
              begin
                 SQL.Add('   WDSTCNT1    = WDSTCNT1+ '+FloattoStr(NE_Substcnt.Value)+',          ');
                 SQL.Add('   WDSTAMT1    = (WDSTCNT1+'+FloattoStr(NE_Substcnt.Value)+')*'+Query_Code.FieldbyName('AppAMT').AsString+',');
              end
              else
              begin
                 SQL.Add('   WDSTCNT2    = WDSTCNT2+ '+FloattoStr(NE_Substcnt.Value)+',          ');
              end;
            end;
            SQL.Add('        WRITETIME   = to_char(sysdate,''yyyymmddhh24missd''),               ');
            SQL.Add('        WRITEMAN    = '''+Pempno+'''                                        ');
            SQL.Add(' WHERE (EMPNO       = '''+Query_psowhisEMPNO.AsString     +''')             ');
            SQL.Add('   and (SUBDATE     = '''+Query_psowhisSUBDATE.AsString   +''')             ');
            SQL.Add('   and (DIVSEQNUM   = '''+Query_psowhisSDIVSEQNUM.AsString+''')             ');
            edit1.text := Sql.Text;
            ExecSQL;
       end;
  end;
  P_App.Visible := false;
  RetrieveData;

end;

procedure TMainForm.ME_AppdateChange(Sender: TObject);
begin
  if Length(ME_subdate.Text) = 8 then
  begin
    if DateCheck(Copy(ME_Appdate.Text,1,4),Copy(ME_Appdate.Text,5,2),
                 Copy(ME_Appdate.Text,7,2)) = -1 then
    begin
      MessageBox(Handle, '인출기준일자을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
      exit;
    end;
  end;
end;

procedure TMainForm.SB_reqdateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_Appdate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

end.

