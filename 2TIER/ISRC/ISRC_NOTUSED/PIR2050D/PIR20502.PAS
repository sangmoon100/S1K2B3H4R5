//���Ի��
unit pir20502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, Grids, DBGrids, jpeg;

type
    TPrintForm = class(TForm)
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
    v: TQRSubDetail;
    QRShape69: TQRShape;
    QRShape71: TQRShape;
    QRLabel91: TQRLabel;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape85: TQRShape;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
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
    QRImage1: TQRImage;
    QRLabel5: TQRLabel;
    QRMemo2: TQRRichText;
    QRMemo1: TQRRichText;
    QRShape29: TQRShape;
    QRLabel90: TQRLabel;
    QRShape28: TQRShape;
    Lobsyn: TQRLabel;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel105: TQRLabel;
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
    QRLabel97: TQRLabel;
    QRShape88: TQRShape;
    QRLabel103: TQRLabel;
    LUNIVMINORID: TQRLabel;
    QRLabel61: TQRLabel;
    LETCLANG: TQRLabel;
    LETCLANG_POINT: TQRLabel;
    LETCLANG_Y: TQRLabel;
    QRLabel115: TQRLabel;
    LETCLANG_M: TQRLabel;
    QRLabel132: TQRLabel;
    QRShape87: TQRShape;
    Lgubun: TQRLabel;
    Laparea: TQRLabel;
    Lfullname: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRLabel100: TQRLabel;
    Lrid: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel133: TQRLabel;
    LREGNO: TQRLabel;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;

    procedure QuickRep1Preview(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure vBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;
  BandCount,PageCount : Integer; //������ ī��Ʈ ����

implementation

{$R *.DFM}

uses
  PePrnview, pir20501;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
    Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
    Fm_PreviewForm.Show;
//(uses����   PePrnview; �߰��ϱ�)
end;

procedure TPrintForm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Vdept    : string;
  VUNIVID  : string;
  A        : string;
  vprieod  : string;
  iJPG      : TJPEGImage;
  iBMP      : TBitmap;
  iPIC      : TPicture;
//  stream    : TMemoryStream;
begin
     with Qry_recuit  do
     begin
{          Vdept := FieldByName('DEPT').AsString; // ���úκ�

               if Vdept = '01' then Ldept.Caption:= '�濵����'
          else if Vdept = '02' then Ldept.Caption:= '������'
          else if Vdept = '03' then Ldept.Caption:= '�Ż��'
          else if Vdept = '04' then Ldept.Caption:= '����'
          else if Vdept = '05' then Ldept.Caption:= '���'
          else if Vdept = '06' then Ldept.Caption:= 'NI���/����'
          else if Vdept = '07' then Ldept.Caption:= '����/�������'
          else if Vdept = '08' then Ldept.Caption:= '���α��'
          else if Vdept = '09' then Ldept.Caption:= 'ȸ��'
          else if Vdept = '10' then Ldept.Caption:= '���������'
          else if Vdept = '11' then Ldept.Caption:= '���ȫ��'
          else if Vdept = '12' then Ldept.Caption:= '���÷���/������';

         {      if FieldByName('APJOBKIND').AsString = '11' then LApJobkind.Caption:= 'ȸ��'
          else if FieldByName('APJOBKIND').AsString = '12' then LApJobkind.Caption:= '��������'
          else if FieldByName('APJOBKIND').AsString = '13' then LApJobkind.Caption:= '����'
          else if FieldByName('APJOBKIND').AsString = '14' then LApJobkind.Caption:= '���'
          else if FieldByName('APJOBKIND').AsString = '15' then LApJobkind.Caption:= '���������ȹ'
          else if FieldByName('APJOBKIND').AsString = '16' then LApJobkind.Caption:= '����ȭ����'
          else if FieldByName('APJOBKIND').AsString = '17' then LApJobkind.Caption:= '������ȭ/������'
          else if FieldByName('APJOBKIND').AsString = '18' then LApJobkind.Caption:= '��ż���(��ǰ��ȹ)'
          else if FieldByName('APJOBKIND').AsString = '19' then LApJobkind.Caption:= 'TM����'
          else if FieldByName('APJOBKIND').AsString = '20' then LApJobkind.Caption:= '���ɸ�����';
          }

               if FieldByName('APAREA').AsString = '1' then Laparea.Caption:= '����'
          else if FieldByName('APAREA').AsString = '2' then Laparea.Caption:= '����/������'
          else if FieldByName('APAREA').AsString = '3' then Laparea.Caption:= '��û'
          else if FieldByName('APAREA').AsString = '4' then Laparea.Caption:= '�泲'
          else if FieldByName('APAREA').AsString = '5' then Laparea.Caption:= '���'
          else if FieldByName('APAREA').AsString = '6' then Laparea.Caption:= '����'
          else if FieldByName('APAREA').AsString = '7' then Laparea.Caption:= '����';

          // ����
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

          Lfullname.Caption       := FieldByName('FULLNAME'     ).AsString;           //�̸�
          Ltel.Caption            := FieldByName('TEL'          ).AsString;           //��ȭ
          Lj1.Caption             := Copy(FieldByName('REGNO'   ).AsString,1,1);      //�ֹι�ȣ ù�ڸ�
          Lj2.Caption             := Copy(FieldByName('REGNO'   ).AsString,2,1);
          Lj3.Caption             := Copy(FieldByName('REGNO'   ).AsString,3,1);
          Lj4.Caption             := Copy(FieldByName('REGNO'   ).AsString,4,1);
          Lj5.Caption             := Copy(FieldByName('REGNO'   ).AsString,5,1);
          Lj6.Caption             := Copy(FieldByName('REGNO'   ).AsString,6,1);
          Lj7.Caption             := Copy(FieldByName('REGNO'   ).AsString,7,1);
          Lj8.Caption             := Copy(FieldByName('REGNO'   ).AsString,8,1);
          Lj9.Caption             := Copy(FieldByName('REGNO'   ).AsString,9,1);
          Lj10.Caption            := Copy(FieldByName('REGNO'   ).AsString,10,1);
          Lj11.Caption            := Copy(FieldByName('REGNO'   ).AsString,11,1);
          Lj12.Caption            := Copy(FieldByName('REGNO'   ).AsString,12,1);
          Lj13.Caption            := Copy(FieldByName('REGNO'   ).AsString,13,1);
          Lzip1.Caption           := Copy(FieldByName('ZIPCODE' ).AsString,1,3);      //������ȣ
          Lzip2.Caption           := Copy(FieldByName('ZIPCODE' ).AsString,4,3);
          Laddress.Caption        := FieldByName('ADDRESS'      ).AsString;           //�ּ�
          LMobile1.Caption        := FieldByName('MOBILE'       ).AsString;           //�̵���ȭ

          Lemail.Caption          := FieldByName('EMAIL'        ).AsString;           //�̸���
          Lhighname.Caption       := FieldByName('HIGHNAME'     ).AsString;           //�����б���
          Lunivname.Caption       := FieldByName('UNIVNAME'     ).AsString;           //���б���
          Lbadunivname.Caption    := FieldByName('BADUNIVNAME'  ).AsString;           //���������б���
          Lgrdname.Caption        := FieldByName('GRD1NAME'     ).AsString;           //���п���

          // ��������
               if FieldByName('UNIVMAJORID').AsString = '9999'  then Lunvimajorid.Caption:= FieldByName('UnivMajorName').AsString
          else if FieldByName('UNIVMAJORID').AsString <> '9999' then Lunvimajorid.Caption:= FieldByName('UNIVMAJOR').AsString;

          // ���к�����
               if FieldByName('UNIVMINORID').AsString = '9999'  then LUNIVMINORID.Caption:= FieldByName('UnivMinorName').AsString
          else if FieldByName('UNIVMINORID').AsString <> '9999' then LUNIVMINORID.Caption:= FieldByName('univminor').AsString;

          // ��������������
               if FieldByName('BADUNIVMAJOR').AsString = '9999'  then Lbadunvimajorid.Caption:= FieldByName('BadUnivMajorName').AsString
          else if FieldByName('BADUNIVMAJOR').AsString <> '9999' then Lbadunvimajorid.Caption:= FieldByName('BADUNIVMAJORR').AsString;

          // ���п�����
               if FieldByName('GRD1MAJORID').AsString = '9999'  then Lgrd1majorid.Caption:= FieldByName('Grd1MajorName').AsString
          else if FieldByName('GRD1MAJORID').AsString <> '9999' then Lgrd1majorid.Caption:= FieldByName('GRD1MAJOR').AsString;

          Lgrd1paper.Caption      := FieldByName('GRD1PAPER'    ).AsString;           //��������
          Lunivscore.Caption      := FieldByName('UNIVSCORE'    ).AsString;           //���б� �а�����
          Lunivscoret.Caption     := FieldByName('UNIVSCORET'   ).AsString;           //���б� �а�����
          Lbadgrd1score.Caption   := FieldByName('BADUNIVSCORE' ).AsString;           //���Դ��б� �а�����
          Lbadunivscoret.Caption  := FieldByName('BADUNIVSCORET').AsString;           //���Դ��б� �а�����
          Lgrd1score.Caption      := FieldByName('GRD1SCORE'    ).AsString;           //���п� �а�����
          Lgrd1scoret.Caption     := FieldByName('GRD1SCORET'   ).AsString;           //���п� �а�����

          //���б� ����,�б� ����
               if FieldByName('UNIVWHERE').AsString = '1' then Lunivwhere.Caption:= '����'
          else if FieldByName('UNIVWHERE').AsString = '2' then Lunivwhere.Caption:= '�б�';

          //���Դ��б� ����,�б� ����
               if FieldByName('BADUNIVWHERE').AsString = ''  then Lbadunivwhere.Caption:= ''
          else if FieldByName('BADUNIVWHERE').AsString = '1' then Lbadunivwhere.Caption:= '����'
          else if FieldByName('BADUNIVWHERE').AsString = '2' then Lbadunivwhere.Caption:= '�б�';

          //���п� ����,�б� ����
               if FieldByName('GRD1WHERE').AsString = ''  then LGrd1where.Caption:= ''
          else if FieldByName('GRD1WHERE').AsString = '1' then LGrd1where.Caption:= '����'
          else if FieldByName('GRD1WHERE').AsString = '2' then LGrd1where.Caption:= '�б�';

          //���б� ��,�߰� ����
               if FieldByName('UNIVDAY').AsString = '1' then Lunivday.Caption:= '�ְ�'
          else if FieldByName('UNIVDAY').AsString = '2' then Lunivday.Caption:= '�߰�';

          //���Դ��б� ��,�߰� ����
               if FieldByName('BADUNIVDAY').AsString = ''  then Lbadunivday.Caption:= ''
          else if FieldByName('BADUNIVDAY').AsString = '1' then Lbadunivday.Caption:= '�ְ�'
          else if FieldByName('BADUNIVDAY').AsString = '2' then Lbadunivday.Caption:= '�߰�';

          //���п� ��,�߰� ����
               if FieldByName('GRD1DAY').AsString = ''  then Lgrd1day.Caption:= ''
          else if FieldByName('GRD1DAY').AsString = '1' then Lgrd1day.Caption:= '�ְ�'
          else if FieldByName('GRD1DAY').AsString = '2' then Lgrd1day.Caption:= '�߰�';

          //�����б� ���� ����
               if FieldByName('HIGHGRAD').AsString = '1' then Lhighgrad.Caption:= '����'
          else if FieldByName('HIGHGRAD').AsString = '2' then Lhighgrad.Caption:= '����'
          else if FieldByName('HIGHGRAD').AsString = '3' then Lhighgrad.Caption:= '����'
          else if FieldByName('HIGHGRAD').AsString = '4' then Lhighgrad.Caption:= '����';

          //���б� ���� ����
               if FieldByName('UNIVGRAD').AsString = '1' then Lunivgrad.Caption:= '����'
          else if FieldByName('UNIVGRAD').AsString = '2' then Lunivgrad.Caption:= '����'
          else if FieldByName('UNIVGRAD').AsString = '3' then Lunivgrad.Caption:= '����'
          else if FieldByName('UNIVGRAD').AsString = '4' then Lunivgrad.Caption:= '����';

          //���Դ��б� ���� ����
               if FieldByName('BADUNIVGRD').AsString = ''  then Lbadunivgrad.Caption:= ''
          else if FieldByName('BADUNIVGRD').AsString = '1' then Lbadunivgrad.Caption:= '����'
          else if FieldByName('BADUNIVGRD').AsString = '2' then Lbadunivgrad.Caption:= '����'
          else if FieldByName('BADUNIVGRD').AsString = '3' then Lbadunivgrad.Caption:= '����'
          else if FieldByName('BADUNIVGRD').AsString = '4' then Lbadunivgrad.Caption:= '����';

          //���п� ���� ����
               if FieldByName('GRD1GRAD').AsString = ''  then Lgrd1grad.Caption:= ''
          else if FieldByName('GRD1GRAD').AsString = '1' then Lgrd1grad.Caption:= '����'
          else if FieldByName('GRD1GRAD').AsString = '2' then Lgrd1grad.Caption:= '����'
          else if FieldByName('GRD1GRAD').AsString = '3' then Lgrd1grad.Caption:= '����'
          else if FieldByName('GRD1GRAD').AsString = '4' then Lgrd1grad.Caption:= '����';

          Lhighiny1.Caption     := Copy(FieldByName('HIGHINYM').AsString,3,1);       //�������г� 1
          Lhighiny2.Caption     := Copy(FieldByName('HIGHINYM').AsString,4,1);       //�������г� 2
          Lhighinm1.Caption     := Copy(FieldByName('HIGHINYM').AsString,5,1);       //�������п� 1
          Lhighinm2.Caption     := Copy(FieldByName('HIGHINYM').AsString,6,1);       //�������п� 2

          LhighoutY1.Caption    := Copy(FieldByName('HIGHOUTYM').AsString,3,1);      //���������� 1
          LhighoutY2.Caption    := Copy(FieldByName('HIGHOUTYM').AsString,4,1);      //���������� 2
          Lhighoutm1.Caption    := Copy(FieldByName('HIGHOUTYM').AsString,5,1);      //���������� 1
          Lhighoutm2.Caption    := Copy(FieldByName('HIGHOUTYM').AsString,6,1);      //���������� 2

          Luniviny1.Caption     := Copy(FieldByName('UNIVINYM').AsString,3,1);       //�������г� 1
          Luniviny2.Caption     := Copy(FieldByName('UNIVINYM').AsString,4,1);       //�������г� 2
          Lunivinm1.Caption     := Copy(FieldByName('UNIVINYM').AsString,5,1);       //�������п� 1
          Lunivinm2.Caption     := Copy(FieldByName('UNIVINYM').AsString,6,1);       //�������п� 2

          Lunivouty1.Caption    := Copy(FieldByName('UNIVOUTYM').AsString,3,1);      //���������� 1
          Lunivouty2.Caption    := Copy(FieldByName('UNIVOUTYM').AsString,4,1);      //���������� 2
          Lunivoutm1.Caption    := Copy(FieldByName('UNIVOUTYM').AsString,5,1);      //���������� 1
          Lunivoutm2.Caption    := Copy(FieldByName('UNIVOUTYM').AsString,6,1);      //���������� 2

          Lbaduniviny1.Caption  := Copy(FieldByName('BADUNIVINYM').AsString,3,1);    //���Դ������г� 1
          Lbaduniviny2.Caption  := Copy(FieldByName('BADUNIVINYM').AsString,4,1);    //���Դ������г� 2
          Lbadunivinm1.Caption  := Copy(FieldByName('BADUNIVINYM').AsString,5,1);    //���Դ������п� 1
          Lbadunivinm2.Caption  := Copy(FieldByName('BADUNIVINYM').AsString,6,1);    //���Դ������п� 2

          Lbadunivouty1.Caption := Copy(FieldByName('BADUNIVOUTYM').AsString,3,1);   //���Դ��������� 1
          Lbadunivouty2.Caption := Copy(FieldByName('BADUNIVOUTYM').AsString,4,1);   //���Դ��������� 2
          Lbadunivoutm1.Caption := Copy(FieldByName('BADUNIVOUTYM').AsString,5,1);   //���Դ��������� 1
          Lbadunivoutm2.Caption := Copy(FieldByName('BADUNIVOUTYM').AsString,6,1);   //���Դ��������� 2

          Lgrd1iny1.Caption     := Copy(FieldByName('GRD1INYM').AsString,3,1);       //���п����г� 1
          Lgrd1iny2.Caption     := Copy(FieldByName('GRD1INYM').AsString,4,1);       //���п����г� 2
          Lgrd1inm1.Caption     := Copy(FieldByName('GRD1INYM').AsString,5,1);       //���п����п� 1
          Lgrd1inm2.Caption     := Copy(FieldByName('GRD1INYM').AsString,6,1);       //���п����п� 2

          Lgrd1outy1.Caption    := Copy(FieldByName('GRD1OUTYM').AsString,3,1);      //���п������� 1
          Lgrd1outy2.Caption    := Copy(FieldByName('GRD1OUTYM').AsString,4,1);      //���п������� 2
          Lgrd1outm1.Caption    := Copy(FieldByName('GRD1OUTYM').AsString,5,1);      //���п������� 1
          Lgrd1outm2.Caption    := Copy(FieldByName('GRD1OUTYM').AsString,6,1);      //���п������� 2

          // �ڰݸ���1
               if FieldByName('LICENCE1NAME').AsString = ''  then Llicence1.Caption:=''
          else if FieldByName('LICENCE1NAME').AsString <> '' then Llicence1.Caption:= FieldByName('LICENCE1NAME').AsString;

          // �ڰݸ���2
               if FieldByName('LICENCE1NAME2').AsString = ''  then Llicence2.Caption:=''
          else if FieldByName('LICENCE1NAME2').AsString <> '' then Llicence2.Caption:= FieldByName('LICENCE1NAME2').AsString;

          //����
               if FieldByName('BOHUN').AsString = '1' then Lbohun.Caption:= '���'
          else if FieldByName('BOHUN').AsString = '2' then Lbohun.Caption:= '����';

          Lengscore.Caption:= FieldByName('ENGSCORE').AsString;                           // ��������

          // ���� �����
          Lengy.Caption:= Copy(FieldByName('ENGYMD').AsString,1,4);
          Lengm.Caption:= Copy(FieldByName('ENGYMD').AsString,5,2);

          //////////////////////////////////////////////////////////////////////////////////////////////
          //2006�� �߰�����                                                                           //
          //////////////////////////////////////////////////////////////////////////////////////////////
          LETCLANG.Caption := FieldByName('ETCLANG').AsString;
          LETCLANG_POINT.Caption:= FieldByName('ETCLANG_POINT').AsString;                 // ��Ÿ�ܱ�������

          // ��Ÿ�ܱ��� �����
          LETCLANG_Y.Caption:= Copy(FieldByName('ETCLANGYM').AsString,1,4);
          LETCLANG_M.Caption:= Copy(FieldByName('ETCLANGYM').AsString,5,2);
          //////////////////////////////////////////////////////////////////////////////////////////////

          // ��������
               if FieldByName('ARMYKINDNAME').AsString = ''  then Larmykind.Caption:=''
          else if FieldByName('ARMYKINDNAME').AsString <> '' then Larmykind.Caption:= FieldByName('ARMYKINDNAME').AsString;

          // �������
               if FieldByName('armygradename').AsString = ''  then Larmygrade.Caption:=''
          else if FieldByName('armygradename').AsString <> '' then Larmygrade.Caption:= FieldByName('armygradename').AsString;

          // ���� ���� ����
               if FieldByName('ARMYEXCEPTNAME').AsString = ''  then Larmyexcept.Caption:=''
          else if FieldByName('ARMYEXCEPTNAME').AsString <> '' then Larmyexcept.Caption:= FieldByName('ARMYEXCEPTNAME').AsString;

          if  Length(FieldByName('ARMYINYMD').AsString) <> 6 then
          begin
               Larmyinyy.Caption:='';
               Larmyinmm.Caption:='';
          end
          else
          begin
               Larmyinyy.Caption:= Copy(FieldByName('ARMYINYMD').AsString,1,4);    //�Դ��
               Larmyinmm.Caption:= Copy(FieldByName('ARMYINYMD').AsString,5,2);    //�Դ��
          end;

          if Length(FieldByName('ARMYOUTYMD').AsString) <>6 then
          begin
               Larmyoutyy.Caption:='';
               Larmyoutmm.Caption:='';
          end
          else
          begin
               Larmyoutyy.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,1,4);  //�����
               Larmyoutmm.Caption:= Copy(FieldByName('ARMYOUTYMD').AsString,5,2);  //�����
          end;

          // �����Ⱓ
          if ((FieldByName('ARMYINYMD').AsString <> '') or (FieldByName('ARMYOUTYMD').AsString <> '')) then
          begin
               with Qry_univ  do
               begin
                    Close;
                    Sql.Clear;
                    Sql.Add('select  TRUNC(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMM''),to_date(armyinymd,''YYYYMM''))/12) YY,'+
                            '        MOD(MONTHS_BETWEEN(to_date(armyoutymd,''YYYYMM''),to_date(armyinymd,''YYYYMM'')),12) MM   '+
                            'from prectmas                                                                                         '+
                            'where   armyoutymd <> ''01''                                                                          '+
                            '  and   armyinymd  <> ''01''                                                                          '+
                            '  and rid = '''+ Qry_recuit.FieldByName('RID').AsString +'''');
                    Open;

                         if FieldByName('YY').AsString = ''  then Lyy.Caption:=''
                    else if FieldByName('YY').AsString <> '' then  Lyy.Caption:= FieldByName('YY').AsString;

                         if FieldByName('MM').AsString = '' then Lmm.Caption:=''
                    else if FieldByName('MM').AsString <> '' then Lmm.Caption:= FieldByName('MM').AsString;

                    Close;
               end;  // Qry_univ with ~ end
          end
          else
          begin
               Lyy.Caption:='';
               Lmm.Caption:='';
          end;

          // ����1
               if FieldByName('F1TYPENAME').AsString = ''  then Lf1type.Caption:=''
          else if FieldByName('F1TYPENAME').AsString <> '' then Lf1type.Caption:= FieldByName('F1TYPENAME').AsString;

          // ����
          Lf1name.Caption:= FieldByName('F1NAME').AsString;
          // ����
          Lf1age.Caption:= FieldByName('F1AGE').AsString;
          // �з�
               if FieldByName('F1GRADENAME').AsString = ''  then Lf1grade.Caption:=''
          else if FieldByName('F1GRADENAME').AsString <> '' then Lf1grade.Caption:= FieldByName('F1GRADENAME').AsString;

          // ����1 �ٹ�ó/����
          Lf1work.Caption:= FieldByName('F1WORK').AsString;

          // ����1 ���ſ���
               if FieldByName('F1WITH').AsString = ''  then Lf5with.Caption:= ''
          else if FieldByName('F1WITH').AsString = '1' then Lf1with.Caption:= '����'
          else if FieldByName('F1WITH').AsString = '2' then Lf1with.Caption:= '�񵿰�';

          // ����1 ����ó
          Lf1tel.Caption:= FieldByName('F1TEL').AsString;

          // ����2
               if FieldByName('F2TYPENAME').AsString = ''  then Lf2type.Caption:=''
          else if FieldByName('F2TYPENAME').AsString <> '' then Lf2type.Caption:= FieldByName('F2TYPENAME').AsString;

          // ����
          Lf2name.Caption:= FieldByName('F2NAME').AsString;
          // ����
          Lf2age.Caption:= FieldByName('F2AGE').AsString;
          // �з�
               if FieldByName('F2GRADENAME').AsString = ''  then Lf2grade.Caption:=''
          else if FieldByName('F2GRADENAME').AsString <> '' then Lf2grade.Caption:= FieldByName('F2GRADENAME').AsString;

          // �ٹ�ó/����
          Lf2work.Caption:= FieldByName('F2WORK').AsString;

          // ���ſ���
               if FieldByName('F2WITH').AsString = ''  then Lf5with.Caption:= ''
          else if FieldByName('F2WITH').AsString = '1' then Lf2with.Caption:= '����'
          else if FieldByName('F2WITH').AsString = '2' then Lf2with.Caption:= '�񵿰�';

          // ����ó
          Lf2tel.Caption:= FieldByName('F2TEL').AsString;

          //////////////////////////////////////////////////////////////////////////
          // ����3
               if FieldByName('F3TYPENAME').AsString = ''  then Lf3type.Caption:=''
          else if FieldByName('F3TYPENAME').AsString <> '' then Lf3type.Caption:= FieldByName('F3TYPENAME').AsString;

         // ����
         Lf3name.Caption:= FieldByName('F3NAME').AsString;
         // ����
         Lf3age.Caption:= FieldByName('F3AGE').AsString;
         // �з�
              if FieldByName('F3GRADENAME').AsString = ''  then Lf3grade.Caption:=''
         else if FieldByName('F3GRADENAME').AsString <> '' then Lf3grade.Caption:= FieldByName('F3GRADENAME').AsString;

         // �ٹ�ó/����
         Lf3work.Caption:= FieldByName('F3WORK').AsString;

         // ���ſ���
              if FieldByName('F3WITH').AsString = ''  then Lf3with.Caption:= ''
         else if FieldByName('F3WITH').AsString = '1' then Lf3with.Caption:= '����'
         else if FieldByName('F3WITH').AsString = '2' then Lf3with.Caption:= '�񵿰�';

         // ����ó
         Lf3tel.Caption:= FieldByName('F3TEL').AsString;

          //////////////////////////////////////////////////////////////////////////
          // ����4
               if FieldByName('F4TYPENAME').AsString = '' then Lf4type.Caption:=''
          else if FieldByName('F4TYPENAME').AsString <> '' then Lf4type.Caption:= FieldByName('F4TYPENAME').AsString;

          // ����
          Lf4name.Caption:= FieldByName('F4NAME').AsString;
          // ����
          Lf4age.Caption:= FieldByName('F4AGE').AsString;
          // �з�
               if FieldByName('F4GRADENAME').AsString = '' then Lf4grade.Caption:=''
          else if FieldByName('F4GRADENAME').AsString <> '' then Lf4grade.Caption:= FieldByName('F4GRADENAME').AsString;

          // �ٹ�ó/����
          Lf4work.Caption:= FieldByName('F4WORK').AsString;

          // ���ſ���
               if FieldByName('F4WITH').AsString = ''  then Lf4with.Caption:= ''
          else if FieldByName('F4WITH').AsString = '1' then Lf4with.Caption:= '����'
          else if FieldByName('F4WITH').AsString = '2' then Lf4with.Caption:= '�񵿰�';

          // ����ó
          Lf4tel.Caption:= FieldByName('F4TEL').AsString;

          //////////////////////////////////////////////////////////////////////////
          // ����5
               if FieldByName('F5TYPENAME').AsString = ''  then Lf5type.Caption:=''
          else if FieldByName('F5TYPENAME').AsString <> '' then Lf5type.Caption:= FieldByName('F5TYPENAME').AsString;

          // ����
          Lf5name.Caption:= FieldByName('F5NAME').AsString;
          // ����
          Lf5age.Caption:= FieldByName('F5AGE').AsString;
          // �з�
               if FieldByName('F5GRADENAME').AsString = ''  then Lf5grade.Caption:=''
          else if FieldByName('F5GRADENAME').AsString <> '' then Lf5grade.Caption:= FieldByName('F5GRADENAME').AsString;

          // �ٹ�ó/����
          Lf5work.Caption:= FieldByName('F5WORK').AsString;

          // ���ſ���
               if FieldByName('F5WITH').AsString = ''  then Lf5with.Caption:= ''
          else if FieldByName('F5WITH').AsString = '1' then Lf5with.Caption:= '����'
          else if FieldByName('F5WITH').AsString = '2' then Lf5with.Caption:= '�񵿰�';

          // ����ó
          Lf5tel.Caption:= FieldByName('F5TEL').AsString;

          //�ڽ��� ����
          QRMemo1.Lines.Clear;
          QRMemo1.Lines.Add(FieldByName('STRENGTH').AsString);


          Lrid1.Caption := Copy(FieldByName('rid').AsString,1,1);
          Lrid2.Caption := Copy(FieldByName('rid').AsString,2,1);
          Lrid3.Caption := Copy(FieldByName('rid').AsString,3,1);
          Lrid4.Caption := Copy(FieldByName('rid').AsString,4,1);
          Lrid5.Caption := Copy(FieldByName('rid').AsString,5,1);
          Lrid6.Caption := Copy(FieldByName('rid').AsString,6,1);
          Lrid7.Caption := Copy(FieldByName('rid').AsString,7,1);
          Lrid8.Caption := Copy(FieldByName('rid').AsString,8,1);
          Lrid9.Caption := Copy(FieldByName('rid').AsString,9,1);

          if FieldByName('obsyn').AsString = 'Y' then Lobsyn.Caption := '���'
          else                                        Lobsyn.Caption := '����';
     end;
end;


procedure TPrintForm.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

end;

//�ڱ� �Ұ���
procedure TPrintForm.vBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var Vdept    : string;
begin
     with Qry_recuit  do
     begin
          //�⺻����
{          Vdept := FieldByName('DEPT').AsString; // ���úκ�

               if Vdept = '01' then Ldept.Caption:= '�濵����'
          else if Vdept = '02' then Ldept.Caption:= '������'
          else if Vdept = '03' then Ldept.Caption:= '�Ż��'
          else if Vdept = '04' then Ldept.Caption:= '����'
          else if Vdept = '05' then Ldept.Caption:= '���'
          else if Vdept = '06' then Ldept.Caption:= 'NI���/����'
          else if Vdept = '07' then Ldept.Caption:= '����/�������'
          else if Vdept = '08' then Ldept.Caption:= '���α��'
          else if Vdept = '09' then Ldept.Caption:= 'ȸ��'
          else if Vdept = '10' then Ldept.Caption:= '���������'
          else if Vdept = '11' then Ldept.Caption:= '���ȫ��'
          else if Vdept = '12' then Ldept.Caption:= '���÷���/������';
}
               if FieldByName('APAREA').AsString = '1' then Laparea.Caption:= '����'
          else if FieldByName('APAREA').AsString = '2' then Laparea.Caption:= '����/������'
          else if FieldByName('APAREA').AsString = '3' then Laparea.Caption:= '��û'
          else if FieldByName('APAREA').AsString = '4' then Laparea.Caption:= 'ȣ��'
          else if FieldByName('APAREA').AsString = '5' then Laparea.Caption:= '�λ�/���';

          Lfullname.Caption       := FieldByName('FULLNAME'     ).AsString;           //�̸�
          Lrid.Caption            := FieldByName('RID'          ).AsString;                 //������ȣ
          LREGNO.Caption          := Copy(FieldByName('REGNO'        ).AsString,1,6)+'-'+   //�ֹι�ȣ
                                     Copy(FieldByName('REGNO'        ).AsString,7,13);

          //�ڱ� �Ұ���
          QRMemo2.Lines.Clear;
          QRMemo2.Lines.text :=FieldByName('SELFINFO').AsString;
          //����
          Lbodyheight.Caption:=FieldByName('BODYHEIGHT').AsString;
          //ü��
          Lbodyweight.Caption:=FieldByName('BODYWEIGHT').AsString;

          //2006 ����
          //ȥ�ο���
          //if  FieldByName('ISMARRIED').AsString = '' then Lismarried.Caption :=  '';
          //     if FieldByName('ISMARRIED').AsString = '1' then Lismarried.Caption:= '��ȥ'
          //else if FieldByName('ISMARRIED').AsString = '2' then Lismarried.Caption:= '��ȥ';

          //���
          Linterest.Caption:=FieldByName('INTEREST').AsString;
          //��������
          LymdhY.Caption:=Copy(FieldByName('YMDHMS').AsString,1,4);
          Lymdhms1.Caption:=Copy(FieldByName('YMDHMS').AsString,5,2);
          Lymdhms2.Caption:=Copy(FieldByName('YMDHMS').AsString,7,2);
          //������
          Lfullname1.Caption:=FieldByName('FULLNAME').AsString;
     end;  // Qry_recuit with ~ end

          if QRMemo2.Lines.count >= 60 then QRMemo2.Font.Size := 6
     else if QRMemo2.Lines.count >= 53 then QRMemo2.Font.Size := 7
     else if QRMemo2.Lines.count >= 50 then QRMemo2.Font.Size := 8
     else                                   QRMemo2.Font.Size := 9;
end;

end.