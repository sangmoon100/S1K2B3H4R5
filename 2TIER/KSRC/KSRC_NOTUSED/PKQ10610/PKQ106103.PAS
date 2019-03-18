{===================== Program Header ==========================================
프로그램 명 : 의료비 / 기부금 상세내역 등록.
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
     1.00       2005.12.          강륜종         최초개발본
================================================================================}


unit pkq106103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnShapeLabel, Grids, DBGrids, OnGrDBGrid,
  OnEditBtnCtrl, OnPopupEdit, OnEditStdCtrl, OnEditBaseCtrl, ComCtrls,
  OnFocusButton, Db, Tmax_DataSetText, OnEditNumCtl, OnEditCombo,
  OnEditMdate, Func, OnMemDataset, MemDS, DBAccess, Ora;

type
  TFM_detail = class(TForm)
    DataSource1: TDataSource;
    Notebook1: TNotebook;
    OnShapeLabel3: TOnShapeLabel;
    Shape1: TShape;
    Label10: TLabel;
    DB_Hosamt: TOnGrDbGrid;
    Panel16: TPanel;
    Panel53: TPanel;
    Panel52: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    E_corpname: TOnEdit;
    BB_Append: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_HosSave: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_HosDel: TOnFocusButton;
    SB_2: TOnFocusButton;
    SB_1: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    Shape2: TShape;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    E_corpname2: TOnEdit;
    E_givecnt: TOnEdit;
    E_giveamt: TOnEdit;
    BB_Append2: TOnFocusButton;
    BB_Modify2: TOnFocusButton;
    BB_GiveSave: TOnFocusButton;
    BB_cancel2: TOnFocusButton;
    BB_GiveDel: TOnFocusButton;
    E_corpno: TOnEdit;
    Panel5: TPanel;
    E_Fami: TOnComboEdit;
    E_givecod: TOnComboEdit;
    OnGrDbGrid1: TOnGrDbGrid;
    E_corpno2: TOnEdit;
    BT_Close: TOnFocusButton;
    Label3: TLabel;
    E_hosgubun: TOnComboEdit;
    Panel8: TPanel;
    HelpMemo1: TMemo;
    BB_Help: TOnFocusButton;
    HelpMemo2: TMemo;
    BB_Help2: TOnFocusButton;
    Panel10: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    E_medidate: TOnMaskEdit;
    E_cardamt: TOnNumberEdit;
    E_cashamt: TOnNumberEdit;
    E_cardcnt: TOnNumberEdit;
    E_cashcnt: TOnNumberEdit;
    E_medisum: TOnNumberEdit;
    E_givesum: TOnNumberEdit;
    bb_reload: TOnFocusButton;
    Panel12: TPanel;
    E_Ded_YN: TOnComboEdit;
    OnFocusButton2: TOnFocusButton;
    Panel13: TPanel;
    E_Fami2: TOnComboEdit;
    E_givseq: TOnEdit;
    BT_Sort: TOnFocusButton;
    E_writetime: TOnEdit;
    E_seq: TOnEdit;
    MD_Data: TOnMemData;
    MD_Dataworkyy: TStringField;
    MD_Dataempno: TStringField;
    MD_Datacorpno: TStringField;
    MD_Datafaminame: TStringField;
    MD_Datamedidate: TStringField;
    MD_Datacashcnt: TStringField;
    MD_Datacashamt: TStringField;
    MD_Datacardcnt: TStringField;
    MD_Datacardamt: TStringField;
    MD_Datamovecomment: TStringField;
    MD_Dataseq: TIntegerField;
    MD_Datawritetime: TStringField;
    Panel14: TPanel;
    E_givegubun: TOnComboEdit;
    Query1: TOraQuery;
    Query2: TOraQuery;
    Query3: TOraQuery;
    Query4: TOraQuery;
    Query5: TOraQuery;
    Query6: TOraQuery;
    Query7: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_HosSaveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_HosDelClick(Sender: TObject);
    procedure SB_2Click(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);

    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Read_HosRecords(WorkYY, EmpNO: String);
    procedure Read_HosRecords2(WorkYY, EmpNO: String);
    procedure Read_GivRecords(WorkYY, EmpNO: String);
    procedure Read_FamRecords(WorkYY, Empno, Faminame: String);
    procedure BB_GiveSaveClick(Sender: TObject);
    procedure BB_GiveDelClick(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure Check_HosRecords(WorkYY, EmpNO: String);
    procedure Check_GiveRecords(WorkYY, EmpNO: String);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_Help2Click(Sender: TObject);
    function  Check_Input : Boolean;
    procedure PL_Com_Contructor;
    procedure E_medidateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_reloadClick(Sender: TObject);
    procedure E_givecodChange(Sender: TObject);
    procedure BT_SortClick(Sender: TObject);
    procedure MD_DataAppend1(DBGrid : TDBGrid; DataSet : TDataSet); //kth 여러줄 삭제 추가   2009.02
  private
    { Private declarations }
  public
    { Public declarations }
    JobMode       : Char;
    sMsg          : String;
    SQLStr        : String;
    FG_FAMICOD, FG_FAMINAME, FG_FAMIJUMIN : String;
    FG_FAMICOD2, FG_FAMINAME2, FG_FAMIJUMIN2 : String; //2008.12 kth 기부금 기본공제 대상자 포함
    ErrFocus      : Integer;
    FG_Count      : Integer;
    FG_medidate   : String;
    sMOVECOMMENT  : String;
    iGridRowCount : Integer;
    FG_hos        : String;
  end;
  
var
  FM_detail: TFM_detail;

implementation

uses pkq106101;

{$R *.DFM}

procedure TFM_detail.PL_Com_Contructor;
begin
  with Query5 do
    begin
      Close;
{      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);}
      Sql.Clear;
    end;
end;

procedure TFM_detail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_detail.Set_Field(arg1, arg2 : Boolean );
begin
  DB_Hosamt.Enabled  := not arg1;


  if NoteBook1.ActivePage = 'P2' then   //의료비
  begin
    E_corpno.Enabled   := arg1;
    E_corpname.Enabled := arg1;
    E_cashcnt.Enabled  := arg1;
    E_cashamt.Enabled  := arg1;
    E_cardcnt.Enabled  := arg1;
    E_cardamt.Enabled  := arg1;
    E_Fami.Enabled     := arg1;
    E_hosgubun.Enabled := arg1;
    E_medidate.Enabled := arg1;
    E_Ded_YN.Enabled   := arg1;

    BB_Append.Enabled  := not(arg1);
    BB_Modify.Enabled  := not(arg1);
    BB_cancel.Enabled  := arg1;
    BB_HosSave.Enabled := arg1;
    BB_HosDel.Enabled  := not(arg1);
    bb_reload.Enabled  := not(arg1);
    bt_close.Enabled   := not(arg1);



    if arg2 then
      begin
        E_corpno.Text   := '';
        E_corpname.Text := '';
        E_cashcnt.Text  := '0';
        E_cashamt.Text  := '0';
        E_cardcnt.Text  := '0';
        E_cardamt.Text  := '0';
        E_Fami.Text     := '';
        E_hosgubun.Text := '';
        E_medidate.Text := '';
        E_Ded_YN.Text   := 'Y';
      end;

    if JobMode = 'U' then
    begin
      E_corpno.Enabled := True;    //FALSE 로 교체해야 됨.. 임시로 TRUE
      E_Fami.Enabled   := False;
    end;
  end

  else if NoteBook1.ActivePage = 'P1' then  //기부금
  begin
    E_corpno2.Enabled   := arg1;
    E_corpname2.Enabled := arg1;
    E_givecod.Enabled   := arg1;
    E_givecnt.Enabled   := arg1;
    E_giveamt.Enabled   := arg1;
    E_fami2.Enabled     := arg1;
    E_givegubun.Enabled   := arg1; //2010.01 kth 자료구분 추가
//    E_datagbn.Enabled   := arg1;

    if arg2 then
      begin
        E_corpno2.Text   := '';
        E_corpname2.Text := '';
        E_givecod.Text   := '';
        E_givecnt.Text   := '0';
        E_giveamt.Text   := '0';
        E_fami2.Text  := '';
        E_givegubun.Text  := ''; //2010.01 kth 자료구분 추가
      end;

//    if (Fpkq10601.GSGrade[3] <> 'A') and (M_KQ1030A.GSGrade[3] <> 'B') then    //2010.02.10 KTH 관리자는 수정할 수 있게 처리.
//    begin
        if JobMode = 'U' then
        begin
             E_Fami2.Enabled    := False;
             E_givegubun.Enabled    := False;  //2010.01 kth 자료구분 추가
             E_corpno2.Enabled := False;
             E_givecod.Enabled := False;
//        end;
    end;
  end;
end;

procedure TFM_detail.BT_CloseClick(Sender: TObject);
begin
  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                              '+#13+
            '   SET DEDAMT5B = (SELECT NVL(SUM(CASHAMT + CARDAMT),0) FROM PKMYSHOS_2010 '+#13+
            '                    WHERE WORKYY = A.WORKYY                    '+#13+
            '                      AND EMPNO  = A.EMPNO                     '+#13+
            '                      AND FAMINAME = A.FAMINAME                '+#13+
            '                      AND DED_YN = ''Y'')                      '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value    +'''   '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value     +'''   '+#13+
            '   AND FAMINAME  = '''+ E_Fami.Text                     +'''   ';

  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;
    end;


  Fpkq10601.Read_FamiRecords(Fpkq10601.Table1workyy.Value,Fpkq10601.Table1empno.Value);
  Read_FamRecords(Fpkq10601.Table1empno.Value, Fpkq10601.Table1empno.Value, E_Fami2.Text);
  Query1.Close;
  Query3.Close;

//  M_KQ1030A.SB_Help.Panels[1].Text := '';
  FM_detail.Close;
end;

procedure TFM_detail.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  Set_Field(True, True);
end;

procedure TFM_detail.BB_ModifyClick(Sender: TObject);
begin
  if (NoteBook1.ActivePage = 'P2') and (E_corpname.Text  <> '') then //의료비
    begin

{//대사작업기간에 알바들 수정가능토록 막음...
      if sMOVECOMMENT ='이관' then
      begin
        ShowMessage('이관된 데이터는 수정할수 없음');
        Exit;
      end; }

      JobMode := 'U';
      Set_Field(True, False);
    end;

  if (NoteBook1.ActivePage = 'P1') and (E_corpname2.Text <> '') then //기부금
    begin
      JobMode := 'U';
      Set_Field(True, False);
    end;    
end;

procedure TFM_detail.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);

  if NoteBook1.ActivePage = 'P2' then //의료비
    Read_HosRecords( Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value)
  else
    Read_GivRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
end;

procedure TFM_detail.SB_2Click(Sender: TObject); //의료비
begin
  SB_1.Enabled   := True;
  SB_2.Enabled   := False;
  NoteBook1.ActivePage := 'P2';

  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
  Read_FamRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value, '%');
end;

procedure TFM_detail.SB_1Click(Sender: TObject); //기부금
begin
  SB_1.Enabled   := False;
  SB_2.Enabled   := True;
  NoteBook1.ActivePage := 'P1';

  Read_GivRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
end;

procedure TFM_detail.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if NoteBook1.ActivePage = 'P2' then   //의료비
  begin
    with Query1 do
    begin
      JobMode         := 'F';
      E_corpno.Text   := FieldByName('CORPNO').AsString;
      E_corpname.Text := FieldByName('CORPNAME').AsString;
      E_cashcnt.Text  := FieldByName('CASHCNT').AsString;
      E_cashamt.Text  := FormatFloat('#,##0', FieldByName('CASHAMT').AsInteger);
      E_cardcnt.Text  := FieldByName('CARDCNT').AsString;
      E_cardamt.Text  := FormatFloat('#,##0', FieldByName('CARDAMT').AsInteger);
      E_fami.Text     := FieldByName('FAMINAME').AsString;
      E_medidate.Text := Copy(FieldByName('MEDIDATE').AsString,1,4)+'-'+
                         Copy(FieldByName('MEDIDATE').AsString,5,2)+'-'+
                         Copy(FieldByName('MEDIDATE').AsString,7,2);
      sMOVECOMMENT    := FieldByName('MOVECOMMENT').AsString;
      FG_hos :=  InttoStr(FieldByName('SEQ').AsInteger);

      if FieldByName('GUBUN').AsString <> '' then
      begin
        Case StrToInt(FieldByName('GUBUN').AsString) of
          0 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-본인';
          1 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-경로';
          2 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-장애';
          3 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-일반';
        end;
      end;

      E_Ded_YN.Text := FieldByName('DED_YN').AsString;

    end;
  end

  else if NoteBook1.ActivePage = 'P1' then  //기부금
  begin
    with Query1 do
    begin
      JobMode         := 'F';
      if FieldByName('GIVEGUBUN').AsString <> '' then
      begin
           if FieldByName('GIVEGUBUN').AsString ='A'  then
              E_givegubun.Text  := 'A 국세청'
           else
               E_givegubun.Text  := 'B 그밖의' ;
      end;
      E_fami2.Text    := FieldByName('FAMINAME').AsString;
      E_corpno2.Text  := FieldByName('CORPNO').AsString;
      E_corpname2.Text:= FieldByName('CORPNAME').AsString;
      E_givecod.Text  := FieldByName('GIVECOD').AsString;
      if FieldByName('GIVECOD').AsString <> '' then
      begin
        Case StrToInt(FieldByName('GIVECOD').AsString) of
          10 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-법정(100%)';
          20 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-정치(100%)';
          21 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-진흥기금(50%)';
          30 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-조특법73(50%)';
          31 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-조특법73(50%)';
          40 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-지정(15%)';
          41 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-종교단체(10%)';
//          50 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-기타(10%)';
        end;
      end;
      E_givecnt.Text  := FieldByName('GIVECNT').AsString;
      E_giveamt.Text  := FormatFloat('#,##0', FieldByName('GIVEAMT').AsInteger);
      E_givseq.text   := FieldByName('GIVSEQ').AsString;
    end;
  end;
end;

Procedure TFM_detail.Read_FamRecords(WorkYY, EmpNo, Faminame : String);
begin
  with Query3 do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO, FAMINAME,                                                                                    ');
      SQL.Add('       DECODE(FAMIREL,                                                                                             ');
      SQL.Add( '        ''00'',''0'',                                                                                            '); //본인.
      SQL.Add( '        ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''11'',''1'',''12'',''1'',''18'',''1'',''19'',''1'', '); //소득자의 직계존속
      SQL.Add( '        ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'', '); //배우자의 직계존속
      SQL.Add( '        ''01'',''3'',''06'',''3'',                                                                               '); //배우자
      SQL.Add( '        ''04'',''4'',''05'',''4'',                                                                               '); //직계비속
      SQL.Add( '        ''20'',''5'',''21'',''5'',''22'',''5'',''23'',''5'',                                                     '); //직계비속2
      SQL.Add( '        ''13'',''6'',''14'',''6'',''15'',''6'',''28'',''6'',''29'',''6'',''30'',''6'',''31'',''7'',''32'',''7'', '); //형제자매
      SQL.Add( '        ''6'')                                     FAMIREL,                                                      ');
      Sql.Add('       JUMINID,                                               ');
      Sql.Add('       AGE,                                                   ');
      Sql.Add('       nvl(DEDYN,''N'')                         DEDYN   ,     ');
      Sql.Add('       nvl(OBSYN,''N'')                         OBSYN   ,     ');
      Sql.Add('       nvl(DEDYN3,''N'')                        DEDYN3  ,     ');
      Sql.Add('       nvl(DEDAMT4A,0)                          DEDAMT4A,     ');
      Sql.Add('       nvl(DEDAMT4B,0)                          DEDAMT4B,     ');
      Sql.Add('       nvl(DEDAMT5A,0)                          DEDAMT5A,     ');
      Sql.Add('       nvl(DEDAMT5B,0)                          DEDAMT5B,     ');
      Sql.Add('       nvl(DEDAMT6A,0)                          DEDAMT6A,     ');
      Sql.Add('       nvl(DEDAMT6B,0)                          DEDAMT6B,     ');
      Sql.Add('       nvl(DEDAMT7A,0)                          DEDAMT7A,     ');
      Sql.Add('       nvl(DEDAMT7B,0)                          DEDAMT7B,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8A,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9A,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9B,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT10A,    ');
      Sql.Add('       nvl(DEDAMT4A,0) + nvl(DEDAMT4B,0)        DEDAMT4 ,     ');
      Sql.Add('       nvl(DEDAMT5A,0) + nvl(DEDAMT5B,0)        DEDAMT5 ,     ');
      Sql.Add('       nvl(DEDAMT6A,0) + nvl(DEDAMT6B,0)        DEDAMT6 ,     ');
      Sql.Add('       nvl(DEDAMT7A,0) + nvl(DEDAMT7B,0)        DEDAMT7 ,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8 ,     ');
      Sql.Add('       B.CODENAME,                                             ');
      Sql.Add('       A.BABYYN,                                               ');
      Sql.Add('       nvl(DEDAMT10B,0)                  DEDAMT10B,            '); //kth  출산여부 저장 2009.01.
      Sql.Add('       nvl(DEDAMT11A,0)                  DEDAMT11A,            '); //kth  기부금 국세청 자료 2010.01.
      Sql.Add('       nvl(DEDAMT11B,0)                  DEDAMT11B,             '); //kth  기부금 국세청 자료 2010.01.
      Sql.Add('       nvl(DEDAMT11A,0) + nvl(DEDAMT11B,0) DEDAMT11           ');
      Sql.Add('  FROM PKMYSFAModify_2010  A, PKMYSCOD B                                ');
      Sql.Add(' WHERE A.WORKYY   = '''+WorkYY   +'''                         ');
      Sql.Add('   AND A.EMPNO    = '''+Empno    +'''                         ');
      Sql.Add('   AND A.FAMINAME Like '''+Faminame +'''                      ');
      Sql.Add('   AND A.FAMIREL  = B.CODENO                                  ');
      Sql.Add(' ORDER BY A.FAMIREL                                           ');
      open;
    end;



  with Query4 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO, FAMINAME,                               ');
      SQL.Add('       DECODE(FAMIREL,                                                                                             ');
      SQL.Add( '        ''00'',''0'',                                                                                            '); //본인.
      SQL.Add( '        ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''11'',''1'',''12'',''1'',''18'',''1'',''19'',''1'', '); //소득자의 직계존속
      SQL.Add( '        ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'', '); //배우자의 직계존속
      SQL.Add( '        ''01'',''3'',''06'',''3'',                                                                               '); //배우자
      SQL.Add( '        ''04'',''4'',''05'',''4'',                                                                               '); //직계비속
      SQL.Add( '        ''20'',''5'',''21'',''5'',''22'',''5'',''23'',''5'',                                                     '); //직계비속2
      SQL.Add( '        ''13'',''6'',''14'',''6'',''15'',''6'',''28'',''6'',''29'',''6'',''30'',''6'',''31'',''7'',''32'',''7'', '); //형제자매
      SQL.Add( '        ''6'')                                     FAMIREL,                                                      ');
      Sql.Add('       JUMINID,                                               ');
      Sql.Add('       AGE,                                                   ');
      Sql.Add('       nvl(DEDYN,''N'')                         DEDYN   ,     ');
      Sql.Add('       nvl(OBSYN,''N'')                         OBSYN   ,     ');
      Sql.Add('       nvl(DEDYN3,''N'')                        DEDYN3  ,     ');
      Sql.Add('       nvl(DEDAMT4A,0)                          DEDAMT4A,     ');
      Sql.Add('       nvl(DEDAMT4B,0)                          DEDAMT4B,     ');
      Sql.Add('       nvl(DEDAMT5A,0)                          DEDAMT5A,     ');
      Sql.Add('       nvl(DEDAMT5B,0)                          DEDAMT5B,     ');
      Sql.Add('       nvl(DEDAMT6A,0)                          DEDAMT6A,     ');
      Sql.Add('       nvl(DEDAMT6B,0)                          DEDAMT6B,     ');
      Sql.Add('       nvl(DEDAMT7A,0)                          DEDAMT7A,     ');
      Sql.Add('       nvl(DEDAMT7B,0)                          DEDAMT7B,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8A,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9A,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9B,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT10A,    ');
      Sql.Add('       nvl(DEDAMT4A,0) + nvl(DEDAMT4B,0)        DEDAMT4 ,     ');
      Sql.Add('       nvl(DEDAMT5A,0) + nvl(DEDAMT5B,0)        DEDAMT5 ,     ');
      Sql.Add('       nvl(DEDAMT6A,0) + nvl(DEDAMT6B,0)        DEDAMT6 ,     ');
      Sql.Add('       nvl(DEDAMT7A,0) + nvl(DEDAMT7B,0)        DEDAMT7 ,     ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8 ,     ');
      Sql.Add('       B.CODENAME,                                             ');
      Sql.Add('       A.BABYYN,                                               ');
      Sql.Add('       nvl(DEDAMT10B,0)                       DEDAMT10B,                         ');
      Sql.Add('       nvl(DEDAMT11A,0)                       DEDAMT11A,                         ');
      Sql.Add('       nvl(DEDAMT11B,0)                       DEDAMT11B ,                        ');
      Sql.Add('       nvl(DEDAMT11A,0) + nvl(DEDAMT11B,0) DEDAMT11           ');
      Sql.Add('  FROM PKMYSFAModify_2010  A, PKMYSCOD B                                ');
      Sql.Add(' WHERE A.WORKYY   = '''+WorkYY   +'''                         ');
      Sql.Add('   AND A.EMPNO    = '''+Empno    +'''                         ');
      Sql.Add('  and A.DEDYN    = ''Y''                                     ');
      Sql.Add('   AND A.FAMINAME Like '''+Faminame +'''                      ');
      Sql.Add('   AND A.FAMIREL  = B.CODENO                                  ');
      Sql.Add(' ORDER BY A.FAMIREL                                           ');
      Open;
    end;





end;

Procedure TFM_detail.Read_HosRecords(WorkYY, EmpNo : String);
begin
 with Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY,   EMPNO,     CORPNO,    CORPNAME,         ');
      Sql.Add('       CASHCNT,  CASHAMT,   CARDCNT,   CARDAMT,          ');
      Sql.Add('       FAMICOD,  FAMINAME,  FAMIJUMIN, GUBUN,            ');
      Sql.Add('       MEDIDATE, MOVECOMMENT,                            ');
      Sql.Add('       DED_YN,                                           ');
      Sql.Add('       nvl(SEQ,9999) Seq,  WRITETIME                         ');
      Sql.Add('  FROM PKMYSHOS_2010                                          ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''                         ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''                         ');
      Sql.Add(' ORDER BY FAMINAME, MOVECOMMENT, CORPNO,CASHAMT+CARDAMT ,MEDIDATE        '); //201001 순서 변경 내년 연말 정산시 변경
      Open;

      DataSource1.OnDataChange := Nil;
      TFloatField(FieldByName('CASHAMT')).DisplayFormat  := '#,##0';
      TFloatField(FieldByName('CARDAMT')).DisplayFormat  := '#,##0';
      FieldByName('MEDIDATE').EditMask  := '!9999/99/99;0;_';
      FieldByName('CORPNO').EditMask    := '!999-99-99999;0;_';

      DataSource1.OnDataChange := DataSource1DataChange;
    end;


  with Query5 do
    begin
      PL_Com_Contructor;
      Close;
      Sql.Clear;
      Sql.Add('SELECT nvl(sum(cashamt+cardamt),0) field1, ');
      Sql.Add('       ''field2'', ''field3'',             ');
      Sql.Add('       ''field4'', ''field5''              ');
      Sql.Add('  FROM PKMYSHOS_2010                            ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''           ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''           ');
      Sql.Add('   AND DED_YN = ''Y''                      '); //의료비 내역중 공제여부 'Y'인 것만 합산.
      Open;

      E_medisum.Value := FieldByName('field1').AsFloat;
      Close;
    end;
end;

Procedure TFM_detail.Read_GivRecords(WorkYY, EmpNo : String);
begin
  with Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO,  CORPNO, CORPNAME,               ');
      Sql.Add('       GIVECOD, GIVECNT, GIVEAMT,                      ');
      Sql.Add('       FAMICOD, FAMINAME, FAMIJUMIN,GIVSEQ,GIVEGUBUN     ');  //givseq
      Sql.Add('  FROM PKMYSGIV_2010                                        ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''                       ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''                       ');
      Sql.Add(' ORDER BY FAMINAME,CORPNO,GIVECOD,GIVEAMT              ');   //201001 순서 변경 내년 연말 정산시 변경
      Open;

      DataSource1.OnDataChange := Nil;
      TFloatField(FieldByName('GIVEAMT')).DisplayFormat  := '#,##0';
      FieldByName('CORPNO').EditMask    := '!999-99-99999;0;_';
      FieldByName('CORPNO').Alignment      := taCenter;
      FieldByName('CORPNAME').Alignment    := taCenter;
      FieldByName('GIVECOD').Alignment     := taCenter;
      FieldByName('GIVECNT').Alignment     := taCenter;
      FieldByName('GIVEAMT').Alignment     := taCenter;
      FieldByName('FAMICOD').Alignment     := taCenter;
      FieldByName('FAMINAME').Alignment    := taCenter;
      FieldByName('FAMIJUMIN').Alignment   := taCenter;
      FieldByName('GIVSEQ').Alignment      := taCenter;
      FieldByName('GIVEGUBUN').Alignment   := taCenter;

      DataSource1.OnDataChange := DataSource1DataChange;
    end;


  with Query5 do
    begin
      PL_Com_Contructor;
      Close;
      Sql.Clear;
      Sql.Add('SELECT nvl(sum(GIVEAMT),0) field1, ');
      Sql.Add('       ''field2'', ''field3'',     ');
      Sql.Add('       ''field4'', ''field5''      ');
      Sql.Add('  FROM PKMYSGIV_2010                    ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''   ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''   ');
      Open;
      E_givesum.Value := FieldByName('field1').AsFloat;
      Close;
    end;  
end;

procedure TFM_detail.Check_HosRecords(WorkYY, EmpNo : String);
begin
  FG_Count := 0;
  with Query5 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT Count(*)                             ');
      Sql.Add('  FROM PKMYSHOS_2010                             ');
      Sql.Add(' WHERE WORKYY    = '''+ WorkYY +'''         ');
      Sql.Add('   AND EMPNO     = '''+ Empno  +'''         ');
      Sql.Add('   AND CORPNO    = '''+ E_corpno.Text  +''' ');
      Sql.Add('   AND FAMINAME  = '''+ E_Fami.Text    +''' ');
      Open;

      FG_Count := StrToInt(FieldByName('SEL_DATA').AsString);
    end;
  Query5.close;
end;

procedure TFM_detail.Check_GiveRecords(WorkYY, EmpNo : String);
begin
  FG_Count := 0;
  with Query5 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT Count(*)                           ');
      Sql.Add('  FROM PKMYSGIV_2010                           ');
      Sql.Add(' WHERE WORKYY  = '''+ WorkYY          +''' ');
      Sql.Add('   AND EMPNO   = '''+ Empno           +''' ');
      Sql.Add('   AND CORPNO  = '''+ E_corpno2.Text  +''' ');
      Sql.Add('   AND GIVECOD = '''+ E_givecod.Text  +''' ');
      Open;

//      FG_Count := StrToInt(FieldByName('SEL_DATA').AsString);
    end;
  Query5.close;
end;

procedure TFM_detail.BB_HosSaveClick(Sender: TObject);
var
   Hos_seq        : String;
begin
  FG_FAMICOD   := '';
  FG_FAMINAME  := '';
  FG_FAMIJUMIN := '';

  if E_cashcnt.Text = '' then E_cashcnt.Text := '0';
  if E_cashamt.Text = '' then E_cashamt.Text := '0';
  if E_cardcnt.Text = '' then E_cardcnt.Text := '0';
  if E_cardamt.Text = '' then E_cardamt.Text := '0';





  with Query2 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1) SEQ,   ');
       Sql.Add('      ''field2'', ''field3'',        ');
       Sql.Add('      ''field4'', ''field5''         ');
       Sql.Add('  FROM PKMYSHOS_2010                      ');
       Sql.Add(' WHERE WORKYY ='''+ Fpkq10601.Table1workyy.Value          +'''  ');
       Sql.Add('  AND EMPNO   ='''+ Fpkq10601.Table1empno.Value  +''' ');
       Open;
       if not Query2.eof then
          HOS_Seq :=  Query2.FieldByName('SEQ').AsString
       else
          HOS_Seq := '1';
  end;

  if not Check_Input then
    Exit;

{  Check_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  if (JobMode = 'I') and (FG_Count > 0) then
  begin
    MessageDlg(E_Fami.Text+'의 해당 사업장은 기 등록된 데이터입니다. 수정등록하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end; }

  Read_FamRecords(Fpkq10601.Table1workyy.Value,  Fpkq10601.Table1empno.Value, E_Fami.Text);
  with Query3 do
    begin
      FG_FAMICOD   := FieldByName('FAMIREL').AsString;   //가족코드(의료비 지급조서 기준)
      FG_FAMINAME  := FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN := FieldByName('JUMINID').AsString;
      Close;
    end;


  if (Trim(FG_FAMICOD) = '')  then
  begin
    MessageDlg('가족을 등록 해주시기 바랍니다. ',mtInformation,[mbOK],0);
    E_Fami.Setfocus;
    Exit;
  end;


  FG_medidate := Copy(E_medidate.Text,1,4)+Copy(E_medidate.Text,6,2)+Copy(E_medidate.Text,9,2);

  if (Trim(FG_medidate) = '')  then
  begin
       MessageDlg('의료일자를 등록 해주시기 바랍니다. ',mtInformation,[mbOK],0);
       E_medidate.SetFocus;
       Exit;
  end;





  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSHOS_2010                                     '+
                '   (WORKYY,  EMPNO,    CORPNO,  CORPNAME,                '+
                '    CASHCNT, CASHAMT,  CARDCNT,   CARDAMT,               '+
                '    FAMICOD, FAMINAME, FAMIJUMIN, GUBUN,                 '+
                '    WRITEMAN,WRITETIME,MEDIDATE,  MOVECOMMENT,           '+
                '    DED_YN,SEQ )                                             '+
                '  VALUES                                                 '+
                '   ('''+ Fpkq10601.Table1workyy.Value          +''',                '+
                '    '''+ Fpkq10601.Table1empno.Value    +''',                '+
                '    '''+ E_corpno.Text              +''',                '+
                '    '''+ E_corpname.Text            +''',                '+
                '    '''+ E_cashcnt.Text             +''',                '+
                '    '''+ FloatToStr(E_cashamt.Value)+''',                '+
                '    '''+ E_cardcnt.Text             +''',                '+
                '    '''+ FloatToStr(E_cardamt.Value)+''',                '+
                '    '''+ FG_FAMICOD                 +''',                '+
                '    '''+ FG_FAMINAME                +''',                '+
                '    '''+ FG_FAMIJUMIN               +''',                '+
                '    '''+ Copy(E_hosgubun.Text,1,1)  +''',                '+
                '    '''+ Fpkq10601.GSEmpno          +''',                '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),                 '+
                '    '''+ FG_medidate                +''',                '+
                '    ''신규'',                                            '+
                '    '''+ E_Ded_YN.Text              +''',                '+
                '    '''+ HOS_Seq                    +'''                 '+
                '   ) ';
    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSHOS_2010  SET                                           '+
                '       CORPNO    = '''+ E_corpno.Text                   +''',   '+
                '       CORPNAME  = '''+ E_corpname.Text                 +''',  '+
                '       CASHCNT   = '''+ E_cashcnt.Text                  +''',  '+
                '       CASHAMT   = '''+ FloatToStr(E_cashamt.Value)     +''',  '+
                '       CARDCNT   = '''+ E_cardcnt.Text                  +''',  '+
                '       CARDAMT   = '''+ FloatToStr(E_cardamt.Value)     +''',  '+
                '       FAMICOD   = '''+ FG_FAMICOD                      +''',  '+
                '       FAMINAME  = '''+ FG_FAMINAME                     +''',  '+
                '       FAMIJUMIN = '''+ FG_FAMIJUMIN                    +''',  '+
                '       GUBUN     = '''+ Copy(E_hosgubun.Text,1,1)       +''',  '+
                '       DED_YN    = '''+ E_Ded_YN.Text                   +''',  '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),        '+
                '       WRITEMAN  = '''+ Fpkq10601.GSEmpno               +''',  '+
                '       MEDIDATE  = '''+ FG_medidate                     +'''   '+
                ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value                +'''   '+
                '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value         +'''   '+
//                '   AND CORPNO    = '''+ E_corpno.Text                   +'''   '+
                '   AND FAMINAME  = '''+ E_Fami.Text                     +'''   '+
                '   AND MEDIDATE  = '''+ FG_medidate                     +'''   '+
                '   AND SEQ       = '''+ FG_hos                      +'''                 ';
    end
  else
    System.Exit;




  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;
    end;

  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.

  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                              '+#13+
            '   SET DEDAMT5B = (SELECT SUM(CASHAMT + CARDAMT) FROM PKMYSHOS_2010 '+#13+
            '                    WHERE WORKYY = A.WORKYY                    '+#13+
            '                      AND EMPNO  = A.EMPNO                     '+#13+
            '                      AND FAMINAME = A.FAMINAME                '+#13+
            '                      AND DED_YN = ''Y'')                       '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value                +'''   '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value          +'''   '+#13+
            '   AND FAMINAME  = '''+ E_Fami.Text                     +'''   ';

  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL
    end;
  //////////////////////////////////////////////////////////////////////////////

  //의료비 내역을 다시 조회
  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);

  Set_Field(False, False);
end;

procedure TFM_detail.BB_HosDelClick(Sender: TObject);
var
    i : Integer;
begin

  if MessageDlg('의료비 등록사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  if DB_Hosamt.SelectedRows.Count < 1 then
  begin
     ShowMessage( '삭제할 행을 선택하십시오.' );
     System.Exit;
  end;

  for i := 0 to DB_Hosamt.SelectedRows.Count -1 do
  begin
//       DB_Hosamt.Bookmark(pointer(DB_Hosamt.SelectedRows.Items[i]);
       Query1.GotoBookmark(pointer(DB_Hosamt.SelectedRows.Items[i]));
//       DB_Hosamt.SelectedRows.Items[i].

//       GotoBookmark(pointer(DB_Hosamt.SelectedRows.Items[i]));

      FG_medidate :=DB_Hosamt.Fields[4].AsString; //Copy(E_medidate.Text,1,4)+Copy(E_medidate.Text,6,2)+Copy(E_medidate.Text,9,2);




      SQLStr  := 'DELETE PKMYSHOS_2010                                                   '+
                 ' WHERE WORKYY      = '''+   Fpkq10601.Table1workyy.Value                +'''  '+
                 '   AND EMPNO       = '''+   Fpkq10601.Table1empno.Value          +'''  '+
                 '   AND CORPNO      = '''+   DB_Hosamt.Fields[5].AsString    +'''  '+
                 '   AND FAMINAME    = '''+   DB_Hosamt.Fields[1].AsString    +'''  '+
                 '   AND MEDIDATE    = '''+   DB_Hosamt.Fields[4].AsString    +'''  '+
         format( '   AND CASHCNT     = %f ', [DB_Hosamt.Fields[7].AsFloat])   +
         format( '   AND CASHAMT     = %f ', [DB_Hosamt.Fields[8].AsFloat])   +
         format( '   AND CARDCNT     = %f ', [DB_Hosamt.Fields[9].AsFloat])   +
         format( '   AND CARDAMT     = %f ', [DB_Hosamt.Fields[10].AsFloat])  +
                 '   AND MOVECOMMENT = '''+   DB_Hosamt.Fields[12].AsString   +'''  '+
           format( ' AND nvl(SEQ,''9999'')         = %s ',[floattostr(DB_Hosamt.Fields[13].AsFloat)]) +
                 '   AND WRITETIME   = '''+ DB_Hosamt.Fields[14].AsString   +'''    ';

          with Query6 do
          begin
               Close;
               Sql.Clear;
               Sql.Add(SQLStr);
               ExecSQL
          end;

  end;



  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                              '+#13+
            '   SET DEDAMT5B = (SELECT SUM(CASHAMT + CARDAMT) FROM PKMYSHOS_2010 '+#13+
            '                    WHERE WORKYY = A.WORKYY                    '+#13+
            '                      AND EMPNO  = A.EMPNO                     '+#13+
            '                      AND FAMINAME = A.FAMINAME)               '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value                +'''   '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value          +'''   ';


  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;

    end;
  //////////////////////////////////////////////////////////////////////////////

  Read_HosRecords(Fpkq10601.Table1workyy.Value,  Fpkq10601.Table1empno.Value);     //다시읽기 막음....
end;


procedure TFM_detail.BB_GiveSaveClick(Sender: TObject);
var
   Chk_Seq : String;
begin
  if not Check_Input then
    Exit;

  FG_FAMICOD   := '';
  FG_FAMINAME  := '';
  FG_FAMIJUMIN := '';

  Check_GiveRecords(Fpkq10601.Table1workyy.Value,  Fpkq10601.Table1empno.Value );

  Read_FamRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value, E_Fami2.Text);
  with Query3 do
    begin
      FG_FAMICOD   := FieldByName('FAMIREL').AsString;   //가족코드(의료비 지급조서 기준)
      FG_FAMINAME  := FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN := FieldByName('JUMINID').AsString;
      Close;
    end;


  with Query2 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT TO_CHAR(NVL(MAX(GIVSEQ),0)+1) GIVSEQ,              ');
       Sql.Add('      ''field2'', ''field3'',                             ');
       Sql.Add('      ''field4'', ''field5''                              ');
       Sql.Add('  FROM PKMYSGIV_2010                                           ');
       Sql.Add(' WHERE WORKYY  ='''+ Fpkq10601.Table1workyy.Value                +''' ');
       Sql.Add('   AND EMPNO   ='''+ Fpkq10601.Table1empno.Value  +'''         ');
       Sql.Add('   AND TRIM(GIVSEQ)  < ''9000''                           ');  //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리
       Open;
       if not Query2.eof then
          Chk_Seq :=  Query2.FieldByName('GIVSEQ').AsString
       else
          Chk_Seq := '1';
  end;

  if  E_givecnt.Text = '0'then
  begin
       MessageDlg('금액을 입력 해주세요..',mtError, [mbOk],0);
       System.Exit;
  end;


  if  E_giveamt.Text = '0' then
  begin
       MessageDlg('금액을 입력 해주세요..',mtError, [mbOk],0);
       System.Exit;
  end;

  if (Trim(FG_FAMICOD) = '')  then
  begin
    MessageDlg('가족을 등록 해주시기 바랍니다. ',mtInformation,[mbOK],0);
    Exit;
  end;

  if (JobMode = 'I') and (FG_Count > 0) then
  begin
    MessageDlg('해당 사업장은 기 등록된 사업장입니다. 수정하여 등록하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end;

  if  Copy(Trim(E_givegubun.Text),1,1) = '' then
  begin
    MessageDlg('기부금 구분을 등록 해주시기 바랍니다. .',mtInformation,[mbOK],0);
    Exit;
  end;

  if  Chk_Seq > '9000'then   //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리
  begin
       MessageDlg('선택하신 자료는 관리자 등록 데이터 입니다. 수정 입력 할 수 없습니다. ..',mtError, [mbOk],0);
       System.Exit;
  end;


  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSGIV_2010       '+
                '   (WORKYY,    EMPNO,      '+
                '    CORPNO,    CORPNAME,   '+
                '    GIVECOD,   GIVECNT,    '+
                '    GIVEAMT,               '+
                '    WRITEMAN,  WRITETIME, GIVSEQ, FAMICOD,          '+  //GIVSEQ,
                '    FAMINAME, FAMIJUMIN,GIVEGUBUN )                         '+
                '  VALUES                                          '+
                '   ('''+ Fpkq10601.Table1workyy.Value                 +''',    '+
                '    '''+ Fpkq10601.Table1empno.Value          +''',    '+
                '    '''+ E_corpno2.Text                  +''',    '+
                '    '''+ E_corpname2.Text                +''',    '+
                '    '''+ Copy(E_givecod.Text,1,2)        +''',    '+
                '    '''+ E_givecnt.Text                  +''',    '+
                '    Replace('''+ E_giveamt.Text +''','','',''''), '+
                '    '''+ Fpkq10601.GSEmpno               +''',    '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),          '+
                '    '''+ Chk_Seq                    +''',         '+
                '    '''+ FG_FAMICOD                 +''',         '+
                '    '''+ FG_FAMINAME                +''',         '+
                '    '''+ FG_FAMIJUMIN               +''',         '+
                '    '''+ Copy(Trim(E_givegubun.Text),1,1)   +'''  '+
                '   )                                              ';
    end
  else if JobMode = 'U' then
  begin


       if TRIM(E_givseq.Text) > '9000'then   //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리
       begin
            MessageDlg('선택하신 자료는 관리자 등록 데이터 입니다. 수정 할 수 없습니다. ..',mtError, [mbOk],0);
            System.Exit;
       end;

       SQLStr := 'UPDATE PKMYSGIV_2010  SET                           '+
                 '       CORPNO    = '''+ E_corpno2.Text        +''', '+
                 '       CORPNAME  = '''+ E_corpname2.Text        +''', '+
                 '       GIVECOD   = '''+ Copy(E_givecod.Text,1,2)+''', '+
                 '       GIVECNT   = '''+ E_givecnt.Text          +''', '+
                 '       GIVEAMT   = Replace('''+ E_giveamt.Text  +''','','',''''), '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                 '       WRITEMAN  = '''+ Fpkq10601.GSEmpno       +''',  '+
                 '       FAMICOD   = '''+ FG_FAMICOD                      +''',  '+
                 '       FAMINAME  = '''+ FG_FAMINAME                     +''',  '+
                 '       FAMIJUMIN = '''+ FG_FAMIJUMIN                    +''',  '+
                 '       GIVEGUBUN   = '''+ Copy(Trim(E_givegubun.Text),1,1)        +'''   '+
                 ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value        +'''  '+
                 '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value      +'''  '+
//                 '   AND CORPNO    = '''+ E_corpno2.Text          +'''  '+
                 '   AND GIVECOD   = '''+ Copy(E_givecod.Text,1,2)+'''  '+
                 '   AND GIVSEQ    = '''+ TRIM(E_givseq.Text)           +'''  '+
                 '   AND GIVSEQ    < ''9000''                           ';

    end
  else
    System.Exit;

  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;
    end;


  /////////////////////////////////////////////////////////////////////////////
  with Query5 do
  begin    //기부금 내역 등록 화면 뿌려주기.
           //기부금 종류 : 0전액100%  1정치100%  2특례50%  3지정20%  4.종교10%,기타10%
    Close;
    Sql.Clear;
    Sql.Add('SELECT decode(GIVECOD,''10'',0,                 ');
    Sql.Add('                      ''20'',1,                 ');
    Sql.Add('                      ''21'',2,                 ');
    Sql.Add('                      ''30'',2,                 ');
    Sql.Add('                      ''31'',2,                 ');
    Sql.Add('                      ''40'',3,                 ');
    Sql.Add('                      ''41'',4,                 ');
    Sql.Add('                      ''50'',4,     '' '')      ');
    Sql.Add('       ||SUM(GIVEAMT)                           ');
    Sql.Add('  FROM PKMYSGIV_2010                                 ');
    SQL.Add(' WHERE WORKYY = '''+ Fpkq10601.Table1workyy.Value      +''' ');
    SQL.Add('   AND EMPNO  = '''+ Fpkq10601.Table1empno.Value+''' ');
    SQL.Add(' GROUP BY decode(GIVECOD,''10'',0,''20'',1,''21'',2,''30'',2,''31'',2,''40'',3,''41'',4,''50'',4,'' '')');
    Open;

{    M_KQ1030A.NE_AGiveAmt.Value  := 0;
    M_KQ1030A.NE_PoliAmt.Value   := 0;
    M_KQ1030A.NE_SPGiveAmt.Value := 0;
    M_KQ1030A.NE_PGiveAmt.Value  := 0;
    M_KQ1030A.NE_PGiveAmt2.Value := 0;
    First;
    while not Query5.eof do
    begin
      Case StrToInt(Copy(FieldByName('SEL_DATA').AsString,1,1)) of
        0 : M_KQ1030A.NE_AGiveAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        1 : M_KQ1030A.NE_PoliAmt.Value  := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        2 : M_KQ1030A.NE_SPGiveAmt.Value:= StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        3 : M_KQ1030A.NE_PGiveAmt2.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        4 : M_KQ1030A.NE_PGiveAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
      end;
      Next;
    end;  }
    Query5.Close;
  end;

  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                          '+#13+
          '    SET DEDAMT11A = (SELECT SUM(GIVEAMT) FROM PKMYSGIV_2010        '+#13+
          '                    WHERE WORKYY = A.WORKYY                  '+#13+
          '                      AND EMPNO  = A.EMPNO                   '+#13+
          '                      AND FAMINAME = A.FAMINAME              '+#13+
          '                      AND GIVEGUBUN  =''A''          ),       '+#13+
          '        DEDAMT11B = (SELECT SUM(GIVEAMT) FROM PKMYSGIV_2010        '+#13+
          '                    WHERE WORKYY = A.WORKYY                  '+#13+
          '                      AND EMPNO  = A.EMPNO                   '+#13+
          '                      AND FAMINAME = A.FAMINAME              '+#13+
          '                      AND GIVEGUBUN  =''B''          )        '+#13+
          ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value              +'''   '+#13+
          '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value        +'''   '+#13+
          '   AND FAMINAME  = '''+ E_Fami2.Text                  +'''   ';

  with Query6 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(SQLStr);
       ExecSQL;
  end;
// kth 2009.01 기부금 PKMYSAPP 테이블에 입력



// kth 2008.12 기부금 등록 가족
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                          '+#13+
          '    SET DEDAMT11A = (SELECT SUM(GIVEAMT) FROM PKMYSGIV_2010        '+#13+
          '                    WHERE WORKYY = A.WORKYY                  '+#13+
          '                      AND EMPNO  = A.EMPNO                   '+#13+
          '                      AND FAMINAME = A.FAMINAME              '+#13+
          '                      AND GIVEGUBUN  =''A''          ),       '+#13+
          '        DEDAMT11B = (SELECT SUM(GIVEAMT) FROM PKMYSGIV_2010        '+#13+
          '                    WHERE WORKYY = A.WORKYY                  '+#13+
          '                      AND EMPNO  = A.EMPNO                   '+#13+
          '                      AND FAMINAME = A.FAMINAME              '+#13+
          '                      AND GIVEGUBUN  =''B''          )        '+#13+
          ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value              +'''   '+#13+
          '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value        +'''   '+#13+
          '   AND FAMINAME  = '''+ E_Fami2.Text                  +'''   ';

  with Query6 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(SQLStr);
       ExecSQL;

  end;
  //////////////////////////////////////////////////////////////////////////////


  /////////////////////////////////////////////////////////////////////////////


//  Read_GivRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value );
  Read_FamRecords(Fpkq10601.Table1empno.Value, Fpkq10601.Table1empno.Value, E_Fami2.Text);

  Set_Field(False, False);
end;

procedure TFM_detail.BB_GiveDelClick(Sender: TObject);
begin
  if MessageDlg('기부금 등록사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;


  if  E_givseq.Text > '9000'then    //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리
  begin
       MessageDlg('선택하신 자료는 관리자 등록 데이터 입니다. 삭제 할 수 없습니다. ..',mtError, [mbOk],0);
       System.Exit;
  end;


    

  SQLStr  := 'DELETE PKMYSGIV_2010  '+
             ' WHERE WORKYY          = '''+ Fpkq10601.Table1workyy.Value        +''' '+
             '   AND EMPNO           = '''+ Fpkq10601.Table1empno.Value  +''' '+
             '   AND Trim(CORPNO)    = '''+ E_corpno2.Text          +''' '+
             '   AND GIVECOD         = '''+ Copy(E_givecod.Text,1,2)+''' '+
             '   AND GIVSEQ          = '''+ E_givseq.Text           +''' '+
             '   AND GIVSEQ          < ''9000''                           ';    //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리

  with Query6 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;
    end;

// kth 2008.12 기부금 등록 가족
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                           '+#13+
          '   SET DEDAMT11A = (SELECT NVL(SUM(GIVEAMT),0) FROM PKMYSGIV_2010  '+#13+
          '                    WHERE WORKYY = A.WORKYY                   '+#13+
          '                      AND EMPNO  = A.EMPNO                    '+#13+
          '                      AND FAMINAME = A.FAMINAME               '+#13+
          '                      AND GIVEGUBUN  =''A''),                  '+#13+
          '        DEDAMT11B = (SELECT NVL(SUM(GIVEAMT),0) FROM PKMYSGIV_2010  '+#13+
          '                    WHERE WORKYY = A.WORKYY                   '+#13+
          '                      AND EMPNO  = A.EMPNO                    '+#13+
          '                      AND FAMINAME = A.FAMINAME               '+#13+
          '                      AND GIVEGUBUN  =''B'')                  '+#13+
          ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value              +'''  '+#13+
          '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value          +'''  '+#13+
          '   AND FAMINAME  = '''+ E_Fami2.Text                     +''' ';    //2010.01 KTH 9001 이상 번호는 관리자 입력한 자료 여서 삭제 수정 안되게 처리

  with Query6 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(SQLStr);
       ExecSQL;
  end;
  Read_GivRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
end;

procedure TFM_detail.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_detail.BB_Help2Click(Sender: TObject);
begin
  if HelpMemo2.Visible then
    HelpMemo2.Visible := False
  else
    HelpMemo2.Visible := True;
end;

function TFM_detail.Check_Input : Boolean;
var
   Temp : Real;
begin
  result := True;

  if NoteBook1.ActivePage = 'P2' then   //의료비
  begin
      if Pos('-',E_corpno.Text) > 0 then
      begin
        MessageDlg('사업자 등록번호는 숫자만 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if (E_corpno.Text < '       ') or ( Length(E_corpno.Text) < 10 ) then
      begin
        MessageDlg('사업자 등록번호를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_corpname.Text < '       ' then
      begin
        MessageDlg('사업자 명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_cashcnt.Text  < '0' then
      begin
        MessageDlg('지급건수를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_cashamt.Text  < '0' then
      begin
        MessageDlg('사업자별 현금 지급총액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_Fami.Text     < '            ' then
      begin
        MessageDlg('공제가족을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_hosgubun.Text < '      ' then
      begin
        MessageDlg('의료비구분을 선택하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;

      if Length(Trim(E_medidate.Text)) <> 10 then
      begin
        MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
        E_medidate.SetFocus;
        result := false;
      end;

      Try
        Temp := StrToDate(E_medidate.Text);
      Except on EConvertError do
        begin
          MessageDlg('지급일자를 정확히 입력하여 주시기 바랍니다.',mtError, [mbOk],0);
          E_medidate.SetFocus;
          Result  := False;
        end;
      end;

      if (Removechar(E_medidate.Text,'-') < Fpkq10601.Table1workyy.Value+'0101') or   //2007년도 수정해야함.
         (Removechar(E_medidate.Text,'-') > Fpkq10601.Table1workyy.Value+'1231') then
      begin
          MessageDlg(Fpkq10601.Table1workyy.Value +'년 연 의료비 내역은        '+#13+#13+
                     Fpkq10601.Table1workyy.Value +'.01.01 ∼ '+Fpkq10601.Table1workyy.Value+'.12.31. 까지의'+#13+#13+
                    ' 의료비 내역입니다.',mtInformation,[mbOK],0);
        E_medidate.Text := '';
        E_medidate.SetFocus;
        result := false;
      end;
  end

  else if NoteBook1.ActivePage = 'P1' then  //기부금
  begin
      if Pos('-',E_corpno2.Text) > 0 then
      begin
        MessageDlg('사업자 등록번호는 숫자만 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_corpno2.Text   < '          ' then
      begin
        MessageDlg('사업자 등록번호를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if (Copy(E_givecod.Text,1,2)='20') and (E_corpno2.Text < '          ') then
      begin
        MessageDlg('정치기부금의 경우 사업자 등록번호에 1111111111를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;

//      if (Copy(E_givecod.Text,1,2)<>'20') and (E_corpname2.Text < '          ') then
      if  Trim(E_corpname2.Text) < '  ' then
      begin
        MessageDlg('사업자 명을 입력하여 주시기 바랍니다. '+#13+#13+
                   '정치기부금의 경우 실제 기부정당명 또는 "정당" 이라고 입력.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_givecod.Text < '    ' then
      begin
        MessageDlg('기부코드를 선택하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_givecnt.Text  < '0' then
      begin
        MessageDlg('기부건수를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_giveamt.Text  < '0' then
      begin
        MessageDlg('사업자별 기부총액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
  end;
end;

procedure TFM_detail.E_medidateExit(Sender: TObject);
begin
  if (Removechar(E_medidate.Text,'-') < Fpkq10601.Table1workyy.Value+'0101') or
     (Removechar(E_medidate.Text,'-') > Fpkq10601.Table1workyy.Value+'1231') then
  begin
       MessageDlg(Fpkq10601.Table1workyy.Value +'년 연 의료비 내역은        '+#13+#13+
                  Fpkq10601.Table1workyy.Value +'.01.01 ∼ '+Fpkq10601.Table1workyy.Value+'.12.31. 까지의'+#13+#13+
                 ' 의료비 내역입니다.',mtInformation,[mbOK],0);
       E_medidate.Text := '';
  end;
end;

procedure TFM_detail.FormShow(Sender: TObject);
var
  i : Integer;
begin
  SB_2Click(Self);


  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
  Read_FamRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value, '%');

  with Query3 do
  begin
    E_Fami.Items.Clear;
    E_Fami.DropDownRows := RecordCount;
    first;
    for i := 1 to RecordCount do
    begin
      E_Fami.Items.Add(FieldByName('FAMINAME').AsString);
      next;
    end;
  end;

  with Query4 do
  begin
    E_Fami2.Items.Clear;
    E_Fami2.DropDownRows := RecordCount;
    first;
    for i := 1 to RecordCount do
    begin
      if (FieldByName('FAMIREL').AsString ='0') or
         (FieldByName('FAMIREL').AsString ='3') or
         (FieldByName('FAMIREL').AsString ='4') or
         (FieldByName('FAMIREL').AsString ='5') then
          E_Fami2.Items.Add(FieldByName('FAMINAME').AsString);

      next;
    end;
  end;


  Set_Field(False,True);
end;

procedure TFM_detail.bb_reloadClick(Sender: TObject);
begin
  if NoteBook1.ActivePage = 'P2' then //의료비
    Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value)
  else
    Read_GivRecords(Fpkq10601.Table1workyy.Value,Fpkq10601.Table1empno.Value);
end;

procedure TFM_detail.E_givecodChange(Sender: TObject);
begin

  //2008.12 kth 기부금 기본공제 대상자 포함
  Read_FamRecords(Fpkq10601.Table1empno.Value, Fpkq10601.Table1empno.Value, E_Fami2.Text);
  with Query3 do
    begin
      FG_FAMICOD2   := FieldByName('FAMIREL').AsString;
      FG_FAMINAME2  := FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN2 := FieldByName('JUMINID').AsString;
      Close;
    end;
      if  Copy(E_givecod.Text,1,2) = '20' then
      begin
            if FG_FAMICOD2 <> '0' then
            begin
                 MessageDlg('정치 기부금은 본인만 신청 가능합니다. . ',mtError, [mbOk],0);
                 E_givecod.Text := '';
                 System.Exit;
            end;
      end;
   //2008.12 kth 기부금 기본공제 대상자 포함
end;

Procedure TFM_detail.Read_HosRecords2(WorkYY, EmpNo : String);
begin
 with Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY,   EMPNO,     CORPNO,    CORPNAME,  ');
      Sql.Add('       CASHCNT,  CASHAMT,   CARDCNT,   CARDAMT,   ');
      Sql.Add('       FAMICOD,  FAMINAME,  FAMIJUMIN, GUBUN,     ');
      Sql.Add('       MEDIDATE, MOVECOMMENT, DED_YN,nvl(SEQ,9999),WRITETIME');
      Sql.Add('  FROM PKMYSHOS_2010                                   ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''                  ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''                  ');
      Sql.Add(' ORDER BY  FAMINAME, CORPNO,  MEDIDATE            ');
      Open;

      DataSource1.OnDataChange := Nil;
      TFloatField(FieldByName('CASHAMT')).DisplayFormat  := '#,##0';
      TFloatField(FieldByName('CARDAMT')).DisplayFormat  := '#,##0';
      FieldByName('MEDIDATE').EditMask  := '!9999/99/99;0;_';
      FieldByName('CORPNO').EditMask    := '!999-99-99999;0;_';
      DataSource1.OnDataChange := DataSource1DataChange;
    end;


  with Query5 do
    begin
      PL_Com_Contructor;
      Close;
      Sql.Clear;
      Sql.Add('SELECT nvl(sum(cashamt+cardamt),0) field1, ');
      Sql.Add('       ''field2'', ''field3'',             ');
      Sql.Add('       ''field4'', ''field5''              ');
      Sql.Add('  FROM PKMYSHOS_2010                            ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''           ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''           ');
      Sql.Add('   AND DED_YN = ''Y''                      '); //의료비 내역중 공제여부 'Y'인 것만 합산.
      Open;

      E_medisum.Value := FieldByName('field1').AsFloat;
      Close;
    end;
end;



procedure TFM_detail.BT_SortClick(Sender: TObject);
begin
    Read_HosRecords2(Fpkq10601.Table1empno.Value, Fpkq10601.Table1empno.Value)
end;

//승인저장 MD_Data
procedure TFM_detail.MD_DataAppend1(DBGrid : TDBGrid; DataSet : TDataSet);
var
   i : Integer;
begin
{  MD_Data.Close;

  if  not Chk_All.Checked  then
  begin
       for i := 0 to DBGrid.SelectedRows.Count -1 do
       begin
            DataSet.GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
            MD_Data.Open;
            MD_Data.Append;
            MD_Data.FieldByName('appdate').AsString    := DataSet.FieldByName('appdate').AsString;
            MD_Data.FieldByName('empno').AsString      := DataSet.FieldByName('empno').AsString;
            MD_Data.FieldByName('seq').AsString        := DataSet.FieldByName('seq').AsString;
            MD_Data.FieldByName('conyn').AsString      := 'Y';
            MD_Data.FieldByName('conynsayu').AsString  := E_bigo.Text;

            if      PageControl1.ActivePage = TabSheet1 then MD_Data.FieldByName('exceptamt').AsFloat := NE_Except.Value
            else if PageControl1.ActivePage = TabSheet2 then
            begin
                 MD_Data.FieldByName('exceptamt').AsFloat := DataSet.FieldByName('exceptamt').AsFloat;
                 MD_Data.FieldByName('setcomm').AsString  := E_setcomm.Text;
                 MD_Data.FieldByName('setamt').AsFloat    := NE_Setamt.Value;
                 MD_Data.FieldByName('preamt').AsFloat    := NE_Preamt.Value;
                 MD_Data.FieldByName('division2').AsFloat := NE_division2.Value;
            end;
            MD_Data.Post;
            DBGrid.SelectedRows.CurrentRowSelected := True;
            DataSet.Next;
       end;
  end; }
end;

end.

