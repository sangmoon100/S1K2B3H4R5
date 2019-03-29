{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2030C(부서/직급별 인원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김영대
Version         : 1.01
Date            : 1998.4.15
Update contents
  버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -         마지막 빈페이지 출력 수정
--------------------------------------------------------------------------------
}
unit pie20502;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, pie20501, DB, DBTables,
  Qrctrls, QuickRpt, PeQuickRepPrn;

type
  TPrintForm = class(TForm)
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
    QRShape13: TQRShape;
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
    QRShape11: TQRShape;
    QRL_ptempsum: TQRLabel;
    QRShape45: TQRShape;
    QRShape20: TQRShape;
    InReport: TQuickRep;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRBand_Deli: TQRChildBand;
    QRShape3: TQRShape;
    QRBand_comment: TQRChildBand;
    QRL_comment: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
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
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape43: TQRShape;
    QRLabel1: TQRLabel;
    QRShape44: TQRShape;
    QRShape6: TQRShape;
    QRShape34: TQRShape;
    QRLabel8: TQRLabel;
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
  PrintForm: TPrintForm;
  DataIn   : pie20501.TDataIn;
  Fin      : file of pie20501.TDataIn;
  FCom     : Textfile;
  RecCount : Integer;
implementation

{$R *.DFM}

uses
  PePrnview;

procedure TPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
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
  //RBand_Header1.Enabled := True;
end;

procedure TPrintForm.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
  System.Close(FCom);
end;

procedure TPrintForm.InReportNeedData(Sender: TObject;
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
        QRL_pspe.Caption     := '';
        QRL_pemp.Caption     := '';
        QRL_pextrsum.Caption := '';
        QRL_psum.Caption     := '';
        QRL_ptempsum.Caption := '';

        Read(Fin, DataIn);
        QRL_deptname.Caption := deptname;
        if trim(ttotal) <> '()'   then QRL_ttotal.Caption   := ttotal;
        if trim(ptotal) <> '()'   then QRL_ptotal.Caption   := ptotal;
        if trim(pdirsum) <> '()'  then QRL_pdirsum.Caption  := pdirsum;
        if trim(ppos1) <> '()'    then QRL_ppos1.Caption    := ppos1;
        if trim(ppos2) <> '()'    then QRL_ppos2.Caption    := ppos2;
        if trim(ppos3) <> '()'    then QRL_ppos3.Caption    := ppos3;
        if trim(ppos4) <> '()'    then QRL_ppos4.Caption    := ppos4;
        if trim(ppos5) <> '()'    then QRL_ppos5.Caption    := ppos5;
        if trim(ppos6) <> '()'    then QRL_ppos6.Caption    := ppos6;
        if trim(ppos7) <> '()'    then QRL_ppos7.Caption    := ppos7;
        if trim(pspe) <> '()'     then QRL_pspe.Caption     := pspe;
        if trim(pemp) <> '()'     then QRL_pemp.Caption     := pemp;
        if trim(pextrsum) <> '()' then QRL_pextrsum.Caption := pextrsum;
        if trim(psum) <> '()'     then QRL_psum.Caption     := psum;
        if trim(ptempsum) <> '()' then QRL_ptempsum.Caption := ptempsum;
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
{-----------------------------------------------------------------------
   버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -           인쇄할 데이터가 존재하지 않을 경우
                                               새로운 페이지를 생성하지 않는다.
-----------------------------------------------------------------------}
//         inReport.NewPage; 수정전
           if not EOF(Fin) then inReport.NewPage;
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
{-----------------------------------------------------------------------
   버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -           인쇄할 데이터가 존재하지 않을 경우
                                               새로운 페이지를 생성하지 않는다.
-----------------------------------------------------------------------}
//            inReport.NewPage; 수정전
              if not EOF(Fin) then inReport.NewPage;
           end else QRL_comment.Caption := Buff;
           MoreData := True;
        end else MoreData := False;
    end;
end;

procedure TPrintForm.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

end.

 