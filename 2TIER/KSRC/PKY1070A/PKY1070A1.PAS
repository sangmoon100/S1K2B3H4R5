{* ======================= Program Header ======================================
 PROGRAM-NAME   : 파견직 급여마스터 관리(PKY1070A)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 지순미
 Version        : 1.0
 Date           : 2017.01.20

 USER LIBRARY : CALEN1    : 달력 Form.
                KeyEmpnoY : 사번조회 Form.
                KeyCode   : 코드조회 Form.
                PKY1070A1 : 신규등록사원(인사Master)조회Form.

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
    1.00      2017.01.20         지순미        PKC1040A 정규직 소스에서 파견직 분리
============================================================================= *}

unit PKY1070A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, ExtCtrls, Mask,
  DBCtrls, numedit, ComCtrls, Tabnotbk, jpeg, OnRegistry, Ora, MemDS, DBAccess,
  KeyCode, Func, KeyEmpno, KeyEmpnoY, Pass, Calen1;

type
  TFM_Main = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel3: TPanel;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBdelete: TBitBtn;
    BBcancel: TBitBtn;
    BBinsert: TBitBtn;
    maintitle: TPanel;
    BBphoto: TBitBtn;
    BBinsaedit: TBitBtn;
    CBef: TCheckBox;
    TabbedNotebook1: TTabbedNotebook;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label49: TLabel;
    Label61: TLabel;
    Label40: TLabel;
    Label51: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label126: TLabel;
    Label130: TLabel;
    Label135: TLabel;
    Label132: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label133: TLabel;
    Label58: TLabel;
    Label55: TLabel;
    Label54: TLabel;
    Label50: TLabel;
    Label74: TLabel;
    Label83: TLabel;
    Label97: TLabel;
    Label3: TLabel;
    Label114: TLabel;
    NEfamiamt: TNumberEdit;
    NElicecnt: TNumberEdit;
    NEmcaramt: TNumberEdit;
    NEovtmamt: TNumberEdit;
    NEliceamt: TNumberEdit;
    NEbokjisupamt: TNumberEdit;
    NEsptmamt: TNumberEdit;
    NEparentcnt: TNumberEdit;
    NEchildcnt: TNumberEdit;
    NEmatecnt: TNumberEdit;
    NElectsupamt: TNumberEdit;
    NEedusupamt: TNumberEdit;
    NEselfeduamt: TNumberEdit;
    NEyueduamt: TNumberEdit;
    NEdrvliceamt: TNumberEdit;
    NEmedsupamt: TNumberEdit;
    NEodamt: TNumberEdit;
    NEodtaxamt: TNumberEdit;
    NEsbontaxamt: TNumberEdit;
    NEsbonamt: TNumberEdit;
    NEybonamt: TNumberEdit;
    NEmbonamt: TNumberEdit;
    NEsoguppay: TNumberEdit;
    NEmcartaxamt: TNumberEdit;
    NElongsupamt: TNumberEdit;
    neovmcamt: TNumberEdit;
    Nechildeduamt: TNumberEdit;
    NETRAINSUPAMT: TNumberEdit;
    NEhomesupamt: TNumberEdit;
    NEbonusamt: TNumberEdit;
    NEtrainamt: TNumberEdit;
    NEincentamt: TNumberEdit;
    NEwinteramt: TNumberEdit;
    NEtaxpay: TNumberEdit;
    NEaidamt3: TNumberEdit;
    NEaidamt1: TNumberEdit;
    NEaidamt2: TNumberEdit;
    NEnotaxpay: TNumberEdit;
    Label34: TLabel;
    Label62: TLabel;
    Label35: TLabel;
    Label63: TLabel;
    NEnotaxpay1: TNumberEdit;
    Label69: TLabel;
    NEnotaxpay2: TNumberEdit;
    Label70: TLabel;
    NEnotaxpay3: TNumberEdit;
    NEnotaxpay4: TNumberEdit;
    Label75: TLabel;
    NEtaxpay1: TNumberEdit;
    Label78: TLabel;
    NEtaxpay2: TNumberEdit;
    Label81: TLabel;
    NEtaxpay3: TNumberEdit;
    Label96: TLabel;
    NEtaxpay4: TNumberEdit;
    Label98: TLabel;
    NEaidamt11: TNumberEdit;
    Label99: TLabel;
    NEaidamt12: TNumberEdit;
    Label105: TLabel;
    NEaidamt13: TNumberEdit;
    Label106: TLabel;
    NEaidamt14: TNumberEdit;
    Label107: TLabel;
    NEaidamt21: TNumberEdit;
    Label113: TLabel;
    NEaidamt22: TNumberEdit;
    Label117: TLabel;
    NEaidamt23: TNumberEdit;
    Label125: TLabel;
    NEaidamt24: TNumberEdit;
    Label127: TLabel;
    NEsoguppay1: TNumberEdit;
    Label128: TLabel;
    NEsoguppay2: TNumberEdit;
    Label129: TLabel;
    NEsoguppay3: TNumberEdit;
    Label131: TLabel;
    NEsoguppay4: TNumberEdit;
    Label136: TLabel;
    NEsoguppay5: TNumberEdit;
    Label140: TLabel;
    NEsoguppay6: TNumberEdit;
    GroupBox1: TGroupBox;
    Label84: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    SBmeddate: TSpeedButton;
    Label85: TLabel;
    Label86: TLabel;
    Label112: TLabel;
    Emedno: TEdit;
    MEmeddate: TMaskEdit;
    Emedgr: TEdit;
    Emedsayu: TEdit;
    NEmedamt: TNumberEdit;
    NEmeddamt: TNumberEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label111: TLabel;
    Eanugr: TEdit;
    Eanusayu: TEdit;
    NEanuselfamt: TNumberEdit;
    NEanudamt: TNumberEdit;
    SBempldate: TSpeedButton;
    Label89: TLabel;
    Label90: TLabel;
    MEempldate: TMaskEdit;
    Eemplsayu: TEdit;
    GroupBox4: TGroupBox;
    L_New3: TLabel;
    L_5: TLabel;
    L_New2: TLabel;
    L_New4: TLabel;
    L_Old1: TLabel;
    L_New1: TLabel;
    L_Old3: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Epaynum: TEdit;
    NEquaterpay: TNumberEdit;
    NEroleamt: TNumberEdit;
    NEholipay: TNumberEdit;
    NEfixpay: TNumberEdit;
    NEbasicamt: TNumberEdit;
    NEdutyamt: TNumberEdit;
    NEtotpay: TNumberEdit;
    Eyearpaynum: TEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Lmatekorname: TLabel;
    SBmateempno: TSpeedButton;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    CBfirstyn: TComboBox;
    NEyearadddays: TNumberEdit;
    Emateempno: TEdit;
    NEmatedcnt: TNumberEdit;
    NEfamidcnt: TNumberEdit;
    NEobsdcnt: TNumberEdit;
    NEsilverdcnt: TNumberEdit;
    NEwomandcnt: TNumberEdit;
    Label28: TLabel;
    SBbank: TSpeedButton;
    Label30: TLabel;
    Lpaybank: TLabel;
    Label116: TLabel;
    Lpaybank1: TLabel;
    Label119: TLabel;
    sbbank1: TSpeedButton;
    Epaybank: TEdit;
    Epayacnt: TEdit;
    Epaybank1: TEdit;
    Epayacnt1: TEdit;
    GroupBox5: TGroupBox;
    Label20: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    Label15: TLabel;
    Label118: TLabel;
    Loffitel: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label9: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Lpaycl: TLabel;
    Lpayra: TLabel;
    Lpstate: TLabel;
    Lorgnum: TLabel;
    Ldeptcode: TLabel;
    Lempdate: TLabel;
    Lpaycldate: TLabel;
    Lretdate: TLabel;
    Lexdate: TLabel;
    Lexdesc: TLabel;
    Lexxdate: TLabel;
    Lexxdesc: TLabel;
    Ldeptname: TLabel;
    Lterm: TLabel;
    Label48: TLabel;
    Ejuminid: TEdit;
    Eaddr: TEdit;
    Ezipno: TEdit;
    CBSex: TComboBox;
    CBpayyn: TComboBox;
    Label7: TLabel;
    Lbldcode: TLabel;
    Label21: TLabel;
    SBbldcode: TSpeedButton;
    Label134: TLabel;
    Lbpaycl: TLabel;
    SBbpaycl: TSpeedButton;
    Ebldcode: TEdit;
    CBnojoyn: TComboBox;
    Ebpaycl: TEdit;
    GroupBox8: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label59: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label73: TLabel;
    Label76: TLabel;
    Label67: TLabel;
    Label71: TLabel;
    Label139: TLabel;
    Label65: TLabel;
    Label77: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label115: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Label2: TLabel;
    NEsauamt: TNumberEdit;
    NEnojoamt: TNumberEdit;
    NEigamt: TNumberEdit;
    NEedudedamt: TNumberEdit;
    NEsobiamt: TNumberEdit;
    NEparkamt: TNumberEdit;
    NEchollamt: TNumberEdit;
    NEsangamt: TNumberEdit;
    NEmeddedamt: TNumberEdit;
    NEhsamt: TNumberEdit;
    NEfbamt: TNumberEdit;
    NEsacorpamt: TNumberEdit;
    NEsabankamt: TNumberEdit;
    NEnbamt: TNumberEdit;
    NEsaveamt3: TNumberEdit;
    NEticketamt: TNumberEdit;
    NEbondedamt: TNumberEdit;
    NEOVMCDED: TNumberEdit;
    NEdedamt2: TNumberEdit;
    NEdedamt3: TNumberEdit;
    NEloanamt1: TNumberEdit;
    NEloanamt2: TNumberEdit;
    NEsaveamt1: TNumberEdit;
    NEsaveamt2: TNumberEdit;
    NEdedamt1: TNumberEdit;
    NEloanamt3: TNumberEdit;
    NEpayholdamt: TNumberEdit;
    NEdedamt4: TNumberEdit;
    NEdedamt5: TNumberEdit;
    image1: TImage;
    Label141: TLabel;
    NEedusupamt1: TNumberEdit;
    Label142: TLabel;
    NEedusupamt2: TNumberEdit;
    Label143: TLabel;
    NElectsupamt1: TNumberEdit;
    Label144: TLabel;
    NElectsupamt2: TNumberEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Eempno: TEdit;
    SBempno: TSpeedButton;
    P_korname: TPanel;
    Label4: TLabel;
    Label145: TLabel;
    NElectsupamt3: TNumberEdit;
    Label146: TLabel;
    NElectsupamt4: TNumberEdit;
    Label147: TLabel;
    NEhsorgamt: TNumberEdit;
    Label148: TLabel;
    NEhsintamt: TNumberEdit;
    Label149: TLabel;
    neITAMT: TNumberEdit;
    NEyuedutax: TNumberEdit;
    Label150: TLabel;
    NEchilddedcnt: TNumberEdit;
    Label151: TLabel;
    Label152: TLabel;
    NEparentamt: TNumberEdit;
    NEchildamt: TNumberEdit;
    NEmateamt: TNumberEdit;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    OraQuery1: TOraQuery;
    Label72: TLabel;
    NEsacorpcp: TNumberEdit;
    NEsabankcp: TNumberEdit;
    Label160: TLabel;
    Label161: TLabel;
    NEempldamt: TNumberEdit;      // 연봉차수
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SBempnoClick(Sender: TObject);
    procedure CBpayynChange(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure EjuminidKeyPress(Sender: TObject; var Key: Char);
    procedure BBrunClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure SBbldcodeClick(Sender: TObject);
    procedure SBbpayclClick(Sender: TObject);
    procedure SBmateempnoClick(Sender: TObject);
    procedure SBmeddateClick(Sender: TObject);
    procedure SBempldateClick(Sender: TObject);
    procedure EbpayclExit(Sender: TObject);
    procedure EbldcodeExit(Sender: TObject);
    procedure SBbankClick(Sender: TObject);
    procedure EpaybankExit(Sender: TObject);
    procedure CBnojoynChange(Sender: TObject);
    procedure CBfirstynChange(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EmateempnoExit(Sender: TObject);
    procedure MEmeddateChange(Sender: TObject);
    procedure MEempldateChange(Sender: TObject);
    procedure MEmeddateKeyPress(Sender: TObject; var Key: Char);
    procedure MEempldateKeyPress(Sender: TObject; var Key: Char);
    procedure EpaybankKeyPress(Sender: TObject; var Key: Char);
    procedure EbldcodeKeyPress(Sender: TObject; var Key: Char);
    procedure EmateempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EbpayclKeyPress(Sender: TObject; var Key: Char);
    procedure CBpayynDblClick(Sender: TObject);
    procedure CBnojoynDblClick(Sender: TObject);
    procedure CBfirstynDblClick(Sender: TObject);
    procedure BBphotoClick(Sender: TObject);
    procedure BBinsaeditClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBefClick(Sender: TObject);
    procedure NEmcaramtEnter(Sender: TObject);
    procedure NEmcaramtExit(Sender: TObject);
    procedure CBSexDblClick(Sender: TObject);
    procedure CBSexExit(Sender: TObject);
    procedure sbbank1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NEsoguppay1Exit(Sender: TObject);
    procedure NEaidamt11Exit(Sender: TObject);
    procedure NEaidamt21Exit(Sender: TObject);
    procedure NEtaxpay1Exit(Sender: TObject);
    procedure NEnotaxpay1Exit(Sender: TObject);
    procedure NEedusupamt1Exit(Sender: TObject);
    procedure NElectsupamt1Exit(Sender: TObject);
    procedure NEyueduamtExit(Sender: TObject);
    procedure Calc_Famiamtsum(Sender: TObject);

  private
    { Private declarations }
    LSempno : String;         //현재사번저장[취소시사용]
    LIbutnChk : Integer;         //0:초기, 1:입력, 2:조회
    LIretrieveChk  : Integer;    //-1:조회실패 / 0:조회성공
    W_worktype : string;  // 0:공통, 1:정규직, 2:파견직(일반직)
    V_payyn, V_bldcode, V_nojoyn, V_yearpaynum, V_totpay, V_fixpay, V_paybank, V_payacnt, V_paybank1, V_payacnt1   : string;

    Procedure Retrieve;          //자료조회
    Procedure EditEnabledTrue;   //수정/입력가능
    Procedure EditEnabledFalse;  //수정/입력불가
    function Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;

  public
    { Public declarations }

    GSpaycl    : String;
    GSpayra    : String;
    GSpstate   : String;
    GSempno    : String;
    gsMinPaycl : String; //임원직급범위 FR
    gsMaxPaycl : String; //임원직급범위 TO

    Procedure DataAllClear;                                //화면Clear
    procedure p_GetCodeName(codetitle,codeid: String;
                                var Ecode :TEdit;var Lcode :Tlabel );
    function GetPhoto(arg_emp:String):boolean;
  end;

var
  FM_Main : TFM_Main;
  BefValue  : Real;

//Dsa2000   2004.03.02.
const
  SUBKEY    : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';

implementation

{$R *.DFM}

Uses PKY1070A2, PKY1070A3;



//------------------------------ User Procedure --------------------------------
Procedure TFM_Main.EditEnabledTrue;
begin

end;

Procedure TFM_Main.EditEnabledFalse;
begin

end;

Procedure TFM_Main.Retrieve;
var
     LSretdate : string;
     LSterm : string;
     Exyy, Exmm, Exdd : string;  // 근속제외일자
     LIchk : Integer;          // 근속년월계산일자오류Check -1
     qq : TOraQuery;
begin
     LIchk := 0;
     Phelpmsg.Caption := ' 자료 조회중 입니다....';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.yueduamt-least(a.yueduamt,(select childnotax from pkcpbas)) yuedutax,           ');
               SQL.Add('       nvl((select totpay                                                                ');
               SQL.Add('              from pkhyphis                                                              ');
               SQL.Add('             where empno = a.empno                                                       ');
               SQL.Add('               and yearpaynum = a.yearpaynum), 0) totpay,                                ');
               SQL.Add('       to_char(to_date(a.empdate,''YYYYMMDD'')+nvl(b.exdays,0),''YYYYMMDD'') empdate2,   ');
               SQL.ADD('       a.*                                                                               ');
               SQL.ADD('  from pkmpmas a,                                                                        ');
               SQL.Add('       (select sum(exdays) exdays                                                        ');
               SQL.Add('          from pkhexdd                                                                   ');
               SQL.Add('         where empno = :p_empno                                                          ');
               SQL.Add('           and exfixyn = ''Y'') b                                                        ');
               SQL.ADD(' where a.empno = :p_empno                                                                ');
               ParamByName('p_empno').AsString := Eempno.Text;
               Open;

               Application.ProcessMessages;

               //인사사항
               P_korname.caption  := FieldByName('korname').AsString;
               CBsex.Text        := UpperCase(FieldByName('sex').AsString);
               Ejuminid.Text     := FieldByName('juminid').AsString;
               Loffitel.Caption  := FieldByName('offitel').AsString;
               Ezipno.Text       := FieldByName('zipno').AsString;
               Eaddr.Text        := FieldByName('addr').AsString;

               GSpaycl           := FieldByName('paycl').AsString;
               GSpayra           := FieldByName('payra').AsString;
               GSpstate          := FieldByName('pstate').AsString;
               GSempno           := FieldByName('empno').AsString;

               Lpaycl.Caption    := GetCodeName('I112', GSpaycl);
               Lpayra.Caption    := GetCodeName('I113', GSpayra);
               Lpstate.Caption   := GetCodeName('I114', GSpstate);
               Lorgnum.Caption   := FieldByName('orgnum').AsString;
               Ldeptcode.Caption := FieldByName('deptcode').AsString;
               Ldeptname.Caption := GetDeptName(Lorgnum.Caption, FieldByName('deptcode').AsString);
               Ldeptname.Hint    := Ldeptname.Caption;
               Lempdate.Caption  := InMask(FieldByName('empdate').AsString, '@@@@/@@/@@');
               Lpaycldate.Caption:= InMask(FieldByName('paycldate').AsString, '@@@@/@@/@@');
               Lretdate.Caption  := InMask(FieldByName('retdate').AsString, '@@@@/@@/@@');

               CBpayyn.Text      := FieldByName('payyn').AsString;
               if FieldByName('payyn').AsString = 'N' then CBpayyn.Color := clRed
               else                                        CBpayyn.Color := $0080FFFF;

               Ebldcode.Text     := FieldByName('bldcode').AsString;
               Lbldcode.Caption  := GetCodeName('I160', FieldByName('bldcode').AsString);
               CBnojoyn.Text     := FieldByName('nojoyn').AsString;
               Ebpaycl.Text      := FieldByName('bpaycl').AsString;
               Lbpaycl.Caption   := GetCodeName('I112', FieldByName('bpaycl').AsString);

               //급여기본사항
               Eyearpaynum.Text  := FieldByName('yearpaynum').AsString;
               NEtotpay.Value    := FieldByName('totpay').AsFloat;
               Epaynum.Text      := FieldByName('paynum').AsString;
               NEfixpay.Value    := FieldByName('fixpay').AsFloat;
               NEholipay.Value   := FieldByName('holipay').AsFloat;
               NEbasicamt.Value  := FieldByName('basicamt').AsFloat;
               NEquaterpay.Value := FieldByName('quaterpay').AsFloat;
               NEroleamt.Value   := FieldByName('roleamt').AsFloat;
               NEdutyamt.Value   := FieldByName('dutyamt').AsFloat;

               //급여계좌번호
               Epaybank.Text     := FieldByName('paybank').AsString;
               Lpaybank.Caption  := GetCodeName('K910', Epaybank.Text);
               Epayacnt.Text     := FieldByName('payacnt').AsString;

               Epaybank1.Text    := FieldByName('paybank1').AsString;
               Lpaybank1.Caption := GetCodeName('K910', Epaybank1.Text);
               Epayacnt1.Text    := FieldByName('payacnt1').AsString;

               //정산관련
               NEyearadddays.Value   := FieldByName('yearadddays').AsFloat;
               CBfirstyn.Text        := FieldByName('firstyn').AsString;
               Emateempno.Text       := FieldByName('mateempno').AsString;
               Lmatekorname.Caption  := GetKorName(FieldByName('mateempno').AsString);
               NEmatedcnt.Value      := FieldByName('matedcnt').AsFloat;
               NEfamidcnt.Value      := FieldByName('famidcnt').AsFloat;
               NEwomandcnt.Value     := FieldByName('womandcnt').AsFloat;
               NEobsdcnt.Value       := FieldByName('obsdcnt').AsFloat;
               NEsilverdcnt.Value    := FieldByName('silverdcnt').AsFloat;
               NEchilddedcnt.Value   := FieldByName('childdedcnt').AsFloat;

               //지급사항
               NEfamiamt.Value       := FieldByName('famiamt').AsFloat;
               NEparentcnt.Value     := FieldByName('parentcnt').AsFloat;
               Neparentamt.Value     := FieldByName('partamt').AsFloat;
               NEchildcnt.Value      := FieldByName('childcnt').AsFloat;
               NEchildamt.Value      := FieldByName('childamt').AsFloat;
               NEmatecnt.Value       := FieldByName('matecnt').AsFloat;
               NEmateamt.Value       := FieldByName('mateamt').AsFloat;
               NEliceamt.Value       := FieldByName('liceamt').AsFloat;
               NElicecnt.Value       := FieldByName('licecnt').AsFloat;
               NEovtmamt.Value       := FieldByName('ovtmamt').AsFloat;
               NEmcaramt.Value       := FieldByName('mcaramt').AsFloat;
               NEmcartaxamt.Value    := FieldByName('mcartaxamt').AsFloat;
               NEbonusamt.Value      := FieldByName('bonusamt').AsFloat;
               NEtrainamt.Value      := FieldByName('trainamt').AsFloat;
               NElongsupamt.Value    := FieldByName('longsupamt').AsFloat;
               NEwinteramt.Value     := FieldByName('winteramt').AsFloat;
               NEhomesupamt.Value    := FieldByName('homesupamt').AsFloat;
               NEsbonamt.Value       := FieldByName('sbonamt').AsFloat;
               NEsbontaxamt.Value    := FieldByName('sbontaxamt').AsFloat;
               NEmbonamt.Value       := FieldByName('mbonamt').AsFloat;
               NEybonamt.Value       := FieldByName('ybonamt').AsFloat;
               NEedusupamt.Value     := FieldByName('edusupamt').AsFloat;
               NEedusupamt1.Value    := FieldByName('edusupamt1').AsFloat;
               NEedusupamt2.Value    := FieldByName('edusupamt2').AsFloat;
               NEsptmamt.Value       := FieldByName('sptmamt').AsFloat;
               NEodamt.Value         := FieldByName('odamt').AsFloat;
               NEodtaxamt.Value      := FieldByName('odtaxamt').AsFloat;
               NEbokjisupamt.Value   := FieldByName('bokjisupamt').AsFloat;
               NEdrvliceamt.Value    := FieldByName('drvliceamt').AsFloat;
               NEmedsupamt.Value     := FieldByName('medsupamt').AsFloat;
               NEyueduamt.Value      := FieldByName('yueduamt').AsFloat;
               NEyuedutax.Value      := FieldByName('YUEDUTAX').AsFloat;
               NEselfeduamt.Value    := FieldByName('selfeduamt').AsFloat;
               NEchildeduamt.Value   := FieldByName('childeduamt').AsFloat;
               NETrainSupAmt.Value   := FieldByName('TrainSupAmt').AsFloat;
               NEaidamt3.Value       := FieldByName('aidamt3').AsFloat;  //유치수수료
               NEovmcamt.Value       := FieldByName('ovmcamt').AsFloat;
               NEitamt.Value         := FieldByName('itamt').AsFloat;  //정보통신수당 신설 2005.01.07. dsa2000
               NElectsupamt.Value    := FieldByName('lectsupamt').AsFloat;
               NElectsupamt1.Value   := FieldByName('lectsupamt1').AsFloat;
               NElectsupamt2.Value   := FieldByName('lectsupamt2').AsFloat;
               NElectsupamt3.Value   := FieldByName('lectsupamt3').AsFloat;
               NElectsupamt4.Value   := FieldByName('lectsupamt4').AsFloat;
               NEaidamt1.Value       := FieldByName('aidamt1').AsFloat;
               NEaidamt11.Value      := FieldByName('aidamt11').AsFloat;
               NEaidamt12.Value      := FieldByName('aidamt12').AsFloat;
               NEaidamt13.Value      := FieldByName('aidamt13').AsFloat;
               NEaidamt14.Value      := FieldByName('aidamt14').AsFloat;
               NEtaxpay.Value        := FieldByName('taxpay').AsFloat;
               NEtaxpay1.Value       := FieldByName('taxpay1').AsFloat;
               NEtaxpay2.Value       := FieldByName('taxpay2').AsFloat;
               NEtaxpay3.Value       := FieldByName('taxpay3').AsFloat;
               NEtaxpay4.Value       := FieldByName('taxpay4').AsFloat;
               NEsoguppay.Value      := FieldByName('soguppay').AsFloat;
               NEsoguppay1.Value     := FieldByName('soguppay1').AsFloat;
               NEsoguppay2.Value     := FieldByName('soguppay2').AsFloat;
               NEsoguppay3.Value     := FieldByName('soguppay3').AsFloat;
               NEsoguppay4.Value     := FieldByName('soguppay4').AsFloat;
               NEsoguppay5.Value     := FieldByName('soguppay5').AsFloat;
               NEsoguppay6.Value     := FieldByName('soguppay6').AsFloat;
               NEaidamt2.Value       := FieldByName('aidamt2').AsFloat;
               NEaidamt21.Value      := FieldByName('aidamt21').AsFloat;
               NEaidamt22.Value      := FieldByName('aidamt22').AsFloat;
               NEaidamt23.Value      := FieldByName('aidamt23').AsFloat;
               NEaidamt24.Value      := FieldByName('aidamt24').AsFloat;
               NEnotaxpay.Value      := FieldByName('notaxpay').AsFloat;
               NEnotaxpay1.Value     := FieldByName('notaxpay1').AsFloat;
               NEnotaxpay2.Value     := FieldByName('notaxpay2').AsFloat;
               NEnotaxpay3.Value     := FieldByName('notaxpay3').AsFloat;
               NEnotaxpay4.Value     := FieldByName('notaxpay4').AsFloat;
               //NEincentamt.Value     := FieldByName('incentamt').AsFloat;

               //공제사항 - 의료보험
               Emedno.Text        := FieldByName('medno').AsString;
               Emedgr.Text        := FieldByName('medgr').AsString;
               MEmeddate.Text     := FieldByName('meddate').AsString;
               NEmedamt.Value     := FieldByName('medamt').AsFloat;
               NEmeddamt.Value    := FieldByName('meddamt').AsFloat;
               Emedsayu.Text      := FieldByName('medsayu').AsString;

               //공제사항 - 국민연금
               Eanugr.Text        := FieldByName('anugr').AsString;
               NEanuselfamt.Value := FieldByName('anuselfamt').AsFloat;
               NEanudamt.Value    := FieldByName('anudamt').AsFloat;
               Eanusayu.Text      := FieldByName('anusayu').AsString;

               //공제사항 - 고용보험
               NEempldamt.Value   := FieldByName('empldamt').AsFloat; //2013.04.04.hjku. 문경란씨 요청으로 고용보험 추가
               MEempldate.Text    := FieldByName('empldate').AsString;
               Eemplsayu.Text     := FieldByName('emplsayu').AsString;

               //공제사항
               NEsauamt.Value     := FieldByName('sauamt').AsFloat;
               NEsaveamt3.Value   := FieldByName('saveamt3').AsFloat;
               NEedudedamt.Value  := FieldByName('edudedamt').AsFloat;
               NEparkamt.Value    := FieldByName('parkamt').AsFloat;
               NEnojoamt.Value    := FieldByName('nojoamt').AsFloat;
               NEigamt.Value      := FieldByName('igamt').AsFloat;
               NEsobiamt.Value    := FieldByName('sobiamt').AsFloat;
               NEchollamt.Value   := FieldByName('chollamt').AsFloat;
               NEmeddedamt.Value  := FieldByName('meddedamt').AsFloat;
               NEsangamt.Value    := FieldByName('sangamt').AsFloat;
               NEhsamt.Value      := FieldByName('hsamt').AsFloat;
               NEhsorgamt.Value   := FieldByName('hsorgamt').AsFloat;
               NEhsintamt.Value   := FieldByName('hsintamt').AsFloat;

               NEsacorpcp.Value   := FieldByName('sacorpcp').AsFloat;                //2011.09.20 kth 우리사주회사원금 추가
               NEsacorpamt.Value  := FieldByName('sacorpamt').AsFloat;
               NEsabankcp.Value   := FieldByName('sabankcp').AsFloat;                //2011.09.20 kth 우리사주은행원금 추가
               NEsabankamt.Value  := FieldByName('sabankamt').AsFloat;
               NEnbamt.Value      := FieldByName('nbamt').AsFloat;
               NEfbamt.Value      := FieldByName('fbamt').AsFloat;
               NEloanamt1.Value   := FieldByName('loanamt1').AsFloat;
               NEloanamt2.Value   := FieldByName('loanamt2').AsFloat;
               NEloanamt3.Value   := FieldByName('loanamt3').AsFloat;
               NEticketamt.Value  := FieldByName('ticketamt').AsFloat;
               NEOvmcded.Value    := FieldByName('OvmcDed').AsFloat;
               NEbondedamt.Value  := FieldByName('bondedamt').AsFloat;
               NEpayholdamt.Value := FieldByName('payholdamt').AsFloat;
               NEsaveamt1.Value   := FieldByName('saveamt1').AsFloat;
               NEsaveamt2.Value   := FieldByName('saveamt2').AsFloat;
               NEdedamt1.Value    := FieldByName('dedamt1').AsFloat;
               NEdedamt2.Value    := FieldByName('dedamt2').AsFloat;
               NEdedamt3.Value    := FieldByName('dedamt3').AsFloat;
               NEdedamt4.Value    := FieldByName('dedamt4').AsFloat;
               NEdedamt5.Value    := FieldByName('dedamt5').AsFloat;


               //근속내역조회추가...?일자올림
               if FieldByName('retdate').AsString <> '' then
               begin
                    if Fn_IsDate(FieldByName('retdate').AsString) = False then
                    begin
                         MessageBox(handle,'퇴사일자가 정확하지 않아 근속내역을 추출 할 수없습니다.',
                                           '근속년월계산오류',MB_ICONWARNING);
                         LIchk := -1;
                    end;
               end
               else
               begin
                    If Fn_IsDate(RemoveChar(Lsysdate.Caption,'/')) = False then
                    begin
                         MessageBox(handle,'시스템일자 오류로 정확한 근속내역을 추출 할 수없습니다.',
                                           '근속년월계산오류',MB_ICONWARNING);
                         LIchk := -1;
                    end;
               end;

               if Fn_IsDate(FieldByName('empdate').AsString) = False then
               begin
                    MessageBox(handle,'입사일자 오류로 정확한 근속내역을 추출 할 수없습니다.',
                                      '근속년월계산오류',MB_ICONWARNING);
                    LIchk := -1;
               end;

               if FieldByName('retdate').AsString = '' then
                    LSterm := YmdCountStr(FieldByName('empdate2').AsString, RemoveChar(Lsysdate.Caption, '/'))
               else
                    LSterm := YmdCountStr(FieldByName('empdate2').AsString, FieldByName('retdate').AsString);


               Lterm.Caption := Copy(LSterm,1,2)+'년 '+Copy(LSterm,3,2)+'월 '+Copy(LSterm,5,2)+'일';

               if LIchk = -1 then Lterm.Caption := '__년__월__일';

               {// 휴직기간,휴직사유
               Query2.Close;
               Query2.SQL.Clear;
               Query2.SQL.ADD(' SELECT EXFRDATE, EXTODATE, EXDESC ');
               Query2.SQL.ADD('   FROM PKHEXDD ');
               Query2.SQL.ADD('  WHERE EMPNO = '''+Eempno.Text+''' ');
               Query2.SQL.ADD('    AND EXKIND LIKE ''8%'' ');
               Query2.SQL.ADD('    AND EXFRDATE = (SELECT MAX(EXFRDATE) ');
               Query2.SQL.ADD('                      FROM PKHEXDD ');
               Query2.SQL.ADD('                     WHERE EMPNO = '''+Eempno.Text+''' ');
               Query2.SQL.ADD('                       AND EXKIND LIKE ''8%'' ');
               Query2.SQL.ADD('                       AND EXFIXYN = ''Y'') ');
               Query2.Open;
               Lexdate.Caption := DateFormatMask(Query2.FieldByName('exfrdate').AsString,'/',1)
                             +'-'+DateFormatMask(Query2.FieldByName('extodate').AsString,'/',1);
               Lexdesc.Caption := Query2.FieldByName('exdesc').AsString;
               Lexdesc.Hint := Query2.FieldByName('exdesc').AsString;

               // 병가기간/병가사유
               Query2.Close;
               Query2.SQL.Clear;
               Query2.SQL.ADD(' SELECT EXFRDATE, EXTODATE, EXDESC ');
               Query2.SQL.ADD('   FROM PKHEXDD ');
               Query2.SQL.ADD('  WHERE EMPNO = '''+Eempno.Text+''' ');
               Query2.SQL.ADD('    AND EXKIND = ''71'' ');
               Query2.SQL.ADD('    AND EXFRDATE = (SELECT MAX(EXFRDATE) ');
               Query2.SQL.ADD('                      FROM PKHEXDD ');
               Query2.SQL.ADD('                     WHERE EMPNO = '''+Eempno.Text+''' ');
               Query2.SQL.ADD('                       AND EXKIND = ''71'' ');
               Query2.SQL.ADD('                       AND EXFIXYN = ''Y'') ');
               Query2.Open;
               Lexxdate.Caption := DateFormatMask(Query2.FieldByName('exfrdate').AsString,'/',1)
                              +'-'+DateFormatMask(Query2.FieldByName('extodate').AsString,'/',1);
               Lexxdesc.Caption := Query2.FieldByName('exdesc').AsString;
               Lexxdesc.Hint := Query2.FieldByName('exdesc').AsString;}


               //2015.11.23 eyha 변경전 값 저장
               V_payyn           := FieldByName('payyn').AsString;
               V_bldcode         := FieldByName('bldcode').AsString;
               V_nojoyn          := FieldByName('nojoyn').AsString;
               V_yearpaynum      := FieldByName('yearpaynum').AsString;
               V_totpay          := FloatToStr(FieldByName('totpay').AsFloat);
               V_fixpay          := FloatToStr(FieldByName('fixpay').AsFloat);
               V_paybank         := FieldByName('paybank').AsString;
               V_payacnt         := FieldByName('payacnt').AsString;
               V_paybank1        := FieldByName('paybank1').AsString;
               V_payacnt1        := FieldByName('payacnt1').AsString;

               if RecordCount <> 0 then
               begin
                    Phelpmsg.Caption := ' 자료 조회가 완료 되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    EditEnabledTrue;
                    LIretrieveChk := 0;
                    LIbutnChk := 0;
                    LSempno := Eempno.Text;     //Key Save
                    Eempno.readonly := True;
                    GetPhoto(Eempno.Text);
               end
               else
               begin
                    Phelpmsg.Caption := ' 자료가 없습니다....';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    EditEnabledFalse;
                    Eempno.readonly := false;
                    LIretrieveChk := -1;
               end;
          end;
     Finally
          qq.Free;
     end;
end;

Procedure TFM_Main.DataAllClear;
var
     i : integer;
begin
     for i := 0 to ComponentCount -1 do
     begin
          if Components[i] is TNumberEdit then TNumberEdit(Components[i]).Value := 0;
          if Components[i] is TEdit then TEdit(Components[i]).Text := '';
          if Components[i] is TMaskEdit then TMaskEdit(Components[i]).Text := '';
          if Components[i] is TComboBox then TComboBox(Components[i]).Text := '';
          if Components[i] is TRadioButton then TRadioButton(Components[i]).checked := false;
     end;

     P_korname.caption    := '';
     CBsex.Text           := '';
     Loffitel.Caption     := '';
     Lpaycl.Caption       := '';
     Lpayra.Caption       := '';
     Lpstate.Caption      := '';
     Lorgnum.Caption      := '';
     Ldeptcode.Caption    := '';
     Ldeptname.Caption    := '';
     Ldeptname.Hint       := '';
     Ldeptname.Hint       := '';
     Lempdate.Caption     := '';
     Lpaycldate.Caption   := '';
     Lretdate.Caption     := '';
     Lterm.Caption        := '';
     Lexdate.Caption      := '';
     Lexdesc.Caption      := '';
     Lexxdate.Caption     := '';
     Lexxdesc.Caption     := '';
     CBpayyn.Color        := $0080FFFF;
     Lpaybank.Caption     := '';
     Lpaybank1.Caption    := '';
     Lbldcode.Caption     := '';
     Lmatekorname.Caption := '';
     Lbpaycl.Caption      := '';
     GSpaycl              := '';
     GSpayra              := '';
     GSpstate             := '';
     Image1.Picture       := nil;
end;

//----------------------------------- MAIN -------------------------------------
procedure TFM_Main.FormActivate(Sender: TObject);
begin
     PhelpMsg.Caption := ' 작업자 / 작업일을 설정하고 있습니다.';
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     //파견직(일반직) 관리자 구분에 따른 메임폼 타이틀 변경. //fn_YmanagerCheck -> Func.Pas Libraray에 정의.
     if  (Copy(Pempno,1,1) = 'D') or fn_YmanagerCheck then
     begin
          maintitle.Color   := clTeal;
          maintitle.Caption := '급여마스터 관리[파견직]';
          Label63.Caption   := '관리수수료:';
          Label109.Caption  := '산재보험료:';
          //2013.04.04.hjku. 문경란씨 요청으로 고용보험 추가
          Label161.Visible  := true;
          NEempldamt.Visible:= true;

          W_worktype := '파견직';   //2015.11.23 eyha 정규직, 파견직 구분
     end
     else
     begin
          MessageBox(handle,'파견직급여관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     Lsysdate.Caption := fn_getDateStr;
     Lempno.Caption := Pkorname + '(' + Pempno + ')';

     LIretrieveChk := -1;

//infra     gsMinPaycl := '00';
//infra     gsMaxPaycl := '08';
     gsMinPaycl := 'A11';    //회장
     gsMaxPaycl := 'A61';    //상무보

     if (copy(Pgrade, 3, 1) <= 'C') then BBinsaedit.visible := True
     else BBinsaedit.visible := false;

     PhelpMsg.Caption := ' 작업자,작업일설정이 완료 되었습니다, 작업을 진행하세요...';
end;

//사번Check/자료조회
procedure TFM_Main.SBempnoClick(Sender: TObject);
begin
     LIbutnChk := 2;

     DataAllClear;

     Eempno.readonly := False;
     Phelpmsg.Caption := ' 사번이나,성명을 선택하세요.';


     FKeyEmpnoY := TFKeyEmpnoY.Create(Self);

     Try
          FKeyEmpnoY.ShowModal;
          If FKeyEmpnoY.Closechk = -1 then Exit;

          Eempno.Text := FKeyEmpnoY.v_KeyEmpno;
          P_korname.caption := FKeyEmpnoY.v_KeyKorname;
     Finally
          FKeyEmpnoY.Free;
     end;
     
     if (Copy(Eempno.Text,1,1) <> 'Y') then
     begin
          Application.MessageBox('정규직 사번에 대한 작업을'+#13+
                                 '할 수 없습니다.','작업안내',MB_OK+$0030);
          Eempno.SelectAll;
          System.Exit;
     end;

     Retrieve;  //지정사번으로 조회

end;

procedure TFM_Main.EempnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
     if Key = #13 then
     begin
          key := #0;

          if (Copy(Eempno.Text,1,1) <> 'Y') then
          begin
               Application.MessageBox('정규직 사번에 대한 작업을'+#13+
                                      '할 수 없습니다.','작업안내',MB_OK+$0030);
               Eempno.SelectAll;
               System.Exit;
          end;

          qq := TOraQuery.Create(Nil);
          qq.Session := Ora_Session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno                    ');
                    SQL.Add('  from pkmpmas                  ');
                    SQL.Add(' where (empno   like :empno or  ');
                    SQL.Add('        korname like :empno)    ');
                    ParamByName('empno').AsString := Eempno.Text + '%';

                    Open;

                    if RecordCount = 0 then
                    begin
                         MessageBox(handle,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING);
                         Exit;
                    end
                    else if RecordCount = 1 then
                    begin
                         Eempno.Text := FieldByName('empno').AsString;
                         Retrieve;
                    end
                    else if RecordCount > 1 then
                    begin
                         FKeyEmpno := TFKeyEmpno.Create(Self);
                         Try
                              FKeyEmpno.EdEmpno.Text := Eempno.Text;
                              FKeyEmpno.ShowModal;

                              if FKeyEmpno.Closechk = -1 then Exit;

                              Eempno.Text := FKeyEmpno.v_KeyEmpno;
                              P_korname.caption := FKeyEmpno.v_KeyKorname;
                         Finally
                              FKeyEmpno.Free;
                         end;

                         Retrieve;
                    end;
               end;
          Finally
               qq.Free;
          end;
     end;
end;

procedure TFM_Main.EjuminidKeyPress(Sender: TObject; var Key: Char);
begin

end;

//급여지급여부설정시...
procedure TFM_Main.CBpayynChange(Sender: TObject);
begin
     CBpayyn.Text := UpperCase(CBpayyn.Text);

     if CBpayyn.Text = 'N' then CBpayyn.Color := clRed
     else                       CBpayyn.Color := $0080FFFF;
end;

procedure TFM_Main.CBpayynDblClick(Sender: TObject);
begin
     CBpayyn.Text := UpperCase(CBpayyn.Text);

     if CBpayyn.Text = 'N' then CBpayyn.Color := clRed
     else                       CBpayyn.Color := $0080FFFF;
end;

//노조여부설정시
procedure TFM_Main.CBnojoynChange(Sender: TObject);
begin
     CBnojoyn.Text := UpperCase(CBnojoyn.Text);
end;

procedure TFM_Main.CBnojoynDblClick(Sender: TObject);
begin
     CBnojoyn.Text := UpperCase(CBnojoyn.Text);
end;

//장남여부설정시
procedure TFM_Main.CBfirstynChange(Sender: TObject);
begin
     CBfirstyn.Text := UpperCase(CBfirstyn.Text);
end;

procedure TFM_Main.CBfirstynDblClick(Sender: TObject);
begin
     CBfirstyn.Text := UpperCase(CBfirstyn.Text);
end;

//은행코드Ckeck/조회
procedure TFM_Main.SBbankClick(Sender: TObject);
begin
     p_GetCodeName('은행코드조회','K910',Epaybank,Lpaybank);
end;

procedure TFM_Main.EpaybankExit(Sender: TObject);
begin
     Lpaybank.Caption := GetCodeName('K910', Epaybank.Text);
end;

procedure TFM_Main.EpaybankKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          TabbedNotebook1.PageIndex := 0;
          Epayacnt.SetFocus;
     end;
end;

{근무지코드Ckeck/조회}
procedure TFM_Main.SBbldcodeClick(Sender: TObject);
begin
     p_GetCodeName('근무지코드조회', 'I160',  Ebldcode, Lbldcode);
end;

procedure TFM_Main.EbldcodeExit(Sender: TObject);
begin
     Lbldcode.Caption := GetCodeName('I160',Ebldcode.Text);
end;

procedure TFM_Main.EbldcodeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          TabbedNotebook1.PageIndex := 0;
          CBnojoyn.SetFocus;
     end;
end;

{사내부부Ckeck/조회}
procedure TFM_Main.SBmateempnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);

     Try
          FKeyEmpno.Position := poScreenCenter;
          FKeyEmpno.ShowModal;

          if FKeyEmpno.Closechk = -1 then Exit;

          Emateempno.Text := FKeyEmpno.v_KeyEmpno;
          Lmatekorname.Caption := FKeyEmpno.v_KeyKorname;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TFM_Main.EmateempnoExit(Sender: TObject);
begin
     Lmatekorname.Caption := GetKorName(Emateempno.Text);
end;

procedure TFM_Main.EmateempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          TabbedNotebook1.PageIndex := 0;
          Ebpaycl.SetFocus;
     end;
end;

{직급코드Ckeck/조회}
procedure TFM_Main.SBbpayclClick(Sender: TObject);
begin
     p_GetCodeName('BAND코드조회', 'I112', EBpayCL, LBpayCL);
end;

procedure TFM_Main.EbpayclExit(Sender: TObject);
begin
     Lbpaycl.Caption := GetCodeName('I112', Ebpaycl.Text);
end;

procedure TFM_Main.EbpayclKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          TabbedNotebook1.PageIndex := 0;
          Epaynum.SetFocus;
     end;
end;

//달력[의료보험자격취득일]Ckeck/조회
procedure TFM_Main.SBmeddateClick(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
          calendar.ShowModal;
          MEmeddate.Text := calendar.DayCaption;
     Finally
          calendar.Free;
     end;
end;

procedure TFM_Main.MEmeddateChange(Sender: TObject);
begin
     if Length(MEmeddate.Text) = 8 then
     begin
          if fn_IsDate(MEmeddate.Text) = False then
          begin
               MessageBox(handle,'년월일을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               TabbedNotebook1.PageIndex := 0;
               MEmeddate.SetFocus;
               exit;
          end;
     end;
end;
procedure TFM_Main.MEmeddateKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          key := #0;
          if fn_IsDate(MEmeddate.Text) = False then
          begin
               MessageBox(handle,'년월일을 정확히 입력하세요...','날짜입력오류',MB_ICONWARNING);
               TabbedNotebook1.PageIndex := 0;
               MEmeddate.SetFocus;
               exit;
          end
          else
          begin
               TabbedNotebook1.PageIndex := 0;
               Emedsayu.SetFocus;
          end;
     end;
end;

//달력[고용보험자격취득일]Ckeck/조회
procedure TFM_Main.SBempldateClick(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
          calendar.ShowModal;
          if calendar.DayCaption = '' then exit;

          MEempldate.Text := calendar.DayCaption;
     Finally
          calendar.Free;
     end;
end;

procedure TFM_Main.MEempldateChange(Sender: TObject);
begin
     if Length(MEempldate.Text) = 8 then
     begin
          if fn_IsDate(MEempldate.Text) = False then
          begin
               MessageBox(handle,'년월일을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               TabbedNotebook1.PageIndex := 0;
               MEempldate.SetFocus;
               exit;
          end;
     end;
end;

procedure TFM_Main.MEempldateKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If fn_IsDate(MEempldate.Text) = False then
          begin
               MessageBox(handle,'년월일을 정확히 입력하세요...','날짜입력오류',MB_ICONWARNING);
               TabbedNotebook1.PageIndex := 0;
               MEempldate.SetFocus;
               exit;
          end
          else
          begin
               TabbedNotebook1.PageIndex := 0;
               Eemplsayu.SetFocus;
          end;
     end;
end;

// 입력
procedure TFM_Main.BBinsertClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     LIbutnChk := 1;
     LIretrieveChk := -1;

     DataAllClear;

     //2015.11.23 eyha 변경전 값 저장
     V_payyn           := '';
     V_bldcode         := '';
     V_nojoyn          := '';
     V_yearpaynum      := '';
     V_totpay          := '0';
     V_fixpay          := '0';
     V_paybank         := '';
     V_payacnt         := '';
     V_paybank1        := '';
     V_payacnt1        := '';


     Phelpmsg.Caption := ' 신규등록사원을 선택하세요.';
     Finsertemp := TFinsertemp.Create(Self);

     Try
          Finsertemp.ShowModal;
          if Finsertemp.GIcloseS = -1 then Exit;
     Finally
          Finsertemp.Free;
     end;

     Eempno.readonly := True;

     Phelpmsg.Caption := ' 신규등록사원의 기본인사자료가 조회되었습니다. 자료입력 후 저장하세요.';

     if Eempno.Text = '' then
     begin
          Phelpmsg.Caption := ' 자료가 없습니다.';
          Eempno.readonly := false;
     end
     else
     begin
       qq := TOraQuery.Create(Nil);
       qq.Session := Ora_Session;

       Try
            with qq do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select cpaynum   ');
                 SQL.Add('  from pkcpbas   ');
                 Open;
                 Epaynum.Text := FieldByName('cpaynum').AsString;
            end;
       Finally
            qq.Free;
       end;

     end;
end;

//조회
procedure TFM_Main.EempnoEnter(Sender: TObject);
begin
     LIbutnChk := 2;

     DataAllClear;

     Eempno.readonly := false;

     Phelpmsg.Caption := ' 사번을 선택 / 입력 후 Enter Key(조회)를 누르십시오.';

end;

//삭제
procedure TFM_Main.BBdeleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     If (LIretrieveChk = -1) or (LIbutnChk = 1) or (LIbutnChk = 2) then exit;

     image1.visible := True;

     If IDNO = Application.MessageBox('자료를 삭제하시겠습니까?', '작업안내', MB_YesNo) then Exit;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete from pkmpmas     ');
               SQL.Add(' where empno = :p_empno ');
               ParamByName('p_empno').AsString := Eempno.Text;
               ExecSql;
          end;

          //2015.11.23 eyha 작업이력 저장
          if not Save_History('파견직 급여마스터 관리','삭제',Pempno,W_worktype,Eempno.Text,'') then
          begin
            MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
            exit;
          end;
     Finally
          qq.Free;
     end;

     LIretrieveChk := -1;   //초기화
     LIbutnChk := 0;        //초기화
     LSempno := '';         //초기화

     DataAllClear;

     Eempno.ReadOnly := False;
     TabbedNotebook1.PageIndex := 0;
     Eempno.SetFocus;
     Phelpmsg.Caption := ' 자료 삭제가 완료 되었습니다.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
end;

//취소
procedure TFM_Main.BBcancelClick(Sender: TObject);
begin
     If Length(LSempno) <> 4 then Exit;

     If IDNO = Application.MessageBox('작업을 취소하시겠습니까?', '작업안내', MB_YesNo) then  Exit;

     DataAllClear;

     Eempno.Text := LSempno;

     Retrieve;

     LIbutnChk := 0;

     Phelpmsg.Caption := ' 작업이 취소되었습니다.';
end;

//저장
procedure TFM_Main.BBrunClick(Sender: TObject);
var
    sqltxt,sqltxtparam, W_MODFLAG :String;
    qq : TOraQuery;
begin
     If Eempno.readonly = false then exit;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               // 급호차수 Check
               Close;
               SQL.Clear;
               SQL.Add('select paynum              ');
               SQL.Add('  from pkcptbl             ');
               SQL.Add(' where paynum = :p_paynum  ');
               ParamByName('p_paynum').AsString := Epaynum.Text;
               Open;

               If RecordCount < 1 then
               begin
                  MessageBox(handle,'입력한 급여차수가 존재하지않습니다. 다시입력하세요!','입력오류',MB_ICONWARNING);
                  TabbedNotebook1.PageIndex := 0;
                  Epaynum.SetFocus;
                  Epaynum.Text := '';
                  Exit;
               end;

               //2015.11.23 eyha 작업이력 저장
               If LIretrieveChk = 0 then
                 W_MODFLAG := '수정'
               else
                 W_MODFLAG := '신규';

               if not Save_History('파견직 급여마스터 관리',W_MODFLAG,Pempno,W_worktype,Eempno.Text,'') then
               begin
                  MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
                  exit;
               end;

               //Update
               If LIretrieveChk = 0 then
               begin
                    If IDNO = Application.MessageBox('수정(조회)자료를 저장하시겠습니까?', '작업안내', MB_YesNo) then  Exit;

                    Close;
                    SQL.Clear;
                    SQL.ADD(' update pkmpmas                            ');
                    SQL.ADD('    set korname      = :p_korname,         ');
                    SQL.ADD('        sex          = :p_sex,             ');
                    SQL.ADD('        juminid      = :p_juminid,         ');
                    SQL.ADD('        zipno        = :p_zipno,           ');
                    SQL.ADD('        addr         = :p_addr,            ');
                    SQL.ADD('        payyn        = :p_payyn,           ');
                    SQL.ADD('        paybank      = :p_paybank,         ');
                    SQL.ADD('        payacnt      = :p_payacnt,         ');
                    SQL.ADD('        paybank1     = :p_paybank1,        ');
                    SQL.ADD('        payacnt1     = :p_payacnt1,        ');
                    SQL.ADD('        basicamt     = :p_basicamt,        ');
                    SQL.ADD('        dutyamt      = :p_dutyamt,         ');
                    SQL.ADD('        fixpay       = :p_fixpay,          ');
                    SQL.ADD('        quaterpay    = :p_quaterpay,       ');
                    SQL.ADD('        holipay      = :p_holipay,         ');
                    SQL.ADD('        roleamt      = :p_roleamt,         ');
                    SQL.ADD('        bldcode      = :p_bldcode,         ');
                    SQL.ADD('        nojoyn       = :p_nojoyn,          ');
                    SQL.ADD('        firstyn      = :p_firstyn,         ');
                    SQL.ADD('        mateempno    = :p_mateempno,       ');
                    SQL.ADD('        bpaycl       = :p_bpaycl,          ');
                    SQL.ADD('        paynum       = :p_paynum,          ');
                    SQL.ADD('        yearadddays  = :p_yearadddays,     ');
                    SQL.ADD('        matedcnt     = :p_matedcnt,        ');
                    SQL.ADD('        famidcnt     = :p_famidcnt,        ');
                    SQL.ADD('        obsdcnt      = :p_obsdcnt,         ');
                    SQL.ADD('        silverdcnt   = :p_silverdcnt,      ');
                    SQL.ADD('        womandcnt    = :p_womandcnt,       ');
                    SQL.ADD('        childdedcnt  = :p_childdedcnt,     ');
                    SQL.ADD('        famiamt      = :p_famiamt,         ');
                    SQL.ADD('        parentcnt    = :p_parentcnt,       ');
                    SQL.ADD('        partamt      = :p_partamt,         ');
                    SQL.ADD('        childcnt     = :p_childcnt,        ');
                    SQL.ADD('        childamt     = :p_childamt,        ');
                    SQL.ADD('        matecnt      = :p_matecnt,         ');
                    SQL.ADD('        mateamt      = :p_mateamt,         ');
                    SQL.ADD('        liceamt      = :p_liceamt,         ');
                    SQL.ADD('        licecnt      = :p_licecnt,         ');
                    SQL.ADD('        ovtmamt      = :p_ovtmamt,         ');
                    SQL.ADD('        sptmamt      = :p_sptmamt,         ');
                    SQL.ADD('        mcaramt      = :p_mcaramt,         ');
                    SQL.ADD('        mcartaxamt   = :p_mcartaxamt,      ');
                    SQL.ADD('        bokjisupamt  = :p_bokjisupamt,     ');
                    SQL.ADD('        yueduamt     = :p_yueduamt,        ');
                    SQL.ADD('        selfeduamt   = :p_selfeduamt,      ');
                    SQL.ADD('        medsupamt    = :p_medsupamt,       ');
                    SQL.ADD('        homesupamt   = :p_homesupamt,      ');
                    SQL.ADD('        longsupamt   = :p_longsupamt,      ');
                    SQL.ADD('        drvliceamt   = :p_drvliceamt,      ');
                    SQL.ADD('        odamt        = :p_odamt,           ');
                    SQL.ADD('        odtaxamt     = :p_odtaxamt,        ');
                    SQL.ADD('        bonusamt     = :p_bonusamt,        ');
                    SQL.ADD('        incentamt    = :p_incentamt,       ');
                    SQL.ADD('        trainamt     = :p_trainamt,        ');
                    SQL.ADD('        winteramt    = :p_winteramt,       ');
                    SQL.ADD('        sbonamt      = :p_sbonamt,         ');
                    SQL.ADD('        sbontaxamt   = :p_sbontaxamt,      ');
                    SQL.ADD('        mbonamt      = :p_mbonamt,         ');
                    SQL.ADD('        ybonamt      = :p_ybonamt,         ');
                    SQL.ADD('        aidamt3      = :p_aidamt3,         ');
                    SQL.ADD('        medno        = :p_medno,           ');
                    SQL.ADD('        medamt       = :p_medamt,          ');
                    SQL.ADD('        meddamt      = :p_meddamt,         ');
                    SQL.ADD('        medgr        = :p_medgr,           ');
                    SQL.ADD('        meddate      = :p_meddate,         ');
                    SQL.ADD('        medsayu      = :p_medsayu,         ');
                    SQL.ADD('        empldate     = :p_empldate,        ');
                    SQL.ADD('        emplsayu     = :p_emplsayu,        ');
                    SQL.ADD('        anugr        = :p_anugr,           ');
                    SQL.ADD('        anuselfamt   = :p_anuselfamt,      ');
                    SQL.ADD('        anudamt      = :p_anudamt,         ');
                    SQL.ADD('        anusayu      = :p_anusayu,         ');
                    SQL.ADD('        sauamt       = :p_sauamt,          ');
                    SQL.ADD('        nojoamt      = :p_nojoamt,         ');
                    SQL.ADD('        saveamt3     = :p_saveamt3,        ');
                    SQL.ADD('        igamt        = :p_igamt,           ');
                    SQL.ADD('        edudedamt    = :p_edudedamt,       ');
                    SQL.ADD('        sobiamt      = :p_sobiamt,         ');
                    SQL.ADD('        parkamt      = :p_parkamt,         ');
                    SQL.ADD('        chollamt     = :p_chollamt,        ');
                    SQL.ADD('        sangamt      = :p_sangamt,         ');
                    SQL.ADD('        meddedamt    = :p_meddedamt,       ');
                    SQL.ADD('        hsamt        = :p_hsamt,           ');
                    SQL.ADD('        hsorgamt     = :p_hsorgamt,        ');
                    SQL.ADD('        hsintamt     = :p_hsintamt,        ');
                    SQL.ADD('        fbamt        = :p_fbamt,           ');
                    SQL.ADD('        sacorpcp     = :p_sacorpcp,        '); //2011.09.20 kth 우리사주회사원금 추가
                    SQL.ADD('        sacorpamt    = :p_sacorpamt,       ');
                    SQL.ADD('        sabankcp     = :p_sabankcp,        '); //2011.09.20 kth 우리사주원금 추가
                    SQL.ADD('        sabankamt    = :p_sabankamt,       ');
                    SQL.ADD('        nbamt        = :p_nbamt,           ');
                    SQL.ADD('        ticketamt    = :p_ticketamt,       ');
                    SQL.ADD('        bondedamt    = :p_bondedamt,       ');
                    SQL.ADD('        saveamt1     = :p_saveamt1,        ');
                    SQL.ADD('        saveamt2     = :p_saveamt2,        ');
                    SQL.ADD('        dedamt1      = :p_dedamt1,         ');
                    SQL.ADD('        dedamt2      = :p_dedamt2,         ');
                    SQL.ADD('        dedamt3      = :p_dedamt3,         ');
                    SQL.ADD('        dedamt4      = :p_dedamt4,         ');
                    SQL.ADD('        dedamt5      = :p_dedamt5,         ');
                    SQL.ADD('        loanamt1     = :p_loanamt1,        ');
                    SQL.ADD('        loanamt2     = :p_loanamt2,        ');
                    SQL.ADD('        loanamt3     = :p_loanamt3,        ');
                    SQL.ADD('        payholdamt   = :p_payholdamt,      ');
                    SQL.Add('        soguppay     = :p_soguppay,        ');
                    SQL.Add('        soguppay1    = :p_soguppay1,       ');
                    SQL.Add('        soguppay2    = :p_soguppay2,       ');
                    SQL.Add('        soguppay3    = :p_soguppay3,       ');
                    SQL.Add('        soguppay4    = :p_soguppay4,       ');
                    SQL.Add('        soguppay5    = :p_soguppay5,       ');
                    SQL.Add('        soguppay6    = :p_soguppay6,       ');
                    SQL.Add('        aidamt1      = :p_aidamt1,         ');
                    SQL.Add('        aidamt11     = :p_aidamt11,        ');
                    SQL.Add('        aidamt12     = :p_aidamt12,        ');
                    SQL.Add('        aidamt13     = :p_aidamt13,        ');
                    SQL.Add('        aidamt14     = :p_aidamt14,        ');
                    SQL.Add('        aidamt2      = :p_aidamt2,         ');
                    SQL.Add('        aidamt21     = :p_aidamt21,        ');
                    SQL.Add('        aidamt22     = :p_aidamt22,        ');
                    SQL.Add('        aidamt23     = :p_aidamt23,        ');
                    SQL.Add('        aidamt24     = :p_aidamt24,        ');
                    SQL.Add('        taxpay       = :p_taxpay,          ');
                    SQL.Add('        taxpay1      = :p_taxpay1,         ');
                    SQL.Add('        taxpay2      = :p_taxpay2,         ');
                    SQL.Add('        taxpay3      = :p_taxpay3,         ');
                    SQL.Add('        taxpay4      = :p_taxpay4,         ');
                    SQL.Add('        notaxpay     = :p_notaxpay,        ');
                    SQL.Add('        notaxpay1    = :p_notaxpay1,       ');
                    SQL.Add('        notaxpay2    = :p_notaxpay2,       ');
                    SQL.Add('        notaxpay3    = :p_notaxpay3,       ');
                    SQL.Add('        notaxpay4    = :p_notaxpay4,       ');
                    SQL.Add('        lectsupamt   = :p_lectsupamt,      ');
                    SQL.Add('        lectsupamt1  = :p_lectsupamt1,     ');
                    SQL.Add('        lectsupamt2  = :p_lectsupamt2,     ');
                    SQL.Add('        lectsupamt3  = :p_lectsupamt3,     ');
                    SQL.Add('        lectsupamt4  = :p_lectsupamt4,     ');
                    SQL.Add('        edusupamt    = :p_edusupamt,       ');
                    SQL.Add('        edusupamt1   = :p_edusupamt1,      ');
                    SQL.Add('        edusupamt2   = :p_edusupamt2,      ');
                    SQL.ADD('        childeduamt  = :p_childeduamt,     ');
                    SQL.ADD('        ovmcamt      = :p_ovmcamt,         ');
                    SQL.ADD('        trainsupamt  = :p_trainsupamt,     ');
                    SQL.ADD('        ovmcded      = :p_ovmcded,         ');
                    SQL.ADD('        itamt        = :p_itamt,           ');
                    //2013.04.04.hjku. 문경란씨 요청으로 고용보험 추가
                    SQL.ADD('        empldamt     = :p_empldamt,        ');

                    //2015.09.21 eyha sap 인터페이스 될때 무조건 계좌변경일자를 갱신하여 인터페이스 되도록 수정  --자체
                    //bankchtime,bankchman
                    SQL.ADD('        bankchtime    = :p_writetime,       ');
                    SQL.ADD('        bankchman     = :p_writeman,        ');

                    SQL.ADD('        writetime    = :p_writetime,       ');
                    SQL.ADD('        writeman     = :p_writeman         ');
                    SQL.ADD('  where empno = :p_empno                   ');



                    ParamByName('p_korname').AsString  := P_korname.caption;
                    ParamByName('p_sex').AsString      := CBSex.Text;
                    ParamByName('p_juminid').AsString  := Ejuminid.Text;
                    ParamByName('p_zipno').AsString  := Ezipno.Text;
                    ParamByName('p_addr').AsString  := Eaddr.Text;
                    ParamByName('p_payyn').AsString  := CBpayyn.Text;
                    ParamByName('p_paybank').AsString  := Epaybank.Text;
                    ParamByName('p_payacnt').AsString  := Epayacnt.Text;
                    ParamByName('p_paybank1').AsString  := Epaybank1.Text;
                    ParamByName('p_payacnt1').AsString  := Epayacnt1.Text;
                    ParamByName('p_basicamt').AsFloat   := NEbasicamt.Value;
                    ParamByName('p_dutyamt').AsFloat   := NEdutyamt.Value;
                    ParamByName('p_fixpay').AsFloat   := NEfixpay.Value;
                    ParamByName('p_quaterpay').AsFloat   := NEquaterpay.Value;
                    ParamByName('p_holipay').AsFloat   := NEholipay.Value;
                    ParamByName('p_roleamt').AsFloat   := NEroleamt.Value;
                    ParamByName('p_bldcode').AsString  := Ebldcode.Text;
                    ParamByName('p_nojoyn').AsString  := CBnojoyn.Text;
                    ParamByName('p_firstyn').AsString  := CBfirstyn.Text;
                    ParamByName('p_mateempno').AsString  := Emateempno.Text;
                    ParamByName('p_bpaycl').AsString  := Ebpaycl.Text;
                    ParamByName('p_paynum').AsString  := Epaynum.Text;
                    ParamByName('p_yearadddays').AsFloat   := NEyearadddays.Value;
                    ParamByName('p_matedcnt').AsFloat   := NEmatedcnt.Value;
                    ParamByName('p_famidcnt').AsFloat   := NEfamidcnt.Value;
                    ParamByName('p_obsdcnt').AsFloat   := NEobsdcnt.Value;
                    ParamByName('p_silverdcnt').AsFloat   := NEsilverdcnt.Value;
                    ParamByName('p_womandcnt').AsFloat   := NEwomandcnt.Value;
                    ParamByName('p_childdedcnt').AsFloat   := NEchilddedcnt.Value;
                    ParamByName('p_famiamt').AsFloat   := NEfamiamt.Value;
                    ParamByName('p_parentcnt').AsFloat   := NEparentcnt.Value;
                    ParamByName('p_partamt').AsFloat   := NEparentamt.Value;
                    ParamByName('p_childcnt').AsFloat   := NEchildcnt.Value;
                    ParamByName('p_childamt').AsFloat   := NEchildamt.Value;
                    ParamByName('p_matecnt').AsFloat   := NEmatecnt.Value;
                    ParamByName('p_mateamt').AsFloat   := NEmateamt.Value;
                    ParamByName('p_liceamt').AsFloat   := NEliceamt.Value;
                    ParamByName('p_licecnt').AsFloat   := NElicecnt.Value;
                    ParamByName('p_ovtmamt').AsFloat   := NEovtmamt.Value;
                    ParamByName('p_sptmamt').AsFloat   := NEsptmamt.Value;
                    ParamByName('p_mcaramt').AsFloat   := NEmcaramt.Value;
                    ParamByName('p_mcartaxamt').AsFloat   := NEmcartaxamt.Value;
                    ParamByName('p_bokjisupamt').AsFloat   := NEbokjisupamt.Value;
                    ParamByName('p_yueduamt').AsFloat   := NEyueduamt.Value;
                    ParamByName('p_selfeduamt').AsFloat   := NEselfeduamt.Value;
                    ParamByName('p_medsupamt').AsFloat   := NEmedsupamt.Value;
                    ParamByName('p_homesupamt').AsFloat   := NEhomesupamt.Value;
                    ParamByName('p_longsupamt').AsFloat   := NElongsupamt.Value;
                    ParamByName('p_drvliceamt').AsFloat   := NEdrvliceamt.Value;
                    ParamByName('p_odamt').AsFloat   := NEodamt.Value;
                    ParamByName('p_odtaxamt').AsFloat   := NEodtaxamt.Value;
                    ParamByName('p_bonusamt').AsFloat   := NEbonusamt.Value;
                    ParamByName('p_incentamt').AsFloat   := NEincentamt.Value;
                    ParamByName('p_trainamt').AsFloat   := NEtrainamt.Value;
                    ParamByName('p_winteramt').AsFloat   := NEwinteramt.Value;
                    ParamByName('p_sbonamt').AsFloat   := NEsbonamt.Value;
                    ParamByName('p_sbontaxamt').AsFloat   := NEsbontaxamt.Value;
                    ParamByName('p_mbonamt').AsFloat   := NEmbonamt.Value;
                    ParamByName('p_ybonamt').AsFloat   := NEybonamt.Value;
                    ParamByName('p_aidamt3').AsFloat   := NEaidamt3.Value;
                    ParamByName('p_medno').AsString  := Emedno.Text;
                    ParamByName('p_medamt').AsFloat   := NEmedamt.Value;
                    ParamByName('p_meddamt').AsFloat   := NEmeddamt.Value;
                    ParamByName('p_medgr').AsString  := Emedgr.Text;
                    ParamByName('p_meddate').AsString  := MEmeddate.Text;
                    ParamByName('p_medsayu').AsString  := Emedsayu.Text;
                    ParamByName('p_empldate').AsString  := MEempldate.Text;
                    ParamByName('p_emplsayu').AsString  := Eemplsayu.Text;
                    ParamByName('p_anugr').AsString  := Eanugr.Text;
                    ParamByName('p_anuselfamt').AsFloat   := NEanuselfamt.Value;
                    ParamByName('p_anudamt').AsFloat   := NEanudamt.Value;
                    ParamByName('p_anusayu').AsString  := Eanusayu.Text;
                    ParamByName('p_sauamt').AsFloat   := NEsauamt.Value;
                    ParamByName('p_nojoamt').AsFloat   := NEnojoamt.Value;
                    ParamByName('p_saveamt3').AsFloat   := NEsaveamt3.Value;
                    ParamByName('p_igamt').AsFloat   := NEigamt.Value;
                    ParamByName('p_edudedamt').AsFloat   := NEedudedamt.Value;
                    ParamByName('p_sobiamt').AsFloat   := NEsobiamt.Value;
                    ParamByName('p_parkamt').AsFloat   := NEparkamt.Value;
                    ParamByName('p_chollamt').AsFloat   := NEchollamt.Value;
                    ParamByName('p_sangamt').AsFloat   := NEsangamt.Value;
                    ParamByName('p_meddedamt').AsFloat   := NEmeddedamt.Value;
                    ParamByName('p_hsamt').AsFloat   := NEhsamt.Value;
                    ParamByName('p_hsorgamt').AsFloat   := NEhsorgamt.Value;
                    ParamByName('p_hsintamt').AsFloat   := NEhsintamt.Value;
                    ParamByName('p_fbamt').AsFloat   := NEfbamt.Value;
                    ParamByName('p_sacorpcp').AsFloat   := NEsacorpcp.Value;    //2011.09.20 kth 우리사주원금 추가
                    ParamByName('p_sacorpamt').AsFloat   := NEsacorpamt.Value;
                    ParamByName('p_sabankcp').AsFloat   := NEsabankcp.Value;    //2011.09.20 kth 우리사주원금 추가
                    ParamByName('p_sabankamt').AsFloat   := NEsabankamt.Value;
                    ParamByName('p_nbamt').AsFloat   := NEnbamt.Value;
                    ParamByName('p_ticketamt').AsFloat   := NEticketamt.Value;
                    ParamByName('p_bondedamt').AsFloat   := NEbondedamt.Value;
                    ParamByName('p_saveamt1').AsFloat   := NEsaveamt1.Value;
                    ParamByName('p_saveamt2').AsFloat   := NEsaveamt2.Value;
                    ParamByName('p_dedamt1').AsFloat   := NEdedamt1.Value;
                    ParamByName('p_dedamt2').AsFloat   := NEdedamt2.Value;
                    ParamByName('p_dedamt3').AsFloat   := NEdedamt3.Value;
                    ParamByName('p_dedamt4').AsFloat   := NEdedamt4.Value;
                    ParamByName('p_dedamt5').AsFloat   := NEdedamt5.Value;
                    ParamByName('p_loanamt1').AsFloat   := NEloanamt1.Value;
                    ParamByName('p_loanamt2').AsFloat   := NEloanamt2.Value;
                    ParamByName('p_loanamt3').AsFloat   := NEloanamt3.Value;
                    ParamByName('p_payholdamt').AsFloat   := NEpayholdamt.Value;
                    paramByName('p_soguppay').AsFloat   := NEsoguppay.value;
                    paramByName('p_soguppay1').AsFloat   := NEsoguppay1.value;
                    paramByName('p_soguppay2').AsFloat   := NEsoguppay2.value;
                    paramByName('p_soguppay3').AsFloat   := NEsoguppay3.value;
                    paramByName('p_soguppay4').AsFloat   := NEsoguppay4.value;
                    paramByName('p_soguppay5').AsFloat   := NEsoguppay5.value;
                    paramByName('p_soguppay6').AsFloat   := NEsoguppay6.value;
                    paramByName('p_aidamt1').AsFloat   := NEaidamt1.value;
                    paramByName('p_aidamt11').AsFloat   := NEaidamt11.value;
                    paramByName('p_aidamt12').AsFloat   := NEaidamt12.value;
                    paramByName('p_aidamt13').AsFloat   := NEaidamt13.value;
                    paramByName('p_aidamt14').AsFloat   := NEaidamt14.value;
                    paramByName('p_aidamt2').AsFloat   := NEaidamt2.value;
                    paramByName('p_aidamt21').AsFloat   := NEaidamt21.value;
                    paramByName('p_aidamt22').AsFloat   := NEaidamt22.value;
                    paramByName('p_aidamt23').AsFloat   := NEaidamt23.value;
                    paramByName('p_aidamt24').AsFloat   := NEaidamt24.value;
                    paramByName('p_taxpay').AsFloat   := NEtaxpay.value;
                    paramByName('p_taxpay1').AsFloat   := NEtaxpay1.value;
                    paramByName('p_taxpay2').AsFloat   := NEtaxpay2.value;
                    paramByName('p_taxpay3').AsFloat   := NEtaxpay3.value;
                    paramByName('p_taxpay4').AsFloat   := NEtaxpay4.value;
                    paramByName('p_notaxpay').AsFloat   := NEnotaxpay.value;
                    paramByName('p_notaxpay1').AsFloat   := NEnotaxpay1.value;
                    paramByName('p_notaxpay2').AsFloat   := NEnotaxpay2.value;
                    paramByName('p_notaxpay3').AsFloat   := NEnotaxpay3.value;
                    paramByName('p_notaxpay4').AsFloat   := NEnotaxpay4.value;
                    paramByName('p_lectsupamt').AsFloat   := NElectsupamt.value;
                    paramByName('p_lectsupamt1').AsFloat   := NElectsupamt1.value;
                    paramByName('p_lectsupamt2').AsFloat   := NElectsupamt2.value;
                    paramByName('p_lectsupamt3').AsFloat   := NElectsupamt3.value;
                    paramByName('p_lectsupamt4').AsFloat   := NElectsupamt4.value;
                    paramByName('p_edusupamt').AsFloat   := NEedusupamt.value;
                    paramByName('p_edusupamt1').AsFloat   := NEedusupamt1.value;
                    paramByName('p_edusupamt2').AsFloat   := NEedusupamt2.value;
                    ParamByName('p_childeduamt').AsFloat   := NEchildeduamt.Value;
                    ParamByname('p_ovmcamt').AsFloat   := NEovmcamt.Value;
                    ParamByName('p_trainsupamt').AsFloat   := NETrainSupAmt.Value;
                    ParamByName('p_ovmcded').AsFloat   := NEOvmcded.Value;
                    ParamByName('p_itamt').AsFloat   := NEITAMT.Value;
                    ParamByName('p_empldamt').AsFloat   := NEempldamt.Value;
                    ParamByName('p_writetime').AsString  := Lsysdate.Caption;
                    ParamByName('p_writeman').AsString  := Pempno;
                    ParamByname('p_empno').AsString  := Eempno.Text;

                    ExecSql;

                    Phelpmsg.Caption := ' 자료 수정이 완료 되었습니다....';

                    Retrieve;   //2015.11.24 eyha 저장하게 재갱신되도록 수정
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

               end;

               //Insert
               If (LIretrieveChk = -1) and (LIbutnChk = 1) then
               begin
                    If IDNO = Application.MessageBox('신규자료를 저장(등록)하시겠습니까?','작업안내',MB_YesNo) then  Exit;

                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkmpmas (empno,                        ');
                    SQL.Add('                     korname,                      ');
                    SQL.Add('                     sex,                          ');
                    SQL.Add('                     juminid,                      ');
                    SQL.Add('                     zipno,                        ');
                    SQL.Add('                     addr,                         ');
                    SQL.Add('                     offitel,                      ');
                    SQL.Add('                     paycl,                        ');
                    SQL.Add('                     payra,                        ');
                    SQL.Add('                     pstate,                       ');
                    SQL.Add('                     orgnum,                       ');
                    SQL.Add('                     deptcode,                     ');
                    SQL.Add('                     empdate,                      ');
                    SQL.Add('                     paycldate,                    ');
                    SQL.Add('                     retdate,                      ');
                    SQL.Add('                     payyn,                        ');
                    SQL.Add('                     paybank,                      ');
                    SQL.Add('                     payacnt,                      ');                                                                                                          
                    SQL.Add('                     paybank1,                     ');                                                                                                          
                    SQL.Add('                     payacnt1,                     ');                                                                                                          
                    SQL.Add('                     basicamt,                     ');                                                                                                          
                    SQL.Add('                     promamt,                      ');
                    SQL.Add('                     fixpay,                       ');                                                                                                          
                    SQL.Add('                     quaterpay,                    ');                                                                                                          
                    SQL.Add('                     holipay,                      ');                                                                                                          
                    SQL.Add('                     roleamt,                      ');                                                                                                                                            
                    SQL.Add('                     bldcode,                      ');                                                                                                          
                    SQL.Add('                     nojoyn,                       ');                                                                                                          
                    SQL.Add('                     firstyn,                      ');                                                                                                          
                    SQL.Add('                     mateempno,                    ');                                                                                                          
                    SQL.Add('                     bpaycl,                       ');                                                                                                                                      
                    SQL.Add('                     yearadddays,                  ');                                                                                                                                                                      
                    SQL.Add('                     paynum,                       ');                                                                                                                                                                       
                    SQL.Add('                     matedcnt,                     ');                                                                                                          
                    SQL.Add('                     famidcnt,                     ');
                    SQL.Add('                     obsdcnt,                      ');
                    SQL.Add('                     silverdcnt,                   ');                                                                                                          
                    SQL.Add('                     womandcnt,                    ');                                                                                                                                  
                    SQL.Add('                     famiamt,                      ');                                                                                                          
                    SQL.Add('                     parentcnt,                    ');                                                                                                          
                    SQL.Add('                     partamt,                      ');                                                                                                          
                    SQL.Add('                     childcnt,                     ');                                                                                                          
                    SQL.Add('                     childamt,                     ');                                                                                                          
                    SQL.Add('                     matecnt,                      ');
                    SQL.Add('                     mateamt,                      ');                                                                                                          
                    SQL.Add('                     liceamt,                      ');                                                                                                          
                    SQL.Add('                     licecnt,                      ');                                                                                                          
                    SQL.Add('                     ovtmamt,                      ');                                                                                                          
                    SQL.Add('                     sptmamt,                      ');                                                                                                          
                    SQL.Add('                     mcaramt,                      ');                                                                                                          
                    SQL.Add('                     mcartaxamt,                   ');                                                                                                          
                    SQL.Add('                     bokjisupamt,                  ');                                                                                                                                    
                    SQL.Add('                     yueduamt,                     ');                                                                                                          
                    SQL.Add('                     selfeduamt,                   ');                                                                                                          
                    SQL.Add('                     medsupamt,                    ');                                                                                                          
                    SQL.Add('                     homesupamt,                   ');                                                                                                          
                    SQL.Add('                     longsupamt,                   ');                                                                                                          
                    SQL.Add('                     drvliceamt,                   ');
                    SQL.Add('                     odamt,                        ');                                                                                                          
                    SQL.Add('                     odtaxamt,                     ');                                                                                                          
                    SQL.Add('                     bonusamt,                     ');                                                                                                          
                    SQL.Add('                     incentamt,                    ');                                                                                                          
                    SQL.Add('                     trainamt,                     ');
                    SQL.Add('                     winteramt,                    ');                                                                                                          
                    SQL.Add('                     sbonamt,                      ');                                                                                                          
                    SQL.Add('                     sbontaxamt,                   ');                                                                                                                         
                    SQL.Add('                     mbonamt,                      ');                                                                                                          
                    SQL.Add('                     ybonamt,                      ');
                    SQL.Add('                     aidamt3,                      ');                                                                                                                                                       
                    SQL.Add('                     medno,                        ');                                                                                                          
                    SQL.Add('                     medamt,                       ');                                                                                                          
                    SQL.Add('                     meddamt,                      ');                                                                                                          
                    SQL.Add('                     medgr,                        ');                                                                                                          
                    SQL.Add('                     meddate,                      ');                                                                                                          
                    SQL.Add('                     medsayu,                      ');                                                                                                                                    
                    SQL.Add('                     empldate,                     ');                                                                                                          
                    SQL.Add('                     emplsayu,                     ');                                                                                                          
                    SQL.Add('                     anugr,                        ');                                                                                                          
                    SQL.Add('                     anuselfamt,                   ');                                                                                                                                               
                    SQL.Add('                     anudamt,                      ');                                                                                                                                                                       
                    SQL.Add('                     anusayu,                      ');
                    SQL.Add('                     sauamt,                       ');
                    SQL.Add('                     nojoamt,                      ');                                                                                                          
                    SQL.Add('                     saveamt3,                     ');
                    SQL.Add('                     igamt,                        ');                                                                                                          
                    SQL.Add('                     edudedamt,                    ');                                                                                                          
                    SQL.Add('                     sobiamt,                      ');
                    SQL.Add('                     parkamt,                      ');                                                                                                               
                    SQL.Add('                     chollamt,                     ');                                                                                                          
                    SQL.Add('                     sangamt,                      ');                                                                                                          
                    SQL.Add('                     meddedamt,                    ');                                                                                                          
                    SQL.Add('                     hsamt,                        ');                                                                                                          
                    SQL.Add('                     hsorgamt,                     ');                                                                                                          
                    SQL.Add('                     hsintamt,                     ');
                    SQL.Add('                     fbamt,                        ');
                    SQL.Add('                     sacorpcp,                     ');     //2011.09.20 kth 우리사주회사원금 추가
                    SQL.Add('                     sacorpamt,                    ');
                    SQL.Add('                     sabankcp,                     ');     //2011.09.20 kth 우리사주회사원금 추가
                    SQL.Add('                     sabankamt,                    ');
                    SQL.Add('                     nbamt,                        ');                                                                                                          
                    SQL.Add('                     ticketamt,                    ');                                                                                                          
                    SQL.Add('                     bondedamt,                    ');                                                                                                          
                    SQL.Add('                     saveamt1,                     ');                                                                                                          
                    SQL.Add('                     saveamt2,                     ');                                                                                                          
                    SQL.Add('                     dedamt1,                      ');                                                                                                          
                    SQL.Add('                     dedamt2,                      ');
                    SQL.Add('                     dedamt3,                      ');                                                                                                          
                    SQL.Add('                     dedamt4,                      ');                                                                                                          
                    SQL.Add('                     dedamt5,                      ');
                    SQL.Add('                     loanamt1,                     ');                                                                                                          
                    SQL.Add('                     loanamt2,                     ');                                                                                                          
                    SQL.Add('                     loanamt3,                     ');                                                                                                          
                    SQL.Add('                     payholdamt,                   ');                                                                                                          
                    SQL.Add('                     soguppay,                     ');
                    SQL.Add('                     soguppay1,                    ');                                                                                                          
                    SQL.Add('                     soguppay2,                    ');                                                                                                          
                    SQL.Add('                     soguppay3,                    ');                                                                                                          
                    SQL.Add('                     soguppay4,                    ');                                                                                                          
                    SQL.Add('                     soguppay5,                    ');                                                                                                          
                    SQL.Add('                     soguppay6,                    ');                                                                                                          
                    SQL.Add('                     aidamt1,                      ');                                                                                                          
                    SQL.Add('                     aidamt11,                     ');                                                                                                          
                    SQL.Add('                     aidamt12,                     ');
                    SQL.Add('                     aidamt13,                     ');                                                                                                          
                    SQL.Add('                     aidamt14,                     ');                                                                                                          
                    SQL.Add('                     aidamt2,                      ');                                                                                                          
                    SQL.Add('                     aidamt21,                     ');                                                                                                          
                    SQL.Add('                     aidamt22,                     ');                                                                                                          
                    SQL.Add('                     aidamt23,                     ');
                    SQL.Add('                     aidamt24,                     ');
                    SQL.Add('                     taxpay,                       ');                                                                                                          
                    SQL.Add('                     taxpay1,                      ');                                                                                                          
                    SQL.Add('                     taxpay2,                      ');                                                                                                          
                    SQL.Add('                     taxpay3,                      ');                                                                                                          
                    SQL.Add('                     taxpay4,                      ');                                                                                                          
                    SQL.Add('                     notaxpay,                     ');                                                                                                          
                    SQL.Add('                     notaxpay1,                    ');                                                                                                          
                    SQL.Add('                     notaxpay2,                    ');                                                                                                          
                    SQL.Add('                     notaxpay3,                    ');                                                                                                          
                    SQL.Add('                     notaxpay4,                    ');                                                                                                          
                    SQL.Add('                     lectsupamt,                   ');                                                                                                          
                    SQL.Add('                     lectsupamt1,                  ');                                                                                                          
                    SQL.Add('                     lectsupamt2,                  ');                                                                                                          
                    SQL.Add('                     lectsupamt3,                  ');                                                                                                          
                    SQL.Add('                     lectsupamt4,                  ');                                                                                                          
                    SQL.Add('                     edusupamt,                    ');                                                                                                          
                    SQL.Add('                     edusupamt1,                   ');                                                                                                          
                    SQL.Add('                     edusupamt2,                   ');                                                                                                          
                    SQL.Add('                     childeduamt,                  ');                                                                                                          
                    SQL.Add('                     ovmcamt,                      ');                                                                                                          
                    SQL.Add('                     trainsupamt,                  ');                                                                                                          
                    SQL.Add('                     ovmcded,                      ');
                    SQL.Add('                     itamt,                        ');
                    //2013.04.04.hjku. 문경란씨 요청으로 고용보험 추가
                    SQL.Add('                     empldamt,                     ');
                    SQL.Add('                     writetime,                    ');                                                                                                          
                    SQL.Add('                     writeman)                     ');    
                    SQL.Add('             values (:p_empno,                     ');
                    SQL.Add('                     :p_korname,                   ');
                    SQL.Add('                     :p_sex,                       ');
                    SQL.Add('                     :p_juminid,                   ');
                    SQL.Add('                     :p_zipno,                     ');
                    SQL.Add('                     :p_addr,                      ');
                    SQL.Add('                     :p_offitel,                   ');
                    SQL.Add('                     :p_paycl,                     ');
                    SQL.Add('                     :p_payra,                     ');
                    SQL.Add('                     :p_pstate,                    ');
                    SQL.Add('                     :p_orgnum,                    ');
                    SQL.Add('                     :p_deptcode,                  ');
                    SQL.Add('                     :p_empdate,                   ');
                    SQL.Add('                     :p_paycldate,                 ');
                    SQL.Add('                     :p_retdate,                   ');
                    SQL.Add('                     :p_payyn,                     ');
                    SQL.Add('                     :p_paybank,                   ');
                    SQL.Add('                     :p_payacnt,                   ');
                    SQL.Add('                     :p_paybank1,                  ');
                    SQL.Add('                     :p_payacnt1,                  ');
                    SQL.Add('                     :p_basicamt,                  ');
                    SQL.Add('                     :p_promamt,                   ');
                    SQL.Add('                     :p_fixpay,                    ');
                    SQL.Add('                     :p_quaterpay,                 ');
                    SQL.Add('                     :p_holipay,                   ');
                    SQL.Add('                     :p_roleamt,                   ');
                    SQL.Add('                     :p_bldcode,                   ');
                    SQL.Add('                     :p_nojoyn,                    ');
                    SQL.Add('                     :p_firstyn,                   ');
                    SQL.Add('                     :p_mateempno,                 ');
                    SQL.Add('                     :p_bpaycl,                    ');
                    SQL.Add('                     :p_yearadddays,               ');
                    SQL.Add('                     :p_paynum,                    ');
                    SQL.Add('                     :p_matedcnt,                  ');
                    SQL.Add('                     :p_famidcnt,                  ');
                    SQL.Add('                     :p_obsdcnt,                   ');
                    SQL.Add('                     :p_silverdcnt,                ');
                    SQL.Add('                     :p_womandcnt,                 ');
                    SQL.Add('                     :p_famiamt,                   ');
                    SQL.Add('                     :p_parentcnt,                 ');
                    SQL.Add('                     :p_partamt,                   ');
                    SQL.Add('                     :p_childcnt,                  ');
                    SQL.Add('                     :p_childamt,                  ');
                    SQL.Add('                     :p_matecnt,                   ');
                    SQL.Add('                     :p_mateamt,                   ');
                    SQL.Add('                     :p_liceamt,                   ');
                    SQL.Add('                     :p_licecnt,                   ');
                    SQL.Add('                     :p_ovtmamt,                   ');
                    SQL.Add('                     :p_sptmamt,                   ');
                    SQL.Add('                     :p_mcaramt,                   ');
                    SQL.Add('                     :p_mcartaxamt,                ');
                    SQL.Add('                     :p_bokjisupamt,               ');
                    SQL.Add('                     :p_yueduamt,                  ');
                    SQL.Add('                     :p_selfeduamt,                ');
                    SQL.Add('                     :p_medsupamt,                 ');
                    SQL.Add('                     :p_homesupamt,                ');
                    SQL.Add('                     :p_longsupamt,                ');
                    SQL.Add('                     :p_drvliceamt,                ');
                    SQL.Add('                     :p_odamt,                     ');
                    SQL.Add('                     :p_odtaxamt,                  ');
                    SQL.Add('                     :p_bonusamt,                  ');
                    SQL.Add('                     :p_incentamt,                 ');
                    SQL.Add('                     :p_trainamt,                  ');
                    SQL.Add('                     :p_winteramt,                 ');
                    SQL.Add('                     :p_sbonamt,                   ');
                    SQL.Add('                     :p_sbontaxamt,                ');
                    SQL.Add('                     :p_mbonamt,                   ');
                    SQL.Add('                     :p_ybonamt,                   ');
                    SQL.Add('                     :p_aidamt3,                   ');
                    SQL.Add('                     :p_medno,                     ');
                    SQL.Add('                     :p_medamt,                    ');
                    SQL.Add('                     :p_meddamt,                   ');
                    SQL.Add('                     :p_medgr,                     ');
                    SQL.Add('                     :p_meddate,                   ');
                    SQL.Add('                     :p_medsayu,                   ');
                    SQL.Add('                     :p_empldate,                  ');
                    SQL.Add('                     :p_emplsayu,                  ');
                    SQL.Add('                     :p_anugr,                     ');
                    SQL.Add('                     :p_anuselfamt,                ');
                    SQL.Add('                     :p_anudamt,                   ');
                    SQL.Add('                     :p_anusayu,                   ');
                    SQL.Add('                     :p_sauamt,                    ');                                 
                    SQL.Add('                     :p_nojoamt,                   ');
                    SQL.Add('                     :p_saveamt3,                  ');
                    SQL.Add('                     :p_igamt,                     ');
                    SQL.Add('                     :p_edudedamt,                 ');
                    SQL.Add('                     :p_sobiamt,                   ');
                    SQL.Add('                     :p_parkamt,                   ');
                    SQL.Add('                     :p_chollamt,                  ');
                    SQL.Add('                     :p_sangamt,                   ');
                    SQL.Add('                     :p_meddedamt,                 ');
                    SQL.Add('                     :p_hsamt,                     ');
                    SQL.Add('                     :p_hsorgamt,                  ');
                    SQL.Add('                     :p_hsintamt,                  ');
                    SQL.Add('                     :p_fbamt,                     ');
                    SQL.Add('                     :p_sacorpcp,                 ');
                    SQL.Add('                     :p_sacorpamt,                 ');
                    SQL.Add('                     :p_sabankcp,                 ');
                    SQL.Add('                     :p_sabankamt,                 ');
                    SQL.Add('                     :p_nbamt,                     ');
                    SQL.Add('                     :p_ticketamt,                 ');
                    SQL.Add('                     :p_bondedamt,                 ');
                    SQL.Add('                     :p_saveamt1,                  ');
                    SQL.Add('                     :p_saveamt2,                  ');
                    SQL.Add('                     :p_dedamt1,                   ');
                    SQL.Add('                     :p_dedamt2,                   ');
                    SQL.Add('                     :p_dedamt3,                   ');
                    SQL.Add('                     :p_dedamt4,                   ');
                    SQL.Add('                     :p_dedamt5,                   ');
                    SQL.Add('                     :p_loanamt1,                  ');
                    SQL.Add('                     :p_loanamt2,                  ');
                    SQL.Add('                     :p_loanamt3,                  ');
                    SQL.Add('                     :p_payholdamt,                ');
                    SQL.Add('                     :p_soguppay,                  ');
                    SQL.Add('                     :p_soguppay1,                 ');
                    SQL.Add('                     :p_soguppay2,                 ');
                    SQL.Add('                     :p_soguppay3,                 ');
                    SQL.Add('                     :p_soguppay4,                 ');
                    SQL.Add('                     :p_soguppay5,                 ');
                    SQL.Add('                     :p_soguppay6,                 ');
                    SQL.Add('                     :p_aidamt1,                   ');
                    SQL.Add('                     :p_aidamt11,                  ');
                    SQL.Add('                     :p_aidamt12,                  ');
                    SQL.Add('                     :p_aidamt13,                  ');
                    SQL.Add('                     :p_aidamt14,                  ');
                    SQL.Add('                     :p_aidamt2,                   ');
                    SQL.Add('                     :p_aidamt21,                  ');
                    SQL.Add('                     :p_aidamt22,                  ');
                    SQL.Add('                     :p_aidamt23,                  ');
                    SQL.Add('                     :p_aidamt24,                  ');
                    SQL.Add('                     :p_taxpay,                    ');
                    SQL.Add('                     :p_taxpay1,                   ');
                    SQL.Add('                     :p_taxpay2,                   ');
                    SQL.Add('                     :p_taxpay3,                   ');
                    SQL.Add('                     :p_taxpay4,                   ');
                    SQL.Add('                     :p_notaxpay,                  ');
                    SQL.Add('                     :p_notaxpay1,                 ');
                    SQL.Add('                     :p_notaxpay2,                 ');
                    SQL.Add('                     :p_notaxpay3,                 ');
                    SQL.Add('                     :p_notaxpay4,                 ');
                    SQL.Add('                     :p_lectsupamt,                ');
                    SQL.Add('                     :p_lectsupamt1,               ');
                    SQL.Add('                     :p_lectsupamt2,               ');
                    SQL.Add('                     :p_lectsupamt3,               ');
                    SQL.Add('                     :p_lectsupamt4,               ');
                    SQL.Add('                     :p_edusupamt,                 ');
                    SQL.Add('                     :p_edusupamt1,                ');
                    SQL.Add('                     :p_edusupamt2,                ');
                    SQL.Add('                     :p_childeduamt,               ');
                    SQL.Add('                     :p_ovmcamt,                   ');
                    SQL.Add('                     :p_trainsupamt,               ');
                    SQL.Add('                     :p_ovmcded,                   ');
                    SQL.Add('                     :p_itamt,                     ');
                    SQL.Add('                     :p_empldamt,                  ');
                    SQL.Add('                     :p_writetime,                 ');
                    SQL.Add('                     :p_writeman)                  ');
                    ParamByName('p_empno').AsString :=  Eempno.Text;;
                    ParamByName('p_korname').AsString :=  P_korname.Caption;;
                    ParamByName('p_sex').AsString :=  CBsex.Text;;
                    ParamByName('p_juminid').AsString :=  Ejuminid.Text;;
                    ParamByName('p_zipno').AsString :=  Ezipno.Text;;
                    ParamByName('p_addr').AsString :=  Eaddr.Text;;
                    ParamByName('p_offitel').AsString :=  Loffitel.Caption;;
                    ParamByName('p_paycl').AsString :=  GSpaycl;
                    ParamByName('p_payra').AsString :=  GSpayra;
                    ParamByName('p_pstate').AsString :=  GSpstate;
                    ParamByName('p_orgnum').AsString :=  Lorgnum.Caption;;
                    ParamByName('p_deptcode').AsString :=  Ldeptcode.Caption;;
                    ParamByName('p_empdate').AsString :=  RemoveChar(Lempdate.Caption, '/');
                    ParamByName('p_paycldate').AsString :=  RemoveChar(Lpaycldate.Caption, '/');
                    ParamByName('p_retdate').AsString :=  RemoveChar(Lretdate.Caption, '/');
                    ParamByName('p_payyn').AsString :=  CBpayyn.Text;;
                    ParamByName('p_paybank').AsString :=  Epaybank.Text;;
                    ParamByName('p_payacnt').AsString :=  Epayacnt.Text;
                    ParamByName('p_paybank1').AsString :=  Epaybank1.Text;
                    ParamByName('p_payacnt1').AsString :=  Epayacnt1.Text;
                    ParamByName('p_basicamt').AsFloat  :=  NEbasicamt.Value;
                    ParamByName('p_promamt').AsFloat  :=  NEdutyamt.Value;
                    ParamByName('p_fixpay').AsFloat  :=  NEfixpay.Value;
                    ParamByName('p_quaterpay').AsFloat  :=  NEquaterpay.Value;
                    ParamByName('p_holipay').AsFloat  :=  NEholipay.Value;
                    ParamByName('p_roleamt').AsFloat  :=  NEroleamt.Value;
                    ParamByName('p_bldcode').AsString :=  Ebldcode.Text;
                    ParamByName('p_nojoyn').AsString :=  CBnojoyn.Text;
                    ParamByName('p_firstyn').AsString :=  CBfirstyn.Text;
                    ParamByName('p_mateempno').AsString :=  Emateempno.Text;
                    ParamByName('p_bpaycl').AsString :=  Ebpaycl.Text;
                    ParamByName('p_yearadddays').AsFloat  :=  NEyearadddays.Value;
                    ParamByName('p_paynum').AsString :=  Epaynum.Text;
                    ParamByName('p_matedcnt').AsFloat  :=  NEmatedcnt.Value;
                    ParamByName('p_famidcnt').AsFloat  :=  NEfamidcnt.Value;
                    ParamByName('p_obsdcnt').AsFloat  :=  NEobsdcnt.Value;
                    ParamByName('p_silverdcnt').AsFloat  :=  NEsilverdcnt.Value;
                    ParamByName('p_womandcnt').AsFloat  :=  NEwomandcnt.Value;
                    ParamByName('p_famiamt').AsFloat  :=  NEfamiamt.Value;
                    ParamByName('p_parentcnt').AsFloat  :=  NEparentcnt.Value;
                    ParamByName('p_partamt').AsFloat  :=  NEparentamt.Value;
                    ParamByName('p_childcnt').AsFloat  :=  NEchildcnt.Value;
                    ParamByName('p_childamt').AsFloat  :=  NEchildamt.Value;
                    ParamByName('p_matecnt').AsFloat  :=  NEmatecnt.Value;
                    ParamByName('p_mateamt').AsFloat  :=  NEmateamt.Value;
                    ParamByName('p_liceamt').AsFloat  :=  NEliceamt.Value;
                    ParamByName('p_licecnt').AsFloat  :=  NElicecnt.Value;
                    ParamByName('p_ovtmamt').AsFloat  :=  NEovtmamt.Value;
                    ParamByName('p_sptmamt').AsFloat  :=  NEsptmamt.Value;
                    ParamByName('p_mcaramt').AsFloat  :=  NEmcaramt.Value;
                    ParamByName('p_mcartaxamt').AsFloat  :=  NEbokjisupamt.Value;
                    ParamByName('p_bokjisupamt').AsFloat  :=  NEmcartaxamt.Value;
                    ParamByName('p_yueduamt').AsFloat  :=  NEyueduamt.Value;
                    ParamByName('p_selfeduamt').AsFloat  :=  NEselfeduamt.Value;
                    ParamByName('p_medsupamt').AsFloat  :=  NEmedsupamt.Value;
                    ParamByName('p_homesupamt').AsFloat  :=  NEhomesupamt.Value;
                    ParamByName('p_longsupamt').AsFloat  :=  NElongsupamt.Value;
                    ParamByName('p_drvliceamt').AsFloat  :=  NEdrvliceamt.Value;
                    ParamByName('p_odamt').AsFloat  :=  NEodamt.Value;
                    ParamByName('p_odtaxamt').AsFloat  :=  NEodtaxamt.Value;
                    ParamByName('p_bonusamt').AsFloat  :=  NEbonusamt.Value;
                    ParamByName('p_incentamt').AsFloat  :=  NEincentamt.Value;
                    ParamByName('p_trainamt').AsFloat  :=  NEtrainamt.Value;
                    ParamByName('p_winteramt').AsFloat  :=  NEwinteramt.Value;
                    ParamByName('p_sbonamt').AsFloat  :=  NEsbonamt.Value;
                    ParamByName('p_sbontaxamt').AsFloat  :=  NEsbontaxamt.Value;
                    ParamByName('p_mbonamt').AsFloat  :=  NEmbonamt.Value;
                    ParamByName('p_ybonamt').AsFloat  :=  NEybonamt.Value;
                    ParamByName('p_aidamt3').AsFloat  :=  NEaidamt3.Value;
                    ParamByName('p_medno').AsString :=  Emedno.Text;
                    ParamByName('p_medamt').AsFloat  :=  NEmedamt.Value;
                    ParamByName('p_meddamt').AsFloat  :=  NEmeddamt.Value;
                    ParamByName('p_medgr').AsString :=  Emedgr.Text;
                    ParamByName('p_meddate').AsString :=  MEmeddate.Text;
                    ParamByName('p_medsayu').AsString :=  Emedsayu.Text;
                    ParamByName('p_empldate').AsString :=  MEempldate.Text;
                    ParamByName('p_emplsayu').AsString :=  Eemplsayu.Text;
                    ParamByName('p_anugr').AsString :=  Eanugr.Text;
                    ParamByName('p_anuselfamt').AsFloat  :=  NEanuselfamt.Value;
                    ParamByName('p_anudamt').AsFloat  :=  NEanudamt.Value;
                    ParamByName('p_anusayu').AsString :=  Eanusayu.Text;
                    ParamByName('p_sauamt').AsFloat  :=  NEsauamt.Value;
                    ParamByName('p_nojoamt').AsFloat  :=  NEnojoamt.Value;
                    ParamByName('p_saveamt3').AsFloat  :=  NEsaveamt3.Value;
                    ParamByName('p_igamt').AsFloat  :=  NEigamt.Value;
                    ParamByName('p_edudedamt').AsFloat  :=  NEedudedamt.Value;
                    ParamByName('p_sobiamt').AsFloat  :=  NEsobiamt.Value;
                    ParamByName('p_parkamt').AsFloat  :=  NEparkamt.Value;
                    ParamByName('p_chollamt').AsFloat  :=  NEchollamt.Value;
                    ParamByName('p_sangamt').AsFloat  :=  NEsangamt.Value;
                    ParamByName('p_meddedamt').AsFloat  :=  NEmeddedamt.Value;
                    ParamByName('p_hsamt').AsFloat  :=  NEhsamt.Value;
                    ParamByName('p_hsorgamt').AsFloat  :=  NEhsorgamt.Value;
                    ParamByName('p_hsintamt').AsFloat  :=  NEhsintamt.Value;
                    ParamByName('p_fbamt').AsFloat  :=  NEfbamt.Value;
                    ParamByName('p_sacorpcp').AsFloat  :=  NEsacorpcp.Value;     //2011.09.20 kth 우리사주원금 추가
                    ParamByName('p_sacorpamt').AsFloat  :=  NEsacorpamt.Value;
                    ParamByName('p_sabankcp').AsFloat  :=  NEsabankcp.Value;     //2011.09.20 kth 우리사주원금 추가
                    ParamByName('p_sabankamt').AsFloat  :=  NEsabankamt.Value;
                    ParamByName('p_nbamt').AsFloat  :=  NEnbamt.Value;
                    ParamByName('p_ticketamt').AsFloat  :=  NEticketamt.Value;
                    ParamByName('p_bondedamt').AsFloat  :=  NEbondedamt.Value;
                    ParamByName('p_saveamt1').AsFloat  :=  NEsaveamt1.Value;
                    ParamByName('p_saveamt2').AsFloat  :=  NEsaveamt2.Value;
                    ParamByName('p_dedamt1').AsFloat  :=  NEdedamt1.Value;
                    ParamByName('p_dedamt2').AsFloat  :=  NEdedamt2.Value;
                    ParamByName('p_dedamt3').AsFloat  :=  NEdedamt3.Value;
                    ParamByName('p_dedamt4').AsFloat  :=  NEdedamt4.Value;
                    ParamByName('p_dedamt5').AsFloat  :=  NEdedamt5.Value;
                    ParamByName('p_loanamt1').AsFloat  :=  NEloanamt1.Value;
                    ParamByName('p_loanamt2').AsFloat  :=  NEloanamt2.Value;
                    ParamByName('p_loanamt3').AsFloat  :=  NEloanamt3.Value;
                    ParamByName('p_payholdamt').AsFloat  :=  NEpayholdamt.Value;
                    ParamByName('p_soguppay').AsFloat  :=  NEsoguppay.Value;;
                    ParamByName('p_soguppay1').AsFloat  :=  NEsoguppay1.Value;;
                    ParamByName('p_soguppay2').AsFloat  :=  NEsoguppay2.Value;;
                    ParamByName('p_soguppay3').AsFloat  :=  NEsoguppay3.Value;;
                    ParamByName('p_soguppay4').AsFloat  :=  NEsoguppay4.Value;;
                    ParamByName('p_soguppay5').AsFloat  :=  NEsoguppay5.Value;;
                    ParamByName('p_soguppay6').AsFloat  :=  NEsoguppay6.Value;;
                    ParamByName('p_aidamt1').AsFloat  :=  NEaidamt1.Value;;
                    ParamByName('p_aidamt11').AsFloat  :=  NEaidamt11.Value;;
                    ParamByName('p_aidamt12').AsFloat  :=  NEaidamt12.Value;;
                    ParamByName('p_aidamt13').AsFloat  :=  NEaidamt13.Value;;
                    ParamByName('p_aidamt14').AsFloat  :=  NEaidamt14.Value;;
                    ParamByName('p_aidamt2').AsFloat  :=  NEaidamt2.Value;;
                    ParamByName('p_aidamt21').AsFloat  :=  NEaidamt21.Value;;
                    ParamByName('p_aidamt22').AsFloat  :=  NEaidamt22.Value;;
                    ParamByName('p_aidamt23').AsFloat  :=  NEaidamt23.Value;;
                    ParamByName('p_aidamt24').AsFloat  :=  NEaidamt24.Value;;
                    ParamByName('p_taxpay').AsFloat  :=  NEtaxpay.Value;;
                    ParamByName('p_taxpay1').AsFloat  :=  NEtaxpay1.Value;;
                    ParamByName('p_taxpay2').AsFloat  :=  NEtaxpay2.Value;;
                    ParamByName('p_taxpay3').AsFloat  :=  NEtaxpay3.Value;;
                    ParamByName('p_taxpay4').AsFloat  :=  NEtaxpay4.Value;;
                    ParamByName('p_notaxpay').AsFloat  :=  NEnotaxpay.Value;;
                    ParamByName('p_notaxpay1').AsFloat  :=  NEnotaxpay1.Value;;
                    ParamByName('p_notaxpay2').AsFloat  :=  NEnotaxpay2.Value;;
                    ParamByName('p_notaxpay3').AsFloat  :=  NEnotaxpay3.Value;;
                    ParamByName('p_notaxpay4').AsFloat  :=  NEnotaxpay4.Value;;
                    ParamByName('p_lectsupamt').AsFloat  :=  NEedusupamt.Value;;
                    ParamByName('p_lectsupamt1').AsFloat  :=  NEedusupamt1.Value;;
                    ParamByName('p_lectsupamt2').AsFloat  :=  NEedusupamt2.Value;;
                    ParamByName('p_lectsupamt3').AsFloat  :=  NElectsupamt.Value;;
                    ParamByName('p_lectsupamt4').AsFloat  :=  NElectsupamt1.Value;;
                    ParamByName('p_edusupamt').AsFloat  :=  NElectsupamt2.Value;;
                    ParamByName('p_edusupamt1').AsFloat  :=  NElectsupamt3.Value;;
                    ParamByName('p_edusupamt2').AsFloat  :=  NElectsupamt4.Value;;
                    ParamByName('p_childeduamt').AsFloat  :=  NEchildeduamt.Value;
                    ParamByName('p_ovmcamt').AsFloat  :=  NEovmcamt.Value;
                    ParamByName('p_trainsupamt').AsFloat  :=  NETrainSupAmt.Value;
                    ParamByName('p_ovmcded').AsFloat  :=  NEOvmcded.Value;
                    ParamByName('p_itamt').AsFloat  :=  NEITAMT.Value;
                    ParamByName('p_empldamt').AsFloat  :=  NEempldamt.Value;
                    ParamByName('p_writetime').AsString :=  Lsysdate.Caption;
                    ParamByName('p_writeman').AsString :=  Pempno;
                    ExecSql;
                    
                    LIbutnChk := 0;
                    LSempno   := Eempno.Text;
                    Retrieve;

                    Phelpmsg.Caption := ' 신규자료 등록이 완료 되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end;
          end;
     Finally
          qq.Free;
     end;
end;

// 사진조회
procedure TFM_Main.BBphotoClick(Sender: TObject);
begin
     if GetPhoto(Eempno.Text) = False then
     begin
        MessageBox(handle,'해당사원의 사진이 등록되어있지 않습니다!','조회오류',MB_ICONWARNING);
        Exit;
     end;
end;

function TFM_Main.GetPhoto(arg_emp:String):boolean;
var
     stream     : TMemoryStream;
     JPEGImage  : TJPEGImage;
     Bitmap     : TBitmap;
     NewHomeDir : String;
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select photo from cimphot   ');
               SQL.Add(' where empno = :p_empno     ');
               ParamByName('p_empno').AsString := Eempno.Text;
               Open;

               if recordcount = 0 then
               begin
                    image1.Picture := nil;
                    result := false;
                    Exit;
               end;

               // Dsa2000 2004.03.02. 그림파일 저장 및 읽기 경로수정
               NewHomeDir := GetKeyValue(HKEY_LOCAL_MACHINE, SUBKEY, 'NewHomeDir');

               try
                    JPEGImage := TJPEGImage.Create;
                    Bitmap := TBitmap.Create;
                    TBlobField(FieldByName('photo')).SaveToFile(NewHomeDir + '\pkmpmas.jpg');
                    JPEGImage.LoadFromFile(NewHomeDir + '\pkmpmas.jpg');
                    Bitmap.Assign(JPEGImage);
                    image1.Picture.Bitmap := Bitmap;
               finally
                    if not qq.Eof then
                    begin
                         JPEGImage.Free;
                         Bitmap.Free;
                    end;
               end;

               result := true;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFM_Main.CBefClick(Sender: TObject);
begin
     if CBef.checked = true then image1.stretch := true
     else                        image1.stretch := false;
end;

// 인사사항 수정
procedure TFM_Main.BBinsaeditClick(Sender: TObject);
begin

     Finsaedit := TFinsaedit.Create(Self);

     try
          Finsaedit.ShowModal;
          If Finsaedit.GIcloseS = -1 then Exit;
     finally
          Finsaedit.Free;
     end;

     Retrieve;
end;

//종료
procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  if IDNO = Application.MessageBox('작업을 종료하시겠습니까?', '작업안내', MB_YesNo) then
  begin
       Action := caNone;
       exit;
  end
  else
  begin}
       Action := caFree;
       if image1.visible = True then
       begin
            image1.sendtoback;
            image1.visible := False;
       end;
//  end;
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     close;
end;

// Hot Key Alt+O
procedure TFM_Main.NEmcaramtEnter(Sender: TObject);
begin
     BefValue := TNumberEdit(Sender).Value;
end;

procedure TFM_Main.NEmcaramtExit(Sender: TObject);
var
     Tmp       : Real;
     v_mcarnotax : Real;
     qq : TOraquery;
begin

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     try
         with qq do
         begin
              Close;
              SQL.Clear;
              SQL.Add('select mcarnotax      ');
              SQL.Add('  from pkcpbas        ');
              Open;
              v_mcarnotax := FieldByName('mcarnotax').AsFloat;

              Close;
              SQL.Clear;
              SQL.Add('select count(empno) cnt                             ');
              SQL.Add('  from pkmpmas                                      ');
              SQL.Add(' where empno = :p_empno                             ');
//infra 2008.12.   SQL.Add('   and paycl > ''09''                               ');
              SQL.Add('   and paycl > ''A61''                              ');
              SQL.Add('   and bldcode in (select bldcode                   ');
              SQL.Add('                     from pkcpbld                   ');
              SQL.Add('                    where restyn = ''Y''            ');
              SQL.Add('                      and bldcode = :p_bldcode)     ');

              ParamByName('p_empno').AsString := Eempno.Text;
              ParamByName('p_bldcode').AsString := Ebldcode.Text;
              Open;

              if  FieldByName('cnt').Asinteger = 1 then v_mcarnotax   := 0
              else                                      v_mcarnotax  := v_mcarnotax;

              Close;

              if BefValue <> NEmcaramt.Value then
              begin
                   Tmp := NEMCarAmt.Value - v_mcarnotax;
                   if Tmp < 0 then Tmp := 0;
                   NEMCarTaxAmt.Value := Tmp;
              end;
         end;
     finally
          qq.Free;
     end;

end;


procedure TFM_Main.CBSexDblClick(Sender: TObject);
begin
     if CBSex.Text = 'M' then CBSex.Text := 'F'
     else
     If CBSex.Text = 'F' then CBSex.Text := 'M'
     else                     CBSex.Text := 'M';
end;

procedure TFM_Main.CBSexExit(Sender: TObject);
begin
     CBSex.Text := UpperCase(CBSex.Text);
end;

procedure TFM_Main.sbbank1Click(Sender: TObject);
begin
     p_GetCodeName('은행코드조회', 'K910', Epaybank1, Lpaybank1);
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
    OraConnect;
    
    TabbedNotebook1.PageIndex := 0 ;
end;

procedure TFM_Main.p_GetCodeName(codetitle,codeid: String;
                                var Ecode :TEdit;var Lcode :Tlabel );
begin
     FKeyCode := TFKeyCode.Create(Self);

     Try

          FKeyCode.FormData := codetitle;  //'은행코드조회';
          FKeyCode.Dataval1 := codeid;    // 'K910';
          FKeyCode.ShowModal;

          If FKeyCode.CloseChk = -1 then Exit;  {선택없이종료...}

          Ecode.Text := FKeyCode.Code;
          LCode.Caption := FKeyCode.Codename;

     Finally
          FKeyCode.Free;
     end;
end;


procedure TFM_Main.NEsoguppay1Exit(Sender: TObject);
begin
     NEsoguppay.value := NEsoguppay1.value+
                         NEsoguppay2.value+
                         NEsoguppay3.value+
                         NEsoguppay4.value+
                         NEsoguppay5.value+
                         NEsoguppay6.value;
end;

procedure TFM_Main.NEaidamt11Exit(Sender: TObject);
begin
     NEaidamt1.value := NEaidamt11.value+
                        NEaidamt12.value+
                        NEaidamt13.value+
                        NEaidamt14.value;
end;

procedure TFM_Main.NEaidamt21Exit(Sender: TObject);
begin
     NEaidamt2.value := NEaidamt21.value+
                        NEaidamt22.value+
                        NEaidamt23.value+
                        NEaidamt24.value;
end;

procedure TFM_Main.NEtaxpay1Exit(Sender: TObject);
begin
     NEtaxpay.value := NEtaxpay1.value+
                       NEtaxpay2.value+
                       NEtaxpay3.value+
                       NEtaxpay4.value;
end;

procedure TFM_Main.NEnotaxpay1Exit(Sender: TObject);
begin
     NEnotaxpay.value := NEnotaxpay1.value+
                         NEnotaxpay2.value+
                         NEnotaxpay3.value+
                         NEnotaxpay4.value;
end;

procedure TFM_Main.NEedusupamt1Exit(Sender: TObject);
begin
    NEedusupamt.Value := NEedusupamt1.Value +
                         NEedusupamt2.Value ;
end;

procedure TFM_Main.NElectsupamt1Exit(Sender: TObject);
begin
    NElectsupamt.Value := NElectsupamt1.Value +
                          NElectsupamt2.Value +
                          NElectsupamt3.Value +
                          NElectsupamt4.Value ;
end;

//유치원학자금 과세금액 구하기...2005.01.
procedure TFM_Main.NEyueduamtExit(Sender: TObject);
var
     qq : TOraQuery;
begin

{     qq := TOraQuery.Create(Nil);        유치원 학자금 전액 과세처리 2010.07.20 kth 주석
     qq.Session := Ora_Session;           마스터에서 수정 하는 사람 전액 과세로 변경 6 세 초과일 경우 작업 
     try
         with qq do
         begin
              Close;
              SQL.Clear;
              SQL.Add('select :p_yueduamt - (least(:p_yueduamt, (select childnotax from pkcpbas))) yuedutax ');
              SQL.Add('  from pkmpmas                                                                       ');
              SQL.Add(' where empno = :p_empno                                                              ');
              ParamByName('p_yueduamt').AsFloat := NEyueduamt.Value;
              ParamByName('p_empno').AsString   := Eempno.Text;
              Open;

              NEyuedutax.Value := FieldByName('yuedutax').AsFloat;
         end
     finally
          qq.Free;
     end;}
      NEyuedutax.Value := NEyueduamt.Value;
     
end;

//가족 수당 항목별 입력에 따른 자동합계.
procedure TFM_Main.Calc_Famiamtsum(Sender: TObject);
begin
     NEfamiamt.Value := (NEparentamt.Value + NEChildamt.Value + NEmateamt.Value);
end;


Function TFM_Main.Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;
var
  qq : TOraQuery;
  V_RECDATA, V_REMARK, V_fixpay1 : string;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;

  V_fixpay1 := FloatToStr(NEfixpay.Value);
  
  V_RECDATA := '변경전_급여지급여부:'  + V_payyn    + '||'
             + '변경전_근무지코드:'    + V_bldcode   + '||'
             + '변경전_노조여부:'      + V_nojoyn    + '||'
             + '변경전_연봉차수:'      + V_yearpaynum+ '||'
             + '변경전_총연봉:'        + V_totpay    + '||'
             + '변경전_월정연봉:'      + V_fixpay    + '||'
             + '변경후_월정연봉:'      + V_fixpay1   + '||'
             + '변경전_급여이체은행:'  + V_paybank   + '||'
             + '변경전_급여계좌번호:'  + V_payacnt   + '||'
             + '변경전_식교이체은행:'  + V_paybank1  + '||'
             + '변경전_식교계좌번호:'  + V_payacnt1
             ;

  V_REMARK  := '급여마스터 관리에서 자료를 저장';

  with qq do
  begin
       Close;
       SQL.Clear;
       SQL.Add('call HPER.PKHPHIS_LOG (                        ');
       SQL.Add('        '''+ progid     +''',                  ');  //프로그램 ID
       SQL.Add('        '''+ modflag    +''',                  ');  //변경구분
       SQL.Add('        '''+ modemp     +''',                  ');  //작업자
       SQL.Add('        '''+ worktype   +''',                  ');  //작업구분
       SQL.Add('        '''+ empno      +''',                  ');  //대상사번
       SQL.Add('        '''+ dataname   +''',                  ');  //급여항목명
       SQL.Add('        '''+ V_RECDATA  +''',                  ');  //변경전내용
       SQL.Add('        '''+ V_REMARK   +'''                   ');  //작업내용
       SQL.Add('                         )                     ');

       try
            ExecSql;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;


end.
