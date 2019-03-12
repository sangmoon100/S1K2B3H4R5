unit psc31004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, qrprntr, ExtCtrls, Qrctrls, Db, DBTables;

type
  TPrint_divtotal = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    Head_exdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRL_divseqnum: TQRLabel;
    QRL_cnt: TQRLabel;
    QRL_amount: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    Qry_divtotal: TQuery;
    QRL_sumcnt: TQRLabel;
    QRL_sumamount: TQRLabel;
    QRLabel8: TQRLabel;
    QRL_stlorg: TQRLabel;
    QRShape7: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRL_sumstaiamt: TQRLabel;
    QRL_sumexiamt: TQRLabel;
    QRL_sumexcpamt: TQRLabel;
    QRL_sumstbiamt: TQRLabel;
    QRL_stbiamt: TQRLabel;
    QRL_excpamt: TQRLabel;
    QRL_staiamt: TQRLabel;
    QRL_exiamt: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get_datas2;
  end;

var
  Print_divtotal: TPrint_divtotal;
  sum_cnt,Inwon : Integer;
  sum_amount,sum_stbiamt,sum_excpamt,sum_staiamt,sum_exiamt : Double;
implementation

uses psc31001, psc31002;

{$R *.DFM}

procedure TPrint_divtotal.Get_datas2;
begin
  Qry_divtotal.Close;
  Qry_divtotal.sql.clear;
  Qry_divtotal.sql.Add('select corpname||to_char(divseqnum)||''Â÷'' gubun,stlorg,count(*) cnt,sum(stbiamt) sum_stbi, ');
  Qry_divtotal.sql.Add('       sum(excpamt) sum_excp,sum(staiamt) sum_stai,         ');
  Qry_divtotal.sql.Add('       sum(exiamt) sum_exi,sum(excpamt+exiamt) sum_amount   ');
  Qry_divtotal.sql.Add('from psemhis                                                ');
  Qry_divtotal.sql.Add('where exdate = '''+MainForm.ME_exdate.Text+'''              ');
  Qry_divtotal.sql.Add('group by corpname, divseqnum,stlorg                                   ');
//  Qry_divtotal.sql.Add('order by divseqnum                                          ');
  Qry_divtotal.Open;
end;

procedure TPrint_divtotal.QuickRep1Preview(Sender: TObject);
begin
  PreviewForm.QRPreview1.QRPrinter := TQRPrinter(Sender);
  PreViewForm.Show;
end;

procedure TPrint_divtotal.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(Inwon);
  QuickRep1.QRPrinter.Progress := (Inwon * 100) div Qry_divtotal.RecordCount;
  Application.ProcessMessages;

  QRL_divseqnum.Caption := Qry_divtotal.FieldByName('gubun').AsString;
  QRL_stlorg.Caption    := MainForm.PyccodeA('K910',Qry_divtotal.FieldByName('stlorg').AsString);
  QRL_cnt.Caption       := IntToStr(Qry_divtotal.FieldByName('cnt').AsInteger);
  QRL_stbiamt.Caption   := FormatFloat('#,##0', Qry_divtotal.FieldByName('sum_stbi').AsFloat);
  QRL_excpamt.Caption   := FormatFloat('#,##0', Qry_divtotal.FieldByName('sum_excp').AsFloat);
  QRL_staiamt.Caption   := FormatFloat('#,##0', Qry_divtotal.FieldByName('sum_stai').AsFloat);
  QRL_exiamt.Caption    := FormatFloat('#,##0', Qry_divtotal.FieldByName('sum_exi').AsFloat);
  QRL_amount.Caption    := FormatFloat('#,##0', Qry_divtotal.FieldByName('sum_amount').AsFloat);
  sum_cnt := Qry_divtotal.FieldByName('cnt').AsInteger + sum_cnt;
  sum_stbiamt := Qry_divtotal.FieldByName('sum_stbi').AsFloat + sum_stbiamt;
  sum_excpamt := Qry_divtotal.FieldByName('sum_excp').AsFloat + sum_excpamt;
  sum_staiamt := Qry_divtotal.FieldByName('sum_stai').AsFloat + sum_staiamt;
  sum_exiamt  := Qry_divtotal.FieldByName('sum_exi').AsFloat + sum_exiamt;
  sum_amount  := Qry_divtotal.FieldByName('sum_amount').AsFloat + sum_amount;
end;

procedure TPrint_divtotal.QuickRep1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  Head_exdate.Caption := Copy(MainForm.ME_exdate.Text,1,4) + '-' +
                         Copy(MainForm.ME_exdate.Text,5,2);
  Inwon       := 0;
  sum_cnt     := 0;
  sum_stbiamt := 0;
  sum_excpamt := 0;
  sum_staiamt := 0;
  sum_exiamt  := 0;
  sum_amount := 0;
end;

procedure TPrint_divtotal.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_sumcnt.Caption      := IntToStr(sum_cnt);
  QRL_sumstbiamt.Caption  := FormatFloat('#,##0',sum_stbiamt);
  QRL_sumexcpamt.Caption  := FormatFloat('#,##0',sum_excpamt);
  QRL_sumstaiamt.Caption  := FormatFloat('#,##0',sum_staiamt);
  QRL_sumexiamt.Caption   := FormatFloat('#,##0',sum_exiamt);
  QRL_sumamount.Caption   := FormatFloat('#,##0',sum_amount);
end;

end.
