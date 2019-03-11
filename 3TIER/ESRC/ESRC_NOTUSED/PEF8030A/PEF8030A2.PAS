unit pef8030a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, common,  Db, Tmax_DataSetText;

type
  TPrintForm1 = class(TForm)
    DB_COMDET: TTMaxDataSet;
    PeQuickRepPrn1: TPeQuickRepPrn;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    A_DetailBand: TQRSubDetail;
    QRShape39: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape32: TQRShape;
    QRShape30: TQRShape;
    QRShape57: TQRShape;
    QRShape28: TQRShape;
    QRShape36: TQRShape;
    QRShape45: TQRShape;
    QRLabel31: TQRLabel;
    QRL_SeqnoA: TQRLabel;
    QRShape38: TQRShape;
    QRL_task1A: TQRLabel;
    QRShape29: TQRShape;
    QRShape46: TQRShape;
    QRShape50: TQRShape;
    QRShape47: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape31: TQRShape;
    QRLabel19: TQRLabel;
    QRShape34: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape35: TQRShape;
    QRLabel25: TQRLabel;
    QRShape37: TQRShape;
    QRLabel35: TQRLabel;
    QRShape27: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape40: TQRShape;
    QRLabel16: TQRLabel;
    QRShape42: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape20: TQRShape;
    QRL_Plan1A: TQRLabel;
    QRShape19: TQRShape;
    QRL_detweight1: TQRLabel;
    QRL_validxA: TQRLabel;
    QRL_result1s: TQRLabel;
    QRL_result1a: TQRLabel;
    QRL_result1b: TQRLabel;
    QRL_result1c: TQRLabel;
    QRL_result1d: TQRLabel;
    QRL_Foraim1A: TQRLabel;
    QRL_Plan2A: TQRLabel;
    QRL_Plan3A: TQRLabel;
    QRL_Plan4A: TQRLabel;
    QRL_Plan5A: TQRLabel;
    QRL_detweight2: TQRLabel;
    QRL_detweight3: TQRLabel;
    QRL_detweight4: TQRLabel;
    QRL_detweight5: TQRLabel;
    QRL_validxA2: TQRLabel;
    QRL_validxA3: TQRLabel;
    QRL_validxA4: TQRLabel;
    QRL_validxA5: TQRLabel;
    QRL_Foraim2A: TQRLabel;
    QRL_Foraim3A: TQRLabel;
    QRL_Foraim4A: TQRLabel;
    QRL_Foraim5A: TQRLabel;
    QRL_result2s: TQRLabel;
    QRL_result3s: TQRLabel;
    QRL_result4s: TQRLabel;
    QRL_result5s: TQRLabel;
    QRL_result2a: TQRLabel;
    QRL_result3a: TQRLabel;
    QRL_result4a: TQRLabel;
    QRL_result5a: TQRLabel;
    QRL_result2b: TQRLabel;
    QRL_result3b: TQRLabel;
    QRL_result4b: TQRLabel;
    QRL_result5b: TQRLabel;
    QRL_result2c: TQRLabel;
    QRL_result3c: TQRLabel;
    QRL_result4c: TQRLabel;
    QRL_result5c: TQRLabel;
    QRL_result2d: TQRLabel;
    QRL_result3d: TQRLabel;
    QRL_result4d: TQRLabel;
    QRL_result5d: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    PageHeaderBand2: TQRChildBand;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRL_JobgunName: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_Empno: TQRLabel;
    QRL_Deptname: TQRLabel;
    QRL_Korname: TQRLabel;
    QRLabel2: TQRLabel;
    QRL_Spedate: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    GroupFooterBand: TQRBand;
    QRShape54: TQRShape;
    QRShape53: TQRShape;
    QRShape84: TQRShape;
    QRShape83: TQRShape;
    QRShape75: TQRShape;
    QRShape74: TQRShape;
    QRShape69: TQRShape;
    QRShape66: TQRShape;
    QRShape68: TQRShape;
    QRL_E1Empno: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRL_E1Korname: TQRLabel;
    QRL_E1Deptname: TQRLabel;
    QRL_E1Prjcondate: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  private
    { Private declarations }
   empno     : string;
   orgnum    : string;
   deptcode  : string;
   codeno    : string;
   jobgubun  : String;
   cut_length: integer;
   GSeqno    : integer;

   istr, iend : integer;

   procedure InitQrLabel;
   Procedure GetPageHeader;
   procedure GetRabasdate;

  public
    { Public declarations }
   rabasdate : string;
  end;

var
  PrintForm1: TPrintForm1;

implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, PePrnview, PEF8030A1, peDm;


procedure TPrintForm1.GetRabasdate;
var
  Sqltext : string;
  DateFr,DateTo : string;
begin
  QRL_Spedate.Caption := copy(rabasdate,1,4) + '년'; //'2005 년 상반기';
end;

procedure TPrintForm1.PeQuickRepPrn1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,PeQuickRepPrn1);
  Fm_PreviewForm.Show;
  Fm_PreviewForm.Qr_Preview.OnProgressUpdate := nil;
end;


procedure TPrintForm1.InitQrLabel;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TQRMemo then
       if TQRMemo(Components[i]).Tag = 99 then
       begin
         TQRMemo(Components[i]).Lines.Clear;
         TQRMemo(Components[i]).Lines.Text := '';
       end;
    if Components[i] is TQRLabel then
       if TQRLabel(Components[i]).Tag = 99 then
       begin
         TQRLabel(Components[i]).Caption := '';
       end;
  end;
end;

procedure TPrintForm1.PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
   value1, value2 : string;
   Sqltext : String;
begin
   QRL_Empno.Caption := '';
   QRL_Korname.Caption := '';
   QRL_Deptname.Caption := '';

   QRL_E1Korname.Caption := '';
   QRL_E1Empno.Caption := '';
   QRL_E1Deptname.Caption := '';
   QRL_E1Prjcondate.Caption := '';

   GetRabasdate; //평가대상기간
   GetPageHeader;

  GSeqno  := 0;

  istr:= 0;

  iend:= FM_Main.DBSet1.recordcount;
end;

procedure TPrintForm1.A_DetailBandNeedData(Sender: TObject;  var MoreData: Boolean);
begin
   InitQrLabel;

   if istr = iend then
     Moredata := false
   else
   begin
     Moredata := true;
   end;

   QRL_task1A.Caption     := FM_Main.DBSet1.FieldByName('propeltask').AsString;
   QRL_Plan1A.Caption     := FM_Main.DBSet1.FieldByName('detailtask1').AsString;          //세부추진활동
   QRL_Plan2A.Caption     := FM_Main.DBSet1.FieldByName('detailtask2').AsString;
   QRL_Plan3A.Caption     := FM_Main.DBSet1.FieldByName('detailtask3').AsString;
   QRL_Plan4A.Caption     := FM_Main.DBSet1.FieldByName('detailtask4').AsString;
   QRL_Plan5A.Caption     := FM_Main.DBSet1.FieldByName('detailtask5').AsString;
   QRL_detweight1.Caption := FM_Main.DBSet1.FieldByName('detailweight1').AsString;        //상세비중
   QRL_detweight2.Caption := FM_Main.DBSet1.FieldByName('detailweight2').AsString;
   QRL_detweight3.Caption := FM_Main.DBSet1.FieldByName('detailweight3').AsString;
   QRL_detweight4.Caption := FM_Main.DBSet1.FieldByName('detailweight4').AsString;
   QRL_detweight5.Caption := FM_Main.DBSet1.FieldByName('detailweight5').AsString;
   QRL_validxA.Caption    := FM_Main.DBSet1.FieldByName('validx1').AsString;              //평가지표
   QRL_validxA2.Caption   := FM_Main.DBSet1.FieldByName('validx2').AsString;
   QRL_validxA3.Caption   := FM_Main.DBSet1.FieldByName('validx3').AsString;
   QRL_validxA4.Caption   := FM_Main.DBSet1.FieldByName('validx4').AsString;
   QRL_validxA5.Caption   := FM_Main.DBSet1.FieldByName('validx5').AsString;
   QRL_Foraim1A.Caption   := FM_Main.DBSet1.FieldByName('valfunction1').AsString;         //평가산식
   QRL_Foraim2A.Caption   := FM_Main.DBSet1.FieldByName('valfunction2').AsString;
   QRL_Foraim3A.Caption   := FM_Main.DBSet1.FieldByName('valfunction3').AsString;
   QRL_Foraim4A.Caption   := FM_Main.DBSet1.FieldByName('valfunction4').AsString;
   QRL_Foraim5A.Caption   := FM_Main.DBSet1.FieldByName('valfunction5').AsString;
   QRL_result1s.Caption   := FM_Main.DBSet1.FieldByName('Sresultclass1').AsString;        //달성목표
   QRL_result1a.Caption   := FM_Main.DBSet1.FieldByName('Aresultclass1').AsString;
   QRL_result1b.Caption   := FM_Main.DBSet1.FieldByName('Bresultclass1').AsString;
   QRL_result1c.Caption   := FM_Main.DBSet1.FieldByName('Cresultclass1').AsString;
   QRL_result1d.Caption   := FM_Main.DBSet1.FieldByName('Dresultclass1').AsString;
   QRL_result2s.Caption   := FM_Main.DBSet1.FieldByName('Sresultclass2').AsString;        //달성목표
   QRL_result2a.Caption   := FM_Main.DBSet1.FieldByName('Aresultclass2').AsString;
   QRL_result2b.Caption   := FM_Main.DBSet1.FieldByName('Bresultclass2').AsString;
   QRL_result2c.Caption   := FM_Main.DBSet1.FieldByName('Cresultclass2').AsString;
   QRL_result2d.Caption   := FM_Main.DBSet1.FieldByName('Dresultclass2').AsString;
   QRL_result3s.Caption   := FM_Main.DBSet1.FieldByName('Sresultclass3').AsString;        //달성목표
   QRL_result3a.Caption   := FM_Main.DBSet1.FieldByName('Aresultclass3').AsString;
   QRL_result3b.Caption   := FM_Main.DBSet1.FieldByName('Bresultclass3').AsString;
   QRL_result3c.Caption   := FM_Main.DBSet1.FieldByName('Cresultclass3').AsString;
   QRL_result3d.Caption   := FM_Main.DBSet1.FieldByName('Dresultclass3').AsString;
   QRL_result4s.Caption   := FM_Main.DBSet1.FieldByName('Sresultclass4').AsString;        //달성목표
   QRL_result4a.Caption   := FM_Main.DBSet1.FieldByName('Aresultclass4').AsString;
   QRL_result4b.Caption   := FM_Main.DBSet1.FieldByName('Bresultclass4').AsString;
   QRL_result4c.Caption   := FM_Main.DBSet1.FieldByName('Cresultclass4').AsString;
   QRL_result4d.Caption   := FM_Main.DBSet1.FieldByName('Dresultclass4').AsString;
   QRL_result5s.Caption   := FM_Main.DBSet1.FieldByName('Sresultclass5').AsString;        //달성목표
   QRL_result5a.Caption   := FM_Main.DBSet1.FieldByName('Aresultclass5').AsString;
   QRL_result5b.Caption   := FM_Main.DBSet1.FieldByName('Bresultclass5').AsString;
   QRL_result5c.Caption   := FM_Main.DBSet1.FieldByName('Cresultclass5').AsString;
   QRL_result5d.Caption   := FM_Main.DBSet1.FieldByName('Dresultclass5').AsString;

   FM_Main.DBSet1.Next;

   inc(istr);
end;

Procedure TPrintForm1.GetPageHeader;
var SqlText : String;
begin
  with FM_Main.TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT  A.EMPNO, A.KORNAME, A.E1EMPNO, A.E1KORNAME,  '+
                '   (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME '+
                '  FROM PEJNOMAS A '+
                ' where rabasdate = '''+ FM_Main.Lrabasdate +''' ' +
                '   AND EMPNO     = '''+ Copy(FM_Main.Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'    , ftString, 100);
    AddField('KORNAME'  , ftString, 100);
    AddField('E1EMPNO'  , ftString, 100);
    AddField('E1KORNAME', ftString, 100);
    AddField('DEPTNAME' , ftString, 100);
    SQL.Text := SqlText;
    Open;

    QRL_Empno.Caption       := FieldByName('EMPNO').AsString;
    QRL_Korname.Caption     := FieldByName('KORNAME').AsString;
    QRL_Deptname.Caption    := FieldByName('DEPTNAME').AsString;
    QRL_E1korname.Caption   := FieldByName('E1EMPNO').AsString;
    QRL_E1Empno.Caption     := FieldByName('E1KORNAME').AsString;
    QRL_E1Deptname.Caption  := FieldByName('DEPTNAME').AsString;
  end;
end;

procedure TPrintForm1.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  PageHeaderBand1.Enabled := False;
end;

end.
