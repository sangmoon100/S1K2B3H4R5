{===================== Program Header ==========================================
 PROGRAM-NAME   : PKQ1020G(연말정산 세액계산)
 SYSTEM-NAME    : 정산
 SUBSYSTEM-NAME : 연말정산
 Programmer     : 윤형식
 Version        : 30.10
 Date           : 2000.01.22

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
   1.00       1997.12.01                       설계명세서       최초개발본
   30.10      2000.01.22         윤형식                         초중고학생수, 인정상여 추가
   40.00      2000.12.21         유효성                         지정기부금 한도액계산변경,
                                                                신용카드 공제액 계산 변경
   40.10      2001.12.18         유효성                         소득세법 개정
                                                                -근로소득공제 확대(인정상여 근로소득공제허용)
                                                                -의료비공제한도 확대
                                                                -신용카드공제한도 확대
                                                                -장애자전용보험 소득공제신설
                                                                -연금저축제도 신설
                                                                -연금보험료 신설(국민연금)
                                                                -장기증권저축제도 신설

              2002.12.16        박수향                          소득세법 개정
                                                                -근로소득공제
                                                                -경로우대,장애인공제
                                                                -국민연금보험료 전액공제
                                                                -장애인특수교육비공제
                                                                - 근로자주식저축없어짐
                                                                -특례지정기부금생성,장학금전액공제
                                                                -근로소득세액공제(인정상여 포함해서 계산)
                                                                -투자조합출자 2002년을기점으로
                                                                - 장기주식저축 2002년을 기준으로
   40.20     2003.12.           강륜종(dsa2000)                 신용카드공제에 직불카드+지로납부금 포함
                                                                외국인 추가공제 추가(자녀교육비+월세)
   41.00     2004.12            dsa2000                         소득세법개정.(외국인 과세특례 신설에 따른 사항  등)
                                                                - 경로우대70이상 추가
===============================================================================}

unit pkq106101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Tabnotbk, Buttons, Mask, DBCtrls, ExtCtrls,
  Db, DBTables, math, userhelp, Ora, Func, MemDS, DBAccess,
  OraSmart, KeyEmpNo, OnEditStdCtrl, OnEditCombo, OnEditBtnCtrl,
  OnPopupEdit, OnFocusButton, OnEditBaseCtrl, OnEditNumCtl, Grids, DBGrids,
  OnGrDBGrid, Pass;//Iempno,pass,

type
  TFpkq10601 = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel22: TPanel;
    DBEkorname: TDBEdit;
    Eempno: TEdit;
    BBempno: TBitBtn;
    Panel2: TPanel;
    Phelpmsg: TPanel;
    TabbedNotebook1: TTabbedNotebook;
    GroupBox1: TGroupBox;
    DBEmpaysum: TDBEdit;
    DBEbpaysum: TDBEdit;
    DBElaborded: TDBEdit;
    DBElaboramt: TDBEdit;
    DBEmbonsum: TDBEdit;
    DBEbbonsum: TDBEdit;
    DBEtaxgross: TDBEdit;
    GroupBox2: TGroupBox;
    DBEmintax: TDBEdit;
    DBEbintax: TDBEdit;
    DBEmjutax: TDBEdit;
    DBEbjutax: TDBEdit;
    DBEdintax: TDBEdit;
    DBEyintax: TDBEdit;
    DBEdjutax: TDBEdit;
    DBEyjutax: TDBEdit;
    DBEycalctax: TDBEdit;
    GroupBox3: TGroupBox;
    DBEselfded: TDBEdit;
    DBEmateded: TDBEdit;
    DBEfamided: TDBEdit;
    DBEbasicded: TDBEdit;
    DBEoldded: TDBEdit;
    DBEobsded: TDBEdit;
    DBEwomanded: TDBEdit;
    DBEchildded: TDBEdit;
    DBEappendded: TDBEdit;
    DBEfewded: TDBEdit;
    DBEmate: TDBEdit;
    DBEobstacleno: TDBEdit;
    DBEwoman: TDBEdit;
    DBEchildno: TDBEdit;
    DBEfami16no: TDBEdit;
    DBEfami720no: TDBEdit;
    DBEfamilyno: TDBEdit;
    DBEfami65no: TDBEdit;
    DBEhireamt: TDBEdit;
    DBEguaramt: TDBEdit;
    DBEagiveamt: TDBEdit;
    DBEpenamt1: TDBEdit;
    DBEhloadamt: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    DBEguarded: TDBEdit;
    DBEinsded: TDBEdit;
    DBEeduded: TDBEdit;
    DBEagiveded: TDBEdit;
    DBEgiveded: TDBEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    DBEspecialded: TDBEdit;
    DBEincomeded: TDBEdit;
    DBEtaxlevel: TDBEdit;
    DBEcalctax: TDBEdit;
    DBEincomtded: TDBEdit;
    DBEhloadded: TDBEdit;
    DBEbhireamt: TDBEdit;
    DBEhireded: TDBEdit;
    DBEseduamt: TDBEdit;
    DBEkeduamt: TDBEdit;
    DBEceduamt: TDBEdit;
    DBEueduamt: TDBEdit;
    DBEseduded: TDBEdit;
    DBEkeduded: TDBEdit;
    DBEceduded: TDBEdit;
    DBEueduded: TDBEdit;
    DBEghosamt: TDBEdit;
    DBEohosamt: TDBEdit;
    DBEnhosamt: TDBEdit;
    DBEhosded: TDBEdit;
    DBEbmedamt: TDBEdit;
    DBEmedded: TDBEdit;
    DBEkeduno: TDBEdit;
    DBEueduno: TDBEdit;
    DBEforiamt: TDBEdit;
    DBEtdedsum: TDBEdit;
    Panel35: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel11: TPanel;
    Panel16: TPanel;
    DBEmgitasodk: TDBEdit;
    Panel17: TPanel;
    Panel10: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel23: TPanel;
    DBEmnongtax: TDBEdit;
    DBEbnongtax: TDBEdit;
    DBEdnongtax: TDBEdit;
    DBEynongtax: TDBEdit;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    DBEfami6064no: TDBEdit;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    DataSource1: TDataSource;
    DBEpenamt2: TDBEdit;
    DBEpended: TDBEdit;
    Panel77: TPanel;
    DBEmedamt: TDBEdit;
    Panel78: TPanel;
    DBEhouseamt: TDBEdit;
    DBEhouseintded: TDBEdit;
    Panel47: TPanel;
    Pdeptname: TPanel;
    Panel79: TPanel;
    DBinvestamt: TDBEdit;
    DBinvestded: TDBEdit;
    DBcredittotamt: TDBEdit;
    DBcreditded: TDBEdit;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    dbeMCOGBONSUM: TDBEdit;
    Panel83: TPanel;
    debBCOGBONSUM: TDBEdit;
    DBECEDUNO: TDBEdit;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel90: TPanel;
    DBEBPAYSUM1: TDBEdit;
    Panel91: TPanel;
    DBEBBONSUM1: TDBEdit;
    Panel92: TPanel;
    DBEBINTAX1: TDBEdit;
    Panel93: TPanel;
    DBEBJUTAX1: TDBEdit;
    Panel94: TPanel;
    DBEBNONGTAX1: TDBEdit;
    Panel95: TPanel;
    DBEBMEDAMT1: TDBEdit;
    Panel96: TPanel;
    DBEBHIREAMT1: TDBEdit;
    Panel97: TPanel;
    Panel98: TPanel;
    DBEcreditdedamt: TDBEdit;
    Panel99: TPanel;
    DBEhouseintamt: TDBEdit;
    DBkeduno1: TDBEdit;
    Panel101: TPanel;
    DBEobsguaramt: TDBEdit;
    DBEobsguarded: TDBEdit;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    DBEanuamt: TDBEdit;
    DBEbanuamt: TDBEdit;
    DBEbanuamt1: TDBEdit;
    Panel105: TPanel;
    DBEanuded: TDBEdit;
    Panel62: TPanel;
    DBEnpenamt: TDBEdit;
    Panel70: TPanel;
    DBEnpenamt2: TDBEdit;
    DBEnpended: TDBEdit;
    Panel107: TPanel;
    DBEstandded: TDBEdit;
    Panel108: TPanel;
    DBEobseduamt: TDBEdit;
    DBEobseduded: TDBEdit;
    Panel109: TPanel;
    DBEspgivamt: TDBEdit;
    DBEspgivded: TDBEdit;
    Panel111: TPanel;
    DBoinvestamt: TDBEdit;
    DBoinvestded: TDBEdit;
    Panel113: TPanel;
    DBtinvestded: TDBEdit;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    BBexit: TBitBtn;
    Panel115: TPanel;
    DBEdebitamt: TDBEdit;
    DBEgiroamt: TDBEdit;
    Panel3: TPanel;
    Panel116: TPanel;
    Panel73: TPanel;
    DBEfami70no: TDBEdit;
    Panel76: TPanel;
    DBEpolided: TDBEdit;
    Panel88: TPanel;
    DBEshosamt: TDBEdit;
    Panel100: TPanel;
    DBEpoliamt: TDBEdit;
    Panel106: TPanel;
    DBEhouseintamt2: TDBEdit;
    Button1: TButton;
    Panel110: TPanel;
    DBEcashamt: TDBEdit;
    Panel112: TPanel;
    DBcostockamt: TDBEdit;
    DBcostockded: TDBEdit;
    Panel114: TPanel;
    dbeCOSTOCKTAX: TDBEdit;
    Table1: TOraTable;
    Table1WORKYY: TStringField;
    Table1EMPNO: TStringField;
    Table1KORNAME: TStringField;
    Table1PAYNUM: TStringField;
    Table1PAYCL: TStringField;
    Table1PAYGR: TIntegerField;
    Table1ORGNUM: TStringField;
    Table1DEPTCODE: TStringField;
    Table1PSTATE: TStringField;
    Table1BLDCODE: TStringField;
    Table1EMPDATE: TStringField;
    Table1JUMINID: TStringField;
    Table1SEX: TStringField;
    Table1FIRSTYN: TStringField;
    Table1HEADYN: TStringField;
    Table1MARRIEDYN: TStringField;
    Table1ZIPNO: TStringField;
    Table1ADDR: TStringField;
    Table1APPMAN: TStringField;
    Table1APPDATE: TStringField;
    Table1BCORPNAME: TStringField;
    Table1BCORPNO: TStringField;
    Table1YSFRDATE: TStringField;
    Table1YSTODATE: TStringField;
    Table1SUBDATE: TStringField;
    Table1LASTMONPAY: TFloatField;
    Table1MGITASODK: TFloatField;
    Table1MPAYSUM: TFloatField;
    Table1MBONSUM: TFloatField;
    Table1MNOTAX: TFloatField;
    Table1BPAYSUM: TFloatField;
    Table1BBONSUM: TFloatField;
    Table1BNOTAX: TFloatField;
    Table1TAXGROSS: TFloatField;
    Table1NOTAX: TFloatField;
    Table1LABORDED: TFloatField;
    Table1LABORAMT: TFloatField;
    Table1MATE: TIntegerField;
    Table1FAMI16NO: TIntegerField;
    Table1FAMI720NO: TIntegerField;
    Table1FAMI6064NO: TIntegerField;
    Table1FAMI65NO: TIntegerField;
    Table1FAMILYNO: TIntegerField;
    Table1SELFDED: TFloatField;
    Table1MATEDED: TFloatField;
    Table1FAMIDED: TFloatField;
    Table1BASICDED: TFloatField;
    Table1OBSTACLENO: TIntegerField;
    Table1CHILDNO: TIntegerField;
    Table1WOMAN: TIntegerField;
    Table1OLDDED: TFloatField;
    Table1OBSDED: TFloatField;
    Table1WOMANDED: TFloatField;
    Table1CHILDDED: TFloatField;
    Table1APPENDDED: TFloatField;
    Table1FEWNO: TIntegerField;
    Table1FEWDED: TFloatField;
    Table1MEDAMT: TFloatField;
    Table1BMEDAMT: TFloatField;
    Table1MEDDED: TFloatField;
    Table1HIREAMT: TFloatField;
    Table1BHIREAMT: TFloatField;
    Table1HIREDED: TFloatField;
    Table1GUARAMT: TFloatField;
    Table1GUARDED: TFloatField;
    Table1INSDED: TFloatField;
    Table1GHOSAMT: TFloatField;
    Table1OHOSAMT: TFloatField;
    Table1NHOSAMT: TFloatField;
    Table1HOSAMT: TFloatField;
    Table1HOSDED: TFloatField;
    Table1SEDUAMT: TFloatField;
    Table1SEDUDED: TFloatField;
    Table1KEDUNO: TFloatField;
    Table1KEDUAMT: TFloatField;
    Table1KEDUDED: TFloatField;
    Table1CEDUAMT: TFloatField;
    Table1CEDUDED: TFloatField;
    Table1UEDUNO: TFloatField;
    Table1UEDUAMT: TFloatField;
    Table1UEDUDED: TFloatField;
    Table1EDUDED: TFloatField;
    Table1HOUSEAMT: TFloatField;
    Table1HOUSEDED: TFloatField;
    Table1AGIVEAMT: TFloatField;
    Table1AGIVEDED: TFloatField;
    Table1PGIVEAMT: TFloatField;
    Table1PGIVEDED: TFloatField;
    Table1GIVEDED: TFloatField;
    Table1SPECIALDED: TFloatField;
    Table1PENAMT1: TFloatField;
    Table1PENAMT2: TFloatField;
    Table1BPENAMT: TFloatField;
    Table1PENDED: TFloatField;
    Table1INCOMEDED: TFloatField;
    Table1TAXLEVEL: TFloatField;
    Table1CALCTAX: TFloatField;
    Table1INCOMTDED: TFloatField;
    Table1PROPAMT1: TFloatField;
    Table1PROPAMT2: TFloatField;
    Table1BPROPAMT: TFloatField;
    Table1PROPDED: TFloatField;
    Table1HLOANAMT: TFloatField;
    Table1HLOANDED: TFloatField;
    Table1STKAMT: TFloatField;
    Table1STKDED: TFloatField;
    Table1FORIAMT: TFloatField;
    Table1FORIDED: TFloatField;
    Table1ETCTAMT: TFloatField;
    Table1ETCTDED: TFloatField;
    Table1TDEDSUM: TFloatField;
    Table1DINTAX: TFloatField;
    Table1DJUTAX: TFloatField;
    Table1DNONGTAX: TFloatField;
    Table1MINTAX: TFloatField;
    Table1MJUTAX: TFloatField;
    Table1MNONGTAX: TFloatField;
    Table1BINTAX: TFloatField;
    Table1BJUTAX: TFloatField;
    Table1BNONGTAX: TFloatField;
    Table1INTAX: TFloatField;
    Table1JUTAX: TFloatField;
    Table1NONGTAX: TFloatField;
    Table1YINTAX: TFloatField;
    Table1YJUTAX: TFloatField;
    Table1YNONGTAX: TFloatField;
    Table1YCALCTAX: TFloatField;
    Table1FINALPAY: TFloatField;
    Table1WRITETIME: TStringField;
    Table1WRITEMAN: TStringField;
    Table1NOHOUSEDED: TFloatField;
    Table1TOGETHERDED: TFloatField;
    Table1COSTOCKAMT: TFloatField;
    Table1COSTOCKDED: TFloatField;
    Table1YEARNOTAXAMT: TFloatField;
    Table1SGIVEAMT: TFloatField;
    Table1INVESTAMT: TFloatField;
    Table1INVESTDED: TFloatField;
    Table1FORITAXGROSS: TFloatField;
    Table1KEDUNO1: TFloatField;
    Table1KEDUAMT1: TFloatField;
    Table1KEDUDED1: TFloatField;
    Table1CREDITAMT: TFloatField;
    Table1CREDITDED: TFloatField;
    Table1MCRESUM: TIntegerField;
    Table1BCRESUM: TIntegerField;
    Table1BCORPNAME1: TStringField;
    Table1BCORPNO1: TStringField;
    Table1BPAYSUM1: TFloatField;
    Table1BBONSUM1: TFloatField;
    Table1BMEDAMT1: TFloatField;
    Table1BHIREAMT1: TFloatField;
    Table1BINTAX1: TFloatField;
    Table1BJUTAX1: TFloatField;
    Table1BNONGTAX1: TFloatField;
    Table1CEDUNO: TFloatField;
    Table1MCOGBONSUM: TFloatField;
    Table1BCOGBONSUM: TFloatField;
    Table1CREDITDEDAMT: TFloatField;
    Table1CREDITTOTAMT: TFloatField;
    Table1HOUSEINTAMT: TFloatField;
    Table1OBSGUARAMT: TFloatField;
    Table1ANUAMT: TFloatField;
    Table1BANUAMT: TFloatField;
    Table1BANUAMT1: TFloatField;
    Table1ANUDED: TFloatField;
    Table1NPENAMT: TFloatField;
    Table1NPENDED: TFloatField;
    Table1LSTKAMT: TFloatField;
    Table1LSTKDED: TFloatField;
    Table1OBSGUARDED: TFloatField;
    Table1NPENAMT2: TFloatField;
    Table1STANDDED: TFloatField;
    Table1OLSTKAMT: TFloatField;
    Table1OLSTKDED: TFloatField;
    Table1TLSTKDED: TFloatField;
    Table1OBSEDUNO: TFloatField;
    Table1OBSEDUAMT: TFloatField;
    Table1OBSEDUDED: TFloatField;
    Table1OINVESTAMT: TFloatField;
    Table1OINVESTDED: TFloatField;
    Table1TINVESTDED: TFloatField;
    Table1POLIAMT: TFloatField;
    Table1POLIDED: TFloatField;
    Table1SPGIVAMT: TFloatField;
    Table1SPGIVDED: TFloatField;
    Table1DEBITAMT: TFloatField;
    Table1GIROAMT: TFloatField;
    Table1FOREIGNAMT: TFloatField;
    Table1FOREIGNDED: TFloatField;
    Table1FAMI70NO: TIntegerField;
    Table1SPECADDNO: TIntegerField;
    Table1SPECADDDED: TIntegerField;
    Table1SHOSAMT: TIntegerField;
    Table1CASHAMT: TIntegerField;
    Table1COSTOCKTAX: TFloatField;
    Query1: TOraQuery;
    Query2: TOraQuery;
    DBEmanychildno: TDBEdit;
    Table1MANYCHILDNO: TIntegerField;
    Table1CREDITAMT_MED: TFloatField;
    Panel118: TPanel;
    DBEbabyno: TDBEdit;
    Panel119: TPanel;
    DBEpgivamt: TDBEdit;
    DBEpgiveded: TDBEdit;
    Panel120: TPanel;
    DBEfundamt1: TDBEdit;
    Table1BABYNO: TIntegerField;
    DBEfundded: TDBEdit;
    Table1MSTOCKSUM: TFloatField;
    Table1MSTOCKTAX: TIntegerField;
    Table1ROWID: TStringField;
    Panel121: TPanel;
    Panel122: TPanel;
    DBEfundamt3: TDBEdit;
    Panel123: TPanel;
    DBEhouseamt2: TDBEdit;
    DBEhouseded2: TDBEdit;
    DBEfundamt2: TDBEdit;
    DBEbabyded: TDBEdit;
    Table1HOUSEINTAMT2: TFloatField;
    Table1BABYDED: TFloatField;
    Table1PGIVEAMT2: TFloatField;
    Table1HOUSEAMT2: TFloatField;
    Table1HOUSEDED2: TFloatField;
    Table1HOUSEINTDED: TFloatField;
    Table1FUNDAMT1: TFloatField;
    Table1FUNDAMT2: TFloatField;
    Table1FUNDAMT3: TFloatField;
    Table1FUNDDED: TFloatField;
    Panel66: TPanel;
    DBEpgivamt2: TDBEdit;
    DBEhouseded: TDBEdit;
    Panel87: TPanel;
    DBEhouseintamt3: TDBEdit;
    Table1HOUSEINTAMT3: TFloatField;
    DB_Fami: TOnGrDbGrid;
    Panel89: TPanel;
    Panel117: TPanel;
    Panel124: TPanel;
    Panel125: TPanel;
    Panel126: TPanel;
    Panel127: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    Panel130: TPanel;
    Panel131: TPanel;
    E_dedamt5a: TOnNumberEdit;
    E_dedamt7a: TOnNumberEdit;
    E_dedamt5b: TOnNumberEdit;
    E_dedamt7b: TOnNumberEdit;
    E_dedamt10b: TOnNumberEdit;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel134: TPanel;
    Panel135: TPanel;
    Panel136: TPanel;
    E_dedamt8a: TOnNumberEdit;
    Panel137: TPanel;
    E_dedamt8b: TOnNumberEdit;
    BB_Med_nts: TOnFocusButton;
    BB_Append: TOnFocusButton;
    BB_Delete: TOnFocusButton;
    BB_FamSave: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    Panel138: TPanel;
    E_Faminame: TOnEdit;
    E_Famirel: TOnWinPopupEdit;
    P_FamirelN: TPanel;
    E_babyyn: TOnComboEdit;
    E_Juminid: TOnMaskEdit;
    P_Age: TPanel;
    E_dedyn: TOnComboEdit;
    E_Obsyn: TOnComboEdit;
    E_dedyn3: TOnComboEdit;
    E_dedamt4b: TOnNumberEdit;
    E_dedamt6b: TOnNumberEdit;
    E_dedamt4a: TOnNumberEdit;
    E_dedamt6a: TOnNumberEdit;
    Panel140: TPanel;
    E_dedamt11b: TOnNumberEdit;
    E_dedamt11a: TOnNumberEdit;
    Panel141: TPanel;
    DataSource2: TDataSource;
    Query3: TOraQuery;
    Query4: TOraQuery;
    Query3FAMINAME: TStringField;
    Query3FAMIREL: TStringField;
    Query3JUMINID: TStringField;
    Query3AGE: TIntegerField;
    Query3DEDYN: TStringField;
    Query3OBSYN: TStringField;
    Query3DEDYN3: TStringField;
    Query3DEDAMT4A: TFloatField;
    Query3DEDAMT4B: TFloatField;
    Query3DEDAMT5A: TFloatField;
    Query3DEDAMT5B: TFloatField;
    Query3DEDAMT6A: TFloatField;
    Query3DEDAMT6B: TFloatField;
    Query3DEDAMT7A: TFloatField;
    Query3DEDAMT7B: TFloatField;
    Query3DEDAMT8A: TFloatField;
    Query3DEDAMT9A: TFloatField;
    Query3DEDAMT9B: TFloatField;
    Query3DEDAMT10A: TFloatField;
    Query3DEDAMT4: TFloatField;
    Query3DEDAMT5: TFloatField;
    Query3DEDAMT6: TFloatField;
    Query3DEDAMT7: TFloatField;
    Query3DEDAMT8: TFloatField;
    Query3CODENAME: TStringField;
    Query3BABYYN: TStringField;
    Query3DEDAMT10: TFloatField;
    Query3DEDAMT11A: TFloatField;
    Query3DEDAMT11B: TFloatField;
    Query3DEDAMT11: TFloatField;
    OnNumberEdit1: TOnNumberEdit;
    Label2: TLabel;
    E_WorkYY: TEdit;
    DataSource3: TDataSource;
    Query4GUARAMT: TFloatField;
    Query4SHOSAMT: TFloatField;
    Query4NHOSAMT: TFloatField;
    Query4OHOSAMT: TFloatField;
    Query4GHOSAMT: TFloatField;
    Query4SEDUAMT: TFloatField;
    Query4CREDITTOTAMT: TFloatField;
    Query4CREDITAMT_MED: TFloatField;
    Query4CASHAMT: TFloatField;
    Query5: TOraQuery;
    BB_DetailSave: TOnFocusButton;
    Panel139: TPanel;
    E_dedamt12a: TOnNumberEdit;
    E_dedamt12b: TOnNumberEdit;
    Query3DEDAMT12A: TFloatField;
    Query3DEDAMT12B: TFloatField;
    Query3DEDAMT12: TFloatField;
    Panel142: TPanel;
    DBEHousvsubamt: TDBEdit;
    DBEHousvsubded: TDBEdit;
    Table1DEDLACKAMT: TFloatField;
    Table1LONGMTAMT: TFloatField;
    Table1LONGMTDED: TFloatField;
    Table1BSTDATE: TStringField;
    Table1BENDDATE: TStringField;
    Table1BSTDATE1: TStringField;
    Table1BENDDATE1: TStringField;
    Table1INDEPENDNOTAX: TIntegerField;
    Table1BINDEPENDNOTAX: TIntegerField;
    Table1BINDEPENDNOTAX1: TIntegerField;
    Table1OVTMNOTAX: TIntegerField;
    Table1BOVTMNOTAX: TIntegerField;
    Table1BOVTMNOTAX1: TIntegerField;
    Table1KEDUNOTAX: TIntegerField;
    Table1BKEDUNOTAX: TIntegerField;
    Table1BKEDUNOTAX1: TIntegerField;
    Table1FOREIGNNOTAX: TIntegerField;
    Table1BFOREIGNNOTAX: TIntegerField;
    Table1BFOREIGNNOTAX1: TIntegerField;
    Table1COSTOCKNOTAX: TIntegerField;
    Table1BCOSTOCKNOTAX: TIntegerField;
    Table1BCOSTOCKNOTAX1: TIntegerField;
    Table1COSTOCK75NOTAX: TIntegerField;
    Table1BCOSTOCK75NOTAX: TIntegerField;
    Table1BCOSTOCK75NOTAX1: TIntegerField;
    Table1COSTOCK50NOTAX: TIntegerField;
    Table1BCOSTOCK50NOTAX: TIntegerField;
    Table1BCOSTOCK50NOTAX1: TIntegerField;
    Table1MSTOCKTNOTAX: TIntegerField;
    Table1BMSTOCKNOTAX: TIntegerField;
    Table1BMSTOCKNOTAX1: TIntegerField;
    Table1BMSTOCKTAX: TIntegerField;
    Table1BMSTOCKTAX1: TIntegerField;
    Table1BCOSTOCKTAX: TIntegerField;
    Table1BCOSTOCKTAX1: TIntegerField;
    Table1HOUSERENTAMT: TIntegerField;
    Table1HOUSERENTDED: TIntegerField;
    Table1HOUSVSUBAMT: TIntegerField;
    Table1HOUSVEMPAMT: TIntegerField;
    Table1HOUSVEMPDED: TIntegerField;
    Table1HOUSVCOMAMT: TIntegerField;
    Table1HOUSVCOMDED: TIntegerField;
    Table1POLITAXDED: TFloatField;
    Table1PGIVEDED2: TFloatField;
    Panel143: TPanel;
    DBEHousvcomamt: TDBEdit;
    DBEHousvcomded: TDBEdit;
    Table1HOUSVSUBDED: TIntegerField;
    Panel144: TPanel;
    DBEHousvempamt: TDBEdit;
    DBEHousvempded: TDBEdit;

    procedure BBcancelClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure SetTaxRate;
    function  GetTime : String;
    procedure SetEmpTime;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DBEmpaysumExit(Sender: TObject);
    procedure BBempnoClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoExit(Sender: TObject);
    function  GetDeptname(empno : String) : String;
    procedure BBhelpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Read_FamiRecords(WorkYY, EmpNo : String);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_FamSaveClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_AppendClick(Sender: TObject);
    procedure E_FamirelChange(Sender: TObject);
    procedure E_FamirelCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_FamirelInitPopup(Sender: TObject);
    procedure E_JuminidExit(Sender: TObject);
    procedure BB_Med_ntsClick(Sender: TObject);
    procedure BB_DetailSaveClick(Sender: TObject);
  private
    { Private declarations }
    TAXNUM     : String;               // 세율차수
    INDEDBASIC : double;               // 근로소득공제기본액
    INDEDORATE : double;               // 근로소득공제초과율
    INDEDLIMIT : double;               // 근로소득공제한계액
    INDEDORATE2 : double;               // 근로소득공제초과율
    INDEDLIMIT2 : double;               // 근로소득공제한계액
    BASDED     : double;               // 기본공제액
    APPDED     : double;               // 추가공제액
    FEWDED1    : double;               // 소수공제자추가공제1
    FEWDED2    : double;               // 소수공제자추가공제2
    STDDED     : double;               // 표준공제
    INSDEDLIMIT: double;               // 보장성보험공제한도
    MEDDEDLIMIT: double;               // 의료비공제한도
    MEDORATE   : double;               // 의료비공제초과율
    KINEDULIMIT: double;               // 유치원교육비인당한도액
    UNIEDULIMIT: double;               // 대학교육비인당한도액
    BROEDUNO   : double;               // 형제교육비한도인원
    HSRATE     : double;               // 주택자금공제율
    HSDEDLIMIT : double;               // 주택자금한도액
    HSDEDLIMIT2: double;               // 주택자금한도액2 (주택자금이자상환액 합계 공제시 한도)  dsa2000  2003.12.
    HSDEDLIMIT3: double;               // 주택자금한도액3 (주택자금이자상환액 합계 공제시 한도)  dsa2000  2004.12.
    GIVDEDRATE : double;               // 기부금공제한도율
    PENRATE    : double;               // 개인연금공제율
    PENDEDLIMIT: double;               // 개인연금한도액
    TAXDEDBASIC: double;               // 근로소득세액공제기본액
    TAXDEDBRATE: double;               // 근로소득세액공제기본율
    TAXDEDORATE: double;               // 근로소득세액공제초과율
    TAXDEDLIMIT: double;               // 근로소득세액공제한계액
    PRODEDRATE : double;               // 재형저축공제율
    HSINTRATE  : double;               // 주택자금세액공제율
    //STKDEDRATE : double;               // 주식저축세액공제율   parksh
    //STKDEDLIMIT: double;               // 주식저축세액한도액   parksh
    JUTAXRATE  : double;               // 주민세율
    NONGRATE   : double;               // 농특세율
    IsFirst    : boolean;              // 처음 여부

    INVESTRATE    : double;                // 투자조합공제율
    INVESTDEDRATE : double;             // 투자조합한도율
    CREDEDLIMIT   : double;            // 신용카드공제한도액*  100만원
    CREDEDRATE    : double;            // 신용카드공제한도율*  총급여의 10%
    CREORATE      : double;            // 신용카드공제초과율*   총급여의 10%
    CREDEDLRATE   : double;            // 신용카드공제율    *  총급여의 10%

    CJKEDULIMIT: double;               // 초중고교육비 인당한도액
    INDEDLIMIT3  : double;
    INDEDORATE3  : double;
    OBSDEDLIMIT  : double;
    NPENDEDLIMIT : double;
    LSTKDEDRATE  : double;

    INDEDLIMIT4  : double;              // 근로소득공제초과율4     parksh 20021217
    INDEDORATE4  : double;              // 근로소득공제한계액4     parksh 20021217
    APPOLDDED    : double;              // 경로우대,장애인 공제액  parksh 20021217
    OBSEDULIMIT  : double;              // 장애인특수교육비인당한도액  parksh 20021217
    SPGIVDEDRATE : double;              // 특례지정기부금공제한도율 parksh 20021217
    OINVESTRATE    : double;            // 투자조합공제율(00~01년)  parksh 20021217
    OINVESTDEDRATE : double;            // 투자조합한도율(00~01년)  parksh 20021217
    OLSTKDEDRATE   : double;            // 장기주식저축(02년)  parksh 20021217

    GIRODEDRATE   : double;          //DSA2000 2003.12. 지로납부공제율
    DEBITDEDRATE  : double;          //DSA2000 2003.12. 직불카드공제율
    FOREDEDRATE   : DOUBLE;          //DSA2000 2003.12. 외국인추가공제율
    APPOLDDED2    : double;          //DSA2000 2004.12. 경로우대공제70세이상
//    SpecAddLIMIT  : double;          //DSA2000 2004.12. 결혼.장례.이사 특별공제  2010.01 kth 주석 처리 결혼,이사,장례 주속 처리
    POLILIMIT     : double;          //DSA2000 2004.12. 정치자금 세액공제 한도액
    OBSDEDADD     : double;          //DSA2000 2005.12. 장애인 추가공제  한도액

    COSTOCKLIMIT  : double;          //Dsa2000 2006.12   우리사주조합 출연금 한도.
    APPBABYDED       : double;          //KTH 200901
    GIVDEDRATE2   : double;          //KTH 200901   종교단체
    FUNDRATE1     : double;          //KTH 200901   펀드 1년차 불입액
    FUNDRATE2     : double;          //KTH 200901   펀드 2년차 불입액
    FUNDRATE3     : double;          //KTH 200901   펀드 3년차 불입액
    LONGMTRATE    : double;          //KTH 200901   장기노양 보험율
    HSDEDLIMIT4   : double;          // 주택자금한도액4 (주택자금이자상환액 합계 공제시 한도 1500)  kth 2010.01 추가
    INDEDBRATE    : double;          // 기본 공제율 80% 추가  kth 2010.01 추가

  public
    JobMode       : Char;
    GSEmpno       :String;
    { Public declarations }
    procedure Calculate;
    procedure ReadPkcysbas;
    procedure Set_FamiField(arg1, arg2 : Boolean);
    function  GetTax(stdamt : double) : double;
    Function  Get_Age(BirthDate : String) : String;
    Function  Check_Jumin(No:String) : Boolean;
  end;

  type   pkcptax = record
      taxfr   : double;
      taxto   : double;
      taxrate : double;
      yearded : double;
  end;

var
  Fpkq10601: TFpkq10601;
  taxtbl    : array[0..10] of pkcptax;
  taxreccnt : integer;

implementation

uses PKQ106102,PKQ106103,PKQ106104;


{$R *.DFM}

procedure TFpkq10601.ReadPkcysbas;
var
   workyy : String;
begin

     with Query1 do
     begin
          E_WorkYY.Text := '2010';

          workyy := Trim(E_WorkYY.Text);


          Close;
          SQL.Clear;
          SQL.Add('select * from pkcysbas ');
          SQL.Add(' where workyy=:L1      ');
          ParamByName('L1').AsString := workyy;
          Open;


{          Close;
          SQL.Clear;
          SQL.Add('select workyy from pkcpbas ');
          Open;
          workyy := FieldByName('workyy').AsString;


          Close;
          SQL.Clear;
          SQL.Add('select * from pkcysbas ');
          SQL.Add(' where workyy=:L1      ');
          ParamByName('L1').AsString := workyy;
          Open;}

          TAXNUM       := FieldByName('taxnum').AsString;
          INDEDBASIC   := FieldByName('indedbasic').AsFloat;
          INDEDORATE   := FieldByName('indedorate').AsFloat;
          INDEDLIMIT   := FieldByName('indedlimit').AsFloat;
          BASDED       := FieldByName('basded').AsFloat;
          APPDED       := FieldByName('appded').AsFloat;
          FEWDED1      := FieldByName('fewded1').AsFloat;
          FEWDED2      := FieldByName('fewded2').AsFloat;
          STDDED       := FieldByName('stdded').AsFloat;
          INSDEDLIMIT  := FieldByName('insdedlimit').AsFloat;
          MEDDEDLIMIT  := FieldByName('meddedlimit').AsFloat;
          MEDORATE     := FieldByName('medorate').AsFloat;
          KINEDULIMIT  := FieldByName('kinedulimit').AsFloat;
          UNIEDULIMIT  := FieldByName('uniedulimit').AsFloat;
          BROEDUNO     := FieldByName('broeduno').AsFloat;
          HSRATE       := FieldByName('hsrate').AsFloat;
          HSDEDLIMIT   := FieldByName('hsdedlimit').AsFloat;
          HSDEDLIMIT2  := FieldByName('hsdedlimit2').AsFloat;  //dsa2000  2003.12.. 추가....
          HSDEDLIMIT3  := FieldByName('hsdedlimit3').AsFloat;  //dsa2000  2004.12.. 추가....
          GIVDEDRATE   := FieldByName('givdedrate').AsFloat;
          PENRATE      := FieldByName('penrate').AsFloat;
          PENDEDLIMIT  := FieldByName('pendedlimit').AsFloat;
          TAXDEDBASIC  := FieldByName('taxdedbasic').AsFloat;
          TAXDEDBRATE  := FieldByName('taxdedbrate').AsFloat;
          TAXDEDORATE  := FieldByName('taxdedorate').AsFloat;
          TAXDEDLIMIT  := FieldByName('taxdedlimit').AsFloat;
          PRODEDRATE   := FieldByName('prodedrate').AsFloat;
          HSINTRATE    := FieldByName('hsintrate').AsFloat;
         // STKDEDRATE := FieldByName('stkdedrate').AsFloat;    parksh
         // STKDEDLIMIT:= FieldByName('stkdedlimit').AsFloat;   parksh
          JUTAXRATE    := FieldByName('jutaxrate').AsFloat;
          NONGRATE     := FieldByName('nongrate').AsFloat;
          INVESTRATE   := FieldByName('INVESTRATE').AsFloat;
          INVESTDEDRATE:= FieldByName('INVESTDEDRATE').AsFloat;
          INDEDORATE2  := FieldByName('indedorate2').AsFloat;
          INDEDLIMIT2  := FieldByName('indedlimit2').AsFloat;
          CREDEDLIMIT  := FieldByName('CREDEDLIMIT').AsFloat;
          CREDEDRATE   := FieldByName('CREDEDRATE').AsFloat;
          CREORATE     := FieldByName('CREORATE').AsFloat;
          CREDEDLRATE  := FieldByName('CREDEDLRATE').AsFloat;
          CJKEDULIMIT  := FieldByName('CJKEDULIMIT').AsFloat; // 초중고학생수, 인정상여 추가  2000
          INDEDLIMIT3  := FieldByName('INDEDLIMIT3').AsFloat;
          INDEDORATE3  := FieldByName('INDEDORATE3').AsFloat;
          OBSDEDLIMIT  := FieldByName('OBSDEDLIMIT').AsFloat;
          NPENDEDLIMIT := FieldByName('NPENDEDLIMIT').AsFloat;
          LSTKDEDRATE  := FieldByName('LSTKDEDRATE').AsFloat;
          INDEDLIMIT4  := FieldByName('INDEDLIMIT4').AsFloat;              // 근로소득공제초과율4     parksh 20021217
          INDEDORATE4  := FieldByName('INDEDORATE4').AsFloat;              // 근로소득공제한계액4     parksh 20021217
          APPOLDDED    := FieldByName('APPOLDDED').AsFloat;                // 경로우대,장애인 공제액  parksh 20021217
          OBSEDULIMIT  := FieldByName('OBSEDULIMIT').AsFloat;              // 장애인특수교육비인당한도액  parksh 20021217
          SPGIVDEDRATE := FieldByName('SPGIVDEDRATE').AsFloat;             // 특례지정기부금공제한도율 parksh 20021217
          OINVESTRATE   := FieldByName('OINVESTRATE').AsFloat;            // 투자조합공제율(00~01년)  parksh 20021217
          OINVESTDEDRATE:= FieldByName('OINVESTDEDRATE').AsFloat;         // 투자조합한도율(00~01년)  parksh 20021217
          OLSTKDEDRATE  := FieldByName('OLSTKDEDRATE').AsFloat;           // 장기주식저축(02년)  parksh 20021217
          GIRODEDRATE   := FieldByName('GIRODEDRATE').AsFloat;            //DSA2000   2003.12.
          DEBITDEDRATE  := FieldByName('DEBITDEDRATE').AsFloat;           //DSA2000   2003.12.
          FOREDEDRATE   := FieldByName('FOREDEDRATE').AsFloat;            //DSA2000   2003.12.
          APPOLDDED2    := FieldByName('APPOLDDED2').AsFloat;             //DSA2000   2004.12.
//          SPECADDLIMIT  := FieldByName('SPECADDLIMIT').AsFloat;           //DSA2000   2004.12.   kth 2010 결혼,장례,이사 공제 폐지 주석
          POLILIMIT     := FieldByName('POLILIMIT').AsFloat;              //DSA2000   2004.12.
          OBSDEDADD     := FieldByName('OBSDEDADD').AsFloat;              //DSA2000   2005.12.
          COSTOCKLIMIT  := FieldByName('COSTOCKLIMIT').AsFloat;           //DSA2000   2006.12.
          APPBABYDED    := FieldByName('APPBABYDED').AsFloat;             //KTH       2009.01
          GIVDEDRATE2   := FieldByName('GIVDEDRATE2').AsFloat;             //KTH       2009.01
          FUNDRATE1     := FieldByName('FUNDRATE1').AsFloat;             //KTH       2009.01
          FUNDRATE2     := FieldByName('FUNDRATE2').AsFloat;             //KTH       2009.01
          FUNDRATE3     := FieldByName('FUNDRATE3').AsFloat;             //KTH       2009.01
          LONGMTRATE    := FieldByName('LONGMTRATE').AsFloat;             //KTH       2009.01
          HSDEDLIMIT4   := FieldByName('HSDEDLIMIT4').AsFloat;            //KTH       2010.01  (주택자금이자상환액 합계 공제시 한도 1500)  추가
          INDEDBRATE    := FieldByName('INDEDBRATE').AsFloat;            //KTH       2010.01  기본 공제율 80% 추가

     end;
end;


procedure TFpkq10601.Calculate;
var
   medappded_A           : Double;
   medappded_B           : Double;
   giveapp               : Double;
   giveoamt              : Double;
   creamt1               : Double;
   CREDEDLIMIT2          : Double;
   INVESTDEDLIMIT        : Double;
   OINVESTDEDLIMIT       : Double;  // parksh 20021217  00,01 투자조합
   //new_calctax         : Double;  // parksh 20021223
   calctax               : Double;  // parksh 20021223
   TOTCreditamt          : Double;  // Dsa2000  2003.12.  총신용카드사용액(신용+직불+지로)
   TOTOverAmt            : Double;  // Dsa2000  2003.12.  총신용카드 급여액10% 초과액(신용+직불+지로) => 총공제가능액
   C_pgiveded            : real;    // KTH 2008.12.  지정기부금 체크 변수
   houseded3             : real;    // KTH 2011.11.07  지정기부금 체크 변수

begin
     Read_FamiRecords(Table1workyy.Value, Table1empno.Value);

     if Table1.Modified = False then
        exit;

     Table1.Edit;

     Table1taxgross.Value := Table1mpaysum.Value    + Table1mbonsum.Value   +
                             Table1mcogbonsum.Value + Table1mgitasodk.Value +
                             Table1bpaysum.Value    + Table1bbonsum.Value   +
                             Table1bpaysum1.Value   + Table1bbonsum1.Value  +
                             Table1bcogbonsum.Value +
                             Table1COSTOCKTAX.Value;  //dsa2000 우리사주인출과세액 추가 2007.01.

     // 근로소득 공제                             
     if Table1taxgross.Value  <= indedbasic then
     begin
           if  Table1taxgross.Value  <= indedbasic * INDEDBRATE /100  then
               Table1laborded.Value := Table1taxgross.Value
           else
               Table1laborded.Value := indedbasic * INDEDBRATE /100 ;
     end
     else if Table1taxgross.Value  <= indedlimit2 then
       Table1laborded.Value := INDEDBASIC * INDEDBRATE /100 +
                               (Table1taxgross.Value  - INDEDBASIC )*INDEDORATE / 100
     else if Table1taxgross.Value <= indedlimit3 then
       Table1laborded.Value := INDEDBASIC * INDEDBRATE /100 +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (Table1taxgross.Value - INDEDLIMIT2)*INDEDORATE2 / 100
     else if Table1taxgross.Value <= indedlimit4 then //parksh 수정 20021217
       Table1laborded.Value := INDEDBASIC * INDEDBRATE /100 +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 /100 +
                               (Table1taxgross.Value - INDEDLIMIT3)*INDEDORATE3 / 100
     else
       Table1laborded.Value := INDEDBASIC * INDEDBRATE /100 +          //parksh 추가 20021217    근로소득공제4
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 /100 +
                               (INDEDLIMIT4 - INDEDLIMIT3) * INDEDORATE3 /100 +
                               (Table1taxgross.Value - INDEDLIMIT4)*INDEDORATE4 / 100 ;

     //2014.02.27.hjku 오류로 원단위 절삭 추가
     Table1laborded.Value := trunc(Table1laborded.Value);
     //2001. 근로소득공제 한도액 없어짐.  if Table1laborded.Value > INDEDLIMIT then  Table1laborded.Value := INDEDLIMIT;

     Table1laboramt.Value := (Table1taxgross.Value - Table1laborded.Value);  //

     // 본인공제
     Table1selfded.Value := BASDED;

     // 배우자공제
     Table1mateded.Value := Table1mate.Value * BASDED;

     // 부양가족공제
     Table1famided.Value :=  Table1familyno.Value * BASDED;

     // 기본공제
     Table1BASICDED.Value := Table1SELFDED.Value + Table1MATEDED.Value + Table1FAMIDED.Value;


     // 경로우대공제 2002세법개정      parskh 20021217  APPDED->APPOLDDED
//     Table1OLDDED.value := Table1FAMI65NO.value * APPOLDDED; 2010.01 KTH 주석처리  경로 우대 70 이상으로 변경
     Table1OLDDED.value :=  Table1FAMI70NO.value * APPOLDDED2;  //dsa2000 2004.12. 경로우대70이상 추가   Table1OLDDED.value +

     // 장애자공제 2002세법개정       parskh 20021217  APPDED->APPOLDDED
     //Table1obsded.Value := Table1obstacleno.Value * APPOLDDED;
     Table1obsded.Value := Table1obstacleno.Value * OBSDEDADD;  //2005년 세법 변경 100=>200만원

     // 부녀자공제
     Table1womanded.Value := Table1woman.Value * APPDED;

     //자녀양육비  dsa2000  2004.12. 수정 APPDED->APPOLDDED
     Table1CHILDDED.value := Table1CHILDNO.value * APPOLDDED;

     //출산입양 공제
     Table1BABYDED.value := Table1BABYNO.value * APPBABYDED;    //kth 출산입양 공제 추가

     // 추가공제
     Table1appendded.Value := Table1oldded.Value + Table1obsded.Value + Table1womanded.Value
                            + Table1childded.Value +  Table1babyded.Value;     //kth 출산입양 공제 추가

     // 소수공제자추가공제 - 폐지
     {
     if (Table1familyno.Value + Table1mate.Value = 0) then
         Table1fewded.Value := FEWDED1
     else if (Table1familyno.Value + Table1mate.Value = 1) then
         Table1fewded.Value := FEWDED2
     else
         Table1fewded.Value := 0;
     }

     ///////////////////////////////////////////////////////////////////////////
     // 다자녀추가공제 - 신설 2007년
     Table1fewded.Value := 0;
     if (Table1Manychildno.Value = 2 ) then
          Table1fewded.Value := FEWDED1
     else
     if (Table1Manychildno.Value > 2 ) then
          Table1fewded.Value := FEWDED1 + ((Table1Manychildno.Value - 2) * FEWDED2);
     ///////////////////////////////////////////////////////////////////////////



     ///////////////////////////////////////////////////////////////////////////
     // 의료보험료공제
     Table1medded.Value := Table1medamt.Value + Table1bmedamt.Value + Table1bmedamt1.Value;

     // 고용보험료공제
     Table1hireded.Value := Table1hireamt.Value + Table1bhireamt.Value + Table1bhireamt1.Value;

     // 일반보험료공제
//     Table1guarded.Value := Table3guaramt.Value;
//     Table1guarded.Value := Query3.FieldByName('guaramt').AsFloat;//guaramt.Value;
//     DBEguaramt.Text := FormatFloat('#,##0',Query4.FieldByName('guaramt').AsFloat);//guaramt.Value;

     Table1guaramt.Value := Query4.FieldByName('guaramt').AsFloat;
     Table1guarded.Value := Query4.FieldByName('guaramt').AsFloat;
     
     if ( Table1guarded.Value > INSDEDLIMIT) then
        Table1guarded.Value := INSDEDLIMIT;

    {===============================================================================
      40.10      2001.12.18         유효성      장애인전용보장성보험 추가
     ===============================================================================}
     Table1obsguarded.Value := Table1obsguaramt.Value;
     if ( Table1obsguarded.Value > OBSDEDLIMIT) then
        Table1obsguarded.Value := OBSDEDLIMIT;

     Table1insded.Value := Table1medded.Value + Table1hireded.Value + Table1guarded.Value
                         + Table1obsguarded.Value ;

     ///*  의료비 공제   ///dsa2000 2004.12. 본인의료비 추가 (SHOSAMT)
//     Table1credittotamt.value :=   Query4.FieldByName('CredittotAmt').AsFloat;
//     Table1cashamt.value      :=   Query4.FieldByName('Cashamt').AsInteger;
       Table1SHOSAMT.value      :=   Query4.FieldByName('ShosAmt').AsInteger;
       Table1GHOSAMT.value      :=   Query4.FieldByName('GhosAmt').AsInteger;
       Table1OHOSAMT.value      :=   Query4.FieldByName('OhosAmt').AsInteger;
       Table1NHOSAMT.value      :=   Query4.FieldByName('NhosAmt').AsInteger;



     Table1HOSAMT.value := Table1GHOSAMT.value + Table1OHOSAMT.value + Table1NHOSAMT.value + Table1SHOSAMT.value;
     Table1hosded.Value := Table1HOSAMT.value - Floor(Table1TAXGROSS.value * MEDORATE / 100);   //의료비 기본공제
     if (Table1hosded.Value < 0 ) then
        Table1hosded.Value := 0;

     if (Table1hosded.Value > MEDDEDLIMIT) then
        Table1hosded.Value := MEDDEDLIMIT;

     medappded_A := Table1HOSAMT.value - Floor(Table1TAXGROSS.value * MEDORATE / 100) - MEDDEDLIMIT;  //의료비 추가공제
     if (medappded_A < 0 ) then
       medappded_A := 0;

     medappded_B := Table1OHOSAMT.value + Table1NHOSAMT.value + Table1SHOSAMT.value;
     if ( medappded_A < medappded_B ) then
       Table1hosded.Value := Table1hosded.Value + medappded_A
     else
       Table1hosded.Value := Table1hosded.Value + medappded_B;

     // 본인교육비
     Table1seduded.Value := Table1seduamt.Value;

     // 유치원교육비, 영유아교육비
     if (Table1keduamt.Value > Table1keduno.Value * KINEDULIMIT) then
         Table1keduded.Value := Table1keduno.Value * KINEDULIMIT
      else
         Table1keduded.Value := Table1keduamt.Value;

     // 초중고교육비
     if Table1ceduamt.Value > Table1ceduno.Value * CJKEDULIMIT then
          Table1ceduded.Value := Table1ceduno.Value * CJKEDULIMIT
     else
          Table1ceduded.Value := Table1ceduamt.Value;

     // 대학교육비
     Table1ueduded.Value := Table1ueduamt.Value;
     if (Table1ueduded.Value > Table1ueduno.Value * UNIEDULIMIT) then
        Table1ueduded.Value := Table1ueduno.Value * UNIEDULIMIT;

     // 장애인특수교육비 parskh 20021217 추가  한도 폐지
//     if (Table1obseduded.Value > Table1obseduno.Value * OBSEDULIMIT) then
//        Table1obseduded.Value := Table1obseduno.Value * OBSEDULIMIT;
     Table1obseduded.Value := Table1obseduamt.Value;


     ///* 교육비 공제 = 본인교육비 + 유치원교육비 + 초중고교육비+ 대학교육비 */
     Table1eduded.Value := Table1seduded.Value + Table1keduded.Value + Table1ceduded.Value   //PARKSH 20021217 수정
                          + Table1ueduded.Value + Table1obseduded.Value;

     // 주택자금공제
    { Dsa2000  2003.12. 주택자금 공제 수정 =========================================
      ①주택마련저축   ②주택임차 차입금상환   ③장기주택저당차입금
      주택자금 공제시 ①+②만 공제시에는 한도가 300만원까지
                      ①+②+③ 모두 공제시에는 한도가 1000만원까지
     ===============================================================================}


//     Table1houseded.Value := floor(Table1houseamt.Value * HSRATE / 100)
//                           + Table1houseintamt.Value
//                           + Table1houseintamt2.Value;

     //주택 임차차입금 상환액  kth 2008.12
     Table1houseded.Value := floor(Table1houseamt.Value * HSRATE / 100);

     if Table1houseded.Value > HSDEDLIMIT then
        Table1houseded.Value := HSDEDLIMIT;


//2011.11.07 kth  시작

     Table1Housvsubded.Value := floor(Table1Housvsubamt.Value * HSRATE / 100);
     if (Table1Housvsubded.Value >= 480000)  then
         Table1Housvsubded.Value := 480000;



     if (Table1houseded.Value +Table1housvsubded.Value ) > HSDEDLIMIT then
         Table1Housvsubded.Value := strtoint(floattostr(HSDEDLIMIT -Table1houseded.Value));


     if (Table1Housvsubded.Value < 0 ) then
         Table1Housvsubded.Value := 0;

     Table1housvcomded.Value := floor(Table1housvcomamt.Value * HSRATE / 100);
     if (Table1housvcomded.Value >= 480000) then
         Table1housvcomded.Value := 480000;


     if (Table1houseded.Value +Table1housvsubded.Value + Table1housvcomded.Value ) > HSDEDLIMIT then
         Table1Housvsubded.Value :=  strtoint(floattostr(HSDEDLIMIT -Table1houseded.Value -Table1housvcomded.Value))   ;

     if (Table1housvcomded.Value < 0 ) then
         Table1housvcomded.Value := 0;


//2011.11.07 kth  끝


     Table1houseded2.Value := floor(Table1houseamt2.Value * HSRATE / 100);

     if (Table1houseded.Value +Table1houseded2.Value +Table1housvsubded.Value + Table1housvcomded.Value) > HSDEDLIMIT then
        Table1houseded2.Value := HSDEDLIMIT -Table1houseded.Value -Table1housvsubded.Value - Table1housvcomded.Value ;

      Table1housvempded.Value := floor(Table1housvempamt.Value * HSRATE / 100);
      if (Table1housvempded.Value >= 720000) then
          Table1housvempded.Value := 720000;

     if (Table1housvempded.Value + Table1houseded.Value +Table1houseded2.Value +Table1housvsubded.Value + Table1housvcomded.Value) > HSDEDLIMIT then
        Table1housvempded.Value := strtoint(floattostr(HSDEDLIMIT -Table1houseded.Value -Table1houseded2.Value - Table1housvsubded.Value - Table1housvcomded.Value )) ;

      houseded3 := Table1housvsubded.Value +Table1housvcomded.Value+ Table1houseded2.Value +Table1housvempded.Value;
//            housvsubded+ housvcomded + houseded2 +housvempded;

     Table1houseintded.Value :=  Table1houseintamt.Value + Table1houseintamt2.Value +Table1houseintamt3.Value;
     if Table1houseintamt3.Value > 0 then  //①+②+③ 모두 공제시  상환기간 30년 이상일때 1600만원까지... kth 주석 처리 다시 작업
     begin
          if ( Table1houseintded.value +  Table1houseded.Value + houseded3 > HSDEDLIMIT4 ) then
               Table1houseintded.value :=  HSDEDLIMIT4 - Table1houseded.Value-houseded3;
     end
     else if Table1houseintamt2.Value > 0 then  //①+②+③ 모두 공제시  상환기간 15년 이상일때 1000만원까지... kth 주석 처리 다시 작업
     begin
          if ( Table1houseintded.value +  Table1houseded.Value + houseded3 > HSDEDLIMIT3 ) then
               Table1houseintded.value :=  HSDEDLIMIT3 - Table1houseded.Value -houseded3;
     end
     else if Table1houseintamt.Value > 0 then  //①+②+③ 모두 공제시 상환기간 10년 이상일때 600만원까지...
     begin
          if ( Table1houseintded.value+  Table1houseded.Value +houseded3> HSDEDLIMIT2 ) then
               Table1houseintded.value :=  HSDEDLIMIT2 - Table1houseded.Value -houseded3;
     end;


{     if Table1houseintamt3.Value > 0 then  //①+②+③ 모두 공제시  상환기간 30년 이상일때 1500만원까지... kth 주석 처리 다시 작업
     begin
          if (HSDEDLIMIT4  -Table1houseintded.value - Table1houseded.value > Table1houseded2.value  ) then
              Table1houseded2.value := Table1houseded2.value
          else
              Table1houseded2.value := HSDEDLIMIT4- Table1houseintded.value - Table1houseded.value;
     end
     else
     if Table1houseintamt2.Value > 0 then  //①+②+③ 모두 공제시  상환기간 15년 이상일때 1000만원까지... kth 주석 처리 다시 작업
     begin
          if (HSDEDLIMIT3  -Table1houseintded.value - Table1houseded.value > Table1houseded2.value  ) then
              Table1houseded2.value := Table1houseded2.value
          else
              Table1houseded2.value := HSDEDLIMIT3- Table1houseintded.value - Table1houseded.value;
     end
     else
     if Table1houseintamt.Value > 0 then  //①+②+③ 모두 공제시  상환기간 10년 이상일때 1000만원까지... kth 주석 처리 다시 작업
     begin
          if (HSDEDLIMIT2  -Table1houseintded.value - Table1houseded.value > Table1houseded2.value  ) then
              Table1houseded2.value := Table1houseded2.value
          else
              Table1houseded2.value := HSDEDLIMIT2- Table1houseintded.value - Table1houseded.value;
     end;

     if  Table1houseded2.value < 0 then
         Table1houseded2.value := 0;
                                        }




   //dsa2000  END..................................................................

     // 전액기부금공제
     Table1agiveded.Value := Table1agiveamt.Value;

     ///* 정치기부금 : 세액공제 신설 => dsa2000  2004.12. 세액공제(10만원) 이상의 금액은 전액기부금 처리.*/
     ///* 정치기부금 : 주민세 포함 10만원 세액공제(90,909원 공제)로 변경 2007년*/
     if (Table1Poliamt.Value > POLILIMIT ) then
       begin
          Table1Agiveded.Value := Table1Agiveded.Value + (Table1Poliamt.Value - POLILIMIT);
	  Table1Polided.Value  := Trunc(POLILIMIT*100/110);
       end
     else
          Table1Polided.Value  := Trunc(Table1Poliamt.Value*100/110);   ///*polided 정치자금 세액공제*/

     //parksh 20021223 추가 특례지정기부금
     Table1SPGIVDED.value := Table1SPGIVAMT.value;
     if ( Table1SPGIVDED.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value) * SPGIVDEDRATE / 100 ) ) then
        Table1SPGIVDED.value := (Table1LABORAMT.value-Table1AGIVEDED.Value) *SPGIVDEDRATE / 100 ;



{  // 지정기부금
  //2002.12.9 유효성 사립학교기부금은 법정기부금으로 통합    pgiveded := pgiveamt + sgiveamt;
  pgiveded := pgiveamt ;
  pgiveded2 := pgiveamt2 ;         // 2008.12 kth  pgiveamt2 종교단체외 기부금 분리 수정
  if pgiveded <> 0 then            // 2008.12 kth  pgiveamt2 종교단체기부금 0 아니면
  begin
       c_pgiveamt :=  pgiveded2;   // 종교 단체 제외한 지정기부금을 체크 변수에 넣는다 .
       if ( pgiveded2 > ((laboramt-agiveded-spgiveded) * GIVDEDRATE2 / 100) ) then                  //2008.12 kth  pgiveamt2 종교단체 기부금 제외
       begin
            pgiveded  := (laboramt-agiveded-spgiveded) * GIVDEDRATE2 / 100 ;                       // 지정기부금 한도 15% 넣는다.
            if ( pgiveded2 > ((laboramt-agiveded-spgiveded) * (GIVDEDRATE2-GIVDEDRATE) / 100)) then  //종교단체이외에 금액이 5%넘으면
                 c_pgiveamt := (laboramt-agiveded-spgiveded) * GIVDEDRATE2 / 100 ;                  // 지정기부금 5%에 금액을 체크 변수에 넣는다.
       end;
  end
  else
  if ( pgiveded > ((laboramt-agiveded-spgiveded) * GIVDEDRATE / 100)+ c_pgiveamt) then              //2008.12 kth  지정 기부금(종교단체 기부금 )
       pgiveded := (laboramt-agiveded-spgiveded) * GIVDEDRATE / 100 + c_pgiveamt;}
     // 지정기부금
//     Table1PGIVEDED.value := Table1PGIVEAMT.value;
//     Table1PGIVEDED2.value := Table1PGIVEAMT2.value;
     C_pgiveded := 0.0;
     if Table1PGIVEAMT.value <> 0 then
     begin
           C_pgiveded  :=  Table1PGIVEAMT2.value; //   C_pgiveded min[소득금액, 5% ]
           if (Table1PGIVEAMT2.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value ) * (GIVDEDRATE2-GIVDEDRATE) / 100 ) ) then
               C_pgiveded :=   ((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value) *(GIVDEDRATE2-GIVDEDRATE) / 100) ;

           Table1PGIVEDED.Value  := Table1PGIVEAMT.value + C_pgiveded;
           if  (Table1PGIVEAMT.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value )*
                                        (GIVDEDRATE) / 100) + C_pgiveded ) then
                Table1PGIVEDED.Value := floor(((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value) *
                                         (GIVDEDRATE / 100) + C_pgiveded)) ;

     end
     else
     begin
         Table1PGIVEDED.Value  := Table1PGIVEAMT2.value;
         if ( Table1PGIVEAMT2.value > (Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value ) * GIVDEDRATE2 / 100) then              //2008.12 kth  지정 기부금(종교단체 기부금 )
              Table1PGIVEDED.Value := floor((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value ) * GIVDEDRATE2 / 100);

     end;

     // 일반기부공제 parksh 20021223 수정
//     if ( Table1PGIVEDED.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value ) * GIVDEDRATE / 100 ) ) then
//        Table1PGIVEDED.value := (Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value) *GIVDEDRATE / 100 ;






     ////* 기부금공제 = 전액기부금  + 특례지정기부금 + 지정기부금
     Table1GIVEDED.value := Table1AGIVEDED.value + Table1PGIVEDED.value +  Table1SPGIVDED.Value ;
     Table1GIVEDED.value := floor(Table1GIVEDED.value);

{     //* 결혼.장례.이사비용공제(신설) - 건당 100만  2004.12. dsa2000  과세총액이 2500미만인 근로자.*/   kth 2010.01 주석 처리
     if Table1TAXGROSS.Value > 25000000 then  //DBEspecialaddded
       Table1Specaddded.value := 0
     else
       Table1Specaddded.value := Trunc(Table1Specaddno.value * SPECADDLIMIT);  }


     ///* 특별공제 = 보험료공제 + 의료비공제 + 교육비공제 + 주택자금공제 +  기부금공제 ( + Table1Specaddded.value +  결혼.장례.이사비용공제 주석)*/
     Table1SPECIALDED.value := Table1INSDED.value + Table1HOSDED.value + Table1EDUDED.value +
                               Table1HOUSEDED.value+ Table1HOUSEINTDED.value + Table1GIVEDED.value;

     // 표준공제
     Table1standded.value := 0;
     if ( Table1specialded.Value < STDDED) then
     begin
          Table1insded.Value     := 0;
          Table1hosded.Value     := 0;
          Table1eduded.Value     := 0;
          Table1houseded.Value   := 0;
          Table1giveded.Value    := 0;
          Table1medded.Value     := 0;
          Table1hireded.Value    := 0;
          Table1guarded.Value    := 0;
          Table1obsguarded.Value := 0;
          Table1seduded.Value    := 0;
          Table1keduded.Value    := 0;
          Table1keduded1.Value   := 0;
          Table1ceduded.Value    := 0;
          Table1ueduded.Value    := 0;
          Table1obseduded.Value  := 0;  //parksh 20021217 추가
          Table1agiveded.Value   := 0;
          Table1pgiveded.Value   := 0;
          Table1spgivded.Value   := 0;  //parksh 20021217 추가
//          Table1specialded.Value := STDDED;
          Table1specialded.Value := 0 ;
          Table1standded.Value   := STDDED ;
     end;


{===============================================================================
   40.10      2001.12.18         유효성      연금보험료 추가  |(국민연금)
===============================================================================}
      Table1anuded.Value := floor(Table1anuamt.Value + Table1banuamt.Value + Table1banuamt1.Value ) ; // 20021217 parksh 연금보험료 전액공제로 바뀜


     // 개인연금
     Table1pended.Value := floor((Table1penamt1.Value + Table1penamt2.Value) * PENRATE / 100);
     if (Table1pended.Value > PENDEDLIMIT) then
        Table1pended.Value := PENDEDLIMIT;

{================================================================================
   41.20      2001.12.18.        유효성          연금저축 공제 추가
================================================================================}
    Table1npended.Value := Table1npenamt.Value + Table1npenamt2.Value ;
    if (Table1npended.Value > NPENDEDLIMIT) then
       Table1npended.Value := NPENDEDLIMIT;

     // 1998.12.09 add leerk
     //투자조합
     INVESTDEDLIMIT := floor(Table1taxgross.value  * INVESTDEDRATE /100) ;
     Table1investded.value      := floor(Table1investamt.value * INVESTRATE /100) ;
     if (Table1investded.value > INVESTDEDLIMIT) then
        Table1investded.value := INVESTDEDLIMIT;

    //00~01년 투자조합    20021217 parksh 추가
     OINVESTDEDLIMIT := floor(Table1taxgross.value  * OINVESTDEDRATE /100) ;          //    2010.02 kth 투자 조합 공제율 없어서 30% 넣고 처리
     Table1oinvestded.value      := floor(Table1oinvestamt.value * INVESTRATE /100) ;//     OINVESTRATE ->  INVESTRATE 변경 10% 으로 변경 처리 함.
     if (Table1oinvestded.value > OINVESTDEDLIMIT) then
        Table1oinvestded.value := OINVESTDEDLIMIT;

      Table1tinvestded.value := Table1oinvestded.value + Table1investded.value ;  //parksh  20021213  투자조합공제액합

     //우리사주조합 출연금 공제 추가 ...2006.12. 
     if Table1costockamt.value > COSTOCKLIMIT then
        Table1costockded.value := COSTOCKLIMIT
     else
        Table1costockded.value := Table1costockamt.value;

     {================================================================================
       2005.12. Dsa2000  신용카드공제 계산방법 수정....
     ① 신용카드등 사용금액 = 신용카드+직불카드+학원지로납부금액+현금영수증
     ② 초과금액 = ①-(총급여액×15%)
     ③ 신용카드 =(②×신용카드금액/①)×20%
     ④ 학원비   =(②×지로납부금액/①)×20%
     ⑤ 직불카드 =(②×직불카드사용금액/①)×20%
     ⑥ 현금영수증  =(②×현금영수증 금액/①)×20%  --2005.11
     ☞ 총 공제금액 : ③+④+⑤+⑥ :
     ☞ 한도액 :  총급여액×20%  와 500만원 중   적은 금액
     ================================================================================}
//     DBEguaramt.Text := FormatFloat('#,##0',Query4.FieldByName('guaramt').AsFloat);//guaramt.Value;

     TOTCreditamt := 0;

     Table1creditamt.value    :=   Query4.FieldByName('CredittotAmt').AsFloat;
     Table1credittotamt.value :=   Query4.FieldByName('CredittotAmt').AsFloat;
     Table1cashamt.value      :=   Query4.FieldByName('Cashamt').AsInteger;

//     Table1cashamt.value := Table1credittotamt.value;

{①} TOTCreditamt := Table1credittotamt.value + Table1debitamt.value + Table1giroamt.value + Table1cashamt.value -Table1Creditdedamt.Value;
{②} TOTOverAmt   := TOTCreditamt - (Table1taxgross.Value * CREORATE / 100);

{     if  (Table1Creditamt_Med.Value > (Table1TaxGross.Value * 3 / 100)) then  //(Table1Hosded.Value <> 0) and 의료비 제외
     begin
        TOTOverAmt := TOTOverAmt - (Table1Creditamt_Med.Value - (Table1Hosamt.Value - Table1Hosded.Value) - Table1Creditdedamt.Value);
     end;}

//     TOTOverAmt := TOTOverAmt - (Table1Creditamt_Med.Value - (Table1Hosamt.Value - Table1Hosded.Value) - Table1Creditdedamt.Value);
     if  TOTOverAmt > 0 then       //신용카드공제금 누적계산....
     begin
{③}     Table1CREDITDED.value := (TOTOverAmt * (Table1creditamt.value  -Table1Creditdedamt.Value) / TOTCreditamt * CREDEDLRATE  / 100);
{④}     Table1CREDITDED.value :=  Table1CREDITDED.value
                                + (TOTOverAmt * Table1giroamt.value   / TOTCreditamt * GIRODEDRATE  / 100);
{⑤}     Table1CREDITDED.value :=  Table1CREDITDED.value
                                + (TOTOverAmt * Table1debitamt.value  / TOTCreditamt * DEBITDEDRATE / 100);
{⑥}     Table1CREDITDED.value :=  Table1CREDITDED.value
                                + (TOTOverAmt * Table1cashamt.value   / TOTCreditamt * CREDEDLRATE  / 100); //dsa2000  2005.11. 현금영수증 추가.

         //한도 체크 : 총과세급여액의 20%와 500만원중 적은금액 */
         creamt1 := floor(Table1taxgross.Value * CREDEDLRATE / 100) ; //* 총급여액의 20% */
         if (creamt1 < CREDEDLIMIT) then
         begin
              if (Table1CREDITDED.value > creamt1 ) then
                  Table1creditded.value  := creamt1;
         end
         else
           begin
                if (Table1CREDITDED.value > CREDEDLIMIT  ) then
                    Table1creditded.value  := CREDEDLIMIT;
           end;
     end
     else
       Table1creditded.value  := 0;

//2008.12 kth  펀드 공제금.
       Table1Fundded.value :=  floor((Table1fundamt1.value *  FUNDRATE1/100) +
                                     (Table1fundamt2.value *  FUNDRATE2/100) +
                                     (Table1fundamt3.value *  FUNDRATE3/100));



// 2003.12. Dsa2000  추가 End...................................................

      {===============================================================================
       2003.12. Dsa2000  추가....  ==>> 2004년 폐지////
       외국인임직원 해외근무에 따른 추가비용 소득공제
        1.외국인임직원의 해외근무수당 비과세 한도 확대  - 월정액급여의 40% : 하나로통신 해당없음.
        2.외국인임직원이 우리나라에 근무함으로 인해 추가로 지출한 비용에 대하여 소득공제
       ===============================================================================}
{       Table1Foreignded.Value := 0;
       If (Copy(Table1Juminid.Value,8,1) = '5') Or (Copy(Table1Juminid.Value,8,1) = '6') Then
         begin
           Table1Foreignded.Value := ( Table1taxgross.Value - Table1Foreignamt.Value ) * FOREDEDRATE / 100;     //공제한도 계산...
           if Table1Foreignamt.Value < Table1Foreignded.Value then
              Table1Foreignded.Value := Table1Foreignamt.Value;
         end;   }
// 2003.12. Dsa2000  추가 End...................................................

     // 소득공제계
     Table1incomeded.Value  :=  Table1pended.Value       //2013.11.21.hjku. 주택마련저축 누락오류 수정
                             +  Table1houseded2.Value +  Table1HOUSVSUBDED.Value +  Table1HOUSVCOMDED.Value +  Table1HOUSVEMPDED.Value
                             + Table1tinvestded.value     //2002.12.17 parksh 수정
                             + Table1creditded.value
                             + Table1npended.Value
                             + Table1costockded.value + Table1Fundded.value ;    //2007.01.  dsa2000


{     Table1incomeded.Value := Table1basicded.Value   + Table1appendded.Value + Table1specialded.Value
                             + Table1pended.Value    + Table1fewded.Value + Table1houseded2.Value
                             + Table1tinvestded.value     //2002.12.17 parksh 수정
                             + Table1creditded.value + Table1anuded.Value
                             + Table1npended.Value   + Table1standded.Value //parksh 20030128 Table1standded.Value추가
                             + Table1Foreignded.value+    //2003.12.  dsa2000 추가...
                             + Table1costockded.value + Table1Fundded.value ;    //2007.01.  dsa2000}

     Table1taxlevel.Value := Table1laboramt.Value - (Table1basicded.Value   + Table1appendded.Value + Table1specialded.Value
                             + Table1pended.Value    + Table1fewded.Value
                                                       //2013.11.21.hjku. 주택마련저축 누락오류 수정  
                             + Table1houseded2.Value + Table1HOUSVSUBDED.Value +  Table1HOUSVCOMDED.Value +  Table1HOUSVEMPDED.Value
                             + Table1tinvestded.value     //2002.12.17 parksh 수정
                             + Table1creditded.value + Table1anuded.Value
                             + Table1npended.Value   + Table1standded.Value //parksh 20030128 Table1standded.Value추가
                             + Table1Foreignded.value+    //2003.12.  dsa2000 추가...
                             + Table1costockded.value + Table1Fundded.value) ;    //2007.01.  dsa2000};

     if Table1taxlevel.Value < 0 then
        Table1taxlevel.Value := 0;

     if Table1taxlevel.Value = 0 then
        Table1calctax.Value := 0;

     Table1calctax.Value := GetTax(Table1taxlevel.Value);

{===============================================================================
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
   40.01      2001.01.08.         유효성                        새로운 산출세액--> 근로소득 세액공제 재계산을 위한
===============================================================================}
//2001.12.31 유효성 수정 laboramt --> taxgross로
//     if Table1laboramt.Value > 0 then
//        new_calctax := ceil(Table1calctax.Value *
//                      ((Table1laboramt.Value - Table1mcogbonsum.Value - Table1bcogbonsum.Value ) / Table1laboramt.Value)) ;

    // 2002.12.23  parksh  근로소득세액 공제액 계산시 인정상여도 포함하여 공제액 계산으로 소득세법 개정    new_calctax 삭제
   {  if Table1taxgross.Value > 0 then
        new_calctax := ceil(Table1calctax.Value *
                      ((Table1taxgross.Value - Table1mcogbonsum.Value - Table1bcogbonsum.Value ) / Table1taxgross.Value)) ;

    }
   // 근로소득세액공제    parksh 20021223
   //  if Table1calctax.Value < TAXDEDBASIC then

     if Table1calctax.Value < TAXDEDBASIC then
        Table1incomtded.Value := floor( Table1calctax.Value * TAXDEDBRATE / 100)
     else
        Table1incomtded.Value := floor((TAXDEDBASIC * TAXDEDBRATE / 100)
                       + ( Table1calctax.Value - TAXDEDBASIC)* TAXDEDORATE / 100);

     if (Table1incomtded.Value > TAXDEDLIMIT) then
        Table1incomtded.Value := TAXDEDLIMIT;

//2001.1.10 재형저축세액공제 삭제
// 재형저축세액공제
//     Table1propded.Value := floor((Table1propamt1.Value+Table1propamt2.Value) * PRODEDRATE / 100);

     // 주택차입금이자세액공제
     Table1hloanded.Value := floor(Table1hloanamt.Value * HSINTRATE / 100);

     // 주식저축공제 없어짐 20021217 parksh 수정
     //Table1stkded.Value := floor(Table1stkamt.Value * STKDEDRATE / 100);

//     if (Table1stkded.Value > STKDEDLIMIT) then
//        Table1stkded.Value := STKDEDLIMIT;

{================================================================================
   41.20      2001.12.07.        유효성          장기주식저축 세액 공제 추가
================================================================================}
    Table1lstkded.Value := floor(Table1lstkamt.Value * LSTKDEDRATE / 100) ;

    //parksh 20021217 장기주식저축세 바뀜 2001,2002년 각각   ==> 2004.12. 폐지.
{    Table1olstkded.Value := floor(Table1olstkamt.Value * OLSTKDEDRATE / 100) ;
    Table1tlstkded.Value := Table1olstkded.Value + Table1lstkded.Value ;  // 01년장기증권저축 + 02년 장기증권저축
}
     //  외국납부세액공제
     Table1forided.Value := Table1foriamt.Value;

     if (Table1laboramt.Value > 0) and
        (Table1forided.Value > Table1calctax.Value * Table1foriamt.Value / Table1laboramt.Value )  then
        Table1forided.Value := Table1calctax.Value * Table1foriamt.Value / Table1laboramt.Value;

     ///*세액공제 합계*/
     Table1TDEDSUM.value := Table1INCOMTDED.value + Table1FORIDED.value +
                            Table1HLOANDED.value  + //2004페지...+ Table1TLSTKDED.value ; // parksh 20021223
                            Table1Polided.value; //정치자금세액공제 추가 2004.12.

     Table1dintax.Value  := (Table1calctax.Value - Table1tdedsum.Value);

     if (Table1dintax.Value < 0 ) then
        Table1dintax.Value := 0;

     // 결정세액
     Table1dintax.Value   := floor(Table1dintax.Value / 10 )* 10 ;   // 원단위 절사
     Table1djutax.Value   := Table1dintax.Value * 0.1;
     Table1djutax.Value   := floor(Table1djutax.Value / 10 ) * 10;   // 원단위 절사
     Table1dnongtax.Value := floor( ( Table1hloanded.Value + (GetTax(Table1tinvestded.Value + Table1taxlevel.Value) - Table1calctax.Value)) * NONGRATE / 100) ;
     Table1dnongtax.Value := floor(Table1dnongtax.Value / 10 ) * 10;


     // 징수세액
     Table1intax.Value    := Table1mintax.Value + Table1bintax.Value + Table1bintax1.Value;
     Table1jutax.Value    := Table1mjutax.Value + Table1bjutax.Value + Table1bjutax1.Value;;
     Table1nongtax.Value  := Table1mnongtax.Value+Table1bnongtax.Value+Table1bnongtax1.Value;

     // 정산세액
     Table1yintax.Value   := Table1dintax.Value   - Table1intax.Value;
     Table1yjutax.Value   := Table1djutax.Value   - Table1jutax.Value;
     Table1ynongtax.Value := Table1dnongtax.Value - Table1nongtax.Value;
     Table1ycalctax.Value := Table1yintax.Value   + Table1yjutax.Value + Table1ynongtax.Value;


end;

procedure TFpkq10601.SetTaxRate;
var
   i : integer;
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select *       ');
          SQL.Add('from   pkcptax ');
          SQL.Add('where  taxnum = :L1');
          ParamByName('L1').AsString := TAXNUM;
          Open;

          taxreccnt := RecordCount;

          for i := 0 to RecordCount -1 do
          begin
               taxtbl[i].taxfr   := FieldByName('taxpayfr').AsFloat;
               taxtbl[i].taxto   := FieldByName('taxpayto').AsFloat;
               taxtbl[i].taxrate := FieldByName('taxrate').AsFloat;
               taxtbl[i].yearded := FieldByName('yearded').AsFloat;
               next;
          end;
     end;
end;

function  TFpkq10601.GetTime : String;
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') a ');
          SQL.ADD('   FROM DUAL ');
          Open;

          result := FieldBYName('a').AsString;
     end;
end;

procedure  TFpkq10601.SetEmpTime;
begin
     OraConnect;
     Application.ProcessMessages;
     Lempno.Caption := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;
end;


function TFpkq10601.GetTax(stdamt : double) : double;
var
   i : integer;
begin
     result := 0;
     
     for i := 0 to taxreccnt - 1 do
     begin
          if (taxtbl[i].taxfr < stdamt) and (taxtbl[i].taxto >= stdamt) then
          begin
               result := floor(stdamt * taxtbl[i].taxrate / 100 - taxtbl[i].yearded);
               exit;
          end;
     end;
end;


procedure TFpkq10601.BBcancelClick(Sender: TObject);
begin
     if Table1.Modified = False then
        exit;

     Table1.cancel;
end;

procedure TFpkq10601.BBsaveClick(Sender: TObject);
begin
     if Table1.Modified = False then
        exit;

     Table1.Post;

//dsa2000   2004.08.25.  작업자, 작업시간 업데이트 ...
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' Update PKMYSModify_2010 Set (Writetime, Writeman) =  ');
          SQL.ADD('      ( Select TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), + ''' + Pempno + ''' ');
          SQL.ADD('          FROM DUAL )');
          SQL.ADD('  WHERE Empno = + ''' + Eempno.Text + ''' ');
          ExecSQL;
     end;
end;

procedure TFpkq10601.BBexitClick(Sender: TObject);
begin
     close;
end;

procedure TFpkq10601.FormCreate(Sender: TObject);
begin
     IsFirst := True;
     GSEmpno          := PassEmp(cmdline,1);
end;

procedure TFpkq10601.FormPaint(Sender: TObject);
begin
     if IsFirst = True then
     begin
          Application.ProcessMessages;
          SetEmpTime;
          Table1.Open;
          Read_FamiRecords('2010', Table1Empno.value);
          ReadPkcysbas;
          SetTaxRate;
          IsFirst := False;
     end;
end;

procedure TFpkq10601.DBEmpaysumExit(Sender: TObject);
begin
     if Table1.Modified = True then
        Calculate;
end;

procedure TFpkq10601.BBempnoClick(Sender: TObject);
begin
     Try
          FKeyEmpno := TFKeyEmpno.Create(Self);
          FKeyEmpno.Edempno.Text := Eempno.Text;
          FKeyEmpno.showmodal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
               Eempno.Text := FKeyEmpno.v_KeyEmpno;
               DBEkorname.Text := FKeyEmpno.v_KeyKorname;
               Table1.Cancel;
               Table1.Filter := 'empno = ''' + Eempno.Text + '''';
               Table1.Filtered := true;
               Pdeptname.Caption := GetDeptname(Eempno.Text);
               //2014.02.27.hjku 디스플레이오류로 추가
               Read_FamiRecords('2010', Eempno.Text);
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TFpkq10601.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          with Query1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno ');
               SQL.Add('from PKMYSModify_2010 ');
               SQL.Add('where empno like :L1 or korname like :L1');
               ParamByName('L1').AsString := Eempno.Text + '%';
               Open;
               if RecordCount > 1 then
                  BBempnoClick(Sender);
          end;
          Table1.cancel;
          Table1.Filter := 'empno = ''' + Eempno.Text + '''';
          Table1.Filtered := True;
          Pdeptname.Caption := GetDeptname(Eempno.Text);

          Read_FamiRecords('2010', Eempno.Text);
     end;
end;

procedure TFpkq10601.EempnoExit(Sender: TObject);
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select empno ');
          SQL.Add('from PKMYSModify_2010 ');
          SQL.Add('where empno like :L1 or korname like :L1');
          ParamByName('L1').AsString := Eempno.Text + '%';
          Open;
          if RecordCount > 1 then
             BBempnoClick(Sender);
     end;
     Table1.cancel;
     Table1.Filter := 'empno = ''' + Eempno.Text + '''';
     Table1.Filtered := True;
     Pdeptname.Caption := GetDeptname(Eempno.Text);

     if (Copy(Table1Juminid.value,8,1) = '5') or (Copy(Table1Juminid.value,8,1) = '6') then
       begin
          Button1.Visible := True;
          MessageDlg('외국인은 총지급액의 30% 비과세 처리합니다. 위의 버튼 처리 하시기 바랍니다'
                     , mtInformation, [mbOk], 0);
       end
     else
          Button1.Visible := False;
end;

function TFpkq10601.GetDeptname(empno : String) : String;
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select deptname ');
          SQL.Add('from PKMYSModify_2010 a, pycdept b ');
          SQL.Add('where a.orgnum=b.orgnum and a.deptcode=b.deptcode and empno= :L1');
          ParamByName('L1').AsString := empno;
          Open;
          result := FieldByName('deptname').AsString;
     end;
end;

procedure TFpkq10601.BBhelpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  try
    HelpForm.Programid := 'PKQ1060A';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

procedure TFpkq10601.Button1Click(Sender: TObject);
var
  mpaysum, mbonsum, mcogbonsum, mgitasodk : Double;
begin
     ///////////////////////////////////////////////////////////////////////////
     //dsa2000   2005.01.  외국인 과세특례 신설에 따른 사항
     //                 => 총근로소득(비과세포함)의 30%를 추가로 비과세 처리한다.
     if (Copy(Table1Juminid.value,8,1) = '5') or (Copy(Table1Juminid.value,8,1) = '6') then
     begin
{       with Query2 do
         begin
           Close;
           SQL.Clear;
           Sql.Add ( 'select sum(nvl(BASICAMT,0)   +nvl(INFOAMT,0)     +nvl(DUTYAMT,0)+    ');
           Sql.Add ( '           nvl(BBASICAMT,0)  +nvl(BINFOAMT,0)   +nvl(BDUTYAMT,0)+   ');
           Sql.Add ( '           nvl(MATEAMT,0)    +nvl(PARTAMT,0)    +nvl(CHILDAMT,0)+   ');
           Sql.Add ( '                nvl(OVTMAMT,0)    +nvl(SPTMAMT,0)    +nvl(MCARTAXAMT,0)+ ');
           Sql.Add ( '                nvl(BOKJISUPAMT,0)+nvl(AIDAMT1,0)    +nvl(AIDAMT2,0)+    ');
           Sql.Add ( '                nvl(AIDAMT3,0)    +nvl(LICEAMT,0)    +nvl(MBONAMT,0)+    ');
           Sql.Add ( '                nvl(ODTAXAMT,0)   +nvl(SOPAYSUM,0)   +nvl(longsupamt,0)+ ');
           Sql.Add ( '                nvl(yueduamt,0)   +nvl(selfeduamt,0) +                   ');
           Sql.Add ( '                nvl(drvliceamt,0) +nvl(lectsupamt,0) +                   ');
           Sql.Add ( '                nvl(edusupamt,0)  +nvl(medsupamt,0)  +nvl(supamt1,0)  +  ');
           Sql.Add ( '                nvl(supamt2,0)    +nvl(supamt3,0)    +                   ');
           Sql.Add ( '                nvl(fixpay,0)     +nvl(bfixpay,0)    +nvl(quaterpay,0)+  ');
           Sql.Add ( '                nvl(holipay,0)    +nvl(roleamt,0)    +nvl(taxpay   ,0)+  ');
           Sql.Add ( '                nvl(childeduamt,0)+nvl(trainsupamt,0)+nvl(ovmcamt,0)),   ');
           Sql.Add ( '            sum(nvl(BONUSAMT,0)   +nvl(INCENTAMT,0)  +nvl(TRAINAMT,0)+   ');
           Sql.Add ( '                nvl(WINTERAMT,0)  +nvl(HOMESUPAMT,0) +nvl(YBONAMT,0)+    ');
           Sql.Add ( '                nvl(SBONTAXAMT,0) +nvl(SOBONSUM,0)),                     ');
           Sql.Add ( '            sum(nvl(kita3,0))                                            ');
           Sql.Add ( '     from   pkhphis r                                                    ');
           Sql.Add ( '    where  substr(paydate,1,4) =''2004'' and r.empno=''1854''        ');
           Open;
         end;     }
       mpaysum    := Table1mpaysum.Value;
       mbonsum    := Table1mbonsum.Value;
       mcogbonsum := Table1mcogbonsum.Value;
       mgitasodk  := Table1mgitasodk.Value;

       Table1.Edit;
       /////////////////////////////////////
       Table1mpaysum.Value    :=(Table1mpaysum.Value + Table1MNOTAX.value)
                               - floor((Table1mpaysum.Value + Table1MNOTAX.value) * 30 / 100)
                               - Table1MNOTAX.value;
       Table1mbonsum.Value    := Table1mbonsum.Value    - floor(Table1mbonsum.Value    * 30 / 100);
       Table1mcogbonsum.Value := Table1mcogbonsum.Value - floor(Table1mcogbonsum.Value * 30 / 100);
       Table1mgitasodk.Value  := Table1mgitasodk.Value  - floor(Table1mgitasodk.Value  * 30 / 100);
       Table1Bpaysum.Value    :=(Table1Bpaysum.Value + Table1BNOTAX.value)
                               - floor((Table1Bpaysum.Value + Table1BNOTAX.value) * 30 / 100);
       Table1Bbonsum.Value    := Table1Bbonsum.Value    - floor(Table1Bbonsum.Value    * 30 / 100);
       Table1Bcogbonsum.Value := Table1Bcogbonsum.Value - floor(Table1Bcogbonsum.Value * 30 / 100);


       Table1TAXGROSS.value   := Table1MPAYSUM.value + Table1BPAYSUM.value
                               + Table1MBONSUM.value + Table1BBONSUM.value
                               + Table1MCOGBONSUM.value
                               +Table1Bcogbonsum.Value + Table1mgitasodk.Value ;

       Table1NOTAX.value      := Table1MNOTAX.value  + Table1BNOTAX.value
                               + floor((mpaysum + Table1MNOTAX.value) * 30 / 100)
                               + floor(mbonsum    * 30 / 100)
                               + floor(mcogbonsum * 30 / 100)
                               + floor(mgitasodk  * 30 / 100)
                               + floor((Table1Bpaysum.Value + Table1BNOTAX.value) * 30 / 100)
                               + floor(Table1Bbonsum.Value    * 30 / 100)
                               + floor(Table1Bcogbonsum.Value * 30 / 100)  ;
     end;
     ///////////////////////////////////////////////////////////////////////////

end;


 ////////2010.10.28 kth 추가 전체 ///////
Procedure TFpkq10601.Read_FamiRecords(WorkYY, EmpNo : String);
var
  tmp_medamt : double;
  SQLStr        : String;
begin

  with Query3 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.WORKYY, A.EMPNO, A.FAMINAME, FAMIREL, JUMINID, AGE,                       ');
      Sql.Add('       nvl(DEDYN,''N'')                                 DEDYN   ,                  ');
      Sql.Add('       nvl(OBSYN,''N'')                                 OBSYN   ,                  ');
      Sql.Add('       nvl(DEDYN3,''N'')                                DEDYN3  ,                  ');
      Sql.Add('       nvl(DEDAMT4A,0)                                  DEDAMT4A,                  ');
      Sql.Add('       nvl(DEDAMT4B,0)                                  DEDAMT4B,                  ');
      Sql.Add('       nvl(DEDAMT5A,0)                                  DEDAMT5A,                  ');
      Sql.Add('       nvl(DEDAMT5B,0)                                  DEDAMT5B,                  ');
      Sql.Add('       nvl(DEDAMT6A,0)                                  DEDAMT6A,                  ');
      Sql.Add('       nvl(DEDAMT6B,0)                                  DEDAMT6B,                  ');
      Sql.Add('       nvl(DEDAMT7A,0)                                  DEDAMT7A,                  ');
      Sql.Add('       nvl(DEDAMT7B,0)                                  DEDAMT7B,                  ');
      Sql.Add('       nvl(DEDAMT8A,0)                                  DEDAMT8A,                  ');
      Sql.Add('       nvl(DEDAMT9A,0)                                  DEDAMT9A,                  ');
      Sql.Add('       nvl(DEDAMT9B,0)                                  DEDAMT9B,                  ');
      Sql.Add('       nvl(DEDAMT10A,0)                                 DEDAMT10A,                 ');
      Sql.Add('       nvl(DEDAMT4A,0) + nvl(DEDAMT4B,0)                DEDAMT4 ,                  ');
      Sql.Add('       nvl(DEDAMT5A,0) + nvl(DEDAMT5B,0)                DEDAMT5 ,                  ');
      Sql.Add('       nvl(DEDAMT6A,0) + nvl(DEDAMT6B,0)                DEDAMT6 ,                  ');
      Sql.Add('       nvl(DEDAMT7A,0)+nvl(DEDAMT7B,0)                  DEDAMT7 ,                  ');
      Sql.Add('       nvl(DEDAMT8A,0)                                  DEDAMT8 ,                  ');
      Sql.Add('       max((Select CODENAME From PKMYSCOD Where A.FAMIREL = CODENO))   CODENAME,   ');
      Sql.Add('       BABYYN,nvl(DEDAMT10B,0)                          DEDAMT10,                  '); //kth  출산여부 저장 2009.01.
      Sql.Add('       nvl(DEDAMT11A,0) DEDAMT11A ,nvl(DEDAMT11B,0) DEDAMT11B,                     ');
      Sql.Add('       nvl(DEDAMT11A,0) + nvl(DEDAMT11B,0) DEDAMT11 ,                              ');
      Sql.Add('       nvl(DEDAMT12A,0) DEDAMT12A ,nvl(DEDAMT12B,0) DEDAMT12B,                     ');
      Sql.Add('       nvl(DEDAMT12A,0) + nvl(DEDAMT12B,0) DEDAMT12                                ');
      Sql.Add('  FROM PKMYSFAModify_2010  A                                                                 ');
      Sql.Add(' WHERE A.WORKYY   = '''+WorkYY+'''                                                 ');
      Sql.Add('   AND A.EMPNO    = '''+Empno +'''                                                 ');
      SQL.Add(' GROUP BY A.WORKYY, A.EMPNO, A.FAMINAME, FAMIREL,  JUMINID,  AGE,                  ');
      SQL.Add('          DEDYN,    OBSYN,   DEDYN3,     DEDAMT4A, DEDAMT4B, DEDAMT5A,             ');
      SQL.Add('          DEDAMT6A, DEDAMT6B,DEDAMT7A,   DEDAMT7B, DEDAMT8A, DEDAMT5B,             ');
      SQL.Add('          DEDAMT9A, DEDAMT9B,DEDAMT10A,BABYYN ,DEDAMT10B,DEDAMT11A, DEDAMT11B ,DEDAMT12A, DEDAMT12B       ');
      Sql.Add(' ORDER BY A.FAMIREL                                                                ');
      Open;
      DataSource1.OnDataChange := Nil;
      FieldByName('JUMINID').Alignment := taCenter;
      FieldByName('AGE').Alignment     := taCenter;
      FieldByName('DEDYN').Alignment   := taCenter;
      FieldByName('OBSYN').Alignment   := taCenter;
      FieldByName('DEDYN3').Alignment  := taCenter;
      TFloatField(FieldByName('DEDAMT4')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT5')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT6')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT7')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT8')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT10')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT11A')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT11B')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT11')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT12A')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT12B')).DisplayFormat := '#,###';
      TFloatField(FieldByName('DEDAMT12')).DisplayFormat := '#,###';      
    end;
   /////////////////////////////////////////////////////////////////////////////////////////


  //dsa2000  2006.12. Add : 가족공제내역 자동으로 합산 /////////////////////////////////////
  SQLStr := 'Select  nvl(a.GuarAmt,0)                         GuarAmt,                           '+
            '        nvl(a.ShosAmt,0)                         ShosAmt,                           '+
            '        nvl(a.NhosAmt,0)                         NhosAmt,                           '+
            '        nvl(a.OhosAmt,0)                         OhosAmt,                           '+
            '        nvl(a.GhosAmt,0)                         GhosAmt,                           '+
            '        nvl(a.SEduAmt,0)                         SEduAmt,                           '+
            '        nvl(a.CredittotAmt,0)                    CredittotAmt,                      '+
            '        nvl(a.CreditAmt_med,0)                   CreditAmt_med,                     '+
            '        nvl(a.Cashamt,0)                         Cashamt                            '+
            '   From                                                                             '+
            '(select sum(nvl(dedamt4a,0)+nvl(dedamt4b,0))                        GuarAmt,        '+
            '        sum(Decode(Famirel, ''00'',                                                 '+
            '             Decode(ObsYN,''Y'',0,nvl(dedamt5a,0)+nvl(dedamt5b,0)))) ShosAmt,       '+
            '        sum(Decode(ObsYN, ''Y'',                                                    '+
            '                                nvl(dedamt5a,0)+nvl(dedamt5b,0)))    NhosAmt,       '+
            '        sum(Decode(Sign(Age-64), 1,                                                 '+
            '                       Decode(ObsYN, ''Y'', 0, nvl(dedamt5a,0)+nvl(dedamt5b,0))     '+
            '                  )                                                                 '+
            '           )                                                        OhosAmt,        '+
            '        sum(Decode(Famirel,''00'',0,                                                '+
            '                   Decode(Sign(Age-64), 1 ,0,                                       '+
            '                          Decode(ObsYN,''Y'', 0, nvl(dedamt5a,0)+nvl(dedamt5b,0))   '+
            ' 			      )                                                          '+
            '                  )                                                                 '+
            ' 		)                                                        GhosAmt,        '+
            '        sum(Decode(Famirel,''00'',                                                  '+
            '                           nvl(dedamt6a,0) + nvl(dedamt6b,0)))      SEduAmt,        '+
            '        sum(nvl(dedamt7a,0)+nvl(dedamt7b,0))                        CredittotAmt,   '+
            '        sum(nvl(dedamt9a,0)+nvl(dedamt9b,0)+nvl(dedamt10a,0))       CreditAmt_med,  '+
            '        sum(nvl(dedamt8a,0))                                        Cashamt         '+
            '   from PKMYSFAModify_2010                                                                    '+
            '  where workyy = '''+WorkYY+'''                                                     '+
            '    and empno  = '''+Table1empno.Value+'''                                  ) A         ';

    with Query4 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Open;
//      DBEguaramt.text := FormatFloat('#,##0',Query4.FieldByName('guaramt').AsFloat);//guaramt.Value;
//      DBcredittotamt.text := FormatFloat('#,##0',Query4.FieldByName('CredittotAmt').AsFloat);//guaramt.Value;

//       Table1creditamt

//      Table1guarded.Value := 1;
//      Table1guarded.Value := Query3.FieldByName('guaramt').AsFloat;//guaramt.Value;

//      DBEguaramt.       := FieldByName('Guaramt').AsFloat;
{      NE_ShosAmt.Value       := FieldByName('ShosAmt').AsFloat;
      NE_NhosAmt.Value       := FieldByName('NhosAmt').AsFloat;
      NE_OhosAmt.Value       := FieldByName('OhosAmt').AsFloat;
      NE_GhosAmt.Value       := FieldByName('GhosAmt').AsFloat;
      NE_SEduAmt.Value       := FieldByName('SEduAmt').AsFloat;
      NE_CredittotAmt.Value  := FieldByName('CredittotAmt').AsFloat;
//      NE_CreditAmt_med.Value := FieldByName('CreditAmt_med').AsFloat;  2008년 주석 처리 KTH
      NE_Cashamt.Value       := FieldByName('Cashamt').AsFloat;

      //d의료비 공제대상여부 추정확인하여 표시해줌.
      tmp_medamt := NE_ShosAmt.Value + NE_NhosAmt.Value + NE_OhosAmt.Value + NE_GhosAmt.Value;
      if   Trunc(TaxGross * 0.03) < tmp_medamt then
           NE_meddedYN.Text := ' 공제대상입니다. (상세내역 -> 더블클릭)'
      else NE_meddedYN.Text := ' 공제대상 아님.  (상세내역 -> 더블클릭)';
}
//      Close;
    end;
  ////////////////////////////////////////////////////////////////////////////////
end;

procedure TFpkq10601.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  with Query3 do
  begin
    JobMode             := 'F';
    E_faminame.Text     := FieldByName('FAMINAME').AsString;
    E_famirel.Text      := FieldByName('FAMIREL').AsString;
    P_famirelN.Caption  := FieldByName('CODENAME').AsString;
    E_Juminid.Text      := FieldByName('JUMINID').AsString;
    P_Age.Caption       := FieldByName('AGE').AsString;
    E_Dedyn.Text        := FieldByName('DEDYN').AsString;
    E_Obsyn.Text        := FieldByName('OBSYN').AsString;
    E_Dedyn3.Text       := FieldByName('DEDYN3').AsString;
    E_Dedamt4a.Value    := FieldByName('DEDAMT4A').AsFloat;
    E_Dedamt4b.Value    := FieldByName('DEDAMT4B').AsFloat;
    E_Dedamt5a.Value    := FieldByName('DEDAMT5A').AsFloat;
    E_Dedamt5b.Value    := FieldByName('DEDAMT5B').AsFloat;
    E_Dedamt6a.Value    := FieldByName('DEDAMT6A').AsFloat;
    E_Dedamt6b.Value    := FieldByName('DEDAMT6B').AsFloat;
    E_Dedamt7a.Value    := FieldByName('DEDAMT7A').AsFloat;
    E_Dedamt7b.Value    := FieldByName('DEDAMT7B').AsFloat;
    E_Dedamt8a.Value    := FieldByName('DEDAMT8A').AsFloat;
    E_Dedamt11a.Value    := FieldByName('DEDAMT11A').AsFloat;   //2010.01 KTH 기부금 그밖의 자료 및 분리 작업  DEDAMT10B(그밖의) 에서   DEDAMT11B 로 변경
    E_Dedamt11b.Value    := FieldByName('DEDAMT11B').AsFloat;   //2010.01 KTH 기부금 국세청 자료 추가
    E_Dedamt12a.Value    := FieldByName('DEDAMT12A').AsFloat;   //2010.01 KTH 기부금 그밖의 자료 및 분리 작업  DEDAMT10B(그밖의) 에서   DEDAMT11B 로 변경
    E_Dedamt12b.Value    := FieldByName('DEDAMT12B').AsFloat;   //2010.01 KTH 기부금 국세청 자료 추가

//    E_Dedamt9a.Value    := FieldByName('DEDAMT9A').AsFloat; 2008.12 KTH 신용카드 중복공제 허용 주석
//    E_Dedamt9b.Value    := FieldByName('DEDAMT9B').AsFloat; 2008.12 KTH 신용카드 중복공제 허용 주석
//    E_Dedamt10B.Value    := FieldByName('DEDAMT10B').AsFloat; //2008.12 KTH 신용카드 중복공제 허용 주석  기부금 필드로 대체함 2008.12

// kth 출산 입양자 작업 2009.01.03
    if      Copy(FieldByName('BABYYN').AsString,1,1)       = 'N' then E_babyyn.ItemIndex := 0
    else if Copy(FieldByName('BABYYN').AsString,1,1)       = '0' then E_babyyn.ItemIndex := 1
    else if Copy(FieldByName('BABYYN').AsString,1,1)       = '1' then E_babyyn.ItemIndex := 2
    else if Copy(Trim(FieldByName('BABYYN').AsString),1,1) = ''  then E_babyyn.ItemIndex := -1;
  end;
end;

procedure TFpkq10601.BB_DeleteClick(Sender: TObject);
var
   SQLStr:String;
begin
 if E_Famirel.Text = '00' then
  begin
    MessageDlg('본인은 삭제가 불가능 합니다.',mtInformation, [mbOK],0);
    exit;
  end;

  if MessageDlg('선택된 가족구성원의 모든 내역을 삭제하시겠습니까?'+#13+#13+
                '※ 삭제된 내역은 복구가 불가능하며, 공제를 위해서는 다시 입력을 해야합니다.',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SQLStr  := 'DELETE PKMYSFAModify_2010  '+
             ' WHERE WORKYY  = '''+  Table1workyy.Value                       +''' '+
             '   AND EMPNO   = '''+  Table1empno.Value                        +''' '+
             '   AND JUMINID = '''+  Query3.FieldByName('JUMINID').AsString    +''' ';
//             Table1workyy.Value, Table1empno.Value

  with Query5 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(SQLStr);
       ExecSQL

{       if not Query5.ExecSQL then
       begin
            MessageDlg('삭제작업이 실패하였습니다.'+#13+#13+
                       '개발자 문의전화 : 02)6266-2326',mtError, [mbOk],0);
            System.Exit;
       end;}
  end;


  Read_FamiRecords(Table1workyy.Value, Table1empno.Value);

//  SB_Help.Panels[1].Text := '가족 구성원 내역을 재집계하고 있습니다.';

{  if Update_AppFamiDedNo then
       MessageDlg('선택된 가족구성원의 내역이 정상적으로 삭제되었습니다.',mtInformation, [mbOk],0)
  else MessageDlg('공제인원 집계에 실패했습니다.',mtError, [mbOk],0);}

//  SB_Help.Panels[1].Text := '';
end;

procedure TFpkq10601.BB_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_FamiField(False, True);
  Read_FamiRecords(Table1workyy.Value, Table1empno.Value);
//  SB_Help.Panels[1].Text := '';
end;

procedure TFpkq10601.BB_FamSaveClick(Sender: TObject);
var
   babychk ,SQLStr: String;
begin
 //자녀 양육 오류
  if (Trim(E_dedyn3.Text) = 'Y') then 
  begin 
       if   (Trim(E_dedyn.Text) = 'Y') and 
            ( (E_Famirel.Text  = '04') OR (E_Famirel.Text  = '05') OR (E_Famirel.Text  = '31') ) and 
            ( StrtoInt(Trim(P_Age.Caption)) <= 6 ) then 
       else 
       begin 
            ShowMessage( '자녀 양육은 기본공제 대상자이면서 '+#13+#13+ 
                         '6세 이하 직계비속(아들과 딸)과 위탁아동일 경우 선택 할 수 있습니다.'); 
            E_dedyn3.Text := 'N'; 
            Exit; 
       end; 
  end;




{  if not Check_Jumin( Copy(E_Juminid.Text,1,6) + Copy(E_Juminid.Text,8,7) ) then
  begin
     ShowMessage( E_Juminid.Text +': 잘못된 주민등록번호입니다. 확인후 저장 바랍니다.' );
     ChkJuminFlag  := False;
     Exit;
  end;}

  //본인체크   kth 2009.01
  if (Trim(E_Famirel.Text) = '00') and (E_dedyn.text = 'N') then
  begin
        ShowMessage( '본인은 기본공제 대상자이므로 변경할 수 없습니다.  ' );
        E_dedyn.Text := 'Y';
        Exit;
  end;

  // kth 출산 입양자 작업 2009.01.03
  babychk  := '';
  if (Trim(E_Famirel.Text) = '04') or (Trim(E_Famirel.Text) = '05') then
  begin
       if      E_babyyn.ItemIndex = -1 then babychk  := 'N:해당없음'
       else if E_babyyn.ItemIndex = 1  then
       begin
            if P_Age.Caption = '0' then babychk  := '0:출산'
            else                        babychk  := '';
       end
       else if E_babyyn.ItemIndex = 2 then babychk  := '1:입양';
  end;

  E_JuminidExit(sender); //나이체크 탈수 있게 kth 2009.01

//  E_WoMan.Text  := Set_WoMan;

{  if not Check_FamiRecord then
    begin
      MessageDlg(sMsg, mtError, [mbOK ],0) ;
      case ErrFocus of
          1 : if E_Faminame.Enabled then E_Faminame.SetFocus;
          2 : if E_FamiRel.Enabled  then E_FamiRel.SetFocus;
          3 : if E_Juminid.Enabled  then E_Juminid.SetFocus;
          4 : if E_dedyn.Enabled    then E_dedyn.SetFocus;
          5 : if E_obsyn.Enabled    then E_obsyn.SetFocus;
          6 : if E_dedyn3.Enabled   then E_dedyn3.SetFocus;
      end;

      System.Exit;
    end;}

{Table1workyy.Value
Table1empno.Value
Query4.FieldByName('JUMINID').AsString    }


  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSFAModify_2010                                    '+
                '   (WORKYY,   EMPNO,    FAMINAME, FAMIREL, JUMINID,     '+
		'    AGE,      DEDYN,    OBSYN,    DEDYN3,               '+
                '    DEDAMT4A, DEDAMT4B,                                 '+
                '    DEDAMT6A, DEDAMT6B, DEDAMT7A, DEDAMT7B,             '+
                '    DEDAMT8A,                                           '+
//                '    DEDAMT9A, DEDAMT9B, DEDAMT10A,                    '+
                '    WRITEMAN, WRITETIME,BABYYN, DEDAMT11A,DEDAMT11B, DEDAMT12A,DEDAMT12B )   '+  //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
                '  VALUES                                       '+
                '   ('''+ Table1workyy.Value              +''', '+
                '    '''+ Table1empno.Value               +''', '+
                '    '''+ E_Faminame.Text                 +''', '+
                '    '''+ E_FamiRel.Text                  +''', '+
                '    '''+ E_Juminid.Text                  +''', '+
                '    '''+ P_Age.Caption                   +''', '+
                '    '''+ E_dedyn.Text                    +''', '+
                '    '''+ E_Obsyn.Text                    +''', '+
                '    '''+ E_dedyn3.Text                   +''', '+
                '    '''+ FloatToStr(E_dedamt4a.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt4b.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt6a.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt6b.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt7a.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt7b.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt8a.value)    +''', '+
//                '    '''+ FloatToStr(E_dedamt10b.value)    +''', '+  //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
//                '    '''+ FloatToStr(E_dedamt9a.value)    +''', '+  2008.12 KTH 신용카드 중복공제 허용 주석
//                '    '''+ FloatToStr(E_dedamt9B.value)    +''', '+  2008.12 KTH 신용카드 중복공제 허용 주석
//                '    '''+ FloatToStr(E_dedamt10a.value)   +''', '+  2008.12 KTH 신용카드 중복공제 허용 주석
                '    '''+ GSEmpno                         +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),        '+
                '    '''+ babychk                         +''', '+
                '    '''+ FloatToStr(E_dedamt11a.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt11b.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt12a.value)    +''', '+
                '    '''+ FloatToStr(E_dedamt12b.value)    +'''  '+
                '   ) ';
    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSFAModify_2010                                            '+#13+
                '   SET JUMINID   = '''+ E_Juminid.Text               +''', '+#13+
                '       FAMINAME  = '''+ E_Faminame.Text              +''', '+#13+
                '       FAMIREL   = '''+ E_FamiRel.Text               +''', '+#13+
                '       AGE       = '''+ P_Age.Caption                +''', '+#13+
                '       DEDYN     = '''+ E_dedyn.Text                 +''', '+#13+
                '       OBSYN     = '''+ E_Obsyn.Text                 +''', '+#13+
                '       DEDYN3    = '''+ E_dedyn3.Text                +''', '+#13+
                '       DEDAMT4A  = '''+ FloatToStr(E_dedamt4a.value) +''', '+#13+
                '       DEDAMT4B  = '''+ FloatToStr(E_dedamt4b.value) +''', '+#13+
                '       DEDAMT6A  = '''+ FloatToStr(E_dedamt6a.value) +''', '+#13+
                '       DEDAMT6B  = '''+ FloatToStr(E_dedamt6b.value) +''', '+#13+
                '       DEDAMT7A  = '''+ FloatToStr(E_dedamt7a.value) +''', '+#13+
                '       DEDAMT7B  = '''+ FloatToStr(E_dedamt7b.value) +''', '+#13+
                '       DEDAMT8A  = '''+ FloatToStr(E_dedamt8a.value) +''', '+#13+
//                '       DEDAMT10B  = '''+ FloatToStr(E_dedamt10b.value) +''', '+#13+  //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
//                '       DEDAMT9A  = '''+ FloatToStr(E_dedamt9a.value) +''', '+#13+  2008.12 KTH 신용카드 중복공제 허용 주석
//                '       DEDAMT9B  = '''+ FloatToStr(E_dedamt9b.value) +''', '+#13+  2008.12 KTH 신용카드 중복공제 허용 주석
//                '       DEDAMT10A = '''+ FloatToStr(E_dedamt10a.value) +''', '+#13+  2008.12 KTH 신용카드 중복공제 허용 주석
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+#13+
                '       WRITEMAN  = '''+ GSEmpno        +''',  '+#13+
                '       BABYYN    = '''+ babychk        +''',  '+#13+
                '       DEDAMT11A = '''+ FloatToStr(E_dedamt11a.value) +''', '+#13+ //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
                '       DEDAMT11B = '''+ FloatToStr(E_dedamt11b.value) +''', '+#13+ //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
                '       DEDAMT12A = '''+ FloatToStr(E_dedamt12a.value) +''', '+#13+ //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
                '       DEDAMT12B = '''+ FloatToStr(E_dedamt12b.value) +'''  '+#13+ //기부금 DEDAMT11A 국세청 ,DEDAMT11A 그 밖의 자료 추가 DEDAMT10B, 주석
                ' WHERE WORKYY    = '''+ Table1workyy.Value         +'''  '+#13+
                '   AND EMPNO     = '''+ Table1empno.Value   +'''  '+#13+
                '   AND NVL(JUMINID,'' '') = NVL('''+ Query3.FieldByName('JUMINID').AsString  +''','' '') ';
    end
  else System.Exit;

  with Query5 do
  begin
       Close;
       Sql.Clear;

       Sql.Add(SQLStr);
       ExecSQL
       {if not Query5.ExecSQL then
         begin
           MessageDlg('가족 공제사항1 저장에 실패했습니다.',mtError, [mbOk],0);
           System.Exit;
           SB_Help.Panels[1].Text := '';
         end; }
  end;

  Table1.Edit;
  Table1Sex.Value :=Table1Sex.Value;   // Table1.Modified == True; 하기 위해 넣어줌
  Calculate;
  Set_FamiField(False, True);
  Read_FamiRecords(Table1workyy.Value, Table1empno.Value);
end;

procedure TFpkq10601.BB_ModifyClick(Sender: TObject);
begin
  if E_Faminame.Text <> '' then
  begin
       JobMode            := 'U';
//       SB_Help.Panels[1].Text := '가족구성원의 내역을 수정합니다.(내역 수정후 반드시 가족저장을 해야합니다.)';
       Set_FamiField(True, False );
  end
  else
  begin
       ShowMessage( '가족을 선택 후 수정 버튼을 눌러 주세요.' );
       Exit;
  end;

  //dsa2000  2005.12 추가.
  if E_dedyn.Text    = '' then E_dedyn.Text    := 'N';
  if E_Obsyn.Text    = '' then E_Obsyn.Text    := 'N';
  if E_dedyn3.Text   = '' then E_dedyn3.Text   := 'N';
  if E_dedamt4a.Text = '' then E_dedamt4a.Text := '0';
  if E_dedamt4b.Text = '' then E_dedamt4b.Text := '0';
  if E_dedamt5a.Text = '' then E_dedamt5a.Text := '0';
  if E_dedamt5b.Text = '' then E_dedamt5b.Text := '0';
  if E_dedamt6a.Text = '' then E_dedamt6a.Text := '0';
  if E_dedamt6b.Text = '' then E_dedamt6b.Text := '0';
  if E_dedamt7a.Text = '' then E_dedamt7a.Text := '0';
  if E_dedamt7b.Text = '' then E_dedamt7b.Text := '0';
  if E_dedamt8a.Text = '' then E_dedamt8a.Text := '0';
  if E_dedamt10b.Text = ''then E_dedamt10b.Text := '0';
  if E_dedamt11a.Text = ''then E_dedamt11a.Text := '0';
  if E_dedamt11b.Text = ''then E_dedamt11b.Text := '0';
  if E_dedamt12a.Text = ''then E_dedamt12a.Text := '0';
  if E_dedamt12b.Text = ''then E_dedamt12b.Text := '0';

  if E_Famirel.Text  = '' then E_babyyn.Visible := False; // kth 출산 입양자 작업 2009.01.03
end;


procedure TFpkq10601.Set_FamiField(arg1, arg2 : Boolean );
begin
//  E_Empno.Enabled     := not arg1;
  DB_Fami.Enabled     := not arg1;
//  SB_1.Enabled        := not arg1;
//  SB_2.Enabled        := not arg1;
//  SB_3.Enabled        := not arg1;

//  if FormCloseYN = 'N' then  BB_Save.Enabled     := not arg1;

//  BB_Preview.Enabled  := not arg1;
//  BB_Print.Enabled    := not arg1;
//  BT_close.Enabled    := not arg1;

  BB_Med_nts.Enabled     := arg1;
//  BB_DetailSave.Enabled  := arg1;

  BB_Append.Enabled   := not(arg1);
  BB_Modify.Enabled   := not(arg1);
  BB_FamSave.Enabled  := arg1;
  BB_cancel.Enabled   := arg1;
  BB_Delete.Enabled   := not(arg1);

  E_FamiName.Enabled  := arg1;
  E_Famirel.Enabled   := arg1;
  E_Juminid.Enabled   := arg1;
  E_dedyn.Enabled     := arg1;
  E_Obsyn.Enabled     := arg1;
  E_dedyn3.Enabled    := arg1;
  E_dedamt4a.Enabled  := arg1;
  E_dedamt4b.Enabled  := arg1;
  E_dedamt6a.Enabled  := arg1;
  E_dedamt6b.Enabled  := arg1;
  E_dedamt7a.Enabled  := arg1;
  E_dedamt7b.Enabled  := arg1;
  E_dedamt8a.Enabled  := arg1;
  E_dedamt8b.Enabled  := arg1;
  E_dedamt12a.Enabled  := arg1;
  E_dedamt12b.Enabled  := arg1;    

  // 출산,입양은 아들,딸일 경우만 보이게 시작 kth
  if ((E_Famirel.Text  = '04') OR (E_Famirel.Text  = '05')) then
  begin
       E_babyyn.ItemIndex := 0;
       E_babyyn.Enabled   := True;
  end
  else
  begin
       E_babyyn.ItemIndex := -1;
       E_babyyn.Enabled   := False;
  end;

//   E_dedamt9a.Enabled  := arg1; 2008.12 KTH 신용카드 중복공제 허용 주석
//   E_dedamt9b.Enabled  := arg1; 2008.12 KTH 신용카드 중복공제 허용 주석
//  E_dedamt10a.Enabled := arg1;  2008.12 KTH 신용카드 중복공제 허용 주석
  E_dedamt10b.Enabled := arg1;
//  E_babyyn.Enabled    := arg1; // kth 출산 입양자 작업 2009.01.03

  if arg2 then
    begin
      E_FamiName.Text    := '';
      E_Famirel.Text     := '';
      P_FamirelN.Caption := '';
      E_Juminid.Text     := '';
      P_Age.Caption      := '';
      E_dedyn.Text       := 'Y';
      E_Obsyn.Text       := 'N';
      E_dedyn3.Text      := 'N';
      E_dedamt4a.Value   := 0;
      E_dedamt4b.Value   := 0;
      E_dedamt5a.Value   := 0;
      E_dedamt5b.Value   := 0;
      E_dedamt6a.Value   := 0;
      E_dedamt6b.Value   := 0;
      E_dedamt7a.Value   := 0;
      E_dedamt7b.Value   := 0;
      E_dedamt8a.Value   := 0;
      E_dedamt8b.Value   := 0;
//      E_dedamt9a.Value   := 0;  2008.12 KTH 신용카드 중복공제 허용 주석
//      E_dedamt9b.Value   := 0;  2008.12 KTH 신용카드 중복공제 허용 주석
//      E_dedamt10a.Value  := 0; 2008.12 KTH 신용카드 중복공제 허용 주석
      E_dedamt10b.Value  := 0;
      E_dedamt11a.Value  := 0;
      E_dedamt11b.Value  := 0;
      //2013.11.21.hjku.. 누락 오류 수정
      E_dedamt12a.Value  := 0;
      E_dedamt12b.Value  := 0;
    end;
end;

procedure TFpkq10601.BB_AppendClick(Sender: TObject);
begin
  JobMode                := 'I';
//  SB_Help.Panels[1].Text := '가족 구성원의 내역을 신규로 등록합니다.';
  Set_FamiField(True, True);
  BB_Med_nts.Enabled := False;
//  BB_DetailSave.Enabled := False;

  E_babyyn.ItemIndex := -1;     //초기화. 출산,입양은 아들,딸일 경우만 보이게 시작 kth
  E_babyyn.Enabled   := False;

  if E_Faminame.Enabled then E_Faminame.SetFocus;
end;

procedure TFpkq10601.E_FamirelChange(Sender: TObject);
begin
  if  (E_Faminame.Enabled = True) and  ((E_Famirel.Text  = '04') OR (E_Famirel.Text  = '05')) then
  begin
       E_babyyn.ItemIndex := 0;
       E_babyyn.Enabled   := True;
  end
  else
  begin
       E_babyyn.ItemIndex := -1;
       E_babyyn.Enabled   := False;
  end;
end;

procedure TFpkq10601.E_FamirelCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CodeForm.FamCode <> '' then
    begin
      E_FamiRel.Text      := CodeForm.FamCode;
      P_FamirelN.Caption  := CodeForm.FamCodeN;

      // 출산,입양은 아들,딸일 경우만 보이게 시작 kth
      if (E_Famirel.Text  = '04') OR (E_Famirel.Text  = '05') then
      begin
           E_babyyn.ItemIndex := 0;
           E_babyyn.Enabled   := True;
      end
      else
      begin
           E_babyyn.ItemIndex := -1;
           E_babyyn.Enabled   := False;
      end; // 출산,입양은 아들,딸일 경우만 보이게 시작 끝 kth
    end;
end;

procedure TFpkq10601.E_FamirelInitPopup(Sender: TObject);
begin
  CodeForm := TCodeForm.Create(Self);
  CodeForm.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CodeForm ;
end;

procedure TFpkq10601.E_JuminidExit(Sender: TObject);
var
  calage : String;
begin
  if not Check_Jumin( Copy(E_Juminid.Text,1,6) + Copy(E_Juminid.Text,8,7) ) then
  begin
     ShowMessage( '잘못된 주민등록번호입니다.' );
//     ChkJuminFlag  := False;
     P_Age.Caption := '0';
     Exit;
  end;         
  
  calage := Get_Age(E_Juminid.Text);

  if (StrtoInt(Calage) >=  0 ) then P_Age.Caption := calage
  else                              P_Age.Caption := '0';
end;


Function TFpkq10601.Get_Age(BirthDate : String) : String;
var
  mm1  : LongInt;
  mm2  : LongInt;
  Age  : LongInt;
begin
  try
    mm2    := StrToInt(Table1workyy.Value)*12 + 12;

    if (Copy(BirthDate,8,1) = '1') or (Copy(BirthDate,8,1) = '2') or
       (Copy(BirthDate,8,1) = '5') or (Copy(BirthDate,8,1) = '6') then
         mm1 := StrToInt('19' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2))
    else mm1 := StrToInt('20' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2));

    Age   := (mm2-mm1) div 12;  { 2000.12. 20세이하 0101일 포함으로 변경됨.  주석처리
                              if (Copy(BirthDate,3,4) = '0101') AND (Age >= 0) AND (Age < 54) then        Age := Age+1;}
    Result := FloatToStr(Age);
  except
    Result := '0';
    System.Exit;
  end;
end;

Function TFpkq10601.Check_Jumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of Integer =
         ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
Begin
  if (Copy(No,7,1) <> '5') and (Copy(No,7,1) <> '6') and
     (Copy(No,7,1) <> '7') and (Copy(No,7,1) <> '8') then    //외국인은 루틴 안타도록..
  begin
    If Length(No) <> 13 then
      Result:= False
    Else
      Try
        Sum:= 0;
        For Loop:= 1 to  12 do
          Sum:= Sum + StrToInt(No[Loop])*Weight[Loop];
        Rest:= 11-(Sum Mod 11);
        If Rest = 11 then Rest:= 1;
        If Rest = 10 then Rest:= 0;
        Result:= Char(Rest+48) = No[13];
      Except
        Result:= False;
      End;
  end
  else
    Result:= True;
End;

procedure TFpkq10601.BB_Med_ntsClick(Sender: TObject);
begin
//SB_Help.Panels[1].Text := '해당구성원의 국세청제공 의료비내역을 입력합니다.';
  if Trim(E_Faminame.Text) = '' then
  begin
       ShowMessage( '가족을 선택 해주시기 바랍니다. ' );
       Exit;
  end;

  FM_main_nts := TFM_main_nts.Create(Self);
  if E_dedyn.Text = 'N' then
  begin
       Application.MessageBox('기본공제자가 아닌자의 의료비 등록시에는 '+#13+
                              '관계 서류를 첨부하여 반드시 소명하여야 소득공제가 가능합니다.','[작업안내]',MB_OK+$0030);
       FM_main_nts.pn_msg.Visible := True;
  end
  else FM_main_nts.pn_msg.Visible := False;

  FM_main_nts.E_Fami.Text := E_Faminame.Text;
  FM_main_nts.ShowModal;
end;

procedure TFpkq10601.BB_DetailSaveClick(Sender: TObject);
begin
//  SB_Help.Panels[1].Text := '연말정산 대상자의 기타 의료비내역을 입력합니다.';
  FM_detail := TFM_detail.Create(Self);
  FM_detail.ShowModal;
  Calculate;

end;

end.
