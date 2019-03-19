{-------------------------------------------------------------------------------
 PROGRAM-NAME   : Pkc1090a(파견직급여당월내역관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 파견직급여계산
 Programmer     : 김태호
 Version        : 30.00
 Date           : 2010.04.12
Update Contents
  버전    수정일       수정자    관련근거     수정내용
  10.00   2010.04.12   김태호   설계명세서    최초개발본

--------------------------------------------------------------------------------}
unit PKY1120A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Tabnotbk, StdCtrls, Buttons, ExtCtrls, DB, DBTables, NumEdit,
  Mask, Math, Tmax_DataSetText, Tmax_session, OnTmaxInsaData, OnInsaCommon, Ora,
  OnSkinBtn, OnFocusButton, TmaxFunc,Func, KeyEmpNo, KeyEmpnoY, KeyCode, Deptcode;//, Pass

type

  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    maintitle: TPanel;
    P_Key: TPanel;
    SB_EmpNo: TSpeedButton;
    Panel5: TPanel;
    E_EmpNO: TEdit;
    Panel7: TPanel;
    P_PayDate: TPanel;
    P_Help: TPanel;
    Panel3: TPanel;
    P_Buttons: TPanel;
    BB_Delete: TBitBtn;
    BB_Save: TBitBtn;
    BB_Cancel: TBitBtn;
    BB_Close: TBitBtn;
    BB_PayGen: TBitBtn;
    BB_Insert: TBitBtn;
    E_KorName: TEdit;
    BB_Indi: TBitBtn;
    SaveDialog1: TSaveDialog;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    TabbedNotebook1: TTabbedNotebook;
    SB_PayCl: TSpeedButton;
    SB_Pstate: TSpeedButton;
    SB_BloCode: TSpeedButton;
    SB_DeptCode: TSpeedButton;
    SB_PayRa: TSpeedButton;
    SB_PayBank: TSpeedButton;
    SB_PayBank1: TSpeedButton;
    Panel6: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    E_DeptCode: TEdit;
    P_PayCl: TPanel;
    P_BldCode: TPanel;
    CB_PayYn: TComboBox;
    E_PayCl: TEdit;
    P_PState: TPanel;
    E_OrgNum: TEdit;
    E_BldCode: TEdit;
    Panel88: TPanel;
    E_PayRa: TEdit;
    P_PayRa: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    E_PayBank: TEdit;
    E_PayAcnt: TEdit;
    P_PayBank: TPanel;
    Panel146: TPanel;
    Panel147: TPanel;
    E_PayBank1: TEdit;
    E_PayAcnt1: TEdit;
    P_PayBank1: TPanel;
    Panel26: TPanel;
    NE_DevideMon: TNumberEdit;
    Panel18: TPanel;
    Panel31: TPanel;
    NE_FixPay: TNumberEdit;
    NE_YbonAmt: TNumberEdit;
    Panel42: TPanel;
    NE_McarAmt: TNumberEdit;
    Panel37: TPanel;
    NE_OvtmAmt: TNumberEdit;
    Panel148: TPanel;
    NE_OvmcAmt: TNumberEdit;
    Panel48: TPanel;
    NE_LectSupAmt: TNumberEdit;
    Panel15: TPanel;
    NE_BFixPay: TNumberEdit;
    Panel166: TPanel;
    NE_LectSupAmt1: TNumberEdit;
    Panel167: TPanel;
    NE_LectSupAmt2: TNumberEdit;
    Panel40: TPanel;
    NE_AidAmt1: TNumberEdit;
    Panel85: TPanel;
    NE_TaxPay: TNumberEdit;
    Panel86: TPanel;
    NE_NoTaxPay: TNumberEdit;
    Panel141: TPanel;
    NE_SoPaySum: TNumberEdit;
    Panel39: TPanel;
    NE_AidAmt3: TNumberEdit;
    Panel16: TPanel;
    NE_BasicAmt: TNumberEdit;
    Panel25: TPanel;
    NE_BonusAmt: TNumberEdit;
    Panel132: TPanel;
    NE_HomeSupAmt: TNumberEdit;
    Panel23: TPanel;
    NE_AidAmt11: TNumberEdit;
    Panel27: TPanel;
    NE_AidAmt12: TNumberEdit;
    Panel51: TPanel;
    NE_AidAmt13: TNumberEdit;
    Panel52: TPanel;
    NE_AidAmt14: TNumberEdit;
    Panel150: TPanel;
    NE_TaxPay1: TNumberEdit;
    Panel153: TPanel;
    NE_TaxPay2: TNumberEdit;
    Panel156: TPanel;
    NE_NoTaxPay1: TNumberEdit;
    Panel157: TPanel;
    NE_NoTaxPay2: TNumberEdit;
    Panel160: TPanel;
    NE_SoPaySum1: TNumberEdit;
    Panel161: TPanel;
    NE_SoPaySum2: TNumberEdit;
    Panel163: TPanel;
    NE_SoPaySum3: TNumberEdit;
    NE_DedAmt1: TNumberEdit;
    Panel98: TPanel;
    Panel68: TPanel;
    NE_TicketAmt: TNumberEdit;
    NE_AnudAmt: TNumberEdit;
    Panel59: TPanel;
    Panel58: TPanel;
    Panel127: TPanel;
    NE_MeddAmt: TNumberEdit;
    NE_EmpldAmt: TNumberEdit;
    Panel101: TPanel;
    GroupBox1: TGroupBox;
    Panel89: TPanel;
    NE_PaySum: TNumberEdit;
    Panel91: TPanel;
    NE_NoTaxPaySum: TNumberEdit;
    Panel90: TPanel;
    NE_TaxPaySum: TNumberEdit;
    Panel110: TPanel;
    NE_RealPay: TNumberEdit;
    Panel109: TPanel;
    NE_DedSum: TNumberEdit;
    GroupBox2: TGroupBox;
    Panel99: TPanel;
    NE_DedAmt2: TNumberEdit;
    Panel17: TPanel;
    NE_dedamt4: TNumberEdit;
    Panel100: TPanel;
    NE_DedAmt3: TNumberEdit;
    E_Pstate: TEdit;
    P_DeptCode: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    NE_TaxPay3: TNumberEdit;
    NE_TaxPay4: TNumberEdit;
    ck_MeddAmt: TCheckBox;
    NE_NoTaxPay3: TNumberEdit;
    Panel158: TPanel;
    BB_PaySum: TBitBtn;
    procedure SB_EmpNoClick(Sender: TObject);
    procedure E_EmpNOChange(Sender: TObject);
    procedure BB_SearchClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure BB_PayGenClick(Sender: TObject);
    procedure NE_FixPayExit(Sender: TObject);
    procedure SB_PayClClick(Sender: TObject);
    procedure SB_PstateClick(Sender: TObject);
    procedure SB_BloCodeClick(Sender: TObject);
    procedure SB_PayBankClick(Sender: TObject);
    procedure E_PayClChange(Sender: TObject);
    procedure E_PstateChange(Sender: TObject);
    procedure E_BldCodeChange(Sender: TObject);
    procedure E_PayBankChange(Sender: TObject);
    procedure SB_DeptCodeClick(Sender: TObject);
    procedure E_OrgNumChange(Sender: TObject);
    procedure E_DeptCodeChange(Sender: TObject);
    procedure BB_InsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KeyFieldOnClick(Sender: TObject);
    procedure ChangeEvent(Sender: TObject);
    procedure E_PayRaChange(Sender: TObject);
    procedure SB_PayRaClick(Sender: TObject);
    procedure E_EmpNOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NE_EmpldAmtExit(Sender: TObject);
    procedure SB_PayBank1Click(Sender: TObject);
    procedure E_PayBank1Change(Sender: TObject);
    procedure BB_IndiClick(Sender: TObject);
    procedure BB_PaySumClick(Sender: TObject);

  private
    { Private declarations }
    DataChange : Boolean;
    ActiveFlag : Boolean;
    Rundate,  ProgId, CmdStr   : String;  //서비스 개발...

  public
    { Public declarations }
    PayDate       : String[06];
    WorkMode      : Integer;              { 초기 상태는 1, 입력 모드는 2, 갱신 모드는 3 }
    KeyValue      : String;
    BeforeValue   : Real;

    Procedure Read_Pkcemtbl;
    Procedure Get_PayDate;
    Procedure Get_Record( InEmpNo : String );
    Procedure Clear_Fields;
    procedure Update_Record;
    Procedure Insert_Record;
    Procedure Delete_Record;
    Procedure Process_PaySumChange;
    Procedure Process_DedChange   ;
    Procedure Process_DedSumChange;
    Procedure Set_EmpldAmt;
    Procedure Get_RealPay;
    Procedure LookUp_Enable;
    Procedure LookUp_Disable;
    Procedure SetUp;
    Function  Get_PresidentEmpNo : String;
    Function  Check_EmpNo( InEmpNo : String ) : Boolean;
    Function  Check_Duplicate(InEmpNo : String) : Boolean;
    Function  Check_AtInSert : Boolean;
    procedure Read_mcarnotax(arg_empno:string);
  end;

var
  FM_Main: TFM_Main;

  bonusyn        : String[01];
  AvgODAmt       : Real;
  Devidemon      : Real;
  SaveTax        : Real;
  GSMCarNOTax    : Real;  //기준tbl에 있는 식교비 비과세금액
  MCarNOTax      : Real;
  Msg            : Array[0..500] of Char;
  Smsg           : String;

  {-고용보험-}
  BaseMM         : Real;
  JuminID        : String;
  basicamtYN     : String;
  dutyamtYN      : String;
  infoamtYN      : String;
  FixPayYN       : String;
  HoliPayYN      : String;
  QuaterPayYN    : String;
  RoleAmtYN      : String;
  YBONAMTYN      : String;
  SBONAMTYN      : String;
  LONGSUPAMTYN   : String;
  MBONAMTYN      : String;
  MATEAMTYN      : String;
  PARTAMTYN      : String;
  CHILDAMTYN     : String;
  LICEAMTYN      : String;
  OVTMAMTYN      : String;
  SPTMAMTYN      : String;
  AIDAMT1YN      : String;
  AIDAMT2YN      : String;
  AIDAMT3YN      : String;
  MCARAMTYN      : String;
  YUEDUAMTYN     : String;
  SELFEDUAMTYN   : String;
  ODAMTYN        : String;
  DRVLICEAMTYN   : String;
  LECTSUPAMTYN   : String;
  EDUSUPAMTYN    : String;
  BOKJISUPAMTYN  : String;
  MEDSUPAMTYN    : String;
  SUPAMT1YN      : String;
  SUPAMT2YN      : String;
  SUPAMT3YN      : String;
  OVMCAMTYN      : String;
  CHILDEDUAMTYN  : String;
  TAXPAYYN       : String;
  NOTAXPAYYN     : String;
  TAXBONUSYN     : String;
  SOPAYYN        : String;
  SOBONYN        : String;
  ITAMTYN        : String; //dsa2000
  EXFRYYMM       : String;
  EMPLDRATE      : Real;
  Y_EMPLDRATE    : Real;

  yy_taxsum18    : Real;
  yy_taxsum12    : Real;
  yy_taxsum4     : Real;
  yy_taxsum1     : Real;
  monthrate      : Real;
implementation

{$R *.DFM}


{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}

{==============================================================================
         사장님의 사번을 구하는 함수.
 ==============================================================================}
Function TFM_Main.Get_PresidentEmpNo : String;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select presempno from pkcpbas ');
               Open;
               Result := FieldByName('presempno').AsString;
               Close;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
          입력한 사번이 유효한 지를 체크하는 Procedure.
 ==============================================================================}
Function TFM_Main.Check_EmpNo( InEmpNo : String ) : Boolean;
begin
     E_KorName.Text := GetKorName(InEmpNo);

     if E_KorName.Text = '' then
     begin
          P_Help.Caption := '   급여마스터에 등록되어 있지 않은 사번입니다.';
          Result         := False;
          System.Exit;
     end;

     P_Help.Caption := '';
     Result         := True;
end;

{==============================================================================
          'Insert' 전에 Key value의 중복여부를 점검하는 함수.
 ==============================================================================}
Function TFM_Main.Check_Duplicate(InEmpNo : String) : Boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select Count(*) a from pkmpycalc  ');
               SQL.Add(' where empno = :p_empno          ');
               ParamByName('empno').AsString := InEmpNo;
               Open;

               if FieldByName('a').AsInteger > 0 then Result := False
               else                                  Result := True;
          end;
     Finally
          qq.Free;
     end;
end;


{===============================================================================
          저장 작업전에 Data의 무결성을 Check하는 함수.
 ===============================================================================}
Function TFM_Main.Check_AtInSert : Boolean;
begin
     if not Check_Duplicate(E_EmpNo.Text) then
     begin
          Smsg := '월급여화일에 등록되어 있는 사번과 중복됩니다. '+#13+
                  '확인하시고 다시 입력하시기 바랍니다.';
          Application.MessageBox(StrPCopy(Msg,SMsg),'입력오류',MB_OK+MB_ICONERROR);
          E_EmpNo.SetFocus;
          Result := False;
          System.Exit;
     end;

     Result := True;
end;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}


{===============================================================================
          월급여화일에서 현급여지급월을 읽어오는 Procedure.
================================================================================}
Procedure TFM_Main.Get_PayDate;
var
     qq : TOraQuery;
begin

     P_Help.Caption := '   현급여지급월을 읽고 있습니다.';
     Application.ProcessMessages;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select max(paydate) a from pkmpycalc ');
               Open;

               if Eof then
               begin
                    P_PayDate.Caption := '';
                    P_Help.Caption    := '  월급여화일에 자료가 하나도 없습니다. ';
               end
               else
                    PayDate := FieldByName('a').AsString;

               P_PayDate.Caption := InMask(Copy(PayDate,1,6),'@@@@-@@');
          end;
     Finally
          qq.Free;
     end;
end;

{===============================================================================
  10.02	  1998.08.13   이랑교	콜98-08-13    식교비_과세 산정방법 변경
                                            : 식당소재지역 100% 과세 ( 단,임원제외)
    식당소재 지역 여부확인 :   식교비 비과세금액 산정   Procedure.
    30.08   1999.01.27  이랑교   직급변경시 누락
    식당소재 지역 100% 비과세 단, 임원은 제외  따라서 paycl > '09' 사람만
================================================================================}
procedure TFM_Main.Read_mcarnotax(arg_empno:string);
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select count(*) cnt                             ');
               SQL.Add('  from pkmpycalc                                 ');
               SQL.Add(' where bldcode in (select bldcode from pkcpbld  ');
               SQL.Add('                    where restyn = ''Y'')       ');
               SQL.Add('   and paycl >= ''C11''                           ');
               SQL.Add('   and empno = :p_empno                         ');
               ParamByName('p_empno').AsString := arg_empno;
               Open;

               if FieldByName('cnt').AsInteger = 1 then MCarNoTax := 0
               else                                     MCarNoTax := GSMCarNoTax;
          end;
     Finally
          qq.Free;
     end;
end;

{===============================================================================
     사번과 급여지급월에 따른  Record를 가져 오는 Function.
 ===============================================================================}
Procedure TFM_Main.Get_Record( InEmpNo : String );
var
     qq : TOraQuery;
     A, B, C, ex_val : Real;
     Tmp          : Real;
     YY_TaxPaySum : Real;
     YY_InTax     : Real;
begin
     monthrate := 0.0;

     Read_mcarnotax(Inempno);  //식교비 비과세금액 setting

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.*,                                                                     ');
               SQL.Add('       b.juminid,                                                               ');
//               SQL.Add('       a.yueduamt-(least(nvl(a.yueduamt,0), c.childnotax )) yuedutax,           ');
//               SQL.Add('       (a.fixpay+a.quaterpay+a.holipay) /                                       ');
//               SQL.Add('         ( (a.fixpay+ a.quaterpay+ a.holipay) /                                 ');
//               SQL.Add('            decode(a.fixpay,0,1,a.fixpay) )*18 yy_taxsum18,                     ');
               SQL.Add('       (a.mateamt+a.partamt+a.childamt+a.liceamt+a.ovtmamt+                     ');
               SQL.Add('        a.mcartaxamt+a.sptmamt+a.itamt+a.bokjisupamt+a.odtaxamt+                ');
               SQL.Add('        (a.yueduamt-least(nvl(a.yueduamt,0), c.childnotax))+                    ');
               SQL.Add('        a.trainsupamt+a.lectsupamt+a.aidamt1+a.aidamt3+                         ');
               SQL.Add('        a.childeduamt+a.selfeduamt+a.ovmcamt+                                   ');
               SQL.Add('        a.edusupamt+a.taxpay1)*12 yy_taxsum12,                                  ');
               SQL.Add('       a.winteramt*4 yy_taxsum4 ,                                               ');
               SQL.Add('       (a.taxpay2+a.taxpay3+a.taxpay4+a.ybonamt+                                ');
               SQL.Add('        a.sbontaxamt+a.sopaysum+a.medsupamt+                                    ');
               SQL.Add('        a.homesupamt+a.sbonamt+a.aidamt2)*1 yy_taxsum1,                         ');
               SQL.Add('       (a.fixpay+a.quaterpay+a.holipay)/decode(a.fixpay,0,1,a.fixpay) monthrate ');
               SQL.Add('  from pkmpycalc a, pkmpmas b, pkcpbas c                                         ');
               SQL.Add(' where a.empno = :p_empno                                                       ');
               SQL.Add('   and a.empno = b.empno                                                        ');
               ParamByName('p_empno').AsString := InEmpNo;
               Open;

               if Eof then
               begin
                    P_Help.Caption := '   등록된 자료가 없습니다.';
                    LookUp_Disable;
               end
               else
               begin
                    monthrate            := FieldByName('monthrate').AsFloat;   //당월 지급되는 (월정+분기+명절연봉)/월정 의 비율
                    KeyValue             := FieldByName('Empno').AsString;
                    Juminid              := FieldByName('juminid').AsString;
                    E_korname.Text       := FieldByName('korname').AsString;
                    E_PayCl.Text         := FieldByName('PayCl').AsString;
                    E_Pstate.Text        := FieldByName('Pstate').AsString;
                    E_PayRa.Text         := FieldByName('PayRa').AsString;
                    E_OrgNum.Text        := FieldByName('OrgNum').AsString;
                    E_DeptCode.Text      := FieldByName('DeptCode').AsString;
                    E_BldCode.Text       := FieldByName('BldCode').AsString;
                    CB_PayYN.Text        := FieldByName('PayYN').AsString;
                    E_PayBank.Text       := FieldByName('PayBank').AsString;
                    E_PayAcnt.Text       := FieldByName('PayAcnt').AsString;
                    E_PayBank1.Text      := FieldByName('PayBank1').AsString;
                    E_PayAcnt1.Text      := FieldByName('PayAcnt1').AsString;
                    NE_DevideMon.Value   := FieldByName('DevideMon').AsInteger;
                    NE_BasicAmt.Value    := FieldByName('BasicAmt').AsFloat;
                    NE_FixPay.Value      := FieldByName('FixPay').AsFloat;
                    NE_BFixPay.Value     := FieldByName('BFixPay').AsFloat;
                    NE_BonusAmt.Value    := FieldByName('BonusAmt').AsFloat;
                    NE_YbonAmt.Value     := FieldByName('YbonAmt').AsFloat;
                    NE_OvtmAmt.Value     := FieldByName('OvtmAmt').AsFloat;
                    NE_AidAmt1.Value     := FieldByName('AidAmt1').AsFloat;
                    NE_AidAmt11.Value    := FieldByName('AidAmt11').AsFloat;
                    NE_AidAmt12.Value    := FieldByName('AidAmt12').AsFloat;
                    NE_AidAmt13.Value    := FieldByName('AidAmt13').AsFloat;
                    NE_AidAmt14.Value    := FieldByName('AidAmt14').AsFloat;
                    NE_AidAmt3.Value     := FieldByName('AidAmt3').AsFloat;
                    NE_McarAmt.Value     := FieldByName('McarAmt').AsFloat;
                    NE_LectSupAmt.Value  := FieldByName('LectSupAmt').AsFloat;
                    NE_HomeSupAmt.Value  := FieldByName('HomeSupAmt').AsFloat;
                    NE_OvmcAmt.Value     := FieldByName('OvmcAmt').AsFloat;

                    NE_TaxPay.Value      := FieldByName('TaxPay').AsFloat;
                    NE_TaxPay1.Value     := FieldByName('TaxPay1').AsFloat;
                    NE_TaxPay2.Value     := FieldByName('TaxPay2').AsFloat;
                    NE_TaxPay3.Value     := FieldByName('TaxPay3').AsFloat;
                    NE_TaxPay4.Value     := FieldByName('TaxPay4').AsFloat;

                    NE_NoTaxPay.Value    := FieldByName('NoTaxPay').AsFloat;
                    NE_NoTaxPay1.Value   := FieldByName('NoTaxPay1').AsFloat;
                    NE_NoTaxPay2.Value   := FieldByName('NoTaxPay2').AsFloat;
                    NE_NoTaxPay3.Value   := FieldByName('NoTaxPay3').AsFloat;

                    NE_PaySum.Value      := FieldByName('PaySum').AsFloat;
                    NE_TaxPaySum.Value   := FieldByName('TaxPaySum').AsFloat;
                    NE_NoTaxPaySum.Value := FieldByName('NoTaxPaySum').AsFloat;

                    NE_MeddAmt.Value     := FieldByName('MeddAmt').AsFloat;
                    NE_EmpldAmt.Value    := FieldByName('EmpldAmt').AsFloat;
                    NE_AnudAmt.Value     := FieldByName('AnudAmt').AsFloat;

                    NE_TicketAmt.Value   := FieldByName('TicketAmt').AsFloat;

                    NE_DedAmt1.Value     := FieldByName('DedAmt1').AsFloat;
                    NE_DedAmt2.Value     := FieldByName('DedAmt2').AsFloat;
                    NE_DedAmt3.Value     := FieldByName('DedAmt3').AsFloat;
                    NE_DedAmt4.Value     := FieldByName('DedAmt4').AsFloat;

                    NE_DedSum.Value      := FieldByName('DedSum').AsFloat;
                    NE_RealPay.Value     := FieldByName('Realpay').AsFloat;

                    NE_SoPaySum.Value    := FieldByName('SoPaySum').AsFloat;
                    NE_SoPaySum1.Value   := FieldByName('SoPaySum1').AsFloat;
                    NE_SoPaySum2.Value   := FieldByName('SoPaySum2').AsFloat;
                    NE_SoPaySum3.Value   := FieldByName('SoPaySum3').AsFloat;


                    NE_lectsupamt.Value  := FieldByName('lectsupamt').AsFloat;
                    NE_lectsupamt1.Value := FieldByName('lectsupamt1').AsFloat;
                    NE_lectsupamt2.Value := FieldByName('lectsupamt2').AsFloat;

                    DevideMon            := FieldByName('DevideMon').AsFloat;



                    if A < 0 then A := 0;


                    LookUp_Disable;
                    P_Help.Caption := '   조회가 완료되었습니다.';
               end;
          end;
     Finally
          qq.Free;
     end;
end;



{===============================================================================
    화명의 필드들을 Clear 시킨다.
================================================================================}
Procedure TFM_Main.Clear_Fields;
begin

     E_PayCl.Text            := '';

     E_Pstate.Text           := '';
     E_PayRa.Text            := '';
     E_OrgNum.Text           := '';
     E_DeptCode.Text         := '';
     E_BldCode.Text          := '';
     CB_PayYN.Text           := '';

     E_PayBank.Text          := '';
     E_PayAcnt.Text          := '';
     E_PayBank1.Text         := '';
     E_PayAcnt1.Text         := '';

     NE_BasicAmt.Value       := 0;

     NE_FixPay.Value         := 0;
     NE_BFixPay.Value        := 0;

     NE_BonusAmt.Value       := 0;
     NE_DevideMon.Value      := 0;

     NE_YbonAmt.Value        := 0;

     NE_OvtmAmt.Value        := 0;

     NE_AidAmt1.Value        := 0;
     NE_AidAmt11.Value       := 0;
     NE_AidAmt12.Value       := 0;
     NE_AidAmt13.Value       := 0;
     NE_AidAmt14.Value       := 0;


     NE_AidAmt3.Value        := 0;
     NE_McarAmt.Value        := 0;

     NE_LectSupAmt.Value     := 0;

     NE_HomeSupAmt.Value     := 0;


     NE_OvmcAmt.Value        := 0;


     NE_TaxPay.Value         := 0;
     NE_TaxPay1.Value        := 0;
     NE_TaxPay2.Value        := 0;
     NE_TaxPay3.Value        := 0;
     NE_TaxPay4.Value        := 0;

     NE_NoTaxPay.Value       := 0;
     NE_NoTaxPay1.Value      := 0;
     NE_NoTaxPay2.Value      := 0;
     NE_NoTaxPay3.Value      := 0;

     NE_PaySum.Value         := 0;
     NE_TaxPaySum.Value      := 0;

     NE_NoTaxPaySum.Value    := 0;

     NE_MeddAmt.Value        := 0;
     NE_EmpldAmt.Value       := 0;
     NE_AnudAmt.Value        := 0;

     NE_TicketAmt.Value      := 0;

     NE_DedAmt1.Value        := 0;
     NE_DedAmt2.Value        := 0;
     NE_DedAmt3.Value        := 0;
     NE_DedAmt4.Value        := 0;

     NE_DedSum.Value         := 0;
     NE_RealPay.Value        := 0;

     NE_SopaySum.Value       := 0;
     NE_SoPaySum1.Value      := 0;
     NE_SoPaySum2.Value      := 0;
     NE_SoPaySum3.Value      := 0;

     NE_Lectsupamt.Value     := 0;
     NE_Lectsupamt1.Value    := 0;
     NE_Lectsupamt2.Value    := 0;

end;

{===============================================================================
    마스터 레코드를 갱신 시킨다.
================================================================================}
procedure TFM_Main.Update_Record;
var
     qq : TOraQuery;
     buf : string;
begin
     BB_Save.Cursor := CrHourGlass;
     Buf            := fn_GetDateTimeStr;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               SQL.Add('update pkmpycalc                         ');
               SQL.Add('   set paycl        = :p_paycl       ,  ');
               SQL.Add('       pstate       = :p_pstate      ,  ');                  
               SQL.Add('       orgnum       = :p_orgnum      ,  ');                  
               SQL.Add('       deptcode     = :p_deptcode    ,  ');                  
               SQL.Add('       bldcode      = :p_bldcode     ,  ');                  
               SQL.Add('       payyn        = :p_payyn       ,  ');                  
               SQL.Add('       paybank      = :p_paybank     ,  ');                  
               SQL.Add('       payacnt      = :p_payacnt     ,  ');                  
               SQL.Add('       paybank1     = :p_paybank1    ,  ');                  
               SQL.Add('       payacnt1     = :p_payacnt1    ,  ');                  
               SQL.Add('       basicamt     = :p_basicamt    ,  ');                  
               SQL.Add('       fixpay       = :p_fixpay      ,  ');                  
               SQL.Add('       bfixpay      = :p_bfixpay     ,  ');                  
               SQL.Add('       bonusamt     = :p_bonusamt    ,  ');                  
               SQL.Add('       devidemon    = :p_devidemon   ,  ');                  
               SQL.Add('       ybonamt      = :p_ybonamt     ,  ');                  
               SQL.Add('       ovtmamt      = :p_ovtmamt     ,  ');                  
               SQL.Add('       aidamt1      = :p_aidamt1     ,  ');                  
               SQL.Add('       aidamt11     = :p_aidamt11    ,  ');                  
               SQL.Add('       aidamt12     = :p_aidamt12    ,  ');                  
               SQL.Add('       aidamt13     = :p_aidamt13    ,  ');                  
               SQL.Add('       aidamt14     = :p_aidamt14    ,  ');                  
               SQL.Add('       aidamt3      = :p_aidamt3     ,  ');                  
               SQL.Add('       mcaramt      = :p_mcaramt     ,  ');                  
               SQL.Add('       lectsupamt   = :p_lectsupamt  ,  ');                  
               SQL.Add('       lectsupamt1  = :p_lectsupamt1 ,  ');                  
               SQL.Add('       lectsupamt2  = :p_lectsupamt2 ,  ');                  
               SQL.Add('       homesupamt   = :p_homesupamt  ,  ');                  
               SQL.Add('       ovmcamt      = :p_ovmcamt     ,  ');                  
               SQL.Add('       taxpay       = :p_taxpay      ,  ');                  
               SQL.Add('       taxpay1      = :p_taxpay1     ,  ');
               SQL.Add('       taxpay2      = :p_taxpay2     ,  ');
               SQL.Add('       taxpay3      = :p_taxpay3     ,  ');
               SQL.Add('       taxpay4      = :p_taxpay4     ,  ');
               SQL.Add('       notaxpay     = :p_notaxpay    ,  ');                  
               SQL.Add('       notaxpay1    = :p_notaxpay1   ,  ');                  
               SQL.Add('       notaxpay2    = :p_notaxpay2   ,  ');
               SQL.Add('       notaxpay3    = :p_notaxpay3   ,  ');
               SQL.Add('       paysum       = :p_paysum      ,  ');                  
               SQL.Add('       taxpaysum    = :p_taxpaysum   ,  ');                  
               SQL.Add('       notaxpaysum  = :p_notaxpaysum ,  ');                  
               SQL.Add('       meddamt      = :p_meddamt     ,  ');                  
               SQL.Add('       empldamt     = :p_empldamt    ,  ');                  
               SQL.Add('       anudamt      = :p_anudamt     ,  ');                  
               SQL.Add('       ticketamt    = :p_ticketamt   ,  ');
               SQL.Add('       dedamt1      = :p_dedamt1     ,  ');                  
               SQL.Add('       dedamt2      = :p_dedamt2     ,  ');                  
               SQL.Add('       dedamt3      = :p_dedamt3     ,  ');
               SQL.Add('       dedamt4      = :p_dedamt4     ,  ');                  
               SQL.Add('       savetaxded   = :p_savetaxded  ,  ');                  
               SQL.Add('       dedsum       = :p_dedsum      ,  ');                  
               SQL.Add('       realpay      = :p_realpay     ,  ');                  
               SQL.Add('       sopaysum     = :p_sopaysum    ,  ');                  
               SQL.Add('       sopaysum1    = :p_sopaysum1   ,  ');                  
               SQL.Add('       sopaysum2    = :p_sopaysum2   ,  ');                  
               SQL.Add('       sopaysum3    = :p_sopaysum3   ,  ');                  
               SQL.Add('       writetime    = :p_writetime   ,  ');
               SQL.Add('       writeman     = :p_writeman       ');                  
               SQL.Add(' where empno = :p_empno                 ');


               ParamByName('p_paycl').AsString         := E_PayCl.Text;
               ParamByName('p_pstate').AsString        := E_Pstate.Text;
               ParamByName('p_orgnum').AsString        := E_OrgNum.Text;
               ParamByName('p_deptcode').AsString      := E_DeptCode.Text;     
               ParamByName('p_bldcode').AsString       := E_BldCode.Text;      
               ParamByName('p_payyn').AsString         := CB_PAYYN.Text;       
               ParamByName('p_paybank').AsString       := E_PayBank.Text;      
               ParamByName('p_payacnt').AsString       := E_PayAcnt.Text;      
               ParamByName('p_paybank1').AsString      := E_PayBank1.Text;     
               ParamByName('p_payacnt1').AsString      := E_PayAcnt1.Text;     
               ParamByName('p_basicamt').AsFloat       := NE_BasicAmt.Value;
               ParamByName('p_fixpay').AsFloat         := NE_FixPay.Value;
               ParamByName('p_bfixpay').AsFloat        := NE_BFixPay.Value;
               ParamByName('p_bonusamt').AsFloat       := NE_BonusAmt.Value;
               ParamByName('p_devidemon').AsFloat      := NE_DevideMon.Value;
               ParamByName('p_ybonamt').AsFloat        := NE_YbonAmt.Value;
               ParamByName('p_ovtmamt').AsFloat        := NE_OvtmAmt.Value;
               ParamByName('p_aidamt1').AsFloat        := NE_AidAmt1.Value;
               ParamByName('p_aidamt11').AsFloat       := NE_AidAmt11.Value;
               ParamByName('p_aidamt12').AsFloat       := NE_AidAmt12.Value;
               ParamByName('p_aidamt13').AsFloat       := NE_AidAmt13.Value;
               ParamByName('p_aidamt14').AsFloat       := NE_AidAmt14.Value;
               ParamByName('p_aidamt3').AsFloat        := NE_AidAmt3.Value;
               ParamByName('p_mcaramt').AsFloat        := NE_McarAmt.Value;
               ParamByName('p_lectsupamt').AsFloat     := NE_LectSupAmt.Value;
               ParamByName('p_lectsupamt1').AsFloat    := NE_LectSupAmt1.Value;
               ParamByName('p_lectsupamt2').AsFloat    := NE_LectSupAmt2.Value;
               ParamByName('p_homesupamt').AsFloat     := NE_HomeSupAmt.Value;
               ParamByName('p_ovmcamt').AsFloat        := NE_OvmcAmt.Value;
               ParamByName('p_taxpay').AsFloat         := NE_TaxPay.Value;
               ParamByName('p_taxpay1').AsFloat        := NE_TaxPay1.Value;
               ParamByName('p_taxpay2').AsFloat        := NE_TaxPay2.Value;
               ParamByName('p_taxpay3').AsFloat        := NE_TaxPay3.Value;
               ParamByName('p_taxpay4').AsFloat        := NE_TaxPay4.Value;
               ParamByName('p_notaxpay').AsFloat       := NE_NoTaxPay.Value;
               ParamByName('p_notaxpay1').AsFloat      := NE_NoTaxPay1.Value;
               ParamByName('p_notaxpay2').AsFloat      := NE_NoTaxPay2.Value;
               ParamByName('p_notaxpay3').AsFloat      := NE_NoTaxPay3.Value;
               ParamByName('p_paysum').AsFloat         := NE_PaySum.Value;
               ParamByName('p_taxpaysum').AsFloat      := NE_TaxPaySum.Value;
               ParamByName('p_notaxpaysum').AsFloat    := NE_NoTaxPaySum.Value;
               ParamByName('p_meddamt').AsFloat        := NE_MeddAmt.Value;
               ParamByName('p_empldamt').AsFloat       := NE_EmpldAmt.Value;
               ParamByName('p_anudamt').AsFloat        := NE_AnudAmt.Value;
               ParamByName('p_ticketamt').AsFloat      := NE_TicketAmt.Value;
               ParamByName('p_dedamt1').AsFloat        := NE_DedAmt1.Value;
               ParamByName('p_dedamt2').AsFloat        := NE_DedAmt2.Value;    
               ParamByName('p_dedamt3').AsFloat        := NE_DedAmt3.Value;    
               ParamByName('p_dedamt4').AsFloat        := NE_DedAmt4.Value;
               ParamByName('p_savetaxded').AsFloat     := SaveTax;
               ParamByName('p_dedsum').AsFloat         := NE_DedSum.Value;
               ParamByName('p_realpay').AsFloat        := NE_RealPay.Value;
               ParamByName('p_sopaysum').AsFloat       := NE_SoPaySum.Value;
               ParamByName('p_sopaysum1').AsFloat      := NE_SoPaySum1.Value;
               ParamByName('p_sopaysum2').AsFloat      := NE_SoPaySum2.Value;
               ParamByName('p_sopaysum3').AsFloat      := NE_SoPaySum3.Value;
               ParamByName('p_writetime').AsString     := Buf;
               ParamByName('p_writeman').AsString      := Pempno;
               ParamByName('p_empno').AsString         := E_EmpNo.Text;

               ExecSQL;
          end;
     Finally
          qq.Free;
     end;

     DataChange     := False;
     P_Help.Caption := '   수정된 자료가 입력되었습니다. ';
     
end;

{===============================================================================
          'Insert'를 수행하는 Procedure.
================================================================================}
Procedure TFM_Main.Insert_Record;
var
     qq : TOraQuery;
     Buf : string;
begin
     Buf := fn_GetDateTimeStr;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('insert into pkmpycalc (paydate,      ');
               SQL.Add('                      empno,        ');
               SQL.Add('                      korname)      ');
               SQL.Add('              values (:p_paydate,   ');
               SQL.Add('                      :p_empno,     ');
               SQL.Add('                      :p_korname)   ');
               ParamByName('p_paydate').AsString := paydate;
               ParamByName('p_empno').AsString := E_EmpNO.Text;
               ParamByName('p_korname').AsString := E_KorName.Text;
               ExecSQL;
          end;
     Finally
          qq.Free;
     end;

     Update_Record;

     P_Help.Caption := '  새로운 데이타 입력되었습니다. ' ;
end;

{===============================================================================
     'Delete'를 수행하는 procedure.
 ===============================================================================}
Procedure TFM_Main.Delete_Record;
var
     qq : TOraQuery;
begin

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete from pkmpycalc              ');
               SQL.Add(' where paydate = :p_paydate       ');
               SQL.Add('   and empno = :p_empno           ');
               ParamByName('p_paydate').AsString := PayDate;
               ParamByName('p_empno').AsString := E_EmpNo.Text;
               ExecSQL;
          end;
     Finally
          qq.Free;
     end;

     DataChange     := False;
     P_Help.Caption := '  데이타가 삭제되었습니다.';
end;

{===============================================================================
     과세급여합을 다시 계산하고, 이에 따른 세금계산을 수행하는 Procedure.
================================================================================}
Procedure TFM_Main.Process_PaySumChange;
var
     TaxPaySum    : Real;
     NoTaxPaySum  : Real;
     Tmp, NEyuedutax  : Real;
     Gyuedutax, GyueduNOtax : Real;
     qq : TOraQuery;
begin

     Set_EmpldAmt;
     NE_Aidamt1.Value := NE_AidAmt11.Value + NE_AidAmt12.Value + NE_AidAmt13.Value + NE_AidAmt14.Value;

     NE_TaxPay.value  := NE_TaxPay1.Value + NE_TaxPay2.Value  +NE_TaxPay3.Value + NE_TaxPay4.Value;

     NE_NoTaxPay.value:=NE_NoTaxPay1.Value + NE_NoTaxPay2.Value+ NE_NoTaxPay3.Value ;

     NE_Sopaysum.value := NE_SoPaySum1.value + NE_SoPaySum2.value + NE_SoPaySum3.value;

     NE_lectsupamt.value := NE_lectsupamt1.value + NE_lectsupamt2.value ;

     TaxPaySum :=
               NE_BasicAmt.Value   +
               NE_BonusAmt.Value   +  NE_HomeSupAmt.Value +
               NE_OvtmAmt.Value    +
               NE_AidAmt1.Value    +  NE_AidAmt3.Value    +
               NE_McarAmt.Value    +
               NE_LectSupAmt.Value +
               NE_TaxPay.Value     +  NE_SoPaySum.Value   + NE_OvmcAmt.Value    +
               NE_FixPay.Value     +  NE_BFixPay.Value    +
               NE_MedDAmt.Value    +  NE_EmpldAmt.Value   +
               NE_AnuDAmt.Value    +  NE_DedAmt1.Value    +
               NE_Ybonamt.Value    ;  //2016.09.26 유훈일매니저요청 연차수당 과세합에 추가

     NoTaxPaySum := NE_NoTaxPay.Value  ; //dsa2000  유치원학자금 비과세금액  2005.01.07.//(NE_McarAmt.Value ) +   + NE_YbonAmt.Value
     {/ ======================================================================}

     NE_PaySum.Value      := TaxPaySum + NoTaxPaySum;
     NE_TaxPaySum.Value   := TaxPaySum;
     NE_NoTaxPaySum.Value := NoTaxPaySum;

     Get_RealPay;
end;

{===============================================================================
          공제금과 공제항목의 값이 바뀌면 재계산을 하는 Procedure.
================================================================================}
Procedure TFM_Main.Process_DedChange;
begin
     Get_RealPay;
end;


{===============================================================================
          공제금 재계산
================================================================================}
Procedure TFM_Main.Process_dedsumChange;
var
     Tmp    : Real;
     DedSum : Real;
begin

     DedSum :=   NE_TicketAmt.Value + NE_DedAmt2.Value   +
                 NE_DedAmt3.Value   + NE_DedAmt4.Value   ;

     NE_DedSum.Value     := DedSum;

     NE_DedSum.Value     := NE_DedSum.Value ;

     NE_RealPay.Value    := NE_PaySum.Value - NE_DedSum.Value;
end;


{===============================================================================
          고용보험료 계산기준을 읽는 Procedure.
================================================================================}
Procedure TFM_Main.Read_Pkcemtbl;
var
     qq : TOraQuery;
begin

     P_Help.Caption := '   고용보험료 계산기준에서 월급여계산에 필요한 값을 읽고 있습니다...';
     Application.ProcessMessages;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select * from pkcemtbl ');
               Open;

               basicamtYN   := FieldByName('basicamtYN').AsString;
               dutyamtYN    := FieldByName('dutyamtYN').AsString;
               FixPayYN     := FieldByName('FixPayYN').AsString;
               QuaterPayYN  := FieldByName('QuaterPayYN').AsString;
               HoliPayYN    := FieldByName('HoliPayYN').AsString;
               RoleAmtYN    := FieldByName('RoleAmtYN').AsString;
               YBONAMTYN    := FieldByName('YBONAMTYN').AsString;
               SBONAMTYN    := FieldByName('SBONAMTYN').AsString;
               LONGSUPAMTYN := FieldByName('LONGSUPAMTYN').AsString;
               MBONAMTYN    := FieldByName('MBONAMTYN').AsString;
               MATEAMTYN    := FieldByName('MATEAMTYN').AsString;
               PARTAMTYN    := FieldByName('PARTAMTYN').AsString;
               CHILDAMTYN   := FieldByName('CHILDAMTYN').AsString;
               LICEAMTYN    := FieldByName('LICEAMTYN').AsString;
               OVTMAMTYN    := FieldByName('OVTMAMTYN').AsString;
               SPTMAMTYN    := FieldByName('SPTMAMTYN').AsString;
               AIDAMT1YN    := FieldByName('AIDAMT1YN').AsString;
               AIDAMT2YN    := FieldByName('AIDAMT2YN').AsString;
               AIDAMT3YN    := FieldByName('AIDAMT3YN').AsString;
               MCARAMTYN    := FieldByName('MCARAMTYN').AsString;
               YUEDUAMTYN   := FieldByName('YUEDUAMTYN').AsString;
               SELFEDUAMTYN := FieldByName('SELFEDUAMTYN').AsString;
               ODAMTYN      := FieldByName('ODAMTYN').AsString;
               DRVLICEAMTYN := FieldByName('DRVLICEAMTYN').AsString;
               LECTSUPAMTYN := FieldByName('LECTSUPAMTYN').AsString;
               EDUSUPAMTYN  := FieldByName('EDUSUPAMTYN').AsString;
               BOKJISUPAMTYN:= FieldByName('BOKJISUPAMTYN').AsString;
               MEDSUPAMTYN  := FieldByName('MEDSUPAMTYN').AsString;
               SUPAMT1YN    := FieldByName('SUPAMT1YN').AsString;
               SUPAMT2YN    := FieldByName('SUPAMT2YN').AsString;
               SUPAMT3YN    := FieldByName('SUPAMT3YN').AsString;
               TAXPAYYN     := FieldByName('TAXPAYYN').AsString;
               NOTAXPAYYN   := FieldByName('NOTAXPAYYN').AsString;
               TAXBONUSYN   := FieldByName('TAXBONUSYN').AsString;
               SOPAYYN      := FieldByName('SOPAYYN').AsString;
               SOBONYN      := FieldByName('SOBONYN').AsString;
               EXFRYYMM     := FieldByName('EXFRYYMM').AsString;
               EMPLDRATE    := FieldByName('EMPLDRATE').AsFloat;
               Y_EMPLDRATE  := FieldByName('Y_EMPLDRATE').AsFloat;
               ITAMTYN      := FieldByName('ITAMTYN').AsString;

               BaseMM       := StrToFloat(Copy(exfryymm,1,4)) * 12 + StrToFloat(Copy(exfryymm,5,2));
               BaseMM       := BaseMM - (12 * 4);
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
 Version   date(yy.mm.dd)  programmer   relevant doc.no   description
 10.01	   1998.07.10	    이랑교     전98-06-30	 고용보험료 계산logic변경
================================================================================}
Procedure TFM_Main.Set_EmpldAmt;
var
     MM            : Real;
     EmpldAmt      : Real;
     MeddAmt       : Real;
     AnudAmt       : Real;
     AnudAmt2      : Real;
     kita          : Real;
     Y_Medirate    : Real;
     Y_Longmtrate  : Real;
     Nprate        : Real;
     nGubun    : integer;
     qq : TOraQuery;
begin
     EmpldAmt := 0;

     if ((E_EmpNo.Text <> Get_PresidentEmpNo) and (E_paycl.text <> '0Z')) then
     begin
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.24     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
          try
            nGubun := StrToInt(Copy(JuminID,8,1));
          except
          end;
          Case nGubun of
            1, 2 :
                MM := StrToFloat('19' + Copy(JuminID,1,2)) * 12 +
                      StrToFloat(Copy(JuminID,3,2));
            3, 4 :
                MM := StrToFloat(Copy(FormatDateTime('yyyy', Now),1,2)+Copy(JuminID,1,2)) * 12 +
                      StrToFloat(Copy(JuminID,3,2));
            else
                //2002.4.23. 뒷자리가('5','6','7','8')--외국인을 위해 변경
                //MM := 0.00;
                MM := StrToFloat('19' + Copy(JuminID,1,2)) * 12 +
                      StrToFloat(Copy(JuminID,3,2));
          end;
          if MM > BaseMM then
          begin
               if UpperCase(basicamtYN) = 'Y' then
                  EmpldAmt := Empldamt + (NE_basicamt.Value );

               if UpperCase(FixPayYN) = 'Y' then
                  EmpldAmt := Empldamt + (NE_FixPay.Value + NE_BFixPay.Value);

               if UpperCase(ybonamtYN)  = 'Y' then
                  EmpldAmt := Empldamt + NE_ybonamt.Value;

               if UpperCase(ovtmAmtYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_ovtmAmt.Value;

               if UpperCase(aidAmt1YN) = 'Y' then
                  EmpldAmt := Empldamt + NE_aidAmt1.Value;

               if UpperCase(aidAmt3YN) = 'Y' then
                  EmpldAmt := Empldamt + NE_aidAmt3.Value;
               if UpperCase(mcarAmtYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_mcarAmt.Value;

               if UpperCase(lectsupAmtYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_lectsupAmt.Value;

//               if UpperCase(ovmcamtYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_ovmcamt.Value;

               if UpperCase(TaxpayYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_taxpay.Value;

               if UpperCase(notaxpayYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_notaxpay.Value;

               if UpperCase(sopayYN) = 'Y' then
                  EmpldAmt := Empldamt + NE_sopaysum.Value;

               EmpldAmt := Empldamt + NE_HomeSupAmt.Value;

//2010.08.03 kth 건강,국민연금 로직 추가
               if  NE_mcarAmt.Value * 0.6 >= 100000 then
               begin
                    MeddAmt := EmpldAmt - 100000;
                    AnudAmt := EmpldAmt-NE_HomeSupAmt.Value - 100000;      //국민연금은 넣어서 10만원 미만일 경우 넣어서 계산
                                                                           //선택적 복리 후생은 제외 2010.11.19 kth
               end
               else
               begin
                    MeddAmt := EmpldAmt - NE_mcarAmt.Value*0.6;  //건강 보험료는 0.6 을 빼서 계산 교통비 부분
                    AnudAmt := EmpldAmt + NE_mcarAmt.Value -NE_HomeSupAmt.Value ;      //국민연금은 넣어서 10만원 미만일 경우 넣어서 계산
                                                                                       //선택적 복리 후생은 제외 2010.11.19 kth 
               end;

               AnudAmt :=  AnudAmt + NE_TaxPay1.value ;      //2010.08.03 kth 건강,국민연금 로직 추가  + NE_TaxPay.value
               MeddAmt :=  MeddAmt + NE_TaxPay.value;
               kita    :=  MeddAmt;      //2010.08.03 kth 건강,국민연금 로직 추가


               qq := TOraQuery.Create(Nil);    //2012.08.03 kth 건강,국민연금 로직 추가
               qq.Session := Ora_Session;

               Try
                    with qq do
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('SELECT NVL(MEDIRATE,0)/100 MEDIRATE ,NVL(LONGMTRATE,0)/100 LONGMTRATE  ');
                         SQL.Add('  FROM PKCMDBAS                                    ');
                         Open;
                         if not eof then
                         begin
                            Y_Medirate   := FieldByName('MEDIRATE').AsFloat;
                            Y_Longmtrate := FieldByName('LONGMTRATE').AsFloat;
                         end;
                         Close;
                    end;
               Finally
                    qq.Free;
               end;


               qq := TOraQuery.Create(Nil);
               qq.Session := Ora_Session;

               Try
                    with qq do
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('SELECT NVL(NPRATE,0)/100 NPRATE  ');
                         SQL.Add('FROM PKCNPBAS                    ');
                         Open;
                         if not eof then
                         begin
                            Nprate   := FieldByName('NPRATE').AsFloat;
                         end;
                         Close;
                    end;
               Finally
                    qq.Free;
               end;


               MeddAmt := (trunc(MeddAmt*Y_Medirate/10)*10)+trunc((trunc(MeddAmt *Y_Medirate/10)*10)*Y_Longmtrate/10)*10;    //2010.08.03 kth 건강,국민연금 로직 추가
               if  (trunc(AnudAmt*Nprate/10)*10) >= 168750 then                                                   //165,600 원 한도 체크
                    AnudAmt := 168750
               else
                   AnudAmt := (trunc(AnudAmt*Nprate/10)*10);    //2010.08.03 kth 건강,국민연금 로직 추가

               EmpldAmt  := TRUNC((EmpldAmt+ NE_TaxPay.value)  * Y_EmpldRate/10)*10;




               //국민연금 고정급 계산 로직 kth 2010.08.23
               qq := TOraQuery.Create(Nil);
               qq.Session := Ora_Session;

               Try
                    with qq do
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('select ANUSELFAMT from pkmnpymas m where m.empno=:p_empno');
                         ParamByName('p_empno').AsString := E_EmpNO.Text;
                         Open;
                         if not eof then
                         begin
                            AnudAmt2 := FieldByName('ANUSELFAMT').AsFloat;
                            AnudAmt := AnudAmt2;     //국민연금 고정금액  kth 2010.08.23 넣기
                         end;
                         Close;
                    end;
               Finally
                    qq.Free;
               end;


          end;
     end;
     if  ck_MeddAmt.Checked = True then
     begin
           NE_MeddAmt.Value  := MeddAmt;
           NE_AnudAmt.Value  := AnudAmt;
           NE_EmpldAmt.Value := EmpldAmt;
     end;
end;
{===========================================  end of 1998. 07.08 leerk}


{===============================================================================
         실지급액을 계산하는 procedure.
 ===============================================================================}
Procedure TFM_Main.Get_RealPay;
var
     tmp     : Real;
     DedSum  : Real;
     A, B, C, ex_val : Real;
begin
     DedSum  :=  NE_TicketAmt.Value +
                 NE_DedAmt2.Value   + NE_DedAmt3.Value   +
                 NE_DedAmt4.Value ;  //+
//          NE_DedAmt1.Value   +        NE_MedDAmt.Value   + NE_AnuDAmt.Value ;

//     NE_TaxGross.Value   := tmp_taxgross   + NE_TaxPaySum.Value;
//     NE_NoTaxGross.Value := tmp_notaxgross + NE_NoTaxPaySum.Value;
//     NE_InTaxSum.Value   := tmp_intaxsum   + NE_InTax.Value;
//     NE_CalcTaxSum.Value := tmp_calctaxsum + Floor(NE_Calctax.Value / 12);

     Set_EmpldAmt;

     Process_dedsumChange;  //leerk 1998.08.03
end;

{==============================================================================
          '조회'을 가능하게 하는 Procedure.
 ==============================================================================}
Procedure TFM_Main.LookUp_Enable;
begin
     E_EmpNo.Text            := '';
     E_EmpNo.Enabled         := True;
     SB_EmpNo.Enabled        := True;
     E_EmpNo.SetFocus;
     E_KorName.Text          := '';
     E_KorName.Enabled       := False;
     TabbedNoteBook1.Enabled := False;
     Clear_Fields;
     WorkMode                := 0;
     DataChange              := False;
     P_Help.Caption          := '   조회할 사람의 사번이나 성명을 입력하시고 [Enter Key]를 누르세요..';
end;

{==============================================================================
          '조회'을 불가능하게 하는 Procedure.
 ==============================================================================}
Procedure TFM_Main.LookUp_Disable;
begin
     E_EmpNo.Enabled         := True;      //jissi
     SB_EmpNo.Enabled        := False;      //jissi
     E_KorName.Enabled       := False;
     TabbedNoteBook1.Enabled := True;
     WorkMode                := 2;
     DataChange              := False;
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TFM_Main.SetUp;
begin
     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck))  then
     begin
          maintitle.Color    := clTeal;
          maintitle.Caption  := '급여 당월 내역관리[파견직]';
          Panel156.Caption   := '관리수수료';
          Panel98.Caption    := '산재보험료';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     L_Date.Caption := fn_GetDateStr;
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Get_PayDate;
     Read_Pkcemtbl;
     LookUp_Enable;

     P_Help.Caption := '   조회할 사람의 사번이나 성명을 입력하시고 [Enter Key]를 누르세요.';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

procedure TFM_Main.SB_EmpNoClick(Sender: TObject);
begin
     Try
          FKeyEmpNoY := TFKeyEmpNoY.Create(Self);
          FKeyEmpNoY.EdEmpno.Text := E_EmpNo.Text;
          FKeyEmpNoY.Caption      := '사원조회[파견직]';
          FKeyEmpNoY.ShowModal;

          if FKeyEmpNoY.CloseChk = 0 then
          begin
               E_EmpNo.Text := FKeyEmpNoY.v_KeyEmpno;
               E_KorName.Text := FKeyEmpNoY.v_KeyKorname;
               Get_Record(E_EmpNo.Text);
          end;
     Finally
          FKeyEmpNoY.Free;
     end;
end;

procedure TFM_Main.E_EmpNOChange(Sender: TObject);
begin
     if Length(E_Empno.Text) = 4 then
     begin
          if WorkMode = 1 then
          begin
               if not Check_EmpNO(E_EmpNO.Text) then
               begin
                    P_Help.Caption := '';
                    Smsg := '급여마스터에 등록되어 있지 않은 사번입니다. ' + #13 +
                            '그래도 작업을 계속 하시겠습니까?';
                    if IDYes = Application.MessageBox(StrPCopy(Msg,Smsg),'작업정보',MB_YesNo+MB_ICONWARNING) then
                         System.Exit
                    else
                    begin
                         P_Help.Caption := '   조회상태로 자동전환 되었습니다.';
                         Lookup_Enable;
                    end;
               end;
          end;
     end;
end;

procedure TFM_Main.BB_SearchClick(Sender: TObject);
begin
     if WorkMode = 0 then LookUp_Enable
     else
     begin
          if DataChange then
          begin
               SMsg := '현재까지 입력하신 내용이 저장되어 있지 않습니다.' + #13 + '현재 작업을 취소하시겠습니까?';
               if IDYes = Application.MessageBox(PChar(SMsg),'작업안내',MB_YesNo+MB_ICONWARNING) then
                    LookUp_Enable
          end
          else
               LookUp_Enable;
     end;
end;

procedure TFM_Main.BB_SaveClick(Sender: TObject);
begin
     Case WorkMode of
          0 :
               P_Help.Caption := '  먼저 조회를 수행하십시요.!!! ';
          1 :
          begin
               if IDYes = Application.MessageBox('현재 자료를 저장 하시겠습니까?','[확인]',MB_YesNO+MB_ICONQUESTION) then
               begin
                    if Check_AtInsert then
                    begin
                         Insert_Record;
                         WorkMode   := 2;
                    end;
               end;
          end;
          2 :
          begin
               if IDYes = Application.MessageBox('현재 자료를 저장 하시겠습니까?','[확인]',MB_YesNO+MB_ICONQUESTION) then
                    Update_Record;
          end;
     end;
     
     BB_Save.CurSor := CrDefault;
     Screen.Cursor  := CrDefault;
end;

procedure TFM_Main.BB_DeleteClick(Sender: TObject);
begin
     if WorkMode = 2 then
     begin
          if ( IDYes = Application.MessageBox(' 현재 데이타를 삭제하시겠습니까? ', '작업안내',MB_YESNO+MB_ICONWARNING ) ) then
          begin
               Delete_Record;
               LookUp_Enable;
          end;
     end
     else
          P_Help.Caption := '  ''등록''이 안된 자료에 대해서는 삭제가 불가능합니다... ';
end;

procedure TFM_Main.BB_CancelClick(Sender: TObject);
begin
     if DataChange then
     begin
          if IDYes = Application.MessageBox('현재까지 입력하신 내용이 저장되어 있지 않습니다.' + #13 + #13 +
                                            '현재 작업을 취소하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
          begin
               LookUp_Enable;
               E_EmpNO.Text := KeyValue;
               Get_Record(KeyValue);
          end;
     end
     else
     begin
          LookUp_Enable;
          E_EmpNO.Text := KeyValue;
          Get_Record(KeyValue);
     end;
end;


procedure TFM_Main.BB_PayGenClick(Sender: TObject);
var
     Par_Buf : String;
     Temp    : String;
begin
     if (WorkMode = 1) AND Check_AtInsert then
     begin
          BB_PayGen.CurSor := CrHourGlass;
          P_Help.Caption  := '  월급여 생성 중... ';
     end
     else
     begin
          if (WorkMode = 2) then
          begin
               if IDYes = Application.MessageBox('이미 자료가 존재합니다.'+#13+
                                                 '삭제 후 다시 작업을 하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
               begin
                    BB_PayGen.CurSor := CrHourGlass;
                    P_Help.Caption  := '  월급여 생성 중... ';
               end;
          end;
     end;

//     Memo1.Clear;
//     Memo1.Lines.Add('실행중...');

     FM_Tmax           := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session := TMaxSession;
     Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);

     ProgId  := 'pky1110g';
     CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pky1110g'+' '+PayDate+' '
                +E_EmpNo.Text+' '+E_EmpNo.Text+' '+PEmpno+' '+ProgId+' '+Rundate ;

      with TDS_batch do
      begin
           Close;
           ServiceName := 'HINSA_batch';
           ClearFieldInfo;
           ClearParamInfo;
           AddParam('cmdstr', 300, CmdStr);
           Execute;

           Close;
           ServiceName := 'SHR0SSEL';
           ClearFieldInfo;
           ClearParamInfo;
           AddField('RESULT', ftString, 5000);
           Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                              ' WHERE RUNDATE = ''%s''     '+
                              '   AND PROGID  = ''%s''     '+
                              ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
           Open;

           while not Eof do
           begin
                P_Help.Caption :=  FieldByName('RESULT').AsString;
                Next;
           end;
      end;    //with TDS_batch do
     ///////////////////////////////////////////////////////////
     BB_PayGen.CurSor := CrDefault;
end;

procedure TFM_Main.NE_FixPayExit(Sender: TObject);
begin
     Case TNumberEdit(Sender).Tag of
            1 :  Process_PaySumChange;
            2 :  Process_DedChange;
     end;
     DataChange := True;
end;


procedure TFM_Main.SB_PayClClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := 'BAND코드(I112) 조회';
          FKeyCode.DataVal1 := 'I112';
          FKeyCode.DataVal2 := E_PayCl.Text;
          FKeyCode.ShowModal;
          E_PayCl.Text      := FKeyCode.Code;
          P_PayCl.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TFM_Main.SB_PstateClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := '인사상태 코드(I114) 조회';
          FKeyCode.DataVal1 := 'I114';
          FKeyCode.DataVal2 := E_Pstate.Text;
          FKeyCode.ShowModal;
          E_Pstate.Text      := FKeyCode.Code;
          P_Pstate.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TFM_Main.SB_BloCodeClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := '근무지 코드(I160) 조회';
          FKeyCode.DataVal1 := 'I160';
          FKeyCode.DataVal2 := E_BldCode.Text;
          FKeyCode.ShowModal;
          E_BldCode.Text      := FKeyCode.Code;
          P_BldCode.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TFM_Main.SB_PayBankClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := '급여은행 코드(K910) 조회';
          FKeyCode.DataVal1 := 'K910';
          FKeyCode.DataVal2 := E_PayBank.Text;
          FKeyCode.ShowModal;
          E_PayBank.Text      := FKeyCode.Code;
          P_PayBank.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TFM_Main.SB_PayBank1Click(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := '급여은행 코드(K910) 조회';
          FKeyCode.DataVal1 := 'K910';
          FKeyCode.DataVal2 := E_PayBank1.Text;
          FKeyCode.ShowModal;
          E_PayBank1.Text      := FKeyCode.Code;
          P_PayBank1.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TFM_Main.SB_PayRaClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := '직책코드(I113) 조회';
          FKeyCode.DataVal1 := 'I113';
          FKeyCode.DataVal2 := E_PayRa.Text;
          FKeyCode.ShowModal;
          E_PayRa.Text      := FKeyCode.Code;
          P_PayRa.Caption   := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;


procedure TFM_Main.E_PayClChange(Sender: TObject);
begin
     P_PayCl.Caption := GetCodeName('I112',E_PayCl.Text);
     DataChange      := True;
end;

procedure TFM_Main.E_PstateChange(Sender: TObject);
begin
     P_Pstate.Caption := GetCodeName('I114',E_PState.Text);
     DataChange       := True;
end;

procedure TFM_Main.E_BldCodeChange(Sender: TObject);
begin
     P_BldCode.Caption := GetCodeName('I160',E_BldCode.Text);
     DataChange        := True;
end;

procedure TFM_Main.E_PayBankChange(Sender: TObject);
begin
     P_PayBank.Caption := GetCodeName('K910',E_PayBank.Text);
     DataChange        := True;
end;

procedure TFM_Main.SB_DeptCodeClick(Sender: TObject);
begin
     Try
          FDeptCode := TFDeptCode.Create(Self);
          FDeptCode.GSorgnum   := E_OrgNum.Text;
          FDeptCode.GSdeptcode := E_DeptCode.Text;
          FDeptCode.ShowModal;

          if FDeptCode.CloseChk = 0 then
          begin
               E_DeptCode.Text := FDeptCode.GSdeptcode;
               P_DeptCode.Caption := FDeptCode.GSdeptName;
          end;
     Finally
          FDeptCode.Free;
     end;
end;

procedure TFM_Main.E_OrgNumChange(Sender: TObject);
begin
     if (Length(E_OrgNum.Text) = 3) then
          P_DeptCode.Caption := GetDeptName(E_OrgNum.Text,E_DeptCode.Text);
end;

procedure TFM_Main.E_DeptCodeChange(Sender: TObject);
begin
     P_DeptCode.Caption := GetDeptName(E_OrgNum.Text,E_DeptCode.Text);
     DataChange         := True;
end;

procedure TFM_Main.BB_InsertClick(Sender: TObject);
begin
     if DataChange then
     begin
          if IDYes = Application.MessageBox('현재까지 입력하신 내용이 저장되어 있지 않습니다.' + #13 + #13 +
                                            '현재 작업을 취소하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
          begin
               LookUp_Enable;
               TabbedNoteBook1.Enabled := True;
               E_KorName.Enabled       := True;
               WorkMode := 1;
          end
          else
          begin
               LookUp_Enable;
               TabbedNoteBook1.Enabled := True;
               E_KorName.Enabled       := True;
               WorkMode := 1;
          end;
     end;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DataChange then
     begin
          SMsg := '현재까지 입력하신 내용이 저장되어 있지 않습니다.' + #13 + #13 + '현재 작업을 취소하시겠습니까?';
     end
     else
     begin
          Action := caFree;
     end;
end;

procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
     Close;
end;


procedure TFM_Main.FormActivate(Sender: TObject);
begin
     if ActiveFlag then SetUp;

     ActiveFlag := False;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다.';
     Application.ProcessMessages;
     OraConnect;

     ActiveFlag := True;
     //2016.06.09 jissi OS계정 보안강화 개선
     TMaxSession.Connect     := False;
     TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
     //개발접속 Test
     //TMaxSession.EnvFileName := 'C:\InsaDev\newhana.env';
     TMaxSession.LabelName   := 'HANAROHPER';

     try
          TMaxSession.Connect := True;
     except
          Application.MessageBox(PChar('종합인사 APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFM_Main.KeyFieldOnClick(Sender: TObject);
begin
     if WorkMode = 0 then LookUp_Enable
     else
     begin
          if DataChange then
          begin
               if IDYes = Application.MessageBox('현재까지 입력하신 내용이 저장되어 있지 않습니다.' + #13 +
                                                 '현재 작업을 취소하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
                    LookUp_Enable
          end
          else
               LookUp_Enable;
     end;
end;

procedure TFM_Main.ChangeEvent(Sender: TObject);
begin
     DataChange := True;
end;

procedure TFM_Main.E_PayRaChange(Sender: TObject);
begin
     P_PayRa.Caption := GetCodeName('I113',E_PayRa.Text);
     DataChange      := True;
end;

procedure TFM_Main.E_EmpNOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
     qq : TOraQuery;
begin
     if Key = VK_RETURN then
     begin
          if (Copy(E_EmpNO.Text,1,1) <> 'Y') then
          begin
               Application.MessageBox('파견직 모드에서는 정규직 사번에 대한 작업을'+#13+
                                      '할 수 없습니다.','작업안내',MB_OK+$0030);
               E_empno.SelectAll;
               System.Exit;
          end;

          qq := TOraQuery.Create(Nil);
          qq.Session := Ora_Session;
          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno, korname from pkmpmas   ');
                    SQL.Add(' where (empno like :empno            ');
                    SQL.Add('        or korname like :empno )     ');
                    SQL.Add('   and  substr(empno,1,1) = ''Y''    ');
                    ParamByName('empno').AsString := E_Empno.Text + '%';
                    Open;

                    if RecordCount < 1 then
                    begin
                         Application.MessageBox('해당사원이 존재하지 않습니다.','조회조건입력오류',MB_OK+MB_ICONWARNING);
                         E_KorName.Text  := '';
                         System.Exit;
                    end else
                    if RecordCount = 1 then
                    begin
                         E_Empno.Text   := FieldByName('empno').AsString;
                         E_KorName.Text := FieldByName('KorName').AsString;
                         Get_Record(E_EmpNO.Text);
                    end else
                    if RecordCount > 1 then
                    begin
                         Try
                              FKeyEmpNo := TFKeyEmpNo.Create(Self);
                              FKeyEmpNo.EdEmpno.Text := E_EmpNo.Text;
                              FKeyEmpNo.ShowModal;
                              if FKeyEmpNo.CloseChk = 0 then
                              begin
                                   E_EmpNo.Text := FKeyEmpNo.v_KeyEmpno;
                                   E_KorName.Text := FKeyEmpNo.v_KeyKorname;
                                   Get_Record(E_EmpNo.Text);
                              end;
                         Finally
                              FKeyEmpNo.Free;
                         end;
                    end;
               end;
          Finally
               qq.Free;
          end;
     end;
end;

procedure TFM_Main.NE_EmpldAmtExit(Sender: TObject);
var
     temp     : Real;
     DedSum   : Real;
     Tmp      : Real;
     A, B, C, ex_val : Real;
begin
     if BeforeValue = TNumberEdit(Sender).Value then System.Exit;

     DedSum     := NE_TicketAmt.Value +
                   //NE_DedAmt1.Value   +
                   NE_DedAmt2.Value     + NE_DedAmt3.Value +  NE_DedAmt4.Value ;
                   //NE_MedDAmt.Value     + NE_AnuDAmt.Value   +
                   //NE_EmpldAmt.Value ;

     Process_dedsumChange;  //leerk 1998.08.03

end;

procedure TFM_Main.E_PayBank1Change(Sender: TObject);
begin
     P_PayBank1.Caption := GetCodeName('K910',E_PayBank1.Text);
     DataChange        := True;
end;

procedure TFM_Main.BB_IndiClick(Sender: TObject);
var
     i,j : Integer ;
     str : String ;
     qq : TOraQuery;
begin
     if SaveDialog1.Execute then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;
          qq.FetchAll  := True;

          Try
               with qq do
               begin
                    Close ;
                    SQL.Add('select a.empno,                                 ');
                    SQL.Add('       a.korname,                               ');
                    SQL.Add('       a.paycl,                                 ');
                    SQL.Add('       (select codename from pyccode            ');
                    SQL.Add('         where codeid = ''I112''                ');
                    SQL.Add('           and codeno = a.paycl) codename,      ');
                    SQL.Add('       (select deptname from pycdept            ');
                    SQL.Add('         where orgnum = a.orgnum                ');
                    SQL.Add('           and deptcode = a.deptcode) deptname, ');
                    SQL.Add('       nvl(realpay,0),                          ');
                    SQL.Add('       nvl(FIXPAY,0),                           ');
                    SQL.Add('       nvl(ovtmamt,0),                          ');
                    SQL.Add('       nvl(aidamt1,0),                          ');
                    SQL.Add('       nvl(aidamt2,0),                          ');
                    SQL.Add('       nvl(aidamt3,0),                          ');
                    SQL.Add('       nvl(mcaramt,0),                          ');
                    SQL.Add('       nvl(ovmcamt,0),                          ');
                    SQL.Add('       nvl(notaxpay,0),                         ');
                    SQL.Add('       nvl(taxpay,0),                           ');
                    SQL.Add('       nvl(sopaysum,0),                         ');
                    SQL.Add('       nvl(paysum,0),                           ');
                    SQL.Add('       nvl(MEDDAMT,0),                          ');
                    SQL.Add('       nvl(EMPLDAMT,0),                         ');
                    SQL.Add('       nvl(ANUDAMT,0),                          ');
                    SQL.Add('       nvl(TICKETAMT,0),                        ');
                    SQL.Add('       nvl(DEDAMT1,0),                          ');
                    SQL.Add('       nvl(DEDAMT2,0),                          ');
                    SQL.Add('       nvl(DEDAMT3,0),                          ');
                    SQL.Add('       nvl(DEDAMT4,0),                          ');
                    SQL.Add('       nvl(DEDAMT5,0),                          ');
                    SQL.Add('       nvl(INTAX,0),                            ');
                    SQL.Add('       nvl(JUTAX,0),                            ');
                    SQL.Add('       nvl(dedsum,0)                            ');
                    SQL.Add('  from pkmpycalc a                               ');
                    SQL.Add(' order by empno                                 ');
                    Open ;
               end;

               with TStringList.Create do
               begin
                    Add('사번,성명,BAND,BAND명,부서,실지급액,월정급여,초과근무수당,기타수당1,기타수당2,'+
                        '기타수당3,식대교통비,야근식대,'+
                        '기타비과세급여,기타과세급여,소급급여,지급총액,'+
                        '국민건강보험료,고용보험료,국민연금,'+
                        '사용식권금액,기타공제1,기타공제2,기타공제3,기타공제4,기타공제5,'+
                        '소득세,주민세,공제총액');

                    qq.First ;
                    for i := 1 to qq.Recordcount do
                    begin
                         str := '';

                         for j := 0 to qq.Fields.Count - 1 do
                            str := str + Format('%s,', [qq.Fields[j].AsString]);

                         Add(str);
                         qq.Next;
                    end;
                    SaveToFile(SaveDialog1.FileName);
               end;
          Finally
               qq.Free;
          end;

          Application.MessageBox('개인별 급여가 파일로 저장되었습니다','[확인]',MB_OK+MB_ICONINFORMATION);
     end;

end;


procedure TFM_Main.BB_PaySumClick(Sender: TObject);
begin
     if (Trim(E_EmpNO.Text) <> '') and (Trim(E_Korname.Text) <> '')  then
     begin
          Process_PaySumChange;
          Process_DedChange;
          DataChange     := True;
     end;     
end;

end.
