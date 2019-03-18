//dsa2000   2004.07.15
// 미리보기 화면을 라이브러리에 있는     peprnview 사용토록 수정
unit pka40902;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, ExtCtrls, quickrpt, Qrctrls, Qrprntr, peprnview,
  MemDS, DBAccess, Ora;

type
  TFpka40902 = class(TForm)
    QRLBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRLsysdate: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel16: TQRLabel;
    QuickReport1: TQuickRep;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLduyymmfr: TQRLabel;
    QRLduyymmto: TQRLabel;
    QRLabel89: TQRLabel;
    QRGroup1: TQRGroup;
    QRLpart: TQRLabel;
    c: TQRLabel;
    QRBand1: TQRBand;
    OraQuery1: TOraQuery;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    OraQuery1empdate: TStringField;
    OraQuery1DUYYMM: TStringField;
    OraQuery1DD1: TStringField;
    OraQuery1DD2: TStringField;
    OraQuery1DD3: TStringField;
    OraQuery1DD4: TStringField;
    OraQuery1DD5: TStringField;
    OraQuery1DD6: TStringField;
    OraQuery1DD7: TStringField;
    OraQuery1DD8: TStringField;
    OraQuery1DD9: TStringField;
    OraQuery1DD10: TStringField;
    OraQuery1DD11: TStringField;
    OraQuery1DD12: TStringField;
    OraQuery1DD13: TStringField;
    OraQuery1DD14: TStringField;
    OraQuery1DD15: TStringField;
    OraQuery1DD16: TStringField;
    OraQuery1DD17: TStringField;
    OraQuery1DD18: TStringField;
    OraQuery1DD19: TStringField;
    OraQuery1DD20: TStringField;
    OraQuery1DD21: TStringField;
    OraQuery1DD22: TStringField;
    OraQuery1DD23: TStringField;
    OraQuery1DD24: TStringField;
    OraQuery1DD25: TStringField;
    OraQuery1DD26: TStringField;
    OraQuery1DD27: TStringField;
    OraQuery1DD28: TStringField;
    OraQuery1DD29: TStringField;
    OraQuery1DD30: TStringField;
    OraQuery1DD31: TStringField;
    QRM_ducode: TQRRichText;
    OraQuery1empno: TStringField;
    OraQuery1korname: TStringField;
    OraQuery1paycl: TStringField;
    QRDBText37: TQRDBText;
    OraQuery1retdate: TStringField;
    OraQuery1d1: TStringField;
    OraQuery1d2: TStringField;
    OraQuery1d3: TStringField;
    OraQuery1d4: TStringField;
    OraQuery1d5: TStringField;
    OraQuery1d6: TStringField;
    OraQuery1d7: TStringField;
    OraQuery1d8: TStringField;
    OraQuery1d9: TStringField;
    OraQuery1d10: TStringField;
    OraQuery1d11: TStringField;
    OraQuery1d12: TStringField;
    OraQuery1d13: TStringField;
    OraQuery1d14: TStringField;
    OraQuery1d15: TStringField;
    OraQuery1d16: TStringField;
    OraQuery1d17: TStringField;
    OraQuery1d18: TStringField;
    OraQuery1d19: TStringField;
    OraQuery1d20: TStringField;
    OraQuery1d21: TStringField;
    OraQuery1d22: TStringField;
    OraQuery1d23: TStringField;
    OraQuery1d24: TStringField;
    OraQuery1d25: TStringField;
    OraQuery1d26: TStringField;
    OraQuery1d27: TStringField;
    OraQuery1d28: TStringField;
    OraQuery1d29: TStringField;
    OraQuery1d30: TStringField;
    OraQuery1d31: TStringField;
    procedure QuickReport1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    cd1,cd2,cd3,cd4,cd5,cd6,cd7 : string;

  public
    { Public declarations }

  end;

var
  Fpka40902: TFpka40902;
  Fm_PreviewForm: TFm_PreviewForm; //변수선언  dsa2000

implementation

uses Func, Pka40901;

{$R *.DFM}


procedure TFpka40902.QuickReport1Preview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
     Fm_PreviewForm.Show;
end;

procedure TFpka40902.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := cafree;
end;

procedure TFpka40902.OraQuery1CalcFields(DataSet: TDataSet);
var
    i: integer;
begin
    for i := 1 to 31 do
    begin
         if Fpka40901.RBpart.Checked = True then
         begin
              if Trim(Fpka40901.Gspart) = DataSet.FieldByName('dd'+inttostr(i)).AsString then
                   DataSet.FindField('d'+inttostr(i)).AsString := DataSet.FieldByName('dd'+inttostr(i)).AsString
              else
                   DataSet.FindField('d'+inttostr(i)).AsString := ' ';
         end
         else
         begin
              DataSet.FindField('d'+inttostr(i)).AsString := DataSet.FieldByName('dd'+inttostr(i)).AsString;
         end;
    end;
end;

end.
 