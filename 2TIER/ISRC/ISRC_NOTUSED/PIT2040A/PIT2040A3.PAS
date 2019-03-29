unit PIT2040A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, pedbgrid, dbtables, Aligrid;

type
  TFm_SubForm1 = class(TForm)
    Panel5: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Gadd: TPeJeonOutLookBtn;
    MoniGrid: TPeJeonDbGrid;
    Panel1: TPanel;
    Panel6: TPanel;
    From: TLabel;
    Bevel2: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Mail: TPeJeonOutLookBtn;
    Bt_Del: TPeJeonOutLookBtn;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    DataSource1: TDataSource;
    SGrid: TStringAlignGrid;
    procedure Bt_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure MoniGridCellClick(Column: TColumn);
    procedure Bt_AddClick(Sender: TObject);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_MailClick(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure MoniGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    pDept, pOrgnum : string;
    procedure SGridClear;
    procedure DetailSearch;
  public
    { Public declarations }
    fList : TList;
    B3    : ^Boolean;
    bState : Boolean;
    SelectCol : integer;
  end;

var
  Fm_SubForm1: TFm_SubForm1;

const KORNAME   = 0;
      PAYCL     = 1;
      PAYRA     = 2;
      DEPTCODE  = 3;
      OFFTRDATE = 4;
      REQCHECK  = 5;
      REQYN     = 6;
      EMPNO     = 7;
      APPDATE   = 8;
      DATEMARK  = 9;

implementation

uses pit2040a2,pit2040a1;

{$R *.DFM}

procedure TFm_SubForm1.FormCreate(Sender: TObject);
begin
  Bt_SrhClick(Sender);
end;

procedure TFm_SubForm1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fList <> nil then
  begin
    fList.Free;
    fList := Nil;
  end;
  Action := caFree;
end;

procedure TFm_SubForm1.Bt_SrhClick(Sender: TObject);
var
  i : integer;
  Field : TField;
begin
  MainForm.St_Help.Panels[0].Text := '모집부서를 조회하는 중입니다...';
  Application.processmessages;
  try
    with Dm.Qry_selectA do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT c.Orgnum,d.DeptName, c.Collectcnt, c.Supplecnt,          ');
      SQL.Add('        c.Collectcnt-c.Supplecnt, --c.RegDate,            ');
      SQL.Add('        c.DeptCode, c.Orgnum                            ');
      SQL.Add('   FROM Pischndept c, Pycdept d                         ');
      SQL.Add('  WHERE --c.Regdate <> ''00000000''  AND                  ');
      SQL.Add('        c.Closeyn <> ''Y''                              ');
      SQL.Add('    AND c.orgnum = d.orgnum AND c.deptcode = d.deptcode ');
      SQL.Add(' ORDER BY c.Closedate DESC                              ');
      Open;
      for i := 0 to FieldCount - 1 do
      begin
        Field := Fields[i];
        case Field.Index of
          0 : Field.DisplayWidth := 5;
          1 : Field.DisplayWidth := 48;//54;
          2 : Field.DisplayWidth := 12;
          3 : Field.DisplayWidth := 12;
          4 : Field.DisplayWidth := 12;
          5 : begin
                Field.DisplayWidth := 21;
                Field.EditMask     := '9999-99-99;0;';
              end;
          6 : Field.Visible := False;
              //Field.DisplayWidth := 6;
          7 : Field.Visible := False;
              //Field.DisplayWidth := 6;
          8 : Field.Visible := False;
              //Field.DisplayWidth := 6;
        end
      end;
      MoniGrid.SelectedRows.CurrentRowSelected := True;
    end;
  except on E : EDBEngineError do
    begin
      //MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
      System.Exit;
    end;
  end;

  MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm1.SGridClear;
var
  iRow, iCol : integer;
begin
  for iRow := 0 to SGrid.RowCount - 1 do
   for iCol := 0 to SGrid.ColCount - 1 do
    SGrid.Cells[iCol,iRow] := '';
end;

procedure TFm_SubForm1.MoniGridCellClick(Column: TColumn);
begin
  DetailSearch;
end;

procedure TFm_SubForm1.DetailSearch;
var
  iRow : integer;
  bCheck : ^Boolean;
  strSQL1,strSQL2,strSQL3,strSQL4 : string;
begin
  pDept   := DM.Qry_SelectA.FieldByName('DEPTCODE').asString;
  pOrgnum := DM.Qry_SelectA.FieldByName('ORGNUM').asString;
  SGridClear;
  try
    with Dm.Qry_Work do
    begin
      strSQL1 := ' SELECT Count(*) RowCnt                                 ';
      strSQL2 := ' SELECT m.KorName,  e.CodeName Paycl, f.CodeName Payra, '+
                 '        d.DeptName, c.OfftrDate, m.Empno, m.AppDate,    '+
                 '        m.DeptCode, m.Paycl, m.Orgnum,                  '+
                 '        TO_DATE(m.AppDate,''YYYYMMDD'') -               '+
                 '        TO_DATE(c.RealtrDate, ''YYYYMMDD'') GetDate      ';
      strSQL3 := '   FROM Pischnmas m, Pimpmas c, PycDept d,              '+
                 '        PycCode e, PycCode f                            '+
                 ' WHERE m.AftDeptCode = '''+pDept+'''                    '+
                 '   AND m.AftOrgnum = '''+pOrgnum+'''                    '+
                 '   AND m.AppDate > ''00000000''                         '+
                 '   AND m.State = ''2''                                  '+
                 '   AND m.Empno = c.Empno                                '+
                 '   AND c.orgnum = d.orgnum AND c.deptcode = d.deptcode  '+
                 '   AND c.paycl = e.codeno(+) AND e.codeid(+) = ''I112'' '+
                 '   AND c.payra = f.codeno(+) AND f.codeid(+) = ''I113'' ';
      strSQL4 := ' ORDER BY m.Orgnum,m.DeptCode, GetDate, m.Paycl, m.EmpNo';

      Close;
      SQL.Clear;
      SQL.Add(strSQL1+strSQL3);
      Open;
      if (not eof) then SGrid.RowCount := FieldByName('RowCnt').asInteger
      else SGrid.RowCount := 1;

      SQL.Clear;
      SQL.Add(strSQl2+strSQL3+strSQL4);
      Open;
      iRow := 0;
      while (not eof) do
      begin
        SGrid.Cells[KORNAME,iRow]   := FieldByName('KorName').asString + '(' +
                                       FieldByName('EmpNo').asString + ')';
        SGrid.Cells[PAYCL,iRow]     := FieldByName('Paycl').asString;
        SGrid.Cells[PAYRA,iRow]     := FieldByName('Payra').asString;
        SGrid.Cells[DEPTCODE,iRow]  := FieldByName('Orgnum').asString + '/' +
                                       FieldByName('DeptName').asString;
        SGrid.Cells[OFFTRDATE,iRow] := Copy(FieldByName('Offtrdate').asString,1,4)+
                                 '-' + Copy(FieldByName('Offtrdate').asString,5,2)+
                                 '-' + Copy(FieldByName('Offtrdate').asString,7,2);
        SGrid.Cells[REQYN,iRow]     := 'N';
        SGrid.Cells[EMPNO,iRow]     := FieldByName('EmpNo').AsString;
        SGrid.Cells[APPDATE,iRow]   := FieldByName('AppDate').asString;
        if StrToIntDef(FieldByName('GetDate').asString,0)  < 365 then
           SGrid.Cells[DATEMARK,iRow]   := '*';

        Next;
        iRow := iRow + 1;
      end;
    end;
  except on E : EDBEngineError do
    begin
      //MessageDlg(BDEErrorInfo(E),mtWarning,[mbOK],0);
      System.Exit;
    end;
  end;

  if fList <> nil then
  begin
    fList.Free;
    fList := nil;
  end;


  fList := TList.Create;
  New(bCheck);
  for iRow := 0 to SGrid.RowCount-1 do
  begin
    bCheck^ := False;
    fList.Add(bCheck);
  end;
  Dispose(bCheck);
end;

procedure TFm_SubForm1.Bt_AddClick(Sender: TObject);
var
  bCheck : ^Boolean;
  iRow : integer;
begin
  SGrid.options := SGrid.options - [goRowSelect];
  New(bCheck);
  case TComponent(Sender).Tag of
    1: //개별의뢰
    begin
      bCheck^ := True;
      fList.Items[SGrid.Row] := bCheck;
      SGrid.Cells[REQYN,SGrid.Row] := 'Y';
    end;
    2: //일괄의뢰
    begin
      bCheck^ := True;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        fList.Items[iRow] := bCheck;
        SGrid.Cells[REQYN,iRow] := 'Y'
      end;
    end;
    3: //개별취소
    begin
      bCheck^ := False;
      fList.Items[SGrid.Row] := bCheck;
      SGrid.Cells[REQYN,SGrid.Row] := 'N';
    end;
    4: //일괄취소
    begin
      bCheck^ := False;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        fList.Items[iRow] := bCheck;
        SGrid.Cells[REQYN,iRow] := 'N'
      end;
    end;
  end;
  Dispose(bCheck);
  SGrid.options := SGrid.options + [goRowSelect];
end;

procedure TFm_SubForm1.Bt_SaveClick(Sender: TObject);
var
  iRow,yRow : integer;
  sAftreqdate, sWhere, sComma : string;
begin
  if SGrid.Cells[0,0] = '' then Exit;
  MainForm.St_Help.Panels[0].Text := '해당 자료를 저장중입니다.';
  Application.processmessages;
  sWhere := ''; sComma := ','; yRow := 0;
  sAftreqdate := Copy(DM._OracleDateTime,1,8);  //지원부서의뢰일 = 현재일
  for iRow := 0 to SGrid.RowCount - 1 do
  begin
    if SGrid.Cells[REQYN,iRow] = 'Y' then
    begin
      yRow := yRow + 1;
      if (iRow > 0) and (yRow > 1) then sWhere := sWhere + sComma;
      sWhere := sWhere + '(' + SGrid.Cells[EMPNO,iRow]+','+SGrid.Cells[APPDATE,iRow]+ ')';
    end;
  end;
  with DM.Qry_Work do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' UPDATE Pischnmas                          ');
    SQL.Add('    SET Aftreqdate =  '''+sAftreqdate+''', '); //지원부서의뢰일
    SQL.Add('        State = ''3'',                     '); //3=지원부서검토중
    SQL.Add('        StateDate = '''+sAftreqdate+'''    '); //처리상태일
    SQL.Add('  WHERE (Empno,AppDate)                    ');
    SQL.Add('     IN ( ' + sWhere + ')'                  );
    try
      ExecSQL;
    except
      begin
        MessageDlg('지원부서의뢰를 할 수 없습니다.', mtError, [mbOK], 0);
        System.Exit;
      end;
    end;
  end;
  MainForm.St_Help.Panels[0].Text := '';
  DetailSearch;
end;

procedure TFm_SubForm1.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
    BR : TRect;
    B5 : ^Boolean;
    s : string;
begin
  New(B5);
  if SGrid.Cells[REQYN,ARow] = 'Y' then  B5^ := True
  else B5^ := False;

  BR.Top    := Rect.Top+1;
  BR.Left   := Rect.Left+1;
  BR.Bottom := Rect.Bottom-1;
  BR.Right  := Rect.Right -1;
  if (ACol = 5) and (ARow >= 0) then
  begin
    if  B5^ then
      DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
    else
      DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_FLAT  );
  end;
  Dispose(B5);

  if (ACol = OFFTRDATE) and (SGrid.Cells[DATEMARK,ARow] = '*') then
  begin
    with SGrid, Canvas do
    begin
      S := Cells[ACol, ARow];
      Font.Color  := clRed;
      ExtTextOut(Handle, Rect.Left + 2, Rect.Top + 2, ETO_CLIPPED or
                         ETO_OPAQUE, @Rect, PChar(S), Length(S), nil);
    end;
  end;
end;

procedure TFm_SubForm1.SGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    bCheck : ^Boolean;
begin
  SGrid.options := SGrid.options - [goRowSelect];
  if fList = nil then Exit;

  if SelectCol = REQCHECK then
  begin
      New(bCheck);
      if SGrid.Cells[REQYN,SGrid.Row] = 'Y'  then
      begin
          bCheck^ := False;
          fList.Items[SGrid.Row] := bCheck;
          SGrid.Cells[REQYN,SGrid.Row] := 'N';
      end else
      begin
          bCheck^ := True;
          fList.Items[SGrid.Row] := bCheck;
          SGrid.Cells[REQYN,SGrid.Row] := 'Y';
      end;
      Dispose(bCheck);
  end;
  SGrid.options := SGrid.options + [goRowSelect];
end;

procedure TFm_SubForm1.Bt_MailClick(Sender: TObject);
begin
  MessageDlg('현재 작업중입니다.', mtInformation, [mbOK], 0);
end;

procedure TFm_SubForm1.SGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  SelectCol := ACol;
end;

procedure TFm_SubForm1.MoniGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Up) then
  begin
    DM.Qry_SelectA.Prior;
    DetailSearch;
    Key := 0;
  end else
  if Key = vk_Down then
  begin
    DM.Qry_SelectA.Next;
    DetailSearch;
    Key := 0;
  end;
end;

end.
