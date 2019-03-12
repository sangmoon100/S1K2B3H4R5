unit HPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn,  Db;

type
  TPrintForm = class(TForm)
    PeQuickRepPrn1: TPeQuickRepPrn;
    PageHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape16: TQRShape;
    QRShape14: TQRShape;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRShape8: TQRShape;
    QRShape5: TQRShape;
    QRShape18: TQRShape;
    QRShape17: TQRShape;
    QRShape7: TQRShape;
    QRShape4: TQRShape;
    QRShape15: TQRShape;
    QRShape13: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRL_JobgunName: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    Qr_Title: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRL_Empno: TQRLabel;
    QRL_Deptname: TQRLabel;
    QRL_Empdate: TQRLabel;
    QRL_Korname: TQRLabel;
    QRL_Paycldate: TQRLabel;
    QRL_Trdate: TQRLabel;
    QRL_Payclname: TQRLabel;
    QRL_Payraname: TQRLabel;
    QRLabel2: TQRLabel;
    QRL_Spedate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape62: TQRShape;
    QRShape61: TQRShape;
    QRShape58: TQRShape;
    QRLabel41: TQRLabel;
    QRShape60: TQRShape;
    QRLabel50: TQRLabel;
    QRL_rscore: TQRLabel;
    QRL_escore: TQRLabel;
    A_DetailBand: TQRSubDetail;
    QRShape59: TQRShape;
    QRShape39: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape32: TQRShape;
    QRShape30: TQRShape;
    QRShape57: TQRShape;
    QRShape28: TQRShape;
    QRShape36: TQRShape;
    QRShape45: TQRShape;
    QRLabel31: TQRLabel;
    QRL_SeqnoA: TQRLabel;
    QRShape38: TQRShape;
    QRL_task1A: TQRLabel;
    QRShape41: TQRShape;
    QRLabel29: TQRLabel;
    QRL_ForweightA: TQRLabel;
    QRShape29: TQRShape;
    QRShape46: TQRShape;
    QRShape50: TQRShape;
    QRShape47: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape31: TQRShape;
    QRLabel19: TQRLabel;
    QRShape34: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape35: TQRShape;
    QRLabel25: TQRLabel;
    QRShape37: TQRShape;
    QRLabel35: TQRLabel;
    QRShape27: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape40: TQRShape;
    QRLabel16: TQRLabel;
    QRShape42: TQRShape;
    QRL_Plan1A: TQRLabel;
    QRL_detweight1: TQRLabel;
    QRL_validxA: TQRLabel;
    QRL_result1s: TQRLabel;
    QRL_result1a: TQRLabel;
    QRL_result1b: TQRLabel;
    QRL_result1c: TQRLabel;
    QRL_result1d: TQRLabel;
    QRL_Foraim1A: TQRLabel;
    QRL_Plan2A: TQRLabel;
    QRL_Plan3A: TQRLabel;
    QRL_Plan4A: TQRLabel;
    QRL_Plan5A: TQRLabel;
    QRL_detweight2: TQRLabel;
    QRL_detweight3: TQRLabel;
    QRL_detweight4: TQRLabel;
    QRL_detweight5: TQRLabel;
    QRL_validxA2: TQRLabel;
    QRL_validxA3: TQRLabel;
    QRL_validxA4: TQRLabel;
    QRL_validxA5: TQRLabel;
    QRL_Foraim2A: TQRLabel;
    QRL_Foraim3A: TQRLabel;
    QRL_Foraim4A: TQRLabel;
    QRL_Foraim5A: TQRLabel;
    QRL_result2s: TQRLabel;
    QRL_result3s: TQRLabel;
    QRL_result4s: TQRLabel;
    QRL_result5s: TQRLabel;
    QRL_result2a: TQRLabel;
    QRL_result3a: TQRLabel;
    QRL_result4a: TQRLabel;
    QRL_result5a: TQRLabel;
    QRL_result2b: TQRLabel;
    QRL_result3b: TQRLabel;
    QRL_result4b: TQRLabel;
    QRL_result5b: TQRLabel;
    QRL_result2c: TQRLabel;
    QRL_result3c: TQRLabel;
    QRL_result4c: TQRLabel;
    QRL_result5c: TQRLabel;
    QRL_result2d: TQRLabel;
    QRL_result3d: TQRLabel;
    QRL_result4d: TQRLabel;
    QRL_result5d: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape33: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape48: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape20: TQRShape;
    QRShape49: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRL_detailrclass1: TQRLabel;
    QRL_detailrscore1: TQRLabel;
    QRL_detaileclass1: TQRLabel;
    QRL_detailescore1: TQRLabel;
    QRL_detailrclass2: TQRLabel;
    QRL_detailrscore2: TQRLabel;
    QRL_detaileclass2: TQRLabel;
    QRL_detailescore2: TQRLabel;
    QRL_detailrclass3: TQRLabel;
    QRL_detailrscore3: TQRLabel;
    QRL_detailrclass4: TQRLabel;
    QRL_detailrscore4: TQRLabel;
    QRL_detailrclass5: TQRLabel;
    QRL_detailrscore5: TQRLabel;
    QRL_detaileclass3: TQRLabel;
    QRL_detailescore3: TQRLabel;
    QRL_detaileclass4: TQRLabel;
    QRL_detailescore4: TQRLabel;
    QRL_detaileclass5: TQRLabel;
    QRL_detailescore5: TQRLabel;
    FooterBand1: TQRBand;
    QRShape67: TQRShape;
    QRLabel47: TQRLabel;
    QRShape64: TQRShape;
    QRShape63: TQRShape;
    QRShape73: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape76: TQRShape;
    QRL_ProRclass: TQRLabel;
    QRL_ProEclass: TQRLabel;
    QRShape65: TQRShape;
    QRL_ProRscore: TQRLabel;
    QRL_ProEscore: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRLabel51: TQRLabel;
    QRL_selfvalue1: TQRLabel;
    QRShape70: TQRShape;
    QRShape82: TQRShape;
    QRLabel52: TQRLabel;
    QRL_selfvalue2: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRShape89: TQRShape;
    QRShape92: TQRShape;
    QRL_valRscore: TQRLabel;
    QRL_valRclass: TQRLabel;
    QRShape81: TQRShape;
    QRShape85: TQRShape;
    QRShape94: TQRShape;
    QRL_valitemname: TQRLabel;
    QRL_valimagedesc: TQRLabel;
    QRL_valitemno: TQRLabel;
    QRL_valEclass: TQRLabel;
    QRL_valEscore: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRLabel1: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRL_valekind: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape93: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel57: TQRLabel;
    QRGroup1: TQRGroup;
    QRChildBand3: TQRChildBand;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRLabel65: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRShape95: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRL_comEscore: TQRLabel;
    QRL_comRscore: TQRLabel;
    QRL_comEclass: TQRLabel;
    QRL_comRclass: TQRLabel;
    QRL_comimagedesc: TQRLabel;
    QRL_comitemname: TQRLabel;
    QRL_comitemno: TQRLabel;
    QRShape96: TQRShape;
    QRGroup2: TQRGroup;
    QRShape100: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRL_comekind: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape105: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    FooterBand2: TQRBand;
    FooterBand3: TQRBand;
    QRShape54: TQRShape;
    QRShape53: TQRShape;
    QRShape84: TQRShape;
    QRShape83: TQRShape;
    QRShape78: TQRShape;
    QRShape77: TQRShape;
    QRShape75: TQRShape;
    QRShape74: TQRShape;
    QRShape72: TQRShape;
    QRShape71: TQRShape;
    QRShape69: TQRShape;
    QRShape66: TQRShape;
    QRShape68: TQRShape;
    QRL_E1Empno: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRL_E1Korname: TQRLabel;
    QRL_E1Deptname: TQRLabel;
    QRL_E1Payraname: TQRLabel;
    QRL_E1Prjcondate: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRGroup0: TQRGroup;
    QRShape106: TQRShape;
    QRLabel55: TQRLabel;
    QRShape107: TQRShape;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2NeedData(Sender: TObject; var MoreDataV: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
   rabasdate : string;
   empno     : string;
   jobgubun  : integer;
   GSeqno    : integer;
   procedure InitQrLabel;
   Procedure GetPageHeader;
   procedure GetRabasdate;

  public
    { Public declarations }
  end;

const
  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

var
  PrintForm: TPrintForm;

implementation

{$R *.DFM}

uses
  UPrnview, HMainForm;


procedure TPrintForm.GetRabasdate;
//var
//  Sqltext : string;
//  DateFr,DateTo : string;
begin
  QRL_Spedate.Caption := copy(FM_Main.Lrabasdate,1,4)+'년';
end;

procedure TPrintForm.PeQuickRepPrn1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,PeQuickRepPrn1);
  Fm_PreviewForm.Show;
  Fm_PreviewForm.Qr_Preview.OnProgressUpdate := nil;
end;


procedure TPrintForm.InitQrLabel;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TQRMemo then
        if TQRMemo(Components[i]).Tag = 99 then
          begin
            TQRMemo(Components[i]).Lines.Clear;
            TQRMemo(Components[i]).Lines.Text := '';
          end;
      if Components[i] is TQRLabel then
        if TQRLabel(Components[i]).Tag = 99 then
          begin
            TQRLabel(Components[i]).Caption := '';
          end;
    end;
end;

procedure TPrintForm.PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
//Var
//   value1, value2 : string;
//   Sqltext : String;
begin
   QRL_Empno.Caption := '';
   QRL_Korname.Caption := '';
   QRL_Payclname.Caption := '';
   QRL_Deptname.Caption := '';
   QRL_Payraname.Caption := '';
   QRL_Empdate.Caption := '';
   QRL_Paycldate.Caption := '';
   QRL_Trdate.Caption := '';

   QRL_E1Korname.Caption := '';
   QRL_E1Empno.Caption := '';
//   QRL_E1Payclname.Caption := '';
   QRL_E1Deptname.Caption := '';
   QRL_E1Payraname.Caption := '';
   QRL_E1Prjcondate.Caption := '';

   GetRabasdate; //평가대상기간
   GetPageHeader;

  rabasdate := FM_Main.Lrabasdate;
  empno     := FM_Main.GSempno;

  GSeqno  := 0;

  FM_Main.DBSet1.First;
  FM_Main.DBSet2.First;
  FM_Main.DBSet3.First;

end;

procedure TPrintForm.A_DetailBandNeedData(Sender: TObject;
  var MoreData: Boolean);
Var
   tMP :Tstrings;
begin
     InitQrLabel;

     tmp := TStringList.Create;
     with FM_Main.DBSet1 do    //공동목표 대상자 아님
     begin
       if EOF then
       begin
         Moredata := False;
       end
       else
       begin
         Inc(GSeqno);
         QRL_SeqnoA.Caption := IntToStr(GSeqno);

         tmp.Clear;
         //tmp.Assign(QRL_task1A.Lines);
         //QRL_task1A.Lines.Assign(SetTextIntoMemo(tmp,FieldByName('propeltask').AsString,40));
         QRL_task1A.Caption := FieldByName('propeltask').AsString;
         tmp.Clear;
         QRL_ForweightA.Caption := IntToStr(FieldByName('mainweight').AsInteger); //비중
         QRL_Plan1A.Caption := FieldByName('detailtask1').AsString;               //세부추진활동
         QRL_Plan2A.Caption := FieldByName('detailtask2').AsString;
         QRL_Plan3A.Caption := FieldByName('detailtask3').AsString;
         QRL_Plan4A.Caption := FieldByName('detailtask4').AsString;
         QRL_Plan5A.Caption := FieldByName('detailtask5').AsString;

         //상세비중
         if FieldByName('detailweight1').AsString <> '0' then
           QRL_detweight1.Caption := FieldByName('detailweight1').AsString
         else
           QRL_detweight1.Caption := '';

         if FieldByName('detailweight2').AsString <> '0' then
           QRL_detweight2.Caption := FieldByName('detailweight2').AsString
         else
           QRL_detweight2.Caption := '';

         if FieldByName('detailweight3').AsString <> '0' then
           QRL_detweight3.Caption := FieldByName('detailweight3').AsString
         else
           QRL_detweight3.Caption := '';

         if FieldByName('detailweight4').AsString <> '0' then
           QRL_detweight4.Caption := FieldByName('detailweight4').AsString
         else
           QRL_detweight4.Caption := '';

         if FieldByName('detailweight5').AsString <> '0' then
           QRL_detweight5.Caption := FieldByName('detailweight5').AsString
         else
           QRL_detweight5.Caption := '';

         QRL_validxA.Caption  := FieldByName('validx1').AsString;                //평가지표
         QRL_validxA2.Caption := FieldByName('validx2').AsString;
         QRL_validxA3.Caption := FieldByName('validx3').AsString;
         QRL_validxA4.Caption := FieldByName('validx4').AsString;
         QRL_validxA5.Caption := FieldByName('validx5').AsString;
         QRL_Foraim1A.Caption   := FieldByName('valfunction1').AsString;        //평가산식
         QRL_Foraim2A.Caption   := FieldByName('valfunction2').AsString;
         QRL_Foraim3A.Caption   := FieldByName('valfunction3').AsString;
         QRL_Foraim4A.Caption   := FieldByName('valfunction4').AsString;
         QRL_Foraim5A.Caption   := FieldByName('valfunction5').AsString;
         QRL_result1s.Caption := FieldByName('Sresultclass1').AsString;        //달성목표
         QRL_result1a.Caption := FieldByName('Aresultclass1').AsString;
         QRL_result1b.Caption := FieldByName('Bresultclass1').AsString;
         QRL_result1c.Caption := FieldByName('Cresultclass1').AsString;
         QRL_result1d.Caption := FieldByName('Dresultclass1').AsString;
         QRL_result2s.Caption := FieldByName('Sresultclass2').AsString;        //달성목표
         QRL_result2a.Caption := FieldByName('Aresultclass2').AsString;
         QRL_result2b.Caption := FieldByName('Bresultclass2').AsString;
         QRL_result2c.Caption := FieldByName('Cresultclass2').AsString;
         QRL_result2d.Caption := FieldByName('Dresultclass2').AsString;
         QRL_result3s.Caption := FieldByName('Sresultclass3').AsString;        //달성목표
         QRL_result3a.Caption := FieldByName('Aresultclass3').AsString;
         QRL_result3b.Caption := FieldByName('Bresultclass3').AsString;
         QRL_result3c.Caption := FieldByName('Cresultclass3').AsString;
         QRL_result3d.Caption := FieldByName('Dresultclass3').AsString;
         QRL_result4s.Caption := FieldByName('Sresultclass4').AsString;        //달성목표
         QRL_result4a.Caption := FieldByName('Aresultclass4').AsString;
         QRL_result4b.Caption := FieldByName('Bresultclass4').AsString;
         QRL_result4c.Caption := FieldByName('Cresultclass4').AsString;
         QRL_result4d.Caption := FieldByName('Dresultclass4').AsString;
         QRL_result5s.Caption := FieldByName('Sresultclass5').AsString;        //달성목표
         QRL_result5a.Caption := FieldByName('Aresultclass5').AsString;
         QRL_result5b.Caption := FieldByName('Bresultclass5').AsString;
         QRL_result5c.Caption := FieldByName('Cresultclass5').AsString;
         QRL_result5d.Caption := FieldByName('Dresultclass5').AsString;


         //자기평가 점수

         if FieldByName('detailtask1').AsString <> '' then
           QRL_detailrscore1.Caption := FieldByName('DETAILRSCORE1').AsString
         else
           QRL_detailrscore1.Caption :='';

         if FieldByName('detailtask2').AsString <> '' then
           QRL_detailrscore2.Caption := FieldByName('DETAILRSCORE2').AsString
         else
           QRL_detailrscore2.Caption :='';

         if FieldByName('detailtask3').AsString <> '' then
           QRL_detailrscore3.Caption := FieldByName('DETAILRSCORE3').AsString
         else
           QRL_detailrscore3.Caption :='';

         if FieldByName('detailtask4').AsString <> '' then
           QRL_detailrscore4.Caption := FieldByName('DETAILRSCORE4').AsString
         else
           QRL_detailrscore4.Caption :='';

         if FieldByName('detailtask5').AsString <> '' then
           QRL_detailrscore5.Caption := FieldByName('DETAILRSCORE5').AsString
         else
           QRL_detailrscore5.Caption :='';

         //자기평가 등급
              if FieldByName('DETAILRCLASS1').AsString = 'S' then QRL_detailrclass1.Caption := var_GrdS
         else if FieldByName('DETAILRCLASS1').AsString = 'A' then QRL_detailrclass1.Caption := var_GrdA
         else if FieldByName('DETAILRCLASS1').AsString = 'B' then QRL_detailrclass1.Caption := var_GrdB
         else if FieldByName('DETAILRCLASS1').AsString = 'C' then QRL_detailrclass1.Caption := var_GrdC
         else if FieldByName('DETAILRCLASS1').AsString = 'D' then QRL_detailrclass1.Caption := var_GrdD
         else                                                     QRL_detailrclass1.Caption := '';

              if FieldByName('DETAILRCLASS2').AsString = 'S' then QRL_detailrclass2.Caption := var_GrdS
         else if FieldByName('DETAILRCLASS2').AsString = 'A' then QRL_detailrclass2.Caption := var_GrdA
         else if FieldByName('DETAILRCLASS2').AsString = 'B' then QRL_detailrclass2.Caption := var_GrdB
         else if FieldByName('DETAILRCLASS2').AsString = 'C' then QRL_detailrclass2.Caption := var_GrdC
         else if FieldByName('DETAILRCLASS2').AsString = 'D' then QRL_detailrclass2.Caption := var_GrdD
         else                                                     QRL_detailrclass2.Caption := '';

              if FieldByName('DETAILRCLASS3').AsString = 'S' then QRL_detailrclass3.Caption := var_GrdS
         else if FieldByName('DETAILRCLASS3').AsString = 'A' then QRL_detailrclass3.Caption := var_GrdA
         else if FieldByName('DETAILRCLASS3').AsString = 'B' then QRL_detailrclass3.Caption := var_GrdB
         else if FieldByName('DETAILRCLASS3').AsString = 'C' then QRL_detailrclass3.Caption := var_GrdC
         else if FieldByName('DETAILRCLASS3').AsString = 'D' then QRL_detailrclass3.Caption := var_GrdD
         else                                                     QRL_detailrclass3.Caption := '';

              if FieldByName('DETAILRCLASS4').AsString = 'S' then QRL_detailrclass4.Caption := var_GrdS
         else if FieldByName('DETAILRCLASS4').AsString = 'A' then QRL_detailrclass4.Caption := var_GrdA
         else if FieldByName('DETAILRCLASS4').AsString = 'B' then QRL_detailrclass4.Caption := var_GrdB
         else if FieldByName('DETAILRCLASS4').AsString = 'C' then QRL_detailrclass4.Caption := var_GrdC
         else if FieldByName('DETAILRCLASS4').AsString = 'D' then QRL_detailrclass4.Caption := var_GrdD
         else                                                     QRL_detailrclass4.Caption := '';

              if FieldByName('DETAILRCLASS5').AsString = 'S' then QRL_detailrclass5.Caption := var_GrdS
         else if FieldByName('DETAILRCLASS5').AsString = 'A' then QRL_detailrclass5.Caption := var_GrdA
         else if FieldByName('DETAILRCLASS5').AsString = 'B' then QRL_detailrclass5.Caption := var_GrdB
         else if FieldByName('DETAILRCLASS5').AsString = 'C' then QRL_detailrclass5.Caption := var_GrdC
         else if FieldByName('DETAILRCLASS5').AsString = 'D' then QRL_detailrclass5.Caption := var_GrdD
         else                                                     QRL_detailrclass5.Caption := '';

         //하향평가 점수
         if FieldByName('DETAILESCORE1').AsString <> '0' then
           QRL_detailescore1.Caption := FieldByName('DETAILESCORE1').AsString
         else
           QRL_detailescore1.Caption :='';

         if FieldByName('DETAILESCORE2').AsString <> '0' then
           QRL_detailescore2.Caption := FieldByName('DETAILESCORE2').AsString
         else
           QRL_detailescore2.Caption :='';

         if FieldByName('DETAILESCORE3').AsString <> '0' then
           QRL_detailescore3.Caption := FieldByName('DETAILESCORE3').AsString
         else
           QRL_detailescore3.Caption :='';

         if FieldByName('DETAILESCORE4').AsString <> '0' then
           QRL_detailescore4.Caption := FieldByName('DETAILESCORE4').AsString
         else
           QRL_detailescore4.Caption :='';

         if FieldByName('DETAILESCORE5').AsString <> '0' then
           QRL_detailescore5.Caption := FieldByName('DETAILESCORE5').AsString
         else
           QRL_detailescore5.Caption :='';

         //하향평가 등급, 점수
              if FieldByName('DETAILECLASS1').AsString = 'S' then QRL_detaileclass1.Caption := var_GrdS
         else if FieldByName('DETAILECLASS1').AsString = 'A' then QRL_detaileclass1.Caption := var_GrdA
         else if FieldByName('DETAILECLASS1').AsString = 'B' then QRL_detaileclass1.Caption := var_GrdB
         else if FieldByName('DETAILECLASS1').AsString = 'C' then QRL_detaileclass1.Caption := var_GrdC
         else if FieldByName('DETAILECLASS1').AsString = 'D' then QRL_detaileclass1.Caption := var_GrdD
         else                                                     QRL_detaileclass1.Caption := '';

              if FieldByName('DETAILECLASS2').AsString = 'S' then QRL_detaileclass2.Caption := var_GrdS
         else if FieldByName('DETAILECLASS2').AsString = 'A' then QRL_detaileclass2.Caption := var_GrdA
         else if FieldByName('DETAILECLASS2').AsString = 'B' then QRL_detaileclass2.Caption := var_GrdB
         else if FieldByName('DETAILECLASS2').AsString = 'C' then QRL_detaileclass2.Caption := var_GrdC
         else if FieldByName('DETAILECLASS2').AsString = 'D' then QRL_detaileclass2.Caption := var_GrdD
         else                                                     QRL_detaileclass2.Caption := '';

              if FieldByName('DETAILECLASS3').AsString = 'S' then QRL_detaileclass3.Caption := var_GrdS
         else if FieldByName('DETAILECLASS3').AsString = 'A' then QRL_detaileclass3.Caption := var_GrdA
         else if FieldByName('DETAILECLASS3').AsString = 'B' then QRL_detaileclass3.Caption := var_GrdB
         else if FieldByName('DETAILECLASS3').AsString = 'C' then QRL_detaileclass3.Caption := var_GrdC
         else if FieldByName('DETAILECLASS3').AsString = 'D' then QRL_detaileclass3.Caption := var_GrdD
         else                                                     QRL_detaileclass3.Caption := '';

              if FieldByName('DETAILECLASS4').AsString = 'S' then QRL_detaileclass4.Caption := var_GrdS
         else if FieldByName('DETAILECLASS4').AsString = 'A' then QRL_detaileclass4.Caption := var_GrdA
         else if FieldByName('DETAILECLASS4').AsString = 'B' then QRL_detaileclass4.Caption := var_GrdB
         else if FieldByName('DETAILECLASS4').AsString = 'C' then QRL_detaileclass4.Caption := var_GrdC
         else if FieldByName('DETAILECLASS4').AsString = 'D' then QRL_detaileclass4.Caption := var_GrdD
         else                                                     QRL_detaileclass4.Caption := '';

              if FieldByName('DETAILECLASS5').AsString = 'S' then QRL_detaileclass5.Caption := var_GrdS
         else if FieldByName('DETAILECLASS5').AsString = 'A' then QRL_detaileclass5.Caption := var_GrdA
         else if FieldByName('DETAILECLASS5').AsString = 'B' then QRL_detaileclass5.Caption := var_GrdB
         else if FieldByName('DETAILECLASS5').AsString = 'C' then QRL_detaileclass5.Caption := var_GrdC
         else if FieldByName('DETAILECLASS5').AsString = 'D' then QRL_detaileclass5.Caption := var_GrdD
         else                                                     QRL_detaileclass5.Caption := '';

         Next;
         Moredata := True;
       end;//if EOF tnen
     end;
end;

Procedure TPrintForm.GetPageHeader;
//var
//  Tmp : Tstrings;
//  Sqltext : string;
begin
//     tmp := TStringList.Create;

     with FM_Main.DBSet1 do
     begin
       if FM_Main.DBSet1.FieldByName('jobgun').AsString <> '' then
         jobgubun := StrToInt(FM_Main.DBSet1.FieldByName('jobgun').AsString);
       case jobgubun of
         10, 12, 20, 30, 40 : begin
                        //QRL_Jobgunname.Caption    := '<관리/기술/연구직군>';
                        //A_GroupHeaderBand.Enabled := True;
                        A_DetailBand.Enabled      := True;
                              end;
       end;

       QRL_Empno.Caption     := FM_Main.DBSet1.FieldByName('EMPNO').AsString;
       QRL_Korname.Caption   := FM_Main.GSkorname;
       QRL_Deptname.Caption  := FM_Main.DBSet1.FieldByName('DEPTNAME').AsString;
       QRL_Empdate.Caption   := copy(FM_Main.DBSet1.FieldByName('EMPDATE').AsString,1,4)+'년 '+
                                copy(FM_Main.DBSet1.FieldByName('EMPDATE').AsString,5,2)+'월 '+
                                copy(FM_Main.DBSet1.FieldByName('EMPDATE').AsString,7,2)+'일';

       QRL_Paycldate.Caption := copy(FM_Main.DBSet1.FieldByName('PAYCLDATE').AsString,1,4)+'년 '+
                                copy(FM_Main.DBSet1.FieldByName('PAYCLDATE').AsString,5,2)+'월 '+
                                copy(FM_Main.DBSet1.FieldByName('PAYCLDATE').AsString,7,2)+'일';

       QRL_Trdate.Caption    := copy(FM_Main.DBSet1.FieldByName('TRDATE').AsString,1,4)+'년 '+
                                copy(FM_Main.DBSet1.FieldByName('TRDATE').AsString,5,2)+'월 '+
                                copy(FM_Main.DBSet1.FieldByName('TRDATE').AsString,7,2)+'일';

       QRL_Payclname.Caption := FM_Main.DBSet1.FieldByName('PAYCLNAME').AsString;
       QRL_Payraname.Caption := FM_Main.DBSet1.FieldByName('PAYRANAME').AsString;
       QRL_E1korname.Caption := FM_Main.Le1korname;
       QRL_E1Empno.Caption   := FM_Main.Le1empno;
       //             orgnum   := DataModule_Tmax.Csel_gfd(31);
       //             deptcode := DataModule_Tmax.Csel_gfd(32);
       QRL_E1Deptname.Caption:= FM_Main.Ldeptname;

       QRL_rscore.Caption := FM_Main.g_rscore;
       QRL_escore.Caption := FM_Main.g_escore;

       if FM_Main.Le1valconyn = 'Y' then
         QRL_E1Prjcondate.Caption := copy(FM_Main.Le1valcondate,1,4)+'년'+
                                     copy(FM_Main.Le1valcondate,5,2)+'월'+
                                     copy(FM_Main.Le1valcondate,7,2)+'일'
       else
         QRL_E1Prjcondate.Caption := '';
                        //codeno := DataModule_Tmax.Csel_gfd(30);
//       QRL_E1Payclname.Caption := FM_Main.Lpayclname;
       QRL_E1Payraname.Caption := FM_Main.Lpayraname;
     end;//with FM_Main.DBSet1 do
end;

procedure TPrintForm.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//  PageHeaderBand1.Enabled := False;

end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

procedure TPrintForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := True;
end;

procedure TPrintForm.FooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var sqltext : String;
begin
      SqlText := 'SELECT Nvl(PRORSCORE,''0'')||'';''||PRORCLASS||'';''|| ' +
                 '       Nvl(PROESCORE,''0'')||'';''||PROECLASS          ' +
                 '       ||'';''||SELFVALUE1||'';''||SELFVALUE2          ' +
                 '  FROM pehremas a, PEHSEMAS b                          ' +
                 ' WHERE a.rabasdate = '''+FM_Main.Lrabasdate+'''        ' +
                 '   AND a.empno     = '''+FM_Main.Ed_empno.empno+'''    ' +
                 '   AND a.rabasdate = b.rabasdate(+)                    ' +
                 '   AND a.empno     = b.empno(+)                        ' ;
      with FM_Main.DBcommon do
      begin
         Close;
         ServiceName := 'SHR0SSEL';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 5000);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;
      end;

      QRL_ProRscore.Caption := FM_Main.Csel_gfd(1);

           if FM_Main.Csel_gfd(2) = 'S' then QRL_ProRclass.Caption := var_GrdS
      else if FM_Main.Csel_gfd(2) = 'A' then QRL_ProRclass.Caption := var_GrdA
      else if FM_Main.Csel_gfd(2) = 'B' then QRL_ProRclass.Caption := var_GrdB
      else if FM_Main.Csel_gfd(2) = 'C' then QRL_ProRclass.Caption := var_GrdC
      else if FM_Main.Csel_gfd(2) = 'D' then QRL_ProRclass.Caption := var_GrdD
      else                                   QRL_ProRclass.Caption := '';

      QRL_ProEscore.Caption := FM_Main.Csel_gfd(3);

           if FM_Main.Csel_gfd(4) = 'S' then QRL_ProEclass.Caption := var_GrdS
      else if FM_Main.Csel_gfd(4) = 'A' then QRL_ProEclass.Caption := var_GrdA
      else if FM_Main.Csel_gfd(4) = 'B' then QRL_ProEclass.Caption := var_GrdB
      else if FM_Main.Csel_gfd(4) = 'C' then QRL_ProEclass.Caption := var_GrdC
      else if FM_Main.Csel_gfd(4) = 'D' then QRL_ProEclass.Caption := var_GrdD
      else                                   QRL_ProEclass.Caption := '';

      QRL_Selfvalue1.Caption := FM_Main.Csel_gfd(5);
      QRL_Selfvalue2.Caption := FM_Main.Csel_gfd(6);
end;

procedure TPrintForm.QRSubDetail2NeedData(Sender: TObject;
  var MoreDataV: Boolean);
begin
     with FM_Main.DBSet2 do
     begin
       if EOF then
       begin
         MoredataV := False;
       end
       else
       begin
         QRL_valekind.Caption     := FieldByName('ekind').AsString+' 평가 항목';
         QRL_valitemno.Caption    := FieldByName('itemno').AsString;
         QRL_valitemname.Caption  := FieldByName('itemname').AsString;
         QRL_valimagedesc.Caption := FieldByName('imagedesc').AsString;

              if FieldByName('rscore').AsString = '100' then  QRL_valRclass.Caption := var_GrdS
         else if FieldByName('rscore').AsString =  '90' then  QRL_valRclass.Caption := var_GrdA
         else if FieldByName('rscore').AsString =  '80' then  QRL_valRclass.Caption := var_GrdB
         else if FieldByName('rscore').AsString =  '70' then  QRL_valRclass.Caption := var_GrdC
         else if FieldByName('rscore').AsString =  '60' then  QRL_valRclass.Caption := var_GrdD
         else                                                 QRL_valRclass.Caption := '';

         QRL_valRscore.Caption := FieldByName('rscore').AsString;

         QRL_valEclass.Caption := ' ';
         QRL_valEscore.Caption := ' ';
         Next;
         MoredataV := True;
       end;//if EOF tnen
     end;
end;

procedure TPrintForm.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     with FM_Main.DBSet3 do    //공동목표 대상자 아님
     begin
          QRL_comitemno.Caption    := FieldByName('itemno').AsString;
          QRL_comitemname.Caption  := FieldByName('itemname').AsString;
          QRL_comimagedesc.Caption := FieldByName('imagedesc').AsString;

               if FieldByName('rscore').AsString = '100' then  QRL_comRclass.Caption := var_GrdS
          else if FieldByName('rscore').AsString =  '90' then  QRL_comRclass.Caption := var_GrdA
          else if FieldByName('rscore').AsString =  '80' then  QRL_comRclass.Caption := var_GrdB
          else if FieldByName('rscore').AsString =  '70' then  QRL_comRclass.Caption := var_GrdC
          else if FieldByName('rscore').AsString =  '60' then  QRL_comRclass.Caption := var_GrdD
          else                                                 QRL_comRclass.Caption := '';

          QRL_comRscore.Caption := FieldByName('rscore').AsString;

          QRL_comEclass.Caption := ' ';
          QRL_comEscore.Caption := ' ';
     end;
end;

procedure TPrintForm.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRL_comekind.Caption     := FM_Main.DBSet3.FieldByName('ekind').AsString+' 평가 항목';
end;

end.
