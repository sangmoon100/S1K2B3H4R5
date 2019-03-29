unit PIA1031A_3;

interface



uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,SysUtils,
  StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs, Mask, ExtCtrls,datelib,
  codeText,pass, MemDS, DBAccess, Ora, Func, ComCtrls,Comobj,
  Clipbrd, JPEG;

type
  TPIA1031a_3Form = class(TForm)
    Panel1: TPanel;
    BB_upload: TBitBtn;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    PgBar: TProgressBar;
    BB_export: TBitBtn;
    BB_exit: TBitBtn;
    ExcelDataSource: TDataSource;
    OraExcelQuery: TOraQuery;
    OraExcelQuerySEQ: TStringField;
    OraExcelQueryEMPNO: TStringField;
    OraExcelQueryKORNAME: TStringField;
    DBGridSearch: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MD_empno: TMaskEdit;
    PL_nmempno: TPanel;
    StringGrid1: TStringGrid;
    Pl_Help: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SGrid01: TStringGrid;
    BitBtn3: TBitBtn;
    procedure BB_uploadClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BB_exportClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MD_empnoChange(Sender: TObject);
    procedure MD_empnoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SGrid01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure _PGridTitle(StringGrid: TStringGrid);
    procedure _PGridInit(StringGrid: TStringGrid);

    procedure _PTmpGridTitle(StringGrid: TStringGrid);
    procedure _PTmpGridValue(pi: integer; pStr: String;
      OraQuery: TOraQuery; StringGrid: TStringGrid);


    procedure _JPEGLoadFromDB(BlobField: TBlobField; Image: TImage);
    procedure _PSaveToXLS();

  public
    { Public declarations }
  end;

var
  PIA1031a_3Form: TPIA1031a_3Form;

implementation

{$R *.DFM}


procedure TPIA1031a_3Form._JPEGLoadFromDB(BlobField: TBlobField; Image: TImage);
var
   jpg: TJPEGImage;
   mem: TMemoryStream;
begin
   jpg := TJPEGImage.Create;
   mem := TMemoryStream.Create;

   try
      if BlobField.IsNull then
         Image.Picture := nil
      else begin
         BlobField.SaveToStream(mem);
         mem.Position := 0;

         jpg.LoadFromStream(mem);
         Image.Picture.Graphic := jpg;
      end;

   finally
      mem.Free;
      jpg.Free;
   end;
end;

procedure TPIA1031a_3Form._PGridInit(StringGrid : TStringGrid);
var
  i : integer;
begin

  with StringGrid do
  begin
    ColCount      := 3;
    RowCount      := 2;
    for i := 0 to ColCount-1 do
    begin
       Cells[i,RowCount-fixedrows] := '';
    end;
    Refresh;
  end;
end;

procedure TPIA1031a_3Form._PGridTitle(StringGrid: TStringGrid);
begin

  with StringGrid do
  begin
     ColCount      := 3;
     RowCount      := 2;

     //ColWidths[ 0] := 50;
     //ColWidths[ 1] := 50;
     //ColWidths[ 2] := 100;

     Cells[ 0, 0]  := '순서';
     Cells[ 1, 0]  := '사원번호';
     Cells[ 2, 0]  := '성    명';
  end;
end;




procedure TPIA1031a_3Form.BB_uploadClick(Sender: TObject);
var
 i, j, iRowCnt,iColCnt : integer;
 ExcelApp : variant;
begin

  try
     ExcelApp := CreateOleObject('Excel.application');
  except
     ShowMessage('Excel이 설치되어 있지 않습니다!!!');
     Exit;
  end;

  if OpenDialog1.Execute then
     ExcelApp.workbooks.open(OpenDialog1.FileName)
  else
     System.Exit;

  iRowCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Rows.Count);
  iColCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Columns.Count);

  Application.ProcessMessages;
  PgBar.Position := 0;
  PgBar.Max := iRowCnt;

  OraExcelQuery.active := false;
  OraExcelQuery.active := true;
  SendMessage(DBGridSearch.Handle, WM_SETREDRAW, integer(False), 0);
  for i := 1 to iRowCnt-1 do
  begin

     if (OraExcelQuery.FieldByName('EMPNO'  ).AsSTring = '') then
        OraExcelQuery.edit
     else
        OraExcelQuery.Append;

     OraExcelQuery.FieldByName('SEQ'    ).AsSTring := IntToStr(i);
     OraExcelQuery.FieldByName('EMPNO'  ).AsSTring := ExcelApp.cells[i+1, 1];
     OraExcelQuery.FieldByName('KORNAME').AsSTring := ExcelApp.cells[i+1, 2];
     OraExcelQuery.Post;

     PgBar.Position := PgBar.Position + 1;
  end;
  SendMessage(DBGridSearch.Handle, WM_SETREDRAW,integer(True), 0);
  InvalidateRect(DBGridSearch.Handle, Nil, False);


  ExcelApp.WorkBooks.Close;
  ExcelApp.Quit;
  ExcelApp := unassigned;

  ShowMessage('파일 업로드가 완료되었습니다.');
  PgBar.Position := 0;
end;

procedure TPIA1031a_3Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

   if ModalResult = mrCancel then
   begin
     if MessageDlg('인사정보다운 화면을 닫겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then
     begin
        CanClose := false;
     end;
  end;
end;

procedure TPIA1031a_3Form.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   strLen  : integer;
   strSize : TSize;
begin

  if (ARow = 0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left+Round((Rect.Right - Rect.Left - strLen)/2),
                Rect.Top+Round((Rect.bottom - Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  if (ARow > 0) AND (ACol in [1,2]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left, Rect.Top+Round((Rect.bottom -
                Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  if (ARow > 0) AND (ACol =  0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left+Round((Rect.Right - Rect.Left - strLen)/2),
                Rect.Top+Round((Rect.bottom - Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;
end;

procedure TPIA1031a_3Form.BB_exportClick(Sender: TObject);
begin
   _PSaveToXLS();
end;

procedure TPIA1031a_3Form._PSaveToXLS();
var
  MOraQuery  : TOraQuery;
  TmpOraQuery1, TmpOraQuery2, TmpOraQuery3, TmpOraQuery4 : TOraQuery;

  XL, XArr : Variant;
  Workbook : Variant;
  WorkSheet: Variant;
  RangeStr : String;

  img  : TImage;
  i, j, _VColFrom, _VColTo : Integer;
begin



  MOraQuery     := TOraQuery.Create(self);
  TmpOraQuery1  := TOraQuery.Create(self);
  TmpOraQuery2  := TOraQuery.Create(self);
  TmpOraQuery3  := TOraQuery.Create(self);
  TmpOraQuery4  := TOraQuery.Create(self);
  img           := Timage.Create(self);
  img.Visible := false;

  try
    if OraExcelQuery.eof then
       exit;

    MOraQuery.Session    := Ora_Session;
    TmpOraQuery1.Session := Ora_Session;
    TmpOraQuery2.Session := Ora_Session;
    TmpOraQuery3.Session := Ora_Session;
    TmpOraQuery4.Session := Ora_Session;

    with MOraQuery do
    begin
        Active := false;
        SQL.Clear;
        SQL.Add('SELECT A.EMPNO, A.KORNAME, A.payclyy||''년 ''||A.payclmm||''월 ''||A.paycldd||''일'' Band,                            ');
        SQL.Add('       A.PAYRA,                                                                                                     ');
        SQL.Add('       A.EMPDATE, A.GROUPEMPDATE, A.ORGEMPDATE,                                                                     ');
        SQL.Add('       (SELECT Z.codename                                                                                           ');
        SQL.Add('          FROM pyccode Z                                                                                            ');
        SQL.Add('         WHERE Z.CODEID = ''I113''                                                                                  ');
        SQL.Add('           AND Z.CODENO = A.PAYRA                                                                                   ');
        SQL.Add('       ) NPAYRA,                                                                                                    ');
        SQL.Add('       (CASE WHEN SUBSTR(A.JUMINID,8,1) IN (''1'',''2'',''5'',''6'') THEN ''19''                                    ');
        SQL.Add('             WHEN SUBSTR(A.JUMINID,8,1) IN (''3'',''4'',''7'',''8'') THEN ''20''                                    ');
        SQL.Add('             WHEN SUBSTR(A.JUMINID,8,1) IN (''9'',''0'') THEN ''18''                                                ');
        SQL.Add('         END || SUBSTR(A.JUMINID,1,6)                                                                               ');
        SQL.Add('       ) BIRTHDAY,                                                                                                  ');
        SQL.Add('       (FLOOR(MONTHS_BETWEEN(SYSDATE + (INTERVAL ''1'' YEAR), TO_DATE(                                              ');
        SQL.Add('                 CASE WHEN SUBSTR(A.JUMINID,8,1) IN (''1'',''2'',''5'',''6'') THEN ''19''                           ');
        SQL.Add('                      WHEN SUBSTR(A.JUMINID,8,1) IN (''3'',''4'',''7'',''8'') THEN ''20''                           ');
        SQL.Add('                      WHEN SUBSTR(A.JUMINID,8,1) IN (''9'',''0'') THEN ''18''                                       ');
        SQL.Add('                 END || SUBSTR(A.JUMINID,1,6), ''yyyymmdd''))/12)                                                   ');
        SQL.Add('                                                                                                                    ');
        SQL.Add('       ) KORAGE,                                                                                                    ');
        SQL.Add('       (FLOOR(MONTHS_BETWEEN(sysdate, TO_DATE(                                                                      ');
        SQL.Add('                 CASE WHEN SUBSTR(A.JUMINID,8,1) IN (''1'',''2'',''5'',''6'') THEN ''19''                           ');
        SQL.Add('                      WHEN SUBSTR(A.JUMINID,8,1) IN (''3'',''4'',''7'',''8'') THEN ''20''                           ');
        SQL.Add('                      WHEN SUBSTR(A.JUMINID,8,1) IN (''9'',''0'') THEN ''18''                                       ');
        SQL.Add('                 END || SUBSTR(A.JUMINID,1,6), ''yyyymmdd''))/12)                                                   ');
        SQL.Add('       ) USAAGE                                                                                                     ');
        SQL.Add('  FROM PIMPMAS A                                                                                                    ');
        SQL.Add(' WHERE A.EMPNO = :pEmpno                                                                                            ');
        Prepare;
        Params.Clear;
        Params.CreateParam(ftString, 'pEmpno', ptInput);
    end;

    with TmpOraQuery1 do
    begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.schnm , B.schfrym, B.schtoym ');
       SQL.Add('  FROM pimscho B                      ');
       SQL.Add(' WHERE B.empno = :pEmpno              ');
       SQL.Add(' ORDER BY B.schfrym DESC              ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput);
    end;

    with TmpOraQuery2 do
    begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.CARPLACE, B.CARFRDATE, B.CARTODATE ');
       SQL.Add('  FROM pimcarr B                            ');
       SQL.Add(' WHERE B.empno = :pEmpno                    ');
       SQL.Add(' ORDER BY B.CARFRDATE DESC                  ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput);
    end;

    with TmpOraQuery3 do
    begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT DECODE(B.COMGUBUN,1,''Dacom'', 2, ''DST'', 3, ''SKB'') COMPANY, ');
       SQL.Add('       B.ANFRDATE, B.ANTODATE,                                         ');
       SQL.Add('      (SELECT TRIM(A.deptname)                                         ');
       SQL.Add('         FROM pycdept A                                                ');
       SQL.Add('        WHERE A.orgnum   = B.orgnum                                    ');
       SQL.Add('          AND A.deptcode = B.deptcode) Ndeptcode                       ');
       SQL.Add('  FROM PIHANNO B                                                       ');
       SQL.Add(' WHERE B.empno = :pEmpno                                               ');
       SQL.Add('   AND B.ANUPDYN = ''Y''                                               ');
       SQL.Add(' ORDER BY B.ANFRDATE DESC                                              ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput);
    end;

    with TmpOraQuery4 do
    begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.photo                              ');
       SQL.Add('  FROM cimphot B                            ');
       SQL.Add(' WHERE B.empno = :pEmpno                    ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput);
    end;


     _VColFrom :=  1;
     _VColTo   := 14;


      XArr := VarArrayCreate([_VColFrom, _VColTo], VarVariant);

      try

        XL := CreateOLEObject('Excel.Application');
      except
        MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
        Exit;
      end;


      //Excel 종료시 저장여부를 물어보지 않도록
      XL.DisplayAlerts := False;
      //새로운 페이지 생성
      XL.WorkBooks.Add;
      WorkBook  := XL.ActiveWorkBook;
      WorkSheet := Workbook.Worksheets[1];
      //XL.WorkSheets[1].Name := '';
      XL.Visible := false;

      //TITLE SETTING(A2)
      XArr[01]  := '▣ Profile';
      XL.Range['A2', 'A2'].Value := XArr;

      //SUB TITLE SETTING
      XArr[01] := '성명';
      XArr[05] := '직책';
      XArr[06] := 'Band(연차)';
      XArr[07] := '생년월일(나이)';
      XArr[08] := '생년월일(만나이)';
      XArr[09] := '최초 입사일';
      XArr[10] := '그룹사 입사일';
      XArr[11] := 'SKB 입사일';
      XArr[12] := '                      학력                       ';
      XArr[13] := '                입사 전 주요경력                 ';
      XArr[14] := '                  입사 후 경력                   ';
      XL.Range['A4','N4'].Value := XArr;
      XL.Range['A4','E4'].MergeCells := True ;  //셀병합
      XL.Workbooks[1].WorkSheets[1].Range['A4:N4'].HorizontalAlignment := -4108;


      //범위
      RangeStr := '';
      if (_VColTo) > 26 then
      begin
        if (_VColTo) mod 26 = 0 then
        begin
          RangeStr := RangeStr + Chr(Ord('A') - 2 + ((_VColTo) div 26));
          RangeStr := RangeStr + 'Z';
        end
        else
        begin
          RangeStr := RangeStr + Chr(Ord('A') - 1 + ((_VColTo) div 26));
          RangeStr := RangeStr + Chr(Ord('A') - 1 + ((_VColTo) mod 26));
        end;
      end
      else
      RangeStr := RangeStr + Chr(Ord('A') - 1 + (_VColTo));


      Screen.Cursor := CrHourGlass;
      PgBar.Position := 0;
      PgBar.Max := OraExcelQuery.RecordCount;

      with MOraQuery do
      begin

        SendMessage(DBGridSearch.Handle, WM_SETREDRAW, integer(False), 0);
        OraExcelQuery.first;
        for i := 1 to OraExcelQuery.RecordCount do
        begin
           Active := false;
           ParamByName('pEmpno').AsString := OraExcelQuery.FieldbyName('EMPNO').AsString;
           Active := true;
           if not MOraQuery.eof then
           begin
              XArr[01] := IntToStr(i);
              XArr[02] := '';
              XArr[03] := FieldByName('EMPNO').AsString;
              XArr[04] := FieldByName('KORNAME').AsString;
              XArr[05] := FieldByName('NPAYRA').AsString;
              XArr[06] := FieldByName('Band').AsString;
              XArr[07] := Copy(FieldByName('BIRTHDAY').AsString,1,4) + '.' +
                          Copy(FieldByName('BIRTHDAY').AsString,5,2) + '.' +
                          Copy(FieldByName('BIRTHDAY').AsString,7,2) +
                          '(' + FieldByName('KORAGE').AsString + ')';
              XArr[08] := Copy(FieldByName('BIRTHDAY').AsString,1,4) + '.' +
                          Copy(FieldByName('BIRTHDAY').AsString,5,2) + '.' +
                          Copy(FieldByName('BIRTHDAY').AsString,7,2) +
                          '(' + FieldByName('USAAGE').AsString + ')';
              XArr[09] := Copy(FieldByName('EMPDATE').AsString,1,4) + '.' +
                          Copy(FieldByName('EMPDATE').AsString,5,2) + '.' +
                          Copy(FieldByName('EMPDATE').AsString,7,2);
              if FieldByName('GROUPEMPDATE').AsString <> '' then
                XArr[10] := Copy(FieldByName('GROUPEMPDATE').AsString,1,4) + '.' +
                            Copy(FieldByName('GROUPEMPDATE').AsString,5,2) + '.' +
                            Copy(FieldByName('GROUPEMPDATE').AsString,7,2)
              else
                XArr[10] := FieldByName('GROUPEMPDATE').AsString;

              if FieldByName('ORGEMPDATE').AsString <> '' then
                XArr[11] := Copy(FieldByName('ORGEMPDATE').AsString,1,4) + '.' +
                            Copy(FieldByName('ORGEMPDATE').AsString,5,2) + '.' +
                            Copy(FieldByName('ORGEMPDATE').AsString,7,2)
              else
                XArr[11] := FieldByName('ORGEMPDATE').AsString;

              with TmpOraQuery1 do
              begin
                 Active := false;
                 ParamByName('pEmpno').AsString :=  OraExcelQuery.FieldbyName('EMPNO').AsString;
                 Active := true;
              end;

              with TmpOraQuery2 do
              begin
                 Active := false;
                 ParamByName('pEmpno').AsString :=  OraExcelQuery.FieldbyName('EMPNO').AsString;
                 Active := true;
              end;

              with TmpOraQuery3 do
              begin
                 Active := false;
                 ParamByName('pEmpno').AsString :=  OraExcelQuery.FieldbyName('EMPNO').AsString;
                 Active := true;
              end;

              with TmpOraQuery4 do
              begin
                 Active := false;
                 ParamByName('pEmpno').AsString :=  OraExcelQuery.FieldbyName('EMPNO').AsString;
                 Active := true;
              end;

              XArr[12] := '';
              while not TmpOraQuery1.eof do
              begin
                 XArr[12] := XArr[12]
                             + TmpOraQuery1.FieldByName('schnm').AsString
                             + ' ('+ Copy(TmpOraQuery1.FieldByName('schfrym').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery1.FieldByName('schfrym').AsString,5,2) + ' ~ ' +
                                     Copy(TmpOraQuery1.FieldByName('schtoym').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery1.FieldByName('schtoym').AsString,5,2) +')'+#13#10;
                 TmpOraQuery1.next;
              end;

              XArr[13] := '';
              while not TmpOraQuery2.eof do
              begin

                 XArr[13] := XArr[13]
                             + TmpOraQuery2.FieldByName('CARPLACE').AsString
                             + ' ('+ Copy(TmpOraQuery2.FieldByName('CARFRDATE').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery2.FieldByName('CARFRDATE').AsString,5,2) + '.' +
                                     Copy(TmpOraQuery2.FieldByName('CARFRDATE').AsString,7,2) + ' ~ ' +
                                     Copy(TmpOraQuery2.FieldByName('CARTODATE').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery2.FieldByName('CARTODATE').AsString,5,2) + '.' +
                                     Copy(TmpOraQuery2.FieldByName('CARTODATE').AsString,7,2) + ')'+#13#10;
                 TmpOraQuery2.next;
              end;

              XArr[14] := '';
              while not TmpOraQuery3.eof do
              begin

                 XArr[14] := XArr[14]
//                             + TmpOraQuery3.FieldByName('COMPANY').AsString
//                             +':'
                             + TmpOraQuery3.FieldByName('Ndeptcode').AsString
                             + ' ('+ Copy(TmpOraQuery3.FieldByName('ANFRDATE').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery3.FieldByName('ANFRDATE').AsString,5,2) + '.' +
                                     Copy(TmpOraQuery3.FieldByName('ANFRDATE').AsString,7,2) + ' ~ ' +
                                     Copy(TmpOraQuery3.FieldByName('ANTODATE').AsString,1,4) + '.' +
                                     Copy(TmpOraQuery3.FieldByName('ANTODATE').AsString,5,2) + '.' +
                                     Copy(TmpOraQuery3.FieldByName('ANTODATE').AsString,7,2) + ')'+#13#10;
                 TmpOraQuery3.next;
              end;
           end
           else
           begin
               XArr[01] := IntToStr(i);
               XArr[02] := '';
               XArr[03] := OraExcelQuery.FieldbyName('EMPNO').AsString;
               XArr[04] := '자료없음';
               XArr[05] := '';
               XArr[06] := '';
               XArr[07] := '';
               XArr[08] := '';
               XArr[09] := '';
               XArr[10] := '';
               XArr[11] := '';
               XArr[12] := '';
               XArr[13] := '';
               XArr[14] := '';
           end;

           XL.Range['A' + IntToStr(i+4), RangeStr + IntToStr(i+4)].Value := XArr;

           //이미지
           _JPEGLoadFromDB(TblobField(TmpOraQuery4.FieldByName('photo')), img);
           clipboard.Assign(img.Picture);

           //위치 선택
           WorkSheet.cells[i+4,2].select;
           WorkSheet.Paste;
           //선택된 이미지 위치 조정
           WorkSheet.pictures.ShapeRange.IncrementLeft(0);
           WorkSheet.pictures.ShapeRange.IncrementTop(0);
           //비율로 조정 true면 원래크기의 비율로서 조정됨 false 이면 원하는 크기로 변경가능함.
           WorkSheet.pictures.ShapeRange.LockAspectRatio := false;
           //선택된 이미지 크기 조정
           WorkSheet.pictures.width  := 35;
           WorkSheet.pictures.height := 45;
           //WorkSheet.pictures.width  := WorkSheet.cells[i+4,2].width;
           //WorkSheet.pictures.height := WorkSheet.cells[i+4,2].height;
           //위치 및 크기변함(속성)
           //WorkSheet.pictures.Placement:= 1;

           PgBar.Position := PgBar.Position + 1;
           OraExcelQuery.next;
        end;
      end;
      SendMessage(DBGridSearch.Handle, WM_SETREDRAW,integer(True), 0);
      InvalidateRect(DBGridSearch.Handle, Nil, False);

      PgBar.Position := 0;


      //셀 크기 조정
      //SUB TITLE
      //XL.Range['A4', 'M4'].Select;    //셀지정
      //XL.Selection.Columns.AutoFit;   //자동 Width
      //XL.Selection.Rows.AutoFit;      //자동 Width

      XL.Range['A4', RangeStr + IntToStr(OraExcelQuery.RecordCount-1 + 3)].Select;  //셀지정
      XL.Selection.Columns.AutoFit;            //자동 Width
      XL.Selection.Rows.AutoFit;               //자동 Height
      XL.Range['A5', 'A5'].Select;
      XL.Visible := true;

      Screen.Cursor := crDefault;

  finally
     MOraQuery.Free;
     TmpOraQuery1.free;
     TmpOraQuery2.free;
     TmpOraQuery3.free;
     TmpOraQuery4.free;
     img.Free;

     Screen.Cursor := crDefault;
  end;
end;


procedure TPIA1031a_3Form._PTmpGridValue(pi: Integer; pStr: String;
    OraQuery: TOraQuery; StringGrid: TStringGrid);
var
   TmpOraQuery1, TmpOraQuery2, TmpOraQuery3, TmpOraQuery4 : TOraQuery;

begin

   TmpOraQuery1  := TOraQuery.Create(self);
   TmpOraQuery2  := TOraQuery.Create(self);
   TmpOraQuery3  := TOraQuery.Create(self);
   TmpOraQuery4  := TOraQuery.Create(self);


   try
     TmpOraQuery1.Session := Ora_Session;
     TmpOraQuery2.Session := Ora_Session;
     TmpOraQuery3.Session := Ora_Session;
     TmpOraQuery4.Session := Ora_Session;

     with TmpOraQuery4 do
     begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.schnm , B.schfrym, B.schtoym ');
       SQL.Add('  FROM pimscho B                      ');
       SQL.Add(' WHERE B.empno = :pEmpno              ');
       SQL.Add(' ORDER BY B.schfrym DESC              ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput).Value := OraQuery.FieldByName('EMPNO').AsString;
       Active := true;
     end;

     with TmpOraQuery1 do
     begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.schnm , B.schfrym, B.schtoym ');
       SQL.Add('  FROM pimscho B                      ');
       SQL.Add(' WHERE B.empno = :pEmpno              ');
       SQL.Add(' ORDER BY B.schfrym DESC              ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput).Value := OraQuery.FieldByName('EMPNO').AsString;
       Active := true;
     end;

     with TmpOraQuery2 do
     begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.CARPLACE, B.CARFRDATE, B.CARTODATE ');
       SQL.Add('  FROM pimcarr B                            ');
       SQL.Add(' WHERE B.empno = :pEmpno                    ');
       SQL.Add(' ORDER BY B.CARFRDATE DESC                  ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput).Value := OraQuery.FieldByName('EMPNO').AsString;
       Active := true;
     end;

     with TmpOraQuery3 do
     begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT DECODE(B.COMGUBUN,1,''Dacom'', 2, ''DST'', 3, ''SKB'') COMPANY, ');
       SQL.Add('       B.ANFRDATE, B.ANTODATE,                                         ');
       SQL.Add('      (SELECT TRIM(A.deptname)                                         ');
       SQL.Add('         FROM pycdept A                                                ');
       SQL.Add('        WHERE A.orgnum   = B.orgnum                                    ');
       SQL.Add('          AND A.deptcode = B.deptcode) Ndeptcode                       ');
       SQL.Add('  FROM PIHANNO B                                                       ');
       SQL.Add(' WHERE B.empno = :pEmpno                                               ');
       SQL.Add('   AND B.ANUPDYN = ''Y''                                               ');
       SQL.Add(' ORDER BY B.ANFRDATE DESC                                              ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput).Value := OraQuery.FieldByName('EMPNO').AsString;
       Active := true;
     end;

     with TmpOraQuery4 do
     begin
       Active := false;
       SQL.Clear;
       SQL.Add('SELECT B.photo                              ');
       SQL.Add('  FROM cimphot B                            ');
       SQL.Add(' WHERE B.empno = :pEmpno                    ');
       Prepare;
       Params.Clear;
       Params.CreateParam(ftString, 'pEmpno', ptInput).Value := OraQuery.FieldByName('EMPNO').AsString;
       Active := true;
     end;

     with StringGrid, OraQuery do
     begin
       if not OraQuery.eof then
       begin
           rowcount := rowcount + 1;
           Cells[  0, rowcount -1]  := IntToStr(pi);


           if not TmpOraQuery4.eof then
           begin
              Cells[  1, rowcount -1]  := TmpOraQuery4.FieldByName('photo').AsString;
              //_JPEGLoadFromDB(TblobField(TmpOraQuery4.FieldByName('photo')), Image1);
           end;

           Cells[  2, rowcount -1]  := FieldByName('EMPNO').AsString;
           Cells[  3, rowcount -1]  := FieldByName('KORNAME').AsString;
           Cells[  4, rowcount -1]  := FieldByName('NPAYRA').AsString;
           Cells[  5, rowcount -1]  := FieldByName('Band').AsString;
           Cells[  6, rowcount -1]  := FieldByName('BIRTHDAY').AsString + '(' +
                                       FieldByName('KORAGE').AsString + ')';
           Cells[  7, rowcount -1]  := FieldByName('BIRTHDAY').AsString + '(' +
                                       FieldByName('USAAGE').AsString + ')';
           Cells[  8, rowcount -1]  := FieldByName('EMPDATE').AsString;
           Cells[  9, rowcount -1]  := FieldByName('GROUPEMPDATE').AsString;
           Cells[ 10, rowcount -1]  := FieldByName('ORGEMPDATE').AsString;

           while not TmpOraQuery1.eof do
           begin
             Cells[ 11, rowcount -1]  := Cells[ 11, rowcount -1]
                                         + TmpOraQuery1.FieldByName('schnm').AsString
                                         + '('+ TmpOraQuery1.FieldByName('schfrym').AsString +' ~ '
                                         + TmpOraQuery1.FieldByName('schtoym').AsString +')'+#13#10;
             TmpOraQuery1.next;
           end;

           while not TmpOraQuery2.eof do
           begin
             Cells[ 12, rowcount -1]  := Cells[ 12, rowcount -1]
                                         + TmpOraQuery2.FieldByName('CARPLACE').AsString
                                         + '('+ TmpOraQuery2.FieldByName('CARFRDATE').AsString +' ~ '
                                         + TmpOraQuery2.FieldByName('CARTODATE').AsString +')'+#13#10;
             TmpOraQuery2.next;
           end;

           while not TmpOraQuery3.eof do
           begin
             Cells[ 13, rowcount -1]  := Cells[ 13, rowcount -1]
//                                         + TmpOraQuery3.FieldByName('COMPANY').AsString
//                                         +':'
                                         + TmpOraQuery3.FieldByName('Ndeptcode').AsString
                                         + '('+ TmpOraQuery3.FieldByName('ANFRDATE').AsString +' ~ '
                                         + TmpOraQuery3.FieldByName('ANTODATE').AsString +')'+#13#10;
             TmpOraQuery3.next;
           end;

       end
       else
       begin
           Cells[ 0, rowcount -1] := IntToStr(pi);
           Cells[ 1, rowcount -1] := pStr;
           Cells[ 2, rowcount -1] := '자료없음';
       end;
     end;

   finally
     TmpOraQuery1.free;
     TmpOraQuery2.free;
     TmpOraQuery3.free;
     TmpOraQuery4.free;
   end;
end;

procedure TPIA1031a_3Form._PTmpGridTitle(StringGrid: TStringGrid);
begin

   with StringGrid do
   begin
      ColCount      := 14;
      RowCount      :=  4;

      ColWidths[ 0] := 50;
      ColWidths[ 1] := 50;
      ColWidths[ 2] := 50;
      ColWidths[ 3] := 50;
      ColWidths[ 4] := 50;
      ColWidths[ 5] := 50;
      ColWidths[ 6] := 50;
      ColWidths[ 7] := 50;
      ColWidths[ 8] := 50;
      ColWidths[ 9] := 50;
      ColWidths[10] := 50;
      ColWidths[11] := 50;
      ColWidths[12] := 50;
      ColWidths[13] := 50;

      Cells[  0, 1]  := '▣ Profile';

      //MergeCells(시작칼럼, 시작로우,칼럼갯수, 로우갯수);
      //MergeCells( 0, 3, 3, 0);

      //Cells[  0, 3]  := '일렬번호';
      //Cells[  1, 3]  := '사진';
      Cells[  3, 3]  := '성명';
      Cells[  4, 3]  := '직책';
      Cells[  5, 3]  := 'Band(연차)';
      Cells[  6, 3]  := '생년월일(나이)';
      Cells[  7, 3]  := '생년월일(만나이)';
      Cells[  8, 3]  := '최초 입사일';
      Cells[  9, 3]  := '그룹사 입사일';
      Cells[ 10, 3]  := 'SKB 입사일';
      Cells[ 11, 3]  := '                    학력                    ';
      Cells[ 12, 3]  := '              입사 전 주요경력              ';
      Cells[ 13, 3]  := '                 입사 후 경력                 ';
   end;
end;



procedure TPIA1031a_3Form.BB_exitClick(Sender: TObject);
begin

  ModalResult := mrCancel;
end;

procedure TPIA1031a_3Form.BitBtn1Click(Sender: TObject);
begin

   if OraExcelQuery.eof then
      OraExcelQuery.active;

   if ((length(trim(MD_empno.text)) <> 0) and (PL_nmempno.caption <> '')) then
   begin

     if (OraExcelQuery.FieldByName('EMPNO'  ).AsSTring = '') then
        OraExcelQuery.edit
     else
        OraExcelQuery.Append;

     OraExcelQuery.FieldByName('SEQ'    ).AsSTring := 'INPUT';
     OraExcelQuery.FieldByName('EMPNO'  ).AsSTring := MD_empno.text;
     OraExcelQuery.FieldByName('KORNAME').AsSTring := PL_nmempno.caption;
     OraExcelQuery.Post;

     MD_empno.text      := '';
     PL_nmempno.caption := '';
   end;
   MD_empno.setfocus;
end;

procedure TPIA1031a_3Form.BitBtn2Click(Sender: TObject);
begin

   if OraExcelQuery.eof then
      exit;
      
   OraExcelQuery.delete;
end;

procedure TPIA1031a_3Form.MD_empnoChange(Sender: TObject);
begin

   PL_nmempno.caption := '';
end;

procedure TPIA1031a_3Form.MD_empnoExit(Sender: TObject);
var
  OraSELQuery : TOraQuery;
begin

   OraSELQuery := TOraQuery.Create(self);

   try
   if (length(trim(MD_empno.text)) <> 0) then
   begin
      OraSELQuery.Session := Ora_Session;
      try
        with OraSELQuery do
        begin
           Active := false;
           SQL.Clear;
           SQL.Add('SELECT A.KORNAME        ');
           SQL.Add('  FROM PIMPMAS A        ');
           SQL.Add(' WHERE A.EMPNO = :pEMPNO');
           Prepare;
           Params.Clear;
           Params.CreateParam(ftString, 'pEMPNO', ptInput);
           ParamByName('pEMPNO').AsString := MD_empno.text;
           Active := true;

          if not OraSELQuery.eof then
          begin
             PL_nmempno.caption := FieldByName('KORNAME').AsString;
          end
          else
          begin
             MessageBox(handle,'해당 사번은 존재하지 않습니다. 확인후 작업하세요!','ERROR',MB_ICONWARNING);
             PL_nmempno.caption := '';
             MD_empno.setfocus;
          end;
      end;

      except
          on e : Exception do
          begin

          end;
      end;
     end;
   finally
      OraSELQuery.Free;
   end;
end;

procedure TPIA1031a_3Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F2  : ;
    VK_F3  : ;
    VK_F4  : ;
    VK_F5  : ;
    VK_F6  : ;
    VK_F7  : ;
    VK_F8  : ;
    VK_F9  : ;
    VK_F10 : ;
    VK_RETURN : SelectNext(ActiveControl as TWincontrol, True, True);
  end;
end;

procedure TPIA1031a_3Form.FormShow(Sender: TObject);
begin

   OraExcelQuery.Session := Ora_Session;
   OraExcelQuery.Active  := true;
end;

procedure TPIA1031a_3Form.BitBtn3Click(Sender: TObject);
begin

  if Pl_Help.Visible = true then
  begin
     Pl_Help.Visible := false;
  end
  else
  begin
     Pl_Help.Visible := true;
  end;
end;

procedure TPIA1031a_3Form.SGrid01DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   strLen  : integer;
   strSize : TSize;
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
  if (ARow > 0) and (ACol in [0]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin

      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut((Rect.Left + Rect.Right - strLen) div 2, (Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2) - 4,
               TStringGrid(Sender).Cells[ACol,ARow]);

    end;
  end;
end;

procedure TPIA1031a_3Form.FormCreate(Sender: TObject);
begin

  with SGrid01 do
  begin
     Cells[0,0] := '';
     Cells[1,0] := 'A';
     Cells[2,0] := 'B';
     Cells[1,1] := '사원번호';
     Cells[2,1] := '성명';
     Cells[0,1] := '1';
     Cells[0,2] := '2';
     Cells[0,3] := '3';
     Cells[0,4] := '4';
     Cells[1,2] := '8888';
     Cells[2,2] := '김길순';
     Cells[1,3] := '9999';
     Cells[2,3] := '김길동';
  end;
end;

end.
