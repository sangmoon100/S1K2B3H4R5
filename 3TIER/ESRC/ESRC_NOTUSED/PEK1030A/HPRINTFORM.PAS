unit HPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn,  Db;

type
  TPrintForm = class(TForm)
    QuickRepPrn1: TPeQuickRepPrn;
    PageHeaderBand: TQRBand;
    QRShape18: TQRShape;
    QRShape17: TQRShape;
    QRShape7: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRL_Empno: TQRLabel;
    QRL_Deptname: TQRLabel;
    QRL_Korname: TQRLabel;
    QRL_Payraname: TQRLabel;
    QRL_Spedate: TQRLabel;
    QRDetailBand: TQRBand;
    QRShape25: TQRShape;
    QRShape48: TQRShape;
    QRShape30: TQRShape;
    QRShape57: TQRShape;
    QRShape28: TQRShape;
    QRShape42: TQRShape;
    QR_itemno1: TQRLabel;
    QR_Effect1: TQRMemo;
    QR_ActPlan1: TQRMemo;
    QR_Bigo1: TQRMemo;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape43: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape50: TQRShape;
    QR_itemno2: TQRLabel;
    QR_Effect2: TQRMemo;
    QR_ActPlan2: TQRMemo;
    QR_Bigo2: TQRMemo;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QR_itemno3: TQRLabel;
    QR_Effect3: TQRMemo;
    QR_ActPlan3: TQRMemo;
    QR_Bigo3: TQRMemo;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QR_itemno4: TQRLabel;
    QR_Effect4: TQRMemo;
    QR_ActPlan4: TQRMemo;
    QR_Bigo4: TQRMemo;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QR_itemno5: TQRLabel;
    QR_Effect5: TQRMemo;
    QR_ActPlan5: TQRMemo;
    QR_Bigo5: TQRMemo;
    QRShape38: TQRShape;
    QRShape45: TQRShape;
    QRLabel31: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel25: TQRLabel;
    QRShape69: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QR_ItemName1: TQRLabel;
    QR_ItemName2: TQRLabel;
    QR_ItemName3: TQRLabel;
    QR_ItemName4: TQRLabel;
    QR_ItemName5: TQRLabel;
    QR_SupexTarget1: TQRLabel;
    QR_SupexTarget2: TQRLabel;
    QR_SupexTarget3: TQRLabel;
    QR_SupexTarget4: TQRLabel;
    QR_SupexTarget5: TQRLabel;
    QRSubDetail: TQRSubDetail;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QR_ActPlan: TQRMemo;
    QR_DetPlan: TQRMemo;
    QR_TGPoint: TQRMemo;
    QRSubGroup: TQRGroup;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel1: TQRLabel;
    QRShape97: TQRShape;
    QRLabel16: TQRLabel;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRSubGroupFooter: TQRBand;
    QRBand1: TQRBand;
    QR_korname: TQRLabel;
    QRLabel2: TQRLabel;
    QR_SubTitle: TQRLabel;
    QR_line: TQRShape;
    QRShape5: TQRShape;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    procedure QuickRepPrn1Preview(Sender: TObject);
    procedure QuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QRDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
   rabasdate : string;
   empno     : string;
   ParamVariant : String;
   procedure InitQrLabel;
   Procedure GetPageHeader;

  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.DFM}

uses  PePrnview, HMainForm;

procedure TPrintForm.QuickRepPrn1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRepPrn1);
  Fm_PreviewForm.Show;
  Fm_PreviewForm.Qr_Preview.OnProgressUpdate := nil;
end;


procedure TPrintForm.InitQrLabel;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TQRMemo then
        if TQRMemo(Components[i]).Tag = 99 then
          begin
            TQRMemo(Components[i]).Lines.Clear;
            TQRMemo(Components[i]).Lines.Text := '';
          end;
      if Components[i] is TQRLabel then
        if TQRLabel(Components[i]).Tag = 99 then
          begin
            TQRLabel(Components[i]).Caption := '';
          end;
    end;
end;

procedure TPrintForm.QuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  FL_Comp   : TQRMemo;
     FL_i      : Integer;
begin
     QRL_Empno.Caption := '';
     QRL_Korname.Caption := '';
     QRL_Deptname.Caption := '';
     QRL_Payraname.Caption := '';

     InitQrLabel;
     QRL_Spedate.Caption := '( 대상기간 : '+FM_Main.LRabasyy+'년 )' ;
     GetPageHeader;
     QR_line.Visible := True;
     rabasdate := FM_Main.Lrabasyy;
     empno     := FM_Main.GSempno;
end;

Procedure TPrintForm.GetPageHeader;
begin
     QRL_Empno.Caption     := FM_Main.ED_empno.Text;
     QRL_Korname.Caption   := FM_Main.L_korname.ValueCaption;
     QRL_Deptname.Caption  := FM_Main.L_Deptname.ValueCaption;
     QRL_Payraname.Caption := FM_Main.L_payraname.ValueCaption;
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

procedure TPrintForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := True;
end;

procedure TPrintForm.QRDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var  FL_Com    : TQRLabel;
     FL_Comp   : TQRMemo;
     FL_i      : Integer;
begin
     FL_Com  := nil;
     FL_Comp := nil;
     FM_Main.Q_Subject.First;
     while  not FM_Main.Q_Subject.eof do
     begin
          FL_i := FM_Main.Q_Subject.Fields[0].AsInteger;
          with FM_Main.TMaxDataSet_HInsa do
          begin
               ParamVariant := 'select rabasyy, empno, itemno, itemname, supextarget ' +
                               '  from peAct1mas a                                   ' +
                        Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''       ',[FM_Main.LRabasyy,FM_Main.Ed_empno.Text]) +
                               '   and itemno  = '+FM_Main.Q_Subject.Fieldbyname('Itemno').AsString+
                               ' order by itemno                                     ';
               Close;
               ServiceName := 'HINSA_select';
               ClearFieldInfo;
               AddField('rabasyy'     , ftString    ,  100  );
               AddField('empno'       , ftString    ,  100  );
               AddField('itemno'      , ftString    ,  100  );
               AddField('itemname'    , ftString    ,  100  );
               AddField('supextarget' , ftString    ,  100  );
               ClearParamInfo;
               SQL.Text := ParamVariant;
               Open;

               FL_Com := TQRLabel(Self.FindComponent('QR_ItemName'    +IntToStr(FL_i)));
               FL_Com.Caption  := FM_Main.TMaxDataSet_HInsa.Fields[3].AsString;
               FL_Com := TQRLabel(Self.FindComponent('QR_SupexTarget' +IntToStr(FL_i)));
               FL_Com.Caption  := FM_Main.TMaxDataSet_HInsa.Fields[4].AsString;
          end;
          FL_Com  := TQRLabel(Self.FindComponent('QR_itemno'   +IntToStr(FL_i)));
          FL_Com.Caption     := IntToStr(FL_i);
          FL_Comp := TQRMemo(Self.FindComponent('QR_Effect'   +IntToStr(FL_i)));
          FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[1].AsString;
          //FL_Comp := TQRMemo(Self.FindComponent('QR_KeyFactor'+IntToStr(FL_i)));
          //FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[2].AsString;
          FL_Comp := TQRMemo(Self.FindComponent('QR_ActPlan'  +IntToStr(FL_i)));
          FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[3].AsString;
          FL_Comp := TQRMemo(Self.FindComponent('QR_Bigo'     +IntToStr(FL_i)));
          FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[4].AsString;
          FM_Main.Q_Subject.Next;
     end;
end;

procedure TPrintForm.QRSubDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if FM_Main.TMaxDataSet.RecordCount < 1 then
          QR_SubTitle.Caption   := ''
     else
     if FM_Main.TMaxDataSet.RecordCount = 1 then
     begin
          QR_SubTitle.Caption   := '리더십실행력제고';
          QR_SubTitle.Font.Size := 7;
     end
     else
     if FM_Main.TMaxDataSet.RecordCount = 2 then
     begin
          QR_SubTitle.Font.Size := 8;
          if FM_Main.TMaxDataSet.RecNo = 1 then
              QR_SubTitle.Caption := '리 더 십 '
          else
              QR_SubTitle.Caption := '실행력 제고'
     end
     else
     if FM_Main.TMaxDataSet.RecordCount >= 3 then
     begin
          QR_SubTitle.Font.Size := 9;
          if FM_Main.TMaxDataSet.RecNo = 1 then
              QR_SubTitle.Caption := '리 더 십'
          else
          if FM_Main.TMaxDataSet.RecNo = 2 then
              QR_SubTitle.Caption := '실 행 력'
          else
          if FM_Main.TMaxDataSet.RecNo = 3 then
              QR_SubTitle.Caption := '제 고'
          else
              QR_SubTitle.Caption := '';
     end;
     QR_ActPlan.Lines.Text := FM_Main.TMaxDataSet.fieldbyname('ActPlan').AsString;
     QR_DetPlan.Lines.Text := FM_Main.TMaxDataSet.fieldbyname('DetPlan').AsString;
     QR_TGPoint.Lines.Text := FM_Main.TMaxDataSet.fieldbyname('TGPoint').AsString;
end;

procedure TPrintForm.QRSubGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if FM_Main.TMaxDataSet.RecNo = 1 then
          QR_line.Shape := qrsHorLine
     else
          QR_line.Shape := qrsRightAndLeft;
     if FM_Main.TMaxDataSet.FieldByName('Gubun').AsString = '1' then
     begin
          QRLabel1.Caption  := '솔선 수범';
          QRLabel16.Caption := 'KPI달성 및 생산성 향상을 위한 팀장 본인의 솔선 수범 및 실천계획';
     end
     else
     begin
          QRLabel1.Caption  := '구성원 L/H/C';
          QRLabel16.Caption := '구성원 KPI달성을 위한 육성 및 L/H/C 실천계획';
     end;
end;

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_korname.Caption := FM_Main.L_korname.ValueCaption+' (서명)';
end;

end.
