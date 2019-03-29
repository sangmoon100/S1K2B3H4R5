unit PIA1010P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids,
  DBTables, Db, ImgList, jpeg, Datelib, codelib, Calen1, pass, codeText, timeftp,
  Func, MemDS, DBAccess, Ora, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnRadioBtn, ShellApi, OnPopupEdit, OnEditNumCtl,
  Math, OnFocusButton,OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1,OnTmaxPersonEdit,
  KeyEmpnoB;

//  WinTypes, WinProcs,
//  iniFiles,timeftp,
//  NumCtrl, pass, codeText,


type
  Tpia1010aForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    PersonPic: TImage;
    empno: TMaskEdit;
    korname: TMaskEdit;
    Panel47: TPanel;
    Panel48: TPanel;
    Bsel1: TPanel;
    Label3: TLabel;
    Bsel2: TPanel;
    Label4: TLabel;
    l22: TLabel;
    Bsel3: TPanel;
    Label5: TLabel;
    l23: TLabel;
    Bsel4: TPanel;
    Label6: TLabel;
    l24: TLabel;
    Bsel5: TPanel;
    Label7: TLabel;
    l25: TLabel;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Panel4: TPanel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    pstate: TMaskEdit;
    paycl: TMaskEdit;
    deptcode: TMaskEdit;
    paygr: TMaskEdit;
    pstateyn: TComboBox;
    payra: TMaskEdit;
    paydunm: TMaskEdit;
    realtrdate: TMaskEdit;
    offtrdate: TMaskEdit;
    cpayradate: TMaskEdit;
    orgempdate: TMaskEdit;
    paycldate: TMaskEdit;
    reppayfrdate: TMaskEdit;
    repaytodate: TMaskEdit;
    apdpayfrdate: TMaskEdit;
    apdpaytodate: TMaskEdit;
    actpayfrdate: TMaskEdit;
    actpaytodate: TMaskEdit;
    remark: TMaskEdit;
    payrayn: TComboBox;
    jobplace: TMaskEdit;
    cpaycldate: TMaskEdit;
    reppaycl: TMaskEdit;
    apdpaydunm: TMaskEdit;
    actpaydunm: TMaskEdit;
    lragrdate: TMaskEdit;
    empcode: TMaskEdit;
    empschgr: TMaskEdit;
    emppaycl: TMaskEdit;
    empterm: TMaskEdit;
    etcpaycont: TMaskEdit;
    cardate: TMaskEdit;
    bcaryy: TMaskEdit;
    bcarmm: TMaskEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Npstate: TPanel;
    Npaycl: TPanel;
    Panel45: TPanel;
    Npayra: TPanel;
    Ndeptcode: TPanel;
    Njobplace: TPanel;
    Nreppaycl: TPanel;
    Nremark: TPanel;
    Nempcode: TPanel;
    Nemppaycl: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Nempschgr: TPanel;
    fieldcode: TPanel;
    Nfieldcode: TPanel;
    grpaygrsum: TPanel;
    Panel52: TPanel;
    emppaygr: TNumberEdit;
    armypaygr: TNumberEdit;
    etcpaygr: TNumberEdit;
    carpaygr: TNumberEdit;
    maspaygr: TNumberEdit;
    Panel53: TPanel;
    empdate: TMaskEdit;
    fincode: TPanel;
    Panel54: TPanel;
    boncode: TPanel;
    jobdept: TMaskEdit;
    Njobdept: TPanel;
    jobpayra: TMaskEdit;
    Njobpayra: TPanel;
    Panel191: TPanel;
    jobpayrayn: TComboBox;
    Njikgroup: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Label30: TLabel;
    Label43: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    sbtnCallNojohis: TSpeedButton;
    jobgun: TMaskEdit;
    jobline: TMaskEdit;
    jobkind: TMaskEdit;
    jobduty: TMaskEdit;
    nojnfrdate: TMaskEdit;
    nojntodate: TMaskEdit;
    jobgundate: TMaskEdit;
    joblinedate: TMaskEdit;
    jobkinddate: TMaskEdit;
    jobdutydate: TMaskEdit;
    nogubun: TMaskEdit;
    nojeonyn: TComboBox;
    lancode: TMaskEdit;
    lannono: TMaskEdit;
    lanfrdate: TMaskEdit;
    lantodate: TMaskEdit;
    exdutyy: TMaskEdit;
    exdutmm: TMaskEdit;
    exdutdd: TMaskEdit;
    exdutcnt: TMaskEdit;
    lexfrdate: TMaskEdit;
    lextodate: TMaskEdit;
    payclyy: TMaskEdit;
    payclmm: TMaskEdit;
    paycldd: TMaskEdit;
    comduyy: TMaskEdit;
    comdumm: TMaskEdit;
    comdudd: TMaskEdit;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel70: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Njobgun: TPanel;
    Njobline: TPanel;
    Njobkind: TPanel;
    Njobduty: TPanel;
    Nnogubun: TPanel;
    Nlancode: TPanel;
    Panel96: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel105: TPanel;
    Panel106: TPanel;
    Panel107: TPanel;
    lexduyy: TPanel;
    lexdumm: TPanel;
    lexdudd: TPanel;
    Panel108: TPanel;
    Panel109: TPanel;
    nojoYN: TComboBox;
    Panel110: TPanel;
    EHyunChasu: TEdit;
    Panel192: TPanel;
    Panel111: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel112: TPanel;
    armykind: TMaskEdit;
    armycl: TMaskEdit;
    armyfield: TMaskEdit;
    armyfrdate: TMaskEdit;
    armytodate: TMaskEdit;
    armydis: TMaskEdit;
    armyex: TMaskEdit;
    lschgr: TMaskEdit;
    lschdeg: TMaskEdit;
    lschcode: TMaskEdit;
    lmajorcode: TMaskEdit;
    lschfrym: TMaskEdit;
    unicode: TMaskEdit;
    unimajor: TMaskEdit;
    unifrym: TMaskEdit;
    lschmajnm: TMaskEdit;
    lschtopic: TMaskEdit;
    lickind: TMaskEdit;
    licgr: TMaskEdit;
    licgetdate: TMaskEdit;
    licalkind: TMaskEdit;
    licalgr: TMaskEdit;
    licalgetdate: TMaskEdit;
    licalfield: TMaskEdit;
    licaldate: TMaskEdit;
    licbigo: TMaskEdit;
    toeicscore: TMaskEdit;
    toeicdate: TMaskEdit;
    jptscore: TMaskEdit;
    jptdate: TMaskEdit;
    lschnm: TMaskEdit;
    toeicfull: TMaskEdit;
    jptfull: TMaskEdit;
    Panel113: TPanel;
    Panel114: TPanel;
    Panel115: TPanel;
    Panel116: TPanel;
    Panel117: TPanel;
    Panel118: TPanel;
    Panel119: TPanel;
    Panel120: TPanel;
    Panel121: TPanel;
    Panel122: TPanel;
    Panel123: TPanel;
    Panel124: TPanel;
    Panel125: TPanel;
    Panel126: TPanel;
    Panel127: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    Panel130: TPanel;
    Panel131: TPanel;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel134: TPanel;
    Panel135: TPanel;
    Panel136: TPanel;
    Panel137: TPanel;
    Panel138: TPanel;
    Panel193: TPanel;
    Narmykind: TPanel;
    NarmyField: TPanel;
    Narmydis: TPanel;
    Nlschgr: TPanel;
    Narmycl: TPanel;
    Narmyex: TPanel;
    Nlschdeg: TPanel;
    Nlmajorcode: TPanel;
    Nunicode: TPanel;
    Nunimajor: TPanel;
    Nlickind: TPanel;
    Nlicgr: TPanel;
    Nlicalkind: TPanel;
    Nlicalgr: TPanel;
    lschgrym: TMaskEdit;
    unigrym: TMaskEdit;
    Panel139: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    Label13: TLabel;
    edugubun: TMaskEdit;
    eduplace: TMaskEdit;
    edufrdate: TMaskEdit;
    edutodate: TMaskEdit;
    educourse: TMaskEdit;
    eduarea: TMaskEdit;
    educont: TMaskEdit;
    edudufrdate: TMaskEdit;
    edudutodate: TMaskEdit;
    lrkind: TMaskEdit;
    lrfrdate: TMaskEdit;
    lrtodate: TMaskEdit;
    lvfrdate: TMaskEdit;
    lvtodate: TMaskEdit;
    lsekind: TMaskEdit;
    lsefrdate: TMaskEdit;
    lsetodate: TMaskEdit;
    lseplace: TMaskEdit;
    lsesayu: TMaskEdit;
    lsecont: TMaskEdit;
    Panel140: TPanel;
    Panel141: TPanel;
    Panel142: TPanel;
    Panel143: TPanel;
    Panel144: TPanel;
    Panel145: TPanel;
    Panel146: TPanel;
    Panel147: TPanel;
    Panel148: TPanel;
    Panel149: TPanel;
    Panel150: TPanel;
    Panel151: TPanel;
    Panel152: TPanel;
    Panel153: TPanel;
    Panel154: TPanel;
    Nedugubun: TPanel;
    Nlrkind: TPanel;
    Nlsekind: TPanel;
    hutodate: TMaskEdit;
    hugubun: TMaskEdit;
    hufrdate: TMaskEdit;
    retdate: TMaskEdit;
    retgubun: TMaskEdit;
    retsayu1: TMaskEdit;
    retsayu2: TMaskEdit;
    Panel155: TPanel;
    Panel156: TPanel;
    Panel157: TPanel;
    Panel159: TPanel;
    Panel160: TPanel;
    Panel194: TPanel;
    Nretgubun: TPanel;
    Nretsayu2: TPanel;
    Nhugubun: TPanel;
    Nretsayu1: TPanel;
    Panel161: TPanel;
    Label14: TLabel;
    obskind: TMaskEdit;
    obsgr: TMaskEdit;
    obsstate: TMaskEdit;
    otdufrdate: TMaskEdit;
    otdutodate: TMaskEdit;
    tcontr: TMaskEdit;
    ttype: TMaskEdit;
    tjobduty: TMaskEdit;
    tcond: TMaskEdit;
    Panel162: TPanel;
    Panel163: TPanel;
    Panel164: TPanel;
    Panel165: TPanel;
    Panel166: TPanel;
    Panel167: TPanel;
    Panel168: TPanel;
    Panel169: TPanel;
    Panel170: TPanel;
    Nobsgr: TPanel;
    Nobskind: TPanel;
    Ntcontr: TPanel;
    tcontramt: TNumberEdit;
    bohungubun: TMaskEdit;
    bohunnm: TMaskEdit;
    bohunrel: TMaskEdit;
    bohunno: TMaskEdit;
    bohunbran: TMaskEdit;
    scgubun: TMaskEdit;
    scentdate: TMaskEdit;
    scpredate: TMaskEdit;
    scenddate: TMaskEdit;
    sctermyn: TComboBox;
    sceyy: TMaskEdit;
    scemm: TMaskEdit;
    scedd: TMaskEdit;
    scsayu: TMaskEdit;
    Panel171: TPanel;
    Panel172: TPanel;
    Panel173: TPanel;
    Panel174: TPanel;
    Panel175: TPanel;
    Panel176: TPanel;
    Panel177: TPanel;
    Panel178: TPanel;
    Panel179: TPanel;
    Panel180: TPanel;
    Panel181: TPanel;
    Panel182: TPanel;
    Panel183: TPanel;
    Panel184: TPanel;
    Panel185: TPanel;
    Nbohungubun: TPanel;
    Nbohunrel: TPanel;
    Nscgubun: TPanel;
    Panel186: TPanel;
    tcompany: TMaskEdit;
    Ntcompany: TPanel;
    Panel195: TPanel;
    tpaygr: TNumberEdit;
    Ptjobduty: TPanel;
    cancel: TBitBtn;
    save: TBitBtn;
    Bcode: TBitBtn;
    exit: TBitBtn;
    ImageList1: TImageList;
    old_paycldate: TMaskEdit;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel46: TPanel;
    orgnum: TMaskEdit;
    Panel197: TPanel;
    Panel198: TPanel;
    OraQMas: TOraQuery;
    OraQuery1: TOraQuery;
    Qphoto: TOraQuery;
    Panel187: TPanel;
    groupempdate: TMaskEdit;
    groupcompany: TMaskEdit;
    Panel188: TPanel;
    Bsel6: TPanel;
    Label1: TLabel;
    TabSheet6: TTabSheet;
    Panel200: TPanel;
    Ed_skemailid: TMaskEdit;
    Panel204: TPanel;
    Panel201: TPanel;
    Ed_juminid: TMaskEdit;
    Ed_empno: TMaskEdit;
    Ed_korname: TMaskEdit;
    Panel203: TPanel;
    Panel205: TPanel;
    Panel202: TPanel;
    ed_skemail: TMaskEdit;
    alias: TMaskEdit;
    B_Applink: TButton;
    bohunyn: TComboBox;
    Panel206: TPanel;
    imwondate: TMaskEdit;
    Panel78: TPanel;
    Panel207: TPanel;
    Nemptypecd: TPanel;
    Nemptypenm: TPanel;
    Panel208: TPanel;
    NplaceNation: TPanel;
    Panel209: TPanel;
    Nrolelevel: TPanel;
    Panel210: TPanel;
    Nlicnm: TPanel;
    Nliccd: TPanel;
    Panel213: TPanel;
    Panel211: TPanel;
    Panel212: TPanel;
    Bsel7: TPanel;
    Label15: TLabel;
    TabSheet7: TTabSheet;
    chnname: TMaskEdit;
    engname: TMaskEdit;
    eldsonyn: TComboBox;
    marrigeyn: TComboBox;
    sex: TMaskEdit;
    holdname: TMaskEdit;
    holdrel: TMaskEdit;
    housetype: TMaskEdit;
    health: TMaskEdit;
    bornarea: TMaskEdit;
    regaddr: TMaskEdit;
    curaddr: TMaskEdit;
    zipno: TMaskEdit;
    telno: TMaskEdit;
    religion: TMaskEdit;
    habit: TMaskEdit;
    ability: TMaskEdit;
    blood: TMaskEdit;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    korage: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel93: TPanel;
    Panel94: TPanel;
    Panel95: TPanel;
    Nsex: TPanel;
    Nholdrel: TPanel;
    Nhealth: TPanel;
    Nbornarea: TPanel;
    Nhousetype: TPanel;
    Nreligion: TPanel;
    juminid: TMaskEdit;
    height: TNumberEdit;
    weight: TNumberEdit;
    Panel189: TPanel;
    SKEmail: TMaskEdit;
    Panel190: TPanel;
    E_mail: TMaskEdit;
    offitel: TMaskEdit;
    Panel196: TPanel;
    retcont: TMaskEdit;
    Panel158: TPanel;
    hoguaddr: TMaskEdit;
    Panel214: TPanel;
    juminaddr: TMaskEdit;
    Panel216: TPanel;
    curnation: TMaskEdit;
    Panel215: TPanel;
    curregion: TMaskEdit;
    Ncurnation: TPanel;
    juminzip: TMaskEdit;
    hoguzip: TMaskEdit;
    Ncurregion: TPanel;
    Panel220: TPanel;
    Panel222: TPanel;
    region: TMaskEdit;
    Nnation: TPanel;
    Panel225: TPanel;
    Nregion: TPanel;
    Bn_zipno: TOnWinPopupEdit;
    BN_juminzip: TOnWinPopupEdit;
    Nlangtype: TPanel;
    langtype: TPanel;
    Panel219: TPanel;
    Nlangname: TPanel;
    Panel224: TPanel;
    Nexamtype: TPanel;
    examtype: TPanel;
    Panel227: TPanel;
    Nexamdate: TPanel;
    Panel229: TPanel;
    rolelevel: TMaskEdit;
    Country: TMaskEdit;
    NCountry: TPanel;
    Panel217: TPanel;
    nation: TMaskEdit;
    rolelvdate: TMaskEdit;
    Panel218: TPanel;
    publish: TMaskEdit;
    TabSheet8: TTabSheet;
    Ntdutyclass: TPanel;
    tdutyclass: TMaskEdit;
    Panel223: TPanel;
    Panel21: TPanel;
    birthday: TMaskEdit;
    birthgubun: TComboBox;
    BitBtn1: TBitBtn;
    procedure empnoDblClick(Sender: TObject);
    procedure RunKeyPress(Sender: TObject; var Key: Char);
    procedure saveClick(Sender: TObject);
    procedure RunSaveClick(Sender: TObject);
    procedure KeyFieldMove(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DataFieldChange(Sender: TObject);
    procedure DataFieldClick(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure codeHelp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DataKeyPress(Sender: TObject; var Key: Char);
    procedure deptcodeDblClick(Sender: TObject);
    procedure DataKeyMove1(Sender: TObject; var Key: Word;
                          Shift: TShiftState);
    procedure DataKeyMove2(Sender: TObject; var Key: Word;
                          Shift: TShiftState);
    procedure DataKeyMove3(Sender: TObject; var Key: Word;
                          Shift: TShiftState);
    procedure sFocus(Sender : TObject; Cap : TPanel);
    procedure CalenClick(Sender: TObject);
    procedure calHelp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure exitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Hobong(Sender: TObject);
    procedure TextToFloat(Sender: TObject);
    procedure Bsel1Click(Sender: TObject);
    procedure Bsel2Click(Sender: TObject);
    procedure Bsel3Click(Sender: TObject);
    procedure Bsel4Click(Sender: TObject);
    procedure Bsel5Click(Sender: TObject);
    procedure Bsel6Click(Sender: TObject);
    procedure jobgunChange(Sender: TObject);
    procedure joblineChange(Sender: TObject);
    procedure jobgunClick(Sender: TObject);
    procedure DataFieldMove5(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataFieldMove4(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataFieldMove6(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cancelClick(Sender: TObject);
    procedure BcodeClick(Sender: TObject);
    procedure B_ApplinkClick(Sender: TObject);
    procedure empdateExit(Sender: TObject);
    procedure Bsel7Click(Sender: TObject);
    procedure Bn_zipnoInitPopup(Sender: TObject);
    procedure Bn_zipnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BN_juminzipInitPopup(Sender: TObject);
    procedure BN_juminzipCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure juminaddrExit(Sender: TObject);
    procedure CountryChange(Sender: TObject);
    procedure nationChange(Sender: TObject);
    procedure lschfrymExit(Sender: TObject);
    procedure zipnoKeyPress(Sender: TObject; var Key: Char);
    procedure juminzipKeyPress(Sender: TObject; var Key: Char);
    procedure juminidExit(Sender: TObject);
    procedure CountryExit(Sender: TObject);
    procedure curnationExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure empnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EnterKey  : Boolean;        {엔터키를 누른가를  체크}
    MsgKey    : Boolean;
    FreeCheck : Boolean;
    QDeptVal  : array[1..3] of String;
    Bsel      : array[1..7] of TPanel;
    ChangeCheck : Boolean;
    Tmpcuraddr, Tmpjuminaddr, Tmpfullcuraddr, Tmpfulljuminaddr  : string;
    Tmpcuraddrlen, Tmpjuminaddrlen : integer;
    procedure Qemp2Display;
    procedure KeyClick(Sender : TObject);
    procedure ClearDataField;
//    procedure sFocus(Sender : TObject; Cap : TPanel);
//    function  KeySpace : integer;
    function  DataCheck : Boolean;
    procedure ColorSetting(Sender : TObject);
    procedure Yempno_SKemail;

  public
    {Public declarations }
    C_RunSave     : integer;        {실행-1,저장-2}
    Public_Window : integer;   {윈도우 화면 결정 }
    Mhandle       : Thandle;
    P_SaveEmpno   : string;
    P_empno	  : string;	{임시저장 사원번호 }
    P_korname	  : string; {임시저장 사원명}
    password      : string;
    Start         : integer;
    pDBUsrname    : string;
    pDBPass       : string;
    pSvrname      : string;
    HyunChasu     : String;
    usaage,tage : String;

    procedure AllDataSave;//(Sender : TPanel);
    procedure empPicture(image : Timage; emp : string);
    function  QCodeDisp(s1,s2,s3 : String; gubun : integer): String;
    function  QDeptDisp(s1,s2 : String; gubun : integer): String;
    function  QJobKindDisp(s1 : String) : String;
    function  CheckSpace(text : String) : integer; // 빈 칸 체크
  end;

var
  pia1010aForm: Tpia1010aForm;
  HomeDir : string;
  tpaycl : string;   //   연봉 계산을 위한 사원의 직급
const
  DEPTCDLEN = '5';

implementation

uses Dept1lib, PIA10101, PIA10102;  // Fempno,


{$R *.DFM}

procedure Tpia1010aForm.empnoDblClick(Sender: TObject);
begin

//20180703 신범주 주석처리
{
   empForm := TempForm.Create(self);
   Try
   if TMaskEdit(Sender).Tag = 1 then empForm.DataVal1 := empno.Text
   else                              empForm.DataVal2 := korname.Text;

   empForm.ShowModal;

   if empForm.code <> '' then
   begin
      empno.Text   := empForm.Code;
      korname.Text := empForm.CodeName;
      P_empno   := empno.Text;
      P_korname := korname.Text;
   end else
   begin
      empno.Text   := '';
      korname.Text := '';
      empno.setfocus;
   end;

   Finally
      empForm.Free;
   end;
 }

  //20180701 최성일 추가
  FKeyEmpnoB := TFKeyEmpnoB.Create(self);
  Try
    FKeyEmpnoB.EdEmpno.Text := empno.Text;
    FKeyEmpnoB.v_EmpGb    := 'A';   // 'M' 임원, 'Y' 파견직, 'Z' 일반직(임원 파견직 제외), 'A' 전체
    FKeyEmpnoB.v_CloseGb := False; // True 자동닫음, False 닫지않음 - 조회대상건이 1건일때 화면을 자동으로 Close 한다.
    FKeyEmpnoB.BBrun.OnClick(Sender);
    FKeyEmpnoB.ShowModal;

    if FKeyEmpnoB.CloseChk <> -1 then
    begin
      empno.TExt := FKeyEmpnoB.v_KeyEmpno;
      korname.Text := FKeyEmpnoB.v_KeyKorname;
    end;

  Finally
    FKeyEmpnoB.Free;
  end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataFieldMove5(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (MsgKey = True) and (Key = vk_Return) then begin
    MsgKey := False; system.Exit;
end;
if Key = vk_F9  then DataFieldClick(Sender);
if Key = vk_F12 then saveClick(Sender);
if not (ssShift in Shift) then begin
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case Tcomponent(Sender).Tag of
       1  : begin
            if EnterKey = False then begin
               Nbohungubun.Caption := QCodeDisp('I015',bohungubun.Text,'',0);
	       sFocus(bohunnm,Nbohungubun);
            end;
            EnterKey := False;
	    end;
       2  : sFocus(bohunrel,nil);
       3  : begin
	    Nbohunrel.Caption := QCodeDisp('I211',bohunrel.Text,'',0);
	    sFocus(bohunno,Nbohunrel);
	    end;
       4  : sFocus(bohunbran,nil);
       5  : sFocus(scgubun,nil);
       6  : begin
	    Nscgubun.Caption := QCodeDisp('I016',scgubun.Text,'',0);
	    sFocus(scentdate,Nscgubun);
	    end;
       7  : sFocus(scpredate,nil);
       8  : sFocus(scenddate,nil);
       9  : sFocus(sctermyn,nil);
       10 : sFocus(sceyy,nil);
       11 : sFocus(scemm,nil);
       12 : sFocus(scedd,nil);
       13 : sFocus(scsayu,nil);
       14 : sFocus(obskind,nil);
       15 : begin
            Nobskind.Caption := QCodeDisp('I012',obskind.Text,'',0);
	    sFocus(obsgr,Nobskind);
            end;
       16 : begin
            Nobsgr.Caption := QCodeDisp('I011',obsgr.Text,'',0);
            sFocus(obsstate,Nobsgr);
            end;
       17 : sFocus(otdufrdate,nil);
       18 : sFocus(otdutodate,nil);
       19 : sFocus(tcontr,nil);
       20 : begin
            Ntcontr.Caption := QCodeDisp('I901',tcontr.Text,'',0);
            sFocus(tcontramt,Ntcontr);
            end;
       21 : sFocus(tpaygr,nil);
       22 : sFocus(ttype,nil);
       23 : sFocus(tcompany,nil);
       24 : begin
              Ntcompany.Caption := Qcodedisp('I902',trim(tcompany.text),'',0);
              sFocus(tjobduty,nil);
            end;
       25 : begin         //직무 추가 2002.01.29 shm
              Ptjobduty.Caption := Qcodedisp('I702',trim(tjobduty.text),'',0);
              sFocus(tdutyclass,nil);
            end;
       26 : begin         //직무등급 2013.03.15 HeeYong
              Ntdutyclass.Caption := Qcodedisp('I703',trim(tdutyclass.text),'',0);
              sFocus(tcond,nil);
            end;
       27 : sFocus(bohungubun,nil);
      end;
   end;
end
else
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
      case Tcomponent(Sender).Tag of
        1 : begin
	    Nbohungubun.Caption := QCodeDisp('I015',bohungubun.Text,'',0);
	    sFocus(tcond,Nbohungubun);
	    end;
        2 : sFocus(bohungubun,nil);
        3 : begin
	    Nbohunrel.Caption := QCodeDisp('I211',bohunrel.Text,'',0);
	    sFocus(bohunnm,Nbohunrel);
	    end;
        4 : sFocus(bohunrel,nil);
        5 : sFocus(bohunno,nil);
        6 : begin
	    Nscgubun.Caption := QCodeDisp('I016',scgubun.Text,'',0);
	    sFocus(bohunbran,Nscgubun);
	    end;
        7 : sFocus(scgubun,nil);
        8 : sFocus(scentdate,nil);
        9 : sFocus(scpredate,nil);
       10 : sFocus(scenddate,nil);
       11 : sFocus(sctermyn,nil);
       12 : sFocus(sceyy,nil);
       13 : sFocus(scemm,nil);
       14 : sFocus(scedd,nil);
       15 : begin
            Nobskind.Caption := pia1010aForm.QCodeDisp('I012',obskind.Text,'',0);
	    sFocus(scsayu,Nobskind);
            end;
       16 : begin
            Nobsgr.Caption := pia1010aForm.QCodeDisp('I011',obsgr.Text,'',0);
            sFocus(obskind,Nobsgr);
            end;
       17 : sFocus(obsgr,nil);
       18 : sFocus(obsstate,nil);
       19 : sFocus(otdufrdate,nil);
       20 : begin
            Ntcontr.Caption := pia1010aForm.QCodeDisp('I901',tcontr.Text,'',0);
            sFocus(otdutodate,Ntcontr);
            end;
       21 : sFocus(tpaygr,nil);
       22 : sFocus(tcontr,nil);
       23 : sFocus(tcontramt,nil);
       24 : begin
              Ntcompany.Caption := pia1010aForm.Qcodedisp('I902',trim(tcompany.text),'',0);
              sFocus(ttype,Ntcompany);
            end;
//       25 : sFocus(tcompany,nil);
       25 : begin         //직무 추가 2002.01.29 shm
              Ptjobduty.Caption := pia1010aForm.Qcodedisp('I702',trim(tjobduty.text),'',0);
              sFocus(tdutyclass,nil);
            end;
       26 : begin         //직무등급 2013.03.15 HeeYong
              Ntdutyclass.Caption := Qcodedisp('I703',trim(tdutyclass.text),'',0);
              sFocus(tcond,nil);
            end;
       27 : sFocus(bohungubun,nil);
      end;
end; {if end}

end;
procedure Tpia1010aForm.DataFieldMove4(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (MsgKey = True) and (Key = vk_Return) then begin
    MsgKey := False; system.Exit;
end;
if Key = vk_F9  then DataFieldClick(Sender);
if Key = vk_F12 then saveClick(Sender);
if not (ssShift in Shift) then
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
   begin
      case Tcomponent(Sender).Tag of
	1 : begin
            if EnterKey = False then begin
               if trim(edugubun.Text) <> '' then
                  Nedugubun.Caption := pia1010aForm.QCodeDisp('I601',edugubun.Text,'',0)
               else Nedugubun.Caption  := '';
	       sFocus(eduplace,Nedugubun);
            end;
            EnterKey := False;
	    end;
	2 : sFocus(edufrdate,nil);
	3 : sFocus(edutodate,nil);
	4 : sFocus(educourse,nil);
	5 : sFocus(eduarea,nil);
	6 : sFocus(educont,nil);
	7 : sFocus(edudufrdate,nil);
	8 : sFocus(edudutodate,nil);
	9 : sFocus(lrkind,nil);
       10 : begin
	    Nlrkind.Caption := pia1010aForm.QCodeDisp('I310',lrkind.Text,'',0);
	    sFocus(lrfrdate,Nlrkind);
	    end;
       11 : sFocus(lrtodate,nil);
       12 : sFocus(lvfrdate,nil);
       13 : sFocus(lvtodate,nil);
       14 : sFocus(lsekind,nil);
       15 : begin
	    Nlsekind.Caption := pia1010aForm.QCodeDisp('I310',lsekind.Text,'',0);
	    sFocus(lsefrdate,Nlsekind);
	    end;
       16 : sFocus(lsetodate,nil);
       17 : sFocus(lseplace,nil);
       18 : sFocus(lsesayu,nil);
       19 : sFocus(lsecont,nil);
       20 : sFocus(hugubun,nil);
       21 : begin
	    Nhugubun.Caption := pia1010aForm.QCodeDisp('I320',hugubun.Text,'',0);
	    sFocus(hufrdate,Nhugubun);
	    end;
       22 : sFocus(hutodate,nil);
       23 : sFocus(retdate,nil);
       24 : sFocus(retgubun,nil);
       25 : begin
            Nretgubun.Caption := pia1010aForm.QCodeDisp('I310',retgubun.Text,'',0);
            sFocus(retsayu1,Nretgubun);
            end;
       26 : begin
	    Nretsayu1.Caption := pia1010aForm.QCodeDisp('I141',retsayu1.Text,'',0);
	    sFocus(retsayu2,Nretsayu1);
	    end;
       27 : begin
	    Nretsayu2.Caption := pia1010aForm.QCodeDisp('I142',retsayu2.Text,'',0);
	    sFocus(save,Nretsayu2);
            end;
       28 : sFocus(edugubun,nil);
      end;
   end;
end
else
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
      case Tcomponent(Sender).Tag of
	1 : begin
            if trim(edugubun.Text) <> '' then
    	       Nedugubun.Caption := pia1010aForm.QCodeDisp('I601',edugubun.Text,'',0)
            else Nedugubun.Caption  := '';
	    sFocus(eduplace,Nedugubun);
	    end;
	2 : sFocus(edugubun,nil);
	3 : sFocus(eduplace,nil);
	4 : sFocus(edufrdate,nil);
	5 : sFocus(edutodate,nil);
	6 : sFocus(educourse,nil);
	7 : sFocus(eduarea,nil);
	8 : sFocus(educont,nil);
	9 : sFocus(edudufrdate,nil);
       10 : begin
	    Nlrkind.Caption := pia1010aForm.QCodeDisp('I310',lrkind.Text,'',0);
	    sFocus(edudutodate,Nlrkind);
	    end;
       11 : sFocus(lrkind,nil);
       12 : sFocus(lrfrdate,nil);
       13 : sFocus(lrtodate,nil);
       14 : sFocus(lvfrdate,nil);
       15 : begin
	    Nlsekind.Caption := pia1010aForm.QCodeDisp('I310',lsekind.Text,'',0);
	    sFocus(lvtodate,Nlsekind);
	    end;
       16 : sFocus(lsekind,nil);
       17 : sFocus(lsefrdate,nil);
       18 : sFocus(lsetodate,nil);
       19 : sFocus(lseplace,nil);
       20 : sFocus(lsesayu,nil);
       21 : begin
	    Nhugubun.Caption := pia1010aForm.QCodeDisp('I320',hugubun.Text,'',0);
	    sFocus(lsecont,Nhugubun);
	    end;
       22 : sFocus(hugubun,nil);
       23 : sFocus(hufrdate,nil);
       24 : sFocus(hutodate,nil);
       25 : begin
            Nretgubun.Caption := pia1010aForm.QCodeDisp('I310',retgubun.Text,'',0);
            sFocus(retdate,Nretgubun);
            end;
       26 : begin
	    Nretsayu1.Caption := pia1010aForm.QCodeDisp('I141',retsayu1.Text,'',0);
	    sFocus(retgubun,Nretsayu1);
	    end;
       27 : begin
	    Nretsayu2.Caption := pia1010aForm.QCodeDisp('I142',retsayu2.Text,'',0);
	    sFocus(retsayu1,Nretsayu2);
            end;
       28 : sFocus(retsayu2,nil);
     end;
end; {if end}

end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.RunKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = Chr(13) then
   begin
      Key := Chr(0);   {소리제겅용}
      OraQuery1.Close;
      OraQuery1.SQL.Clear;
      OraQuery1.SQL.Add(' select value2  from pimvari      '+ //현 노조차수
                    '          where gubun  = ''00''   '+
                    '            and sgubun = ''0001'' ');
      OraQuery1.Open;
      HyunChasu := OraQuery1.FieldByName('value2').AsString;
      {성명에서 엔터키를 치면 실행키와 같은 처리를한다..}
      C_RunSave := 1;
      P_empno   := empno.Text;
      P_korname := korname.Text;

      if trim(empno.Text) = '' then
      begin
           with OraQuery1 do
           begin
                Close;
                Sql.Clear;
                SQL.Add(' SELECT empno,korname      ');
                SQL.Add('   FROM pimpmas            ');
                SQL.Add('  WHERE empno   = :Lempno  ');
                SQL.Add('     or korname = :Lempno  ');
                ParamByName('lempno').AsString := korname.Text;
                Open;
                if Recordcount = 1 then empno.text := FieldByName('empno').AsString;
                if RecordCount > 1 then empnoDblClick(korname);
                Close;
           end;
      end;

      EnterKey  := True;
      if empno.text <> '' then RunSaveClick(Sender);
  end;


end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.KeyFieldMove(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Sawon : string;
begin
   if Key = vk_F1  then empnoDblClick(Sender);
   if (Key = vk_Return) or (Key = vk_Tab) then
   begin
      case TComponent(Sender).Tag of
         1 : begin
                Sawon := 'key';
                if empno.Text <> '' then
                begin
                     with OraQuery1 do
                     begin
                          Close;
                          Sql.Clear;
                          SQL.Add(' SELECT empno,korname      ');
                          SQL.Add('   FROM pimpmas            ');
                          SQL.Add('  WHERE empno   = :Lempno  ');
                          SQL.Add('     or korname = :Lempno  ');
                          ParamByName('lempno').AsString := empno.Text;
                          Open;
                          if RecordCount > 0 then Sawon := 'yes';
                          korname.Text := FieldByName('KORNAME').AsString;
                     end;
                end;
                if Sawon = 'key' then korname.SetFocus;
                if Sawon = 'yes' then
                begin
                   C_RunSave := 1;
                   RunSaveClick(Sender);
                end;
             end;
         2 : empno.SetFocus;
      end; {case end}
   end; {if end}
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.saveClick(Sender: TObject);
begin
  if save.Caption = '실행' then  C_RunSave := 1
  else                           C_RunSave := 0; //'저장'

  RunSaveClick(Sender);
end;
//------------------------------------------------------------------------------
{저장,실행 옵션에 따라 실행한다..}
procedure Tpia1010aForm.RunSaveClick(Sender: TObject);
begin
   {실행키를 누를경우 }
   if C_RunSave = 1 then
   begin
      Try
         OraQMas.Close;
         OraQMas.ParamByName('Lempno').AsString := empno.Text;
         OraQMas.Open;
         if OraQMas.RecordCount <= 0 then
         begin
            MessageBox(handle,'해당자료가 없습니다 !!.','알 림',MB_OK or $0030);
            empno.Setfocus; system.Exit;
         end;
         Qemp2Display;
         empPicture(personPic,empno.Text);

      Except ON E : EDataBaseError DO
   	     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
      END;
      Save.Caption := '저장';
      Save.Glyph := nil;
      ImageList1.GetBitmap(1, Save.Glyph);
      cancel.Enabled  := True;
      // 추가
      if       pageControl1.ActivePage = Tabsheet1 then  pstate.SetFocus
      else  if pageControl1.ActivePage = Tabsheet2 then  jobgun.SetFocus
      else  if pageControl1.ActivePage = Tabsheet3 then  armykind.SetFocus
      else  if pageControl1.ActivePage = Tabsheet4 then  edugubun.SetFocus
      else  if pageControl1.ActivePage = Tabsheet5 then  bohungubun.SetFocus
      else  if pageControl1.ActivePage = Tabsheet6 then  ed_skemailid.SetFocus  ;
      Yempno_SKemail; 
   end
   else
   begin
     //dsa2000  2018.04.05       요청번호 SR-1804-0217
     if (Length(Trim(juminid.Text)) > 2 ) and (Length(Trim(juminid.Text)) < 14) then
     begin
          MessageDlg('주민번호 13자리를 채워주시기 바랍니다.'+#13+#13+
                     '부득이한 경우 성별에 따라 뒷자리를 "1111111" 또는 "2222222" 입력하고'+#13#13+
                     '추후 반드시 정상적인 주민번호로 변경 바랍니다',mtError,[mbOK],0);
          PageControl1.ActivePage := TabSheet7;
          System.Exit;
     end;

     if (PageControl1.ActivePage <> tabsheet6) then
     begin
       if MessageBox(handle,'변경된 내용을 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
       begin
          ClearDataField;
          KeyClick(Sender);
          empno.SetFocus;
          System.Exit;
       end;
     end
     else
     begin
       if  trim(pstate.Text) >= '80' then
       begin
            MessageBox(handle,'퇴직한 사원의 SK그룹메일을 등록/변경하실 수는 없습니다.','알  림',MB_OK or $0030);
            System.Exit;
       end;
       
       if  (checkSpace(Ed_skemailid.Text) = 1) or (checkSpace(alias.Text) = 1) then
       begin
            MessageBox(handle,'[SK그룹메일]에 빈값이 있어 SK그룹메일을 등록/변경하실 수는 없습니다.','알  림',MB_OK or $0030);
            System.Exit;
       end;
     end;

     //if Trim(jobkind.Text) = '' then
     //begin
     //   showmessage('직종코드는 필수 입력항목입니다.');
     //   System.Exit;
     //end;

     if (PageControl1.ActivePage <> tabsheet6) and (DataCheck = False) then System.Exit;

     AllDataSave;//(Panel4);// 데이타를 저장한다..
     ClearDataField;
     KeyClick(Sender);
     empno.SetFocus;
     C_RunSave := 1;

     RunSaveClick(Sender);
   end; {else end}
end;
//------------------------------------------------------------------------------
// 데이타 체크
//------------------------------------------------------------------------------
function Tpia1010aForm.DataCheck : Boolean;
var
  i : integer;
begin
   for i := 0 to ComponentCount - 1 do
   begin
      if (TObject(components[i]) is TPanel) then
          if copy(TPanel(components[i]).Name,1,1) = 'N' then

             if TPanel(components[i]).Caption = '코드에러' then
             begin
                //showmessage(TPanel(components[i]).Name);
                MessageBox(handle,'코드에러가 발생했습니다..','경 고',$0010);
                system.exit;
             end;
   end;
   if DateMaxMin(actpayfrdate.Text,actpaytodate.Text) = False then
   begin
      MessageBox(handle,'직무대행일은 From <= To 조건에 맞아야 합니다..','경 고',$0010);
      actpaytodate.SetFocus;
      DataCheck := False;
      System.Exit;
   end;

   if  (trim(Country.Text) = '' ) then
   begin
      MessageBox(handle,'국적자료는 필수입니다..','경 고',$0010);
      DataCheck := False;
      System.Exit;
   end;

   if  ( trim(curaddr.Text) <> '' ) and
       ((zipno.Text = '   -   ' ) or (trim(curnation.Text) = '') or (trim(curregion.Text) = '')) then
   begin
      MessageBox(handle,'실거주지의 주소를 입력한 경우 실거주지의 우편번호,국가,지역 자료는 필수입니다..','경 고',$0010);
      DataCheck := False;
      System.Exit;
   end;

   if  ( trim(juminaddr.Text) <> '' ) and
       ((juminzip.Text = '   -   ' ) or (trim(nation.Text) = '') or (trim(region.Text) = '') )then
   begin
      MessageBox(handle,'주민등록지의 주소를 입력한 경우 주민등록지의 우편번호,국가,지역 자료는 필수입니다..','경 고',$0010);
      DataCheck := False;
      System.Exit;
   end;

   if  ( trim(hoguaddr.Text) <> '' ) and
       ((trim(nation.Text) = '') or (trim(region.Text) = '')) then
   begin
      MessageBox(handle,'호구소재지의 주소를 입력한 경우 호구소재지의 국가,지역 자료는 필수입니다..','경 고',$0010);
      DataCheck := False;
      System.Exit;
   end;

   DataCheck := True;
end;

//------------------------------------------------------------------------------
procedure Tpia1010aForm.KeyClick(Sender : TObject);
begin
   EnterKey       := False;
   ClearDataField;
   save.Caption   := '실행';
   Save.Glyph     := nil;
   ImageList1.GetBitmap(0, Save.Glyph);
   Cancel.Enabled := False;
end;
//------------------------------------------------------------------------------
// 데이타필드를 지운다..
//------------------------------------------------------------------------------
procedure Tpia1010aForm.ClearDataField;
var
  i : integer;
begin
   if PageControl1.ActivePage = TabSheet1 then
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (TObject(components[i]) is TMaskEdit) then
         begin
            if (components[i].Name = 'empno') or
               (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
            TmaskEdit(components[i]).Text := '';

            if components[i].Name = 'paygr'  then TmaskEdit(components[i]).Text := FormatFloat('00',0);
            if components[i].Name = 'bcaryy' then bcaryy.Text                   := FormatFloat('00',0);
            if components[i].Name = 'bcarmm' then bcarmm.Text                   := FormatFloat('00',0);
         end;

         if (TObject(components[i]) is TComboBox  ) then TComboBox(components[i]).itemindex := 1;
         if (TObject(components[i]) is TNumberEdit) then TNumberEdit(components[i]).Value   := 0;

         if (TObject(components[i]) is TPanel) then
         begin
            if copy(TPanel(components[i]).Name,1,1) = 'N' then TPanel(components[i]).Caption := '';
            if components[i].name = 'fieldcode'           then fieldcode.caption             := '';
            if components[i].name = 'boncode'             then boncode.caption               := '';
            if components[i].name = 'fincode'             then fincode.caption               := '';
            if components[i].name = 'grpaygrsum'          then grpaygrsum.caption            := ' '+FormatFloat('00',0);
         end;
      end;
   end;
   if PageControl1.ActivePage = TabSheet2 then
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (TObject(components[i]) is TMaskEdit)   then
         begin
            if (components[i].Name = 'empno') or
               (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
            TmaskEdit(components[i]).Text := '';
         end;

         if (TObject(components[i]) is TNumberEdit) then
             TNumberEdit(components[i]).Value := 0;
         if (TObject(components[i]) is TComboBox) then
             TComboBox(components[i]).itemindex := 1;

         if (TObject(components[i]) is TPanel) then
         begin
            if copy(TPanel(components[i]).Name,1,1) = 'N' then
               TPanel(components[i]).Caption := '';
            if components[i].name = 'korage' then
               korage.caption := '00세';
         end;
      end;
      usaage            := '00';
      tage              := '00';
   end;
   if PageControl1.ActivePage = TabSheet3 then
   begin
      for i := 0 to ComponentCount - 1 do begin
          if (TObject(components[i]) is TMaskEdit)   then begin
             if (components[i].Name = 'empno') or
                (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
              TmaskEdit(components[i]).Text := '';
          end;

          if (TObject(components[i]) is TPanel) then begin
              if copy(TPanel(components[i]).Name,1,1) = 'N' then
                 TPanel(components[i]).Caption := '';
          end;
      end;
   end;
   if PageControl1.ActivePage = TabSheet4 then
   begin
      for i := 0 to ComponentCount - 1 do begin
          if (TObject(components[i]) is TMaskEdit)   then begin
             if (components[i].Name = 'empno') or
                (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
              TmaskEdit(components[i]).Text := '';
          end;

          if (TObject(components[i]) is TPanel) then begin
              if copy(TPanel(components[i]).Name,1,1) = 'N' then
                 TPanel(components[i]).Caption := '';
          end;
      end;
   end;
   if PageControl1.ActivePage = TabSheet5 then
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (TObject(components[i]) is TMaskEdit)   then
         begin
            if (components[i].Name = 'empno') or
               (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
               TmaskEdit(components[i]).Text := '';
         end;
         if (TObject(components[i]) is TComboBox) then
             TComboBox(components[i]).itemindex := 1;

         if (TObject(components[i]) is TNumberEdit) then
             TNumberEdit(components[i]).Value := 0;

         if (TObject(components[i]) is TPanel) then
         begin
            if copy(TPanel(components[i]).Name,1,1) = 'N' Then
                 TPanel(components[i]).Caption := '';
         end;
         if Ptjobduty.Visible = True Then
           Ptjobduty.Caption := '';
      end;
   end;
   if PageControl1.ActivePage = TabSheet6 then
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (TObject(components[i]) is TMaskEdit)   then
         begin
            if (components[i].Name = 'empno'  ) or
               (components[i].Name = 'korname') or
               (components[i].Name = 'alias'  ) then continue;
               TmaskEdit(components[i]).Text := '';
         end;
      end;
   end;
   ChangeCheck := True;
end;

procedure Tpia1010aForm.empPicture(image : Timage; emp : string);
var
   stream     : TMemoryStream;
   JPEGImage  : TJPEGImage;
begin
   if trim(emp) = '' then system.Exit;
   image.picture := nil;
   Qphoto.close;
   Qphoto.ParamByName('lempno').AsString := emp;
   Qphoto.Open;

   Try
      stream    := TMemoryStream.Create;
      JPEGImage := TJPEGImage.Create;

      image.picture.Graphic := nil;

      TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
      stream.Position := 0;

      JPEGImage.LoadFromStream(stream);
      if stream.Size <> 0 then
        image.picture.Assign(JPEGImage)
      else begin
        if FileExists(HomeDir+'\pic\사람1.bmp') = True then
          image.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
      end;
      Qphoto.Close;
   Finally
      stream.free;
      JPEGImage.Free;
   end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.Qemp2Display;
begin
   with OraQMas do
   begin
      //------------------------tabsheet1
      korname.Text    := FieldByName('korname').AsString;
      country.Text    := FieldByName('country').AsString;
      Ncountry.Caption:= QCodeDisp('SK03',FieldByName('country').AsString,'',0);
      pstate.Text     := FieldByName('pstate').AsString;
      Npstate.Caption := QCodeDisp('I114',FieldByName('pstate').AsString,'',0);

      if FieldByName('PSTATEYN').AsString = 'Y' then pstateyn.ItemIndex := 0;
      if FieldByName('PSTATEYN').AsString = 'N' then pstateyn.ItemIndex := 1;
      if FieldByName('PSTATEYN').AsString = ''  then pstateyn.ItemIndex := 2;

      paycl.Text	       := FieldByName('paycl').AsString;
      Npaycl.Caption    := QCodeDisp('I112',FieldByName('paycl').AsString,'',0);

      Nemptypecd.Caption := QCodeDisp('I112',FieldByName('paycl').AsString,'',20);
      Nemptypenm.Caption := QCodeDisp('I112',FieldByName('paycl').AsString,'',21);

      rolelevel.Text     := OraQMas.FieldByName('rolelevel').AsString;
      Nrolelevel.Caption := QCodeDisp('SK00',FieldByName('rolelevel').AsString,'',0);
      rolelvdate.Text    := OraQMas.FieldByName('rolelvdate').AsString;

      paygr.Text	 := FormatFloat('00',FieldByName('paygr').AsFloat);
      deptcode.Text     := FieldByName('deptcode').AsString;
      orgnum.Text	:= FieldByName('orgnum').AsString;
      Ndeptcode.Caption := QDeptDisp(deptcode.Text,orgnum.Text,1);  //QDeptDisp rtn go(shm)
      Njikgroup.Caption := QDeptDisp(deptcode.Text,orgnum.Text,4);  //직무그룹 추가 2001.12.17 shm
      fieldcode.Caption := QDeptVal[1];   //2000.11.09 shm
      Nfieldcode.Caption:= QDeptDisp(fieldcode.Caption,orgnum.Text,3);
      jobdept.Text      := FieldByName('jobdept').AsString;
      Njobdept.Caption  := QDeptDisp(jobdept.Text,orgnum.Text,1);

      payra.Text        := FieldByName('payra').AsString;
      Npayra.Caption    := QCodeDisp('I113',FieldByName('payra').AsString,'',0);
      jobpayra.Text     := FieldByName('jobpayra').AsString;                    //31.08  2001.08.20 shm 추가
      Njobpayra.Caption := QCodeDisp('I113',FieldByName('jobpayra').AsString,'',0);  //31.08  2001.08.20 shm 추가

      paydunm.Text      := FieldByName('PAYDUNM').AsString;
      realtrdate.Text   := FieldByName('REALTRDATE').AsString;
      offtrdate.Text    := FieldByName('OFFTRDATE').AsString;

      if FieldByName('PAYRAYN').AsString = 'Y' then payrayn.Itemindex := 0;
      if FieldByName('PAYRAYN').AsString = 'N' then payrayn.Itemindex := 1;
      if FieldByName('PAYRAYN').AsString = ''  then payrayn.Itemindex := 2;

      if FieldByName('jobPAYRAYN').AsString = 'Y' then jobpayrayn.Itemindex := 0;     //31.08  2001.08.27 shm 추가
      if FieldByName('jobPAYRAYN').AsString = 'N' then jobpayrayn.Itemindex := 1;
      if FieldByName('jobPAYRAYN').AsString = ''  then jobpayrayn.Itemindex := 2;

      imwondate.Text      := FieldByName('IMWONDATE').AsString;
      cpayradate.Text     := FieldByName('CPAYRADATE').AsString;
      jobplace.Text       := FieldByName('JOBPLACE').AsString;
      Njobplace.Caption   := QCodeDisp('I160',FieldByName('JOBPLACE').AsString,'',0);

      NplaceNation.Caption:= QCodeDisp('SK03',FieldByName('Nation').AsString,'',0);   //dsa2000  2013.10.

      empdate.Text      := FieldByName('EMPDATE').AsString;
      orgempdate.Text	:= FieldByName('orgEMPDATE').AsString;
      groupempdate.Text	:= FieldByName('GROUPEMPDATE').AsString;
      groupcompany.Text	:= FieldByName('GROUPCOMPANY').AsString;
      cpaycldate.Text   := FieldByName('CPAYCLDATE').AsString;
      paycldate.Text    := FieldByName('PAYCLDATE').AsString;
      old_paycldate.Text:= FieldByName('OLD_PAYCLDATE').AsString;//정규용 추가
      reppaycl.Text     := FieldByName('REPPAYCL').AsString;
      Nreppaycl.Caption := QCodeDisp('I112',FieldByName('REPPAYCL').AsString,'',0);

      reppayfrdate.Text := FieldByName('REPPAYFRDATE').AsString;
      repaytodate.Text  := FieldByName('REPPAYTODATE').AsString;
      apdpaydunm.Text   := FieldByName('APDPAYDUNM').AsString;
      apdpayfrdate.Text := FieldByName('APDPAYFRDATE').AsString;
      apdpaytodate.Text := FieldByName('APDPAYTODATE').AsString;
      actpaydunm.Text   := FieldByName('ACTPAYDUNM').AsString;
      actpayfrdate.Text := FieldByName('ACTPAYFRDATE').AsString;
      actpaytodate.Text := FieldByName('ACTPAYTODATE').AsString;
      lragrdate.Text    := FieldByName('LRAGRDATE').AsString;
      remark.Text	      := FieldByName('REMARK').AsString;
      Nremark.Caption   := QCodeDisp('I040',FieldByName('REMARK').AsString,'',0);

      empcode.Text	     := FieldByName('EMPCODE').AsString;
      Nempcode.Caption  := QCodeDisp('I101',FieldByName('EMPCODE').AsString,'',0);

      empterm.Text	    := FieldByName('EMPTERM').AsString;
      empschgr.Text     := FieldByName('EMPSCHGR').AsString;
      Nempschgr.Caption := QCodeDisp('I221',FieldByName('EMPSCHGR').AsString,'',0);

      emppaycl.Text     := FieldByName('EMPPAYCL').AsString;
      Nemppaycl.Caption := QCodeDisp('I112',FieldByName('EMPPAYCL').AsString,'',0);

      emppaygr.value    := FieldByName('EMPPAYGR').AsFloat;
      armypaygr.value   := FieldByName('ARMYPAYGR').AsFloat;
      maspaygr.value    := FieldByName('MASPAYGR').AsFloat;
      carpaygr.value    := FieldByName('CARPAYGR').AsFloat;
      etcpaygr.value    := FieldByName('ETCPAYGR').AsFloat;
      grpaygrsum.Caption:= ' '+FormatFloat('#00',FieldByName('GRPAYGRSUM').AsFloat);
      etcpaycont.Text   := FieldByName('ETCPAYCONT').AsString;
      bcaryy.Text	:= FormatFloat('00',FieldByName('BCARYY').AsFloat);
      bcarmm.Text	:= FormatFloat('00',FieldByName('BCARMM').AsFloat);
      cardate.Text	:= FieldByName('CARDATE').AsString;

      //------------------------tabsheet2
       jobgun.Text	 := FieldByName('JOBGUN').AsString;
       Njobgun.Caption   := pia1010aForm.QCodeDisp('I115',jobgun.Text,'',0);

       jobgundate.Text   := FieldByName('JOBGUNDATE').AsString;
       jobline.Text	    := FieldByName('JOBLINE').AsString;

       joblinedate.Text  := FieldByName('JOBLINEDATE').AsString;
       jobkind.Text	 := FieldByName('JOBKIND').AsString;

       Njobkind.Caption  := pia1010aForm.QJobKindDisp(jobkind.Text);
       jobkinddate.Text  := FieldByName('JOBKINDDATE').AsString;
       jobduty.Text	    := FieldByName('JOBDUTY').AsString;
       Njobduty.Caption  := pia1010aForm.QCodeDisp('I???',jobduty.Text,'',0);
       jobdutydate.Text  := FieldByName('JOBDUTYDATE').AsString;
       EHyunChasu.Text   := HyunChasu;
       nogubun.Text	    := FieldByName('NOGUBUN').AsString;
       Nnogubun.Caption  := pia1010aForm.QCodeDisp('I120',nogubun.Text,'',0);

       if (nogubun.Text >= '30') and (nogubun.Text <= '5A') then
          nojoYN.ItemIndex := 0
       else
          nojoYN.ItemIndex := 1;

       if FieldByName('NOJEONYN').AsString = 'Y' then nojeonyn.ItemIndex := 0;
       if FieldByName('NOJEONYN').AsString = 'N' then nojeonyn.ItemIndex := 1;
       if FieldByName('NOJEONYN').AsString = ''  then nojeonyn.ItemIndex := 2;
       nojnfrdate.Text   := FieldByName('NOJNFRDATE').AsString;
       nojntodate.Text   := FieldByName('NOJNTODATE').AsString;
       lancode.Text	    := FieldByName('LANCODE').AsString;
       Nlancode.Caption  := pia1010aForm.QCodeDisp('I300',lancode.Text,'',0);
       lannono.Text      := FieldByName('LANNONO').AsString;
       lanfrdate.Text    := FieldByName('LANFRDATE').AsString;
       lantodate.Text    := FieldByName('LANTODATE').AsString;
       exdutcnt.Text     := FormatFloat('00',FieldByName('EXDUTCNT').AsFloat);
       exdutyy.Text	    := FormatFloat('00',FieldByName('EXDUTYY').AsFloat);
       exdutmm.Text	    := FormatFloat('00',FieldByName('EXDUTMM').AsFloat);
       exdutdd.Text	    := FormatFloat('00',FieldByName('EXDUTDD').AsFloat);
       lexfrdate.Text    := FieldByName('LEXFRDATE').AsString;
       lextodate.Text    := FieldByName('LEXTODATE').AsString;
       lexduyy.Caption   := FormatFloat('00',FieldByName('LEXDUYY').AsFloat);
       lexdumm.Caption   := FormatFloat('00',FieldByName('LEXDUMM').AsFloat);
       lexdudd.Caption   := FormatFloat('00',FieldByName('LEXDUDD').AsFloat);
       payclyy.Text	    := FormatFloat('00',FieldByName('PAYCLYY').AsFloat);
       payclmm.Text	    := FormatFloat('00',FieldByName('PAYCLMM').AsFloat);
       paycldd.Text	    := FormatFloat('00',FieldByName('PAYCLDD').AsFloat);
       comduyy.Text	    := FormatFloat('00',FieldByName('COMDUYY').AsFloat);
       comdumm.Text	    := FormatFloat('00',FieldByName('COMDUMM').AsFloat);
       comdudd.Text	    := FormatFloat('00',FieldByName('COMDUDD').AsFloat);
       chnname.Text	    := FieldByName('CHNNAME').AsString;
       engname.Text	    := FieldByName('ENGNAME').AsString;
       if FieldByName('ELDSONYN').AsString = 'Y' then  eldsonyn.Itemindex := 0;
       if FieldByName('ELDSONYN').AsString = 'N'  then eldsonyn.Itemindex := 1;
       if FieldByName('ELDSONYN').AsString = ''   then eldsonyn.Itemindex := 2;
       if FieldByName('MARRIGEYN').AsString = 'Y' then marrigeyn.Itemindex := 0;
       if FieldByName('MARRIGEYN').AsString = 'N' then marrigeyn.Itemindex := 1;
       if FieldByName('MARRIGEYN').AsString = ''  then marrigeyn.Itemindex := 2;

       juminid.Text	    := FieldByName('JUMINID').AsString;
      korage.caption    := FormatFloat('00',FieldByName('USAAGE').AsFloat)+' 세';
      usaage            := FormatFloat('00',FieldByName('usaage').AsFloat);
      sex.Text	        := FieldByName('SEX').AsString;
      Nsex.Caption	    := pia1010aForm.QCodeDisp('I039',sex.Text,'',0);

      E_mail.Text	    := FieldByName('E_MAIL').AsString;
      SKemail.Text	    := FieldByName('SKEMAIL').AsString;

      holdname.Text     := FieldByName('HOLDNAME').AsString;
      holdrel.Text	    := FieldByName('HOLDREL').AsString;
      Nholdrel.Caption  := pia1010aForm.QCodeDisp('I211',holdrel.Text,'',0);
      housetype.Text    := FieldByName('HOUSETYPE').AsString;
      Nhousetype.Caption:= pia1010aForm.QCodeDisp('I021',housetype.Text,'',0);
      health.Text	      := FieldByName('HEALTH').AsString;
      Nhealth.Caption   := pia1010aForm.QCodeDisp('I502',health.Text,'',0);

      bornarea.Text         := FieldByName('BORNAREA').AsString;
      Nbornarea.Caption     := pia1010aForm.QCodeDisp('I001',bornarea.Text,'',0);
      regaddr.Text	    := FieldByName('REGADDR').AsString;
      curaddr.Text	    := FieldByName('CURADDR').AsString;
      zipno.Text	    := FieldByName('ZIPNO').AsString;

      curnation.Text        := FieldByName('CURNATION').AsString;
      Ncurnation.Caption    := pia1010aForm.QCodeDisp('SK03',curnation.Text,'',0);
      curregion.Text        := FieldByName('CURREGION').AsString;
      Ncurregion.Caption    := pia1010aForm.QCodeDisp('SK04',curregion.Text,curnation.Text,0);

      nation.Text           := FieldByName('NATION').AsString;
      Nnation.Caption       := pia1010aForm.QCodeDisp('SK03',nation.Text,'',0);
      region.Text           := FieldByName('REGION').AsString;
      Nregion.Caption       := pia1010aForm.QCodeDisp('SK04',region.Text,nation.Text,0);
      if (nation.Text = 'KR') or (nation.Text = 'US') then
      begin
           juminaddr.Text      := FieldByName('ADDRESS').AsString;
           juminzip.Text       := FieldByName('POSTNO').AsString;
           hoguaddr.Text       := '';
           hoguzip.Text	       := '';
           juminzip.Enabled    := True;
           BN_juminzip.Enabled := True;
           juminaddr.Enabled   := True;
           Hoguaddr.Enabled    := False;
           Hoguzip.Enabled     := False;
      end
      else if nation.Text = 'CN' then
      begin
           juminaddr.Text      := '';
           juminzip.Text       := '';
           hoguaddr.Text       := FieldByName('ADDRESS').AsString;
           hoguzip.Text	       := FieldByName('POSTNO').AsString;
           juminzip.Enabled    := False;
           BN_juminzip.Enabled := False;
           juminaddr.Enabled   := False;
           Hoguaddr.Enabled    := True;
           Hoguzip.Enabled     := True;
      end
      else
      begin
           juminaddr.Text      := '';
           juminzip.Text       := '';
           hoguaddr.Text       := '';
           hoguzip.Text	       := '';
           juminzip.Enabled    := False;
           BN_juminzip.Enabled := False;
           juminaddr.Enabled   := False;
           Hoguaddr.Enabled    := False;
           Hoguzip.Enabled     := False;
      end;

      telno.Text	    := FieldByName('TELNO').AsString;
      offitel.Text	    := FieldByName('OFFITEL').AsString;
      religion.Text         := FieldByName('RELIGION').AsString;
      Nreligion.Caption     := pia1010aForm.QCodeDisp('I002',religion.Text,'',0);
      habit.Text	    := FieldByName('HABIT').AsString;
      ability.Text	    := FieldByName('ABILITY').AsString;
      blood.Text	    := FieldByName('BLOOD').AsString;
      height.value	    := FieldByName('HEIGHT').AsFloat;
      weight.value	    := FieldByName('WEIGHT').AsFloat;
      //--------------------------tabsheet3
      armykind.Text	    := FieldByName('armykind').AsString;
      Narmykind.Caption     := pia1010aForm.QCodeDisp('I031',armykind.Text,'',0);
      armycl.Text	    := FieldByName('armycl').AsString;
      Narmycl.Caption       := pia1010aForm.QCodeDisp('I034',armycl.Text,'',0);
      armyfield.Text        := FieldByName('armyfield').AsString;
      Narmyfield.Caption    := pia1010aForm.QCodeDisp('I035',armyfield.Text,'',0);
      armyfrdate.Text       := FieldByName('armyfrdate').AsString;
      armytodate.Text       := FieldByName('armytodate').AsString;
      armydis.Text	    := FieldByName('armydis').AsString;
      Narmydis.Caption      := pia1010aForm.QCodeDisp('I036',armydis.Text,'',0);
      armyex.Text	    := FieldByName('armyex').AsString;
      Narmyex.Caption       := pia1010aForm.QCodeDisp('I037',armyex.Text,'',0);

      lschgr.Text	    := FieldByName('lschgr').AsString;
      Nlschgr.Caption       := pia1010aForm.QCodeDisp('I221',lschgr.Text,'',0);
      lschdeg.Text	    := FieldByName('lschdeg').AsString;
      Nlschdeg.Caption      := pia1010aForm.QCodeDisp('I221',lschdeg.Text,'',0);
      lschcode.Text	    := FieldByName('lschcode').AsString;
      lschnm.Text	    := FieldByName('lschnm').AsString;
      lschfrym.Text	    := FieldByName('lschfrym').AsString;
      lschgrym.Text	    := FieldByName('lschgrym').AsString;
      lmajorcode.Text       := FieldByName('lmajorcode').AsString;
      Nlmajorcode.Caption   := pia1010aForm.QCodeDisp('I225',lmajorcode.Text,'',0);
      unicode.Text	    := FieldByName('unicode').AsString;
      Nunicode.Caption      := pia1010aForm.QCodeDisp('I223',unicode.Text,'',0);
      unimajor.Text	    := FieldByName('unimajor').AsString;
      Nunimajor.Caption     := pia1010aForm.QCodeDisp('I225',unimajor.Text,'',0);
      unifrym.Text	    := FieldByName('unifrym').AsString;
      unigrym.Text	    := FieldByName('unigrym').AsString;
      lschmajnm.Text        := FieldByName('lschmajnm').AsString;
      lschtopic.Text        := FieldByName('lschtopic').AsString;
      lickind.Text	    := FieldByName('lickind').AsString;
      Nlickind.Caption      := pia1010aForm.QCodeDisp('I231',lickind.Text,'',0);      

      Nliccd.Caption        := pia1010aForm.QCodeDisp('I231',lickind.Text,'',10);
      Nlicnm.Caption        := pia1010aForm.QCodeDisp('I231',lickind.Text,'',11);

      licgr.Text	    := FieldByName('licgr').AsString;
      Nlicgr.Caption       := pia1010aForm.QCodeDisp('I232',licgr.Text,'',0);
      licgetdate.Text      := FieldByName('licgetdate').AsString;
      licalkind.Text       := FieldByName('licalkind').AsString;
      Nlicalkind.Caption   := pia1010aForm.QCodeDisp('I231',licalkind.Text,'',0);
      licalgr.Text	   := FieldByName('licalgr').AsString;
      Nlicalgr.Caption     := pia1010aForm.QCodeDisp('I232',licalgr.Text,'',0);
      licalgetdate.Text    := FieldByName('licalgetdate').AsString;
      licalfield.Text      := FieldByName('licalfield').AsString;
      licaldate.Text       := FieldByName('licaldate').AsString;
      licbigo.Text	   := FieldByName('licbigo').AsString;
      publish.Text	   := FieldByName('publish').AsString;


      toeicscore.Text      := formatFloat('0000',FieldByName('toeicscore').AsFloat);
      toeicfull.Text       := formatFloat('0000',FieldByName('toeicfull').AsFloat);
      toeicdate.Text       := FieldByName('toeicdate').AsString;
      jptscore.Text	    := formatFloat('0000',FieldByName('jptscore').AsFloat);
      jptfull.Text	    := formatFloat('0000',FieldByName('jptfull').AsFloat);
      jptdate.Text	    := FieldByName('jptdate').AsString;

      langtype.caption	    := FieldByName('langtype').AsString;
      Nlangtype.Caption     := pia1010aForm.QCodeDisp('SK10',langtype.caption,'',0);
      examtype.caption	    := FieldByName('examtype').AsString;
      Nexamtype.Caption     := pia1010aForm.QCodeDisp('SK11',examtype.caption,'',0);
      Nlangname.Caption     := FieldByName('langname').AsString;
      Nexamdate.Caption     := Copy(FieldByName('examdate').AsString,1,4)+'-'+
                               Copy(FieldByName('examdate').AsString,5,2)+'-'+
                               Copy(FieldByName('examdate').AsString,7,2) ;


     //--------------------------tabsheet4
      edugubun.Text	    := FieldByName('edugubun').AsString;
      Nedugubun.Caption     := pia1010aForm.QCodeDisp('I601',edugubun.Text,'',0);
      eduplace.Text	    := FieldByName('eduplace').AsString;
      edufrdate.Text        := FieldByName('edufrdate').AsString;
      edutodate.Text        := FieldByName('edutodate').AsString;
      educourse.Text        := FieldByName('educourse').AsString;
      eduarea.Text	    := FieldByName('eduarea').AsString;
      educont.Text	    := FieldByName('educont').AsString;
      edudufrdate.Text      := FieldByName('edudufrdate').AsString;
      edudutodate.Text      := FieldByName('edudutodate').AsString;

      lrkind.Text	    := FieldByName('lrkind').AsString;
      Nlrkind.Caption       := pia1010aForm.QCodeDisp('I310',lrkind.Text,'',0);
      lrfrdate.Text	    := FieldByName('lrfrdate').AsString;
      lrtodate.Text	    := FieldByName('lrtodate').AsString;
      lvfrdate.Text	    := FieldByName('lvfrdate').AsString;
      lvtodate.Text	    := FieldByName('lvtodate').AsString;

      lsekind.Text	    := FieldByName('lsekind').AsString;
      Nlsekind.Caption      := pia1010aForm.QCodeDisp('I310',lsekind.Text,'',0);
      lsefrdate.Text        := FieldByName('lsefrdate').AsString;
      lsetodate.Text        := FieldByName('lsetodate').AsString;
      lseplace.Text	    := FieldByName('lseplace').AsString;
      lsesayu.Text	    := FieldByName('lsesayu').AsString;
      lsecont.Text	    := FieldByName('lsecont').AsString;

      hugubun.Text          := FieldByName('hugubun').AsString;
      Nhugubun.Caption      := pia1010aForm.QCodeDisp('I320',hugubun.Text,'',0);
      hufrdate.Text         := FieldByName('hufrdate').AsString;
      hutodate.Text         := FieldByName('hutodate').AsString;
      retdate.Text          := FieldByName('retdate').AsString;
      retgubun.Text         := FieldByName('retgubun').AsString;
      Nretgubun.Caption     := pia1010aForm.QCodeDisp('I310',retgubun.Text,'',0);
      retsayu1.Text         := FieldByName('retsayu1').AsString;
      Nretsayu1.Caption     := pia1010aForm.QCodeDisp('I141',retsayu1.Text,'',0);
      retsayu2.Text         := FieldByName('retsayu2').AsString;
      Nretsayu2.Caption     := pia1010aForm.QCodeDisp('I142',retsayu2.Text,'',0);
      retcont.Text          := FieldByName('retcont').AsString;
      ///retretcont.Text       := FieldByName('retcont').AsString;

      //---------------------------------Tabsheet5
       {계약직 사원만 계약금액란이 보인다.}  //30.03
      if (copy(empno.Text,1,1) = 'P') or (copy(empno.Text,1,1) = 'Q') or (copy(empno.Text,1,1) = 'Y') then
      begin
         tcontramt.Visible := True;

         //30.07 -> 2000.11.16 shm 계약직도 직무코드 입력할수 있게.
         if (copy(empno.Text,1,1) = 'Y') or (copy(empno.Text,1,1) = 'P') or (copy(empno.Text,1,1) = 'Q') then
         begin
            Ptjobduty.Visible := True;
            tjobduty.Width := 24;
            tjobduty.MaxLength := 2;
         end
         else
         begin
            Ptjobduty.Visible := False;
            tjobduty.Width := 185;
            tjobduty.MaxLength := 0;
         end;
      end
      else
      begin
         tcontramt.Visible := False;
         Ptjobduty.Visible := False;
         tjobduty.Width := 185;
         tjobduty.MaxLength := 0;
      end;

      korname.Text     := FieldByName('KORNAME').AsString;
      obskind.Text     := FieldByName('obskind').AsString;
      Nobskind.Caption := pia1010aForm.QCodeDisp('I012',obskind.Text,'',0);
      obsgr.Text       := FieldByName('obsgr').AsString;
      Nobsgr.Caption   := pia1010aForm.QCodeDisp('I011',obsgr.Text,'',0);
      obsstate.Text    := FieldByName('obsstate').AsString;
      bohungubun.Text    := FieldByName('bohungubun').AsString;
      Nbohungubun.Caption:= pia1010aForm.QCodeDisp('I015',bohungubun.Text,'',0);
      bohunnm.Text	    := FieldByName('bohunnm').AsString;
      bohunrel.Text	    := FieldByName('bohunrel').AsString;
      Nbohunrel.Caption  := pia1010aForm.QCodeDisp('I211',bohunrel.Text,'',0);
      bohunno.Text	    := FieldByName('bohunno').AsString;
      bohunbran.Text     := FieldByName('bohunbran').AsString;
      if FieldByName('BOHUNYN').AsString = 'Y' then bohunyn.ItemIndex := 0;
      if FieldByName('BOHUNYN').AsString = 'N' then bohunyn.ItemIndex := 1;
      if FieldByName('BOHUNYN').AsString = ''  then bohunyn.ItemIndex := 2;
      scgubun.Text	    := FieldByName('scgubun').AsString;
      Nscgubun.Caption   := pia1010aForm.QCodeDisp('I016',scgubun.Text,'',0);
      scentdate.Text     := FieldByName('scentdate').AsString;
      scpredate.Text     := FieldByName('scpredate').AsString;
      scenddate.Text     := FieldByName('scenddate').AsString;
      if FieldByName('sctermyn').AsString =  'Y' then sctermyn.ItemIndex := 0;
      if FieldByName('sctermyn').AsString =  'N' then sctermyn.ItemIndex := 1;
      if FieldByName('sctermyn').AsString =  ''  then sctermyn.ItemIndex := 2;

      sceyy.Text	    := FormatFloat('00',FieldByName('scexyy').AsFloat);
      scemm.Text	    := FormatFloat('00',FieldByName('scexmm').AsFloat);
      scedd.Text	    := FormatFloat('00',FieldByName('scexdd').AsFloat);
      scsayu.Text	    := FieldByName('scexcause').AsString;

      otdufrdate.Text  := FieldByName('otdufrdate').AsString;
      otdutodate.Text  := FieldByName('otdutodate').AsString;
      tpaygr.value     := FieldByname('paygr').AsFloat;
      tcontr.Text      := FieldByName('tcontr').AsString;
      Ntcontr.Caption  := pia1010aForm.QCodeDisp('I901',tcontr.Text,'',0);

      tcontramt.value  := FieldByName('tcontramt').AsFloat;
      ttype.Text       := FieldByName('ttype').AsString;
      tjobduty.Text    := FieldByName('tjobduty').AsString;
      tdutyclass.Text  := FieldByName('tdutyclass').AsString;
      Ptjobduty.Caption   := pia1010aForm.QCodeDisp('I702',tjobduty.Text,'',0);
      Ntdutyclass.Caption := pia1010aForm.QCodeDisp('I703',tdutyclass.Text,'',0);
      tcond.Text          := FieldByName('tcond').AsString;
      tcompany.Text       := FieldByName('tcompany').AsString;
      Ntcompany.Caption   := pia1010aForm.Qcodedisp('I902',trim(FieldByName('tcompany').AsString),'',0);

      ////tabsheet6
      ed_empno.Text      := FieldByName('empno').AsString;
      ed_korname.Text    := FieldByName('korname').AsString;
      ed_juminid.Text    := FieldByName('juminid').AsString;
      ed_skemail.Text    := FieldByName('skemail').AsString;



      birthday.Text	:= FieldByName('birthday').AsString;
      if FieldByName('birthgubun').AsString = '양력' then birthgubun.Itemindex := 0;     //jissi
      if FieldByName('birthgubun').AsString = '음력' then birthgubun.Itemindex := 1;      
   end;
   OraQMas.Close;
   ChangeCheck := True;
end;
//------------------------------------------------------------------------------
//입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..
//------------------------------------------------------------------------------
function Tpia1010aForm.QDeptDisp(s1,s2 : String; gubun : integer) : String;
begin
   if trim(s1) = '' then
   begin
        QDeptDisp  := '';
        System.Exit;
   end;

   with OraQuery1 do
   begin
        Close;
        sql.clear;
        sql.add('select orgnum,deptcode,fincode,                          ');
        sql.add('       deptname,placecode,sectcode,                      ');
        sql.add('       fieldcode,boncode,existon,deptna3,deptna1,deptna2 ');
        sql.add('  from pycdept                                           ');
        sql.add(Format('where (deptcode = RPAD(''%s'','+DEPTCDLEN+',''0'') and orgnum = ''%s'')',[s1,s2] ));
        Open;
        if RecordCount > 0 then
        begin
           QDeptVal[1]       := FieldByName('fieldcode').AsString;
           QDeptVal[2]       := FieldByName('placecode').AsString;

           if gubun = 1 then
           begin
              Boncode.Caption   := FieldByName('boncode').AsString;
              fincode.Caption   := FieldByName('fincode').AsString;
              if   FieldByName('existon').AsString <> '1' then  QDeptDisp  := '코드에러'
              else                                              QDeptDisp  := FieldByName('DEPTNA1').AsString
                                                                            + ' '
                                                                            + FieldByName('DEPTNA2').AsString;
           end;
           if gubun = 2 then jobplace.Text := QdeptVal[2];
           if gubun = 3 then QDeptDisp     := FieldByName('DEPTNAME').AsString;
           if gubun = 4 then QDeptDisp     := FieldByName('DEPTNA3').AsString;

        end else QDeptDisp  := '코드에러';
        close;
   end;
end;
//------------------------------------------------------------------------------
// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..
//------------------------------------------------------------------------------
function Tpia1010aForm.QCodeDisp(s1,s2,s3 : String; gubun : integer) : String;
var
  str : string;
begin
   if trim(s2) = '' then
   begin
      QcodeDisp := '';
      system.exit;
   end;

   if FreeCheck = False then
   begin
      with OraQuery1 do
      begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT CODEID, CODENO, CODENAME                    ');
           Sql.Add('      ,GROUPCODE, GROUPCODENAME                    ');
           Sql.Add('      ,GROUPCODE2, GROUPCODENAME2                  ');
           Sql.Add('      ,NATIONCD                                    ');
           Sql.Add('      ,(select codename from pyccode               ');
           Sql.Add('          where codeid =''SK03''                   ');
           Sql.Add('            and codeno = a.nationcd) NATIONCDNAME  ');
           Sql.Add('  FROM PYCCODE a                                   ');
           Sql.Add(' WHERE CODEID = :Lcodeid                           ');
           Sql.Add('   AND CODENO = :Lcodesub                          ');
           Sql.Add('   AND NVL(NATIONCD, '' '') like :lnationcd||''%'' ');
           Parambyname('lcodeid').AsString   := s1;
           Parambyname('lcodesub').AsString  := s2;
           Parambyname('lnationcd').AsString := s3;
           Open;
           Case gubun of
               0 : if trim(FieldByName('CodeName').AsString) = ''  then QcodeDisp := '코드에러'
                   else QCodeDisp := FieldByName('CodeName').AsString;
              10 : QCodeDisp := FieldByName('GroupCode').AsString;
              11 : QCodeDisp := FieldByName('GroupCodeName').AsString;
              20 : QCodeDisp := FieldByName('GroupCode2').AsString;
              21 : QCodeDisp := FieldByName('GroupCodeName2').AsString;
              30 : QCodeDisp := FieldByName('NATIONCD').AsString;
              31 : QCodeDisp := FieldByName('NATIONCDNAME').AsString;
           end;
           close;
      end;
   end else
   begin
      if trim(str) = '' then QcodeDisp := '코드에러'
      else                   QcodeDisp := str;
   end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.KeyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   KeyClick(Sender);
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataFieldChange(Sender: TObject);
begin
  ChangeCheck := False;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataFieldClick(Sender: TObject);
begin
   C_RunSave := 1;
   if save.Caption = '실행' then  RunSaveClick(Sender);
end;
//------------------------------------------------------------------------------
// 코드명 열람부분
//------------------------------------------------------------------------------
procedure Tpia1010aForm.CodeClick(Sender: TObject);
begin
   codeForm := TCodeForm.Create(self);
   Try
      if PageControl1.ActivePage = Tabsheet1 then
      begin
         case TComponent(Sender).Tag of
            1 : begin
                   codeForm.FormData := '인사상태코드 열람';
                   codeForm.DataVal1  := 'I114';
                end;
      3,18,32 : begin
                   codeForm.FormData := 'BAND코드 열람';
                   codeForm.DataVal1  := 'I112';
                end;
         8,44 : begin
                   codeForm.FormData := '직책코드 열람';
                   codeForm.DataVal1  := 'I113';
                end;
           5  : begin
                   codeForm.FormData := '근무지코드 열람';
                   codeForm.DataVal1  := 'I160';
                end;
           50 : begin
                   codeForm.FormData := 'Role Level 열람';
                   codeForm.DataVal1  := 'SK00';
                end;
           28 : begin
                   codeForm.FormData := '특기사항코드 열람';
                   codeForm.DataVal1  := 'I040';
                end;
           29 : begin
                   codeForm.FormData := '채용원천코드 열람';
                   codeForm.DataVal1  := 'I101';
                end;
           31 : begin
                   codeForm.FormData := '입사학력코드 열람';
                   codeForm.DataVal1  := 'I221';
                end;

         end;
         codeForm.ShowModal;
         if CodeForm.Code = '' then System.Exit;
         TmaskEdit(Sender).Text := CodeForm.Code;
         case TComponent(Sender).Tag of
            1 : Npstate.Caption    := CodeForm.CodeName;
            3 : Npaycl.Caption     := CodeForm.CodeName;
            8 : Npayra.Caption     := CodeForm.CodeName;
            44: Njobpayra.Caption  := CodeForm.CodeName;
            5 : Njobplace.Caption  := CodeForm.CodeName;
            50: Nrolelevel.Caption := CodeForm.CodeName;
            18: Nreppaycl.Caption  := CodeForm.CodeName;
            28: Nremark.Caption    := CodeForm.CodeName;
            29: Nempcode.Caption   := CodeForm.CodeName;
            31: Nempschgr.Caption  := CodeForm.CodeName;
            32: Nemppaycl.Caption  := CodeForm.CodeName;
          end; {case end}
      end;
       if PageControl1.ActivePage = Tabsheet2 then
       begin
          case TComponent(Sender).Tag of
             1 : begin
                 codeForm.FormData := '직군코드 열람';
                 codeForm.DataVal1 := 'I115';
                 end;
             5 : begin
                 codeForm.FormData := '직종코드 열람';
                 codeForm.DataVal1 := 'jobkind';
                 end;
             7 : begin
                 codeForm.FormData := '직무코드 열람';
                 codeForm.DataVal1 := 'I???';
                 end;
             9 : begin
                 codeForm.FormData := '노조원 구분코드 열람';
                 codeForm.DataVal1 := 'I120';
                 end;
            13 : begin
                 codeForm.FormData := '최종발령구분 열람';
                 codeForm.DataVal1 := 'I300';
                 end;
            34 : begin
                 codeForm.FormData := '성별코드 열람';
                 codeForm.DataVal1 := 'I039';
                 end;
            36 : begin
                 codeForm.FormData := '호주와의 관계코드 열람';
                 codeForm.DataVal1 := 'I211';
                 end;
            37 : begin
                 codeForm.FormData := '주거형태 코드 열람';
                 codeForm.DataVal1 := 'I021';
                 end;
            38 : begin
                 codeForm.FormData := '건강상태코드 열람';
                 codeForm.DataVal1 := 'I502';
                 end;
            40 : begin
                 codeForm.FormData := '출생지코드 열람';
                 codeForm.DataVal1 := 'I001';
                 end;
            45 : begin
                 codeForm.FormData := '종교코드 열람';
                 codeForm.DataVal1 := 'I002';
                 end;
           end; {case end}

           codeForm.ShowModal;
           if CodeForm.Code = '' then System.Exit;
           TmaskEdit(Sender).Text := CodeForm.Code;
           case TComponent(Sender).Tag of
              1 : Njobgun.Caption  := CodeForm.CodeName;
              5 : Njobkind.Caption := CodeForm.CodeName;
              7 : Njobduty.Caption := CodeForm.CodeName;
              9 : Nnogubun.Caption := CodeForm.CodeName;
              13: Nlancode.Caption := CodeForm.CodeName;
              34: Nsex.Caption     := CodeForm.CodeName;
              36: Nholdrel.Caption := CodeForm.CodeName;
              37: Nhousetype.Caption := CodeForm.CodeName;
              38: Nhealth.Caption    := CodeForm.CodeName;
              40: Nbornarea.Caption  := CodeForm.CodeName;
              45: Nreligion.Caption  := CodeForm.CodeName;
           end; {case end}
       end;
       if pageControl1.ActivePage = TabSheet3 then
       begin
         case TComponent(Sender).Tag of
           1 : begin
               codeForm.FormData := '군별 코드열람';
               codeForm.DataVal1 := 'I031';
               end;
           2 : begin
               codeForm.FormData := '계급코드 열람';
               codeForm.DataVal1 := 'I034';
               end;
           3 : begin
               codeForm.FormData := '병과코드 열람';
               codeForm.DataVal1 := 'I035';
               end;
           6 : begin
               codeForm.FormData := '제대구분코드 열람';
               codeForm.DataVal1 := 'I036';
               end;
           7 : begin
               codeForm.FormData := '면제사유코드 열람';
               codeForm.DataVal1 := 'I037';
               end;
           8 : begin
               codeForm.FormData := '최종학력코드 열람';
               codeForm.DataVal1 := 'I221';
               end;
           9 : begin
               codeForm.FormData := '최종학위코드 열람';
               codeForm.DataVal1 := 'I221';
               end;
          10 : begin
               codeForm.FormData := '최종학교코드 열람';
               codeForm.DataVal1 := 'I223';
               end;
          12 : begin
               codeForm.FormData := '최종전공코드 열람';
               codeForm.DataVal1 := 'I225';
               end;
          15 : begin
               codeForm.FormData := '대학교코드 열람';
               codeForm.DataVal1 := 'I223';
               end;
          16 : begin
               codeForm.FormData := '대학전공코드 열람';
               codeForm.DataVal1 := 'I225';
               end;
          21 : begin
               codeForm.FormData := '자격면허종류코드 열람';
               codeForm.DataVal1 := 'I231';
               end;
          22 : begin
               codeForm.FormData := '자격면허등급코드 열람';
               codeForm.DataVal1 := 'I232';
               end;
          24 : begin
               codeForm.FormData := '선임자격종류코드 열람';
               codeForm.DataVal1 := 'I231';
               end;
          26 : begin
               codeForm.FormData := '선임자격등급코드 열람';
               codeForm.DataVal1 := 'I232';
               end;

         end; {case end}

         codeForm.ShowModal;
         if CodeForm.Code = '' then System.Exit;
         TMaskEdit(Sender).Text := CodeForm.Code;
         case TComponent(Sender).Tag of
           1 : Narmykind.Caption := CodeForm.CodeName;
           2 : Narmycl.Caption   := CodeForm.CodeName;
           3 : Narmyfield.Caption:= CodeForm.CodeName;
           6 : Narmydis.Caption  := CodeForm.CodeName;
           7 : Narmyex.Caption   := CodeForm.CodeName;
           8 : Nlschgr.Caption   := CodeForm.CodeName;
           9 : Nlschdeg.Caption  := CodeForm.CodeName;
           10: lschnm.Text       := CodeForm.CodeName;
           12: Nlmajorcode.Caption := CodeForm.CodeName;
           15: Nunicode.Caption  := CodeForm.CodeName;
           16: Nunimajor.Caption := CodeForm.CodeName;
           19: Nlickind.Caption  := CodeForm.CodeName;
           20: Nlicgr.Caption    := CodeForm.CodeName;
           22: Nlicalkind.Caption:= CodeForm.CodeName;
           23: Nlicalgr.Caption  := CodeForm.CodeName;
         end; {case end}
      end;

      if pageControl1.ActivePage = TabSheet4 then
      begin
         case TComponent(Sender).Tag of
           1 : begin
               codeForm.FormData := '교육구분코드 열람';
               codeForm.DataVal1 := 'I601';
               end;
          10 : begin
               codeForm.FormData := '휴직구분코드 열람';
               codeForm.DataVal1 := 'I310';
               end;
          15 : begin
               codeForm.FormData := '파견구분코드 열람';
               codeForm.DataVal1 := 'I310';
               end;
          21 : begin
               codeForm.FormData := '휴가구분코드 열람';
               codeForm.DataVal1 := 'I320';
               end;
          25 : begin
               codeForm.FormData := '퇴사구분코드 열람';
               codeForm.DataVal1 := 'I310';
               end;
          26 : begin
               codeForm.FormData := '퇴사사유코드 열람';
               codeForm.DataVal1 := 'I141';
               end;
          27 : begin
               codeForm.FormData := '퇴사사유코드 열람';
               codeForm.DataVal1 := 'I142';
               end;
         end; {case end}

         codeForm.ShowModal;
         if CodeForm.Code = '' then System.Exit;
         TMaskEdit(Sender).Text  := copy(CodeForm.Code,1,TMaskEdit(Sender).maxlength);
         case TComponent(Sender).Tag of
           1 : NeduGubun.Caption := CodeForm.CodeName;
          10 : Nlrkind.Caption   := CodeForm.CodeName;
          15 : Nlsekind.Caption  := CodeForm.CodeName;
          21 : Nhugubun.Caption  := CodeForm.CodeName;
          25 : Nretgubun.Caption := CodeForm.CodeName;
          26 : Nretsayu1.Caption := CodeForm.CodeName;
          27 : Nretsayu2.Caption := CodeForm.CodeName;
         end;
      end;

      if PageControl1.ActivePage = TabSheet5 then
      begin
         case TComponent(Sender).Tag of
            15 : begin
                 codeForm.FormData := '장애유형코드 열람';
                 codeForm.DataVal1 := 'I012';
                 end;
            16 : begin
                 codeForm.FormData := '장애등급코드 열람';
                 codeForm.DataVal1 := 'I011';
                 end;
             1 : begin
                 codeForm.FormData := '보훈구분코드 열람';
                 codeForm.DataVal1 := 'I015';
                 end;
             3 : begin
                 codeForm.FormData := '유공자의관계 코드 열람';
                 codeForm.DataVal1 := 'I211';
                 end;
             6 : begin
                 codeForm.FormData := '특례구분코드 열람';
                 codeForm.DataVal1 := 'I016';
                 end;
            20 : begin
                 codeForm.FormData := '계약방법코드 열람';
                 codeForm.DataVal1 := 'I901';
                 end;
            24 : begin
                 codeForm.FormData := '용역회사코드 열람';
                 codeForm.DataVal1 := 'I902';
                 end;
            25 : begin
                 codeForm.FormData := '직무코드 열람';
                 codeForm.DataVal1 := 'I702';
                 end;
            26 : begin
                 codeForm.FormData := '직무등급 열람';
                 codeForm.DataVal1 := 'I703';
                 end;
         end; {case end}

         codeForm.ShowModal;
         if CodeForm.Code = '' then System.Exit;
         TMaskEdit(Sender).Text  := CodeForm.Code;
         case TComponent(Sender).Tag of
            15: Nobskind.Caption    := CodeForm.CodeName;
            16: Nobsgr.Caption      := CodeForm.CodeName;
            1 : Nbohungubun.Caption := CodeForm.CodeName;
            3 : Nbohunrel.Caption   := CodeForm.CodeName;
            6 : Nscgubun.Caption    := CodeForm.CodeName;
            20: Ntcontr.Caption     := CodeForm.CodeName;
            24: Ntcompany.Caption   := CodeForm.CodeName;
            26: Ntdutyclass.Caption := CodeForm.CodeName;
         end;
      end;

       if PageControl1.ActivePage = Tabsheet7 then
       begin
          case TComponent(Sender).Tag of
            34 : begin
                 codeForm.FormData := '성별코드 열람';
                 codeForm.DataVal1 := 'I039';
                 end;
            36 : begin
                 codeForm.FormData := '호주와의 관계코드 열람';
                 codeForm.DataVal1 := 'I211';
                 end;
            37 : begin
                 codeForm.FormData := '주거형태 코드 열람';
                 codeForm.DataVal1 := 'I021';
                 end;
            38 : begin
                 codeForm.FormData := '건강상태코드 열람';
                 codeForm.DataVal1 := 'I502';
                 end;
            40 : begin
                 codeForm.FormData := '출생지코드 열람';
                 codeForm.DataVal1 := 'I001';
                 end;
            45 : begin
                 codeForm.FormData := '종교코드 열람';
                 codeForm.DataVal1 := 'I002';
                 end;
            50 : begin
                 codeForm.FormData := '실거주지 국가코드';
                 codeForm.DataVal1 := 'SK03';
                 end;
            51 : begin
                 codeForm.FormData := '국가코드 열람';
                 codeForm.DataVal1 := 'SK03';
                 end;
            53 : begin
                 codeForm.FormData  := '실거주지 지역코드';
                 codeForm.DataVal1  := 'SK04';
                 codeForm.vNationcd := curnation.Text;
                 end;
            54 : begin
                 codeForm.FormData := '지역코드 열람';
                 codeForm.DataVal1 := 'SK04';
                 codeForm.vNationcd := nation.Text;
                 end;
            99 : begin
                   codeForm.FormData := '국적코드 열람';
                   codeForm.DataVal1  := 'SK03';
                end;
           end; {case end}

           codeForm.ShowModal;
           if CodeForm.Code = '' then System.Exit;
           TmaskEdit(Sender).Text := CodeForm.Code;
           case TComponent(Sender).Tag of
              34: Nsex.Caption           := CodeForm.CodeName;
              36: Nholdrel.Caption       := CodeForm.CodeName;
              37: Nhousetype.Caption     := CodeForm.CodeName;
              38: Nhealth.Caption        := CodeForm.CodeName;
              40: Nbornarea.Caption      := CodeForm.CodeName;
              45: Nreligion.Caption      := CodeForm.CodeName;
              50: Ncurnation.Caption     := CodeForm.CodeName;
              51: Nnation.Caption        := CodeForm.CodeName;
              53: Ncurregion.Caption     := CodeForm.CodeName;
              54: Nregion.Caption        := CodeForm.CodeName;
              99: NCountry.Caption       := CodeForm.CodeName;
           end; {case end}
       end;
   Finally
      codeForm.Free;
   end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.codeHelp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // 완료
   if Key = vk_F1  then
   begin
      if PageControl1.ActivePage = TabSheet1 then
      begin
         if (TMaskEdit(Sender).Tag = 6) or
            (TMaskEdit(Sender).Tag = 7) or
            (TMaskEdit(Sender).Tag = 43) then deptcodeDblClick(Sender)
         else codeClick(Sender);
      end else codeClick(Sender);
   end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then Key := chr(0);
end;
//------------------------------------------------------------------------------
{부서코드 열람 }
procedure Tpia1010aForm.deptcodeDblClick(Sender: TObject);
begin
   DeptForm := TDeptForm.Create(Self);
   Try
     DeptForm.ShowModal;
     if DeptForm.Code1 <> '' then
     begin
        TmaskEdit(Sender).Text     := DeptForm.Code1;
        Njobdept.Caption := DeptForm.CodeName;
        if TmaskEdit(Sender).Tag <> 43 then
        begin
           Ndeptcode.Caption := DeptForm.CodeName;
           orgnum.Text	 := DeptForm.Code3;

           // 재무코드,소속부문 변경되게 함
           Ndeptcode.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,1);
           fieldcode.Caption  := QDeptVal[1];
           Nfieldcode.Caption := QDeptDisp(fieldcode.caption,orgnum.Text,3);
           Njikgroup.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,4);
        end;
     end;
   Finally
      DeptForm.Free;
   End;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataKeyMove1(Sender: TObject; var Key: Word;
                                    Shift : TShiftState);
var
  i : integer;
begin
   if (MsgKey = True) and (Key = vk_Return) then
   begin
      MsgKey := False;
      system.Exit;
   end;

   if Key = vk_F9  then DataFieldClick(Sender);
   if Key = vk_F12 then saveClick(Sender);

   if not (ssShift in Shift) then
   begin
      if (Key = vk_Return) or (Key = vk_Tab) then
      begin
         case Tcomponent(Sender).Tag of
            1 : begin
                   if EnterKey = False then
                   begin
                      Npstate.Caption := QCodeDisp('I114',pstate.Text,'',0);
                      sFocus(pstateyn,Npstate);
                   end;
                   EnterKey  := False;
                end;
           	2 : sFocus(paycl,nil);
           	3 : begin
                    Npaycl.Caption := QCodeDisp('I112',paycl.Text,'',0);
              	    sFocus(jobplace,Npaycl);
           	    end;
           	4 : sFocus(jobplace,nil);
            5 : sFocus(orgnum,nil);
            6 : begin
                   Ndeptcode.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,1);
                   fieldcode.Caption  := QDeptVal[1];
                   Nfieldcode.Caption := QDeptDisp(fieldcode.caption,orgnum.Text,3);
                   Njikgroup.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,4);
                   sFocus(deptcode,Ndeptcode);
                end;
           	7 : begin
              	    Ndeptcode.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,1);
	             	    fieldcode.Caption  := QDeptVal[1];
                   Nfieldcode.Caption := QDeptDisp(fieldcode.caption,orgnum.Text,3);
                   Njikgroup.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,4);
                   sFocus(jobdept,Ndeptcode);
                end;
           43 : begin    //31.08  2001.08.20 shm 추가
              	    Njobdept.Caption   := QDeptDisp(jobdept.Text,orgnum.Text,1);
                   sFocus(jobpayra,Njobplace);
                end;
            8 : begin
                   Npayra.Caption     := QCodeDisp('I113',payra.Text,'',0);
                   sFocus(paydunm,Npayra);
                end;
           44 : begin //31.08  2001.08.20 shm 추가
                   Njobpayra.Caption     := QCodeDisp('I113',jobpayra.Text,'',0);
                   sFocus(realtrdate,Njobplace);
                end;
           	9 : sFocus(realtrdate,nil);
           10 : sFocus(offtrdate,nil);
           11 : sFocus(payrayn,nil);
           45 : sFocus(jobpayrayn,nil);  //31.08  2001.08.27 shm 추가
           12 : sFocus(cpayradate,nil);
           13 : sFocus(empdate,nil);
           14 : sFocus(orgempdate,nil);
           15 : sFocus(cpaycldate,nil);
           16 : sFocus(paycldate,nil);
           17 : sFocus(reppaycl,nil);
           18 : begin
                   Nreppaycl.Caption := QCodeDisp('I112',reppaycl.Text,'',0);
                   sFocus(reppayfrdate,Nreppaycl);
                end;
           19 : sFocus(repaytodate,nil);
           20 : sFocus(apdpaydunm,nil);
           21 : sFocus(apdpayfrdate,nil);
           22 : sFocus(apdpaytodate,nil);
           23 : sFocus(actpaydunm,nil);
           24 : sFocus(actpayfrdate,nil);
           25 : sFocus(actpaytodate,nil);
           26 : sFocus(remark,nil);
           27 : sFocus(remark,nil);
           28 : begin
                   Nremark.Caption := QCodeDisp('I040',remark.Text,'',0);
                   sFocus(empcode,Nremark);
          	     end;
           29 : begin
                   Nempcode.Caption := QCodeDisp('I101',empcode.Text,'',0);
                   sFocus(empterm,Nempcode);
           	    end;
           30 : sFocus(empschgr,nil);
           31 : begin
                   Nempschgr.Caption := QCodeDisp('I221',empschgr.Text,'',0);
                   sFocus(emppaycl,Nempschgr);
                end;
           32 : begin
                   Nemppaycl.Caption := QCodeDisp('I112',emppaycl.Text,'',0);
                   sFocus(bcaryy,Nemppaycl);
                end;
           33 : sFocus(armypaygr,nil);
           35 : sFocus(maspaygr,nil);
           36 : sFocus(carpaygr,nil);
           37 : sFocus(etcpaygr,nil);
           38 : sFocus(etcpaycont,nil);
           39 : sFocus(bcaryy,nil);
           40 : sFocus(bcarmm,nil);
           41 : sFocus(cardate,nil);
           42 : sFocus(pstate,nil);
         end; //CASE END
      end;  // IF END
   end else
   begin
      if (Key = vk_Return) or (Key = vk_Tab) then
      begin
         case Tcomponent(Sender).Tag of
            1 : begin
                   Npstate.Caption := QCodeDisp('I114',pstate.Text,'',0);
                   sFocus(cardate,Npstate);
                end;
            2 : sFocus(pstate,nil);
            3 : begin
                   Npaycl.Caption     := QCodeDisp('I112',paycl.Text,'',0);
                   sFocus(pstateyn,Npaycl);
                end;
            4 : sFocus(paycl,nil);
            5 : sFocus(paycl,nil);
            6 : begin
                   Ndeptcode.Caption := QDeptDisp(deptcode.Text,orgnum.Text,1);
                   fieldcode.Caption := QDeptVal[1];
                          Nfieldcode.Caption := QDeptDisp(fieldcode.caption,orgnum.Text,3);
                          Njikgroup.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,4);
                   sFocus(jobplace,Ndeptcode);
                end;
            7 : begin
                   Ndeptcode.Caption  := QDeptDisp(deptcode.Text,orgnum.Text,1);
                   fieldcode.Caption  := QDeptVal[1];
                   Nfieldcode.Caption := QDeptDisp(fieldcode.caption,orgnum.Text,3);
                   Njikgroup.Caption := QDeptDisp(deptcode.Text,orgnum.Text,4);
                   sFocus(orgnum,Npayra);
                end;
           43 : begin
                   Njobdept.Caption := QDeptDisp(jobdept.Text,orgnum.Text,2);
                   sFocus(deptcode,Njobplace);
                end;
            8 : begin
                   Npayra.Caption := QCodeDisp('I113',payra.Text,'',0);
                   sFocus(jobdept,Npayra);
                end;
           44 : begin  //31.08  2001.08.20 shm 추가
                   Njobpayra.Caption := QCodeDisp('I113',jobpayra.Text,'',0);
                   sFocus(jobdept,Npayra);
                end;
            9 : sFocus(payra,nil);
           10 : sFocus(paydunm,nil);
           11 : sFocus(realtrdate,nil);
           12 : sFocus(offtrdate,nil);
           13 : sFocus(payrayn,nil);
           45 : sFocus(jobpayrayn,nil);   //31.08  2001.08.27 shm 추가
           14 : begin
                   Njobplace.Caption := QCodeDisp('I160',jobplace.Text,'',0);
                   sFocus(cpayradate,Njobplace);
                end;
           15 : sFocus(empdate,nil);
           16 : sFocus(orgempdate,nil);
           17 : sFocus(cpaycldate,nil);
           18 : begin
                   Nreppaycl.Caption := QCodeDisp('I112',reppaycl.Text,'',0);
                   sFocus(paycldate,Nreppaycl);
                end;
           19 : sFocus(reppaycl,nil);
           20 : sFocus(reppayfrdate,nil);
           21 : sFocus(repaytodate,nil);
           22 : sFocus(apdpaydunm,nil);
           23 : sFocus(apdpayfrdate,nil);
           24 : sFocus(apdpaytodate,nil);
           25 : sFocus(actpaydunm,nil);
           26 : sFocus(actpayfrdate,nil);
           27 : sFocus(actpaytodate,nil);
           28 : begin
                   Nremark.Caption := QCodeDisp('I040',remark.Text,'',0);
                   sFocus(actpaytodate,nil);
                end;
           29 : begin
                   Nempcode.Caption := QCodeDisp('I101',empcode.Text,'',0);
                   sFocus(remark,Nempcode);
                end;
           30 : sFocus(empcode,nil);
           31 : begin
                   Nempschgr.Caption := QCodeDisp('I221',empschgr.Text,'',0);
                   sFocus(empterm,Nempschgr);
                end;
           32 : begin
                   Nemppaycl.Caption := QCodeDisp('I112',emppaycl.Text,'',0);
                   sFocus(empschgr,Nemppaycl);
                end;
           33 : sFocus(emppaycl,nil);
           34 : sFocus(emppaygr,nil);
           35 : sFocus(emppaygr,nil);
           36 : sFocus(armypaygr,nil);
           37 : sFocus(maspaygr,nil);
           38 : sFocus(carpaygr,nil);
           39 : sFocus(etcpaygr,nil);
           40 : sFocus(emppaycl,nil);
           41 : sFocus(bcaryy,nil);
           42 : sFocus(bcarmm,nil);
         end;
      end;
   end;
end;
//------------------------------------------------------------------------------
// tabsheet2
procedure Tpia1010aForm.DataKeyMove2(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,check : integer;
  str     : string;
  nGubun : integer;
begin
if (MsgKey = True) and (Key = vk_Return) then begin
    MsgKey := False; system.Exit;
end;
if Key = vk_F9  then DataFieldClick(Sender);
if Key = vk_F12 then saveClick(Sender);
if not (ssShift in Shift) then
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
   begin
      case Tcomponent(Sender).Tag of
	1 : begin
            if EnterKey = False then begin
               Njobgun.Caption := pia1010aForm.QCodeDisp('I115',jobgun.Text,'',0);
               if Njobgun.Caption = '' then Njobgun.Caption := '코드에러';
               sFocus(jobgundate,Njobgun);
            end;
            EnterKey := False;
	    end;
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
//	2 : sFocus(jobline,nil);
	2 : sFocus(jobkind,nil);
	3 : begin
{	    Njobline.Caption := pia1010aForm.QCodeDisp('I115',jobline.Text);
            if Njobline.Caption = '' then Njobline.Caption := '코드에러';
            if trim(jobline.Text) <> '' then begin
               jobgun.Text := copy(jobline.Text,1,1)+'0';
               Njobgun.Caption := pia1010aForm.QCodeDisp('I115',jobgun.Text);
            end;
}
	    sFocus(joblinedate,Njobline);
	    end;
	4 : sFocus(jobkind,nil);
	5 : begin
//	    Njobkind.Caption := pia1010aForm.QCodeDisp('I111',jobkind.Text);
            Njobkind.Caption := pia1010aForm.QJobKindDisp(jobkind.Text);
	    sFocus(jobkinddate,Njobkind);
	    end;
	6 : sFocus(jobduty,nil);
	7 : begin
	    Njobduty.Caption := pia1010aForm.QCodeDisp('I???',jobduty.Text,'',0);
	    sFocus(jobdutydate,Njobduty);
	    end;
	8 : sFocus(nogubun,nil);
	9 : begin
	    Nnogubun.Caption := pia1010aForm.QCodeDisp('I120',nogubun.Text,'',0);
	    sFocus(nojeonyn,Nnogubun);
	    end;
  10 : sFocus(nojnfrdate,nil);
  11 : sFocus(nojntodate,nil);
  12 : sFocus(lancode,nil);
  13 : begin
	       Nlancode.Caption := pia1010aForm.QCodeDisp('I300',lancode.Text,'',0);
         sFocus(lannono,Nlancode);
	     end;
  14 : sFocus(lanfrdate,nil);
  15 : sFocus(lantodate,nil);
  16 : sFocus(exdutcnt,nil);
  17 : sFocus(exdutyy,nil);
  18 : sFocus(exdutmm,nil);
  19 : sFocus(exdutdd,nil);
  20 : sFocus(lexfrdate,nil);
  21 : sFocus(lextodate,nil);
  22 : sFocus(payclyy,nil);
  23 : sFocus(payclmm,nil);
  24 : sFocus(paycldd,nil);
  25 : sFocus(comduyy,nil);
  26 : sFocus(comdumm,nil);
  27 : sFocus(comdudd,nil);
  28 : sFocus(chnname,nil);
  29 : sFocus(engname,nil);
  30 : sFocus(juminid,nil);
  31 : begin
         if Length(rtrim(juminid.Text)) >= 14 then begin
            tage := '00'; usaage := '00';
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.25     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
            nGubun := StrToInt(copy(juminid.Text,8,1));
            case nGubun of
              1,2,7,8 : begin
                 usaage := DateCal('19'+Copy(juminid.Text,1,6),
                                  copy(Lsysdate.Caption,1,4)+copy(Lsysdate.Caption,6,2)+
                                  copy(Lsysdate.Caption,9,2) );
                 Tage   := IntToStr((StrToInt(copy(Lsysdate.Caption,1,4))+1)-
                                    StrToint('19'+Copy(juminid.Text,1,2)));
                end;
              else begin
                 usaage := DateCal(Copy(Lsysdate.Caption,1,2)+Copy(juminid.Text,1,6),
                                  copy(Lsysdate.Caption,1,4)+copy(Lsysdate.Caption,6,2)+
                                  copy(Lsysdate.Caption,9,2) );
                 Tage   := IntToStr((StrToInt(copy(Lsysdate.Caption,1,4))+1)-
                                    StrToint(Copy(Lsysdate.Caption,1,2)+Copy(juminid.Text,1,2)));
                end;
            end;
            if copy(Tage,1,2) = '00' then begin juminid.Text := '';
                                                korage.caption := '00 세';
                                        end
            else  korage.caption := copy(Tage,1,2)+'세';

            sFocus(eldsonyn,nil);
            end;
            end;//end 31
       32 : sFocus(marrigeyn,nil);
       33 : sFocus(sex,nil);
       34 : begin
            Nsex.Caption := pia1010aForm.QCodeDisp('I039',Sex.Text,'',0);
            sFocus(holdname,Nsex);
            end;
       35 : sFocus(holdrel,nil);
       36 : begin
	    Nholdrel.Caption := pia1010aForm.QCodeDisp('I211',holdrel.Text,'',0);
	    sFocus(housetype,Nholdrel);
	    end;
       37 : begin
	    Nhousetype.Caption := pia1010aForm.QCodeDisp('I021',housetype.Text,'',0);
	    sFocus(health,Nhousetype);
	    end;
       38 : begin
	    Nhealth.Caption := pia1010aForm.QCodeDisp('I502',health.Text,'',0);
	    sFocus(E_mail,Nhealth);
	    end;
       39 : sFocus(bornarea,nil);
       40 : begin
	    Nbornarea.Caption := pia1010aForm.QCodeDisp('I001',bornarea.Text,'',0);
	    sFocus(regaddr,Nbornarea);
	    end;
       41 : sFocus(curaddr,nil);
       42 : sFocus(zipno,nil);
       43 : sFocus(telno,nil);
       44 : sFocus(religion,nil);
       45 : begin
	    Nreligion.Caption := pia1010aForm.QCodeDisp('I002',religion.Text,'',0);
	    sFocus(habit,Nreligion);
	    end;
       46 : sFocus(ability,nil);
       47 : sFocus(blood,nil);
       48 : begin
            check := 0;
            str   := blood.Text;
            for i := 1 to length(str) do
                if (str[i] = '+') or (str[i] = '-') then inc(check);
            if check > 0 then blood.Text := str else blood.Text := str+'+';
            sFocus(height,nil);
            end;
       49 : sFocus(weight,nil);
       50 : sFocus(jobgun,nil);
      end;
   end;
end
else
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
      case Tcomponent(Sender).Tag of
	1 : begin
	    Njobgun.Caption := pia1010aForm.QCodeDisp('I115',jobgun.Text,'',0);
            if Njobgun.Caption = '' then Njobgun.Caption := '코드에러';
            sFocus(weight,Njobgun);
            end;
	2 : sFocus(jobgun,nil);
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
	3 : begin
{	    Njobline.Caption := pia1010aForm.QCodeDisp('I115',jobline.Text,'',0);
            if Njobline.Caption = '' then Njobline.Caption := '코드에러';
            if trim(jobline.Text) <> '' then begin
               jobgun.Text := copy(jobline.Text,1,1)+'0';
               Njobgun.Caption := pia1010aForm.QCodeDisp('I115',jobgun.Text,'',0);
            end;
}            
            sFocus(jobgundate,Njobline);
            end;
	4 : sFocus(jobline,nil);
{	5 : begin
	    Njobkind.Caption := pia1010aForm.QCodeDisp('I111',jobkind.Text,'',0);
            sFocus(joblinedate,Njobkind);
            end;
}
	5 : begin
//	    Njobkind.Caption := pia1010aForm.QCodeDisp('I111',jobkind.Text,'',0);
	    Njobkind.Caption := pia1010aForm.QJobKindDisp(jobkind.Text);
            sFocus(jobgundate,Njobkind);
            end;
	6 : sFocus(jobkind,nil);
	7 : begin
	    Njobduty.Caption := pia1010aForm.QCodeDisp('I???',jobduty.Text,'',0);
            sFocus(jobkinddate,Njobduty);
            end;
	8 : sFocus(jobduty,nil);
	9 : begin
	    Nnogubun.Caption := pia1010aForm.QCodeDisp('I120',nogubun.Text,'',0);
            sFocus(jobdutydate,Nnogubun);
            end;
       10 : sFocus(nogubun,nil);
       11 : sFocus(nojeonyn,nil);
       12 : sFocus(nojnfrdate,nil);
       13 : begin
	    Nlancode.Caption := pia1010aForm.QCodeDisp('I300',lancode.Text,'',0);
            sFocus(nojntodate,Nlancode);
            end;
       14 : sFocus(lancode,nil);
       15 : sFocus(lannono,nil);
       16 : sFocus(lanfrdate,nil);
       17 : sFocus(lantodate,nil);
       18 : sFocus(exdutcnt,nil);
       19 : sFocus(exdutyy,nil);
       20 : sFocus(exdutmm,nil);
       21 : sFocus(exdutdd,nil);
       22 : sFocus(lexfrdate,nil);
       23 : sFocus(lextodate,nil);
       24 : sFocus(payclyy,nil);
       25 : sFocus(payclmm,nil);
       26 : sFocus(paycldd,nil);
       27 : sFocus(comduyy,nil);
       28 : sFocus(comdumm,nil);
       29 : sFocus(comdudd,nil);
       30 : sFocus(chnname,nil);
       31 : begin
            if Length(rtrim(juminid.Text)) > 14 then begin
            Tage := '00'; usaage := '00';
        {/ ===============================================================================
           Version  date(yy.mm.dd)  programmer  description        relevant doc.no
           30.00     1999.02.25     유미나     Y2K(주민번호관련)   하나로인사재개발
           =============================================================================== /}

            nGubun := StrToInt(copy(juminid.Text,8,1));
            case nGubun of
              1,2 : begin
                 usaage := DateCal('19'+Copy(juminid.Text,1,6),
                                  copy(Lsysdate.Caption,1,4)+copy(Lsysdate.Caption,6,2)+
                                  copy(Lsysdate.Caption,9,2) );
                 Tage   := IntToStr((StrToInt(copy(Lsysdate.Caption,1,4))+1)-
                                    StrToint('19'+Copy(juminid.Text,1,2)));
                    end;
              else begin
                 usaage := DateCal(Copy(Lsysdate.Caption,1,2)+Copy(juminid.Text,1,6),
                                  copy(Lsysdate.Caption,1,4)+copy(Lsysdate.Caption,6,2)+
                                  copy(Lsysdate.Caption,9,2) );
                 Tage   := IntToStr((StrToInt(copy(Lsysdate.Caption,1,4))+1)-
                                    StrToint(Copy(Lsysdate.Caption,1,2)+Copy(juminid.Text,1,2)));
              end;
            end;
            if copy(Tage,1,2) = '00' then begin juminid.Text := '';
                                                korage.caption := '00 세';
                                          end
            else  korage.caption := copy(Tage,1,2)+'세';
            sFocus(engname,nil);
            end;
            end;//end 31
       32 : sFocus(juminid,nil);
       33 : sFocus(eldsonyn,nil);
       34 : sFocus(marrigeyn,nil);
       35 : sFocus(sex,nil);
       36 : begin
	    Nholdrel.Caption := pia1010aForm.QCodeDisp('I211',holdrel.Text,'',0);
            sFocus(holdname,Nholdrel);
            end;
       37 : begin
	    Nhousetype.Caption := pia1010aForm.QCodeDisp('I021',housetype.Text,'',0);
	    sFocus(holdrel,Nhousetype);
	    end;
       38 : begin
	    Nhealth.Caption := pia1010aForm.QCodeDisp('I502',health.Text,'',0);
	    sFocus(housetype,Nhealth);
	    end;
       39 : sFocus(health,nil);
       40 : begin
	    Nbornarea.Caption := pia1010aForm.QCodeDisp('I001',bornarea.Text,'',0);
            sFocus(E_mail,Nbornarea);
            end;
       41 : sFocus(bornarea,nil);
       42 : sFocus(regaddr,nil);
       43 : sFocus(curaddr,nil);
       44 : sFocus(zipno,nil);
       45 : begin
	    Nreligion.Caption := pia1010aForm.QCodeDisp('I002',religion.Text,'',0);
            sFocus(telno,Nreligion);
            end;
       46 : sFocus(religion,nil);
       47 : sFocus(habit,nil);
       48 : begin
            check := 0;
            str   := blood.Text;
            for i := 1 to length(str) do
                if (str[i] = '+') or (str[i] = '-') then inc(check);
            if check > 0 then blood.Text := str else blood.Text := str+'+';
            sFocus(ability,nil);
            end;
       49 : sFocus(blood,nil);
       50 : sFocus(height,nil);
     end;
end;

end;
//tebsheet3
procedure Tpia1010aForm.DataKeyMove3(Sender: TObject; var Key: Word;
                                    Shift : TShiftState);
var
  jeon : string;
begin
if (MsgKey = True) and (Key = vk_Return) then begin
    MsgKey := False; system.Exit;
end;
if Key = vk_F9  then DataFieldClick(Sender);
if Key = vk_F12 then saveClick(Sender);
if not (ssShift in Shift) then
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
   begin
      case Tcomponent(Sender).Tag of
	1 : begin
            if EnterKey = False then begin
               Narmykind.Caption := pia1010aForm.QCodeDisp('I031',armykind.Text,'',0);
	       sFocus(armycl,Narmykind);
            end;
            EnterKey := False;
	    end;
	2 : begin
	    Narmycl.Caption := pia1010aForm.QCodeDisp('I034',armycl.Text,'',0);
	    sFocus(armyfield,Narmycl);
	    end;
	3 : begin
	    Narmyfield.Caption := pia1010aForm.QCodeDisp('I035',armyfield.Text,'',0);
	    sFocus(armyfrdate,Narmyfield);
	    end;
	4 : sFocus(armytodate,nil);
	5 : sFocus(armydis,nil);
	6 : begin
	    Narmydis.Caption := pia1010aForm.QCodeDisp('I036',armydis.Text,'',0);
	    sFocus(armyex,Narmydis);
	    end;
	7 : begin
	    Narmyex.Caption := pia1010aForm.QCodeDisp('I037',armyex.Text,'',0);
	    sFocus(lschgr,Narmyex);
	    end;
	8 : begin
	    Nlschgr.Caption := pia1010aForm.QCodeDisp('I221',lschgr.Text,'',0);
	    sFocus(lschdeg,Nlschgr);
	    end;
	9 : begin
	    Nlschdeg.Caption := pia1010aForm.QCodeDisp('I221',lschdeg.Text,'',0);
	    sFocus(lschcode,Nlschdeg);
	    end;
       10 : begin
	    jeon := pia1010aForm.QCodeDisp('I223',lschcode.Text,'',0);
	    if jeon = '' then begin sFocus(lschnm,nil); system.Exit; end;
            if jeon = '코드에러' then begin
               MessageBox(handle,'코드입력 오류발생 !!.','에  러',MB_OK or $0010);
               MsgKey := True;
               system.Exit;
            end else begin lschnm.Text := jeon; sFocus(lschnm,nil); end;
	    end;
       11 : sFocus(lmajorcode,nil);
       12 : begin
	    Nlmajorcode.Caption := pia1010aForm.QCodeDisp('I225',lmajorcode.Text,'',0);
	    sFocus(lschfrym,Nlmajorcode);
	    end;
       13 : sFocus(lschgrym,nil);
       14 : sFocus(unicode,nil);
       15 : begin
	    Nunicode.Caption := pia1010aForm.QCodeDisp('I223',unicode.Text,'',0);
	    sFocus(unimajor,Nunicode);
	    end;
       16 : begin
	    Nunimajor.Caption := pia1010aForm.QCodeDisp('I225',unimajor.Text,'',0);
	    sFocus(unifrym,Nunimajor);
	    end;
       17 : sFocus(unigrym,nil);
       18 : sFocus(lschmajnm,nil);
       19 : sFocus(lschtopic,nil);
       20 : sFocus(lickind,nil);
       21 : begin
	    Nlickind.Caption := pia1010aForm.QCodeDisp('I231',lickind.Text,'',0);
	    sFocus(licgr,Nlickind);
	    end;
       22 : begin
	    Nlicgr.Caption := pia1010aForm.QCodeDisp('I232',licgr.Text,'',0);
	    sFocus(licgetdate,Nlicgr);
	    end;
       23 : sFocus(licalkind,nil);
       24 : begin
	    Nlicalkind.Caption := pia1010aForm.QCodeDisp('I231',licalkind.Text,'',0);
	    sFocus(licalgr,Nlicalkind);
	    end;
       25 : begin
	    Nlicalgr.Caption := pia1010aForm.QCodeDisp('I232',licalgr.Text,'',0);
	    sFocus(licalgetdate,Nlicalgr);
	    end;
       26 : sFocus(licalfield,nil);
       27 : sFocus(licaldate,nil);
       28 : sFocus(licbigo,nil);
       29 : sFocus(toeicscore,nil);
       30 : sFocus(toeicfull,nil);
       31 : sFocus(toeicdate,nil);
       32 : sFocus(jptscore,nil);
       33 : sFocus(jptfull,nil);
       34 : sFocus(jptdate,nil);
       35 : sFocus(armykind,nil);
      end;
   end;
end
else
begin
   if (Key = vk_Return) or (Key = vk_Tab) then
      case Tcomponent(Sender).Tag of
	1 : begin
	    Narmykind.Caption := pia1010aForm.QCodeDisp('I031',armykind.Text,'',0);
	    sFocus(jptdate,Narmykind);
	    end;
	2 : begin
	    Narmycl.Caption := pia1010aForm.QCodeDisp('I034',armycl.Text,'',0);
	    sFocus(armykind,Narmycl);
	    end;
	3 : begin
	    Narmyfield.Caption := pia1010aForm.QCodeDisp('I035',armyfield.Text,'',0);
	    sFocus(armycl,Narmyfield);
	    end;
	4 : sFocus(armyfield,nil);
	5 : sFocus(armyfrdate,nil);
	6 : begin
	    Narmydis.Caption := pia1010aForm.QCodeDisp('I036',armydis.Text,'',0);
	    sFocus(armytodate,Narmydis);
	    end;
	7 : begin
	    Narmyex.Caption := pia1010aForm.QCodeDisp('I037',armyex.Text,'',0);
	    sFocus(armydis,Narmyex);
	    end;
	8 : begin
	    Nlschgr.Caption := pia1010aForm.QCodeDisp('I221',lschgr.Text,'',0);
	    sFocus(armyex,Nlschgr);
	    end;
	9 : begin
	    Nlschdeg.Caption := pia1010aForm.QCodeDisp('I221',lschdeg.Text,'',0);
	    sFocus(lschgr,Nlschdeg);
	    end;
       10 : begin
	    jeon := pia1010aForm.QCodeDisp('I223',lschcode.Text,'',0);
	    if jeon = '' then begin sFocus(lschdeg,nil); system.Exit; end;
            if jeon = '코드에러' then begin
               MessageBox(handle,'코드입력 오류발생 !!.','에  러',MB_OK or $0010);
               MsgKey := True;
               system.Exit;
            end else begin lschnm.Text := jeon; sFocus(lschdeg,nil); end;
	    end;
       11 : sFocus(lschcode,nil);
       12 : begin
	    Nlmajorcode.Caption := pia1010aForm.QCodeDisp('I225',lmajorcode.Text,'',0);
	    sFocus(lschnm,Nlmajorcode);
	    end;
       13 : sFocus(lmajorcode,nil);
       14 : sFocus(lschfrym,nil);
       15 : begin
	    Nunicode.Caption := pia1010aForm.QCodeDisp('I223',unicode.Text,'',0);
	    sFocus(lschgrym,Nunicode);
	    end;
       16 : begin
	    Nunimajor.Caption := pia1010aForm.QCodeDisp('I225',unimajor.Text,'',0);
	    sFocus(unicode,Nunimajor);
	    end;
       17 : sFocus(unimajor,nil);
       18 : sFocus(unifrym,nil);
       19 : sFocus(unigrym,nil);
       20 : sFocus(lschmajnm,nil);
       21 : begin
	    Nlickind.Caption := pia1010aForm.QCodeDisp('I231',lickind.Text,'',0);
	    sFocus(lschtopic,Nlickind);
	    end;
       22 : begin
	    Nlicgr.Caption := pia1010aForm.QCodeDisp('I232',licgr.Text,'',0);
	    sFocus(lickind,Nlicgr);
	    end;
       23 : sFocus(licgr,nil);
       24 : begin
	    Nlicalkind.Caption := pia1010aForm.QCodeDisp('I231',licalkind.Text,'',0);
	    sFocus(licgetdate,Nlicalkind);
	    end;
       25 : begin
	    Nlicalgr.Caption := pia1010aForm.QCodeDisp('I232',licalgr.Text,'',0);
	    sFocus(licalkind,Nlicalgr);
	    end;
       26 : sFocus(licalgr,nil);
       27 : sFocus(licalgetdate,nil);
       28 : sFocus(licalfield,nil);
       29 : sFocus(licaldate,nil);
       30 : sFocus(licbigo,nil);
       31 : sFocus(toeicscore,nil);
       32 : sFocus(toeicfull,nil);
       33 : sFocus(toeicdate,nil);
       34 : sFocus(jptscore,nil);
       35 : sFocus(jptfull,nil);
     end;
end;
end;

//====================================================================
//  31.90  2005.02.21   유효성                     신 직종 코드 사용
//====================================================================
function Tpia1010aForm.QJobKindDisp(s1 : String) : String;
var
  str : string;
begin
   OraQuery1.Close;
   OraQuery1.Sql.Text := 'select dutykindname from pishrdukind  where dutykind = :dutykind ';
   OraQuery1.Parambyname('dutykind').AsString   := s1;
   OraQuery1.Open;

   if (copy(empno.Text,1,1) = '0') or (copy(empno.Text,1,1) = '1') or (copy(empno.Text,1,1) = '2') then
   begin
      if trim(OraQuery1.FieldByName('dutykindname').AsString) = ''  then
         QJobKindDisp := ''//'코드에러'
      else
         QJobKindDisp := OraQuery1.FieldByName('dutykindname').AsString;
   end;

   OraQuery1.close;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.sFocus(Sender : TObject; Cap : TPanel);
begin
    MsgKey := False;
    if trim(Cap.Caption) = '코드에러' then begin
       MessageBox(handle,'코드입력 오류발생 !!.','에  러',MB_OK or $0010);
       MsgKey := True;
       system.exit;
    end;
    TCustomEdit(Sender).SetFocus;
end;
//------------------------------------------------------------------------------
// 요일을 클릭했을경우
//------------------------------------------------------------------------------
procedure Tpia1010aForm.CalenClick(Sender: TObject);
begin
   //완료
   Calendar := TCalendar.Create(Self);
   Try
      Calendar.ShowModal;
      if Calendar.DayCaption <> '' then  TMaskEdit(Sender).Text := Calendar.DayCaption;
   Finally
      Calendar.Free;
   End;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.calHelp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //완료
   if Key = vk_F1  then calenClick(Sender);
end;
procedure Tpia1010aForm.exitClick(Sender: TObject);
begin
   {인사발령경신 프로그램이 있으면 화면에 보인다..}
   if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   programHandle : Thandle;
begin
   programhandle := FindWindow('Tpic1061gForm','종합인사정보시스템 (인사시스템)');
   ShowWindow(programhandle,SW_SHOWNORMAL);
   codeToText(HomeDir+'\pia1010a.cod','',3);
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.FormCreate(Sender: TObject);
begin
  start := 0;

  //종합인사 단위프로그램을 정상적인 방법으로 실행 안한경우 프로그램 종료.  2013.11.
  if FileExists(Application.ExeName+'.Tmp') then DeleteFile(Application.ExeName+'.Tmp')
  else System.exit;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.FormPaint(Sender: TObject);
var
  CurDate : string;
begin
   if Start = 0 then
   begin
      Start := 1;

      OraConnect;

      Public_Window    := 1;
     // pia1010aForm.Top := 1;
      HomeDir      := HomeDirOpen; //pass
      ImageList1.GetBitmap(3, Save.Glyph);
      ImageList1.GetBitmap(4, Save.Glyph);
      Mhandle      := pia1010aForm.handle;
      Bsel1.color  := $00D3D3A7;
      P_SaveEmpno  := PassEmp(cmdline,1);
      p_korname    := PassEmp(cmdline,2);
      password     := PassEmp(cmdline,3);
      pDBUsrname   := PassEmp(cmdline,5);
      pDBPass      := PassEmp(cmdline,6);
      pSvrname     := PassEmp(cmdline,13);

      Bsel[1] := Bsel1; Bsel[2] := Bsel2;  Bsel[3] := Bsel3;
      Bsel[4] := Bsel4; Bsel[5] := Bsel5;  Bsel[6] := Bsel6;   Bsel[7] := Bsel7;
      paydunm.Visible  := False;    //2001.08.20 shm

      Lempno.Caption   := Pkorname + '(' + Pempno+')';
      Lsysdate.Caption := fn_GetDateStr;
      //empno.Text       := Pempno;
      //korname.Text     := Pkorname;
      if copy(Pgrade,2,1) > 'C' then
      begin
           MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
           close;
      end;
      KeyClick(Sender);
      empno.SetFocus;

      PageControl1.ActivePage := TabSheet1;

      ChangeCheck := True;
   end;
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.Hobong(Sender: TObject);
begin
   grpaygrsum.Caption := ' '+FormatFloat('#00',armypaygr.value+
                                               carpaygr.value+
			     	                maspaygr.value+
			      	                etcpaygr.value);
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.TextToFloat(Sender: TObject);
begin
  if trim(TMaskEdit(Sender).Text) = '' then
     if (PageControl1.ActivePage = TabSheet1) and
        ( (TmaskEdit(Sender).tag = 6) or (TmaskEdit(Sender).tag = 30) ) then
           TmaskEdit(Sender).Text := '000'
     else TmaskEdit(Sender).Text := '00';
end;
//------------------------------------------------------------------------------

procedure Tpia1010aForm.Bsel1Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet1;
end;

procedure Tpia1010aForm.Bsel2Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet2;
end;

procedure Tpia1010aForm.ColorSetting(Sender : TObject);
var
   iIdx : Integer;
begin
   //Color 초기화
   for iIdx := 1 to 7 do
   begin
      Bsel[iIdx].color   := $00E0E0E0;
      SendMessage(Bsel[iIdx].handle,WM_PAINT,0,0);
   end;
   //선택Color
   Bsel[TComponent(Sender).Tag].color := $00D3D3A7;
end;

procedure Tpia1010aForm.Bsel3Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet3;
end;

procedure Tpia1010aForm.Bsel4Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet4;
end;

procedure Tpia1010aForm.Bsel5Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet5;
end;

procedure Tpia1010aForm.Bsel6Click(Sender: TObject);
begin
   if  trim(pstate.Text) >= '80' then
   begin
        MessageBox(handle,'퇴직한 사원의 SK그룹메일 등록/변경을 하실 수는 없습니다.','알 림',MB_OK or $0030);
   end
   else
   begin
        ColorSetting(Sender);
        PageControl1.ActivePage := TabSheet6;
   end;
end;

procedure Tpia1010aForm.Yempno_SKemail;
begin
   if copy(ed_empno.text,1,1) = 'Y' then
   begin
      ed_skemailid.Text := LowerCase('SKBB.'+ed_empno.Text);
// 정문선M 요청 2012.07.11
//      ed_skemailid.ReadOnly := true;
   end
   else
      ed_skemailid.ReadOnly := false;
end;

procedure Tpia1010aForm.jobgunChange(Sender: TObject);
begin
   ChangeCheck := False;
end;

procedure Tpia1010aForm.joblineChange(Sender: TObject);
begin
   ChangeCheck := False;
end;

procedure Tpia1010aForm.jobgunClick(Sender: TObject);
begin
  C_RunSave := 1;
  if save.Caption = '실행' then
  begin
    RunSaveClick(Sender);
  end;
end;

procedure Tpia1010aForm.AlldataSave;//(sender : TPanel);
var
  SaveHelp : TImage;
begin
   Try
   with OraQuery1 do
   begin
      //-------------------- Tab_1  save
      if PageControl1.ActivePage = TabSheet1 then
      begin
         Close;  SQL.Clear;
         SQL.ADD('UPDATE PIMPMAS SET ');
         SQL.ADD(Format('PSTATE      =''%s'',PSTATEYN    =''%s'',PAYCL     =''%s'',empdate=''%s'',',
                        [pstate.Text,        pstateyn.Text,      paycl.Text,       empdate.Text] ));
         SQL.ADD(Format( 'DEPTCODE    =''%s'',ORGNUM    =''%s'',',
                 [       deptcode.Text,    orgnum.Text      ] ));
         //본부코드가 근무지코드에서 소속코드로 변경 저장 2007/11/02 GURA
         //SQL.ADD(Format( 'DEPTCODE    =''%s'',ORGNUM    =''%s'',boncode  =''%s'',',
         //        [       deptcode.Text,    orgnum.Text,      boncode.Caption] ));    
         SQL.ADD(Format( 'BONCODE = (SELECT BONCODE FROM PYCDEPT WHERE ORGNUM=''%s'' AND DEPTCODE=''%s''),',
                         [orgnum.text, deptcode.text] ));
         //여기까지
         SQL.ADD(Format('FIELDCODE   =''%s'',PAYRA       =''%s'',FINCODE   =''%s'',PAYDUNM   =''%s'',',
                [       fieldcode.Caption,  payra.Text,         fincode.Caption,  paydunm.Text] ));
         SQL.ADD(Format('REALTRDATE  =''%s'',OFFTRDATE   =''%s'',PAYRAYN   =''%s'', JOBDEPT  =''%s'', ',
                [       realtrdate.Text,    offtrdate.Text,     payrayn.Text,      jobdept.Text] ));
         SQL.ADD(Format('CPAYRADATE  =''%s'',JOBPLACE    =''%s'',ORGEMPDATE   =''%s'', ',
                [       cpayradate.Text,    jobplace.Text,      orgempdate.Text] ));
         SQL.ADD(Format('GROUPEMPDATE=''%s'',GROUPCOMPANY=''%s'',ROLELEVEL=''%s'', ROLELVDATE   =''%s'', ',
                [       groupempdate.Text,  groupcompany.Text,  rolelevel.Text,   rolelvdate.Text] ));
         SQL.ADD(Format('CPAYCLDATE  =''%s'',PAYCLDATE   =''%s'',OLD_PAYCLDATE =''%s'', REPPAYCL  =''%s'', ',
                [       cpaycldate.Text,    paycldate.Text, old_paycldate.Text,    reppaycl.Text] ));
         SQL.ADD(Format('REPPAYFRDATE=''%s'',REPPAYTODATE=''%s'',APDPAYDUNM=''%s'', ',
                [       reppayfrdate.Text,  repaytodate.Text,   apdpaydunm.Text] ));
         SQL.ADD(Format('jobpayra=''%s'',jobpayrayn=''%s'', ',           // 2001.08.27 shm 추가
                [       jobpayra.Text,  jobpayrayn.Text] ));
         SQL.ADD(Format('APDPAYFRDATE=''%s'',APDPAYTODATE=''%s'',ACTPAYDUNM=''%s'',',
                [       apdpayfrdate.Text,  apdpaytodate.Text,  actpaydunm.Text] ));
         SQL.ADD(Format('ACTPAYFRDATE=''%s'',ACTPAYTODATE=''%s'',',
                [       actpayfrdate.Text,  actpaytodate.Text  ] ));
         SQL.ADD(Format('REMARK      =''%s'',EMPCODE     =''%s'',EMPTERM   =''%s'',',
                [       remark.Text,        empcode.Text,       empterm.Text] ));
         SQL.ADD(Format('EMPSCHGR    =''%s'',EMPPAYCL    =''%s'',',
                 [       empschgr.Text,      emppaycl.Text] ));
         if copy(empno.Text,1,1) = 'Y' then
            SQL.ADD(Format('EMPPAYGR    =''%f'',', [emppaygr.value] ));
         SQL.ADD(Format('BCARYY      =''%f'',BCARMM      =''%f'',',
                 [StrToFloat(bcaryy.Text),StrToFloat(bcarmm.Text)] ));
(*2016.2.18.hjku.. 오류수정.. TabSheet7에서 저장하여야 함. 유훈일M 요청
         SQL.ADD(Format('BIRTHDAY    =''%s'',BIRTHGUBUN  =''%s'',',
                 [       birthday.Text,      birthgubun.Text ] ));
*)
         SQL.ADD(Format('CARDATE     =''%s'',WRITETIME   =''%s'',WRITEEMP  =''%s'' ',
                 [       cardate.Text,       Fn_GetDateTimeStr, P_SaveEmpno] ));
         SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.Text] ));

         EXECSQL;
      end;

      //-----------------------------------tab_2
      if PageControl1.ActivePage = TabSheet2 then
      begin
         Close;  SQL.Clear;
         SQL.ADD('UPDATE PIMPMAS SET ');
         SQL.ADD(Format('JOBGUN     =''%s'',JOBGUNDATE =''%s'',',
                [jobgun.Text,jobgundate.Text]  ));
         SQL.ADD(Format('JOBKIND    =''%s'',JOBKINDDATE=''%s'',',
                [jobkind.Text,jobkinddate.Text] ));
         SQL.ADD(Format('JOBDUTY    =''%s'',JOBDUTYDATE=''%s'',NOGUBUN    =''%s'',NOJEONYN=''%s'',',
                [jobduty.Text,jobdutydate.Text,nogubun.Text,nojeonyn.Text] ));
         SQL.ADD(Format('NOJNFRDATE =''%s'',NOJNTODATE =''%s'',LANCODE    =''%s'',',
                [nojnfrdate.Text,nojntodate.Text,lancode.Text] ));
         SQL.ADD(Format('LANNONO    =''%s'',LANFRDATE  =''%s'',LANTODATE  =''%s'',',
                [lannono.Text,lanfrdate.Text,lantodate.Text] ));
         SQL.ADD(Format('EXDUTCNT   =''%f'',EXDUTYY    =''%f'',EXDUTMM    =''%f'', ',
                [strToFloat(exdutcnt.Text),strToFloat(exdutyy.Text),strToFloat(exdutmm.Text)] ));
         SQL.ADD(Format('EXDUTDD  =''%f'',LEXFRDATE=''%s'',LEXTODATE=''%s'',',
                [strToFloat(exdutdd.Text),lexfrdate.Text,lextodate.Text] ));
         SQL.ADD(Format('LEXDUYY  =''%f'',LEXDUMM  =''%f'',LEXDUDD  =''%f'',',
                [strToFloat(lexduyy.Caption),strToFloat(lexdumm.Caption),strToFloat(lexdudd.Caption)] ));
         SQL.ADD(Format('PAYCLYY  =''%f'',PAYCLMM  =''%f'',PAYCLDD  =''%f'',',
                [strToFloat(payclyy.Text),strToFloat(payclmm.Text),strToFloat(paycldd.Text)] ));
         SQL.ADD(Format('COMDUYY  =''%f'',COMDUMM  =''%f'',COMDUDD  =''%f'',',
                [strToFloat(comduyy.Text),strToFloat(comdumm.Text),strToFloat(comdudd.Text)] ));
         SQL.ADD(Format('WRITETIME=''%s'',WRITEEMP =''%s'' ',
                [Fn_GetDateTimeStr, pia1010aForm.P_SaveEmpno] ));
         SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.Text] ));
         EXECSQL;

         //노조이력관리 입력및 수정 루틴 추가    정규용
         with OraQuery1 do
         begin
              Close;
              SQL.Clear;
              SQL.Add(' select empno from pihnojo              '+
                      '  where empno = ''' + empno.Text + '''  '+
                      '    and chasu = ''' + HyunChasu  + ''' Or chasu is null ');
              Open;

              if RecordCount > 0 then // 현차수의 데이터가 존재하면 UPDATE
              begin
                   Close;
                   SQL.Clear;
                   SQL.Add('update pihnojo                                           '+
                           '   set nogubun   = ''' + nogubun.Text   + ''',           '+
                           '       actfrdate = ''' + nojnfrdate.Text+ ''',           '+
                           '       acttodate = ''' + nojntodate.Text+ ''',           '+
                           '       fullyn    = ''' + nojeonyn.Text  + ''',           '+
                           '       writetime = ''' + Fn_GetDateTimeStr+ ''',         '+
                           '       writeemp  = ''' + pia1010aForm.P_SaveEmpno + '''  '+
                           ' where empno = ''' + empno.Text + '''                    '+
                           '   and chasu = ''' + HyunChasu  + '''                    ');
                   ExecSql;
              end
              else
              begin           // 현차수의 데이터가 없으면 iNSERT
                   Close;
                   SQL.Clear;
                   SQL.Add(' insert into pihnojo '+
                           ' (empno,korname,actfrdate,acttodate,nogubun,chasu,fullyn,writetime,writeemp) '+
                           ' values (''' + empno.Text               + ''',                               '+
                           '         ''' + korname.Text             + ''',                               '+
                           '         ''' + nojnfrdate.Text          + ''',                               '+
                           '         ''' + nojntodate.Text          + ''',                               '+
                           '         ''' + nogubun.Text             + ''',                               '+
                           '         ''' + HyunChasu                + ''',                               '+
                           '         ''' + nojeonyn.Text            + ''',                               '+
                           '         ''' + Fn_GetDateTimeStr        + ''',                               '+
                           '         ''' + pia1010aForm.P_SaveEmpno + ''')                               ');
                   ExecSql;
              end;
         end;
      end;
      //---------------------------------Tab_3
      if PageControl1.ActivePage = TabSheet3 then
      begin
         Close; SQL.Clear;
         SQL.ADD('UPDATE PIMPMAS SET ');
         SQL.ADD(Format('ARMYKIND  =''%s'',ARMYCL    =''%s'',ARMYFIELD =''%s'',',
                 [armykind.Text,armycl.Text,armyfield.Text] ));
         SQL.ADD(Format('ARMYFRDATE=''%s'',ARMYTODATE=''%s'',ARMYDIS   =''%s'',',
                 [armyfrdate.Text,armytodate.Text,armydis.Text] ));
         SQL.ADD(Format('ARMYEX    =''%s'',LSCHGR    =''%s'',LSCHDEG   =''%s'',',
                 [armyex.Text,lschgr.Text,lschdeg.Text] ));
         SQL.ADD(Format('LSCHCODE  =''%s'',LSCHNM    =''%s'',LMAJORCODE=''%s'',',
                 [lschcode.Text,lschnm.Text,lmajorcode.Text] ));
         SQL.ADD(Format('LSCHGRYM  =''%s'',UNICODE   =''%s'',UNIMAJOR  =''%s'',',
                 [lschgrym.Text,unicode.Text,unimajor.Text] ));
         SQL.ADD(Format('LSCHFRYM  =''%s'',UNIFRYM   =''%s'', ',
                 [lschfrym.Text,unifrym.Text] ));
         SQL.ADD(Format('UNIGRYM   =''%s'',LSCHMAJNM =''%s'',LSCHTOPIC =''%s'',',
                 [unigrym.Text,lschmajnm.Text,lschtopic.Text] ));
         SQL.ADD(Format('LICKIND   =''%s'',LICGR    =''%s'',LICGETDATE  =''%s'',',
                 [lickind.Text,licgr.Text,licgetdate.Text] ));
         SQL.ADD(Format('LICALKIND =''%s'',LICALGR  =''%s'',LICALGETDATE=''%s'',',
                 [licalkind.Text,licalgr.Text,licalgetdate.Text] ));
         SQL.ADD(Format('LICALFIELD=''%s'',LICALDATE=''%s'',LICBIGO     =''%s'',',
                 [licalfield.Text,licaldate.Text,licbigo.Text] ));
         SQL.ADD(Format('TOEICSCORE=''%f'',TOEICFULL=''%f'',TOEICDATE   =''%s'',',
                 [StrToFloat(toeicscore.Text),StrToFloat(toeicfull.Text),toeicdate.Text] ));
         SQL.ADD(Format('JPTSCORE  =''%f'',JPTFULL  =''%f'',JPTDATE     =''%s'',',
                 [StrToFloat(jptscore.Text),StrToFloat(jptfull.Text),jptdate.Text] ));
         SQL.ADD(Format('WRITETIME =''%s'',WRITEEMP =''%s'' ',
                 [Fn_GetDateTimeStr, pia1010aForm.P_SaveEmpno] ));
         SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.Text] ));
         EXECSQL;

         ImageList1.GetBitmap(4, Save.Glyph);
         EXECSQL;
      end;
      //-----------------------------------tab_4
      if PageControl1.ActivePage = TabSheet4 then
      begin
         Close;  SQL.Clear;
         SQL.ADD('UPDATE PIMPMAS SET ');
         SQL.ADD(Format('EDUGUBUN   =''%s'',EDUPLACE   =''%s'',EDUCOURSE =''%s'',',
                 [EDUGUBUN.Text,EDUPLACE.Text,EDUCOURSE.Text] ));
         SQL.ADD(Format('EDUFRDATE  =''%s'',EDUTODATE  =''%s'',EDUAREA   =''%s'',',
                 [EDUFRDATE.Text,EDUTODATE.Text,EDUAREA.Text] ));
         SQL.ADD(Format('EDUCONT    =''%s'',EDUDUFRDATE=''%s'',',
                 [EDUCONT.Text,EDUDUFRDATE.Text] ));
         SQL.ADD(Format('EDUDUTODATE=''%s'',LRKIND     =''%s'',',
                 [EDUDUTODATE.Text,LRKIND.Text] ));
         SQL.ADD(Format('LRFRDATE   =''%s'',LRTODATE   =''%s'',LVFRDATE  =''%s'',',
                 [LRFRDATE.Text,LRTODATE.Text,LVFRDATE.Text] ));
         SQL.ADD(Format('LVTODATE   =''%s'',LSEKIND    =''%s'',LSEFRDATE =''%s'',',
                 [LVTODATE.Text,LSEKIND.Text,LSEFRDATE.Text] ));
         SQL.ADD(Format('LSETODATE=''%s'',LSEPLACE=''%s'',',
                 [LSETODATE.Text,LSEPLACE.Text] ));
         SQL.ADD(Format('LSESAYU  =''%s'',LSECONT =''%s'',',
                 [LSESAYU.Text,LSECONT.Text] ));
         SQL.ADD(Format('HUGUBUN  =''%s'',HUFRDATE=''%s'',HUTODATE=''%s'',',
                 [HUGUBUN.Text,HUFRDATE.Text,HUTODATE.Text] ));
         SQL.ADD(Format('RETDATE  =''%s'',RETGUBUN=''%s'',RETSAYU1=''%s'', RETSAYU2 =''%s'',',
                 [RETDATE.Text,RETGUBUN.Text,RETSAYU1.Text,RETSAYU2.Text] ));
         //SQL.ADD(Format('RETSAYU2 =''%s'',RETCONT =''%s'',',[RETSAYU2.Text,RETRETCONT.Text] ));
         SQL.ADD(Format('WRITETIME=''%s'',WRITEEMP=''%s'' ',
                 [Fn_GetDateTimeStr,pia1010aForm.P_SaveEmpno] ));
         SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.Text]));
         EXECSQL;

         Save.Glyph := nil;
         ImageList1.GetBitmap(4, Save.Glyph);
         EXECSQL;
      end;
      //--------------------------tab_5
      if PageControl1.ActivePage = TabSheet5 then
      begin
         Close;
         SQL.Clear;
         SQL.ADD('update pimpmas set ');
         SQL.ADD(Format('OBSKIND   =''%s'',OBSGR     =''%s'',OBSSTATE =''%s'',',
                 [OBSKIND.Text,OBSGR.Text,OBSSTATE.Text] ));
         SQL.ADD(Format('bohungubun=''%s'',bohunnm   =''%s'',BOHUNYN  =''%s'',',
                 [BOHUNGUBUN.Text,BOHUNNM.Text,bohunyn.Text] ));
         SQL.ADD(Format('bohunrel  =''%s'',bohunno   =''%s'',bohunbran=''%s'',',
                 [BOHUNREL.Text,BOHUNNO.Text,BOHUNBRAN.Text] ));
         SQL.ADD(Format('scgubun   =''%s'',scentdate =''%s'',',
                 [SCGUBUN.Text,SCENTDATE.Text] ));
         SQL.ADD(Format('scpredate =''%s'',scenddate =''%s'',sctermyn =''%s'',',
                 [SCPREDATE.Text,SCENDDATE.Text,SCTERMYN.Text] ));
         SQL.ADD(Format('scexyy    =''%f'',scexmm    =''%f'',scexdd   =''%f'',scexcause=''%s'',',
                 [StrToFloat(SCEYY.Text),StrToFloat(SCEMM.Text),StrToFloat(SCEDD.Text),SCSAYU.Text] ));
         SQL.ADD(Format('OTDUFRDATE=''%s'',OTDUTODATE=''%s'', ',
                 [OTDUFRDATE.Text,OTDUTODATE.Text] ));
         SQL.ADD(Format('TCONTR    =''%s'',TCONTRAMT =''%f'',PAYGR = ''%f'', ',
                 [TCONTR.Text,TCONTRAMT.value,tpaygr.value] ));
         SQL.ADD(Format('TTYPE     =''%s'',TJOBDUTY  =''%s'',TCOND = ''%s'', TCOMPANY = ''%s'', TDUTYCLASS = ''%s'', ',
                 [TTYPE.Text,TJOBDUTY.Text,TCOND.Text,trim(Tcompany.text), tdutyclass.Text] ));
         SQL.ADD(Format('WRITETIME =''%s'',WRITEEMP  =''%s'' ',
                 [Fn_GetDateTimeStr,pia1010aForm.P_SaveEmpno] ));
         SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.text] ));

         //sql.savetofile('c:\test.sql');  2017.06.30 eyha 주석처리

         //SaveHelp.Picture.LoadFromFile(bit2);
         Save.Glyph:=nil;
         ImageList1.GetBitmap(4, Save.Glyph);
         EXECSQL;
         close;      sql.clear;
         sql.add(Format('Update pimpmas set remark = ''30''  ' +
                        'where  empno = ''%s'' and scgubun in (''K'',''Y'') and remark is null ',
                        [empno.text]));

         EXECSQL;
      end;
      //--------------------------tab_6
      if PageControl1.ActivePage = TabSheet6 then
      begin
         if  trim(Ed_skemailid.Text) = '' then
         begin
              MessageBox(handle,'등록/변경할 SK그룹메일ID를 입력해 주시기 바랍니다.','에  러',MB_OK or $0010);
         end
         else
         begin
              if (trim(Ed_skemail.Text) = '') then
              begin
                 if MessageBox(handle,'SK그룹메일ID를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
                    system.Exit;
              end
              else
              if (trim(Ed_skemail.Text) <> '') then
                 if Messagedlg('기존 SK그룹메일<'+ed_skemail.Text+'>이 있습니다.'+#13#13+
                               '<'+ed_skemailid.Text+alias.Text+'>으로 변경하시겠습니까 ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                    system.Exit;
              Close;
              SQL.Clear;
              SQL.ADD('update pimpmas set ');
              SQL.ADD(Format('skemail   =''%s'',',
                      [Ed_skemailid.Text+Alias.Text] ));
              SQL.ADD(Format('WRITETIME =''%s'',WRITEEMP  =''%s'' ',
                      [Fn_GetDateTimeStr,pia1010aForm.P_SaveEmpno] ));
              SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.text] ));
              //SaveHelp.Picture.LoadFromFile(bit2);
              Save.Glyph:=nil;
              ImageList1.GetBitmap(4, Save.Glyph);
              EXECSQL;

             //메일이력관리 입력및 수정 루틴 추가   jissi
             with OraQuery1 do
             begin
                Close;
                SQL.Clear;
                SQL.Add(' select empno from poskmail                              '+
                        '  where empno    = ''' + empno.Text + '''                '+
                        '    and workdate = ''' + copy(Fn_GetDateTimeStr,1,8)+''' ');
                Open;

                if RecordCount > 0 then // 데이터가 존재하면 UPDATE
                begin
                     Close;
                     SQL.Clear;
                     SQL.Add('update poskmail                                             '+
                             '   set skmail    = ''' + Ed_skemailid.Text+Alias.Text+ ''', '+
                             '       writetime = ''' + Fn_GetDateTimeStr+ ''',            '+
                             '       writeemp  = ''' + pia1010aForm.P_SaveEmpno + '''     '+
                             ' where empno     = ''' + empno.Text + '''                   '+
                             '   and workdate  = ''' + copy(Fn_GetDateTimeStr,1,8)+'''    ');
                     ExecSql;
                end
                else
                begin           // 데이터가 없으면 iNSERT
                     Close;
                     SQL.Clear;
                     SQL.Add(' insert into poskmail                             '+
                             '        (WORKDATE, OPERATION, CMPCD, CMPPW, EMPNO,'+
                             '         JUMINID,  SKMAIL, WRITEEMP, WRITETIME,   '+
                             '         EAIYN, EAITIME, SUCCESSYN, SUCCESSTIME ) '+
                             ' values (''' + copy(Fn_GetDateTimeStr,1,8) +''',  '+
                             '         ''C'', ''SKB'',''SKB'',                  '+
                             '         ''' + empno.Text + ''', '''',            '+
                             '         ''' + Ed_skemailid.Text+Alias.Text+ ''', '+
                             '         ''' + pia1010aForm.P_SaveEmpno    + ''', '+
                             '         ''' + Fn_GetDateTimeStr           + ''', '+
                             '         ''Y'','''','''',''''                   ) ');
                     ExecSql;
                end;
             end;
         end;
      end;

      if PageControl1.ActivePage = TabSheet7 then
      begin
         begin
              Close;
              SQL.Clear;
              SQL.ADD('update pimpmas set ');
              SQL.ADD(Format('CHNNAME  =''%s'',ENGNAME  =''%s'',ELDSONYN =''%s'',MARRIGEYN=''%s'',',
                     [chnname.Text,engname.Text,eldsonyn.Text,marrigeyn.Text] ));
              if  (trim(juminid.Text) = '-') or (juminid.Text = '') then
                   SQL.ADD(Format('JUMINID  ='''',usaage   =''%f'',korage=''%f'', ',
                          [strToFloat(copy(usaage,1,2)),strToFloat(copy(korage.caption,1,2))] ))
              else
                   SQL.ADD(Format('JUMINID  =''%s'',usaage   =''%f'',korage=''%f'', ',
                          [juminid.Text,strToFloat(copy(usaage,1,2)),strToFloat(copy(korage.caption,1,2))] ));

              //2016.2.18.hjku.. 오류수정 및 추가.. TabSheet1->TabSheet7로 이동. 유훈일M 요청
              SQL.ADD(Format('BIRTHDAY =''%s'',BIRTHGUBUN  =''%s'',',
                     [birthday.Text,           birthgubun.Text ] ));

              SQL.ADD(Format('SEX      =''%s'',HOLDNAME =''%s'',RETCONT  =''%s'',',
                     [sex.Text,holdname.Text, retcont.Text] ));
              SQL.ADD(Format('E_MAIL   =''%s'',SKEMAIL  =''%s'',OFFITEL  =''%s'',',
                     [E_mail.Text,SKemail.Text, offitel.Text] ));
              SQL.ADD(Format('HOLDREL  =''%s'',HOUSETYPE=''%s'',HEALTH =''%s'',',
                     [holdrel.Text,housetype.Text,health.Text] ));
              SQL.ADD(Format('BORNAREA =''%s'',REGADDR=''%s'',',
                     [bornarea.Text,regaddr.Text] ));
              SQL.ADD(Format('CURADDR  =''%s'',ZIPNO    =''%s'',TELNO  =''%s'',',
                     [curaddr.Text,zipno.Text,telno.Text] ));
              SQL.ADD(Format('CURNATION  =''%s'',CURREGION    =''%s'',',
                     [curnation.Text,curregion.Text] ));
                     
              if (Country.Text  = 'KR') or (Country.Text  = 'US') then
                   SQL.ADD(Format('COUNTRY =''%s'', NATION  =''%s'',REGION    =''%s'',ADDRESS  =''%s'',POSTNO    =''%s'',',
                          [Country.Text, nation.Text,region.Text,juminaddr.Text,juminzip.Text] ))
              else if Country.Text  = 'CN' then
                   SQL.ADD(Format('COUNTRY =''%s'', NATION  =''%s'',REGION    =''%s'',ADDRESS  =''%s'',POSTNO    =''%s'',',
                          [Country.Text, nation.Text,region.Text,hoguaddr.Text,hoguzip.Text] ));
(* 국적 저장 2013.02.18 HeeYong
              if Nation.Text  = 'KR' then
                   SQL.ADD(Format('NATION  =''%s'',REGION    =''%s'',ADDRESS  =''%s'',POSTNO    =''%s'',',
                          [nation.Text,region.Text,juminaddr.Text,juminzip.Text] ))
              else if Nation.Text  = 'CN' then
                   SQL.ADD(Format('NATION  =''%s'',REGION    =''%s'',ADDRESS  =''%s'',POSTNO    =''%s'',',
                          [nation.Text,region.Text,hoguaddr.Text,hoguzip.Text] ));
*)
              SQL.ADD(Format('RELIGION =''%s'',HABIT    =''%s'',ABILITY=''%s'',',
                     [religion.Text,habit.Text,ability.Text] ));
              SQL.ADD(Format('BLOOD    =''%s'',HEIGHT   =''%f'',WEIGHT =''%f'',',
                     [blood.Text,height.value,weight.value] ));
              SQL.ADD(Format('WRITETIME=''%s'',WRITEEMP =''%s'' ',
                     [Fn_GetDateTimeStr, pia1010aForm.P_SaveEmpno] ));
              SQL.ADD(Format('WHERE (EMPNO = ''%s'') ',[empno.Text] ));
              EXECSQL;
         end;
      end;

   end;

   EXCEPT ON E : EDataBaseError DO
   begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
   end;
   end;

end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.DataFieldMove6(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (MsgKey = True) and (Key = vk_Return) then begin
       MsgKey := False; system.Exit;
   end;
   if Key = vk_F9  then DataFieldClick(Sender);
   if Key = vk_F12 then saveClick(Sender);
   if not (ssShift in Shift) then
   begin
      if (Key = vk_Return) then
      begin
         case Tcomponent(Sender).Tag of
          1  : begin
               if EnterKey = False then begin
               end;
               EnterKey := False;
               end;
         end;
      end;
   end else
   begin
   end; //if end
end;

//------------------------------------------------------------------------------
procedure Tpia1010aForm.cancelClick(Sender: TObject);
begin
   C_RunSave := 1;
   RunSaveClick(Sender);
end;
//------------------------------------------------------------------------------
procedure Tpia1010aForm.BcodeClick(Sender: TObject);
var
  str : string;
begin
 if FreeCheck = False then
 begin
    Bcode.Caption := '코드 다운중 !!';
 end else
 begin
    Bcode.Caption := '해당코드 다운';
    FreeCheck := False; system.exit;
 end;

 FreeCheck := DiskSpaceCheck;
 if FreeCheck = False then system.exit;

 codeToText(HomeDir+'\pia1010a.cod','',0);
 with OraQuery1 do
 begin
    close; sql.clear;
    sql.add('select codeid,codeno,codename from pyccode ');
    sql.add('where (substr(codeid,1,1) = ''I'') ');
    sql.add('order by codeid,codeno ');
    open;
    while not eof do
    begin
      str := '';
      str := FieldByName('codeid').AsString+','+
             FieldByName('codeno').AsString+','+
             FieldByName('codename').AsString;
      codeToText('',str,1);
      next;
    end;
   OraQuery1.close;
 end;
 codeToText('','',2);
 Bcode.Caption := '해당코드 해제';

end;

procedure Tpia1010aForm.B_ApplinkClick(Sender: TObject);
begin
//   2012.07.06 : link 계정변경
//   ShellExecute(0,'Open','http://account.onesk.sk.com/mailcertificationcenter/MailCheckLogin.aspx','','',SW_SHOWNORMAL);
     ShellExecute(0,'Open','http://account.toktok.sk.com/mailcertificationcenter/MailCheckLogin.aspx','','',SW_SHOWNORMAL);
end;

//날자형식 검사(2012.12.26) HeeYong.
procedure Tpia1010aForm.empdateExit(Sender: TObject);
begin
  If ((DateCheck(TMaskEdit(Sender).Text) = False) and (TMaskEdit(Sender).Text <> '' )) then
  begin
    MessageBox(handle,'날짜를 정확히 입력하세요.','입력오류',MB_ICONEXCLAMATION);
    TMaskEdit(Sender).SetFocus;
    System.exit;
  end;
end;


procedure Tpia1010aForm.Bsel7Click(Sender: TObject);
begin
   ColorSetting(Sender);
   PageControl1.ActivePage := TabSheet7;
end;

procedure Tpia1010aForm.Bn_zipnoInitPopup(Sender: TObject);
begin
(*2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := Copy(zipno.Text,1,3)+Copy(zipno.Text,5,3);
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
*)  
end;

procedure Tpia1010aForm.Bn_zipnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
(*2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  Tmpcuraddr            := '';
  Tmpcuraddrlen         := 0;

  if ZipForm.Zipno <> '' then
  begin
      zipno.Text         := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
      curaddr.Text       := ZipForm.Addr;
      curnation.Text     := ZipForm.Nation_CD;
      Ncurnation.caption := ZipForm.Nation_NAME;
      curregion.Text     := ZipForm.REGION_CD;
      Ncurregion.caption := ZipForm.REGION_NAME;
      Tmpcuraddr         := ZipForm.Addr;
      Tmpcuraddrlen      := Length(ZipForm.Addr);
      curaddr.SetFocus;
{  end
  else
  begin
       MessageDlg('우편번호 검색실패!!!.  검색 재시도 또는 직접입력하시기 바랍니다',mtError, [mbOk],0);
       Ed_zipno.ReadOnly := False;}
  end;
  *)
end;

procedure Tpia1010aForm.BN_juminzipInitPopup(Sender: TObject);
begin
(*2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := Copy(juminzip.Text,1,3)+Copy(juminzip.Text,5,3);
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
*)  
end;

procedure Tpia1010aForm.BN_juminzipCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
(*2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  Tmpjuminaddr            := '';
  Tmpjuminaddrlen         := 0;

  if ZipForm.Zipno <> '' then
    begin
      juminzip.Text        := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
      juminaddr.Text       := ZipForm.Addr;
      nation.Text          := ZipForm.Nation_CD;
      Nnation.caption      := ZipForm.Nation_NAME;
      region.Text          := ZipForm.REGION_CD;
      Nregion.caption      := ZipForm.REGION_NAME;
      Tmpjuminaddr         := ZipForm.Addr;
      Tmpjuminaddrlen      := Length(ZipForm.Addr);
      juminaddr.SetFocus;
{    end
  else
    begin
       MessageDlg('우편번호 검색실패!!!.  검색 재시도 또는 직접입력하시기 바랍니다',mtError, [mbOk],0);
       Ed_zipno.ReadOnly := False;}
    end;
*)    
end;

procedure Tpia1010aForm.juminaddrExit(Sender: TObject);
begin
{2015.03.04.hjku..  직적수정으로 막음..
   if (Tmpjuminaddr<>'') and (Copy(juminaddr.Text,1,Tmpjuminaddrlen) <> Tmpjuminaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         juminaddr.Text := Tmpjuminaddr;
         juminaddr.SetFocus;
      end
   else if (Tmpjuminaddr='') and (Tmpfulljuminaddr <> juminaddr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         juminaddr.Text := Tmpfulljuminaddr;
         juminaddr.SetFocus;
      end;
  }
end;

procedure Tpia1010aForm.CountryChange(Sender: TObject);
begin
  if   Country.Text = 'KR' then
  begin
       NCountry.Caption    := '한국';
       Nation.Text         := 'KR';
       NNation.Caption     := '한국';
       region.Text         := '';
       Nregion.Caption     := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := True;
       BN_juminzip.Enabled := True;
       juminaddr.Enabled   := True;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end
  else if Country.Text = 'US' then
  begin
       NCountry.Caption    := '미국';
       Nation.Text         := 'US';
       NNation.Caption     := '미국';
       region.Text         := '';
       Nregion.Caption     := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := True;
       BN_juminzip.Enabled := True;
       juminaddr.Enabled   := True;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end
  else if Country.Text = 'CN' then
  begin
       NCountry.Caption    := '중국';
       Nation.Text         := 'CN';
       NNation.Caption     := '중국';
       region.Text         := '';
       Nregion.Caption     := '';
       juminzip.Text       := '';
       juminaddr.Text      := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := False;
       BN_juminzip.Enabled := False;
       juminaddr.Enabled   := False;
       Hoguaddr.Enabled    := True;
       Hoguzip.Enabled     := True;
  end
  else
  begin
       Nation.Text         := Country.Text;
       NNation.Caption     := NCountry.Caption;
       region.Text         := '';
       Nregion.Caption     := '';
       juminzip.Text       := '';
       juminaddr.Text      := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       nation.Enabled      := False;
       region.Enabled      := False;
       juminzip.Enabled    := False;
       BN_juminzip.Enabled := False;
       juminaddr.Enabled   := False;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end;
end;

procedure Tpia1010aForm.nationChange(Sender: TObject);
begin
  if   Nation.Text = 'KR' then
  begin
       NNation.Caption     := '한국';
       region.Text         := '';
       Nregion.Caption     := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := True;
       BN_juminzip.Enabled := True;
       juminaddr.Enabled   := True;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end
  else if Nation.Text = 'US' then
  begin
       NNation.Caption     := '미국';
       region.Text         := '';
       Nregion.Caption     := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := True;
       BN_juminzip.Enabled := True;
       juminaddr.Enabled   := True;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end
  else if Nation.Text = 'CN' then
  begin
       NNation.Caption     := '중국';
       region.Text         := '';
       Nregion.Caption     := '';
       juminzip.Text       := '';
       juminaddr.Text      := '';
       nation.Enabled      := True;
       region.Enabled      := True;
       juminzip.Enabled    := False;
       BN_juminzip.Enabled := False;
       juminaddr.Enabled   := False;
       Hoguaddr.Enabled    := True;
       Hoguzip.Enabled     := True;
  end
  else
  begin
       region.Text         := '';
       Nregion.Caption     := '';
       juminzip.Text       := '';
       juminaddr.Text      := '';
       Hoguaddr.Text       := '';
       Hoguzip.Text        := '';
       juminzip.Enabled    := False;
       BN_juminzip.Enabled := False;
       juminaddr.Enabled   := False;
       Hoguaddr.Enabled    := False;
       Hoguzip.Enabled     := False;
  end;
end;

procedure Tpia1010aForm.lschfrymExit(Sender: TObject);
begin
  If ((DateCheck(TMaskEdit(Sender).Text+'01') = False) and (TMaskEdit(Sender).Text <> '' )) then
  begin
    MessageBox(handle,'날짜를 정확히 입력하세요.','입력오류',MB_ICONEXCLAMATION);
    TMaskEdit(Sender).SetFocus;
    System.exit;
  end;
end;

procedure Tpia1010aForm.zipnoKeyPress(Sender: TObject; var Key: Char);
begin
    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
    //우편번호 입력은 숫자 최대 5~6자리만 가능하도록 수정
    if not (Key in ['0'..'9', Char(VK_DELETE), Char(VK_BACK)]) then    Key := #0;
end;

procedure Tpia1010aForm.juminzipKeyPress(Sender: TObject; var Key: Char);
begin
    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
    //우편번호 입력은 숫자 최대 5~6자리만 가능하도록 수정
    if not (Key in ['0'..'9', Char(VK_DELETE), Char(VK_BACK)]) then    Key := #0;
end;

procedure Tpia1010aForm.juminidExit(Sender: TObject);
begin
  //dsa2000  2018.04.05       요청번호 SR-1804-0217 
  if (Length(Trim(juminid.Text)) > 2 ) and (Length(Trim(juminid.Text)) < 14) then
  begin
       MessageDlg('주민번호 13자리를 채워주시기 바랍니다.'+#13+#13+
                  '부득이한 경우 성별에 따라 뒷자리를 "1111111" 또는 "2222222" 입력하고'+#13#13+
                  '추후 반드시 정상적인 주민번호로 변경 바랍니다',mtError,[mbOK],0);
  end;
end;

procedure Tpia1010aForm.CountryExit(Sender: TObject);
begin
  CountryChange(Sender);
end;

procedure Tpia1010aForm.curnationExit(Sender: TObject);
begin
  if      Country.Text = 'KR' then Ncurnation.Caption := '한국'
  else if Country.Text = 'US' then Ncurnation.Caption := '미국'
  else if Country.Text = 'CN' then Ncurnation.Caption := '중국';
  if curregion.Enabled then curregion.SetFocus;
end;

procedure Tpia1010aForm.BitBtn1Click(Sender: TObject);
begin

     //20180702 신범주추가
     PIA10102Form := TPIA10102Form.Create(self);
     try
        PIA10102Form.ShowModal;
        
     finally
        PIA10102Form.Free;
     end;
end;

procedure Tpia1010aForm.empnoKeyPress(Sender: TObject; var Key: Char);
begin

  // 2018-07-03 신범주 추가
  if Key = chr(13) then

     begin

          FKeyEmpnoB := TFKeyEmpnoB.Create(self);

          Try

               FKeyEmpnoB.EdEmpno.Text := empno.Text;

               FKeyEmpnoB.v_EmpGb    := 'A';

               FKeyEmpnoB.v_CloseGb := True;

               FKeyEmpnoB.BBrun.OnClick(Sender);

               if FKeyEmpnoB.CloseChk <> -1 then

               begin

                    empno.TExt := FKeyEmpnoB.v_KeyEmpno;

                    korname.Text := FKeyEmpnoB.v_KeyKorname;

               end

               else

               begin

                    FKeyEmpnoB.ShowModal;

                    empno.TExt := FKeyEmpnoB.v_KeyEmpno;

                    korname.Text := FKeyEmpnoB.v_KeyKorname;

               end;

          Finally

               FKeyEmpnoB.Free;

          end;

     end;
end;

// 빈 칸 체크
function Tpia1010aForm.CheckSpace(text: String): integer;
var
  i, flag : integer;
begin
  flag := 0 ;
  for i := 0 to length(text) do
  begin
    if text[i] = ' ' then flag := 1;
  end;

  result := flag;
end;

end.



