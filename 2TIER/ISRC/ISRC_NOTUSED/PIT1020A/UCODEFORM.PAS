unit UCodeForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, pegradpanl, Grids, StdCtrls, Mask, pebtnedit, peoutlookbtn, Buttons;

type
  TCodeForm = class(TForm)
    Panel1: TPanel;
    SG: TStringGrid;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    CloseBtn: TPeJeonOutLookBtn;
    Bt_OK: TPeJeonOutLookBtn;
    SGM: TStringGrid;
    SG_Main: TStringGrid;
    procedure CloseBtnClick(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure Bt_OKClick(Sender: TObject);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGMClick(Sender: TObject);
    procedure SG_MainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    START, SELECT_YN : Boolean;

    //  Tuxedo Component BeforeCall Event 처리변수
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;

    CODE_ID  : String;

    pMainId, pMainNm, pSubId, pSubNm,  pDetId, pDetNm : String;

    procedure DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
    procedure SetGrid(mGrid: TStringGrid; mKeyWord: String);
  end;

var
  CodeForm: TCodeForm;

implementation

uses
  CommonDM, URegForm;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////

procedure TCodeForm.DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
var i: Integer;
begin
  with yourStringGrid do
  begin
    for i := ARow to RowCount-1 do
      Rows[i].Assign(Rows[i+1]);
    if RowCount = 1  then
      Rows[1].Text := ''
    else
      RowCount := RowCount - 1;
  end;
end;

procedure TCodeForm.SetGrid(mGrid: TStringGrid; mKeyWord: String);
var
  SQLText : String;
  Cnt : Integer;
begin
    // 구 분        CODESUPER     CODEMAINON
    // 대분류 (0)           0               0
    // 중분류 (1)           0               1
    // 세부   (2)           1               1
    if mGrid.Tag = 0 then
      SQLText:= Format(
             'SELECT                             ' +
             ' codeno    code  ,           ' +
             ' codename  codename            ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''0''            ' +
             '  AND codemainon = ''0''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%'])
    else if mGrid.Tag = 1 then
      SQLText:= Format(
             'SELECT  ' +
             '  codeno    code  ,' +
             '  codename  codename ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''0''            ' +
             '  AND codemainon = ''1''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%'])
    else
      SQLText:= Format(
             'SELECT  ' +
             '  codeno    code   ,' +
             '  codename  codename  ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''1''            ' +
             '  AND codemainon = ''1''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%']);

    With DM.QCODE do begin
        Close;
        Sql.Clear;
        Sql.Text := SQLText;

        try
          Open;
        except
          Close;
          Messagedlg(' DataBase Engine Error ' + #13+ #13+ ' --> 시스템 관리자에게 연락하세요!',mtError,[mbOK],0);
          System.Exit;
        end;

        SendMessage(mGrid.Handle, WM_SETREDRAW, 0, 0);

        mGrid.RowCount := 2;
        mGrid.Cells[0,1] := '';
        mGrid.Cells[1,1] := '';
        Cnt := 1;
        while not Eof do
        begin
            if Cnt > 1 then mGrid.RowCount := mGrid.RowCount + 1;
            mGrid.Cells[0,Cnt] := FieldByName('CODE').AsString;
            mGrid.Cells[1,Cnt] := FieldByName('CODENAME').AsString;
            Inc(Cnt);
            Next;
        end;
        Close;

        SendMessage(mGrid.Handle, WM_SETREDRAW, 1, 0);
        mGrid.Refresh;

    end; // End -- with ttxCODE
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////

procedure TCodeForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TCodeForm.FormPaint(Sender: TObject);
begin
    if START = False Then Exit;

    Application.ProcessMessages;
    START := False;

    if CODE_ID = 'I711' then
    begin
       self.Caption := '[취급장비 열람]';
       SG_Main.Cols[0].Text  := '코드';       SG_Main.Cols[1].Text  := '대분류(기  능)';
       SGM.Cols[0].Text      := '코드';       SGM.Cols[1].Text      := '중분류(장비명)';
       SG.Cols[0].Text       := '코드';       SG.Cols[1].Text       := '세분류(제품명)';
    end
    else
    begin
       self.Caption := '[취급프로그램 열람]';
       SG_Main.Cols[0].Text  := '코드';       SG_Main.Cols[1].Text  := '프로그램(대분류)';
       SGM.Cols[0].Text      := '코드';       SGM.Cols[1].Text      := '프로그램(중분류)';
       SG.Cols[0].Text       := '코드';       SG.Cols[1].Text       := '프로그램(세분류)';
    end;

    SetGrid(SG_Main, '');
    SetGrid(SGM, '');
    SetGrid(SG, SGM.Cells[0,SGM.Row]);
end;

procedure TCodeForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  CloseBtn.Click;
end;

procedure TCodeForm.SGDblClick(Sender: TObject);
begin
    Bt_OK.Click;
end;

procedure TCodeForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if ARow = 0 then
            Font.Style := [fsBold]
        else
            Font.Style := [];

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        Loc := DT_LEFT or DT_WORDBREAK;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TCodeForm.SG_MainClick(Sender: TObject);
begin
    if SGM.Cells[0,SG_Main.Row] <> '' then
    begin
        SetGrid(SGM, SG_Main.Cells[0,SG_Main.Row]);
        SetGrid(SG, SGM.Cells[0,SGM.Row]);
    end;
end;

procedure TCodeForm.SGMClick(Sender: TObject);
begin
    if SGM.Cells[0,SGM.Row] <> '' then
        SetGrid(SG, SGM.Cells[0,SGM.Row]);
end;

procedure TCodeForm.SGKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (SG.Cells[0,SG.Row] <> '') then
    begin
        Key := #0;
        Bt_OK.Click;
    end;
end;

procedure TCodeForm.Bt_OKClick(Sender: TObject);
begin
    pMainId := SG_Main.Cells[0, SG_Main.Row];
    pMainNm := SG_Main.Cells[1, SG_Main.Row];
    pSubId  := SGM.Cells[0, SGM.Row];
    pSubNm  := SGM.Cells[1, SGM.Row];
    pDetId  := SG.Cells[0, SG.Row];
    pDetNm  := SG.Cells[1, SG.Row];
    SELECT_YN := True;

    Close;
end;

procedure TCodeForm.CloseBtnClick(Sender: TObject);
begin
    Close;
end;

end.
