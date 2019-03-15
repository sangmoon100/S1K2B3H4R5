unit pkg10402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, DBTables, Kylib1, DateLib, quickrpt, Qrprntr, peprnview,
  Qrctrls, Func, Ora;

type
  TPrintForm = class(TForm)
    QRBand1: TQRBand;
    QuickReport1: TQuickRep;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    Qempno: TQRLabel;
    Qkorname: TQRLabel;
    Qfirstyn: TQRLabel;
    Qfaminame: TQRLabel;
    Qfamikind: TQRLabel;
    Qfamirel: TQRLabel;
    Qfamibdate: TQRLabel;
    Qappdate: TQRLabel;
    Qfamifrdate: TQRLabel;
    Qbigo: TQRLabel;
    QRL_day: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRL_inwon: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRL_sort: TQRLabel;
    Qage: TQRLabel;
    Qappkind: TQRLabel;
    Qfamiyn: TQRLabel;
    Qfamitodate: TQRLabel;
    Qregdate: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_order: TQRLabel;
    QRShape7: TQRShape;
    QRBand2: TQRChildBand;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRBand4BeforePrint(sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickReport1NeedData(sender: TObject; var MoreData: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    // jeon jin tack
    user_preview : boolean;
  end;

var
  PrintForm: TPrintForm;
  i, Inwon: Integer;
  Fm_PreviewForm: TFm_PreviewForm; //변수선언  dsa2000

implementation

{$R *.DFM}

uses pkg10401;

procedure TPrintForm.QRBand4BeforePrint(sender: TQRCustomBand; var PrintBand: Boolean);
begin
     QRL_inwon.Caption := Inttostr(Inwon)+' 명';
end;

procedure TPrintForm.QuickReport1NeedData(sender: TObject; var MoreData: Boolean);
begin
     if MainForm.QueryF.eof then
          MoreData := False
     else
     begin
          Inc(Inwon);
          MainForm.Gauge1.Progress := (Inwon * 100) div MainForm.QueryF.RecordCount;
          Application.ProcessMessages;

          Qempno.Caption      := MainForm.QueryF.FieldByName('empno').AsString;
          Qkorname.Caption    := MainForm.QueryF.FieldByName('korname').AsString;
          Qfirstyn.Caption    := MainForm.QueryF.FieldByName('firstyn').AsString;
          Qfaminame.Caption   := MainForm.QueryF.FieldByName('faminame').AsString;
          Qfamikind.Caption   := GetCodeName('K410',MainForm.QueryF.FieldByName('famikind').AsString);
          Qfamirel.Caption    := GetCodeName('I211',MainForm.QueryF.FieldByName('famirel').AsString);

          if MainForm.QueryF.FieldByName('famibdate').AsString <> '' then
          begin
               Qfamibdate.Caption  := Copy(MainForm.QueryF.FieldByName('famibdate').AsString,1,4)+'.'+
                                      Copy(MainForm.QueryF.FieldByName('famibdate').AsString,5,2)+'.'+
                                      Copy(MainForm.QueryF.FieldByName('famibdate').AsString,7,2);
               i := StrToIntDef(Copy(DateCal(MainForm.QueryF.FieldByName('famibdate').AsString,Copy(MainForm.CurDate,1,8)),1,2),0);
               Qage.Caption := IntToStr(i);
          end
          else
          begin
               Qfamibdate.Caption  := '';
               Qage.Caption        := '';
          end;

          if MainForm.QueryF.FieldByName('appdate').AsString <> '' then
               Qappdate.Caption := Copy(MainForm.QueryF.FieldByName('appdate').AsString,1,4)+'.'+
                                   Copy(MainForm.QueryF.FieldByName('appdate').AsString,5,2)+'.'+
                                   Copy(MainForm.QueryF.FieldByName('appdate').AsString,7,2)
          else
               Qappdate.Caption := '';

          Qappkind.Caption := GetCodeName('K411',MainForm.QueryF.FieldByName('appkind').AsString);
          Qfamiyn.Caption  := MainForm.QueryF.FieldByName('famiyn').AsString;

          if MainForm.QueryF.FieldByName('famifrdate').AsString <> '' then
               Qfamifrdate.Caption := Copy(MainForm.QueryF.FieldByName('famifrdate').AsString,1,4)+'.'+
                                      Copy(MainForm.QueryF.FieldByName('famifrdate').AsString,5,2)
          else
               Qfamifrdate.Caption := '';

          if MainForm.QueryF.FieldByName('famitodate').AsString <> '' then
               Qfamitodate.Caption := Copy(MainForm.QueryF.FieldByName('famitodate').AsString,1,4)+'.'+
                                      Copy(MainForm.QueryF.FieldByName('famitodate').AsString,5,2)
          else
               Qfamitodate.Caption := '';

          if MainForm.QueryF.FieldByName('regdate').AsString <> '' then
               Qregdate.Caption := Copy(MainForm.QueryF.FieldByName('regdate').AsString,1,4)+'.'+
                                   Copy(MainForm.QueryF.FieldByName('regdate').AsString,5,2)+'.'+
                                   Copy(MainForm.QueryF.FieldByName('regdate').AsString,7,2)
          else
               Qregdate.Caption := '';

          if (MainForm.QueryF.FieldByName('famikind').AsString = 'B') and  {존속}
             (MainForm.QueryF.FieldByName('fawithdate').AsString <> '') then
          begin
               Qbigo.Caption := '존속 : '+Copy(MainForm.QueryF.FieldByName('fawithdate').AsString,1,4)+'.'+
                                          Copy(MainForm.QueryF.FieldByName('fawithdate').AsString,5,2)+'.'+
                                          Copy(MainForm.QueryF.FieldByName('fawithdate').AsString,7,2);
          end
          else if (MainForm.QueryF.FieldByName('famikind').AsString = 'A') and
                  (MainForm.QueryF.FieldByName('mateempno').AsString <> '') then {배우자}
          begin
               Qbigo.Caption := '배우자 : '+MainForm.QueryF.FieldByName('MATENM').AsString;
          end
          else
          begin
               Qbigo.Caption := '';
          end;

          MainForm.QueryF.next;
          MoreData := True
     end;
end;

// jeon jin tack
procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     MainForm.QueryF.Close;
     action := cafree;
end;

procedure TPrintForm.QuickReport1Preview(Sender: TObject);
begin
     self.user_preview := true;
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
     Fm_PreviewForm.Show;
end;

procedure TPrintForm.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if self.user_preview then Fm_PreviewForm.show;
end;

procedure TPrintForm.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     QRL_day.Caption := Copy(MainForm.MEfr.text,1,4) + '.' + Copy(MainForm.MEfr.text,5,2) + '.' +
                        Copy(MainForm.MEfr.text,7,2) + ' ∼ ' +
                        Copy(MainForm.MEto.Text,1,4) + '.' + Copy(MainForm.MEto.Text,5,2) + '.' +
                        Copy(MainForm.MEto.Text,7,2);

     if MainForm.RByes.Checked = True then
          QRL_sort.Caption := '기처리자'
     else if MainForm.RBno.Checked = True then
          QRL_sort.Caption := '미처리자'
     else
          QRL_sort.Caption := '전체';

     if MainForm.RBempno.Checked = True then
          QRL_order.Caption := '사번/가족연령 순'
     else
          QRL_order.Caption := '신청일자/사번/가족연령 순';

     QRLabel15.Caption := MainForm.L_Curdate.Caption;
     Inwon := 0;

     // jeon jin tack
     MainForm.QueryF.first;
end;

end.
