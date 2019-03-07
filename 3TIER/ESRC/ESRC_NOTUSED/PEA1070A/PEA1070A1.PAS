{===================== Program Header ==========================================
Update Contents
Version    date(yy.mm.dd)     programmer     relevant doc.no     description
1.0        2008.02.14         jissi
================================================================================}
unit PEA1070A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit,
  registry, OnLineLabel, OnTmaxCodeEdit, OnEditCombo, TmaxFunc;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    TDS_Com: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    PE_empno: TTMaxPersonPopupEdit;
    SL_Result1: TOnShapeLabel;
    SL_Result2: TOnShapeLabel;
    SL_payra: TOnShapeLabel;
    SL1: TOnShapeLabel;
    SL2: TOnShapeLabel;
    CByyyy: TOnComboEdit;
    Label2: TLabel;
    Label3: TLabel;
    BT_Run: TOnFocusButton;
    BT_Search: TOnFocusButton;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PE_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Retrive;
    procedure LabelClear;
    procedure CByyyyChange(Sender: TObject);
    procedure CByyyyKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_Empno, FG_korname, FG_grade, FG_Date : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_quarter : String;
    FG_SubCreate : Boolean;
    sRabasdate : String;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    procedure PL_Com_Contructor;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation


{$R *.DFM}

procedure TFM_Mainform.PL_Com_Contructor;
begin
     with TDS_com do
     begin
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('field1'  , ftString, 100);
          AddField('field2'  , ftString, 100);
          AddField('field3'  , ftString, 100);
          AddField('field4'  , ftString, 100);
          AddField('field5'  , ftString, 100);
          Sql.Clear;
     end;
end;

/////////////////////////////////////////////////////////////////////////////////

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Mainform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TDS_Com.Close;
     TMaxSession.Connect := False;
     Action := CaFree;
end;

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;
  ///////////////////////////////////////////////////////////////////////

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  FG_empno   := Hinsa_Param(CmdLine,1);
  FG_korname := Hinsa_Param(CmdLine,2);
  FG_grade   := Hinsa_Param(CmdLine,4);

  FG_SubCreate := False;
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
var
     MaxYear : String;
     i : integer;
begin
  PL_Com_Contructor;

  with TDS_com do
  begin
    //////////////////////////////////////////////////////////////////////
    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1,                                       '+#13+
                '       '''' Field2, '''' Field3,  '''' Field4,  '''' Field5 '+#13+
                '  from pehrebas                                             '+#13+
                ' where rabasdate = ''00000000''                             '+#13+
                '   and gubun = ''00'' and sgubun = ''0001''                 ';
    Open;
    sRabasdate := FieldByName('Field1').AsString;
    //////////////////////////////////////////////////////////////////////
    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, Value2 Field2,                            '+#13+
                '       Value2 Field3, Value2 Field4, NVL('''', ''ZZZZ'') Field5 '+#13+
                '  from pehrebas                                                 '+#13+
                ' where rabasdate = '''+sRabasdate+'''                           '+#13+
                '   and gubun     = ''11''  and   sgubun = ''0005'' ';
    Open;
    workemp1 := FieldByName('Field1').AsString;
    workemp2 := FieldByName('Field2').AsString;
    workemp3 := FieldByName('Field3').AsString;
    workemp4 := FieldByName('Field4').AsString;
    workemp5 := FieldByName('Field5').AsString;
  end;

  //평가담당자는 전사원 조회
  if  (FG_empno = workemp1) or (FG_empno = workemp2) or (FG_empno = workemp3) or
      (FG_empno = workemp4) or (FG_empno = workemp5) or (copy(FG_empno,1,1) = 'D') then
  begin
       PE_Empno.Enabled := True;
  end
  else
  begin
       PE_Empno.Enabled := False;
  end;

  LabelClear;

  PL_Com_Contructor;

  with TDS_com do
  begin
    //////////////////////////////////////////////////////////////////////
    Close;
    Sql.Clear;
    SQL.Text := 'select distinct  RabasYear Field1,                                              '+#13+
                '       '''' Field2, '''' Field3,  '''' Field4,  '''' Field5                     '+#13+
                '  from pehevhis                                                                 '+#13+  //peresult
                ' where rabasyear >= ''2007''                                                    '+#13+  //rabasyy
                '   and rabasyear <= (select Least(Substr(value1,1,4),To_Char(sysdate,''yyyy'')) '+#13+ //연말 승격계산시 프로그램을 통해 오픈되지 않도록.
                '                       from pimupbas where rabasdate =''00000000'')             ';
    Open;
    First;
    CByyyy.Items.Clear;
    for i := 1 to RecordCount do
    begin
      CByyyy.Items.Add(FieldByName('Field1').AsString);
      Next;
    end;

    Close;
    Sql.Clear;
    SQL.Text := 'select max(rabasyear) Field1,                                 '+#13+
                '       '''' Field2, '''' Field3,  '''' Field4,  '''' Field5 '+#13+
                '  from pehevhis                                             ';
    Open;
    MaxYear := FieldByName('Field1').AsString;
  end;

  if FG_empno <> '' then
  begin
    PE_empno.OnReadEnded   := nil;
    if  copy(FG_empno,1,1) = 'D' then
      PE_empno.Text      := '2096'
    else
      PE_empno.Text      := FG_empno;
    PE_empno.PL_get_singledata;
  end;

  if MaxYear = '' then
  begin
    CByyyy.Text := '2008';
  end
  else
    CByyyy.Text := MaxYear;


  SB_Help.Panels[1].Text :=' ';
end;

procedure TFM_Mainform.PE_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if   Key = Chr(13) then
     begin
          PE_empno.PL_get_singledata;
          Key := #0;

          BT_SearchClick(Sender);
     end;
end;

procedure TFM_Mainform.Retrive;
var
     i : Integer;
begin

     LabelClear;

     with TDS_Com do
     begin
          Close;
          ServiceName := 'PEA1070A_sel1';      //Server : htmax_pe11
          ClearFieldInfo;
          AddField('RABASYY' , ftString, 4);
          AddField('EMPNO'   , ftString, 4);
          AddField('KORNAME' , ftString, 12);
          AddField('PAYRA'   , ftString, 3);
          AddField('CODENAME', ftString, 20);
          AddField('RESULT1' , ftString, 2);
          AddField('RESULT2' , ftString, 2);


          SQL.Text := Format('select rabasyear RABASYY,                    '+#13+
                             '       b.EMPNO,                              '+#13+
                             '       b.KORNAME,                            '+#13+
                             '       b.PAYRA,                              '+#13+
                             '       (select CODENAME                      '+#13+
                             '          from PYCCODE                       '+#13+
                             '         where CODEID  = ''I113''            '+#13+
                             '           and CODENO  = b.PAYRA) CODENAME,  '+#13+
                             '       VISCRGRADE RESULT1,                   '+#13+
                             '       VIFINGRADE RESULT2                    '+#13+
                             '  from pehevhis a, PIMPMAS b                 '+#13+
                             ' where a.RABASYear = ''%s''                  '+#13+
                             '   and a.EMPNO   = b.EMPNO                   '+#13+
                             '   and a.EMPNO   = ''%s''                    '+#13+
                             '   and a.RABASYear >= ''2007''               '+#13+
                             ' order by 1              ',[CByyyy.Text, Copy(PE_empno.Text,1,4)]);

          Open;

          SL_payra.ValueCaption := FieldByName('CODENAME').AsString+' ('+
                                   FieldByName('PAYRA').AsString   +') ';

          Label2.Caption := '- 업적평가 등급    :   ' + inttoStr(strtoint(CByyyy.Text)+1)
                          + '년도 업적연봉에 반영';
          Label3.Caption := '- 최종평가 등급    :   ' + inttoStr(strtoint(CByyyy.Text)+1)
                          + '년도 기본연봉에 반영 및 BAND조정포인트(점수) 반영';

          TDS_Com.First;
          for i := 1 to RecordCount do
          begin

               SL_Result1.ValueCaption := FieldByName('RESULT1').AsString;
               SL_Result2.ValueCaption := FieldByName('RESULT2').AsString;

               Next;
          end;  //for i := 1 to RecordCount do
     end;

     if (TDS_Com.RecordCount = 0) then
     begin
          MessageDlg((Pe_empno.Text) +'님은 '+
                     CByyyy.Text+ '년도 평가 내역이 존재하지 않습니다.'+#13+#13+
                     '프로그램을 종료합니다.', MtWarning, [mbok], 0);
          TDS_Com.Close;
          FM_Mainform.Close;
     end;

     TDS_Com.Close;

{
     //관리자가 공개 시점에 데이터 변경하여 공개함.  (관리자는 예외)
     //데이터 업로드 하는 시점에 일반사원들은 상세내역에 대해 공개하는것을 막기 위하여 만듬. 2007.10. dsa2000.
     PL_Com_Contructor;
     with TDS_com do
     begin
          SQL.Text := 'select value1, '''', '''', '''', '''' '+#13+
                      '  from pimvari                        '+#13+
                      ' where gubun  = '+ '''PK''            '+#13+
                      '   and sgubun = '+ '''0002''';
          Open;
     end;
}
     ///////////////////////////////////////////////////////////////////////////
end;

procedure TFM_Mainform.LabelClear;
  var
     FL_i : integer;
     FL_Comp: TOnShapeLabel;
begin

     for FL_i := 0 to 4 do
     begin
          FL_Comp := nil;
          FL_Comp := TOnShapeLabel(Self.FindComponent('SL_Result1'+IntToStr(FL_i)));
          if FL_Comp <> nil then  FL_Comp.ValueCaption := '';

          FL_Comp := TOnShapeLabel(Self.FindComponent('SL_Result2'+IntToStr(FL_i)));
          if FL_Comp <> nil then  FL_Comp.ValueCaption := '';
     end;

end;

procedure TFM_Mainform.CByyyyChange(Sender: TObject);
begin
     if Length(CByyyy.Text) = 4 then  Retrive;
end;

procedure TFM_Mainform.CByyyyKeyPress(Sender: TObject; var Key: Char);
begin

     if (Key = #13) and (Length(CByyyy.Text) <> 4) then
     begin
          MessageBox(handle,'연도를 정확히(4자리) 입력하세요!', '입력오류', MB_ICONWARNING);
          Exit;
     end;

end;

procedure TFM_Mainform.BT_SearchClick(Sender: TObject);
begin
     LabelClear;
     Retrive;
end;

end.
