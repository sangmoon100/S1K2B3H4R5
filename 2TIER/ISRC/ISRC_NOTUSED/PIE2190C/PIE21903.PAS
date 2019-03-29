unit pie21903;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type PrnText = record
     gubun : string[1];
     pagename : string[12];
     dept1 : string[60];
     deptcode : string[8];
     bigo : string[6];
end;

type
  TPrnForm2 = class(TForm)
    Rpt: TQuickRep;
    QRBand1: TQRBand;
    pageName: TQRLabel;
    pWorkDate: TQRLabel;
    dBand: TQRBand;
    dept1: TQRLabel;
    deptcode: TQRLabel;
    bigo: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape3: TQRShape;
    QRShape13: TQRShape;
    procedure RptBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RptAfterPrint(Sender: TObject);
    procedure RptPreview(Sender: TObject);
    procedure RptNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    F : file of PrnText;
    D : PrnText;
  public
    { Public declarations }
  end;

var
  PrnForm2: TPrnForm2;

implementation

uses pie21901, peprnView;

{$R *.DFM}

procedure TPrnForm2.RptBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(F,TempFile); Reset(F);
end;

procedure TPrnForm2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Rpt.PageNumber = 1 then begin
      pageName.Caption := '['+MainForm.PageName+']';
  end else begin
      pageName.Caption := '['+D.PageName+']';
  end;
  pWorkDate.Caption := '[기준년월 : '+copy(MainForm.WorkDate.Text,1,4)+'/'+
                                       copy(MainForm.WorkDate.Text,5,2)+']';
end;

procedure TPrnForm2.RptAfterPrint(Sender: TObject);
begin
  System.close(F);
end;

procedure TPrnForm2.RptPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Rpt);
  Fm_PreviewForm.Show;
end;

procedure TPrnForm2.RptNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if not Eof(F) then begin
    Read(F,D);
    dept1.caption  := D.dept1;
    deptcode.caption := D.deptcode;
    bigo.caption := D.bigo;
    //dBand.Enabled  := True;
    MoreData := True;
    if D.gubun = 'P' then begin
       //dBand.Enabled  := False;
       Rpt.NewPage;
       system.Exit;
    end;
  end else MoreData := False;
end;

end.
