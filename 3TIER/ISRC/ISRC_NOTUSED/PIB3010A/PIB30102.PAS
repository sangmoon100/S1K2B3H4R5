{===================== Program Header ==========================================
 PROGRAM-NAME   : PKC2081C(근로소득 원천징수영수증 발급)  2013년 양식
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여List
 Programmer     : 강 륜 종
 Date           : 2004.12.16.

Update Contents
  Version  date(yy.mm.dd)  programmer    relevant doc.no   description
  10.00    2004.12.16      강 륜 종      2004년 개정세법   출력양식개발(세로양식으로)
  20.00    2005.11.        강 륜 종      2005년 개정양식으로 변경. (부양가족명세 추가)
  30.00    2006.12.        강 륜 종      2006년 개정양식으로 변경. (2페이지에 상세 부양가족 명세추가)
================================================================================}
unit Pib30102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, Peprnview, MemDS, DBAccess,
  Ora, Func, Tmax_DataSetText;

type
  TFm_Pib30102 = class(TForm)
    QRCompositeReport1: TQRCompositeReport;
    Qry_Fami: TTMaxDataSet;
    Qry_Mater: TTMaxDataSet;
    AA1: TTMaxDataSet;
    Qry_Bank: TTMaxDataSet;
    Qry_Rent: TTMaxDataSet;
    QuickRep3: TQuickRep;
    DetailBand3: TQRBand;
    QRLabel556: TQRLabel;
    QRLabel295: TQRLabel;
    QRLabel243: TQRLabel;
    QRLabel242: TQRLabel;
    QRLabel249: TQRLabel;
    QRLabel248: TQRLabel;
    QRLabel247: TQRLabel;
    QRLabel308: TQRLabel;
    QRLabel326: TQRLabel;
    QRLabel245: TQRLabel;
    QRLabel325: TQRLabel;
    QRLabel244: TQRLabel;
    QRLabel336: TQRLabel;
    QRLabel335: TQRLabel;
    QRLabel334: TQRLabel;
    QRLabel309: TQRLabel;
    QRLabel312: TQRLabel;
    QRLabel313: TQRLabel;
    QRLabel333: TQRLabel;
    QRLabel351: TQRLabel;
    QRLabel350: TQRLabel;
    QRLabel337: TQRLabel;
    QRShape264: TQRShape;
    QRShape266: TQRShape;
    QRShape101: TQRShape;
    QRShape71: TQRShape;
    QRShape70: TQRShape;
    QRShape67: TQRShape;
    QRShape63: TQRShape;
    QRShape62: TQRShape;
    QRShape61: TQRShape;
    QRShape60: TQRShape;
    QRShape58: TQRShape;
    QRShape95: TQRShape;
    QRShape90: TQRShape;
    QRShape87: TQRShape;
    QRShape84: TQRShape;
    QRShape80: TQRShape;
    QRShape79: TQRShape;
    QRShape45: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape56: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel121: TQRLabel;
    Qtaxgross: TQRLabel;
    Qlaborded: TQRLabel;
    Qlaboramt: TQRLabel;
    Qselfded: TQRLabel;
    Qmateded: TQRLabel;
    Qfamided: TQRLabel;
    Qoldded: TQRLabel;
    Qobsded: TQRLabel;
    Qwomanded: TQRLabel;
    Qanuded: TQRLabel;
    Qmedded: TQRLabel;
    Qhouseded: TQRLabel;
    Qspecialded: TQRLabel;
    Qchagamamt: TQRLabel;
    Qpended: TQRLabel;
    Qtinvestded: TQRLabel;
    Qcreditded: TQRLabel;
    Qtaxlevel: TQRLabel;
    Qcalctax: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    Qmicomtded: TQRLabel;
    Qhloanded: TQRLabel;
    Qforided: TQRLabel;
    Qtdedsum: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    Qincomeded: TQRLabel;
    Qdintax2: TQRLabel;
    QRShape48: TQRShape;
    QRShape53: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape12: TQRShape;
    Qcostockded: TQRLabel;
    QRLabel198: TQRLabel;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape59: TQRShape;
    QRShape83: TQRShape;
    QRShape187: TQRShape;
    Qhouseintded: TQRLabel;
    QRShape189: TQRShape;
    QRLabel195: TQRLabel;
    QRLabel196: TQRLabel;
    QRShape186: TQRShape;
    QRShape86: TQRShape;
    QRShape191: TQRShape;
    QRLabel197: TQRLabel;
    QRLabel210: TQRLabel;
    QRShape34: TQRShape;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRShape43: TQRShape;
    QRShape55: TQRShape;
    QRLabel136: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRShape66: TQRShape;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel160: TQRLabel;
    QRShape193: TQRShape;
    QRLabel161: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel174: TQRLabel;
    QRShape194: TQRShape;
    QRShape214: TQRShape;
    QRShape215: TQRShape;
    QRLabel189: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel212: TQRLabel;
    QRShape217: TQRShape;
    QRLabel226: TQRLabel;
    QRLabel227: TQRLabel;
    QRLabel168: TQRLabel;
    Qhireded: TQRLabel;
    QRShape219: TQRShape;
    QRLabel237: TQRLabel;
    QRLabel238: TQRLabel;
    QRShape221: TQRShape;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRLabel241: TQRLabel;
    QRShape222: TQRShape;
    Qhouserentded: TQRLabel;
    QRShape224: TQRShape;
    QRShape85: TQRShape;
    QRShape225: TQRShape;
    QRShape226: TQRShape;
    QRShape229: TQRShape;
    QRLabel250: TQRLabel;
    QRLabel251: TQRLabel;
    QRLabel253: TQRLabel;
    QRShape230: TQRShape;
    QRShape232: TQRShape;
    QRShape81: TQRShape;
    Qhousvsubded: TQRLabel;
    Qhousvcomded: TQRLabel;
    Qhousvempded: TQRLabel;
    QRShape292: TQRShape;
    QRLabel306: TQRLabel;
    QRLabel307: TQRLabel;
    QRShape293: TQRShape;
    QRShape294: TQRShape;
    QRShape295: TQRShape;
    Qhouseded3: TQRLabel;
    Qhouseintded2: TQRLabel;
    Qhouseintded3: TQRLabel;
    QRLabel324: TQRLabel;
    QRShape308: TQRShape;
    QRShape310: TQRShape;
    QRShape311: TQRShape;
    QRShape312: TQRShape;
    QRShape313: TQRShape;
    QRShape314: TQRShape;
    Qhouseintded4: TQRLabel;
    Qhouseintded5: TQRLabel;
    QRLabel354: TQRLabel;
    QRLabel115: TQRLabel;
    QSparentded: TQRLabel;
    QRLabel252: TQRLabel;
    Qhsrentinded: TQRLabel;
    Qsplimitovded: TQRLabel;
    QRShape65: TQRShape;
    QRLabel191: TQRLabel;
    QRLabel98: TQRLabel;
    QRShape72: TQRShape;
    QRShape75: TQRShape;
    QRLabel100: TQRLabel;
    Qlongfundded: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel340: TQRLabel;
    QRShape78: TQRShape;
    QRLabel339: TQRLabel;
    QRLabel395: TQRLabel;
    QRLabel396: TQRLabel;
    QRLabel432: TQRLabel;
    QRShape96: TQRShape;
    QRShape44: TQRShape;
    QRShape118: TQRShape;
    QRLabel433: TQRLabel;
    QRLabel434: TQRLabel;
    QRLabel223: TQRLabel;
    QRLabel228: TQRLabel;
    QRShape119: TQRShape;
    QRShape46: TQRShape;
    QRLabel437: TQRLabel;
    QRLabel438: TQRLabel;
    QRLabel442: TQRLabel;
    QRShape175: TQRShape;
    QRShape177: TQRShape;
    QRLabel444: TQRLabel;
    QRLabel445: TQRLabel;
    QRLabel447: TQRLabel;
    QRShape178: TQRShape;
    QRShape190: TQRShape;
    QRLabel453: TQRLabel;
    QRLabel461: TQRLabel;
    QRLabel462: TQRLabel;
    QRShape216: TQRShape;
    QRShape218: TQRShape;
    QRLabel463: TQRLabel;
    QRLabel464: TQRLabel;
    QRLabel465: TQRLabel;
    QRLabel472: TQRLabel;
    QRLabel481: TQRLabel;
    QRShape220: TQRShape;
    QRLabel483: TQRLabel;
    QRShape223: TQRShape;
    QRLabel485: TQRLabel;
    QRShape267: TQRShape;
    QRLabel486: TQRLabel;
    QRShape276: TQRShape;
    QRShape277: TQRShape;
    QRLabel120: TQRLabel;
    QRLabel487: TQRLabel;
    QRShape89: TQRShape;
    QRLabel488: TQRLabel;
    QRShape93: TQRShape;
    QRLabel499: TQRLabel;
    QRShape94: TQRShape;
    QRLabel500: TQRLabel;
    QRShape227: TQRShape;
    QRLabel503: TQRLabel;
    QRLabel504: TQRLabel;
    QRShape278: TQRShape;
    QRLabel505: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel213: TQRLabel;
    QRLabel221: TQRLabel;
    QRLabel222: TQRLabel;
    QRLabel224: TQRLabel;
    QRLabel225: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel355: TQRLabel;
    QRShape287: TQRShape;
    QRShape288: TQRShape;
    QRLabel362: TQRLabel;
    QRLabel363: TQRLabel;
    Qnpended: TQRLabel;
    Qguarded: TQRLabel;
    Qhosded: TQRLabel;
    Qeduded: TQRLabel;
    Qpolided1: TQRLabel;
    Qpolided2: TQRLabel;
    Qagiveded: TQRLabel;
    Qpgivededsum: TQRLabel;
    QRShape296: TQRShape;
    QRLabel368: TQRLabel;
    QRLabel369: TQRLabel;
    Qstanded: TQRLabel;
    QRLabel164: TQRLabel;
    Qngiveded: TQRLabel;
    QRLabel370: TQRLabel;
    QRLabel371: TQRLabel;
    Qchildtaxded: TQRLabel;
    QRLabel484: TQRLabel;
    QRLabel494: TQRLabel;
    Qnpentaxded: TQRLabel;
    Qguartaxded: TQRLabel;
    Qhostaxded: TQRLabel;
    Qedutaxded: TQRLabel;
    Qpolitaxded1: TQRLabel;
    Qpolitaxded2: TQRLabel;
    Qagivetaxded: TQRLabel;
    Qpgivetaxded: TQRLabel;
    Qtaxdedsum: TQRLabel;
    QRShape47: TQRShape;
    QRShape69: TQRShape;
    QRShape50: TQRShape;
    QRLabel516: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel173: TQRLabel;
    QRShape338: TQRShape;
    QRLabel548: TQRLabel;
    QRLabel552: TQRLabel;
    Qhouserenttaxded: TQRLabel;
    QRShape386: TQRShape;
    QRShape391: TQRShape;
    QRShape64: TQRShape;
    QRShape92: TQRShape;
    QRShape388: TQRShape;
    QRLabel234: TQRLabel;
    QRLabel236: TQRLabel;
    Qobsguarded: TQRLabel;
    Qobsguartaxded: TQRLabel;
    QRShape393: TQRShape;
    QRLabel506: TQRLabel;
    QRShape394: TQRShape;
    QRLabel507: TQRLabel;
    QRShape395: TQRShape;
    Qinfanttaxded: TQRLabel;
    Qaddbabytaxded: TQRLabel;
    QRLabel439: TQRLabel;
    QRLabel496: TQRLabel;
    QRLabel508: TQRLabel;
    Qfewno: TQRLabel;
    Qchildno: TQRLabel;
    Qbabyno: TQRLabel;
    QRShape398: TQRShape;
    QRShape399: TQRShape;
    QRLabel509: TQRLabel;
    QRLabel510: TQRLabel;
    QRShape400: TQRShape;
    QRLabel511: TQRLabel;
    QRShape401: TQRShape;
    QRLabel512: TQRLabel;
    QRShape402: TQRShape;
    QRLabel513: TQRLabel;
    QRLabel514: TQRLabel;
    QRLabel515: TQRLabel;
    QRLabel546: TQRLabel;
    QRLabel547: TQRLabel;
    QRLabel553: TQRLabel;
    QRLabel554: TQRLabel;
    QRLabel555: TQRLabel;
    QRLabel330: TQRLabel;
    QRShape403: TQRShape;
    QRLabel331: TQRLabel;
    QRShape404: TQRShape;
    QRLabel332: TQRLabel;
    QRLabel338: TQRLabel;
    QRLabel557: TQRLabel;
    QRLabel558: TQRLabel;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    QRLabel327: TQRLabel;
    QRLabel284: TQRLabel;
    QRLabel279: TQRLabel;
    QRLabel278: TQRLabel;
    QRLabel277: TQRLabel;
    QRLabel276: TQRLabel;
    QRLabel275: TQRLabel;
    QRLabel274: TQRLabel;
    QRLabel273: TQRLabel;
    QRLabel272: TQRLabel;
    QRLabel271: TQRLabel;
    QRLabel268: TQRLabel;
    QRLabel267: TQRLabel;
    QRLabel266: TQRLabel;
    QRLabel265: TQRLabel;
    QRLabel264: TQRLabel;
    QRLabel263: TQRLabel;
    QRLabel262: TQRLabel;
    QRLabel261: TQRLabel;
    QRLabel260: TQRLabel;
    QRLabel235: TQRLabel;
    QRLabel233: TQRLabel;
    QRLabel353: TQRLabel;
    QRLabel246: TQRLabel;
    QRLabel305: TQRLabel;
    QRLabel576: TQRLabel;
    QRLabel577: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel575: TQRLabel;
    QRLabel574: TQRLabel;
    QRLabel573: TQRLabel;
    QRLabel572: TQRLabel;
    QRShape379: TQRShape;
    QRShape378: TQRShape;
    QRShape377: TQRShape;
    QRShape376: TQRShape;
    QRShape361: TQRShape;
    QRShape355: TQRShape;
    QRShape353: TQRShape;
    QRShape351: TQRShape;
    QRShape350: TQRShape;
    QRShape349: TQRShape;
    QRShape384: TQRShape;
    QRShape380: TQRShape;
    QRShape348: TQRShape;
    QRShape347: TQRShape;
    QRShape346: TQRShape;
    QRShape345: TQRShape;
    QRShape344: TQRShape;
    QRShape343: TQRShape;
    QRShape342: TQRShape;
    QRShape341: TQRShape;
    QRShape340: TQRShape;
    QRShape339: TQRShape;
    QRShape335: TQRShape;
    QRShape336: TQRShape;
    QRLabel410: TQRLabel;
    QRLabel269: TQRLabel;
    QRLabel289: TQRLabel;
    QRdedYN20: TQRLabel;
    QRLabel321: TQRLabel;
    QRLabel288: TQRLabel;
    QRLabel270: TQRLabel;
    QRLabel435: TQRLabel;
    QRLabel436: TQRLabel;
    QRLabel292: TQRLabel;
    QRLabel291: TQRLabel;
    Fami_Name1: TQRLabel;
    Fami_JuminID1: TQRLabel;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    QRShape149: TQRShape;
    QRLabel200: TQRLabel;
    QRLabel204: TQRLabel;
    QRLabel205: TQRLabel;
    QRLabel206: TQRLabel;
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    FAMIREL_1: TQRLabel;
    FAMIREL_3: TQRLabel;
    FAMIREL_4: TQRLabel;
    FAMIREL_5: TQRLabel;
    FAMIREL_6: TQRLabel;
    FAMIREL_7: TQRLabel;
    Fami_Name7: TQRLabel;
    Fami_Name6: TQRLabel;
    Fami_Name5: TQRLabel;
    Fami_Name4: TQRLabel;
    Fami_Name3: TQRLabel;
    Fami_JuminID3: TQRLabel;
    Fami_JuminID4: TQRLabel;
    Fami_JuminID5: TQRLabel;
    Fami_JuminID6: TQRLabel;
    Fami_JuminID7: TQRLabel;
    FAMIREL_8: TQRLabel;
    Fami_Name8: TQRLabel;
    Fami_JuminID8: TQRLabel;
    FAMIREL_9: TQRLabel;
    Fami_Name9: TQRLabel;
    Fami_JuminID9: TQRLabel;
    FAMIREL_0: TQRLabel;
    Fami_Name0: TQRLabel;
    Fami_JuminID0: TQRLabel;
    QRLabel280: TQRLabel;
    QRLabel315: TQRLabel;
    QRLabel316: TQRLabel;
    QRLabel319: TQRLabel;
    QRLabel281: TQRLabel;
    QRLabel282: TQRLabel;
    QRLabel286: TQRLabel;
    QRLabel287: TQRLabel;
    QRLabel290: TQRLabel;
    QRShape168: TQRShape;
    QRLabel293: TQRLabel;
    QRL_totcnt: TQRLabel;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRdedYN11: TQRLabel;
    QRdedYN12: TQRLabel;
    QRdedYN13: TQRLabel;
    QRdedYN14: TQRLabel;
    QRdedYN15: TQRLabel;
    QRdedYN16: TQRLabel;
    QRdedYN17: TQRLabel;
    QRdedYN18: TQRLabel;
    QRdedYN19: TQRLabel;
    QRdedYN10: TQRLabel;
    QRdedYN21: TQRLabel;
    QRdedYN22: TQRLabel;
    QRdedYN23: TQRLabel;
    QRdedYN24: TQRLabel;
    QRdedYN25: TQRLabel;
    QRdedYN26: TQRLabel;
    QRdedYN27: TQRLabel;
    QRdedYN28: TQRLabel;
    QRdedYN29: TQRLabel;
    QRdedYN41: TQRLabel;
    QRdedYN42: TQRLabel;
    QRdedYN43: TQRLabel;
    QRdedYN44: TQRLabel;
    QRdedYN45: TQRLabel;
    QRdedYN47: TQRLabel;
    QRdedYN48: TQRLabel;
    QRdedYN49: TQRLabel;
    QRdedYN40: TQRLabel;
    QRdedamt4A1: TQRLabel;
    QRdedamt4A2: TQRLabel;
    QRdedamt4A3: TQRLabel;
    QRdedamt4A4: TQRLabel;
    QRdedamt4A5: TQRLabel;
    QRdedamt4A6: TQRLabel;
    QRdedamt4A7: TQRLabel;
    QRdedamt4A8: TQRLabel;
    QRdedamt4A9: TQRLabel;
    QRdedamt4A0: TQRLabel;
    QRdedamt4B0: TQRLabel;
    QRdedamt4B9: TQRLabel;
    QRdedamt4B8: TQRLabel;
    QRdedamt4B7: TQRLabel;
    QRdedamt4B6: TQRLabel;
    QRdedamt4B5: TQRLabel;
    QRdedamt4B4: TQRLabel;
    QRdedamt4B3: TQRLabel;
    QRdedamt4B2: TQRLabel;
    QRdedamt4B1: TQRLabel;
    QRdedamt5B0: TQRLabel;
    QRdedamt5B9: TQRLabel;
    QRdedamt5B8: TQRLabel;
    QRdedamt5B7: TQRLabel;
    QRdedamt5B6: TQRLabel;
    QRdedamt5B5: TQRLabel;
    QRdedamt5B4: TQRLabel;
    QRdedamt5B3: TQRLabel;
    QRdedamt5B2: TQRLabel;
    QRdedamt5B1: TQRLabel;
    QRdedamt5B: TQRLabel;
    QRdedamt5A: TQRLabel;
    QRdedamt5A1: TQRLabel;
    QRdedamt5A2: TQRLabel;
    QRdedamt5A3: TQRLabel;
    QRdedamt5A4: TQRLabel;
    QRdedamt5A5: TQRLabel;
    QRdedamt5A6: TQRLabel;
    QRdedamt5A7: TQRLabel;
    QRdedamt5A8: TQRLabel;
    QRdedamt5A9: TQRLabel;
    QRdedamt5A0: TQRLabel;
    QRdedamt6B0: TQRLabel;
    QRdedamt6B9: TQRLabel;
    QRdedamt6B8: TQRLabel;
    QRdedamt6B7: TQRLabel;
    QRdedamt6B6: TQRLabel;
    QRdedamt6B5: TQRLabel;
    QRdedamt6B4: TQRLabel;
    QRdedamt6B3: TQRLabel;
    QRdedamt6B2: TQRLabel;
    QRdedamt6B1: TQRLabel;
    QRdedamt6B: TQRLabel;
    QRdedamt6A: TQRLabel;
    QRdedamt6A1: TQRLabel;
    QRdedamt6A2: TQRLabel;
    QRdedamt6A3: TQRLabel;
    QRdedamt6A4: TQRLabel;
    QRdedamt6A5: TQRLabel;
    QRdedamt6A6: TQRLabel;
    QRdedamt6A7: TQRLabel;
    QRdedamt6A8: TQRLabel;
    QRdedamt6A9: TQRLabel;
    QRdedamt6A0: TQRLabel;
    QRdedamt7B0: TQRLabel;
    QRdedamt7B9: TQRLabel;
    QRdedamt7B8: TQRLabel;
    QRdedamt7B7: TQRLabel;
    QRdedamt7B6: TQRLabel;
    QRdedamt7B5: TQRLabel;
    QRdedamt7B4: TQRLabel;
    QRdedamt7B3: TQRLabel;
    QRdedamt7B2: TQRLabel;
    QRdedamt7B1: TQRLabel;
    QRdedamt7B: TQRLabel;
    QRdedamt7A: TQRLabel;
    QRdedamt7A1: TQRLabel;
    QRdedamt7A2: TQRLabel;
    QRdedamt7A3: TQRLabel;
    QRdedamt7A4: TQRLabel;
    QRdedamt7A5: TQRLabel;
    QRdedamt7A6: TQRLabel;
    QRdedamt7A7: TQRLabel;
    QRdedamt7A8: TQRLabel;
    QRdedamt7A9: TQRLabel;
    QRdedamt7A0: TQRLabel;
    QRdedamt8A: TQRLabel;
    QRdedamt8A1: TQRLabel;
    QRdedamt8A2: TQRLabel;
    QRdedamt8A3: TQRLabel;
    QRdedamt8A4: TQRLabel;
    QRdedamt8A5: TQRLabel;
    QRdedamt8A6: TQRLabel;
    QRdedamt8A7: TQRLabel;
    QRdedamt8A8: TQRLabel;
    QRdedamt8A9: TQRLabel;
    QRdedamt8A0: TQRLabel;
    QRLabel426: TQRLabel;
    native_1: TQRLabel;
    native_3: TQRLabel;
    native_4: TQRLabel;
    native_5: TQRLabel;
    native_6: TQRLabel;
    native_7: TQRLabel;
    native_8: TQRLabel;
    native_9: TQRLabel;
    native_0: TQRLabel;
    native_2: TQRLabel;
    FAMIREL_2: TQRLabel;
    Fami_Name2: TQRLabel;
    Fami_JuminID2: TQRLabel;
    QRdedYN30: TQRLabel;
    QRShape52: TQRShape;
    QRdedYN46: TQRLabel;
    FAMIREL_10: TQRLabel;
    Fami_Name10: TQRLabel;
    Fami_JuminID10: TQRLabel;
    QRdedYN110: TQRLabel;
    QRdedYN210: TQRLabel;
    QRdedYN410: TQRLabel;
    QRdedamt4A10: TQRLabel;
    QRdedamt4B10: TQRLabel;
    QRdedamt5B10: TQRLabel;
    QRdedamt5A10: TQRLabel;
    QRdedamt6B10: TQRLabel;
    QRdedamt6A10: TQRLabel;
    QRdedamt7B10: TQRLabel;
    QRdedamt7A10: TQRLabel;
    QRdedamt8A10: TQRLabel;
    native_10: TQRLabel;
    QRShape135: TQRShape;
    QRLabel303: TQRLabel;
    QRShape57: TQRShape;
    QRShape161: TQRShape;
    QRShape112: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape54: TQRShape;
    QRShape127: TQRShape;
    QRShape129: TQRShape;
    QRShape131: TQRShape;
    QRShape133: TQRShape;
    QRShape138: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRShape143: TQRShape;
    QRShape145: TQRShape;
    QRShape148: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape173: TQRShape;
    QRShape176: TQRShape;
    QRShape179: TQRShape;
    QRShape182: TQRShape;
    QRdedamt11B2: TQRLabel;
    QRdedamt11B6: TQRLabel;
    QRdedamt11B5: TQRLabel;
    QRdedamt11B4: TQRLabel;
    QRdedamt11B3: TQRLabel;
    QRdedamt11B10: TQRLabel;
    QRdedamt11A2: TQRLabel;
    QRdedamt11A3: TQRLabel;
    QRdedamt11A4: TQRLabel;
    QRdedamt11A5: TQRLabel;
    QRdedamt11A6: TQRLabel;
    QRdedamt11A10: TQRLabel;
    QRShape124: TQRShape;
    QRdedamt12A: TQRLabel;
    QRdedamt12B: TQRLabel;
    QRdedamt12A0: TQRLabel;
    QRdedamt12B0: TQRLabel;
    QRdedamt12A1: TQRLabel;
    QRdedamt12B1: TQRLabel;
    QRdedamt12A2: TQRLabel;
    QRdedamt12B2: TQRLabel;
    QRdedamt12A3: TQRLabel;
    QRdedamt12B3: TQRLabel;
    QRdedamt12A4: TQRLabel;
    QRdedamt12B4: TQRLabel;
    QRdedamt12A5: TQRLabel;
    QRdedamt12B5: TQRLabel;
    QRdedamt12A6: TQRLabel;
    QRdedamt12B6: TQRLabel;
    QRdedamt12A7: TQRLabel;
    QRdedamt12B7: TQRLabel;
    QRdedamt12A8: TQRLabel;
    QRdedamt12B8: TQRLabel;
    QRdedamt12A9: TQRLabel;
    QRdedamt12B9: TQRLabel;
    QRdedamt12A10: TQRLabel;
    QRdedamt12B10: TQRLabel;
    QRShape130: TQRShape;
    QRShape134: TQRShape;
    QRLabel328: TQRLabel;
    QRLabel294: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRLabel296: TQRLabel;
    QRLabel297: TQRLabel;
    QRLabel298: TQRLabel;
    QRLabel299: TQRLabel;
    QRLabel300: TQRLabel;
    QRLabel301: TQRLabel;
    QRLabel302: TQRLabel;
    QRLabel304: TQRLabel;
    QRdedamt13B: TQRLabel;
    QRdedamt13B0: TQRLabel;
    QRdedamt13B2: TQRLabel;
    QRdedamt13B1: TQRLabel;
    QRdedamt13B6: TQRLabel;
    QRdedamt13B5: TQRLabel;
    QRdedamt13B4: TQRLabel;
    QRdedamt13B3: TQRLabel;
    QRdedamt13B10: TQRLabel;
    QRdedamt13B9: TQRLabel;
    QRdedamt13B8: TQRLabel;
    QRdedamt13B7: TQRLabel;
    QRdedamt13A: TQRLabel;
    QRdedamt13A0: TQRLabel;
    QRdedamt13A1: TQRLabel;
    QRdedamt13A2: TQRLabel;
    QRdedamt13A3: TQRLabel;
    QRdedamt13A4: TQRLabel;
    QRdedamt13A5: TQRLabel;
    QRdedamt13A6: TQRLabel;
    QRdedamt13A7: TQRLabel;
    QRdedamt13A8: TQRLabel;
    QRdedamt13A9: TQRLabel;
    QRdedamt13A10: TQRLabel;
    QRShape110: TQRShape;
    QRShape68: TQRShape;
    QRSparent: TQRLabel;
    QRLabel372: TQRLabel;
    QRLabel229: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel373: TQRLabel;
    QRLabel255: TQRLabel;
    QRLabel285: TQRLabel;
    QRLabel374: TQRLabel;
    QRLabel375: TQRLabel;
    QRLabel329: TQRLabel;
    QRLabel258: TQRLabel;
    QRLabel352: TQRLabel;
    QRLabel376: TQRLabel;
    QRLabel388: TQRLabel;
    QRLabel389: TQRLabel;
    QRdedamt15A: TQRLabel;
    QRdedamt15B: TQRLabel;
    QRdedamt15A0: TQRLabel;
    QRdedamt15B0: TQRLabel;
    QRdedamt15A1: TQRLabel;
    QRdedamt15B1: TQRLabel;
    QRdedamt15A2: TQRLabel;
    QRdedamt15B2: TQRLabel;
    QRdedamt15A3: TQRLabel;
    QRdedamt15B3: TQRLabel;
    QRdedamt15A4: TQRLabel;
    QRdedamt15B4: TQRLabel;
    QRdedamt15A5: TQRLabel;
    QRdedamt15B5: TQRLabel;
    QRdedamt15A6: TQRLabel;
    QRdedamt15B6: TQRLabel;
    QRdedamt15A7: TQRLabel;
    QRdedamt15B7: TQRLabel;
    QRdedamt15A8: TQRLabel;
    QRdedamt15B8: TQRLabel;
    QRdedamt15A9: TQRLabel;
    QRdedamt15B9: TQRLabel;
    QRdedamt15A10: TQRLabel;
    QRdedamt15B10: TQRLabel;
    QRLabel310: TQRLabel;
    QRLabel311: TQRLabel;
    QRShape320: TQRShape;
    QRLabel320: TQRLabel;
    QRmedhireamt0: TQRLabel;
    QRmedhireamt1: TQRLabel;
    QRShape290: TQRShape;
    QRShape321: TQRShape;
    QRShape322: TQRShape;
    QRShape323: TQRShape;
    QRShape324: TQRShape;
    QRShape325: TQRShape;
    QRShape326: TQRShape;
    QRShape327: TQRShape;
    QRShape328: TQRShape;
    QRShape329: TQRShape;
    QRShape330: TQRShape;
    QRShape333: TQRShape;
    QRdedamt4A: TQRLabel;
    QRdedamt4B: TQRLabel;
    QRShape163: TQRShape;
    QRdedamt11A: TQRLabel;
    QRdedamt11B: TQRLabel;
    QRdedamt11A0: TQRLabel;
    QRdedamt11B0: TQRLabel;
    QRdedamt11A1: TQRLabel;
    QRdedamt11B1: TQRLabel;
    QRShape169: TQRShape;
    QRdedamt11B7: TQRLabel;
    QRdedamt11A7: TQRLabel;
    QRShape162: TQRShape;
    QRShape315: TQRShape;
    QRdedamt11B8: TQRLabel;
    QRdedamt11A8: TQRLabel;
    QRdedamt11A9: TQRLabel;
    QRdedamt11B9: TQRLabel;
    QRShape156: TQRShape;
    QRLabel364: TQRLabel;
    QRdedAmt310: TQRLabel;
    QRbabyyn10: TQRLabel;
    QRdedAmt39: TQRLabel;
    QRbabyyn9: TQRLabel;
    QRdedAmt38: TQRLabel;
    QRbabyyn8: TQRLabel;
    QRdedAmt37: TQRLabel;
    QRbabyyn7: TQRLabel;
    QRdedAmt36: TQRLabel;
    QRbabyyn6: TQRLabel;
    QRdedAmt35: TQRLabel;
    QRbabyyn5: TQRLabel;
    QRdedAmt34: TQRLabel;
    QRbabyyn4: TQRLabel;
    QRdedAmt33: TQRLabel;
    QRbabyyn3: TQRLabel;
    QRdedAmt32: TQRLabel;
    QRbabyyn2: TQRLabel;
    QRdedAmt31: TQRLabel;
    QRbabyyn1: TQRLabel;
    QRdedAmt30: TQRLabel;
    QRbabyyn0: TQRLabel;
    QRShape396: TQRShape;
    QRLabel578: TQRLabel;
    QRdedamt4C: TQRLabel;
    QRdedamt4D: TQRLabel;
    QRdedamt4C0: TQRLabel;
    QRdedamt4D0: TQRLabel;
    QRdedamt4C1: TQRLabel;
    QRdedamt4D1: TQRLabel;
    QRdedamt4C2: TQRLabel;
    QRdedamt4D2: TQRLabel;
    QRdedamt4C3: TQRLabel;
    QRdedamt4D3: TQRLabel;
    QRdedamt4C4: TQRLabel;
    QRdedamt4D4: TQRLabel;
    QRdedamt4C5: TQRLabel;
    QRdedamt4D5: TQRLabel;
    QRdedamt4C6: TQRLabel;
    QRdedamt4D6: TQRLabel;
    QRdedamt4C7: TQRLabel;
    QRdedamt4D7: TQRLabel;
    QRdedamt4C8: TQRLabel;
    QRdedamt4D8: TQRLabel;
    QRdedamt4C9: TQRLabel;
    QRdedamt4D9: TQRLabel;
    QRdedamt4C10: TQRLabel;
    QRdedamt4D10: TQRLabel;
    QRShape397: TQRShape;
    QRLabel604: TQRLabel;
    QRLabel605: TQRLabel;
    QuickRep4: TQuickRep;
    QRBand2: TQRBand;
    QRShape82: TQRShape;
    QRLabel407: TQRLabel;
    QRLabel498: TQRLabel;
    QCoptely: TQRLabel;
    QRLabel497: TQRLabel;
    QRTely: TQRLabel;
    QRLabel493: TQRLabel;
    QRLabel492: TQRLabel;
    QRLabel491: TQRLabel;
    QRLabel490: TQRLabel;
    QRLabel489: TQRLabel;
    QRShape88: TQRShape;
    QRShape100: TQRShape;
    QRShape233: TQRShape;
    QRShape254: TQRShape;
    QRShape259: TQRShape;
    QRShape260: TQRShape;
    QRShape261: TQRShape;
    QRLabel565: TQRLabel;
    QRShape271: TQRShape;
    QRShape272: TQRShape;
    QRShape273: TQRShape;
    QRLabel624: TQRLabel;
    QRShape280: TQRShape;
    QRLabel551: TQRLabel;
    QRLabel561: TQRLabel;
    QRLabel562: TQRLabel;
    QRShape235: TQRShape;
    QRShape236: TQRShape;
    QRLabel391: TQRLabel;
    QRLabel431: TQRLabel;
    QRLabel440: TQRLabel;
    QRLabel446: TQRLabel;
    QRShape111: TQRShape;
    QRShape238: TQRShape;
    QRLabel456: TQRLabel;
    QRShape239: TQRShape;
    QRShape240: TQRShape;
    QRLabel457: TQRLabel;
    QRShape241: TQRShape;
    QRLabel458: TQRLabel;
    QRShape242: TQRShape;
    QRLabel459: TQRLabel;
    QRLabel460: TQRLabel;
    QRShape243: TQRShape;
    QRLabel390: TQRLabel;
    QRLabel467: TQRLabel;
    QRShape244: TQRShape;
    QRShape245: TQRShape;
    QRLabel468: TQRLabel;
    QRShape246: TQRShape;
    QRShape247: TQRShape;
    QRShape248: TQRShape;
    QRShape249: TQRShape;
    QRLabel469: TQRLabel;
    QRShape250: TQRShape;
    QRLabel470: TQRLabel;
    QRShape251: TQRShape;
    QRLabel471: TQRLabel;
    QRLabel473: TQRLabel;
    QRShape252: TQRShape;
    QRLabel474: TQRLabel;
    QRLabel475: TQRLabel;
    QRShape253: TQRShape;
    QRShape255: TQRShape;
    QRLabel476: TQRLabel;
    QRShape256: TQRShape;
    QRShape257: TQRShape;
    QRShape258: TQRShape;
    QRShape262: TQRShape;
    QRLabel477: TQRLabel;
    QRShape263: TQRShape;
    QRLabel478: TQRLabel;
    QRShape265: TQRShape;
    QRLabel479: TQRLabel;
    QRLabel480: TQRLabel;
    Qcorpnamey: TQRLabel;
    Qkornamey: TQRLabel;
    QAddry: TQRLabel;
    QCopaddry: TQRLabel;
    Qcorpnoy: TQRLabel;
    QJuminidy: TQRLabel;
    Qpengbn11: TQRLabel;
    Qpenbank11: TQRLabel;
    Qpencnt11: TQRLabel;
    Qpenamt11: TQRLabel;
    Qpended11: TQRLabel;
    Qpengbn12: TQRLabel;
    Qpenbank12: TQRLabel;
    Qpencnt12: TQRLabel;
    Qpenamt12: TQRLabel;
    Qpended12: TQRLabel;
    Qpengbn13: TQRLabel;
    Qpenbank13: TQRLabel;
    Qpencnt13: TQRLabel;
    Qpenamt13: TQRLabel;
    Qpended13: TQRLabel;
    Qnpengbn11: TQRLabel;
    Qnpengbn12: TQRLabel;
    Qnpengbn13: TQRLabel;
    Qnpenbank13: TQRLabel;
    Qnpenbank12: TQRLabel;
    Qnpenbank11: TQRLabel;
    Qnpencnt11: TQRLabel;
    Qnpencnt12: TQRLabel;
    Qnpencnt13: TQRLabel;
    Qnpenamt11: TQRLabel;
    Qnpenamt12: TQRLabel;
    Qnpenamt13: TQRLabel;
    Qnpended11: TQRLabel;
    Qnpended12: TQRLabel;
    Qnpended13: TQRLabel;
    Qpengbn14: TQRLabel;
    Qpenbank14: TQRLabel;
    Qpencnt14: TQRLabel;
    Qpenamt14: TQRLabel;
    Qpended14: TQRLabel;
    QRShape117: TQRShape;
    Qpengbn15: TQRLabel;
    Qpenbank15: TQRLabel;
    Qpencnt15: TQRLabel;
    Qpenamt15: TQRLabel;
    Qpended15: TQRLabel;
    QRShape281: TQRShape;
    Qpengbn16: TQRLabel;
    Qpenbank16: TQRLabel;
    Qpencnt16: TQRLabel;
    Qpenamt16: TQRLabel;
    Qpended16: TQRLabel;
    QRShape180: TQRShape;
    Qpengbn17: TQRLabel;
    Qpenbank17: TQRLabel;
    Qpencnt17: TQRLabel;
    Qpenamt17: TQRLabel;
    Qpended17: TQRLabel;
    QRShape181: TQRShape;
    Qnpengbn14: TQRLabel;
    Qnpenbank14: TQRLabel;
    Qnpencnt14: TQRLabel;
    Qnpenamt14: TQRLabel;
    Qnpended14: TQRLabel;
    QRShape285: TQRShape;
    Qnpengbn15: TQRLabel;
    Qnpenbank15: TQRLabel;
    Qnpencnt15: TQRLabel;
    Qnpenamt15: TQRLabel;
    Qnpended15: TQRLabel;
    QRShape286: TQRShape;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    Qlfundbank11: TQRLabel;
    Qlfundcnt11: TQRLabel;
    Qlfundamt11: TQRLabel;
    Qlfundded11: TQRLabel;
    QRShape228: TQRShape;
    Qpengbn18: TQRLabel;
    Qpenbank18: TQRLabel;
    Qpencnt18: TQRLabel;
    Qpenamt18: TQRLabel;
    Qpended18: TQRLabel;
    QRShape231: TQRShape;
    QRShape237: TQRShape;
    QRLabel393: TQRLabel;
    QRLabel394: TQRLabel;
    QRShape279: TQRShape;
    QRShape282: TQRShape;
    Qpengbn19: TQRLabel;
    Qpenbank19: TQRLabel;
    Qpencnt19: TQRLabel;
    Qpenamt19: TQRLabel;
    Qpended19: TQRLabel;
    QRShape283: TQRShape;
    Qpengbn110: TQRLabel;
    Qpenbank110: TQRLabel;
    Qpencnt110: TQRLabel;
    Qpenamt110: TQRLabel;
    Qpended110: TQRLabel;
    QRShape284: TQRShape;
    Qpengbn111: TQRLabel;
    Qpenbank111: TQRLabel;
    Qpencnt111: TQRLabel;
    Qpenamt111: TQRLabel;
    Qpended111: TQRLabel;
    QRShape297: TQRShape;
    Qpengbn112: TQRLabel;
    Qpenbank112: TQRLabel;
    Qpencnt112: TQRLabel;
    Qpenamt112: TQRLabel;
    Qpended112: TQRLabel;
    QRShape298: TQRShape;
    Qpengbn113: TQRLabel;
    Qpenbank113: TQRLabel;
    Qpencnt113: TQRLabel;
    Qpenamt113: TQRLabel;
    Qpended113: TQRLabel;
    QRShape299: TQRShape;
    Qlfundbank12: TQRLabel;
    Qlfundcnt12: TQRLabel;
    Qlfundamt12: TQRLabel;
    Qlfundded12: TQRLabel;
    QRShape300: TQRShape;
    QRLabel521: TQRLabel;
    QRLabel522: TQRLabel;
    QRShape301: TQRShape;
    QRShape302: TQRShape;
    QRShape319: TQRShape;
    QRLabel523: TQRLabel;
    QRLabel524: TQRLabel;
    QRLabel525: TQRLabel;
    QRLabel526: TQRLabel;
    Qlfundbank13: TQRLabel;
    Qlfundcnt13: TQRLabel;
    Qlfundamt13: TQRLabel;
    Qlfundded13: TQRLabel;
    QuickRep5: TQuickRep;
    QRBand4: TQRBand;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape375: TQRShape;
    QRShape374: TQRShape;
    QRShape367: TQRShape;
    QRShape357: TQRShape;
    QRLabel402: TQRLabel;
    QRLabel404: TQRLabel;
    QRLabel405: TQRLabel;
    QRShape128: TQRShape;
    QRShape132: TQRShape;
    QRShape139: TQRShape;
    QRShape142: TQRShape;
    QRShape144: TQRShape;
    QRShape146: TQRShape;
    QRLabel406: TQRLabel;
    QRShape147: TQRShape;
    QRShape268: TQRShape;
    QRShape269: TQRShape;
    QRLabel408: TQRLabel;
    QRShape270: TQRShape;
    QRLabel409: TQRLabel;
    QRLabel411: TQRLabel;
    QRLabel412: TQRLabel;
    QRShape274: TQRShape;
    QRShape275: TQRShape;
    QRLabel413: TQRLabel;
    QRLabel414: TQRLabel;
    QRLabel415: TQRLabel;
    QRShape155: TQRShape;
    QRShape160: TQRShape;
    QRLabel416: TQRLabel;
    QRLabel417: TQRLabel;
    QRShape291: TQRShape;
    QRLabel418: TQRLabel;
    QRShape331: TQRShape;
    QRLabel419: TQRLabel;
    QRLabel420: TQRLabel;
    QRLabel421: TQRLabel;
    QRLabel422: TQRLabel;
    QRLabel454: TQRLabel;
    QRLabel455: TQRLabel;
    QRLabel482: TQRLabel;
    Qcorpnamer: TQRLabel;
    Qkornamer: TQRLabel;
    QAddrr: TQRLabel;
    QCopaddrr: TQRLabel;
    Qcorpnor: TQRLabel;
    QJuminidr: TQRLabel;
    QRTelr: TQRLabel;
    QCoptelr: TQRLabel;
    QRShape381: TQRShape;
    QRLabel592: TQRLabel;
    QRShape383: TQRShape;
    QRShape385: TQRShape;
    QRShape387: TQRShape;
    QRShape390: TQRShape;
    QRShape382: TQRShape;
    QRShape392: TQRShape;
    QRLabel423: TQRLabel;
    QRShape303: TQRShape;
    QRShape332: TQRShape;
    QRShape352: TQRShape;
    QRLabel424: TQRLabel;
    QRShape354: TQRShape;
    QRLabel425: TQRLabel;
    QRShape356: TQRShape;
    QRLabel428: TQRLabel;
    QRLabel429: TQRLabel;
    QRLabel427: TQRLabel;
    QRShape358: TQRShape;
    QRShape359: TQRShape;
    QRShape360: TQRShape;
    QRLabel495: TQRLabel;
    QRShape362: TQRShape;
    QRShape363: TQRShape;
    QRShape364: TQRShape;
    QRLabel441: TQRLabel;
    QRShape365: TQRShape;
    QRLabel443: TQRLabel;
    QRShape366: TQRShape;
    QRLabel448: TQRLabel;
    QRLabel449: TQRLabel;
    QRShape369: TQRShape;
    QRShape370: TQRShape;
    QRShape371: TQRShape;
    QRShape372: TQRShape;
    QRShape373: TQRShape;
    QRLabel451: TQRLabel;
    QRShape368: TQRShape;
    QRLabel450: TQRLabel;
    QRLabel501: TQRLabel;
    QRLabel502: TQRLabel;
    QRmrentkorname1: TQRLabel;
    QRmrentjuminid1: TQRLabel;
    QRmrentaddr1: TQRLabel;
    QRmrentfrdate1: TQRLabel;
    QRmrentcost1: TQRLabel;
    QRmrentcostded1: TQRLabel;
    QRmrentkorname2: TQRLabel;
    QRmrentjuminid2: TQRLabel;
    QRmrentaddr2: TQRLabel;
    QRmrentfrdate2: TQRLabel;
    QRmrentcost2: TQRLabel;
    QRmrentcostded2: TQRLabel;
    QRmrentkorname3: TQRLabel;
    QRmrentjuminid3: TQRLabel;
    QRmrentaddr3: TQRLabel;
    QRmrentfrdate3: TQRLabel;
    QRmrentcost3: TQRLabel;
    QRmrentcostded3: TQRLabel;
    QRyloankorname1: TQRLabel;
    QRyloanjuminid1: TQRLabel;
    QRyloandate1: TQRLabel;
    QRyloanrate1: TQRLabel;
    QRyloansum1: TQRLabel;
    QRyloanamt1: TQRLabel;
    QRyloanint1: TQRLabel;
    QRyloanded1: TQRLabel;
    QRyloankorname2: TQRLabel;
    QRyloanjuminid2: TQRLabel;
    QRyloandate2: TQRLabel;
    QRyloanrate2: TQRLabel;
    QRyloansum2: TQRLabel;
    QRyloanamt2: TQRLabel;
    QRyloanint2: TQRLabel;
    QRyloanded2: TQRLabel;
    QRyloankorname3: TQRLabel;
    QRyloanjuminid3: TQRLabel;
    QRyloandate3: TQRLabel;
    QRyloanrate3: TQRLabel;
    QRyloansum3: TQRLabel;
    QRyloanamt3: TQRLabel;
    QRyloanint3: TQRLabel;
    QRyloanded3: TQRLabel;
    QRyrentkorname1: TQRLabel;
    QRyrentjuminid1: TQRLabel;
    QRyrentaddr1: TQRLabel;
    QRyrentfrdate1: TQRLabel;
    QRyrentcost1: TQRLabel;
    QRyrentkorname2: TQRLabel;
    QRyrentjuminid2: TQRLabel;
    QRyrentaddr2: TQRLabel;
    QRyrentfrdate2: TQRLabel;
    QRyrentcost2: TQRLabel;
    QRyrentkorname3: TQRLabel;
    QRyrentjuminid3: TQRLabel;
    QRyrentaddr3: TQRLabel;
    QRyrentfrdate3: TQRLabel;
    QRyrentcost3: TQRLabel;
    QRLabel430: TQRLabel;
    QRLabel517: TQRLabel;
    QRyrenttodate1: TQRLabel;
    QRyrenttodate2: TQRLabel;
    QRyrenttodate3: TQRLabel;
    QRShape304: TQRShape;
    QRShape305: TQRShape;
    QRLabel528: TQRLabel;
    QRLabel529: TQRLabel;
    QRShape306: TQRShape;
    QRShape309: TQRShape;
    QRLabel530: TQRLabel;
    QRLabel531: TQRLabel;
    QRLabel535: TQRLabel;
    QRShape316: TQRShape;
    QRShape317: TQRShape;
    QRLabel536: TQRLabel;
    QRLabel537: TQRLabel;
    QRShape318: TQRShape;
    QRLabel452: TQRLabel;
    QRLabel538: TQRLabel;
    QRLabel539: TQRLabel;
    QRLabel540: TQRLabel;
    QRLabel541: TQRLabel;
    QRLabel542: TQRLabel;
    QRLabel543: TQRLabel;
    QRLabel544: TQRLabel;
    QRmrenttodate1: TQRLabel;
    QRmrenttodate2: TQRLabel;
    QRmrenttodate3: TQRLabel;
    QRLabel549: TQRLabel;
    QRLabel550: TQRLabel;
    QRShape389: TQRShape;
    QRLabel518: TQRLabel;
    QRLabel519: TQRLabel;
    QRShape334: TQRShape;
    QRLabel520: TQRLabel;
    QRLabel527: TQRLabel;
    QRLabel532: TQRLabel;
    QRLabel533: TQRLabel;
    QRLabel534: TQRLabel;
    QRLabel545: TQRLabel;
    QRLabel559: TQRLabel;
    QRmrenttype1: TQRLabel;
    QRmrentsize1: TQRLabel;
    QRmrenttype2: TQRLabel;
    QRmrentsize2: TQRLabel;
    QRmrenttype3: TQRLabel;
    QRmrentsize3: TQRLabel;
    QRyrenttype1: TQRLabel;
    QRyrentsize1: TQRLabel;
    QRyrenttype2: TQRLabel;
    QRyrentsize2: TQRLabel;
    QRyrenttype3: TQRLabel;
    QRyrentsize3: TQRLabel;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRShape19: TQRShape;
    QRShape107: TQRShape;
    QRShape113: TQRShape;
    QRShape51: TQRShape;
    QRLabel256: TQRLabel;
    QRL_certprno: TQRLabel;
    QRLabel257: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Qempno: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRShape27: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape49: TQRShape;
    Qcorpname: TQRLabel;
    Qcorpregno: TQRLabel;
    Qkorname: TQRLabel;
    Qaddr: TQRLabel;
    Qpresname: TQRLabel;
    Qcorpaddr: TQRLabel;
    Qjuminid: TQRLabel;
    Qcorpno: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    Qysf1: TQRLabel;
    QRLabel18: TQRLabel;
    Qysf2: TQRLabel;
    QRLabel19: TQRLabel;
    Qysf3: TQRLabel;
    QRLabel20: TQRLabel;
    Qyst3: TQRLabel;
    QRLabel22: TQRLabel;
    Qyst2: TQRLabel;
    QRLabel23: TQRLabel;
    Qyst1: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape33: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    plus_1: TQRLabel;
    Qmbonsum: TQRLabel;
    Qmpaysum: TQRLabel;
    Qallsum: TQRLabel;
    Qbcorpname: TQRLabel;
    Qbcorpno: TQRLabel;
    Qbpaysum: TQRLabel;
    Qplus_3: TQRLabel;
    Qbbonsum: TQRLabel;
    Qplus_4: TQRLabel;
    plus_2: TQRLabel;
    Qmcogbonsum: TQRLabel;
    Qbcogbonsum: TQRLabel;
    Qplus_cog: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel53: TQRLabel;
    Qbpaysum1: TQRLabel;
    Qbbonsum1: TQRLabel;
    plus_3: TQRLabel;
    QRLabel150: TQRLabel;
    Qcostocktax: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel172: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape114: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRShape97: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape115: TQRShape;
    QRLabel466: TQRLabel;
    QRShape185: TQRShape;
    QRLabel283: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    Qnotaxetc1: TQRLabel;
    Qnotaxetc2: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape234: TQRShape;
    QRLabel157: TQRLabel;
    QRLabel175: TQRLabel;
    Qmstocksum1: TQRLabel;
    Qmstocksum2: TQRLabel;
    Qbcorpname1: TQRLabel;
    Qbcorpno1: TQRLabel;
    plus_4: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel61: TQRLabel;
    QRShape98: TQRShape;
    QRLabel62: TQRLabel;
    Qmlimitoversum: TQRLabel;
    Qblimitoversum: TQRLabel;
    Qblimitoversum1: TQRLabel;
    QRShape192: TQRShape;
    QRLabel190: TQRLabel;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRLabel341: TQRLabel;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel342: TQRLabel;
    QRLabel343: TQRLabel;
    QRShape207: TQRShape;
    QRLabel344: TQRLabel;
    QRLabel345: TQRLabel;
    QRLabel346: TQRLabel;
    QRLabel347: TQRLabel;
    QRLabel348: TQRLabel;
    QRLabel349: TQRLabel;
    Qynongtax: TQRLabel;
    Qmnongtax: TQRLabel;
    Qbnongtax: TQRLabel;
    Qdnongtax: TQRLabel;
    QRLabel356: TQRLabel;
    QRLabel357: TQRLabel;
    QRLabel358: TQRLabel;
    QRLabel359: TQRLabel;
    QRLabel360: TQRLabel;
    QRLabel361: TQRLabel;
    Qdintax: TQRLabel;
    Qdjutax: TQRLabel;
    Qplus_5: TQRLabel;
    QRLabel365: TQRLabel;
    QRLabel366: TQRLabel;
    QRLabel367: TQRLabel;
    Qbintax: TQRLabel;
    Qmintax: TQRLabel;
    Qyintax: TQRLabel;
    Qbjutax: TQRLabel;
    Qmjutax: TQRLabel;
    Qyjutax: TQRLabel;
    Qplus_6: TQRLabel;
    Qplus_7: TQRLabel;
    Qycalctax: TQRLabel;
    QRLabel377: TQRLabel;
    QRLabel378: TQRLabel;
    QRLabel379: TQRLabel;
    QRLabel380: TQRLabel;
    QRLabel381: TQRLabel;
    QRLabel382: TQRLabel;
    QRLabel383: TQRLabel;
    QRLabel384: TQRLabel;
    QRLabel385: TQRLabel;
    QRLabel386: TQRLabel;
    QRLabel387: TQRLabel;
    Qdate1: TQRLabel;
    Qdate2: TQRLabel;
    Qdate3: TQRLabel;
    Qpres: TQRLabel;
    QRLabel392: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape108: TQRShape;
    QRShape195: TQRShape;
    QRShape208: TQRShape;
    QRShape209: TQRShape;
    QRShape210: TQRShape;
    QRShape212: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRLabel397: TQRLabel;
    QRLabel398: TQRLabel;
    QRShape28: TQRShape;
    QRLabel399: TQRLabel;
    QRLabel400: TQRLabel;
    QRLabel401: TQRLabel;
    QRShape199: TQRShape;
    L_Semu: TQRLabel;
    QRLabel403: TQRLabel;
    QRShape213: TQRShape;
    Qnotaxetc11: TQRLabel;
    Qnotaxetc22: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape91: TQRShape;
    QRShape99: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape109: TQRShape;
    QRShape188: TQRShape;
    QRShape289: TQRShape;
    QRShape211: TQRShape;
    QRLabel211: TQRLabel;
    QRLabel254: TQRLabel;
    QRShape307: TQRShape;
    QRLabel259: TQRLabel;
    QRLabel314: TQRLabel;
    QRLabel317: TQRLabel;
    QRLabel318: TQRLabel;
    QRLabel322: TQRLabel;
    QRLabel323: TQRLabel;
    QRImage2: TQRImage;
    Qlimitoversum: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel188: TQRLabel;
    QRL_MEDAMT: TQRLabel;
    QRL_HIREAMT: TQRLabel;
    QRLmed: TQRLabel;
    QRLhire: TQRLabel;
    QRLanu: TQRLabel;
    QRL_anuamt: TQRLabel;
    QRShape116: TQRShape;
    QRShape174: TQRShape;
    QRLabel192: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
       procedure QRLabelClear;
       Function  Get_Age(BirthDate : String) : String;
  public
    { Public declarations }

  end;

var
  Fm_Pib30102 : TFm_Pib30102;
  Q_field    : TQRLabel;
  Ki_WorkYY  : String;
//  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000

implementation

uses PIB30100, PrintView;
{$R *.DFM}

Function TFm_Pib30102.Get_Age(BirthDate : String) : String;
var
  mm1  : LongInt;
  mm2  : LongInt;
  Age  : LongInt;
begin
  try
    mm2    := StrToInt(Ki_WorkYY)*12 + 12;

    if  (Copy(BirthDate,8,1) = '1') or (Copy(BirthDate,8,1) = '2') then
         mm1 := StrToInt('19' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2))
    else mm1 := StrToInt('20' + Copy(BirthDate,1,2))*12 + StrToInt(Copy(BirthDate,3,2));

    Age   := (mm2-mm1) div 12;
       { 2000.12. 20세이하 0101일 포함으로 변경됨.  주석처리
         if (Copy(BirthDate,3,4) = '0101') AND (Age >= 0) AND (Age < 54) then        Age := Age+1;}
    Result := FloatToStr(Age);
  except
    Result := '0';
    System.Exit;
  end;
end;

procedure TFm_Pib30102.QRLabelClear;
var
  No,No3,No4,No5 : Integer;
  Q_field : TQRLabel;
begin
  QRdedamt4A.Caption  := '';
  QRdedamt4B.Caption  := '';
  QRdedamt4C.Caption  := '';  //2015.05 jissi 소급개정
  QRdedamt4D.Caption  := '';  //2015.05 jissi 소급개정
  QRdedamt5A.Caption  := '';
  QRdedamt5B.Caption  := '';
  QRdedamt6A.Caption  := '';
  QRdedamt6B.Caption  := '';
  QRdedamt7A.Caption  := '';
  QRdedamt7B.Caption  := '';
  QRdedamt8A.Caption  := '';
  QRdedamt11A.Caption := '';
  QRdedamt11B.Caption := '';
  QRdedamt12A.Caption := '';
  QRdedamt12B.Caption := '';
  QRdedamt13A.Caption := '';
  QRdedamt13B.Caption := '';
  QRdedamt15A.Caption := '';
  QRdedamt15B.Caption := '';

  //컴포넌트 클리어...
  for No := 0 to 10 do
  begin
//    Q_field         := Self.FindComponent('QNum_'+IntToStr(No)) as TQRLabel;
//    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Native_'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('FamiRel_'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Fami_Name'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Fami_JuminID'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedYN1'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedYN2'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedYN4'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    //2014.03 jissi 2014년 양식에서 삭제=> 2015.05 jissi 소급개정 양식 복원
    Q_field         := Self.FindComponent('QRdedamt3'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRbabyyn'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';

    Q_field         := Self.FindComponent('QRdedamt4A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt4B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    //2015.05 jissi 소급개정
    Q_field         := Self.FindComponent('QRdedamt4C'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt4D'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';

    Q_field         := Self.FindComponent('QRdedamt5A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt5B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt6A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt6B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt7A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt7B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt8A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt11A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt11B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt12A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt12B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt13A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt13B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt15A'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRdedamt15B'+IntToStr(No)) as TQRLabel;
    Q_field.Caption := '';
  end;

  for No3 := 1 to 13 do
  begin
    Q_field         := Self.FindComponent('Qpengbn1'+IntToStr(No3)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qpenbank1'+IntToStr(No3)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qpencnt1'+IntToStr(No3)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qpenamt1'+IntToStr(No3)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qpended1'+IntToStr(No3)) as TQRLabel;
    Q_field.Caption := '';
  end;

  for No4 := 1 to 5 do
  begin
    Q_field         := Self.FindComponent('Qnpengbn1'+IntToStr(No4)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qnpenbank1'+IntToStr(No4)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qnpencnt1'+IntToStr(No4)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qnpenamt1'+IntToStr(No4)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qnpended1'+IntToStr(No4)) as TQRLabel;
    Q_field.Caption := '';
  end;
  {2013.10 jissi 장기주택마련저축 삭제
  for No5 := 1 to 5 do
  begin
    Q_field         := Self.FindComponent('Qfundbank1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qfundcnt1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qfundyy1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qfundamt1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qfundded1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
  end;
  }
  //2014.03 jissi 장기집합투자증권저축 소득공제 추가
  for No5 := 1 to 3 do
  begin
    Q_field         := Self.FindComponent('Qlfundbank1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qlfundcnt1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qlfundamt1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('Qlfundded1'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
  end;
  //2013.10 jissi 월세액.거주자간 주택임차차입금 원리금 상환액 공제 추가
  for No5 := 1 to 3 do
  begin
    Q_field         := Self.FindComponent('QRmrentkorname'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrentjuminid'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    //2014.11 jissi 주택유형,주택면적 추가
    Q_field         := Self.FindComponent('QRmrenttype'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrentsize'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    /////////////////////////////////////
    Q_field         := Self.FindComponent('QRmrentaddr'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrentfrdate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrenttodate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrentcost'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRmrentcostded'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';

    Q_field         := Self.FindComponent('QRyloankorname'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloanjuminid'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloandate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloanrate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloansum'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloanamt'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloanint'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyloanded'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';

    Q_field         := Self.FindComponent('QRyrentkorname'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyrentjuminid'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    //2014.11 jissi 주택유형,주택면적 추가
    Q_field         := Self.FindComponent('QRyrenttype'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyrentsize'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    /////////////////////////////////////
    Q_field         := Self.FindComponent('QRyrentaddr'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyrentfrdate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyrenttodate'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
    Q_field         := Self.FindComponent('QRyrentcost'+IntToStr(No5)) as TQRLabel;
    Q_field.Caption := '';
  end;
end;


//////////////////////////////////////////////////////////////////////////////////////////////////
procedure TFm_Pib30102.QuickRep1Preview(Sender: TObject);
begin
     ViewForm := TViewForm.CreatePreview(Application,QuickRep1);
     ViewForm.Show;

//   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
//   Fm_PreviewForm.Show;
end;

procedure TFm_Pib30102.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    close;
end;

procedure TFm_Pib30102.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   No, Age : Integer;
   DEDAMT4A_Sum,  DEDAMT4B_Sum,  DEDAMT5A_Sum,  DEDAMT5B_Sum                                : Double;
   DEDAMT4C_Sum,  DEDAMT4D_Sum                                                              : Double;
   DEDAMT6A_Sum,  DEDAMT6B_Sum,  DEDAMT7A_Sum,  DEDAMT7B_Sum,  DEDAMT8A_Sum,  DEDAMT14B_Sum : Double;
   DEDAMT11A_Sum, DEDAMT11B_Sum, DEDAMT12A_Sum, DEDAMT12B_Sum, DEDAMT13A_Sum, DEDAMT13B_Sum : Double;
   DEDAMT15A_Sum, DEDAMT15B_Sum : Double;
begin
  ////////////////////////////////////////////////////////////////////////////
  //QuickRep2 ...............................................................
  DEDAMT4A_Sum  := 0;
  DEDAMT4B_Sum  := 0;
  DEDAMT4C_Sum  := 0;
  DEDAMT4D_Sum  := 0;
  DEDAMT5A_Sum  := 0;
  DEDAMT5B_Sum  := 0;
  DEDAMT6A_Sum  := 0;
  DEDAMT6B_Sum  := 0;
  DEDAMT7A_Sum  := 0;
  DEDAMT7B_Sum  := 0;
  DEDAMT8A_Sum  := 0;
  DEDAMT11A_Sum := 0;
  DEDAMT11B_Sum := 0;
  DEDAMT12A_Sum := 0;
  DEDAMT12B_Sum := 0;
  DEDAMT13A_Sum := 0;
  DEDAMT13B_Sum := 0;
  DEDAMT14B_Sum := 0;
  DEDAMT15A_Sum := 0;
  DEDAMT15B_Sum := 0;
  No            := 0;

  QRLabelClear;   //QRLabel 컴포넌트 클리어...

  //////////////////////////////////////////////////////////////////////////////
  //부양가족공제자 명세.
  with Qry_Fami do
  begin
       ServiceName := 'PKQ1030A_sel6';
       Close;
       Sql.Clear;
       SQL.Add ( 'SELECT ROWNUM  NUM,  A.*                                                                                         ');
       SQL.Add ( '  From                                                                                                           ');
       SQL.Add ( '(Select DECODE(FAMIREL,                                                                                          ');
       SQL.Add ( '        ''00'',''0'',                                                                                            '); //본인.
       SQL.Add ( '        ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''11'',''1'',''12'',''1'',''18'',''1'',''19'',''1'', '); //소득자의 직계존속
       SQL.Add ( '        ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'', '); //배우자의 직계존속
       SQL.Add ( '        ''01'',''3'',''06'',''3'',                                                                               '); //배우자
       SQL.Add ( '        ''04'',''4'',''05'',''4'',                                                                               '); //직계비속
       SQL.Add ( '        ''20'',''5'',''21'',''5'',''22'',''5'',''23'',''5'',                                                     '); //직계비속2
       SQL.Add ( '        ''13'',''6'',''14'',''6'',''15'',''6'',''28'',''6'',''29'',''6'',''30'',''6'',''31'',''7'',''32'',''7'', '); //형제자매
       SQL.Add ( '        ''6'')                                     FAMIREL,                                                      ');                        //기타
       SQL.Add ( '         A.FAMINAME                                FAMINAME,                                                     ');
       SQL.Add ( '         JUMINID                                   JUMINID,                                                      ');
       SQL.Add ( '         DECODE(DEDYN ,''Y'',''○'','''')          DEDYN,                                                        ');
       SQL.Add ( '         DECODE(OBSYN ,''Y'',nvl(OBSCODE,''3''),'''')         OBSYN,                                                        '); //2013.10 jissi 장애인코드
       SQL.Add ( '         ''''                                      WOMAN,                                                        ');
       SQL.Add ( '         DECODE(DEDYN3,''Y'',''○'','''')          DEDAMT3,                                                      '); //자녀양육비 1인당 100만원.
       SQL.Add ( '         nvl(DEDAMT4A,0)                           DEDAMT4A,                                                     ');
       SQL.Add ( '         nvl(DEDAMT4B,0)                           DEDAMT4B,                                                     ');
       SQL.Add ( '         nvl(DEDAMT4C,0)                           DEDAMT4C,                                                     '); //2015.05 jissi 소급개정
       SQL.Add ( '         nvl(DEDAMT4D,0)                           DEDAMT4D,                                                     '); //2015.05 jissi 소급개정
       SQL.Add ( '         nvl(DEDAMT5A,0)                           DEDAMT5A,                                                     ');
       //SQL.Add ( '         NVL(SUM(DECODE(nvl(b.CASHAMT,0)+nvl(b.CARDAMT,0),0,0,nvl(b.CASHAMT,0)+nvl(b.CARDAMT,0))),0) DEDAMT5B,   ');
       {//2015.03.13 jissi 가족테이블에 저장된 의료비 출력되도록 변경
       SQL.Add ( '         NVL((select SUM(DECODE(nvl(b.CASHAMT,0)+nvl(b.CARDAMT,0),0,0,nvl(b.CASHAMT,0)+nvl(b.CARDAMT,0)))        ');
       SQL.Add ( '                FROM PKMYSHOS b                                                                                  ');
       SQL.Add ( '  	         where a.workyy = b.workyy and a.empno = b.empno and a.faminame = b.faminame                       ');
       SQL.Add ( '                 and nvl(b.ded_yn,''N'') = ''Y''),0) DEDAMT5B,                                                   ');
       }
       SQL.Add ( '         NVL(DEDAMT5B,0)                           DEDAMT5B,                                                     ');
       SQL.Add ( '         nvl(DEDAMT6A,0)                           DEDAMT6A,                                                     ');
       SQL.Add ( '         nvl(DEDAMT6B,0)                           DEDAMT6B,                                                     ');
       SQL.Add ( '         nvl(DEDAMT7A,0)                           DEDAMT7A,                                                     ');
       SQL.Add ( '         nvl(DEDAMT7B,0)                           DEDAMT7B,                                                     ');
       SQL.Add ( '         nvl(DEDAMT8A,0)                           DEDAMT8A,                                                     ');
       SQL.Add ( '         nvl(BABYYN, ''''),  nvl(DEDAMT10B,0)      DEDAMT10B,                                                    ');
       SQL.Add ( '         nvl(DEDAMT11A,0)      DEDAMT11A, nvl(DEDAMT11B,0)      DEDAMT11B,                                       ');
       SQL.Add ( '         nvl(DEDAMT12A,0)      DEDAMT12A, nvl(DEDAMT12B,0)      DEDAMT12B,                                       ');
       SQL.Add ( '         nvl(DEDAMT7C,0) + nvl(DEDAMT8C,0) + nvl(DEDAMT12C,0)   DEDAMT13A,                                       ');
       SQL.Add ( '         nvl(DEDAMT7D,0) + nvl(DEDAMT12D,0)                     DEDAMT13B,                                       ');
       SQL.Add ( '         nvl(DEDAMT14B,0)                                       DEDAMT14B,                                       ');
       SQL.Add ( '         nvl(DEDAMT7E,0) + nvl(DEDAMT8E,0) + nvl(DEDAMT12E,0)   DEDAMT15A,                                       ');
       SQL.Add ( '         nvl(DEDAMT7F,0) + nvl(DEDAMT12F,0)                     DEDAMT15B                                        ');
       if copy(FM_Main.Ed_empno.hint,1,1) <> 'M' then
       //SQL.Add ( '    FROM PKMYSFAM a, PKMYSHOS b                                           ')
       SQL.Add ( '    FROM PKMYSFAM a                                                       ')
       else
       //SQL.Add ( '    FROM PKZYSFAM a, PKMYSHOS b                                           ');
       SQL.Add ( '    FROM PKZYSFAM a                                                       ');
       SQL.Add ( '   WHERE A.WORKYY   = '''+ Qry_Mater.FieldByName('WORKYY').AsString +'''  ');
       SQL.Add ( '     AND A.EMPNO    = '''+ Qry_Mater.FieldByName('EMPNO').AsString +'''   ');
       //SQL.Add ( '     AND A.WORKYY   = B.WORKYY(+)                                         ');
       //SQL.Add ( '     AND A.EMPNO    = B.EMPNO(+)                                          ');
       //SQL.Add ( '     AND A.FAMINAME = B.FAMINAME(+)                                       ');
       //SQL.Add ( ' GROUP BY FAMIREL, JUMINID, DEDYN, OBSYN, DEDYN3, DEDAMT4A, DEDAMT4B,                                            ');
       //SQL.Add ( '      DEDAMT5A,DEDAMT5B, DEDAMT6A,DEDAMT6B,DEDAMT7A,DEDAMT7B,DEDAMT8A,A.FAMINAME,A.BABYYN ,                      ');
       //SQL.Add ( '      DEDAMT10B,DEDAMT11A,DEDAMT11B,DEDAMT12A,DEDAMT12B,DEDAMT7C,DEDAMT7D,DEDAMT8C,DEDAMT12C,DEDAMT12D,DEDAMT14B ');
       //SQL.Add ( '      ,OBSCODE,DEDAMT7E,DEDAMT7F,DEDAMT8E,DEDAMT12E,DEDAMT12F	                                             ');
       SQL.Add ( '   ORDER BY 1, 3       ) A                                               ');
       ClearFieldInfo;
       AddField('NUM'       , ftInteger, 2);
       AddField('FAMIREL'   , ftString,  2);
       AddField('FAMINAME'  , ftString,  12);
       AddField('JUMINID'   , ftString,  14);
       AddField('DEDYN'     , ftString,  2);
       AddField('OBSYN'     , ftString,  2);
       AddField('WOMAN'     , ftString,  2);
       AddField('DEDAMT3'   , ftString,  9);
       AddField('DEDAMT4A'  , ftFloat,   9);
       AddField('DEDAMT4B'  , ftFloat,   9);
       AddField('DEDAMT4C'  , ftFloat,   9); //2015.05 jissi 소급개정
       AddField('DEDAMT4D'  , ftFloat,   9); //2015.05 jissi 소급개정
       AddField('DEDAMT5A'  , ftFloat,   9);
       AddField('DEDAMT5B'  , ftFloat,   9);
       AddField('DEDAMT6A'  , ftFloat,   9);
       AddField('DEDAMT6B'  , ftFloat,   9);
       AddField('DEDAMT7A'  , ftFloat,   9);
       AddField('DEDAMT7B'  , ftFloat,   9);
       AddField('DEDAMT8A'  , ftFloat,   9);
       AddField('BABYYN'    , ftString, 10);
       AddField('DEDAMT10B' , ftFloat,   9);
       AddField('DEDAMT11A' , ftFloat,   9);
       AddField('DEDAMT11B' , ftFloat,   9);
       AddField('DEDAMT12A' , ftFloat,   9);
       AddField('DEDAMT12B' , ftFloat,   9);
       AddField('DEDAMT13A' , ftFloat,   9);
       AddField('DEDAMT13B' , ftFloat,   9);
       AddField('DEDAMT14B' , ftFloat,   9);
       AddField('DEDAMT15A' , ftFloat,   9);
       AddField('DEDAMT15B' , ftFloat,   9);
       Open;                 ///  M_KC2080C.edit1.text := Qry_Fami.sql.text;
       ////////////////////////////////////////////////////////////////////////////

       if not Qry_Fami.Active then Qry_Fami.Active := True;

       //2015.01 jissi 자녀수만 기재
       //QRL_totcnt.Caption := '(자녀 : '+IntToStr(Qry_Fami.RecordCount) + '명)';
       QRL_totcnt.Caption := '(자녀 : ' + FormatFloat('#,##0', Qry_Mater.FieldByName('fewno').AsFloat) + '명)';
       //부녀자 여부
       if   Qwomanded.Caption <> '0' then QRdedYN30.Caption := '○'
       else                               QRdedYN30.Caption := '';

       //한부모공제 여부
       if   QSparentded.Caption <> '0' then QRSparent.Caption := '○'
       else                                 QRSparent.Caption := '';

       //건강.고용 등
       QRmedhireamt0.Caption := FormatFloat('#,##0',  Qry_Mater.FieldByName('medamt').AsFloat
                                                    + Qry_Mater.FieldByName('hireamt').AsFloat);
       QRmedhireamt1.Caption := FormatFloat('#,##0',  Qry_Mater.FieldByName('medamt').AsFloat
                                                    + Qry_Mater.FieldByName('hireamt').AsFloat);

       Qry_Fami.First;
       while not Qry_Fami.eof do
       begin
            if (RecordCount > 0) AND (No >= 0) and (No <= 10) then
            begin
              //Q_field         := Self.FindComponent('QNum_'+IntToStr(No)) as TQRLabel;    //관계
              //Q_field.Caption := IntToStr(No+1);


              Q_field         := Self.FindComponent('Native_'+IntToStr(No)) as TQRLabel;   //내외국인
              Q_field.Caption := '1';
              if (Copy(FieldByName('JUMINID').AsString,8,1) = '5') or
                 (Copy(FieldByName('JUMINID').AsString,8,1) = '6') then
              begin
                   Q_field         := Self.FindComponent('Native_'+IntToStr(No)) as TQRLabel;   //내외국인
                   Q_field.Caption := '9';
              end;

              Q_field         := Self.FindComponent('FamiRel_'+IntToStr(No)) as TQRLabel;    //관계
              Q_field.Caption := FieldByName('FAMIREL').AsString;
              Q_field         := Self.FindComponent('Fami_Name'+IntToStr(No)) as TQRLabel;   //성명
              Q_field.Caption := FieldByName('FAMINAME').AsString;
              Q_field         := Self.FindComponent('Fami_JuminID'+IntToStr(No)) as TQRLabel;//주민번호
              Q_field.Caption := FieldByName('JUMINID').AsString;
              Q_field         := Self.FindComponent('QRdedYN1'+IntToStr(No)) as TQRLabel;    //기본공제
              Q_field.Caption := FieldByName('DEDYN').AsString;

              Ki_WorkYY := Qry_Mater.FieldByName('WorkYY').AsString;
              Age := StrToInt(Get_Age(FieldByName('JUMINID').AsString));           //경로자여부
              if(FieldByName('DEDYN').AsString='Y') then
              begin
                   if((Ki_WorkYY <='2008')and(Age >= 65))or
                      (Age >= 70) then
                   //2013.10.30.hjku. 2008년 연말정산 공제 표기 오류 수정..
                   //if (Age >= 70) then
                   begin
                        Q_field         := Self.FindComponent('QRdedYN2'+IntToStr(No)) as TQRLabel;
                        Q_field.Caption := '○';
                   end;
              end;
              Q_field         := Self.FindComponent('QRdedYN4'+IntToStr(No)) as TQRLabel;    //장애인 여부
              Q_field.Caption := FieldByName('OBSYN').AsString;
              //2014.03 jissi 2014년 양식에서 삭제=> 2015.05 jissi 2014년 소급개정양식에 복원
              Q_field         := Self.FindComponent('QRdedAmt3'+IntToStr(No)) as TQRLabel;   //자녀양육비 여부    FormatFloat('#,##0', )
              Q_field.Caption := FieldByName('DEDAMT3').AsString;

              Q_field         := Self.FindComponent('QRbabyyn'+IntToStr(No)) as TQRLabel;    //2011.01.05 kth 출산입양 공제
              Q_field.Caption := FieldByName('BABYYN').AsString;

              Q_field         := Self.FindComponent('QRdedAmt4A'+IntToStr(No)) as TQRLabel;  //보험료
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT4A').AsFloat);
              Q_field         := Self.FindComponent('QRdedAmt4B'+IntToStr(No)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT4B').AsFloat);

              //2015.05 jissi 소급개정 추가
              Q_field         := Self.FindComponent('QRdedAmt4C'+IntToStr(No)) as TQRLabel;  //장애인전용보험료
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT4C').AsFloat);
              Q_field         := Self.FindComponent('QRdedAmt4D'+IntToStr(No)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT4D').AsFloat);
              
              Q_field         := Self.FindComponent('QRdedAmt5A'+IntToStr(No)) as TQRLabel;  //의료비
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT5A').AsFloat);
              Q_field         := Self.FindComponent('QRdedAmt5B'+IntToStr(No)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT5B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt6A'+IntToStr(No)) as TQRLabel;  //교육비
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT6A').AsFloat);
              Q_field         := Self.FindComponent('QRdedAmt6B'+IntToStr(No)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT6B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt7A'+IntToStr(No)) as TQRLabel;  //신용카드
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT7A').AsFloat);
              Q_field         := Self.FindComponent('QRdedAmt7B'+IntToStr(No)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT7B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt8A'+IntToStr(No)) as TQRLabel;  //현금영수증
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT8A').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt11A'+IntToStr(No)) as TQRLabel;  //Give
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT11A').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt11B'+IntToStr(No)) as TQRLabel;  //Give
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT11B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt12A'+IntToStr(No)) as TQRLabel;  //Give
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT12A').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt12B'+IntToStr(No)) as TQRLabel;  //Give
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT12B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt13A'+IntToStr(No)) as TQRLabel;  //전통시장
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT13A').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt13B'+IntToStr(No)) as TQRLabel;  //전통시장
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT13B').AsFloat);

              //Q_field         := Self.FindComponent('QRdedAmt14A'+IntToStr(No)) as TQRLabel;
              //Q_field.Caption := FormatFloat('#,##0', 0);

              //Q_field         := Self.FindComponent('QRdedAmt14B'+IntToStr(No)) as TQRLabel;
              //Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT14B').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt15A'+IntToStr(No)) as TQRLabel;  //대중교통
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT15A').AsFloat);

              Q_field         := Self.FindComponent('QRdedAmt15B'+IntToStr(No)) as TQRLabel;  //대중교통   2015.03.09 jissi 추가
              Q_field.Caption := FormatFloat('#,##0', FieldByName('DEDAMT15B').AsFloat);

              DEDAMT4A_Sum    := DEDAMT4A_Sum  + FieldByName('DEDAMT4A').AsFloat;
              DEDAMT4B_Sum    := DEDAMT4B_Sum  + FieldByName('DEDAMT4B').AsFloat;

              DEDAMT4C_Sum    := DEDAMT4C_Sum  + FieldByName('DEDAMT4C').AsFloat;  //2015.05 jissi 소급개정 추가
              DEDAMT4D_Sum    := DEDAMT4D_Sum  + FieldByName('DEDAMT4D').AsFloat;  //2015.05 jissi 소급개정 추가

              DEDAMT5A_Sum    := DEDAMT5A_Sum  + FieldByName('DEDAMT5A').AsFloat;
              DEDAMT5B_Sum    := DEDAMT5B_Sum  + FieldByName('DEDAMT5B').AsFloat;
              DEDAMT6A_Sum    := DEDAMT6A_Sum  + FieldByName('DEDAMT6A').AsFloat;
              DEDAMT6B_Sum    := DEDAMT6B_Sum  + FieldByName('DEDAMT6B').AsFloat;
              DEDAMT7A_Sum    := DEDAMT7A_Sum  + FieldByName('DEDAMT7A').AsFloat;
              DEDAMT7B_Sum    := DEDAMT7B_Sum  + FieldByName('DEDAMT7B').AsFloat;
              DEDAMT8A_Sum    := DEDAMT8A_Sum  + FieldByName('DEDAMT8A').AsFloat;
              DEDAMT11A_Sum   := DEDAMT11A_Sum + FieldByName('DEDAMT11A').AsFloat;
              DEDAMT11B_Sum   := DEDAMT11B_Sum + FieldByName('DEDAMT11B').AsFloat;
              DEDAMT12A_Sum   := DEDAMT12A_Sum + FieldByName('DEDAMT12A').AsFloat;
              DEDAMT12B_Sum   := DEDAMT12B_Sum + FieldByName('DEDAMT12B').AsFloat;
              DEDAMT13A_Sum   := DEDAMT13A_Sum + FieldByName('DEDAMT13A').AsFloat;
              DEDAMT13B_Sum   := DEDAMT13B_Sum + FieldByName('DEDAMT13B').AsFloat;
              DEDAMT14B_Sum   := DEDAMT14B_Sum + FieldByName('DEDAMT14B').AsFloat;
              DEDAMT15A_Sum   := DEDAMT15A_Sum + FieldByName('DEDAMT15A').AsFloat;
              DEDAMT15B_Sum   := DEDAMT15B_Sum + FieldByName('DEDAMT15B').AsFloat;

              QRdedamt4A.Caption := FormatFloat('#,##0', DEDAMT4A_Sum);
              QRdedamt4B.Caption := FormatFloat('#,##0', DEDAMT4B_Sum);

              QRdedamt4C.Caption := FormatFloat('#,##0', DEDAMT4C_Sum);  //2015.05 jissi 소급개정 추가
              QRdedamt4D.Caption := FormatFloat('#,##0', DEDAMT4D_Sum);  //2015.05 jissi 소급개정 추가

              QRdedamt5A.Caption := FormatFloat('#,##0', DEDAMT5A_Sum);
              QRdedamt5B.Caption := FormatFloat('#,##0', DEDAMT5B_Sum);
              QRdedamt6A.Caption := FormatFloat('#,##0', DEDAMT6A_Sum);
              QRdedamt6B.Caption := FormatFloat('#,##0', DEDAMT6B_Sum);
              QRdedamt7A.Caption := FormatFloat('#,##0', DEDAMT7A_Sum);
              QRdedamt7B.Caption := FormatFloat('#,##0', DEDAMT7B_Sum);
              QRdedamt8A.Caption := FormatFloat('#,##0', DEDAMT8A_Sum);
              QRdedamt11A.Caption:= FormatFloat('#,##0', DEDAMT11A_Sum);
              QRdedamt11B.Caption:= FormatFloat('#,##0', DEDAMT11B_Sum);
              QRdedamt12A.Caption:= FormatFloat('#,##0', DEDAMT12A_Sum);
              QRdedamt12B.Caption:= FormatFloat('#,##0', DEDAMT12B_Sum);
              QRdedamt13A.Caption:= FormatFloat('#,##0', DEDAMT13A_Sum);
              QRdedamt13B.Caption:= FormatFloat('#,##0', DEDAMT13B_Sum);
              //QRdedamt14A.Caption := FormatFloat('#,##0', 0);
              //QRdedamt14B.Caption:= FormatFloat('#,##0', DEDAMT14B_Sum);
              QRdedamt15A.Caption:= FormatFloat('#,##0', DEDAMT15A_Sum);
              QRdedamt15B.Caption:= FormatFloat('#,##0', DEDAMT15B_Sum);
            end;

            No := No + 1;
            Qry_Fami.Next;
       end; //while not Qry_Fami.eof do

       if Copy(Qry_Mater.FieldByName('WorkYY').AsString,1,4) >= '2006' then  Fami_JuminID0.Caption := '근로자 본인';
  end; // with Qry_Fami do
end;

procedure TFm_Pib30102.QRCompositeReport1AddReports(Sender: TObject);
var i  : integer;
begin
//  QRCompositeReport1.PrinterSetup
{
  QRCompositeReport1.Reports.Add(QuickRep1);
  QRCompositeReport1.Reports.Add(QuickRep3);
  QRCompositeReport1.Reports.Add(QuickRep2);

  with Qry_Bank do        //2011.01.11 저축 납입액 없으면 안찍음 kth
  begin
       ServiceName := 'HINSA_select10';
       Close;
       Sql.Clear;
       Sql.Add('SELECT EMPNO, SEQ, SAVEGBN, SAVEGBNNAME,        ');
       Sql.Add('       SAVEBANK, SAVEBANKNAME,                  ');
       Sql.Add('       SAVEACNT, PAYTYY, SAVEAMT , ''field10''    ');
       Sql.Add('  FROM PKMSVGMAS                                ');
       Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+'''        ');
       Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''         ');
       Sql.Add(' ORDER BY SEQ                                   ');

       ClearFieldInfo;
       AddField('EMPNO'       , ftString, 100);
       AddField('SEQ'         , ftString, 100);
       AddField('SAVEGBN'     , ftString, 100);
       AddField('SAVEGBNNAME' , ftString, 100);
       AddField('SAVEBANK'    , ftString, 100);
       AddField('SAVEBANKNAME', ftString, 100);
       AddField('SAVEACNT'    , ftString, 100);
       AddField('PAYTYY'      , ftString, 100);
       AddField('SAVEAMT'     , ftString, 100);
       AddField('field10'     , ftString, 100);

       Open;
  end;

  if Not Qry_Bank.eof then
     QRCompositeReport1.Reports.Add(QuickRep4);

  with Qry_rent do        //2011.01.11 저축 납입액 없으면 안찍음 kth
  begin
       ServiceName := 'PKQ1030A_sel12';
       Close;
       Sql.Clear;
       Sql.Add('SELECT SEQ,                                                             ');
       Sql.Add('       MRENTKORNAME,  MRENTJUMINID,  MRENTADDR,                         ');
       Sql.Add('       MRENTFRDATE,   MRENTTODATE,   MRENTCOST,                         ');
       Sql.Add('       MRENTCOSTDED,                                                    ');
       Sql.Add('       YLOANKORNAME,  YLOANJUMINID,  YLOANFRDATE,                       ');
       Sql.Add('       YLOANTODATE,   YLOANRATE,     YLOANSUM,                          ');
       Sql.Add('       YLOANAMT,      YLOANINT,      YLOANDED,                          ');
       Sql.Add('       YRENTKORNAME,  YRENTJUMINID,  YRENTADDR,                         ');
       Sql.Add('       YRENTFRDATE,   YRENTTODATE,   YRENTCOST                          ');
       Sql.Add('  FROM PKMYSRENT                                                        ');
       Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+'''        ');
       Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''         ');
       Sql.Add('   AND ((NVL(MRENTCOSTDED,0) <> 0)  or (NVL(YLOANDED,0) <> 0))          ');
       Sql.Add(' ORDER BY SEQ                                                           ');

       ClearFieldInfo;
       AddField('SEQ'           , ftString,  10);
       AddField('MRENTKORNAME'  , ftString,  20);
       AddField('MRENTJUMINID'  , ftString,  14);
       AddField('MRENTADDR'     , ftString, 100);
       AddField('MRENTFRDATE'   , ftString,   8);
       AddField('MRENTTODATE'   , ftString,   8);
       AddField('MRENTCOST'     , ftFloat,   10);
       AddField('MRENTCOSTDED'  , ftFloat,   10);
       AddField('YLOANKORNAME'  , ftString,  20);
       AddField('YLOANJUMINID'  , ftString,  14);
       AddField('YLOANFRDATE'   , ftString,   8);
       AddField('YLOANTODATE'   , ftString,   8);
       AddField('YLOANRATE'     , ftFloat,   10);
       AddField('YLOANSUM'      , ftFloat,   10);
       AddField('YLOANAMT'      , ftFloat,   10);
       AddField('YLOANINT'      , ftFloat,   10);
       AddField('YLOANDED'      , ftFloat,   10);
       AddField('YRENTKORNAME'  , ftString,  20);
       AddField('YRENTJUMINID'  , ftString,  14);
       AddField('YRENTADDR'     , ftString, 100);
       AddField('YRENTFRDATE'   , ftString,   8);
       AddField('YRENTTODATE'   , ftString,   8);
       AddField('YRENTCOST'     , ftFloat,   10);

       Open;
  end;

  if Not Qry_rent.eof then
     QRCompositeReport1.Reports.Add(QuickRep5);

}

end;

procedure TFm_Pib30102.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with AA1 do
  begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('corpno'    , ftString, 100);
       AddField('corpname'  , ftString, 100);
       AddField('presname'  , ftString, 100);
       AddField('corpregno' , ftString, 100);
       AddField('corpaddr'  , ftString, 100);
       Close;
       Sql.Clear;
       SQL.ADD('select corpno, corpname, presname, ');
       SQL.ADD('       corpregno, corpaddr         ');
       SQL.ADD('  from pkcpbas                     ');
       Open;
       Qcorpno.Caption    := FieldByName('corpno').AsString;
       Qcorpname.Caption  := FieldByName('corpname').AsString;
       Qpresname.Caption  := FieldByName('presname').AsString;
       Qpres.Caption      := FieldByName('presname').AsString;
       Qcorpregno.Caption := FieldByName('corpregno').AsString;
       Qcorpaddr.Caption  := FieldByName('corpaddr').AsString;
  end;

  with Qry_Mater do
  begin
      ServiceName := 'PKQ1065A_sel1';
      Close;
      Sql.Clear;
      if copy(FM_Main.Ed_empno.hint,1,1) <> 'M' then
      begin
      Sql.Add('SELECT ROWNUM,                                                                 ');
      Sql.Add('  NVL(WORKYY     , '' ''),  NVL(EMPNO      , '' ''),  NVL(KORNAME     , '' ''),');
      Sql.Add('  NVL(PAYNUM     , '' ''),  NVL(PAYCL      , '' ''),  NVL(PAYGR       ,   0  ),');
      Sql.Add('  NVL(ORGNUM     , '' ''),  NVL(DEPTCODE   , '' ''),  NVL(PSTATE      , '' ''),');
      Sql.Add('  NVL(BLDCODE    , '' ''),  NVL(EMPDATE    , '' ''),  NVL(JUMINID     , '' ''),');
      Sql.Add('  NVL(SEX        , '' ''),  NVL(FIRSTYN    , '' ''),  NVL(HEADYN      , '' ''),');
      Sql.Add('  NVL(MARRIEDYN  , '' ''),  NVL(ZIPNO      , '' ''),  NVL(ADDR        , '' ''),');
      Sql.Add('  NVL(APPMAN     , '' ''),  NVL(APPDATE    , '' ''),  NVL(BCORPNAME   , '' ''),');
      Sql.Add('  NVL(BCORPNO    , '' ''),  NVL(YSFRDATE   , '' ''),  NVL(YSTODATE    , '' ''),');
      Sql.Add('  NVL(SUBDATE    , '' ''),  NVL(LASTMONPAY ,   0  ),  NVL(MGITASODK   ,   0  ),');
      Sql.Add('  NVL(MPAYSUM    ,   0  ),  NVL(MBONSUM    ,   0  ),                           ');
      Sql.Add('  greatest(NVL(MNOTAX    ,   0  ),0)         MNOTAX,                           ');//2015.03.13 jissi (-)값일때 0으로 출력 NVL(MNOTAX      ,   0  ),
      Sql.Add('  NVL(BPAYSUM    ,   0  ),  NVL(BBONSUM    ,   0  ),  NVL(BNOTAX      ,   0  ),');
      Sql.Add('  NVL(TAXGROSS   ,   0  ),  greatest(NVL(NOTAX     ,   0  ),0)   NOTAX,        ');//2015.03.13 jissi (-)값일때 0으로 출력 NVL(NOTAX       ,   0  ),
      Sql.Add('  NVL(LABORDED   ,   0  ),                                                     ');
      Sql.Add('  NVL(LABORAMT   ,   0  ),  NVL(MATE       ,   0  ),  NVL(FAMI16NO    ,   0  ),');
      Sql.Add('  NVL(FAMI720NO  ,   0  ),  NVL(FAMI6064NO ,   0  ),  NVL(FAMI65NO    ,   0  ),');
      Sql.Add('  NVL(FAMILYNO   ,   0  ),  NVL(SELFDED    ,   0  ),  NVL(MATEDED     ,   0  ),');
      Sql.Add('  NVL(FAMIDED    ,   0  ),  NVL(BASICDED   ,   0  ),  NVL(OBSTACLENO  ,   0  ),');
      Sql.Add('  NVL(CHILDNO    ,   0  ),  NVL(WOMAN      ,   0  ),  NVL(OLDDED      ,   0  ),');
      Sql.Add('  NVL(OBSDED     ,   0  ),  NVL(WOMANDED   ,   0  ),  NVL(CHILDDED    ,   0  ),');
      Sql.Add('  NVL(APPENDDED  ,   0  ),  NVL(MANYCHILDNO,   0  ),  NVL(FEWDED      ,   0  ),');
      Sql.Add('  NVL(MEDAMT     ,   0  ),  NVL(BMEDAMT    ,   0  ),  NVL(MEDDED      ,   0  ),');
      Sql.Add('  NVL(HIREAMT    ,   0  ),  NVL(BHIREAMT   ,   0  ),  NVL(HIREDED     ,   0  ),');
      Sql.Add('  NVL(GUARAMT    ,   0  ),  NVL(GUARDED    ,   0  ),  NVL(INSDED      ,   0  ),');
      Sql.Add('  NVL(GHOSAMT    ,   0  ),  NVL(OHOSAMT    ,   0  ),  NVL(NHOSAMT     ,   0  ),');
      Sql.Add('  NVL(HOSAMT     ,   0  ),  NVL(HOSDED     ,   0  ),  NVL(SEDUAMT     ,   0  ),');
      Sql.Add('  NVL(SEDUDED    ,   0  ),  NVL(KEDUNO     ,   0  ),  NVL(KEDUAMT     ,   0  ),');
      Sql.Add('  NVL(KEDUDED    ,   0  ),  NVL(CEDUAMT    ,   0  ),  NVL(CEDUDED     ,   0  ),');
      Sql.Add('  NVL(UEDUNO     ,   0  ),  NVL(UEDUAMT    ,   0  ),  NVL(UEDUDED     ,   0  ),');
      Sql.Add('  NVL(EDUDED     ,   0  ),  NVL(HOUSEAMT   ,   0  ),  NVL(HOUSEINTAMT ,   0  ),');
      Sql.Add('  NVL(HOUSEDED   ,   0  ),  NVL(AGIVEAMT   ,   0  ),  NVL(AGIVEDED    ,   0  ),');
      Sql.Add('  NVL(PGIVEAMT   ,   0  ),  NVL(PGIVEDED   ,   0  ),  NVL(GIVEDED     ,   0  ),');
      Sql.Add('  NVL(SPECIALDED ,   0  ),  NVL(PENAMT1    ,   0  ),  NVL(PENAMT2     ,   0  ),');
      Sql.Add('  NVL(BPENAMT    ,   0  ),  NVL(PENDED     ,   0  ),  NVL(INCOMEDED   ,   0  ),');
      Sql.Add('  NVL(TAXLEVEL   ,   0  ),  NVL(CALCTAX    ,   0  ),  NVL(INCOMTDED   ,   0  ),');
      Sql.Add('  NVL(PROPAMT1   ,   0  ),  NVL(PROPAMT2   ,   0  ),  NVL(BPROPAMT    ,   0  ),');
      Sql.Add('  NVL(PROPDED    ,   0  ),  NVL(HLOANAMT   ,   0  ),  NVL(HLOANDED    ,   0  ),');
      Sql.Add('  NVL(STKAMT     ,   0  ),  NVL(STKDED     ,   0  ),  NVL(FORIAMT     ,   0  ),');
      Sql.Add('  NVL(FORIDED    ,   0  ),  NVL(ETCTAMT    ,   0  ),  NVL(ETCTDED     ,   0  ),');
      Sql.Add('  NVL(TDEDSUM    ,   0  ),  NVL(DINTAX     ,   0  ),  NVL(DJUTAX      ,   0  ),');
      Sql.Add('  NVL(DNONGTAX   ,   0  ),  NVL(MINTAX     ,   0  ),  NVL(MJUTAX      ,   0  ),');
      Sql.Add('  NVL(MNONGTAX   ,   0  ),  NVL(BINTAX     ,   0  ),  NVL(BJUTAX      ,   0  ),');
      Sql.Add('  NVL(BNONGTAX   ,   0  ),  NVL(INTAX      ,   0  ),  NVL(JUTAX       ,   0  ),');
      Sql.Add('  NVL(NONGTAX    ,   0  ),  NVL(YINTAX     ,   0  ),  NVL(YJUTAX      ,   0  ),');
      Sql.Add('  NVL(YNONGTAX   ,   0  ),  NVL(YCALCTAX   ,   0  ),                           ');
      Sql.Add('  NVL(NOHOUSEDED ,   0  ),  NVL(TOGETHERDED,   0  ),  NVL(COSTOCKAMT  ,   0  ),');
      Sql.Add('  NVL(COSTOCKDED ,   0  ),  NVL(YDEDLACKAMT ,  0  ),  NVL(YEARNOTAXAMT,   0  ),');
{      if (Chk_year = ED_year.Text) or ( ED_year.Text ='2007수정') then  //2009.09.09 kth 연말정산 이력은   YDEDLACKAMT 마스터는 DEDLACKAMT 로 되어 있음
         Sql.Add('  NVL(COSTOCKDED ,   0  ),  NVL(DEDLACKAMT ,   0  ),  NVL(YEARNOTAXAMT,   0  ),')
      else
         Sql.Add('  NVL(COSTOCKDED ,   0  ),  NVL(YDEDLACKAMT ,   0  ),  NVL(YEARNOTAXAMT,   0  ),');
}

      Sql.Add('  NVL(SGIVEAMT   ,   0  ),  NVL(INVESTAMT  ,   0  ),  NVL(INVESTDED   ,   0  ),');
      Sql.Add('  NVL(FORITAXGROSS , 0  ),  NVL(KEDUNO1    ,   0  ),  NVL(KEDUAMT1    ,   0  ),');
      Sql.Add('  NVL(KEDUDED1   ,   0  ),  NVL(CREDITAMT  ,   0  ),  NVL(CREDITDED   ,   0  ),');
      Sql.Add('  NVL(MCRESUM    ,   0  ),  NVL(BCRESUM    ,   0  ),  NVL(BCORPNAME1  , '' ''),');
      Sql.Add('  NVL(BCORPNO1   , '' ''),  NVL(BPAYSUM1   ,   0  ),  NVL(BBONSUM1    ,   0  ),');
      Sql.Add('  NVL(BMEDAMT1   ,   0  ),  NVL(BHIREAMT1  ,   0  ),  NVL(BINTAX1     ,   0  ),');
      Sql.Add('  NVL(BJUTAX1    ,   0  ),  NVL(BNONGTAX1  ,   0  ),  NVL(CEDUNO      ,   0  ),');
      Sql.Add('  NVL(MCOGBONSUM ,   0  ),  NVL(BCOGBONSUM ,   0  ),  NVL(OBSGUARAMT  ,   0  ),');
      Sql.Add('  NVL(ANUAMT     ,   0  ),  NVL(BANUAMT    ,   0  ),  NVL(BANUAMT1    ,   0  ),');
      Sql.Add('  NVL(ANUDED     ,   0  ),  NVL(NPENAMT    ,   0  ),  NVL(NPENDED     ,   0  ),');
      Sql.Add('  NVL(LSTKAMT    ,   0  ),  NVL(LSTKDED    ,   0  ),  NVL(OBSGUARDED  ,   0  ),');
      Sql.Add('  NVL(NPENAMT2   ,   0  ),  NVL(STANDDED   ,   0  ),  NVL(OLSTKAMT    ,   0  ),');
      Sql.Add('  NVL(OLSTKDED   ,   0  ),  NVL(TLSTKDED   ,   0  ),  NVL(OBSEDUNO    ,   0  ),');
      Sql.Add('  NVL(OBSEDUAMT  ,   0  ),  NVL(OBSEDUDED  ,   0  ),  NVL(OINVESTAMT  ,   0  ),');
      Sql.Add('  NVL(OINVESTDED ,   0  ),  NVL(TINVESTDED ,   0  ),  NVL(SPGIVAMT    ,   0  ),');
      Sql.Add('  NVL(SPGIVDED   ,   0  ),  NVL(DEBITAMT   ,   0  ),  NVL(GIROAMT     ,   0  ),'); //dsa2000 2003.12.
      Sql.Add('  NVL(FOREIGNAMT ,   0  ),  NVL(FOREIGNDED ,   0  ),                           '); //dsa2000 2003.12.
      Sql.Add('  NVL(FAMI70NO   ,   0  ),  NVL(SPECADDNO  ,   0  ),  NVL(SpecAddDed  ,   0  ),'); //DSA2000 2004.12.
      Sql.Add('  NVL(POLIAMT    ,   0  ),  NVL(POLIDED    ,   0  ),  NVL(SHOSAMT     ,   0  ),'); //DSA2000 2004.12.
      Sql.Add('  NVL(HOUSEINTAMT2,  0  ),  NVL(CASHAMT    ,   0  ),                           '); //DSA2000 2005.12.
      Sql.Add('  NVL(BABYNO     ,   0  ),  NVL(BABYDED    ,   0  ),  NVL(FUNDAMT1    ,   0  ),');
      Sql.Add('  NVL(FUNDAMT2   ,   0  ),  NVL(FUNDAMT3   ,   0  ),  NVL(FUNDDED     ,   0  ),');
      Sql.Add('  NVL(LONGMTAMT  ,   0  ),  NVL(LONGMTDED  ,   0  ),  NVL(PGIVEAMT2   ,   0  ),');
      Sql.Add('  NVL(HOUSEAMT2  ,   0  ),  NVL(HOUSEDED2  ,   0  ),  NVL(HOUSEINTDED ,   0  ),');   //kth 변경 2008.12.
      Sql.Add('  NVL(HOUSEINTDED ,  0  ),  NVL(HOUSEINTAMT3,  0  ),  NVL(COSTOCKTAX  ,   0  ),');   //kth 변경 2009.02. 우리사주 과세액
      Sql.Add('  NVL(MSTOCKSUM    , 0  ),  NVL(HOUSERENTAMT,  0  ),  NVL(HOUSERENTDED,   0  ),');
      Sql.Add('  NVL(HOUSVSUBAMT  , 0  ),  NVL(HOUSVSUBDED,   0  ),  NVL(HOUSVEMPAMT,    0  ),');
      Sql.Add('  NVL(HOUSVEMPDED  , 0  ),  NVL(HOUSVCOMAMT,   0  ),  NVL(HOUSVCOMDED,    0  ),');
      Sql.Add('  NVL(HOUSEAMT3,     0  ),  NVL(HOUSEDED3,     0  ),  NVL(HOUSEINTDED2,   0  ),');
      Sql.Add('  NVL(HOUSEINTDED3,  0  ),  NVL(HOUSEINTDED3,  0  ),  NVL(NAGIVEAMT,      0  ),');
      Sql.Add('  NVL(NPGIVEAMT,     0  ),  NVL(NPGIVEAMT2,    0  ),  NVL(HOUSEINTAMT4,   0  ),');
      Sql.Add('  NVL(HOUSEINTAMT5,  0  ),  NVL(HOUSEINTDED4,  0  ),  NVL(HOUSEINTDED5,   0  ),');
      Sql.Add('  NVL(INVESTAMT2,    0  ),  NVL(TMARKETAMT,    0  ),                           ');
      Sql.Add('  NVL(SPARENT       ,0),    NVL(SPARENTDED    ,0),    NVL(OBSHOSDED      ,0),  ');
      Sql.Add('  NVL(TRAFFICAMT    ,0),    NVL(SPLIMITOVDED  ,0),    NVL(INVESTAMT3     ,0),  ');
      Sql.Add('  NVL(INVESTAMT4    ,0),    NVL(INVESTDED2    ,0),    NVL(HSRENTINAMT    ,0),  ');
      Sql.Add('  NVL(HSRENTINDED   ,0),                                                       ');
      Sql.Add('  NVL(NAGIVEDED      , 0),  NVL(NPGIVEDED      , 0),  NVL(NPGIVEDED2     , 0), '); //2015.01 jissi
      Sql.Add('  NVL(NGIVEDED       , 0),  NVL(INVESTAMT5     , 0),  NVL(INVESTAMT6     , 0), '); //2015.01 jissi
      Sql.Add('  NVL(INVESTAMT7     , 0),  NVL(INVESTDED3     , 0),  NVL(LONGFUNDAMT    , 0), '); //2015.01 jissi
      Sql.Add('  NVL(LONGFUNDDED    , 0),  NVL(CHILDTAXDED    , 0),  NVL(NPENDTAXDED    , 0), '); //2015.01 jissi
      Sql.Add('  NVL(GUARTAXDED     , 0),  NVL(HOSTAXDED      , 0),  NVL(EDUTAXDED      , 0), '); //2015.01 jissi
      Sql.Add('  NVL(POLIDED1       , 0),  NVL(POLIDED2       , 0),  NVL(POLITAXDED1    , 0), '); //2015.01 jissi
      Sql.Add('  NVL(POLITAXDED2    , 0),  NVL(AGIVETAXDED    , 0),  NVL(PGIVETAXDED    , 0), '); //2015.01 jissi
      Sql.Add('  NVL(TAXDEDSUM      , 0),  NVL(HOUSERENTTAXDED, 0),  NVL(CREDITADDAMT1  , 0), '); //2015.01 jissi
      Sql.Add('  NVL(CREDITADDAMT2  , 0),  NVL(CREDITADDAMT3  , 0),  NVL(CREDITADDAMT4  , 0), '); //2015.01 jissi
      Sql.Add('  NVL(CHAGAMAMT      , 0)                                                      '); //2015.01 jissi
      Sql.Add(' ,NVL(MLIMITOVERSUM  , 0),  NVL(BLIMITOVERSUM  , 0) , NVL(BLIMITOVERSUM1 , 0)  '); //2015.05 jissi
      Sql.Add(' ,NVL(INFANTTAXDED   , 0),  NVL(ADDBABYTAXDED  , 0) , NVL(OBSGUARTAXDED  , 0), '); //2015.05 jissi 소급개정

      //2016.01.06 eyha 2015년 항목추가
      Sql.Add('  NVL(NAGIVEAMT_2014 ,0),NVL(NPGIVEAMT_2014 ,0),NVL(NPGIVEAMT2_2014,0),NVL(NAGIVEDED_2014 ,0),NVL(NPGIVEDED_2014 ,0),NVL(NPGIVEDED2_2014,0),                         ');
      Sql.Add('  NVL(HOUSEINTAMT6,0),NVL(HOUSEINTAMT7,0),NVL(HOUSEINTAMT8,0),NVL(HOUSEINTAMT9,0),NVL(HOUSEINTDED6,0),NVL(HOUSEINTDED7,0),NVL(HOUSEINTDED8,0),NVL(HOUSEINTDED9,0),   ');
      Sql.Add('  NVL(INVESTAMT8,0),NVL(INVESTAMT9,0),NVL(INVESTAMT10,0),NVL(INVESTAMT11,0),NVL(INVESTDED4,0),NVL(CREDITADDAMT5,0),NVL(CREDITADDAMT6,0),NVL(CREDITADDAMT7,0),        ');
      Sql.Add('  NVL(IHOSAMT,0),NVL(RPENAMT,0),NVL(RPENDED,0),NVL(RPENTAXDED,0)                                                                                                     ');

      Sql.Add('  FROM  PKHYSHIS H,                                                            ');
      Sql.Add('                 (SELECT  XX.EMP_NO EMP_NO, (XX.WORK_YY - X1.NO + 1) WORK_YY                               ');
      Sql.Add('                                     FROM  COPY_T X1, COPY_T X2,                                           ');
      Sql.Add('                                           (SELECT A.CERTDATE CERT_DATE, A.EMPNO EMP_NO,                   ');
      Sql.Add('                                                     SUBSTR(A.CERTTERM,1,1) CERT_TERM, A.CERTCNT CERT_CNT, ');
      Sql.Add('                                                     MAX(B.WORKYY) WORK_YY                                 ');
      Sql.Add('                                                FROM PIHCERT A, pkhyshis B                                 ');
      Sql.Add('                                               WHERE A.EMPNO = B.EMPNO                                     ');
      Sql.Add('                                                 AND A.EMPNO ='''+FM_Main.Ed_empno.hint+'''                ');
//      Sql.Add('                                                 AND UPPER(A.CERTPRYN) LIKE ''N''                          ');
      Sql.Add('                                                 AND A.CERTKIND = ''5''                                    ');
      Sql.Add('                                                 AND A.CERTDATE = '''+ FM_Main.Vcertdate + '''             ');
      //2015.04.06.hjku..admin 출력 증명은 제외.. 이지연씨 요청..
      Sql.Add('                                                 AND A.ADMINYN  = '''+ FM_Main.Vadminyn  + '''             ');
      Sql.Add('                                            GROUP BY A.CERTDATE, A.EMPNO, SUBSTR(A.CERTTERM,1,1), A.CERTCNT');
      Sql.Add('	                						) XX                                      ');
      Sql.Add('                             WHERE  X1.NO <= XX.CERT_TERM                                                  ');
      Sql.Add('                               AND  X2.NO <= XX.CERT_CNT) T                                                ');
      Sql.Add('WHERE  H.EMPNO = T.EMP_NO                                                                                  ');
      Sql.Add('  AND  WORKYY  = T.work_yy                                                                                 ');
      Sql.Add('  AND  H.EMPNO = '''+FM_Main.Ed_empno.hint+'''                                                             ');
      end
      else
      begin
      Sql.Add('SELECT ROWNUM,                                                                 ');
      Sql.Add('  NVL(WORKYY     , '' ''),  NVL(EMPNO      , '' ''),  NVL(KORNAME     , '' ''),');
      Sql.Add('  '' '' PAYNUM,  '' '' PAYCL,  0 PAYGR,                                        ');
      Sql.Add('  NVL(ORGNUM     , '' ''),  NVL(DEPTCODE   , '' ''),   '' '' PSTATE,           ');
      Sql.Add('  '' '' BLDCODE,            NVL(EMPDATE    , '' ''),  NVL(JUMINID     , '' ''),');
      Sql.Add('  NVL(SEX        , '' ''),  NVL(FIRSTYN    , '' ''),  NVL(HEADYN      , '' ''),');
      Sql.Add('  NVL(MARRIEDYN  , '' ''),  NVL(ZIPNO      , '' ''),  NVL(ADDR        , '' ''),');
      Sql.Add('  '' '' APPMAN,  '' '' APPDATE,                       NVL(BCORPNAME   , '' ''),');
      Sql.Add('  NVL(BCORPNO    , '' ''),  NVL(YSFRDATE   , '' ''),  NVL(YSTODATE    , '' ''),');
      Sql.Add('  NVL(SUBDATE    , '' ''),  0 LASTMONPAY,             NVL(MGITASODK   ,   0  ),');
      Sql.Add('  NVL(MPAYSUM    ,   0  ),  NVL(MBONSUM    ,   0  ),                           ');
      Sql.Add('  greatest(NVL(MNOTAX    ,   0  ),0)         MNOTAX,                           ');//2015.03.13 jissi (-)값일때 0으로 출력 NVL(MNOTAX      ,   0  ),
      Sql.Add('  NVL(BPAYSUM    ,   0  ),  NVL(BBONSUM    ,   0  ),  NVL(BNOTAX      ,   0  ),');
      Sql.Add('  NVL(TAXGROSS   ,   0  ),  greatest(NVL(NOTAX     ,   0  ),0)   NOTAX,        ');//2015.03.13 jissi (-)값일때 0으로 출력 NVL(NOTAX       ,   0  ),
      Sql.Add('  NVL(LABORDED   ,   0  ),                                                     ');
      Sql.Add('  NVL(LABORAMT   ,   0  ),  NVL(MATE       ,   0  ),  NVL(FAMI16NO    ,   0  ),');
      Sql.Add('  NVL(FAMI720NO  ,   0  ),  NVL(FAMI6064NO ,   0  ),  NVL(FAMI65NO    ,   0  ),');
      Sql.Add('  NVL(FAMILYNO   ,   0  ),  NVL(SELFDED    ,   0  ),  NVL(MATEDED     ,   0  ),');
      Sql.Add('  NVL(FAMIDED    ,   0  ),  NVL(BASICDED   ,   0  ),  NVL(OBSTACLENO  ,   0  ),');
      Sql.Add('  NVL(CHILDNO    ,   0  ),  NVL(WOMAN      ,   0  ),  NVL(OLDDED      ,   0  ),');
      Sql.Add('  NVL(OBSDED     ,   0  ),  NVL(WOMANDED   ,   0  ),  NVL(CHILDDED    ,   0  ),');
      Sql.Add('  NVL(APPENDDED  ,   0  ),  NVL(FEWNO      ,   0  ),  NVL(FEWDED      ,   0  ),');
      Sql.Add('  NVL(MEDAMT     ,   0  ),  NVL(BMEDAMT    ,   0  ),  NVL(MEDDED      ,   0  ),');
      Sql.Add('  NVL(HIREAMT    ,   0  ),  NVL(BHIREAMT   ,   0  ),  NVL(HIREDED     ,   0  ),');
      Sql.Add('  NVL(GUARAMT    ,   0  ),  NVL(GUARDED    ,   0  ),  NVL(INSDED      ,   0  ),');
      Sql.Add('  NVL(GHOSAMT    ,   0  ),  NVL(OHOSAMT    ,   0  ),  NVL(NHOSAMT     ,   0  ),');
      Sql.Add('  NVL(HOSAMT     ,   0  ),  NVL(HOSDED     ,   0  ),  NVL(SEDUAMT     ,   0  ),');
      Sql.Add('  NVL(SEDUDED    ,   0  ),  NVL(KEDUNO     ,   0  ),  NVL(KEDUAMT     ,   0  ),');
      Sql.Add('  NVL(KEDUDED    ,   0  ),  NVL(CEDUAMT    ,   0  ),  NVL(CEDUDED     ,   0  ),');
      Sql.Add('  NVL(UEDUNO     ,   0  ),  NVL(UEDUAMT    ,   0  ),  NVL(UEDUDED     ,   0  ),');
      Sql.Add('  NVL(EDUDED     ,   0  ),  NVL(HOUSEAMT   ,   0  ),  NVL(HOUSEINTAMT ,   0  ),');
      Sql.Add('  NVL(HOUSEDED   ,   0  ),  NVL(AGIVEAMT   ,   0  ),  NVL(AGIVEDED    ,   0  ),');
      Sql.Add('  NVL(PGIVEAMT   ,   0  ),  NVL(PGIVEDED   ,   0  ),  NVL(GIVEDED     ,   0  ),');
      Sql.Add('  NVL(SPECIALDED ,   0  ),  NVL(PENAMT1    ,   0  ),  NVL(PENAMT2     ,   0  ),');
      Sql.Add('  0 BPENAMT,                NVL(PENDED     ,   0  ),  NVL(INCOMEDED   ,   0  ),');
      Sql.Add('  NVL(TAXLEVEL   ,   0  ),  NVL(CALCTAX    ,   0  ),  NVL(INCOMTDED   ,   0  ),');
      Sql.Add('  0 PROPAMT1,  0 PROPAMT2,  0 BPROPAMT,                                        ');
      Sql.Add('  0 PROPDED,                NVL(HLOANAMT   ,   0  ),  NVL(HLOANDED    ,   0  ),');
      Sql.Add('  0 STKAMT,    0 STKDED,                              NVL(FORIAMT     ,   0  ),');
      Sql.Add('  NVL(FORIDED    ,   0  ),  NVL(ETCTAMT    ,   0  ),  NVL(ETCTDED     ,   0  ),');
      Sql.Add('  NVL(TDEDSUM    ,   0  ),  NVL(DINTAX     ,   0  ),  NVL(DJUTAX      ,   0  ),');
      Sql.Add('  NVL(DNONGTAX   ,   0  ),  NVL(MINTAX     ,   0  ),  NVL(MJUTAX      ,   0  ),');
      Sql.Add('  NVL(MNONGTAX   ,   0  ),  NVL(BINTAX     ,   0  ),  NVL(BJUTAX      ,   0  ),');
      Sql.Add('  NVL(BNONGTAX   ,   0  ),  NVL(INTAX      ,   0  ),  NVL(JUTAX       ,   0  ),');
      Sql.Add('  NVL(NONGTAX    ,   0  ),  NVL(YINTAX     ,   0  ),  NVL(YJUTAX      ,   0  ),');
      Sql.Add('  NVL(YNONGTAX   ,   0  ),  NVL(YCALCTAX   ,   0  ),                           ');
      Sql.Add('  0 NOHOUSEDED,  0 TOGETHERDED,                       NVL(COSTOCKAMT  ,   0  ),');
      Sql.Add('  NVL(COSTOCKDED ,   0  ),  0 YDEDLACKAMT,  0 YEARNOTAXAMT,                    ');
      Sql.Add('  NVL(SGIVEAMT   ,   0  ),  NVL(INVESTAMT  ,   0  ),  NVL(INVESTDED   ,   0  ),');
      Sql.Add('  NVL(FORITAXGROSS , 0  ),  NVL(KEDUNO1    ,   0  ),  NVL(KEDUAMT1    ,   0  ),');
      Sql.Add('  NVL(KEDUDED1   ,   0  ),  NVL(CREDITAMT  ,   0  ),  NVL(CREDITDED   ,   0  ),');
      Sql.Add('  0 MCRESUM,  0 BCRESUM,                              NVL(BCORPNAME1  , '' ''),');
      Sql.Add('  NVL(BCORPNO1   , '' ''),  NVL(BPAYSUM1   ,   0  ),  NVL(BBONSUM1    ,   0  ),');
      Sql.Add('  NVL(BMEDAMT1   ,   0  ),  NVL(BHIREAMT1  ,   0  ),  NVL(BINTAX1     ,   0  ),');
      Sql.Add('  NVL(BJUTAX1    ,   0  ),  NVL(BNONGTAX1  ,   0  ),  NVL(CEDUNO      ,   0  ),');
      Sql.Add('  NVL(MCOGBONSUM ,   0  ),  NVL(BCOGBONSUM ,   0  ),  NVL(OBSGUARAMT  ,   0  ),');
      Sql.Add('  NVL(ANUAMT     ,   0  ),  NVL(BANUAMT    ,   0  ),  NVL(BANUAMT1    ,   0  ),');
      Sql.Add('  NVL(ANUDED     ,   0  ),  NVL(NPENAMT    ,   0  ),  NVL(NPENDED     ,   0  ),');
      Sql.Add('  0 LSTKAMT,  0 LSTKDED,                              NVL(OBSGUARDED  ,   0  ),');
      Sql.Add('  NVL(NPENAMT2   ,   0  ),  NVL(STANDDED   ,   0  ),  0 OLSTKAMT,              ');
      Sql.Add('  0 OLSTKDED,  0 TLSTKDED,                            NVL(OBSEDUNO    ,   0  ),');
      Sql.Add('  NVL(OBSEDUAMT  ,   0  ),  NVL(OBSEDUDED  ,   0  ),  NVL(OINVESTAMT  ,   0  ),');
      Sql.Add('  NVL(OINVESTDED ,   0  ),  NVL(TINVESTDED ,   0  ),  NVL(SPGIVAMT    ,   0  ),');
      Sql.Add('  NVL(SPGIVDED   ,   0  ),  NVL(DEBITAMT   ,   0  ),  NVL(GIROAMT     ,   0  ),'); //dsa2000 2003.12.
      Sql.Add('  0 FOREIGNAMT,  0 FOREIGNDED,                                                 '); //dsa2000 2003.12.
      Sql.Add('  NVL(FAMI70NO   ,   0  ),  NVL(SPECADDNO  ,   0  ),  NVL(SpecAddDed  ,   0  ),'); //DSA2000 2004.12.
      Sql.Add('  NVL(POLIAMT    ,   0  ),  NVL(POLIDED    ,   0  ),  NVL(POLITAXDED    ,   0  ),NVL(SHOSAMT     ,   0  ),'); //DSA2000 2004.12.
      Sql.Add('  NVL(HOUSEINTAMT2,  0  ),  NVL(CASHAMT    ,   0  ),                           '); //DSA2000 2005.12.
      Sql.Add('  NVL(BABYNO     ,   0  ),  NVL(BABYDED    ,   0  ),  NVL(FUNDAMT1    ,   0  ),');
      Sql.Add('  NVL(FUNDAMT2   ,   0  ),  NVL(FUNDAMT3   ,   0  ),  NVL(FUNDDED     ,   0  ),');
      Sql.Add('  0 LONGMTAMT,   0 LONGMTDED,                         NVL(PGIVEAMT2   ,   0  ), NVL(PGIVEDED2   ,   0  ), ');
      Sql.Add('  NVL(HOUSEAMT2  ,   0  ),  NVL(HOUSEDED2  ,   0  ),  NVL(HOUSEINTDED ,   0  ), ');   //kth 변경 2008.12.
      Sql.Add('  NVL(HOUSEINTAMT3,  0  ),  NVL(COSTOCKTAX  ,  0  ),  NVL(MSTOCKSUM   ,   0  ), ');   //kth 변경 2009.02. 우리사주 과세액
      Sql.Add('  NVL(HOUSERENTAMT,  0  ),  NVL(HOUSERENTDED,  0  ),  NVL(HOUSVSUBAMT ,   0  ), ');
      Sql.Add('  NVL(HOUSVSUBDED,   0  ),  NVL(HOUSVEMPAMT,   0  ),  NVL(HOUSVEMPDED ,   0  ), ');
      Sql.Add('  NVL(HOUSVCOMAMT,   0  ),  NVL(HOUSVCOMDED,   0  ),  NVL(HOUSEAMT3,      0  ), ');
      Sql.Add('  NVL(HOUSEDED3,     0  ),  NVL(HOUSEINTDED2,  0  ),  NVL(HOUSEINTDED3,   0  ), ');
      Sql.Add('  NVL(NAGIVEAMT,     0  ),  NVL(NPGIVEAMT,     0  ),  NVL(NPGIVEAMT2,     0  ), ');
      Sql.Add('  NVL(HOUSEINTAMT4,  0  ),  NVL(HOUSEINTAMT5,  0  ),                            ');
      Sql.Add('  NVL(HOUSEINTDED4,  0  ),  NVL(HOUSEINTDED5,  0  ),  NVL(INVESTAMT2  ,   0  ), ');
      Sql.Add('  NVL(TMARKETAMT,    0  ),                                                      ');
      Sql.Add('  NVL(SPARENT       ,0),    NVL(SPARENTDED    ,0),    NVL(OBSHOSDED      ,0),   ');
      Sql.Add('  NVL(TRAFFICAMT    ,0),    NVL(SPLIMITOVDED  ,0),    NVL(INVESTAMT3     ,0),   ');
      Sql.Add('  NVL(INVESTAMT4    ,0),    NVL(INVESTDED2    ,0),    NVL(HSRENTINAMT    ,0),   ');
      Sql.Add('  NVL(HSRENTINDED   ,0),                                                        ');
      Sql.Add('  NVL(NAGIVEDED      , 0),  NVL(NPGIVEDED      , 0),  NVL(NPGIVEDED2     , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(NGIVEDED       , 0),  NVL(INVESTAMT5     , 0),  NVL(INVESTAMT6     , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(INVESTAMT7     , 0),  NVL(INVESTDED3     , 0),  NVL(LONGFUNDAMT    , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(LONGFUNDDED    , 0),  NVL(CHILDTAXDED    , 0),  NVL(NPENDTAXDED    , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(GUARTAXDED     , 0),  NVL(HOSTAXDED      , 0),  NVL(EDUTAXDED      , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(POLIDED1       , 0),  NVL(POLIDED2       , 0),  NVL(POLITAXDED1    , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(POLITAXDED2    , 0),  NVL(AGIVETAXDED    , 0),  NVL(PGIVETAXDED    , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(TAXDEDSUM      , 0),  NVL(HOUSERENTTAXDED, 0),  NVL(CREDITADDAMT1  , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(CREDITADDAMT2  , 0),  NVL(CREDITADDAMT3  , 0),  NVL(CREDITADDAMT4  , 0),  '); //2015.01 jissi
      Sql.Add('  NVL(CHAGAMAMT      , 0)                                                       '); //2015.01 jissi
      Sql.Add(' ,NVL(MLIMITOVERSUM  , 0),  NVL(BLIMITOVERSUM  , 0) , NVL(BLIMITOVERSUM1 , 0)   '); //2015.05 jissi
      Sql.Add(' ,NVL(INFANTTAXDED   , 0),  NVL(ADDBABYTAXDED  , 0) , NVL(OBSGUARTAXDED  , 0),  '); //2015.05 jissi 소급개정

      //2016.01.06 eyha 2015년 항목추가
      Sql.Add('  NVL(NAGIVEAMT_2014 ,0),NVL(NPGIVEAMT_2014 ,0),NVL(NPGIVEAMT2_2014,0),NVL(NAGIVEDED_2014 ,0),NVL(NPGIVEDED_2014 ,0),NVL(NPGIVEDED2_2014,0),                         ');
      Sql.Add('  NVL(HOUSEINTAMT6,0),NVL(HOUSEINTAMT7,0),NVL(HOUSEINTAMT8,0),NVL(HOUSEINTAMT9,0),NVL(HOUSEINTDED6,0),NVL(HOUSEINTDED7,0),NVL(HOUSEINTDED8,0),NVL(HOUSEINTDED9,0),   ');
      Sql.Add('  NVL(INVESTAMT8,0),NVL(INVESTAMT9,0),NVL(INVESTAMT10,0),NVL(INVESTAMT11,0),NVL(INVESTDED4,0),NVL(CREDITADDAMT5,0),NVL(CREDITADDAMT6,0),NVL(CREDITADDAMT7,0),        ');
      Sql.Add('  NVL(IHOSAMT,0),NVL(RPENAMT,0),NVL(RPENDED,0),NVL(RPENTAXDED,0)                                                                                                     ');

      Sql.Add('  FROM  PKZYSHIS H,                                                             ');
      Sql.Add('                 (SELECT  XX.EMP_NO EMP_NO, (XX.WORK_YY - X1.NO + 1) WORK_YY                                ');
      Sql.Add('                    FROM  COPY_T X1, COPY_T X2,                                                             ');
      Sql.Add('                         (SELECT A.CERTDATE CERT_DATE, A.EMPNO EMP_NO,                                      ');
      Sql.Add('                                   SUBSTR(A.CERTTERM,1,1) CERT_TERM, A.CERTCNT CERT_CNT,                    ');
      Sql.Add('                                   MAX(B.WORKYY) WORK_YY                                                    ');
      Sql.Add('                              FROM PIHCERT A, PKZYSHIS B                                                    ');
      Sql.Add('                             WHERE A.EMPNO = B.EMPNO                                                        ');
      Sql.Add('                               AND A.EMPNO ='''+FM_Main.Ed_empno.hint+'''                                   ');
//      Sql.Add('                               AND UPPER(A.CERTPRYN) LIKE ''N''                                             ');
      //2015.03.26 jissi 3/10지급명세서 제출이후 최후정산년도 출력가능토록 루틴 추가
      Sql.Add('                               AND to_char(sysdate, ''YYYYMMDD'') > to_char(to_number(B.WORKYY)+1)||''0310''');
      Sql.Add('                               AND A.CERTKIND = ''5''                                                       ');
      Sql.Add('                               AND A.CERTDATE = '''+ FM_Main.Vcertdate + '''                                ');
      //2015.04.06.hjku..admin 출력 증명은 제외.. 이지연씨 요청..
      Sql.Add('                               AND A.ADMINYN  = '''+ FM_Main.Vadminyn  + '''                                ');
      Sql.Add('                          GROUP BY A.CERTDATE, A.EMPNO, SUBSTR(A.CERTTERM,1,1), A.CERTCNT                   ');
      Sql.Add('	                  	) XX                                                                               ');
      Sql.Add('                   WHERE  X1.NO <= XX.CERT_TERM                                                             ');
      Sql.Add('                     AND  X2.NO <= XX.CERT_CNT) T                                                           ');
      Sql.Add('WHERE  H.EMPNO = T.EMP_NO                                                                                   ');
      Sql.Add('  AND  WORKYY  = T.work_yy                                                                                  ');
      Sql.Add('  AND  H.EMPNO = '''+FM_Main.Ed_empno.hint+'''                                                              ');
      end;

      ClearFieldInfo;
      AddField('ROWNUM'      , ftFloat, 3);
      AddField('WORKYY'      , ftString, 4);
      AddField('EMPNO'       , ftString, 4);
      AddField('KORNAME'     , ftString, 12);
      AddField('PAYNUM'      , ftString, 2);
      AddField('PAYCL'       , ftString, 3);
      AddField('PAYGR'       , ftInteger, 2);
      AddField('ORGNUM'      , ftString, 3);
      AddField('DEPTCODE'    , ftString, 6);
      AddField('PSTATE'      , ftString, 2);
      AddField('BLDCODE'     , ftString, 2);
      AddField('EMPDATE'     , ftString, 8);
      AddField('JUMINID'     , ftString, 14);
      AddField('SEX'         , ftString, 1);
      AddField('FIRSTYN'     , ftString, 1);
      AddField('HEADYN'      , ftString, 1);
      AddField('MARRIEDYN'   , ftString, 1);
      AddField('ZIPNO'       , ftString, 7);
      AddField('ADDR'        , ftString, 80);
      AddField('APPMAN'      , ftString, 4);
      AddField('APPDATE'     , ftString, 8);
      AddField('BCORPNAME'   , ftString, 30);
      AddField('BCORPNO'     , ftString, 12);
      AddField('YSFRDATE'    , ftString, 8);
      AddField('YSTODATE'    , ftString, 8);
      AddField('SUBDATE'     , ftString, 8);
      AddField('LASTMONPAY'  , ftFloat, 12);
      AddField('MGITASODK'   , ftFloat, 12);
      AddField('MPAYSUM'     , ftFloat, 12);
      AddField('MBONSUM'     , ftFloat, 12);
      AddField('MNOTAX'      , ftFloat, 12);
      AddField('BPAYSUM'     , ftFloat, 12);
      AddField('BBONSUM'     , ftFloat, 12);
      AddField('BNOTAX'      , ftFloat, 12);
      AddField('TAXGROSS'    , ftFloat, 12);
      AddField('NOTAX'       , ftFloat, 12);
      AddField('LABORDED'    , ftFloat, 12);
      AddField('LABORAMT'    , ftFloat, 12);
      AddField('MATE'        , ftInteger, 1);
      AddField('FAMI16NO'    , ftInteger, 1);
      AddField('FAMI720NO'   , ftInteger, 1);
      AddField('FAMI6064NO'  , ftInteger, 1);
      AddField('FAMI65NO'    , ftInteger, 1);
      AddField('FAMILYNO'    , ftInteger, 1);
      AddField('SELFDED'     , ftFloat, 12);
      AddField('MATEDED'     , ftFloat, 12);
      AddField('FAMIDED'     , ftFloat, 12);
      AddField('BASICDED'    , ftFloat, 12);
      AddField('OBSTACLENO'  , ftInteger, 1);
      AddField('CHILDNO'     , ftInteger, 1);
      AddField('WOMAN'       , ftInteger, 1);
      AddField('OLDDED'      , ftFloat, 12);
      AddField('OBSDED'      , ftFloat, 12);
      AddField('WOMANDED'    , ftFloat, 12);
      AddField('CHILDDED'    , ftFloat, 12);
      AddField('APPENDDED'   , ftFloat, 12);
      AddField('FEWNO'       , ftInteger, 1);
      AddField('FEWDED'      , ftFloat, 12);
      AddField('MEDAMT'      , ftFloat, 12);
      AddField('BMEDAMT'     , ftFloat, 12);
      AddField('MEDDED'      , ftFloat, 12);
      AddField('HIREAMT'     , ftFloat, 12);
      AddField('BHIREAMT'    , ftFloat, 12);
      AddField('HIREDED'     , ftFloat, 12);
      AddField('GUARAMT'     , ftFloat, 12);
      AddField('GUARDED'     , ftFloat, 12);
      AddField('INSDED'      , ftFloat, 12);
      AddField('GHOSAMT'     , ftFloat, 12);
      AddField('OHOSAMT'     , ftFloat, 12);
      AddField('NHOSAMT'     , ftFloat, 12);
      AddField('HOSAMT'      , ftFloat, 12);
      AddField('HOSDED'      , ftFloat, 12);
      AddField('SEDUAMT'     , ftFloat, 12);
      AddField('SEDUDED'     , ftFloat, 12);
      AddField('KEDUNO'      , ftFloat, 12);
      AddField('KEDUAMT'     , ftFloat, 12);
      AddField('KEDUDED'     , ftFloat, 12);
      AddField('CEDUAMT'     , ftFloat, 12);
      AddField('CEDUDED'     , ftFloat, 12);
      AddField('UEDUNO'      , ftFloat, 12);
      AddField('UEDUAMT'     , ftFloat, 12);
      AddField('UEDUDED'     , ftFloat, 12);
      AddField('EDUDED'      , ftFloat, 12);
      AddField('HOUSEAMT'    , ftFloat, 12);
      AddField('HOUSEINTAMT' , ftFloat, 12);
      AddField('HOUSEDED'    , ftFloat, 12);
      AddField('AGIVEAMT'    , ftFloat, 12);
      AddField('AGIVEDED'    , ftFloat, 12);
      AddField('PGIVEAMT'    , ftFloat, 12);
      AddField('PGIVEDED'    , ftFloat, 12);
      AddField('GIVEDED'     , ftFloat, 12);
      AddField('SPECIALDED'  , ftFloat, 12);
      AddField('PENAMT1'     , ftFloat, 12);
      AddField('PENAMT2'     , ftFloat, 12);
      AddField('BPENAMT'     , ftFloat, 12);
      AddField('PENDED'      , ftFloat, 12);
      AddField('INCOMEDED'   , ftFloat, 12);
      AddField('TAXLEVEL'    , ftFloat, 12);
      AddField('CALCTAX'     , ftFloat, 12);
      AddField('INCOMTDED'   , ftFloat, 12);
      AddField('PROPAMT1'    , ftFloat, 12);
      AddField('PROPAMT2'    , ftFloat, 12);
      AddField('BPROPAMT'    , ftFloat, 12);
      AddField('PROPDED'     , ftFloat, 12);
      AddField('HLOANAMT'    , ftFloat, 12);
      AddField('HLOANDED'    , ftFloat, 12);
      AddField('STKAMT'      , ftFloat, 12);
      AddField('STKDED'      , ftFloat, 12);
      AddField('FORIAMT'     , ftFloat, 12);
      AddField('FORIDED'     , ftFloat, 12);
      AddField('ETCTAMT'     , ftFloat, 12);
      AddField('ETCTDED'     , ftFloat, 12);
      AddField('TDEDSUM'     , ftFloat, 12);
      AddField('DINTAX'      , ftFloat, 12);
      AddField('DJUTAX'      , ftFloat, 12);
      AddField('DNONGTAX'    , ftFloat, 12);
      AddField('MINTAX'      , ftFloat, 12);
      AddField('MJUTAX'      , ftFloat, 12);
      AddField('MNONGTAX'    , ftFloat, 12);
      AddField('BINTAX'      , ftFloat, 12);
      AddField('BJUTAX'      , ftFloat, 12);
      AddField('BNONGTAX'    , ftFloat, 12);
      AddField('INTAX'       , ftFloat, 12);
      AddField('JUTAX'       , ftFloat, 12);
      AddField('NONGTAX'     , ftFloat, 12);
      AddField('YINTAX'      , ftFloat, 12);
      AddField('YJUTAX'      , ftFloat, 12);
      AddField('YNONGTAX'    , ftFloat, 12);
      AddField('YCALCTAX'    , ftFloat, 12);
      AddField('NOHOUSEDED'  , ftFloat, 12);
      AddField('TOGETHERDED' , ftFloat, 12);
      AddField('COSTOCKAMT'  , ftFloat, 12);
      AddField('COSTOCKDED'  , ftFloat, 12);
      AddField('DEDLACKAMT'  , ftFloat, 12);
      AddField('YEARNOTAXAMT', ftFloat, 12);
      AddField('SGIVEAMT'    , ftFloat, 12);
      AddField('INVESTAMT'   , ftFloat, 12);
      AddField('INVESTDED'   , ftFloat, 12);
      AddField('FORITAXGROSS', ftFloat, 12);
      AddField('KEDUNO1'     , ftFloat, 12);
      AddField('KEDUAMT1'    , ftFloat, 12);
      AddField('KEDUDED1'    , ftFloat, 12);
      AddField('CREDITAMT'   , ftFloat, 12);
      AddField('CREDITDED'   , ftFloat, 12);
      AddField('MCRESUM'     , ftInteger, 9);
      AddField('BCRESUM'     , ftInteger, 9);
      AddField('BCORPNAME1'  , ftString, 30);
      AddField('BCORPNO1'    , ftString, 12);
      AddField('BPAYSUM1'    , ftFloat, 12);
      AddField('BBONSUM1'    , ftFloat, 12);
      AddField('BMEDAMT1'    , ftFloat, 12);
      AddField('BHIREAMT1'   , ftFloat, 12);
      AddField('BINTAX1'     , ftFloat, 12);
      AddField('BJUTAX1'     , ftFloat, 12);
      AddField('BNONGTAX1'   , ftFloat, 12);
      AddField('CEDUNO'      , ftFloat, 12);
      AddField('MCOGBONSUM'  , ftFloat, 12);
      AddField('BCOGBONSUM'  , ftFloat, 12);
      AddField('OBSGUARAMT'  , ftFloat, 12);
      AddField('ANUAMT'      , ftFloat, 12);
      AddField('BANUAMT'     , ftFloat, 12);
      AddField('BANUAMT1'    , ftFloat, 12);
      AddField('ANUDED'      , ftFloat, 12);
      AddField('NPENAMT'     , ftFloat, 12);
      AddField('NPENDED'     , ftFloat, 12);
      AddField('LSTKAMT'     , ftFloat, 12);
      AddField('LSTKDED'     , ftFloat, 12);
      AddField('OBSGUARDED'  , ftFloat, 12);
      AddField('NPENAMT2'    , ftFloat, 12);
      AddField('STANDDED'    , ftFloat, 12);
      AddField('OLSTKAMT'    , ftFloat, 12);
      AddField('OLSTKDED'    , ftFloat, 12);
      AddField('TLSTKDED'    , ftFloat, 12);
      AddField('OBSEDUNO'    , ftFloat, 12);
      AddField('OBSEDUAMT'   , ftFloat, 12);
      AddField('OBSEDUDED'   , ftFloat, 12);
      AddField('OINVESTAMT'  , ftFloat, 12);
      AddField('OINVESTDED'  , ftFloat, 12);
      AddField('TINVESTDED'  , ftFloat, 12);
      AddField('SPGIVAMT'    , ftFloat, 12);
      AddField('SPGIVDED'    , ftFloat, 12);
      AddField('DEBITAMT'    , ftFloat, 12);  //Dsa2000  2003.12.
      AddField('GIROAMT'     , ftFloat, 12);  //Dsa2000  2003.12.
      AddField('FOREIGNAMT'  , ftFloat, 12);  //Dsa2000  2003.12.
      AddField('FOREIGNDED'  , ftFloat, 12);  //Dsa2000  2003.12.
      AddField('FAMI70NO'    , ftInteger,1);  //Dsa2000  2004.12.
      AddField('SPECADDNO'   , ftInteger,1);  //Dsa2000  2004.12.
      AddField('SpecAddDed'  , ftFloat, 12);  //Dsa2000  2004.12.
      AddField('POLIAMT'     , ftFloat, 12);  //Dsa2000  2004.12.
      AddField('POLIDED'     , ftFloat, 12);  //Dsa2000  2004.12.
      AddField('POLITAXDED'  , ftFloat, 12);  //Dsa2000  2004.12.
      AddField('SHOSAMT'     , ftFloat, 12);  //Dsa2000  2004.12.
      AddField('HOUSEINTAMT2', ftFloat, 12);  //Dsa2000  2004.12.
      AddField('CASHAMT'     , ftFloat, 9);   //Dsa2000  2005.12.
      AddField('BABYNO'      , ftinteger, 1);   //KTH   2008.12.
      AddField('BABYDED'     , ftFloat, 9);   //KTH   2008.12.
      AddField('FUNDAMT1'    , ftFloat, 9);   //KTH   2008.12.
      AddField('FUNDAMT2'    , ftFloat, 9);   //KTH   2008.12.
      AddField('FUNDAMT3'    , ftFloat, 9);   //KTH   2008.12.
      AddField('FUNDDED'     , ftFloat, 9);   //KTH   2008.12.
      AddField('LONGMTAMT'   , ftFloat, 9);   //KTH   2008.12.
      AddField('LONGMTDED'   , ftFloat, 9);   //KTH   2008.12.
      AddField('PGIVEAMT2'   , ftFloat,12);   //KTH   2008.12.
      AddField('PGIVEDED2'   , ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEAMT2'   , ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEDED2'   , ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEINTDED' , ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEINTAMT3', ftFloat,12);   //KTH   2008.12.
      AddField('COSTOCKTAX'  , ftFloat,12);   //KTH   2008.12.
      AddField('MSTOCKSUM'   , ftFloat,12);   //KTH   2008.12.
      AddField('HOUSERENTAMT', ftFloat,9);   //KTH   2008.12.
      AddField('HOUSERENTDED', ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVSUBAMT',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVSUBDED',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVEMPAMT',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVEMPDED',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVCOMAMT',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSVCOMDED',  ftFloat,9);   //KTH   2008.12.
      AddField('HOUSEAMT3',    ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEDED3',    ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEINTDED2', ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEINTDED3', ftFloat,12);   //KTH   2008.12.
      AddField('NAGIVEAMT',    ftFloat,12);   //KTH   2008.12.
      AddField('NPGIVEAMT',    ftFloat,12);   //KTH   2008.12.
      AddField('NPGIVEAMT2',   ftFloat,12);   //KTH   2008.12.
      AddField('HOUSEINTAMT4', ftFloat,12);   //2013.01.22 hjku 추가
      AddField('HOUSEINTAMT5', ftFloat,12);   //2013.01.22 hjku 추가
      AddField('HOUSEINTDED4', ftFloat,12);   //2013.01.22 hjku 추가
      AddField('HOUSEINTDED5', ftFloat,12);   //2013.01.22 hjku 추가
      AddField('INVESTAMT2'  , ftFloat,12);   //2013.01.22 hjku 추가
      AddField('TMARKETAMT'  , ftFloat,12);   //2013.01.22 hjku 추가

      AddField('SPARENT'      ,ftFloat, 1);   //2013.12.11 hjku
      AddField('SPARENTDED'   ,ftFloat,12);   //2013.12.11 hjku
      AddField('OBSHOSDED'    ,ftFloat,12);   //2013.12.11 hjku
      AddField('TRAFFICAMT'   ,ftFloat,12);   //2013.12.11 hjku
      AddField('SPLIMITOVDED' ,ftFloat,12);   //2013.12.11 hjku
      AddField('INVESTAMT3'   ,ftFloat,12);   //2013.12.11 hjku
      AddField('INVESTAMT4'   ,ftFloat,12);   //2013.12.11 hjku
      AddField('INVESTDED2'   ,ftFloat,12);   //2013.12.11 hjku
      AddField('HSRENTINAMT'  ,ftFloat,12);   //2013.12.11 hjku
      AddField('HSRENTINDED'  ,ftFloat,12);   //2013.12.11 hjku

      AddField('NAGIVEDED'      , ftFloat, 12);   //2015.01 jissi
      AddField('NPGIVEDED'      , ftFloat, 12);   //2015.01 jissi
      AddField('NPGIVEDED2'     , ftFloat, 12);   //2015.01 jissi
      AddField('NGIVEDED'       , ftFloat, 12);   //2015.01 jissi
      AddField('INVESTAMT5'     , ftFloat, 12);   //2015.01 jissi
      AddField('INVESTAMT6'     , ftFloat, 12);   //2015.01 jissi
      AddField('INVESTAMT7'     , ftFloat, 12);   //2015.01 jissi
      AddField('INVESTDED3'     , ftFloat, 12);   //2015.01 jissi
      AddField('LONGFUNDAMT'    , ftFloat, 12);   //2015.01 jissi
      AddField('LONGFUNDDED'    , ftFloat, 12);   //2015.01 jissi
      AddField('CHILDTAXDED'    , ftFloat, 12);   //2015.01 jissi
      AddField('NPENDTAXDED'    , ftFloat, 12);   //2015.01 jissi
      AddField('GUARTAXDED'     , ftFloat, 12);   //2015.01 jissi
      AddField('HOSTAXDED'      , ftFloat, 12);   //2015.01 jissi
      AddField('EDUTAXDED'      , ftFloat, 12);   //2015.01 jissi
      AddField('POLIDED1'       , ftFloat, 12);   //2015.01 jissi
      AddField('POLIDED2'       , ftFloat, 12);   //2015.01 jissi
      AddField('POLITAXDED1'    , ftFloat, 12);   //2015.01 jissi
      AddField('POLITAXDED2'    , ftFloat, 12);   //2015.01 jissi
      AddField('AGIVETAXDED'    , ftFloat, 12);   //2015.01 jissi
      AddField('PGIVETAXDED'    , ftFloat, 12);   //2015.01 jissi
      AddField('TAXDEDSUM'      , ftFloat, 12);   //2015.01 jissi
      AddField('HOUSERENTTAXDED', ftFloat, 12);   //2015.01 jissi
      AddField('CREDITADDAMT1'  , ftFloat, 12);   //2015.01 jissi
      AddField('CREDITADDAMT2'  , ftFloat, 12);   //2015.01 jissi
      AddField('CREDITADDAMT3'  , ftFloat, 12);   //2015.01 jissi
      AddField('CREDITADDAMT4'  , ftFloat, 12);   //2015.01 jissi
      AddField('CHAGAMAMT'      , ftFloat, 12);   //2015.01 jissi
      AddField('MLIMITOVERSUM'   ,ftFloat,12);    //2015.05 jissi
      AddField('BLIMITOVERSUM'   ,ftFloat,12);    //2015.05 jissi
      AddField('BLIMITOVERSUM1'  ,ftFloat,12);    //2015.05 jissi
      AddField('INFANTTAXDED'    ,ftFloat,12);    //2015.05 jissi
      AddField('ADDBABYTAXDED'   ,ftFloat,12);    //2015.05 jissi
      AddField('OBSGUARTAXDED'   ,ftFloat,12);    //2015.05 jissi

      AddField('NAGIVEAMT_2014' ,ftFloat,12);    //2016.01.06 eyha
      AddField('NPGIVEAMT_2014' ,ftFloat,12);    //2016.01.06 eyha
      AddField('NPGIVEAMT2_2014',ftFloat,12);    //2016.01.06 eyha
      AddField('NAGIVEDED_2014' ,ftFloat,12);    //2016.01.06 eyha
      AddField('NPGIVEDED_2014' ,ftFloat,12);    //2016.01.06 eyha
      AddField('NPGIVEDED2_2014',ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTAMT6'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTAMT7'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTAMT8'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTAMT9'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTDED6'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTDED7'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTDED8'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('HOUSEINTDED9'   ,ftFloat,12);    //2016.01.06 eyha
      AddField('INVESTAMT8'     ,ftFloat,12);    //2016.01.06 eyha
      AddField('INVESTAMT9'     ,ftFloat,12);    //2016.01.06 eyha
      AddField('INVESTAMT10'    ,ftFloat,12);    //2016.01.06 eyha
      AddField('INVESTAMT11'    ,ftFloat,12);    //2016.01.06 eyha
      AddField('INVESTDED4'     ,ftFloat,12);    //2016.01.06 eyha
      AddField('CREDITADDAMT5'  ,ftFloat,12);    //2016.01.06 eyha
      AddField('CREDITADDAMT6'  ,ftFloat,12);    //2016.01.06 eyha
      AddField('CREDITADDAMT7'  ,ftFloat,12);    //2016.01.06 eyha
      AddField('IHOSAMT'        ,ftFloat,12);    //2016.01.06 eyha
      AddField('RPENAMT'        ,ftFloat,12);    //2016.01.06 eyha
      AddField('RPENDED'        ,ftFloat,12);    //2016.01.06 eyha
      AddField('RPENTAXDED'     ,ftFloat,12);    //2016.01.06 eyha


//      SQL.SAVETOFILE('C:\AA.SQL');
      Open;
  end;  //with Qry_Mater do


end;

procedure TFm_Pib30102.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     yf, yt    : String[08];     {귀속년도 From ~ To }
     psmpaysum, psmbonsum, psbpaysum, psbbonsum, psmstocksum, pcostocktax  : Real;
     psdintax, psbintax,  psmintax, psdjutax  : Real;           {bintax, bjutax}
     psbjutax, psmjutax : Real;            {mintax, mjutax}
     psdnongtax, psbnongtax, psmnongtax, psbnongtax1 : Real;
     psbpaysum1, psbbonsum1 : Real;          {bpaysum1, bbonsum1}
     pmlimitoversum, pblimitoversum, pblimitoversum1 : Real ;  //2013.12 jissi
     psbcog, psmcog : Real ;     {mcogbonsum , bcogbonsum}
     psbintax1, psbjutax1 : Real ;  {bintax1, bjutax1}
     NUM : Integer;
begin
  with Qry_Mater do
  begin
        pmlimitoversum := 0;
        pblimitoversum := 0;
        pblimitoversum1:= 0;
        Qempno.Caption   := FieldByName('empno').AsString;
        //Qdeptname.Caption:= FieldByName('deptname').AsString;
        Qkorname.Caption := FieldByName('korname').AsString;
        Qjuminid.Caption := FieldByName('juminid').AsString;
        Qaddr.Caption    := FieldByName('addr').AsString;

        QRL_certprno.Caption  := Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,1,4)+'-'+
                                 Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,5,2)+'-'+
                                 Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,7,4)+
                                 FormatFloat('#,#00',     FieldByName('ROWNUM').Asfloat ) ;
//                            Copy(FM_Main.TPrint.fieldbyname('CERTPRNO').AsString,7,6);
                   yf := FieldByName('ysfrdate').AsString;
        Qysf1.Caption := Copy(yf,3,2);
        Qysf2.Caption := Copy(yf,5,2);
        if Qempno.Caption = '2507' then Qysf2.Caption := '03'; //SKB입사일2011.03.01..  2012.05. 정문선 요청.
        Qysf3.Caption := Copy(yf,7,2);
                   yt := FieldByName('ystodate').AsString;
        Qyst1.Caption := Copy(yt,3,2);
        Qyst2.Caption := Copy(yt,5,2);
        Qyst3.Caption := Copy(yt,7,2);

        if FieldByName('headyn').AsString = 'Y' then             //2011.01.05 kth 세대주 여부 추가
           QRLabel156.Caption :=  '세대주 ①,세대원 2'
        else
           QRLabel156.Caption :=  '세대주 1,세대원 ②';

        Qbcorpname.Caption := FieldByName('bcorpname').AsString;
        Qbcorpno.Caption   := FieldByName('bcorpno').AsString;

        //  전전근무지
        Qbcorpname1.Caption := FieldByName('bcorpname1').AsString;
        Qbcorpno1.Caption   := FieldByName('bcorpno1').AsString;

        Qmpaysum.Caption    := FormatFloat('#,##0', FieldByName('mpaysum').AsFloat);
        Qmbonsum.Caption    := FormatFloat('#,##0', FieldByName('mbonsum').AsFloat);
        Qbpaysum.Caption    := FormatFloat('#,##0', FieldByName('bpaysum').AsFloat);
        Qbbonsum.Caption    := FormatFloat('#,##0', FieldByName('bbonsum').AsFloat);
        Qmstocksum1.Caption := FormatFloat('#,##0', FieldByName('mstocksum').AsFloat);
        Qmstocksum2.Caption := FormatFloat('#,##0', FieldByName('mstocksum').AsFloat);
        Qcostocktax.Caption := FormatFloat('#,##0', FieldByName('costocktax').AsFloat);
        //2015.05 jissi 소급개정때 서비스에 같이 추가
        Qmlimitoversum.Caption  := FormatFloat('#,##0', FieldByName('mlimitoversum').AsFloat);
        Qblimitoversum.Caption  := FormatFloat('#,##0', FieldByName('blimitoversum').AsFloat);
        Qblimitoversum1.Caption := FormatFloat('#,##0', FieldByName('blimitoversum1').AsFloat);

        psmpaysum   := FieldByName('mpaysum').AsFloat;
        psmbonsum   := FieldByName('mbonsum').AsFloat;
        psbpaysum   := FieldByName('bpaysum').AsFloat;
        psbbonsum   := FieldByName('bbonsum').AsFloat;
        psbpaysum1  := FieldByName('bpaysum1').AsFloat;
        psbbonsum1  := FieldByName('bbonsum1').AsFloat;
        psmstocksum := FieldByName('mstocksum').AsFloat;
        pcostocktax := FieldByName('costocktax').AsFloat;
        //2015.05 jissi 소급개정때 서비스에 같이 추가
        pmlimitoversum  := FieldByName('mlimitoversum').AsFloat;  //2013.12 jissi
        pblimitoversum  := FieldByName('blimitoversum').AsFloat;  //2013.12 jissi
        pblimitoversum1 := FieldByName('blimitoversum1').AsFloat; //2013.12 jissi

        Qbpaysum1.Caption     := FormatFloat('#,##0', FieldByName('bpaysum1').AsFloat);
        Qbbonsum1.Caption     := FormatFloat('#,##0', FieldByName('bbonsum1').AsFloat);
        Qmcogbonsum.Caption   := FormatFloat('#,##0', FieldByName('mcogbonsum').AsFloat);
        Qbcogbonsum.Caption   := FormatFloat('#,##0', FieldByName('bcogbonsum').AsFloat);
        Qlimitoversum.Caption := FormatFloat('#,##0', pmlimitoversum+pblimitoversum+pblimitoversum1);   //2013.12 jissi

        psmcog     := FieldByName('mcogbonsum').AsFloat;
        psbcog     := FieldByName('bcogbonsum').AsFloat;

        Qplus_cog.Caption:= FormatFloat('#,##0', psmcog + psbcog );
        Plus_1.Caption   := FormatFloat('#,##0', psmpaysum+psmbonsum+psmcog+psmstocksum+pcostocktax+pmlimitoversum); //2013.12 jissi
        Plus_2.Caption   := FormatFloat('#,##0', psbpaysum+psbbonsum+psbcog+pblimitoversum);                         //2013.12 jissi
        Plus_3.Caption   := FormatFloat('#,##0', psbpaysum1+psbbonsum1+pblimitoversum1);                              //2013.12 jissi
        Plus_4.Caption   := FormatFloat('#,##0', pcostocktax);
        QPlus_3.Caption  := FormatFloat('#,##0', psmpaysum+psbpaysum+psbpaysum1+pcostocktax);
        QPlus_4.Caption  := FormatFloat('#,##0', psmbonsum+psbbonsum+psbbonsum1);

        Qallsum.Caption  := FormatFloat('#,##0', FieldByName('taxgross').AsFloat);

      //------------------     화면내 정산 명세 부분      --------------------
        Qtaxgross.Caption   := FormatFloat('#,##0', FieldByName('taxgross').AsFloat);
        //2015.03.13 jissi notax => mnotax 출산보육수당 비과세 출력되도록 변경
        Qnotaxetc1.Caption  := FormatFloat('#,##0', FieldByName('mnotax').AsFloat);
        Qnotaxetc2.Caption  := FormatFloat('#,##0', FieldByName('mnotax').AsFloat);
        Qnotaxetc11.Caption := FormatFloat('#,##0', FieldByName('mnotax').AsFloat);
        Qnotaxetc22.Caption := FormatFloat('#,##0', FieldByName('mnotax').AsFloat);

        Qlaborded.Caption   := FormatFloat('#,##0', FieldByName('laborded').AsFloat);
        Qlaboramt.Caption   := FormatFloat('#,##0', FieldByName('laboramt').AsFloat);
        Qselfded.Caption    := FormatFloat('#,##0', FieldByName('selfded').AsFloat);
        Qmateded.Caption    := FormatFloat('#,##0', FieldByName('mateded').AsFloat);

        QRLabel104.Caption  := '(26)부양가족( '+FieldByName('FamilyNo').AsString+'명)';
        Qfamided.Caption    := FormatFloat('#,##0', FieldByName('famided').AsFloat);

        QRLabel105.Caption  := '(27)경로우대( '+FieldByName('fami70no').AsString+'명)';
        Qoldded.Caption     := FormatFloat('#,##0', FieldByName('oldded').AsFloat);

        QRLabel106.Caption  := '(28)장 애 인( '+FieldByName('Obstacleno').AsString+'명)';
        Qobsded.Caption     := FormatFloat('#,##0', FieldByName('obsded').AsFloat);

        Qwomanded.Caption   := FormatFloat('#,##0', FieldByName('womanded').AsFloat);

        
        //QRLabel108.Caption  := '(30)자녀양육비( '+FieldByName('childno').AsString+'명)';
        //Qchildded.Caption   := FormatFloat('#,##0', FieldByName('childded').AsFloat);

        //QRLabel176.Caption  := '(30)-1출산.입양자( '+FieldByName('babyno').AsString+'명)';
        //Qbabyded.Caption    := FormatFloat('#,##0', FieldByName('babyded').AsFloat);

        QSparentded.Caption := FormatFloat('#,##0', FieldByName('Sparentded').AsFloat);    //2013.12 jissi 한부모공제 추가

        //QRLabel98.Caption   := '(31)다자녀추가공제( '+FieldByName('fewno').AsString+'명)';
        //Qfewded.Caption     := FormatFloat('#,##0', FieldByName('fewded').AsFloat);

        Qanuded.Caption     := FormatFloat('#,##0', FieldByName('anuded').AsFloat);
        //Qnpended.Caption    := FormatFloat('#,##0', FieldByName('npended').AsFloat);

        //Qinsded.Caption   := FormatFloat('#,##0', FieldByName('insded').AsFloat);
        Qmedded.Caption     := FormatFloat('#,##0', FieldByName('medded').AsFloat);        //2011.01.05 kth 보장성 보험료 추가
        Qhireded.Caption    := FormatFloat('#,##0', FieldByName('hireded').AsFloat);       //2011.01.05 kth 고용보험료 추가
        //Qguarded.Caption    := FormatFloat('#,##0', FieldByName('guarded').AsFloat);       //2011.01.05 kth 보장성 보험료 추가
        //obsguarded.Caption  := FormatFloat('#,##0', FieldByName('obsguarded').AsFloat);    //2011.01.05 kth 보장성 보험료 추가

        {2014.11 jissi 의료비 교육비 장애인,기타구분 삭제
        Qobshosded.Caption  := FormatFloat('#,##0', FieldByName('obshosded').AsFloat);     //2013.12 jissi 의료비_장애인 추가
        Qetchosded.Caption  := FormatFloat('#,##0', FieldByName('hosded').AsFloat          //2013.12 jissi 의료비_기타 추가
                                                  - FieldByName('obshosded').AsFloat);
        Qobseduded.Caption  := FormatFloat('#,##0', FieldByName('obseduded').AsFloat);     //2013.12 jissi 교육비_장애인 추가
        Qetceduded.Caption  := FormatFloat('#,##0', FieldByName('eduded').AsFloat          //2013.12 jissi 교육비_기타 추가
                                                  - FieldByName('obseduded').AsFloat);
        }
        Qhouseded.Caption   := FormatFloat('#,##0', FieldByName('houseded').AsFloat);
        Qhouseded3.Caption  := FormatFloat('#,##0', FieldByName('houseded3').AsFloat);     //2012.03.05 kth 추가 거주자 추가

        Qhouserentded.Caption:= FormatFloat('#,##0', FieldByName('houserentded').AsFloat);

        Qhouseintded.Caption := FormatFloat('#,##0', FieldByName('houseintded').AsFloat);  // 15 미반
        Qhouseintded2.Caption:= FormatFloat('#,##0', FieldByName('houseintded2').AsFloat); //2012.03.05 kth 추가  년도별 분리 15-29
        Qhouseintded3.Caption:= FormatFloat('#,##0', FieldByName('houseintded3').AsFloat); //2012.03.05 kth 추가  년도별 분리 30년 이상
        Qhouseintded4.Caption:= FormatFloat('#,##0', FieldByName('houseintded4').AsFloat); //2013.01.  jissi 추가 고정금리, 비거치식
        Qhouseintded5.Caption:= FormatFloat('#,##0', FieldByName('houseintded5').AsFloat); //2013.01.  jissi 추가 기타대출

        Qngiveded.Caption     := FormatFloat('#,##0', FieldByName('ngiveded').AsFloat);    //2015.03   jissi  기부금(이월분)추가
        {//Qgiveded.Caption     := FormatFloat('#,##0', FieldByName('giveded').AsFloat);
        Qpolitaxded.Caption  := FormatFloat('#,##0', FieldByName('politaxded').AsFloat);   //2013.12   jissi  정치기부금공제 추가
        Qagiveded.Caption    := FormatFloat('#,##0', FieldByName('agiveded').AsFloat);     //2013.12   jissi  전액기부금공제 추가
        Qpgivededsum.Caption := FormatFloat('#,##0', FieldByName('pgiveded').AsFloat       //2013.12   jissi  지정기부금공제 추가
                                                   + FieldByName('pgiveded2').AsFloat );
        }
        //Qspecaddded.Caption  := FormatFloat('#,##0', FieldByName('specaddded').AsFloat);   //결혼.장례.이사공제

        Qspecialded.Caption  := FormatFloat('#,##0', FieldByName('specialded').AsFloat);
        //표준공제->표준세액공제로 변경 위치 이동
        //Qstanded.Caption     := FormatFloat('#,##0', FieldByName('standded').AsFloat);
        Qchagamamt.Caption   := FormatFloat('#,##0', FieldByName('chagamamt').AsFloat);      //차감소득액


        Qpended.Caption      := FormatFloat('#,##0', FieldByName('pended').AsFloat);

        Qhousvsubded.Caption := FormatFloat('#,##0', FieldByName('housvsubded').AsFloat);
        Qhousvcomded.Caption := FormatFloat('#,##0', FieldByName('housvcomded').AsFloat);
        Qhousvempded.Caption := FormatFloat('#,##0', FieldByName('housvempded').AsFloat);

//        Qhouseded2.Caption  := FormatFloat('#,##0', FieldByName('houseded2').AsFloat);
        Qtinvestded.Caption := FormatFloat('#,##0', FieldByName('tinvestded').AsFloat);
        Qcreditded.Caption  := FormatFloat('#,##0', FieldByName('creditded').AsFloat);
        Qcostockded.Caption := FormatFloat('#,##0', FieldByName('costockded').AsFloat);   //우리사주조합출연공제 2006.12.
//        Qfundded.Caption    := FormatFloat('#,##0', FieldByName('fundded').AsFloat);    //장기주식형.
        Qhsrentinded.Caption:= FormatFloat('#,##0', FieldByName('hsrentinded').AsFloat);  //2013.12 jissi 목돈안드는전세이자공제 추가
        Qlongfundded.Caption:= FormatFloat('#,##0', FieldByName('longfundded').AsFloat);  //2014.12 jissi 장기집합투자증권저축공제 추가

        if FieldByName('workyy').AsString < '2013' then
        Qincomeded.Caption  := FormatFloat('#,##0', FieldByName('pended').AsFloat
                                                  + FieldByName('npended').AsFloat
                                                  //2013.04.29.hjku. 오류 수정(주택마련저축소득공제 포함)
                                                  + FieldByName('housvsubded').AsFloat
                                                  + FieldByName('housvcomded').AsFloat
                                                  + FieldByName('houseded2').AsFloat
                                                  + FieldByName('housvempded').AsFloat
                                                  + FieldByName('tinvestded').AsFloat
                                                  + FieldByName('creditded').AsFloat
                                                  + FieldByName('costockded').AsFloat
                                                  + FieldByName('fundded').AsFloat )      //그밖의 소득공제계...
        else if FieldByName('workyy').AsString = '2013' then
        Qincomeded.Caption  := FormatFloat('#,##0', FieldByName('pended').AsFloat
                                                  //+ FieldByName('npended').AsFloat      //2013.12 jissi 연금저축 연금보험료공제로 통합되서 삭제
                                                  //2013.04.29.hjku. 오류 수정(주택마련저축소득공제 포함)
                                                  + FieldByName('housvsubded').AsFloat
                                                  + FieldByName('housvcomded').AsFloat
                                                  + FieldByName('houseded2').AsFloat
                                                  + FieldByName('housvempded').AsFloat
                                                  + FieldByName('tinvestded').AsFloat
                                                  + FieldByName('creditded').AsFloat
                                                  + FieldByName('costockded').AsFloat
                                                  + FieldByName('fundded').AsFloat )      //그밖의 소득공제계...
        else Qincomeded.Caption := FormatFloat('#,##0', FieldByName('INCOMEDED').AsFloat);    //그밖의 소득공제계...2014.11 jissi

        Qsplimitovded.Caption   := FormatFloat('#,##0', FieldByName('splimitovded').AsFloat); //2013.12 jissi 특별공제 종합한도 초과액 추가

        Qtaxlevel.Caption   := FormatFloat('#,##0', FieldByName('taxlevel').AsFloat);
        Qcalctax.Caption    := FormatFloat('#,##0', FieldByName('calctax').AsFloat);

        //세액공제...................................................................
        Qmicomtded.Caption       := FormatFloat('#,##0', FieldByName('incomtded').AsFloat);

        //2015.05 jissi 소급개정
        Qfewno.Caption           := '( '+FieldByName('fewno'  ).AsString+'명)';                   //2015.05 jissi 자녀
        Qchildtaxded.Caption     := FormatFloat('#,##0', FieldByName('childtaxded').AsFloat);     //2014.11 jissi 자녀세액공제 추가
        Qchildno.Caption         := '( '+FieldByName('childno').AsString+'명)';                   //2015.05 jissi 6세이하자녀
        Qinfanttaxded.Caption    := FormatFloat('#,##0', FieldByName('infanttaxded').AsFloat);    //2015.05 jissi 6세이하자녀세액공제 추가
        Qbabyno.Caption          := '( '+FieldByName('babyno' ).AsString+'명)';                   //2015.05 jissi 출산.입양자
        Qaddbabytaxded.Caption   := FormatFloat('#,##0', FieldByName('addbabytaxded').AsFloat);   //2015.05 jissi 출산.입양 세액공제 추가

        Qnpended.Caption         := FormatFloat('#,##0', FieldByName('npended').AsFloat);         //연금저축 공제대상금액
        Qnpentaxded.Caption      := FormatFloat('#,##0', FieldByName('npendtaxded').AsFloat);     //2014.11 jissi 연금저축 세액공제액 추가

        {//2015.05 jissi 소급개정
        Qguardedsum.Caption      := FormatFloat('#,##0', FieldByName('guarded').AsFloat
                                                        +FieldByName('obsguarded').AsFloat);      //2011.01.05 kth 보장성 보험료 추가
        }
        Qguarded.Caption         := FormatFloat('#,##0', FieldByName('guarded').AsFloat);
        Qobsguarded.Caption      := FormatFloat('#,##0', FieldByName('obsguarded').AsFloat);      //2015.05 jissi  장애인전용 보장성 보험료 추가
        Qguartaxded.Caption      := FormatFloat('#,##0', FieldByName('guartaxded').AsFloat);      //2014.11 jissi  보장성보험료 세액공제액 추가
        Qobsguartaxded.Caption   := FormatFloat('#,##0', FieldByName('obsguartaxded').AsFloat);   //2015.05 jissi  장애인전용 보장성보험료 세액공제액 추가

        Qhosded.Caption          := FormatFloat('#,##0', FieldByName('hosded').AsFloat);          //2014.11 jissi  의료비 공제대상금액
        Qhostaxded.Caption       := FormatFloat('#,##0', FieldByName('hostaxded').AsFloat);       //2014.11 jissi  의료비 세액공제액
        Qeduded.Caption          := FormatFloat('#,##0', FieldByName('eduded').AsFloat);          //2014.11 jissi  교육비 공제대상금액
        Qedutaxded.Caption       := FormatFloat('#,##0', FieldByName('edutaxded').AsFloat);       //2014.11 jissi  교육비 세액공제액
        Qpolided1.Caption        := FormatFloat('#,##0', FieldByName('polided1').AsFloat);        //2014.11 jissi  정치기부금10만원이하 공제대상금액
        Qpolitaxded1.Caption     := FormatFloat('#,##0', FieldByName('politaxded1').AsFloat);     //2014.11 jissi  정치기부금10만원이하 세액공제액
        Qpolided2.Caption        := FormatFloat('#,##0', FieldByName('polided2').AsFloat);        //2014.11 jissi  정치기부금10만원초과 공제대상금액
        Qpolitaxded2.Caption     := FormatFloat('#,##0', FieldByName('politaxded2').AsFloat);     //2014.12 jissi  정치기부금10만원초과 세액공제액
        Qagiveded.Caption        := FormatFloat('#,##0', FieldByName('agiveded').AsFloat);        //2014.12 jissi  전액기부금공제 공제대상금액
        Qagivetaxded.Caption     := FormatFloat('#,##0', FieldByName('agivetaxded').AsFloat);     //2014.11 jissi  전액기부금공제 세액공제액
        Qpgivededsum.Caption     := FormatFloat('#,##0', FieldByName('pgiveded').AsFloat          //2014.12 jissi  지정기부금공제 공제대상금액
                                                       + FieldByName('pgiveded2').AsFloat );
        Qpgivetaxded.Caption     := FormatFloat('#,##0', FieldByName('pgivetaxded').AsFloat);     //2014.11 jissi  지정기부금공제 세액공제액
        Qstanded.Caption         := FormatFloat('#,##0', FieldByName('standded').AsFloat);        //2014.12 jissi  표준세액공제 이동
        Qtaxdedsum.Caption       := FormatFloat('#,##0', FieldByName('taxdedsum').AsFloat);       //2014.11 jissi  특별세액공제계 추가

        Qhloanded.Caption        := FormatFloat('#,##0', FieldByName('hloanded').AsFloat);
        Qforided.Caption         := FormatFloat('#,##0', FieldByName('forided').AsFloat);
        Qhouserenttaxded.Caption := FormatFloat('#,##0', FieldByName('houserenttaxded').AsFloat); //2014.11 jissi  월세액 세액공제액
        Qtdedsum.Caption         := FormatFloat('#,##0', FieldByName('tdedsum').AsFloat);

        Qdintax.Caption     := FormatFloat('#,##0', FieldByName('dintax').AsFloat);
        Qdintax2.Caption    := FormatFloat('#,##0', FieldByName('dintax').AsFloat);
        Qmintax.Caption     := FormatFloat('#,##0', FieldByName('mintax').AsFloat);
        Qyintax.Caption     := FormatFloat('#,##0', FieldByName('yintax').AsFloat);
        Qdjutax.Caption     := FormatFloat('#,##0', FieldByName('djutax').AsFloat);
        Qmjutax.Caption     := FormatFloat('#,##0', FieldByName('mjutax').AsFloat);
        Qyjutax.Caption     := FormatFloat('#,##0', FieldByName('yjutax').AsFloat);
        Qdnongtax.Caption   := FormatFloat('#,##0', FieldByName('dnongtax').AsFloat);
        Qmnongtax.Caption   := FormatFloat('#,##0', FieldByName('mnongtax').AsFloat);
        Qynongtax.Caption   := FormatFloat('#,##0', FieldByName('ynongtax').AsFloat);

        //세액명세...................................
        psdintax   := FieldByName('dintax').AsFloat;
        psbintax   := FieldByName('bintax').AsFloat;
        psmintax   := FieldByName('mintax').AsFloat;
        psdjutax   := FieldByName('djutax').AsFloat;
        psbjutax   := FieldByName('bjutax').AsFloat;
        psmjutax   := FieldByName('mjutax').AsFloat;
        psdnongtax := FieldByName('dnongtax').AsFloat;
        psbnongtax := FieldByName('bnongtax').AsFloat;
        psmnongtax := FieldByName('mnongtax').AsFloat;
        psbintax1  := FieldByName('bintax1').AsFloat;
        psbjutax1  := FieldByName('bjutax1').AsFloat;
        psbnongtax1:= FieldByName('bnongtax1').AsFloat;

        Qbjutax.Caption   := FormatFloat('#,##0', psbjutax+psbjutax1);
        Qbintax.Caption   := FormatFloat('#,##0', psbintax+psbintax1);
        Qbnongtax.Caption := FormatFloat('#,##0', psbnongtax+psbnongtax1);
        Qplus_5.Caption   := FormatFloat('#,##0', psdintax+psdjutax+psdnongtax);
        Qplus_6.Caption   := FormatFloat('#,##0', psbintax+psbjutax+psbjutax1 + psbintax1+psbnongtax+psbnongtax1);
        Qplus_7.Caption   := FormatFloat('#,##0', psmintax+psmjutax+psmnongtax);
        Qycalctax.Caption := FormatFloat('#,##0', FieldByName('ycalctax').AsFloat);

        Qdate1.Caption    := Copy(FM_Main.GSsysdate,1,4);
        Qdate2.Caption    := Copy(FM_Main.GSsysdate,5,2);
        Qdate3.Caption    := Copy(FM_Main.GSsysdate,7,2);

        //건강보험료, 고용보험료 구별하여 프린트 해주기..
        QRL_MEDAMT.Caption  := FormatFloat('#,##0', FieldByName('MEDAMT').AsFloat)  + ' 원';
        QRL_HIREAMT.Caption := FormatFloat('#,##0', FieldByName('HIREAMT').AsFloat) + ' 원';
        QRL_anuamt.Caption  := FormatFloat('#,##0', FieldByName('anuamt').AsFloat)  + ' 원';
      /////////////////////////////////////////////////////////////////////////////////////
   end;  //with Qry_Mater do
end;

procedure TFm_Pib30102.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var  Q_field : TQRLabel;
       No3,No4 : Integer;

begin

     with Qry_Bank do
     begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Add('SELECT CORPNAME CORPNAME, CORPNO CORPNO,CORPTEL ,CORPADDR,''field5''   ');
          Sql.Add('  FROM PKCPBAS B                   ');

          ClearFieldInfo;
          AddField('CORPNAME'       , ftString, 100);
          AddField('CORPNO'         , ftString, 100);
          AddField('CORPTEL'        , ftString, 100);
          AddField('CORPADDR'       , ftString, 100);
          AddField('field5'         , ftString, 100);
          Open;


          // 연금저축 인적사항 컴포넌트이름끝에 Y로 통일 2013.10 jissi
          Qcorpnamey.Caption :=  FieldByName('CORPNAME').AsString;
          Qcorpnoy.Caption   :=  FieldByName('CORPNO').AsString;
          QCopaddry.Caption  :=  FieldByName('CORPADDR').AsString;
          QCoptely.Caption   :=  FieldByName('CORPTEL').AsString;

          Qkornamey.Caption  :=  Qry_Mater.FieldByName('Korname').AsString;
          QJuminidy.Caption  :=  Qry_Mater.FieldByName('Juminid').AsString;
          QAddry.Caption     :=  Qry_Mater.FieldByName('addr').AsString;
          QRTely.Caption     := '';

          // 월세액.거주자간 인적사항 컴포넌트이름끝에 R로 통일 2013.10 jissi
          Qcorpnamer.Caption :=  FieldByName('CORPNAME').AsString;
          Qcorpnor.Caption   :=  FieldByName('CORPNO').AsString;
          QCopaddrr.Caption  :=  FieldByName('CORPADDR').AsString;
          QCoptelr.Caption   :=  FieldByName('CORPTEL').AsString;

          Qkornamer.Caption  :=  Qry_Mater.FieldByName('Korname').AsString;
          QJuminidr.Caption  :=  Qry_Mater.FieldByName('Juminid').AsString;
          QAddrr.Caption     :=  Qry_Mater.FieldByName('addr').AsString;
          QRTelr.Caption     := '';

    end;


     with Qry_Bank do
     begin
          ServiceName := 'HINSA_select10';
          Close;
          Sql.Clear;
          Sql.Add('SELECT EMPNO, SEQ, SAVEGBN, SAVEGBNNAME,                                ');
          Sql.Add('       SAVEBANK, SAVEBANKNAME,                                          ');
          Sql.Add('       SAVEACNT, PAYTYY, SAVEAMT , ''field10''                          ');
          Sql.Add('  FROM PKMSVGMAS                                                        ');
          Sql.Add(' WHERE WORKYY = '''+ Qry_Mater.FieldByName('workyy').AsString+'''       ');
          Sql.Add('   AND EMPNO  = '''+ Qry_Mater.FieldByName('empno').AsString+'''        ');
          Sql.Add('   AND SAVEGBN LIKE ''2_''                                              ');
          Sql.Add(' ORDER BY SEQ                                                           ');

          ClearFieldInfo;
          AddField('EMPNO'       , ftString, 100);
          AddField('SEQ'         , ftString, 100);
          AddField('SAVEGBN'     , ftString, 100);
          AddField('SAVEGBNNAME' , ftString, 100);
          AddField('SAVEBANK'    , ftString, 100);
          AddField('SAVEBANKNAME', ftString, 100);
          AddField('SAVEACNT'    , ftString, 100);
          AddField('PAYTYY'      , ftString, 100);
          AddField('SAVEAMT'     , ftString, 100);
          AddField('field10'     , ftString, 100);
          Open;
     end;
     No3 := 1;
     while not Qry_Bank.eof do
     begin
          Q_field         := Self.FindComponent('Qpengbn1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEGBNNAME').AsString;//Qry_Bank.FieldByName('SAVEGBN').AsString+':'+Qry_Bank.FieldByName('SAVEGBNNAME').AsString;
          Q_field         := Self.FindComponent('Qpenbank1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEBANKNAME').AsString;//Qry_Bank.FieldByName('SAVEBANK').AsString+':'+Qry_Bank.FieldByName('SAVEBANKNAME').AsString;
          Q_field         := Self.FindComponent('Qpencnt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEACNT').AsString;
          Q_field         := Self.FindComponent('Qpenamt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := FormatFloat('#,##0',Qry_Bank.FieldByName('SAVEAMT').AsFloat);
          Q_field         := Self.FindComponent('Qpended1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := '';
          No3 := No3 + 1;
          Qry_Bank.Next
     end;


     with Qry_Bank do
     begin
          ServiceName := 'HINSA_select10';
          Close;
          Sql.Clear;
          Sql.Add('SELECT EMPNO, SEQ, SAVEGBN, SAVEGBNNAME,        ');
          Sql.Add('       SAVEBANK, SAVEBANKNAME,                  ');
          Sql.Add('       SAVEACNT, PAYTYY, SAVEAMT , ''field10''  ');
          Sql.Add('  FROM PKMSVGMAS                                ');
          Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+''' ');
          Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''  ');
          Sql.Add('   AND SAVEGBN LIKE ''3_''                      ');
          Sql.Add(' ORDER BY SEQ                                   ');

          ClearFieldInfo;
          AddField('EMPNO'       , ftString, 100);
          AddField('SEQ'         , ftString, 100);
          AddField('SAVEGBN'     , ftString, 100);
          AddField('SAVEGBNNAME' , ftString, 100);
          AddField('SAVEBANK'    , ftString, 100);
          AddField('SAVEBANKNAME', ftString, 100);
          AddField('SAVEACNT'    , ftString, 100);
          AddField('PAYTYY'      , ftString, 100);
          AddField('SAVEAMT'     , ftString, 100);
          AddField('field10'     , ftString, 100);
          Open;
     end;
     No3 := 1;
     while not Qry_Bank.eof do
     begin
          Q_field         := Self.FindComponent('Qnpengbn1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEGBNNAME').AsString;//Qry_Bank.FieldByName('SAVEGBN').AsString+':'+Qry_Bank.FieldByName('SAVEGBNNAME').AsString;
          Q_field         := Self.FindComponent('Qnpenbank1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEBANKNAME').AsString;//Qry_Bank.FieldByName('SAVEBANK').AsString+':'+Qry_Bank.FieldByName('SAVEBANKNAME').AsString;
          Q_field         := Self.FindComponent('Qnpencnt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEACNT').AsString;
          Q_field         := Self.FindComponent('Qnpenamt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := FormatFloat('#,##0',Qry_Bank.FieldByName('SAVEAMT').AsFloat);
          Q_field         := Self.FindComponent('Qnpended1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := '';
          No3 := No3 + 1;
          Qry_Bank.Next
     end;

     {장기주택마련저축 삭제 2013.10 jissi
     with Qry_Bank do
     begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT EMPNO, SEQ, SAVEGBN, SAVEGBNNAME,        ');
          Sql.Add('       SAVEBANK, SAVEBANKNAME,                  ');
          Sql.Add('       SAVEACNT, PAYTYY, SAVEAMT , ''field10''    ');
          Sql.Add('  FROM PKMSVGMAS                                ');
          Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+'''        ');
          Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''         ');
          Sql.Add('   AND SAVEGBN LIKE ''4_''                       ');
          Sql.Add(' ORDER BY SEQ                                   ');
          Open;
     end;
     No3 := 1;
     while not Qry_Bank.eof do
     begin
          Q_field         := Self.FindComponent('Qfundbank1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEBANKNAME').AsString;  //Qry_Bank.FieldByName('SAVEBANK').AsString+':'+Qry_Bank.FieldByName('SAVEBANKNAME').AsString;;
          Q_field         := Self.FindComponent('Qfundcnt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEACNT').AsString;
          Q_field         := Self.FindComponent('Qfundyy1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('PAYTYY').AsString;
          Q_field         := Self.FindComponent('Qfundamt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := FormatFloat('#,##0',Qry_Bank.FieldByName('SAVEAMT').AsFloat);
          Q_field         := Self.FindComponent('Qfundded1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := '';
          No3 := No3 + 1;
          Qry_Bank.Next
     end;
     }

     //2014.03 jissi 장기집합투자증권저축 소득공제 추가
     with Qry_Bank do
     begin
          ServiceName := 'HINSA_select10';
          Close;
          Sql.Clear;
          Sql.Add('SELECT EMPNO, SEQ, SAVEGBN, SAVEGBNNAME,                         ');
          Sql.Add('       SAVEBANK, SAVEBANKNAME,                                   ');
          Sql.Add('       SAVEACNT, PAYTYY, SAVEAMT , ''field10''                   ');
          Sql.Add('  FROM PKMSVGMAS                                                 ');
          Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+''' ');
          Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''  ');
          Sql.Add('   AND SAVEGBN LIKE ''5_''                                       ');
          Sql.Add(' ORDER BY SEQ                                                    ');

          ClearFieldInfo;
          AddField('EMPNO'       , ftString, 100);
          AddField('SEQ'         , ftString, 100);
          AddField('SAVEGBN'     , ftString, 100);
          AddField('SAVEGBNNAME' , ftString, 100);
          AddField('SAVEBANK'    , ftString, 100);
          AddField('SAVEBANKNAME', ftString, 100);
          AddField('SAVEACNT'    , ftString, 100);
          AddField('PAYTYY'      , ftString, 100);
          AddField('SAVEAMT'     , ftString, 100);
          AddField('field10'     , ftString, 100);
          Open;
     end;
     No3 := 1;
     while not Qry_Bank.eof do
     begin
          Q_field         := Self.FindComponent('Qlfundbank1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEBANK').AsString+':'+Qry_Bank.FieldByName('SAVEBANKNAME').AsString;
          Q_field         := Self.FindComponent('Qlfundcnt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := Qry_Bank.FieldByName('SAVEACNT').AsString;
          Q_field         := Self.FindComponent('Qlfundamt1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption :=  FormatFloat('#,##0',Qry_Bank.FieldByName('SAVEAMT').AsFloat);
          Q_field         := Self.FindComponent('Qlfundded1'+IntToStr(No3)) as TQRLabel;
          Q_field.Caption := '';
          No3 := No3 + 1;
          Qry_Bank.Next
     end;

     //월세액.거주자간 주택임차차입금 원리금 상환액 공제 명세 2013.10 jissi
     with Qry_Rent do
     begin
          ServiceName := 'PKQ1030A_sel12';
          Close;
          Sql.Clear;
          Sql.Add('SELECT SEQ,                                                               ');
          Sql.Add('       MRENTKORNAME,    MRENTJUMINID,    MRENTADDR,                       ');
          Sql.Add('       MRENTFRDATE,     MRENTTODATE,                                      ');
          Sql.Add('       NVL(MRENTCOST,0) MRENTCOST,       NVL(MRENTCOSTDED,0) MRENTCOSTDED,');
          Sql.Add('       YLOANKORNAME,    YLOANJUMINID,    YLOANFRDATE,        YLOANTODATE, ');
          Sql.Add('       NVL(YLOANRATE,0) YLOANRATE,       NVL(YLOANSUM,0)     YLOANSUM,    ');
          Sql.Add('       NVL(YLOANAMT,0)  YLOANAMT,        NVL(YLOANINT,0)     YLOANINT,    ');
          Sql.Add('       NVL(YLOANDED,0)  YLOANDED,                                         ');
          Sql.Add('       YRENTKORNAME,    YRENTJUMINID,    YRENTADDR,                       ');
          Sql.Add('       YRENTFRDATE,     YRENTTODATE,     NVL(YRENTCOST,0)    YRENTCOST    ');
          Sql.Add('      ,MRENTTYPE,       NVL(MRENTSIZE,0) MRENTSIZE                        '); //2014.12 jissi 주택유형,면적 추가
          Sql.Add('      ,YRENTTYPE,       NVL(YRENTSIZE,0) YRENTSIZE                        '); //2014.12 jissi 주택유형,면적 추가
          Sql.Add('  FROM PKMYSRENT                                                          ');
          Sql.Add(' WHERE WORKYY = '''+Qry_Mater.FieldByName('workyy').AsString+'''          ');
          Sql.Add('   AND EMPNO  = '''+Qry_Mater.FieldByName('empno').AsString+'''           ');
          Sql.Add(' ORDER BY SEQ                                                             ');

          ClearFieldInfo;
          AddField('SEQ'           , ftString,  10);
          AddField('MRENTKORNAME'  , ftString,  20);
          AddField('MRENTJUMINID'  , ftString,  14);
          AddField('MRENTADDR'     , ftString, 100);
          AddField('MRENTFRDATE'   , ftString,   8);
          AddField('MRENTTODATE'   , ftString,   8);
          AddField('MRENTCOST'     , ftFloat,   10);
          AddField('MRENTCOSTDED'  , ftFloat,   10);
          AddField('YLOANKORNAME'  , ftString,  20);
          AddField('YLOANJUMINID'  , ftString,  14);
          AddField('YLOANFRDATE'   , ftString,   8);
          AddField('YLOANTODATE'   , ftString,   8);
          AddField('YLOANRATE'     , ftFloat,   10);
          AddField('YLOANSUM'      , ftFloat,   10);
          AddField('YLOANAMT'      , ftFloat,   10);
          AddField('YLOANINT'      , ftFloat,   10);
          AddField('YLOANDED'      , ftFloat,   10);
          AddField('YRENTKORNAME'  , ftString,  20);
          AddField('YRENTJUMINID'  , ftString,  14);
          AddField('YRENTADDR'     , ftString, 100);
          AddField('YRENTFRDATE'   , ftString,   8);
          AddField('YRENTTODATE'   , ftString,   8);
          AddField('YRENTCOST'     , ftFloat,   10);
          //2014.12 jissi 주택유형,면적 추가
          AddField('MRENTTYPE'     , ftString,   1);
          AddField('MRENTSIZE'     , ftFloat,   10);
          AddField('YRENTTYPE'     , ftString,   1);
          AddField('YRENTSIZE'     , ftFloat,   10);
          Open;

     end;

     No3 := 1;
     Qry_Rent.First;

     while not Qry_Rent.eof do
     begin
          if(Qry_Rent.FieldByName('MRENTCOST').AsFloat > 0) then
          begin
              Q_field         := Self.FindComponent('QRmrentkorname'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('MRENTKORNAME').AsString;
              Q_field         := Self.FindComponent('QRmrentjuminid'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('MRENTJUMINID').AsString;
              //2014.11 jissi 주택유형,주택면적 추가
              Q_field         := Self.FindComponent('QRyrenttype'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('MRENTTYPE').AsString;
              Q_field         := Self.FindComponent('QRyrentsize'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0.#0',Qry_Rent.FieldByName('MRENTSIZE').AsFloat);

              Q_field         := Self.FindComponent('QRmrentaddr'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('MRENTADDR').AsString;
              Q_field         := Self.FindComponent('QRmrentfrdate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := copy(Qry_Rent.FieldByName('MRENTFRDATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('MRENTFRDATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('MRENTFRDATE').AsString,7,2);
              Q_field         := Self.FindComponent('QRmrenttodate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := copy(Qry_Rent.FieldByName('MRENTTODATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('MRENTTODATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('MRENTTODATE').AsString,7,2);
              Q_field         := Self.FindComponent('QRmrentcost'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,###',Qry_Rent.FieldByName('MRENTCOST').AsFloat);
              Q_field         := Self.FindComponent('QRmrentcostded'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := '';//FormatFloat('#,###',Qry_Rent.FieldByName('MRENTCOSTDED').AsFloat);

              No3 := No3 + 1;
          end;
          Qry_Rent.Next;
     end;

     No3 := 1;
     Qry_Rent.First;

     while not Qry_Rent.eof do
     begin
          if (Qry_Rent.FieldByName('YRENTCOST').AsFloat> 0) then
          begin
              Q_field         := Self.FindComponent('QRyloankorname'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YLOANKORNAME').AsString;
              Q_field         := Self.FindComponent('QRyloanjuminid'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YLOANJUMINID').AsString;
              Q_field         := Self.FindComponent('QRyloandate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := copy(Qry_Rent.FieldByName('YLOANFRDATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('YLOANFRDATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('YLOANFRDATE').AsString,7,2)+' ~ '+
                                 copy(Qry_Rent.FieldByName('YLOANTODATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('YLOANTODATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('YLOANTODATE').AsString,7,2);;
              Q_field         := Self.FindComponent('QRyloanrate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0.#0',Qry_Rent.FieldByName('YLOANRATE').AsFloat);
              Q_field         := Self.FindComponent('QRyloansum'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,###',Qry_Rent.FieldByName('YLOANSUM').AsFloat);
              Q_field         := Self.FindComponent('QRyloanamt'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,###',Qry_Rent.FieldByName('YLOANAMT').AsFloat);
              Q_field         := Self.FindComponent('QRyloanint'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,###',Qry_Rent.FieldByName('YLOANINT').AsFloat);
              Q_field         := Self.FindComponent('QRyloanded'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := '';

              Q_field         := Self.FindComponent('QRyrentkorname'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YRENTKORNAME').AsString;
              Q_field         := Self.FindComponent('QRyrentjuminid'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YRENTJUMINID').AsString;
              //2014.11 jissi 주택유형,주택면적 추가
              Q_field         := Self.FindComponent('QRyrenttype'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YRENTTYPE').AsString;
              Q_field         := Self.FindComponent('QRyrentsize'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,##0.#0',Qry_Rent.FieldByName('YRENTSIZE').AsFloat);

              Q_field         := Self.FindComponent('QRyrentaddr'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := Qry_Rent.FieldByName('YRENTADDR').AsString;
              Q_field         := Self.FindComponent('QRyrentfrdate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := copy(Qry_Rent.FieldByName('YRENTFRDATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('YRENTFRDATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('YRENTFRDATE').AsString,7,2);
              Q_field         := Self.FindComponent('QRyrenttodate'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := copy(Qry_Rent.FieldByName('YRENTTODATE').AsString,1,4)+'.'+
                                 copy(Qry_Rent.FieldByName('YRENTTODATE').AsString,5,2)+'.'+
                                 copy(Qry_Rent.FieldByName('YRENTTODATE').AsString,7,2);
              Q_field         := Self.FindComponent('QRyrentcost'+IntToStr(No3)) as TQRLabel;
              Q_field.Caption := FormatFloat('#,###',Qry_Rent.FieldByName('YRENTCOST').AsFloat);

              No3 := No3 + 1;
          end;
          Qry_Rent.Next;
     end;
end;

end.
