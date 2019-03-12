{===================== Program Header ==========================================
프로그램 명 : 의료비 / 기부금 상세내역 등록.
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
     1.00       2005.12.          강륜종         최초개발본
================================================================================}


unit PSH1020A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnShapeLabel, Grids, DBGrids, OnGrDBGrid,
  OnEditBtnCtrl, OnPopupEdit, OnEditStdCtrl, OnEditBaseCtrl, ComCtrls,
  OnFocusButton, Db, Tmax_DataSetText, OnEditNumCtl, OnEditCombo;

type
  TFM_detail = class(TForm)
    DataSource1: TDataSource;
    TDS_Detail: TTMaxDataSet;
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
    E_cashcnt: TOnEdit;
    E_cashamt: TOnEdit;
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
    BT_close: TOnFocusButton;
    Label3: TLabel;
    E_hosgubun: TOnComboEdit;
    Panel8: TPanel;
    HelpMemo1: TMemo;
    BB_Help: TOnFocusButton;
    HelpMemo2: TMemo;
    BB_Help2: TOnFocusButton;
    TDS_Fami2: TTMaxDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_HosSaveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_HosDelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SB_2Click(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);

    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Read_HosRecords(WorkYY, EmpNO: String);
    procedure Read_GivRecords(WorkYY, EmpNO: String);
    procedure Read_FamRecords(WorkYY, Empno, Faminame: String);
    procedure BB_GiveSaveClick(Sender: TObject);
    procedure BB_GiveDelClick(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure Check_HosRecords(WorkYY, EmpNO: String);
    procedure Check_GiveRecords(WorkYY, EmpNO: String);
    procedure BB_HelpClick(Sender: TObject);
    procedure BB_Help2Click(Sender: TObject);
    function  Check_Input : Boolean;    
  private
    { Private declarations }
  public
    { Public declarations }
    JobMode       : Char;
    sMsg          : String;
    SQLStr        : String;
    FG_FAMICOD, FG_FAMINAME, FG_FAMIJUMIN : String;
    ErrFocus      : Integer;
    FG_Count      : Integer;
  end;

var
  FM_detail: TFM_detail;

implementation

{$R *.DFM}


procedure TFM_detail.FormPaint(Sender: TObject);
var
  i : Integer;
begin
  SB_2Click(Self);

  Read_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  Read_FamRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text, '%');
  with TDS_Fami2 do
  begin
    E_Fami.Items.Clear;
    E_Fami.DropDownRows := RecordCount;
    first;
    for i := 1 to RecordCount do
    begin
     E_Fami.Items.Add(FieldByName('FAMINAME').AsString);;
     next;
    end;
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
    E_Fami.Enabled     := arg1;
    E_hosgubun.Enabled := arg1;

    if arg2 then
      begin
        E_corpno.Text   := '';
        E_corpname.Text := '';
        E_cashcnt.Text  := '';
        E_cashamt.Text  := '';
        E_Fami.Text     := '';
        E_hosgubun.Text := '';
      end;

    if JobMode = 'U' then
    begin
      E_corpno.Enabled := False;
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

    if arg2 then
      begin
        E_corpno2.Text   := '';
        E_corpname2.Text := '';
        E_givecod.Text   := '';
        E_givecnt.Text   := '';
        E_giveamt.Text   := '';
      end;

    if JobMode = 'U' then
    begin
      E_corpno2.Enabled := False;
      E_givecod.Enabled := False;
    end;
  end;
end;

procedure TFM_detail.BT_closeClick(Sender: TObject);
begin
  if MessageDlg('등록한 의료비/기부금 상세내역 합계를 '+#13+#13+
                '증빙서류첨부공제의 의료비/기부금 각 항목에 반영하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with M_KQ1030A.TDS1 do
    begin //의료비 내역 등록 화면 뿌려주기.
          //의료비 종류 : 0본인  1경로  2장애인  3일반
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add('SELECT GUBUN||SUM(CASHAMT)       ');
      Sql.Add('  FROM PKMYSHOS                  ');
      SQL.Add(' WHERE WORKYY = '''+ M_KQ1030A.WorkYY        +''' ');
      SQL.Add('   AND EMPNO  = '''+ M_KQ1030A.E_empno.Text  +''' ');
      SQL.Add(' GROUP BY GUBUN                                   ');

      ClearFieldInfo;
      AddField('SEL_DATA', ftString , 2000);
      Open;

      M_KQ1030A.NE_SHosAmt.Value := 0;
      M_KQ1030A.NE_OHosAmt.Value := 0;
      M_KQ1030A.NE_NHosAmt.Value := 0;
      M_KQ1030A.NE_GHosAmt.Value := 0;
      First;
      while not M_KQ1030A.TDS1.eof do
      begin
        Case StrToInt(Copy(FieldByName('SEL_DATA').AsString,1,1)) of
          0 : M_KQ1030A.NE_SHosAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          1 : M_KQ1030A.NE_OHosAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          2 : M_KQ1030A.NE_NHosAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          3 : M_KQ1030A.NE_GHosAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        end;
        Next;
      end;

      //기부금 내역 등록 화면 뿌려주기.
      //기부금 종류 : 0전액100%  1정치100%  2특례50%  3지정/종교10%
      Close;
      Sql.Clear;
      Sql.Add('SELECT decode(GIVECOD,''10'',0,''20'',1,        ');
      Sql.Add('                      ''21'',2,''30'',2,        ');
      Sql.Add('             ''40'',3,''41'',3,''50'',3,'' '')  ');
      Sql.Add('       ||SUM(GIVEAMT)                           ');
      Sql.Add('  FROM PKMYSGIV                                 ');
      SQL.Add(' WHERE WORKYY = '''+ M_KQ1030A.WorkYY      +''' ');
      SQL.Add('   AND EMPNO  = '''+ M_KQ1030A.E_empno.Text+''' ');
      SQL.Add(' GROUP BY decode(GIVECOD,''10'',0,''20'',1,''21'',2,''30'',2,''40'',3,''41'',3,''50'',3,'' '')');

      ClearFieldInfo;
      AddField('SEL_DATA', ftString , 2000); 
      Open;

      M_KQ1030A.NE_AGiveAmt.Value := 0;
      M_KQ1030A.NE_PoliAmt.Value  := 0;
      M_KQ1030A.NE_SPGiveAmt.Value:= 0;
      M_KQ1030A.NE_PGiveAmt.Value := 0;      
      First;
      while not M_KQ1030A.TDS1.eof do
      begin
        Case StrToInt(Copy(FieldByName('SEL_DATA').AsString,1,1)) of
          0 : M_KQ1030A.NE_AGiveAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          1 : M_KQ1030A.NE_PoliAmt.Value  := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          2 : M_KQ1030A.NE_SPGiveAmt.Value:= StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
          3 : M_KQ1030A.NE_PGiveAmt.Value := StrToFloat(Copy(FieldByName('SEL_DATA').AsString,2,9));
        end;
        Next;
      end;
      M_KQ1030A.TDS1.Close;
    end;

    MessageDlg('증빙서류첨부공제의 의료비/기부금 각 항목에 반영되었습니다. '+#13+#13+
               '소득공제내역 전체저장 버튼을 눌러 저장하세요... ', mtInformation, [mbOK], 0);
    TDS_Detail.Close;
    TDS_Fami2.Close;
    FM_detail.Close;
  end
  else
  begin
    MessageDlg('증빙서류첨부공제의 의료비/기부금 각 항목에 직접 입력하시기 바랍니다. ', mtInformation, [mbOK], 0);
    TDS_Detail.Close;
    TDS_Fami2.Close;
    FM_detail.Close;
  end;
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
    Read_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text)
  else
    Read_GivRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
end;

procedure TFM_detail.SB_2Click(Sender: TObject); //의료비
begin
  SB_1.Enabled   := True;
  SB_2.Enabled   := False;
  NoteBook1.ActivePage := 'P2';

  Read_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  Read_FamRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text, '%');
end;

procedure TFM_detail.SB_1Click(Sender: TObject); //기부금
begin
  SB_1.Enabled   := False;
  SB_2.Enabled   := True;
  NoteBook1.ActivePage := 'P1';

  Read_GivRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
end;

procedure TFM_detail.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if NoteBook1.ActivePage = 'P2' then   //의료비
  begin
    with TDS_Detail do
    begin
      JobMode         := 'F';
      E_corpno.Text   := FieldByName('CORPNO').AsString;
      E_corpname.Text := FieldByName('CORPNAME').AsString;
      E_cashcnt.Text  := FieldByName('CASHCNT').AsString;
      E_cashamt.Text  := FieldByName('CASHAMT').AsString;
      E_fami.Text     := FieldByName('FAMINAME').AsString;
      if FieldByName('GUBUN').AsString <> '' then
      begin
        Case StrToInt(FieldByName('GUBUN').AsString) of
          0 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-본인';
          1 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-경로';
          2 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-장애';
          3 : E_hosgubun.Text := FieldByName('GUBUN').AsString + '-일반';
        end;
      end;
    end;
  end

  else if NoteBook1.ActivePage = 'P1' then  //기부금
  begin
    with TDS_Detail do
    begin
      JobMode         := 'F';
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
          40 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-지정(10%)';
          41 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-종교단체(10%)';
          50 : E_givecod.Text  := FieldByName('GIVECOD').AsString + '-기타(10%)';
        end;
      end;
      E_givecnt.Text  := FieldByName('GIVECNT').AsString;
      E_giveamt.Text  := FieldByName('GIVEAMT').AsString;
    end;
  end;
end;

Procedure TFM_detail.Read_FamRecords(WorkYY, EmpNo, Faminame : String);
begin
  with TDS_Fami2 do
    begin
      ServiceName := 'PKQ1030A_sel2';
      Close;
      Sql.Clear;
      SQL.Add('SELECT WORKYY,   EMPNO, KORNAME, ''0'' FAMIREL,        ');
      Sql.Add('       JUMINID,  ''Y'' DEDYN5,                         ');
      Sql.Add(' '' '' AGE,   '' '' DEDYN, '' '' OBSYN, '' '' DEDYN3,  ');
      Sql.Add(' '' '' DEDYN4,'' '' DEDYN6,'' '' DEDYN7,'' '' CODENAME ');
      SQL.Add('  FROM PKMYSAPP                                        ');
      SQL.Add(' WHERE WORKYY  =    '''+ WorkYY   +'''                 ');
      SQL.Add('   AND EMPNO   =    '''+ Empno    +'''                 ');
      SQL.Add('   AND KORNAME Like '''+ Faminame +'''                 ');
      SQL.Add('UNION                                                  ');
      SQL.Add('SELECT WORKYY, EMPNO, FAMINAME,                        ');
      SQL.Add('       DECODE(FAMIREL,                                 ');
      SQL.Add('            ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''18'',''1'',''19'',''1'',');
      SQL.Add('            ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'', ');
      SQL.Add('            ''01'',''3'',''06'',''3'',                 ');
      SQL.Add('		   ''04'',''4'',''05'',''4'',''20'',''4'',''21'',''4'',''22'',''4'',''23'',''4'',');
      SQL.Add('            ''13'',''5'',''14'',''5'',''15'',''5'',''28'',''5'',''29'',''5'',''30'',''5'',');
      SQL.Add('            ''6'')     FAMIREL,                        ');
      SQL.Add('	      JUMINID,  DEDYN5,                               ');
      Sql.Add(' '' '' AGE,   '' '' DEDYN, '' '' OBSYN, '' '' DEDYN3,  ');
      Sql.Add(' '' '' DEDYN4,'' '' DEDYN6,'' '' DEDYN7,'' '' CODENAME ');
      SQL.Add('  FROM PKMYSFAM                                        ');
      SQL.Add(' WHERE WORKYY   =    '''+ WorkYY   +'''                ');
      SQL.Add('   AND EMPNO    =    '''+ Empno    +'''                ');
      SQL.Add('   AND FAMINAME Like '''+ Faminame +'''                ');
      SQL.Add('   AND NVL(DEDYN5,''N'') = ''Y''                       ');
      SQL.Add('ORDER BY FAMIREL');
      
      ClearFieldInfo;
      AddField('WORKYY'  , ftString,  4 );
      AddField('EMPNO'   , ftString,  4 );
      AddField('FAMINAME', ftString,  12);
      AddField('FAMIREL' , ftString,  2 );
      AddField('JUMINID' , ftString,  14);
      AddField('AGE'     , ftInteger, 3 );   
      AddField('DEDYN'   , ftString,  1 );
      AddField('OBSYN'   , ftString,  1 );
      AddField('DEDYN3'  , ftString,  1 );
      AddField('DEDYN4'  , ftString,  1 );
      AddField('DEDYN5'  , ftString,  1 );
      AddField('DEDYN6'  , ftString,  1 );
      AddField('DEDYN7'  , ftString,  1 );
      AddField('CODENAME', ftString,  30);
      Open;
    end;
end;

Procedure TFM_detail.Read_HosRecords(WorkYY, EmpNo : String);
begin
  with TDS_Detail do
    begin
      ServiceName := 'PKQ1030A_sel7';
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO,  CORPNO, CORPNAME,   ');
      Sql.Add('       CASHCNT, CASHAMT, CARDCNT, CARDAMT, ');
      Sql.Add('       FAMICOD, FAMINAME, FAMIJUMIN, GUBUN ');
      Sql.Add('  FROM PKMYSHOS                            ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''           ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''           ');
      Sql.Add(' ORDER BY FAMICOD,CORPNO                   ');

      ClearFieldInfo;
      AddField('WORKYY'   , ftString,  4 );
      AddField('EMPNO'    , ftString,  4 );
      AddField('CORPNO'   , ftString,  13);
      AddField('CORPNAME' , ftString,  40);
      AddField('CASHCNT'  , ftString,  3 );
      AddField('CASHAMT'  , ftInteger, 9 );
      AddField('CARDCNT'  , ftString,  3 );
      AddField('CARDAMT'  , ftString,  9 );
      AddField('FAMICOD'  , ftString,  1 );
      AddField('FAMINAME' , ftString,  12);
      AddField('FAMIJUMIN', ftString,  14);
      AddField('GUBUN'    , ftString,  1 );
      Open;
    end;
end;

Procedure TFM_detail.Read_GivRecords(WorkYY, EmpNo : String);
begin
  with TDS_Detail do
    begin
      ServiceName := 'PKQ1030A_sel8';
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO,  CORPNO, CORPNAME,');
      Sql.Add('       GIVECOD, GIVECNT, GIVEAMT        ');
      Sql.Add('  FROM PKMYSGIV                         ');
      Sql.Add(' WHERE WORKYY = '''+ WorkYY +'''        ');
      Sql.Add('   AND EMPNO  = '''+ Empno  +'''        ');
      Sql.Add(' ORDER BY GIVECOD,CORPNO                ');

      ClearFieldInfo;
      AddField('WORKYY'  , ftString,  4 );
      AddField('EMPNO'   , ftString,  4 );
      AddField('CORPNO'  , ftString,  13);
      AddField('CORPNAME', ftString,  40);
      AddField('GIVECOD' , ftString,  2 );
      AddField('GIVECNT' , ftInteger, 3 );
      AddField('GIVEAMT' , ftString,  9 );
      Open;
      DataSource1.OnDataChange := Nil;
      FieldByName('CORPNO').Alignment    := taCenter;
      FieldByName('CORPNAME').Alignment  := taCenter;
      FieldByName('GIVECOD').Alignment   := taCenter;
      FieldByName('GIVECNT').Alignment   := taCenter;
      FieldByName('GIVEAMT').Alignment   := taCenter;
      DataSource1.OnDataChange := DataSource1DataChange;
    end;
end;

procedure TFM_detail.Check_HosRecords(WorkYY, EmpNo : String);
begin
  FG_Count := 0;
  with M_KQ1030A.TDS1 do
    begin
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add('SELECT Count(*)                             ');
      Sql.Add('  FROM PKMYSHOS                             ');
      Sql.Add(' WHERE WORKYY    = '''+ WorkYY +'''         ');
      Sql.Add('   AND EMPNO     = '''+ Empno  +'''         ');
      Sql.Add('   AND CORPNO    = '''+ E_corpno.Text  +''' ');
      Sql.Add('   AND FAMINAME  = '''+ E_Fami.Text    +''' ');

      ClearFieldInfo;
      AddField('SEL_DATA', ftString , 2000);
      Open;

      FG_Count := StrToInt(FieldByName('SEL_DATA').AsString);
    end;
  M_KQ1030A.TDS1.close;
end;

procedure TFM_detail.Check_GiveRecords(WorkYY, EmpNo : String);
begin
  FG_Count := 0;
  with M_KQ1030A.TDS1 do
    begin
      ServiceName := 'PKQ1030A_common';
      Close;
      Sql.Clear;
      Sql.Add('SELECT Count(*)                           ');
      Sql.Add('  FROM PKMYSGIV                           ');
      Sql.Add(' WHERE WORKYY  = '''+ WorkYY          +''' ');
      Sql.Add('   AND EMPNO   = '''+ Empno           +''' ');
      Sql.Add('   AND CORPNO  = '''+ E_corpno2.Text  +''' ');
      Sql.Add('   AND GIVECOD = '''+ E_givecod.Text  +''' ');

      ClearFieldInfo;
      AddField('SEL_DATA', ftString , 2000);
      Open;

      FG_Count := StrToInt(FieldByName('SEL_DATA').AsString);
    end;
  M_KQ1030A.TDS1.close;
end;

procedure TFM_detail.BB_HosSaveClick(Sender: TObject);
begin
  FG_FAMICOD   := '';
  FG_FAMINAME  := '';
  FG_FAMIJUMIN := '';

  if not Check_Input then
    Exit;
  
  Check_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  if (JobMode = 'I') and (FG_Count > 0) then
  begin
    MessageDlg(E_Fami.Text+'의 해당 사업장은 기 등록된 데이터입니다. 수정등록하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end;

  Read_FamRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text, E_Fami.Text);
  with TDS_Fami2 do
    begin
      FG_FAMICOD   := FieldByName('FAMIREL').AsString;
      FG_FAMINAME  := FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN := FieldByName('JUMINID').AsString;
      Close;
    end;

  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSHOS                     '+
                '   (WORKYY, EMPNO, CORPNO, CORPNAME,     '+
                '    CASHCNT, CASHAMT, CARDCNT, CARDAMT,  '+
                '    FAMICOD, FAMINAME, FAMIJUMIN, GUBUN, '+
                '    WRITEMAN, WRITETIME )                '+
                '  VALUES                                 '+
                '   ('''+ M_KQ1030A.Workyy          +''', '+
                '    '''+ M_KQ1030A.E_empno.Text    +''', '+
                '    '''+ E_corpno.Text             +''', '+
                '    '''+ E_corpname.Text           +''', '+
                '    '''+ E_cashcnt.Text            +''', '+
                '    '''+ E_cashamt.Text            +''', '+
                '    ''0''                              , '+
                '    ''0''                              , '+
                '    '''+ FG_FAMICOD                +''', '+
                '    '''+ FG_FAMINAME               +''', '+
                '    '''+ FG_FAMIJUMIN              +''', '+
                '    '''+ Copy(E_hosgubun.Text,1,1) +''', '+
                '    '''+ M_KQ1030A.GSEmpno         +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')  '+
                '   ) ';
    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSHOS  SET                         '+
                '       CORPNAME  = '''+ E_corpname.Text+''', '+
                '       CASHCNT   = '''+ E_cashcnt.Text +''', '+
                '       CASHAMT   = '''+ E_cashamt.Text +''', '+
                '       CARDCNT   = ''0''                   , '+
                '       CARDAMT   = ''0''                   , '+
                '       FAMICOD   = '''+ FG_FAMICOD     +''', '+
                '       FAMINAME  = '''+ FG_FAMINAME    +''', '+
                '       FAMIJUMIN = '''+ FG_FAMIJUMIN   +''', '+
                '       GUBUN     = '''+ Copy(E_hosgubun.Text,1,1) +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                '       WRITEMAN  = '''+ M_KQ1030A.GSEmpno         +'''  '+
                ' WHERE WORKYY    = '''+ M_KQ1030A.WorkYY          +'''  '+
                '   AND EMPNO     = '''+ M_KQ1030A.E_empno.Text    +'''  '+
                '   AND CORPNO    = '''+ E_corpno.Text             +'''  '+
                '   AND FAMINAME  = '''+ E_Fami.Text               +'''  ';
    end
  else
    System.Exit;

  with M_KQ1030A.TDS_dml do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  Read_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  
  Set_Field(False, False);
end;

procedure TFM_detail.BB_HosDelClick(Sender: TObject);
begin
  if MessageDlg('공제인원사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SQLStr  := 'DELETE PKMYSHOS  '+
             ' WHERE WORKYY    = '''+ M_KQ1030A.WorkYY       +''' '+
             '   AND EMPNO     = '''+ M_KQ1030A.E_empno.Text +''' '+
             '   AND CORPNO    = '''+ E_corpno.Text          +''' '+
             '   AND FAMINAME  = '''+ E_Fami.Text            +''' ';

  with M_KQ1030A.TDS_dml do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('공제인원사항 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;
    
  Read_HosRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
end;


procedure TFM_detail.BB_GiveSaveClick(Sender: TObject);
begin
  if not Check_Input then
    Exit;

  Check_GiveRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
  if (JobMode = 'I') and (FG_Count > 0) then
  begin
    MessageDlg('해당 사업장은 기 등록된 사업장입니다. 수정하여 등록하시기 바랍니다.',mtInformation,[mbOK],0);
    Exit;
  end;

  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSGIV                     '+
                '   (WORKYY, EMPNO, CORPNO, CORPNAME,     '+
                '    GIVECOD, GIVECNT, GIVEAMT,           '+
                '    WRITEMAN, WRITETIME )                '+
                '  VALUES                                 '+
                '   ('''+ M_KQ1030A.Workyy          +''', '+
                '    '''+ M_KQ1030A.E_empno.Text    +''', '+
                '    '''+ E_corpno2.Text            +''', '+
                '    '''+ E_corpname2.Text          +''', '+
                '    '''+ Copy(E_givecod.Text,1,2)  +''', '+
                '    '''+ E_givecnt.Text            +''', '+
                '    '''+ E_giveamt.Text            +''', '+
                '    '''+ M_KQ1030A.GSEmpno         +''', '+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')  '+
                '   ) ';
    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSGIV  SET                           '+
                '       CORPNAME  = '''+ E_corpname2.Text        +''', '+
                '       GIVECOD   = '''+ Copy(E_givecod.Text,1,2)+''', '+
                '       GIVECNT   = '''+ E_givecnt.Text          +''', '+
                '       GIVEAMT   = '''+ E_giveamt.Text          +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), '+
                '       WRITEMAN  = '''+ M_KQ1030A.GSEmpno       +'''  '+
                ' WHERE WORKYY    = '''+ M_KQ1030A.WorkYY        +'''  '+
                '   AND EMPNO     = '''+ M_KQ1030A.GSEmpno       +'''  '+
                '   AND CORPNO    = '''+ E_corpno2.Text          +'''  '+
                '   AND GIVECOD   = '''+ Copy(E_givecod.Text,1,2)+'''  ';
    end
  else
    System.Exit;

  with M_KQ1030A.TDS_dml do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  Read_GivRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);

  Set_Field(False, False);
end;

procedure TFM_detail.BB_GiveDelClick(Sender: TObject);
begin
  if MessageDlg('공제인원사항을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SQLStr  := 'DELETE PKMYSGIV  '+
             ' WHERE WORKYY    = '''+ M_KQ1030A.WorkYY        +''' '+
             '   AND EMPNO     = '''+ M_KQ1030A.E_empno.Text  +''' '+
             '   AND CORPNO    = '''+ E_corpno2.Text          +''' '+
             '   AND GIVECOD   = '''+ Copy(E_givecod.Text,1,2)+'''  ';

  with M_KQ1030A.TDS_dml do
    begin
      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('공제인원사항 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
    end;

  Read_GivRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text);
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
begin
  result := True;

  if NoteBook1.ActivePage = 'P2' then   //의료비
  begin    
      if Pos('-',E_corpno.Text) > 0 then
      begin
        MessageDlg('사업자 등록번호는 숫자만 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
        result := false;
      end;
      if E_corpno.Text   < '       ' then
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
        MessageDlg('사업자별 지급총액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
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
      if (Copy(E_givecod.Text,1,2)<>'20') and (E_corpname2.Text < '          ') then //정치기부금의 경우 사업자명 입력 안해도 됨.
      begin
        MessageDlg('사업자 명을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
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

end.
