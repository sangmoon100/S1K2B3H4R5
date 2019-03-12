{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출및 상환내역조회
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 이희용
  VERSION        : 1.00
  DATE           : 2012.02.08
  UPDATE  CONTENTS
   1.00   2012.02.08     이희용        신규프로그램개발            상환내역조회
   1.05   2013.05.20     지순미        Setfocus Error 수정
-------------------------------------------------------------------------------}
unit Psa30503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnScheme, peoutlookbtn, OnEditBaseCtrl,
  OnEditStdCtrl, OnGrDBGrid, OnDBGrid;

type
  TFpsa30503 = class(TForm)
    Phelpmsg: TPanel;
    Panel20: TPanel;
    Pdeptname: TPanel;
    Panel1: TPanel;
    Pankorname: TPanel;
    DBGrid1: TDBGrid;
    SGsimm: TStringGrid;
    DataSource1: TDataSource;
    TMaxSession: TTMaxSession;
    TDS_Grid: TTMaxDataSet;
    TDS_Grid2: TTMaxDataSet;
    TDS_Grid3: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    BBclose: TPeJeonOutLookBtn;
    Pjanamt: TOnEdit;
    Eempno: TOnEdit;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BBallClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoExit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
  public
    { Public declarations }
    FlagOfButton : Boolean;
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, SDFM, GSpEMP, FG_Date, SqlText : String;
    GradeOfUser, GSBoncode : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfGrid : Boolean;
    procedure SelectOfNameFromMasterTable( parm: String);
    function DBgridShow( param : String): Boolean;
    Procedure TitleOfStringGrid;
    procedure ClearStringGrid;
    procedure EempnoOfCheckClick;
    function  QueryCheckOfStringGrid( param1, param2 : String): Boolean;
    procedure EmpFind(vEmpno : String);
  end;

var
  Fpsa30503: TFpsa30503;

implementation

uses KeyEmpno;
{$R *.DFM}

procedure TFpsa30503.FormActivate(Sender: TObject);
begin

end;

////////////////////////////////////////////////////////////////////////////////
//                        사우회원검색===> 사원번호로 조회                    //
////////////////////////////////////////////////////////////////////////////////
procedure TFpsa30503.SelectOfNameFromMasterTable( parm: String);
begin
  Phelpmsg.Caption := '  사원 검색중입니다. 잠시만 기다려 주세요.';
  Application.ProcessMessages;

  SqlText := ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM, A.DEPTCODE, A.BONCODE ';

  if not(parm[2] in ['0'..'9']) then
    SqlText := SqlText + ' FROM PKMPMAS A  WHERE (A.KORNAME LIKE '''+parm+'%'') '
  else
    SqlText := SqlText + ' FROM PKMPMAS A  WHERE (A.EMPNO LIKE '''+parm+'%'') ';

  if GradeOfUser = 'OnlyDept' then
    SqlText := SqlText + ' AND (A.BONCODE = '''+GSBoncode+''') ';

  SqlText := SqlText + ' AND (A.EMPNO IN ( SELECT EMPNO FROM PSCMAN )) ';

  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(SqlText);
    ClearFieldInfo; 
    AddField('EMPNO'   , ftString ,100);
    AddField('KORNAME' , ftString ,100);
    AddField('ORGNUM'  , ftString ,100);
    AddField('DEPTCODE', ftString ,100);
    AddField('BONCODE' , ftString ,100);
    Open;

    GSBoncode   := Fields[4].AsString;
    GSorgnum    := Fields[2].AsString;
    GSdeptcode  := Fields[3].AsString;
    GSempnoOf   := Fields[0].AsString;
    GSkornameOf := Fields[1].AsString;

    if RecordCount <= 0  then
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
    Pankorname.Caption := ' '+GSkornameOf;
  end;

  SqlText := ' SELECT NVL(SUM(JANAMT),0) JANAMT, ''field2'',''field3'', ''field4'',''field5'' '+
             ' FROM PSMLOAN '+
             ' WHERE EMPNO = '''+parm+''' '+
             '   AND LOANDATE IS NOT NULL '+
             ' GROUP BY EMPNO             ';

  with TDS_Grid3 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(SqlText);
    ClearFieldInfo;

    AddField('JANAMT', ftFloat, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;

    Pjanamt.Text := Format('%12.0n', [Fields[0].AsFloat]);
  end;

  SqlText := ' SELECT DEPTABBR, ''field2'',''field3'', ''field4'',''field5'' '+
              ' FROM PYCDEPT '+
              ' WHERE ORGNUM = '''+GSorgnum+''' '+
              '   AND DEPTCODE LIKE '''+GSdeptcode+'%'' ';

  // 부서명 추출
  with TDS_Grid3 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(SqlText);
    ClearFieldInfo;

    AddField('DEPTABBR' ,ftString, 100);
    AddField('field2'   ,ftString, 100);
    AddField('field3'   ,ftString, 100);
    AddField('field4'   ,ftString, 100);
    AddField('field5'   ,ftString, 100);
    Open;

    Pdeptname.Caption := '  '+FieldByName('DEPTABBR').AsString;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                        DBGRID에 자료 뿌려줌===> 사원번호로 조회            //
////////////////////////////////////////////////////////////////////////////////
function TFpsa30503.DBgridShow( param : String): Boolean;
begin
//  Phelpmsg.Caption := '  대출내역 조회중입니다.';
  Application.ProcessMessages;

  with TDS_Grid2 do
  begin
    SqlText := Format(' SELECT APPDATE, STDAMT, REPMM1, MAXAMT, REPMM2, '+
                      '        LOANAMT, LOANDATE, REPFRDATE, REPTODATE, REPLDATE, '+
                      '         REPCNT, ENDYN, YYMM            '+
                      ' FROM PSMLOAN                                    '+
                      '   WHERE EMPNO = ''%s'' '+
                      ' UNION                                           '+
                      ' SELECT APPDATE, STDAMT, REPMM1, MAXAMT, REPMM2, '+
                      '        LOANAMT, LOANDATE, REPFRDATE, REPTODATE, REPLDATE, '+
                      '        REPCNT, ENDYN, YYMM            '+
                      '   FROM PSHLOAN                                  '+
                      '   WHERE EMPNO = ''%s'' '+
                      '  ORDER BY APPDATE DESC                          ',[param, param]);

    Close;

    ServiceName := 'PSA30501_sel1';
    ClearFieldInfo;  
    AddField('APPDATE'   , ftString, 8);
    AddField('STDAMT'    , ftFloat, 12);
    AddField('REPMM1'    , ftString, 2);
    AddField('MAXAMT'    , ftFloat, 12);
    AddField('REPMM2'    , ftString, 2);
    AddField('LOANAMT'   , ftFloat, 12);
    AddField('LOANDATE'  , ftString, 8);
    AddField('REPFRDATE' , ftString, 6);
    AddField('REPTODATE' , ftString, 6);
    AddField('REPLDATE'  , ftString, 6);
    AddField('REPCNT'    , ftString, 2);
    AddField('ENDYN'     , ftString, 1);
    AddField('YYMM'      , ftString, 6);

    ClearParamInfo;
    SQL.Text := SqlText; 
    Open;

    FieldByName('APPDATE').EditMask   := '!9999/99/99;0;_';
    TFloatField(FieldByName('STDAMT')).DisplayFormat  := '#,##0';
    TFloatField(FieldByName('MAXAMT')).DisplayFormat  := '#,##0';
    TFloatField(FieldByName('LOANAMT')).DisplayFormat := '#,##0';
    FieldByName('LOANDATE').EditMask  := '!9999/99/99;0;_';
    FieldByName('REPFRDATE').EditMask := '!9999/99;0;_';
    FieldByName('REPTODATE').EditMask := '!9999/99;0;_';
    FieldByName('REPLDATE').EditMask  := '!9999/99;0;_';
  end;

  if FlagOfButton = True then
  begin
    if TDS_Grid.RecordCount > 0 then
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
    if TDS_Grid.RecordCount > 0 then result := True
    else                             result := False;
  end;
end;

procedure TFpsa30503.ClearStringGrid;
var  i, j : integer;
begin
  for i := 1 to SGsimm.ColCount do
  begin
    for j := 0 to 4 do
      SGsimm.Cells[i, j] := '';
  end;
end;

procedure TFpsa30503.TitleOfStringGrid;
var  i : Integer;
begin
  for i := 1 to SGsimm.ColCount-2 do
    SGsimm.Cells[i, 0] := '+'+InttoStr(i)+'    ';

  SGsimm.Cells[SGsimm.ColCount-1, 0] := '계       ';
  SGsimm.Cells[0,0]                  := '상환횟수 ';
  SGsimm.Cells[0,1]                  := '상환월   ';
  SGsimm.cells[0,2]                  := '상환원금 ';
  SGsimm.Cells[0,3]                  := '상환이자 ';
  SGsimm.Cells[0,4]                  := '상환금계 ';
end;

function TFpsa30503.QueryCheckOfStringGrid( param1, param2 : String): Boolean;
var  i, j : Integer;
     sum1, sum2 : Real;
begin
  sum1 := 0;
  sum2 := 0;

  SqlText := ' SELECT REPLDATE2, REPAMT, REPINT, ''field4'',''field5'' FROM PSDREPAY '+
             '  WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  '+
             ' UNION                                                       '+
             ' SELECT REPLDATE2, REPAMT, REPINT, ''field4'',''field5'' FROM PSHREPAY '+
             '  WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  '+
             '  ORDER BY REPLDATE2 ASC                                     ';

  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(SqlText);

    ClearFieldInfo;
    AddField('REPLDATE2',ftString, 100);
    AddField('REPAMT'   ,ftString, 100);
    AddField('REPINT'   ,ftString, 100);
    AddField('field4'   ,ftString, 100);
    AddField('field5'   ,ftString, 100);
    Open;

    if RecordCount <= 0  then
    begin
      result           := False;
      Phelpmsg.Caption := '  해당사번에 해당하는 자료가 없습니다.';
      Application.ProcessMessages;
      SGsimm.Enabled   := False;
      Exit;
    end;
  end;
  result := True;

  SGsimm.Enabled  := True;
  SGsimm.ColCount := TDS_Grid.RecordCount + 2;
  ClearStringGrid;
  i := 1;
  TitleOfStringGrid;

  while not TDS_Grid.Eof do
  begin
    SGsimm.Cells[i,0] := '+' + IntToStr(i);
    SGsimm.Cells[i,1] := Copy(TDS_Grid.Fields[0].AsString, 1, 4) + '-' +
                         Copy(TDS_Grid.Fields[0].AsString, 5, 2) + '-' +
                         Copy(TDS_Grid.Fields[0].AsString, 7, 2);
    SGsimm.cells[i,2] := FormatFloat('#,##0', TDS_Grid.Fields[1].AsFloat);
    SGsimm.Cells[i,3] := FormatFloat('#,##0', TDS_Grid.Fields[2].AsFloat);
    SGsimm.Cells[i,4] := FormatFloat('#,##0', TDS_Grid.Fields[1].AsFloat + TDS_Grid.Fields[2].AsFloat);
    sum1              := sum1 + TDS_Grid.Fields[1].AsFloat;
    sum2              := sum2 + TDS_Grid.Fields[2].AsFloat;
    Inc(i);
    TDS_Grid.Next;
  end;
  SGsimm.Cells[i ,1] := '';
  SGsimm.Cells[i ,2] := FormatFloat('#,##0', Sum1);
  SGsimm.Cells[i ,3] := FormatFloat('#,##0', Sum2);
  SGsimm.Cells[i ,4] := FormatFloat('#,##0', Sum1 + Sum2);
//  Phelpmsg.Caption := '  상환내역작업을 시작하세요.';
  Application.ProcessMessages;
end;

procedure TFpsa30503.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa30503.EempnoEnter(Sender: TObject);
var  tMode : HIMC;
begin
  tMode              := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);
  Pankorname.Caption := '';
  Pdeptname.Caption  := '';
  Pjanamt.Text       := '';
  SGsimm.ColCount    := 20;
  TitleOfStringGrid;
  ClearStringGrid;
  Phelpmsg.Caption   := '  입력후 ENTER KEY를 누르시거나 대출내역조회 버튼을 누르세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30503.EempnoOfCheckClick;
var EempnoOf: String;
begin
  EempnoOf := Trim(Eempno.Text);

  // 사번길이가 4자이고 첫자가 숫자로 시작할때
  if (Length(EempnoOf) = 4) and (EempnoOf[2] in ['0'..'9']) then
  begin
    Sqltext := ' SELECT EMPNO, KORNAME, ORGNUM, DEPTCODE, BONCODE FROM PKMPMAS ';

    if EempnoOf = '' then
      Sqltext := Sqltext + ' WHERE '
    else if not(EempnoOf[2] in ['0'..'9']) then
      Sqltext := Sqltext + ' WHERE (KORNAME LIKE '''+EempnoOf+'%'') AND '
    else
      Sqltext := Sqltext + ' WHERE (EMPNO LIKE '''+EempnoOf+'%'') AND   ';

    if GradeOfUser = 'OnlyDept' then
      Sqltext := Sqltext + ' BONCODE = '''+GSBoncode+''') AND  ';

    Sqltext := Sqltext + ' (EMPNO IN ( SELECT EMPNO FROM PSCMAN )) ';

    with TDS_Grid do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add(SqlText);
      ClearFieldInfo;

      AddField('EMPNO',   ftString, 100);
      AddField('KORNAME', ftString, 100);
      AddField('ORGNUM',  ftString, 100);
      AddField('DEPTCODE',ftString, 100);
      AddField('BONCODE', ftString, 100);

      Open;

      if RecordCount <= 0  then
      begin
        if GradeOfUser = 'OnlyDept' then
        begin
          MessageBox(Handle,' 같은본부사원이 아닙니다','사원조회오류', mb_iconwarning);
          Eempno.SetFocus;
          Exit;
        end
        else begin
          MessageBox(Handle,' 사우회원이 아닙니다','사원조회오류', mb_iconwarning);
          Exit;
        end;
      end;
      Eempno.Text := TDS_Grid.Fields[0].AsString;
      EempnoOf    := Trim(Eempno.Text);
      SelectOfNameFromMasterTable(EempnoOf);
      DBgridShow(EempnoOf);
    end;
  end;
end;

procedure TFpsa30503.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFpsa30503.SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
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

procedure TFpsa30503.BBallClick(Sender: TObject);
begin
  if Pankorname.Caption = '' then
  begin
       Beep;
       Phelpmsg.Caption := '  사원을 선택하세요.';
       SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
       if GradeOfUser = 'Mine' then
       else  if PGrade < 'C' then
       begin
         //2013.05.20 jissi Setfocus Error 수정
         Eempno.Enabled := true;
         Eempno.SetFocus;
       end;
       Exit;
  end;
  Phelpmsg.Caption := '  상세내역 조회중입니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);


  if QueryCheckOfStringGrid(Trim(Eempno.Text), TDS_Grid2.Fields[0].AsString) then
  Begin
    Phelpmsg.Caption := '  상세내역 조회가 완료되었습니다.';
  End else
  begin
       SGsimm.ColCount  := 20;
       ClearStringGrid;
       Phelpmsg.Caption := '  해당사번 상세내역이 없습니다.';
  end;
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa30503.DBGrid1CellClick(Column: TColumn);
begin
  DataSource1DataChange(Self, DBGrid1.Fields[0]);
end;

procedure TFpsa30503.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
// Enter 키를 누를때
  while (Key = #13)  do
  begin
    Key := #0;
    if (Length(Trim(Eempno.Text)) = 4) and (Eempno.Text[2] in ['0'..'9'])  then
    begin
      EempnoOfCheckClick;
      EmpFind(Trim(Eempno.Text));
      Exit;
    end;

    Exit;
  end;
end;

procedure TFpsa30503.EempnoExit(Sender: TObject);
var  tMode : HIMC;
begin
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_ALPHANUMERIC, IME_CMODE_ALPHANUMERIC);
end;

procedure TFpsa30503.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  BBallClick(Self);
end;

procedure TFpsa30503.FormCreate(Sender: TObject);
begin
  Phelpmsg.Caption := '종합인사 시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
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
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  Eempno.Enabled  := False;    
end;

procedure TFpsa30503.FormShow(Sender: TObject);
var  i : Integer;
begin
  Phelpmsg.Caption := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);
  Pgrade            := copy(GSgrade,3,1);

  Eempno.text := GSempno;
  EmpFind(GSempno);

  if PGrade < 'C' then
  begin
       Eempno.Enabled := True;
  end;
end;

procedure TFpsa30503.EmpFind(vEmpno : String);
var  tMode : HIMC;
begin                      
// 권한부여
// ALL      ====> 담당자 ( 제한없음 )
// OnlyDept ====> 본부까지만
// Mine     ====> 자신만 사용

//일시상환에서 사용(HeeYong 20110722)
  GSpEMP := Pempno;
  FlagOfButton := True;

  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := ' SELECT BONCODE, ''field2'',''field3'', ''field4'',''field5'' FROM PKMPMAS '+
                ' WHERE EMPNO = '''+vEmpno+''' ';

    ClearFieldInfo;
    AddField('BONCODE', ftString, 100);
    AddField('field2' , ftString, 100);
    AddField('field3' , ftString, 100);
    AddField('field4' , ftString, 100);
    AddField('field5' , ftString, 100);
    Open;

    GSboncode :=  FieldByName('BONCODE').AsString;
  end;

  SelectOfNameFromMasterTable(vEmpno);
  DBgridShow(vEmpno);

  SDFM := '-';
  Application.ProcessMessages;
  tMode := ImmGetContext(Eempno.handle);
  ImmSetConversionStatus(tMode, IME_CMODE_HANGEUL, IME_CMODE_HANGEUL);

  if GradeOfUser = 'All' then
  begin
    EempnoEnter(Self);
    Eempno.SetFocus;
  end;
end;

end.

