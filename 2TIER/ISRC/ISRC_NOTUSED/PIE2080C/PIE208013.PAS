unit pie208013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, peprnview;

type
  TFpie208013 = class(TForm)
    QuickReport1: TQuickRep;
    QRLyear: TQRLabel;
    Query1: TQuery;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRL0: TQRLabel;
    QRL3_M: TQRLabel;
    QRL4_M: TQRLabel;
    QRL5_M: TQRLabel;
    QRL7: TQRLabel;
    QRL2_M: TQRLabel;
    QRL1_M: TQRLabel;
    QRL8: TQRLabel;
    QRShape10: TQRShape;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape33: TQRShape;
    QRShape37: TQRShape;
    QRShape36: TQRShape;
    QRL6_M: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape9: TQRShape;
    QRL6_F: TQRLabel;
    QRL5_F: TQRLabel;
    QRL4_F: TQRLabel;
    QRL3_F: TQRLabel;
    QRL2_F: TQRLabel;
    QRL1_F: TQRLabel;
    QRShape16: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand4: TQRBand;
    QRShape7: TQRShape;
    QRBand2: TQRBand;
    QRShape15: TQRShape;
    QRShape54: TQRShape;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs3: TQRLabel;
    QRLs4: TQRLabel;
    QRLs5: TQRLabel;
    QRLs7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape1: TQRShape;
    QRLs8: TQRLabel;
    QRShape21: TQRShape;
    QRLs6: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure DataDisp1;
    procedure DataDisp2;
    procedure DataDisp3;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpie208013: TFpie208013;
  Fm_PreviewForm: TFm_PreviewForm;
  PrtCount : integer;
implementation

uses E2080c;

{$R *.DFM}

procedure TFpie208013.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if (trim(Fpie2080c.Mfrym.Text) < Fpie2080c.payrachym) and
     (trim(Fpie2080c.Mtoym.Text) < Fpie2080c.payrachym) then
  begin
       DataDisp1;
  end
  else
  if (trim(Fpie2080c.Mfrym.Text) <  Fpie2080c.payrachym) and
     (trim(Fpie2080c.Mtoym.Text) >= Fpie2080c.payrachym) then
  begin
       DataDisp2;
  end
  else
  begin
       DataDisp3;
  end;
end;

procedure TFpie208013.DataDisp1;
begin
  PrtCount:=0;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(decode(c.sex, ''M'',decode(A.paycl,''10'',1), 1, 0)) 부장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''10'',1), 1, 0)) 부장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''20'',1), 1, 0)) 차장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''20'',1), 1, 0)) 차장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''22'',1), 1, 0)) 과장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''22'',1), 1, 0)) 과장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''32'',1), 1, 0)) 대리_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''32'',1), 1, 0)) 대리_F,           '+
            '       count(decode(c.sex, ''M'',decode(substr(A.paycl,1,1),''4'',1), 1, 0)) 사원_M,'+
            '       count(decode(c.sex, ''F'',decode(substr(A.paycl,1,1),''4'',1), 1, 0)) 사원_F,'+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''93'',1), 1, 0))  특정_M,          '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''93'',1), 1, 0))  특정_F,          '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''10'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''20'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''22'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''32'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(substr(A.paycl,1,1),''4'',1), 1, 0))  +     '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''93'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''10'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''20'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''22'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''32'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(substr(A.paycl,1,1),''4'',1), 1, 0))  +     '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''93'',1), 1, 0)) 소계,             '+
            '       ''100'' 비율                                       '+
            '  from pihanno A, pyccode B, pimpmas C                    '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')    '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)     '+
            '   and A.empno = C.empno                                  '+
            '   and C.empno not like ''I%''                                    '+ //2012.03.02 인턴직 제외 HeeYong
            '   and (A.paycl >= ''10'' and A.paycl <= ''93'' )         ');

    if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add('and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))');

    SQL.Add( 'and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                         ''' and '''+Fpie2080c.Mtoym.Text +'''');
    Open;

    QRLs1.Caption := IntToStr(FieldByName('부장_M').AsInteger + FieldByName('부장_F').AsInteger);
    QRLs2.Caption := IntToStr(FieldByName('차장_M').AsInteger + FieldByName('차장_F').AsInteger);
    QRLs3.Caption := IntToStr(FieldByName('과장_M').AsInteger + FieldByName('과장_F').AsInteger);
    QRLs4.Caption := IntToStr(FieldByName('대리_M').AsInteger + FieldByName('대리_F').AsInteger);
    QRLs5.Caption := IntToStr(FieldByName('사원_M').AsInteger + FieldByName('사원_F').AsInteger);
    QRLs6.Caption := IntToStr(FieldByName('특정_M').AsInteger + FieldByName('특정_F').AsInteger);
    QRLs7.Caption := FieldByName('소계').AsString;
    QRLs8.Caption := FieldByName('비율').AsString;

    Close;
    SQL.Clear;
    SQL.Add('select B.codename  gubun,                                  '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''10'',1), 1, 0)) 부장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''10'',1), 1, 0)) 부장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''20'',1), 1, 0)) 차장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''20'',1), 1, 0)) 차장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''22'',1), 1, 0)) 과장_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''22'',1), 1, 0)) 과장_F,           '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''32'',1), 1, 0)) 대리_M,           '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''32'',1), 1, 0)) 대리_F,           '+
            '       count(decode(c.sex, ''M'',decode(substr(A.paycl,1,1),''4'',1), 1, 0)) 사원_M,'+
            '       count(decode(c.sex, ''F'',decode(substr(A.paycl,1,1),''4'',1), 1, 0)) 사원_F,'+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''93'',1), 1, 0))  특정_M,          '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''93'',1), 1, 0))  특정_F,          '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''10'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''20'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''22'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''32'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''M'',decode(substr(A.paycl,1,1),''4'',1), 1, 0))  +     '+
            '       count(decode(c.sex, ''M'',decode(A.paycl,''93'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''10'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''20'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''22'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''32'',1), 1, 0))  +                '+
            '       count(decode(c.sex, ''F'',decode(substr(A.paycl,1,1),''4'',1), 1, 0))  +     '+
            '       count(decode(c.sex, ''F'',decode(A.paycl,''93'',1), 1, 0)) 소계,             '+
            '       ''100'' 비율                                       '+
            '  from pihanno A, pyccode B, pimpmas C                    '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')   '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)     '+
            '   and A.empno = C.empno                                  '+
            '   and C.empno not like ''I%''                            '+ //2012.03.02 인턴직 제외 HeeYong
            '   and (A.paycl >= ''10'' and A.paycl <= ''93'' )         ');

   if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add('and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))');
    SQL.Add('  and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                           ''' and '''+Fpie2080c.Mtoym.Text +''''+
            'group by B.codename                                         ');

    Open;
  end;
end;

procedure TFpie208013.DataDisp2;
begin
  PrtCount:=0;
  with Query1 do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select count(decode(c.sex, ''M'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) 부장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) 부장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) 차장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) 차장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) 과장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) 과장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) 대리_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) 대리_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,1),''4'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 사원_M, '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,1),''4'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 사원_F, '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''93'',1,''D41'',1), 1, 0)) 특정_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''93'',1,''D41'',1), 1, 0)) 특정_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,1),''4'',1), 1, 0)) +                                            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''93'',1,''D41'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) +        '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,1),''4'',1), 1, 0)) +                                            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''93'',1,''D41'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 소계,    '+
            '       ''100'' 비율                                               '+
            '  from pihanno A, pyccode B, pimpmas C                            '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')      '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)             '+
            '   and A.empno = C.empno                                          '+
            '   and C.empno not like ''I%''                                    '+ //2012.03.02 인턴직 제외 HeeYong
            '   and ((A.paycl >= ''10'' and A.paycl <= ''93'' )                '+
            '       or (A.paycl >= ''C11'' and A.paycl <= ''D41'' ))           ');

    if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add(' and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))              ');

    SQL.Add('   and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                         ''' and '''+Fpie2080c.Mtoym.Text +'''                ');
    Open;

    QRLs1.Caption := IntToStr(FieldByName('부장_M').AsInteger + FieldByName('부장_F').AsInteger);
    QRLs2.Caption := IntToStr(FieldByName('차장_M').AsInteger + FieldByName('차장_F').AsInteger);
    QRLs3.Caption := IntToStr(FieldByName('과장_M').AsInteger + FieldByName('과장_F').AsInteger);
    QRLs4.Caption := IntToStr(FieldByName('대리_M').AsInteger + FieldByName('대리_F').AsInteger);
    QRLs5.Caption := IntToStr(FieldByName('사원_M').AsInteger + FieldByName('사원_F').AsInteger);
    QRLs6.Caption := IntToStr(FieldByName('특정_M').AsInteger + FieldByName('특정_F').AsInteger);
    QRLs7.Caption := FieldByName('소계').AsString;
    QRLs8.Caption := FieldByName('비율').AsString;

    Close;
    SQL.Clear;
    SQL.Add('select B.codename  gubun, '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) 부장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) 부장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) 차장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) 차장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) 과장_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) 과장_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) 대리_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) 대리_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,1),''4'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 사원_M, '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,1),''4'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 사원_F, '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''93'',1,''D41'',1), 1, 0)) 특정_M,                                       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''93'',1,''D41'',1), 1, 0)) 특정_F,                                       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,1),''4'',1), 1, 0)) +                                            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''93'',1,''D41'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) +        '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''10'',1,''C11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''20'',1,''C21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''22'',1,''D11'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''32'',1,''D21'',1), 1, 0)) +                                             '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,1),''4'',1), 1, 0)) +                                            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''93'',1,''D41'',1,decode(substr(A.paycl,1,2),''D3'',1)), 1, 0)) 소계     '+
            '  from pihanno A, pyccode B, pimpmas C                            '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')      '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)             '+
            '   and A.empno = C.empno                                          '+
            '   and C.empno not like ''I%''                                    '+ //2012.03.02 인턴직 제외 HeeYong
            '   and ((A.paycl >= ''10'' and A.paycl <= ''93'' )                '+
            '       or (A.paycl >= ''C11'' and A.paycl <= ''D41'' ))           ');

   if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add('and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))                ');
    SQL.Add('  and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                           ''' and '''+Fpie2080c.Mtoym.Text +'''               '+
            'group by B.codename                                                               ');

    Open;
  end;
end;

procedure TFpie208013.DataDisp3;
begin
  PrtCount:=0;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(decode(c.sex, ''M'', decode(A.paycl,''C11'',1), 1, 0)) 부장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C11'',1), 1, 0)) 부장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C21'',1), 1, 0)) 차장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C21'',1), 1, 0)) 차장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D11'',1), 1, 0)) 과장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D11'',1), 1, 0)) 과장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D21'',1), 1, 0)) 대리_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D21'',1), 1, 0)) 대리_F,            '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) 사원_M, '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) 사원_F, '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D41'',1), 1, 0)) 특정_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D41'',1), 1, 0)) 특정_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) +       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D41'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) +       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D41'',1), 1, 0)) 소계,              '+
            '       ''100'' 비율                                               '+
            '  from pihanno A, pyccode B, pimpmas C                            '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')      '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)             '+
            '   and A.empno = C.empno                                          '+
            '   and C.empno not like ''I%''                                    '+ //2012.03.02 인턴직 제외 HeeYong
            '   and (A.paycl >= ''C11'' and A.paycl <= ''D41'' )               ');

    if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add('and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))');

    SQL.Add( 'and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                         ''' and '''+Fpie2080c.Mtoym.Text +'''');
    Open;

    QRLs1.Caption := IntToStr(FieldByName('부장_M').AsInteger + FieldByName('부장_F').AsInteger);
    QRLs2.Caption := IntToStr(FieldByName('차장_M').AsInteger + FieldByName('차장_F').AsInteger);
    QRLs3.Caption := IntToStr(FieldByName('과장_M').AsInteger + FieldByName('과장_F').AsInteger);
    QRLs4.Caption := IntToStr(FieldByName('대리_M').AsInteger + FieldByName('대리_F').AsInteger);
    QRLs5.Caption := IntToStr(FieldByName('사원_M').AsInteger + FieldByName('사원_F').AsInteger);
    QRLs6.Caption := IntToStr(FieldByName('특정_M').AsInteger + FieldByName('특정_F').AsInteger);
    QRLs7.Caption := FieldByName('소계').AsString;
    QRLs8.Caption := FieldByName('비율').AsString;

    Close;
    SQL.Clear;
    SQL.Add('select B.codename  gubun,                                           '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C11'',1), 1, 0)) 부장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C11'',1), 1, 0)) 부장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C21'',1), 1, 0)) 차장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C21'',1), 1, 0)) 차장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D11'',1), 1, 0)) 과장_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D11'',1), 1, 0)) 과장_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D21'',1), 1, 0)) 대리_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D21'',1), 1, 0)) 대리_F,            '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) 사원_M, '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) 사원_F, '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D41'',1), 1, 0)) 특정_M,            '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D41'',1), 1, 0)) 특정_F,            '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''C21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''M'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) +       '+
            '       count(decode(c.sex, ''M'', decode(A.paycl,''D41'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''C21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D11'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D21'',1), 1, 0)) +                  '+
            '       count(decode(c.sex, ''F'', decode(substr(A.paycl,1,2),''D3'',1), 1, 0)) +       '+
            '       count(decode(c.sex, ''F'', decode(A.paycl,''D41'',1), 1, 0)) 소계,              '+
            '       ''100'' 비율                                               '+
            '  from pihanno A, pyccode B, pimpmas C                            '+
            ' where A.ancode in (''819'',''829'',''839'',''849'',''619'')      '+
            '   and (B.codeid =''I141'' and B.codeno = A.retsayu2)             '+
            '   and A.empno = C.empno                                          '+
            '   and C.empno not like ''I%''                                    '+ //2012.03.02 인턴직 제외 HeeYong
            '   and (A.paycl >= ''C11'' and A.paycl <= ''D41'' )               ');

   if Fpie2080c.RGdangYN.ItemIndex <> 0 then
      SQL.Add(' and (A.ancode <> ''819'' or (NVL(A.andetcode,''ZZ'') <> ''92''))');
      SQL.Add(' and substr(A.anfrdate,1,6) between '''+Fpie2080c.Mfrym.Text +
                                           ''' and '''+Fpie2080c.Mtoym.Text +''''+
            'group by B.codename                                         ');

    Open;
  end;
end;

procedure TFpie208013.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ymd : String;
begin
  ymd := Fpie2080c.L_CurDate.Caption;
  QRLabel3.Caption := '작성일자 : '+Copy(ymd,1,4)+'/'+Copy(ymd,6,2)+'/'+Copy(ymd,9,2);
  QRLabel1.Caption := '[작업년월] : '+Copy(Fpie2080c.Mfrym.Text,1,4)+'년 '+Copy(Fpie2080c.Mfrym.Text,5,2)+'월'
                          +' ~ '+Copy(Fpie2080c.Mtoym.Text,1,4)+'년 '+Copy(Fpie2080c.Mtoym.Text,5,2)+'월';
  if trim(Fpie2080c.Mtoym.Text) < Fpie2080c.payrachym then
  begin
    QRLabel24.Caption := '부장';
    QRLabel25.Caption := '차장';
    QRLabel26.Caption := '과장';
    QRLabel27.Caption := '대리';
    QRLabel5.Caption  := '사원';
    QRLabel29.Caption := '특정';
  end
  else
  begin
    QRLabel24.Caption := 'L2';
    QRLabel25.Caption := 'L1';
    QRLabel26.Caption := 'G4';
    QRLabel27.Caption := 'G3';
    QRLabel5.Caption  := 'G2';
    QRLabel29.Caption := 'P' ;
  end;
end;

procedure TFpie208013.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Query1 do
  begin

    QRL0.Caption := FieldByName('gubun').AsString;
    QRL1_M.Caption := FieldByName('부장_M').AsString;
    QRL2_M.Caption := FieldByName('차장_M').AsString;
    QRL3_M.Caption := FieldByName('과장_M').AsString;
    QRL4_M.Caption := FieldByName('대리_M').AsString;
    QRL5_M.Caption := FieldByName('사원_M').AsString;
    QRL6_M.Caption := FieldByName('특정_M').AsString;
    QRL1_F.Caption := FieldByName('부장_F').AsString;
    QRL2_F.Caption := FieldByName('차장_F').AsString;
    QRL3_F.Caption := FieldByName('과장_F').AsString;
    QRL4_F.Caption := FieldByName('대리_F').AsString;
    QRL5_F.Caption := FieldByName('사원_F').AsString;
    QRL6_F.Caption := FieldByName('특정_F').AsString;
    QRL7.Caption := FieldByName('소계').AsString;
    QRL8.Caption := FloatToStr((Round(StrToInt(QRL7.Caption)/StrToInt(QRLs7.Caption)*1000)/1000)*100);

    Inc(PrtCount);
    Fpie2080c.gauge1.Progress := (PrtCount * 100) div RecordCount;
    if (PrtCount >= RecordCount) then
       Fpie2080c.gauge1.Progress := 100;
  end;
end;

procedure TFpie208013.QuickReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
  Fm_PreviewForm.Show;
end;

end.
