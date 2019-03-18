unit Pkg20203;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, ExtCtrls, Qrprntr,
  Pkg20201, quickrpt, Qrctrls, Func, peprnview;
type
  TPrintForm = class(TForm)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLsysdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand_Detail: TQRBand;
    QReport: TQuickRep;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_KindOfOrder: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_lickind: TQRLabel;
    QRL_licgr: TQRLabel;
    QRL_licgetdate: TQRLabel;
    QRLabel2: TQRLabel;
    QRL_liceamt: TQRLabel;
    QRBand2: TQRBand;
    QRL_TotalRecord: TQRLabel;
    QRShape6: TQRShape;
    QRL_Total: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRL_licaldate: TQRLabel;
    QRL_Inwon: TQRLabel;
    QRLabel6: TQRLabel;
    QRL_licalfield: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRL_MSGempno: TQRLabel;
    QRL_MSGdept: TQRLabel;
    QRL_MSGlickind: TQRLabel;
    QRBand_subtotal: TQRChildBand;
    QRL_subtitle: TQRLabel;
    QRShape4: TQRShape;
    QRL_subtotal: TQRLabel;
    procedure QReportBeforePrint(sender:TQuickRep; var PrintReport: Boolean);
    procedure QReportNeedData(sender:TObject; var MoreData: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QReportPreview(Sender: TObject);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    liceamt: real;
    // jeon jin taek
    user_preview : Boolean;
  end;

var
  PrintForm: TPrintForm;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000
  cnt: Integer;

implementation

uses pkg20202;
{$R *.DFM}

var
  Old_Key, Cur_Key: string;
  Sum_SubTotal, Sum_Total: Real;
  Sum_SubInwon, Sum_Inwon: Integer;
  SkipPage: Boolean;
  
procedure TPrintForm.QReportBeforePrint(sender: TQuickRep; var PrintReport: Boolean);
begin
     MainForm.Query_Search.first;

     QRLsysdate.Caption := InMask(RemoveChar(MainForm.Lsysdate.Caption,'/'),'@@@@.@@.@@');
     QRBand_subtotal.Enabled := False; {소계 band}
     if MainForm.RB_empno.Checked then
          Old_Key := ''
     else if MainForm.RB_deptcode.Checked then
          Old_Key := MainForm.Query_Search.FieldByName('DEPTCODE').AsString
     else
          Old_Key := MainForm.Query_Search.FieldByName('LICKIND').AsString;

     Sum_SubTotal := 0.0;
     Sum_Total    := 0.0;
     Sum_SubInwon := 0;
     Sum_Inwon    := 0;

     SkipPage     := False;
     cnt := 0;
     Cur_Key      := '';
end;

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
    MainForm.Gauge1.Progress := (cnt * 100) div MainForm.Query_Search.RecordCount;
    Application.ProcessMessages;

    QRBand_Detail.Enabled  := True;
    QRL_empno.Caption      := MainForm.Query_Search.FieldByName('EMPNO').AsString;
    QRL_korname.Caption    := MainForm.Query_Search.FieldByName('KORNAME').AsString;
    QRL_lickind.Caption    := GetCodeName('I231', MainForm.Query_Search.FieldByName('LICKIND').AsString);
    QRL_licgr.Caption      := GetCodeName('I232', MainForm.Query_Search.FieldByName('LICGR').AsString);
    if MainForm.Query_Search.FieldByName('LICGETDATE').AsString <> '' then
      QRL_licgetdate.Caption := Copy(MainForm.Query_Search.FieldByName('LICGETDATE').AsString,1,4)+'.'+
                                Copy(MainForm.Query_Search.FieldByName('LICGETDATE').AsString,5,2)+'.'+
                                Copy(MainForm.Query_Search.FieldByName('LICGETDATE').AsString,7,2)
    else
      QRL_licgetdate.Caption := '';

    if MainForm.Query_Search.FieldByName('LICALDATE').AsString <> '' then
      QRL_licaldate.Caption := Copy(MainForm.Query_Search.FieldByName('LICALDATE').AsString,1,4)+'.'+
                                Copy(MainForm.Query_Search.FieldByName('LICALDATE').AsString,5,2)+'.'+
                                Copy(MainForm.Query_Search.FieldByName('LICALDATE').AsString,7,2)
    else
      QRL_licaldate.Caption := '';
    QRL_licalfield.Caption  := MainForm.Query_Search.FieldByName('LICALFIELD').AsString;
    QRL_liceamt.Caption     := Format('%12.0n', [liceamt]);

    Sum_SubTotal := Sum_SubTotal + liceamt;
    Sum_Total := Sum_Total + liceamt;
    Inc(Sum_SubInwon);
    Inc(Sum_Inwon);

    MainForm.Query_Search.Next;

    if MainForm.RB_empno.Checked then
    begin
      Cur_Key := '';
    end
    else if MainForm.RB_deptcode.Checked then {부서별}
    begin
      Cur_Key := MainForm.Query_Search.FieldByName('DEPTCODE').AsString;
      if (Old_Key <> Cur_Key) or (MainForm.Query_Search.Eof) then
      begin
        QRBand_subtotal.Enabled := True;
        QRL_subtitle.Caption := GetDeptName(MainForm.E_orgnum.Text, Old_Key)+' : '+
                                IntToStr(Sum_SubInwon);
        QRL_subtotal.Caption := Format('%12.0n', [Sum_SubTotal]);
        Old_Key := Cur_Key;
        Sum_SubInwon := 0;
        Sum_SubTotal := 0;
        SkipPage := True;
      end;
    end
    else
    begin
      Cur_Key := MainForm.Query_Search.FieldByName('LICKIND').AsString;
      if (Old_Key <> Cur_Key) or (MainForm.Query_Search.Eof) then
      begin
        QRBand_subtotal.Enabled := True;
        QRL_subtitle.Caption := GetCodeName('I231', Old_Key)+' : '+
                                IntToStr(Sum_SubInwon);
        QRL_subtotal.Caption := Format('%12.0n', [Sum_Subtotal]);
        Old_Key := Cur_Key;
        Sum_SubInwon := 0;
        Sum_SubTotal := 0;
        SkipPage := True;
      end;
    end;

    if MainForm.Query_Search.Eof then
    begin
      QRL_Total.Caption := Format('%12.0n', [Sum_Total]);
      QRL_Inwon.Caption := IntToStr(Sum_Inwon);
    end;
    MoreData := True;
  end;
end;


// jeon jin taek
procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := cafree;
end;

procedure TPrintForm.QReportPreview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
   Fm_PreviewForm.Show;
end;

procedure TPrintForm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   if self.user_preview then  PreviewForm.show;
end;

end.
