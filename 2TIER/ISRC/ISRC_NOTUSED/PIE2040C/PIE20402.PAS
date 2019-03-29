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
unit pie20402;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, pie20401, DB, DBTables,
  Qrctrls, QuickRpt, peprnview;

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
    QRL_ptotal: TQRLabel;
    QRL_insuff: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRL_currate: TQRLabel;
    QRL_mang: TQRLabel;
    QRShape18: TQRShape;
    QRL_mangrat: TQRLabel;
    QRShape19: TQRShape;
    QRL_four: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRL_fourrat: TQRLabel;
    QRL_pemp: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRL_pextrsum: TQRLabel;
    QRL_psum: TQRLabel;
    QRShape1: TQRShape;
    QRShape34: TQRShape;
    QRBand_comment: TQRBand;
    QRL_comment: TQRLabel;
    InReport: TQuickRep;
    QRL_WorkDate: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape17: TQRShape;
    QRShape6: TQRShape;
    QRL_pcontsum: TQRLabel;
    QRShape41: TQRShape;
    QRLabel2: TQRLabel;
    QRShape27: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape45: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRShape36: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRShape35: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    QRShape3: TQRShape;
    QRShape15: TQRShape;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InReportPreview(Sender: TObject);
    procedure QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  PrintForm: TPrintForm;
  DataIn   : pie20401.TDataIn;
  Fin      : file of pie20401.TDataIn;
  FCom     : Textfile;
  Print_BumunLine, bbu : boolean;
  Fm_PreviewForm: TFm_PreviewForm;
  bdeptname            : string;
implementation

{$R *.DFM}

procedure TPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
begin
  AssignFile(Fin, HomeDir+'\list\pie2040c.tmp');
  AssignFile(FCom,HomeDir+'\list\pie2040c.dat');
  System.Reset(Fin);   {open}
  System.Reset(FCom);  {open}
  System.Seek(Fin, 0); {FilePoint 0}
  QRL_curdate.Caption := MainForm.L_Date.Caption;
  QRL_WorkDate.Caption := Copy(MainForm.ME_WorkDate.Text, 1 , 4) + '년 ' +
                          Copy(MainForm.ME_WorkDate.Text, 5 , 2) + '월';
//  QRBand_Header.Enabled := True;
  Print_BumunLine       := True;
  QRBand_comment.Enabled:= False;

//  QRBand_Deli.Enabled   := False;
  QRBand_Detail.Enabled := False;
  bbu                   := false;
end;

procedure TPrintForm.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
  System.Close(FCom);
end;

procedure TPrintForm.InReportNeedData(Sender: TObject; var MoreData: Boolean);
var
  Buff: string;
begin
  if not Eof(Fin) then begin
      with DataIn do begin
        QRL_deptname.Caption  := '';
        QRL_ttotal.Caption    := '';
        QRL_ptotal.Caption    := '';
        QRL_insuff.Caption    := '';
        QRL_currate.Caption   := '';
        QRL_mang.Caption      := '';
        QRL_mangrat.Caption   := '';
        QRL_four.Caption      := '';
        QRL_fourrat.Caption   := '';
        QRL_pemp.Caption      := '';
        QRL_pextrsum.Caption  := '';

        // 계약직 관련 추가
        QRL_pcontsum.Caption  := '';
        QRL_psum.Caption      := '';

        Read(Fin, DataIn);
        QRL_deptname.Caption  := deptname;
        if trim(ttotal) <> '()'      then QRL_ttotal.Caption    := ttotal;
        if trim(ptotal) <> '()'      then QRL_ptotal.Caption    := ptotal;
        if trim(insuff) <> '()'      then QRL_insuff.Caption    := insuff;
        if trim(currate) <> '(0.00)' then QRL_currate.Caption   := currate;
        if trim(mang) <> '()'        then QRL_mang.Caption      := mang;
        if trim(mangrat) <> '(0.00)' then QRL_mangrat.Caption   := mangrat;
        if trim(four) <> '()'        then QRL_four.Caption      := four;
        if trim(fourrat) <> '(0.00)' then QRL_fourrat.Caption   := fourrat;
        if trim(pemp) <> '()'        then QRL_pemp.Caption      := pemp;
        if trim(pextrsum) <> '()'    then QRL_pextrsum.Caption  := pextrsum;
        // 계약직 관련 추가
        if trim(pcontsum) <> '()'    then QRL_pcontsum.Caption  := pcontsum;
        if trim(psum) <> '()'        then QRL_psum.Caption      := psum;


        MoreData := True;
        if flag = 'S' then         // {C:계속, S:인쇄후 구분선 출력}
        begin

          if Print_BumunLine then  //  초기화 = True
          begin
//             QRBand_Deli.Enabled   := True;
             QRBand_Detail.Enabled := False;
          end
          else
          begin
//             QRBand_Deli.Enabled   := False;
             QRBand_Detail.Enabled := False;
          end;
        end
        else
        begin
            if (trim(bdeptname) =  trim(deptname)) and (pbumn = 's') and bbu then //and (bumun_found or temp) then
             begin
//               QRBand_Deli.Enabled    := False;
               QRBand_Detail.Enabled  := False;
               Print_BumunLine        := False;
             end
            else
             begin
//               QRBand_Deli.Enabled   := False;
               QRBand_Detail.Enabled := True;
               Print_BumunLine       := True;
            end;
          bbu := plevel;
          bdeptname :=  deptname;
        end;

        if flag = 'P' then begin
//           QRBand_Deli.Enabled   := False;
           QRBand_Detail.Enabled := False;
           if EOF(Fin) then begin
//              QRBand_Header1.Enabled := False;
           end;
{-----------------------------------------------------------------------
   버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -           인쇄할 데이터가 존재하지 않을 경우
                                               새로운 페이지를 생성하지 않는다.
-----------------------------------------------------------------------}
//         inReport.NewPage; 수정전
           if not Eof(Fin) then inReport.NewPage;
           system.exit;
        end;
      end;
    end
    else
    begin
//        QRBand_Header.Enabled := False;
//        QRBand_Header1.Enabled := False;
//        QRBand_Deli.Enabled   := False;
        QRBand_Detail.Enabled := False;
        if not Eof(FCom) then begin
           QRBand_comment.Enabled := True;
           ReadLn(FCom, Buff);
           QRL_comment.Caption := Buff;
           MoreData := True;
           if trim(Buff) = 'PAGESKIP' then begin
              QRBand_comment.Enabled := False;
{-----------------------------------------------------------------------
   버전     수정일     수정자   관련근거        수정내용
 30.18   2000.03.08   김대훈       -           인쇄할 데이터가 존재하지 않을 경우
                                               새로운 페이지를 생성하지 않는다.
-----------------------------------------------------------------------}
//            inReport.NewPage; 수정전
              if not Eof(Fin) then inReport.NewPage;
              system.exit;
           end;
        end else MoreData := False;
    end;
end;

procedure TPrintForm.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TPrintForm.QRBand_HeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if Copy(MainForm.ME_WorkDate.Text, 1 , 4) < '2009' then
    begin
       QRLabel15.Caption := '관리자급';
       QRLabel16.Caption := '사원급';
    end
    else
    begin
       QRLabel15.Caption := 'L BAND';
       QRLabel16.Caption := 'G BAND이하';
    end
end;

end.
