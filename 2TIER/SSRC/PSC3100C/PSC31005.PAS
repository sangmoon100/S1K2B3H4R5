unit psc31005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, qrprntr, ExtCtrls, Qrctrls, Db, DBTables;

type
  TPrint_divdetail = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    Head_exdate: TQRLabel;
    QRLabel8: TQRLabel;
    Head_divseqnum: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRL_empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_stlamt: TQRLabel;
    QRL_staiamt: TQRLabel;
    QRL_excpcs: TQRLabel;
    QRL_excpamt: TQRLabel;
    QRL_exiamt: TQRLabel;
    QRL_amt: TQRLabel;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    Qry_divdetail: TQuery;
    QRL_totstlamt: TQRLabel;
    QRL_totstaiamt: TQRLabel;
    QRL_totexcpamt: TQRLabel;
    QRL_totexiamt: TQRLabel;
    QRL_totamt: TQRLabel;
    QRGroup1: TQRGroup;
    QRL_totstbiamt: TQRLabel;
    QRL_stbiamt: TQRLabel;
    QRLabel17: TQRLabel;
    head_stlorg: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get_datas3;
  end;

var
  Print_divdetail: TPrint_divdetail;
  tot_sumstlamt  : Double;
  tot_sumstaiamt : Double;
  tot_sumstbiamt : Double;
  tot_sumexcpamt : Double;
  tot_sumexiamt  : Double;
  tot_totamt     : Double;
  Inwon          : Integer;
implementation

uses psc31001, psc31002;

{$R *.DFM}

procedure TPrint_divdetail.Get_datas3;
begin
{  Qry_divdetail.Close;
  Qry_divdetail.sql.Clear;
  Qry_divdetail.sql.Add('select A.empno,A.korname,A.stlorg,A.stlamt,A.staiamt,  ');
  Qry_divdetail.sql.Add('       A.excpcs,A.stbiamt,A.excpamt,A.exiamt,          ');
  Qry_divdetail.sql.Add('       sum(A.excpamt+A.exiamt) examt                   ');
  Qry_divdetail.sql.Add('from psemhis A, pyccode B                              ');
  Qry_divdetail.sql.Add('where A.exdate='''+MainForm.ME_exdate.Text+''' and     ');
  Qry_divdetail.sql.Add('      A.divseqnum='''+MainForm.Qry_pshlbas.FieldByName('divseqnum').AsString+''' and   ');
  Qry_divdetail.sql.Add('      A.stclass='''+Copy(MainForm.Qry_pshlbas.FieldByName('stclass').AsString,1,1)+''' and ');
  Qry_divdetail.sql.Add('      B.codeid=''K910'' and                            ');
  Qry_divdetail.sql.Add('      B.codename='''+MainForm.Qry_pshlbas.FieldByName('codename').AsString+'''  ');
  Qry_divdetail.sql.Add('group by A.empno,A.korname,A.stlorg,A.stlamt,A.staiamt, ');
  Qry_divdetail.sql.Add('         A.excpcs,A.stbiamt,A.excpamt,A.exiamt          ');
  Qry_divdetail.sql.Add('order by A.empno,A.stlorg                               ');
  Qry_divdetail.Open;   }
  Qry_divdetail.Close;
  Qry_divdetail.sql.Clear;
  Qry_divdetail.sql.Add('select empno,korname,stlorg,stlamt,staiamt,  ');
  Qry_divdetail.sql.Add('       excpcs,stbiamt,excpamt,exiamt,          ');
  Qry_divdetail.sql.Add('       sum(excpamt+exiamt) examt                   ');
  Qry_divdetail.sql.Add('from psemhis                               ');
  Qry_divdetail.sql.Add('where ' );
  Qry_divdetail.sql.Add('      corpname='''+MainForm.Qry_pshlbas.FieldByName('corpname').AsString+''' and     ');
  Qry_divdetail.sql.Add('      exdate='''+MainForm.ME_exdate.Text+''' and     ');
  Qry_divdetail.sql.Add('      divseqnum='''+MainForm.Qry_pshlbas.FieldByName('divseqnum').AsString+''' and   ');
  Qry_divdetail.sql.Add('      stclass='''+MainForm.Qry_pshlbas.FieldByName('stclass').AsString+''' and ');
  Qry_divdetail.sql.Add('      stlorg='''+MainForm.Qry_pshlbas.FieldByName('stlorg').AsString+'''  ');
  Qry_divdetail.sql.Add('group by empno,korname,stlorg,stlamt,staiamt, ');
  Qry_divdetail.sql.Add('         excpcs,stbiamt,excpamt,exiamt          ');
  Qry_divdetail.sql.Add('order by empno,stlorg                               ');
  Qry_divdetail.Open;
end;

procedure TPrint_divdetail.QuickRep1Preview(Sender: TObject);
begin
  PreviewForm.QRPreview1.QRPrinter := TQRPrinter(Sender);
  PreViewForm.Show;
end;

procedure TPrint_divdetail.QuickRep1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  Head_exdate.Caption    := Copy(MainForm.ME_exdate.Text,1,4) + '-' +
                            Copy(MainForm.ME_exdate.Text,5,2);
  Head_divseqnum.Caption := MainForm.Qry_pshlbas.FieldByName('divseqnum').AsString;
  Head_stlorg.Caption    := '(' + MainForm.PyccodeA('K910',MainForm.Qry_pshlbas.FieldByName('stlorg').AsString)
                            + ')';
  Inwon          := 0;
  tot_sumstlamt  := 0;
  tot_sumstaiamt := 0;
  tot_sumstbiamt := 0;
  tot_sumexcpamt := 0;
  tot_sumexiamt  := 0;
  tot_totamt     := 0;
end;

procedure TPrint_divdetail.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(Inwon);
  QuickRep1.QRPrinter.Progress := (Inwon * 100) div Qry_divdetail.RecordCount;
  Application.ProcessMessages;

  QRL_empno.Caption    := Qry_divdetail.FieldByName('empno').AsString;
  QRL_korname.Caption  := Qry_divdetail.FieldByName('korname').AsString;
  QRL_stlamt.Caption   := FormatFloat('#,##0', Qry_divdetail.FieldByName('stlamt').AsFloat);
  QRL_staiamt.Caption  := FormatFloat('#,##0', Qry_divdetail.FieldByName('staiamt').AsFloat);
  if Qry_divdetail.FieldByName('excpcs').AsString = '1' then
    QRL_excpcs.Caption := '정기'
  else if Qry_divdetail.FieldByName('excpcs').AsString = '2' then
    QRL_excpcs.Caption := '중도'
  else if Qry_divdetail.FieldByName('excpcs').AsString = '' then
    QRL_excpcs.Caption := '';
  QRL_stbiamt.Caption  := FormatFloat('#,##0', Qry_divdetail.FieldByName('stbiamt').AsFloat);
  QRL_excpamt.Caption  := FormatFloat('#,##0', Qry_divdetail.FieldByName('excpamt').AsFloat);
  QRL_exiamt.Caption   := FormatFloat('#,##0', Qry_divdetail.FieldByName('exiamt').AsFloat);
  QRL_amt.Caption      := FormatFloat('#,##0', Qry_divdetail.FieldByName('examt').AsFloat);

  tot_sumstlamt  := Qry_divdetail.FieldByName('stlamt').AsFloat + tot_sumstlamt;
  tot_sumstaiamt := Qry_divdetail.FieldByName('staiamt').AsFloat + tot_sumstaiamt;
  tot_sumstbiamt := Qry_divdetail.FieldByName('stbiamt').AsFloat + tot_sumstbiamt;
  tot_sumexcpamt := Qry_divdetail.FieldByName('excpamt').AsFloat + tot_sumexcpamt;
  tot_sumexiamt  := Qry_divdetail.FieldByName('exiamt').AsFloat + tot_sumexiamt;
  tot_totamt     := Qry_divdetail.FieldByName('examt').AsFloat + tot_totamt;
end;

procedure TPrint_divdetail.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_totstlamt.Caption  := FormatFloat('#,##0',tot_sumstlamt);
  QRL_totstaiamt.Caption := FormatFloat('#,##0',tot_sumstaiamt);
  QRL_totstbiamt.Caption := FormatFloat('#,##0',tot_sumstbiamt);
  QRL_totexcpamt.Caption := FormatFloat('#,##0',tot_sumexcpamt);
  QRL_totexiamt.Caption  := FormatFloat('#,##0',tot_sumexiamt);
  QRL_totamt.Caption     := FormatFloat('#,##0',tot_totamt);
end;

end.
