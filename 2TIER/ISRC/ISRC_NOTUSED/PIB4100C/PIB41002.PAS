unit Pib41002;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CodeLib,
  Dept1Lib, TimeFtp;

type
  TFpib41002 = class(TForm)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLsysdate: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRSysData2: TQRSysData;
    QRShape5: TQRShape;
    QRDBTkorname: TQRDBText;
    QRLdeptname1: TQRLabel;
    QRLdeptname2: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLschgrname1: TQRLabel;
    QRLschgrname2: TQRLabel;
    QRLschnm1: TQRLabel;
    QRLschnm2: TQRLabel;
    QRShape11: TQRShape;
    QRLmajorname1: TQRLabel;
    QRLmajorname2: TQRLabel;
    QRShape12: TQRShape;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLJobGubun: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRDBTempno: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel3: TQRLabel;
    QRLkorage: TQRLabel;
    Query1: TQuery;
    DataSource1: TDataSource;
    QRLjoblinename: TQRLabel;
    QRShape21: TQRShape;
    QRLempdate: TQRLabel;
    QRShape22: TQRShape;
    QRLcpaycldate: TQRLabel;
    QRLschtoyy1: TQRLabel;
    QRLschtoyy2: TQRLabel;
    QRLpayclname: TQRLabel;
    QRDBTpaygr: TQRDBText;
    Query2: TQuery;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QReport: TQuickRep;
    QRShape25: TQRShape;
    QRShape3: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    procedure QReportBeforePrint(var PrintReport: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
    procedure QReportPreview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    LICcount : integer;
    LITcount : integer;
    LSsort : string;
    procedure ReadPimscho;  {학력사항을 읽어온다}
  public
    { Public declarations }
  end;

var
  Fpib41002: TFpib41002;

implementation

{$R *.DFM}
uses Pib41001,peprnView;

procedure TFpib41002.QReportBeforePrint(var PrintReport: Boolean);
var
   SysDate : string;
begin
     LICcount := 0;
     if Fpib41001.GJobGubun = 3 then
        begin
             QRLJobGubun.Caption := 'BAND/소속순';
             LSsort := 'ORDER BY PAYCL, DEPTCODE, PAYRA, PAYGR, EMPNO';
        end
     else if Fpib41001.GJobGubun = 2 then
        begin
             QRLJobGubun.Caption := '소속/BAND순';
             LSsort := 'ORDER BY DEPTCODE, PAYCL, PAYRA, PAYGR, EMPNO';
        end
     else
        begin
             QRLJobGubun.Caption := '직군/BAND순';
             LSsort := 'ORDER BY JOBGUN, PAYCL, DEPTCODE, PAYRA, PAYGR, EMPNO';
        end;

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT EMPNO, KORNAME, ORGNUM, DEPTCODE, KORAGE, ');
     Query1.SQL.ADD('        JOBLINE, JOBGUN, PAYCL, PAYGR, EMPDATE, CPAYCLDATE ');
     Query1.SQL.ADD(' FROM  PIMPMAS ');
     Query1.SQL.ADD(' WHERE PSTATE < ''60'' AND');   {60 : 정직}
{     Query1.SQL.ADD('       PAYRA >= ''100'' AND PAYRA < ''400'' AND');                      }
     Query1.SQL.ADD('       NVL(JOBPAYRAYN, ''X'') NOT IN (''Y'', ''y'') ');   //보임여부 Not Y/y
{  1.01   1998.12.23    김혜진  직렬->직군,급호=>직급
                               미보임자추출조건 변경.
                               -> 직위가 미보임(71~84)이고 직급이 관리자급(M1~SM2)인 사원     }
//     Query1.SQL.ADD('       (PAYRA >= ''71'' AND PAYRA < ''H1'') AND');
//     Query1.SQL.ADD('       (PAYCL <= ''23'' AND PAYCL >= ''11'')  ');
     Query1.SQL.ADD(LSsort);
     Query1.Open;
     LITcount := Query1.RecordCount;
     SysDate := TimeDate(Fpib41001.Q_date);
     QRLsysdate.Caption := Copy(SysDate, 1, 4) + '/' + Copy(SysDate, 5, 2) + '/' +
                           Copy(SysDate, 7, 2);
end;

{procedure TFpib41002.QRBand2BeforePrint(var PrintBand: Boolean);
var
   CodeName : string;
   Deptname1 : string;
   Deptname2 : string;
   Deptname3 : string;
begin
     Inc(LICcount);
     Fpib41001.Gauge1.Progress :=
                               (LICcount * 100) div LITcount;
     if LITcount <= LICcount then
        Fpib41001.Gauge1.Progress := 100;

     DeptForm := TDeptForm.Create(self);     {소속명출력
     Try
        DeptName1 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 2);
        DeptName2 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 3);
        DeptName3 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 4);
        if (DeptName1 = '') and (DeptName2 = '') and (DeptName3 = '') then
           begin
                QRLdeptname1.Caption := Query1.FieldByName('orgnum').AsString;
                QRLdeptname2.Caption := Query1.FieldByName('deptcode').AsString;
           end
        else
           begin
                QRLdeptname1.Caption := DeptName1;
                QRLdeptname2.Caption := DeptName2 + ' ' + DeptName3;
           end;
     Finally
        DeptForm.Free;
     END;

     QRLkorage.Caption := '(' + Query1.FieldByName('korage').AsString + ')';

     CodeForm := TCodeForm.Create(self);     //코드명출력
//  1.01   1998.12.23    김혜진  직렬->직군,급호=>직급
     Try
        CodeName := CodeForm.QcodeDisp('I115', Query1.FieldByName('jobgun').AsString, 1);
        if CodeName = '' then
           QRLjoblinename.Caption := Query1.FieldByName('jobgun').AsString
        else
           QRLjoblinename.Caption := CodeName;
        CodeName := '';
        CodeName := CodeForm.QcodeDisp('I112', Query1.FieldByName('paycl').AsString, 1);
        if CodeName = '' then
           QRLpayclname.Caption := Query1.FieldByName('paycl').AsString
        else
           QRLpayclname.Caption := CodeName;
     Finally
        CodeForm.Free;
     END;

     QRLempdate.Caption := Copy(Query1.FieldByName('empdate').AsString, 1, 4) + '.' +
                           Copy(Query1.FieldByName('empdate').AsString, 5, 2) + '.' +
                           Copy(Query1.FieldByName('empdate').AsString, 7, 2);
     if Query1.FieldByName('cpaycldate').AsString <> '' then
        QRLcpaycldate.Caption := Copy(Query1.FieldByName('cpaycldate').AsString, 1, 4) + '.' +
                                 Copy(Query1.FieldByName('cpaycldate').AsString, 5, 2) + '.' +
                                 Copy(Query1.FieldByName('cpaycldate').AsString, 7, 2)
     else
        QRLcpaycldate.Caption := '';

     ReadPimscho;             //학력사항을 읽자
end;}

procedure TFpib41002.ReadPimscho;
var
   CodeName : string;
begin
     QRLschgrname1.Caption := '';
     QRLschnm1.Caption := '';
     QRLschtoyy1.Caption := '';
     QRLmajorname1.Caption := '';
     QRLschgrname2.Caption := '';
     QRLschnm2.Caption := '';
     QRLschtoyy2.Caption := '';
     QRLmajorname2.Caption := '';

     Query2.Close;
     Query2.SQL.Clear;
     Query2.SQL.ADD(' SELECT SCHGR, SCHNM, MAJORCODE, SCHTOYM ');
     Query2.SQL.ADD(' FROM PIMSCHO ');
     Query2.SQL.ADD(' WHERE EMPNO = ''' + Query1.FieldByName('empno').AsString + ''' ');
     Query2.SQL.ADD('   AND SCHRANK = 1 ');
     Query2.SQL.ADD(' ORDER BY SCHGR DESC ');
     Query2.Open;
     if Query2.RecordCount < 1 then
        System.Exit;

     CodeForm := TCodeForm.Create(self);
     Try
        CodeName := '';
        CodeName := CodeForm.QcodeDisp('I221', Query2.FieldByName('schgr').AsString, 1);
        if CodeName = '' then
           QRLschgrname1.Caption := Query2.FieldByName('schgr').AsString
        else
           QRLschgrname1.Caption := CodeName;
        QRLschnm1.Caption := Query2.FieldByName('schnm').AsString;
        CodeName := '';
        CodeName := CodeForm.QcodeDisp('I225', Query2.FieldByName('majorcode').AsString, 1);
        if CodeName = '' then
           QRLmajorname1.Caption := Query2.FieldByName('majorcode').AsString
        else
           QRLmajorname1.Caption := CodeName;
        QRLschtoyy1.Caption := Copy(Query2.FieldByName('schtoym').AsString, 3, 2);

        if Query2.RecordCount > 1 then
        begin
           QRLschgrname2.Caption := QRLschgrname1.Caption;
           QRLschnm2.Caption := QRLschnm1.Caption;
           QRLmajorname2.Caption := QRLmajorname1.Caption;
           QRLschtoyy2.Caption := QRLschtoyy1.Caption;
           Query2.Next;
           CodeName := '';
           CodeName := CodeForm.QcodeDisp('I221', Query2.FieldByName('schgr').AsString, 1);
           if CodeName = '' then
              QRLschgrname1.Caption := Query2.FieldByName('schgr').AsString
           else
              QRLschgrname1.Caption := CodeName;
           QRLschnm1.Caption := Query2.FieldByName('schnm').AsString;
           CodeName := '';
           CodeName := CodeForm.QcodeDisp('I225', Query2.FieldByName('majorcode').AsString, 1);
           if CodeName = '' then
              QRLmajorname1.Caption := Query2.FieldByName('majorcode').AsString
           else
              QRLmajorname1.Caption := CodeName;
           QRLschtoyy1.Caption := Copy(Query2.FieldByName('schtoym').AsString, 3, 2);
        end;
     Finally
        CodeForm.Free;
     END;
end;

procedure TFpib41002.QReportPreview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
   Fm_PreviewForm.Show;
end;

procedure TFpib41002.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   CodeName  : string;
   Deptname1 : string;
   Deptname2 : string;
   Deptname3 : string;
begin
     Inc(LICcount);
     Fpib41001.Gauge1.Progress :=
                               (LICcount * 100) div LITcount;
     if LITcount <= LICcount then
        Fpib41001.Gauge1.Progress := 100;

     DeptForm := TDeptForm.Create(self);     //소속명출력
     Try
        DeptName1 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 1);
{
        DeptName1 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 2);
        DeptName2 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 3);
        DeptName3 := DeptForm.QDeptDisp(Query1.FieldByName('deptcode').AsString,
                                        Query1.FieldByName('orgnum').AsString, 4);
}
        if (DeptName1 = '') and (DeptName2 = '') and (DeptName3 = '') then
           begin
                QRLdeptname1.Caption := Query1.FieldByName('orgnum').AsString;
                QRLdeptname2.Caption := Query1.FieldByName('deptcode').AsString;
           end
        else
           begin
                QRLdeptname1.Caption := DeptName1;
                QRLdeptname2.Caption := DeptName2 + ' ' + DeptName3;
           end;
     Finally
        DeptForm.Free;
     END;

     QRLkorage.Caption := '(' + Query1.FieldByName('korage').AsString + ')';

     CodeForm := TCodeForm.Create(self);     //코드명출력
//  1.01   1998.12.23    김혜진  직렬->직군,급호=>직급
     Try
        CodeName := CodeForm.QcodeDisp('I115', Query1.FieldByName('jobgun').AsString, 1);
        if CodeName = '' then
           QRLjoblinename.Caption := Query1.FieldByName('jobgun').AsString
        else
           QRLjoblinename.Caption := CodeName;
        CodeName := '';
        CodeName := CodeForm.QcodeDisp('I112', Query1.FieldByName('paycl').AsString, 1);
        if CodeName = '' then
           QRLpayclname.Caption := Query1.FieldByName('paycl').AsString
        else
           QRLpayclname.Caption := CodeName;
     Finally
        CodeForm.Free;
     END;

     QRLempdate.Caption := Copy(Query1.FieldByName('empdate').AsString, 1, 4) + '.' +
                           Copy(Query1.FieldByName('empdate').AsString, 5, 2) + '.' +
                           Copy(Query1.FieldByName('empdate').AsString, 7, 2);
     if Query1.FieldByName('cpaycldate').AsString <> '' then
        QRLcpaycldate.Caption := Copy(Query1.FieldByName('cpaycldate').AsString, 1, 4) + '.' +
                                 Copy(Query1.FieldByName('cpaycldate').AsString, 5, 2) + '.' +
                                 Copy(Query1.FieldByName('cpaycldate').AsString, 7, 2)
     else
        QRLcpaycldate.Caption := '';

     ReadPimscho;             //학력사항을 읽자

end;

end.

