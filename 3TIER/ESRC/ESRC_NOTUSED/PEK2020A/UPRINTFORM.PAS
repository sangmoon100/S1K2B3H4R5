unit UPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, StdCtrls;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRL_Empno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_LEVEL1: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRL_deptname: TQRLabel;
    QRShape27: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRL_Bumoon1: TQRLabel;
    QRL_TRACK1: TQRLabel;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRLabel15: TQRLabel;
    QRShape26: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRS_Detail1_hor: TQRShape;
    QRL_EKIND: TQRLabel;
    QRL_BUMOON: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRS_Detail1_ver: TQRShape;
    QRL_EDUNAME: TQRMemo;
    QRShape3: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRL_TRACK: TQRLabel;
    QRL_LEVEL: TQRLabel;
    QRL_EDUMM: TQRLabel;
    QRL_EDUTIME: TQRLabel;
    QRL_ENDYN: TQRLabel;
    QRL_EDUSCORE: TQRLabel;
    QRL_GET_LP: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel28: TQRLabel;
    QRShape31: TQRShape;
    QRL_LPOINT: TQRLabel;
    Groupgapband: TQRBand;
    QRS_horb: TQRShape;
    QRL_PAYCLNAME: TQRLabel;
    QRL_PAYCLDATE: TQRLabel;
    GroupFooterBand: TQRBand;
    QRShape36: TQRShape;
    QRM_worktask: TQRMemo;
    QRLabel17: TQRLabel;
    QRL_Title: TQRLabel;
    QRShape40: TQRShape;
    QRShape37: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel26: TQRLabel;
    QRShape41: TQRShape;
    QRL_LPOINT1: TQRLabel;
    QRShape44: TQRShape;
    QRLabel29: TQRLabel;
    QRL_GETLP: TQRLabel;
    QRShape46: TQRShape;
    QRLabel31: TQRLabel;
    QRShape38: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape45: TQRShape;
    QRShape39: TQRShape;
    QRM_dutytarget: TQRMemo;
    QRShape42: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape43: TQRShape;
    QRM_aftplan: TQRMemo;
    QRLabel25: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses UMainForm, PePrnview;

{$R *.DFM}

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
   QR_memodate.Caption := copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,1,4) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,5,2) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,7,2) ;
}
end;

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
   QR_memodate.Caption := copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,1,4) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,5,2) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,7,2) ;

   QR_empno.Caption    := FM_Main.Ed_empno.Text;
   QR_korname.Caption  := FM_Main.L_korname.ValueCaption;
   QR_payraname.Caption:= FM_Main.L_Payraname.ValueCaption;
   QR_deptname.Caption := FM_Main.L_deptname.ValueCaption;
}
end;

procedure TPrintForm.QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
Var
  sEmpno, sDutyDate, sDutyno: String;
  sTempYYMM, sSysDate: String;
begin
  with FM_Main.Q_Grid do
  begin
       if EOF then
       begin
            Moredata := False;
            First;
       end
       else
       begin
            QRL_EKIND.Caption   := FieldByName('CN_EKIND').AsString;
            QRL_BUMOON.Caption  := FieldByName('CN_BUMOON').AsString;
            QRL_TRACK.Caption   := FieldByName('CN_TRACK').AsString;
            QRL_LEVEL.Caption   := FieldByName('CN_LEVEL').AsString;
            QRL_EDUNAME.Lines.Text := FieldByName('EDUNAME').AsString;

            QRL_EDUMM.Caption   := FieldByName('EDUMM').AsString;
            QRL_LPOINT.Caption  := FieldByName('LPOINT').AsString;
            QRL_EDUTIME.Caption := FieldByName('EDUTIME').AsString;
            QRL_ENDYN.Caption   := FieldByName('ENDYN').AsString;

            QRL_EDUSCORE.Caption:= FieldByName('EDUSCORE').AsString;
            QRL_GET_LP.Caption  := FieldByName('GET_LP').AsString;

            Moredata := True;
            FM_Main.Q_Grid.Next;
       end;
  end;
end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

procedure TPrintForm.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  ParamVariant : String;
  Bungi, SDate : String;
begin
  with FM_Main do
  begin
       QRL_Empno.Caption     := vEmpno;
       QRL_Korname.Caption   := L_Korname.ValueCaption;
       QRL_deptname.Caption  := L_Deptname.ValueCaption;
       QRL_PAYCLNAME.Caption := L_PAYCLNAME.ValueCaption;
       QRL_PAYCLDATE.Caption := L_PAYCLDATE.ValueCaption;
  end;

  with FM_Main.TMaxDataSet do
  Begin
       ParamVariant := Format(' SELECT ' +
                              '        (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.BUMOON  AND CLASSNO = ''2'') CN_BUMOON,  ' +
                              '        (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.JMTRACK AND CLASSNO = ''3'') CN_JMTRACK, ' +
                              '        (SELECT HNAME FROM PEIDPCODE WHERE BASE_YY = A.BASE_YY AND CODENO  = A.JMLEVEL AND CLASSNO = ''4'') CN_JMLEVEL, ' +
                              '        TO_CHAR(SYSDATE,''YYYYMMDD'') SDATE, NULL ' +
                              '  From PEIDPMAS A          '+
                              ' WHERE A.BASE_YY  = ''%s'' '+
                              '   AND A.EMPNO    = ''%s'' ',
                                [FM_Main.sbase_yy, FM_Main.Ed_empno.Text]);
       Close;

       ServiceName := 'HINSA_select2';
       ClearFieldInfo;
       AddField('CN_BUMOON' , ftString, 400);
       AddField('CN_JMTRACK', ftString, 400);
       AddField('CN_JMLEVEL', ftString, 400);
       AddField('SDATE'     , ftString ,400);
       AddField('Field5'    , ftString, 400);

       ClearParamInfo;
       SQL.Text := ParamVariant;
       Open;

       QRL_Bumoon1.Caption := fields[0].AsString;
       QRL_TRACK1.Caption  := fields[1].AsString;
       QRL_LEVEL1.Caption  := fields[2].AsString;
       SDate               := fields[3].AsString;
  End;
{
  If (SDate > FM_Main.sbase_yy+'0630') Then
       Bungi := '하반기'
  Else
       Bungi := '상반기';
}
  QRL_Title.Caption := '[ ' + FM_Main.sbase_yy + '년 자기계발계획 ]';

  with FM_Main.TMaxDataSet do
  Begin
       ParamVariant := Format('SELECT WORKTASK, AFTPLAN,   '+
                              '       NULL,NULL,NULL       '+
                              '  FROM PEIDPMAS A           '+
                              ' WHERE A.BASE_YY  = ''%s''  '+
                              '   AND A.EMPNO    = ''%s''  ',
                                [FM_Main.sbase_yy, FM_Main.Ed_empno.Text]);

       Close;

       ServiceName := 'HINSA_select2';
       ClearFieldInfo;
       AddField('WORKTASK',ftString, 400);
       AddField('AFTPLAN' ,ftString, 400);
       AddField('Field3'  ,ftString, 400);
       AddField('Field4'  ,ftString, 400);
       AddField('Field5'  ,ftString, 400);

       ClearParamInfo;
       SQL.Text := ParamVariant;
       Open;

       QRM_worktask.Lines.Text := fields[0].AsString;
       QRM_aftplan.Lines.Text  := fields[1].AsString;
  End;

  QRL_LPOINT1.Caption := FM_Main.E_LPOINT.ValueCaption;
  QRL_GETLP.Caption   := FM_Main.E_GETLP.ValueCaption;
  QRM_dutytarget.Lines.Text := FM_Main.ED_dutytarget.ValueCaption;
end;

end.

