//경력사원
unit pir20503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, Grids, DBGrids, jpeg;

type
  TPrintFormCarr = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel55: TQRLabel;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel56: TQRLabel;
    QRShape59: TQRShape;
    QRShape61: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    Lyy: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape65: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape70: TQRShape;
    QRShape48: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    Lgubun: TQRLabel;
    Lfullname: TQRLabel;
    Ltel: TQRLabel;
    Lj1: TQRLabel;
    Lj2: TQRLabel;
    Lj3: TQRLabel;
    Lj4: TQRLabel;
    Lj5: TQRLabel;
    Lj6: TQRLabel;
    Lj7: TQRLabel;
    Lj8: TQRLabel;
    Lj9: TQRLabel;
    Lj10: TQRLabel;
    Lj11: TQRLabel;
    Lj12: TQRLabel;
    Lj13: TQRLabel;
    QRLabel108: TQRLabel;
    Lzip1: TQRLabel;
    QRLabel110: TQRLabel;
    Lzip2: TQRLabel;
    Laddress: TQRLabel;
    QRLabel109: TQRLabel;
    Lemail: TQRLabel;
    LMobile1: TQRLabel;
    QRShape23: TQRShape;
    Llicence1: TQRLabel;
    Llicence2: TQRLabel;
    Lbohun: TQRLabel;
    Larmykind: TQRLabel;
    Larmygrade: TQRLabel;
    Larmyexcept: TQRLabel;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    Larmyinyy: TQRLabel;
    QRLabel119: TQRLabel;
    Larmyinmm: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    Larmyoutmm: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    Lmm: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel121: TQRLabel;
    Larmyoutyy: TQRLabel;
    Lf1type: TQRLabel;
    Lf2type: TQRLabel;
    Lf3type: TQRLabel;
    Lf4type: TQRLabel;
    Lf5type: TQRLabel;
    QRShape66: TQRShape;
    Lf1name: TQRLabel;
    Lf1age: TQRLabel;
    Lf1grade: TQRLabel;
    Lf1work: TQRLabel;
    Lf1with: TQRLabel;
    Lf1tel: TQRLabel;
    Lf2name: TQRLabel;
    Lf2age: TQRLabel;
    Lf2grade: TQRLabel;
    Lf2work: TQRLabel;
    Lf2with: TQRLabel;
    Lf2tel: TQRLabel;
    Lf3name: TQRLabel;
    Lf3age: TQRLabel;
    Lf3grade: TQRLabel;
    Lf3work: TQRLabel;
    Lf3with: TQRLabel;
    Lf3tel: TQRLabel;
    Lf4name: TQRLabel;
    Lf4age: TQRLabel;
    Lf4grade: TQRLabel;
    Lf4work: TQRLabel;
    Lf4with: TQRLabel;
    Lf4tel: TQRLabel;
    Lf5name: TQRLabel;
    Lf5age: TQRLabel;
    Lf5grade: TQRLabel;
    Lf5work: TQRLabel;
    Lf5with: TQRLabel;
    Lf5tel: TQRLabel;
    QRImage2: TQRImage;
    QRSubDetail2: TQRSubDetail;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    Lbodyheight: TQRLabel;
    Lbodyweight: TQRLabel;
    Linterest: TQRLabel;
    Lymdhms1: TQRLabel;
    QRLabel128: TQRLabel;
    Lymdhms2: TQRLabel;
    QRLabel131: TQRLabel;
    Lfullname1: TQRLabel;
    QRLabel130: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRLabel91: TQRLabel;
    QRShape92: TQRShape;
    QRLabel113: TQRLabel;
    QRLabel115: TQRLabel;
    QRShape97: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRLabel127: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel177: TQRLabel;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRLabel96: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    Lappindate: TQRLabel;
    Lhopepay: TQRLabel;
    Ldept: TQRLabel;
    Laparea: TQRLabel;
    Lcar1where: TQRLabel;
    Lcar1dateto: TQRLabel;
    Lcar1work: TQRLabel;
    Lcar1payra: TQRLabel;
    QRLabel141: TQRLabel;
    Lcar1datefrom: TQRLabel;
    Lcar2where: TQRLabel;
    Lcar3where: TQRLabel;
    Lcar4where: TQRLabel;
    Lcar2datefrom: TQRLabel;
    Lcar3datefrom: TQRLabel;
    Lcar4datefrom: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel158: TQRLabel;
    Lcar2dateto: TQRLabel;
    Lcar3dateto: TQRLabel;
    Lcar4dateto: TQRLabel;
    Lcar2work: TQRLabel;
    Lcar3work: TQRLabel;
    Lcar4work: TQRLabel;
    Lcar2payra: TQRLabel;
    Lcar3payra: TQRLabel;
    Lcar4payra: TQRLabel;
    QRMemo2: TQRRichText;
    QRMemo1: TQRRichText;
    QRShape88: TQRShape;
    QRLabel106: TQRLabel;
    QRShape104: TQRShape;
    Lobsyn: TQRLabel;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel90: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    Lrid1: TQRLabel;
    Lrid2: TQRLabel;
    Lrid3: TQRLabel;
    Lrid4: TQRLabel;
    Lrid5: TQRLabel;
    Lrid6: TQRLabel;
    Lrid7: TQRLabel;
    Lrid8: TQRLabel;
    Lrid9: TQRLabel;
    LymdhY: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape9: TQRShape;
    QRShape34: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
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
    QRLabel42: TQRLabel;
    QRShape41: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    Lhighname: TQRLabel;
    Lunivname: TQRLabel;
    Lgrdname: TQRLabel;
    QRShape86: TQRShape;
    Lunvimajorid: TQRLabel;
    Lgrd1majorid: TQRLabel;
    Lunivscore: TQRLabel;
    QRLabel112: TQRLabel;
    Lunivscoret: TQRLabel;
    Lgrd1score: TQRLabel;
    QRLabel117: TQRLabel;
    Lgrd1scoret: TQRLabel;
    Lunivwhere: TQRLabel;
    Lunivday: TQRLabel;
    LGrd1where: TQRLabel;
    QRShape40: TQRShape;
    QRShape33: TQRShape;
    Lgrd1day: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    Lhighgrad: TQRLabel;
    Lunivgrad: TQRLabel;
    Lgrd1grad: TQRLabel;
    QRShape38: TQRShape;
    QRLabel111: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel122: TQRLabel;
    Lhighiny1: TQRLabel;
    Lhighiny2: TQRLabel;
    Lhighinm1: TQRLabel;
    Lhighinm2: TQRLabel;
    LhighoutY1: TQRLabel;
    LhighoutY2: TQRLabel;
    Lhighoutm1: TQRLabel;
    Lhighoutm2: TQRLabel;
    QRShape46: TQRShape;
    QRShape43: TQRShape;
    QRShape47: TQRShape;
    Luniviny1: TQRLabel;
    Luniviny2: TQRLabel;
    Lunivinm1: TQRLabel;
    Lunivinm2: TQRLabel;
    Lunivouty1: TQRLabel;
    Lunivouty2: TQRLabel;
    Lunivoutm1: TQRLabel;
    Lunivoutm2: TQRLabel;
    QRShape42: TQRShape;
    QRShape39: TQRShape;
    Lgrd1iny1: TQRLabel;
    Lgrd1iny2: TQRLabel;
    Lgrd1inm1: TQRLabel;
    Lgrd1inm2: TQRLabel;
    Lgrd1outy1: TQRLabel;
    Lgrd1outy2: TQRLabel;
    Lgrd1outm1: TQRLabel;
    Lgrd1outm2: TQRLabel;
    QRShape102: TQRShape;
    QRLabel176: TQRLabel;
    Lbadunivname: TQRLabel;
    QRLabel143: TQRLabel;
    Lbadunvimajorid: TQRLabel;
    QRLabel49: TQRLabel;
    Lgrd1paper: TQRLabel;
    Lbadgrd1score: TQRLabel;
    QRLabel146: TQRLabel;
    Lbadunivscoret: TQRLabel;
    Lbadunivwhere: TQRLabel;
    Lbadunivday: TQRLabel;
    Lbadunivgrad: TQRLabel;
    Lbaduniviny1: TQRLabel;
    Lbaduniviny2: TQRLabel;
    Lbadunivinm1: TQRLabel;
    Lbadunivinm2: TQRLabel;
    Lbadunivouty1: TQRLabel;
    Lbadunivouty2: TQRLabel;
    Lbadunivoutm1: TQRLabel;
    Lbadunivoutm2: TQRLabel;
    QRShape87: TQRShape;
    QRLabel105: TQRLabel;
    LUNIVMINORID: TQRLabel;
    QRShape52: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape55: TQRShape;
    Lengscore: TQRLabel;
    Lengy: TQRLabel;
    Lengm: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel61: TQRLabel;
    LETCLANG: TQRLabel;
    LETCLANG_POINT: TQRLabel;
    LETCLANG_Y: TQRLabel;
    QRLabel107: TQRLabel;
    LETCLANG_M: TQRLabel;
    QRLabel139: TQRLabel;
    QRShape89: TQRShape;
    LHOPE_PER: TQRLabel;
    QRLabel5: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintFormCarr: TPrintFormCarr;

implementation

uses pir20502, PePrnview;

{$R *.DFM}

procedure TPrintFormCarr.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Vdept    : string;
  VUNIVID  : string;
  A        : string;
  vprieod  : string;
  iJPG      : TJPEGImage;
  iBMP      : TBitmap;
  iPIC      : TPicture;
  stream    : TMemoryStream;
begin
     with PrintForm.Qry_recuit  do
     begin
          Vdept := FieldByName('DEPT').AsString; // 응시부분
          Ldept.Caption := FieldByName('strDEPT').AsString;

               if FieldByName('APAREA').AsString = '1' then Laparea.Caption:= '전국'
          else if FieldByName('APAREA').AsString = '2' then Laparea.Caption:= '서울/수도권'
          else if FieldByName('APAREA').AsString = '3' then Laparea.Caption:= '충청'
          else if FieldByName('APAREA').AsString = '4' then Laparea.Caption:= '경남'
          else if FieldByName('APAREA').AsString = '5' then Laparea.Caption:= '경북'
          else if FieldByName('APAREA').AsString = '6' then Laparea.Caption:= '전남'
          else if FieldByName('APAREA').AsString = '7' then Laparea.Caption:= '전북'
          else                                              Laparea.Caption:= '';

          // 사진
          QRImage2.Enabled := True;
          if fileexists('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString) then
          begin
               try
                    iJPG := TJPEGImage.Create;
                    iJPG.LoadFromFile('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString);
                    QRImage2.Picture.Assign(iJPG);
                    iJPG.Free;
               except
                    try
                         iBMP := TBitmap.Create;
                         iBMP.LoadFromFile('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString);
                         QRImage2.Picture.Assign(iBmp);
                         iBMP.Free;
                    except
                         QRImage2.Enabled := False;
                    end;
               end;
          end
          else QRImage2.Picture := nil;

          Lfullname.Caption:= FieldByName('FULLNAME').AsString;           //이름
          Ltel.Caption:= FieldByName('TEL').AsString;                     //전화
          Lj1.Caption:= Copy(FieldByName('REGNO').AsString,1,1);          //주민번호 첫자리
          Lj2.Caption:= Copy(FieldByName('REGNO').AsString,2,1);
          Lj3.Caption:= Copy(FieldByName('REGNO').AsString,3,1);
          Lj4.Caption:= Copy(FieldByName('REGNO').AsString,4,1);
          Lj5.Caption:= Copy(FieldByName('REGNO').AsString,5,1);
          Lj6.Caption:= Copy(FieldByName('REGNO').AsString,6,1);
          Lj7.Caption:= Copy(FieldByName('REGNO').AsString,7,1);
          Lj8.Caption:= Copy(FieldByName('REGNO').AsString,8,1);
          Lj9.Caption:= Copy(FieldByName('REGNO').AsString,9,1);
          Lj10.Caption:= Copy(FieldByName('REGNO').AsString,10,1);
          Lj11.Caption:= Copy(FieldByName('REGNO').AsString,11,1);
          Lj12.Caption:= Copy(FieldByName('REGNO').AsString,12,1);
          Lj13.Caption:= Copy(FieldByName('REGNO').AsString,13,1);
          Lzip1.Caption:= Copy(FieldByName('ZIPCODE').AsString,1,3);      //우편번호
          Lzip2.Caption:= Copy(FieldByName('ZIPCODE').AsString,4,3);
          Laddress.Caption:= FieldByName('ADDRESS').AsString;             //주소
          LMobile1.Caption:= FieldByName('MOBILE').AsString;              //이동전화

          Lemail.Caption:= FieldByName('EMAIL').AsString;                  //이메일
          Lhighname.Caption:= FieldByName('HIGHNAME').AsString;            //고등학교명
          Lunivname.Caption:= FieldByName('UNIVNAME').AsString;            //대학교명
          Lbadunivname.Caption:= FieldByName('BADUNIVNAME').AsString;      //편입전대학교명
          Lgrdname.Caption:= FieldByName('GRD1NAME').AsString;             //대학원명

          // 대학전공
               if FieldByName('UNIVMAJORID').AsString = '9999'  then Lunvimajorid.Caption:= FieldByName('UnivMajorName').AsString
          else if FieldByName('UNIVMAJORID').AsString <> '9999' then Lunvimajorid.Caption:= FieldByName('UNIVMAJOR').AsString;

          // 대학부전공
               if FieldByName('UNIVMINORID').AsString = '9999'  then LUNIVMINORID.Caption:= FieldByName('UnivMinorName').AsString
          else if FieldByName('UNIVMINORID').AsString <> '9999' then LUNIVMINORID.Caption:= FieldByName('univminor').AsString;

          // 편입전대학전공
               if FieldByName('BADUNIVMAJOR').AsString = '9999'  then Lbadunvimajorid.Caption:= FieldByName('BadUnivMajorName').AsString
          else if FieldByName('BADUNIVMAJOR').AsString <> '9999' then Lbadunvimajorid.Caption:= FieldByName('BADUNIVMAJORR').AsString;

          // 대학원전공
               if FieldByName('GRD1MAJORID').AsString = '9999'  then Lgrd1majorid.Caption:= FieldByName('Grd1MajorName').AsString
          else if FieldByName('GRD1MAJORID').AsString <> '9999' then Lgrd1majorid.Caption:= FieldByName('GRD1MAJOR').AsString;

          Lgrd1paper.Caption:= FieldByName('GRD1PAPER').AsString;          //논문제목
          Lunivscore.Caption:= FieldByName('UNIVSCORE').AsString;          //대학교 학과득점
          Lunivscoret.Caption:= FieldByName('UNIVSCORET').AsString;        //대학교 학과만점
          Lbadgrd1score.Caption:= FieldByName('BADUNIVSCORE').AsString;    //편입대학교 학과득점
          Lbadunivscoret.Caption:= FieldByName('BADUNIVSCORET').AsString;  //편입대학교 학과만점
          Lgrd1score.Caption:= FieldByName('GRD1SCORE').AsString;          //대학원 학과득점
          Lgrd1scoret.Caption:= FieldByName('GRD1SCORET').AsString;        //대학원 학과만점

          //대학교 본교,분교 구분
               if FieldByName('UNIVWHERE').AsString = '1' then Lunivwhere.Caption:= '본교'
          else if FieldByName('UNIVWHERE').AsString = '2' then Lunivwhere.Caption:= '분교';

          //편입대학교 본교,분교 구분
               if FieldByName('BADUNIVWHERE').AsString = ''  then Lbadunivwhere.Caption:= ''
          else if FieldByName('BADUNIVWHERE').AsString = '1' then Lbadunivwhere.Caption:= '본교'
          else if FieldByName('BADUNIVWHERE').AsString = '2' then Lbadunivwhere.Caption:= '분교';

          //대학원 본교,분교 구분
               if FieldByName('GRD1WHERE').AsString = ''  then LGrd1where.Caption:= ''
          else if FieldByName('GRD1WHERE').AsString = '1' then LGrd1where.Caption:= '본교'
          else if FieldByName('GRD1WHERE').AsString = '2' then LGrd1where.Caption:= '분교';

          //대학교 주,야간 구분
               if FieldByName('UNIVDAY').AsString = '1' then Lunivday.Caption:= '주간'
          else if FieldByName('UNIVDAY').AsString = '2' then Lunivday.Caption:= '야간';

          //편입대학교 주,야간 구분
               if FieldByName('BADUNIVDAY').AsString = ''  then Lbadunivday.Caption:= ''
          else if FieldByName('BADUNIVDAY').AsString = '1' then Lbadunivday.Caption:= '주간'
          else if FieldByName('BADUNIVDAY').AsString = '2' then Lbadunivday.Caption:= '야간';

          //대학원 주,야간 구분
               if FieldByName('GRD1DAY').AsString = ''  then Lgrd1day.Caption:= ''
          else if FieldByName('GRD1DAY').AsString = '1' then Lgrd1day.Caption:= '주간'
          else if FieldByName('GRD1DAY').AsString = '2' then Lgrd1day.Caption:= '야간';

          //고등학교 졸업 구분
               if FieldByName('HIGHGRAD').AsString = '1' then Lhighgrad.Caption:= '졸업'
          else if FieldByName('HIGHGRAD').AsString = '2' then Lhighgrad.Caption:= '중퇴'
          else if FieldByName('HIGHGRAD').AsString = '3' then Lhighgrad.Caption:= '수료'
          else if FieldByName('HIGHGRAD').AsString = '4' then Lhighgrad.Caption:= '졸예';

          //대학교 졸업 구분
               if FieldByName('UNIVGRAD').AsString = '1' then Lunivgrad.Caption:= '졸업'
          else if FieldByName('UNIVGRAD').AsString = '2' then Lunivgrad.Caption:= '중퇴'
          else if FieldByName('UNIVGRAD').AsString = '3' then Lunivgrad.Caption:= '수료'
          else if FieldByName('UNIVGRAD').AsString = '4' then Lunivgrad.Caption:= '졸예';

          //편입대학교 졸업 구분
               if FieldByName('BADUNIVGRD').AsString = ''  then Lbadunivgrad.Caption:= ''
          else if FieldByName('BADUNIVGRD').AsString = '1' then Lbadunivgrad.Caption:= '졸업'
          else if FieldByName('BADUNIVGRD').AsString = '2' then Lbadunivgrad.Caption:= '중퇴'
          else if FieldByName('BADUNIVGRD').AsString = '3' then Lbadunivgrad.Caption:= '수료'
          else if FieldByName('BADUNIVGRD').AsString = '4' then Lbadunivgrad.Caption:= '졸예';

          //대학원 졸업 구분
               if FieldByName('GRD1GRAD').AsString = ''  then Lgrd1grad.Caption:= ''
          else if FieldByName('GRD1GRAD').AsString = '1' then Lgrd1grad.Caption:= '졸업'
          else if FieldByName('GRD1GRAD').AsString = '2' then Lgrd1grad.Caption:= '중퇴'
          else if FieldByName('GRD1GRAD').AsString = '3' then Lgrd1grad.Caption:= '수료'
          else if FieldByName('GRD1GRAD').AsString = '4' then Lgrd1grad.Caption:= '졸예';

          Lhighiny1.Caption:= Copy(FieldByName('HIGHINYM').AsString,3,1);                 //고교입학년 1
          Lhighiny2.Caption:= Copy(FieldByName('HIGHINYM').AsString,4,1);                 //고교입학년 2
          Lhighinm1.Caption:= Copy(FieldByName('HIGHINYM').AsString,5,1);                 //고교입학월 1
          Lhighinm2.Caption:= Copy(FieldByName('HIGHINYM').AsString,6,1);                 //고교입학월 2

          LhighoutY1.Caption:= Copy(FieldByName('HIGHOUTYM').AsString,3,1);               //고교졸업년 1
          LhighoutY2.Caption:= Copy(FieldByName('HIGHOUTYM').AsString,4,1);               //고교졸업년 2
          Lhighoutm1.Caption:= Copy(FieldByName('HIGHOUTYM').AsString,5,1);               //고교졸업월 1
          Lhighoutm2.Caption:= Copy(FieldByName('HIGHOUTYM').AsString,6,1);               //고교졸업월 2

          Luniviny1.Caption:= Copy(FieldByName('UNIVINYM').AsString,3,1);                 //대학입학년 1
          Luniviny2.Caption:= Copy(FieldByName('UNIVINYM').AsString,4,1);                 //대학입학년 2
          Lunivinm1.Caption:= Copy(FieldByName('UNIVINYM').AsString,5,1);                 //대학입학월 1
          Lunivinm2.Caption:= Copy(FieldByName('UNIVINYM').AsString,6,1);                 //대학입학월 2

          Lunivouty1.Caption:= Copy(FieldByName('UNIVOUTYM').AsString,3,1);               //대학졸업년 1
          Lunivouty2.Caption:= Copy(FieldByName('UNIVOUTYM').AsString,4,1);               //대학졸업년 2
          Lunivoutm1.Caption:= Copy(FieldByName('UNIVOUTYM').AsString,5,1);               //대학졸업월 1
          Lunivoutm2.Caption:= Copy(FieldByName('UNIVOUTYM').AsString,6,1);               //대학졸업월 2

          Lbaduniviny1.Caption:= Copy(FieldByName('BADUNIVINYM').AsString,3,1);           //편입대학입학년 1
          Lbaduniviny2.Caption:= Copy(FieldByName('BADUNIVINYM').AsString,4,1);           //편입대학입학년 2
          Lbadunivinm1.Caption:= Copy(FieldByName('BADUNIVINYM').AsString,5,1);           //편입대학입학월 1
          Lbadunivinm2.Caption:= Copy(FieldByName('BADUNIVINYM').AsString,6,1);           //편입대학입학월 2

          Lbadunivouty1.Caption:= Copy(FieldByName('BADUNIVOUTYM').AsString,3,1);         //편입대학졸업년 1
          Lbadunivouty2.Caption:= Copy(FieldByName('BADUNIVOUTYM').AsString,4,1);         //편입대학졸업년 2
          Lbadunivoutm1.Caption:= Copy(FieldByName('BADUNIVOUTYM').AsString,5,1);         //편입대학졸업월 1
          Lbadunivoutm2.Caption:= Copy(FieldByName('BADUNIVOUTYM').AsString,6,1);         //편입대학졸업월 2

          Lgrd1iny1.Caption:= Copy(FieldByName('GRD1INYM').AsString,3,1);                 //대학원입학년 1
          Lgrd1iny2.Caption:= Copy(FieldByName('GRD1INYM').AsString,4,1);                 //대학원입학년 2
          Lgrd1inm1.Caption:= Copy(FieldByName('GRD1INYM').AsString,5,1);                 //대학원입학월 1
          Lgrd1inm2.Caption:= Copy(FieldByName('GRD1INYM').AsString,6,1);                 //대학원입학월 2

          Lgrd1outy1.Caption:= Copy(FieldByName('GRD1OUTYM').AsString,3,1);               //대학원졸업년 1
          Lgrd1outy2.Caption:= Copy(FieldByName('GRD1OUTYM').AsString,4,1);               //대학원졸업년 2
          Lgrd1outm1.Caption:= Copy(FieldByName('GRD1OUTYM').AsString,5,1);               //대학원졸업월 1
          Lgrd1outm2.Caption:= Copy(FieldByName('GRD1OUTYM').AsString,6,1);               //대학원졸업월 2

          // 자격면허1
               if FieldByName('LICENCE1NAME').AsString = ''  then Llicence1.Caption:=''
          else if FieldByName('LICENCE1NAME').AsString <> '' then Llicence1.Caption:= FieldByName('LICENCE1NAME').AsString;

          // 자격면허2
               if FieldByName('LICENCE1NAME2').AsString = ''  then Llicence2.Caption:=''
          else if FieldByName('LICENCE1NAME2').AsString <> '' then Llicence2.Caption:= FieldByName('LICENCE1NAME2').AsString;

          //보훈
               if FieldByName('BOHUN').AsString = '1' then Lbohun.Caption:= '대상'
          else if FieldByName('BOHUN').AsString = '2' then Lbohun.Caption:= '비대상';

          Lengscore.Caption:= FieldByName('ENGSCORE').AsString;                           // 토익점수

          // 토익 취득년월
          if FieldByName('ENGYMD').AsString <> '' then
          begin
               Lengy.Caption:= Copy(FieldByName('ENGYMD').AsString,1,4);
               Lengm.Caption:= Copy(FieldByName('ENGYMD').AsString,5,2);
          end
          else
          begin
               Lengy.Caption:= '';
               Lengm.Caption:= '';
          end;

          //////////////////////////////////////////////////////////////////////////////////////////////
          //2006년 추가사항                                                                           //
          //////////////////////////////////////////////////////////////////////////////////////////////
          LETCLANG.Caption := FieldByName('ETCLANG').AsString;
          LETCLANG_POINT.Caption:= FieldByName('ETCLANG_POINT').AsString;                 // 기타외국어점수

          // 기타외국어 취득년월
          LETCLANG_Y.Caption:= Copy(FieldByName('ETCLANGYM').AsString,1,4);
          LETCLANG_M.Caption:= Copy(FieldByName('ETCLANGYM').AsString,5,2);
          //////////////////////////////////////////////////////////////////////////////////////////////


          // 병역구분
               if FieldByName('ARMYKINDNAME').AsString = ''  then Larmykind.Caption:=''
          else if FieldByName('ARMYKINDNAME').AsString <> '' then Larmykind.Caption:= FieldByName('ARMYKINDNAME').AsString;

          // 병역계급
               if FieldByName('armygradename').AsString = ''  then Larmygrade.Caption:=''
          else if FieldByName('armygradename').AsString <> '' then Larmygrade.Caption:= FieldByName('armygradename').AsString;

          // 병역 면제 사유
               if FieldByName('ARMYEXCEPTNAME').AsString = ''  then Larmyexcept.Caption:=''
          else if FieldByName('ARMYEXCEPTNAME').AsString <> '' then Larmyexcept.Caption:= FieldByName('ARMYEXCEPTNAME').AsString;

          if  Length(FieldByName('ARMYINYMD').AsString) <> 6 then
          begin
               Larmyinyy.Caption:='';
               Larmyinmm.Caption:='';
          end
          else
          begin
               Larmyinyy.Caption:= Copy(FieldByName('ARMYINYMD').AsString,1,4);    //입대년
               Larmyinmm.Caption:= Copy(FieldByName('ARMYINYMD').AsString,5,2);    //입대월
          end;

          if Length(FieldByName('ARMYOUTYMD').AsString) <> 6 then
          begin
               Larmyoutyy.Caption:='';
               Larmyoutmm.Caption:='';
          end
          else
          begin
               Larmyoutyy.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,1,4);  //제대년
               Larmyoutmm.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,5,2);  //제대월
          end;
          // 병역기간
          if ((FieldByName('ARMYINYMD').AsString <> '') or (FieldByName('ARMYOUTYMD').AsString <> '')) then
          begin
               with PrintForm.Qry_univ  do
               begin
                    Close;
                    Sql.Clear;
                    Sql.Add('select  TRUNC(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMM''),to_date(armyinymd,''YYYYMM''))/12) YY,'+
                            '        MOD(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMM''),to_date(armyinymd,''YYYYMM'')),12) MM   '+
                            'from prectmas                                                                                         '+
                            'where   armyoutymd <> ''01''                                                                          '+
                            '  and   armyinymd  <> ''01''                                                                          '+
                            '  and rid = '''+ PrintForm.Qry_recuit.FieldByName('RID').AsString +'''');
                    Open;

                         if FieldByName('YY').AsString = ''  then Lyy.Caption:=''
                    else if FieldByName('YY').AsString <> '' then Lyy.Caption:= FieldByName('YY').AsString;

                         if FieldByName('MM').AsString = ''  then Lmm.Caption:=''
                    else if FieldByName('MM').AsString <> '' then Lmm.Caption:= FieldByName('MM').AsString;

                    Close;
               end;  // Qry_univ with ~ end
          end
          else
          begin
               Lyy.Caption:='';
               Lmm.Caption:='';
          end;

          // 가족1
               if FieldByName('F1TYPENAME').AsString = ''  then Lf1type.Caption:=''
          else if FieldByName('F1TYPENAME').AsString <> '' then Lf1type.Caption:= FieldByName('F1TYPENAME').AsString;

          // 성명
          Lf1name.Caption:= FieldByName('F1NAME').AsString;
          // 연령
          Lf1age.Caption:= FieldByName('F1AGE').AsString;
          // 학력
               if FieldByName('F1GRADENAME').AsString = ''  then Lf1grade.Caption:=''
          else if FieldByName('F1GRADENAME').AsString <> '' then Lf1grade.Caption:= FieldByName('F1GRADENAME').AsString;

          // 가족1 근무처/직위
          Lf1work.Caption:= FieldByName('F1WORK').AsString;

          // 가족1 동거여부
               if FieldByName('F1WITH').AsString = ''  then Lf5with.Caption:= ''
          else if FieldByName('F1WITH').AsString = '1' then Lf1with.Caption:= '동거'
          else if FieldByName('F1WITH').AsString = '2' then Lf1with.Caption:= '비동거';

          // 가족1 연락처
          Lf1tel.Caption:= FieldByName('F1TEL').AsString;

          // 가족2
               if FieldByName('F2TYPENAME').AsString = ''  then Lf2type.Caption:=''
          else if FieldByName('F2TYPENAME').AsString <> '' then Lf2type.Caption:= FieldByName('F2TYPENAME').AsString;

          // 성명
          Lf2name.Caption:= FieldByName('F2NAME').AsString;
          // 연령
          Lf2age.Caption:= FieldByName('F2AGE').AsString;
          // 학력
               if FieldByName('F2GRADENAME').AsString = ''  then Lf2grade.Caption:=''
          else if FieldByName('F2GRADENAME').AsString <> '' then Lf2grade.Caption:= FieldByName('F2GRADENAME').AsString;

          // 근무처/직위
          Lf2work.Caption:= FieldByName('F2WORK').AsString;

          // 동거여부
               if FieldByName('F2WITH').AsString = ''  then Lf5with.Caption:= ''
          else if FieldByName('F2WITH').AsString = '1' then Lf2with.Caption:= '동거'
          else if FieldByName('F2WITH').AsString = '2' then Lf2with.Caption:= '비동거';

          // 연락처
          Lf2tel.Caption:= FieldByName('F2TEL').AsString;

          //////////////////////////////////////////////////////////////////////////
          // 가족3
               if FieldByName('F3TYPENAME').AsString = ''  then Lf3type.Caption:=''
          else if FieldByName('F3TYPENAME').AsString <> '' then Lf3type.Caption:= FieldByName('F3TYPENAME').AsString;

          // 성명
          Lf3name.Caption:= FieldByName('F3NAME').AsString;
          // 연령
          Lf3age.Caption:= FieldByName('F3AGE').AsString;
          // 학력
               if FieldByName('F3GRADENAME').AsString = ''  then Lf3grade.Caption:=''
          else if FieldByName('F3GRADENAME').AsString <> '' then Lf3grade.Caption:= FieldByName('F3GRADENAME').AsString;

          // 근무처/직위
          Lf3work.Caption:= FieldByName('F3WORK').AsString;

          // 동거여부
               if FieldByName('F3WITH').AsString = ''  then Lf3with.Caption:= ''
          else if FieldByName('F3WITH').AsString = '1' then Lf3with.Caption:= '동거'
          else if FieldByName('F3WITH').AsString = '2' then Lf3with.Caption:= '비동거';

          // 연락처
          Lf3tel.Caption:= FieldByName('F3TEL').AsString;

           //////////////////////////////////////////////////////////////////////////
           // 가족4
               if FieldByName('F4TYPENAME').AsString = ''  then Lf4type.Caption:=''
          else if FieldByName('F4TYPENAME').AsString <> '' then Lf4type.Caption:= FieldByName('F4TYPENAME').AsString;

          // 성명
          Lf4name.Caption:= FieldByName('F4NAME').AsString;
          // 연령
          Lf4age.Caption:= FieldByName('F4AGE').AsString;
          // 학력
          // 학력
               if FieldByName('F4GRADENAME').AsString = ''  then Lf4grade.Caption:=''
          else if FieldByName('F4GRADENAME').AsString <> '' then Lf4grade.Caption:= FieldByName('F4GRADENAME').AsString;

          // 근무처/직위
          Lf4work.Caption:= FieldByName('F4WORK').AsString;

          // 동거여부
               if FieldByName('F4WITH').AsString = ''  then Lf4with.Caption:= ''
          else if FieldByName('F4WITH').AsString = '1' then Lf4with.Caption:= '동거'
          else if FieldByName('F4WITH').AsString = '2' then Lf4with.Caption:= '비동거';

          // 연락처
          Lf4tel.Caption:= FieldByName('F4TEL').AsString;

          // 가족5
               if FieldByName('F5TYPENAME').AsString = ''  then Lf5type.Caption:=''
          else if FieldByName('F5TYPENAME').AsString <> '' then Lf5type.Caption:= FieldByName('F5TYPENAME').AsString;

          // 성명
          Lf5name.Caption:= FieldByName('F5NAME').AsString;
          // 연령
          Lf5age.Caption:= FieldByName('F5AGE').AsString;
          // 학력
               if FieldByName('F5GRADENAME').AsString = ''  then Lf5grade.Caption:=''
          else if FieldByName('F5GRADENAME').AsString <> '' then Lf5grade.Caption:= FieldByName('F5GRADENAME').AsString;

          // 근무처/직위
          Lf5work.Caption:= FieldByName('F5WORK').AsString;

          // 동거여부
          if  FieldByName('F5WITH').AsString = '' then Lf5with.Caption:= ''
          else if  FieldByName('F5WITH').AsString = '1' then Lf5with.Caption:= '동거'
          else if FieldByName('F5WITH').AsString = '2' then Lf5with.Caption:= '비동거';

          // 연락처
          Lf5tel.Caption:= FieldByName('F5TEL').AsString;

          //자신의 강점
          QRMemo1.Lines.Clear;
          QRMemo1.Lines.Add(FieldByName('STRENGTH').AsString);

          //주요 경력 사항 1
          if FieldByName('CAR1WHERE').AsString <> '' then Lcar1where.Caption:= FieldByName('CAR1WHERE').AsString
          else                                            Lcar1where.Caption:='';

          if FieldByName('CAR1DATEFROM').AsString <> '' then Lcar1datefrom.Caption:= Copy(FieldByName('CAR1DATEFROM').AsString,1,4) + '년 '+
                                                                                     Copy(FieldByName('CAR1DATEFROM').AsString,5,2) + '월'
          else                                               Lcar1datefrom.Caption:= '';

          if  FieldByName('CAR1DATETO').AsString <> '' then Lcar1dateto.Caption:= Copy(FieldByName('CAR1DATETO').AsString,1,4) + '년 '+
                                                                                  Copy(FieldByName('CAR1DATETO').AsString,5,2) + '월'
          else                                              Lcar1dateto.Caption:='';

          if FieldByName('CAR1WORK').AsString <> '' then Lcar1work.Caption:= FieldByName('CAR1WORK').AsString
          else                                           Lcar1work.Caption:='';

          if FieldByName('CAR1PAYRA').AsString <> '' then Lcar1payra.Caption:= FieldByName('CAR1PAYRA').AsString
          else                                            Lcar1payra.Caption:='';

          //주요 경력 사항 2
          if FieldByName('CAR2WHERE').AsString <> '' then Lcar2where.Caption:= FieldByName('CAR2WHERE').AsString
          else                                            Lcar2where.Caption:='';

          if FieldByName('CAR2DATEFROM').AsString <> '' then Lcar2datefrom.Caption:= Copy(FieldByName('CAR2DATEFROM').AsString,1,4) + '년 '+
                                                                                     Copy(FieldByName('CAR2DATEFROM').AsString,5,2) + '월'
          else                                               Lcar2datefrom.Caption:= '';

          if  FieldByName('CAR2DATETO').AsString <> '' then Lcar2dateto.Caption:= Copy(FieldByName('CAR2DATETO').AsString,1,4) + '년 '+
                                                                                  Copy(FieldByName('CAR2DATETO').AsString,5,2) + '월'
          else                                              Lcar2dateto.Caption:='';

          if FieldByName('CAR2WORK').AsString <> '' then Lcar2work.Caption:= FieldByName('CAR2WORK').AsString
          else                                           Lcar2work.Caption:='';

          if FieldByName('CAR2PAYRA').AsString <> '' then Lcar2payra.Caption:= FieldByName('CAR2PAYRA').AsString
          else                                            Lcar2payra.Caption:='';

          //주요 경력 사항 3
          if FieldByName('CAR3WHERE').AsString <> '' then Lcar3where.Caption:= FieldByName('CAR3WHERE').AsString
          else                                            Lcar3where.Caption:='';

          if FieldByName('CAR3DATEFROM').AsString <> '' then Lcar3datefrom.Caption:= Copy(FieldByName('CAR3DATEFROM').AsString,1,4) + '년 '+
                                                                                     Copy(FieldByName('CAR3DATEFROM').AsString,5,2) + '월'
          else                                               Lcar3datefrom.Caption:= '';

          if  FieldByName('CAR3DATETO').AsString <> '' then Lcar3dateto.Caption:=  Copy(FieldByName('CAR3DATETO').AsString,1,4) + '년 '+
                                                                                   Copy(FieldByName('CAR3DATETO').AsString,5,2) + '월'
          else                                              Lcar3dateto.Caption:='';

          if FieldByName('CAR3WORK').AsString <> '' then Lcar3work.Caption:= FieldByName('CAR3WORK').AsString
          else                                           Lcar3work.Caption:='';

          if FieldByName('CAR3PAYRA').AsString <> '' then Lcar3payra.Caption:= FieldByName('CAR3PAYRA').AsString
          else                                            Lcar3payra.Caption:='';

          //주요 경력 사항 4
          if FieldByName('CAR4WHERE').AsString <> '' then Lcar4where.Caption:= FieldByName('CAR4WHERE').AsString
          else                                            Lcar4where.Caption:='';

          if FieldByName('CAR4DATEFROM').AsString <> '' then Lcar4datefrom.Caption:= Copy(FieldByName('CAR4DATEFROM').AsString,1,4) + '년 '+
                                                                                     Copy(FieldByName('CAR4DATEFROM').AsString,5,2) + '월'
          else                                               Lcar4datefrom.Caption:= '';

          if FieldByName('CAR4DATETO').AsString <> '' then Lcar4dateto.Caption:= Copy(FieldByName('CAR4DATETO').AsString,1,4) + '년 '+
                                                                                 Copy(FieldByName('CAR4DATETO').AsString,5,2) + '월'
          else                                             Lcar4dateto.Caption:='';

          if FieldByName('CAR4WORK').AsString <> '' then Lcar4work.Caption:= FieldByName('CAR4WORK').AsString
          else                                           Lcar4work.Caption:='';

          if FieldByName('CAR4PAYRA').AsString <> '' then Lcar4payra.Caption:= FieldByName('CAR4PAYRA').AsString
          else                                            Lcar4payra.Caption:='';

          Lrid1.Caption := Copy(FieldByName('rid').AsString,1,1);
          Lrid2.Caption := Copy(FieldByName('rid').AsString,2,1);
          Lrid3.Caption := Copy(FieldByName('rid').AsString,3,1);
          Lrid4.Caption := Copy(FieldByName('rid').AsString,4,1);
          Lrid5.Caption := Copy(FieldByName('rid').AsString,5,1);
          Lrid6.Caption := Copy(FieldByName('rid').AsString,6,1);
          Lrid7.Caption := Copy(FieldByName('rid').AsString,7,1);
          Lrid8.Caption := Copy(FieldByName('rid').AsString,8,1);
          Lrid9.Caption := Copy(FieldByName('rid').AsString,9,1);

          if FieldByName('obsyn').AsString = 'Y' then Lobsyn.Caption := '대상'
          else                                        Lobsyn.Caption := '비대상'
     end;
end;

procedure TPrintFormCarr.QuickRep1Preview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
     Fm_PreviewForm.Show;
end;

procedure TPrintFormCarr.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     with PrintForm.Qry_recuit  do
     begin
          //자기 소개서
          QRMemo2.Lines.Clear;
          QRMemo2.Lines.Text := FieldByName('SELFINFO').AsString;
          //희망 연봉
          if FieldByName('HOPEPAY').AsString <> '' then Lhopepay.Caption:=FieldByName('HOPEPAY').AsString
          else                                          Lhopepay.Caption:='';

          //입사 희망 시기
          if FieldByName('HOPEINYM').AsString <> '' then Lappindate.Caption:=COPY(FieldByName('HOPEINYM').AsString,1,4)+'년'+COPY(FieldByName('HOPEINYM').AsString,5,2)+'월'
          else                                           Lappindate.Caption:='';

          //2006 추가사항
               if  FieldByName('HOPE_PER').AsString = '1' then LHOPE_PER.Caption := '초순'
          else if  FieldByName('HOPE_PER').AsString = '2' then LHOPE_PER.Caption := '중순'
          else if  FieldByName('HOPE_PER').AsString = '3' then LHOPE_PER.Caption := '말'
          else                                                 LHOPE_PER.Caption := ''  ;

          //신장
          Lbodyheight.Caption:=FieldByName('BODYHEIGHT').AsString;
          //체중
          Lbodyweight.Caption:=FieldByName('BODYWEIGHT').AsString;
          //취미
          Linterest.Caption:=FieldByName('INTEREST').AsString;
          //접수일자
          LymdhY.Caption:=Copy(FieldByName('YMDHMS').AsString,1,4);
          Lymdhms1.Caption:=Copy(FieldByName('YMDHMS').AsString,5,2);
          Lymdhms2.Caption:=Copy(FieldByName('YMDHMS').AsString,7,2);
          //지원자
          Lfullname1.Caption:=FieldByName('FULLNAME').AsString;
     end;

          if QRMemo2.Lines.count >= 75 then QRMemo2.Font.Size := 5
     else if QRMemo2.Lines.count >= 65 then QRMemo2.Font.Size := 6
     else if QRMemo2.Lines.count >= 50 then QRMemo2.Font.Size := 7
     else if QRMemo2.Lines.count >= 47 then QRMemo2.Font.Size := 8
     else                                   QRMemo2.Font.Size := 9;
end;

end.
