unit HPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn,  Db;

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
    QRShape58: TQRShape;
    QRLabel41: TQRLabel;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRLabel50: TQRLabel;
    QRShape61: TQRShape;
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
    QRL_rscore: TQRLabel;
    QRL_escore: TQRLabel;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
   rabasdate : string;
   empno     : string;
   orgnum    : string;
   deptcode  : string;
   codeno    : string;
   jobgubun  : integer;
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
  PePrnview, HMainForm;


procedure TPrintForm.GetRabasdate;
var
  Sqltext : string;
  DateFr,DateTo : string;
begin
  QRL_Spedate.Caption := '2006 년 ';
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

  rabasdate := FM_Main.Lrabasdate;
  empno     := FM_Main.GSempno;

  GSeqno  := 0;
end;

procedure TPrintForm.A_DetailBandNeedData(Sender: TObject;
  var MoreData: Boolean);
Var
   tMP :Tstrings;
begin
     InitQrLabel;

     tmp := TStringList.Create;
     with FM_Main.DBSet1 do
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
                  if FieldByName('DETAILRSCORE1').AsString <> '0' then
                    QRL_detailrscore1.Caption := FieldByName('DETAILRSCORE1').AsString
                  else
                    QRL_detailrscore1.Caption :='';

                  if FieldByName('DETAILRSCORE2').AsString <> '0' then
                    QRL_detailrscore2.Caption := FieldByName('DETAILRSCORE2').AsString
                  else
                    QRL_detailrscore2.Caption :='';

                  if FieldByName('DETAILRSCORE3').AsString <> '0' then
                    QRL_detailrscore3.Caption := FieldByName('DETAILRSCORE3').AsString
                  else
                    QRL_detailrscore3.Caption :='';

                  if FieldByName('DETAILRSCORE4').AsString <> '0' then
                    QRL_detailrscore4.Caption := FieldByName('DETAILRSCORE4').AsString
                  else
                    QRL_detailrscore4.Caption :='';

                  if FieldByName('DETAILRSCORE5').AsString <> '0' then
                    QRL_detailrscore5.Caption := FieldByName('DETAILRSCORE5').AsString
                  else
                    QRL_detailrscore5.Caption :='';

                  //자기평가 등급
                       if FieldByName('DETAILRCLASS1').AsString = 'S' then QRL_detailrclass1.Caption := 'S'
                  else if FieldByName('DETAILRCLASS1').AsString = 'A' then QRL_detailrclass1.Caption := 'E'
                  else if FieldByName('DETAILRCLASS1').AsString = 'B' then QRL_detailrclass1.Caption := 'G'
                  else if FieldByName('DETAILRCLASS1').AsString = 'C' then QRL_detailrclass1.Caption := 'N'
                  else if FieldByName('DETAILRCLASS1').AsString = 'D' then QRL_detailrclass1.Caption := 'U'
                  else                                                     QRL_detailrclass1.Caption := '';

                       if FieldByName('DETAILRCLASS2').AsString = 'S' then QRL_detailrclass2.Caption := 'S'
                  else if FieldByName('DETAILRCLASS2').AsString = 'A' then QRL_detailrclass2.Caption := 'E'
                  else if FieldByName('DETAILRCLASS2').AsString = 'B' then QRL_detailrclass2.Caption := 'G'
                  else if FieldByName('DETAILRCLASS2').AsString = 'C' then QRL_detailrclass2.Caption := 'N'
                  else if FieldByName('DETAILRCLASS2').AsString = 'D' then QRL_detailrclass2.Caption := 'U'
                  else                                                     QRL_detailrclass2.Caption := '';

                       if FieldByName('DETAILRCLASS3').AsString = 'S' then QRL_detailrclass3.Caption := 'S'
                  else if FieldByName('DETAILRCLASS3').AsString = 'A' then QRL_detailrclass3.Caption := 'E'
                  else if FieldByName('DETAILRCLASS3').AsString = 'B' then QRL_detailrclass3.Caption := 'G'
                  else if FieldByName('DETAILRCLASS3').AsString = 'C' then QRL_detailrclass3.Caption := 'N'
                  else if FieldByName('DETAILRCLASS3').AsString = 'D' then QRL_detailrclass3.Caption := 'U'
                  else                                                     QRL_detailrclass3.Caption := '';

                       if FieldByName('DETAILRCLASS4').AsString = 'S' then QRL_detailrclass4.Caption := 'S'
                  else if FieldByName('DETAILRCLASS4').AsString = 'A' then QRL_detailrclass4.Caption := 'E'
                  else if FieldByName('DETAILRCLASS4').AsString = 'B' then QRL_detailrclass4.Caption := 'G'
                  else if FieldByName('DETAILRCLASS4').AsString = 'C' then QRL_detailrclass4.Caption := 'N'
                  else if FieldByName('DETAILRCLASS4').AsString = 'D' then QRL_detailrclass4.Caption := 'U'
                  else                                                     QRL_detailrclass4.Caption := '';

                       if FieldByName('DETAILRCLASS5').AsString = 'S' then QRL_detailrclass5.Caption := 'S'
                  else if FieldByName('DETAILRCLASS5').AsString = 'A' then QRL_detailrclass5.Caption := 'E'
                  else if FieldByName('DETAILRCLASS5').AsString = 'B' then QRL_detailrclass5.Caption := 'G'
                  else if FieldByName('DETAILRCLASS5').AsString = 'C' then QRL_detailrclass5.Caption := 'N'
                  else if FieldByName('DETAILRCLASS5').AsString = 'D' then QRL_detailrclass5.Caption := 'U'
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
                       if FieldByName('DETAILECLASS1').AsString = 'S' then QRL_detaileclass1.Caption := 'S'
                  else if FieldByName('DETAILECLASS1').AsString = 'A' then QRL_detaileclass1.Caption := 'E'
                  else if FieldByName('DETAILECLASS1').AsString = 'B' then QRL_detaileclass1.Caption := 'G'
                  else if FieldByName('DETAILECLASS1').AsString = 'C' then QRL_detaileclass1.Caption := 'N'
                  else if FieldByName('DETAILECLASS1').AsString = 'D' then QRL_detaileclass1.Caption := 'U'
                  else                                                     QRL_detaileclass1.Caption := '';

                       if FieldByName('DETAILECLASS2').AsString = 'S' then QRL_detaileclass2.Caption := 'S'
                  else if FieldByName('DETAILECLASS2').AsString = 'A' then QRL_detaileclass2.Caption := 'E'
                  else if FieldByName('DETAILECLASS2').AsString = 'B' then QRL_detaileclass2.Caption := 'G'
                  else if FieldByName('DETAILECLASS2').AsString = 'C' then QRL_detaileclass2.Caption := 'N'
                  else if FieldByName('DETAILECLASS2').AsString = 'D' then QRL_detaileclass2.Caption := 'U'
                  else                                                     QRL_detaileclass2.Caption := '';

                       if FieldByName('DETAILECLASS3').AsString = 'S' then QRL_detaileclass3.Caption := 'S'
                  else if FieldByName('DETAILECLASS3').AsString = 'A' then QRL_detaileclass3.Caption := 'E'
                  else if FieldByName('DETAILECLASS3').AsString = 'B' then QRL_detaileclass3.Caption := 'G'
                  else if FieldByName('DETAILECLASS3').AsString = 'C' then QRL_detaileclass3.Caption := 'N'
                  else if FieldByName('DETAILECLASS3').AsString = 'D' then QRL_detaileclass3.Caption := 'U'
                  else                                                     QRL_detaileclass3.Caption := '';

                       if FieldByName('DETAILECLASS4').AsString = 'S' then QRL_detaileclass4.Caption := 'S'
                  else if FieldByName('DETAILECLASS4').AsString = 'A' then QRL_detaileclass4.Caption := 'E'
                  else if FieldByName('DETAILECLASS4').AsString = 'B' then QRL_detaileclass4.Caption := 'G'
                  else if FieldByName('DETAILECLASS4').AsString = 'C' then QRL_detaileclass4.Caption := 'N'
                  else if FieldByName('DETAILECLASS4').AsString = 'D' then QRL_detaileclass4.Caption := 'U'
                  else                                                     QRL_detaileclass4.Caption := '';

                       if FieldByName('DETAILECLASS5').AsString = 'S' then QRL_detaileclass5.Caption := 'S'
                  else if FieldByName('DETAILECLASS5').AsString = 'A' then QRL_detaileclass5.Caption := 'E'
                  else if FieldByName('DETAILECLASS5').AsString = 'B' then QRL_detaileclass5.Caption := 'G'
                  else if FieldByName('DETAILECLASS5').AsString = 'C' then QRL_detaileclass5.Caption := 'N'
                  else if FieldByName('DETAILECLASS5').AsString = 'D' then QRL_detaileclass5.Caption := 'U'
                  else                                                     QRL_detaileclass5.Caption := '';

                  Next;
                //end;
           //end;
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
       QRL_Empdate.Caption   := FM_Main.DBSet1.FieldByName('EMPDATE').AsString;
       QRL_Paycldate.Caption := FM_Main.DBSet1.FieldByName('PAYCLDATE').AsString;
       QRL_Trdate.Caption    := FM_Main.DBSet1.FieldByName('TRDATE').AsString;
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
         QRL_E1Prjcondate.Caption := FM_Main.Le1valcondate
       else
         QRL_E1Prjcondate.Caption := '';
                        //codeno := DataModule_Tmax.Csel_gfd(30);
//       QRL_E1Payclname.Caption := FM_Main.Lpayclname;
       QRL_E1Payraname.Caption := FM_Main.Lpayraname;

     end;
end;

procedure TPrintForm.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  PageHeaderBand1.Enabled := False;

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

end.
