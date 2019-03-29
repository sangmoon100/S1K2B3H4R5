unit Pia1062c;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, peprnview,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, MemDS,
  DBAccess, Ora;

{$I pia1061c.inc}

type
  TReport1 = class(TQuickRep)
    Qry_Sabu: TOraQuery;
    Qphoto: TOraQuery;
    QRtitle: TQRGroup;
    QRShape46: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape30: TQRShape;
    QRShape124: TQRShape;
    QRShape129: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape107: TQRShape;
    QRShape123: TQRShape;
    QRShape114: TQRShape;
    QRShape112: TQRShape;
    QRShape116: TQRShape;
    QRShape49: TQRShape;
    QRShape106: TQRShape;
    QRShape102: TQRShape;
    QRShape99: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    korname: TQRLabel;
    QRLabel3: TQRLabel;
    empno: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    deptname: TQRLabel;
    QRLabel7: TQRLabel;
    payranm: TQRLabel;
    paycldate: TQRLabel;
    paygr1: TQRLabel;
    jobplace: TQRLabel;
    QRShape19: TQRShape;
    QRLabel23: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    schgr1: TQRLabel;
    schgr2: TQRLabel;
    schgr3: TQRLabel;
    schgr4: TQRLabel;
    schnm1: TQRLabel;
    schnm2: TQRLabel;
    schnm3: TQRLabel;
    schnm4: TQRLabel;
    schfrtoym1: TQRLabel;
    schfrtoym2: TQRLabel;
    schfrtoym3: TQRLabel;
    schfrtoym4: TQRLabel;
    majorcode1: TQRLabel;
    majorcode2: TQRLabel;
    majorcode3: TQRLabel;
    majorcode4: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape48: TQRShape;
    QRLabel76: TQRLabel;
    pstate: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    jobline: TQRLabel;
    empcode: TQRLabel;
    empdate: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape98: TQRShape;
    QRLabel163: TQRLabel;
    marrigeyn: TQRLabel;
    QRShape51: TQRShape;
    QRLabel169: TQRLabel;
    juminid: TQRLabel;
    cardate: TQRLabel;
    Qremark: TQRLabel;
    orgempdate: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    korage: TQRLabel;
    QRLabel97: TQRLabel;
    Qrealtrdate: TQRLabel;
    Qofftrdate: TQRLabel;
    QRLabel98: TQRLabel;
    Qempterm: TQRLabel;
    QRLabel112: TQRLabel;
    Qlschgr: TQRLabel;
    QRLabel114: TQRLabel;
    Qheight: TQRLabel;
    QRLabel115: TQRLabel;
    Qweight: TQRLabel;
    QRLabel116: TQRLabel;
    Qblood: TQRLabel;
    QRLabel117: TQRLabel;
    Qreligion: TQRLabel;
    QRLabel118: TQRLabel;
    Qhabit: TQRLabel;
    QRLabel119: TQRLabel;
    Qability: TQRLabel;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRLabel53: TQRLabel;
    curaddr: TQRLabel;
    QRLabel54: TQRLabel;
    regaddr: TQRLabel;
    telno: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    bornarea: TQRLabel;
    QRShape110: TQRShape;
    QRLabel121: TQRLabel;
    armykind: TQRLabel;
    QRLabel122: TQRLabel;
    Qarmycl: TQRLabel;
    QRLabel123: TQRLabel;
    Qarmyfield: TQRLabel;
    QRLabel128: TQRLabel;
    Qarmydis: TQRLabel;
    QRLabel131: TQRLabel;
    Qarmyfrdate: TQRLabel;
    Qarmytodate: TQRLabel;
    QRLabel134: TQRLabel;
    QRShape125: TQRShape;
    QRLabel133: TQRLabel;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    Qeduorgnm1: TQRLabel;
    Qeduorgnm2: TQRLabel;
    Qeduorgnm3: TQRLabel;
    Qeduorgnm4: TQRLabel;
    Qedudate1: TQRLabel;
    Qedudate2: TQRLabel;
    Qedudate3: TQRLabel;
    Qedudate4: TQRLabel;
    Qeducontent1: TQRLabel;
    Qeducontent2: TQRLabel;
    Qeducontent3: TQRLabel;
    Qeducontent4: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    PersonPic: TQRImage;
    QRLabel77: TQRLabel;
    QRShape9: TQRShape;
    jikdeptname: TQRLabel;
    chnname: TQRLabel;
    birthday: TQRLabel;
    birthgubun: TQRLabel;
    weddingdate: TQRLabel;
    QRLabel17: TQRLabel;
    paygr2: TQRLabel;
    QRShape82: TQRShape;
    QRShape71: TQRShape;
    QRShape65: TQRShape;
    QRShape58: TQRShape;
    QRShape87: TQRShape;
    QRShape92: TQRShape;
    QRShape67: TQRShape;
    QRShape64: TQRShape;
    QRShape97: TQRShape;
    QRShape84: TQRShape;
    QRShape79: TQRShape;
    QRShape83: TQRShape;
    QRShape47: TQRShape;
    QRShape56: TQRShape;
    QRShape63: TQRShape;
    QRShape55: TQRShape;
    QRShape60: TQRShape;
    QRShape52: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape68: TQRShape;
    carplace1: TQRLabel;
    carplace2: TQRLabel;
    carplace3: TQRLabel;
    carymd1: TQRLabel;
    carymd2: TQRLabel;
    carymd3: TQRLabel;
    cardept1: TQRLabel;
    cardept2: TQRLabel;
    cardept3: TQRLabel;
    carjobnm1: TQRLabel;
    carjobnm2: TQRLabel;
    carjobnm3: TQRLabel;
    licgetdate1: TQRLabel;
    licgetdate2: TQRLabel;
    rekindnm1: TQRLabel;
    rekindnm2: TQRLabel;
    reorgnm1: TQRLabel;
    reorgnm2: TQRLabel;
    redate1: TQRLabel;
    redate2: TQRLabel;
    pukindnm1: TQRLabel;
    pukindnm2: TQRLabel;
    pucause1: TQRLabel;
    pucause2: TQRLabel;
    pudate1: TQRLabel;
    pudate2: TQRLabel;
    bcarym: TQRLabel;
    QRShape23: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape25: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape27: TQRShape;
    langname1: TQRLabel;
    langname2: TQRLabel;
    examscore1: TQRLabel;
    QRShape28: TQRShape;
    QRLabel99: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape29: TQRShape;
    QRLabel103: TQRLabel;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    facode1: TQRLabel;
    facode2: TQRLabel;
    facode3: TQRLabel;
    facode4: TQRLabel;
    facode5: TQRLabel;
    faname1: TQRLabel;
    faname2: TQRLabel;
    faname3: TQRLabel;
    faname4: TQRLabel;
    faname5: TQRLabel;
    fabirth1: TQRLabel;
    fabirth2: TQRLabel;
    fabirth3: TQRLabel;
    fabirth4: TQRLabel;
    fabirth5: TQRLabel;
    faschgr1: TQRLabel;
    faschgr2: TQRLabel;
    faschgr3: TQRLabel;
    faschgr4: TQRLabel;
    faschgr5: TQRLabel;
    faplace1: TQRLabel;
    faplace2: TQRLabel;
    faplace3: TQRLabel;
    faplace4: TQRLabel;
    faplace5: TQRLabel;
    examname1: TQRLabel;
    examdate1: TQRLabel;
    examdate2: TQRLabel;
    examname2: TQRLabel;
    examscore2: TQRLabel;
    licgr1: TQRLabel;
    licgr2: TQRLabel;
    licekind1: TQRLabel;
    licekind2: TQRLabel;
    QRShape57: TQRShape;
    QRLabel22: TQRLabel;
    Qcarym1: TQRLabel;
    Qcarym2: TQRLabel;
    Qcarym3: TQRLabel;
    QRLabel84: TQRLabel;
    Qlicalfield1: TQRLabel;
    Qlicalfield2: TQRLabel;
    QRShape59: TQRShape;
    QRLabel85: TQRLabel;
    QRShape66: TQRShape;
    Qscgubun: TQRLabel;
    QRLabel90: TQRLabel;
    Qscentdate: TQRLabel;
    QRShape69: TQRShape;
    QRLabel91: TQRLabel;
    Qscpredate: TQRLabel;
    QRShape70: TQRShape;
    QRLabel92: TQRLabel;
    Qscenddate: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape80: TQRShape;
    Qbohungubun: TQRLabel;
    QRLabel95: TQRLabel;
    Qbohunnm: TQRLabel;
    QRShape81: TQRShape;
    QRLabel101: TQRLabel;
    Qbohunrel: TQRLabel;
    QRLabel94: TQRLabel;
    QRShape100: TQRShape;
    Qobskind: TQRLabel;
    QRLabel105: TQRLabel;
    Qobsgr: TQRLabel;
    QRShape126: TQRShape;
    QRLabel107: TQRLabel;
    Qobsstate: TQRLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    prnDate: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel39: TQRLabel;
    QRShape38: TQRShape;
    QRShape50: TQRShape;
    QRShape75: TQRShape;
    QRShape85: TQRShape;
    ancode1: TQRLabel;
    andate1: TQRLabel;
    anpaycl1: TQRLabel;
    anpayra1: TQRLabel;
    andept1: TQRLabel;
    anpayra21: TQRLabel;
    QRShape86: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    AnLine1: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel83: TQRLabel;
    psdate: TQRLabel;
    caramt: TQRLabel;
    exduym: TQRLabel;
    QRLabel40: TQRLabel;
    insa_anno: TOraQuery;
    QRShape11: TQRShape;
    QRShape101: TQRShape;
    QRShape72: TQRShape;
    QRShape103: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1AfterPrint(Sender: TObject);
    procedure Report1Preview(Sender: TObject);
    procedure QRtitleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  private
    F  : file of DataSource_insa;
    P  : DataSource_insa;
    procedure empPicture(str : string);
    procedure JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);

  public
    Count    : Integer;
    SubCount : Integer;
    MaxValue : Integer;
    temp_empno : string;
    page_number : integer;
    procedure Check(Astr : String; ALab : TQrLabel);    
  end;

var
  Report1: TReport1;
  jpegimage : TJpegImage;

implementation

uses Pia1061c;

{$R *.DFM}
{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
                                            (급여사항추가등 ...)
 -------------------------------------------------------------------------------}

procedure TReport1.Check(Astr : String; ALab : TQrLabel);
  begin
    if AStr <> '-' then
      begin
        ALab.Caption := Astr;
        AnLine1.Enabled := false;
      end;
    if AStr = '-' then
      begin
        ALab.Caption    := '';
        AnLine1.Top     := ALab.Top + 5;
        AnLine1.Enabled := True;
      end;
  end;

procedure TReport1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(F,HomeDir+'\list\pia1060c.tmp');
  System.Reset(F);
  System.Seek(F,0);

  //2017.01.20.hjku.. 인사기록요약표 포맷 변경(사내경력 전체 나오도록).. 김진호M
  Count := 0;
  page_number := 0;
end;

procedure TReport1.QuickReport1AfterPrint(Sender: TObject);
begin
  System.close(F);

end;
procedure TReport1.empPicture(str : string);
var
  stream    : TMemoryStream;
begin
   Qphoto.close;
   Qphoto.ParamByName('lempno').AsString := str;
   Qphoto.Open;
   pia1061cForm.HelpHint('('+Qphoto.FieldByName('korname').AsString+') 사원의 사진 자료를 추출합니다 !!..');
//   QRLabel96.visible := True;
//   QRLabel97.visible := True;
//   QRLabel98.visible := True;
   if trim(Qphoto.FieldByName('empno').AsString) <> '' then begin
//      personPic.picture.Assign(Qphoto.FieldByName('photo'));
//      QRLabel96.visible := False;
//      QRLabel97.visible := False;
//      QRLabel98.visible := False;

     try
       stream    := TMemoryStream.Create;

       personPic.Picture.Graphic := nil;

       TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
       stream.Position :=  0;
       
       if stream.Size <> 0 then
//         personPic.loadfromstream(stream);
         JPEGLoadFromDB(TblobField(Qphoto.FieldByName('photo')), PersonPic);
       Qphoto.Close;
     finally
       stream.free;
     end;

   end;
   Qphoto.Close;
end;

procedure TReport1.JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
var
 jpg: TJPEGImage;
 mem: TMemoryStream;
begin
 jpg := TJPEGImage.Create;
 mem := TMemoryStream.Create;
 try
   if BlobField.IsNull then
     Image.Picture := nil
   else begin
     BlobField.SaveToStream(mem);
     mem.Position := 0;
     jpg.LoadFromStream(mem);
     Image.Picture.Graphic := jpg;
   end;
 finally
   mem.Free;
   jpg.Free;
 end;
end;



procedure TReport1.Report1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Report1);
  Fm_PreviewForm.Show;
end;

procedure TReport1.QRtitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   i : integer;
   compname : string;
  procedure Check(Astr : String; ALab : TQrLabel);
  begin
    if AStr <> '-' then
      begin
        ALab.Caption := Astr;
      end;
    if AStr = '-' then
      begin
        ALab.Caption    := '';
        AnLine1.Top     := ALab.Top + 5;
        AnLine1.Enabled := True;
      end;
  end;

begin
  // 1. 내용   : 출력양식변경에 의한 수정
  // 2. 수정자 : 김승회
  // 3. 수정일 : 1999.07.28
  if not Eof(F) then  begin
    Read(F,P);
    personPic.picture  := nil;
    empPicture(p.empno);

    AnLine1.Enabled    := False;

    empno.Caption      := p.empno;
    korname.Caption    := p.korname;
    chnname.Caption    := '( '+p.chnname+' )';
    deptname.Caption   := p.deptname;
    jikdeptname.Caption:= p.jikdeptname; //2001.12.19 shm 추가
    payranm.Caption    := p.payranm;
    paygr1.Caption     := p.paygr1;
    paycldate.Caption  := '['+Format('%4s',[copy(p.paycldate,1,4)])+'.'+
                              Format('%2s',[copy(p.paycldate,5,2)])+'.'+
                              Format('%2s',[copy(p.paycldate,7,2)])+']';
    // 3. 수정일 : 1999.07.28
    //orgempdate.Caption := Format('%2s',[copy(p.orgempdate,3,2)])+'.'+
    orgempdate.Caption := Format('%2s',[copy(p.orgempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.orgempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.orgempdate,7,2)]);
    // 3. 수정일 : 1999.07.28
    empdate.Caption    := '(최초 : '+Format('%2s',[copy(p.empdate,3,2)])+'.'+
                          Format('%2s',[copy(p.empdate,5,2)])+'.'+
                          Format('%2s',[copy(p.empdate,7,2)])+')';

    //dsa2000 2010.06. Add 그룹입사일 표기 가능토록.
    if pia1061cForm.Chk_Group.checked then
       empdate.Caption := '(그룹입사일: '+Format('%2s',[copy(p.Groupempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,7,2)])+')';

    // 수정일 : 2000.05.10 :김대훈
    Qrealtrdate.Caption := Copy(p.realtrdate,1,4) + '.'+
                           Copy(p.realtrdate,5,2) + '.'+
                           Copy(p.realtrdate,7,2);
    Qofftrdate.Caption  := '('+ Copy(p.offtrdate,1,4) + '.'+
                           Copy(p.offtrdate,5,2) + '.'+
                           Copy(p.offtrdate,7,2) + ')';

    //trlimfrto.caption  := p.trlimfrto;
//    paygr2.Caption     := Format('%8s',[p.paygr2]);
    paygr2.Caption     := p.paygr2;
    cardate.caption    := p.cardate;
    jobplace.caption   := p.jobplace;
    //licalkind.caption  := p.licalkind;
    empcode.caption    := p.empcode;
    jobline.caption    := p.jobline;
    //empjobplace.caption:= p.empjobplace;
//    empterm.caption    := p.empterm;
    juminid.caption    := p.juminid;
    korage.caption     := p.korage;
    marrigeyn.caption  := p.marrigeyn;
    //ability.caption    := copy(p.ability,1,10);
    armykind.caption   := p.armykind;
    //armyfrto.caption  := p.armyfrto;
    curaddr.caption    := p.curaddr;
    regaddr.caption    := p.regaddr;
    telno.caption      := p.telno;
    bornarea.caption   := p.bornarea;

    weddingdate.Caption :='';
    birthday.Caption    := p.birthday;
    if  p.birthday = '' then
        birthgubun.Caption  := ''
    else
        birthgubun.Caption  := p.birthgubun;

//급여사항
    //junpay_amt.caption := p.junpay_amt;
    //jungita_amt.caption   := p.jungita_amt;
    //danpay_amt.caption := p.danpay_amt;

    pstate.caption     := p.pstate;
    psdate.caption     := p.psdate;
    caramt.caption     := copy(p.caramt,1,2)+' 년 '+copy(p.caramt,3,2)+' 월';
    exduym.caption     := '                     ]';
    prnDate.Caption    := '( 작성일 : '+p.prnDate+' )';
    {학력사항..............................}
    schgr1.caption     := p.schgr[1];
    schgr2.caption     := p.schgr[2];
    schgr3.caption     := p.schgr[3];
    schgr4.caption     := p.schgr[4];
    schnm1.caption     := p.schnm[1];
    schnm2.caption     := p.schnm[2];
    schnm3.caption     := p.schnm[3];
    schnm4.caption     := p.schnm[4];
    schfrtoym1.caption := p.schfrtoym[1];
    schfrtoym2.caption := p.schfrtoym[2];
    schfrtoym3.caption := p.schfrtoym[3];
    schfrtoym4.caption := p.schfrtoym[4];
    majorcode1.caption := p.majorcode[1];
    majorcode2.caption := p.majorcode[2];
    majorcode3.caption := p.majorcode[3];
    majorcode4.caption := p.majorcode[4];
//    empschgr.caption   := p.empschgr;
    {가족사항..............................}
    facode1.Caption    := p.facode[1];
    facode2.Caption    := p.facode[2];
    facode3.Caption    := p.facode[3];
    facode4.Caption    := p.facode[4];
    facode5.Caption    := p.facode[5];
    //facode6.Caption    := p.facode[6];
    faname1.Caption    := p.faname[1];
    faname2.Caption    := p.faname[2];
    faname3.Caption    := p.faname[3];
    faname4.Caption    := p.faname[4];
    faname5.Caption    := p.faname[5];
    //faname6.Caption    := p.faname[6];
    fabirth1.caption   := p.fabirth[1];
    fabirth2.caption   := p.fabirth[2];
    fabirth3.caption   := p.fabirth[3];
    fabirth4.caption   := p.fabirth[4];
    fabirth5.caption   := p.fabirth[5];
    //fabirth6.caption   := p.fabirth[6];
    faschgr1.caption   := p.faschgr[1];
    faschgr2.caption   := p.faschgr[2];
    faschgr3.caption   := p.faschgr[3];
    faschgr4.caption   := p.faschgr[4];
    faschgr5.caption   := p.faschgr[5];
    //faschgr6.caption   := p.faschgr[6];
    faplace1.caption   := p.faplace[1];
    faplace2.caption   := p.faplace[2];
    faplace3.caption   := p.faplace[3];
    faplace4.caption   := p.faplace[4];
    faplace5.caption   := p.faplace[5];
    //faplace6.caption   := p.faplace[6];

    {입사전경력..............................}
    {
    carplace1.Caption  := p.carplace[1];
    carplace2.Caption  := p.carplace[2];
    carplace3.Caption  := p.carplace[3];
    carplace4.Caption  := p.carplace[4];
    carymd1.caption    := p.carymd[1];
    carymd2.caption    := p.carymd[2];
    carymd3.caption    := p.carymd[3];
    carymd4.caption    := p.carymd[4];

    cardept1.caption   := p.cardept[1];
    cardept2.caption   := p.cardept[2];
    cardept3.caption   := p.cardept[3];
    cardept4.caption   := p.cardept[4];
    carjobnm1.caption  := p.carjobnm[1];
    carjobnm2.caption  := p.carjobnm[2];
    carjobnm3.caption  := p.carjobnm[3];
    carjobnm4.caption  := p.carjobnm[4];

    bcarym.caption     := p.bcaryy+' 년 '+p.bcarmm+' 월';
    }
    {자격증사항을 출력한다.......................}
    {
    licekind1.caption   := p.licekind[1];
    licekind2.caption   := p.licekind[2];
    licgr1.caption      := p.licgr[1];
    licgr2.caption      := p.licgr[2];
    licgetdate1.caption := p.licgetdate[1];
    licgetdate2.caption := p.licgetdate[2];
    }

    {
    langname1.caption   := p.langname[1];
    examname1.caption   := p.examname[1];
    examscore1.caption  := p.examscore[1];
    examname1.caption   := p.examname[1];
    langname2.caption   := p.langname[2];
    examname2.caption   := p.examname[2];
    examscore2.caption  := p.examscore[2];
    examname2.caption   := p.examname[2];
    }

    {고과사항을 출력한다.......................}
    // 1. 내용   : 출력양식변경에 의한 수정
    // 2. 수정자 : 김승회
    // 3. 수정일 : 1999.07.28
    {
    intodate1.caption  := p.intodate[1];
    intodate2.caption  := p.intodate[2];
    intodate3.caption  := p.intodate[3];
    intodate4.caption  := p.intodate[4];
    intodate5.caption  := p.intodate[5];
    intodate6.caption  := p.intodate[6];

    ipaycl1.Caption    := p.ipaycl[1];
    ipaycl2.Caption    := p.ipaycl[2];
    ipaycl3.Caption    := p.ipaycl[3];
    ipaycl4.Caption    := p.ipaycl[4];
    ipaycl5.Caption    := p.ipaycl[5];
    ipaycl6.Caption    := p.ipaycl[6];

    e1scr1.caption     := p.ie1scr[1];
    e1scr2.caption     := p.ie1scr[2];
    e1scr3.caption     := p.ie1scr[3];
    e1scr4.caption     := p.ie1scr[4];
    e1scr5.caption     := p.ie1scr[5];
    e1scr6.caption     := p.ie1scr[6];

    e2scr1.caption     := p.ie2scr[1];
    e2scr2.caption     := p.ie2scr[2];
    e2scr3.caption     := p.ie2scr[3];
    e2scr4.caption     := p.ie2scr[4];
    e2scr5.caption     := p.ie2scr[5];
    e2scr6.caption     := p.ie2scr[6];

    adjclass1.caption  := p.adjclass[1];
    adjclass2.caption  := p.adjclass[2];
    adjclass3.caption  := p.adjclass[3];
    adjclass4.caption  := p.adjclass[4];
    adjclass5.caption  := p.adjclass[5];
    adjclass6.caption  := p.adjclass[6];
    }

(*hjku..화면상 출력되지 않아 삭제
    {교육사항을 출력한다 ..........................}
    edufrtodate1.caption := p.edufrtodate[1];
    educourse1.caption   := p.educourse[1];
    edutype1.caption     := p.edutype[1];
    edugubun1.caption    := p.edugubun[1];
    edutime1.caption     := p.edutime[1];
    eduscore1.caption    := p.eduscore[1];

    edufrtodate2.caption := p.edufrtodate[2];
    educourse2.caption   := p.educourse[2];
    edutype2.caption     := p.edutype[2];
    edugubun2.caption    := p.edugubun[2];
    edutime2.caption     := p.edutime[2];
    eduscore2.caption    := p.eduscore[2];

    edufrtodate3.caption := p.edufrtodate[3];
    educourse3.caption   := p.educourse[3];
    edutype3.caption     := p.edutype[3];
    edugubun3.caption    := p.edugubun[3];
    edutime3.caption     := p.edutime[3];
    eduscore3.caption    := p.eduscore[3];
*)
//30.05 2001.07.11 shm
{    edufrtodate4.caption := p.edufrtodate[4];
    educourse4.caption   := p.educourse[4];
    edutype4.caption   := p.edutype[4];
    edugubun4.caption   := p.edugubun[4];
    edutime4.caption   := p.edutime[4];
    eduscore4.caption   := p.eduscore[4];

    edufrtodate5.caption := p.edufrtodate[5];
    educourse5.caption   := p.educourse[5];
    edutype5.caption     := p.edutype[5];
    edugubun5.caption    := p.edugubun[5];
    edutime5.caption     := p.edutime[5];
    eduscore5.caption    := p.eduscore[5];}


    {상향평가사항을 출력한다.......................}
    // 1. 내용   : 출력양식변경에 의한 수정
    // 2. 수정자 : 김승회
    // 3. 수정일 : 1999.07.28
    {
    aptodate1.caption  := p.aptodate[1];
    apaycl1.caption    := p.apaycl[1];
    aclass1.caption    := p.aclass[1];
    ascore1.caption    := p.ascore[1];

    aptodate2.caption  := p.aptodate[2];
    apaycl2.caption    := p.apaycl[2];
    aclass2.caption    := p.aclass[2];
    ascore2.caption    := p.ascore[2];

    aptodate3.caption  := p.aptodate[3];
    apaycl3.caption    := p.apaycl[3];
    aclass3.caption    := p.aclass[3];
    ascore3.caption    := p.ascore[3];
    }

    {포상사항을 출력한다.......................}
    rekindnm1.caption  := p.rekindnm[1];
    rekindnm2.caption  := p.rekindnm[2];
    reorgnm1.caption   := p.reorgnm[1];
    reorgnm2.caption   := p.reorgnm[2];
    redate1.caption    := p.redate[1];
    redate2.caption    := p.redate[2];
    {징계사항을 출력한다.......................}
    pukindnm1.caption  := p.pukindnm[1];
    pukindnm2.caption  := p.pukindnm[2];
    pucause1.caption   := p.pucause[1];
    pucause2.caption   := p.pucause[2];
    pudate1.caption    := p.pudate[1];
    pudate2.caption    := p.pudate[2];
(*hjku..looping 처리로 삭제.
    {발령사항을 출력한다.......................}
    Check(p.ancode[1],ancode1);
    Check(p.ancode[2],ancode2);
    Check(p.ancode[3],ancode3);
    Check(p.ancode[4],ancode4);
    Check(p.ancode[5],ancode5);
    Check(p.ancode[6],ancode6);
    Check(p.ancode[7],ancode7);
    Check(p.ancode[8],ancode8);
    Check(p.ancode[9],ancode9);
    Check(p.ancode[10],ancode10);
    Check(p.ancode[11],ancode11);
    Check(p.ancode[12],ancode12);
    Check(p.ancode[13],ancode13);
    Check(p.ancode[14],ancode14);
    Check(p.ancode[15],ancode15);
    Check(p.ancode[16],ancode16);
    Check(p.ancode[17],ancode17);
    Check(p.ancode[18],ancode18);
    Check(p.ancode[19],ancode19);
    Check(p.ancode[20],ancode20);

    {ancode1.caption    := p.ancode[1];
    ancode2.caption    := p.ancode[2];
    ancode3.caption    := p.ancode[3];
    ancode4.caption    := p.ancode[4];
    ancode5.caption    := p.ancode[5];
    ancode6.caption    := p.ancode[6];
    ancode7.caption    := p.ancode[7];
    ancode8.caption    := p.ancode[8];
    ancode9.caption    := p.ancode[9];
    ancode10.caption   := p.ancode[10];
    ancode11.caption   := p.ancode[11];
    ancode12.caption   := p.ancode[12];
    ancode13.caption   := p.ancode[13];
    ancode14.caption   := p.ancode[14];
    ancode15.caption   := p.ancode[15];
    ancode16.caption   := p.ancode[16];
    ancode17.caption   := p.ancode[17];
    ancode18.caption   := p.ancode[18];
    ancode19.caption   := p.ancode[19];
    ancode20.caption   := p.ancode[20];}

    andate1.caption    := p.andate[1];
    andate2.caption    := p.andate[2];
    andate3.caption    := p.andate[3];
    andate4.caption    := p.andate[4];
    andate5.caption    := p.andate[5];
    andate6.caption    := p.andate[6];
    andate7.caption    := p.andate[7];
    andate8.caption    := p.andate[8];
    andate9.caption    := p.andate[9];
    andate10.caption   := p.andate[10];
    andate11.caption   := p.andate[11];
    andate12.caption   := p.andate[12];
    andate13.caption   := p.andate[13];
    andate14.caption   := p.andate[14];
    andate15.caption   := p.andate[15];
    andate16.caption   := p.andate[16];
    andate17.caption   := p.andate[17];
    andate18.caption   := p.andate[18];
    andate19.caption   := p.andate[19];
    andate20.caption   := p.andate[20];

    anpaycl1.caption   := p.anpaycl[1];
    anpaycl2.caption   := p.anpaycl[2];
    anpaycl3.caption   := p.anpaycl[3];
    anpaycl4.caption   := p.anpaycl[4];
    anpaycl5.caption   := p.anpaycl[5];
    anpaycl6.caption   := p.anpaycl[6];
    anpaycl7.caption   := p.anpaycl[7];
    anpaycl8.caption   := p.anpaycl[8];
    anpaycl9.caption   := p.anpaycl[9];
    anpaycl10.caption  := p.anpaycl[10];
    anpaycl11.caption  := p.anpaycl[11];
    anpaycl12.caption  := p.anpaycl[12];
    anpaycl13.caption  := p.anpaycl[13];
    anpaycl14.caption  := p.anpaycl[14];
    anpaycl15.caption  := p.anpaycl[15];
    anpaycl16.caption  := p.anpaycl[16];
    anpaycl17.caption  := p.anpaycl[17];
    anpaycl18.caption  := p.anpaycl[18];
    anpaycl19.caption  := p.anpaycl[19];
    anpaycl20.caption  := p.anpaycl[20];

    anpayra1.caption   := p.anpayra[1];
    anpayra2.caption   := p.anpayra[2];
    anpayra3.caption   := p.anpayra[3];
    anpayra4.caption   := p.anpayra[4];
    anpayra5.caption   := p.anpayra[5];
    anpayra6.caption   := p.anpayra[6];
    anpayra7.caption   := p.anpayra[7];
    anpayra8.caption   := p.anpayra[8];
    anpayra9.caption   := p.anpayra[9];
    anpayra10.caption  := p.anpayra[10];
    anpayra11.caption  := p.anpayra[11];
    anpayra12.caption  := p.anpayra[12];
    anpayra13.caption  := p.anpayra[13];
    anpayra14.caption  := p.anpayra[14];
    anpayra15.caption  := p.anpayra[15];
    anpayra16.caption  := p.anpayra[16];
    anpayra17.caption  := p.anpayra[17];
    anpayra18.caption  := p.anpayra[18];
    anpayra19.caption  := p.anpayra[19];
    anpayra20.caption  := p.anpayra[20];

    anpayra21.caption  := p.anpayra2[1];
    anpayra22.caption  := p.anpayra2[2];
    anpayra23.caption  := p.anpayra2[3];
    anpayra24.caption  := p.anpayra2[4];
    anpayra25.caption  := p.anpayra2[5];
    anpayra26.caption  := p.anpayra2[6];
    anpayra27.caption  := p.anpayra2[7];
    anpayra28.caption  := p.anpayra2[8];
    anpayra29.caption  := p.anpayra2[9];
    anpayra210.caption := p.anpayra2[10];
    anpayra211.caption := p.anpayra2[11];
    anpayra212.caption := p.anpayra2[12];
    anpayra213.caption := p.anpayra2[13];
    anpayra214.caption := p.anpayra2[14];
    anpayra215.caption := p.anpayra2[15];
    anpayra216.caption := p.anpayra2[16];
    anpayra217.caption := p.anpayra2[17];
    anpayra218.caption := p.anpayra2[18];
    anpayra219.caption := p.anpayra2[19];
    anpayra220.caption := p.anpayra2[20];

    andept1.caption   := p.andept[1];
    andept2.caption   := p.andept[2];
    andept3.caption   := p.andept[3];
    andept4.caption   := p.andept[4];
    andept5.caption   := p.andept[5];
    andept6.caption   := p.andept[6];
    andept7.caption   := p.andept[7];
    andept8.caption   := p.andept[8];
    andept9.caption   := p.andept[9];
    andept10.caption  := p.andept[10];
    andept11.caption  := p.andept[11];
    andept12.caption  := p.andept[12];
    andept13.caption  := p.andept[13];
    andept14.caption  := p.andept[14];
    andept15.caption  := p.andept[15];
    andept16.caption  := p.andept[16];
    andept17.caption  := p.andept[17];
    andept18.caption  := p.andept[18];
    andept19.caption  := p.andept[19];
    andept20.caption  := p.andept[20];
*)
   // 1. 내용   : 출력양식변경에 의한 수정
   // 2. 수정자 : 김승회
   // 3. 수정일 : 1999.07.28
   // begin

   Qempterm.caption  := p.empterm;
   Qlschgr.caption   := p.lschgr;
   Qremark.caption   := p.remark;
   //Qtjobduty.caption := p.tjobduty;
   Qheight.caption   := p.height;
   Qweight.caption   := p.weight;
   Qblood.caption    := p.blood;
   Qreligion.caption := p.religion;
   Qhabit.caption    := p.habit;
   Qability.caption  := p.ability;
   Qarmycl.caption   := p.armycl;
   Qarmyfield.caption := p.armyfield;
   Qarmydis.caption  := p.armydis;
   Qarmyfrdate.caption := p.armyfrdate;
   Qarmytodate.caption := p.armytodate;

   // 비정규학력
   for i := 1 to 4 do
   begin
     compname := 'Qeduorgnm' + IntToStr(i);
     TQRLabel(FindComponent(compname)).caption := P.eduorgnm[i];
     compname := 'Qeducontent' + IntToStr(i);
     TQRLabel(FindComponent(compname)).caption := P.educontent[i];
     compname := 'Qedudate' + IntToStr(i);
     TQRLabel(FindComponent(compname)).caption := P.edudate[i];
   end;

   // 입사전 경력사항
   for i := 1 to 3 do
   begin
   compname := 'carplace' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.carplace[i];

   compname := 'carymd' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.carymd[i];

   compname := 'Qcarym' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.carym[i];

   compname := 'cardept' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.cardept[i];

   compname := 'carjobnm' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.carjobnm[i];
   end;

   bcarym.caption     := p.bcaryy+' 년 '+p.bcarmm+' 월';

   // 외국어
   for i := 1 to 2 do
   begin
   compname := 'langname' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.langname[i];

   compname := 'examname' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.examname[i];

   compname := 'examscore' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.examscore[i];

   compname := 'examdate' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.examdate[i];
   end;

   // 자격증
   for i := 1 to 2 do
   begin
   compname := 'licekind' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.licekind[i];

   compname := 'licgr' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.licgr[i];

   compname := 'licgetdate' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.licgetdate[i];

   compname := 'Qlicalfield' + IntToStr(i);
   TQRLabel(FindComponent(compname)).caption := P.licalfield[i];
   end;

   Qscgubun.caption := p.scgubun;
   Qscentdate.caption := p.scentdate;
   Qscpredate.caption := p.scpredate;
   Qscenddate.caption := p.scenddate;
   Qbohungubun.caption := p.bohungubun;
   Qbohunnm.caption := p.bohunnm;
   Qbohunrel.caption := p.bohunrel;
   Qobskind.caption := p.obskind;
   Qobsgr.caption := p.obsgr;
   Qobsstate.caption := p.obsstate;

   // 30.93   2003.10.12    이민용  오종석(인사팀)  노조원구분, 세부구분 수정
   // 노조사항
   with Qry_Sabu do
   begin
     Close;
     Sql.Clear;
     Sql.Add(' select (decode(substr(nogubun,1,1),''9'',''비노조원'',''노조원'')) nojogubun from pimpmas '+
             ' where empno= :e_empno                                                                     ');
     ParamByName('e_empno').AsString := p.empno;
     Open;
   end;
   //Qnogubun.Caption := Qry_Sabu.FieldByName('nojogubun').AsString;

   //세부구분
   with Qry_Sabu do
   begin
     Close;
     Sql.Clear;
     Sql.Add('select decode(substr(A.nogubun,1,1),''9'',decode(A.nogubun,''9E'',''미가입자'',''제외대상''),B.CODENAME) sebu   '+
             'from pimpmas a, pyccode b                                                                                       '+
             'where b.CODENO = a.NOGUBUN                                                                                      '+
             'and b.CODEID = ''I120''                                                                                           '+
             'and a.empno  = :e_empno                                                                                         ');
     ParamByName('e_empno').AsString := p.empno;
     Open;
   end;

   //SabuGubun.Caption:= Qry_Sabu.FieldByName('sebu').AsString;

   /// end
   QRtitle.Enabled := True;
   //MoreData := True;
   if p.gubun = 'P' then begin
      QRtitle.Enabled := False;
      Report1.NewPage;
      system.Exit;
   end;
  //hjku end else MoreData := False;
  end;

     SubCount    := 0;
     Count       := Count + 1;
     page_number := 0;

     empno.Caption := insa_anno.FieldByName('EMPNO').AsString;  

end;

procedure TReport1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //2017.01.20.hjku.. 인사기록요약표 포맷 변경(사내경력 전체 나오도록).. 김진호M 추가
  SubCount := SubCount + 1;

  Check(p.ancode[SubCount],ancode1);
  andate1.caption    := p.andate[SubCount];
  anpaycl1.caption   := p.anpaycl[SubCount];
  anpayra1.caption   := p.anpayra[SubCount];
  anpayra21.caption  := p.anpayra2[SubCount];
  andept1.caption   := p.andept[SubCount];
end;

procedure TReport1.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if Count < MaxValue then
        Report1.NewPage;
end;

procedure TReport1.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  insa_anno.First;
end;

end.



