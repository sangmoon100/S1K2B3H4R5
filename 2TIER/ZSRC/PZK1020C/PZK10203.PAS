unit PZK10203;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel13: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape7: TQRShape;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape10: TQRShape;
    QRShape16: TQRShape;
    QRL_task_name: TQRLabel;
    QRL_work_rate: TQRLabel;
    QRL_motive_name: TQRLabel;
    QRL_real_value: TQRLabel;
    QRL_exp_nnum: TQRLabel;
    QRL_output_item: TQRLabel;
    QRShape18: TQRShape;
    QRL_work_name: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRL_real_unit: TQRLabel;
    QRShape23: TQRShape;
    QRL_exp_num_unit: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRL_value_nnum: TQRLabel;
    QRL_value_num: TQRLabel;
    QRShape27: TQRShape;
    QRShape30: TQRShape;
    QRShape17: TQRShape;
    QRShape28: TQRShape;
    QR_line3: TQRShape;
    QRL_exp_num_value: TQRLabel;
    QRL_task: TQRLabel;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRL_rate: TQRLabel;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRLabel2: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRBand4: TQRBand;
    QRLabel22: TQRLabel;
    QRL_d1: TQRLabel;
    QRLabel24: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand5: TQRBand;
    QRLabel20: TQRLabel;
    QRL_d2: TQRLabel;
    QRLabel23: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QR_line2: TQRShape;
    QR_line1: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Group_Rate : Double;
    task_name, work_name : String;
  end;

var
  QuickRep2: TQuickRep2;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Ora_task do
    begin
      if task_name = FieldByName('task_name').AsString then
        begin
          QRL_task_name.Caption := '';
          QR_line1.Enabled     := False;
          QR_line2.Enabled     := True;
          QR_line3.Enabled     := False;
        end
      else
        begin
          QRL_task_name.Caption := FieldByName('task_name').AsString;
          QR_line1.Enabled     := False;
          QR_line2.Enabled     := False;
          QR_line3.Enabled     := False; //True;
        end;

      if work_name = FieldByName('work_name').AsString then
        begin
          QRL_work_name.Caption     := '';
          QRL_work_rate.Caption     := '';
          QRL_output_item.Caption   := '';
          QRL_value_nnum.Caption    := '';
          QRL_value_num.Caption     := '';

          QR_line1.Enabled     := True;
          QR_line2.Enabled     := False;
          QR_line3.Enabled     := False;

        end
      else
        begin
          QRL_work_name.Caption     := FieldByName('work_name').AsString;
          QRL_work_rate.Caption     := FieldByName('work_rate').AsString;
          QRL_output_item.Caption   := FieldByName('output_item').AsString;
          QRL_value_nnum.Caption    := FieldByName('value_nnum').AsString;
          QRL_value_num.Caption     := FieldByName('value_num').AsString;

          if task_name = FieldByName('task_name').AsString then
            begin
              QR_line1.Enabled     := False;
              QR_line2.Enabled     := True;
              QR_line3.Enabled     := False;
            end
          else
            begin
              QR_line1.Enabled     := False;
              QR_line2.Enabled     := False;
              QR_line3.Enabled     := False;
            end;

          Group_rate := Group_rate + MainForm.Ora_task.FieldByName('work_rate').AsFloat;
        end;

      QRL_motive_name.Caption   := FieldByName('motive_name').AsString;
      QRL_real_value.Caption    := FieldByName('real_value').AsString;
      QRL_real_unit.Caption     := FieldByName('real_unit').AsString;
      QRL_exp_nnum.Caption      := FieldByName('exp_nnum').AsString;
      QRL_exp_num_value.Caption := FieldByName('exp_num_value').AsString;
      QRL_exp_num_unit.Caption  := FieldByName('exp_num_unit').AsString;
      task_name  := MainForm.Ora_task.FieldByName('task_name').AsString;
      work_name  := MainForm.Ora_task.FieldByName('work_name').AsString;
    end;
end;

procedure TQuickRep2.QuickRep2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRL_task.Enabled := True;
  Group_Rate       := 0;
  task_name        := '';
  work_name        := '';
end;

procedure TQuickRep2.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRL_task.Enabled := False;
end;

procedure TQuickRep2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_RATE.CAPTION := FloatToStr(Group_rate) + '%';
end;

procedure TQuickRep2.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Group_Rate       := 0;
end;

procedure TQuickRep2.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Group_Rate       := 0;
end;

procedure TQuickRep2.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d1.Caption := MainForm.GSdutyName;
end;

procedure TQuickRep2.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d2.Caption := MainForm.GSdutyName;
end;

end.
