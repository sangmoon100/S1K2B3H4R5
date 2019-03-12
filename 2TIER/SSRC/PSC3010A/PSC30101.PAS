{-------------------------------------------------------------------------------
PROGRAM-NAME   : psc3010a.exe(우리사주 대부기준 관리)
SYSTEM-NAME    : 종합인사정보
SUBSYSTEM-NAME : 복리후생(우리사주/대부 및 상환)
Programmer     : 김 한경
Version        : 1.00
Date           : 1997.10.31
Update Contents
  1.00    97.10.31       김한경     신규프로그램개발       상세처리명세서
-------------------------------------------------------------------------------}
unit psc30101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Spin, calen1, pass, DBTables, Db, kycode1,
  numedit, NumCtrl, Grids, DBGrids, TimeFtp;
type
  TFpsc30101 = class(TForm)
    Panel3: TPanel;
    L_empinfo: TLabel;
    L_sysdate: TLabel;
    Panel5: TPanel;
    Panel19: TPanel;
    BB_cancel: TBitBtn;
    BB_close: TBitBtn;
    p_help: TPanel;
    BB_del: TBitBtn;
    BB_save: TBitBtn;
    Panel11: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    SE_divseqnum: TSpinEdit;
    ME_stldate: TMaskEdit;
    SB_stldate: TSpeedButton;
    CB_stclass: TComboBox;
    M_ststd: TMemo;
    Database1: TDatabase;
    Qry1: TQuery;
    QryA: TQuery;
    QryB: TQuery;
    E_stlorg: TEdit;
    Panel6: TPanel;
    SB_stlorg: TSpeedButton;
    P_stlorg: TPanel;
    Qry2: TQuery;
    Panel8: TPanel;
    Label1: TLabel;
    NE_stirate: TNumberEdit;
    Panel7: TPanel;
    ME_stcfdate: TMaskEdit;
    SB_stcfdate: TSpeedButton;
    ME_stctdate: TMaskEdit;
    SB_stctdate: TSpeedButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DataSource1: TDataSource;
    BBAppend: TBitBtn;
    Panel9: TPanel;
    E_ststdd: TEdit;
    Panel10: TPanel;
    CB_corpname: TComboBox;
    Table1: TTable;
    Panel12: TPanel;
    ME_stledate: TMaskEdit;
    SB_stledate: TSpeedButton;
    Panel13: TPanel;
    ME_stesdate: TMaskEdit;
    SB_stesdate: TSpeedButton;
    Panel14: TPanel;
    ME_steddate: TMaskEdit;
    SB_steddate: TSpeedButton;
    Panel15: TPanel;
    NE_syear2: TNumberEdit;
    Label3: TLabel;
    Panel17: TPanel;
    E_stype: TEdit;
    Label5: TLabel;
    Shape7: TShape;
    Label4: TLabel;
    Panel16: TPanel;
    NE_syear: TNumberEdit;
    procedure SB_stldateClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SB_stlorgClick(Sender: TObject);
    procedure E_stlorgExit(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_delClick(Sender: TObject);
    procedure SE_divseqnumChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure E_stlorgKeyPress(Sender: TObject; var Key: Char);
    procedure SB_stcfdateClick(Sender: TObject);
    procedure SB_stctdateClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BBAppendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_stledateClick(Sender: TObject);
    procedure E_stypeChange(Sender: TObject);
    procedure E_stypeExit(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    GSempno    : String[4];
    GSkorname  : String[10];
    GSPassword : String[10];
    GSgrade    : String[10];
    GSSysdate  : String[15];

    Function DateCheck(Sy,Sm,Sd : String) : Integer;
    Function PyccodeA(Codeid,Codeno : String) : String;     // 코드조회
    procedure init_code(const CodeIds : array of String);   // 코드설정
    procedure DataAllClear;                                 // 입력필드 Clear
    procedure Retrieve;
  end;

var
  Fpsc30101: TFpsc30101;
  WorkMode     : Integer;      // 조회모드 => none : 0 , 수정 : 1, 입력 : 2
  CurDivSeqNum : Integer;
  Msg          : String;
  GVariant     : Variant;

  CodeString : TStringList;
  DataString : TStringList;
implementation

{$R *.DFM}

// 코드설정....................................................................
procedure TFpsc30101.init_code(const CodeIds : array of String);
var
  i : Integer;
begin
  CodeString := TStringList.Create;
  DataString := TStringList.Create;

  for i := 0 to High(Codeids) do
  begin
    QryA.Close;
    QryA.sql.clear;
    QryA.sql.Add('select Codeid,Codeno,CodeName from pyccode   ');
    QryA.sql.Add('where                                        ');
    QryA.sql.Add(' (Codeid = '''+Codeids[i]+''')               ');
    QryA.Open;

    While not QryA.eof do
    begin
    CodeString.Add(QryA.FieldByName('Codeid').AsString +
                     QryA.FieldByName('Codeno').AsString);
      DataString.Add(QryA.FieldByName('CodeName').AsString);
      QryA.Next;
    end;
  end;
  QryA.Close;
end;

// 코드조회....................................................................
Function TFpsc30101.PyccodeA(Codeid,Codeno : String) : String;
var
  ind : Integer;
begin
  ind := CodeString.IndexOf(Codeid+Codeno);
  if ind > -1 then
    PyccodeA := DataString.Strings[ind]
  else
    PyccodeA := '';
end;

// DBGrid에 조회되는 데이타.....................................................
procedure TFpsc30101.Retrieve;
begin
  WorkMode := 1;
  Qry1.Close;
  Qry1.sql.Clear;
  Qry1.sql.Add(' select corpname, divseqnum, stclass,                         ');
  Qry1.sql.Add('        decode(stclass,                                       ');
  Qry1.sql.Add('               ''1'', ''사주우선'',                           ');
  Qry1.sql.Add('               ''2'', ''사주실권'',                           ');
  Qry1.sql.Add('               ''3'', ''주주우선'',                           ');
  Qry1.sql.Add('               ''4'', ''주주우선(예탁)'',                     ');
  Qry1.sql.Add('               ''5'', ''주주우선(비예탁)'',                   ');
  Qry1.sql.Add('               '''') stclass_name,                            ');
  Qry1.sql.Add('       stlorg, codename,                                      ');
  Qry1.sql.Add('       stldate, stledate, stirate,                            ');
  Qry1.sql.Add('       stesdate, steddate, syear2, syear, stype,              ');
  Qry1.sql.Add('       stcfdate,stctdate, ststd,ststdd                        ');
  Qry1.sql.Add(' from pshlbas, pyccode                                        ');
  Qry1.sql.Add(' where (codeid = ''K910'' and stlorg = codeno(+))             ');
  Qry1.sql.Add(' order by corpname desc, divseqnum desc, stclass              ');

  Qry1.Open;
  Qry1.FieldByName('stldate').EditMask   := '####/##/##;0;_';
  Qry1.FieldByName('stldate').Alignment  := taCenter;
  Qry1.FieldByName('stledate').EditMask  := '####/##/##;0;_';
  Qry1.FieldByName('stledate').Alignment := taCenter;
  Qry1.FieldByName('stcfdate').EditMask  := '####/##/##;0;_';
  Qry1.FieldByName('stcfdate').Alignment := taCenter;
  Qry1.FieldByName('stctdate').EditMask  := '####/##/##;0;_';
  Qry1.FieldByName('stctdate').Alignment := taCenter;

  if Qry1.Eof then
     begin
     DataAllClear;
     WorkMode := 0;
     end
  else
     WorkMode := 1;

end;

// 대부일자 validation check....................................................
Function TFpsc30101.DateCheck(Sy,Sm,Sd : String) : Integer;
var
  Lda : Double;
begin
  Try
    Lda := Encodedate(StrToInt(Sy),StrToInt(Sm),StrToInt(Sd));
    Except on E : EconvertError do begin
      DateCheck := -1 ;
      System.Exit;
    end else begin
      DateCheck := 0;
      System.Exit;
    end;
  end;
end;

// 화면 clear..................................................................
procedure TFpsc30101.DataAllClear;
begin
  CB_corpname.Text   := '';
  SE_divseqnum.Value := 0;
  CB_stclass.Text    := '';

  E_stlorg.Text      := '';
  P_stlorg.Caption   := '';
  ME_stldate.Text    := '';
  ME_stledate.Text   := '';
  M_ststd.lines.clear;
  ME_stcfdate.Text   := '';
  ME_stctdate.Text   := '';
  NE_stirate.Value   := 0;
  E_ststdd.Text      := '';
  ME_stesdate.Text   := '';
  ME_steddate.Text   := '';
  NE_syear.Value     := 0;
  NE_syear2.Value    := 0;
  E_stype.Text       := '';


  //CB_corpname.Enabled  := True;
  //SE_divseqnum.Enabled := True;
  CB_stclass.Enabled   := True;
  E_stlorg.Enabled     := True;
  SB_stlorg.Enabled    := True;
end;

// 초기화 .....................................................................
procedure TFpsc30101.FormActivate(Sender: TObject);
var
  i : Integer;
begin
  GSempno    := PassEmp(cmdline,1);
  GSkorname  := PassEmp(cmdline,2);
  GSpassword := PassEmp(cmdline,3);
  GSgrade    := Copy((PassEmp(cmdline,4)),4,1);
  Application.ProcessMessages;

  for i := 0 to Database1.Params.Count-1 do
  begin
    if System.Pos('USER NAME', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
    if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
  end;
  DataBase1.Connected := True;

  init_code(['K910']);

  QryB.Close;
  QryB.sql.clear;
  QryB.sql.Add('select Max(divseqnum) D1 from pshsbas  ');
  QryB.Open;
  CurDivSeqNum := QryB.FieldByName('D1').AsInteger;
  QryB.Close;

  Retrieve;

  Qry2.close;
  Qry2.sql.clear;
  Qry2.sql.Add('select to_char(sysdate,''YYYYMMDDHH24MISSD'') T1 from dual  ');
  Qry2.Open;
  GSsysdate := Qry2.FieldByName('T1').AsString;

  L_sysdate.Caption  := copy(GSsysdate,1,4) + '/' + copy(GSsysdate,5,2) + '/' +
                      copy(GSsysdate,7,2);
  L_empinfo.Caption  := GSkorname + '(' + GSempno + ')';
  P_help.Caption := ' 신규자료는 추가버튼을 선택한후 입력하세요.';
  Application.ProcessMessages;
end;

// 종료........................................................................
procedure TFpsc30101.BB_closeClick(Sender: TObject);
begin
  Close;
end;

// 달력(YYYYMMDD)..............................................................
procedure TFpsc30101.SB_stldateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_stldate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

// 은행코드조회.................................................................
procedure TFpsc30101.SB_stlorgClick(Sender: TObject);
begin
  Fkycode1 := TFkycode1.Create(Self);
  Try
    Fkycode1.FormData := '[은행코드조회]';
    Fkycode1.DataVal1 := 'K910';
    Fkycode1.ShowModal;
  if Fkycode1.CloseChk = -1 then Exit;
    E_stlorg.Text := Fkycode1.code;
    P_stlorg.Caption := Fkycode1.CodeName;
  Finally
    Fkycode1.Free;
  end;
end;

procedure TFpsc30101.E_stlorgKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    P_stlorg.Caption := PyccodeA('K910',E_stlorg.Text);
  end;
end;

procedure TFpsc30101.E_stlorgExit(Sender: TObject);
begin
  P_stlorg.Caption := PyccodeA('K910',E_stlorg.Text);
end;

// 배정차수 제어................................................................
procedure TFpsc30101.SE_divseqnumChange(Sender: TObject);
begin
  {
  SE_divseqnum.MaxValue := CurDivSeqNum;
  SE_divseqnum.MinValue := 1;
  if Trim(SE_divseqnum.Text) = '' then System.Exit;
  if (SE_divseqnum.Value > SE_divseqnum.MaxValue) then
    SE_divseqnum.Value := SE_divseqnum.MaxValue
  else if (SE_divseqnum.Value < 1) then
    SE_divseqnum.Value := 1;
   }
end;

// 신규자료 저장 및 기존자료 수정...............................................
procedure TFpsc30101.BB_saveClick(Sender: TObject);
var
  Sy1,Sm1,Sd1,Sy2,Sm2,Sd2,Sy_1,Sm_1,Sd_1,Sy_2,Sm_2,Sd_2 : String;
begin
  if WorkMode = 0 then
  begin
  Msg := '저장할 대상자료가 존재하지 않습니다. ' + #13 + #13 +
         '확인하시고 다시 입력하시기 바랍니다.';
  Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
  BBAppend.SetFocus;
  System.Exit;
  end;

  Msg := '현재 자료를 저장하시겠습니까?';
  if IDNO = Application.MessageBox(Pchar(Msg),'[작업안내]', MB_YesNo+MB_ICONQUESTION) then
     System.Exit;

  if CB_stclass.Text = '' then
  begin
  Msg := '주식구분을 입력하세요.';
  Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
  CB_stclass.SetFocus;
  System.Exit;
  end;

  if E_stlorg.Text = '' then
  begin
  Msg := '대부기관을 입력하세요.';
  Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
  E_stlorg.SetFocus;
  System.Exit;
  end;

  Sy1 := Copy(ME_stldate.Text,1,4);
  Sm1 := Copy(ME_stldate.Text,5,2);
  Sd1 := Copy(ME_stldate.Text,7,2);
  if ME_stldate.Text <> '' then
  begin
    if DateCheck(Sy1,Sm1,Sd1) = -1 then
    begin
      Msg := '대부일자를 확인하세요.';
      Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
      ME_stldate.SetFocus;
      System.Exit;
    end;
  end;

  Sy2 := Copy(ME_stledate.Text,1,4);
  Sm2 := Copy(ME_stledate.Text,5,2);
  Sd2 := Copy(ME_stledate.Text,7,2);
  if ME_stledate.Text <> '' then
  begin
    if DateCheck(Sy2,Sm2,Sd2) = -1 then
    begin
      Msg := '대부만료일자를 확인하세요.';
      Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
      ME_stledate.SetFocus;
      System.Exit;
    end;
  end;

  if (NE_stirate.Value > 99.99) or (NE_stirate.Value < 0.00) then
  begin
    Msg := '이자율 범위(0.00~99.99)를 확인하세요.';
    Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
    NE_stirate.SetFocus;
    System.Exit;
  end;

  Sy_1 := Copy(ME_stcfdate.Text,1,4);
  Sm_1 := Copy(ME_stcfdate.Text,5,2);
  Sd_1 := Copy(ME_stcfdate.Text,7,2);
  Sy_2 := Copy(ME_stctdate.Text,1,4);
  Sm_2 := Copy(ME_stctdate.Text,5,2);
  Sd_2 := Copy(ME_stctdate.Text,7,2);
  if ME_stcfdate.Text <> '' then
  begin
    if DateCheck(Sy_1,Sm_1,Sd_1) = -1 then
    begin
      Msg := '기산일자를 확인하세요.';
      Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
      ME_stcfdate.SetFocus;
      System.Exit;
    end;
  end;

  if ME_stctdate.Text <> '' then
  begin
    if DateCheck(Sy_2,Sm_2,Sd_2) = -1 then
    begin
      Msg := '기산일자를 확인하세요.';
      Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
      ME_stctdate.SetFocus;
      System.Exit;
    end;
  end;

  if (ME_stcfdate.Text > ME_stctdate.text) then
  begin
    Msg := '기산일자범위를 확인하세요.';
    Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
    ME_stcfdate.SetFocus;
    System.Exit;
  end;


  // 저장작업
  GVariant := VarArrayOf([CB_CorpName.Text, SE_divseqnum.Value, Copy(CB_stclass.Text,1,1), E_stlorg.Text]);
  if WorkMode = 2 then
     begin
     Table1.Close;
     Table1.open;
     Table1.insert;
     Table1.FieldByName('corpname').AsString  := CB_CorpName.Text;
     Table1.FieldByName('divseqnum').AsFloat  := SE_divseqnum.Value;
     Table1.FieldByName('stclass').AsString   := Copy(CB_stclass.Text,1,1);
     Table1.FieldByName('stlorg').AsString    := E_stlorg.Text;
     Table1.fieldbyname('stldate').asstring   := ME_stldate.Text;
     Table1.fieldbyname('stledate').asstring  := ME_stledate.Text;
     Table1.fieldbyname('stirate').asstring   := FloatToStr(NE_stirate.Value);
     Table1.fieldbyname('stcfdate').asstring  := ME_stcfdate.Text;
     Table1.fieldbyname('stctdate').asstring  := ME_stctdate.Text;
     Table1.fieldbyname('ststd').assign(M_ststd.lines);
     Table1.fieldbyname('ststdd').asstring    := E_ststdd.Text;
     Table1.fieldbyname('stype').asstring     := E_stype.Text;
     Table1.fieldbyname('stesdate').asstring  := ME_stesdate.Text;
     Table1.fieldbyname('steddate').asstring  := ME_steddate.Text;
     Table1.fieldbyname('syear').asstring     := FloatToStr(NE_syear.Value);
     Table1.fieldbyname('syear2').asstring    := FloatToStr(NE_syear2.Value);
     Table1.fieldbyname('writetime').asstring := Copy(TimeDate(QryB),1,15);
     Table1.fieldbyname('writeman').asstring  := GSempno;
     Table1.post;
     Table1.close;

     Retrieve;
     Qry1.locate('corpname;divseqnum;stclass;stlorg',GVariant,[loCaseInsensitive]);
     p_help.Caption := ' 신규 자료가 저장되었습니다.';
     System.Exit;
  end;

  if WorkMode = 1 then
  begin
    Table1.Close;
    Table1.open;
    Table1.SetKey;
    Table1.FieldByName('corpname').AsString  := CB_CorpName.Text;
    Table1.FieldByName('divseqnum').AsFloat  := SE_divseqnum.Value;
    Table1.FieldByName('stclass').AsString   := Copy(CB_stclass.Text,1,1);
    Table1.FieldByName('stlorg').AsString    := E_stlorg.Text;
    if Table1.GotoKey = false then begin
       messagebeep(1);
       p_help.caption := ' 자료오류로 인해 저장할 수 없습니다.';
       exit;
    end;
    Table1.edit;
    Table1.fieldbyname('stldate').asstring   := ME_stldate.Text;
    Table1.fieldbyname('stledate').asstring  := ME_stledate.Text;
    Table1.fieldbyname('stirate').asstring   := FloatToStr(NE_stirate.Value);
    Table1.fieldbyname('stcfdate').asstring  := ME_stcfdate.Text;
    Table1.fieldbyname('stctdate').asstring  := ME_stctdate.Text;
    Table1.fieldbyname('ststd').assign(M_ststd.lines);
    Table1.fieldbyname('ststdd').asstring    := E_ststdd.Text;
    Table1.fieldbyname('stype').asstring     := E_stype.Text;
    Table1.fieldbyname('stesdate').asstring  := ME_stesdate.Text;
    Table1.fieldbyname('steddate').asstring  := ME_steddate.Text;
    Table1.fieldbyname('syear').asstring     := FloatToStr(NE_syear.Value);
    Table1.fieldbyname('syear2').asstring    := FloatToStr(NE_syear2.Value);
    Table1.fieldbyname('writetime').asstring := Copy(TimeDate(QryB),1,15);
    Table1.fieldbyname('writeman').asstring  := GSempno;
    Table1.post;
    Table1.close;

    Retrieve;
    Qry1.locate('corpname;divseqnum;stclass;stlorg',GVariant,[loCaseInsensitive]);
    p_help.Caption := ' 자료가 수정되었습니다.';
  end;
end;

// 작업취소....................................................................
procedure TFpsc30101.BB_cancelClick(Sender: TObject);
begin
  Msg := '현재 작업를 취소하시겠습니까?';
  if IDYes = Application.MessageBox(Pchar(Msg),'[작업안내]', MB_YesNo+MB_ICONQUESTION) then
     begin
     GVariant := VarArrayOf([Qry1.FieldByName('corpname').AsString,
                             Qry1.FieldByName('divseqnum').AsFloat,
                             Qry1.FieldByName('stclass').AsString,
                             Qry1.FieldByName('stlorg').AsString]);
     Retrieve;
     Qry1.locate('corpname;divseqnum;stclass;stlorg',GVariant,[loCaseInsensitive]);
     p_help.Caption := ' 작업이 취소되었습니다.';
     end;


end;

// 자료삭제....................................................................
procedure TFpsc30101.BB_delClick(Sender: TObject);
begin
     if WorkMode = 0 then
     begin
     Msg := '삭제할 대상자료가 존재하지 않습니다. ' + #13 + #13 +
            '확인하시고 다시 입력하시기 바랍니다.';
     Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
     BBAppend.SetFocus;
     System.Exit;
     end;

      if Application.MessageBox('자료를 삭제하시겠습니까?','작업안내',mb_yesno) = Id_Yes then
      begin
        Qry2.Close;
        Qry2.sql.Clear;
        Qry2.sql.Add(' delete from pshlbas                 ');
        Qry2.sql.Add(' where corpname  = :corpname         ');
        Qry2.sql.Add(' and   divseqnum = :divseqnum        ');
        Qry2.sql.Add(' and   stclass   = :stclass          ');
        Qry2.sql.Add(' and   stlorg    = :stlorg           ');
        Qry2.ParamByName('corpname').AsString := CB_CorpName.Text;
        Qry2.ParamByName('divseqnum').AsFloat := SE_divseqnum.Value;
        Qry2.ParamByName('stclass').AsString  := Copy(CB_stclass.Text,1,1);
        Qry2.ParamByName('stlorg').AsString   := E_stlorg.Text;
        Qry2.ExecSQL;
        Qry2.Close;

        Retrieve;
        P_help.Caption :=' 자료가 삭제되었습니다.';
      end;
end;

// 도움말.......................................................................
procedure TFpsc30101.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CodeString.Free;
  DataString.Free;
  CanClose := True;
end;

procedure TFpsc30101.SB_stcfdateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_stcfdate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TFpsc30101.SB_stctdateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_stctdate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TFpsc30101.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if WorkMode = 1 then
     begin
     CB_corpname.Text   := Qry1.FieldByName('corpname').AsString;
     SE_divseqnum.Value := Qry1.FieldByName('divseqnum').AsInteger;
     CB_stclass.Text    := Qry1.FieldByName('stclass').AsString + ' : ' + Qry1.FieldByName('stclass_name').AsString;
     E_stlorg.Text      := Qry1.FieldByName('stlorg').AsString;
     P_stlorg.Caption   := Qry1.FieldByName('CodeName').AsString;

     //CB_corpname.Enabled  := False;
     //SE_divseqnum.Enabled := False;
     CB_stclass.Enabled   := False;
     E_stlorg.Enabled     := False;
     SB_stlorg.Enabled    := False;

     ME_stldate.Text    := Qry1.FieldByName('stldate').AsString;
     ME_stledate.Text   := Qry1.FieldByName('stledate').AsString;
     M_ststd.lines.Assign(Qry1.FieldByName('ststd'));
     ME_stcfdate.Text   := Qry1.FieldByName('stcfdate').AsString;
     ME_stctdate.Text   := Qry1.FieldByName('stctdate').AsString;
     ME_stesdate.Text   := Qry1.FieldByName('stesdate').AsString;
     ME_steddate.Text   := Qry1.FieldByName('steddate').AsString;
     NE_stirate.Value   := Qry1.FieldByName('stirate').AsFloat;
     NE_syear2.Value    := Qry1.FieldByName('syear2').AsFloat;
     NE_syear.Value     := Qry1.FieldByName('syear').AsFloat;
     E_ststdd.Text      := Qry1.FieldByName('ststdd').AsString;
     E_stype.Text       := Qry1.FieldByName('stype').AsString;
     end;
end;

// 추가버튼 선택시..............................................................
procedure TFpsc30101.BBAppendClick(Sender: TObject);
begin
  Msg := '새로운 자료를 추가하시겠습니까?';
  if IDNO = Application.MessageBox(Pchar(Msg),'[작업안내]', MB_YesNo+MB_ICONQUESTION) then
     System.Exit;

  DataAllClear;
  CB_corpName.Text   := '하나로';
  SE_divseqnum.Value := CurDivSeqNum;
  CB_stclass.SetFocus;

  //CB_corpName.Enabled  := False;
  //SE_divseqnum.Enabled := Fale;
  WorkMode := 2;

  P_help.Caption := ' 신규자료 입력후 저장하세요.';
end;

procedure TFpsc30101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
        begin
        CodeString.Free;
        DataString.Free;
        Action := caFree
        end
     else
        Action := caNone;
end;

procedure TFpsc30101.SB_stledateClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
  if Calendar.DayCaption <> '' then
     ME_stledate.Text := Calendar.DayCaption;
  Finally
     Calendar.Free;
  end;
end;

procedure TFpsc30101.E_stypeChange(Sender: TObject);
begin
     if E_Stype.Text = '1' then
     begin
          Panel13.Visible     := True;
          Panel14.Visible     := True;
          Panel15.Visible     := False;
          Panel16.Visible     := True;
          Label3.Visible      := False;
          Label4.Visible      := True;
          ME_stesdate.Visible := True;
          SB_stesdate.Visible := True;
          ME_steddate.Visible := True;
          SB_steddate.Visible := True;
          NE_syear2.Visible   := False;
          NE_syear.Visible    := True;
     end
     else
     if E_Stype.Text = '3' then
     begin
          Panel13.Visible     := True;
          Panel14.Visible     := True;
          Panel15.Visible     := True;
          Panel16.Visible     := True;
          Label3.Visible      := True;
          Label4.Visible      := True;
          ME_stesdate.Visible := True;
          SB_stesdate.Visible := True;
          ME_steddate.Visible := True;
          SB_steddate.Visible := True;
          NE_syear2.Visible   := True;
          NE_syear.Visible    := True;
     end
     else
     begin
          Panel13.Visible     := false;
          Panel14.Visible     := false;
          Panel15.Visible     := false;
          Panel16.Visible     := false;
          Label3.Visible      := false;
          Label4.Visible      := false;
          ME_stesdate.Visible := false;
          SB_stesdate.Visible := false;
          ME_steddate.Visible := false;
          SB_steddate.Visible := false;
          NE_syear2.Visible   := false;
          NE_syear.Visible    := false;
     end;
end;

procedure TFpsc30101.E_stypeExit(Sender: TObject);
begin
     if   (E_stype.Text <> '' ) And (E_stype.Text <> '1') And
          (E_stype.Text <> '2') And (E_stype.Text <> '3') then
     begin
          Msg := Label5.Caption + #13 + #13 +
                 '상환방식을 확인하시고 다시 입력하시기 바랍니다.';
          Application.MessageBox(Pchar(msg),'[작업안내]',MB_OK+MB_ICONWARNING);
     end;
end;

end.
