unit ULevelForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Mask, pebtnedit, ExtCtrls, pegradpanl, Db,
  //TXClientDS,
  Tmax_DataSetText, OnFocusButton, OnEditBaseCtrl,
  OnEditStdCtrl;

type
  TLevelForm = class(TForm)
    SG: TStringGrid;
    TCode: TTMaxDataSet;
    OKBtn: TOnFocusButton;
    CancelBtn: TOnFocusButton;
    DutyLevel: TOnEdit;
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
//    procedure ttxCODEBeforeCall(DataSet: TDataSet; var Buffer: PChar);
    procedure SGClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure DutyLevelEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    //  Tuxedo Component BeforeCall Event 처리변수
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;

    START : Boolean;

    SELECT_YN : Boolean;
    { Public declarations }
  end;

var
  LevelForm: TLevelForm;

implementation

uses
  UMainForm;
{$R *.DFM}

procedure TLevelForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   Loc : Cardinal;
begin

 with SG.Canvas do
 begin
    if (ARow = 0) or (ACol = 0) then
      Font.Style := [fsBold]
    else
      Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 4;

    if (ARow = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

    DrawText(Handle, PChar(SG.Cells[ACol, ARow]), -1, Rect, Loc);
 end;
end;

procedure TLevelForm.FormCreate(Sender: TObject);
begin
    SG.Cols[0].Text := '구분';
    SG.Cols[1].Text := '업무의 발달정도/역할과 책임';
    SG.Cols[2].Text := '기술적 지식 및 경험 보유 수준';
    SG.Cols[3].Text := '문제해결 능력 수준';
    SG.Cols[4].Text := '총경험년수';
    SG.Cols[5].Text := '학력';
    SG.ColWidths[5]:= -1;
    SG.ColWidths[6] := -1;
    SG.RowHeights[1] := 20 ;
    START := True;
    SELECT_YN := False;
end;

procedure TLevelForm.CancelBtnClick(Sender: TObject);
begin
     SELECT_YN := False;
     Close;
end;

procedure TLevelForm.FormPaint(Sender: TObject);
var
  sqltext : string;
  Row : Integer;

function RowHeight : Integer;
var
  i, j, k, MAX : integer;
begin
    i := Length(SG.Cells[1,Row]);
    j := Length(SG.Cells[2,Row]);
    k := Length(SG.Cells[3,Row]);

    if i > j then
       if i > k then MAX := i else MAX := k
    else if j > k then MAX := j
    else MAX := k;

    i := MAX div 35 ;
    if MAX mod 35 > 0 then Inc(i);

    Result := 20 + (i * 12);
end;
begin
    if START = False then Exit;

    START := False;

    Application.ProcessMessages;

    sqltext :=  'SELECT  '+
                '  dutylevel     , '+
                '  dutylevelname , '+
                '  divdesc1      , '+
                '  divdesc2      , '+
                '  divdesc3      , '+
                '  expyy         , '+
                '  schgr           '+
                'FROM  PISHRLEVEL     '+
                'WHERE useyn = ''Y''  '+
                'ORDER BY dutylevel   ';

    With TCode do begin
      Close;
      ClearFieldInfo;
      AddField('DUTYLEVEL'    , ftString,  2  );
      AddField('DUTYLEVELNAME', ftString,  20 );
      AddField('DIVDESC1'     , ftString,  300);
      AddField('DIVDESC2'     , ftString,  300);
      AddField('DIVDESC3'     , ftString,  300);
      AddField('EXPYY'        , ftString,  20 );
      AddField('SCHGR'        , ftString,  15 );
      Sql.Clear;
      Sql.Text := sqltext;

      ServiceName := 'PIT1050C_SELG';
      Open;

      Row := 1;
      While Not Eof do
      begin
        if Row > 1 then
          SG.RowCount := SG.RowCount + 1;
        SG.Cells[0,Row] := FieldByName('DUTYLEVELNAME').AsString;
        SG.Cells[1,Row] := FieldByName('DIVDESC1').AsString;
        SG.Cells[2,Row] := FieldByName('DIVDESC2').AsString;
        SG.Cells[3,Row] := FieldByName('DIVDESC3').AsString;
        SG.Cells[4,Row] := FieldByName('EXPYY').AsString;
        SG.Cells[5,Row] := FieldByName('SCHGR').AsString;
        SG.Cells[6,Row] := FieldByName('DUTYLEVEL').AsString;

        if Row = 1 then
        begin
            DutyLevel.Text := SG.Cells[0,Row];
            DutyLevel.Hint := SG.Cells[6,Row];
        end;

        SG.RowHeights[Row] := RowHeight;
        Inc(Row);
        Next;
      end;

      Close;
    end;
end;
{
procedure TLevelForm.ttxCODEBeforeCall(DataSet: TDataSet;
  var Buffer: PChar);
begin
  with ttxCODE do
  begin
    ReflectFields := CDS_Prfd;
    InitService(1, tpString, False, 30);
    SetHeader(ServiceName, '0', CDS_Pmax, '', RecordCount, shBUFFSIZE);
    SetFieldValues (0, CDS_Psfd);
  end;
end;
}
procedure TLevelForm.SGClick(Sender: TObject);
begin
    DutyLevel.Text := SG.Cells[0,SG.Row];
    DutyLevel.Hint := SG.Cells[6,SG.Row];
end;

procedure TLevelForm.OKBtnClick(Sender: TObject);
begin
     SELECT_YN := True;
     Close;
end;

procedure TLevelForm.SGDblClick(Sender: TObject);
begin
    DutyLevel.Text := SG.Cells[0,SG.Row];
    DutyLevel.Hint := SG.Cells[6,SG.Row];
    OKBtn.Click;
end;

procedure TLevelForm.DutyLevelEnter(Sender: TObject);
begin
      SG.SetFocus;
end;

procedure TLevelForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  CancelBtn.Click;
end;

procedure TLevelForm.SGKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (SG.Cells[0,SG.Row] <> '') then
    begin
        DutyLevel.Text := SG.Cells[0,SG.Row];
        DutyLevel.Hint := SG.Cells[6,SG.Row];
        OKBtn.Click;
    end;
end;

end.
 