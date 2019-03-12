unit Uprint1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, Tmax_DataSetText;

type
  TQuickRep1 = class(TQuickRep)
    Q_data: TTMaxDataSet;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel8: TQRLabel;
    QRShape16: TQRShape;
    QRLabel9: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel10: TQRLabel;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel12: TQRLabel;
    QR_empno: TQRLabel;
    QR_korname: TQRLabel;
    QR_deptname: TQRLabel;
    QR_payclname: TQRLabel;
    QR_Answer1: TQRMemo;
    QR_Answer2: TQRMemo;
    QR_Answer3: TQRMemo;
    QR_Answer4: TQRMemo;
    QR_Answer5: TQRMemo;
    QR_Answer6: TQRMemo;
    QR_Answer7: TQRMemo;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickRep1: TQuickRep1;

implementation

uses UMainForm;

{$R *.DFM}

procedure TQuickRep1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
     ParamVariant: String;
begin
     QR_Answer1.Lines.Clear;
     QR_Answer2.Lines.Clear;
     QR_Answer3.Lines.Clear;
     QR_Answer4.Lines.Clear;
     QR_Answer5.Lines.Clear;
     QR_Answer6.Lines.Clear;
     QR_Answer7.Lines.Clear;
//     QR_Answer8.Lines.Clear;

     QR_empno.Caption     :=  FM_main.Ed_empno.Text;
     QR_korname.Caption   :=  FM_main.L_Korname.ValueCaption;
     QR_payclname.Caption :=  FM_main.L_payclname.ValueCaption;
     QR_deptname.Caption  :=  FM_main.L_deptname.ValueCaption;

     with Q_data do
     begin
          ParamVariant := Format('SELECT Answer1, Answer2, Answer3, Answer4, Answer5         '+
                                 '  FROM pmpathmas A                                         '+
                                 ' WHERE A.EMPNO     = ''%s''                                 ',[FM_main.Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Answer1'       , ftString, 400);
          AddField('Answer2'       , ftString, 400);
          AddField('Answer3'       , ftString, 400);
          AddField('Answer4'       , ftString, 400);
          AddField('Answer5'       , ftString, 400);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          QR_Answer1.Lines.Add(Fields[0].AsString);
          QR_Answer2.Lines.Add(Fields[1].AsString);
          QR_Answer3.Lines.Add(Fields[2].AsString);
          QR_Answer4.Lines.Add(Fields[3].AsString);
          QR_Answer5.Lines.Add(Fields[4].AsString);

          ParamVariant := Format('SELECT Answer6, Answer7, Answer8, dutytarget, E1opinion     '+
                                 '  FROM pmpathmas A                                          '+
                                 ' WHERE A.EMPNO     = ''%s''                                 ',[FM_main.Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Answer6'       , ftString, 400);
          AddField('Answer7'       , ftString, 400);
          AddField('Answer8'       , ftString, 400);
          AddField('dutytarget'    , ftString, 400);
          AddField('E1opinion'     , ftString, 400);
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          QR_Answer6.Lines.Add(Fields[0].AsString);
          QR_Answer7.Lines.Add(Fields[1].AsString);
//          QR_Answer8.Lines.Add(Fields[2].AsString);
     end;
end;

end.
