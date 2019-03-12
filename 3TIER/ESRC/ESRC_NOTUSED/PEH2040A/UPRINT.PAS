unit UPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, Tmax_DataSetText;

type
  TQuickReport1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QR_Rabasyy: TQRLabel;
    QRShape10: TQRShape;
    QRBand2: TQRBand;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRBand3: TQRBand;
    QRShape34: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel24: TQRLabel;
    QRShape39: TQRShape;
    QRLabel25: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel26: TQRLabel;
    QRShape42: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QR_empno: TQRLabel;
    QR_korname: TQRLabel;
    QR_payraname: TQRLabel;
    QR_deptname: TQRLabel;
    QR_e1empno: TQRLabel;
    QR_e1korname: TQRLabel;
    QR_e1payraname: TQRLabel;
    QR_e1deptname: TQRLabel;
    Q_data: TTMaxDataSet;
    QRBand4: TQRBand;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel9: TQRLabel;
    QRShape25: TQRShape;
    QRLabel15: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape11: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    Constraint: TQRLabel;
    QRShape49: TQRShape;
    QRLabel27: TQRLabel;
    QRShape50: TQRShape;
    QRLabel28: TQRLabel;
    QRShape51: TQRShape;
    QRLabel29: TQRLabel;
    QRShape52: TQRShape;
    QRLabel30: TQRLabel;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel38: TQRLabel;
    QR_SEQNO: TQRLabel;
    QRShape53: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape54: TQRShape;
    Integrity: TQRLabel;
    QRShape47: TQRShape;
    Accountability: TQRLabel;
    QRShape48: TQRShape;
    QRShape23: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRDBText5: TQRDBText;
    QR_RValue11: TQRMemo;
    QR_RValue13: TQRMemo;
    QR_RValue21: TQRMemo;
    QR_RValue23: TQRMemo;
    QR_RValue31: TQRMemo;
    QR_RValue33: TQRMemo;
    QR_RValue41: TQRMemo;
    QR_RValue51: TQRMemo;
    QR_RValue53: TQRMemo;
    QR_EValue12: TQRMemo;
    QR_EValue14: TQRMemo;
    QR_EValue22: TQRMemo;
    QR_EValue24: TQRMemo;
    QR_EValue32: TQRMemo;
    QR_EValue34: TQRMemo;
    QR_EValue42: TQRMemo;
    QR_EValue52: TQRMemo;
    QR_EValue54: TQRMemo;
    QRLabel12: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses PEH2040A1;

{$R *.DFM}

procedure TQuickReport1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  SqlText : String;
begin
  with Q_Data do
  begin
    SqlText := Format('select '' 업  적 공동목표'' gubun,           '+
                      '       TASKname, MAINWEIGHT,                 '+
                      ' DECODE('''+FM_Main.sSEQNO+''', ''1'',       '+
                      ' RMIDPERVIEW1, RMIDPERVIEW2) RMIDPERVIEW,    '+
                      ' DECODE('''+FM_Main.sSEQNO+''', ''1'',       '+
                      ' E1MIDPERVIEW1, E1MIDPERVIEW2) E1MIDPERVIEW  '+
                      '  from pehreaim_basdet                       '+
                      ' where rabasdate = ''%s''                    '+
                      '   and empno     = ''%s''                    '+
                      'union all                                    '+
                      'select '' 업  적 개인목표'' gubun,           '+
                      '       PROPELTASK, MAINWEIGHT,               '+
                      ' DECODE('''+FM_Main.sSEQNO+''', ''1'',       '+
                      ' RMIDPERVIEW1, RMIDPERVIEW2) RMIDPERVIEW,    '+
                      ' DECODE('''+FM_Main.sSEQNO+''', ''1'',       '+
                      ' E1MIDPERVIEW1, E1MIDPERVIEW2) E1MIDPERVIEW  '+
                      '  from pehreaim_det                          '+
                      ' where rabasdate = ''%s''                    '+
                      '   and empno     = ''%s''                    ',
                      [FM_Main.sRabasdate,FM_Main.Ed_empno.Text,FM_Main.sRabasdate,FM_Main.Ed_empno.Text]);
    Close;
    ServiceName := 'HINSA_select2';
    ClearFieldInfo;
    AddField('GUBUN'       ,ftString, 400);
    AddField('TASKNAME'    ,ftString, 400);
    AddField('MAINWEIGHT'  ,ftString, 400);
    AddField('RMIDPERVIEW' ,ftString, 400);
    AddField('E1MIDPERVIEW',ftString, 400);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
end;

procedure TQuickReport1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Rabasyy.Caption   := copy(FM_Main.sRabasdate,1,4)+'년';
  QR_empno.Caption     := FM_Main.Ed_empno.Text;
  QR_korname.Caption   := FM_Main.L_korname.ValueCaption;
  QR_payraname.Caption := FM_Main.L_payraname.ValueCaption;
  QR_deptname.Caption  := FM_Main.L_deptname.ValueCaption;
  QR_SEQNO.Caption     := FM_Main.E_SEQNO.Text;

  QR_RValue11.Lines.Clear;
  QR_RValue13.Lines.Clear;
  QR_RValue21.Lines.Clear;
  QR_RValue23.Lines.Clear;
  QR_RValue31.Lines.Clear;
  QR_RValue33.Lines.Clear;
  QR_RValue41.Lines.Clear;
  QR_RValue51.Lines.Clear;
  QR_RValue53.Lines.Clear;
  QR_EValue12.Lines.Clear;
  QR_EValue14.Lines.Clear;
  QR_EValue22.Lines.Clear;
  QR_EValue24.Lines.Clear;
  QR_EValue32.Lines.Clear;
  QR_EValue34.Lines.Clear;
  QR_EValue42.Lines.Clear;
  QR_EValue52.Lines.Clear;
  QR_EValue54.Lines.Clear;

  QR_RValue11.Lines.Add(FM_Main.OM_RValue11.Text);
  QR_RValue13.Lines.Add(FM_Main.OM_RValue13.Text);
  QR_RValue21.Lines.Add(FM_Main.OM_RValue21.Text);
  QR_RValue23.Lines.Add(FM_Main.OM_RValue23.Text);
  QR_RValue31.Lines.Add(FM_Main.OM_RValue31.Text);
  QR_RValue33.Lines.Add(FM_Main.OM_RValue33.Text);
  QR_RValue41.Lines.Add(FM_Main.OM_RValue41.Text);
  QR_RValue51.Lines.Add(FM_Main.OM_RValue51.Text);
  QR_RValue53.Lines.Add(FM_Main.OM_RValue53.Text);
  QR_EValue12.Lines.Add(FM_Main.OM_EValue12.Text);
  QR_EValue14.Lines.Add(FM_Main.OM_EValue14.Text);
  QR_EValue22.Lines.Add(FM_Main.OM_EValue22.Text);
  QR_EValue24.Lines.Add(FM_Main.OM_EValue24.Text);
  QR_EValue32.Lines.Add(FM_Main.OM_EValue32.Text);
  QR_EValue34.Lines.Add(FM_Main.OM_EValue34.Text);
  QR_EValue42.Lines.Add(FM_Main.OM_EValue42.Text);
  QR_EValue52.Lines.Add(FM_Main.OM_EValue52.Text);
  QR_EValue54.Lines.Add(FM_Main.OM_EValue54.Text);
  
  IF FM_Main.OM_RValue11.Lines.Count > 3 then QR_RValue11.Font.Size := 7 Else QR_RValue11.Font.Size := 9;
  IF FM_Main.OM_RValue13.Lines.Count > 3 then QR_RValue13.Font.Size := 7 Else QR_RValue13.Font.Size := 9;
  IF FM_Main.OM_RValue21.Lines.Count > 3 then QR_RValue21.Font.Size := 7 Else QR_RValue21.Font.Size := 9;
  IF FM_Main.OM_RValue23.Lines.Count > 3 then QR_RValue23.Font.Size := 7 Else QR_RValue23.Font.Size := 9;
  IF FM_Main.OM_RValue31.Lines.Count > 3 then QR_RValue31.Font.Size := 7 Else QR_RValue31.Font.Size := 9;
  IF FM_Main.OM_RValue33.Lines.Count > 3 then QR_RValue33.Font.Size := 7 Else QR_RValue33.Font.Size := 9;
  IF FM_Main.OM_RValue41.Lines.Count > 3 then QR_RValue41.Font.Size := 7 Else QR_RValue41.Font.Size := 9;
  IF FM_Main.OM_RValue51.Lines.Count > 3 then QR_RValue51.Font.Size := 7 Else QR_RValue51.Font.Size := 9;
  IF FM_Main.OM_RValue53.Lines.Count > 3 then QR_RValue53.Font.Size := 7 Else QR_RValue53.Font.Size := 9;
  IF FM_Main.OM_EValue12.Lines.Count > 3 then QR_EValue12.Font.Size := 7 Else QR_EValue12.Font.Size := 9;
  IF FM_Main.OM_EValue14.Lines.Count > 3 then QR_EValue14.Font.Size := 7 Else QR_EValue14.Font.Size := 9;
  IF FM_Main.OM_EValue22.Lines.Count > 3 then QR_EValue22.Font.Size := 7 Else QR_EValue22.Font.Size := 9;
  IF FM_Main.OM_EValue24.Lines.Count > 3 then QR_EValue24.Font.Size := 7 Else QR_EValue24.Font.Size := 9;
  IF FM_Main.OM_EValue32.Lines.Count > 3 then QR_EValue32.Font.Size := 7 Else QR_EValue32.Font.Size := 9;
  IF FM_Main.OM_EValue34.Lines.Count > 3 then QR_EValue34.Font.Size := 7 Else QR_EValue34.Font.Size := 9;
  IF FM_Main.OM_EValue42.Lines.Count > 3 then QR_EValue42.Font.Size := 7 Else QR_EValue42.Font.Size := 9;
  IF FM_Main.OM_EValue52.Lines.Count > 3 then QR_EValue52.Font.Size := 7 Else QR_EValue52.Font.Size := 9;
  IF FM_Main.OM_EValue54.Lines.Count > 3 then QR_EValue54.Font.Size := 7 Else QR_EValue54.Font.Size := 9;
end;

procedure TQuickReport1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var  SqlText : String;
begin
  with FM_Main.TDS do
  begin
    SqlText := Format('select empno, e1empno, e1korname,                                        '+
                      '       (select codename from pyccode                                     '+
                      '         where codeid = ''I113'' and codeno = e1payra) e1payraname,      '+
                      '	    (select deptname from pycdept                                     '+
                      '         where orgnum = a.e1orgnum and deptcode = e1deptcode) e1deptname '+
                      '  from pehremas a                                                        '+
                      ' where rabasdate = ''%s''                                                '+
                      '   and empno     = ''%s''                                                ',
                      [FM_Main.sRabasdate,FM_Main.Ed_empno.Text]);
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('EMPNO'        , ftString, 100);
    AddField('E1EMPNO'      , ftString, 100);
    AddField('E1KORNAME'    , ftString, 100);
    AddField('E1PAYRANAME'  , ftString, 100);
    AddField('E1DEPTNAME'   , ftString, 100);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
    if  FM_Main.TDS.Eof then
    begin
      QR_e1empno.Caption     := '';
      QR_e1korname.Caption   := '';
      QR_e1payraname.Caption := '';
      QR_e1deptname.Caption  := '';
    end
    else
    begin
      QR_e1empno.Caption     := FieldbyName('E1empno').AsString;
      QR_e1korname.Caption   := FieldbyName('E1KORNAME').AsString;
      QR_e1payraname.Caption := FieldbyName('E1PAYRANAME').AsString;
      QR_e1deptname.Caption  := FieldbyName('E1DEPTNAME').AsString;
    end;
  end;
end;

end.
