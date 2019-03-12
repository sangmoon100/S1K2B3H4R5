unit UPrintForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnEditMemo, OnEditNumCtl;
type
  TPrintForm1 = class(TForm)
    QuickRep1: TQuickRep;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape48: TQRShape;
    QR_Workdate: TQRLabel;
    QRLabel4: TQRLabel;
    Q_data1: TTMaxDataSet;
    VCHK: TQRLabel;
    Q_data2: TTMaxDataSet;
    QRBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRShape5: TQRShape;
    QRShape15: TQRShape;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRShape12: TQRShape;
    QRS_MERIT_JRN: TQRShape;
    QRShape4: TQRShape;
    QRShape20: TQRShape;
    QRShape16: TQRShape;
    QRShape10: TQRShape;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRS_Memo_E1: TQRShape;
    QRShape2: TQRShape;
    QRS_MERIT_JRY: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QR_MERIT_JCN: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QR_MERIT_JRN: TQRLabel;
    QR_MERIT_JAN: TQRLabel;
    QR_MERIT_JAY: TQRLabel;
    QR_MERIT_JRY: TQRLabel;
    QR_MERIT_JCY: TQRLabel;
    QR_MERIT_JVY: TQRLabel;
    QR_MERIT_JVN: TQRLabel;
    QR_Memo_E1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
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
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm1: TPrintForm1;

implementation

uses HSubForm, Hinsa_TmaxDM, UPrnview;

{$R *.DFM}

procedure TPrintForm1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var SqlText : String;
begin
  with Q_data1 do
  begin
      SqlText := ' SELECT B.EMPNO , B.KORNAME,                                                                       '+
                 '       (SELECT codename FROM pyccode WHERE codeid = ''I113'' AND codeno = a.PAYRA)   PAYRA,        '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I114'' AND CODENO = B.PSTATE)  PSTATE,       '+
                 '       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE IN                       '+
                 '       (SELECT EXTCODE  FROM pycdept WHERE orgnum = A.ORGNUM AND deptcode = b.deptcode))  EXTCODE, '+
                 '       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = B.ORGNUM AND DEPTCODE = B.JOBDEPT)    JOBDEPT, '+
                 '       (SELECT codename FROM pyccode WHERE codeid = ''I112'' AND codeno = B.PAYCL)          BAND,  '+
                 '       SUBSTR(b.EMPDATE,1,4)||''년''||SUBSTR(b.EMPDATE,5,2)||''월''||SUBSTR(b.EMPDATE,7,2)||''일''   EMPDATE,  '+
                 '       SUBSTR(b.PAYCLDATE,1,4)||''년''||SUBSTR(b.PAYCLDATE,5,2)||''월''||SUBSTR(b.PAYCLDATE,7,2)||''일'' PAYCLDATE ,'+
                 '       NVL(payclyy,0)||''년''||NVL(payclmm,0)||''월''||NVL(paycldd,0)||''일'' PAYYYMMDD,  '+
                 '       NVL(comduyy,0)||''년''||NVL(comdumm,0)||''월''||NVL(comdudd,0)||''일'' COMYYMMDD,  '+
                 '       C.MERIT_JVY, C.MERIT_JVN, C.MERIT_JCY, C.MERIT_JCN, C.MERIT_JRY, '+
                 '       C.MERIT_JRN, C.MERIT_JAY, C.MERIT_JAN, C.E1PERVIEW, '+
//                 '       A.E2VALVIEW, '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''E101'' AND CODENO = SUBSTR(A.PGROUP,4,2)) E2VALVIEW, '+
                 '       TO_CHAR(SYSDATE, ''YYYYMMDD'') SEL_DATA  '+
                 ' FROM pehremas a, PIMPMAS B, PEHREMER C '+
                 ' WHERE A.rabasdate = '''+sRabasdate+''' '+
                 '   AND (A.E1Empno  = '''+gsEmpno+''' OR A.E2Empno='''+gsEmpno+''' ) '+
                 '   AND A.EMPNO     = B.EMPNO            '+
                 '   AND A.rabasdate = C.rabasdate(+)     '+
                 '   AND A.EMPNO     = C.EMPNO(+)         '+
                 '   AND A.RESTIYN   = ''Y''              '+
                 '   AND A.Empno Not in (Select empno from Petremas Where RabasDate = '''+sRabasdate+''' '+')' + //팀장은 상사평가에 안나오도록...
                 ' ORDER BY SUBSTR(A.PGROUP,4,2) ';

      ServiceName := 'PET3020A_sel1';  //SVRNAME = htmax_pe13
      ClearFieldInfo;
      AddField('EMPNO'    , ftString, 4);
      AddField('KORNAME'  , ftString, 12);
      AddField('PAYRA'    , ftString, 20);
      AddField('PSTATE'   , ftString, 20);
      AddField('EXTCODE'  , ftString, 60);
      AddField('JOBDEPT'  , ftString, 60);
      AddField('BAND'     , ftString, 20);
      AddField('EMPDATE'  , ftString, 22);
      AddField('PAYCLDATE', ftString, 22);
      AddField('PAYYYMMDD', ftString, 126);
      AddField('COMYYMMDD', ftString, 126);
      AddField('MERIT_JVY', ftString, 2000);
      AddField('MERIT_JVN', ftString, 2000);
      AddField('MERIT_JCY', ftString, 2000);
      AddField('MERIT_JCN', ftString, 2000);
      AddField('MERIT_JRY', ftString, 2000);
      AddField('MERIT_JRN', ftString, 2000);
      AddField('MERIT_JAY', ftString, 2000);
      AddField('MERIT_JAN', ftString, 2000);
      AddField('E1PERVIEW', ftString, 400);
      AddField('E2VALVIEW', ftString, 1000);
      AddField('SEL_DATA' , ftString, 8);

      Close;
      SQl.Clear;
      SQL.Text := Sqltext;
      Open;
  end;
end;

procedure TPrintForm1.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if Q_data1.EOF then
  begin
    Moredata := False;
  end
  Else
  begin
    QRL_Spedate.Caption  := '(' + Copy(sRabasdate, 1, 4) + '년)';

    QRL_Spedate.Caption  := '(' + Copy(sRabasdate, 1, 4) + '년)';
    QR_Empno.Caption     := Q_data1.FieldByName('EMPNO'    ).AsString;
    QR_Korname.Caption   := Q_data1.FieldByName('KORNAME'  ).AsString;
    QR_Payraname.Caption := Q_data1.FieldByName('PAYRA'    ).AsString;
    QR_pstate.Caption    := Q_data1.FieldByName('PSTATE'   ).AsString;
    QR_EXTCODE.Caption   := Q_data1.FieldByName('EXTCODE'  ).AsString;
    QR_jobdept.Caption   := Q_data1.FieldByName('JOBDEPT'  ).AsString;
    QR_bandgroup.Caption := Q_data1.FieldByName('E2VALVIEW').AsString;
    QR_band.Caption      := Q_data1.FieldByName('BAND'     ).AsString;
    QR_EMPDATE.Caption   := Q_data1.FieldByName('EMPDATE'  ).AsString;
    QR_paycldate.Caption := Q_data1.FieldByName('PAYCLDATE').AsString;
    QR_payYYMMDD.Caption := Q_data1.FieldByName('PAYYYMMDD').AsString;
    QR_COMYYMMDD.Caption := Q_data1.FieldByName('COMYYMMDD').AsString;
    QR_MERIT_JVY.Caption := Q_data1.FieldByName('MERIT_JVY').AsString;
    QR_MERIT_JVN.Caption := Q_data1.FieldByName('MERIT_JVN').AsString;
    QR_MERIT_JCY.Caption := Q_data1.FieldByName('MERIT_JCY').AsString;
    QR_MERIT_JCN.Caption := Q_data1.FieldByName('MERIT_JCN').AsString;
    QR_MERIT_JRY.Caption := Q_data1.FieldByName('MERIT_JRY').AsString;
    QR_MERIT_JRN.Caption := Q_data1.FieldByName('MERIT_JRN').AsString;
    QR_MERIT_JAY.Caption := Q_data1.FieldByName('MERIT_JAY').AsString;
    QR_MERIT_JAN.Caption := Q_data1.FieldByName('MERIT_JAN').AsString;
    QR_Memo_E1.Caption   := Q_data1.FieldByName('E1PERVIEW').AsString;
    QR_Workdate.caption  := copy(Q_data1.FieldByName('SEL_DATA' ).AsString,1,4)+'-'+copy(Q_data1.FieldByName('SEL_DATA' ).AsString,5,2)+'-'+copy(Q_data1.FieldByName('SEL_DATA' ).AsString,7,2);

    Moredata := True;
    Q_data1.Next;
  end;
end;


procedure TPrintForm1.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
  Fm_PreviewForm.Qr_Preview.OnProgressUpdate := nil;
end;

end.


