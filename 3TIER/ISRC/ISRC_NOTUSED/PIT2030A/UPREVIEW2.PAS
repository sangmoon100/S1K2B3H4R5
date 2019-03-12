unit UPreview2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, peprnview,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, pit203010,
  Tmax_DataSetText, OnGraphicLib;

const
  //사진을 불러오기 위한 부분....
  EMPNO_ID        =     4;
  IMG_SIZE        =     10;
  IMAGE           =     1;
  // 여기까지....

type
  TReport1 = class(TQuickRep)
    QRtitle: TQRBand;
    QRShape16: TQRShape;
    QRShape4: TQRShape;
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
    prnDate: TQRLabel;
    QRShape8: TQRShape;
    deptname: TQRLabel;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    payranm: TQRLabel;
    trlimfrto: TQRLabel;
    paycldate: TQRLabel;
    paygr1: TQRLabel;
    jobplace: TQRLabel;
    licalkind: TQRLabel;
    QRShape17: TQRShape;
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
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    ancode1: TQRLabel;
    QRShape37: TQRShape;
    ancode2: TQRLabel;
    ancode4: TQRLabel;
    ancode3: TQRLabel;
    ancode6: TQRLabel;
    ancode5: TQRLabel;
    ancode7: TQRLabel;
    ancode8: TQRLabel;
    ancode10: TQRLabel;
    ancode9: TQRLabel;
    ancode12: TQRLabel;
    ancode11: TQRLabel;
    ancode13: TQRLabel;
    ancode14: TQRLabel;
    ancode16: TQRLabel;
    ancode15: TQRLabel;
    ancode18: TQRLabel;
    ancode17: TQRLabel;
    ancode20: TQRLabel;
    ancode19: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape38: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    andate1: TQRLabel;
    andate2: TQRLabel;
    andate4: TQRLabel;
    andate3: TQRLabel;
    andate6: TQRLabel;
    andate5: TQRLabel;
    andate7: TQRLabel;
    andate8: TQRLabel;
    andate10: TQRLabel;
    andate9: TQRLabel;
    andate12: TQRLabel;
    andate11: TQRLabel;
    andate13: TQRLabel;
    andate14: TQRLabel;
    andate16: TQRLabel;
    andate15: TQRLabel;
    andate18: TQRLabel;
    andate17: TQRLabel;
    andate20: TQRLabel;
    andate19: TQRLabel;
    anpaycl1: TQRLabel;
    anpaycl2: TQRLabel;
    anpaycl4: TQRLabel;
    anpaycl3: TQRLabel;
    anpaycl6: TQRLabel;
    anpaycl5: TQRLabel;
    anpaycl7: TQRLabel;
    anpaycl8: TQRLabel;
    anpaycl10: TQRLabel;
    anpaycl9: TQRLabel;
    anpaycl12: TQRLabel;
    anpaycl11: TQRLabel;
    anpaycl13: TQRLabel;
    anpaycl14: TQRLabel;
    anpaycl16: TQRLabel;
    anpaycl15: TQRLabel;
    anpaycl18: TQRLabel;
    anpaycl17: TQRLabel;
    anpaycl20: TQRLabel;
    anpaycl19: TQRLabel;
    anpayra1: TQRLabel;
    anpayra2: TQRLabel;
    anpayra4: TQRLabel;
    anpayra3: TQRLabel;
    anpayra6: TQRLabel;
    anpayra5: TQRLabel;
    anpayra7: TQRLabel;
    anpayra8: TQRLabel;
    anpayra10: TQRLabel;
    anpayra9: TQRLabel;
    anpayra12: TQRLabel;
    anpayra11: TQRLabel;
    anpayra13: TQRLabel;
    anpayra14: TQRLabel;
    anpayra16: TQRLabel;
    anpayra15: TQRLabel;
    anpayra18: TQRLabel;
    anpayra17: TQRLabel;
    anpayra20: TQRLabel;
    anpayra19: TQRLabel;
    andept1: TQRLabel;
    andept2: TQRLabel;
    andept4: TQRLabel;
    andept3: TQRLabel;
    andept6: TQRLabel;
    andept5: TQRLabel;
    andept7: TQRLabel;
    andept8: TQRLabel;
    andept10: TQRLabel;
    andept9: TQRLabel;
    andept12: TQRLabel;
    andept11: TQRLabel;
    andept13: TQRLabel;
    andept14: TQRLabel;
    andept16: TQRLabel;
    andept15: TQRLabel;
    andept18: TQRLabel;
    andept17: TQRLabel;
    andept20: TQRLabel;
    andept19: TQRLabel;
    QRShape39: TQRShape;
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
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRShape64: TQRShape;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel76: TQRLabel;
    QRLabel83: TQRLabel;
    carplace1: TQRLabel;
    carplace2: TQRLabel;
    carplace4: TQRLabel;
    carplace3: TQRLabel;
    carymd1: TQRLabel;
    carymd2: TQRLabel;
    carymd4: TQRLabel;
    carymd3: TQRLabel;
    cardept1: TQRLabel;
    cardept2: TQRLabel;
    cardept4: TQRLabel;
    cardept3: TQRLabel;
    carjobnm1: TQRLabel;
    carjobnm2: TQRLabel;
    carjobnm4: TQRLabel;
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
    pstate: TQRLabel;
    psdate: TQRLabel;
    bcarym: TQRLabel;
    caramt: TQRLabel;
    exduym: TQRLabel;
    QRShape18: TQRShape;
    QRShape40: TQRShape;
    QRLabel4: TQRLabel;
    QRShape23: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    langname1: TQRLabel;
    langname2: TQRLabel;
    examscore1: TQRLabel;
    QRShape28: TQRShape;
    QRLabel99: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape29: TQRShape;
    QRLabel103: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    jobline: TQRLabel;
    empcode: TQRLabel;
    empdate: TQRLabel;
    QRShape30: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel132: TQRLabel;
    educourse1: TQRLabel;
    educourse2: TQRLabel;
    educourse3: TQRLabel;
    edutype1: TQRLabel;
    edutype2: TQRLabel;
    edutype3: TQRLabel;
    edufrtodate1: TQRLabel;
    edufrtodate2: TQRLabel;
    edufrtodate3: TQRLabel;
    edutime1: TQRLabel;
    edutime2: TQRLabel;
    edutime3: TQRLabel;
    QRShape91: TQRShape;
    QRShape87: TQRShape;
    QRShape92: TQRShape;
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
    facode6: TQRLabel;
    faname1: TQRLabel;
    faname2: TQRLabel;
    faname3: TQRLabel;
    faname4: TQRLabel;
    faname5: TQRLabel;
    faname6: TQRLabel;
    fabirth1: TQRLabel;
    fabirth2: TQRLabel;
    fabirth3: TQRLabel;
    fabirth4: TQRLabel;
    fabirth5: TQRLabel;
    fabirth6: TQRLabel;
    faschgr1: TQRLabel;
    faschgr2: TQRLabel;
    faschgr3: TQRLabel;
    faschgr4: TQRLabel;
    faschgr5: TQRLabel;
    faschgr6: TQRLabel;
    faplace1: TQRLabel;
    faplace2: TQRLabel;
    faplace3: TQRLabel;
    faplace4: TQRLabel;
    faplace5: TQRLabel;
    faplace6: TQRLabel;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRLabel163: TQRLabel;
    QRShape102: TQRShape;
    marrigeyn: TQRLabel;
    QRShape51: TQRShape;
    QRLabel151: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel169: TQRLabel;
    juminid: TQRLabel;
    armyfrto: TQRLabel;
    jungita_amt: TQRLabel;
    examname1: TQRLabel;
    examdate1: TQRLabel;
    examdate2: TQRLabel;
    examname2: TQRLabel;
    examscore2: TQRLabel;
    cardate: TQRLabel;
    empjobplace: TQRLabel;
    Qremark: TQRLabel;
    licgr1: TQRLabel;
    licgr2: TQRLabel;
    orgempdate: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel38: TQRLabel;
    educourse4: TQRLabel;
    edutype4: TQRLabel;
    edufrtodate4: TQRLabel;
    edutime4: TQRLabel;
    educourse5: TQRLabel;
    edutype5: TQRLabel;
    edufrtodate5: TQRLabel;
    edutime5: TQRLabel;
    licekind1: TQRLabel;
    licekind2: TQRLabel;
    korage: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape101: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape108: TQRShape;
    edugubun1: TQRLabel;
    edugubun2: TQRLabel;
    edugubun3: TQRLabel;
    edugubun4: TQRLabel;
    edugubun5: TQRLabel;
    eduscore1: TQRLabel;
    eduscore2: TQRLabel;
    eduscore3: TQRLabel;
    eduscore4: TQRLabel;
    eduscore5: TQRLabel;
    QRLabel97: TQRLabel;
    Qrealtrdate: TQRLabel;
    Qofftrdate: TQRLabel;
    paygr2: TQRLabel;
    QRLabel98: TQRLabel;
    Qempterm: TQRLabel;
    QRLabel112: TQRLabel;
    Qlschgr: TQRLabel;
    QRShape109: TQRShape;
    QRShape117: TQRShape;
    QRLabel113: TQRLabel;
    Qtjobduty: TQRLabel;
    QRShape118: TQRShape;
    QRLabel34: TQRLabel;
    danpay_amt: TQRLabel;
    QRShape120: TQRShape;
    QRLabel148: TQRLabel;
    junpay_amt: TQRLabel;
    QRLabel114: TQRLabel;
    Qheight: TQRLabel;
    QRShape99: TQRShape;
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
    QRShape49: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel53: TQRLabel;
    curaddr: TQRLabel;
    QRLabel54: TQRLabel;
    regaddr: TQRLabel;
    telno: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    bornarea: TQRLabel;
    QRShape107: TQRShape;
    QRShape110: TQRShape;
    QRLabel121: TQRLabel;
    armykind: TQRLabel;
    QRLabel122: TQRLabel;
    Qarmycl: TQRLabel;
    QRShape116: TQRShape;
    QRLabel123: TQRLabel;
    Qarmyfield: TQRLabel;
    QRShape112: TQRShape;
    QRLabel128: TQRLabel;
    Qarmydis: TQRLabel;
    QRShape114: TQRShape;
    QRLabel131: TQRLabel;
    Qarmyfrdate: TQRLabel;
    QRShape123: TQRShape;
    Qarmytodate: TQRLabel;
    QRLabel134: TQRLabel;
    QRShape124: TQRShape;
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
    QRShape129: TQRShape;
    QRLabel174: TQRLabel;
    QRShape57: TQRShape;
    QRLabel22: TQRLabel;
    Qcarym1: TQRLabel;
    Qcarym2: TQRLabel;
    Qcarym3: TQRLabel;
    Qcarym4: TQRLabel;
    QRLabel84: TQRLabel;
    Qlicalfield1: TQRLabel;
    Qlicalfield2: TQRLabel;
    QRShape59: TQRShape;
    QRShape65: TQRShape;
    QRLabel85: TQRLabel;
    QRShape84: TQRShape;
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
    QRShape71: TQRShape;
    QRLabel93: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    Qbohungubun: TQRLabel;
    QRLabel95: TQRLabel;
    Qbohunnm: TQRLabel;
    QRShape81: TQRShape;
    QRLabel101: TQRLabel;
    Qbohunrel: TQRLabel;
    QRShape82: TQRShape;
    QRLabel94: TQRLabel;
    QRShape83: TQRShape;
    QRShape100: TQRShape;
    Qobskind: TQRLabel;
    QRLabel105: TQRLabel;
    Qobsgr: TQRLabel;
    QRShape126: TQRShape;
    QRLabel107: TQRLabel;
    Qobsstate: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    PersonPic: TQRImage;
    QRLabel77: TQRLabel;
    CPhoto: TTMaxDataSet;
    QRShape9: TQRShape;
    anpayra21: TQRLabel;
    anpayra22: TQRLabel;
    anpayra24: TQRLabel;
    anpayra23: TQRLabel;
    anpayra26: TQRLabel;
    anpayra25: TQRLabel;
    anpayra27: TQRLabel;
    anpayra28: TQRLabel;
    anpayra210: TQRLabel;
    anpayra29: TQRLabel;
    anpayra212: TQRLabel;
    anpayra211: TQRLabel;
    anpayra213: TQRLabel;
    anpayra214: TQRLabel;
    anpayra216: TQRLabel;
    anpayra215: TQRLabel;
    anpayra218: TQRLabel;
    anpayra217: TQRLabel;
    anpayra220: TQRLabel;
    anpayra219: TQRLabel;
    QRLabel144: TQRLabel;
    procedure QuickReport1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1AfterPrint(Sender: TObject);
    procedure Report1Preview(Sender: TObject);
  private
    P  : DataSource_insa;
    F  : file of DataSource_insa;
    procedure empPicture(mEmpno : string);
    procedure JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
  public

  end;

  //사진을 불러오기 위한 부분....
  TImageData = array[0..0] of Char;
  PImageData = ^TImageData;

  TSSMTEM090N_IN = record
    c_headerinfo : array[0..123] of char;
    c_empno_id  : array[0..EMPNO_ID-1] of Char; //홍기영이 추가한 부분이다(4글자)
    c_img_size  : array[0..IMG_SIZE-1] of Char;
  end;

  PSSMTEM090N_IN = ^TSSMTEM090N_IN;

  TSSMTEM090N_OUT = record
    c_headerinfo : array[0..123] of char;
    c_empno_id  : array[0..EMPNO_ID-1] of Char;
    c_img_size  : array[0..IMG_SIZE-1] of Char;
  end;

  PSSMTEM090N_OUT = ^TSSMTEM090N_OUT;
  // 여기까지....
var
  Report1: TReport1;
  jpegimage : TJpegImage;

implementation

uses
  pit203011, atmi, pass, pit203000;

{$R *.DFM}
{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
                                            (급여사항추가등 ...)
 -------------------------------------------------------------------------------}

procedure TReport1.QuickReport1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
   i : integer;
   compname : string;
begin
  // 1. 내용   : 출력양식변경에 의한 수정
  // 2. 수정자 : 김승회
  // 3. 수정일 : 1999.07.28
  if not Eof(F) then  begin
    Read(F,P);
    personPic.picture  := nil;
    empPicture(p.empno);

    empno.Caption      := p.empno;
    korname.Caption    := p.korname;
    deptname.Caption   := p.deptname;
    payranm.Caption    := p.payranm;
    if MainForm.PayraChdate > MainForm.P_sysdate then
         paygr1.Caption     := p.paygr1
    else
         paygr1.Caption     := '';
    paycldate.Caption  := '['+Format('%4s',[copy(p.paycldate,1,4)])+'.'+
                              Format('%2s',[copy(p.paycldate,5,2)])+'.'+
                              Format('%2s',[copy(p.paycldate,7,2)])+']';
    // 3. 수정일 : 1999.07.28
    //orgempdate.Caption := Format('%2s',[copy(p.orgempdate,3,2)])+'.'+
    orgempdate.Caption := Format('%2s',[copy(p.orgempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.orgempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.orgempdate,7,2)]);
    // 3. 수정일 : 1999.07.28
    //empdate.Caption    := '(최초 : '+Format('%2s',[copy(p.empdate,3,2)])+'.'+
    empdate.Caption    := '(최초 : '+Format('%2s',[copy(p.empdate,1,4)])+'.'+
                          Format('%2s',[copy(p.empdate,5,2)])+'.'+
                          Format('%2s',[copy(p.empdate,7,2)])+')';

    // 수정일 : 2000.05.10 :김대훈
    Qrealtrdate.Caption := Copy(p.realtrdate,1,4) + '.'+
                           Copy(p.realtrdate,5,2) + '.'+
                           Copy(p.realtrdate,7,2);
    Qofftrdate.Caption  := '('+ Copy(p.offtrdate,1,4) + '.'+
                           Copy(p.offtrdate,5,2) + '.'+
                           Copy(p.offtrdate,7,2) + ')';

    trlimfrto.caption  := p.trlimfrto;
    if MainForm.PayraChdate > MainForm.P_sysdate then
       paygr2.Caption     := Format('%8s',[p.paygr2])
    else
       paygr2.Caption     := '';
    cardate.caption    := p.cardate;
    jobplace.caption   := p.jobplace;
    licalkind.caption  := p.licalkind;
    empcode.caption    := p.empcode;
    jobline.caption    := p.jobline;
    empjobplace.caption:= p.empjobplace;
//    empterm.caption    := p.empterm;
    juminid.caption    := p.juminid;
    korage.caption     := p.korage;
    marrigeyn.caption  := p.marrigeyn;
    //ability.caption    := copy(p.ability,1,10);
    armykind.caption   := p.armykind;
    armyfrto.caption  := p.armyfrto;
    curaddr.caption    := p.curaddr;
    regaddr.caption    := p.regaddr;
    telno.caption      := p.telno;
    bornarea.caption   := p.bornarea;
//급여사항
    junpay_amt.caption := p.junpay_amt;
    jungita_amt.caption   := p.jungita_amt;
    danpay_amt.caption := p.danpay_amt;

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
    facode6.Caption    := p.facode[6];
    faname1.Caption    := p.faname[1];
    faname2.Caption    := p.faname[2];
    faname3.Caption    := p.faname[3];
    faname4.Caption    := p.faname[4];
    faname5.Caption    := p.faname[5];
    faname6.Caption    := p.faname[6];
    fabirth1.caption   := p.fabirth[1];
    fabirth2.caption   := p.fabirth[2];
    fabirth3.caption   := p.fabirth[3];
    fabirth4.caption   := p.fabirth[4];
    fabirth5.caption   := p.fabirth[5];
    fabirth6.caption   := p.fabirth[6];
    faschgr1.caption   := p.faschgr[1];
    faschgr2.caption   := p.faschgr[2];
    faschgr3.caption   := p.faschgr[3];
    faschgr4.caption   := p.faschgr[4];
    faschgr5.caption   := p.faschgr[5];
    faschgr6.caption   := p.faschgr[6];
    faplace1.caption   := p.faplace[1];
    faplace2.caption   := p.faplace[2];
    faplace3.caption   := p.faplace[3];
    faplace4.caption   := p.faplace[4];
    faplace5.caption   := p.faplace[5];
    faplace6.caption   := p.faplace[6];

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
    edutype3.caption   := p.edutype[3];
    edugubun3.caption   := p.edugubun[3];
    edutime3.caption   := p.edutime[3];
    eduscore3.caption   := p.eduscore[3];

    edufrtodate4.caption := p.edufrtodate[4];
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
    eduscore5.caption    := p.eduscore[5];


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
    {발령사항을 출력한다.......................}
    ancode1.caption    := p.ancode[1];
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
    ancode20.caption   := p.ancode[20];

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
{
    anpaycl21.caption   := p.anpaycl2[1];
    anpaycl22.caption   := p.anpaycl2[2];
    anpaycl23.caption   := p.anpaycl2[3];
    anpaycl24.caption   := p.anpaycl2[4];
    anpaycl25.caption   := p.anpaycl2[5];
    anpaycl26.caption   := p.anpaycl2[6];
    anpaycl27.caption   := p.anpaycl2[7];
    anpaycl28.caption   := p.anpaycl2[8];
    anpaycl29.caption   := p.anpaycl2[9];
    anpaycl210.caption  := p.anpaycl2[10];
    anpaycl211.caption  := p.anpaycl2[11];
    anpaycl212.caption  := p.anpaycl2[12];
    anpaycl213.caption  := p.anpaycl2[13];
    anpaycl214.caption  := p.anpaycl2[14];
    anpaycl215.caption  := p.anpaycl2[15];
    anpaycl216.caption  := p.anpaycl2[16];
    anpaycl217.caption  := p.anpaycl2[17];
    anpaycl218.caption  := p.anpaycl2[18];
    anpaycl219.caption  := p.anpaycl2[19];
    anpaycl220.caption  := p.anpaycl2[20];
}
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

    anpayra21.caption   := p.anpayra2[1];
    anpayra22.caption   := p.anpayra2[2];
    anpayra23.caption   := p.anpayra2[3];
    anpayra24.caption   := p.anpayra2[4];
    anpayra25.caption   := p.anpayra2[5];
    anpayra26.caption   := p.anpayra2[6];
    anpayra27.caption   := p.anpayra2[7];
    anpayra28.caption   := p.anpayra2[8];
    anpayra29.caption   := p.anpayra2[9];
    anpayra210.caption  := p.anpayra2[10];
    anpayra211.caption  := p.anpayra2[11];
    anpayra212.caption  := p.anpayra2[12];
    anpayra213.caption  := p.anpayra2[13];
    anpayra214.caption  := p.anpayra2[14];
    anpayra215.caption  := p.anpayra2[15];
    anpayra216.caption  := p.anpayra2[16];
    anpayra217.caption  := p.anpayra2[17];
    anpayra218.caption  := p.anpayra2[18];
    anpayra219.caption  := p.anpayra2[19];
    anpayra220.caption  := p.anpayra2[20];

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

   // 1. 내용   : 출력양식변경에 의한 수정
   // 2. 수정자 : 김승회
   // 3. 수정일 : 1999.07.28
   // begin

   Qempterm.caption  := p.empterm;
   Qlschgr.caption   := p.lschgr;
   Qremark.caption   := p.remark;
   Qtjobduty.caption := p.tjobduty;
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
   for i := 1 to 4 do
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


   /// end
   QRtitle.Enabled := True;
   MoreData := True;
   if p.gubun = 'P' then begin
      QRtitle.Enabled := False;
      Report1.NewPage;
      system.Exit;
   end;
  end else MoreData := False;
end;

procedure TReport1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(F,HomeDir+'\list\pia1060c.tmp');
  System.Reset(F);
  System.Seek(F,0);

end;

procedure TReport1.QuickReport1AfterPrint(Sender: TObject);
begin
  System.close(F);

end;

// 데이타를 찾아서 뿌린다..----------------------------------------------------
{procedure TReport1.empPicture(mEmpno : string);
var
  tpInfoP : pTPINIT;
  buf : PChar;
  ImageSize,size : integer;
  Mem : TMemoryStream;
  S090IN_1 : PSSMTEM090N_IN;
begin
  personPic.picture.Graphic := nil;

  tpInfop := tpAlloc('TPINIT',NIL,512);
  if TuxReadEnv('C:\INSA\TUX\HANARO.ENV','HANAROHPER') <> 0 then Exit;
  if tpInit(tpInfop) = -1 then Exit;

  buf := tpalloc('CARRAY',NIL,1024);
  if buf <> NIL then begin
    S090IN_1 := PSSMTEM090N_IN(buf);
    fillchar(S090IN_1^,sizeof(TSSMTEM090N_IN),#32);

    with S090IN_1^ do begin
      strlcopy(c_headerinfo,PChar(format('%-10s%1s%-4s%-100s%-4d%-5d',
           ['SHR1SPHOTO','0','0000','NO ERROR !',1,1024])),124);
      strlcopy(c_empno_id,PChar(mEmpno),4); // 사번....
      strlcopy(c_img_size,PChar(format('%-10d',[0])),10);
    end;

    if tpcall('SHR1SPHOTO',S090IN_1,1024,@S090IN_1,@size,0) <> -1 then begin
       ImageSize := StrToInt(Trim(S090IN_1^.c_img_size));

       Mem := TMemoryStream.Create();
       Mem.Position := 0;
       Mem.Write((PChar(S090IN_1)+sizeof(TSSMTEM090N_IN))^,ImageSize);
       Mem.SavetoFile('.\DOWN.JPG');
       Mem.Free;

       personPic.Picture.LoadFromFile('.\DOWN.JPG');
    end;
  end;

  tpfree(S090IN_1);
  tpterm();
end;
}

procedure TReport1.empPicture(mEmpno : string);
var
  Stream    : TMemoryStream;
begin

  with Cphoto do
    begin
      ServiceName := 'PIB2020B_pic';
      Close;
      ClearParamInfo;
      AddParam('empno', 4 , '1000');

      ParamInfo[0].Value := mEmpno;

      ClearFieldInfo;
      AddField('EMPNO', ftString,  4);
      AddField('PHOTO', ftBlob,    0);
      Open;

      if Cphoto.RecordCount = 0 then
        begin
          Close;
          System.Exit;
        end;

      try
        stream    := TMemoryStream.Create;
        personPic.Picture.Graphic := nil;
        TblobField(Cphoto.FieldByName('photo')).SaveToStream(stream);
        stream.Position := 0;
        if stream.Size <> 0 then
          JPEGLoadFromDB(TblobField(Cphoto.FieldByName('photo')), PersonPic);
        Cphoto.Close;
      finally
        stream.free;
      end;
      Cphoto.Close;
    end
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

end.
