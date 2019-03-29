unit pid1155c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,datelib, Qrctrls, QuickRpt, peprnview;

type
  Tpid1152cForm = class(TForm)
    ingoRpt: TQuickRep;
    dBand: TQRBand;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    deptname1: TQRLabel;
    deptname2: TQRLabel;
    deptname3: TQRLabel;
    empno: TQRLabel;
    korname: TQRLabel;
    paycl: TQRLabel;
    empdate: TQRLabel;
    indate1: TQRLabel;
    indate2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel21: TQRLabel;
    QRShape15: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel65: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRShape12: TQRShape;
    QRShape3: TQRShape;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    QRLabel134: TQRLabel;
    QRShape49: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    e1payra: TQRLabel;
    e1korname: TQRLabel;
    QRShape22: TQRShape;
    QRLabel4: TQRLabel;
    QRShape65: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    paygr: TQRLabel;
    QRShape26: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape11: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape33: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLAbility1: TQRLabel;
    QRLAbility2: TQRLabel;
    QRLAbility3: TQRLabel;
    QRLAbility4: TQRLabel;
    QRLManner1: TQRLabel;
    QRLManner2: TQRLabel;
    QRLManner3: TQRLabel;
    QRLManner4: TQRLabel;
    QRLAbility_tot: TQRLabel;
    QRLManner_tot: TQRLabel;
    QRLScore_tot: TQRLabel;
    QRLMark1: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel58: TQRLabel;
    QRLScore_tot1: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel52: TQRLabel;
    QRLMark2: TQRLabel;
    QRLMark3: TQRLabel;
    QRLMark4: TQRLabel;
    QRLMark5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape10: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    procedure ingoRptBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
    procedure ingoRptAfterPrint(Sender: TObject);
    procedure ingoRptNeedData(Sender: TObject; var MoreData: Boolean);
    procedure ingoRptPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PageCnt : integer;
  end;

var
  pid1152cForm: Tpid1152cForm;
  Fm_PreviewForm: TFm_PreviewForm;

implementation
uses pid1151c;
{$R *.DFM}

procedure Tpid1152cForm.ingoRptBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  PageCnt := 1;
  AssignFile(pid1151c.F,HomeDir+'\list\pid1150c.tmp');
  System.Reset(pid1151c.F);
end;

procedure Tpid1152cForm.ingoRptAfterPrint(Sender: TObject);
begin
  System.Close(pid1151c.F);
end;

procedure Tpid1152cForm.ingoRptNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if not Eof(F) then
  begin
    Read(pid1151c.F,pid1151c.iData);
    empno.caption          := pid1151c.idata.empno;
    deptname1.caption      := passtring(pid1151c.idata.deptname,' ',1);
    deptname2.caption      := passtring(pid1151c.idata.deptname,' ',2);
    deptname3.caption      := passtring(pid1151c.idata.deptname,' ',3);
    korname.caption        := pid1151c.idata.korname;
    paycl.caption          := pid1151c.idata.paycl;
    paygr.caption          := pid1151c.idata.paygr;
    empdate.caption        := pid1151c.idata.empdate;
    indate1.caption        := copy(pid1151c.idata.indate,1,10);
    indate2.caption        := copy(pid1151c.idata.indate,11,10);
    e1payra.caption        := pid1151c.idata.e1payra;
    e1korname.caption      := pid1151c.idata.e1korname;
//    e2korname.caption:= pid1151c.idata.e2korname;  shm
//    eckorname.caption:= pid1151c.idata.eckorname;  shm
//    e2payra.caption  := pid1151c.idata.e2payra;    shm
    QRLAbility1.caption    := pid1151c.idata.ability1;     //shm Ãß°¡ 
    QRLAbility2.caption    := pid1151c.idata.ability2;
    QRLAbility3.caption    := pid1151c.idata.ability3;
    QRLAbility4.caption    := pid1151c.idata.ability4;
    QRLAbility_tot.caption := pid1151c.idata.ability_tot;
    QRLManner1.caption     := pid1151c.idata.Manner1;
    QRLManner2.caption     := pid1151c.idata.Manner2;
    QRLManner3.caption     := pid1151c.idata.Manner3;
    QRLManner4.caption     := pid1151c.idata.Manner4;
    QRLManner_tot.caption  := pid1151c.idata.Manner_tot;
    QRLScore_tot.caption   := pid1151c.idata.Score_tot;
    QRLScore_tot1.caption  := pid1151c.idata.Score_tot;
    QRLMark1.caption       := copy(pid1151c.idata.Mark1,1,100);
    QRLMark2.caption       := copy(pid1151c.idata.Mark1,101,200);
    QRLMark3.caption       := copy(pid1151c.idata.Mark1,201,300);
    QRLMark4.caption       := copy(pid1151c.idata.Mark1,301,400);
    QRLMark5.caption       := copy(pid1151c.idata.Mark1,401,500);

    dBand.Enabled  := True;
    MoreData := True;
    if (pid1151c.iData.gubun = 'P') then begin
       inc(PageCnt);
       dBand.Enabled  := False;
       ingoRpt.NewPage;
       system.Exit;
    end;
  end else MoreData := False;
end;

procedure Tpid1152cForm.ingoRptPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,ingoRpt);
  Fm_PreviewForm.Show;
end;

end.
