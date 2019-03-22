unit pia10802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls,pia10801;

type
  Tpia10802Form = class(TForm)
    hBand: TQRBand;
    Rpt: TQuickRep;
    QRShape1: TQRShape;
    qTitle: TQRLabel;
    dBand: TQRBand;
    QRShape12: TQRShape;
    deptcode: TQRLabel;
    empno: TQRLabel;
    korname: TQRLabel;
    jobdept: TQRLabel;
    bjobplace: TQRLabel;
    jobplace: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    BonCode: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    rcnt: TQRLabel;
    sBand: TQRBand;
    QRShape29: TQRShape;
    QRLabel8: TQRLabel;
    scnt: TQRLabel;
    QRLabel13: TQRLabel;
    tBand: TQRBand;
    QRShape42: TQRShape;
    QRLabel9: TQRLabel;
    QRLorderbyname: TQRLabel;
    QRLabel27: TQRLabel;
    tcnt: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    mdate: TQRLabel;
    procedure RptNeedData(Sender: TObject; var MoreData: Boolean);
    procedure RptBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure RptAfterPrint(Sender: TObject);
    procedure tBandBeforePrint(var PrintBand: Boolean);
    procedure hBandBeforePrint(var PrintBand: Boolean);
  private
    { Private declarations }
    F  : file of prn;
    pd : prn;
  public
    { Public declarations }
    tBoncode : string;
    content  : string;
  end;

var
  pia10802Form: Tpia10802Form;

implementation

{$R *.DFM}

procedure Tpia10802Form.RptNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if not Eof(F) then
  begin
    Read(F,pd);
    rcnt.Caption     := inttostr(pd.rcnt);
    empno.Caption    := pd.empno;
    korname.Caption  := pd.korname;
    deptcode.Caption := pd.deptcode;
    jobdept.Caption  := pd.jobdept;
    bjobplace.Caption:= pd.bjobplace;
    jobplace.Caption := pd.jobplace;
    scnt.Caption     := inttostr(pd.stotal);
    dBand.Enabled    := True;
    sBand.Enabled    := False;
    MoreData := True;
    if pd.gubun = 'P' then begin
       dBand.Enabled  := False;
       tBonCode := pd.BonCode;
       Rpt.NewPage;
       system.exit;
    end;
    if pd.gubun = 'B' then begin
       dBand.Enabled   := False;
       sBand.Enabled   := True;
       system.exit;
    end;
  end else MoreData := False;
end;

procedure Tpia10802Form.RptBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  system.AssignFile(F,'c:\pia1080a.dat');
  System.Reset(F);
end;

procedure Tpia10802Form.RptAfterPrint(Sender: TObject);
begin
  system.close(F);
end;

procedure Tpia10802Form.tBandBeforePrint(var PrintBand: Boolean);
begin
  tcnt.Caption := inttostr(pd.ttotal);
end;

procedure Tpia10802Form.hBandBeforePrint(var PrintBand: Boolean);
begin
  qTitle.Caption  := Content;
  BonCode.Caption := '¡á º»ºÎ¸í : '+pia10801Form.QdeptDisp(tBoncode,pia10801Form.WorkMan.Orgnum,1);
  mDate.Caption   := pia10801Form.L_CurDate.Caption;
end;

end.

