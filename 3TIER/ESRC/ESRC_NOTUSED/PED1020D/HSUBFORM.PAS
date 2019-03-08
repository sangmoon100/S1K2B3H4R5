unit HSubForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, OnScheme, StdCtrls, ExtCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Db, Tmax_DataSetText,
  OnFocusButton, Tmax_session,OnInsaCommon, OnEditMemo,
  Buttons, ComCtrls, OnTmaxPersonEdit, OnLineLabel, OnShapeLabel,pedbutil,
  OnSkinBtn, TmaxFunc;

type
  TFM_Sub = class(TForm)
    DS_Sub: TDataSource;
    DBSet_Sub: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    DBSet2: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    L_eempno: TLabel;
    CB_empno: TLabel;
    Label14: TLabel;
    Bt_Confirm: TOnFocusButton;
    BT_Save1: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Cancel1: TOnFocusButton;
    Label11: TLabel;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    Notebook1: TNotebook;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    L_Total01: TLabel;
    L_Yes01: TLabel;
    Label6: TLabel;
    SG_Image01: TStringGrid;
    SG_HiddenData01: TStringGrid;
    Panel8: TPanel;
    SG_Score01: TStringGrid;
    P_ControlButton01: TPanel;
    SB_S01: TSpeedButton;
    SB_A01: TSpeedButton;
    SB_B01: TSpeedButton;
    SB_D01: TSpeedButton;
    SB_C01: TSpeedButton;
    Panel10: TPanel;
    L_First01: TPanel;
    CB_ShowClass01: TCheckBox;
    Label3: TLabel;
    Panel3: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Shape3: TShape;
    Label18: TLabel;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total1: TLabel;
    L_Yes1: TLabel;
    L_duname: TLabel;
    Label20: TLabel;
    SG_Image1: TStringGrid;
    SG_HiddenData1: TStringGrid;
    Panel12: TPanel;
    SG_Score1: TStringGrid;
    P_ControlButton1: TPanel;
    SB_S1: TSpeedButton;
    SB_A1: TSpeedButton;
    SB_B1: TSpeedButton;
    SB_C1: TSpeedButton;
    SB_D1: TSpeedButton;
    L_Title: TPanel;
    L_First1: TPanel;
    CB_ShowClass1: TCheckBox;
    Label15: TLabel;
    M_image11: TOnMemo;
    M_image12: TOnMemo;
    M_image13: TOnMemo;
    M_image14: TOnMemo;
    M_image15: TOnMemo;
    TabSheet4: TTabSheet;
    Shape4: TShape;
    Panel13: TPanel;
    Label17: TLabel;
    L_Total2: TLabel;
    L_Yes2: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    CB_ShowClass2: TCheckBox;
    Label22: TLabel;
    SG_Image2: TStringGrid;
    SG_HiddenData2: TStringGrid;
    Panel14: TPanel;
    SG_Score2: TStringGrid;
    P_ControlButton2: TPanel;
    SB_S2: TSpeedButton;
    SB_A2: TSpeedButton;
    SB_B2: TSpeedButton;
    SB_C2: TSpeedButton;
    SB_D2: TSpeedButton;
    Panel15: TPanel;
    L_First2: TPanel;
    Label23: TLabel;
    M_image21: TOnMemo;
    M_image22: TOnMemo;
    M_image23: TOnMemo;
    M_image24: TOnMemo;
    M_image25: TOnMemo;
    L_korname: TOnShapeLabel;
    SG_ItemImage01: TStringGrid;
    Label4: TLabel;
    E_ELview: TOnMemo;
    ED_CN: TEdit;
    BT_Sel: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure Btn_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1Enter(Sender: TObject);
    procedure SB_S1Click(Sender: TObject);
    procedure SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score2Enter(Sender: TObject);
    procedure SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SB_S2Click(Sender: TObject);
    procedure BT_Save1Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure CB_ShowClass1Click(Sender: TObject);
    procedure CB_ShowClass2Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01Enter(Sender: TObject);
    procedure SB_S01Click(Sender: TObject);
    procedure BT_Cancel1Click(Sender: TObject);
    procedure SG_Image1Click(Sender: TObject);
    procedure SG_Image2Click(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SG_Image01Exit(Sender: TObject);
    procedure SG_Image01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_ItemImage01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure E_ELviewClick(Sender: TObject);
    procedure E_ELviewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_SelClick( Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
     FL_Start   : Boolean;
    procedure Values_data1;
    procedure Common_data;
    procedure Leadership_data;
    procedure ShowSum01;
    procedure ShowSum1;
    procedure ShowSum2;
    function  IsDataModified01: Boolean;
    function  IsDataModified: Boolean;
    function Csel_gfd(p_loc: Integer): String;
  public
    { Public declarations }
  end;

var
  FM_Sub     : TFM_Sub;
  sRabasdate : String;       //평가기준일
  var_empno  : String;       //로그인사번
  var_korname: String;       //로그인성명
  var_Ekind  : String;       //VALUE, 공통역량, 리더십역량

  CheckGubun : String;
  GspEmpno   : String;
  Ppaycl     : String;
  vClose     : Boolean;

  workemp1   : String;
  workemp2   : String;
  workemp3   : String;
  workemp4   : String;
  workemp5   : String;

const
  var_ScrS = '100';
  var_ScrA = '90';
  var_ScrB = '80';
  var_ScrC = '70';
  var_ScrD = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';

  // SG_HiddenData 의 index
  dITEMNO_IDX   = 0; // 평가항목번호
  dITEMNAME_IDX = 1; // 평가항목명
  dITEMDESC_IDX = 2; // 평가세부항목명
  dIMAGENO_IDX  = 3; // 평가이미지번호
  dIMAGEDESC_IDX= 4; // 평가이미지내용
  dSCORE_IDX    = 5; // 평가점수
  dMODIFIED_IDX = 6; // 자료변동여부
  dISNEW_IDX    = 7; // 테이블에 없는 레코드 여부(Y,N)

  // SG_Image 의 index
  mITEMNAME_IDX = 0;
  mITEMDESC_IDX = 1; // 평가이미지내용

implementation

uses Hinsa_TmaxDM;

//uses HMainForm, HMainForm1;



{$R *.DFM}

procedure TFM_Sub.BT_SelClick(Sender: TObject);
var SqlText : String;
begin
  Application.ProcessMessages;

  if (Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
     (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
     (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D') then
  begin
    SqlText := 'SELECT Korname FROM pimpmas ' +
               ' WHERE empno = ''' + ED_CN.Text +''' ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;

    var_korname := DataModule_Tmax.Csel_gfd(1);

    L_eempno.Caption := var_korname + '님이 평가하실 피평가자는';
    ED_CN.Visible  := true;
    BT_Sel.visible := true;
    var_empno      := ED_CN.Text;
  end;

  // 피평가자를 조회한다. (팀장조회) PKORNAME, PDEPTCODE, RVALCONYN
  //최종완료 여부를 체크 한후 버튼 설정을 한다.
  SqlText := 'select nvl(a.RVALCONYN,''N'')||'';''||a.PEMPNO||'';''||                             '+
             '       a.PKORNAME||'';''||b.deptname||'';''||c.codename||'';''||                    '+
             '       d.codename||'';''||a.paycl   ||'';''||a.ELVIEW                               '+
             'from pesremas a, pycdept b, pyccode c, pyccode d, pehremas e                        '+
             'where a.rabasdate = '''+sRabasdate+'''                                              '+
             'and e.rabasdate   = '''+sRabasdate+'''                                              '+
             'and a.empno       = '''+var_empno+'''                                               '+
             'and a.orgnum      = b.orgnum                                                        '+
             'and a.pdeptcode   = b.deptcode                                                      '+
             'and a.pempno = e.empno                                                              '+
             'and (e.payra in (''2C'',''34'',''58'',''73'') or                                    '+
             '     e.payra in (''A81'',''A84'',''A87'',''B50'',''C11'',''C15'',''C51'',''D11''))  '+
             'and e.paycl = c.codeno (+) and c.codeid(+) = ''I112''                               '+
             'and e.payra = d.codeno (+) and d.codeid(+) = ''I113''                               ';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;

       if RecordCount > 0 then
       begin
            if Csel_gfd(1) = 'N' then
            begin
                 Bt_Confirm.Visible := true;
                 BT_Save1.Visible   := true;
                 BT_Cancel1.Visible := true;
                 E_ELview.ReadOnly  := false;
            end
            else
            begin
                 showmessage('팀장상향평가가 완료되었습니다.'+#13+#13+
                             '조회만 가능합니다.');
                 Bt_Confirm.Visible := false;
                 BT_Save1.Visible   := false;
                 BT_Cancel1.Visible := false;
                 E_ELview.ReadOnly  := true;
            end;

            ED_empno.Text            := Csel_gfd(2);
            L_korname.ValueCaption   := Csel_gfd(3);
            L_Deptname.ValueCaption  := Csel_gfd(4);
            L_Payclname.ValueCaption := Csel_gfd(5);
            L_payraname.ValueCaption := Csel_gfd(6);
            CB_empno.Caption         := Csel_gfd(3);
            Ppaycl                   := Csel_gfd(7);
            E_ELview.Text            := Csel_gfd(8);
            if   E_ELview.Text = '' then
            begin
                 E_ELview.Text := '한글 기준 200자까지 등록 가능합니다. (Max 400Byte)';
                 E_ELview.Font.Color := clGray;
            end;

            Label14.Caption := trim(L_payraname.ValueCaption)+'님입니다.';
       end
       else
       begin
            showmessage('상항평가할 팀장님이 안계시거나'+#13+#13+
                        '팀장상향평가 대상자가 아닙니다.');
            vClose := True;
            Application.Terminate;
            Exit;
       end;
       close;
  end;

  TabSheet1.tabvisible := true;
  TabSheet3.tabvisible := false;
  TabSheet4.tabvisible := true;
  Values_data1;

  Common_data;

  Leadership_data;

  SB_1Click(SB_2);
  PageControl2.ActivePage := TabSheet4;
(*
  If Copy(L_Deptname.ValueCaption,1,2) = 'HR' Then
  Begin
    Panel15.Visible  := True;
    L_First2.Visible := True;
  End Else
  Begin
    Panel15.Visible  := False;
    L_First2.Visible := False;
  End;
*)
End;

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  vClose   := False;

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName:= 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
       TMaxSession.Connect := True;
  except
       Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
end;

procedure TFM_Sub.Btn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Sub.FormActivate(Sender: TObject);
begin
//  Application.ProcessMessages;
end;

function TFM_Sub.Csel_gfd(p_loc: Integer): String;
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
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Sub.FormShow(Sender: TObject);
var SqlText : String;
begin
  //하은영
  //MessageDlg('현재는 평가 시스템 테스트 기간입니다. 공지사항에 안내된 평가시기에 평가하시기 바랍니다.'#13#13+
  //          '지금 입력하시는 자료는 자동 삭제됩니다.',mtInformation,[mbOK],0);
  Application.ProcessMessages;
  FL_Start  := False;
  SB_2.Left := 3;

  with DBSet2 do
  begin
       SQL.Clear;
       SQL.Text := 'SELECT  Value1                  '+#13+
                   '  FROM pehrebas                 '+#13+
                   ' WHERE rabasdate = ''00000000'' '+
                   '   AND gubun     = ''00''       '+#13+
                   '   AND sgubun    = ''0001''     ';
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA'    , ftString, 100);
       Open;

       sRabasdate := FieldByName('SEL_DATA').AsString;
//       sRabasdate := '20121130';
       close;
  end;

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := 'SELECT Value1||'';''||Value2||'';''|| '+#13+
                   '       Value3||'';''||Value4||'';''|| '+#13+
                   '       Value5                         '+#13+
                   '  FROM pehrebas                       '+#13+
                   ' WHERE rabasdate = '''+sRabasdate+''' '+#13+
                   '   AND gubun     = ''11''             '+#13+
                   '   AND sgubun    = ''0005''           ';
       Open;
       workemp1 := Csel_gfd(1);
       workemp2 := Csel_gfd(2);
       workemp3 := Csel_gfd(3);
       workemp4 := Csel_gfd(4);
       workemp5 := Csel_gfd(5);
  end;

  var_empno   := peParam(CmdLine,1);
  var_korname := peParam(CmdLine,2);

  with DBSet2 do
  begin
       SQL.Clear;
       SQL.Text := 'SELECT korname                        '+#13+
                   '  FROM pehremas                       '+#13+
                   ' WHERE rabasdate = '''+sRabasdate+''' '+
                   '   AND empno     = '''+var_empno +''' ';
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA'    , ftString, 100);
       Open;

       var_korname := FieldByName('SEL_DATA').AsString;
       close;
  end;

  L_eempno.Caption := var_korname + '님이 평가하실 피평가자는';
  BT_SelClick(Sender);
end;

function TFM_Sub.IsDataModified01: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount -1 do
    if SG_HiddenData01.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
end;

procedure TFM_Sub.Values_data1;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;

  //SG_ItemImage01의 값을 지운다..
  for i := 0 to SG_ItemImage01.ColCount - 1 do
    for j := 0 to SG_ItemImage01.RowCount -1 do
      SG_ItemImage01.Cells[i, j] := '';

  i := 0; j := 0;

  SqlText := 'SELECT                                               '+
             '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
             '       nvl(        a.imagename   ,'' '') || '';'' || '+
             '       nvl(        a.imageno,     ''0'') || '';'' || '+
             '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
             '       nvl(        a.imagebigo   ,'' '')             '+
             '  FROM petacd a                                      '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
             ' WHERE a.rabasdate = '''+sRabasdate+'''              '+
             '   AND a.evcno     = 1                               '+ // 평가표번호
             '   AND a.ekind     = ''Values''                      '+ // 평가구분
             '   ORDER BY a.itemno, a.imageno                      ';

  //항목을 가져와서 SG_ItemImage01.에 넣고..
  DataModule_Tmax.Csel_SQL :=  SqlText;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
      inc(i);
      SG_ItemImage01.Cells[0, i-1] := DataModule_Tmax.Csel_gfd(2);
      SG_ItemImage01.Cells[1, i-1] := DataModule_Tmax.Csel_gfd(4);
//      SG_ItemImage01.Cells[2, i-1] := DataModule_Tmax.Csel_gfd(5);

      DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  for i := 0 to SG_HiddenData01.ColCount - 1 do
    for j := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount -1 do
      SG_HiddenData01.Cells[i, j] := '';
  SG_HiddenData01.RowCount := SG_HiddenData01.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||      '+
              '       nvl(a.itemname,'' '')||'';''||             '+
              '       nvl(''0'',     ''0'')||'';''||             '+
              '       nvl(a.itemdesc,'' '')||'';''||             '+ //a.imagedesc,
              '       nvl(to_char(b.score),''0'')||'';''||       '+
              '       decode(nvl(b.score,0),100,'''+var_GrdS+''','+
              '                              90,'''+var_GrdA+''','+
              '                              80,'''+var_GrdB+''','+
              '                              70,'''+var_GrdC+''','+
              '                              60,'''+var_GrdD+''','+
              '              '''')                               '+
              '  FROM petac a, petdl b                           '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+sRabasdate+'''           '+
              '   AND a.evcno     = 1                            '+ // 평가표번호
              '   AND a.ekind     = ''Values''                   '+ // 평가구분
              '   AND a.rabasdate = b.rabasdate(+)               '+
              '   AND a.ekind     = b.ekind(+)                   '+
              '   AND b.empno(+)  = '''+var_empno+'''            '+ // 피평가자사번
              '   AND b.pempno(+) = '''+ED_empno.text+'''        '+ // 피평가자사번
              '   AND a.itemno    = b.itemno(+)                  '+
              '   ORDER BY a.itemno                              ';
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
 // memo1.text := SqlText;

  while not TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData01.Cells[dITEMNO_IDX, SG_HiddenData01.RowCount-1] <> '' then
      SG_HiddenData01.RowCount := SG_HiddenData01.RowCount + 1;

    SG_HiddenData01.Cells[dITEMNO_IDX,    SG_HiddenData01.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData01.Cells[dITEMNAME_IDX,  SG_HiddenData01.RowCount-1]  := Csel_gfd(2); // 평가항목명
    SG_HiddenData01.Cells[dIMAGENO_IDX,   SG_HiddenData01.RowCount-1]  := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData01.Cells[dIMAGEDESC_IDX, SG_HiddenData01.RowCount-1]  := Csel_gfd(4); // 평가이미지내용
    SG_HiddenData01.Cells[dSCORE_IDX,     SG_HiddenData01.RowCount-1]  := Csel_gfd(5); // 평가점수
    SG_HiddenData01.Cells[20,             SG_HiddenData01.RowCount-1]  := Csel_gfd(6); // 평점체크
    SG_HiddenData01.Cells[dMODIFIED_IDX,  SG_HiddenData01.RowCount-1]  := 'N'; // 자료 변동 여부
    TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum01;

  for i := 0 to SG_Image01.ColCount - 1 do
    for j := 0 to SG_Image01.RowCount -1 do
      SG_Image01.Cells[i, j] := '';
  SG_Image01.RowCount := SG_Image01.FixedRows+1;

  for i := 0 to SG_Score01.ColCount - 1 do
    for j := 0 to SG_Score01.RowCount -1 do
      SG_Score01.Cells[i, j] := '';
  SG_Score01.RowCount := SG_Score01.FixedRows+1;

  SG_HiddenData01.Tag := -1;

  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
  begin
     if SG_HiddenData01.Tag = -1 then
        SG_HiddenData01.Tag := i;

     if SG_Image01.Cells[SG_Image01.FixedCols, SG_Image01.RowCount-1] <> '' then
     begin
        SG_Image01.RowCount := SG_Image01.RowCount + 1;
        SG_Score01.RowCount := SG_Score01.RowCount + 1;
     end;

     // 이미지내용 넣기..
     SG_Image01.Cells[mITEMDESC_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMNAME_IDX, i];
     SG_Image01.Cells[mITEMNAME_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dIMAGEDESC_IDX, i];
     SG_Image01.Cells[2, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[20, i];

     SG_Score01.Cells[0, SG_Score01.RowCount-1] := '';
     SG_Score01.Cells[1, SG_Score01.RowCount-1] := '';
     SG_Score01.Cells[2, SG_Score01.RowCount-1] := '';
     SG_Score01.Cells[3, SG_Score01.RowCount-1] := '';
     SG_Score01.Cells[4, SG_Score01.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = var_ScrS  then SG_Score01.Cells[0 , SG_Score01.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = var_ScrA  then SG_Score01.Cells[1 , SG_Score01.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = var_ScrB  then SG_Score01.Cells[2,  SG_Score01.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = var_ScrC  then SG_Score01.Cells[3 , SG_Score01.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = var_ScrD  then SG_Score01.Cells[4,  SG_Score01.RowCount-1] := var_GrdD;

  end;
end;

procedure TFM_Sub.Common_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  for i := 0 to SG_HiddenData1.ColCount - 1 do
    for j := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
      SG_HiddenData1.Cells[i, j] := '';
  SG_HiddenData1.RowCount := SG_HiddenData1.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
              '       nvl(a.itemname,'' '')||'';''||'+
              '       nvl('''',''0'')||'';''||'+    //to_char(a.imageno)
              '       nvl(a.itemdesc,'' '')||'';''||'+    //a.imagedesc
              '       nvl(to_char(b.score),''0'')||'';''||'+
              '       decode(nvl(b.score,0),100,'''+var_GrdS+''','+
              '                              90,'''+var_GrdA+''','+
              '                              80,'''+var_GrdB+''','+
              '                              70,'''+var_GrdC+''','+
              '                              60,'''+var_GrdD+''','+
              '              '''')                               '+
              '  FROM petac a, petdl b'+//, petacd C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목 //petacd a, pehdl b, petac C'
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
              '   AND a.evcno     = 1' + // 평가표번호
              '   AND a.ekind     = ''공통역량'' ' + // 평가구분
            //  '   AND a.rabasdate = c.rabasdate' +
            //  '   AND a.evcno     = c.evcno' + // 평가표번호
            //  '   AND a.paycl     = c.paycl' +
            //  '   AND a.ekind     = c.ekind' +
            //  '   AND a.itemno    = c.itemno' +
              '   AND a.rabasdate = b.rabasdate(+)' +
              '   AND a.ekind     = b.ekind(+)' +
              '   AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
              '   AND b.pempno(+)  = '''+ED_empno.text+'''' + // 피평가자사번
              '   AND a.itemno    = b.itemno(+)' +
            //  '   AND a.imageno   = b.imageno(+)' +
              '   ORDER BY a.itemno';//, a.imageno';
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
 // memo1.text := SqlText;

  while not TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData1.Cells[dITEMNO_IDX, SG_HiddenData1.RowCount-1] <> '' then
      SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;

    SG_HiddenData1.Cells[dITEMNO_IDX,    SG_HiddenData1.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData1.Cells[dITEMNAME_IDX,  SG_HiddenData1.RowCount-1]  := Csel_gfd(2); // 평가항목명
    SG_HiddenData1.Cells[dIMAGENO_IDX,   SG_HiddenData1.RowCount-1]  := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData1.Cells[dIMAGEDESC_IDX, SG_HiddenData1.RowCount-1]  := Csel_gfd(4); // 평가이미지내용
    SG_HiddenData1.Cells[dSCORE_IDX,     SG_HiddenData1.RowCount-1]  := Csel_gfd(5); // 평가점수
    SG_HiddenData1.Cells[20,             SG_HiddenData1.RowCount-1]  := Csel_gfd(6); // 평점체크
    SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.RowCount-1] := 'N'; // 자료 변동 여부
    TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum1;

  for i := 0 to SG_Image1.ColCount - 1 do
    for j := 0 to SG_Image1.RowCount -1 do
      SG_Image1.Cells[i, j] := '';
  SG_Image1.RowCount := SG_Image1.FixedRows+1;

  if      SG_Image1.RowCount = 6 then
          SG_Image1.DefaultRowHeight := 63
  else if SG_Image1.RowCount = 4 then
          SG_Image1.DefaultRowHeight := 95;

  for i := 0 to SG_Score1.ColCount - 1 do
    for j := 0 to SG_Score1.RowCount -1 do
      SG_Score1.Cells[i, j] := '';
  SG_Score1.RowCount := SG_Score1.FixedRows+1;

  SG_HiddenData1.Tag := -1;

  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
     if SG_HiddenData1.Tag = -1 then
        SG_HiddenData1.Tag := i;

     if SG_Image1.Cells[SG_Image1.FixedCols, SG_Image1.RowCount-1] <> '' then
     begin
        SG_Image1.RowCount := SG_Image1.RowCount + 1;
        SG_Score1.RowCount := SG_Score1.RowCount + 1;
     end;

     SG_Image1.Cells[mITEMNAME_IDX, SG_Image1.RowCount-1] := IntToStr(i + 1) + '. ' +SG_HiddenData1.Cells[dITEMNAME_IDX, i];
     SG_Image1.Cells[mITEMDESC_IDX, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[dIMAGEDESC_IDX, i];
     SG_Image1.Cells[2, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[20, i];

     SG_Score1.Cells[0, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[1, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[2, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[3, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[4, SG_Score1.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = var_ScrS  then SG_Score1.Cells[0 , SG_Score1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = var_ScrA  then SG_Score1.Cells[1 , SG_Score1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = var_ScrB  then SG_Score1.Cells[2,  SG_Score1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = var_ScrC  then SG_Score1.Cells[3 , SG_Score1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = var_ScrD  then SG_Score1.Cells[4,  SG_Score1.RowCount-1] := var_GrdD;

  end;
end;

procedure TFM_Sub.Leadership_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  for i := 0 to SG_HiddenData2.ColCount - 1 do
    for j := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount -1 do
      SG_HiddenData2.Cells[i, j] := '';
  SG_HiddenData2.RowCount := SG_HiddenData2.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
              '       nvl(a.itemname,'' '')||'';''||'+
              '       nvl('''',''0'')||'';''||'+    //to_char(a.imageno)
              '       nvl(a.itemdesc,'' '')||'';''||'+    //a.imagedesc
              '       nvl(to_char(b.score),''0'')||'';''||'+
              '       decode(nvl(b.score,0),100,'''+var_GrdS+''','+
              '                              90,'''+var_GrdA+''','+
              '                              80,'''+var_GrdB+''','+
              '                              70,'''+var_GrdC+''','+
              '                              60,'''+var_GrdD+''','+
              '              '''')                               '+
              '  FROM petac a, petdl b'+//, petacd C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목 //petacd a, pehdl b, petac C'
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
              '   AND a.evcno     = 1' + // 평가표번호
            //  '   AND a.paycl     = ''' + Ppaycl + ''' ' +// BAND
              '   AND a.ekind     = ''리더십역량'' ' + // 평가구분
            //  '   AND a.rabasdate = c.rabasdate' +
            //  '   AND a.evcno     = c.evcno' + // 평가표번호
            //  '   AND a.paycl     = c.paycl' +
            //  '   AND a.ekind     = c.ekind' +
            //  '   AND a.itemno    = c.itemno' +
              '   AND a.rabasdate = b.rabasdate(+)' +
              '   AND a.ekind     = b.ekind(+)' +
              '   AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
              '   AND b.pempno(+)  = '''+ED_empno.text+'''' + // 피평가자사번
              '   AND a.itemno    = b.itemno(+)' +
            //  '   AND a.imageno   = b.imageno(+)' +
              '   ORDER BY a.itemno';//, a.imageno';
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
 // memo1.text := SqlText;

  while not TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData2.Cells[dITEMNO_IDX, SG_HiddenData2.RowCount-1] <> '' then
      SG_HiddenData2.RowCount := SG_HiddenData2.RowCount + 1;

    SG_HiddenData2.Cells[dITEMNO_IDX,    SG_HiddenData2.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData2.Cells[dITEMNAME_IDX,  SG_HiddenData2.RowCount-1]  := Csel_gfd(2); // 평가항목명
    SG_HiddenData2.Cells[dIMAGENO_IDX,   SG_HiddenData2.RowCount-1]  := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData2.Cells[dIMAGEDESC_IDX, SG_HiddenData2.RowCount-1]  := Csel_gfd(4); // 평가이미지내용
    SG_HiddenData2.Cells[dSCORE_IDX,     SG_HiddenData2.RowCount-1]  := Csel_gfd(5); // 평가점수
    SG_HiddenData2.Cells[20,             SG_HiddenData2.RowCount-1]  := Csel_gfd(6); // 평점체크
    SG_HiddenData2.Cells[dMODIFIED_IDX,  SG_HiddenData2.RowCount-1]  := 'N'; // 자료 변동 여부
    TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum2;

  for i := 0 to SG_Image2.ColCount - 1 do
    for j := 0 to SG_Image2.RowCount -1 do
      SG_Image2.Cells[i, j] := '';
  SG_Image2.RowCount := SG_Image2.FixedRows+1;

  for i := 0 to SG_Score2.ColCount - 1 do
    for j := 0 to SG_Score2.RowCount -1 do
      SG_Score2.Cells[i, j] := '';
  SG_Score2.RowCount := SG_Score2.FixedRows+1;

  SG_HiddenData2.Tag := -1;

  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
  begin
     if SG_HiddenData2.Tag = -1 then
        SG_HiddenData2.Tag := i;

     if SG_Image2.Cells[SG_Image2.FixedCols, SG_Image2.RowCount-1] <> '' then
     begin
        SG_Image2.RowCount := SG_Image2.RowCount + 1;
        SG_Score2.RowCount := SG_Score2.RowCount + 1;
     end;

     SG_Image2.Cells[mITEMNAME_IDX, SG_Image2.RowCount-1] := IntToStr(i + 1) + '. ' +SG_HiddenData2.Cells[dITEMNAME_IDX, i];
     SG_Image2.Cells[mITEMDESC_IDX, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[dIMAGEDESC_IDX, i];
     SG_Image2.Cells[2, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[20, i];

     SG_Score2.Cells[0, SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[1, SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[2, SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[3, SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[4, SG_Score2.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = var_ScrS  then SG_Score2.Cells[0 , SG_Score2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = var_ScrA  then SG_Score2.Cells[1 , SG_Score2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = var_ScrB  then SG_Score2.Cells[2,  SG_Score2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = var_ScrC  then SG_Score2.Cells[3 , SG_Score2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = var_ScrD  then SG_Score2.Cells[4,  SG_Score2.RowCount-1] := var_GrdD;

  end;
end;


procedure TFM_Sub.SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image1.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image1.Canvas.Font.Color  := clBlack;
    SG_Image1.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image1.Cells[ACol, ARow];
  SG_Image1.Canvas.FillRect(Rect);


  if ACol = 0 then
  begin
      SG_Image1.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image1.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_Image1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop := (((Rect.Bottom - Rect.Top)
               - SG_Image1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image1.Canvas.Font.Style := [fsBold];
    SG_Image1.Canvas.Font.Size  := 10;
    SG_Image1.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image1.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;
{
  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image1.Row < SG_Image1.TopRow then // 현재 row 가 화면위에 있다
    SG_Image1.Row := SG_Image1.TopRow
  else if SG_Image1.Row > (SG_Image1.TopRow + SG_Image1.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image1.Row := SG_Image1.TopRow + SG_Image1.VisibleRowCount-1;
}
  SG_Score1.TopRow := SG_Image1.TopRow;
  SG_Score1.Row    := SG_Image1.Row;

{  // 버튼의 top 위치를 계산
  P_ControlButton1.Top := (SG_Image1.Row - SG_Image1.TopRow) *
                         (SG_Image1.DefaultRowHeight + SG_Image1.GridLineWidth) + 2;
}
  // 점수를 버튼에 반영
  SB_S1.Down   := False;
  SB_A1.Down   := False;
  SB_B1.Down   := False;
  SB_C1.Down   := False;
  SB_D1.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrS  then  SB_S1.Down  := True
  else if trim(SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrA  then  SB_A1.Down  := True
  else if trim(SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrB  then  SB_B1.Down  := True
  else if trim(SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrC  then  SB_C1.Down  := True
  else if trim(SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrD  then  SB_D1.Down  := True;

   P_ControlButton1.Visible := True;

   SG_Image1Click(Sender);
end;


procedure TFM_Sub.SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
  SG_Score1.Canvas.Brush.Color := SG_Image1.Color; ///$00F0FFFF;
  for i := 0 to SG_Score1.ColCount -1 do
    if SG_Score1.Cells[i, ARow] <> '' then
    begin
      SG_Score1.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;

  if CB_ShowClass1.Checked then // 등급을 보이게...
    SG_Score1.Canvas.Font.Color := SG_Image1.Font.Color
  else
    SG_Score1.Canvas.Font.Color := SG_Score1.Font.Color;

  SG_Score1.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score1.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score1.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Sub.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TFM_Sub.SB_S1Click(Sender: TObject);
var
  lsScore : String;
begin
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.RowCount-1] := 'Y'; // 자료 변동 여부
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := lsScore;
    SG_Score1.Cells[0, SG_Image1.Row]:= '';
    SG_Score1.Cells[1, SG_Image1.Row]:= '';
    SG_Score1.Cells[2, SG_Image1.Row]:= '';
    SG_Score1.Cells[3, SG_Image1.Row]:= '';
    SG_Score1.Cells[4, SG_Image1.Row]:= '';


         if SB_S1.Down  then SG_Score1.Cells[0, SG_Image1.Row]:= var_GrdS
    else if SB_A1.Down  then SG_Score1.Cells[1, SG_Image1.Row]:= var_GrdA
    else if SB_B1.Down  then SG_Score1.Cells[2, SG_Image1.Row]:= var_GrdB
    else if SB_C1.Down  then SG_Score1.Cells[3, SG_Image1.Row]:= var_GrdC
    else if SB_D1.Down  then SG_Score1.Cells[4, SG_Image1.Row]:= var_GrdD ;

  end else
  begin
    SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := '';
    SG_Score1.Cells[0 , SG_Image1.Row] := '';
    SG_Score1.Cells[1 , SG_Image1.Row] := '';
    SG_Score1.Cells[2 , SG_Image1.Row] := '';
    SG_Score1.Cells[3 , SG_Image1.Row] := '';
    SG_Score1.Cells[4 , SG_Image1.Row] := '';
  end;
  ShowSum1;

end;

procedure TFM_Sub.ShowSum01;
var
  i, j, k, l: Integer;
begin
  i := 0; j := 0; k := 0; l := 0;

  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
  begin
    if SG_HiddenData01.Cells[dSCORE_IDX, i] <> '0' then
    begin
      inc(j);
      k := k + StrToInt(SG_HiddenData01.Cells[dSCORE_IDX, i]);
    end
    else
      inc(l);
  end;

  L_Total01.Caption := IntToStr(SG_HiddenData01.RowCount - SG_HiddenData01.FixedRows);
  L_Yes01.Caption   := IntToStr(j);

  if StrToInt(L_Yes01.Caption) > 0 then
    L_First01.caption := Format('%3.2f',[k /StrToInt( L_Total01.caption )])
  else
    L_First01.caption := '0.00';
end;

procedure TFM_Sub.ShowSum1;
var
  i, j, k, l: Integer;
begin
  i := 0; j := 0; k := 0; l := 0;

  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
    if SG_HiddenData1.Cells[dSCORE_IDX, i] <> '0' then
    begin
      inc(j);
      k := k + StrToInt(SG_HiddenData1.Cells[dSCORE_IDX, i]);
    end
    else
      inc(l);
  end;

  L_Total1.Caption := IntToStr(SG_HiddenData1.RowCount - SG_HiddenData1.FixedRows);
  L_Yes1.Caption   := IntToStr(j);

  if StrToInt(L_Yes1.Caption) > 0 then
    L_First1.caption := Format('%3.2f',[k /StrToInt( L_Total1.caption )])
  else
    L_First1.caption := '0.00';
end;

procedure TFM_Sub.ShowSum2;
var
  i, j, k, l: Integer;
begin
  i := 0; j := 0; k := 0; l := 0;

  for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
  begin
    if SG_HiddenData2.Cells[dSCORE_IDX, i] <> '0' then
    begin
      inc(j);
      k := k + StrToIntdef(SG_HiddenData2.Cells[dSCORE_IDX, i], 0);
    end
    else
      inc(l);
  end;

  L_Total2.Caption := IntToStr(SG_HiddenData2.RowCount - SG_HiddenData2.FixedRows);
  L_Yes2.Caption   := IntToStr(j);

  if StrToInt(L_Yes2.Caption) > 0 then
    L_First2.caption := Format('%3.2f',[k /StrToInt( L_Total2.caption )])
  else
    L_First2.caption := '0.00';
end;


procedure TFM_Sub.SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
  SG_Score2.Canvas.Brush.Color := SG_Image2.Color; ///$00F0FFFF;
  for i := 0 to SG_Score2.ColCount -1 do
    if SG_Score2.Cells[i, ARow] <> '' then
    begin
      SG_Score2.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;

  if CB_ShowClass2.Checked then // 등급을 보이게...
    SG_Score2.Canvas.Font.Color := SG_Image2.Font.Color
  else
    SG_Score2.Canvas.Font.Color := SG_Score2.Font.Color;

  SG_Score2.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score2.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score2.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;


procedure TFM_Sub.SG_Score2Enter(Sender: TObject);
begin
     SG_Image2.SetFocus;
end;

procedure TFM_Sub.SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if vClose = True then Exit;
  
  if gdSelected in State then
  begin
    SG_Image2.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image2.Canvas.Font.Color  := clBlack;
    SG_Image2.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image2.Cells[ACol, ARow];
  SG_Image2.Canvas.FillRect(Rect);


  if ACol = 0 then
  begin
      SG_Image2.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image2.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_Image2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop := (((Rect.Bottom - Rect.Top)
               - SG_Image2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image2.Canvas.Font.Style := [fsBold];
    SG_Image2.Canvas.Font.Size  := 10;
    SG_Image2.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image2.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;
{
  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image2.Row < SG_Image2.TopRow then // 현재 row 가 화면위에 있다
    SG_Image2.Row := SG_Image2.TopRow
  else if SG_Image1.Row > (SG_Image2.TopRow + SG_Image2.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image2.Row := SG_Image2.TopRow + SG_Image2.VisibleRowCount-1;
}
  SG_Score2.TopRow := SG_Image2.TopRow;
  SG_Score2.Row    := SG_Image2.Row;

{  // 버튼의 top 위치를 계산
  P_ControlButton2.Top := (SG_Image2.Row - SG_Image2.TopRow) *
                         (SG_Image2.DefaultRowHeight + SG_Image2.GridLineWidth) + 2;
}
  // 점수를 버튼에 반영
  SB_S2.Down   := False;
  SB_A2.Down   := False;
  SB_B2.Down   := False;
  SB_C2.Down   := False;
  SB_D2.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrS  then  SB_S2.Down  := True
  else if trim(SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrA  then  SB_A2.Down  := True
  else if trim(SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrB  then  SB_B2.Down  := True
  else if trim(SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrC  then  SB_C2.Down  := True
  else if trim(SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrD  then  SB_D2.Down  := True;

   P_ControlButton2.Visible := True;

   SG_Image2Click(Sender);
end;


procedure TFM_Sub.SB_S2Click(Sender: TObject);
var
  lsScore : String;
begin
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  SG_HiddenData2.Cells[dMODIFIED_IDX, SG_HiddenData2.RowCount-1] := 'Y'; // 자료 변동 여부
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := lsScore;
    SG_Score2.Cells[0, SG_Image2.Row]:= '';
    SG_Score2.Cells[1, SG_Image2.Row]:= '';
    SG_Score2.Cells[2, SG_Image2.Row]:= '';
    SG_Score2.Cells[3, SG_Image2.Row]:= '';
    SG_Score2.Cells[4, SG_Image2.Row]:= '';


         if SB_S2.Down  then SG_Score2.Cells[0, SG_Image2.Row]:= var_GrdS
    else if SB_A2.Down  then SG_Score2.Cells[1, SG_Image2.Row]:= var_GrdA
    else if SB_B2.Down  then SG_Score2.Cells[2, SG_Image2.Row]:= var_GrdB
    else if SB_C2.Down  then SG_Score2.Cells[3, SG_Image2.Row]:= var_GrdC
    else if SB_D2.Down  then SG_Score2.Cells[4, SG_Image2.Row]:= var_GrdD ;

  end else
  begin
    SG_HiddenData2.Cells[dSCORE_IDX, SG_HiddenData2.Tag+SG_Image2.Row] := '';
    SG_Score2.Cells[0 , SG_Image2.Row] := '';
    SG_Score2.Cells[1 , SG_Image2.Row] := '';
    SG_Score2.Cells[2 , SG_Image2.Row] := '';
    SG_Score2.Cells[3 , SG_Image2.Row] := '';
    SG_Score2.Cells[4 , SG_Image2.Row] := '';
  end;

  ShowSum2;
end;

procedure TFM_Sub.BT_Save1Click(Sender: TObject);
var
  i, j: Integer;
  SqlText: String;
begin
   if SB_1.BtnDown And (PageControl1.ActivePage = TabSheet1) then
   begin
      //Values1 평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData01.RowCount -1 do
      begin
         if (trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = '0') or ((trim(SG_HiddenData01.Cells[dSCORE_IDX, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      //팀장 Values1 상향평가점수를 몽땅 delete처리 시킨다.
      SqlText := 'Delete from petdl                        '+
                 ' where rabasdate = '''+srabasdate+'''    '+
                 '   and empno     = '''+var_empno+'''     '+ // 평가자
                 '   and ekind     = ''Values''            '+
                 '   and itemno    = 1                     '+
                 '   and pempno    = '''+ED_empno.text+''' ';

      DataModule_Tmax.Cupd_SQL := SqlText;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Exit;
      end;

      //팀장 Values1 평가를 저장처리 한다.
      for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
      begin

         SqlText := 'INSERT INTO petdl ' + // 능력태도상향평가
                         ' (RABASDATE, EMPNO, PEMPNO, EKIND, ITEMNO, IMAGENO, SCORE) ' +
                     'VALUES ('''+srabasdate+''','+
                            ' '''+var_empno+''','+
                            ' '''+ED_empno.text+''','+
                            ' ''Values'',' +
                            ' '+SG_HiddenData01.Cells[dITEMNO_IDX,  i]+','+
                            ' '+SG_HiddenData01.Cells[dIMAGENO_IDX, i]+','+
                            ' '+SG_HiddenData01.Cells[dSCORE_IDX,   i]+') ';

         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
               SG_HiddenData01.Cells[dMODIFIED_IDX, i] := 'N';
      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Values_data1;
   end
   else
   if SB_2.BtnDown And (PageControl2.ActivePage = TabSheet3) then
   begin
      //공통역량평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData1.RowCount -1 do
      begin
         if (trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = '0') or ((trim(SG_HiddenData1.Cells[dSCORE_IDX, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      //팀장공통역량상향평가점수를 몽땅 delete처리 시킨다.
      SqlText := 'Delete from petdl '+
                 'where rabasdate = '''+srabasdate+'''' +
                  ' and empno = '''+var_empno+'''' + // 평가자
                  ' and ekind = ''공통역량'''+
                  ' and pempno = '''+ED_empno.text+'''';

      DataModule_Tmax.Cupd_SQL := SqlText;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Exit;
      end;

      //팀장공통역량평가를 저장처리 한다.
      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
      begin

         SqlText := 'INSERT INTO petdl ' + // 능력태도상향평가
                         ' (RABASDATE, EMPNO, PEMPNO, EKIND, ITEMNO, IMAGENO, SCORE) ' +
                     'VALUES ('''+srabasdate+''','+
                            ' '''+var_empno+''','+
                            ' '''+ED_empno.text+''','+
                            ' ''공통역량'',' +
                            ' '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+','+
                            ' '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+','+
                            ' '+SG_HiddenData1.Cells[dSCORE_IDX,   i]+') ';

         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
          SG_HiddenData1.Cells[dMODIFIED_IDX, i] := 'N';
      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Common_data;

   end
   else  if SB_2.BtnDown And (PageControl2.ActivePage = TabSheet4) then
   begin
      //공통역량평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData2.RowCount -1 do
      begin
         if (trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = '0') or ((trim(SG_HiddenData2.Cells[dSCORE_IDX, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      //팀장공통역량상향평가점수를 몽땅 delete처리 시킨다.
      SqlText := 'Delete from petdl '+
                 'where rabasdate = '''+srabasdate+'''' +
                  ' and empno = '''+var_empno+'''' + // 평가자
                  ' and ekind = ''리더십역량'''+
                  ' and pempno = '''+ED_empno.text+'''';

      DataModule_Tmax.Cupd_SQL := SqlText;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Exit;
      end;

      //팀장공통역량평가를 저장처리 한다.
      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
      begin

         SqlText := 'INSERT INTO petdl ' + // 능력태도상향평가
                         ' (RABASDATE, EMPNO, PEMPNO, EKIND, ITEMNO, IMAGENO, SCORE) ' +
                     'VALUES ('''+srabasdate+''','+
                            ' '''+var_empno+''','+
                            ' '''+ED_empno.text+''','+
                            ' ''리더십역량'',' +
                            ' '+SG_HiddenData2.Cells[dITEMNO_IDX,  i]+','+
                            ' '+SG_HiddenData2.Cells[dIMAGENO_IDX, i]+','+
                            ' '+SG_HiddenData2.Cells[dSCORE_IDX,   i]+') ';

         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;


      if   Length(E_ELview.Text) > 400 then
      begin
        ShowMessage('한글 기준 200자까지 등록 가능합니다. (Max 400Byte). 확인 바랍니다.');
        Exit;
      end;

//      if (Pos('(Max 400Byte)',E_ELview.Text)  > 0) then E_ELview.Text  := '';

      SQLText := 'UPDATE pesremas                                             '+
                 '   SET ELview      = '''+ E_ELview.Text               +''', '+
                 '       WRITEEMP    = '''+ var_empno                   +''', '+
                 '       WRITETIME   = To_char(sysdate, ''YYYYMMDDHH24MISS'') '+
                 ' WHERE rabasdate   = '''+ sRabasDate                  +'''  '+
                 '   AND empno       = '''+ var_empno                   +'''  ';
      DataModule_Tmax.Cupd_SQL := SqlText;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
           Exit;
      end;

      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
          SG_HiddenData2.Cells[dMODIFIED_IDX, i] := 'N';
      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Leadership_data;
   end;
end;

function TFM_Sub.IsDataModified: Boolean;
var
  i: Integer;
begin
  Result := False;

  if Var_Ekind = '공통역량' then
  begin
       for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
        if SG_HiddenData1.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
        begin
          Result := True;
          Break;
        end;
  end
  else
  if Var_Ekind = '리더십역량' then
  begin
       for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount -1 do
        if SG_HiddenData2.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
        begin
          Result := True;
          Break;
        end;
  end;
end;

procedure TFM_Sub.Bt_ConfirmClick(Sender: TObject);
var
  SqlText : string;
begin
{   //Values 평가가 모두 저장처리 되었는지 확인 후 최종완료처리한다.
   SqlText := 'SELECT count(0) cnt                                           '+
              '  FROM petacd a, petdl b, petac c                             '+
              ' WHERE a.rabasdate = '''+srabasdate+'''                       '+
              '   AND a.evcno     = 1                                        '+
              '   AND a.ekind    in (''Values'')                             '+
              '   AND a.rabasdate = c.rabasdate                              '+
              '   AND a.evcno     = c.evcno                                  '+
              '   AND a.ekind     = c.ekind                                  '+
              '   AND a.itemno    = c.itemno                                 '+
              '   AND a.rabasdate = b.rabasdate(+)                           '+
              '   AND a.ekind     = b.ekind(+)                               '+
              '   AND b.empno(+)  = '''+var_empno+'''                        '+
	      '   AND b.pempno(+) = '''+ED_empno.Text+'''                    '+
	      '   and nvl(b.score,0) = 0                                     '+
              '   AND a.itemno    = b.itemno(+)                              '+
              '   AND a.imageno   = b.imageno(+)                             '+
              '   ORDER BY a.itemno, a.imageno                               ';

   with DataModule_Tmax.TMaxDataSet_HInsa do
   begin
      Close;
      ServiceName := 'PTA1010B_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 2000);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      if RecordCount > 0 then
      begin
         if trim(FieldByName('SEL_DATA').AsString) > '0' then
         begin
            showmessage('팀장 상향평가 저장처리를 할 수 없습니다.'+#13+#13+
                        'Values 평가에 대한 평가자료가 저장처리 되었는지 확인하시기 바랍니다.');
            close;
            SB_1Click(SB_1);
            exit;
         end;
      end
      else
      begin
         showmessage('Values 평가 등록여부 체크중 오류가 발생했습니다.');
         exit;
      end;
   end;
}
   //역량평가가 모두 저장처리 되었는지 확인 후 최종완료처리한다.
   SqlText := 'SELECT count(0) cnt                              '+
              '  FROM petac a, petdl b                          '+ //, petacd C                             '+
              ' WHERE a.rabasdate = '''+srabasdate+'''          '+
              '   AND a.evcno     = 1                           '+
              '   AND a.ekind    in (''리더십역량'')            '+       //''공통역량'',
              //'   AND a.rabasdate = c.rabasdate               '+
              //'   AND a.evcno     = c.evcno                   '+
              //'   AND a.ekind     = c.ekind                   '+
              //'   AND a.itemno    = c.itemno                  '+
              '   AND a.rabasdate = b.rabasdate(+)              '+
              '   AND a.ekind     = b.ekind(+)                  '+
              '   AND b.empno(+)  = '''+var_empno+'''           '+
	      '   AND b.pempno(+) = '''+ED_empno.Text+'''       '+
	      '   and nvl(b.score,0) = 0                        '+
              '   AND a.itemno    = b.itemno(+)                 '+
             // '   AND a.imageno   = b.imageno(+)              '+
              '   ORDER BY a.itemno                             '; //, a.imageno                               ';

   with DataModule_Tmax.TMaxDataSet_HInsa do
   begin
      Close;
      ServiceName := 'PTA1010B_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 2000);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
      if RecordCount > 0 then
      begin
         if trim(FieldByName('SEL_DATA').AsString) > '0' then
         begin
            showmessage('팀장 상향평가 저장처리를 할 수 없습니다.'+#13+#13+
                        '리더십역량평가에 대한 평가자료가 저장처리 되었는지 확인하시기 바랍니다.');
            close;
            SB_1Click(SB_2);
            exit;
         end;
      end
      else
      begin
         showmessage('리더십역량평가 등록여부 체크중 오류가 발생했습니다.');
         exit;
      end;
   end;

   if (Pos('(Max 400Byte)',E_ELview.Text)  > 0) or (trim(E_ELview.Text) = '') then
   begin
        E_ELview.Text  := '';
        showmessage('팀장의 리더십 역량 의견 등록을 하지 않으셨습니다.');
        E_ELview.SetFocus;
        exit;
   end;

   SQLText := 'UPDATE pesremas                                             '+
              '   SET ELview      = '''+ E_ELview.Text               +''', '+
              '       WRITEEMP    = '''+ var_empno                   +''', '+
              '       WRITETIME   = To_char(sysdate, ''YYYYMMDDHH24MISS'') '+
              ' WHERE rabasdate   = '''+ sRabasDate                  +'''  '+
              '   AND empno       = '''+ var_empno                   +'''  ';
   DataModule_Tmax.Cupd_SQL := SqlText;
   DataModule_Tmax.Cupd_Exec;
   if not DataModule_Tmax.Cupd_ret then
   begin
        Exit;
   end;

   if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                              '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+

                              '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
   begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
   end;
   //피평가자 평가완료 여부 'Y'로 update
   SqlText := 'update pesremas '+
                'set RVALCONYN =''Y'''+
                    //' ,EVSCORE = '+ trim(L_First01.Caption) +
                    //' ,ECSCORE = '+ trim(L_First1.Caption) +
                    ' ,ELSCORE = '+ trim(L_First2.Caption) +
                    ' ,WRITEEMP = '''+var_empno+'''' +
                    ' ,WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') '+
              ' WHERE rabasdate = '''+srabasdate+''''+
                ' and empno  = '''+var_empno+''''+
                ' and pempno = '''+ ED_empno.Text +'''';
   DataModule_Tmax.Cupd_SQL := SqlText;
   DataModule_Tmax.Cupd_Exec;
   if not DataModule_Tmax.Cupd_ret then
   begin
      Exit;
   end;

   Bt_Confirm.Visible := false;
   BT_Save1.Visible := false;
   BT_Cancel1.Visible := false;
   MessageDlg('[ 상향평가 최종완료 ] 처리 되었습니다.', mtInformation, [mbOK], 0);

end;

procedure TFM_Sub.CB_ShowClass1Click(Sender: TObject);
begin
     SG_Score1.Refresh;
end;

procedure TFM_Sub.CB_ShowClass2Click(Sender: TObject);
begin
     SG_Score2.Refresh;
end;

procedure TFM_Sub.PageControl2Change(Sender: TObject);
begin

  if (BT_Save1.Visible) and (IsDataModified) then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
               '작업순서오류',MB_ICONWARNING);

    If       var_Ekind = '공통역량'     then
        PageControl2.ActivePage := TabSheet3
    else if  var_Ekind = '리더십역량'   then
        PageControl2.ActivePage := TabSheet4;

    System.Exit;
  end;

  if PageControl2.ActivePage = TabSheet3 then
  begin
     SG_Image1.SetFocus;
     BT_Save1.Caption   := '공통역량 저장';
     BT_Cancel1.Caption := '공통역량 취소';
     Var_ekind := '공통역량';
  end
  else
  if PageControl2.ActivePage = TabSheet4 then
  begin
     SG_Image2.SetFocus;
     BT_Save1.Caption   := '리더십역량 저장';
     BT_Cancel1.Caption := '리더십역량 취소';
     Var_ekind := '리더십역량';
  end;
end;

procedure TFM_Sub.SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image01.Canvas.Brush.Color := $00FFE8D0;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image01.Canvas.Font.Color  := clBlack;
    SG_Image01.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image01.Cells[ACol, ARow];
  SG_Image01.Canvas.FillRect(Rect);


  if ACol = 0 then
  begin
      SG_Image01.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image01.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_CENTER or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_Image01.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop := (((Rect.Bottom - Rect.Top)
               - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image01.Canvas.Font.Style := [fsBold];
    SG_Image01.Canvas.Font.Size  := 10;
    SG_Image01.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top   + 20;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left  + 2;
    Rect.Right := Rect.Right - 2;
    DrawText(SG_Image01.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image01.Row  < SG_Image01.TopRow then // 현재 row 가 화면위에 있다
     SG_Image01.Row := SG_Image01.TopRow
  else if SG_Image01.Row > (SG_Image01.TopRow + SG_Image01.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
     SG_Image01.Row := SG_Image01.TopRow + SG_Image01.VisibleRowCount-1;

  SG_Score01.TopRow := SG_Image01.TopRow;
  SG_Score01.Row    := SG_Image01.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton01.Top := (SG_Image01.Row - SG_Image01.TopRow) *
                         (SG_Image01.DefaultRowHeight + SG_Image01.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S01.Down   := False;
  SB_A01.Down   := False;
  SB_B01.Down   := False;
  SB_C01.Down   := False;
  SB_D01.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row]) = var_ScrS  then  SB_S01.Down  := True
  else if trim(SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row]) = var_ScrA  then  SB_A01.Down  := True
  else if trim(SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row]) = var_ScrB  then  SB_B01.Down  := True
  else if trim(SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row]) = var_ScrC  then  SB_C01.Down  := True
  else if trim(SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row]) = var_ScrD  then  SB_D01.Down  := True;

  P_ControlButton01.Visible := True;
end;

procedure TFM_Sub.SG_Score01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;
 i : Integer;
begin
  SG_Score01.Canvas.Brush.Color := SG_Image01.Color; ///$00F0FFFF;
  for i := 0 to SG_Score01.ColCount -1 do
    if SG_Score01.Cells[i, ARow] <> '' then
    begin
      SG_Score01.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;

  if CB_ShowClass01.Checked then // 등급을 보이게...
    SG_Score01.Canvas.Font.Color := SG_Image01.Font.Color
  else
    SG_Score01.Canvas.Font.Color := SG_Score01.Font.Color;

  SG_Score01.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score01.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score01.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score01.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Sub.SG_Score01Enter(Sender: TObject);
begin
  SG_Image01.SetFocus;
end;

procedure TFM_Sub.SB_S01Click(Sender: TObject);
var
  lsScore : String;
begin
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.RowCount-1] := 'Y'; // 자료 변동 여부
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData01.Cells[dSCORE_IDX,    SG_HiddenData01.Tag+SG_Image01.Row] := lsScore;
    SG_Score01.Cells[0, SG_Image01.Row]:= '';
    SG_Score01.Cells[1, SG_Image01.Row]:= '';
    SG_Score01.Cells[2, SG_Image01.Row]:= '';
    SG_Score01.Cells[3, SG_Image01.Row]:= '';
    SG_Score01.Cells[4, SG_Image01.Row]:= '';


         if SB_S01.Down  then SG_Score01.Cells[0, SG_Image01.Row]:= var_GrdS
    else if SB_A01.Down  then SG_Score01.Cells[1, SG_Image01.Row]:= var_GrdA
    else if SB_B01.Down  then SG_Score01.Cells[2, SG_Image01.Row]:= var_GrdB
    else if SB_C01.Down  then SG_Score01.Cells[3, SG_Image01.Row]:= var_GrdC
    else if SB_D01.Down  then SG_Score01.Cells[4, SG_Image01.Row]:= var_GrdD ;

  end else
  begin
    SG_HiddenData01.Cells[dSCORE_IDX,    SG_HiddenData01.Tag+SG_Image01.Row] := '0';
    SG_Score01.Cells[0 , SG_Image01.Row] := '';
    SG_Score01.Cells[1 , SG_Image01.Row] := '';
    SG_Score01.Cells[2 , SG_Image01.Row] := '';
    SG_Score01.Cells[3 , SG_Image01.Row] := '';
    SG_Score01.Cells[4 , SG_Image01.Row] := '';
  end;

  ShowSum01;
end;

procedure TFM_Sub.BT_Cancel1Click(Sender: TObject);
begin
     if Var_Ekind = 'Values' then
     begin
        Values_data1;
     end
     else
     if Var_Ekind = '공통역량' then
        Common_data
     else
     if Var_Ekind = '리더십역량' then
        Leadership_data;
end;

procedure TFM_Sub.SG_Image1Click(Sender: TObject);
var
  sqltext : string;
  i : integer;
begin
   SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petdl b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+srabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
              //  ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''공통역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData1.Cells[dITEMNO_IDX, SG_Image1.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
              //  ' AND a.paycl     = c.paycl' + // BAND
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND b.pempno(+)  = '''+ED_empno.text+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';

  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
  i:= 1;
  while not TMaxDataSet_HInsa.EOF do
  begin
    TOnMemo(Self.FindComponent('M_image1'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

    i := i + 1;
    TMaxDataSet_HInsa.Next;
  end;
  TMaxDataSet_HInsa.Close;
end;

procedure TFM_Sub.SG_Image2Click(Sender: TObject);
var
  sqltext : string;
  i : integer;
begin
   SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petdl b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+srabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
              //  ' AND a.paycl     = ''' +Ppaycl+'''' + // BAND
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
                ' AND a.itemno    = '''+SG_HiddenData2.Cells[dITEMNO_IDX, SG_Image2.Row]+'''' +
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
              //  ' AND a.paycl     = c.paycl' + // BAND
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND b.pempno(+)  = '''+ED_empno.text+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
              ' ORDER BY a.itemno, a.imageno';

  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;
  i:= 1;
  while not TMaxDataSet_HInsa.EOF do
  begin
    TOnMemo(Self.FindComponent('M_image2'+inttostr(i))).Text  := Csel_gfd(4); // 평가이미지내용

    i := i + 1;
    TMaxDataSet_HInsa.Next;
  end;
  TMaxDataSet_HInsa.Close;
end;

procedure TFM_Sub.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

       if TOnSkinButton(Sender).Tag = 1 then
          PageControl1Change(Sender)
  else if TOnSkinButton(Sender).Tag = 2 then
          PageControl2Change(Sender);
  BT_Cancel1Click(Sender);
end;

procedure TFM_Sub.PageControl1Change(Sender: TObject);
begin
  if var_Ekind <> '' then
  begin
    if (BT_Save1.Visible) and (IsDataModified01) then
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
                 '작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;
  end;

  var_Ekind := 'Values';
  if PageControl1.ActivePage = TabSheet1 then
  begin
     SG_Image01.SetFocus;
     BT_Save1.Caption   := 'Values 평가 저장';
     BT_Cancel1.Caption := 'Values 평가 취소';
  end;
  BT_Cancel1Click(Sender);
end;

procedure TFM_Sub.SG_Image01Exit(Sender: TObject);
begin
   P_ControlButton01.Visible := False;
end;

procedure TFM_Sub.SG_Image01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image01.Row = 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    Values_data1;
    SG_Image01.Row := SG_Image01.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image01.Row = SG_Image01.RowCount-1)  then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    Values_data1;
    SG_Image01.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFM_Sub.SG_ItemImage01DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_ItemImage01.Canvas.Brush.Color := clWhite;//$00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_ItemImage01.Canvas.Font.Color  := clBlack;
    SG_ItemImage01.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_ItemImage01.Cells[ACol, ARow];
  SG_ItemImage01.Canvas.FillRect(Rect);


  if ACol = 0 then
  begin
    SG_ItemImage01.Canvas.FillRect(Rect);

    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_ItemImage01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_ItemImage01.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (ACol = 2) or(ACol = 3)or (ACol = 4) or (ACol = 5) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_ItemImage01.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop := (((Rect.Bottom - Rect.Top)
               - SG_ItemImage01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_ItemImage01.Canvas.Font.Style := [fsBold];
    SG_ItemImage01.Canvas.Font.Size  := 10;
    SG_ItemImage01.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top   + 20;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left  + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_ItemImage01.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;
end;

procedure TFM_Sub.E_ELviewClick(Sender: TObject);
begin
  if (Pos('(Max 400Byte)',E_ELview.Text)  > 0) then
  begin
       E_ELview.Text  := '';
       E_ELview.Font.Color := clBlack;
  end;
end;

procedure TFM_Sub.E_ELviewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    ELview : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        ELview := copy(E_ELview.text, 1, Length(E_ELview.text)-1);
        E_ELview.Clear;
        E_ELview.Lines.Append(ELview);
   end;
end;

procedure TFM_Sub.BT_ExitClick(Sender: TObject);
begin
   close;
end;

procedure TFM_Sub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.




