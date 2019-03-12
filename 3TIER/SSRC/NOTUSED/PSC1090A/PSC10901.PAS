unit psc10901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session,
  OnPopupEdit, TmaxFunc, Func, OnEditMdate, comobj, Ora, OnRegistry;

type
  TFM_Main = class(TForm)
    Panel_Body: TPanel;
    SF_Main: TOnSchemeForm;
    StatusBar1: TStatusBar;
    TMaxDataSet1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    TDS_dml1: TTMaxDataSet;
    TMaxDataSet0: TTMaxDataSet;
    DataSource1: TDataSource;
    OnShapeLabel3: TOnShapeLabel;
    p_empno: TOnEdit;
    p_appcnt: TOnNumberEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DbGrid1: TOnDBGrid;
    OnShapeLabel1: TOnShapeLabel;
    p_cprice: TOnNumberEdit;
    p_stockamt: TOnNumberEdit;
    p_taxsum: TOnNumberEdit;
    p_Gainamt: TOnNumberEdit;
    BT_Calc: TOnFocusButton;
    p_fixdate: TOnMaskEdit;
    E_Condate1: TOnDateEdit;
    BT_Cert: TOnFocusButton;
    Panel1: TPanel;
    BB_Excel: TOnFocusButton;
    TabSheet5: TTabSheet;
    BT_Cancel: TOnFocusButton;
    BT_Check1: TOnFocusButton;
    p_saveamt: TOnNumberEdit;
    B_image1: TOnFocusButton;
    B_image2: TOnFocusButton;
    B_image3: TOnFocusButton;
    B_image4: TOnFocusButton;
    B_image5: TOnFocusButton;
    B_image_All: TOnFocusButton;
    E_email: TOnEdit;
    B_image0: TOnFocusButton;
    B_image6: TOnFocusButton;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    BT_Check2: TOnFocusButton;
    E_Fixday: TOnDateEdit;
    E_Condate2: TOnDateEdit;
    BT_Save: TOnFocusButton;
    E_SQL: TEdit;
    BT_Mail: TOnFocusButton;
    BB_Close: TOnFocusButton;
    HelpMemo1: TMemo;
    BB_Help: TOnFocusButton;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_Check1Click(Sender: TObject);
    procedure BT_CalcClick(Sender: TObject);
    procedure B_image_AllClick(Sender: TObject);
    procedure B_imageClick(Sender: TObject);
    procedure BB_ExcelClick(Sender: TObject);
    procedure BT_MailClick(Sender: TObject);
    procedure BT_CertClick(Sender: TObject);
    procedure E_Condate1Change(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    Function  Process_Update(vSQL : String) : Boolean;
    procedure BT_Check2Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    
  private
    { Private declarations }
    SqlStr     : String;
    sEmpno     : String;
    sKorname   : String;
    sGrade     : String;
    vSysDate   : String;
    ParamSQL   : String;

    vStocknum : String;
    vSeq      : String;

    vMessage  : String;
    vEndDate1 : String;
    vEndDate2 : String;
    vPstate   : String;

  public
    { Public declarations }
    iSelect : Integer;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure PL_Select_Data;
    procedure RetrieveData;
    procedure ImageLoadSave;
    Function  ImageFind(v_empno : String; v_seq : Integer; v_gubun : String) : Integer;
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  end;

var
  FM_Main: TFM_Main;

implementation


{$R *.DFM}
uses
  StockXMLUnit, PSC10902, PSC10904;

procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10); //'12.4.13.90';
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  OraConnect; //이미지 등록을 위한 2Tier 접속.
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  sEmpno    := HInsa_Param(cmdline,1);
  sGrade    := HInsa_Param(cmdline,3);

  StatusBar1.Panels[1].Text := '저장된 자료를 읽고 있습니다. 잠시만 기다려 주십시요..';

  //초기화.................
  E_Fixday.EditLabel.Font.Color := clGray;
  BT_Check1.Enabled := False;
  BT_Check2.Enabled := False;
  E_Fixday.Enabled  := False;
  BT_Cancel.Enabled := False;
  BT_Cert.Enabled   := False;
  BT_Calc.Enabled   := False;
  BT_Mail.Enabled   := False;
  BT_Save.Enabled   := False;
  PageControl1.ActivePage := TabSheet1;

  with TMaxDataSet0 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT groupid, ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM pymenuuser                                             '+
                   ' where empno = '''+ sEmpno +'''                               ';

       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       //Open;

       //스톡옵션 업무 변경에 따른 종합인사 권한 변경 요청에 의한 변경.    SR-08-13285  2008.07.14.
       // 2096 P413 이 각각 맡은 업무그룹이 따로 있어 사번을 하드코딩함.
       //if  (FieldByName('field1').AsString <> 'G204') and (Copy(sEmpno,1,1) <> 'D') then //스톡옵션 행사 관리자....
       if  (sEmpno <> '0891') and (Copy(sEmpno,1,1) <> 'D') then //스톡옵션 행사 관리자....
       begin
            ShowMessage('귀하는 작업 권한이 부족합니다.  프로그램을 종료합니다.');
            FM_Main.Close;
       end;
       TMaxDataSet0.Close;
  end;
  if  (Copy(sEmpno,1,1) = 'D') then E_SQL.Visible := True;
  
  //시스템일시 Read......................................
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vSysDate          := FM_Tmax.GetData('sysdate','','');

  E_Condate1.Text   := DateToStr(GetFirstDayofLastMonth(Date));
  E_Condate2.Text   := Hinsa_DisplayDate(vSysDate,'-');
  E_Fixday.Text     := Hinsa_DisplayDate(vSysDate,'-');

  RetrieveData;
  
  StatusBar1.Panels[1].Text := '';
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert.
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDS_dml1 do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                             ');
       SQL.Add('values (to_char(sysdate,''yyyymmddhh24miss'' ), ');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',                 ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',                 ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',                 ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,                 ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',                 ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,                 ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',                 ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,                 ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',                 ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,                 ');  //EAI_FLAG
       SQL.Add('        ''''                  )                 ');  //EAI_DATE
       //edit1.text := sql.text;

       if not TDS_dml1.Execute then
       begin
            Result := false;
            exit;
       end;
       Result := True;
  end;

  Application.ProcessMessages;
end;

procedure TFM_Main.PL_Select_Data;
begin                       // showmessage(TMaxSession.Host);
     with TMaxDataSet0 do
     begin                                   //서비스사용 프로그램 : PSC1040C PSC1080A PSC1090A
          ServiceName := 'PSC1040C_sel1';    //server Name : htmax_ps11.
          Close;
          Sql.Clear;
          Sql.Text := Format( 'select empno,         '+
                              '       korname,       '+
                              '       paycl,         '+
                              '       pstate,        '+
                              '       telno,         '+
                              '       retcont,       '+
                              '       e_mail,        '+
                              '       empdate,       '+
                              '       retdate,       '+
                              '       curaddr,       '+
                              '       zipno,         '+
                              '       deptname,      '+
                              '       juminid        '+
                              '  from v_pstockinsa   '+
                              ' where empno = ''%s'' ',[TMaxDataSet1.FieldByName('EMPNO').AsString]);
          ClearFieldInfo;
          AddField('EMPNO'  , ftString,  4);
          AddField('KORNAME', ftString, 12);
          AddField('PAYCL'  , ftString, 20);
          AddField('PSTATE' , ftString, 20);
          AddField('TELNO'  , ftString, 15);
          AddField('RETCONT', ftString, 40);
          AddField('E_MAIL' , ftString, 60);
          AddField('EMPDATE', ftString,  8);
          AddField('RETDATE', ftString,  8);
          AddField('CURADDR', ftString, 80);
          AddField('ZIPNO'  , ftString,  7);
          AddField('DEPTNAME',ftString, 60);
          AddField('JUMINID', ftString, 14);
          open;

          Hinsa_FieldDisplay(Self,TMaxDataSet0,4,11);
          E_email.Text := FieldByName('E_MAIL').AsString;

          //////////////////////////////////////////////////////////////////////
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := 'SELECT ''field1'',, ''field2'', ''field3'', ''field4'',''field5''      '+
                      '  FROM pimpmas                                                         '+
                      ' where empno   = '''+ TMaxDataSet1.FieldByName('EMPNO').AsString +'''  '+
                      '   and retdate < '''+ TMaxDataSet1.FieldByName('FIXDATE').AsString +'''';

          ClearFieldInfo;
          AddField('field1' , ftString, 100);
          AddField('field2' , ftString, 100);
          AddField('field3' , ftString, 100);
          AddField('field4' , ftString, 100);
          AddField('field5' , ftString, 100);
          Open;

          if   TMaxDataSet0.RecordCount = 1 then
          begin
               vPstate      := '퇴직';
               p_empno.Text := p_empno.Text +' ('+ vPstate +')';
          end
          else vPstate      := '재직';
     end;
end;

procedure TFM_Main.RetrieveData;
begin
  Application.ProcessMessages;
  TMaxDataSet1.Close;

  vEndDate1 := RemoveChar(E_Condate1.Text,'-');
  vEndDate2 := RemoveChar(E_Condate2.Text,'-');

  ParamSQL := 'select a.EMPNO,       SEQ,       a.KORNAME,             '+#13+
              '       STOCKNUM,      SUBNUM,                           '+#13+
              '       nvl(APPCNT,0),                                   '+#13+
              '       nvl(CPRICE,0),                                   '+#13+
              '       nvl(STOCKAMT,0),                                 '+#13+
              '       nvl(GAINAMT,0),                                  '+#13+
              '       nvl((INTAX+JUTAX),0) TAXSUM,                     '+#13+
              '       Account,                                         '+#13+
              '       decode(flowstate,''A'',''행사개시신청'',         '+#13+
              '                        ''B'',''서류확인''    ,         '+#13+
              '                        ''C'',''주금납입확인'',         '+#13+
              '                        ''D'',''신청완료''    ,         '+#13+
              '                        ''E'',''신주교부''    ,         '+#13+
              '                        ''F'',''원천세납부''  ,         '+#13+
              '                        ''Z'',''행사철회'' ) FLOWSTATE, '+#13+
              '       APPEMP,     substr(APPDATE,1,8) APPDATE,         '+#13+
              '       CONEMP,     CONDATE,                             '+#13+
              '       PAYEMP,     PAYDATE,                             '+#13+
              '       FixEMP,     FixDATE,                             '+#13+
              '       GrantEMP,   GrantDATE,                           '+#13+
              '       TaxEMP,     TaxDATE,                             '+#13+
              '       CancelEMP,  CancelDATE,                          '+#13+
              '       Decode(PAYDATE,'''',''N'',''Y'')         PAYYN,  '+#13+
              '       decode(b.retdate,'''',''재직'',''퇴직'') RETYN   '+#13+
              '  from pstockapp A, pimpmas B                           '+#13+
              ' where A.empno = B.empno                                '+#13+
              '   And substr(appdate,1,8) between '''+ vEndDate1 +'''  '+#13+
              '                               and '''+ vEndDate2 +'''  ';

  if      PageControl1.ActivePage = TabSheet2 then ParamSQL := ParamSQL + ' and flowstate = ''A'' '
  else if PageControl1.ActivePage = TabSheet3 then ParamSQL := ParamSQL + ' and flowstate = ''B'' '
  else if PageControl1.ActivePage = TabSheet4 then ParamSQL := ParamSQL + ' And flowstate = ''C'' '
  else if PageControl1.ActivePage = TabSheet5 then ParamSQL := ParamSQL + ' And flowstate = ''D'' '
  else if PageControl1.ActivePage = TabSheet6 then ParamSQL := ParamSQL + ' And flowstate = ''E'' '
  else if PageControl1.ActivePage = TabSheet7 then ParamSQL := ParamSQL + ' And flowstate = ''F'' ';

  ParamSQL := ParamSQL + 'order by appdate desc, a.empno, seq  ';

  with TMaxDataSet1 do
  begin
       ServiceName :='PSC1080A_sel1';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('EMPNO'     , ftString,  4);
       AddField('SEQ'       , ftInteger, 2);
       AddField('KORNAME'   , ftString, 12);
       AddField('STOCKNUM'  , ftString,  2);
       AddField('SUBNUM'    , ftString,  2);
       AddField('APPCNT'    , ftFloat,  10);
       AddField('CPRICE'    , ftFloat,   7);
       AddField('STOCKAMT'  , ftFloat,  10);
       AddField('GAINAMT'   , ftFloat,  10);
       AddField('TAXSUM'    , ftFloat,   9);
       AddField('ACCOUNT'   , ftString, 11);
       AddField('FLOWSTATE' , ftString, 15);
       AddField('APPEMP'    , ftString,  4);
       AddField('APPDATE'   , ftString, 15);
       AddField('CONEMP'    , ftString,  4);
       AddField('CONDATE'   , ftString, 15);
       AddField('PAYEMP'    , ftString,  4);
       AddField('PAYDATE'   , ftString, 15);
       AddField('FIXEMP'    , ftString,  4);
       AddField('FIXDATE'   , ftString, 15);
       AddField('GRANTEMP'  , ftString,  4);
       AddField('GRANTDATE' , ftString, 15);
       AddField('TAXEMP'    , ftString,  4);
       AddField('TAXDATE'   , ftString, 15);
       AddField('CancelEMP' , ftString,  4);
       AddField('CancelDATE', ftString, 15);
       AddField('PAYEND'    , ftString,  1);
       AddField('RETYN'     , ftString,  4);  E_SQL.Text := sql.Text;
       Open;

       if TMaxDataSet1.RecordCount <= 0 then System.Exit;

       TFloatField(FieldByName('APPCNT')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('CPRICE')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('STOCKAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('TAXSUM')).DisplayFormat   := '#,##0';
  end;

  StatusBar1.Panels[1].Text := '조회 완료';
end;

Function TFm_Main.Process_Update(vSQL : String) : Boolean;
begin
  with TDS_dml1 do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;
       Sql.Add(vSQL);        E_SQL.text := SQl.text;

       if not TDS_dml1.Execute then
       begin
            Result := False;
            ShowMessage(' 저장중 에러가 발생했습니다. ' +#13+#13+
                        ' 현재 화면을 Capture하여 개발자에게 전송 바랍니다.' + IntToStr(Length(SQl.text)));
            System.Exit;
       end
       else StatusBar1.Panels[1].Text := '정상적으로 저장 되었습니다.';
  end;
  
  Result := True;
  Application.ProcessMessages;
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  E_Fixday.EditLabel.Font.Color := clGray;
  BT_Check1.Enabled := False;
  BT_Check2.Enabled := False;
  E_Fixday.Enabled  := False;
  BT_Cancel.Enabled := False;
  BT_Cert.Enabled   := False;
  BT_Calc.Enabled   := False;
  BT_Mail.Enabled   := False;
  BT_Save.Enabled   := False;
  E_email.Enabled   := False;
  p_taxsum.Enabled  := False;

  if   PageControl1.ActivePage = TabSheet1 then //전체
  begin
       BT_Check1.Caption := '처리';
       BB_Excel.Caption  := '전체List 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet2 then //서류확인
  begin
       BT_Check1.Caption := '주금납입처리[Mail]';
       BT_Check2.Caption := '서류접수처리';
       BT_Check1.Enabled := True;
       BT_Check2.Enabled := True;
       BT_Cancel.Enabled := True;
       BT_Cert.Enabled   := True;
       E_email.Enabled   := True;
       BB_Excel.Caption  := '신청자List 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet3 then
  begin
       E_Fixday.EditLabel.Font.Color := clBlue;
       BT_Check1.Caption := '주금납입처리[Mail]';
       BT_Check1.Enabled := True;
       E_Fixday.Enabled  := True;
       BT_Cancel.Enabled := True;
       E_email.Enabled   := True;
       BB_Excel.Caption  := '서류제출확인자 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
       E_Fixday.EditLabel.Font.Color := clBlue;
       BT_Check1.Caption := '처리';
       BT_Check2.Enabled := True;
       E_Fixday.Enabled  := True;
       BB_Excel.Caption  := '주금납입확인자 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet5 then
  begin
       BT_Check1.Caption := '신주교부처리';
       BT_Check1.Enabled := True;
       BT_Calc.Enabled   := True;
       BT_Mail.Enabled   := True;
       BT_Save.Enabled   := True;
       E_email.Enabled   := True;
       p_taxsum.Enabled  := True;
       BB_Excel.Caption  := '신청완료자 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet6 then
  begin
       BT_Check1.Caption := '세액납부처리[Mail]';
       BT_Check1.Enabled := True;
       E_email.Enabled   := True;
       BB_Excel.Caption  := '신주교부완료자 엑셀추출';
  end
  else if PageControl1.ActivePage = TabSheet7 then
  begin
       BT_Check1.Caption := '처리';
       BB_Excel.Caption  := '세액납부완료자 엑셀추출';
  end;

  RetrieveData;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //초기화....
  p_empno.Text    := '';
  p_fixdate.Text  := '';
  p_cprice.Value  := 0;
  p_saveamt.Value := 0;
  p_appcnt.Value  := 0;
  p_stockamt.Value:= 0;
  p_taxsum.Value  := 0;
  p_Gainamt.Value := 0;
  //////////////////////////////////////////////////////////////////////////////

  with TMaxDataSet1 do
  begin
       p_empno.Text     := FieldByName('EMPNO').AsString +' - '+
                           FieldByName('KORNAME').AsString;
       p_fixdate.Text   := HINSA_DisplayDate(FieldByName('FIXDATE').AsString,'-');
       p_cprice.Value   := FieldByName('CPRICE').AsInteger;
       p_appcnt.value   := FieldByName('APPCNT').AsInteger;
       p_stockamt.value := FieldByName('STOCKAMT').AsFloat;
       p_taxsum.value   := FieldByName('TAXSUM').AsFloat;
       p_Gainamt.value  := FieldByName('GAINAMT').AsFloat;
  end;

  Application.ProcessMessages;
  with TMaxDataSet0 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT saveamt, ''field2'', ''field3'', ''field4'',''field5''            '+
                   '  FROM pstockmas                                                         '+
                   ' where stocknum = '''+ TMaxDataSet1.FieldByName('STOCKNUM').AsString+''' '+
                   '   and subnum   = '''+ TMaxDataSet1.FieldByName('SUBNUM').AsString+'''   ';

       ClearFieldInfo;
       AddField('field1' , ftFloat,  100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       Open;
  end;

  p_saveamt.Value := TMaxDataSet0.FieldByName('field1').AsFloat; //행사가액
  vSeq            := TMaxDataSet1.FieldByName('SEQ').AsString;   //행사신청횟수

  B_image3.Enabled := False;
  B_image4.Enabled := False;
  if   TMaxDataSet1.FieldByName('RETYN').AsString = 'Y' then B_image4.Enabled := True
  else                                                       B_image3.Enabled := True;

  PL_Select_Data; //인적사항 조회..
end;

procedure TFM_Main.BT_Check1Click(Sender: TObject);
begin
  SendProgID := 'PSC1090A';
  SendEmpno  := sEmpno; //발신자

  if   vPstate = '퇴직' then RcveEmpno := E_email.Text
  else                       RcveEmpno := sEmpno;           //수신자 Copy(p_empno.Text,1,4);

  if sEmpno ='D006' then
  begin
       SendEmpno   := 'Z113';                //sEmpno;
       RcveEmpno   := 'dsa2000@hanmail.net'; //Copy(p_empno.Text,1,4);
  end;

  if TMaxDataSet1.RecordCount < 1 then
  begin
       showmessage('처리할 사원이 존재하지 않습니다.');
       exit;
  end;

  if   PageControl1.ActivePage = TabSheet3 then
  begin
       if MessageDlg(' 선택한 사원의 신청완료일을 '+ E_Fixday.Text + '일로 처리를 진행 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;

  
  //////////////////////////////////////////////////////////////////////////////
  if     (PageControl1.ActivePage = TabSheet2) or (PageControl1.ActivePage = TabSheet3) then
  begin
       if  (vPstate = '퇴직') and (Length(Trim(E_email.Text)) < 5) then
       begin
            ShowMessage('해당사원의 E-Mail를 확인하여 주시기 바랍니다. [미발송]');
            Exit;
       end;

       if MessageDlg('선택한 사원의 주금납입완료확인 처리를 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

       ParamSQL := 'Update pstockapp  Set                                  '+#13+
                   '       flowstate = ''C''                              ,'+#13+
                   '       payemp    = '''+  sEmpno                   +''','+#13+
                   '       paydate   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
                   ' Where Empno     = '''+  Copy(p_empno.Text,1,4)   +''' '+#13+
                   '   And Seq       = '''+  vSeq                     +''' ';

       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       MailSubject := '[ Stock Option 주금납입 및 행사신청접수 완료 통보 ]';
       MailBody    := Hinsa_DisplayDate(TMaxDataSet1.FieldByName('APPDATE').AsString,'-') +'일 신청하신 스톡옵션에 대하여         '+#13+
                      '귀하의 주금납입 및 행사신청 접수가 완료되었습니다.                                                         '+#13+
                      '행사하신 옵션에 따른 신주 발행은 익월에 진행되며                                                           '+#13+
                      '익월 15일까지 제출하신 증권계좌로 입고 예정입니다.                                                         '+#13+
                      '원천징수세액은 신주입고후 익월 말일(회사 영업시간내)까지 납입하셔야 합니다.                                '+#13+
                      '납입할 원천징수세액은 신주입고일 + 2영업일내에                                                             '+#13+
                      '종합인사시스템 - 복리후생/우리사주 - STOCK OPTION - STOCK OPTION 행사신청 및 현황에서 확인하실 수 있습니다 ';
       ReceiveYN   := 'N';

       if   Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            StatusBar1.Panels[1].Text := '사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
       else
       begin
            ShowMessage( 'Mail 발송 실패 - 사번 : '+ RcveEmpno );
            exit;
       end;
       MessageDlg('메일 전송 완료..',mtInformation, [mbOk], 0);
  end

  else if PageControl1.ActivePage = TabSheet5 then
  begin
       if MessageDlg(' 선택한 사원의 신주교부확인 처리를 하시겠습니까? ' +#13+#13+
                     ' (세액메일발송[Mail]을 했는지 확인 요망) ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

       ParamSQL := 'Update pstockapp  Set                                  '+#13+
                   '       flowstate = ''E''                              ,'+#13+
                   '       GrantEMP  = '''+  sEmpno                   +''','+#13+
                   '       GrantDATE = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
                   ' Where Empno     = '''+  Copy(p_empno.Text,1,4)   +''' '+#13+
                   '   And Seq       = '''+  vSeq                     +''' ';
  end

  else if PageControl1.ActivePage = TabSheet6 then
  begin
       if  (vPstate = '퇴직') and (Length(Trim(E_email.Text)) < 10) then
       begin
            ShowMessage('E-Mail를 확인하여 주시기 바랍니다. [미발송]');
            Exit;
       end;       

       if MessageDlg('선택한 사원의 세액납부확인 처리를 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

       ParamSQL := 'Update pstockapp  Set                                  '+#13+
                   '       flowstate = ''F''                              ,'+#13+
                   '       TaxEMP    = '''+  sEmpno                   +''','+#13+
                   '       TaxDATE   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
                   ' Where Empno     = '''+  Copy(p_empno.Text,1,4)   +''' '+#13+
                   '   And Seq       = '''+  vSeq                     +''' ';

       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       MailSubject := '[ Stock Option 원천징수세액 납입 완료 통보 ]';
       MailBody    := Hinsa_DisplayDate(TMaxDataSet1.FieldByName('APPDATE').AsString,'-') +'일 신청하신 스톡옵션에 대하여'+#13+
                      '귀하께서 당사로 세액을 납부하셨습니다. '+#13+
                      '납부하신 세액은 '+#13+
                      '종합인사시스템 - 복리후생/우리사주 - STOCK OPTION - STOCK OPTION 행사신청 및 현황에서 확인하실 수 있습니다 ';
       ReceiveYN   := 'N';

       if   Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            StatusBar1.Panels[1].Text := '사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
       else
       begin
            ShowMessage( 'Mail 발송 실패 - 사번 : '+ RcveEmpno );
            exit;
       end;
       MessageDlg('메일 전송 완료..',mtInformation, [mbOk], 0);
       ////////////////////////////////////////////////////////////////////////////////////////////////////////////////                   
  end;

  Process_Update(ParamSQL);

  ////////////////////////////////////////////////////////////////////////////////
  if   (PageControl1.ActivePage = TabSheet3) or (PageControl1.ActivePage = TabSheet4) then
  begin
       with TMaxDataSet0 do   //서류확인Y  & 주금납입 Y 이면  최종완료 처리/
       begin
            ServiceName := 'HINSA_select';
            ClearFieldInfo;
            AddField('field1' , ftString, 100);
            AddField('field2' , ftString, 100);
            AddField('field3' , ftString, 100);
            AddField('field4' , ftString, 100);
            AddField('field5' , ftString, 100);

            Close;
            Sql.Clear;
            Sql.Text := 'SELECT 1, ''field2'', ''field3'', ''field4'',''field5'' '+#13+
                        '  FROM pstockapp                                        '+#13+
                        ' where conemp is not null                               '+#13+
                        '   and payemp is not null                               '+#13+
                        '   and Empno  = '''+  Copy(p_empno.Text,1,4)     +'''   '+#13+
                        '   and Seq    = '''+  vSeq                       +'''   ';
            Open;

            if  TMaxDataSet0.RecordCount > 0 then
            begin
                 ParamSQL := 'Update pstockapp Set                                        '+#13+
                             '       flowstate = ''D''                                   ,'+#13+
                             '       fixemp    = '''+  sEmpno                        +''','+#13+
                             '       fixdate   = '''+  RemoveChar(E_Fixday.Text,'-') +''' '+#13+
                             ' Where Empno     = '''+ Copy(p_empno.Text,1,4)         +''' '+#13+
                             '   And Seq       = '''+ vSeq                           +''' ';

                 Process_Update(ParamSQL);
            end;
       end;
  end;
  ////////////////////////////////////////////////////////////////////////////////

  RetrieveData;                                                                   
end;

procedure TFM_Main.BT_Check2Click(Sender: TObject);
begin
  if   PageControl1.ActivePage = TabSheet4 then
  begin
       if MessageDlg('선택한 사원의 신청완료일을 '+ E_Fixday.Text + '일로 처리를 진행 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;

  
  if MessageDlg('선택한 사원의 서류접수확인 처리를 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  ParamSQL := 'Update pstockapp  Set                                  '+#13+
              '       flowstate = ''B''                              ,'+#13+
              '       conemp    = '''+  sEmpno                   +''','+#13+
              '       condate   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
              ' Where Empno     = '''+  Copy(p_empno.Text,1,4)   +''' '+#13+
              '   And Seq       = '''+  vSeq                     +''' ';

  Process_Update(ParamSQL);

  RetrieveData;
end;

procedure TFM_Main.BT_CertClick(Sender: TObject);
begin
  if MessageDlg( IntToStr(TMaxDataSet1.RecordCount) +' 명의 신청자에 증명서 발급 신청을 하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  ParamSQL := 'Insert into pihcert                                                        '+#13+
              '       (EMPNO,    KORNAME,   PAYRA,    TELNO,                              '+#13+
              '        CERTKIND, CERTDATE,  CERTUSED, CERTCNT,                            '+#13+
              '        CERTPRYN, WRITETIME, WRITEEMP           )                          '+#13+
              '(select a.empno                                             ,              '+#13+
              '        a.korname                                           ,              '+#13+
              '        b.payra                                             ,              '+#13+
              '        b.telno                                             ,              '+#13+
              '        Case when (nvl(retdate,''99999999'') >= nvl(fixdate,''00000000'')) '+#13+  //1재직 2경력증명서.
              '        then      ''1''  else  ''2''   end                  ,              '+#13+
              '        to_char(sysdate, ''yyyymmdd'')                      ,              '+#13+
              '        ''은행제출용(스톡옵션행사)''                        ,              '+#13+
              '        1                                                   ,              '+#13+
              '        ''N''                                               ,              '+#13+
              '        to_char(sysdate, ''YYYYMMDDHH24MI'')                ,              '+#13+
              '        '''+ sEmpno +'''                                                   '+#13+
              '   from pstockapp a, pimpmas b                                             '+#13+
              '  where a.empno = b.empno                                                  '+#13+
              '    And substr(appdate,1,8) between '''+ vEndDate1 +'''                    '+#13+
              '                                and '''+ vEndDate2 +'''                    ';

  Process_Update(ParamSQL);

  ///ParamSQL := 'delete from  pihcert where certused like ''%스톡%'' ';
  ///Process_Update(ParamSQL);

  ShowMessage(' 신청자의 증명서 용도를 "은행제출용(스톡옵션행사)" 으로 신청을 완료 하였습니다.');
  StatusBar1.Panels[1].Text := '증명서 신청 완료';
  Application.ProcessMessages;
end;

procedure TFM_Main.BT_CalcClick(Sender: TObject);
var vFlowstate : String;
begin
   vFlowstate := 'D';  //세금계산 상태기준 ...

 { BT_CpriceClick(Sender); //종가조회..
  if vEndPrice = 0 then Exit; }

  //종가 저장...(세금 초기화) ///////////////////////////////////////////////////
  ParamSQL := 'Update pstockapp A                                          '+#13+
              '   Set cprice    =  (select cprice from pstockbas           '+#13+
              '                      where stockdate = A.fixdate) ,        '+#13+
              '       Intax     = 0                               ,        '+#13+
              '       Jutax     = 0                                        '+#13+
              ' Where flowstate = '''+ vFlowstate + '''                    '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''      '+#13+
              '                               and '''+ vEndDate2 +'''      ';

  if not Process_Update(ParamSQL) then Exit;

  //행사이익금 저장.
  ParamSQL := 'Update pstockapp A                                          '+#13+
              '   Set Gainamt   = (select (A.cprice - saveamt) * A.appcnt  '+#13+
              '                      from pstockmas                        '+#13+
              '                     where A.stocknum = stocknum            '+#13+
              '                       and A.subnum   = subnum   )          '+#13+
              ' Where flowstate = '''+ vFlowstate + '''                    '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''      '+#13+
              '                               and '''+ vEndDate2 +'''      ';

  if not Process_Update(ParamSQL) then Exit;

  //내외국인 구분 저장.   1내국인 9외국인
  ParamSQL := 'Update pstockapp A                                                                       '+#13+
              '   Set foreign   = nvl((select decode(substr(juminid,8,1),''5'',''9'',''6'',''9'',''1'') '+#13+
              '                          from pimpmas                                                   '+#13+
              '                         where A.empno   = empno   ),''1'')                              '+#13+
              ' Where flowstate = '''+ vFlowstate + '''                                                 '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +''' and '''+ vEndDate2 +'''           ';

  if not Process_Update(ParamSQL) then Exit;              
  Application.ProcessMessages;
  //////////////////////////////////////////////////////////////////////////////


  //합산총액(AllTaxamt)의 세율(NewRate)이 전년도 연말정산세율(OldRate)과 다르면
  //과세표준구간에 따라 금액을 분리하여 계산후 합산.
  //재직자(정규직) 세액 계산 (전년도 소득기준) : 합산과세 & 차등세율 적용방법   ////////////////////////////////
  ParamSQL := 'update pstockapp Z Set ( Intax, Jutax )                                                    '+#13+
              '     = (select Floor( Case when (x.NewRate = y.OldRate) Then x.GTaxamt * y.OldRate / 100   '+#13+
              '                      Else (x.AllTaxamt - y.taxpayto) * x.NewRate / 100  +                 '+#13+
              '                           (y.taxpayto  - y.taxlevel) * y.OldRate / 100                    '+#13+
              '                      End                                                                  '+#13+
              '                     / 10 ) * 10                                                     Intax,'+#13+ //원단위 절삭.
              '               Floor((Case when (x.NewRate = y.OldRate) Then x.GTaxamt * y.OldRate / 100   '+#13+
              '                      Else (x.AllTaxamt - y.taxpayto) * x.NewRate / 100 +                  '+#13+
              '                           (y.taxpayto  - y.taxlevel) * y.OldRate / 100                    '+#13+
              '                      End  * 0.1 )                                                         '+#13+ //주민세율
              '                     / 10 ) * 10                                                     Jutax '+#13+ //원단위 절삭.
              '          from                                                                             '+#13+
              '              (Select b.empno, b.AllTaxamt, b.GTaxamt, a.Taxrate NewRate                   '+#13+
              '                 from pkcptax a,                                                           '+#13+
              '                     (select a.empno, (Gainamt + c.taxlevel) AllTaxamt,                    '+#13+
              '                                      (Gainamt             ) GTaxamt                       '+#13+
              '                        from pstockapp a, pkhyshis c                                       '+#13+
              '                       where a.empno     = c.empno                                         '+#13+
              '                         and c.workyy    = to_char(sysdate-366,''yyyy'')                   '+#13+
              '                         and a.flowstate = '''+ vFlowstate + '''  ) b                      '+#13+
              '                where taxpayfr <= b.AllTaxamt  and  taxpayto >  b.AllTaxamt                '+#13+
              '                  and taxnum = (select ctaxnum from pkcpbas)                           ) x,'+#13+
              '              (Select empno, taxlevel, taxpayto, a.Taxrate OldRate                         '+#13+
              '                 from pkcptax a,                                                           '+#13+
              '                     (select empno, taxlevel                                               '+#13+
              '                        from pkhyshis c                                                    '+#13+
              '                       where workyy = to_char(sysdate-366,''yyyy'')    ) b                 '+#13+
              '                where taxpayfr <= b.taxlevel and taxpayto >  b.taxlevel                    '+#13+
              '                  and taxnum = (select ctaxnum from pkcpbas)                           ) y '+#13+
              '         where x.empno = y.empno     )                                                     '+#13+
              ' where flowstate = '''+ vFlowstate + '''                                                   '+#13+
              '   and nvl(fixdate,''0'') < (select nvl(retdate,''9'') from pimpmas where Z.empno = empno) '+#13+ //
              '   and (empno not like ''M%'' and empno <> ''Q017'')                                       '+#13+
              '   and stocknum not in (''6'',''7'')                                                       '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''  and '''+ vEndDate2 +'''            ';

  if not Process_Update(ParamSQL) then Exit;

  //재직자(정규직) 세액 계산 : 6,7차 연간 3천만원까지 비과세.
  ParamSQL := 'update pstockapp Z Set ( Intax, Jutax )                                                       '+#13+
              '   = (select Floor( Case when  (x.NewRate = y.OldRate) Then     x.GTaxamt * y.OldRate / 100   '+#13+
              '                    Else (x.AllTaxamt - y.taxpayto) * x.NewRate / 100  +                      '+#13+
              '                         (y.taxpayto  - y.taxlevel) * y.OldRate / 100                         '+#13+
              '                    End                / 10 ) * 10                                    Intax,  '+#13+ //원단위 절삭.
              '             Floor((Case when (x.NewRate = y.OldRate) Then      x.GTaxamt * y.OldRate / 100   '+#13+
              '                    Else (x.AllTaxamt - y.taxpayto) * x.NewRate / 100 +                       '+#13+
              '                         (y.taxpayto  - y.taxlevel) * y.OldRate / 100                         '+#13+
              '                    End  * 0.1 )      / 10 ) * 10                                     Jutax   '+#13+ //원단위 절삭.
              '        from (Select b.empno, b.AllTaxamt, b.GTaxamt, a.Taxrate NewRate                       '+#13+
              '                from pkcptax a,                                                               '+#13+
              '                    (select a.empno,                                                          '+#13+
              '                           ( Gainamt + c.taxlevel ) AllTaxamt,                                '+#13+
              '                           ( Gainamt                                                          '+#13+ //GTaxamt = 옵션행사가액 * (주식매입가액-연간3000만원) / 주식매입가격
              '                             * ( stockamt                                                     '+#13+
              '                                - ( nvl((select greatest(30000000-sum(stockamt), 0)           '+#13+
              '                                           from pstockapp                                     '+#13+
              '                                          where a.empno   = empno                             '+#13+
              '                                            and flowstate = ''F''                             '+#13+//F처리완료내역
              '                                            and stocknum  in (''6'',''7'')                    '+#13+
              '                                          group by empno ) , 30000000 )   )                   '+#13+
              '                               )                                                              '+#13+
              '                             / stockamt  )                                           GTaxamt  '+#13+
              '                       from pstockapp a, pkhyshis c                                           '+#13+
              '                      where a.empno    = c.empno                                              '+#13+
              '                        and workyy     = to_char(sysdate-366,''yyyy'')                        '+#13+
              '                        and flowstate  = '''+ vFlowstate + '''        ) b                     '+#13+
              '               where taxpayfr <= b.AllTaxamt  and  taxpayto >  b.AllTaxamt                    '+#13+
              '                 and taxnum = (select ctaxnum from pkcpbas)                              ) x, '+#13+
              '             (Select empno, taxlevel, taxpayto, a.Taxrate OldRate                             '+#13+
              '                from pkcptax a, (select empno, taxlevel from pkhyshis c                       '+#13+
              '                                  where workyy  = to_char(sysdate-366,''yyyy'') ) b           '+#13+
              '               where taxpayfr <= b.taxlevel and taxpayto >  b.taxlevel                        '+#13+
              '                 and taxnum = (select ctaxnum from pkcpbas)                              ) y  '+#13+
              '       where x.empno = y.empno     )                                                          '+#13+
              ' where flowstate = '''+ vFlowstate + '''                                                      '+#13+
              '   and nvl(fixdate,''0'') < (select nvl(retdate,''9'') from pimpmas where Z.empno = empno)    '+#13+ //
              '   and (empno not like ''M%'' and empno <> ''Q017'')                                          '+#13+
              '   and stocknum in (''6'',''7'')                                                              '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''  and '''+ vEndDate2 +'''               ';

  if not Process_Update(ParamSQL) then Exit;
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //재직자(임원) 세금 로직 35% 단일세율..
  ParamSQL := 'update pstockapp Z                                                                     '+#13+
              '   Set Intax = Floor(  Gainamt * decode(foreign,''9'', 0.17, 0.35)        / 10 ) * 10, '+#13+ //외국인 17%
              '       Jutax = Floor( (Gainamt * decode(foreign,''9'', 0.17, 0.35) * 0.1) / 10 ) * 10  '+#13+
              ' where flowstate = '''+ vFlowstate + '''                                               '+#13+
              '   and nvl(fixdate,''0'') < (select nvl(retdate,''9'') from pimpmas                    '+#13+
              '                              where Z.empno = empno)                                   '+#13+ //
              '   and (empno like ''M%'' or empno = ''Q017'')                                         '+#13+
              '   and stocknum not in (''6'',''7'')                                                   '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +''' and '''+ vEndDate2 +'''         ';

  if not Process_Update(ParamSQL) then Exit;

  //재직자(임원) 세금 로직 35% 단일세율.. : 6,7차 13천만원까지 비과세
  //Intax = 행사이익금 * ( 행사가*주식수 - 3000만원 ) / (행사가*주식수)  * 0.35 / 10) * 10
  ParamSQL := 'update pstockapp Z Set ( Intax, Jutax )   =                                               '+#13+
              '      (select Floor( ( Gainamt                                                            '+#13+ //GTaxamt = 옵션행사가액 * (주식매입가액-연간3000만원) / 주식매입가격
              '                       * ( stockamt                                                       '+#13+
              '                           - ( nvl( (select sum(stockamt)                                 '+#13+ //stockamt) = 행사가*주식수(saveamt * appcnt)
              '                                       from pstockapp                                     '+#13+
              '                                      where a.empno   = empno                             '+#13+
              '                                        and flowstate = ''F''                             '+#13+ //F 처리완료내역
              '                                        and stocknum  in (''6'',''7'')                    '+#13+
              '                                      group by empno, substr(fixdate,1,4) ) ,30000000) )  '+#13+
              '                         )                                                                '+#13+
              '                       / stockamt                                                         '+#13+
              '                      ) *  decode(foreign, ''9'', 0.17, 0.35) / 10 ) * 10              a, '+#13+ //외국인 17%
              '              Floor((( Gainamt                                                            '+#13+ //GTaxamt = 옵션행사가액 * (주식매입가액-연간3000만원) / 주식매입가격
              '                       * ( stockamt                                                       '+#13+
              '                           - ( nvl((select greatest(30000000-sum(stockamt), 0)            '+#13+
              '                                      from pstockapp                                      '+#13+
              '                                     where a.empno   = empno                              '+#13+
              '                                       and flowstate = ''F''                              '+#13+ //F 처리완료내역
              '                                       and stocknum  in (''6'',''7'')                     '+#13+
              '                                     group by empno, substr(fixdate,1,4) ) ,30000000) )   '+#13+
              '                          )                                                               '+#13+
              '                       / stockamt                                                         '+#13+
              '                      ) *  decode(foreign,''9'', 0.17, 0.35) * 0.1 ) / 10 ) * 10       b  '+#13+
              '         from pstockapp a                                                                 '+#13+
              '        where a.empno     = z.empno                                                       '+#13+
              '          and a.flowstate = '''+ vFlowstate + ''')                                        '+#13+
              ' where flowstate = '''+ vFlowstate + '''                                                  '+#13+
              '   and nvl(fixdate,''0'') < (select nvl(retdate,''9'') from pimpmas where Z.empno = empno)'+#13+ //재직여부 기준
              '   and (empno like ''M%'' or empno = ''Q017'')                                            '+#13+
              '   and stocknum in (''6'',''7'')                                                          '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''  and '''+ vEndDate2 +'''           ';

  if not Process_Update(ParamSQL) then Exit;   

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //퇴직자(전체)  세금 로직 20% 단일세율.. : 기타소득세
  ParamSQL := 'update pstockapp Z Set                                                          '+#13+
              '       Intax = Floor(  Gainamt * 0.2        / 10 ) * 10,                        '+#13+
              '       Jutax = Floor( (Gainamt * 0.2 * 0.1) / 10 ) * 10                         '+#13+
              ' where flowstate = '''+ vFlowstate + '''                                        '+#13+
              '   and fixdate  >= (select retdate from pimpmas where Z.empno = empno)          '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +'''  and '''+ vEndDate2 +''' ';

  if not Process_Update(ParamSQL) then Exit;  
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //소득세 0원 작으면 0원으로
  ParamSQL := 'update pstockapp  Set Intax = Greatest(Intax,0),       '+#13+
              '                      Jutax = Greatest(Jutax,0)        '+#13+
              ' where flowstate = '''+ vFlowstate + '''               '+#13+
              '   and substr(appdate,1,8) between '''+ vEndDate1 +''' '+#13+
              '                               and '''+ vEndDate2 +''' ';

  if not Process_Update(ParamSQL) then Exit;
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Application.ProcessMessages;

  RetrieveData;

  MessageDlg('세금계산 완료',mtInformation, [mbOk], 0);
  StatusBar1.Panels[1].Text := '세금계산 완료';
end;

procedure TFM_Main.BT_MailClick(Sender: TObject);
var
   i : Integer;
begin
  if MessageDlg( p_empno.Text +' 에 대하여 입금 요청 메일을 발송 하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

{ 일괄발송 루틴 삭제 ==> 개인별 발송으로 변경.
  TMaxDataSet1.First;
  with TMaxDataSet1 do
  begin
       First;
       for i := 1 to  RecordCount do
       begin
            SendProgID  := 'PSC1090A';
            SendEmpno   := sEmpno;

            if   vPstate = '퇴직' then RcveEmpno := E_email.Text
            else                       RcveEmpno := FieldbyName('EMPNO').AsString;

            MailSubject := '[ Stock Option 원천징수세액 통보  ]';
            MailBody    := Hinsa_DisplayDate(FieldByName('APPDATE').AsString,'-') +'일 신청하신 스톡옵션행사 관련'+#13+
                           '귀하께서 당사로 당월말일(영업일 기준)까지 납부하실 원천징수세액이 결정되었습니다.'+#13+
                           '납부하실 세액은 '+#13+
                           '종합인사시스템 - 복리후생/우리사주 - STOCK OPTION - STOCK OPTION 행사신청 및 현황에서 확인하실 수 있습니다 ';
            ReceiveYN   := 'N';

            if   Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                 StatusBar1.Panels[1].Text := '사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
            else
            begin
                 ShowMessage( 'Mail 발송 실패 - 사번 : '+ RcveEmpno );
                 exit;
            end;
            
            Next;
       end;
  end;   }

  //////////////////////////////////////////////////////////////////////////////
  SendProgID := 'PSC1090A';
  SendEmpno  := sEmpno; //발신자

  if  (vPstate = '퇴직') and (Length(Trim(E_email.Text)) < 10) then
  begin
       ShowMessage('E-Mail를 확인하여 주시기 바랍니다. [미발송]');
       Exit;
  end;

  if   vPstate = '퇴직' then
  begin
       ParamSQL := 'Update Pimpmas                                    '+#13+
                   '   Set E_email = '''+  E_email.Text          +''' '+#13+
                   ' Where Empno   = '''+  Copy(p_empno.Text,1,4)+''' ';
       Process_Update(ParamSQL);

       RcveEmpno := E_email.Text;
  end
  else RcveEmpno := sEmpno;           //수신자 Copy(p_empno.Text,1,4);

  if sEmpno = 'D006' then
  begin
       SendEmpno   := 'Z113';
       RcveEmpno   := 'dsa2000@hanmail.net';
  end;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  MailSubject := '[ Stock Option 원천징수세액 통보 ]';
  MailBody    := Hinsa_DisplayDate(TMaxDataSet1.FieldByName('APPDATE').AsString,'-') +'일 신청하신 스톡옵션행사 관련'+#13+
                 '귀하께서 당사로 당월말일(영업일 기준)까지 납부하실 원천징수세액이 결정되었습니다.'+#13+
                 '납부하실 세액은 '+#13+
                 '종합인사시스템 - 복리후생/우리사주 - STOCK OPTION - STOCK OPTION 행사신청 및 현황에서 확인하실 수 있습니다 ';
  ReceiveYN   := 'N';

  if   Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       StatusBar1.Panels[1].Text := '사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
  else
  begin
       ShowMessage( 'Mail 발송 실패 - 사번 : '+ RcveEmpno );
       exit;
  end;

  MessageDlg('메일 전송 완료..',mtInformation, [mbOk], 0);
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  StatusBar1.Panels[1].Text := '메일 전송 완료.';
end;

Function TFM_Main.ImageFind(v_empno : String; v_seq : Integer; v_gubun : String) : Integer;
begin
  Result := 0;
  with TMaxDataSet0 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT count(*), ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM Pstock_image                                            '+
                   ' WHERE empno    = '''+ v_empno +'''                            '+
                   '   and seq      = '''+FloatToStr(v_seq) +'''                   '+
                   '   and gubun    = '''+ v_gubun +'''                            ';

       ClearFieldInfo;
       AddField('field1'    , ftString,  100);
       AddField('field2'    , ftString,  100);
       AddField('field3'    , ftString,  100);
       AddField('field4'    , ftString,  100);
       AddField('field5'    , ftString,  100);
       Open;

       Result := StrToInt(FieldByName('field1').AsString);
  end;
end;

procedure TFM_Main.B_imageClick(Sender: TObject);
begin
     vMessage := '';
     if      TComponent(Sender).Tag = 0 then vMessage := ' 주민등록증 '
     else if TComponent(Sender).Tag = 1 then vMessage := ' 스톡옵션행사신청서 '
     else if TComponent(Sender).Tag = 2 then vMessage := ' 스톡옵션부여계약서 '
     else if TComponent(Sender).Tag = 3 then vMessage := ' 재직증명서 '
     else if TComponent(Sender).Tag = 4 then vMessage := ' 경력증명서 '
     else if TComponent(Sender).Tag = 5 then vMessage := ' 질권설정계약서 '
     else if TComponent(Sender).Tag = 6 then vMessage := ' 급여차감지급의뢰서 ';

     iSelect := 0;

     if TMaxDataSet1.RecordCount <= 0 then
     begin
          ShowMessage('서류 저장할 신청자를 선택하세요.');
          Exit;
     end;
     ///////////////////////////////////////////////////////////////////////////

     ///////////////////////////////////////////////////////////////////////////
     if ImageFind(TMaxDataSet1.FieldByName('empno'   ).AsString,
                  TMaxDataSet1.FieldByName('seq'     ).AsInteger,
                  IntToStr(TComponent(Sender).Tag)               ) > 0 then
     begin
          if MessageDlg( vMessage + ' 서류가 이미 등록되어있습니다. '+#13+#13+
                        '재등록 또는 추가등록 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit
          else iSelect := 1;
     end;

     FmImageSave := TFmImageSave.Create(Application);
     try
          FmImageSave.Caption := '[' + vMessage + ' 저장]';
          FmImageSave.CbGubun.ItemIndex := TComponent(Sender).Tag;
          FmImageSave.ShowModal;
     finally
          FmImageSave.Free;
     end; 
end;

procedure TFM_Main.B_image_AllClick(Sender: TObject);
begin
  if TMaxDataSet1.RecordCount <= 0 then
  begin
       ShowMessage('서류 저장할 신청자를 선택하세요.');
       Exit;
  end;

  ImageLoadSave;
  {
  FmPSC10904 := TFmPSC10904.Create(Application);
  try
       FmPSC10904.Caption := '[서류 관리]';
       FmPSC10904.ShowModal;
  finally
       FmPSC10904.Free;
  end; }
end;

procedure TFM_Main.BB_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if TMaxDataSet1.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  StatusBar1.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 25], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       StatusBar1.Panels[1].Text := '';
       Exit;
  end;

  StatusBar1.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := 'Stock Option List';  //시트명 부여
  XL.Range['A1:Y2'].Merge;                       //셀 병합

  //TITLE NAME 설정  //XL.Range['A1'].value := 'Stock Option 신청내역';
  if      PageControl1.ActivePage = TabSheet1 then  XL.Range['A1'].value := 'Stock Option 행사내역(전체)'
  else if PageControl1.ActivePage = TabSheet2 then  XL.Range['A1'].value := 'Stock Option 행사내역(신청개시자)'
  else if PageControl1.ActivePage = TabSheet3 then  XL.Range['A1'].value := 'Stock Option 행사내역(서류확인자)'
  else if PageControl1.ActivePage = TabSheet4 then  XL.Range['A1'].value := 'Stock Option 행사내역(주금납입확인자)'
  else if PageControl1.ActivePage = TabSheet5 then  XL.Range['A1'].value := 'Stock Option 행사내역(신청완료자)'
  else if PageControl1.ActivePage = TabSheet6 then  XL.Range['A1'].value := 'Stock Option 행사내역(신주교부자)'
  else if PageControl1.ActivePage = TabSheet7 then  XL.Range['A1'].value := 'Stock Option 행사내역(세액납입확인자)';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '신청일';
  XArr[2]  := '사번';
  XArr[3]  := '성명';
  XArr[4]  := '신청횟수';
  XArr[5]  := '차수';
  XArr[6]  := '신청수량';
  XArr[7]  := '기준종가';
  XArr[8]  := '주금';
  XArr[9]  := '세액';
  XArr[10] := '증권입고계좌';
  XArr[11] := '진행상태';
  XArr[12] := '재/퇴직구분';
  XArr[13] := '신청자';
  XArr[14] := '서류확인자';
  XArr[15] := '서류확인일';
  XArr[16] := '주금납입확인';
  XArr[17] := '주금납입확인';
  XArr[18] := '신주교부자';
  XArr[19] := '신주교부일';
  XArr[20] := '신청완료자';
  XArr[21] := '신청완료일';
  XArr[22] := '세액납입확인자';
  XArr[23] := '세액납입확인일';
  XArr[24] := '신청취소자';
  XArr[25] := '신청취소일';
  XL.Range['A3' , 'Y3'].Value := XArr;
  k := 3;
  for i := 1 to 25 do
  begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := TMaxDataSet1.GetBookmark;
  TMaxDataSet1.DisableControls;
  TMaxDataSet1.First;

  with TMaxDataSet1 do
  begin
       for i := 1 to  RecordCount do
       begin                // showmessage(FieldByName('RETYN').AsString);
            XArr[1]  := FieldbyName('APPDATE').AsString;
            XArr[2]  := ''''+FieldbyName('EMPNO').AsString;
            XArr[3]  := FieldByName('KORNAME').AsString;
            XArr[4]  := FieldbyName('SEQ').AsInteger;
            XArr[5]  := FieldbyName('STOCKNUM').AsString;
            XArr[6]  := FieldByName('APPCNT').AsInteger;
            XArr[7]  := FieldByName('CPRICE').AsFloat;
            XArr[8]  := FieldByName('STOCKAMT').AsFloat;
            XArr[9]  := FieldByName('TAXSUM').AsFloat;
            XArr[10] := ''''+FieldByName('ACCOUNT').AsString;
            XArr[11] := FieldByName('FLOWSTATE').AsString;
            XArr[12] := FieldByName('RETYN').AsString;
            XArr[13] := ''''+FieldByName('APPEMP').AsString;
            XArr[14] := ''''+FieldByName('CONEMP').AsString;
            XArr[15] := ''''+FieldByName('CONDATE').AsString;
            XArr[16] := ''''+FieldByName('PAYEMP').AsString;
            XArr[17] := ''''+FieldByName('PAYDATE').AsString;
            XArr[18] := ''''+FieldByName('PAYEMP').AsString;
            XArr[19] := ''''+FieldByName('PAYDATE').AsString;
            XArr[20] := ''''+FieldByName('GRANTEMP').AsString;
            XArr[21] := ''''+FieldByName('GRANTDATE').AsString;
            XArr[22] := ''''+FieldByName('TAXEMP').AsString;
            XArr[23] := ''''+FieldByName('TAXDATE').AsString;
            XArr[24] := ''''+FieldByName('CANCELEMP').AsString;
            XArr[25] := ''''+FieldByName('CANCELDATE').AsString;
            XL.Range['A' + IntToStr(k+1), 'Y' + IntToStr(k+1)].Value := XArr;
            inc(k);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'Y' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'Y' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'Y' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'Y' + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A3', 'Y' + IntToStr(k)].font.Size := 9;
  XL.Range['C4', 'Y' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['J4', 'Y' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['A1', 'Y' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  TMaxDataSet1.GotoBookmark(SavePlace);
  TMaxDataSet1.FreeBookmark(SavePlace);
  TMaxDataSet1.EnableControls;
  StatusBar1.Panels[1].Text := '';
end;

procedure TFM_Main.E_Condate1Change(Sender: TObject);
begin
     RetrieveData;
end;

procedure TFM_Main.BT_CancelClick(Sender: TObject);
begin
  if MessageDlg('선택한 사원의 행사신청을 취소 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  ParamSQL := 'Update pstockapp  Set                                       '+#13+
              '       flowstate  = ''Z''                                  ,'+#13+
              '       CancelEMP  = '''+  sEmpno                       +''','+#13+
              '       CancelDATE = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')     '+#13+
              ' Where Empno      = '''+  Copy(p_empno.Text,1,4)       +''' '+#13+
              '   And Seq        = '''+  vSeq                         +''' ';

  Process_Update(ParamSQL);

  RetrieveData;
end;


procedure TFM_Main.BT_SaveClick(Sender: TObject);
var  vIntax, vJutax : String;
begin
  if MessageDlg('선택한 사원의 세금 합계를 수정 저장 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  vIntax := FloatToStr(p_taxsum.Value * 0.909090909090909 );
  vJutax := FloatToStr(p_taxsum.Value * 0.0909090909090909);

  ParamSQL := 'Update pstockapp  Set                            '+#13+
              '       Intax  = '''+  vIntax                +''','+#13+
              '       Jutax  = '''+  vJutax                +''' '+#13+
              ' Where Empno  = '''+  Copy(p_empno.Text,1,4)+''' '+#13+
              '   And Seq    = '''+  vSeq                  +''' ';

  Process_Update(ParamSQL);

  RetrieveData;
end;

procedure TFM_Main.ImageLoadSave;
var
  stream     : TMemoryStream;
  qq         : TOraQuery;
  vFileName  : String;
  vEmpno     : String;
  vKorname   : String;
  vSeq       : Integer;
  vNum       : Integer;
begin
  vEmpno   := TMaxDataSet1.FieldByName('empno').AsString;
  vKorname := TMaxDataSet1.FieldByName('korname').AsString;
  vSeq     := TMaxDataSet1.FieldByName('seq').AsInteger;
  vNum     := 0;
  
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            for vNum:= 0 to 6 do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select photo                ');
                 SQL.Add('  from Pstock_image         ');
                 SQL.Add(' where empno    = :empno    ');
                 SQL.Add('   and seq      = :seq      ');
                 SQL.Add('   and gubun    = :gubun    ');
                 SQL.Add('   and gbpage   = :gbpage  ');

                 ParamByName('empno'   ).AsString  := vEmpno;
                 ParamByName('seq'     ).AsInteger := vSeq;
                 ParamByName('gubun'   ).AsString  := IntToStr(vNum); //IntToStr(PageControl1.ActivePage.PageIndex);
                 ParamByName('gbpage'  ).AsInteger := 1;              //StrToInt(E_GBPage.Text);
                 Open;

                 vMessage := '';
                 if      vNum = 0 then vMessage := '주민등록증.pdf'
                 else if vNum = 1 then vMessage := '스톡옵션행사신청서.pdf'
                 else if vNum = 2 then vMessage := '스톡옵션부여계약서.pdf'
                 else if vNum = 3 then vMessage := '재직증명서.pdf'
                 else if vNum = 4 then vMessage := '경력증명서.pdf'
                 else if vNum = 5 then vMessage := '질권설정계약서.pdf'
                 else if vNum = 6 then vMessage := '급여차감지급의뢰서.pdf';

                 if RecordCount > 0 then
                 begin
                      try
                           stream    := TMemoryStream.Create;
                           TblobField(qq.FieldByName('photo')).SaveToStream(stream);
                           stream.Position := 0;

                           //파일 저장
                           vFileName := GetKeyValue(HKEY_LOCAL_MACHINE, SUBKEY, 'NewHomeDir') +'\';
                           vFileName := vFileName + vEmpno +'-'+ IntToStr(vSeq) +'회-'+ vMessage ; //+'-'+ E_GBPage.Text +'page.pdf';
                           TBlobField(FieldByName('photo')).SaveToFile(vFileName);
                      finally
                           stream.free;
                      end;
                 end;
            end;
       end;
  finally
       qq.Free;
  end;

  StatusBar1.Panels[1].Text := vKorname+'('+vEmpno+')'+'의 서류파일을 c:\insa 폴더에 저장하였습니다.';
end;

{   //////하나로텔레콤  종가 구하기 ///////////////////////////////////////////
     StatusBar1.Panels[1].Text := '하나로텔레콤 종가를 읽어 오고 있습니다.';
     Application.ProcessMessages ;

     vEndDate  := RemoveChar(E_Condate1.Text,'-');

     with TMaxDataSet0 do
     begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := 'SELECT stockdate, cprice, ''field3'', ''field4'',''field5'' '+
                      '  FROM pstockbas                                            '+
                      ' where stockdate = '''+ vEndDate +'''   ';

          ClearFieldInfo;
          AddField('field1' , ftString, 100);
          AddField('field2' , ftInteger,100);
          AddField('field3' , ftString, 100);
          AddField('field4' , ftString, 100);
          AddField('field5' , ftString, 100);
          Open;

          if   TMaxDataSet0.RecordCount = 0 then
          begin
               ShowMessage(E_Condate1.Text + ' 일 종가가 아직 입력되지 않았습니다. ');
               Exit;
          end
          Else
          begin
               E_Condate1.Text := Hinsa_DisplayDate(FieldByName('field1').AsString,'-');
               vEndPrice      := FieldByName('field2').AsInteger;
          end;

          TMaxDataSet0.Close;
     end;
     ///////////////////////////////////////////////////////////////////////////
 }
procedure TFM_Main.BB_HelpClick(Sender: TObject);
begin
  if   HelpMemo1.Visible then HelpMemo1.Visible := False
  else                        HelpMemo1.Visible := True;
end;

end.

