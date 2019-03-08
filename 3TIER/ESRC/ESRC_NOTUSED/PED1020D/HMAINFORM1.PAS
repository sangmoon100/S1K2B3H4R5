unit HMainForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,
  Db, Tmax_DataSetText, OnDBGrid, peoutlookbtn, OnEditMemo,NotesHana_TLB;

type
  TFM_Main1 = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ONE_App      : TOnOnceInstance;
    ED_empno: TTMaxPersonPopupEdit;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    L_jobgun: TOnShapeLabel;
    L_jobkind: TOnShapeLabel;
    L_empdate: TOnMaskEdit;
    L_paycldate: TOnMaskEdit;
    DBSet1: TTMaxDataSet;
    DataSource1: TDataSource;
    DBSet_dml: TTMaxDataSet;
    BT_Exit: TOnFocusButton;
    TDS1: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    Notebook1: TNotebook;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CB_ShowClass2: TCheckBox;
    Label18: TLabel;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total1: TLabel;
    L_Yes1: TLabel;
    L_duname: TLabel;
    Label20: TLabel;
    LT_Self: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    SG_Image1: TStringGrid;
    SG_HiddenData1: TStringGrid;
    Panel7: TPanel;
    SG_Score1: TStringGrid;
    P_ControlButton1: TPanel;
    SB_S1: TSpeedButton;
    SB_A1: TSpeedButton;
    SB_B1: TSpeedButton;
    SB_C1: TSpeedButton;
    SB_D1: TSpeedButton;
    L_eempno: TLabel;
    CB_empno: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    L_Total2: TLabel;
    L_Yes2: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    Panel3: TPanel;
    Label13: TLabel;
    Label19: TLabel;
    SG_Image2: TStringGrid;
    SG_HiddenData2: TStringGrid;
    Panel4: TPanel;
    SG_Score2: TStringGrid;
    P_ControlButton2: TPanel;
    SB_S2: TSpeedButton;
    SB_A2: TSpeedButton;
    SB_B2: TSpeedButton;
    SB_C2: TSpeedButton;
    SB_D2: TSpeedButton;
    Bt_Confirm: TOnFocusButton;
    BT_Save1: TOnFocusButton;
    Bt_Add: TOnFocusButton;
    Bt_OConfirm: TOnFocusButton;
    Label3: TLabel;
    Memo_E1: TOnMemo;
    OnFocusButton1: TOnFocusButton;
    BT_VIEWClose: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    L_Title: TPanel;
    L_Self1: TPanel;
    L_First21: TPanel;
    Label99: TLabel;
    Panel5: TPanel;
    L_Self2: TPanel;
    L_First22: TPanel;
    Label1: TLabel;
    CB_ShowClass1: TCheckBox;
    Panel6: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    L_First11: TPanel;
    Panel8: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    L_First12: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SB_S1Click(Sender: TObject);
    procedure BT_Save1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Bt_OConfirmClick(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure BT_VIEWCloseClick(Sender: TObject);
    procedure SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1Enter(Sender: TObject);
    procedure CB_ShowClass1Click(Sender: TObject);
    procedure SB_S2Click(Sender: TObject);
    procedure SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PageControl1Enter(Sender: TObject);
    procedure SG_Score2Enter(Sender: TObject);
    procedure CB_ShowClass2Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    FL_E1opinionyn : Boolean;
    procedure Common_data;
    procedure Leadership_data;
    procedure ShowSum1;
    procedure ShowSum2;
    function Csel_gfd(p_loc: Integer): String;

  public
    { Public declarations }
    var_Ekind: String;   // 역량종류
    Pjobkind : String;
    Inter    : ILotusNotes_Hana;
    Pempno, Pkorname, Password, Ppermission: string;
    var_empno   : String; //피평가자 사번
    var_korname : String; //피평가자 성명
  end;

var
  FM_Main1: TFM_Main1;
  DetailCnt : Integer;
  Csel_SQL : String;
  E1ValconYN,E2ValconYN : String;
  Le1korname,Le1empno : String;

const
  SScore = '100';
  AScore = '90';
  BScore = '80';
  CScore = '70';
  DScore = '60';
  
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
implementation

uses HSubForm,Hinsa_TmaxDM, UOpinon;

{$R *.DFM}

procedure TFM_Main1.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Main1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := True;
   FM_Sub.BT_SelClick(nil);
end;

procedure TFM_Main1.FormShow(Sender: TObject);
var SqlText :string;
begin
  L_eempno.Caption := GSkorname+' 님이 평가하실 피평가자는';
  CB_empno.Caption := var_korname;

  FL_E1opinionyn := false;

  //최종완료 여부를 체크 한후 버튼 설정을 한다.
  SqlText := 'select nvl(e2valconyn,''N'')||'';''||nvl(e2valobjyn,''N'') '+
               'from petremas '+
               'where rabasdate = '''+sRabasdate+'''' +
                 'and empno = '''+var_empno+'''';

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
       if Csel_gfd(1) = 'N' then
       begin
          Bt_Confirm.Enabled := true;
          BT_Save1.Enabled := true;
       end
       else
       begin
          Bt_Confirm.Enabled := false;
          BT_Save1.Enabled := false;
       end;
    end;
    close;
  end;

  Notebook1.PageIndex := 0;
  PageControl1.ActivePage := TabSheet1;
  //공동역량를 조회한다.
  Common_data;
  Leadership_data;
end;

procedure TFM_Main1.Common_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  //만일 1차 평가자 완료처리 된 자료는 저장처리및 변경처리 못하도록 막는다.
  //
  //

  for i := 0 to SG_HiddenData1.ColCount - 1 do
    for j := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
      SG_HiddenData1.Cells[i, j] := '';
  SG_HiddenData1.RowCount := SG_HiddenData1.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petds b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
                ' AND a.ekind     = ''공통역량''' + // 평가구분
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
                ' AND a.imageno   = b.imageno(+)' +
              ' ORDER BY a.itemno, a.imageno';
  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1] <> '' then
      SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;
    SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData1.Cells[1, SG_HiddenData1.RowCount-1]:= Csel_gfd(2); // 평가항목명
    SG_HiddenData1.Cells[2, SG_HiddenData1.RowCount-1] := Csel_gfd(3); // 평가이미지번호
    SG_HiddenData1.Cells[3, SG_HiddenData1.RowCount-1]:= Csel_gfd(4); // 평가이미지내용
    SG_HiddenData1.Cells[6, SG_HiddenData1.RowCount-1] := Csel_gfd(6); // 1차평가점수
    SG_HiddenData1.Cells[7, SG_HiddenData1.RowCount-1] := Csel_gfd(7); // 2차평가점수
    SG_HiddenData1.Cells[20, SG_HiddenData1.RowCount-1] := Csel_gfd(5);  //자기평가점수
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum1;


  for i := 0 to SG_Image1.ColCount - 1 do
    for j := 0 to SG_Image1.RowCount -1 do
      SG_Image1.Cells[i, j] := '';
  SG_Image1.RowCount := SG_Image1.FixedRows+1;

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

     SG_Image1.Cells[1, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[3, i];
     SG_Image1.Cells[0, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[1, i];
     SG_Image1.Cells[2, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[20, i];
     SG_Image1.Cells[3, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[6, i];
     //showmessage(SG_Image1.Cells[2, SG_Image1.RowCount-1]);

     SG_Score1.Cells[0, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[1, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[2, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[3, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[4, SG_Score1.RowCount-1] := '';

     //버튼상태반영
     if trim(SG_HiddenData1.Cells[7, i]) = var_ScrS  then SG_Score1.Cells[0 , SG_Score1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrA  then SG_Score1.Cells[1 , SG_Score1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrB  then SG_Score1.Cells[2,  SG_Score1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrC  then SG_Score1.Cells[3 , SG_Score1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrD  then SG_Score1.Cells[4,  SG_Score1.RowCount-1] := var_GrdD;
  end;
  SG_Image1.SetFocus;
end;

procedure TFM_Main1.Leadership_data;
var
  SqlText: String;
  i, j : Integer;
begin
  Application.ProcessMessages;
  for i := 0 to SG_HiddenData2.ColCount - 1 do
    for j := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount -1 do
      SG_HiddenData2.Cells[i, j] := '';
  SG_HiddenData2.RowCount := SG_HiddenData2.FixedRows+1;

  SqlText :=  'SELECT nvl(to_char(a.itemno),''0'')||'';''||'+
                    ' nvl(c.itemname,'' '')||'';''||'+
                    ' nvl(to_char(a.imageno),''0'')||'';''||'+
                    ' nvl(a.imagedesc,'' '')||'';''||'+
                    ' nvl(to_char(b.score),''0'')||'';''||'+
                    ' nvl(to_char(b.e1score),''0'')||'';''||'+
                    ' nvl(to_char(b.e2score),''0'')||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petds b, petac C' + // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // 평가표번호
                ' AND a.ekind     = ''리더십역량''' + // 평가구분
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // 평가표번호
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // 피평가자사번
                ' AND a.itemno    = b.itemno(+)' +
                ' AND a.imageno   = b.imageno(+)' +
              ' ORDER BY a.itemno, a.imageno';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData2.Cells[0, SG_HiddenData2.RowCount-1] <> '' then
      SG_HiddenData2.RowCount := SG_HiddenData2.RowCount + 1;

    SG_HiddenData2.Cells[0, SG_HiddenData2.RowCount-1]  := Csel_gfd(1); // 평가항목번호
    SG_HiddenData2.Cells[1, SG_HiddenData2.RowCount-1]:=   Csel_gfd(2); // 평가항목명
    SG_HiddenData2.Cells[2, SG_HiddenData2.RowCount-1] :=  Csel_gfd(3); // 평가이미지번호
    SG_HiddenData2.Cells[3, SG_HiddenData2.RowCount-1]:=   Csel_gfd(4); // 평가이미지내용
    SG_HiddenData2.Cells[6, SG_HiddenData2.RowCount-1] :=  Csel_gfd(6); // 1차평가점수
    SG_HiddenData2.Cells[7, SG_HiddenData2.RowCount-1] :=  Csel_gfd(7); // 2차평가점수
    SG_HiddenData2.Cells[20, SG_HiddenData2.RowCount-1] := Csel_gfd(5);  //자기평가점수
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
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

     if SG_Image2.Cells[SG_Image1.FixedCols, SG_Image2.RowCount-1] <> '' then
     begin
        SG_Image2.RowCount := SG_Image2.RowCount + 1;
        SG_Score2.RowCount := SG_Score2.RowCount + 1;
     end;

     SG_Image2.Cells[1, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[3, i];
     SG_Image2.Cells[0, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[1, i];
     SG_Image2.Cells[2, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[20, i];
     SG_Image2.Cells[3, SG_Image2.RowCount-1] := SG_HiddenData2.Cells[6, i];

     SG_Score2.Cells[0 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[1 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[2 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[3 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[4 , SG_Score2.RowCount-1] := '';

     //버튼상태반영
          if trim(SG_HiddenData2.Cells[7, i]) = var_ScrS  then SG_Score2.Cells[0 , SG_Score2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrA  then SG_Score2.Cells[1 , SG_Score2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrB  then SG_Score2.Cells[2,  SG_Score2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrC  then SG_Score2.Cells[3 , SG_Score2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrD  then SG_Score2.Cells[4,  SG_Score2.RowCount-1] := var_GrdD;
  end;

  //SG_Image2.SetFocus;

end;

function TFM_Main1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DataModule_Tmax.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
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

procedure TFM_Main1.BT_ExitClick(Sender: TObject);
begin
   close;
end;

procedure TFM_Main1.SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image1.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
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

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image1.Row < SG_Image1.TopRow then // 현재 row 가 화면위에 있다
    SG_Image1.Row := SG_Image1.TopRow
  else if SG_Image1.Row > (SG_Image1.TopRow + SG_Image1.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image1.Row := SG_Image1.TopRow + SG_Image1.VisibleRowCount-1;

  SG_Score1.TopRow := SG_Image1.TopRow;
  SG_Score1.Row    := SG_Image1.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton1.Top := (SG_Image1.Row - SG_Image1.TopRow) *
                          (SG_Image1.DefaultRowHeight + SG_Image1.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S1.Down   := False;
  SB_A1.Down   := False;
  SB_B1.Down   := False;
  SB_C1.Down   := False;
  SB_D1.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrS  then  SB_S1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrA  then  SB_A1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrB  then  SB_B1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrC  then  SB_C1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrD  then  SB_D1.Down  := True;

   P_ControlButton1.Visible := True;
end;

procedure TFM_Main1.SB_S1Click(Sender: TObject);
var
  lsScore : String;
begin
  if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData1.Cells[7, SG_HiddenData1.Tag+SG_Image1.Row] := lsScore;
    SG_Score1.Cells[0, SG_Image1.Row]:= '';
    SG_Score1.Cells[1, SG_Image1.Row]:= '';
    SG_Score1.Cells[2, SG_Image1.Row]:= '';
    SG_Score1.Cells[3, SG_Image1.Row]:= '';
    SG_Score1.Cells[4, SG_Image1.Row]:= '';

         if SB_S1.Down  then SG_Score1.Cells[0, SG_Image1.Row]:= var_GrdS
    else if SB_A1.Down  then SG_Score1.Cells[1, SG_Image1.Row]:= var_GrdA
    else if SB_B1.Down  then SG_Score1.Cells[2, SG_Image1.Row]:= var_GrdB
    else if SB_C1.Down  then SG_Score1.Cells[3, SG_Image1.Row]:= var_GrdC
    else                     SG_Score1.Cells[4, SG_Image1.Row]:= var_GrdD ;

  end else
  begin
    SG_HiddenData1.Cells[7, SG_HiddenData1.Tag+SG_Image1.Row] := '';
    SG_Score1.Cells[0 , SG_Image1.Row] := '';
    SG_Score1.Cells[1 , SG_Image1.Row] := '';
    SG_Score1.Cells[2 , SG_Image1.Row] := '';
    SG_Score1.Cells[3 , SG_Image1.Row] := '';
    SG_Score1.Cells[4 , SG_Image1.Row] := '';
  end;
  ShowSum1;
end;

procedure TFM_Main1.BT_Save1Click(Sender: TObject);
var
  i, j: Integer;
  SqlText: String;
begin
   if PageControl1.ActivePage = TabSheet1 then
   begin
      //공통역량평가 내역을 저장처리 한다.
      for i := 0 to SG_HiddenData1.RowCount -1 do
      begin
         if (trim(SG_HiddenData1.Cells[7, i]) = '0') or ((trim(SG_HiddenData1.Cells[7, i]) = '')) then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
      begin
         SqlText := 'UPDATE petds ' + // 능력태도자기평가
                      ' SET e2score = '+SG_HiddenData1.Cells[7, i]+' ' +
                    ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // 평가자
                      ' AND ekind = ''공통역량''' +
                      ' AND itemno = '+SG_HiddenData1.Cells[0,  i]+'' +
                      ' AND imageno = '+SG_HiddenData1.Cells[2, i]+'';
         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Common_data;

   end
   else  if PageControl1.ActivePage = TabSheet2 then
   begin
      for i := 0 to SG_HiddenData2.RowCount -1 do
      begin
         if trim(SG_HiddenData2.Cells[7, i]) = '' then
         begin
            showmessage('평가점수를 부여하지 않은 항목명이 존재합니다.' +#13+#13+
                        '평가점수를 부여하신 후 저장처리 하십시오.');
            exit;
         end;
      end;

      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
      begin
         SqlText := 'UPDATE petds ' +
                      ' SET e2score = '+SG_HiddenData2.Cells[7, i]+' ' +
                    ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // 평가자
                      ' AND ekind = ''리더십역량''' +
                      ' AND itemno = '+SG_HiddenData2.Cells[0,  i]+'' +
                      ' AND imageno = '+SG_HiddenData2.Cells[2, i]+'';
         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
      Leadership_data;
   end;
end;

procedure TFM_Main1.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
    // L_score1.Visible := true;
    // L_score2.Visible := false;
     SG_Image1.SetFocus;
     BT_Save1.Caption := '공통역량 업적평가저장';
  end
  else
  begin
    // L_score2.Visible := true;
    // L_score1.Visible := false;
     SG_Image2.SetFocus;
     BT_Save1.Caption := '리더십역량 업적평가저장';
  end;
end;

procedure TFM_Main1.SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image2.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
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

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image2.Row < SG_Image2.TopRow then // 현재 row 가 화면위에 있다
    SG_Image2.Row := SG_Image2.TopRow
  else if SG_Image2.Row > (SG_Image2.TopRow + SG_Image2.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image2.Row := SG_Image2.TopRow + SG_Image2.VisibleRowCount-1;

  SG_Score2.TopRow := SG_Image2.TopRow;
  SG_Score2.Row    := SG_Image2.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton2.Top := (SG_Image2.Row - SG_Image2.TopRow) *
                         (SG_Image2.DefaultRowHeight + SG_Image2.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S2.Down   := False;
  SB_A2.Down   := False;
  SB_B2.Down   := False;
  SB_C2.Down   := False;
  SB_D2.Down   := False;

  //버튼상태반영
       if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrS  then  SB_S2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrA  then  SB_A2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrB  then  SB_B2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrC  then  SB_C2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrD  then  SB_D2.Down  := True;

   P_ControlButton2.Visible := True;    
end;

procedure TFM_Main1.Bt_ConfirmClick(Sender: TObject);
var SqlText : string;
    isum : Double;
begin
   SqlText := 'SELECT count(0) cnt'+
               ' FROM petacd a, petds b, petac C'+
              ' WHERE a.rabasdate = '''+srabasdate+''''+
                ' AND a.evcno     = 1'+
                ' AND a.ekind     in(''공통역량'',''리더십역량'')'+
                ' AND a.rabasdate = c.rabasdate'+
                ' AND a.evcno     = c.evcno'+
                ' AND a.ekind     = c.ekind'+
                ' AND a.itemno    = c.itemno'+
                ' AND a.rabasdate = b.rabasdate(+)'+
                ' AND a.ekind     = b.ekind(+)'+
                ' AND b.empno(+)  = '''+var_empno+''''+
		' and nvl(b.e2score,0) = 0 '+
                ' AND a.itemno    = b.itemno(+)'+
                ' AND a.imageno   = b.imageno(+)'+
              ' ORDER BY a.itemno, a.imageno';

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
            showmessage('팀장역량 2차평가 저장처리를 할 수 없습니다.'+#13+
                        '공통역량, 리더십역량에 대한 역량평가가 저장처리 되었는지 확인하시기 바랍니다.');
            close;
            exit;
         end;
      end
      else
      begin
         showmessage('공통역량, 리더십역량 등록여부 체크중 오류가 발생했습니다.');
         exit;
      end;
   end;

   if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                                 '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+

                                 '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
   begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
   end;

   //1차최종평가점수를 계산한다.
   isum := StrToFloat(L_First21.Caption);
   isum := isum + StrToFloat(L_First22.Caption);
   iSum := (Round(iSum/2*10000)/10000);
                                           
   //피평가자 평가완료 여부 'Y'로 update
   SqlText := 'update petremas '+
                'set E2VALCONYN =''Y'''+
                    ' ,E2SCORE = '+ FloatToStr(isum) +
                    ' ,e2valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
                    'e2valobjyn= ''N'''+
              ' WHERE rabasdate = '''+srabasdate+''''+
                ' AND empno  = '''+var_empno+'''';
   with DBSet_dml do
   begin
      Close;
      ServiceName := 'PET1010A_dml';
      ClearFieldInfo;
      SQL.Text := SqlText;
      Execute;
      Bt_Confirm.Enabled := false;
      BT_Save1.Enabled := false;
      MessageDlg('[2차평가 최종완료 ]처리 되었습니다.', mtInformation, [mbOK], 0);
   end;
end;

procedure TFM_Main1.Bt_OConfirmClick(Sender: TObject);
begin

 //  FL_E1opinionyn:= true;
end;

procedure TFM_Main1.Bt_AddClick(Sender: TObject);
begin
//
end;

procedure TFM_Main1.OnFocusButton1Click(Sender: TObject);
begin
   Notebook1.PageIndex := 1;
end;

procedure TFM_Main1.OnFocusButton2Click(Sender: TObject);
begin
   //평가자 의견등록
    if Length(Memo_E1.Text) > 600 then
    begin
      MessageDlg('[저장오류] 300자 이내로 의견을 등록주십시요.', mtWarning, [mbOK], 0);
      System.Exit;
    end;
    with DBSet_dml do
    begin
      Close;
      ClearFieldInfo;
      ServiceName := 'PET1010A_dml';
      SQL.Clear;
      SQL.Text := Format('UPDATE petremas                              '+
                         '   SET e2valview = ''%s''                    '+
                         ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                          [Memo_E1.Text,sRabasdate,var_empno]);
      Execute;
    end;
end;

procedure TFM_Main1.Notebook1PageChanged(Sender: TObject);
var SqlText : String;
begin
   if Notebook1.PageIndex = 1 then
   begin
      SqlText := 'SELECT E2VALVIEW '+
                      '  FROM petremas   '+
                      ' WHERE rabasdate ='''+srabasdate+''' '+
                      '   AND empno ='''+var_empno+''' '+
                      '   AND e1empno ='''+Gsempno+'''';
      with TMaxDataSet_HInsa do
      begin
        Close;
        ServiceName := 'PTA1010B_common';
        ClearFieldInfo;
        AddField('E1VALVIEW', ftString, 2000);
        ClearParamInfo;
        SQL.Text := SqlText;
        Open;

        if RecordCount > 0 then
           Memo_E1.text := FieldByName('E1VALVIEW').AsString;
        close;
      end;
   end;
end;

procedure TFM_Main1.BT_VIEWCloseClick(Sender: TObject);
begin
   Notebook1.PageIndex := 0;
end;

procedure TFM_Main1.SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TFM_Main1.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TFM_Main1.CB_ShowClass1Click(Sender: TObject);
begin
  SG_Score1.Refresh;
end;

procedure TFM_Main1.ShowSum1;
var
  // i : 갯수
  // j : 평가
  // k : 미실시
  // l : 점수 합
  // m : 자기평가합
  // n : 1차평가합
  i, j, k, l, m, n: Integer;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0;
  n := 0;
  for i := 0 to SG_HiddenData1.RowCount -1 do
  begin
    if (SG_HiddenData1.Cells[7, i] = '0') or
       (SG_HiddenData1.Cells[7, i] = '') then
      inc(k)                                                      //2차 미실시
    else
    begin
      inc(j);                                                     //2차 평가
      l := l + StrToInt(SG_HiddenData1.Cells[7, i]);   //2차 점수
    end;
    m := M + StrToIntdef(SG_HiddenData1.Cells[20, i], 0 );//자기평가합
    n := n + StrToInt(SG_HiddenData1.Cells[6, i]);   //1차 점수
  end;

  if (SG_HiddenData1.RowCount = 1) and (SG_HiddenData1.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total1.Caption := IntToStr(j+k)+'개';
  L_Yes1.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First21.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      점수합 / 총갯수

  if j+k > 0 then
    L_Self1.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       자기평가점수합 / 총갯수

  if j+k > 0 then
    L_First11.Caption  :=
    Formatfloat('#,##0.00', n/(j+k)) ;  //       자기평가점수합 / 총갯수

end;

procedure TFM_Main1.ShowSum2;
var
  // i : 갯수
  // j : 평가
  // k : 미실시
  // l : 점수 합
  // m : 자기평가합
  i, j, k, l, m, n: Integer;
begin

  i := 0; j := 0; k := 0; l := 0; m := 0;
  n := 0;
  for i := 0 to SG_HiddenData2.RowCount -1 do
  begin
    if (SG_HiddenData2.Cells[7, i] = '0') or
       (SG_HiddenData2.Cells[7, i] = '') then
      inc(k)                                                      //1차 미실시
    else
    begin
      inc(j);                                                     //1차 평가
      l := l + StrToInt(SG_HiddenData2.Cells[7, i]);   //1차 점수
    end;
    m := M + StrToIntdef(SG_HiddenData2.Cells[20, i], 0 );//자기평가합
    n := n + StrToInt(SG_HiddenData2.Cells[6, i]);   //1차 점수
  end;

  if (SG_HiddenData2.RowCount = 1) and (SG_HiddenData2.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total2.Caption := IntToStr(j+k)+'개';
  L_Yes2.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First22.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      점수합 / 총갯수

  if j+k > 0 then
    L_Self2.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       자기평가점수합 / 총갯수

  if j+k > 0 then
    L_First12.Caption :=
    Formatfloat('#,##0.00', n/(j+k)) ;  //      1차평가점수

end;


procedure TFM_Main1.SB_S2Click(Sender: TObject);
var
  lsScore : String;
begin
  if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData2.Cells[7, SG_HiddenData2.Tag+SG_Image2.Row] := lsScore;
    SG_Score2.Cells[0, SG_Image2.Row]:= '';
    SG_Score2.Cells[1, SG_Image2.Row]:= '';
    SG_Score2.Cells[2, SG_Image2.Row]:= '';
    SG_Score2.Cells[3, SG_Image2.Row]:= '';
    SG_Score2.Cells[4, SG_Image2.Row]:= '';

         if SB_S2.Down  then SG_Score2.Cells[0, SG_Image2.Row]:= var_GrdS
    else if SB_A2.Down  then SG_Score2.Cells[1, SG_Image2.Row]:= var_GrdA
    else if SB_B2.Down  then SG_Score2.Cells[2, SG_Image2.Row]:= var_GrdB
    else if SB_C2.Down  then SG_Score2.Cells[3, SG_Image2.Row]:= var_GrdC
    else                     SG_Score2.Cells[4, SG_Image2.Row]:= var_GrdD ;

  end else
  begin
    SG_HiddenData2.Cells[7, SG_HiddenData2.Tag+SG_Image2.Row] := '';
    SG_Score2.Cells[0 , SG_Image1.Row] := '';
    SG_Score2.Cells[1 , SG_Image1.Row] := '';
    SG_Score2.Cells[2 , SG_Image1.Row] := '';
    SG_Score2.Cells[3 , SG_Image1.Row] := '';
    SG_Score2.Cells[4 , SG_Image1.Row] := '';
  end;
  ShowSum2;
end;

procedure TFM_Main1.SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
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


procedure TFM_Main1.PageControl1Enter(Sender: TObject);
begin
   SG_Image1.SetFocus;
end;

procedure TFM_Main1.SG_Score2Enter(Sender: TObject);
begin
   SG_Image2.SetFocus;
end;

procedure TFM_Main1.CB_ShowClass2Click(Sender: TObject);
begin
  SG_Score2.Refresh;
end;

end.
