unit PZC10212;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs, DB,
     DBTables, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Tmax_DataSetText;

type
  TQReport1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRL_deptcodeRANGE: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_orgnum: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRBand_detail: TQRBand;
    QRL_deptname: TQRLabel;
    QRL_deptcode: TQRLabel;
    QRL_placename: TQRLabel;
    QRL_fincode: TQRLabel;
    QRL_changename: TQRLabel;
    QRL_changename2: TQRLabel;
    TDS_print: TTMaxDataSet;
    QRSysData2: TQRSysData;
    procedure QReport1Preview(Sender: TObject);
    procedure QReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QReport1AfterPrint(Sender: TObject);
    procedure QRBand_detailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    procedure ReadPrintData;
  end;

var
  QReport1: TQReport1;

implementation

uses pzc10211, peprnView;

{$R *.DFM}

procedure TQReport1.QReport1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport1);
  Fm_PreviewForm.Show;
end;

procedure TQReport1.QReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ReadPrintData;
end;

procedure TQReport1.ReadPrintData;
var
  sTemp : string;
begin
  sTemp  :=   'SELECT                                              '+
              ' nvl(        deptname   ,'' ''),                    '+
              ' nvl(        deptcode   ,'' ''),                    '+
              ' nvl(        placecode  ,'' ''),                    '+
              ' nvl(        fincode    ,'' ''),                    '+
              ' nvl(        chanmode   ,'' ''),                    '+
              ' nvl(        b.codename   ,'' '') placecodenm ,     '+
              ' nvl(        c.codename   ,'' '') chanmodenm        '+
              ' from  pycdept a, pyccode b, pyccode c              '+
              ' where b.codeid(+) = ''I160''                       '+
              ' and   b.codeno(+) = a.placecode                    '+
              ' and   c.codeid(+) = ''I170''                       '+
              ' and   c.codeno(+) = a.chanmode                     '+
       Format(' and   a.orgnum = ''%s''                            ', [DeptForm.E_SERorgnum.Text])    +
//              ' and   substr(deptcode,1,1)                         '+
//       Format(' between ''%s''                                     ', [DeptForm.E_deptcodeFROM.Text]) +
//       Format(' and     ''%s''                                     ', [DeptForm.E_deptcodeTO.Text])   +
              ' and     existon = ''1''                            '+
              ' order by a.deptcode                                ';

  with TDS_print do
    begin
      ServiceName := 'PZC1021A_sel3';
      Close;
      Sql.Clear;
      Sql.Add(sTemp);

      ClearFieldInfo;
      AddField('DEPTNAME'   , ftString, 60);
      AddField('DEPTCODE'   , ftString, 6);
      AddField('PLACECODE'  , ftString, 2);
      AddField('FINCODE'    , ftString, 6);
      AddField('CHANMODE'   , ftString, 1);
      AddField('PLACECODENM', ftString, 20);
      AddField('CHANMODENM' , ftString, 20);
      Open;
    end;
end;



procedure TQReport1.QReport1AfterPrint(Sender: TObject);
begin
  TDS_print.Close;
end;

procedure TQReport1.QRBand_detailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRL_deptname.Caption  := TDS_print.FieldByName('DEPTNAME').AsString;
    QRL_deptcode.Caption  := TDS_print.FieldByName('DEPTCODE').AsString;
    QRL_fincode.Caption   := TDS_print.FieldByName('FINCODE').AsString; 
    QRL_placename.Caption := TDS_print.FieldByName('PLACECODENM').AsString;
    QRL_changename.Caption := TDS_print.FieldByName('CHANMODENM').AsString;

end;

end.
