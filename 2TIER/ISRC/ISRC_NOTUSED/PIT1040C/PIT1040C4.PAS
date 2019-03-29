unit PIT1040C4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, StdCtrls, Mask, pebtnedit, Buttons,
  ExtCtrls, Db, DBGrids, pedbgrid;

type
  TDutyForm = class(TForm)
    Panel1: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    OKBtn: TPeJeonOutLookBtn;
    CancelBtn: TPeJeonOutLookBtn;
    AddBtn: TPeJeonOutLookBtn;
    DeleteBtn: TPeJeonOutLookBtn;
    SG_After: TStringGrid;
    P_Before: TPanel;
    P_After: TPanel;
    AllAddBtn: TPeJeonOutLookBtn;
    AllDeleteBtn: TPeJeonOutLookBtn;
    E_Search: TPePanelEdit;
    Search_Btn: TSpeedButton;
    DG_Before: TPeJeonDbGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SG_AfterDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure SG_AfterDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure AllAddBtnClick(Sender: TObject);
    procedure AllDeleteBtnClick(Sender: TObject);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure Search_BtnClick(Sender: TObject);
    procedure DG_BeforeDblClick(Sender: TObject);
    procedure DG_BeforeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure fzGetData(Acodeid, AMain, ASub, ADet: String);
    function  fnGetEqRow(AGrid: TStringGrid; AMain, ASub, ADet: String): Integer;
    procedure fzInitialForm;
  public
    SG_InOut : TStringGrid;

    gsCodeid: String;
    gbStart, gbSelectYN : Boolean;

    { Public declarations }
  end;

var
  DutyForm: TDutyForm;

implementation

uses
  PIT1040C0, PIT1040C1, UPitLib;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
// UserDefine
////////////////////////////////////////////////////////////////////////////////

// StringGrid에 다음 키의 자료가 있으면 Row 리턴; 없으면 -1;
// input(검색대상 StringGrid, 검색자료 직군,직종,직무); output: StringGrid.Row
function TDutyForm.fnGetEqRow(AGrid: TStringGrid; AMain, ASub, ADet: String): Integer;

  function myGetEqRow1(mGrid: TStringGrid; mRow1: Integer; var mCode1: String): Integer;
  var
    i: Integer;
  begin
    with mGrid do
    begin
      Result := -1;
      if mCode1 = '' then  System.Exit;

      for i := 0 to RowCount -1 do begin
        if (mCode1 = Cells[mRow1,i]) then begin
          Result := i;    Break;
        end
      end;
    end;
  end;

  function myGetEqRow2(mGrid: TStringGrid; mRow1: Integer; var mCode1: String;
                                           mRow2: Integer; var mCode2: String): Integer;
  var
    i: Integer;
  begin
    with mGrid do
    begin
      Result := -1;
      if (mCode1 = '') and (mCode2 = '') then  System.Exit;

      for i := 0 to RowCount -1 do begin
        if (mCode1 = Cells[mRow1,i]) and (mCode2 = Cells[mRow2,i]) then begin
          Result := i;    Break;
        end
      end;
    end;
  end;

  function myGetEqRow3(mGrid: TStringGrid; mRow1: Integer; var mCode1: String;
                                           mRow2: Integer; var mCode2: String;
                                           mRow3: Integer; var mCode3: String): Integer;
  var
    i: Integer;
  begin
    with mGrid do
    begin
      Result := -1;
      if (mCode1 = '') and (mCode2 = '') and (mCode3 = '') then  System.Exit;

      for i := 0 to RowCount -1 do begin
        if (mCode1 = Cells[mRow1,i]) and (mCode2 = Cells[mRow2,i]) and (mCode3 = Cells[mRow3,i]) then begin
          Result := i;    Break;
        end
      end;
    end;
  end;

begin
    if AMain <> '' then
    begin
        if ASub <> '' then
        begin
            if ADet <> '' then
                Result := myGetEqRow3(AGrid, 0, Amain, 2, ASub, 4, ADet)
            else
                Result := myGetEqRow2(AGrid, 0, Amain, 2, Asub         )
        end
        else // if Asub = '' then
        begin
            if ADet <> '' then
                Result := myGetEqRow2(AGrid, 0, Amain,          4, Adet)
            else
                Result := myGetEqRow1(AGrid, 0, Amain)
        end
    end
    else // if Asub = '' then
    begin
        if Asub <> '' then
        begin
            if Adet <> '' then
                Result := myGetEqRow2(AGrid,             2, Asub, 4, Adet)
            else
                Result := myGetEqRow1(AGrid,             2, Asub         )
        end
        else // if Asub = '' then
        begin
            if Adet <> '' then
                Result := myGetEqRow1(AGrid,                      4, Adet)
            else
                Result := -1
        end
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// Event
////////////////////////////////////////////////////////////////////////////////

procedure TDutyForm.FormCreate(Sender: TObject);
begin
    gbStart := True;
end;

procedure TDutyForm.fzInitialForm;
begin
    if gsCodeid = 'I116' then
    begin
        self.Caption := '직무 열람';
        P_Before.Caption := '선택할 직무';
        P_After.Caption  := '선택한 직무';

        with SG_After do
        begin
            RowCount := 2;
            ColCount := 6;
            Cols[0].Text := '직군코드'; ColWidths[0] := -1;
            Cols[1].Text := '직군명';
            Cols[2].Text := '직종코드'; ColWidths[2] := -1;
            Cols[3].Text := '직종명';
            Cols[4].Text := '직무코드'; ColWidths[4] := -1;
            Cols[5].Text := '직무명';
        end;
    end;

    if gsCodeid = 'I711' then
    begin
        self.Caption := '취급장비 열람';
        P_Before.Caption := '선택할 취급장비';
        P_After.Caption  := '선택한 취급장비';

        with SG_After do
        begin
            RowCount := 2;
            ColCount := 6;
            Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
            Cols[1].Text := '대분류(기  능)';
            Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
            Cols[3].Text := '중분류(장비명)';
            Cols[4].Text := '세분류코드';       ColWidths[4] := -1;
            Cols[5].Text := '세분류(제품명)';
        end;
    end;

    if gsCodeid = 'I713' then
    begin
        self.Caption := '[취급프로그램 열람]';
        P_Before.Caption := '선택할 취급프로그램';
        P_After.Caption  := '선택한 취급프로그램';

        with SG_After do
        begin
            RowCount := 2;
            ColCount := 6;
            Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
            Cols[1].Text := '프로그램(대분류)';
            Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
            Cols[3].Text := '프로그램(중분류)';
            Cols[4].Text := '세분류코드';       ColWidths[4] := -1;
            Cols[5].Text := '프로그램(세분류)';
        end;
    end;

    if gsCodeid = 'I231' then
    begin
        self.Caption := '[자격증 열람]';
        P_Before.Caption := '선택할 자격증';
        P_After.Caption  := '선택한 자격증';

        with SG_After do
        begin
            RowCount := 2;
            ColCount := 4;
            Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
            Cols[1].Text := '자격증(대분류)';
            Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
            Cols[3].Text := '자격증(세분류)';
        end;
    end;

    if gsCodeid = 'I225' then
    begin
        self.Caption := '[전공 열람]';
        P_Before.Caption := '선택할 전공';
        P_After.Caption  := '선택한 전공';

        with SG_After do
        begin
            RowCount := 2;
            ColCount := 4;
            Cols[0].Text := '대분류코드';       ColWidths[0] := -1;
            Cols[1].Text := '전공(대분류)';
            Cols[2].Text := '중분류코드';       ColWidths[2] := -1;
            Cols[3].Text := '전공(세분류)';
        end;
    end;
end;

procedure TDutyForm.FormPaint(Sender: TObject);
var
  i: Integer;
begin
    if gbStart = False then Exit;

    gbStart := False;
    fzInitialForm;

    Application.ProcessMessages;
    fzSGInitialRow(SG_After);

    SG_After.RowCount := SG_InOut.RowCount;
    for i := SG_InOut.FixedRows to SG_InOut.RowCount -1 do
        SG_After.Rows[i].Assign(SG_InOut.Rows[i]);

    fzGetData(gsCodeid,'','','');

end;

procedure TDutyForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then CancelBtn.Click;
end;

procedure TDutyForm.fzGetData(Acodeid, AMain, ASub, ADet: String);
var
  ParamVariant: String;
  i: Integer;
  Field : TField;
begin
    if Amain <> '' then
        Amain := '%' + Amain;
    if ASub <> '' then
        ASub := '%' + ASub;
    if Adet <> '' then
        Adet := '%' + Adet;

    if Acodeid = 'I116' then
    begin

       with DM.qryCODE do
       begin
         CLOSE;
         SQL.Clear;
         SQL.Add('select c.codeno        jobfield,             '+
                 '       c.codename      jobfieldname,         '+
                 '       k.dutykind      dutykind,             '+
                 '       k.dutykindname  dutykindname,         '+
                 '       d.duty          duty,                 '+
                 '       d.dutyname      dutyname              '+
                 'from pyccode c,                              '+
                 '     pishrdukind k,                          '+
                 '     pishrduty d                             '+
                 'where c.codeid = '''+Acodeid+'''             '+
                 '  and c.codeno = k.jobfield                  '+
                 '  and nvl(c.useyn,''N'') = ''Y''             '+                 
                 '  and k.jobfield = d.jobfield                '+
                 '  and k.dutykind   = d.dutykind              '+
                 '  and ((UPPER(c.codeno) like UPPER('''+AMain+'%'')   or UPPER(c.codename) like UPPER('''+AMain+'%''))         '+
                 '        or (UPPER(k.dutykind) like UPPER('''+ASub+'%'') or UPPER(k.dutykindname) like UPPER('''+ASub+'%'')) '+
                 '        or (UPPER(d.duty) like UPPER('''+ADet+'%'')     or UPPER(d.dutyname) like UPPER('''+ADet+'%'')))    '+
                 'order by c.codeno, k.jobfield, d.duty                             ');
         Open;
         if Bof AND Eof then
         begin
           MessageBox(Self.Handle, '코드가 존재하지 않습니다.', '코드오류', MB_ICONWARNING);
           Close;
           System.Exit;
         end;

         for i := 0 to DM.qryCODE.FieldCount - 1 do
         begin
           Field := DM.qryCODE.Fields[i];
           case Field.index of
              1 :  begin
                     Field.DisplayWidth := 16;
                     Field.DisplayLabel := '직군명';
                   end;
              3 :  begin
                     Field.DisplayWidth := 32;
                     Field.DisplayLabel := '직종명';
                   end;
              5 :  begin
                     Field.DisplayWidth := 54;
                     Field.DisplayLabel := '직무명';
                   end;
              else begin
                     Field.Visible := False;
                   end;
           end;
         end;

       end;
    end
    else if (Acodeid = 'I711') or (Acodeid = 'I713') then
    begin
       with DM.qryCODE do
       begin
         CLOSE;
         SQL.Clear;
         SQL.Add('select a.codeno        mainid,               '+
                 '       a.codename      mainname,             '+
                 '       b.codeno        subid,                '+
                 '       b.codename      subname,              '+
                 '       c.codeno        detid,                '+
                 '       c.codename      detname               '+
                 'from pishrcode a, pishrcode b, pishrcode c   '+
                 'where a.codeid = '''+Acodeid+'''                      '+
                 '  and a.codeid = b.codeid and a.codeno = substr(b.codeno,1,length(a.codeno)) '+
                 '  and b.codeid = c.codeid and b.codeno = substr(c.codeno,1,length(b.codeno)) '+
                 '  and a.codesuper = ''0'' and a.codemainon = ''0''                '+
                 '  and b.codesuper = ''0'' and b.codemainon = ''1''                '+
                 '  and c.codesuper = ''1'' and c.codemainon = ''1''                '+
                 '  and (UPPER(a.codeno) like UPPER('''+AMain+'%'') or UPPER(a.codename) like UPPER('''+AMain+'%'')           '+
                 '        or UPPER(b.codeno) like UPPER('''+ASub+'%'') or UPPER(b.codename) like UPPER('''+ASub+'%'')       '+
                 '        or UPPER(c.codeno) like UPPER('''+ADet+'%'') or UPPER(c.codename) like UPPER('''+ADet+'%''))      '+
                 'order by a.codeno, b.codeno, c.codeno                             ');
         Open;
         if Bof AND Eof then
         begin
           MessageBox(Self.Handle, '코드가 존재하지 않습니다.', '코드오류', MB_ICONWARNING);
           Close;
           System.Exit;
         end;

         for i := 0 to DM.qryCODE.FieldCount - 1 do
         begin
           Field := DM.qryCODE.Fields[i];
           if Acodeid = 'I711' then
           begin
              case Field.index of
                 1 :  begin
                        Field.DisplayWidth := 16;
                        Field.DisplayLabel := '대분류(기  능)';
                      end;
                 3 :  begin
                        Field.DisplayWidth := 32;
                        Field.DisplayLabel := '중분류(장비명)';
                      end;
                 5 :  begin
                        Field.DisplayWidth := 54;
                        Field.DisplayLabel := '세분류(제품명)';
                      end;
                 else begin
                        Field.Visible := False;
                      end;
              end;
           end
           else if Acodeid = 'I713' then
           begin
              case Field.index of
                 1 :  begin
                        Field.DisplayWidth := 16;
                        Field.DisplayLabel := '프로그램(대분류)';
                      end;
                 3 :  begin
                        Field.DisplayWidth := 32;
                        Field.DisplayLabel := '프로그램(중분류)';
                      end;
                 5 :  begin
                        Field.DisplayWidth := 54;
                        Field.DisplayLabel := '프로그램(세분류)';
                      end;
                 else begin
                        Field.Visible := False;
                      end;
              end;
           end;
         end;

       end;
    end
    else  if Acodeid = 'I231' then
    begin

       with DM.qryCODE do
       begin
         CLOSE;
         SQL.Clear;
         SQL.Add('select a.codeno        mainid,               '+
                 '       a.codename      mainname,             '+
                 '       b.codeno        subid,                '+
                 '       b.codename      subname,              '+
                 '       '' ''           detid,                '+
                 '       '' ''           detname               '+
                 'from pyccode a, pyccode b                    '+
                 'where a.codeid = '''+Acodeid+'''                      '+
                 '  and a.codeid = b.codeid                         '+
                 '  and substr(a.codeno,1,1) = substr(b.codeno,1,1) '+
                 '  and substr(a.codeno,2,2) =  ''00''              '+
                 '  and substr(b.codeno,2,2) <> ''00''              '+
                 '  and (UPPER(a.codeno) like UPPER('''+AMain+'%'') or UPPER(a.codename) like UPPER('''+AMain+'%'')     '+
                 '        or UPPER(b.codeno) like UPPER('''+ASub+'%'') or UPPER(b.codename) like UPPER('''+ASub+'%'')) '+
                 'order by a.codeno, b.codeno                                  ');
         Open;
         if Bof AND Eof then
         begin
           MessageBox(Self.Handle, '코드가 존재하지 않습니다.', '코드오류', MB_ICONWARNING);
           Close;
           System.Exit;
         end;
         for i := 0 to DM.qryCODE.FieldCount - 1 do
         begin
           Field := DM.qryCODE.Fields[i];
           case Field.index of
              1 :  begin
                     Field.DisplayWidth := 30;
                     Field.DisplayLabel := '자격증(대분류)';
                   end;
              3 :  begin
                     Field.DisplayWidth := 62;
                     Field.DisplayLabel := '자격증(중분류)';
                   end;
              5 :  begin
                     Field.DisplayLabel := '자격증(세분류)';
                     Field.Visible := False;
                   end;
              else begin
                     Field.Visible := False;
                   end;
           end;
         end;

       end;
    end
    else  if Acodeid = 'I225' then
    begin

       with DM.qryCODE do
       begin
         CLOSE;
         SQL.Clear;
         SQL.Add('select a.codeno        mainid,               '+
                 '       a.codename      mainname,             '+
                 '       b.codeno        subid,                '+
                 '       b.codename      subname,              '+
                 '       '' ''           detid,                '+
                 '       '' ''           detname               '+
                 'from pyccode a, pyccode b                    '+
                 'where a.codeid = '''+Acodeid+'''                      '+
                 '  and a.codeid = b.codeid                         '+
                 '  and substr(a.codeno,1,1) = substr(b.codeno,1,1) '+
                 '  and substr(a.codeno,2,3) =  ''000''             '+
                 '  and substr(b.codeno,2,3) <> ''000''             '+
                 '  and (UPPER(a.codeno) like UPPER('''+AMain+'%'') or UPPER(a.codename) like UPPER('''+AMain+'%'')      '+
                 '        or UPPER(b.codeno) like UPPER('''+ASub+'%'') or UPPER(b.codename) like UPPER('''+ASub+'%'')) '+
                 'order by a.codeno, b.codeno                                  ');
         Open;
         if Bof AND Eof then
         begin
           MessageBox(Self.Handle, '코드가 존재하지 않습니다.', '코드오류', MB_ICONWARNING);
           Close;
           System.Exit;
         end;

         for i := 0 to DM.qryCODE.FieldCount - 1 do
         begin
           Field := DM.qryCODE.Fields[i];
           case Field.index of
              1 :  begin
                     Field.DisplayWidth := 30;
                     Field.DisplayLabel := '전 공(대분류)';
                   end;
              3 :  begin
                     Field.DisplayWidth := 62;
                     Field.DisplayLabel := '전 공(중분류)';
                   end;
              else begin
                     Field.Visible := False;
                   end;
           end;
         end;

       end;
    end;

    DG_Before.Refresh;
end;

procedure TDutyForm.AllAddBtnClick(Sender: TObject);
var
  i: Integer;
begin
    with DM.qryCODE do
    begin
        First;
        while not EOF do
        begin
            AddBtnClick(Sender);
            Next;
        end;

    end;
end;

procedure TDutyForm.AddBtnClick(Sender: TObject);
var
  i: Integer;
begin
    with DM.qryCODE do
    begin
      if gsCodeid = 'I116' then
      begin
        if fnGetEqRow(SG_After, FieldByName('jobfield').AsString, FieldByName('dutykind').AsString, FieldByName('duty').AsString) = -1 then
        begin
            if SG_After.Cells[0,SG_After.RowCount-1] <> '' then
                SG_After.RowCount := SG_After.RowCount + 1;

            for i := 0 to SG_After.ColCount-1 do
               SG_After.Cells[i, SG_After.RowCount-1] := Fields[i].AsString;
        end;
      end
      else if (gsCodeid = 'I711') or (gsCodeid = 'I713') or (gsCodeid = 'I231') or (gsCodeid = 'I225') then
      begin
        if fnGetEqRow(SG_After, FieldByName('mainid').AsString, FieldByName('subid').AsString, FieldByName('detid').AsString) = -1 then
        begin
            if SG_After.Cells[0,SG_After.RowCount-1] <> '' then
                SG_After.RowCount := SG_After.RowCount + 1;

            for i := 0 to SG_After.ColCount-1 do
               SG_After.Cells[i, SG_After.RowCount-1] := Fields[i].AsString;
        end;
      end
      else
      begin
        if fnGetEqRow(SG_After, FieldByName('대분류코드').AsString, FieldByName('중분류코드').AsString, FieldByName('세분류코드').AsString) = -1 then
        begin
            if SG_After.Cells[0,SG_After.RowCount-1] <> '' then
                SG_After.RowCount := SG_After.RowCount + 1;

            for i := 0 to SG_After.ColCount-1 do
               SG_After.Cells[i, SG_After.RowCount-1] := Fields[i].AsString;
        end;

      end;
    end;
    SG_After.Row := SG_After.RowCount -1;
end;

procedure TDutyForm.AllDeleteBtnClick(Sender: TObject);
begin
    fzSGInitialRow(SG_After);
end;

procedure TDutyForm.DeleteBtnClick(Sender: TObject);
begin
    if SG_After.Row = 0 then System.Exit;

    if SG_After.Cells[0,SG_After.Row] <> '' then
    begin
        fzSGDeleteRow(SG_After, SG_After.Row);
        DG_Before.SetFocus;
        SG_After.SetFocus;
    end;
end;

procedure TDutyForm.SG_AfterDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
       //if gdSelected in State then
       //begin
       ///   Brush.Color := $00C4E1E1;
       //   Font.Color  := clBlack;
       //end;
       if (ARow = 0) then
       begin
           Loc := DT_CENTER or DT_WORDBREAK;
           Font.Style := [fsBold];
       end
       else
       begin
           Loc := DT_LEFT or DT_WORDBREAK;
           Font.Style := [];
       end;

       FillRect(Rect);
       Rect.Top   := Rect.Top + 2;
       Rect.Left  := Rect.Left + 2;

       DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TDutyForm.DG_BeforeDblClick(Sender: TObject);
begin
    AddBtn.Click;
end;

procedure TDutyForm.DG_BeforeKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        AddBtn.Click;
end;

procedure TDutyForm.SG_AfterDblClick(Sender: TObject);
begin
    if SG_After.Cells[0,SG_After.Row] <> '' then
        DeleteBtn.Click;
end;

procedure TDutyForm.OKBtnClick(Sender: TObject);
var
  i: Integer;
begin
    // if SG_After.Cells[0, SG_After.Row] = '' then
    // begin
    //     MessageDlg('선택된 직무내용이 없습니다.' + #13 +
    //                '종료하시려면 취소 버튼을 누르십시오.',mtError,[mbOK],0);
    //     Exit;
    // end;

    gbSelectYN := True;

    SG_InOut.RowCount := SG_After.RowCount;
    for i := 1 to SG_After.RowCount -1 do
        SG_InOut.Rows[i].Assign(SG_After.Rows[i]);


    DM.qryCODE.Close;
    fzSGAllClear(SG_After);
    Close;
end;

procedure TDutyForm.CancelBtnClick(Sender: TObject);
begin
    gbSelectYN := False;

    DM.qryCODE.Close;
    fzSGAllClear(SG_After);
    Close;
end;

procedure TDutyForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        Search_BtnClick(Sender);
    end;
end;

procedure TDutyForm.Search_BtnClick(Sender: TObject);
begin
    fzGetData(gsCodeid,E_Search.Text,E_Search.Text,E_Search.Text);
end;

end.
