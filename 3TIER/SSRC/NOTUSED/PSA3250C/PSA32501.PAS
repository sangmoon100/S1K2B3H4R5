{=============================== Program Header ================================
 PROGRAM-NAME   : 사내근로복지기금 대출 및 상환 내역조회[PSA3250C]
 SYSTEM-NAME    : 복리후생
 SUBSYSTEM-NAME : 사내근로복지기금 대출
 Programmer     : 사내근로복지기금 대출 및 상환 내역조회
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.5.23     이희용   신규개발                    노사협력팀 요청
================================================================================}

unit Psa32501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme;

type
  TFpsa32501 = class(TForm)
    Phelpmsg: TPanel;
    SGsimm: TStringGrid;
    DataSource1: TDataSource;
    TMaxSession: TTMaxSession;
    TDS_Grid: TTMaxDataSet;
    TDS_Grid2: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Eempno: TTMaxPersonPopupEdit;
    Pankorname: TOnEdit;
    Pdeptname: TOnEdit;
    Pjanamt: TOnEdit;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    DBGrid1: TOnGrDbGrid;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    Panel3: TPanel;
    BBclose: TOnFocusButton;
    BBonly: TOnFocusButton;
    TMaxDataSet1: TTMaxDataSet;
    procedure BBcloseClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoReadEnded(Sender: TObject);
    procedure BBonlyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
    function CheckOfMember(Parameter: String): Boolean;
  public
    { Public declarations }
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, GSpEMP, FG_Date, SqlText : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfGrid : Boolean;
    procedure SetNow;
    Procedure TitleOfStringGrid;
    procedure ClearStringGrid;
    function  QueryCheckOfStringGrid( param1, param2 : String): Boolean;
    procedure Selete_Data;
    procedure DBgridShow;
  end;

var
  Fpsa32501: TFpsa32501;
  vAdmin  : Boolean;
  fsAPPDATE : String;

implementation

uses KeyEmpno, Psa32502;
{$R *.DFM}

procedure TFpsa32501.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
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
  ///////////////////////////////////////////////////////////////////////
  //관리자
  vAdmin := False;
  Phelpmsg.Caption := '';
end;

procedure TFpsa32501.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);

  Lempno.Caption    := GSkorname + '(' + GSempno +')';
  Lsysdate.Caption  := Copy(FG_Date,1,4)+'/'+Copy(FG_Date,5,2)+'/'+Copy(FG_Date,7,2);
  Pgrade            := copy(GSgrade,3,1);

  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := ' Select Groupid, ''F2'', ''F3'', ''F4'', ''F5'' '+
                '  from pymenuuser     '+
                ' WHERE LOCKYN = ''N'' '+
                '   AND empno = '''+ GSempno +''' ';

    ClearFieldInfo;
    AddField('Groupid', ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    if ((FieldByName('Groupid').AsString = 'G001') or (FieldByName('Groupid').AsString = 'G052')) Then
      vAdmin := True;

    if Not(vAdmin) Then
    Begin
      if RecordCount = 0 Then
      Begin
        if not CheckOfMember(Trim(Copy(Eempno.Text,1,4))) then
        begin
          MessageDlg('사내복지기금 대출대상이 아닙니다.', mtWarning, [mbOK], 0);
          Close;
        end;
      End;
    End;

    Close;
  end;

  SetNow;
  if vAdmin then Eempno.Enabled := True;
  Eempno.Text := GSempno;

  //일시상환에서 사용(HeeYong 20110722)
  GSpEMP      := GSempno;
  Eempno.Text := GSempno;

  Eempno.PL_get_singledata;
  Pankorname.Text := Eempno.korname;
  Pdeptname.Text  := Eempno.deptname;
end;

procedure TFpsa32501.Selete_Data;
Begin
  with TMaxDataSet1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ' SELECT NVL(SUM(JANAMT),0) HAP, ' +
                ' ''F2'', ''F3'', ''F4'', ''F5'' ' +
                ' FROM PSNLOAN ' +
                ' WHERE EMPNO = '''+Copy(Eempno.Text,1,4)+'''  ' +
                ' AND LOANDATE IS NOT NULL  ' +
                ' GROUP BY EMPNO ' ;

    ClearFieldInfo;
    AddField('HAP',ftFloat,  100);
    AddField('F2' ,ftString, 100);
    AddField('F3' ,ftString, 100);
    AddField('F4' ,ftString, 100);
    AddField('F5' ,ftString, 100);
    Open;

    Pjanamt.text := Format('%13.0n', [FieldByName('HAP').AsFloat]);
  end;
(*
  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    SQL.Clear;
    Sql.Text := ' SELECT A.EMPNO, A.KORNAME, ' +
                '        (SELECT DEPTNAME FROM PYCDEPT ' +
                '         WHERE DEPTCODE = A.DEPTCODE  ' +
                '           AND ORGNUM   = (SELECT VALUE1 FROM PIMVARI ' +
                '                           WHERE GUBUN  = ''00'' ' +
                '                             AND SGUBUN = ''0001'')) DEPTNAME, ' +
                '         ''F4'', ''F5'' ' +
                ' FROM PKMPMAS A ';

    Sql.Text := Sql.Text + Format(' WHERE A.EMPNO = ''%s'' ', [Copy(Eempno.Text,1,4)]);

    ClearFieldInfo;
    AddField('EMPNO'    ,ftString, 100);
    AddField('KORNAME'  ,ftString, 100);
    AddField('DEPTNAME' ,ftString, 100);
    AddField('F4'       ,ftString, 100);
    AddField('F5'       ,ftString, 100);
    Open;

    Eempno.text     := FieldByName('EMPNO').AsString;
    Pankorname.text := FieldByName('KORNAME').AsString;
    Pdeptname.text  := FieldByName('DEPTNAME').AsString;
  end;
*)
  DBgridShow;
End;


procedure TFpsa32501.DBgridShow;
begin
  DBGrid1.Refresh;

  Phelpmsg.Caption := '  대출내역 조회중입니다.';

  with TDS_Grid2 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    Sql.Text := Format(' SELECT APPDATE,  STDAMT,    REPMM1, LOANAMT, '+  //신청일,     신청금액,   상환기간, 대출금,
                       '        LOANDATE, REPFRDATE, REPTODATE, '+        //대출일,     상환개시월, 상환만료월,
                       '        REPLDATE, REPCNT,    ENDYN  '+            //최종상환월, 상환횟수,   만료여부
                       ' FROM PSNLOAN                 '+    // 대출신청지급
                       '   WHERE EMPNO = ''%s''       '+
                       ' UNION                        '+
                       ' SELECT APPDATE,  STDAMT,    REPMM1, LOANAMT, '+
                       '        LOANDATE, REPFRDATE, REPTODATE, '+
                       '        REPLDATE, REPCNT,    ENDYN  '+
                       '   FROM PSELOAN               '+    // 대출만기자
                       '   WHERE EMPNO = ''%s''       '+
                       '  ORDER BY APPDATE DESC ',[Copy(Eempno.Text,1,4), Copy(Eempno.Text,1,4)]);

    ClearFieldInfo;
    AddField('APPDATE'  ,ftString, 100);
    AddField('STDAMT'   ,ftFloat , 100);
    AddField('REPMM1'   ,ftString, 100);
    AddField('LOANAMT'  ,ftFloat , 100);
    AddField('LOANDATE' ,ftString, 100);
    AddField('REPFRDATE',ftString, 100);
    AddField('REPTODATE',ftString, 100);
    AddField('REPLDATE' ,ftString, 100);
    AddField('REPCNT'   ,ftString, 100);
    AddField('ENDYN'    ,ftString, 100);
    Open;

    fsAPPDATE :=  FieldByName('APPDATE').AsString;

    FieldByName('APPDATE').EditMask   := '!9999/99/99;0;_';
    TFloatField(FieldByName('STDAMT')).DisplayFormat := '#,##0';
    TFloatField(FieldByName('LOANAMT')).DisplayFormat := '#,##0';
    FieldByName('LOANDATE').EditMask  := '!9999/99/99;0;_';
    FieldByName('REPFRDATE').EditMask := '!9999/99;0;_';
    FieldByName('REPTODATE').EditMask := '!9999/99;0;_';
    FieldByName('REPLDATE').EditMask  := '!9999/99;0;_';
  end;

  DBGrid1.Fields[0].Alignment  := taCenter;
  DBGrid1.Fields[1].Alignment  := taRightJustify;
  DBGrid1.Fields[2].Alignment  := taCenter;
  DBGrid1.Fields[3].Alignment  := taRightJustify;
  DBGrid1.Fields[4].Alignment  := taCenter;
  DBGrid1.Fields[5].Alignment  := taCenter;
  DBGrid1.Fields[6].Alignment  := taCenter;
  DBGrid1.Fields[7].Alignment  := taCenter;
  DBGrid1.Fields[8].Alignment  := taCenter;
  DBGrid1.Fields[9].Alignment  := taCenter;

  if TDS_Grid2.RecordCount > 0 then
    Phelpmsg.Caption := '  대출내역 조회가 완료되었습니다.'
  else
    Phelpmsg.Caption := '  해당사번 대출내역이 없습니다.';

  DbGrid1CellClick(nil);
end;

procedure TFpsa32501.DBGrid1CellClick(Column: TColumn);
begin
 if Pankorname.Text = '' then
  begin
    Beep;
    Phelpmsg.Caption := '  사원을 선택하세요.';
    SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
    Eempno.SetFocus;
    Exit;
  end;
  Phelpmsg.Caption := '  상세내역 조회중입니다.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);

  if QueryCheckOfStringGrid(Trim(Copy(Eempno.Text,1,4)), TDS_Grid2.Fields[0].AsString) then
  Begin
    if   TDS_Grid2.Fields[9].AsString = 'N' Then
    Begin
      BBonly.Visible := True;
      BBonly.SetFocus;
    End  
    Else BBonly.Visible := False;
    Phelpmsg.Caption := '  상세내역 조회가 완료되었습니다.';
  End else
  begin
    BBonly.Visible   := False;
    SGsimm.ColCount  := 20;
    ClearStringGrid;
    Phelpmsg.Caption := '  해당사번 상세내역이 없습니다.';
  end;

  //관리자가 아니면 무조건 일시상환 바튼 비활성화.
  If Not(vAdmin) Then BBonly.Visible   := False;

  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

function TFpsa32501.QueryCheckOfStringGrid( param1, param2 : String): Boolean;
var  i, j : Integer;
     sum1, sum2 : Real;
begin
  sum1 := 0;
  sum2 := 0;

  with TDS_Grid do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText := ' SELECT REPLDATE2, REPAMT, REPINT, ''field4'',''field5'' FROM PSNREPAY '+  //대출상환
               '  WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  '+
               ' UNION                                                       '+
               ' SELECT REPLDATE2, REPAMT, REPINT, ''field4'',''field5'' FROM PSOREPAY '+  //대출만기
               '  WHERE EMPNO = '''+param1+''' AND APPDATE = '''+param2+'''  '+
               '  ORDER BY REPLDATE2 ASC                                     ';

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
  Application.ProcessMessages;
end;

procedure TFpsa32501.ClearStringGrid;
var  i, j : integer;
begin
  for i := 1 to SGsimm.ColCount do
  begin
    for j := 0 to 4 do
      SGsimm.Cells[i, j] := '';
  end;
end;

procedure TFpsa32501.TitleOfStringGrid;
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

procedure TFpsa32501.EempnoEnter(Sender: TObject);
var  tMode : HIMC;
begin
  Pankorname.Text := '';
  Pdeptname.Text  := '';
  Pjanamt.Text    := '';
  SGsimm.ColCount := 20;
  TitleOfStringGrid;
  ClearStringGrid;
  Phelpmsg.Caption   := '  입력후 ENTER KEY를 누르시거나 대출내역조회 버튼을 누르세요.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa32501.SGsimmDrawCell(Sender: TObject; Col, Row: Integer;
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

procedure TFpsa32501.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Eempno.PL_get_singledata;
    Eempno.Text     := Copy(Eempno.empno,1,4);
    Pankorname.Text := Eempno.korname;
    Pdeptname.Text  := Eempno.deptname;

    Selete_Data;
    Key := #0;
  end;
end;

procedure TFpsa32501.EempnoReadEnded(Sender: TObject);
begin
  Eempno.Text    := Copy(Eempno.empno,1,4);
  Pankorname.Text := Eempno.korname;
  Pdeptname.Text := Eempno.deptname;

  Selete_Data;
end;

procedure TFpsa32501.BBonlyClick(Sender: TObject);
begin
  if Eempno.Text = '' then
  begin
    Phelpmsg.Caption := '  사원을 선택하세요.';
    SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
    Exit;
  end else
  begin
    try
      Fpsa32502 := TFpsa32502.Create(Self);
      Fpsa32502.ShowModal;

      if Fpsa32502.GSclose = 1 then
      begin
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

// 사우회원인지 여부 체크 리턴값은 TRUE or FALSE
function TFpsa32501.CheckOfMember(Parameter: String): Boolean;
begin
  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := Format('SELECT EMPNO,  ''field2'', ''field3'', ''field4'',''field5'' '+
                       'FROM   PSCMAN ' +
                       'WHERE  EMPNO = ''%s'' AND RETDATE IS NULL  ',[Parameter]);

    ClearFieldInfo;
    AddField('EMPNO',  ftString, 100);
    AddField('field2', ftString, 100);
    AddField('field3', ftString, 100);
    AddField('field4', ftString, 100);
    AddField('field5', ftString, 100);
    Open;

    if RecordCount <= 0 then CheckOfMember := False
    else                     CheckOfMember := True;
  end;
end;

procedure TFpsa32501.SetNow;
begin
  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text :=' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D, '+
               ' ''F2'', ''F3'', ''F4'', ''F5'' ' +
               ' FROM DUAL ' ;

    ClearFieldInfo;
    AddField('D' , ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    GSsysdate := FieldByName('D').AsString;
  End;
end;

procedure TFpsa32501.BBcloseClick(Sender: TObject);
begin
  Close;
end;

end.

