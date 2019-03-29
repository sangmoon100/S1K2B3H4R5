unit pib30305;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Pib30301,
  Qrctrls, QuickRpt, ExtCtrls, peprnview;

type
  TPrintForm2 = class(TForm)
    InReport: TQuickRep;
    QRBand2: TQRBand;
    QRL_certprno: TQRLabel;
    QRL_PrintDate: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_juminid: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_payraname: TQRLabel;
    QRL_indate: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_Compname: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_PresName: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportPreview(Sender: TObject);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm2: TPrintForm2;
  Fin      : file of Pib30301.TDataIn;
  DataIn   : Pib30301.TDataIn;

implementation

{$R *.DFM}

procedure TPrintForm2.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AssignFile(Fin, pib30301Form.HomeDir+'\list\pib3030c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  QRL_PrintDate.Caption := Copy(Pib30301Form.ME_certkidate.text,1,4)+' 년   '+
                           Copy(Pib30301Form.ME_certkidate.text,5,2)+' 월   '+
                           Copy(Pib30301Form.ME_certkidate.text,7,2)+' 일';
  QRL_Compname.Caption  := Pib30301Form.vCompname;
  QRL_PresName.Caption  := Pib30301Form.vPresname;

  if Pib30301Form.gbCheckGubun = True then
  begin
       Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,inReport);
       Fm_PreviewForm.Free;
  end;
end;

procedure TPrintForm2.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TPrintForm2.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
end;

procedure TPrintForm2.InReportNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if Eof(Fin) then
  begin
       MoreData := False;
       Exit;
  end;

  Read(Fin, DataIn);
  with DataIn do
  begin
       //2015.03.31.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
       //QRL_certprno.Caption  := acertprno;
       QRL_certprno.Caption  := Copy(acertprno,1,6) + '-' + Copy(acertprno,7,6) + '-' + apagecnt;
       QRL_korname.Caption   := akorname;
//       QRL_juminid.Caption   := ajuminid;
       QRL_juminid.Caption   := Copy(ajuminid,1,6) + ' - *******';
//       QRL_used.Caption      := aused;
       QRL_deptname.Caption  := adeptname;
       QRL_payraname.Caption := apayra;
       QRL_empno.Caption     := i_empno;
       QRL_indate.Caption    := aused;
       if (peprnView.Fm_PreviewForm.gbGubun = True) or (Pib30301Form.gbCheckGubun = True) then
       begin   //실제 출력시에만 출력여부 업데이트..
            with Pib30301Form.OraQuery1 do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('UPDATE PIHCERT                                             ');
                 SQL.Add('   SET CERTPRYN  = ''Y'',                                  ');
                 SQL.Add('       CERTPRDATE= '''+Pib30301Form.ME_certkidate.text+''',');
                 SQL.Add('       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),  ');
                 SQL.Add('       WRITEEMP  = :W_empno                                ');
                 SQL.Add(' WHERE EMPNO     = :K_empno                                ');
                 SQL.Add('   AND CERTKIND  = :K_certkind                             ');
                 SQL.Add('   AND CERTDATE  = :K_certdate                             ');

                 //2015.04.03.hjku.. adminyn 추가
                 SQL.Add('   AND adminyn   = :K_adminyn                              ');
                 ParamByName('K_adminyn').AsString := aadminyn;                 

                 if Pib30301Form.Notebook1.PageIndex = 0 then
                 begin // showmessage(Pib30301Form.E_STempno.Text + ' ' + '2' + ' ' + Pib30301Form.ME_certdate.Text);
                      ParamByName('W_empno').AsString    := Pib30301Form.Gempno;
                      ParamByName('K_empno').AsString    := Pib30301Form.E_STempno.Text;
                      ParamByName('K_certkind').AsString := '2';
                      ParamByName('K_certdate').AsString := Pib30301Form.ME_certdate.Text;
                 end
                 else
                 begin // showmessage(i_empno + ' ' + i_certkind + ' ' + i_certdate);
                      ParamByName('W_empno').AsString    := Pib30301Form.Gempno;
                      ParamByName('K_empno').AsString    := i_empno;
                      ParamByName('K_certkind').AsString := i_certkind;
                      ParamByName('K_certdate').AsString := i_certdate;
                 end;

                 EXECSQL;
                 Close;
            end;
       end;
  end;

  MoreData := True;
//  InReport.NewPage;

  if  Pib30301Form.E_STempno.Text = 'M061' then  //임시용... 해당 임원의 요청으로 하드코딩.
  begin
       QRL_indate.Caption := '1999.11.08 ~ 2006.12.31 (07년 01월)';
  end;
end;

end.
