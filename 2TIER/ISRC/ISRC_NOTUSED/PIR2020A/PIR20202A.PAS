unit PIR20202A;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, peprnview, Db, DBTables;

type
  TPrintForm = class(TForm)
    Report1: TQuickRep;
    qry_select: TQuery;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    Lhak1: TQRLabel;
    Lcntsuk1: TQRLabel;
    Lout1: TQRLabel;
    Lin1: TQRLabel;
    Lman1: TQRLabel;
    Lwoman1: TQRLabel;
    LTotal1: TQRLabel;
    Lhak2: TQRLabel;
    Lcntsuk2: TQRLabel;
    Lin2: TQRLabel;
    Lout2: TQRLabel;
    Lman2: TQRLabel;
    Lwoman2: TQRLabel;
    LTotal2: TQRLabel;
    Lhak3: TQRLabel;
    Lcntsuk3: TQRLabel;
    Lin3: TQRLabel;
    Lout3: TQRLabel;
    Lman3: TQRLabel;
    Lwoman3: TQRLabel;
    LTotal3: TQRLabel;
    Lmihak: TQRLabel;
    Lmisuk: TQRLabel;
    Lmiin: TQRLabel;
    Lmiout: TQRLabel;
    Lmiman: TQRLabel;
    Lmiwoman: TQRLabel;
    LmiTotal: TQRLabel;
    LSeoul: TQRLabel;
    LKAIST: TQRLabel;
    LPohang: TQRLabel;
    LYeonse: TQRLabel;
    LKorea: TQRLabel;
    LBoRatio: TQRLabel;
    LOther: TQRLabel;
    LSeRatio: TQRLabel;
    LKARatio: TQRLabel;
    LPORatio: TQRLabel;
    LYERatio: TQRLabel;
    LBoard: TQRLabel;
    LKORatio: TQRLabel;
    LOTRatio: TQRLabel;
    LNowDate: TQRLabel;
    QRLabel30: TQRLabel;
    Lhak4: TQRLabel;
    Lcntsuk4: TQRLabel;
    Lin4: TQRLabel;
    Lout4: TQRLabel;
    Lman4: TQRLabel;
    Lwoman4: TQRLabel;
    LTotal4: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    LTotal6: TQRLabel;
    Lwoman6: TQRLabel;
    Lman6: TQRLabel;
    Lout6: TQRLabel;
    Lin6: TQRLabel;
    Lcntsuk6: TQRLabel;
    Lhak6: TQRLabel;
    QRShape27: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    Lhak7: TQRLabel;
    Lcntsuk7: TQRLabel;
    Lin7: TQRLabel;
    Lout7: TQRLabel;
    Lman7: TQRLabel;
    Lwoman7: TQRLabel;
    LTotal7: TQRLabel;
    QRShape34: TQRShape;
    QRLabel37: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRShape13: TQRShape;
    QRLabel38: TQRLabel;
    Lhak8: TQRLabel;
    Lcntsuk8: TQRLabel;
    Lin8: TQRLabel;
    Lout8: TQRLabel;
    Lman8: TQRLabel;
    Lwoman8: TQRLabel;
    LTotal8: TQRLabel;
    QRLabel9: TQRLabel;
    Lsumhak: TQRLabel;
    Lsumsuk: TQRLabel;
    Lsumin: TQRLabel;
    Lsumout: TQRLabel;
    Lsumman: TQRLabel;
    Lsumwoman: TQRLabel;
    Lsumtotal: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape92: TQRShape;
    QRLabel68: TQRLabel;
    Lhaks1: TQRLabel;
    Lcntsuks1: TQRLabel;
    Lins1: TQRLabel;
    Louts1: TQRLabel;
    Lmans1: TQRLabel;
    Lwomans1: TQRLabel;
    LTotals1: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel69: TQRLabel;
    Lhak9: TQRLabel;
    Lcntsuk9: TQRLabel;
    Lin9: TQRLabel;
    Lout9: TQRLabel;
    Lman9: TQRLabel;
    Lwoman9: TQRLabel;
    LTotal9: TQRLabel;
    QRShape94: TQRShape;
    QRLabel79: TQRLabel;
    Lhak10: TQRLabel;
    Lcntsuk10: TQRLabel;
    Lin10: TQRLabel;
    Lout10: TQRLabel;
    Lman10: TQRLabel;
    Lwoman10: TQRLabel;
    LTotal10: TQRLabel;
    QRShape95: TQRShape;
    QRLabel87: TQRLabel;
    Lhak11: TQRLabel;
    Lcntsuk11: TQRLabel;
    Lin11: TQRLabel;
    Lout11: TQRLabel;
    Lman11: TQRLabel;
    Lwoman11: TQRLabel;
    LTotal11: TQRLabel;
    QRShape96: TQRShape;
    QRLabel100: TQRLabel;
    Lhak12: TQRLabel;
    Lcntsuk12: TQRLabel;
    Lin12: TQRLabel;
    Lout12: TQRLabel;
    Lman12: TQRLabel;
    Lwoman12: TQRLabel;
    LTotal12: TQRLabel;
    Lhaks2: TQRLabel;
    Lcntsuks2: TQRLabel;
    Lins2: TQRLabel;
    Louts2: TQRLabel;
    Lmans2: TQRLabel;
    Lwomans2: TQRLabel;
    LTotals2: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape35: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape38: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    G1: TQRLabel;
    G2: TQRLabel;
    G3: TQRLabel;
    G4: TQRLabel;
    G6: TQRLabel;
    G7: TQRLabel;
    G8: TQRLabel;
    G9: TQRLabel;
    G10: TQRLabel;
    G11: TQRLabel;
    G12: TQRLabel;
    G13: TQRLabel;
    G14: TQRLabel;
    G15: TQRLabel;
    G16: TQRLabel;
    H1: TQRLabel;
    H2: TQRLabel;
    H3: TQRLabel;
    H4: TQRLabel;
    H6: TQRLabel;
    H7: TQRLabel;
    H8: TQRLabel;
    H9: TQRLabel;
    H10: TQRLabel;
    H11: TQRLabel;
    H12: TQRLabel;
    H13: TQRLabel;
    H14: TQRLabel;
    H15: TQRLabel;
    H16: TQRLabel;
    I16: TQRLabel;
    J16: TQRLabel;
    K16: TQRLabel;
    K15: TQRLabel;
    J15: TQRLabel;
    I15: TQRLabel;
    I14: TQRLabel;
    J14: TQRLabel;
    K14: TQRLabel;
    K13: TQRLabel;
    J13: TQRLabel;
    I13: TQRLabel;
    I12: TQRLabel;
    J12: TQRLabel;
    K12: TQRLabel;
    K11: TQRLabel;
    J11: TQRLabel;
    I11: TQRLabel;
    I10: TQRLabel;
    J10: TQRLabel;
    K10: TQRLabel;
    K9: TQRLabel;
    J9: TQRLabel;
    I9: TQRLabel;
    J8: TQRLabel;
    I7: TQRLabel;
    I6: TQRLabel;
    I4: TQRLabel;
    I3: TQRLabel;
    I2: TQRLabel;
    I1: TQRLabel;
    J1: TQRLabel;
    J2: TQRLabel;
    J3: TQRLabel;
    J4: TQRLabel;
    J6: TQRLabel;
    J7: TQRLabel;
    I8: TQRLabel;
    K8: TQRLabel;
    K7: TQRLabel;
    K6: TQRLabel;
    K4: TQRLabel;
    K3: TQRLabel;
    K2: TQRLabel;
    K1: TQRLabel;
    N1: TQRLabel;
    N2: TQRLabel;
    N3: TQRLabel;
    N4: TQRLabel;
    N6: TQRLabel;
    N7: TQRLabel;
    N8: TQRLabel;
    N9: TQRLabel;
    N10: TQRLabel;
    N11: TQRLabel;
    N12: TQRLabel;
    N13: TQRLabel;
    N14: TQRLabel;
    N15: TQRLabel;
    N16: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape90: TQRShape;
    QRLabel66: TQRLabel;
    l_carInwon: TQRLabel;
    l_Sum1: TQRLabel;
    l_Sum2: TQRLabel;
    l_APcarInwon: TQRLabel;
    l_APnewInwon: TQRLabel;
    L_newratio: TQRLabel;
    L_carRatio: TQRLabel;
    L_Sum3: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel45: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    L3: TQRLabel;
    L4: TQRLabel;
    L6: TQRLabel;
    L7: TQRLabel;
    L8: TQRLabel;
    L9: TQRLabel;
    L10: TQRLabel;
    L11: TQRLabel;
    L12: TQRLabel;
    L13: TQRLabel;
    L14: TQRLabel;
    L15: TQRLabel;
    L16: TQRLabel;
    M1: TQRLabel;
    M2: TQRLabel;
    M3: TQRLabel;
    M4: TQRLabel;
    M6: TQRLabel;
    M7: TQRLabel;
    M8: TQRLabel;
    M9: TQRLabel;
    M10: TQRLabel;
    M11: TQRLabel;
    M12: TQRLabel;
    M13: TQRLabel;
    M14: TQRLabel;
    M15: TQRLabel;
    M16: TQRLabel;
    procedure Report1Preview(Sender: TObject);
    procedure Report1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Report1EndPage(Sender: TCustomQuickRep);
//    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
//      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Const sRasBasDate = '20080501';
var
  PrintForm: TPrintForm;

implementation

uses PIR20201A;

{$R *.DFM}

procedure TPrintForm.Report1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Report1);
end;

procedure TPrintForm.Report1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var iCnt : integer;
begin
  with qry_select do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ''학사'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where a.rabasdate = ''' + sRasBasDate + '''                                                         '+ chr(13) + chr(10) +
            '   and (a.univid is not null) and (a.grd1id is null)                                                 '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''석사'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where a.rabasdate = ''' + sRasBasDate + '''                                                         '+ chr(13) + chr(10) +
            '   and (a.univid is not null) and (a.grd1id is not null)                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''국내대'' gubun,                                                                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where (univid <''3000'' or univid >''6700'')                                                         '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''국외대'' gubun,                                                                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where (univid >''3000'' and univid <''6700'')                                                        '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''남자'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where (substr(regno,7,1) =''1'' or substr(regno,7,1) =''5'' or substr(regno,7,1) =''7'')            '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''여자'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where ((substr(regno,7,1) =''2'') or  (substr(regno,7,1) =''6'') or (substr(regno,7,1) =''8'') )    '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''전체'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            '  where rabasdate = '''+ sRasBasDate + '''                                                           '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''전국'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where APAREA = ''1''                                                                                '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''서울/수도권'' gubun,                                                                        '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            'where APAREA = ''2''                                                                                 '+ chr(13) + chr(10) +
            '  and rabasdate = '''+ sRasBasDate + '''                                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''충청'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where APAREA = ''3''                                                                                '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''경남'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where APAREA = ''4''                                                                                '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''경북'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            'where APAREA = ''5''                                                                                 '+ chr(13) + chr(10) +
            '  and rabasdate = '''+ sRasBasDate + '''                                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''전남'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where APAREA = ''6''                                                                                '+ chr(13) + chr(10) +
            '   and rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''전북'' gubun,                                                                               '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            'where APAREA = ''7''                                                                                 '+ chr(13) + chr(10) +
            '  and rabasdate = '''+ sRasBasDate + '''                                                             '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            '+ chr(13) + chr(10) +
            'union                                                                                                '+ chr(13) + chr(10) +
            'select ''전체근무지'' gubun,                                                                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) a, count(decode(b.cnt,2,1,null)) b,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) c, count(decode(b.cnt,4,1,null)) d,                             '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,1,null)) +  count(decode(b.cnt,2,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,3,1,null)) +  count(decode(b.cnt,4,1,null)) ssum1,                         '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,1,1,null)) f, count(decode(c.cnt,2,1,null)) g,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,3,1,null)) h, count(decode(c.cnt,4,1,null)) i,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,5,1,null)) j, count(decode(c.cnt,6,1,null)) k,                             '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,7,1,null)) l, count(decode(c.cnt,1,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,2,1,null)) +  count(decode(c.cnt,3,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,4,1,null)) +  count(decode(c.cnt,5,1,null)) +                              '+ chr(13) + chr(10) +
            '       count(decode(c.cnt,6,1,null)) +  count(decode(c.cnt,7,1,null)) ssum2,                         '+ chr(13) + chr(10) +
            '       count(decode(b.cnt,1,null,2,null,3,null,4,null,                                               '+ chr(13) + chr(10) +
            '             decode(c.cnt,1,null,2,null,3,null,4,null,5,null,6,null,7,null,1))) ex,                  '+ chr(13) + chr(10) +
	    '       count(a.dept) tsum                                                                            '+ chr(13) + chr(10) +
            '  from prectmas a, (select rownum cnt, codeno from pyccode where codeid = ''C051'') b,               '+ chr(13) + chr(10) +
            '       (select rownum cnt, codeno from pyccode where codeid = ''C052'') c                            '+ chr(13) + chr(10) +
            ' where rabasdate = '''+ sRasBasDate + '''                                                            '+ chr(13) + chr(10) +
            '   and a.dept=b.codeno(+)                                                                            '+ chr(13) + chr(10) +
            '   and a.dept=c.codeno(+)                                                                            ');

    MainForm.Edit1.Text := sql.text;
    Open;
    while not EOF do
    begin
       if FieldByName('gubun').AsString = '학사' then
       begin
          Lhak1.Caption   :=  FieldByName('a').AsString;
          Lhak2.Caption   :=  FieldByName('b').AsString;
          Lhak3.Caption   :=  FieldByName('c').AsString;
          Lhak4.Caption   :=  FieldByName('d').AsString;
//          Lhak5.Caption   :=  FieldByName('e').AsString;
          Lhaks1.Caption  :=  FieldByName('ssum1').AsString;
          Lhak6.Caption   :=  FieldByName('f').AsString;
          Lhak7.Caption   :=  FieldByName('g').AsString;
          Lhak8.Caption   :=  FieldByName('h').AsString;
          Lhak9.Caption   :=  FieldByName('i').AsString;
          Lhak10.Caption  :=  FieldByName('j').AsString;
          Lhak11.Caption  :=  FieldByName('k').AsString;
          Lhak12.Caption  :=  FieldByName('l').AsString;
          Lhaks2.Caption  :=  FieldByName('ssum2').AsString;
          Lmihak.Caption  :=  FieldByName('ex').AsString;
          Lsumhak.Caption :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '석사' then
       begin
          Lcntsuk1.Caption   :=  FieldByName('a').AsString;
          Lcntsuk2.Caption   :=  FieldByName('b').AsString;
          Lcntsuk3.Caption   :=  FieldByName('c').AsString;
          Lcntsuk4.Caption   :=  FieldByName('d').AsString;
//          Lcntsuk5.Caption   :=  FieldByName('e').AsString;
          Lcntsuks1.Caption  :=  FieldByName('ssum1').AsString;
          Lcntsuk6.Caption   :=  FieldByName('f').AsString;
          Lcntsuk7.Caption   :=  FieldByName('g').AsString;
          Lcntsuk8.Caption   :=  FieldByName('h').AsString;
          Lcntsuk9.Caption   :=  FieldByName('i').AsString;
          Lcntsuk10.Caption  :=  FieldByName('j').AsString;
          Lcntsuk11.Caption  :=  FieldByName('k').AsString;
          Lcntsuk12.Caption  :=  FieldByName('l').AsString;
          Lcntsuks2.Caption  :=  FieldByName('ssum2').AsString;
          Lmisuk.Caption     :=  FieldByName('ex').AsString;
          Lsumsuk.Caption    :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '국내대' then
       begin
          Lin1.Caption   :=  FieldByName('a').AsString;
          Lin2.Caption   :=  FieldByName('b').AsString;
          Lin3.Caption   :=  FieldByName('c').AsString;
          Lin4.Caption   :=  FieldByName('d').AsString;
//          Lin5.Caption   :=  FieldByName('e').AsString;
          Lins1.Caption  :=  FieldByName('ssum1').AsString;
          Lin6.Caption   :=  FieldByName('f').AsString;
          Lin7.Caption   :=  FieldByName('g').AsString;
          Lin8.Caption   :=  FieldByName('h').AsString;
          Lin9.Caption   :=  FieldByName('i').AsString;
          Lin10.Caption  :=  FieldByName('j').AsString;
          Lin11.Caption  :=  FieldByName('k').AsString;
          Lin12.Caption  :=  FieldByName('l').AsString;
          Lins2.Caption  :=  FieldByName('ssum2').AsString;
          Lmiin.Caption  :=  FieldByName('ex').AsString;
          Lsumin.Caption :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '국외대' then
       begin
          Lout1.Caption   :=  FieldByName('a').AsString;
          Lout2.Caption   :=  FieldByName('b').AsString;
          Lout3.Caption   :=  FieldByName('c').AsString;
          Lout4.Caption   :=  FieldByName('d').AsString;
//          Lout5.Caption   :=  FieldByName('e').AsString;
          Louts1.Caption  :=  FieldByName('ssum1').AsString;
          Lout6.Caption   :=  FieldByName('f').AsString;
          Lout7.Caption   :=  FieldByName('g').AsString;
          Lout8.Caption   :=  FieldByName('h').AsString;
          Lout9.Caption   :=  FieldByName('i').AsString;
          Lout10.Caption  :=  FieldByName('j').AsString;
          Lout11.Caption  :=  FieldByName('k').AsString;
          Lout12.Caption  :=  FieldByName('l').AsString;
          Louts2.Caption  :=  FieldByName('ssum2').AsString;
          Lmiout.Caption  :=  FieldByName('ex').AsString;
          Lsumout.Caption :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '남자' then
       begin
          Lman1.Caption   :=  FieldByName('a').AsString;
          Lman2.Caption   :=  FieldByName('b').AsString;
          Lman3.Caption   :=  FieldByName('c').AsString;
          Lman4.Caption   :=  FieldByName('d').AsString;
//          Lman5.Caption   :=  FieldByName('e').AsString;
          Lmans1.Caption  :=  FieldByName('ssum1').AsString;
          Lman6.Caption   :=  FieldByName('f').AsString;
          Lman7.Caption   :=  FieldByName('g').AsString;
          Lman8.Caption   :=  FieldByName('h').AsString;
          Lman9.Caption   :=  FieldByName('i').AsString;
          Lman10.Caption  :=  FieldByName('j').AsString;
          Lman11.Caption  :=  FieldByName('k').AsString;
          Lman12.Caption  :=  FieldByName('l').AsString;
          Lmans2.Caption  :=  FieldByName('ssum2').AsString;
          Lmiman.Caption  :=  FieldByName('ex').AsString;
          Lsumman.Caption :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '여자' then
       begin
          Lwoman1.Caption   :=  FieldByName('a').AsString;
          Lwoman2.Caption   :=  FieldByName('b').AsString;
          Lwoman3.Caption   :=  FieldByName('c').AsString;
          Lwoman4.Caption   :=  FieldByName('d').AsString;
//          Lwoman5.Caption   :=  FieldByName('e').AsString;
          Lwomans1.Caption  :=  FieldByName('ssum1').AsString;
          Lwoman6.Caption   :=  FieldByName('f').AsString;
          Lwoman7.Caption   :=  FieldByName('g').AsString;
          Lwoman8.Caption   :=  FieldByName('h').AsString;
          Lwoman9.Caption   :=  FieldByName('i').AsString;
          Lwoman10.Caption  :=  FieldByName('j').AsString;
          Lwoman11.Caption  :=  FieldByName('k').AsString;
          Lwoman12.Caption  :=  FieldByName('l').AsString;
          Lwomans2.Caption  :=  FieldByName('ssum2').AsString;
          Lmiwoman.Caption  :=  FieldByName('ex').AsString;
          Lsumwoman.Caption :=  FieldByName('tsum').AsString;
       end;
        if FieldByName('gubun').AsString = '전체' then
       begin
          LTotal1.Caption   :=  FieldByName('a').AsString;
          LTotal2.Caption   :=  FieldByName('b').AsString;
          LTotal3.Caption   :=  FieldByName('c').AsString;
          LTotal4.Caption   :=  FieldByName('d').AsString;
//          LTotal5.Caption   :=  FieldByName('e').AsString;
          LTotals1.Caption  :=  FieldByName('ssum1').AsString;
          LTotal6.Caption   :=  FieldByName('f').AsString;
          LTotal7.Caption   :=  FieldByName('g').AsString;
          LTotal8.Caption   :=  FieldByName('h').AsString;
          LTotal9.Caption   :=  FieldByName('i').AsString;
          LTotal10.Caption  :=  FieldByName('j').AsString;
          LTotal11.Caption  :=  FieldByName('k').AsString;
          LTotal12.Caption  :=  FieldByName('l').AsString;
          LTotals2.Caption  :=  FieldByName('ssum2').AsString;
          LmiTotal.Caption  :=  FieldByName('ex').AsString;
          Lsumtotal.Caption :=  FieldByName('tsum').AsString;
       end;
        if FieldByName('gubun').AsString = '전국' then
       begin
          G1.Caption   :=  FieldByName('a').AsString;
          G2.Caption   :=  FieldByName('b').AsString;
          G3.Caption   :=  FieldByName('c').AsString;
          G4.Caption   :=  FieldByName('d').AsString;
//          G5.Caption   :=  FieldByName('e').AsString;
          G6.Caption   :=  FieldByName('ssum1').AsString;
          G7.Caption   :=  FieldByName('f').AsString;
          G8.Caption   :=  FieldByName('g').AsString;
          G9.Caption   :=  FieldByName('h').AsString;
          G10.Caption  :=  FieldByName('i').AsString;
          G11.Caption  :=  FieldByName('j').AsString;
          G12.Caption  :=  FieldByName('k').AsString;
          G13.Caption  :=  FieldByName('l').AsString;
          G14.Caption  :=  FieldByName('ssum2').AsString;
          G15.Caption  :=  FieldByName('ex').AsString;
          G16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '서울/수도권' then
       begin
          H1.Caption   :=  FieldByName('a').AsString;
          H2.Caption   :=  FieldByName('b').AsString;
          H3.Caption   :=  FieldByName('c').AsString;
          H4.Caption   :=  FieldByName('d').AsString;
//          H5.Caption   :=  FieldByName('e').AsString;
          H6.Caption   :=  FieldByName('ssum1').AsString;
          H7.Caption   :=  FieldByName('f').AsString;
          H8.Caption   :=  FieldByName('g').AsString;
          H9.Caption   :=  FieldByName('h').AsString;
          H10.Caption  :=  FieldByName('i').AsString;
          H11.Caption  :=  FieldByName('j').AsString;
          H12.Caption  :=  FieldByName('k').AsString;
          H13.Caption  :=  FieldByName('l').AsString;
          H14.Caption  :=  FieldByName('ssum2').AsString;
          H15.Caption  :=  FieldByName('ex').AsString;
          H16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '충청' then
       begin
          I1.Caption   :=  FieldByName('a').AsString;
          I2.Caption   :=  FieldByName('b').AsString;
          I3.Caption   :=  FieldByName('c').AsString;
          I4.Caption   :=  FieldByName('d').AsString;
//          I5.Caption   :=  FieldByName('e').AsString;
          I6.Caption   :=  FieldByName('ssum1').AsString;
          I7.Caption   :=  FieldByName('f').AsString;
          I8.Caption   :=  FieldByName('g').AsString;
          I9.Caption   :=  FieldByName('h').AsString;
          I10.Caption  :=  FieldByName('i').AsString;
          I11.Caption  :=  FieldByName('j').AsString;
          I12.Caption  :=  FieldByName('k').AsString;
          I13.Caption  :=  FieldByName('l').AsString;
          I14.Caption  :=  FieldByName('ssum2').AsString;
          I15.Caption  :=  FieldByName('ex').AsString;
          I16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '경남' then
       begin
          J1.Caption   :=  FieldByName('a').AsString;
          J2.Caption   :=  FieldByName('b').AsString;
          J3.Caption   :=  FieldByName('c').AsString;
          J4.Caption   :=  FieldByName('d').AsString;
//          J5.Caption   :=  FieldByName('e').AsString;
          J6.Caption   :=  FieldByName('ssum1').AsString;
          J7.Caption   :=  FieldByName('f').AsString;
          J8.Caption   :=  FieldByName('g').AsString;
          J9.Caption   :=  FieldByName('h').AsString;
          J10.Caption  :=  FieldByName('i').AsString;
          J11.Caption  :=  FieldByName('j').AsString;
          J12.Caption  :=  FieldByName('k').AsString;
          J13.Caption  :=  FieldByName('l').AsString;
          J14.Caption  :=  FieldByName('ssum2').AsString;
          J15.Caption  :=  FieldByName('ex').AsString;
          J16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '경북' then
       begin
          K1.Caption   :=  FieldByName('a').AsString;
          K2.Caption   :=  FieldByName('b').AsString;
          K3.Caption   :=  FieldByName('c').AsString;
          K4.Caption   :=  FieldByName('d').AsString;
//          K5.Caption   :=  FieldByName('e').AsString;
          K6.Caption   :=  FieldByName('ssum1').AsString;
          K7.Caption   :=  FieldByName('f').AsString;
          K8.Caption   :=  FieldByName('g').AsString;
          K9.Caption   :=  FieldByName('h').AsString;
          K10.Caption  :=  FieldByName('i').AsString;
          K11.Caption  :=  FieldByName('j').AsString;
          K12.Caption  :=  FieldByName('k').AsString;
          K13.Caption  :=  FieldByName('l').AsString;
          K14.Caption  :=  FieldByName('ssum2').AsString;
          K15.Caption  :=  FieldByName('ex').AsString;
          K16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '전남' then
       begin
          L1.Caption   :=  FieldByName('a').AsString;
          L2.Caption   :=  FieldByName('b').AsString;
          L3.Caption   :=  FieldByName('c').AsString;
          L4.Caption   :=  FieldByName('d').AsString;
//          K5.Caption   :=  FieldByName('e').AsString;
          L6.Caption   :=  FieldByName('ssum1').AsString;
          L7.Caption   :=  FieldByName('f').AsString;
          L8.Caption   :=  FieldByName('g').AsString;
          L9.Caption   :=  FieldByName('h').AsString;
          L10.Caption  :=  FieldByName('i').AsString;
          L11.Caption  :=  FieldByName('j').AsString;
          L12.Caption  :=  FieldByName('k').AsString;
          L13.Caption  :=  FieldByName('l').AsString;
          L14.Caption  :=  FieldByName('ssum2').AsString;
          L15.Caption  :=  FieldByName('ex').AsString;
          L16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '전북' then
       begin
          M1.Caption   :=  FieldByName('a').AsString;
          M2.Caption   :=  FieldByName('b').AsString;
          M3.Caption   :=  FieldByName('c').AsString;
          M4.Caption   :=  FieldByName('d').AsString;
//          K5.Caption   :=  FieldByName('e').AsString;
          M6.Caption   :=  FieldByName('ssum1').AsString;
          M7.Caption   :=  FieldByName('f').AsString;
          M8.Caption   :=  FieldByName('g').AsString;
          M9.Caption   :=  FieldByName('h').AsString;
          M10.Caption  :=  FieldByName('i').AsString;
          M11.Caption  :=  FieldByName('j').AsString;
          M12.Caption  :=  FieldByName('k').AsString;
          M13.Caption  :=  FieldByName('l').AsString;
          M14.Caption  :=  FieldByName('ssum2').AsString;
          M15.Caption  :=  FieldByName('ex').AsString;
          M16.Caption  :=  FieldByName('tsum').AsString;
       end;
       if FieldByName('gubun').AsString = '전체근무지' then
       begin
          N1.Caption   :=  FieldByName('a').AsString;
          N2.Caption   :=  FieldByName('b').AsString;
          N3.Caption   :=  FieldByName('c').AsString;
          N4.Caption   :=  FieldByName('d').AsString;
//          L5.Caption   :=  FieldByName('e').AsString;
          N6.Caption   :=  FieldByName('ssum1').AsString;
          N7.Caption   :=  FieldByName('f').AsString;
          N8.Caption   :=  FieldByName('g').AsString;
          N9.Caption   :=  FieldByName('h').AsString;
          N10.Caption  :=  FieldByName('i').AsString;
          N11.Caption  :=  FieldByName('j').AsString;
          N12.Caption  :=  FieldByName('k').AsString;
          N13.Caption  :=  FieldByName('l').AsString;
          N14.Caption  :=  FieldByName('ssum2').AsString;
          N15.Caption  :=  FieldByName('ex').AsString;
          N16.Caption  :=  FieldByName('tsum').AsString;
       end;
      next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('select SEOUL,KAIST,POHANG,YENSE,KOREA,FORE,TOTAL,                      '+ chr(13) + chr(10) +
            '       TOTAL - (SEOUL+KAIST+POHANG+YENSE+KOREA+FORE) OTHER,            '+ chr(13) + chr(10) +
            '       sysdate                                                         '+ chr(13) + chr(10) +
            '   from                                                                '+ chr(13) + chr(10) +
            '(                                                                      '+ chr(13) + chr(10) +
            '    select count(decode(univid,''0640'',1,NULL)) SEOUL,                '+ chr(13) + chr(10) +
            '           count(decode(univid,''1200'',1,NULL)) KAIST,                '+ chr(13) + chr(10) +
            '           count(decode(univid,''1180'',1,NULL)) POHANG,               '+ chr(13) + chr(10) +
            '           count(decode(univid,''0840'',1,NULL)) YENSE,                '+ chr(13) + chr(10) +
            '           count(decode(univid,''0140'',1,NULL)) KOREA,                '+ chr(13) + chr(10) +
            '           count(decode(substr(univid,1,1),''3'',1,''4'',1,NULL)) Fore,'+ chr(13) + chr(10) +
            '           count(*) TOTAL                                              '+ chr(13) + chr(10) +
            '      from prectmas                                                    '+ chr(13) + chr(10) +
            '     where rabasdate = '''+ sRasBasDate + '''                  )       ');
    Open;
    LSeoul.Caption  := FieldByName('SEOUL').AsString;
    LKAIST.Caption  := FieldByName('KAIST').AsString;
    LPohang.Caption := FieldByName('POHANG').AsString;
    LYeonse.Caption := FieldByName('YENSE').AsString;
    LKorea.Caption  := FieldByName('KOREA').AsString;
    LBoard.Caption  := FieldByName('FORE').AsString;
    LOther.Caption  := FieldByName('OTHER').AsString;

    LSeRatio.Caption := FormatFloat('#,##0.00',FieldByName('SEOUL').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LKARatio.Caption := FormatFloat('#,##0.00',FieldByName('KAIST').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LPORatio.Caption := FormatFloat('#,##0.00',FieldByName('POHANG').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LYERatio.Caption := FormatFloat('#,##0.00',FieldByName('YENSE').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LKORatio.Caption := FormatFloat('#,##0.00',FieldByName('KOREA').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LBoRatio.Caption := FormatFloat('#,##0.00',FieldByName('FORE').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LOTRatio.Caption := FormatFloat('#,##0.00',FieldByName('OTHER').AsFloat/FieldByName('TOTAL').AsFloat*100)+' %';
    LNowDate.Caption := FormatDateTime('yyyy"년 "mm"월 "dd"일 "hh"시 현재"',FieldByName('sysdate').AsDateTime );
    begin
    Close;
    SQL.Clear;
    SQL.Add('select Count(decode(gubun,''1'',1)) newinwon,             '+ chr(13) + chr(10) +
            ' Count(decode(gubun,''2'',1)) carinwon,                   '+ chr(13) + chr(10) +
	    ' Count(decode(gubun,''1'',1,''2'',1)) totinwon,           '+ chr(13) + chr(10) +
	    ' round(Count(decode(gubun,''1'',1))/41,2) newratio,       '+ chr(13) + chr(10) +
            ' round(Count(decode(gubun,''2'',1))/42,2) carratio,       '+ chr(13) + chr(10) +
            ' round(Count(decode(gubun,''1'',1,''2'',1))/83,2) totratio'+ chr(13) + chr(10) +
            ' from prectmas                                            '+ chr(13) + chr(10) +
            'where rabasdate = '''+ sRasBasDate + '''                  ');
    Open;

    l_APnewInwon.Caption := FieldByName('newinwon').AsString;
    l_APcarInwon.Caption:= FieldByName('carinwon').AsString;
    l_Sum2.Caption      := FieldByName('totinwon').AsString;
    L_newratio.Caption :=  '1  :  '+FieldByName('newratio').AsString;
    L_carRatio.Caption :=  '1  :  '+FieldByName('carratio').AsString;
    L_Sum3.Caption      := '1  :  '+FieldByName('totratio').AsString;
    end;

  end;

end;

procedure TPrintForm.Report1EndPage(Sender: TCustomQuickRep);
begin
  Fm_PreviewForm.Show;
end;

{
procedure TPrintForm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var iCnt : integer;
begin
  iCnt := 1;
  with qry_Select do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
        '(  select A.apjobkind GUBUN,decode(A.apjobkind,''10'',''경영기획'',''11'',''경영지원'',  '+
        '                          ''12'',''Finance'',''20'',''마케팅'',                         '+
        '						  ''30'',''NW계획'',''31'',''NW운용'',                           '+
        '						  ''32'',''영업지원'',''33'',''IT'',''40'',''연구개발'',         '+
        '						  ''70'',''보안CERT'',''71'',''EDW'',''72'',''ERP'',             '+
        '						  ''80'',''사업'',''81'',''컨텐츠'') jobkindNM,                  '+
        '       count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",               '+
        '	   count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사",                '+
        '	   count(decode(substr(univid,1,1),''3'',NULL,''4'',NULL,1)) "국내대",               '+
        '  	   count(decode(substr(univid,1,1),''3'',1,''4'',1,NULL)) "해외대",                  '+
        '	   count(decode(substr(regno,8,1),''1'',1,''5'',1,''7'',1,NULL)) "남자",             '+
        '	   count(decode(substr(regno,8,1),''2'',1,''6'',1,''8'',1,NULL)) "여자",             '+
        '	   count(decode(aparea,''1'',1,NULL)) "서울",                                        '+
        '	   count(decode(aparea,''2'',1,NULL)) "부산",                                        '+
        '	   count(decode(aparea,''3'',1,NULL)) "충청",                                        '+
        '	   count(decode(aparea,''4'',1,NULL)) "경북",                                        '+
        '	   count(decode(aparea,''5'',1,NULL)) "호남",                                        '+
        '	   count(rid) "지원현황"                                                             '+
        '  from prectmas A where rabasdate =''200410''                                           '+
        'group by A.apjobkind                                                                    '+
        'UNION ALL                                                                               '+
        'select DEPT||''X'' GUBUN,''소계'' jobkindNM,                                            '+
        '       count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",               '+
        '	count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사",                '+
        '	count(decode(substr(univid,1,1),''3'',NULL,''4'',NULL,1)) "국내대",               '+
        '  	count(decode(substr(univid,1,1),''3'',1,''4'',1,NULL)) "해외대",                  '+
        '	count(decode(substr(regno,8,1),''1'',1,''5'',1,''7'',1,NULL)) "남자",             '+
        '	count(decode(substr(regno,8,1),''2'',1,''6'',1,''8'',1,NULL)) "여자",             '+
        '	count(decode(aparea,''1'',1,NULL)) "서울",                                        '+
        '	count(decode(aparea,''2'',1,NULL)) "부산",                                        '+
        '	count(decode(aparea,''3'',1,NULL)) "충청",                                        '+
        '	count(decode(aparea,''4'',1,NULL)) "경북",                                        '+
        '	count(decode(aparea,''5'',1,NULL)) "호남",                                        '+
        '	count(rid) "지원현황"                                                             '+
        '  from prectmas A                                                                       '+
        'where rabasdate =''200410''                                                             '+
        '  and A.DEPT NOT IN (''02'',''04'')                                                       '+
        'group by A.DEPT                                                                         '+
        'UNION ALL                                                                               '+
        'select decode(A.gubun,''1'',''5'',''9'')||''Z'' GUBUN,''합계'' jobkindNM,               '+
        '       count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",               '+
        '	   count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사",                '+
        '	   count(decode(substr(univid,1,1),''3'',NULL,''4'',NULL,1)) "국내대",               '+
        '  	   count(decode(substr(univid,1,1),''3'',1,''4'',1,NULL)) "해외대",                  '+
        '	   count(decode(substr(regno,8,1),''1'',1,''5'',1,''7'',1,NULL)) "남자",             '+
        '	   count(decode(substr(regno,8,1),''2'',1,''6'',1,''8'',1,NULL)) "여자",             '+
        '	   count(decode(aparea,''1'',1,NULL)) "서울",                                        '+
        '	   count(decode(aparea,''2'',1,NULL)) "부산",                                        '+
        '	   count(decode(aparea,''3'',1,NULL)) "충청",                                        '+
        '	   count(decode(aparea,''4'',1,NULL)) "경북",                                        '+
        '	   count(decode(aparea,''5'',1,NULL)) "호남",                                        '+
        '	   count(rid) "지원현황"                                                             '+
        '  from prectmas A where rabasdate =''200410''                                           '+
        'group by A.gubun                                                                        '+
        'UNION ALL                                                                               '+
        'select ''ZZ'' GUBUN,''총계'' jobkindNM,                                                 '+
        '       count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",               '+
        '	   count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사",                '+
        '	   count(decode(substr(univid,1,1),''3'',NULL,''4'',NULL,1)) "국내대",               '+
        '  	   count(decode(substr(univid,1,1),''3'',1,''4'',1,NULL)) "해외대",                  '+
        '	   count(decode(substr(regno,8,1),''1'',1,''5'',1,''7'',1,NULL)) "남자",             '+
        '	   count(decode(substr(regno,8,1),''2'',1,''6'',1,''8'',1,NULL)) "여자",             '+
        '	   count(decode(aparea,''1'',1,NULL)) "서울",                                        '+
        '	   count(decode(aparea,''2'',1,NULL)) "부산",                                        '+
        '	   count(decode(aparea,''3'',1,NULL)) "충청",                                        '+
        '	   count(decode(aparea,''4'',1,NULL)) "경북",                                        '+
        '	   count(decode(aparea,''5'',1,NULL)) "호남",                                        '+
        '	   count(rid) "지원현황"                                                             '+
        '  from prectmas A where rabasdate =''200410''                                        )   '+
        'order by gubun                                                                          ');
    Open;
    First;
    while not EOF do
    begin
       (Self.FindComponent('A'+inttostr(iCnt)) as TQRLabel).Caption := FieldByName('학사').AsString;
       TQRLabel(Self.FindComponent('B'+inttostr(iCnt))).Caption := FieldByName('박사').AsString;
       TQRLabel(Self.FindComponent('C'+inttostr(iCnt))).Caption := FieldByName('국내대').AsString;
       TQRLabel(Self.FindComponent('D'+inttostr(iCnt))).Caption := FieldByName('해외대').AsString;
       TQRLabel(Self.FindComponent('E'+inttostr(iCnt))).Caption := FieldByName('남자').AsString;
       TQRLabel(Self.FindComponent('F'+inttostr(iCnt))).Caption := FieldByName('여자').AsString;
       TQRLabel(Self.FindComponent('G'+inttostr(iCnt))).Caption := FieldByName('서울').AsString;
       TQRLabel(Self.FindComponent('H'+inttostr(iCnt))).Caption := FieldByName('부산').AsString;
       TQRLabel(Self.FindComponent('I'+inttostr(iCnt))).Caption := FieldByName('충청').AsString;
       TQRLabel(Self.FindComponent('J'+inttostr(iCnt))).Caption := FieldByName('경북').AsString;
       TQRLabel(Self.FindComponent('K'+inttostr(iCnt))).Caption := FieldByName('호남').AsString;
       TQRLabel(Self.FindComponent('L'+inttostr(iCnt))).Caption := FieldByName('지원현황').AsString;
      iCnt := iCnt + 1;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('select Count(decode(gubun,''1'',1)) newinwon,             '+
            ' Count(decode(gubun,''2'',1)) carinwon,                   '+
	        ' Count(decode(gubun,''1'',1,''2'',1)) totinwon,           '+
	        ' round(Count(decode(gubun,''1'',1))/33,2) newratio,       '+
            'round(Count(decode(gubun,''2'',1))/7,2) carratio,         '+
            ' round(Count(decode(gubun,''1'',1,''2'',1))/40,2) totratio'+
            ' from prectmas                                            '+
            'where rabasdate =''200410''                               ');
    Open;

    l_APnewInwon.Caption := FieldByName('newinwon').AsString;
    l_APcarInwon.Caption:= FieldByName('carinwon').AsString;
    l_Sum2.Caption      := FieldByName('totinwon').AsString;
    L_newratio.Caption :=  '1  :  '+FieldByName('newratio').AsString;
    L_carRatio.Caption :=  '1  :  '+FieldByName('carratio').AsString;
    L_Sum3.Caption      := '1  :  '+FieldByName('totratio').AsString;

  end;
end;
}
end.
