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
unit PIE30205;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, ExtCtrls, PIE30201, DB, DBTables,
  Qrctrls;//, QuickRpt;

type
  TPrintForm = class(TForm)
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
    QRL_pdirsum2: TQRLabel;
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
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    InReport: TQuickRep;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRL_ptotal: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRL_ppos8: TQRLabel;
    QRL_ppos9: TQRLabel;
    QRL_pdirsum1: TQRLabel;
    QRShape27: TQRShape;
    qry_deptcode: TQuery;
    QRShape4: TQRShape;
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
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape49: TQRShape;
    QRShape66: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRShape2: TQRShape;
    QRShape20: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape67: TQRShape;
    QRShape16: TQRShape;
    QRShape22: TQRShape;
    line: TQRChildBand;
    line_hor: TQRShape;
    QRBand_comment: TQRChildBand;
    QRL_comment: TQRLabel;
    QRShape3: TQRShape;
    QRLabel21: TQRLabel;
    QRShape8: TQRShape;
    QRShape_head_left: TQRShape;
    QRShape1: TQRShape;
    QRShape_body_left: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    QRShape9: TQRShape;
    QRLabel22: TQRLabel;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRL_ttempsum: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRL_pcontsum: TQRLabel;
    QRL_pimsisum: TQRLabel;
    QRShape28: TQRShape;
    QRLabel24: TQRLabel;
    QRShape34: TQRShape;
    QRL_psconsum: TQRLabel;
    QRLabel10: TQRLabel;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InReportPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     bdeptname            : string;
     Print_BumunLine, bbu : Boolean;
     Fin      : file of PIE30201.TDataIn;
     FCom     : Textfile;
  end;

var
  PrintForm: TPrintForm;
  DataIn   : PIE30201.TDataIn;

implementation

{$R *.DFM}

uses
  PePrnview;

procedure TPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(Fin, PIE30201.HomeDir+'\list\PIE3020A.tmp');
  AssignFile(FCom,PIE30201.HomeDir+'\list\PIE3020A.dat');
  System.Reset(Fin);   {open}
  System.Reset(FCom);  {open}
//  System.Seek(Fin, 0); {FilePoint 0}
  QRL_curdate.Caption   := MainForm.L_Date.Caption;
  QRL_WorkDate.Caption  := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                           Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
//  RBand_Header1.Enabled := True;
  Print_BumunLine       := True;
  QRBand_comment.Enabled:= False;

  line.Enabled          := False;
  QRBand_Detail.Enabled := False;
  bbu                   := false;
end;

procedure TPrintForm.InReportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Buff: string;
  bumun_found : boolean;
  temp : string;
begin
    temp := '';
    if not Eof(Fin) then begin
      with DataIn do begin

        QRL_ttotal.Caption   := '';
        QRL_ptotal.Caption   := '';
        QRL_insuff.Caption   := '';
        QRL_pdirsum1.Caption  := '';
        QRL_pdirsum2.Caption  := '';
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
        QRL_pextrsum.Caption := '';
        //계약,일반 t/o
       // QRL_tcontsum.Caption := '';
        QRL_pimsisum.Caption := ''; //계약+일반 2002.04.17 shm
        QRL_ttempsum.Caption := '';
        // 계약직 관련 수정
        QRL_pcontsum.Caption := '';
        QRL_psconsum.Caption := '';
        QRL_psum.Caption     := '';
        Read(Fin, DataIn);

        QRL_deptname.Caption := deptname;
        if Boldline = True then
            QRL_deptname.Font.Style := [fsBold]
        else
            QRL_deptname.Font.Style := [];

        if Italicline = True then
        begin
            QRL_deptname.Font.Style := [fsItalic];
            QRL_deptname.Caption := deptname;
        end;


//        if trim(ttotal)   <> '()'    then QRL_ttotal.Caption   := ttotal;
        if trim(ttotal)   <> '()'    then QRL_ttotal.Caption   := ttotal;     //30.21
        if trim(ptotal)   <> '()'    then QRL_ptotal.Caption   := ptotal;
        if trim(insuff)   <> '()'    then QRL_insuff.Caption   := insuff;
        if trim(pdirsum)  <> '()'    then QRL_pdirsum1.Caption  := pdirsum;
        if trim(pdir71)   <> '()'    then QRL_pdirsum2.Caption  := pdir71;
        if trim(ppos1)    <> '()'    then QRL_ppos1.Caption    := ppos1;
        if trim(ppos2)    <> '()'    then QRL_ppos2.Caption    := ppos2;
        if trim(ppos3)    <> '()'    then QRL_ppos3.Caption    := ppos3;
        if trim(ppos4)    <> '()'    then QRL_ppos4.Caption    := ppos4;
        if trim(ppos5)    <> '()'    then QRL_ppos5.Caption    := ppos5;
        if trim(ppos6)    <> '()'    then QRL_ppos6.Caption    := ppos6;
        if trim(ppos7)    <> '()'    then QRL_ppos7.Caption    := ppos7;
        if trim(ppos8)    <> '()'    then QRL_ppos8.Caption    := ppos8;
        if trim(ppos9)    <> '()'    then QRL_ppos9.Caption    := ppos9;
        if trim(pspe)     <> '()'    then QRL_pspe.Caption     := pspe;
        if trim(pemp)     <> '()'    then QRL_pemp.Caption     := pemp;
        if trim(pextrsum) <> '()'    then QRL_pextrsum.Caption := pextrsum;
        //계약,일반 t/o
//        if trim(tcontsum) <> '()'    then QRL_tcontsum.Caption := tcontsum;
        if trim(pimsisum) <> '()'    then QRL_pimsisum.Caption := pimsisum;
        if trim(ttempsum) <> '()'    then QRL_ttempsum.Caption := ttempsum;
// 계약직 관련 수정
        if trim(pcontsum) <> '()'    then QRL_pcontsum.Caption := pcontsum;
        if trim(psconsum) <> '()'    then QRL_psconsum.Caption := psconsum;  //2002.08.21 전문계약 추가         
        if trim(psum)     <> '()'    then QRL_psum.Caption     := psum;
//
        MoreData := True;
        if flag = 'S' then         // {C:계속, S:인쇄후 구분선 출력}
        begin
//
          if Print_BumunLine then  //  초기화 = True
          begin
             line.Enabled   := True;
             QRBand_Detail.Enabled := False;
          end
          else
          begin
             line.Enabled   := False;
             QRBand_Detail.Enabled := False;
          end;
        end
        else    //flag 가 'S'가 아니면.(계속)
        begin                                 //pos(몇째 자리에 있는지.)
//          bumun_found := (system.pos('부문',deptname) > 0); //결론 : 부문 존재여부..
//            showmessage(deptname+' '+bbu);
//            if bbu then
//               temp :='TRUE'
//            else
//               temp := 'FALSE';
//            showmessage(deptname+' '+temp);
            if (trim(bdeptname) =  trim(deptname)) and (pbumn = 's') and bbu then //and (bumun_found or temp) then
             begin
               line.Enabled    := False;
               QRBand_Detail.Enabled  := False;
               Print_BumunLine        := False;
             end
            else
             begin
               line.Enabled   := False;
               QRBand_Detail.Enabled := True;
               Print_BumunLine       := True;
            end;
          bbu := plevel;
          bdeptname :=  deptname;
        end;



        if flag = 'P' then begin
           line.Enabled   := False;
           QRBand_Detail.Enabled := False;
           if EOF(Fin) then begin
//              RBand_Header1.Enabled := False;
           end;
           inReport.NewPage;
           system.exit;
        end;
        // leerk 99 start
        //aaa:= copy(deptname,length(deptname)-,length(deptname));
        {
        with MainForm.Query1 do
        begin
             close;
             sql.clear;
             sql.add(' select ''1'' cnt from  dual             ');
             sql.add(' where :deptname like ''%부문''          ');
             parambyname('deptname').Asstring:= deptname ;
             open;
             aaa := fieldbyname('cnt').Asstring;
             close;
        end;
        }
      end;
    end
    else
    begin
//        RBand_Header1.Enabled := False;
        line.Enabled   := False;
        QRBand_Detail.Enabled := False;
        if not Eof(FCom) then begin
           QRBand_comment.Enabled := True;
           ReadLn(FCom, Buff);
           QRL_comment.Caption := Buff;
           MoreData := True;
           if trim(Buff) = 'PAGESKIP' then begin
              QRBand_comment.Enabled := False;
//              inReport.NewPage;    2002.06.11 shm 빈페이지!!!!!!!
              system.exit;
           end;
        end else
        MoreData := False;
    end;
//    if line.enabled = true then
//      showmessage('line true')
//    else
//      showmessage('line False');
     if MoreData = False then
    begin
      System.CloseFile(Fin);
      System.CloseFile(FCom);
    end;
end;

procedure TPrintForm.InReportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
     Fm_PreviewForm.Show;
//(uses절에   PePrnview; 추가하기)
end;

end.

 