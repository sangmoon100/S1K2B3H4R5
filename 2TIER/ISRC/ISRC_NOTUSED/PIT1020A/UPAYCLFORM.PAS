unit UPayClForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, Db, StdCtrls, Mask,
  pebtnedit, Grids, DBGrids, pedbgrid, DBTables, Buttons;

type
  TPayClForm = class(TForm)
    Panel1: TPanel;
    ExitBtn: TPeJeonOutLookBtn;
    OKBtn: TPeJeonOutLookBtn;
    Pa_Title: TPeJeonGrdPanel;
    SG: TStringGrid;
    E_PayCl: TPePanelEdit;
    Search_Btn: TSpeedButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure E_PayClKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Search_BtnClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Check, START      : Boolean;
    JOB_KIND : Integer;   // 작업 종류 : 1.직급, 2.직군, 3.직종
    JobField : String;  // 직군코드..

    Code,
    CodeName : String;
    { Public declarations }
  end;

var
  PayClForm: TPayClForm;

implementation

uses CommonDM;

{$R *.DFM}

procedure TPayClForm.ExitBtnClick(Sender: TObject);
begin
     Check := False;
     Close;
end;

procedure TPayClForm.E_PayClKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        Search_Btn.Click;
        E_PayCL.SetFocus;
     end;
end;

procedure TPayClForm.OKBtnClick(Sender: TObject);
begin
    Check    := True;
    Code     := SG.Cells[0,SG.Row];
    CodeName := SG.Cells[1,SG.Row];
    Self.Close;
end;

procedure TPayClForm.Grid1DblClick(Sender: TObject);
begin
     OkBtn.Click;
end;

procedure TPayClForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
      Key := #0;
      OKBtn.Click;
    end;
end;

procedure TPayClForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
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

    if (Sender as TStringGrid).Cells[2, ARow] = 'Y' then
       Font.Style :=  [fsBold];

    if (ARow = 0) or (ACol = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

    DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);

 end;
end;

procedure TPayClForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TPayClForm.Search_BtnClick(Sender: TObject);
var
  Sqltext : string;
  Cnt : Integer;
begin
    case JOB_KIND of
       1 :  Sqltext :=  'SELECT  '+
                        ' codeno    code,           '+
                        ' codename  codename,USEYN        '+
                        'FROM  pyccode, pishrvari           '+
                        'WHERE codeid = ''I112''            '+
                        '  and (UPPER(codename) LIKE ''%' + UpperCase(E_PayCL.Text) +
                        '       %'' OR UPPER(codeno) LIKE   ''%' + UpperCase(E_PayCL.Text) + '%'')' +
                        '  and gubun = ''00'' and sgubun = ''0003''  '+
                        '  and codeno between value1 and value2 '+
                        ' order by codeno                   ';
       2 :  SqlText := 'SELECT codeno   code,    ' +
                        '      codename codename,USEYN ' +
                        'FROM   pyccode                ' +
                        'WHERE   codeid = ''I116''     ' ;
       3 :  SQLText :=  'SELECT  ' +
                        '  dutykind      code  , ' +
                        '  dutykindname  codename,USEYN  ' +
                        'FROM pishrdukind             ' +
                        'WHERE JobField = '''+JobField+'''        ' +
                        '  AND useyn  = ''Y''         ' +
                        '  AND (UPPER(dutykind) LIKE ''%' + UpperCase(E_PayCL.Text) +
                        '%'' OR UPPER(dutykindname) LIKE   ''%' + UpperCase(E_PayCL.Text) + '%'')' +
                        'ORDER BY dutykind            ' ;
    end;

    with DM.QCode do
    begin
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

       SendMessage(SG.Handle, WM_SETREDRAW, 0, 0);

       SG.RowCount := 2;
       SG.Cells[0,SG.RowCount-1] := '';
       SG.Cells[1,SG.RowCount-1] := '';
       SG.Cells[2,SG.RowCount-1] := '';

       Cnt := 1;
       while not Eof do
       begin
           if Cnt > 1 then SG.RowCount := SG.RowCount + 1;
           SG.Cells[0,Cnt] := FieldByName('CODE').AsString;
           SG.Cells[1,Cnt] := FieldByName('CODENAME').AsString;
           SG.Cells[2,Cnt] := FieldByName('USEYN').AsString;
           Inc(Cnt);
           Next;
       end;

       Close;
     end;

     SendMessage(SG.Handle, WM_SETREDRAW, 1, 0);
     SG.Refresh;
end;

procedure TPayClForm.FormPaint(Sender: TObject);
begin
     if START = false then Exit;
     Application.ProcessMessages;

     START := False;
    case JOB_KIND of
       1 : begin
              SG.Cols[0].Text   := 'BAND';
              SG.Cols[1].Text   := 'BAND명';
           end;
       2 : begin
              SG.Cols[0].Text   := '직군';
              SG.Cols[1].Text   := '직군명';
           end;
       3 : begin
              SG.Cols[0].Text   := '직종';
              SG.Cols[1].Text   := '직종명';
           end;
    end;

     PayClForm.Search_Btn.Click;
end;

procedure TPayClForm.SGDblClick(Sender: TObject);
begin
    if SG.Cells[0,SG.Row] <> '' then OKBtn.Click;

end;

procedure TPayClForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  ExitBtn.Click;
end;

procedure TPayClForm.SGKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) and (SG.Cells[0,SG.Row] <> '') then
     begin
         Key := #0;
         OKBtn.Click;
     end;
end;

end.

