{-------------------------------------------------------------------------------
 PROGRAM-NAME   : psc3060a.exe(우리사주 대부/상환 관리)
 SYSTEM-NAME    : 종합인사정보
 SUBSYSTEM-NAME : 복리후생(우리사주/대부 및 상환)
 Programmer     : 김 영대
 Version        : 1.00
 Date           : 1997.10.31
 Update Contents
   1.00    97.10.31       김영대     신규프로그램개발       상세처리명세서
-------------------------------------------------------------------------------}
unit psc30601;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Mask, StdCtrls, numedit, Gauges,
  Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls,
  hcodelib, Calen1, pass, Datelib, Kycode1, Kylib1, UserHelp, Func;

type
  TMainForm = class(TForm)
    Query_Gen: TQuery;
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel8: TPanel;
    Panel3: TPanel;
    BB_save: TBitBtn;
    BB_close: TBitBtn;
    BB_cancel: TBitBtn;
    BB_delete: TBitBtn;
    Query_update: TQuery;
    BB_help: TBitBtn;
    SB_empno: TSpeedButton;
    E_empno: TEdit;
    P_korname: TPanel;
    CB_exyn: TComboBox;
    Panel6: TPanel;
    Panel1: TPanel;
    Label20: TLabel;
    SB_exmdate: TSpeedButton;
    NE_excpamt1: TNumberEdit;
    Panel10: TPanel;
    Panel17: TPanel;
    ME_exmdate: TMaskEdit;
    Panel4: TPanel;
    P_payclNAME: TPanel;
    Panel7: TPanel;
    P_deptcodeNAME: TPanel;
    P_paycl: TPanel;
    P_deptcode: TPanel;
    DBG_pslmas: TDBGrid;
    Panel5: TPanel;
    B_Save: TButton;
    B_Cancel: TButton;
    P_stisumTOT: TPanel;
    P_stirisumTOT: TPanel;
    P_stiramtTOT: TPanel;
    P_stlamtTOT: TPanel;
    Panel2: TPanel;

    Query_psemhis: TQuery;
    DS_psemhis: TDataSource;
    DBG_psemhis: TDBGrid;
    Query_psemhisEXDATE: TStringField;
    Query_psemhisEXIAMT: TFloatField;
    Query_psemhisEXICNT: TFloatField;
    Query_psemhisEXSPYN: TStringField;
    Query_psemhisEXSPINT1: TFloatField;
    Query_psemhisEXSPINT2: TFloatField;
    Query_psemhisEXCPCSNAME: TStringField;
    Query_psemhisEXCPCS: TStringField;
    Query_psemhisEXMDATE: TStringField;
    Query_psemhisEXCPAMT: TFloatField;
    Query_psemhisCPDEDYN: TStringField;
    Query_psemhisEXDEDAMT: TFloatField;
    Query_psemhisEXYN: TStringField;
    CB_cpdedyn: TComboBox;
    NE_excpamt2: TNumberEdit;
    NE_exiamt: TNumberEdit;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    E_exdesc: TEdit;
    ProgressBar1: TProgressBar;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Query_Bas: TQuery;
    Query_psemhisEXDESC: TStringField;
    Panel16: TPanel;
    Panel18: TPanel;
    E_BankCode: TEdit;
    SB_BankCode: TSpeedButton;
    Panel20: TPanel;
    E_BankAcnt: TEdit;
    BMasSave: TButton;
    P_BankName: TPanel;
    Query_psemhisCORPNAME: TStringField;
    Query_psemhisDIVSEQNUM: TFloatField;
    Query_psemhisSTCLASS: TStringField;
    Query_psemhisSTLORG: TStringField;
    DS_pslmas: TDataSource;
    Query_pslmas: TQuery;
    Query_pslmasCORPNAME: TStringField;
    Query_pslmasDIVSEQNUM: TFloatField;
    Query_pslmasstclassNAME: TStringField;
    Query_pslmasstlorgNAME: TStringField;
    Query_pslmasSTLDATE: TStringField;
    Query_pslmasSTLAMT: TFloatField;
    Query_pslmasSTISUM: TFloatField;
    Query_pslmasSTIRISUM: TFloatField;
    Query_pslmasSTIRAMT: TFloatField;
    Query_pslmasEMPNO: TStringField;
    Query_pslmasKORNAME: TStringField;
    Query_pslmasSTCLASS: TStringField;
    Query_pslmasSTLORG: TStringField;
    Query_pslmasWRITETIME: TStringField;
    Query_pslmasWRITEMAN: TStringField;
    Query_pslmasBANKCODE: TStringField;
    Query_pslmasBANKACNT: TStringField;
    Database1: TDatabase;
    Query_pslmasSTRAMT: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure DS_pslmasDataChange(Sender: TObject; Field: TField);
    procedure SB_empnoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_helpClick(Sender: TObject);
    procedure CB_exynChange(Sender: TObject);
    procedure CB_exynDblClick(Sender: TObject);
    procedure Query_pslmasCalcFields(DataSet: TDataSet);
    procedure SB_exmdateClick(Sender: TObject);
    procedure DS_psemhisDataChange(Sender: TObject; Field: TField);
    procedure ME_exmdateExit(Sender: TObject);
    procedure B_SaveClick(Sender: TObject);
    procedure B_CancelClick(Sender: TObject);
    procedure CB_cpdedynChange(Sender: TObject);
    procedure CB_cpdedynDblClick(Sender: TObject);
    procedure Query_psemhisCalcFields(DataSet: TDataSet);
    procedure SB_BankCodeClick(Sender: TObject);
    procedure BMasSaveClick(Sender: TObject);
  private
    { Private declarations }
    pempno, pkorname, password: string;
    GSsysdate: String;

  public
    { Public declarations }
    procedure DataAllClear;
    function  Next_Month(yyyymm: string): string;
    procedure Compute_tot;

    function indc_date(yyyymmdd: String; disc: Integer): String;
    function indc_Month(yyyymm: string; disc: Integer): string;
    function Last_day(yyyymm: String): String;
  end;

var
  MainForm : TMainForm;
  codefr   : TCodePtr;
  Running: Boolean;
  Save_corpname  : string;
  Save_divseqnum : Integer;
  Save_STLORG, Save_stclass, Save_exdate: String;
  MAX_exdate: String;
  Msg       : String;
  SqlStr    : WideString;

implementation
{$R *.DFM}
uses
  psc30602;
  
{-------------------------------- MAIN ----------------------------------------}
procedure TMainForm.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  if Running then
    System.Exit;
  Running := True;
  Phelpmsg.Caption := '  초기자료를 읽고 있습니다';
  Application.ProcessMessages;

  Pempno   := PassEmp(CmdLine, 1);
  Pkorname := PassEmp(CmdLine, 2);
  Password := PassEmp(CmdLine, 3);
  Lempinfo.Caption := pkorname+'('+pempno+')';

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
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
  Query_Gen.Sql.Add('FROM DUAL ');
  Query_Gen.Open;
  GSsysdate := Query_Gen.FieldByName('D').AsString;
  Query_Gen.Close;
  Lsysdate.Caption := DateFormatMask(Copy(GSsysdate, 1, 8),
                                     DateSeparator, 1);

  Query_Gen.Close;
  Query_Gen.Sql.Clear;
  Query_Gen.Sql.Add('SELECT MAX(EXDATE) max_exdate '); // max(월별상환이력.상환월)
  Query_Gen.Sql.Add('FROM PSEMHIS ');
  Query_Gen.Sql.Add('WHERE (EXMDATE IS NULL) and ');
  Query_Gen.Sql.Add('      (EXICNT > 0) ');
  Query_Gen.Open;
  MAX_exdate := Query_Gen.FieldByName('max_exdate').AsString;
  Query_Gen.Close;

  init_code(codefr,Query_Gen,['I112','K910']); {직급,대부기관}
  Save_corpname  := '';   // 대부내역의 <취소>작업을 위해 보관용
  Save_divseqnum := 0;   // 대부내역의 <취소>작업을 위해 보관용
  Save_stclass   := '';  // 대부내역의 <취소>작업을 위해 보관용
  Save_stlorg    := '';  // 대부내역의 <취소>작업을 위해 보관용
  Save_exdate    := '';  // 상환이력의 <취소>작업을 위해 보관용
  Phelpmsg.Caption := '';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Running := False;
end;

{------------------------------ User Function ---------------------------------}
{화면Clear}
procedure TMainForm.DataAllClear;
begin
  P_korname.Caption      := '';
  P_paycl.Caption        := '';
  P_payclNAME.Caption    := '';
  P_deptcode.Caption     := '';
  P_deptcodeNAME.Caption := '';

  NE_exiamt.Value   := 0;
  NE_excpamt2.Value := 0;
  CB_cpdedyn.Text   := 'N';
  CB_exyn.Text      := 'N';
  E_exdesc.Text     := '';

  P_stlamtTOT.Caption   := '';
  P_stisumTOT.Caption   := '';
  P_stirisumTOT.Caption := '';
  P_stiramtTOT.Caption  := '';
end;

procedure TMainForm.Compute_tot;
begin
  if Query_pslmas.RecordCount > 0 then
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('SELECT (SUM(STLAMT)) TOT_STLAMT, ');
    Query_update.SQL.ADD('       (SUM(STISUM)) TOT_STISUM, ');
    Query_update.SQL.ADD('       (SUM(STIRISUM)) TOT_STIRISUM, ');
    Query_update.SQL.ADD('       (SUM(STIRAMT)) TOT_STIRAMT ');
    Query_update.SQL.ADD('FROM   PSLMAS ');  // 대부마스터
    Query_update.SQL.Add('WHERE (EMPNO = '''+E_empno.Text+''') ');
    Query_update.Open;
    P_stlamtTOT.Caption   := Format('%12.0n', [Query_update.FieldByName('TOT_STLAMT').AsFloat]);
    P_stisumTOT.Caption   := Format('%12.0n', [Query_update.FieldByName('TOT_STISUM').AsFloat]);
    P_stirisumTOT.Caption := Format('%12.0n', [Query_update.FieldByName('TOT_STIRISUM').AsFloat]);
    P_stiramtTOT.Caption  := Format('%12.0n', [Query_update.FieldByName('TOT_STIRAMT').AsFloat]);
    Query_update.Close;
  end;
end;

function TMainForm.Next_Month(yyyymm: string): string;
var
  yyyy, mm: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),0);
  mm   := StrToIntDef(Copy(yyyymm,5,2),0);
  if (yyyy = 0) or (mm = 0) then
  begin
    Next_Month := '';
    System.Exit;
  end;
  if mm >= 12 then
  begin
    Inc(yyyy);
    mm := 0;
  end;
  Inc(mm);
  Next_Month := format('%.4d%.2d', [yyyy,mm]);
end;

function TMainForm.indc_date(yyyymmdd: String; disc: Integer): String;
var
  yyyy,mm,dd: Integer;
  MyDate: TDateTime;
  Convert_OK: Boolean;
begin
  yyyy := StrToIntDef(Copy(yyyymmdd,1,4),-1);
  mm   := StrToIntDef(Copy(yyyymmdd,5,2),-1);
  dd   := StrToIntDef(Copy(yyyymmdd,7,2),-1);
  if (yyyy <= 0) or (mm <= 0) or (dd <= 0) then
  begin
    indc_date := '';
    System.exit;
  end;

  if disc = 0 then
  begin
    try
      Convert_OK := True;
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
    begin
      indc_date := FormatDateTime('yyyymmdd', MyDate);
    end
    else
    begin
      indc_date := '';
    end;
  end
  else
  begin
    Convert_OK := True;
    try
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
    begin
      indc_date := FormatDateTime('yyyymmdd', MyDate+disc);
    end
    else
    begin
      indc_date := '';
    end;
  end;
end;

function TMainForm.indc_Month(yyyymm: string; disc: Integer): string;
var
  yyyy, mm: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),-1);
  mm   := StrToIntDef(Copy(yyyymm,5,2),-1);
  if (yyyy <= 0) or (mm <= 0) then
  begin
    indc_Month := '';
    System.Exit;
  end;

  mm := mm + disc;
  if mm > 12 then
  begin
    Inc(yyyy);
    mm := mm - 12;
  end
  else if mm < 1 then
  begin
    Dec(yyyy);
    mm := mm + 12;
  end;
  indc_Month := format('%.4d%.2d', [yyyy,mm]);
end;

function TMainForm.Last_day(yyyymm: String): String;
var
  MyDate: TDateTime;
  Convert_OK: Boolean;
  yyyy, mm, dd: Integer;
begin
  yyyy := StrToIntDef(Copy(yyyymm,1,4),0);
  mm   := StrToIntDef(Copy(yyyymm,5,2),0);
  if (yyyy <= 0) or (mm <= 0) then
  begin
    Last_day := '';
    System.exit;
  end;

  Convert_OK := True;
  dd := 28;
  while Convert_OK do
  begin
    try
      MyDate := EncodeDate(yyyy, mm, dd);
    except
      on EConvertError do
         Convert_OK := False;
    end;
    if Convert_OK then
      Inc(dd)
    else
      Dec(dd);
  end;
  Last_day := format('%.4d%.2d%.2d', [yyyy,mm,dd]);
end;

{-------------------------------- BUTTON -----------------------------}
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('작업을 종료하시겠습니까?',
                            '작업안내', mb_YesNo) = IDYES
  then
  begin
    Free_CodeTable(codefr);
    Action := caFree
  end
  else
  begin
    Action := caNone;
  end;
end;

procedure TMainForm.BB_deleteClick(Sender: TObject);
var
  MaxExmdate   : String;
  MaxHisExdate : String;
  CntPsemhis   : String;
begin
  if Query_psemhis.Active = False then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_psemhis.RecordCount = 0 then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if MAX_exdate <> Query_psemhisEXDATE.AsString then
  begin
    MessageBox(handle, '최종상환월의 자료만 삭제할 수 있습니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  if Application.MessageBox('선택한 자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK
  then
  begin
    if Query_psemhisEXMDATE.Asstring <> '' then  //중도상환
    begin
         //최종자료부터 순차적으로 삭제(20110704)
         Query_Gen.Close;
         Query_Gen.SQL.Clear;
         Query_Gen.SQL.ADD('Select max(EXMDATE) EXMDATE FROM PSEMHIS ');  // 월별상환이력
         Query_Gen.SQL.Add('WHERE ');
         Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
         Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
         Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
         Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
         Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
         Query_Gen.open;

         MaxExmdate := '';
         MaxExmdate := Query_Gen.fieldbyname('Exmdate').AsString;

         if MaxExmdate <> ME_exmdate.Text then
         begin
           MessageBox(handle, '최종자료부터 순차적으로 삭제가 가능합니다.',
                              '작업안내', MB_ICONWARNING);
           System.Exit;
         end;

         Query_Gen.Close;
         Query_Gen.SQL.Clear;
         Query_Gen.SQL.ADD('Select max(EXMDATE) EXMDATE FROM PSEMHIS ');  // 월별상환이력
         Query_Gen.SQL.Add('WHERE ');
         Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
         Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
         Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
         Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
         Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
         Query_Gen.SQL.Add('      (EXMDATE   < '''+Query_psemhisEXMDATE.Asstring+''')   ');  {중도상환일자}
         Query_Gen.open;

         MaxExmdate := '';
         MaxExmdate := Query_Gen.fieldbyname('Exmdate').AsString;
         if MaxExmdate <> '' then
         begin
            // 대부마스터 갱신
            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
            Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
            Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
            Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
            Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
            Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
            Query_Gen.SQL.ADD('       FROM PSEMHIS ');
            Query_Gen.SQL.ADD('       WHERE ');
            Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
            Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
            Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
            Query_Gen.SQL.Add('WHERE ');
            Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
            Query_Gen.ExecSQL;

            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
            Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT) = ( ');
            Query_Gen.SQL.ADD('       SELECT EXMDATE, EXCPAMT ');
            Query_Gen.SQL.ADD('         FROM PSEMHIS ');
            Query_Gen.SQL.ADD('        WHERE ');
            Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and   ');
            Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and  ');  {대부기관}
            Query_Gen.SQL.Add('          (EXMDATE   = '''+MaxExmdate+'''))                      ');  {중도상환일자}
            Query_Gen.SQL.Add('WHERE ');
            Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
            Query_Gen.ExecSQL;
         end
         else
         begin
              // 대부마스터 갱신
              Query_Gen.Close;
              Query_Gen.SQL.Clear;
              Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
              Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT, STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
              Query_Gen.SQL.ADD('       SELECT '''', 0,      ');
              Query_Gen.SQL.ADD('              A.STISUM   - EXCPAMT, ');
              Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT,  ');
              Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
              Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
              Query_Gen.SQL.ADD('       FROM PSEMHIS ');
              Query_Gen.SQL.ADD('       WHERE ');
              Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
              Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
              Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
              Query_Gen.SQL.Add('WHERE ');
              Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
              Query_Gen.ExecSQL;

         end;
    end
    else // 정기분
    begin
         // 대부마스터 갱신
         Query_Gen.Close;
         Query_Gen.SQL.Clear;
         Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
         Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
         Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
         Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
         Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
         Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
         Query_Gen.SQL.ADD('       FROM PSEMHIS ');
         Query_Gen.SQL.ADD('       WHERE ');
         Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
         Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
         Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
         Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
         Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
         Query_Gen.SQL.Add('          (EXMDATE IS NULL) and ');  {중도상환일자}
         Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
         Query_Gen.SQL.Add('WHERE ');
         Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
         Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
         Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
         Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
         Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
         Query_Gen.ExecSQL;
    end;

    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('DELETE FROM PSEMHIS ');  // 월별상환이력
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
    if Query_psemhisEXMDATE.Asstring <> '' then
       Query_Gen.SQL.Add('  and (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') ')  {중도상환일자}
    else
       Query_Gen.SQL.Add('  and (EXMDATE IS NULL) ');  {중도상환일자}
    Query_Gen.ExecSQL;


    //중도금취소 후 자료존재여부 확인.
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('Select MAX(exdate) MaxHisExdate FROM PSEMHIS ');  // 월별상환이력
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''')');  {중도상환일자}
    Query_Gen.open;

    MaxHisExdate := '';
    MaxHisExdate := Query_Gen.fieldbyname('MaxHisExdate').AsString;

    if MaxHisExdate <> '' then
    begin
      //중도금취소 후 자료존재여부 확인.
      Query_Gen.Close;
      Query_Gen.SQL.Clear;

      Query_Gen.SQL.ADD('Select COUNT(exdate) CNT FROM PSEMHIS A ');  // 월별상환이력
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.EXDATE    = '''+copy(GSsysdate,1,6)+''') and');
      Query_Gen.SQL.Add('      (A.EXMDATE IS NOT NULL) ');
      Query_Gen.open;

      CntPsemhis := '';
      CntPsemhis := Query_Gen.fieldbyname('CNT').AsString;

      //전월기준미상환액 : 해당월의 이력.최초입력자료만 저장
      //전월기준미상환액 = 대출금 - 상환원금(누적)
      if CntPsemhis = '0' then
      begin
        Query_Gen.Close;
        Query_Gen.SQL.Clear;
        Query_Gen.SQL.ADD('UPDATE PSLMAS A');
        Query_Gen.SQL.ADD('   SET A.STBIAMT  = (NVL(A.STLAMT, 0) - NVL(A.STISUM,0)) + ');
        Query_Gen.SQL.ADD('   (SELECT NVL(SUM(EXCPAMT), 0) FROM PSEMHIS ');
        Query_Gen.SQL.Add(    'WHERE ');
        Query_Gen.SQL.ADD('          (CORPNAME  = A.CORPNAME)  AND');
        Query_Gen.SQL.Add('          (DIVSEQNUM = A.DIVSEQNUM) AND');
        Query_Gen.SQL.Add('          (STCLASS   = A.STCLASS)   AND');
        Query_Gen.SQL.Add('          (STLORG    = A.STLORG)    AND');
        Query_Gen.SQL.Add('          (EMPNO     = A.EMPNO)     AND');
        Query_Gen.SQL.Add('          (EXDATE    =  '''+MaxHisExdate+''') AND');
        Query_Gen.SQL.Add('          (EXMDATE IS NOT NULL)) ');
        Query_Gen.SQL.Add('WHERE ');
        Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
        Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
        Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
        Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and');
        Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''')  ');
        Query_Gen.ExecSQL;
      End;

      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
      Query_Gen.SQL.ADD('  SET (EXDATE, EXCPAMT) = ( ');
      Query_Gen.SQL.ADD('       SELECT MAX(EXMDATE), SUM(EXCPAMT) FROM PSEMHIS ');
      Query_Gen.SQL.ADD('       WHERE ');
      Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and   ');
      Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
      Query_Gen.SQL.Add('          (EXDATE IN (SELECT MAX(EXDATE) FROM PSEMHIS ');
      Query_Gen.SQL.Add('                      WHERE CORPNAME  = A.CORPNAME ');
      Query_Gen.SQL.Add('                        AND DIVSEQNUM = A.DIVSEQNUM ');
      Query_Gen.SQL.Add('                        AND STCLASS   = A.STCLASS ');
      Query_Gen.SQL.Add('                        AND STLORG    = A.STLORG ');
      Query_Gen.SQL.Add('                        AND EMPNO     = A.EMPNO))) ');
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
      Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');

      Query_Gen.ExecSQL;
    end;

    Save_corpname  := Query_pslmasCorpName.AsString;
    Save_divseqnum := Query_pslmasDIVSEQNUM.AsInteger;
    Save_stclass   := Query_pslmasSTCLASS.AsString;
    Save_STLORG    := Query_pslmasSTLORG.AsString;
    Save_exdate    := Query_psemhisEXDATE.AsString;
    Query_pslmas.Close;
    Query_pslmas.Open;
    Compute_tot;

    if Query_pslmas.Locate('CORPNAME;DIVSEQNUM;STCLASS;STLORG',  // 대부내역 locate
                   VarArrayOf([Save_corpname, Save_divseqnum, Save_stclass, Save_STLORG]), [loPartialKey])
    then
      DBG_pslmas.SetFocus;
    BB_CancelClick(Sender); // 상환이력 locate
    Phelpmsg.Caption := '  선택한 자료를 삭제하였습니다.';
  end;
end;

procedure TMainForm.BB_saveClick(Sender: TObject);
var MaxExmdate, CntPsemhis : String;
begin
  Phelpmsg.Caption := '';
  BB_save.setfocus;
  if Query_psemhis.Active = False then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_psemhis.RecordCount = 0 then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
 { // 대부마스터 갱신
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
  Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
  Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
  Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
  Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
  Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
  Query_Gen.SQL.ADD('       FROM PSEMHIS ');
  Query_Gen.SQL.ADD('       WHERE ');
  Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); //상환월
  Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  if Query_psemhisEXMDATE.Asstring <> '' then
     Query_Gen.SQL.Add('        (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ')  //중도상환일자
  else
     Query_Gen.SQL.Add('          (EXMDATE IS NULL) and ');  //중도상환일자
  Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  //대부기관
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  //대부기관
  Query_Gen.ExecSQL; }

  if Query_psemhisEXMDATE.Asstring <> '' then
  begin
       Query_Gen.Close;
       Query_Gen.SQL.Clear;
       Query_Gen.SQL.ADD('Select max(EXMDATE) EXMDATE FROM PSEMHIS ');  // 월별상환이력
       Query_Gen.SQL.Add('WHERE ');
       Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
       Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
       Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
       Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
       Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
       Query_Gen.SQL.Add('      (EXMDATE   < '''+Query_psemhisEXMDATE.Asstring+''')   ');  {중도상환일자}
       Query_Gen.open;
       MaxExmdate := Query_Gen.fieldbyname('Exmdate').AsString;
       if MaxExmdate <> '' then
       begin
            // 대부마스터 갱신
            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
            Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
            Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
            Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
            Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
            Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
            Query_Gen.SQL.ADD('       FROM PSEMHIS ');
            Query_Gen.SQL.ADD('       WHERE ');
            Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
            Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
            Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
            Query_Gen.SQL.Add('WHERE ');
            Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
            Query_Gen.ExecSQL;

            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
            Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT) = ( ');
            Query_Gen.SQL.ADD('       SELECT EXMDATE, EXCPAMT ');
            Query_Gen.SQL.ADD('         FROM PSEMHIS ');
            Query_Gen.SQL.ADD('        WHERE ');
            Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and   ');
            Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and  ');  {대부기관}
            Query_Gen.SQL.Add('          (EXMDATE   = '''+MaxExmdate+'''))                      ');  {중도상환일자}
            Query_Gen.SQL.Add('WHERE ');
            Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
            Query_Gen.ExecSQL;
       end
       else
       begin
            // 대부마스터 갱신
            Query_Gen.Close;
            Query_Gen.SQL.Clear;
            Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
            Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT, STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
            Query_Gen.SQL.ADD('       SELECT '''', 0,      ');
            Query_Gen.SQL.ADD('              A.STISUM   - EXCPAMT, ');
            Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT,  ');
            Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
            Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
            Query_Gen.SQL.ADD('       FROM PSEMHIS ');
            Query_Gen.SQL.ADD('       WHERE ');
            Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
            Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
            Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
            Query_Gen.SQL.Add('WHERE ');
            Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
            Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
            Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
            Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
            Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
            Query_Gen.ExecSQL;

       end;
  end
  else
  begin
       // 대부마스터 갱신
       Query_Gen.Close;
       Query_Gen.SQL.Clear;
       Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
       Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
       Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
       Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
       Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
       Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
       Query_Gen.SQL.ADD('       FROM PSEMHIS ');
       Query_Gen.SQL.ADD('       WHERE ');
       Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
       Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
       Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
       Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
       Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
       Query_Gen.SQL.Add('          (EXMDATE IS NULL) and ');  {중도상환일자}
       Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
       Query_Gen.SQL.Add('WHERE ');
       Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
       Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
       Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
       Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
       Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
       Query_Gen.ExecSQL;
  end;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS ');  // 대부마스터
  Query_Gen.SQL.ADD('    SET STISUM    = STISUM   + '+FloatToStr(NE_excpamt2.Value)+', ');
  Query_Gen.SQL.ADD('        STIRISUM  = STIRISUM + '+FloatToStr(NE_exiamt.Value)+', ');
  Query_Gen.SQL.ADD('        STIRAMT   = STIRAMT  - '+FloatToStr(NE_excpamt2.Value)+', ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
  Query_Gen.ExecSQL;

  // 월별상환이력 갱신
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXIAMT    = '+FloatToStr(NE_exiamt.Value)+', ');
  Query_Gen.SQL.ADD('        EXCPAMT   = '+FloatToStr(NE_excpamt2.Value)+', ');
  Query_Gen.SQL.ADD('        staiamt   = stbiamt - '+FloatToStr(NE_excpamt2.Value)+', ');
  if CB_cpdedyn.Text = 'Y' then
    Query_Gen.SQL.ADD('      EXDEDAMT  = '+FloatToStr(NE_exiamt.Value + NE_excpamt2.Value)+', ')
  else if CB_cpdedyn.Text = 'N' then
    Query_Gen.SQL.ADD('      EXDEDAMT  = '+FloatToStr(NE_exiamt.Value)+', ');
  Query_Gen.SQL.ADD('        CPDEDYN   = '''+CB_cpdedyn.Text+''', ');
  Query_Gen.SQL.ADD('        EXYN      = '''+CB_exyn.Text+''',  ');
  Query_Gen.SQL.ADD('        EXDESC    = '''+E_exdesc.Text+''', ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
  if Query_psemhisEXMDATE.Asstring <> '' then
     Query_Gen.SQL.Add('  and (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') ')  {중도상환일자}
  else
     Query_Gen.SQL.Add('  and (EXMDATE IS NULL) ');  {중도상환일자}
  Query_Gen.ExecSQL;

  if (Query_psemhisEXMDATE.Asstring <> '') then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
    Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT) = ( ');
    Query_Gen.SQL.ADD('       SELECT MAX(EXMDATE), SUM(EXCPAMT) FROM PSEMHIS ');
    Query_Gen.SQL.ADD('         FROM PSEMHIS ');
    Query_Gen.SQL.ADD('        WHERE ');
    Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and   ');
    Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
    Query_Gen.SQL.Add('          (EXDATE IN (SELECT MAX(EXDATE) FROM PSEMHIS ');
    Query_Gen.SQL.Add('                    WHERE CORPNAME  = A.CORPNAME ');
    Query_Gen.SQL.Add('                      AND DIVSEQNUM = A.DIVSEQNUM ');
    Query_Gen.SQL.Add('                      AND STCLASS   = A.STCLASS ');
    Query_Gen.SQL.Add('                      AND STLORG    = A.STLORG ');
    Query_Gen.SQL.Add('                      AND EMPNO     = A.EMPNO))) ');
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
    Query_Gen.ExecSQL;

    //자료건수 확인.
    Query_Gen.Close;
    Query_Gen.SQL.Clear;

    Query_Gen.SQL.ADD('Select COUNT(exdate) CNT FROM PSEMHIS A ');  // 월별상환이력
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
    Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (A.EXDATE    =  '''+Copy(GSsysdate,1,6)+''') ');

    Query_Gen.open;

    CntPsemhis := '';
    CntPsemhis := Query_Gen.fieldbyname('CNT').AsString;

    //전월기준미상환액 : 해당월의 이력.최초입력자료만 저장
    //전월기준미상환액 = 대출금 - 상환원금(누적)
    if CntPsemhis = '1' then
    begin
      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.ADD('UPDATE PSLMAS ');
      Query_Gen.SQL.ADD('   SET STBIAMT  = (NVL(STLAMT, 0) - NVL(STISUM,0)) ');
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and');
      Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''')  ');
      Query_Gen.ExecSQL;
    End;
  end;

  // 대부마스터 갱신
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
  Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM) = ( ');
  Query_Gen.SQL.ADD('       SELECT SUM(EXCPAMT), ');
  Query_Gen.SQL.ADD('              SUM(EXIAMT)   ');
  Query_Gen.SQL.ADD('       FROM PSEMHIS ');
  Query_Gen.SQL.ADD('       WHERE ');
  Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
  Query_Gen.ExecSQL;

  // 대부마스터 잔액 갱신
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
  Query_Gen.SQL.ADD('   SET (STIRAMT) = STLAMT - STISUM ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
  Query_Gen.ExecSQL;

  Save_corpname  := Query_pslmasCorpname.AsString;
  Save_divseqnum := Query_pslmasDIVSEQNUM.AsInteger;
  Save_stclass   := Query_pslmasSTCLASS.AsString;
  Save_STLORG    := Query_pslmasSTLORG.AsString;
  Save_exdate    := Query_psemhisEXDATE.AsString;
  Query_pslmas.Close;
  Query_pslmas.Open;
  Compute_tot;

  if Query_pslmas.Locate('CORPNAME;DIVSEQNUM;STCLASS;STLORG',  // 대부내역 locate
                 VarArrayOf([Save_corpname, Save_divseqnum, Save_stclass, Save_STLORG]), [loPartialKey])
  then
    DBG_pslmas.SetFocus;
  BB_CancelClick(Sender); // 상환이력 locate
  Phelpmsg.Caption := '  기존 상환이력을 수정하였습니다.';
end;

procedure TMainForm.BB_cancelClick(Sender: TObject);
begin
  if Query_psemhis.Active = False then
    System.Exit;
  if Query_psemhis.RecordCount = 0 then
    System.Exit;
  if Query_psemhis.Locate('CORPNAME;DIVSEQNUM;STCLASS;STLORG', VarArrayOf([Save_corpname, Save_divseqnum, Save_stclass, Save_STLORG]), [loPartialKey]) then
    DBG_psemhis.SetFocus;
end;

procedure TMainForm.BB_helpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  try
    HelpForm.Programid := 'PSC3060A';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

procedure TMainForm.B_SaveClick(Sender: TObject);
var
  t_var1, t_var2: Real;
  LS_exmdate    : string;
  MaxHisExdate  : string;
  CntPsemhis    : String;
  HapExcpamt    : Real;
  YunCnt        : integer;
begin
  LS_exmdate := '';
  ProgressBar1.Position := 0;
  Application.ProcessMessages;

  if (Query_pslmas.Active = False) then
  begin
    MessageBox(handle, '먼저 대부내역 자료를 선택하세요',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if (Query_pslmas.RecordCount = 0) then
  begin
    MessageBox(handle, '먼저 대부내역 자료를 선택하세요',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Length(ME_exmdate.Text) <> 8 then
  begin
    MessageBox(Handle, '중도상환일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  if NE_excpamt1.Value <= 0 then
  begin
    MessageBox(Handle, '중도상환금액을 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;

  YunCnt := YunYearDay(ME_exmdate.Text);

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT EMPNO ');
  Query_Gen.SQL.Add('FROM PSEMHIS ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  {중도상환일자}
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
  begin
    Query_Gen.Close;
    MessageBox(handle, '이미 상환이력에 해당조건의 자료가 있습니다',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  // 현재 입력한 중도상환일이 이미 공제된 자료가 기간이 중복되는 지를 Check
  Query_Bas.Close;
  Query_Bas.SQL.Clear;
  Query_Bas.SQL.ADD('SELECT STCFDATE, STCTDATE '); // 기산일자from, to
  Query_Bas.SQL.Add('FROM PSHLBAS ');   // 대부기준
  Query_Bas.SQL.Add('WHERE ');
  Query_Bas.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Bas.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Bas.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Bas.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Bas.SQL.Add('      (:exmdate between stcfdate and stctdate) ');
  Query_Bas.ParamByName('exmdate').AsString := ME_exmdate.Text;
  Query_Bas.Open;

  if Query_Bas.Eof then
  begin
       Msg := '현재 중도상환하려는 자료의 이자계산을 위해서는' + #13 + #13 +
              '[기산일From] 과 [기산일To] 가' + #13 + #13 +
              '대부기준에 등록되어있어야 합니다.' + #13 + #13 +
              '대부기준을 수정하신 후 작업하시기 바랍니다.';
       Application.MessageBox(pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
       System.Exit;
  end;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT EMPNO ');
  Query_Gen.SQL.Add('FROM   PSEMHIS ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Gen.SQL.Add('      (:exmdate between stcfdate and stctdate) ');
  Query_Gen.ParamByName('exmdate').AsString := ME_exmdate.Text;
  Query_Gen.Open;

  if not Query_Gen.Eof then
  begin
    Msg := '현재 입력하신 중도상환일이 이미 등록된 자료의' + #13 + #13 +
           '기산일범위와 중복됩니다.' + #13 + #13 +
           '중도상환일을 확인하신 후 작업하시기 바랍니다.';
    Application.MessageBox(pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
    System.Exit;
  end;

  Save_corpname  := Query_pslmasCORPNAME.AsString;
  Save_divseqnum := Query_pslmasDIVSEQNUM.AsInteger;
  Save_stclass   := Query_pslmasSTCLASS.AsString;
  Save_STLORG    := Query_pslmasSTLORG.AsString;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT NVL(SUM(EXCPAMT), 0) EXCPAMT FROM PSEMHIS ');
  Query_Gen.SQL.ADD('WHERE ');
  Query_Gen.SQL.ADD('  (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('  (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('  (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('  (STLORG    = '''+Query_pslmasSTLORG.AsString+''')  and ');
  Query_Gen.SQL.Add('  (EMPNO     = '''+Query_pslmasEMPNO.AsString+''')   and ');
  Query_Gen.SQL.Add('  (EXDATE    >= ''201108'') and');
  Query_Gen.SQL.Add('  (EXMDATE IS NULL) ');
  Query_Gen.Open;

  HapExcpamt := 0;
  HapExcpamt := Query_Gen.fieldbyname('EXCPAMT').AsFloat;

  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('INSERT INTO PSEMHIS ');
  Query_update.SQL.ADD(' (CORPNAME, EXDATE, DIVSEQNUM, STCLASS, EMPNO, KORNAME, STLORG, ');
  Query_update.SQL.ADD('  STLDATE, STLAMT, STBIAMT, STAIAMT, EXCPCS, EXMDATE, ');
  Query_update.SQL.ADD('  EXCPAMT, EXDESC, STRAMT, WRITETIME, WRITEMAN ) ');
  Query_update.SQL.ADD('VALUES ( ');
  Query_update.SQL.ADD('  '''+Query_pslmasCorpName.AsString+ ''', ');
  Query_update.SQL.ADD('  '''+Copy(ME_exmdate.Text,1,6)+''', ');
  Query_update.SQL.ADD('  '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+', ');
  Query_update.SQL.ADD('  '''+Query_pslmasSTCLASS.AsString+''', ');
  Query_update.SQL.ADD('  '''+Query_pslmasEMPNO.AsString+''', ');
  Query_update.SQL.ADD('  '''+Query_pslmasKORNAME.AsString+''', ');
  Query_update.SQL.ADD('  '''+Query_pslmasSTLORG.AsString+''', ');
  Query_update.SQL.ADD('  '''+Query_pslmasSTLDATE.AsString+''', ');
  Query_update.SQL.ADD('  '+FloatToStr(Query_pslmasSTLAMT.AsFloat)+', ');
  Query_update.SQL.ADD('  '+FloatToStr(Query_pslmasSTIRAMT.AsFloat)+', ');
  Query_update.SQL.ADD('  '+FloatToStr(Query_pslmasSTIRAMT.AsFloat - NE_excpamt1.Value)+', ');
  Query_update.SQL.ADD('  ''2'', ');
  Query_update.SQL.ADD('  '''+ME_exmdate.Text+''', ');
  Query_update.SQL.ADD('  '+FloatToStr(NE_excpamt1.Value)+', ');
  Query_update.SQL.ADD('  '''+E_exdesc.Text+''', ');
  Query_update.SQL.ADD('  '+FloatToStr(Query_pslmasSTRAMT.AsFloat)+', ');
  Query_update.SQL.ADD('  '''+Copy(GSsysdate,1,14)+''', ');
  Query_update.SQL.ADD('  '''+Pempno+''') ');
  Query_update.ExecSQL;
  ProgressBar1.Position := 5;
  Application.ProcessMessages;

  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_update.SQL.ADD('    SET STCFDATE  = '''+Query_Bas.FieldByName('STCFDATE').AsString+''', ');
  Query_update.SQL.ADD('        STCTDATE  = '''+ME_exmdate.Text+''', ');
  Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_update.SQL.Add('WHERE ');
  Query_update.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_update.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and ');
  Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_update.SQL.Add('      (STLDATE   < '''+Query_Bas.FieldByName('STCFDATE').AsString+''') and ');
  Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  //중도상환일자
  Query_update.ExecSQL;

  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_update.SQL.ADD('   SET  STCFDATE  = STLDATE, ');
  Query_update.SQL.ADD('        STCTDATE  = '''+ME_exmdate.Text+''', ');
  Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_update.SQL.Add('WHERE ');
  Query_update.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_update.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and ');
  Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_update.SQL.Add('      (STLDATE  >= '''+Query_Bas.FieldByName('STCFDATE').AsString+''') and ');
  Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');
  Query_update.ExecSQL;
  ProgressBar1.Position := 15;
  Application.ProcessMessages;

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT STCTDATE ');
  Query_Gen.SQL.Add('FROM   PSEMHIS  ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Gen.SQL.Add('      (substr(exmdate,1,6) = :exmyymm) and ');
  Query_Gen.SQL.Add('      (EXMDATE   <> '''+ME_exmdate.Text+''') ');
  Query_Gen.SQL.Add('ORDER BY STCTDATE DESC ');
  Query_Gen.ParamByName('exmyymm').AsString := copy(ME_exmdate.Text,1,6);
  Query_Gen.Open;

  if not Query_Gen.Eof then
  begin
  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_update.SQL.ADD('   SET  STCFDATE  = to_char(to_date(:frdate,''YYYYMMDD'')+1,''YYYYMMDD'') ');
  Query_update.SQL.Add('WHERE ');
  Query_update.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_update.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and ');
  Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');
  Query_update.ParamByName('frdate').AsString := Query_Gen.FieldByName('stctdate').AsString;
  Query_update.ExecSQL;
  end;

  // 월별상환이력.상환이자일수(가산일from ~ 기산일to)
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXICNT    = to_date(STCTDATE,''YYYYMMDD'') - to_date(STCFDATE,''YYYYMMDD'') + 1, ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE    = '''+ME_exmdate.text+''') ');  {중도상환일자}
  Query_Gen.ExecSQL;


  // 특이자 처리-------------------------------------------------------- start
  // 월별상환이력.특이여부, 특이일자
  // 특이자화일에서 특이자여부 검사
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT b.EXSPDATE ');
  Query_Gen.SQL.ADD('FROM PSEMHIS a , PSEXSPM b '); // 월별상환이력, 상환특이자
  Query_Gen.SQL.Add('WHERE  ');
  Query_Gen.SQL.Add('      (a.CORPNAME  = '''+Query_pslmasCORPNAME.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); //상환월
  Query_Gen.SQL.Add('      (a.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (a.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  //대부기관
  Query_Gen.SQL.Add('      (a.EXMDATE   = '''+ME_exmdate.text+''') and ');  //중도상환일자
  Query_Gen.SQL.ADD('      (b.CORPNAME  = '''+Query_pslmasCORPNAME.AsString+''') and ');
  Query_Gen.SQL.ADD('      (b.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.ADD('      (b.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.ADD('      (b.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (b.STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  //대부기관
  Query_Gen.Open;
  if Query_Gen.RecordCount > 0 then
  begin
    // 특이자로 설정 및 특이일자 설정
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXSPYN    = ''Y'', ');
    Query_update.SQL.ADD('        EXSPDATE  = '''+Query_Gen.FieldByName('EXSPDATE').AsString+''', ');
    Query_update.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
    Query_update.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_update.SQL.ADD('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
    Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
    Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  {중도상환일자}
    Query_update.ExecSQL;
  end;
  Query_Gen.Close;
  ProgressBar1.Position := 30;
  Application.ProcessMessages;

  // 특이일자 BETWEEN 기산일자from AND 기산일자to
  // 월별상환이력.특이이자일수1, 특이이자일수2
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPCNT1  = to_date(EXSPDATE,''YYYYMMDD'') - to_date(STCFDATE,''YYYYMMDD'') + 1, ');
  Query_Gen.SQL.ADD('        EXSPCNT2  = to_date(STCTDATE,''YYYYMMDD'') - to_date(EXSPDATE,''YYYYMMDD''), ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') and ');  {중도상환일자}
  Query_Gen.SQL.ADD('      (EXSPYN    = ''Y'') and ');
  Query_Gen.SQL.ADD('      (EXSPDATE BETWEEN STCFDATE AND STCTDATE) ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 35;
  Application.ProcessMessages;

  // 기산일자from > 특이일자
  // 월별상환이력.특이이자일수1, 특이이자일수2
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPCNT1  = 0, ');
  Query_Gen.SQL.ADD('        EXSPCNT2  = EXICNT, ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') and ');  {중도상환일자}
  Query_Gen.SQL.ADD('      (EXSPYN    = ''Y'') and ');
  Query_Gen.SQL.ADD('      (STCFDATE  > EXSPDATE) ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 40;
  Application.ProcessMessages;

  // 기산일자to < 특이일자
  // 월별상환이력.특이이자일수1, 특이이자일수2
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET EXSPCNT1  = EXICNT, ');
  Query_Gen.SQL.ADD('        EXSPCNT2  = 0, ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') and ');  {중도상환일자}
  Query_Gen.SQL.ADD('      (EXSPYN    = ''Y'') and ');
  Query_Gen.SQL.ADD('      (STCTDATE  < EXSPDATE) ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 50;
  Application.ProcessMessages;

  // 특이일자 BETWEEN 기산일자from AND 기산일자to and
  // 월별상환이력.상환이자(특이일 <= 중도상환일)
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('SELECT b.EXSPRATE1, b.EXSPRATE2 '); // 상환특이자.특이이자율1, 특이이자율2
  Query_Gen.SQL.ADD('FROM   PSEMHIS a , PSEXSPM b ');      // 월별상환이력, 상환특이자
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.Add('      (a.CORPNAME  = '''+Query_pslmasCORPNAME.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); //상환월//
  Query_Gen.SQL.Add('      (a.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (a.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (a.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  //대부기관//
  Query_Gen.SQL.Add('      (a.EXMDATE   = '''+ME_exmdate.text+''') and ');  //중도상환일자//
  Query_Gen.SQL.ADD('      (a.EXSPYN    = ''Y'') and '); //특이여부 = Y//
  Query_Gen.SQL.ADD('      (b.CORPNAME  = '''+Query_pslmasCORPNAME.AsString+''') and ');
  Query_Gen.SQL.ADD('      (b.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.ADD('      (b.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.ADD('      (b.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.ADD('      (b.STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  //대부기관//
  Query_Gen.Open;

  if Query_Gen.RecordCount > 0 then
  begin
    Query_update.Close;
    Query_update.SQL.Clear;
    Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
    Query_update.SQL.ADD('    SET EXSPINT1 = FLOOR(STBIAMT * ('+FloatToStr(Query_Gen.FieldByName('EXSPRATE1').AsFloat)+' / 100) * ');
    Query_update.SQL.ADD('                        (EXSPCNT1/'+FloatToStr(YunCnt)+')), ');
    Query_update.SQL.ADD('        EXSPINT2 = FLOOR(STBIAMT * ('+FloatToStr(Query_Gen.FieldByName('EXSPRATE2').AsFloat)+' / 100) * ');
    Query_update.SQL.ADD('                        (EXSPCNT2/'+FloatToStr(YunCnt)+')) ');
    Query_update.SQL.ADD('WHERE ');
    Query_update.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_update.SQL.ADD('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
    Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
    Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  {중도상환일자}
    Query_update.ExecSQL;
  end;

  Query_update.Close;
  Query_update.SQL.Clear;
  Query_update.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_update.SQL.ADD('    SET EXIAMT = EXSPINT1 + EXSPINT2 ');
  Query_update.SQL.ADD('WHERE ');
  Query_update.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_update.SQL.ADD('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  {중도상환일자}
  Query_update.ExecSQL;
  Query_Gen.Close;
  ProgressBar1.Position := 70;
  Application.ProcessMessages;
  // 특이자 처리---------------------------------------------------------- end

  // 월별상환이력.상환이자(특이자가 아닌경우)--------------------------- start
  Query_Update.Close;
  Query_Update.SQL.Clear;
  Query_Update.SQL.ADD('UPDATE PSEMHIS a');
  Query_Update.SQL.ADD('SET    EXIAMT = ');
  Query_Update.SQL.ADD('       (select floor(a.stbiamt*(b.stirate/100)*(a.exicnt/'+FloatToStr(YunCnt)+')) ');
  Query_Update.SQL.ADD('        from   pshlbas b                                       ');
  Query_Update.SQL.ADD('        where  a.corpname  = b.corpname                        ');
  Query_Update.SQL.ADD('        and    a.divseqnum = b.divseqnum                       ');
  Query_Update.SQL.ADD('        and    a.stclass  = b.stclass                        ');
  Query_Update.SQL.ADD('        and    a.stlorg    = b.stlorg)                         ');
  Query_Update.SQL.Add('WHERE ');
  Query_Update.SQL.Add('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Update.SQL.Add('      (CORPNAME  = '''+Query_pslmasCORPNAME.AsString+''') and ');
  Query_Update.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Update.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Update.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Update.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Update.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') and ');  {중도상환일자}
  Query_Update.SQL.ADD('      (EXSPYN    IS NULL) '); {특이여부}
  Query_update.ExecSQL;
  ProgressBar1.Position := 80;
  Application.ProcessMessages;
   // 월별상환이력.상환이자(특이자가 아닌경우)--------------------------- End
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.ADD('    SET CPDEDYN = ''N'', ');
  Query_Gen.SQL.ADD('        EXDEDAMT = 0, ');
  Query_Gen.SQL.ADD('        EXYN = ''Y'', ');
  Query_Gen.SQL.ADD('        WRITETIME = '''+Copy(GSsysdate,1,14)+''', ');
  Query_Gen.SQL.ADD('        WRITEMAN  = '''+Pempno+''' ');
  Query_Gen.SQL.ADD('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.ADD('      (EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and '); {상환월}
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
  Query_Gen.SQL.Add('      (EXMDATE   = '''+ME_exmdate.text+''') ');  {중도상환일자}
  //Query_Gen.SQL.ADD('      (EXSPYN    = ''Y'') '); {특이여부}
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 90;
  Application.ProcessMessages;

 // 대부마스터 갱신----------------------------------------------------------
  { HeeYong(2011.06.30) : PSEMHIS에 같은달에 여러건이 존재 할 경우 IFRS(POKLDMAS : Insert) 전송시 오류 발생 }

  //최종원금상환일 : 이력.해당월의 중도상환일
  //최종상환원금   : 이력.상환원금

  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('Select MAX(exdate) MaxHisExdate FROM PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''')');
  Query_Gen.open;

  MaxHisExdate := '';
  MaxHisExdate := Query_Gen.fieldbyname('MaxHisExdate').AsString;

  if MaxHisExdate <> '' then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;

    Query_Gen.SQL.ADD(' DECLARE CURSOR CUR IS ');
    Query_Gen.SQL.ADD('   SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO, ');
    Query_Gen.SQL.ADD('          MAX(EXMDATE) EXMDATE, SUM(EXCPAMT) EXCPAMT ');
    Query_Gen.SQL.ADD('   FROM PSEMHIS ');
    Query_Gen.SQL.ADD('   WHERE CORPNAME  = '''+Query_pslmasCorpName.AsString + ''' ');
    Query_Gen.SQL.ADD('     AND DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+' ');
    Query_Gen.SQL.ADD('     AND STCLASS   = '''+Query_pslmasSTCLASS.AsString+''' ');
    Query_Gen.SQL.ADD('     AND EMPNO     = '''+Query_pslmasEMPNO.AsString+''' ');
    Query_Gen.SQL.ADD('     AND STLORG    = '''+Query_pslmasSTLORG.AsString+''' ');
    Query_Gen.SQL.ADD('     AND EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''' ');
    Query_Gen.SQL.ADD('   GROUP BY CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO; ');
    Query_Gen.SQL.ADD(' BEGIN ');
    Query_Gen.SQL.ADD('   FOR R IN CUR LOOP ');
    Query_Gen.SQL.ADD('     UPDATE PSLMAS ');
    Query_Gen.SQL.ADD('     SET EXDATE     = R.EXMDATE, ');
    Query_Gen.SQL.ADD('         EXCPAMT    = R.EXCPAMT  ');
    Query_Gen.SQL.ADD('     WHERE CORPNAME = R.CORPNAME ');
    Query_Gen.SQL.ADD('       AND DIVSEQNUM= R.DIVSEQNUM');
    Query_Gen.SQL.ADD('       AND STCLASS  = R.STCLASS  ');
    Query_Gen.SQL.ADD('       AND STLORG   = R.STLORG   ');
    Query_Gen.SQL.ADD('       AND EMPNO    = R.EMPNO;   ');
    Query_Gen.SQL.ADD('   END LOOP; ');
    Query_Gen.SQL.ADD(' END; ');

    Query_Gen.ExecSQL;

    ProgressBar1.Position := 95;
    Application.ProcessMessages;
  end;

  //자료건수 확인.
  Query_Gen.Close;
  Query_Gen.SQL.Clear;

  //중도상환하는 달의 중도상환건수
  Query_Gen.SQL.ADD('Select COUNT(exdate) CNT FROM PSEMHIS A ');  // 월별상환이력
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (A.EXDATE    =  '''+copy(ME_exmdate.Text,1,6)+''') and');
  Query_Gen.SQL.Add('      (A.EXMDATE IS NOT NULL) ');

  Query_Gen.open;

  CntPsemhis := '';
  CntPsemhis := Query_Gen.fieldbyname('CNT').AsString;

  //전월기준미상환액 : 해당월의 이력.최초입력자료만 저장
  //전월기준미상환액 = 대출금 - 상환원금(누적)
  if CntPsemhis = '1' then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('UPDATE PSLMAS ');
    Query_Gen.SQL.ADD('   SET STBIAMT  = NVL(STLAMT, 0) - NVL(STISUM,0) ');
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''')  ');
    Query_Gen.ExecSQL;
    ProgressBar1.Position := 96;
    Application.ProcessMessages;
  End;

  //상환원금(누적) : SUM(이력.상환원금)
  //상환이자(누적) : SUM(이력.상환이자)
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD(' DECLARE CURSOR CUR IS ');
  Query_Gen.SQL.ADD('   SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO,');
  Query_Gen.SQL.ADD('          SUM(EXCPAMT) EXCPAMT, SUM(EXIAMT) EXIAMT ');
  Query_Gen.SQL.ADD('   FROM PSEMHIS ');
  Query_Gen.SQL.ADD('   WHERE CORPNAME  = '''+Query_pslmasCorpName.AsString + ''' ');
  Query_Gen.SQL.ADD('     AND DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+' ');
  Query_Gen.SQL.ADD('     AND STCLASS   = '''+Query_pslmasSTCLASS.AsString+''' ');
  Query_Gen.SQL.ADD('     AND STLORG    = '''+Query_pslmasSTLORG.AsString+''' ');
  Query_Gen.SQL.ADD('     AND EMPNO     = '''+Query_pslmasEMPNO.AsString+''' ');
  Query_Gen.SQL.ADD('   GROUP BY CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO ; ');
  Query_Gen.SQL.ADD(' BEGIN ');
  Query_Gen.SQL.ADD('   FOR R IN CUR LOOP ');
  Query_Gen.SQL.ADD('     UPDATE PSLMAS ');
  Query_Gen.SQL.ADD('     SET STISUM    = R.EXCPAMT, ');
  Query_Gen.SQL.ADD('         STIRISUM  = R.EXIAMT,  ');
  Query_Gen.SQL.ADD('         STRAMT    = DECODE(STRAMT, 0, 0, CEIL(ROUND(((NVL(STRAMT, 0) - '+ FloatToStr(HapExcpamt) + ' ');
  Query_Gen.SQL.ADD('                   - ' + FloatToStr(NE_excpamt1.Value) + ') ');
  Query_Gen.SQL.ADD('                   / (1 - ' + FloatToStr(HapExcpamt) + ' / NVL(STRAMT, 0))),9)*0.1)*10) ');
  Query_Gen.SQL.ADD('     WHERE CORPNAME = R.CORPNAME ');
  Query_Gen.SQL.ADD('       AND DIVSEQNUM= R.DIVSEQNUM');
  Query_Gen.SQL.ADD('       AND STCLASS  = R.STCLASS  ');
  Query_Gen.SQL.ADD('       AND STLORG   = R.STLORG   ');
  Query_Gen.SQL.ADD('       AND EMPNO    = R.EMPNO;   ');
  Query_Gen.SQL.ADD('   END LOOP; ');
  Query_Gen.SQL.ADD(' END; ');
  Query_Gen.ExecSQL;

  //상환잔액 = 대출금액 - 상환원금(누적)
  //대출잔액(대출액-중도상환금)
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('UPDATE PSLMAS ');
  Query_Gen.SQL.ADD('   SET STIRAMT = (NVL(STLAMT, 0)  - NVL(STISUM,0)) ');
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') ');
  Query_Gen.ExecSQL;
  ProgressBar1.Position := 100;
  Application.ProcessMessages;

  Save_corpname  := Query_pslmasCORPNAME.AsString;
  Save_divseqnum := Query_pslmasDIVSEQNUM.AsInteger;
  Save_stclass   := Query_pslmasSTCLASS.AsString;
  Save_STLORG    := Query_pslmasSTLORG.AsString;
  Save_exdate    := ME_exmdate.Text;
  Query_pslmas.Close;
  Query_pslmas.Open;
  Compute_tot;

  if Query_pslmas.Locate('CORPNAME;DIVSEQNUM;STCLASS;STLORG',  // 대부내역 locate
                 VarArrayOf([Save_corpname, Save_divseqnum, Save_stclass, Save_STLORG]), [loPartialKey])
  then
    DBG_pslmas.SetFocus;

  BB_CancelClick(Sender); // 상환이력의 <취소>

  ProgressBar1.Position := 0;
  Application.ProcessMessages;
end;

procedure TMainForm.B_CancelClick(Sender: TObject);
var
  MaxExmdate   : String;
  MaxHisExdate : String;
  MaxHisExmdate: String;
  CntPsemhis   : String;
begin

  if Query_pslmas.Active = False then
  begin
    MessageBox(handle, '먼저 대부내역 자료를 선택하세요',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_pslmas.RecordCount = 0 then
  begin
    MessageBox(handle, '먼저 대부내역 자료를 선택하세요',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_psemhis.Active = False then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;
  if Query_psemhis.RecordCount = 0 then
  begin
    MessageBox(handle, '먼저 상환이력이 있는 대부내역을 선택하세요.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  Query_Bas.Close;
  Query_Bas.SQL.Clear;
  Query_Bas.SQL.ADD('SELECT STCFDATE, STCTDATE '); // 기산일자from, to
  Query_Bas.SQL.Add('FROM PSHLBAS ');   // 대부기준
  Query_Bas.SQL.Add('WHERE ');
  Query_Bas.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Bas.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Bas.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Bas.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
  Query_Bas.SQL.Add('      (:exmdate between stcfdate and stctdate) ');
  Query_Bas.ParamByName('exmdate').AsString := ME_exmdate.Text;
  Query_Bas.Open;

  if (Query_Bas.Eof) And (Next_Month(MAX_exdate) <> Query_psemhisEXDATE.AsString) then
  begin
    MessageBox(handle, '최종상환월+1월로 <대부내역>의 중도상환 취소작업만 가능합니다',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  //최종자료부터 순차적으로 삭제(HeeYong : 20110704)
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.ADD('Select max(EXMDATE) EXMDATE FROM PSEMHIS ');  // 월별상환이력
  Query_Gen.SQL.Add('WHERE ');
  Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
  Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
  Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
  Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
  Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
  Query_Gen.open;

  MaxExmdate := '';
  MaxExmdate := Query_Gen.fieldbyname('Exmdate').AsString;

  if MaxExmdate <> ME_exmdate.Text then
  begin
    MessageBox(handle, '최종자료부터 순차적으로 중도금취소가 가능합니다.',
                       '작업안내', MB_ICONWARNING);
    System.Exit;
  end;

  if Application.MessageBox('선택한 자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK
  then
  begin
    if Query_psemhisEXMDATE.Asstring <> '' then
    begin
         Query_Gen.Close;
         Query_Gen.SQL.Clear;
         Query_Gen.SQL.ADD('Select max(EXMDATE) EXMDATE FROM PSEMHIS ');  // 월별상환이력
         Query_Gen.SQL.Add('WHERE ');
         Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
         Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
         Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
         Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
         Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
         Query_Gen.SQL.Add('      (EXMDATE   < '''+Query_psemhisEXMDATE.Asstring+''')   ');  {중도상환일자}
         Query_Gen.open;

         MaxExmdate := '';
         MaxExmdate := Query_Gen.fieldbyname('Exmdate').AsString;

         if MaxExmdate <> '' then
         begin
              // 대부마스터 갱신
              Query_Gen.Close;
              Query_Gen.SQL.Clear;
              Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
              Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
              Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
              Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
              Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
              Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
              Query_Gen.SQL.ADD('       FROM PSEMHIS ');
              Query_Gen.SQL.ADD('       WHERE ');
              Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
              Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
              Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
              Query_Gen.SQL.Add('WHERE ');
              Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
              Query_Gen.ExecSQL;
         end
         else
         begin
              // 대부마스터 갱신
              Query_Gen.Close;
              Query_Gen.SQL.Clear;
              Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
              Query_Gen.SQL.ADD('   SET (EXDATE, EXCPAMT, STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
              Query_Gen.SQL.ADD('       SELECT '''', 0,      ');
              Query_Gen.SQL.ADD('              A.STISUM   - EXCPAMT, ');
              Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT,  ');
              Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
              Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
              Query_Gen.SQL.ADD('       FROM PSEMHIS ');
              Query_Gen.SQL.ADD('       WHERE ');
              Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and '); {상환월}
              Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('          (EXMDATE   = '''+Query_psemhisEXMDATE.Asstring+''') and ');  {중도상환일자}
              Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');  {대부기관}
              Query_Gen.SQL.Add('WHERE ');
              Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
              Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
              Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
              Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
              Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
              Query_Gen.ExecSQL;
         end;
    end
    else
    begin
      // 대부마스터 갱신
      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.ADD('UPDATE PSLMAS A ');
      Query_Gen.SQL.ADD('   SET (STISUM, STIRISUM, STIRAMT, WRITETIME, WRITEMAN) = ( ');
      Query_Gen.SQL.ADD('       SELECT A.STISUM   - EXCPAMT, ');
      Query_Gen.SQL.ADD('              A.STIRISUM - EXIAMT, ');
      Query_Gen.SQL.ADD('              A.STIRAMT  + EXCPAMT, ');
      Query_Gen.SQL.ADD('              '''+Copy(GSsysdate,1,14)+''', '''+pempno+''' ');
      Query_Gen.SQL.ADD('       FROM PSEMHIS ');
      Query_Gen.SQL.ADD('       WHERE ');
      Query_Gen.SQL.ADD('          (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('          (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and ');
      Query_Gen.SQL.Add('          (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('          (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('          (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
      Query_Gen.SQL.Add('          (EXMDATE IS NULL) and ');
      Query_Gen.SQL.Add('          (STLORG    = '''+Query_pslmasSTLORG.AsString+''')) ');
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
      Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');
      Query_Gen.ExecSQL;
    end;

    //최종상환일, 상환금(누적) 조회
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('SELECT MAX(EXMDATE) EXMDATE FROM PSEMHIS ');
    Query_Gen.SQL.ADD('WHERE ');
    Query_Gen.SQL.ADD('  (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('  (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('  (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('  (STLORG    = '''+Query_pslmasSTLORG.AsString+''')  and ');
    Query_Gen.SQL.Add('  (EMPNO     = '''+Query_pslmasEMPNO.AsString+''')   and ');
    Query_Gen.SQL.Add('  (EXMDATE IS NOT NULL) ');
    Query_Gen.Open;

    MaxHisExmdate := '';
    MaxHisExmdate := Query_Gen.fieldbyname('EXMDATE').AsString;

    if MaxHisExmdate <> '' then
    begin
      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.ADD(' DECLARE CURSOR CUR IS ');
      Query_Gen.SQL.ADD('   SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO, ');
      Query_Gen.SQL.ADD('          STRAMT ');
      Query_Gen.SQL.ADD('   FROM PSEMHIS ');
      Query_Gen.SQL.ADD('   WHERE CORPNAME  = '''+Query_pslmasCorpName.AsString + ''' ');
      Query_Gen.SQL.ADD('     AND DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+' ');
      Query_Gen.SQL.ADD('     AND STCLASS   = '''+Query_pslmasSTCLASS.AsString+''' ');
      Query_Gen.SQL.ADD('     AND EMPNO     = '''+Query_pslmasEMPNO.AsString+''' ');
      Query_Gen.SQL.ADD('     AND STLORG    = '''+Query_pslmasSTLORG.AsString+''' ');
      Query_Gen.SQL.ADD('     AND EXMDATE   = '''+MaxHisExmdate+'''; ');
      Query_Gen.SQL.ADD(' BEGIN ');
      Query_Gen.SQL.ADD('   FOR R IN CUR LOOP ');
      Query_Gen.SQL.ADD('     UPDATE PSLMAS   ');
      Query_Gen.SQL.ADD('     SET STRAMT     = DECODE(R.STRAMT, 0, STIRAMT, R.STRAMT)');
      Query_Gen.SQL.ADD('     WHERE CORPNAME = R.CORPNAME ');
      Query_Gen.SQL.ADD('       AND DIVSEQNUM= R.DIVSEQNUM');
      Query_Gen.SQL.ADD('       AND STCLASS  = R.STCLASS  ');
      Query_Gen.SQL.ADD('       AND STLORG   = R.STLORG   ');
      Query_Gen.SQL.ADD('       AND EMPNO    = R.EMPNO;   ');
      Query_Gen.SQL.ADD('   END LOOP; ');
      Query_Gen.SQL.ADD(' END; ');
      Query_Gen.ExecSQL;
    End;

    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('DELETE FROM PSEMHIS ');  // 월별상환이력
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (EXDATE    = '''+Query_psemhisEXDATE.AsString+''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');
    if Query_psemhisEXMDATE.Asstring <> '' then
    Query_Gen.SQL.Add('  and (EXMDATE   = '''+Query_psemhisEXMDATE.AsString+''') ')
      else
    Query_Gen.SQL.Add('  and (EXMDATE IS NULL) ');
    Query_Gen.ExecSQL;

    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.ADD('Select MAX(exdate) MaxHisExdate FROM PSEMHIS ');  // 월별상환이력
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.ADD('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
    Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
    Query_Gen.SQL.Add('      (STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
    Query_Gen.SQL.Add('      (EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
    Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''')');
    Query_Gen.open;

    MaxHisExdate := '';
    MaxHisExdate := Query_Gen.fieldbyname('MaxHisExdate').AsString;

    if MaxHisExdate <> '' then
    begin
      //중도금취소 후 자료존재여부 확인.
      Query_Gen.Close;
      Query_Gen.SQL.Clear;

      Query_Gen.SQL.ADD('Select COUNT(exdate) CNT FROM PSEMHIS A ');  // 월별상환이력
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
      Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''') and ');
      Query_Gen.SQL.Add('      (A.EXDATE    = '''+copy(ME_exmdate.Text,1,6)+''') and');
      Query_Gen.SQL.Add('      (A.EXMDATE IS NOT NULL) ');
      Query_Gen.open;

      CntPsemhis := '';
      CntPsemhis := Query_Gen.fieldbyname('CNT').AsString;

      //전월기준미상환액 : 해당월의 이력.최초입력자료만 저장
      //전월기준미상환액 = 대출금 - 상환원금(누적)
      if CntPsemhis = '0' then
      begin
        Query_Gen.Close;
        Query_Gen.SQL.Clear;
        Query_Gen.SQL.ADD('UPDATE PSLMAS A');
        Query_Gen.SQL.ADD('   SET A.STBIAMT  = (NVL(A.STLAMT, 0) - NVL(A.STISUM,0)) + ');
        Query_Gen.SQL.ADD('   (SELECT NVL(SUM(EXCPAMT), 0) FROM PSEMHIS ');
        Query_Gen.SQL.Add(    'WHERE ');
        Query_Gen.SQL.ADD('          (CORPNAME  = A.CORPNAME)  AND');
        Query_Gen.SQL.Add('          (DIVSEQNUM = A.DIVSEQNUM) AND');
        Query_Gen.SQL.Add('          (STCLASS   = A.STCLASS)   AND');
        Query_Gen.SQL.Add('          (STLORG    = A.STLORG)    AND');
        Query_Gen.SQL.Add('          (EMPNO     = A.EMPNO)     AND');
        Query_Gen.SQL.Add('          (EXDATE    =  '''+Copy(MaxHisExmdate,1,6)+''') AND');
        Query_Gen.SQL.Add('          (EXMDATE IS NOT NULL)) ');
        Query_Gen.SQL.Add('WHERE ');
        Query_Gen.SQL.ADD('      (A.CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
        Query_Gen.SQL.Add('      (A.DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+') and ');
        Query_Gen.SQL.Add('      (A.STCLASS   = '''+Query_pslmasSTCLASS.AsString+''') and ');
        Query_Gen.SQL.Add('      (A.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and');
        Query_Gen.SQL.Add('      (A.EMPNO     = '''+Query_pslmasEMPNO.AsString+''')  ');
        Query_Gen.ExecSQL;
      End;

      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.ADD(' DECLARE CURSOR CUR IS ');
      Query_Gen.SQL.ADD('   SELECT CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO, ');
      Query_Gen.SQL.ADD('          MAX(EXMDATE) EXMDATE, SUM(EXCPAMT) EXCPAMT ');
      Query_Gen.SQL.ADD('   FROM PSEMHIS ');
      Query_Gen.SQL.ADD('   WHERE CORPNAME  = '''+Query_pslmasCorpName.AsString + ''' ');
      Query_Gen.SQL.ADD('     AND DIVSEQNUM = '+IntToStr(Query_pslmasDIVSEQNUM.AsInteger)+' ');
      Query_Gen.SQL.ADD('     AND STCLASS   = '''+Query_pslmasSTCLASS.AsString+''' ');
      Query_Gen.SQL.ADD('     AND EMPNO     = '''+Query_pslmasEMPNO.AsString+''' ');
      Query_Gen.SQL.ADD('     AND STLORG    = '''+Query_pslmasSTLORG.AsString+''' ');
      Query_Gen.SQL.ADD('     AND EXDATE    = '''+Copy(MaxHisExmdate,1,6)+''' ');
      Query_Gen.SQL.ADD('   GROUP BY CORPNAME, DIVSEQNUM, STCLASS, STLORG, EMPNO; ');
      Query_Gen.SQL.ADD(' BEGIN ');
      Query_Gen.SQL.ADD('   FOR R IN CUR LOOP ');
      Query_Gen.SQL.ADD('     UPDATE PSLMAS ');
      Query_Gen.SQL.ADD('     SET EXDATE     = R.EXMDATE, ');
      Query_Gen.SQL.ADD('         EXCPAMT    = R.EXCPAMT  ');
      Query_Gen.SQL.ADD('     WHERE CORPNAME = R.CORPNAME ');
      Query_Gen.SQL.ADD('       AND DIVSEQNUM= R.DIVSEQNUM');
      Query_Gen.SQL.ADD('       AND STCLASS  = R.STCLASS  ');
      Query_Gen.SQL.ADD('       AND STLORG   = R.STLORG   ');
      Query_Gen.SQL.ADD('       AND EMPNO    = R.EMPNO;   ');
      Query_Gen.SQL.ADD('   END LOOP; ');
      Query_Gen.SQL.ADD(' END; ');
      Query_Gen.ExecSQL;
    end;

    Save_divseqnum := Query_pslmasDIVSEQNUM.AsInteger;
    Save_stclass   := Query_pslmasSTCLASS.AsString;
    Save_STLORG    := Query_pslmasSTLORG.AsString;
    Save_exdate    := Query_psemhisEXDATE.AsString;
    Query_pslmas.Close;
    Query_pslmas.Open;
    Compute_tot;

    if Query_pslmas.Locate('CORPNAME;DIVSEQNUM;STCLASS;STLORG',  // 대부내역 locate
                   VarArrayOf([Save_corpname, Save_divseqnum, Save_stclass, Save_STLORG]), [loPartialKey])
    then
      DBG_pslmas.SetFocus;
    BB_CancelClick(Sender); // 상환이력 locate
  end;
end;

{-------------------------------- EVENT -----------------------------}
procedure TMainForm.CB_exynChange(Sender: TObject);
begin
  CB_exyn.Text := YesNoCombo(CB_exyn.Text);
end;
procedure TMainForm.CB_exynDblClick(Sender: TObject);
begin
  CB_exyn.Text := YesNoComboDC(CB_exyn.Text);
end;

procedure TMainForm.CB_cpdedynChange(Sender: TObject);
begin
  CB_cpdedyn.Text := YesNoCombo(CB_cpdedyn.Text);
end;
procedure TMainForm.CB_cpdedynDblClick(Sender: TObject);
begin
  CB_cpdedyn.Text := YesNoComboDC(CB_cpdedyn.Text);
end;

procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key <> #13 then
    System.Exit;
  key := #0;
  {
  if (Length(E_empno.Text) <> 4) then
  begin
    MessageBox(Handle, '사번을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
    System.Exit;
  end;
  }
// 일시수정(업무순서때문: 예탁인출 후 대부상환이 이루어져야 하나 반대로 실시)
{  DataAllClear;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT a.KORNAME, b.PAYCL, b.DEPTCODE, c.DEPTNAME ');
  Query_Gen.SQL.Add('FROM PSSTMAS a, PKMPMAS b, PYCDEPT c ');
  Query_Gen.SQL.Add('WHERE (a.EMPNO = '''+E_empno.Text+''') and ');
  Query_Gen.SQL.Add('      (a.EMPNO = b.EMPNO) and ');
  Query_Gen.SQL.Add('      (b.ORGNUM   = c.ORGNUM(+)) and ');
  Query_Gen.SQL.Add('      (b.DEPTCODE = c.DEPTCODE(+)) ');
  Query_Gen.Open;   }
  DataAllClear;
  Query_Gen.Close;
  Query_Gen.SQL.Clear;
  Query_Gen.SQL.Add('SELECT b.empno, b.KORNAME, b.PAYCL, b.DEPTCODE, c.DEPTNAME ');
  Query_Gen.SQL.Add('FROM PIMPMAS b, PYCDEPT c                         ');
  Query_Gen.SQL.Add('WHERE                                             ');
  Query_Gen.SQL.Add('      (b.EMPNO like :cond OR b.korname like :cond)');
  Query_Gen.SQL.Add('and   (b.ORGNUM   = c.ORGNUM(+)  ');
  Query_Gen.SQL.Add('and    b.DEPTCODE = c.DEPTCODE(+)) ');
  Query_Gen.ParamByName('cond').AsString := E_empno.Text + '%';
  Query_Gen.Open;
  if Query_Gen.RecordCount = 1 then
  begin
    E_empno.Text           := Query_Gen.FieldByName('empno').AsString;
    P_korname.Caption      := Query_Gen.FieldByName('KORNAME').AsString;
    P_paycl.Caption        := Query_Gen.FieldByName('PAYCL').AsString;
    P_payclNAME.Caption    := Read_codeName(codefr,'I112', Query_Gen.FieldByName('PAYCL').AsString);
    P_deptcode.Caption     := Query_Gen.FieldByName('DEPTCODE').AsString;
    P_deptcodeNAME.Caption := Query_Gen.FieldByName('DEPTNAME').AsString;
    Query_pslmas.Close;
    Query_pslmas.ParamByName('P_empno').AsString := Query_Gen.FieldByName('empno').AsString;
    Query_pslmas.Open;
    Compute_tot;
  end;

  if Query_Gen.RecordCount > 1 then
  begin
    Fkyempno.Eempno.Text := E_empno.Text;
    Fkyempno.ShowModal;
    if Fkyempno.GIcloseS <> -1 then
    begin
       DataAllClear;
       E_empno.Text           := Fkyempno.GSempnoS;
       P_korname.Caption      := Fkyempno.GSkornameS;
       P_paycl.Caption        := Fkyempno.GSpayclS;
       P_payclNAME.Caption    := read_codename(codefr,'I112', Fkyempno.GSpayclS);
       P_deptcode.Caption     := Fkyempno.GSdeptcodeS;
       P_deptcodeNAME.Caption := Fkyempno.GSdeptnameS;
       Query_pslmas.Close;
       Query_pslmas.ParamByName('P_empno').AsString := E_empno.Text;
       Query_pslmas.Open;
       Compute_tot;
     end;
  end;

  if Query_Gen.RecordCount = 0 then
  begin
    Query_pslmas.Close;
    MessageBox(Handle, '해당 사원의 자료가 대부마스터에 없습니다.', '입력오류', MB_ICONWARNING);
    P_korname.Caption := '';
  end;
  Query_Gen.Close;
end;
procedure TMainForm.SB_empnoClick(Sender: TObject);
begin
  Fkyempno.Eempno.Text := E_empno.Text;
  Fkyempno.ShowModal;
  if Fkyempno.GIcloseS <> -1 then
  begin
    DataAllClear;
    E_empno.Text           := Fkyempno.GSempnoS;
    P_korname.Caption      := Fkyempno.GSkornameS;
    P_paycl.Caption        := Fkyempno.GSpayclS;
    P_payclNAME.Caption    := read_codename(codefr,'I112', Fkyempno.GSpayclS);
    P_deptcode.Caption     := Fkyempno.GSdeptcodeS;
    P_deptcodeNAME.Caption := Fkyempno.GSdeptnameS;
    Query_pslmas.Close;
    Query_pslmas.ParamByName('P_empno').AsString := E_empno.Text;
    Query_pslmas.Open;
    Compute_tot;
  end;
end;

procedure TMainForm.DS_pslmasDataChange(Sender: TObject; Field: TField);
begin
  BB_save.Enabled   := False;
  BB_cancel.Enabled := False;
  BB_delete.Enabled := False;
  if Query_pslmas.Eof then
  begin
    Query_psemhis.Close;
    E_BankCode.Text    := '';
    P_BankName.Caption := '';
    E_BankAcnt.Text    := '';
    System.Exit;
  end;

  {
  if Query_pslmas.RecordCount = 0 then
  begin
    Query_psemhis.Close;
    E_BankCode.Text    := '';
    P_BankName.Caption := '';
    E_BankAcnt.Text    := '';
    System.Exit;
  end;
  }
  ME_exmdate.Text    := '';
  NE_excpamt1.Value  := 0;
  E_BankCode.Text    := Query_pslmas.FieldByName('bankcode').AsString;
  P_BankName.Caption := read_codename(codefr,'K910',Query_pslmas.FieldByName('bankcode').AsString);
  E_BankAcnt.Text    := Query_pslmas.FieldByName('bankacnt').AsString;

  Query_psemhis.Close;  // 상환이력 조회
  Query_psemhis.ParamByName('P_corpname').AsString := Query_pslmasCORPNAME.AsString;
  Query_psemhis.ParamByName('P_divseqnum').AsFloat := Query_pslmasDIVSEQNUM.AsFloat;
  Query_psemhis.ParamByName('P_stclass').AsString  := Query_pslmasSTCLASS.AsString;
  Query_psemhis.ParamByName('P_empno').AsString    := Query_pslmasEMPNO.AsString;
  Query_psemhis.ParamByName('P_stlorg').AsString   := Query_pslmasSTLORG.AsString;
  Query_psemhis.Open;
end;

procedure TMainForm.Query_pslmasCalcFields(DataSet: TDataSet);
begin
  if Query_pslmasSTCLASS.AsString = '1' then {주식구분}
    Query_pslmasstclassNAME.AsString := '사주우선'
  else if Query_pslmasSTCLASS.AsString = '2' then
    Query_pslmasstclassNAME.AsString := '사주실권'
  else if Query_pslmasSTCLASS.AsString = '3' then
    Query_pslmasstclassNAME.AsString := '주주우선'
  else if Query_pslmasSTCLASS.AsString = '4' then
    Query_pslmasstclassNAME.AsString := '주주우선(예탁)'
  else if Query_pslmasSTCLASS.AsString = '5' then
    Query_pslmasstclassNAME.AsString := '주주우선(비예탁)'
  else
    Query_pslmasstclassNAME.AsString := '';

  Query_pslmasstlorgNAME.AsString := {대부기관}
              read_codename(codefr,'K910', Query_pslmasSTLORG.AsString);
end;

procedure TMainForm.SB_exmdateClick(Sender: TObject);
var
  calendar: Tcalendar;
begin
  try
    calendar := Tcalendar.Create(Self);
    calendar.ShowModal;
    if calendar.DayCaption <> '' then
      ME_exmdate.Text := calendar.DayCaption;
  finally
    calendar.free;
  end;
end;
procedure TMainForm.ME_exmdateExit(Sender: TObject);
var
  FromMonth, ToMonth, stclass: String;
  Divseqnum: Integer;
begin
  if (ME_exmdate.Text < '') and
     (NE_excpamt1.Value = 0) and
     (E_empno.Text <> '')
  then
  begin
    Query_Gen.Close;
    Query_Gen.SQL.Clear;
    Query_Gen.SQL.Add('SELECT b.DIVSEQNUM, b.STCLASS, ');
    Query_Gen.SQL.Add('       (MIN(b.STEMONTH)) MIN_STEMONTH, (MAX(b.STEMONTH)) MAX_STEMONTH ');
    Query_Gen.SQL.Add('FROM PSLMAS a, PSHEPBAS b ');  // 대부마스터, 원금상환기준
    Query_Gen.SQL.Add('WHERE ');
    Query_Gen.SQL.Add('      (a.corpname  = '''+Query_pslmasCORPNAME.AsString+''') and ');
    Query_Gen.SQL.Add('      (a.EMPNO     = '''+E_empno.Text+''') and ');
    Query_Gen.SQL.Add('      (a.STLORG    = '''+Query_pslmasSTLORG.AsString+''') and ');  {대부기관}
    Query_Gen.SQL.Add('      (a.corpname  = b.corpname) and ');
    Query_Gen.SQL.Add('      (a.DIVSEQNUM = b.DIVSEQNUM) and ');
    Query_Gen.SQL.Add('      (a.STCLASS   = b.STCLASS) and ');
    Query_Gen.SQL.Add('      (a.STLORG    = b.STLORG) ');  {대부기관}
    Query_Gen.Open;
    Divseqnum := Query_Gen.FieldByName('DIVSEQNUM').AsInteger;
    Stclass   := Query_Gen.FieldByName('STCLASS').AsString;
    FromMonth := Query_Gen.FieldByName('MIN_STEMONTH').AsString;
    ToMonth   := Query_Gen.FieldByName('MAX_STEMONTH').AsString;
    Query_Gen.Close;
    if (FromMonth <= copy(ME_exmdate.Text,1,6)) and
       (ToMonth   >= copy(ME_exmdate.Text,1,6))
    then
    begin
      Query_Gen.Close;
      Query_Gen.SQL.Clear;
      Query_Gen.SQL.Add('SELECT STIRAMT ');  // 대부마스터.상환잔액
      Query_Gen.SQL.Add('FROM   PSLMAS ');
      Query_Gen.SQL.Add('WHERE ');
      Query_Gen.SQL.Add('      (CORPNAME  = '''+Query_pslmasCorpName.AsString + ''') and ');
      Query_Gen.SQL.Add('      (DIVSEQNUM = '+IntToStr(Divseqnum)+') and ');
      Query_Gen.SQL.Add('      (STCLASS   = '''+Stclass+''') and ');
      Query_Gen.SQL.Add('      (EMPNO     = '''+E_empno.Text+''') and ');
      Query_Gen.SQL.Add('      (STLORG    = '''+Query_pslmasSTLORG.AsString+''') ');  {대부기관}
      Query_Gen.Open;
      if Query_Gen.FieldByName('STIRAMT').AsFloat > 0 then
        NE_excpamt1.Value := Query_Gen.FieldByName('STIRAMT').AsFloat;
      Query_Gen.Close;
    end;
  end;
end;

procedure TMainForm.Query_psemhisCalcFields(DataSet: TDataSet);
begin
  if Query_psemhisEXCPCS.AsString = '1' then
    Query_psemhisEXCPCSNAME.AsString := '정기'
  else if Query_psemhisEXCPCS.AsString = '2' then
    Query_psemhisEXCPCSNAME.AsString := '중도'
  else
    Query_psemhisEXCPCSNAME.AsString := '';
end;
procedure TMainForm.DS_psemhisDataChange(Sender: TObject; Field: TField);
begin
  BB_save.Enabled   := False;
  BB_cancel.Enabled := False;
  BB_delete.Enabled := False;
  {
  if Query_psemhis.RecordCount = 0 then
    System.Exit;
  }
  if Query_psemhis.eof then
  begin
       NE_exiamt.Value   := 0;
       NE_excpamt2.Value := 0;
       CB_cpdedyn.Text   := 'N';
       CB_exyn.Text      := 'N';
       System.Exit;
  end;


  // 최종상환월과 현재 상환월이 같아야만 작업가능(저장,삭제,취소 버튼)
  if (Max_exdate = '') or
     (Max_exdate = Query_psemhisEXDATE.AsString) then
  begin
    BB_save.Enabled   := True;
    BB_cancel.Enabled := True;
    BB_delete.Enabled := True;
  end;
  NE_exiamt.Value   := Query_psemhisEXIAMT.AsFloat;
  NE_excpamt2.Value := Query_psemhisEXCPAMT.AsFloat;
  CB_cpdedyn.Text   := Query_psemhisCPDEDYN.AsString;
  CB_exyn.Text      := Query_psemhisEXYN.AsString;
  E_exdesc.Text     := Query_psemhisEXDESC.AsString;

  ME_exmdate.Text   := Query_psemhisEXMDATE.AsString;
  NE_excpamt1.Value := Query_psemhisEXCPAMT.AsFloat;
end;

procedure TMainForm.SB_BankCodeClick(Sender: TObject);
begin
     Fkycode1 := TFkycode1.Create(Self);
  Try
    Fkycode1.FormData := '[은행코드조회]';
    Fkycode1.DataVal1 := 'K910';
    Fkycode1.ShowModal;
  if Fkycode1.CloseChk = -1 then Exit;
    E_bankcode.Text    := Fkycode1.code;
    P_bankname.Caption := Fkycode1.CodeName;
  Finally
    Fkycode1.Free;
  end;  
end;

procedure TMainForm.BMasSaveClick(Sender: TObject);
begin
    SqlStr := 'update pslmas ' + #13  + #13 +
              'set    bankcode = :bankcode, bankacnt = :bankacnt ' + #13  + #13 +
              'where  corpname = :corpname ' + #13  + #13 +
              'and    divseqnum = :divseqnum ' + #13  + #13 +
              'and    empno = :empno ' + #13  + #13 +
              'and    stclass = :stclass ' + #13  + #13 +
              'and    stlorg = :stlorg ';
    Query_Gen.Close;
    Query_Gen.Sql.Clear;
    Query_Gen.Sql.Add(sqlstr);
    Query_Gen.ParamByName('bankcode').AsString   := e_bankcode.Text;
    Query_Gen.ParamByName('bankacnt').AsString   := e_bankacnt.Text;
    Query_Gen.ParamByName('corpname').AsString   := Query_pslmasCorpName.AsString;
    Query_Gen.ParamByName('divseqnum').AsInteger := Query_pslmasdivseqnum.AsInteger;
    Query_Gen.ParamByName('empno').AsString      := Query_pslmasempno.AsString;
    Query_Gen.ParamByName('stclass').AsString    := Query_pslmasstClass.AsString;
    Query_Gen.ParamByName('stlorg').AsString     := Query_pslmasStlorg.AsString;
    Query_Gen.ExecSql;
    Phelpmsg.Caption := '  은행과 은행계좌에 대한 작업내용이 저장되었습니다..';
end;

end.

