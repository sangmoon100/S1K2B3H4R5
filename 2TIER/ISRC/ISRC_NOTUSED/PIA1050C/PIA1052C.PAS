unit Pia1052c;
interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DB, DBTables, Qrctrls, QuickRpt, QRPrntr,
  jpeg, ImgList, MemDS, DBAccess, Ora;


{$I pia1050c.inc}
type  Tpia1052cForm = class(TForm)
    insa1Report: TQuickRep;    QRBand1: TQRBand;    QRShape65: TQRShape;    QRShape81: TQRShape;    QRShape82: TQRShape;    QRShape83: TQRShape;    QRShape84: TQRShape;    QRShape85: TQRShape;    QRShape86: TQRShape;    QRShape88: TQRShape;    empno: TQRLabel;    QRLabel42: TQRLabel;    QRLabel43: TQRLabel;    QRLabel54: TQRLabel;    QRLabel57: TQRLabel;    QRLabel58: TQRLabel;    QRLabel59: TQRLabel;    QRLabel60: TQRLabel;    QRLabel61: TQRLabel;    QRLabel62: TQRLabel;    QRLabel63: TQRLabel;    QRLabel64: TQRLabel;    paycl: TQRLabel;    QRLabel70: TQRLabel;    QRLabel71: TQRLabel;    QRLabel72: TQRLabel;    QRLabel73: TQRLabel;    QRLabel74: TQRLabel;    QRLabel75: TQRLabel;    deptname: TQRLabel;    empdate: TQRLabel;    retdate: TQRLabel;    jobline: TQRLabel;    empcode: TQRLabel;    empterm: TQRLabel;    cardate: TQRLabel;    retgubun: TQRLabel;    retsayu: TQRLabel;    QRLabel93: TQRLabel;    QRLabel94: TQRLabel;    QRLabel96: TQRLabel;    religion: TQRLabel;    habit: TQRLabel;    ability: TQRLabel;    QRLabel105: TQRLabel;    QRLabel106: TQRLabel;    QRLabel107: TQRLabel;    weight: TQRLabel;    height: TQRLabel;    QRLabel110: TQRLabel;    QRLabel111: TQRLabel;    juminid: TQRLabel;    holdname: TQRLabel;    holdrel: TQRLabel;    sex: TQRLabel;    QRLabel116: TQRLabel;    QRLabel117: TQRLabel;    QRLabel118: TQRLabel;    QRLabel119: TQRLabel;    QRLabel120: TQRLabel;    QRLabel121: TQRLabel;    schgr1: TQRLabel;    schgr2: TQRLabel;    schgr3: TQRLabel;    schgr4: TQRLabel;    schnm1: TQRLabel;    schnm2: TQRLabel;    schnm3: TQRLabel;    schnm4: TQRLabel;    schtoyn1: TQRLabel;    schtoyn2: TQRLabel;    schtoyn3: TQRLabel;    schtoyn4: TQRLabel;    majorcode1: TQRLabel;    majorcode2: TQRLabel;    majorcode3: TQRLabel;    majorcode4: TQRLabel;    empschgr: TQRLabel;    QRLabel159: TQRLabel;    QRLabel160: TQRLabel;    QRLabel161: TQRLabel;    QRLabel162: TQRLabel;    schgr5: TQRLabel;    schnm5: TQRLabel;    schtoyn5: TQRLabel;    majorcode5: TQRLabel;    schgr6: TQRLabel;    schnm6: TQRLabel;    schtoyn6: TQRLabel;    majorcode6: TQRLabel;    schgr7: TQRLabel;    schnm7: TQRLabel;    schtoyn7: TQRLabel;    majorcode7: TQRLabel;    QRLabel180: TQRLabel;    QRLabel181: TQRLabel;    QRLabel182: TQRLabel;    QRLabel184: TQRLabel;    stopic1: TQRLabel;    stopic2: TQRLabel;    QRLabel192: TQRLabel;    QRLabel193: TQRLabel;    QRLabel194: TQRLabel;    QRLabel195: TQRLabel;    lickind1: TQRLabel;    lickind2: TQRLabel;    licgr1: TQRLabel;    licgr2: TQRLabel;    lickind3: TQRLabel;    licgr3: TQRLabel;    lickind4: TQRLabel;    licgr4: TQRLabel;    lickind5: TQRLabel;    licgr5: TQRLabel;    lickind6: TQRLabel;    licgr6: TQRLabel;    QRLabel215: TQRLabel;    QRLabel216: TQRLabel;    licgetdate1: TQRLabel;    licgetdate2: TQRLabel;    licgetdate3: TQRLabel;    licgetdate4: TQRLabel;    licgetdate5: TQRLabel;    licgetdate6: TQRLabel;    licno1: TQRLabel;    licno2: TQRLabel;    licno3: TQRLabel;    licno4: TQRLabel;    licno5: TQRLabel;    licno6: TQRLabel;    eduorgnm1: TQRLabel;    eduorgnm2: TQRLabel;    eduorgnm3: TQRLabel;    eduorgnm4: TQRLabel;    edudate1: TQRLabel;    edudate2: TQRLabel;    edudate3: TQRLabel;    edudate4: TQRLabel;    educontent1: TQRLabel;    educontent2: TQRLabel;    educontent3: TQRLabel;    educontent4: TQRLabel;    QRLabel241: TQRLabel;    QRLabel242: TQRLabel;    QRLabel243: TQRLabel;    QRLabel244: TQRLabel;    QRLabel245: TQRLabel;    QRLabel251: TQRLabel;    QRLabel252: TQRLabel;    QRLabel253: TQRLabel;    QRLabel254: TQRLabel;    QRLabel255: TQRLabel;    QRShape118: TQRShape;    QRLabel256: TQRLabel;    QRLabel257: TQRLabel;    QRLabel258: TQRLabel;    QRLabel259: TQRLabel;    QRLabel260: TQRLabel;    QRLabel261: TQRLabel;    QRLabel262: TQRLabel;    QRLabel263: TQRLabel;    QRLabel264: TQRLabel;    QRLabel265: TQRLabel;    carplace1: TQRLabel;    carplace2: TQRLabel;    carplace4: TQRLabel;    carplace3: TQRLabel;    carplace6: TQRLabel;    carplace5: TQRLabel;    carplace7: TQRLabel;    carymd1: TQRLabel;    carymd2: TQRLabel;    carymd4: TQRLabel;    carymd3: TQRLabel;    carymd6: TQRLabel;    carymd5: TQRLabel;    carymd7: TQRLabel;    cardept1: TQRLabel;    cardept2: TQRLabel;    cardept4: TQRLabel;    cardept3: TQRLabel;    cardept6: TQRLabel;    cardept5: TQRLabel;    cardept7: TQRLabel;    carjobnm1: TQRLabel;    carjobnm2: TQRLabel;    carjobnm4: TQRLabel;    carjobnm3: TQRLabel;    carjobnm6: TQRLabel;    carjobnm5: TQRLabel;    carjobnm7: TQRLabel;    bcarym: TQRLabel;    carplace8: TQRLabel;    carymd8: TQRLabel;    cardept8: TQRLabel;    carjobnm8: TQRLabel;    carplace9: TQRLabel;    carymd9: TQRLabel;    cardept9: TQRLabel;    carjobnm9: TQRLabel;    carplace10: TQRLabel;    carymd10: TQRLabel;    cardept10: TQRLabel;    carjobnm10: TQRLabel;    carplace11: TQRLabel;    carymd11: TQRLabel;    cardept11: TQRLabel;    carjobnm11: TQRLabel;    carplace12: TQRLabel;    carymd12: TQRLabel;    cardept12: TQRLabel;    carjobnm12: TQRLabel;    QRLabel321: TQRLabel;    QRShape124: TQRShape;    QRShape125: TQRShape;    QRShape126: TQRShape;    QRShape127: TQRShape;    QRLabel322: TQRLabel;    QRLabel323: TQRLabel;    QRLabel324: TQRLabel;    QRLabel325: TQRLabel;    telno: TQRLabel;    bornarea: TQRLabel;    curaddr: TQRLabel;    regaddr: TQRLabel;    QRLabel330: TQRLabel;    QRLabel331: TQRLabel;    QRLabel332: TQRLabel;    QRLabel333: TQRLabel;    QRLabel334: TQRLabel;    QRLabel335: TQRLabel;    faplace1: TQRLabel;    faplace2: TQRLabel;    faplace3: TQRLabel;    faplace4: TQRLabel;    faplace5: TQRLabel;    faplace6: TQRLabel;    faplace7: TQRLabel;    faplace8: TQRLabel;    faplace9: TQRLabel;    faplace10: TQRLabel;    faplace11: TQRLabel;    faschgr1: TQRLabel;    faschgr2: TQRLabel;    faschgr3: TQRLabel;    faschgr4: TQRLabel;    faschgr5: TQRLabel;    faschgr6: TQRLabel;    faschgr7: TQRLabel;    faschgr8: TQRLabel;    faschgr9: TQRLabel;    faschgr10: TQRLabel;    faschgr11: TQRLabel;    fabirth1: TQRLabel;    fabirth2: TQRLabel;    fabirth3: TQRLabel;    fabirth4: TQRLabel;    fabirth5: TQRLabel;    fabirth6: TQRLabel;    fabirth7: TQRLabel;    fabirth8: TQRLabel;    fabirth9: TQRLabel;    fabirth10: TQRLabel;    fabirth11: TQRLabel;    faname1: TQRLabel;    faname2: TQRLabel;    faname3: TQRLabel;    faname4: TQRLabel;    faname5: TQRLabel;    faname6: TQRLabel;    faname7: TQRLabel;    faname8: TQRLabel;    faname9: TQRLabel;    faname10: TQRLabel;    faname11: TQRLabel;    facode1: TQRLabel;    facode2: TQRLabel;    facode3: TQRLabel;    facode4: TQRLabel;    facode5: TQRLabel;    facode6: TQRLabel;    facode7: TQRLabel;    facode8: TQRLabel;    facode9: TQRLabel;    facode10: TQRLabel;    facode11: TQRLabel;    QRLabel391: TQRLabel;    QRLabel392: TQRLabel;    QRLabel393: TQRLabel;    QRLabel394: TQRLabel;    rekindnm1: TQRLabel;    rekindnm2: TQRLabel;    rekindnm3: TQRLabel;    rekindnm4: TQRLabel;    reorgnm1: TQRLabel;    reorgnm2: TQRLabel;    reorgnm3: TQRLabel;    reorgnm4: TQRLabel;    recause1: TQRLabel;    recause2: TQRLabel;    recause3: TQRLabel;    recause4: TQRLabel;    pukindnm1: TQRLabel;    pukindnm2: TQRLabel;    pukindnm3: TQRLabel;    pukindnm4: TQRLabel;    puorgnm4: TQRLabel;    puorgnm3: TQRLabel;    puorgnm2: TQRLabel;    puorgnm1: TQRLabel;    pucause1: TQRLabel;    pucause2: TQRLabel;    pucause3: TQRLabel;    pucause4: TQRLabel;    armydate: TQRLabel;    armykind: TQRLabel;    armyfield: TQRLabel;    armycl: TQRLabel;    armydis: TQRLabel;    armyex: TQRLabel;    QRLabel426: TQRLabel;    QRLabel427: TQRLabel;    QRLabel428: TQRLabel;    QRLabel429: TQRLabel;    QRLabel430: TQRLabel;    QRLabel431: TQRLabel;    QRLabel432: TQRLabel;    QRLabel433: TQRLabel;    QRLabel434: TQRLabel;    QRLabel435: TQRLabel;    QRLabel436: TQRLabel;    QRLabel437: TQRLabel;    QRLabel438: TQRLabel;    QRLabel439: TQRLabel;    blood: TQRLabel;    QRLabel441: TQRLabel;    QRLabel442: TQRLabel;    QRLabel443: TQRLabel;    QRLabel444: TQRLabel;    QRLabel445: TQRLabel;    QRLabel446: TQRLabel;    redate1: TQRLabel;    redate2: TQRLabel;    redate3: TQRLabel;    redate4: TQRLabel;    QRLabel451: TQRLabel;    QRLabel452: TQRLabel;    pudate1: TQRLabel;    pudate2: TQRLabel;    pudate3: TQRLabel;    pudate4: TQRLabel;    QRShape1: TQRShape;    QRShape2: TQRShape;    QRShape3: TQRShape;    QRShape4: TQRShape;    QRShape5: TQRShape;    QRShape7: TQRShape;    QRShape8: TQRShape;    QRShape9: TQRShape;    QRShape10: TQRShape;    QRShape11: TQRShape;    QRShape12: TQRShape;    QRShape13: TQRShape;    QRShape14: TQRShape;    QRShape15: TQRShape;    QRShape16: TQRShape;    QRShape17: TQRShape;    QRShape18: TQRShape;    QRShape19: TQRShape;    QRShape20: TQRShape;    QRShape21: TQRShape;    QRShape22: TQRShape;    QRShape23: TQRShape;    QRShape24: TQRShape;    QRShape25: TQRShape;    QRShape26: TQRShape;    QRShape27: TQRShape;    QRShape28: TQRShape;    QRShape29: TQRShape;    QRShape30: TQRShape;    QRShape31: TQRShape;    QRShape32: TQRShape;    QRShape33: TQRShape;    QRShape34: TQRShape;    QRShape35: TQRShape;    QRShape36: TQRShape;    QRLabel1: TQRLabel;    QRShape37: TQRShape;    QRShape38: TQRShape;    QRShape39: TQRShape;    QRShape40: TQRShape;    QRShape41: TQRShape;    QRShape42: TQRShape;    QRShape43: TQRShape;    QRShape44: TQRShape;    QRShape45: TQRShape;    QRShape46: TQRShape;    QRShape47: TQRShape;    QRShape48: TQRShape;    QRShape49: TQRShape;    QRShape50: TQRShape;    QRShape51: TQRShape;    QRShape52: TQRShape;    QRShape53: TQRShape;    QRShape54: TQRShape;    QRShape55: TQRShape;    QRShape56: TQRShape;    QRShape57: TQRShape;    QRShape58: TQRShape;    QRShape59: TQRShape;    QRShape60: TQRShape;    QRShape61: TQRShape;    QRShape62: TQRShape;    QRShape63: TQRShape;    QRShape64: TQRShape;    QRShape66: TQRShape;    korname: TQRLabel;    schkind1: TQRLabel;    schkind2: TQRLabel;    schkind3: TQRLabel;    schkind4: TQRLabel;    schkind5: TQRLabel;    schkind6: TQRLabel;    schkind7: TQRLabel;    QRShape68: TQRShape;    PersonPic: TQRImage;    QRShape6: TQRShape;    Qphoto: TOraQuery;
    procedure insa1ReportAfterPrint(Sender: TObject);
    procedure insa1ReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure insa1ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
    procedure insa1ReportPreview(Sender: TObject);

  private
    { Private declarations }
    procedure empPicture(str : string);



  public
    { Public declarations }
  end;


var
  pia1052cForm: Tpia1052cForm;
  F        : file of DataSource_insa;
  P        : DataSource_insa;
  jpegimage : TJpegImage;


implementation

{$R *.DFM}
uses pia1051c, Pia1057c;

procedure Tpia1052cForm.insa1ReportNeedData(Sender: TObject;  var MoreData: Boolean);
{데이타를 라벨에 넘겨준다..}
var
     i : integer;
     PrnLabel : TQRLabel;
begin
     if not Eof(F) then
     begin
          Read(F,P);
          personPic.picture  := nil;
          empPicture(p.empno);

          empno.Caption      := p.empno;
          korname.Caption    := p.korname;
          deptname.Caption   := p.deptname;
          jobline.Caption    := p.jobline;
          empcode.caption    := p.empcode;
          paycl.caption      := p.paycl;

          if trim(p.empdate) <> '' then
          begin
               empdate.Caption    := copy(p.empdate,1,4)+'.'+
                                     copy(p.empdate,5,2)+'.'+
                                     copy(p.empdate,7,2);
          end
          else empdate.caption := '';

          if trim(p.cardate) <> '' then
          begin
               cardate.Caption    := copy(p.cardate,1,4)+'.'+
                                     copy(p.cardate,5,2)+'.'+
                                     copy(p.cardate,7,2);
          end
          else cardate.Caption := '';

          juminid.caption    := p.juminid;
          empterm.caption    := p.empterm;
          empschgr.caption   := p.empschgr;
          retgubun.caption   := p.retgubun;
          retsayu.caption    := p.retsayu;

          if trim(p.retdate) <> '' then
          begin
               retdate.caption    := copy(p.retdate,1,4)+'.'+
                                     copy(p.retdate,5,2)+'.'+
                                     copy(p.retdate,7,2);
          end
          else retdate.caption := '';

          holdname.caption   := p.holdname;
          holdrel.caption    := '('+p.holdrel+')';
          sex.caption        := '('+p.sex+')';
          religion.caption   := p.religion;
          habit.caption      := p.habit;
          ability.caption    := p.ability;
          height.caption     := p.height+ ' Cm';
          weight.caption     := p.weight+ ' Kg';
          blood.caption      := p.blood;
          armykind.caption   := p.armykind;
          armycl.caption     := p.armycl;
          armyfield.caption  := p.armyfield;
          armydis.caption    := p.armydis;
          armyex.caption     := p.armyex;
          armydate.caption   := p.armydate;
          curaddr.caption    := p.curaddr;
          regaddr.caption    := p.regaddr;
          telno.caption      := p.telno;
          bornarea.caption   := p.bornarea;
          bcarym.caption     := copy(p.bcarym,1,2)+' 년 '+copy(p.bcarym,3,2)+' 월';

         {학력사항..............................}
          for  i := 1 to 7 do
          begin
               prnLabel := FindComponent('schgr'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.schgr[i];
               prnLabel := FindComponent('schnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.schnm[i];
               prnLabel := FindComponent('schtoyn'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.schtoym[i];
               prnLabel := FindComponent('majorcode'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.majorcode[i];
               prnLabel := FindComponent('schkind'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.schkind[i];
          end;
          stopic1.caption    := p.stopic1;
          stopic2.caption    := p.stopic2;

         {입사전경력.............................................}
          for  i := 1 to 12 do
          begin
               prnLabel := FindComponent('carymd'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.carymd[i];
               prnLabel := FindComponent('carplace'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.carplace[i];
               prnLabel := FindComponent('cardept'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.cardept[i];
               prnLabel := FindComponent('carjobnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.carjobnm[i];
          end;

        {.............가족사항.........................................}
          for  i := 1 to 11 do
          begin
               prnLabel := FindComponent('facode'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.facode[i];
               prnLabel := FindComponent('faname'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.faname[i];
               prnLabel := FindComponent('fabirth'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.fabirth[i];
               prnLabel := FindComponent('faschgr'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.faschgr[i];
               prnLabel := FindComponent('faplace'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.faplace[i];
          end;

       {.............포상사항.........................................}
          for  i := 1 to 4 do
          begin
               prnLabel := FindComponent('rekindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.rekindnm[i];
               prnLabel := FindComponent('redate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.redate[i];
               prnLabel := FindComponent('recause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.recause[i];
               prnLabel := FindComponent('reorgnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.reorgnm[i];
          end;

       {.............징계사항.........................................}
          for  i := 1 to 4 do
          begin
               prnLabel := FindComponent('pukindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pukindnm[i];
               prnLabel := FindComponent('pudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pudate[i];
               prnLabel := FindComponent('pucause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pucause[i];
               prnLabel := FindComponent('puorgnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.puorgnm[i];
          end;

       {.............자격사항.........................................}
          for  i := 1 to 6 do
          begin
               prnLabel := FindComponent('lickind'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.lickind[i];
               prnLabel := FindComponent('licgr'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.licgr[i];
               prnLabel := FindComponent('licgetdate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.licgetdate[i];
               prnLabel := FindComponent('licno'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.licno[i];
          end;

       {.............비정규교육사항...................................}
          for  i := 1 to 4 do
          begin
               prnLabel := FindComponent('eduorgnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.eduorgnm[i];
               prnLabel := FindComponent('edudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edudate[i];
               prnLabel := FindComponent('educontent'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.educontent[i];
          end;

          QRBand1.Enabled := True;
          MoreData := True;

          if (p.gubun = 'P') and (EOF(F) = False) then
          begin
               QRBand1.Enabled := False;
               insa1Report.NewPage;
               system.Exit;
          end;
     end
     else MoreData := False;
end;



procedure Tpia1052cForm.insa1ReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     AssignFile(F,HomeDir+'\list\pia1050c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;



procedure Tpia1052cForm.insa1ReportAfterPrint(Sender: TObject);
begin
     System.close(F);
end;

// 사진
procedure Tpia1052cForm.empPicture(str : string);var
     stream    : TMemoryStream;
begin
     with Qphoto do
     begin
          close;
          ParamByName('lempno').AsString := str;
          Open;
          pia1051cForm.HelpHint('('+FieldByName('korname').AsString+') 사원의 사진 자료를 추출합니다 !!..');
          if trim(FieldByName('empno').AsString) <> '' then begin

            try
              stream    := TMemoryStream.Create;

              personPic.Picture.Graphic := nil;

              TblobField(FieldByName('photo')).SaveToStream(stream);
              stream.Position := 0;
              if stream.Size <> 0 then
                JPEGLoadFromDB(TblobField(FieldByName('photo')), PersonPic);
              Close;
            finally
//              stream.free;
            end;

          end;
          Close;
     end;
end;
procedure Tpia1052cForm.JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);var
     jpg: TJPEGImage;
     mem: TMemoryStream;
begin
     jpg := TJPEGImage.Create;
     mem := TMemoryStream.Create;
     try
       if BlobField.IsNull then
             Image.Picture := nil
       else
       begin
            BlobField.SaveToStream(mem);
            mem.Position := 0;
            jpg.LoadFromStream(mem);
            Image.Picture.Graphic := jpg;
       end;
     finally
          mem.Free;
          jpg.Free;
     end;
end;procedure Tpia1052cForm.insa1ReportPreview(Sender: TObject);begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa1Report;
               //insaReport는 pia1057cForm에 선언된 Public 변수
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;          //Show;
     end;
end;

end.
