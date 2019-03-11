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
    QRShape32: TQRShape;
    QRShape33: TQRShape;
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
    QR_MIDTOTVIEW: TQRMemo;
    QR_e1empno: TQRLabel;
    QR_e1korname: TQRLabel;
    QR_e1payraname: TQRLabel;
    QR_e1deptname: TQRLabel;
    Q_data: TTMaxDataSet;
    QRBand4: TQRBand;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRLabel13: TQRLabel;
    QRShape21: TQRShape;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel9: TQRLabel;
    QRShape25: TQRShape;
    QRLabel15: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRLabel19: TQRLabel;
    QRShape30: TQRShape;
    QRLabel20: TQRLabel;
    QRShape31: TQRShape;
    QR_MIDVALVIEW: TQRMemo;
    QR_MIDCOMVIEW: TQRMemo;
    QRShape11: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRMemo1: TQRMemo;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses PEH1030A1, PePrnview;

{$R *.DFM}

procedure TQuickReport1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  SqlText : String;
begin
     with Q_Data do
     begin
          SqlText := Format('select '' 업  적 공동목표'' gubun, taskcode, TASKname, '+
                            '       MAINWEIGHT, E1MIDPERVIEW1                        '+
                            '  from pehreaim_basdet                                 '+
                            ' where rabasdate = ''%s''                              '+
                            '   and empno     = ''%s''                              '+
                            'union all                                              '+
                            'select '' 업  적 개인목표'' gubun, SEQNO,  PROPELTASK, '+
                            '       MAINWEIGHT, E1MIDPERVIEW1                        '+
                            '  from pehreaim_det                                    '+
                            ' where rabasdate = ''%s''                              '+
                            '   and empno     = ''%s''                              ',
                            [FM_Main.sRabasdate,FM_Main.Ed_empno.Text,FM_Main.sRabasdate,FM_Main.Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('GUBUN'         , ftString, 400);
          AddField('TASKCODE'      , ftString, 400);
          AddField('TASKNAME'      , ftString, 400);
          AddField('MAINWEIGHT'    , ftString, 400);
          AddField('E1MIDPERVIEW1' , ftString, 400);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;
          if (Q_Data.RecordCount = 5)  or (Q_Data.RecordCount = 12) then
          begin
               QRBand2.Height   := 64;
               QRShape16.Height := 65;
               QRShape17.Height := 65;
               QRShape18.Height := 65;
               QRShape19.Height := 65;
               QRDBText1.Height := 61;
               QRDBText2.Height := 61;
               QRDBText3.Height := 61;
               QRDBText4.Height := 61;
          end
          else
          begin
               QRBand2.Height   := 78;
               QRShape16.Height := 79;
               QRShape17.Height := 79;
               QRShape18.Height := 79;
               QRShape19.Height := 79;
               QRDBText1.Height := 73;
               QRDBText2.Height := 73;
               QRDBText3.Height := 73;
               QRDBText4.Height := 73;
          end;
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
     QR_MIDVALVIEW.Lines.Clear;
     if FM_Main.E_MIDVALVIEW.Lines.Count > 6 then
         QR_MIDVALVIEW.Font.Size := 7
     else
         QR_MIDVALVIEW.Font.Size := 9;
     QR_MIDVALVIEW.Lines.Add(FM_Main.E_MIDVALVIEW.Text);
     QR_MIDCOMVIEW.Lines.Clear;
     if FM_Main.E_MIDCOMVIEW.Lines.Count > 6 then
         QR_MIDCOMVIEW.Font.Size := 7
     else
         QR_MIDCOMVIEW.Font.Size := 9;
     QR_MIDCOMVIEW.Lines.Add(FM_Main.E_MIDCOMVIEW.Text);
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

     QR_MIDTOTVIEW.Lines.Clear;
     if FM_Main.E_MIDTOTVIEW.Lines.Count > 6 then
         QR_MIDTOTVIEW.Font.Size := 7
     else
         QR_MIDTOTVIEW.Font.Size := 9;
     QR_MIDTOTVIEW.Lines.Add(FM_Main.E_MIDTOTVIEW.Text);
end;

procedure TQuickReport1.QuickReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
  Fm_PreviewForm.Sb_PrnSetup.Enabled := false;
  Fm_PreviewForm.Sb_Print.Enabled    := false;
  Fm_PreviewForm.Show;
//  Fm_PreviewForm.QuickReport1.OnProgressUpdate := nil;
end;

end.
