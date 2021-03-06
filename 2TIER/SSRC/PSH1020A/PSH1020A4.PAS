unit PSH1020A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, JPeg, ExtDlgs, StdCtrls, GR32, GR32_Image, GR32_Layers,
  GR32_RangeBars, GR32_Filters, GR32_Transforms, FileCtrl, OnEditBaseCtrl,
  OnEditStdCtrl, OnScheme, OleCtrls,  Ora, Db, MemDS,
  DBAccess, OraSmart, Func, OnFocusButton, Math, OnRegistry, ComCtrls;

type
  TFM_Viewer32 = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    Panel2: TPanel;
    PT_form: TPanel;
    SidePanel: TPanel;
    Panel1: TPanel;
    OnEdit1: TOnEdit;
    IDC_Drive: TDriveComboBox;
    OnEdit2: TOnEdit;
    IDL_Directory: TDirectoryListBox;
    IDL_Filenames: TFileListBox;
    OraTable1: TOraTable;
    OraTable1APPDATE: TStringField;
    OraTable1EMPNO: TStringField;
    OraTable1SEQ: TFloatField;
    OraTable1SSEQ: TFloatField;
    OraTable1PHOTO: TBlobField;
    OraTable1FTYPE: TStringField;
    OraTable1WRITEMAN: TStringField;
    OraTable1WRITETIME: TStringField;
    OraQuery_dml: TOraQuery;
    OraQuery1: TOraQuery;
    pt_view: TPanel;
    PT_jpg: TPanel;
    pnlImage: TPanel;
    Label2: TLabel;
    ScaleCombo: TComboBox;
    ImageInterpolate: TCheckBox;
    fb_close: TOnFocusButton;
    ImgView: TImgView32;
    SB_Help: TStatusBar;
    Panel3: TPanel;
    Label3: TLabel;
    procedure ScaleComboChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImageInterpolateClick(Sender: TObject);
    procedure ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure ImgViewPaintStage(Sender: TObject; Buffer: TBitmap32;
      StageNum: Cardinal);
    procedure ImgViewMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ImgViewMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure IDL_FilenamesClick(Sender: TObject);
    function MasFind(const Str : string) : integer;
    procedure FormShow(Sender: TObject);
    procedure fb_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSelection: TPositionedLayer;
    procedure SetSelection(Value: TPositionedLayer);
  protected
    RBLayer: TRubberbandLayer;
    procedure LayerMouseDown(Sender: TObject; Buttons: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RBResizing(Sender: TObject; const OldLocation: TFloatRect; var NewLocation: TFloatRect; DragState: TDragState; Shift: TShiftState);
    procedure PaintMagnifierHandler(Sender: TObject; Buffer: TBitmap32);
    procedure PaintSimpleDrawingHandler(Sender: TObject; Buffer: TBitmap32);
  public
    property Selection: TPositionedLayer read FSelection write SetSelection;
  end;
var
  FM_Viewer32: TFM_Viewer32;
  e_seq  : integer;  //일련번호
  F_name : String;   //파일확장자
  sAppdate, sEmpno, sSeq : String;

  implementation

uses PSH1020A1;

{$R *.DFM}

{ TForm1 }

procedure TFM_Viewer32.FormShow(Sender: TObject);
begin
  sAppdate := FM_Mainform.Ora_Sql2.FieldByName('appdate').AsString;
  sEmpno   := FM_Mainform.Ora_Sql2.FieldByName('empno').AsString;
  sSeq     := FM_Mainform.Ora_Sql2.FieldByName('seq').AsString;

  MasFind(sEmpno);

  IDC_Drive.Drive := 'C';
  IDL_Directory.Directory :='C:\insa\FilePhoto';
  IDL_Filenames.Refresh;
  IDL_Filenames.ItemIndex := 0;
  IDL_FilenamesClick(Nil);
end;

procedure TFM_Viewer32.FormDestroy(Sender: TObject);
begin
  Selection := nil;
  RBLayer := nil;
end;

procedure TFM_Viewer32.ImageInterpolateClick(Sender: TObject);
const
  STRETCH_FILTER: array [Boolean] of TStretchFilter = (sfNearest, sfLinear);
begin
  ImgView.Bitmap.StretchFilter := STRETCH_FILTER[ImageInterpolate.Checked];
end;

procedure TFM_Viewer32.LayerMouseDown(Sender: TObject; Buttons: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender <> nil then Selection := TPositionedLayer(Sender);
end;

procedure TFM_Viewer32.PaintMagnifierHandler(Sender: TObject; Buffer: TBitmap32);
var
  Magnification, Rotation: Single;
  SrcRect, DstRect: TFloatRect;
  R: TRect;
  T: TAffineTransformation;
  B: TBitmap32;
  W2, H2: Single;
  I: Integer;
begin
  if Sender is TPositionedLayer then
    with TPositionedLayer(Sender) do
    begin
      DstRect := GetAdjustedLocation;
      R := MakeRect(DstRect);
      B := TBitmap32.Create;
      try
        with R do
        begin
          B.SetSize(Right - Left, Bottom - Top);
          W2 := (Right - Left) / 2;
          H2 := (Bottom - Top) / 2;
        end;

        SrcRect := DstRect;
        with SrcRect do
        begin
          Left := Left - H2;
          Right := Right + H2;
          Top := Top - W2;
          Bottom := Bottom + W2;
        end;

        T := TAffineTransformation.Create;
        try
          T.SrcRect := SrcRect;
          T.Translate(-R.Left, -R.Top);

          T.Translate(-W2, -H2);
          T.Scale(Magnification, Magnification);
          T.Rotate(0, 0, Rotation);
          T.Translate(W2, H2);
          Transform(B, Buffer, T);
          B.ResetAlpha;
          B.DrawMode := dmBlend;
          B.DrawTo(Buffer, R);

          // draw frame
          for I := 0 to 4 do
          begin
             with R do Buffer.RaiseRectTS(Left, Top, Right, Bottom, 35 - I * 8);
             InflateRect(R, -1, -1);
          end;
        finally
          T.Free;
        end;
      finally
        B.Free;
      end;
    end;
end;


procedure TFM_Viewer32.PaintSimpleDrawingHandler(Sender: TObject; Buffer: TBitmap32);
var
  Cx, Cy: Single;
  W2, H2: Single;
  I: Integer;
begin
  if Sender is TPositionedLayer then
    with TPositionedLayer(Sender).GetAdjustedLocation do
    begin
      W2 := (Right - Left) / 2;
      H2 := (Bottom - Top) / 2;
      Cx := Left + W2;
      Cy := Top + H2;
      Buffer.PenColor := clRed32;
      Buffer.MoveToF(Cx,Cy);
      for I := 0 to 240 do
      begin
        Buffer.LineToFS(Cx + W2 * I / 200 * Cos(I / 8), Cy + H2 * I / 200 * Sin(I / 8));
      end;
    end;
end;

procedure TFM_Viewer32.ScaleComboChange(Sender: TObject);
var
  S: string;
  I: Integer;
begin
  S := ScaleCombo.Text;
  S := StringReplace(S, '%', '', [rfReplaceAll]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);
  if S = '' then Exit;
  I := StrToIntDef(S, -1);
  if (I < 1) or (I > 2000) then I := Round(ImgView.Scale * 100)
  else ImgView.Scale := I / 100;
  ScaleCombo.Text := IntToStr(I) + '%';
  ScaleCombo.SelStart := Length(ScaleCombo.Text) - 1;
end;

procedure TFM_Viewer32.SetSelection(Value: TPositionedLayer);
begin
  if Value <> FSelection then
  begin
    if RBLayer <> nil then
    begin
      RBLayer.ChildLayer := nil;
      RBLayer.LayerOptions := LOB_NO_UPDATE;
      ImgView.Invalidate;
    end;

    FSelection := Value;

    if Value <> nil then
    begin
      if RBLayer = nil then
      begin
        RBLayer := TRubberBandLayer.Create(ImgView.Layers);
        RBLayer.MinHeight := 1;
        RBLayer.MinWidth := 1;
      end
      else RBLayer.BringToFront;
      RBLayer.ChildLayer := Value;
      RBLayer.LayerOptions := LOB_VISIBLE or LOB_MOUSE_EVENTS or LOB_NO_UPDATE;
      RBLayer.OnResizing := RBResizing;
    end;
  end;
end;

procedure TFM_Viewer32.ImgViewPaintStage(Sender: TObject; Buffer: TBitmap32;
  StageNum: Cardinal);
const
  Colors: array [Boolean] of TColor32 = ($FFFFFFFF, $FFB0B0B0);
var
  I, J: Integer;
  P: PColor32;
  OddY: Integer;
begin
  with ImgView.Buffer do
  begin
    Clear;
    P := PixelPtr[0, 0];
    for J := 0 to Height - 1 do
    begin
      OddY := (J shr 3) and $1;
      for I := 0 to Width - 1 do
      begin
        P^ := Colors[(I shr 3) and $1 = OddY];
        Inc(P);
      end;
    end;
  end;
end;

procedure TFM_Viewer32.RBResizing(Sender: TObject;
  const OldLocation: TFloatRect; var NewLocation: TFloatRect;
  DragState: TDragState; Shift: TShiftState);
var
  w, h, cx, cy: Single;
  nw, nh: Single;

begin
  if DragState = dsMove then Exit; // we are interested only in scale operations
  if Shift = [] then Exit; // special processing is not required

  if ssCtrl in Shift then
  begin
    { make changes symmetrical }

    with OldLocation do
    begin
      cx := (Left + Right) / 2;
      cy := (Top + Bottom) / 2;
      w := Right - Left;
      h := Bottom - Top;
    end;

    with NewLocation do
    begin
      nw := w / 2;
      nh := h / 2;
      case DragState of
        dsSizeL: nw := cx - Left;
        dsSizeT: nh := cy - Top;
        dsSizeR: nw := Right - cx;
        dsSizeB: nh := Bottom - cy;
        dsSizeTL: begin nw := cx - Left; nh := cy - Top; end;
        dsSizeTR: begin nw := Right - cx; nh := cy - Top; end;
        dsSizeBL: begin nw := cx - Left; nh := Bottom - cy; end;
        dsSizeBR: begin nw := Right - cx; nh := Bottom - cy; end;
      end;
      if nw < 2 then nw := 2;
      if nh < 2 then nh := 2;

      Left := cx - nw;
      Right := cx + nw;
      Top := cy - nh;
      Bottom := cy + nh;
    end;
  end;
end;

procedure TFM_Viewer32.ImgViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if Layer = nil then
  begin
    Selection := nil;
    ReleaseCapture;
  end;
end;

procedure TFM_Viewer32.ImgViewMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  s: Single;
begin
  s := ImgView.Scale / 1.1;
  if s < 0.2 then s := 0.2;
  ImgView.Scale := s;
  ScaleCombo.Text := IntToStr(Round(s * 100)) + '%';
end;

procedure TFM_Viewer32.ImgViewMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  s: Single;
begin
  s := ImgView.Scale * 1.1;
  if s > 20 then s := 20;
  ImgView.Scale := s;
  ScaleCombo.Text := IntToStr(Round(s * 100)) + '%';
end;

procedure TFM_Viewer32.IDL_FilenamesClick(Sender: TObject);
var MemoryStream : TMemoryStream;
begin
  F_name := ExtractFileExt(IDL_Filenames.FileName);
  F_name := LowerCase(RemoveChar(F_name,'.'));

  ImgView.Refresh;
  ImgView.Bitmap.LoadFromFile(IDL_Filenames.FileName);
  IDL_Filenames.SetFocus;
end;

function TFM_Viewer32.MasFind(const Str : string) : integer;
var
  stream : TMemoryStream;
  JPEGImage : TJPEGImage;
  vFileDir, vFileName : String;
  i : Integer;
begin
  vFileDir := 'C:\insa\FilePhoto';
  if not DirectoryExists(vFileDir) then CreateDir(vFileDir);
  DeleteFiles(vFileDir+'\*.*');
  OraTable1.Open;
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT (SELECT KORNAME||''(''||EMPNO||'')'' FROM PIMPMAS WHERE EMPNO = A.EMPNO) KORNAME, ');
    Sql.Add('         FTYPE, PHOTO FROM PSHPHOT A              ');
    Sql.Add(' WHERE A.APPDATE = ''' +sAppdate+ ''' ');
    Sql.Add('   AND A.EMPNO   = ''' +sEmpno+  ''' ');
    Sql.Add('   AND A.SEQ     = ''' +sSeq+ ''' ');
    Open;

    first;
    for i := 1 to  OraQuery1.RecordCount do
    begin
      try
        stream    := TMemoryStream.Create;
        TblobField(OraQuery1.FieldByName('PHOTO')).SaveToStream(stream);
        stream.Position := 0;
        // 생성 파일명 : 이명노(2684)_1_20151208.jpg, 이명노(2684)_2_20151208.pdf...)
        vFileName := Fieldbyname('KORNAME').AsString + '_' + IntToStr(i)+ '.'+ Fieldbyname('FTYPE').AsString;
        TBlobField(FieldByName('PHOTO')).SaveToFile(vFileDir +'\'+ vFileName);
      finally
        stream.free;
      end;
      next;
    end;
  end;
  //Directory Refresh 기능이 되지않을 경우. 2015.12.08 HeeYong(Feat. hjku)
  IDL_Directory.FileList := nil;
  IDL_Filenames.Directory := '.';
  IDL_Directory.FileList := IDL_Filenames;
end;

procedure TFM_Viewer32.fb_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFM_Viewer32.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Ora_Session.Connected := False;
  Action := CaFree;
end;

end.
