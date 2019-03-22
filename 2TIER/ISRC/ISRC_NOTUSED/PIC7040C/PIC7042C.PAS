unit Pic7042c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,StdCtrls, Qrctrls, QuickRpt,QRprntr;

type
  Tpic7042cForm = class(TForm)
    apprReport: TQuickRep;
    hBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    dband: TQRBand;
    empno: TQRLabel;
    payra: TQRLabel;
    mpage: TQRSysData;
    QRShape5: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    mdate: TQRLabel;
    QRShape31: TQRShape;
    QRShape15: TQRShape;
    QRShape10: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    korname: TQRLabel;
    deptname: TQRLabel;
    QRShape8: TQRShape;
    QRLabel9: TQRLabel;
    bdeptname: TQRLabel;
    QRShape12: TQRShape;
    bpayra: TQRLabel;
    jgubun: TQRLabel;
    QRShape13: TQRShape;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel7: TQRLabel;
    paycl: TQRLabel;
    procedure apprReportAfterPrint(Sender: TObject);
    procedure apprReportPreview(Sender: TObject);
    procedure apprReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure apprReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure hBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PageCnt : integer;
  end;

var
  pic7042cForm: Tpic7042cForm;

implementation
uses pic7041c, pic7043c, peprnView;
{$R *.DFM}

procedure Tpic7042cForm.apprReportAfterPrint(Sender: TObject);
begin
  System.Close(F);
end;

procedure Tpic7042cForm.apprReportPreview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,apprReport);
   Fm_PreviewForm.Show;
end;

procedure Tpic7042cForm.apprReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(F,HomeDir+'\list\pic7040c.tmp');
  System.Reset(F);
  PageCnt  := 1;
end;

procedure Tpic7042cForm.apprReportNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(F) then
  begin
    Read(F,iData);
    empno.caption      := idata.empno;
    korname.caption    := idata.korname;
    deptname.caption   := idata.deptname;
    payra.caption      := idata.payra;
    paycl.caption      := idata.paycl;
    bdeptname.caption  := idata.bdeptname;
    bpayra.caption     := idata.bpayra;
    jgubun.caption     := idata.jgubun;

    dBand.Enabled  := True;
    MoreData := True;

     if (pic7041c.iData.gubun = 'P') or
        (pic7041c.iData.gubun = 'S') then begin
        inc(Pagecnt);
        dBand.enabled := False;
        apprReport.NewPage;
        system.Exit;
    end;
  end else MoreData := False;
end;

procedure Tpic7042cForm.hBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   mdate.caption := pic7041cForm.L_CurDate.Caption;
   mpage.caption := inttostr(pagecnt);
end;

end.
