unit pea1060a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, common,  Db, Tmax_DataSetText;

type
  TPrintForm = class(TForm)
    PeQuickRepPrn1: TPeQuickRepPrn;
    PageHeaderBand1: TQRBand;
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
    QRLabel2: TQRLabel;
    QRL_Spedate: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRShape27: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape29: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape31: TQRShape;
    QRLabel21: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel23: TQRLabel;
    QRShape37: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape40: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRL_E1Empno: TQRLabel;
    QRL_E1Korname: TQRLabel;
    QRL_E1Payclname: TQRLabel;
    QRL_E1Deptname: TQRLabel;
    QRL_E1Payraname: TQRLabel;
    QRShape54: TQRShape;
    QRLabel26: TQRLabel;
    QRShape56: TQRShape;
    QRL_E1Prjcondate: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRShape36: TQRShape;
    QRShape45: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape59: TQRShape;
    QRDBText3: TQRDBText;
    ChildBand1: TQRChildBand;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape42: TQRShape;
    QRShape57: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape39: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape51: TQRShape;
    QRDBText1: TQRDBText;
    ChildBand2: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    QRShape58: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel41: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel42: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText12: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRSysData2Print(sender: TObject; var Value: String);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  private
    { Private declarations }
    DbSet      : TDataSet;
   rabasdate : string;
   empno     : string;
   orgnum    : string;
   deptcode  : string;
   codeno    : string;
   jobgubun  : String;
   cut_length: integer;
   GSeqno    : integer;

   istr, iend : integer;
   idStr, idEnd : integer;

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

uses Hinsa_TmaxDM, PePrnview, PeMainForm, peDm, pea1060a1;


procedure TPrintForm.GetRabasdate;
var
     Sqltext : string;
     DateFr,DateTo : string;
begin
     QRL_Spedate.Caption := Copy(MainForm.Lrabasdate, 1, 4) + ' 년';
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
          if  Components[i] is TQRMemo then
               if  TQRMemo(Components[i]).Tag = 99 then
               begin
                    TQRMemo(Components[i]).Lines.Clear;
                    TQRMemo(Components[i]).Lines.Text := '';
               end;
          if  Components[i] is TQRLabel then
               if  TQRLabel(Components[i]).Tag = 99 then
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
     QRL_Empno.Caption        := '';
     QRL_Korname.Caption      := '';
     QRL_Payclname.Caption    := '';
     QRL_Deptname.Caption     := '';
     QRL_Payraname.Caption    := '';
     QRL_Empdate.Caption      := '';
     QRL_Paycldate.Caption    := '';
     QRL_Trdate.Caption       := '';

     QRL_E1Korname.Caption    := '';
     QRL_E1Empno.Caption      := '';
     QRL_E1Payclname.Caption  := '';
     QRL_E1Deptname.Caption   := '';
     QRL_E1Payraname.Caption  := '';
     QRL_E1Prjcondate.Caption := '';

     GetRabasdate; //평가대상기간

     GetPageHeader;

     rabasdate                := MainForm.lRabasdate;
     empno                    := DataModule_Tmax.Csel_gfd(1);

     GSeqno                   := 0;

     QRLabel41.Caption        := '0';
end;

Procedure TPrintForm.GetPageHeader;
var
     Tmp : Tstrings;
     Sqltext : string;
begin
     tmp := TStringList.Create;
     with DM.DBSet3 do
     begin
          if  MainForm.Pa_jobgun.Hint > '0' then
               jobgubun := MainForm.Pa_jobgun.Hint;

          if  (jobgubun = '11') or (jobgubun = '22') or (jobgubun = '33') or (jobgubun = '44') then  // 11-경영관리직군, 22-마케팅/영업직군, 33-R&D직군, 44-기술직군
          begin
{
               10, 12, 20, 30, 40 : begin
                                         QRL_Jobgunname.Caption    := '<관리/기술/연구직군>';
                                         A_GroupHeaderBand.Enabled := True;
                                         A_DetailBand.Enabled      := True;
                                    end;
}
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
          QRL_E1Deptname.Caption:= MainForm.Get_Dept(deptcode,orgnum);


          if  DataModule_Tmax.Csel_gfd(28) = 'Y' then
               QRL_E1Prjcondate.Caption := Copy(DataModule_Tmax.Csel_gfd(29),1,4)+'.'+
                                           Copy(DataModule_Tmax.Csel_gfd(29),5,2)+'.'+
                                           Copy(DataModule_Tmax.Csel_gfd(29),7,2)
          else
               QRL_E1Prjcondate.Caption := '';

          codeno                  := DataModule_Tmax.Csel_gfd(30);
          QRL_E1Payclname.Caption := MainForm.Get_Code('I112',codeno);
          QRL_E1Payraname.Caption := MainForm.Pa_Le1Payra.caption;

     end;
end;

procedure TPrintForm.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     PageHeaderBand1.Enabled := False;
end;


procedure TPrintForm.QRSysData1Print(sender: TObject; var Value: String);
begin
     Value             := IntToStr(StrToInt(QRLabel41.Caption) + 1);
     QRLabel41.Caption := IntToStr(StrToInt(QRLabel41.Caption) + 1); 
end;

procedure TPrintForm.QRSysData2Print(sender: TObject; var Value: String);
begin
     Value             := IntToStr(StrToInt(QRLabel42.Caption) + 1);
     QRLabel42.Caption := IntToStr(StrToInt(QRLabel42.Caption) + 1);
end;

procedure TPrintForm.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     QRLabel42.Caption := '0';
end;

end.
