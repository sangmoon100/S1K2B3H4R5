//신입사원
unit PIR20203A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, Grids, DBGrids, jpeg;

type
    TPrintFormNew = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRBand;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape23: TQRShape;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape70: TQRShape;
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
    QRLabel90: TQRLabel;
    Qry_recuit: TQuery;
    Qry_univ: TQuery;
    Lf1type: TQRLabel;
    Lf2type: TQRLabel;
    Lf3type: TQRLabel;
    Lf4type: TQRLabel;
    Lf5type: TQRLabel;
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
    QRSubDetail2: TQRSubDetail;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRLabel91: TQRLabel;
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
    QRLabel96: TQRLabel;
    Lismarried: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel100: TQRLabel;
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
    Label1: TLabel;
    Label2: TLabel;
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
    Lgubun: TQRLabel;
    Ldept: TQRLabel;
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
    QRShape35: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRImage2: TQRImage;
    QRShape12: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel55: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
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
    QRShape48: TQRShape;
    QRShape55: TQRShape;
    Llicence1: TQRLabel;
    Llicence2: TQRLabel;
    Lbohun: TQRLabel;
    Lengscore: TQRLabel;
    Lengy: TQRLabel;
    Lengm: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel116: TQRLabel;
    Larmykind: TQRLabel;
    Larmygrade: TQRLabel;
    Larmyexcept: TQRLabel;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
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
    QRShape87: TQRShape;
    QRShape89: TQRShape;
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
    QRShape27: TQRShape;
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
    QRShape103: TQRShape;
    QRLabel176: TQRLabel;
    Lbadunivname: TQRLabel;
    QRLabel143: TQRLabel;
    Lbadunvimajorid: TQRLabel;
    QRLabel97: TQRLabel;
    LApJobkind: TQRLabel;
    Laparea: TQRLabel;
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
    QRImage1: TQRImage;
    QRLabel5: TQRLabel;
    QRMemo2: TQRRichText;
    QRMemo1: TQRRichText;

    procedure QuickRep1Preview(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintFormNew: TPrintFormNew;
  BandCount,PageCount : Integer; //페이지 카운트 변수

implementation

{$R *.DFM}

uses
  PePrnview

procedure TPrintFormNew.QuickRep1Preview(Sender: TObject);
begin
    Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
    Fm_PreviewForm.Show;
//(uses절에   PePrnview; 추가하기)
end;

procedure TPrintFormNew.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Vdept    : string;
  VUNIVID  : string;
  A        : string;
  vprieod  : string;

begin
  with Qry_recuit  do
  begin
    Vdept := FieldByName('DEPT').AsString; // 응시부분

    if  Vdept = '1' then
      begin
        Ldept.Caption:= '경영관리';
      end
    else if Vdept = '2' then
      begin
        Ldept.Caption:= '마케팅';
      end
    else if Vdept = '3' then
      begin
        Ldept.Caption:= '기술';
      end
    else if Vdept = '4' then
      begin
        Ldept.Caption:= '전문연구요원(병특)';
      end;

    if FieldByName('APJOBKIND').AsString = '10' then
      begin
        LApJobkind.Caption:= '경영기획';
      end
    else if FieldByName('APJOBKIND').AsString = '11' then
      begin
        LApJobkind.Caption:= '경영지원';
      end
    else if FieldByName('APJOBKIND').AsString = '12' then
      begin
        LApJobkind.Caption:= 'Finance';
      end
    else if FieldByName('APJOBKIND').AsString = '20' then
      begin
        LApJobkind.Caption:= '마케팅';
      end
    else if FieldByName('APJOBKIND').AsString = '30' then
     begin
       LApJobkind.Caption:= 'NW계획';
     end
    else if FieldByName('APJOBKIND').AsString = '31' then
     begin
       LApJobkind.Caption:= 'NW운용';
     end
    else if FieldByName('APJOBKIND').AsString = '32' then
     begin
       LApJobkind.Caption:= '영업기술지원';
     end
    else if FieldByName('APJOBKIND').AsString = '33' then
     begin
       LApJobkind.Caption:= 'IT';
     end
    else if FieldByName('APJOBKIND').AsString = '40' then
     begin
       LApJobkind.Caption:= '연구개발';
     end
    else if FieldByName('APJOBKIND').AsString = '70' then
     begin
       LApJobkind.Caption:= '보안CERT';
     end
    else if FieldByName('APJOBKIND').AsString = '71' then
     begin
       LApJobkind.Caption:= 'EDW';
     end
    else if FieldByName('APJOBKIND').AsString = '72' then
     begin
       LApJobkind.Caption:= 'ERP';
     end
    else if FieldByName('APJOBKIND').AsString = '80' then
     begin
       LApJobkind.Caption:= '사업';
     end
    else if FieldByName('APJOBKIND').AsString = '81' then
     begin
       LApJobkind.Caption:= '컨텐츠';
     end;

    if FieldByName('APAREA').AsString = '1' then
      begin
        Laparea.Caption:= '서울/수도권';
      end
    else if FieldByName('APAREA').AsString = '2' then
      begin
        Laparea.Caption:= '부산';
      end
    else if FieldByName('APAREA').AsString = '3' then
      begin
        Laparea.Caption:= '충청';
      end
    else if FieldByName('APAREA').AsString = '4' then
      begin
        Laparea.Caption:= '경북';
      end
     else if FieldByName('APAREA').AsString = '5' then
      begin
        Laparea.Caption:= '호남';
      end;
    // 사진
    if fileexists('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString) then
      begin
        QRImage2.Picture.LoadFromFile('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString);
       end
    else
      begin
        QRImage2.Picture := nil;
      end;

      Lfullname.Caption:= FieldByName('FULLNAME').AsString;           //이름
      Ltel.Caption:= FieldByName('TEL').AsString;                     //전화
      Lj1.Caption:= Copy(FieldByName('REGNO').AsString,1,1);          //주민번호 첫자리
      Lj2.Caption:= Copy(FieldByName('REGNO').AsString,2,1);
      Lj3.Caption:= Copy(FieldByName('REGNO').AsString,3,1);
      Lj4.Caption:= Copy(FieldByName('REGNO').AsString,4,1);
      Lj5.Caption:= Copy(FieldByName('REGNO').AsString,5,1);
      Lj6.Caption:= Copy(FieldByName('REGNO').AsString,6,1);
      Lj7.Caption:= Copy(FieldByName('REGNO').AsString,8,1);
      Lj8.Caption:= Copy(FieldByName('REGNO').AsString,9,1);
      Lj9.Caption:= Copy(FieldByName('REGNO').AsString,10,1);
      Lj10.Caption:= Copy(FieldByName('REGNO').AsString,11,1);
      Lj11.Caption:= Copy(FieldByName('REGNO').AsString,12,1);
      Lj12.Caption:= Copy(FieldByName('REGNO').AsString,13,1);
      Lj13.Caption:= Copy(FieldByName('REGNO').AsString,14,1);
      Lzip1.Caption:= Copy(FieldByName('ZIPCODE').AsString,1,3);      //우편번호
      Lzip2.Caption:= Copy(FieldByName('ZIPCODE').AsString,4,3);
      Laddress.Caption:= FieldByName('ADDRESS').AsString;             //주소
      LMobile1.Caption:= FieldByName('MOBILE').AsString;              //이동전화

      Lemail.Caption:= FieldByName('EMAIL').AsString;                  //이메일
      Lhighname.Caption:= FieldByName('HIGHNAME').AsString;            //고등학교명
      Lunivname.Caption:= FieldByName('UNIVNAME').AsString;            //대학교명
      Lbadunivname.Caption:= FieldByName('BADUNIVNAME').AsString;      //편입전대학교명
      Lgrdname.Caption:= FieldByName('GRD1NAME').AsString;             //대학원명
      Lunvimajorid.Caption:= FieldByName('UNIVMAJORNAME').AsString;    //대학전공
      Lbadunvimajorid.Caption:= FieldByName('BADUNIVMAJOR').AsString;//편입전대학전공
      Lgrd1majorid.Caption:= FieldByName('GRD1MAJORNAME').AsString;    //대학원전공

      Lgrd1paper.Caption:= FieldByName('GRD1PAPER').AsString;          //논문제목
      Lunivscore.Caption:= FieldByName('UNIVSCORE').AsString;          //대학교 학과득점
      Lunivscoret.Caption:= FieldByName('UNIVSCORET').AsString;        //대학교 학과만점
      Lbadgrd1score.Caption:= FieldByName('BADUNIVSCORE').AsString;    //편입대학교 학과득점
      Lbadunivscoret.Caption:= FieldByName('BADUNIVSCORET').AsString;  //편입대학교 학과만점
      Lgrd1score.Caption:= FieldByName('GRD1SCORE').AsString;          //대학원 학과득점
      Lgrd1scoret.Caption:= FieldByName('GRD1SCORET').AsString;        //대학원 학과만점

       //대학교 본교,분교 구분
       if  FieldByName('UNIVWHERE').AsString = '1' then
         begin
           Lunivwhere.Caption:= '본교';
         end
       else if FieldByName('UNIVWHERE').AsString = '2' then
         begin
           Lunivwhere.Caption:= '분교';
         end;

       //편입대학교 본교,분교 구분
       if  FieldByName('BADUNIVWHERE').AsString = '' then
          Lbadunivwhere.Caption:= ''
       else if  FieldByName('BADUNIVWHERE').AsString = '1' then
         begin
           Lbadunivwhere.Caption:= '본교';
         end
       else if FieldByName('BADUNIVWHERE').AsString = '2' then
         begin
           Lbadunivwhere.Caption:= '분교';
         end;

       //대학원 본교,분교 구분
       if  FieldByName('GRD1WHERE').AsString = '' then
         begin
           LGrd1where.Caption:= '';
         end
       else if  FieldByName('GRD1WHERE').AsString = '1' then
         begin
           LGrd1where.Caption:= '본교';
         end
       else if FieldByName('GRD1WHERE').AsString = '2' then
         begin
           LGrd1where.Caption:= '분교';
         end;

       //대학교 주,야간 구분
       if  FieldByName('UNIVDAY').AsString = '1' then
         begin
           Lunivday.Caption:= '주간';
         end
       else if FieldByName('UNIVDAY').AsString = '2' then
         begin
           Lunivday.Caption:= '야간';
         end;

       //편입대학교 주,야간 구분
       if  FieldByName('BADUNIVDAY').AsString = '' then
         begin
           Lbadunivday.Caption:= '';
         end
       else if  FieldByName('BADUNIVDAY').AsString = '1' then
         begin
           Lbadunivday.Caption:= '주간';
         end
       else if FieldByName('BADUNIVDAY').AsString = '2' then
         begin
           Lbadunivday.Caption:= '야간';
         end;

       //대학원 주,야간 구분
       if  FieldByName('GRD1DAY').AsString = '' then
         begin
           Lgrd1day.Caption:= '';
         end
       else if  FieldByName('GRD1DAY').AsString = '1' then
         begin
           Lgrd1day.Caption:= '주간';
         end
       else if FieldByName('GRD1DAY').AsString = '2' then
         begin
           Lgrd1day.Caption:= '야간';
         end;

       //고등학교 졸업 구분
       if  FieldByName('HIGHGRAD').AsString = '1' then
         begin
           Lhighgrad.Caption:= '졸업';
         end
       else if FieldByName('HIGHGRAD').AsString = '2' then
         begin
           Lhighgrad.Caption:= '중퇴';
         end
       else if FieldByName('HIGHGRAD').AsString = '3' then
         begin
           Lhighgrad.Caption:= '수료';
         end
       else if FieldByName('HIGHGRAD').AsString = '4' then
         begin
           Lhighgrad.Caption:= '졸예';
         end;

       //대학교 졸업 구분
       if  FieldByName('UNIVGRAD').AsString = '1' then
         begin
           Lunivgrad.Caption:= '졸업';
         end
       else if FieldByName('UNIVGRAD').AsString = '2' then
         begin
           Lunivgrad.Caption:= '중퇴';
         end
       else if FieldByName('UNIVGRAD').AsString = '3' then
         begin
           Lunivgrad.Caption:= '수료';
         end
       else if FieldByName('UNIVGRAD').AsString = '4' then
         begin
           Lunivgrad.Caption:= '졸예';
         end;

      //편입대학교 졸업 구분
      if FieldByName('BADUNIVGRD').AsString = '' then
         begin
           Lbadunivgrad.Caption:= '';
         end
      else if  FieldByName('BADUNIVGRD').AsString = '1' then
         begin
           Lbadunivgrad.Caption:= '졸업';
         end
       else if FieldByName('BADUNIVGRD').AsString = '2' then
         begin
           Lbadunivgrad.Caption:= '중퇴';
         end
       else if FieldByName('BADUNIVGRD').AsString = '3' then
         begin
           Lbadunivgrad.Caption:= '수료';
         end
       else if FieldByName('BADUNIVGRD').AsString = '4' then
         begin
           Lbadunivgrad.Caption:= '졸예';
         end;

       //대학원 졸업 구분
       if  FieldByName('GRD1GRAD').AsString = '' then
         begin
           Lgrd1grad.Caption:= '';
         end
       else if  FieldByName('GRD1GRAD').AsString = '1' then
         begin
           Lgrd1grad.Caption:= '졸업';
         end
       else if FieldByName('GRD1GRAD').AsString = '2' then
         begin
           Lgrd1grad.Caption:= '중퇴';
         end
       else if FieldByName('GRD1GRAD').AsString = '3' then
         begin
           Lgrd1grad.Caption:= '수료';
         end
       else if FieldByName('GRD1GRAD').AsString = '4' then
         begin
           Lgrd1grad.Caption:= '졸예';
         end;

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
      if FieldByName('LICENCE1NAME').AsString = '' then
        begin
          Llicence1.Caption:='';
        end
      else if FieldByName('LICENCE1NAME').AsString <> '' then
        begin
          Llicence1.Caption:= FieldByName('LICENCE1NAME').AsString;
        end;

      // 자격면허2
      if FieldByName('LICENCE1NAME2').AsString = '' then
        begin
          Llicence2.Caption:='';
        end
      else if FieldByName('LICENCE1NAME2').AsString <> '' then
        begin
          Llicence2.Caption:= FieldByName('LICENCE1NAME2').AsString;
        end;

     //보훈
      if  FieldByName('BOHUN').AsString = '1' then
        begin
          Lbohun.Caption:= '대상';
        end
      else if FieldByName('BOHUN').AsString = '2' then
        begin
          Lbohun.Caption:= '비대상';
        end;

      Lengscore.Caption:= FieldByName('ENGSCORE').AsString;                           // 토익점수

      // 토익 취득년월
      Lengy.Caption:= Copy(FieldByName('ENGYMD').AsString,1,4);
      Lengm.Caption:= Copy(FieldByName('ENGYMD').AsString,5,2);

      // 병역구분
      if FieldByName('ARMYKINDNAME').AsString = '' then
        begin
          Larmykind.Caption:='';
        end
      else if FieldByName('ARMYKINDNAME').AsString <> '' then
        begin
          Larmykind.Caption:= FieldByName('ARMYKINDNAME').AsString;
        end;

      // 병역계급
      if FieldByName('ARMYGRADE').AsString = '' then
        begin
          Larmygrade.Caption:='';
        end
      else if FieldByName('ARMYGRADE').AsString <> '' then
        begin
          Larmygrade.Caption:= FieldByName('ARMYGRADE').AsString;
        end;

      // 병역 면제 사유
      if FieldByName('ARMYEXCEPTNAME').AsString = '' then
        begin
          Larmyexcept.Caption:='';
        end
      else if FieldByName('ARMYEXCEPTNAME').AsString <> '' then
        begin
          Larmyexcept.Caption:= FieldByName('ARMYEXCEPTNAME').AsString;
        end;
      if  Length(FieldByName('ARMYINYMD').AsString) <> 8 then
      begin
        Larmyinyy.Caption:='';
        Larmyinmm.Caption:='';
      end
      else begin
        Larmyinyy.Caption:= Copy(FieldByName('ARMYINYMD').AsString,1,4);    //입대년
        Larmyinmm.Caption:= Copy(FieldByName('ARMYINYMD').AsString,5,2);    //입대월
      end;

      if Length(FieldByName('ARMYOUTYMD').AsString) <>8 then
      begin
         Larmyoutyy.Caption:='';
         Larmyoutmm.Caption:='';
      end
      else begin
        Larmyoutyy.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,1,4);  //제대년
        Larmyoutmm.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,5,2);  //제대월
      end;
      // 병역기간
      if ((FieldByName('ARMYINYMD').AsString <> '') or (FieldByName('ARMYOUTYMD').AsString <> '')) then
        begin
          with Qry_univ  do
            begin
              Close;
              Sql.Clear;
              Sql.Add('select  TRUNC(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMMDD''),to_date(armyinymd,''YYYYMMDD''))/12) YY,'+
                      '        MOD(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMMDD''),to_date(armyinymd,''YYYYMMDD'')),12) MM   '+
                      'from prectmas                                                                                         '+
                      'where   armyoutymd <> ''01''                                                                          '+
                      '  and   armyinymd  <> ''01''                                                                          '+
                      '  and rid = '''+ Qry_recuit.FieldByName('RID').AsString +'''');
              Open;

              if FieldByName('YY').AsString = '' then
                begin
                  Lyy.Caption:='';
                end
              else if FieldByName('YY').AsString <> '' then
                begin
                  Lyy.Caption:= FieldByName('YY').AsString;
                end;

              if FieldByName('MM').AsString = '' then
                begin
                  Lmm.Caption:='';
                end
              else if FieldByName('MM').AsString <> '' then
                begin
                  Lmm.Caption:= FieldByName('MM').AsString;
                end;

              Close;
            end;  // Qry_univ with ~ end
          end
      else
        begin
          Lyy.Caption:='';
          Lmm.Caption:='';
        end;

       // 가족1
       if FieldByName('F1TYPENAME').AsString = '' then
         begin
           Lf1type.Caption:='';
         end
       else if FieldByName('F1TYPENAME').AsString <> '' then
         begin
           Lf1type.Caption:= FieldByName('F1TYPENAME').AsString;
         end;

        // 성명
        Lf1name.Caption:= FieldByName('F1NAME').AsString;
        // 연령
        Lf1age.Caption:= FieldByName('F1AGE').AsString;
        // 학력
        if FieldByName('F1GRADENAME').AsString = '' then
          begin
            Lf1grade.Caption:='';
          end
        else if FieldByName('F1GRADENAME').AsString <> '' then
          begin
            Lf1grade.Caption:= FieldByName('F1GRADENAME').AsString;
          end;

        // 가족1 근무처/직위
        Lf1work.Caption:= FieldByName('F1WORK').AsString;

        // 가족1 동거여부
        if FieldByName('F1WITH').AsString = '' then
             begin
               Lf5with.Caption:= '';
             end
        else if  FieldByName('F1WITH').AsString = '1' then
          begin
            Lf1with.Caption:= '동거';
          end
        else if FieldByName('F1WITH').AsString = '2' then
          begin
            Lf1with.Caption:= '비동거';
          end;

        // 가족1 연락처
        Lf1tel.Caption:= FieldByName('F1TEL').AsString;

     //////////////////////////////////////////////////////////////////////////
        // 가족2
        if FieldByName('F2TYPENAME').AsString = '' then
          begin
            Lf2type.Caption:='';
          end
        else if FieldByName('F2TYPENAME').AsString <> '' then
          begin
            Lf2type.Caption:= FieldByName('F2TYPENAME').AsString;
          end;

        // 성명
        Lf2name.Caption:= FieldByName('F2NAME').AsString;
        // 연령
        Lf2age.Caption:= FieldByName('F2AGE').AsString;
        // 학력
        if FieldByName('F2GRADENAME').AsString = '' then
          begin
            Lf2grade.Caption:='';
          end
        else if FieldByName('F2GRADENAME').AsString <> '' then
          begin
            Lf2grade.Caption:= FieldByName('F2GRADENAME').AsString;
          end;

        // 근무처/직위
        Lf2work.Caption:= FieldByName('F2WORK').AsString;

        // 동거여부
        if FieldByName('F2WITH').AsString = '' then
          begin
            Lf5with.Caption:= '';
          end
        else if  FieldByName('F2WITH').AsString = '1' then
          begin
            Lf2with.Caption:= '동거';
          end
        else if FieldByName('F2WITH').AsString = '2' then
          begin
            Lf2with.Caption:= '비동거';
          end;

        // 연락처
        Lf2tel.Caption:= FieldByName('F2TEL').AsString;

        //////////////////////////////////////////////////////////////////////////
        // 가족3
        if FieldByName('F3TYPENAME').AsString = '' then
          begin
            Lf3type.Caption:='';
          end
        else if FieldByName('F3TYPENAME').AsString <> '' then
          begin
            Lf3type.Caption:= FieldByName('F3TYPENAME').AsString;
          end;

       // 성명
       Lf3name.Caption:= FieldByName('F3NAME').AsString;
       // 연령
       Lf3age.Caption:= FieldByName('F3AGE').AsString;
       // 학력
       if FieldByName('F3GRADENAME').AsString = '' then
         begin
           Lf3grade.Caption:='';
         end
       else if FieldByName('F3GRADENAME').AsString <> '' then
         begin
           Lf3grade.Caption:= FieldByName('F3GRADENAME').AsString;
         end;

       // 근무처/직위
       Lf3work.Caption:= FieldByName('F3WORK').AsString;

       // 동거여부
       if FieldByName('F3WITH').AsString = '' then
         begin
           Lf3with.Caption:= '';
         end
       else if  FieldByName('F3WITH').AsString = '1' then
         begin
           Lf3with.Caption:= '동거';
         end
       else if FieldByName('F3WITH').AsString = '2' then
         begin
           Lf3with.Caption:= '비동거';
         end;

       // 연락처
       Lf3tel.Caption:= FieldByName('F3TEL').AsString;

        //////////////////////////////////////////////////////////////////////////
        // 가족4
        if FieldByName('F4TYPENAME').AsString = '' then
          begin
            Lf4type.Caption:='';
          end
        else if FieldByName('F4TYPENAME').AsString <> '' then
          begin
            Lf4type.Caption:= FieldByName('F4TYPENAME').AsString;
          end;

        // 성명
        Lf4name.Caption:= FieldByName('F4NAME').AsString;
        // 연령
        Lf4age.Caption:= FieldByName('F4AGE').AsString;
        // 학력
        // 학력
        if FieldByName('F4GRADENAME').AsString = '' then
          begin
            Lf4grade.Caption:='';
          end
        else if FieldByName('F4GRADENAME').AsString <> '' then
          begin
            Lf4grade.Caption:= FieldByName('F4GRADENAME').AsString;
          end;

        // 근무처/직위
        Lf4work.Caption:= FieldByName('F4WORK').AsString;

        // 동거여부
        if FieldByName('F4WITH').AsString = '' then
          begin
            Lf4with.Caption:= '';
          end
        else if  FieldByName('F4WITH').AsString = '1' then
          begin
            Lf4with.Caption:= '동거';
          end
        else if FieldByName('F4WITH').AsString = '2' then
          begin
            Lf4with.Caption:= '비동거';
          end;

        // 연락처
        Lf4tel.Caption:= FieldByName('F4TEL').AsString;

        //////////////////////////////////////////////////////////////////////////
        // 가족5
        if FieldByName('F5TYPENAME').AsString = '' then
          begin
            Lf5type.Caption:='';
          end
        else if FieldByName('F5TYPENAME').AsString <> '' then
          begin
            Lf5type.Caption:= FieldByName('F5TYPENAME').AsString;
          end;

        // 성명
        Lf5name.Caption:= FieldByName('F5NAME').AsString;
        // 연령
        Lf5age.Caption:= FieldByName('F5AGE').AsString;
        // 학력
        if FieldByName('F5GRADENAME').AsString = '' then
          begin
            Lf5grade.Caption:='';
          end
        else if FieldByName('F5GRADENAME').AsString <> '' then
          begin
            Lf5grade.Caption:= FieldByName('F5GRADENAME').AsString;
          end;

        // 근무처/직위
        Lf5work.Caption:= FieldByName('F5WORK').AsString;

        // 동거여부
        if  FieldByName('F5WITH').AsString = '' then
          begin
            Lf5with.Caption:= '';
          end
        else if  FieldByName('F5WITH').AsString = '1' then
          begin
            Lf5with.Caption:= '동거';
          end
        else if FieldByName('F5WITH').AsString = '2' then
          begin
            Lf5with.Caption:= '비동거';
          end;

        // 연락처
        Lf5tel.Caption:= FieldByName('F5TEL').AsString;

        //자신의 강점
        QRMemo1.Lines.Clear;
        QRMemo1.Lines.Add(FieldByName('STRENGTH').AsString);

    ///////////////////////////////////////////////
  end;  // Qry_recuit with ~ end


end;


procedure TPrintFormNew.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

end;

//자기 소개서
procedure TPrintFormNew.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 with Qry_recuit  do
  begin
    //자기 소개서
    QRMemo2.Lines.Clear;
    QRMemo2.Lines.Add(FieldByName('SELFINFO').AsString);
    //신장
    Lbodyheight.Caption:=FieldByName('BODYHEIGHT').AsString;
    //체중
    Lbodyweight.Caption:=FieldByName('BODYWEIGHT').AsString;
    //혼인여부

    if  FieldByName('ISMARRIED').AsString = '' then
       Lismarried.Caption :=  '';
       
    if  FieldByName('ISMARRIED').AsString = '1' then
      begin
        Lismarried.Caption:= '미혼';
      end
      else if FieldByName('ISMARRIED').AsString = '2' then
      begin
        Lismarried.Caption:= '기혼';
      end;
    //취미
    Linterest.Caption:=FieldByName('INTEREST').AsString;
    //접수일자
    Lymdhms1.Caption:=Copy(FieldByName('YMDHMS').AsString,5,2);
    Lymdhms2.Caption:=Copy(FieldByName('YMDHMS').AsString,7,2);
    //지원자
    Lfullname1.Caption:=FieldByName('FULLNAME').AsString;
  end;  // Qry_recuit with ~ end
end;

end.
