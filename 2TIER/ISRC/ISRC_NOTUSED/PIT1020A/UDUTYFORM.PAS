unit UDutyForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, StdCtrls, Mask, pebtnedit, Buttons,
  ExtCtrls, Db;

type
  TDutyForm = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    SG2: TStringGrid;
    SG3: TStringGrid;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Panel2: TPanel;
    SG1: TStringGrid;
    OKBtn: TPeJeonOutLookBtn;
    CancelBtn: TPeJeonOutLookBtn;
    M_Dutyexpl: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure SG2Click(Sender: TObject);
    procedure SG1Click(Sender: TObject);
    procedure SG3DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    START,
    SELECT_YN : Boolean;

    pJobfield , pJobFieldNAME,
    pDUTYKIND, pDUTYKINDNAME,
    pDUTY, pDUTYNAME : String;

    procedure SetGrid(mGrid: TStringGrid; mKey: Integer; KeyGubun, KeyKind, KeyWord : String);
    { Public declarations }
  end;

var
  DutyForm: TDutyForm;

implementation

{$R *.DFM}

uses
  CommonDM;

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////

procedure TDutyForm.SetGrid(mGrid: TStringGrid; mKey: Integer; KeyGubun, KeyKind, KeyWord : String);
var
  Temp : String;
  i, Cnt : Integer;
begin
    case mKey of
      1:  Temp := 'SELECT  codeno   code    , '+
                  '        codename codename  '+
                  'FROM   pyccode                 ' +
                  'WHERE   codeid = ''I116''      ' +
                  '  AND   useyn  = ''Y''         ' ;
      2:  Temp := Format(
               'SELECT  ' +
               '  dutykind      code  ,        '+
               '  dutykindname  codename       '+
               'FROM pishrdukind                  ' +
               'WHERE jobfield = ''%s''           ' +
               '  AND useyn  = ''Y''              ' +
               'ORDER BY dutykind                 ' ,[KeyGubun]) ;
      3:  Temp:= Format(
               'SELECT ' +
               ' jobfield jobfield,    ' +
               ' dutykind dutykind,    ' +
               ' duty     duty    ,    ' +
               ' dutyname dutyname,    ' +
               ' dutyexpl dutyexpl     ' +
               'FROM pishrduty             ' +
               'WHERE jobfield = ''%s''    ' +
               '  AND dutykind = ''%s''    ' +
               '  AND (UPPER(dutyname) LIKE ''%s'' OR UPPER(duty) LIKE ''%s'') ' +
               '  AND useyn = ''Y''           ' +
               // 'ORDER BY 1                    ' ,[KeyGubun, KeyKind, '%'+KeyWord+'%', '%'+KeyWord+'%']);
               'ORDER BY 1                    ' ,[KeyGubun, KeyKind, '%'+KeyWord+'%', '%'+KeyWord+'%']);
    end; // End -- case

    with DM.QCODE do begin
        Close;
        SQL.Clear;
        SQL.Text := Temp;
        Open;
    end;

    SendMessage(mGrid.Handle, WM_SETREDRAW, 0, 0);
    with mGrid, DM.QCODE do begin
        case mKey of
          1,2:
          begin
              RowCount := 1;
              for i:=0 to ColCount-1 do
                  Cells[i, RowCount-1] := '';
              RowHeights[RowCount-1] := 14;

              Cnt := 1;
              while not Eof do begin
                  if Cnt > 1 then RowCount := RowCount + 1;
                  Cells[0,Cnt-1] := FieldByName('CODENAME').AsString;
                  Cells[1,Cnt-1] := FieldByName('CODE').AsString;

                  RowHeights[RowCount-1] := ((Canvas.TextWidth(cells[0,Cnt-1]) div ColWidths[0])) * 12 + 14;
                  Inc(Cnt);
                  Next;
              end;
          end;
          3:
          begin
              M_Dutyexpl.Width    := ColWidths[2];

              RowCount := 2;
              for i:=0 to mGrid.ColCount-1 do
                  mGrid.Cells[i,mGrid.RowCount-1] := '';
              // RowHeights[RowCount-1] := 20;

              Cnt := 1;
              while not Eof do begin
                  if Cnt > 1 then RowCount := RowCount + 1;
                  Cells[3,Cnt] := FieldByName('JOBFIELD').AsString;
                  Cells[4,Cnt] := FieldByName('DUTYKIND').AsString;
                  Cells[0,Cnt] := FieldByName('DUTY').AsString;
                  Cells[1,Cnt] := FieldByName('DUTYNAME').AsString;
                  Cells[2,Cnt] := FieldByName('DUTYEXPL').AsString;
                  // RowHeights[Cnt] := 20 + ((Length(Cells[2,Cnt]) div 58) * 12);
                  M_Dutyexpl.Lines.Text := FieldByName('DUTYEXPL').AsString;
                  if M_Dutyexpl.Lines.Count > 0 then
                      RowHeights[RowCount-1] := (M_Dutyexpl.Lines.Count-1) * 12 + 14
                  else
                      RowHeights[RowCount-1] := 14;

                  Inc(Cnt);
                  Next;
              end;
          end;
        end; // End -- Case
    end; // End -- with mGrid, MainForm.ttxCODE do begin

    DM.QCODE.Close;
    SendMessage(mGrid.Handle, WM_SETREDRAW, 1, 0);
    mGrid.Refresh;
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////

procedure TDutyForm.FormCreate(Sender: TObject);
begin
    START := TRUE;
    SG1.ColWidths[1] := 0;

    SG2.ColWidths[1] := 0;

    SG3.ColWidths[3] := 0;
    SG3.ColWidths[4] := 0;

    SG3.Cols[0].Text := '직무';
    SG3.Cols[1].Text := '직무명';
    SG3.Cols[2].Text := '직무설명';
end;

procedure TDutyForm.FormPaint(Sender: TObject);
begin
    if START = false then Exit;

    Application.ProcessMessages;
    START := False;

    SetGrid(SG1,1,'','','');
    SetGrid(SG2,2,SG1.Cells[1,SG1.Row],'','');
    SetGrid(SG3,3,SG1.Cells[1,SG1.Row],SG2.Cells[1,SG2.Row],'');
end;

procedure TDutyForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  CancelBtn.Click;
end;

procedure TDutyForm.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
  with (Sender as TStringGrid).Canvas do
  begin
    FillRect(Rect);
    Rect.Top   := Rect.Top + 2;
    Rect.Left  := Rect.Left + 2;

    if (ARow = 0) or (ACol = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

     DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, DT_LEFT or DT_WORDBREAK);
  end;
end;

procedure TDutyForm.SG3DrawCell(Sender: TObject; ACol, ARow: Integer;
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

    if (ARow = 0) or (ACol = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

    DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);

 end;
end;

procedure TDutyForm.OKBtnClick(Sender: TObject);
begin
     if SG3.Cells[0,SG3.Row] = '' then
     begin
         MessageDlg('선택된 직무내용이 없습니다.' + #13 +
                    '종료하시려면 취소 버튼을 누르십시오.',mtError,[mbOK],0);
         Exit;
     end;
     SELECT_YN := True;

     pJobfield       := SG3.Cells[3,SG3.Row];
     pJobfieldNAME   := SG1.Cells[0,SG1.Row];

     pDUTYKIND       := SG3.Cells[4,SG3.Row];
     pDUTYKINDNAME   := SG2.Cells[0,SG2.Row];

     pDUTY           := SG3.Cells[0,SG3.Row];
     pDUTYNAME       := SG3.Cells[1,SG3.Row];
     Close;
end;

procedure TDutyForm.CancelBtnClick(Sender: TObject);
begin
    SELECT_YN := False;
    Close;
end;

procedure TDutyForm.SG3KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (SG3.Cells[0,SG3.Row] <> '') then OKBtn.Click;
end;

procedure TDutyForm.SG1Click(Sender: TObject);
begin
   if SG1.Cells[0,SG1.Row] <> '' then
   begin
    SetGrid(SG2, 2, SG1.Cells[1,SG1.Row], '', '');
    SetGrid(SG3, 3, SG1.Cells[1,SG1.Row], SG2.Cells[1,SG2.Row], '');
   end;
end;

procedure TDutyForm.SG2Click(Sender: TObject);
begin
   if SG2.Cells[0,SG1.Row] <> '' then
     SetGrid(SG3, 3, SG1.Cells[1,SG1.Row], SG2.Cells[1,SG2.Row], '');
end;

procedure TDutyForm.SG3DblClick(Sender: TObject);
begin
    if SG3.Cells[0,SG3.Row] <> '' then
       OKBtn.Click;
end;

end.


