{===================== Program Header ==========================================
Update Contents
Version    date(yy.mm.dd)     programmer     relevant doc.no     description
1.0        2009.11.26         jissi
================================================================================}
unit PIU3040A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Tmax_session, Db, Tmax_DataSetText, Tmax_DmlSet,
  OnInsaCommon, OnTmaxPersonEdit, OnPopupEdit,func, comobj,
  registry, OnLineLabel, OnTmaxCodeEdit, OnEditCombo, TmaxFunc,PDownLoad,iniFiles,pass, csReg;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    TDS_Com: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    PE_empno: TTMaxPersonPopupEdit;
    SL_Work1: TOnShapeLabel;
    SL_Work2: TOnShapeLabel;
    SL_payra: TOnShapeLabel;
    SL1: TOnShapeLabel;
    SL2: TOnShapeLabel;
    CByyyy: TOnComboEdit;
    BT_Exit: TOnFocusButton;
    BT_Search: TOnFocusButton;
    SL_Dept: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    SB_Help: TStatusBar;
    BT_Search_Appoint: TOnFocusButton;
    BT_Open_Move: TOnFocusButton;
    bt_quest: TOnFocusButton;
    SL_Work3: TOnEdit;
    BT_save: TOnFocusButton;
    BT_Excel: TOnFocusButton;
    SL_Work4: TOnEdit;
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
    procedure BT_Search_AppointClick(Sender: TObject);
    procedure BT_Open_MoveClick(Sender: TObject);
    procedure bt_questClick(Sender: TObject);
    procedure PE_empnoCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
    procedure Csel_Open;
  public
    { Public declarations }
    FG_Empno, FG_korname, FG_grade, FG_Date : String;
    FG_Place, FG_Paycl, FG_AppYY, FG_Appdate : String;
    FG_quarter : String;
    FG_SubCreate : Boolean;
    sRabasdate : String;
    Workemp1, Workemp2, Workemp3, Workemp4, Workemp5 : String;
    Csel_SQL   : String;
    Csel_ret   : Boolean;
    GsWorkyyCnt : string;
    GsMgubun, GsMoveYn : string;
    procedure PL_Com_Contructor;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PIU3040A2, popup;


{$R *.DFM}

procedure TFM_Mainform.Csel_Open;
begin
     Csel_ret := False;
     with TMaxDataSet_HInsa do
     begin
     Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 5000);
          ClearParamInfo;
          SQL.Text := Csel_SQL;
          Open;
          if  RecordCount > 0 then     Csel_ret := True;
     end;
end;

function TFM_Mainform.Csel_gfd(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
     v_cnt := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;


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
  //for test by hjku...
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;    

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

  FG_empno   := Hinsa_Param(CmdLine,1);
  FG_korname := Hinsa_Param(CmdLine,2);
  FG_grade   := Hinsa_Param(CmdLine,4);

  FG_SubCreate := False;
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
var
     MaxYear : String;
     i : integer;
     CUseYN, SQLStr         :string;
begin
     LabelClear;

     if FG_empno <> '' then
     begin
          PE_empno.OnReadEnded   := nil;
          if  copy(FG_empno,1,1) = 'D' then
              PE_empno.Text      := '0884'
          else
              PE_empno.Text      := FG_empno;
          PE_empno.PL_get_singledata;
     end;

     PL_Com_Contructor;

     with TDS_com do
     begin
          //////////////////////////////////////////////////////////////////////
          Close;
          Sql.Clear;
          SQL.Text := 'select distinct  substr(RabasYY,1,4) Field1,                '+#13+
                      '       '''' Field2, '''' Field3,  '''' Field4,  '''' Field5 '+#13+
                      '  from pmovemas                                             '+#13+  //rabasyy
                      ' order by 1 desc                                            ';
          Open;
          First;
          CByyyy.Items.Clear;
          for i := 1 to RecordCount do
          begin
               CByyyy.Items.Add(FieldByName('Field1').AsString);
               Next;
          end;

          CByyyy.ItemIndex := 0;
          MaxYear := CByyyy.Text;
     end;


     if MaxYear = '' then
     begin
          CByyyy.Text := '2011';
     end
     else
          CByyyy.Text := MaxYear;

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
(*2017.07.19.hjku.. 관리자 하드코딩자료를 테이블 관리로 변경.. 김진호M 요청
          Close;
          Sql.Clear;
          SQL.Text := 'select Value1 Field1, Value2 Field2,                        '+#13+
                      '       Value3 Field3, Value4 Field4, Value5 Field5          '+#13+
                      '  from pishrvari                                            '+#13+
                      ' where gubun     = ''00''  and   sgubun = ''0001''          ';
          Open;
          workemp1 := FieldByName('Field1').AsString;
          workemp2 := FieldByName('Field2').AsString;
          workemp3 := FieldByName('Field3').AsString;
          workemp4 := FieldByName('Field4').AsString;
          workemp5 := FieldByName('Field5').AsString;
 *)
     end;
     
     PL_Com_Contructor;
     with TDS_com do
     begin
          Close;
          Sql.Clear;
          SQLStr := 'Select payutil.GET_PRGUSER_YN(''3'',''PIU3040A'','''+FG_empno+'''), ''F2'', ''F3'', ''F4'', ''F5'' From Dual';
          Sql.Add(SQLStr);
          Open;

          CUseYN   := FieldByName('field1').AsString;
     end;
(*2017.07.19.hjku.. 관리자 하드코딩자료를 테이블 관리로 변경.. 김진호M 요청
     //평가담당자는 전사원 조회
     if   (FG_empno = workemp1) or (FG_empno = workemp2) or (FG_empno = workemp3) or
          (FG_empno = workemp4) or (FG_empno = workemp5) or (copy(FG_empno,1,1) = 'D') then
*)
     if (Copy(FG_empno,1,1) = 'D') or (CUseYN = 'Y') then   
     begin
          PE_Empno.Enabled := True;
          SL_Work3.visible := true;
          //2015.12.10.hjku.. 이동년차구분 변경 추가.. 김현순M 요청..
          SL_Work4.visible := true;
          BT_save.visible  := true;
          BT_Excel.visible := true;
     end
     else
     begin
          PE_Empno.Enabled := False;
          SL_Work3.visible := False;
          //2015.12.10.hjku.. 이동년차구분 변경 추가.. 김현순M 요청..
          SL_Work4.visible := False;
          BT_save.visible  := False;
          BT_Excel.visible := False;
     end;


     SB_Help.Panels[1].Text :='근무기간을 조회합니다.';
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
     i            : Integer;
     ParamVariant : String;
begin

     LabelClear;

     ParamVariant := Format('select rabasyy||'';''||                         '+#13+
                             '      EMPNO  ||'';''||                         '+#13+
                             '      KORNAME||'';''||                         '+#13+
                             '      PAYRA  ||'';''||                         '+#13+
                             '      (select CODENAME                         '+#13+
                             '         from PYCCODE                          '+#13+
                             '        where CODEID   = ''I113''              '+#13+
                             '          and CODENO   = a.PAYRA   )||'';''||  '+#13+
                             '      DEPTCODE||'';''||                        '+#13+
                             '      (select DEPTNAME                         '+#13+
                             '         from PYCDEPT                          '+#13+
                             '        where ORGNUM   = a.ORGNUM              '+#13+
                             '          and DEPTCODE = a.DEPTCODE)||'';''||  '+#13+
                             '      Workmmcnt||'';''||                       '+#13+
                             '      Workyycnt||'';''||                       '+#13+
                             //2014.10.13.hjku.  연도 숫자만 가져오도록 추가..
                             '      NVL(TRANSLATE(Workyycnt,''0123456789''||Workyycnt,''0123456789''),0) ||'';''||'+#13+
                             '      decode(mgubun,''C'',decode(moveyn,''Y'',''C'',''N'',''G'',''Z''),mgubun) ||'';''|| MOVEYN   SEL_DATA                    '+#13+
                             '  from pmovemas a                              '+#13+
                             ' where a.RABASYY = ''%s''                      '+#13+
                             '   and a.EMPNO   = ''%s''                      ',[CByyyy.Text, Copy(PE_empno.Text,1,4)]);

     Csel_SQL      := ParamVariant;
     Csel_Open;

     if not Csel_ret then
     begin
          MessageDlg((Pe_empno.Text) +'님은 '+
                     CByyyy.Text+ '년도 근무기간 조회 대상자가 아닙니다.'+#13+#13+
                     '프로그램을 종료합니다.', MtWarning, [mbok], 0);
          FM_Mainform.Close;
     end;

     SL_payra.ValueCaption := Csel_gfd(5)+' ('+ Csel_gfd(4)   +') ';
     SL_Dept.ValueCaption  := Csel_gfd(7)+' ('+ Csel_gfd(6)   +') ';

{
         Label2.Caption := '- 업적평가 등급    :   ' + inttoStr(strtoint(CByyyy.Text)+1)
                         + '년도 업적연봉에 반영';
         Label3.Caption := '- 최종평가 등급    :   ' + inttoStr(strtoint(CByyyy.Text)+1)
                         + '년도 기본연봉에 반영 및 BAND조정포인트(점수) 반영';
}

     SL_Work1.ValueCaption := Csel_gfd(8)+'개월';

     if(Csel_gfd(9)<>'')and(Csel_gfd(10)='0') then
          SL_Work2.ValueCaption := Csel_gfd(9)
     else SL_Work2.ValueCaption := Csel_gfd(10)+'년';

     //2015.11.10.hjku.. 이동년수 수정 저장 추가 요청.. 김현순M(SR-1511-0381)
     SL_Work3.text := Csel_gfd(9);

     GsMGubun := Csel_gfd(11);

     //2015.12.10.hjku.. 이동년차구분 변경 추가.. 김현순M 요청..
     GsWorkYYCnt := Csel_gfd(9);
     SL_Work4.text := GsMGubun;

     GsMoveYN := Csel_gfd(12);

     {2015.09.03.hjku.. 2015년 변경.. 이명노M..
     //2014.10.13.hjku. 메시지 추가... 이명노M 요청
          if  GsMGubun='A' then
     begin
          BT_Open_Move.enabled := true;
          MessageDlg((Pe_empno.korname) +'님은 이동연차 6년 이상 필수 이동 대상자입니다.'+#13+#13+
                     '이동연차 확인 후, 이동 희망부서 등록바랍니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='B' then
     begin
          BT_Open_Move.enabled := false;
          MessageDlg((Pe_empno.korname) +'님은 금년도 이동 유예 대상으로 선정되어'+#13+#13+
                     '이동 희망부서 등록이 불가합니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='C' then
     begin
          BT_Open_Move.enabled := true;
          MessageDlg((Pe_empno.korname) +'님은 이동연차 5년 이상으로 이동(희망) 대상자입니다.'+#13+#13+
                     '이동 희망부서 등록바랍니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='D' then
     begin
          BT_Open_Move.enabled := true;
          MessageDlg((Pe_empno.korname) +'님은 이동연차 3~4년으로 이동 신청이 가능합니다. 이동 희망 시, 희망부서 등록 바랍니다.'+#13+#13+
                     '소속 팀장 승인 여부에 따라 이동 대상으로 등재됩니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='E' then
     begin
          BT_Open_Move.enabled := false;
          MessageDlg((Pe_empno.korname) +'님은 대외 파견중인 구성원으로 이동 대상이 아닙니다.'+#13+#13+
                     '복귀 시점에 별도 검토 예정입니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='F' then
     begin
          BT_Open_Move.enabled := true;
          MessageDlg((Pe_empno.korname) +'님은 비연고지 2년 이상 근무로 이동 신청이 가능합니다.'+#13+#13+
                     '이동 희망 시, 희망부서 등록바랍니다.', mtInformation, [mbok], 0);
     end
     else if  GsMGubun='G' then
     begin
          BT_Open_Move.enabled := false;
          MessageDlg((Pe_empno.korname) +'님은 이동연차 5년 이상이나 이동을 희망하지 않아'+#13+#13+
                     '이동 희망부서 등록이 불가합니다.', mtInformation, [mbok], 0);
     end
     else
     begin
          BT_Open_Move.enabled := false;
     end;
     }
end;

procedure TFM_Mainform.LabelClear;
  var
     FL_i : integer;
     FL_Comp: TOnShapeLabel;
begin

     for FL_i := 1 to 2 do
     begin
          FL_Comp := nil;
          FL_Comp := TOnShapeLabel(Self.FindComponent('SL_Work'+IntToStr(FL_i)));
          if FL_Comp <> nil then  FL_Comp.ValueCaption := '';
     end;

end;

procedure TFM_Mainform.CByyyyChange(Sender: TObject);
begin
     if Length(CByyyy.Text) = 4
     then  Retrive;
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

procedure TFM_Mainform.BT_Search_AppointClick(Sender: TObject);
begin
  Application.CreateForm(TFM_Pihanno, FM_Pihanno);
  FM_Pihanno.ShowModal;
end;

procedure TFM_Mainform.BT_Open_MoveClick(Sender: TObject);
var
  i       : integer;
  iniFile : TIniFile;
  exefile : array[0..256] of char;
  ObjName : String;
begin
        ObjName     := UpperCase('PIU3020A.EXE');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(3, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\3tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\3Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;     
end;

procedure TFM_Mainform.bt_questClick(Sender: TObject);
begin
    Fm_quest := TFm_quest.Create(Self);
    Fm_quest.ShowModal;
end;

procedure TFM_Mainform.PE_empnoCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
          BT_SearchClick(Sender);
end;

procedure TFM_Mainform.BT_saveClick(Sender: TObject);
var
    i,j   : Integer;
begin
    {2015.12.10.hjku.. 이동구분 추가로 변경.. 김현순M 요청..
    if(trim(SL_Work3.Text)=trim(SL_Work2.valuecaption)) then
    begin
        MessageDlg('수정된 내역이 없습니다.', mtError, [mbOk], 0);
        SL_Work3.SetFocus;
        exit;
    end;
    }

    if(trim(SL_Work3.Text)=trim(GsWorkYYCnt)) and
      (trim(SL_Work4.Text)=trim(GsMGubun))
    then
    begin
        MessageDlg('수정된 내역이 없습니다.', mtError, [mbOk], 0);
        SL_Work3.SetFocus;
        exit;
    end;

    if MessageDlg('수정한 이동년수 및 이동구분을 저장 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;


    with TDS_Com do
    begin
        ServiceName := 'PIT1030A_DML';
        Close;
        Sql.Clear;
        Sql.Add('UPDATE pmovemas                                           ');
        Sql.Add('   SET WORKYYCNT = ''' + SL_Work3.Text + ''',             ');
        Sql.Add('       MGUBUN    = ''' + SL_Work4.Text + ''',             ');
        Sql.Add('       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), ');
        Sql.Add('       WRITEMAN  = ''' + FG_empno + '''                   ');
        Sql.Add(' WHERE Rabasyy   = ''' + CByyyy.Text +'''                 ');
        Sql.Add('   AND EMPNO     = ''' + Copy(PE_empno.Text,1,4) + '''    ');

        if not TDS_Com.Execute then
        begin
            MessageDlg('등록작업에 실패했습니다.',mtError, [mbOk],0);
            System.Exit;
        end;
    end;

    MessageDlg('등록되었습니다.', mtInformation, [mbOk],0);

    Retrive;
end;

procedure TFM_Mainform.BT_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
    PL_Com_Contructor;

    with TDS_com do
    begin
        //////////////////////////////////////////////////////////////////////
        Close;
        ServiceName := 'HINSA_select';
        ClearFieldInfo;
        AddField('RabasYY'   , ftString, 100);
        AddField('EMPNO'     , ftString, 100);
        AddField('KORNAME'   , ftString, 100);
        AddField('WORKYYCNT' , ftString, 100);
        AddField('MGUBUN'    , ftString, 100);
        Sql.Clear;

        Sql.Add('select substr(RabasYY,1,4) RabasYY,                         ');
        Sql.Add('       EMPNO, KORNAME,  WORKYYCNT ,  MGUBUN                 ');
        Sql.Add('  from pmovemas                                             ');
        Sql.Add(' WHERE Rabasyy   =  ''' + CByyyy.Text +'''                  ');
        //Sql.Add('   AND EMPNO     =  ''' + Copy(PE_empno.Text,1,4) + '''     ');
        Sql.Add(' order by 1,2 desc                                          ');

        Open;
    end;

{ //전체자료 추출할때..}
  if TDS_com.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  SB_help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 5], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_help.Panels[1].Text := '';
       Exit;
  end;

  SB_help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '이동년차 명단';  //시트명 부여
  XL.Range['A1:E2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '이동년차등록내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '기준년도'      ;
  XArr[ 2]  := '사원번호'      ;
  XArr[ 3]  := '사원성명'      ;
  XArr[ 4]  := '이동년차'      ;
  XArr[ 5]  := '이동구분'      ;


  XL.Range['A3' , 'E3'].Value := XArr;
  k := 3;
  for i := 1 to 5 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := TDS_com.GetBookmark;
  TDS_com.DisableControls;
  TDS_com.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  TDS_com.RecordCount do
  begin
     XArr[ 1]  := ''''+TDS_com.FieldbyName('RabasYY').AsString;
     XArr[ 2]  := ''''+TDS_com.FieldbyName('EMPNO').AsString;
     XArr[ 3]  := TDS_com.FieldByName('KORNAME').AsString;
     XArr[ 4]  := TDS_com.FieldbyName('WORKYYCNT').AsString;
     XArr[ 5]  := TDS_com.FieldbyName('MGUBUN').AsString;

     XL.Range['A' + IntToStr(k+1), 'E' + IntToStr(k+1)].Value := XArr;
     inc(k);
     TDS_com.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'E' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'E' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'E' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'E' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'E' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'E' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'E' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   TDS_com.GotoBookmark(SavePlace);
   TDS_com.FreeBookmark(SavePlace);
   TDS_com.EnableControls;
   SB_help.Panels[1].Text := '';

end;

end.
