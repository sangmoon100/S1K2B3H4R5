unit UPrintForm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnEditMemo, OnEditNumCtl;
type
  TPrintForm2 = class(TForm)
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
    Q_data2: TTMaxDataSet;
    QRBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRShape20: TQRShape;
    QRShape16: TQRShape;
    QRShape14: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape6: TQRShape;
    QR_MERIT_JVY: TQRLabel;
    QR_MERIT_JVN: TQRLabel;
    QRLabel2: TQRLabel;
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
    var_empno, var_Rabasdate : String;
  end;

var
  PrintForm2: TPrintForm2;

implementation

uses HMainForm, HMainForm2, Hinsa_TmaxDM, UPrnview;

{$R *.DFM}

procedure TPrintForm2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var SqlText : String;
begin
  with Q_data1 do
  begin

             SqlText := ' SELECT A.EEMPNO , A.KORNAME,    '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = F.PAYRA)   PAYRA,   '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I114'' AND CODENO = F.PSTATE)  PSTATE,  '+
                 '       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE IN                 '+
                 '       (SELECT EXTCODE  FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = F.DEPTCODE))  EXTCODE,  '+
                 '       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = B.ORGNUM AND DEPTCODE = F.JOBDEPT)    JOBDEPT,  '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO = F.PAYCL)          BAND,     '+
                 '       SUBSTR(F.EMPDATE,1,4)||''년''||SUBSTR(F.EMPDATE,5,2)||''월''||SUBSTR(F.EMPDATE,7,2)||''일''   EMPDATE,  '+
                 '       SUBSTR(F.PAYCLDATE,1,4)||''년''||SUBSTR(F.PAYCLDATE,5,2)||''월''||SUBSTR(F.PAYCLDATE,7,2)||''일'' PAYCLDATE ,  '+
                 '       NVL(PAYCLYY,0)||''년''||NVL(PAYCLMM,0)||''월''||NVL(PAYCLDD,0)||''일'' PAYYYMMDD,  '+
                 '       NVL(COMDUYY,0)||''년''||NVL(COMDUMM,0)||''월''||NVL(COMDUDD,0)||''일'' COMYYMMDD,  '+
                 '       MERIT_EVY, MERIT_EVN, MERIT_ECY, MERIT_ECN, MERIT_ERY, MERIT_ERN, MERIT_EAY, MERIT_EAN, '''' E1PERVIEW, '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''E101'' AND CODENO = (SELECT SUBSTR(PGROUP,4,2) FROM '+
                 '        PEHREMAS WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EEMPNO)) E2VALVIEW,  '+
                 '       TO_CHAR(SYSDATE, ''YYYYMMDD'') SEL_DATA  '+
                 ' FROM PESMCS a, PEHAMAS b, PIMPMAS f    '+
                 ' WHERE a.rabasdate = '''+var_Rabasdate+''' '+
                 ' AND a.rabasdate = b.rabasdate          '+
                 ' AND a.empno     = b.empno              '+
                 ' AND a.eempno    = f.empno              '+
                 ' AND a.empno     = '''+var_empno+'''    '+
                 ' AND f.pstate    < ''80'' '+
                 ' ORDER BY E2VALVIEW DESC ';

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
      AddField('MERIT_EVY', ftString, 2000);
      AddField('MERIT_EVN', ftString, 2000);
      AddField('MERIT_ECY', ftString, 2000);
      AddField('MERIT_ECN', ftString, 2000);
      AddField('MERIT_ERY', ftString, 2000);
      AddField('MERIT_ERN', ftString, 2000);
      AddField('MERIT_EAY', ftString, 2000);
      AddField('MERIT_EAN', ftString, 2000);
      AddField('E1PERVIEW', ftString, 400);
      AddField('E2VALVIEW', ftString, 1000);
      AddField('SEL_DATA' , ftString, 8);

      Close;
      SQl.Clear;
      SQL.Text := Sqltext;
      Open;
  end;
end;

procedure TPrintForm2.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if Q_data1.EOF then
  begin
    Moredata := False;
  end
  Else
  begin
    QRL_Spedate.Caption  := '(' + Copy(var_Rabasdate, 1, 4) + '년)';

    QRL_Spedate.Caption  := '(' + Copy(var_Rabasdate, 1, 4) + '년)';
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
    QR_MERIT_JVY.Caption := Q_data1.FieldByName('MERIT_EVY').AsString;
    QR_MERIT_JVN.Caption := Q_data1.FieldByName('MERIT_EVN').AsString;
    QR_Workdate.caption  := copy(Q_data1.FieldByName('SEL_DATA' ).AsString,1,4)+'-'+copy(Q_data1.FieldByName('SEL_DATA' ).AsString,5,2)+'-'+copy(Q_data1.FieldByName('SEL_DATA' ).AsString,7,2);

    Moredata := True;
    Q_data1.Next;
  end;
end;


procedure TPrintForm2.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
  Fm_PreviewForm.Qr_Preview.OnProgressUpdate := nil;
end;

end.


