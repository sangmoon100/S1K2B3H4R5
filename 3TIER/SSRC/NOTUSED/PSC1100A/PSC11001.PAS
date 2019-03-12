unit psc11001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session,
  OnPopupEdit, TmaxFunc, Func, OnEditMdate;

type
  TFM_Main = class(TForm)
    Panel_Body: TPanel;
    SF_Main: TOnSchemeForm;
    StatusBar1: TStatusBar;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    DataSource1: TDataSource;
    P_cprice: TOnNumberEdit;
    BT_Save: TOnFocusButton;
    P_Condate: TOnDateEdit;
    BB_Close: TOnFocusButton;
    DbGrid1: TOnGrDbGrid;
    TMaxGrid: TTMaxDataSet;
    L_Info: TLabel;
    BT_Search: TOnFocusButton;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure P_CondateChange(Sender: TObject);
    procedure P_cpriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_SearchClick(Sender: TObject);

  private
    { Private declarations }
    SqlStr     : String;
    sEmpno     : String;
    sKorname   : String;
    sGrade     : String;
    vSysDate   : String;
    ParamSQL   : String;

    procedure RetrieveData;

  public
    { Public declarations }

  end;

var
  FM_Main: TFM_Main;

implementation


{$R *.DFM}

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
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  sEmpno    := HInsa_Param(cmdline,1);
  sGrade    := HInsa_Param(cmdline,3);

  StatusBar1.Panels[1].Text := '저장된 자료를 읽고 있습니다. 잠시만 기다려 주십시요..';

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vSysDate          := FM_Tmax.GetData('sysdate','','');
  P_Condate.Text    := Hinsa_DisplayDate(vSysDate,'-');

  with TMaxDataSet do
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
       Open;

       if ((sEmpno = '0891') or (sEmpno = '0386')) then  //스톡옵션 관리자 사번 (조회만 가능토록) 김경호, 하병수
       begin
            BT_Save.Enabled := False;
            ShowMessage('등록 및 수정은 종가관리자(P419 - 최나리)만 가능합니다.');
       end
       else if (sEmpno <> 'J059') and (Copy(sEmpno,1,1) <> 'D') then //종가관리 담당자 : 종합인사 관리자...
       begin
            ShowMessage('귀하는 작업 권한이 부족합니다.  프로그램을 종료합니다.');
            FM_Main.Close;
       end;
       TMaxDataSet.Close;
  end;

  RetrieveData;

  DbGrid1.SetFocus;
  StatusBar1.Panels[1].Text := '';
end;

procedure TFM_Main.RetrieveData;
var vDate : String;
begin
  Application.ProcessMessages;
  vDate := RemoveChar(P_Condate.Text,'-');

  with TMaxGrid do            
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT Substr(STOCKDATE,1,4)||''-''||Substr(STOCKDATE,5,2)||''-''||Substr(STOCKDATE,7,2),            '+
                   '       CPRICE,                                                                                       '+
                   '       Substr(WRITETIME,1,4)||''-''||Substr(WRITETIME,5,2)||''-''||Substr(WRITETIME,7,2)||'' ''||    '+
                   '       Substr(WRITETIME,9,2)||'':''||Substr(WRITETIME,11,2)                                        , '+
                   '      (Select Korname||Empno from Pimpmas Where Empno = WRITEMAN)                                  , '+
                   '       ''field5''                                                                                    '+
                   '  FROM pstockbas                                                                                     '+
                   ' where Stockdate between To_Char(Add_Months(To_date('''+ vDate +''',''yyyymmdd''),-3),''yyyymmdd'')  '+
                   '                 and     '''+ vDate +'''                                                             '+
                   ' Order by Stockdate Desc                                                                             ';

       ClearFieldInfo;
       AddField('STOCKDATE', ftString, 100);
       AddField('CPRICE'   , ftFloat , 100);
       AddField('WRITETIME', ftString, 100);
       AddField('WRITEMAN' , ftString, 100);
       AddField('field5'   , ftString, 100);
       Open;

       TFloatField(FieldByName('CPRICE')).DisplayFormat := '#,##0';
  end;
  StatusBar1.Panels[1].Text := '조회 완료 [기준일 기준 3개월 내역만 나타납니다.]';
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
var
    vCnt : Integer;
begin
  if MessageDlg(P_Condate.Text + '일 종가를 '+ FloatToStr(p_cprice.Value) +'원으로 저장합니다.',
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  //ShowMessage(RemoveChar(P_Condate.Text,'-'));
  with TMaxDataSet do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT count(*), ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM pstockbas                                               '+
                   ' WHERE Stockdate = '''+ RemoveChar(P_Condate.Text,'-') +'''    ';

       ClearFieldInfo;
       AddField('field1'    , ftString,  100);
       AddField('field2'    , ftString,  100);
       AddField('field3'    , ftString,  100);
       AddField('field4'    , ftString,  100);
       AddField('field5'    , ftString,  100);
       Open;
       vCnt := Fields[0].AsInteger;
  end;

  if   vCnt = 0 then
  begin
       ParamSQL := 'Insert into pstockbas                        '+
                   '  values                                     '+
                   '( '''+  RemoveChar(P_Condate.Text,'-')+''',  '+
                   '  '''+  FloatToStr(p_cprice.Value)    +''',  '+
                   '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')     ,  '+
                   '  '''+  sEmpno                        +'''  )';
  end
  else
  begin
       if Copy(RemoveChar(P_Condate.Text,'-'),1,6) <> Copy(vSysDate,1,6) then
       begin
            ShowMessage('당월에만 종가 수정이 가능합니다. 변경후 작업하시기 바랍니다.');
            Exit;
       end;

       ParamSQL := 'Update pstockbas                                            '+#13+
                   '   Set cprice    = '''+ FloatToStr(p_cprice.Value)    +''', '+#13+
                   '       writetime = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),     '+#13+
                   '       writeman  = '''+  sEmpno                       +'''  '+#13+
                   ' Where Stockdate = '''+ RemoveChar(P_Condate.Text,'-')+'''  ';
  end;
  TMaxDataSet.Close;

  with TMaxDataSet do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);        //edit1.text := SQl.text;

       if not TMaxDataSet.Execute then
       begin
            ShowMessage('종가 저장중 에러가 발생했습니다.');
            System.Exit;
       end;
  end;
  Application.ProcessMessages;

  RetrieveData;

  StatusBar1.Panels[1].Text := '종가 저장 완료';
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  P_Condate.Text := TMaxGrid.Fields[0].AsString;
  if TMaxGrid.Fields[1].AsString <> '' then
     P_cprice.Value := StrToInt(TMaxGrid.Fields[1].AsString);
end;

procedure TFM_Main.P_CondateChange(Sender: TObject);
begin
  if Length(Trim(P_Condate.Text)) = 10 then P_cprice.SetFocus;
end;

procedure TFM_Main.P_cpriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then BT_Save.SetFocus;
end;

procedure TFM_Main.BT_SearchClick(Sender: TObject);
begin
  RetrieveData;
end;

end.
