unit Pki30602;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls,Pki30601, quickrpt, Qrctrls, Qrprntr;

type
  TS1_KI3060C = class(TForm)
    QRBand1: TQRBand;
    QRShape13: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRL_Date: TQRLabel;
    QRBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_GroupName: TQRLabel;
    QRL_Name: TQRLabel;
    QRBand3: TQRBand;
    QRL_EmpNO: TQRLabel;
    QRL_KorName: TQRLabel;
    QRL_PayClName: TQRLabel;
    QRL_GiveAmt: TQRLabel;
    QRL_AppDate: TQRLabel;
    QRL_DrvName: TQRLabel;
    QRL_AppNo: TQRLabel;
    QRL_GiveYN: TQRLabel;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRL_Count: TQRLabel;
    QRL_Sum: TQRLabel;
    QReport: TQuickRep;
    QRSysData2: TQRSysData;
    QRLab: TQRLabel;
    QRLabel26: TQRLabel;
    QRL_Desc: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRL_FrDate: TQRLabel;
    QRL_ToDate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    //procedure QReportBeforePrint(Sender:TQuickRep; var PrintReport: Boolean);
    procedure QReportNeedData(Sender:TObject; var MoreData: Boolean);
    procedure QReportPreview(Sender: TObject);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    user_preview : Boolean;

    MaxValue   : Integer;
    Pointer    : TRec_Ptr;
    RecCount   : Integer;
    Procedure Print_Data ( var Flag : Boolean );
    Procedure Get_Result;
  end;

var
  S1_KI3060C: TS1_KI3060C;

implementation
uses pki30603;
{$R *.DFM}

procedure TS1_KI3060C.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  Temp : TRec_Ptr;
  Msg  : String;
begin
  Pointer  := M_KI3060C.Mem_Ptr ;
  Temp     := Pointer;

  MaxValue := 0;
  while Temp^.Ptr <> NIL do
    begin
         Temp := Temp^.Ptr;
         Maxvalue := MaxValue + 1;
    end;

  MaxValue  := MaxValue + 1;
  RecCount  := 0;

  QRL_Date.Caption := M_KI3060C.L_Date.Caption;

  if M_KI3060C.RB_Kind1.Checked then
     QRL_Name.Caption := '[전  체]'
  else begin
       if M_KI3060C.RB_Kind2.Checked then
          QRL_Name.Caption := '[면허취득]'
       else if M_KI3060C.RB_Kind3.Checked then
          QRL_Name.Caption := '[시내연수]'
       else
          QRL_Name.Caption := '[자가운전]'
  end;

  M_KI3060C.ME_FromDate.EditMask := '9999-99-99;1;_';
  M_KI3060C.ME_ToDate.EditMask   := '9999-99-99;1;_';
  QRL_FrDate.Caption             := M_KI3060C.ME_FromDate.Text;
  QRL_ToDate.Caption             := M_KI3060C.ME_ToDate.Text;
  M_KI3060C.ME_FromDate.EditMask := '9999-99-99;0;_';
  M_KI3060C.ME_ToDate.EditMask   := '9999-99-99;0;_';

  if M_KI3060C.RB_POrder1.Checked then
     Msg := M_KI3060C.RB_POrder1.Caption
  else
     Msg := M_KI3060C.RB_POrder2.Caption;
  QRL_Desc.Caption    := Msg + ' 입니다.';

end;

{procedure TS1_KI3060C.QReportBeforePrint(Sender:TQuickRep; var PrintReport: Boolean);
var
  Temp : TRec_Ptr;
  Msg  : String;
begin
  Pointer  := M_KI3060C.Mem_Ptr ;
  Temp     := Pointer;

  MaxValue := 0;
  while Temp^.Ptr <> NIL do
    begin
         Temp := Temp^.Ptr;
         Maxvalue := MaxValue + 1;
    end;

  MaxValue  := MaxValue + 1;
  RecCount  := 0;

  QRL_Date.Caption := M_KI3060C.L_Date.Caption;

  if M_KI3060C.RB_Kind1.Checked then
     QRL_Name.Caption := '[전  체]'
  else begin
       if M_KI3060C.RB_Kind2.Checked then
          QRL_Name.Caption := '[면허취득]'
       else if M_KI3060C.RB_Kind3.Checked then
          QRL_Name.Caption := '[시내연수]'
       else
          QRL_Name.Caption := '[자가운전]'
  end;

  M_KI3060C.ME_FromDate.EditMask := '9999-99-99;1;_';
  M_KI3060C.ME_ToDate.EditMask   := '9999-99-99;1;_';
  QRL_FrDate.Caption             := M_KI3060C.ME_FromDate.Text;
  QRL_ToDate.Caption             := M_KI3060C.ME_ToDate.Text;
  M_KI3060C.ME_FromDate.EditMask := '9999-99-99;0;_';
  M_KI3060C.ME_ToDate.EditMask   := '9999-99-99;0;_';

  if M_KI3060C.RB_POrder1.Checked then
     Msg := M_KI3060C.RB_POrder1.Caption
  else
     Msg := M_KI3060C.RB_POrder2.Caption;
  QRL_Desc.Caption    := Msg + ' 입니다.';

end;}

Procedure TS1_KI3060C.Print_Data ( var Flag : Boolean );
var
  Buffer : String;
begin

if Pointer^.Ptr <> NIL then
     begin
       QRL_EmpNo.Caption       := Pointer^.EmpNo;
       QRL_KorName.Caption     := Pointer^.KorName;
       QRL_PayClName.Caption   := M_KI3060C.Get_CodeName(M_KI3060C.CI112,Pointer^.PayCl);
       QRL_DrvName.Caption     := Pointer^.DrvName;
       Buffer                  := Pointer^.AppDate;
       QRL_AppDate.Caption     := Copy( Buffer,1,4) + '.' + Copy( Buffer,5,2) + '.' + Copy( Buffer,7,2);
       QRL_AppNo.Caption       := IntToStr( Pointer^.AppNo );
       QRL_GiveYN.Caption      := Pointer^.GiveYN;
       QRL_GiveAmt.Caption     := FormatFloat( '#,##0' , Pointer^.GiveAmt );
       Pointer := Pointer^.Ptr;
       Flag := True;
     end
  else
     begin
       if Pointer^.Index = Maxvalue then
          begin
            QRL_EmpNo.Caption       := Pointer^.EmpNo;
            QRL_KorName.Caption     := Pointer^.KorName;
            QRL_PayClName.Caption   := M_KI3060C.Get_CodeName(M_KI3060C.CI112,Pointer^.PayCl);
            QRL_DrvName.Caption     := Pointer^.DrvName;
            Buffer                  := Pointer^.AppDate;
            QRL_AppDate.Caption     := Copy( Buffer,1,4) + '.' + Copy( Buffer,5,2) + '.' + Copy( Buffer,7,2);
            QRL_AppNo.Caption       := IntToStr( Pointer^.AppNo );
            QRL_GiveYN.Caption      := Pointer^.GiveYN;
            QRL_GiveAmt.Caption     := FormatFloat( '#,##0' , Pointer^.GiveAmt );
            Get_Result;
            Pointer^.Index := Pointer^.Index + 1 ;
            Flag := True;
          end
        else
          Flag := False;
     end;
end;

procedure TS1_KI3060C.QReportNeedData(Sender:TObject; var MoreData: Boolean);
begin
     Print_Data( MoreData );
     if RecCount < MaxValue then
        RecCount := RecCount + 1;
     M_KI3060C.P_Help.Caption := '   ' + IntToStr(RecCount) + ' / ' + IntToStr(MaxValue) +
                                 ' 건에 대해 출력준비 중...';
     Application.ProcessMessages;
end;

{ 출력결과의 레코드 건수와 지급금액의 합을 구하는 루틴 }
Procedure TS1_KI3060C.Get_Result;
var
  Temp       : TRec_Ptr;
  i          : Integer ;
  Sum        : LongInt ;
begin
  Temp  := M_KI3060C.Mem_Ptr;
  Sum   := 0;
  for i := 1 to MaxValue do
    begin
      Sum  := Sum + Temp^.GiveAmt;
      Temp := Temp^.Ptr;
    end;

  QRL_Count.Caption := FormatFloat( ' #,##0 ', MaxValue ) + ' 명 ';
  QRL_Sum.Caption   := FormatFloat( ' #,##0 ', Sum ) + ' 원 ';

end;

// Del2.0 --> 3.0
procedure TS1_KI3060C.QReportPreview(Sender: TObject);
begin
    PreviewForm.qrPreView.QRPrinter := TQRPrinter(sender);
    self.user_preview := true;
end;

procedure TS1_KI3060C.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   if self.user_preview then PreviewForm.show;
end;

procedure TS1_KI3060C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := cafree;
end;

end.
 