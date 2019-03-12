unit PZK10204;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess, Ora;

type
  TQuickRep3 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRL_task_name: TQRLabel;
    QRL_item_name: TQRLabel;
    Ora_Career: TOraQuery;
    QRShape9: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel13: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel15: TQRLabel;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    QRL_hig_yn: TQRLabel;
    QRL_col_nref_yn: TQRLabel;
    QRL_col_ref_yn: TQRLabel;
    QRL_uni_nref_yn: TQRLabel;
    QRL_uni_ref_yn: TQRLabel;
    QRL_mas_nref_yn: TQRLabel;
    QRL_mas_ref_yn: TQRLabel;
    QRL_doc_nref_yn: TQRLabel;
    QRL_doc_ref_yn: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape39: TQRShape;
    QRLabel40: TQRLabel;
    QRShape40: TQRShape;
    QRLabel41: TQRLabel;
    QRShape41: TQRShape;
    QRLabel42: TQRLabel;
    QRShape42: TQRShape;
    QRLabel43: TQRLabel;
    QRShape43: TQRShape;
    QRLabel44: TQRLabel;
    QRShape44: TQRShape;
    QRLabel45: TQRLabel;
    QRShape45: TQRShape;
    QRLabel46: TQRLabel;
    QRL_m3: TQRLabel;
    QRL_m6: TQRLabel;
    QRL_y1: TQRLabel;
    QRL_y3: TQRLabel;
    QRL_y5: TQRLabel;
    QRL_y7: TQRLabel;
    QRL_yA: TQRLabel;
    QRShape22: TQRShape;
    QRLabel19: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel22: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRL_1: TQRLabel;
    QRL_2: TQRLabel;
    QRL_3: TQRLabel;
    QRL_4: TQRLabel;
    QRL_5: TQRLabel;
    QRL_L: TQRLabel;
    QRL_M: TQRLabel;
    QRL_H: TQRLabel;
    QRL_license_item: TQRLabel;
    Ora_AbilA: TOraQuery;
    QRL_level1: TQRLabel;
    QRL_level2: TQRLabel;
    QRL_level3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRL_d1: TQRLabel;
    QR_Page1: TQRLabel;
    QR_Page2: TQRSysData;
    QRShape57: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep3BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep3AfterPrint(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickRep3: TQuickRep3;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickRep3.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CarTime : String;
begin
  if MainForm.GSWorkLevel >= 2 then
    NewPage;

  if MainForm.GSWorkLevel = 1 then
    begin
      QRL_level1.Caption := 'Manager급 교육수준';
      QRL_level2.Caption := 'Manager급 경력연수';
      QRL_level3.Caption := 'Manager급 지식/기술/자격(증)';
    end
  else if MainForm.GSWorkLevel = 2 then
    begin
      QRL_level1.Caption := 'Senior급 교육수준';
      QRL_level2.Caption := 'Senior급 경력연수';
      QRL_level3.Caption := 'Senior급 지식/기술/자격(증)';
    end
  else if MainForm.GSWorkLevel = 3 then
    begin
      QRL_level1.Caption := 'Junior급 교육수준';
      QRL_level2.Caption := 'Junior급 경력연수';
      QRL_level3.Caption := 'Junior급 지식/기술/자격(증)';
    end;

  with Ora_Career do
    begin
      QRL_hig_yn.Caption       := '';
      QRL_col_nref_yn.Caption  := '';
      QRL_col_ref_yn.Caption   := '';
      QRL_uni_nref_yn.Caption  := '';
      QRL_uni_ref_yn.Caption   := '';
      QRL_mas_nref_yn.Caption  := '';
      QRL_mas_ref_yn.Caption   := '';
      QRL_doc_nref_yn.Caption  := '';
      QRL_doc_ref_yn.Caption   := '';

      Close;
      Sql.Clear;
      Sql.Add('select * from a1career where duty_id = :duty_id  and worker_level = :worker_level');
      ParamByName('duty_id').AsString      :=  MainForm.GSdutyId;

      if MainForm.GSWorkLevel = 1 then
        ParamByName('worker_level').AsString := 'M'
      else if MainForm.GSWorkLevel = 2 then
        ParamByName('worker_level').AsString := 'S'
      else if MainForm.GSWorkLevel = 3 then
        ParamByName('worker_level').AsString := 'J';

      Open;

      if FieldByName('hig_yn').AsString = 'Y' then
        QRL_hig_yn.Caption       := '○';

      if FieldByName('col_nref_yn').AsString = 'Y' then
        QRL_col_nref_yn.Caption  := '○';

      if FieldByName('col_ref_yn').AsString = 'Y' then
        QRL_col_ref_yn.Caption  := '○';

      if FieldByName('uni_nref_yn').AsString = 'Y' then
        QRL_uni_nref_yn.Caption  := '○';

      if FieldByName('uni_ref_yn').AsString = 'Y' then
        QRL_uni_ref_yn.Caption  := '○';

      if FieldByName('mas_nref_yn').AsString = 'Y' then
        QRL_mas_nref_yn.Caption  := '○';

      if FieldByName('mas_ref_yn').AsString = 'Y' then
        QRL_mas_ref_yn.Caption  := '○';

      if FieldByName('doc_nref_yn').AsString = 'Y' then
        QRL_doc_nref_yn.Caption  := '○';

      if FieldByName('doc_ref_yn').AsString = 'Y' then
        QRL_doc_ref_yn.Caption  := '○';

      CarTime                  := FieldByName('career_time').AsString;
      QRL_m3.Caption := '';
      QRL_m6.Caption := '';
      QRL_y1.Caption := '';
      QRL_y3.Caption := '';
      QRL_y5.Caption := '';
      QRL_y7.Caption := '';
      QRL_yA.Caption := '';            

      if CarTime = 'M3' then
        QRL_m3.Caption      := '○'
      else if CarTime = 'M6' then
        QRL_m6.Caption      := '○'
      else if CarTime = 'Y1' then
        QRL_y1.Caption      := '○'
      else if CarTime = 'Y3' then
        QRL_y3.Caption      := '○'
      else if CarTime = 'Y5' then
        QRL_y5.Caption      := '○'
      else if CarTime = 'Y7' then
        QRL_y7.Caption      := '○'
      else if CarTime = 'YA' then
        QRL_yA.Caption      := '○'; 
    end;

end;

procedure TQuickRep3.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  import, req : String;
begin
  with Ora_AbilA do
    begin
      QRL_task_name.Caption := FieldByName('task_name').AsString;
      QRL_item_name.Caption := FieldByName('item_name').AsString;
      import                := FieldByName('import_kind').AsString;
      req                   := FieldByName('req_kind').AsString;

      QRL_1.Caption := '';
      QRL_2.Caption := '';
      QRL_3.Caption := '';
      QRL_4.Caption := '';
      QRL_5.Caption := '';

      if import = '1' then
        QRL_1.Caption := '○'
      else if import ='2' then
        QRL_2.Caption := '○'
      else if import ='3' then
        QRL_3.Caption := '○'
      else if import ='4' then
        QRL_4.Caption := '○'
      else if import ='5' then
        QRL_5.Caption := '○';

      QRL_L.Caption := '';
      QRL_M.Caption := '';
      QRL_H.Caption := '';

      if req = '초급' then
        QRL_L.Caption := '○'
      else if req = '중급' then
        QRL_M.Caption := '○'
      else if req = '고급' then
        QRL_H.Caption := '○';

      QRL_license_item.Caption := FieldByName('license_item').AsString;

    end;

end;

procedure TQuickRep3.QuickRep3BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Inc(MainForm.GSWorkLevel);

  with Ora_AbilA do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select a.*, decode(b.task_name,'''', ''공통'', b.task_name) task_name              ');
      Sql.Add('  from a1ability a, a1task b         ');
      Sql.Add('where a.duty_id      = b.duty_id(+)  ');
      Sql.Add('  and a.task_sno     = b.task_sno(+) ');
      Sql.Add('  and a.duty_id      = :duty_id      ');
      Sql.Add('  and a.worker_level = :worker_level ');
      Sql.Add('  and a.ability_kind = ''A'' ');
      Sql.Add('order by a.ability_sno       ');

      ParamByName('duty_id').AsString      := MainForm.GSdutyId;

      if MainForm.GSWorkLevel = 1 then
        ParamByName('worker_level').AsString := 'M'
      else if MainForm.GSWorkLevel = 2 then
        ParamByName('worker_level').AsString := 'S'
      else if MainForm.GSWorkLevel = 3 then
        ParamByName('worker_level').AsString := 'J';

      Open;
    end;

end;

procedure TQuickRep3.QuickRep3AfterPrint(Sender: TObject);
begin
//  NewPage;
end;

procedure TQuickRep3.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_d1.Caption := MainForm.GSdutyName;
end;

end.
