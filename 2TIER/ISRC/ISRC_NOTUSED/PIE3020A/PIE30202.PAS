unit PIE30202;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,  StdCtrls, ExtCtrls, PIE30201, DB, DBTables,
  Qrctrls, QuickRpt;

type
  TOldPrintForm = class(TForm)
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
    QRShape6: TQRShape;
    QRL_insuff: TQRLabel;
    QRShape11: TQRShape;
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
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    InReport: TQuickRep;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRL_ptotal: TQRLabel;
    QRBand_Deli: TQRChildBand;
    QRShape3: TQRShape;
    QRShape48: TQRShape;
    QRLabel9: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape66: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape67: TQRShape;
    QRShape49: TQRShape;
    QRLabel1: TQRLabel;
    QRBand_comment: TQRChildBand;
    QRL_comment: TQRLabel;
    QRShape_1: TQRShape;
    QRShape2: TQRShape;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Print_BumunLine, bbu : Boolean;
    bdeptname, start     : string;
    Fin      : file of PIE30201.TDataIn;
    FCom     : Textfile;
  end;

var
  OldPrintForm: TOldPrintForm;
  DataIn   : PIE30201.TDataIn;

implementation

{$R *.DFM}

procedure TOldPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(Fin, PIE30201.HomeDir+'\list\PIE3020A.tmp');
  AssignFile(FCom,PIE30201.HomeDir+'\list\PIE3020A.dat');
  System.Reset(Fin);   {open}
  System.Reset(FCom);  {open}
  System.Seek(Fin, 0); {FilePoint 0}
  QRL_curdate.Caption   := MainForm.L_Date.Caption;
  QRL_WorkDate.Caption  := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                           Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
//  Read(Fin, DataIn);

  Print_BumunLine := True;
  QRBand_comment.Enabled:= False;
  QRBand_Deli.Enabled          := False;
  QRBand_Detail.Enabled := False;
  bbu                   := false;
  Start := '0';

end;

procedure TOldPrintForm.InReportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Buff: string;
begin
    if not Eof(Fin) then
    begin
      with DataIn do
      begin
        QRL_ttotal.Caption   := '';
        QRL_ptotal.Caption   := '';
        QRL_insuff.Caption   := '';
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
        Read(Fin, DataIn);
        QRL_deptname.Caption := deptname;
        if trim(ttotal) <> '()'   then QRL_ttotal.Caption   := ttotal;
        if trim(ptotal) <> '()'   then QRL_ptotal.Caption   := ptotal;
        if trim(insuff) <> '()'   then QRL_insuff.Caption   := insuff;
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

        MoreData := True;

        if flag = 'S' then         // {C:계속, S:인쇄후 구분선 출력}
        begin
//
          if Print_BumunLine then  //  초기화 = True
          begin
             if Start = '0' Then     //최초 총계는 찍는다.
             begin
             QRBand_Deli.Enabled   := True;
               Start := '1';
             end
             else
               QRBand_Deli.Enabled   := True;

//             QRBand_Deli.Enabled   := True;
             QRBand_Detail.Enabled := False;
          end
          else
          begin
             QRBand_Deli.Enabled   := False;
             QRBand_Detail.Enabled := False;
          end;
        end
        else    //flag 가 'S'가 아니면.(계속)
        begin                                 //pos(몇째 자리에 있는지.)
          if (trim(bdeptname) =  trim(deptname)) and (pbumn = 's') and bbu then //and (bumun_found or temp) then
          begin
            QRBand_Deli.Enabled    := False;
            QRBand_Detail.Enabled  := False;
            Print_BumunLine        := False;
          end
          else
          begin
            QRBand_Deli.Enabled   := False;
            QRBand_Detail.Enabled := True;
            Print_BumunLine       := True;
          end;
          bbu := plevel;
          bdeptname :=  deptname;
        end;

        if flag = 'P' then begin
           QRBand_Deli.Enabled   := False;
           QRBand_Detail.Enabled := False;
           inReport.NewPage;
           system.exit;
        end;
      end;  //whit DATAIN end;
    end
    else  // If 마지막 페이지
    begin
        QRBand_Deli.Enabled   := False;
        QRBand_Detail.Enabled := False;
        if not Eof(FCom) then begin
           QRBand_comment.Enabled := True;
           ReadLn(FCom, Buff);
           QRL_comment.Caption := Buff;
           MoreData := True;
           if trim(Buff) = 'PAGESKIP' then begin
              QRBand_comment.Enabled := False;
              inReport.NewPage;
              system.exit;
           end;
        end else MoreData := False;
    end;
    if MoreData = False then
    begin
      System.CloseFile(Fin);
      System.CloseFile(FCom);
    end;
end;

end.
