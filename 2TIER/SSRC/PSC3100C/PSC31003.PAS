unit psc31003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, qrprntr, Db, DBTables;

type
  TPrint_personal = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    Head_exdate: TQRLabel;
    QRLabel8: TQRLabel;
    Head_korname: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRL_divseqnum: TQRLabel;
    QRL_excpcs: TQRLabel;
    QRL_excpamt: TQRLabel;
    QRL_exiamt: TQRLabel;
    Qry_personal: TQuery;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel14: TQRLabel;
    QRL_sumexcpamt: TQRLabel;
    QRL_sumexiamt: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRL_stlorg: TQRLabel;
    QRL_stlamt: TQRLabel;
    QRL_sumstlamt: TQRLabel;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRL_stbiamt: TQRLabel;
    QRL_sumstbiamt: TQRLabel;
    QRLabel13: TQRLabel;
    QRL_staiamt: TQRLabel;
    QRL_sumstaiamt: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get_datas1;
  end;

var
  Print_personal: TPrint_personal;
  sum_stlamt,sum_stbiamt,sum_excpamt,sum_staiamt,sum_exiamt : Double;
  Inwon        : Integer;
  CodeString   : TStringList;
  DataString   : TStringList;
implementation

uses psc31002, psc31001;

{$R *.DFM}

procedure TPrint_personal.Get_datas1;
begin
  Qry_personal.Close;
  Qry_personal.sql.clear;
  Qry_personal.sql.Add('select corpname||to_char(divseqnum)||''차'' corpname,stlorg,stlamt,excpcs,staiamt,       ');
  Qry_personal.sql.Add('       excpamt,stbiamt,exiamt                        ');
  Qry_personal.sql.Add('from   psemhis                                       ');
  Qry_personal.sql.Add('where  exdate = '''+MainForm.ME_exdate.Text+''' and  ');
  Qry_personal.sql.Add('       empno = '''+MainForm.E_empno.Text+'''         ');
  Qry_personal.sql.Add('order by empno, corpname desc, divseqnum             ');
  Qry_personal.Open;
end;

procedure TPrint_personal.QuickRep1Preview(Sender: TObject);
begin
  PreviewForm.QRPreview1.QRPrinter := TQRPrinter(Sender);
  PreViewForm.Show;
end;

procedure TPrint_personal.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(Inwon);
  QuickRep1.QRPrinter.Progress := (Inwon * 100) div Qry_personal.RecordCount;
  Application.ProcessMessages;

  QRL_divseqnum.Caption := Qry_personal.FieldByName('corpname').AsString;
  QRL_stlorg.Caption    := MainForm.PyccodeA('K910',Qry_personal.FieldByName('stlorg').AsString);
  QRL_stlamt.Caption    := FormatFloat('#,##0',Qry_personal.FieldByName('stlamt').AsFloat);
  if Qry_personal.FieldByName('excpcs').AsString = '1' then
    QRL_excpcs.Caption := '정기'
  else if Qry_personal.FieldByName('excpcs').AsString = '2' then
    QRL_excpcs.Caption := '중도'
  else if QRy_personal.FieldByName('excpcs').AsString = '' then
    QRL_excpcs.Caption := '';
  QRL_stbiamt.Caption := FormatFloat('#,##0', Qry_personal.FieldByName('stbiamt').AsFloat);
  QRL_excpamt.Caption := FormatFloat('#,##0', Qry_personal.FieldByName('excpamt').AsFloat);
  QRL_staiamt.Caption := FormatFloat('#,##0', Qry_personal.FieldByName('staiamt').AsFloat);
  QRL_exiamt.Caption  := FormatFloat('#,##0', Qry_personal.FieldByName('exiamt').AsFloat);
  sum_stlamt  := Qry_personal.FieldByName('stlamt').AsFloat + sum_stlamt;
  sum_stbiamt := Qry_personal.FieldByName('stbiamt').AsFloat + sum_stbiamt;
  sum_excpamt := Qry_personal.FieldByName('excpamt').AsFloat + sum_excpamt;
  sum_staiamt := Qry_personal.FieldByName('staiamt').AsFloat + sum_staiamt;
  sum_exiamt  := Qry_personal.FieldByName('exiamt').AsFloat + sum_exiamt;
end;

procedure TPrint_personal.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_sumstlamt.Caption  := FormatFloat('#,##0',sum_stlamt);
  QRL_sumstbiamt.Caption := FormatFloat('#,##0',sum_stbiamt);
  QRL_sumexcpamt.Caption := FormatFloat('#,##0',sum_excpamt);
  QRL_sumstaiamt.Caption := FormatFloat('#,##0',sum_staiamt);
  QRL_sumexiamt.Caption  := FormatFloat('#,##0',sum_exiamt);
end;


procedure TPrint_personal.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Head_exdate.Caption := Copy(MainForm.ME_exdate.Text,1,4) + '-' +
                         Copy(MainForm.ME_exdate.Text,5,2);
  Head_korname.Caption := MainForm.P_korname.Caption + '(' + MainForm.E_empno.Text + ')';
  Inwon       := 0;
  sum_stlamt  := 0;
  sum_stbiamt := 0;
  sum_excpamt := 0;
  sum_staiamt := 0;
  sum_exiamt  := 0;
end;

end.
