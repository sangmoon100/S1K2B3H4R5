{===================== Program Header ==========================================
프로그램 명 : 국세청 제공 의료비 소득증빙 자료 등록
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
     1.00       2007.12.          유재승         최초개발본
================================================================================}

unit pkq106104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnEditBtnCtrl, OnEditCombo, OnFocusButton, OnEditBaseCtrl, ExtCtrls,
  OnShapeLabel, Db, Tmax_DataSetText, Func, MemDS, DBAccess, Ora;

type
  TFM_main_nts = class(TForm)
    Notebook1: TNotebook;
    OnShapeLabel3: TOnShapeLabel;
    Shape1: TShape;
    Label10: TLabel;
    DB_NTSHosamt: TOnGrDbGrid;
    Panel16: TPanel;
    Panel53: TPanel;
    Panel52: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    HelpMemo1: TMemo;
    E_medisum: TOnNumberEdit;
    DataSource1: TDataSource;
    Panel1: TPanel;
    BB_Append: TOnFocusButton;
    BB_Modify: TOnFocusButton;
    BB_HosSave: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_HosDel: TOnFocusButton;
    BB_Help: TOnFocusButton;
    bb_close: TOnFocusButton;
    pn_msg: TPanel;
    E_postmsg: TOnEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    OnFocusButton2: TOnFocusButton;
    E_Fami: TOnComboEdit;
    E_corpno: TOnEdit;
    E_corpname: TOnEdit;
    E_meddate: TOnMaskEdit;
    E_cnt: TOnNumberEdit;
    E_payamt: TOnNumberEdit;
    TDS2: TTMaxDataSet;
    Query1: TOraQuery;
    Query2: TOraQuery;
    Query3: TOraQuery;
    Query4: TOraQuery;
    Query5: TOraQuery;
    function  Check_Input : Boolean;
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_AppendClick(Sender: TObject);
    procedure BB_ModifyClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_HosSaveClick(Sender: TObject);
    procedure BB_HosDelClick(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure bb_closeClick(Sender: TObject);
    procedure E_meddateExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Set_Field(arg1, arg2 : Boolean);
    procedure Read_HosRecords(WorkYY, EmpNo : String);
    procedure Read_FamRecords(WorkYY, EmpNo, Faminame : String);
    procedure PL_Com_Contructor;
  public
    { Public declarations }
    JobMode       : Char;
    FG_FAMICOD, FG_FAMINAME, FG_FAMIJUMIN : String;
    SQLStr : String;
    SaveFlag      : Boolean;
    FG_medidate : String;
    NHos_seq    : String;
  end;

var
  FM_main_nts: TFM_main_nts;

implementation

uses pkq106101;

{$R *.DFM}

procedure TFM_main_nts.FormShow(Sender: TObject);
var
  i : integer;
begin

  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
{  Read_FamRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text, '%');
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
  end;}

  FG_FAMICOD   := '';
  FG_FAMINAME  := '';
  FG_FAMIJUMIN := '';

  Read_FamRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value, E_Fami.Text);
  with Query3 do
  begin
       FG_FAMICOD   := FieldByName('FAMIREL').AsString;   //가족코드(의료비 지급조서 기준)
       FG_FAMINAME  := FieldByName('FAMINAME').AsString;
       FG_FAMIJUMIN := FieldByName('JUMINID').AsString;
       Close;
  end;

  if  Trim(FG_FAMINAME) = '' then
  begin
      Read_FamRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value, E_Fami.Text);
      FG_FAMICOD   := Query3.FieldByName('FAMIREL').AsString;   //가족코드(의료비 지급조서 기준)
      FG_FAMINAME  := Query3.FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN := Query3.FieldByName('JUMINID').AsString;
      Close;
  end;

  Set_Field(False,True);
  Query1.First;
end;

procedure TFM_main_nts.Read_HosRecords(WorkYY, EmpNo: String);
begin
  with Query1 do
    begin
//      ServiceName := 'PKQ1030A_sel10';
      Close;
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO, SEQ, CORPNO, CORPNAME,         ');
      Sql.Add('       MEDDATE, PAYCNT,  PAYAMT,                     ');
      Sql.Add('       FAMICOD,  FAMINAME,  FAMIJUMIN, POST_MSG      ');
      Sql.Add('  FROM PKMYSHOS_NTS2010                                  ');
      Sql.Add(' WHERE WORKYY    = '''+ WorkYY +'''                  ');
      Sql.Add('   AND EMPNO     = '''+ Empno  +'''                  ');
      Sql.Add('   AND FAMINAME  = '''+ E_Fami.Text +'''             ');
      Sql.Add(' ORDER BY MEDDATE ,CORPNO                                   ');

{      ClearFieldInfo;
      AddField('WORKYY'     , ftString,  4 );
      AddField('EMPNO'      , ftString,  4 );
      AddField('SEQ'        , ftInteger, 4 );
      AddField('CORPNO'     , ftString,  13);
      AddField('CORPNAME'   , ftString,  40);
      AddField('MEDDATE'    , ftString,  6 );
      AddField('PAYCNT'     , ftInteger, 3 );
      AddField('PAYAMT'     , ftInteger, 9 );
      AddField('FAMICOD'    , ftString,  1 );
      AddField('FAMINAME'   , ftString,  12);
      AddField('FAMIJUMIN'  , ftString,  14);
      AddField('POST_MSG'   , ftString, 100);}

//      Active := True;
      Open;
      DataSource1.OnDataChange := Nil;
      TFloatField(FieldByName('PAYAMT')).DisplayFormat  := '#,##0';
      FieldByName('MEDDATE').EditMask  := '####-##;0;';
      DataSource1.OnDataChange := DataSource1DataChange;
      E_PostMsg.Text := FieldByName('POST_MSG').AsString;
    end;


  with Query4 do
    begin
      PL_Com_Contructor;
      Close;
      Sql.Clear;
      Sql.Add('SELECT nvl(sum(payamt),0) field1,          ');
      Sql.Add('       ''field2'', ''field3'',             ');
      Sql.Add('       ''field4'', ''field5''              ');
      Sql.Add('  FROM PKMYSHOS_NTS2010                        ');
      Sql.Add(' WHERE WORKYY    = '''+ WorkYY +'''        ');
      Sql.Add('   AND EMPNO     = '''+ Empno  +'''        ');
      Sql.Add('   AND FAMINAME  = '''+ E_Fami.Text +'''   ');
      Open;

//      Active := True;
      E_medisum.Value := FieldByName('field1').AsFloat;
      Fpkq10601.E_dedamt5a.Value := E_medisum.Value;
      Close;
    end;
end;

procedure TFM_main_nts.Read_FamRecords(WorkYY, EmpNo, Faminame: String);
begin
  with Query3 do
    begin
//    Active := False;
//    ServiceName := 'PKQ1030A_sel2';
      Sql.Clear;
      Sql.Add('SELECT WORKYY, EMPNO, FAMINAME,                                                       ');
      SQL.Add('       DECODE(FAMIREL,                                                                ');
      SQL.Add ( '        ''00'',''0'',                                                                                            '); //본인.
      SQL.Add ( '        ''02'',''1'',''03'',''1'',''07'',''1'',''08'',''1'',''11'',''1'',''12'',''1'',''18'',''1'',''19'',''1'', '); //소득자의 직계존속
      SQL.Add ( '        ''09'',''2'',''10'',''2'',''26'',''2'',''27'',''2'',''16'',''2'',''17'',''2'',''24'',''2'',''25'',''2'', '); //배우자의 직계존속
      SQL.Add ( '        ''01'',''3'',''06'',''3'',                                                                               '); //배우자
      SQL.Add ( '        ''04'',''4'',''05'',''4'',                                                                               '); //직계비속
      SQL.Add ( '        ''20'',''5'',''21'',''5'',''22'',''5'',''23'',''5'',                                                     '); //직계비속2
      SQL.Add ( '        ''13'',''6'',''14'',''6'',''15'',''6'',''28'',''6'',''29'',''6'',''30'',''6'',''31'',''7'',''32'',''7'', '); //형제자매
      SQL.Add ( '        ''6'')                                     FAMIREL,                                                      ');
      Sql.Add('       JUMINID,                                                                       ');
      Sql.Add('       AGE,                                                                           ');
      Sql.Add('       nvl(DEDYN,''N'')                         DEDYN   ,                             ');
      Sql.Add('       nvl(OBSYN,''N'')                         OBSYN   ,                             ');
      Sql.Add('       nvl(DEDYN3,''N'')                        DEDYN3  ,                             ');
      Sql.Add('       nvl(DEDAMT4A,0)                          DEDAMT4A,                             ');
      Sql.Add('       nvl(DEDAMT4B,0)                          DEDAMT4B,                             ');
      Sql.Add('       nvl(DEDAMT5A,0)                          DEDAMT5A,                             ');
      Sql.Add('       nvl(DEDAMT5B,0)                          DEDAMT5B,                             ');
      Sql.Add('       nvl(DEDAMT6A,0)                          DEDAMT6A,                             ');
      Sql.Add('       nvl(DEDAMT6B,0)                          DEDAMT6B,                             ');
      Sql.Add('       nvl(DEDAMT7A,0)                          DEDAMT7A,                             ');
      Sql.Add('       nvl(DEDAMT7B,0)                          DEDAMT7B,                             ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8A,                             ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9A,                             ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT9B,                             ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT10A,                            ');
      Sql.Add('       nvl(DEDAMT4A,0) + nvl(DEDAMT4B,0)        DEDAMT4 ,                             ');
      Sql.Add('       nvl(DEDAMT5A,0) + nvl(DEDAMT5B,0)        DEDAMT5 ,                             ');
      Sql.Add('       nvl(DEDAMT6A,0) + nvl(DEDAMT6B,0)        DEDAMT6 ,                             ');
      Sql.Add('       nvl(DEDAMT7A,0) + nvl(DEDAMT7B,0)        DEDAMT7 ,                             ');
      Sql.Add('       nvl(DEDAMT8A,0)                          DEDAMT8 ,                             ');
      Sql.Add('       B.CODENAME,                                                                    ');
      Sql.Add('       A.BABYYN,nvl(DEDAMT10B,0),                                                      ');
      Sql.Add('       nvl(DEDAMT11A,0)                  DEDAMT11A,            '); //kth  기부금 국세청 자료 2010.01.
      Sql.Add('       nvl(DEDAMT11B,0)                  DEDAMT11B,             '); //kth  기부금 국세청 자료 2010.01.
      Sql.Add('       nvl(DEDAMT11A,0) + nvl(DEDAMT11B,0) DEDAMT11           ');
      Sql.Add('  FROM PKMYSFAModify_2010  A, PKMYSCOD B                                                        ');
      Sql.Add(' WHERE A.WORKYY   = '''+WorkYY   +'''                                                 ');
      Sql.Add('   AND A.EMPNO    = '''+Empno    +'''                                                 ');
      Sql.Add('   AND A.FAMINAME Like '''+Faminame +'''                                              ');
      Sql.Add('   AND A.FAMIREL  = B.CODENO                                                          ');
      Sql.Add(' ORDER BY A.FAMIREL                                                                   ');
      Open;
{     ClearFieldInfo;
      AddField('WORKYY'    , ftString,  4 );
      AddField('EMPNO'     , ftString,  4 );
      AddField('FAMINAME'  , ftString,  12);
      AddField('FAMIREL'   , ftString,  2 );
      AddField('JUMINID'   , ftString,  14);
      AddField('AGE'       , ftInteger, 3 );
      AddField('DEDYN'     , ftString,  1 );
      AddField('OBSYN'     , ftString,  1 );
      AddField('DEDYN3'    , ftString,  1 );
      AddField('DEDAMT4A'  , ftFloat,   9 );
      AddField('DEDAMT4B'  , ftFloat,   9 );
      AddField('DEDAMT5A'  , ftFloat,   9 );
      AddField('DEDAMT5B'  , ftFloat,   9 );
      AddField('DEDAMT6A'  , ftFloat,   9 );
      AddField('DEDAMT6B'  , ftFloat,   9 );
      AddField('DEDAMT7A'  , ftFloat,   9 );
      AddField('DEDAMT7B'  , ftFloat,   9 );
      AddField('DEDAMT8A'  , ftFloat,   9 );
      AddField('DEDAMT9A'  , ftFloat,   9 );
      AddField('DEDAMT9B'  , ftFloat,   9 );
      AddField('DEDAMT10A' , ftFloat,   9 );
      AddField('DEDAMT4'   , ftFloat,   9 );
      AddField('DEDAMT5'   , ftFloat,   9 );
      AddField('DEDAMT6'   , ftFloat,   9 );
      AddField('DEDAMT7'   , ftFloat,   9 );
      AddField('DEDAMT8'   , ftFloat,   9 );
      AddField('CODENAME'  , ftString,  30);
      AddField('BABYYN'    , ftString,  10);
      AddField('DEDAMT10B' , ftFloat,   9 );
      AddField('DEDAMT11A' , ftFloat,   9 );
      AddField('DEDAMT11B' , ftFloat,   9 );
      AddField('DEDAMT11'  , ftFloat,   9 );

      Active := True;  }
    end;
end;

procedure TFM_main_nts.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
    with Query1 do
    begin
      JobMode         := 'F';
      NHos_seq :=  InttoStr(FieldByName('SEQ').AsInteger);
      E_corpno.Text   := FieldByName('CORPNO').AsString;
      E_corpname.Text := FieldByName('CORPNAME').AsString;
      E_MedDate.Text  := FieldByName('MEDDATE').AsString;
      E_cnt.Text  := FieldByName('PAYCNT').AsString;
      E_Payamt.Text  := FormatFloat('#,##0', FieldByName('PAYAMT').AsInteger);
    end;

    FG_medidate := RemoveChar(E_MedDate.Text,'-');
end;

procedure TFM_main_nts.PL_Com_Contructor;
begin
  with Query4 do
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

procedure TFM_main_nts.BB_AppendClick(Sender: TObject);
begin
  JobMode := 'I';
  Set_Field(True, True);
  with Query5 do
  begin
       Close;
       Sql.Clear;
//       ServiceName := 'HINSA_select';
       Sql.Add('SELECT TO_CHAR(NVL(MAX(SEQ),0)+1) SEQ,   ');
       Sql.Add('      ''field2'', ''field3'',        ');
       Sql.Add('      ''field4'', ''field5''         ');
       Sql.Add('  FROM PKMYSHOS_NTS2010                      ');
       Sql.Add(' WHERE WORKYY ='''+ Fpkq10601.Table1workyy.Value           +'''  ');
       Sql.Add('  AND EMPNO   ='''+ Fpkq10601.Table1empno.Value  +''' ');
{       ClearFieldInfo;
       AddField('field1'  , ftString, 100);
       AddField('field2'  , ftString, 100);
       AddField('field3'  , ftString, 100);
       AddField('field4'  , ftString, 100);
       AddField('field5'  , ftString, 100);}
       Open;
       if not Query5.eof then
          NHos_seq :=  Query5.FieldByName('SEQ').AsString
       else
          NHos_seq := '1';
  end;
end;

procedure TFM_main_nts.Set_Field(arg1, arg2: Boolean);
begin
  DB_NTSHosamt.Enabled  := not arg1;

  E_corpno.Enabled   := arg1;
  E_corpname.Enabled := arg1;
  E_meddate.Enabled  := arg1;
  E_PostMsg.Enabled  := arg1;
  E_cnt.Enabled      := arg1;
  E_payamt.Enabled   := arg1;

  BB_Append.Enabled  := not(arg1);
  BB_Modify.Enabled  := not(arg1);
  BB_cancel.Enabled  := arg1;
  BB_HosSave.Enabled := arg1;
  BB_HosDel.Enabled  := not(arg1);
  bb_close.Enabled   := not(arg1);

  if arg2 then
    begin
      E_corpno.Text   := '';
      E_corpname.Text := '';
      E_Meddate.Text  := '';
      E_cnt.Text  := '0';
      E_payamt.Text  := '0';
      E_Postmsg.Text := '';
    end;

  if JobMode = 'U' then
  begin
       E_corpno.Enabled   := False;
//       E_meddate.Enabled  := False;
  end;

end;

procedure TFM_main_nts.BB_ModifyClick(Sender: TObject);
begin
    JobMode := 'U';
    Set_Field(True, False);
end;

procedure TFM_main_nts.BB_cancelClick(Sender: TObject);
begin
  JobMode := 'F';
  Set_Field(False, True);
  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value)
end;

procedure TFM_main_nts.BB_HosSaveClick(Sender: TObject);
begin

  if E_cnt.Text    = '' then E_cnt.Text := '0';
  if E_payamt.Text = '' then E_Payamt.Text := '0';

  if not Check_Input then
    Exit;



 

{  if  Trim(FG_medidate) = '' then
  begin
       MessageDlg('지급년월을 입력 하세요.',mtError, [mbOk],0);
       E_meddate.SetFocus;
       System.Exit;
  end;}

  if  E_cnt.Value = 0 then
  begin
       MessageDlg('의료비 건수을 입력 해주세요..',mtError, [mbOk],0);
       E_cnt.SetFocus;
       System.Exit;
  end;


  if  E_Payamt.Value = 0 then
  begin
       MessageDlg('의료비 금액을 입력 해주세요..',mtError, [mbOk],0);
       E_payamt.SetFocus;
       System.Exit;
  end;

  if Fpkq10601.E_dedyn.Text = 'N' then
  begin
       if Trim(E_postmsg.Text) = '' then
       begin
            MessageDlg('기본공제 대상자 의료비 등록시 지출사유를 넣어 주세요...',mtError, [mbOk],0);
            E_postmsg.SetFocus;
            System.Exit;
       end;     
  end;

  if  length(RemoveChar(E_MedDate.Text,'-')) <> 6 then
  begin
      MessageDlg('의료일자를 정확히 입력 해주시기 바랍니다....',mtError, [mbOk],0);
      System.Exit;
  end;



  if JobMode = 'I' then
    begin
      SQLStr := 'INSERT INTO PKMYSHOS_NTS2010                                 '+#13+
                '   (WORKYY,  EMPNO,  SEQ,  CORPNO,  CORPNAME,                '+#13+
                '    MEDDATE, PAYCNT, PAYAMT,                             '+#13+
                '    FAMICOD, FAMINAME, FAMIJUMIN, POST_MSG,              '+#13+
                '    WRITEMAN, WRITETIME)                                 '+#13+
                '  VALUES                                                 '+#13+
                '   ('''+ Fpkq10601.Table1workyy.Value   +''',                '+#13+
                '    '''+ Fpkq10601.Table1empno.Value     +''',                '+#13+
                '    '''+ NHos_seq                   +''',                '+#13+
                '    '''+ E_corpno.Text              +''',                '+#13+
                '    '''+ E_corpname.Text            +''',                '+#13+
                '    '''+ RemoveChar(E_MedDate.Text,'-')+''',             '+#13+
                '    '''+ E_cnt.Text                 +''',                '+#13+
                '    '''+ FloatToStr(E_Payamt.Value) +''',                '+#13+
                '    '''+ FG_FAMICOD                 +''',                '+#13+
                '    '''+ FG_FAMINAME                +''',                '+#13+
                '    '''+ FG_FAMIJUMIN               +''',                '+#13+
                '    '''+ E_PostMsg.Text             +''',                '+#13+
                '    '''+ Fpkq10601.GSEmpno          +''',                '+#13+
                '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')                  '+#13+
                '   ) ';

    end
  else if JobMode = 'U' then
    begin
      SQLStr := 'UPDATE PKMYSHOS_NTS2010  SET                                       '+
                '       CORPNAME  = '''+ E_corpname.Text                 +''',  '+
                '       MEDDATE   = '''+ RemoveChar(E_MedDate.Text,'-')  +''',  '+
                '       PAYCNT    = '''+ E_cnt.Text                      +''',  '+
                '       PayAMT    = '''+ FloatToStr(E_Payamt.Value)      +''',  '+
                '       FAMICOD   = '''+ FG_FAMICOD                      +''',  '+
                '       FAMINAME  = '''+ FG_FAMINAME                     +''',  '+
                '       FAMIJUMIN = '''+ FG_FAMIJUMIN                    +''',  '+
                '       POST_MSG  = '''+ E_PostMsg.Text                  +''',  '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''),        '+
                '       WRITEMAN  = '''+ Fpkq10601.GSEmpno               +'''   '+
                ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value    +'''   '+
                '   AND EMPNO     = '''+  Fpkq10601.Table1empno.Value    +'''   '+
                '   AND CORPNO    = '''+ E_corpno.Text                   +'''   '+
                '   AND FAMINAME  = '''+ E_Fami.Text                     +'''   '+
                '   AND MEDDATE   = '''+ FG_medidate                     +'''   '+
                '   AND SEQ       = '''+ NHos_seq                        +'''   ';
    end
  else
    System.Exit;

  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      ExecSQL;
{      if not Query2.ExecSQL then
        begin
          MessageDlg('저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;}
    end;

  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                                  '+#13+
            '   SET DEDAMT5A = (SELECT NVL(SUM(PAYAMT),0) FROM PKMYSHOS_NTS2010     '+#13+
            '                    WHERE WORKYY = A.WORKYY                        '+#13+
            '                      AND EMPNO  = A.EMPNO                         '+#13+
            '                      AND FAMINAME = A.FAMINAME)                   '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value                +'''       '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value          +'''       '+#13+
            '   AND FAMINAME  = '''+ E_Fami.Text                     +'''       ';

  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Query2.ExecSQL
{      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('가족공제 사항의 의료비 국세청내역 저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;

      M_KQ1030A.SB_Help.Panels[1].Text := '가족 구성원의 내역이 변동되었습니다. <가족저장>을 하시기 바랍니다.';
      }
    end;
  //////////////////////////////////////////////////////////////////////////////
         //  Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value
  //의료비 내역을 다시 조회
  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);

  Set_Field(False, False);
end;

function TFM_main_nts.Check_Input: Boolean;
begin
  result := True;

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
  {if RemoveChar(E_Meddate.Text,'-') < Copy(M_KQ1030A.EmpDate,1,6) then
  begin
    MessageDlg('입사일 이전에 지출된 내역은 공제대상이 아닙니다.',mtInformation,[mbOK],0);
    result := false;
  end;}
  if E_cnt.Text  < '0' then
  begin
    MessageDlg('지급건수를 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_payamt.Text  < '0' then
  begin
    MessageDlg('사업자별 지급총액을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
  if E_Fami.Text     < '            ' then
  begin
    MessageDlg('공제가족을 입력하여 주시기 바랍니다.',mtInformation,[mbOK],0);
    result := false;
  end;
end;

procedure TFM_main_nts.BB_HosDelClick(Sender: TObject);
begin
  if MessageDlg('해당내역을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;



  SQLStr  := 'DELETE PKMYSHOS_NTS2010                                     '+
             ' WHERE WORKYY   = '''+ Fpkq10601.Table1workyy.Value            +''' '+
             '   AND EMPNO    = '''+ Fpkq10601.Table1empno.Value     +''' '+
             '   AND CORPNO   = '''+ E_corpno.Text               +''' '+
             '   AND FAMINAME = '''+ E_Fami.Text                 +''' '+
             '   AND PAYCNT   = '''+ FloatToStr(E_CNT.Value)     +''' '+
             '   AND PAYAMT   = '''+ FloatToStr(E_PayAMT.Value)  +''' '+
             '   AND SEQ       = '''+ NHos_seq                        +'''   ';


  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Query2.ExecSQL;
      {if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('의료비 삭제에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;
      M_KQ1030A.SB_Help.Panels[1].Text := '가족 구성원의 내역이 변동되었습니다. <가족저장>을 하시기 바랍니다.';}
    end;

    //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                                  '+#13+
            '   SET DEDAMT5A = (SELECT NVL(SUM(PAYAMT),0) FROM PKMYSHOS_NTS2010     '+#13+
            '                    WHERE WORKYY = A.WORKYY                        '+#13+
            '                      AND EMPNO  = A.EMPNO                         '+#13+
            '                      AND FAMINAME = A.FAMINAME)                   '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value                +'''       '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value         +'''       ';

  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Query2.ExecSQL;
     

     { if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('가족공제 사항의 의료비 국세청내역 저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;}
    end;
  //////////////////////////////////////////////////////////////////////////////



  Read_HosRecords(Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value);
end;

procedure TFM_main_nts.BB_HelpClick(Sender: TObject);
begin
  if HelpMemo1.Visible then
    HelpMemo1.Visible := False
  else
    HelpMemo1.Visible := True;
end;

procedure TFM_main_nts.bb_closeClick(Sender: TObject);
begin
{  FG_FAMICOD   := '';      KTH 2010.02.12 가족 입력시 바로 이름이 나오기 떼믄에 주석처리 가족 선택 X 주석
  FG_FAMINAME  := '';
  FG_FAMIJUMIN := '';

  Read_FamRecords(M_KQ1030A.WorkYY, M_KQ1030A.E_empno.Text, E_Fami.Text);
  with TDS_Fami2 do
    begin
      FG_FAMICOD   := FieldByName('FAMIREL').AsString;   //가족코드(의료비 지급조서 기준)
      FG_FAMINAME  := FieldByName('FAMINAME').AsString;
      FG_FAMIJUMIN := FieldByName('JUMINID').AsString;
      Close;
    end;}

     //  Fpkq10601.Table1workyy.Value, Fpkq10601.Table1empno.Value

  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
    SQLStr := 'UPDATE PKMYSHOS_NTS2010  SET                                   '+
            '       POST_MSG  = '''+ E_PostMsg.Text                +'''   '+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value  +'''   '+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value   +'''   '+
            '   AND FAMINAME  = '''+ E_Fami.Text                   +'''   ';


  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Query2.ExecSQL;

{      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('사유 저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;}
    end;
  //////////////////////////////////////////////////////////////////////////////


  //////////////////////////////////////////////////////////////////////////////
  //의료비 내역 등록시 의료비 그밖의 내역에 합산되도록 수정.
  SQLStr := 'UPDATE PKMYSFAModify_2010 A                                                  '+#13+
            '   SET DEDAMT5A = (SELECT NVL(SUM(PAYAMT),0) FROM PKMYSHOS_NTS2010     '+#13+
            '                    WHERE WORKYY = A.WORKYY                        '+#13+
            '                      AND EMPNO  = A.EMPNO                         '+#13+
            '                      AND FAMINAME = A.FAMINAME)                   '+#13+
            ' WHERE WORKYY    = '''+ Fpkq10601.Table1workyy.Value         +'''       '+#13+
            '   AND EMPNO     = '''+ Fpkq10601.Table1empno.Value          +'''       '+#13+
            '   AND FAMINAME  = '''+ E_Fami.Text                     +'''       ';

  with Query2 do
    begin
//      ServiceName := 'PKQ1030A_dml';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Query2.ExecSQL;
{      if not M_KQ1030A.TDS_dml.Execute then
        begin
          MessageDlg('가족공제 사항의 의료비 국세청내역 저장에 실패했습니다.',mtError, [mbOk],0);
          System.Exit;
        end;

      M_KQ1030A.SB_Help.Panels[1].Text := '가족 구성원의 내역이 변동되었습니다. <가족저장>을 하시기 바랍니다.';}
    end;
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //2010.01 kth 의료비,보험료 닫기 했을 때 PKMYSAPP 테이블에 넣기 2008년에 문제 발생 처리.
{   SQLStr := 'update PKMYSAPP set                                                                  '+#13+
             '(GUARAMT,ShosAmt,NHOSAMT,OHOSAMT,GHOSAMT,SEDUAMT) =                                  '+#13+
             '(Select nvl(a.GuarAmt,0)                         GuarAmt,                            '+#13+
             '        nvl(a.ShosAmt,0)                         ShosAmt,                            '+#13+
             '        nvl(a.NhosAmt,0)                         NhosAmt,                            '+#13+
             '        nvl(a.OhosAmt,0)                         OhosAmt,                            '+#13+
             '        nvl(a.GhosAmt,0)                         GhosAmt,                            '+#13+
             '        nvl(a.SEduAmt,0)                         SEduAmt                             '+#13+
             '   From                                                                              '+#13+
             '(select sum(nvl(dedamt4a,0)+nvl(dedamt4b,0))                       GuarAmt,          '+#13+
             '        sum(Decode(Famirel, ''00'',                                                  '+#13+
             '             Decode(ObsYN,''Y'',0,nvl(dedamt5a,0)+nvl(dedamt5b,0)))) ShosAmt,        '+#13+
             '        sum(Decode(ObsYN, ''Y'',                                                     '+#13+
             '                                nvl(dedamt5a,0)+nvl(dedamt5b,0)))    NhosAmt,        '+#13+
             '        sum(Decode(Sign(Age-64), 1,                                                  '+#13+
             '                       Decode(ObsYN, ''Y'', 0, nvl(dedamt5a,0)+nvl(dedamt5b,0))      '+#13+
             '                  )                                                                  '+#13+
             '           )                                                        OhosAmt,         '+#13+
             '        sum(Decode(Famirel,''00'',0,                                                 '+#13+
             '                   Decode(Sign(Age-64), 1 ,0,                                        '+#13+
             '                          Decode(ObsYN,''Y'', 0, nvl(dedamt5a,0)+nvl(dedamt5b,0))    '+#13+
             ' 			      )                                                            '+#13+
             '                  )                                                                  '+#13+
             ' 		)                                                        GhosAmt,          '+#13+
             '        sum(Decode(Famirel,''00'',                                                   '+#13+
             '                           nvl(dedamt6a,0) + nvl(dedamt6b,0)))      SEduAmt          '+#13+
             '   from pkmysfam                                                                     '+#13+
             '  where workyy = '''+ Fpkq10601.Table1workyy.Value           +'''                           '+#13+
             '    and empno  = '''+ Fpkq10601.Table1empno.Value            +''' ) A)                      '+#13+
             '  where workyy = '''+ Fpkq10601.Table1workyy.Value           +'''                           '+#13+
             '    and empno  = '''+ Fpkq10601.Table1empno.Value            +'''                           ';

   with Query2 do
   begin
//        ServiceName := 'PKQ1030A_dml';
        Close;
        Sql.Clear;
        Sql.Add(SQLStr);
//        Query2.ExecSQL; }

{       if not M_KQ1030A.TDS_dml.Execute then
        begin
             MessageDlg('가족공제 사항의 의료비 기타내역 저장에 실패했습니다.',mtError, [mbOk],0);
             System.Exit;
        end;}
{   end;
   //2010.01 kth 의료비,보험료 닫기 했을 때 PKMYSAPP 테이블에 넣기 2008년에 문제 발생 처리. 끝
  /////////////////////////////////////////////////////////////////////////////

  //종료시 활성화 된 DataSet False
  Query1.Active := False;
  Query4.Active := False;
  Query3.Active := False; }

  Close;
end;

procedure TFM_main_nts.E_meddateExit(Sender: TObject);
begin


   if (RemoveChar(E_meddate.Text,'-') <  Fpkq10601.Table1workyy.Value+'01') or   //2007년도 수정해야함.
      (Removechar(E_meddate.Text,'-') >  Fpkq10601.Table1workyy.Value+'12') then
   begin
     MessageDlg(Fpkq10601.Table1workyy.Value +'년 연말정산에 반영가능한 의료비 내역은 '+#13+#13+
                 Fpkq10601.Table1workyy.Value +'.01.01. ∼ '+Fpkq10601.Table1workyy.Value+'.12.31. 까지의 내역입니다.',mtInformation,[mbOK],0);
     E_meddate.Text := '';
   end;
end;

procedure TFM_main_nts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
