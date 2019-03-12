

unit UEduForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnEditMemo, OnShapeLabel,
  Tmax_session, Db, Tmax_DataSetText,  Func,
  On_pmEkind, On_pmBumoon, On_pmTrack, On_pmLevel, On_pmEdunm,
  PeJeonVertLabel, Mask, pebtnedit, peextcombo, ComCtrls, OnEditCombo,
  Grids, DBGrids, pedbgrid, OnDBGrid, OnGrDBGrid, Buttons, OnSkinBtn,
  MemDS, DBAccess, Ora, QuickRpt, Qrctrls, OnTmaxPersonEdit, PDownLoad;

type
  TFEduForm = class(TForm)
    DS_Ekind: TDataSource;
    DS_Bumoon: TDataSource;
    QR_Ekind: TTMaxDataSet;
    QR_Bumoon: TTMaxDataSet;
    QR_Track: TTMaxDataSet;
    DS_Track: TDataSource;
    DS_Edu: TDataSource;
    QR_Edu: TTMaxDataSet;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    PL_Help: TPanel;
    L_Bumoon: TOnShapeLabel;
    L_Track: TOnShapeLabel;
    L_Level: TOnShapeLabel;
    L_Educode: TOnShapeLabel;
    E_edumm08: TOnEdit;
    E_edumm04: TOnEdit;
    E_edumm12: TOnEdit;
    E_edumm11: TOnEdit;
    E_edumm07: TOnEdit;
    E_edumm03: TOnEdit;
    E_edumm10: TOnEdit;
    E_edumm06: TOnEdit;
    E_edumm09: TOnEdit;
    E_edumm05: TOnEdit;
    E_edumm01: TOnEdit;
    E_edumm02: TOnEdit;
    OnShapeLabel1: TOnShapeLabel;
    B_edumm01: TBitBtn;
    B_edumm02: TBitBtn;
    B_edumm03: TBitBtn;
    B_edumm04: TBitBtn;
    B_edumm08: TBitBtn;
    B_edumm07: TBitBtn;
    B_edumm06: TBitBtn;
    B_edumm05: TBitBtn;
    B_edumm10: TBitBtn;
    B_edumm11: TBitBtn;
    B_edumm12: TBitBtn;
    B_edumm09: TBitBtn;
    ExitBtn: TOnFocusButton;
    SaveBtn: TOnFocusButton;
    Btn_Search: TOnFocusButton;
    DBG_Edu: TDBGrid;
    Memo1: TMemo;
    OnEdit2: TOnEdit;
    L_Ekind: TOnShapeLabel;
    E_eduobject: TOnShapeLabel;
    E_eduplace: TOnShapeLabel;
    E_eduform: TOnShapeLabel;
    E_chargedept: TOnShapeLabel;
    E_educnt: TOnShapeLabel;
    E_Edutime: TOnShapeLabel;
    E_chargeemp: TOnShapeLabel;
    E_bmopenyn: TOnShapeLabel;
    E_valyn: TOnShapeLabel;
    E_lpoint: TOnShapeLabel;
    E_edutarget: TOnMemo;
    E_eduname: TOnMemo;
    E_educontent: TOnMemo;
    Btn_SearchAll: TOnFocusButton;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    B_eduSC: TOnFocusButton;
    E_eduSC: TOnEdit;
    BT_Help: TOnFocusButton;
    E_ITEMNAME: TOnShapeLabel;
    E_jmtrack: TOnComboEdit;
    OnComboEdit1: TOnComboEdit;
    Label5: TLabel;
    Label3: TLabel;
    QR_item: TTMaxDataSet;
    Panel5: TPanel;
    Label4: TLabel;
    OC_itemname: TOnComboEdit;
    B_itemSC: TOnFocusButton;
    Panel6: TPanel;
    Label2: TLabel;
    S_edumm12: TBitBtn;
    S_edumm11: TBitBtn;
    S_edumm10: TBitBtn;
    S_edumm9: TBitBtn;
    S_edumm8: TBitBtn;
    S_edumm7: TBitBtn;
    S_edumm6: TBitBtn;
    S_edumm5: TBitBtn;
    S_edumm4: TBitBtn;
    S_edumm3: TBitBtn;
    S_edumm2: TBitBtn;
    S_edumm1: TBitBtn;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    QR_Level: TTMaxDataSet;
    DS_Level: TDataSource;
    QR_Jikmu: TTMaxDataSet;
    DS_Jikmu: TDataSource;
    SF_Main: TOnSchemeForm;
    DBG_Level: TOnGrDbGrid;
    DBG_Jikmu: TOnGrDbGrid;
    DBG_Track: TOnGrDbGrid;
    DBG_Bumoon: TOnGrDbGrid;
    DBG_Ekind: TOnGrDbGrid;
    Panel7: TPanel;
    OnFocusButton1: TOnFocusButton;
    YY_Code: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    L_A: TLabel;
    L_B: TLabel;
    L_C: TLabel;
    L_D: TLabel;
    L_E: TLabel;
    BT_Excel1: TOnFocusButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure B_edumm01Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure DBG_EduKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBG_EduCellClick(Column: TColumn);
    procedure All_Search;
    procedure All_Clear;
    procedure Part_Search(PTag: Integer);
    procedure Btn_SearchAllClick(Sender: TObject);
    procedure B_eduSCClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure DBG_EkindCellClick(Column: TColumn);
    procedure DBG_TrackCellClick(Column: TColumn);
    procedure DBG_JikmuCellClick(Column: TColumn);
    procedure DBG_LevelCellClick(Column: TColumn);
    procedure DBG_BumoonCellClick(Column: TColumn);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure BT_Excel1Click(Sender: TObject);

  private
    { Private declarations }
    //교육정보

    FM_EKIND  : TFM_pmEkind;
    FM_BUMOON : TFM_pmBumoon;
    FM_TRACK  : TFM_pmTrack;
    FM_LEVEL  : TFM_pmLevel;
    FM_EDUNM  : TFM_pmEdunm;

  public
    { Public declarations }
    eduKEY    : String;
    Peduekind : String;
    Pedubumoon: String;
    Pedutrack : String;
    Pedulevel : String;
    Peduedunm : String;
    Csel_SQL  : String;
    PEduMMTag : String;

    Pmdutrack : String;
    Pmdulevel : String;
    vEdumm    : Integer;
  end;

var
  FEduForm: TFEduForm;

implementation

uses UMainForm, UHelp;

{$R *.DFM}

procedure TFEduForm.FormCreate(Sender: TObject);
begin
  with QR_Ekind do  //필수여부
  begin
    ServiceName := 'HINSA_select';
    Close;
    SQL.Clear;

    Sql.Add(' select codeno c_ekind,     ');
    Sql.Add('        hname cn_ekind,     ');
    Sql.Add('        null, null, null    ');
    Sql.Add('   FROM peidpcode           ');
    Sql.Add('  where classno = ''1''     ');
    Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
    Sql.Add('  ORDER BY codeno           ');

    ClearFieldInfo;
    AddField('c_ekind'  , ftString,  100);
    AddField('cn_ekind' , ftString,  100);
    AddField('field3'   , ftString,  100);
    AddField('field4'   , ftString,  100);
    AddField('field5'   , ftString,  100);
    Open;
  end;

//  DBG_Ekind.Color    := clWindow;
//  DBG_Ekind.BarColor := $00CAD3C0;

  DBG_Ekind.BarColor      := clWindow;
  DBG_Ekind.BarFont.Color := clBlack;
//  DBG_Ekind.BarFont.Style.fsBold := False;

end;

procedure TFEduForm.All_Search;
var
  i : Integer;
Begin
  with QR_Edu do  //교육명
  begin
    ServiceName := 'HINSA_select';
    Close;
    SQL.Clear;

    Sql.Add(' select educode c_edu,      ');
    Sql.Add('        replace(replace(replace(eduname,chr(10),'' ''),chr(13),'' ''),''  '','' '')cn_edu, ');
    Sql.Add('        null, null, null    ');
    Sql.Add('   FROM peidpcrs            ');
    Sql.Add('  where useyn = ''Y''       ');
    Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
(*
    if (YY_Code.ActivePage = TabSheet3) then Sql.Add(' and substr(educode,8,2) = ''14''  ')
    Else                                     Sql.Add(' and substr(educode,8,2) = ''15''  ');
*)
    Sql.Add('  ORDER BY educode          ');

    Memo1.text := sql.text;

    ClearFieldInfo;
    AddField('c_edu'  , ftString,  100);
    AddField('cn_edu' , ftString,  100);
    AddField('field3' , ftString,  100);
    AddField('field4' , ftString,  100);
    AddField('field5' , ftString,  100);
    Open;
  end;

  If QR_Edu.RecordCount <= 0 Then
    PL_Help.Caption := ' 교육과정이 존재하지 않습니다.'
  Else
    PL_Help.Caption := ' 교육과정이 '+intToStr(QR_Edu.RecordCount)+'건 조회되었습니다.';
end;

procedure TFEduForm.DBG_EkindCellClick(Column: TColumn);
begin

  DBG_Ekind.Color    := clWindow;
  DBG_Ekind.BarColor := $00CAD3C0;
  DBG_Ekind.BarFont.Style := [fsBold];

  QR_Track.Close;
  DBG_Track.Enabled  := False;
  DBG_Track.Color    := clScrollBar;
  DBG_Track.BarColor := clScrollBar;

  QR_Jikmu.Close;
  QR_Jikmu.SQL.Clear;
  DBG_Jikmu.Enabled  := False;
  DBG_Jikmu.Color    := clScrollBar;
  DBG_Jikmu.BarColor := clScrollBar;

  QR_Level.Close;
  QR_Level.SQL.Clear;
  DBG_Level.Enabled  := False;
  DBG_Level.Color    := clScrollBar;
  DBG_Level.BarColor := clScrollBar;

  L_B.Caption := '';
  L_C.Caption := '';
  L_D.Caption := '';
  L_E.Caption := '';
  L_A.Caption := QR_Ekind.Fieldbyname('c_ekind').AsString;

  Part_Search(0); //필수 클릭, 과정구분 조회
end;

procedure TFEduForm.DBG_BumoonCellClick(Column: TColumn);
begin
  QR_Jikmu.Close;
  QR_Jikmu.SQL.Clear;
  DBG_Jikmu.Enabled  := False;
  DBG_Jikmu.Color    := clScrollBar;
  DBG_Jikmu.BarColor := clScrollBar;

  QR_Level.Close;
  QR_Level.SQL.Clear;
  DBG_Level.Enabled  := False;
  DBG_Level.Color    := clScrollBar;
  DBG_Level.BarColor := clScrollBar;

  L_C.Caption := '';
  L_D.Caption := '';
  L_E.Caption := '';
  L_B.Caption := QR_Bumoon.Fieldbyname('c_bumoon').AsString;

  Part_Search(1); //과정구분 클릭, 부문 조회
end;

procedure TFEduForm.DBG_TrackCellClick(Column: TColumn);
begin
  QR_Level.Close;
  QR_Level.SQL.Clear;
  DBG_Level.Enabled  := False;
  DBG_Level.Color    := clScrollBar;
  DBG_Level.BarColor := clScrollBar;
  L_C.Caption := QR_Track.Fieldbyname('c_track').AsString;

  L_D.Caption := '';
  L_E.Caption := '';

  Part_Search(2); //부문 클릭, 역량 및 Learning Track 조회
end;

procedure TFEduForm.DBG_JikmuCellClick(Column: TColumn);
begin
  L_E.Caption := '';

  L_D.Caption := QR_Jikmu.Fieldbyname('c_jikmu').AsString;
  Part_Search(3); //역량 및 Learning Track
end;

procedure TFEduForm.DBG_LevelCellClick(Column: TColumn);
begin
  L_E.Caption := QR_Level.Fieldbyname('c_level').AsString;
  Part_Search(4); //수준
end;

procedure TFEduForm.Part_Search(PTag: Integer);
begin
  //과정구분
  if PTag = 0 then
  begin
    with QR_Bumoon do
    begin
      ServiceName := 'HINSA_select';
      Close;
      SQL.Clear;

      if (L_A.Caption = 'M') Then //필수
      Begin
        Sql.Add(' select codeno c_bumoon,             ');
        Sql.Add('        hname  cn_bumoon,            ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''2''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and codeno in (''C'', ''V'')     ');
        Sql.Add('    and useyn   = ''Y''              ');
      End Else
      Begin
        Sql.Add(' select codeno c_bumoon,             ');
        Sql.Add('        hname  cn_bumoon,            ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''2''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and codeno in (''C'', ''O'', ''H'') ');
        Sql.Add('    and useyn   = ''Y''              ');
      End;

      ClearFieldInfo;
      AddField('c_bumoon' , ftString, 100);
      AddField('cn_bumoon', ftString, 100);
      AddField('field3'   , ftString, 100);
      AddField('field4'   , ftString, 100);
      AddField('field5'   , ftString, 100);
      Open;

      if (recordcount > 0) Then
      Begin
        DBG_Bumoon.Enabled  := True;
        DBG_Bumoon.Color    := clWindow;
        DBG_Bumoon.BarColor := $00CAD3C0;
      End;
    end;
  end;

  //부문
  if PTag = 1 then
  begin
    with QR_Track do
    begin
      ServiceName := 'HINSA_select';
      Close;
      SQL.Clear;
      if      (L_B.Caption = 'C') Then //사내집합교육
      Begin
        Sql.Add(' select codeno c_track,              ');
        Sql.Add('        hname  cn_track,             ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''3''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and useyn   = ''Y''              ');
        if (L_A.Caption = 'M') Then  Sql.Add(' and codeno in (''B'', ''D'', ''A'', ''C'', ''H'', ''M'', ''R'', ''W'')')
        Else                         Sql.Add(' and codeno in (''A'', ''C'', ''H'', ''M'', ''R'', ''W'')')
      End
      Else if (L_B.Caption = 'V') Then //Value 과정
      Begin
        Sql.Add(' select codeno c_track,              ');
        Sql.Add('        hname  cn_track,             ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''3''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and codeno in (''B'')            ');
        Sql.Add('    and useyn   = ''Y''              ');
      End
      Else if (L_B.Caption = 'O') Then //온라인교육
      Begin
        Sql.Add(' select codeno c_track,              ');
        Sql.Add('        hname  cn_track,             ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''3''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and codeno in (''B'', ''F'', ''L'')');
        Sql.Add('    and useyn   = ''Y''              ');
      End
      Else if (L_B.Caption = 'H') Then //기타(HIDDEN)
      Begin
        Sql.Add(' select codeno c_track,              ');
        Sql.Add('        hname  cn_track,             ');
        Sql.Add('        null, null, null             ');
        Sql.Add('   FROM peidpcode                    ');
        Sql.Add('  where classno = ''3''              ');
        Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
        Sql.Add('    and codeno in (''B'')            ');
        Sql.Add('    and useyn   = ''Y''              ');
      End;

      Sql.Add('    order by orderby                 ');

      ClearFieldInfo;
      AddField('c_track'  , ftString, 100);
      AddField('cn_track' , ftString, 100);
      AddField('field3'   , ftString, 100);
      AddField('field4'   , ftString, 100);
      AddField('field5'   , ftString, 100);
      Open;

      if (recordcount > 0) Then
      Begin
        DBG_Track.Enabled  := True;
        DBG_Track.Color    := clWindow;
        DBG_Track.BarColor := $00CAD3C0;
      End;
    end;
  end;

(*    안녕하세요. HR팀 김진호입니다.
①    필수 > 공통역량Class > 전사 공통 > 역량/직무분야
-       「01 사업이해 ~ 21 전문지식개발」만 노출
-       현재 보이는 「22 전사 공통 ~ 27 Value Track」 삭제(노출 안 되게 처리)

②    필수 > 부문역량Class > 전사 공통 > 역량/직무분야
-       「23 부문역량 공통」만 노출
-       현재 보이는 나머지 「01 사업이해 ~ 27 Value Track」 삭제(노출 안 되게 처리)

③    필수 > Value과정 > 전사 공통 > 역량/직무분야
-       「26 법정필수 Track ~ 27 Value Track」만 노출
-       현재 보이는 「01 사업이해 ~ 25 온라인교육 공통」 삭제(노출 안 되게 처리)

④    필수 > 성장형 Biz. 이해하기 > 전사 공통 > 역량/직무분야
-       「22 전사 공통」만 노출
-       현재 보이는 나머지 「01 사업이해 ~ 27 Value Track」 삭제(노출 안 되게 처리)
*)

  //역량 및 Learning Track
  if PTag = 2 then
  begin
    with QR_Jikmu do
    begin
      ServiceName := 'HINSA_select';
      Close;
      SQL.Clear;

      if      (L_B.Caption = 'C') Then //사내집합교육
      Begin
        if (L_C.Caption = 'B') Then    //전사공통
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno  = ''41''             ');
        End
        Else if (L_C.Caption = 'D') Then //부문공통
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno  <= ''19''            ');
        End
        Else  //나머지
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno  like '''+L_C.Caption+''' ||''%'' ');
        End
      End
      Else if (L_B.Caption = 'V') Then //Value
      Begin
        if (L_C.Caption = 'B') Then    //전사공통
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno  in (''26'', ''27'')  ');
        End;
      End
      Else if (L_B.Caption = 'O') Then //온라인교육
      Begin
        if (L_C.Caption = 'B') Then    //전사공통
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno  <= ''25''            ');
          Sql.Add('    and codeno not in(''22'',''23'',''24'') ');
        End
        Else if (L_C.Caption = 'F') Then    //어학
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno in (''28'', ''29'', ''30'') ');
        End
        Else if (L_C.Caption = 'L') Then    //리더십
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno in (''25'') ');
        End;
      End
      Else if (L_B.Caption = 'H') Then //기타
      Begin
        if (L_C.Caption = 'B') Then    //전사공통
        Begin
          Sql.Add(' select codeno c_jikmu,              ');
          Sql.Add('        hname  cn_jikmu,             ');
          Sql.Add('        null, null, null             ');
          Sql.Add('   FROM peidpcode                    ');
          Sql.Add('  where classno = ''4''              ');
          Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
          Sql.Add('    and useyn   = ''Y''              ');
          Sql.Add('    and codeno in (''38'', ''39'') ');
        End;
      End;

      ClearFieldInfo;
      AddField('c_jikmu'  , ftString, 100);
      AddField('cn_jikmu' , ftString, 100);
      AddField('field3'   , ftString, 100);
      AddField('field4'   , ftString, 100);
      AddField('field5'   , ftString, 100);
      Open;

      if (recordcount > 0) Then
      Begin
        DBG_Jikmu.Enabled  := True;
        DBG_Jikmu.Color    := clWindow;
        DBG_Jikmu.BarColor := $00CAD3C0;
      End;
    End;
  End;

  //수준
  if PTag = 3 then
  begin
    with QR_Level do
    begin
      ServiceName := 'HINSA_select';
      Close;
      SQL.Clear;

      Sql.Add(' select codeno c_level,              ');
      Sql.Add('        hname  cn_level,             ');
      Sql.Add('        null, null, null             ');
      Sql.Add('   FROM peidpcode                    ');
      Sql.Add('  where classno = ''5''              ');
      Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
      Sql.Add('    and useyn   = ''Y''              ');

      ClearFieldInfo;
      AddField('c_level'  , ftString, 100);
      AddField('cn_level' , ftString, 100);
      AddField('field3'   , ftString, 100);
      AddField('field4'   , ftString, 100);
      AddField('field5'   , ftString, 100);
      Open;

      if (recordcount > 0) Then
      Begin
        DBG_Level.Enabled  := True;
        DBG_Level.Color    := clWindow;
        DBG_Level.BarColor := $00CAD3C0;
      End;
    end;
  end;

  with QR_Edu do  //교육명
  begin
    ServiceName := 'HINSA_select2';
    Close;
    SQL.Clear;

    Sql.Add(' select a.educode c_edu, a.eduname cn_edu,               ');
    Sql.Add('        null, null, null FROM peidpcrs a                 ');
    Sql.Add('  where a.BASE_YY = '''+ FM_Main.sbase_yy +'''           ');
    Sql.Add('    and useyn     = ''Y''                                ');

    Sql.Add(' and a.educode like '''+L_A.Caption+''+L_B.Caption+''+L_C.Caption+''+L_D.Caption+''+L_E.Caption+'''||''%''  ');
//    if (YY_Code.ActivePage = TabSheet3) then Sql.Add(' and substr(a.educode,8,2) = ''14''  ')
//    Else                                     Sql.Add(' and substr(a.educode,8,2) = ''15''  ');
    Sql.Add(' ORDER BY educode ');

    memo1.text := sql.text;
    ClearFieldInfo;
    AddField('c_edu'  , ftString,  400);
    AddField('cn_edu' , ftString,  400);
    AddField('field3' , ftString,  400);
    AddField('field4' , ftString,  400);
    AddField('field5' , ftString,  400);

    Open;
  end;

  If QR_Edu.RecordCount <= 0 Then
     PL_Help.Caption := ' 교육과정이 존재하지 않습니다.'
  Else
     PL_Help.Caption := ' 교육과정이 '+intToStr(QR_Edu.RecordCount)+'건 조회되었습니다.';

  All_Clear;
end;

procedure TFEduForm.Btn_SearchClick(Sender: TObject);
var
  SqlText : String;
  peduform: String;
  pedumm  : String;
  i       : Integer;
begin
  If QR_Edu.RecordCount > 0 Then
    EduKey := QR_Edu.Fieldbyname('c_edu').AsString
  Else
  Begin
    All_Clear;
    Exit;
  End;

  with FM_Main.TMaxDataSet do  //교육명
  begin
    ServiceName := 'HINSA_select10';
    Close;
    SQL.Clear;

    Sql.Add(' select ');
    Sql.Add(' (select hname  FROM PEIDPcode where classno = ''1'' and codeno = substr('''+EduKey+''', 1,1) and base_yy = '''+FM_Main.sbase_yy+''') ekind, ');
    Sql.Add(' (select hname  FROM PEIDPcode where classno = ''2'' and codeno = substr('''+EduKey+''', 2,1) and base_yy = '''+FM_Main.sbase_yy+''') bumoon,');
    Sql.Add(' (select hname  FROM PEIDPcode where classno = ''3'' and codeno = substr('''+EduKey+''', 3,1) and base_yy = '''+FM_Main.sbase_yy+''') track, ');
    Sql.Add(' (select hname  FROM PEIDPcode where classno = ''4'' and codeno = substr('''+EduKey+''', 4,2) and base_yy = '''+FM_Main.sbase_yy+''') llevel,');
    Sql.Add(' (select hname  FROM PEIDPcode where classno = ''5'' and codeno = substr('''+EduKey+''', 6,2) and base_yy = '''+FM_Main.sbase_yy+''') sujun,');
    Sql.Add(' '''+EduKey+''' pkkey, '''' F7, '''' F8, '''' F9, '''' F10');
    Sql.Add(' from dual');

    ClearFieldInfo;
    AddField('ekind'  ,ftString, 100);
    AddField('bumoon' ,ftString, 100);
    AddField('track'  ,ftString, 100);
    AddField('llevel' ,ftString, 100);
    AddField('sujun'  ,ftString, 100);
    AddField('pkkey'  ,ftString, 100);
    AddField('F7'     ,ftString, 100);
    AddField('F8'     ,ftString, 100);
    AddField('F9'     ,ftString, 100);
    AddField('F10'    ,ftString, 100);
    Open;

    L_Ekind.ValueCaption   := Fields[0].AsString;
    L_Bumoon.ValueCaption  := Fields[1].AsString;
    L_Track.ValueCaption   := Fields[2].AsString;
    L_Level.ValueCaption   := Fields[3].AsString;
    E_ITEMNAME.ValueCaption:= Fields[4].AsString;
    L_Educode.ValueCaption := Fields[5].AsString;
  end;

  with FM_Main.TMaxDataSet do  //교육일정(월) 선택
  begin
    pedumm := '';
    ServiceName := 'HINSA_select';
    Close;
    SQL.Clear;

    Sql.Add(' select edumm, null, null, null, null from peidphis');
    Sql.Add(' WHERE BASE_YY = '''+ FM_Main.sbase_yy +'''      '); //기준일
    Sql.Add('   AND EMPNO   = '''+ FM_Main.Ed_empno.Text +''' '); //사번
    Sql.Add('   AND EDUCODE = '''+ EduKey +'''                '); //교육Code

    ClearFieldInfo;
    AddField('edumm'  ,ftString, 100);
    AddField('Field2' ,ftString, 100);
    AddField('Field3' ,ftString, 100);
    AddField('Field4' ,ftString, 100);
    AddField('Field5' ,ftString, 100);
    Open;

    pedumm := Fields[0].AsString;
  End;

  with FM_Main.TMaxDataSet do
  begin
       SqlText := Format(' SELECT                 '+
                         '	      EDUNAME    ,     '+     //과정명
                         '	      EDUTARGET  ,     '+     //교육목표
                         '	      EDUCONTENT ,     '+     //교육내용
                         '	      EDUMM01    ,     '+     //교육일정 1월
                         '	      EDUMM02    ,     '+     //교육일정 2월
                         '	      EDUMM03    ,     '+     //교육일정 3월
                         '	      EDUMM04    ,     '+     //교육일정 4월
                         '	      EDUMM05    ,     '+     //교육일정 5월
                         '	      EDUMM06    ,     '+     //교육일정 6월
                         '	      EDUMM07    ,     '+     //교육일정 7월
                         '	      EDUMM08    ,     '+     //교육일정 8월
                         '	      EDUMM09    ,     '+     //교육일정 9월
                         '	      EDUMM10    ,     '+     //교육일정 10월
                         '	      EDUMM11    ,     '+     //교육일정 11월
                         '	      EDUMM12    ,     '+     //교육일정 12월
                         '	      EDUOBJECT  ,     '+     //교육대상
                         '	      EDUFORM    ,     '+     //교육형태
                         '	      EDUPLACE   ,     '+     //교육장소
                         '	      EDUCNT     ,     '+     //교육인원
                         '	      CHARGEDEPT ,     '+     //주관부서
                         '	      CHARGEEMP  ,     '+     //담당자
                         '	      BMOPENYN   ,     '+     //타부문공개여부
                         '	      EDUTIME    ,     '+     //교육시간
                         '	      VALYN      ,     '+     //평가여부 O/X
                         '	      LPOINT     ,     '+     //LearningPoint
                         '	      USEYN      ,     '+     //사용여부 Y/N
                         '  (SELECT SUBSTR(ITEMNAME,1,INSTR(ITEMNAME,CHR(13))-1) FROM PEDUC WHERE SUBSTR(RABASDATE, 1, 4) = '''+FM_Main.sbase_yy+''' AND ITEMNO = A.ITEMNO) ITEMNAME' +
                         '  FROM PEIDPCRS A       '+
                         ' WHERE BASE_YY = ''%s'' '+ //역량구분
                         '   AND EDUCODE = ''%s'' '+ //교육Code
                         '   AND USEYN   = ''Y''  ', //사용여부 Y/N
                         [FM_Main.sbase_yy, EduKey]);

       Close;
       ServiceName := 'PEK2020A_sel1';
       ClearFieldInfo;

       AddField('EDUNAME'    ,ftString, 100 ); // 0
       AddField('EDUTARGET'  ,ftString, 1000); // 1
       AddField('EDUCONTENT' ,ftString, 1000); // 2
       AddField('EDUMM01'    ,ftString, 1  ); // 3
       AddField('EDUMM02'    ,ftString, 1  ); // 4
       AddField('EDUMM03'    ,ftString, 1  ); // 5
       AddField('EDUMM04'    ,ftString, 1  ); // 6
       AddField('EDUMM05'    ,ftString, 1  ); // 7
       AddField('EDUMM06'    ,ftString, 1  ); // 8
       AddField('EDUMM07'    ,ftString, 1  ); // 9
       AddField('EDUMM08'    ,ftString, 1  ); // 10
       AddField('EDUMM09'    ,ftString, 1  ); // 11
       AddField('EDUMM10'    ,ftString, 1  ); // 12
       AddField('EDUMM11'    ,ftString, 1  ); // 13
       AddField('EDUMM12'    ,ftString, 1  ); // 14
       AddField('EDUOBJECT'  ,ftString, 100 ); // 15
       AddField('EDUFORM'    ,ftString, 2   ); // 16
       AddField('EDUPLACE'   ,ftString, 50  ); // 17
       AddField('EDUCNT'     ,ftString, 10  ); // 18
       AddField('CHARGEDEPT' ,ftString, 50  ); // 19
       AddField('CHARGEEMP'  ,ftString, 20  ); // 20
       AddField('BMOPENYN'   ,ftString, 6   ); // 21
       AddField('EDUTIME'    ,ftString, 10  ); // 22
       AddField('VALYN'      ,ftString, 1   ); // 23
       AddField('LPOINT'     ,ftString, 10  ); // 24
       AddField('USEYN'      ,ftString, 1   );
       AddField('ITEMNAME'   ,ftString, 200 );

       ClearParamInfo;
       SQL.Text := SqlText;

    Memo1.text := Sql.text;

       Open;
       E_eduname.Text   := Fields[0].AsString;
       E_edutarget.Text := Fields[1].AsString;
       E_educontent.Text:= Fields[2].AsString;

       for i := 1 to 12 do
       begin
          if TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled Then
               TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Caption := '&Yes'
          Else TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Caption := '&No';

          If (pedumm = FillCharAligned(IntToStr(i),'0',2,false))  Then
          Begin
            TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Kind       := bkOK;
            TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled    := True;
            TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Font.Style := [fsBold];
          End
          Else
          Begin
           if (Fields[i+2].AsString  = 'O')  Then
           Begin
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Kind       := bkYes;
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled    := True;
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Font.Style := [];
           End
           Else
           Begin
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Kind       := bkNo;
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled    := False;
             TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Font.Style := [];
           End;
          End;
       end;

       E_eduobject.ValueCaption := Fields[15].AsString;

       If      (Fields[16].AsString = '1')  Then peduform := '온라인'
       Else If (Fields[16].AsString = '2')  Then peduform := '사내집합'
       Else If (Fields[16].AsString = '3')  Then peduform := '국내위탁' 
       Else If (Fields[16].AsString = '4')  Then peduform := 'SK그룹'   
       Else If (Fields[16].AsString = '5')  Then peduform := '어학'     
       Else If (Fields[16].AsString = '6')  Then peduform := 'MBA(회사)'
       Else If (Fields[16].AsString = '7')  Then peduform := '팀세미나' 
       Else If (Fields[16].AsString = '8')  Then peduform := '북세미나'
       Else If (Fields[16].AsString = '9')  Then peduform := '해외위탁'
       Else If (Fields[16].AsString = '10') Then peduform := '자비위탁'
       Else If (Fields[16].AsString = '11') Then peduform := '특례'     
       Else If (Fields[16].AsString = '12') Then peduform := 'T-Class'
       Else If (Fields[16].AsString = '13') Then peduform := 'MBA(자비)'
       Else peduform := '';

       E_eduform.ValueCaption   := peduform;
       E_eduplace.ValueCaption  := Fields[17].AsString;
       E_educnt.ValueCaption    := Fields[18].AsString;
       E_chargedept.ValueCaption:= Fields[19].AsString;
       E_chargeemp.ValueCaption := Fields[20].AsString;
       E_bmopenyn.ValueCaption  := Fields[21].AsString;
       E_Edutime.ValueCaption   := Fields[22].AsString;
       E_valyn.ValueCaption     := Fields[23].AsString;
       E_lpoint.ValueCaption    := Fields[24].AsString;
//       E_ITEMNAME.ValueCaption  := Fields[26].AsString;
  end;

  for i := 1 to 12 do
  begin
       TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).ModalResult  := mrNone;
  end;
end;

procedure TFEduForm.B_edumm01Click(Sender: TObject);
var
  Count, i : Integer;
begin
  for i := 1 to 12 do
  begin
       TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Font.Style  := [];
       if   TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled  then
            TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Caption := '&Yes'
       Else TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Caption := '&No';
  end;

  If  (Sender As TBitBtn).Caption = '&Yes' Then
  Begin
       (Sender As TBitBtn).Caption := '&OK';
       (Sender As TBitBtn).Font.Style := [fsBold];
  End;

  PEduMMTag := IntToStr((Sender As TBitBtn).Tag);
  if Length(PEduMMTag) = 1 Then PEduMMTag := '0' + PEduMMTag;

  with FM_Main.TMaxDataSet do
  begin
       Count := 0;

       SQL.Clear;
       SQL.Text := 'SELECT COUNT(*) SEL_DATA FROM PEIDPHIS           '+
                   ' WHERE BASE_YY = '''+ FM_Main.sbase_yy +'''      '+  //기준일
                   '   AND EMPNO   = '''+ FM_Main.Ed_empno.Text +''' '+  //사번
                   '   AND EDUCODE = '''+ EduKey +'''                ';  //교육Code

       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;

       Count := FM_Main.TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

       If Count > 0 THEN
       Begin
            with FM_Main.TMaxDataSet do
            begin
                 ServiceName := 'PEA1060A_dml';
                 Close;
                 Sql.Clear;
                 SQL.Text := 'Update PEIDPHIS                                        '+
                             '   Set EDUMM     = '''+ PEduMMTag       +''',          '+
                             '       WRITEMAN  = '''+ FM_Main.Aempno  +''',          '+
                             '       WRITETIME = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                             ' WHERE BASE_YY = '''+ FM_Main.sbase_yy +'''            '+  //기준일
                             '   AND EMPNO   = '''+ FM_Main.Ed_empno.Text +'''       '+  //사번
                             '   AND EDUCODE = '''+ EduKey +'''                      ';  //교육Code

                 if Execute then
                 begin
                      MessageDlg(' 교육일정을 저장하였습니다..', mtInformation, [mbOK], 0);
                 end
                 else
                 begin
                      MessageDlg(' 작업을 실패했습니다. 관리자에게 문의 바랍니다.', mtInformation, [mbOK], 0);
                 end;
            end;
       End;
  End;
end;

procedure TFEduForm.SaveBtnClick(Sender: TObject);
var
  SqlText : String;
  Count   : integer;
Begin
  with FM_Main.TMaxDataSet do
  begin
       Count := 0;

       SQL.Clear;
       SQL.Text := 'SELECT COUNT(*) SEL_DATA FROM PEIDPHIS           '+
                   ' WHERE BASE_YY = '''+ FM_Main.sbase_yy +'''      '+  //기준일
                   '   AND EMPNO   = '''+ FM_Main.Ed_empno.Text +''' '+  //사번
                   '   AND EDUCODE = '''+ EduKey +'''                ';  //교육Code

       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;

       Count := FM_Main.TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

       If Count > 0 THEN
       Begin
            MessageDlg('입력된 교육과정이 존재합니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
            Exit;
       End;
  End;

  with FM_Main.TMaxDataSet do  //교육일정에 해당월이 존재하는데 입력을 하지 않을경우.
  begin
       Count := 0;

       SQL.Clear;
       SQL.Text := 'SELECT COUNT(*) SEL_DATA FROM PEIDPCRS                                             '+
                   ' WHERE BASE_YY = '''+ FM_Main.sbase_yy +'''                                        '+  //기준일
                   '   AND EDUCODE   = '''+ EduKey +'''                                                '+  //교육Code
                   '   AND ((EDUMM01 IS NOT NULL) OR (EDUMM02 IS NOT NULL) OR (EDUMM03 IS NOT NULL) OR '+
                   '        (EDUMM04 IS NOT NULL) OR (EDUMM05 IS NOT NULL) OR (EDUMM06 IS NOT NULL) OR '+
                   '        (EDUMM07 IS NOT NULL) OR (EDUMM08 IS NOT NULL) OR (EDUMM09 IS NOT NULL) OR '+
                   '        (EDUMM10 IS NOT NULL) OR (EDUMM11 IS NOT NULL) OR (EDUMM12 IS NOT NULL))   ';

       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;

       Count := FM_Main.TMaxDataSet.FieldByName('SEL_DATA').AsInteger;

       If Count > 0 THEN
       Begin
            If Not ((B_edumm01.Caption = '&OK') or (B_edumm02.Caption = '&OK') or (B_edumm03.Caption = '&OK') or
                    (B_edumm04.Caption = '&OK') or (B_edumm05.Caption = '&OK') or (B_edumm06.Caption = '&OK') or
                    (B_edumm07.Caption = '&OK') or (B_edumm08.Caption = '&OK') or (B_edumm09.Caption = '&OK') or
                    (B_edumm10.Caption = '&OK') or (B_edumm11.Caption = '&OK') or (B_edumm12.Caption = '&OK')) Then
            Begin
                MessageDlg('교육일정(교육월)을 선택 하십시오.',mtWarning,[mbOK],0);
                Exit;
            End;
       End;
  End;

  with FM_Main.TMaxDataSet do
  begin
       ServiceName := 'PEA1060A_dml';
       Close;
       Sql.Clear;
       SQL.Text := 'INSERT INTO PEIDPHIS                  '+
                   '(                                     '+
                   '  BASE_YY  ,                          '+
                   '  EMPNO    ,                          '+
                   '  EDUCODE  ,                          '+
                   '  EDUMM    ,                          '+
                   '  WRITEMAN ,                          '+
                   '  WRITETIME                           '+
                   ')                                     '+
                   'VALUES                                '+
                   '( '''+ FM_Main.sbase_yy       +''' ,  '+
                   '  '''+ FM_Main.Ed_empno.Text  +''' ,  '+
                   '  '''+ EduKey                 +''' ,  '+
                   '  '''+ PEduMMTag              +''' ,  '+
                   '  '''+ FM_Main.Aempno         +''' ,  '+
                   '  to_char(sysdate,''YYYYMMDDHHMISS'') '+
                   ')                                     ';

       if Execute then
       begin
            MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
       end
       else
       begin
            MessageDlg('작업을 실패했습니다. 관리자에게 문의 바랍니다.', mtInformation, [mbOK], 0);
       End;
  end;
end;


procedure TFEduForm.DBG_EduKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Btn_SearchClick(SELF);
end;

procedure TFEduForm.DBG_EduCellClick(Column: TColumn);
begin
  Btn_SearchClick(SELF);

  If (E_eduname.Lines.Text <> '') Then SaveBtn.Enabled := True
  Else                                 SaveBtn.Enabled := False;
end;

procedure TFEduForm.Btn_SearchAllClick(Sender: TObject);
var  i : integer;
begin
  All_Search;
end;


procedure TFEduForm.B_eduSCClick(Sender: TObject);
begin
  with QR_Edu do  //교육명
  begin
    ServiceName := 'HINSA_select';
    Close;
    SQL.Clear;

    if (Sender as TOnFocusButton).Tag = 0 then
    Begin
      if (Trim(E_eduSC.Text) = '') Then
      Begin
        MessageDlg('교육과정명을 입력하시기 바랍니다.', mtInformation, [mbOK], 0);
        System.Exit;
      End;

      Sql.Add(' select educode c_edu,      ');
      Sql.Add('        eduname cn_edu,     ');
      Sql.Add('        null, null, null    ');
      Sql.Add('   FROM peidpcrs            ');
      Sql.Add('  where useyn = ''Y''       ');
      Sql.Add('    and base_yy = '''+FM_Main.sbase_yy+''' ');
      Sql.Add('  and eduname like ''%'+ E_eduSC.Text + '%''');
      Sql.Add('  ORDER BY educode          ');
    end
    Else
    Begin
      if (Trim(OC_itemname.Text) = '') Then
      Begin
        MessageDlg('직무역량을 선택하시기 바랍니다.', mtInformation, [mbOK], 0);
        System.Exit;
      End;

      Sql.Add(' select a.educode c_edu,    ');
      Sql.Add('        a.eduname cn_edu,   ');
      Sql.Add('        null, null, null    ');
      Sql.Add('   FROM peidpcrs a, PEDUC b ');
      Sql.Add('  where a.useyn   = ''Y''       ');
      Sql.Add('    and a.base_yy = '''+FM_Main.sbase_yy+'''  ');
      Sql.Add('    and a.base_yy = SUBSTR(b.RABASDATE, 1, 4) ');
      Sql.Add('    and a.itemno  = b.itemno  ');
      Sql.Add('    and b.itemname like ''%'+ OC_itemname.Text + '%''');
      Sql.Add('  ORDER BY educode          ');
    End;

    ClearFieldInfo;
    AddField('c_edu'  , ftString,  100);
    AddField('cn_edu' , ftString,  100);
    AddField('field3' , ftString,  100);
    AddField('field4' , ftString,  100);
    AddField('field5' , ftString,  100);
    Open;
  End;

  If QR_Edu.RecordCount <= 0 Then
    PL_Help.Caption := ' 교육과정이 존재하지 않습니다.'
  Else
    PL_Help.Caption := ' 교육과정이 '+intToStr(QR_Edu.RecordCount)+'건 조회되었습니다.';
end;


procedure TFEduForm.BT_HelpClick(Sender: TObject);
begin
  //직무별 RoadMap
  FHelp := TFHelp.Create(nil);
  FHelp.Show;
end;


procedure TFEduForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFEduForm.All_Clear;
var  i : integer;
begin
  L_Ekind.ValueCaption     := '';
  L_Bumoon.ValueCaption    := '';
  L_Track.ValueCaption     := '';
  L_Level.ValueCaption     := '';
  L_Educode.ValueCaption   := '';
  E_eduname.Text           := '';
  E_edutarget.Text         := '';
  E_educontent.Text        := '';
  E_eduplace.ValueCaption  := '';
  E_eduobject.ValueCaption := '';
  E_eduform.ValueCaption   := '';
  E_educnt.ValueCaption    := '';
  E_chargedept.ValueCaption:= '';
  E_chargeemp.ValueCaption := '';
  E_bmopenyn.ValueCaption  := '';
  E_Edutime.ValueCaption   := '';
  E_valyn.ValueCaption     := '';
  E_lpoint.ValueCaption    := '';

  for i := 1 to 12 do
  begin
       TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Kind    := bkNo;
       TBitBtn(Self.FindComponent('B_edumm'+FillCharAligned(IntToStr(i),'0',2,false))).Enabled := false;
  end;

  SaveBtn.Enabled := False;
end;

procedure TFEduForm.OnFocusButton1Click(Sender: TObject);
begin
  QR_Bumoon.Close;
  DBG_Bumoon.Enabled  := False;
  DBG_Bumoon.Color    := clScrollBar;
  DBG_Bumoon.BarColor := clScrollBar;

  QR_Track.Close;
  DBG_Track.Enabled  := False;
  DBG_Track.Color    := clScrollBar;
  DBG_Track.BarColor := clScrollBar;

  QR_Jikmu.Close;
  QR_Jikmu.SQL.Clear;
  DBG_Jikmu.Enabled  := False;
  DBG_Jikmu.Color    := clScrollBar;
  DBG_Jikmu.BarColor := clScrollBar;

  QR_Level.Close;
  QR_Level.SQL.Clear;
  DBG_Level.Enabled  := False;
  DBG_Level.Color    := clScrollBar;
  DBG_Level.BarColor := clScrollBar;

  L_B.Caption := '';
  L_C.Caption := '';
  L_D.Caption := '';
  L_E.Caption := '';
  L_A.Caption := QR_Ekind.Fieldbyname('c_ekind').AsString;

  All_Search;
end;

procedure TFEduForm.BT_Excel1Click(Sender: TObject);
var ObjName, FL_Prog : String;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/helpdoc','2017년 교육 LIST.XLS','List',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
end;

end.

