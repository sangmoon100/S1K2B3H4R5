unit PIA1072C;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, peprnview,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, jpeg, MemDS,
  DBAccess, Ora;

{$I pia1071c.inc}

type
  TReport1 = class(TQuickRep)
    Qry_Sabu: TOraQuery;
    Qphoto: TOraQuery;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape13: TQRShape;
    QRShape30: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    korname: TQRLabel;
    QRLabel4: TQRLabel;
    empno: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    deptname: TQRLabel;
    QRLabel7: TQRLabel;
    payranm: TQRLabel;
    paycldate: TQRLabel;
    paygr1: TQRLabel;
    jobplace: TQRLabel;
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
    cardate: TQRLabel;
    Qremark: TQRLabel;
    orgempdate: TQRLabel;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel97: TQRLabel;
    Qrealtrdate: TQRLabel;
    Qofftrdate: TQRLabel;
    QRLabel98: TQRLabel;
    Qempterm: TQRLabel;
    QRLabel112: TQRLabel;
    Qlschgr: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    PersonPic: TQRImage;
    QRLabel77: TQRLabel;
    QRShape9: TQRShape;
    jikdeptname: TQRLabel;
    chnname: TQRLabel;
    paygr2: TQRLabel;
    korage: TQRLabel;
    QRLabel23: TQRLabel;
    birthday: TQRLabel;
    birthgubun: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape18: TQRShape;
    QRLabel8: TQRLabel;
    QRShape58: TQRShape;
    QRShape67: TQRShape;
    QRShape64: TQRShape;
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
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape68: TQRShape;
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
    bcarym: TQRLabel;
    QRShape23: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    licgr1: TQRLabel;
    licgr2: TQRLabel;
    licekind1: TQRLabel;
    licekind2: TQRLabel;
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
    QRShape47: TQRShape;
    QRShape56: TQRShape;
    QRShape63: TQRShape;
    QRShape55: TQRShape;
    QRShape60: TQRShape;
    QRShape52: TQRShape;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    ancode1: TQRLabel;
    andate1: TQRLabel;
    anpaycl1: TQRLabel;
    anpayra1: TQRLabel;
    andept1: TQRLabel;
    anpayra21: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape26: TQRShape;
    trlimfrto: TQRLabel;
    licalkind: TQRLabel;
    empjobplace: TQRLabel;
    jungita_amt: TQRLabel;
    danpay_amt: TQRLabel;
    Qtjobduty: TQRLabel;
    Qnogubun: TQRLabel;
    SabuGubun: TQRLabel;
    insa_anno: TOraQuery;
    QRShape3: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel83: TQRLabel;
    psdate: TQRLabel;
    caramt: TQRLabel;
    exduym: TQRLabel;
    QRLabel38: TQRLabel;
    prnDate: TQRLabel;
    QRShape27: TQRShape;
    QRShape12: TQRShape;
    QRLabel2: TQRLabel;
    QRShape28: TQRShape;
    AnLine1: TQRShape;
    QRShape29: TQRShape;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRShape19: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape46: TQRShape;
    procedure QuickReport1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1AfterPrint(Sender: TObject);
    procedure Report1Preview(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRtitleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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

uses Pia1071c;

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


procedure TReport1.QuickReport1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
   i : integer;
   compname : string;

begin
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
    orgempdate.Caption := Format('%2s',[copy(p.orgempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.orgempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.orgempdate,7,2)]);
    empdate.Caption    := '(최초 : '+Format('%2s',[copy(p.empdate,3,2)])+'.'+
                          Format('%2s',[copy(p.empdate,5,2)])+'.'+
                          Format('%2s',[copy(p.empdate,7,2)])+')';

    if pia1071cForm.Chk_Group.checked then
       empdate.Caption := '(그룹입사일: '+Format('%2s',[copy(p.Groupempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,7,2)])+')';

    Qrealtrdate.Caption := Copy(p.realtrdate,1,4) + '.'+
                           Copy(p.realtrdate,5,2) + '.'+
                           Copy(p.realtrdate,7,2);
    Qofftrdate.Caption  := '('+ Copy(p.offtrdate,1,4) + '.'+
                           Copy(p.offtrdate,5,2) + '.'+
                           Copy(p.offtrdate,7,2) + ')';

    trlimfrto.caption  := p.trlimfrto;
    paygr2.Caption     := p.paygr2;
    cardate.caption    := p.cardate;
    jobplace.caption   := p.jobplace;
    licalkind.caption  := p.licalkind;
    empcode.caption    := p.empcode;
    jobline.caption    := p.jobline;
    empjobplace.caption:= p.empjobplace;

    korage.caption     := p.korage;
    birthday.Caption    := p.birthday;
    if  p.birthday = '' then
        birthgubun.Caption  := ''
    else
        birthgubun.Caption  := '('+p.birthgubun+')';

//급여사항
    jungita_amt.caption   := p.jungita_amt;
    danpay_amt.caption := p.danpay_amt;

    pstate.caption     := p.pstate;
    psdate.caption     := p.psdate;
    caramt.caption     := copy(p.caramt,1,2)+' 년 '+copy(p.caramt,3,2)+' 월';
    exduym.caption     := '                     ]';
    prnDate.Caption    := '( 작성일 : '+p.prnDate+' )';

(*
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
   Qempterm.caption  := p.empterm;
   Qlschgr.caption   := p.lschgr;
   Qremark.caption   := p.remark;
   Qtjobduty.caption := p.tjobduty;

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
   Qnogubun.Caption := Qry_Sabu.FieldByName('nojogubun').AsString;

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

   SabuGubun.Caption:= Qry_Sabu.FieldByName('sebu').AsString;

   /// end
   //QRtitle.Enabled := True;
   MoreData := True;
   if p.gubun = 'P' then begin
      //QRtitle.Enabled := False;
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

  //2017.01.20.hjku.. 인사기록요약표 포맷 변경(사내경력 전체 나오도록).. 김진호M
  Count := 0;
  page_number := 0;
  //Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Report1);
  //Fm_PreviewForm.Show;

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
   pia1071cForm.HelpHint('('+Qphoto.FieldByName('korname').AsString+') 사원의 사진 자료를 추출합니다 !!..');

   if trim(Qphoto.FieldByName('empno').AsString) <> '' then begin
     try
       stream    := TMemoryStream.Create;

       personPic.Picture.Graphic := nil;

       TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
       stream.Position := 0;
       if stream.Size <> 0 then
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
  //2017.01.20.hjku.. 인사기록요약표 포맷 변경(사내경력 전체 나오도록).. 김진호M
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Report1);
  Fm_PreviewForm.Show;
end;

procedure TReport1.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
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

procedure TReport1.QRGroup1BeforePrint(Sender: TQRCustomBand;
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
    orgempdate.Caption := Format('%2s',[copy(p.orgempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.orgempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.orgempdate,7,2)]);
    empdate.Caption    := '(최초 : '+Format('%2s',[copy(p.empdate,3,2)])+'.'+
                          Format('%2s',[copy(p.empdate,5,2)])+'.'+
                          Format('%2s',[copy(p.empdate,7,2)])+')';

    if pia1071cForm.Chk_Group.checked then
       empdate.Caption := '(그룹입사일: '+Format('%2s',[copy(p.Groupempdate,1,4)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,5,2)])+'.'+
                          Format('%2s',[copy(p.Groupempdate,7,2)])+')';

    Qrealtrdate.Caption := Copy(p.realtrdate,1,4) + '.'+
                           Copy(p.realtrdate,5,2) + '.'+
                           Copy(p.realtrdate,7,2);
    Qofftrdate.Caption  := '('+ Copy(p.offtrdate,1,4) + '.'+
                           Copy(p.offtrdate,5,2) + '.'+
                           Copy(p.offtrdate,7,2) + ')';

    trlimfrto.caption  := p.trlimfrto;
    paygr2.Caption     := p.paygr2;
    cardate.caption    := p.cardate;
    jobplace.caption   := p.jobplace;
    licalkind.caption  := p.licalkind;
    empcode.caption    := p.empcode;
    jobline.caption    := p.jobline;
    empjobplace.caption:= p.empjobplace;

    korage.caption     := p.korage;
    birthday.Caption    := p.birthday;
    if  p.birthday = '' then
        birthgubun.Caption  := ''
    else
        birthgubun.Caption  := '('+p.birthgubun+')';

//급여사항
    jungita_amt.caption   := p.jungita_amt;
    danpay_amt.caption := p.danpay_amt;

    pstate.caption     := p.pstate;
    psdate.caption     := p.psdate;
    caramt.caption     := copy(p.caramt,1,2)+' 년 '+copy(p.caramt,3,2)+' 월';
    exduym.caption     := '                     ]';
    prnDate.Caption    := '( 작성일 : '+p.prnDate+' )';


    {교육사항을 출력한다 ..........................
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
    eduscore3.caption    := p.eduscore[3];}

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

(*    
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
   Qempterm.caption  := p.empterm;
   Qlschgr.caption   := p.lschgr;
   Qremark.caption   := p.remark;
   Qtjobduty.caption := p.tjobduty;

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
   Qnogubun.Caption := Qry_Sabu.FieldByName('nojogubun').AsString;

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

   SabuGubun.Caption:= Qry_Sabu.FieldByName('sebu').AsString;

   /// end
   //QRtitle.Enabled := True;
   //MoreData := True;
   if p.gubun = 'P' then begin
      //QRtitle.Enabled := False;
      Report1.NewPage;
      system.Exit;
   end;
  end ;//else MoreData := False;

     SubCount    := 0;
     Count       := Count + 1;
     page_number := 0;

     empno.Caption := insa_anno.FieldByName('EMPNO').AsString;
     //korname.Caption := insa_anno.FieldByName('KORNAME').AsString;
     //temp_empno := insa_anno.FieldByName('EMPNO').AsString;


end;

procedure TReport1.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if Count < MaxValue then
        Report1.NewPage;
end;

procedure TReport1.QRtitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  page_number := page_number + 1;
  //QRLabel1.Caption := korname.Caption + '('+empno.caption + ') : ' + IntToStr(page_number) + ' Page';
end;

end.
