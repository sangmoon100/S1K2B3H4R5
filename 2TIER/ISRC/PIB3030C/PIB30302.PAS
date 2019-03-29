unit pib30302;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, Pib30301, DB, DBTables,peprnview;

type
  TPrintForm1 = class(TForm)
    InReport: TQuickRep;
    QRBand_Detail: TQRBand;
    QRL_certprno: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_juminid: TQRLabel;
    QRL_used: TQRLabel;
    QRL_frtodate1: TQRLabel;
    QRL_deptname1: TQRLabel;
    QRL_frtodate2: TQRLabel;
    QRL_deptname2: TQRLabel;
    QRL_frtodate3: TQRLabel;
    QRL_deptname3: TQRLabel;
    QRL_frtodate4: TQRLabel;
    QRL_deptname4: TQRLabel;
    QRL_frtodate5: TQRLabel;
    QRL_deptname5: TQRLabel;
    QRL_frtodate6: TQRLabel;
    QRL_frtodate7: TQRLabel;
    QRL_frtodate8: TQRLabel;
    QRL_frtodate9: TQRLabel;
    QRL_frtodate10: TQRLabel;
    QRL_deptname6: TQRLabel;
    QRL_deptname7: TQRLabel;
    QRL_deptname8: TQRLabel;
    QRL_deptname9: TQRLabel;
    QRL_deptname10: TQRLabel;
    QRL_frtodate11: TQRLabel;
    QRL_frtodate12: TQRLabel;
    QRL_frtodate13: TQRLabel;
    QRL_frtodate14: TQRLabel;
    QRL_frtodate15: TQRLabel;
    QRL_deptname11: TQRLabel;
    QRL_deptname12: TQRLabel;
    QRL_deptname13: TQRLabel;
    QRL_deptname14: TQRLabel;
    QRL_deptname15: TQRLabel;
    QRL_frtodate16: TQRLabel;
    QRL_frtodate17: TQRLabel;
    QRL_frtodate18: TQRLabel;
    QRL_frtodate19: TQRLabel;
    QRL_frtodate20: TQRLabel;
    QRL_deptname16: TQRLabel;
    QRL_deptname17: TQRLabel;
    QRL_deptname18: TQRLabel;
    QRL_deptname19: TQRLabel;
    QRL_deptname20: TQRLabel;
    QRL_frtodate21: TQRLabel;
    QRL_deptname21: TQRLabel;
    QRL_PrintDate: TQRLabel;
    QRL_TOTfrtodate: TQRLabel;
    QRL_payra2_2: TQRLabel;
    QRL_payra2_3: TQRLabel;
    QRL_payra2_4: TQRLabel;
    QRL_payra2_5: TQRLabel;
    QRL_payra2_6: TQRLabel;
    QRL_payra2_7: TQRLabel;
    QRL_payra2_8: TQRLabel;
    QRL_payra2_9: TQRLabel;
    QRL_payra2_10: TQRLabel;
    QRL_payra2_11: TQRLabel;
    QRL_payra2_12: TQRLabel;
    QRL_payra2_13: TQRLabel;
    QRL_payra2_14: TQRLabel;
    QRL_payra2_15: TQRLabel;
    QRL_payra2_16: TQRLabel;
    QRL_payra2_17: TQRLabel;
    QRL_payra2_18: TQRLabel;
    QRL_payra2_19: TQRLabel;
    QRL_payra2_20: TQRLabel;
    QRL_payra2_21: TQRLabel;
    QRL_payra2_1: TQRLabel;
    QRL_payra_2: TQRLabel;
    QRL_payra_3: TQRLabel;
    QRL_payra_4: TQRLabel;
    QRL_payra_5: TQRLabel;
    QRL_payra_6: TQRLabel;
    QRL_payra_7: TQRLabel;
    QRL_payra_8: TQRLabel;
    QRL_payra_9: TQRLabel;
    QRL_payra_10: TQRLabel;
    QRL_payra_11: TQRLabel;
    QRL_payra_12: TQRLabel;
    QRL_payra_13: TQRLabel;
    QRL_payra_14: TQRLabel;
    QRL_payra_15: TQRLabel;
    QRL_payra_16: TQRLabel;
    QRL_payra_17: TQRLabel;
    QRL_payra_18: TQRLabel;
    QRL_payra_19: TQRLabel;
    QRL_payra_20: TQRLabel;
    QRL_payra_21: TQRLabel;
    QRL_payra_1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRImage1: TQRImage;
    QRLabel13: TQRLabel;
    QRL_Compname: TQRLabel;
    QRLabel9: TQRLabel;
    QRL_PresName: TQRLabel;
    QRImage2: TQRImage;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRL_Tatal: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape2: TQRShape;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportPreview(Sender: TObject);
    procedure QRBand_DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm1: TPrintForm1;
  Fin      : file of Pib30301.TDataIn;
  DataIn   : Pib30301.TDataIn;

implementation
{$R *.DFM}

procedure TPrintForm1.InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  AssignFile(Fin, pib30301Form.HomeDir+'\list\pib3030c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  QRL_PrintDate.Caption := Copy(Pib30301Form.ME_certkidate.text,1,4)+' 년   '+
                           Copy(Pib30301Form.ME_certkidate.text,5,2)+' 월   '+
                           Copy(Pib30301Form.ME_certkidate.text,7,2)+' 일';
  if Pib30301Form.gbCheckGubun = True then
  begin
       Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,inReport);
       Fm_PreviewForm.Free;
  end;
end;

procedure TPrintForm1.InReportAfterPrint(Sender: TObject);
begin
  System.Close(Fin);
end;

procedure TPrintForm1.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

procedure TPrintForm1.InReportNeedData(Sender: TObject; var MoreData: Boolean);
var
  i, j : Integer;
  Q_frtodate: TQRLabel;
  Q_deptname: TQRLabel;
  Q_paycl   : TQRLabel;
  Q_payra   : TQRLabel;
  Q_payra2  : TQRLabel;
begin
  i := 1;
  j := 1;

  if Eof(Fin) then
  begin
       MoreData := False;
       Exit;
  end;

  Read(Fin, DataIn);
  with DataIn do
  begin
       //정미정요청 양식에 맞지 않아서 '-'를 뺌 2011.11.03
       //QRL_certprno.Caption  := acertprno;
       //2015.03.31.hjku...출력년월별 일련번호로 통일하게 발행하기 위하여 변경...이지연씨 요청
       //QRL_certprno.Caption  := Copy(acertprno,1,4)+Copy(acertprno,6,2)+Copy(acertprno,9,6);
       QRL_certprno.Caption  := Copy(acertprno,1,6) + '-' + Copy(acertprno,7,6) + '-' + apagecnt;
       QRL_korname.Caption   := akorname;
//       QRL_juminid.Caption   := ajuminid;
       QRL_juminid.Caption   := Copy(ajuminid,1,6) + ' - *******';
       QRL_used.Caption      := aused;

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

       for i := 1 to pib30301.PRTROW + 1 do //prtrow+1
       begin
            Q_frtodate := Self.FindComponent('QRL_frtodate'+IntToStr(i)) as TQRLabel;
            Q_deptname := Self.FindComponent('QRL_deptname'+IntToStr(i)) as TQRLabel;
            Q_payra    := Self.FindComponent('QRL_payra_'+IntToStr(i)) as TQRLabel;
            Q_payra2   := Self.FindComponent('QRL_payra2_'+IntToStr(i)) as TQRLabel;

            Q_frtodate.Caption  := afrtodate;
            Q_deptname.Caption  := adeptname;
            Q_payra.Caption     := apayra;
            Q_payra2.Caption    := apayra2;
            Inc(j);

            if pos('년', adeptname) > 0 then break;
            if (i = 21) And ((aloadcount / 21) > 1)  then break; //pib30301.loadcount
            Read(Fin, DataIn);
       end;

       if  j < 22 then
       begin
            for i := j-1  to  pib30301.PRTROW + 1 do
            begin
                 Q_frtodate := Self.FindComponent('QRL_frtodate'+IntToStr(i)) as TQRLabel;
                 Q_deptname := Self.FindComponent('QRL_deptname'+IntToStr(i)) as TQRLabel;
                 Q_payra    := Self.FindComponent('QRL_payra_'+IntToStr(i)) as TQRLabel;
                 Q_payra2   := Self.FindComponent('QRL_payra2_'+IntToStr(i)) as TQRLabel;

                 if pos('년', adeptname) > 0 then
                 begin
                      Q_frtodate.Caption  := '';
                      Q_deptname.Caption  := '';
                      Q_payra.Caption     := '';
                      Q_payra2.Caption    := '';
                 end
                 else
                 begin
                      Q_frtodate.Caption  := afrtodate;
                      Q_deptname.Caption  := adeptname;
                      Q_payra.Caption     := apayra;
                      Q_payra2.Caption    := apayra2;
                 end;
            end;
       end;

       //if (pib30301.loadcount mod 21 = 0) then Read(Fin, DataIn);

       if pos('년', adeptname) > 0 then
       begin
            QRL_TOTfrtodate.Caption := adeptname;
       end
       else
       begin
            QRL_TOTfrtodate.Caption := '';
            QRL_Tatal.Caption := '';
       end;
  end;

  MoreData := True;
  InReport.NewPage;

  if  Pib30301Form.E_STempno.Text = 'M118' then  //임시용... 해당 임원의 요청으로 하드코딩.
  begin
       QRL_frtodate1.Caption  := '';
       QRL_frtodate2.Caption  := '2010/01/01~2010/12/31';
       QRL_frtodate3.Caption  := '2007/01/01~2009/12/31';
       QRL_frtodate4.Caption  := '1990/01/01~2006/12/31';
       QRL_frtodate5.Caption  := '';
       QRL_frtodate6.Caption  := '';
       QRL_frtodate7.Caption  := '';
       QRL_frtodate8.Caption  := '';
       QRL_frtodate9.Caption  := '';
       QRL_frtodate10.Caption := '';
       QRL_deptname1.Caption  := '퇴임(2010.12.31)';
       QRL_deptname2.Caption  := '고 문';
       QRL_deptname3.Caption  := '컨버전스영업본부';
       QRL_deptname4.Caption  := '기업영업실';
       QRL_deptname5.Caption  := '';
       QRL_deptname6.Caption  := '';
       QRL_deptname7.Caption  := '';
       QRL_deptname8.Caption  := '';
       QRL_deptname9.Caption  := '';
       QRL_deptname10.Caption := '';
       QRL_deptname11.Caption := '';
       QRL_payra_1.Caption    := '';
       QRL_payra2_1.Caption   := '';
       QRL_payra2_2.Caption   := '고  문';
       QRL_payra2_3.Caption   := '본부장';
       QRL_payra2_4.Caption   := '실  장';
       QRL_payra2_5.Caption   := '';
       QRL_payra2_6.Caption   := '';
       QRL_payra2_7.Caption   := '';
       QRL_payra2_8.Caption   := '';
       QRL_payra2_9.Caption   := '';
       QRL_payra2_10.Caption  := '';
       QRL_payra2_11.Caption  := '';

       QRL_TOTfrtodate.Caption := '1990.01.01 ~ 2010.12.31 (11년 00월)';
  end;
  

  if  Pib30301Form.E_STempno.Text = 'M061' then  //임시용... 해당 임원의 요청으로 하드코딩.
  begin
       QRL_frtodate2.Caption  := '2003/11/17~2006/12/31';
       QRL_frtodate3.Caption  := '2006/01/01';
       QRL_frtodate4.Caption  := '2004/01/01';
       QRL_frtodate5.Caption  := '2002/04/01~2003/11/16';
       QRL_frtodate6.Caption  := '2002/04/01';
       QRL_frtodate7.Caption  := '1999/11/15~2002/03/31';
       QRL_frtodate8.Caption  := '1999/11/15';
       QRL_frtodate9.Caption  := '';
       QRL_frtodate10.Caption := '';
       QRL_deptname2.Caption  := '영업부문 부산지사장';
       QRL_deptname3.Caption  := '승진';
       QRL_deptname4.Caption  := '임원 직급체계 조정';
       QRL_deptname5.Caption  := '영업단 / 영업.기술 담당, 지사장';
       QRL_deptname6.Caption  := '임원 승진';
       QRL_deptname7.Caption  := '영업본부 / 영업.기술 담당, 지사장';
       QRL_deptname8.Caption  := '신규채용';
       QRL_deptname9.Caption  := '';
       QRL_deptname10.Caption := '';
       QRL_deptname11.Caption := '';
       QRL_payra2_1.Caption   := '';
       QRL_payra2_2.Caption   := '상무';
       QRL_payra2_3.Caption   := '상무';
       QRL_payra2_4.Caption   := '상무보';
       QRL_payra2_5.Caption   := '이사대우';
       QRL_payra2_6.Caption   := '이사대우';
       QRL_payra2_7.Caption   := '수석부장';
       QRL_payra2_8.Caption   := '';
       QRL_payra2_9.Caption   := '';
       QRL_payra2_10.Caption  := '';
       QRL_payra2_11.Caption  := '';

       QRL_frtodate2.Font.Style := [fsBold];
       QRL_frtodate5.Font.Style := [fsBold];
       QRL_frtodate7.Font.Style := [fsBold];
       QRL_deptname1.Font.Style := [fsBold];
       QRL_deptname2.Font.Style := [fsBold];
       QRL_deptname5.Font.Style := [fsBold];
       QRL_deptname7.Font.Style := [fsBold];
       QRL_payra2_2.Font.Style  := [fsBold];
       QRL_payra2_5.Font.Style  := [fsBold];
       QRL_payra2_7.Font.Style  := [fsBold];

       QRL_TOTfrtodate.Caption := '1999.11.08 ~ 2006.12.31 (07년 01월)';
  end;

  if  Pib30301Form.E_STempno.Text = 'M070' then  //임시용... 해당 임원의 요청으로 하드코딩.
  begin
       QRL_frtodate2.Caption  := '2006/01/01~2006/08/10';
       QRL_frtodate3.Caption  := '2005/08/12~2005/12/31';
       QRL_frtodate4.Caption  := '2005/01/17~2005/08/11';
       QRL_frtodate5.Caption  := '2003/08/05~2005/01/16';
       QRL_frtodate6.Caption  := '';
       QRL_frtodate7.Caption  := '';
       QRL_frtodate8.Caption  := '';
       QRL_frtodate9.Caption  := '';
       QRL_frtodate10.Caption := '';
       QRL_deptname1.Caption  := '퇴임(2006.08.11)';
       QRL_deptname2.Caption  := '회장';
       QRL_deptname3.Caption  := '회장';
       QRL_deptname4.Caption  := '사장';
       QRL_deptname5.Caption  := '사장';
       QRL_deptname6.Caption  := '선임(2003.08.05)';
       QRL_deptname7.Caption  := '';
       QRL_deptname8.Caption  := '';
       QRL_deptname9.Caption  := '';
       QRL_deptname10.Caption := '';
       QRL_deptname11.Caption := '';
       QRL_payra2_1.Caption   := '회장';
       QRL_payra2_2.Caption   := '회장';
       QRL_payra2_3.Caption   := '회장';
       QRL_payra2_4.Caption   := 'CEO';
       QRL_payra2_5.Caption   := 'CEO';
       QRL_payra2_6.Caption   := 'CEO';
       QRL_payra2_7.Caption   := '';
       QRL_payra2_8.Caption   := '';
       QRL_payra2_9.Caption   := '';
       QRL_payra2_10.Caption  := '';
       QRL_payra2_11.Caption  := '';

  end;

  if  Pib30301Form.E_STempno.Text = 'M076' then  //임시용... 해당 임원의 요청으로 하드코딩.
  begin
       QRL_frtodate2.Caption  := '2005/09/01~2005/10/31';
       QRL_frtodate3.Caption  := '2005/01/17~2005/09/11';
       QRL_frtodate4.Caption  := '2004/05/24~2005/04/30';
       QRL_frtodate5.Caption  := '2004/05/24~2004/09/30';
       QRL_frtodate6.Caption  := '2004/05/24~2005/01/16';
       QRL_frtodate7.Caption  := '2004/01/10~2004/04/25';
       QRL_frtodate8.Caption  := '2004/01/01~2004/05/23';
       QRL_frtodate9.Caption  := '';
       QRL_frtodate10.Caption := '';
       QRL_frtodate11.Caption := '';
       QRL_frtodate12.Caption := '2001/04/01~2001/07/19';
       QRL_frtodate13.Caption := '';
       QRL_frtodate14.Caption := '';
       QRL_frtodate15.Caption := '2000/12/26~2001/07/19';
       QRL_frtodate16.Caption := '2000/06/01~2001/03/30';
       QRL_frtodate17.Caption := '1999/12/16~2000/05/31';
       QRL_frtodate18.Caption := '1999/11/02~1999/12/15';
       QRL_frtodate19.Caption := '1999/10/25~1999/11/01';
       QRL_frtodate20.Caption := '';
       QRL_frtodate21.Caption := '';

       QRL_deptname1.Caption  := '퇴임(2005.10.31)';
       QRL_deptname2.Caption  := '경영지원실';
       QRL_deptname3.Caption  := '기술연구팀';
       QRL_deptname4.Caption  := '시스템개발팀장 겸직';
       QRL_deptname5.Caption  := '기술계획실장 겸직';
       QRL_deptname6.Caption  := '기술연구팀';
       QRL_deptname7.Caption  := '시스템기술팀장 겸직';
       QRL_deptname8.Caption  := '기술연구팀';
       QRL_deptname9.Caption  := '신규채용(2004.01.01)';
       QRL_deptname10.Caption := '';
       QRL_deptname11.Caption := '퇴임(2001.07.20)';
       QRL_deptname12.Caption := '신기술개발실';
       QRL_deptname13.Caption := '신규채용(2011.04.01)';
       QRL_deptname14.Caption := '상무보 승격에 따른 당연면직(2001.03.31)';
       QRL_deptname15.Caption := '인터넷기술개발팀장 겸직';
       QRL_deptname16.Caption := '신기술개발실';
       QRL_deptname17.Caption := 'IMT2000사업단 기술전략팀';
       QRL_deptname18.Caption := '품질보증실 단말기술팀';
       QRL_deptname19.Caption := 'IMT2000사업단 기술개발팀';
       QRL_deptname20.Caption := '신규채용(1999.10.25)';
       QRL_deptname21.Caption := '';

       QRL_payra2_1.Caption   := '상무보';
       QRL_payra2_2.Caption   := '상무보';
       QRL_payra2_3.Caption   := '상무보';
       QRL_payra2_4.Caption   := '상무보';
       QRL_payra2_5.Caption   := '상무보';
       QRL_payra2_6.Caption   := '상무보';
       QRL_payra2_7.Caption   := '상무보';
       QRL_payra2_8.Caption   := '상무보';
       QRL_payra2_9.Caption   := '상무보';
       QRL_payra2_10.Caption  := '';
       QRL_payra2_11.Caption  := '상무보';
       QRL_payra2_12.Caption  := '상무보';
       QRL_payra2_13.Caption  := '상무보';
       QRL_payra2_14.Caption  := '실장';
       QRL_payra2_15.Caption  := '실장';
       QRL_payra2_16.Caption  := '실장';
       QRL_payra2_17.Caption  := '소팀장';
       QRL_payra2_18.Caption  := '소팀장';
       QRL_payra2_19.Caption  := '부장';
       QRL_payra2_20.Caption  := '부장';
       QRL_payra2_21.Caption  := '';

       QRL_TOTfrtodate.Caption := '1999.10.25 ~ 2005.10.31 (03 년 06 월)';
  end;
end;

procedure TPrintForm1.QRBand_DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //2015.03.23 jissi 안승윤으로 고정된 대표이사성명을 pkcpbas의 PresName으로 변경 HR팀 한정미 요청
  QRL_PresName.Caption := Pib30301Form.vPresname;
end;

end.

