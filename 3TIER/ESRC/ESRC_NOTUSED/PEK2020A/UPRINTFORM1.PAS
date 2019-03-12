unit UPrintForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, StdCtrls,
  OnFocusButton, jpeg;

type
  TPrintForm1 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    Groupgapband: TQRBand;
    QRS_horb: TQRShape;
    QRBand2: TQRBand;
    QRL_korname: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_Title: TQRLabel;
    QRShape13: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRShape8: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRL_SUJUN: TQRLabel;
    QRL_EDUFORMNM: TQRLabel;
    QRL_EKIND: TQRLabel;
    QRL_EDUNAME: TQRMemo;
    QRL_EDUMM: TQRLabel;
    QRShape5: TQRShape;
    QRBand3: TQRBand;
    QRL_Line1: TQRLabel;
    QRL_Line2: TQRLabel;
    QRL_Line3: TQRLabel;
    QRL_seqno: TQRLabel;
    QR_EDUTOBE: TQRMemo;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRShape21: TQRShape;
    QRLabel5: TQRLabel;
    QRL_BUMOON: TQRLabel;
    QR_SGNOW: TQRMemo;
    QR_LCNEXT: TQRMemo;
    QR_LCNOW: TQRMemo;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRImage1: TQRImage;
    QR_SGNEXT: TQRMemo;
    QRShape28: TQRShape;
    QRLabel4: TQRLabel;
    QRShape18: TQRShape;
    QRShape10: TQRShape;
    QRShape2: TQRShape;
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     giSeqno: Integer;
  end;

var
  PrintForm1: TPrintForm1;

implementation

uses UMainForm, PePrnview;

{$R *.DFM}

procedure TPrintForm1.QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
Var
  sEmpno, sDutyDate, sDutyno: String;
  sTempYYMM, sSysDate: String;
begin

  with FM_Main.Q_Grid do
  begin
    if EOF then
    begin
      Moredata := False;
    end
    else
    begin
      inc(giSeqno);
      QRL_seqno.Caption      := inttostr(giSeqno);
      QRL_EKIND.Caption      := FieldByName('CN_EKIND').AsString;
      QRL_BUMOON.Caption     := FieldByName('CN_BUMOON').AsString;
      QRL_EDUNAME.Lines.Text := FieldByName('EDUNAME').AsString;
      QRL_EDUMM.Caption      := FieldByName('EDUMM').AsString;
      QRL_SUJUN.Caption      := FieldByName('ITEMNAME').AsString;
      QRL_EDUFORMNM.Caption  := FieldByName('EDUFORMNM').AsString;
      Moredata := True;
      FM_Main.Q_Grid.Next;
    end;
  end;
end;

procedure TPrintForm1.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

procedure TPrintForm1.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  ParamVariant : String;
  Bungi, SDate, E1KORNAME, KORNAME : String;
begin
  giSeqno := 0;
  with FM_Main do
  begin
    KORNAME               := L_Korname.ValueCaption;
    QRL_Korname.Caption   := L_Korname.ValueCaption + ' 매니저';
    QRL_deptname.Caption  := L_Deptname.ValueCaption;
  end;

  QRL_Title.Caption  := FM_Main.sbase_yy + ' My Plan';
  with FM_Main.TMaxDataSet do
  Begin
    ServiceName := 'HINSA_select12';
    ParamVariant := 'SELECT EDUTOBE, SGNOW, SGNEXT, LCNOW, LCNEXT, OSNOW, OSNEXT, '+
                    '      (SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.E1EMPNO) E1KORNAME, '+
                    '      TO_CHAR(SYSDATE,''YYYYMMDD'') SDATE, '''' F9 '+
                    '  FROM PEIDPMAS A                                  '+
                    ' WHERE BASE_YY = '''+ FM_Main.sbase_yy      +'''   '+
                    '   AND empno   = '''+ FM_Main.Ed_empno.Text +'''   ';

    ServiceName := 'HINSA_select12';
    ClearFieldInfo;
    AddField('EDUTOBE'  , ftString, 2000);
    AddField('SGNOW'    , ftString, 2000);
    AddField('SGNEXT'   , ftString, 2000);
    AddField('LCNOW'    , ftString, 2000);
    AddField('LCNEXT'   , ftString, 2000);
    AddField('OSNOW'    , ftString, 2000);
    AddField('OSNEXT'   , ftString, 2000);
    AddField('E1KORNAME', ftString, 2000);
    AddField('SDATE'    , ftString, 2000);
    AddField('F9'       , ftString, 2000);

    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    QR_EDUTOBE.Lines.Text := Fields[2].AsString;
    QR_SGNOW.Lines.Text   := Fields[3].AsString;
    QR_SGNEXT.Lines.Text  := Fields[0].AsString;
    QR_LCNOW.Lines.Text   := Fields[1].AsString;
    QR_LCNEXT.Lines.Text  := Fields[4].AsString;

    E1KORNAME             := Fields[7].AsString;
    SDate                 := fields[8].AsString;
  End;

  FM_Main.Q_Grid.First;   

  QRL_Line1.Caption := '상기에 따라 리더 ' + E1KORNAME + '은(는) 팀원 ' +  KORNAME + '의 실력향상을 위해 지속적으로 지원하고,';
  QRL_Line2.Caption := '팀원 ' + KORNAME + '은(는) My Plan을 실천하기 위해 적극적으로 노력할 것을 서약합니다.';
  QRL_Line3.Caption := '팀원:___________________(서명)                                         리더:___________________(서명)';
end;

end.

