unit psc22003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, Db, DBTables, PASS ,qrprntr ,DBClient,
  StdCtrls;

type
  TF_psc22003 = class(TForm)
    QuickRep1: TQuickRep;
    Query2: TQuery;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    A3: TQRLabel;
    QRLabel13: TQRLabel;
    A5: TQRLabel;
    QRLabel18: TQRLabel;
    A9: TQRLabel;
    QRLabel23: TQRLabel;
    A18: TQRLabel;
    QRLabel28: TQRLabel;
    QRL_reqdate: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRLabel4: TQRLabel;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    A4: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    A7: TQRLabel;
    A8: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    A6: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel32: TQRLabel;
    A10: TQRLabel;
    QRLabel34: TQRLabel;
    A19: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel36: TQRLabel;
    A11: TQRLabel;
    QRLabel38: TQRLabel;
    A20: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    A21: TQRLabel;
    B3: TQRLabel;
    B4: TQRLabel;
    B5: TQRLabel;
    B9: TQRLabel;
    B10: TQRLabel;
    B11: TQRLabel;
    B21: TQRLabel;
    C3: TQRLabel;
    C4: TQRLabel;
    C5: TQRLabel;
    B12: TQRLabel;
    B13: TQRLabel;
    B14: TQRLabel;
    B22: TQRLabel;
    B6: TQRLabel;
    B7: TQRLabel;
    B15: TQRLabel;
    B18: TQRLabel;
    B16: TQRLabel;
    B19: TQRLabel;
    B17: TQRLabel;
    B20: TQRLabel;
    D3: TQRLabel;
    D4: TQRLabel;
    D5: TQRLabel;
    C9: TQRLabel;
    C10: TQRLabel;
    C11: TQRLabel;
    C21: TQRLabel;
    E3: TQRLabel;
    E4: TQRLabel;
    E5: TQRLabel;
    C12: TQRLabel;
    C13: TQRLabel;
    C14: TQRLabel;
    C22: TQRLabel;
    C6: TQRLabel;
    C7: TQRLabel;
    C15: TQRLabel;
    C18: TQRLabel;
    C16: TQRLabel;
    C19: TQRLabel;
    C17: TQRLabel;
    C20: TQRLabel;
    D9: TQRLabel;
    D10: TQRLabel;
    D11: TQRLabel;
    D12: TQRLabel;
    D13: TQRLabel;
    D14: TQRLabel;
    D6: TQRLabel;
    D7: TQRLabel;
    D8: TQRLabel;
    D15: TQRLabel;
    D18: TQRLabel;
    D16: TQRLabel;
    D19: TQRLabel;
    D17: TQRLabel;
    D20: TQRLabel;
    QRShape2: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    B8_2: TQRLabel;
    B8_1: TQRLabel;
    C8_2: TQRLabel;
    C8_1: TQRLabel;
    D8_2: TQRLabel;
    D8_1: TQRLabel;
    B8_3: TQRLabel;
    C8_3: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    G4: TQRLabel;
    F3: TQRLabel;
    G5: TQRLabel;
    F5: TQRLabel;
    F6: TQRLabel;
    F7: TQRLabel;
    F8_1: TQRLabel;
    F8_2: TQRLabel;
    F8_3: TQRLabel;
    F9_3: TQRLabel;
    F9_2: TQRLabel;
    F9_1: TQRLabel;
    F10: TQRLabel;
    F11_3: TQRLabel;
    F11_2: TQRLabel;
    F11_1: TQRLabel;
    F12: TQRLabel;
    F13_3: TQRLabel;
    F13_2: TQRLabel;
    F13_1: TQRLabel;
    F14: TQRLabel;
    F15_2: TQRLabel;
    F15_1: TQRLabel;
    F4: TQRLabel;
    G3: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    I4: TQRLabel;
    I5: TQRLabel;
    H5: TQRLabel;
    H6: TQRLabel;
    H7: TQRLabel;
    H8_1: TQRLabel;
    H8_2: TQRLabel;
    H8_3: TQRLabel;
    H9_3: TQRLabel;
    H9_2: TQRLabel;
    H9_1: TQRLabel;
    H10: TQRLabel;
    H11_3: TQRLabel;
    H11_2: TQRLabel;
    H11_1: TQRLabel;
    H12: TQRLabel;
    H13_3: TQRLabel;
    H13_2: TQRLabel;
    H13_1: TQRLabel;
    H14: TQRLabel;
    H15_2: TQRLabel;
    H15_1: TQRLabel;
    H3: TQRLabel;
    I3: TQRLabel;
    H4: TQRLabel;
    QRLabel44: TQRLabel;
    Q_SKBBjusic: TQRLabel;
    QRLabel46: TQRLabel;
    Q_sajurate: TQRLabel;
    QRShape29: TQRShape;
    QRLabel45: TQRLabel;
    J6: TQRLabel;
    J7: TQRLabel;
    J18: TQRLabel;
    J19: TQRLabel;
    J20: TQRLabel;
    J21: TQRLabel;
    QRLabel47: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
          var PrintBand: Boolean);

  private
    { Private declarations }
  public
    GSempno    : String[4];
    GSkorname  : String[12];
    GSpassword : String[10];
    GSgrade    : String[10];
    GSsysdate  : String[15];
    WK_ST_DATE    : STring;
    { Public declarations }
    procedure RetrieveData1;
  end;

var
     F_psc22003: TF_psc22003;
     sqlstr  : string;


implementation

uses
     psc22001, psc22002;

{$R *.DFM}

//------------------------------ MAIN ------------------------------------------
procedure TF_psc22003.QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
begin
     QRL_reqdate.caption := copy(F_psc22001.WORK_DATE.text,1,4)+'.'+
                            copy(F_psc22001.WORK_DATE.text,5,2)+'.'+
                            copy(F_psc22001.WORK_DATE.text,7,2);
     WK_ST_DATE          := Copy(F_psc22001.WORK_DATE.text,1,8);
     RetrieveData1;
end;

procedure TF_psc22003.QuickRep1Preview(Sender: TObject);
begin
     Fm_PreviewForm      := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
     Fm_PreviewForm.Show;
end;

procedure TF_psc22003.RetrieveData1;
var
     i, j, k   : Integer;
     in_cnt    : Array[1..5, 1..2] of Integer;
     stl_amt   : Array[1..7, 1..3, 1..3] of Double;
begin
     //----------- 대출기간 이율 --------------
     sqlstr := 'SELECT  AA.DIVSEQNUM A_1,AA.STLORG A_2,AA.STLDATE A_3,AA.STLEDATE A_4, AA.STIRATE A_5,   '+
               '        BB.DIVSEQNUM B_1,BB.STLORG B_2,BB.STLDATE B_3,BB.STLEDATE B_4, BB.STIRATE B_5,   '+
               '        CC.DIVSEQNUM C_1,CC.STLORG C_2,CC.STLDATE C_3,CC.STLEDATE C_4, CC.STIRATE C_5,   '+
               '        DD.DIVSEQNUM D_1,DD.STLORG D_2,DD.STLDATE D_3,DD.STLEDATE D_4, DD.STIRATE D_5,   '+
               '        EE.DIVSEQNUM E_1,EE.STLORG E_2,EE.STLDATE E_3,EE.STLEDATE E_4, EE.STIRATE E_5,   '+
               '        FF.DIVSEQNUM F_1,FF.STLORG F_2,FF.STLDATE F_3,FF.STLEDATE F_4, FF.STIRATE F_5,   '+
               '        GG.DIVSEQNUM G_1,GG.STLORG G_2,GG.STLDATE G_3,GG.STLEDATE G_4, GG.STIRATE G_5,   '+
               '        HH.DIVSEQNUM H_1,HH.STLORG H_2,HH.STLDATE H_3,HH.STLEDATE H_4, HH.STIRATE H_5,   '+
               '        HH.DIVSEQNUM I_1,II.STLORG I_2,II.STLDATE I_3,II.STLEDATE I_4, II.STIRATE I_5    '+
               '  FROM  (SELECT DISTINCT A.DIVSEQNUM ,A.STLORG ,A.STLDATE ,A.STLEDATE , A.STIRATE        '+
               '	   FROM PSHLBAS A                                                                '+
               '   	  WHERE A.DIVSEQNUM = ''1''                                                      '+
               '	    AND A.STLORG = ''ZZ'' ) AA,                                                  '+
               '        (SELECT DISTINCT B.DIVSEQNUM ,B.STLORG ,B.STLDATE ,B.STLEDATE , B.STIRATE        '+
               '    	   FROM PSHLBAS B                                                                '+
               '          WHERE B.DIVSEQNUM = ''2''                                                      '+
               '            AND B.STLORG = ''ZZ'' ) BB,                                                  '+
               '        (SELECT DISTINCT C.DIVSEQNUM ,C.STLORG ,C.STLDATE ,C.STLEDATE , C.STIRATE        '+
               '       	   FROM PSHLBAS C                                                                '+
               '          WHERE C.DIVSEQNUM = ''2''                                                      '+
               '            AND C.STLORG = ''05'' ) CC,                                                  '+
               '        (SELECT DISTINCT D.DIVSEQNUM ,D.STLORG ,D.STLDATE ,D.STLEDATE , D.STIRATE        '+
               '	   FROM PSHLBAS D                                                                '+
               '	  WHERE D.DIVSEQNUM = ''3''                                                      '+
               '	    AND D.STLORG = ''ZZ'' ) DD,                                                  '+
               '        (SELECT DISTINCT E.DIVSEQNUM ,E.STLORG ,E.STLDATE ,E.STLEDATE , E.STIRATE        '+
               '	   FROM PSHLBAS E                                                                '+
               '	  WHERE E.DIVSEQNUM = ''3''                                                      '+
               '	    AND E.STLORG = ''81'' ) EE,                                                  '+
               '        (SELECT DISTINCT F.DIVSEQNUM ,F.STLORG ,F.STLDATE ,F.STLEDATE , F.STIRATE        '+
               '	   FROM PSHLBAS F                                                                '+
               '	  WHERE F.DIVSEQNUM = ''4''                                                      '+
               '	    AND F.STLORG = ''81'' ) FF,                                                  '+
               '        (SELECT DISTINCT G.DIVSEQNUM ,G.STLORG ,G.STLDATE ,G.STLEDATE , G.STIRATE        '+
               '	   FROM PSHLBAS G                                                                '+
               '	  WHERE G.DIVSEQNUM = ''4''                                                      '+
               '	    AND G.STLORG = ''23'' ) GG,                                                  '+
               '        (SELECT DISTINCT H.DIVSEQNUM ,H.STLORG ,H.STLDATE ,H.STLEDATE , H.STIRATE        '+
               '	   FROM PSHLBAS H                                                                '+
               '	  WHERE H.DIVSEQNUM = ''5''                                                      '+
               '	    AND H.STLORG = ''11'' ) HH,                                                  '+
               '        (SELECT DISTINCT I.DIVSEQNUM ,I.STLORG ,I.STLDATE ,I.STLEDATE , I.STIRATE        '+
               '	   FROM PSHLBAS I                                                                '+
               '	  WHERE I.DIVSEQNUM = ''5''                                                      '+
               '	    AND I.STLORG = ''10'' ) II                                                   ';

     Query2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;
     QUERY2.Last;
     A3.caption := copy(QUERY2.FieldByName('A_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('A_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('A_3').AsString,7,2);

     A4.caption := copy(QUERY2.FieldByName('A_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('A_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('A_4').AsString,7,2);

     A5.caption := formatfloat('#0.###',QUERY2.FieldByName('A_5').Asfloat);

     B3.caption := copy(QUERY2.FieldByName('B_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('B_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('B_3').AsString,7,2);
     B4.caption := copy(QUERY2.FieldByName('B_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('B_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('B_4').AsString,7,2);
     B5.caption := formatfloat('#0.###',QUERY2.FieldByName('B_5').Asfloat);

     C3.caption := copy(QUERY2.FieldByName('C_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('C_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('C_3').AsString,7,2);
     C4.caption := copy(QUERY2.FieldByName('C_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('C_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('C_4').AsString,7,2);
     C5.caption := formatfloat('#0.###',QUERY2.FieldByName('C_5').Asfloat);

     D3.caption := copy(QUERY2.FieldByName('D_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('D_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('D_3').AsString,7,2);
     D4.caption := copy(QUERY2.FieldByName('D_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('D_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('D_4').AsString,7,2);
     D5.caption := formatfloat('#0.###',QUERY2.FieldByName('D_5').Asfloat);

     E3.caption := copy(QUERY2.FieldByName('E_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('E_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('E_3').AsString,7,2);
     E4.caption := copy(QUERY2.FieldByName('E_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('E_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('E_4').AsString,7,2);
     E5.caption := formatfloat('#0.###',QUERY2.FieldByName('E_5').Asfloat);

     //하은영
     F3.caption := copy(QUERY2.FieldByName('F_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('F_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('F_3').AsString,7,2);
     F4.caption := copy(QUERY2.FieldByName('F_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('F_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('F_4').AsString,7,2);
     F5.caption := formatfloat('#0.###',QUERY2.FieldByName('F_5').Asfloat);


     G3.caption := copy(QUERY2.FieldByName('G_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('G_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('G_3').AsString,7,2);
     G4.caption := copy(QUERY2.FieldByName('G_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('G_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('G_4').AsString,7,2);
     G5.caption := formatfloat('#0.###',QUERY2.FieldByName('G_5').Asfloat);

     H3.caption := copy(QUERY2.FieldByName('H_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('H_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('H_3').AsString,7,2);
     H4.caption := copy(QUERY2.FieldByName('H_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('H_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('H_4').AsString,7,2);
     H5.caption := formatfloat('#0.###',QUERY2.FieldByName('H_5').Asfloat);

     I3.caption := copy(QUERY2.FieldByName('I_3').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('I_3').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('I_3').AsString,7,2);
     I4.caption := copy(QUERY2.FieldByName('I_4').AsString,1,4)+'.'+
                   copy(QUERY2.FieldByName('I_4').AsString,5,2)+'.'+
                   copy(QUERY2.FieldByName('I_4').AsString,7,2);
     I5.caption := formatfloat('#0.###',QUERY2.FieldByName('I_5').Asfloat);


   //-- 차수별 인원수
     SQLSTR := ' SELECT AA.A_6, BB.B_6, CC.C_6, DD.D_6,                    '+
               '        FF.F_6, HH.H_6, JJ.J_6                             '+
               '   FROM ( SELECT COUNT(DISTINCT EMPNO)  A_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''1'' )    AA,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  B_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''2'' )    BB,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  C_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''3'' )    CC,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  D_6                '+
               '            FROM PSDPHIS           )    DD,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  F_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''4'' )    FF,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  H_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''5'' )    HH,                '+
               '        ( SELECT COUNT(DISTINCT EMPNO)  J_6                '+
               '            FROM PSDPHIS                                   '+
               '           WHERE DIVSEQNUM = ''6'' )    JJ                 ';
//=================================================================================//
     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     A6.caption := formatfloat('#,##0',QUERY2.FieldByName('A_6').Asfloat);
     B6.caption := formatfloat('#,##0',QUERY2.FieldByName('B_6').Asfloat);
     C6.caption := formatfloat('#,##0',QUERY2.FieldByName('C_6').Asfloat);
     F6.caption := formatfloat('#,##0',QUERY2.FieldByName('F_6').Asfloat);
     H6.caption := formatfloat('#,##0',QUERY2.FieldByName('H_6').Asfloat);
     J6.caption := formatfloat('#,##0',QUERY2.FieldByName('J_6').Asfloat);
//=================================================================================//
//  1.01  2002.10.02       손종운     인원수 중복 카운트 제외등 요청서 2002-4777호
//=================================================================================//
//     D6.caption := formatfloat('#,##0',QUERY2.FieldByName('A_6').Asfloat
//                                     + QUERY2.FieldByName('B_6').Asfloat
//                                     + QUERY2.FieldByName('C_6').Asfloat);

     D6.caption := formatfloat('#,##0',QUERY2.FieldByName('D_6').Asfloat);
//=================================================================================//

     SQLSTR := 'SELECT DIVSEQNUM, STLORG, COUNT(DISTINCT EMPNO) IN_COUNT '+
               '  FROM PSLMAS                                            '+
     	       ' WHERE CORPNAME   <> ''데이콤''                          '+
     	       '   AND STIRAMT    <> 0                                   '+
     	       ' GROUP BY DIVSEQNUM, STLORG                              ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     for i := 1 to 5 do
          for j := 1 to 2 do
               in_cnt[i,j] := 0;

     while not QUERY2.Eof do
     begin
          i := QUERY2.FieldByName('DIVSEQNUM').AsInteger;

          if (QUERY2.FieldByName('STLORG').AsString = 'ZZ')              or
             ((I=4) and (QUERY2.FieldByName('STLORG').AsString = '81'))  or
             ((I=5) and (QUERY2.FieldByName('STLORG').AsString = '11'))  then
               j := 1
          else
               j := 2;

          in_cnt[i,j] := in_cnt[i,j] + QUERY2.FieldByName('IN_COUNT').AsInteger;

          QUERY2.Next;
     end;

     A8.caption := formatfloat('#,##0',in_cnt[1,1]);

     B8_1.caption := formatfloat('#,##0',in_cnt[2,1]);
     B8_2.caption := formatfloat('#,##0',in_cnt[2,2]);
     B8_3.caption := '0';

     C8_1.caption := formatfloat('#,##0',in_cnt[3,1]);
     C8_2.caption := formatfloat('#,##0',in_cnt[3,2]);
     C8_3.caption := '0';

     F8_1.caption := formatfloat('#,##0',in_cnt[4,1]);
     F8_2.caption := formatfloat('#,##0',in_cnt[4,2]);
     F8_3.caption := '0';

     H8_1.caption := formatfloat('#,##0',in_cnt[5,1]);
     H8_2.caption := formatfloat('#,##0',in_cnt[5,2]);
     H8_3.caption := '0';

     //하은영
     SQLSTR := 'SELECT DIVSEQNUM, COUNT(DISTINCT EMPNO) IN_COUNT '+
               '  FROM PSLMAS                                    '+
               ' WHERE CORPNAME   <> ''데이콤''                  '+
               '   AND STIRAMT    <> 0                           '+
               ' GROUP BY DIVSEQNUM                              ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     while not QUERY2.Eof do
     begin
          if  QUERY2.FieldByName('DIVSEQNUM').AsInteger = 2 then
               B8_3.caption := formatfloat('#,##0',QUERY2.FieldByName('IN_COUNT').AsInteger);

          if  QUERY2.FieldByName('DIVSEQNUM').AsInteger = 3 then
               C8_3.caption := formatfloat('#,##0',QUERY2.FieldByName('IN_COUNT').AsInteger);

          if  QUERY2.FieldByName('DIVSEQNUM').AsInteger = 4 then
               F8_3.caption := formatfloat('#,##0',QUERY2.FieldByName('IN_COUNT').AsInteger);

          if  QUERY2.FieldByName('DIVSEQNUM').AsInteger = 5 then
               H8_3.caption := formatfloat('#,##0',QUERY2.FieldByName('IN_COUNT').AsInteger);

          QUERY2.Next;
     end;

//=================================================================================//
//  1.04  2002.11.20       손종운     기관별 대출자 총계 반영   요청서 2002-6774호
//=================================================================================//
     SQLSTR := 'SELECT DECODE(STLORG, ''ZZ'', ''ZZ'', ''AA'') STLORG, '+
               '       COUNT(DISTINCT EMPNO) D_8                      '+
     	       '  FROM PSLMAS                                         '+
     	       ' WHERE CORPNAME   <> ''데이콤''                       '+
     	       '   AND STIRAMT    <> 0                                '+
     	       ' GROUP BY DECODE(STLORG, ''ZZ'', ''ZZ'', ''AA'')      ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     while not QUERY2.Eof do
     begin
          if  QUERY2.FieldByName('STLORG').AsString = 'ZZ' then
               D8_1.caption := formatfloat('#,##0',QUERY2.FieldByName('D_8').Asfloat)
          else
               D8_2.caption := formatfloat('#,##0',QUERY2.FieldByName('D_8').Asfloat);

          QUERY2.Next;
     end;
//=================================================================================//
     SQLSTR := 'SELECT COUNT(DISTINCT EMPNO) D_8      '+
     	       '  FROM PSLMAS                         '+
     	       ' WHERE CORPNAME   <> ''데이콤''       '+
     	       '   AND STIRAMT    <> 0                ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     D8.caption := formatfloat('#,##0',QUERY2.FieldByName('D_8').Asfloat);

     SQLSTR := '  SELECT AA.A_A, BB.B_A , CC.C_A, DD.D_A, FF.F_A, HH.H_A, JJ.J_A                   '+
               '    FROM (select  COUNT(DISTINCT AA.EMPNO) A_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 1                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) AA,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) B_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 2                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) BB,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) C_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 3                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) CC,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) F_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 4                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) FF,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) H_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 5                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) HH,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) J_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = 6                                                  '+
               '             AND AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) JJ,    '+
               '         (select  COUNT(DISTINCT AA.EMPNO) D_A                                     '+
               '            from (SELECT DIVSEQNUM, empno, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL  '+
               '                    FROM psdphis a                                                 '+
               '                   GROUP BY DIVSEQNUM, empno  ) AA,                                '+
               '                 (select DIVSEQNUM, empno, sum(wdstcnt) wdstcnt                    '+
               '                    from PSowHIS                                                   '+
               '                   where subdate >   ''' + WK_ST_DATE + '''                        '+
               '                   GROUP BY DIVSEQNUM, empno ) BB                                  '+
               '           WHERE AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                    '+
               '             AND AA.empno     = BB.empno(+)                                        '+
               '             AND NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) > 0) DD     ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     A7.caption := formatfloat('#,##0',QUERY2.FieldByName('A_A').Asfloat);
     B7.caption := formatfloat('#,##0',QUERY2.FieldByName('B_A').Asfloat);
     C7.caption := formatfloat('#,##0',QUERY2.FieldByName('C_A').Asfloat);
     F7.caption := formatfloat('#,##0',QUERY2.FieldByName('F_A').Asfloat);
     H7.caption := formatfloat('#,##0',QUERY2.FieldByName('H_A').Asfloat);
     J7.caption := formatfloat('#,##0',QUERY2.FieldByName('J_A').Asfloat);
     D7.caption := formatfloat('#,##0',QUERY2.FieldByName('D_A').Asfloat);

     SQLSTR := 'select a.divseqnum, a.stlorg,                                                         '+
               '       sum(a.stlamt) stlamt, sum(b.excpamt) excpamt, '+
               '       sum(a.stlamt) - sum(b.excpamt)        remamt  '+
               '  from pslmas a,                                                                      '+
               '       (select divseqnum, stlorg, empno, stclass, stldate, stlamt,                    '+
               '               sum(excpamt) excpamt                                                   '+
               '          from psemhis                                                                '+
               '         where nvl(exmdate, '' '') <= ''' + WK_ST_DATE + '''                          '+
               '           and CORPNAME = ''하나로''                                                  '+
               '         group by divseqnum, stlorg, empno, stclass, stldate, stlamt) b               '+
               ' where a.CORPNAME  = ''하나로''                                                       '+
               '   and a.divseqnum = b.divseqnum (+)                                                  '+
               '   and a.stlorg    = b.stlorg (+)                                                     '+
               '   and a.empno     = b.empno (+)                                                      '+
               '   and a.stclass   = b.stclass (+)                                                    '+
               '   and a.stldate   = b.stldate (+)                                                    '+
               '   and a.stlamt    = b.stlamt (+)                                                     '+
               ' group by a.divseqnum, a.stlorg                                                       ';
     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;
     for  i := 1 to 6 do
          for  j := 1 to 3 do
               for  k := 1 to 3 do
                    stl_amt[i,j, k] := 0;

     while not QUERY2.Eof do
     begin
          i := QUERY2.FieldByName('DIVSEQNUM').AsInteger;
          if  (QUERY2.FieldByName('STLORG').AsString = 'ZZ')             or
              ((I=4) and (QUERY2.FieldByName('STLORG').AsString = '81')) or
              ((I=5) and (QUERY2.FieldByName('STLORG').AsString = '11')) then
               j := 1
          else
               j := 2;

          // 차수/기관별 집계
          stl_amt[i, j, 1] := stl_amt[i, j, 1] + round(QUERY2.FieldByName('stlamt').AsFloat/1000000);
          stl_amt[i, j, 2] := stl_amt[i, j, 2] + round(QUERY2.FieldByName('excpamt').AsFloat/1000000);
          stl_amt[i, j, 3] := stl_amt[i, j, 3] + (round(QUERY2.FieldByName('stlamt').AsFloat/1000000) - round(QUERY2.FieldByName('excpamt').AsFloat/1000000)) ;

          // 차수별 소계
          stl_amt[i, 3, 1] := stl_amt[i, 3, 1] + QUERY2.FieldByName('stlamt').AsFloat;
          stl_amt[i, 3, 2] := stl_amt[i, 3, 2] + QUERY2.FieldByName('excpamt').AsFloat;
          stl_amt[i, 3, 3] := stl_amt[i, 3, 3] + QUERY2.FieldByName('stlamt').AsFloat - QUERY2.FieldByName('excpamt').AsFloat ;

          // 총계
          if  (I=4) or (I=5) then //4,5차는 모두 은행임
               j := 2;

          stl_amt[7, j, 1] := stl_amt[7, j, 1] + QUERY2.FieldByName('stlamt').AsFloat;
          stl_amt[7, j, 2] := stl_amt[7, j, 2] + QUERY2.FieldByName('excpamt').AsFloat;
          stl_amt[7, j, 3] := stl_amt[7, j, 3] + QUERY2.FieldByName('stlamt').AsFloat - QUERY2.FieldByName('excpamt').AsFloat ;

          // 총계
          stl_amt[7, 3, 1] := stl_amt[7, 3, 1] + QUERY2.FieldByName('stlamt').AsFloat;
          stl_amt[7, 3, 2] := stl_amt[7, 3, 2] + QUERY2.FieldByName('excpamt').AsFloat;
          stl_amt[7, 3, 3] := stl_amt[7, 3, 3] + QUERY2.FieldByName('stlamt').AsFloat - QUERY2.FieldByName('excpamt').AsFloat ;
          QUERY2.Next;
     end;

     // 1차
     A9.Caption  := formatfloat('###,##0',stl_amt[1, 1, 1]);
     A10.Caption := formatfloat('###,##0',stl_amt[1, 1, 2]);
     A11.Caption := formatfloat('###,##0',stl_amt[1, 1, 3]);

     // 2차
     B9.Caption  := formatfloat('###,##0',stl_amt[2, 1, 1]);
     B10.Caption := formatfloat('###,##0',stl_amt[2, 1, 2]);
     B11.Caption := formatfloat('###,##0',stl_amt[2, 1, 3]);

     B12.Caption := formatfloat('###,##0',stl_amt[2, 2, 1]);
     B13.Caption := formatfloat('###,##0',stl_amt[2, 2, 2]);
     B14.Caption := formatfloat('###,##0',stl_amt[2, 2, 3]);

     B15.Caption := formatfloat('###,##0',round(stl_amt[2, 3, 1]/1000000));
     B16.Caption := formatfloat('###,##0',round(stl_amt[2, 3, 2]/1000000));
     B17.Caption := formatfloat('###,##0',round(stl_amt[2, 3, 1]/1000000)-round(stl_amt[2, 3, 2]/1000000));

     // 3차
     C9.Caption  := formatfloat('###,##0',stl_amt[3, 1, 1]);
     C10.Caption := formatfloat('###,##0',stl_amt[3, 1, 2]);
     C11.Caption := formatfloat('###,##0',stl_amt[3, 1, 3]);

     C12.Caption := formatfloat('###,##0',stl_amt[3, 2, 1]);
     C13.Caption := formatfloat('###,##0',stl_amt[3, 2, 2]);
     C14.Caption := formatfloat('###,##0',stl_amt[3, 2, 3]);

     C15.Caption := formatfloat('###,##0',round(stl_amt[3, 3, 1]/1000000));
     C16.Caption := formatfloat('###,##0',round(stl_amt[3, 3, 2]/1000000));
     C17.Caption := formatfloat('###,##0',round(stl_amt[3, 3, 1]/1000000)-round(stl_amt[3, 3, 2]/1000000));

     // 4차
     F9_1.Caption  := formatfloat('###,##0',stl_amt[4, 1, 1]);
     F11_1.Caption := formatfloat('###,##0',stl_amt[4, 1, 2]);
     F13_1.Caption := formatfloat('###,##0',stl_amt[4, 1, 3]);

     F9_2.Caption  := formatfloat('###,##0',stl_amt[4, 2, 1]);
     F11_2.Caption := formatfloat('###,##0',stl_amt[4, 2, 2]);
     F13_2.Caption := formatfloat('###,##0',stl_amt[4, 2, 3]);

     F9_3.Caption  := formatfloat('###,##0',round(stl_amt[4, 3, 1]/1000000));
     F11_3.Caption := formatfloat('###,##0',round(stl_amt[4, 3, 2]/1000000));
     F13_3.Caption := formatfloat('###,##0',round(stl_amt[4, 3, 1]/1000000)-round(stl_amt[4, 3, 2]/1000000));

     // 5차
     H9_1.Caption  := formatfloat('###,##0',stl_amt[5, 1, 1]);
     H11_1.Caption := formatfloat('###,##0',stl_amt[5, 1, 2]);
     H13_1.Caption := formatfloat('###,##0',stl_amt[5, 1, 3]);

     H9_2.Caption  := formatfloat('###,##0',stl_amt[5, 2, 1]);
     H11_2.Caption := formatfloat('###,##0',stl_amt[5, 2, 2]);
     H13_2.Caption := formatfloat('###,##0',stl_amt[5, 2, 3]);

     H9_3.Caption  := formatfloat('###,##0',round(stl_amt[5, 3, 1]/1000000));
     H11_3.Caption := formatfloat('###,##0',round(stl_amt[5, 3, 2]/1000000));
     H13_3.Caption := formatfloat('###,##0',round(stl_amt[5, 3, 1]/1000000)-round(stl_amt[5, 3, 2]/1000000));

     // 총계
     D9.Caption  := formatfloat('###,##0',round(stl_amt[7, 1, 1]/1000000));
     D10.Caption := formatfloat('###,##0',round(stl_amt[7, 1, 2]/1000000));
     D11.Caption := formatfloat('###,##0',round(stl_amt[7, 1, 1]/1000000)-round(stl_amt[7, 1, 2]/1000000));

     D12.Caption := formatfloat('###,##0',round(stl_amt[7, 2, 1]/1000000));
     D13.Caption := formatfloat('###,##0',round(stl_amt[7, 2, 2]/1000000));
     D14.Caption := formatfloat('###,##0',round(stl_amt[7, 2, 1]/1000000)-round(stl_amt[7, 2, 2]/1000000));

     D15.Caption := formatfloat('###,##0',round(stl_amt[7, 3, 1]/1000000));
     D16.Caption := formatfloat('###,##0',round(stl_amt[7, 3, 2]/1000000));
     D17.Caption := formatfloat('###,##0',round(stl_amt[7, 3, 1]/1000000)-round(stl_amt[7, 3, 2]/1000000));

     SQLSTR := 'select  AA.divseqnum, AA.DPST dpstcnt,  NVL(AA.INCHUL,0)-NVL(BB.wdstcnt,0) wdstcnt,'+
               '         NVL(AA.DPST,0) - NVL(AA.INCHUL,0) + NVL(BB.wdstcnt,0) remcnt              '+
               '  from (SELECT DIVSEQNUM, SUM(A.DPSTCNT) DPST, SUM(WRCNT) INCHUL                   '+
               '          FROM psdphis a                                                           '+
               '         GROUP BY DIVSEQNUM  ) AA,                                                 '+
               '       (select DIVSEQNUM, sum(wdstcnt) wdstcnt                                     '+
               '          from PSowHIS                                                             '+
               '         where subdate >   ''' + WK_ST_DATE + '''                                  '+
               '         GROUP BY DIVSEQNUM ) BB                                                   '+
               '  WHERE AA.DIVSEQNUM = BB.DIVSEQNUM(+)                                             ';

     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;
     for  i := 1 to 7 do
          for  j := 1 to 3 do
               for  k := 1 to 3 do
                    stl_amt[i,j, k] := 0;

     while not QUERY2.Eof do
     begin
          i := QUERY2.FieldByName('DIVSEQNUM').AsInteger;
          j := 1;

          // 차수별 집계
          stl_amt[i, j, 1] := stl_amt[i, j, 1] + QUERY2.FieldByName('dpstcnt').AsFloat;
          stl_amt[i, j, 2] := stl_amt[i, j, 2] + QUERY2.FieldByName('wdstcnt').AsFloat;
          stl_amt[i, j, 3] := stl_amt[i, j, 3] + QUERY2.FieldByName('remcnt').AsFloat;

          // 총계
          stl_amt[7, j, 1] := stl_amt[7, j, 1] + QUERY2.FieldByName('dpstcnt').AsFloat;
          stl_amt[7, j, 2] := stl_amt[7, j, 2] + QUERY2.FieldByName('wdstcnt').AsFloat;
          stl_amt[7, j, 3] := stl_amt[7, j, 3] + QUERY2.FieldByName('remcnt').AsFloat;
          QUERY2.Next;
     end;
     A18.caption := formatfloat('###,##0',stl_amt[1, 1, 1]);
     A19.caption := formatfloat('###,##0',stl_amt[1, 1, 2]);
     A20.caption := formatfloat('###,##0',stl_amt[1, 1, 3]);

     B18.caption := formatfloat('###,##0',stl_amt[2, 1, 1]);
     B19.caption := formatfloat('###,##0',stl_amt[2, 1, 2]);
     B20.caption := formatfloat('###,##0',stl_amt[2, 1, 3]);

     C18.caption := formatfloat('###,##0',stl_amt[3, 1, 1]);
     C19.caption := formatfloat('###,##0',stl_amt[3, 1, 2]);
     C20.caption := formatfloat('###,##0',stl_amt[3, 1, 3]);

     F10.caption := formatfloat('###,##0',stl_amt[4, 1, 1]);
     F12.caption := formatfloat('###,##0',stl_amt[4, 1, 2]);
     F14.caption := formatfloat('###,##0',stl_amt[4, 1, 3]);

     H10.caption := formatfloat('###,##0',stl_amt[5, 1, 1]);
     H12.caption := formatfloat('###,##0',stl_amt[5, 1, 2]);
     H14.caption := formatfloat('###,##0',stl_amt[5, 1, 3]);

     J18.caption := formatfloat('###,##0',stl_amt[6, 1, 1]);
     J19.caption := formatfloat('###,##0',stl_amt[6, 1, 2]);
     J20.caption := formatfloat('###,##0',stl_amt[6, 1, 3]);

     D18.caption := formatfloat('###,##0',stl_amt[7, 1, 1]);
     D19.caption := formatfloat('###,##0',stl_amt[7, 1, 2]);
     D20.caption := formatfloat('###,##0',stl_amt[7, 1, 3]);

//=================================================================================//

   //-- 취득가
     sqlstr := 'SELECT AA.A_21, BB.B_21, CC.C_21, DD.D_21,           '+
               '       EE.E_21, JJ.J_21                              '+
     	       '  FROM ( SELECT ISSUEAMT A_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''1'' ) AA,              '+
     	       '       ( SELECT ISSUEAMT B_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''2'' ) BB,              '+
     	       '       ( SELECT ISSUEAMT C_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''3'' ) CC,              '+
     	       '       ( SELECT ISSUEAMT D_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''4'' ) DD,              '+
     	       '       ( SELECT ISSUEAMT E_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''5'' ) EE,              '+
     	       '       ( SELECT ISSUEAMT J_21                        '+
               '           FROM PSHSBAS                              '+
               '          WHERE DIVSEQNUM = ''6'' ) JJ               ';
     QUERY2.Close;
     QUERY2.Sql.Clear;
     QUERY2.Sql.Add(sqlstr);
     QUERY2.Open;

     A21.caption         := formatfloat('###,##0',QUERY2.FieldByName('A_21').Asfloat);
     B21.caption         := formatfloat('###,##0',QUERY2.FieldByName('B_21').Asfloat);
     B22.caption         := formatfloat('###,##0',QUERY2.FieldByName('B_21').Asfloat);
     C21.caption         := formatfloat('###,##0',QUERY2.FieldByName('C_21').Asfloat);
     C22.caption         := formatfloat('###,##0',QUERY2.FieldByName('C_21').Asfloat);
     F15_1.caption       := formatfloat('###,##0',QUERY2.FieldByName('D_21').Asfloat);
     F15_2.caption       := formatfloat('###,##0',QUERY2.FieldByName('D_21').Asfloat);
     H15_1.caption       := formatfloat('###,##0',QUERY2.FieldByName('E_21').Asfloat);
     H15_2.caption       := formatfloat('###,##0',QUERY2.FieldByName('E_21').Asfloat);
     J21.caption         := formatfloat('###,##0',QUERY2.FieldByName('J_21').Asfloat);

     Q_SKBBjusic.caption :=  formatfloat('###,##0',SKBBjusic);
     Q_sajurate.caption  :=  formatfloat('##0.##',stl_amt[7, 1, 3]/SKBBjusic*100)+'%';
end;


end.
