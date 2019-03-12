unit UPayClForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit;

type
  TPayClForm = class(TForm)
    TCODE: TTMaxDataSet;
    SG: TStringGrid;
    E_PayCL: TOnEdit;
    Search_Btn: TOnFocusButton;
    OkBtn: TOnFocusButton;
    ExitBtn: TOnFocusButton;
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
//    procedure ttxCODEBeforeCall(DataSet: TDataSet; var Buffer: PChar);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Check, START      : Boolean;

    JOB_KIND : Integer;   // 작업 종류 : 1.직급, 2.직군, 3.직종

    JobField : String;  // 직군코드..

    //  Tuxedo Component BeforeCall Event 처리변수
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;

    Code,
    CodeName : String;
    { Public declarations }
  end;

var
  PayClForm: TPayClForm;

implementation

uses //tuxCommonDM;
     UMainForm;
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
                        ' nvl( codeno   ,'' '') CODE,       '+
                        ' nvl( codefname ,'' '') CODENAME    '+
                        'FROM  pyccode, pishrvari           '+
                        'WHERE codeid = ''I112''            '+
                        '  and nvl(useyn, ''Y'')  = ''Y''   '+
                        '  and (UPPER(codename) LIKE ''%' + UpperCase(E_PayCL.Text) +'%'' '+
                        '       OR UPPER(codeno) LIKE   ''%' + UpperCase(E_PayCL.Text) + '%'')' +
                        '  and gubun = ''00'' and sgubun = ''0003''  '+
                        '  and codeno between value1 and value2 '+
                        ' order by codeno                   ';
       2 :  SqlText := 'SELECT nvl(  codeno  ,'' '') CODE, ' +
                        '      nvl(  codename,'' '') CODENAME  ' +
                        'FROM   pyccode                ' +
                        'WHERE  codeid = ''I116''     ' ;
       3 :  SQLText :=  'SELECT  ' +
                        'nvl(  dutykind     ,'' '') CODE, ' +
                        'nvl(  dutykindname ,'' '') CODENAME  ' +
                        'FROM pishrdukind             ' +
                        'WHERE JobField = '''+JobField+'''        ' +
                        '  AND useyn  = ''Y''         ' +
                        '  AND (UPPER(dutykind) LIKE ''%' + UpperCase(E_PayCL.Text) +
                        '%'' OR UPPER(dutykindname) LIKE   ''%' + UpperCase(E_PayCL.Text) + '%'')' +
                        'ORDER BY dutykind            ' ;
    end;

    With TCODE do begin
       Close;
       ClearFieldInfo;
       AddField('CODE'         , ftString,  40);
       AddField('CODENAME'     , ftString,  80);

       Sql.Clear;
       Sql.Text:= SQLText;
       //memo1.text := SQLText;
       ServiceName := 'PIT1030A_SEL7';
       open;

       SendMessage(SG.Handle, WM_SETREDRAW, 0, 0);

       SG.RowCount := 2;
       SG.Cells[0,SG.RowCount-1] := '';
       SG.Cells[1,SG.RowCount-1] := '';

       Cnt := 1;
       while not Eof do
       begin
           if Cnt > 1 then SG.RowCount := SG.RowCount + 1;
           SG.Cells[0,Cnt] := FieldByName('CODE').AsString;
           SG.Cells[1,Cnt] := FieldByName('CODENAME').AsString;
           Inc(Cnt);
           Next;
       end;
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
              SG.ColWidths[0] := 0;
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
{
procedure TPayClForm.ttxCODEBeforeCall(DataSet: TDataSet;
  var Buffer: PChar);
begin
  with TCODE do
  begin
    ReflectFields := CDS_Prfd;
    InitService(1, tpString, False, 30);
    SetHeader(ServiceName, '0', CDS_Pmax, '', RecordCount, shBUFFSIZE);
    SetFieldValues (0, CDS_Psfd);
  end;
end;
}
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
 