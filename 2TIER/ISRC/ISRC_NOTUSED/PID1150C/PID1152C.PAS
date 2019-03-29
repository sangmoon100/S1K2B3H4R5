unit pid1152c;

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
    QRShape14: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel65: TQRLabel;
    QRShape36: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel124: TQRLabel;
    QRShape12: TQRShape;
    QRShape3: TQRShape;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
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
    QRShape65: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape26: TQRShape;
    QRShape11: TQRShape;
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
    QRLScore_tot: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel58: TQRLabel;
    QRLScore_tot1: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel9: TQRLabel;
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
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    Ability1_1: TQRLabel;
    Ability1_2: TQRLabel;
    Ability1_3: TQRLabel;
    Ability1_4: TQRLabel;
    Ability1_5: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape13: TQRShape;
    Ability2_1: TQRLabel;
    Ability2_2: TQRLabel;
    Ability2_3: TQRLabel;
    Ability2_4: TQRLabel;
    Ability2_5: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape15: TQRShape;
    Ability3_1: TQRLabel;
    Ability3_2: TQRLabel;
    Ability3_3: TQRLabel;
    Ability3_4: TQRLabel;
    Ability3_5: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape16: TQRShape;
    Ability4_1: TQRLabel;
    Ability4_2: TQRLabel;
    Ability4_3: TQRLabel;
    Ability4_4: TQRLabel;
    Ability4_5: TQRLabel;
    QRShape17: TQRShape;
    QRLAbility5: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRShape18: TQRShape;
    Ability5_1: TQRLabel;
    Ability5_2: TQRLabel;
    Ability5_3: TQRLabel;
    Ability5_4: TQRLabel;
    Ability5_5: TQRLabel;
    QRLAbility6: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRShape20: TQRShape;
    Ability6_1: TQRLabel;
    Ability6_2: TQRLabel;
    Ability6_3: TQRLabel;
    Ability6_4: TQRLabel;
    Ability6_5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel132: TQRLabel;
    QRShape19: TQRShape;
    Manner1_1: TQRLabel;
    Manner1_2: TQRLabel;
    Manner1_3: TQRLabel;
    Manner1_4: TQRLabel;
    Manner1_5: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRShape27: TQRShape;
    Manner2_1: TQRLabel;
    Manner2_2: TQRLabel;
    Manner2_3: TQRLabel;
    Manner2_4: TQRLabel;
    Manner2_5: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRShape28: TQRShape;
    Manner3_1: TQRLabel;
    Manner3_2: TQRLabel;
    Manner3_3: TQRLabel;
    Manner3_4: TQRLabel;
    Manner3_5: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel171: TQRLabel;
    QRShape29: TQRShape;
    Manner4_1: TQRLabel;
    Manner4_2: TQRLabel;
    Manner4_3: TQRLabel;
    Manner4_4: TQRLabel;
    Manner4_5: TQRLabel;
    QRLManner5: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRShape35: TQRShape;
    Manner5_1: TQRLabel;
    Manner5_2: TQRLabel;
    Manner5_3: TQRLabel;
    Manner5_4: TQRLabel;
    Manner5_5: TQRLabel;
    QRMark1: TQRMemo;
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
var i, j : integer;
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
//    paygr.caption          := pid1151c.idata.paygr;
    empdate.caption        := pid1151c.idata.empdate;
    indate1.caption        := copy(pid1151c.idata.indate,1,10);
    indate2.caption        := copy(pid1151c.idata.indate,11,10);
    e1payra.caption        := pid1151c.idata.e1payra;
    e1korname.caption      := pid1151c.idata.e1korname;
//    e2korname.caption:= pid1151c.idata.e2korname;  shm
//    eckorname.caption:= pid1151c.idata.eckorname;  shm
//    e2payra.caption  := pid1151c.idata.e2payra;    shm
    if   pid1151c.idata.ability1 = '0' then     QRLAbility1.caption    := ''
    else                                        QRLAbility1.caption    := pid1151c.idata.ability1;     //shm Ãß°¡
    if   pid1151c.idata.ability2 = '0' then     QRLAbility2.caption    := ''
    else                                        QRLAbility2.caption    := pid1151c.idata.ability2;
    if   pid1151c.idata.ability3 = '0' then     QRLAbility3.caption    := ''
    else                                        QRLAbility3.caption    := pid1151c.idata.ability3;
    if   pid1151c.idata.ability4 = '0' then     QRLAbility4.caption    := ''
    else                                        QRLAbility4.caption    := pid1151c.idata.ability4;
    if   pid1151c.idata.ability5 = '0' then     QRLAbility5.caption    := ''
    else                                        QRLAbility5.caption    := pid1151c.idata.ability5;
    if   pid1151c.idata.ability6 = '0' then     QRLAbility6.caption    := ''
    else                                        QRLAbility6.caption    := pid1151c.idata.ability6;
//    QRLAbility_tot.caption := pid1151c.idata.ability_tot;
    if   pid1151c.idata.Manner1  = '0' then     QRLManner1.caption     := ''
    else                                        QRLManner1.caption     := pid1151c.idata.Manner1;
    if   pid1151c.idata.Manner2  = '0' then     QRLManner2.caption     := ''
    else                                        QRLManner2.caption     := pid1151c.idata.Manner2;
    if   pid1151c.idata.Manner3  = '0' then     QRLManner3.caption     := ''
    else                                        QRLManner3.caption     := pid1151c.idata.Manner3;
    if   pid1151c.idata.Manner4  = '0' then     QRLManner4.caption     := ''
    else                                        QRLManner4.caption     := pid1151c.idata.Manner4;
    if   pid1151c.idata.Manner5  = '0' then     QRLManner5.caption     := ''
    else                                        QRLManner5.caption     := pid1151c.idata.Manner5;
//    QRLManner_tot.caption  := pid1151c.idata.Manner_tot;
    if   pid1151c.idata.Score_tot = '0' then
    begin
         QRLScore_tot.caption    := '' ;
         QRLScore_tot1.caption   := '' ;
    end
    else
    begin
         QRLScore_tot.caption    := pid1151c.idata.Score_tot;
         QRLScore_tot1.caption   := pid1151c.idata.Score_tot;
    end;

    QRMark1.Lines.Text    := pid1151c.idata.Mark1;

    for i := 0 to ComponentCount - 1 do
    begin
         if (TObject(components[i]) is TQRLabel) and
            ((copy(components[i].Name,1,7) ='Ability') or (copy(components[i].Name,1,6) ='Manner')) then
         begin
              for j := 1 to 5 do
              begin
                   if components[i].Name = 'Ability1_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Ability2_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Ability3_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Ability4_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Ability5_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Ability6_'+inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Manner1_' +inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Manner2_' +inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Manner3_' +inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Manner4_' +inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
                   if components[i].Name = 'Manner5_' +inttostr(j)  then TQRLabel(components[i]).Caption := '¡Û';
              end;
         end;
    end;

    if      pid1151c.idata.Ability1 = '10' then     Ability1_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability1 = '8'  then     Ability1_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability1 = '6'  then     Ability1_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability1 = '4'  then     Ability1_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability1 = '2'  then     Ability1_5.Caption := '¡Ü';

    if      pid1151c.idata.Ability2 = '10' then     Ability2_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability2 = '8'  then     Ability2_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability2 = '6'  then     Ability2_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability2 = '4'  then     Ability2_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability2 = '2'  then     Ability2_5.Caption := '¡Ü';

    if      pid1151c.idata.Ability3 = '10' then     Ability3_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability3 = '8'  then     Ability3_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability3 = '6'  then     Ability3_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability3 = '4'  then     Ability3_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability3 = '2'  then     Ability3_5.Caption := '¡Ü';

    if      pid1151c.idata.Ability4 = '10' then     Ability4_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability4 = '8'  then     Ability4_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability4 = '6'  then     Ability4_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability4 = '4'  then     Ability4_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability4 = '2'  then     Ability4_5.Caption := '¡Ü';

    if      pid1151c.idata.Ability5 = '10' then     Ability5_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability5 = '8'  then     Ability5_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability5 = '6'  then     Ability5_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability5 = '4'  then     Ability5_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability5 = '2'  then     Ability5_5.Caption := '¡Ü';

    if      pid1151c.idata.Ability6 = '10' then     Ability6_1.Caption := '¡Ü'
    else if pid1151c.idata.Ability6 = '8'  then     Ability6_2.Caption := '¡Ü'
    else if pid1151c.idata.Ability6 = '6'  then     Ability6_3.Caption := '¡Ü'
    else if pid1151c.idata.Ability6 = '4'  then     Ability6_4.Caption := '¡Ü'
    else if pid1151c.idata.Ability6 = '2'  then     Ability6_5.Caption := '¡Ü';

    if      pid1151c.idata.Manner1  = '10' then     Manner1_1.Caption  := '¡Ü'
    else if pid1151c.idata.Manner1  = '8'  then     Manner1_2.Caption  := '¡Ü'
    else if pid1151c.idata.Manner1  = '6'  then     Manner1_3.Caption  := '¡Ü'
    else if pid1151c.idata.Manner1  = '4'  then     Manner1_4.Caption  := '¡Ü'
    else if pid1151c.idata.Manner1  = '2'  then     Manner1_5.Caption  := '¡Ü';

    if      pid1151c.idata.Manner2  = '10' then     Manner2_1.Caption  := '¡Ü'
    else if pid1151c.idata.Manner2  = '8'  then     Manner2_2.Caption  := '¡Ü'
    else if pid1151c.idata.Manner2  = '6'  then     Manner2_3.Caption  := '¡Ü'
    else if pid1151c.idata.Manner2  = '4'  then     Manner2_4.Caption  := '¡Ü'
    else if pid1151c.idata.Manner2  = '2'  then     Manner2_5.Caption  := '¡Ü';

    if      pid1151c.idata.Manner3  = '5'  then     Manner3_1.Caption  := '¡Ü'
    else if pid1151c.idata.Manner3  = '4'  then     Manner3_2.Caption  := '¡Ü'
    else if pid1151c.idata.Manner3  = '3'  then     Manner3_3.Caption  := '¡Ü'
    else if pid1151c.idata.Manner3  = '2'  then     Manner3_4.Caption  := '¡Ü'
    else if pid1151c.idata.Manner3  = '1'  then     Manner3_5.Caption  := '¡Ü';

    if      pid1151c.idata.Manner4  = '10' then     Manner4_1.Caption  := '¡Ü'
    else if pid1151c.idata.Manner4  = '8'  then     Manner4_2.Caption  := '¡Ü'
    else if pid1151c.idata.Manner4  = '6'  then     Manner4_3.Caption  := '¡Ü'
    else if pid1151c.idata.Manner4  = '4'  then     Manner4_4.Caption  := '¡Ü'
    else if pid1151c.idata.Manner4  = '2'  then     Manner4_5.Caption  := '¡Ü';

    if      pid1151c.idata.Manner5  = '5'  then     Manner5_1.Caption  := '¡Ü'
    else if pid1151c.idata.Manner5  = '4'  then     Manner5_2.Caption  := '¡Ü'
    else if pid1151c.idata.Manner5  = '3'  then     Manner5_3.Caption  := '¡Ü'
    else if pid1151c.idata.Manner5  = '2'  then     Manner5_4.Caption  := '¡Ü'
    else if pid1151c.idata.Manner5  = '1'  then     Manner5_5.Caption  := '¡Ü';

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
