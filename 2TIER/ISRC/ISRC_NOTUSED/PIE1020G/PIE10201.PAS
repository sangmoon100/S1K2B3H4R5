unit pie10201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, ExtCtrls, DB, DBTables, Qrctrls,
  PeQuickRepPrn;

type
  TFpie10201 = class(TForm)
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QuickReport1: TQuickRep;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBCalc1: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickReport1AfterPrint(Sender: TObject);
    procedure QuickReport1Preview(Sender: TObject);
  private
    { Private declarations }
    aFile : Text;
  public
    { Public declarations }
  end;

var
  Fpie10201: TFpie10201;

implementation

{$R *.DFM}

Uses e1020g, PePrnview;

procedure TFpie10201.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
//var
//   aOpenDialog : TOpenDialog;
begin
//   aOpenDialog:=TopenDialog.Create(self);
//   with aOpenDialog do begin
//      Filter:='Pascal files (*.PAS)|*.PAS|Text files (*.err)|*.err';
//      options:=[ofFileMustExist];
//      if not execute then PrintReport:=false
//      else  begin
         AssignFile(aFile,e1020g.HomeDir+'\list\pie1020g.err');
         reset(afile);
//         Rep.ReportTitle:=Filename;
//      end;
//      free;
//   end;
end;

procedure TFpie10201.QuickReport1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
   Line : String;
begin
   if not eof(aFile) then begin
      readln(aFile,Line);
      qrlabel5.caption:=Line;
      MoreData:=True;
   end
   else MoreData:=False;
end;

procedure TFpie10201.QuickReport1AfterPrint(Sender: TObject);
begin
     CloseFile(aFile);
end;

procedure TFpie10201.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     ymd : String;
begin
     ymd := Fpie1020g.L_CurDate.Caption;
     QRLabel10.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
     QRLabel8.Caption  := '텍스트화일명 : '+Fpie1020g.MaskEdit1.Text;
end;

procedure TFpie10201.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   AllItem,ErrItem : Integer;
begin
     AllItem := e1020g.Ai;
     ErrItem := e1020g.errcnt;
     QRlabel4.Caption := '총 건수 : '+IntToStr(AllItem)+' 건';
     QRlabel6.Caption := '에러 건수 : '+IntToStr(ErrItem)+' 건';
     QRlabel7.Caption := '저장 건수 : '+IntToStr(AllItem-ErrItem)+' 건';
end;

procedure TFpie10201.QuickReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
  Fm_PreviewForm.Show;
end;

end.


