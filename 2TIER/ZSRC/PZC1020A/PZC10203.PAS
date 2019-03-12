unit pzc10203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, ExtCtrls, comobj, ComCtrls, Func, Db, DBTables;

type
  TFPIC10203 = class(TForm)
    Panel2: TPanel;
    TmpGrid00: TStringGrid;
    BB_upload: TBitBtn;
    BitBtn4: TBitBtn;
    BB_Close: TBitBtn;
    PgBar: TProgressBar;
    OpenDialog1: TOpenDialog;
    UPDQuery: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure TmpGrid00DblClick(Sender: TObject);
    procedure BB_OkClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure TmpGrid00DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_uploadClick(Sender: TObject);
    procedure _PGridinit(StringGrid : TStringGrid);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _PubData : array[0..1] of String;
    _CMsg    : Array[0..1000] of Char;
    _SMsg    : String;
  end;

var
  FPIC10203: TFPIC10203;

implementation

uses pzc10201;

{$R *.DFM}

procedure TFPIC10203.FormCreate(Sender: TObject);
begin

  with TmpGrid00 do
  begin
    ColWidths[ 0]  := 30;
    ColWidths[ 1]  := 50;
    ColWidths[ 2]  := 55;
    ColWidths[ 3]  := 100;
    ColWidths[ 4]  := 55;

    Cells[ 0, 0]  := '순번';
    Cells[ 1, 0]  := '조직차수';
    Cells[ 2, 0]  := '부서코드';
    Cells[ 3, 0]  := '부서코드명';
    Cells[ 4, 0]  := '재무코드';
  end;
end;

procedure TFPIC10203.TmpGrid00DblClick(Sender: TObject);
begin

  ModalResult := mrOk;
end;

procedure TFPIC10203.BB_OkClick(Sender: TObject);
begin

   TmpGrid00.OnDblClick(self);
end;

procedure TFPIC10203.BB_CancelClick(Sender: TObject);
begin

  ModalResult := mrCancel;
end;

procedure TFPIC10203.TmpGrid00DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   strLen  : integer;
   strSize : TSize;
   tmpRect : TRect;
begin

  //중앙정렬(TITLE)
  if (ARow = 0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut((Rect.Left + Rect.Right - strLen) div 2, Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2,
               TStringGrid(Sender).Cells[ACol,ARow]);
    end;
  end;


  //중앙정렬(DATA)
  if (ARow > 0) and (ACol in [1]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin

      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut((Rect.Left + Rect.Right - strLen) div 2, Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2,
               TStringGrid(Sender).Cells[ACol,ARow]);
    end;
  end;

  //오른쪽(DATA)
  if (ARow > 0) and (ACol in [0]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin

      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut( Rect.Right - strLen - 2, Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2,
               TStringGrid(Sender).Cells[ACol,ARow]);
    end;
  end;
end;

procedure TFPIC10203.BB_CloseClick(Sender: TObject);
begin

    close;
end;

procedure TFPIC10203.BB_uploadClick(Sender: TObject);
var
 i, j, iRowCnt,iColCnt : integer;
 ExcelApp : variant;
 TmpStr   : String; 
begin

  try
     ExcelApp := CreateOleObject('Excel.application');
  except
     ShowMessage('Excel이 설치되어 있지 않습니다!!!');
     Exit;
  end;

  //초기화
  _PGridInit(TmpGrid00);

  PgBar.Position := 0;

  if OpenDialog1.Execute then
     ExcelApp.workbooks.open(OpenDialog1.FileName)
  else
     System.Exit;

  iRowCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Rows.Count);
  iColCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Columns.Count);

  for i := 1 to iRowCnt do
  begin
    TmpStr := ExcelApp.cells[i, 2];
    if length(trim(TmpStr)) <> 0 then
    begin
      iRowCnt := i;
    end;
  end;

  Application.ProcessMessages;
  try

    SendMessage(TmpGrid00.Handle, WM_SETREDRAW, integer(False), 0);
    TmpGrid00.RowCount := iRowCnt;
    TmpGrid00.ColCount := 5;
    PgBar.Max          := iRowCnt;

    for i := 0 to iRowCnt-1 do
    begin
       TmpGrid00.Cells[0, i+1] := IntToStr(i+1);
       for j := 0 to TmpGrid00.ColCount  do
       begin
        //Cells[ 0, 0]  := '순번';
        //Cells[ 1, 0]  := '부서코드';
        //Cells[ 2, 0]  := '부서코드명';
        //Cells[ 3, 0]  := '재무코드';
        TmpGrid00.Cells[j+1, i+1] := ExcelApp.cells[i+2, j+1];
       end;
       PgBar.Position := PgBar.Position + 1;
    end;
    SendMessage(TmpGrid00.Handle, WM_SETREDRAW,integer(True), 0);
    InvalidateRect(TmpGrid00.Handle, Nil, False);

    ExcelApp.WorkBooks.Close;
    ExcelApp.Quit;
    ExcelApp := unassigned;

    ShowMessage('파일 업로드가 완료되었습니다.');
    PgBar.Position := 0;

  except
       ExcelApp.WorkBooks.Close;
       ExcelApp.quit;
       ExcelApp := unassigned;
  end;
end;

procedure TFPIC10203._PGridinit(StringGrid: TStringGrid);
var
  i : integer;
begin

  //초기화
  with StringGrid do
  begin
      RowCount := Fixedrows + 1;
      for i := 0 to ColCount -1  do
      begin
            Cells[ i, RowCount - 1] := '';
      end;
      Refresh;
  end;
end;

procedure TFPIC10203.BitBtn4Click(Sender: TObject);
var
  i: integer;
begin

     //차수, 코드체크
     with UPDQuery do
     begin
         Active := false;
         SQL.Clear;
         SQL.Add('SELECT ''X''                ');
         SQL.Add('  FROM PYCDEPT              ');
         SQL.Add(' WHERE ORGNUM   = :ORGNUM   ');
         SQL.Add('   AND DEPTCODE = :DEPTCODE ');
         SQL.Add('   AND ROWNUM = 1           ');
         Prepare;
         Params.Clear;
         Params.CreateParam(ftString,'ORGNUM', ptInput);
         Params.CreateParam(ftString,'DEPTCODE', ptInput);

         for i := 1 to TmpGrid00.rowcount-1 do
         begin
           Active := false;
           ParamByName('ORGNUM').AsString   :=  TmpGrid00.Cells[ 1, i];
           ParamByName('DEPTCODE').AsString :=  TmpGrid00.Cells[ 2, i];
           Active := true;
           if eof then
           begin
              _SMsg := '해당 조직차수에 부서코드 : '+ TmpGrid00.Cells[ 2, i] + ' 이 존재하지 않습니다. 확인하여 처리하십시오.';
              Application.MessageBox( StrPCopy(_CMsg,_SMsg),
                                      '부서코드 관리', MB_ICONERROR + MB_OK);
              exit;
           end;
         end;
     end;

     try
       DeptForm.Database1.StartTransaction;
       with UPDQuery do
       begin

          for i := 1 to TmpGrid00.rowcount-1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE PYCDEPT SET                  ');
            SQL.Add('       FINCODE  = :FINCODE          ');
            SQL.Add(' WHERE ORGNUM   = :ORGNUM           ');
            SQL.Add('   AND DEPTCODE = :DEPTCODE         ');
            ParamByName('ORGNUM').AsString   :=  TmpGrid00.Cells[ 1, i];
            ParamByName('DEPTCODE').AsString :=  TmpGrid00.Cells[ 2, i];
            ParamByName('FINCODE').AsString  :=  TmpGrid00.Cells[ 4, i];
            EXECSQL;
          end;
       end;
       DeptForm.Database1.Commit;
       Application.MessageBox('자료 저장을 성공적으로 처리하였습니다.', '부서코드 관리', MB_ICONINFORMATION + MB_OK);

     except

        on e : Exception do
        begin
           DeptForm.Database1.rollback;
           Application.MessageBox('자료 저장에 실패하였습니다. 확인하여 처리하십시오.', '부서코드 관리', MB_ICONERROR + MB_OK);
        end;
     end;
end;

end.
