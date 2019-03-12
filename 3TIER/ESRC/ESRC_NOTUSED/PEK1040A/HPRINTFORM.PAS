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
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QR_AbleName: TQRMemo;
    QR_AbleSum: TQRMemo;
    QR_Previous: TQRMemo;
    QRSubGroup: TQRGroup;
    QRShape96: TQRShape;
    QRLabel1: TQRLabel;
    QRShape97: TQRShape;
    QR_TaskName: TQRLabel;
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
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape8: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QR_DevMethod: TQRMemo;
    QR_DevPlan: TQRMemo;
    QR_Bigo: TQRMemo;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape21: TQRShape;
    QRLabel10: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QR_Rcomment: TQRMemo;
    QR_Rbigo: TQRMemo;
    QRShape26: TQRShape;
    QRLabel13: TQRLabel;
    QRShape31: TQRShape;
    QR_e1comment: TQRMemo;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRChildBand1: TQRChildBand;
    QRShape32: TQRShape;
    QRLabel17: TQRLabel;
    QRShape33: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
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
     QRL_Spedate.Caption := '( 대상기간 : '+FM_Main.vRabasyy+'년 )' ;
     GetPageHeader;
     rabasdate := FM_Main.vRabasyy;
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
     ParamVariant: String;
begin
     FL_Com  := nil;
     FL_Comp := nil;
     with  FM_Main.Q_Subject  do
     begin
          ParamVariant := 'select itemname, EFFECT, supextarget, ACTPLAN, BIGO  '+
                          '  from peAct1mas a                                   '+
                   Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''       ',[FM_Main.vRabasyy,FM_Main.Ed_empno.Text]) +
                          ' order by ITEMNO                                     ';
          Close;
          ServiceName := 'HINSA_select3';
          ClearFieldInfo;
          AddField('itemname'    , ftString    ,  2000  );
          AddField('EFFECT'      , ftString    ,  2000  );
          AddField('supextarget' , ftString    ,  2000  );
          AddField('ACTPLAN'     , ftString    ,  2000  );
          AddField('BIGO'        , ftString    ,  2000  );
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          FL_i :=0;
          if FM_Main.Q_Subject.RecordCount > 0 then
          begin
               FM_Main.Q_Subject.First;
               while  not FM_Main.Q_Subject.eof do
               begin
                    FL_i    := FL_i +1;
                    FL_Com  := TQRLabel(Self.FindComponent('QR_itemno'   +IntToStr(FL_i)));
                    FL_Com.Caption     := IntToStr(FL_i);
                    FL_Com  := TQRLabel(Self.FindComponent('QR_ItemName'    +IntToStr(FL_i)));
                    FL_Com.Caption     := FM_Main.Q_Subject.Fields[0].AsString;
                    FL_Comp := TQRMemo(Self.FindComponent('QR_Effect'   +IntToStr(FL_i)));
                    FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[1].AsString;
                    FL_Com  := TQRLabel(Self.FindComponent('QR_SupexTarget' +IntToStr(FL_i)));
                    FL_Com.Caption     := FM_Main.Q_Subject.Fields[2].AsString;
                    FL_Comp := TQRMemo(Self.FindComponent('QR_ActPlan'  +IntToStr(FL_i)));
                    FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[3].AsString;
                    FL_Comp := TQRMemo(Self.FindComponent('QR_Bigo'     +IntToStr(FL_i)));
                    FL_Comp.Lines.Text := FM_Main.Q_Subject.Fields[4].AsString;
                    FM_Main.Q_Subject.Next;
               end;
          end;
     end;
end;

procedure TPrintForm.QRSubDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_Ablename.Lines.Text  := FM_Main.TMaxDataSet.fieldbyname('Ablename').AsString;
     QR_AbleSum.Lines.Text   := FM_Main.TMaxDataSet.fieldbyname('AbleSum').AsString;
     QR_Previous.Lines.Text  := FM_Main.TMaxDataSet.fieldbyname('Previous').AsString;
     QR_DevMethod.Lines.Text := FM_Main.TMaxDataSet.fieldbyname('DevMethod').AsString;
     QR_DevPlan.Lines.Text   := FM_Main.TMaxDataSet.fieldbyname('DevPlan').AsString;
     QR_Bigo.Lines.Text      := FM_Main.TMaxDataSet.fieldbyname('Bigo').AsString;
end;

procedure TPrintForm.QRSubGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_Taskname.Caption := FM_Main.TMaxDataSet.fieldbyname('Taskname').AsString;
end;

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_RComment.Lines.Text  := FM_Main.vRcomment;
     QR_RBigo.Lines.Text     := FM_Main.vRBigo;
     QR_E1Comment.Lines.Text := FM_Main.vE1Comment;

     QR_korname.Caption := FM_Main.L_korname.ValueCaption+' (서명)';
end;

end.
