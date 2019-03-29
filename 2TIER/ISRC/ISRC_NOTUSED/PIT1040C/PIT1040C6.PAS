unit PIT1040C6;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRptTotal = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRL_Title: TQRLabel;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape24: TQRShape;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    L_Page: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRShape21: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRBand1: TQRBand;
    QRShape20: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    L_SchNM: TQRLabel;
    L_MajorName: TQRLabel;
    L_ToeicScore: TQRLabel;
    L_Sex: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    L_DutyText: TQRMemo;
    L_EqipName: TQRMemo;
    L_ProgName: TQRMemo;
    L_LiceName: TQRMemo;
    QRS_M1: TQRShape;
    QRS_M2: TQRShape;
    QRShape19: TQRShape;
    QRS_M4: TQRShape;
    L_Seqno: TQRLabel;
    L_Korname: TQRLabel;
    L_Empno: TQRLabel;
    L_IMasPayclName: TQRLabel;
    L_DutyName: TQRMemo;
    QRS_Box1: TQRShape;
    L_DutyYYMM: TQRMemo;
    L_DutyLevelName: TQRMemo;
    L_PayclName: TQRMemo;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel22: TQRLabel;
    L_Orderby: TQRLabel;
    procedure RptTotalPreview(Sender: TObject);
    procedure RptTotalNeedData(Sender: TObject; var MoreData: Boolean);
    procedure RptTotalBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    giCnt: Integer;
    gsOrder: String;
    procedure  fzSetHeightDet(mHeight: Integer);
  end;

var
  RptTotal: TRptTotal;

implementation

{$R *.DFM}

uses
  PIT1040C0, PIT1040C1, peprnView, PIT1040C2, UpitLib;

procedure TRptTotal.RptTotalPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,RptTotal);
     Fm_PreviewForm.Show;
end;

procedure TRptTotal.RptTotalBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    L_Page.Caption := '0';
    giCnt := 1;
end;

procedure TRptTotal.RptTotalNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    with SubForm.SG_Main do
    begin
        if giCnt > RowCount -1 then
        begin
            MoreData := False;
            giCnt := 1;
        end
        else
        begin
            L_Seqno.Caption          := Cells[g_SEQNO        , giCnt];
            L_Korname.Caption        := Cells[g_KORNAME      , giCnt];
            L_Empno.Caption          := '('+Cells[g_EMPNO        , giCnt]+')';
            L_IMasPayclName.Caption  := Cells[g_IMASPAYCLNM  , giCnt];
            L_DutyName.Lines.Text    := Cells[g_DUTYNM       , giCnt];
            L_DutyText.Lines.Text    := Cells[g_DUTYTEXT     , giCnt];
            L_DutyYYMM.Lines.Text    := Cells[g_DUTYYYMM     , giCnt];
            L_DutyLevelName.Lines.Text:= Cells[g_DUTYLEVELNM  , giCnt];
            L_PayclName.Lines.Text   := Cells[g_PAYCLNM      , giCnt];
            L_EqipName.Lines.Text    := Cells[g_EQIP         , giCnt];
            L_ProgName.Lines.Text    := Cells[g_PROG         , giCnt];
            L_LiceName.Lines.Text    := Cells[g_LICE         , giCnt];
//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//------------------------------------------------------------------------------
//            L_SchNM.Caption          := Cells[g_SCHGR        , giCnt];
//------------------------------------------------------------------------------
            L_SchNM.Caption          := Cells[g_SCHNM        , giCnt];
            L_MajorName.Caption      := Cells[g_MAJOR        , giCnt];
            L_ToeicScore.Caption     := Cells[g_TOEICSCORE   , giCnt];
            L_Sex.Caption            := Cells[g_SEX          , giCnt];

            if RowHeights[giCnt] < 25 then
            begin
                fzSetHeightDet(25);
                //QRBand1.Height := 25;
            end
            else
            begin
                fzSetHeightDet(RowHeights[giCnt]);
                //QRBand1.Height := RowHeights[giCnt]+10;
            end;

            MoreData := True;
            Inc(giCnt);
        end;
    end;
end;

procedure TRptTotal.fzSetHeightDet(mHeight: Integer);
var
  i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
        if TControl(Components[i]).Tag = 99 then
        begin
            if Components[i] is TQRShape then
                TControl(Components[i]).Height := mHeight +9;
            if Components[i] is TQRMemo then
                TControl(Components[i]).Height := mHeight ;
        end;
    end;
    QRBand1.Height := mHeight+12;
end;

procedure TRptTotal.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  L_Page.Caption := IntToStr(StrToInt(L_Page.Caption)+1);
  L_Orderby.Caption := gsOrder;
end;

end.
