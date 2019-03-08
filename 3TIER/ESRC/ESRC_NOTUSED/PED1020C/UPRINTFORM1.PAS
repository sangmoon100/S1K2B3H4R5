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
    Q_data: TTMaxDataSet;
    QRSubDetail1: TQRSubDetail;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QR_E1PERVIEW: TQRLabel;
    QRShape19: TQRShape;
    QRS_MERIT_JRN: TQRShape;
    QRLabel16: TQRLabel;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
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
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    var_empno, var_Rabasdate : String;
  end;

var
  PrintForm1: TPrintForm1;

implementation

uses HMainForm, HMainForm1, Hinsa_TmaxDM;

{$R *.DFM}

procedure TPrintForm1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var SqlText : String;
begin
  with Q_data do
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
                 '       '''' MERIT_JVY, '''' MERIT_JVN, '''' MERIT_JCY, '''' MERIT_JCN, '''' MERIT_JRY, '+
                 '       '''' MERIT_JRN, '''' MERIT_JAY, '''' MERIT_JAN, C.ELVIEW E1PERVIEW,  '+
                 '       (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''E101'' AND CODENO = (SELECT SUBSTR(PGROUP,4,2) FROM '+
                 '        PEHREMAS WHERE RABASDATE = A.RABASDATE AND EMPNO = C.EMPNO)) E2VALVIEW,  '+
                 '       TO_CHAR(SYSDATE, ''YYYYMMDD'') SEL_DATA  '+
                 ' FROM pehremas a, PIMPMAS B, PESREMAS C '+
                 ' WHERE A.rabasdate = '''+var_Rabasdate+''' '+
                 '   AND A.EMPNO     = B.EMPNO            '+
                 '   AND A.rabasdate = C.rabasdate        '+
                 '   AND A.EMPNO     = C.EMPNO            '+
                 '   AND C.PEMPNO    = '''+var_empno+''' ';

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

procedure TPrintForm1.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if Q_data.EOF then
  begin
    Moredata := False;
  end
  Else
  begin
    QRL_Spedate.Caption  := '(' + Copy(var_Rabasdate, 1, 4) + ' 년)';
    QR_Empno.Caption     := Q_data.FieldByName('EMPNO'    ).AsString;
    QR_Korname.Caption   := Q_data.FieldByName('KORNAME'  ).AsString;
    QR_Payraname.Caption := Q_data.FieldByName('PAYRA'    ).AsString;
    QR_pstate.Caption    := Q_data.FieldByName('PSTATE'   ).AsString;
    QR_EXTCODE.Caption   := Q_data.FieldByName('EXTCODE'  ).AsString;
    QR_jobdept.Caption   := Q_data.FieldByName('JOBDEPT'  ).AsString;
    QR_bandgroup.Caption := Q_data.FieldByName('E2VALVIEW').AsString;
    QR_band.Caption      := Q_data.FieldByName('BAND'     ).AsString;
    QR_EMPDATE.Caption   := Q_data.FieldByName('EMPDATE'  ).AsString;
    QR_paycldate.Caption := Q_data.FieldByName('PAYCLDATE').AsString;
    QR_payYYMMDD.Caption := Q_data.FieldByName('PAYYYMMDD').AsString;
    QR_COMYYMMDD.Caption := Q_data.FieldByName('COMYYMMDD').AsString;

    QR_E1PERVIEW.Caption := Q_data.FieldByName('E1PERVIEW').AsString;
    QR_Workdate.caption  := copy(Q_data.FieldByName('SEL_DATA' ).AsString,1,4)+'-'+copy(Q_data.FieldByName('SEL_DATA' ).AsString,5,2)+'-'+copy(Q_data.FieldByName('SEL_DATA' ).AsString,7,2);

    Moredata := True;
    Q_data.Next;
  end;
end;


end.
