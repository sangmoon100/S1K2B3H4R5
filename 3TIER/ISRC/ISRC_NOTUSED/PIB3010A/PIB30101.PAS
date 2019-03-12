unit PIB30101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables;

type
  TFm_Pib30101 = class(TForm)
    QRBand2: TQRBand;
    InReport: TQuickRep;
    QRL_certprno: TQRLabel;
    QRL_PrintDate: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_juminid: TQRLabel;
    QRL_fieldname: TQRLabel;
    QRL_used: TQRLabel;
    QRL_payname: TQRLabel;
    QRL_indate: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_Compname: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_PresName: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    procedure InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure InReportPreview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Pib30101: TFm_Pib30101;

implementation

uses PIB30100, PrintView;
{$R *.DFM}

procedure TFm_Pib30101.InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRL_PrintDate.Caption := Copy(FM_Main.GSsysdate,1,4)+' 년  '+
                           Copy(FM_Main.GSsysdate,5,2)+' 월  '+
                           Copy(FM_Main.GSsysdate,7,2)+' 일';
end;

procedure TFm_Pib30101.InReportPreview(Sender: TObject);
begin
   ViewForm := TViewForm.CreatePreview(Application,inReport);
   ViewForm.Show;
end;

procedure TFm_Pib30101.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {//2015.04.03.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
  QRL_certprno.Caption  := Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,1,4)+'-'+
                           Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,5,2)+'-'+
                           Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,7,6);
  }

  QRL_certprno.Caption  := Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,1,6)+'-'+
                           Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,7,4)+'-'+
                           Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,11,6);

  QRL_korname.Caption   := FM_Main.Vkorname;
  QRL_juminid.Caption   := FM_Main.vjuminid;

  if (copy(FM_Main.ED_empno.text,1,4) = '1485') then
    QRL_fieldname.Caption := FM_Main.vdeptname + '(사무직)'
  Else
    QRL_fieldname.Caption := FM_Main.vdeptname;

  QRL_payname.Caption   := FM_Main.MEpayra.ValueCaption;
  QRL_indate.Caption    := Copy(FM_Main.VStdate,1,4)+'.'+Copy(FM_Main.VStdate,5,2)+'.'+Copy(FM_Main.VStdate,7,2)+' ~ '+
                           Copy(FM_Main.VEDdate,1,4)+'.'+Copy(FM_Main.VEDdate,5,2)+'.'+Copy(FM_Main.VEDdate,7,2)+' 현재 ( '+
                           FM_Main.VDuyy+'년 '+FM_Main.VDuMM+'월 )';
  QRL_used.Caption      := FM_Main.TPrint.fieldbyname('CERTUSED').AsString;
  QRL_CompName.Caption  := FM_Main.vCompname;
  QRL_Presname.Caption  := FM_Main.vPresname;
end;

end.

