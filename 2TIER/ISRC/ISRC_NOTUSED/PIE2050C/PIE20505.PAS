unit pie20505;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, pie20501, DB, DBTables,
  Qrctrls, QuickRpt, PeQuickRepPrn;

type
  TNewPrintForm = class(TForm)
    QRLabel24: TQRLabel;
    QRShape21: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRLabel31: TQRLabel;
    QRBand_Header: TQRBand;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRBand_Detail: TQRBand;
    QRL_deptname: TQRLabel;
    QRShape31: TQRShape;
    QRL_ttotal: TQRLabel;
    QRShape17: TQRShape;
    QRL_ptotal: TQRLabel;
    QRShape12: TQRShape;
    QRL_pdirsum: TQRLabel;
    QRL_ppos1: TQRLabel;
    QRShape14: TQRShape;
    QRL_ppos2: TQRLabel;
    QRL_ppos3: TQRLabel;
    QRShape18: TQRShape;
    QRL_ppos4: TQRLabel;
    QRShape19: TQRShape;
    QRL_ppos5: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRL_ppos6: TQRLabel;
    QRL_ppos7: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRL_pspe: TQRLabel;
    QRL_pemp: TQRLabel;
    QRShape35: TQRShape;
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    QRL_ptempsum: TQRLabel;
    QRShape45: TQRShape;
    QRShape20: TQRShape;
    InReport: TQuickRep;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRL_ppos8: TQRLabel;
    QRL_ppos9: TQRLabel;
    QRBand_Deli: TQRChildBand;
    QRShape3: TQRShape;
    QRBand_comment: TQRChildBand;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape46: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape43: TQRShape;
    QRLabel1: TQRLabel;
    QRShape44: TQRShape;
    QRShape34: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape27: TQRShape;
    QRShape15: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape16: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape55: TQRShape;
    QRLabel23: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape13: TQRShape;
    QRL_psconsum: TQRLabel;
    QRL_pcontsum: TQRLabel;
    QRL_pimsisum: TQRLabel;
    QRLabel36: TQRLabel;
    QRL_comment: TQRLabel;
    QRShape8: TQRShape;
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InReportPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPrintForm: TNewPrintForm;
  DataIn   : pie20501.TDataIn;
  Fin      : file of pie20501.TDataIn;
  FCom     : Textfile;
  RecCount : Integer;
implementation

{$R *.DFM}

uses
  PePrnview;

procedure TNewPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

  AssignFile(Fin, Pie20501.HomeDir+'\list\pie2050c.tmp');
  AssignFile(FCom,Pie20501.HomeDir+'\list\pie2050c.dat');
  System.Reset(Fin);   {open}
  System.Reset(FCom);  {open}
  System.Seek(Fin, 0); {FilePoint 0}

  RecCount  := 1;
  QRL_curdate.Caption  := MainForm.L_Date.Caption;
  QRL_WorkDate.Caption := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                          Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
end;

procedure TNewPrintForm.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
  System.Close(FCom);
end;

procedure TNewPrintForm.InReportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Buff: string;
begin
    if not Eof(Fin) then begin
      with DataIn do  begin
        QRL_ttotal.Caption   := '';
        QRL_ptotal.Caption   := '';
        QRL_pdirsum.Caption  := '';
        QRL_ppos1.Caption    := '';
        QRL_ppos2.Caption    := '';
        QRL_ppos3.Caption    := '';
        QRL_ppos4.Caption    := '';
        QRL_ppos5.Caption    := '';
        QRL_ppos6.Caption    := '';
        QRL_ppos7.Caption    := '';
        QRL_ppos8.Caption    := '';
        QRL_ppos9.Caption    := '';
        QRL_pspe.Caption     := '';
        QRL_pemp.Caption     := '';

        //민용 2003.07.21 전 2003-9433 오종석 요청 -> 비정규직 인원(전계, 계약, 일반, 계) 추가
        QRL_psconsum.Caption := '';  //전계
        QRL_pcontsum.Caption := '';  //계약
        QRL_pextrsum.Caption := '';  //일반
        QRL_ptempsum.Caption := '';  //과부족
        QRL_pimsisum.Caption := '';  //계
        QRL_psum.Caption     := '';  //총계

        Read(Fin, DataIn);
        QRL_deptname.Caption := deptname;
        if trim(ttotal) <> '()'   then QRL_ttotal.Caption   := ttotal;     //계획
        if trim(ptotal) <> '()'   then QRL_ptotal.Caption   := ptotal;     //현원
        if trim(pdirsum) <> '()'  then QRL_pdirsum.Caption  := pdirsum;    //임원
        if trim(ppos1) <> '()'    then QRL_ppos1.Caption    := ppos1;      //SM2
        if trim(ppos2) <> '()'    then QRL_ppos2.Caption    := ppos2;      //SM1
        if trim(ppos3) <> '()'    then QRL_ppos3.Caption    := ppos3;      //M2
        if trim(ppos4) <> '()'    then QRL_ppos4.Caption    := ppos4;      //M1
        if trim(ppos5) <> '()'    then QRL_ppos5.Caption    := ppos5;      //S2
        if trim(ppos6) <> '()'    then QRL_ppos6.Caption    := ppos6;      //S1
        if trim(ppos7) <> '()'    then QRL_ppos7.Caption    := ppos7;      //J3
        if trim(ppos8) <> '()'    then QRL_ppos8.Caption    := ppos8;      //J2
        if trim(ppos9) <> '()'    then QRL_ppos9.Caption    := ppos9;      //J1
        if trim(pspe) <> '()'     then QRL_pspe.Caption     := pspe;       //특정
        if trim(pemp) <> '()'     then QRL_pemp.Caption     := pemp;       //정규계

        //민용 2003.07.21 전 2003-9433 오종석 요청 -> 비정규직 인원(전계, 계약, 일반, 계) 추가
        if trim(psconsum) <> '()' then QRL_psconsum.Caption := psconsum;   //전계
        if trim(pcontsum) <> '()' then QRL_pcontsum.Caption := pcontsum;   //계약
        if trim(pextrsum) <> '()' then QRL_pextrsum.Caption := pextrsum;   //일반
        if trim(pimsisum) <> '()' then QRL_pimsisum.Caption := pimsisum;   //계
        if trim(psum) <> '()'     then QRL_psum.Caption     := psum;       //총계
        if trim(ptempsum) <> '()' then QRL_ptempsum.Caption := ptempsum;   //과부족
        MoreData := True;
        QRBand_Deli.Enabled    := False;
        QRBand_Detail.Enabled  := True;
        QRBand_comment.Enabled := False;
        if flag = 'S' then begin
           QRBand_Deli.Enabled   := True;
           QRBand_Detail.Enabled := False;
           system.Exit;
        end;
        if flag = 'P' then begin
           QRBand_Deli.Enabled   := False;
           QRBand_Detail.Enabled := False;
           //if EOF(Fin) then RBand_Header1.Enabled := False;
           //민용
           inReport.NewPage;
           system.Exit;
        end;
      end;
    end else begin
        //RBand_Header1.Enabled := False;
        QRBand_Deli.Enabled   := False;
        QRBand_Detail.Enabled := False;
        if not Eof(FCom) then begin
           QRBand_comment.Enabled := True;
           QRL_comment.Caption := '';
           ReadLn(FCom, Buff);
           if trim(Buff) = 'PAGESKIP' then begin
              inReport.NewPage;
           end else QRL_comment.Caption := Buff;
           MoreData := True;
        end else MoreData := False;
    end;
end;

procedure TNewPrintForm.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

end.

 