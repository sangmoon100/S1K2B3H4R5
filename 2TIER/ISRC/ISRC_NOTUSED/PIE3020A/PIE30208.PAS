unit PIE30208;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables;

type
  TNewPrintForm1 = class(TForm)
    InReport: TQuickRep;
    QRBand_Header: TQRBand;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRShape50: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRShape60: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape49: TQRShape;
    QRShape66: TQRShape;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape20: TQRShape;
    QRLabel8: TQRLabel;
    QRShape67: TQRShape;
    QRShape16: TQRShape;
    QRLabel21: TQRLabel;
    QRShape_head_left: TQRShape;
    QRShape22: TQRShape;
    QRShape9: TQRShape;
    QRLabel22: TQRLabel;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand_Detail: TQRBand;
    QRL_deptname: TQRLabel;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRL_pdirsum2: TQRLabel;
    QRL_P10: TQRLabel;
    QRShape14: TQRShape;
    QRL_P20: TQRLabel;
    QRShape19: TQRShape;
    QRL_P22: TQRLabel;
    QRShape30: TQRShape;
    QRL_P32: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRL_pspe: TQRLabel;
    QRL_pemp: TQRLabel;
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    QRShape7: TQRShape;
    QRL_P4ALL: TQRLabel;
    QRL_pdirsum1: TQRLabel;
    QRShape27: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRShape_body_left: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRL_pcontsum: TQRLabel;
    QRL_pimsisum: TQRLabel;
    QRShape34: TQRShape;
    QRL_psconsum: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    Query1: TQuery;
    QRShape13: TQRShape;
    QRBand1: TQRBand;
    QRL_comment: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRL_pdirsum: TQRLabel;
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportPreview(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPrintForm1: TNewPrintForm1;

implementation

uses PIE30201,PePrnview;


{$R *.DFM}

procedure TNewPrintForm1.QRBand_DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Newqry do
  begin
    QRL_deptname.Caption := FieldByName('deptname').AsString;

    if FieldByName('상무이상').AsString <> '0' then
       QRL_pdirsum1.Caption := FieldByName('상무이상').AsString
    else
       QRL_pdirsum1.Caption := '';

    if FieldByName('상무보').AsString <> '0' then
      QRL_pdirsum2.Caption := FieldByName('상무보').AsString
    else
      QRL_pdirsum2.Caption := '';

    if FieldByName('임원소계').AsString <> '0' then
       QRL_pdirsum.Caption   := FieldByName('임원소계').AsString
    else
       QRL_pdirsum.Caption := '';

    if FieldByName('부장').AsString <> '0' then
      QRL_P10.Caption      := FieldByName('부장').AsString
    else
      QRL_P10.Caption      := '';

    if FieldByName('차장').AsString <> '0' then
      QRL_P20.Caption      := FieldByName('차장').AsString
    else
      QRL_P20.Caption :='';

    if FieldByName('과장').AsString <> '0' then
      QRL_P22.Caption      := FieldByName('과장').AsString
    else
      QRL_P22.Caption := '';

    if FieldByName('대리').AsString <> '0' then
      QRL_P32.Caption      := FieldByName('대리').AsString
    else
      QRL_P32.Caption := '';
      
    if FieldByName('사원').AsString <> '0' then
      QRL_P4All.Caption := FieldByName('사원').AsString
    else
      QRL_P4All.Caption := '';

    if FieldByName('특정').AsString <> '0' then
      QRL_pspe.Caption  := FieldByName('특정').AsString
    else
      QRL_pspe.Caption := '';
      
    if FieldByName('정규직계').AsString <> '0' then
      QRL_pemp.Caption := FieldByName('정규직계').AsString
    else
      QRL_pemp.Caption := '';

    if FieldByName('전계').AsString <> '0' then
      QRL_psconsum.Caption := FieldByName('전계').AsString
    else
      QRL_psconsum.Caption := '';

    if FieldByName('계약').AsString <> '0' then
      QRL_pcontsum.Caption := FieldByName('계약').AsString
    else
      QRL_pcontsum.Caption := '';
      
    if FieldByName('일반').AsString <> '0' then
     QRL_pextrsum.Caption := FieldByName('일반').AsString
    else
      QRL_pextrsum.Caption := '';

    if FieldByName('계약계').AsString <> '0' then
       QRL_pimsisum.Caption := FieldByName('계약계').AsString
    else
      QRL_pimsisum.Caption := '';

    if FieldByName('총계').AsString <> '0' then
       QRL_psum.Caption     := FieldByName('총계').AsString
    else
       QRL_psum.Caption := '';
  end;
end;

procedure TNewPrintForm1.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRL_WorkDate.Caption  := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                           Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
  QRL_curdate.Caption   := MainForm.L_Date.Caption;
end;

procedure TNewPrintForm1.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TNewPrintForm1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Query1 do
  begin
    Close;
    SQL.Clear;
    //L.Add(

  end;
end;

procedure TNewPrintForm1.QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if trim(MainForm.ME_WorkDate.Text) < MainForm.payrachym then
   begin
       QRLabel13.Caption := '부서/직급별 인원현황';
       QRLabel33.Caption := '부장';
       QRLabel35.Caption := '차장';
       QRLabel44.Caption := '과장';
       QRLabel37.Caption := '대리';
       QRLabel3.Caption  := '사원';
       QRLabel38.Caption := '특정';
   end
   else
   begin
       QRLabel13.Caption := '부서/BAND별 인원현황';
       QRLabel33.Caption := 'L2';
       QRLabel35.Caption := 'L1';
       QRLabel44.Caption := 'G4';
       QRLabel37.Caption := 'G3';
       QRLabel3.Caption  := 'G2';
       QRLabel38.Caption := 'P';
   end;
end;

end.
