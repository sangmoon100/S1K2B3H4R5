unit pzc10202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls;

type
  TDeptPrint = class(TForm)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLsysdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRL_deptcodeRANGE: TQRLabel;
    QRBand_detail: TQRBand;
    Query_print: TQuery;
    QReport: TQuickRep;
    QRBand3: TQRBand;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRL_orgnum: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_deptcode: TQRLabel;
    QRL_placename: TQRLabel;
    QRL_fincode: TQRLabel;
    QRL_changename: TQRLabel;
    QRLabel9: TQRLabel;
    Query_printDEPTNAME: TStringField;
    Query_printDEPTCODE: TStringField;
    Query_printPLACECODE: TStringField;
    Query_printFINCODE: TStringField;
    Query_printCHANMODE: TStringField;
    QueryA: TQuery;
    QRLabel10: TQRLabel;
    QRL_changename2: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    procedure QReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QReportAfterPrint(Sender: TObject);
    procedure QReportNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure init_code(const CodeIds: array of String);
    function  PyccodeA( codeid,codeno : string ) : string;     {코드조회}
  end;

var
  DeptPrint: TDeptPrint;
  CodeString: TStringList; {codeno list}
  DataString: TStringList; {codename list}

implementation

{$R *.DFM}

procedure TDeptPrint.init_code(const CodeIds: array of String);
var
  i: Integer;
begin
  CodeString := TStringList.Create;
  DataString := TStringList.Create;

  QueryA.Close;
  QueryA.SQL.Clear;
  QueryA.SQL.ADD(' SELECT CODEID, CODENO, CODENAME ');
  QueryA.SQL.ADD('   FROM PYCCODE ');
  QueryA.SQL.ADD('  WHERE ');
  for i := 0 to High(CodeIds) - 1 do
     QueryA.SQL.ADD(' (CODEID = '''+CodeIds[i]+''') or ');
  QueryA.SQL.ADD(' (CODEID = '''+CodeIds[High(CodeIds)]+''') ');
  QueryA.Open;

  while not QueryA.eof do
  begin
    CodeString.Add(QueryA.FieldByName('CODEID').AsString +
                   QueryA.FieldByName('CODENO').AsString);
    DataString.Add(QueryA.FieldByName('CODENAME').AsString);
    QueryA.Next;
  end;
  QueryA.Close;
end;

function TDeptPrint.PyccodeA(codeid,codeno : string ) : string;
var
  ind: Integer;
begin
  ind := CodeString.IndexOf(codeid+codeno);
  if ind > -1 then
    PyccodeA := DataString.Strings[ind]
  else
    PyccodeA := codeno;
end;

procedure TDeptPrint.QReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  init_code(['I160']);
  Query_print.Open;
end;

procedure TDeptPrint.QReportAfterPrint(Sender: TObject);
begin
  CodeString.free;
  DataString.free;
  Query_print.Close;
end;

procedure TDeptPrint.QReportNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if Query_print.eof then
  begin
    MoreData := False;
  end
  else
  begin
    QRL_deptname.Caption  := Query_printDEPTNAME.AsString;
    QRL_deptcode.Caption  := Query_printDEPTCODE.AsString;
    QRL_fincode.Caption   := Query_printFINCODE.AsString;
    QRL_placename.Caption := PyccodeA('I160', Query_printPLACECODE.AsString);
    if Query_printCHANMODE.AsString = '0' then
      QRL_changename.Caption := '조직'
    else if Query_printCHANMODE.AsString = '1' then
      QRL_changename.Caption := '신설'
    else if Query_printCHANMODE.AsString = '2' then
      QRL_changename.Caption := '변동'
    else if Query_printCHANMODE.AsString = '3' then
      QRL_changename.Caption := '폐쇄'
    else
      QRL_changename.Caption := Query_printCHANMODE.AsString;

  {  if Query_printCHANMODE2.AsString = '0' then
      QRL_changename2.Caption := '통합'
    else if Query_printCHANMODE2.AsString = '1' then
      QRL_changename2.Caption := '분할'
    else if Query_printCHANMODE2.AsString = '2' then
      QRL_changename2.Caption := '명칭변경'
    else if Query_printCHANMODE2.AsString = '3' then
      QRL_changename2.Caption := '편제변경'
    else
      QRL_changename2.Caption := Query_printCHANMODE2.AsString;}



    Query_print.next;
    MoreData := True;
  end;
end;

end.


