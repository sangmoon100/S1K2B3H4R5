unit HMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  Buttons, OnSkinBtn,  PeJeonLabel, OnTmaxInsaData, OnInsaCommon,
  Db, Tmax_DataSetText, OnDBGrid, peoutlookbtn, OnEditMemo,NotesHana_TLB;

type
  TFM_Main = class(TForm)
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
    Label3: TLabel;
    Memo_E1: TOnMemo;
    BT_VIEWClose: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    L_Title: TPanel;
    L_Self1: TPanel;
    L_First1: TPanel;
    Label99: TLabel;
    Panel5: TPanel;
    L_Self2: TPanel;
    L_First2: TPanel;
    Label1: TLabel;
    CB_ShowClass1: TCheckBox;
    Insa_Data: TOnTMaxInsaData;
    Insa_Session: TTMaxSession;
    Panel11: TPanel;
    Label12: TLabel;
    Label22: TLabel;
    Panel6: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label4: TLabel;
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
    sRabasdate : string;
    procedure Common_data;
    procedure Leadership_data;
    procedure ShowSum1;
    procedure ShowSum2;
    function Csel_gfd(p_loc: Integer): String;

  public
    { Public declarations }
    var_Ekind: String;   // ��������
    Pjobkind : String;
    Inter    : ILotusNotes_Hana;
    Pempno, Pkorname, Password, Ppermission: string;
    var_empno   : String; //������ ���
    var_korname : String; //������ ����
  end;

var
  FM_Main: TFM_Main;
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

//uses HSubForm,Hinsa_TmaxDM, UOpinon;
uses Hinsa_TmaxDM;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  //
end;

procedure TFM_Main.FormShow(Sender: TObject);
var SqlText :string;
begin
  sRabasdate := '20051231';
  var_empno := '1569';

  //�����Ϸ� ���θ� üũ ���� ��ư ������ �Ѵ�.
  SqlText := 'select nvl(RVALCONYN,''N'') '+
               'from pesremas '+
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
       showmessage('aa');
       if Csel_gfd(1) = 'N' then
       begin
          Bt_Confirm.Enabled := true;
          BT_Save1.Enabled := true;

       end
       else
       begin
          //�̹� ������ ó���Ǿ����ϴ�.
          Bt_Confirm.Enabled := false;
          BT_Save1.Enabled := false;

       end;
    end;
    close;
  end;

  Notebook1.PageIndex := 0;
  PageControl1.ActivePage := TabSheet1;
  //���������� ��ȸ�Ѵ�.
  Common_data;
  Leadership_data;
end;

procedure TFM_Main.Common_data;
var
  SqlText: String;
  i, j   : Integer;
begin
  Application.ProcessMessages;
  //���� 1�� ���� �Ϸ�ó�� �� �ڷ�� ����ó���� ����ó�� ���ϵ��� ���´�.
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
                    ' ''00''||'';''||'+
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petdl b, petac C' + // �ɷ��µ���ǥ�̹���, �ɷ��µ��ڱ���, �ɷ��µ���ǥ�׸�
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // ��ǥ��ȣ
                ' AND a.ekind     = ''���뿪��''' + // �򰡱���
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // ��ǥ��ȣ
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // �����ڻ��
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
 // memo1.text := SqlText;
  showmessage(inttostr(DataModule_Tmax.TMaxDataSet_HInsa.RecordCount));

  if DataModule_Tmax.TMaxDataSet_HInsa.RecordCount > 0 then
  begin
     showmessage('dhk');
  end;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1] <> '' then
      SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;
    SG_HiddenData1.Cells[0, SG_HiddenData1.RowCount-1]  := Csel_gfd(1); // ���׸��ȣ
    SG_HiddenData1.Cells[1, SG_HiddenData1.RowCount-1]:= Csel_gfd(2); // ���׸��
    SG_HiddenData1.Cells[2, SG_HiddenData1.RowCount-1] := Csel_gfd(3); // ���̹�����ȣ
    SG_HiddenData1.Cells[3, SG_HiddenData1.RowCount-1]:= Csel_gfd(4); // ���̹�������
    SG_HiddenData1.Cells[7, SG_HiddenData1.RowCount-1] := Csel_gfd(6); // 1��������
    SG_HiddenData1.Cells[20, SG_HiddenData1.RowCount-1] := Csel_gfd(5);  //�ڱ�������
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // ���������Ȳ
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
     //showmessage(SG_Image1.Cells[2, SG_Image1.RowCount-1]);

     SG_Score1.Cells[0, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[1, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[2, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[3, SG_Score1.RowCount-1] := '';
     SG_Score1.Cells[4, SG_Score1.RowCount-1] := '';

     //��ư���¹ݿ�
     if trim(SG_HiddenData1.Cells[7, i]) = var_ScrS  then SG_Score1.Cells[0 , SG_Score1.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrA  then SG_Score1.Cells[1 , SG_Score1.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrB  then SG_Score1.Cells[2,  SG_Score1.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrC  then SG_Score1.Cells[3 , SG_Score1.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData1.Cells[7, i]) = var_ScrD  then SG_Score1.Cells[4,  SG_Score1.RowCount-1] := var_GrdD;
  end;
  SG_Image1.SetFocus;
end;

procedure TFM_Main.Leadership_data;
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
                    ' nvl(b.empno,'' '')'+
              '  FROM petacd a, petds b, petac C' + // �ɷ��µ���ǥ�̹���, �ɷ��µ��ڱ���, �ɷ��µ���ǥ�׸�
              ' WHERE a.rabasdate = '''+sRabasdate+'''' +
                ' AND a.evcno     = 1' + // ��ǥ��ȣ
                ' AND a.ekind     = ''�����ʿ���''' + // �򰡱���
                ' AND a.rabasdate = c.rabasdate' +
                ' AND a.evcno     = c.evcno' + // ��ǥ��ȣ
                ' AND a.ekind     = c.ekind' +
                ' AND a.itemno    = c.itemno' +
                ' AND a.rabasdate = b.rabasdate(+)' +
                ' AND a.ekind     = b.ekind(+)' +
                ' AND b.empno(+)  = '''+var_empno+'''' + // �����ڻ��
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

    SG_HiddenData2.Cells[0, SG_HiddenData2.RowCount-1]  := Csel_gfd(1); // ���׸��ȣ
    SG_HiddenData2.Cells[1, SG_HiddenData2.RowCount-1]:=   Csel_gfd(2); // ���׸��
    SG_HiddenData2.Cells[2, SG_HiddenData2.RowCount-1] :=  Csel_gfd(3); // ���̹�����ȣ
    SG_HiddenData2.Cells[3, SG_HiddenData2.RowCount-1]:=   Csel_gfd(4); // ���̹�������
    SG_HiddenData2.Cells[7, SG_HiddenData2.RowCount-1] :=  Csel_gfd(6); // 1��������
    SG_HiddenData2.Cells[20, SG_HiddenData2.RowCount-1] := Csel_gfd(5);  //�ڱ�������
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;


  // ���������Ȳ
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

     SG_Score2.Cells[0 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[1 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[2 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[3 , SG_Score2.RowCount-1] := '';
     SG_Score2.Cells[4 , SG_Score2.RowCount-1] := '';

     //��ư���¹ݿ�
          if trim(SG_HiddenData2.Cells[7, i]) = var_ScrS  then SG_Score2.Cells[0 , SG_Score2.RowCount-1] := var_GrdS
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrA  then SG_Score2.Cells[1 , SG_Score2.RowCount-1] := var_GrdA
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrB  then SG_Score2.Cells[2,  SG_Score2.RowCount-1] := var_GrdB
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrC  then SG_Score2.Cells[3 , SG_Score2.RowCount-1] := var_GrdC
     else if trim(SG_HiddenData2.Cells[7, i]) = var_ScrD  then SG_Score2.Cells[4,  SG_Score2.RowCount-1] := var_GrdD;
  end;

  //SG_Image2.SetFocus;

end;

function TFM_Main.Csel_gfd(p_loc: Integer): String;
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

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
   close;
end;

procedure TFM_Main.SG_Image1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

  {
  if SG_Image1.VisibleRowCount < SG_Image1.RowCount then
    SG_Image1.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore - 16
  else
    SG_Image1.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore;
  }

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
    Rect.Top   := Rect.Top + 2; // ���� Text�� �׷����� ������ ũ�⸦ �ణ ���δ�
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image1.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // ���õ� row�� ȭ�鿡 ���̰� ��ġ�� �ٲ۴�
  if SG_Image1.Row < SG_Image1.TopRow then // ���� row �� ȭ������ �ִ�
    SG_Image1.Row := SG_Image1.TopRow
  else if SG_Image1.Row > (SG_Image1.TopRow + SG_Image1.VisibleRowCount-1) then // ���� row �� ȭ��ؿ� �ִ�
    SG_Image1.Row := SG_Image1.TopRow + SG_Image1.VisibleRowCount-1;

  SG_Score1.TopRow := SG_Image1.TopRow;
  SG_Score1.Row    := SG_Image1.Row;

  // ��ư�� top ��ġ�� ���
  P_ControlButton1.Top := (SG_Image1.Row - SG_Image1.TopRow) *
                         (SG_Image1.DefaultRowHeight + SG_Image1.GridLineWidth) + 2;

  // ������ ��ư�� �ݿ�
  SB_S1.Down   := False;
  SB_A1.Down   := False;
  SB_B1.Down   := False;
  SB_C1.Down   := False;
  SB_D1.Down   := False;

  //��ư���¹ݿ�
       if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrS  then  SB_S1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrA  then  SB_A1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrB  then  SB_B1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrC  then  SB_C1.Down  := True
  else if trim(SG_HiddenData1.Cells[7, SG_HiddenData1.Tag + SG_Image1.Row]) = var_ScrD  then  SB_D1.Down  := True;

   P_ControlButton1.Visible := True;
end;

procedure TFM_Main.SB_S1Click(Sender: TObject);
var
  lsScore : String;
begin
  if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // ��ư�� �������� SG_HiddenData�� ����� ���� ���濩�θ� 'Y'�� ��ģ��.
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


procedure TFM_Main.BT_Save1Click(Sender: TObject);
var
  i, j: Integer;
  SqlText: String;
begin
   if PageControl1.ActivePage = TabSheet1 then
   begin
      //���뿪���� ������ ����ó�� �Ѵ�.
      {
      for i := 0 to SG_HiddenData1.RowCount -1 do
      begin
         if trim(SG_HiddenData1.Cells[7, i]) = '' then
         begin
            showmessage('�������� �ο����� ���� �׸���� �����մϴ�.' +#13+#13+
                        '�������� �ο��Ͻ� �� ����ó�� �Ͻʽÿ�.');
            exit;
         end;
      end;
      }
      for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
      begin
         SqlText := 'UPDATE petds ' + // �ɷ��µ��ڱ���
                      ' SET e1score = '+SG_HiddenData1.Cells[7, i]+' ' +
                    ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // ����
                      ' AND ekind = ''���뿪��''' +
                      ' AND itemno = '+SG_HiddenData1.Cells[0,  i]+'' +
                      ' AND imageno = '+SG_HiddenData1.Cells[2, i]+'';
         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      MessageDlg('�Է��Ͻ� ���ڷḦ �����Ͽ����ϴ�.',mtInformation,[mbOk],0);
      Common_data;

   end
   else  if PageControl1.ActivePage = TabSheet2 then
   begin
      {
      for i := 0 to SG_HiddenData2.RowCount -1 do
      begin
         if trim(SG_HiddenData2.Cells[7, i]) = '' then
         begin
            showmessage('�������� �ο����� ���� �׸���� �����մϴ�.' +#13+#13+
                        '�������� �ο��Ͻ� �� ����ó�� �Ͻʽÿ�.');
            exit;
         end;
      end;
      }

      for i := SG_HiddenData2.FixedRows to SG_HiddenData2.RowCount-1 do
      begin
         SqlText := 'UPDATE petds ' +
                      ' SET e1score = '+SG_HiddenData2.Cells[7, i]+' ' +
                    ' WHERE rabasdate = '''+srabasdate+'''' +
                      ' AND empno = '''+var_empno+'''' + // ����
                      ' AND ekind = ''�����ʿ���''' +
                      ' AND itemno = '+SG_HiddenData2.Cells[0,  i]+'' +
                      ' AND imageno = '+SG_HiddenData2.Cells[2, i]+'';
         DataModule_Tmax.Cupd_SQL := SqlText;
         DataModule_Tmax.Cupd_Exec;
         if not DataModule_Tmax.Cupd_ret then
         begin
            Exit;
         end;
      end;
      MessageDlg('�Է��Ͻ� ���ڷḦ �����Ͽ����ϴ�.',mtInformation,[mbOk],0);
      Leadership_data;
   end;
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
    // L_score1.Visible := true;
    // L_score2.Visible := false;
     SG_Image1.SetFocus;
     BT_Save1.Caption := '���뿪�� ����������';
  end
  else
  begin
    // L_score2.Visible := true;
    // L_score1.Visible := false;
     SG_Image2.SetFocus;
     BT_Save1.Caption := '�����ʿ��� ����������';
  end;
end;

procedure TFM_Main.SG_Image2DrawCell(Sender: TObject; ACol, ARow: Integer;
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
    Rect.Top   := Rect.Top + 2; // ���� Text�� �׷����� ������ ũ�⸦ �ణ ���δ�
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image2.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // ���õ� row�� ȭ�鿡 ���̰� ��ġ�� �ٲ۴�
  if SG_Image2.Row < SG_Image2.TopRow then // ���� row �� ȭ������ �ִ�
    SG_Image2.Row := SG_Image2.TopRow
  else if SG_Image2.Row > (SG_Image2.TopRow + SG_Image2.VisibleRowCount-1) then // ���� row �� ȭ��ؿ� �ִ�
    SG_Image2.Row := SG_Image2.TopRow + SG_Image2.VisibleRowCount-1;

  SG_Score2.TopRow := SG_Image2.TopRow;
  SG_Score2.Row    := SG_Image2.Row;

  // ��ư�� top ��ġ�� ���
  P_ControlButton2.Top := (SG_Image2.Row - SG_Image2.TopRow) *
                         (SG_Image2.DefaultRowHeight + SG_Image2.GridLineWidth) + 2;

  // ������ ��ư�� �ݿ�
  SB_S2.Down   := False;
  SB_A2.Down   := False;
  SB_B2.Down   := False;
  SB_C2.Down   := False;
  SB_D2.Down   := False;

  //��ư���¹ݿ�
       if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrS  then  SB_S2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrA  then  SB_A2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrB  then  SB_B2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrC  then  SB_C2.Down  := True
  else if trim(SG_HiddenData2.Cells[7, SG_HiddenData2.Tag + SG_Image2.Row]) = var_ScrD  then  SB_D2.Down  := True;

   P_ControlButton2.Visible := True;    
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var SqlText : string;
    isum : Double;
begin
   SqlText := 'SELECT count(0) cnt'+
               ' FROM petacd a, petds b, petac C'+
              ' WHERE a.rabasdate = '''+srabasdate+''''+
                ' AND a.evcno     = 1'+
                ' AND a.ekind     in(''���뿪��'',''�����ʿ���'')'+
                ' AND a.rabasdate = c.rabasdate'+
                ' AND a.evcno     = c.evcno'+
                ' AND a.ekind     = c.ekind'+
                ' AND a.itemno    = c.itemno'+
                ' AND a.rabasdate = b.rabasdate(+)'+
                ' AND a.ekind     = b.ekind(+)'+
                ' AND b.empno(+)  = '''+var_empno+''''+
		' and nvl(b.e1score,0) = 0 '+
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
            showmessage('���忪�� 1���� ����ó���� �� �� �����ϴ�.'+#13+
                        '���뿪��, �����ʿ����� ���� �����򰡰� ����ó�� �Ǿ����� Ȯ���Ͻñ� �ٶ��ϴ�.');
            close;
            exit;
         end;
      end
      else
      begin
         showmessage('���뿪��, �����ʿ��� ��Ͽ��� üũ�� ������ �߻��߽��ϴ�.');
         exit;
      end;
   end;

   if MessageBox(handle,PChar('�����ϷḦ �Ͻø� ����Ͻ� ������ �����Ͻ� �� �����ϴ�.'+#13+#13+

                                 '����Ͻ� ������ ���� ��� Ȯ���� ��ġ������ �����ϷḦ �Ͻñ� �ٶ��ϴ�.'+#13+#13+

                                 '�����ϷḦ �Ͻðڽ��ϱ�?'), 'Ȯ ��',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
   begin
        if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
        system.Exit;
   end;

   //1�������������� ����Ѵ�.
   isum := StrToFloat(L_First1.Caption);
   isum := isum + StrToFloat(L_First2.Caption);
   iSum := (Round(iSum/2*10000)/10000);


   //������ �򰡿Ϸ� ���� 'Y'�� update
   SqlText := 'update petremas '+
                'set E1VALCONYN =''Y'''+
                    ' ,E1SCORE = '+ FloatToStr(isum) +
                    ' ,e1valcondate = SUBSTR(TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''),1,8), '+
                    'e1valobjyn= ''N'', e2valobjyn = ''N'''+
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
      MessageDlg('[1���� �����Ϸ� ]ó�� �Ǿ����ϴ�.', mtInformation, [mbOK], 0);
   end;
end;

procedure TFM_Main.Bt_OConfirmClick(Sender: TObject);
begin

 //  FL_E1opinionyn:= true;
end;

procedure TFM_Main.Bt_AddClick(Sender: TObject);
begin
//
end;

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
begin
   Notebook1.PageIndex := 1;
end;

procedure TFM_Main.OnFocusButton2Click(Sender: TObject);
begin
   //���� �ǰߵ��
    if Length(Memo_E1.Text) > 600 then
    begin
      MessageDlg('[�������] 300�� �̳��� �ǰ��� ����ֽʽÿ�.', mtWarning, [mbOK], 0);
      System.Exit;
    end;
    with DBSet_dml do
    begin
      Close;
      ClearFieldInfo;
      ServiceName := 'PET1010A_dml';
      SQL.Clear;
      SQL.Text := Format('UPDATE petremas                              '+
                         '   SET e1valview = ''%s''                    '+
                         ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                          [Memo_E1.Text,sRabasdate,var_empno]);
      Execute;
    end;
end;

procedure TFM_Main.Notebook1PageChanged(Sender: TObject);
var SqlText : String;
begin
   {
   if Notebook1.PageIndex = 1 then
   begin
      SqlText := 'SELECT E1VALVIEW '+
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
   }
end;

procedure TFM_Main.BT_VIEWCloseClick(Sender: TObject);
begin
   Notebook1.PageIndex := 0;
end;

procedure TFM_Main.SG_Score1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

  if CB_ShowClass1.Checked then // ����� ���̰�...
    SG_Score1.Canvas.Font.Color := SG_Image1.Font.Color
  else
    SG_Score1.Canvas.Font.Color := SG_Score1.Font.Color;

  SG_Score1.Canvas.FillRect(Rect); // cell�� ������ �׸���
  lsBuffer := SG_Score1.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score1.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score1.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFM_Main.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TFM_Main.CB_ShowClass1Click(Sender: TObject);
begin
  SG_Score1.Refresh;
end;

procedure TFM_Main.ShowSum1;
var
  // i : ����
  // j : ��
  // k : �̽ǽ�
  // l : ���� ��
  // m : �ڱ�����
  i, j, k, l, m: Integer;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0;

  for i := 0 to SG_HiddenData1.RowCount -1 do
  begin
    if (SG_HiddenData1.Cells[7, i] = '0') or
       (SG_HiddenData1.Cells[7, i] = '') then
      inc(k)                                                      //1�� �̽ǽ�
    else
    begin
      inc(j);                                                     //1�� ��
      l := l + StrToInt(SG_HiddenData1.Cells[7, i]);   //1�� ����
    end;
    m := M + StrToIntdef(SG_HiddenData1.Cells[20, i], 0 );//�ڱ�����
  end;

  if (SG_HiddenData1.RowCount = 1) and (SG_HiddenData1.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total1.Caption := IntToStr(j+k)+'��';
  L_Yes1.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First1.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      ������ / �Ѱ���

  if j+k > 0 then
  L_Self1.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       �ڱ��������� / �Ѱ���
end;

procedure TFM_Main.ShowSum2;
var
  // i : ����
  // j : ��
  // k : �̽ǽ�
  // l : ���� ��
  // m : �ڱ�����
  i, j, k, l, m: Integer;
begin

  i := 0; j := 0; k := 0; l := 0; m := 0;

  for i := 0 to SG_HiddenData2.RowCount -1 do
  begin
    if (SG_HiddenData2.Cells[7, i] = '0') or
       (SG_HiddenData2.Cells[7, i] = '') then
      inc(k)                                                      //1�� �̽ǽ�
    else
    begin
      inc(j);                                                     //1�� ��
      l := l + StrToInt(SG_HiddenData2.Cells[7, i]);   //1�� ����
    end;
    m := M + StrToIntdef(SG_HiddenData2.Cells[20, i], 0 );//�ڱ�����
  end;

  if (SG_HiddenData2.RowCount = 1) and (SG_HiddenData2.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total2.Caption := IntToStr(j+k)+'��';
  L_Yes2.Caption   := IntToStr(j);


  if j+k > 0 then
    L_First2.Caption :=
    Formatfloat('#,##0.00', l/(j+k)) ;  //      ������ / �Ѱ���

  if j+k > 0 then
  L_Self2.Caption  :=
    Formatfloat('#,##0.00', m/(j+k)) ;  //       �ڱ��������� / �Ѱ���

end;


procedure TFM_Main.SB_S2Click(Sender: TObject);
var
  lsScore : String;
begin
  if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // ��ư�� �������� SG_HiddenData�� ����� ���� ���濩�θ� 'Y'�� ��ģ��.
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

procedure TFM_Main.SG_Score2DrawCell(Sender: TObject; ACol, ARow: Integer;
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

  if CB_ShowClass2.Checked then // ����� ���̰�...
    SG_Score2.Canvas.Font.Color := SG_Image2.Font.Color
  else
    SG_Score2.Canvas.Font.Color := SG_Score2.Font.Color;

  SG_Score2.Canvas.FillRect(Rect); // cell�� ������ �׸���
  lsBuffer := SG_Score2.Cells[ACol, ARow];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score2.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score2.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score2.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;


procedure TFM_Main.PageControl1Enter(Sender: TObject);
begin
   SG_Image1.SetFocus;
end;

procedure TFM_Main.SG_Score2Enter(Sender: TObject);
begin
   SG_Image2.SetFocus;
end;

procedure TFM_Main.CB_ShowClass2Click(Sender: TObject);
begin
  SG_Score2.Refresh;
end;

end.