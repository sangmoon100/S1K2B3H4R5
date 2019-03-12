unit PSC10802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, OraSmart, ExtCtrls, Mask, Func, JPEG,
  OnFocusButton, OnEditBtnCtrl, OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl,
  ComCtrls;

type
  TFmImageSave = class(TForm)
    OraSession1: TOraSession;
    OraTable1: TOraTable;
    OraTable1EMPNO: TStringField;
    OraTable1SEQ: TIntegerField;
    OraTable1GUBUN: TStringField;
    OraTable1PHOTO: TBlobField;
    OraTable1WRITETIME: TStringField;
    OraTable1WRITEEMP: TStringField;
    OraTable1ROWID: TStringField;
    Panel1: TPanel;
    FileOpen: TSpeedButton;
    Label3: TLabel;
    Panel3: TPanel;
    pimg1: TImage;
    label1: TLabel;
    Panel6: TPanel;
    pImg2: TImage;
    Label2: TLabel;
    EdAppdate: TOnMaskEdit;
    EdSeq: TOnEdit;
    EdKorname: TOnEdit;
    EdEmpno: TOnEdit;
    CbGubun: TOnComboEdit;
    Filenm: TOnEdit;
    StatusBar1: TStatusBar;
    BT_Save: TOnFocusButton;
    BB_Close: TOnFocusButton;
    OpenDialog1: TOpenDialog;
    procedure FileOpenClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImageFind;
  end;

var
  FmImageSave: TFmImageSave;

implementation

uses PSC10801, PSC10803;

{$R *.DFM}

procedure TFmImageSave.FileOpenClick(Sender: TObject);
begin
     //이미지파일 업로드시에...
{     FileListForm := TFileListForm.Create(self);
     Try
          FileListForm.ShowModal;
          if FileExists(Filenm.Text) = True then pimg1.Picture.LoadFromFile(Filenm.Text);
     Finally
          FileListForm.Free;
     End; }

     
     if OpenDialog1.Execute then
          Filenm.Text := OpenDialog1.FileName;
end;

procedure TFmImageSave.FormActivate(Sender: TObject);
begin
     EdEmpno.Text    := FM_Main.TMaxDataSet2.FieldByName('empno'  ).AsString;
     EdKorname.Text  := FM_Main.TMaxDataSet2.FieldByName('korname').AsString;
     EdSeq.Text      := IntToStr(FM_Main.TMaxDataSet2.FieldByName('seq').AsInteger);
     EdAppdate.Text  := FM_Main.TMaxDataSet2.FieldByName('appdate').AsString;

     OraConnect;

     ImageFind;
     Filenm.SetFocus;
end;

procedure TFmImageSave.ImageFind;
var
     stream : TMemoryStream;
     //JPEGImage : TJPEGImage;
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select photo            ');
               SQL.Add('  from Pstock_image     ');
               SQL.Add(' where empno  = :empno  ');
               SQL.Add('   and seq    = :seq    ');
               SQL.Add('   and gubun  = :gubun  ');
 
               ParamByName('empno'   ).AsString  := FM_Main.TMaxDataSet2.FieldByName('empno'   ).AsString;
               ParamByName('seq'     ).AsInteger := FM_Main.TMaxDataSet2.FieldByName('seq'     ).AsInteger;
               ParamByName('gubun'   ).AsString  := FloatToStr(CbGubun.ItemIndex);
               Open;

               try
                    stream := TMemoryStream.Create;
                    //JPEGImage := TJPEGImage.Create;

                    //pimg2.picture.Graphic := nil;

                    TblobField(qq.FieldByName('photo')).SaveToStream(stream);
                    stream.Position := 0;

                    //JPEGImage.LoadFromStream(stream);
                    //if stream.Size <> 0 then pimg2.picture.Assign(JPEGImage);
               finally
                    stream.free;
                    //JPEGImage.Free;
               end;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFmImageSave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Ora_Session.Disconnect;
     Action := caFree;
end;

procedure TFmImageSave.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFmImageSave.BT_SaveClick(Sender: TObject);
var
     RecCnt : integer;
     MemoryStream : TMemoryStream;
begin
     StatusBar1.Panels[1].Text := '해당 서류를 저장합니다 !!.';

     OraTable1.Session := Ora_Session;
     OraTable1.Open;

     if FM_Main.vSelect = 0 then
     begin
          OraTable1.Insert;
          OraTable1.FieldByName('empno'    ).AsString := EdEmpno.Text;
          OraTable1.FieldByName('seq'      ).AsFloat  := StrToFloat(EdSeq.Text);
          OraTable1.FieldByName('gubun'    ).AsString := FloatToStr(CbGubun.ItemIndex);
          MemoryStream := TMemoryStream.Create;
          MemoryStream.LoadFromFile(Filenm.Text);
          TblobField(OraTable1.FieldByName('photo')).LoadFromStream(MemoryStream);
          OraTable1.FieldByName('writetime').AsString := Fn_GetDateTimeStr;
          OraTable1.FieldByName('writeemp' ).AsString := Pempno;
          OraTable1.Post;
          MemoryStream.Free;
     end
     else
     begin
          if OraTable1.Locate('empno; seq; gubun',
                    VarArrayOf([EdEmpno.Text,StrToFloat(EdSeq.Text),FloatToStr(CbGubun.ItemIndex)]),[loCaseInsensitive]) = True then
          begin
               OraTable1.Edit;
               MemoryStream := TMemoryStream.Create;
               MemoryStream.LoadFromFile(Filenm.Text);

               TblobField(OraTable1.FieldByName('photo')).LoadFromStream(MemoryStream);
               OraTable1.FieldByName('writetime').AsString := Fn_GetDateTimeStr;
               OraTable1.FieldByName('writeemp').AsString  := Pempno;
               OraTable1.Post;
               MemoryStream.Free;
          end;
     end;
     ImageFind;
     OraTable1.Close;
     StatusBar1.Panels[1].Text := '저장 완료.';
end;

end.
