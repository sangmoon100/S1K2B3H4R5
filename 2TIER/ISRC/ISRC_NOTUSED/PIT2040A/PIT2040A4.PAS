unit PIT2040A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, peNumedit, ComCtrls, Tabnotbk, pecodebtnedit, pedbgrid,
  Aligrid,dbtables;

type
  TFm_SubForm2 = class(TForm)
    Panel5: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Gadd: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Mail: TPeJeonOutLookBtn;
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    SGrid: TStringAlignGrid;
    Bt_Del: TPeJeonOutLookBtn;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    PeJeonOutLookBtn2: TPeJeonOutLookBtn;
    PeJeonOutLookBtn4: TPeJeonOutLookBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_MailClick(Sender: TObject);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_SaveClick(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PeJeonOutLookBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure SGridClear;
  public
    { Public declarations }
    fList, yList, nList : TList;
    B3    : ^Boolean;
    bState : Boolean;
    SelectCol : Integer;
    CurDate : string;
  end;

var
  Fm_SubForm2: TFm_SubForm2;

const DEPTYN       = 0;
      DEPTCODE     = 1;
      KORNAME      = 2;
      PAYCL        = 3;
      AFTDEPTCODE  = 4;
      REQCHECK     = 5;   //의뢰여부표시
      REQDATE      = 6;   //의뢰일자

      RESULTY      = 7;   //결과등록Y표시
      RESULTN      = 8;   //결과등록N표시

      RESULTDATE   = 9;   //등록일자
      REQYN        = 10;  //의뢰여부
      EMPNO        = 11;
      APPDATE      = 12;
      OPINION      = 13;  //의견
      RESULTYN     = 14;  //결과등록여부

implementation

uses pit2040a2, pit2040a1, PIT2040A6;

{$R *.DFM}

procedure TFm_SubForm2.FormCreate(Sender: TObject);
begin
  Bt_SrhClick(Sender);
  CurDate := Copy(DM._OracleDateTime,1,8);
end;

procedure TFm_SubForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_SubForm2.SGridClear;
var
  iRow, iCol : integer;
begin
  for iRow := 0 to SGrid.RowCount - 1 do
   for iCol := 0 to SGrid.ColCount - 1 do
    SGrid.Cells[iCol,iRow] := '';
end;

procedure TFm_SubForm2.Bt_SrhClick(Sender: TObject);
var
  iRow : integer;
  bCheck : ^Boolean;
  strSQL1, strSQL2, strSQL3, strSQL4 : string;
begin
  Application.processmessages;
  SGridClear;
  try
    with Dm.Qry_Work do
    begin
      strSQL1 := ' SELECT Count(*) RowCnt ';
      strSQL2 := ' SELECT m.DeptCode,m.KorName,f.CodeName Paycl,                '+
                 '        m.Aftdeptcode,m.AppDate,m.BefconYn,                   '+
                 '        m.Orgnum,m.Aftorgnum,m.Empno,m.AppDate,               '+
                 '        d.DeptName DeptName, e.DeptName AftDeptName,          '+
                 '        nvl(m.BefReqDate,''N'') BefReqYn, m.BefConDate,       '+
                 '        m.BefReqDate, m.BefConYn,                             '+
                 '        DECODE(m.Orgnum||m.DeptCode,c.orgnum||c.DeptCode,  ''N'',''Y'') DeptYN ';
      strSQL3 := '   FROM Pischnmas m, PycDept d, PycDept e, PycCode f , Pimpmas c '+
                 '  WHERE m.State between ''4'' and ''6''                       '+
                 '    AND c.Empno = m.EmpNo                                     '+
                 '    AND m.orgnum = d.orgnum AND m.deptcode = d.deptcode       '+
                 '    AND m.Aftorgnum = e.orgnum AND m.Aftdeptcode = e.deptcode '+
                 '    AND m.paycl = f.codeno(+) AND f.codeid(+) = ''I112''      ';
      strSQL4 := ' ORDER BY m.Orgnum,m.DeptCode,m.Aftorgnum,m.AftDeptCode,      '+
                 '          m.Paycl, m.Empno                                    ';
      Close;
      SQL.Clear;
      SQL.Add(strSQL1+strSQl3);
      Open;
      if (not eof) then SGrid.RowCount := FieldByName('RowCnt').asInteger
      else SGRID.RowCount := 1;

      //의뢰여부
      if fList <> nil then
      begin
        fList.Free;
        fList := nil;
      end;
      //결과등록Y
      if yList <> nil then
      begin
        yList.Free;
        yList := nil;
      end;
      //결과등록N
      if nList <> nil then
      begin
        nList.Free;
        nList := nil;
      end;

      fList := TList.Create;
      yList := TList.Create;
      nList := TList.Create;

      New(bCheck);
      for iRow := 0 to SGrid.RowCount-1 do
      begin
        bCheck^ := False;
        fList.Add(bCheck);
        yList.Add(bCheck);
        nList.Add(bCheck);
      end;

      SQL.Clear;
      SQL.Add(strSQL2+strSQL3+strSQL4);
      Open;
      iRow := 0;
      while (not eof) do
      begin
        SGrid.Cells[DEPTYN,iRow]      := FieldByName('DeptYN').asString;
        SGrid.Cells[DEPTCODE,iRow]    := FieldByName('Orgnum').asString + '/'+
                                         FieldByName('DeptName').asString;
        SGrid.Cells[KORNAME,iRow]     := FieldByName('KorName').asString + '(' +
                                         FieldByName('EmpNo').asString + ')';
        SGrid.Cells[PAYCL,iRow]       := FieldByName('Paycl').asString;
        SGrid.Cells[AFTDEPTCODE,iRow] := FieldByName('AftOrgNum').asString + '/' +
                                         FieldByName('AftDeptName').asString;
        //의뢰여부
        if FieldByName('BefReqYn').asString = 'N' then
        begin
          bCheck^ := False;
          fList.Add(bCheck);
          SGrid.Cells[REQYN,iRow] := 'N';
        end else
        begin
          bCheck^ := True;
          fList.Add(bCheck);
          SGrid.Cells[REQYN,iRow] := 'Y';
        end;
        if FieldByName('BefReqDate').asString = '' then
          SGrid.Cells[REQDATE,iRow] := ''
        else
          SGrid.Cells[REQDATE,iRow] := Copy(FieldByName('BefReqDate').asString,1,4) +
                                 '-' + Copy(FieldByName('BefReqDate').asString,5,2) +
                                 '-' + Copy(FieldByName('BefReqDate').asString,7,2);

        SGrid.Cells[RESULTYN,iRow]    := FieldByName('BefconYn').AsString;
        if FieldByName('BefConDate').asString = '' then
          SGrid.Cells[RESULTDATE,iRow] := ''
        else
          SGrid.Cells[RESULTDATE,iRow] := Copy(FieldByName('BefConDate').asString,1,4) +
                                    '-' + Copy(FieldByName('BefConDate').asString,5,2) +
                                    '-' + Copy(FieldByName('BefConDate').asString,7,2);

        SGrid.Cells[EMPNO,iRow]       := FieldByName('EmpNo').asString;
        SGrid.Cells[APPDATE,iRow]     := FieldByName('AppDate').asString;
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

  Dispose(bCheck);
  MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm2.Bt_AddClick(Sender: TObject);
var
  bCheck, cCheck : ^Boolean;
  iRow : integer;
begin
  SGrid.options := SGrid.options - [goRowSelect];
  New(bCheck); New(cCheck);
  case TComponent(Sender).Tag of
{    1: //개별의뢰
    begin
      bCheck^ := True;
      fList.Items[SGrid.Row] := bCheck;
      SGrid.Cells[REQYN,SGrid.Row] := 'Y';
      SGrid.Cells[REQDATE,SGrid.Row] := Copy(CurDate,1,4) +
                                  '-' + Copy(CurDate,5,2) +
                                  '-' + Copy(CurDate,7,2) ;
    end;}
    2: //일괄의뢰
    begin
      bCheck^ := True;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        fList.Items[iRow] := bCheck;
        SGrid.Cells[REQYN,iRow] := 'Y';
        SGrid.Cells[REQDATE,iRow] := Copy(CurDate,1,4) +
                                    '-' + Copy(CurDate,5,2) +
                                    '-' + Copy(CurDate,7,2) ;
      end;
    end;
{    3: //개별취소
    begin
      bCheck^ := False;
      fList.Items[SGrid.Row] := bCheck;
      SGrid.Cells[REQYN,SGrid.Row]   := 'N';
      SGrid.Cells[REQDATE,SGrid.Row] := '';
      SGrid.Cells[RESULTY,SGrid.Row]   := '';
      SGrid.Cells[RESULTDATE,SGrid.Row] := '';
    end; }
    4: //일괄취소
    begin
      bCheck^ := False;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        fList.Items[iRow] := bCheck;
        SGrid.Cells[REQYN,iRow] := 'N';
        SGrid.Cells[REQDATE,iRow] := '';
        
        yList.Items[iRow] := bCheck;
        nList.Items[iRow] := bCheck;
        SGrid.Cells[RESULTYN,iRow]   := '';
        SGrid.Cells[RESULTDATE,iRow] := '';
      end;
    end;
    5: //일괄등록 = Y
    begin
      bCheck^ := True;
      cCheck^ := False;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        if SGrid.Cells[REQYN,iRow] = 'N' then
        begin
          MessageDlg('의뢰처리후 입력하세요.', mtInformation, [mbOK], 0);
          SGrid.options := SGrid.options + [goRowSelect];
          Exit;
        end;
        yList.Items[iRow] := bCheck;
        nList.Items[iRow] := cCheck;
        SGrid.Cells[RESULTYN,iRow] := 'Y';
        SGrid.Cells[RESULTDATE,iRow] := Copy(CurDate,1,4) +
                                    '-' + Copy(CurDate,5,2) +
                                    '-' + Copy(CurDate,7,2) ;
      end;
    end;
    6: //일괄등록 = N
    begin
      bCheck^ := True;
      cCheck^ := False;
      for iRow := 0  to SGrid.RowCount - 1 do
      begin
        if SGrid.Cells[REQYN,iRow] = 'N' then
        begin
          MessageDlg('의뢰처리후 입력하세요.', mtInformation, [mbOK], 0);
          SGrid.options := SGrid.options + [goRowSelect];
          Exit;
        end;
        yList.Items[iRow] := cCheck;
        nList.Items[iRow] := bCheck;
        SGrid.Cells[RESULTYN,iRow] := 'N';
        SGrid.Cells[RESULTDATE,iRow] := Copy(CurDate,1,4) +
                                    '-' + Copy(CurDate,5,2) +
                                    '-' + Copy(CurDate,7,2) ;
      end;
    end;

  end;
  Dispose(bCheck); Dispose(cCheck);
  SGrid.options := SGrid.options + [goRowSelect];
end;

procedure TFm_SubForm2.Bt_MailClick(Sender: TObject);
begin
   MessageDlg('현재 작업중입니다.', mtInformation, [mbOK], 0);
end;

procedure TFm_SubForm2.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  BR : TRect;
  B5, B6, B7 : ^Boolean;
begin
  New(B5); New(B6); New(B7);
  if SGrid.Cells[REQYN,ARow] = 'Y' then  B5^ := True
  else B5^ := False;

  if SGrid.Cells[RESULTYN,ARow] = 'Y' then
  begin
    B6^ := True; B7^ := False;
  end else
  if SGrid.Cells[RESULTYN,ARow] = 'N' then
  begin
    B7^ := True; B6^ := False;
  end else
  begin
    B6^ := False; B7^ := False;
  end;

  BR.Top    := Rect.Top+1;
  BR.Left   := Rect.Left+1;
  BR.Bottom := Rect.Bottom-1;
  BR.Right  := Rect.Right -1;

  if (ARow >=  0) then
  begin
    case ACol of
      REQCHECK : //의뢰여부
      begin
        if  B5^ then
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
        else
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_FLAT  );
      end;
      RESULTY : //결과등록=Y
      begin
        if  B6^ then
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
        else
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_FLAT  );
      end;
      RESULTN : //결과등록=N
      begin
        if  B7^ then
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
        else
          DrawFrameControl(SGrid.Canvas.Handle, BR, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_FLAT  );
      end;
    end;
  end;

  Dispose(B5); Dispose(B6); Dispose(B7);
end;

procedure TFm_SubForm2.Bt_SaveClick(Sender: TObject);
var
  iRow : integer;
  sResultDate : string;
begin
  if SGrid.Cells[0,0] = '' then Exit;
  for iRow := 0 to SGrid.RowCount - 1 do
  begin
    if (SGrid.Cells[RESULTYN,iRow] = 'N') and (SGrid.Cells[OPINION,iRow] = '') then
    begin
      MessageDlg('의견등록을 완료하지 않았습니다.' + #13#10 +
                 '결과등록이 "N"인 자료는 의견등록을 하세요!', mtError, [mbOK], 0);
      Exit;
    end;
  end;

  MainForm.St_Help.Panels[0].Text := '해당 자료를 저장중입니다.';
  Application.processmessages;

  for iRow := 0 to SGrid.RowCount - 1 do
  begin
    if SGrid.Cells[REQYN,iRow] = 'Y' then
    begin
      sResultdate := Copy(SGrid.Cells[RESULTDATE,iRow],1,4) +
                     Copy(SGrid.Cells[RESULTDATE,iRow],6,2) +
                     Copy(SGrid.Cells[RESULTDATE,iRow],9,2) ;

      with DM.Qry_Work do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE Pischnmas ');
        SQL.Add('    SET BefreqDate =  '''+Curdate+''',                      ');  //의뢰일자
        if SGrid.Cells[RESULTDATE,iRow] = '' then //등록일자=소속부서결재일자
        begin
          SQL.Add('      State = ''5'',                                      ');//5=소속부서검토중
        end else
        begin
          SQL.Add('      BefconEmpno  = '''+pEmpno+''',                      ');//결재자 사번
          SQL.Add('      BefconKorName = '''+pKorname+''',                   ');//결재자 성명
          SQL.Add('      State = ''7'',                                      ');//7=처리완료
          SQL.Add('      BefconYn   = '''+SGrid.Cells[RESULTYN,iRow]+''',    ');//결재여부
          SQL.Add('      BefconDate = '''+sResultDate+''',                   ');//결재일자
          SQL.Add('      Befconoppinion = '''+SGrid.Cells[OPINION,iRow]+''', ');//의견
        end;
        SQL.Add('        StateDate = '''+CurDate+'''                         ');//처리일자
        SQL.Add('  WHERE Empno   = '''+SGrid.Cells[EMPNO,iRow]+'''           ');
        SQL.Add('    AND AppDate = '''+SGrid.Cells[APPDATE,iRow]+'''         ');
        try
          ExecSQL;
        except
          begin
            MessageDlg('소속부서의뢰를 할 수 없습니다.', mtError, [mbOK], 0);
            System.Exit;
          end;
        end;
      end;
    end else
    begin
      with DM.Qry_Work do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE Pischnmas ');
        SQL.Add('    SET BefreqDate =  '''', ');  //의뢰일자
        SQL.Add('        State = ''4''       ');
        SQL.Add('  WHERE Empno   = '''+SGrid.Cells[EMPNO,iRow]+'''           ');
        SQL.Add('    AND AppDate = '''+SGrid.Cells[APPDATE,iRow]+'''         ');
        try
          ExecSQL;
        except
          begin
            MessageDlg('소속부서의뢰를 할 수 없습니다.', mtError, [mbOK], 0);
            System.Exit;
          end;
        end;
      end;
    end;
  end;
  Bt_SrhClick(Sender);
  SGrid.Refresh;
  MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm2.SGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  SelectCol := ACol;
end;

procedure TFm_SubForm2.SGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    bCheck, yCheck, nCheck : ^Boolean;
begin
  if fList = nil then Exit;  //의뢰여부
  if yList = nil then Exit;  //결과등록=Y
  if nList = nil then Exit;  //결과등록=N

  //의뢰여부
  if SelectCol = REQCHECK then
  begin
    SGrid.options := SGrid.options - [goRowSelect];
    New(bCheck);
    if SGrid.Cells[REQYN,SGrid.Row] = 'Y'  then
    begin
          bCheck^ := False;
          fList.Items[SGrid.Row]            := bCheck;
          SGrid.Cells[REQYN,SGrid.Row]      := 'N';
          SGrid.Cells[REQDATE,SGrid.Row]    := '';

          SGrid.Cells[RESULTYN,SGrid.Row]   := '';
          SGrid.Cells[RESULTDATE,SGrid.Row] := '';
    end else
    begin
          bCheck^ := True;
          fList.Items[SGrid.Row]         := bCheck;
          SGrid.Cells[REQYN,SGrid.Row]   := 'Y';
          SGrid.Cells[REQDATE,SGrid.Row] := Copy(CurDate,1,4) +
                                        '-' + Copy(CurDate,5,2) +
                                        '-' + Copy(CurDate,7,2) ;
    end;
    Dispose(bCheck);
    SGrid.options := SGrid.options + [goRowSelect];
  end;

  //결과등록=Y
  if SelectCol = RESULTY then
  begin
    if SGrid.Cells[REQYN,SGrid.Row] = 'N' then
    begin
      MessageDlg('의뢰처리후 입력하세요.', mtInformation, [mbOK], 0);
      Exit;
    end;

    SGrid.options := SGrid.options - [goRowSelect];
    New(yCheck);
    if SGrid.Cells[RESULTYN,SGrid.Row] = 'Y'  then
    begin
          yCheck^ := False;
          yList.Items[SGrid.Row]            := yCheck;
          SGrid.Cells[RESULTYN,SGrid.Row]   := '';
          SGrid.Cells[RESULTDATE,SGrid.Row] := '';
    end else
    begin
          yCheck^ := True;
          yList.Items[SGrid.Row]         := yCheck;
          SGrid.Cells[RESULTYN,SGrid.Row]   := 'Y';
          SGrid.Cells[RESULTDATE,SGrid.Row] := Copy(CurDate,1,4) +
                                        '-' + Copy(CurDate,5,2) +
                                        '-' + Copy(CurDate,7,2) ;
    end;
    Dispose(yCheck);
    SGrid.options := SGrid.options + [goRowSelect];
  end;
  //결과등록=N
  if SelectCol = RESULTN then
  begin
    if SGrid.Cells[REQYN,SGrid.Row] = 'N' then
    begin
      MessageDlg('의뢰처리후 입력하세요.', mtInformation, [mbOK], 0);
      Exit;
    end;

    SGrid.options := SGrid.options - [goRowSelect];
    New(nCheck);
    if SGrid.Cells[RESULTYN,SGrid.Row] = 'N'  then
    begin
      nCheck^ := False;
      nList.Items[SGrid.Row]            := nCheck;
      SGrid.Cells[RESULTYN,SGrid.Row]   := '';
      SGrid.Cells[RESULTDATE,SGrid.Row] := '';
    end else
    begin
      nCheck^ := True;
      nList.Items[SGrid.Row]         := nCheck;
      SGrid.Cells[RESULTYN,SGrid.Row]   := 'N';
      SGrid.Cells[RESULTDATE,SGrid.Row] := Copy(CurDate,1,4) +
                                    '-' + Copy(CurDate,5,2) +
                                    '-' + Copy(CurDate,7,2) ;
      //의견등록
      PeJeonOutLookBtn3Click(Sender);
    end;
    Dispose(nCheck);
    SGrid.options := SGrid.options + [goRowSelect];

  end;
end;

//의견등록
procedure TFm_SubForm2.PeJeonOutLookBtn3Click(Sender: TObject);
begin
  if (SGrid.Cells[RESULTYN,SGrid.Row] = '') then
  begin
    MessageDlg('결과등록후 의견등록을 하세요.', mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    GAddDlg  := TGAddDlg.Create( Application );
    GAddDlg.MmOpinion.Clear;
    if SGrid.Cells[OPINION,SGrid.Row] <> '' then
    GAddDlg.MmOpinion.Lines.Add(SGrid.Cells[OPINION,SGrid.Row]);
    GAddDlg.ShowModal;
    if GAddDlg.SModalResult = 'mrOK' then
      SGrid.Cells[OPINION,SGrid.Row] := GAddDlg.MmOpinion.Lines.Text
    else SGrid.Cells[OPINION,SGrid.Row] := SGrid.Cells[OPINION,SGrid.Row];
  finally
    GAddDlg.Free;
  end;
end;

end.
