unit PKC21202C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, peprnview;

type
  TFM_PRINT = class(TForm)
    Q_REP1: TQuickRep;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape9: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape22: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    jobplace: TQRLabel;
    c_yymm: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    var1_m: TQRLabel;
    var2_m: TQRLabel;
    var3_m: TQRLabel;
    var4_m: TQRLabel;
    var5_m: TQRLabel;
    var6_m: TQRLabel;
    var7_m: TQRLabel;
    var8_m: TQRLabel;
    var9_m: TQRLabel;
    var10_m: TQRLabel;
    var11_m: TQRLabel;
    var12_m: TQRLabel;
    var13_m: TQRLabel;
    var14_m: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape34: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    all_day: TQRLabel;
    QRShape1: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape3: TQRShape;
    QRShape20: TQRShape;
    QRShape32: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape33: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape35: TQRShape;
    QRShape47: TQRShape;
    QRLabel33: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QR_OFFITEL: TQRLabel;
    QR_JOBDEPT: TQRLabel;
    qr_empno: TQRLabel;
    QRShape58: TQRShape;
    QRLabel39: TQRLabel;
    var15_m: TQRLabel;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRShape26: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    var16_m: TQRLabel;
    var17_m: TQRLabel;
    var18_m: TQRLabel;
    var19_m: TQRLabel;
    var20_m: TQRLabel;
    QRShape61: TQRShape;
    QRLabel43: TQRLabel;
    var1_f: TQRLabel;
    var2_f: TQRLabel;
    var16_f: TQRLabel;
    var17_f: TQRLabel;
    var3_f: TQRLabel;
    var18_f: TQRLabel;
    var19_f: TQRLabel;
    var20_f: TQRLabel;
    var4_f: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q_REP1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure Q_REP1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FM_PRINT: TFM_PRINT;

implementation
uses PKC21201C;

{$R *.DFM}

procedure TFM_PRINT.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qr_empno.Caption := FM_PKC2120C.p_korname + '('
                     + FM_PKC2120C.P_SaveEmpno + ')';

   //2015.03.12 하은영 응답자를 로그인 사원의 정보로 출력되도록 수정
   qr_jobdept.Caption := FM_PKC2120C.p_jobdept;
   qr_offitel.Caption := FM_PKC2120C.p_offitel;

  //2015.01.30 하은영 여러장 출력할 수 있도록 수정
  // if not FM_PKC2120C.Ora_Qry1.Eof then
  // begin

  //FM_PKC2120C.Ora_Qry1.first;
      with FM_PKC2120C.Ora_Qry1 do
      begin
         c_yymm.Caption  := Copy(FieldByName('c_yymm').AsString,1,4)+ ' - '  +
                            Copy(FieldByName('c_yymm').AsString,5,2);
         jobplace.Caption:= FieldByName('jobplace').AsString
                          + FieldByName('jobplacenm').AsString;
         //20180912 jhg 양식변경으로 여성 제외
         var1_m.Caption  := FormatFloat('#,###0',FieldByName('var1_m').AsFloat);
         var1_f.Caption  := FormatFloat('#,###0',FieldByName('var1_f').AsFloat);
         var2_m.Caption  := FormatFloat('#,###0',FieldByName('var2_m').AsFloat);
         var2_f.Caption  := FormatFloat('#,###0',FieldByName('var2_f').AsFloat);
         var3_m.Caption  := FormatFloat('#,###0',FieldByName('var3_m').AsFloat);
         var3_f.Caption  := FormatFloat('#,###0',FieldByName('var3_f').AsFloat);
         var4_m.Caption  := FormatFloat('#,###0',FieldByName('var4_m').AsFloat);
         var4_f.Caption  := FormatFloat('#,###0',FieldByName('var4_f').AsFloat);
         var5_m.Caption  := FormatFloat('#,###0',FieldByName('var5_m').AsFloat);
         //var5_f.Caption  := FormatFloat('#,###',FieldByName('var5_f').AsFloat);
         var6_m.Caption  := FormatFloat('#,###0',FieldByName('var6_m').AsFloat);
         //var6_f.Caption  := FormatFloat('#,###',FieldByName('var6_f').AsFloat);
         var7_m.Caption  := FormatFloat('#,###0',FieldByName('var7_m').AsFloat);
         //var7_f.Caption  := FormatFloat('#,###',FieldByName('var7_f').AsFloat);
         var8_m.Caption  := FormatFloat('#,###0',FieldByName('var8_m').AsFloat);
         //var8_f.Caption  := FormatFloat('#,###',FieldByName('var8_f').AsFloat);
         var9_m.Caption  := FormatFloat('#,###0',FieldByName('var9_m').AsFloat);
         //var9_f.Caption  := FormatFloat('#,###',FieldByName('var9_f').AsFloat);
         var10_m.Caption := FormatFloat('#,###0',FieldByName('var10_m').AsFloat);
         //var10_f.Caption := FormatFloat('#,###',FieldByName('var10_f').AsFloat);
         var11_m.Caption := FormatFloat('#,###0',FieldByName('var11_m').AsFloat);
         //var11_f.Caption := FormatFloat('#,###',FieldByName('var11_f').AsFloat);
         var12_m.Caption := FormatFloat('#,###0',FieldByName('var12_m').AsFloat);
         //var12_f.Caption := FormatFloat('#,###',FieldByName('var12_f').AsFloat);
         var13_m.Caption := FormatFloat('#,###0',FieldByName('var13_m').AsFloat);
         //var13_f.Caption := FormatFloat('#,###',FieldByName('var13_f').AsFloat);
         var14_m.Caption := FormatFloat('#,###0',FieldByName('var14_m').AsFloat);
         //var14_f.Caption := FormatFloat('#,###',FieldByName('var14_f').AsFloat);
         all_day.Caption := FormatFloat('#,###0',FM_PKC2120C.FG_AllDate);
         //2016.05.24 eyha 미출근일수 추가
         var15_m.Caption  := FormatFloat('#,###0',FieldByName('var15_m').AsFloat);
         //var15_f.Caption  := FormatFloat('#,###',FieldByName('var15_f').AsFloat);

         var16_m.Caption  := FormatFloat('#,###0',FieldByName('var16_m').AsFloat); //20180912 jhg 입직-채용
         var16_f.Caption  := FormatFloat('#,###0',FieldByName('var16_f').AsFloat); //20180912 jhg 입직-채용
         var17_m.Caption  := FormatFloat('#,###0',FieldByName('var17_m').AsFloat); //20180912 jhg 입직-기타
         var17_f.Caption  := FormatFloat('#,###0',FieldByName('var17_f').AsFloat); //20180912 jhg 입직-기타
         var18_m.Caption  := FormatFloat('#,###0',FieldByName('var18_m').AsFloat); //20180912 jhg 이직-자발적이직
         var18_f.Caption  := FormatFloat('#,###0',FieldByName('var18_f').AsFloat); //20180912 jhg 이직-자발적이직
         var19_m.Caption  := FormatFloat('#,###0',FieldByName('var19_m').AsFloat); //20180912 jhg 이직-비자발적이직
         var19_f.Caption  := FormatFloat('#,###0',FieldByName('var19_f').AsFloat); //20180912 jhg 이직-비자발적이직
         var20_m.Caption  := FormatFloat('#,###0',FieldByName('var20_m').AsFloat); //20180912 jhg 이직-기타
         var20_f.Caption  := FormatFloat('#,###0',FieldByName('var20_f').AsFloat); //20180912 jhg 이직-기타

       //  Next;
      end;
   //end;
end;

procedure TFM_PRINT.Q_REP1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
   iIdx : Integer;
begin
  //2015.01.30 하은영 여러장 출력할 수 있도록 수정 (오류로 주석처리)

{
//      showmessage( intTostr(giPageCnt) + '\\' +   intTostr( PIB30201F.Ora_print.RecordCount)) ;
   if FM_PKC2120C.FG_PageCnt > FM_PKC2120C.Ora_Qry1.RecordCount then
   begin
      MoreData := False;
      Exit;
   end
   else
   begin
      MoreData := True;
      Q_REP1.NewPage;
      Inc(FM_PKC2120C.FG_PageCnt);
   end;
   }

end;

procedure TFM_PRINT.Q_REP1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

  //2015.01.30 하은영 여러장 출력할 수 있도록 수정
   FM_PKC2120C.Ora_Qry1.first;

end;

end.
