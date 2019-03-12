unit UPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnEditMemo, OnEditNumCtl;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRS_Memo_E1: TQRShape;
    QRShape5: TQRShape;
    QRLabel19: TQRLabel;
    QRShape10: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape14: TQRShape;
    QRLabel31: TQRLabel;
    QRShape16: TQRShape;
    QR_MERIT_JVY: TQRLabel;
    QRShape20: TQRShape;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape48: TQRShape;
    QR_Memo_E1: TQRLabel;
    QRShape2: TQRShape;
    QR_MERIT_JCY: TQRLabel;
    QR_MERIT_JAY: TQRLabel;
    QR_MERIT_JRY: TQRLabel;
    QRS_MERIT_JRY: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QR_MERIT_JVN: TQRLabel;
    QRShape9: TQRShape;
    QR_MERIT_JCN: TQRLabel;
    QR_MERIT_JAN: TQRLabel;
    QR_MERIT_JRN: TQRLabel;
    QRS_MERIT_JRN: TQRShape;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    PageHeaderBand: TQRBand;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QR_Empno: TQRLabel;
    QR_Korname: TQRLabel;
    QR_Payraname: TQRLabel;
    QRL_Spedate: TQRLabel;
    QR_Workdate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QR_pstate: TQRLabel;
    QRShape28: TQRShape;
    QRLabel22: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QR_EXTCODE: TQRLabel;
    QR_jobdept: TQRLabel;
    QR_band: TQRLabel;
    QRShape34: TQRShape;
    QR_bandgroup: TQRLabel;
    QRShape35: TQRShape;
    QRLabel32: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QR_EMPDATE: TQRLabel;
    QR_paycldate: TQRLabel;
    QR_payYYMMDD: TQRLabel;
    QRShape46: TQRShape;
    QR_COMYYMMDD: TQRLabel;
    QRShape47: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel2: TQRLabel;
    Q_data: TTMaxDataSet;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    VCHK: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses HSubForm, HMainForm, HMainForm2, Hinsa_TmaxDM;

{$R *.DFM}

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If (VCHK.Caption = '일반') Then
  Begin
    QR_MERIT_JVY.Caption := FM_Main.MERIT_JVY.TEXT;
    QR_MERIT_JVN.Caption := FM_Main.MERIT_JVN.TEXT;
    QR_MERIT_JCY.Caption := FM_Main.MERIT_JCY.TEXT;
    QR_MERIT_JCN.Caption := FM_Main.MERIT_JCN.TEXT;

    if FM_Main.v_evcno = '1' then //비보임차부장만 리더십 확인.
    Begin
      QR_MERIT_JRY.Caption := FM_Main.MERIT_JRY.TEXT;
      QR_MERIT_JRN.Caption := FM_Main.MERIT_JRN.TEXT;
    End
    Else
    Begin
      QR_MERIT_JRY.Caption := '';
      QR_MERIT_JRN.Caption := '';
      QR_MERIT_JRY.Color := $00E3E3E3;
      QR_MERIT_JRN.Color := $00E3E3E3;

      QRS_MERIT_JRY.Brush.Color := $00E3E3E3;
      QRS_MERIT_JRN.Brush.Color := $00E3E3E3;
    End;

    QR_Memo_E1.Caption   := FM_Main.Memo_E1.TEXT;
    QR_MERIT_JAY.Caption := FM_Main.MERIT_JAY.TEXT;
    QR_MERIT_JAN.Caption := FM_Main.MERIT_JAN.TEXT;
  End
  Else if (VCHK.Caption = '공통') Then
  Begin
    QR_MERIT_JVY.Caption := FM_Main2.MERIT_JVY.TEXT;
    QR_MERIT_JVN.Caption := FM_Main2.MERIT_JVN.TEXT;
    QR_MERIT_JCY.Caption := FM_Main2.MERIT_JCY.TEXT;
    QR_MERIT_JCN.Caption := FM_Main2.MERIT_JCN.TEXT;

    if FM_Main2.v_evcno = '1' then //비보임차부장만 리더십 확인.
    Begin
      QR_MERIT_JRY.Caption := FM_Main2.MERIT_JRY.TEXT;
      QR_MERIT_JRN.Caption := FM_Main2.MERIT_JRN.TEXT;
    End
    Else
    Begin
      QR_MERIT_JRY.Caption := '';
      QR_MERIT_JRN.Caption := '';
      QR_MERIT_JRY.Color := $00E3E3E3;
      QR_MERIT_JRN.Color := $00E3E3E3;

      QRS_MERIT_JRY.Brush.Color := $00E3E3E3;
      QRS_MERIT_JRN.Brush.Color := $00E3E3E3;
    End;

    QR_Memo_E1.Caption   := FM_Main2.Memo_E1.TEXT;
    QR_MERIT_JAY.Caption := FM_Main2.MERIT_JAY.TEXT;
    QR_MERIT_JAN.Caption := FM_Main2.MERIT_JAN.TEXT;
  End;
end;


procedure TPrintForm.PageHeaderBandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var ParamVariant: String;
begin
    QRL_Spedate.Caption := ' (대상기간 : ' + Copy(sRabasdate,1,4) + ' 년) ';
    ParamVariant := ' SELECT (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I114'' AND CODENO = B.PSTATE) PSTATE, ' +
                    '        (SELECT codename FROM pyccode WHERE codeid = ''I113'' AND codeno = a.PAYRA)  PAYRA, ' +
                    '        (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE IN ' +
                    '        (SELECT EXTCODE  FROM pycdept WHERE orgnum = A.ORGNUM AND deptcode = b.deptcode)) EXTCODE, ' +
                    '        (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = B.ORGNUM AND DEPTCODE = B.JOBDEPT)   JOBDEPT, ' +
                    '        (SELECT codename FROM pyccode WHERE codeid = ''I112'' AND codeno = B.PAYCL) BAND, ' +
                    '        Substr(b.EMPDATE,1,4)||''년''||Substr(b.EMPDATE,5,2)||''월''||Substr(b.EMPDATE,7,2)||''일'' EMPDATE, ' +
                    '        Substr(b.PAYCLDATE,1,4)||''년''||Substr(b.PAYCLDATE,5,2)||''월''||Substr(b.PAYCLDATE,7,2)||''일'' PAYCLDATE, ' +
                    '        nvl(payclyy,0)||''년''||nvl(payclmm,0)||''월''||nvl(paycldd,0)||''일'' PAYYYMMDD, '+
                    '        nvl(comduyy,0)||''년''||nvl(comdumm,0)||''월''||nvl(comdudd,0)||''일'' comYYMMDD, '+
                    '        TO_CHAR(SYSDATE, ''YYYYMMDD'') SDATE '+
                    '  FROM pehremas a, PIMPMAS B  ' +
                    '  WHERE A.EMPNO     = B.EMPNO ' +
                    '    AND A.rabasdate = '''+sRabasdate+''' '+
                    '    AND A.empno     = '''+QR_Empno.Caption+'''  ';

  with Q_Data do
  begin
    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('PSTATE'   , ftString, 100);
    AddField('PAYRA'    , ftString, 100);
    AddField('EXTCODE'  , ftString, 100);
    AddField('JOBDEPT'  , ftString, 100);
    AddField('BAND'     , ftString, 100);
    AddField('EMPDATE'  , ftString, 100);
    AddField('PAYCLDATE', ftString, 100);
    AddField('PAYYYMMDD', ftString, 100);
    AddField('comYYMMDD', ftString, 100);
    AddField('SDATE'    , ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := ParamVariant;
    Open;

    QR_Payraname.Caption:= FieldByName('PAYRA').AsString;                                             //직책
    QR_pstate.Caption   := FieldByName('PSTATE').AsString;                                            //인사상태
    QR_EXTCODE.Caption  := FieldByName('EXTCODE').AsString;                                           //상위부서
    QR_jobdept.Caption  := FieldByName('JOBDEPT').AsString;                                           //근무부서
    QR_bandgroup.Caption:= FieldByName('EXTCODE').AsString + ' - ' + FieldByName('BAND').AsString;    //평가그룹
    QR_band.Caption     := FieldByName('BAND').AsString;                                              //band
    QR_EMPDATE.Caption  := FieldByName('EMPDATE').AsString;                                           //입사일
    QR_paycldate.Caption:= FieldByName('PAYCLDATE').AsString;                                         //band조정일
    QR_payYYMMDD.Caption:= FieldByName('PAYYYMMDD').AsString;
    QR_COMYYMMDD.Caption:= FieldByName('comYYMMDD').AsString;
    QR_Workdate.caption := copy(FieldByName('SDATE').AsString,1,4)+'-'+copy(FieldByName('SDATE').AsString,5,2)+'-'+copy(FieldByName('SDATE').AsString,7,2);
  end;
end;

end.
