{===================== Program Header ==========================================
 PROGRAM-NAME   : PKQ1030A(소득공제 신고서)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 연말정산
 Programmer     : 강륜종
 Version        : 1.0
 Date           : 2005.12.

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
     1.00       2005.12.15         강륜종          최초개발본
================================================================================}

unit PSH1070A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, Tmax_DataSetText, StdCtrls;

type
  TFM_Print = class(TForm)
    QRCompositeReport1: TQRCompositeReport;
    TDS2: TTMaxDataSet;
    QuickRep1: TQuickRep;
    QR_amt4: TQRBand;
    QRShape176: TQRShape;
    QRShape185: TQRShape;
    QRShape203: TQRShape;
    QRShape254: TQRShape;
    QRShape259: TQRShape;
    QRShape260: TQRShape;
    QRShape261: TQRShape;
    QRLabel565: TQRLabel;
    QRShape272: TQRShape;
    QRShape273: TQRShape;
    QRLabel624: TQRLabel;
    QRShape280: TQRShape;
    QRLabel551: TQRLabel;
    QR_corpt: TQRLabel;
    QRShape166: TQRShape;
    QRShape172: TQRShape;
    QRLabel391: TQRLabel;
    QRLabel431: TQRLabel;
    QR_corptelt: TQRLabel;
    QRShape1: TQRShape;
    QR_paydatet: TQRLabel;
    QRShape2: TQRShape;
    QR_amtt: TQRLabel;
    QR_itemt: TQRLabel;
    QR_divmontht: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QR_korname: TQRLabel;
    QR_empno: TQRLabel;
    QRLabel7: TQRLabel;
    QR_Deptcode: TQRLabel;
    QR_Appdate: TQRLabel;
    QR_payra: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QR_totamt: TQRLabel;
    QR_corp1: TQRLabel;
    QR_corptel1: TQRLabel;
    QR_paydate1: TQRLabel;
    QR_item1: TQRLabel;
    QR_amt1: TQRLabel;
    QR_divmonth1: TQRLabel;
    QR_corp2: TQRLabel;
    QR_corptel2: TQRLabel;
    QR_paydate2: TQRLabel;
    QR_item2: TQRLabel;
    QR_amt2: TQRLabel;
    QR_divmonth2: TQRLabel;
    QR_corp3: TQRLabel;
    QR_corptel3: TQRLabel;
    QR_paydate3: TQRLabel;
    QR_item3: TQRLabel;
    QR_amt3: TQRLabel;
    QR_divmonth3: TQRLabel;
    QRLabel1: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_AnuAmt, FG_MedAmt, FG_HireAmt  : Double;
  end;

var
  FM_Print: TFM_Print;

implementation

uses PSH1070A1,PSH1070A3, peprnview;

{$R *.DFM}

procedure TFM_Print.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFM_Print.QRCompositeReport1AddReports(Sender: TObject);
begin

  QRCompositeReport1.Reports.Add(QuickRep1);
end;

procedure TFM_Print.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

procedure TFM_Print.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//     QRLabel1.cAPTION :='1';


end;

procedure TFM_Print.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var  SqlStr2 : String;
       i       : Integer;
       Q_field : TQRLabel;
       Totamt  : Currency;
begin
     QR_empno.Caption    := FM_Mainform.PE_empno.empno;
     QR_korname.Caption  := FM_Mainform.PE_empno.korname;
     QR_Deptcode.Caption :=FM_Mainform.PE_empno.Deptname; // MainForm.ED_empno.Deptcode+'/'+
     QR_payra.Caption    :=FM_Mainform.PE_empno.payra; // MainForm.ED_empno.Deptcode+'/'+



     //마스터 읽어오기
     SqlStr2 := 'SELECT EMPNO, SEQ, CORPNAME, CORPTEL, PLAYDATE, PLAYITEM,   '+
                '       PLAYAMT, DIVISION, CONYN, CONYNSAYU, COMMENTS        '+
                '  FROM PSHAPLAY                                             '+
                ' WHERE APPDATE = ''' + FM_Mainform.FG_Appdate +'''          '+
                '   AND EMPNO   = ''' + FM_Mainform.PE_empno.empno +'''      '+
                '   AND (CONYN  is null or                                   '+
                '        CONYN <> ''Y'')                                     '+
                ' ORDER BY SEQ                                                ';


      with TDS2 do
      begin
           ServiceName := 'PSH1030A_sel2';
           Close;
           Sql.Clear;
           Sql.Text := SqlStr2;

           ClearFieldInfo;
           AddField('EMPNO'   , ftString,  4);
           AddField('SEQ'     , ftInteger, 3);
           AddField('CORPNAME', ftString,  30);
           AddField('CORPTEL' , ftString,  15);
           AddField('PLAYDATE', ftString,  8);
           AddField('PLAYITEM', ftString,  20);
           AddField('PLAYAMT' , ftInteger, 7);
           AddField('DIVISION', ftInteger, 2);
           AddField('CONYN'   , ftString,  1);
           AddField('CONYNSAYU', ftString,  50);
           AddField('COMMENTS' , ftString,  50);
           Open;

//    컨퍼넌트 쿨리어
           QR_corp1.Caption        :=  '';
           QR_corp2.Caption        :=  '';
           QR_corp3.Caption        :=  '';

           QR_corptel1.Caption     :=  '';
           QR_corptel2.Caption     :=  '';
           QR_corptel3.Caption     :=  '';

           QR_paydate1.Caption     :=  '';
           QR_paydate2.Caption     :=  '';
           QR_paydate3.Caption     :=  '';

           QR_item1.Caption        :=  '';
           QR_item2.Caption        :=  '';
           QR_item3.Caption        :=  '';

           QR_amt1.Caption        :=  '';
           QR_amt2.Caption        :=  '';
           QR_amt3.Caption        :=  '';

           QR_divmonth1.Caption        :=  '';
           QR_divmonth2.Caption        :=  '';
           QR_divmonth3.Caption        :=  '';


           if TDS2.eof then
           begin
                MessageDlg('해당하는 데이터가 존재하지 않습니다.', mtInformation , [mbOk],0);
                Exit;
           end;


{           QR_DEVAMT.Caption     := FormatFloat('#,##0', FieldByName('DEVAMT').AsFloat ) ;
           QR_NONDEVAMT.Caption  := FormatFloat('#,##0', FieldByName('NONDEVAMT').AsFloat ) ;
           QR_Total.Caption      := FormatFloat('#,##0', FieldByName('DEVAMT').AsFloat + FieldByName('NONDEVAMT').AsFloat);}



//    아이템 읽어오기
           i := 1;
           while not TDS2.Eof do
           begin
                Q_field  := Self.FindComponent('QR_corp'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := FieldByName('CORPNAME').AsString;
                Q_field  := Self.FindComponent('QR_corptel'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := FieldByName('CORPTEL').AsString;

                Q_field  := Self.FindComponent('QR_paydate'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := Copy(FieldByName('PLAYDATE').AsString,1,4) +'-' +
                                   Copy(FieldByName('PLAYDATE').AsString,5,2) +'-' +
                                   Copy(FieldByName('PLAYDATE').AsString,7,2);

                Q_field  := Self.FindComponent('QR_item'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := FieldByName('PLAYITEM').AsString;

                Q_field  := Self.FindComponent('QR_amt'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := FormatFloat('#,##0',FieldByName('PLAYAMT').AsFloat);

                Q_field  := Self.FindComponent('QR_divmonth'+IntToStr(i)) as TQRLabel;    //관계
                Q_field.caption := FieldByName('DIVISION').AsString+'개월';
                Totamt :=  Totamt +  FieldByName('PLAYAMT').AsFloat;
                i := i + 1;
                TDS2.Next;
           end;
           QR_totamt.Caption :=   FormatFloat('#,##0',Totamt);

     end;
end;

end.
