{===================== Program Header ==========================================
 PROGRAM-NAME      : PKQ2180C(근로소득 원천징수부 출력)
 SYSTEM-NAME       : 급여
 SUBSYSTEM-NAME    :
 Programmer        : 2차수정자
 Version           : 30.00
 Date              : 1998.12.29

Update Contents
 Version  date(yy.mm.dd)  programmer  description                        relevant doc.no
 10.00     1997.12.31            이인환          최초개발본              설계명세서
 10.01     1998.12.16            민정숙          창업투자,유치원학자금   전98-12-04
 30.00     1998.12.29            송두호          직위/직급수정            하나로인사재개발
================================================================================}

unit pkq21803;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, DB, DBTables, StdCtrls, ExtCtrls, Qrctrls, Qrprntr ;

type
  TPrintForm = class(TForm)
    QReport: TQuickRep;
    Query_mas: TQuery;
    Query_sub: TQuery;
    DataSource1: TDataSource;
    QRBand_96: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLCorpName: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRL_empno: TQRLabel;
    QRLabel4: TQRLabel;
    QRL_korname: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRL_juminid1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRL_paycl_paygr: TQRLabel;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel14: TQRLabel;
    QRL_addr: TQRLabel;
    QRShape14: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRL_fami720no: TQRLabel;
    QRShape19: TQRShape;
    QRLabel18: TQRLabel;
    QRShape21: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape23: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape24: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape25: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel17: TQRLabel;
    QRL_fami6064no: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel19: TQRLabel;
    QRL_obstacleno: TQRLabel;
    QRL_fami65no: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel22: TQRLabel;
    QRL_fami16no: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel33: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel40: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape36: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRL_guaramt: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape35: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRLabel39: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel41: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape47: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRL_ghosamt: TQRLabel;
    QRShape40: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape48: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRL_hosded: TQRLabel;
    QRL_seduamt: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel81: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape57: TQRShape;
    QRLabel91: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape58: TQRShape;
    QRLabel96: TQRLabel;
    QRShape59: TQRShape;
    QRLabel101: TQRLabel;
    QRL_pgiveamt: TQRLabel;
    QRL_pgiveded: TQRLabel;
    QRL_pended: TQRLabel;
    QRL_giveded: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel106: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel112: TQRLabel;
    QRShape68: TQRShape;
    QRLabel121: TQRLabel;
    QRL_propamt_bpropamt: TQRLabel;
    QRShape69: TQRShape;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRL_propded: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel132: TQRLabel;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel130: TQRLabel;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel131: TQRLabel;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel135: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRShape79: TQRShape;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRShape80: TQRShape;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel162: TQRLabel;
    QRShape81: TQRShape;
    QRLabel143: TQRLabel;
    QRLabel146: TQRLabel;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRLabel151: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRShape90: TQRShape;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRShape91: TQRShape;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRShape92: TQRShape;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel157: TQRLabel;
    QRShape84: TQRShape;
    QRShape93: TQRShape;
    QRLabel171: TQRLabel;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel170: TQRLabel;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRShape100: TQRShape;
    QRLabel174: TQRLabel;
    QL_paysum_1: TQRLabel;
    QRShape101: TQRShape;
    QL_bonsum_1: TQRLabel;
    QRLabel177: TQRLabel;
    QRShape102: TQRShape;
    QRLabel178: TQRLabel;
    QL_taxpaysum_1: TQRLabel;
    QRShape103: TQRShape;
    QL_insduct_1: TQRLabel;
    QL_taxinamt_1: TQRLabel;
    QRShape105: TQRShape;
    QL_calctax_1: TQRLabel;
    QRShape106: TQRShape;
    QRLabel185: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel189: TQRLabel;
    QL_labtaxded_1: TQRLabel;
    QRShape108: TQRShape;
    QL_labtaxdedsum_1: TQRLabel;
    QRLabel196: TQRLabel;
    QRLabel197: TQRLabel;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    QL_intax_1: TQRLabel;
    QL_jutax_1: TQRLabel;
    QL_injutax_1: TQRLabel;
    QRShape117: TQRShape;
    QRLabel208: TQRLabel;
    QRShape118: TQRShape;
    QRLabel209: TQRLabel;
    QL_notaxpaysum_1: TQRLabel;
    QRLabel212: TQRLabel;
    QRShape120: TQRShape;
    QRLabel213: TQRLabel;
    QRLabel214: TQRLabel;
    QRShape122: TQRShape;
    QRLabel215: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel218: TQRLabel;
    QRShape123: TQRShape;
    QRLabel220: TQRLabel;
    QL_paysum_2: TQRLabel;
    QL_bonsum_2: TQRLabel;
    QL_taxpaysum_2: TQRLabel;
    QL_insduct_2: TQRLabel;
    QL_taxinamt_2: TQRLabel;
    QL_calctax_2: TQRLabel;
    QL_labtaxded_2: TQRLabel;
    QL_labtaxdedsum_2: TQRLabel;
    QL_intax_2: TQRLabel;
    QL_jutax_2: TQRLabel;
    QL_injutax_2: TQRLabel;
    QL_notaxpaysum_2: TQRLabel;
    QRShape124: TQRShape;
    QRLabel240: TQRLabel;
    QL_paysum_3: TQRLabel;
    QL_bonsum_3: TQRLabel;
    QL_taxpaysum_3: TQRLabel;
    QL_insduct_3: TQRLabel;
    QL_taxinamt_3: TQRLabel;
    QL_calctax_3: TQRLabel;
    QL_labtaxded_3: TQRLabel;
    QL_labtaxdedsum_3: TQRLabel;
    QL_intax_3: TQRLabel;
    QL_jutax_3: TQRLabel;
    QL_injutax_3: TQRLabel;
    QL_notaxpaysum_3: TQRLabel;
    QRShape125: TQRShape;
    QRLabel260: TQRLabel;
    QL_paysum_4: TQRLabel;
    QL_bonsum_4: TQRLabel;
    QL_taxpaysum_4: TQRLabel;
    QL_insduct_4: TQRLabel;
    QL_taxinamt_4: TQRLabel;
    QL_calctax_4: TQRLabel;
    QL_labtaxded_4: TQRLabel;
    QL_labtaxdedsum_4: TQRLabel;
    QL_intax_4: TQRLabel;
    QL_jutax_4: TQRLabel;
    QL_injutax_4: TQRLabel;
    QL_notaxpaysum_4: TQRLabel;
    QRShape126: TQRShape;
    QRLabel280: TQRLabel;
    QL_paysum_5: TQRLabel;
    QL_bonsum_5: TQRLabel;
    QL_taxpaysum_5: TQRLabel;
    QL_insduct_5: TQRLabel;
    QL_taxinamt_5: TQRLabel;
    QL_calctax_5: TQRLabel;
    QL_labtaxded_5: TQRLabel;
    QL_labtaxdedsum_5: TQRLabel;
    QL_intax_5: TQRLabel;
    QL_jutax_5: TQRLabel;
    QL_injutax_5: TQRLabel;
    QL_notaxpaysum_5: TQRLabel;
    QRShape127: TQRShape;
    QRLabel300: TQRLabel;
    QL_paysum_6: TQRLabel;
    QL_bonsum_6: TQRLabel;
    QL_taxpaysum_6: TQRLabel;
    QL_insduct_6: TQRLabel;
    QL_taxinamt_6: TQRLabel;
    QL_calctax_6: TQRLabel;
    QL_labtaxded_6: TQRLabel;
    QL_labtaxdedsum_6: TQRLabel;
    QL_intax_6: TQRLabel;
    QL_jutax_6: TQRLabel;
    QL_injutax_6: TQRLabel;
    QL_notaxpaysum_6: TQRLabel;
    QRShape128: TQRShape;
    QRLabel320: TQRLabel;
    QL_paysum_7: TQRLabel;
    QL_bonsum_7: TQRLabel;
    QL_taxpaysum_7: TQRLabel;
    QL_insduct_7: TQRLabel;
    QL_taxinamt_7: TQRLabel;
    QL_calctax_7: TQRLabel;
    QL_labtaxded_7: TQRLabel;
    QL_labtaxdedsum_7: TQRLabel;
    QL_intax_7: TQRLabel;
    QL_jutax_7: TQRLabel;
    QL_injutax_7: TQRLabel;
    QL_notaxpaysum_7: TQRLabel;
    QRShape129: TQRShape;
    QRLabel340: TQRLabel;
    QL_paysum_8: TQRLabel;
    QL_bonsum_8: TQRLabel;
    QL_taxpaysum_8: TQRLabel;
    QL_insduct_8: TQRLabel;
    QL_taxinamt_8: TQRLabel;
    QL_calctax_8: TQRLabel;
    QL_labtaxded_8: TQRLabel;
    QL_labtaxdedsum_8: TQRLabel;
    QL_intax_8: TQRLabel;
    QL_jutax_8: TQRLabel;
    QL_injutax_8: TQRLabel;
    QL_notaxpaysum_8: TQRLabel;
    QRShape130: TQRShape;
    QRLabel360: TQRLabel;
    QL_paysum_9: TQRLabel;
    QL_bonsum_9: TQRLabel;
    QL_taxpaysum_9: TQRLabel;
    QL_insduct_9: TQRLabel;
    QL_taxinamt_9: TQRLabel;
    QL_calctax_9: TQRLabel;
    QL_labtaxded_9: TQRLabel;
    QL_labtaxdedsum_9: TQRLabel;
    QL_intax_9: TQRLabel;
    QL_jutax_9: TQRLabel;
    QL_injutax_9: TQRLabel;
    QL_notaxpaysum_9: TQRLabel;
    QRShape131: TQRShape;
    QRLabel380: TQRLabel;
    QL_paysum_10: TQRLabel;
    QL_bonsum_10: TQRLabel;
    QL_taxpaysum_10: TQRLabel;
    QL_insduct_10: TQRLabel;
    QL_taxinamt_10: TQRLabel;
    QL_calctax_10: TQRLabel;
    QL_labtaxded_10: TQRLabel;
    QL_labtaxdedsum_10: TQRLabel;
    QL_intax_10: TQRLabel;
    QL_jutax_10: TQRLabel;
    QL_injutax_10: TQRLabel;
    QL_notaxpaysum_10: TQRLabel;
    QRShape132: TQRShape;
    QRLabel400: TQRLabel;
    QL_paysum_11: TQRLabel;
    QL_bonsum_11: TQRLabel;
    QL_taxpaysum_11: TQRLabel;
    QL_insduct_11: TQRLabel;
    QL_taxinamt_11: TQRLabel;
    QL_calctax_11: TQRLabel;
    QL_labtaxded_11: TQRLabel;
    QL_labtaxdedsum_11: TQRLabel;
    QL_intax_11: TQRLabel;
    QL_jutax_11: TQRLabel;
    QL_injutax_11: TQRLabel;
    QL_notaxpaysum_11: TQRLabel;
    QRShape133: TQRShape;
    QRLabel420: TQRLabel;
    QL_paysum_12: TQRLabel;
    QL_bonsum_12: TQRLabel;
    QL_taxpaysum_12: TQRLabel;
    QL_insduct_12: TQRLabel;
    QL_taxinamt_12: TQRLabel;
    QL_calctax_12: TQRLabel;
    QL_labtaxded_12: TQRLabel;
    QL_labtaxdedsum_12: TQRLabel;
    QL_intax_12: TQRLabel;
    QL_jutax_12: TQRLabel;
    QL_injutax_12: TQRLabel;
    QL_notaxpaysum_12: TQRLabel;
    QRShape134: TQRShape;
    QRLabel440: TQRLabel;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRLabel480: TQRLabel;
    QL_paysum_TOT: TQRLabel;
    QL_bonsum_TOT: TQRLabel;
    QL_taxpaysum_TOT: TQRLabel;
    QL_insduct_TOT: TQRLabel;
    QL_taxinamt_TOT: TQRLabel;
    QL_calctax_TOT: TQRLabel;
    QL_labtaxded_TOT: TQRLabel;
    QL_labtaxdedsum_TOT: TQRLabel;
    QL_intax_TOT: TQRLabel;
    QL_jutax_TOT: TQRLabel;
    QL_injutax_TOT: TQRLabel;
    QL_notaxpaysum_TOT: TQRLabel;
    QRShape137: TQRShape;
    QRLabel460: TQRLabel;
    QRLabel500: TQRLabel;
    QRL_taxgross: TQRLabel;
    QRShape142: TQRShape;
    QRShape144: TQRShape;
    QRLabel501: TQRLabel;
    QRShape138: TQRShape;
    QRLabel502: TQRLabel;
    QRLabel503: TQRLabel;
    QRL_laborded: TQRLabel;
    QRShape140: TQRShape;
    QRLabel506: TQRLabel;
    QRLabel507: TQRLabel;
    QRL_laboramt: TQRLabel;
    QRShape141: TQRShape;
    QRLabel509: TQRLabel;
    QRLabel510: TQRLabel;
    QRL_selfded: TQRLabel;
    QRShape145: TQRShape;
    QRLabel512: TQRLabel;
    QRL_mateded: TQRLabel;
    QRShape146: TQRShape;
    QRLabel514: TQRLabel;
    QRL_famided: TQRLabel;
    QRShape147: TQRShape;
    QRLabel516: TQRLabel;
    QRL_oldded: TQRLabel;
    QRShape148: TQRShape;
    QRLabel518: TQRLabel;
    QRL_obsded: TQRLabel;
    QRShape149: TQRShape;
    QRLabel520: TQRLabel;
    QRL_womanded: TQRLabel;
    QRLabel522: TQRLabel;
    QRL_childded: TQRLabel;
    QRShape151: TQRShape;
    QRLabel524: TQRLabel;
    QRLabel525: TQRLabel;
    QRLabel526: TQRLabel;
    QRShape152: TQRShape;
    QRShape154: TQRShape;
    QRLabel528: TQRLabel;
    QRL_insded: TQRLabel;
    QRLabel530: TQRLabel;
    QRL_hosded2: TQRLabel;
    QRLabel532: TQRLabel;
    QRL_eduded: TQRLabel;
    QRLabel534: TQRLabel;
    QRL_houseded: TQRLabel;
    QRLabel536: TQRLabel;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRLabel537: TQRLabel;
    QRL_giveded2: TQRLabel;
    QRL_specialded: TQRLabel;
    QRLabel540: TQRLabel;
    QRShape159: TQRShape;
    QRLabel542: TQRLabel;
    QRLabel543: TQRLabel;
    QRShape160: TQRShape;
    QRL_pended2: TQRLabel;
    QRLabel548: TQRLabel;
    QRLabel549: TQRLabel;
    QRL_taxlevel: TQRLabel;
    QRLabel551: TQRLabel;
    QRL_calctax: TQRLabel;
    QRLabel554: TQRLabel;
    QRLabel555: TQRLabel;
    QRL_incomtded: TQRLabel;
    QRLabel557: TQRLabel;
    QRLabel559: TQRLabel;
    QRLabel561: TQRLabel;
    QRLabel563: TQRLabel;
    QRLabel564: TQRLabel;
    QRL_tdedsum: TQRLabel;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRLabel569: TQRLabel;
    QRShape168: TQRShape;
    QRLabel570: TQRLabel;
    QRLabel572: TQRLabel;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRL_dintax: TQRLabel;
    QRL_djutax: TQRLabel;
    QRL_bintax: TQRLabel;
    QRL_bjutax: TQRLabel;
    QRLabel583: TQRLabel;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape178: TQRShape;
    QRLabel595: TQRLabel;
    QRLabel584: TQRLabel;
    QRLabel586: TQRLabel;
    QRL_mintax: TQRLabel;
    QRL_mjutax: TQRLabel;
    QRShape182: TQRShape;
    QRShape183: TQRShape;
    QRLabel598: TQRLabel;
    QRLabel600: TQRLabel;
    QRL_yintax: TQRLabel;
    QRL_yjutax: TQRLabel;
    QRL_ycalctax: TQRLabel;
    QRLabel606: TQRLabel;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRLabel607: TQRLabel;
    QRL_intaxN: TQRLabel;
    QRLabel609: TQRLabel;
    QRL_jutaxN: TQRLabel;
    QRLabel611: TQRLabel;
    QRL_ycalctaxN: TQRLabel;
    QRL_juminid2: TQRLabel;
    QRShape22: TQRShape;
    QRL_hireamt: TQRLabel;
    QRL_keduamt: TQRLabel;
    QRL_ceduamt: TQRLabel;
    QRL_ueduamt: TQRLabel;
    QRL_agiveamt: TQRLabel;
    QRL_laboramt05: TQRLabel;
    QRL_stkamt: TQRLabel;
    QRL_stkded: TQRLabel;
    QRL_houseamt: TQRLabel;
    QRL_foriamt: TQRLabel;
    QRL_forided: TQRLabel;
    QRL_fewded: TQRLabel;
    QRL_propded2: TQRLabel;
    QRL_hloanded: TQRLabel;
    QRL_forided2: TQRLabel;
    QRL_stkded2: TQRLabel;
    QRL_dnongtax: TQRLabel;
    QRL_bnongtax: TQRLabel;
    QRL_mnongtax: TQRLabel;
    QRL_ynongtax: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRLabel198: TQRLabel;
    QrL_bpaysum: TQRLabel;
    QRL_bbonsum: TQRLabel;
    QRLbsum: TQRLabel;
    QRL_bintax1: TQRLabel;
    QRL_bjutax1: TQRLabel;
    QRLbtaxsum: TQRLabel;
    QRShape373: TQRShape;
    QRL_medamt: TQRLabel;
    QRL_obsguaramt: TQRLabel;
    QRL_insded2: TQRLabel;
    QRShape20: TQRShape;
    QRLabel37: TQRLabel;
    QRL_anuamt: TQRLabel;
    QRLabel44: TQRLabel;
    QRL_nhosamt: TQRLabel;
    QRLabel52: TQRLabel;
    QRL_ohosamt: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRL_npended: TQRLabel;
    QRShape56: TQRShape;
    QRShape55: TQRShape;
    QRL_investded: TQRLabel;
    QRL_houseintamt: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    QRL_hs: TQRLabel;
    QRL_houseded2: TQRLabel;
    QRShape67: TQRShape;
    QRShape66: TQRShape;
    QRLabel99: TQRLabel;
    QRL_creditded: TQRLabel;
    QRShape70: TQRShape;
    QRShape374: TQRShape;
    QRShape375: TQRShape;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRL_anuded: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape376: TQRShape;
    QRShape377: TQRShape;
    QRLabel117: TQRLabel;
    QRShape378: TQRShape;
    QRL_standded: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel126: TQRLabel;
    QRL_lstkded: TQRLabel;
    QRL_nongtaxN: TQRLabel;
    QRShape379: TQRShape;
    QRShape380: TQRShape;
    QRLabel243: TQRLabel;
    QRLabel249: TQRLabel;
    QRLabel252: TQRLabel;
    QRLabel285: TQRLabel;
    QRShape381: TQRShape;
    QRLabel286: TQRLabel;
    QRLabel287: TQRLabel;
    QRLabel291: TQRLabel;
    QRLabel292: TQRLabel;
    QRShape382: TQRShape;
    QRLabel294: TQRLabel;
    QRLabel295: TQRLabel;
    QRLabel299: TQRLabel;
    QRShape181: TQRShape;
    QRLabel301: TQRLabel;
    QRShape155: TQRShape;
    QRLabel316: TQRLabel;
    QRLabel317: TQRLabel;
    QRLabel318: TQRLabel;
    QRL_creditded2: TQRLabel;
    QRLabel319: TQRLabel;
    QRLabel321: TQRLabel;
    QRL_investded2: TQRLabel;
    QRShape150: TQRShape;
    QRShape162: TQRShape;
    QRLabel342: TQRLabel;
    QRLabel345: TQRLabel;
    QRL_npended2: TQRLabel;
    QRShape172: TQRShape;
    QRShape177: TQRShape;
    QRShape143: TQRShape;
    QRShape179: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape107: TQRShape;
    QRShape109: TQRShape;
    QRShape104: TQRShape;
    QRShape111: TQRShape;
    QRShape119: TQRShape;
    QRShape153: TQRShape;
    QRShape158: TQRShape;
    QRShape164: TQRShape;
    QRShape161: TQRShape;
    QRShape110: TQRShape;
    QRShape139: TQRShape;
    QRLabel54: TQRLabel;
    QRL_foreignded2: TQRLabel;
    QRLabel59: TQRLabel;
    QRL_foreigned: TQRLabel;
    Query1: TQuery;

    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand_96BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QReportPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Details_clear;
  end;

var
  PrintForm: TPrintForm;
  i, j, mm: Integer;
  work: Real;
  Q_field: TQRLabel;

  SUM_taxpaysum, SUM_bonsum,  SUM_paysum,    SUM_insduct,
  SUM_taxinamt,  SUM_calctax, SUM_labtaxded, SUM_labtaxdedsum,
  SUM_intax,     SUM_jutax,   SUM_injutax,   SUM_notaxpaysum : Real;

implementation

{$R *.DFM}

uses pkq21801, peprnview ;

procedure TPrintForm.Details_clear;
begin
  for i := 0 to Self.ComponentCount -1 do
    if Copy(TQRLabel(Self.Components[i]).Name,1,3) = 'QL_' then
      TQRLabel(Self.Components[i]).Caption := Format('%8.0n', [0.0]);
  SUM_taxpaysum    := 0;
  SUM_bonsum       := 0;
  SUM_paysum       := 0;
  SUM_insduct      := 0;
  SUM_taxinamt     := 0;
  SUM_calctax      := 0;
  SUM_labtaxded    := 0;
  SUM_labtaxdedsum := 0;
  SUM_intax        := 0;
  SUM_jutax        := 0;
  SUM_injutax      := 0;
  SUM_notaxpaysum  := 0;
end;

procedure TPrintForm.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  j := 0;
end;

procedure TPrintForm.QRBand_96BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(j);
  MainForm.Phelpmsg.Caption := ' '+IntToStr(j)+' / '+IntToStr(Query_mas.RecordCount);
  MainForm.Gauge1.Progress := (j * 100) div Query_mas.RecordCount;
  Application.ProcessMessages;


  ///회사명...  dsa2000  2004.12
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add ( 'SELECT CORPNAME FROM PKCPBAS');
  Query1.Open;
  QRLCorpName.Caption := Query1.Fieldbyname('CORPNAME').AsString;
  Query1.Close;

  {사번}
  QRL_empno.Caption       := Query_mas.FieldByName('EMPNO').AsString;
  QRL_korname.Caption     := Query_mas.FieldByName('KORNAME').AsString;
  QRL_juminid1.Caption    := Copy(Query_mas.FieldByName('JUMINID').AsString,1,6);
  QRL_juminid2.Caption    := Copy(Query_mas.FieldByName('JUMINID').AsString,7,8);

{===============================================================================
 Version  date(yy.mm.dd)  programmer  description                       relevant doc.no
   30.00     1998.12.29          송두호         직위/직급수정           하나로인사재개발
================================================================================}
//  급호대신 직급만 프린트(호봉삭제) , 직급코드 대신 직급명을 프린트
//  QRL_paycl_paygr.Caption := Query_mas.FieldByName('PAYCL').AsString + '-' +
//                             IntToStr(Query_mas.FieldByName('PAYGR').AsInteger);
  QRL_paycl_paygr.Caption := MainForm.Get_PayClName(Query_mas.FieldByName('PAYCL').AsString);
  QRL_addr.Caption        := Query_mas.FieldByName('ADDR').AsString;

  {부양가족 / 20세이하}
  QRL_fami720no.Caption  := Format('%1.0n', [Query_mas.FieldByName('FAMI720NO').AsFloat]);
  QRL_fami6064no.Caption := Format('%1.0n', [Query_mas.FieldByName('FAMI6064NO').AsFloat]);
  QRL_obstacleno.Caption := Format('%1.0n', [Query_mas.FieldByName('OBSTACLENO').AsFloat]);
  QRL_fami65no.Caption   := Format('%1.0n', [Query_mas.FieldByName('FAMI65NO').AsFloat]);
  QRL_fami16no.Caption   := Format('%1.0n', [Query_mas.FieldByName('FAMI16NO').AsFloat]);

  {의료보험, 고용보험}
  QRL_anuamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('YANU').AsFloat
                                             + Query_mas.FieldByName('BANUAMT').AsFloat]);
  QRL_medamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('MEDAMT').AsFloat
                                             + Query_mas.FieldByName('BMEDAMT').AsFloat ]);
  QRL_hireamt.Caption    := Format('%9.0n', [Query_mas.FieldByName('HIREAMT').AsFloat
                                             + Query_mas.FieldByName('BHIREAMT').AsFloat ]);
  QRL_guaramt.Caption    := Format('%9.0n', [Query_mas.FieldByName('GUARAMT').AsFloat]);
  QRL_obsguaramt.Caption := Format('%9.0n', [Query_mas.FieldByName('OBSGUARAMT').AsFloat]);
  QRL_insded2.Caption    := Format('%9.0n', [Query_mas.FieldByName('INSDED').AsFloat]);
  
  {지출의료비: ghosamt + ohosamt + nhosamt + bghosamt}
  QRL_ghosamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('GHOSAMT').AsFloat]);
  QRL_nhosamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('NHOSAMT').AsFloat]);
  QRL_ohosamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('OHOSAMT').AsFloat]);
  QRL_hosded.Caption      := Format('%9.0n', [Query_mas.FieldByName('HOSDED').AsFloat]);
  QRL_seduamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('SEDUAMT').AsFloat]);

  QRL_keduamt.Caption     := Format('%8.0n', [Query_mas.FieldByName('KEDUAMT').AsFloat]);
  QRL_ceduamt.Caption     := Format('%8.0n', [Query_mas.FieldByName('CEDUAMT').AsFloat]);
  QRL_ueduamt.Caption     := Format('%8.0n', [Query_mas.FieldByName('UEDUAMT').AsFloat]);

  {지정기부금 / 지급액}
   QRL_agiveamt.Caption    := Format('%9.0n', [Query_mas.FieldByName('AGIVEAMT').AsFloat]);
   QRL_pgiveamt.Caption    := Format('%9.0n', [Query_mas.FieldByName('PGIVEAMT').AsFloat]);
   QRL_laboramt05.Caption  := Format('%9.0n', [(Query_mas.FieldByName('LABORAMT').AsFloat
                                               - Query_mas.FieldByName('AGIVEDED').AsFloat) * 0.1]);
   QRL_pgiveded.Caption    := Format('%9.0n', [Query_mas.FieldByName('PGIVEDED').AsFloat]);
   QRL_giveded.Caption     := Format('%9.0n', [Query_mas.FieldByName('GIVEDED').AsFloat]);
   QRL_pended.Caption      := Format('%9.0n', [Query_mas.FieldByName('PENDED').AsFloat]);
   QRL_npended.Caption     := Format('%9.0n', [Query_mas.FieldByName('NPENDED').AsFloat]);
   QRL_investded.Caption   := Format('%9.0n', [Query_mas.FieldByName('INVESTDED').AsFloat]);
   QRL_creditded.Caption   := Format('%9.0n', [Query_mas.FieldByName('CREDITDED').AsFloat]);
   QRL_foreigned.Caption   := Format('%9.0n', [Query_mas.FieldByName('FOREIGNDED').AsFloat]);   //dsa2000 2003.12.

  {재형저축 / 저축총액}
  QRL_propamt_bpropamt.Caption := Format('%8.0n', [Query_mas.FieldByName('PROPAMT').AsFloat +
                                                   Query_mas.FieldByName('BPROPAMT').AsFloat]);

  QRL_propded.Caption          := Format('%8.0n', [Query_mas.FieldByName('PROPDED').AsFloat]);

  {주식저축}
  QRL_stkamt.Caption           := Format('%9.0n', [Query_mas.FieldByName('STKAMT').AsFloat]);
  QRL_stkded.Caption           := Format('%9.0n', [Query_mas.FieldByName('STKDED').AsFloat]);

  {주택자금}
  QRL_houseamt.Caption        := Format('%9.0n', [Query_mas.FieldByName('HOUSEAMT').AsFloat]);
  QRL_houseintamt.Caption     := Format('%9.0n', [Query_mas.FieldByName('HOUSEINTAMT').AsFloat]);
  QRL_hs.Caption              := Format('%9.0n', [(Query_mas.FieldByName('HOUSEAMT').AsFloat * 0.4)
                                                  + Query_mas.FieldByName('HOUSEINTAMT').AsFloat]);
  QRL_houseded2.Caption       := Format('%9.0n', [Query_mas.FieldByName('HOUSEded').AsFloat]);

  {외국납부}
  QRL_foriamt.Caption          := Format('%8.0n', [Query_mas.FieldByName('FORIAMT').AsFloat]);
  QRL_forided.Caption          := Format('%8.0n', [Query_mas.FieldByName('FORIDED').AsFloat]);

  {(64)근로소득}
  QRL_taxgross.Caption := Format('%8.0n', [Query_mas.FieldByName('TAXGROSS').AsFloat]);
  QRL_laborded.Caption := Format('%8.0n', [Query_mas.FieldByName('LABORDED').AsFloat]);
  QRL_laboramt.Caption := Format('%8.0n', [Query_mas.FieldByName('LABORAMT').AsFloat]);
  {(67)본인}
  QRL_selfded.Caption  := Format('%8.0n', [Query_mas.FieldByName('SELFDED').AsFloat]);
  QRL_mateded.Caption  := Format('%8.0n', [Query_mas.FieldByName('MATEDED').AsFloat]);
  QRL_famided.Caption  := Format('%8.0n', [Query_mas.FieldByName('FAMIDED').AsFloat]);
  {(70)경로우대}
  QRL_oldded.Caption   := Format('%8.0n', [Query_mas.FieldByName('OLDDED').AsFloat]);
  QRL_obsded.Caption   := Format('%8.0n', [Query_mas.FieldByName('OBSDED').AsFloat]);
  QRL_womanded.Caption := Format('%8.0n', [Query_mas.FieldByName('WOMANDED').AsFloat]);
  QRL_childded.Caption := Format('%8.0n', [Query_mas.FieldByName('CHILDDED').AsFloat]);
  QRL_fewded.Caption   := Format('%8.0n', [Query_mas.FieldByName('FEWDED').AsFloat]);
  QRL_anuded.Caption   := Format('%9.0n', [Query_mas.FieldByName('ANUDED').AsFloat]);

  {(75)보험료}
  QRL_insded.Caption     := Format('%8.0n', [Query_mas.FieldByName('INSDED').AsFloat]);
  QRL_hosded2.Caption    := Format('%8.0n', [Query_mas.FieldByName('HOSDED').AsFloat]);
  QRL_eduded.Caption     := Format('%8.0n', [Query_mas.FieldByName('EDUDED').AsFloat]);
  QRL_houseded.Caption   := Format('%8.0n', [Query_mas.FieldByName('HOUSEDED').AsFloat]);
  QRL_giveded2.Caption   := Format('%8.0n', [Query_mas.FieldByName('GIVEDED').AsFloat]);
  QRL_specialded.Caption := Format('%8.0n', [Query_mas.FieldByName('SPECIALDED').AsFloat]);
  QRL_standded.Caption   := Format('%9.0n', [Query_mas.FieldByName('STANDDED').AsFloat]);
  {(81)연금소득공제}
  QRL_pended2.Caption     := Format('%8.0n', [Query_mas.FieldByName('PENDED').AsFloat]);
  QRL_npended2.Caption    := Format('%9.0n', [Query_mas.FieldByName('NPENDED').AsFloat]);
  QRL_investded2.Caption  := Format('%9.0n', [Query_mas.FieldByName('INVESTDED').AsFloat]);
  QRL_creditded2.Caption  := Format('%9.0n', [Query_mas.FieldByName('CREDITDED').AsFloat]);
  QRL_foreignded2.Caption := Format('%9.0n', [Query_mas.FieldByName('FOREIGNDED').AsFloat]);   //dsa2000 2003.12.
  QRL_taxlevel.Caption  := Format('%8.0n', [Query_mas.FieldByName('TAXLEVEL').AsFloat]);
  QRL_calctax.Caption   := Format('%8.0n', [Query_mas.FieldByName('CALCTAX').AsFloat]);
  QRL_incomtded.Caption := Format('%8.0n', [Query_mas.FieldByName('INCOMTDED').AsFloat]);
  QRL_propded2.Caption  := Format('%8.0n', [Query_mas.FieldByName('PROPDED').AsFloat]);
  QRL_hloanded.Caption  := Format('%8.0n', [Query_mas.FieldByName('HLOANDED').AsFloat]);
  QRL_forided2.Caption  := Format('%8.0n', [Query_mas.FieldByName('FORIDED').AsFloat]);
  QRL_stkded2.Caption   := Format('%8.0n', [Query_mas.FieldByName('STKDED').AsFloat]);
  QRL_lstkded.Caption   := Format('%9.0n', [Query_mas.FieldByName('LSTKDED').AsFloat]);
  QRL_tdedsum.Caption   := Format('%8.0n', [Query_mas.FieldByName('TDEDSUM').AsFloat]);

  {(92)소득세}
  QRL_dintax.Caption   := Format('%8.0n', [Query_mas.FieldByName('DINTAX').AsFloat]);
  QRL_djutax.Caption   := Format('%8.0n', [Query_mas.FieldByName('DJUTAX').AsFloat]);
  QRL_dnongtax.Caption := Format('%8.0n', [Query_mas.FieldByName('DNONGTAX').AsFloat]);
  QRL_bintax.Caption   := Format('%8.0n', [Query_mas.FieldByName('BINTAX').AsFloat]);
  QRL_bjutax.Caption   := Format('%8.0n', [Query_mas.FieldByName('BJUTAX').AsFloat]);
  QRL_bnongtax.Caption := Format('%8.0n', [Query_mas.FieldByName('BNONGTAX').AsFloat]);

  {(101)소득세}
  QRL_mintax.Caption    := Format('%8.0n', [Query_mas.FieldByName('MINTAX').AsFloat]);
  QRL_mjutax.Caption    := Format('%8.0n', [Query_mas.FieldByName('MJUTAX').AsFloat]);
  QRL_mnongtax.Caption  := Format('%8.0n', [Query_mas.FieldByName('MNONGTAX').AsFloat]);
  QRL_yintax.Caption    := Format('%8.0n', [0.0]);
  QRL_yjutax.Caption    := Format('%8.0n', [0.0]);
  QRL_ynongtax.Caption  := Format('%8.0n', [0.0]);
  QRL_ycalctax.Caption  := Format('%8.0n', [0.0]);

  QRL_intaxN.Caption    := Format('%8.0n', [0.0]);
  QRL_jutaxN.Caption    := Format('%8.0n', [0.0]);
  QRL_ycalctaxN.Caption := Format('%8.0n', [0.0]);


      if Query_mas.FieldByName('YINTAX').AsFloat > 0 then
         QRL_yintax.Caption := Format('%9.0n', [Query_mas.FieldByName('YINTAX').AsFloat])
      else
         QRL_intaxN.Caption := Format('%9.0n', [(-1)*Query_mas.FieldByName('YINTAX').AsFloat]) ;

      if Query_mas.FieldByName('YINTAX').AsFloat > 0 then
         QRL_yjutax.Caption    := Format('%9.0n', [Query_mas.FieldByName('YJUTAX').AsFloat])
      else
         QRL_jutaxN.Caption    := Format('%9.0n', [(-1)*Query_mas.FieldByName('YJUTAX').AsFloat]);

      if Query_mas.FieldByName('YnongTAX').AsFloat > 0 then
         QRL_ynongtax.Caption    := Format('%9.0n', [Query_mas.FieldByName('YnongTAX').AsFloat])
      else
         QRL_nongtaxN.Caption    := Format('%9.0n', [(-1)*Query_mas.FieldByName('YnongTAX').AsFloat]);


      if Query_mas.FieldByName('YCALCTAX').AsFloat > 0 then
         QRL_ycalctax.Caption  := Format('%9.0n', [Query_mas.FieldByName('YCALCTAX').AsFloat])
      else
         QRL_ycalctaxN.Caption := Format('%9.0n', [(-1)*Query_mas.FieldByName('YCALCTAX').AsFloat]);


  Details_clear;
  Query_sub.ParamByName('P_payyear').AsString := MainForm.ME_workyy.Text;
  Query_sub.ParamByName('P_empno').AsString   := Query_mas.FieldByName('EMPNO').AsString;
  Query_sub.open;
  while not Query_sub.eof do
  begin
    mm := StrToIntDef(Copy(Query_sub.FieldByName('PAYDATE').AsString,5,2), 0); {월}
    if (Query_sub.RecordCount > 0) and (mm > 0) and (mm <= 12) then
    begin
      {근로소득수입금액 / 계}
      Q_field := Self.FindComponent('QL_taxpaysum_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('TAXPAYSUM').AsFloat]);
      SUM_taxpaysum := SUM_taxpaysum + Query_sub.FieldByName('TAXPAYSUM').AsFloat;

      {근로소득수입금액 / 상여총액}
      work := Query_sub.FieldByName('QUATERPAY').AsFloat   +
              Query_sub.FieldByName('TAXBONUS').AsFloat  +
              Query_sub.FieldByName('BTAXBON').AsFloat;

      Q_field := Self.FindComponent('QL_bonsum_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [work]);
      SUM_bonsum := SUM_bonsum + work;

      {근로소득수입금액 / 급여총액}
      Q_field := Self.FindComponent('QL_paysum_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('TAXPAYSUM').AsFloat - work]);
      SUM_paysum := SUM_paysum + Query_sub.FieldByName('TAXPAYSUM').AsFloat - work;

      {보험료공제}

      work := Query_sub.FieldByName('MEDDAMT').AsFloat +
              Query_sub.FieldByName('EMPLDAMT').AsFloat +
              Query_sub.FieldByName('ANUDAMT').AsFloat;
      Q_field := Self.FindComponent('QL_insduct_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [work]);
      SUM_insduct := SUM_insduct + work;

      {차감근로소득(과세표준)}
      Q_field := Self.FindComponent('QL_taxinamt_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('TAXINAMT').AsFloat]);
      SUM_taxinamt := SUM_taxinamt + Query_sub.FieldByName('TAXINAMT').AsFloat;

      {간이세율에의한소득세(산출세)}
      Q_field := Self.FindComponent('QL_calctax_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('CALCTAX').AsFloat]);
      SUM_calctax := SUM_calctax + Query_sub.FieldByName('CALCTAX').AsFloat;

      {세액공제 / 근로소득}
      Q_field := Self.FindComponent('QL_labtaxded_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('LABTAXDED').AsFloat]);
      SUM_labtaxded := SUM_labtaxded + Query_sub.FieldByName('LABTAXDED').AsFloat;

      {세액공제 / 계}
      Q_field := Self.FindComponent('QL_labtaxdedsum_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('LABTAXDED').AsFloat]);
      SUM_labtaxdedsum := SUM_labtaxdedsum + Query_sub.FieldByName('LABTAXDED').AsFloat;

      {차감징수세액 / 소득세}
      Q_field := Self.FindComponent('QL_intax_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('INTAX').AsFloat]);
      SUM_intax := SUM_intax + Query_sub.FieldByName('INTAX').AsFloat;

      {차감징수세액 / 소득세}
      Q_field := Self.FindComponent('QL_jutax_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('JUTAX').AsFloat]);
      SUM_jutax := SUM_jutax + Query_sub.FieldByName('JUTAX').AsFloat;

      {차감징수세액 / 계}
      work := Query_sub.FieldByName('INTAX').AsFloat +
              Query_sub.FieldByName('JUTAX').AsFloat;
      Q_field := Self.FindComponent('QL_injutax_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [work]);
      SUM_injutax := SUM_injutax + work;

      {비과세급여등 / 금액}
      Q_field := Self.FindComponent('QL_notaxpaysum_'+IntToStr(mm)) as TQRLabel;
      Q_field.Caption := Format('%8.0n', [Query_sub.FieldByName('NOTAXPAYSUM').AsFloat]);
      SUM_notaxpaysum := SUM_notaxpaysum + Query_sub.FieldByName('NOTAXPAYSUM').AsFloat;

      Query_sub.Next;
    end;

    Q_field := Self.FindComponent('QL_taxpaysum_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_taxpaysum]);

    Q_field := Self.FindComponent('QL_bonsum_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_bonsum]);

    Q_field := Self.FindComponent('QL_paysum_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_paysum]);

    Q_field := Self.FindComponent('QL_insduct_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_insduct]);

    Q_field := Self.FindComponent('QL_taxinamt_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_taxinamt]);

    Q_field := Self.FindComponent('QL_calctax_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_calctax]);

    Q_field := Self.FindComponent('QL_labtaxded_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_labtaxded]);

    Q_field := Self.FindComponent('QL_labtaxdedsum_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_labtaxdedsum]);

    Q_field := Self.FindComponent('QL_intax_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_intax]);

    Q_field := Self.FindComponent('QL_jutax_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_jutax]);

    Q_field := Self.FindComponent('QL_injutax_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_injutax]);

    Q_field := Self.FindComponent('QL_notaxpaysum_TOT') as TQRLabel;
    Q_field.Caption := Format('%8.0n', [SUM_notaxpaysum]);
  end;
  
    //2002.1. 유추가 start
      Q_field := Self.FindComponent('Qrl_bpaysum') as TQRLabel;
      Q_field.Caption := Format('%9.0n', [Query_mas.FieldByName('bpaysum').AsFloat]);

      SUM_paysum          := SUM_paysum +
                             Query_mas.FieldByName('bpaysum').AsFloat;

      Qrl_bbonsum.Caption := Format('%9.0n', [Query_mas.FieldByName('bbonsum').AsFloat]);
      SUM_bonsum          := SUM_bonsum +
                             Query_mas.FieldByName('bbonsum').AsFloat;

      Qrlbsum.Caption := Format('%9.0n', [Query_mas.FieldByName('bpaysum').AsFloat+
                                           Query_mas.FieldByName('bbonsum').AsFloat]);
      SUM_taxpaysum      := SUM_taxpaysum +
                             Query_mas.FieldByName('bpaysum').AsFloat+
                             Query_mas.FieldByName('bbonsum').AsFloat;

      Qrl_bintax1.Caption := Format('%9.0n', [Query_mas.FieldByName('bintax').AsFloat]);
      SUM_intax           := SUM_intax +
                             Query_mas.FieldByName('bintax').AsFloat;

      Qrl_bjutax1.Caption := Format('%9.0n', [Query_mas.FieldByName('bjutax').AsFloat]);
      SUM_jutax           := SUM_jutax +
                             Query_mas.FieldByName('bjutax').AsFloat;

      QRLbtaxsum.Caption := Format('%9.0n', [ Query_mas.FieldByName('bintax').AsFloat+
                                               Query_mas.FieldByName('bjutax').AsFloat  ]);
      SUM_injutax         := SUM_injutax +
                             Query_mas.FieldByName('bintax').AsFloat+
                             Query_mas.FieldByName('bjutax').AsFloat;

  //2002.1.유추가 end

  Query_sub.Close;

end;

procedure TPrintForm.QReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Qreport);
  Fm_PreviewForm.Show ;
end;


end.
