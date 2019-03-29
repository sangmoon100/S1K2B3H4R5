unit Pic7062c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,StdCtrls, Qrctrls, QuickRpt,QRprntr;

type
  Tpic7062cForm = class(TForm)
    QRLabel206: TQRLabel;
    QRLabel205: TQRLabel;
    QRLabel204: TQRLabel;
    apprReport: TQuickRep;
    hBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRShape5: TQRShape;
    QRShape21: TQRShape;
    mdate: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRLabel12: TQRLabel;
    QRShape27: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape40: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    dband: TQRBand;
    payra: TQRLabel;
    QRShape24: TQRShape;
    QRShape31: TQRShape;
    QRShape15: TQRShape;
    QRShape10: TQRShape;
    deptna1: TQRLabel;
    QRShape8: TQRShape;
    c11: TQRLabel;
    QRShape17: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    c21: TQRLabel;
    c41: TQRLabel;
    p51: TQRLabel;
    c51: TQRLabel;
    p61: TQRLabel;
    c61: TQRLabel;
    c81: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape33: TQRShape;
    QRLabel29: TQRLabel;
    c12: TQRLabel;
    c16: TQRLabel;
    c17: TQRLabel;
    c22: TQRLabel;
    c26: TQRLabel;
    c27: TQRLabel;
    c42: TQRLabel;
    c36: TQRLabel;
    c37: TQRLabel;
    p52: TQRLabel;
    c52: TQRLabel;
    p62: TQRLabel;
    c62: TQRLabel;
    c82: TQRLabel;
    c86: TQRLabel;
    c87: TQRLabel;
    QRShape12: TQRShape;
    c91: TQRLabel;
    QRShape13: TQRShape;
    p81: TQRLabel;
    p82: TQRLabel;
    c92: TQRLabel;
    c71: TQRLabel;
    QRShape32: TQRShape;
    p71: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    p41: TQRLabel;
    p42: TQRLabel;
    c31: TQRLabel;
    c32: TQRLabel;
    QRShape36: TQRShape;
    p31: TQRLabel;
    QRShape37: TQRShape;
    p21: TQRLabel;
    QRShape38: TQRShape;
    p11: TQRLabel;
    p12: TQRLabel;
    p16: TQRLabel;
    p17: TQRLabel;
    p22: TQRLabel;
    p26: TQRLabel;
    p27: TQRLabel;
    p32: TQRLabel;
    p36: TQRLabel;
    p37: TQRLabel;
    p46: TQRLabel;
    p47: TQRLabel;
    c46: TQRLabel;
    c47: TQRLabel;
    p56: TQRLabel;
    c56: TQRLabel;
    p66: TQRLabel;
    c66: TQRLabel;
    p57: TQRLabel;
    c57: TQRLabel;
    p67: TQRLabel;
    c67: TQRLabel;
    p72: TQRLabel;
    c72: TQRLabel;
    p76: TQRLabel;
    c76: TQRLabel;
    p86: TQRLabel;
    c96: TQRLabel;
    p77: TQRLabel;
    c77: TQRLabel;
    p87: TQRLabel;
    c97: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    p18: TQRLabel;
    c18: TQRLabel;
    p28: TQRLabel;
    c28: TQRLabel;
    p38: TQRLabel;
    c38: TQRLabel;
    p48: TQRLabel;
    c48: TQRLabel;
    p58: TQRLabel;
    c58: TQRLabel;
    p68: TQRLabel;
    p78: TQRLabel;
    c78: TQRLabel;
    p88: TQRLabel;
    c88: TQRLabel;
    c98: TQRLabel;
    QRShape52: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    p19: TQRLabel;
    c19: TQRLabel;
    p29: TQRLabel;
    c29: TQRLabel;
    p39: TQRLabel;
    c39: TQRLabel;
    p49: TQRLabel;
    c49: TQRLabel;
    p59: TQRLabel;
    c59: TQRLabel;
    p69: TQRLabel;
    c68: TQRLabel;
    c69: TQRLabel;
    p79: TQRLabel;
    c79: TQRLabel;
    p89: TQRLabel;
    c89: TQRLabel;
    c99: TQRLabel;
    QRShape39: TQRShape;
    QRShape55: TQRShape;
    QRShape58: TQRShape;
    QRShape60: TQRShape;
    p110: TQRLabel;
    c110: TQRLabel;
    p210: TQRLabel;
    c210: TQRLabel;
    p310: TQRLabel;
    c310: TQRLabel;
    p410: TQRLabel;
    c410: TQRLabel;
    p510: TQRLabel;
    c510: TQRLabel;
    p610: TQRLabel;
    c610: TQRLabel;
    p710: TQRLabel;
    c710: TQRLabel;
    p810: TQRLabel;
    c810: TQRLabel;
    c910: TQRLabel;
    p112: TQRLabel;
    c112: TQRLabel;
    p212: TQRLabel;
    c212: TQRLabel;
    p312: TQRLabel;
    c312: TQRLabel;
    p412: TQRLabel;
    c412: TQRLabel;
    p512: TQRLabel;
    c512: TQRLabel;
    p612: TQRLabel;
    c612: TQRLabel;
    p712: TQRLabel;
    c712: TQRLabel;
    p812: TQRLabel;
    c812: TQRLabel;
    c912: TQRLabel;
    p113: TQRLabel;
    c113: TQRLabel;
    p213: TQRLabel;
    c213: TQRLabel;
    c313: TQRLabel;
    p413: TQRLabel;
    c413: TQRLabel;
    p513: TQRLabel;
    c513: TQRLabel;
    p613: TQRLabel;
    c613: TQRLabel;
    p713: TQRLabel;
    c713: TQRLabel;
    p813: TQRLabel;
    c813: TQRLabel;
    c913: TQRLabel;
    p114: TQRLabel;
    c114: TQRLabel;
    p214: TQRLabel;
    c214: TQRLabel;
    p313: TQRLabel;
    p314: TQRLabel;
    c314: TQRLabel;
    p414: TQRLabel;
    c414: TQRLabel;
    p514: TQRLabel;
    c514: TQRLabel;
    p614: TQRLabel;
    c614: TQRLabel;
    p714: TQRLabel;
    c714: TQRLabel;
    p814: TQRLabel;
    c814: TQRLabel;
    c914: TQRLabel;
    p115: TQRLabel;
    c115: TQRLabel;
    p215: TQRLabel;
    c215: TQRLabel;
    p315: TQRLabel;
    c315: TQRLabel;
    p415: TQRLabel;
    c415: TQRLabel;
    p515: TQRLabel;
    c515: TQRLabel;
    p615: TQRLabel;
    c615: TQRLabel;
    p715: TQRLabel;
    c715: TQRLabel;
    p815: TQRLabel;
    c815: TQRLabel;
    c915: TQRLabel;
    p116: TQRLabel;
    c116: TQRLabel;
    p216: TQRLabel;
    c216: TQRLabel;
    p316: TQRLabel;
    c316: TQRLabel;
    p416: TQRLabel;
    c416: TQRLabel;
    p516: TQRLabel;
    c516: TQRLabel;
    p616: TQRLabel;
    c616: TQRLabel;
    p716: TQRLabel;
    c716: TQRLabel;
    p816: TQRLabel;
    c816: TQRLabel;
    c916: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape59: TQRShape;
    QRShape61: TQRShape;
    QRLabel8: TQRLabel;
    p13: TQRLabel;
    c13: TQRLabel;
    p23: TQRLabel;
    c23: TQRLabel;
    p33: TQRLabel;
    c33: TQRLabel;
    p43: TQRLabel;
    c43: TQRLabel;
    p53: TQRLabel;
    c53: TQRLabel;
    p63: TQRLabel;
    c63: TQRLabel;
    p73: TQRLabel;
    c73: TQRLabel;
    p83: TQRLabel;
    c83: TQRLabel;
    c93: TQRLabel;
    p14: TQRLabel;
    c14: TQRLabel;
    p24: TQRLabel;
    c24: TQRLabel;
    p34: TQRLabel;
    c34: TQRLabel;
    p44: TQRLabel;
    c44: TQRLabel;
    p54: TQRLabel;
    c54: TQRLabel;
    p64: TQRLabel;
    c64: TQRLabel;
    p74: TQRLabel;
    c74: TQRLabel;
    p84: TQRLabel;
    c84: TQRLabel;
    c94: TQRLabel;
    p15: TQRLabel;
    c15: TQRLabel;
    p25: TQRLabel;
    c25: TQRLabel;
    p35: TQRLabel;
    c35: TQRLabel;
    p45: TQRLabel;
    c45: TQRLabel;
    p55: TQRLabel;
    c55: TQRLabel;
    p65: TQRLabel;
    c65: TQRLabel;
    p75: TQRLabel;
    c75: TQRLabel;
    p85: TQRLabel;
    c85: TQRLabel;
    c95: TQRLabel;
    p111: TQRLabel;
    c111: TQRLabel;
    p211: TQRLabel;
    c211: TQRLabel;
    p311: TQRLabel;
    c311: TQRLabel;
    p411: TQRLabel;
    c411: TQRLabel;
    p511: TQRLabel;
    c511: TQRLabel;
    p611: TQRLabel;
    c611: TQRLabel;
    p711: TQRLabel;
    c711: TQRLabel;
    p811: TQRLabel;
    c811: TQRLabel;
    c911: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
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
  pic7062cForm: Tpic7062cForm;

implementation
uses pic7061c, pic7063c;
{$R *.DFM}

procedure Tpic7062cForm.apprReportAfterPrint(Sender: TObject);
begin
  System.Close(F);
end;

procedure Tpic7062cForm.apprReportPreview(Sender: TObject);
begin
  pic7063cform.QRpreview1.QRPrinter := TQRPrinter(sender);
  pic7063cForm.show;
end;

procedure Tpic7062cForm.apprReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(F,HomeDir+'\list\pic7060c.tmp');
  System.Reset(F);
  PageCnt  := 1;
end;

procedure Tpic7062cForm.apprReportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
   prnLabel : TQRLabel;
   i,j      : integer;
begin
  if not Eof(F) then
  begin
    Read(F,iData);
    for i := 1 to 16 do
      for j := 1 to 8 do begin
         prnLabel := FindComponent('p'+inttostr(j)+inttostr(i)) as TQRLabel;
         prnLabel.Caption := FormatFloat('##,###',iData.PropCnt[i,j]);
      end;

    for i := 1 to 16 do
      for j := 1 to 9 do begin
         prnLabel := FindComponent('c'+inttostr(j)+inttostr(i)) as TQRLabel;
         prnLabel.Caption := FormatFloat('##,###',iData.ChanCnt[i,j]);
      end;


    dBand.Enabled  := True;
    MoreData := True;

    if (iData.gubun = 'P') or
        (iData.gubun = 'S') then begin
        inc(Pagecnt);
        dBand.enabled := False;
        apprReport.NewPage;
        system.Exit;
    end;
  end
  else MoreData := False;
end;

procedure Tpic7062cForm.hBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   mdate.caption := pic7061cForm.L_CurDate.Caption;
end;












































































































































































































































































































end.
