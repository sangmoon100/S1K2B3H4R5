{* ======================= Program Header ======================================
 PROGRAM-NAME   : PSH1030A(복리후생 신청 체육활동지원 첨부파일 등록)
 SYSTEM-NAME    : 복리후생 / 체육활동지원금
 SUBSYSTEM-NAME :
 Programmer     : 이희용
 Version        : 1.00
 Date           : 2015.12.08

Update Contents
   Version    date(yy.mm.dd)     programmer      description
    1.1       2015.12.08         이희용          메일전송자 : 김진흥
============================================================================= *}

unit PSH1030A6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, Pass, Func, Menus, Comobj,
  ComCtrls, jpeg, ExtCtrls, OnFocusButton, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPersonEdit, OnPopupEdit, OnShapeLabel, OnEditMdate, Mask,
  Grids, DBGrids, OnGrDBGrid, OraSmart, datelib, FileCtrl, OleCtrls, shellapi,
  GR32, GR32_Image, GR32_Layers, GR32_RangeBars, GR32_Filters, GR32_Transforms,
  AcroPDFLib_TLB, Registry, Tmax_DataSetText, OnTmaxPersonEdit, OnEditMemo, Tmax_session,
  OnLineLabel;


type
  TFM_Photo = class(TForm)
    SF_Main: TOnSchemeForm;
    OraTable1: TOraTable;
    OraQuery_dml: TOraQuery;
    OraTable1APPDATE: TStringField;
    OraTable1EMPNO: TStringField;
    OraTable1PHOTO: TBlobField;
    OraTable1FTYPE: TStringField;
    OraTable1WRITEMAN: TStringField;
    OraTable1WRITETIME: TStringField;
    OraTable1SEQ: TFloatField;
    OraTable1SSEQ: TFloatField;
    OraTable1FNAME: TStringField;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    Panel5: TPanel;
    IDI_Preview: TImgView32;
    Panel1: TPanel;
    Label2: TLabel;
    ScaleCombo: TComboBox;
    IDL_Directory: TDirectoryListBox;
    IDC_Drive: TDriveComboBox;
    SB_Help: TStatusBar;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    fb_close: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    Panel7: TPanel;
    Label3: TLabel;
    Lempno: TLabel;
    IDL_Filenames: TFileListBox;
    TDS_SEL: TTMaxDataSet;
    DataSource1: TDataSource;
    Btn_Save: TOnFocusButton;
    Grid2: TStringGrid;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    Shape2: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Btn_Del: TOnFocusButton;
    DirList: TLabel;
    TDS_DML: TTMaxDataSet;
    procedure IDL_FilenamesClick(Sender: TObject);
    procedure fb_closeClick(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScaleComboChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenDialog1FolderChange(Sender: TObject);
    procedure FB_FileClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Grid2Click(Sender: TObject);
    procedure Btn_DelClick(Sender: TObject);
  private
    procedure UpLoadList;
  public
    e_seq    : integer;  //일련번호
    F_Name   : String;   //파일명
    F_Format : String;   //파일확장자
    vAPPDATE, vEMPNO, vSEQ, vSSEQ : String;

    function  Data_Check : boolean;
  end;

var
  FM_Photo: TFM_Photo;

implementation
uses PSH1030A1, PSH1030A3;
{$R *.DFM}

procedure TFM_Photo.FormShow(Sender: TObject);
var
  MyReg : TRegIniFile;
begin
  MyReg := TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
  IDL_Directory.Directory :=  MyReg.ReadString('Shell Folders','Desktop','');
  DirList.Caption := IDL_Directory.Directory;
  Lempno.Caption := FM_Sports.L_AppEmpno.ValueCaption;

  IDL_Filenames.Refresh;
  UpLoadList;
end;

procedure TFM_Photo.IDL_FilenamesClick(Sender: TObject);
var MemoryStream : TMemoryStream;
begin
  SB_Help.Panels[1].Text := '';
  //파일명
  F_Name := ExtractFileName(IDL_Filenames.FileName);
  //파일포멧
  F_Format := ExtractFileExt(IDL_Filenames.FileName);
  F_Format := LowerCase(RemoveChar(F_Format,'.'));

  IDI_Preview.Refresh;
  IDI_Preview.Bitmap.LoadFromFile(IDL_Filenames.FileName);
  Btn_Save.Enabled := True;
  ScaleCombo.SetFocus;
end;

procedure TFM_Photo.Btn_SaveClick(Sender: TObject);
var
  MemoryStream : TMemoryStream;
  F_SEQ : Integer;
begin
  if IDL_Filenames.FileName = '' then
  begin
    MessageDlg('선택된 자료가 없습니다.' ,mtError, [mbOK], 0);
    Exit;
  end;

  MemoryStream := TMemoryStream.Create;
  MemoryStream.LoadFromFile(IDL_Filenames.FileName);

  If not (Data_Check) Then Exit;

  if  MessageBox(handle,'선택한 사진으로 UpLoad하시겠습니까?','확 인',MB_YESNO or $0020) = ID_NO then
  begin
    system.Exit;
  end;

  if(MemoryStream.Size > 5000000) then
  begin
    MemoryStream.Free;
    MessageDlg('파일 사이즈는 5M를 넘을수 없습니다.' ,mtError, [mbOK], 0);
    IDL_Filenames.SetFocus;
    Exit;
  end;

  If (FM_Sports.E_Seq.Text = '') Then
    F_SEQ := 1
  Else
    F_SEQ := StrToInt(FM_Sports.E_Seq.Text);
  OraTable1.Open;
  with OraQuery_dml do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT NVL(MAX(SSEQ),0)+1 SSEQ FROM PSHPHOT    ');
    Sql.Add(' WHERE APPDATE = ''' +FM_Sports.FL_Appdate+ ''' ');
    Sql.Add('   AND EMPNO   = ''' +FM_Sports.FL_AppEmp+  ''' ');
    Sql.Add('   AND SEQ     = ''' +FM_Sports.E_Seq.Text+ ''' ');
    Open;
    e_seq := OraQuery_dml.FieldByName('SSEQ').AsInteger;
  End;

  OraTable1.Insert;
  OraTable1.FieldByName('APPDATE').AsString   := FM_Sports.FL_Appdate;
  OraTable1.FieldByName('EMPNO').AsString     := FM_Sports.FL_AppEmp;
  OraTable1.FieldByName('SEQ').AsInteger      := F_SEQ;
  OraTable1.FieldByName('SSEQ').AsInteger     := e_seq;
  OraTable1.FieldByName('FNAME').AsString     := F_Name;
  OraTable1.FieldByName('FTYPE').AsString     := F_Format;
  TblobField(OraTable1.FieldByName('PHOTO')).LoadFromStream(MemoryStream);
  OraTable1.FieldByName('WRITEMAN').AsString  := Pempno;
  OraTable1.FieldByName('WRITETIME').AsString := Fn_GetDateTimeStr;
  OraTable1.Post;
  MemoryStream.Free;
  MessageDlg('등록 되었습니다.', mtInformation,[mbOK],0);
  SB_Help.Panels[1].Text := '등록 되었습니다.';

  UpLoadList;
end;

function TFM_Photo.Data_Check: boolean;
Begin
  Result := False;

  with OraQuery_dml do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT COUNT(*) CNT FROM PSHPHOT    ');
    Sql.Add(' WHERE APPDATE = ''' +FM_Sports.FL_Appdate+ ''' ');
    Sql.Add('   AND EMPNO   = ''' +FM_Sports.FL_AppEmp+  ''' ');
    Sql.Add('   AND SEQ     = ''' +FM_Sports.E_Seq.Text+ ''' ');
    Open;

    if Fieldbyname('CNT').Asinteger >= 3 then
    begin
      MessageDlg('첨부파일 첨부는 최대 3개 입니다.' + #13#13#10 +
                 '등록할 수 없습니다.',mtinformation,[mbOK],0);
      exit;
    end;
  End;

  Result := True;
End;

procedure TFM_Photo.UpLoadList;
var
  i : integer;
Begin
  Grid2.Cells[0,0]  := ' 파 일 명';

  Grid2.ColWidths[0] := 274;
  Grid2.ColWidths[1] := -1;
  Grid2.ColWidths[2] := -1;
  Grid2.ColWidths[3] := -1;
  Grid2.ColWidths[4] := -1;

  with TDS_SEL do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('SELECT APPDATE, EMPNO, SEQ, SSEQ, FNAME         ');
    Sql.Add('  FROM PSHPHOT                                  ');
    Sql.Add(' WHERE APPDATE = ''' +FM_Sports.FL_Appdate+ ''' ');
    Sql.Add('   AND EMPNO   = ''' +FM_Sports.FL_AppEmp+  ''' ');
    Sql.Add('   AND SEQ     = ''' +FM_Sports.E_Seq.Text+ ''' ');
    ClearFieldInfo;

    AddField('APPDATE', ftString, 100);
    AddField('EMPNO'  , ftString, 100);
    AddField('SEQ'    , ftString, 100);
    AddField('SSEQ'   , ftString, 100);
    AddField('FNAME'  , ftString, 100);

    Open;

    if RecordCount > 0 then
    begin
      Grid2.RowCount := RecordCount +1;
      for i := 1 to Grid2.RowCount do
      begin
        Grid2.Cells[0, i] :=  TDS_SEL.fieldbyname('FNAME').AsString;
        Grid2.Cells[1, i] :=  TDS_SEL.fieldbyname('APPDATE').AsString;
        Grid2.Cells[2, i] :=  TDS_SEL.fieldbyname('EMPNO').AsString;
        Grid2.Cells[3, i] :=  TDS_SEL.fieldbyname('SEQ').AsString;
        Grid2.Cells[4, i] :=  TDS_SEL.fieldbyname('SSEQ').AsString;
        next;
      end;
      Btn_Del.Enabled := True;
      Grid2.Visible   := True;
    End
    Else
    Begin
      Btn_Del.Enabled := False;
      Grid2.Visible   := False;
    End;
  end;
End;

procedure TFM_Photo.DBGrid1CellClick(Column: TColumn);
var
  rect : TRect;
  i : Integer;

  iJPG     : TJPEGImage;
  iBMP     : TBitmap;
  stream   : TMemoryStream;
begin
  iJPG   := TJPEGImage.Create;
  iBMP   := TBitmap.Create;
  stream := TMemoryStream.Create;
  rect   := IDI_Preview.Canvas.ClipRect;

  with OraQuery_dml do
  begin
    Close;
    SQL.Clear;

    Sql.Add('SELECT PHOTO, UPPER(FTYPE) FTYPE FROM PSHPHOT                      ');
    Sql.Add(' WHERE APPDATE = ''' +TDS_SEL.FieldByName('APPDATE').AsString+ ''' ');
    Sql.Add('   AND EMPNO   = ''' +TDS_SEL.FieldByName('EMPNO').AsString+  '''  ');
    Sql.Add('   AND SEQ     = ''' +TDS_SEL.FieldByName('SEQ').AsString+ '''     ');
    Sql.Add('   AND SSEQ    = ''' +TDS_SEL.FieldByName('SSEQ').AsString+ '''    ');
    Open;

    TBLOBField(FieldByName('photo')).SaveToStream(stream);
    stream.Position := 0;

    if   Stream.Size = 0 then IDI_Preview.Visible := False
    else if Stream.Size <> 0 then
    begin
      IDI_Preview.Visible := True;
      if FieldByName('FTYPE').AsString = 'JPG' Then
      Begin
        iJPG.LoadFromStream(stream);
        IDI_Preview.Canvas.StretchDraw(rect,iJPG);
      End
      Else
      Begin
        iBMP.LoadFromStream(stream);
        IDI_Preview.Canvas.StretchDraw(rect,iBMP);
      End;
    end;
  end;
end;

procedure TFM_Photo.ScaleComboChange(Sender: TObject);
var
  S: string;
  I: Integer;
begin
  S := ScaleCombo.Text;
  S := StringReplace(S, '%', '', [rfReplaceAll]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);
  if S = '' then Exit;
  I := StrToIntDef(S, -1);
  if (I < 1) or (I > 2000) then I := Round(IDI_Preview.Scale * 100)
  else IDI_Preview.Scale := I / 100;
  ScaleCombo.Text := IntToStr(I) + '%';
  ScaleCombo.SelStart := Length(ScaleCombo.Text) - 1;
end;

procedure TFM_Photo.OpenDialog1FolderChange(Sender: TObject);
begin
  DirList.Caption := OpenDialog1.FileName;
end;

procedure TFM_Photo.FB_FileClick(Sender: TObject);
begin
  if   OpenDialog1.Execute then
  Begin
    IDL_Directory.Directory := OpenDialog1.FileName;
    IDI_Preview.Refresh;
    IDI_Preview.Bitmap.LoadFromFile(OpenDialog1.FileName);
  End
  else Exit;
end;

procedure TFM_Photo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Photo.fb_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFM_Photo.Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
  arect: TRect;
begin
  with Grid2.Canvas do
  begin
    if (ARow = 0) then Font.Style := [fsBold]
    else               Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 4;

    Loc := DT_CENTER;
    DrawText(Handle, PChar(Grid2.Cells[ACol, ARow]), -1, Rect, Loc);
  end;
end;

procedure TFM_Photo.Grid2Click(Sender: TObject);
var
  rect   : TRect;
  i      : Integer;
  pt     : TPoint;
  ACol,ARow: Integer;
  iJPG   : TJPEGImage;
  iBMP   : TBitmap;
  stream : TMemoryStream;
begin
  pt := Mouse.CursorPos;
  pt := Grid2.ScreenToClient(pt);
  Grid2.MouseToCell(pt.x,pt.y,ACol,ARow);

  iJPG   := TJPEGImage.Create;
  iBMP   := TBitmap.Create;
  stream := TMemoryStream.Create;
  rect   := IDI_Preview.Canvas.ClipRect;

  with Grid2 do
  Begin
    vAPPDATE := Cells[1 ,Row];
    vEMPNO   := Cells[2 ,Row];
    vSEQ     := Cells[3 ,Row];
    vSSEQ    := Cells[4 ,Row];
  End;

  with OraQuery_dml do
  begin
    Close;
    SQL.Clear;

    Sql.Add('SELECT PHOTO, UPPER(FTYPE) FTYPE FROM PSHPHOT ');
    Sql.Add(' WHERE APPDATE = ''' +vAPPDATE+ '''');
    Sql.Add('   AND EMPNO   = ''' +vEMPNO  + '''');
    Sql.Add('   AND SEQ     = ''' +vSEQ    + '''');
    Sql.Add('   AND SSEQ    = ''' +vSSEQ   + '''');
    Open;

    TBLOBField(FieldByName('photo')).SaveToStream(stream);
    stream.Position := 0;

    if   Stream.Size = 0 then IDI_Preview.Visible := False
    else if Stream.Size <> 0 then
    begin
      IDI_Preview.Visible := True;
      if FieldByName('FTYPE').AsString = 'BMP' Then
      Begin
        iBMP.LoadFromStream(stream);
        IDI_Preview.Canvas.StretchDraw(rect,iBMP);
      End
      Else
      Begin
        iJPG.LoadFromStream(stream);
        IDI_Preview.Canvas.StretchDraw(rect,iJPG);
      End;
    end;
  end;
end;

procedure TFM_Photo.Btn_DelClick(Sender: TObject);
var
  SQLStr : String;
begin
  if TDS_SEL.RecordCount = 0 Then
  begin
    MessageDlg('삭제할 데이터가 없습니다.',mtError, [mbOk],0);
    System.Exit;
  end;

  SQLStr := ' DELETE FROM PSHPHOT                ' +
            ' WHERE APPDATE = ''' +vAPPDATE+ ''' ' +
            '   AND EMPNO   = ''' +vEMPNO  + ''' ' +
            '   AND SEQ     = ''' +vSEQ    + ''' ' +
            '   AND SSEQ    = ''' +vSSEQ   + ''' ' ;

  TDS_DML.Sql.Clear;
  TDS_DML.Sql.Add(SQLStr);

  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then System.Exit;

  if not TDS_DML.Execute then
  begin
    MessageDlg('삭제에 실패했습니다.',mtError, [mbOk],0);
    System.Exit;
  end
  Else
  Begin
    IDI_Preview.Refresh;
    MessageDlg('삭제 되었습니다.', mtInformation,[mbOK],0);
    SB_Help.Panels[1].Text := '삭제되었습니다.';
  End;

  UpLoadList;
end;

end.


