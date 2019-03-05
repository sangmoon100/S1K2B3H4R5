unit pea1060a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, common,  Db;

type
  TPrintForm = class(TForm)
    PeQuickRepPrn1: TPeQuickRepPrn;
    PageHeaderBand1: TQRBand;
    A_DetailBand: TQRSubDetail;
    QRLabel1: TQRLabel;
    PageHeaderBand2: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRL_JobgunName: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRShape11: TQRShape;
    Qr_Title: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRShape14: TQRShape;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel18: TQRLabel;
    QRShape18: TQRShape;
    QRL_Empno: TQRLabel;
    QRL_Deptname: TQRLabel;
    QRL_Empdate: TQRLabel;
    QRL_Korname: TQRLabel;
    QRL_Paycldate: TQRLabel;
    QRL_Trdate: TQRLabel;
    QRL_Payclname: TQRLabel;
    QRL_Payraname: TQRLabel;
    GroupFooterBand: TQRBand;
    QRShape59: TQRShape;
    QRShape57: TQRShape;
    QRShape68: TQRShape;
    QRShape66: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRLabel44: TQRLabel;
    QRShape74: TQRShape;
    QRLabel45: TQRLabel;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRL_E1Korname: TQRLabel;
    QRL_E1Empno: TQRLabel;
    QRL_E1Deptname: TQRLabel;
    QRL_E1Payraname: TQRLabel;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRL_E1Prjcondate: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel2: TQRLabel;
    QRL_Spedate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape39: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape32: TQRShape;
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
    a: TQRLabel;
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
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  private
    { Private declarations }
   rabasdate : string;
   empno     : string;
   orgnum    : string;
   deptcode  : string;
   codeno    : string;
   jobgubun  : String;
   cut_length: integer;
   GSeqno    : integer;
   procedure InitQrLabel;
   Procedure GetPageHeader;
   procedure GetRabasdate;

  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, PePrnview, PeMainForm, peDm, pea1060a1;


procedure TPrintForm.GetRabasdate;
var
  Sqltext : string;
  DateFr,DateTo : string;
begin
  QRL_Spedate.Caption := '2005 년 상반기';
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
Var
   value1, value2 : string;
   Sqltext : String;
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

  rabasdate := MainForm.lRabasdate;
  empno     := DataModule_Tmax.Csel_gfd(1);

  GSeqno  := 0;
end;

procedure TPrintForm.A_DetailBandNeedData(Sender: TObject;
  var MoreData: Boolean);
Var
   tMP :Tstrings;
begin
   InitQrLabel;

   tmp := TStringList.Create;
   with DM.DBSet1 do
   begin
      if EOF then
      begin
         Moredata := False;
      end
      else
      begin
         if (jobgubun = '11') or (jobgubun = '22') or (jobgubun = '33') or (jobgubun = '44') then  // 11-경영관리직군, 22-마케팅/영업직군, 33-R&D직군, 44-기술직군
         begin
            Inc(GSeqno);
            QRL_SeqnoA.Caption := IntToStr(GSeqno);

            tmp.Clear;
            //tmp.Assign(QRL_task1A.Lines);
            //QRL_task1A.Lines.Assign(SetTextIntoMemo(tmp,FieldByName('propeltask').AsString,40));
            QRL_task1A.Caption     := FieldByName('propeltask').AsString;
            tmp.Clear;
            QRL_ForweightA.Caption := IntToStr(FieldByName('mainweight').AsInteger); //비중
            QRL_Plan1A.Caption     := FieldByName('detailtask1').AsString;               //세부추진활동
            QRL_Plan2A.Caption     := FieldByName('detailtask2').AsString;
            QRL_Plan3A.Caption     := FieldByName('detailtask3').AsString;
            QRL_Plan4A.Caption     := FieldByName('detailtask4').AsString;
            QRL_Plan5A.Caption     := FieldByName('detailtask5').AsString;
            QRL_detweight1.Caption := FieldByName('detailweight1').AsString;        //상세비중
            QRL_detweight2.Caption := FieldByName('detailweight2').AsString;
            QRL_detweight3.Caption := FieldByName('detailweight3').AsString;
            QRL_detweight4.Caption := FieldByName('detailweight4').AsString;
            QRL_detweight5.Caption := FieldByName('detailweight5').AsString;
            QRL_validxA.Caption    := FieldByName('validx1').AsString;                //평가지표
            QRL_validxA2.Caption   := FieldByName('validx2').AsString;
            QRL_validxA3.Caption   := FieldByName('validx3').AsString;
            QRL_validxA4.Caption   := FieldByName('validx4').AsString;
            QRL_validxA5.Caption   := FieldByName('validx5').AsString;
            QRL_Foraim1A.Caption   := FieldByName('valfunction1').AsString;        //평가산식
            QRL_Foraim2A.Caption   := FieldByName('valfunction2').AsString;
            QRL_Foraim3A.Caption   := FieldByName('valfunction3').AsString;
            QRL_Foraim4A.Caption   := FieldByName('valfunction4').AsString;
            QRL_Foraim5A.Caption   := FieldByName('valfunction5').AsString;
            QRL_result1s.Caption   := FieldByName('Sresultclass1').AsString;        //달성목표
            QRL_result1a.Caption   := FieldByName('Aresultclass1').AsString;
            QRL_result1b.Caption   := FieldByName('Bresultclass1').AsString;
            QRL_result1c.Caption   := FieldByName('Cresultclass1').AsString;
            QRL_result1d.Caption   := FieldByName('Dresultclass1').AsString;
            QRL_result2s.Caption   := FieldByName('Sresultclass2').AsString;        //달성목표
            QRL_result2a.Caption   := FieldByName('Aresultclass2').AsString;
            QRL_result2b.Caption   := FieldByName('Bresultclass2').AsString;
            QRL_result2c.Caption   := FieldByName('Cresultclass2').AsString;
            QRL_result2d.Caption   := FieldByName('Dresultclass2').AsString;
            QRL_result3s.Caption   := FieldByName('Sresultclass3').AsString;        //달성목표
            QRL_result3a.Caption   := FieldByName('Aresultclass3').AsString;
            QRL_result3b.Caption   := FieldByName('Bresultclass3').AsString;
            QRL_result3c.Caption   := FieldByName('Cresultclass3').AsString;
            QRL_result3d.Caption   := FieldByName('Dresultclass3').AsString;
            QRL_result4s.Caption   := FieldByName('Sresultclass4').AsString;        //달성목표
            QRL_result4a.Caption   := FieldByName('Aresultclass4').AsString;
            QRL_result4b.Caption   := FieldByName('Bresultclass4').AsString;
            QRL_result4c.Caption   := FieldByName('Cresultclass4').AsString;
            QRL_result4d.Caption   := FieldByName('Dresultclass4').AsString;
            QRL_result5s.Caption   := FieldByName('Sresultclass5').AsString;        //달성목표
            QRL_result5a.Caption   := FieldByName('Aresultclass5').AsString;
            QRL_result5b.Caption   := FieldByName('Bresultclass5').AsString;
            QRL_result5c.Caption   := FieldByName('Cresultclass5').AsString;
            QRL_result5d.Caption   := FieldByName('Dresultclass5').AsString;

            Next;
         end;

         Moredata := True;
      end;
   end;
end;

Procedure TPrintForm.GetPageHeader;
var
  Tmp : Tstrings;
  Sqltext : string;
begin
     tmp := TStringList.Create;
     with DM.DBSet1 do
     begin
       if MainForm.Pa_jobgun.Hint > '0' then
          jobgubun := MainForm.Pa_jobgun.Hint;

       if (jobgubun = '11') or (jobgubun = '22') or (jobgubun = '33') or (jobgubun = '44') then  // 11-경영관리직군, 22-마케팅/영업직군, 33-R&D직군, 44-기술직군
       begin
//         10, 12, 20, 30, 40 : begin
                        //QRL_Jobgunname.Caption    := '<관리/기술/연구직군>';
                        //A_GroupHeaderBand.Enabled := True;
                        A_DetailBand.Enabled      := True;
       end;

       QRL_Empno.Caption     := DataModule_Tmax.Csel_gfd(1);
       QRL_Korname.Caption   := DataModule_Tmax.Csel_gfd(2);
       QRL_Deptname.Caption  := MainForm.Pa_deptcode.Text;
       QRL_Empdate.Caption   := MainForm.Pa_empdate.TextCaption;
       QRL_Paycldate.Caption := MainForm.Pa_paycldate.TextCaption;
       QRL_Trdate.Caption    := MainForm.Pa_trdate.TextCaption;
       QRL_Payclname.Caption := MainForm.Pa_paycl.TextCaption;
       QRL_Payraname.Caption := MainForm.Pa_payra.TextCaption;
       QRL_E1korname.Caption := MainForm.Pa_Le1KorName.Caption;
       QRL_E1Empno.Caption   := MainForm.Le1empno;
                    orgnum   := DataModule_Tmax.Csel_gfd(31);
                    deptcode := DataModule_Tmax.Csel_gfd(32);
       QRL_E1Deptname.Caption:= MainForm.Get_Dept(orgnum,deptcode);


       if DataModule_Tmax.Csel_gfd(28) = 'Y' then
         QRL_E1Prjcondate.Caption := Copy(DataModule_Tmax.Csel_gfd(29),1,4)+'.'+
                                     Copy(DataModule_Tmax.Csel_gfd(29),5,2)+'.'+
                                     Copy(DataModule_Tmax.Csel_gfd(29),7,2)
       else
         QRL_E1Prjcondate.Caption := '';
                        codeno := DataModule_Tmax.Csel_gfd(30);
//       QRL_E1Payclname.Caption := MainForm.Get_Code('I112',codeno);
       QRL_E1Payraname.Caption := MainForm.Pa_Le1Payra.caption;

     end;
end;

procedure TPrintForm.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  PageHeaderBand1.Enabled := False;
end;

end.
