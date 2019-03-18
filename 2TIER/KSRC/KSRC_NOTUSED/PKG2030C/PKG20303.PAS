        unit Pkg20303;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, ExtCtrls, quickrpt, Qrprntr,
  Qrctrls, Func, Ora, peprnview;

type
  TPrintForm = class(TForm)
    QReport: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLsysdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand_Detail: TQRBand;
    QRL_empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_dept: TQRLabel;
    QRL_PREliceamt: TQRLabel;
    QRL_CURliceamt: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_DIFFliceamt: TQRLabel;
    QRBand2: TQRBand;
    QRShape6: TQRShape;
    QRL_Total1: TQRLabel;
    QRL_Total2: TQRLabel;
    QRL_Total3: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRL_Inwon: TQRLabel;
    QRL_TotalRecord: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_KindOfOrder: TQRLabel;
    QRLabel8: TQRLabel;
    QRL_bonyymm: TQRLabel;
    QRLabel12: TQRLabel;
    QRL_payyn: TQRLabel;
    QRLabel16: TQRLabel;
    QRL_pstate: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRBand_subtotal: TQRChildBand;
    QRShape8: TQRShape;
    QRL_subtitle: TQRLabel;
    QRShape4: TQRShape;
    QRL_subtotal1: TQRLabel;
    QRL_subtotal2: TQRLabel;
    QRL_subtotal3: TQRLabel;
    procedure QReportNeedData(sender:TObject;      var MoreData: Boolean);
    procedure QReportPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    // jeon jin taek
    user_preview : Boolean;
  end;

var
  PrintForm: TPrintForm;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000

implementation

uses Pkg20301;

{$R *.DFM}

var
  Old_Key, Cur_Key: string;
  Sum_SubTotal1, Sum_SubTotal2, Sum_SubTotal3: Real;
  Sum_Total1,    Sum_Total2,    Sum_Total3: Real;
  Sum_SubInwon, Sum_Inwon: Integer;
  SkipPage: Boolean;
  cnt: Integer;

procedure TPrintForm.QReportNeedData(sender:TObject; var MoreData: Boolean);
begin
     if MainForm.Query_Search.Eof then
     begin
          MoreData := False;
     end
     else
     begin
          QRBand_subtotal.Enabled := False;
          QRBand_Detail.Enabled   := False;

          if SkipPage then
          begin
               QReport.NewPage;
               SkipPage := False;
               MoreData := True;
               System.Exit;
          end;

          Inc(cnt);
          MainForm.Phelpmsg.Caption := '  ['+IntToStr(cnt)+' / '+IntToStr(MainForm.Query_Search.RecordCount)+']';
          MainForm.Gauge1.Progress  := (cnt * 100) div MainForm.Query_Search.RecordCount;
          Application.ProcessMessages;

          QRBand_Detail.Enabled  := True;
          QRL_empno.Caption      := MainForm.Query_Search.FieldByName('EMPNO').AsString;
          QRL_korname.Caption    := MainForm.Query_Search.FieldByName('KORNAME').AsString;
          QRL_dept.Caption       := GetDeptName(MainForm.Query_Search.FieldByName('ORGNUM').AsString ,
                                                MainForm.Query_Search.FieldByName('DEPTCODE').AsString);
          QRL_pstate.Caption     := GetCodeName('I114', MainForm.Query_Search.FieldByName('PSTATE').AsString);
          QRL_PREliceamt.Caption := Format('%9.0n', [MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat]);
          QRL_CURliceamt.Caption := Format('%9.0n', [MainForm.Query_Search.FieldByName('LICEAMT').AsFloat]);
          QRL_payyn.Caption      := MainForm.Query_Search.FieldByName('PAYYN').AsString;

          if (MainForm.Query_Search.FieldByName('LICEAMT').AsFloat -
              MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat) >= 0
          then
            QRL_DIFFliceamt.Caption := '+ '
          else
            QRL_DIFFliceamt.Caption := '- ';
          QRL_DIFFliceamt.Caption := QRL_DIFFliceamt.Caption +
                   Format('%9.0n', [System.abs(MainForm.Query_Search.FieldByName('LICEAMT').AsFloat -
                                               MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat)]);

          Sum_SubTotal1 := Sum_SubTotal1 + MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat;
          Sum_SubTotal2 := Sum_SubTotal2 + MainForm.Query_Search.FieldByName('LICEAMT').AsFloat;
          Sum_SubTotal3 := Sum_SubTotal3 + (MainForm.Query_Search.FieldByName('LICEAMT').AsFloat -
                                            MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat);

          Sum_Total1 := Sum_Total1 + MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat;
          Sum_Total2 := Sum_Total2 + MainForm.Query_Search.FieldByName('LICEAMT').AsFloat;
          Sum_Total3 := Sum_Total3 + (MainForm.Query_Search.FieldByName('LICEAMT').AsFloat -
                                      MainForm.Query_Search.FieldByName('E_PKMCALC').AsFloat);
          Inc(Sum_SubInwon);
          Inc(Sum_Inwon);
          MainForm.Query_Search.Next;

          if MainForm.RB_empno.Checked then
               Cur_Key := ''
          else
          begin
               Cur_Key := MainForm.Query_Search.FieldByName('DEPTCODE').AsString;
               if (Old_Key <> Cur_Key) or (MainForm.Query_Search.Eof) then
               begin
                    QRBand_subtotal.Enabled := True;
                    QRL_subtitle.Caption := GetDeptName(MainForm.Max_orgnum, Old_Key)+' : '+
                                            IntToStr(SUM_SubInwon);
                    QRL_subtotal1.Caption := Format('%12.0n', [Sum_SubTotal1]);
                    QRL_subtotal2.Caption := Format('%12.0n', [Sum_SubTotal2]);
                    QRL_subtotal3.Caption := Format('%12.0n', [Sum_SubTotal3]);
                    Old_Key := Cur_Key;
                    Sum_SubTotal1 := 0;
                    Sum_SubTotal2 := 0;
                    Sum_SubTotal3 := 0;
                    Sum_SubInwon := 0;
                    SkipPage := True;
               end;
          end;

          if MainForm.Query_Search.Eof then
          begin
               QRL_Total1.Caption := Format('%12.0n', [Sum_Total1]);
               QRL_Total2.Caption := Format('%12.0n', [Sum_Total2]);
               QRL_Total3.Caption := Format('%12.0n', [Sum_Total3]);
               QRL_Inwon.Caption := IntToStr(Sum_Inwon);
          end;
          MoreData := True;
     end;
end;



// jeon jin taek
procedure TPrintForm.QReportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
     Fm_PreviewForm.Show;
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action := cafree;
end;

procedure TPrintForm.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     MainForm.Query_Search.first;

     QRLsysdate.Caption := Copy(MainForm.Lsysdate.Caption,1,4) + '.' +
                           Copy(MainForm.Lsysdate.Caption,6,2) + '.' +
                           Copy(MainForm.Lsysdate.Caption,9,2);

     QRBand_subtotal.Enabled := False; {소계 band}

     if MainForm.RB_empno.Checked then
          Old_Key := ''
     else
          Old_Key := MainForm.Query_Search.FieldByName('DEPTCODE').AsString;

     Sum_SubTotal1 := 0;
     Sum_SubTotal2 := 0;
     Sum_SubTotal3 := 0;
     Sum_Total1    := 0;
     Sum_Total2    := 0;
     Sum_Total3    := 0;
     cnt := 0;

     Sum_SubInwon := 0;
     Sum_Inwon    := 0;
     SkipPage     := False;
end;

end.
