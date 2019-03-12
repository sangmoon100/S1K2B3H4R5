{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출및 상환내역조회
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Psa30501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func;

type
  TFpsa30501 = class(TForm)
    Panel19: TPanel;
    Shape7: TShape;
    Phelpmsg: TPanel;
    Panel8: TPanel;
    Lempno: TLabel;
    Panel9: TPanel;
    BBroot: TBitBtn;
    BBall: TBitBtn;
    BBclose: TBitBtn;
    Panel20: TPanel;
    Eempno: TEdit;
    SBempno: TSpeedButton;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Pdeptname: TPanel;
    Panel1: TPanel;
    Pankorname: TPanel;
    DBGrid1: TDBGrid;
    SGsimm: TStringGrid;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Pjanamt: TPanel;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    OraQuery3APPDATE: TStringField;
    OraQuery3STDAMT: TFloatField;
    OraQuery3MAXAMT: TFloatField;
    OraQuery3LOANAMT: TFloatField;
    OraQuery3LOANDATE: TStringField;
    OraQuery3REPFRDATE: TStringField;
    OraQuery3REPTODATE: TStringField;
    OraQuery3REPLDATE: TStringField;
    OraQuery3ENDYN: TStringField;
    OraQuery3YYMM: TStringField;
    OraQuery3REPMM1: TIntegerField;
    OraQuery3REPMM2: TIntegerField;
    OraQuery3REPCNT: TIntegerField;
    BBonly: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SBempnoClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BBallClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BBrootClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoExit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BBonlyClick(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    StartUp, FlagOfButton : Boolean;
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, SDFM, GSpEMP : String;
    GradeOfUser, GSBoncode : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfGrid : Boolean;
    procedure SetNow;
    procedure SelectOfNameFromMasterTable( parm: String);
    function DBgridShow( param : String): Boolean;
    Procedure TitleOfStringGrid;
    procedure ClearStringGrid;
    procedure EempnoOfCheckClick;
    function  QueryCheckOfStringGrid( param1, param2 : String): Boolean;
  end;

var
  Fpsa30501: TFpsa30501;

implementation

uses KeyEmpno, Psa30502, KeyEmpnoB;
{$R *.DFM}

procedure TFpsa30501.SetNow;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
       Sql.Add('  FROM DUAL                                     ');
       Open;
       GSsysdate := FieldByName('D').AsString;
  end;
end;


procedure TFpsa30501.TitleOfStringGrid;
var  i : Integer;
begin
  for i := 1 to SGsimm.ColCount-2 do
       SGsimm.Cells[i, 0] := '+'+InttoStr(i)+'       ';
  SGsimm.Cells[SGsimm.ColCount-1, 0] := '계       ';
  SGsimm.Cells[0,0]                  := '상환횟수   ';
  SGsimm.Cells[0,1]                  := '상환월     ';
  SGsimm.cells[0,2]                  := '상환원금   ';
  SGsimm.Cells[0,3]                  := '상환이자   ';
  SGsimm.Cells[0,4]                  := '상환금계   ';
end;

////////////////////////////////////////////////////////////////////////////////
//                        사우회원검색===> 사원번호로 조회                    //
////////////////////////////////////////////////////////////////////////////////
procedure TFpsa30501.SelectOfNameFromMasterTable( parm: String);
begin
  Phelpmsg.Caption := '  사원 검색중입니다. 잠시만 기다려 주세요.';
  Application.ProcessMessages;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.EMPNO, A.KORNAME, A.ORGNUM, A.DEPTCODE, A.BONCODE   ');
       if not(parm[2] in ['0'..'9']) then
            Sql.Add('  FROM PKMPMAS A  WHERE (A.KORNAME LIKE '''+parm+'%'')  ')
       else
            Sql.Add('  FROM PKMPMAS A  WHERE (A.EMPNO LIKE '''+parm+'%'')    ');
       if GradeOfUser = 'OnlyDept' then
            Sql.Add('   AND (A.BONCODE = '''+GSBoncode+''')                  ');
       Sql.Add('   AND (A.EMPNO IN ( SELECT EMPNO FROM PSCMAN ))             ');
       Open;
  end;

  if OraQuery1.RecordCount <= 0  then
  begin
       if GradeOfUser = 'OnlyDept' then
       begin
            MessageBox(Handle,' 같은본부사원이 아닙니다','사원조회오류', mb_iconwarning);
            Eempno.SetFocus;
       end
       else
       begin
            MessageBox(Handle,' 사우회원이 아닙니다','사원조회오류', mb_iconwarning);
       end;
       Exit;
  end;
  GSBoncode          := OraQuery1.Fields[4].AsString;
  GSorgnum           := OraQuery1.Fields[2].AsString;
  GSdeptcode         := OraQuery1.Fields[3].AsString;
  GSempnoOf          := OraQuery1.FieldS[0].AsString;
  GSkornameOf        := OraQuery1.Fields[1].AsString;

  Pankorname.Caption := ' '+GSkornameOf;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NVL(SUM(JANAMT),0)    ');
       Sql.Add('  FROM PSMLOAN               ');
       Sql.Add(' WHERE EMPNO = '''+parm+'''  ');
       Sql.Add('   AND LOANDATE IS NOT NULL  ');
       Sql.Add(' GROUP BY EMPNO              ');
       Open;
  end;
  Pjanamt.Caption := Format('%12.0n', [OraQuery1.Fields[0].AsFloat]);

// 부서명 추출

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT DEPTABBR                          ');
       Sql.Add('  FROM PYCDEPT                           ');
       Sql.Add(' WHERE ORGNUM   = '''+GSorgnum+'''       ');
       Sql.Add('   AND DEPTCODE LIKE '''+GSdeptcode+'%'' ');
       Open;
       Pdeptname.Caption := '  '+FieldByName('DEPTABBR').AsString;
  end;
//  Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
//  Application.ProcessMessages;
end;

////////////////////////////////////////////////////////////////////////////////
//                        DBGRID에 자료 뿌려줌===> 사원번호로 조회            //
////////////////////////////////////////////////////////////////////////////////
function TFpsa30501.DBgridShow( param : String): Boolean;
begin
//  Phelpmsg.Caption := '  대출내역 조회중입니다.';
  Application.ProcessMessages;
  with OraQuery3 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT APPDATE, STDAMT, REPMM1, MAXAMT, REPMM2, ');
       Sql.Add('       LOANAMT, LOANDATE, REPFRDATE, REPTODATE, ');
       Sql.Add('       REPLDATE, REPCNT, ENDYN, YYMM            ');
       Sql.Add('  FROM PSMLOAN                                  ');
       Sql.Add(' WHERE EMPNO = '''+param+'''                    ');
       Sql.Add('UNION                                           ');
       Sql.Add('SELECT APPDATE, STDAMT, REPMM1, MAXAMT, REPMM2, ');
       Sql.Add('       LOANAMT, LOANDATE, REPFRDATE, REPTODATE, ');
       Sql.Add('       REPLDATE, REPCNT, ENDYN, YYMM            ');
       Sql.Add('  FROM PSHLOAN                                  ');
       Sql.Add(' WHERE EMPNO = '''+param+'''                    ');
       Sql.Add(' ORDER BY APPDATE DESC                          ');
       Open;
  end;
  if FlagOfButton = True then
  begin
       if OraQuery3.RecordCount > 0 then
       begin
            Phelpmsg.Caption := '  대출내역 조회가 완료되었습니다.';
            result := True;
       end
       else
       begin
            Phelpmsg.Caption := '  해당사번 대출내역이 없습니다.';
            result := False;
       end;
       Application.ProcessMessages;
       Exit;
  end
  else
  begin
       if OraQuery3.RecordCount > 0 then result := True
       else                              result := False;
  end;
//  Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
//  Application.ProcessMessages;
end;

procedure TFpsa30501.ClearStringGrid;
var  i, j : integer;
begin
  for i := 1 to SGsimm.ColCount do
  begin
    for j := 0 to 4 do
      SGsimm.Cells[i, j] := '';
  end;
end;

function TFpsa30501.QueryCheckOfStringGrid( param1, param2 : String): Boolean;
var  i, j : Integer;
     sum1, sum2 : Real;
begin
  sum1 := 0;
  sum2 := 0;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT REPLDATE2, REPAMT, REPINT FROM PSDREPAY              ');
       Sql.Add(' WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  ');
       Sql.Add('UNION                                                       ');
       Sql.Add('SELECT REPLDATE2, REPAMT, REPINT FROM PSHREPAY              ');
       Sql.Add(' WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  ');
       Sql.Add(' ORDER BY REPLDATE2 ASC                                     ');
       Open;
       if RecordCount <= 0 then
       begin
          result           := False;
          Phelpmsg.Caption := '  해당사번에 해당하는 자료가 없습니다.';
          Application.ProcessMessages;
          SGsimm.Enabled   := False;
          Exit;
       end;
       result := True;
  end;
  SGsimm.Enabled  := True;
  SGsimm.ColCount := OraQuery1.RecordCount + 2;
  ClearStringGrid;
  i := 1;
  TitleOfStringGrid;

  while not OraQuery1.Eof do
  begin
       SGsimm.Cells[i,0] := '+' + IntToStr(i);
       SGsimm.Cells[i,1] := Copy(OraQuery1.Fields[0].AsString, 1, 4) + '-' +
                            Copy(OraQuery1.Fields[0].AsString, 5, 2) + '-' +
                            Copy(OraQuery1.Fields[0].AsString, 7, 2);
       SGsimm.cells[i,2] := FormatFloat('#,##0', OraQuery1.Fields[1].AsFloat);
       SGsimm.Cells[i,3] := FormatFloat('#,##0', OraQuery1.Fields[2].AsFloat);
       SGsimm.Cells[i,4] := FormatFloat('#,##0', OraQuery1.Fields[1].AsFloat + OraQuery1.Fields[2].AsFloat);
       sum1              := sum1 + OraQuery1.Fields[1].AsFloat;
       sum2              := sum2 + OraQuery1.Fields[2].AsFloat;
       Inc(i);
       OraQuery1.Next;
  end;
  SGsimm.Cells[i ,1] := '';
  SGsimm.Cells[i ,2] := FormatFloat('#,##0', Sum1);
  SGsimm.Cells[i ,3] := FormatFloat('#,##0', Sum2);
  SGsimm.Cells[i ,4] := FormatFloat('#,##0', Sum1 + Sum2);
//  Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
  Application.ProcessMessages;
end;

procedure TFpsa30501.FormCreate(Sender: TObject);
begin
  StartUp := False;
end;

procedure TFpsa30501.FormActivate(Sender: TObject);
var  i : Integer;
     tMode : HIMC;
begin
  if StartUp = True then
  begin
//       Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
//       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       Exit;
  end;
  StartUp          := True;
  Phelpmsg.Caption := '  종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;
  
  Lempno.Caption   := Pkorname + '(' + Pempno +')';
  Lsysdate.Caption := fn_GetDateStr;
  Pgrade           := copy(Pgrade,3,1);

// 권한부여
// ALL      ====> 담당자 ( 제한없음 )
// OnlyDept ====> 본부까지만
// Mine     ====> 자신만 사용

//일시상환에서 사용(HeeYong 20110722)
  GSpEMP := Pempno;

  if (GSgrade = 'A') or
     (GSgrade = 'B') or
     (GSgrade = 'C') then     GradeOfUser := 'All';
  if (GSgrade = 'D') then     GradeOfUser := 'OnlyDept';
  if (GSgrade = 'E') then     GradeOfUser := 'Mine';
  FlagOfButton := True;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT BONCODE                 ');
       Sql.Add('  FROM PKMPMAS                 ');
       Sql.Add(' WHERE EMPNO = '''+GSempno+''' ');
       Open;
       GSboncode := Fields[0].AsString;
  end;

  if GradeOfUser = 'All' then
  begin
       Eempno.Text        := '';
       Pankorname.Caption := '';
       Pdeptname.Caption  := '';
  end;

  if (GradeOfUser = 'OnlyDept') or (GradeOfUser = 'Mine') then
  begin
       Eempno.Text := GSempno;
       SelectOfNameFromMasterTable(GSempno);
       DBgridShow(GSempno);
       if (GradeOfUser = 'Mine') then
       begin  // 권한이 Mine 일때 다른 사원조회 막음
            Eempno.Enabled  := False;
            SBempno.Enabled := False;
       end
       else
            Eempno.SetFocus;
  end;

  SDFM := '-';
  SetNow;
  Application.ProcessMessages;
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);
  if GradeOfUser = 'All' then
  begin
       EempnoEnter(Self);
       Eempno.SetFocus;
  end;

  Phelpmsg.Caption := '  ';
end;

procedure TFpsa30501.BBcloseClick(Sender: TObject);
begin
  Close;
end;

////////////////////////////////////////////////////////////////////////////////
//                        사원폼====> 사원번호, 권한                          //
////////////////////////////////////////////////////////////////////////////////
procedure TFpsa30501.SBempnoClick(Sender: TObject);
var  Key : Char;
begin
  Key := #13;
  EempnoEnter(Self);
{
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
       FKeyEmpno.EdEmpno.Text := Trim(Eempno.Text);
       FKeyEmpno.v_Table_Name := 'pkmpmas';
       FKeyEmpno.ShowModal;

       if FKeyEmpno.CloseChk = -1 then Exit;

       Eempno.Text        := FKeyEmpno.v_KeyEmpno;
       PanKorname.Caption := FKeyEmpno.v_KeyKorname;
  finally
       FKeyEmpno.Free;
  end;
}

  //20180701 최성일 추가  -----  start
  FKeyEmpnoB := TFKeyEmpnoB.Create(self);
  Try
    FKeyEmpnoB.EdEmpno.Text := Eempno.Text;
    FKeyEmpnoB.v_EmpGb      := 'A';   // 'M' 임원, 'Y' 파견직, 'Z' 일반직(임원 파견직 제외), 'A' 전체
    FKeyEmpnoB.v_CloseGb    := False; // True 자동닫음, False 닫지않음 - 조회대상건이 1건일때 화면을 자동으로 Close 한다.
    FKeyEmpnoB.BBrun.OnClick(Sender);
    FKeyEmpnoB.ShowModal;

    if FKeyEmpnoB.CloseChk <> -1 then
    begin
      Eempno.TExt        := FKeyEmpnoB.v_KeyEmpno;
      PanKorname.Caption := FKeyEmpnoB.v_KeyKorname;
    end;

  Finally
    FKeyEmpnoB.Free;
  end;
  //20180701 최성일 추가  ------ end

//  EempnoEnter(Self);
  EempnoKeyPress(Sender, Key);
end;

procedure TFpsa30501.EempnoEnter(Sender: TObject);
var  tMode : HIMC;
begin
  tMode              := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);
  Pankorname.Caption := '';
  Pdeptname.Caption  := '';
  Pjanamt.Caption    := '';
  SGsimm.ColCount    := 20;
  TitleOfStringGrid;
  ClearStringGrid;
  Phelpmsg.Caption   := '  입력후 ENTER KEY를 누르시거나 대출내역조회 버튼을 누르세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30501.EempnoOfCheckClick;
var EempnoOf: String;
begin
  EempnoOf := Trim(Eempno.Text);

// 사번길이가 4자이고 첫자가 숫자로 시작할때

  if (Length(EempnoOf) = 4) and (EempnoOf[2] in ['0'..'9']) then
  begin
       OraQuery1.Close;
       OraQuery1.Sql.Clear;
       OraQuery1.Sql.Add('SELECT A.EMPNO  FROM PKMPMAS A                    ');

       if EempnoOf = '' then
            OraQuery1.Sql.Add(' WHERE ')
       else if not(EempnoOf[2] in ['0'..'9']) then
            OraQuery1.Sql.Add('WHERE (A.KORNAME LIKE '''+EempnoOf+'%'') AND ')
       else
            OraQuery1.Sql.Add('WHERE (A.EMPNO LIKE '''+EempnoOf+'%'') AND   ');
       if GradeOfUser = 'OnlyDept' then
            OraQuery1.Sql.Add(' (A.BONCODE = '''+GSBoncode+''') AND         ');
       OraQuery1.Sql.Add('      (A.EMPNO IN ( SELECT EMPNO FROM PSCMAN ))   ');
       OraQuery1.Open;

       if OraQuery1.RecordCount <= 0  then
       begin
            if GradeOfUser = 'OnlyDept' then
            begin
                 MessageBox(Handle,' 같은본부사원이 아닙니다','사원조회오류', mb_iconwarning);
                 Eempno.SetFocus;
                 Exit;
            end
            else
            begin
                 MessageBox(Handle,' 사우회원이 아닙니다','사원조회오류', mb_iconwarning);
                 Exit;
            end;
       end;
       Eempno.Text := OraQuery1.Fields[0].AsString;
       EempnoOf    := Trim(Eempno.Text);
       SelectOfNameFromMasterTable(EempnoOf);
       DBgridShow(EempnoOf);
  end;
//  Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
//  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30501.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFpsa30501.SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var  Oldalign : Integer;
begin
  if ((row = 2) or (row = 4)) and (col >= 1) then
       with (Sender as TStringGrid).Canvas do
       Begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;
  if (col = SGsimm.ColCount-1) and (row > 0) then
       with (Sender as TStringGrid).Canvas do
       begin
            Brush.Color := $00D5FFD5;
            Fillrect(Rect);
            TextOut(rect.Left, rect.Top, SGsimm.Cells[Col,Row]);
       end;
  if (row = 0) or (col < 1) then
       SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style + [fsbold];

//  if (row = 1) and (col > 0) then
//  begin
//       Oldalign := SetTextAlign(SGsimm.Canvas.Handle,ta_center);
//       SGsimm.Canvas.Textrect(rect, rect.Left + (rect.right - rect.Left) div 2, rect.top+2, SGsimm.Cells[col,row]);
//       SetTextAlign(SGsimm.Canvas.Handle,Oldalign);
//  end;
  if col >= 0 then
  begin
       Oldalign := SetTextAlign(SGsimm.Canvas.Handle,ta_right);
       SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);
       SetTextAlign(SGsimm.Canvas.Handle,Oldalign);
  end
  else
       SGsimm.Canvas.Textrect(rect, rect.right-2, rect.top+2, SGsimm.Cells[col,row]);
  SGsimm.Canvas.Font.Style := SGsimm.Canvas.Font.Style - [fsbold];
end;

procedure TFpsa30501.BBallClick(Sender: TObject);
begin
  if Pankorname.Caption = '' then
  begin
       Beep;
       Phelpmsg.Caption := '  사원을 선택하세요.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       if GradeOfUser = 'Mine' then
       else
         Eempno.SetFocus;
       Exit;
  end;
  Phelpmsg.Caption := '  상세내역 조회중입니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
  if QueryCheckOfStringGrid(Trim(Eempno.Text), OraQuery3APPDATE.AsString) then
  Begin
       Phelpmsg.Caption := '  상세내역 조회가 완료되었습니다.';
       // jissi 2014.07.16 상세내역이 하나도 없는 대출자 일시상환시 버튼활성화 안되는 문제-주석처리 후 밖으로 뺌
       // If (OraQuery3ENDYN.AsString = 'N') Then BBonly.Enabled := True
       // Else BBonly.Enabled := False;
  End else
  begin
       SGsimm.ColCount  := 20;
       ClearStringGrid;
       Phelpmsg.Caption := '  해당사번 상세내역이 없습니다.';
  end;
  // jissi 2014.07.16 상세내역이 하나도 없는 대출자 일시상환시 버튼활성화
  If (OraQuery3ENDYN.AsString = 'N') Then BBonly.Enabled := True
  Else BBonly.Enabled := False;
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30501.DBGrid1CellClick(Column: TColumn);
begin
  DataSource1DataChange(Self , OraQuery3APPDATE);
end;

procedure TFpsa30501.BBrootClick(Sender: TObject);
//var  Key : Char;
begin
{
  Key := #13;
  FlagOfButton := True;
  SGsimm.ColCount := 20;
  ClearStringGrid;
  TitleOfStringGrid;
  EempnoKeyPress(Self, Key);
//  FlagOfButton := False;
//  if DBgridShow(Trim(Eempno.Text)) then
//    Phelpmsg.Caption := '  대출내역 조회가 완료되었습니다.'
//  else
//    Phelpmsg.Caption := '  해당사번 대출내역이 없습니다.';
//  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
}
end;

procedure TFpsa30501.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
// Enter 키를 누를때
  while (Key = #13)  do
  begin
       Key := #0;
       if (Length(Trim(Eempno.Text)) = 4) and (Eempno.Text[2] in ['0'..'9'])  then
       begin
            EempnoOfCheckClick;
            Exit;
       end;
       SBempnoClick(Self);
//       EempnoOfCheckClick;
       Exit;
  end;
end;

procedure TFpsa30501.EempnoExit(Sender: TObject);
var  tMode : HIMC;
begin
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_ALPHANUMERIC, IME_CMODE_ALPHANUMERIC);
end;

procedure TFpsa30501.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  BBallClick(Self);
end;

procedure TFpsa30501.BBonlyClick(Sender: TObject);
begin
  if Eempno.Text = '' then
  begin
    Phelpmsg.Caption := '  사원을 선택하세요.';
    SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
    Exit;
  end else
  begin
    try
      Fpsa30502 := TFpsa30502.Create(Self);
      Fpsa30502.ShowModal;

      if Fpsa30502.GSclose = 1 then
      begin
        EempnoOfCheckClick;
        Phelpmsg.Caption := '  일시상환작업이 완료되었습니다.';
        SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
      end Else
      Begin
        Phelpmsg.Caption := '  일시상환작업이 취소되었습니다.';
        SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
      End;

    except on E:Exception do
      begin
        MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                  Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;
  end;
end;

end.

