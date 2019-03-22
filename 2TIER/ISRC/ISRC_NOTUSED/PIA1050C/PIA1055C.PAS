unit Pia1055c;

interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;


{$I pia1050c.inc}

type  Tpia1055cForm = class(TForm)
    insa4Report: TQuickRep;
    QRBand1: TQRBand;    QRLabel168: TQRLabel;    edutype1: TQRLabel;    edutype2: TQRLabel;    edutype3: TQRLabel;    edutype4: TQRLabel;    edutype5: TQRLabel;    edutype6: TQRLabel;    edutype7: TQRLabel;    edutype8: TQRLabel;    edutype9: TQRLabel;    edutype10: TQRLabel;    edutype11: TQRLabel;    edutype12: TQRLabel;    edutype13: TQRLabel;    edutype14: TQRLabel;    edutype15: TQRLabel;    edutype16: TQRLabel;    edutype17: TQRLabel;    edutype18: TQRLabel;    edutype19: TQRLabel;    edutype20: TQRLabel;    edutype21: TQRLabel;    edutype22: TQRLabel;    edutype23: TQRLabel;    edutype24: TQRLabel;    edutype25: TQRLabel;    edudate1: TQRLabel;    edudate2: TQRLabel;    edudate3: TQRLabel;    edudate4: TQRLabel;    edudate5: TQRLabel;    edudate6: TQRLabel;    edudate7: TQRLabel;    edudate8: TQRLabel;    edudate9: TQRLabel;    edudate10: TQRLabel;    edudate11: TQRLabel;    edudate12: TQRLabel;    edudate13: TQRLabel;    edudate14: TQRLabel;    edudate15: TQRLabel;    edudate16: TQRLabel;    edudate17: TQRLabel;    edudate18: TQRLabel;    edudate19: TQRLabel;    edudate20: TQRLabel;    edudate21: TQRLabel;    edudate22: TQRLabel;    edudate23: TQRLabel;    edudate24: TQRLabel;    edudate25: TQRLabel;    educourse1: TQRLabel;    educourse2: TQRLabel;    educourse3: TQRLabel;    educourse4: TQRLabel;    educourse5: TQRLabel;    educourse6: TQRLabel;    educourse7: TQRLabel;    educourse8: TQRLabel;    educourse9: TQRLabel;    educourse10: TQRLabel;    educourse11: TQRLabel;    educourse12: TQRLabel;    educourse13: TQRLabel;    educourse14: TQRLabel;    educourse15: TQRLabel;    educourse16: TQRLabel;    educourse17: TQRLabel;    educourse18: TQRLabel;    educourse19: TQRLabel;    educourse20: TQRLabel;    educourse21: TQRLabel;    educourse22: TQRLabel;    educourse23: TQRLabel;    educourse24: TQRLabel;    educourse25: TQRLabel;    edugubun1: TQRLabel;    edugubun2: TQRLabel;    edugubun3: TQRLabel;    edugubun4: TQRLabel;    edugubun5: TQRLabel;    edugubun6: TQRLabel;    edugubun7: TQRLabel;    edugubun8: TQRLabel;    edugubun9: TQRLabel;    edugubun10: TQRLabel;    edugubun11: TQRLabel;    edugubun12: TQRLabel;    edugubun13: TQRLabel;    edugubun14: TQRLabel;    edugubun15: TQRLabel;    edugubun16: TQRLabel;    edugubun17: TQRLabel;    edugubun18: TQRLabel;    edugubun19: TQRLabel;    edugubun20: TQRLabel;    edugubun21: TQRLabel;    edugubun22: TQRLabel;    edugubun23: TQRLabel;    edugubun24: TQRLabel;    edugubun25: TQRLabel;    QRLabel185: TQRLabel;    QRLabel186: TQRLabel;    QRLabel187: TQRLabel;    QRLabel188: TQRLabel;    QRLabel189: TQRLabel;    QRLabel190: TQRLabel;    QRLabel191: TQRLabel;    QRLabel192: TQRLabel;    QRLabel193: TQRLabel;    QRLabel194: TQRLabel;    QRLabel204: TQRLabel;    QRLabel205: TQRLabel;    QRLabel206: TQRLabel;    QRLabel207: TQRLabel;    QRLabel208: TQRLabel;    QRLabel209: TQRLabel;    QRLabel210: TQRLabel;    QRLabel211: TQRLabel;    QRLabel212: TQRLabel;    QRLabel213: TQRLabel;    QRLabel214: TQRLabel;    QRLabel215: TQRLabel;    QRLabel216: TQRLabel;    QRLabel217: TQRLabel;    QRLabel218: TQRLabel;    QRLabel219: TQRLabel;    QRLabel220: TQRLabel;    QRLabel221: TQRLabel;    QRLabel222: TQRLabel;    QRLabel223: TQRLabel;    QRLabel224: TQRLabel;    QRLabel225: TQRLabel;    QRLabel226: TQRLabel;    QRLabel227: TQRLabel;    QRLabel228: TQRLabel;    QRLabel229: TQRLabel;    QRLabel230: TQRLabel;    QRLabel231: TQRLabel;    QRLabel232: TQRLabel;    QRLabel233: TQRLabel;    langname1: TQRLabel;    langname2: TQRLabel;    langname3: TQRLabel;    langname4: TQRLabel;    langname5: TQRLabel;    langname6: TQRLabel;    langname7: TQRLabel;    langname8: TQRLabel;    langname9: TQRLabel;    langname10: TQRLabel;    examname1: TQRLabel;    examname2: TQRLabel;    examname3: TQRLabel;    examname4: TQRLabel;    examname5: TQRLabel;    examname6: TQRLabel;    examname7: TQRLabel;    examname8: TQRLabel;    examname9: TQRLabel;    examname10: TQRLabel;    examdate1: TQRLabel;    examdate2: TQRLabel;    examdate3: TQRLabel;    examdate4: TQRLabel;    examdate5: TQRLabel;    examdate6: TQRLabel;    examdate7: TQRLabel;    examdate8: TQRLabel;    examdate9: TQRLabel;    examdate10: TQRLabel;    score1: TQRLabel;    score2: TQRLabel;    score3: TQRLabel;    score4: TQRLabel;    score5: TQRLabel;    score6: TQRLabel;    score7: TQRLabel;    score8: TQRLabel;    score9: TQRLabel;    score10: TQRLabel;    examplace1: TQRLabel;    examplace2: TQRLabel;    examplace3: TQRLabel;    examplace4: TQRLabel;    examplace5: TQRLabel;    examplace6: TQRLabel;    examplace7: TQRLabel;    examplace8: TQRLabel;    examplace9: TQRLabel;    examplace10: TQRLabel;    QRLabel284: TQRLabel;    QRLabel285: TQRLabel;    QRLabel286: TQRLabel;    QRLabel287: TQRLabel;    QRLabel288: TQRLabel;    QRLabel289: TQRLabel;    QRLabel290: TQRLabel;    QRLabel291: TQRLabel;    rekindnm1: TQRLabel;    rekindnm2: TQRLabel;    rekindnm3: TQRLabel;    rekindnm4: TQRLabel;    rekindnm5: TQRLabel;    rekindnm6: TQRLabel;    rekindnm7: TQRLabel;    rekindnm8: TQRLabel;    rekindnm9: TQRLabel;    rekindnm10: TQRLabel;    rekindnm11: TQRLabel;    rekindnm12: TQRLabel;    rekindnm13: TQRLabel;    rekindnm14: TQRLabel;    rekindnm15: TQRLabel;    redate1: TQRLabel;    redate2: TQRLabel;    redate3: TQRLabel;    redate4: TQRLabel;    redate5: TQRLabel;    redate6: TQRLabel;    redate7: TQRLabel;    redate8: TQRLabel;    redate9: TQRLabel;    redate10: TQRLabel;    redate11: TQRLabel;    redate12: TQRLabel;    redate13: TQRLabel;    redate14: TQRLabel;    redate15: TQRLabel;    recause1: TQRLabel;    recause2: TQRLabel;    recause3: TQRLabel;    recause4: TQRLabel;    recause5: TQRLabel;    recause6: TQRLabel;    recause7: TQRLabel;    recause8: TQRLabel;    recause9: TQRLabel;    recause10: TQRLabel;    recause11: TQRLabel;    recause12: TQRLabel;    recause13: TQRLabel;    recause14: TQRLabel;    recause15: TQRLabel;    reorgnm1: TQRLabel;    reorgnm2: TQRLabel;    reorgnm3: TQRLabel;    reorgnm4: TQRLabel;    reorgnm5: TQRLabel;    reorgnm6: TQRLabel;    reorgnm7: TQRLabel;    reorgnm8: TQRLabel;    reorgnm9: TQRLabel;    reorgnm10: TQRLabel;    reorgnm11: TQRLabel;    reorgnm12: TQRLabel;    reorgnm13: TQRLabel;    reorgnm14: TQRLabel;    reorgnm15: TQRLabel;    pukindnm1: TQRLabel;    pukindnm2: TQRLabel;    pukindnm3: TQRLabel;    pukindnm4: TQRLabel;    pukindnm5: TQRLabel;    pukindnm6: TQRLabel;    pukindnm7: TQRLabel;    pukindnm8: TQRLabel;    pukindnm9: TQRLabel;    pukindnm10: TQRLabel;    pukindnm11: TQRLabel;    pukindnm12: TQRLabel;    pukindnm13: TQRLabel;    pukindnm14: TQRLabel;    pukindnm15: TQRLabel;    pudate1: TQRLabel;    pudate2: TQRLabel;    pudate3: TQRLabel;    pudate4: TQRLabel;    pudate5: TQRLabel;    pudate6: TQRLabel;    pudate7: TQRLabel;    pudate8: TQRLabel;    pudate9: TQRLabel;    pudate10: TQRLabel;    pudate11: TQRLabel;    pudate12: TQRLabel;    pudate13: TQRLabel;    pudate14: TQRLabel;    pudate15: TQRLabel;    pucause1: TQRLabel;    pucause2: TQRLabel;    pucause3: TQRLabel;    pucause4: TQRLabel;    pucause5: TQRLabel;    pucause6: TQRLabel;    pucause7: TQRLabel;    pucause8: TQRLabel;    pucause9: TQRLabel;    pucause10: TQRLabel;    pucause11: TQRLabel;    pucause12: TQRLabel;    pucause13: TQRLabel;    pucause14: TQRLabel;    pucause15: TQRLabel;    pucontent1: TQRLabel;    pucontent2: TQRLabel;    pucontent3: TQRLabel;    pucontent4: TQRLabel;    pucontent5: TQRLabel;    pucontent6: TQRLabel;    pucontent7: TQRLabel;    pucontent8: TQRLabel;    pucontent9: TQRLabel;    pucontent10: TQRLabel;    pucontent11: TQRLabel;    pucontent12: TQRLabel;    pucontent13: TQRLabel;    pucontent14: TQRLabel;    pucontent15: TQRLabel;    edutime1: TQRLabel;    edutime2: TQRLabel;    edutime3: TQRLabel;    edutime4: TQRLabel;    edutime5: TQRLabel;    edutime6: TQRLabel;    edutime7: TQRLabel;    edutime8: TQRLabel;    edutime9: TQRLabel;    edutime10: TQRLabel;    edutime11: TQRLabel;    edutime12: TQRLabel;    edutime13: TQRLabel;    edutime14: TQRLabel;    edutime15: TQRLabel;    edutime16: TQRLabel;    edutime17: TQRLabel;    edutime18: TQRLabel;    edutime19: TQRLabel;    edutime20: TQRLabel;    edutime21: TQRLabel;    edutime22: TQRLabel;    edutime23: TQRLabel;    edutime24: TQRLabel;    edutime25: TQRLabel;    eduscore1: TQRLabel;    eduscore2: TQRLabel;    eduscore3: TQRLabel;    eduscore4: TQRLabel;    eduscore5: TQRLabel;    eduscore6: TQRLabel;    eduscore7: TQRLabel;    eduscore8: TQRLabel;    eduscore9: TQRLabel;    eduscore10: TQRLabel;    eduscore11: TQRLabel;    eduscore12: TQRLabel;    eduscore13: TQRLabel;    eduscore14: TQRLabel;    eduscore15: TQRLabel;    eduscore16: TQRLabel;    eduscore17: TQRLabel;    eduscore18: TQRLabel;    eduscore19: TQRLabel;    eduscore20: TQRLabel;    eduscore21: TQRLabel;    eduscore22: TQRLabel;    eduscore23: TQRLabel;    eduscore24: TQRLabel;    eduscore25: TQRLabel;    edubigo1: TQRLabel;    edubigo2: TQRLabel;    edubigo3: TQRLabel;    edubigo4: TQRLabel;    edubigo5: TQRLabel;    edubigo6: TQRLabel;    edubigo7: TQRLabel;    edubigo8: TQRLabel;    edubigo9: TQRLabel;    edubigo10: TQRLabel;    edubigo11: TQRLabel;    edubigo12: TQRLabel;    edubigo13: TQRLabel;    edubigo14: TQRLabel;    edubigo15: TQRLabel;    edubigo16: TQRLabel;    edubigo17: TQRLabel;    edubigo18: TQRLabel;    edubigo19: TQRLabel;    edubigo20: TQRLabel;    edubigo21: TQRLabel;    edubigo22: TQRLabel;    edubigo23: TQRLabel;    edubigo24: TQRLabel;    edubigo25: TQRLabel;    QRShape1: TQRShape;    empno: TQRLabel;    korname: TQRLabel;    QRShape2: TQRShape;    QRShape3: TQRShape;    QRLabel7: TQRLabel;    QRShape4: TQRShape;    QRLabel8: TQRLabel;    QRLabel9: TQRLabel;    QRLabel10: TQRLabel;    QRLabel11: TQRLabel;    QRLabel12: TQRLabel;    QRLabel13: TQRLabel;    QRLabel14: TQRLabel;    QRShape5: TQRShape;    QRShape6: TQRShape;    QRShape7: TQRShape;    QRShape8: TQRShape;    QRShape9: TQRShape;    QRShape10: TQRShape;    QRShape11: TQRShape;    QRShape12: TQRShape;    QRShape13: TQRShape;    QRShape14: TQRShape;    QRLabel2: TQRLabel;    QRShape15: TQRShape;    QRLabel3: TQRLabel;    QRShape16: TQRShape;    QRLabel4: TQRLabel;    QRLabel15: TQRLabel;    QRShape17: TQRShape;    QRLabel16: TQRLabel;    QRLabel17: TQRLabel;    QRLabel18: TQRLabel;    QRLabel19: TQRLabel;    QRLabel20: TQRLabel;    QRLabel21: TQRLabel;    QRShape18: TQRShape;    QRShape19: TQRShape;    QRShape20: TQRShape;    QRShape21: TQRShape;    QRShape22: TQRShape;    QRShape23: TQRShape;    QRShape24: TQRShape;    QRShape25: TQRShape;    QRShape26: TQRShape;    QRShape27: TQRShape;    QRShape28: TQRShape;    QRShape29: TQRShape;    QRShape30: TQRShape;    QRShape31: TQRShape;    QRLabel1: TQRLabel;    QRShape32: TQRShape;    QRLabel22: TQRLabel;    QRShape33: TQRShape;    QRShape34: TQRShape;    QRShape35: TQRShape;    QRShape36: TQRShape;    QRShape37: TQRShape;    QRShape38: TQRShape;    QRShape39: TQRShape;    QRShape40: TQRShape;    QRShape41: TQRShape;    QRShape42: TQRShape;    QRShape43: TQRShape;    QRShape44: TQRShape;    QRShape45: TQRShape;    QRShape46: TQRShape;
    procedure insa4ReportAfterPrint(Sender: TObject);    procedure insa4ReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure insa4ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure insa4ReportPreview(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var  pia1055cForm: Tpia1055cForm;
  detail_cnt  : integer;
  F        : file of DataSource_insa4;
  P        : DataSource_insa4;

implementation
uses pia1051c, Pia1057c;
{$R *.DFM}

procedure Tpia1055cForm.insa4ReportAfterPrint(Sender: TObject);begin
     System.close(F);
end;

procedure Tpia1055cForm.insa4ReportNeedData(Sender: TObject;  var MoreData: Boolean);
var
     i : integer;
     PrnLabel : TQRLabel;
begin
     if not Eof(F) then
     begin
          Read(F,P);
          empno.Caption       := p.empno;
          korname.Caption     := p.korname;

          // 교육사항..
          for  i := 1 to 25 do
          begin
               prnLabel := FindComponent('edutype'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edutype[i];
               prnLabel := FindComponent('edudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edudate[i];
               prnLabel := FindComponent('edugubun'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edugubun[i];
               prnLabel := FindComponent('educourse'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.educourse[i];
               prnLabel := FindComponent('edutime'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edutime[i];
               prnLabel := FindComponent('eduscore'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.eduscore[i];
               prnLabel := FindComponent('edubigo'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edubigo[i];
          end;

          // 외국어사항
          for  i := 1 to 10 do
          begin
               prnLabel := FindComponent('langname'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.langname[i];
               prnLabel := FindComponent('examname'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examname[i];
               prnLabel := FindComponent('examdate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examdate[i];
               prnLabel := FindComponent('score'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.score[i];
               prnLabel := FindComponent('examplace'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examplace[i];
          end;

          // 포상사항
          for  i := 1 to 15 do
          begin
               prnLabel := FindComponent('rekindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.rekindnm[i];
               prnLabel := FindComponent('redate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.redate[i];
               prnLabel := FindComponent('recause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.recause[i];
               prnLabel := FindComponent('reorgnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.reorgnm[i];
               prnLabel := FindComponent('pukindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pukindnm[i];
               prnLabel := FindComponent('pudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pudate[i];
               prnLabel := FindComponent('pucause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pucause[i];
               prnLabel := FindComponent('pucontent'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pucontent[i];
          end;

          QRBand1.Enabled := True;
          MoreData := True;


          if p.gubun = 'P' then
          begin
               QRBand1.Enabled := False;
               if (EOF(F) = False) then insa4Report.NewPage;
               system.Exit;
          end;
       end else MoreData := False;
end;

procedure Tpia1055cForm.insa4ReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     detail_cnt := 1;
     AssignFile(F,HomeDir+'\list\pia1053c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1055cForm.insa4ReportPreview(Sender: TObject);
begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa4Report;
               //insaReport는 pia1057cForm에 선언된 Public 변수
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.

