{-------------------------------------------------------------------------------
  PROGRAM-NAME   : PEF3020A(평가 점수등록)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 일반직평가
  Programmer     : 윤형식
  Version        : 30.00
  Date           : 2001.05.25
  Update Contents
    Version  date(yyyy.mm.dd) programmer  description       relevant doc.no
    30.00    2000.05.31       윤형식      전2000.05.12      설계명세서
    31.01    2001.05.25       윤형식      전화2001.         평가표번호 3 추가 -- 총무팀장의 하향평가(비서등)
    31.02    2004.11.17       정규용      신영섭요청        버튼 캡션을 기존(S,A,B,C,D,E) --> (탁월,우수,보통....)으로 변경
                                                             Csel_Open 서비스를 교체(속도) SHR0SSEL -->
-------------------------------------------------------------------------------}

unit PEF3020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, DB, peoutlookbtn, Buttons, Grids,
  Tmax_DataSetText, OnInsaCommon, TmaxFunc, OnScheme;

type
  TMainForm = class(TForm)
    Label13: TLabel;
    L_eempno: TLabel;
    Label14: TLabel;
    CB_empno: TComboBox;
    CDS_Gen: TTMaxDataSet;
    LB_clasname: TListBox;
    LB_empno: TListBox;
    Edit1: TEdit;
    Button1: TButton;
    Bevel1: TBevel;
    L_TotalComp: TLabel;
    Lable1: TLabel;
    L_evconyn: TLabel;
    Label5: TLabel;
    L_score: TLabel;
    Label23: TLabel;
    Label7: TLabel;
    L_classnms: TLabel;
    L_classnmb: TLabel;
    L_classnmd: TLabel;
    L_classnma: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    L_munjang3: TLabel;
    L_dot: TLabel;
    L_munjang5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    L_munjang8: TLabel;
    Bt_Exit: TPeJeonOutLookBtn;
    BB_confirm: TPeJeonOutLookBtn;
    BB_Save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    SG_element: TStringGrid;
    Panel7: TPanel;
    SG_class: TStringGrid;
    P_ControlButton: TPanel;
    SB_classs: TSpeedButton;
    SB_classa: TSpeedButton;
    SB_classb: TSpeedButton;
    SB_classc: TSpeedButton;
    SB_classd: TSpeedButton;
    SB_classe: TSpeedButton;
    SG_HiddenData: TStringGrid;
    CB_ShowClass: TCheckBox;
    M_Mark1: TMemo;
    SF_Main: TOnSchemeForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure CB_empnoChange(Sender: TObject);
    procedure LB_clasnameClick(Sender: TObject);
    procedure SG_elementDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_elementExit(Sender: TObject);
    procedure SG_elementKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_classDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_classEnter(Sender: TObject);
    procedure SB_classsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Pempno, Pkorname, Password, Ppermission, var_evconyn: string;

    var_empno : String;
    giindex   : Integer;
    gbInsert  : Boolean;

    var_rabasdate : String;
    var_gsEvcno   : String;  // 하향2(0), 하향(1), 동료(2), 햐향특이(3) 구분

    // ****** 2005.05.10 추가 ****** //
    GSeempno  : String;  // 평가자사번
    Pgubun   : String;  // 평가자구분 ['0'-담당이 있는 부서 팀장, '1'-하향, '2'-동료, '3'-하향특이]
    Pdeptcode : String;   // 부서코드
    E1Empno, E2Empno : String;   // 1차, 2차 평가자
    var_gubun : String;

    procedure EmpnoAdd;
    procedure Retrieve_Data;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    procedure showup_clasname(clasno: String);
    procedure Display_Sumup;

    // 2005.05.18
    procedure Check_E2empno;

    function  IsDataModified: Boolean;
    function  SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    function  Get_KoreanCharPos(letter: string; WishCnt: Integer): Integer;
    function  ChangeStrToGrade(Str: string): string;
    function  ChangeGradeToStr(Grade: string): string;

  public
    { Public declarations }
    Gsempno  : String;
    Workemp1 : String;
    Workemp2 : string;
  end;

const
  // SG_HiddenData 의 index
  dCLASNO_IDX      = 0; // 평가항목구분
  dITEMNO_IDX      = 1; // 평가항목번호
  dITEMNAME_IDX    = 2; // 평가항목명
  dITEMDESC_IDX    = 3; // 평가항목내용
  dCLASS_IDX       = 4; // 평가등급
  dSCORE_IDX       = 5; // 평가점수
  dSSCORE_IDX      = 6; // 자기평가점수
  dMODIFIED_IDX    = 7; // 자료변동 여부
  dWEIGHT_IDX      = 8; // 항목가중치

  // SG_element의 index
  eITEMNAME_IDX    = 0; // 평가항목명
  eITEMDESC_IDX    = 1; // 평가항목내용
  eSSCORE_IDX      = 2; // 자기평가점수

 // SG_score의 index
  sCLASSs_IDX  = 0; // 등급s
  sCLASSa_IDX  = 1; // 등급a
  sCLASSb_IDX  = 2; // 등급b
  sCLASSc_IDX  = 3; // 등급c
  sCLASSd_IDX  = 4; // 등급d
  sCLASSe_IDX  = 5; // 등급e


var
  MainForm: TMainForm;
  Running: Boolean;

implementation

uses Hinsa_TmaxDM;// , pef3020a2;

{$R *.DFM}


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  if Key = VK_ESCAPE then
  begin
    if var_gsEvcno <> '' then
    begin
      Fm_Sub1.CB_ShowClass.Checked := not Fm_Sub1.CB_ShowClass.Checked;
      Fm_Sub1.SG_element.SetFocus;
    end
  end;
}
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   Running := False;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  ParamVariant: String;
  msg : String;
begin
  if Running then System.Exit;
  Running := True;

  Pempno   := Hinsa_Param(CmdLine, 1);
  Pkorname := Hinsa_Param(CmdLine, 2);
  Password := Hinsa_Param(CmdLine, 3);
  Ppermission := copy(Hinsa_Param(CmdLine,4),1,1);
  GSempno  := Pempno;

  Application.ProcessMessages;

  msg := DataModule_Tmax.Connect_Session;
  if msg <> '' then
  begin
    Application.MessageBox(PChar(msg),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  // 평가기준일 가져오기
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT NVL(MAX(RABASDATE) ,'' '') MAXDATE FROM PEHUNMAS';
  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  var_rabasdate    := DataModule_Tmax.Csel_gfd(1);
  // 평가담당자 가져오기
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT  Value1||'';''||Value3 FROM PEHUNBAS  '+
                  ' where  rabasdate = '''+var_rabasdate+'''    '+
                  '   and  gubun = ''01'' and sgubun = ''0003'' ';
  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  workemp1:= DataModule_Tmax.Csel_gfd(1);
  workemp2:= DataModule_Tmax.Csel_gfd(2);

  if (Pempno = workemp1) or (Pempno = workemp2) then
  begin
       Edit1.Text      := Pempno;
       Edit1.Visible   := True;
       Button1.Visible := True;
       Button1Click(Sender);
  end
  else  if (copy(Pempno,1,1) = 'D') then
  begin
       Edit1.Visible   := True;
       Button1.Visible := True;
       Button1Click(Sender);
  end;

  EmpnoAdd;

  if CB_empno.Items.Count = 0 then
  begin
    MessageBox(handle,'접속하신 사원은 동료 또는 하향 평가권한이 없습니다.'+#13+#13+
                      '프로그램을 종료합니다.','대상자오류',MB_ICONWARNING);
    MainForm.Close;
    Exit;
  end;

  ParamVariant := 'SELECT nvl(to_char(value1), ''0''), nvl(to_char(value2), ''0''), '+
                  '       nvl(to_char(value3), ''0''), nvl(to_char(value4), ''0''), '+
                  '       nvl(to_char(value5), ''0''), nvl(to_char(value6), ''0'')  '+
                  '  FROM PEHUNBAS                                                  '+ // 평가기준
                  ' WHERE RABASDATE = '''+var_rabasdate+'''                         '+
                  '   AND GUBUN = ''20'' AND SGUBUN = ''0001''                      ';

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF3020A_sel1';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('VALUE1', ftFloat ,  10  );
    AddField('VALUE2', ftFloat ,  10  );
    AddField('VALUE3', ftFloat ,  10  );
    AddField('VALUE4', ftString,  10  );
    AddField('VALUE5', ftString,  10  );
    AddField('VALUE6', ftString,  10  );
    SQL.Text := ParamVariant;
    Open;
  end;

  SB_classs.Hint     := CDS_Gen.FieldByName('VALUE1').AsString; if SB_classs.Hint = '' then SB_classs.Hint := '0';  // 배점s
  SB_classa.Hint     := CDS_Gen.FieldByName('VALUE2').AsString; if SB_classa.Hint = '' then SB_classa.Hint := '0';  // 배점a
  SB_classb.Hint     := CDS_Gen.FieldByName('VALUE3').AsString; if SB_classb.Hint = '' then SB_classb.Hint := '0';  // 배점b
  SB_classc.Hint     := CDS_Gen.FieldByName('VALUE4').AsString; if SB_classc.Hint = '' then SB_classc.Hint := '0';  // 배점c
  SB_classd.Hint     := CDS_Gen.FieldByName('VALUE5').AsString; if SB_classd.Hint = '' then SB_classd.Hint := '0';  // 배점d
  SB_classe.Hint     := CDS_Gen.FieldByName('VALUE6').AsString; if SB_classe.Hint = '' then SB_classe.Hint := '0';  // 배점d
  CDS_Gen.Close;

  Application.ProcessMessages;

  BB_CancelClick(BB_Cancel);
end;


{------------------------------사용자정의 함수---------------------------------}
procedure TMainForm.EmpnoAdd;
var
  ParamVariant: String;
begin
//  L_eempno.Caption := Pkorname+' 님이 평가하실 피평가자는';
// 평가자 이름 가져오기
    DataModule_Tmax.TMaxDataSet_HInsa.Close;
    ParamVariant := 'SELECT korname FROM PIMPMAS        '+
                    ' where  empno = '''+GSempno+'''    ';
    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;
    L_eempno.Caption := DataModule_Tmax.Csel_gfd(1) +'님이 평가하실 피평가자는';

  CB_empno.Items.Clear;
  LB_empno.Items.Clear;

  //
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT NVL(DECODE(T.EVCNO,''0'',''하향2차'', ''1'',''하향'',''2'',''동료'',''3'',''하향특이'')||''  ''|| '+
                  '       RPAD(M.KORNAME, 6, '' '')||''(''||T.EMPNO||'')''||''  ''||T.EVCONYN ,'' '')||'';''||T.EVCNO NAME  '+
                  '  FROM PEHUNTOT T, PEHUNMAS M                                                                            '+
                  ' WHERE t.RABASDATE = '''+var_rabasdate+''' AND t.EEMPNO    = '''+GSempno+'''                              '+
                  '   AND t.RABASDATE = m.RABASDATE           AND t.EMPNO     = m.EMPNO        AND M.EVALYN    = ''Y''      '+
                  ' ORDER BY t.EMPNO                                                                                        ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    While Not Eof do
    begin
      CB_empno.Items.Add(DataModule_Tmax.Csel_gfd(1));
      LB_empno.Items.Add(DataModule_Tmax.Csel_gfd(2));
      Next;
    end;
  end;
  CB_empno.ItemIndex := 0;
  LB_empno.ItemIndex := 0;
  CB_empnoChange(Self);
end;


procedure TMainForm.BB_SaveClick(Sender: TObject);
var
  i, j, iCnt, iIndex : Integer;
  ParamVariant: String;
  lstBody     : TstringList;
  TempStr: String;
  sMark : array[1..3] of String;
begin
  SG_element.SetFocus;
  if L_evconyn.Caption = 'Y' then // 1차평가완료여부
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if Sender = BB_save then
  begin
    if not IsDataModified then
    begin
      MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.','작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;

    if (MainForm.var_gsevcno = '1') and (trim(M_Mark1.Text) = '') then // 하향평가의 경우 종합의견은 필수항목
    begin
      MessageBox(handle,'종합의견이 없습니다. 종합의견사항은 필수입력 사항입니다.','필수항목오류',MB_ICONWARNING);
      System.Exit;
    end;

  end
  else
  begin
    {
    if IsDataModified then
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;
    }

//    if (MainForm.var_gsevcno = '1') and (trim(M_Mark1.Text) = '') then // 하향평가의 경우 종합의견은 필수항목
    {
    if (MainForm.var_gsevcno <> '1') and (trim(M_Mark1.Text) = '') then // 하향평가의 경우 종합의견은 필수항목
    begin
      MessageBox(handle,'종합의견이 없습니다. 종합의견사항은 필수입력 사항입니다.','필수항목오류',MB_ICONWARNING);
      System.Exit;
    end;
    }

    // 본인의 등급과 등급들이 일치하는것이 하나도 없다면 입력안할걸로 간주
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
      if (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classs.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classa.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classb.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classc.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classd.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classe.Caption) then
      begin
        MessageBox(handle,'아직 입력되지 않은 평가항목이 있습니다.  확인하세요','작업순서오류',MB_ICONWARNING);

        for j := 0 to SG_element.RowCount-1 do
          if SG_HiddenData.Cells[dITEMNAME_IDX, i] = SG_element.Cells[eITEMNAME_IDX, j] then
          begin
            SG_element.Row := j;
            Break;
          end;
        System.Exit;
      end;

    if MessageBox(handle,PChar('최종완료를 하시면 등록하신 점수에 대해 수정하실 수 없습니다.'+#13+#13+
                               '등록하신 점수에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                               '최종완료를 하시겠습니까?'), '확 인',
                  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
       System.exit;
  end;
  Application.ProcessMessages;

  if not gbInsert then // insert = 최종완료
  begin
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    begin
      if SG_HiddenData.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
        Continue;

      if MainForm.var_gsEvcno = '1' then  // 1차 평가자
         ParamVariant := 'UPDATE PEHUNDET                                                                  '+ // 1차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+var_rabasdate+'''                                         '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+GSempno+'''                                                '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   '

      else if MainForm.var_gsEvcno = '0' then  // 2차 평가자
         ParamVariant := 'UPDATE PEHUNDET                                                                  '+ // 2차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+var_rabasdate+'''                                         '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+GSeempno+'''                                               '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   '

      else  // 동료 평가 & 특이 평가자
         ParamVariant := 'UPDATE PEHUNDET                                                                  '+ // 1차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+var_rabasdate+'''                                         '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+GSeempno+'''                                               '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   ';

      DataModule_Tmax.Cupd_SQL := ParamVariant;
      DataModule_Tmax.Cupd_Exec;


    end;
  end
  else
  begin
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    begin
      if MainForm.var_gsEvcno = '1' then     // 1차 평가자
         ParamVariant := 'INSERT INTO PEHUNDET                             '+
                         '  (RABASDATE                                  ,  '+
                         '   EMPNO                                      ,  '+
                         '   EEMPNO                                     ,  '+
                         '   CLASNO                                     ,  '+
                         '   ITEMNO                                     ,  '+
                         '   EVGRADE                                    ,  '+
                         '   EVSCORE)                                      '+
                         'VALUES                                           '+
                         '  ('''+var_rabasdate+'''             ,  '+
                         '   '''+var_empno+'''                          ,  '+ // 피평가자사번
                         '   '''+GSempno+'''                             ,  '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',  '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',  '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')  ' // 점수

      else if MainForm.var_gsEvcno = '0' then  //2차 평가자
         ParamVariant := 'INSERT INTO PEHUNDET                             '+
                         '  (RABASDATE                                  ,  '+
                         '   EMPNO                                      ,  '+
                         '   EEMPNO                                     ,  '+
                         '   CLASNO                                     ,  '+
                         '   ITEMNO                                     ,  '+
                         '   EVGRADE                                    ,  '+
                         '   EVSCORE)                                      '+
                         'VALUES                                           '+
                         '  ('''+var_rabasdate+'''                      ,  '+
                         '   '''+var_empno+'''                          ,  '+ // 피평가자사번
                         '   '''+GSeempno+'''                   ,  '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',  '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',  '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')  '                    // 점수

      else   // 동료 & 특이 평가자
         ParamVariant := 'INSERT INTO PEHUNDET                             '+
                         '  (RABASDATE                                  ,  '+
                         '   EMPNO                                      ,  '+
                         '   EEMPNO                                     ,  '+
                         '   CLASNO                                     ,  '+
                         '   ITEMNO                                     ,  '+
                         '   EVGRADE                                    ,  '+
                         '   EVSCORE)                                      '+
                         'VALUES                                           '+
                         '  ('''+var_rabasdate+'''             ,  '+
                         '   '''+var_empno+'''                          ,  '+ // 피평가자사번
                         '   '''+GSeempno+'''                   ,  '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',  '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',  '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')  '; // 점수

      DataModule_Tmax.Cupd_SQL := ParamVariant;
      DataModule_Tmax.Cupd_Exec;
    end;
  end;

  // 주소를 분리
  if M_Mark1.Modified then
  begin
    for iIndex := 1 downto 3 do
        sMark[iIndex] := '';

    iIndex := 1; iCnt := 1;
    TempStr := M_Mark1.Text;
    while (iCnt > -1) and (iIndex < 4) do
    begin
        iCnt := Get_KoreanCharPos(TempStr, 300);
        if iCnt > -1 then
        begin
            sMark[iIndex] := copy(TempStr,1,iCnt);
            TempStr       := copy(TempStr,iCnt+1,length(TempStr)-iCnt);
        end
        else
        begin
            sMark[iIndex] := TempStr;
            TempStr       := '';
        end;
        inc(iIndex);
    end;
    TempStr := '       mark1     = '''+sMark[1]+'''    ,          ' +
               '       mark2     = '''+sMark[2]+'''    ,          ' +
               '       mark3     = '''+sMark[3]+'''    ,          ' ;
  end
  else
    TempStr := '';

  if MainForm.var_gsEvcno = '1' then    // 1차 평가자
     ParamVariant := 'UPDATE pehuntot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr +
                     '       writeemp  = '''+Pempno+'''         ,               ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+GSempno+'''                         '

  else if MainForm.var_gsEvcno = '0' then  // 2차 평가자
     ParamVariant := 'UPDATE pehuntot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr +
                     '       writeemp  = '''+Pempno+'''         ,               ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+GSeempno+'''               '

  else    // 동료 & 특이 평가자
     ParamVariant := 'UPDATE pehuntot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr +
                     '       writeemp  = '''+Pempno+'''         ,               ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+GSeempno+'''               ' ;


  DataModule_Tmax.Cupd_SQL := ParamVariant;
  DataModule_Tmax.Cupd_Exec;

  Display_Sumup; // 화면의 평가점수/등급을 구한다

  if Sender = BB_confirm then // 최종확인
  begin
    var_evconyn := 'Y'; // 최종평가완료

    if MainForm.var_gsEvcno = '1' then   // 1차 평가자
       ParamVariant := 'UPDATE PEHUNTOT                                     '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                           '+
                       '       EVSCORE   = '''+L_score.Caption+''',         '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                   '+
                       ' WHERE RABASDATE = '''+var_rabasdate+'''   '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                '+ // 피평가자사번
                       '   AND EEMPNO    = '''+GSempno+'''                   '  // 평가자사번

    else if MainForm.var_gsEvcno = '0' then  // 2차 평가자
       ParamVariant := 'UPDATE PEHUNTOT                                     '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                           '+
                       '       EVSCORE   = '''+L_score.Caption+''',         '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                   '+
                       ' WHERE RABASDATE = '''+var_rabasdate+'''   '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                '+ // 피평가자사번
                       '   AND EEMPNO    = '''+GSempno+'''          '  // 평가자사번

    else    // 동료 & 특이 평가
       ParamVariant := 'UPDATE PEHUNTOT                                     '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                           '+
                       '       EVSCORE   = '''+L_score.Caption+''',         '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                   '+
                       ' WHERE RABASDATE = '''+var_rabasdate+'''   '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                '+ // 피평가자사번
                       '   AND EEMPNO    = '''+GSeempno+'''         ';  // 평가자사번

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;

    if MainForm.var_gsEvcno = '0' then  // 2차 평가자
       ParamVariant := 'UPDATE PEHUNTOT                                            '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                                  '+
                       '       EVSCORE   = '''+L_score.Caption+''',                '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+E1Empno+'''                         '+
                       ' WHERE RABASDATE = '''+var_rabasdate+'''                   '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                       '+ // 피평가자사번
                       '   AND EEMPNO    = '''+E1Empno+'''                         ';  // 평가자사번
    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;


  end;

  // 저장했으므로 변동여부는 all 'N'
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
      SG_HiddenData.Cells[dMODIFIED_IDX, i] := 'N';

  // 저장했으므로 입력여부는 False
  gbInsert := False;
  M_Mark1.Modified := False;

  if Sender = BB_save then
    MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0)
  else
  begin
    EmpnoAdd;
    CB_empno.ItemIndex := giindex;
    BB_CancelClick(BB_Cancel);
    MessageDlg('입력하신 평가자료를 최종 완료하였습니다.',mtInformation,[mbOk],0);
  end;
end;

procedure TMainForm.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data;

  if LB_clasname.Items.Count = 0 then
  begin
    MessageBox(handle,'등록된 평가요소가 하나도 없습니다','확 인',
               MB_OK or $0030 );
    System.Exit;
  end;

  LB_clasname.ItemIndex := 0;
  LB_clasnameClick(Sender);
  SG_element.SetFocus;
end;


procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.CB_empnoChange(Sender: TObject);
var
   i : Integer;
begin
  if CB_empno.ItemIndex < 0 then
     System.Exit;

  LB_empno.ItemIndex := CB_empno.ItemIndex;

  for i := 0 to LB_empno.Items.Count - 1 do
      if LB_empno.Selected[i] then begin
          Pgubun := LB_empno.Items[i];
          break;
      end;

  Pgubun := trim(copy(Pgubun,1, 1));
  var_gsEvcno := Pgubun;   // 선택된 피평가자에 대한 평가자의 평가구분
  Check_E2empno;

  if IsDataModified then
  begin
    CB_empno.ItemIndex := giindex;
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
               '작업순서오류',MB_ICONWARNING);
    Exit;
  end;

  BB_CancelClick(BB_Cancel);
end;

procedure TMainForm.LB_clasnameClick(Sender: TObject);
begin
  if LB_clasname.ItemIndex = -1 then
    System.Exit;

  showup_clasname(IntToStr(Integer(LB_clasname.Items.Objects[LB_clasname.ItemIndex])));
end;

procedure TMainForm.SG_elementDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
    SG_element.Canvas.Brush.Color := $00CFFBFC;
    SG_element.Canvas.Font.Color  := clBlack;
  end;

  SG_element.Canvas.FillRect(Rect); // cell의 영역을 그린다
  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if (ACol = eITEMDESc_IDX) and // 평가항목내용
     (SG_element.RowCount > (SG_element.VisibleRowCount+SG_element.FixedRows)) then
    Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_element.Cells[ACol,ARow];
  DrawText(SG_element.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then
    System.Exit;
  if not SG_element.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_element.Row < SG_element.TopRow then // 현재 row 가 화면위에 있다
    SG_element.Row := SG_element.TopRow
  else if SG_element.Row > (SG_element.TopRow + SG_element.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_element.Row := SG_element.TopRow + SG_element.VisibleRowCount-1;

  SG_class.TopRow := SG_element.TopRow;

  // 버튼의 top 위치를 계산
  P_ControlButton.Top := (SG_element.Row - SG_element.TopRow) * (SG_element.DefaultRowHeight + SG_element.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_classs.Down := False;
  SB_classa.Down := False;
  SB_classb.Down := False;
  SB_classc.Down := False;
  SB_classd.Down := False;
  SB_classe.Down := False;

  SB_classs.Down := (SB_classs.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classa.Down := (SB_classa.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classb.Down := (SB_classb.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classc.Down := (SB_classc.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classd.Down := (SB_classd.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classe.Down := (SB_classe.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);


  if L_evconyn.Caption = 'Y' then
     P_ControlButton.Visible := False
  else
  begin
     if MainForm.var_gsEvcno = '0' then   // 작업자가 최종평가자냐
        P_ControlButton.Visible := False
     else
        P_ControlButton.Visible := True;
  end;
//  P_ControlButton.Visible := True;
end;

procedure TMainForm.SG_elementExit(Sender: TObject);
begin
  P_ControlButton.Visible := False;
end;

procedure TMainForm.SG_elementKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_element.Row = 0) and
     (LB_clasname.ItemIndex > 0) then
  begin
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
     (SG_element.Row = SG_element.RowCount-1) and
     (LB_clasname.ItemIndex < (LB_clasname.Items.Count-1)) then
  begin
    Key := VK_ESCAPE;
  end;
end;

procedure TMainForm.SG_classDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if (SG_class.Cells[sCLASSs_IDX, ARow] <> '') or
     (SG_class.Cells[sCLASSa_IDX, ARow] <> '') or
     (SG_class.Cells[sCLASSb_IDX, ARow] <> '') or
     (SG_class.Cells[sCLASSc_IDX, ARow] <> '') or
     (SG_class.Cells[sCLASSd_IDX, ARow] <> '') or
     (SG_class.Cells[sCLASSe_IDX, ARow] <> '') then
    SG_class.Canvas.Brush.Color := SG_class.Font.Color;

  if CB_ShowClass.Checked then // 등급을 보이게...
    SG_class.Canvas.Font.Color := SG_element.Font.Color
  else
    SG_class.Canvas.Font.Color := SG_class.Font.Color;

  SG_class.Canvas.FillRect(Rect); // cell의 영역을 그린다
  Rect.Top := Rect.Top + 30;
  A := SG_class.Cells[ACol, ARow];
  DrawText(SG_class.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_CENTER {or DT_VCENTER});
end;

procedure TMainForm.SG_classEnter(Sender: TObject);
begin
  SG_element.SetFocus;
end;

procedure TMainForm.SB_classsClick(Sender: TObject);
var
  i,cnt : Integer;
begin
  if SG_HiddenData.Tag = -1 then
     System.Exit;

  if not BB_Save.Visible then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료나 평가기간이 지난 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  // 버튼이 눌리면 점수반영
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row] := TSpeedButton(Sender).Caption;
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_element.Row] :=
       floattostr(strtofloat(SG_HiddenData.Cells[dWEIGHT_IDX, SG_HiddenData.Tag+SG_element.Row]) * strtofloat(TSpeedButton(Sender).Hint));
    SG_HiddenData.Cells[dMODIFIED_IDX,SG_HiddenData.Tag+SG_element.Row] := 'Y'; // 자료 변동 여부

    SG_class.Cells[sCLASSs_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSa_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSb_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSc_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSd_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSe_IDX, SG_element.Row] := '';
    if SB_classs.Down then
      SG_class.Cells[sCLASSs_IDX, SG_element.Row] := SB_classs.Caption
    else if SB_classa.Down then
      SG_class.Cells[sCLASSa_IDX, SG_element.Row] := SB_classa.Caption
    else if SB_classb.Down then
      SG_class.Cells[sCLASSb_IDX, SG_element.Row] := SB_classb.Caption
    else if SB_classc.Down then
      SG_class.Cells[sCLASSc_IDX, SG_element.Row] := SB_classc.Caption
    else if SB_classd.Down then
      SG_class.Cells[sCLASSd_IDX, SG_element.Row] := SB_classd.Caption
    else if SB_classe.Down then
      SG_class.Cells[sCLASSe_IDX, SG_element.Row] := SB_classe.Caption;
  end;

  cnt := 0;
  for i := 0 to SG_HiddenData.RowCount - 1 do
  begin
    if Trim(SG_HiddenData.Cells[dCLASS_IDX, i]) <> '' then
      cnt := cnt + 1;
  end;

  L_TotalComp.Caption := '총 '+IntToStr(SG_HiddenData.RowCount - 1)+'개의 평가항목중 '+
                         IntToStr(cnt)+'개를 등록하셨습니다';
  Display_Sumup;
end;


procedure TMainForm.Retrieve_Data;
var
  ParamVariant: String;
  i, j, cnt   : Integer;
  TempStr: String;
begin
  screen.Cursor := crHourGlass;
  giindex := CB_empno.Itemindex;
  //피평가자 사번 구하기..
  i := Pos(')', CB_empno.Text);
  var_empno := Copy(CB_empno.Text, i-4, 4); // 피평가자 사번

  //피평가자 부서코드 구하기..
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT DEPTCODE FROM PEHUNMAS     '+ // 평가요소
                  ' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '   AND EMPNO     = '''+var_empno+'''   ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  DataModule_Tmax.TMaxDataSet_HInsa.Open;
  Pdeptcode := DataModule_Tmax.Csel_gfd(1); // 부서코드
  DataModule_Tmax.TMaxDataSet_HInsa.Close;


  // 평가요소를 구한다
  LB_clasname.Items.Clear;
  ParamVariant := 'SELECT NVL(TO_CHAR(CLASNO),''0'') || '';'' || NVL(CLASNAME, '' '') '+
                  '  FROM PEHUNCLAS                                                   '+ // 평가요소
                  ' WHERE RABASDATE = '''+var_rabasdate+'''                           '+ // 평가기준일
                  ' GROUP BY clasno, CLASNAME                                         ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  DataModule_Tmax.TMaxDataSet_HInsa.Open;
  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
    LB_clasname.Items.AddObject(DataModule_Tmax.Csel_gfd(2), // 평가요소명
                                TObject( StrToInt(DataModule_Tmax.Csel_gfd(1)) )); // 평가요소번호
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;

  // StringGrid 초기화
  for i := SG_HiddenData.FixedCols to SG_HiddenData.ColCount - 1 do
    for j := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  SG_HiddenData.RowCount := 2;

  // 평가항목과 피평가자의 평가점수를 읽어온다
  if MainForm.var_gsEvcno = '1' then   // 1차 평가자
     ParamVariant := 'SELECT nvl(        b.empno         ,'' ''),        '+
                     '       nvl(to_char(a.evcno        ),''0''),        '+
                     '       nvl(to_char(a.clasno       ),''0''),        '+
                     '       nvl(to_char(a.itemno       ),''0''),        '+
                     '       nvl(        a.itemname      ,'' ''),        '+
                     '       nvl(        a.itemdesc      ,'' ''),        '+
                     '       nvl(        b.evgrade       ,'' ''),        '+
                     '       nvl(to_char(b.evscore      ),''0''),        '+
                     '       nvl(to_char(a.weight       ),''0'')         '+
                     'FROM PEHUNITEM a, PEHUNDET b                       '+ // 평가항목, 자기평가
                     'WHERE a.RABASDATE = '''+var_rabasdate+'''          '+ // 평가기준일
                     '  AND b.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '  AND b.EEMPNO(+) = '''+GSempno+'''                 '+ // 평가자사번
                     '  AND a.RABASDATE = b.RABASDATE (+)                '+
                     '  AND a.EVCNO     = '''+var_gsevcno+'''            '+ // 평가기준일
                     '  AND a.CLASNO    = b.CLASNO    (+)                '+
                     '  AND a.ITEMNO    = b.ITEMNO    (+)                '+
                     'ORDER BY a.EVCNO, a.CLASNO, a.ITEMNO               '

  else if MainForm.var_gsEvcno = '0' then  // 2차 평가자
     ParamVariant := 'SELECT nvl(        b.empno         ,'' ''),        '+
                     '       nvl(to_char(a.evcno        ),''0''),        '+
                     '       nvl(to_char(a.clasno       ),''0''),        '+
                     '       nvl(to_char(a.itemno       ),''0''),        '+
                     '       nvl(        a.itemname      ,'' ''),        '+
                     '       nvl(        a.itemdesc      ,'' ''),        '+
                     '       nvl(        b.evgrade       ,'' ''),        '+
                     '       nvl(to_char(b.evscore      ),''0''),        '+
                     '       nvl(to_char(a.weight       ),''0'')         '+
                     'FROM PEHUNITEM a, PEHUNDET b                       '+ // 평가항목, 자기평가
                     'WHERE a.RABASDATE = '''+var_rabasdate+'''          '+ // 평가기준일
                     '  AND b.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '  AND b.EEMPNO(+) = '''+GSeempno+'''                '+ // 평가자사번
                     '  AND a.RABASDATE = b.RABASDATE (+)                '+
                     '  AND a.EVCNO     = '''+var_gsevcno+'''            '+ // 평가기준일
                     '  AND a.CLASNO    = b.CLASNO    (+)                '+
                     '  AND a.ITEMNO    = b.ITEMNO    (+)                '+
                     'ORDER BY a.EVCNO, a.CLASNO, a.ITEMNO               '

  else    // 동료평가 또는 특이평가자 2, 3
     ParamVariant := 'SELECT nvl(        b.empno         ,'' ''),        '+
                     '       nvl(to_char(a.evcno        ),''0''),        '+
                     '       nvl(to_char(a.clasno       ),''0''),        '+
                     '       nvl(to_char(a.itemno       ),''0''),        '+
                     '       nvl(        a.itemname      ,'' ''),        '+
                     '       nvl(        a.itemdesc      ,'' ''),        '+
                     '       nvl(        b.evgrade       ,'' ''),        '+
                     '       nvl(to_char(b.evscore      ),''0''),        '+
                     '       nvl(to_char(a.weight       ),''0'')         '+
                     'FROM PEHUNITEM a, PEHUNDET b                       '+ // 평가항목, 자기평가
                     'WHERE a.RABASDATE = '''+var_rabasdate+'''          '+ // 평가기준일
                     '  AND b.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '  AND b.EEMPNO(+) = '''+GSeempno+'''                '+ // 평가자사번
                     '  AND a.RABASDATE = b.RABASDATE (+)                '+
                     '  AND a.EVCNO     = '''+Pgubun+'''                 '+ // 평가구분
                     '  AND a.CLASNO    = b.CLASNO    (+)                '+
                     '  AND a.ITEMNO    = b.ITEMNO    (+)                '+
                     'ORDER BY a.EVCNO, a.CLASNO, a.ITEMNO               ';

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF3020A_sel2';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EMPNO'        , ftString,  4   );
    AddField('EVCNO'        , ftFloat ,  2   );
    AddField('CLASNO'       , ftFloat ,  2   );
    AddField('ITEMNO'       , ftFloat ,  2   );
    AddField('ITEMNAME'     , ftString,  30  );
    AddField('ITEMDESC'     , ftString,  200 );
    AddField('EVGRADE'      , ftString,  1   );
    AddField('EVSCORE'      , ftFloat ,  8   );
    AddField('WEIGHT'       , ftFloat ,  7   );
    SQL.Text := ParamVariant;
    Open;
  end;

  while not CDS_Gen.Eof do
  begin
    if SG_HiddenData.Cells[dCLASNO_IDX, SG_HiddenData.RowCount-1] <> '' then
      SG_HiddenData.RowCount := SG_HiddenData.RowCount + 1;
    SG_HiddenData.Cells[dCLASNO_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('clasno').AsString; // 평가요소번호
    SG_HiddenData.Cells[dITEMNO_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemno').AsString; // 평가항목번호
    SG_HiddenData.Cells[dITEMNAME_IDX, SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemname').AsString; // 평가항목명
    SG_HiddenData.Cells[dITEMDESC_IDX, SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemdesc').AsString; // 평가항목내용
    SG_HiddenData.Cells[dCLASS_IDX   , SG_HiddenData.RowCount-1] := ChangeGradeToStr(CDS_Gen.FieldByName('evgrade').AsString); // 평가등급
    if Trim(CDS_Gen.FieldByName('evscore').AsString) = '' then
      SG_HiddenData.Cells[dSCORE_IDX , SG_HiddenData.RowCount-1] := '0'
    else
      SG_HiddenData.Cells[dSCORE_IDX   , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('evscore').AsString; // 평가점수
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.RowCount-1] := 'N'; // 자료 변동 여부
    SG_HiddenData.Cells[dWEIGHT_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('weight').AsString; // 평가등급

    if trim(CDS_Gen.FieldByName('EMPNO').AsString) = '' then
        gbInsert := True
    else
        gbInsert := False;
    CDS_Gen.Next;
  end;

  CDS_Gen.Close;

  Display_Sumup;

  // 20050512 수정
  if MainForm.var_gsEvcno = '1' then  // 1차 평가자
     ParamVariant := 'SELECT nvl(        EVCONYN           ,'' ''),         '+
                     '       nvl(to_char(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       nvl(        MARK1             ,'' ''),         '+
                     '       nvl(        MARK2             ,'' ''),         '+
                     '       nvl(        MARK3             ,'' '')          '+
                     ' FROM PEHUNTOT                                        '+
                     ' WHERE RABASDATE = '''+var_rabasdate+'''              '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+GSempno+'''                     '  // 평가자사번
  else if MainForm.var_gsEvcno = '0' then  // 2차 평가자
     ParamVariant := 'SELECT nvl(        EVCONYN           ,'' ''),         '+
                     '       nvl(to_char(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       nvl(        MARK1             ,'' ''),         '+
                     '       nvl(        MARK2             ,'' ''),         '+
                     '       nvl(        MARK3             ,'' '')          '+
                     ' FROM PEHUNTOT                                        '+
                     ' WHERE RABASDATE = '''+var_rabasdate+'''              '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+GSeempno+'''                    '  // 평가자사번
  else  // 동표 & 특이 평가자
     ParamVariant := 'SELECT nvl(        EVCONYN           ,'' ''),         '+
                     '       nvl(to_char(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       nvl(        MARK1             ,'' ''),         '+
                     '       nvl(        MARK2             ,'' ''),         '+
                     '       nvl(        MARK3             ,'' '')          '+
                     ' FROM PEHUNTOT                                        '+
                     ' WHERE RABASDATE = '''+var_rabasdate+'''              '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+GSeempno+'''                    '; // 평가자사번

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF3020A_sel3';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EVCONYN'        , ftString,  1   );
    AddField('EVSCORE'        , ftFloat ,  8   );
    AddField('MARK1'          , ftString,  300 );
    AddField('MARK2'          , ftString,  300 );
    AddField('MARK3'          , ftString,  300 );
    SQL.Text := ParamVariant;
    Open;
  end;

  if CDS_Gen.FieldByName('EVCONYN').AsString = 'N' then
    L_evconyn.Font.Color := clRed
  else L_evconyn.Font.Color := clBlue;

  //강제로 막아줌. 평가시 풀어줄것.JSH  20060530 하은영
  L_evconyn.Caption := CDS_Gen.FieldByName('EVCONYN').AsString;  //'Y';

  L_score.Caption   := CDS_Gen.FieldByName('EVSCORE').AsString;

  M_Mark1.Clear;
  M_Mark1.SelStart := 0;
  M_Mark1.Perform(EM_SCROLLCARET, 0, 0);

  TempStr := CDS_Gen.FieldByName('MARK1').AsString
            +CDS_Gen.FieldByName('MARK2').AsString
            +CDS_Gen.FieldByName('MARK3').AsString;
  if TempStr <> '' then
    while Pos(#10#10, TempStr) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
      TempStr := SearchAndReplace(TempStr, #10#10, #13#10);
  M_Mark1.Text := TempStr;

  CDS_Gen.Close;

  if (L_evconyn.Caption = 'Y') then        // 평가가 최종완료처리
  begin
    L_dot.Visible      := False;
    L_munjang3.Visible := False;
    L_munjang5.Visible := False;
    L_munjang8.Visible := False;
    BB_save   .Visible := False;
    BB_Cancel .Visible := False;
    BB_confirm.Visible := False;
    M_Mark1.ReadOnly   := True;
    M_Mark1.Color      := $00E6E6E6;
    P_ControlButton.Visible := False;
  end
  else
  begin
    L_dot.Visible      := True;
    L_munjang3.Visible := True;
    L_munjang5.Visible := True;
    L_munjang8.Visible := True;

    if var_gsEvcno = '1' then   // 1차 평가자
    begin
       if E2Empno = '' then      // 1차 평가자가 최종평가자일 경우
       begin
          BB_save   .Visible := True;
          BB_Cancel .Visible := True;
          BB_confirm.Visible := True;
          M_Mark1.ReadOnly   := False;
          M_Mark1.Color      := clWhite;
          P_ControlButton.Visible := True;
       end
       else                           // 평가자가 최종평가자가 아니면
       begin
          BB_save   .Visible := True;
          BB_Cancel .Visible := True;
          BB_confirm.Visible := False;
          M_Mark1.ReadOnly   := False;
          M_Mark1.Color      := clWhite;
          P_ControlButton.Visible := True;
       end;
    end
    else if MainForm.var_gsEvcno = '0' then   // 2차 평가자
    begin
       BB_save   .Visible := False;
       BB_Cancel .Visible := False;
       BB_confirm.Visible := True;
       M_Mark1.ReadOnly   := True;
       M_Mark1.Color      := $00E6E6E6;
       P_ControlButton.Visible := False;
    end
    else if MainForm.var_gsevcno = '2' then // 동료평가이면
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := True;
       M_Mark1.ReadOnly   := True;
       M_Mark1.Color      := $00E6E6E6;
    end
    else if MainForm.var_gsevcno = '3' then // 동료평가이면
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := True;
       M_Mark1.ReadOnly   := True;
       M_Mark1.Color      := $00E6E6E6;
       P_ControlButton.Visible := False;
    end;

    {
    else if E2Empno = '' then      // 1차 평가자가 최종평가자일 경우
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := True;
    end
    else                           // 평가자가 최종평가자가 아니면
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := False;
    end;


    if MainForm.var_gsevcno = '2' then // 동료평가이면
    begin
      M_Mark1.ReadOnly   := True;
      M_Mark1.Color      := $00E6E6E6;
    end
    else
    begin
      if MainForm.var_gsEvcno = '0' then
      begin
         M_Mark1.ReadOnly   := True;
         M_Mark1.Color      := $00E6E6E6;
      end
      else
      begin
         M_Mark1.ReadOnly   := False;
         M_Mark1.Color      := clWhite;
      end;
    end;
    }
  end;

  cnt := 0;
  for i := 0 to SG_HiddenData.RowCount - 1 do
  begin
    if Trim(SG_HiddenData.Cells[dCLASS_IDX, i]) <> '' then
      cnt := cnt + 1;
  end;

  L_TotalComp.Caption := '총 '+IntToStr(SG_HiddenData.RowCount - 1)+'개의 평가항목중 '+
                         IntToStr(cnt)+'개를 등록하셨습니다';
  screen.Cursor := crArrow;
end;

procedure TMainForm.showup_clasname(clasno: String);
var
  i, j: Integer;
begin
  // StringGrid 초기화
  for i := SG_element.FixedCols to SG_element.ColCount - 1 do
    for j := SG_element.FixedCols to SG_element.RowCount -1 do
      SG_element.Cells[i, j] := '';
  SG_element.RowCount := 1;

  for i := SG_class.FixedCols to SG_class.ColCount - 1 do
    for j := SG_class.FixedCols to SG_class.RowCount -1 do
      SG_class.Cells[i, j] := '';
  SG_class.RowCount := 1;

  SG_HiddenData.Tag := -1;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do // 평가항목 갯수만큼
  begin
      if SG_HiddenData.Tag = -1 then
        SG_HiddenData.Tag := i; // SG_HiddenData.Tag 에 현재 평가요소의 시작 index를 저장한다

      if SG_element.Cells[SG_element.FixedCols, SG_element.RowCount-1] <> '' then
      begin
        SG_element.RowCount := SG_element.RowCount + 1;
        SG_class.RowCount   := SG_class.RowCount + 1;
      end;

      SG_element.Cells[eITEMNAME_IDX, SG_element.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i]; // 평가항목명
      SG_element.Cells[eITEMDESC_IDX, SG_element.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i]; // 평가항목내용
      SG_element.Cells[eSSCORE_IDX,   SG_element.RowCount-1] := SG_HiddenData.Cells[dSSCORE_IDX, i]; // 자기평가점수

      if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classs.Caption then // 등급s
        SG_class.Cells[sCLASSs_IDX, SG_class.RowCount-1] := SB_classs.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classa.Caption then // 등급a
        SG_class.Cells[sCLASSa_IDX, SG_class.RowCount-1] := SB_classa.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classb.Caption then // 등급b
        SG_class.Cells[sCLASSb_IDX, SG_class.RowCount-1] := SB_classb.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classc.Caption then // 등급c
        SG_class.Cells[sCLASSc_IDX, SG_class.RowCount-1] := SB_classc.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classd.Caption then // 등급d
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := SB_classd.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classe.Caption then // 등급e
        SG_class.Cells[sCLASSe_IDX, SG_class.RowCount-1] := SB_classe.Caption
      else
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := '';
  end;

  SG_element.SetFocus;
end;

function TMainForm.IsDataModified: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;

  if M_Mark1.Modified then // 의견1
    Result := True
end;

procedure TMainForm.Display_Sumup;
var
  i : Integer;
  sumscore : Double;
begin
  sumscore := 0;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do // 평가항목 갯수만큼
  begin
    if SG_HiddenData.Cells[dSCORE_IDX, i] = '0' then continue;
    if SG_HiddenData.Cells[dSCORE_IDX, i] = '' then continue
    else sumscore := sumscore + StrToFloat(SG_HiddenData.Cells[dSCORE_IDX, i]);
  end;
  L_score.Caption := FloatToStr(sumscore); // 평가점수
end;

procedure TMainForm.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if CB_name.Items.Count < 5 then
    CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5 then
    CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then
    CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then
    CB_name.DropDownCount := 20
  else
    CB_name.DropDownCount := CB_name.Items.Count + 1;
end;


function TMainForm.Check_E2empno;
var
  ParamVariant: String;
  i : Integer;
begin
    giindex := CB_empno.Itemindex;
    //피평가자 사번 구하기..
    i := Pos(')', CB_empno.Text);
    var_empno := Copy(CB_empno.Text, i-4, 4); // 피평가자 사번


   if var_gsEvcno = '0' then     //하향 2차 평가자일 경우
   begin
      DataModule_Tmax.TMaxDataSet_HInsa.Close;
      {
      ParamVariant := 'SELECT B.EVCNO || '';'' || B.EEMPNO                          '+
                      '  FROM PEHUNTOT A,                                           '+
                      '       (SELECT RABASDATE, EMPNO, EEMPNO, EVCNO FROM PEHUNTOT '+
                      '         WHERE RABASDATE = '''+var_rabasdate+'''             '+
                      '           AND EVCNO = ''1'') B                              '+
                      ' WHERE A.RABASDATE = '''+var_rabasdate+'''                   '+
                      '   AND A.EEMPNO    = '''+GSempno + '''                        '+
                      '   AND A.RABASDATE = B.RABASDATE                             '+
                      '   AND A.EMPNO     = B.EMPNO                                 ';
      }
      //하향 1차 평가자를 찾아서 그 사번을 넣어줌. 1차평가자가 없으면 안됨.
      //1차평가자가 없고 2차평가자만 있는경우
      //pehuntot테이블에서 evcno = 0으로 된것을 찾아서 1로 바꿔줄것.
      ParamVariant := 'SELECT A.EVCNO || '';'' || A.EEMPNO                          '+
                      '  FROM PEHUNTOT A                                            '+
                      ' WHERE A.RABASDATE = '''+var_rabasdate+'''                   '+
                      '   AND A.EMPNO     = '''+var_empno+'''                       '+
                      '   AND A.EVCNO     = ''1''                                   ';

      DataModule_Tmax.Csel_SQL := ParamVariant;
      DataModule_Tmax.Csel_Open;
      DataModule_Tmax.TMaxDataSet_HInsa.Open;

      var_gubun := DataModule_Tmax.Csel_gfd(1);  // 평가자 구분 ['1'-하향, '2'-담당이 있는 부서 팀장, '0'-동료평가, '3'-특이]
      GSeempno   := DataModule_Tmax.Csel_gfd(2);  // 1차 평가자 사번
   end
   else
   begin
      var_gubun := var_gsEvcno;
      GSeempno   := GSempno;
   end;


   DataModule_Tmax.TMaxDataSet_HInsa.Close;
   if MainForm.var_gsEvcno = '1' then // 하향 1차 평가자
      ParamVariant :=  'SELECT NVL(A.EEMPNO, '' '') ||'';''|| NVL(B.EEMPNO, '' '') VALUE  '+
                       '  FROM PEHUNTOT A,                                                        '+
                       '      (SELECT RABASDATE, EMPNO, EEMPNO FROM PEHUNTOT                      '+
                       '        WHERE RABASDATE = '''+var_rabasdate+'''                  '+
                       '          AND EMPNO     = '''+var_empno+'''                               '+
                       '          AND EVCNO     = ''0'') B                                        '+
                       ' WHERE A.RABASDATE = '''+var_rabasdate+'''                       '+
                       '   AND A.EMPNO     = '''+var_empno+'''                                    '+
                       '   AND A.EEMPNO    = '''+GSempno+'''                                       '+
                       '   and A.EVCNO     = '''+Pgubun+'''                              '+
                       '   AND A.RABASDATE = B.RABASDATE(+)                                       '+
                       '   AND A.EMPNO     = B.EMPNO    (+)                                       '

   else if MainForm.var_gsEvcno = '0' then  //하향 2차 평가자
      ParamVariant :=  'SELECT NVL(A.EEMPNO, '' '') ||'';''|| NVL(B.EEMPNO, '' '') VALUE  '+
                       '  FROM PEHUNTOT A,                                                        '+
                       '      (SELECT RABASDATE, EMPNO, EEMPNO FROM PEHUNTOT                      '+
                       '        WHERE RABASDATE = '''+var_rabasdate+'''                  '+
                       '          AND EMPNO     = '''+var_empno+'''                               '+
                       '          AND EVCNO     = ''0'') B                                        '+
                       ' WHERE A.RABASDATE = '''+var_rabasdate+'''                       '+
                       '   AND A.EMPNO     = '''+var_empno+'''                                    '+
                       '   AND A.EEMPNO    = '''+GSeempno+'''                             '+
                       '   and A.EVCNO     = '''+var_gubun+'''                              '+
                       '   AND A.RABASDATE = B.RABASDATE(+)                                       '+
                       '   AND A.EMPNO     = B.EMPNO    (+)                                       ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  DataModule_Tmax.TMaxDataSet_HInsa.Open;

  if (MainForm.var_gsEvcno = '2') or (MainForm.var_gsEvcno = '3') then  // 동표 & 특이평가자
  begin
     E1Empno := '';
     E2Empno := '';
  end
  else
  begin
     E1Empno := DataModule_Tmax.Csel_gfd(1);
     E2Empno := DataModule_Tmax.Csel_gfd(2);
  end;
  //showmessage('E1Empno=> ' + E1Empno + ', E2Empno=> ' + E2Empno);
end;


function TMainForm.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,
  nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while(nPos > 0)do
  begin
    Delete( sSrc, nPos, nLenLookFor );
    Insert( sReplaceWith, sSrc, nPos );
    nPos := Pos( sLookFor, sSrc );
  end;
  Result := sSrc;
end;

function TMainForm.Get_KoreanCharPos(letter: string; WishCnt: Integer): Integer;
var
  i, k, msb: integer;
begin
  if System.Length(letter) < WishCnt then
  begin
    Get_KoreanCharPos := -1;
    System.Exit;
  end;

  msb := 0;
  for i := 1 to WishCnt do
    if (Integer(letter[i]) and Integer($80)) = Integer($80) then
      Inc(msb);

  if (msb mod 2) = 0 then {'$80'인것이 짝수개이면 완성된 한글문장}
    Get_KoreanCharPos := WishCnt
  else
    Get_KoreanCharPos := WishCnt - 1;
end;


function TMainForm.ChangeStrToGrade(Str: String):String;
begin
  Result := '';
  if Str = '탁월' then
    Result := 'S'
  else if Str = '우수' then
    Result := 'A'
  else if Str ='보통' then
    Result := 'B'
  else if Str ='미흡' then
    Result := 'C'
  else if Str ='저조' then
    Result := 'D'
  else if Str ='불량' then
    Result := 'E';
end;

function TMainForm.ChangeGradeToStr(Grade: string):String;
begin
  Result := '';
  if Grade = 'S' then
    Result := '탁월'
  else if Grade = 'A' then
    Result := '우수'
  else if Grade ='B' then
    Result := '보통'
  else if Grade ='C' then
    Result := '미흡'
  else if Grade ='D' then
    Result := '저조'
  else if Grade ='E' then
    Result := '불량';
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  ParamVariant: String;
begin
    GSempno := edit1.text;
    EmpnoAdd;
end;

end.
