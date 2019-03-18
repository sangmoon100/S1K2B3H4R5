unit pkq21805;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, Peprnview, MemDS, DBAccess,
  Ora;

type
  TNewPrintForm = class(TForm)
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QRShape78: TQRShape;
    QRL_workyy: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLCorpName: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape46: TQRShape;
    QRShape56: TQRShape;
    QRShape55: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape79: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRL_family: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape80: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel163: TQRLabel;
    Qdate1: TQRLabel;
    Qdate2: TQRLabel;
    Qdate3: TQRLabel;
    QRLPresName: TQRLabel;
    QRLabel165: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_juminid1: TQRLabel;
    QRL_juminid2: TQRLabel;
    QL_paysum_1: TQRLabel;
    QL_paysum_2: TQRLabel;
    QL_paysum_3: TQRLabel;
    QL_paysum_4: TQRLabel;
    QL_paysum_5: TQRLabel;
    QL_paysum_6: TQRLabel;
    QL_paysum_7: TQRLabel;
    QL_paysum_8: TQRLabel;
    QL_paysum_9: TQRLabel;
    QL_paysum_10: TQRLabel;
    QL_paysum_11: TQRLabel;
    QL_paysum_12: TQRLabel;
    QL_paysum_TOT: TQRLabel;
    QL_bonsum_TOT: TQRLabel;
    QL_bonsum_12: TQRLabel;
    QL_bonsum_11: TQRLabel;
    QL_bonsum_10: TQRLabel;
    QL_bonsum_9: TQRLabel;
    QL_bonsum_8: TQRLabel;
    QL_bonsum_7: TQRLabel;
    QL_bonsum_6: TQRLabel;
    QL_bonsum_5: TQRLabel;
    QL_bonsum_4: TQRLabel;
    QL_bonsum_3: TQRLabel;
    QL_bonsum_2: TQRLabel;
    QL_bonsum_1: TQRLabel;
    QL_taxpaysum_1: TQRLabel;
    QL_taxpaysum_2: TQRLabel;
    QL_taxpaysum_3: TQRLabel;
    QL_taxpaysum_4: TQRLabel;
    QL_taxpaysum_5: TQRLabel;
    QL_taxpaysum_6: TQRLabel;
    QL_taxpaysum_7: TQRLabel;
    QL_taxpaysum_8: TQRLabel;
    QL_taxpaysum_9: TQRLabel;
    QL_taxpaysum_10: TQRLabel;
    QL_taxpaysum_11: TQRLabel;
    QL_taxpaysum_12: TQRLabel;
    QL_taxpaysum_TOT: TQRLabel;
    QL_calctax_TOT: TQRLabel;
    QL_calctax_12: TQRLabel;
    QL_calctax_11: TQRLabel;
    QL_calctax_10: TQRLabel;
    QL_calctax_9: TQRLabel;
    QL_calctax_8: TQRLabel;
    QL_calctax_7: TQRLabel;
    QL_calctax_6: TQRLabel;
    QL_calctax_5: TQRLabel;
    QL_calctax_4: TQRLabel;
    QL_calctax_3: TQRLabel;
    QL_calctax_2: TQRLabel;
    QL_calctax_1: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QL_intax_1: TQRLabel;
    QL_intax_2: TQRLabel;
    QL_intax_3: TQRLabel;
    QL_intax_4: TQRLabel;
    QL_intax_5: TQRLabel;
    QL_intax_6: TQRLabel;
    QL_intax_7: TQRLabel;
    QL_intax_8: TQRLabel;
    QL_intax_9: TQRLabel;
    QL_intax_10: TQRLabel;
    QL_intax_11: TQRLabel;
    QL_intax_12: TQRLabel;
    QL_jutax_12: TQRLabel;
    QL_jutax_11: TQRLabel;
    QL_jutax_10: TQRLabel;
    QL_jutax_9: TQRLabel;
    QL_jutax_8: TQRLabel;
    QL_jutax_7: TQRLabel;
    QL_jutax_6: TQRLabel;
    QL_jutax_5: TQRLabel;
    QL_jutax_4: TQRLabel;
    QL_jutax_3: TQRLabel;
    QL_jutax_2: TQRLabel;
    QL_jutax_1: TQRLabel;
    QL_injutax_1: TQRLabel;
    QL_injutax_2: TQRLabel;
    QL_injutax_3: TQRLabel;
    QL_injutax_4: TQRLabel;
    QL_injutax_5: TQRLabel;
    QL_injutax_6: TQRLabel;
    QL_injutax_7: TQRLabel;
    QL_injutax_8: TQRLabel;
    QL_injutax_9: TQRLabel;
    QL_injutax_10: TQRLabel;
    QL_injutax_11: TQRLabel;
    QL_injutax_12: TQRLabel;
    QL_injutax_TOT: TQRLabel;
    QL_jutax_TOT: TQRLabel;
    QL_intax_TOT: TQRLabel;
    QL_notaxpaysum_1: TQRLabel;
    QL_notaxpaysum_2: TQRLabel;
    QL_notaxpaysum_3: TQRLabel;
    QL_notaxpaysum_4: TQRLabel;
    QL_notaxpaysum_5: TQRLabel;
    QL_notaxpaysum_6: TQRLabel;
    QL_notaxpaysum_7: TQRLabel;
    QL_notaxpaysum_8: TQRLabel;
    QL_notaxpaysum_9: TQRLabel;
    QL_notaxpaysum_10: TQRLabel;
    QL_notaxpaysum_11: TQRLabel;
    QL_notaxpaysum_12: TQRLabel;
    QL_notaxpaysum_TOT: TQRLabel;
    QRLabel80: TQRLabel;
    QRL_empno: TQRLabel;
    QRLCorpNo: TQRLabel;
    QRShape81: TQRShape;
    QL_mcogbonsum: TQRLabel;
    QL_mcogbonsum_TOT: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRShape77: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QL_anudamt_1: TQRLabel;
    QL_anudamt_2: TQRLabel;
    QL_anudamt_3: TQRLabel;
    QL_anudamt_4: TQRLabel;
    QL_anudamt_5: TQRLabel;
    QL_anudamt_6: TQRLabel;
    QL_anudamt_7: TQRLabel;
    QL_anudamt_8: TQRLabel;
    QL_anudamt_9: TQRLabel;
    QL_anudamt_10: TQRLabel;
    QL_anudamt_11: TQRLabel;
    QL_anudamt_12: TQRLabel;
    QL_anudamt_TOT: TQRLabel;
    QRLabel130: TQRLabel;
    QL_meddamt_1: TQRLabel;
    QL_meddamt_2: TQRLabel;
    QL_meddamt_3: TQRLabel;
    QL_meddamt_4: TQRLabel;
    QL_meddamt_5: TQRLabel;
    QL_meddamt_6: TQRLabel;
    QL_meddamt_7: TQRLabel;
    QL_meddamt_8: TQRLabel;
    QL_meddamt_9: TQRLabel;
    QL_meddamt_10: TQRLabel;
    QL_meddamt_11: TQRLabel;
    QL_meddamt_12: TQRLabel;
    QL_meddamt_TOT: TQRLabel;
    QRLabel144: TQRLabel;
    QL_empldamt_1: TQRLabel;
    QL_empldamt_2: TQRLabel;
    QL_empldamt_3: TQRLabel;
    QL_empldamt_4: TQRLabel;
    QL_empldamt_5: TQRLabel;
    QL_empldamt_6: TQRLabel;
    QL_empldamt_7: TQRLabel;
    QL_empldamt_8: TQRLabel;
    QL_empldamt_9: TQRLabel;
    QL_empldamt_10: TQRLabel;
    QL_empldamt_11: TQRLabel;
    QL_empldamt_12: TQRLabel;
    QL_empldamt_TOT: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel182: TQRLabel;
    QRL_yyyymm_1: TQRLabel;
    QRL_yyyymm_2: TQRLabel;
    QRL_yyyymm_3: TQRLabel;
    QRL_yyyymm_4: TQRLabel;
    QRL_yyyymm_5: TQRLabel;
    QRL_yyyymm_6: TQRLabel;
    QRL_yyyymm_7: TQRLabel;
    QRL_yyyymm_8: TQRLabel;
    QRL_yyyymm_9: TQRLabel;
    QRL_yyyymm_10: TQRLabel;
    QRL_yyyymm_11: TQRLabel;
    QRL_yyyymm_12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    OraQuery1: TOraQuery;
    QRImage1: TQRImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QReportPreview(Sender: TObject);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Details_clear;

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  NewPrintForm: TNewPrintForm;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000

  i, j, mm : Integer;
  maxvalue :integer;
  LastPayYear: Integer;
  work     : Real;
  Q_field: TQRLabel;
  //각 항목별 합계값 저장변수---------------------------------------------------
  SUM_taxpaysum, SUM_bonsum,  SUM_paysum,    SUM_insduct,
  SUM_taxinamt,  SUM_calctax, SUM_labtaxded, SUM_labtaxdedsum,
  SUM_intax,     SUM_jutax,   SUM_injutax,   SUM_notaxpaysum,
  SUM_anudamt,   SUM_meddamt, SUM_empldamt,  SUM_MCOGBONSUM  : Real;
  //----------------------------------------------------------------------------

implementation

uses pkq21801, Func;

{$R *.DFM}

procedure TNewPrintForm.Details_clear;
begin
     for i := 0 to Self.ComponentCount -1 do
     begin
          if Copy(TQRLabel(Self.Components[i]).Name,1,3) = 'QL_' then
               TQRLabel(Self.Components[i]).Caption := Format('%8.0n', [0.0]);
     end;

     SUM_taxpaysum    := 0;
     SUM_bonsum       := 0;
     SUM_paysum       := 0;
     SUM_insduct      := 0;
     SUM_taxinamt     := 0;
     SUM_calctax      := 0;
     SUM_labtaxded    := 0;
     SUM_labtaxdedsum := 0;
     SUM_intax        := 0;
     SUM_jutax        := 0;
     SUM_injutax      := 0;
     SUM_notaxpaysum  := 0;
     SUM_MCOGBONSUM   := 0;
     SUM_anudamt      := 0;
     SUM_meddamt      := 0;
     SUM_empldamt     := 0;
end;


procedure TNewPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := Cafree;
end;

procedure TNewPrintForm.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     j := 0;
end;

procedure TNewPrintForm.QReportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Qreport);
     Fm_PreviewForm.Show ;
end;

procedure TNewPrintForm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   if j = Maxvalue then Fm_PreviewForm.Show;
end;

procedure TNewPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     p_yintax ,p_yjutax,p_ynongtax: double;
     m_yintax ,m_yjutax,m_ynongtax: double;
     qq : TOraQuery;
begin
     Details_clear;

     p_yintax   :=0 ;
     p_yjutax   :=0 ;
     p_ynongtax :=0 ;
     m_yintax   :=0 ;
     m_yjutax   :=0 ;
     m_ynongtax :=0 ;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Inc(j);

     maxvalue := OraQuery1.RecordCount;
     MainForm.Phelpmsg.Caption := ' '+IntToStr(j)+' / '+IntToStr(OraQuery1.RecordCount);
     MainForm.Gauge1.Progress := (j * 100) div OraQuery1.RecordCount;
     Application.ProcessMessages;

     QRL_workyy.Caption := MainForm.ME_workyy.Text + '년';

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               //회사관련정보
               Close;
               SQL.Clear;
               SQL.Add('select corpno, corpname, presname   ');
               SQL.Add('  from pkcpbas                      ');
               Open;

               QRLCorpNo.Caption   := Fieldbyname('corpno').AsString;
               QRLCorpName.Caption := Fieldbyname('CORPNAME').AsString;
               QRLPresName.Caption := Fieldbyname('PRESNAME').AsString;

               //사번
               QRL_empno.Caption    := OraQuery1.FieldByName('EMPNO').AsString;
               QRL_korname.Caption  := OraQuery1.FieldByName('KORNAME').AsString;
               QRL_juminid1.Caption := Copy(OraQuery1.FieldByName('JUMINID').AsString,1,6);
               QRL_juminid2.Caption := Copy(OraQuery1.FieldByName('JUMINID').AsString,8,7);

               //부양가족 본인포함
               QRL_family.Caption := Format('%1.0n', [1 + OraQuery1.FieldByName('familyno').AsFloat]) + '  명';

               //근로소득수입금액 / 인정상여총액
               Close;
               SQL.Clear;
               SQL.Add('select mcogbonsum from pkhyshis    ');
               SQL.Add(' where workyy = :p_payyear         ');
               SQL.Add('   and empno = :p_empno            ');
               ParamByName('P_payyear').AsString := MainForm.ME_workyy.Text;
               ParamByName('P_empno').AsString   := OraQuery1.FieldByName('empno').AsString;
               Open;

               SUM_MCOGBONSUM  := FieldByName('mcogbonsum').AsFloat;


               //상세명세
               Close;
               SQL.Clear;
               SQL.Add('select paydate,                                     ');
               SQL.Add('       (taxpaysum - sbontaxamt) paysum,             ');
               SQL.Add('       (sbontaxamt + ybonamt) bonsum,               ');
               SQL.Add('       (taxpaysum + ybonamt) taxsum,                ');
               SQL.Add('       notaxpaysum,                                 ');
               SQL.Add('       intax,                                       ');
               SQL.Add('       jutax,                                       ');
               SQL.Add('       anudamt,                                     ');
               SQL.Add('       meddamt,                                     ');
               SQL.Add('       empldamt                                     ');
               SQL.Add('  from pkhphis                                      ');
               SQL.Add(' where paydate like :p_payyear                      ');
               SQL.Add('   and empno = :p_empno                             ');
               SQL.Add(' order by paydate                                   ');
               ParamByName('p_payyear').AsString := MainForm.ME_workyy.Text+'%';
               ParamByName('P_empno').AsString   := OraQuery1.FieldByName('empno').AsString;
               Open;

               while not eof do
               begin
                    mm := StrToIntDef(Copy(FieldByName('PAYDATE').AsString,5,2), 0); {월}

                    if (RecordCount > 0) and (mm > 0) and (mm <= 12) then
                    begin
                         {근로소득수입금액 / 급여총액}
                         Q_field         := Self.FindComponent('QL_paysum_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('PAYSUM').AsFloat]);
                         SUM_paysum      := SUM_paysum + FieldByName('PAYSUM').AsFloat;

                         {근로소득수입금액 / 상여총액}
                         Q_field         := Self.FindComponent('QL_bonsum_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('BONSUM').AsFloat]);
                         SUM_bonsum      := SUM_bonsum + FieldByName('BONSUM').AsFloat;

                         {근로소득수입금액 / 계}
                         Q_field         := Self.FindComponent('QL_taxpaysum_'+IntToStr(mm)) as TQRLabel;
                         if mm <> 12 then
                         begin
                           Q_field.Caption := Format('%8.0n', [FieldByName('TAXSUM').AsFloat]);
                           SUM_taxpaysum   := SUM_taxpaysum + FieldByName('TAXSUM').AsFloat;
                         end
                         else
                         begin  //12월 인정상여 포함
                           Q_field.Caption := Format('%8.0n',[SUM_MCOGBONSUM+FieldByName('TAXSUM').AsFloat]);
                           SUM_taxpaysum   := SUM_taxpaysum + SUM_MCOGBONSUM+FieldByName('TAXSUM').AsFloat;
                         end;

                         {간이세율에 의한 소득세}
                         Q_field         := Self.FindComponent('QL_calctax_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('INTAX').AsFloat]);
                         SUM_calctax     := SUM_calctax + FieldByName('INTAX').AsFloat;

                         {비과세급여등 / 금액}
                         Q_field         := Self.FindComponent('QL_notaxpaysum_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('NOTAXPAYSUM').AsFloat]);
                         SUM_notaxpaysum := SUM_notaxpaysum + FieldByName('NOTAXPAYSUM').AsFloat;

                         {차감징수세액 / 소득세}
                         Q_field         := Self.FindComponent('QL_intax_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('INTAX').AsFloat]);
                         SUM_intax       := SUM_intax + FieldByName('INTAX').AsFloat;

                         {차감징수세액 / 주민세}
                         Q_field         := Self.FindComponent('QL_jutax_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('JUTAX').AsFloat]);
                         SUM_jutax       := SUM_jutax + FieldByName('JUTAX').AsFloat;

                         {연금보험}
                         Q_field         := Self.FindComponent('QL_anudamt_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('ANUDAMT').AsFloat]);
                         SUM_anudamt     := SUM_anudamt + FieldByName('ANUDAMT').AsFloat;

                         {건강보험}
                         Q_field         := Self.FindComponent('QL_meddamt_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('MEDDAMT').AsFloat]);
                         SUM_meddamt     := SUM_meddamt + FieldByName('MEDDAMT').AsFloat;

                         {고용보험}
                         Q_field         := Self.FindComponent('QL_empldamt_'+IntToStr(mm)) as TQRLabel;
                         Q_field.Caption := Format('%8.0n', [FieldByName('EMPLDAMT').AsFloat]);
                         SUM_empldamt    := SUM_empldamt + FieldByName('EMPLDAMT').AsFloat;

                         Next;
                    end;
                 {sum}
               end;
          end;
     Finally
          qq.Free;
     end;

     ///합계금액 뿌려주기....
     QL_mcogbonsum.Caption      := Format('%8.0n', [SUM_MCOGBONSUM]); //인정상여
     QL_mcogbonsum_TOT.Caption  := Format('%8.0n', [SUM_MCOGBONSUM]); //인정상여

     QL_paysum_TOT.Caption      := Format('%8.0n', [SUM_paysum]);
     QL_bonsum_TOT.Caption      := Format('%8.0n', [SUM_bonsum]);
     QL_taxpaysum_TOT.Caption   := Format('%8.0n', [SUM_taxpaysum]);
     QL_calctax_TOT.Caption     := Format('%8.0n', [SUM_calctax]);
     QL_notaxpaysum_TOT.Caption := Format('%8.0n', [SUM_notaxpaysum]);
     QL_intax_TOT.Caption       := Format('%8.0n', [SUM_intax]);
     QL_jutax_TOT.Caption       := Format('%8.0n', [SUM_jutax]);

     QL_anudamt_TOT.Caption     := Format('%8.0n', [SUM_anudamt]);
     QL_meddamt_TOT.Caption     := Format('%8.0n', [SUM_meddamt]);
     QL_empldamt_TOT.Caption    := Format('%8.0n', [SUM_empldamt]);

     Qdate1.Caption    := Copy(MainForm.Lsysdate.Caption,1,4);
     Qdate2.Caption    := Copy(MainForm.Lsysdate.Caption,6,2);
     Qdate3.Caption    := Copy(MainForm.Lsysdate.Caption,9,2);
end;

end.
