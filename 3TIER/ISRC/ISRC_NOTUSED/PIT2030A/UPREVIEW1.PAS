unit UPreview1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, TXClientDS, Db; //common,

type
  TPreviewForm1 = class(TForm)
    pequickRepPrn1: TQuickRep;
    PageHeaderBand1: TQRBand;
    A_DetailBand: TQRSubDetail;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRL_Deptname: TQRLabel;
    QRL_AftDeptname: TQRLabel;
    QRL_Payraname: TQRLabel;
    QRL_Appdate: TQRLabel;
    QRL_Korname: TQRLabel;
    QRL_Empno: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRM_Motive: TQRMemo;
    QRM_EtcDesc: TQRMemo;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    gOrgnum    : string;
    gDeptcode  : string;
    gCodeno    : string;
    gCut_length: integer;

    gsEmpno     : String;
    gsDutyDate  : String;
    gsDutyno    : String;
    giSeqno     : Integer;


    procedure InitQrLabel(gubun: Integer);
    Procedure GetPageHeader;
  public
    giGigubn    : Integer;  
    { Public declarations }
  end;

var
  PreviewForm1: TPreviewForm1;

implementation

{$R *.DFM}

uses
  pit203000, pit203011, PePrnview;//, tuxlib;

procedure TPreviewForm1.InitQrLabel(gubun: Integer);
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TQRMemo then
      if TQRMemo(Components[i]).Tag = gubun then
      begin
        TQRMemo(Components[i]).Lines.Clear;
        TQRMemo(Components[i]).Lines.Text := '';
      end;
    if Components[i] is TQRLabel then
      if TQRLabel(Components[i]).Tag = gubun then
      begin
        TQRLabel(Components[i]).Caption := '';
      end;
  end;
end;

procedure TPreviewForm1.PeQuickRepPrn1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,PeQuickRepPrn1);
  Fm_PreviewForm.Show;
end;

procedure TPreviewForm1.PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  GetPageHeader;
end;

procedure TPreviewForm1.GetPageHeader;
begin
  with MainForm.TMain do
  begin
    QRL_Deptname.Caption    := FieldByName('DEPTNAME').Asstring;

    if      giGigubn = 1 then  QRL_AftDeptname.Caption := FieldByName('aftdeptname1').Asstring
    else if giGigubn = 2 then  QRL_AftDeptname.Caption := FieldByName('aftdeptname2').Asstring
    else if giGigubn = 3 then  QRL_AftDeptname.Caption := FieldByName('aftdeptname3').Asstring;

    QRL_Empno.Caption       := FieldByName('EMPNO').Asstring;
    QRL_Korname.Caption     := FieldByName('KORNAME').Asstring;
//    QRL_Payclname.Caption   := FieldByName('PAYCLNAME').Asstring;
    QRL_Payraname.Caption   := FieldByName('PAYRANAME').Asstring;
    QRL_Appdate.Caption     := copy(FieldByName('APPDATE').Asstring,1,4)+'/'+
                               copy(FieldByName('APPDATE').Asstring,5,2)+'/'+
                               copy(FieldByName('APPDATE').Asstring,7,2);

//  InitQrLabel(99);

  end;
end;

procedure TPreviewForm1.A_DetailBandNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  with MainForm.TMain do
  begin
    if EOF then
    begin
      Moredata := False;
      First;
    end
    else
    begin
    if      giGigubn = 1 then
    begin
       QRM_Motive.Lines.Text  := FieldByName('MOTIVE1').Asstring;
       QRM_EtcDesc.Lines.Text := FieldByName('ETCDESC1').Asstring;
    end else
    if giGigubn = 2 then
    begin
       QRM_Motive.Lines.Text  := FieldByName('MOTIVE2').Asstring;
       QRM_EtcDesc.Lines.Text := FieldByName('ETCDESC2').Asstring;
    end else
    if giGigubn = 3 then
    begin
       QRM_Motive.Lines.Text  := FieldByName('MOTIVE3').Asstring;
       QRM_EtcDesc.Lines.Text := FieldByName('ETCDESC3').Asstring;
    end;
          //  1Áö¸Á, 2Áö¸Á , 3Áö¸Á ±¸ºÐ
//      QRM_Motive.Lines.Text  := FieldByName('MOTIVE1').Asstring;
//      QRM_EtcDesc.Lines.Text := FieldByName('ETCDESC1').Asstring;

      Moredata := True;
      Next;
    end;
  end;
end;

end.

