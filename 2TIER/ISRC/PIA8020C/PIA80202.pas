unit PIA80202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, Grids, DBGrids,
  MemDS, DBAccess, Ora;

type
    TPrintForm = class(TForm)
    DataSource1: TDataSource;
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRSubDetail1: TQRBand;
    deptname: TQRDBText;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    DIRECTOR: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel34: TQRLabel;
    QRShape47: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRL_DIRECTOR: TQRLabel;
    QRL_HBU: TQRLabel;
    QRShape69: TQRShape;
    QRBand1: TQRBand;
    QRLabel54: TQRLabel;
    lbl_writeDay: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRL_NBU: TQRLabel;
    QRL_BU: TQRLabel;
    QRShape18: TQRShape;
    QRShape29: TQRShape;
    QRShape38: TQRShape;
    QRShape51: TQRShape;
    QRShape60: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape71: TQRShape;
    QRShape81: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel73: TQRLabel;
    QRShape36: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel80: TQRLabel;
    QRShape41: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape42: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel87: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRL_HCHA: TQRLabel;
    QRShape25: TQRShape;
    QRL_NCHA: TQRLabel;
    QRL_CHA: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRL_HGOA: TQRLabel;
    QRShape66: TQRShape;
    QRL_NGOA: TQRLabel;
    QRL_GOA: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRL_HDAE: TQRLabel;
    QRShape87: TQRShape;
    QRL_NDAE: TQRLabel;
    QRL_DAE: TQRLabel;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRL_HSA: TQRLabel;
    QRShape95: TQRShape;
    QRL_NSA: TQRLabel;
    QRL_SA: TQRLabel;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRL_HSP: TQRLabel;
    QRShape103: TQRShape;
    QRL_NSP: TQRLabel;
    QRL_SP: TQRLabel;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRL_HSO: TQRLabel;
    QRL_NSO: TQRLabel;
    QRL_SO: TQRLabel;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape117: TQRShape;
    QRShape120: TQRShape;
    QRL_HJ: TQRLabel;
    QRShape121: TQRShape;
    QRL_HPQ: TQRLabel;
    QRShape123: TQRShape;
    QRL_HY: TQRLabel;
    QRShape125: TQRShape;
    QRL_HBEALL: TQRLabel;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRL_HALL: TQRLabel;
    HWON_BU: TQRDBText;
    QRShape8: TQRShape;
    NON_BU: TQRDBText;
    QRShape9: TQRShape;
    BU: TQRDBText;
    QRShape28: TQRShape;
    QRDBText4: TQRDBText;
    QRShape127: TQRShape;
    HWON_CHA: TQRDBText;
    QRShape128: TQRShape;
    NON_CHA: TQRDBText;
    QRShape131: TQRShape;
    CHA: TQRDBText;
    QRShape132: TQRShape;
    QRDBText8: TQRDBText;
    QRShape133: TQRShape;
    HWON_GOA: TQRDBText;
    QRShape134: TQRShape;
    NON_GOA: TQRDBText;
    QRShape135: TQRShape;
    GOA: TQRDBText;
    QRShape136: TQRShape;
    QRDBText12: TQRDBText;
    QRShape137: TQRShape;
    HWON_DAE: TQRDBText;
    QRShape138: TQRShape;
    NON_DAE: TQRDBText;
    QRShape139: TQRShape;
    DAE: TQRDBText;
    QRShape140: TQRShape;
    QRDBText16: TQRDBText;
    QRShape141: TQRShape;
    HWON_SA: TQRDBText;
    QRShape142: TQRShape;
    NON_SA: TQRDBText;
    QRShape143: TQRShape;
    SA: TQRDBText;
    QRShape144: TQRShape;
    QRDBText20: TQRDBText;
    QRShape145: TQRShape;
    HWON_SP: TQRDBText;
    QRShape146: TQRShape;
    NON_SP: TQRDBText;
    QRShape147: TQRShape;
    SP: TQRDBText;
    QRShape148: TQRShape;
    QRDBText24: TQRDBText;
    QRShape149: TQRShape;
    Hwon_SO: TQRDBText;
    QRShape150: TQRShape;
    NON_SO: TQRDBText;
    QRShape151: TQRShape;
    SO: TQRDBText;
    QRShape152: TQRShape;
    QRDBText28: TQRDBText;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    HWON_J: TQRDBText;
    QRShape155: TQRShape;
    HWON_PQ: TQRDBText;
    QRShape156: TQRShape;
    HWON_Y: TQRDBText;
    QRShape157: TQRShape;
    HWON_BEALL: TQRDBText;
    HWON_ALL: TQRDBText;
    QRShape2: TQRShape;
    QRLabel40: TQRLabel;
    QRShape48: TQRShape;
    QRShape70: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape79: TQRShape;
    la_ju: TQRLabel;
    la_hujik: TQRLabel;
    la_mi: TQRLabel;
    la_sm2: TQRLabel;
    la_bo: TQRLabel;
    la_ex: TQRLabel;
    la_sub: TQRLabel;
    la_sum: TQRLabel;
    QRShape80: TQRShape;
    QRLabel51: TQRLabel;
    la_im: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape74: TQRShape;
    QRShape7: TQRShape;
    QRL_buper: TQRLabel;
    QRL_chper: TQRLabel;
    QRL_gaper: TQRLabel;
    QRL_deper: TQRLabel;
    QRL_saper: TQRLabel;
    QRL_spper: TQRLabel;
    QRL_soper: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    OraQuery1: TOraQuery;
    Qry_DetailSum: TOraQuery;
    Qry_DetailSumDEPTLEVEL: TStringField;
    Qry_DetailSumDEPTCODE: TStringField;
    Qry_DetailSumDEPTNAME: TStringField;
    Qry_DetailSumDIRECTOR: TFloatField;
    Qry_DetailSumHWON_BU: TFloatField;
    Qry_DetailSumNON_BU: TFloatField;
    Qry_DetailSumBU: TFloatField;
    Qry_DetailSumHWON_CHA: TFloatField;
    Qry_DetailSumNON_CHA: TFloatField;
    Qry_DetailSumCHA: TFloatField;
    Qry_DetailSumHWON_GOA: TFloatField;
    Qry_DetailSumNON_GOA: TFloatField;
    Qry_DetailSumGOA: TFloatField;
    Qry_DetailSumHWON_DAE: TFloatField;
    Qry_DetailSumNON_DAE: TFloatField;
    Qry_DetailSumDAE: TFloatField;
    Qry_DetailSumHWON_SA: TFloatField;
    Qry_DetailSumNON_SA: TFloatField;
    Qry_DetailSumSA: TFloatField;
    Qry_DetailSumHWON_: TFloatField;
    Qry_DetailSumNON_: TFloatField;
    Qry_DetailSumFloatField: TFloatField;
    Qry_DetailSumHWON_SO: TFloatField;
    Qry_DetailSumNON_SO: TFloatField;
    Qry_DetailSumSO: TFloatField;
    Qry_DetailSumHWON_J: TFloatField;
    Qry_DetailSumHWON_PQ: TFloatField;
    Qry_DetailSumHWON_Y: TFloatField;
    Qry_DetailSumHWON_BEALL: TFloatField;
    Qry_DetailSumHWON_ALL: TFloatField;
    Qry_DetailSumBUPER: TFloatField;
    Qry_DetailSumCHPER: TFloatField;
    Qry_DetailSumGAPER: TFloatField;
    Qry_DetailSumDEPER: TFloatField;
    Qry_DetailSumSAPER: TFloatField;
    Qry_DetailSumSPPER: TFloatField;
    Qry_DetailSumSOPER: TFloatField;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1EndPage(Sender: TCustomQuickRep);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;
  BandCount,PageCount : Integer;

implementation

{$R *.DFM}

uses
  PePrnview, pia80201;

procedure TPrintForm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRShape69.Enabled:=False;
  deptname.Font.Style := [];
  QRSubDetail1.Color  := clWhite;

  if (Qry_DetailSum.FieldByName('deptlevel').AsString  ='20') or
     (Qry_DetailSum.FieldByName('deptlevel').AsString  ='40') or
     (Qry_DetailSum.FieldByName('deptlevel').AsString  ='A0') then
  begin
       QRShape69.Enabled   := True;
       deptname.Font.Style := [fsBold];
  end
  else
  if  (Qry_DetailSum.FieldByName('deptlevel').AsString  ='B0') then
      QRSubDetail1.Color := $00E7E7E7;
end;

procedure TPrintForm.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  PageCount:=0;
  ChildBand1.Enabled:=True;
  lbl_writeDay.Caption := MainForm.Lsysdate.Caption
end;

procedure TPrintForm.QuickRep1EndPage(Sender: TCustomQuickRep);
begin
   Inc(PageCount);
end;

procedure TPrintForm.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with OraQuery1  do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select count(decode(substr(b.empno,1,1),''M'',''1'')) "DIRECTOR",                                                                                                         ');
       Sql.Add('       count(decode(b.paycl, ''C11'',''1'')) "HWON_BU",                                                                                                                    ');
       Sql.Add('       count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",                                                                            ');
       Sql.Add('       round((count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
       Sql.Add('       (count(decode(b.paycl, ''C11'',''1''))  ) * 100,1) "BUPER",                                                                                                         ');
       Sql.Add('       count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",                                                        ');
       Sql.Add('       count(decode(b.paycl, ''C21'',''1'')) "HWON_CHA",                                                                                                                   ');
       Sql.Add('       count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",                                                                           ');
       Sql.Add('       count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",                                                       ');
       Sql.Add('       round((count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
       Sql.Add('       (count(decode(b.paycl, ''C21'',''1'')) ) * 100,1) "CHPER",                                                                                                          ');
       Sql.Add('       count(decode(b.paycl, ''D11'',''1'')) "HWON_GOA",                                                                                                                   ');
       Sql.Add('       count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",                                                                           ');
       Sql.Add('       count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",                                                       ');
       Sql.Add('       round((count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
       Sql.Add('       (count(decode(b.paycl, ''D11'',''1'')) )  * 100,1) "GAPER",                                                                                                         ');
       Sql.Add('       count(decode(b.paycl, ''D21'',''1'')) "HWON_DAE",                                                                                                                   ');
       Sql.Add('       count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_DAE",                                                                           ');
       Sql.Add('       count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "DAE",                                                       ');
       Sql.Add('       round((count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
       Sql.Add('       (count(decode(b.paycl, ''D21'',''1'')) ) * 100,1) "DEPER",                                                                                                          ');
       Sql.Add('       count(decode(substr(b.paycl,1,2), ''D3'',''1'')) "HWON_SA",                                                                                                         ');
       Sql.Add('       count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SA",                                                                  ');
       Sql.Add('       count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SA",                                              ');
       Sql.Add('       round((count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                         ');
       Sql.Add('       (count(decode(substr(b.paycl,1,2), ''D3'',''1'')) ) * 100,1) "SAPER",                                                                                               ');
       Sql.Add('       count(decode(b.paycl, ''D41'',''1'')) "HWON_특정",                                                                                                                  ');
       Sql.Add('       count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_특정",                                                                          ');
       Sql.Add('       count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "특정",                                                      ');
       Sql.Add('       round((count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
       Sql.Add('       (count(decode(b.paycl, ''D41'',''1'')) ) * 100,1) "SPPER",                                                                                                          ');
(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
       Sql.Add('       count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                        ');
       //Sql.Add('       count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",              ');
       Sql.Add('        count(decode(substr(empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',                                                                            '); //2007.03.09 서혜미 수정
       Sql.Add('              decode(substr(nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''8'',''1'',''I'',''1'',''''))) "NON_SO",                                                  ');
       Sql.Add('       count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
       Sql.Add('       round((count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
       Sql.Add('       (count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
       Sql.Add('       count(decode(substr(b.empno,1,1), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
       Sql.Add('       count(decode(substr(b.empno,1,1), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
       Sql.Add('       count(decode(substr(b.empno,1,1), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
       Sql.Add('       count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');

*)
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                        ');
       //Sql.Add('       count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",              ');
       Sql.Add('        count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',                                                                            '); //2007.03.09 서혜미 수정
       Sql.Add('              decode(substr(nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''8'',''1'',''I'',''1'',''''))) "NON_SO",                                                  ');
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
       Sql.Add('       round((count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
       Sql.Add('       (count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
       Sql.Add('       count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');
       Sql.Add('       count(b.empno) "HWON_ALL"                                                                                                                                          ');
       Sql.Add(' from pimpmas b                                                                                                                                                           ');
       Sql.Add(' where b.PSTATE < ''80''                                                                                                                                                 ');
       Open;

       MainForm.edit1.text := sql.text;

       QRL_DIRECTOR.Caption:= FieldByName('DIRECTOR').AsString;
       QRL_HBU.Caption     := FieldByName('HWON_BU').AsString;
       QRL_NBU.Caption     := FieldByName('NON_BU').AsString;
       QRL_BU.Caption      := FieldByName('BU').AsString;
       QRL_BUPER.Caption   := FieldByName('BUPER').AsString;  //부장퍼센트
       QRL_HCHA.Caption    := FieldByName('HWON_CHA').AsString;
       QRL_NCHA.Caption    := FieldByName('NON_CHA').AsString;
       QRL_CHA.Caption     := FieldByName('CHA').AsString;
       QRL_CHPER.Caption   := FieldByName('CHPER').AsString;  //차장퍼센트
       QRL_HGOA.Caption    := FieldByName('HWON_GOA').AsString;
       QRL_NGOA.Caption    := FieldByName('NON_GOA').AsString;
       QRL_GOA.Caption     := FieldByName('GOA').AsString;
       QRL_GAPER.Caption   := FieldByName('GAPER').AsString;  //과장퍼센트
       QRL_HDAE.Caption    := FieldByName('HWON_DAE').AsString;
       QRL_NDAE.Caption    := FieldByName('NON_DAE').AsString;
       QRL_DAE.Caption     := FieldByName('DAE').AsString;
       QRL_DEPER.Caption   := FieldByName('GAPER').AsString;  //대리퍼센트
       QRL_HSA.Caption     := FieldByName('HWON_SA').AsString;
       QRL_NSA.Caption     := FieldByName('NON_SA').AsString;
       QRL_SA.Caption      := FieldByName('SA').AsString;
       QRL_SAPER.Caption   := FieldByName('SAPER').AsString;  //사원퍼센트
       QRL_HSP.Caption     := FieldByName('HWON_특정').AsString;
       QRL_NSP.Caption     := FieldByName('NON_특정').AsString;
       QRL_SP.Caption      := FieldByName('특정').AsString;
       QRL_SPPER.Caption   := FieldByName('SPPER').AsString;  //특정퍼센트
       QRL_HSO.Caption     := FieldByName('HWON_SO').AsString;
       QRL_NSO.Caption     := FieldByName('NON_SO').AsString;
       QRL_SO.Caption      := FieldByName('SO').AsString;
       QRL_SOPER.Caption   := FieldByName('SOPER').AsString;  //소계퍼센트
       QRL_HJ.Caption      := FieldByName('HWON_J').AsString;
       QRL_HPQ.Caption     := FieldByName('HWON_PQ').AsString;
       QRL_HY.Caption      := FieldByName('HWON_Y').AsString;
       QRL_HBEALL.Caption  := FieldByName('HWON_BEALL').AsString;
       QRL_HALL.Caption    := FieldByName('HWON_ALL').AsString;
  end;

  if PageCount > 0 then ChildBand1.Enabled := False;
end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
    Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
    Fm_PreviewForm.Show;
end;


// 비노조원 내역
procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with OraQuery1  do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select count(decode(nogubun, ''80'',''1''))   mi,                                 ');
       SQL.Add('       count(decode(nogubun, ''9A'',''1''))   im,                                 ');
       SQL.Add('       count(decode(nogubun, ''9B'',''1''))   sm2,                                ');
       SQL.Add('       count(decode(nogubun, ''9C'',''1''))   boim,                               ');
       SQL.Add('       count(decode(nogubun, ''9D'',''1''))   ex,                                 ');
       SQL.Add('       count(decode(nogubun, ''80'','''',''1'')) subsum,                          ');
       SQL.Add('       count(empno) sum                                                           ');
       SQL.Add('from pimpmas                                                                      ');
       SQL.Add('where nogubun in (''80'',''9A'',''9B'',''9C'',''9D'')                             ');
       SQL.Add('  and orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'') ');
       SQL.Add('  and pstate < ''80''                                                             ');
       Open;

       la_mi.Caption := FieldByName('mi').AsString;
       la_im.Caption := FieldByName('im').AsString;
       la_sm2.Caption:= FieldByName('sm2').AsString;
       la_bo.Caption := FieldByName('boim').AsString;
       la_ex.Caption := FieldByName('ex').AsString;
       la_sub.Caption:= FieldByName('subsum').AsString;
       la_sum.Caption:= FieldByName('sum').AsString;

       Close;
       Sql.Clear;
       Sql.Add('select a.DEPTABBR deptname,                                                        ');
       SQL.Add('	     count(b.empno) hwon                                                        ');
       SQL.Add('from pycdept a, pimpmas b                                                          ');
       SQL.Add('where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')');
       SQL.Add('  and a.orgnum   = b.orgnum                                                        ');
       SQL.Add('  and a.deptcode = b.deptcode                                                      ');
       SQL.Add('  and b.NOGUBUN=''9D''                                                             ');
       SQL.Add('  and existon =''1''                                                               ');
       SQL.Add('  and chanmode <>''3''                                                             ');
       SQL.Add('  and b.pstate <''80''                                                             ');
       SQL.Add('group by a.deptlevel, a.deptcode, a.DEPTABBR                                       ');
       Open;


       First;
       la_ju.Caption := '주) ';
       while not Eof do
       begin
          la_ju.Caption := la_ju.Caption + FieldByName('deptname').AsString +
          '('+FieldByName('hwon').AsString + ') ';

         Next;
       end;

       Close;
       Sql.Clear;
       Sql.Add('select count(empno) empno from pimpmas                                            ');
       SQL.Add('where substr(pstate,1,1)= ''7''                                                   ');
       SQL.Add(' and orgnum=(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')   ');
       SQL.Add(' and nogubun in (''30'',''32'',''34'',''35'',''45'',''47'',''48'',''49'',''5A'')  ');
       Open;
       la_hujik.Caption := ' * 휴직자중 노조 가입 인원';
       la_hujik.Caption := la_hujik.Caption + '('+FieldByName('empno').AsString + '명) 반영';
  end;
end;

end.
