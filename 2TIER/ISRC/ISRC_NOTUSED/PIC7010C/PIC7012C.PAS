unit Pic7012c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,StdCtrls, Qrctrls, QuickRpt,QRprntr;

type
  Tpic7012cForm = class(TForm)
    apprReport: TQuickRep;
    hBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    dband: TQRBand;
    bdeptabbr: TQRLabel;
    deptabbr: TQRLabel;
    mpage: TQRSysData;
    QRShape5: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    mdate: TQRLabel;
    remark: TQRLabel;
    QRShape17: TQRShape;
    QRShape31: TQRShape;
    QRShape15: TQRShape;
    QRShape10: TQRShape;
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
    First_p :Boolean;
    PageCnt : integer;
    title,tot,stot : string;
  end;

var
  pic7012cForm: Tpic7012cForm;

implementation
uses pic7011c, pic7013c, peprnView;
{$R *.DFM}

procedure Tpic7012cForm.apprReportAfterPrint(Sender: TObject);
begin
  System.Close(pic7011c.F);
end;

procedure Tpic7012cForm.apprReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,apprReport);
  Fm_PreviewForm.Show;
end;

procedure Tpic7012cForm.apprReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  First_p := False;
  AssignFile(pic7011c.F,HomeDir+'\list\pic7010c.tmp');
  System.Reset(pic7011c.F);
  PageCnt  := 1;
end;

procedure Tpic7012cForm.apprReportNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(F) then
  begin
    Read(pic7011c.F,pic7011c.iData);
    bdeptabbr.caption    := pic7011c.idata.bdeptabbr;
    deptabbr.caption     := pic7011c.idata.deptabbr;
    remark.caption       := pic7011c.idata.remark;

    dBand.Enabled  := True;
    MoreData := True;

     if (pic7011c.iData.gubun = 'P') then begin
//        (pic7011c.iData.gubun = 'S') then begin
        inc(Pagecnt);
        dBand.enabled := False;
        apprReport.NewPage;
        system.Exit;
    end;
  end else MoreData := False;
end;

procedure Tpic7012cForm.hBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   mdate.caption := pic7011cForm.L_CurDate.Caption;
   mpage.caption := inttostr(pagecnt);

end;





























end.
