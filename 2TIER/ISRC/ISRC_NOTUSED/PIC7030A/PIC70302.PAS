unit pic70302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, pass, QRCtrls, Quickrpt;

type
  TCData = class(TDataModule)
    DataSource1: TDataSource;
    Database1: TDatabase;
    Qemd: TQuery;
    Qcod: TQuery;
    QemdROWCNT: TFloatField;
    QemdEMPNO: TStringField;
    QemdKORNAME: TStringField;
    QemdORGNUM: TStringField;
    QemdDEPTCODE: TStringField;
    QemdEXTCODE: TStringField;
    QemdBONCODE: TStringField;
    QemdPAYRA: TStringField;
    QemdDPORGNUM: TStringField;
    QemdDPDEPTCODE: TStringField;
    QemdDPEXTCODE: TStringField;
    QemdDPDEPTLEVEL: TStringField;
    QemdDPBONCODE: TStringField;
    QemdDPPAYRA: TStringField;
    QemdDPPAYRAYN: TStringField;
    QemdTRGUBUN: TStringField;
    QemdCONFYN: TStringField;
    QemdNdeptcode: TStringField;
    QemdNdpdeptcode: TStringField;
    QemdNpayra: TStringField;
    QemdNdppayra: TStringField;
    Qscr: TQuery;
    DataSource2: TDataSource;
    QscrDEPTCODE: TStringField;
    QscrDEPTNAME: TStringField;
    QscrCHANMODE: TStringField;
    Qcmd: TQuery;
    Qsub: TQuery;
    PrnDlg: TPrintDialog;
    QemdPAYCL: TStringField;
    QemdNpaycl: TStringField;
    procedure QemdCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function PrintExecute(aRpt : TQuickRep; aPageCnt : integer) : Boolean;
  end;

var
  CData: TCData;

implementation
uses pic70301;

{$R *.DFM}

function TCData.PrintExecute(aRpt : TQuickRep; aPageCnt : integer) : Boolean;
begin
    Result := False;
    prndlg.frompage := 1;
    prndlg.topage   := aPageCnt;
    prndlg.copies := 1;
    if prndlg.Execute = True then  begin
      aRpt.PrinterSettings.firstpage := prndlg.frompage;
      aRpt.PrinterSettings.lastpage  := prndlg.topage;
      aRpt.PrinterSettings.copies    := prndlg.copies;
      Result := True;
    end;
end;

procedure TCData.QemdCalcFields(DataSet: TDataSet);
begin
  if MainForm.PreviligeCheck('º±≈√',Qemd.FieldByName('empno').AsString) = False then
     MainForm.CheckEmpno[Qemd.FieldByName('Rowcnt').AsInteger] := 'Y';
  Qemd.FieldByName('Ndeptcode').AsString :=
          MainForm.DeptAbbr(Qemd.FieldByName('orgnum').AsString,
                            Qemd.FieldByName('deptcode').AsString);
  Qemd.FieldByName('Ndpdeptcode').AsString :=
          MainForm.DeptAbbr(Qemd.FieldByName('dporgnum').AsString,
                            Qemd.FieldByName('dpdeptcode').AsString);
  Qemd.FieldByName('Npayra').AsString :=
          CodeDisp(Qcod,'I113',Qemd.FieldByName('payra').AsString,CodeFile);
  Qemd.FieldByName('Ndppayra').AsString :=
          CodeDisp(Qcod,'I113',Qemd.FieldByName('dppayra').AsString,CodeFile);
  Qemd.FieldByName('Npaycl').AsString :=
          CodeDisp(Qcod,'I112',Qemd.FieldByName('paycl').AsString,CodeFile);
end;

end.
