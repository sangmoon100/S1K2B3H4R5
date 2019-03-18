{===================== Program Header ==========================================
 PROGRAM-NAME   : PKQ1020G(연말정산 세액계산)
 SYSTEM-NAME    : 정산
 SUBSYSTEM-NAME : 연말정산
 Programmer     : 윤형식
 Version        : 30.10
 Date           : 2000.01.22

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description                     f
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

unit pkq10601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Tabnotbk, Buttons, Mask, DBCtrls, ExtCtrls,
  Db, DBTables, math, userhelp, DBAccess, Ora, MemDS,
  OraSmart, Func, KeyEmpNo;//,pass,, Iempno

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
    DBEpgiveamt: TDBEdit;
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
    Panel66: TPanel;
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
    DBEhouseded: TDBEdit;
    Panel47: TPanel;
    Pdeptname: TPanel;
    Panel87: TPanel;
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
    DBEpgiveded: TDBEdit;
    Panel97: TPanel;
    DBcreditdedamt: TDBEdit;
    Panel98: TPanel;
    DBEcreditamt: TDBEdit;
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
    Panel89: TPanel;
    DBEspecaddno: TDBEdit;
    DBEspecaddded: TDBEdit;
    Panel100: TPanel;
    DBEpoliamt: TDBEdit;
    Label1: TLabel;
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
    E_WorkYY: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BT_HisRead: TButton;
    BT_HisSave: TButton;
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
    Table1DEDLACKAMT: TFloatField;
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
    Table1HOUSEINTAMT2: TIntegerField;
    Table1CASHAMT: TIntegerField;
    Table1COSTOCKTAX: TFloatField;
    Query1: TOraQuery;
    Query2: TOraQuery;
    
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
    procedure BT_HisReadClick(Sender: TObject);
    procedure BT_HisSaveClick(Sender: TObject);
    procedure E_WorkYYExit(Sender: TObject);
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
    SpecAddLIMIT  : double;          //DSA2000 2004.12. 결혼.장례.이사 특별공제
    POLILIMIT     : double;          //DSA2000 2004.12. 정치자금 세액공제 한도액
    OBSDEDADD     : double;          //DSA2000 2005.12. 장애인 추가공제  한도액

    COSTOCKLIMIT  : double;          //Dsa2000 2006.12   우리사주조합 출연금 한도.  
  public
    { Public declarations }
    procedure Calculate;
    procedure ReadPkcysbas;
    function  GetTax(stdamt : double) : double;
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


{$R *.DFM}

procedure TFpkq10601.ReadPkcysbas;
var
   workyy : String;
begin
     with Query1 do
     begin
          //과거 연말정산 수정신고를 위하여 기준년도를  입력을 받아 읽어 오도록 함.
{          Close;
          SQL.Clear;
          SQL.Add('select workyy from pkcpbas ');
          Open;
          workyy := FieldByName('workyy').AsString; }

          workyy := Trim(E_WorkYY.Text);

          Close;
          SQL.Clear;
          SQL.Add('select * from pkcysbas ');
          SQL.Add(' where workyy=:L1      ');
          ParamByName('L1').AsString := workyy;
          Open;

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
          SPECADDLIMIT  := FieldByName('SPECADDLIMIT').AsFloat;           //DSA2000   2004.12.
          POLILIMIT     := FieldByName('POLILIMIT').AsFloat;              //DSA2000   2004.12.
          OBSDEDADD     := FieldByName('OBSDEDADD').AsFloat;              //DSA2000   2005.12.
          COSTOCKLIMIT  := FieldByName('COSTOCKLIMIT').AsFloat;           //DSA2000   2006.12.
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
begin
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
       Table1laborded.Value := Table1taxgross.Value

     else if Table1taxgross.Value  <= indedlimit2 then
       Table1laborded.Value := INDEDBASIC +
                               (Table1taxgross.Value  - INDEDBASIC )*INDEDORATE / 100
     else if Table1taxgross.Value <= indedlimit3 then
       Table1laborded.Value := INDEDBASIC +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (Table1taxgross.Value - INDEDLIMIT2)*INDEDORATE2 / 100
     else if Table1taxgross.Value <= indedlimit4 then //parksh 수정 20021217
       Table1laborded.Value := INDEDBASIC +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 /100 +
                               (Table1taxgross.Value - INDEDLIMIT3)*INDEDORATE3 / 100
     else
       Table1laborded.Value := INDEDBASIC +          //parksh 추가 20021217    근로소득공제4
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 /100 +
                               (INDEDLIMIT4 - INDEDLIMIT3) * INDEDORATE3 /100 +
                               (Table1taxgross.Value - INDEDLIMIT4)*INDEDORATE4 / 100 ;

//2001. 근로소득공제 한도액 없어짐.  if Table1laborded.Value > INDEDLIMIT then  Table1laborded.Value := INDEDLIMIT;
     Table1laboramt.Value := Table1taxgross.Value - Table1laborded.Value;

     // 본인공제
     Table1selfded.Value := BASDED;

     // 배우자공제
     Table1mateded.Value := Table1mate.Value * BASDED;

     // 부양가족공제
     Table1famided.Value :=  Table1familyno.Value * BASDED;

     // 기본공제
     Table1BASICDED.Value := Table1SELFDED.Value + Table1MATEDED.Value + Table1FAMIDED.Value;


     // 경로우대공제 2002세법개정      parskh 20021217  APPDED->APPOLDDED
     Table1OLDDED.value := Table1FAMI65NO.value * APPOLDDED;
     Table1OLDDED.value := Table1OLDDED.value + Table1FAMI70NO.value * APPOLDDED2;  //dsa2000 2004.12. 경로우대70이상 추가

     // 장애자공제 2002세법개정       parskh 20021217  APPDED->APPOLDDED
     //Table1obsded.Value := Table1obstacleno.Value * APPOLDDED;
     Table1obsded.Value := Table1obstacleno.Value * OBSDEDADD;  //2005년 세법 변경 100=>200만원

     // 부녀자공제
     Table1womanded.Value := Table1woman.Value * APPDED;

     //자녀양육비  dsa2000  2004.12. 수정 APPDED->APPOLDDED
     Table1CHILDDED.value := Table1CHILDNO.value * APPOLDDED;

     // 추가공제
     Table1appendded.Value := Table1oldded.Value + Table1obsded.Value + Table1womanded.Value
                            + Table1childded.Value;

     // 소수공제자추가공제
     if (Table1familyno.Value + Table1mate.Value = 0) then
         Table1fewded.Value := FEWDED1
     else if (Table1familyno.Value + Table1mate.Value = 1) then
         Table1fewded.Value := FEWDED2
     else
         Table1fewded.Value := 0;

////////////////////////////////////////////////////////////////////////////////
     // 의료보험료공제
     Table1medded.Value := Table1medamt.Value + Table1bmedamt.Value + Table1bmedamt1.Value;

     // 고용보험료공제
     Table1hireded.Value := Table1hireamt.Value + Table1bhireamt.Value + Table1bhireamt1.Value;

     // 일반보험료공제
     Table1guarded.Value := Table1guaramt.Value;
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
     Table1houseded.Value := floor(Table1houseamt.Value * HSRATE / 100);
     
     if Table1houseded.Value > HSDEDLIMIT then
        Table1houseded.Value := HSDEDLIMIT;

     Table1houseded.Value := Table1houseded.Value
                           + Table1houseintamt.Value
                           + Table1houseintamt2.Value;

     if Table1houseintamt2.Value > 0 then  //①+②+③ 모두 공제시  상환기간 15년 이상일때 1000만원까지...
       begin
         if ( Table1houseded.value > HSDEDLIMIT3 ) then
           Table1houseded.value :=  HSDEDLIMIT3;
       end
     else if Table1houseintamt.Value > 0 then  //①+②+③ 모두 공제시 상환기간 10년 이상일때 600만원까지...
       begin
         if ( Table1houseded.value > HSDEDLIMIT2 ) then
           Table1houseded.value :=  HSDEDLIMIT2;
       end
     else if Table1houseded.Value > 0 then    //①+② 공제시
       begin
         if ( Table1houseded.value > HSDEDLIMIT )  then
           Table1houseded.value := HSDEDLIMIT;
       end;
   //dsa2000  END..................................................................
   
     // 전액기부금공제
     Table1agiveded.Value := Table1agiveamt.Value;

     ///* 정치기부금 : 세액공제 신설 => dsa2000  2004.12. 세액공제(10만원) 이상의 금액은 전액기부금 처리.*/
     if (Table1Poliamt.Value > POLILIMIT ) then
       begin
          Table1Agiveded.Value := Table1Agiveded.Value + (Table1Poliamt.Value - POLILIMIT);
	  Table1Polided.Value  := POLILIMIT;
       end
     else
          Table1Polided.Value  := Table1Poliamt.Value;   ///*polided 정치자금 세액공제*/

     //parksh 20021223 추가 특례지정기부금
     Table1SPGIVDED.value := Table1SPGIVAMT.value;
     if ( Table1SPGIVDED.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value) * SPGIVDEDRATE / 100 ) ) then
        Table1SPGIVDED.value := (Table1LABORAMT.value-Table1AGIVEDED.Value) *SPGIVDEDRATE / 100 ;

     // 지정기부금
     Table1PGIVEDED.value := Table1PGIVEAMT.value;

     // 일반기부공제 parksh 20021223 수정
     if ( Table1PGIVEDED.value > ((Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value ) * GIVDEDRATE / 100 ) ) then
        Table1PGIVEDED.value := (Table1LABORAMT.value-Table1AGIVEDED.Value-Table1SPGIVDED.Value) *GIVDEDRATE / 100 ;

     ////* 기부금공제 = 전액기부금  + 특례지정기부금 + 지정기부금
     Table1GIVEDED.value := Table1AGIVEDED.value + Table1PGIVEDED.value + + Table1SPGIVDED.Value ;
     Table1GIVEDED.value := floor(Table1GIVEDED.value);

     //* 결혼.장례.이사비용공제(신설) - 건당 100만  2004.12. dsa2000  과세총액이 2500미만인 근로자.*/
     if Table1TAXGROSS.Value > 25000000 then  //DBEspecialaddded
       Table1Specaddded.value := 0
     else
       Table1Specaddded.value := Trunc(Table1Specaddno.value * SPECADDLIMIT);


     ///* 특별공제 = 보험료공제 + 의료비공제 + 교육비공제 + 주택자금공제 +  기부금공제 +  결혼.장례.이사비용공제  */
     Table1SPECIALDED.value := Table1INSDED.value + Table1HOSDED.value + Table1EDUDED.value +
                               Table1HOUSEDED.value + Table1GIVEDED.value + Table1Specaddded.value;

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
     OINVESTDEDLIMIT := floor(Table1taxgross.value  * OINVESTDEDRATE /100) ;
     Table1oinvestded.value      := floor(Table1oinvestamt.value * OINVESTRATE /100) ;
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
     TOTCreditamt := 0;
     Table1creditamt.value := Table1credittotamt.value - Table1creditdedamt.value; //법인 사용분 제외...

{①} TOTCreditamt := Table1creditamt.value + Table1debitamt.value + Table1giroamt.value + Table1cashamt.value;
{②} TOTOverAmt   := TOTCreditamt - (Table1taxgross.Value * CREORATE / 100);

     if  TOTOverAmt > 0 then       //신용카드공제금 누적계산....
       begin
{③}     Table1CREDITDED.value := (TOTOverAmt * Table1creditamt.value / TOTCreditamt * CREDEDLRATE  / 100);
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
     Table1incomeded.Value := Table1basicded.Value   + Table1appendded.Value + Table1specialded.Value
                             + Table1pended.Value    + Table1fewded.Value
                             + Table1tinvestded.value     //2002.12.17 parksh 수정
                             + Table1creditded.value + Table1anuded.Value
                             + Table1npended.Value   + Table1standded.Value //parksh 20030128 Table1standded.Value추가
                             + Table1Foreignded.value+    //2003.12.  dsa2000 추가...
                             + Table1costockded.value;    //2007.01.  dsa2000

     Table1taxlevel.Value := Table1laboramt.Value - Table1incomeded.Value ;

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

     Table1dintax.Value  := Table1calctax.Value - Table1tdedsum.Value;

     if (Table1dintax.Value < 0 ) then
        Table1dintax.Value := 0;

     // 결정세액
     Table1dintax.Value   := Floor(Table1dintax.Value / 10 ) * 10;   // 원단위 절사
     Table1djutax.Value   := Table1dintax.Value * 0.1;
     Table1djutax.Value   := Floor(Table1djutax.Value / 10 ) * 10;   // 원단위 절사
     Table1dnongtax.Value := Floor( ( Table1hloanded.Value + (GetTax(Table1tinvestded.Value + Table1taxlevel.Value) - Table1calctax.Value)) * NONGRATE / 100) ;
     Table1dnongtax.Value := Floor(Table1dnongtax.Value / 10 ) * 10;

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
          SQL.Add('select * ');
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
     Lempno.Caption := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;
end;


function TFpkq10601.GetTax(stdamt : double) : double;
var
   i : integer;
begin
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
          SQL.ADD(' Update PKMYSModify Set (Writetime, Writeman) =  ');
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
end;

procedure TFpkq10601.FormPaint(Sender: TObject);
begin
     if IsFirst = True then
     begin
          Application.ProcessMessages;
          SetEmpTime;
          E_WorkYY.Text := '2005';                               //kth 2010.12.21 년도 및 필터 추가
          Table1.Filter := 'WORKYY = '''+E_WorkYY.Text+''' ';
          Table1.Open;
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
        if FKeyEmpno.CloseChk = 0 then
        begin
             Eempno.Text := FKeyEmpno.v_KeyEmpno;
             DBEkorname.Text := FKeyEmpno.v_KeyKorname;
             Table1.Cancel;
             Table1.Filter := 'empno = ''' + Eempno.Text + ''' and WORKYY = '''+E_WorkYY.Text+''' ';   //kth 2010.12.21 년도 및 필터 추가
             Pdeptname.Caption := GetDeptname(Eempno.Text);
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
               SQL.Add('from PKMYSModify ');
               SQL.Add('where empno like :L1 or korname like :L1');
               ParamByName('L1').AsString := Eempno.Text + '%';
               Open;
               if RecordCount > 1 then
                  BBempnoClick(Sender);
          end;
          Table1.cancel;
          Table1.Filter := 'empno = ''' + Eempno.Text + ''' and WORKYY = '''+E_WorkYY.Text+''' ';     //kth 2010.12.21 년도 및 필터 추가
          Table1.Filtered := True;
          Pdeptname.Caption := GetDeptname(Eempno.Text);
     end;
end;

procedure TFpkq10601.EempnoExit(Sender: TObject);
begin
     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select empno ');
          SQL.Add('from PKMYSModify ');
          SQL.Add('where empno like :L1 or korname like :L1');
          ParamByName('L1').AsString := Eempno.Text + '%';
          Open;
          if RecordCount > 1 then
             BBempnoClick(Sender);
     end;
     Table1.cancel;
     Table1.Filter := 'empno = ''' + Eempno.Text + ''' and WORKYY = '''+E_WorkYY.Text+''' ';    //kth 2010.12.21 년도 및 필터 추가
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
          SQL.Add('from PKMYSModify a, pycdept b ');
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

//dsa2000   2007.02.05. 연말정산 수정신고를 위하여 추가함.
procedure TFpkq10601.BT_HisReadClick(Sender: TObject);
begin
  if MessageDlg('연말정산마스터 데이터 내역이 삭제됩니다. 진행하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from PKMYSModify ');
      execsql;

      SQL.Clear;
      SQL.Add('Insert into PKMYSModify    ');
      SQL.Add('Select * from pkhyshis  ');
      SQL.Add(' Where workyy = :workyy ');
      ParamByName('workyy').AsString := E_WorkYY.Text;
      execsql;
    end;

    ShowMessage(E_WorkYY.Text+'년 데이터를 마스터로 복원하였습니다');
  end;
end;

procedure TFpkq10601.BT_HisSaveClick(Sender: TObject);
begin
  if MessageDlg('연말정산이력 삭제후 마스터 내역을 일괄 저장하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from pkhyshis ');
      SQL.Add(' Where workyy = :workyy ');
      ParamByName('workyy').AsString := E_WorkYY.Text;
      execsql;

      SQL.Clear;
      SQL.Add('Insert into pkhyshis    ');
      SQL.Add('Select * from PKMYSModify  ');
      SQL.Add(' Where workyy = :workyy ');
      ParamByName('workyy').AsString := E_WorkYY.Text;
      execsql;
    end;

    ShowMessage(E_WorkYY.Text+'년 데이터를 이력에 저장하였습니다');
  end;
end;

procedure TFpkq10601.E_WorkYYExit(Sender: TObject);
begin
  if Trim( E_Workyy.Text) <> '' then
  begin
    ReadPkcysbas;
    SetTaxRate;
  end;
end;

end.
