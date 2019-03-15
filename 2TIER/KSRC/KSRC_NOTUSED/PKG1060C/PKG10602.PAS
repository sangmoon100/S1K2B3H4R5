unit pkg10602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, DBTables, kylib1, quickrpt, Qrctrls, Qrprntr,peprnview, Func;

type
  TPrintForm = class(TForm)
    QRBand1: TQRBand;
    QuickReport1: TQuickRep;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_sort: TQRLabel;
    QRL_year: TQRLabel;
    QRLabel6: TQRLabel;
    QRL_CurDate: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand_Detail: TQRBand;
    QRShape4: TQRShape;
    Qempno: TQRLabel;
    Qkorname: TQRLabel;
    Qfirstyn: TQRLabel;
    Qfaminame: TQRLabel;
    Qfamikind: TQRLabel;
    Qfamirel: TQRLabel;
    Qfamibdate: TQRLabel;
    Qregdate: TQRLabel;
    Qfami_date: TQRLabel;
    Qappdesc: TQRLabel;
    QRBand4: TQRBand;
    QRLabel28: TQRLabel;
    QRL_inwonTOT: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRL_note: TQRLabel;
    QRBand2: TQRChildBand;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRL_appkindNAME: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand_SubTotal: TQRChildBand;
    QRLabel4: TQRLabel;
    QRL_inwonSUB: TQRLabel;
    QRShape7: TQRShape;
    procedure QuickReport1NeedData(sender: TObject; var MoreData: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    // jeon jin taek
    user_preview : Boolean;
  end;

var
  PrintForm: TPrintForm;
  inwonSUB, inwonTOT: Integer;
  Cur_Appkind: string; {현재 신청구분}
  SkipPage: Boolean;
  Fm_PreviewForm: TFm_PreviewForm; //변수선언  dsa2000

implementation

{$R *.DFM}

uses pkg10601;

procedure TPrintForm.QuickReport1NeedData(sender:TObject; var MoreData: Boolean);
begin
     with MainForm.QueryF do
     begin
          if eof then MoreData := False
          else
          begin
               QRBand_subtotal.Enabled := False;
               QRBand_Detail.Enabled   := False;

               if MainForm.RB_all.Checked then
               begin
                    if SkipPage then
                    begin
                         if FieldByName('APPKIND').AsString = 'A2' then
                              QRL_appkindNAME.Caption := '지급월'
                         else
                              QRL_appkindNAME.Caption := '해지월';

                         QuickReport1.NewPage;
                         Cur_Appkind := FieldByName('APPKIND').AsString;
                         SkipPage := False;
                         MoreData := True;
                         System.Exit;
                 end;
               end;

               Inc(inwonSUB);
               Inc(inwonTOT);
               MainForm.Gauge1.Progress := (inwonTOT * 100) div RecordCount;
               Application.ProcessMessages;

               QRBand_Detail.Enabled  := True;
               Qempno.Caption      := FieldByName('empno').AsString;
               Qkorname.Caption    := FieldByName('korname').AsString;
               Qfirstyn.Caption    := FieldByName('firstyn').AsString;
               Qfaminame.Caption   := FieldByName('faminame').AsString;
               Qfamikind.Caption   := FieldByName('famikind').AsString;
               Qfamirel.Caption    := FieldByName('famirel').AsString;
               if FieldByName('famibdate').AsString <> '' then
                    Qfamibdate.Caption := copy(FieldByName('famibdate').AsString,1,4)+'.'+
                                          copy(FieldByName('famibdate').AsString,5,2)+'.'+
                                          copy(FieldByName('famibdate').AsString,7,2)
               else
                    Qfamibdate.Caption := '';

               if MainForm.QueryF.FieldByName('regdate').AsString <> '' then
                    Qregdate.Caption := Copy(FieldByName('regdate').AsString,1,4)+'.'+
                                        Copy(FieldByName('regdate').AsString,5,2)+'.'+
                                        Copy(FieldByName('regdate').AsString,7,2)
               else
                    Qregdate.Caption := '';

               if MainForm.QueryF.FieldByName('APPKIND').AsString = 'A2' then
               begin
                    if MainForm.QueryF.FieldByName('famifrdate').AsString <> '' then
                         Qfami_date.Caption := Copy(FieldByName('famifrdate').AsString,1,4)+'.'+
                                               Copy(FieldByName('famifrdate').AsString,5,2)
                    else
                         Qfami_date.Caption := '';
               end
               else
               begin
                    if FieldByName('famitodate').AsString <> '' then
                         Qfami_date.Caption := Copy(FieldByName('famitodate').AsString,1,4)+'.'+
                                               Copy(FieldByName('famitodate').AsString,5,2)
                    else
                         Qfami_date.Caption := '';
               end;
               Qappdesc.Caption := FieldByName('appdesc').AsString;

               Next;

               if MainForm.RB_all.Checked then
               begin
                    if (FieldByName('APPKIND').AsString <> Cur_Appkind) or (eof) then
                    begin
                         QRBand_SubTotal.Enabled := True;
                         if Cur_Appkind = 'A2' then
                              QRL_inwonSUB.Caption := IntToStr(inwonSUB)+' 명(지급대상자)'
                         else
                              QRL_inwonSUB.Caption := IntToStr(inwonSUB)+' 명(해지대상자)';
                         inwonSUB := 0;
                         SkipPage := True;
                    end;
               end;

               if eof then
                    QRL_inwonTOT.Caption := IntToStr(inwonTOT)+' 명';

               MoreData := True
          end;
     end;
end;

procedure TPrintForm.QuickReport1Preview(Sender: TObject);
begin
     self.user_preview := true;
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
     Fm_PreviewForm.Show;
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     MainForm.QueryF.Close;
     action := cafree;
end;

procedure TPrintForm.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if self.user_preview then Fm_PreviewForm.show;
end;

procedure TPrintForm.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     MainForm.QueryF.First;

     QRL_year.Caption := Copy(MainForm.MEyear.Text,1,4)+'.'+Copy(MainForm.MEyear.Text,5,2);
     QRL_CurDate.Caption := MainForm.L_Curdate.Caption;
     inwonTOT := 0;
     inwonSUB := 0;

     QRBand_subtotal.Enabled := False;

     if MainForm.RB_OrderAppkind.Checked then
          QRL_note.Caption := '[주] 출력순서 : 신청구분/사번/가족연령순'
     else
          QRL_note.Caption := '[주] 출력순서 : 사번/신청구분/가족연령순';

     if MainForm.RB_all.Checked then
     begin
          SkipPage := False;
          QRL_sort.Caption := '전체';
          if MainForm.QueryF.FieldByName('APPKIND').AsString = 'A2' then
               QRL_appkindNAME.Caption := '지급월'
          else
               QRL_appkindNAME.Caption := '해지월';
          Cur_Appkind := MainForm.QueryF.FieldByName('APPKIND').AsString;
     end
     else if MainForm.RB_provide.Checked then
     begin
          QRL_sort.Caption        := '지급대상자';
          QRL_appkindNAME.Caption := '지급월';
     end
     else
     begin
          QRL_sort.Caption        := '해지대상자';
          QRL_appkindNAME.Caption := '해지월';
     end;
end;

end.
